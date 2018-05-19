// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hwint_updtate_1_rand_21_s1.s
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
   random seed:	920329218
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

	setx 0x8cb5fc53e62e08e3, %g1, %g0
	setx 0xebf903d5e537e76c, %g1, %g1
	setx 0xfbaf5feea7c631b3, %g1, %g2
	setx 0xe011ecbdbe297b75, %g1, %g3
	setx 0xad932dbc79fcabdf, %g1, %g4
	setx 0xfe382c4b01a5165b, %g1, %g5
	setx 0x953e536e3b91c26b, %g1, %g6
	setx 0xc621cb9cc9a4e517, %g1, %g7
	setx 0xa9a292511a1d14b7, %g1, %r16
	setx 0x4366a7b80a71b56d, %g1, %r17
	setx 0x0a4d6ecb44c99bf8, %g1, %r18
	setx 0xf2d59881a716fc3a, %g1, %r19
	setx 0x8692a0ff7febd298, %g1, %r20
	setx 0x21780491019ac708, %g1, %r21
	setx 0xb5533ab58a2f8978, %g1, %r22
	setx 0xdfcf8c50376e9860, %g1, %r23
	setx 0x6885750a4940d345, %g1, %r24
	setx 0xcb38b13651a3dfbe, %g1, %r25
	setx 0x2223d860c948ce74, %g1, %r26
	setx 0xc85e364b81ac627f, %g1, %r27
	setx 0x6349c62a552867eb, %g1, %r28
	setx 0x104c660d7882efc0, %g1, %r29
	setx 0x7c03a946c1c82e70, %g1, %r30
	setx 0x398e6fbd766959fe, %g1, %r31
	save
	setx 0xe29090a67d094693, %g1, %r16
	setx 0x4dd6cd051d81d023, %g1, %r17
	setx 0x4b5c4ffdc37c3fbf, %g1, %r18
	setx 0x12c9fb1e55d2c934, %g1, %r19
	setx 0xeb44fd25b8d2431d, %g1, %r20
	setx 0x1c806a3178d2e3e2, %g1, %r21
	setx 0xf9a8cfb0751eb923, %g1, %r22
	setx 0x9b9b10a83a845270, %g1, %r23
	setx 0xb9a4cb65c15dfa66, %g1, %r24
	setx 0x7db1b253fb779359, %g1, %r25
	setx 0x5a72d50bbe22d022, %g1, %r26
	setx 0xd719956b0bb906a1, %g1, %r27
	setx 0x3c5526c2db91b732, %g1, %r28
	setx 0xd821ef92ca83d999, %g1, %r29
	setx 0xf748ceaa16409e03, %g1, %r30
	setx 0xcbf31f464cfb85ea, %g1, %r31
	save
	setx 0xc547449f0b53d1ae, %g1, %r16
	setx 0x8a60f06b46f332a2, %g1, %r17
	setx 0x657b1df3095dee91, %g1, %r18
	setx 0x7fd7b3d8b2546f9d, %g1, %r19
	setx 0x90a826d9993045d8, %g1, %r20
	setx 0x3dc6f8f03c56a565, %g1, %r21
	setx 0x1520f4720e9990fd, %g1, %r22
	setx 0x2135afeb3b46e6cd, %g1, %r23
	setx 0xfd5f48421918085a, %g1, %r24
	setx 0x36fdd08549ab0bbe, %g1, %r25
	setx 0x9bb511175ace4ca7, %g1, %r26
	setx 0x00b9bd1cebd6065a, %g1, %r27
	setx 0x65bc0a85c263fb05, %g1, %r28
	setx 0xea6241989f4eae67, %g1, %r29
	setx 0xee23bff300b86b01, %g1, %r30
	setx 0xb37ab4543ca85e4d, %g1, %r31
	save
	setx 0x6b67eec6de598e57, %g1, %r16
	setx 0x95b9b486554f7366, %g1, %r17
	setx 0xb8eb704e9f470c4c, %g1, %r18
	setx 0xe3d3088c06a7f6f9, %g1, %r19
	setx 0xc307231db0bdd63f, %g1, %r20
	setx 0x06d3be54831b8430, %g1, %r21
	setx 0x96aa1045243cf674, %g1, %r22
	setx 0x937f71fca4c0b78a, %g1, %r23
	setx 0x6b98e5c0d16a3290, %g1, %r24
	setx 0x8a6475d20d16df72, %g1, %r25
	setx 0xc3754a94f3beff55, %g1, %r26
	setx 0xa46e61bc5d2b8277, %g1, %r27
	setx 0x0168f9c4e99bd2f5, %g1, %r28
	setx 0x6ea256416f0ed137, %g1, %r29
	setx 0xaa569fb15efccc90, %g1, %r30
	setx 0x5982c5337d4d3340, %g1, %r31
	save
	setx 0x8abc30e4732df433, %g1, %r16
	setx 0x36e5feea1ca8ad0f, %g1, %r17
	setx 0x16f92bef96b96197, %g1, %r18
	setx 0xf25ae2d3ac2b2824, %g1, %r19
	setx 0x450415a14471c62c, %g1, %r20
	setx 0x101c85c1e89fb89e, %g1, %r21
	setx 0x956a9b77e2debcb2, %g1, %r22
	setx 0x35fae4a945514227, %g1, %r23
	setx 0x3fb32424321709e3, %g1, %r24
	setx 0x6e7c3e5fb01aef6a, %g1, %r25
	setx 0x3111452341c3e0ca, %g1, %r26
	setx 0x0cdd88f7a455a5ee, %g1, %r27
	setx 0xcfac96855fbc1da9, %g1, %r28
	setx 0xc562fd916bae3793, %g1, %r29
	setx 0x4b27157ac3a2998a, %g1, %r30
	setx 0x9c6e18ac16546397, %g1, %r31
	save
	setx 0xacf6499d8affd084, %g1, %r16
	setx 0xc786c41f0929169d, %g1, %r17
	setx 0xce3114ece7d99093, %g1, %r18
	setx 0x1441d326db77c050, %g1, %r19
	setx 0xa24c02507ccb3ee7, %g1, %r20
	setx 0x9b91e06961e0325a, %g1, %r21
	setx 0xaa302a19e61d1f1b, %g1, %r22
	setx 0x77bfbe0409eb5f2b, %g1, %r23
	setx 0xd7666a195d751111, %g1, %r24
	setx 0x6cefb3f366b197a5, %g1, %r25
	setx 0x83a9e5df9384280e, %g1, %r26
	setx 0x25109ed1b10c3f09, %g1, %r27
	setx 0x08085f974c447720, %g1, %r28
	setx 0x944cab648b1d4ef9, %g1, %r29
	setx 0xa2832e1b5c566f28, %g1, %r30
	setx 0xe759dfdc4d8577fe, %g1, %r31
	save
	setx 0x912f64d7901fa430, %g1, %r16
	setx 0x77584e6f0a7f433b, %g1, %r17
	setx 0x5ba8a330dc010362, %g1, %r18
	setx 0x7444c0ca0097ca9a, %g1, %r19
	setx 0xdac895084b956289, %g1, %r20
	setx 0xecece819706a92ad, %g1, %r21
	setx 0x039c67ec53669ac2, %g1, %r22
	setx 0xc6ae43a10a832c57, %g1, %r23
	setx 0x0245f5585a3ce016, %g1, %r24
	setx 0xfb258a3ce965a3cd, %g1, %r25
	setx 0x3dd89828b709038c, %g1, %r26
	setx 0x870992296ef95872, %g1, %r27
	setx 0x7bdb609e3282bbf5, %g1, %r28
	setx 0x3a2ee3e60c9c2096, %g1, %r29
	setx 0x168d2c07ed47751e, %g1, %r30
	setx 0x6a67e69d7602e8b4, %g1, %r31
	save
	setx 0xa99723392f559c21, %g1, %r16
	setx 0xf7ce208e8509fbac, %g1, %r17
	setx 0x3ba36785f61609a8, %g1, %r18
	setx 0x4f23a0795036808f, %g1, %r19
	setx 0x580c001c56894566, %g1, %r20
	setx 0xc260d25c31a62a9b, %g1, %r21
	setx 0x8e6e1c7c4744050e, %g1, %r22
	setx 0xdcb3d52664a2959f, %g1, %r23
	setx 0x3e62dcd4f7695cc5, %g1, %r24
	setx 0x361d6e4162eeb3fa, %g1, %r25
	setx 0xa40cfaac22a955f8, %g1, %r26
	setx 0xe0b02064ca96a643, %g1, %r27
	setx 0x3e6ae1168979328a, %g1, %r28
	setx 0x8862ecdb44ddcc77, %g1, %r29
	setx 0xbbaae0faf236fd88, %g1, %r30
	setx 0xd76d1b588517ab41, %g1, %r31
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
	.word 0xb5e54000  ! 2: SAVE_R	save	%r21, %r0, %r26
iob_intr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_0), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbbe4c000  ! 4: SAVE_R	save	%r19, %r0, %r29
T0_asi_reg_wr_0:
	mov	0x3c5, %r14
	.word 0xfcf38e60  ! 7: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T0_asi_reg_wr_1:
	mov	0x34, %r14
	.word 0xfef38e80  ! 9: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb3e4c000  ! 10: SAVE_R	save	%r19, %r0, %r25
cpu_intr_0_0:
	setx	0x1f0215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb92da001  ! 12: SLL_I	sll 	%r22, 0x0001, %r28
	.word 0xbbe50000  ! 14: SAVE_R	save	%r20, %r0, %r29
cpu_intr_0_1:
	setx	0x1f0119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a1ce  ! 17: SAVE_I	save	%r22, 0x0001, %r26
iob_intr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_1), 16, 16)) -> intp(0, 0, 0)
	.word 0xb9e58000  ! 22: SAVE_R	save	%r22, %r0, %r28
	.word 0xbfe54000  ! 24: SAVE_R	save	%r21, %r0, %r31
	.word 0xbd342001  ! 26: SRL_I	srl 	%r16, 0x0001, %r30
cpu_intr_0_2:
	setx	0x1f0326, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_2), 16, 16)) -> intp(0, 0, 21)
T0_asi_reg_wr_2:
	mov	0xf, %r14
	.word 0xfcf38e60  ! 32: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_0_3:
	setx	0x1e030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e48000  ! 36: SAVE_R	save	%r18, %r0, %r28
	.word 0xbde50000  ! 38: SAVE_R	save	%r20, %r0, %r30
	.word 0xbb342001  ! 42: SRL_I	srl 	%r16, 0x0001, %r29
	.word 0xb1e5a000  ! 43: SAVE_I	save	%r22, 0x0001, %r24
cpu_intr_0_4:
	setx	0x1e010f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_3), 16, 16)) -> intp(0, 0, 3a)
cpu_intr_0_5:
	setx	0x1d0124, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_4), 16, 16)) -> intp(0, 0, 39)
	.word 0xb7e5c000  ! 56: SAVE_R	save	%r23, %r0, %r27
	.word 0xa1902000  ! 57: WRPR_GL_I	wrpr	%r0, 0x0000, %-
cpu_intr_0_6:
	setx	0x1c0334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5c000  ! 59: SAVE_R	save	%r23, %r0, %r31
T0_asi_reg_rd_0:
	mov	0x2b, %r14
	.word 0xf8db8400  ! 60: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T0_asi_reg_rd_1:
	mov	0x15, %r14
	.word 0xf6db8400  ! 62: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_5), 16, 16)) -> intp(0, 0, 35)
	.word 0xb5e5c000  ! 64: SAVE_R	save	%r23, %r0, %r26
cpu_intr_0_7:
	setx	0x1f0130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe561d6  ! 74: SAVE_I	save	%r21, 0x0001, %r29
cpu_intr_0_8:
	setx	0x1d021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e460d0  ! 77: SAVE_I	save	%r17, 0x0001, %r26
T0_asi_reg_wr_3:
	mov	0xf, %r14
	.word 0xf6f384a0  ! 79: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb5e4a143  ! 80: SAVE_I	save	%r18, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_9:
	setx	0x1d0203, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_6), 16, 16)) -> intp(0, 0, 34)
	.word 0xbfe48000  ! 96: SAVE_R	save	%r18, %r0, %r31
	.word 0xbbe5215f  ! 97: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7e48000  ! 98: SAVE_R	save	%r18, %r0, %r27
	.word 0xbe45e186  ! 99: ADDC_I	addc 	%r23, 0x0186, %r31
	.word 0xb5e40000  ! 100: SAVE_R	save	%r16, %r0, %r26
	.word 0xb9e5c000  ! 101: SAVE_R	save	%r23, %r0, %r28
	.word 0xb7e5a1e3  ! 102: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb13d5000  ! 106: SRAX_R	srax	%r21, %r0, %r24
	.word 0xb1e40000  ! 107: SAVE_R	save	%r16, %r0, %r24
	.word 0xb3e5605f  ! 108: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb6a54000  ! 110: SUBcc_R	subcc 	%r21, %r0, %r27
T0_asi_reg_rd_2:
	mov	0x3c5, %r14
	.word 0xfedb8400  ! 111: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_7), 16, 16)) -> intp(0, 0, 31)
iob_intr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_8), 16, 16)) -> intp(0, 0, 2e)
cpu_intr_0_10:
	setx	0x1f021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4600d  ! 118: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb3e561bc  ! 121: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb5e48000  ! 122: SAVE_R	save	%r18, %r0, %r26
T0_asi_reg_wr_4:
	mov	0x3c0, %r14
	.word 0xf0f38e60  ! 123: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_0_11:
	setx	0x1e0325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb734f001  ! 127: SRLX_I	srlx	%r19, 0x0001, %r27
	.word 0xb1e4e0da  ! 128: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e4c000  ! 134: SAVE_R	save	%r19, %r0, %r26
	.word 0xb3e4e1be  ! 135: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb9e421bc  ! 136: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb97c8400  ! 138: MOVR_R	movre	%r18, %r0, %r28
	.word 0xb5e5e09b  ! 139: SAVE_I	save	%r23, 0x0001, %r26
iob_intr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_9), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb7e58000  ! 141: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_wr_5:
	mov	0x3c5, %r14
	.word 0xf8f38400  ! 144: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_10), 16, 16)) -> intp(0, 0, 2f)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_11), 16, 16)) -> intp(0, 0, 23)
T0_asi_reg_wr_6:
	mov	0x3c0, %r14
	.word 0xf6f38e60  ! 152: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_0_12:
	setx	0x1c0229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_13:
	setx	0x1d0012, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_14:
	setx	0x1f0000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_15:
	setx	0x1e011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba35202f  ! 163: SUBC_I	orn 	%r20, 0x002f, %r29
	.word 0xb7e50000  ! 165: SAVE_R	save	%r20, %r0, %r27
T0_asi_reg_wr_7:
	mov	0x1a, %r14
	.word 0xf8f38e40  ! 166: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb73dc000  ! 167: SRA_R	sra 	%r23, %r0, %r27
	.word 0xb634e036  ! 168: ORN_I	orn 	%r19, 0x0036, %r27
	.word 0xb3e48000  ! 169: SAVE_R	save	%r18, %r0, %r25
iob_intr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_12), 16, 16)) -> intp(0, 0, a)
cpu_intr_0_16:
	setx	0x1f033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_3:
	mov	0x21, %r14
	.word 0xf4db84a0  ! 178: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_0_17:
	setx	0x1f002b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_18:
	setx	0x1f0112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd2dd000  ! 184: SLLX_R	sllx	%r23, %r0, %r30
cpu_intr_0_19:
	setx	0x1d001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4c000  ! 188: SAVE_R	save	%r19, %r0, %r30
iob_intr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_13), 16, 16)) -> intp(0, 0, f)
T0_asi_reg_wr_8:
	mov	0x1c, %r14
	.word 0xf6f384a0  ! 192: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T0_asi_reg_rd_4:
	mov	0x2c, %r14
	.word 0xfedb89e0  ! 193: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb1e54000  ! 202: SAVE_R	save	%r21, %r0, %r24
iob_intr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_14), 16, 16)) -> intp(0, 0, 13)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_15), 16, 16)) -> intp(0, 0, 34)
T0_asi_reg_rd_5:
	mov	0x2, %r14
	.word 0xfedb8e80  ! 210: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe48000  ! 214: SAVE_R	save	%r18, %r0, %r29
cpu_intr_0_20:
	setx	0x1f013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_9:
	mov	0x3c2, %r14
	.word 0xf4f384a0  ! 217: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_16), 16, 16)) -> intp(0, 0, f)
	.word 0xb3e4a1f4  ! 221: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb214c000  ! 228: OR_R	or 	%r19, %r0, %r25
iob_intr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_17), 16, 16)) -> intp(0, 0, 1)
cpu_intr_0_21:
	setx	0x1d0026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4206d  ! 234: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb5e40000  ! 235: SAVE_R	save	%r16, %r0, %r26
iob_intr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_18), 16, 16)) -> intp(0, 0, 34)
	.word 0xbbe58000  ! 237: SAVE_R	save	%r22, %r0, %r29
	.word 0xb2a5c000  ! 238: SUBcc_R	subcc 	%r23, %r0, %r25
T0_asi_reg_wr_10:
	mov	0x3c6, %r14
	.word 0xfef384a0  ! 239: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb5e54000  ! 240: SAVE_R	save	%r21, %r0, %r26
	.word 0xbde520f2  ! 243: SAVE_I	save	%r20, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_6:
	mov	0xe, %r14
	.word 0xf4db8e60  ! 248: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xbeb58000  ! 249: SUBCcc_R	orncc 	%r22, %r0, %r31
cpu_intr_0_22:
	setx	0x1e030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e52116  ! 257: SAVE_I	save	%r20, 0x0001, %r24
iob_intr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_19), 16, 16)) -> intp(0, 0, 3e)
cpu_intr_0_23:
	setx	0x1d020e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_7:
	mov	0x6, %r14
	.word 0xf0db8400  ! 262: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T0_asi_reg_wr_11:
	mov	0x19, %r14
	.word 0xf0f38e40  ! 264: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_24:
	setx	0x1d0135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb41cc000  ! 272: XOR_R	xor 	%r19, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbe8d8000  ! 277: ANDcc_R	andcc 	%r22, %r0, %r31
	.word 0xb3e4e181  ! 281: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_rd_8:
	mov	0x21, %r14
	.word 0xfedb8e80  ! 288: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb7e5e151  ! 289: SAVE_I	save	%r23, 0x0001, %r27
cpu_intr_0_25:
	setx	0x1e0309, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_26:
	setx	0x1d0023, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_20), 16, 16)) -> intp(0, 0, f)
iob_intr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_21), 16, 16)) -> intp(0, 0, 2d)
iob_intr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_22), 16, 16)) -> intp(0, 0, 39)
iob_intr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_23), 16, 16)) -> intp(0, 0, 13)
T0_asi_reg_wr_12:
	mov	0x3c1, %r14
	.word 0xfef384a0  ! 298: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb3e5a0e3  ! 304: SAVE_I	save	%r22, 0x0001, %r25
T0_asi_reg_wr_13:
	mov	0x38, %r14
	.word 0xfaf38e60  ! 308: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbfe44000  ! 311: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_24), 16, 16)) -> intp(0, 0, 33)
	.word 0xb44560e5  ! 315: ADDC_I	addc 	%r21, 0x00e5, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbde48000  ! 320: SAVE_R	save	%r18, %r0, %r30
	.word 0xb3e5e053  ! 321: SAVE_I	save	%r23, 0x0001, %r25
iob_intr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_25), 16, 16)) -> intp(0, 0, a)
T0_asi_reg_wr_14:
	mov	0x1b, %r14
	.word 0xf4f38e80  ! 326: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T0_asi_reg_rd_9:
	mov	0x29, %r14
	.word 0xfcdb8e60  ! 327: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_0_27:
	setx	0x1d032e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_26), 16, 16)) -> intp(0, 0, 16)
	.word 0xbb347001  ! 333: SRLX_I	srlx	%r17, 0x0001, %r29
	.word 0xb9e461fa  ! 334: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb8254000  ! 335: SUB_R	sub 	%r21, %r0, %r28
	.word 0xb5e48000  ! 336: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_27), 16, 16)) -> intp(0, 0, 2d)
T0_asi_reg_wr_15:
	mov	0x1e, %r14
	.word 0xf0f38e80  ! 341: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_28), 16, 16)) -> intp(0, 0, 39)
	.word 0xbbe42163  ! 348: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_rd_10:
	mov	0x29, %r14
	.word 0xf4db8400  ! 349: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T0_asi_reg_wr_16:
	mov	0x7, %r14
	.word 0xfef38e40  ! 352: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb1e44000  ! 353: SAVE_R	save	%r17, %r0, %r24
	.word 0xb2954000  ! 354: ORcc_R	orcc 	%r21, %r0, %r25
	.word 0xb7e560d6  ! 356: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_wr_17:
	mov	0x3c1, %r14
	.word 0xf8f38400  ! 360: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T0_asi_reg_wr_18:
	mov	0x2, %r14
	.word 0xf2f38e40  ! 365: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbfe48000  ! 366: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_28:
	setx	0x1e0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a1cd  ! 371: SAVE_I	save	%r18, 0x0001, %r26
iob_intr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_29), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb7e54000  ! 374: SAVE_R	save	%r21, %r0, %r27
	.word 0xbfe5604c  ! 375: SAVE_I	save	%r21, 0x0001, %r31
iob_intr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_30), 16, 16)) -> intp(0, 0, 33)
	.word 0xbde420ef  ! 380: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_rd_11:
	mov	0x34, %r14
	.word 0xfadb8e40  ! 381: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_31), 16, 16)) -> intp(0, 0, 9)
iob_intr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_32), 16, 16)) -> intp(0, 0, 5)
T0_asi_reg_rd_12:
	mov	0x3c1, %r14
	.word 0xfcdb89e0  ! 384: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_0_29:
	setx	0x1f0005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e46145  ! 388: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb3e50000  ! 390: SAVE_R	save	%r20, %r0, %r25
iob_intr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_33), 16, 16)) -> intp(0, 0, 9)
T0_asi_reg_wr_19:
	mov	0x3c4, %r14
	.word 0xf4f38e80  ! 395: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T0_asi_reg_rd_13:
	mov	0x17, %r14
	.word 0xfcdb84a0  ! 402: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_34), 16, 16)) -> intp(0, 0, 23)
iob_intr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_35), 16, 16)) -> intp(0, 0, 1d)
	.word 0xbbe561b1  ! 406: SAVE_I	save	%r21, 0x0001, %r29
cpu_intr_0_30:
	setx	0x1d012f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_14:
	mov	0x15, %r14
	.word 0xf4db84a0  ! 411: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb3e44000  ! 412: SAVE_R	save	%r17, %r0, %r25
iob_intr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_36), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_wr_20:
	mov	0x31, %r14
	.word 0xf2f384a0  ! 416: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_rd_15:
	mov	0x11, %r14
	.word 0xfadb84a0  ! 420: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_0_31:
	setx	0x1e0317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5207c  ! 424: SAVE_I	save	%r20, 0x0001, %r29
cpu_intr_0_32:
	setx	0x1f013c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_37), 16, 16)) -> intp(0, 0, 2c)
iob_intr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_38), 16, 16)) -> intp(0, 0, 1f)
cpu_intr_0_33:
	setx	0x1e020c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_39), 16, 16)) -> intp(0, 0, 5)
	.word 0xb3e54000  ! 432: SAVE_R	save	%r21, %r0, %r25
	.word 0x8d95618d  ! 436: WRPR_PSTATE_I	wrpr	%r21, 0x018d, %pstate
iob_intr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_40), 16, 16)) -> intp(0, 0, 14)
iob_intr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_41), 16, 16)) -> intp(0, 0, 16)
	.word 0xb1641800  ! 440: MOVcc_R	<illegal instruction>
	.word 0xb33c7001  ! 441: SRAX_I	srax	%r17, 0x0001, %r25
	.word 0xb1e4e04b  ! 443: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_rd_16:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 444: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbde44000  ! 446: SAVE_R	save	%r17, %r0, %r30
cpu_intr_0_34:
	setx	0x1d0328, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_35:
	setx	0x1d0135, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_21:
	mov	0x11, %r14
	.word 0xf0f38e40  ! 451: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_36:
	setx	0x1c021f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_22:
	mov	0x2c, %r14
	.word 0xf6f38e40  ! 455: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbc8d6138  ! 457: ANDcc_I	andcc 	%r21, 0x0138, %r30
	.word 0xbf518000  ! 458: RDPR_PSTATE	<illegal instruction>
cpu_intr_0_37:
	setx	0x210023, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_38:
	setx	0x210010, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_17:
	mov	0x5, %r14
	.word 0xf0db8e80  ! 464: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbfe4e049  ! 467: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb8b44000  ! 469: ORNcc_R	orncc 	%r17, %r0, %r28
	.word 0xbb540000  ! 471: RDPR_GL	<illegal instruction>
	.word 0xb3e58000  ! 473: SAVE_R	save	%r22, %r0, %r25
cpu_intr_0_39:
	setx	0x210207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 481: SAVE_R	save	%r21, %r0, %r27
	.word 0xbfe46025  ! 482: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb4b58000  ! 485: ORNcc_R	orncc 	%r22, %r0, %r26
T0_asi_reg_wr_23:
	mov	0x3c6, %r14
	.word 0xf0f38e60  ! 486: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb9e5e044  ! 488: SAVE_I	save	%r23, 0x0001, %r28
cpu_intr_0_40:
	setx	0x20010b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_42), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb3e50000  ! 491: SAVE_R	save	%r20, %r0, %r25
T0_asi_reg_rd_18:
	mov	0x4, %r14
	.word 0xfedb8e40  ! 493: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb1e40000  ! 494: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_41:
	setx	0x22002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e48000  ! 496: SAVE_R	save	%r18, %r0, %r25
cpu_intr_0_42:
	setx	0x21030f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_43:
	setx	0x200334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb435e154  ! 503: SUBC_I	orn 	%r23, 0x0154, %r26
T0_asi_reg_rd_19:
	mov	0x27, %r14
	.word 0xf8db8400  ! 504: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb5e460d5  ! 505: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb5e42178  ! 511: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb5e54000  ! 520: SAVE_R	save	%r21, %r0, %r26
	.word 0xb445e0f1  ! 521: ADDC_I	addc 	%r23, 0x00f1, %r26
iob_intr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_43), 16, 16)) -> intp(0, 0, 4)
T0_asi_reg_rd_20:
	mov	0x2e, %r14
	.word 0xfcdb8e80  ! 524: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbde44000  ! 525: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_rd_21:
	mov	0x32, %r14
	.word 0xfedb89e0  ! 527: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb2ade152  ! 530: ANDNcc_I	andncc 	%r23, 0x0152, %r25
	.word 0xbde50000  ! 532: SAVE_R	save	%r20, %r0, %r30
	.word 0xbfe40000  ! 536: SAVE_R	save	%r16, %r0, %r31
	.word 0xb3e40000  ! 543: SAVE_R	save	%r16, %r0, %r25
	.word 0xb7e4c000  ! 544: SAVE_R	save	%r19, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e44000  ! 546: SAVE_R	save	%r17, %r0, %r25
	.word 0xbde5a1d9  ! 547: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbc944000  ! 550: ORcc_R	orcc 	%r17, %r0, %r30
	.word 0xb7643801  ! 554: MOVcc_I	<illegal instruction>
	.word 0xb3e5c000  ! 558: SAVE_R	save	%r23, %r0, %r25
iob_intr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_44), 16, 16)) -> intp(0, 0, 33)
	.word 0xbbe54000  ! 566: SAVE_R	save	%r21, %r0, %r29
T0_asi_reg_wr_24:
	mov	0x30, %r14
	.word 0xf2f38e60  ! 570: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb93d2001  ! 574: SRA_I	sra 	%r20, 0x0001, %r28
	.word 0xb9e4a1fc  ! 579: SAVE_I	save	%r18, 0x0001, %r28
iob_intr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_45), 16, 16)) -> intp(0, 0, 31)
	.word 0xbbe42077  ! 582: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb5e5c000  ! 585: SAVE_R	save	%r23, %r0, %r26
T0_asi_reg_rd_22:
	mov	0x33, %r14
	.word 0xf6db8e60  ! 586: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_46), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_rd_23:
	mov	0x3c8, %r14
	.word 0xf0db8e40  ! 588: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_44:
	setx	0x22001a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_25:
	mov	0x3c5, %r14
	.word 0xfcf38e40  ! 591: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb3e48000  ! 593: SAVE_R	save	%r18, %r0, %r25
iob_intr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_47), 16, 16)) -> intp(0, 0, 2b)
	.word 0xbde42101  ! 595: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbe84a028  ! 596: ADDcc_I	addcc 	%r18, 0x0028, %r31
T0_asi_reg_rd_24:
	mov	0x3c1, %r14
	.word 0xf4db8e60  ! 597: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb3e54000  ! 599: SAVE_R	save	%r21, %r0, %r25
T0_asi_reg_rd_25:
	mov	0x3c2, %r14
	.word 0xf6db84a0  ! 604: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T0_asi_reg_rd_26:
	mov	0xd, %r14
	.word 0xfadb8e40  ! 608: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb1e5200d  ! 610: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb7e58000  ! 614: SAVE_R	save	%r22, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_45:
	setx	0x21002a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_46:
	setx	0x220204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb625e0d5  ! 619: SUB_I	sub 	%r23, 0x00d5, %r27
	.word 0xbfe48000  ! 620: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_47:
	setx	0x22021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde50000  ! 622: SAVE_R	save	%r20, %r0, %r30
	.word 0xb7e5c000  ! 623: SAVE_R	save	%r23, %r0, %r27
cpu_intr_0_48:
	setx	0x200128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e48000  ! 627: SAVE_R	save	%r18, %r0, %r26
cpu_intr_0_49:
	setx	0x200030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5c000  ! 629: SAVE_R	save	%r23, %r0, %r30
	.word 0xbde560e3  ! 631: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb3e4a037  ! 634: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbbe42103  ! 635: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_rd_27:
	mov	0x3c4, %r14
	.word 0xf6db84a0  ! 639: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbbe40000  ! 640: SAVE_R	save	%r16, %r0, %r29
cpu_intr_0_50:
	setx	0x22013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a15d  ! 645: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_rd_28:
	mov	0x31, %r14
	.word 0xf2db8e40  ! 646: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb00c4000  ! 648: AND_R	and 	%r17, %r0, %r24
	.word 0xb3e54000  ! 650: SAVE_R	save	%r21, %r0, %r25
	.word 0xbde4a0df  ! 651: SAVE_I	save	%r18, 0x0001, %r30
iob_intr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_48), 16, 16)) -> intp(0, 0, 3c)
T0_asi_reg_rd_29:
	mov	0x3c2, %r14
	.word 0xf4db8e40  ! 653: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbde46175  ! 654: SAVE_I	save	%r17, 0x0001, %r30
cpu_intr_0_51:
	setx	0x23030d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_52:
	setx	0x22013d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_53:
	setx	0x200210, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_30:
	mov	0x17, %r14
	.word 0xf6db89e0  ! 659: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_0_54:
	setx	0x220322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc9c4000  ! 661: XORcc_R	xorcc 	%r17, %r0, %r30
T0_asi_reg_wr_26:
	mov	0x3c1, %r14
	.word 0xfcf38e40  ! 662: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_wr_27:
	mov	0xa, %r14
	.word 0xf4f38e60  ! 666: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T0_asi_reg_rd_31:
	mov	0x9, %r14
	.word 0xfedb84a0  ! 667: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T0_asi_reg_rd_32:
	mov	0x16, %r14
	.word 0xf0db8e40  ! 670: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_55:
	setx	0x230005, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_49), 16, 16)) -> intp(0, 0, d)
cpu_intr_0_56:
	setx	0x220121, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_50), 16, 16)) -> intp(0, 0, 23)
cpu_intr_0_57:
	setx	0x200129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5c000  ! 689: SAVE_R	save	%r23, %r0, %r25
cpu_intr_0_58:
	setx	0x20020b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_51), 16, 16)) -> intp(0, 0, 13)
T0_asi_reg_wr_28:
	mov	0x3c7, %r14
	.word 0xf0f38e80  ! 693: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb3e50000  ! 695: SAVE_R	save	%r20, %r0, %r25
	.word 0xbde5c000  ! 700: SAVE_R	save	%r23, %r0, %r30
	.word 0xbfe5a058  ! 702: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_52:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_52), 16, 16)) -> intp(0, 0, 38)
	.word 0xba1c8000  ! 706: XOR_R	xor 	%r18, %r0, %r29
cpu_intr_0_59:
	setx	0x220039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4615b  ! 710: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb2342021  ! 711: SUBC_I	orn 	%r16, 0x0021, %r25
iob_intr_0_53:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_53), 16, 16)) -> intp(0, 0, 11)
	.word 0xbfe40000  ! 714: SAVE_R	save	%r16, %r0, %r31
	.word 0xb5e52130  ! 717: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb7e46125  ! 718: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbfe420d8  ! 719: SAVE_I	save	%r16, 0x0001, %r31
cpu_intr_0_60:
	setx	0x200004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e07d  ! 728: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb7e50000  ! 730: SAVE_R	save	%r20, %r0, %r27
	.word 0xbbe48000  ! 732: SAVE_R	save	%r18, %r0, %r29
cpu_intr_0_61:
	setx	0x220104, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_54:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_54), 16, 16)) -> intp(0, 0, 12)
iob_intr_0_55:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_55), 16, 16)) -> intp(0, 0, 24)
iob_intr_0_56:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_56), 16, 16)) -> intp(0, 0, 3)
T0_asi_reg_wr_29:
	mov	0x27, %r14
	.word 0xf0f38e80  ! 741: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_0_57:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_57), 16, 16)) -> intp(0, 0, 11)
	.word 0xbfe48000  ! 745: SAVE_R	save	%r18, %r0, %r31
	.word 0xbe2520bf  ! 748: SUB_I	sub 	%r20, 0x00bf, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_62:
	setx	0x20012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcada029  ! 755: ANDNcc_I	andncc 	%r22, 0x0029, %r30
cpu_intr_0_63:
	setx	0x21003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc2c4000  ! 757: ANDN_R	andn 	%r17, %r0, %r30
iob_intr_0_58:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_58), 16, 16)) -> intp(0, 0, 15)
	.word 0xb3e56078  ! 769: SAVE_I	save	%r21, 0x0001, %r25
T0_asi_reg_wr_30:
	mov	0x3c3, %r14
	.word 0xfef38400  ! 770: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb1e48000  ! 772: SAVE_R	save	%r18, %r0, %r24
cpu_intr_0_64:
	setx	0x230025, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_59:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_59), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb3e4c000  ! 778: SAVE_R	save	%r19, %r0, %r25
cpu_intr_0_65:
	setx	0x20012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e024  ! 787: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb5e4e0d3  ! 790: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb135c000  ! 791: SRL_R	srl 	%r23, %r0, %r24
iob_intr_0_60:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_60), 16, 16)) -> intp(0, 0, 37)
T0_asi_reg_wr_31:
	mov	0x3c2, %r14
	.word 0xf2f38e60  ! 799: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb9e5e037  ! 800: SAVE_I	save	%r23, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe4e049  ! 803: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbbe5e12c  ! 805: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbde48000  ! 806: SAVE_R	save	%r18, %r0, %r30
	.word 0xb9e5c000  ! 808: SAVE_R	save	%r23, %r0, %r28
	.word 0xb3e5601a  ! 809: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb8c5e153  ! 812: ADDCcc_I	addccc 	%r23, 0x0153, %r28
iob_intr_0_61:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_61), 16, 16)) -> intp(0, 0, b)
	.word 0xb7e5e0ef  ! 816: SAVE_I	save	%r23, 0x0001, %r27
cpu_intr_0_66:
	setx	0x200035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4c000  ! 819: SAVE_R	save	%r19, %r0, %r26
	.word 0xb1e5e017  ! 821: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb7e421a9  ! 823: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb0b4c000  ! 825: ORNcc_R	orncc 	%r19, %r0, %r24
	.word 0xb1e5e128  ! 827: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_62:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_62), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_63:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_63), 16, 16)) -> intp(0, 0, d)
T0_asi_reg_rd_33:
	mov	0x2d, %r14
	.word 0xfcdb8e80  ! 836: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbbe4c000  ! 837: SAVE_R	save	%r19, %r0, %r29
T0_asi_reg_wr_32:
	mov	0x3c5, %r14
	.word 0xf2f38e40  ! 843: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_0_67:
	setx	0x230213, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_64:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_64), 16, 16)) -> intp(0, 0, b)
	.word 0xbbe4c000  ! 847: SAVE_R	save	%r19, %r0, %r29
T0_asi_reg_rd_34:
	mov	0x3c5, %r14
	.word 0xfadb8e40  ! 849: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_wr_33:
	mov	0x3, %r14
	.word 0xfef38e60  ! 850: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_0_65:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_65), 16, 16)) -> intp(0, 0, e)
	.word 0xbbe50000  ! 854: SAVE_R	save	%r20, %r0, %r29
cpu_intr_0_68:
	setx	0x220104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a1f8  ! 859: SAVE_I	save	%r22, 0x0001, %r28
cpu_intr_0_69:
	setx	0x200106, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_34:
	mov	0x3c1, %r14
	.word 0xf8f38400  ! 863: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb9e5c000  ! 865: SAVE_R	save	%r23, %r0, %r28
	.word 0xb28de175  ! 867: ANDcc_I	andcc 	%r23, 0x0175, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_70:
	setx	0x23032c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_35:
	mov	0x30, %r14
	.word 0xf6f384a0  ! 875: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_0_71:
	setx	0x200124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e15b  ! 882: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbe8d4000  ! 883: ANDcc_R	andcc 	%r21, %r0, %r31
	.word 0xb5e521cc  ! 887: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbeb42026  ! 892: SUBCcc_I	orncc 	%r16, 0x0026, %r31
T0_asi_reg_wr_36:
	mov	0x3c2, %r14
	.word 0xf0f389e0  ! 896: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_0_66:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_66), 16, 16)) -> intp(0, 0, 25)
	.word 0xb21461e4  ! 900: OR_I	or 	%r17, 0x01e4, %r25
T0_asi_reg_wr_37:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 901: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_rd_35:
	mov	0x26, %r14
	.word 0xfadb84a0  ! 906: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb40da0cc  ! 907: AND_I	and 	%r22, 0x00cc, %r26
T0_asi_reg_rd_36:
	mov	0x11, %r14
	.word 0xfadb84a0  ! 909: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_0_67:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_67), 16, 16)) -> intp(0, 0, 37)
cpu_intr_0_72:
	setx	0x240315, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_68:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_68), 16, 16)) -> intp(0, 0, 33)
cpu_intr_0_73:
	setx	0x240208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe50000  ! 922: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_74:
	setx	0x240038, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_75:
	setx	0x24003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5a107  ! 932: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb1e50000  ! 933: SAVE_R	save	%r20, %r0, %r24
	.word 0xb5e44000  ! 934: SAVE_R	save	%r17, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e5c000  ! 936: SAVE_R	save	%r23, %r0, %r25
	.word 0xb1e54000  ! 937: SAVE_R	save	%r21, %r0, %r24
	.word 0xbfe5e0fa  ! 939: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb7e42020  ! 940: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbfe4a11a  ! 941: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb5e50000  ! 947: SAVE_R	save	%r20, %r0, %r26
	.word 0xb7e4a10f  ! 948: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_wr_38:
	mov	0xb, %r14
	.word 0xfaf38400  ! 953: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
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
	.word 0xbde5a1bb  ! 956: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_rd_37:
	mov	0xa, %r14
	.word 0xfcdb84a0  ! 957: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T0_asi_reg_rd_38:
	mov	0x1b, %r14
	.word 0xfadb8e60  ! 958: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_0_69:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_69), 16, 16)) -> intp(0, 0, 11)
T0_asi_reg_wr_39:
	mov	0x7, %r14
	.word 0xfef38e40  ! 965: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_wr_40:
	mov	0x3c2, %r14
	.word 0xfef38400  ! 966: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb5e5e10b  ! 967: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_wr_41:
	mov	0x1a, %r14
	.word 0xf6f38400  ! 969: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_0_70:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_70), 16, 16)) -> intp(0, 0, 2c)
	.word 0xba84e19a  ! 972: ADDcc_I	addcc 	%r19, 0x019a, %r29
T0_asi_reg_rd_39:
	mov	0x25, %r14
	.word 0xfadb8e80  ! 975: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xbaa5c000  ! 977: SUBcc_R	subcc 	%r23, %r0, %r29
cpu_intr_0_76:
	setx	0x260115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a0cd  ! 979: SAVE_I	save	%r18, 0x0001, %r25
iob_intr_0_71:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_71), 16, 16)) -> intp(0, 0, 18)
cpu_intr_0_77:
	setx	0x240330, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_78:
	setx	0x270300, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_72:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_72), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb1e5e199  ! 984: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb61de063  ! 985: XOR_I	xor 	%r23, 0x0063, %r27
T0_asi_reg_rd_40:
	mov	0x6, %r14
	.word 0xfedb8e40  ! 986: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_0_79:
	setx	0x250208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb62d61cc  ! 989: ANDN_I	andn 	%r21, 0x01cc, %r27
T0_asi_reg_wr_42:
	mov	0x3c1, %r14
	.word 0xfcf38e60  ! 990: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_0_73:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_73), 16, 16)) -> intp(0, 0, 22)
	.word 0xb9e4606a  ! 994: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbd344000  ! 995: SRL_R	srl 	%r17, %r0, %r30
T0_asi_reg_wr_43:
	mov	0x2a, %r14
	.word 0xf0f38e40  ! 997: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_rd_41:
	mov	0x1c, %r14
	.word 0xf0db8e40  ! 1001: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_74:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_74), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_wr_44:
	mov	0x3c8, %r14
	.word 0xfef389e0  ! 1007: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb7e4c000  ! 1008: SAVE_R	save	%r19, %r0, %r27
	.word 0xb3e4a06c  ! 1009: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbde421f6  ! 1011: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbbe40000  ! 1013: SAVE_R	save	%r16, %r0, %r29
iob_intr_0_75:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_75), 16, 16)) -> intp(0, 0, 2c)
T0_asi_reg_rd_42:
	mov	0x3c4, %r14
	.word 0xf4db8e40  ! 1016: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T0_asi_reg_wr_45:
	mov	0x8, %r14
	.word 0xf6f384a0  ! 1017: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_0_76:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_76), 16, 16)) -> intp(0, 0, 3e)
	.word 0xba24e021  ! 1021: SUB_I	sub 	%r19, 0x0021, %r29
T0_asi_reg_wr_46:
	mov	0x16, %r14
	.word 0xf6f38e40  ! 1022: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb63c61c3  ! 1023: XNOR_I	xnor 	%r17, 0x01c3, %r27
iob_intr_0_77:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_77), 16, 16)) -> intp(0, 0, 17)
	.word 0xb5e4e04e  ! 1026: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_rd_43:
	mov	0x3c2, %r14
	.word 0xf6db84a0  ! 1027: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb3e50000  ! 1035: SAVE_R	save	%r20, %r0, %r25
	.word 0xb1e54000  ! 1036: SAVE_R	save	%r21, %r0, %r24
cpu_intr_0_80:
	setx	0x27030d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_47:
	mov	0x3c3, %r14
	.word 0xfef38e60  ! 1045: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb1e4c000  ! 1046: SAVE_R	save	%r19, %r0, %r24
T0_asi_reg_wr_48:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 1047: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_81:
	setx	0x27012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e56163  ! 1049: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb0354000  ! 1050: SUBC_R	orn 	%r21, %r0, %r24
iob_intr_0_78:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_78), 16, 16)) -> intp(0, 0, 23)
	.word 0xb9e54000  ! 1054: SAVE_R	save	%r21, %r0, %r28
cpu_intr_0_82:
	setx	0x240303, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_83:
	setx	0x25022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe40000  ! 1059: SAVE_R	save	%r16, %r0, %r31
	.word 0xb9e4a1cb  ! 1061: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbfe520c7  ! 1062: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9e5c000  ! 1063: SAVE_R	save	%r23, %r0, %r28
iob_intr_0_79:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_79), 16, 16)) -> intp(0, 0, 22)
	.word 0xbde46020  ! 1065: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7e40000  ! 1068: SAVE_R	save	%r16, %r0, %r27
iob_intr_0_80:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_80), 16, 16)) -> intp(0, 0, 17)
	.word 0xbfe4c000  ! 1074: SAVE_R	save	%r19, %r0, %r31
	.word 0xbd641800  ! 1078: MOVcc_R	<illegal instruction>
iob_intr_0_81:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_81), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_82:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_82), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb9e520e8  ! 1082: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_84:
	setx	0x240033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4219d  ! 1086: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb3e48000  ! 1087: SAVE_R	save	%r18, %r0, %r25
cpu_intr_0_85:
	setx	0x26002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde40000  ! 1089: SAVE_R	save	%r16, %r0, %r30
	.word 0xb1e4a115  ! 1091: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbde5e1cb  ! 1092: SAVE_I	save	%r23, 0x0001, %r30
cpu_intr_0_86:
	setx	0x270235, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_87:
	setx	0x240218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e54000  ! 1096: SAVE_R	save	%r21, %r0, %r24
T0_asi_reg_rd_44:
	mov	0x2e, %r14
	.word 0xf6db8e80  ! 1097: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_0_88:
	setx	0x24032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e560f6  ! 1099: SAVE_I	save	%r21, 0x0001, %r24
cpu_intr_0_89:
	setx	0x24031a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_49:
	mov	0x2b, %r14
	.word 0xf0f38e60  ! 1103: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xbfe5219a  ! 1104: SAVE_I	save	%r20, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xba0ca0b7  ! 1108: AND_I	and 	%r18, 0x00b7, %r29
cpu_intr_0_90:
	setx	0x25013f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_83:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_83), 16, 16)) -> intp(0, 0, 32)
	.word 0xbde54000  ! 1121: SAVE_R	save	%r21, %r0, %r30
	.word 0xbbe561bc  ! 1122: SAVE_I	save	%r21, 0x0001, %r29
cpu_intr_0_91:
	setx	0x260322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_92:
	setx	0x25023d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_50:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 1126: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbea5215e  ! 1127: SUBcc_I	subcc 	%r20, 0x015e, %r31
	.word 0xbfe4c000  ! 1128: SAVE_R	save	%r19, %r0, %r31
	.word 0xbbe421fa  ! 1129: SAVE_I	save	%r16, 0x0001, %r29
cpu_intr_0_93:
	setx	0x250202, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_51:
	mov	0x28, %r14
	.word 0xf4f38e80  ! 1136: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_0_94:
	setx	0x240228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4201e  ! 1139: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbe35e0f1  ! 1140: SUBC_I	orn 	%r23, 0x00f1, %r31
T0_asi_reg_rd_45:
	mov	0x3c2, %r14
	.word 0xfadb8e60  ! 1143: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_0_84:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_84), 16, 16)) -> intp(0, 0, 3)
	.word 0xb53db001  ! 1149: SRAX_I	srax	%r22, 0x0001, %r26
cpu_intr_0_95:
	setx	0x270136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 1151: SAVE_R	save	%r23, %r0, %r27
T0_asi_reg_rd_46:
	mov	0x15, %r14
	.word 0xf2db8e60  ! 1153: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_0_85:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_85), 16, 16)) -> intp(0, 0, 1a)
T0_asi_reg_rd_47:
	mov	0x15, %r14
	.word 0xf2db8400  ! 1165: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T0_asi_reg_wr_52:
	mov	0x3c4, %r14
	.word 0xf2f38e80  ! 1168: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbbe48000  ! 1171: SAVE_R	save	%r18, %r0, %r29
	.word 0xb5e460cc  ! 1173: SAVE_I	save	%r17, 0x0001, %r26
iob_intr_0_86:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_86), 16, 16)) -> intp(0, 0, 15)
cpu_intr_0_96:
	setx	0x240009, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb825a14d  ! 1179: SUB_I	sub 	%r22, 0x014d, %r28
	.word 0xb7e48000  ! 1180: SAVE_R	save	%r18, %r0, %r27
iob_intr_0_87:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_87), 16, 16)) -> intp(0, 0, 2f)
iob_intr_0_88:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_88), 16, 16)) -> intp(0, 0, 15)
iob_intr_0_89:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_89), 16, 16)) -> intp(0, 0, 3f)
iob_intr_0_90:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_90), 16, 16)) -> intp(0, 0, 26)
cpu_intr_0_97:
	setx	0x240229, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_53:
	mov	0x2d, %r14
	.word 0xf2f38400  ! 1188: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_0_91:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_91), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb5e48000  ! 1194: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_92:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_92), 16, 16)) -> intp(0, 0, a)
T0_asi_reg_rd_48:
	mov	0x3c2, %r14
	.word 0xf6db8e40  ! 1199: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_rd_49:
	mov	0x0, %r14
	.word 0xf8db84a0  ! 1202: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb9e40000  ! 1203: SAVE_R	save	%r16, %r0, %r28
T0_asi_reg_rd_50:
	mov	0x3c3, %r14
	.word 0xfadb8e40  ! 1204: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_rd_51:
	mov	0x8, %r14
	.word 0xfedb8e40  ! 1205: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb1e56017  ! 1206: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e42100  ! 1207: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9e48000  ! 1208: SAVE_R	save	%r18, %r0, %r28
	.word 0xb3e4e010  ! 1213: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_wr_54:
	mov	0x3c5, %r14
	.word 0xfaf38e40  ! 1214: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_rd_52:
	mov	0x2f, %r14
	.word 0xfcdb8e80  ! 1215: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbbe58000  ! 1218: SAVE_R	save	%r22, %r0, %r29
	.word 0xb9e48000  ! 1219: SAVE_R	save	%r18, %r0, %r28
	.word 0xb3e4c000  ! 1220: SAVE_R	save	%r19, %r0, %r25
T0_asi_reg_rd_53:
	mov	0x3c0, %r14
	.word 0xf8db84a0  ! 1222: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_0_93:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_93), 16, 16)) -> intp(0, 0, 3f)
	.word 0xbbe46110  ! 1227: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb8248000  ! 1229: SUB_R	sub 	%r18, %r0, %r28
	.word 0xb9e4e070  ! 1230: SAVE_I	save	%r19, 0x0001, %r28
iob_intr_0_94:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_94), 16, 16)) -> intp(0, 0, 1a)
iob_intr_0_95:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_95), 16, 16)) -> intp(0, 0, 23)
	.word 0xba25e0db  ! 1234: SUB_I	sub 	%r23, 0x00db, %r29
iob_intr_0_96:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_96), 16, 16)) -> intp(0, 0, 21)
	.word 0xb7e4a1eb  ! 1236: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb93d6001  ! 1237: SRA_I	sra 	%r21, 0x0001, %r28
iob_intr_0_97:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_97), 16, 16)) -> intp(0, 0, 3b)
T0_asi_reg_wr_55:
	mov	0xb, %r14
	.word 0xf2f38e40  ! 1239: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbde42130  ! 1242: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5e5a11b  ! 1243: SAVE_I	save	%r22, 0x0001, %r26
T0_asi_reg_wr_56:
	mov	0x3c6, %r14
	.word 0xf2f38e80  ! 1244: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbbe561f2  ! 1246: SAVE_I	save	%r21, 0x0001, %r29
T0_asi_reg_wr_57:
	mov	0x31, %r14
	.word 0xfcf38e40  ! 1248: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_wr_58:
	mov	0x3c3, %r14
	.word 0xf0f38e80  ! 1250: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_0_98:
	setx	0x250130, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_98:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_98), 16, 16)) -> intp(0, 0, 35)
cpu_intr_0_99:
	setx	0x250104, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_59:
	mov	0x3c0, %r14
	.word 0xf2f389e0  ! 1254: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T0_asi_reg_wr_60:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 1255: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_wr_61:
	mov	0x3c7, %r14
	.word 0xf0f38e40  ! 1256: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_100:
	setx	0x25032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe421b3  ! 1258: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_rd_54:
	mov	0x2, %r14
	.word 0xfedb8e40  ! 1260: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb550c000  ! 1261: RDPR_TT	<illegal instruction>
iob_intr_0_99:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_99), 16, 16)) -> intp(0, 0, 1)
	.word 0xbde5203d  ! 1264: SAVE_I	save	%r20, 0x0001, %r30
iob_intr_0_100:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_100), 16, 16)) -> intp(0, 0, f)
	.word 0xb7e521d6  ! 1271: SAVE_I	save	%r20, 0x0001, %r27
iob_intr_0_101:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_101), 16, 16)) -> intp(0, 0, 32)
	.word 0x8f902000  ! 1277: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xa1902000  ! 1278: WRPR_GL_I	wrpr	%r0, 0x0000, %-
iob_intr_0_102:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_102), 16, 16)) -> intp(0, 0, 15)
	.word 0xb1e5c000  ! 1282: SAVE_R	save	%r23, %r0, %r24
	.word 0xbfe4a0a4  ! 1283: SAVE_I	save	%r18, 0x0001, %r31
cpu_intr_0_101:
	setx	0x250332, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_102:
	setx	0x260120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb495c000  ! 1287: ORcc_R	orcc 	%r23, %r0, %r26
	.word 0xbbe42035  ! 1288: SAVE_I	save	%r16, 0x0001, %r29
cpu_intr_0_103:
	setx	0x260119, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_103:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_103), 16, 16)) -> intp(0, 0, 35)
	.word 0xbde40000  ! 1291: SAVE_R	save	%r16, %r0, %r30
T0_asi_reg_rd_55:
	mov	0x6, %r14
	.word 0xf0db8e40  ! 1293: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_104:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_104), 16, 16)) -> intp(0, 0, 10)
	.word 0xbde421eb  ! 1296: SAVE_I	save	%r16, 0x0001, %r30
iob_intr_0_105:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_105), 16, 16)) -> intp(0, 0, a)
iob_intr_0_106:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_106), 16, 16)) -> intp(0, 0, 16)
	.word 0xbbe5e043  ! 1301: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb4c460c4  ! 1304: ADDCcc_I	addccc 	%r17, 0x00c4, %r26
	.word 0xbbe48000  ! 1307: SAVE_R	save	%r18, %r0, %r29
iob_intr_0_107:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_107), 16, 16)) -> intp(0, 0, 3d)
iob_intr_0_108:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_108), 16, 16)) -> intp(0, 0, 27)
	.word 0xb1e40000  ! 1314: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_109:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_109), 16, 16)) -> intp(0, 0, 14)
	.word 0xb92cc000  ! 1317: SLL_R	sll 	%r19, %r0, %r28
iob_intr_0_110:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_110), 16, 16)) -> intp(0, 0, 20)
T0_asi_reg_rd_56:
	mov	0x2b, %r14
	.word 0xfadb8e40  ! 1321: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xba354000  ! 1324: ORN_R	orn 	%r21, %r0, %r29
	.word 0xbfe44000  ! 1325: SAVE_R	save	%r17, %r0, %r31
	.word 0xbbe42069  ! 1327: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7e5207f  ! 1331: SAVE_I	save	%r20, 0x0001, %r27
iob_intr_0_111:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_111), 16, 16)) -> intp(0, 0, 25)
iob_intr_0_112:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_112), 16, 16)) -> intp(0, 0, 32)
T0_asi_reg_wr_62:
	mov	0x34, %r14
	.word 0xfaf38e40  ! 1337: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_113:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_113), 16, 16)) -> intp(0, 0, 9)
	.word 0xb7e4e010  ! 1341: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde50000  ! 1342: SAVE_R	save	%r20, %r0, %r30
	.word 0xb5e58000  ! 1343: SAVE_R	save	%r22, %r0, %r26
	.word 0xb5e4e011  ! 1345: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_rd_57:
	mov	0x8, %r14
	.word 0xf6db8400  ! 1347: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbde46053  ! 1348: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7e4c000  ! 1349: SAVE_R	save	%r19, %r0, %r27
cpu_intr_0_104:
	setx	0x270236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e0f2  ! 1354: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_114:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_114), 16, 16)) -> intp(0, 0, 21)
	.word 0xbfe46130  ! 1358: SAVE_I	save	%r17, 0x0001, %r31
iob_intr_0_115:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_115), 16, 16)) -> intp(0, 0, 15)
	.word 0xbfe48000  ! 1360: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_wr_63:
	mov	0x2a, %r14
	.word 0xf8f38e80  ! 1361: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T0_asi_reg_wr_64:
	mov	0x2, %r14
	.word 0xf0f38e60  ! 1362: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xbbe54000  ! 1364: SAVE_R	save	%r21, %r0, %r29
cpu_intr_0_105:
	setx	0x270211, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_116:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_116), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb21dc000  ! 1368: XOR_R	xor 	%r23, %r0, %r25
	.word 0xb5e58000  ! 1369: SAVE_R	save	%r22, %r0, %r26
	.word 0xb9e5a169  ! 1370: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_wr_65:
	mov	0x3c4, %r14
	.word 0xf0f38e60  ! 1372: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T0_asi_reg_rd_58:
	mov	0x2a, %r14
	.word 0xf4db8e60  ! 1373: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb5e4a17a  ! 1376: SAVE_I	save	%r18, 0x0001, %r26
cpu_intr_0_106:
	setx	0x2a0317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_107:
	setx	0x28033e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_59:
	mov	0x3c5, %r14
	.word 0xf2db89e0  ! 1383: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_0_117:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_117), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb9e4e11c  ! 1387: SAVE_I	save	%r19, 0x0001, %r28
cpu_intr_0_108:
	setx	0x280023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e02c  ! 1390: SAVE_I	save	%r19, 0x0001, %r27
T0_asi_reg_wr_66:
	mov	0x3c2, %r14
	.word 0xfcf384a0  ! 1391: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb5e560b9  ! 1392: SAVE_I	save	%r21, 0x0001, %r26
cpu_intr_0_109:
	setx	0x280328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e50000  ! 1397: SAVE_R	save	%r20, %r0, %r28
	.word 0xb37c2401  ! 1403: MOVR_I	movre	%r16, 0x1, %r25
T0_asi_reg_wr_67:
	mov	0x16, %r14
	.word 0xf6f384a0  ! 1405: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_68:
	mov	0x3c7, %r14
	.word 0xfcf38e80  ! 1408: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T0_asi_reg_wr_69:
	mov	0x4, %r14
	.word 0xf8f38e40  ! 1411: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0x8d9561f0  ! 1413: WRPR_PSTATE_I	wrpr	%r21, 0x01f0, %pstate
	.word 0xb5e4a0ed  ! 1414: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb77d6401  ! 1415: MOVR_I	movre	%r21, 0x1, %r27
	.word 0xb7e40000  ! 1416: SAVE_R	save	%r16, %r0, %r27
iob_intr_0_118:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_118), 16, 16)) -> intp(0, 0, 37)
iob_intr_0_119:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_119), 16, 16)) -> intp(0, 0, 33)
	.word 0xb9e48000  ! 1425: SAVE_R	save	%r18, %r0, %r28
	.word 0xbde4e188  ! 1426: SAVE_I	save	%r19, 0x0001, %r30
iob_intr_0_120:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_120), 16, 16)) -> intp(0, 0, 28)
	.word 0xb41560f8  ! 1428: OR_I	or 	%r21, 0x00f8, %r26
	.word 0xb7e5a10f  ! 1429: SAVE_I	save	%r22, 0x0001, %r27
T0_asi_reg_rd_60:
	mov	0x12, %r14
	.word 0xf4db8400  ! 1432: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb1e58000  ! 1433: SAVE_R	save	%r22, %r0, %r24
	.word 0xb9e44000  ! 1434: SAVE_R	save	%r17, %r0, %r28
	.word 0xbde48000  ! 1435: SAVE_R	save	%r18, %r0, %r30
iob_intr_0_121:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_121), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb3e56164  ! 1437: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbfe50000  ! 1438: SAVE_R	save	%r20, %r0, %r31
	.word 0xb9e40000  ! 1441: SAVE_R	save	%r16, %r0, %r28
	.word 0xb73ca001  ! 1442: SRA_I	sra 	%r18, 0x0001, %r27
cpu_intr_0_110:
	setx	0x2b0122, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_70:
	mov	0xf, %r14
	.word 0xf2f38e40  ! 1454: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb5e5a13f  ! 1455: SAVE_I	save	%r22, 0x0001, %r26
iob_intr_0_122:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_122), 16, 16)) -> intp(0, 0, 10)
cpu_intr_0_111:
	setx	0x2a0005, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_112:
	setx	0x2b0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde40000  ! 1462: SAVE_R	save	%r16, %r0, %r30
	.word 0xb3e4618e  ! 1467: SAVE_I	save	%r17, 0x0001, %r25
T0_asi_reg_rd_61:
	mov	0x3, %r14
	.word 0xf2db8400  ! 1470: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb3e5e00c  ! 1472: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbde40000  ! 1473: SAVE_R	save	%r16, %r0, %r30
T0_asi_reg_wr_71:
	mov	0x10, %r14
	.word 0xf4f389e0  ! 1474: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_0_113:
	setx	0x290220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72cf001  ! 1481: SLLX_I	sllx	%r19, 0x0001, %r27
	.word 0xb9e50000  ! 1483: SAVE_R	save	%r20, %r0, %r28
	.word 0xb7e4c000  ! 1484: SAVE_R	save	%r19, %r0, %r27
	.word 0xb7e5604b  ! 1485: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_wr_72:
	mov	0x3c5, %r14
	.word 0xfcf38e80  ! 1491: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb5e4e0cc  ! 1493: SAVE_I	save	%r19, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbb2d0000  ! 1497: SLL_R	sll 	%r20, %r0, %r29
	.word 0xbd641800  ! 1499: MOVcc_R	<illegal instruction>
iob_intr_0_123:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_123), 16, 16)) -> intp(0, 0, 17)
iob_intr_0_124:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_124), 16, 16)) -> intp(0, 0, d)
	.word 0xbfe52161  ! 1503: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_rd_62:
	mov	0x3c5, %r14
	.word 0xf0db84a0  ! 1507: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb1e421f6  ! 1509: SAVE_I	save	%r16, 0x0001, %r24
T0_asi_reg_wr_73:
	mov	0x2a, %r14
	.word 0xf6f38e80  ! 1511: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_0_114:
	setx	0x2b011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e521e2  ! 1516: SAVE_I	save	%r20, 0x0001, %r28
T0_asi_reg_wr_74:
	mov	0x1, %r14
	.word 0xfef38400  ! 1519: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_0_125:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_125), 16, 16)) -> intp(0, 0, c)
	.word 0xb9e4e1e9  ! 1521: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb7e4e01e  ! 1522: SAVE_I	save	%r19, 0x0001, %r27
iob_intr_0_126:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_126), 16, 16)) -> intp(0, 0, 9)
	.word 0xb0a5a1e0  ! 1525: SUBcc_I	subcc 	%r22, 0x01e0, %r24
	.word 0xbfe54000  ! 1526: SAVE_R	save	%r21, %r0, %r31
cpu_intr_0_115:
	setx	0x2a0320, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_127:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_127), 16, 16)) -> intp(0, 0, a)
	.word 0xbab50000  ! 1531: SUBCcc_R	orncc 	%r20, %r0, %r29
	.word 0xb5e460b6  ! 1532: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1e44000  ! 1533: SAVE_R	save	%r17, %r0, %r24
iob_intr_0_128:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_128), 16, 16)) -> intp(0, 0, 39)
iob_intr_0_129:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_129), 16, 16)) -> intp(0, 0, 2c)
T0_asi_reg_wr_75:
	mov	0xb, %r14
	.word 0xf4f38400  ! 1550: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbbe48000  ! 1551: SAVE_R	save	%r18, %r0, %r29
	.word 0xbfe5213b  ! 1552: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb244c000  ! 1555: ADDC_R	addc 	%r19, %r0, %r25
cpu_intr_0_116:
	setx	0x28023a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_130:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_130), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_rd_63:
	mov	0x3, %r14
	.word 0xfedb89e0  ! 1562: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbbe4a12b  ! 1563: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb3e52068  ! 1564: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb5e58000  ! 1566: SAVE_R	save	%r22, %r0, %r26
iob_intr_0_131:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_131), 16, 16)) -> intp(0, 0, 3a)
iob_intr_0_132:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_132), 16, 16)) -> intp(0, 0, b)
iob_intr_0_133:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_133), 16, 16)) -> intp(0, 0, 15)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9e4c000  ! 1577: SAVE_R	save	%r19, %r0, %r28
T0_asi_reg_rd_64:
	mov	0x2d, %r14
	.word 0xfadb89e0  ! 1578: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T0_asi_reg_rd_65:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 1579: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb7500000  ! 1580: RDPR_TPC	<illegal instruction>
	.word 0xa1902001  ! 1581: WRPR_GL_I	wrpr	%r0, 0x0001, %-
cpu_intr_0_117:
	setx	0x2a0202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb81ce11a  ! 1585: XOR_I	xor 	%r19, 0x011a, %r28
	.word 0xb13db001  ! 1589: SRAX_I	srax	%r22, 0x0001, %r24
cpu_intr_0_118:
	setx	0x28000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4c000  ! 1597: SAVE_R	save	%r19, %r0, %r31
	.word 0xb3e42127  ! 1598: SAVE_I	save	%r16, 0x0001, %r25
cpu_intr_0_119:
	setx	0x290010, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_120:
	setx	0x2a0122, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_121:
	setx	0x2a0206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb37dc400  ! 1604: MOVR_R	movre	%r23, %r0, %r25
	.word 0xbfe5a06c  ! 1606: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb3e4e1dc  ! 1608: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_wr_76:
	mov	0x14, %r14
	.word 0xf4f38e40  ! 1611: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_122:
	setx	0x28012c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_77:
	mov	0xd, %r14
	.word 0xf4f38e40  ! 1615: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbf2c7001  ! 1616: SLLX_I	sllx	%r17, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_78:
	mov	0x7, %r14
	.word 0xfcf384a0  ! 1622: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_0_123:
	setx	0x280026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e44000  ! 1632: SAVE_R	save	%r17, %r0, %r25
cpu_intr_0_124:
	setx	0x2a0308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5c000  ! 1637: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_125:
	setx	0x10129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e060  ! 1640: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_rd_66:
	mov	0x14, %r14
	.word 0xfedb8400  ! 1643: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb3e4e062  ! 1648: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_134:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_134), 16, 16)) -> intp(0, 0, 15)
	.word 0xbbe4e186  ! 1651: SAVE_I	save	%r19, 0x0001, %r29
iob_intr_0_135:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_135), 16, 16)) -> intp(0, 0, 33)
	.word 0xb1e5c000  ! 1654: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_wr_79:
	mov	0x3c3, %r14
	.word 0xfaf38400  ! 1657: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_0_126:
	setx	0x2a0019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e56020  ! 1659: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb5e54000  ! 1660: SAVE_R	save	%r21, %r0, %r26
	.word 0xbbe4e1fc  ! 1661: SAVE_I	save	%r19, 0x0001, %r29
cpu_intr_0_127:
	setx	0x28010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde42191  ! 1664: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbbe4201e  ! 1666: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbd2d6001  ! 1667: SLL_I	sll 	%r21, 0x0001, %r30
	.word 0xbde4a027  ! 1668: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbbe46074  ! 1670: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb3e5e06c  ! 1674: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_wr_80:
	mov	0x2, %r14
	.word 0xf2f38e40  ! 1676: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_rd_67:
	mov	0x4, %r14
	.word 0xf8db8e80  ! 1677: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T0_asi_reg_wr_81:
	mov	0xe, %r14
	.word 0xfcf38e80  ! 1678: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb3e5c000  ! 1679: SAVE_R	save	%r23, %r0, %r25
	.word 0xbfe4c000  ! 1680: SAVE_R	save	%r19, %r0, %r31
iob_intr_0_136:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_136), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb4b40000  ! 1685: ORNcc_R	orncc 	%r16, %r0, %r26
	.word 0xbcc521cd  ! 1686: ADDCcc_I	addccc 	%r20, 0x01cd, %r30
T0_asi_reg_rd_68:
	mov	0x34, %r14
	.word 0xf0db84a0  ! 1689: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_0_128:
	setx	0x29010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e521b6  ! 1697: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbde48000  ! 1702: SAVE_R	save	%r18, %r0, %r30
	.word 0xb5e44000  ! 1703: SAVE_R	save	%r17, %r0, %r26
	.word 0xbfe40000  ! 1706: SAVE_R	save	%r16, %r0, %r31
cpu_intr_0_129:
	setx	0x280318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 1711: SAVE_R	save	%r20, %r0, %r27
iob_intr_0_137:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_137), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb28c0000  ! 1713: ANDcc_R	andcc 	%r16, %r0, %r25
	.word 0xbfe44000  ! 1715: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_138:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_138), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_wr_82:
	mov	0x8, %r14
	.word 0xf2f38e40  ! 1719: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_0_130:
	setx	0x290023, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_139:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_139), 16, 16)) -> intp(0, 0, d)
	.word 0xb7e48000  ! 1725: SAVE_R	save	%r18, %r0, %r27
	.word 0xbfe50000  ! 1726: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_wr_83:
	mov	0x3c1, %r14
	.word 0xf2f389e0  ! 1727: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbde4a0e6  ! 1731: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbbe4c000  ! 1732: SAVE_R	save	%r19, %r0, %r29
	.word 0xb1e5e0b9  ! 1733: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3e50000  ! 1734: SAVE_R	save	%r20, %r0, %r25
	.word 0xb3350000  ! 1735: SRL_R	srl 	%r20, %r0, %r25
cpu_intr_0_131:
	setx	0x2b0022, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_69:
	mov	0x3c3, %r14
	.word 0xf8db84a0  ! 1740: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T0_asi_reg_wr_84:
	mov	0x3c6, %r14
	.word 0xf2f384a0  ! 1744: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb5e48000  ! 1745: SAVE_R	save	%r18, %r0, %r26
	.word 0xbde46148  ! 1746: SAVE_I	save	%r17, 0x0001, %r30
T0_asi_reg_rd_70:
	mov	0x3c1, %r14
	.word 0xfadb89e0  ! 1747: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb7508000  ! 1750: RDPR_TSTATE	<illegal instruction>
iob_intr_0_140:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_140), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb5e50000  ! 1755: SAVE_R	save	%r20, %r0, %r26
	.word 0xbfe54000  ! 1757: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_141:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_141), 16, 16)) -> intp(0, 0, 11)
	.word 0xbfe4e079  ! 1762: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_142:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_142), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_rd_71:
	mov	0x3c3, %r14
	.word 0xfcdb84a0  ! 1767: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_0_132:
	setx	0x2b000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5c000  ! 1770: SAVE_R	save	%r23, %r0, %r25
T0_asi_reg_wr_85:
	mov	0x5, %r14
	.word 0xf8f38e40  ! 1775: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_133:
	setx	0x2a0331, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_86:
	mov	0xb, %r14
	.word 0xf4f38e60  ! 1785: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_0_143:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_143), 16, 16)) -> intp(0, 0, 3)
iob_intr_0_144:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_144), 16, 16)) -> intp(0, 0, 1)
	.word 0xb3e520b9  ! 1789: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xba350000  ! 1791: SUBC_R	orn 	%r20, %r0, %r29
cpu_intr_0_134:
	setx	0x290133, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_72:
	mov	0xa, %r14
	.word 0xfadb8e60  ! 1797: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbbe4e1ef  ! 1800: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb1e48000  ! 1802: SAVE_R	save	%r18, %r0, %r24
	.word 0xbde44000  ! 1806: SAVE_R	save	%r17, %r0, %r30
	.word 0xbbe5e118  ! 1807: SAVE_I	save	%r23, 0x0001, %r29
T0_asi_reg_rd_73:
	mov	0x31, %r14
	.word 0xf0db89e0  ! 1812: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbd346001  ! 1814: SRL_I	srl 	%r17, 0x0001, %r30
	.word 0xb9e4c000  ! 1816: SAVE_R	save	%r19, %r0, %r28
	.word 0xb4a44000  ! 1822: SUBcc_R	subcc 	%r17, %r0, %r26
T0_asi_reg_rd_74:
	mov	0x20, %r14
	.word 0xf0db8400  ! 1823: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb9e4200b  ! 1824: SAVE_I	save	%r16, 0x0001, %r28
T0_asi_reg_rd_75:
	mov	0x18, %r14
	.word 0xf2db89e0  ! 1830: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb17c2401  ! 1831: MOVR_I	movre	%r16, 0x1, %r24
	.word 0xbde44000  ! 1833: SAVE_R	save	%r17, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_87:
	mov	0x35, %r14
	.word 0xfef38e40  ! 1836: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_rd_76:
	mov	0x3, %r14
	.word 0xf4db84a0  ! 1837: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb1346001  ! 1838: SRL_I	srl 	%r17, 0x0001, %r24
T0_asi_reg_rd_77:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 1841: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_wr_88:
	mov	0xb, %r14
	.word 0xf8f38e40  ! 1842: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_wr_89:
	mov	0x2e, %r14
	.word 0xfef384a0  ! 1846: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_0_145:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_145), 16, 16)) -> intp(0, 0, 3a)
	.word 0xbb3db001  ! 1850: SRAX_I	srax	%r22, 0x0001, %r29
iob_intr_0_146:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_146), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_rd_78:
	mov	0x1c, %r14
	.word 0xf8db8e40  ! 1856: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbd7cc400  ! 1858: MOVR_R	movre	%r19, %r0, %r30
	.word 0xb5e58000  ! 1859: SAVE_R	save	%r22, %r0, %r26
	.word 0xbbe4a022  ! 1862: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb7e5e012  ! 1863: SAVE_I	save	%r23, 0x0001, %r27
iob_intr_0_147:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_147), 16, 16)) -> intp(0, 0, 38)
	.word 0xb3e48000  ! 1867: SAVE_R	save	%r18, %r0, %r25
	.word 0xbbe44000  ! 1868: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_rd_79:
	mov	0x3c7, %r14
	.word 0xfedb8e40  ! 1870: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb1e4a1f8  ! 1871: SAVE_I	save	%r18, 0x0001, %r24
iob_intr_0_148:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_148), 16, 16)) -> intp(0, 0, 32)
	.word 0xb52c2001  ! 1873: SLL_I	sll 	%r16, 0x0001, %r26
	.word 0xb3e48000  ! 1874: SAVE_R	save	%r18, %r0, %r25
iob_intr_0_149:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_149), 16, 16)) -> intp(0, 0, 3b)
iob_intr_0_150:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_150), 16, 16)) -> intp(0, 0, 10)
cpu_intr_0_135:
	setx	0x2d0034, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_151:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_151), 16, 16)) -> intp(0, 0, 20)
cpu_intr_0_136:
	setx	0x2d031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4c000  ! 1890: SAVE_R	save	%r19, %r0, %r25
	.word 0xb9e58000  ! 1891: SAVE_R	save	%r22, %r0, %r28
	.word 0xb7e4c000  ! 1892: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_rd_80:
	mov	0x1, %r14
	.word 0xf0db8e80  ! 1895: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb3e50000  ! 1897: SAVE_R	save	%r20, %r0, %r25
T0_asi_reg_rd_81:
	mov	0xe, %r14
	.word 0xf2db8e80  ! 1898: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_0_152:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_152), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb9e40000  ! 1901: SAVE_R	save	%r16, %r0, %r28
T0_asi_reg_wr_90:
	mov	0x2e, %r14
	.word 0xfaf389e0  ! 1908: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_0_137:
	setx	0x2c0224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e150  ! 1910: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb9e421e8  ! 1912: SAVE_I	save	%r16, 0x0001, %r28
iob_intr_0_153:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_153), 16, 16)) -> intp(0, 0, 17)
	.word 0xb294a1fa  ! 1915: ORcc_I	orcc 	%r18, 0x01fa, %r25
	.word 0xb2b5a1a7  ! 1916: SUBCcc_I	orncc 	%r22, 0x01a7, %r25
	.word 0xb414c000  ! 1917: OR_R	or 	%r19, %r0, %r26
T0_asi_reg_wr_91:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 1918: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_0_154:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_154), 16, 16)) -> intp(0, 0, 11)
cpu_intr_0_138:
	setx	0x2e020a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_139:
	setx	0x2f0117, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_140:
	setx	0x2f023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e40000  ! 1932: SAVE_R	save	%r16, %r0, %r28
T0_asi_reg_wr_92:
	mov	0x8, %r14
	.word 0xfaf38e40  ! 1934: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_155:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_155), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb1643801  ! 1936: MOVcc_I	<illegal instruction>
	.word 0xba85c000  ! 1937: ADDcc_R	addcc 	%r23, %r0, %r29
cpu_intr_0_141:
	setx	0x2d031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4610a  ! 1943: SAVE_I	save	%r17, 0x0001, %r29
T0_asi_reg_rd_82:
	mov	0x25, %r14
	.word 0xf8db8e80  ! 1944: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb5e58000  ! 1947: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_wr_93:
	mov	0x1e, %r14
	.word 0xfcf384a0  ! 1953: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_0_142:
	setx	0x2e0021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe8520a0  ! 1956: ADDcc_I	addcc 	%r20, 0x00a0, %r31
	.word 0xbbe54000  ! 1957: SAVE_R	save	%r21, %r0, %r29
	.word 0xbbe54000  ! 1959: SAVE_R	save	%r21, %r0, %r29
	.word 0xbbe58000  ! 1961: SAVE_R	save	%r22, %r0, %r29
cpu_intr_0_143:
	setx	0x2c0103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe561c0  ! 1964: SAVE_I	save	%r21, 0x0001, %r29
T0_asi_reg_wr_94:
	mov	0x3c4, %r14
	.word 0xf6f38e80  ! 1965: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb1e5c000  ! 1967: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_wr_95:
	mov	0x1a, %r14
	.word 0xf2f384a0  ! 1968: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb5e54000  ! 1969: SAVE_R	save	%r21, %r0, %r26
cpu_intr_0_144:
	setx	0x2c0025, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_96:
	mov	0x3c4, %r14
	.word 0xfaf38e40  ! 1972: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbfe5e031  ! 1974: SAVE_I	save	%r23, 0x0001, %r31
iob_intr_0_156:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_156), 16, 16)) -> intp(0, 0, 4)
	.word 0xb5e4e1c6  ! 1976: SAVE_I	save	%r19, 0x0001, %r26
iob_intr_0_157:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_157), 16, 16)) -> intp(0, 0, 28)
cpu_intr_0_145:
	setx	0x2c0324, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_146:
	setx	0x2d010d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_97:
	mov	0x3c5, %r14
	.word 0xf2f38e60  ! 1980: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb3e5a1e7  ! 1982: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_147:
	setx	0x2d0037, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_148:
	setx	0x2c0007, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_158:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_158), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_rd_83:
	mov	0x27, %r14
	.word 0xfedb8400  ! 1988: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_0_149:
	setx	0x2d002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e56057  ! 1992: SAVE_I	save	%r21, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_98:
	mov	0x6, %r14
	.word 0xf0f38e60  ! 1994: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb2b4a16a  ! 1995: SUBCcc_I	orncc 	%r18, 0x016a, %r25
	.word 0xb5e5c000  ! 1997: SAVE_R	save	%r23, %r0, %r26
cpu_intr_0_150:
	setx	0x2c0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e014  ! 1999: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb7e58000  ! 2002: SAVE_R	save	%r22, %r0, %r27
iob_intr_0_159:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_159), 16, 16)) -> intp(0, 0, 11)
T0_asi_reg_wr_99:
	mov	0x1f, %r14
	.word 0xfcf38e60  ! 2009: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T0_asi_reg_rd_84:
	mov	0x3c6, %r14
	.word 0xf0db8400  ! 2010: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_0_151:
	setx	0x2d0323, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_152:
	setx	0x2c0200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 2017: SAVE_R	save	%r21, %r0, %r27
	.word 0xbfe5a14f  ! 2019: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e54000  ! 2020: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_rd_85:
	mov	0x25, %r14
	.word 0xfcdb8e40  ! 2021: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb5e5a1e6  ! 2022: SAVE_I	save	%r22, 0x0001, %r26
cpu_intr_0_153:
	setx	0x2c0125, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_160:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_160), 16, 16)) -> intp(0, 0, 0)
	.word 0xbbe521a8  ! 2025: SAVE_I	save	%r20, 0x0001, %r29
cpu_intr_0_154:
	setx	0x2d0327, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_100:
	mov	0x22, %r14
	.word 0xfef38e60  ! 2028: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb5e40000  ! 2029: SAVE_R	save	%r16, %r0, %r26
	.word 0xbfe5c000  ! 2033: SAVE_R	save	%r23, %r0, %r31
cpu_intr_0_155:
	setx	0x2d0025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe58000  ! 2039: SAVE_R	save	%r22, %r0, %r29
T0_asi_reg_rd_86:
	mov	0x3c0, %r14
	.word 0xf2db84a0  ! 2040: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb1e4a0e7  ! 2042: SAVE_I	save	%r18, 0x0001, %r24
iob_intr_0_161:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_161), 16, 16)) -> intp(0, 0, 3)
iob_intr_0_162:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_162), 16, 16)) -> intp(0, 0, 29)
	.word 0xbfe58000  ! 2052: SAVE_R	save	%r22, %r0, %r31
	.word 0xb5e4617c  ! 2053: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbbe44000  ! 2056: SAVE_R	save	%r17, %r0, %r29
iob_intr_0_163:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_163), 16, 16)) -> intp(0, 0, 12)
T0_asi_reg_wr_101:
	mov	0x3c2, %r14
	.word 0xfef38e60  ! 2060: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb3e4c000  ! 2062: SAVE_R	save	%r19, %r0, %r25
	.word 0xb3e4e0bd  ! 2063: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_164:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_164), 16, 16)) -> intp(0, 0, 22)
	.word 0x9195e1b9  ! 2067: WRPR_PIL_I	wrpr	%r23, 0x01b9, %pil
iob_intr_0_165:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_165), 16, 16)) -> intp(0, 0, 2)
	.word 0xb5e54000  ! 2069: SAVE_R	save	%r21, %r0, %r26
	.word 0xb9e42173  ! 2070: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbde5612e  ! 2072: SAVE_I	save	%r21, 0x0001, %r30
T0_asi_reg_wr_102:
	mov	0x4, %r14
	.word 0xf4f38e40  ! 2074: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbfe46189  ! 2075: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb7e50000  ! 2076: SAVE_R	save	%r20, %r0, %r27
T0_asi_reg_rd_87:
	mov	0x32, %r14
	.word 0xf4db8e60  ! 2080: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T0_asi_reg_wr_103:
	mov	0x3c2, %r14
	.word 0xf4f384a0  ! 2081: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbfe4a11f  ! 2086: SAVE_I	save	%r18, 0x0001, %r31
iob_intr_0_166:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_166), 16, 16)) -> intp(0, 0, 23)
	.word 0xbde5a13d  ! 2091: SAVE_I	save	%r22, 0x0001, %r30
iob_intr_0_167:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_167), 16, 16)) -> intp(0, 0, 35)
	.word 0xb1e58000  ! 2095: SAVE_R	save	%r22, %r0, %r24
	.word 0xb8c40000  ! 2097: ADDCcc_R	addccc 	%r16, %r0, %r28
	.word 0xbaa4e0a2  ! 2101: SUBcc_I	subcc 	%r19, 0x00a2, %r29
iob_intr_0_168:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_168), 16, 16)) -> intp(0, 0, a)
	.word 0xb5e58000  ! 2104: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_rd_88:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 2107: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb9e58000  ! 2108: SAVE_R	save	%r22, %r0, %r28
iob_intr_0_169:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_169), 16, 16)) -> intp(0, 0, 34)
	.word 0xbfe4206c  ! 2110: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb1e40000  ! 2112: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_156:
	setx	0x2d003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e50000  ! 2116: SAVE_R	save	%r20, %r0, %r26
	.word 0xbbe4a024  ! 2117: SAVE_I	save	%r18, 0x0001, %r29
iob_intr_0_170:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_170), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_wr_104:
	mov	0x3c3, %r14
	.word 0xf0f38e40  ! 2121: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb4952016  ! 2122: ORcc_I	orcc 	%r20, 0x0016, %r26
cpu_intr_0_157:
	setx	0x2e013c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_171:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_171), 16, 16)) -> intp(0, 0, 6)
cpu_intr_0_158:
	setx	0x2e000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e1d4  ! 2127: SAVE_I	save	%r19, 0x0001, %r31
cpu_intr_0_159:
	setx	0x2c0110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0040000  ! 2129: ADD_R	add 	%r16, %r0, %r24
iob_intr_0_172:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_172), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_173:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_173), 16, 16)) -> intp(0, 0, 37)
iob_intr_0_174:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_174), 16, 16)) -> intp(0, 0, 22)
T0_asi_reg_rd_89:
	mov	0x10, %r14
	.word 0xf8db8e40  ! 2140: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_0_175:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_175), 16, 16)) -> intp(0, 0, 2d)
iob_intr_0_176:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_176), 16, 16)) -> intp(0, 0, 1c)
cpu_intr_0_160:
	setx	0x2f0123, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_90:
	mov	0xa, %r14
	.word 0xfcdb8e40  ! 2146: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_161:
	setx	0x2c021e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_105:
	mov	0x3c1, %r14
	.word 0xfcf384a0  ! 2149: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T0_asi_reg_wr_106:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 2150: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbe8d8000  ! 2152: ANDcc_R	andcc 	%r22, %r0, %r31
	.word 0xb9e4216d  ! 2156: SAVE_I	save	%r16, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe54000  ! 2161: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_177:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_177), 16, 16)) -> intp(0, 0, 36)
	.word 0xb5e54000  ! 2171: SAVE_R	save	%r21, %r0, %r26
	.word 0xb3e44000  ! 2173: SAVE_R	save	%r17, %r0, %r25
iob_intr_0_178:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_178), 16, 16)) -> intp(0, 0, 32)
	.word 0xb7e48000  ! 2177: SAVE_R	save	%r18, %r0, %r27
cpu_intr_0_162:
	setx	0x2f0335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe40000  ! 2183: SAVE_R	save	%r16, %r0, %r29
cpu_intr_0_163:
	setx	0x2f021a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_91:
	mov	0x2c, %r14
	.word 0xf0db8e60  ! 2186: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbbe48000  ! 2187: SAVE_R	save	%r18, %r0, %r29
	.word 0xb9e40000  ! 2188: SAVE_R	save	%r16, %r0, %r28
	.word 0xb3e40000  ! 2189: SAVE_R	save	%r16, %r0, %r25
	.word 0xb5e50000  ! 2190: SAVE_R	save	%r20, %r0, %r26
	.word 0xbde421ee  ! 2195: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb7e54000  ! 2196: SAVE_R	save	%r21, %r0, %r27
iob_intr_0_179:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_179), 16, 16)) -> intp(0, 0, 20)
	.word 0xb3e521ec  ! 2200: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_wr_107:
	mov	0x3c2, %r14
	.word 0xf0f38e80  ! 2204: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb9e5a1c5  ! 2206: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7e48000  ! 2210: SAVE_R	save	%r18, %r0, %r27
	.word 0xb73c3001  ! 2211: SRAX_I	srax	%r16, 0x0001, %r27
T0_asi_reg_wr_108:
	mov	0x3c7, %r14
	.word 0xfaf38e40  ! 2214: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbde54000  ! 2216: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_180:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_180), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbc9de04e  ! 2218: XORcc_I	xorcc 	%r23, 0x004e, %r30
T0_asi_reg_wr_109:
	mov	0x3, %r14
	.word 0xf2f38e40  ! 2219: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb7e5e1d8  ! 2220: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb7e4a0cb  ! 2222: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3e48000  ! 2223: SAVE_R	save	%r18, %r0, %r25
	.word 0xb1348000  ! 2225: SRL_R	srl 	%r18, %r0, %r24
	.word 0xb92c9000  ! 2227: SLLX_R	sllx	%r18, %r0, %r28
T0_asi_reg_wr_110:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 2232: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbde48000  ! 2233: SAVE_R	save	%r18, %r0, %r30
iob_intr_0_181:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_181), 16, 16)) -> intp(0, 0, 1)
	.word 0xb3e44000  ! 2238: SAVE_R	save	%r17, %r0, %r25
	.word 0xbde5e1fd  ! 2241: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb3e42036  ! 2243: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_rd_92:
	mov	0x23, %r14
	.word 0xf0db8e40  ! 2245: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_rd_93:
	mov	0x10, %r14
	.word 0xfedb8400  ! 2246: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_182:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_182), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_wr_111:
	mov	0x15, %r14
	.word 0xf2f38e80  ! 2251: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_0_164:
	setx	0x2f0011, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_94:
	mov	0x0, %r14
	.word 0xfedb8e60  ! 2263: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb9e4e1a1  ! 2266: SAVE_I	save	%r19, 0x0001, %r28
iob_intr_0_183:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_183), 16, 16)) -> intp(0, 0, 38)
cpu_intr_0_165:
	setx	0x2d0036, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_95:
	mov	0x13, %r14
	.word 0xf6db8e40  ! 2270: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbc442089  ! 2271: ADDC_I	addc 	%r16, 0x0089, %r30
	.word 0xb9e46118  ! 2272: SAVE_I	save	%r17, 0x0001, %r28
T0_asi_reg_rd_96:
	mov	0x38, %r14
	.word 0xf4db8e80  ! 2273: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T0_asi_reg_rd_97:
	mov	0x29, %r14
	.word 0xfcdb8e60  ! 2275: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb1e4e163  ! 2276: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbfe4c000  ! 2277: SAVE_R	save	%r19, %r0, %r31
iob_intr_0_184:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_184), 16, 16)) -> intp(0, 0, 6)
cpu_intr_0_166:
	setx	0x310208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53d3001  ! 2285: SRAX_I	srax	%r20, 0x0001, %r26
	.word 0xb9e52189  ! 2288: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbbe50000  ! 2289: SAVE_R	save	%r20, %r0, %r29
cpu_intr_0_167:
	setx	0x330039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeb5217a  ! 2292: ORNcc_I	orncc 	%r20, 0x017a, %r31
	.word 0xb7e4e02f  ! 2293: SAVE_I	save	%r19, 0x0001, %r27
iob_intr_0_185:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_185), 16, 16)) -> intp(0, 0, 3)
iob_intr_0_186:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_186), 16, 16)) -> intp(0, 0, 8)
	.word 0xbde4c000  ! 2296: SAVE_R	save	%r19, %r0, %r30
	.word 0xbcc4a1d8  ! 2297: ADDCcc_I	addccc 	%r18, 0x01d8, %r30
	.word 0xb3e5a148  ! 2301: SAVE_I	save	%r22, 0x0001, %r25
iob_intr_0_187:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_187), 16, 16)) -> intp(0, 0, 3)
T0_asi_reg_wr_112:
	mov	0x1e, %r14
	.word 0xfaf38e40  ! 2303: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_wr_113:
	mov	0x36, %r14
	.word 0xfcf38400  ! 2307: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_0_188:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_188), 16, 16)) -> intp(0, 0, 1d)
	.word 0xbfe560f0  ! 2313: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbfe50000  ! 2315: SAVE_R	save	%r20, %r0, %r31
	.word 0xb485c000  ! 2317: ADDcc_R	addcc 	%r23, %r0, %r26
	.word 0xbde50000  ! 2318: SAVE_R	save	%r20, %r0, %r30
	.word 0xb3e4e199  ! 2322: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_189:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_189), 16, 16)) -> intp(0, 0, 22)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_114:
	mov	0xf, %r14
	.word 0xf4f38e40  ! 2327: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_0_190:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_190), 16, 16)) -> intp(0, 0, 23)
cpu_intr_0_168:
	setx	0x320133, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_115:
	mov	0x9, %r14
	.word 0xf4f38e40  ! 2331: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_wr_116:
	mov	0x31, %r14
	.word 0xfaf38e40  ! 2333: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_191:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_191), 16, 16)) -> intp(0, 0, 12)
	.word 0xb7e52020  ! 2338: SAVE_I	save	%r20, 0x0001, %r27
iob_intr_0_192:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_192), 16, 16)) -> intp(0, 0, 37)
	.word 0xb1e561d5  ! 2342: SAVE_I	save	%r21, 0x0001, %r24
T0_asi_reg_rd_98:
	mov	0x1, %r14
	.word 0xfadb84a0  ! 2348: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T0_asi_reg_rd_99:
	mov	0x3c1, %r14
	.word 0xfadb89e0  ! 2350: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_0_169:
	setx	0x32031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe40000  ! 2357: SAVE_R	save	%r16, %r0, %r29
cpu_intr_0_170:
	setx	0x330039, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_171:
	setx	0x30010c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_172:
	setx	0x320237, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_193:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_193), 16, 16)) -> intp(0, 0, 12)
iob_intr_0_194:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_194), 16, 16)) -> intp(0, 0, 3d)
iob_intr_0_195:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_195), 16, 16)) -> intp(0, 0, b)
	.word 0xbbe50000  ! 2372: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_196:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_196), 16, 16)) -> intp(0, 0, 1)
	.word 0xb5e48000  ! 2375: SAVE_R	save	%r18, %r0, %r26
cpu_intr_0_173:
	setx	0x300008, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_174:
	setx	0x320302, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_175:
	setx	0x320317, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_197:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_197), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb5e4e0d0  ! 2384: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_rd_100:
	mov	0x17, %r14
	.word 0xf8db89e0  ! 2385: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T0_asi_reg_rd_101:
	mov	0x3c8, %r14
	.word 0xf0db8400  ! 2387: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde58000  ! 2393: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_176:
	setx	0x31012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4611d  ! 2398: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbfe58000  ! 2399: SAVE_R	save	%r22, %r0, %r31
iob_intr_0_198:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_198), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_rd_102:
	mov	0x18, %r14
	.word 0xf4db84a0  ! 2401: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb9e4a01a  ! 2402: SAVE_I	save	%r18, 0x0001, %r28
iob_intr_0_199:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_199), 16, 16)) -> intp(0, 0, 1a)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe40000  ! 2407: SAVE_R	save	%r16, %r0, %r31
	.word 0xb9e4a0e9  ! 2409: SAVE_I	save	%r18, 0x0001, %r28
cpu_intr_0_177:
	setx	0x320001, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_117:
	mov	0x2c, %r14
	.word 0xfaf38e60  ! 2412: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_0_200:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_200), 16, 16)) -> intp(0, 0, d)
cpu_intr_0_178:
	setx	0x30030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_103:
	mov	0x3c0, %r14
	.word 0xfedb84a0  ! 2420: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_0_201:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_201), 16, 16)) -> intp(0, 0, 3b)
iob_intr_0_202:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_202), 16, 16)) -> intp(0, 0, 1a)
T0_asi_reg_wr_118:
	mov	0x3c3, %r14
	.word 0xfcf38e40  ! 2424: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_179:
	setx	0x31023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_104:
	mov	0x3c0, %r14
	.word 0xf8db84a0  ! 2428: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T0_asi_reg_wr_119:
	mov	0x2b, %r14
	.word 0xf0f38e40  ! 2430: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb52d5000  ! 2431: SLLX_R	sllx	%r21, %r0, %r26
cpu_intr_0_180:
	setx	0x320213, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_105:
	mov	0x21, %r14
	.word 0xf0db89e0  ! 2436: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbcbd0000  ! 2437: XNORcc_R	xnorcc 	%r20, %r0, %r30
T0_asi_reg_rd_106:
	mov	0x3c1, %r14
	.word 0xf2db8e80  ! 2438: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_0_203:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_203), 16, 16)) -> intp(0, 0, 13)
iob_intr_0_204:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_204), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb5e58000  ! 2443: SAVE_R	save	%r22, %r0, %r26
	.word 0xbfe44000  ! 2444: SAVE_R	save	%r17, %r0, %r31
cpu_intr_0_181:
	setx	0x310323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e48000  ! 2447: SAVE_R	save	%r18, %r0, %r24
T0_asi_reg_rd_107:
	mov	0x3c4, %r14
	.word 0xf8db8e40  ! 2449: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_182:
	setx	0x30030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4c000  ! 2454: SAVE_R	save	%r19, %r0, %r25
T0_asi_reg_wr_120:
	mov	0x3c4, %r14
	.word 0xf0f38400  ! 2460: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb8346179  ! 2462: ORN_I	orn 	%r17, 0x0179, %r28
	.word 0xb3e4210f  ! 2464: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb9e4e1cb  ! 2465: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbde5c000  ! 2467: SAVE_R	save	%r23, %r0, %r30
T0_asi_reg_wr_121:
	mov	0x33, %r14
	.word 0xfaf38400  ! 2468: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_0_183:
	setx	0x310020, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_184:
	setx	0x30001e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_185:
	setx	0x300325, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_205:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_205), 16, 16)) -> intp(0, 0, 11)
	.word 0xbbe5e000  ! 2475: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb405a15e  ! 2477: ADD_I	add 	%r22, 0x015e, %r26
	.word 0xbd34d000  ! 2478: SRLX_R	srlx	%r19, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb80560c8  ! 2482: ADD_I	add 	%r21, 0x00c8, %r28
cpu_intr_0_186:
	setx	0x310335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a00a  ! 2485: SAVE_I	save	%r18, 0x0001, %r25
cpu_intr_0_187:
	setx	0x32002c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_188:
	setx	0x300206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde48000  ! 2489: SAVE_R	save	%r18, %r0, %r30
	.word 0xb1e5c000  ! 2490: SAVE_R	save	%r23, %r0, %r24
	.word 0xb9e421b2  ! 2491: SAVE_I	save	%r16, 0x0001, %r28
cpu_intr_0_189:
	setx	0x300018, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_108:
	mov	0x3c8, %r14
	.word 0xf6db8e40  ! 2497: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xba0cc000  ! 2503: AND_R	and 	%r19, %r0, %r29
	.word 0xb7641800  ! 2505: MOVcc_R	<illegal instruction>
T0_asi_reg_rd_109:
	mov	0x3c2, %r14
	.word 0xf4db8e60  ! 2506: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T0_asi_reg_rd_110:
	mov	0x2, %r14
	.word 0xf6db8e60  ! 2507: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_0_206:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_206), 16, 16)) -> intp(0, 0, a)
T0_asi_reg_wr_122:
	mov	0x9, %r14
	.word 0xfaf38e80  ! 2510: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T0_asi_reg_wr_123:
	mov	0x3c3, %r14
	.word 0xf4f38e60  ! 2511: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_0_190:
	setx	0x30023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe50000  ! 2513: SAVE_R	save	%r20, %r0, %r31
	.word 0xbbe44000  ! 2515: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_rd_111:
	mov	0xb, %r14
	.word 0xf6db89e0  ! 2516: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_0_207:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_207), 16, 16)) -> intp(0, 0, 28)
cpu_intr_0_191:
	setx	0x310213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe50000  ! 2525: SAVE_R	save	%r20, %r0, %r31
	.word 0xb3e520f3  ! 2527: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbfe5c000  ! 2528: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_208:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_208), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb3e5e19c  ! 2532: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb37c0400  ! 2538: MOVR_R	movre	%r16, %r0, %r25
iob_intr_0_209:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_209), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_rd_112:
	mov	0x1d, %r14
	.word 0xfedb8e40  ! 2540: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb9e50000  ! 2545: SAVE_R	save	%r20, %r0, %r28
T0_asi_reg_rd_113:
	mov	0x12, %r14
	.word 0xfedb8400  ! 2547: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_0_210:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_210), 16, 16)) -> intp(0, 0, 2d)
iob_intr_0_211:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_211), 16, 16)) -> intp(0, 0, 11)
cpu_intr_0_192:
	setx	0x30010d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_212:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_212), 16, 16)) -> intp(0, 0, 3d)
T0_asi_reg_rd_114:
	mov	0x32, %r14
	.word 0xfadb8400  ! 2555: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb7e56113  ! 2557: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb335f001  ! 2558: SRLX_I	srlx	%r23, 0x0001, %r25
	.word 0xb3e58000  ! 2559: SAVE_R	save	%r22, %r0, %r25
T0_asi_reg_wr_124:
	mov	0x1, %r14
	.word 0xf4f38e40  ! 2560: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_193:
	setx	0x330310, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_213:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_213), 16, 16)) -> intp(0, 0, 1a)
iob_intr_0_214:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_214), 16, 16)) -> intp(0, 0, 27)
iob_intr_0_215:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_215), 16, 16)) -> intp(0, 0, 29)
	.word 0xb01c8000  ! 2565: XOR_R	xor 	%r18, %r0, %r24
	.word 0xb9e5e19a  ! 2570: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e56100  ! 2571: SAVE_I	save	%r21, 0x0001, %r27
iob_intr_0_216:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_216), 16, 16)) -> intp(0, 0, 1a)
	.word 0xbfe5e05d  ! 2574: SAVE_I	save	%r23, 0x0001, %r31
iob_intr_0_217:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_217), 16, 16)) -> intp(0, 0, 24)
	.word 0xb7e50000  ! 2581: SAVE_R	save	%r20, %r0, %r27
	.word 0xb1e44000  ! 2583: SAVE_R	save	%r17, %r0, %r24
cpu_intr_0_194:
	setx	0x30011c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_218:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_218), 16, 16)) -> intp(0, 0, a)
	.word 0xbbe52171  ! 2588: SAVE_I	save	%r20, 0x0001, %r29
cpu_intr_0_195:
	setx	0x300039, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_196:
	setx	0x30000b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_197:
	setx	0x310336, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_219:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_219), 16, 16)) -> intp(0, 0, 39)
iob_intr_0_220:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_220), 16, 16)) -> intp(0, 0, 3d)
T0_asi_reg_rd_115:
	mov	0x26, %r14
	.word 0xf8db8e60  ! 2598: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T0_asi_reg_wr_125:
	mov	0x2d, %r14
	.word 0xfef38e40  ! 2601: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_0_221:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_221), 16, 16)) -> intp(0, 0, 2d)
T0_asi_reg_rd_116:
	mov	0x0, %r14
	.word 0xf2db8e80  ! 2606: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_0_222:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_222), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb1e58000  ! 2611: SAVE_R	save	%r22, %r0, %r24
	.word 0xb7e4a142  ! 2613: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_wr_126:
	mov	0x3c6, %r14
	.word 0xfcf38e40  ! 2614: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb3e4c000  ! 2615: SAVE_R	save	%r19, %r0, %r25
	.word 0xb614c000  ! 2617: OR_R	or 	%r19, %r0, %r27
iob_intr_0_223:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_223), 16, 16)) -> intp(0, 0, 8)
	.word 0xbde5a01a  ! 2622: SAVE_I	save	%r22, 0x0001, %r30
cpu_intr_0_198:
	setx	0x330333, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_224:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_224), 16, 16)) -> intp(0, 0, 38)
	.word 0xb1e58000  ! 2627: SAVE_R	save	%r22, %r0, %r24
	.word 0xb5e48000  ! 2628: SAVE_R	save	%r18, %r0, %r26
cpu_intr_0_199:
	setx	0x33010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e08f  ! 2632: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_225:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_225), 16, 16)) -> intp(0, 0, 28)
	.word 0xb7e5604d  ! 2634: SAVE_I	save	%r21, 0x0001, %r27
iob_intr_0_226:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_226), 16, 16)) -> intp(0, 0, 19)
T0_asi_reg_rd_117:
	mov	0x3c0, %r14
	.word 0xfadb84a0  ! 2639: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbbe58000  ! 2640: SAVE_R	save	%r22, %r0, %r29
T0_asi_reg_wr_127:
	mov	0x26, %r14
	.word 0xfcf38e40  ! 2641: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbf2d7001  ! 2642: SLLX_I	sllx	%r21, 0x0001, %r31
	.word 0xbbe40000  ! 2645: SAVE_R	save	%r16, %r0, %r29
cpu_intr_0_200:
	setx	0x30003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_201:
	setx	0x300030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb02ce152  ! 2651: ANDN_I	andn 	%r19, 0x0152, %r24
iob_intr_0_227:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_227), 16, 16)) -> intp(0, 0, 24)
	.word 0xb7e5a150  ! 2656: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb5e46187  ! 2661: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_202:
	setx	0x30021e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_203:
	setx	0x30030e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_128:
	mov	0x13, %r14
	.word 0xfaf38e80  ! 2666: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbbe4e0f6  ! 2668: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbde5a030  ! 2669: SAVE_I	save	%r22, 0x0001, %r30
iob_intr_0_228:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_228), 16, 16)) -> intp(0, 0, 27)
iob_intr_0_229:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_229), 16, 16)) -> intp(0, 0, 3d)
cpu_intr_0_204:
	setx	0x31001b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_205:
	setx	0x310318, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_206:
	setx	0x32013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde40000  ! 2678: SAVE_R	save	%r16, %r0, %r30
	.word 0xb7e4c000  ! 2679: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_rd_118:
	mov	0x2a, %r14
	.word 0xfadb8e40  ! 2683: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_207:
	setx	0x330022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf34e001  ! 2685: SRL_I	srl 	%r19, 0x0001, %r31
	.word 0xbde48000  ! 2686: SAVE_R	save	%r18, %r0, %r30
	.word 0xb3e46184  ! 2687: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe5e0d5  ! 2689: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbe1da131  ! 2691: XOR_I	xor 	%r22, 0x0131, %r31
T0_asi_reg_rd_119:
	mov	0x1b, %r14
	.word 0xf2db8e80  ! 2693: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T0_asi_reg_rd_120:
	mov	0x3c3, %r14
	.word 0xf6db84a0  ! 2694: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T0_asi_reg_wr_129:
	mov	0x3c8, %r14
	.word 0xfaf389e0  ! 2696: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb7540000  ! 2697: RDPR_GL	<illegal instruction>
	.word 0xbbe5a1a4  ! 2701: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb37de401  ! 2704: MOVR_I	movre	%r23, 0x1, %r25
cpu_intr_0_208:
	setx	0x300006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe44000  ! 2707: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_230:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_230), 16, 16)) -> intp(0, 0, 1)
cpu_intr_0_209:
	setx	0x330220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e48000  ! 2713: SAVE_R	save	%r18, %r0, %r28
	.word 0xb7e4a039  ! 2714: SAVE_I	save	%r18, 0x0001, %r27
cpu_intr_0_210:
	setx	0x310006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e0db  ! 2717: SAVE_I	save	%r19, 0x0001, %r31
cpu_intr_0_211:
	setx	0x320002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e52074  ! 2722: SAVE_I	save	%r20, 0x0001, %r28
iob_intr_0_231:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_231), 16, 16)) -> intp(0, 0, 28)
	.word 0xb7e4a186  ! 2727: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbbe561fc  ! 2728: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7508000  ! 2729: RDPR_TSTATE	<illegal instruction>
iob_intr_0_232:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_232), 16, 16)) -> intp(0, 0, 37)
	.word 0xb9e44000  ! 2733: SAVE_R	save	%r17, %r0, %r28
	.word 0xb9e5a108  ! 2736: SAVE_I	save	%r22, 0x0001, %r28
iob_intr_0_233:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_233), 16, 16)) -> intp(0, 0, 3)
cpu_intr_0_212:
	setx	0x37032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5a068  ! 2744: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_wr_130:
	mov	0x3c2, %r14
	.word 0xf8f38e60  ! 2751: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_0_234:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_234), 16, 16)) -> intp(0, 0, 18)
	.word 0xb7e52069  ! 2756: SAVE_I	save	%r20, 0x0001, %r27
iob_intr_0_235:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_235), 16, 16)) -> intp(0, 0, 1d)
T0_asi_reg_rd_121:
	mov	0x2, %r14
	.word 0xf6db89e0  ! 2762: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_0_236:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_236), 16, 16)) -> intp(0, 0, 3e)
	.word 0xbc342039  ! 2766: ORN_I	orn 	%r16, 0x0039, %r30
	.word 0xb3e58000  ! 2767: SAVE_R	save	%r22, %r0, %r25
	.word 0xbbe5c000  ! 2769: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_213:
	setx	0x340015, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_122:
	mov	0x25, %r14
	.word 0xfcdb8e40  ! 2773: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_wr_131:
	mov	0x7, %r14
	.word 0xf0f38e40  ! 2774: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_rd_123:
	mov	0x3c7, %r14
	.word 0xf0db8e40  ! 2781: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb5e5214d  ! 2782: SAVE_I	save	%r20, 0x0001, %r26
iob_intr_0_237:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_237), 16, 16)) -> intp(0, 0, d)
	.word 0xbe850000  ! 2784: ADDcc_R	addcc 	%r20, %r0, %r31
	.word 0xb5e561c4  ! 2785: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb9e4613d  ! 2786: SAVE_I	save	%r17, 0x0001, %r28
cpu_intr_0_214:
	setx	0x37000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba148000  ! 2791: OR_R	or 	%r18, %r0, %r29
	.word 0xb9e54000  ! 2795: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_wr_132:
	mov	0x3c0, %r14
	.word 0xfaf389e0  ! 2797: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb5e5c000  ! 2799: SAVE_R	save	%r23, %r0, %r26
	.word 0xb9e44000  ! 2800: SAVE_R	save	%r17, %r0, %r28
	.word 0xb3e520a0  ! 2805: SAVE_I	save	%r20, 0x0001, %r25
cpu_intr_0_215:
	setx	0x36002d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_124:
	mov	0x3c0, %r14
	.word 0xfedb8e60  ! 2808: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xbe2c2062  ! 2810: ANDN_I	andn 	%r16, 0x0062, %r31
iob_intr_0_238:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_238), 16, 16)) -> intp(0, 0, 29)
T0_asi_reg_wr_133:
	mov	0x1f, %r14
	.word 0xf0f389e0  ! 2814: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbde4e0cc  ! 2817: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5e48000  ! 2818: SAVE_R	save	%r18, %r0, %r26
	.word 0xb1e5e083  ! 2820: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_wr_134:
	mov	0x2c, %r14
	.word 0xf6f384a0  ! 2823: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_0_216:
	setx	0x35001f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_239:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_239), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb7e4a13f  ! 2830: SAVE_I	save	%r18, 0x0001, %r27
cpu_intr_0_217:
	setx	0x340100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a0a8  ! 2833: SAVE_I	save	%r18, 0x0001, %r25
cpu_intr_0_218:
	setx	0x350215, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_125:
	mov	0x2a, %r14
	.word 0xf4db8e40  ! 2837: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb53c0000  ! 2838: SRA_R	sra 	%r16, %r0, %r26
	.word 0xbde44000  ! 2840: SAVE_R	save	%r17, %r0, %r30
cpu_intr_0_219:
	setx	0x360223, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_240:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_240), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_rd_126:
	mov	0x16, %r14
	.word 0xf4db8400  ! 2845: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T0_asi_reg_rd_127:
	mov	0x3c3, %r14
	.word 0xfedb8e40  ! 2846: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_0_220:
	setx	0x34023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e1a7  ! 2860: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xa1902002  ! 2861: WRPR_GL_I	wrpr	%r0, 0x0002, %-
iob_intr_0_241:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_241), 16, 16)) -> intp(0, 0, 18)
	.word 0xb9e4e0b7  ! 2865: SAVE_I	save	%r19, 0x0001, %r28
cpu_intr_0_221:
	setx	0x370228, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_128:
	mov	0x1, %r14
	.word 0xf2db8e60  ! 2871: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_0_242:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_242), 16, 16)) -> intp(0, 0, 16)
iob_intr_0_243:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_243), 16, 16)) -> intp(0, 0, 3f)
	.word 0xba95c000  ! 2876: ORcc_R	orcc 	%r23, %r0, %r29
	.word 0xbbe4e024  ! 2877: SAVE_I	save	%r19, 0x0001, %r29
iob_intr_0_244:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_244), 16, 16)) -> intp(0, 0, 2)
	.word 0xb8b44000  ! 2883: SUBCcc_R	orncc 	%r17, %r0, %r28
iob_intr_0_245:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_245), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb3e5a1a6  ! 2888: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_222:
	setx	0x360313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e48000  ! 2890: SAVE_R	save	%r18, %r0, %r26
	.word 0xb6342159  ! 2896: ORN_I	orn 	%r16, 0x0159, %r27
	.word 0xb5e48000  ! 2900: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_246:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_246), 16, 16)) -> intp(0, 0, 3e)
	.word 0xbe94e17d  ! 2909: ORcc_I	orcc 	%r19, 0x017d, %r31
	.word 0xb9e4e11d  ! 2911: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbbe56148  ! 2913: SAVE_I	save	%r21, 0x0001, %r29
cpu_intr_0_223:
	setx	0x340204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe521e0  ! 2916: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbbe5a01f  ! 2919: SAVE_I	save	%r22, 0x0001, %r29
T0_asi_reg_rd_129:
	mov	0x26, %r14
	.word 0xfedb84a0  ! 2923: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb9e4c000  ! 2925: SAVE_R	save	%r19, %r0, %r28
iob_intr_0_247:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_247), 16, 16)) -> intp(0, 0, 3)
cpu_intr_0_224:
	setx	0x350132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe58000  ! 2931: SAVE_R	save	%r22, %r0, %r29
	.word 0xb3e46158  ! 2936: SAVE_I	save	%r17, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e58000  ! 2941: SAVE_R	save	%r22, %r0, %r24
cpu_intr_0_225:
	setx	0x340031, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_130:
	mov	0x37, %r14
	.word 0xf0db84a0  ! 2944: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_0_226:
	setx	0x34031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd500000  ! 2946: RDPR_TPC	<illegal instruction>
iob_intr_0_248:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_248), 16, 16)) -> intp(0, 0, 24)
iob_intr_0_249:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_249), 16, 16)) -> intp(0, 0, 4)
iob_intr_0_250:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_250), 16, 16)) -> intp(0, 0, 34)
T0_asi_reg_rd_131:
	mov	0xa, %r14
	.word 0xf0db8400  ! 2958: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbe958000  ! 2960: ORcc_R	orcc 	%r22, %r0, %r31
T0_asi_reg_rd_132:
	mov	0x3c2, %r14
	.word 0xf8db8e60  ! 2963: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb9e5e1c5  ! 2966: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e5c000  ! 2968: SAVE_R	save	%r23, %r0, %r26
cpu_intr_0_227:
	setx	0x35013c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_251:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_251), 16, 16)) -> intp(0, 0, 27)
cpu_intr_0_228:
	setx	0x370334, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_135:
	mov	0x1a, %r14
	.word 0xf6f389e0  ! 2973: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb5e42179  ! 2976: SAVE_I	save	%r16, 0x0001, %r26
cpu_intr_0_229:
	setx	0x37030d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_252:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_252), 16, 16)) -> intp(0, 0, 3c)
iob_intr_0_253:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_253), 16, 16)) -> intp(0, 0, 11)
iob_intr_0_254:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_254), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb1e4217d  ! 2986: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbde58000  ! 2987: SAVE_R	save	%r22, %r0, %r30
	.word 0xbc3d4000  ! 2988: XNOR_R	xnor 	%r21, %r0, %r30
iob_intr_0_255:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_255), 16, 16)) -> intp(0, 0, d)
cpu_intr_0_230:
	setx	0x36010d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_256:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_256), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb1e420dc  ! 3000: SAVE_I	save	%r16, 0x0001, %r24
iob_intr_0_257:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_257), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb5e420db  ! 3004: SAVE_I	save	%r16, 0x0001, %r26
cpu_intr_0_231:
	setx	0x350315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e154  ! 3008: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbbe5e042  ! 3011: SAVE_I	save	%r23, 0x0001, %r29
cpu_intr_0_232:
	setx	0x350214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb60c8000  ! 3013: AND_R	and 	%r18, %r0, %r27
	.word 0xb1e420ff  ! 3014: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbde4a0f2  ! 3016: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbfe4c000  ! 3024: SAVE_R	save	%r19, %r0, %r31
	.word 0xb3e50000  ! 3026: SAVE_R	save	%r20, %r0, %r25
cpu_intr_0_233:
	setx	0x350100, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_234:
	setx	0x37003f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_235:
	setx	0x37013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe40000  ! 3032: SAVE_R	save	%r16, %r0, %r29
	.word 0xb3e54000  ! 3034: SAVE_R	save	%r21, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbde56168  ! 3042: SAVE_I	save	%r21, 0x0001, %r30
cpu_intr_0_236:
	setx	0x34000e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_237:
	setx	0x360314, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_133:
	mov	0x3c3, %r14
	.word 0xf2db8400  ! 3049: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T0_asi_reg_rd_134:
	mov	0x2, %r14
	.word 0xf2db8e60  ! 3050: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_0_238:
	setx	0x360104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e54000  ! 3058: SAVE_R	save	%r21, %r0, %r25
	.word 0xb3e4e08f  ! 3059: SAVE_I	save	%r19, 0x0001, %r25
cpu_intr_0_239:
	setx	0x36022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a15f  ! 3065: SAVE_I	save	%r18, 0x0001, %r27
cpu_intr_0_240:
	setx	0x360016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd356001  ! 3069: SRL_I	srl 	%r21, 0x0001, %r30
	.word 0xb3e4c000  ! 3070: SAVE_R	save	%r19, %r0, %r25
cpu_intr_0_241:
	setx	0x370308, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_136:
	mov	0x20, %r14
	.word 0xf6f384a0  ! 3073: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb1e54000  ! 3074: SAVE_R	save	%r21, %r0, %r24
iob_intr_0_258:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_258), 16, 16)) -> intp(0, 0, 11)
T0_asi_reg_rd_135:
	mov	0x3c2, %r14
	.word 0xf6db8e40  ! 3078: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_259:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_259), 16, 16)) -> intp(0, 0, 3b)
iob_intr_0_260:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_260), 16, 16)) -> intp(0, 0, 2)
cpu_intr_0_242:
	setx	0x34022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe56028  ! 3086: SAVE_I	save	%r21, 0x0001, %r31
cpu_intr_0_243:
	setx	0x370136, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_261:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_261), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_rd_136:
	mov	0x3c8, %r14
	.word 0xf0db8e80  ! 3094: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb5e4e1ca  ! 3095: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbfe50000  ! 3103: SAVE_R	save	%r20, %r0, %r31
	.word 0xb3e5e0a5  ! 3105: SAVE_I	save	%r23, 0x0001, %r25
cpu_intr_0_244:
	setx	0x370337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba242146  ! 3107: SUB_I	sub 	%r16, 0x0146, %r29
	.word 0xb9e5a0ec  ! 3108: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_rd_137:
	mov	0x29, %r14
	.word 0xfadb8e40  ! 3109: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbbe520de  ! 3111: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbde44000  ! 3112: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_wr_137:
	mov	0x3c3, %r14
	.word 0xfef38e80  ! 3113: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb3e48000  ! 3114: SAVE_R	save	%r18, %r0, %r25
	.word 0xb1e5c000  ! 3117: SAVE_R	save	%r23, %r0, %r24
iob_intr_0_262:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_262), 16, 16)) -> intp(0, 0, c)
iob_intr_0_263:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_263), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_rd_138:
	mov	0x3c5, %r14
	.word 0xf6db8e80  ! 3136: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_0_264:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_264), 16, 16)) -> intp(0, 0, 4)
	.word 0xb5e5e12f  ! 3139: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb2248000  ! 3140: SUB_R	sub 	%r18, %r0, %r25
	.word 0xb5e40000  ! 3142: SAVE_R	save	%r16, %r0, %r26
	.word 0xb5e5c000  ! 3148: SAVE_R	save	%r23, %r0, %r26
cpu_intr_0_245:
	setx	0x340203, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_139:
	mov	0x3c3, %r14
	.word 0xf6db8400  ! 3153: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T0_asi_reg_wr_138:
	mov	0x20, %r14
	.word 0xf6f38e40  ! 3155: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb3e54000  ! 3156: SAVE_R	save	%r21, %r0, %r25
	.word 0xb3e46087  ! 3157: SAVE_I	save	%r17, 0x0001, %r25
cpu_intr_0_246:
	setx	0x37023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8940000  ! 3162: ORcc_R	orcc 	%r16, %r0, %r28
iob_intr_0_265:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_265), 16, 16)) -> intp(0, 0, c)
	.word 0xb1e58000  ! 3166: SAVE_R	save	%r22, %r0, %r24
cpu_intr_0_247:
	setx	0x370315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb34a001  ! 3171: SRL_I	srl 	%r18, 0x0001, %r29
T0_asi_reg_rd_140:
	mov	0x3c5, %r14
	.word 0xf4db8e60  ! 3172: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_0_248:
	setx	0x360015, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_266:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_266), 16, 16)) -> intp(0, 0, 10)
	.word 0xb5e5c000  ! 3184: SAVE_R	save	%r23, %r0, %r26
iob_intr_0_267:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_267), 16, 16)) -> intp(0, 0, 27)
iob_intr_0_268:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_268), 16, 16)) -> intp(0, 0, 7)
	.word 0xbfe54000  ! 3190: SAVE_R	save	%r21, %r0, %r31
	.word 0xbfe58000  ! 3199: SAVE_R	save	%r22, %r0, %r31
	.word 0xb1e4c000  ! 3200: SAVE_R	save	%r19, %r0, %r24
iob_intr_0_269:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_269), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_249:
	setx	0x340216, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_250:
	setx	0x360337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b40000  ! 3208: SUBCcc_R	orncc 	%r16, %r0, %r25
	.word 0xbab4608c  ! 3210: ORNcc_I	orncc 	%r17, 0x008c, %r29
	.word 0xbbe40000  ! 3211: SAVE_R	save	%r16, %r0, %r29
	.word 0xb5e561d9  ! 3212: SAVE_I	save	%r21, 0x0001, %r26
iob_intr_0_270:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_270), 16, 16)) -> intp(0, 0, 3)
T0_asi_reg_wr_139:
	mov	0x31, %r14
	.word 0xf0f38e60  ! 3214: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_0_271:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_271), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_wr_140:
	mov	0x8, %r14
	.word 0xfaf38e60  ! 3217: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbbe46139  ! 3218: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb1e5e0fa  ! 3219: SAVE_I	save	%r23, 0x0001, %r24
cpu_intr_0_251:
	setx	0x3a002b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_272:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_272), 16, 16)) -> intp(0, 0, 1e)
iob_intr_0_273:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_273), 16, 16)) -> intp(0, 0, 19)
	.word 0xb5e4610e  ! 3229: SAVE_I	save	%r17, 0x0001, %r26
T0_asi_reg_wr_141:
	mov	0x4, %r14
	.word 0xfcf38e60  ! 3230: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_0_274:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_274), 16, 16)) -> intp(0, 0, 25)
iob_intr_0_275:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_275), 16, 16)) -> intp(0, 0, 1a)
iob_intr_0_276:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_276), 16, 16)) -> intp(0, 0, 32)
T0_asi_reg_rd_141:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 3239: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb9e4a11c  ! 3242: SAVE_I	save	%r18, 0x0001, %r28
cpu_intr_0_252:
	setx	0x3a0111, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_253:
	setx	0x38011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4c000  ! 3246: SAVE_R	save	%r19, %r0, %r26
T0_asi_reg_wr_142:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 3247: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_277:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_277), 16, 16)) -> intp(0, 0, 2c)
cpu_intr_0_254:
	setx	0x380211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4601a  ! 3250: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbfe5c000  ! 3251: SAVE_R	save	%r23, %r0, %r31
	.word 0xbde46080  ! 3253: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb1e4e0e7  ! 3254: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbf2d0000  ! 3256: SLL_R	sll 	%r20, %r0, %r31
	.word 0xb7e54000  ! 3257: SAVE_R	save	%r21, %r0, %r27
	.word 0x919421ad  ! 3260: WRPR_PIL_I	wrpr	%r16, 0x01ad, %pil
iob_intr_0_278:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_278), 16, 16)) -> intp(0, 0, 26)
	.word 0xbbe56190  ! 3264: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb1e5a0e3  ! 3265: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb7e44000  ! 3266: SAVE_R	save	%r17, %r0, %r27
T0_asi_reg_wr_143:
	mov	0x28, %r14
	.word 0xf0f389e0  ! 3268: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb3e5a0e4  ! 3269: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbf35c000  ! 3271: SRL_R	srl 	%r23, %r0, %r31
	.word 0xb1e5c000  ! 3272: SAVE_R	save	%r23, %r0, %r24
	.word 0xbbe44000  ! 3274: SAVE_R	save	%r17, %r0, %r29
	.word 0xb3e5c000  ! 3275: SAVE_R	save	%r23, %r0, %r25
	.word 0xb9e521d3  ! 3276: SAVE_I	save	%r20, 0x0001, %r28
iob_intr_0_279:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_279), 16, 16)) -> intp(0, 0, 39)
	.word 0xb3e521f0  ! 3281: SAVE_I	save	%r20, 0x0001, %r25
cpu_intr_0_255:
	setx	0x390111, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_144:
	mov	0x36, %r14
	.word 0xf6f38e40  ! 3283: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_0_280:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_280), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb9e5c000  ! 3288: SAVE_R	save	%r23, %r0, %r28
	.word 0xbd34b001  ! 3289: SRLX_I	srlx	%r18, 0x0001, %r30
T0_asi_reg_rd_142:
	mov	0x5, %r14
	.word 0xfadb8e40  ! 3290: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbbe5a1b8  ! 3292: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb2458000  ! 3293: ADDC_R	addc 	%r22, %r0, %r25
iob_intr_0_281:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_281), 16, 16)) -> intp(0, 0, 30)
	.word 0xb9e5c000  ! 3296: SAVE_R	save	%r23, %r0, %r28
	.word 0xbde40000  ! 3299: SAVE_R	save	%r16, %r0, %r30
cpu_intr_0_256:
	setx	0x3a032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8940000  ! 3301: ORcc_R	orcc 	%r16, %r0, %r28
T0_asi_reg_wr_145:
	mov	0x3c1, %r14
	.word 0xfef38e60  ! 3305: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbfe54000  ! 3308: SAVE_R	save	%r21, %r0, %r31
T0_asi_reg_rd_143:
	mov	0xd, %r14
	.word 0xf4db8e40  ! 3312: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb9e50000  ! 3313: SAVE_R	save	%r20, %r0, %r28
T0_asi_reg_rd_144:
	mov	0x2d, %r14
	.word 0xfedb8400  ! 3316: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb1e46133  ! 3317: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_wr_146:
	mov	0x22, %r14
	.word 0xfcf38e60  ! 3319: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbde5a0e5  ! 3321: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbf3c8000  ! 3323: SRA_R	sra 	%r18, %r0, %r31
iob_intr_0_282:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_282), 16, 16)) -> intp(0, 0, a)
	.word 0xb52df001  ! 3328: SLLX_I	sllx	%r23, 0x0001, %r26
iob_intr_0_283:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_283), 16, 16)) -> intp(0, 0, 21)
	.word 0xb9e5c000  ! 3335: SAVE_R	save	%r23, %r0, %r28
T0_asi_reg_rd_145:
	mov	0x5, %r14
	.word 0xf6db8e40  ! 3338: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb5e5c000  ! 3342: SAVE_R	save	%r23, %r0, %r26
	.word 0xbde4a055  ! 3345: SAVE_I	save	%r18, 0x0001, %r30
cpu_intr_0_257:
	setx	0x3b0305, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_284:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_284), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb1e46183  ! 3350: SAVE_I	save	%r17, 0x0001, %r24
iob_intr_0_285:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_285), 16, 16)) -> intp(0, 0, a)
	.word 0xbde58000  ! 3353: SAVE_R	save	%r22, %r0, %r30
	.word 0xb3e44000  ! 3355: SAVE_R	save	%r17, %r0, %r25
	.word 0xbde4c000  ! 3356: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_rd_146:
	mov	0x20, %r14
	.word 0xf2db8e40  ! 3358: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T0_asi_reg_rd_147:
	mov	0x3c8, %r14
	.word 0xf8db8e40  ! 3360: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb7e4c000  ! 3361: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_rd_148:
	mov	0x15, %r14
	.word 0xf2db8e80  ! 3362: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb7e5c000  ! 3363: SAVE_R	save	%r23, %r0, %r27
	.word 0xb73ce001  ! 3364: SRA_I	sra 	%r19, 0x0001, %r27
iob_intr_0_286:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_286), 16, 16)) -> intp(0, 0, 11)
cpu_intr_0_258:
	setx	0x3b0230, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_147:
	mov	0x3c3, %r14
	.word 0xf8f38e40  ! 3367: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb5e5e1e0  ! 3368: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb5e5a0de  ! 3369: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbfe54000  ! 3371: SAVE_R	save	%r21, %r0, %r31
	.word 0xb3e44000  ! 3372: SAVE_R	save	%r17, %r0, %r25
T0_asi_reg_rd_149:
	mov	0x3c0, %r14
	.word 0xfadb8e40  ! 3374: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb5e420e2  ! 3377: SAVE_I	save	%r16, 0x0001, %r26
T0_asi_reg_rd_150:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 3380: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_287:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_287), 16, 16)) -> intp(0, 0, 36)
	.word 0xb7e42030  ! 3385: SAVE_I	save	%r16, 0x0001, %r27
cpu_intr_0_259:
	setx	0x390021, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_151:
	mov	0x0, %r14
	.word 0xf2db8e80  ! 3389: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb9e4c000  ! 3390: SAVE_R	save	%r19, %r0, %r28
	.word 0xb2a5c000  ! 3395: SUBcc_R	subcc 	%r23, %r0, %r25
	.word 0xb9e58000  ! 3396: SAVE_R	save	%r22, %r0, %r28
cpu_intr_0_260:
	setx	0x3a0323, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_288:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_288), 16, 16)) -> intp(0, 0, 2a)
cpu_intr_0_261:
	setx	0x3b0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde54000  ! 3401: SAVE_R	save	%r21, %r0, %r30
T0_asi_reg_wr_148:
	mov	0x8, %r14
	.word 0xfef38e60  ! 3405: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T0_asi_reg_wr_149:
	mov	0x16, %r14
	.word 0xfaf38400  ! 3407: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T0_asi_reg_rd_152:
	mov	0x3c3, %r14
	.word 0xf2db8e60  ! 3408: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T0_asi_reg_wr_150:
	mov	0x11, %r14
	.word 0xfef38e80  ! 3409: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T0_asi_reg_rd_153:
	mov	0x23, %r14
	.word 0xf0db8e40  ! 3412: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_wr_151:
	mov	0x3c7, %r14
	.word 0xf4f38e60  ! 3413: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_0_262:
	setx	0x38012f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_263:
	setx	0x38021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a0a7  ! 3420: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb7e58000  ! 3421: SAVE_R	save	%r22, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe54000  ! 3426: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_289:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_289), 16, 16)) -> intp(0, 0, 14)
	.word 0xb5e40000  ! 3432: SAVE_R	save	%r16, %r0, %r26
cpu_intr_0_264:
	setx	0x38031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_154:
	mov	0x3c1, %r14
	.word 0xf6db8e40  ! 3435: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbfe5208b  ! 3436: SAVE_I	save	%r20, 0x0001, %r31
cpu_intr_0_265:
	setx	0x3b012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e48000  ! 3444: SAVE_R	save	%r18, %r0, %r24
iob_intr_0_290:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_290), 16, 16)) -> intp(0, 0, 1a)
iob_intr_0_291:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_291), 16, 16)) -> intp(0, 0, 2e)
cpu_intr_0_266:
	setx	0x39020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a001  ! 3451: SAVE_I	save	%r18, 0x0001, %r28
cpu_intr_0_267:
	setx	0x3b0013, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_268:
	setx	0x380234, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_152:
	mov	0x2b, %r14
	.word 0xfef38e40  ! 3455: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbfe5a1e3  ! 3458: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_292:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_292), 16, 16)) -> intp(0, 0, 2)
iob_intr_0_293:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_293), 16, 16)) -> intp(0, 0, 29)
	.word 0xb9e521c7  ! 3463: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_269:
	setx	0x390119, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_155:
	mov	0x3c3, %r14
	.word 0xfcdb89e0  ! 3467: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_0_294:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_294), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb9e4e05b  ! 3470: SAVE_I	save	%r19, 0x0001, %r28
iob_intr_0_295:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_295), 16, 16)) -> intp(0, 0, 13)
iob_intr_0_296:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_296), 16, 16)) -> intp(0, 0, c)
	.word 0xb9e5617e  ! 3481: SAVE_I	save	%r21, 0x0001, %r28
T0_asi_reg_wr_153:
	mov	0x16, %r14
	.word 0xf6f38e40  ! 3484: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb1e4e1a0  ! 3487: SAVE_I	save	%r19, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_156:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 3492: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb3e40000  ! 3493: SAVE_R	save	%r16, %r0, %r25
	.word 0xb5e40000  ! 3500: SAVE_R	save	%r16, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb834215d  ! 3503: SUBC_I	orn 	%r16, 0x015d, %r28
T0_asi_reg_rd_157:
	mov	0x3c6, %r14
	.word 0xf4db8e40  ! 3506: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_0_270:
	setx	0x3a010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb03c0000  ! 3509: XNOR_R	xnor 	%r16, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e54000  ! 3515: SAVE_R	save	%r21, %r0, %r24
	.word 0xb5e48000  ! 3516: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_297:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_297), 16, 16)) -> intp(0, 0, 0)
iob_intr_0_298:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_298), 16, 16)) -> intp(0, 0, 10)
	.word 0xb884c000  ! 3523: ADDcc_R	addcc 	%r19, %r0, %r28
	.word 0xb5e42159  ! 3526: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_299:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_299), 16, 16)) -> intp(0, 0, 38)
cpu_intr_0_271:
	setx	0x390127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e54000  ! 3533: SAVE_R	save	%r21, %r0, %r24
	.word 0xb9e5c000  ! 3535: SAVE_R	save	%r23, %r0, %r28
iob_intr_0_300:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_300), 16, 16)) -> intp(0, 0, 4)
	.word 0xbfe44000  ! 3541: SAVE_R	save	%r17, %r0, %r31
	.word 0xb1e42180  ! 3545: SAVE_I	save	%r16, 0x0001, %r24
T0_asi_reg_rd_158:
	mov	0x1e, %r14
	.word 0xfedb8e40  ! 3551: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbbe40000  ! 3552: SAVE_R	save	%r16, %r0, %r29
iob_intr_0_301:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_301), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb3346001  ! 3557: SRL_I	srl 	%r17, 0x0001, %r25
cpu_intr_0_272:
	setx	0x3a031b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_273:
	setx	0x3a023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe42083  ! 3560: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb5e40000  ! 3562: SAVE_R	save	%r16, %r0, %r26
	.word 0xb3e4c000  ! 3572: SAVE_R	save	%r19, %r0, %r25
	.word 0xbde40000  ! 3574: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_302:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_302), 16, 16)) -> intp(0, 0, 3a)
iob_intr_0_303:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_303), 16, 16)) -> intp(0, 0, 1)
	.word 0xb7e54000  ! 3583: SAVE_R	save	%r21, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_154:
	mov	0x25, %r14
	.word 0xfaf389e0  ! 3587: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_0_274:
	setx	0x3a010f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_304:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_304), 16, 16)) -> intp(0, 0, 17)
	.word 0xb2a4607d  ! 3591: SUBcc_I	subcc 	%r17, 0x007d, %r25
	.word 0xb5e56078  ! 3595: SAVE_I	save	%r21, 0x0001, %r26
iob_intr_0_305:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_305), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_275:
	setx	0x3a0214, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_306:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_306), 16, 16)) -> intp(0, 0, 3a)
iob_intr_0_307:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_307), 16, 16)) -> intp(0, 0, 17)
cpu_intr_0_276:
	setx	0x3a0235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4c000  ! 3606: SAVE_R	save	%r19, %r0, %r29
	.word 0xbcb5c000  ! 3608: SUBCcc_R	orncc 	%r23, %r0, %r30
T0_asi_reg_rd_159:
	mov	0x3c8, %r14
	.word 0xf6db8e80  ! 3612: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb5e5c000  ! 3613: SAVE_R	save	%r23, %r0, %r26
cpu_intr_0_277:
	setx	0x3b0318, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_308:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_308), 16, 16)) -> intp(0, 0, 21)
cpu_intr_0_278:
	setx	0x3b0335, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_279:
	setx	0x3b0329, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_309:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_309), 16, 16)) -> intp(0, 0, b)
	.word 0xb41c8000  ! 3622: XOR_R	xor 	%r18, %r0, %r26
	.word 0xb814a1ed  ! 3625: OR_I	or 	%r18, 0x01ed, %r28
	.word 0xb7e561e2  ! 3626: SAVE_I	save	%r21, 0x0001, %r27
cpu_intr_0_280:
	setx	0x38000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe350000  ! 3628: ORN_R	orn 	%r20, %r0, %r31
	.word 0xb72cc000  ! 3629: SLL_R	sll 	%r19, %r0, %r27
iob_intr_0_310:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_310), 16, 16)) -> intp(0, 0, 9)
iob_intr_0_311:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_311), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_rd_160:
	mov	0x1, %r14
	.word 0xf8db8e40  ! 3634: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_281:
	setx	0x380112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4c000  ! 3636: SAVE_R	save	%r19, %r0, %r26
iob_intr_0_312:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_312), 16, 16)) -> intp(0, 0, d)
cpu_intr_0_282:
	setx	0x3b0131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe0420c3  ! 3639: ADD_I	add 	%r16, 0x00c3, %r31
cpu_intr_0_283:
	setx	0x380001, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_284:
	setx	0x380208, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_313:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_313), 16, 16)) -> intp(0, 0, 29)
T0_asi_reg_rd_161:
	mov	0x9, %r14
	.word 0xfcdb8e80  ! 3650: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb17d4400  ! 3651: MOVR_R	movre	%r21, %r0, %r24
cpu_intr_0_285:
	setx	0x380220, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_314:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_314), 16, 16)) -> intp(0, 0, d)
cpu_intr_0_286:
	setx	0x380129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b421ae  ! 3663: SUBCcc_I	orncc 	%r16, 0x01ae, %r24
T0_asi_reg_wr_155:
	mov	0x3c3, %r14
	.word 0xf8f38400  ! 3664: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T0_asi_reg_rd_162:
	mov	0x3c5, %r14
	.word 0xf2db8400  ! 3671: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T0_asi_reg_rd_163:
	mov	0xa, %r14
	.word 0xfedb8e80  ! 3677: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb9e5619b  ! 3679: SAVE_I	save	%r21, 0x0001, %r28
T0_asi_reg_wr_156:
	mov	0x23, %r14
	.word 0xfef38400  ! 3680: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T0_asi_reg_wr_157:
	mov	0x3c1, %r14
	.word 0xfcf38e80  ! 3686: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbfe4e13d  ! 3687: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_315:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_315), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbde5a06d  ! 3689: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_wr_158:
	mov	0x10, %r14
	.word 0xfef38e40  ! 3690: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbbe50000  ! 3691: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_316:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_316), 16, 16)) -> intp(0, 0, 39)
cpu_intr_0_287:
	setx	0x3f0337, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_159:
	mov	0x6, %r14
	.word 0xf8f384a0  ! 3699: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb7e521ad  ! 3700: SAVE_I	save	%r20, 0x0001, %r27
cpu_intr_0_288:
	setx	0x3d022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc34a1f8  ! 3706: SUBC_I	orn 	%r18, 0x01f8, %r30
cpu_intr_0_289:
	setx	0x3d003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_290:
	setx	0x3e0037, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_160:
	mov	0x0, %r14
	.word 0xfef38e60  ! 3711: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb1e5e178  ! 3714: SAVE_I	save	%r23, 0x0001, %r24
cpu_intr_0_291:
	setx	0x3e0309, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_292:
	setx	0x3f013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 3724: SAVE_R	save	%r21, %r0, %r27
iob_intr_0_317:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_317), 16, 16)) -> intp(0, 0, 3c)
iob_intr_0_318:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_318), 16, 16)) -> intp(0, 0, 1b)
	.word 0xbfe4a1c1  ! 3729: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbe2cc000  ! 3730: ANDN_R	andn 	%r19, %r0, %r31
iob_intr_0_319:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_319), 16, 16)) -> intp(0, 0, 22)
	.word 0xbfe40000  ! 3736: SAVE_R	save	%r16, %r0, %r31
	.word 0xb7e50000  ! 3739: SAVE_R	save	%r20, %r0, %r27
	.word 0xb7e5c000  ! 3742: SAVE_R	save	%r23, %r0, %r27
cpu_intr_0_293:
	setx	0x3e0023, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_294:
	setx	0x3f0327, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_320:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_320), 16, 16)) -> intp(0, 0, 37)
T0_asi_reg_wr_161:
	mov	0xa, %r14
	.word 0xfaf389e0  ! 3750: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_0_321:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_321), 16, 16)) -> intp(0, 0, 2f)
	.word 0x8994606e  ! 3752: WRPR_TICK_I	wrpr	%r17, 0x006e, %tick
T0_asi_reg_wr_162:
	mov	0x18, %r14
	.word 0xf6f38e40  ! 3753: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb635a145  ! 3755: SUBC_I	orn 	%r22, 0x0145, %r27
T0_asi_reg_rd_164:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 3756: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_322:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_322), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbbe44000  ! 3761: SAVE_R	save	%r17, %r0, %r29
cpu_intr_0_295:
	setx	0x3c012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde46196  ! 3767: SAVE_I	save	%r17, 0x0001, %r30
T0_asi_reg_wr_163:
	mov	0xe, %r14
	.word 0xfaf384a0  ! 3768: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_0_296:
	setx	0x3e0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe58000  ! 3771: SAVE_R	save	%r22, %r0, %r29
	.word 0xb3e44000  ! 3776: SAVE_R	save	%r17, %r0, %r25
T0_asi_reg_wr_164:
	mov	0x7, %r14
	.word 0xf4f38e40  ! 3778: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbbe44000  ! 3779: SAVE_R	save	%r17, %r0, %r29
	.word 0xbfe4c000  ! 3781: SAVE_R	save	%r19, %r0, %r31
T0_asi_reg_rd_165:
	mov	0x35, %r14
	.word 0xf6db8e40  ! 3782: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_rd_166:
	mov	0x26, %r14
	.word 0xf6db8400  ! 3785: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_0_323:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_323), 16, 16)) -> intp(0, 0, 29)
	.word 0xb1e40000  ! 3787: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_297:
	setx	0x3d0125, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_167:
	mov	0x34, %r14
	.word 0xfcdb89e0  ! 3790: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbde44000  ! 3792: SAVE_R	save	%r17, %r0, %r30
iob_intr_0_324:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_324), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb7e58000  ! 3795: SAVE_R	save	%r22, %r0, %r27
cpu_intr_0_298:
	setx	0x3f0208, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_168:
	mov	0x2d, %r14
	.word 0xf8db8e80  ! 3797: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb7e42078  ! 3798: SAVE_I	save	%r16, 0x0001, %r27
iob_intr_0_325:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_325), 16, 16)) -> intp(0, 0, 24)
	.word 0xb9e48000  ! 3803: SAVE_R	save	%r18, %r0, %r28
T0_asi_reg_wr_165:
	mov	0x2d, %r14
	.word 0xf6f38e40  ! 3804: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb7e56063  ! 3805: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbde48000  ! 3808: SAVE_R	save	%r18, %r0, %r30
	.word 0xbbe520c1  ! 3809: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_rd_169:
	mov	0x2, %r14
	.word 0xf0db89e0  ! 3812: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_0_299:
	setx	0x3e0334, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_166:
	mov	0x3c2, %r14
	.word 0xfef38e40  ! 3814: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb7e4216f  ! 3815: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb1e5e07f  ! 3816: SAVE_I	save	%r23, 0x0001, %r24
cpu_intr_0_300:
	setx	0x3f0024, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_167:
	mov	0x4, %r14
	.word 0xf2f384a0  ! 3826: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb5e4c000  ! 3827: SAVE_R	save	%r19, %r0, %r26
iob_intr_0_326:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_326), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb7e48000  ! 3831: SAVE_R	save	%r18, %r0, %r27
	.word 0xbde54000  ! 3834: SAVE_R	save	%r21, %r0, %r30
	.word 0xbfe4e02a  ! 3835: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_327:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_327), 16, 16)) -> intp(0, 0, 16)
	.word 0xb3e58000  ! 3838: SAVE_R	save	%r22, %r0, %r25
	.word 0xbbe421b0  ! 3839: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb4348000  ! 3842: ORN_R	orn 	%r18, %r0, %r26
	.word 0xb2c460a2  ! 3843: ADDCcc_I	addccc 	%r17, 0x00a2, %r25
	.word 0xb9e54000  ! 3845: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_rd_170:
	mov	0x2d, %r14
	.word 0xf4db84a0  ! 3847: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T0_asi_reg_wr_168:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 3849: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbde42039  ! 3851: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5e40000  ! 3854: SAVE_R	save	%r16, %r0, %r26
cpu_intr_0_301:
	setx	0x3d010e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_328:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_328), 16, 16)) -> intp(0, 0, 3)
	.word 0xb5e4c000  ! 3861: SAVE_R	save	%r19, %r0, %r26
iob_intr_0_329:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_329), 16, 16)) -> intp(0, 0, 2e)
iob_intr_0_330:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_330), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb9e44000  ! 3866: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_331:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_331), 16, 16)) -> intp(0, 0, 8)
	.word 0xb9e54000  ! 3869: SAVE_R	save	%r21, %r0, %r28
iob_intr_0_332:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_332), 16, 16)) -> intp(0, 0, 21)
	.word 0xbbe40000  ! 3874: SAVE_R	save	%r16, %r0, %r29
	.word 0xbbe5e0af  ! 3876: SAVE_I	save	%r23, 0x0001, %r29
T0_asi_reg_wr_169:
	mov	0x3c8, %r14
	.word 0xf0f38e60  ! 3883: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb1e521cf  ! 3885: SAVE_I	save	%r20, 0x0001, %r24
T0_asi_reg_wr_170:
	mov	0x37, %r14
	.word 0xf4f38e40  ! 3887: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_wr_171:
	mov	0x1f, %r14
	.word 0xfef389e0  ! 3888: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_0_333:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_333), 16, 16)) -> intp(0, 0, 1d)
cpu_intr_0_302:
	setx	0x3e0316, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_334:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_334), 16, 16)) -> intp(0, 0, 23)
iob_intr_0_335:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_335), 16, 16)) -> intp(0, 0, 22)
	.word 0xbf35c000  ! 3894: SRL_R	srl 	%r23, %r0, %r31
T0_asi_reg_rd_171:
	mov	0x1f, %r14
	.word 0xf4db84a0  ! 3896: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_0_336:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_336), 16, 16)) -> intp(0, 0, 31)
	.word 0xbbe48000  ! 3900: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_wr_172:
	mov	0x3, %r14
	.word 0xfaf38e40  ! 3904: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb5e5e1a1  ! 3907: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb1e520d7  ! 3911: SAVE_I	save	%r20, 0x0001, %r24
T0_asi_reg_wr_173:
	mov	0x3c3, %r14
	.word 0xf8f38e80  ! 3915: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_0_337:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_337), 16, 16)) -> intp(0, 0, 3)
	.word 0xb9e4e059  ! 3920: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xba1520e9  ! 3921: OR_I	or 	%r20, 0x00e9, %r29
	.word 0xb33cf001  ! 3922: SRAX_I	srax	%r19, 0x0001, %r25
	.word 0xbf3cf001  ! 3925: SRAX_I	srax	%r19, 0x0001, %r31
	.word 0xb1e54000  ! 3926: SAVE_R	save	%r21, %r0, %r24
T0_asi_reg_wr_174:
	mov	0x1d, %r14
	.word 0xfef38e80  ! 3927: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_0_303:
	setx	0x3c023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe48000  ! 3931: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_wr_175:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 3933: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_wr_176:
	mov	0x27, %r14
	.word 0xfef389e0  ! 3937: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_0_304:
	setx	0x3f013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9e5a004  ! 3941: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3e5a13e  ! 3943: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb7e4e137  ! 3946: SAVE_I	save	%r19, 0x0001, %r27
iob_intr_0_338:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_338), 16, 16)) -> intp(0, 0, 1b)
iob_intr_0_339:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_339), 16, 16)) -> intp(0, 0, 5)
cpu_intr_0_305:
	setx	0x3f0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a033  ! 3952: SAVE_I	save	%r22, 0x0001, %r27
iob_intr_0_340:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_340), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb7e4e05b  ! 3955: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb6454000  ! 3956: ADDC_R	addc 	%r21, %r0, %r27
	.word 0xb9e46145  ! 3958: SAVE_I	save	%r17, 0x0001, %r28
cpu_intr_0_306:
	setx	0x3c0300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb644a17e  ! 3960: ADDC_I	addc 	%r18, 0x017e, %r27
	.word 0xb3e4e0dd  ! 3962: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_341:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_341), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_342:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_342), 16, 16)) -> intp(0, 0, 19)
T0_asi_reg_rd_172:
	mov	0x5, %r14
	.word 0xfedb8e60  ! 3967: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_0_343:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_343), 16, 16)) -> intp(0, 0, 37)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7e421f7  ! 3973: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5e56069  ! 3978: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5e4e1d7  ! 3980: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbbe44000  ! 3982: SAVE_R	save	%r17, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde58000  ! 3987: SAVE_R	save	%r22, %r0, %r30
iob_intr_0_344:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_344), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_rd_173:
	mov	0x3c1, %r14
	.word 0xf0db8e80  ! 3991: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb3e46026  ! 3992: SAVE_I	save	%r17, 0x0001, %r25
cpu_intr_0_307:
	setx	0x3e0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e560c7  ! 3994: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbbe40000  ! 3995: SAVE_R	save	%r16, %r0, %r29
	.word 0xb1e4e0fc  ! 3996: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_rd_174:
	mov	0x3c2, %r14
	.word 0xf2db8400  ! 4000: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T0_asi_reg_wr_177:
	mov	0x3c3, %r14
	.word 0xf6f38e40  ! 4001: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb5e4c000  ! 4003: SAVE_R	save	%r19, %r0, %r26
cpu_intr_0_308:
	setx	0x3d0126, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_178:
	mov	0x23, %r14
	.word 0xf8f38e40  ! 4005: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_rd_175:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 4006: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_0_345:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_345), 16, 16)) -> intp(0, 0, 2b)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe560b1  ! 4010: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbbe40000  ! 4016: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_wr_179:
	mov	0x3c2, %r14
	.word 0xfaf38e60  ! 4021: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T0_asi_reg_rd_176:
	mov	0xf, %r14
	.word 0xf8db8e60  ! 4022: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T0_asi_reg_rd_177:
	mov	0x7, %r14
	.word 0xf0db8e80  ! 4026: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T0_asi_reg_wr_180:
	mov	0x2d, %r14
	.word 0xf0f389e0  ! 4028: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb7347001  ! 4029: SRLX_I	srlx	%r17, 0x0001, %r27
	.word 0xb7e50000  ! 4033: SAVE_R	save	%r20, %r0, %r27
T0_asi_reg_wr_181:
	mov	0x3c1, %r14
	.word 0xf0f38e40  ! 4038: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbde58000  ! 4039: SAVE_R	save	%r22, %r0, %r30
	.word 0xbfe5e1b6  ! 4040: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb32d9000  ! 4042: SLLX_R	sllx	%r22, %r0, %r25
T0_asi_reg_rd_178:
	mov	0x3c3, %r14
	.word 0xfadb84a0  ! 4044: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T0_asi_reg_rd_179:
	mov	0x27, %r14
	.word 0xfadb8400  ! 4045: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb5e4e06e  ! 4048: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbde5c000  ! 4051: SAVE_R	save	%r23, %r0, %r30
	.word 0xb7e4205e  ! 4055: SAVE_I	save	%r16, 0x0001, %r27
cpu_intr_0_309:
	setx	0x3c0033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 4057: SAVE_R	save	%r20, %r0, %r27
	.word 0xbbe54000  ! 4058: SAVE_R	save	%r21, %r0, %r29
	.word 0xbde4a0cb  ! 4063: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e44000  ! 4064: SAVE_R	save	%r17, %r0, %r25
iob_intr_0_346:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_346), 16, 16)) -> intp(0, 0, 2e)
	.word 0xbbe50000  ! 4069: SAVE_R	save	%r20, %r0, %r29
	.word 0xbfe4618b  ! 4070: SAVE_I	save	%r17, 0x0001, %r31
iob_intr_0_347:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_347), 16, 16)) -> intp(0, 0, 3e)
	.word 0x81956081  ! 4073: WRPR_TPC_I	wrpr	%r21, 0x0081, %tpc
	.word 0xbaade1c6  ! 4075: ANDNcc_I	andncc 	%r23, 0x01c6, %r29
iob_intr_0_348:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_348), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_310:
	setx	0x3d031b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_349:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_349), 16, 16)) -> intp(0, 0, 8)
	.word 0xb1e48000  ! 4079: SAVE_R	save	%r18, %r0, %r24
	.word 0xb4058000  ! 4082: ADD_R	add 	%r22, %r0, %r26
	.word 0xb7e521fd  ! 4084: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbde460cd  ! 4085: SAVE_I	save	%r17, 0x0001, %r30
cpu_intr_0_311:
	setx	0x3e0218, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_312:
	setx	0x3d0004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e1cc  ! 4093: SAVE_I	save	%r23, 0x0001, %r31
cpu_intr_0_313:
	setx	0x3d033f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_180:
	mov	0x37, %r14
	.word 0xf2db8400  ! 4097: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb5e4c000  ! 4099: SAVE_R	save	%r19, %r0, %r26
T0_asi_reg_rd_181:
	mov	0x21, %r14
	.word 0xfedb8e40  ! 4100: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_wr_182:
	mov	0x3c2, %r14
	.word 0xf4f38e40  ! 4104: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbfe4a1f9  ! 4105: SAVE_I	save	%r18, 0x0001, %r31
cpu_intr_0_314:
	setx	0x3d0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e012  ! 4109: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb7e50000  ! 4110: SAVE_R	save	%r20, %r0, %r27
iob_intr_0_350:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_350), 16, 16)) -> intp(0, 0, 1a)
	.word 0xbfe460d9  ! 4115: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb5e4a0b8  ! 4118: SAVE_I	save	%r18, 0x0001, %r26
T0_asi_reg_wr_183:
	mov	0x3c6, %r14
	.word 0xfcf38e60  ! 4120: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T0_asi_reg_rd_182:
	mov	0xb, %r14
	.word 0xf6db8e60  ! 4121: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb9e420b8  ! 4123: SAVE_I	save	%r16, 0x0001, %r28
T0_asi_reg_rd_183:
	mov	0x1c, %r14
	.word 0xfadb84a0  ! 4124: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_0_315:
	setx	0x420312, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_184:
	mov	0x3c8, %r14
	.word 0xf0f389e0  ! 4127: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbbe5c000  ! 4130: SAVE_R	save	%r23, %r0, %r29
T0_asi_reg_rd_184:
	mov	0x19, %r14
	.word 0xfedb8e40  ! 4131: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb034e193  ! 4133: SUBC_I	orn 	%r19, 0x0193, %r24
	.word 0xbcb50000  ! 4134: ORNcc_R	orncc 	%r20, %r0, %r30
	.word 0xbbe44000  ! 4135: SAVE_R	save	%r17, %r0, %r29
	.word 0xbbe5c000  ! 4137: SAVE_R	save	%r23, %r0, %r29
	.word 0xb7e4c000  ! 4138: SAVE_R	save	%r19, %r0, %r27
cpu_intr_0_316:
	setx	0x410128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 4144: SAVE_R	save	%r22, %r0, %r26
	.word 0xbcb40000  ! 4149: ORNcc_R	orncc 	%r16, %r0, %r30
	.word 0xb1e42130  ! 4151: SAVE_I	save	%r16, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_317:
	setx	0x410121, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_318:
	setx	0x400328, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_351:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_351), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb5e4e039  ! 4165: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_rd_185:
	mov	0x1, %r14
	.word 0xf8db8e40  ! 4166: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_wr_185:
	mov	0xa, %r14
	.word 0xfaf38400  ! 4167: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb9e48000  ! 4168: SAVE_R	save	%r18, %r0, %r28
	.word 0xbbe5214c  ! 4170: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb9e52031  ! 4174: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_319:
	setx	0x41002b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_186:
	mov	0x20, %r14
	.word 0xfcf38400  ! 4181: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T0_asi_reg_wr_187:
	mov	0x21, %r14
	.word 0xf8f38400  ! 4184: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T0_asi_reg_wr_188:
	mov	0x3c0, %r14
	.word 0xf0f38e40  ! 4188: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_wr_189:
	mov	0xc, %r14
	.word 0xf4f38e80  ! 4192: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbbe50000  ! 4193: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_352:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_352), 16, 16)) -> intp(0, 0, 28)
	.word 0xb9e42079  ! 4195: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbde4a13e  ! 4199: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbc1d60ad  ! 4202: XOR_I	xor 	%r21, 0x00ad, %r30
	.word 0xbde4c000  ! 4204: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_320:
	setx	0x420103, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_190:
	mov	0xd, %r14
	.word 0xf2f38400  ! 4209: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_0_353:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_353), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb63c0000  ! 4211: XNOR_R	xnor 	%r16, %r0, %r27
	.word 0xb3340000  ! 4213: SRL_R	srl 	%r16, %r0, %r25
	.word 0xb1e5c000  ! 4214: SAVE_R	save	%r23, %r0, %r24
	.word 0xbbe58000  ! 4215: SAVE_R	save	%r22, %r0, %r29
cpu_intr_0_321:
	setx	0x42001b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_191:
	mov	0x8, %r14
	.word 0xf8f38e40  ! 4219: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_rd_186:
	mov	0xd, %r14
	.word 0xf8db8e60  ! 4221: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_0_354:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_354), 16, 16)) -> intp(0, 0, 3f)
iob_intr_0_355:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_355), 16, 16)) -> intp(0, 0, 21)
	.word 0xb7e44000  ! 4229: SAVE_R	save	%r17, %r0, %r27
	.word 0xbbe40000  ! 4231: SAVE_R	save	%r16, %r0, %r29
cpu_intr_0_322:
	setx	0x410231, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_323:
	setx	0x43013a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_356:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_356), 16, 16)) -> intp(0, 0, 19)
T0_asi_reg_rd_187:
	mov	0x3c8, %r14
	.word 0xfcdb8e80  ! 4236: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb7e54000  ! 4238: SAVE_R	save	%r21, %r0, %r27
	.word 0xbbe44000  ! 4245: SAVE_R	save	%r17, %r0, %r29
	.word 0xbfe5606a  ! 4246: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_rd_188:
	mov	0x10, %r14
	.word 0xf4db8400  ! 4248: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_0_357:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_357), 16, 16)) -> intp(0, 0, 28)
	.word 0xb9e5a157  ! 4252: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb9e5205b  ! 4255: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb5355000  ! 4256: SRLX_R	srlx	%r21, %r0, %r26
	.word 0xb5e44000  ! 4257: SAVE_R	save	%r17, %r0, %r26
cpu_intr_0_324:
	setx	0x410336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5611f  ! 4259: SAVE_I	save	%r21, 0x0001, %r28
iob_intr_0_358:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_358), 16, 16)) -> intp(0, 0, 28)
T0_asi_reg_wr_192:
	mov	0xe, %r14
	.word 0xf8f389e0  ! 4266: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_0_359:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_359), 16, 16)) -> intp(0, 0, 9)
cpu_intr_0_325:
	setx	0x42012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb17c0400  ! 4274: MOVR_R	movre	%r16, %r0, %r24
	.word 0xb9e44000  ! 4275: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_rd_189:
	mov	0x3c0, %r14
	.word 0xf4db89e0  ! 4276: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_0_326:
	setx	0x43002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9643801  ! 4279: MOVcc_I	<illegal instruction>
	.word 0xb5e50000  ! 4283: SAVE_R	save	%r20, %r0, %r26
cpu_intr_0_327:
	setx	0x41023d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_328:
	setx	0x430338, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_360:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_360), 16, 16)) -> intp(0, 0, 23)
	.word 0xb7e461d6  ! 4292: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb9e42091  ! 4294: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb72c6001  ! 4295: SLL_I	sll 	%r17, 0x0001, %r27
cpu_intr_0_329:
	setx	0x430034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e48000  ! 4300: SAVE_R	save	%r18, %r0, %r28
	.word 0xb5e460a4  ! 4302: SAVE_I	save	%r17, 0x0001, %r26
iob_intr_0_361:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_361), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_rd_190:
	mov	0x7, %r14
	.word 0xf0db8e60  ! 4304: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T0_asi_reg_rd_191:
	mov	0x3c5, %r14
	.word 0xf0db89e0  ! 4307: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_0_362:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_362), 16, 16)) -> intp(0, 0, 14)
	.word 0xb1e5602f  ! 4310: SAVE_I	save	%r21, 0x0001, %r24
iob_intr_0_363:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_363), 16, 16)) -> intp(0, 0, 18)
	.word 0xb4042142  ! 4318: ADD_I	add 	%r16, 0x0142, %r26
T0_asi_reg_wr_193:
	mov	0x14, %r14
	.word 0xf4f38e80  ! 4319: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb9e58000  ! 4320: SAVE_R	save	%r22, %r0, %r28
T0_asi_reg_wr_194:
	mov	0x1a, %r14
	.word 0xfef38400  ! 4324: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xba9c4000  ! 4327: XORcc_R	xorcc 	%r17, %r0, %r29
iob_intr_0_364:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_364), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_wr_195:
	mov	0x3c2, %r14
	.word 0xf4f389e0  ! 4332: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb9e56041  ! 4333: SAVE_I	save	%r21, 0x0001, %r28
cpu_intr_0_330:
	setx	0x420020, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_331:
	setx	0x420009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5616b  ! 4341: SAVE_I	save	%r21, 0x0001, %r31
cpu_intr_0_332:
	setx	0x420325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb434c000  ! 4345: ORN_R	orn 	%r19, %r0, %r26
	.word 0xb7e54000  ! 4346: SAVE_R	save	%r21, %r0, %r27
cpu_intr_0_333:
	setx	0x40020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe356134  ! 4350: SUBC_I	orn 	%r21, 0x0134, %r31
	.word 0xbfe58000  ! 4352: SAVE_R	save	%r22, %r0, %r31
	.word 0xbfe5202d  ! 4354: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_365:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_365), 16, 16)) -> intp(0, 0, 3b)
cpu_intr_0_334:
	setx	0x42023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb51c000  ! 4360: RDPR_TL	<illegal instruction>
cpu_intr_0_335:
	setx	0x420209, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_196:
	mov	0x3c1, %r14
	.word 0xf4f384a0  ! 4365: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T0_asi_reg_rd_192:
	mov	0xf, %r14
	.word 0xf8db8e80  ! 4366: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_0_366:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_366), 16, 16)) -> intp(0, 0, 19)
cpu_intr_0_336:
	setx	0x42002b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_337:
	setx	0x42033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e042  ! 4374: SAVE_I	save	%r19, 0x0001, %r30
iob_intr_0_367:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_367), 16, 16)) -> intp(0, 0, 2e)
T0_asi_reg_rd_193:
	mov	0x22, %r14
	.word 0xfcdb8e40  ! 4381: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbd348000  ! 4384: SRL_R	srl 	%r18, %r0, %r30
	.word 0xb894e115  ! 4386: ORcc_I	orcc 	%r19, 0x0115, %r28
cpu_intr_0_338:
	setx	0x40012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe460b6  ! 4391: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb485a0c0  ! 4397: ADDcc_I	addcc 	%r22, 0x00c0, %r26
cpu_intr_0_339:
	setx	0x43011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc340000  ! 4401: ORN_R	orn 	%r16, %r0, %r30
	.word 0xb9e58000  ! 4403: SAVE_R	save	%r22, %r0, %r28
	.word 0xb83de1f8  ! 4404: XNOR_I	xnor 	%r23, 0x01f8, %r28
	.word 0xb9e48000  ! 4408: SAVE_R	save	%r18, %r0, %r28
iob_intr_0_368:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_368), 16, 16)) -> intp(0, 0, 26)
iob_intr_0_369:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_369), 16, 16)) -> intp(0, 0, 4)
T0_asi_reg_wr_197:
	mov	0x3c4, %r14
	.word 0xf4f389e0  ! 4411: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb4858000  ! 4412: ADDcc_R	addcc 	%r22, %r0, %r26
T0_asi_reg_rd_194:
	mov	0x16, %r14
	.word 0xfedb8e60  ! 4413: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_0_340:
	setx	0x420207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a153  ! 4416: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbbe4e070  ! 4419: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbbe5e1a1  ! 4420: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb9e5c000  ! 4421: SAVE_R	save	%r23, %r0, %r28
cpu_intr_0_341:
	setx	0x400229, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_195:
	mov	0x37, %r14
	.word 0xf6db8400  ! 4426: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_0_342:
	setx	0x410232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb295a0ec  ! 4428: ORcc_I	orcc 	%r22, 0x00ec, %r25
iob_intr_0_370:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_370), 16, 16)) -> intp(0, 0, 12)
cpu_intr_0_343:
	setx	0x43022e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_344:
	setx	0x420114, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_198:
	mov	0x32, %r14
	.word 0xf4f384a0  ! 4433: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T0_asi_reg_wr_199:
	mov	0x16, %r14
	.word 0xfaf38e60  ! 4435: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_0_345:
	setx	0x41013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4c000  ! 4441: SAVE_R	save	%r19, %r0, %r29
iob_intr_0_371:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_371), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbde5a0e5  ! 4445: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbde4e0d7  ! 4447: SAVE_I	save	%r19, 0x0001, %r30
cpu_intr_0_346:
	setx	0x41033b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_196:
	mov	0x4, %r14
	.word 0xf6db8e80  ! 4451: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_0_347:
	setx	0x400222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a0af  ! 4457: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_372:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_372), 16, 16)) -> intp(0, 0, 1b)
	.word 0xbde520b5  ! 4459: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbde54000  ! 4463: SAVE_R	save	%r21, %r0, %r30
T0_asi_reg_rd_197:
	mov	0x2f, %r14
	.word 0xf0db8e80  ! 4466: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_0_373:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_373), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_wr_200:
	mov	0x34, %r14
	.word 0xfcf38e40  ! 4472: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_374:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_374), 16, 16)) -> intp(0, 0, 12)
cpu_intr_0_348:
	setx	0x420228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a18a  ! 4477: SAVE_I	save	%r22, 0x0001, %r25
iob_intr_0_375:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_375), 16, 16)) -> intp(0, 0, 1a)
T0_asi_reg_rd_198:
	mov	0x15, %r14
	.word 0xf4db8e60  ! 4480: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_0_376:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_376), 16, 16)) -> intp(0, 0, 12)
iob_intr_0_377:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_377), 16, 16)) -> intp(0, 0, c)
cpu_intr_0_349:
	setx	0x410210, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_350:
	setx	0x420337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb09c4000  ! 4494: XORcc_R	xorcc 	%r17, %r0, %r24
	.word 0xbbe5c000  ! 4499: SAVE_R	save	%r23, %r0, %r29
iob_intr_0_378:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_378), 16, 16)) -> intp(0, 0, 25)
T0_asi_reg_rd_199:
	mov	0x24, %r14
	.word 0xf2db8e80  ! 4501: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T0_asi_reg_wr_201:
	mov	0x37, %r14
	.word 0xfef38e80  ! 4504: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb9e48000  ! 4505: SAVE_R	save	%r18, %r0, %r28
cpu_intr_0_351:
	setx	0x40003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a0e2  ! 4508: SAVE_I	save	%r18, 0x0001, %r24
iob_intr_0_379:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_379), 16, 16)) -> intp(0, 0, 15)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe58000  ! 4513: SAVE_R	save	%r22, %r0, %r31
iob_intr_0_380:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_380), 16, 16)) -> intp(0, 0, 22)
	.word 0xbca5c000  ! 4515: SUBcc_R	subcc 	%r23, %r0, %r30
	.word 0xb9e42013  ! 4520: SAVE_I	save	%r16, 0x0001, %r28
cpu_intr_0_352:
	setx	0x430118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 4524: SAVE_R	save	%r16, %r0, %r24
	.word 0xbde560d3  ! 4530: SAVE_I	save	%r21, 0x0001, %r30
iob_intr_0_381:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_381), 16, 16)) -> intp(0, 0, 1b)
cpu_intr_0_353:
	setx	0x430315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e1c8  ! 4537: SAVE_I	save	%r23, 0x0001, %r28
cpu_intr_0_354:
	setx	0x400024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_355:
	setx	0x420037, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_382:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_382), 16, 16)) -> intp(0, 0, 1b)
cpu_intr_0_356:
	setx	0x410202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e175  ! 4549: SAVE_I	save	%r23, 0x0001, %r28
cpu_intr_0_357:
	setx	0x40013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4a008  ! 4554: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_rd_200:
	mov	0x3c3, %r14
	.word 0xfadb89e0  ! 4558: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb9e4c000  ! 4559: SAVE_R	save	%r19, %r0, %r28
T0_asi_reg_rd_201:
	mov	0x2d, %r14
	.word 0xf0db8400  ! 4560: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_0_358:
	setx	0x400217, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_383:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_383), 16, 16)) -> intp(0, 0, 10)
	.word 0xbfe44000  ! 4570: SAVE_R	save	%r17, %r0, %r31
cpu_intr_0_359:
	setx	0x430335, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_202:
	mov	0x1a, %r14
	.word 0xf6db8e80  ! 4574: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_0_360:
	setx	0x42002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4610d  ! 4576: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb9e4a0b8  ! 4577: SAVE_I	save	%r18, 0x0001, %r28
cpu_intr_0_361:
	setx	0x400018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e11a  ! 4579: SAVE_I	save	%r19, 0x0001, %r27
T0_asi_reg_rd_203:
	mov	0x21, %r14
	.word 0xf4db8e80  ! 4580: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbde420c2  ! 4581: SAVE_I	save	%r16, 0x0001, %r30
iob_intr_0_384:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_384), 16, 16)) -> intp(0, 0, 17)
	.word 0xb5e50000  ! 4583: SAVE_R	save	%r20, %r0, %r26
	.word 0xb7e4e126  ! 4585: SAVE_I	save	%r19, 0x0001, %r27
iob_intr_0_385:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_385), 16, 16)) -> intp(0, 0, 34)
	.word 0xbfe461fa  ! 4587: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_wr_202:
	mov	0x3, %r14
	.word 0xf2f38e80  ! 4588: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbfe5e077  ! 4591: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb0a48000  ! 4593: SUBcc_R	subcc 	%r18, %r0, %r24
	.word 0xb1e521c9  ! 4594: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb0248000  ! 4596: SUB_R	sub 	%r18, %r0, %r24
T0_asi_reg_rd_204:
	mov	0x3c8, %r14
	.word 0xfadb8e40  ! 4597: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbbe421c8  ! 4598: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb01da0e2  ! 4599: XOR_I	xor 	%r22, 0x00e2, %r24
cpu_intr_0_362:
	setx	0x450300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde54000  ! 4602: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_363:
	setx	0x47032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e52096  ! 4606: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb7e461c1  ! 4610: SAVE_I	save	%r17, 0x0001, %r27
T0_asi_reg_rd_205:
	mov	0x27, %r14
	.word 0xf2db8e40  ! 4613: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbfe4a163  ! 4614: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb445a1a3  ! 4615: ADDC_I	addc 	%r22, 0x01a3, %r26
iob_intr_0_386:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_386), 16, 16)) -> intp(0, 0, 7)
	.word 0xb1e460de  ! 4619: SAVE_I	save	%r17, 0x0001, %r24
iob_intr_0_387:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_387), 16, 16)) -> intp(0, 0, 9)
iob_intr_0_388:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_388), 16, 16)) -> intp(0, 0, 38)
cpu_intr_0_364:
	setx	0x460216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_389:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_389), 16, 16)) -> intp(0, 0, 10)
cpu_intr_0_365:
	setx	0x44022d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_390:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_390), 16, 16)) -> intp(0, 0, 33)
T0_asi_reg_wr_203:
	mov	0x3c1, %r14
	.word 0xf0f38e60  ! 4631: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T0_asi_reg_wr_204:
	mov	0x3, %r14
	.word 0xf2f38e40  ! 4633: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_0_366:
	setx	0x470135, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_391:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_391), 16, 16)) -> intp(0, 0, 21)
cpu_intr_0_367:
	setx	0x47023e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_205:
	mov	0x17, %r14
	.word 0xfef38e40  ! 4641: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbbe560e8  ! 4642: SAVE_I	save	%r21, 0x0001, %r29
iob_intr_0_392:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_392), 16, 16)) -> intp(0, 0, 4)
	.word 0xb1e4a1f8  ! 4645: SAVE_I	save	%r18, 0x0001, %r24
T0_asi_reg_wr_206:
	mov	0x3c6, %r14
	.word 0xf0f38e40  ! 4647: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb1e520c4  ! 4648: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb9344000  ! 4653: SRL_R	srl 	%r17, %r0, %r28
iob_intr_0_393:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_393), 16, 16)) -> intp(0, 0, 10)
	.word 0xb88c0000  ! 4656: ANDcc_R	andcc 	%r16, %r0, %r28
	.word 0xb1e52135  ! 4659: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x89942058  ! 4660: WRPR_TICK_I	wrpr	%r16, 0x0058, %tick
iob_intr_0_394:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_394), 16, 16)) -> intp(0, 0, 3b)
iob_intr_0_395:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_395), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb7e421db  ! 4669: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbfe44000  ! 4671: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_396:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_396), 16, 16)) -> intp(0, 0, 18)
T0_asi_reg_rd_206:
	mov	0x8, %r14
	.word 0xf0db8e40  ! 4674: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_rd_207:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 4677: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_0_397:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_397), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_wr_207:
	mov	0x3c3, %r14
	.word 0xf0f384a0  ! 4689: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb9e420ad  ! 4693: SAVE_I	save	%r16, 0x0001, %r28
cpu_intr_0_368:
	setx	0x44033f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_398:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_398), 16, 16)) -> intp(0, 0, 11)
T0_asi_reg_rd_208:
	mov	0x3c5, %r14
	.word 0xfedb8e80  ! 4713: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xbbe52186  ! 4714: SAVE_I	save	%r20, 0x0001, %r29
cpu_intr_0_369:
	setx	0x45023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a092  ! 4716: SAVE_I	save	%r22, 0x0001, %r29
T0_asi_reg_wr_208:
	mov	0xe, %r14
	.word 0xfaf38400  ! 4718: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T0_asi_reg_wr_209:
	mov	0x36, %r14
	.word 0xf0f38400  ! 4719: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_370:
	setx	0x440113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5a038  ! 4723: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_wr_210:
	mov	0x15, %r14
	.word 0xf6f38e40  ! 4727: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb8940000  ! 4729: ORcc_R	orcc 	%r16, %r0, %r28
	.word 0xbde48000  ! 4734: SAVE_R	save	%r18, %r0, %r30
	.word 0xb7e4c000  ! 4735: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_rd_209:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 4736: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_rd_210:
	mov	0x3c7, %r14
	.word 0xfedb8e40  ! 4737: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_0_371:
	setx	0x450314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b54000  ! 4743: ORNcc_R	orncc 	%r21, %r0, %r25
	.word 0xb3e5e071  ! 4746: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbab5e074  ! 4749: ORNcc_I	orncc 	%r23, 0x0074, %r29
	.word 0xb9e4202f  ! 4753: SAVE_I	save	%r16, 0x0001, %r28
iob_intr_0_399:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_399), 16, 16)) -> intp(0, 0, 2b)
cpu_intr_0_372:
	setx	0x460326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf2c6001  ! 4764: SLL_I	sll 	%r17, 0x0001, %r31
cpu_intr_0_373:
	setx	0x47013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba9d0000  ! 4768: XORcc_R	xorcc 	%r20, %r0, %r29
	.word 0xb5e52032  ! 4772: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb5e46163  ! 4773: SAVE_I	save	%r17, 0x0001, %r26
iob_intr_0_400:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_400), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_rd_211:
	mov	0x3c8, %r14
	.word 0xfadb8e80  ! 4777: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb835e0f1  ! 4778: SUBC_I	orn 	%r23, 0x00f1, %r28
iob_intr_0_401:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_401), 16, 16)) -> intp(0, 0, 3c)
iob_intr_0_402:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_402), 16, 16)) -> intp(0, 0, 35)
	.word 0xbde5e02d  ! 4786: SAVE_I	save	%r23, 0x0001, %r30
iob_intr_0_403:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_403), 16, 16)) -> intp(0, 0, 17)
	.word 0xb43d0000  ! 4793: XNOR_R	xnor 	%r20, %r0, %r26
	.word 0xbde5e1fc  ! 4794: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbfe5c000  ! 4795: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_404:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_404), 16, 16)) -> intp(0, 0, 6)
	.word 0xb2346028  ! 4798: ORN_I	orn 	%r17, 0x0028, %r25
	.word 0xb9e42180  ! 4801: SAVE_I	save	%r16, 0x0001, %r28
T0_asi_reg_rd_212:
	mov	0xd, %r14
	.word 0xf6db8e40  ! 4805: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_405:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_405), 16, 16)) -> intp(0, 0, 26)
	.word 0xbde4e070  ! 4810: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5e4c000  ! 4812: SAVE_R	save	%r19, %r0, %r26
cpu_intr_0_374:
	setx	0x470308, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_213:
	mov	0x3c6, %r14
	.word 0xfadb8e60  ! 4814: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_0_406:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_406), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbfe44000  ! 4821: SAVE_R	save	%r17, %r0, %r31
cpu_intr_0_375:
	setx	0x45000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba25e1ad  ! 4824: SUB_I	sub 	%r23, 0x01ad, %r29
cpu_intr_0_376:
	setx	0x470106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5c000  ! 4829: SAVE_R	save	%r23, %r0, %r25
	.word 0xb5e4a0c6  ! 4839: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbc050000  ! 4841: ADD_R	add 	%r20, %r0, %r30
T0_asi_reg_wr_211:
	mov	0x33, %r14
	.word 0xf2f38e40  ! 4842: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0x8d94a00e  ! 4843: WRPR_PSTATE_I	wrpr	%r18, 0x000e, %pstate
T0_asi_reg_rd_214:
	mov	0x10, %r14
	.word 0xf8db84a0  ! 4845: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb7e561aa  ! 4846: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_wr_212:
	mov	0x38, %r14
	.word 0xfcf38e40  ! 4847: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_377:
	setx	0x470107, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_378:
	setx	0x47021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7520000  ! 4850: RDPR_PIL	<illegal instruction>
T0_asi_reg_wr_213:
	mov	0x13, %r14
	.word 0xfef38e60  ! 4853: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_0_407:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_407), 16, 16)) -> intp(0, 0, 1f)
iob_intr_0_408:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_408), 16, 16)) -> intp(0, 0, 15)
T0_asi_reg_rd_215:
	mov	0x7, %r14
	.word 0xf0db8e40  ! 4868: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_409:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_409), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_379:
	setx	0x440010, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_410:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_410), 16, 16)) -> intp(0, 0, f)
T0_asi_reg_rd_216:
	mov	0x3c8, %r14
	.word 0xf2db89e0  ! 4872: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T0_asi_reg_rd_217:
	mov	0x19, %r14
	.word 0xfadb84a0  ! 4873: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_0_411:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_411), 16, 16)) -> intp(0, 0, 35)
	.word 0xb5e58000  ! 4877: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_wr_214:
	mov	0x2a, %r14
	.word 0xf0f38e40  ! 4878: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbbe48000  ! 4879: SAVE_R	save	%r18, %r0, %r29
	.word 0xb3e4a0db  ! 4880: SAVE_I	save	%r18, 0x0001, %r25
T0_asi_reg_rd_218:
	mov	0x33, %r14
	.word 0xf8db8e40  ! 4881: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_380:
	setx	0x470038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4614a  ! 4883: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb0bca12c  ! 4884: XNORcc_I	xnorcc 	%r18, 0x012c, %r24
	.word 0xb7e5c000  ! 4886: SAVE_R	save	%r23, %r0, %r27
cpu_intr_0_381:
	setx	0x470316, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_412:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_412), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_413:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_413), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_wr_215:
	mov	0x1e, %r14
	.word 0xf2f384a0  ! 4894: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T0_asi_reg_wr_216:
	mov	0xc, %r14
	.word 0xfcf384a0  ! 4896: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T0_asi_reg_rd_219:
	mov	0x2e, %r14
	.word 0xf0db89e0  ! 4899: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T0_asi_reg_wr_217:
	mov	0x3c5, %r14
	.word 0xfcf38e40  ! 4900: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb5e44000  ! 4901: SAVE_R	save	%r17, %r0, %r26
	.word 0xba95e04f  ! 4902: ORcc_I	orcc 	%r23, 0x004f, %r29
iob_intr_0_414:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_414), 16, 16)) -> intp(0, 0, 18)
	.word 0xbc1c60a6  ! 4904: XOR_I	xor 	%r17, 0x00a6, %r30
	.word 0xb7e4617a  ! 4907: SAVE_I	save	%r17, 0x0001, %r27
T0_asi_reg_rd_220:
	mov	0x21, %r14
	.word 0xf8db8e40  ! 4908: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbbe56181  ! 4909: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e461ba  ! 4910: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbde5c000  ! 4913: SAVE_R	save	%r23, %r0, %r30
T0_asi_reg_wr_218:
	mov	0x19, %r14
	.word 0xf0f384a0  ! 4917: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_0_382:
	setx	0x44021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb7d8400  ! 4919: MOVR_R	movre	%r22, %r0, %r29
	.word 0xbbe421e3  ! 4920: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_415:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_415), 16, 16)) -> intp(0, 0, c)
T0_asi_reg_wr_219:
	mov	0x15, %r14
	.word 0xf4f38e40  ! 4922: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbde40000  ! 4923: SAVE_R	save	%r16, %r0, %r30
cpu_intr_0_383:
	setx	0x46011f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_220:
	mov	0x3c3, %r14
	.word 0xf4f38e40  ! 4929: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb3e4204e  ! 4932: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb80561e5  ! 4934: ADD_I	add 	%r21, 0x01e5, %r28
cpu_intr_0_384:
	setx	0x470100, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_221:
	mov	0x3c3, %r14
	.word 0xf4db8e80  ! 4937: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T0_asi_reg_wr_221:
	mov	0x26, %r14
	.word 0xf0f38e80  ! 4938: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T0_asi_reg_wr_222:
	mov	0x26, %r14
	.word 0xfef389e0  ! 4939: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbe1d8000  ! 4940: XOR_R	xor 	%r22, %r0, %r31
	.word 0xba054000  ! 4944: ADD_R	add 	%r21, %r0, %r29
	.word 0xb9e40000  ! 4946: SAVE_R	save	%r16, %r0, %r28
	.word 0xbfe4e144  ! 4948: SAVE_I	save	%r19, 0x0001, %r31
cpu_intr_0_385:
	setx	0x450331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde54000  ! 4955: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_386:
	setx	0x450310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a047  ! 4960: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb77d8400  ! 4961: MOVR_R	movre	%r22, %r0, %r27
	.word 0xb9e48000  ! 4963: SAVE_R	save	%r18, %r0, %r28
	.word 0xb5e4e129  ! 4965: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_rd_222:
	mov	0x2c, %r14
	.word 0xf4db84a0  ! 4968: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_0_416:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_416), 16, 16)) -> intp(0, 0, 21)
cpu_intr_0_387:
	setx	0x45011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb82d21c1  ! 4972: ANDN_I	andn 	%r20, 0x01c1, %r28
	.word 0xbbe58000  ! 4973: SAVE_R	save	%r22, %r0, %r29
	.word 0xb2448000  ! 4975: ADDC_R	addc 	%r18, %r0, %r25
	.word 0xbde521c9  ! 4976: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_rd_223:
	mov	0x3c0, %r14
	.word 0xfadb8e60  ! 4980: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_0_388:
	setx	0x450117, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_389:
	setx	0x460122, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_224:
	mov	0x5, %r14
	.word 0xfcdb8e80  ! 4983: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb9e4e0d0  ! 4984: SAVE_I	save	%r19, 0x0001, %r28
cpu_intr_0_390:
	setx	0x460009, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_417:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_417), 16, 16)) -> intp(0, 0, 5)
T0_asi_reg_wr_223:
	mov	0x23, %r14
	.word 0xf2f38e40  ! 4988: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbbe44000  ! 4989: SAVE_R	save	%r17, %r0, %r29
cpu_intr_0_391:
	setx	0x460337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e48000  ! 4995: SAVE_R	save	%r18, %r0, %r25
	.word 0xbde40000  ! 4997: SAVE_R	save	%r16, %r0, %r30
T0_asi_reg_wr_224:
	mov	0xe, %r14
	.word 0xf8f38e40  ! 4998: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_418:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_418), 16, 16)) -> intp(0, 0, 3a)
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
iob_intr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_0), 16, 16)) -> intp(3, 0, 25)
	.word 0xfa25e135  ! 5: STW_I	stw	%r29, [%r23 + 0x0135]
	.word 0xf2352034  ! 6: STH_I	sth	%r25, [%r20 + 0x0034]
T3_asi_reg_wr_0:
	mov	0x3c1, %r14
	.word 0xfef384a0  ! 7: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xfca560b5  ! 8: STWA_I	stwa	%r30, [%r21 + 0x00b5] %asi
T3_asi_reg_wr_1:
	mov	0x3c1, %r14
	.word 0xf0f384a0  ! 9: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_3_0:
	setx	0x1f020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72ca001  ! 12: SLL_I	sll 	%r18, 0x0001, %r27
	.word 0xfaf421db  ! 13: STXA_I	stxa	%r29, [%r16 + 0x01db] %asi
cpu_intr_3_1:
	setx	0x1d0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca48020  ! 16: STWA_R	stwa	%r30, [%r18 + %r0] 0x01
iob_intr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_1), 16, 16)) -> intp(3, 0, 2d)
	.word 0xb3342001  ! 26: SRL_I	srl 	%r16, 0x0001, %r25
cpu_intr_3_2:
	setx	0x1c0307, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_2), 16, 16)) -> intp(3, 0, 5)
	.word 0xfeace0d6  ! 30: STBA_I	stba	%r31, [%r19 + 0x00d6] %asi
	.word 0xf02c20f9  ! 31: STB_I	stb	%r24, [%r16 + 0x00f9]
T3_asi_reg_wr_2:
	mov	0xe, %r14
	.word 0xf2f38e40  ! 32: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_3_3:
	setx	0x1f021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ace1d6  ! 34: STBA_I	stba	%r28, [%r19 + 0x01d6] %asi
	ta	T_CHANGE_TO_TL1
	.word 0xf0ad8020  ! 39: STBA_R	stba	%r24, [%r22 + %r0] 0x01
	.word 0xf8354000  ! 41: STH_R	sth	%r28, [%r21 + %r0]
	.word 0xb535a001  ! 42: SRL_I	srl 	%r22, 0x0001, %r26
cpu_intr_3_4:
	setx	0x1f021b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_3), 16, 16)) -> intp(3, 0, 39)
	.word 0xf8358000  ! 47: STH_R	sth	%r28, [%r22 + %r0]
cpu_intr_3_5:
	setx	0x1c0024, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_4), 16, 16)) -> intp(3, 0, 9)
	.word 0xfa25a0d5  ! 52: STW_I	stw	%r29, [%r22 + 0x00d5]
	.word 0xf4248000  ! 55: STW_R	stw	%r26, [%r18 + %r0]
	.word 0xa1902000  ! 57: WRPR_GL_I	wrpr	%r0, 0x0000, %-
cpu_intr_3_6:
	setx	0x1d0316, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_0:
	mov	0x3c5, %r14
	.word 0xf8db8e60  ! 60: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T3_asi_reg_rd_1:
	mov	0x3c3, %r14
	.word 0xfedb89e0  ! 62: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_5), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf02da1ae  ! 66: STB_I	stb	%r24, [%r22 + 0x01ae]
	.word 0xfa2d2086  ! 68: STB_I	stb	%r29, [%r20 + 0x0086]
cpu_intr_3_7:
	setx	0x1f0219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02cc000  ! 71: STB_R	stb	%r24, [%r19 + %r0]
	.word 0xf02d0000  ! 73: STB_R	stb	%r24, [%r20 + %r0]
cpu_intr_3_8:
	setx	0x1e0028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcac8020  ! 76: STBA_R	stba	%r30, [%r18 + %r0] 0x01
T3_asi_reg_wr_3:
	mov	0x3c5, %r14
	.word 0xfaf389e0  ! 79: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xfef460c5  ! 83: STXA_I	stxa	%r31, [%r17 + 0x00c5] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf82c8000  ! 91: STB_R	stb	%r28, [%r18 + %r0]
	.word 0xf8ad215c  ! 92: STBA_I	stba	%r28, [%r20 + 0x015c] %asi
cpu_intr_3_9:
	setx	0x1e000a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_6), 16, 16)) -> intp(3, 0, 1a)
	.word 0xb2452183  ! 99: ADDC_I	addc 	%r20, 0x0183, %r25
	.word 0xb53dd000  ! 106: SRAX_R	srax	%r23, %r0, %r26
	.word 0xfaa58020  ! 109: STWA_R	stwa	%r29, [%r22 + %r0] 0x01
	.word 0xb8a54000  ! 110: SUBcc_R	subcc 	%r21, %r0, %r28
T3_asi_reg_rd_2:
	mov	0x3c8, %r14
	.word 0xfedb89e0  ! 111: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_7), 16, 16)) -> intp(3, 0, 28)
iob_intr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_8), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_10:
	setx	0x1d022a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_4:
	mov	0x12, %r14
	.word 0xfef38e80  ! 123: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_3_11:
	setx	0x1e0004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe25e190  ! 125: STW_I	stw	%r31, [%r23 + 0x0190]
	.word 0xb734b001  ! 127: SRLX_I	srlx	%r18, 0x0001, %r27
	.word 0xbb7dc400  ! 138: MOVR_R	movre	%r23, %r0, %r29
iob_intr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_9), 16, 16)) -> intp(3, 0, 39)
	.word 0xf0b4c020  ! 142: STHA_R	stha	%r24, [%r19 + %r0] 0x01
T3_asi_reg_wr_5:
	mov	0x3, %r14
	.word 0xfcf38e80  ! 144: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_10), 16, 16)) -> intp(3, 0, 1d)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfaad8020  ! 148: STBA_R	stba	%r29, [%r22 + %r0] 0x01
	.word 0xf8240000  ! 149: STW_R	stw	%r28, [%r16 + %r0]
iob_intr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_11), 16, 16)) -> intp(3, 0, 17)
T3_asi_reg_wr_6:
	mov	0x26, %r14
	.word 0xf4f384a0  ! 152: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_3_12:
	setx	0x1e030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_13:
	setx	0x1f030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe74616c  ! 155: STX_I	stx	%r31, [%r17 + 0x016c]
	.word 0xf2ada115  ! 157: STBA_I	stba	%r25, [%r22 + 0x0115] %asi
	.word 0xfeb54020  ! 159: STHA_R	stha	%r31, [%r21 + %r0] 0x01
cpu_intr_3_14:
	setx	0x1e0206, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_15:
	setx	0x1c0203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba35e099  ! 163: SUBC_I	orn 	%r23, 0x0099, %r29
	.word 0xf62d8000  ! 164: STB_R	stb	%r27, [%r22 + %r0]
T3_asi_reg_wr_7:
	mov	0x3c3, %r14
	.word 0xf0f389e0  ! 166: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbd3c0000  ! 167: SRA_R	sra 	%r16, %r0, %r30
	.word 0xb2356088  ! 168: ORN_I	orn 	%r21, 0x0088, %r25
iob_intr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_12), 16, 16)) -> intp(3, 0, 3f)
	.word 0xfc252028  ! 172: STW_I	stw	%r30, [%r20 + 0x0028]
	.word 0xf4740000  ! 175: STX_R	stx	%r26, [%r16 + %r0]
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982d8a  ! 176: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8a, %hpstate
cpu_intr_3_16:
	setx	0x1d0307, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_3:
	mov	0x28, %r14
	.word 0xf2db8e60  ! 178: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_3_17:
	setx	0x1c0300, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_18:
	setx	0x1e0237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72c1000  ! 184: SLLX_R	sllx	%r16, %r0, %r27
cpu_intr_3_19:
	setx	0x1d023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b50020  ! 186: STHA_R	stha	%r26, [%r20 + %r0] 0x01
iob_intr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_13), 16, 16)) -> intp(3, 0, 6)
T3_asi_reg_wr_8:
	mov	0x2d, %r14
	.word 0xf0f38400  ! 192: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T3_asi_reg_rd_4:
	mov	0x2b, %r14
	.word 0xf8db8400  ! 193: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xf634e06d  ! 195: STH_I	sth	%r27, [%r19 + 0x006d]
iob_intr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_14), 16, 16)) -> intp(3, 0, 1d)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_15), 16, 16)) -> intp(3, 0, 18)
	.word 0xf8ada1cb  ! 208: STBA_I	stba	%r28, [%r22 + 0x01cb] %asi
T3_asi_reg_rd_5:
	mov	0x25, %r14
	.word 0xf6db84a0  ! 210: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_20:
	setx	0x1f032f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_9:
	mov	0x3c2, %r14
	.word 0xf0f38e80  ! 217: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_16), 16, 16)) -> intp(3, 0, e)
	.word 0xf8a4a0f7  ! 220: STWA_I	stwa	%r28, [%r18 + 0x00f7] %asi
	.word 0xf0a4609d  ! 222: STWA_I	stwa	%r24, [%r17 + 0x009d] %asi
	.word 0xfc758000  ! 226: STX_R	stx	%r30, [%r22 + %r0]
	.word 0xb014c000  ! 228: OR_R	or 	%r19, %r0, %r24
iob_intr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_17), 16, 16)) -> intp(3, 0, 17)
	.word 0xfaada066  ! 230: STBA_I	stba	%r29, [%r22 + 0x0066] %asi
cpu_intr_3_21:
	setx	0x1f022e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_18), 16, 16)) -> intp(3, 0, 25)
	.word 0xbea48000  ! 238: SUBcc_R	subcc 	%r18, %r0, %r31
T3_asi_reg_wr_10:
	mov	0x3c7, %r14
	.word 0xf8f38e60  ! 239: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xfca48020  ! 241: STWA_R	stwa	%r30, [%r18 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_6:
	mov	0x3c8, %r14
	.word 0xfcdb8e60  ! 248: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb6b58000  ! 249: SUBCcc_R	orncc 	%r22, %r0, %r27
	.word 0xf074a190  ! 251: STX_I	stx	%r24, [%r18 + 0x0190]
cpu_intr_3_22:
	setx	0x1c0129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea5a044  ! 258: STWA_I	stwa	%r31, [%r22 + 0x0044] %asi
iob_intr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_19), 16, 16)) -> intp(3, 0, 21)
cpu_intr_3_23:
	setx	0x1c002b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_7:
	mov	0x28, %r14
	.word 0xf8db84a0  ! 262: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xfea5c020  ! 263: STWA_R	stwa	%r31, [%r23 + %r0] 0x01
T3_asi_reg_wr_11:
	mov	0x3c2, %r14
	.word 0xf6f384a0  ! 264: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_3_24:
	setx	0x1f0200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ad8020  ! 268: STBA_R	stba	%r24, [%r22 + %r0] 0x01
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983b08  ! 269: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b08, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0xbe1cc000  ! 272: XOR_R	xor 	%r19, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xf8b5a0bf  ! 276: STHA_I	stha	%r28, [%r22 + 0x00bf] %asi
	.word 0xbc8c0000  ! 277: ANDcc_R	andcc 	%r16, %r0, %r30
	.word 0xf0a50020  ! 285: STWA_R	stwa	%r24, [%r20 + %r0] 0x01
	.word 0xf0acc020  ! 287: STBA_R	stba	%r24, [%r19 + %r0] 0x01
T3_asi_reg_rd_8:
	mov	0x3c6, %r14
	.word 0xfcdb84a0  ! 288: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_3_25:
	setx	0x1f0027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_26:
	setx	0x1f030c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_20), 16, 16)) -> intp(3, 0, 3)
	.word 0xfa75216d  ! 293: STX_I	stx	%r29, [%r20 + 0x016d]
iob_intr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_21), 16, 16)) -> intp(3, 0, 35)
iob_intr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_22), 16, 16)) -> intp(3, 0, 1)
iob_intr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_23), 16, 16)) -> intp(3, 0, 1f)
T3_asi_reg_wr_12:
	mov	0x1f, %r14
	.word 0xf8f38e40  ! 298: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983d42  ! 299: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d42, %hpstate
	.word 0xfaac8020  ! 301: STBA_R	stba	%r29, [%r18 + %r0] 0x01
	.word 0xfcade07f  ! 302: STBA_I	stba	%r30, [%r23 + 0x007f] %asi
T3_asi_reg_wr_13:
	mov	0x3c7, %r14
	.word 0xf0f38e80  ! 308: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_24), 16, 16)) -> intp(3, 0, 34)
	.word 0xf82c2034  ! 313: STB_I	stb	%r28, [%r16 + 0x0034]
	.word 0xba446091  ! 315: ADDC_I	addc 	%r17, 0x0091, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf0f521c0  ! 322: STXA_I	stxa	%r24, [%r20 + 0x01c0] %asi
	.word 0xfc3561a3  ! 324: STH_I	sth	%r30, [%r21 + 0x01a3]
iob_intr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_25), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_wr_14:
	mov	0x32, %r14
	.word 0xfaf38e60  ! 326: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T3_asi_reg_rd_9:
	mov	0x3, %r14
	.word 0xf6db84a0  ! 327: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_3_27:
	setx	0x1c0016, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_26), 16, 16)) -> intp(3, 0, 9)
	.word 0xf6748000  ! 331: STX_R	stx	%r27, [%r18 + %r0]
	.word 0xbd347001  ! 333: SRLX_I	srlx	%r17, 0x0001, %r30
	.word 0xb2254000  ! 335: SUB_R	sub 	%r21, %r0, %r25
iob_intr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_27), 16, 16)) -> intp(3, 0, 34)
	.word 0xf4b44020  ! 339: STHA_R	stha	%r26, [%r17 + %r0] 0x01
T3_asi_reg_wr_15:
	mov	0x23, %r14
	.word 0xf4f38e40  ! 341: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_28), 16, 16)) -> intp(3, 0, 35)
T3_asi_reg_rd_10:
	mov	0x17, %r14
	.word 0xf4db8e40  ! 349: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf0ac2163  ! 350: STBA_I	stba	%r24, [%r16 + 0x0163] %asi
	.word 0xf2b54020  ! 351: STHA_R	stha	%r25, [%r21 + %r0] 0x01
T3_asi_reg_wr_16:
	mov	0x3c0, %r14
	.word 0xf4f389e0  ! 352: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xba948000  ! 354: ORcc_R	orcc 	%r18, %r0, %r29
	.word 0xf6748000  ! 355: STX_R	stx	%r27, [%r18 + %r0]
	.word 0xf4750000  ! 359: STX_R	stx	%r26, [%r20 + %r0]
T3_asi_reg_wr_17:
	mov	0x25, %r14
	.word 0xf8f38e40  ! 360: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_18:
	mov	0x3c7, %r14
	.word 0xfaf38e60  ! 365: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_3_28:
	setx	0x1d023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf634e0df  ! 370: STH_I	sth	%r27, [%r19 + 0x00df]
iob_intr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_29), 16, 16)) -> intp(3, 0, 5)
	.word 0xfe75a087  ! 373: STX_I	stx	%r31, [%r22 + 0x0087]
	.word 0xf22420ba  ! 377: STW_I	stw	%r25, [%r16 + 0x00ba]
	.word 0xf2344000  ! 378: STH_R	sth	%r25, [%r17 + %r0]
iob_intr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_30), 16, 16)) -> intp(3, 0, 1d)
T3_asi_reg_rd_11:
	mov	0x17, %r14
	.word 0xf6db8e60  ! 381: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_31), 16, 16)) -> intp(3, 0, 30)
iob_intr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_32), 16, 16)) -> intp(3, 0, 2a)
T3_asi_reg_rd_12:
	mov	0xd, %r14
	.word 0xfcdb8e80  ! 384: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf0340000  ! 385: STH_R	sth	%r24, [%r16 + %r0]
cpu_intr_3_29:
	setx	0x1f0210, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_33), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_wr_19:
	mov	0x2f, %r14
	.word 0xf0f38e40  ! 395: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf034e02e  ! 398: STH_I	sth	%r24, [%r19 + 0x002e]
	.word 0xf82da16e  ! 399: STB_I	stb	%r28, [%r22 + 0x016e]
	.word 0xf824210f  ! 401: STW_I	stw	%r28, [%r16 + 0x010f]
T3_asi_reg_rd_13:
	mov	0x28, %r14
	.word 0xf2db84a0  ! 402: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_34), 16, 16)) -> intp(3, 0, 0)
iob_intr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_35), 16, 16)) -> intp(3, 0, 30)
	ta	T_CHANGE_TO_TL1
	.word 0xf2adc020  ! 408: STBA_R	stba	%r25, [%r23 + %r0] 0x01
cpu_intr_3_30:
	setx	0x1d032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_14:
	mov	0x13, %r14
	.word 0xf8db84a0  ! 411: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xfaf461ee  ! 414: STXA_I	stxa	%r29, [%r17 + 0x01ee] %asi
iob_intr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_36), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_wr_20:
	mov	0x1e, %r14
	.word 0xfef38e80  ! 416: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf8254000  ! 417: STW_R	stw	%r28, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_15:
	mov	0x1a, %r14
	.word 0xf2db8e80  ! 420: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_3_31:
	setx	0x1d0011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8254000  ! 423: STW_R	stw	%r28, [%r21 + %r0]
	.word 0xf4b4c020  ! 426: STHA_R	stha	%r26, [%r19 + %r0] 0x01
cpu_intr_3_32:
	setx	0x1d0200, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_37), 16, 16)) -> intp(3, 0, 8)
iob_intr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_38), 16, 16)) -> intp(3, 0, 39)
cpu_intr_3_33:
	setx	0x1c013d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_39), 16, 16)) -> intp(3, 0, 26)
	.word 0xfa34a020  ! 433: STH_I	sth	%r29, [%r18 + 0x0020]
	.word 0x8d94a11b  ! 436: WRPR_PSTATE_I	wrpr	%r18, 0x011b, %pstate
iob_intr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_40), 16, 16)) -> intp(3, 0, f)
iob_intr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_41), 16, 16)) -> intp(3, 0, b)
	.word 0xbf641800  ! 440: MOVcc_R	<illegal instruction>
	.word 0xbd3cf001  ! 441: SRAX_I	srax	%r19, 0x0001, %r30
	.word 0xfeb40020  ! 442: STHA_R	stha	%r31, [%r16 + %r0] 0x01
T3_asi_reg_rd_16:
	mov	0x3c8, %r14
	.word 0xfcdb8e60  ! 444: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_3_34:
	setx	0x1e032a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_35:
	setx	0x1c0138, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_21:
	mov	0x5, %r14
	.word 0xfef38e60  ! 451: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf0a50020  ! 452: STWA_R	stwa	%r24, [%r20 + %r0] 0x01
cpu_intr_3_36:
	setx	0x1d0131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0742130  ! 454: STX_I	stx	%r24, [%r16 + 0x0130]
T3_asi_reg_wr_22:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 455: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb48ce150  ! 457: ANDcc_I	andcc 	%r19, 0x0150, %r26
	.word 0xb7518000  ! 458: RDPR_PSTATE	rdpr	%pstate, %r27
cpu_intr_3_37:
	setx	0x1d0015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6740000  ! 461: STX_R	stx	%r27, [%r16 + %r0]
cpu_intr_3_38:
	setx	0x20010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_17:
	mov	0x2d, %r14
	.word 0xf6db8400  ! 464: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xfa2d0000  ! 466: STB_R	stb	%r29, [%r20 + %r0]
	.word 0xbeb48000  ! 469: ORNcc_R	orncc 	%r18, %r0, %r31
	.word 0xfca421a2  ! 470: STWA_I	stwa	%r30, [%r16 + 0x01a2] %asi
	.word 0xbd540000  ! 471: RDPR_GL	<illegal instruction>
cpu_intr_3_39:
	setx	0x220127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4f4a0bc  ! 475: STXA_I	stxa	%r26, [%r18 + 0x00bc] %asi
	.word 0xfeac4020  ! 476: STBA_R	stba	%r31, [%r17 + %r0] 0x01
	.word 0xf42c4000  ! 477: STB_R	stb	%r26, [%r17 + %r0]
	.word 0xf834c000  ! 479: STH_R	sth	%r28, [%r19 + %r0]
	ta	T_CHANGE_TO_TL0
	.word 0xf0a5c020  ! 483: STWA_R	stwa	%r24, [%r23 + %r0] 0x01
	.word 0xf674c000  ! 484: STX_R	stx	%r27, [%r19 + %r0]
	.word 0xb2b40000  ! 485: ORNcc_R	orncc 	%r16, %r0, %r25
T3_asi_reg_wr_23:
	mov	0x36, %r14
	.word 0xf0f38e80  ! 486: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_3_40:
	setx	0x22021c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_42), 16, 16)) -> intp(3, 0, 36)
	.word 0xfca4c020  ! 492: STWA_R	stwa	%r30, [%r19 + %r0] 0x01
T3_asi_reg_rd_18:
	mov	0x10, %r14
	.word 0xfadb8e60  ! 493: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_3_41:
	setx	0x20030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982d5a  ! 497: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5a, %hpstate
cpu_intr_3_42:
	setx	0x20031f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_43:
	setx	0x200128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb03460bd  ! 503: SUBC_I	orn 	%r17, 0x00bd, %r24
T3_asi_reg_rd_19:
	mov	0x3c7, %r14
	.word 0xf6db8400  ! 504: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	ta	T_CHANGE_HPRIV
	.word 0xfa358000  ! 512: STH_R	sth	%r29, [%r22 + %r0]
	.word 0xf6a5a169  ! 514: STWA_I	stwa	%r27, [%r22 + 0x0169] %asi
	.word 0xfcad0020  ! 516: STBA_R	stba	%r30, [%r20 + %r0] 0x01
	.word 0xf275e100  ! 518: STX_I	stx	%r25, [%r23 + 0x0100]
	.word 0xf02de054  ! 519: STB_I	stb	%r24, [%r23 + 0x0054]
	.word 0xb045611f  ! 521: ADDC_I	addc 	%r21, 0x011f, %r24
	.word 0xf6748000  ! 522: STX_R	stx	%r27, [%r18 + %r0]
iob_intr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_43), 16, 16)) -> intp(3, 0, 9)
T3_asi_reg_rd_20:
	mov	0x22, %r14
	.word 0xfcdb8e40  ! 524: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_rd_21:
	mov	0x2f, %r14
	.word 0xfedb84a0  ! 527: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb8ac607c  ! 530: ANDNcc_I	andncc 	%r17, 0x007c, %r28
	setx	data_start_1, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983ed0  ! 538: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ed0, %hpstate
	.word 0xfc3461d8  ! 541: STH_I	sth	%r30, [%r17 + 0x01d8]
	.word 0xfc758000  ! 542: STX_R	stx	%r30, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbc940000  ! 550: ORcc_R	orcc 	%r16, %r0, %r30
	ta	T_CHANGE_HPRIV
	.word 0xb5643801  ! 554: MOVcc_I	<illegal instruction>
	.word 0xfca56030  ! 557: STWA_I	stwa	%r30, [%r21 + 0x0030] %asi
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983d90  ! 561: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d90, %hpstate
	.word 0xf225c000  ! 562: STW_R	stw	%r25, [%r23 + %r0]
	.word 0xfaf4e0d3  ! 563: STXA_I	stxa	%r29, [%r19 + 0x00d3] %asi
iob_intr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_44), 16, 16)) -> intp(3, 0, 6)
	.word 0xfab4c020  ! 569: STHA_R	stha	%r29, [%r19 + %r0] 0x01
T3_asi_reg_wr_24:
	mov	0x24, %r14
	.word 0xf6f38e40  ! 570: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982858  ! 571: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0858, %hpstate
	ta	T_CHANGE_TO_TL1
	.word 0xf0f46075  ! 573: STXA_I	stxa	%r24, [%r17 + 0x0075] %asi
	.word 0xb93d2001  ! 574: SRA_I	sra 	%r20, 0x0001, %r28
	ta	T_CHANGE_TO_TL0
	.word 0xf8f4610a  ! 578: STXA_I	stxa	%r28, [%r17 + 0x010a] %asi
iob_intr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_45), 16, 16)) -> intp(3, 0, 2c)
	.word 0xfe34a014  ! 583: STH_I	sth	%r31, [%r18 + 0x0014]
T3_asi_reg_rd_22:
	mov	0x26, %r14
	.word 0xfadb84a0  ! 586: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_46), 16, 16)) -> intp(3, 0, 1)
T3_asi_reg_rd_23:
	mov	0x0, %r14
	.word 0xfedb84a0  ! 588: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_3_44:
	setx	0x200323, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_25:
	mov	0x3, %r14
	.word 0xf4f384a0  ! 591: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_47), 16, 16)) -> intp(3, 0, 2e)
	.word 0xb4846103  ! 596: ADDcc_I	addcc 	%r17, 0x0103, %r26
T3_asi_reg_rd_24:
	mov	0x3c2, %r14
	.word 0xf8db8e60  ! 597: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf8358000  ! 598: STH_R	sth	%r28, [%r22 + %r0]
T3_asi_reg_rd_25:
	mov	0x3c5, %r14
	.word 0xf8db89e0  ! 604: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf8756005  ! 606: STX_I	stx	%r28, [%r21 + 0x0005]
T3_asi_reg_rd_26:
	mov	0x31, %r14
	.word 0xfcdb8e40  ! 608: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf4f561e0  ! 611: STXA_I	stxa	%r26, [%r21 + 0x01e0] %asi
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_45:
	setx	0x200234, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_46:
	setx	0x23001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb424e1cb  ! 619: SUB_I	sub 	%r19, 0x01cb, %r26
cpu_intr_3_47:
	setx	0x230318, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_48:
	setx	0x200100, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_49:
	setx	0x22021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcade1b3  ! 632: STBA_I	stba	%r30, [%r23 + 0x01b3] %asi
	.word 0xf62c0000  ! 636: STB_R	stb	%r27, [%r16 + %r0]
T3_asi_reg_rd_27:
	mov	0x25, %r14
	.word 0xfedb89e0  ! 639: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xfc744000  ! 642: STX_R	stx	%r30, [%r17 + %r0]
cpu_intr_3_50:
	setx	0x23030e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_28:
	mov	0x3c1, %r14
	.word 0xf8db84a0  ! 646: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	ta	T_CHANGE_HPRIV
	.word 0xb60d8000  ! 648: AND_R	and 	%r22, %r0, %r27
iob_intr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_48), 16, 16)) -> intp(3, 0, 3)
T3_asi_reg_rd_29:
	mov	0xb, %r14
	.word 0xfcdb8e40  ! 653: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfea4211d  ! 655: STWA_I	stwa	%r31, [%r16 + 0x011d] %asi
cpu_intr_3_51:
	setx	0x22020a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_52:
	setx	0x200202, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_53:
	setx	0x200303, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_30:
	mov	0x2c, %r14
	.word 0xf4db84a0  ! 659: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_3_54:
	setx	0x210037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe9d0000  ! 661: XORcc_R	xorcc 	%r20, %r0, %r31
T3_asi_reg_wr_26:
	mov	0x9, %r14
	.word 0xf8f389e0  ! 662: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xfea5c020  ! 663: STWA_R	stwa	%r31, [%r23 + %r0] 0x01
	.word 0xfc3561f1  ! 664: STH_I	sth	%r30, [%r21 + 0x01f1]
T3_asi_reg_wr_27:
	mov	0xa, %r14
	.word 0xfcf38e40  ! 666: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T3_asi_reg_rd_31:
	mov	0x14, %r14
	.word 0xfcdb8e40  ! 667: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_32:
	mov	0x20, %r14
	.word 0xf8db8e40  ! 670: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_55:
	setx	0x210109, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf0742007  ! 674: STX_I	stx	%r24, [%r16 + 0x0007]
	.word 0xfeb48020  ! 675: STHA_R	stha	%r31, [%r18 + %r0] 0x01
iob_intr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_49), 16, 16)) -> intp(3, 0, f)
	.word 0xfe740000  ! 680: STX_R	stx	%r31, [%r16 + %r0]
cpu_intr_3_56:
	setx	0x210135, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_50), 16, 16)) -> intp(3, 0, 21)
	.word 0xf835e09b  ! 685: STH_I	sth	%r28, [%r23 + 0x009b]
cpu_intr_3_57:
	setx	0x20010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b461dd  ! 688: STHA_I	stha	%r27, [%r17 + 0x01dd] %asi
cpu_intr_3_58:
	setx	0x22012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2d6162  ! 691: STB_I	stb	%r29, [%r21 + 0x0162]
iob_intr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_51), 16, 16)) -> intp(3, 0, 2f)
T3_asi_reg_wr_28:
	mov	0x4, %r14
	.word 0xf6f384a0  ! 693: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983f5a  ! 694: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f5a, %hpstate
	.word 0xf2258000  ! 698: STW_R	stw	%r25, [%r22 + %r0]
	.word 0xfc34a0c9  ! 701: STH_I	sth	%r30, [%r18 + 0x00c9]
iob_intr_3_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_52), 16, 16)) -> intp(3, 0, 3)
	.word 0xbe1dc000  ! 706: XOR_R	xor 	%r23, %r0, %r31
	.word 0xfa74c000  ! 707: STX_R	stx	%r29, [%r19 + %r0]
cpu_intr_3_59:
	setx	0x23031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca5c020  ! 709: STWA_R	stwa	%r30, [%r23 + %r0] 0x01
	.word 0xb034213b  ! 711: SUBC_I	orn 	%r16, 0x013b, %r24
iob_intr_3_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_53), 16, 16)) -> intp(3, 0, 26)
cpu_intr_3_60:
	setx	0x20031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaacc020  ! 722: STBA_R	stba	%r29, [%r19 + %r0] 0x01
cpu_intr_3_61:
	setx	0x200234, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_54), 16, 16)) -> intp(3, 0, 12)
iob_intr_3_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_55), 16, 16)) -> intp(3, 0, 3f)
	.word 0xfa2ce05a  ! 738: STB_I	stb	%r29, [%r19 + 0x005a]
iob_intr_3_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_56), 16, 16)) -> intp(3, 0, 1a)
T3_asi_reg_wr_29:
	mov	0x8, %r14
	.word 0xf2f38e80  ! 741: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xfc34a1d6  ! 742: STH_I	sth	%r30, [%r18 + 0x01d6]
iob_intr_3_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_57), 16, 16)) -> intp(3, 0, 1b)
	.word 0xb2256007  ! 748: SUB_I	sub 	%r21, 0x0007, %r25
	.word 0xf22d6160  ! 749: STB_I	stb	%r25, [%r21 + 0x0160]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf0a5e1b9  ! 751: STWA_I	stwa	%r24, [%r23 + 0x01b9] %asi
	ta	T_CHANGE_TO_TL1
cpu_intr_3_62:
	setx	0x210329, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982b08  ! 754: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b08, %hpstate
	.word 0xbcaca15c  ! 755: ANDNcc_I	andncc 	%r18, 0x015c, %r30
cpu_intr_3_63:
	setx	0x220035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb82c0000  ! 757: ANDN_R	andn 	%r16, %r0, %r28
	.word 0xf4ace03e  ! 758: STBA_I	stba	%r26, [%r19 + 0x003e] %asi
	.word 0xfe348000  ! 760: STH_R	sth	%r31, [%r18 + %r0]
	.word 0xfe744000  ! 761: STX_R	stx	%r31, [%r17 + %r0]
iob_intr_3_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_58), 16, 16)) -> intp(3, 0, 3)
	.word 0xfead2054  ! 764: STBA_I	stba	%r31, [%r20 + 0x0054] %asi
	.word 0xfc34a19d  ! 765: STH_I	sth	%r30, [%r18 + 0x019d]
	.word 0xf8b5208b  ! 766: STHA_I	stha	%r28, [%r20 + 0x008b] %asi
	.word 0xfc25e16c  ! 767: STW_I	stw	%r30, [%r23 + 0x016c]
T3_asi_reg_wr_30:
	mov	0x3c5, %r14
	.word 0xf8f38e40  ! 770: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf0a50020  ! 771: STWA_R	stwa	%r24, [%r20 + %r0] 0x01
cpu_intr_3_64:
	setx	0x200106, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_59), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf2756001  ! 776: STX_I	stx	%r25, [%r21 + 0x0001]
	.word 0xf2a5a105  ! 779: STWA_I	stwa	%r25, [%r22 + 0x0105] %asi
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982880  ! 780: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0880, %hpstate
	.word 0xfe748000  ! 782: STX_R	stx	%r31, [%r18 + %r0]
	.word 0xf4b48020  ! 783: STHA_R	stha	%r26, [%r18 + %r0] 0x01
cpu_intr_3_65:
	setx	0x22011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb534c000  ! 791: SRL_R	srl 	%r19, %r0, %r26
	.word 0xf2b50020  ! 792: STHA_R	stha	%r25, [%r20 + %r0] 0x01
iob_intr_3_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_60), 16, 16)) -> intp(3, 0, 3e)
	.word 0xfc748000  ! 795: STX_R	stx	%r30, [%r18 + %r0]
T3_asi_reg_wr_31:
	mov	0x3c8, %r14
	.word 0xf2f384a0  ! 799: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6b40020  ! 810: STHA_R	stha	%r27, [%r16 + %r0] 0x01
	.word 0xb2c5e18d  ! 812: ADDCcc_I	addccc 	%r23, 0x018d, %r25
iob_intr_3_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_61), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_66:
	setx	0x22012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb5a1ef  ! 818: STHA_I	stha	%r30, [%r22 + 0x01ef] %asi
	.word 0xf8f42111  ! 822: STXA_I	stxa	%r28, [%r16 + 0x0111] %asi
	.word 0xf2f5a0f7  ! 824: STXA_I	stxa	%r25, [%r22 + 0x00f7] %asi
	.word 0xbcb4c000  ! 825: ORNcc_R	orncc 	%r19, %r0, %r30
iob_intr_3_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_62), 16, 16)) -> intp(3, 0, 18)
iob_intr_3_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_63), 16, 16)) -> intp(3, 0, 16)
	.word 0xfa750000  ! 835: STX_R	stx	%r29, [%r20 + %r0]
T3_asi_reg_rd_33:
	mov	0x9, %r14
	.word 0xf2db8400  ! 836: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf8a50020  ! 838: STWA_R	stwa	%r28, [%r20 + %r0] 0x01
	.word 0xf0350000  ! 839: STH_R	sth	%r24, [%r20 + %r0]
	.word 0xf02de05b  ! 840: STB_I	stb	%r24, [%r23 + 0x005b]
	.word 0xf075a045  ! 841: STX_I	stx	%r24, [%r22 + 0x0045]
T3_asi_reg_wr_32:
	mov	0x2c, %r14
	.word 0xfaf384a0  ! 843: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_3_67:
	setx	0x22000f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_64), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf02d4000  ! 846: STB_R	stb	%r24, [%r21 + %r0]
T3_asi_reg_rd_34:
	mov	0x3c3, %r14
	.word 0xf2db84a0  ! 849: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T3_asi_reg_wr_33:
	mov	0x1a, %r14
	.word 0xf2f38e60  ! 850: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_3_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_65), 16, 16)) -> intp(3, 0, 6)
	.word 0xf8ac0020  ! 853: STBA_R	stba	%r28, [%r16 + %r0] 0x01
	.word 0xf0ad4020  ! 855: STBA_R	stba	%r24, [%r21 + %r0] 0x01
cpu_intr_3_68:
	setx	0x20001c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_69:
	setx	0x230218, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_34:
	mov	0x3c4, %r14
	.word 0xf8f38400  ! 863: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf0adc020  ! 864: STBA_R	stba	%r24, [%r23 + %r0] 0x01
	.word 0xfc2d0000  ! 866: STB_R	stb	%r30, [%r20 + %r0]
	.word 0xbe8d2008  ! 867: ANDcc_I	andcc 	%r20, 0x0008, %r31
	.word 0xf835a07c  ! 871: STH_I	sth	%r28, [%r22 + 0x007c]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf02cc000  ! 873: STB_R	stb	%r24, [%r19 + %r0]
cpu_intr_3_70:
	setx	0x22013d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_35:
	mov	0x37, %r14
	.word 0xf0f38e40  ! 875: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_71:
	setx	0x230039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a5a161  ! 880: STWA_I	stwa	%r27, [%r22 + 0x0161] %asi
	.word 0xbc8c8000  ! 883: ANDcc_R	andcc 	%r18, %r0, %r30
	.word 0xf0a5a006  ! 884: STWA_I	stwa	%r24, [%r22 + 0x0006] %asi
	.word 0xfa74e052  ! 885: STX_I	stx	%r29, [%r19 + 0x0052]
	.word 0xfc254000  ! 890: STW_R	stw	%r30, [%r21 + %r0]
	ta	T_CHANGE_TO_TL0
	.word 0xb6b5e1a3  ! 892: SUBCcc_I	orncc 	%r23, 0x01a3, %r27
	.word 0xf8ac21ec  ! 893: STBA_I	stba	%r28, [%r16 + 0x01ec] %asi
T3_asi_reg_wr_36:
	mov	0xd, %r14
	.word 0xf2f38e40  ! 896: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfc344000  ! 897: STH_R	sth	%r30, [%r17 + %r0]
iob_intr_3_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_66), 16, 16)) -> intp(3, 0, 20)
	.word 0xbc15614e  ! 900: OR_I	or 	%r21, 0x014e, %r30
T3_asi_reg_wr_37:
	mov	0x3c5, %r14
	.word 0xf2f38e80  ! 901: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xfaac4020  ! 904: STBA_R	stba	%r29, [%r17 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_35:
	mov	0x36, %r14
	.word 0xf0db8e60  ! 906: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb60ce1e2  ! 907: AND_I	and 	%r19, 0x01e2, %r27
	.word 0xfe75a1fc  ! 908: STX_I	stx	%r31, [%r22 + 0x01fc]
T3_asi_reg_rd_36:
	mov	0x24, %r14
	.word 0xf0db84a0  ! 909: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_3_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_67), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_72:
	setx	0x26002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_3_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_68), 16, 16)) -> intp(3, 0, 25)
cpu_intr_3_73:
	setx	0x270111, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982dc2  ! 923: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc2, %hpstate
cpu_intr_3_74:
	setx	0x250115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc254000  ! 925: STW_R	stw	%r30, [%r21 + %r0]
	.word 0xf025c000  ! 927: STW_R	stw	%r24, [%r23 + %r0]
	.word 0xfeb46039  ! 928: STHA_I	stha	%r31, [%r17 + 0x0039] %asi
cpu_intr_3_75:
	setx	0x26013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc242130  ! 931: STW_I	stw	%r30, [%r16 + 0x0130]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf0b48020  ! 942: STHA_R	stha	%r24, [%r18 + %r0] 0x01
	.word 0xf8ade14c  ! 944: STBA_I	stba	%r28, [%r23 + 0x014c] %asi
	.word 0xf42ca08b  ! 946: STB_I	stb	%r26, [%r18 + 0x008b]
	.word 0xfc748000  ! 950: STX_R	stx	%r30, [%r18 + %r0]
T3_asi_reg_wr_38:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 953: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
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
T3_asi_reg_rd_37:
	mov	0x1c, %r14
	.word 0xfcdb8e60  ! 957: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T3_asi_reg_rd_38:
	mov	0x4, %r14
	.word 0xfadb84a0  ! 958: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_3_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_69), 16, 16)) -> intp(3, 0, 8)
	.word 0xfc75a174  ! 962: STX_I	stx	%r30, [%r22 + 0x0174]
	.word 0xfc342090  ! 963: STH_I	sth	%r30, [%r16 + 0x0090]
	.word 0xfeb50020  ! 964: STHA_R	stha	%r31, [%r20 + %r0] 0x01
T3_asi_reg_wr_39:
	mov	0x20, %r14
	.word 0xf2f38e40  ! 965: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_wr_40:
	mov	0x3c3, %r14
	.word 0xf2f389e0  ! 966: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T3_asi_reg_wr_41:
	mov	0x2a, %r14
	.word 0xf2f38e40  ! 969: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_70), 16, 16)) -> intp(3, 0, 3a)
	.word 0xb4856170  ! 972: ADDcc_I	addcc 	%r21, 0x0170, %r26
	.word 0xfaace177  ! 973: STBA_I	stba	%r29, [%r19 + 0x0177] %asi
T3_asi_reg_rd_39:
	mov	0x1d, %r14
	.word 0xf4db8e40  ! 975: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb6a4c000  ! 977: SUBcc_R	subcc 	%r19, %r0, %r27
cpu_intr_3_76:
	setx	0x250315, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_71), 16, 16)) -> intp(3, 0, c)
cpu_intr_3_77:
	setx	0x25022a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_78:
	setx	0x260225, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_72), 16, 16)) -> intp(3, 0, a)
	.word 0xb21d60b5  ! 985: XOR_I	xor 	%r21, 0x00b5, %r25
T3_asi_reg_rd_40:
	mov	0x18, %r14
	.word 0xf4db8e40  ! 986: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_79:
	setx	0x240303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42c8000  ! 988: STB_R	stb	%r26, [%r18 + %r0]
	.word 0xba2c21d9  ! 989: ANDN_I	andn 	%r16, 0x01d9, %r29
T3_asi_reg_wr_42:
	mov	0x26, %r14
	.word 0xf8f384a0  ! 990: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf22ce070  ! 991: STB_I	stb	%r25, [%r19 + 0x0070]
iob_intr_3_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_73), 16, 16)) -> intp(3, 0, 1f)
	.word 0xbf358000  ! 995: SRL_R	srl 	%r22, %r0, %r31
T3_asi_reg_wr_43:
	mov	0x16, %r14
	.word 0xf4f38400  ! 997: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xfcb5e197  ! 999: STHA_I	stha	%r30, [%r23 + 0x0197] %asi
	.word 0xfa2d0000  ! 1000: STB_R	stb	%r29, [%r20 + %r0]
T3_asi_reg_rd_41:
	mov	0x32, %r14
	.word 0xfedb8e60  ! 1001: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_3_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_74), 16, 16)) -> intp(3, 0, 13)
	.word 0xf62c2041  ! 1005: STB_I	stb	%r27, [%r16 + 0x0041]
	.word 0xfea421a9  ! 1006: STWA_I	stwa	%r31, [%r16 + 0x01a9] %asi
T3_asi_reg_wr_44:
	mov	0x21, %r14
	.word 0xf0f38e60  ! 1007: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_3_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_75), 16, 16)) -> intp(3, 0, 18)
T3_asi_reg_rd_42:
	mov	0x3c5, %r14
	.word 0xf4db8400  ! 1016: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T3_asi_reg_wr_45:
	mov	0x1e, %r14
	.word 0xfaf38e60  ! 1017: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_3_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_76), 16, 16)) -> intp(3, 0, 3b)
	.word 0xb8242034  ! 1021: SUB_I	sub 	%r16, 0x0034, %r28
T3_asi_reg_wr_46:
	mov	0x28, %r14
	.word 0xfaf38e80  ! 1022: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbe3d6069  ! 1023: XNOR_I	xnor 	%r21, 0x0069, %r31
iob_intr_3_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_77), 16, 16)) -> intp(3, 0, 31)
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_43:
	mov	0x3c5, %r14
	.word 0xf8db8e60  ! 1027: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	ta	T_CHANGE_NONHPRIV
	.word 0xf82da171  ! 1034: STB_I	stb	%r28, [%r22 + 0x0171]
cpu_intr_3_80:
	setx	0x25012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4f56104  ! 1041: STXA_I	stxa	%r26, [%r21 + 0x0104] %asi
	.word 0xfa254000  ! 1042: STW_R	stw	%r29, [%r21 + %r0]
	.word 0xfa2c2185  ! 1043: STB_I	stb	%r29, [%r16 + 0x0185]
T3_asi_reg_wr_47:
	mov	0x1a, %r14
	.word 0xf4f384a0  ! 1045: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T3_asi_reg_wr_48:
	mov	0x0, %r14
	.word 0xfaf38e40  ! 1047: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_3_81:
	setx	0x250029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb834c000  ! 1050: SUBC_R	orn 	%r19, %r0, %r28
iob_intr_3_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_78), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_82:
	setx	0x240307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_83:
	setx	0x270007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b54020  ! 1060: STHA_R	stha	%r28, [%r21 + %r0] 0x01
iob_intr_3_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_79), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf0a4c020  ! 1070: STWA_R	stwa	%r24, [%r19 + %r0] 0x01
iob_intr_3_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_80), 16, 16)) -> intp(3, 0, 25)
	.word 0xf2744000  ! 1076: STX_R	stx	%r25, [%r17 + %r0]
	.word 0xbf641800  ! 1078: MOVcc_R	<illegal instruction>
iob_intr_3_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_81), 16, 16)) -> intp(3, 0, 1d)
iob_intr_3_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_82), 16, 16)) -> intp(3, 0, d)
cpu_intr_3_84:
	setx	0x260317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf275c000  ! 1085: STX_R	stx	%r25, [%r23 + %r0]
cpu_intr_3_85:
	setx	0x26013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa750000  ! 1090: STX_R	stx	%r29, [%r20 + %r0]
cpu_intr_3_86:
	setx	0x240313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf235e027  ! 1094: STH_I	sth	%r25, [%r23 + 0x0027]
cpu_intr_3_87:
	setx	0x270110, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_44:
	mov	0x21, %r14
	.word 0xfedb89e0  ! 1097: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_3_88:
	setx	0x250020, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_89:
	setx	0x27003b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_49:
	mov	0x3c7, %r14
	.word 0xf4f38e80  ! 1103: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xfc356144  ! 1105: STH_I	sth	%r30, [%r21 + 0x0144]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf62ca115  ! 1107: STB_I	stb	%r27, [%r18 + 0x0115]
	.word 0xb80ce1c4  ! 1108: AND_I	and 	%r19, 0x01c4, %r28
cpu_intr_3_90:
	setx	0x260327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a58020  ! 1110: STWA_R	stwa	%r28, [%r22 + %r0] 0x01
	.word 0xf6b50020  ! 1111: STHA_R	stha	%r27, [%r20 + %r0] 0x01
	.word 0xf2b5616c  ! 1113: STHA_I	stha	%r25, [%r21 + 0x016c] %asi
	.word 0xfc34202b  ! 1114: STH_I	sth	%r30, [%r16 + 0x002b]
iob_intr_3_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_83), 16, 16)) -> intp(3, 0, 3b)
	.word 0xfe242053  ! 1119: STW_I	stw	%r31, [%r16 + 0x0053]
cpu_intr_3_91:
	setx	0x260115, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_92:
	setx	0x27012b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_50:
	mov	0x13, %r14
	.word 0xfef38e80  ! 1126: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb4a56056  ! 1127: SUBcc_I	subcc 	%r21, 0x0056, %r26
	.word 0xf435a0f6  ! 1130: STH_I	sth	%r26, [%r22 + 0x00f6]
cpu_intr_3_93:
	setx	0x260035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b52041  ! 1132: STHA_I	stha	%r27, [%r20 + 0x0041] %asi
T3_asi_reg_wr_51:
	mov	0x3c2, %r14
	.word 0xf4f38400  ! 1136: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_3_94:
	setx	0x240232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcada174  ! 1138: STBA_I	stba	%r30, [%r22 + 0x0174] %asi
	.word 0xb235a18c  ! 1140: SUBC_I	orn 	%r22, 0x018c, %r25
T3_asi_reg_rd_45:
	mov	0x2b, %r14
	.word 0xfadb89e0  ! 1143: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_3_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_84), 16, 16)) -> intp(3, 0, 14)
	.word 0xbd3cf001  ! 1149: SRAX_I	srax	%r19, 0x0001, %r30
cpu_intr_3_95:
	setx	0x240016, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_46:
	mov	0x0, %r14
	.word 0xfadb89e0  ! 1153: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_3_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_85), 16, 16)) -> intp(3, 0, 20)
	.word 0xf674200c  ! 1160: STX_I	stx	%r27, [%r16 + 0x000c]
	.word 0xfcb54020  ! 1161: STHA_R	stha	%r30, [%r21 + %r0] 0x01
	.word 0xf025a02e  ! 1162: STW_I	stw	%r24, [%r22 + 0x002e]
T3_asi_reg_rd_47:
	mov	0x9, %r14
	.word 0xf2db8400  ! 1165: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T3_asi_reg_wr_52:
	mov	0x3c0, %r14
	.word 0xfef38e60  ! 1168: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfc75e0ad  ! 1170: STX_I	stx	%r30, [%r23 + 0x00ad]
	.word 0xfca44020  ! 1172: STWA_R	stwa	%r30, [%r17 + %r0] 0x01
iob_intr_3_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_86), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_96:
	setx	0x270120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf834c000  ! 1177: STH_R	sth	%r28, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbc25e1f8  ! 1179: SUB_I	sub 	%r23, 0x01f8, %r30
iob_intr_3_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_87), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_88), 16, 16)) -> intp(3, 0, 31)
iob_intr_3_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_89), 16, 16)) -> intp(3, 0, 29)
iob_intr_3_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_90), 16, 16)) -> intp(3, 0, 29)
cpu_intr_3_97:
	setx	0x25032f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_53:
	mov	0x20, %r14
	.word 0xf6f38e60  ! 1188: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
iob_intr_3_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_91), 16, 16)) -> intp(3, 0, 3c)
	ta	T_CHANGE_TO_TL1
iob_intr_3_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_92), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_rd_48:
	mov	0x3c0, %r14
	.word 0xfedb8e40  ! 1199: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	ta	T_CHANGE_HPRIV
	.word 0xf02d4000  ! 1201: STB_R	stb	%r24, [%r21 + %r0]
T3_asi_reg_rd_49:
	mov	0x3c3, %r14
	.word 0xf4db8e60  ! 1202: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T3_asi_reg_rd_50:
	mov	0x28, %r14
	.word 0xfadb8e80  ! 1204: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T3_asi_reg_rd_51:
	mov	0x22, %r14
	.word 0xf2db8e40  ! 1205: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf6240000  ! 1210: STW_R	stw	%r27, [%r16 + %r0]
	.word 0xfab56167  ! 1212: STHA_I	stha	%r29, [%r21 + 0x0167] %asi
T3_asi_reg_wr_54:
	mov	0x1, %r14
	.word 0xfaf384a0  ! 1214: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T3_asi_reg_rd_52:
	mov	0x8, %r14
	.word 0xf2db8e60  ! 1215: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T3_asi_reg_rd_53:
	mov	0x7, %r14
	.word 0xfedb8e60  ! 1222: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf0f461d4  ! 1223: STXA_I	stxa	%r24, [%r17 + 0x01d4] %asi
iob_intr_3_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_93), 16, 16)) -> intp(3, 0, 10)
	.word 0xf6acc020  ! 1226: STBA_R	stba	%r27, [%r19 + %r0] 0x01
	.word 0xbc240000  ! 1229: SUB_R	sub 	%r16, %r0, %r30
iob_intr_3_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_94), 16, 16)) -> intp(3, 0, 11)
iob_intr_3_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_95), 16, 16)) -> intp(3, 0, 1e)
	.word 0xb224214f  ! 1234: SUB_I	sub 	%r16, 0x014f, %r25
iob_intr_3_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_96), 16, 16)) -> intp(3, 0, e)
	.word 0xb53ce001  ! 1237: SRA_I	sra 	%r19, 0x0001, %r26
iob_intr_3_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_97), 16, 16)) -> intp(3, 0, 18)
T3_asi_reg_wr_55:
	mov	0x16, %r14
	.word 0xf8f38e40  ! 1239: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T3_asi_reg_wr_56:
	mov	0x3c2, %r14
	.word 0xf0f384a0  ! 1244: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xfab4a085  ! 1245: STHA_I	stha	%r29, [%r18 + 0x0085] %asi
T3_asi_reg_wr_57:
	mov	0x23, %r14
	.word 0xfaf38e80  ! 1248: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T3_asi_reg_wr_58:
	mov	0x11, %r14
	.word 0xf2f38400  ! 1250: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_3_98:
	setx	0x260337, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_98), 16, 16)) -> intp(3, 0, b)
cpu_intr_3_99:
	setx	0x26002c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_59:
	mov	0x2e, %r14
	.word 0xf4f389e0  ! 1254: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T3_asi_reg_wr_60:
	mov	0x1e, %r14
	.word 0xf6f38e40  ! 1255: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_wr_61:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 1256: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_100:
	setx	0x26022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcac60c5  ! 1259: STBA_I	stba	%r30, [%r17 + 0x00c5] %asi
T3_asi_reg_rd_54:
	mov	0xd, %r14
	.word 0xf4db89e0  ! 1260: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb350c000  ! 1261: RDPR_TT	rdpr	%tt, %r25
iob_intr_3_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_99), 16, 16)) -> intp(3, 0, 19)
iob_intr_3_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_100), 16, 16)) -> intp(3, 0, 16)
iob_intr_3_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_101), 16, 16)) -> intp(3, 0, 33)
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983c1a  ! 1274: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c1a, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x8f902001  ! 1277: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xa1902000  ! 1278: WRPR_GL_I	wrpr	%r0, 0x0000, %-
iob_intr_3_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_102), 16, 16)) -> intp(3, 0, 2d)
cpu_intr_3_101:
	setx	0x260121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb48020  ! 1285: STHA_R	stha	%r31, [%r18 + %r0] 0x01
cpu_intr_3_102:
	setx	0x24013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6950000  ! 1287: ORcc_R	orcc 	%r20, %r0, %r27
cpu_intr_3_103:
	setx	0x240217, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_103), 16, 16)) -> intp(3, 0, 3d)
	.word 0xfab4a076  ! 1292: STHA_I	stha	%r29, [%r18 + 0x0076] %asi
T3_asi_reg_rd_55:
	mov	0x2d, %r14
	.word 0xf4db8e60  ! 1293: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_3_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_104), 16, 16)) -> intp(3, 0, 3b)
	ta	T_CHANGE_TO_TL0
iob_intr_3_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_105), 16, 16)) -> intp(3, 0, 4)
iob_intr_3_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_106), 16, 16)) -> intp(3, 0, 16)
	.word 0xbac5a11b  ! 1304: ADDCcc_I	addccc 	%r22, 0x011b, %r29
	ta	T_CHANGE_TO_TL0
	.word 0xfa74e182  ! 1306: STX_I	stx	%r29, [%r19 + 0x0182]
iob_intr_3_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_107), 16, 16)) -> intp(3, 0, 5)
	.word 0xf62ce0ca  ! 1310: STB_I	stb	%r27, [%r19 + 0x00ca]
iob_intr_3_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_108), 16, 16)) -> intp(3, 0, 35)
	.word 0xf42ce070  ! 1313: STB_I	stb	%r26, [%r19 + 0x0070]
iob_intr_3_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_109), 16, 16)) -> intp(3, 0, 25)
	.word 0xb72d8000  ! 1317: SLL_R	sll 	%r22, %r0, %r27
	.word 0xfe754000  ! 1318: STX_R	stx	%r31, [%r21 + %r0]
iob_intr_3_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_110), 16, 16)) -> intp(3, 0, 10)
T3_asi_reg_rd_56:
	mov	0x8, %r14
	.word 0xfedb8e40  ! 1321: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbe35c000  ! 1324: ORN_R	orn 	%r23, %r0, %r31
iob_intr_3_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_111), 16, 16)) -> intp(3, 0, 1e)
	ta	T_CHANGE_HPRIV
iob_intr_3_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_112), 16, 16)) -> intp(3, 0, c)
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983fda  ! 1336: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fda, %hpstate
T3_asi_reg_wr_62:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 1337: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_3_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_113), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_rd_57:
	mov	0x1, %r14
	.word 0xf2db8e40  ! 1347: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_3_104:
	setx	0x24023e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_114), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf63420c0  ! 1357: STH_I	sth	%r27, [%r16 + 0x00c0]
iob_intr_3_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_115), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_wr_63:
	mov	0xd, %r14
	.word 0xf4f384a0  ! 1361: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T3_asi_reg_wr_64:
	mov	0xf, %r14
	.word 0xfaf38e80  ! 1362: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_3_105:
	setx	0x250033, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_116), 16, 16)) -> intp(3, 0, d)
	ta	T_CHANGE_NONHPRIV
	.word 0xb81c8000  ! 1368: XOR_R	xor 	%r18, %r0, %r28
	.word 0xf8b4e14f  ! 1371: STHA_I	stha	%r28, [%r19 + 0x014f] %asi
T3_asi_reg_wr_65:
	mov	0x29, %r14
	.word 0xf6f389e0  ! 1372: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T3_asi_reg_rd_58:
	mov	0x3c2, %r14
	.word 0xf8db8e40  ! 1373: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_106:
	setx	0x2b0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ac4020  ! 1380: STBA_R	stba	%r24, [%r17 + %r0] 0x01
cpu_intr_3_107:
	setx	0x2b002f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_59:
	mov	0x31, %r14
	.word 0xf6db89e0  ! 1383: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_3_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_117), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf0f561c3  ! 1386: STXA_I	stxa	%r24, [%r21 + 0x01c3] %asi
cpu_intr_3_108:
	setx	0x2a0222, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_66:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 1391: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfcad2046  ! 1393: STBA_I	stba	%r30, [%r20 + 0x0046] %asi
cpu_intr_3_109:
	setx	0x280021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b44020  ! 1399: STHA_R	stha	%r28, [%r17 + %r0] 0x01
	.word 0xfc75e113  ! 1402: STX_I	stx	%r30, [%r23 + 0x0113]
	.word 0xb77ce401  ! 1403: MOVR_I	movre	%r19, 0x1, %r27
T3_asi_reg_wr_67:
	mov	0x3c8, %r14
	.word 0xf0f389e0  ! 1405: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_68:
	mov	0x11, %r14
	.word 0xfaf38e40  ! 1408: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf6ade1a4  ! 1409: STBA_I	stba	%r27, [%r23 + 0x01a4] %asi
T3_asi_reg_wr_69:
	mov	0x3c2, %r14
	.word 0xf2f38e40  ! 1411: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf2258000  ! 1412: STW_R	stw	%r25, [%r22 + %r0]
	.word 0x8d942004  ! 1413: WRPR_PSTATE_I	wrpr	%r16, 0x0004, %pstate
	.word 0xb97de401  ! 1415: MOVR_I	movre	%r23, 0x1, %r28
iob_intr_3_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_118), 16, 16)) -> intp(3, 0, 5)
iob_intr_3_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_119), 16, 16)) -> intp(3, 0, 1e)
	ta	T_CHANGE_TO_TL1
iob_intr_3_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_120), 16, 16)) -> intp(3, 0, 1)
	.word 0xb414a042  ! 1428: OR_I	or 	%r18, 0x0042, %r26
T3_asi_reg_rd_60:
	mov	0x3c4, %r14
	.word 0xfedb8e60  ! 1432: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_3_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_121), 16, 16)) -> intp(3, 0, 22)
	.word 0xb93c6001  ! 1442: SRA_I	sra 	%r17, 0x0001, %r28
	.word 0xf22d4000  ! 1445: STB_R	stb	%r25, [%r21 + %r0]
cpu_intr_3_110:
	setx	0x2a0018, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfaad4020  ! 1450: STBA_R	stba	%r29, [%r21 + %r0] 0x01
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_70:
	mov	0x3c1, %r14
	.word 0xfcf38400  ! 1454: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_3_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_122), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf035e182  ! 1457: STH_I	sth	%r24, [%r23 + 0x0182]
cpu_intr_3_111:
	setx	0x280317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_112:
	setx	0x28002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf2340000  ! 1465: STH_R	sth	%r25, [%r16 + %r0]
	.word 0xf82520c0  ! 1466: STW_I	stw	%r28, [%r20 + 0x00c0]
	.word 0xfaa4c020  ! 1468: STWA_R	stwa	%r29, [%r19 + %r0] 0x01
	.word 0xf8a521ac  ! 1469: STWA_I	stwa	%r28, [%r20 + 0x01ac] %asi
T3_asi_reg_rd_61:
	mov	0x1f, %r14
	.word 0xfedb8e40  ! 1470: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_wr_71:
	mov	0x3c7, %r14
	.word 0xf8f38e60  ! 1474: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_3_113:
	setx	0x2a0025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4248000  ! 1479: STW_R	stw	%r26, [%r18 + %r0]
	.word 0xb32cb001  ! 1481: SLLX_I	sllx	%r18, 0x0001, %r25
	.word 0xf0ade00b  ! 1490: STBA_I	stba	%r24, [%r23 + 0x000b] %asi
T3_asi_reg_wr_72:
	mov	0x3c2, %r14
	.word 0xf4f389e0  ! 1491: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb32d4000  ! 1497: SLL_R	sll 	%r21, %r0, %r25
	.word 0xbf641800  ! 1499: MOVcc_R	<illegal instruction>
iob_intr_3_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_123), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_124), 16, 16)) -> intp(3, 0, 4)
	.word 0xf22d0000  ! 1502: STB_R	stb	%r25, [%r20 + %r0]
	.word 0xfe34c000  ! 1504: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xf024c000  ! 1506: STW_R	stw	%r24, [%r19 + %r0]
T3_asi_reg_rd_62:
	mov	0x3c1, %r14
	.word 0xf0db84a0  ! 1507: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T3_asi_reg_wr_73:
	mov	0x30, %r14
	.word 0xf0f38e80  ! 1511: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_3_114:
	setx	0x290307, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf024c000  ! 1517: STW_R	stw	%r24, [%r19 + %r0]
T3_asi_reg_wr_74:
	mov	0x38, %r14
	.word 0xf4f38e40  ! 1519: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_3_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_125), 16, 16)) -> intp(3, 0, 1d)
iob_intr_3_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_126), 16, 16)) -> intp(3, 0, f)
	.word 0xfa75c000  ! 1524: STX_R	stx	%r29, [%r23 + %r0]
	.word 0xbea46126  ! 1525: SUBcc_I	subcc 	%r17, 0x0126, %r31
cpu_intr_3_115:
	setx	0x280328, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_127), 16, 16)) -> intp(3, 0, 39)
	.word 0xbab58000  ! 1531: SUBCcc_R	orncc 	%r22, %r0, %r29
	.word 0xfca4e1d6  ! 1537: STWA_I	stwa	%r30, [%r19 + 0x01d6] %asi
iob_intr_3_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_128), 16, 16)) -> intp(3, 0, 38)
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983dd8  ! 1540: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dd8, %hpstate
iob_intr_3_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_129), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf62d21a8  ! 1544: STB_I	stb	%r27, [%r20 + 0x01a8]
	.word 0xfcac4020  ! 1545: STBA_R	stba	%r30, [%r17 + %r0] 0x01
	.word 0xfcb4c020  ! 1548: STHA_R	stha	%r30, [%r19 + %r0] 0x01
T3_asi_reg_wr_75:
	mov	0x3c4, %r14
	.word 0xf0f38400  ! 1550: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf825213b  ! 1554: STW_I	stw	%r28, [%r20 + 0x013b]
	.word 0xb8448000  ! 1555: ADDC_R	addc 	%r18, %r0, %r28
	.word 0xfe75c000  ! 1556: STX_R	stx	%r31, [%r23 + %r0]
cpu_intr_3_116:
	setx	0x290100, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_130), 16, 16)) -> intp(3, 0, 35)
T3_asi_reg_rd_63:
	mov	0x33, %r14
	.word 0xf4db8e60  ! 1562: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf2ac8020  ! 1567: STBA_R	stba	%r25, [%r18 + %r0] 0x01
iob_intr_3_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_131), 16, 16)) -> intp(3, 0, 31)
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x8198295a  ! 1570: WRHPR_HPSTATE_I	wrhpr	%r0, 0x095a, %hpstate
iob_intr_3_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_132), 16, 16)) -> intp(3, 0, 7)
iob_intr_3_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_133), 16, 16)) -> intp(3, 0, 30)
	.word 0xfc2560b4  ! 1573: STW_I	stw	%r30, [%r21 + 0x00b4]
	.word 0xf025c000  ! 1574: STW_R	stw	%r24, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_64:
	mov	0xe, %r14
	.word 0xf6db89e0  ! 1578: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T3_asi_reg_rd_65:
	mov	0x37, %r14
	.word 0xfedb84a0  ! 1579: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb3500000  ! 1580: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xa1902000  ! 1581: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xfcac8020  ! 1582: STBA_R	stba	%r30, [%r18 + %r0] 0x01
cpu_intr_3_117:
	setx	0x2a0301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb01d20ed  ! 1585: XOR_I	xor 	%r20, 0x00ed, %r24
	.word 0xf62c2161  ! 1588: STB_I	stb	%r27, [%r16 + 0x0161]
	.word 0xb93c7001  ! 1589: SRAX_I	srax	%r17, 0x0001, %r28
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982ec0  ! 1590: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec0, %hpstate
	.word 0xf2250000  ! 1591: STW_R	stw	%r25, [%r20 + %r0]
	.word 0xf0b560d6  ! 1593: STHA_I	stha	%r24, [%r21 + 0x00d6] %asi
	.word 0xf02cc000  ! 1595: STB_R	stb	%r24, [%r19 + %r0]
cpu_intr_3_118:
	setx	0x2b003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_119:
	setx	0x280101, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_120:
	setx	0x290222, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_121:
	setx	0x290228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb17c0400  ! 1604: MOVR_R	movre	%r16, %r0, %r24
T3_asi_reg_wr_76:
	mov	0xc, %r14
	.word 0xf8f38e40  ! 1611: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf4b4e1df  ! 1612: STHA_I	stha	%r26, [%r19 + 0x01df] %asi
cpu_intr_3_122:
	setx	0x2a0305, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_77:
	mov	0x3c5, %r14
	.word 0xfaf38e40  ! 1615: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb12c3001  ! 1616: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0xfa35a00a  ! 1617: STH_I	sth	%r29, [%r22 + 0x000a]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_78:
	mov	0x3c4, %r14
	.word 0xfef384a0  ! 1622: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_3_123:
	setx	0x280125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab54020  ! 1627: STHA_R	stha	%r29, [%r21 + %r0] 0x01
	.word 0xfaf4a160  ! 1629: STXA_I	stxa	%r29, [%r18 + 0x0160] %asi
	.word 0xf0b521a3  ! 1630: STHA_I	stha	%r24, [%r20 + 0x01a3] %asi
	.word 0xf8ad4020  ! 1633: STBA_R	stba	%r28, [%r21 + %r0] 0x01
cpu_intr_3_124:
	setx	0x2a023e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_125:
	setx	0x2b0212, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_66:
	mov	0x33, %r14
	.word 0xf8db89e0  ! 1643: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf834c000  ! 1645: STH_R	sth	%r28, [%r19 + %r0]
	.word 0xf82c8000  ! 1649: STB_R	stb	%r28, [%r18 + %r0]
iob_intr_3_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_134), 16, 16)) -> intp(3, 0, 19)
iob_intr_3_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_135), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf4aca122  ! 1655: STBA_I	stba	%r26, [%r18 + 0x0122] %asi
T3_asi_reg_wr_79:
	mov	0x25, %r14
	.word 0xf8f38e40  ! 1657: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_3_126:
	setx	0x280112, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_127:
	setx	0x280022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe3461b9  ! 1665: STH_I	sth	%r31, [%r17 + 0x01b9]
	.word 0xbd2ca001  ! 1667: SLL_I	sll 	%r18, 0x0001, %r30
	.word 0xf22ce1dd  ! 1671: STB_I	stb	%r25, [%r19 + 0x01dd]
T3_asi_reg_wr_80:
	mov	0x2d, %r14
	.word 0xf8f38e40  ! 1676: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T3_asi_reg_rd_67:
	mov	0x3, %r14
	.word 0xfedb84a0  ! 1677: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T3_asi_reg_wr_81:
	mov	0x2, %r14
	.word 0xf8f38e60  ! 1678: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_3_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_136), 16, 16)) -> intp(3, 0, 39)
	ta	T_CHANGE_TO_TL0
	.word 0xbab50000  ! 1685: ORNcc_R	orncc 	%r20, %r0, %r29
	.word 0xb8c460ca  ! 1686: ADDCcc_I	addccc 	%r17, 0x00ca, %r28
T3_asi_reg_rd_68:
	mov	0x36, %r14
	.word 0xf6db8e40  ! 1689: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfaa56060  ! 1690: STWA_I	stwa	%r29, [%r21 + 0x0060] %asi
cpu_intr_3_128:
	setx	0x29031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b4600d  ! 1694: STHA_I	stha	%r27, [%r17 + 0x000d] %asi
	.word 0xfcf46194  ! 1705: STXA_I	stxa	%r30, [%r17 + 0x0194] %asi
	.word 0xf42c61ca  ! 1707: STB_I	stb	%r26, [%r17 + 0x01ca]
cpu_intr_3_129:
	setx	0x2a0230, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_137), 16, 16)) -> intp(3, 0, 12)
	.word 0xb48dc000  ! 1713: ANDcc_R	andcc 	%r23, %r0, %r26
iob_intr_3_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_138), 16, 16)) -> intp(3, 0, 3a)
T3_asi_reg_wr_82:
	mov	0x24, %r14
	.word 0xfcf38e80  ! 1719: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_3_130:
	setx	0x280034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe3521c9  ! 1722: STH_I	sth	%r31, [%r20 + 0x01c9]
iob_intr_3_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_139), 16, 16)) -> intp(3, 0, 8)
T3_asi_reg_wr_83:
	mov	0x3c3, %r14
	.word 0xfef38400  ! 1727: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb1358000  ! 1735: SRL_R	srl 	%r22, %r0, %r24
cpu_intr_3_131:
	setx	0x280307, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983a0a  ! 1738: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a0a, %hpstate
	.word 0xf4756152  ! 1739: STX_I	stx	%r26, [%r21 + 0x0152]
T3_asi_reg_rd_69:
	mov	0x1a, %r14
	.word 0xf6db8e40  ! 1740: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983c18  ! 1742: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c18, %hpstate
T3_asi_reg_wr_84:
	mov	0xe, %r14
	.word 0xf6f38e60  ! 1744: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T3_asi_reg_rd_70:
	mov	0x34, %r14
	.word 0xfedb84a0  ! 1747: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf42d0000  ! 1749: STB_R	stb	%r26, [%r20 + %r0]
	.word 0xbd508000  ! 1750: RDPR_TSTATE	rdpr	%tstate, %r30
iob_intr_3_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_140), 16, 16)) -> intp(3, 0, 8)
	.word 0xf42461a5  ! 1754: STW_I	stw	%r26, [%r17 + 0x01a5]
	.word 0xf2ac8020  ! 1756: STBA_R	stba	%r25, [%r18 + %r0] 0x01
iob_intr_3_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_141), 16, 16)) -> intp(3, 0, 2)
	.word 0xfe744000  ! 1759: STX_R	stx	%r31, [%r17 + %r0]
	.word 0xf4a5e123  ! 1760: STWA_I	stwa	%r26, [%r23 + 0x0123] %asi
	.word 0xf274c000  ! 1761: STX_R	stx	%r25, [%r19 + %r0]
iob_intr_3_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_142), 16, 16)) -> intp(3, 0, 6)
	.word 0xf6a58020  ! 1766: STWA_R	stwa	%r27, [%r22 + %r0] 0x01
T3_asi_reg_rd_71:
	mov	0x1a, %r14
	.word 0xfcdb84a0  ! 1767: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_3_132:
	setx	0x2b013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2d8000  ! 1773: STB_R	stb	%r29, [%r22 + %r0]
T3_asi_reg_wr_85:
	mov	0x29, %r14
	.word 0xfaf38400  ! 1775: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf8240000  ! 1776: STW_R	stw	%r28, [%r16 + %r0]
cpu_intr_3_133:
	setx	0x2a011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8240000  ! 1783: STW_R	stw	%r28, [%r16 + %r0]
T3_asi_reg_wr_86:
	mov	0x7, %r14
	.word 0xfcf38e80  ! 1785: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_3_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_143), 16, 16)) -> intp(3, 0, 10)
iob_intr_3_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_144), 16, 16)) -> intp(3, 0, 5)
	.word 0xb6354000  ! 1791: SUBC_R	orn 	%r21, %r0, %r27
cpu_intr_3_134:
	setx	0x290025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8f520a6  ! 1794: STXA_I	stxa	%r28, [%r20 + 0x00a6] %asi
	.word 0xfe744000  ! 1795: STX_R	stx	%r31, [%r17 + %r0]
T3_asi_reg_rd_72:
	mov	0xd, %r14
	.word 0xf0db8e80  ! 1797: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x819839d2  ! 1798: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19d2, %hpstate
	.word 0xfc2dc000  ! 1801: STB_R	stb	%r30, [%r23 + %r0]
	.word 0xfab4e132  ! 1803: STHA_I	stha	%r29, [%r19 + 0x0132] %asi
	.word 0xf0ac4020  ! 1808: STBA_R	stba	%r24, [%r17 + %r0] 0x01
T3_asi_reg_rd_73:
	mov	0x29, %r14
	.word 0xf6db8400  ! 1812: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbd342001  ! 1814: SRL_I	srl 	%r16, 0x0001, %r30
	ta	T_CHANGE_NONHPRIV
	.word 0xf075e015  ! 1818: STX_I	stx	%r24, [%r23 + 0x0015]
	.word 0xbaa44000  ! 1822: SUBcc_R	subcc 	%r17, %r0, %r29
T3_asi_reg_rd_74:
	mov	0x3c3, %r14
	.word 0xf8db89e0  ! 1823: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf8254000  ! 1825: STW_R	stw	%r28, [%r21 + %r0]
	.word 0xfa24a077  ! 1826: STW_I	stw	%r29, [%r18 + 0x0077]
T3_asi_reg_rd_75:
	mov	0xf, %r14
	.word 0xfadb8e40  ! 1830: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb77c2401  ! 1831: MOVR_I	movre	%r16, 0x1, %r27
	.word 0xf8252104  ! 1834: STW_I	stw	%r28, [%r20 + 0x0104]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_wr_87:
	mov	0x1f, %r14
	.word 0xf4f38e40  ! 1836: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T3_asi_reg_rd_76:
	mov	0x3c5, %r14
	.word 0xfadb8400  ! 1837: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb5356001  ! 1838: SRL_I	srl 	%r21, 0x0001, %r26
	.word 0xfa24614d  ! 1840: STW_I	stw	%r29, [%r17 + 0x014d]
T3_asi_reg_rd_77:
	mov	0x3c4, %r14
	.word 0xfedb8e40  ! 1841: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_wr_88:
	mov	0x3c4, %r14
	.word 0xfcf38e40  ! 1842: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf8748000  ! 1845: STX_R	stx	%r28, [%r18 + %r0]
T3_asi_reg_wr_89:
	mov	0x12, %r14
	.word 0xf6f38e40  ! 1846: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf8a5a016  ! 1847: STWA_I	stwa	%r28, [%r22 + 0x0016] %asi
iob_intr_3_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_145), 16, 16)) -> intp(3, 0, 35)
	.word 0xbd3cb001  ! 1850: SRAX_I	srax	%r18, 0x0001, %r30
iob_intr_3_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_146), 16, 16)) -> intp(3, 0, 32)
T3_asi_reg_rd_78:
	mov	0x8, %r14
	.word 0xfedb89e0  ! 1856: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbd7dc400  ! 1858: MOVR_R	movre	%r23, %r0, %r30
iob_intr_3_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_147), 16, 16)) -> intp(3, 0, 17)
	.word 0xf8a4614a  ! 1865: STWA_I	stwa	%r28, [%r17 + 0x014a] %asi
	.word 0xf6ac4020  ! 1869: STBA_R	stba	%r27, [%r17 + %r0] 0x01
T3_asi_reg_rd_79:
	mov	0x11, %r14
	.word 0xfedb8400  ! 1870: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_3_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_148), 16, 16)) -> intp(3, 0, 14)
	.word 0xb32ce001  ! 1873: SLL_I	sll 	%r19, 0x0001, %r25
iob_intr_3_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_149), 16, 16)) -> intp(3, 0, 16)
iob_intr_3_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_150), 16, 16)) -> intp(3, 0, 9)
	ta	T_CHANGE_TO_TL0
	.word 0xf625c000  ! 1881: STW_R	stw	%r27, [%r23 + %r0]
cpu_intr_3_135:
	setx	0x2c0335, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983bd8  ! 1884: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd8, %hpstate
iob_intr_3_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_151), 16, 16)) -> intp(3, 0, 2c)
cpu_intr_3_136:
	setx	0x2c013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ada1b0  ! 1894: STBA_I	stba	%r26, [%r22 + 0x01b0] %asi
T3_asi_reg_rd_80:
	mov	0x38, %r14
	.word 0xfcdb8e80  ! 1895: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf22de1e3  ! 1896: STB_I	stb	%r25, [%r23 + 0x01e3]
T3_asi_reg_rd_81:
	mov	0x18, %r14
	.word 0xf2db84a0  ! 1898: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_3_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_152), 16, 16)) -> intp(3, 0, 16)
	.word 0xfe3561f5  ! 1906: STH_I	sth	%r31, [%r21 + 0x01f5]
T3_asi_reg_wr_90:
	mov	0x3c8, %r14
	.word 0xf6f38400  ! 1908: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_3_137:
	setx	0x2f012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa24617f  ! 1913: STW_I	stw	%r29, [%r17 + 0x017f]
iob_intr_3_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_153), 16, 16)) -> intp(3, 0, 32)
	.word 0xbc9520d0  ! 1915: ORcc_I	orcc 	%r20, 0x00d0, %r30
	.word 0xb2b4a06d  ! 1916: SUBCcc_I	orncc 	%r18, 0x006d, %r25
	.word 0xba158000  ! 1917: OR_R	or 	%r22, %r0, %r29
T3_asi_reg_wr_91:
	mov	0x3c0, %r14
	.word 0xf2f384a0  ! 1918: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf225e060  ! 1919: STW_I	stw	%r25, [%r23 + 0x0060]
	.word 0xfab5a099  ! 1920: STHA_I	stha	%r29, [%r22 + 0x0099] %asi
iob_intr_3_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_154), 16, 16)) -> intp(3, 0, 22)
	.word 0xfa34a17d  ! 1922: STH_I	sth	%r29, [%r18 + 0x017d]
	.word 0xfc244000  ! 1923: STW_R	stw	%r30, [%r17 + %r0]
	.word 0xf4a4a161  ! 1924: STWA_I	stwa	%r26, [%r18 + 0x0161] %asi
cpu_intr_3_138:
	setx	0x2c0206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf875c000  ! 1926: STX_R	stx	%r28, [%r23 + %r0]
cpu_intr_3_139:
	setx	0x2c0329, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_3_140:
	setx	0x2f0200, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983d00  ! 1931: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d00, %hpstate
	.word 0xfeb4a0d5  ! 1933: STHA_I	stha	%r31, [%r18 + 0x00d5] %asi
T3_asi_reg_wr_92:
	mov	0x14, %r14
	.word 0xf2f38400  ! 1934: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_3_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_155), 16, 16)) -> intp(3, 0, d)
	.word 0xbd643801  ! 1936: MOVcc_I	<illegal instruction>
	.word 0xb0840000  ! 1937: ADDcc_R	addcc 	%r16, %r0, %r24
	.word 0xf8a5a044  ! 1939: STWA_I	stwa	%r28, [%r22 + 0x0044] %asi
	.word 0xfcacc020  ! 1940: STBA_R	stba	%r30, [%r19 + %r0] 0x01
cpu_intr_3_141:
	setx	0x2c0318, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_82:
	mov	0x15, %r14
	.word 0xf0db8e40  ! 1944: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfaa40020  ! 1950: STWA_R	stwa	%r29, [%r16 + %r0] 0x01
	.word 0xf0240000  ! 1952: STW_R	stw	%r24, [%r16 + %r0]
T3_asi_reg_wr_93:
	mov	0x2e, %r14
	.word 0xf0f38e40  ! 1953: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_142:
	setx	0x2d0100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb68561c5  ! 1956: ADDcc_I	addcc 	%r21, 0x01c5, %r27
	.word 0xfc344000  ! 1960: STH_R	sth	%r30, [%r17 + %r0]
cpu_intr_3_143:
	setx	0x2d0102, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_94:
	mov	0x15, %r14
	.word 0xf8f38e80  ! 1965: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T3_asi_reg_wr_95:
	mov	0x13, %r14
	.word 0xf8f38e60  ! 1968: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_3_144:
	setx	0x2c0103, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_96:
	mov	0x17, %r14
	.word 0xfaf38e40  ! 1972: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_3_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_156), 16, 16)) -> intp(3, 0, 14)
iob_intr_3_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_157), 16, 16)) -> intp(3, 0, 34)
cpu_intr_3_145:
	setx	0x2e012f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_146:
	setx	0x2d0136, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_97:
	mov	0xa, %r14
	.word 0xf8f384a0  ! 1980: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf22d8000  ! 1983: STB_R	stb	%r25, [%r22 + %r0]
cpu_intr_3_147:
	setx	0x2e0038, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_148:
	setx	0x2e0336, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_158), 16, 16)) -> intp(3, 0, c)
	.word 0xf82da1a6  ! 1987: STB_I	stb	%r28, [%r22 + 0x01a6]
T3_asi_reg_rd_83:
	mov	0x2e, %r14
	.word 0xfcdb89e0  ! 1988: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_3_149:
	setx	0x2e0330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2cc000  ! 1990: STB_R	stb	%r31, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_98:
	mov	0x3c6, %r14
	.word 0xf8f38e40  ! 1994: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbcb5e0c5  ! 1995: SUBCcc_I	orncc 	%r23, 0x00c5, %r30
	.word 0xfc750000  ! 1996: STX_R	stx	%r30, [%r20 + %r0]
cpu_intr_3_150:
	setx	0x2c011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe254000  ! 2001: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xf67421b3  ! 2004: STX_I	stx	%r27, [%r16 + 0x01b3]
	ta	T_CHANGE_NONHPRIV
iob_intr_3_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_159), 16, 16)) -> intp(3, 0, 3d)
T3_asi_reg_wr_99:
	mov	0x1b, %r14
	.word 0xf6f38e40  ! 2009: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_rd_84:
	mov	0x3c2, %r14
	.word 0xf4db8e40  ! 2010: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf475e13e  ! 2011: STX_I	stx	%r26, [%r23 + 0x013e]
cpu_intr_3_151:
	setx	0x2e0108, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_152:
	setx	0x2e032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe74e00a  ! 2015: STX_I	stx	%r31, [%r19 + 0x000a]
	.word 0xf02d0000  ! 2016: STB_R	stb	%r24, [%r20 + %r0]
T3_asi_reg_rd_85:
	mov	0x3c6, %r14
	.word 0xf6db84a0  ! 2021: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_3_153:
	setx	0x2d031b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_160), 16, 16)) -> intp(3, 0, 11)
cpu_intr_3_154:
	setx	0x2d0329, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_100:
	mov	0x20, %r14
	.word 0xf4f38400  ! 2028: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf83521a7  ! 2031: STH_I	sth	%r28, [%r20 + 0x01a7]
	.word 0xf4ac4020  ! 2034: STBA_R	stba	%r26, [%r17 + %r0] 0x01
	.word 0xf0ace0d8  ! 2035: STBA_I	stba	%r24, [%r19 + 0x00d8] %asi
cpu_intr_3_155:
	setx	0x2e0236, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_86:
	mov	0x2a, %r14
	.word 0xf2db8e60  ! 2040: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xfe258000  ! 2041: STW_R	stw	%r31, [%r22 + %r0]
	.word 0xfc7460c5  ! 2044: STX_I	stx	%r30, [%r17 + 0x00c5]
iob_intr_3_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_161), 16, 16)) -> intp(3, 0, 5)
	.word 0xf42da180  ! 2046: STB_I	stb	%r26, [%r22 + 0x0180]
iob_intr_3_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_162), 16, 16)) -> intp(3, 0, 24)
	.word 0xf625e121  ! 2050: STW_I	stw	%r27, [%r23 + 0x0121]
	.word 0xf0b4c020  ! 2051: STHA_R	stha	%r24, [%r19 + %r0] 0x01
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983a42  ! 2058: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a42, %hpstate
iob_intr_3_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_163), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_wr_101:
	mov	0x2c, %r14
	.word 0xf0f389e0  ! 2060: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf035612d  ! 2061: STH_I	sth	%r24, [%r21 + 0x012d]
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x819829c8  ! 2064: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c8, %hpstate
iob_intr_3_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_164), 16, 16)) -> intp(3, 0, 3a)
	.word 0x9195e119  ! 2067: WRPR_PIL_I	wrpr	%r23, 0x0119, %pil
iob_intr_3_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_165), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_wr_102:
	mov	0x33, %r14
	.word 0xfaf384a0  ! 2074: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	ta	T_CHANGE_TO_TL1
	.word 0xf4b5a045  ! 2078: STHA_I	stha	%r26, [%r22 + 0x0045] %asi
	.word 0xf2b40020  ! 2079: STHA_R	stha	%r25, [%r16 + %r0] 0x01
T3_asi_reg_rd_87:
	mov	0xb, %r14
	.word 0xfadb8e60  ! 2080: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T3_asi_reg_wr_103:
	mov	0xf, %r14
	.word 0xfef38e60  ! 2081: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf6258000  ! 2082: STW_R	stw	%r27, [%r22 + %r0]
	.word 0xf8b4608b  ! 2083: STHA_I	stha	%r28, [%r17 + 0x008b] %asi
	.word 0xfc2c2100  ! 2085: STB_I	stb	%r30, [%r16 + 0x0100]
iob_intr_3_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_166), 16, 16)) -> intp(3, 0, 1a)
	.word 0xfc2cc000  ! 2089: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xf67520b1  ! 2090: STX_I	stx	%r27, [%r20 + 0x00b1]
	.word 0xfab460eb  ! 2092: STHA_I	stha	%r29, [%r17 + 0x00eb] %asi
	ta	T_CHANGE_TO_TL1
iob_intr_3_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_167), 16, 16)) -> intp(3, 0, 1c)
	.word 0xbac4c000  ! 2097: ADDCcc_R	addccc 	%r19, %r0, %r29
	.word 0xb0a5a0dd  ! 2101: SUBcc_I	subcc 	%r22, 0x00dd, %r24
iob_intr_3_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_168), 16, 16)) -> intp(3, 0, 2d)
T3_asi_reg_rd_88:
	mov	0x3c3, %r14
	.word 0xfadb8e40  ! 2107: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_3_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_169), 16, 16)) -> intp(3, 0, 39)
cpu_intr_3_156:
	setx	0x2c0238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe34a097  ! 2115: STH_I	sth	%r31, [%r18 + 0x0097]
	ta	T_CHANGE_NONHPRIV
iob_intr_3_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_170), 16, 16)) -> intp(3, 0, d)
	.word 0xfcf5a121  ! 2120: STXA_I	stxa	%r30, [%r22 + 0x0121] %asi
T3_asi_reg_wr_104:
	mov	0x1d, %r14
	.word 0xf4f38400  ! 2121: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb094a09f  ! 2122: ORcc_I	orcc 	%r18, 0x009f, %r24
cpu_intr_3_157:
	setx	0x2f001e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_171), 16, 16)) -> intp(3, 0, 23)
cpu_intr_3_158:
	setx	0x2f002c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_159:
	setx	0x2f0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb404c000  ! 2129: ADD_R	add 	%r19, %r0, %r26
	.word 0xfcb5c020  ! 2132: STHA_R	stha	%r30, [%r23 + %r0] 0x01
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983e40  ! 2133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e40, %hpstate
iob_intr_3_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_172), 16, 16)) -> intp(3, 0, a)
iob_intr_3_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_173), 16, 16)) -> intp(3, 0, f)
iob_intr_3_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_174), 16, 16)) -> intp(3, 0, 0)
T3_asi_reg_rd_89:
	mov	0x3c7, %r14
	.word 0xfcdb8e40  ! 2140: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_175), 16, 16)) -> intp(3, 0, 2)
	.word 0xf8adc020  ! 2142: STBA_R	stba	%r28, [%r23 + %r0] 0x01
iob_intr_3_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_176), 16, 16)) -> intp(3, 0, 26)
cpu_intr_3_160:
	setx	0x2d0335, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_90:
	mov	0x3c2, %r14
	.word 0xf8db8400  ! 2146: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_3_161:
	setx	0x2c0316, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_105:
	mov	0x34, %r14
	.word 0xf8f389e0  ! 2149: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T3_asi_reg_wr_106:
	mov	0x1c, %r14
	.word 0xfef38e40  ! 2150: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbe8d0000  ! 2152: ANDcc_R	andcc 	%r20, %r0, %r31
	.word 0xf6754000  ! 2153: STX_R	stx	%r27, [%r21 + %r0]
	.word 0xf6ad8020  ! 2154: STBA_R	stba	%r27, [%r22 + %r0] 0x01
	.word 0xf4a44020  ! 2155: STWA_R	stwa	%r26, [%r17 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfe2d2049  ! 2162: STB_I	stb	%r31, [%r20 + 0x0049]
	.word 0xf0b48020  ! 2165: STHA_R	stha	%r24, [%r18 + %r0] 0x01
iob_intr_3_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_177), 16, 16)) -> intp(3, 0, 1e)
	.word 0xfaa42008  ! 2168: STWA_I	stwa	%r29, [%r16 + 0x0008] %asi
	.word 0xf02dc000  ! 2170: STB_R	stb	%r24, [%r23 + %r0]
iob_intr_3_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_178), 16, 16)) -> intp(3, 0, 35)
cpu_intr_3_162:
	setx	0x2f003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b58020  ! 2184: STHA_R	stha	%r27, [%r22 + %r0] 0x01
cpu_intr_3_163:
	setx	0x2f013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_91:
	mov	0x21, %r14
	.word 0xf4db8e60  ! 2186: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x8198388a  ! 2192: WRHPR_HPSTATE_I	wrhpr	%r0, 0x188a, %hpstate
iob_intr_3_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_179), 16, 16)) -> intp(3, 0, 2e)
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_107:
	mov	0x3c4, %r14
	.word 0xf2f389e0  ! 2204: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf82d8000  ! 2205: STB_R	stb	%r28, [%r22 + %r0]
	.word 0xfcf42180  ! 2209: STXA_I	stxa	%r30, [%r16 + 0x0180] %asi
	.word 0xbb3cb001  ! 2211: SRAX_I	srax	%r18, 0x0001, %r29
T3_asi_reg_wr_108:
	mov	0x21, %r14
	.word 0xf0f384a0  ! 2214: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_180), 16, 16)) -> intp(3, 0, 39)
	.word 0xb89d21e6  ! 2218: XORcc_I	xorcc 	%r20, 0x01e6, %r28
T3_asi_reg_wr_109:
	mov	0x33, %r14
	.word 0xfaf384a0  ! 2219: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbf340000  ! 2225: SRL_R	srl 	%r16, %r0, %r31
	.word 0xb12c5000  ! 2227: SLLX_R	sllx	%r17, %r0, %r24
	.word 0xfa344000  ! 2231: STH_R	sth	%r29, [%r17 + %r0]
T3_asi_reg_wr_110:
	mov	0x2b, %r14
	.word 0xfcf389e0  ! 2232: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	ta	T_CHANGE_NONHPRIV
iob_intr_3_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_181), 16, 16)) -> intp(3, 0, 25)
	.word 0xfe75e1b4  ! 2240: STX_I	stx	%r31, [%r23 + 0x01b4]
T3_asi_reg_rd_92:
	mov	0x22, %r14
	.word 0xfcdb8e60  ! 2245: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T3_asi_reg_rd_93:
	mov	0x30, %r14
	.word 0xf8db89e0  ! 2246: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_182), 16, 16)) -> intp(3, 0, 1f)
T3_asi_reg_wr_111:
	mov	0x3c0, %r14
	.word 0xf8f38400  ! 2251: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_3_164:
	setx	0x2f011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb58020  ! 2254: STHA_R	stha	%r31, [%r22 + %r0] 0x01
	.word 0xfe254000  ! 2255: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xfa75a123  ! 2256: STX_I	stx	%r29, [%r22 + 0x0123]
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983808  ! 2260: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1808, %hpstate
	.word 0xf2b50020  ! 2262: STHA_R	stha	%r25, [%r20 + %r0] 0x01
T3_asi_reg_rd_94:
	mov	0x2a, %r14
	.word 0xfedb8e60  ! 2263: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983810  ! 2264: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1810, %hpstate
iob_intr_3_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_183), 16, 16)) -> intp(3, 0, 2f)
cpu_intr_3_165:
	setx	0x2c0336, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_95:
	mov	0x3c4, %r14
	.word 0xf0db8400  ! 2270: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb24460dd  ! 2271: ADDC_I	addc 	%r17, 0x00dd, %r25
T3_asi_reg_rd_96:
	mov	0x3c6, %r14
	.word 0xf4db8e60  ! 2273: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T3_asi_reg_rd_97:
	mov	0xf, %r14
	.word 0xfcdb8e40  ! 2275: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_184), 16, 16)) -> intp(3, 0, 20)
	.word 0xfcb58020  ! 2281: STHA_R	stha	%r30, [%r22 + %r0] 0x01
cpu_intr_3_166:
	setx	0x310114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73df001  ! 2285: SRAX_I	srax	%r23, 0x0001, %r27
	.word 0xfc2da0c4  ! 2286: STB_I	stb	%r30, [%r22 + 0x00c4]
cpu_intr_3_167:
	setx	0x310237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbab4e0de  ! 2292: ORNcc_I	orncc 	%r19, 0x00de, %r29
iob_intr_3_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_185), 16, 16)) -> intp(3, 0, 16)
iob_intr_3_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_186), 16, 16)) -> intp(3, 0, 23)
	.word 0xbcc5e10b  ! 2297: ADDCcc_I	addccc 	%r23, 0x010b, %r30
iob_intr_3_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_187), 16, 16)) -> intp(3, 0, 25)
T3_asi_reg_wr_112:
	mov	0x38, %r14
	.word 0xf8f38e40  ! 2303: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983d1a  ! 2304: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d1a, %hpstate
T3_asi_reg_wr_113:
	mov	0x3c3, %r14
	.word 0xf0f38e80  ! 2307: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xfab56192  ! 2310: STHA_I	stha	%r29, [%r21 + 0x0192] %asi
	ta	T_CHANGE_HPRIV
iob_intr_3_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_188), 16, 16)) -> intp(3, 0, 29)
	.word 0xf4b54020  ! 2314: STHA_R	stha	%r26, [%r21 + %r0] 0x01
	.word 0xb8840000  ! 2317: ADDcc_R	addcc 	%r16, %r0, %r28
	.word 0xf0acc020  ! 2321: STBA_R	stba	%r24, [%r19 + %r0] 0x01
iob_intr_3_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_189), 16, 16)) -> intp(3, 0, 38)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf0258000  ! 2326: STW_R	stw	%r24, [%r22 + %r0]
T3_asi_reg_wr_114:
	mov	0x1f, %r14
	.word 0xf0f384a0  ! 2327: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_3_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_190), 16, 16)) -> intp(3, 0, 37)
cpu_intr_3_168:
	setx	0x300304, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_115:
	mov	0x3c4, %r14
	.word 0xfaf389e0  ! 2331: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf4aca008  ! 2332: STBA_I	stba	%r26, [%r18 + 0x0008] %asi
T3_asi_reg_wr_116:
	mov	0x14, %r14
	.word 0xfcf384a0  ! 2333: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_3_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_191), 16, 16)) -> intp(3, 0, 2c)
iob_intr_3_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_192), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf874a0a8  ! 2341: STX_I	stx	%r28, [%r18 + 0x00a8]
	.word 0xf0740000  ! 2345: STX_R	stx	%r24, [%r16 + %r0]
	.word 0xf2a50020  ! 2347: STWA_R	stwa	%r25, [%r20 + %r0] 0x01
T3_asi_reg_rd_98:
	mov	0x16, %r14
	.word 0xf8db8e40  ! 2348: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf0756047  ! 2349: STX_I	stx	%r24, [%r21 + 0x0047]
T3_asi_reg_rd_99:
	mov	0x26, %r14
	.word 0xf6db8e40  ! 2350: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_169:
	setx	0x300206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b44020  ! 2354: STHA_R	stha	%r24, [%r17 + %r0] 0x01
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982cd2  ! 2358: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd2, %hpstate
cpu_intr_3_170:
	setx	0x32022b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_171:
	setx	0x330105, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_172:
	setx	0x30011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2acc020  ! 2364: STBA_R	stba	%r25, [%r19 + %r0] 0x01
iob_intr_3_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_193), 16, 16)) -> intp(3, 0, 9)
iob_intr_3_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_194), 16, 16)) -> intp(3, 0, 2f)
	.word 0xfc74a019  ! 2368: STX_I	stx	%r30, [%r18 + 0x0019]
iob_intr_3_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_195), 16, 16)) -> intp(3, 0, a)
iob_intr_3_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_196), 16, 16)) -> intp(3, 0, 24)
cpu_intr_3_173:
	setx	0x31000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983a18  ! 2378: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a18, %hpstate
	.word 0xf0ad6034  ! 2379: STBA_I	stba	%r24, [%r21 + 0x0034] %asi
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_174:
	setx	0x300239, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_175:
	setx	0x300035, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_197), 16, 16)) -> intp(3, 0, 0)
T3_asi_reg_rd_100:
	mov	0x2b, %r14
	.word 0xf4db8e40  ! 2385: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf634a12c  ! 2386: STH_I	sth	%r27, [%r18 + 0x012c]
T3_asi_reg_rd_101:
	mov	0x3c2, %r14
	.word 0xfcdb8e60  ! 2387: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf02d8000  ! 2388: STB_R	stb	%r24, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4342142  ! 2392: STH_I	sth	%r26, [%r16 + 0x0142]
cpu_intr_3_176:
	setx	0x300226, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_198), 16, 16)) -> intp(3, 0, 34)
T3_asi_reg_rd_102:
	mov	0x26, %r14
	.word 0xf6db8e40  ! 2401: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_3_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_199), 16, 16)) -> intp(3, 0, 36)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfeb5e01a  ! 2410: STHA_I	stha	%r31, [%r23 + 0x001a] %asi
cpu_intr_3_177:
	setx	0x30000b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_117:
	mov	0x2, %r14
	.word 0xfaf38e40  ! 2412: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_3_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_200), 16, 16)) -> intp(3, 0, 37)
	.word 0xf4346085  ! 2417: STH_I	sth	%r26, [%r17 + 0x0085]
cpu_intr_3_178:
	setx	0x300210, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_103:
	mov	0x1, %r14
	.word 0xf6db84a0  ! 2420: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_3_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_201), 16, 16)) -> intp(3, 0, 37)
iob_intr_3_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_202), 16, 16)) -> intp(3, 0, 22)
	.word 0xfe350000  ! 2423: STH_R	sth	%r31, [%r20 + %r0]
T3_asi_reg_wr_118:
	mov	0x1d, %r14
	.word 0xfaf38e40  ! 2424: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_3_179:
	setx	0x32033c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_104:
	mov	0x3c8, %r14
	.word 0xf2db84a0  ! 2428: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T3_asi_reg_wr_119:
	mov	0x21, %r14
	.word 0xfcf38e40  ! 2430: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbf2c9000  ! 2431: SLLX_R	sllx	%r18, %r0, %r31
cpu_intr_3_180:
	setx	0x31001e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_105:
	mov	0x2f, %r14
	.word 0xf6db8e80  ! 2436: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb8bc0000  ! 2437: XNORcc_R	xnorcc 	%r16, %r0, %r28
T3_asi_reg_rd_106:
	mov	0xa, %r14
	.word 0xfcdb8e40  ! 2438: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_203), 16, 16)) -> intp(3, 0, 14)
	.word 0xf6ad8020  ! 2440: STBA_R	stba	%r27, [%r22 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
iob_intr_3_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_204), 16, 16)) -> intp(3, 0, 2c)
cpu_intr_3_181:
	setx	0x320010, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_107:
	mov	0x21, %r14
	.word 0xf0db8e40  ! 2449: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf4f4a012  ! 2452: STXA_I	stxa	%r26, [%r18 + 0x0012] %asi
cpu_intr_3_182:
	setx	0x33022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa358000  ! 2457: STH_R	sth	%r29, [%r22 + %r0]
	.word 0xf62da18d  ! 2459: STB_I	stb	%r27, [%r22 + 0x018d]
T3_asi_reg_wr_120:
	mov	0x33, %r14
	.word 0xf4f38400  ! 2460: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb03420f9  ! 2462: ORN_I	orn 	%r16, 0x00f9, %r24
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_121:
	mov	0x2d, %r14
	.word 0xf2f384a0  ! 2468: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_3_183:
	setx	0x33000d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_184:
	setx	0x2022b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_185:
	setx	0x300304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_205), 16, 16)) -> intp(3, 0, 7)
	.word 0xb404e177  ! 2477: ADD_I	add 	%r19, 0x0177, %r26
	.word 0xb5355000  ! 2478: SRLX_R	srlx	%r21, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb20421d5  ! 2482: ADD_I	add 	%r16, 0x01d5, %r25
cpu_intr_3_186:
	setx	0x300202, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_187:
	setx	0x300213, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_188:
	setx	0x330015, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_189:
	setx	0x32020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_108:
	mov	0xa, %r14
	.word 0xfedb8e80  ! 2497: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf0b4c020  ! 2501: STHA_R	stha	%r24, [%r19 + %r0] 0x01
	.word 0xba0d4000  ! 2503: AND_R	and 	%r21, %r0, %r29
	.word 0xb7641800  ! 2505: MOVcc_R	<illegal instruction>
T3_asi_reg_rd_109:
	mov	0x3c8, %r14
	.word 0xfcdb8e40  ! 2506: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_rd_110:
	mov	0x24, %r14
	.word 0xfcdb8e80  ! 2507: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_3_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_206), 16, 16)) -> intp(3, 0, 3c)
T3_asi_reg_wr_122:
	mov	0x33, %r14
	.word 0xf4f38400  ! 2510: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T3_asi_reg_wr_123:
	mov	0x1c, %r14
	.word 0xfef38e40  ! 2511: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_3_190:
	setx	0x310133, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_111:
	mov	0x3c0, %r14
	.word 0xfadb84a0  ! 2516: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_3_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_207), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_191:
	setx	0x310133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb4a0b3  ! 2526: STHA_I	stha	%r30, [%r18 + 0x00b3] %asi
	.word 0xfca58020  ! 2530: STWA_R	stwa	%r30, [%r22 + %r0] 0x01
iob_intr_3_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_208), 16, 16)) -> intp(3, 0, 29)
	.word 0xf6350000  ! 2533: STH_R	sth	%r27, [%r20 + %r0]
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982bca  ! 2534: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bca, %hpstate
	.word 0xf434a051  ! 2536: STH_I	sth	%r26, [%r18 + 0x0051]
	.word 0xb97cc400  ! 2538: MOVR_R	movre	%r19, %r0, %r28
iob_intr_3_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_209), 16, 16)) -> intp(3, 0, 1)
T3_asi_reg_rd_112:
	mov	0x3c0, %r14
	.word 0xf2db8e80  ! 2540: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf0350000  ! 2542: STH_R	sth	%r24, [%r20 + %r0]
	.word 0xfaa58020  ! 2544: STWA_R	stwa	%r29, [%r22 + %r0] 0x01
T3_asi_reg_rd_113:
	mov	0x5, %r14
	.word 0xf6db89e0  ! 2547: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_3_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_210), 16, 16)) -> intp(3, 0, 8)
iob_intr_3_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_211), 16, 16)) -> intp(3, 0, 32)
	.word 0xfa750000  ! 2550: STX_R	stx	%r29, [%r20 + %r0]
	setx	data_start_3, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982d90  ! 2551: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d90, %hpstate
cpu_intr_3_192:
	setx	0x300217, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_212), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_rd_114:
	mov	0x3c2, %r14
	.word 0xf8db8e60  ! 2555: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xfe25c000  ! 2556: STW_R	stw	%r31, [%r23 + %r0]
	.word 0xbf35f001  ! 2558: SRLX_I	srlx	%r23, 0x0001, %r31
T3_asi_reg_wr_124:
	mov	0x3c3, %r14
	.word 0xfaf38e60  ! 2560: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_3_193:
	setx	0x310107, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_213), 16, 16)) -> intp(3, 0, 32)
iob_intr_3_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_214), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_215), 16, 16)) -> intp(3, 0, 2)
	.word 0xb01d4000  ! 2565: XOR_R	xor 	%r21, %r0, %r24
	.word 0xf624201a  ! 2569: STW_I	stw	%r27, [%r16 + 0x001a]
iob_intr_3_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_216), 16, 16)) -> intp(3, 0, 1f)
	ta	T_CHANGE_TO_TL0
	.word 0xfab54020  ! 2578: STHA_R	stha	%r29, [%r21 + %r0] 0x01
iob_intr_3_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_217), 16, 16)) -> intp(3, 0, 3d)
	.word 0xfe3420d7  ! 2584: STH_I	sth	%r31, [%r16 + 0x00d7]
cpu_intr_3_194:
	setx	0x300320, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_218), 16, 16)) -> intp(3, 0, 33)
cpu_intr_3_195:
	setx	0x300206, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_196:
	setx	0x300222, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_197:
	setx	0x30020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_219), 16, 16)) -> intp(3, 0, 12)
iob_intr_3_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_220), 16, 16)) -> intp(3, 0, 7)
T3_asi_reg_rd_115:
	mov	0x22, %r14
	.word 0xfedb89e0  ! 2598: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xfc2460ea  ! 2600: STW_I	stw	%r30, [%r17 + 0x00ea]
T3_asi_reg_wr_125:
	mov	0x9, %r14
	.word 0xf8f384a0  ! 2601: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_3_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_221), 16, 16)) -> intp(3, 0, 20)
T3_asi_reg_rd_116:
	mov	0x14, %r14
	.word 0xfedb84a0  ! 2606: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf8356173  ! 2607: STH_I	sth	%r28, [%r21 + 0x0173]
iob_intr_3_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_222), 16, 16)) -> intp(3, 0, 31)
T3_asi_reg_wr_126:
	mov	0x2d, %r14
	.word 0xfef38400  ! 2614: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xfab4e157  ! 2616: STHA_I	stha	%r29, [%r19 + 0x0157] %asi
	.word 0xb615c000  ! 2617: OR_R	or 	%r23, %r0, %r27
	.word 0xf8358000  ! 2618: STH_R	sth	%r28, [%r22 + %r0]
iob_intr_3_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_223), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_198:
	setx	0x30013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4754000  ! 2625: STX_R	stx	%r26, [%r21 + %r0]
iob_intr_3_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_224), 16, 16)) -> intp(3, 0, c)
cpu_intr_3_199:
	setx	0x320307, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_225), 16, 16)) -> intp(3, 0, 18)
	.word 0xf2ac8020  ! 2636: STBA_R	stba	%r25, [%r18 + %r0] 0x01
iob_intr_3_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_226), 16, 16)) -> intp(3, 0, f)
T3_asi_reg_rd_117:
	mov	0x25, %r14
	.word 0xf6db8400  ! 2639: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T3_asi_reg_wr_127:
	mov	0x30, %r14
	.word 0xf4f38e60  ! 2641: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb12c7001  ! 2642: SLLX_I	sllx	%r17, 0x0001, %r24
	.word 0xf2a40020  ! 2647: STWA_R	stwa	%r25, [%r16 + %r0] 0x01
	.word 0xf2258000  ! 2648: STW_R	stw	%r25, [%r22 + %r0]
cpu_intr_3_200:
	setx	0x330200, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_201:
	setx	0x300135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb22d2185  ! 2651: ANDN_I	andn 	%r20, 0x0185, %r25
iob_intr_3_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_227), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf8240000  ! 2654: STW_R	stw	%r28, [%r16 + %r0]
	.word 0xfeac8020  ! 2655: STBA_R	stba	%r31, [%r18 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
cpu_intr_3_202:
	setx	0x310326, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_203:
	setx	0x300333, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_128:
	mov	0x1f, %r14
	.word 0xf6f38400  ! 2666: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xfcade124  ! 2667: STBA_I	stba	%r30, [%r23 + 0x0124] %asi
iob_intr_3_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_228), 16, 16)) -> intp(3, 0, 4)
iob_intr_3_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_229), 16, 16)) -> intp(3, 0, 33)
cpu_intr_3_204:
	setx	0x330027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_205:
	setx	0x310308, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_206:
	setx	0x310215, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_118:
	mov	0x31, %r14
	.word 0xf6db8e40  ! 2683: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_207:
	setx	0x310104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb934a001  ! 2685: SRL_I	srl 	%r18, 0x0001, %r28
	ta	T_CHANGE_TO_TL0
	.word 0xfa744000  ! 2690: STX_R	stx	%r29, [%r17 + %r0]
	.word 0xbe1de050  ! 2691: XOR_I	xor 	%r23, 0x0050, %r31
T3_asi_reg_rd_119:
	mov	0x3c4, %r14
	.word 0xfcdb8400  ! 2693: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T3_asi_reg_rd_120:
	mov	0x10, %r14
	.word 0xf0db84a0  ! 2694: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T3_asi_reg_wr_129:
	mov	0x11, %r14
	.word 0xf8f384a0  ! 2696: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb9540000  ! 2697: RDPR_GL	rdpr	%-, %r28
	.word 0xf2356050  ! 2702: STH_I	sth	%r25, [%r21 + 0x0050]
	.word 0xbd7da401  ! 2704: MOVR_I	movre	%r22, 0x1, %r30
cpu_intr_3_208:
	setx	0x300019, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_230), 16, 16)) -> intp(3, 0, 38)
cpu_intr_3_209:
	setx	0x330117, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_210:
	setx	0x310101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ace1b0  ! 2716: STBA_I	stba	%r28, [%r19 + 0x01b0] %asi
	.word 0xfc2ca072  ! 2718: STB_I	stb	%r30, [%r18 + 0x0072]
cpu_intr_3_211:
	setx	0x33031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2ca030  ! 2720: STB_I	stb	%r31, [%r18 + 0x0030]
	.word 0xf0b5a116  ! 2723: STHA_I	stha	%r24, [%r22 + 0x0116] %asi
	.word 0xf0344000  ! 2724: STH_R	sth	%r24, [%r17 + %r0]
iob_intr_3_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_231), 16, 16)) -> intp(3, 0, 2e)
	.word 0xb1508000  ! 2729: RDPR_TSTATE	<illegal instruction>
iob_intr_3_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_232), 16, 16)) -> intp(3, 0, 23)
	ta	T_CHANGE_HPRIV
	.word 0xf2b46050  ! 2740: STHA_I	stha	%r25, [%r17 + 0x0050] %asi
	.word 0xf6a5a035  ! 2741: STWA_I	stwa	%r27, [%r22 + 0x0035] %asi
iob_intr_3_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_233), 16, 16)) -> intp(3, 0, 1c)
cpu_intr_3_212:
	setx	0x340310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a58020  ! 2750: STWA_R	stwa	%r24, [%r22 + %r0] 0x01
T3_asi_reg_wr_130:
	mov	0x3c3, %r14
	.word 0xf4f38e80  ! 2751: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_3_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_234), 16, 16)) -> intp(3, 0, 27)
	.word 0xf6f4609c  ! 2755: STXA_I	stxa	%r27, [%r17 + 0x009c] %asi
	.word 0xf2b4c020  ! 2757: STHA_R	stha	%r25, [%r19 + %r0] 0x01
iob_intr_3_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_235), 16, 16)) -> intp(3, 0, 24)
	.word 0xf6b48020  ! 2760: STHA_R	stha	%r27, [%r18 + %r0] 0x01
T3_asi_reg_rd_121:
	mov	0x3c8, %r14
	.word 0xfedb8e60  ! 2762: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_3_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_236), 16, 16)) -> intp(3, 0, 31)
	.word 0xb03461db  ! 2766: ORN_I	orn 	%r17, 0x01db, %r24
	.word 0xf8344000  ! 2768: STH_R	sth	%r28, [%r17 + %r0]
cpu_intr_3_213:
	setx	0x35000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2da060  ! 2771: STB_I	stb	%r30, [%r22 + 0x0060]
T3_asi_reg_rd_122:
	mov	0x7, %r14
	.word 0xf4db84a0  ! 2773: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T3_asi_reg_wr_131:
	mov	0x3c1, %r14
	.word 0xf4f384a0  ! 2774: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xfaa561be  ! 2776: STWA_I	stwa	%r29, [%r21 + 0x01be] %asi
	.word 0xf8a50020  ! 2777: STWA_R	stwa	%r28, [%r20 + %r0] 0x01
	.word 0xf8a52181  ! 2779: STWA_I	stwa	%r28, [%r20 + 0x0181] %asi
T3_asi_reg_rd_123:
	mov	0x12, %r14
	.word 0xfadb84a0  ! 2781: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_3_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_237), 16, 16)) -> intp(3, 0, 31)
	.word 0xb8844000  ! 2784: ADDcc_R	addcc 	%r17, %r0, %r28
	.word 0xfc2cc000  ! 2787: STB_R	stb	%r30, [%r19 + %r0]
cpu_intr_3_214:
	setx	0x360119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b5618d  ! 2790: STHA_I	stha	%r27, [%r21 + 0x018d] %asi
	.word 0xb414c000  ! 2791: OR_R	or 	%r19, %r0, %r26
	.word 0xf4ad8020  ! 2793: STBA_R	stba	%r26, [%r22 + %r0] 0x01
	.word 0xf224a0fc  ! 2794: STW_I	stw	%r25, [%r18 + 0x00fc]
T3_asi_reg_wr_132:
	mov	0x3c3, %r14
	.word 0xf6f389e0  ! 2797: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_3_215:
	setx	0x340227, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_124:
	mov	0x1e, %r14
	.word 0xf0db8e80  ! 2808: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xba2c2103  ! 2810: ANDN_I	andn 	%r16, 0x0103, %r29
	.word 0xf0346102  ! 2811: STH_I	sth	%r24, [%r17 + 0x0102]
iob_intr_3_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_238), 16, 16)) -> intp(3, 0, 1b)
T3_asi_reg_wr_133:
	mov	0x9, %r14
	.word 0xfaf389e0  ! 2814: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xfe2c20e2  ! 2815: STB_I	stb	%r31, [%r16 + 0x00e2]
	.word 0xf8346096  ! 2816: STH_I	sth	%r28, [%r17 + 0x0096]
	.word 0xfca40020  ! 2822: STWA_R	stwa	%r30, [%r16 + %r0] 0x01
T3_asi_reg_wr_134:
	mov	0x14, %r14
	.word 0xfef38e40  ! 2823: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_3_216:
	setx	0x350333, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf8acc020  ! 2826: STBA_R	stba	%r28, [%r19 + %r0] 0x01
	.word 0xfef4e011  ! 2827: STXA_I	stxa	%r31, [%r19 + 0x0011] %asi
iob_intr_3_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_239), 16, 16)) -> intp(3, 0, 1c)
cpu_intr_3_217:
	setx	0x35011e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_218:
	setx	0x360027, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_125:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 2837: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbd3c0000  ! 2838: SRA_R	sra 	%r16, %r0, %r30
	.word 0xfea4e0a1  ! 2841: STWA_I	stwa	%r31, [%r19 + 0x00a1] %asi
cpu_intr_3_219:
	setx	0x350215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf234c000  ! 2843: STH_R	sth	%r25, [%r19 + %r0]
iob_intr_3_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_240), 16, 16)) -> intp(3, 0, 8)
T3_asi_reg_rd_126:
	mov	0x10, %r14
	.word 0xfedb8e80  ! 2845: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T3_asi_reg_rd_127:
	mov	0x3c3, %r14
	.word 0xfcdb8e80  ! 2846: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xfe7461bc  ! 2848: STX_I	stx	%r31, [%r17 + 0x01bc]
cpu_intr_3_220:
	setx	0x37030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b5e100  ! 2853: STHA_I	stha	%r27, [%r23 + 0x0100] %asi
	.word 0xf0344000  ! 2854: STH_R	sth	%r24, [%r17 + %r0]
	.word 0xfef4a1a8  ! 2857: STXA_I	stxa	%r31, [%r18 + 0x01a8] %asi
	.word 0xa1902000  ! 2861: WRPR_GL_I	wrpr	%r0, 0x0000, %-
iob_intr_3_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_241), 16, 16)) -> intp(3, 0, 37)
	.word 0xf82c4000  ! 2863: STB_R	stb	%r28, [%r17 + %r0]
cpu_intr_3_221:
	setx	0x370010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab4c020  ! 2867: STHA_R	stha	%r29, [%r19 + %r0] 0x01
T3_asi_reg_rd_128:
	mov	0x1d, %r14
	.word 0xf6db84a0  ! 2871: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_3_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_242), 16, 16)) -> intp(3, 0, 24)
	.word 0xf8354000  ! 2873: STH_R	sth	%r28, [%r21 + %r0]
iob_intr_3_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_243), 16, 16)) -> intp(3, 0, 3d)
	.word 0xb6944000  ! 2876: ORcc_R	orcc 	%r17, %r0, %r27
	setx	data_start_3, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x8198294a  ! 2881: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094a, %hpstate
iob_intr_3_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_244), 16, 16)) -> intp(3, 0, 5)
	.word 0xb4b5c000  ! 2883: SUBCcc_R	orncc 	%r23, %r0, %r26
	.word 0xfcb50020  ! 2884: STHA_R	stha	%r30, [%r20 + %r0] 0x01
iob_intr_3_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_245), 16, 16)) -> intp(3, 0, 2a)
	ta	T_CHANGE_TO_TL0
	.word 0xf8ac0020  ! 2887: STBA_R	stba	%r28, [%r16 + %r0] 0x01
cpu_intr_3_222:
	setx	0x37023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983988  ! 2893: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1988, %hpstate
	ta	T_CHANGE_TO_TL1
	.word 0xb235e140  ! 2896: ORN_I	orn 	%r23, 0x0140, %r25
	.word 0xf075a08b  ! 2898: STX_I	stx	%r24, [%r22 + 0x008b]
	.word 0xfcb50020  ! 2899: STHA_R	stha	%r30, [%r20 + %r0] 0x01
	.word 0xf6b5c020  ! 2901: STHA_R	stha	%r27, [%r23 + %r0] 0x01
iob_intr_3_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_246), 16, 16)) -> intp(3, 0, 10)
	.word 0xb29561c2  ! 2909: ORcc_I	orcc 	%r21, 0x01c2, %r25
	ta	T_CHANGE_TO_TL1
	.word 0xfa75e070  ! 2912: STX_I	stx	%r29, [%r23 + 0x0070]
cpu_intr_3_223:
	setx	0x36010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc35a12d  ! 2920: STH_I	sth	%r30, [%r22 + 0x012d]
	.word 0xf0b58020  ! 2921: STHA_R	stha	%r24, [%r22 + %r0] 0x01
T3_asi_reg_rd_129:
	mov	0x33, %r14
	.word 0xfadb8e60  ! 2923: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf0b48020  ! 2924: STHA_R	stha	%r24, [%r18 + %r0] 0x01
iob_intr_3_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_247), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf074c000  ! 2929: STX_R	stx	%r24, [%r19 + %r0]
cpu_intr_3_224:
	setx	0x350021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb58020  ! 2935: STHA_R	stha	%r31, [%r22 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2b52191  ! 2939: STHA_I	stha	%r25, [%r20 + 0x0191] %asi
cpu_intr_3_225:
	setx	0x1e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa24a126  ! 2943: STW_I	stw	%r29, [%r18 + 0x0126]
T3_asi_reg_rd_130:
	mov	0x8, %r14
	.word 0xfadb8e40  ! 2944: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_3_226:
	setx	0x340306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5500000  ! 2946: RDPR_TPC	rdpr	%tpc, %r26
iob_intr_3_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_248), 16, 16)) -> intp(3, 0, b)
iob_intr_3_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_249), 16, 16)) -> intp(3, 0, e)
	.word 0xfab520de  ! 2953: STHA_I	stha	%r29, [%r20 + 0x00de] %asi
iob_intr_3_250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_250), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf6356011  ! 2956: STH_I	sth	%r27, [%r21 + 0x0011]
	.word 0xfe3560d7  ! 2957: STH_I	sth	%r31, [%r21 + 0x00d7]
T3_asi_reg_rd_131:
	mov	0x2b, %r14
	.word 0xf6db89e0  ! 2958: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb0944000  ! 2960: ORcc_R	orcc 	%r17, %r0, %r24
T3_asi_reg_rd_132:
	mov	0x2b, %r14
	.word 0xf6db8e40  ! 2963: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982880  ! 2964: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0880, %hpstate
cpu_intr_3_227:
	setx	0x340017, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_251), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_228:
	setx	0x370138, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_135:
	mov	0x3c6, %r14
	.word 0xfef38e80  ! 2973: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xfa2ca056  ! 2977: STB_I	stb	%r29, [%r18 + 0x0056]
cpu_intr_3_229:
	setx	0x370025, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_252), 16, 16)) -> intp(3, 0, 21)
iob_intr_3_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_253), 16, 16)) -> intp(3, 0, 20)
	.word 0xf2ad210d  ! 2982: STBA_I	stba	%r25, [%r20 + 0x010d] %asi
	.word 0xf87561a9  ! 2983: STX_I	stx	%r28, [%r21 + 0x01a9]
iob_intr_3_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_254), 16, 16)) -> intp(3, 0, 32)
	.word 0xf4754000  ! 2985: STX_R	stx	%r26, [%r21 + %r0]
	.word 0xba3d8000  ! 2988: XNOR_R	xnor 	%r22, %r0, %r29
iob_intr_3_255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_255), 16, 16)) -> intp(3, 0, 4)
cpu_intr_3_230:
	setx	0x340221, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_256), 16, 16)) -> intp(3, 0, 16)
	.word 0xf0f4a093  ! 2996: STXA_I	stxa	%r24, [%r18 + 0x0093] %asi
	ta	T_CHANGE_TO_TL0
	.word 0xfea5c020  ! 2998: STWA_R	stwa	%r31, [%r23 + %r0] 0x01
iob_intr_3_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_257), 16, 16)) -> intp(3, 0, 26)
	.word 0xf8b40020  ! 3003: STHA_R	stha	%r28, [%r16 + %r0] 0x01
	.word 0xfeac21a0  ! 3006: STBA_I	stba	%r31, [%r16 + 0x01a0] %asi
cpu_intr_3_231:
	setx	0x350311, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_232:
	setx	0x370118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc0d8000  ! 3013: AND_R	and 	%r22, %r0, %r30
	.word 0xf0740000  ! 3020: STX_R	stx	%r24, [%r16 + %r0]
	.word 0xf0f561a6  ! 3021: STXA_I	stxa	%r24, [%r21 + 0x01a6] %asi
	.word 0xf875c000  ! 3023: STX_R	stx	%r28, [%r23 + %r0]
	.word 0xf035a053  ! 3025: STH_I	sth	%r24, [%r22 + 0x0053]
cpu_intr_3_233:
	setx	0x350134, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_234:
	setx	0x350211, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
cpu_intr_3_235:
	setx	0x340139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf424e160  ! 3036: STW_I	stw	%r26, [%r19 + 0x0160]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfe250000  ! 3041: STW_R	stw	%r31, [%r20 + %r0]
cpu_intr_3_236:
	setx	0x37010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982d42  ! 3045: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d42, %hpstate
cpu_intr_3_237:
	setx	0x370309, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_133:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 3049: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T3_asi_reg_rd_134:
	mov	0x2, %r14
	.word 0xfedb89e0  ! 3050: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xfa250000  ! 3052: STW_R	stw	%r29, [%r20 + %r0]
cpu_intr_3_238:
	setx	0x360136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4350000  ! 3056: STH_R	sth	%r26, [%r20 + %r0]
	.word 0xf02c0000  ! 3060: STB_R	stb	%r24, [%r16 + %r0]
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_239:
	setx	0x340129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_240:
	setx	0x370337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc354000  ! 3067: STH_R	sth	%r30, [%r21 + %r0]
	.word 0xbf34e001  ! 3069: SRL_I	srl 	%r19, 0x0001, %r31
cpu_intr_3_241:
	setx	0x340012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea48020  ! 3072: STWA_R	stwa	%r31, [%r18 + %r0] 0x01
T3_asi_reg_wr_136:
	mov	0x19, %r14
	.word 0xfef38e40  ! 3073: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_3_258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_258), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_rd_135:
	mov	0x2, %r14
	.word 0xf8db8e80  ! 3078: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_3_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_259), 16, 16)) -> intp(3, 0, 33)
iob_intr_3_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_260), 16, 16)) -> intp(3, 0, 33)
	.word 0xf4b48020  ! 3083: STHA_R	stha	%r26, [%r18 + %r0] 0x01
	.word 0xfaa4a03c  ! 3084: STWA_I	stwa	%r29, [%r18 + 0x003c] %asi
cpu_intr_3_242:
	setx	0x360020, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_243:
	setx	0x34012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf024e1d6  ! 3089: STW_I	stw	%r24, [%r19 + 0x01d6]
iob_intr_3_261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_261), 16, 16)) -> intp(3, 0, 2e)
	.word 0xfaa40020  ! 3093: STWA_R	stwa	%r29, [%r16 + %r0] 0x01
T3_asi_reg_rd_136:
	mov	0x37, %r14
	.word 0xf6db84a0  ! 3094: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf2740000  ! 3096: STX_R	stx	%r25, [%r16 + %r0]
	.word 0xfcf5e15d  ! 3099: STXA_I	stxa	%r30, [%r23 + 0x015d] %asi
	.word 0xf234c000  ! 3100: STH_R	sth	%r25, [%r19 + %r0]
cpu_intr_3_244:
	setx	0x35002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba25e1a2  ! 3107: SUB_I	sub 	%r23, 0x01a2, %r29
T3_asi_reg_rd_137:
	mov	0x3c6, %r14
	.word 0xf6db8e60  ! 3109: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf8f4618e  ! 3110: STXA_I	stxa	%r28, [%r17 + 0x018e] %asi
T3_asi_reg_wr_137:
	mov	0x36, %r14
	.word 0xf0f384a0  ! 3113: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x8198298a  ! 3115: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098a, %hpstate
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
	.word 0xf0ad213f  ! 3124: STBA_I	stba	%r24, [%r20 + 0x013f] %asi
iob_intr_3_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_262), 16, 16)) -> intp(3, 0, 31)
iob_intr_3_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_263), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf4ac600b  ! 3129: STBA_I	stba	%r26, [%r17 + 0x000b] %asi
	.word 0xfa758000  ! 3130: STX_R	stx	%r29, [%r22 + %r0]
	.word 0xf8b5a16c  ! 3131: STHA_I	stha	%r28, [%r22 + 0x016c] %asi
	.word 0xf2a4a12b  ! 3134: STWA_I	stwa	%r25, [%r18 + 0x012b] %asi
T3_asi_reg_rd_138:
	mov	0x2f, %r14
	.word 0xfcdb8e40  ! 3136: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_264), 16, 16)) -> intp(3, 0, 15)
	.word 0xbe25c000  ! 3140: SUB_R	sub 	%r23, %r0, %r31
	.word 0xf2ade138  ! 3141: STBA_I	stba	%r25, [%r23 + 0x0138] %asi
	.word 0xf2ac0020  ! 3143: STBA_R	stba	%r25, [%r16 + %r0] 0x01
	.word 0xfab56142  ! 3147: STHA_I	stha	%r29, [%r21 + 0x0142] %asi
	.word 0xfcac8020  ! 3149: STBA_R	stba	%r30, [%r18 + %r0] 0x01
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982eda  ! 3151: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0eda, %hpstate
cpu_intr_3_245:
	setx	0x340031, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_139:
	mov	0x3c4, %r14
	.word 0xfedb8e40  ! 3153: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf434c000  ! 3154: STH_R	sth	%r26, [%r19 + %r0]
T3_asi_reg_wr_138:
	mov	0x8, %r14
	.word 0xf0f38e40  ! 3155: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
	.word 0xf6ade180  ! 3160: STBA_I	stba	%r27, [%r23 + 0x0180] %asi
cpu_intr_3_246:
	setx	0x35011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4950000  ! 3162: ORcc_R	orcc 	%r20, %r0, %r26
iob_intr_3_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_265), 16, 16)) -> intp(3, 0, 24)
	.word 0xf4ada036  ! 3168: STBA_I	stba	%r26, [%r22 + 0x0036] %asi
cpu_intr_3_247:
	setx	0x340109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5356001  ! 3171: SRL_I	srl 	%r21, 0x0001, %r26
T3_asi_reg_rd_140:
	mov	0x3c5, %r14
	.word 0xfcdb8e60  ! 3172: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf4a48020  ! 3173: STWA_R	stwa	%r26, [%r18 + %r0] 0x01
cpu_intr_3_248:
	setx	0x34031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62c4000  ! 3177: STB_R	stb	%r27, [%r17 + %r0]
iob_intr_3_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_266), 16, 16)) -> intp(3, 0, 35)
iob_intr_3_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_267), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_268), 16, 16)) -> intp(3, 0, 24)
	.word 0xf8b5a003  ! 3192: STHA_I	stha	%r28, [%r22 + 0x0003] %asi
	.word 0xf874e034  ! 3195: STX_I	stx	%r28, [%r19 + 0x0034]
	.word 0xf6f5610b  ! 3196: STXA_I	stxa	%r27, [%r21 + 0x010b] %asi
iob_intr_3_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_269), 16, 16)) -> intp(3, 0, 29)
cpu_intr_3_249:
	setx	0x340202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6258000  ! 3204: STW_R	stw	%r27, [%r22 + %r0]
	.word 0xfeace1f3  ! 3205: STBA_I	stba	%r31, [%r19 + 0x01f3] %asi
cpu_intr_3_250:
	setx	0x36020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b44000  ! 3208: SUBCcc_R	orncc 	%r17, %r0, %r27
	.word 0xfa35c000  ! 3209: STH_R	sth	%r29, [%r23 + %r0]
	.word 0xb6b5612a  ! 3210: ORNcc_I	orncc 	%r21, 0x012a, %r27
iob_intr_3_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_270), 16, 16)) -> intp(3, 0, 36)
T3_asi_reg_wr_139:
	mov	0x26, %r14
	.word 0xf8f389e0  ! 3214: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_3_271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_271), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf2250000  ! 3216: STW_R	stw	%r25, [%r20 + %r0]
T3_asi_reg_wr_140:
	mov	0x14, %r14
	.word 0xf8f38e80  ! 3217: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf2754000  ! 3220: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xfa35c000  ! 3221: STH_R	sth	%r29, [%r23 + %r0]
	.word 0xf42ce0af  ! 3223: STB_I	stb	%r26, [%r19 + 0x00af]
cpu_intr_3_251:
	setx	0x3a0237, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_272), 16, 16)) -> intp(3, 0, 1e)
iob_intr_3_273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_273), 16, 16)) -> intp(3, 0, 1f)
T3_asi_reg_wr_141:
	mov	0x23, %r14
	.word 0xf8f384a0  ! 3230: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_3_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_274), 16, 16)) -> intp(3, 0, d)
	.word 0xf0b5a0c5  ! 3234: STHA_I	stha	%r24, [%r22 + 0x00c5] %asi
	ta	T_CHANGE_HPRIV
iob_intr_3_275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_275), 16, 16)) -> intp(3, 0, c)
iob_intr_3_276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_276), 16, 16)) -> intp(3, 0, c)
T3_asi_reg_rd_141:
	mov	0x24, %r14
	.word 0xf2db8e80  ! 3239: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_3_252:
	setx	0x380330, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_253:
	setx	0x390330, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_142:
	mov	0x2b, %r14
	.word 0xf8f38e40  ! 3247: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_3_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_277), 16, 16)) -> intp(3, 0, 1f)
cpu_intr_3_254:
	setx	0x3a0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf2d0000  ! 3256: SLL_R	sll 	%r20, %r0, %r31
	.word 0xf2b48020  ! 3258: STHA_R	stha	%r25, [%r18 + %r0] 0x01
	.word 0xfaf561c5  ! 3259: STXA_I	stxa	%r29, [%r21 + 0x01c5] %asi
	.word 0x9195e0ab  ! 3260: WRPR_PIL_I	wrpr	%r23, 0x00ab, %pil
iob_intr_3_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_278), 16, 16)) -> intp(3, 0, 27)
	.word 0xf4ad4020  ! 3263: STBA_R	stba	%r26, [%r21 + %r0] 0x01
T3_asi_reg_wr_143:
	mov	0x3c8, %r14
	.word 0xfaf38e80  ! 3268: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbf350000  ! 3271: SRL_R	srl 	%r20, %r0, %r31
iob_intr_3_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_279), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf4b520a4  ! 3280: STHA_I	stha	%r26, [%r20 + 0x00a4] %asi
cpu_intr_3_255:
	setx	0x380321, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_144:
	mov	0xb, %r14
	.word 0xf6f384a0  ! 3283: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xfa75e0bf  ! 3284: STX_I	stx	%r29, [%r23 + 0x00bf]
iob_intr_3_280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_280), 16, 16)) -> intp(3, 0, 6)
	.word 0xf474e109  ! 3286: STX_I	stx	%r26, [%r19 + 0x0109]
	.word 0xbf343001  ! 3289: SRLX_I	srlx	%r16, 0x0001, %r31
T3_asi_reg_rd_142:
	mov	0xc, %r14
	.word 0xfedb8400  ! 3290: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb4440000  ! 3293: ADDC_R	addc 	%r16, %r0, %r26
iob_intr_3_281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_281), 16, 16)) -> intp(3, 0, 25)
cpu_intr_3_256:
	setx	0x390026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0948000  ! 3301: ORcc_R	orcc 	%r18, %r0, %r24
	.word 0xf4252187  ! 3302: STW_I	stw	%r26, [%r20 + 0x0187]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_145:
	mov	0x3c0, %r14
	.word 0xfaf389e0  ! 3305: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xfa240000  ! 3306: STW_R	stw	%r29, [%r16 + %r0]
	.word 0xf635c000  ! 3309: STH_R	sth	%r27, [%r23 + %r0]
T3_asi_reg_rd_143:
	mov	0x23, %r14
	.word 0xf4db8e60  ! 3312: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T3_asi_reg_rd_144:
	mov	0xe, %r14
	.word 0xfedb84a0  ! 3316: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T3_asi_reg_wr_146:
	mov	0xe, %r14
	.word 0xfaf38e40  ! 3319: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf03561e5  ! 3320: STH_I	sth	%r24, [%r21 + 0x01e5]
	.word 0xb13c8000  ! 3323: SRA_R	sra 	%r18, %r0, %r24
iob_intr_3_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_282), 16, 16)) -> intp(3, 0, 6)
	.word 0xbb2c7001  ! 3328: SLLX_I	sllx	%r17, 0x0001, %r29
	.word 0xf82c605c  ! 3330: STB_I	stb	%r28, [%r17 + 0x005c]
	.word 0xf0f4e1ca  ! 3331: STXA_I	stxa	%r24, [%r19 + 0x01ca] %asi
iob_intr_3_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_283), 16, 16)) -> intp(3, 0, 8)
	.word 0xf8b4605b  ! 3337: STHA_I	stha	%r28, [%r17 + 0x005b] %asi
T3_asi_reg_rd_145:
	mov	0x3c7, %r14
	.word 0xf2db84a0  ! 3338: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf034e163  ! 3340: STH_I	sth	%r24, [%r19 + 0x0163]
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_257:
	setx	0x3b0109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_284), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf4a56116  ! 3349: STWA_I	stwa	%r26, [%r21 + 0x0116] %asi
iob_intr_3_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_285), 16, 16)) -> intp(3, 0, 12)
	.word 0xfcaca19d  ! 3352: STBA_I	stba	%r30, [%r18 + 0x019d] %asi
	.word 0xf82c6070  ! 3354: STB_I	stb	%r28, [%r17 + 0x0070]
	.word 0xf674c000  ! 3357: STX_R	stx	%r27, [%r19 + %r0]
T3_asi_reg_rd_146:
	mov	0x30, %r14
	.word 0xf4db8e40  ! 3358: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_rd_147:
	mov	0x34, %r14
	.word 0xf4db84a0  ! 3360: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T3_asi_reg_rd_148:
	mov	0x37, %r14
	.word 0xf0db89e0  ! 3362: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb33ca001  ! 3364: SRA_I	sra 	%r18, 0x0001, %r25
iob_intr_3_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_286), 16, 16)) -> intp(3, 0, 13)
cpu_intr_3_258:
	setx	0x3b022d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_147:
	mov	0x27, %r14
	.word 0xf8f38e80  ! 3367: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf0acc020  ! 3370: STBA_R	stba	%r24, [%r19 + %r0] 0x01
T3_asi_reg_rd_149:
	mov	0x20, %r14
	.word 0xfcdb8e40  ! 3374: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	ta	T_CHANGE_TO_TL0
	.word 0xf024614b  ! 3376: STW_I	stw	%r24, [%r17 + 0x014b]
	.word 0xf2a54020  ! 3378: STWA_R	stwa	%r25, [%r21 + %r0] 0x01
T3_asi_reg_rd_150:
	mov	0x4, %r14
	.word 0xf4db8e80  ! 3380: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_3_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_287), 16, 16)) -> intp(3, 0, 25)
	.word 0xfcb48020  ! 3382: STHA_R	stha	%r30, [%r18 + %r0] 0x01
	.word 0xf475c000  ! 3384: STX_R	stx	%r26, [%r23 + %r0]
	.word 0xfc248000  ! 3386: STW_R	stw	%r30, [%r18 + %r0]
cpu_intr_3_259:
	setx	0x39012c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_151:
	mov	0x2a, %r14
	.word 0xfedb8e60  ! 3389: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf62d4000  ! 3391: STB_R	stb	%r27, [%r21 + %r0]
	ta	T_CHANGE_TO_TL1
	.word 0xb8a50000  ! 3395: SUBcc_R	subcc 	%r20, %r0, %r28
cpu_intr_3_260:
	setx	0x3b0006, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_288), 16, 16)) -> intp(3, 0, 24)
cpu_intr_3_261:
	setx	0x380127, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_148:
	mov	0xd, %r14
	.word 0xf0f38e40  ! 3405: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfc34a1e7  ! 3406: STH_I	sth	%r30, [%r18 + 0x01e7]
T3_asi_reg_wr_149:
	mov	0x1e, %r14
	.word 0xfcf38e40  ! 3407: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T3_asi_reg_rd_152:
	mov	0x15, %r14
	.word 0xf0db8e40  ! 3408: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_wr_150:
	mov	0x2d, %r14
	.word 0xf0f38e40  ! 3409: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf0244000  ! 3410: STW_R	stw	%r24, [%r17 + %r0]
T3_asi_reg_rd_153:
	mov	0x2e, %r14
	.word 0xfcdb8e40  ! 3412: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_wr_151:
	mov	0x0, %r14
	.word 0xf6f38e40  ! 3413: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_262:
	setx	0x3b0023, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_263:
	setx	0x3a0335, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfaace0a1  ! 3425: STBA_I	stba	%r29, [%r19 + 0x00a1] %asi
	.word 0xfc35c000  ! 3427: STH_R	sth	%r30, [%r23 + %r0]
	.word 0xfab4616e  ! 3429: STHA_I	stha	%r29, [%r17 + 0x016e] %asi
iob_intr_3_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_289), 16, 16)) -> intp(3, 0, 11)
	.word 0xf6252144  ! 3431: STW_I	stw	%r27, [%r20 + 0x0144]
cpu_intr_3_264:
	setx	0x380138, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_154:
	mov	0x28, %r14
	.word 0xf6db8e60  ! 3435: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_3_265:
	setx	0x39030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb4c020  ! 3439: STHA_R	stha	%r31, [%r19 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
	.word 0xfe752131  ! 3441: STX_I	stx	%r31, [%r20 + 0x0131]
	.word 0xf0a5a1c1  ! 3442: STWA_I	stwa	%r24, [%r22 + 0x01c1] %asi
iob_intr_3_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_290), 16, 16)) -> intp(3, 0, 19)
iob_intr_3_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_291), 16, 16)) -> intp(3, 0, 19)
cpu_intr_3_266:
	setx	0x3a0106, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_267:
	setx	0x3b033b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_268:
	setx	0x390328, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_152:
	mov	0x0, %r14
	.word 0xf0f38e80  ! 3455: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf8b5e0f4  ! 3456: STHA_I	stha	%r28, [%r23 + 0x00f4] %asi
	.word 0xf03560fc  ! 3457: STH_I	sth	%r24, [%r21 + 0x00fc]
iob_intr_3_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_292), 16, 16)) -> intp(3, 0, 2b)
iob_intr_3_293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_293), 16, 16)) -> intp(3, 0, 38)
cpu_intr_3_269:
	setx	0x380028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b5a189  ! 3466: STHA_I	stha	%r27, [%r22 + 0x0189] %asi
T3_asi_reg_rd_155:
	mov	0x1d, %r14
	.word 0xfedb84a0  ! 3467: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_3_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_294), 16, 16)) -> intp(3, 0, 27)
	.word 0xfca54020  ! 3475: STWA_R	stwa	%r30, [%r21 + %r0] 0x01
	.word 0xf0340000  ! 3477: STH_R	sth	%r24, [%r16 + %r0]
iob_intr_3_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_295), 16, 16)) -> intp(3, 0, 7)
iob_intr_3_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_296), 16, 16)) -> intp(3, 0, 21)
	.word 0xf2b4a0f0  ! 3483: STHA_I	stha	%r25, [%r18 + 0x00f0] %asi
T3_asi_reg_wr_153:
	mov	0x32, %r14
	.word 0xf0f38e80  ! 3484: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_156:
	mov	0x3c5, %r14
	.word 0xf4db84a0  ! 3492: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf2256151  ! 3494: STW_I	stw	%r25, [%r21 + 0x0151]
	.word 0xfab54020  ! 3497: STHA_R	stha	%r29, [%r21 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfead4020  ! 3502: STBA_R	stba	%r31, [%r21 + %r0] 0x01
	.word 0xba3521f8  ! 3503: SUBC_I	orn 	%r20, 0x01f8, %r29
T3_asi_reg_rd_157:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 3506: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_3_270:
	setx	0x390128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca50020  ! 3508: STWA_R	stwa	%r30, [%r20 + %r0] 0x01
	.word 0xba3c0000  ! 3509: XNOR_R	xnor 	%r16, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfcb44020  ! 3514: STHA_R	stha	%r30, [%r17 + %r0] 0x01
iob_intr_3_297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_297), 16, 16)) -> intp(3, 0, 4)
iob_intr_3_298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_298), 16, 16)) -> intp(3, 0, 28)
	.word 0xb2854000  ! 3523: ADDcc_R	addcc 	%r21, %r0, %r25
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982848  ! 3524: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0848, %hpstate
iob_intr_3_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_299), 16, 16)) -> intp(3, 0, 6)
	.word 0xf22d2090  ! 3528: STB_I	stb	%r25, [%r20 + 0x0090]
cpu_intr_3_271:
	setx	0x3b022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6adc020  ! 3531: STBA_R	stba	%r27, [%r23 + %r0] 0x01
	.word 0xfea42024  ! 3536: STWA_I	stwa	%r31, [%r16 + 0x0024] %asi
	.word 0xfe740000  ! 3537: STX_R	stx	%r31, [%r16 + %r0]
iob_intr_3_300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_300), 16, 16)) -> intp(3, 0, 1b)
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_158:
	mov	0x3c4, %r14
	.word 0xf8db84a0  ! 3551: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_3_301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_301), 16, 16)) -> intp(3, 0, 30)
	.word 0xbf35e001  ! 3557: SRL_I	srl 	%r23, 0x0001, %r31
cpu_intr_3_272:
	setx	0x380312, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_273:
	setx	0x3a0304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0344000  ! 3561: STH_R	sth	%r24, [%r17 + %r0]
	.word 0xf2a5e1e8  ! 3563: STWA_I	stwa	%r25, [%r23 + 0x01e8] %asi
	.word 0xfeada190  ! 3564: STBA_I	stba	%r31, [%r22 + 0x0190] %asi
	.word 0xf6354000  ! 3567: STH_R	sth	%r27, [%r21 + %r0]
	.word 0xf0ad2183  ! 3571: STBA_I	stba	%r24, [%r20 + 0x0183] %asi
	.word 0xf6b44020  ! 3575: STHA_R	stha	%r27, [%r17 + %r0] 0x01
	.word 0xf2b54020  ! 3576: STHA_R	stha	%r25, [%r21 + %r0] 0x01
	.word 0xf83561c8  ! 3577: STH_I	sth	%r28, [%r21 + 0x01c8]
iob_intr_3_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_302), 16, 16)) -> intp(3, 0, 31)
iob_intr_3_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_303), 16, 16)) -> intp(3, 0, 31)
	.word 0xfea40020  ! 3582: STWA_R	stwa	%r31, [%r16 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf8b44020  ! 3585: STHA_R	stha	%r28, [%r17 + %r0] 0x01
T3_asi_reg_wr_154:
	mov	0x9, %r14
	.word 0xf6f38e40  ! 3587: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_274:
	setx	0x3a0328, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_304), 16, 16)) -> intp(3, 0, 3e)
	.word 0xb8a4a1fc  ! 3591: SUBcc_I	subcc 	%r18, 0x01fc, %r28
	.word 0xf4ac0020  ! 3594: STBA_R	stba	%r26, [%r16 + %r0] 0x01
iob_intr_3_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_305), 16, 16)) -> intp(3, 0, 16)
cpu_intr_3_275:
	setx	0x390112, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_306), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf2ad8020  ! 3600: STBA_R	stba	%r25, [%r22 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
iob_intr_3_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_307), 16, 16)) -> intp(3, 0, 20)
cpu_intr_3_276:
	setx	0x3b0310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b4613c  ! 3607: STHA_I	stha	%r25, [%r17 + 0x013c] %asi
	.word 0xbcb5c000  ! 3608: SUBCcc_R	orncc 	%r23, %r0, %r30
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_159:
	mov	0x5, %r14
	.word 0xf2db84a0  ! 3612: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xfe350000  ! 3614: STH_R	sth	%r31, [%r20 + %r0]
cpu_intr_3_277:
	setx	0x39003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcad61e4  ! 3616: STBA_I	stba	%r30, [%r21 + 0x01e4] %asi
iob_intr_3_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_308), 16, 16)) -> intp(3, 0, 33)
cpu_intr_3_278:
	setx	0x380125, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_279:
	setx	0x3a0317, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_309), 16, 16)) -> intp(3, 0, 34)
	.word 0xb61c0000  ! 3622: XOR_R	xor 	%r16, %r0, %r27
	.word 0xf0b48020  ! 3624: STHA_R	stha	%r24, [%r18 + %r0] 0x01
	.word 0xb414e076  ! 3625: OR_I	or 	%r19, 0x0076, %r26
cpu_intr_3_280:
	setx	0x39011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2344000  ! 3628: ORN_R	orn 	%r17, %r0, %r25
	.word 0xb52cc000  ! 3629: SLL_R	sll 	%r19, %r0, %r26
	.word 0xf22c8000  ! 3630: STB_R	stb	%r25, [%r18 + %r0]
	.word 0xf075e1ea  ! 3631: STX_I	stx	%r24, [%r23 + 0x01ea]
iob_intr_3_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_310), 16, 16)) -> intp(3, 0, 38)
iob_intr_3_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_311), 16, 16)) -> intp(3, 0, 16)
T3_asi_reg_rd_160:
	mov	0x34, %r14
	.word 0xf0db8400  ! 3634: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_3_281:
	setx	0x380134, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_312), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_282:
	setx	0x3a020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe05a176  ! 3639: ADD_I	add 	%r22, 0x0176, %r31
	.word 0xf4a48020  ! 3640: STWA_R	stwa	%r26, [%r18 + %r0] 0x01
cpu_intr_3_283:
	setx	0x3a010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_284:
	setx	0x380334, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_313), 16, 16)) -> intp(3, 0, 6)
T3_asi_reg_rd_161:
	mov	0x2a, %r14
	.word 0xf0db8400  ! 3650: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb97d4400  ! 3651: MOVR_R	movre	%r21, %r0, %r28
cpu_intr_3_285:
	setx	0x3b002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2350000  ! 3657: STH_R	sth	%r25, [%r20 + %r0]
iob_intr_3_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_314), 16, 16)) -> intp(3, 0, 5)
cpu_intr_3_286:
	setx	0x380023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b4605c  ! 3660: STHA_I	stha	%r28, [%r17 + 0x005c] %asi
	ta	T_CHANGE_TO_TL0
	.word 0xbab5e0ca  ! 3663: SUBCcc_I	orncc 	%r23, 0x00ca, %r29
T3_asi_reg_wr_155:
	mov	0x2f, %r14
	.word 0xf4f384a0  ! 3664: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xfc344000  ! 3668: STH_R	sth	%r30, [%r17 + %r0]
	ta	T_CHANGE_NONHPRIV
	.word 0xf624c000  ! 3670: STW_R	stw	%r27, [%r19 + %r0]
T3_asi_reg_rd_162:
	mov	0x3c8, %r14
	.word 0xfcdb8e40  ! 3671: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfc754000  ! 3673: STX_R	stx	%r30, [%r21 + %r0]
	.word 0xf0b50020  ! 3674: STHA_R	stha	%r24, [%r20 + %r0] 0x01
	.word 0xf27560dd  ! 3676: STX_I	stx	%r25, [%r21 + 0x00dd]
T3_asi_reg_rd_163:
	mov	0x3c0, %r14
	.word 0xf2db84a0  ! 3677: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T3_asi_reg_wr_156:
	mov	0x3c0, %r14
	.word 0xf2f38e80  ! 3680: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf8348000  ! 3681: STH_R	sth	%r28, [%r18 + %r0]
	.word 0xf475e08c  ! 3683: STX_I	stx	%r26, [%r23 + 0x008c]
T3_asi_reg_wr_157:
	mov	0x3c3, %r14
	.word 0xf8f389e0  ! 3686: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_3_315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_315), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_wr_158:
	mov	0x3c7, %r14
	.word 0xf2f38400  ! 3690: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_3_316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_316), 16, 16)) -> intp(3, 0, 22)
	.word 0xf4740000  ! 3696: STX_R	stx	%r26, [%r16 + %r0]
cpu_intr_3_287:
	setx	0x3e0334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2250000  ! 3698: STW_R	stw	%r25, [%r20 + %r0]
T3_asi_reg_wr_159:
	mov	0x14, %r14
	.word 0xf6f38e40  ! 3699: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf6ad2023  ! 3701: STBA_I	stba	%r27, [%r20 + 0x0023] %asi
	.word 0xfeac4020  ! 3704: STBA_R	stba	%r31, [%r17 + %r0] 0x01
cpu_intr_3_288:
	setx	0x3d0005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4342122  ! 3706: SUBC_I	orn 	%r16, 0x0122, %r26
cpu_intr_3_289:
	setx	0x3f0304, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_290:
	setx	0x3f032b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_160:
	mov	0x3c0, %r14
	.word 0xf6f38e60  ! 3711: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf0f42016  ! 3715: STXA_I	stxa	%r24, [%r16 + 0x0016] %asi
cpu_intr_3_291:
	setx	0x3e022a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_292:
	setx	0x3f0315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ac8020  ! 3721: STBA_R	stba	%r26, [%r18 + %r0] 0x01
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983952  ! 3722: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1952, %hpstate
	.word 0xf8248000  ! 3723: STW_R	stw	%r28, [%r18 + %r0]
iob_intr_3_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_317), 16, 16)) -> intp(3, 0, 1c)
iob_intr_3_318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_318), 16, 16)) -> intp(3, 0, 15)
	.word 0xb62d4000  ! 3730: ANDN_R	andn 	%r21, %r0, %r27
	.word 0xf8b46071  ! 3731: STHA_I	stha	%r28, [%r17 + 0x0071] %asi
iob_intr_3_319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_319), 16, 16)) -> intp(3, 0, 38)
	.word 0xfe250000  ! 3733: STW_R	stw	%r31, [%r20 + %r0]
	ta	T_CHANGE_NONHPRIV
	.word 0xf2b40020  ! 3737: STHA_R	stha	%r25, [%r16 + %r0] 0x01
cpu_intr_3_293:
	setx	0x3c021d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_294:
	setx	0x3d0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982a1a  ! 3748: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1a, %hpstate
iob_intr_3_320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_320), 16, 16)) -> intp(3, 0, 1d)
T3_asi_reg_wr_161:
	mov	0x3c6, %r14
	.word 0xfef384a0  ! 3750: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_3_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_321), 16, 16)) -> intp(3, 0, 6)
	.word 0x89956079  ! 3752: WRPR_TICK_I	wrpr	%r21, 0x0079, %tick
T3_asi_reg_wr_162:
	mov	0x3c2, %r14
	.word 0xf4f38e80  ! 3753: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf4758000  ! 3754: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xb4342116  ! 3755: SUBC_I	orn 	%r16, 0x0116, %r26
T3_asi_reg_rd_164:
	mov	0x23, %r14
	.word 0xf6db8e60  ! 3756: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_3_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_322), 16, 16)) -> intp(3, 0, 7)
	ta	T_CHANGE_TO_TL1
	.word 0xf0b42108  ! 3764: STHA_I	stha	%r24, [%r16 + 0x0108] %asi
cpu_intr_3_295:
	setx	0x3d0105, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_163:
	mov	0x19, %r14
	.word 0xf2f38e40  ! 3768: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_3_296:
	setx	0x3c0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf674c000  ! 3770: STX_R	stx	%r27, [%r19 + %r0]
	.word 0xfeb5a024  ! 3772: STHA_I	stha	%r31, [%r22 + 0x0024] %asi
	.word 0xf6252184  ! 3774: STW_I	stw	%r27, [%r20 + 0x0184]
T3_asi_reg_wr_164:
	mov	0x32, %r14
	.word 0xfaf38400  ! 3778: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T3_asi_reg_rd_165:
	mov	0x17, %r14
	.word 0xf8db8e80  ! 3782: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T3_asi_reg_rd_166:
	mov	0x11, %r14
	.word 0xf6db8e80  ! 3785: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_3_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_323), 16, 16)) -> intp(3, 0, b)
cpu_intr_3_297:
	setx	0x3f033c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_167:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 3790: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_324), 16, 16)) -> intp(3, 0, 1e)
cpu_intr_3_298:
	setx	0x3e021b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_168:
	mov	0x3c4, %r14
	.word 0xf0db84a0  ! 3797: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	ta	T_CHANGE_NONHPRIV
	.word 0xf6b5211d  ! 3801: STHA_I	stha	%r27, [%r20 + 0x011d] %asi
iob_intr_3_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_325), 16, 16)) -> intp(3, 0, 2)
T3_asi_reg_wr_165:
	mov	0x32, %r14
	.word 0xfef38e60  ! 3804: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf6748000  ! 3807: STX_R	stx	%r27, [%r18 + %r0]
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_169:
	mov	0x3c4, %r14
	.word 0xf4db84a0  ! 3812: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_3_299:
	setx	0x3c0231, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_166:
	mov	0x32, %r14
	.word 0xf2f389e0  ! 3814: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_3_300:
	setx	0x3c0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc250000  ! 3824: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xf0f42194  ! 3825: STXA_I	stxa	%r24, [%r16 + 0x0194] %asi
T3_asi_reg_wr_167:
	mov	0x26, %r14
	.word 0xf6f38e40  ! 3826: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf2ac8020  ! 3828: STBA_R	stba	%r25, [%r18 + %r0] 0x01
iob_intr_3_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_326), 16, 16)) -> intp(3, 0, 2b)
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982cd2  ! 3836: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd2, %hpstate
iob_intr_3_327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_327), 16, 16)) -> intp(3, 0, 38)
	.word 0xf6246193  ! 3841: STW_I	stw	%r27, [%r17 + 0x0193]
	.word 0xba350000  ! 3842: ORN_R	orn 	%r20, %r0, %r29
	.word 0xbcc4e0be  ! 3843: ADDCcc_I	addccc 	%r19, 0x00be, %r30
	.word 0xf4256088  ! 3846: STW_I	stw	%r26, [%r21 + 0x0088]
T3_asi_reg_rd_170:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 3847: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf6358000  ! 3848: STH_R	sth	%r27, [%r22 + %r0]
T3_asi_reg_wr_168:
	mov	0x10, %r14
	.word 0xf2f384a0  ! 3849: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_3_301:
	setx	0x3e0300, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_328), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf475a161  ! 3858: STX_I	stx	%r26, [%r22 + 0x0161]
iob_intr_3_329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_329), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf6352014  ! 3864: STH_I	sth	%r27, [%r20 + 0x0014]
iob_intr_3_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_330), 16, 16)) -> intp(3, 0, 15)
iob_intr_3_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_331), 16, 16)) -> intp(3, 0, 2b)
	.word 0xfc740000  ! 3868: STX_R	stx	%r30, [%r16 + %r0]
iob_intr_3_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_332), 16, 16)) -> intp(3, 0, 12)
	.word 0xf2a5a085  ! 3873: STWA_I	stwa	%r25, [%r22 + 0x0085] %asi
	.word 0xf6748000  ! 3877: STX_R	stx	%r27, [%r18 + %r0]
	.word 0xfaac603b  ! 3879: STBA_I	stba	%r29, [%r17 + 0x003b] %asi
	.word 0xfa24c000  ! 3882: STW_R	stw	%r29, [%r19 + %r0]
T3_asi_reg_wr_169:
	mov	0x20, %r14
	.word 0xf8f38400  ! 3883: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T3_asi_reg_wr_170:
	mov	0x3c4, %r14
	.word 0xfef389e0  ! 3887: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T3_asi_reg_wr_171:
	mov	0x3c4, %r14
	.word 0xf4f384a0  ! 3888: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_3_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_333), 16, 16)) -> intp(3, 0, 23)
cpu_intr_3_302:
	setx	0x3c020d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_334), 16, 16)) -> intp(3, 0, c)
iob_intr_3_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_335), 16, 16)) -> intp(3, 0, 0)
	.word 0xb9358000  ! 3894: SRL_R	srl 	%r22, %r0, %r28
T3_asi_reg_rd_171:
	mov	0x3c3, %r14
	.word 0xf4db8e40  ! 3896: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_336), 16, 16)) -> intp(3, 0, 3b)
T3_asi_reg_wr_172:
	mov	0x2b, %r14
	.word 0xf8f38e40  ! 3904: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf0240000  ! 3910: STW_R	stw	%r24, [%r16 + %r0]
T3_asi_reg_wr_173:
	mov	0x27, %r14
	.word 0xfcf389e0  ! 3915: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf8758000  ! 3916: STX_R	stx	%r28, [%r22 + %r0]
iob_intr_3_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_337), 16, 16)) -> intp(3, 0, 21)
	.word 0xb414a14c  ! 3921: OR_I	or 	%r18, 0x014c, %r26
	.word 0xb53d7001  ! 3922: SRAX_I	srax	%r21, 0x0001, %r26
	.word 0xb73d3001  ! 3925: SRAX_I	srax	%r20, 0x0001, %r27
T3_asi_reg_wr_174:
	mov	0x3c2, %r14
	.word 0xf8f38e80  ! 3927: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xfa354000  ! 3928: STH_R	sth	%r29, [%r21 + %r0]
cpu_intr_3_303:
	setx	0x3c031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62d4000  ! 3930: STB_R	stb	%r27, [%r21 + %r0]
T3_asi_reg_wr_175:
	mov	0x20, %r14
	.word 0xfef38e40  ! 3933: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf2acc020  ! 3934: STBA_R	stba	%r25, [%r19 + %r0] 0x01
T3_asi_reg_wr_176:
	mov	0x3c6, %r14
	.word 0xf4f384a0  ! 3937: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_3_304:
	setx	0x3d011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf2744000  ! 3945: STX_R	stx	%r25, [%r17 + %r0]
iob_intr_3_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_338), 16, 16)) -> intp(3, 0, 3)
	.word 0xfab54020  ! 3949: STHA_R	stha	%r29, [%r21 + %r0] 0x01
iob_intr_3_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_339), 16, 16)) -> intp(3, 0, d)
cpu_intr_3_305:
	setx	0x3d0223, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_340), 16, 16)) -> intp(3, 0, 2d)
	.word 0xbe448000  ! 3956: ADDC_R	addc 	%r18, %r0, %r31
cpu_intr_3_306:
	setx	0x3f011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb244a068  ! 3960: ADDC_I	addc 	%r18, 0x0068, %r25
	.word 0xfcf4e168  ! 3961: STXA_I	stxa	%r30, [%r19 + 0x0168] %asi
iob_intr_3_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_341), 16, 16)) -> intp(3, 0, 22)
iob_intr_3_342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_342), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_rd_172:
	mov	0x8, %r14
	.word 0xfcdb89e0  ! 3967: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_3_343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_343), 16, 16)) -> intp(3, 0, b)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf2ada09c  ! 3981: STBA_I	stba	%r25, [%r22 + 0x009c] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfeb561f5  ! 3985: STHA_I	stha	%r31, [%r21 + 0x01f5] %asi
	ta	T_CHANGE_HPRIV
iob_intr_3_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_344), 16, 16)) -> intp(3, 0, 5)
T3_asi_reg_rd_173:
	mov	0x6, %r14
	.word 0xfadb8400  ! 3991: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_3_307:
	setx	0x3e0313, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_174:
	mov	0x3c1, %r14
	.word 0xf4db8e80  ! 4000: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T3_asi_reg_wr_177:
	mov	0x20, %r14
	.word 0xf6f38e80  ! 4001: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_3_308:
	setx	0x3c0328, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_178:
	mov	0x3c8, %r14
	.word 0xf4f38e40  ! 4005: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T3_asi_reg_rd_175:
	mov	0x38, %r14
	.word 0xf8db8e40  ! 4006: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_345), 16, 16)) -> intp(3, 0, 3)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983812  ! 4012: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1812, %hpstate
	.word 0xfe258000  ! 4017: STW_R	stw	%r31, [%r22 + %r0]
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_179:
	mov	0x1d, %r14
	.word 0xf6f38e40  ! 4021: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_rd_176:
	mov	0xd, %r14
	.word 0xf0db89e0  ! 4022: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf22561e8  ! 4023: STW_I	stw	%r25, [%r21 + 0x01e8]
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x8198290a  ! 4025: WRHPR_HPSTATE_I	wrhpr	%r0, 0x090a, %hpstate
T3_asi_reg_rd_177:
	mov	0x18, %r14
	.word 0xf0db8e60  ! 4026: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T3_asi_reg_wr_180:
	mov	0x28, %r14
	.word 0xf0f38e80  ! 4028: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb534f001  ! 4029: SRLX_I	srlx	%r19, 0x0001, %r26
	.word 0xf635a16d  ! 4034: STH_I	sth	%r27, [%r22 + 0x016d]
	.word 0xf83461ef  ! 4035: STH_I	sth	%r28, [%r17 + 0x01ef]
	.word 0xf02d4000  ! 4036: STB_R	stb	%r24, [%r21 + %r0]
T3_asi_reg_wr_181:
	mov	0x3c6, %r14
	.word 0xfcf38e80  ! 4038: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb12dd000  ! 4042: SLLX_R	sllx	%r23, %r0, %r24
T3_asi_reg_rd_178:
	mov	0x0, %r14
	.word 0xf8db89e0  ! 4044: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T3_asi_reg_rd_179:
	mov	0x1a, %r14
	.word 0xf8db8e80  ! 4045: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf2ad4020  ! 4046: STBA_R	stba	%r25, [%r21 + %r0] 0x01
	.word 0xfaa420b8  ! 4053: STWA_I	stwa	%r29, [%r16 + 0x00b8] %asi
	.word 0xf6348000  ! 4054: STH_R	sth	%r27, [%r18 + %r0]
cpu_intr_3_309:
	setx	0x3f012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982b92  ! 4062: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b92, %hpstate
iob_intr_3_346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_346), 16, 16)) -> intp(3, 0, 3f)
iob_intr_3_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_347), 16, 16)) -> intp(3, 0, 5)
	.word 0x819520ed  ! 4073: WRPR_TPC_I	wrpr	%r20, 0x00ed, %tpc
	.word 0xf2f461a9  ! 4074: STXA_I	stxa	%r25, [%r17 + 0x01a9] %asi
	.word 0xb2ad21e3  ! 4075: ANDNcc_I	andncc 	%r20, 0x01e3, %r25
iob_intr_3_348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_348), 16, 16)) -> intp(3, 0, 9)
cpu_intr_3_310:
	setx	0x3c0329, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_349), 16, 16)) -> intp(3, 0, 7)
	.word 0xf27420a1  ! 4080: STX_I	stx	%r25, [%r16 + 0x00a1]
	.word 0xf0240000  ! 4081: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xb405c000  ! 4082: ADD_R	add 	%r23, %r0, %r26
cpu_intr_3_311:
	setx	0x3e0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
cpu_intr_3_312:
	setx	0x3f0034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc342131  ! 4095: STH_I	sth	%r30, [%r16 + 0x0131]
cpu_intr_3_313:
	setx	0x3f020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_180:
	mov	0x11, %r14
	.word 0xfcdb8400  ! 4097: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T3_asi_reg_rd_181:
	mov	0x32, %r14
	.word 0xf4db89e0  ! 4100: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf22ca17f  ! 4101: STB_I	stb	%r25, [%r18 + 0x017f]
T3_asi_reg_wr_182:
	mov	0x3c7, %r14
	.word 0xfef38400  ! 4104: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_3_314:
	setx	0x3d022d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_350), 16, 16)) -> intp(3, 0, 15)
T3_asi_reg_wr_183:
	mov	0x3c3, %r14
	.word 0xf8f38e40  ! 4120: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T3_asi_reg_rd_182:
	mov	0x18, %r14
	.word 0xfedb8e60  ! 4121: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T3_asi_reg_rd_183:
	mov	0x19, %r14
	.word 0xf0db8e40  ! 4124: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_3_315:
	setx	0x43002c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_184:
	mov	0x3c1, %r14
	.word 0xfef38400  ! 4127: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T3_asi_reg_rd_184:
	mov	0xa, %r14
	.word 0xf0db8400  ! 4131: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xfe758000  ! 4132: STX_R	stx	%r31, [%r22 + %r0]
	.word 0xb2356080  ! 4133: SUBC_I	orn 	%r21, 0x0080, %r25
	.word 0xb2b4c000  ! 4134: ORNcc_R	orncc 	%r19, %r0, %r25
	.word 0xf6ad8020  ! 4139: STBA_R	stba	%r27, [%r22 + %r0] 0x01
	.word 0xfc74c000  ! 4140: STX_R	stx	%r30, [%r19 + %r0]
cpu_intr_3_316:
	setx	0x42030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2d4000  ! 4142: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xfc35e16d  ! 4143: STH_I	sth	%r30, [%r23 + 0x016d]
	ta	T_CHANGE_NONHPRIV
	.word 0xb4b5c000  ! 4149: ORNcc_R	orncc 	%r23, %r0, %r26
	.word 0xf6258000  ! 4150: STW_R	stw	%r27, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf2358000  ! 4157: STH_R	sth	%r25, [%r22 + %r0]
	.word 0xf825e162  ! 4159: STW_I	stw	%r28, [%r23 + 0x0162]
cpu_intr_3_317:
	setx	0x410227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfef5613c  ! 4162: STXA_I	stxa	%r31, [%r21 + 0x013c] %asi
cpu_intr_3_318:
	setx	0x41012d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_351), 16, 16)) -> intp(3, 0, 1a)
T3_asi_reg_rd_185:
	mov	0x3c2, %r14
	.word 0xfadb89e0  ! 4166: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T3_asi_reg_wr_185:
	mov	0x37, %r14
	.word 0xf0f38400  ! 4167: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf6a5a00f  ! 4173: STWA_I	stwa	%r27, [%r22 + 0x000f] %asi
	.word 0xf02ca131  ! 4176: STB_I	stb	%r24, [%r18 + 0x0131]
	.word 0xf62da0dc  ! 4177: STB_I	stb	%r27, [%r22 + 0x00dc]
cpu_intr_3_319:
	setx	0x420308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc7520d2  ! 4179: STX_I	stx	%r30, [%r20 + 0x00d2]
	.word 0xfc758000  ! 4180: STX_R	stx	%r30, [%r22 + %r0]
T3_asi_reg_wr_186:
	mov	0x2f, %r14
	.word 0xfaf389e0  ! 4181: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983d0a  ! 4183: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d0a, %hpstate
T3_asi_reg_wr_187:
	mov	0x3c2, %r14
	.word 0xf8f384a0  ! 4184: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xfc74a126  ! 4187: STX_I	stx	%r30, [%r18 + 0x0126]
T3_asi_reg_wr_188:
	mov	0x3c1, %r14
	.word 0xf6f38400  ! 4188: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf23420e7  ! 4189: STH_I	sth	%r25, [%r16 + 0x00e7]
T3_asi_reg_wr_189:
	mov	0x3, %r14
	.word 0xfaf389e0  ! 4192: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_3_352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_352), 16, 16)) -> intp(3, 0, 3f)
	.word 0xb01d6069  ! 4202: XOR_I	xor 	%r21, 0x0069, %r24
	ta	T_CHANGE_TO_TL0
	.word 0xf62561bf  ! 4206: STW_I	stw	%r27, [%r21 + 0x01bf]
cpu_intr_3_320:
	setx	0x420024, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_190:
	mov	0x3c5, %r14
	.word 0xf6f38e60  ! 4209: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_3_353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_353), 16, 16)) -> intp(3, 0, a)
	.word 0xb23d4000  ! 4211: XNOR_R	xnor 	%r21, %r0, %r25
	.word 0xb9350000  ! 4213: SRL_R	srl 	%r20, %r0, %r28
	.word 0xfe748000  ! 4216: STX_R	stx	%r31, [%r18 + %r0]
	.word 0xfeace1f5  ! 4217: STBA_I	stba	%r31, [%r19 + 0x01f5] %asi
cpu_intr_3_321:
	setx	0x420021, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_191:
	mov	0x27, %r14
	.word 0xf6f38e60  ! 4219: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T3_asi_reg_rd_186:
	mov	0x21, %r14
	.word 0xf0db84a0  ! 4221: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xfca4a039  ! 4222: STWA_I	stwa	%r30, [%r18 + 0x0039] %asi
	.word 0xf4a5e00b  ! 4224: STWA_I	stwa	%r26, [%r23 + 0x000b] %asi
iob_intr_3_354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_354), 16, 16)) -> intp(3, 0, 1b)
	.word 0xfa35c000  ! 4226: STH_R	sth	%r29, [%r23 + %r0]
iob_intr_3_355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_355), 16, 16)) -> intp(3, 0, 3)
cpu_intr_3_322:
	setx	0x400013, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_323:
	setx	0x410035, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_356), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_rd_187:
	mov	0x3c3, %r14
	.word 0xfcdb8400  ! 4236: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf4ad8020  ! 4239: STBA_R	stba	%r26, [%r22 + %r0] 0x01
	.word 0xf2ad61cc  ! 4241: STBA_I	stba	%r25, [%r21 + 0x01cc] %asi
	.word 0xfa74e06a  ! 4242: STX_I	stx	%r29, [%r19 + 0x006a]
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982f0a  ! 4243: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0a, %hpstate
T3_asi_reg_rd_188:
	mov	0x11, %r14
	.word 0xfedb8e40  ! 4248: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf62dc000  ! 4250: STB_R	stb	%r27, [%r23 + %r0]
iob_intr_3_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_357), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf4a461dd  ! 4254: STWA_I	stwa	%r26, [%r17 + 0x01dd] %asi
	.word 0xbd345000  ! 4256: SRLX_R	srlx	%r17, %r0, %r30
cpu_intr_3_324:
	setx	0x410022, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfa25a1e0  ! 4262: STW_I	stw	%r29, [%r22 + 0x01e0]
iob_intr_3_358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_358), 16, 16)) -> intp(3, 0, a)
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_192:
	mov	0x35, %r14
	.word 0xf4f384a0  ! 4266: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_3_359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_359), 16, 16)) -> intp(3, 0, 3e)
cpu_intr_3_325:
	setx	0x40013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeadc020  ! 4272: STBA_R	stba	%r31, [%r23 + %r0] 0x01
	.word 0xfe742152  ! 4273: STX_I	stx	%r31, [%r16 + 0x0152]
	.word 0xb77d0400  ! 4274: MOVR_R	movre	%r20, %r0, %r27
T3_asi_reg_rd_189:
	mov	0x31, %r14
	.word 0xfedb8e40  ! 4276: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_326:
	setx	0x43002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf643801  ! 4279: MOVcc_I	<illegal instruction>
	.word 0xfa34a045  ! 4281: STH_I	sth	%r29, [%r18 + 0x0045]
cpu_intr_3_327:
	setx	0x42023e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_328:
	setx	0x420003, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_360), 16, 16)) -> intp(3, 0, 16)
	.word 0xfcadc020  ! 4287: STBA_R	stba	%r30, [%r23 + %r0] 0x01
	.word 0xbb2de001  ! 4295: SLL_I	sll 	%r23, 0x0001, %r29
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_329:
	setx	0x400309, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_3_361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_361), 16, 16)) -> intp(3, 0, 34)
T3_asi_reg_rd_190:
	mov	0x3c7, %r14
	.word 0xfadb8e40  ! 4304: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf4ad21d4  ! 4306: STBA_I	stba	%r26, [%r20 + 0x01d4] %asi
T3_asi_reg_rd_191:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 4307: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_3_362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_362), 16, 16)) -> intp(3, 0, a)
	ta	T_CHANGE_NONHPRIV
	.word 0xf474e1b9  ! 4313: STX_I	stx	%r26, [%r19 + 0x01b9]
iob_intr_3_363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_363), 16, 16)) -> intp(3, 0, 22)
	.word 0xfaf4a101  ! 4317: STXA_I	stxa	%r29, [%r18 + 0x0101] %asi
	.word 0xb0056101  ! 4318: ADD_I	add 	%r21, 0x0101, %r24
T3_asi_reg_wr_193:
	mov	0x0, %r14
	.word 0xfaf38e80  ! 4319: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf2258000  ! 4321: STW_R	stw	%r25, [%r22 + %r0]
	.word 0xf425e05b  ! 4322: STW_I	stw	%r26, [%r23 + 0x005b]
T3_asi_reg_wr_194:
	mov	0x2f, %r14
	.word 0xf4f38e80  ! 4324: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xfe354000  ! 4325: STH_R	sth	%r31, [%r21 + %r0]
	.word 0xb09c4000  ! 4327: XORcc_R	xorcc 	%r17, %r0, %r24
	.word 0xf4358000  ! 4328: STH_R	sth	%r26, [%r22 + %r0]
iob_intr_3_364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_364), 16, 16)) -> intp(3, 0, 13)
T3_asi_reg_wr_195:
	mov	0x8, %r14
	.word 0xf8f38e40  ! 4332: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_3_330:
	setx	0x420104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa54020  ! 4338: STWA_R	stwa	%r29, [%r21 + %r0] 0x01
	.word 0xfcb561c1  ! 4339: STHA_I	stha	%r30, [%r21 + 0x01c1] %asi
cpu_intr_3_331:
	setx	0x40020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea461c2  ! 4342: STWA_I	stwa	%r31, [%r17 + 0x01c2] %asi
cpu_intr_3_332:
	setx	0x400211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0344000  ! 4345: ORN_R	orn 	%r17, %r0, %r24
	.word 0xfab4a044  ! 4347: STHA_I	stha	%r29, [%r18 + 0x0044] %asi
cpu_intr_3_333:
	setx	0x420039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb634a1a0  ! 4350: SUBC_I	orn 	%r18, 0x01a0, %r27
	.word 0xf6b40020  ! 4351: STHA_R	stha	%r27, [%r16 + %r0] 0x01
iob_intr_3_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_365), 16, 16)) -> intp(3, 0, 5)
cpu_intr_3_334:
	setx	0x430331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb551c000  ! 4360: RDPR_TL	rdpr	%tl, %r26
	.word 0xfab40020  ! 4361: STHA_R	stha	%r29, [%r16 + %r0] 0x01
cpu_intr_3_335:
	setx	0x400116, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_196:
	mov	0x2e, %r14
	.word 0xf6f389e0  ! 4365: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T3_asi_reg_rd_192:
	mov	0x7, %r14
	.word 0xfcdb8400  ! 4366: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_3_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_366), 16, 16)) -> intp(3, 0, 1f)
cpu_intr_3_336:
	setx	0x420014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcf4e1f7  ! 4369: STXA_I	stxa	%r30, [%r19 + 0x01f7] %asi
	ta	T_CHANGE_TO_TL0
cpu_intr_3_337:
	setx	0x430118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc750000  ! 4373: STX_R	stx	%r30, [%r20 + %r0]
iob_intr_3_367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_367), 16, 16)) -> intp(3, 0, 1)
	.word 0xf2ad4020  ! 4380: STBA_R	stba	%r25, [%r21 + %r0] 0x01
T3_asi_reg_rd_193:
	mov	0x3c6, %r14
	.word 0xf4db8400  ! 4381: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf824a14f  ! 4382: STW_I	stw	%r28, [%r18 + 0x014f]
	.word 0xb1340000  ! 4384: SRL_R	srl 	%r16, %r0, %r24
	.word 0xf2342195  ! 4385: STH_I	sth	%r25, [%r16 + 0x0195]
	.word 0xb495a0f3  ! 4386: ORcc_I	orcc 	%r22, 0x00f3, %r26
	.word 0xf025a185  ! 4387: STW_I	stw	%r24, [%r22 + 0x0185]
	.word 0xf035a075  ! 4388: STH_I	sth	%r24, [%r22 + 0x0075]
cpu_intr_3_338:
	setx	0x410225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0acc020  ! 4392: STBA_R	stba	%r24, [%r19 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	.word 0xfaad6056  ! 4396: STBA_I	stba	%r29, [%r21 + 0x0056] %asi
	.word 0xba84a09b  ! 4397: ADDcc_I	addcc 	%r18, 0x009b, %r29
	.word 0xf674a1ab  ! 4398: STX_I	stx	%r27, [%r18 + 0x01ab]
cpu_intr_3_339:
	setx	0x43020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf024601f  ! 4400: STW_I	stw	%r24, [%r17 + 0x001f]
	.word 0xba344000  ! 4401: ORN_R	orn 	%r17, %r0, %r29
	.word 0xba3d21b4  ! 4404: XNOR_I	xnor 	%r20, 0x01b4, %r29
	.word 0xfef4e164  ! 4405: STXA_I	stxa	%r31, [%r19 + 0x0164] %asi
	.word 0xf2b50020  ! 4406: STHA_R	stha	%r25, [%r20 + %r0] 0x01
	.word 0xfe7520a3  ! 4407: STX_I	stx	%r31, [%r20 + 0x00a3]
iob_intr_3_368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_368), 16, 16)) -> intp(3, 0, 16)
iob_intr_3_369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_369), 16, 16)) -> intp(3, 0, 33)
T3_asi_reg_wr_197:
	mov	0x8, %r14
	.word 0xfef389e0  ! 4411: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb2850000  ! 4412: ADDcc_R	addcc 	%r20, %r0, %r25
T3_asi_reg_rd_194:
	mov	0x20, %r14
	.word 0xf4db8e40  ! 4413: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfc35c000  ! 4414: STH_R	sth	%r30, [%r23 + %r0]
cpu_intr_3_340:
	setx	0x420118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b4210f  ! 4417: STHA_I	stha	%r28, [%r16 + 0x010f] %asi
cpu_intr_3_341:
	setx	0x410236, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_195:
	mov	0x3c8, %r14
	.word 0xfedb89e0  ! 4426: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_3_342:
	setx	0x40020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe94a0b9  ! 4428: ORcc_I	orcc 	%r18, 0x00b9, %r31
iob_intr_3_370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_370), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_343:
	setx	0x420125, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_344:
	setx	0x400023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b4a0c7  ! 4432: STHA_I	stha	%r26, [%r18 + 0x00c7] %asi
T3_asi_reg_wr_198:
	mov	0x19, %r14
	.word 0xfef38e40  ! 4433: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_wr_199:
	mov	0x3c8, %r14
	.word 0xfcf389e0  ! 4435: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_3_345:
	setx	0x420339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb520e8  ! 4439: STHA_I	stha	%r31, [%r20 + 0x00e8] %asi
	.word 0xf4acc020  ! 4442: STBA_R	stba	%r26, [%r19 + %r0] 0x01
iob_intr_3_371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_371), 16, 16)) -> intp(3, 0, 2c)
cpu_intr_3_346:
	setx	0x410309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4744000  ! 4450: STX_R	stx	%r26, [%r17 + %r0]
T3_asi_reg_rd_196:
	mov	0x4, %r14
	.word 0xf0db8e60  ! 4451: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_3_347:
	setx	0x430007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf224c000  ! 4454: STW_R	stw	%r25, [%r19 + %r0]
	.word 0xfc2460cb  ! 4456: STW_I	stw	%r30, [%r17 + 0x00cb]
iob_intr_3_372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_372), 16, 16)) -> intp(3, 0, 5)
	.word 0xf6b50020  ! 4461: STHA_R	stha	%r27, [%r20 + %r0] 0x01
	.word 0xfa74e0c5  ! 4465: STX_I	stx	%r29, [%r19 + 0x00c5]
T3_asi_reg_rd_197:
	mov	0x2e, %r14
	.word 0xf4db8e40  ! 4466: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf6b40020  ! 4470: STHA_R	stha	%r27, [%r16 + %r0] 0x01
iob_intr_3_373:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_373), 16, 16)) -> intp(3, 0, 16)
T3_asi_reg_wr_200:
	mov	0x25, %r14
	.word 0xfef384a0  ! 4472: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_3_374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_374), 16, 16)) -> intp(3, 0, d)
cpu_intr_3_348:
	setx	0x430203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab5e00d  ! 4478: STHA_I	stha	%r29, [%r23 + 0x000d] %asi
iob_intr_3_375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_375), 16, 16)) -> intp(3, 0, 3)
T3_asi_reg_rd_198:
	mov	0x3c1, %r14
	.word 0xfedb8e40  ! 4480: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	ta	T_CHANGE_TO_TL0
	.word 0xf6ad0020  ! 4485: STBA_R	stba	%r27, [%r20 + %r0] 0x01
iob_intr_3_376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_376), 16, 16)) -> intp(3, 0, 10)
iob_intr_3_377:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_377), 16, 16)) -> intp(3, 0, 10)
	.word 0xfea5e19e  ! 4488: STWA_I	stwa	%r31, [%r23 + 0x019e] %asi
cpu_intr_3_349:
	setx	0x400314, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_350:
	setx	0x42030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc9d8000  ! 4494: XORcc_R	xorcc 	%r22, %r0, %r30
iob_intr_3_378:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_378), 16, 16)) -> intp(3, 0, 36)
T3_asi_reg_rd_199:
	mov	0x3c6, %r14
	.word 0xf0db8e80  ! 4501: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xf635c000  ! 4502: STH_R	sth	%r27, [%r23 + %r0]
T3_asi_reg_wr_201:
	mov	0x1c, %r14
	.word 0xf4f38e60  ! 4504: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_3_351:
	setx	0x430006, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_379:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_379), 16, 16)) -> intp(3, 0, 35)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_380), 16, 16)) -> intp(3, 0, 10)
	.word 0xbca48000  ! 4515: SUBcc_R	subcc 	%r18, %r0, %r30
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982c82  ! 4517: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c82, %hpstate
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982d4a  ! 4518: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4a, %hpstate
	.word 0xfa250000  ! 4519: STW_R	stw	%r29, [%r20 + %r0]
	.word 0xfea5e035  ! 4521: STWA_I	stwa	%r31, [%r23 + 0x0035] %asi
cpu_intr_3_352:
	setx	0x43000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6354000  ! 4525: STH_R	sth	%r27, [%r21 + %r0]
	.word 0xfca50020  ! 4526: STWA_R	stwa	%r30, [%r20 + %r0] 0x01
	.word 0xf82d20b0  ! 4527: STB_I	stb	%r28, [%r20 + 0x00b0]
	.word 0xf4b4e090  ! 4528: STHA_I	stha	%r26, [%r19 + 0x0090] %asi
iob_intr_3_381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_381), 16, 16)) -> intp(3, 0, 2)
cpu_intr_3_353:
	setx	0x400024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2d604c  ! 4533: STB_I	stb	%r31, [%r21 + 0x004c]
	ta	T_CHANGE_TO_TL1
cpu_intr_3_354:
	setx	0x43002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb4a070  ! 4540: STHA_I	stha	%r31, [%r18 + 0x0070] %asi
	.word 0xf2a4e040  ! 4541: STWA_I	stwa	%r25, [%r19 + 0x0040] %asi
cpu_intr_3_355:
	setx	0x420228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4f4e0a9  ! 4543: STXA_I	stxa	%r26, [%r19 + 0x00a9] %asi
iob_intr_3_382:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_382), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_356:
	setx	0x42021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0f4a064  ! 4552: STXA_I	stxa	%r24, [%r18 + 0x0064] %asi
cpu_intr_3_357:
	setx	0x410218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a4a00e  ! 4557: STWA_I	stwa	%r28, [%r18 + 0x000e] %asi
T3_asi_reg_rd_200:
	mov	0x0, %r14
	.word 0xf2db8e40  ! 4558: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T3_asi_reg_rd_201:
	mov	0xa, %r14
	.word 0xf4db89e0  ! 4560: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf83460a7  ! 4563: STH_I	sth	%r28, [%r17 + 0x00a7]
cpu_intr_3_358:
	setx	0x41000a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_383), 16, 16)) -> intp(3, 0, 30)
cpu_intr_3_359:
	setx	0x40031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a56142  ! 4572: STWA_I	stwa	%r24, [%r21 + 0x0142] %asi
T3_asi_reg_rd_202:
	mov	0x3c1, %r14
	.word 0xfedb8e40  ! 4574: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_360:
	setx	0x400322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_361:
	setx	0x42033f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_203:
	mov	0x17, %r14
	.word 0xf8db8e60  ! 4580: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_3_384:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_384), 16, 16)) -> intp(3, 0, a)
	ta	T_CHANGE_NONHPRIV
iob_intr_3_385:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_385), 16, 16)) -> intp(3, 0, 35)
T3_asi_reg_wr_202:
	mov	0x3c1, %r14
	.word 0xfcf38400  ! 4588: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	.word 0xbea54000  ! 4593: SUBcc_R	subcc 	%r21, %r0, %r31
	.word 0xf2acc020  ! 4595: STBA_R	stba	%r25, [%r19 + %r0] 0x01
	.word 0xb6250000  ! 4596: SUB_R	sub 	%r20, %r0, %r27
T3_asi_reg_rd_204:
	mov	0x3c4, %r14
	.word 0xfadb8400  ! 4597: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xba1c61c4  ! 4599: XOR_I	xor 	%r17, 0x01c4, %r29
cpu_intr_3_362:
	setx	0x470232, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_363:
	setx	0x44033b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_205:
	mov	0x27, %r14
	.word 0xfadb8400  ! 4613: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb8456169  ! 4615: ADDC_I	addc 	%r21, 0x0169, %r28
iob_intr_3_386:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_386), 16, 16)) -> intp(3, 0, 0)
iob_intr_3_387:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_387), 16, 16)) -> intp(3, 0, 3a)
iob_intr_3_388:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_388), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_364:
	setx	0x47031d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_389:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_389), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_365:
	setx	0x47020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_390:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_390), 16, 16)) -> intp(3, 0, 2)
T3_asi_reg_wr_203:
	mov	0x3c3, %r14
	.word 0xf4f38e40  ! 4631: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf22ca1d5  ! 4632: STB_I	stb	%r25, [%r18 + 0x01d5]
T3_asi_reg_wr_204:
	mov	0x3c3, %r14
	.word 0xf0f38e40  ! 4633: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_366:
	setx	0x46030b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_391:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_391), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf0a421f5  ! 4636: STWA_I	stwa	%r24, [%r16 + 0x01f5] %asi
cpu_intr_3_367:
	setx	0x470311, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_205:
	mov	0xe, %r14
	.word 0xf2f389e0  ! 4641: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xfe2c0000  ! 4643: STB_R	stb	%r31, [%r16 + %r0]
iob_intr_3_392:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_392), 16, 16)) -> intp(3, 0, 31)
T3_asi_reg_wr_206:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 4647: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf834a1f9  ! 4652: STH_I	sth	%r28, [%r18 + 0x01f9]
	.word 0xbf348000  ! 4653: SRL_R	srl 	%r18, %r0, %r31
	ta	T_CHANGE_TO_TL1
iob_intr_3_393:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_393), 16, 16)) -> intp(3, 0, 24)
	.word 0xbc8cc000  ! 4656: ANDcc_R	andcc 	%r19, %r0, %r30
	.word 0x8994e0cf  ! 4660: WRPR_TICK_I	wrpr	%r19, 0x00cf, %tick
	.word 0xfcacc020  ! 4663: STBA_R	stba	%r30, [%r19 + %r0] 0x01
	.word 0xf6b5a10a  ! 4664: STHA_I	stha	%r27, [%r22 + 0x010a] %asi
iob_intr_3_394:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_394), 16, 16)) -> intp(3, 0, 38)
iob_intr_3_395:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_395), 16, 16)) -> intp(3, 0, 34)
	.word 0xf6346079  ! 4668: STH_I	sth	%r27, [%r17 + 0x0079]
	.word 0xf034c000  ! 4670: STH_R	sth	%r24, [%r19 + %r0]
	.word 0xf4b50020  ! 4672: STHA_R	stha	%r26, [%r20 + %r0] 0x01
iob_intr_3_396:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_396), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_rd_206:
	mov	0x20, %r14
	.word 0xf8db8e80  ! 4674: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T3_asi_reg_rd_207:
	mov	0x16, %r14
	.word 0xf0db8e60  ! 4677: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_NONHPRIV
	.word 0xf27420c3  ! 4680: STX_I	stx	%r25, [%r16 + 0x00c3]
	.word 0xfc248000  ! 4683: STW_R	stw	%r30, [%r18 + %r0]
	.word 0xfe74c000  ! 4685: STX_R	stx	%r31, [%r19 + %r0]
	.word 0xf0758000  ! 4687: STX_R	stx	%r24, [%r22 + %r0]
iob_intr_3_397:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_397), 16, 16)) -> intp(3, 0, 25)
T3_asi_reg_wr_207:
	mov	0x3c8, %r14
	.word 0xf6f389e0  ! 4689: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf8754000  ! 4690: STX_R	stx	%r28, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
cpu_intr_3_368:
	setx	0x460034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2cc000  ! 4698: STB_R	stb	%r29, [%r19 + %r0]
	.word 0xfe75e1f5  ! 4701: STX_I	stx	%r31, [%r23 + 0x01f5]
	.word 0xf0b50020  ! 4704: STHA_R	stha	%r24, [%r20 + %r0] 0x01
iob_intr_3_398:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_398), 16, 16)) -> intp(3, 0, 5)
T3_asi_reg_rd_208:
	mov	0x19, %r14
	.word 0xfedb84a0  ! 4713: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_3_369:
	setx	0x470328, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_208:
	mov	0x1e, %r14
	.word 0xfaf384a0  ! 4718: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T3_asi_reg_wr_209:
	mov	0x26, %r14
	.word 0xf0f384a0  ! 4719: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_370:
	setx	0x470000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2ca18a  ! 4725: STB_I	stb	%r31, [%r18 + 0x018a]
T3_asi_reg_wr_210:
	mov	0x8, %r14
	.word 0xf4f389e0  ! 4727: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983dd2  ! 4728: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dd2, %hpstate
	.word 0xb4944000  ! 4729: ORcc_R	orcc 	%r17, %r0, %r26
	.word 0xfa254000  ! 4731: STW_R	stw	%r29, [%r21 + %r0]
	.word 0xf8a4a04f  ! 4733: STWA_I	stwa	%r28, [%r18 + 0x004f] %asi
T3_asi_reg_rd_209:
	mov	0xd, %r14
	.word 0xf4db8e40  ! 4736: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_rd_210:
	mov	0x18, %r14
	.word 0xfadb8e40  ! 4737: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf6a521ae  ! 4738: STWA_I	stwa	%r27, [%r20 + 0x01ae] %asi
	.word 0xf6b4a1a5  ! 4739: STHA_I	stha	%r27, [%r18 + 0x01a5] %asi
cpu_intr_3_371:
	setx	0x450011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcb58000  ! 4743: ORNcc_R	orncc 	%r22, %r0, %r30
	.word 0xbeb52093  ! 4749: ORNcc_I	orncc 	%r20, 0x0093, %r31
	.word 0xf42c6079  ! 4750: STB_I	stb	%r26, [%r17 + 0x0079]
	ta	T_CHANGE_TO_TL0
iob_intr_3_399:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_399), 16, 16)) -> intp(3, 0, 11)
cpu_intr_3_372:
	setx	0x440128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd2ce001  ! 4764: SLL_I	sll 	%r19, 0x0001, %r30
	.word 0xf8a520ae  ! 4765: STWA_I	stwa	%r28, [%r20 + 0x00ae] %asi
cpu_intr_3_373:
	setx	0x460003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb44020  ! 4767: STHA_R	stha	%r31, [%r17 + %r0] 0x01
	.word 0xb49c0000  ! 4768: XORcc_R	xorcc 	%r16, %r0, %r26
	.word 0xf0248000  ! 4769: STW_R	stw	%r24, [%r18 + %r0]
	.word 0xf0b5619b  ! 4770: STHA_I	stha	%r24, [%r21 + 0x019b] %asi
	.word 0xf875a1ee  ! 4771: STX_I	stx	%r28, [%r22 + 0x01ee]
	.word 0xfe750000  ! 4774: STX_R	stx	%r31, [%r20 + %r0]
iob_intr_3_400:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_400), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_rd_211:
	mov	0x9, %r14
	.word 0xf0db89e0  ! 4777: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbc35e140  ! 4778: SUBC_I	orn 	%r23, 0x0140, %r30
iob_intr_3_401:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_401), 16, 16)) -> intp(3, 0, f)
	.word 0xf4b58020  ! 4784: STHA_R	stha	%r26, [%r22 + %r0] 0x01
iob_intr_3_402:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_402), 16, 16)) -> intp(3, 0, 24)
iob_intr_3_403:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_403), 16, 16)) -> intp(3, 0, 3d)
	.word 0xb43d4000  ! 4793: XNOR_R	xnor 	%r21, %r0, %r26
iob_intr_3_404:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_404), 16, 16)) -> intp(3, 0, 25)
	.word 0xb6346135  ! 4798: ORN_I	orn 	%r17, 0x0135, %r27
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982e02  ! 4799: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e02, %hpstate
	ta	T_CHANGE_TO_TL0
	.word 0xf024c000  ! 4804: STW_R	stw	%r24, [%r19 + %r0]
T3_asi_reg_rd_212:
	mov	0x14, %r14
	.word 0xf8db84a0  ! 4805: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_3_405:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_405), 16, 16)) -> intp(3, 0, 1f)
	ta	T_CHANGE_HPRIV
cpu_intr_3_374:
	setx	0x45033c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_213:
	mov	0x1c, %r14
	.word 0xf6db8400  ! 4814: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983f9a  ! 4815: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f9a, %hpstate
iob_intr_3_406:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_406), 16, 16)) -> intp(3, 0, 7)
cpu_intr_3_375:
	setx	0x450136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc246023  ! 4824: SUB_I	sub 	%r17, 0x0023, %r30
cpu_intr_3_376:
	setx	0x470223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb50020  ! 4834: STHA_R	stha	%r31, [%r20 + %r0] 0x01
	.word 0xfca56071  ! 4835: STWA_I	stwa	%r30, [%r21 + 0x0071] %asi
	.word 0xb4054000  ! 4841: ADD_R	add 	%r21, %r0, %r26
T3_asi_reg_wr_211:
	mov	0x3c2, %r14
	.word 0xf8f38e80  ! 4842: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0x8d9521b1  ! 4843: WRPR_PSTATE_I	wrpr	%r20, 0x01b1, %pstate
T3_asi_reg_rd_214:
	mov	0x3c5, %r14
	.word 0xfcdb89e0  ! 4845: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T3_asi_reg_wr_212:
	mov	0x3c6, %r14
	.word 0xf4f38e80  ! 4847: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_3_377:
	setx	0x460214, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_378:
	setx	0x44010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7520000  ! 4850: RDPR_PIL	rdpr	%pil, %r27
T3_asi_reg_wr_213:
	mov	0x1d, %r14
	.word 0xfef38400  ! 4853: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf22c0000  ! 4855: STB_R	stb	%r25, [%r16 + %r0]
	.word 0xfab40020  ! 4856: STHA_R	stha	%r29, [%r16 + %r0] 0x01
iob_intr_3_407:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_407), 16, 16)) -> intp(3, 0, 1)
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983b90  ! 4862: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b90, %hpstate
	.word 0xf4b421ec  ! 4863: STHA_I	stha	%r26, [%r16 + 0x01ec] %asi
iob_intr_3_408:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_408), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_rd_215:
	mov	0x3c1, %r14
	.word 0xf8db8e40  ! 4868: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_409:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_409), 16, 16)) -> intp(3, 0, 30)
cpu_intr_3_379:
	setx	0x440121, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_410:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_410), 16, 16)) -> intp(3, 0, 23)
T3_asi_reg_rd_216:
	mov	0x26, %r14
	.word 0xfadb8e60  ! 4872: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T3_asi_reg_rd_217:
	mov	0x34, %r14
	.word 0xfcdb8400  ! 4873: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_3_411:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_411), 16, 16)) -> intp(3, 0, 32)
	.word 0xf02de145  ! 4876: STB_I	stb	%r24, [%r23 + 0x0145]
T3_asi_reg_wr_214:
	mov	0x2c, %r14
	.word 0xf6f38e80  ! 4878: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T3_asi_reg_rd_218:
	mov	0x2d, %r14
	.word 0xfedb84a0  ! 4881: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_3_380:
	setx	0x44022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0bca05f  ! 4884: XNORcc_I	xnorcc 	%r18, 0x005f, %r24
	.word 0xf2a4a0ee  ! 4887: STWA_I	stwa	%r25, [%r18 + 0x00ee] %asi
	.word 0xf2344000  ! 4889: STH_R	sth	%r25, [%r17 + %r0]
cpu_intr_3_381:
	setx	0x460010, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_412:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_412), 16, 16)) -> intp(3, 0, b)
	.word 0xfc2421d5  ! 4892: STW_I	stw	%r30, [%r16 + 0x01d5]
iob_intr_3_413:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_413), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_wr_215:
	mov	0x3c0, %r14
	.word 0xf2f38e80  ! 4894: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xfeac4020  ! 4895: STBA_R	stba	%r31, [%r17 + %r0] 0x01
T3_asi_reg_wr_216:
	mov	0x30, %r14
	.word 0xf4f38e40  ! 4896: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfc24a1c0  ! 4898: STW_I	stw	%r30, [%r18 + 0x01c0]
T3_asi_reg_rd_219:
	mov	0x3c1, %r14
	.word 0xfcdb84a0  ! 4899: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T3_asi_reg_wr_217:
	mov	0x3c2, %r14
	.word 0xfef38400  ! 4900: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb8952100  ! 4902: ORcc_I	orcc 	%r20, 0x0100, %r28
iob_intr_3_414:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_414), 16, 16)) -> intp(3, 0, 5)
	.word 0xbc1c20d0  ! 4904: XOR_I	xor 	%r16, 0x00d0, %r30
T3_asi_reg_rd_220:
	mov	0x22, %r14
	.word 0xf4db8e80  ! 4908: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xf82ca0a3  ! 4911: STB_I	stb	%r28, [%r18 + 0x00a3]
	.word 0xfe756135  ! 4916: STX_I	stx	%r31, [%r21 + 0x0135]
T3_asi_reg_wr_218:
	mov	0x26, %r14
	.word 0xf8f38e40  ! 4917: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_3_382:
	setx	0x46002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb57d4400  ! 4919: MOVR_R	movre	%r21, %r0, %r26
iob_intr_3_415:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_415), 16, 16)) -> intp(3, 0, 4)
T3_asi_reg_wr_219:
	mov	0x22, %r14
	.word 0xfaf38400  ! 4922: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_3_383:
	setx	0x460231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc35c000  ! 4928: STH_R	sth	%r30, [%r23 + %r0]
T3_asi_reg_wr_220:
	mov	0x11, %r14
	.word 0xfaf38e40  ! 4929: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb004a142  ! 4934: ADD_I	add 	%r18, 0x0142, %r24
cpu_intr_3_384:
	setx	0x45011e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_221:
	mov	0xb, %r14
	.word 0xfadb8400  ! 4937: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T3_asi_reg_wr_221:
	mov	0x3c1, %r14
	.word 0xf2f38e80  ! 4938: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T3_asi_reg_wr_222:
	mov	0x0, %r14
	.word 0xfef38e60  ! 4939: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb41d4000  ! 4940: XOR_R	xor 	%r21, %r0, %r26
	.word 0xf8b44020  ! 4943: STHA_R	stha	%r28, [%r17 + %r0] 0x01
	.word 0xb604c000  ! 4944: ADD_R	add 	%r19, %r0, %r27
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982ed8  ! 4949: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed8, %hpstate
cpu_intr_3_385:
	setx	0x440222, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_386:
	setx	0x44031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a5a196  ! 4959: STWA_I	stwa	%r25, [%r22 + 0x0196] %asi
	.word 0xb17dc400  ! 4961: MOVR_R	movre	%r23, %r0, %r24
T3_asi_reg_rd_222:
	mov	0x22, %r14
	.word 0xf0db84a0  ! 4968: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_3_416:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_416), 16, 16)) -> intp(3, 0, 0)
cpu_intr_3_387:
	setx	0x440221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb02da1e3  ! 4972: ANDN_I	andn 	%r22, 0x01e3, %r24
	.word 0xb6458000  ! 4975: ADDC_R	addc 	%r22, %r0, %r27
T3_asi_reg_rd_223:
	mov	0x3c6, %r14
	.word 0xf6db8e80  ! 4980: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_3_388:
	setx	0x460321, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_389:
	setx	0x450021, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_224:
	mov	0x5, %r14
	.word 0xf6db84a0  ! 4983: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_3_390:
	setx	0x45020c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_417:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_417), 16, 16)) -> intp(3, 0, a)
T3_asi_reg_wr_223:
	mov	0x3c5, %r14
	.word 0xf4f38e80  ! 4988: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_3_391:
	setx	0x45023d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_224:
	mov	0x3c0, %r14
	.word 0xf8f38400  ! 4998: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_3_418:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_418), 16, 16)) -> intp(3, 0, 25)
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
iob_intr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_0), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_wr_0:
	mov	0x3c5, %r14
	.word 0xf8f38e80  ! 7: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T2_asi_reg_wr_1:
	mov	0x3, %r14
	.word 0xf6f38e60  ! 9: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_2_0:
	setx	0x1d012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb2c6001  ! 12: SLL_I	sll 	%r17, 0x0001, %r29
cpu_intr_2_1:
	setx	0x1e0315, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_1), 16, 16)) -> intp(2, 0, 38)
	.word 0xf0558000  ! 19: LDSH_R	ldsh	[%r22 + %r0], %r24
	.word 0xfec5a15a  ! 20: LDSWA_I	ldswa	[%r22, + 0x015a] %asi, %r31
	.word 0xf85d8000  ! 21: LDX_R	ldx	[%r22 + %r0], %r28
	.word 0xf045c000  ! 23: LDSW_R	ldsw	[%r23 + %r0], %r24
	.word 0xbd35a001  ! 26: SRL_I	srl 	%r22, 0x0001, %r30
cpu_intr_2_2:
	setx	0x1c033f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_2), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_wr_2:
	mov	0x3c5, %r14
	.word 0xfcf38400  ! 32: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_2_3:
	setx	0x1d0119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4d0000  ! 35: LDSB_R	ldsb	[%r20 + %r0], %r29
	ta	T_CHANGE_TO_TL1
	.word 0xb935a001  ! 42: SRL_I	srl 	%r22, 0x0001, %r28
	.word 0xf485216d  ! 44: LDUWA_I	lduwa	[%r20, + 0x016d] %asi, %r26
cpu_intr_2_4:
	setx	0x1d0120, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_3), 16, 16)) -> intp(2, 0, 3e)
cpu_intr_2_5:
	setx	0x1d011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8440000  ! 49: LDSW_R	ldsw	[%r16 + %r0], %r28
iob_intr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_4), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf885e161  ! 53: LDUWA_I	lduwa	[%r23, + 0x0161] %asi, %r28
	.word 0xa1902001  ! 57: WRPR_GL_I	wrpr	%r0, 0x0001, %-
cpu_intr_2_6:
	setx	0x1f0119, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_0:
	mov	0x3c4, %r14
	.word 0xfedb8e40  ! 60: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf495e00f  ! 61: LDUHA_I	lduha	[%r23, + 0x000f] %asi, %r26
T2_asi_reg_rd_1:
	mov	0x3c4, %r14
	.word 0xfcdb8400  ! 62: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_5), 16, 16)) -> intp(2, 0, 8)
	.word 0xf64da01d  ! 65: LDSB_I	ldsb	[%r22 + 0x001d], %r27
cpu_intr_2_7:
	setx	0x1c031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfad4a025  ! 70: LDSHA_I	ldsha	[%r18, + 0x0025] %asi, %r29
cpu_intr_2_8:
	setx	0x1f0003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc442040  ! 78: LDSW_I	ldsw	[%r16 + 0x0040], %r30
T2_asi_reg_wr_3:
	mov	0x3c3, %r14
	.word 0xfcf38400  ! 79: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xf24560e2  ! 81: LDSW_I	ldsw	[%r21 + 0x00e2], %r25
	.word 0xf40d4000  ! 82: LDUB_R	ldub	[%r21 + %r0], %r26
	.word 0xfe94c020  ! 84: LDUHA_R	lduha	[%r19, %r0] 0x01, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2c5a181  ! 90: LDSWA_I	ldswa	[%r22, + 0x0181] %asi, %r25
cpu_intr_2_9:
	setx	0x1d0238, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_6), 16, 16)) -> intp(2, 0, b)
	.word 0xf25c8000  ! 95: LDX_R	ldx	[%r18 + %r0], %r25
	.word 0xbc44e0c9  ! 99: ADDC_I	addc 	%r19, 0x00c9, %r30
	.word 0xf645a019  ! 104: LDSW_I	ldsw	[%r22 + 0x0019], %r27
	.word 0xbf3d9000  ! 106: SRAX_R	srax	%r22, %r0, %r31
	.word 0xb0a40000  ! 110: SUBcc_R	subcc 	%r16, %r0, %r24
T2_asi_reg_rd_2:
	mov	0x26, %r14
	.word 0xfcdb8e80  ! 111: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xfa0ce11a  ! 112: LDUB_I	ldub	[%r19 + 0x011a], %r29
iob_intr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_7), 16, 16)) -> intp(2, 0, 2d)
	.word 0xfc85e0f1  ! 114: LDUWA_I	lduwa	[%r23, + 0x00f1] %asi, %r30
iob_intr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_8), 16, 16)) -> intp(2, 0, 26)
	.word 0xf2840020  ! 116: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r25
cpu_intr_2_10:
	setx	0x1d020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_4:
	mov	0x1e, %r14
	.word 0xf2f38e60  ! 123: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_2_11:
	setx	0x1e0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf245e103  ! 126: LDSW_I	ldsw	[%r23 + 0x0103], %r25
	.word 0xbf357001  ! 127: SRLX_I	srlx	%r21, 0x0001, %r31
	.word 0xf04c0000  ! 130: LDSB_R	ldsb	[%r16 + %r0], %r24
	.word 0xf84cc000  ! 133: LDSB_R	ldsb	[%r19 + %r0], %r28
	.word 0xf414e051  ! 137: LDUH_I	lduh	[%r19 + 0x0051], %r26
	.word 0xbf7c8400  ! 138: MOVR_R	movre	%r18, %r0, %r31
iob_intr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_9), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_wr_5:
	mov	0x3c7, %r14
	.word 0xfcf38400  ! 144: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_10), 16, 16)) -> intp(2, 0, 3d)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf0c50020  ! 147: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r24
	.word 0xf0d5201a  ! 150: LDSHA_I	ldsha	[%r20, + 0x001a] %asi, %r24
iob_intr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_11), 16, 16)) -> intp(2, 0, 5)
T2_asi_reg_wr_6:
	mov	0x2e, %r14
	.word 0xf4f389e0  ! 152: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_2_12:
	setx	0x1e0116, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_13:
	setx	0x1e0328, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_14:
	setx	0x1c021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_15:
	setx	0x1d001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc3561a0  ! 163: SUBC_I	orn 	%r21, 0x01a0, %r30
T2_asi_reg_wr_7:
	mov	0x15, %r14
	.word 0xf6f384a0  ! 166: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb73d0000  ! 167: SRA_R	sra 	%r20, %r0, %r27
	.word 0xb235a0b0  ! 168: ORN_I	orn 	%r22, 0x00b0, %r25
iob_intr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_12), 16, 16)) -> intp(2, 0, 8)
	.word 0xf6842022  ! 171: LDUWA_I	lduwa	[%r16, + 0x0022] %asi, %r27
	.word 0xfa5d207e  ! 173: LDX_I	ldx	[%r20 + 0x007e], %r29
	.word 0xfa95c020  ! 174: LDUHA_R	lduha	[%r23, %r0] 0x01, %r29
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983c98  ! 176: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c98, %hpstate
cpu_intr_2_16:
	setx	0x1f032c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_3:
	mov	0x3c5, %r14
	.word 0xfedb8e80  ! 178: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xfa1561c8  ! 179: LDUH_I	lduh	[%r21 + 0x01c8], %r29
cpu_intr_2_17:
	setx	0x1f0100, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_18:
	setx	0x1f032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb52cd000  ! 184: SLLX_R	sllx	%r19, %r0, %r26
cpu_intr_2_19:
	setx	0x1f001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf094e0e0  ! 189: LDUHA_I	lduha	[%r19, + 0x00e0] %asi, %r24
iob_intr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_13), 16, 16)) -> intp(2, 0, 8)
T2_asi_reg_wr_8:
	mov	0x14, %r14
	.word 0xf4f38e40  ! 192: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_rd_4:
	mov	0x3c5, %r14
	.word 0xf6db8e40  ! 193: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf894e0a6  ! 194: LDUHA_I	lduha	[%r19, + 0x00a6] %asi, %r28
	.word 0xf8c48020  ! 201: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r28
iob_intr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_14), 16, 16)) -> intp(2, 0, 26)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_15), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_rd_5:
	mov	0x19, %r14
	.word 0xfedb8e40  ! 210: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf2d58020  ! 211: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_20:
	setx	0x1c0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf69420c8  ! 216: LDUHA_I	lduha	[%r16, + 0x00c8] %asi, %r27
T2_asi_reg_wr_9:
	mov	0x2a, %r14
	.word 0xf2f384a0  ! 217: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_16), 16, 16)) -> intp(2, 0, 9)
	.word 0xfacd0020  ! 223: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r29
	.word 0xfa558000  ! 224: LDSH_R	ldsh	[%r22 + %r0], %r29
	.word 0xb4144000  ! 228: OR_R	or 	%r17, %r0, %r26
iob_intr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_17), 16, 16)) -> intp(2, 0, 9)
cpu_intr_2_21:
	setx	0x1e0231, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_18), 16, 16)) -> intp(2, 0, 12)
	.word 0xb2a50000  ! 238: SUBcc_R	subcc 	%r20, %r0, %r25
T2_asi_reg_wr_10:
	mov	0x12, %r14
	.word 0xfaf38e40  ! 239: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf2c54020  ! 246: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_6:
	mov	0xc, %r14
	.word 0xf4db8e60  ! 248: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xbab48000  ! 249: SUBCcc_R	orncc 	%r18, %r0, %r29
	.word 0xf0c46087  ! 252: LDSWA_I	ldswa	[%r17, + 0x0087] %asi, %r24
	.word 0xfed54020  ! 253: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r31
cpu_intr_2_22:
	setx	0x1e0004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf014e11c  ! 256: LDUH_I	lduh	[%r19 + 0x011c], %r24
iob_intr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_19), 16, 16)) -> intp(2, 0, 19)
cpu_intr_2_23:
	setx	0x1e0236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc8d0020  ! 261: LDUBA_R	lduba	[%r20, %r0] 0x01, %r30
T2_asi_reg_rd_7:
	mov	0x3c0, %r14
	.word 0xf8db8e60  ! 262: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T2_asi_reg_wr_11:
	mov	0x32, %r14
	.word 0xfcf38e40  ! 264: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfe0d8000  ! 265: LDUB_R	ldub	[%r22 + %r0], %r31
cpu_intr_2_24:
	setx	0x1f0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf455a1a9  ! 267: LDSH_I	ldsh	[%r22 + 0x01a9], %r26
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983f92  ! 269: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f92, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0xb01c8000  ! 272: XOR_R	xor 	%r18, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xb68d4000  ! 277: ANDcc_R	andcc 	%r21, %r0, %r27
	.word 0xf4848020  ! 278: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r26
	.word 0xf4146115  ! 280: LDUH_I	lduh	[%r17 + 0x0115], %r26
	.word 0xf205e134  ! 282: LDUW_I	lduw	[%r23 + 0x0134], %r25
	.word 0xf0052076  ! 283: LDUW_I	lduw	[%r20 + 0x0076], %r24
	.word 0xf0dc2094  ! 286: LDXA_I	ldxa	[%r16, + 0x0094] %asi, %r24
T2_asi_reg_rd_8:
	mov	0x3c4, %r14
	.word 0xfedb89e0  ! 288: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_2_25:
	setx	0x1f030c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_26:
	setx	0x1d0003, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_20), 16, 16)) -> intp(2, 0, 19)
iob_intr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_21), 16, 16)) -> intp(2, 0, 18)
iob_intr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_22), 16, 16)) -> intp(2, 0, 31)
iob_intr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_23), 16, 16)) -> intp(2, 0, 2)
	.word 0xfad44020  ! 297: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r29
T2_asi_reg_wr_12:
	mov	0x2d, %r14
	.word 0xfcf38400  ! 298: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982d48  ! 299: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d48, %hpstate
	.word 0xfacd0020  ! 307: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r29
T2_asi_reg_wr_13:
	mov	0x3c4, %r14
	.word 0xf2f38e80  ! 308: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xfacc207c  ! 309: LDSBA_I	ldsba	[%r16, + 0x007c] %asi, %r29
	.word 0xfe5c4000  ! 310: LDX_R	ldx	[%r17 + %r0], %r31
iob_intr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_24), 16, 16)) -> intp(2, 0, 18)
	.word 0xf0950020  ! 314: LDUHA_R	lduha	[%r20, %r0] 0x01, %r24
	.word 0xb44460c9  ! 315: ADDC_I	addc 	%r17, 0x00c9, %r26
	.word 0xfa054000  ! 317: LDUW_R	lduw	[%r21 + %r0], %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf04d4000  ! 323: LDSB_R	ldsb	[%r21 + %r0], %r24
iob_intr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_25), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_wr_14:
	mov	0x22, %r14
	.word 0xfcf38e40  ! 326: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_rd_9:
	mov	0x14, %r14
	.word 0xf6db84a0  ! 327: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_2_27:
	setx	0x1d0138, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_26), 16, 16)) -> intp(2, 0, 1b)
	.word 0xfa154000  ! 332: LDUH_R	lduh	[%r21 + %r0], %r29
	.word 0xb934b001  ! 333: SRLX_I	srlx	%r18, 0x0001, %r28
	.word 0xbc240000  ! 335: SUB_R	sub 	%r16, %r0, %r30
iob_intr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_27), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf6d420e4  ! 340: LDSHA_I	ldsha	[%r16, + 0x00e4] %asi, %r27
T2_asi_reg_wr_15:
	mov	0x35, %r14
	.word 0xfef38e80  ! 341: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xfe5ce0e1  ! 343: LDX_I	ldx	[%r19 + 0x00e1], %r31
iob_intr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_28), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_rd_10:
	mov	0x1, %r14
	.word 0xf8db8400  ! 349: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T2_asi_reg_wr_16:
	mov	0x4, %r14
	.word 0xfef38400  ! 352: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbe948000  ! 354: ORcc_R	orcc 	%r18, %r0, %r31
T2_asi_reg_wr_17:
	mov	0xa, %r14
	.word 0xf8f389e0  ! 360: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xfe8ca14e  ! 361: LDUBA_I	lduba	[%r18, + 0x014e] %asi, %r31
	.word 0xfe140000  ! 362: LDUH_R	lduh	[%r16 + %r0], %r31
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_18:
	mov	0x34, %r14
	.word 0xfef38400  ! 365: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_2_28:
	setx	0x1e0035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6d5e076  ! 368: LDSHA_I	ldsha	[%r23, + 0x0076] %asi, %r27
iob_intr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_29), 16, 16)) -> intp(2, 0, 11)
iob_intr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_30), 16, 16)) -> intp(2, 0, 14)
T2_asi_reg_rd_11:
	mov	0x28, %r14
	.word 0xf6db8400  ! 381: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_31), 16, 16)) -> intp(2, 0, 9)
iob_intr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_32), 16, 16)) -> intp(2, 0, 16)
T2_asi_reg_rd_12:
	mov	0x3c2, %r14
	.word 0xf4db8400  ! 384: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_2_29:
	setx	0x1d0203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc15600e  ! 389: LDUH_I	lduh	[%r21 + 0x000e], %r30
iob_intr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_33), 16, 16)) -> intp(2, 0, 9)
T2_asi_reg_wr_19:
	mov	0x9, %r14
	.word 0xfcf38400  ! 395: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xf24cc000  ! 397: LDSB_R	ldsb	[%r19 + %r0], %r25
T2_asi_reg_rd_13:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 402: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_34), 16, 16)) -> intp(2, 0, 37)
iob_intr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_35), 16, 16)) -> intp(2, 0, 21)
	ta	T_CHANGE_TO_TL1
	.word 0xf24521b0  ! 407: LDSW_I	ldsw	[%r20 + 0x01b0], %r25
cpu_intr_2_30:
	setx	0x1d0213, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_14:
	mov	0x2f, %r14
	.word 0xf2db84a0  ! 411: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xfe158000  ! 413: LDUH_R	lduh	[%r22 + %r0], %r31
iob_intr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_36), 16, 16)) -> intp(2, 0, 24)
T2_asi_reg_wr_20:
	mov	0x29, %r14
	.word 0xf0f38e60  ! 416: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_rd_15:
	mov	0x27, %r14
	.word 0xf2db8e60  ! 420: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xfed5a158  ! 421: LDSHA_I	ldsha	[%r22, + 0x0158] %asi, %r31
cpu_intr_2_31:
	setx	0x1d033a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_32:
	setx	0x1f0004, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_37), 16, 16)) -> intp(2, 0, 2d)
iob_intr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_38), 16, 16)) -> intp(2, 0, 3c)
cpu_intr_2_33:
	setx	0x1e0026, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_39), 16, 16)) -> intp(2, 0, 30)
	.word 0x8d9560e0  ! 436: WRPR_PSTATE_I	wrpr	%r21, 0x00e0, %pstate
iob_intr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_40), 16, 16)) -> intp(2, 0, 14)
iob_intr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_41), 16, 16)) -> intp(2, 0, a)
	.word 0xbd641800  ! 440: MOVcc_R	<illegal instruction>
	.word 0xb73cf001  ! 441: SRAX_I	srax	%r19, 0x0001, %r27
T2_asi_reg_rd_16:
	mov	0x34, %r14
	.word 0xfadb84a0  ! 444: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf4c54020  ! 445: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r26
cpu_intr_2_34:
	setx	0x1d022d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_35:
	setx	0x1c0219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45c0000  ! 450: LDX_R	ldx	[%r16 + %r0], %r26
T2_asi_reg_wr_21:
	mov	0x32, %r14
	.word 0xfef384a0  ! 451: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_2_36:
	setx	0x1d013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_22:
	mov	0x17, %r14
	.word 0xfcf38e40  ! 455: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfe5ca03d  ! 456: LDX_I	ldx	[%r18 + 0x003d], %r31
	.word 0xbe8d61a1  ! 457: ANDcc_I	andcc 	%r21, 0x01a1, %r31
	.word 0xbb518000  ! 458: RDPR_PSTATE	<illegal instruction>
cpu_intr_2_37:
	setx	0x1f0225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8cce03b  ! 460: LDSBA_I	ldsba	[%r19, + 0x003b] %asi, %r28
cpu_intr_2_38:
	setx	0x220117, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_17:
	mov	0x3c7, %r14
	.word 0xf4db8400  ! 464: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb0b50000  ! 469: ORNcc_R	orncc 	%r20, %r0, %r24
	.word 0xbf540000  ! 471: RDPR_GL	<illegal instruction>
cpu_intr_2_39:
	setx	0x210130, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xbeb4c000  ! 485: ORNcc_R	orncc 	%r19, %r0, %r31
T2_asi_reg_wr_23:
	mov	0x6, %r14
	.word 0xf0f38e60  ! 486: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xf85c8000  ! 487: LDX_R	ldx	[%r18 + %r0], %r28
cpu_intr_2_40:
	setx	0x22013d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_42), 16, 16)) -> intp(2, 0, 27)
T2_asi_reg_rd_18:
	mov	0xd, %r14
	.word 0xf8db8e40  ! 493: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_2_41:
	setx	0x10309, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983b08  ! 497: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b08, %hpstate
	.word 0xfed4a0c7  ! 498: LDSHA_I	ldsha	[%r18, + 0x00c7] %asi, %r31
cpu_intr_2_42:
	setx	0x220320, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_43:
	setx	0x23002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf28c214a  ! 502: LDUBA_I	lduba	[%r16, + 0x014a] %asi, %r25
	.word 0xbc3560d7  ! 503: SUBC_I	orn 	%r21, 0x00d7, %r30
T2_asi_reg_rd_19:
	mov	0x3c7, %r14
	.word 0xf0db8e40  ! 504: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	ta	T_CHANGE_HPRIV
	.word 0xfed46020  ! 508: LDSHA_I	ldsha	[%r17, + 0x0020] %asi, %r31
	.word 0xfe448000  ! 515: LDSW_R	ldsw	[%r18 + %r0], %r31
	.word 0xb24521b2  ! 521: ADDC_I	addc 	%r20, 0x01b2, %r25
iob_intr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_43), 16, 16)) -> intp(2, 0, 1)
T2_asi_reg_rd_20:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 524: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfe55e1af  ! 526: LDSH_I	ldsh	[%r23 + 0x01af], %r31
T2_asi_reg_rd_21:
	mov	0x2f, %r14
	.word 0xfadb89e0  ! 527: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf2c40020  ! 529: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r25
	.word 0xb6ac2167  ! 530: ANDNcc_I	andncc 	%r16, 0x0167, %r27
	.word 0xf80d4000  ! 534: LDUB_R	ldub	[%r21 + %r0], %r28
	.word 0xfeccc020  ! 535: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r31
	.word 0xf2dda16b  ! 537: LDXA_I	ldxa	[%r22, + 0x016b] %asi, %r25
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x8198395a  ! 538: WRHPR_HPSTATE_I	wrhpr	%r0, 0x195a, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf08de114  ! 548: LDUBA_I	lduba	[%r23, + 0x0114] %asi, %r24
	.word 0xf255c000  ! 549: LDSH_R	ldsh	[%r23 + %r0], %r25
	.word 0xb294c000  ! 550: ORcc_R	orcc 	%r19, %r0, %r25
	ta	T_CHANGE_HPRIV
	.word 0xf4dd2085  ! 553: LDXA_I	ldxa	[%r20, + 0x0085] %asi, %r26
	.word 0xbb643801  ! 554: MOVcc_I	<illegal instruction>
	.word 0xfc156184  ! 555: LDUH_I	lduh	[%r21 + 0x0184], %r30
	.word 0xf2940020  ! 560: LDUHA_R	lduha	[%r16, %r0] 0x01, %r25
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983c12  ! 561: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c12, %hpstate
iob_intr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_44), 16, 16)) -> intp(2, 0, 2d)
T2_asi_reg_wr_24:
	mov	0x3c4, %r14
	.word 0xfcf38e60  ! 570: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x8198285a  ! 571: WRHPR_HPSTATE_I	wrhpr	%r0, 0x085a, %hpstate
	ta	T_CHANGE_TO_TL1
	.word 0xbd3da001  ! 574: SRA_I	sra 	%r22, 0x0001, %r30
	.word 0xf8dc600b  ! 575: LDXA_I	ldxa	[%r17, + 0x000b] %asi, %r28
	ta	T_CHANGE_TO_TL0
	.word 0xfe958020  ! 577: LDUHA_R	lduha	[%r22, %r0] 0x01, %r31
	.word 0xf0050000  ! 580: LDUW_R	lduw	[%r20 + %r0], %r24
iob_intr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_45), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_rd_22:
	mov	0x24, %r14
	.word 0xfadb84a0  ! 586: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_46), 16, 16)) -> intp(2, 0, 28)
T2_asi_reg_rd_23:
	mov	0xf, %r14
	.word 0xf2db8e60  ! 588: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_2_44:
	setx	0x220009, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_25:
	mov	0x2b, %r14
	.word 0xf6f384a0  ! 591: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf85d4000  ! 592: LDX_R	ldx	[%r21 + %r0], %r28
iob_intr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_47), 16, 16)) -> intp(2, 0, 3f)
	.word 0xb885e0e7  ! 596: ADDcc_I	addcc 	%r23, 0x00e7, %r28
T2_asi_reg_rd_24:
	mov	0x2b, %r14
	.word 0xfadb89e0  ! 597: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xfa950020  ! 600: LDUHA_R	lduha	[%r20, %r0] 0x01, %r29
	.word 0xf88ca068  ! 603: LDUBA_I	lduba	[%r18, + 0x0068] %asi, %r28
T2_asi_reg_rd_25:
	mov	0x21, %r14
	.word 0xf8db8e80  ! 604: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T2_asi_reg_rd_26:
	mov	0x4, %r14
	.word 0xf4db84a0  ! 608: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf0d5e107  ! 613: LDSHA_I	ldsha	[%r23, + 0x0107] %asi, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_45:
	setx	0x210202, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_46:
	setx	0x23010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2252057  ! 619: SUB_I	sub 	%r20, 0x0057, %r25
cpu_intr_2_47:
	setx	0x200114, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_48:
	setx	0x230334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2944020  ! 625: LDUHA_R	lduha	[%r17, %r0] 0x01, %r25
	.word 0xf2d4a172  ! 626: LDSHA_I	ldsha	[%r18, + 0x0172] %asi, %r25
cpu_intr_2_49:
	setx	0x210019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6cc20b6  ! 630: LDSBA_I	ldsba	[%r16, + 0x00b6] %asi, %r27
	.word 0xf68461b0  ! 638: LDUWA_I	lduwa	[%r17, + 0x01b0] %asi, %r27
T2_asi_reg_rd_27:
	mov	0x17, %r14
	.word 0xf2db8e60  ! 639: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_2_50:
	setx	0x200333, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_28:
	mov	0x2e, %r14
	.word 0xf4db89e0  ! 646: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	ta	T_CHANGE_HPRIV
	.word 0xb00c8000  ! 648: AND_R	and 	%r18, %r0, %r24
iob_intr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_48), 16, 16)) -> intp(2, 0, 1)
T2_asi_reg_rd_29:
	mov	0x3c3, %r14
	.word 0xf0db8e60  ! 653: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_2_51:
	setx	0x200122, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_52:
	setx	0x23010a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_53:
	setx	0x21022f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_30:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 659: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_2_54:
	setx	0x210220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba9d4000  ! 661: XORcc_R	xorcc 	%r21, %r0, %r29
T2_asi_reg_wr_26:
	mov	0x2c, %r14
	.word 0xfaf38e80  ! 662: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf20d8000  ! 665: LDUB_R	ldub	[%r22 + %r0], %r25
T2_asi_reg_wr_27:
	mov	0x30, %r14
	.word 0xf0f389e0  ! 666: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T2_asi_reg_rd_31:
	mov	0x2f, %r14
	.word 0xf6db84a0  ! 667: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_32:
	mov	0x26, %r14
	.word 0xf0db89e0  ! 670: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf694c020  ! 671: LDUHA_R	lduha	[%r19, %r0] 0x01, %r27
cpu_intr_2_55:
	setx	0x23001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_49), 16, 16)) -> intp(2, 0, 4)
cpu_intr_2_56:
	setx	0x220327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04d8000  ! 683: LDSB_R	ldsb	[%r22 + %r0], %r24
iob_intr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_50), 16, 16)) -> intp(2, 0, 0)
cpu_intr_2_57:
	setx	0x22001d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_58:
	setx	0x200201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_51), 16, 16)) -> intp(2, 0, 14)
T2_asi_reg_wr_28:
	mov	0x1, %r14
	.word 0xf2f38e60  ! 693: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983dda  ! 694: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dda, %hpstate
	.word 0xfc44c000  ! 696: LDSW_R	ldsw	[%r19 + %r0], %r30
iob_intr_2_52:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_52), 16, 16)) -> intp(2, 0, 33)
	.word 0xbe1cc000  ! 706: XOR_R	xor 	%r19, %r0, %r31
cpu_intr_2_59:
	setx	0x200326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb23520fe  ! 711: SUBC_I	orn 	%r20, 0x00fe, %r25
iob_intr_2_53:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_53), 16, 16)) -> intp(2, 0, 25)
	.word 0xfcc48020  ! 713: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r30
	.word 0xf48d6149  ! 715: LDUBA_I	lduba	[%r21, + 0x0149] %asi, %r26
	.word 0xfec4c020  ! 716: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r31
	.word 0xfec5e068  ! 720: LDSWA_I	ldswa	[%r23, + 0x0068] %asi, %r31
cpu_intr_2_60:
	setx	0x210105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe45210d  ! 723: LDSW_I	ldsw	[%r20 + 0x010d], %r31
	.word 0xfedd200a  ! 724: LDXA_I	ldxa	[%r20, + 0x000a] %asi, %r31
	.word 0xfa54a059  ! 726: LDSH_I	ldsh	[%r18 + 0x0059], %r29
	.word 0xfc4d4000  ! 729: LDSB_R	ldsb	[%r21 + %r0], %r30
cpu_intr_2_61:
	setx	0x21022d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_54:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_54), 16, 16)) -> intp(2, 0, 3)
	.word 0xfac50020  ! 736: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r29
iob_intr_2_55:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_55), 16, 16)) -> intp(2, 0, 36)
iob_intr_2_56:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_56), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf64de119  ! 740: LDSB_I	ldsb	[%r23 + 0x0119], %r27
T2_asi_reg_wr_29:
	mov	0x18, %r14
	.word 0xf0f38e40  ! 741: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_2_57:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_57), 16, 16)) -> intp(2, 0, 1f)
	.word 0xfa5c4000  ! 746: LDX_R	ldx	[%r17 + %r0], %r29
	.word 0xfc150000  ! 747: LDUH_R	lduh	[%r20 + %r0], %r30
	.word 0xb625204a  ! 748: SUB_I	sub 	%r20, 0x004a, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
cpu_intr_2_62:
	setx	0x20108, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982e48  ! 754: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e48, %hpstate
	.word 0xbead609e  ! 755: ANDNcc_I	andncc 	%r21, 0x009e, %r31
cpu_intr_2_63:
	setx	0x210117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb82c0000  ! 757: ANDN_R	andn 	%r16, %r0, %r28
	.word 0xf05c0000  ! 759: LDX_R	ldx	[%r16 + %r0], %r24
iob_intr_2_58:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_58), 16, 16)) -> intp(2, 0, 26)
	.word 0xf845e07b  ! 768: LDSW_I	ldsw	[%r23 + 0x007b], %r28
T2_asi_reg_wr_30:
	mov	0x3c0, %r14
	.word 0xf4f38400  ! 770: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_2_64:
	setx	0x230322, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_59:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_59), 16, 16)) -> intp(2, 0, 16)
	.word 0xf00c2077  ! 775: LDUB_I	ldub	[%r16 + 0x0077], %r24
	.word 0xf614a17d  ! 777: LDUH_I	lduh	[%r18 + 0x017d], %r27
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982d08  ! 780: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d08, %hpstate
	.word 0xf6cd0020  ! 781: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r27
cpu_intr_2_65:
	setx	0x22033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa45e137  ! 786: LDSW_I	ldsw	[%r23 + 0x0137], %r29
	.word 0xfc1520b0  ! 788: LDUH_I	lduh	[%r20 + 0x00b0], %r30
	.word 0xf60d21c1  ! 789: LDUB_I	ldub	[%r20 + 0x01c1], %r27
	.word 0xb9348000  ! 791: SRL_R	srl 	%r18, %r0, %r28
iob_intr_2_60:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_60), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_wr_31:
	mov	0x3c2, %r14
	.word 0xfef38e80  ! 799: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6450000  ! 807: LDSW_R	ldsw	[%r20 + %r0], %r27
	.word 0xbcc461f8  ! 812: ADDCcc_I	addccc 	%r17, 0x01f8, %r30
iob_intr_2_61:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_61), 16, 16)) -> intp(2, 0, 19)
	.word 0xfc84a073  ! 814: LDUWA_I	lduwa	[%r18, + 0x0073] %asi, %r30
	.word 0xfec50020  ! 815: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r31
cpu_intr_2_66:
	setx	0x230230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45de0ed  ! 820: LDX_I	ldx	[%r23 + 0x00ed], %r26
	.word 0xb4b50000  ! 825: ORNcc_R	orncc 	%r20, %r0, %r26
	.word 0xf8c4c020  ! 826: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r28
	.word 0xf694c020  ! 829: LDUHA_R	lduha	[%r19, %r0] 0x01, %r27
	.word 0xf814c000  ! 830: LDUH_R	lduh	[%r19 + %r0], %r28
iob_intr_2_62:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_62), 16, 16)) -> intp(2, 0, 1a)
	.word 0xfa4cc000  ! 833: LDSB_R	ldsb	[%r19 + %r0], %r29
iob_intr_2_63:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_63), 16, 16)) -> intp(2, 0, 3f)
T2_asi_reg_rd_33:
	mov	0x3c8, %r14
	.word 0xf0db8e60  ! 836: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T2_asi_reg_wr_32:
	mov	0xb, %r14
	.word 0xf2f38e60  ! 843: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_2_67:
	setx	0x20235, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_64:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_64), 16, 16)) -> intp(2, 0, 2d)
T2_asi_reg_rd_34:
	mov	0x19, %r14
	.word 0xfedb89e0  ! 849: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T2_asi_reg_wr_33:
	mov	0x3c0, %r14
	.word 0xf4f38400  ! 850: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_2_65:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_65), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_68:
	setx	0x220203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2dce136  ! 858: LDXA_I	ldxa	[%r19, + 0x0136] %asi, %r25
cpu_intr_2_69:
	setx	0x230103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44561b0  ! 861: LDSW_I	ldsw	[%r21 + 0x01b0], %r26
T2_asi_reg_wr_34:
	mov	0x6, %r14
	.word 0xf8f38400  ! 863: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb48d61ce  ! 867: ANDcc_I	andcc 	%r21, 0x01ce, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_70:
	setx	0x200034, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_35:
	mov	0x3c3, %r14
	.word 0xfcf38e60  ! 875: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_2_71:
	setx	0x230316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba8c8000  ! 883: ANDcc_R	andcc 	%r18, %r0, %r29
	.word 0xfa04c000  ! 888: LDUW_R	lduw	[%r19 + %r0], %r29
	ta	T_CHANGE_TO_TL0
	.word 0xb6b520fc  ! 892: SUBCcc_I	orncc 	%r20, 0x00fc, %r27
	.word 0xfcd5e01c  ! 894: LDSHA_I	ldsha	[%r23, + 0x001c] %asi, %r30
	.word 0xfe550000  ! 895: LDSH_R	ldsh	[%r20 + %r0], %r31
T2_asi_reg_wr_36:
	mov	0x28, %r14
	.word 0xfcf38400  ! 896: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_2_66:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_66), 16, 16)) -> intp(2, 0, 29)
	.word 0xf8cd0020  ! 899: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r28
	.word 0xb61521f7  ! 900: OR_I	or 	%r20, 0x01f7, %r27
T2_asi_reg_wr_37:
	mov	0x9, %r14
	.word 0xf4f38e40  ! 901: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf0154000  ! 902: LDUH_R	lduh	[%r21 + %r0], %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_rd_35:
	mov	0x1e, %r14
	.word 0xfadb8e40  ! 906: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbe0da046  ! 907: AND_I	and 	%r22, 0x0046, %r31
T2_asi_reg_rd_36:
	mov	0x33, %r14
	.word 0xf8db8400  ! 909: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xfe15a19f  ! 910: LDUH_I	lduh	[%r22 + 0x019f], %r31
	.word 0xf0d561ce  ! 911: LDSHA_I	ldsha	[%r21, + 0x01ce] %asi, %r24
iob_intr_2_67:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_67), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_72:
	setx	0x260236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf095a045  ! 916: LDUHA_I	lduha	[%r22, + 0x0045] %asi, %r24
	ta	T_CHANGE_TO_TL1
iob_intr_2_68:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_68), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf0c4e0b1  ! 920: LDSWA_I	ldswa	[%r19, + 0x00b1] %asi, %r24
cpu_intr_2_73:
	setx	0x270032, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983c50  ! 923: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c50, %hpstate
cpu_intr_2_74:
	setx	0x26003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa15e0cf  ! 926: LDUH_I	lduh	[%r23 + 0x00cf], %r29
cpu_intr_2_75:
	setx	0x260037, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf4c4e08c  ! 943: LDSWA_I	ldswa	[%r19, + 0x008c] %asi, %r26
	.word 0xfe8c21f5  ! 945: LDUBA_I	lduba	[%r16, + 0x01f5] %asi, %r31
	.word 0xfecc603f  ! 949: LDSBA_I	ldsba	[%r17, + 0x003f] %asi, %r31
	.word 0xfadc2021  ! 951: LDXA_I	ldxa	[%r16, + 0x0021] %asi, %r29
T2_asi_reg_wr_38:
	mov	0x1f, %r14
	.word 0xfcf38e60  ! 953: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
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
T2_asi_reg_rd_37:
	mov	0x19, %r14
	.word 0xfcdb84a0  ! 957: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T2_asi_reg_rd_38:
	mov	0x19, %r14
	.word 0xfcdb8e40  ! 958: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_2_69:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_69), 16, 16)) -> intp(2, 0, 3e)
	.word 0xfcc5c020  ! 960: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r30
T2_asi_reg_wr_39:
	mov	0x3c1, %r14
	.word 0xf8f38e80  ! 965: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T2_asi_reg_wr_40:
	mov	0x16, %r14
	.word 0xf2f38e60  ! 966: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf84d8000  ! 968: LDSB_R	ldsb	[%r22 + %r0], %r28
T2_asi_reg_wr_41:
	mov	0x20, %r14
	.word 0xf4f38e40  ! 969: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_70:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_70), 16, 16)) -> intp(2, 0, 31)
	.word 0xf84ce05c  ! 971: LDSB_I	ldsb	[%r19 + 0x005c], %r28
	.word 0xbc8561f4  ! 972: ADDcc_I	addcc 	%r21, 0x01f4, %r30
	.word 0xf80c0000  ! 974: LDUB_R	ldub	[%r16 + %r0], %r28
T2_asi_reg_rd_39:
	mov	0x1a, %r14
	.word 0xfadb8e40  ! 975: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf4cc4020  ! 976: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r26
	.word 0xbca5c000  ! 977: SUBcc_R	subcc 	%r23, %r0, %r30
cpu_intr_2_76:
	setx	0x25001c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_71:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_71), 16, 16)) -> intp(2, 0, 17)
cpu_intr_2_77:
	setx	0x26033f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_78:
	setx	0x26011f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_72:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_72), 16, 16)) -> intp(2, 0, 17)
	.word 0xb61ca0f6  ! 985: XOR_I	xor 	%r18, 0x00f6, %r27
T2_asi_reg_rd_40:
	mov	0x32, %r14
	.word 0xf6db8e80  ! 986: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_2_79:
	setx	0x240313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb22ca1d6  ! 989: ANDN_I	andn 	%r18, 0x01d6, %r25
T2_asi_reg_wr_42:
	mov	0x3c0, %r14
	.word 0xf6f38e80  ! 990: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_2_73:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_73), 16, 16)) -> intp(2, 0, 21)
	.word 0xbb354000  ! 995: SRL_R	srl 	%r21, %r0, %r29
	.word 0xf6844020  ! 996: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r27
T2_asi_reg_wr_43:
	mov	0x2f, %r14
	.word 0xf2f38e80  ! 997: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xfac48020  ! 998: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r29
T2_asi_reg_rd_41:
	mov	0x3c3, %r14
	.word 0xf8db89e0  ! 1001: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_2_74:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_74), 16, 16)) -> intp(2, 0, 3a)
T2_asi_reg_wr_44:
	mov	0x3c4, %r14
	.word 0xf8f38e60  ! 1007: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf4554000  ! 1010: LDSH_R	ldsh	[%r21 + %r0], %r26
	.word 0xfa448000  ! 1014: LDSW_R	ldsw	[%r18 + %r0], %r29
iob_intr_2_75:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_75), 16, 16)) -> intp(2, 0, 2)
T2_asi_reg_rd_42:
	mov	0x22, %r14
	.word 0xfedb8e40  ! 1016: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T2_asi_reg_wr_45:
	mov	0x30, %r14
	.word 0xf6f384a0  ! 1017: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xfe15e1c8  ! 1018: LDUH_I	lduh	[%r23 + 0x01c8], %r31
iob_intr_2_76:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_76), 16, 16)) -> intp(2, 0, 10)
	.word 0xb02560b7  ! 1021: SUB_I	sub 	%r21, 0x00b7, %r24
T2_asi_reg_wr_46:
	mov	0x3c7, %r14
	.word 0xfcf38e40  ! 1022: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb83d20a0  ! 1023: XNOR_I	xnor 	%r20, 0x00a0, %r28
iob_intr_2_77:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_77), 16, 16)) -> intp(2, 0, 4)
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_43:
	mov	0x3c3, %r14
	.word 0xfcdb8e80  ! 1027: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xfc546109  ! 1030: LDSH_I	ldsh	[%r17 + 0x0109], %r30
	.word 0xfccce07e  ! 1032: LDSBA_I	ldsba	[%r19, + 0x007e] %asi, %r30
	ta	T_CHANGE_NONHPRIV
	.word 0xfc04203a  ! 1037: LDUW_I	lduw	[%r16 + 0x003a], %r30
	.word 0xf005e08f  ! 1038: LDUW_I	lduw	[%r23 + 0x008f], %r24
cpu_intr_2_80:
	setx	0x26011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8d5e0aa  ! 1040: LDSHA_I	ldsha	[%r23, + 0x00aa] %asi, %r28
T2_asi_reg_wr_47:
	mov	0x2a, %r14
	.word 0xf6f38e40  ! 1045: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_wr_48:
	mov	0x3c6, %r14
	.word 0xf8f38400  ! 1047: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_2_81:
	setx	0x260104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc350000  ! 1050: SUBC_R	orn 	%r20, %r0, %r30
	.word 0xf84d8000  ! 1051: LDSB_R	ldsb	[%r22 + %r0], %r28
	.word 0xfe55a045  ! 1052: LDSH_I	ldsh	[%r22 + 0x0045], %r31
iob_intr_2_78:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_78), 16, 16)) -> intp(2, 0, 35)
cpu_intr_2_82:
	setx	0x240333, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_83:
	setx	0x27003d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_79:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_79), 16, 16)) -> intp(2, 0, 10)
	.word 0xf8554000  ! 1066: LDSH_R	ldsh	[%r21 + %r0], %r28
	.word 0xf6d5c020  ! 1067: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r27
	.word 0xf0456072  ! 1069: LDSW_I	ldsw	[%r21 + 0x0072], %r24
iob_intr_2_80:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_80), 16, 16)) -> intp(2, 0, 1a)
	.word 0xfc54c000  ! 1075: LDSH_R	ldsh	[%r19 + %r0], %r30
	.word 0xbd641800  ! 1078: MOVcc_R	<illegal instruction>
iob_intr_2_81:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_81), 16, 16)) -> intp(2, 0, 11)
	.word 0xfec50020  ! 1080: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r31
iob_intr_2_82:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_82), 16, 16)) -> intp(2, 0, 12)
cpu_intr_2_84:
	setx	0x250210, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_85:
	setx	0x240108, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_86:
	setx	0x270026, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_87:
	setx	0x250033, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_44:
	mov	0x14, %r14
	.word 0xfadb8e40  ! 1097: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_2_88:
	setx	0x24011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe04a0ec  ! 1100: LDUW_I	lduw	[%r18 + 0x00ec], %r31
cpu_intr_2_89:
	setx	0x24011c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_49:
	mov	0x3c5, %r14
	.word 0xfcf38e40  ! 1103: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb20de1a1  ! 1108: AND_I	and 	%r23, 0x01a1, %r25
cpu_intr_2_90:
	setx	0x24002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6d52066  ! 1112: LDSHA_I	ldsha	[%r20, + 0x0066] %asi, %r27
iob_intr_2_83:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_83), 16, 16)) -> intp(2, 0, 8)
cpu_intr_2_91:
	setx	0x240301, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_92:
	setx	0x260216, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_50:
	mov	0x2, %r14
	.word 0xf6f38400  ! 1126: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb0a4e1d6  ! 1127: SUBcc_I	subcc 	%r19, 0x01d6, %r24
cpu_intr_2_93:
	setx	0x260210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfecc6004  ! 1134: LDSBA_I	ldsba	[%r17, + 0x0004] %asi, %r31
T2_asi_reg_wr_51:
	mov	0x3, %r14
	.word 0xf0f38e60  ! 1136: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_2_94:
	setx	0x270218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc35a024  ! 1140: SUBC_I	orn 	%r22, 0x0024, %r30
	.word 0xf24d60f0  ! 1141: LDSB_I	ldsb	[%r21 + 0x00f0], %r25
	.word 0xf6440000  ! 1142: LDSW_R	ldsw	[%r16 + %r0], %r27
T2_asi_reg_rd_45:
	mov	0x13, %r14
	.word 0xf0db8400  ! 1143: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf4440000  ! 1144: LDSW_R	ldsw	[%r16 + %r0], %r26
	.word 0xfe140000  ! 1145: LDUH_R	lduh	[%r16 + %r0], %r31
iob_intr_2_84:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_84), 16, 16)) -> intp(2, 0, 3e)
	.word 0xb53c3001  ! 1149: SRAX_I	srax	%r16, 0x0001, %r26
cpu_intr_2_95:
	setx	0x27001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_46:
	mov	0xc, %r14
	.word 0xf6db84a0  ! 1153: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_2_85:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_85), 16, 16)) -> intp(2, 0, 38)
	.word 0xf20dc000  ! 1155: LDUB_R	ldub	[%r23 + %r0], %r25
	.word 0xfa950020  ! 1158: LDUHA_R	lduha	[%r20, %r0] 0x01, %r29
	.word 0xf25d203d  ! 1159: LDX_I	ldx	[%r20 + 0x003d], %r25
	.word 0xf815c000  ! 1164: LDUH_R	lduh	[%r23 + %r0], %r28
T2_asi_reg_rd_47:
	mov	0x2e, %r14
	.word 0xfcdb8400  ! 1165: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xfa4421ab  ! 1167: LDSW_I	ldsw	[%r16 + 0x01ab], %r29
T2_asi_reg_wr_52:
	mov	0x26, %r14
	.word 0xf6f389e0  ! 1168: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xfe8d8020  ! 1169: LDUBA_R	lduba	[%r22, %r0] 0x01, %r31
iob_intr_2_86:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_86), 16, 16)) -> intp(2, 0, 2f)
cpu_intr_2_96:
	setx	0x260238, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xba24a01b  ! 1179: SUB_I	sub 	%r18, 0x001b, %r29
iob_intr_2_87:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_87), 16, 16)) -> intp(2, 0, 2)
	.word 0xf84d0000  ! 1183: LDSB_R	ldsb	[%r20 + %r0], %r28
iob_intr_2_88:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_88), 16, 16)) -> intp(2, 0, 12)
iob_intr_2_89:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_89), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_90:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_90), 16, 16)) -> intp(2, 0, 32)
cpu_intr_2_97:
	setx	0x250335, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_53:
	mov	0x3c1, %r14
	.word 0xf8f38400  ! 1188: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf0444000  ! 1189: LDSW_R	ldsw	[%r17 + %r0], %r24
	ta	T_CHANGE_HPRIV
iob_intr_2_91:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_91), 16, 16)) -> intp(2, 0, 22)
	.word 0xf6950020  ! 1195: LDUHA_R	lduha	[%r20, %r0] 0x01, %r27
	ta	T_CHANGE_TO_TL1
iob_intr_2_92:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_92), 16, 16)) -> intp(2, 0, 1b)
T2_asi_reg_rd_48:
	mov	0x7, %r14
	.word 0xf4db8e40  ! 1199: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_49:
	mov	0x33, %r14
	.word 0xf4db8e80  ! 1202: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T2_asi_reg_rd_50:
	mov	0x2d, %r14
	.word 0xf2db8e60  ! 1204: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T2_asi_reg_rd_51:
	mov	0x1c, %r14
	.word 0xfcdb8e60  ! 1205: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xfcdd21c1  ! 1209: LDXA_I	ldxa	[%r20, + 0x01c1] %asi, %r30
T2_asi_reg_wr_54:
	mov	0x3c4, %r14
	.word 0xf6f384a0  ! 1214: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T2_asi_reg_rd_52:
	mov	0x3c0, %r14
	.word 0xfedb8e40  ! 1215: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf8cd0020  ! 1216: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r28
	.word 0xfe142106  ! 1221: LDUH_I	lduh	[%r16 + 0x0106], %r31
T2_asi_reg_rd_53:
	mov	0x3, %r14
	.word 0xfedb8400  ! 1222: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xfc040000  ! 1224: LDUW_R	lduw	[%r16 + %r0], %r30
iob_intr_2_93:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_93), 16, 16)) -> intp(2, 0, 3d)
	.word 0xba24c000  ! 1229: SUB_R	sub 	%r19, %r0, %r29
	.word 0xfe144000  ! 1231: LDUH_R	lduh	[%r17 + %r0], %r31
iob_intr_2_94:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_94), 16, 16)) -> intp(2, 0, 33)
iob_intr_2_95:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_95), 16, 16)) -> intp(2, 0, 28)
	.word 0xb6252013  ! 1234: SUB_I	sub 	%r20, 0x0013, %r27
iob_intr_2_96:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_96), 16, 16)) -> intp(2, 0, 1b)
	.word 0xb93ce001  ! 1237: SRA_I	sra 	%r19, 0x0001, %r28
iob_intr_2_97:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_97), 16, 16)) -> intp(2, 0, 16)
T2_asi_reg_wr_55:
	mov	0x26, %r14
	.word 0xfaf389e0  ! 1239: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf6956023  ! 1240: LDUHA_I	lduha	[%r21, + 0x0023] %asi, %r27
	.word 0xf0cc20e3  ! 1241: LDSBA_I	ldsba	[%r16, + 0x00e3] %asi, %r24
T2_asi_reg_wr_56:
	mov	0x1d, %r14
	.word 0xf6f38400  ! 1244: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T2_asi_reg_wr_57:
	mov	0x2b, %r14
	.word 0xf8f38e40  ! 1248: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_wr_58:
	mov	0x5, %r14
	.word 0xf6f389e0  ! 1250: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_2_98:
	setx	0x250103, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_98:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_98), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_99:
	setx	0x27031a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_59:
	mov	0x3c5, %r14
	.word 0xf0f384a0  ! 1254: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T2_asi_reg_wr_60:
	mov	0x14, %r14
	.word 0xf8f384a0  ! 1255: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T2_asi_reg_wr_61:
	mov	0x3c6, %r14
	.word 0xf4f384a0  ! 1256: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_2_100:
	setx	0x260020, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_54:
	mov	0x28, %r14
	.word 0xfedb8e40  ! 1260: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb150c000  ! 1261: RDPR_TT	<illegal instruction>
iob_intr_2_99:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_99), 16, 16)) -> intp(2, 0, 37)
	.word 0xf65d0000  ! 1263: LDX_R	ldx	[%r20 + %r0], %r27
iob_intr_2_100:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_100), 16, 16)) -> intp(2, 0, 3)
	.word 0xfa550000  ! 1269: LDSH_R	ldsh	[%r20 + %r0], %r29
	.word 0xfed58020  ! 1270: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r31
	.word 0xf64d20d4  ! 1272: LDSB_I	ldsb	[%r20 + 0x00d4], %r27
iob_intr_2_101:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_101), 16, 16)) -> intp(2, 0, 22)
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983cc0  ! 1274: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc0, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x8f902001  ! 1277: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xa1902001  ! 1278: WRPR_GL_I	wrpr	%r0, 0x0001, %-
iob_intr_2_102:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_102), 16, 16)) -> intp(2, 0, 31)
	.word 0xf2d5617e  ! 1280: LDSHA_I	ldsha	[%r21, + 0x017e] %asi, %r25
	.word 0xf8846004  ! 1281: LDUWA_I	lduwa	[%r17, + 0x0004] %asi, %r28
cpu_intr_2_101:
	setx	0x24030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_102:
	setx	0x25013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc94c000  ! 1287: ORcc_R	orcc 	%r19, %r0, %r30
cpu_intr_2_103:
	setx	0x24023d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_103:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_103), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_rd_55:
	mov	0xe, %r14
	.word 0xf2db89e0  ! 1293: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_2_104:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_104), 16, 16)) -> intp(2, 0, 34)
	ta	T_CHANGE_TO_TL0
iob_intr_2_105:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_105), 16, 16)) -> intp(2, 0, 7)
iob_intr_2_106:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_106), 16, 16)) -> intp(2, 0, 1c)
	.word 0xfa84a027  ! 1302: LDUWA_I	lduwa	[%r18, + 0x0027] %asi, %r29
	.word 0xf6142105  ! 1303: LDUH_I	lduh	[%r16 + 0x0105], %r27
	.word 0xbec4e0aa  ! 1304: ADDCcc_I	addccc 	%r19, 0x00aa, %r31
	ta	T_CHANGE_TO_TL0
iob_intr_2_107:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_107), 16, 16)) -> intp(2, 0, 30)
	.word 0xf2c4a172  ! 1311: LDSWA_I	ldswa	[%r18, + 0x0172] %asi, %r25
iob_intr_2_108:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_108), 16, 16)) -> intp(2, 0, 26)
	.word 0xfc556044  ! 1315: LDSH_I	ldsh	[%r21 + 0x0044], %r30
iob_intr_2_109:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_109), 16, 16)) -> intp(2, 0, 4)
	.word 0xb52d8000  ! 1317: SLL_R	sll 	%r22, %r0, %r26
	.word 0xfe04213a  ! 1319: LDUW_I	lduw	[%r16 + 0x013a], %r31
iob_intr_2_110:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_110), 16, 16)) -> intp(2, 0, 4)
T2_asi_reg_rd_56:
	mov	0x28, %r14
	.word 0xf4db8e40  ! 1321: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf05cc000  ! 1322: LDX_R	ldx	[%r19 + %r0], %r24
	.word 0xf0c46126  ! 1323: LDSWA_I	ldswa	[%r17, + 0x0126] %asi, %r24
	.word 0xb6350000  ! 1324: ORN_R	orn 	%r20, %r0, %r27
	.word 0xfa5ce1f5  ! 1326: LDX_I	ldx	[%r19 + 0x01f5], %r29
	.word 0xfc4c8000  ! 1328: LDSB_R	ldsb	[%r18 + %r0], %r30
	.word 0xfc04e141  ! 1329: LDUW_I	lduw	[%r19 + 0x0141], %r30
	.word 0xfa850020  ! 1332: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r29
iob_intr_2_111:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_111), 16, 16)) -> intp(2, 0, 10)
	ta	T_CHANGE_HPRIV
iob_intr_2_112:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_112), 16, 16)) -> intp(2, 0, 3)
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983f4a  ! 1336: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f4a, %hpstate
T2_asi_reg_wr_62:
	mov	0x24, %r14
	.word 0xf2f389e0  ! 1337: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf085a12d  ! 1338: LDUWA_I	lduwa	[%r22, + 0x012d] %asi, %r24
iob_intr_2_113:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_113), 16, 16)) -> intp(2, 0, 25)
	.word 0xf6552176  ! 1340: LDSH_I	ldsh	[%r20 + 0x0176], %r27
	.word 0xfe846017  ! 1346: LDUWA_I	lduwa	[%r17, + 0x0017] %asi, %r31
T2_asi_reg_rd_57:
	mov	0x36, %r14
	.word 0xfedb8e60  ! 1347: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf2454000  ! 1350: LDSW_R	ldsw	[%r21 + %r0], %r25
cpu_intr_2_104:
	setx	0x270324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa45c000  ! 1355: LDSW_R	ldsw	[%r23 + %r0], %r29
iob_intr_2_114:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_114), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_115:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_115), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_wr_63:
	mov	0x22, %r14
	.word 0xf8f38e80  ! 1361: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T2_asi_reg_wr_64:
	mov	0x2a, %r14
	.word 0xf4f389e0  ! 1362: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_2_105:
	setx	0x260021, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_116:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_116), 16, 16)) -> intp(2, 0, 29)
	ta	T_CHANGE_NONHPRIV
	.word 0xb41d4000  ! 1368: XOR_R	xor 	%r21, %r0, %r26
T2_asi_reg_wr_65:
	mov	0x26, %r14
	.word 0xfcf38e60  ! 1372: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T2_asi_reg_rd_58:
	mov	0x36, %r14
	.word 0xf4db8400  ! 1373: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xfe140000  ! 1374: LDUH_R	lduh	[%r16 + %r0], %r31
cpu_intr_2_106:
	setx	0x280000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25d61e9  ! 1378: LDX_I	ldx	[%r21 + 0x01e9], %r25
cpu_intr_2_107:
	setx	0x280126, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_59:
	mov	0x3c2, %r14
	.word 0xf2db89e0  ! 1383: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_2_117:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_117), 16, 16)) -> intp(2, 0, 26)
cpu_intr_2_108:
	setx	0x29001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_66:
	mov	0x14, %r14
	.word 0xf4f38e60  ! 1391: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xfc4d203d  ! 1394: LDSB_I	ldsb	[%r20 + 0x003d], %r30
	.word 0xf245c000  ! 1395: LDSW_R	ldsw	[%r23 + %r0], %r25
cpu_intr_2_109:
	setx	0x2a023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4cde14e  ! 1400: LDSBA_I	ldsba	[%r23, + 0x014e] %asi, %r26
	.word 0xf6dc21fc  ! 1401: LDXA_I	ldxa	[%r16, + 0x01fc] %asi, %r27
	.word 0xb57ca401  ! 1403: MOVR_I	movre	%r18, 0x1, %r26
	.word 0xf485e0b5  ! 1404: LDUWA_I	lduwa	[%r23, + 0x00b5] %asi, %r26
T2_asi_reg_wr_67:
	mov	0x3c3, %r14
	.word 0xf2f38e60  ! 1405: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_68:
	mov	0x3c7, %r14
	.word 0xf2f38e40  ! 1408: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfcc42128  ! 1410: LDSWA_I	ldswa	[%r16, + 0x0128] %asi, %r30
T2_asi_reg_wr_69:
	mov	0xc, %r14
	.word 0xf8f389e0  ! 1411: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0x8d9561d0  ! 1413: WRPR_PSTATE_I	wrpr	%r21, 0x01d0, %pstate
	.word 0xb37ca401  ! 1415: MOVR_I	movre	%r18, 0x1, %r25
	.word 0xfa4dc000  ! 1417: LDSB_R	ldsb	[%r23 + %r0], %r29
iob_intr_2_118:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_118), 16, 16)) -> intp(2, 0, f)
	.word 0xfc456140  ! 1420: LDSW_I	ldsw	[%r21 + 0x0140], %r30
iob_intr_2_119:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_119), 16, 16)) -> intp(2, 0, 7)
	.word 0xf6d5a117  ! 1422: LDSHA_I	ldsha	[%r22, + 0x0117] %asi, %r27
	.word 0xf00c207c  ! 1423: LDUB_I	ldub	[%r16 + 0x007c], %r24
	ta	T_CHANGE_TO_TL1
iob_intr_2_120:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_120), 16, 16)) -> intp(2, 0, 13)
	.word 0xb014e18a  ! 1428: OR_I	or 	%r19, 0x018a, %r24
T2_asi_reg_rd_60:
	mov	0x3c0, %r14
	.word 0xfedb8e80  ! 1432: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_2_121:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_121), 16, 16)) -> intp(2, 0, 3b)
	.word 0xf0550000  ! 1439: LDSH_R	ldsh	[%r20 + %r0], %r24
	.word 0xf8954020  ! 1440: LDUHA_R	lduha	[%r21, %r0] 0x01, %r28
	.word 0xb13da001  ! 1442: SRA_I	sra 	%r22, 0x0001, %r24
	.word 0xfa84e000  ! 1443: LDUWA_I	lduwa	[%r19, + 0x0000] %asi, %r29
	.word 0xf2dce1b3  ! 1444: LDXA_I	ldxa	[%r19, + 0x01b3] %asi, %r25
cpu_intr_2_110:
	setx	0x28001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf6cc20fc  ! 1448: LDSBA_I	ldsba	[%r16, + 0x00fc] %asi, %r27
	ta	T_CHANGE_HPRIV
	.word 0xfac54020  ! 1453: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r29
T2_asi_reg_wr_70:
	mov	0xf, %r14
	.word 0xfaf389e0  ! 1454: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_2_122:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_122), 16, 16)) -> intp(2, 0, 38)
cpu_intr_2_111:
	setx	0x29020e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_112:
	setx	0x290215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfed4a11a  ! 1460: LDSHA_I	ldsha	[%r18, + 0x011a] %asi, %r31
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_61:
	mov	0xf, %r14
	.word 0xfadb84a0  ! 1470: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T2_asi_reg_wr_71:
	mov	0x12, %r14
	.word 0xf4f389e0  ! 1474: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf01420cc  ! 1476: LDUH_I	lduh	[%r16 + 0x00cc], %r24
	.word 0xf2d5a10d  ! 1477: LDSHA_I	ldsha	[%r22, + 0x010d] %asi, %r25
cpu_intr_2_113:
	setx	0x280302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8d61d7  ! 1480: LDUBA_I	lduba	[%r21, + 0x01d7] %asi, %r31
	.word 0xb52c3001  ! 1481: SLLX_I	sllx	%r16, 0x0001, %r26
	.word 0xf6cc4020  ! 1482: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r27
	.word 0xfe15e0fe  ! 1489: LDUH_I	lduh	[%r23 + 0x00fe], %r31
T2_asi_reg_wr_72:
	mov	0x24, %r14
	.word 0xf2f389e0  ! 1491: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xfe856162  ! 1492: LDUWA_I	lduwa	[%r21, + 0x0162] %asi, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc4c4000  ! 1496: LDSB_R	ldsb	[%r17 + %r0], %r30
	.word 0xb12dc000  ! 1497: SLL_R	sll 	%r23, %r0, %r24
	.word 0xb5641800  ! 1499: MOVcc_R	<illegal instruction>
iob_intr_2_123:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_123), 16, 16)) -> intp(2, 0, 10)
iob_intr_2_124:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_124), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_rd_62:
	mov	0x19, %r14
	.word 0xfadb8e40  ! 1507: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf6cc0020  ! 1510: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r27
T2_asi_reg_wr_73:
	mov	0x16, %r14
	.word 0xfaf384a0  ! 1511: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_2_114:
	setx	0x2a030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf40d0000  ! 1513: LDUB_R	ldub	[%r20 + %r0], %r26
	.word 0xf4940020  ! 1514: LDUHA_R	lduha	[%r16, %r0] 0x01, %r26
	ta	T_CHANGE_TO_TL0
	.word 0xfc542100  ! 1518: LDSH_I	ldsh	[%r16 + 0x0100], %r30
T2_asi_reg_wr_74:
	mov	0x3c0, %r14
	.word 0xf2f38e40  ! 1519: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_125:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_125), 16, 16)) -> intp(2, 0, 24)
iob_intr_2_126:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_126), 16, 16)) -> intp(2, 0, 3f)
	.word 0xb0a42107  ! 1525: SUBcc_I	subcc 	%r16, 0x0107, %r24
	.word 0xf6dde17f  ! 1527: LDXA_I	ldxa	[%r23, + 0x017f] %asi, %r27
cpu_intr_2_115:
	setx	0x28020b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_127:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_127), 16, 16)) -> intp(2, 0, 23)
	.word 0xb4b48000  ! 1531: SUBCcc_R	orncc 	%r18, %r0, %r26
	.word 0xfe8ce057  ! 1534: LDUBA_I	lduba	[%r19, + 0x0057] %asi, %r31
iob_intr_2_128:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_128), 16, 16)) -> intp(2, 0, 33)
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982b5a  ! 1540: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5a, %hpstate
	.word 0xfc948020  ! 1541: LDUHA_R	lduha	[%r18, %r0] 0x01, %r30
iob_intr_2_129:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_129), 16, 16)) -> intp(2, 0, 3f)
	.word 0xfa540000  ! 1549: LDSH_R	ldsh	[%r16 + %r0], %r29
T2_asi_reg_wr_75:
	mov	0x1d, %r14
	.word 0xfaf389e0  ! 1550: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf6cc0020  ! 1553: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r27
	.word 0xb8454000  ! 1555: ADDC_R	addc 	%r21, %r0, %r28
cpu_intr_2_116:
	setx	0x2b001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf645c000  ! 1559: LDSW_R	ldsw	[%r23 + %r0], %r27
iob_intr_2_130:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_130), 16, 16)) -> intp(2, 0, 34)
T2_asi_reg_rd_63:
	mov	0x31, %r14
	.word 0xf6db8e40  ! 1562: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_2_131:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_131), 16, 16)) -> intp(2, 0, 1e)
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982d0a  ! 1570: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d0a, %hpstate
iob_intr_2_132:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_132), 16, 16)) -> intp(2, 0, 30)
iob_intr_2_133:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_133), 16, 16)) -> intp(2, 0, 26)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_rd_64:
	mov	0x3c2, %r14
	.word 0xfcdb8400  ! 1578: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T2_asi_reg_rd_65:
	mov	0x22, %r14
	.word 0xf0db84a0  ! 1579: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb5500000  ! 1580: RDPR_TPC	<illegal instruction>
	.word 0xa1902002  ! 1581: WRPR_GL_I	wrpr	%r0, 0x0002, %-
cpu_intr_2_117:
	setx	0x2a002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb01de100  ! 1585: XOR_I	xor 	%r23, 0x0100, %r24
	.word 0xfc448000  ! 1587: LDSW_R	ldsw	[%r18 + %r0], %r30
	.word 0xbf3cb001  ! 1589: SRAX_I	srax	%r18, 0x0001, %r31
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983b8a  ! 1590: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b8a, %hpstate
	.word 0xfc458000  ! 1592: LDSW_R	ldsw	[%r22 + %r0], %r30
cpu_intr_2_118:
	setx	0x2a0003, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_119:
	setx	0x280110, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_120:
	setx	0x2a001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0d4c020  ! 1602: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r24
cpu_intr_2_121:
	setx	0x2b0113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf7c0400  ! 1604: MOVR_R	movre	%r16, %r0, %r31
	.word 0xf244e1fb  ! 1605: LDSW_I	ldsw	[%r19 + 0x01fb], %r25
	.word 0xf6d4e1b3  ! 1607: LDSHA_I	ldsha	[%r19, + 0x01b3] %asi, %r27
	.word 0xf8046128  ! 1610: LDUW_I	lduw	[%r17 + 0x0128], %r28
T2_asi_reg_wr_76:
	mov	0x10, %r14
	.word 0xfcf38e40  ! 1611: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_122:
	setx	0x29022a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_77:
	mov	0x23, %r14
	.word 0xf0f38e60  ! 1615: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb52db001  ! 1616: SLLX_I	sllx	%r22, 0x0001, %r26
	.word 0xf6c4c020  ! 1618: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4d56055  ! 1621: LDSHA_I	ldsha	[%r21, + 0x0055] %asi, %r26
T2_asi_reg_wr_78:
	mov	0x38, %r14
	.word 0xf8f38400  ! 1622: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_2_123:
	setx	0x2a0304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0d8000  ! 1631: LDUB_R	ldub	[%r22 + %r0], %r29
cpu_intr_2_124:
	setx	0x280125, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_125:
	setx	0x290115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa548000  ! 1641: LDSH_R	ldsh	[%r18 + %r0], %r29
T2_asi_reg_rd_66:
	mov	0x3c1, %r14
	.word 0xfadb8e60  ! 1643: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf2cc4020  ! 1644: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r25
	.word 0xf4dc21d9  ! 1646: LDXA_I	ldxa	[%r16, + 0x01d9] %asi, %r26
	.word 0xf68d21e2  ! 1647: LDUBA_I	lduba	[%r20, + 0x01e2] %asi, %r27
iob_intr_2_134:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_134), 16, 16)) -> intp(2, 0, 6)
iob_intr_2_135:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_135), 16, 16)) -> intp(2, 0, 19)
T2_asi_reg_wr_79:
	mov	0x3c6, %r14
	.word 0xf4f389e0  ! 1657: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_2_126:
	setx	0x290127, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_127:
	setx	0x280206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb2d6001  ! 1667: SLL_I	sll 	%r21, 0x0001, %r29
	.word 0xfa548000  ! 1669: LDSH_R	ldsh	[%r18 + %r0], %r29
	.word 0xfa1461b1  ! 1672: LDUH_I	lduh	[%r17 + 0x01b1], %r29
	.word 0xf2c48020  ! 1675: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r25
T2_asi_reg_wr_80:
	mov	0xf, %r14
	.word 0xfaf38400  ! 1676: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T2_asi_reg_rd_67:
	mov	0x24, %r14
	.word 0xfcdb8400  ! 1677: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T2_asi_reg_wr_81:
	mov	0x3c0, %r14
	.word 0xf4f384a0  ! 1678: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xfe4c2120  ! 1681: LDSB_I	ldsb	[%r16 + 0x0120], %r31
iob_intr_2_136:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_136), 16, 16)) -> intp(2, 0, 3c)
	ta	T_CHANGE_TO_TL0
	.word 0xb2b50000  ! 1685: ORNcc_R	orncc 	%r20, %r0, %r25
	.word 0xb4c420d7  ! 1686: ADDCcc_I	addccc 	%r16, 0x00d7, %r26
	.word 0xfedca05e  ! 1687: LDXA_I	ldxa	[%r18, + 0x005e] %asi, %r31
T2_asi_reg_rd_68:
	mov	0x36, %r14
	.word 0xfcdb89e0  ! 1689: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xfccca1ca  ! 1691: LDSBA_I	ldsba	[%r18, + 0x01ca] %asi, %r30
cpu_intr_2_128:
	setx	0x2a0302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0cd4020  ! 1693: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r24
	.word 0xfed4a0f0  ! 1695: LDSHA_I	ldsha	[%r18, + 0x00f0] %asi, %r31
	.word 0xfc144000  ! 1700: LDUH_R	lduh	[%r17 + %r0], %r30
	.word 0xf0d4a0e5  ! 1701: LDSHA_I	ldsha	[%r18, + 0x00e5] %asi, %r24
	.word 0xf4558000  ! 1704: LDSH_R	ldsh	[%r22 + %r0], %r26
	.word 0xfc5c4000  ! 1709: LDX_R	ldx	[%r17 + %r0], %r30
cpu_intr_2_129:
	setx	0x2b023e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_137:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_137), 16, 16)) -> intp(2, 0, 0)
	.word 0xb48c8000  ! 1713: ANDcc_R	andcc 	%r18, %r0, %r26
	.word 0xfec48020  ! 1716: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r31
iob_intr_2_138:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_138), 16, 16)) -> intp(2, 0, 16)
	.word 0xfc858020  ! 1718: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r30
T2_asi_reg_wr_82:
	mov	0x2, %r14
	.word 0xf8f38e60  ! 1719: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_2_130:
	setx	0x29020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8140000  ! 1721: LDUH_R	lduh	[%r16 + %r0], %r28
iob_intr_2_139:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_139), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_wr_83:
	mov	0x2d, %r14
	.word 0xfef38e60  ! 1727: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfc5c0000  ! 1730: LDX_R	ldx	[%r16 + %r0], %r30
	.word 0xb7350000  ! 1735: SRL_R	srl 	%r20, %r0, %r27
cpu_intr_2_131:
	setx	0x2b0227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc94a16e  ! 1737: LDUHA_I	lduha	[%r18, + 0x016e] %asi, %r30
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982818  ! 1738: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0818, %hpstate
T2_asi_reg_rd_69:
	mov	0x36, %r14
	.word 0xfadb8e40  ! 1740: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982a02  ! 1742: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a02, %hpstate
	.word 0xfc444000  ! 1743: LDSW_R	ldsw	[%r17 + %r0], %r30
T2_asi_reg_wr_84:
	mov	0xb, %r14
	.word 0xf6f384a0  ! 1744: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T2_asi_reg_rd_70:
	mov	0x3c2, %r14
	.word 0xf0db8e60  ! 1747: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xfa458000  ! 1748: LDSW_R	ldsw	[%r22 + %r0], %r29
	.word 0xb1508000  ! 1750: RDPR_TSTATE	<illegal instruction>
iob_intr_2_140:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_140), 16, 16)) -> intp(2, 0, 2c)
	.word 0xfa1521c5  ! 1753: LDUH_I	lduh	[%r20 + 0x01c5], %r29
iob_intr_2_141:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_141), 16, 16)) -> intp(2, 0, 3c)
iob_intr_2_142:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_142), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf055a124  ! 1764: LDSH_I	ldsh	[%r22 + 0x0124], %r24
	.word 0xf68d0020  ! 1765: LDUBA_R	lduba	[%r20, %r0] 0x01, %r27
T2_asi_reg_rd_71:
	mov	0x3c6, %r14
	.word 0xf6db8400  ! 1767: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_2_132:
	setx	0x2a030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44d4000  ! 1771: LDSB_R	ldsb	[%r21 + %r0], %r26
	.word 0xf4cd4020  ! 1774: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r26
T2_asi_reg_wr_85:
	mov	0x3c5, %r14
	.word 0xf0f38e80  ! 1775: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf80ca0ed  ! 1777: LDUB_I	ldub	[%r18 + 0x00ed], %r28
	.word 0xf8144000  ! 1778: LDUH_R	lduh	[%r17 + %r0], %r28
	.word 0xfe4c4000  ! 1779: LDSB_R	ldsb	[%r17 + %r0], %r31
cpu_intr_2_133:
	setx	0x29002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0954020  ! 1782: LDUHA_R	lduha	[%r21, %r0] 0x01, %r24
	.word 0xf6544000  ! 1784: LDSH_R	ldsh	[%r17 + %r0], %r27
T2_asi_reg_wr_86:
	mov	0x3c8, %r14
	.word 0xfef38e60  ! 1785: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_2_143:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_143), 16, 16)) -> intp(2, 0, 2a)
iob_intr_2_144:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_144), 16, 16)) -> intp(2, 0, 27)
	.word 0xf084c020  ! 1788: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r24
	.word 0xba348000  ! 1791: SUBC_R	orn 	%r18, %r0, %r29
	.word 0xf05c20d8  ! 1792: LDX_I	ldx	[%r16 + 0x00d8], %r24
cpu_intr_2_134:
	setx	0x290009, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_72:
	mov	0x3c4, %r14
	.word 0xf2db8400  ! 1797: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982aca  ! 1798: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0aca, %hpstate
	.word 0xf8d48020  ! 1799: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r28
	.word 0xf044c000  ! 1810: LDSW_R	ldsw	[%r19 + %r0], %r24
T2_asi_reg_rd_73:
	mov	0x3, %r14
	.word 0xfadb8e60  ! 1812: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbb342001  ! 1814: SRL_I	srl 	%r16, 0x0001, %r29
	ta	T_CHANGE_NONHPRIV
	.word 0xf045e166  ! 1819: LDSW_I	ldsw	[%r23 + 0x0166], %r24
	.word 0xb8a40000  ! 1822: SUBcc_R	subcc 	%r16, %r0, %r28
T2_asi_reg_rd_74:
	mov	0x2b, %r14
	.word 0xf2db84a0  ! 1823: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf295c020  ! 1827: LDUHA_R	lduha	[%r23, %r0] 0x01, %r25
	.word 0xf6844020  ! 1828: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r27
T2_asi_reg_rd_75:
	mov	0x36, %r14
	.word 0xfedb84a0  ! 1830: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb57c2401  ! 1831: MOVR_I	movre	%r16, 0x1, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_wr_87:
	mov	0x3c0, %r14
	.word 0xfcf389e0  ! 1836: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T2_asi_reg_rd_76:
	mov	0x2, %r14
	.word 0xfadb8e40  ! 1837: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb535e001  ! 1838: SRL_I	srl 	%r23, 0x0001, %r26
	.word 0xf684a09c  ! 1839: LDUWA_I	lduwa	[%r18, + 0x009c] %asi, %r27
T2_asi_reg_rd_77:
	mov	0x2e, %r14
	.word 0xf0db8e80  ! 1841: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T2_asi_reg_wr_88:
	mov	0x36, %r14
	.word 0xfef384a0  ! 1842: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf684c020  ! 1844: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r27
T2_asi_reg_wr_89:
	mov	0x25, %r14
	.word 0xf8f384a0  ! 1846: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf204c000  ! 1848: LDUW_R	lduw	[%r19 + %r0], %r25
iob_intr_2_145:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_145), 16, 16)) -> intp(2, 0, 34)
	.word 0xb13d7001  ! 1850: SRAX_I	srax	%r21, 0x0001, %r24
	.word 0xf8c5c020  ! 1852: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r28
	.word 0xfc95c020  ! 1854: LDUHA_R	lduha	[%r23, %r0] 0x01, %r30
iob_intr_2_146:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_146), 16, 16)) -> intp(2, 0, 8)
T2_asi_reg_rd_78:
	mov	0x36, %r14
	.word 0xf4db8e40  ! 1856: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfa5cc000  ! 1857: LDX_R	ldx	[%r19 + %r0], %r29
	.word 0xb17c0400  ! 1858: MOVR_R	movre	%r16, %r0, %r24
	.word 0xf28c6138  ! 1860: LDUBA_I	lduba	[%r17, + 0x0138] %asi, %r25
iob_intr_2_147:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_147), 16, 16)) -> intp(2, 0, 37)
T2_asi_reg_rd_79:
	mov	0x3, %r14
	.word 0xfedb84a0  ! 1870: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_2_148:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_148), 16, 16)) -> intp(2, 0, 22)
	.word 0xbf2d2001  ! 1873: SLL_I	sll 	%r20, 0x0001, %r31
iob_intr_2_149:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_149), 16, 16)) -> intp(2, 0, c)
iob_intr_2_150:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_150), 16, 16)) -> intp(2, 0, 2f)
	.word 0xfc5461ff  ! 1877: LDSH_I	ldsh	[%r17 + 0x01ff], %r30
	.word 0xf00c8000  ! 1879: LDUB_R	ldub	[%r18 + %r0], %r24
	ta	T_CHANGE_TO_TL0
cpu_intr_2_135:
	setx	0x2f0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983aca  ! 1884: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1aca, %hpstate
iob_intr_2_151:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_151), 16, 16)) -> intp(2, 0, 37)
cpu_intr_2_136:
	setx	0x2e0204, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_80:
	mov	0x10, %r14
	.word 0xfcdb8e40  ! 1895: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_rd_81:
	mov	0x3c8, %r14
	.word 0xfedb8e60  ! 1898: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_2_152:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_152), 16, 16)) -> intp(2, 0, c)
	.word 0xfedde125  ! 1904: LDXA_I	ldxa	[%r23, + 0x0125] %asi, %r31
	.word 0xf0c58020  ! 1907: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r24
T2_asi_reg_wr_90:
	mov	0x1c, %r14
	.word 0xf6f38e60  ! 1908: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_2_137:
	setx	0x2f0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8dc020  ! 1911: LDUBA_R	lduba	[%r23, %r0] 0x01, %r31
iob_intr_2_153:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_153), 16, 16)) -> intp(2, 0, 23)
	.word 0xbc95e1ca  ! 1915: ORcc_I	orcc 	%r23, 0x01ca, %r30
	.word 0xb6b42116  ! 1916: SUBCcc_I	orncc 	%r16, 0x0116, %r27
	.word 0xb4158000  ! 1917: OR_R	or 	%r22, %r0, %r26
T2_asi_reg_wr_91:
	mov	0x2a, %r14
	.word 0xfef38e40  ! 1918: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_154:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_154), 16, 16)) -> intp(2, 0, 3d)
cpu_intr_2_138:
	setx	0x2f0217, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_139:
	setx	0x2c021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0c48020  ! 1928: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r24
	ta	T_CHANGE_HPRIV
cpu_intr_2_140:
	setx	0x2c033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983cc2  ! 1931: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc2, %hpstate
T2_asi_reg_wr_92:
	mov	0x25, %r14
	.word 0xfef38e40  ! 1934: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_155:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_155), 16, 16)) -> intp(2, 0, 39)
	.word 0xb7643801  ! 1936: MOVcc_I	<illegal instruction>
	.word 0xb0848000  ! 1937: ADDcc_R	addcc 	%r18, %r0, %r24
	.word 0xf6d44020  ! 1941: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r27
cpu_intr_2_141:
	setx	0x2f003a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_82:
	mov	0x3c1, %r14
	.word 0xf6db8400  ! 1944: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xfcc40020  ! 1948: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r30
T2_asi_reg_wr_93:
	mov	0x36, %r14
	.word 0xf8f38400  ! 1953: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xfc45206f  ! 1954: LDSW_I	ldsw	[%r20 + 0x006f], %r30
cpu_intr_2_142:
	setx	0x2d0103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba852114  ! 1956: ADDcc_I	addcc 	%r20, 0x0114, %r29
	.word 0xf48ca113  ! 1958: LDUBA_I	lduba	[%r18, + 0x0113] %asi, %r26
cpu_intr_2_143:
	setx	0x2d0215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0d52110  ! 1963: LDSHA_I	ldsha	[%r20, + 0x0110] %asi, %r24
T2_asi_reg_wr_94:
	mov	0x23, %r14
	.word 0xfef38e40  ! 1965: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_wr_95:
	mov	0x21, %r14
	.word 0xf4f38e40  ! 1968: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_144:
	setx	0x2c002a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_96:
	mov	0x0, %r14
	.word 0xf6f38400  ! 1972: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xfc95a09f  ! 1973: LDUHA_I	lduha	[%r22, + 0x009f] %asi, %r30
iob_intr_2_156:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_156), 16, 16)) -> intp(2, 0, 3)
iob_intr_2_157:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_157), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_145:
	setx	0x2f0327, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_146:
	setx	0x2c0116, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_97:
	mov	0x18, %r14
	.word 0xfef389e0  ! 1980: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf0140000  ! 1981: LDUH_R	lduh	[%r16 + %r0], %r24
cpu_intr_2_147:
	setx	0x2d0322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_148:
	setx	0x2f022e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_158:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_158), 16, 16)) -> intp(2, 0, 9)
T2_asi_reg_rd_83:
	mov	0x34, %r14
	.word 0xf6db84a0  ! 1988: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_2_149:
	setx	0x2f031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf055c000  ! 1991: LDSH_R	ldsh	[%r23 + %r0], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_98:
	mov	0x17, %r14
	.word 0xf2f38e40  ! 1994: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbeb5a0e1  ! 1995: SUBCcc_I	orncc 	%r22, 0x00e1, %r31
cpu_intr_2_150:
	setx	0x2e0300, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
iob_intr_2_159:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_159), 16, 16)) -> intp(2, 0, 19)
T2_asi_reg_wr_99:
	mov	0x3c2, %r14
	.word 0xfaf38e60  ! 2009: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T2_asi_reg_rd_84:
	mov	0x3c1, %r14
	.word 0xfedb8e40  ! 2010: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfa5ce0f7  ! 2012: LDX_I	ldx	[%r19 + 0x00f7], %r29
cpu_intr_2_151:
	setx	0x2e033c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_152:
	setx	0x2f000b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_85:
	mov	0x3c5, %r14
	.word 0xf6db8e80  ! 2021: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_2_153:
	setx	0x2e0019, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_160:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_160), 16, 16)) -> intp(2, 0, 3)
	.word 0xf0450000  ! 2026: LDSW_R	ldsw	[%r20 + %r0], %r24
cpu_intr_2_154:
	setx	0x2c0204, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_100:
	mov	0x1e, %r14
	.word 0xf6f38e60  ! 2028: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xfe04a09b  ! 2030: LDUW_I	lduw	[%r18 + 0x009b], %r31
	.word 0xfa456182  ! 2032: LDSW_I	ldsw	[%r21 + 0x0182], %r29
cpu_intr_2_155:
	setx	0x2c0215, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_86:
	mov	0x7, %r14
	.word 0xfadb8e40  ! 2040: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf854c000  ! 2043: LDSH_R	ldsh	[%r19 + %r0], %r28
iob_intr_2_161:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_161), 16, 16)) -> intp(2, 0, 1c)
iob_intr_2_162:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_162), 16, 16)) -> intp(2, 0, 15)
	.word 0xf6cc0020  ! 2049: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r27
	.word 0xfa154000  ! 2054: LDUH_R	lduh	[%r21 + %r0], %r29
	.word 0xf2948020  ! 2057: LDUHA_R	lduha	[%r18, %r0] 0x01, %r25
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982c80  ! 2058: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c80, %hpstate
iob_intr_2_163:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_163), 16, 16)) -> intp(2, 0, 3)
T2_asi_reg_wr_101:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 2060: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982d80  ! 2064: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d80, %hpstate
iob_intr_2_164:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_164), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf0942161  ! 2066: LDUHA_I	lduha	[%r16, + 0x0161] %asi, %r24
	.word 0x9195a16c  ! 2067: WRPR_PIL_I	wrpr	%r22, 0x016c, %pil
iob_intr_2_165:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_165), 16, 16)) -> intp(2, 0, 38)
	.word 0xf0dc2074  ! 2071: LDXA_I	ldxa	[%r16, + 0x0074] %asi, %r24
	.word 0xf2d44020  ! 2073: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r25
T2_asi_reg_wr_102:
	mov	0x11, %r14
	.word 0xf8f384a0  ! 2074: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_87:
	mov	0xe, %r14
	.word 0xf2db89e0  ! 2080: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T2_asi_reg_wr_103:
	mov	0x2c, %r14
	.word 0xf4f38e40  ! 2081: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_166:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_166), 16, 16)) -> intp(2, 0, 33)
	ta	T_CHANGE_TO_TL1
iob_intr_2_167:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_167), 16, 16)) -> intp(2, 0, 5)
	.word 0xbec48000  ! 2097: ADDCcc_R	addccc 	%r18, %r0, %r31
	.word 0xf4542037  ! 2098: LDSH_I	ldsh	[%r16 + 0x0037], %r26
	.word 0xf2c5c020  ! 2100: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r25
	.word 0xb8a4a148  ! 2101: SUBcc_I	subcc 	%r18, 0x0148, %r28
iob_intr_2_168:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_168), 16, 16)) -> intp(2, 0, 7)
	.word 0xf444a029  ! 2103: LDSW_I	ldsw	[%r18 + 0x0029], %r26
	.word 0xf85da17d  ! 2105: LDX_I	ldx	[%r22 + 0x017d], %r28
	.word 0xfc140000  ! 2106: LDUH_R	lduh	[%r16 + %r0], %r30
T2_asi_reg_rd_88:
	mov	0xb, %r14
	.word 0xf2db84a0  ! 2107: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_2_169:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_169), 16, 16)) -> intp(2, 0, 5)
cpu_intr_2_156:
	setx	0x2e0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
iob_intr_2_170:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_170), 16, 16)) -> intp(2, 0, f)
T2_asi_reg_wr_104:
	mov	0x3c4, %r14
	.word 0xf8f38e80  ! 2121: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb495e0b8  ! 2122: ORcc_I	orcc 	%r23, 0x00b8, %r26
cpu_intr_2_157:
	setx	0x2f0231, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_171:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_171), 16, 16)) -> intp(2, 0, 32)
	.word 0xfc94c020  ! 2125: LDUHA_R	lduha	[%r19, %r0] 0x01, %r30
cpu_intr_2_158:
	setx	0x2f0301, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_159:
	setx	0x2d030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc054000  ! 2129: ADD_R	add 	%r21, %r0, %r30
	.word 0xf685c020  ! 2130: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r27
	.word 0xf4d40020  ! 2131: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r26
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983ed2  ! 2133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ed2, %hpstate
iob_intr_2_172:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_172), 16, 16)) -> intp(2, 0, f)
	.word 0xfe040000  ! 2136: LDUW_R	lduw	[%r16 + %r0], %r31
iob_intr_2_173:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_173), 16, 16)) -> intp(2, 0, 38)
iob_intr_2_174:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_174), 16, 16)) -> intp(2, 0, 2)
	.word 0xf415209a  ! 2139: LDUH_I	lduh	[%r20 + 0x009a], %r26
T2_asi_reg_rd_89:
	mov	0x3c3, %r14
	.word 0xf4db84a0  ! 2140: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_2_175:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_175), 16, 16)) -> intp(2, 0, 15)
iob_intr_2_176:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_176), 16, 16)) -> intp(2, 0, f)
cpu_intr_2_160:
	setx	0x2f011d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_90:
	mov	0x2d, %r14
	.word 0xf0db84a0  ! 2146: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_2_161:
	setx	0x2d020a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_105:
	mov	0x3c3, %r14
	.word 0xf0f38e60  ! 2149: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T2_asi_reg_wr_106:
	mov	0x3c5, %r14
	.word 0xfaf38e40  ! 2150: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb88c0000  ! 2152: ANDcc_R	andcc 	%r16, %r0, %r28
	.word 0xf614608d  ! 2159: LDUH_I	lduh	[%r17 + 0x008d], %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf88de0d3  ! 2164: LDUBA_I	lduba	[%r23, + 0x00d3] %asi, %r28
	.word 0xfecde1d1  ! 2166: LDSBA_I	ldsba	[%r23, + 0x01d1] %asi, %r31
iob_intr_2_177:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_177), 16, 16)) -> intp(2, 0, 15)
	.word 0xf2cc0020  ! 2169: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r25
	.word 0xf25c60ef  ! 2172: LDX_I	ldx	[%r17 + 0x00ef], %r25
	.word 0xf444c000  ! 2174: LDSW_R	ldsw	[%r19 + %r0], %r26
iob_intr_2_178:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_178), 16, 16)) -> intp(2, 0, 2b)
	.word 0xfe548000  ! 2178: LDSH_R	ldsh	[%r18 + %r0], %r31
	.word 0xfec46013  ! 2179: LDSWA_I	ldswa	[%r17, + 0x0013] %asi, %r31
	.word 0xf4554000  ! 2180: LDSH_R	ldsh	[%r21 + %r0], %r26
cpu_intr_2_162:
	setx	0x2c0221, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_163:
	setx	0x2f0232, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_91:
	mov	0x3c2, %r14
	.word 0xf8db8e40  ! 2186: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	setx	data_start_4, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983c48  ! 2192: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c48, %hpstate
	.word 0xf614a0b0  ! 2193: LDUH_I	lduh	[%r18 + 0x00b0], %r27
	.word 0xf0148000  ! 2194: LDUH_R	lduh	[%r18 + %r0], %r24
iob_intr_2_179:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_179), 16, 16)) -> intp(2, 0, 20)
	ta	T_CHANGE_HPRIV
	.word 0xf0554000  ! 2202: LDSH_R	ldsh	[%r21 + %r0], %r24
	.word 0xfa8c2114  ! 2203: LDUBA_I	lduba	[%r16, + 0x0114] %asi, %r29
T2_asi_reg_wr_107:
	mov	0x8, %r14
	.word 0xfcf38e40  ! 2204: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbd3d7001  ! 2211: SRAX_I	srax	%r21, 0x0001, %r30
	.word 0xfc0c4000  ! 2212: LDUB_R	ldub	[%r17 + %r0], %r30
	.word 0xfe554000  ! 2213: LDSH_R	ldsh	[%r21 + %r0], %r31
T2_asi_reg_wr_108:
	mov	0x9, %r14
	.word 0xf2f38e40  ! 2214: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_180:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_180), 16, 16)) -> intp(2, 0, 10)
	.word 0xbe9ce117  ! 2218: XORcc_I	xorcc 	%r19, 0x0117, %r31
T2_asi_reg_wr_109:
	mov	0x6, %r14
	.word 0xfcf38e80  ! 2219: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xfe4dc000  ! 2221: LDSB_R	ldsb	[%r23 + %r0], %r31
	.word 0xf255614b  ! 2224: LDSH_I	ldsh	[%r21 + 0x014b], %r25
	.word 0xbb350000  ! 2225: SRL_R	srl 	%r20, %r0, %r29
	.word 0xb32d9000  ! 2227: SLLX_R	sllx	%r22, %r0, %r25
	.word 0xf45521db  ! 2228: LDSH_I	ldsh	[%r20 + 0x01db], %r26
	.word 0xfcd56054  ! 2230: LDSHA_I	ldsha	[%r21, + 0x0054] %asi, %r30
T2_asi_reg_wr_110:
	mov	0x3c7, %r14
	.word 0xf0f38e60  ! 2232: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	ta	T_CHANGE_NONHPRIV
iob_intr_2_181:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_181), 16, 16)) -> intp(2, 0, 5)
	.word 0xf04521a4  ! 2236: LDSW_I	ldsw	[%r20 + 0x01a4], %r24
	.word 0xf21561be  ! 2239: LDUH_I	lduh	[%r21 + 0x01be], %r25
	.word 0xfa0dc000  ! 2244: LDUB_R	ldub	[%r23 + %r0], %r29
T2_asi_reg_rd_92:
	mov	0x16, %r14
	.word 0xf6db8e40  ! 2245: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_rd_93:
	mov	0x15, %r14
	.word 0xf6db84a0  ! 2246: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa458000  ! 2249: LDSW_R	ldsw	[%r22 + %r0], %r29
iob_intr_2_182:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_182), 16, 16)) -> intp(2, 0, 26)
T2_asi_reg_wr_111:
	mov	0x17, %r14
	.word 0xf8f38e40  ! 2251: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf40c8000  ! 2252: LDUB_R	ldub	[%r18 + %r0], %r26
cpu_intr_2_164:
	setx	0x2d023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcd48020  ! 2257: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r30
	.word 0xfc55e00c  ! 2258: LDSH_I	ldsh	[%r23 + 0x000c], %r30
	.word 0xfa8d4020  ! 2259: LDUBA_R	lduba	[%r21, %r0] 0x01, %r29
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982e80  ! 2260: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e80, %hpstate
	.word 0xfc15201b  ! 2261: LDUH_I	lduh	[%r20 + 0x001b], %r30
T2_asi_reg_rd_94:
	mov	0x16, %r14
	.word 0xfedb8e60  ! 2263: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982b8a  ! 2264: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b8a, %hpstate
iob_intr_2_183:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_183), 16, 16)) -> intp(2, 0, 3d)
cpu_intr_2_165:
	setx	0x2f0317, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_95:
	mov	0x34, %r14
	.word 0xf4db8400  ! 2270: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xba4421e7  ! 2271: ADDC_I	addc 	%r16, 0x01e7, %r29
T2_asi_reg_rd_96:
	mov	0x3c1, %r14
	.word 0xf2db8e80  ! 2273: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T2_asi_reg_rd_97:
	mov	0x1c, %r14
	.word 0xf4db89e0  ! 2275: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_2_184:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_184), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf68d61db  ! 2283: LDUBA_I	lduba	[%r21, + 0x01db] %asi, %r27
cpu_intr_2_166:
	setx	0x320003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53cb001  ! 2285: SRAX_I	srax	%r18, 0x0001, %r26
	.word 0xf04c8000  ! 2287: LDSB_R	ldsb	[%r18 + %r0], %r24
cpu_intr_2_167:
	setx	0x31000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeb4e0a0  ! 2292: ORNcc_I	orncc 	%r19, 0x00a0, %r31
iob_intr_2_185:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_185), 16, 16)) -> intp(2, 0, 3)
iob_intr_2_186:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_186), 16, 16)) -> intp(2, 0, 4)
	.word 0xbcc5612e  ! 2297: ADDCcc_I	addccc 	%r21, 0x012e, %r30
	.word 0xf2d58020  ! 2300: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r25
iob_intr_2_187:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_187), 16, 16)) -> intp(2, 0, d)
T2_asi_reg_wr_112:
	mov	0xc, %r14
	.word 0xf4f38400  ! 2303: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983bc8  ! 2304: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc8, %hpstate
	.word 0xfcd54020  ! 2306: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r30
T2_asi_reg_wr_113:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 2307: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf6440000  ! 2308: LDSW_R	ldsw	[%r16 + %r0], %r27
	ta	T_CHANGE_HPRIV
iob_intr_2_188:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_188), 16, 16)) -> intp(2, 0, d)
	.word 0xb6844000  ! 2317: ADDcc_R	addcc 	%r17, %r0, %r27
iob_intr_2_189:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_189), 16, 16)) -> intp(2, 0, 15)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_114:
	mov	0x1b, %r14
	.word 0xfef389e0  ! 2327: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_2_190:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_190), 16, 16)) -> intp(2, 0, 3f)
cpu_intr_2_168:
	setx	0x31033f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_115:
	mov	0x15, %r14
	.word 0xf4f38400  ! 2331: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T2_asi_reg_wr_116:
	mov	0x5, %r14
	.word 0xfef384a0  ! 2333: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf4950020  ! 2334: LDUHA_R	lduha	[%r20, %r0] 0x01, %r26
iob_intr_2_191:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_191), 16, 16)) -> intp(2, 0, 24)
	.word 0xfac56093  ! 2336: LDSWA_I	ldswa	[%r21, + 0x0093] %asi, %r29
iob_intr_2_192:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_192), 16, 16)) -> intp(2, 0, 35)
	.word 0xf45de106  ! 2340: LDX_I	ldx	[%r23 + 0x0106], %r26
	.word 0xf254a001  ! 2343: LDSH_I	ldsh	[%r18 + 0x0001], %r25
	.word 0xf85ce030  ! 2344: LDX_I	ldx	[%r19 + 0x0030], %r28
	.word 0xf454e040  ! 2346: LDSH_I	ldsh	[%r19 + 0x0040], %r26
T2_asi_reg_rd_98:
	mov	0x3c0, %r14
	.word 0xf0db8e40  ! 2348: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T2_asi_reg_rd_99:
	mov	0x33, %r14
	.word 0xf8db8e40  ! 2350: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfc84c020  ! 2352: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r30
cpu_intr_2_169:
	setx	0x33032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4054000  ! 2356: LDUW_R	lduw	[%r21 + %r0], %r26
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983b1a  ! 2358: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b1a, %hpstate
cpu_intr_2_170:
	setx	0x310308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf044a014  ! 2360: LDSW_I	ldsw	[%r18 + 0x0014], %r24
cpu_intr_2_171:
	setx	0x300029, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_172:
	setx	0x330330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44dc000  ! 2365: LDSB_R	ldsb	[%r23 + %r0], %r26
iob_intr_2_193:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_193), 16, 16)) -> intp(2, 0, d)
iob_intr_2_194:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_194), 16, 16)) -> intp(2, 0, 37)
iob_intr_2_195:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_195), 16, 16)) -> intp(2, 0, 35)
	.word 0xf60c8000  ! 2371: LDUB_R	ldub	[%r18 + %r0], %r27
iob_intr_2_196:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_196), 16, 16)) -> intp(2, 0, 28)
	.word 0xfa4dc000  ! 2374: LDSB_R	ldsb	[%r23 + %r0], %r29
cpu_intr_2_173:
	setx	0x310207, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982e42  ! 2378: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e42, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_174:
	setx	0x320211, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_175:
	setx	0x31022e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_197:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_197), 16, 16)) -> intp(2, 0, 0)
T2_asi_reg_rd_100:
	mov	0x2, %r14
	.word 0xf4db8e40  ! 2385: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_rd_101:
	mov	0x3c8, %r14
	.word 0xf0db8e60  ! 2387: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf4c461c2  ! 2389: LDSWA_I	ldswa	[%r17, + 0x01c2] %asi, %r26
	.word 0xfe840020  ! 2390: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_176:
	setx	0x300226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0c2061  ! 2395: LDUB_I	ldub	[%r16 + 0x0061], %r29
	.word 0xf2448000  ! 2396: LDSW_R	ldsw	[%r18 + %r0], %r25
	.word 0xf2058000  ! 2397: LDUW_R	lduw	[%r22 + %r0], %r25
iob_intr_2_198:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_198), 16, 16)) -> intp(2, 0, 38)
T2_asi_reg_rd_102:
	mov	0x35, %r14
	.word 0xf6db84a0  ! 2401: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf2cda0e9  ! 2403: LDSBA_I	ldsba	[%r22, + 0x00e9] %asi, %r25
iob_intr_2_199:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_199), 16, 16)) -> intp(2, 0, 15)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_177:
	setx	0x31032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_117:
	mov	0xf, %r14
	.word 0xfef389e0  ! 2412: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_2_200:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_200), 16, 16)) -> intp(2, 0, 0)
	.word 0xf28c21b6  ! 2415: LDUBA_I	lduba	[%r16, + 0x01b6] %asi, %r25
cpu_intr_2_178:
	setx	0x320005, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_103:
	mov	0x3c5, %r14
	.word 0xfedb84a0  ! 2420: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_2_201:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_201), 16, 16)) -> intp(2, 0, 3e)
iob_intr_2_202:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_202), 16, 16)) -> intp(2, 0, e)
T2_asi_reg_wr_118:
	mov	0x3c0, %r14
	.word 0xf0f384a0  ! 2424: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_2_179:
	setx	0x32013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf89461c6  ! 2426: LDUHA_I	lduha	[%r17, + 0x01c6] %asi, %r28
T2_asi_reg_rd_104:
	mov	0x3c6, %r14
	.word 0xf0db8e60  ! 2428: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T2_asi_reg_wr_119:
	mov	0x0, %r14
	.word 0xfef384a0  ! 2430: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb12c5000  ! 2431: SLLX_R	sllx	%r17, %r0, %r24
	.word 0xf28d8020  ! 2432: LDUBA_R	lduba	[%r22, %r0] 0x01, %r25
	.word 0xf8048000  ! 2433: LDUW_R	lduw	[%r18 + %r0], %r28
	.word 0xf4840020  ! 2434: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r26
cpu_intr_2_180:
	setx	0x300308, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_105:
	mov	0xc, %r14
	.word 0xf0db89e0  ! 2436: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbebc4000  ! 2437: XNORcc_R	xnorcc 	%r17, %r0, %r31
T2_asi_reg_rd_106:
	mov	0x5, %r14
	.word 0xfcdb8e80  ! 2438: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_2_203:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_203), 16, 16)) -> intp(2, 0, 19)
	ta	T_CHANGE_NONHPRIV
iob_intr_2_204:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_204), 16, 16)) -> intp(2, 0, 6)
	.word 0xf6dd2040  ! 2445: LDXA_I	ldxa	[%r20, + 0x0040] %asi, %r27
cpu_intr_2_181:
	setx	0x30022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65de0f6  ! 2448: LDX_I	ldx	[%r23 + 0x00f6], %r27
T2_asi_reg_rd_107:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 2449: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfa0421dd  ! 2451: LDUW_I	lduw	[%r16 + 0x01dd], %r29
cpu_intr_2_182:
	setx	0x310327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcd50020  ! 2455: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r30
	.word 0xf4050000  ! 2456: LDUW_R	lduw	[%r20 + %r0], %r26
	.word 0xf614c000  ! 2458: LDUH_R	lduh	[%r19 + %r0], %r27
T2_asi_reg_wr_120:
	mov	0x38, %r14
	.word 0xf4f38e60  ! 2460: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xba352061  ! 2462: ORN_I	orn 	%r20, 0x0061, %r29
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_121:
	mov	0x7, %r14
	.word 0xfaf384a0  ! 2468: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_2_183:
	setx	0x31030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_184:
	setx	0x300100, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_185:
	setx	0x31001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4de024  ! 2472: LDSB_I	ldsb	[%r23 + 0x0024], %r29
iob_intr_2_205:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_205), 16, 16)) -> intp(2, 0, 16)
	.word 0xf88c4020  ! 2474: LDUBA_R	lduba	[%r17, %r0] 0x01, %r28
	.word 0xfcc5e1ea  ! 2476: LDSWA_I	ldswa	[%r23, + 0x01ea] %asi, %r30
	.word 0xb805a1d0  ! 2477: ADD_I	add 	%r22, 0x01d0, %r28
	.word 0xbd355000  ! 2478: SRLX_R	srlx	%r21, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfadc2003  ! 2481: LDXA_I	ldxa	[%r16, + 0x0003] %asi, %r29
	.word 0xba04e1ad  ! 2482: ADD_I	add 	%r19, 0x01ad, %r29
cpu_intr_2_186:
	setx	0x310134, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_187:
	setx	0x300007, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_188:
	setx	0x33002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8048000  ! 2488: LDUW_R	lduw	[%r18 + %r0], %r28
	.word 0xf805a0ee  ! 2492: LDUW_I	lduw	[%r22 + 0x00ee], %r28
cpu_intr_2_189:
	setx	0x31033d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_108:
	mov	0xf, %r14
	.word 0xfadb89e0  ! 2497: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xfadce134  ! 2498: LDXA_I	ldxa	[%r19, + 0x0134] %asi, %r29
	.word 0xfed4a027  ! 2499: LDSHA_I	ldsha	[%r18, + 0x0027] %asi, %r31
	.word 0xba0c4000  ! 2503: AND_R	and 	%r17, %r0, %r29
	.word 0xb9641800  ! 2505: MOVcc_R	<illegal instruction>
T2_asi_reg_rd_109:
	mov	0x1, %r14
	.word 0xf8db89e0  ! 2506: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T2_asi_reg_rd_110:
	mov	0x22, %r14
	.word 0xf4db8e80  ! 2507: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_2_206:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_206), 16, 16)) -> intp(2, 0, 36)
T2_asi_reg_wr_122:
	mov	0x1e, %r14
	.word 0xf4f38e40  ! 2510: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_wr_123:
	mov	0x2f, %r14
	.word 0xf2f389e0  ! 2511: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_2_190:
	setx	0x30022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4140000  ! 2514: LDUH_R	lduh	[%r16 + %r0], %r26
T2_asi_reg_rd_111:
	mov	0x3c0, %r14
	.word 0xf4db84a0  ! 2516: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf64dc000  ! 2517: LDSB_R	ldsb	[%r23 + %r0], %r27
iob_intr_2_207:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_207), 16, 16)) -> intp(2, 0, 28)
cpu_intr_2_191:
	setx	0x33000d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_208:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_208), 16, 16)) -> intp(2, 0, 38)
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982d4a  ! 2534: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4a, %hpstate
	.word 0xf4c5e074  ! 2535: LDSWA_I	ldswa	[%r23, + 0x0074] %asi, %r26
	.word 0xf4dc608f  ! 2537: LDXA_I	ldxa	[%r17, + 0x008f] %asi, %r26
	.word 0xbf7c4400  ! 2538: MOVR_R	movre	%r17, %r0, %r31
iob_intr_2_209:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_209), 16, 16)) -> intp(2, 0, 1d)
T2_asi_reg_rd_112:
	mov	0x3c0, %r14
	.word 0xf2db84a0  ! 2540: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xfcc4c020  ! 2541: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r30
	.word 0xf20da014  ! 2543: LDUB_I	ldub	[%r22 + 0x0014], %r25
	.word 0xfed58020  ! 2546: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r31
T2_asi_reg_rd_113:
	mov	0x3c3, %r14
	.word 0xf8db8e60  ! 2547: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_2_210:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_210), 16, 16)) -> intp(2, 0, 2e)
iob_intr_2_211:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_211), 16, 16)) -> intp(2, 0, 3)
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983b92  ! 2551: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b92, %hpstate
cpu_intr_2_192:
	setx	0x300006, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_212:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_212), 16, 16)) -> intp(2, 0, 20)
T2_asi_reg_rd_114:
	mov	0x3c1, %r14
	.word 0xf2db89e0  ! 2555: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb735b001  ! 2558: SRLX_I	srlx	%r22, 0x0001, %r27
T2_asi_reg_wr_124:
	mov	0x35, %r14
	.word 0xf0f38e40  ! 2560: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_2_193:
	setx	0x33002b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_213:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_213), 16, 16)) -> intp(2, 0, 12)
iob_intr_2_214:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_214), 16, 16)) -> intp(2, 0, 11)
iob_intr_2_215:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_215), 16, 16)) -> intp(2, 0, 35)
	.word 0xb61cc000  ! 2565: XOR_R	xor 	%r19, %r0, %r27
iob_intr_2_216:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_216), 16, 16)) -> intp(2, 0, 13)
	ta	T_CHANGE_TO_TL0
	.word 0xfcc44020  ! 2577: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r30
iob_intr_2_217:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_217), 16, 16)) -> intp(2, 0, 37)
	.word 0xfa8d4020  ! 2582: LDUBA_R	lduba	[%r21, %r0] 0x01, %r29
cpu_intr_2_194:
	setx	0x300308, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_218:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_218), 16, 16)) -> intp(2, 0, 19)
cpu_intr_2_195:
	setx	0x320033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf255e1c3  ! 2590: LDSH_I	ldsh	[%r23 + 0x01c3], %r25
	.word 0xf60cc000  ! 2591: LDUB_R	ldub	[%r19 + %r0], %r27
cpu_intr_2_196:
	setx	0x330026, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_197:
	setx	0x310106, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_219:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_219), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf20d204c  ! 2595: LDUB_I	ldub	[%r20 + 0x004c], %r25
	.word 0xf2c520d1  ! 2596: LDSWA_I	ldswa	[%r20, + 0x00d1] %asi, %r25
iob_intr_2_220:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_220), 16, 16)) -> intp(2, 0, 2a)
T2_asi_reg_rd_115:
	mov	0xe, %r14
	.word 0xfedb8e60  ! 2598: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T2_asi_reg_wr_125:
	mov	0x5, %r14
	.word 0xf0f384a0  ! 2601: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf64d2043  ! 2602: LDSB_I	ldsb	[%r20 + 0x0043], %r27
	.word 0xfac50020  ! 2603: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r29
iob_intr_2_221:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_221), 16, 16)) -> intp(2, 0, 2b)
	.word 0xfec44020  ! 2605: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r31
T2_asi_reg_rd_116:
	mov	0x24, %r14
	.word 0xf6db8e60  ! 2606: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf8848020  ! 2608: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r28
iob_intr_2_222:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_222), 16, 16)) -> intp(2, 0, 7)
	.word 0xfe8c6143  ! 2612: LDUBA_I	lduba	[%r17, + 0x0143] %asi, %r31
T2_asi_reg_wr_126:
	mov	0x7, %r14
	.word 0xf4f38e80  ! 2614: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb6148000  ! 2617: OR_R	or 	%r18, %r0, %r27
	.word 0xfedce121  ! 2620: LDXA_I	ldxa	[%r19, + 0x0121] %asi, %r31
iob_intr_2_223:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_223), 16, 16)) -> intp(2, 0, 32)
cpu_intr_2_198:
	setx	0x33031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_224:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_224), 16, 16)) -> intp(2, 0, 2)
cpu_intr_2_199:
	setx	0x320314, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_225:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_225), 16, 16)) -> intp(2, 0, b)
	.word 0xfc948020  ! 2635: LDUHA_R	lduha	[%r18, %r0] 0x01, %r30
iob_intr_2_226:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_226), 16, 16)) -> intp(2, 0, 36)
	.word 0xfcc4e147  ! 2638: LDSWA_I	ldswa	[%r19, + 0x0147] %asi, %r30
T2_asi_reg_rd_117:
	mov	0x33, %r14
	.word 0xfadb8e40  ! 2639: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_wr_127:
	mov	0x38, %r14
	.word 0xf0f38e80  ! 2641: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbb2db001  ! 2642: SLLX_I	sllx	%r22, 0x0001, %r29
	.word 0xf4550000  ! 2644: LDSH_R	ldsh	[%r20 + %r0], %r26
	.word 0xf415c000  ! 2646: LDUH_R	lduh	[%r23 + %r0], %r26
cpu_intr_2_200:
	setx	0x330033, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_201:
	setx	0x310219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb42c2140  ! 2651: ANDN_I	andn 	%r16, 0x0140, %r26
	.word 0xf48c8020  ! 2652: LDUBA_R	lduba	[%r18, %r0] 0x01, %r26
iob_intr_2_227:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_227), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf694603b  ! 2657: LDUHA_I	lduha	[%r17, + 0x003b] %asi, %r27
	.word 0xf68d61c2  ! 2659: LDUBA_I	lduba	[%r21, + 0x01c2] %asi, %r27
	ta	T_CHANGE_TO_TL0
cpu_intr_2_202:
	setx	0x300309, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_203:
	setx	0x320230, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_128:
	mov	0x10, %r14
	.word 0xf6f38e40  ! 2666: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_2_228:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_228), 16, 16)) -> intp(2, 0, 2d)
iob_intr_2_229:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_229), 16, 16)) -> intp(2, 0, 1e)
cpu_intr_2_204:
	setx	0x33013e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_205:
	setx	0x300134, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_206:
	setx	0x33013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64dc000  ! 2676: LDSB_R	ldsb	[%r23 + %r0], %r27
	.word 0xf4c48020  ! 2680: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r26
	.word 0xf85ca1bf  ! 2682: LDX_I	ldx	[%r18 + 0x01bf], %r28
T2_asi_reg_rd_118:
	mov	0x32, %r14
	.word 0xf0db8e60  ! 2683: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_2_207:
	setx	0x330039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb134a001  ! 2685: SRL_I	srl 	%r18, 0x0001, %r24
	ta	T_CHANGE_TO_TL0
	.word 0xb01ce12f  ! 2691: XOR_I	xor 	%r19, 0x012f, %r24
T2_asi_reg_rd_119:
	mov	0x3c4, %r14
	.word 0xfedb89e0  ! 2693: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T2_asi_reg_rd_120:
	mov	0x0, %r14
	.word 0xfadb8400  ! 2694: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T2_asi_reg_wr_129:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 2696: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbf540000  ! 2697: RDPR_GL	<illegal instruction>
	.word 0xf455a0bc  ! 2698: LDSH_I	ldsh	[%r22 + 0x00bc], %r26
	.word 0xfa95a020  ! 2699: LDUHA_I	lduha	[%r22, + 0x0020] %asi, %r29
	.word 0xf05521a6  ! 2703: LDSH_I	ldsh	[%r20 + 0x01a6], %r24
	.word 0xbf7ce401  ! 2704: MOVR_I	movre	%r19, 0x1, %r31
cpu_intr_2_208:
	setx	0x330211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8940020  ! 2709: LDUHA_R	lduha	[%r16, %r0] 0x01, %r28
iob_intr_2_230:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_230), 16, 16)) -> intp(2, 0, 8)
cpu_intr_2_209:
	setx	0x330129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_210:
	setx	0x30031f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_211:
	setx	0x320111, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_231:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_231), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf04d4000  ! 2726: LDSB_R	ldsb	[%r21 + %r0], %r24
	.word 0xbf508000  ! 2729: RDPR_TSTATE	<illegal instruction>
iob_intr_2_232:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_232), 16, 16)) -> intp(2, 0, 26)
	.word 0xf2ccc020  ! 2732: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r25
	ta	T_CHANGE_HPRIV
iob_intr_2_233:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_233), 16, 16)) -> intp(2, 0, 2f)
cpu_intr_2_212:
	setx	0x350334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05ca1d2  ! 2745: LDX_I	ldx	[%r18 + 0x01d2], %r24
	.word 0xf88d8020  ! 2747: LDUBA_R	lduba	[%r22, %r0] 0x01, %r28
	.word 0xfcc561f5  ! 2748: LDSWA_I	ldswa	[%r21, + 0x01f5] %asi, %r30
	.word 0xf08dc020  ! 2749: LDUBA_R	lduba	[%r23, %r0] 0x01, %r24
T2_asi_reg_wr_130:
	mov	0x34, %r14
	.word 0xf4f384a0  ! 2751: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_2_234:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_234), 16, 16)) -> intp(2, 0, 26)
iob_intr_2_235:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_235), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_rd_121:
	mov	0x3c7, %r14
	.word 0xfadb8e40  ! 2762: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_2_236:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_236), 16, 16)) -> intp(2, 0, 39)
	.word 0xb03421e9  ! 2766: ORN_I	orn 	%r16, 0x01e9, %r24
cpu_intr_2_213:
	setx	0x360027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d5a043  ! 2772: LDSHA_I	ldsha	[%r22, + 0x0043] %asi, %r25
T2_asi_reg_rd_122:
	mov	0x35, %r14
	.word 0xfedb8e60  ! 2773: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T2_asi_reg_wr_131:
	mov	0x22, %r14
	.word 0xfcf38e40  ! 2774: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfacd0020  ! 2778: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r29
	.word 0xfc956089  ! 2780: LDUHA_I	lduha	[%r21, + 0x0089] %asi, %r30
T2_asi_reg_rd_123:
	mov	0x3, %r14
	.word 0xf8db84a0  ! 2781: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_2_237:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_237), 16, 16)) -> intp(2, 0, 3f)
	.word 0xb8858000  ! 2784: ADDcc_R	addcc 	%r22, %r0, %r28
cpu_intr_2_214:
	setx	0x340110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc140000  ! 2791: OR_R	or 	%r16, %r0, %r30
	.word 0xf0556195  ! 2792: LDSH_I	ldsh	[%r21 + 0x0195], %r24
T2_asi_reg_wr_132:
	mov	0x8, %r14
	.word 0xf0f384a0  ! 2797: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xfe550000  ! 2798: LDSH_R	ldsh	[%r20 + %r0], %r31
	.word 0xf4454000  ! 2804: LDSW_R	ldsw	[%r21 + %r0], %r26
cpu_intr_2_215:
	setx	0x340131, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_124:
	mov	0x1a, %r14
	.word 0xf6db8e40  ! 2808: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfc84a15f  ! 2809: LDUWA_I	lduwa	[%r18, + 0x015f] %asi, %r30
	.word 0xb02d2183  ! 2810: ANDN_I	andn 	%r20, 0x0183, %r24
	.word 0xf805e1bb  ! 2812: LDUW_I	lduw	[%r23 + 0x01bb], %r28
iob_intr_2_238:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_238), 16, 16)) -> intp(2, 0, 8)
T2_asi_reg_wr_133:
	mov	0x3c6, %r14
	.word 0xf8f38e80  ! 2814: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xfcc5a140  ! 2821: LDSWA_I	ldswa	[%r22, + 0x0140] %asi, %r30
T2_asi_reg_wr_134:
	mov	0x16, %r14
	.word 0xf0f38e80  ! 2823: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_2_216:
	setx	0x340027, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_2_239:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_239), 16, 16)) -> intp(2, 0, 16)
	.word 0xfc5c0000  ! 2831: LDX_R	ldx	[%r16 + %r0], %r30
cpu_intr_2_217:
	setx	0x340038, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_218:
	setx	0x350008, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_125:
	mov	0x3c7, %r14
	.word 0xf2db89e0  ! 2837: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbd3c0000  ! 2838: SRA_R	sra 	%r16, %r0, %r30
	.word 0xf0154000  ! 2839: LDUH_R	lduh	[%r21 + %r0], %r24
cpu_intr_2_219:
	setx	0x360317, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_240:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_240), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_rd_126:
	mov	0x10, %r14
	.word 0xfcdb84a0  ! 2845: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T2_asi_reg_rd_127:
	mov	0x3c8, %r14
	.word 0xf6db8e60  ! 2846: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf65ca1f3  ! 2847: LDX_I	ldx	[%r18 + 0x01f3], %r27
	.word 0xfe8d0020  ! 2849: LDUBA_R	lduba	[%r20, %r0] 0x01, %r31
	.word 0xf64d0000  ! 2850: LDSB_R	ldsb	[%r20 + %r0], %r27
cpu_intr_2_220:
	setx	0x34003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc8c8020  ! 2855: LDUBA_R	lduba	[%r18, %r0] 0x01, %r30
	.word 0xfac54020  ! 2856: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r29
	.word 0xf485a180  ! 2858: LDUWA_I	lduwa	[%r22, + 0x0180] %asi, %r26
	.word 0xfedd61cd  ! 2859: LDXA_I	ldxa	[%r21, + 0x01cd] %asi, %r31
	.word 0xa1902000  ! 2861: WRPR_GL_I	wrpr	%r0, 0x0000, %-
iob_intr_2_241:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_241), 16, 16)) -> intp(2, 0, 2d)
cpu_intr_2_221:
	setx	0x37012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf20461d9  ! 2868: LDUW_I	lduw	[%r17 + 0x01d9], %r25
T2_asi_reg_rd_128:
	mov	0x3c0, %r14
	.word 0xf6db8e80  ! 2871: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_2_242:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_242), 16, 16)) -> intp(2, 0, 32)
iob_intr_2_243:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_243), 16, 16)) -> intp(2, 0, 2a)
	.word 0xba94c000  ! 2876: ORcc_R	orcc 	%r19, %r0, %r29
	.word 0xf6542081  ! 2878: LDSH_I	ldsh	[%r16 + 0x0081], %r27
	.word 0xf80ce0de  ! 2880: LDUB_I	ldub	[%r19 + 0x00de], %r28
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982f92  ! 2881: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f92, %hpstate
iob_intr_2_244:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_244), 16, 16)) -> intp(2, 0, 32)
	.word 0xb8b4c000  ! 2883: SUBCcc_R	orncc 	%r19, %r0, %r28
iob_intr_2_245:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_245), 16, 16)) -> intp(2, 0, 1b)
	ta	T_CHANGE_TO_TL0
cpu_intr_2_222:
	setx	0x350325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf805e189  ! 2891: LDUW_I	lduw	[%r23 + 0x0189], %r28
	.word 0xfc4d2017  ! 2892: LDSB_I	ldsb	[%r20 + 0x0017], %r30
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982bca  ! 2893: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bca, %hpstate
	ta	T_CHANGE_TO_TL1
	.word 0xfcd461ec  ! 2895: LDSHA_I	ldsha	[%r17, + 0x01ec] %asi, %r30
	.word 0xb834a156  ! 2896: ORN_I	orn 	%r18, 0x0156, %r28
iob_intr_2_246:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_246), 16, 16)) -> intp(2, 0, 3b)
	.word 0xb494e162  ! 2909: ORcc_I	orcc 	%r19, 0x0162, %r26
	ta	T_CHANGE_TO_TL1
cpu_intr_2_223:
	setx	0x360034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0cce1f3  ! 2917: LDSBA_I	ldsba	[%r19, + 0x01f3] %asi, %r24
	.word 0xf405e08b  ! 2918: LDUW_I	lduw	[%r23 + 0x008b], %r26
T2_asi_reg_rd_129:
	mov	0x27, %r14
	.word 0xfadb8400  ! 2923: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_2_247:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_247), 16, 16)) -> intp(2, 0, 20)
	.word 0xf855a160  ! 2927: LDSH_I	ldsh	[%r22 + 0x0160], %r28
	.word 0xf844207e  ! 2928: LDSW_I	ldsw	[%r16 + 0x007e], %r28
cpu_intr_2_224:
	setx	0x340314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04d0000  ! 2933: LDSB_R	ldsb	[%r20 + %r0], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf8944020  ! 2940: LDUHA_R	lduha	[%r17, %r0] 0x01, %r28
cpu_intr_2_225:
	setx	0x36021f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_130:
	mov	0x2b, %r14
	.word 0xfedb8e80  ! 2944: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_2_226:
	setx	0x360116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7500000  ! 2946: RDPR_TPC	<illegal instruction>
	.word 0xf44421ce  ! 2947: LDSW_I	ldsw	[%r16 + 0x01ce], %r26
iob_intr_2_248:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_248), 16, 16)) -> intp(2, 0, 17)
	.word 0xfc5d2094  ! 2950: LDX_I	ldx	[%r20 + 0x0094], %r30
iob_intr_2_249:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_249), 16, 16)) -> intp(2, 0, 5)
	.word 0xf60c0000  ! 2954: LDUB_R	ldub	[%r16 + %r0], %r27
iob_intr_2_250:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_250), 16, 16)) -> intp(2, 0, 21)
T2_asi_reg_rd_131:
	mov	0x1, %r14
	.word 0xf8db8e40  ! 2958: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb2940000  ! 2960: ORcc_R	orcc 	%r16, %r0, %r25
	.word 0xf6cd61be  ! 2962: LDSBA_I	ldsba	[%r21, + 0x01be] %asi, %r27
T2_asi_reg_rd_132:
	mov	0x37, %r14
	.word 0xfcdb8e40  ! 2963: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983d00  ! 2964: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d00, %hpstate
	.word 0xf85dc000  ! 2965: LDX_R	ldx	[%r23 + %r0], %r28
	.word 0xf685205d  ! 2969: LDUWA_I	lduwa	[%r20, + 0x005d] %asi, %r27
cpu_intr_2_227:
	setx	0x34010c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_251:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_251), 16, 16)) -> intp(2, 0, 35)
cpu_intr_2_228:
	setx	0x360118, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_135:
	mov	0x3c1, %r14
	.word 0xfef38400  ! 2973: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_2_229:
	setx	0x360316, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_252:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_252), 16, 16)) -> intp(2, 0, 5)
iob_intr_2_253:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_253), 16, 16)) -> intp(2, 0, f)
iob_intr_2_254:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_254), 16, 16)) -> intp(2, 0, 35)
	.word 0xb23dc000  ! 2988: XNOR_R	xnor 	%r23, %r0, %r25
	.word 0xfc844020  ! 2989: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r30
iob_intr_2_255:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_255), 16, 16)) -> intp(2, 0, 26)
	.word 0xf8c5c020  ! 2991: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r28
	.word 0xf0944020  ! 2993: LDUHA_R	lduha	[%r17, %r0] 0x01, %r24
cpu_intr_2_230:
	setx	0x35023d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_256:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_256), 16, 16)) -> intp(2, 0, 15)
	ta	T_CHANGE_TO_TL0
	.word 0xf80d21ba  ! 2999: LDUB_I	ldub	[%r20 + 0x01ba], %r28
iob_intr_2_257:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_257), 16, 16)) -> intp(2, 0, 3b)
	.word 0xfec44020  ! 3002: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r31
	.word 0xfc4561d1  ! 3005: LDSW_I	ldsw	[%r21 + 0x01d1], %r30
cpu_intr_2_231:
	setx	0x34003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88d0020  ! 3009: LDUBA_R	lduba	[%r20, %r0] 0x01, %r28
	.word 0xfa8da029  ! 3010: LDUBA_I	lduba	[%r22, + 0x0029] %asi, %r29
cpu_intr_2_232:
	setx	0x36003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb40d8000  ! 3013: AND_R	and 	%r22, %r0, %r26
	.word 0xfa5de050  ! 3017: LDX_I	ldx	[%r23 + 0x0050], %r29
	.word 0xf40c0000  ! 3019: LDUB_R	ldub	[%r16 + %r0], %r26
cpu_intr_2_233:
	setx	0x360324, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_234:
	setx	0x370016, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
cpu_intr_2_235:
	setx	0x360109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf484c020  ! 3033: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r26
	.word 0xf6cc8020  ! 3035: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r27
	.word 0xfc4d8000  ! 3037: LDSB_R	ldsb	[%r22 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_236:
	setx	0x340135, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983842  ! 3045: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1842, %hpstate
cpu_intr_2_237:
	setx	0x34011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4520a7  ! 3048: LDSW_I	ldsw	[%r20 + 0x00a7], %r29
T2_asi_reg_rd_133:
	mov	0x2d, %r14
	.word 0xf8db8e40  ! 3049: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T2_asi_reg_rd_134:
	mov	0x3, %r14
	.word 0xf0db8e40  ! 3050: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_238:
	setx	0x350007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc558000  ! 3055: LDSH_R	ldsh	[%r22 + %r0], %r30
	.word 0xf214c000  ! 3057: LDUH_R	lduh	[%r19 + %r0], %r25
	.word 0xfc4ca040  ! 3061: LDSB_I	ldsb	[%r18 + 0x0040], %r30
	ta	T_CHANGE_NONHPRIV
	.word 0xf2cde1b4  ! 3063: LDSBA_I	ldsba	[%r23, + 0x01b4] %asi, %r25
cpu_intr_2_239:
	setx	0x34033f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_240:
	setx	0x34001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb34e001  ! 3069: SRL_I	srl 	%r19, 0x0001, %r29
cpu_intr_2_241:
	setx	0x34032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_136:
	mov	0xf, %r14
	.word 0xf0f38400  ! 3073: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf64ca0c9  ! 3075: LDSB_I	ldsb	[%r18 + 0x00c9], %r27
iob_intr_2_258:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_258), 16, 16)) -> intp(2, 0, d)
T2_asi_reg_rd_135:
	mov	0x1, %r14
	.word 0xf8db8e40  ! 3078: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfecdc020  ! 3079: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r31
iob_intr_2_259:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_259), 16, 16)) -> intp(2, 0, 1b)
iob_intr_2_260:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_260), 16, 16)) -> intp(2, 0, 29)
cpu_intr_2_242:
	setx	0x370313, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_243:
	setx	0x35000c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_261:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_261), 16, 16)) -> intp(2, 0, 21)
	.word 0xfa8ca16a  ! 3092: LDUBA_I	lduba	[%r18, + 0x016a] %asi, %r29
T2_asi_reg_rd_136:
	mov	0x22, %r14
	.word 0xfcdb8e40  ! 3094: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf4546169  ! 3101: LDSH_I	ldsh	[%r17 + 0x0169], %r26
cpu_intr_2_244:
	setx	0x34022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba24e1d4  ! 3107: SUB_I	sub 	%r19, 0x01d4, %r29
T2_asi_reg_rd_137:
	mov	0x3c5, %r14
	.word 0xfcdb8400  ! 3109: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T2_asi_reg_wr_137:
	mov	0x27, %r14
	.word 0xf6f384a0  ! 3113: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982e52  ! 3115: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e52, %hpstate
	.word 0xfa4421c6  ! 3116: LDSW_I	ldsw	[%r16 + 0x01c6], %r29
	.word 0xfc0da197  ! 3119: LDUB_I	ldub	[%r22 + 0x0197], %r30
	ta	T_CHANGE_NONHPRIV
	.word 0xf65d8000  ! 3122: LDX_R	ldx	[%r22 + %r0], %r27
	ta	T_CHANGE_NONHPRIV
iob_intr_2_262:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_262), 16, 16)) -> intp(2, 0, 27)
	.word 0xf8054000  ! 3126: LDUW_R	lduw	[%r21 + %r0], %r28
iob_intr_2_263:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_263), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf28d60d4  ! 3132: LDUBA_I	lduba	[%r21, + 0x00d4] %asi, %r25
T2_asi_reg_rd_138:
	mov	0x3c0, %r14
	.word 0xf6db89e0  ! 3136: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_2_264:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_264), 16, 16)) -> intp(2, 0, 1a)
	.word 0xbc240000  ! 3140: SUB_R	sub 	%r16, %r0, %r30
	.word 0xfc0d0000  ! 3144: LDUB_R	ldub	[%r20 + %r0], %r30
	.word 0xf844c000  ! 3146: LDSW_R	ldsw	[%r19 + %r0], %r28
	.word 0xf8cd8020  ! 3150: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r28
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983e12  ! 3151: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e12, %hpstate
cpu_intr_2_245:
	setx	0x340213, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_139:
	mov	0x27, %r14
	.word 0xf2db8e60  ! 3153: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T2_asi_reg_wr_138:
	mov	0x29, %r14
	.word 0xfcf38e80  ! 3155: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL1
cpu_intr_2_246:
	setx	0x340128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc95c000  ! 3162: ORcc_R	orcc 	%r23, %r0, %r30
	.word 0xf8452180  ! 3163: LDSW_I	ldsw	[%r20 + 0x0180], %r28
	.word 0xf20c4000  ! 3164: LDUB_R	ldub	[%r17 + %r0], %r25
iob_intr_2_265:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_265), 16, 16)) -> intp(2, 0, 6)
	.word 0xfa1521ca  ! 3167: LDUH_I	lduh	[%r20 + 0x01ca], %r29
	.word 0xfc540000  ! 3169: LDSH_R	ldsh	[%r16 + %r0], %r30
cpu_intr_2_247:
	setx	0x340139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1352001  ! 3171: SRL_I	srl 	%r20, 0x0001, %r24
T2_asi_reg_rd_140:
	mov	0x20, %r14
	.word 0xf2db8e40  ! 3172: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf6cc4020  ! 3175: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r27
cpu_intr_2_248:
	setx	0x34032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24d8000  ! 3180: LDSB_R	ldsb	[%r22 + %r0], %r25
	.word 0xf4154000  ! 3181: LDUH_R	lduh	[%r21 + %r0], %r26
iob_intr_2_266:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_266), 16, 16)) -> intp(2, 0, 34)
iob_intr_2_267:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_267), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_268:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_268), 16, 16)) -> intp(2, 0, 31)
	.word 0xf2d4c020  ! 3188: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r25
	.word 0xf65d8000  ! 3189: LDX_R	ldx	[%r22 + %r0], %r27
	.word 0xf44cc000  ! 3194: LDSB_R	ldsb	[%r19 + %r0], %r26
	.word 0xf2848020  ! 3198: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r25
iob_intr_2_269:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_269), 16, 16)) -> intp(2, 0, 1e)
cpu_intr_2_249:
	setx	0x34020a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_250:
	setx	0x340320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf08d4020  ! 3207: LDUBA_R	lduba	[%r21, %r0] 0x01, %r24
	.word 0xbeb48000  ! 3208: SUBCcc_R	orncc 	%r18, %r0, %r31
	.word 0xb0b5a1a1  ! 3210: ORNcc_I	orncc 	%r22, 0x01a1, %r24
iob_intr_2_270:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_270), 16, 16)) -> intp(2, 0, 1)
T2_asi_reg_wr_139:
	mov	0x4, %r14
	.word 0xfaf38e40  ! 3214: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_271:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_271), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_wr_140:
	mov	0x2b, %r14
	.word 0xfef38e60  ! 3217: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfe040000  ! 3222: LDUW_R	lduw	[%r16 + %r0], %r31
cpu_intr_2_251:
	setx	0x3a0234, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_272:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_272), 16, 16)) -> intp(2, 0, 18)
iob_intr_2_273:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_273), 16, 16)) -> intp(2, 0, 2)
T2_asi_reg_wr_141:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 3230: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf4d40020  ! 3231: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r26
iob_intr_2_274:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_274), 16, 16)) -> intp(2, 0, 0)
	ta	T_CHANGE_HPRIV
iob_intr_2_275:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_275), 16, 16)) -> intp(2, 0, 27)
iob_intr_2_276:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_276), 16, 16)) -> intp(2, 0, 17)
	.word 0xfc0ce150  ! 3238: LDUB_I	ldub	[%r19 + 0x0150], %r30
T2_asi_reg_rd_141:
	mov	0x19, %r14
	.word 0xf6db8e40  ! 3239: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf4d54020  ! 3240: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r26
	.word 0xfe85c020  ! 3243: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r31
cpu_intr_2_252:
	setx	0x3b012b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_253:
	setx	0x390329, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_142:
	mov	0x3c1, %r14
	.word 0xfef384a0  ! 3247: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_2_277:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_277), 16, 16)) -> intp(2, 0, 0)
cpu_intr_2_254:
	setx	0x390105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0554000  ! 3252: LDSH_R	ldsh	[%r21 + %r0], %r24
	.word 0xb92c4000  ! 3256: SLL_R	sll 	%r17, %r0, %r28
	.word 0x9195a113  ! 3260: WRPR_PIL_I	wrpr	%r22, 0x0113, %pil
iob_intr_2_278:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_278), 16, 16)) -> intp(2, 0, 20)
T2_asi_reg_wr_143:
	mov	0x26, %r14
	.word 0xf8f38e40  ! 3268: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf24de037  ! 3270: LDSB_I	ldsb	[%r23 + 0x0037], %r25
	.word 0xb3354000  ! 3271: SRL_R	srl 	%r21, %r0, %r25
iob_intr_2_279:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_279), 16, 16)) -> intp(2, 0, 36)
	.word 0xf05cc000  ! 3279: LDX_R	ldx	[%r19 + %r0], %r24
cpu_intr_2_255:
	setx	0x39020a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_144:
	mov	0x3c0, %r14
	.word 0xf0f38e40  ! 3283: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_2_280:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_280), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf284a084  ! 3287: LDUWA_I	lduwa	[%r18, + 0x0084] %asi, %r25
	.word 0xb734f001  ! 3289: SRLX_I	srlx	%r19, 0x0001, %r27
T2_asi_reg_rd_142:
	mov	0x4, %r14
	.word 0xf4db84a0  ! 3290: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf4c46100  ! 3291: LDSWA_I	ldswa	[%r17, + 0x0100] %asi, %r26
	.word 0xb8450000  ! 3293: ADDC_R	addc 	%r20, %r0, %r28
iob_intr_2_281:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_281), 16, 16)) -> intp(2, 0, 2)
	.word 0xfc44e187  ! 3297: LDSW_I	ldsw	[%r19 + 0x0187], %r30
	.word 0xfe15e1a3  ! 3298: LDUH_I	lduh	[%r23 + 0x01a3], %r31
cpu_intr_2_256:
	setx	0x380000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8944000  ! 3301: ORcc_R	orcc 	%r17, %r0, %r28
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_145:
	mov	0x3c8, %r14
	.word 0xf4f38e40  ! 3305: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfa144000  ! 3310: LDUH_R	lduh	[%r17 + %r0], %r29
	.word 0xf0158000  ! 3311: LDUH_R	lduh	[%r22 + %r0], %r24
T2_asi_reg_rd_143:
	mov	0x3c4, %r14
	.word 0xf6db8e80  ! 3312: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf6cc21d0  ! 3314: LDSBA_I	ldsba	[%r16, + 0x01d0] %asi, %r27
T2_asi_reg_rd_144:
	mov	0x28, %r14
	.word 0xfedb8e80  ! 3316: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xfadde037  ! 3318: LDXA_I	ldxa	[%r23, + 0x0037] %asi, %r29
T2_asi_reg_wr_146:
	mov	0x3c3, %r14
	.word 0xfaf38400  ! 3319: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xfc054000  ! 3322: LDUW_R	lduw	[%r21 + %r0], %r30
	.word 0xbb3dc000  ! 3323: SRA_R	sra 	%r23, %r0, %r29
	.word 0xf844605b  ! 3324: LDSW_I	ldsw	[%r17 + 0x005b], %r28
iob_intr_2_282:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_282), 16, 16)) -> intp(2, 0, 3c)
	.word 0xfe0ca1bb  ! 3326: LDUB_I	ldub	[%r18 + 0x01bb], %r31
	.word 0xf65ce0d4  ! 3327: LDX_I	ldx	[%r19 + 0x00d4], %r27
	.word 0xbf2cf001  ! 3328: SLLX_I	sllx	%r19, 0x0001, %r31
	.word 0xfc45602e  ! 3329: LDSW_I	ldsw	[%r21 + 0x002e], %r30
	.word 0xf24c4000  ! 3332: LDSB_R	ldsb	[%r17 + %r0], %r25
iob_intr_2_283:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_283), 16, 16)) -> intp(2, 0, 0)
T2_asi_reg_rd_145:
	mov	0x3c4, %r14
	.word 0xf8db8e60  ! 3338: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf484a1e6  ! 3339: LDUWA_I	lduwa	[%r18, + 0x01e6] %asi, %r26
	.word 0xf45c8000  ! 3341: LDX_R	ldx	[%r18 + %r0], %r26
	.word 0xfc840020  ! 3343: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r30
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_257:
	setx	0x38033f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_284:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_284), 16, 16)) -> intp(2, 0, 3d)
iob_intr_2_285:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_285), 16, 16)) -> intp(2, 0, e)
T2_asi_reg_rd_146:
	mov	0x3c7, %r14
	.word 0xfadb8e60  ! 3358: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf2d4a10a  ! 3359: LDSHA_I	ldsha	[%r18, + 0x010a] %asi, %r25
T2_asi_reg_rd_147:
	mov	0x24, %r14
	.word 0xfedb8e40  ! 3360: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T2_asi_reg_rd_148:
	mov	0x2a, %r14
	.word 0xfadb89e0  ! 3362: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb93ce001  ! 3364: SRA_I	sra 	%r19, 0x0001, %r28
iob_intr_2_286:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_286), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_258:
	setx	0x38021b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_147:
	mov	0x7, %r14
	.word 0xf0f384a0  ! 3367: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T2_asi_reg_rd_149:
	mov	0x37, %r14
	.word 0xfcdb8e60  ! 3374: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_150:
	mov	0x3c1, %r14
	.word 0xfedb89e0  ! 3380: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_2_287:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_287), 16, 16)) -> intp(2, 0, b)
	.word 0xf414a068  ! 3383: LDUH_I	lduh	[%r18 + 0x0068], %r26
	.word 0xf254a02d  ! 3387: LDSH_I	ldsh	[%r18 + 0x002d], %r25
cpu_intr_2_259:
	setx	0x3a0027, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_151:
	mov	0x38, %r14
	.word 0xfadb8400  ! 3389: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	ta	T_CHANGE_TO_TL1
	.word 0xf00c60ea  ! 3394: LDUB_I	ldub	[%r17 + 0x00ea], %r24
	.word 0xb6a58000  ! 3395: SUBcc_R	subcc 	%r22, %r0, %r27
cpu_intr_2_260:
	setx	0x3a0105, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_288:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_288), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_261:
	setx	0x380103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe540000  ! 3400: LDSH_R	ldsh	[%r16 + %r0], %r31
	.word 0xf2c40020  ! 3403: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r25
T2_asi_reg_wr_148:
	mov	0x3c0, %r14
	.word 0xfaf384a0  ! 3405: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T2_asi_reg_wr_149:
	mov	0x6, %r14
	.word 0xf2f38e60  ! 3407: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T2_asi_reg_rd_152:
	mov	0x3c5, %r14
	.word 0xf4db8400  ! 3408: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T2_asi_reg_wr_150:
	mov	0x32, %r14
	.word 0xf4f389e0  ! 3409: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T2_asi_reg_rd_153:
	mov	0x3, %r14
	.word 0xf4db8e40  ! 3412: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_wr_151:
	mov	0x21, %r14
	.word 0xf8f384a0  ! 3413: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xfadc61cb  ! 3414: LDXA_I	ldxa	[%r17, + 0x01cb] %asi, %r29
cpu_intr_2_262:
	setx	0x39010e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_263:
	setx	0x3a0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe0460d6  ! 3423: LDUW_I	lduw	[%r17 + 0x00d6], %r31
iob_intr_2_289:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_289), 16, 16)) -> intp(2, 0, a)
	.word 0xf68ca07d  ! 3433: LDUBA_I	lduba	[%r18, + 0x007d] %asi, %r27
cpu_intr_2_264:
	setx	0x380002, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_154:
	mov	0x17, %r14
	.word 0xfedb89e0  ! 3435: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_2_265:
	setx	0x390238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4c619b  ! 3438: LDSB_I	ldsb	[%r17 + 0x019b], %r29
	ta	T_CHANGE_TO_TL0
iob_intr_2_290:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_290), 16, 16)) -> intp(2, 0, e)
	.word 0xf4cd4020  ! 3446: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r26
iob_intr_2_291:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_291), 16, 16)) -> intp(2, 0, 32)
cpu_intr_2_266:
	setx	0x3a0232, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_267:
	setx	0x3b0119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_268:
	setx	0x3a0007, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_152:
	mov	0x3c0, %r14
	.word 0xfcf38e80  ! 3455: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xfacd8020  ! 3459: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r29
iob_intr_2_292:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_292), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf094c020  ! 3461: LDUHA_R	lduha	[%r19, %r0] 0x01, %r24
iob_intr_2_293:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_293), 16, 16)) -> intp(2, 0, 2)
cpu_intr_2_269:
	setx	0x3b013c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_155:
	mov	0xd, %r14
	.word 0xf2db8e60  ! 3467: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf2444000  ! 3468: LDSW_R	ldsw	[%r17 + %r0], %r25
iob_intr_2_294:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_294), 16, 16)) -> intp(2, 0, 32)
	.word 0xf084a0b8  ! 3471: LDUWA_I	lduwa	[%r18, + 0x00b8] %asi, %r24
	.word 0xfe15c000  ! 3472: LDUH_R	lduh	[%r23 + %r0], %r31
	.word 0xfc04212d  ! 3474: LDUW_I	lduw	[%r16 + 0x012d], %r30
	.word 0xf255e1b5  ! 3476: LDSH_I	ldsh	[%r23 + 0x01b5], %r25
iob_intr_2_295:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_295), 16, 16)) -> intp(2, 0, 8)
iob_intr_2_296:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_296), 16, 16)) -> intp(2, 0, 15)
	.word 0xf014c000  ! 3480: LDUH_R	lduh	[%r19 + %r0], %r24
	.word 0xf4948020  ! 3482: LDUHA_R	lduha	[%r18, %r0] 0x01, %r26
T2_asi_reg_wr_153:
	mov	0x18, %r14
	.word 0xf8f38e40  ! 3484: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf095e02b  ! 3488: LDUHA_I	lduha	[%r23, + 0x002b] %asi, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf4944020  ! 3491: LDUHA_R	lduha	[%r17, %r0] 0x01, %r26
T2_asi_reg_rd_156:
	mov	0x3c0, %r14
	.word 0xfadb8e80  ! 3492: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf0842187  ! 3495: LDUWA_I	lduwa	[%r16, + 0x0187] %asi, %r24
	.word 0xfccda1d3  ! 3499: LDSBA_I	ldsba	[%r22, + 0x01d3] %asi, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xba35e066  ! 3503: SUBC_I	orn 	%r23, 0x0066, %r29
	.word 0xfa4d4000  ! 3504: LDSB_R	ldsb	[%r21 + %r0], %r29
T2_asi_reg_rd_157:
	mov	0x16, %r14
	.word 0xf4db8e40  ! 3506: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_2_270:
	setx	0x380100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb23d8000  ! 3509: XNOR_R	xnor 	%r22, %r0, %r25
	.word 0xf615c000  ! 3510: LDUH_R	lduh	[%r23 + %r0], %r27
	.word 0xfc850020  ! 3511: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_297:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_297), 16, 16)) -> intp(2, 0, 31)
iob_intr_2_298:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_298), 16, 16)) -> intp(2, 0, 23)
	.word 0xfc8c0020  ! 3521: LDUBA_R	lduba	[%r16, %r0] 0x01, %r30
	.word 0xf0dca100  ! 3522: LDXA_I	ldxa	[%r18, + 0x0100] %asi, %r24
	.word 0xbc840000  ! 3523: ADDcc_R	addcc 	%r16, %r0, %r30
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983f92  ! 3524: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f92, %hpstate
iob_intr_2_299:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_299), 16, 16)) -> intp(2, 0, 17)
cpu_intr_2_271:
	setx	0x39012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf49560d9  ! 3530: LDUHA_I	lduha	[%r21, + 0x00d9] %asi, %r26
	.word 0xfc8c6094  ! 3534: LDUBA_I	lduba	[%r17, + 0x0094] %asi, %r30
iob_intr_2_300:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_300), 16, 16)) -> intp(2, 0, 29)
	ta	T_CHANGE_TO_TL0
	.word 0xf4140000  ! 3540: LDUH_R	lduh	[%r16 + %r0], %r26
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_158:
	mov	0xd, %r14
	.word 0xfcdb8e40  ! 3551: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_2_301:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_301), 16, 16)) -> intp(2, 0, 3c)
	.word 0xb9342001  ! 3557: SRL_I	srl 	%r16, 0x0001, %r28
cpu_intr_2_272:
	setx	0x39002b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_273:
	setx	0x3a0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8d0020  ! 3565: LDUBA_R	lduba	[%r20, %r0] 0x01, %r29
	.word 0xf4150000  ! 3566: LDUH_R	lduh	[%r20 + %r0], %r26
	.word 0xfe4521e2  ! 3569: LDSW_I	ldsw	[%r20 + 0x01e2], %r31
	.word 0xf20cc000  ! 3573: LDUB_R	ldub	[%r19 + %r0], %r25
iob_intr_2_302:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_302), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf6d48020  ! 3579: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r27
iob_intr_2_303:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_303), 16, 16)) -> intp(2, 0, 9)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc548000  ! 3586: LDSH_R	ldsh	[%r18 + %r0], %r30
T2_asi_reg_wr_154:
	mov	0x9, %r14
	.word 0xfcf38e40  ! 3587: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_274:
	setx	0x390016, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_304:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_304), 16, 16)) -> intp(2, 0, 4)
	.word 0xbea5604c  ! 3591: SUBcc_I	subcc 	%r21, 0x004c, %r31
iob_intr_2_305:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_305), 16, 16)) -> intp(2, 0, 3e)
cpu_intr_2_275:
	setx	0x3b0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeccc020  ! 3598: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r31
iob_intr_2_306:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_306), 16, 16)) -> intp(2, 0, c)
	.word 0xf6944020  ! 3601: LDUHA_R	lduha	[%r17, %r0] 0x01, %r27
	ta	T_CHANGE_TO_TL0
iob_intr_2_307:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_307), 16, 16)) -> intp(2, 0, 2a)
cpu_intr_2_276:
	setx	0x3a022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b4c000  ! 3608: SUBCcc_R	orncc 	%r19, %r0, %r24
	.word 0xf68d0020  ! 3609: LDUBA_R	lduba	[%r20, %r0] 0x01, %r27
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_159:
	mov	0x32, %r14
	.word 0xf4db8e80  ! 3612: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_2_277:
	setx	0x3b0206, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_308:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_308), 16, 16)) -> intp(2, 0, 21)
cpu_intr_2_278:
	setx	0x3b002f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_279:
	setx	0x3a010c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_309:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_309), 16, 16)) -> intp(2, 0, 26)
	.word 0xbc1cc000  ! 3622: XOR_R	xor 	%r19, %r0, %r30
	.word 0xfad5e027  ! 3623: LDSHA_I	ldsha	[%r23, + 0x0027] %asi, %r29
	.word 0xb014e0d3  ! 3625: OR_I	or 	%r19, 0x00d3, %r24
cpu_intr_2_280:
	setx	0x39013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe35c000  ! 3628: ORN_R	orn 	%r23, %r0, %r31
	.word 0xb12c4000  ! 3629: SLL_R	sll 	%r17, %r0, %r24
iob_intr_2_310:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_310), 16, 16)) -> intp(2, 0, 26)
iob_intr_2_311:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_311), 16, 16)) -> intp(2, 0, 27)
T2_asi_reg_rd_160:
	mov	0x1f, %r14
	.word 0xf8db8e80  ! 3634: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_2_281:
	setx	0x3a0035, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_312:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_312), 16, 16)) -> intp(2, 0, 33)
cpu_intr_2_282:
	setx	0x38010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe052168  ! 3639: ADD_I	add 	%r20, 0x0168, %r31
cpu_intr_2_283:
	setx	0x39011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf084e0be  ! 3642: LDUWA_I	lduwa	[%r19, + 0x00be] %asi, %r24
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_284:
	setx	0x3a0219, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_313:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_313), 16, 16)) -> intp(2, 0, 12)
T2_asi_reg_rd_161:
	mov	0x30, %r14
	.word 0xf4db8e60  ! 3650: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xbf7c4400  ! 3651: MOVR_R	movre	%r17, %r0, %r31
	.word 0xfe44c000  ! 3652: LDSW_R	ldsw	[%r19 + %r0], %r31
	.word 0xf2cd61e8  ! 3654: LDSBA_I	ldsba	[%r21, + 0x01e8] %asi, %r25
cpu_intr_2_285:
	setx	0x380210, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_314:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_314), 16, 16)) -> intp(2, 0, 3f)
cpu_intr_2_286:
	setx	0x39002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xb8b4a1b8  ! 3663: SUBCcc_I	orncc 	%r18, 0x01b8, %r28
T2_asi_reg_wr_155:
	mov	0x3c2, %r14
	.word 0xfef38e40  ! 3664: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf85c4000  ! 3665: LDX_R	ldx	[%r17 + %r0], %r28
	.word 0xf8544000  ! 3667: LDSH_R	ldsh	[%r17 + %r0], %r28
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_162:
	mov	0x29, %r14
	.word 0xf4db8e40  ! 3671: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf80d4000  ! 3672: LDUB_R	ldub	[%r21 + %r0], %r28
T2_asi_reg_rd_163:
	mov	0x3c4, %r14
	.word 0xf2db89e0  ! 3677: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xfa15e0f8  ! 3678: LDUH_I	lduh	[%r23 + 0x00f8], %r29
T2_asi_reg_wr_156:
	mov	0x3c1, %r14
	.word 0xfef389e0  ! 3680: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf24c2073  ! 3682: LDSB_I	ldsb	[%r16 + 0x0073], %r25
	.word 0xfacd8020  ! 3684: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r29
	.word 0xf6cd4020  ! 3685: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r27
T2_asi_reg_wr_157:
	mov	0x16, %r14
	.word 0xfef38e40  ! 3686: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_315:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_315), 16, 16)) -> intp(2, 0, 1f)
T2_asi_reg_wr_158:
	mov	0x13, %r14
	.word 0xf4f384a0  ! 3690: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_2_316:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_316), 16, 16)) -> intp(2, 0, 2b)
	.word 0xfe958020  ! 3695: LDUHA_R	lduha	[%r22, %r0] 0x01, %r31
cpu_intr_2_287:
	setx	0x3d0205, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_159:
	mov	0x1, %r14
	.word 0xfaf38e40  ! 3699: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf44de02f  ! 3703: LDSB_I	ldsb	[%r23 + 0x002f], %r26
cpu_intr_2_288:
	setx	0x3d0234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb834a14a  ! 3706: SUBC_I	orn 	%r18, 0x014a, %r28
cpu_intr_2_289:
	setx	0x3f030d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_290:
	setx	0x3c0134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf20d60df  ! 3709: LDUB_I	ldub	[%r21 + 0x00df], %r25
	.word 0xf295e134  ! 3710: LDUHA_I	lduha	[%r23, + 0x0134] %asi, %r25
T2_asi_reg_wr_160:
	mov	0x1, %r14
	.word 0xf0f38e80  ! 3711: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xfa05602d  ! 3713: LDUW_I	lduw	[%r21 + 0x002d], %r29
	.word 0xf01560b1  ! 3717: LDUH_I	lduh	[%r21 + 0x00b1], %r24
cpu_intr_2_291:
	setx	0x3f0235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc44c000  ! 3719: LDSW_R	ldsw	[%r19 + %r0], %r30
cpu_intr_2_292:
	setx	0x3f0115, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983e50  ! 3722: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e50, %hpstate
iob_intr_2_317:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_317), 16, 16)) -> intp(2, 0, a)
iob_intr_2_318:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_318), 16, 16)) -> intp(2, 0, 8)
	.word 0xb82d4000  ! 3730: ANDN_R	andn 	%r21, %r0, %r28
iob_intr_2_319:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_319), 16, 16)) -> intp(2, 0, 34)
	.word 0xfe5d0000  ! 3734: LDX_R	ldx	[%r20 + %r0], %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xf4c50020  ! 3740: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r26
	.word 0xf445c000  ! 3741: LDSW_R	ldsw	[%r23 + %r0], %r26
cpu_intr_2_293:
	setx	0x3d010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf09561df  ! 3744: LDUHA_I	lduha	[%r21, + 0x01df] %asi, %r24
cpu_intr_2_294:
	setx	0x3f032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983d58  ! 3748: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d58, %hpstate
iob_intr_2_320:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_320), 16, 16)) -> intp(2, 0, 23)
T2_asi_reg_wr_161:
	mov	0x8, %r14
	.word 0xf8f38e60  ! 3750: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_2_321:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_321), 16, 16)) -> intp(2, 0, 25)
	.word 0x8994a0c6  ! 3752: WRPR_TICK_I	wrpr	%r18, 0x00c6, %tick
T2_asi_reg_wr_162:
	mov	0x18, %r14
	.word 0xf2f38e80  ! 3753: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb035613a  ! 3755: SUBC_I	orn 	%r21, 0x013a, %r24
T2_asi_reg_rd_164:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 3756: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf88c4020  ! 3758: LDUBA_R	lduba	[%r17, %r0] 0x01, %r28
iob_intr_2_322:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_322), 16, 16)) -> intp(2, 0, d)
	ta	T_CHANGE_TO_TL1
	.word 0xfc94a00d  ! 3762: LDUHA_I	lduha	[%r18, + 0x000d] %asi, %r30
	.word 0xf0456093  ! 3763: LDSW_I	ldsw	[%r21 + 0x0093], %r24
cpu_intr_2_295:
	setx	0x3f0317, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_163:
	mov	0x3c3, %r14
	.word 0xf6f38e40  ! 3768: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_2_296:
	setx	0x3d0329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4048000  ! 3773: LDUW_R	lduw	[%r18 + %r0], %r26
	.word 0xf2cc20b9  ! 3777: LDSBA_I	ldsba	[%r16, + 0x00b9] %asi, %r25
T2_asi_reg_wr_164:
	mov	0x3c6, %r14
	.word 0xf0f389e0  ! 3778: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf40d4000  ! 3780: LDUB_R	ldub	[%r21 + %r0], %r26
T2_asi_reg_rd_165:
	mov	0x21, %r14
	.word 0xfadb84a0  ! 3782: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf8cc8020  ! 3783: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r28
	.word 0xfcc42165  ! 3784: LDSWA_I	ldswa	[%r16, + 0x0165] %asi, %r30
T2_asi_reg_rd_166:
	mov	0x2, %r14
	.word 0xf0db89e0  ! 3785: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_2_323:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_323), 16, 16)) -> intp(2, 0, 38)
cpu_intr_2_297:
	setx	0x3f0034, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_167:
	mov	0x35, %r14
	.word 0xf0db84a0  ! 3790: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xfc452076  ! 3791: LDSW_I	ldsw	[%r20 + 0x0076], %r30
	.word 0xf08c2185  ! 3793: LDUBA_I	lduba	[%r16, + 0x0185] %asi, %r24
iob_intr_2_324:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_324), 16, 16)) -> intp(2, 0, 31)
cpu_intr_2_298:
	setx	0x3f030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_168:
	mov	0x1d, %r14
	.word 0xf8db8e40  ! 3797: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	ta	T_CHANGE_NONHPRIV
iob_intr_2_325:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_325), 16, 16)) -> intp(2, 0, 3d)
T2_asi_reg_wr_165:
	mov	0x3c4, %r14
	.word 0xf4f389e0  ! 3804: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL0
	.word 0xf4d5e07d  ! 3811: LDSHA_I	ldsha	[%r23, + 0x007d] %asi, %r26
T2_asi_reg_rd_169:
	mov	0x28, %r14
	.word 0xf0db8e80  ! 3812: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_2_299:
	setx	0x3f0006, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_166:
	mov	0x9, %r14
	.word 0xf2f384a0  ! 3814: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_2_300:
	setx	0x3d0235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfac420be  ! 3818: LDSWA_I	ldswa	[%r16, + 0x00be] %asi, %r29
	.word 0xfcdc2049  ! 3819: LDXA_I	ldxa	[%r16, + 0x0049] %asi, %r30
	.word 0xfe5ca0fc  ! 3823: LDX_I	ldx	[%r18 + 0x00fc], %r31
T2_asi_reg_wr_167:
	mov	0x2f, %r14
	.word 0xfaf38400  ! 3826: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_2_326:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_326), 16, 16)) -> intp(2, 0, 6)
	.word 0xf2d5c020  ! 3833: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r25
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983eda  ! 3836: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1eda, %hpstate
iob_intr_2_327:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_327), 16, 16)) -> intp(2, 0, 10)
	.word 0xba348000  ! 3842: ORN_R	orn 	%r18, %r0, %r29
	.word 0xb0c5614a  ! 3843: ADDCcc_I	addccc 	%r21, 0x014a, %r24
T2_asi_reg_rd_170:
	mov	0x1a, %r14
	.word 0xfedb89e0  ! 3847: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T2_asi_reg_wr_168:
	mov	0x1c, %r14
	.word 0xfaf38e80  ! 3849: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_2_301:
	setx	0x3f003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4040000  ! 3856: LDUW_R	lduw	[%r16 + %r0], %r26
iob_intr_2_328:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_328), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf6952144  ! 3859: LDUHA_I	lduha	[%r20, + 0x0144] %asi, %r27
iob_intr_2_329:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_329), 16, 16)) -> intp(2, 0, 4)
iob_intr_2_330:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_330), 16, 16)) -> intp(2, 0, 23)
iob_intr_2_331:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_331), 16, 16)) -> intp(2, 0, 11)
	.word 0xf44420ba  ! 3870: LDSW_I	ldsw	[%r16 + 0x00ba], %r26
	.word 0xf84c2039  ! 3871: LDSB_I	ldsb	[%r16 + 0x0039], %r28
iob_intr_2_332:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_332), 16, 16)) -> intp(2, 0, 5)
	.word 0xf4856186  ! 3878: LDUWA_I	lduwa	[%r21, + 0x0186] %asi, %r26
T2_asi_reg_wr_169:
	mov	0x3c8, %r14
	.word 0xf0f38400  ! 3883: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf6d521fb  ! 3886: LDSHA_I	ldsha	[%r20, + 0x01fb] %asi, %r27
T2_asi_reg_wr_170:
	mov	0x24, %r14
	.word 0xf8f38400  ! 3887: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T2_asi_reg_wr_171:
	mov	0x3c8, %r14
	.word 0xfcf38e80  ! 3888: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_2_333:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_333), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_302:
	setx	0x3c0215, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_334:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_334), 16, 16)) -> intp(2, 0, 2c)
iob_intr_2_335:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_335), 16, 16)) -> intp(2, 0, 24)
	.word 0xb3348000  ! 3894: SRL_R	srl 	%r18, %r0, %r25
T2_asi_reg_rd_171:
	mov	0x11, %r14
	.word 0xfadb8e80  ! 3896: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_2_336:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_336), 16, 16)) -> intp(2, 0, 37)
	.word 0xfa0ce116  ! 3901: LDUB_I	ldub	[%r19 + 0x0116], %r29
	.word 0xfccdc020  ! 3902: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r30
T2_asi_reg_wr_172:
	mov	0x1f, %r14
	.word 0xf4f389e0  ! 3904: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xfe5c2087  ! 3905: LDX_I	ldx	[%r16 + 0x0087], %r31
	.word 0xf205a107  ! 3906: LDUW_I	lduw	[%r22 + 0x0107], %r25
	.word 0xfe446034  ! 3914: LDSW_I	ldsw	[%r17 + 0x0034], %r31
T2_asi_reg_wr_173:
	mov	0x36, %r14
	.word 0xfef38e60  ! 3915: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf84c8000  ! 3917: LDSB_R	ldsb	[%r18 + %r0], %r28
iob_intr_2_337:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_337), 16, 16)) -> intp(2, 0, 9)
	.word 0xf28da16b  ! 3919: LDUBA_I	lduba	[%r22, + 0x016b] %asi, %r25
	.word 0xb015615b  ! 3921: OR_I	or 	%r21, 0x015b, %r24
	.word 0xb53d3001  ! 3922: SRAX_I	srax	%r20, 0x0001, %r26
	.word 0xf8148000  ! 3923: LDUH_R	lduh	[%r18 + %r0], %r28
	.word 0xf0946045  ! 3924: LDUHA_I	lduha	[%r17, + 0x0045] %asi, %r24
	.word 0xbd3c3001  ! 3925: SRAX_I	srax	%r16, 0x0001, %r30
T2_asi_reg_wr_174:
	mov	0x13, %r14
	.word 0xfaf38e60  ! 3927: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_2_303:
	setx	0x3d0331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2dc6075  ! 3932: LDXA_I	ldxa	[%r17, + 0x0075] %asi, %r25
T2_asi_reg_wr_175:
	mov	0x12, %r14
	.word 0xfef38e40  ! 3933: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf2c48020  ! 3936: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r25
T2_asi_reg_wr_176:
	mov	0x2b, %r14
	.word 0xfaf38e80  ! 3937: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_2_304:
	setx	0x3e0108, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf4dd2008  ! 3942: LDXA_I	ldxa	[%r20, + 0x0008] %asi, %r26
	.word 0xf0cce024  ! 3947: LDSBA_I	ldsba	[%r19, + 0x0024] %asi, %r24
iob_intr_2_338:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_338), 16, 16)) -> intp(2, 0, 1b)
iob_intr_2_339:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_339), 16, 16)) -> intp(2, 0, c)
cpu_intr_2_305:
	setx	0x3c010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfecd4020  ! 3953: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r31
iob_intr_2_340:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_340), 16, 16)) -> intp(2, 0, e)
	.word 0xb8448000  ! 3956: ADDC_R	addc 	%r18, %r0, %r28
	.word 0xf8140000  ! 3957: LDUH_R	lduh	[%r16 + %r0], %r28
cpu_intr_2_306:
	setx	0x3e030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb844a1e0  ! 3960: ADDC_I	addc 	%r18, 0x01e0, %r28
iob_intr_2_341:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_341), 16, 16)) -> intp(2, 0, 14)
	.word 0xfe150000  ! 3965: LDUH_R	lduh	[%r20 + %r0], %r31
iob_intr_2_342:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_342), 16, 16)) -> intp(2, 0, e)
T2_asi_reg_rd_172:
	mov	0x31, %r14
	.word 0xfadb8e80  ! 3967: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf28cc020  ! 3968: LDUBA_R	lduba	[%r19, %r0] 0x01, %r25
iob_intr_2_343:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_343), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf8554000  ! 3971: LDSH_R	ldsh	[%r21 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe94609d  ! 3986: LDUHA_I	lduha	[%r17, + 0x009d] %asi, %r31
	ta	T_CHANGE_HPRIV
iob_intr_2_344:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_344), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_rd_173:
	mov	0x1c, %r14
	.word 0xf0db8e40  ! 3991: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_307:
	setx	0x3d0224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2848020  ! 3997: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r25
	.word 0xf68c211e  ! 3998: LDUBA_I	lduba	[%r16, + 0x011e] %asi, %r27
T2_asi_reg_rd_174:
	mov	0x6, %r14
	.word 0xfedb8e40  ! 4000: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T2_asi_reg_wr_177:
	mov	0x20, %r14
	.word 0xfef384a0  ! 4001: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_2_308:
	setx	0x10130, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_178:
	mov	0x16, %r14
	.word 0xfef38e40  ! 4005: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_rd_175:
	mov	0x1d, %r14
	.word 0xf6db8e40  ! 4006: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_2_345:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_345), 16, 16)) -> intp(2, 0, 21)
	.word 0xfc44c000  ! 4008: LDSW_R	ldsw	[%r19 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfcd4c020  ! 4011: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r30
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983e00  ! 4012: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e00, %hpstate
	.word 0xf4dda070  ! 4014: LDXA_I	ldxa	[%r22, + 0x0070] %asi, %r26
	ta	T_CHANGE_NONHPRIV
	.word 0xf25ca1fc  ! 4019: LDX_I	ldx	[%r18 + 0x01fc], %r25
T2_asi_reg_wr_179:
	mov	0x35, %r14
	.word 0xfcf38e80  ! 4021: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T2_asi_reg_rd_176:
	mov	0x25, %r14
	.word 0xfedb8e80  ! 4022: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982f5a  ! 4025: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5a, %hpstate
T2_asi_reg_rd_177:
	mov	0xc, %r14
	.word 0xf2db8e80  ! 4026: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf40d612c  ! 4027: LDUB_I	ldub	[%r21 + 0x012c], %r26
T2_asi_reg_wr_180:
	mov	0x2e, %r14
	.word 0xf0f38e40  ! 4028: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbb357001  ! 4029: SRLX_I	srlx	%r21, 0x0001, %r29
	.word 0xfa8d2188  ! 4031: LDUBA_I	lduba	[%r20, + 0x0188] %asi, %r29
T2_asi_reg_wr_181:
	mov	0x6, %r14
	.word 0xf0f384a0  ! 4038: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbb2c1000  ! 4042: SLLX_R	sllx	%r16, %r0, %r29
	.word 0xf8dd617b  ! 4043: LDXA_I	ldxa	[%r21, + 0x017b] %asi, %r28
T2_asi_reg_rd_178:
	mov	0x20, %r14
	.word 0xfcdb89e0  ! 4044: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T2_asi_reg_rd_179:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 4045: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfccc6115  ! 4052: LDSBA_I	ldsba	[%r17, + 0x0115] %asi, %r30
cpu_intr_2_309:
	setx	0x3f0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfad56019  ! 4060: LDSHA_I	ldsha	[%r21, + 0x0019] %asi, %r29
	.word 0xfc142050  ! 4061: LDUH_I	lduh	[%r16 + 0x0050], %r30
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x8198385a  ! 4062: WRHPR_HPSTATE_I	wrhpr	%r0, 0x185a, %hpstate
	.word 0xfc04a133  ! 4066: LDUW_I	lduw	[%r18 + 0x0133], %r30
	.word 0xfc8c4020  ! 4067: LDUBA_R	lduba	[%r17, %r0] 0x01, %r30
iob_intr_2_346:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_346), 16, 16)) -> intp(2, 0, 29)
iob_intr_2_347:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_347), 16, 16)) -> intp(2, 0, 3)
	.word 0x8195e129  ! 4073: WRPR_TPC_I	wrpr	%r23, 0x0129, %tpc
	.word 0xbead20cf  ! 4075: ANDNcc_I	andncc 	%r20, 0x00cf, %r31
iob_intr_2_348:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_348), 16, 16)) -> intp(2, 0, 35)
cpu_intr_2_310:
	setx	0x3f0237, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_349:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_349), 16, 16)) -> intp(2, 0, 1e)
	.word 0xb0054000  ! 4082: ADD_R	add 	%r21, %r0, %r24
	.word 0xf0c4a187  ! 4083: LDSWA_I	ldswa	[%r18, + 0x0187] %asi, %r24
	.word 0xf20d205c  ! 4086: LDUB_I	ldub	[%r20 + 0x005c], %r25
cpu_intr_2_311:
	setx	0x3f021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	.word 0xf4146143  ! 4091: LDUH_I	lduh	[%r17 + 0x0143], %r26
cpu_intr_2_312:
	setx	0x3f0231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc054000  ! 4094: LDUW_R	lduw	[%r21 + %r0], %r30
cpu_intr_2_313:
	setx	0x3d0228, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_180:
	mov	0x3c5, %r14
	.word 0xf2db8e80  ! 4097: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T2_asi_reg_rd_181:
	mov	0x25, %r14
	.word 0xfcdb8e60  ! 4100: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T2_asi_reg_wr_182:
	mov	0x10, %r14
	.word 0xf0f38e80  ! 4104: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf60d4000  ! 4106: LDUB_R	ldub	[%r21 + %r0], %r27
cpu_intr_2_314:
	setx	0x3e0312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60d20af  ! 4111: LDUB_I	ldub	[%r20 + 0x00af], %r27
iob_intr_2_350:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_350), 16, 16)) -> intp(2, 0, 3c)
	.word 0xfa0cc000  ! 4114: LDUB_R	ldub	[%r19 + %r0], %r29
	.word 0xf60da082  ! 4116: LDUB_I	ldub	[%r22 + 0x0082], %r27
T2_asi_reg_wr_183:
	mov	0x3c2, %r14
	.word 0xfef389e0  ! 4120: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T2_asi_reg_rd_182:
	mov	0x38, %r14
	.word 0xf0db8e60  ! 4121: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T2_asi_reg_rd_183:
	mov	0x2, %r14
	.word 0xfcdb8e60  ! 4124: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_2_315:
	setx	0x400200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65c4000  ! 4126: LDX_R	ldx	[%r17 + %r0], %r27
T2_asi_reg_wr_184:
	mov	0x9, %r14
	.word 0xf2f38e40  ! 4127: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T2_asi_reg_rd_184:
	mov	0x3c4, %r14
	.word 0xfadb84a0  ! 4131: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb235a17d  ! 4133: SUBC_I	orn 	%r22, 0x017d, %r25
	.word 0xb8b5c000  ! 4134: ORNcc_R	orncc 	%r23, %r0, %r28
	.word 0xf604a170  ! 4136: LDUW_I	lduw	[%r18 + 0x0170], %r27
cpu_intr_2_316:
	setx	0x410218, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xfec50020  ! 4147: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r31
	.word 0xb0b50000  ! 4149: ORNcc_R	orncc 	%r20, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf095a18e  ! 4153: LDUHA_I	lduha	[%r22, + 0x018e] %asi, %r24
	.word 0xf654a1eb  ! 4154: LDSH_I	ldsh	[%r18 + 0x01eb], %r27
	.word 0xf41520f2  ! 4160: LDUH_I	lduh	[%r20 + 0x00f2], %r26
cpu_intr_2_317:
	setx	0x400210, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_318:
	setx	0x43023c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_351:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_351), 16, 16)) -> intp(2, 0, 13)
T2_asi_reg_rd_185:
	mov	0x7, %r14
	.word 0xf6db8e80  ! 4166: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T2_asi_reg_wr_185:
	mov	0x3c3, %r14
	.word 0xf6f38400  ! 4167: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf484200c  ! 4169: LDUWA_I	lduwa	[%r16, + 0x000c] %asi, %r26
	.word 0xf4cca187  ! 4171: LDSBA_I	ldsba	[%r18, + 0x0187] %asi, %r26
	.word 0xf844a140  ! 4172: LDSW_I	ldsw	[%r18 + 0x0140], %r28
cpu_intr_2_319:
	setx	0x430238, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_186:
	mov	0x2d, %r14
	.word 0xfef38e40  ! 4181: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983d80  ! 4183: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d80, %hpstate
T2_asi_reg_wr_187:
	mov	0x9, %r14
	.word 0xfaf384a0  ! 4184: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T2_asi_reg_wr_188:
	mov	0x3c0, %r14
	.word 0xf0f384a0  ! 4188: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf25d60b7  ! 4191: LDX_I	ldx	[%r21 + 0x00b7], %r25
T2_asi_reg_wr_189:
	mov	0x3c0, %r14
	.word 0xf8f38e40  ! 4192: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_352:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_352), 16, 16)) -> intp(2, 0, 16)
	.word 0xf44c61ef  ! 4197: LDSB_I	ldsb	[%r17 + 0x01ef], %r26
	.word 0xf05da0b0  ! 4200: LDX_I	ldx	[%r22 + 0x00b0], %r24
	.word 0xb01d618b  ! 4202: XOR_I	xor 	%r21, 0x018b, %r24
	ta	T_CHANGE_TO_TL0
	.word 0xfed5609c  ! 4207: LDSHA_I	ldsha	[%r21, + 0x009c] %asi, %r31
cpu_intr_2_320:
	setx	0x41001f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_190:
	mov	0x1e, %r14
	.word 0xf6f38e80  ! 4209: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_2_353:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_353), 16, 16)) -> intp(2, 0, 2a)
	.word 0xba3dc000  ! 4211: XNOR_R	xnor 	%r23, %r0, %r29
	.word 0xfedc20eb  ! 4212: LDXA_I	ldxa	[%r16, + 0x00eb] %asi, %r31
	.word 0xb3340000  ! 4213: SRL_R	srl 	%r16, %r0, %r25
cpu_intr_2_321:
	setx	0x400216, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_191:
	mov	0x14, %r14
	.word 0xf0f38e80  ! 4219: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T2_asi_reg_rd_186:
	mov	0x20, %r14
	.word 0xfadb84a0  ! 4221: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf445a189  ! 4223: LDSW_I	ldsw	[%r22 + 0x0189], %r26
iob_intr_2_354:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_354), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_355:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_355), 16, 16)) -> intp(2, 0, a)
	.word 0xf05ce07f  ! 4230: LDX_I	ldx	[%r19 + 0x007f], %r24
	.word 0xfc0c6041  ! 4232: LDUB_I	ldub	[%r17 + 0x0041], %r30
cpu_intr_2_322:
	setx	0x43023d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_323:
	setx	0x42021d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_356:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_356), 16, 16)) -> intp(2, 0, 16)
T2_asi_reg_rd_187:
	mov	0x3c2, %r14
	.word 0xf0db8e60  ! 4236: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xfe5560d9  ! 4240: LDSH_I	ldsh	[%r21 + 0x00d9], %r31
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983f98  ! 4243: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f98, %hpstate
	.word 0xfe5d6177  ! 4244: LDX_I	ldx	[%r21 + 0x0177], %r31
	.word 0xf644a063  ! 4247: LDSW_I	ldsw	[%r18 + 0x0063], %r27
T2_asi_reg_rd_188:
	mov	0x18, %r14
	.word 0xfedb8400  ! 4248: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_2_357:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_357), 16, 16)) -> intp(2, 0, 8)
	.word 0xf84da1b7  ! 4253: LDSB_I	ldsb	[%r22 + 0x01b7], %r28
	.word 0xb7341000  ! 4256: SRLX_R	srlx	%r16, %r0, %r27
cpu_intr_2_324:
	setx	0x42032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60dc000  ! 4260: LDUB_R	ldub	[%r23 + %r0], %r27
	ta	T_CHANGE_TO_TL1
iob_intr_2_358:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_358), 16, 16)) -> intp(2, 0, 33)
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_192:
	mov	0x3c5, %r14
	.word 0xf4f389e0  ! 4266: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf25ce106  ! 4267: LDX_I	ldx	[%r19 + 0x0106], %r25
iob_intr_2_359:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_359), 16, 16)) -> intp(2, 0, 24)
cpu_intr_2_325:
	setx	0x430021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d44020  ! 4271: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r25
	.word 0xb57c8400  ! 4274: MOVR_R	movre	%r18, %r0, %r26
T2_asi_reg_rd_189:
	mov	0x10, %r14
	.word 0xfcdb89e0  ! 4276: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_2_326:
	setx	0x400239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe842180  ! 4278: LDUWA_I	lduwa	[%r16, + 0x0180] %asi, %r31
	.word 0xb9643801  ! 4279: MOVcc_I	<illegal instruction>
	.word 0xfa44e001  ! 4280: LDSW_I	ldsw	[%r19 + 0x0001], %r29
	.word 0xf085c020  ! 4282: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r24
cpu_intr_2_327:
	setx	0x420219, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_328:
	setx	0x400105, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_360:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_360), 16, 16)) -> intp(2, 0, 37)
	.word 0xf68c8020  ! 4288: LDUBA_R	lduba	[%r18, %r0] 0x01, %r27
	.word 0xfe5da06a  ! 4289: LDX_I	ldx	[%r22 + 0x006a], %r31
	.word 0xb32ca001  ! 4295: SLL_I	sll 	%r18, 0x0001, %r25
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_329:
	setx	0x410201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf614a052  ! 4298: LDUH_I	lduh	[%r18 + 0x0052], %r27
	ta	T_CHANGE_HPRIV
iob_intr_2_361:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_361), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_rd_190:
	mov	0x2a, %r14
	.word 0xf8db8400  ! 4304: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T2_asi_reg_rd_191:
	mov	0x17, %r14
	.word 0xfadb8400  ! 4307: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_2_362:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_362), 16, 16)) -> intp(2, 0, 23)
	ta	T_CHANGE_NONHPRIV
	.word 0xfa8d61b3  ! 4312: LDUBA_I	lduba	[%r21, + 0x01b3] %asi, %r29
	.word 0xfa540000  ! 4314: LDSH_R	ldsh	[%r16 + %r0], %r29
iob_intr_2_363:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_363), 16, 16)) -> intp(2, 0, 3)
	.word 0xb80420c8  ! 4318: ADD_I	add 	%r16, 0x00c8, %r28
T2_asi_reg_wr_193:
	mov	0x1a, %r14
	.word 0xfef384a0  ! 4319: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf84c20df  ! 4323: LDSB_I	ldsb	[%r16 + 0x00df], %r28
T2_asi_reg_wr_194:
	mov	0x3c1, %r14
	.word 0xfef38400  ! 4324: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb89cc000  ! 4327: XORcc_R	xorcc 	%r19, %r0, %r28
	.word 0xfc4ce1a8  ! 4329: LDSB_I	ldsb	[%r19 + 0x01a8], %r30
iob_intr_2_364:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_364), 16, 16)) -> intp(2, 0, 2c)
T2_asi_reg_wr_195:
	mov	0x8, %r14
	.word 0xf0f38e60  ! 4332: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_2_330:
	setx	0x42031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0cdc020  ! 4336: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r24
cpu_intr_2_331:
	setx	0x41030d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_332:
	setx	0x420333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4354000  ! 4345: ORN_R	orn 	%r21, %r0, %r26
	.word 0xf2156134  ! 4348: LDUH_I	lduh	[%r21 + 0x0134], %r25
cpu_intr_2_333:
	setx	0x43012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb235e016  ! 4350: SUBC_I	orn 	%r23, 0x0016, %r25
	.word 0xf2dca102  ! 4355: LDXA_I	ldxa	[%r18, + 0x0102] %asi, %r25
iob_intr_2_365:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_365), 16, 16)) -> intp(2, 0, 5)
cpu_intr_2_334:
	setx	0x430134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb351c000  ! 4360: RDPR_TL	rdpr	%tl, %r25
	.word 0xf6cd2131  ! 4362: LDSBA_I	ldsba	[%r20, + 0x0131] %asi, %r27
cpu_intr_2_335:
	setx	0x430325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf414e04c  ! 4364: LDUH_I	lduh	[%r19 + 0x004c], %r26
T2_asi_reg_wr_196:
	mov	0x24, %r14
	.word 0xf4f38e40  ! 4365: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_rd_192:
	mov	0x6, %r14
	.word 0xf6db8e40  ! 4366: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_2_366:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_366), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_336:
	setx	0x42001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf88c6097  ! 4371: LDUBA_I	lduba	[%r17, + 0x0097] %asi, %r28
cpu_intr_2_337:
	setx	0x42001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4cc0020  ! 4376: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r26
iob_intr_2_367:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_367), 16, 16)) -> intp(2, 0, 18)
	.word 0xf205e1b8  ! 4379: LDUW_I	lduw	[%r23 + 0x01b8], %r25
T2_asi_reg_rd_193:
	mov	0x26, %r14
	.word 0xf4db8e40  ! 4381: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbd344000  ! 4384: SRL_R	srl 	%r17, %r0, %r30
	.word 0xb095211a  ! 4386: ORcc_I	orcc 	%r20, 0x011a, %r24
	.word 0xf4d44020  ! 4389: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r26
cpu_intr_2_338:
	setx	0x40023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xb48461e6  ! 4397: ADDcc_I	addcc 	%r17, 0x01e6, %r26
cpu_intr_2_339:
	setx	0x410104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2340000  ! 4401: ORN_R	orn 	%r16, %r0, %r25
	.word 0xf4146029  ! 4402: LDUH_I	lduh	[%r17 + 0x0029], %r26
	.word 0xb63c20cf  ! 4404: XNOR_I	xnor 	%r16, 0x00cf, %r27
iob_intr_2_368:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_368), 16, 16)) -> intp(2, 0, 3)
iob_intr_2_369:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_369), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_wr_197:
	mov	0x5, %r14
	.word 0xfcf384a0  ! 4411: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbc840000  ! 4412: ADDcc_R	addcc 	%r16, %r0, %r30
T2_asi_reg_rd_194:
	mov	0x3, %r14
	.word 0xfadb8e80  ! 4413: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_2_340:
	setx	0x40003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe948020  ! 4418: LDUHA_R	lduha	[%r18, %r0] 0x01, %r31
cpu_intr_2_341:
	setx	0x420132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf68521ed  ! 4423: LDUWA_I	lduwa	[%r20, + 0x01ed] %asi, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_195:
	mov	0x12, %r14
	.word 0xf2db84a0  ! 4426: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_2_342:
	setx	0x420324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6946067  ! 4428: ORcc_I	orcc 	%r17, 0x0067, %r27
iob_intr_2_370:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_370), 16, 16)) -> intp(2, 0, c)
cpu_intr_2_343:
	setx	0x43021a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_344:
	setx	0x400311, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_198:
	mov	0x38, %r14
	.word 0xf4f38e40  ! 4433: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf40c4000  ! 4434: LDUB_R	ldub	[%r17 + %r0], %r26
T2_asi_reg_wr_199:
	mov	0x3c3, %r14
	.word 0xf4f38e80  ! 4435: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_2_345:
	setx	0x400036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcd52107  ! 4438: LDSHA_I	ldsha	[%r20, + 0x0107] %asi, %r30
	.word 0xfcd42188  ! 4440: LDSHA_I	ldsha	[%r16, + 0x0188] %asi, %r30
iob_intr_2_371:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_371), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf44dc000  ! 4446: LDSB_R	ldsb	[%r23 + %r0], %r26
cpu_intr_2_346:
	setx	0x40023a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_196:
	mov	0x1d, %r14
	.word 0xf8db8e60  ! 4451: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_2_347:
	setx	0x430232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44c6141  ! 4455: LDSB_I	ldsb	[%r17 + 0x0141], %r26
iob_intr_2_372:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_372), 16, 16)) -> intp(2, 0, 4)
	.word 0xfa854020  ! 4460: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r29
	.word 0xfec561bd  ! 4462: LDSWA_I	ldswa	[%r21, + 0x01bd] %asi, %r31
	.word 0xf6054000  ! 4464: LDUW_R	lduw	[%r21 + %r0], %r27
T2_asi_reg_rd_197:
	mov	0x3c7, %r14
	.word 0xfedb84a0  ! 4466: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf6d5c020  ! 4467: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r27
	.word 0xf0444000  ! 4468: LDSW_R	ldsw	[%r17 + %r0], %r24
iob_intr_2_373:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_373), 16, 16)) -> intp(2, 0, 2c)
T2_asi_reg_wr_200:
	mov	0x34, %r14
	.word 0xf8f38e60  ! 4472: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_2_374:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_374), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf295a00b  ! 4474: LDUHA_I	lduha	[%r22, + 0x000b] %asi, %r25
cpu_intr_2_348:
	setx	0x400005, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_375:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_375), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_rd_198:
	mov	0x13, %r14
	.word 0xf6db8e80  ! 4480: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xfe8d8020  ! 4481: LDUBA_R	lduba	[%r22, %r0] 0x01, %r31
	ta	T_CHANGE_TO_TL0
iob_intr_2_376:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_376), 16, 16)) -> intp(2, 0, 2c)
iob_intr_2_377:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_377), 16, 16)) -> intp(2, 0, 23)
cpu_intr_2_349:
	setx	0x430011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc450000  ! 4490: LDSW_R	ldsw	[%r20 + %r0], %r30
	.word 0xfa5cc000  ! 4491: LDX_R	ldx	[%r19 + %r0], %r29
	.word 0xf2d48020  ! 4492: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r25
cpu_intr_2_350:
	setx	0x430135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb89cc000  ! 4494: XORcc_R	xorcc 	%r19, %r0, %r28
	.word 0xf4148000  ! 4495: LDUH_R	lduh	[%r18 + %r0], %r26
iob_intr_2_378:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_378), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_rd_199:
	mov	0x2e, %r14
	.word 0xf4db8e40  ! 4501: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfc8de116  ! 4503: LDUBA_I	lduba	[%r23, + 0x0116] %asi, %r30
T2_asi_reg_wr_201:
	mov	0x3c6, %r14
	.word 0xf2f389e0  ! 4504: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_2_351:
	setx	0x430303, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_379:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_379), 16, 16)) -> intp(2, 0, 33)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_380:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_380), 16, 16)) -> intp(2, 0, 38)
	.word 0xbaa58000  ! 4515: SUBcc_R	subcc 	%r22, %r0, %r29
	.word 0xf84ca049  ! 4516: LDSB_I	ldsb	[%r18 + 0x0049], %r28
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982bc0  ! 4517: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc0, %hpstate
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983802  ! 4518: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1802, %hpstate
	.word 0xfe55211c  ! 4522: LDSH_I	ldsh	[%r20 + 0x011c], %r31
cpu_intr_2_352:
	setx	0x430113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_381:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_381), 16, 16)) -> intp(2, 0, 31)
cpu_intr_2_353:
	setx	0x410224, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf64ca0da  ! 4538: LDSB_I	ldsb	[%r18 + 0x00da], %r27
cpu_intr_2_354:
	setx	0x41012c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_355:
	setx	0x410026, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_382:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_382), 16, 16)) -> intp(2, 0, 28)
cpu_intr_2_356:
	setx	0x20214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64420f4  ! 4548: LDSW_I	ldsw	[%r16 + 0x00f4], %r27
cpu_intr_2_357:
	setx	0x410012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6dda12f  ! 4555: LDXA_I	ldxa	[%r22, + 0x012f] %asi, %r27
	.word 0xfa054000  ! 4556: LDUW_R	lduw	[%r21 + %r0], %r29
T2_asi_reg_rd_200:
	mov	0x3c6, %r14
	.word 0xfcdb8e80  ! 4558: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T2_asi_reg_rd_201:
	mov	0x3c2, %r14
	.word 0xfedb8400  ! 4560: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf6dca1fd  ! 4561: LDXA_I	ldxa	[%r18, + 0x01fd] %asi, %r27
	.word 0xf04d8000  ! 4565: LDSB_R	ldsb	[%r22 + %r0], %r24
	.word 0xfcc44020  ! 4566: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r30
cpu_intr_2_358:
	setx	0x400034, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_383:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_383), 16, 16)) -> intp(2, 0, 15)
	.word 0xfa95a139  ! 4569: LDUHA_I	lduha	[%r22, + 0x0139] %asi, %r29
cpu_intr_2_359:
	setx	0x410200, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_202:
	mov	0x3c8, %r14
	.word 0xfedb8400  ! 4574: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_2_360:
	setx	0x42000f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_361:
	setx	0x42020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_203:
	mov	0x3, %r14
	.word 0xfadb8e80  ! 4580: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_2_384:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_384), 16, 16)) -> intp(2, 0, 31)
	ta	T_CHANGE_NONHPRIV
iob_intr_2_385:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_385), 16, 16)) -> intp(2, 0, 2c)
T2_asi_reg_wr_202:
	mov	0xa, %r14
	.word 0xf2f38e40  ! 4588: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	.word 0xf085e177  ! 4592: LDUWA_I	lduwa	[%r23, + 0x0177] %asi, %r24
	.word 0xb8a40000  ! 4593: SUBcc_R	subcc 	%r16, %r0, %r28
	.word 0xbe248000  ! 4596: SUB_R	sub 	%r18, %r0, %r31
T2_asi_reg_rd_204:
	mov	0x24, %r14
	.word 0xfedb8e40  ! 4597: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb41d613a  ! 4599: XOR_I	xor 	%r21, 0x013a, %r26
cpu_intr_2_362:
	setx	0x440218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc948020  ! 4601: LDUHA_R	lduha	[%r18, %r0] 0x01, %r30
cpu_intr_2_363:
	setx	0x450214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6954020  ! 4608: LDUHA_R	lduha	[%r21, %r0] 0x01, %r27
	.word 0xf00d604f  ! 4609: LDUB_I	ldub	[%r21 + 0x004f], %r24
	.word 0xf40c2028  ! 4611: LDUB_I	ldub	[%r16 + 0x0028], %r26
	.word 0xf6144000  ! 4612: LDUH_R	lduh	[%r17 + %r0], %r27
T2_asi_reg_rd_205:
	mov	0x3c3, %r14
	.word 0xfedb8e40  ! 4613: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbe4521d8  ! 4615: ADDC_I	addc 	%r20, 0x01d8, %r31
iob_intr_2_386:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_386), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf2c5610f  ! 4617: LDSWA_I	ldswa	[%r21, + 0x010f] %asi, %r25
	.word 0xf4148000  ! 4618: LDUH_R	lduh	[%r18 + %r0], %r26
iob_intr_2_387:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_387), 16, 16)) -> intp(2, 0, 26)
	.word 0xf48d8020  ! 4621: LDUBA_R	lduba	[%r22, %r0] 0x01, %r26
iob_intr_2_388:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_388), 16, 16)) -> intp(2, 0, 16)
cpu_intr_2_364:
	setx	0x440124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0148000  ! 4625: LDUH_R	lduh	[%r18 + %r0], %r24
iob_intr_2_389:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_389), 16, 16)) -> intp(2, 0, 39)
cpu_intr_2_365:
	setx	0x44011b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_390:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_390), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf4c48020  ! 4629: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r26
	.word 0xfe85c020  ! 4630: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r31
T2_asi_reg_wr_203:
	mov	0x3c6, %r14
	.word 0xf2f38400  ! 4631: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T2_asi_reg_wr_204:
	mov	0x3c7, %r14
	.word 0xf2f38400  ! 4633: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_2_366:
	setx	0x46020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_391:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_391), 16, 16)) -> intp(2, 0, 29)
	.word 0xfe45c000  ! 4637: LDSW_R	ldsw	[%r23 + %r0], %r31
cpu_intr_2_367:
	setx	0x440028, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_205:
	mov	0x2f, %r14
	.word 0xf0f389e0  ! 4641: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_2_392:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_392), 16, 16)) -> intp(2, 0, 32)
	.word 0xf8548000  ! 4646: LDSH_R	ldsh	[%r18 + %r0], %r28
T2_asi_reg_wr_206:
	mov	0x2d, %r14
	.word 0xf0f38e80  ! 4647: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf85d21ba  ! 4649: LDX_I	ldx	[%r20 + 0x01ba], %r28
	.word 0xbd358000  ! 4653: SRL_R	srl 	%r22, %r0, %r30
	ta	T_CHANGE_TO_TL1
iob_intr_2_393:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_393), 16, 16)) -> intp(2, 0, 15)
	.word 0xb88d8000  ! 4656: ANDcc_R	andcc 	%r22, %r0, %r28
	.word 0xfc4da14f  ! 4657: LDSB_I	ldsb	[%r22 + 0x014f], %r30
	.word 0xfe54a194  ! 4658: LDSH_I	ldsh	[%r18 + 0x0194], %r31
	.word 0x899421b2  ! 4660: WRPR_TICK_I	wrpr	%r16, 0x01b2, %tick
	.word 0xf24d4000  ! 4662: LDSB_R	ldsb	[%r21 + %r0], %r25
iob_intr_2_394:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_394), 16, 16)) -> intp(2, 0, 2b)
iob_intr_2_395:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_395), 16, 16)) -> intp(2, 0, 2d)
iob_intr_2_396:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_396), 16, 16)) -> intp(2, 0, 3f)
T2_asi_reg_rd_206:
	mov	0xa, %r14
	.word 0xf2db84a0  ! 4674: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xfa0c8000  ! 4676: LDUB_R	ldub	[%r18 + %r0], %r29
T2_asi_reg_rd_207:
	mov	0x22, %r14
	.word 0xf8db8e60  ! 4677: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_NONHPRIV
	.word 0xfe5c0000  ! 4681: LDX_R	ldx	[%r16 + %r0], %r31
	.word 0xfa44e0f4  ! 4686: LDSW_I	ldsw	[%r19 + 0x00f4], %r29
iob_intr_2_397:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_397), 16, 16)) -> intp(2, 0, 3a)
T2_asi_reg_wr_207:
	mov	0x2, %r14
	.word 0xf6f38e60  ! 4689: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xfe15e19b  ! 4691: LDUH_I	lduh	[%r23 + 0x019b], %r31
	.word 0xf45d8000  ! 4694: LDX_R	ldx	[%r22 + %r0], %r26
	ta	T_CHANGE_HPRIV
cpu_intr_2_368:
	setx	0x470114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4cd0020  ! 4705: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r26
	.word 0xfe5d4000  ! 4708: LDX_R	ldx	[%r21 + %r0], %r31
	.word 0xf6d5c020  ! 4709: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r27
iob_intr_2_398:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_398), 16, 16)) -> intp(2, 0, 32)
	.word 0xf2148000  ! 4711: LDUH_R	lduh	[%r18 + %r0], %r25
T2_asi_reg_rd_208:
	mov	0x20, %r14
	.word 0xf4db8e60  ! 4713: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_2_369:
	setx	0x45001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc8dc020  ! 4717: LDUBA_R	lduba	[%r23, %r0] 0x01, %r30
T2_asi_reg_wr_208:
	mov	0x3c4, %r14
	.word 0xf6f384a0  ! 4718: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T2_asi_reg_wr_209:
	mov	0x1e, %r14
	.word 0xf0f38e60  ! 4719: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_370:
	setx	0x450109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0d40020  ! 4726: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r24
T2_asi_reg_wr_210:
	mov	0x20, %r14
	.word 0xfef38e40  ! 4727: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982e9a  ! 4728: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9a, %hpstate
	.word 0xb2950000  ! 4729: ORcc_R	orcc 	%r20, %r0, %r25
	.word 0xf4c50020  ! 4730: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r26
T2_asi_reg_rd_209:
	mov	0x2f, %r14
	.word 0xf4db84a0  ! 4736: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T2_asi_reg_rd_210:
	mov	0x2b, %r14
	.word 0xfedb84a0  ! 4737: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf0854020  ! 4740: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r24
cpu_intr_2_371:
	setx	0x470315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc0de026  ! 4742: LDUB_I	ldub	[%r23 + 0x0026], %r30
	.word 0xbeb5c000  ! 4743: ORNcc_R	orncc 	%r23, %r0, %r31
	.word 0xfe5d0000  ! 4744: LDX_R	ldx	[%r20 + %r0], %r31
	.word 0xbab5e0e2  ! 4749: ORNcc_I	orncc 	%r23, 0x00e2, %r29
	.word 0xfe5521c4  ! 4751: LDSH_I	ldsh	[%r20 + 0x01c4], %r31
	ta	T_CHANGE_TO_TL0
	.word 0xfe94609d  ! 4755: LDUHA_I	lduha	[%r17, + 0x009d] %asi, %r31
iob_intr_2_399:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_399), 16, 16)) -> intp(2, 0, 8)
	.word 0xfc544000  ! 4759: LDSH_R	ldsh	[%r17 + %r0], %r30
	.word 0xfe8d4020  ! 4760: LDUBA_R	lduba	[%r21, %r0] 0x01, %r31
cpu_intr_2_372:
	setx	0x470331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf84d6038  ! 4763: LDSB_I	ldsb	[%r21 + 0x0038], %r28
	.word 0xbd2c6001  ! 4764: SLL_I	sll 	%r17, 0x0001, %r30
cpu_intr_2_373:
	setx	0x3002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb69d4000  ! 4768: XORcc_R	xorcc 	%r21, %r0, %r27
iob_intr_2_400:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_400), 16, 16)) -> intp(2, 0, 14)
T2_asi_reg_rd_211:
	mov	0x33, %r14
	.word 0xf4db8e40  ! 4777: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xba3420b6  ! 4778: SUBC_I	orn 	%r16, 0x00b6, %r29
iob_intr_2_401:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_401), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_402:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_402), 16, 16)) -> intp(2, 0, e)
	.word 0xf4044000  ! 4787: LDUW_R	lduw	[%r17 + %r0], %r26
iob_intr_2_403:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_403), 16, 16)) -> intp(2, 0, 17)
	.word 0xfccda1d7  ! 4791: LDSBA_I	ldsba	[%r22, + 0x01d7] %asi, %r30
	.word 0xb83cc000  ! 4793: XNOR_R	xnor 	%r19, %r0, %r28
iob_intr_2_404:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_404), 16, 16)) -> intp(2, 0, 2c)
	.word 0xfc94e078  ! 4797: LDUHA_I	lduha	[%r19, + 0x0078] %asi, %r30
	.word 0xb435e169  ! 4798: ORN_I	orn 	%r23, 0x0169, %r26
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983b0a  ! 4799: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b0a, %hpstate
	ta	T_CHANGE_TO_TL0
	.word 0xfccde1a6  ! 4802: LDSBA_I	ldsba	[%r23, + 0x01a6] %asi, %r30
	.word 0xf04cc000  ! 4803: LDSB_R	ldsb	[%r19 + %r0], %r24
T2_asi_reg_rd_212:
	mov	0x21, %r14
	.word 0xf2db8e40  ! 4805: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_2_405:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_405), 16, 16)) -> intp(2, 0, 1d)
	ta	T_CHANGE_HPRIV
	.word 0xfc854020  ! 4811: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r30
cpu_intr_2_374:
	setx	0x46021f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_213:
	mov	0x2b, %r14
	.word 0xfcdb8e80  ! 4814: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983808  ! 4815: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1808, %hpstate
	.word 0xf2cce0bd  ! 4816: LDSBA_I	ldsba	[%r19, + 0x00bd] %asi, %r25
iob_intr_2_406:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_406), 16, 16)) -> intp(2, 0, d)
	.word 0xf6840020  ! 4820: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r27
cpu_intr_2_375:
	setx	0x460316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb225601c  ! 4824: SUB_I	sub 	%r21, 0x001c, %r25
	.word 0xf08c4020  ! 4827: LDUBA_R	lduba	[%r17, %r0] 0x01, %r24
cpu_intr_2_376:
	setx	0x440209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60d0000  ! 4830: LDUB_R	ldub	[%r20 + %r0], %r27
	.word 0xf05da122  ! 4831: LDX_I	ldx	[%r22 + 0x0122], %r24
	.word 0xf00ce021  ! 4833: LDUB_I	ldub	[%r19 + 0x0021], %r24
	.word 0xfc852077  ! 4837: LDUWA_I	lduwa	[%r20, + 0x0077] %asi, %r30
	.word 0xb4040000  ! 4841: ADD_R	add 	%r16, %r0, %r26
T2_asi_reg_wr_211:
	mov	0x20, %r14
	.word 0xf4f38e80  ! 4842: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0x8d94a140  ! 4843: WRPR_PSTATE_I	wrpr	%r18, 0x0140, %pstate
	.word 0xfe8d8020  ! 4844: LDUBA_R	lduba	[%r22, %r0] 0x01, %r31
T2_asi_reg_rd_214:
	mov	0x3c2, %r14
	.word 0xf6db8e60  ! 4845: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T2_asi_reg_wr_212:
	mov	0xb, %r14
	.word 0xf6f384a0  ! 4847: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_2_377:
	setx	0x450032, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_378:
	setx	0x46011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd520000  ! 4850: RDPR_PIL	<illegal instruction>
	.word 0xf084a132  ! 4852: LDUWA_I	lduwa	[%r18, + 0x0132] %asi, %r24
T2_asi_reg_wr_213:
	mov	0x14, %r14
	.word 0xf2f38400  ! 4853: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xf8dda179  ! 4857: LDXA_I	ldxa	[%r22, + 0x0179] %asi, %r28
iob_intr_2_407:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_407), 16, 16)) -> intp(2, 0, 32)
	.word 0xf6948020  ! 4859: LDUHA_R	lduha	[%r18, %r0] 0x01, %r27
	.word 0xfa4de1c4  ! 4860: LDSB_I	ldsb	[%r23 + 0x01c4], %r29
	.word 0xfe95a1ca  ! 4861: LDUHA_I	lduha	[%r22, + 0x01ca] %asi, %r31
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982b0a  ! 4862: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0a, %hpstate
	.word 0xf0048000  ! 4864: LDUW_R	lduw	[%r18 + %r0], %r24
	.word 0xf205c000  ! 4865: LDUW_R	lduw	[%r23 + %r0], %r25
iob_intr_2_408:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_408), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_rd_215:
	mov	0x1f, %r14
	.word 0xf8db8400  ! 4868: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_2_409:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_409), 16, 16)) -> intp(2, 0, 28)
cpu_intr_2_379:
	setx	0x450036, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_410:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_410), 16, 16)) -> intp(2, 0, 38)
T2_asi_reg_rd_216:
	mov	0x13, %r14
	.word 0xf0db8e80  ! 4872: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T2_asi_reg_rd_217:
	mov	0x38, %r14
	.word 0xf0db84a0  ! 4873: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf8844020  ! 4874: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r28
iob_intr_2_411:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_411), 16, 16)) -> intp(2, 0, 36)
T2_asi_reg_wr_214:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 4878: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_rd_218:
	mov	0x1, %r14
	.word 0xf8db84a0  ! 4881: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_2_380:
	setx	0x46003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8bde136  ! 4884: XNORcc_I	xnorcc 	%r23, 0x0136, %r28
	.word 0xf6d4a0c2  ! 4885: LDSHA_I	ldsha	[%r18, + 0x00c2] %asi, %r27
	.word 0xfc04e010  ! 4888: LDUW_I	lduw	[%r19 + 0x0010], %r30
cpu_intr_2_381:
	setx	0x440110, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_412:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_412), 16, 16)) -> intp(2, 0, 2)
iob_intr_2_413:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_413), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_wr_215:
	mov	0x3c8, %r14
	.word 0xf6f38e40  ! 4894: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_wr_216:
	mov	0x6, %r14
	.word 0xf4f389e0  ! 4896: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T2_asi_reg_rd_219:
	mov	0x17, %r14
	.word 0xf0db89e0  ! 4899: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T2_asi_reg_wr_217:
	mov	0x20, %r14
	.word 0xf0f38400  ! 4900: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb895603c  ! 4902: ORcc_I	orcc 	%r21, 0x003c, %r28
iob_intr_2_414:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_414), 16, 16)) -> intp(2, 0, 16)
	.word 0xbe1de080  ! 4904: XOR_I	xor 	%r23, 0x0080, %r31
	.word 0xfacd2153  ! 4905: LDSBA_I	ldsba	[%r20, + 0x0153] %asi, %r29
	.word 0xfe9561b6  ! 4906: LDUHA_I	lduha	[%r21, + 0x01b6] %asi, %r31
T2_asi_reg_rd_220:
	mov	0x1c, %r14
	.word 0xf4db84a0  ! 4908: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf40d2191  ! 4914: LDUB_I	ldub	[%r20 + 0x0191], %r26
T2_asi_reg_wr_218:
	mov	0x32, %r14
	.word 0xfef38e40  ! 4917: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_2_382:
	setx	0x450015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb77d8400  ! 4919: MOVR_R	movre	%r22, %r0, %r27
iob_intr_2_415:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_415), 16, 16)) -> intp(2, 0, 20)
T2_asi_reg_wr_219:
	mov	0x12, %r14
	.word 0xfcf384a0  ! 4922: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_2_383:
	setx	0x470009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfecc4020  ! 4927: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r31
T2_asi_reg_wr_220:
	mov	0x7, %r14
	.word 0xf8f384a0  ! 4929: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf85420d2  ! 4930: LDSH_I	ldsh	[%r16 + 0x00d2], %r28
	.word 0xb804e143  ! 4934: ADD_I	add 	%r19, 0x0143, %r28
cpu_intr_2_384:
	setx	0x440137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf244213c  ! 4936: LDSW_I	ldsw	[%r16 + 0x013c], %r25
T2_asi_reg_rd_221:
	mov	0x3c3, %r14
	.word 0xf6db8e60  ! 4937: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T2_asi_reg_wr_221:
	mov	0x1b, %r14
	.word 0xf8f38e80  ! 4938: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T2_asi_reg_wr_222:
	mov	0x3c7, %r14
	.word 0xf4f384a0  ! 4939: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb21d0000  ! 4940: XOR_R	xor 	%r20, %r0, %r25
	.word 0xf44da1ca  ! 4941: LDSB_I	ldsb	[%r22 + 0x01ca], %r26
	.word 0xf8c5e18d  ! 4942: LDSWA_I	ldswa	[%r23, + 0x018d] %asi, %r28
	.word 0xbe050000  ! 4944: ADD_R	add 	%r20, %r0, %r31
	.word 0xf85cc000  ! 4945: LDX_R	ldx	[%r19 + %r0], %r28
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983f10  ! 4949: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f10, %hpstate
	.word 0xf2158000  ! 4950: LDUH_R	lduh	[%r22 + %r0], %r25
cpu_intr_2_385:
	setx	0x46000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8dca053  ! 4954: LDXA_I	ldxa	[%r18, + 0x0053] %asi, %r28
	.word 0xfe0cc000  ! 4956: LDUB_R	ldub	[%r19 + %r0], %r31
cpu_intr_2_386:
	setx	0x450323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb97cc400  ! 4961: MOVR_R	movre	%r19, %r0, %r28
	.word 0xfacc0020  ! 4964: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r29
	.word 0xfac521ac  ! 4966: LDSWA_I	ldswa	[%r20, + 0x01ac] %asi, %r29
T2_asi_reg_rd_222:
	mov	0x29, %r14
	.word 0xf4db84a0  ! 4968: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_2_416:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_416), 16, 16)) -> intp(2, 0, 24)
cpu_intr_2_387:
	setx	0x440301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba2da1e0  ! 4972: ANDN_I	andn 	%r22, 0x01e0, %r29
	.word 0xbe444000  ! 4975: ADDC_R	addc 	%r17, %r0, %r31
	.word 0xf6c54020  ! 4978: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r27
	.word 0xf8c50020  ! 4979: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r28
T2_asi_reg_rd_223:
	mov	0x6, %r14
	.word 0xf6db89e0  ! 4980: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_2_388:
	setx	0x46021a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_389:
	setx	0x47023e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_224:
	mov	0x31, %r14
	.word 0xfcdb8e40  ! 4983: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_2_390:
	setx	0x44021d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_417:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_417), 16, 16)) -> intp(2, 0, 37)
	.word 0xf215a16b  ! 4987: LDUH_I	lduh	[%r22 + 0x016b], %r25
T2_asi_reg_wr_223:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 4988: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_2_391:
	setx	0x440113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2dd21a8  ! 4992: LDXA_I	ldxa	[%r20, + 0x01a8] %asi, %r25
	.word 0xfcd520fb  ! 4993: LDSHA_I	ldsha	[%r20, + 0x00fb] %asi, %r30
	.word 0xf295a142  ! 4994: LDUHA_I	lduha	[%r22, + 0x0142] %asi, %r25
T2_asi_reg_wr_224:
	mov	0xf, %r14
	.word 0xf2f389e0  ! 4998: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_2_418:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_418), 16, 16)) -> intp(2, 0, 25)
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xb5a40860  ! 1: FADDq	dis not found

iob_intr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_0), 16, 16)) -> intp(1, 0, 10)
T1_asi_reg_wr_0:
	mov	0x21, %r14
	.word 0xfaf38e80  ! 7: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T1_asi_reg_wr_1:
	mov	0x2, %r14
	.word 0xf2f38400  ! 9: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_1_0:
	setx	0x1f031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12d6001  ! 12: SLL_I	sll 	%r21, 0x0001, %r24
cpu_intr_1_1:
	setx	0x1d013c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_1), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb3a90820  ! 25: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xbf34e001  ! 26: SRL_I	srl 	%r19, 0x0001, %r31
cpu_intr_1_2:
	setx	0x1e030e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_2), 16, 16)) -> intp(1, 0, 12)
	.word 0xb1a508c0  ! 29: FSUBd	fsubd	%f20, %f0, %f24
T1_asi_reg_wr_2:
	mov	0x1a, %r14
	.word 0xf6f38e40  ! 32: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_3:
	setx	0x1d0325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a88820  ! 40: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb9352001  ! 42: SRL_I	srl 	%r20, 0x0001, %r28
cpu_intr_1_4:
	setx	0x1f0121, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_3), 16, 16)) -> intp(1, 0, 2a)
cpu_intr_1_5:
	setx	0x1f0305, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_4), 16, 16)) -> intp(1, 0, 39)
	.word 0xbba80820  ! 51: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xb1aa0820  ! 54: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xa1902000  ! 57: WRPR_GL_I	wrpr	%r0, 0x0000, %-
cpu_intr_1_6:
	setx	0x1c0331, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_0:
	mov	0x18, %r14
	.word 0xf0db8e60  ! 60: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T1_asi_reg_rd_1:
	mov	0x30, %r14
	.word 0xf4db8e40  ! 62: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_5), 16, 16)) -> intp(1, 0, 39)
	.word 0xbfa84820  ! 67: FMOVE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_7:
	setx	0x1e030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a8c820  ! 72: FMOVL	fmovs	%fcc1, %f0, %f28
cpu_intr_1_8:
	setx	0x1f010d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_3:
	mov	0x2e, %r14
	.word 0xfef38400  ! 79: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbda88820  ! 85: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb3a80820  ! 86: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb1a00540  ! 87: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbba00520  ! 89: FSQRTs	fsqrt	
cpu_intr_1_9:
	setx	0x1e033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_6), 16, 16)) -> intp(1, 0, 3b)
	.word 0xba44e182  ! 99: ADDC_I	addc 	%r19, 0x0182, %r29
	.word 0xb3a80420  ! 103: FMOVRZ	dis not found

	.word 0xb9a548a0  ! 105: FSUBs	fsubs	%f21, %f0, %f28
	.word 0xbf3d1000  ! 106: SRAX_R	srax	%r20, %r0, %r31
	.word 0xbaa50000  ! 110: SUBcc_R	subcc 	%r20, %r0, %r29
T1_asi_reg_rd_2:
	mov	0x3c5, %r14
	.word 0xf4db8e60  ! 111: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_7), 16, 16)) -> intp(1, 0, 2a)
iob_intr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_8), 16, 16)) -> intp(1, 0, c)
cpu_intr_1_10:
	setx	0x1c0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aac820  ! 119: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb1a00540  ! 120: FSQRTd	fsqrt	
T1_asi_reg_wr_4:
	mov	0x6, %r14
	.word 0xf6f38e40  ! 123: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_11:
	setx	0x1e011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd343001  ! 127: SRLX_I	srlx	%r16, 0x0001, %r30
	.word 0xb5a549e0  ! 129: FDIVq	dis not found

	.word 0xb9ab0820  ! 131: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xb5aa0820  ! 132: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb37cc400  ! 138: MOVR_R	movre	%r19, %r0, %r25
iob_intr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_9), 16, 16)) -> intp(1, 0, c)
	.word 0xb9a54920  ! 143: FMULs	fmuls	%f21, %f0, %f28
T1_asi_reg_wr_5:
	mov	0x13, %r14
	.word 0xfef38e80  ! 144: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_10), 16, 16)) -> intp(1, 0, 32)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_11), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_wr_6:
	mov	0x2c, %r14
	.word 0xf6f384a0  ! 152: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_1_12:
	setx	0x1f0203, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_13:
	setx	0x1d002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80820  ! 156: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xbba00540  ! 158: FSQRTd	fsqrt	
	.word 0xb1a94820  ! 160: FMOVCS	fmovs	%fcc1, %f0, %f24
cpu_intr_1_14:
	setx	0x1c0208, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_15:
	setx	0x1c000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb834206b  ! 163: SUBC_I	orn 	%r16, 0x006b, %r28
T1_asi_reg_wr_7:
	mov	0xf, %r14
	.word 0xfef384a0  ! 166: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb53c8000  ! 167: SRA_R	sra 	%r18, %r0, %r26
	.word 0xb83421b6  ! 168: ORN_I	orn 	%r16, 0x01b6, %r28
iob_intr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_12), 16, 16)) -> intp(1, 0, 31)
cpu_intr_1_16:
	setx	0x1c0117, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_3:
	mov	0x3c3, %r14
	.word 0xfadb8e60  ! 178: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_1_17:
	setx	0x1c0231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda548c0  ! 181: FSUBd	fsubd	%f52, %f0, %f30
	.word 0xb7a00540  ! 182: FSQRTd	fsqrt	
cpu_intr_1_18:
	setx	0x1d0200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb2d9000  ! 184: SLLX_R	sllx	%r22, %r0, %r29
cpu_intr_1_19:
	setx	0x1c0130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa549c0  ! 187: FDIVd	fdivd	%f52, %f0, %f62
iob_intr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_13), 16, 16)) -> intp(1, 0, 3e)
	lda	[%r21 + %g0] 0xf0, %f2
T1_asi_reg_wr_8:
	mov	0x28, %r14
	.word 0xf0f38400  ! 192: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T1_asi_reg_rd_4:
	mov	0x3c8, %r14
	.word 0xf6db8e80  ! 193: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb5a50960  ! 196: FMULq	dis not found

	.word 0xb7a549e0  ! 197: FDIVq	dis not found

	.word 0xb7a90820  ! 198: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xbba80c20  ! 199: FMOVRLZ	dis not found

	.word 0xb1aa0820  ! 200: FMOVA	fmovs	%fcc1, %f0, %f24
iob_intr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_14), 16, 16)) -> intp(1, 0, 22)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_15), 16, 16)) -> intp(1, 0, f)
	.word 0xbda5c840  ! 206: FADDd	faddd	%f54, %f0, %f30
	.word 0xb9a509c0  ! 207: FDIVd	fdivd	%f20, %f0, %f28
	.word 0xbfa81c20  ! 209: FMOVRGEZ	dis not found

T1_asi_reg_rd_5:
	mov	0xf, %r14
	.word 0xf0db84a0  ! 210: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5abc820  ! 213: FMOVVC	fmovs	%fcc1, %f0, %f26
cpu_intr_1_20:
	setx	0x1f0006, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_9:
	mov	0xe, %r14
	.word 0xf6f38400  ! 217: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbba40820  ! 218: FADDs	fadds	%f16, %f0, %f29
iob_intr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_16), 16, 16)) -> intp(1, 0, 1)
	.word 0xbfa50820  ! 225: FADDs	fadds	%f20, %f0, %f31
	.word 0xb9a5c960  ! 227: FMULq	dis not found

	.word 0xb2148000  ! 228: OR_R	or 	%r18, %r0, %r25
iob_intr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_17), 16, 16)) -> intp(1, 0, 1)
cpu_intr_1_21:
	setx	0x1d0038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa84820  ! 232: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xb1a80820  ! 233: FMOVN	fmovs	%fcc1, %f0, %f24
iob_intr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_18), 16, 16)) -> intp(1, 0, 13)
	.word 0xbaa4c000  ! 238: SUBcc_R	subcc 	%r19, %r0, %r29
T1_asi_reg_wr_10:
	mov	0x38, %r14
	.word 0xf8f389e0  ! 239: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb5a4c8e0  ! 242: FSUBq	dis not found

	.word 0xb1aa4820  ! 244: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb9aa0820  ! 245: FMOVA	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_6:
	mov	0xa, %r14
	.word 0xf0db84a0  ! 248: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbeb50000  ! 249: SUBCcc_R	orncc 	%r20, %r0, %r31
	.word 0xb9ab0820  ! 250: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xbfa50920  ! 254: FMULs	fmuls	%f20, %f0, %f31
cpu_intr_1_22:
	setx	0x1f030f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_19), 16, 16)) -> intp(1, 0, 19)
cpu_intr_1_23:
	setx	0x1d011f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_7:
	mov	0x3c5, %r14
	.word 0xf4db8e40  ! 262: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_wr_11:
	mov	0x22, %r14
	.word 0xf6f38e40  ! 264: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_24:
	setx	0x1c0109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa88820  ! 270: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xbc1c0000  ! 272: XOR_R	xor 	%r16, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a00540  ! 274: FSQRTd	fsqrt	
	.word 0xbe8c4000  ! 277: ANDcc_R	andcc 	%r17, %r0, %r31
	.word 0xb3a5c8e0  ! 279: FSUBq	dis not found

	.word 0xbba489e0  ! 284: FDIVq	dis not found

T1_asi_reg_rd_8:
	mov	0xd, %r14
	.word 0xf8db84a0  ! 288: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_1_25:
	setx	0x1c033a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_26:
	setx	0x1d011f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_20), 16, 16)) -> intp(1, 0, 26)
iob_intr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_21), 16, 16)) -> intp(1, 0, 7)
iob_intr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_22), 16, 16)) -> intp(1, 0, 6)
iob_intr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_23), 16, 16)) -> intp(1, 0, 2c)
T1_asi_reg_wr_12:
	mov	0x3c4, %r14
	.word 0xf4f389e0  ! 298: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbba5c920  ! 300: FMULs	fmuls	%f23, %f0, %f29
	.word 0xb9a4c8c0  ! 303: FSUBd	fsubd	%f50, %f0, %f28
	.word 0xbba48920  ! 305: FMULs	fmuls	%f18, %f0, %f29
	.word 0xb1a90820  ! 306: FMOVLEU	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_13:
	mov	0x10, %r14
	.word 0xfcf384a0  ! 308: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_24), 16, 16)) -> intp(1, 0, c)
	.word 0xb244e13f  ! 315: ADDC_I	addc 	%r19, 0x013f, %r25
	.word 0xbfa00520  ! 316: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a409e0  ! 319: FDIVq	dis not found

iob_intr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_25), 16, 16)) -> intp(1, 0, 33)
T1_asi_reg_wr_14:
	mov	0x9, %r14
	.word 0xf8f384a0  ! 326: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T1_asi_reg_rd_9:
	mov	0x30, %r14
	.word 0xfadb89e0  ! 327: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_1_27:
	setx	0x1e0209, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_26), 16, 16)) -> intp(1, 0, 12)
	.word 0xb9a409a0  ! 330: FDIVs	fdivs	%f16, %f0, %f28
	.word 0xbf357001  ! 333: SRLX_I	srlx	%r21, 0x0001, %r31
	.word 0xb0254000  ! 335: SUB_R	sub 	%r21, %r0, %r24
iob_intr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_27), 16, 16)) -> intp(1, 0, 1)
	.word 0xb7a81c20  ! 338: FMOVRGEZ	dis not found

T1_asi_reg_wr_15:
	mov	0x3c0, %r14
	.word 0xfef38e40  ! 341: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbbaa8820  ! 342: FMOVG	fmovs	%fcc1, %f0, %f29
iob_intr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_28), 16, 16)) -> intp(1, 0, 8)
	.word 0xbfaa4820  ! 345: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xbfa44940  ! 346: FMULd	fmuld	%f48, %f0, %f62
	.word 0xbfa589c0  ! 347: FDIVd	fdivd	%f22, %f0, %f62
T1_asi_reg_rd_10:
	mov	0x3c5, %r14
	.word 0xf0db89e0  ! 349: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T1_asi_reg_wr_16:
	mov	0xe, %r14
	.word 0xfaf384a0  ! 352: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb6954000  ! 354: ORcc_R	orcc 	%r21, %r0, %r27
	.word 0xbfa88820  ! 357: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb1a5c920  ! 358: FMULs	fmuls	%f23, %f0, %f24
T1_asi_reg_wr_17:
	mov	0x3c1, %r14
	.word 0xf0f384a0  ! 360: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbba54820  ! 363: FADDs	fadds	%f21, %f0, %f29
T1_asi_reg_wr_18:
	mov	0x3c3, %r14
	.word 0xfcf389e0  ! 365: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_1_28:
	setx	0x1c0211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00560  ! 369: FSQRTq	fsqrt	
iob_intr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_29), 16, 16)) -> intp(1, 0, d)
	.word 0xb7a81c20  ! 376: FMOVRGEZ	dis not found

iob_intr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_30), 16, 16)) -> intp(1, 0, 3f)
T1_asi_reg_rd_11:
	mov	0x3c0, %r14
	.word 0xf2db8400  ! 381: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_31), 16, 16)) -> intp(1, 0, 30)
iob_intr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_32), 16, 16)) -> intp(1, 0, 4)
T1_asi_reg_rd_12:
	mov	0x3c7, %r14
	.word 0xfcdb84a0  ! 384: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_1_29:
	setx	0x1f003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a5c860  ! 387: FADDq	dis not found

	.word 0xbba80420  ! 391: FMOVRZ	dis not found

	.word 0xb9a4c8c0  ! 392: FSUBd	fsubd	%f50, %f0, %f28
	.word 0xb5a98820  ! 393: FMOVNEG	fmovs	%fcc1, %f0, %f26
iob_intr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_33), 16, 16)) -> intp(1, 0, 27)
T1_asi_reg_wr_19:
	mov	0x3c2, %r14
	.word 0xf2f38e40  ! 395: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbbab8820  ! 396: FMOVPOS	fmovs	%fcc1, %f0, %f29
	lda	[%r20 + %g0] 0xf0, %f2
T1_asi_reg_rd_13:
	mov	0x3c8, %r14
	.word 0xf0db89e0  ! 402: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_34), 16, 16)) -> intp(1, 0, 7)
iob_intr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_35), 16, 16)) -> intp(1, 0, 17)
	.word 0xbda44860  ! 409: FADDq	dis not found

cpu_intr_1_30:
	setx	0x1f0220, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_14:
	mov	0x2c, %r14
	.word 0xf4db89e0  ! 411: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_36), 16, 16)) -> intp(1, 0, 10)
T1_asi_reg_wr_20:
	mov	0x10, %r14
	.word 0xf2f389e0  ! 416: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbba98820  ! 418: FMOVNEG	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_rd_15:
	mov	0x2a, %r14
	.word 0xf0db8e40  ! 420: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_1_31:
	setx	0x1f0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00040  ! 425: FMOVd	fmovd	%f0, %f30
cpu_intr_1_32:
	setx	0x1f013d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_37), 16, 16)) -> intp(1, 0, e)
iob_intr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_38), 16, 16)) -> intp(1, 0, 1e)
cpu_intr_1_33:
	setx	0x1d0339, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_39), 16, 16)) -> intp(1, 0, 8)
	.word 0xbfa4c9c0  ! 434: FDIVd	fdivd	%f50, %f0, %f62
	.word 0xbfa50840  ! 435: FADDd	faddd	%f20, %f0, %f62
	.word 0x8d9421cd  ! 436: WRPR_PSTATE_I	wrpr	%r16, 0x01cd, %pstate
iob_intr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_40), 16, 16)) -> intp(1, 0, 17)
	.word 0xbda48920  ! 438: FMULs	fmuls	%f18, %f0, %f30
iob_intr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_41), 16, 16)) -> intp(1, 0, 39)
	.word 0xb7641800  ! 440: MOVcc_R	<illegal instruction>
	.word 0xbb3df001  ! 441: SRAX_I	srax	%r23, 0x0001, %r29
T1_asi_reg_rd_16:
	mov	0x1e, %r14
	.word 0xf0db89e0  ! 444: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_1_34:
	setx	0x1e010b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_35:
	setx	0x1f0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a81c20  ! 449: FMOVRGEZ	dis not found

T1_asi_reg_wr_21:
	mov	0x17, %r14
	.word 0xfaf384a0  ! 451: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_1_36:
	setx	0x1c0216, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_22:
	mov	0x37, %r14
	.word 0xfcf38e40  ! 455: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbc8d20db  ! 457: ANDcc_I	andcc 	%r20, 0x00db, %r30
	.word 0xb3518000  ! 458: RDPR_PSTATE	<illegal instruction>
cpu_intr_1_37:
	setx	0x22033e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_38:
	setx	0x200131, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_17:
	mov	0x3c7, %r14
	.word 0xf4db8e60  ! 464: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb5a409e0  ! 465: FDIVq	dis not found

	.word 0xbda8c820  ! 468: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb0b44000  ! 469: ORNcc_R	orncc 	%r17, %r0, %r24
	.word 0xb7540000  ! 471: RDPR_GL	<illegal instruction>
	.word 0xb7a00520  ! 472: FSQRTs	fsqrt	
cpu_intr_1_39:
	setx	0x220233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00560  ! 478: FSQRTq	fsqrt	
	.word 0xb6b4c000  ! 485: ORNcc_R	orncc 	%r19, %r0, %r27
T1_asi_reg_wr_23:
	mov	0x2f, %r14
	.word 0xf6f38e80  ! 486: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_1_40:
	setx	0x220110, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_42), 16, 16)) -> intp(1, 0, 17)
T1_asi_reg_rd_18:
	mov	0x1f, %r14
	.word 0xf2db84a0  ! 493: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_1_41:
	setx	0x230039, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_42:
	setx	0x210324, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_43:
	setx	0x20030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xb035a195  ! 503: SUBC_I	orn 	%r22, 0x0195, %r24
T1_asi_reg_rd_19:
	mov	0x15, %r14
	.word 0xf8db89e0  ! 504: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb5a408e0  ! 506: FSUBq	dis not found

	.word 0xb5a80820  ! 509: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xbba81c20  ! 510: FMOVRGEZ	dis not found

	.word 0xb9ab0820  ! 513: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xb1a448e0  ! 517: FSUBq	dis not found

	.word 0xb044a17b  ! 521: ADDC_I	addc 	%r18, 0x017b, %r24
iob_intr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_43), 16, 16)) -> intp(1, 0, f)
T1_asi_reg_rd_20:
	mov	0x17, %r14
	.word 0xfcdb8400  ! 524: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T1_asi_reg_rd_21:
	mov	0x3c5, %r14
	.word 0xf2db8e40  ! 527: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb5a5c9c0  ! 528: FDIVd	fdivd	%f54, %f0, %f26
	.word 0xb2ac61e0  ! 530: ANDNcc_I	andncc 	%r17, 0x01e0, %r25
	.word 0xb1a44920  ! 531: FMULs	fmuls	%f17, %f0, %f24
	.word 0xb9a80420  ! 533: FMOVRZ	dis not found

	.word 0xbba509e0  ! 539: FDIVq	dis not found

	.word 0xbba80c20  ! 540: FMOVRLZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbc94c000  ! 550: ORcc_R	orcc 	%r19, %r0, %r30
	.word 0xbdaa0820  ! 551: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb5643801  ! 554: MOVcc_I	<illegal instruction>
	.word 0xb1a80c20  ! 556: FMOVRLZ	dis not found

	lda	[%r18 + %g0] 0xf0, %f2
iob_intr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_44), 16, 16)) -> intp(1, 0, 17)
	.word 0xbda81420  ! 565: FMOVRNZ	dis not found

	.word 0xbda94820  ! 567: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xb7a508e0  ! 568: FSUBq	dis not found

T1_asi_reg_wr_24:
	mov	0x10, %r14
	.word 0xfcf384a0  ! 570: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb93de001  ! 574: SRA_I	sra 	%r23, 0x0001, %r28
iob_intr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_45), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb3a80420  ! 584: FMOVRZ	dis not found

T1_asi_reg_rd_22:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 586: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_46), 16, 16)) -> intp(1, 0, 10)
T1_asi_reg_rd_23:
	mov	0x2, %r14
	.word 0xf0db8e40  ! 588: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_1_44:
	setx	0x22020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80820  ! 590: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_25:
	mov	0x17, %r14
	.word 0xf0f389e0  ! 591: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_47), 16, 16)) -> intp(1, 0, 1c)
	.word 0xba8461cc  ! 596: ADDcc_I	addcc 	%r17, 0x01cc, %r29
T1_asi_reg_rd_24:
	mov	0x16, %r14
	.word 0xf6db8400  ! 597: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbdab8820  ! 601: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xbfa00520  ! 602: FSQRTs	fsqrt	
T1_asi_reg_rd_25:
	mov	0x1d, %r14
	.word 0xfadb84a0  ! 604: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb5a4c9e0  ! 605: FDIVq	dis not found

	.word 0xb5a98820  ! 607: FMOVNEG	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_26:
	mov	0x0, %r14
	.word 0xfedb8e40  ! 608: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbbab8820  ! 609: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb3a549c0  ! 612: FDIVd	fdivd	%f52, %f0, %f56
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_45:
	setx	0x22032c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_46:
	setx	0x220318, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xba25e1df  ! 619: SUB_I	sub 	%r23, 0x01df, %r29
cpu_intr_1_47:
	setx	0x210137, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_48:
	setx	0x21010a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_49:
	setx	0x210314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a5c9e0  ! 633: FDIVq	dis not found

	.word 0xbda00560  ! 637: FSQRTq	fsqrt	
T1_asi_reg_rd_27:
	mov	0x3c4, %r14
	.word 0xf0db8e80  ! 639: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbba5c9c0  ! 641: FDIVd	fdivd	%f54, %f0, %f60
	.word 0xbba8c820  ! 643: FMOVL	fmovs	%fcc1, %f0, %f29
cpu_intr_1_50:
	setx	0x22033d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_28:
	mov	0x2e, %r14
	.word 0xfcdb8e80  ! 646: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xba0d4000  ! 648: AND_R	and 	%r21, %r0, %r29
	.word 0xb9aa0820  ! 649: FMOVA	fmovs	%fcc1, %f0, %f28
iob_intr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_48), 16, 16)) -> intp(1, 0, 10)
T1_asi_reg_rd_29:
	mov	0x21, %r14
	.word 0xfadb84a0  ! 653: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_1_51:
	setx	0x210207, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_52:
	setx	0x210101, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_53:
	setx	0x210010, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_30:
	mov	0x3c3, %r14
	.word 0xfedb8e80  ! 659: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_1_54:
	setx	0x220237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc9d0000  ! 661: XORcc_R	xorcc 	%r20, %r0, %r30
T1_asi_reg_wr_26:
	mov	0x3c6, %r14
	.word 0xfef38e40  ! 662: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_wr_27:
	mov	0x25, %r14
	.word 0xf4f389e0  ! 666: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T1_asi_reg_rd_31:
	mov	0x15, %r14
	.word 0xf2db8e80  ! 667: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb5a549a0  ! 669: FDIVs	fdivs	%f21, %f0, %f26
T1_asi_reg_rd_32:
	mov	0x8, %r14
	.word 0xf6db8400  ! 670: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_1_55:
	setx	0x230005, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a5c9a0  ! 676: FDIVs	fdivs	%f23, %f0, %f24
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xb1a81820  ! 678: FMOVRGZ	fmovs	%fcc3, %f0, %f24
iob_intr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_49), 16, 16)) -> intp(1, 0, 17)
	.word 0xb9a488c0  ! 681: FSUBd	fsubd	%f18, %f0, %f28
cpu_intr_1_56:
	setx	0x210033, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_50), 16, 16)) -> intp(1, 0, 1c)
cpu_intr_1_57:
	setx	0x220016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00560  ! 687: FSQRTq	fsqrt	
cpu_intr_1_58:
	setx	0x210202, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_51), 16, 16)) -> intp(1, 0, 34)
T1_asi_reg_wr_28:
	mov	0x1e, %r14
	.word 0xf2f38400  ! 693: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb3aa0820  ! 697: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb7aa8820  ! 699: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb3a5c920  ! 703: FMULs	fmuls	%f23, %f0, %f25
	.word 0xbda4c9c0  ! 704: FDIVd	fdivd	%f50, %f0, %f30
iob_intr_1_52:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_52), 16, 16)) -> intp(1, 0, 2f)
	.word 0xba1c4000  ! 706: XOR_R	xor 	%r17, %r0, %r29
cpu_intr_1_59:
	setx	0x23001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba34214f  ! 711: SUBC_I	orn 	%r16, 0x014f, %r29
iob_intr_1_53:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_53), 16, 16)) -> intp(1, 0, 17)
cpu_intr_1_60:
	setx	0x20011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aa0820  ! 725: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xbfa00520  ! 727: FSQRTs	fsqrt	
	.word 0xb5a54960  ! 731: FMULq	dis not found

	.word 0xb9a5c8a0  ! 733: FSUBs	fsubs	%f23, %f0, %f28
cpu_intr_1_61:
	setx	0x220238, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_54:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_54), 16, 16)) -> intp(1, 0, 21)
iob_intr_1_55:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_55), 16, 16)) -> intp(1, 0, 1c)
iob_intr_1_56:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_56), 16, 16)) -> intp(1, 0, 1f)
T1_asi_reg_wr_29:
	mov	0x19, %r14
	.word 0xf0f38e40  ! 741: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbda00560  ! 743: FSQRTq	fsqrt	
iob_intr_1_57:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_57), 16, 16)) -> intp(1, 0, 25)
	.word 0xb024609e  ! 748: SUB_I	sub 	%r17, 0x009e, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_62:
	setx	0x230118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2ac6083  ! 755: ANDNcc_I	andncc 	%r17, 0x0083, %r25
cpu_intr_1_63:
	setx	0x210012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe2c4000  ! 757: ANDN_R	andn 	%r17, %r0, %r31
	.word 0xb5abc820  ! 762: FMOVVC	fmovs	%fcc1, %f0, %f26
iob_intr_1_58:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_58), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_wr_30:
	mov	0x3c5, %r14
	.word 0xf6f389e0  ! 770: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_1_64:
	setx	0x21022f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_59:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_59), 16, 16)) -> intp(1, 0, 11)
	.word 0xb7a00520  ! 784: FSQRTs	fsqrt	
cpu_intr_1_65:
	setx	0x220219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5358000  ! 791: SRL_R	srl 	%r22, %r0, %r26
iob_intr_1_60:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_60), 16, 16)) -> intp(1, 0, 2)
	.word 0xbfa00020  ! 794: FMOVs	fmovs	%f0, %f31
	.word 0xbfa5c960  ! 796: FMULq	dis not found

	.word 0xbba5c8c0  ! 797: FSUBd	fsubd	%f54, %f0, %f60
	.word 0xb5a4c8e0  ! 798: FSUBq	dis not found

T1_asi_reg_wr_31:
	mov	0x29, %r14
	.word 0xfaf38e60  ! 799: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb7a448a0  ! 801: FSUBs	fsubs	%f17, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a8c820  ! 804: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xb1a48960  ! 811: FMULq	dis not found

	.word 0xbac461b9  ! 812: ADDCcc_I	addccc 	%r17, 0x01b9, %r29
iob_intr_1_61:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_61), 16, 16)) -> intp(1, 0, 2a)
cpu_intr_1_66:
	setx	0x230204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbab40000  ! 825: ORNcc_R	orncc 	%r16, %r0, %r29
	.word 0xb5a80420  ! 828: FMOVRZ	dis not found

	.word 0xb1a81c20  ! 831: FMOVRGEZ	dis not found

iob_intr_1_62:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_62), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_63:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_63), 16, 16)) -> intp(1, 0, 38)
T1_asi_reg_rd_33:
	mov	0x3c5, %r14
	.word 0xfedb8e60  ! 836: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb9a48820  ! 842: FADDs	fadds	%f18, %f0, %f28
T1_asi_reg_wr_32:
	mov	0x3c7, %r14
	.word 0xf6f384a0  ! 843: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_1_67:
	setx	0x21003a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_64:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_64), 16, 16)) -> intp(1, 0, 31)
	.word 0xb3a509c0  ! 848: FDIVd	fdivd	%f20, %f0, %f56
T1_asi_reg_rd_34:
	mov	0x3c1, %r14
	.word 0xfedb89e0  ! 849: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T1_asi_reg_wr_33:
	mov	0x33, %r14
	.word 0xf4f38e60  ! 850: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_1_65:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_65), 16, 16)) -> intp(1, 0, 5)
	.word 0xb9a5c9a0  ! 852: FDIVs	fdivs	%f23, %f0, %f28
cpu_intr_1_68:
	setx	0x210237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba8c820  ! 857: FMOVL	fmovs	%fcc1, %f0, %f29
cpu_intr_1_69:
	setx	0x220313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a489e0  ! 862: FDIVq	dis not found

T1_asi_reg_wr_34:
	mov	0x15, %r14
	.word 0xf6f38e40  ! 863: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbe8d20dc  ! 867: ANDcc_I	andcc 	%r20, 0x00dc, %r31
	.word 0xb7a588a0  ! 868: FSUBs	fsubs	%f22, %f0, %f27
	.word 0xb5aa4820  ! 869: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xbba81820  ! 870: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_70:
	setx	0x20031d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_35:
	mov	0xb, %r14
	.word 0xfcf38e60  ! 875: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb7a8c820  ! 876: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb9a94820  ! 877: FMOVCS	fmovs	%fcc1, %f0, %f28
cpu_intr_1_71:
	setx	0x22012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a88820  ! 879: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb9a00560  ! 881: FSQRTq	fsqrt	
	.word 0xbe8c4000  ! 883: ANDcc_R	andcc 	%r17, %r0, %r31
	.word 0xb1a00540  ! 886: FSQRTd	fsqrt	
	.word 0xb3a48860  ! 889: FADDq	dis not found

	.word 0xbcb420cd  ! 892: SUBCcc_I	orncc 	%r16, 0x00cd, %r30
T1_asi_reg_wr_36:
	mov	0x2a, %r14
	.word 0xf0f38e60  ! 896: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_1_66:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_66), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb015e13a  ! 900: OR_I	or 	%r23, 0x013a, %r24
T1_asi_reg_wr_37:
	mov	0x11, %r14
	.word 0xfef384a0  ! 901: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb3a84820  ! 903: FMOVE	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_rd_35:
	mov	0x1b, %r14
	.word 0xf4db84a0  ! 906: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbc0ca107  ! 907: AND_I	and 	%r18, 0x0107, %r30
T1_asi_reg_rd_36:
	mov	0x3c3, %r14
	.word 0xf0db84a0  ! 909: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_1_67:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_67), 16, 16)) -> intp(1, 0, 1f)
cpu_intr_1_72:
	setx	0x240306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80820  ! 914: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xbda80820  ! 915: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
iob_intr_1_68:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_68), 16, 16)) -> intp(1, 0, 28)
	.word 0xb9a84820  ! 919: FMOVE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_73:
	setx	0x250232, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_74:
	setx	0x270139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba44820  ! 929: FADDs	fadds	%f17, %f0, %f29
cpu_intr_1_75:
	setx	0x240327, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7aa0820  ! 938: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb7a4c820  ! 952: FADDs	fadds	%f19, %f0, %f27
T1_asi_reg_wr_38:
	mov	0x3c4, %r14
	.word 0xfaf38e80  ! 953: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
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
T1_asi_reg_rd_37:
	mov	0x8, %r14
	.word 0xfedb8e80  ! 957: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T1_asi_reg_rd_38:
	mov	0x15, %r14
	.word 0xfcdb8e60  ! 958: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_1_69:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_69), 16, 16)) -> intp(1, 0, 17)
	.word 0xbfaa0820  ! 961: FMOVA	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_39:
	mov	0x32, %r14
	.word 0xfef38e40  ! 965: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_wr_40:
	mov	0x13, %r14
	.word 0xfaf38400  ! 966: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T1_asi_reg_wr_41:
	mov	0x3c0, %r14
	.word 0xf6f384a0  ! 969: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_1_70:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_70), 16, 16)) -> intp(1, 0, 10)
	.word 0xb48461be  ! 972: ADDcc_I	addcc 	%r17, 0x01be, %r26
T1_asi_reg_rd_39:
	mov	0xd, %r14
	.word 0xfedb8400  ! 975: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb2a40000  ! 977: SUBcc_R	subcc 	%r16, %r0, %r25
cpu_intr_1_76:
	setx	0x26020b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_71:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_71), 16, 16)) -> intp(1, 0, 3)
cpu_intr_1_77:
	setx	0x270317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_78:
	setx	0x26010f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_72:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_72), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb21c2113  ! 985: XOR_I	xor 	%r16, 0x0113, %r25
T1_asi_reg_rd_40:
	mov	0xa, %r14
	.word 0xf6db8e40  ! 986: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_79:
	setx	0x250223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb62de167  ! 989: ANDN_I	andn 	%r23, 0x0167, %r27
T1_asi_reg_wr_42:
	mov	0x12, %r14
	.word 0xf6f384a0  ! 990: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb3a50920  ! 992: FMULs	fmuls	%f20, %f0, %f25
iob_intr_1_73:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_73), 16, 16)) -> intp(1, 0, 37)
	.word 0xb5348000  ! 995: SRL_R	srl 	%r18, %r0, %r26
T1_asi_reg_wr_43:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 997: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T1_asi_reg_rd_41:
	mov	0x3c4, %r14
	.word 0xf6db8e80  ! 1001: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb1a00020  ! 1002: FMOVs	fmovs	%f0, %f24
iob_intr_1_74:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_74), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb9a4c860  ! 1004: FADDq	dis not found

T1_asi_reg_wr_44:
	mov	0x3c8, %r14
	.word 0xfef389e0  ! 1007: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbfa5c920  ! 1012: FMULs	fmuls	%f23, %f0, %f31
iob_intr_1_75:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_75), 16, 16)) -> intp(1, 0, 28)
T1_asi_reg_rd_42:
	mov	0x1e, %r14
	.word 0xfcdb8e80  ! 1016: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T1_asi_reg_wr_45:
	mov	0x1d, %r14
	.word 0xf4f38e80  ! 1017: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_1_76:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_76), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb9a5c9a0  ! 1020: FDIVs	fdivs	%f23, %f0, %f28
	.word 0xbc24e133  ! 1021: SUB_I	sub 	%r19, 0x0133, %r30
T1_asi_reg_wr_46:
	mov	0x13, %r14
	.word 0xfcf38400  ! 1022: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb63d604d  ! 1023: XNOR_I	xnor 	%r21, 0x004d, %r27
iob_intr_1_77:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_77), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_rd_43:
	mov	0x37, %r14
	.word 0xfadb84a0  ! 1027: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb5abc820  ! 1028: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb5a80420  ! 1029: FMOVRZ	dis not found

	.word 0xb1a80420  ! 1031: FMOVRZ	dis not found

cpu_intr_1_80:
	setx	0x26010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00540  ! 1044: FSQRTd	fsqrt	
T1_asi_reg_wr_47:
	mov	0x37, %r14
	.word 0xfef38e80  ! 1045: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T1_asi_reg_wr_48:
	mov	0x24, %r14
	.word 0xfcf38e60  ! 1047: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_1_81:
	setx	0x26033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc34c000  ! 1050: SUBC_R	orn 	%r19, %r0, %r30
iob_intr_1_78:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_78), 16, 16)) -> intp(1, 0, 34)
cpu_intr_1_82:
	setx	0x260114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a449a0  ! 1056: FDIVs	fdivs	%f17, %f0, %f25
	.word 0xbba90820  ! 1057: FMOVLEU	fmovs	%fcc1, %f0, %f29
cpu_intr_1_83:
	setx	0x240306, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_79:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_79), 16, 16)) -> intp(1, 0, 35)
	.word 0xbda98820  ! 1071: FMOVNEG	fmovs	%fcc1, %f0, %f30
iob_intr_1_80:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_80), 16, 16)) -> intp(1, 0, 15)
	.word 0xb3a00040  ! 1073: FMOVd	fmovd	%f0, %f56
	.word 0xb9a4c920  ! 1077: FMULs	fmuls	%f19, %f0, %f28
	.word 0xbd641800  ! 1078: MOVcc_R	<illegal instruction>
iob_intr_1_81:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_81), 16, 16)) -> intp(1, 0, 17)
iob_intr_1_82:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_82), 16, 16)) -> intp(1, 0, 26)
cpu_intr_1_84:
	setx	0x240103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda409e0  ! 1084: FDIVq	dis not found

cpu_intr_1_85:
	setx	0x250230, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_86:
	setx	0x240001, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_87:
	setx	0x260018, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_44:
	mov	0x1e, %r14
	.word 0xf0db84a0  ! 1097: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_1_88:
	setx	0x240127, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_89:
	setx	0x240305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a81420  ! 1102: FMOVRNZ	dis not found

T1_asi_reg_wr_49:
	mov	0x26, %r14
	.word 0xfef389e0  ! 1103: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb20ce04c  ! 1108: AND_I	and 	%r19, 0x004c, %r25
cpu_intr_1_90:
	setx	0x25001f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_83:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_83), 16, 16)) -> intp(1, 0, e)
	.word 0xb1ab4820  ! 1116: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xbba54920  ! 1117: FMULs	fmuls	%f21, %f0, %f29
	.word 0xb3a5c9a0  ! 1118: FDIVs	fdivs	%f23, %f0, %f25
	.word 0xb7a80c20  ! 1120: FMOVRLZ	dis not found

cpu_intr_1_91:
	setx	0x270233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_92:
	setx	0x250013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab8820  ! 1125: FMOVPOS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_50:
	mov	0x36, %r14
	.word 0xf6f38e80  ! 1126: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb0a42145  ! 1127: SUBcc_I	subcc 	%r16, 0x0145, %r24
cpu_intr_1_93:
	setx	0x250212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a5c8a0  ! 1133: FSUBs	fsubs	%f23, %f0, %f24
	.word 0xb3a90820  ! 1135: FMOVLEU	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_51:
	mov	0xc, %r14
	.word 0xfcf38e80  ! 1136: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_1_94:
	setx	0x260307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe34208e  ! 1140: SUBC_I	orn 	%r16, 0x008e, %r31
T1_asi_reg_rd_45:
	mov	0x1d, %r14
	.word 0xf4db89e0  ! 1143: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb7a4c840  ! 1146: FADDd	faddd	%f50, %f0, %f58
	.word 0xb3aa8820  ! 1147: FMOVG	fmovs	%fcc1, %f0, %f25
iob_intr_1_84:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_84), 16, 16)) -> intp(1, 0, 13)
	.word 0xb73c7001  ! 1149: SRAX_I	srax	%r17, 0x0001, %r27
cpu_intr_1_95:
	setx	0x26023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_46:
	mov	0x35, %r14
	.word 0xf0db8400  ! 1153: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_1_85:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_85), 16, 16)) -> intp(1, 0, 14)
	.word 0xbfa80820  ! 1156: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb7a48940  ! 1157: FMULd	fmuld	%f18, %f0, %f58
	.word 0xb7a81420  ! 1163: FMOVRNZ	dis not found

T1_asi_reg_rd_47:
	mov	0x3c5, %r14
	.word 0xf4db8400  ! 1165: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb5a509c0  ! 1166: FDIVd	fdivd	%f20, %f0, %f26
T1_asi_reg_wr_52:
	mov	0x3c4, %r14
	.word 0xfaf38e40  ! 1168: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb5a54840  ! 1174: FADDd	faddd	%f52, %f0, %f26
iob_intr_1_86:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_86), 16, 16)) -> intp(1, 0, 37)
cpu_intr_1_96:
	setx	0x260003, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb62461fe  ! 1179: SUB_I	sub 	%r17, 0x01fe, %r27
	.word 0xbda509c0  ! 1181: FDIVd	fdivd	%f20, %f0, %f30
iob_intr_1_87:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_87), 16, 16)) -> intp(1, 0, 2e)
iob_intr_1_88:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_88), 16, 16)) -> intp(1, 0, 37)
iob_intr_1_89:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_89), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_90:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_90), 16, 16)) -> intp(1, 0, e)
cpu_intr_1_97:
	setx	0x25030e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_53:
	mov	0x22, %r14
	.word 0xf2f38e40  ! 1188: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb9a00040  ! 1190: FMOVd	fmovd	%f0, %f28
	.word 0xb5a80420  ! 1191: FMOVRZ	dis not found

iob_intr_1_91:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_91), 16, 16)) -> intp(1, 0, 2)
iob_intr_1_92:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_92), 16, 16)) -> intp(1, 0, 22)
	.word 0xbda80820  ! 1198: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_48:
	mov	0xe, %r14
	.word 0xfcdb84a0  ! 1199: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T1_asi_reg_rd_49:
	mov	0x3c4, %r14
	.word 0xf2db8400  ! 1202: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T1_asi_reg_rd_50:
	mov	0x3c1, %r14
	.word 0xfedb8e80  ! 1204: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T1_asi_reg_rd_51:
	mov	0x1b, %r14
	.word 0xfedb84a0  ! 1205: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	lda	[%r23 + %g0] 0xf0, %f2
T1_asi_reg_wr_54:
	mov	0x3c0, %r14
	.word 0xfef38e80  ! 1214: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T1_asi_reg_rd_52:
	mov	0x3c2, %r14
	.word 0xf6db84a0  ! 1215: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb3a81c20  ! 1217: FMOVRGEZ	dis not found

T1_asi_reg_rd_53:
	mov	0x1a, %r14
	.word 0xf4db84a0  ! 1222: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_1_93:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_93), 16, 16)) -> intp(1, 0, 15)
	.word 0xb1a90820  ! 1228: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xb8240000  ! 1229: SUB_R	sub 	%r16, %r0, %r28
iob_intr_1_94:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_94), 16, 16)) -> intp(1, 0, 1)
iob_intr_1_95:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_95), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb824e1ce  ! 1234: SUB_I	sub 	%r19, 0x01ce, %r28
iob_intr_1_96:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_96), 16, 16)) -> intp(1, 0, 14)
	.word 0xbf3ca001  ! 1237: SRA_I	sra 	%r18, 0x0001, %r31
iob_intr_1_97:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_97), 16, 16)) -> intp(1, 0, 7)
T1_asi_reg_wr_55:
	mov	0xa, %r14
	.word 0xf0f38e40  ! 1239: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_wr_56:
	mov	0x0, %r14
	.word 0xfef389e0  ! 1244: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbba81420  ! 1247: FMOVRNZ	dis not found

T1_asi_reg_wr_57:
	mov	0x4, %r14
	.word 0xfcf38400  ! 1248: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbfa00560  ! 1249: FSQRTq	fsqrt	
T1_asi_reg_wr_58:
	mov	0x2f, %r14
	.word 0xfcf38e40  ! 1250: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_1_98:
	setx	0x24021d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_98:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_98), 16, 16)) -> intp(1, 0, 17)
cpu_intr_1_99:
	setx	0x26022b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_59:
	mov	0x3c5, %r14
	.word 0xfaf38e40  ! 1254: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_wr_60:
	mov	0x4, %r14
	.word 0xfef38e60  ! 1255: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T1_asi_reg_wr_61:
	mov	0x3c0, %r14
	.word 0xf6f38400  ! 1256: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_1_100:
	setx	0x24003f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_54:
	mov	0x2d, %r14
	.word 0xfedb84a0  ! 1260: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbb50c000  ! 1261: RDPR_TT	<illegal instruction>
iob_intr_1_99:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_99), 16, 16)) -> intp(1, 0, 32)
	.word 0xb9a5c860  ! 1265: FADDq	dis not found

iob_intr_1_100:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_100), 16, 16)) -> intp(1, 0, 2d)
	.word 0xbba00560  ! 1267: FSQRTq	fsqrt	
	.word 0xbba44860  ! 1268: FADDq	dis not found

iob_intr_1_101:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_101), 16, 16)) -> intp(1, 0, 22)
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0x8f902000  ! 1277: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xa1902000  ! 1278: WRPR_GL_I	wrpr	%r0, 0x0000, %-
iob_intr_1_102:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_102), 16, 16)) -> intp(1, 0, 6)
cpu_intr_1_101:
	setx	0x27002d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_102:
	setx	0x27023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4948000  ! 1287: ORcc_R	orcc 	%r18, %r0, %r26
cpu_intr_1_103:
	setx	0x26013d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_103:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_103), 16, 16)) -> intp(1, 0, 3a)
T1_asi_reg_rd_55:
	mov	0x16, %r14
	.word 0xf8db8e40  ! 1293: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb9a509e0  ! 1294: FDIVq	dis not found

iob_intr_1_104:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_104), 16, 16)) -> intp(1, 0, 37)
iob_intr_1_105:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_105), 16, 16)) -> intp(1, 0, 15)
iob_intr_1_106:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_106), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb1a81820  ! 1300: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xbac560b0  ! 1304: ADDCcc_I	addccc 	%r21, 0x00b0, %r29
iob_intr_1_107:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_107), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb7abc820  ! 1309: FMOVVC	fmovs	%fcc1, %f0, %f27
iob_intr_1_108:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_108), 16, 16)) -> intp(1, 0, 9)
iob_intr_1_109:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_109), 16, 16)) -> intp(1, 0, 2f)
	.word 0xbd2d4000  ! 1317: SLL_R	sll 	%r21, %r0, %r30
iob_intr_1_110:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_110), 16, 16)) -> intp(1, 0, 17)
T1_asi_reg_rd_56:
	mov	0x2a, %r14
	.word 0xf2db8e80  ! 1321: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb6354000  ! 1324: ORN_R	orn 	%r21, %r0, %r27
	.word 0xbda8c820  ! 1330: FMOVL	fmovs	%fcc1, %f0, %f30
iob_intr_1_111:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_111), 16, 16)) -> intp(1, 0, 27)
iob_intr_1_112:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_112), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_wr_62:
	mov	0x19, %r14
	.word 0xf0f389e0  ! 1337: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_1_113:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_113), 16, 16)) -> intp(1, 0, 22)
	.word 0xbba44840  ! 1344: FADDd	faddd	%f48, %f0, %f60
T1_asi_reg_rd_57:
	mov	0x37, %r14
	.word 0xfcdb8e40  ! 1347: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbda489e0  ! 1351: FDIVq	dis not found

cpu_intr_1_104:
	setx	0x24020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00540  ! 1353: FSQRTd	fsqrt	
iob_intr_1_114:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_114), 16, 16)) -> intp(1, 0, c)
iob_intr_1_115:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_115), 16, 16)) -> intp(1, 0, 7)
T1_asi_reg_wr_63:
	mov	0x1b, %r14
	.word 0xf8f38400  ! 1361: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T1_asi_reg_wr_64:
	mov	0xc, %r14
	.word 0xfcf38e40  ! 1362: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbda84820  ! 1363: FMOVE	fmovs	%fcc1, %f0, %f30
cpu_intr_1_105:
	setx	0x270005, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_116:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_116), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb61c4000  ! 1368: XOR_R	xor 	%r17, %r0, %r27
T1_asi_reg_wr_65:
	mov	0x2, %r14
	.word 0xf0f389e0  ! 1372: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T1_asi_reg_rd_58:
	mov	0x37, %r14
	.word 0xfedb8400  ! 1373: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb1a5c960  ! 1375: FMULq	dis not found

cpu_intr_1_106:
	setx	0x2b031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a44920  ! 1379: FMULs	fmuls	%f17, %f0, %f26
cpu_intr_1_107:
	setx	0x2b0038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00520  ! 1382: FSQRTs	fsqrt	
T1_asi_reg_rd_59:
	mov	0x32, %r14
	.word 0xf6db8e40  ! 1383: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbfa84820  ! 1384: FMOVE	fmovs	%fcc1, %f0, %f31
iob_intr_1_117:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_117), 16, 16)) -> intp(1, 0, 0)
cpu_intr_1_108:
	setx	0x280115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80420  ! 1389: FMOVRZ	dis not found

T1_asi_reg_wr_66:
	mov	0x3c2, %r14
	.word 0xfcf38e80  ! 1391: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_1_109:
	setx	0x29031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a44960  ! 1398: FMULq	dis not found

	.word 0xbf7c6401  ! 1403: MOVR_I	movre	%r17, 0x1, %r31
T1_asi_reg_wr_67:
	mov	0x1d, %r14
	.word 0xf2f38e40  ! 1405: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb9a509a0  ! 1406: FDIVs	fdivs	%f20, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_68:
	mov	0x3c1, %r14
	.word 0xf0f389e0  ! 1408: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T1_asi_reg_wr_69:
	mov	0x3c6, %r14
	.word 0xfcf389e0  ! 1411: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0x8d9460f2  ! 1413: WRPR_PSTATE_I	wrpr	%r17, 0x00f2, %pstate
	.word 0xbb7da401  ! 1415: MOVR_I	movre	%r22, 0x1, %r29
iob_intr_1_118:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_118), 16, 16)) -> intp(1, 0, 24)
	.word 0xbfa54860  ! 1419: FADDq	dis not found

iob_intr_1_119:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_119), 16, 16)) -> intp(1, 0, 27)
iob_intr_1_120:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_120), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb61420c6  ! 1428: OR_I	or 	%r16, 0x00c6, %r27
	.word 0xb9a50860  ! 1430: FADDq	dis not found

	.word 0xbba50960  ! 1431: FMULq	dis not found

T1_asi_reg_rd_60:
	mov	0x29, %r14
	.word 0xf0db84a0  ! 1432: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_1_121:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_121), 16, 16)) -> intp(1, 0, 9)
	.word 0xb93c6001  ! 1442: SRA_I	sra 	%r17, 0x0001, %r28
cpu_intr_1_110:
	setx	0x28023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aa8820  ! 1449: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb9a8c820  ! 1451: FMOVL	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_70:
	mov	0x30, %r14
	.word 0xf0f389e0  ! 1454: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_1_122:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_122), 16, 16)) -> intp(1, 0, 2f)
cpu_intr_1_111:
	setx	0x280227, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_112:
	setx	0x28001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c960  ! 1463: FMULq	dis not found

	.word 0xbba48840  ! 1464: FADDd	faddd	%f18, %f0, %f60
T1_asi_reg_rd_61:
	mov	0x3c8, %r14
	.word 0xf8db84a0  ! 1470: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbfa94820  ! 1471: FMOVCS	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_71:
	mov	0x1e, %r14
	.word 0xf8f38e40  ! 1474: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbfa80c20  ! 1475: FMOVRLZ	dis not found

cpu_intr_1_113:
	setx	0x28000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb52df001  ! 1481: SLLX_I	sllx	%r23, 0x0001, %r26
	.word 0xb7a88820  ! 1486: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb1a81c20  ! 1487: FMOVRGEZ	dis not found

	.word 0xb1a81420  ! 1488: FMOVRNZ	dis not found

T1_asi_reg_wr_72:
	mov	0x17, %r14
	.word 0xf2f38400  ! 1491: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a40860  ! 1495: FADDq	dis not found

	.word 0xb72d8000  ! 1497: SLL_R	sll 	%r22, %r0, %r27
	.word 0xb5a48920  ! 1498: FMULs	fmuls	%f18, %f0, %f26
	.word 0xb5641800  ! 1499: MOVcc_R	<illegal instruction>
iob_intr_1_123:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_123), 16, 16)) -> intp(1, 0, 13)
iob_intr_1_124:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_124), 16, 16)) -> intp(1, 0, 15)
	.word 0xb1a488e0  ! 1505: FSUBq	dis not found

T1_asi_reg_rd_62:
	mov	0x3c2, %r14
	.word 0xf0db8e80  ! 1507: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb7a44920  ! 1508: FMULs	fmuls	%f17, %f0, %f27
T1_asi_reg_wr_73:
	mov	0x3c7, %r14
	.word 0xf0f38e40  ! 1511: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_1_114:
	setx	0x2a013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_74:
	mov	0x3c5, %r14
	.word 0xfcf38e80  ! 1519: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_1_125:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_125), 16, 16)) -> intp(1, 0, 1b)
iob_intr_1_126:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_126), 16, 16)) -> intp(1, 0, 10)
	.word 0xb6a42019  ! 1525: SUBcc_I	subcc 	%r16, 0x0019, %r27
cpu_intr_1_115:
	setx	0x280023, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r20 + %g0] 0xf0, %f2
iob_intr_1_127:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_127), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb4b54000  ! 1531: SUBCcc_R	orncc 	%r21, %r0, %r26
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xbfa548e0  ! 1536: FSUBq	dis not found

iob_intr_1_128:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_128), 16, 16)) -> intp(1, 0, 27)
	.word 0xb1a8c820  ! 1539: FMOVL	fmovs	%fcc1, %f0, %f24
iob_intr_1_129:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_129), 16, 16)) -> intp(1, 0, 31)
	.word 0xb7a80c20  ! 1543: FMOVRLZ	dis not found

	.word 0xbfa80420  ! 1546: FMOVRZ	dis not found

	.word 0xb7a00560  ! 1547: FSQRTq	fsqrt	
T1_asi_reg_wr_75:
	mov	0x27, %r14
	.word 0xf8f38400  ! 1550: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb044c000  ! 1555: ADDC_R	addc 	%r19, %r0, %r24
	.word 0xbfa80c20  ! 1557: FMOVRLZ	dis not found

cpu_intr_1_116:
	setx	0x290202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba549a0  ! 1560: FDIVs	fdivs	%f21, %f0, %f29
iob_intr_1_130:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_130), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_rd_63:
	mov	0x3c6, %r14
	.word 0xfedb8e40  ! 1562: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbfa508c0  ! 1565: FSUBd	fsubd	%f20, %f0, %f62
	.word 0xb5a549e0  ! 1568: FDIVq	dis not found

iob_intr_1_131:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_131), 16, 16)) -> intp(1, 0, b)
iob_intr_1_132:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_132), 16, 16)) -> intp(1, 0, 23)
iob_intr_1_133:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_133), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb9aa4820  ! 1575: FMOVNE	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_rd_64:
	mov	0x3, %r14
	.word 0xfcdb8e40  ! 1578: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_rd_65:
	mov	0x3c5, %r14
	.word 0xf8db89e0  ! 1579: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb3500000  ! 1580: RDPR_TPC	<illegal instruction>
	.word 0xa1902000  ! 1581: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xbfabc820  ! 1583: FMOVVC	fmovs	%fcc1, %f0, %f31
cpu_intr_1_117:
	setx	0x280327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb81c2049  ! 1585: XOR_I	xor 	%r16, 0x0049, %r28
	.word 0xb1a58940  ! 1586: FMULd	fmuld	%f22, %f0, %f24
	.word 0xbb3df001  ! 1589: SRAX_I	srax	%r23, 0x0001, %r29
	.word 0xbfa58940  ! 1594: FMULd	fmuld	%f22, %f0, %f62
cpu_intr_1_118:
	setx	0x280008, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_119:
	setx	0x2a0107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a81820  ! 1600: FMOVRGZ	fmovs	%fcc3, %f0, %f27
cpu_intr_1_120:
	setx	0x2b0201, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_121:
	setx	0x28012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf7d4400  ! 1604: MOVR_R	movre	%r21, %r0, %r31
	.word 0xb5a44960  ! 1609: FMULq	dis not found

T1_asi_reg_wr_76:
	mov	0x12, %r14
	.word 0xfef389e0  ! 1611: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_1_122:
	setx	0x2b0117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5ab8820  ! 1614: FMOVPOS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_77:
	mov	0x1c, %r14
	.word 0xf4f38e40  ! 1615: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb52d3001  ! 1616: SLLX_I	sllx	%r20, 0x0001, %r26
	.word 0xb7a00520  ! 1619: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_78:
	mov	0x35, %r14
	.word 0xfcf384a0  ! 1622: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb9a48920  ! 1623: FMULs	fmuls	%f18, %f0, %f28
	.word 0xb5a84820  ! 1624: FMOVE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_123:
	setx	0x2b0332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a509e0  ! 1626: FDIVq	dis not found

	.word 0xbfa4c9a0  ! 1628: FDIVs	fdivs	%f19, %f0, %f31
	.word 0xb9a84820  ! 1634: FMOVE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_124:
	setx	0x2b0000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab4820  ! 1636: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xbba81820  ! 1638: FMOVRGZ	fmovs	%fcc3, %f0, %f29
cpu_intr_1_125:
	setx	0x2b0131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda509c0  ! 1642: FDIVd	fdivd	%f20, %f0, %f30
T1_asi_reg_rd_66:
	mov	0x1d, %r14
	.word 0xf6db89e0  ! 1643: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_1_134:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_134), 16, 16)) -> intp(1, 0, 10)
iob_intr_1_135:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_135), 16, 16)) -> intp(1, 0, 2)
	.word 0xb7a90820  ! 1653: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb1a58960  ! 1656: FMULq	dis not found

T1_asi_reg_wr_79:
	mov	0x31, %r14
	.word 0xf4f38400  ! 1657: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_1_126:
	setx	0x2a0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a54860  ! 1662: FADDq	dis not found

cpu_intr_1_127:
	setx	0x290015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd2da001  ! 1667: SLL_I	sll 	%r22, 0x0001, %r30
	.word 0xb9a40840  ! 1673: FADDd	faddd	%f16, %f0, %f28
T1_asi_reg_wr_80:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 1676: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_rd_67:
	mov	0x3c1, %r14
	.word 0xf2db8e80  ! 1677: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T1_asi_reg_wr_81:
	mov	0x38, %r14
	.word 0xf8f389e0  ! 1678: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbfab0820  ! 1682: FMOVGU	fmovs	%fcc1, %f0, %f31
iob_intr_1_136:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_136), 16, 16)) -> intp(1, 0, 0)
	.word 0xb6b54000  ! 1685: ORNcc_R	orncc 	%r21, %r0, %r27
	.word 0xbac560fd  ! 1686: ADDCcc_I	addccc 	%r21, 0x00fd, %r29
	.word 0xbba00040  ! 1688: FMOVd	fmovd	%f0, %f60
T1_asi_reg_rd_68:
	mov	0x3c4, %r14
	.word 0xfcdb84a0  ! 1689: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_1_128:
	setx	0x29033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a44960  ! 1696: FMULq	dis not found

	.word 0xbfa81c20  ! 1698: FMOVRGEZ	dis not found

	.word 0xb3a00560  ! 1699: FSQRTq	fsqrt	
	.word 0xbfa4c9c0  ! 1708: FDIVd	fdivd	%f50, %f0, %f62
cpu_intr_1_129:
	setx	0x280204, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_137:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_137), 16, 16)) -> intp(1, 0, 25)
	.word 0xb88d0000  ! 1713: ANDcc_R	andcc 	%r20, %r0, %r28
	.word 0xb7a98820  ! 1714: FMOVNEG	fmovs	%fcc1, %f0, %f27
iob_intr_1_138:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_138), 16, 16)) -> intp(1, 0, 32)
T1_asi_reg_wr_82:
	mov	0x3c0, %r14
	.word 0xfef38e80  ! 1719: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_1_130:
	setx	0x2a0109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_139:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_139), 16, 16)) -> intp(1, 0, 5)
	.word 0xb7a54820  ! 1724: FADDs	fadds	%f21, %f0, %f27
T1_asi_reg_wr_83:
	mov	0x25, %r14
	.word 0xf8f38400  ! 1727: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb5a4c8a0  ! 1728: FSUBs	fsubs	%f19, %f0, %f26
	.word 0xb9aa8820  ! 1729: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xb135c000  ! 1735: SRL_R	srl 	%r23, %r0, %r24
cpu_intr_1_131:
	setx	0x280030, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_69:
	mov	0x3c3, %r14
	.word 0xfcdb8e60  ! 1740: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbfaa4820  ! 1741: FMOVNE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_84:
	mov	0x18, %r14
	.word 0xf6f389e0  ! 1744: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T1_asi_reg_rd_70:
	mov	0x2d, %r14
	.word 0xf4db8e60  ! 1747: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb5508000  ! 1750: RDPR_TSTATE	<illegal instruction>
iob_intr_1_140:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_140), 16, 16)) -> intp(1, 0, 12)
	.word 0xb1aa4820  ! 1752: FMOVNE	fmovs	%fcc1, %f0, %f24
iob_intr_1_141:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_141), 16, 16)) -> intp(1, 0, 27)
iob_intr_1_142:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_142), 16, 16)) -> intp(1, 0, 7)
T1_asi_reg_rd_71:
	mov	0x3c5, %r14
	.word 0xf2db8400  ! 1767: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_1_132:
	setx	0x2b0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r21 + %g0] 0xf0, %f2
	.word 0xb1abc820  ! 1772: FMOVVC	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_85:
	mov	0x33, %r14
	.word 0xf4f389e0  ! 1775: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_1_133:
	setx	0x280220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a81c20  ! 1781: FMOVRGEZ	dis not found

T1_asi_reg_wr_86:
	mov	0x1e, %r14
	.word 0xfef389e0  ! 1785: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_1_143:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_143), 16, 16)) -> intp(1, 0, 16)
iob_intr_1_144:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_144), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb5a88820  ! 1790: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb6358000  ! 1791: SUBC_R	orn 	%r22, %r0, %r27
cpu_intr_1_134:
	setx	0x2b000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81c20  ! 1796: FMOVRGEZ	dis not found

T1_asi_reg_rd_72:
	mov	0x6, %r14
	.word 0xf4db8e60  ! 1797: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb1a98820  ! 1804: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xbda81c20  ! 1805: FMOVRGEZ	dis not found

	.word 0xb1a00040  ! 1809: FMOVd	fmovd	%f0, %f24
	.word 0xb1a4c940  ! 1811: FMULd	fmuld	%f50, %f0, %f24
T1_asi_reg_rd_73:
	mov	0x8, %r14
	.word 0xfcdb8400  ! 1812: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb3a589e0  ! 1813: FDIVq	dis not found

	.word 0xbb34a001  ! 1814: SRL_I	srl 	%r18, 0x0001, %r29
	.word 0xbfa98820  ! 1815: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb3aac820  ! 1820: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xb7a548e0  ! 1821: FSUBq	dis not found

	.word 0xb0a44000  ! 1822: SUBcc_R	subcc 	%r17, %r0, %r24
T1_asi_reg_rd_74:
	mov	0x3c5, %r14
	.word 0xfadb8e40  ! 1823: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb9aa4820  ! 1829: FMOVNE	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_75:
	mov	0x34, %r14
	.word 0xf0db89e0  ! 1830: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb17d2401  ! 1831: MOVR_I	movre	%r20, 0x1, %r24
	.word 0xb1a5c840  ! 1832: FADDd	faddd	%f54, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_wr_87:
	mov	0x12, %r14
	.word 0xf0f38e40  ! 1836: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_rd_76:
	mov	0x2d, %r14
	.word 0xf6db8e60  ! 1837: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb9346001  ! 1838: SRL_I	srl 	%r17, 0x0001, %r28
T1_asi_reg_rd_77:
	mov	0x27, %r14
	.word 0xf4db8e40  ! 1841: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_wr_88:
	mov	0x17, %r14
	.word 0xfaf38e60  ! 1842: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	lda	[%r16 + %g0] 0xf0, %f2
T1_asi_reg_wr_89:
	mov	0x25, %r14
	.word 0xf8f38e80  ! 1846: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_1_145:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_145), 16, 16)) -> intp(1, 0, 35)
	.word 0xbd3d3001  ! 1850: SRAX_I	srax	%r20, 0x0001, %r30
	.word 0xbba58960  ! 1851: FMULq	dis not found

	.word 0xb9a84820  ! 1853: FMOVE	fmovs	%fcc1, %f0, %f28
iob_intr_1_146:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_146), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_rd_78:
	mov	0x27, %r14
	.word 0xfedb8e40  ! 1856: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb57d0400  ! 1858: MOVR_R	movre	%r20, %r0, %r26
	.word 0xbda4c920  ! 1861: FMULs	fmuls	%f19, %f0, %f30
iob_intr_1_147:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_147), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb5a84820  ! 1866: FMOVE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_79:
	mov	0x3c3, %r14
	.word 0xf6db8e40  ! 1870: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_148:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_148), 16, 16)) -> intp(1, 0, 39)
	.word 0xb52ce001  ! 1873: SLL_I	sll 	%r19, 0x0001, %r26
iob_intr_1_149:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_149), 16, 16)) -> intp(1, 0, 32)
iob_intr_1_150:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_150), 16, 16)) -> intp(1, 0, e)
	.word 0xb7a00040  ! 1878: FMOVd	fmovd	%f0, %f58
	.word 0xb9a81420  ! 1882: FMOVRNZ	dis not found

cpu_intr_1_135:
	setx	0x2e0029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_151:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_151), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbba80c20  ! 1886: FMOVRLZ	dis not found

cpu_intr_1_136:
	setx	0x2f0128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a81c20  ! 1888: FMOVRGEZ	dis not found

	.word 0xb7a4c9a0  ! 1889: FDIVs	fdivs	%f19, %f0, %f27
	.word 0xb9a00020  ! 1893: FMOVs	fmovs	%f0, %f28
T1_asi_reg_rd_80:
	mov	0x3c5, %r14
	.word 0xf0db8e40  ! 1895: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_rd_81:
	mov	0x22, %r14
	.word 0xf8db8e40  ! 1898: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbfa98820  ! 1899: FMOVNEG	fmovs	%fcc1, %f0, %f31
iob_intr_1_152:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_152), 16, 16)) -> intp(1, 0, 13)
	.word 0xb5a00540  ! 1902: FSQRTd	fsqrt	
	.word 0xbfa9c820  ! 1903: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xbda449c0  ! 1905: FDIVd	fdivd	%f48, %f0, %f30
T1_asi_reg_wr_90:
	mov	0xa, %r14
	.word 0xf0f38e80  ! 1908: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_1_137:
	setx	0x2f001d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_153:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_153), 16, 16)) -> intp(1, 0, 34)
	.word 0xb09560cc  ! 1915: ORcc_I	orcc 	%r21, 0x00cc, %r24
	.word 0xb6b5202f  ! 1916: SUBCcc_I	orncc 	%r20, 0x002f, %r27
	.word 0xb615c000  ! 1917: OR_R	or 	%r23, %r0, %r27
T1_asi_reg_wr_91:
	mov	0x3c8, %r14
	.word 0xf6f38400  ! 1918: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_1_154:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_154), 16, 16)) -> intp(1, 0, 35)
cpu_intr_1_138:
	setx	0x2f002f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_139:
	setx	0x2c003b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_140:
	setx	0x2f0232, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_92:
	mov	0x6, %r14
	.word 0xf4f38e40  ! 1934: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_155:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_155), 16, 16)) -> intp(1, 0, 27)
	.word 0xbb643801  ! 1936: MOVcc_I	<illegal instruction>
	.word 0xbe848000  ! 1937: ADDcc_R	addcc 	%r18, %r0, %r31
	.word 0xbdab4820  ! 1938: FMOVCC	fmovs	%fcc1, %f0, %f30
cpu_intr_1_141:
	setx	0x2e0129, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_82:
	mov	0x3c1, %r14
	.word 0xf4db89e0  ! 1944: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbfa98820  ! 1945: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb5a408c0  ! 1946: FSUBd	fsubd	%f16, %f0, %f26
	.word 0xbba40920  ! 1949: FMULs	fmuls	%f16, %f0, %f29
	.word 0xb7a80820  ! 1951: FMOVN	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_93:
	mov	0x22, %r14
	.word 0xfaf38e40  ! 1953: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_1_142:
	setx	0x2f0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe84e16c  ! 1956: ADDcc_I	addcc 	%r19, 0x016c, %r31
cpu_intr_1_143:
	setx	0x2c002a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_94:
	mov	0x38, %r14
	.word 0xf6f38e60  ! 1965: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb1a50820  ! 1966: FADDs	fadds	%f20, %f0, %f24
T1_asi_reg_wr_95:
	mov	0x32, %r14
	.word 0xfef38e60  ! 1968: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_1_144:
	setx	0x2f0230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00540  ! 1971: FSQRTd	fsqrt	
T1_asi_reg_wr_96:
	mov	0x38, %r14
	.word 0xf2f38e80  ! 1972: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_1_156:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_156), 16, 16)) -> intp(1, 0, 30)
iob_intr_1_157:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_157), 16, 16)) -> intp(1, 0, 3)
cpu_intr_1_145:
	setx	0x2f0339, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_146:
	setx	0x2e0112, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_97:
	mov	0x28, %r14
	.word 0xfef38e40  ! 1980: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_1_147:
	setx	0x2e0308, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_148:
	setx	0x2d0339, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_158:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_158), 16, 16)) -> intp(1, 0, 25)
T1_asi_reg_rd_83:
	mov	0x1a, %r14
	.word 0xfcdb8e40  ! 1988: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_149:
	setx	0x2f032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_98:
	mov	0x7, %r14
	.word 0xf2f384a0  ! 1994: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbab421aa  ! 1995: SUBCcc_I	orncc 	%r16, 0x01aa, %r29
cpu_intr_1_150:
	setx	0x2e0013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00560  ! 2000: FSQRTq	fsqrt	
	.word 0xbda5c820  ! 2003: FADDs	fadds	%f23, %f0, %f30
	.word 0xbfa00520  ! 2005: FSQRTs	fsqrt	
	.word 0xb1a00020  ! 2007: FMOVs	fmovs	%f0, %f24
iob_intr_1_159:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_159), 16, 16)) -> intp(1, 0, 27)
T1_asi_reg_wr_99:
	mov	0x34, %r14
	.word 0xf2f389e0  ! 2009: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T1_asi_reg_rd_84:
	mov	0x3c3, %r14
	.word 0xf6db8e40  ! 2010: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_151:
	setx	0x2d0302, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_152:
	setx	0x2d0025, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r16 + %g0] 0xf0, %f2
T1_asi_reg_rd_85:
	mov	0x28, %r14
	.word 0xf2db84a0  ! 2021: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_1_153:
	setx	0x2c0031, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_160:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_160), 16, 16)) -> intp(1, 0, 7)
cpu_intr_1_154:
	setx	0x2e0023, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_100:
	mov	0x7, %r14
	.word 0xf2f384a0  ! 2028: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb5a48820  ! 2036: FADDs	fadds	%f18, %f0, %f26
	lda	[%r16 + %g0] 0xf0, %f2
cpu_intr_1_155:
	setx	0x2d020a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_86:
	mov	0x22, %r14
	.word 0xfadb89e0  ! 2040: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_1_161:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_161), 16, 16)) -> intp(1, 0, e)
	.word 0xb5a00560  ! 2047: FSQRTq	fsqrt	
iob_intr_1_162:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_162), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb3a80c20  ! 2055: FMOVRLZ	dis not found

iob_intr_1_163:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_163), 16, 16)) -> intp(1, 0, 31)
T1_asi_reg_wr_101:
	mov	0x2e, %r14
	.word 0xf6f38e80  ! 2060: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_1_164:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_164), 16, 16)) -> intp(1, 0, 10)
	.word 0x9195a1bf  ! 2067: WRPR_PIL_I	wrpr	%r22, 0x01bf, %pil
iob_intr_1_165:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_165), 16, 16)) -> intp(1, 0, a)
T1_asi_reg_wr_102:
	mov	0x8, %r14
	.word 0xf8f38e40  ! 2074: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_rd_87:
	mov	0x1e, %r14
	.word 0xf4db89e0  ! 2080: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T1_asi_reg_wr_103:
	mov	0x29, %r14
	.word 0xf6f38e40  ! 2081: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb7a4c860  ! 2084: FADDq	dis not found

	.word 0xb7aac820  ! 2087: FMOVGE	fmovs	%fcc1, %f0, %f27
iob_intr_1_166:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_166), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_167:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_167), 16, 16)) -> intp(1, 0, 27)
	.word 0xb1a80820  ! 2096: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb4c58000  ! 2097: ADDCcc_R	addccc 	%r22, %r0, %r26
	.word 0xbba98820  ! 2099: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xbca420f3  ! 2101: SUBcc_I	subcc 	%r16, 0x00f3, %r30
iob_intr_1_168:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_168), 16, 16)) -> intp(1, 0, 37)
T1_asi_reg_rd_88:
	mov	0x1c, %r14
	.word 0xf4db8e80  ! 2107: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_1_169:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_169), 16, 16)) -> intp(1, 0, 39)
	.word 0xbda80c20  ! 2111: FMOVRLZ	dis not found

cpu_intr_1_156:
	setx	0x2d032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a81c20  ! 2114: FMOVRGEZ	dis not found

iob_intr_1_170:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_170), 16, 16)) -> intp(1, 0, 2c)
T1_asi_reg_wr_104:
	mov	0x3c2, %r14
	.word 0xfcf38400  ! 2121: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb695e0d0  ! 2122: ORcc_I	orcc 	%r23, 0x00d0, %r27
cpu_intr_1_157:
	setx	0x2d0021, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_171:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_171), 16, 16)) -> intp(1, 0, 20)
cpu_intr_1_158:
	setx	0x2e0112, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_159:
	setx	0x2e0130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba040000  ! 2129: ADD_R	add 	%r16, %r0, %r29
iob_intr_1_172:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_172), 16, 16)) -> intp(1, 0, 27)
	.word 0xb3aac820  ! 2135: FMOVGE	fmovs	%fcc1, %f0, %f25
iob_intr_1_173:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_173), 16, 16)) -> intp(1, 0, 37)
iob_intr_1_174:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_174), 16, 16)) -> intp(1, 0, 28)
T1_asi_reg_rd_89:
	mov	0x1b, %r14
	.word 0xfedb8e40  ! 2140: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_1_175:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_175), 16, 16)) -> intp(1, 0, 19)
	.word 0xb9a00540  ! 2143: FSQRTd	fsqrt	
iob_intr_1_176:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_176), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_160:
	setx	0x2f012f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_90:
	mov	0x3c0, %r14
	.word 0xfadb8400  ! 2146: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_1_161:
	setx	0x2f0321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a88820  ! 2148: FMOVLE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_105:
	mov	0x3c8, %r14
	.word 0xf0f38e40  ! 2149: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_wr_106:
	mov	0x10, %r14
	.word 0xf0f38e80  ! 2150: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb7a48840  ! 2151: FADDd	faddd	%f18, %f0, %f58
	.word 0xb48dc000  ! 2152: ANDcc_R	andcc 	%r23, %r0, %r26
	.word 0xb5a4c9a0  ! 2157: FDIVs	fdivs	%f19, %f0, %f26
	lda	[%r22 + %g0] 0xf0, %f2
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbba58920  ! 2163: FMULs	fmuls	%f22, %f0, %f29
iob_intr_1_177:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_177), 16, 16)) -> intp(1, 0, 3)
iob_intr_1_178:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_178), 16, 16)) -> intp(1, 0, 32)
	.word 0xb3a80820  ! 2176: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb9ab8820  ! 2181: FMOVPOS	fmovs	%fcc1, %f0, %f28
cpu_intr_1_162:
	setx	0x2d0312, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_163:
	setx	0x2d0102, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_91:
	mov	0x25, %r14
	.word 0xfcdb8e40  ! 2186: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbfa80820  ! 2191: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
iob_intr_1_179:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_179), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb1ab8820  ! 2198: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xbbab4820  ! 2201: FMOVCC	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_107:
	mov	0x3c7, %r14
	.word 0xf6f389e0  ! 2204: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb7ab0820  ! 2207: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb3a80820  ! 2208: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb93c7001  ! 2211: SRAX_I	srax	%r17, 0x0001, %r28
T1_asi_reg_wr_108:
	mov	0x3c8, %r14
	.word 0xfaf38e80  ! 2214: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_180:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_180), 16, 16)) -> intp(1, 0, 14)
	.word 0xb69de148  ! 2218: XORcc_I	xorcc 	%r23, 0x0148, %r27
T1_asi_reg_wr_109:
	mov	0x6, %r14
	.word 0xfef38e80  ! 2219: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb5340000  ! 2225: SRL_R	srl 	%r16, %r0, %r26
	.word 0xb5a48860  ! 2226: FADDq	dis not found

	.word 0xb12c9000  ! 2227: SLLX_R	sllx	%r18, %r0, %r24
	.word 0xb9abc820  ! 2229: FMOVVC	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_110:
	mov	0x1, %r14
	.word 0xf2f389e0  ! 2232: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_1_181:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_181), 16, 16)) -> intp(1, 0, 11)
	.word 0xbda44920  ! 2237: FMULs	fmuls	%f17, %f0, %f30
	.word 0xb5a80820  ! 2242: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_92:
	mov	0x3c5, %r14
	.word 0xf6db8400  ! 2245: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T1_asi_reg_rd_93:
	mov	0x22, %r14
	.word 0xfadb8400  ! 2246: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa44840  ! 2248: FADDd	faddd	%f48, %f0, %f62
iob_intr_1_182:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_182), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_wr_111:
	mov	0x3c6, %r14
	.word 0xfaf389e0  ! 2251: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_1_164:
	setx	0x2d0336, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_94:
	mov	0x7, %r14
	.word 0xf0db8e40  ! 2263: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb5a48840  ! 2265: FADDd	faddd	%f18, %f0, %f26
	.word 0xb1aac820  ! 2267: FMOVGE	fmovs	%fcc1, %f0, %f24
iob_intr_1_183:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_183), 16, 16)) -> intp(1, 0, c)
cpu_intr_1_165:
	setx	0x2c013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_95:
	mov	0x2e, %r14
	.word 0xf2db8e60  ! 2270: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb8446010  ! 2271: ADDC_I	addc 	%r17, 0x0010, %r28
T1_asi_reg_rd_96:
	mov	0x8, %r14
	.word 0xfadb89e0  ! 2273: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb1a88820  ! 2274: FMOVLE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_97:
	mov	0x3c0, %r14
	.word 0xf8db84a0  ! 2275: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_1_184:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_184), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb3a94820  ! 2279: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xb5a80820  ! 2280: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb7a00560  ! 2282: FSQRTq	fsqrt	
cpu_intr_1_166:
	setx	0x320335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb13cf001  ! 2285: SRAX_I	srax	%r19, 0x0001, %r24
cpu_intr_1_167:
	setx	0x330203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a4c8a0  ! 2291: FSUBs	fsubs	%f19, %f0, %f24
	.word 0xb2b421c2  ! 2292: ORNcc_I	orncc 	%r16, 0x01c2, %r25
iob_intr_1_185:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_185), 16, 16)) -> intp(1, 0, 20)
iob_intr_1_186:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_186), 16, 16)) -> intp(1, 0, 35)
	.word 0xb4c4e164  ! 2297: ADDCcc_I	addccc 	%r19, 0x0164, %r26
	.word 0xb9a449a0  ! 2298: FDIVs	fdivs	%f17, %f0, %f28
	.word 0xb5ab4820  ! 2299: FMOVCC	fmovs	%fcc1, %f0, %f26
iob_intr_1_187:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_187), 16, 16)) -> intp(1, 0, 15)
T1_asi_reg_wr_112:
	mov	0x3, %r14
	.word 0xfef384a0  ! 2303: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xbbab0820  ! 2305: FMOVGU	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_113:
	mov	0x0, %r14
	.word 0xf2f38400  ! 2307: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbda9c820  ! 2309: FMOVVS	fmovs	%fcc1, %f0, %f30
iob_intr_1_188:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_188), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb1a50860  ! 2316: FADDq	dis not found

	.word 0xba858000  ! 2317: ADDcc_R	addcc 	%r22, %r0, %r29
	.word 0xb5a80820  ! 2319: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb3a94820  ! 2320: FMOVCS	fmovs	%fcc1, %f0, %f25
iob_intr_1_189:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_189), 16, 16)) -> intp(1, 0, 25)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda58920  ! 2325: FMULs	fmuls	%f22, %f0, %f30
T1_asi_reg_wr_114:
	mov	0x22, %r14
	.word 0xfaf38e60  ! 2327: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb5a489a0  ! 2328: FDIVs	fdivs	%f18, %f0, %f26
iob_intr_1_190:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_190), 16, 16)) -> intp(1, 0, c)
cpu_intr_1_168:
	setx	0x300132, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_115:
	mov	0x2b, %r14
	.word 0xf2f38e80  ! 2331: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T1_asi_reg_wr_116:
	mov	0x28, %r14
	.word 0xf8f389e0  ! 2333: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_1_191:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_191), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb7a81c20  ! 2337: FMOVRGEZ	dis not found

iob_intr_1_192:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_192), 16, 16)) -> intp(1, 0, 14)
T1_asi_reg_rd_98:
	mov	0x17, %r14
	.word 0xfcdb8400  ! 2348: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T1_asi_reg_rd_99:
	mov	0x3c0, %r14
	.word 0xfadb89e0  ! 2350: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb5a589e0  ! 2351: FDIVq	dis not found

cpu_intr_1_169:
	setx	0x300121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba488c0  ! 2355: FSUBd	fsubd	%f18, %f0, %f60
cpu_intr_1_170:
	setx	0x33003e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_171:
	setx	0x30032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a9c820  ! 2362: FMOVVS	fmovs	%fcc1, %f0, %f24
cpu_intr_1_172:
	setx	0x33021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_193:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_193), 16, 16)) -> intp(1, 0, 30)
iob_intr_1_194:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_194), 16, 16)) -> intp(1, 0, 5)
	.word 0xb3aac820  ! 2369: FMOVGE	fmovs	%fcc1, %f0, %f25
iob_intr_1_195:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_195), 16, 16)) -> intp(1, 0, 27)
iob_intr_1_196:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_196), 16, 16)) -> intp(1, 0, 3)
cpu_intr_1_173:
	setx	0x30001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_174:
	setx	0x30003f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_175:
	setx	0x330134, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_197:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_197), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_rd_100:
	mov	0x3c0, %r14
	.word 0xf4db8e80  ! 2385: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T1_asi_reg_rd_101:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 2387: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_176:
	setx	0x320332, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_198:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_198), 16, 16)) -> intp(1, 0, 9)
T1_asi_reg_rd_102:
	mov	0x3c2, %r14
	.word 0xfadb89e0  ! 2401: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_1_199:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_199), 16, 16)) -> intp(1, 0, 9)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a88820  ! 2406: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xbfaa8820  ! 2408: FMOVG	fmovs	%fcc1, %f0, %f31
cpu_intr_1_177:
	setx	0x330231, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_117:
	mov	0x4, %r14
	.word 0xfcf38e60  ! 2412: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbda81820  ! 2413: FMOVRGZ	fmovs	%fcc3, %f0, %f30
iob_intr_1_200:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_200), 16, 16)) -> intp(1, 0, 6)
	.word 0xbfa40960  ! 2416: FMULq	dis not found

cpu_intr_1_178:
	setx	0x310035, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_103:
	mov	0xc, %r14
	.word 0xfcdb8e80  ! 2420: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_1_201:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_201), 16, 16)) -> intp(1, 0, 35)
iob_intr_1_202:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_202), 16, 16)) -> intp(1, 0, 2b)
T1_asi_reg_wr_118:
	mov	0x3c1, %r14
	.word 0xf2f38e80  ! 2424: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_1_179:
	setx	0x32020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80420  ! 2427: FMOVRZ	dis not found

T1_asi_reg_rd_104:
	mov	0x12, %r14
	.word 0xf6db84a0  ! 2428: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbfa5c920  ! 2429: FMULs	fmuls	%f23, %f0, %f31
T1_asi_reg_wr_119:
	mov	0x3c8, %r14
	.word 0xf6f38e60  ! 2430: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb12d1000  ! 2431: SLLX_R	sllx	%r20, %r0, %r24
cpu_intr_1_180:
	setx	0x33012a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_105:
	mov	0xc, %r14
	.word 0xf4db8e40  ! 2436: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb2bc0000  ! 2437: XNORcc_R	xnorcc 	%r16, %r0, %r25
T1_asi_reg_rd_106:
	mov	0x3c0, %r14
	.word 0xfedb8e40  ! 2438: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_1_203:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_203), 16, 16)) -> intp(1, 0, 1f)
iob_intr_1_204:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_204), 16, 16)) -> intp(1, 0, 38)
cpu_intr_1_181:
	setx	0x330309, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_107:
	mov	0x2a, %r14
	.word 0xf4db8400  ! 2449: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb9a44960  ! 2450: FMULq	dis not found

cpu_intr_1_182:
	setx	0x31000f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_120:
	mov	0x4, %r14
	.word 0xf8f38400  ! 2460: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	lda	[%r18 + %g0] 0xf0, %f2
	.word 0xb034a16f  ! 2462: ORN_I	orn 	%r18, 0x016f, %r24
	.word 0xb1a508e0  ! 2466: FSUBq	dis not found

T1_asi_reg_wr_121:
	mov	0x2, %r14
	.word 0xfef384a0  ! 2468: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_1_183:
	setx	0x330324, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_184:
	setx	0x320327, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_185:
	setx	0x30010a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_205:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_205), 16, 16)) -> intp(1, 0, 2)
	.word 0xb604e164  ! 2477: ADD_I	add 	%r19, 0x0164, %r27
	.word 0xbb345000  ! 2478: SRLX_R	srlx	%r17, %r0, %r29
	.word 0xbba4c960  ! 2479: FMULq	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb405e1c3  ! 2482: ADD_I	add 	%r23, 0x01c3, %r26
cpu_intr_1_186:
	setx	0x310004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a548c0  ! 2484: FSUBd	fsubd	%f52, %f0, %f24
cpu_intr_1_187:
	setx	0x1012d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_188:
	setx	0x33020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a90820  ! 2493: FMOVLEU	fmovs	%fcc1, %f0, %f26
cpu_intr_1_189:
	setx	0x310017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a54920  ! 2495: FMULs	fmuls	%f21, %f0, %f28
	.word 0xbbab8820  ! 2496: FMOVPOS	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_108:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 2497: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbda9c820  ! 2500: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xbda54860  ! 2502: FADDq	dis not found

	.word 0xbc0c4000  ! 2503: AND_R	and 	%r17, %r0, %r30
	.word 0xb1a409a0  ! 2504: FDIVs	fdivs	%f16, %f0, %f24
	.word 0xb1641800  ! 2505: MOVcc_R	<illegal instruction>
T1_asi_reg_rd_109:
	mov	0x28, %r14
	.word 0xf2db8e60  ! 2506: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T1_asi_reg_rd_110:
	mov	0x9, %r14
	.word 0xf0db84a0  ! 2507: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_1_206:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_206), 16, 16)) -> intp(1, 0, 19)
	.word 0xbda448c0  ! 2509: FSUBd	fsubd	%f48, %f0, %f30
T1_asi_reg_wr_122:
	mov	0x5, %r14
	.word 0xf6f389e0  ! 2510: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T1_asi_reg_wr_123:
	mov	0x7, %r14
	.word 0xfaf38e40  ! 2511: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_1_190:
	setx	0x300020, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_111:
	mov	0xe, %r14
	.word 0xfadb8e40  ! 2516: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	lda	[%r18 + %g0] 0xf0, %f2
	.word 0xbfab4820  ! 2519: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb7a409c0  ! 2520: FDIVd	fdivd	%f16, %f0, %f58
iob_intr_1_207:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_207), 16, 16)) -> intp(1, 0, 1b)
cpu_intr_1_191:
	setx	0x32031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00520  ! 2523: FSQRTs	fsqrt	
	.word 0xb3a508e0  ! 2524: FSUBq	dis not found

	.word 0xbba5c8c0  ! 2529: FSUBd	fsubd	%f54, %f0, %f60
iob_intr_1_208:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_208), 16, 16)) -> intp(1, 0, 1c)
	.word 0xbb7c4400  ! 2538: MOVR_R	movre	%r17, %r0, %r29
iob_intr_1_209:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_209), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_rd_112:
	mov	0x3c3, %r14
	.word 0xfedb8e40  ! 2540: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T1_asi_reg_rd_113:
	mov	0x3c6, %r14
	.word 0xfcdb8e40  ! 2547: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_210:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_210), 16, 16)) -> intp(1, 0, 2e)
iob_intr_1_211:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_211), 16, 16)) -> intp(1, 0, 3c)
cpu_intr_1_192:
	setx	0x31002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80820  ! 2553: FMOVN	fmovs	%fcc1, %f0, %f24
iob_intr_1_212:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_212), 16, 16)) -> intp(1, 0, 7)
T1_asi_reg_rd_114:
	mov	0x3c1, %r14
	.word 0xfcdb8400  ! 2555: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb7353001  ! 2558: SRLX_I	srlx	%r20, 0x0001, %r27
T1_asi_reg_wr_124:
	mov	0x3c1, %r14
	.word 0xf6f38e60  ! 2560: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_1_193:
	setx	0x300101, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_213:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_213), 16, 16)) -> intp(1, 0, 1c)
iob_intr_1_214:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_214), 16, 16)) -> intp(1, 0, 2b)
iob_intr_1_215:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_215), 16, 16)) -> intp(1, 0, 37)
	.word 0xbe1d8000  ! 2565: XOR_R	xor 	%r22, %r0, %r31
	.word 0xb7aac820  ! 2566: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb9a84820  ! 2567: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb7a00020  ! 2568: FMOVs	fmovs	%f0, %f27
iob_intr_1_216:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_216), 16, 16)) -> intp(1, 0, 31)
	.word 0xb5a549e0  ! 2573: FDIVq	dis not found

	.word 0xb9a448c0  ! 2576: FSUBd	fsubd	%f48, %f0, %f28
iob_intr_1_217:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_217), 16, 16)) -> intp(1, 0, 12)
	.word 0xb7a50860  ! 2580: FADDq	dis not found

	.word 0xbfa84820  ! 2585: FMOVE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_194:
	setx	0x320135, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_218:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_218), 16, 16)) -> intp(1, 0, 1c)
cpu_intr_1_195:
	setx	0x330000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_196:
	setx	0x320317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_197:
	setx	0x30003f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_219:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_219), 16, 16)) -> intp(1, 0, 32)
iob_intr_1_220:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_220), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_rd_115:
	mov	0x36, %r14
	.word 0xf8db84a0  ! 2598: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbfa548e0  ! 2599: FSUBq	dis not found

T1_asi_reg_wr_125:
	mov	0x3c7, %r14
	.word 0xf2f389e0  ! 2601: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_1_221:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_221), 16, 16)) -> intp(1, 0, 22)
T1_asi_reg_rd_116:
	mov	0xe, %r14
	.word 0xf8db84a0  ! 2606: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbba88820  ! 2609: FMOVLE	fmovs	%fcc1, %f0, %f29
iob_intr_1_222:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_222), 16, 16)) -> intp(1, 0, 14)
T1_asi_reg_wr_126:
	mov	0x10, %r14
	.word 0xf2f38e60  ! 2614: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb8140000  ! 2617: OR_R	or 	%r16, %r0, %r28
	.word 0xb9a00520  ! 2619: FSQRTs	fsqrt	
iob_intr_1_223:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_223), 16, 16)) -> intp(1, 0, 23)
cpu_intr_1_198:
	setx	0x330238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7ab4820  ! 2624: FMOVCC	fmovs	%fcc1, %f0, %f27
iob_intr_1_224:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_224), 16, 16)) -> intp(1, 0, 1e)
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xbfa44860  ! 2630: FADDq	dis not found

cpu_intr_1_199:
	setx	0x300233, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_225:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_225), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_226:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_226), 16, 16)) -> intp(1, 0, 2e)
T1_asi_reg_rd_117:
	mov	0x3, %r14
	.word 0xfedb8e40  ! 2639: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T1_asi_reg_wr_127:
	mov	0x11, %r14
	.word 0xf6f384a0  ! 2641: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb72c7001  ! 2642: SLLX_I	sllx	%r17, 0x0001, %r27
	.word 0xb1aa0820  ! 2643: FMOVA	fmovs	%fcc1, %f0, %f24
cpu_intr_1_200:
	setx	0x32003e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_201:
	setx	0x300320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb82de0dc  ! 2651: ANDN_I	andn 	%r23, 0x00dc, %r28
iob_intr_1_227:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_227), 16, 16)) -> intp(1, 0, 33)
	.word 0xbda489e0  ! 2658: FDIVq	dis not found

	.word 0xbba5c940  ! 2662: FMULd	fmuld	%f54, %f0, %f60
	.word 0xb1a81820  ! 2663: FMOVRGZ	fmovs	%fcc3, %f0, %f24
cpu_intr_1_202:
	setx	0x31002e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_203:
	setx	0x31032c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_128:
	mov	0x3c1, %r14
	.word 0xf8f38e40  ! 2666: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_1_228:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_228), 16, 16)) -> intp(1, 0, e)
iob_intr_1_229:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_229), 16, 16)) -> intp(1, 0, f)
cpu_intr_1_204:
	setx	0x330022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a84820  ! 2673: FMOVE	fmovs	%fcc1, %f0, %f25
cpu_intr_1_205:
	setx	0x300337, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_206:
	setx	0x33023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00560  ! 2677: FSQRTq	fsqrt	
	.word 0xb3a88820  ! 2681: FMOVLE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_118:
	mov	0x11, %r14
	.word 0xfadb89e0  ! 2683: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_1_207:
	setx	0x330204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb734e001  ! 2685: SRL_I	srl 	%r19, 0x0001, %r27
	.word 0xba1da11c  ! 2691: XOR_I	xor 	%r22, 0x011c, %r29
	.word 0xb7a88820  ! 2692: FMOVLE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_119:
	mov	0xa, %r14
	.word 0xfadb89e0  ! 2693: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T1_asi_reg_rd_120:
	mov	0x17, %r14
	.word 0xf6db8e40  ! 2694: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbba5c8c0  ! 2695: FSUBd	fsubd	%f54, %f0, %f60
T1_asi_reg_wr_129:
	mov	0x1f, %r14
	.word 0xfaf384a0  ! 2696: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb7540000  ! 2697: RDPR_GL	<illegal instruction>
	.word 0xb7a548c0  ! 2700: FSUBd	fsubd	%f52, %f0, %f58
	.word 0xbf7d2401  ! 2704: MOVR_I	movre	%r20, 0x1, %r31
cpu_intr_1_208:
	setx	0x300232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa98820  ! 2706: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xbda58960  ! 2708: FMULq	dis not found

iob_intr_1_230:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_230), 16, 16)) -> intp(1, 0, 5)
	.word 0xbba5c9a0  ! 2711: FDIVs	fdivs	%f23, %f0, %f29
cpu_intr_1_209:
	setx	0x31011c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_210:
	setx	0x330132, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_211:
	setx	0x33033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00540  ! 2721: FSQRTd	fsqrt	
iob_intr_1_231:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_231), 16, 16)) -> intp(1, 0, 3a)
	.word 0xbd508000  ! 2729: RDPR_TSTATE	<illegal instruction>
	.word 0xb1ab4820  ! 2730: FMOVCC	fmovs	%fcc1, %f0, %f24
iob_intr_1_232:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_232), 16, 16)) -> intp(1, 0, e)
	.word 0xb3a4c9a0  ! 2734: FDIVs	fdivs	%f19, %f0, %f25
	.word 0xbba00560  ! 2737: FSQRTq	fsqrt	
	.word 0xb1a54860  ! 2738: FADDq	dis not found

	lda	[%r16 + %g0] 0xf0, %f2
iob_intr_1_233:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_233), 16, 16)) -> intp(1, 0, 33)
cpu_intr_1_212:
	setx	0x35011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa94820  ! 2746: FMOVCS	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_130:
	mov	0x2d, %r14
	.word 0xf8f384a0  ! 2751: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbba81820  ! 2752: FMOVRGZ	fmovs	%fcc3, %f0, %f29
iob_intr_1_234:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_234), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb3a94820  ! 2754: FMOVCS	fmovs	%fcc1, %f0, %f25
iob_intr_1_235:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_235), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb3a00020  ! 2759: FMOVs	fmovs	%f0, %f25
	.word 0xb1a4c9e0  ! 2761: FDIVq	dis not found

T1_asi_reg_rd_121:
	mov	0x1f, %r14
	.word 0xf2db8e80  ! 2762: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbfa00520  ! 2763: FSQRTs	fsqrt	
	.word 0xbfab0820  ! 2764: FMOVGU	fmovs	%fcc1, %f0, %f31
iob_intr_1_236:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_236), 16, 16)) -> intp(1, 0, 3)
	.word 0xbe34a178  ! 2766: ORN_I	orn 	%r18, 0x0178, %r31
cpu_intr_1_213:
	setx	0x350124, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_122:
	mov	0x17, %r14
	.word 0xfadb8e80  ! 2773: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T1_asi_reg_wr_131:
	mov	0x3c4, %r14
	.word 0xfaf384a0  ! 2774: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbfa8c820  ! 2775: FMOVL	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_123:
	mov	0x23, %r14
	.word 0xfadb8400  ! 2781: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_1_237:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_237), 16, 16)) -> intp(1, 0, 23)
	.word 0xbe85c000  ! 2784: ADDcc_R	addcc 	%r23, %r0, %r31
	.word 0xb3a80820  ! 2788: FMOVN	fmovs	%fcc1, %f0, %f25
cpu_intr_1_214:
	setx	0x370111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0150000  ! 2791: OR_R	or 	%r20, %r0, %r24
	.word 0xbda94820  ! 2796: FMOVCS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_132:
	mov	0x12, %r14
	.word 0xf8f389e0  ! 2797: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbda81820  ! 2801: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xbfa81420  ! 2802: FMOVRNZ	dis not found

	.word 0xb9a548a0  ! 2803: FSUBs	fsubs	%f21, %f0, %f28
cpu_intr_1_215:
	setx	0x370111, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r16 + %g0] 0xf0, %f2
T1_asi_reg_rd_124:
	mov	0x10, %r14
	.word 0xf2db84a0  ! 2808: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb42d600b  ! 2810: ANDN_I	andn 	%r21, 0x000b, %r26
iob_intr_1_238:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_238), 16, 16)) -> intp(1, 0, 33)
T1_asi_reg_wr_133:
	mov	0x3c1, %r14
	.word 0xf2f384a0  ! 2814: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb1a408e0  ! 2819: FSUBq	dis not found

T1_asi_reg_wr_134:
	mov	0x16, %r14
	.word 0xf2f389e0  ! 2823: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_1_216:
	setx	0x340120, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_239:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_239), 16, 16)) -> intp(1, 0, 20)
	.word 0xbda58960  ! 2829: FMULq	dis not found

cpu_intr_1_217:
	setx	0x370022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a48840  ! 2834: FADDd	faddd	%f18, %f0, %f28
cpu_intr_1_218:
	setx	0x370302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00020  ! 2836: FMOVs	fmovs	%f0, %f26
T1_asi_reg_rd_125:
	mov	0x29, %r14
	.word 0xf2db8400  ! 2837: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xbb3cc000  ! 2838: SRA_R	sra 	%r19, %r0, %r29
cpu_intr_1_219:
	setx	0x340208, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_240:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_240), 16, 16)) -> intp(1, 0, 33)
T1_asi_reg_rd_126:
	mov	0x18, %r14
	.word 0xfcdb8400  ! 2845: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T1_asi_reg_rd_127:
	mov	0x36, %r14
	.word 0xf0db89e0  ! 2846: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb3a4c860  ! 2851: FADDq	dis not found

cpu_intr_1_220:
	setx	0x34032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xa1902002  ! 2861: WRPR_GL_I	wrpr	%r0, 0x0002, %-
iob_intr_1_241:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_241), 16, 16)) -> intp(1, 0, 30)
	.word 0xb1a40820  ! 2864: FADDs	fadds	%f16, %f0, %f24
cpu_intr_1_221:
	setx	0x370315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00560  ! 2869: FSQRTq	fsqrt	
	.word 0xb7a81c20  ! 2870: FMOVRGEZ	dis not found

T1_asi_reg_rd_128:
	mov	0x3c8, %r14
	.word 0xf4db8e40  ! 2871: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_1_242:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_242), 16, 16)) -> intp(1, 0, 2d)
	.word 0xbda00520  ! 2874: FSQRTs	fsqrt	
iob_intr_1_243:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_243), 16, 16)) -> intp(1, 0, 28)
	.word 0xbe940000  ! 2876: ORcc_R	orcc 	%r16, %r0, %r31
	.word 0xb5a4c8a0  ! 2879: FSUBs	fsubs	%f19, %f0, %f26
iob_intr_1_244:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_244), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb2b48000  ! 2883: SUBCcc_R	orncc 	%r18, %r0, %r25
iob_intr_1_245:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_245), 16, 16)) -> intp(1, 0, e)
cpu_intr_1_222:
	setx	0x34003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc3561bf  ! 2896: ORN_I	orn 	%r21, 0x01bf, %r30
	.word 0xb7a00540  ! 2897: FSQRTd	fsqrt	
	.word 0xb5a449e0  ! 2902: FDIVq	dis not found

	.word 0xb1a81c20  ! 2903: FMOVRGEZ	dis not found

iob_intr_1_246:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_246), 16, 16)) -> intp(1, 0, 8)
	.word 0xb1aac820  ! 2905: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xbfa00040  ! 2906: FMOVd	fmovd	%f0, %f62
	.word 0xbda80820  ! 2907: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xbfabc820  ! 2908: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xba95e0d8  ! 2909: ORcc_I	orcc 	%r23, 0x00d8, %r29
cpu_intr_1_223:
	setx	0x360226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a88820  ! 2915: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xbda408a0  ! 2922: FSUBs	fsubs	%f16, %f0, %f30
T1_asi_reg_rd_129:
	mov	0x3c0, %r14
	.word 0xfedb8400  ! 2923: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_1_247:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_247), 16, 16)) -> intp(1, 0, 32)
cpu_intr_1_224:
	setx	0x370019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7abc820  ! 2932: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xbfa44860  ! 2934: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbba80820  ! 2938: FMOVN	fmovs	%fcc1, %f0, %f29
cpu_intr_1_225:
	setx	0x350202, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_130:
	mov	0x2c, %r14
	.word 0xf8db8e60  ! 2944: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_1_226:
	setx	0x36000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7500000  ! 2946: RDPR_TPC	<illegal instruction>
iob_intr_1_248:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_248), 16, 16)) -> intp(1, 0, 38)
	.word 0xb9a50820  ! 2949: FADDs	fadds	%f20, %f0, %f28
iob_intr_1_249:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_249), 16, 16)) -> intp(1, 0, 23)
	.word 0xb3a00040  ! 2952: FMOVd	fmovd	%f0, %f56
iob_intr_1_250:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_250), 16, 16)) -> intp(1, 0, 15)
T1_asi_reg_rd_131:
	mov	0x4, %r14
	.word 0xf6db89e0  ! 2958: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xbba50840  ! 2959: FADDd	faddd	%f20, %f0, %f60
	.word 0xb6948000  ! 2960: ORcc_R	orcc 	%r18, %r0, %r27
	.word 0xbfaa8820  ! 2961: FMOVG	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_132:
	mov	0x3c0, %r14
	.word 0xfedb89e0  ! 2963: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbda4c860  ! 2967: FADDq	dis not found

cpu_intr_1_227:
	setx	0x340003, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_251:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_251), 16, 16)) -> intp(1, 0, 37)
cpu_intr_1_228:
	setx	0x370239, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_135:
	mov	0x3c7, %r14
	.word 0xf6f384a0  ! 2973: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	lda	[%r21 + %g0] 0xf0, %f2
	.word 0xbfa84820  ! 2975: FMOVE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_229:
	setx	0x34033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_252:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_252), 16, 16)) -> intp(1, 0, 1)
	.word 0xb5a5c8e0  ! 2980: FSUBq	dis not found

iob_intr_1_253:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_253), 16, 16)) -> intp(1, 0, 29)
iob_intr_1_254:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_254), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb63dc000  ! 2988: XNOR_R	xnor 	%r23, %r0, %r27
iob_intr_1_255:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_255), 16, 16)) -> intp(1, 0, 39)
	.word 0xb5a80820  ! 2992: FMOVN	fmovs	%fcc1, %f0, %f26
cpu_intr_1_230:
	setx	0x350003, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_256:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_256), 16, 16)) -> intp(1, 0, 2d)
iob_intr_1_257:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_257), 16, 16)) -> intp(1, 0, 17)
cpu_intr_1_231:
	setx	0x34013a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_232:
	setx	0x340021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb20dc000  ! 3013: AND_R	and 	%r23, %r0, %r25
	.word 0xb5a00560  ! 3015: FSQRTq	fsqrt	
	.word 0xb9a4c9c0  ! 3018: FDIVd	fdivd	%f50, %f0, %f28
	.word 0xbbaa4820  ! 3022: FMOVNE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_233:
	setx	0x360010, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_234:
	setx	0x37003c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_235:
	setx	0x370118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00520  ! 3038: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbda448e0  ! 3040: FSUBq	dis not found

	.word 0xb1ab4820  ! 3043: FMOVCC	fmovs	%fcc1, %f0, %f24
cpu_intr_1_236:
	setx	0x350106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c960  ! 3046: FMULq	dis not found

cpu_intr_1_237:
	setx	0x36001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_133:
	mov	0xb, %r14
	.word 0xfadb8e60  ! 3049: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T1_asi_reg_rd_134:
	mov	0x4, %r14
	.word 0xf2db8e60  ! 3050: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb7a509a0  ! 3051: FDIVs	fdivs	%f20, %f0, %f27
cpu_intr_1_238:
	setx	0x350304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa58820  ! 3054: FADDs	fadds	%f22, %f0, %f31
cpu_intr_1_239:
	setx	0x340029, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_240:
	setx	0x360008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5ab4820  ! 3068: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xbb34a001  ! 3069: SRL_I	srl 	%r18, 0x0001, %r29
cpu_intr_1_241:
	setx	0x37033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_136:
	mov	0x26, %r14
	.word 0xfcf389e0  ! 3073: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_1_258:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_258), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb9a408e0  ! 3077: FSUBq	dis not found

T1_asi_reg_rd_135:
	mov	0x1d, %r14
	.word 0xfedb8e40  ! 3078: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_1_259:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_259), 16, 16)) -> intp(1, 0, 39)
	.word 0xbfa80820  ! 3081: FMOVN	fmovs	%fcc1, %f0, %f31
iob_intr_1_260:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_260), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_242:
	setx	0x35001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a50960  ! 3087: FMULq	dis not found

cpu_intr_1_243:
	setx	0x360135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfab0820  ! 3090: FMOVGU	fmovs	%fcc1, %f0, %f31
iob_intr_1_261:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_261), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_rd_136:
	mov	0x19, %r14
	.word 0xfcdb8e80  ! 3094: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb1a00540  ! 3097: FSQRTd	fsqrt	
	.word 0xb5a9c820  ! 3098: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xbfa5c9c0  ! 3102: FDIVd	fdivd	%f54, %f0, %f62
	.word 0xb3a589a0  ! 3104: FDIVs	fdivs	%f22, %f0, %f25
cpu_intr_1_244:
	setx	0x35001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb22461cf  ! 3107: SUB_I	sub 	%r17, 0x01cf, %r25
T1_asi_reg_rd_137:
	mov	0x29, %r14
	.word 0xfadb84a0  ! 3109: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T1_asi_reg_wr_137:
	mov	0x35, %r14
	.word 0xfcf38e40  ! 3113: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb1a00540  ! 3118: FSQRTd	fsqrt	
	.word 0xb1a94820  ! 3120: FMOVCS	fmovs	%fcc1, %f0, %f24
iob_intr_1_262:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_262), 16, 16)) -> intp(1, 0, 12)
iob_intr_1_263:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_263), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb7a9c820  ! 3128: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb3a549c0  ! 3133: FDIVd	fdivd	%f52, %f0, %f56
	.word 0xbfa00520  ! 3135: FSQRTs	fsqrt	
T1_asi_reg_rd_138:
	mov	0x2e, %r14
	.word 0xfadb8400  ! 3136: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb7ab8820  ! 3137: FMOVPOS	fmovs	%fcc1, %f0, %f27
iob_intr_1_264:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_264), 16, 16)) -> intp(1, 0, 33)
	.word 0xb4254000  ! 3140: SUB_R	sub 	%r21, %r0, %r26
	.word 0xb3a00560  ! 3145: FSQRTq	fsqrt	
cpu_intr_1_245:
	setx	0x340117, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_139:
	mov	0x3c2, %r14
	.word 0xf2db8e60  ! 3153: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T1_asi_reg_wr_138:
	mov	0x3, %r14
	.word 0xf8f389e0  ! 3155: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb1a44940  ! 3159: FMULd	fmuld	%f48, %f0, %f24
cpu_intr_1_246:
	setx	0x36000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6950000  ! 3162: ORcc_R	orcc 	%r20, %r0, %r27
iob_intr_1_265:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_265), 16, 16)) -> intp(1, 0, 3)
cpu_intr_1_247:
	setx	0x35013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd35a001  ! 3171: SRL_I	srl 	%r22, 0x0001, %r30
T1_asi_reg_rd_140:
	mov	0x1a, %r14
	.word 0xf0db8e80  ! 3172: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb7a84820  ! 3174: FMOVE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_248:
	setx	0x37001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda94820  ! 3178: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xbba589e0  ! 3179: FDIVq	dis not found

	.word 0xb3a84820  ! 3182: FMOVE	fmovs	%fcc1, %f0, %f25
iob_intr_1_266:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_266), 16, 16)) -> intp(1, 0, 2a)
iob_intr_1_267:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_267), 16, 16)) -> intp(1, 0, 27)
iob_intr_1_268:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_268), 16, 16)) -> intp(1, 0, 0)
	.word 0xb5a00540  ! 3187: FSQRTd	fsqrt	
	.word 0xb1a54920  ! 3191: FMULs	fmuls	%f21, %f0, %f24
	.word 0xb3a00560  ! 3193: FSQRTq	fsqrt	
	.word 0xb1a00020  ! 3197: FMOVs	fmovs	%f0, %f24
	.word 0xb9ab0820  ! 3201: FMOVGU	fmovs	%fcc1, %f0, %f28
iob_intr_1_269:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_269), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_249:
	setx	0x370331, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_250:
	setx	0x34001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b44000  ! 3208: SUBCcc_R	orncc 	%r17, %r0, %r24
	.word 0xb4b421fb  ! 3210: ORNcc_I	orncc 	%r16, 0x01fb, %r26
iob_intr_1_270:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_270), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_wr_139:
	mov	0x3c4, %r14
	.word 0xf6f38400  ! 3214: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_1_271:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_271), 16, 16)) -> intp(1, 0, 35)
T1_asi_reg_wr_140:
	mov	0x3c6, %r14
	.word 0xf8f389e0  ! 3217: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_1_251:
	setx	0x3b0106, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_272:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_272), 16, 16)) -> intp(1, 0, 8)
iob_intr_1_273:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_273), 16, 16)) -> intp(1, 0, 37)
	.word 0xbdab0820  ! 3227: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb5a5c840  ! 3228: FADDd	faddd	%f54, %f0, %f26
T1_asi_reg_wr_141:
	mov	0x1d, %r14
	.word 0xfef389e0  ! 3230: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_1_274:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_274), 16, 16)) -> intp(1, 0, e)
	.word 0xbfaa8820  ! 3233: FMOVG	fmovs	%fcc1, %f0, %f31
iob_intr_1_275:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_275), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_276:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_276), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_rd_141:
	mov	0x1a, %r14
	.word 0xf4db8400  ! 3239: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb1a5c8c0  ! 3241: FSUBd	fsubd	%f54, %f0, %f24
cpu_intr_1_252:
	setx	0x380330, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_253:
	setx	0x3b032c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_142:
	mov	0x3c6, %r14
	.word 0xf6f38e80  ! 3247: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_1_277:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_277), 16, 16)) -> intp(1, 0, 29)
cpu_intr_1_254:
	setx	0x3a0311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c920  ! 3255: FMULs	fmuls	%f19, %f0, %f31
	.word 0xb12d4000  ! 3256: SLL_R	sll 	%r21, %r0, %r24
	.word 0x9195a140  ! 3260: WRPR_PIL_I	wrpr	%r22, 0x0140, %pil
iob_intr_1_278:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_278), 16, 16)) -> intp(1, 0, 23)
	.word 0xbba00540  ! 3262: FSQRTd	fsqrt	
	.word 0xbfa58840  ! 3267: FADDd	faddd	%f22, %f0, %f62
T1_asi_reg_wr_143:
	mov	0x2a, %r14
	.word 0xf6f38e80  ! 3268: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb734c000  ! 3271: SRL_R	srl 	%r19, %r0, %r27
	.word 0xbfa54860  ! 3273: FADDq	dis not found

iob_intr_1_279:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_279), 16, 16)) -> intp(1, 0, f)
	.word 0xb9a9c820  ! 3278: FMOVVS	fmovs	%fcc1, %f0, %f28
cpu_intr_1_255:
	setx	0x3a0338, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_144:
	mov	0x27, %r14
	.word 0xf4f38e60  ! 3283: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_1_280:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_280), 16, 16)) -> intp(1, 0, 17)
	.word 0xbf357001  ! 3289: SRLX_I	srlx	%r21, 0x0001, %r31
T1_asi_reg_rd_142:
	mov	0x36, %r14
	.word 0xf8db89e0  ! 3290: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xbc448000  ! 3293: ADDC_R	addc 	%r18, %r0, %r30
	.word 0xbfa409a0  ! 3294: FDIVs	fdivs	%f16, %f0, %f31
iob_intr_1_281:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_281), 16, 16)) -> intp(1, 0, 2d)
cpu_intr_1_256:
	setx	0x390330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb495c000  ! 3301: ORcc_R	orcc 	%r23, %r0, %r26
	.word 0xb9a449a0  ! 3303: FDIVs	fdivs	%f17, %f0, %f28
T1_asi_reg_wr_145:
	mov	0x19, %r14
	.word 0xfef38e40  ! 3305: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb3a94820  ! 3307: FMOVCS	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_143:
	mov	0x3c2, %r14
	.word 0xfcdb89e0  ! 3312: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb5aac820  ! 3315: FMOVGE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_144:
	mov	0x27, %r14
	.word 0xf6db8e80  ! 3316: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T1_asi_reg_wr_146:
	mov	0x3c2, %r14
	.word 0xf4f384a0  ! 3319: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb33c4000  ! 3323: SRA_R	sra 	%r17, %r0, %r25
iob_intr_1_282:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_282), 16, 16)) -> intp(1, 0, 31)
	.word 0xbb2df001  ! 3328: SLLX_I	sllx	%r23, 0x0001, %r29
	.word 0xb3aa0820  ! 3333: FMOVA	fmovs	%fcc1, %f0, %f25
iob_intr_1_283:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_283), 16, 16)) -> intp(1, 0, 16)
	.word 0xb9aa0820  ! 3336: FMOVA	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_145:
	mov	0x34, %r14
	.word 0xf0db8400  ! 3338: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_1_257:
	setx	0x390018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a81c20  ! 3347: FMOVRGEZ	dis not found

iob_intr_1_284:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_284), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_285:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_285), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_rd_146:
	mov	0x3c2, %r14
	.word 0xf2db89e0  ! 3358: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T1_asi_reg_rd_147:
	mov	0x4, %r14
	.word 0xf8db8e60  ! 3360: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T1_asi_reg_rd_148:
	mov	0xb, %r14
	.word 0xf2db8e80  ! 3362: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb73ca001  ! 3364: SRA_I	sra 	%r18, 0x0001, %r27
iob_intr_1_286:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_286), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_258:
	setx	0x3b031a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_147:
	mov	0x32, %r14
	.word 0xf6f38e40  ! 3367: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbfa81c20  ! 3373: FMOVRGEZ	dis not found

T1_asi_reg_rd_149:
	mov	0x1e, %r14
	.word 0xfedb8e40  ! 3374: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbba00540  ! 3379: FSQRTd	fsqrt	
T1_asi_reg_rd_150:
	mov	0x3c5, %r14
	.word 0xf2db8e40  ! 3380: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_287:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_287), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_259:
	setx	0x3a021c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_151:
	mov	0x26, %r14
	.word 0xfedb8e60  ! 3389: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb7a489c0  ! 3393: FDIVd	fdivd	%f18, %f0, %f58
	.word 0xb8a54000  ! 3395: SUBcc_R	subcc 	%r21, %r0, %r28
cpu_intr_1_260:
	setx	0x3b0110, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_288:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_288), 16, 16)) -> intp(1, 0, 5)
cpu_intr_1_261:
	setx	0x3a021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a81820  ! 3402: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb3a00020  ! 3404: FMOVs	fmovs	%f0, %f25
T1_asi_reg_wr_148:
	mov	0x3c5, %r14
	.word 0xf8f384a0  ! 3405: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T1_asi_reg_wr_149:
	mov	0x2b, %r14
	.word 0xfcf38e40  ! 3407: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T1_asi_reg_rd_152:
	mov	0x1f, %r14
	.word 0xfadb8e40  ! 3408: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_wr_150:
	mov	0x3c7, %r14
	.word 0xfef384a0  ! 3409: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb9aa8820  ! 3411: FMOVG	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_153:
	mov	0xa, %r14
	.word 0xf4db8e60  ! 3412: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T1_asi_reg_wr_151:
	mov	0x9, %r14
	.word 0xf8f38400  ! 3413: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb7a58860  ! 3415: FADDq	dis not found

cpu_intr_1_262:
	setx	0x390009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda548e0  ! 3417: FSUBq	dis not found

	.word 0xbba5c9c0  ! 3418: FDIVd	fdivd	%f54, %f0, %f60
cpu_intr_1_263:
	setx	0x3b002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a80420  ! 3424: FMOVRZ	dis not found

	.word 0xb3a589e0  ! 3428: FDIVq	dis not found

iob_intr_1_289:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_289), 16, 16)) -> intp(1, 0, 3a)
cpu_intr_1_264:
	setx	0x380338, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_154:
	mov	0x3, %r14
	.word 0xfadb8400  ! 3435: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_1_265:
	setx	0x3a0338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00540  ! 3443: FSQRTd	fsqrt	
iob_intr_1_290:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_290), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb9a54840  ! 3447: FADDd	faddd	%f52, %f0, %f28
	.word 0xbfa8c820  ! 3448: FMOVL	fmovs	%fcc1, %f0, %f31
iob_intr_1_291:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_291), 16, 16)) -> intp(1, 0, 21)
cpu_intr_1_266:
	setx	0x390315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aa0820  ! 3452: FMOVA	fmovs	%fcc1, %f0, %f27
cpu_intr_1_267:
	setx	0x3b0218, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_268:
	setx	0x390039, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_152:
	mov	0x3c5, %r14
	.word 0xfef38e40  ! 3455: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_292:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_292), 16, 16)) -> intp(1, 0, 15)
iob_intr_1_293:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_293), 16, 16)) -> intp(1, 0, 23)
cpu_intr_1_269:
	setx	0x38032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aa4820  ! 3465: FMOVNE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_155:
	mov	0x3c3, %r14
	.word 0xf0db8400  ! 3467: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_1_294:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_294), 16, 16)) -> intp(1, 0, c)
	.word 0xb1a80820  ! 3473: FMOVN	fmovs	%fcc1, %f0, %f24
iob_intr_1_295:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_295), 16, 16)) -> intp(1, 0, 33)
iob_intr_1_296:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_296), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_wr_153:
	mov	0x1b, %r14
	.word 0xf4f38e40  ! 3484: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbba48840  ! 3485: FADDd	faddd	%f18, %f0, %f60
	.word 0xbda58840  ! 3486: FADDd	faddd	%f22, %f0, %f30
	.word 0xb5aa0820  ! 3489: FMOVA	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_156:
	mov	0x2a, %r14
	.word 0xf0db8e40  ! 3492: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbfa4c8e0  ! 3496: FSUBq	dis not found

	lda	[%r16 + %g0] 0xf0, %f2
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb034e01b  ! 3503: SUBC_I	orn 	%r19, 0x001b, %r24
	.word 0xbda48920  ! 3505: FMULs	fmuls	%f18, %f0, %f30
T1_asi_reg_rd_157:
	mov	0x36, %r14
	.word 0xf6db8e40  ! 3506: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_270:
	setx	0x3a032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb03d0000  ! 3509: XNOR_R	xnor 	%r20, %r0, %r24
	.word 0xbda80820  ! 3512: FMOVN	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_297:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_297), 16, 16)) -> intp(1, 0, c)
iob_intr_1_298:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_298), 16, 16)) -> intp(1, 0, 30)
	.word 0xb5a40860  ! 3519: FADDq	dis not found

	.word 0xb9a81820  ! 3520: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb4850000  ! 3523: ADDcc_R	addcc 	%r20, %r0, %r26
	.word 0xbfa88820  ! 3525: FMOVLE	fmovs	%fcc1, %f0, %f31
iob_intr_1_299:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_299), 16, 16)) -> intp(1, 0, f)
cpu_intr_1_271:
	setx	0x390036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00040  ! 3532: FMOVd	fmovd	%f0, %f58
iob_intr_1_300:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_300), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb7a00520  ! 3542: FSQRTs	fsqrt	
	.word 0xbda50840  ! 3543: FADDd	faddd	%f20, %f0, %f30
	.word 0xbfa81c20  ! 3546: FMOVRGEZ	dis not found

	.word 0xb3a54960  ! 3547: FMULq	dis not found

	.word 0xbba00520  ! 3548: FSQRTs	fsqrt	
	.word 0xbbaa4820  ! 3549: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb7a4c920  ! 3550: FMULs	fmuls	%f19, %f0, %f27
T1_asi_reg_rd_158:
	mov	0x23, %r14
	.word 0xf0db84a0  ! 3551: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbba80820  ! 3553: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb7a8c820  ! 3554: FMOVL	fmovs	%fcc1, %f0, %f27
iob_intr_1_301:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_301), 16, 16)) -> intp(1, 0, b)
	.word 0xb7a80820  ! 3556: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xbd356001  ! 3557: SRL_I	srl 	%r21, 0x0001, %r30
cpu_intr_1_272:
	setx	0x38002b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_273:
	setx	0x3a0038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80820  ! 3568: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xbba54820  ! 3570: FADDs	fadds	%f21, %f0, %f29
iob_intr_1_302:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_302), 16, 16)) -> intp(1, 0, 19)
	.word 0xbfa00560  ! 3580: FSQRTq	fsqrt	
iob_intr_1_303:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_303), 16, 16)) -> intp(1, 0, 1d)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_154:
	mov	0x32, %r14
	.word 0xfcf38e80  ! 3587: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_1_274:
	setx	0x38013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80c20  ! 3589: FMOVRLZ	dis not found

iob_intr_1_304:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_304), 16, 16)) -> intp(1, 0, 25)
	.word 0xb6a5e135  ! 3591: SUBcc_I	subcc 	%r23, 0x0135, %r27
	.word 0xbfa00560  ! 3592: FSQRTq	fsqrt	
	.word 0xb9a44940  ! 3593: FMULd	fmuld	%f48, %f0, %f28
iob_intr_1_305:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_305), 16, 16)) -> intp(1, 0, 21)
cpu_intr_1_275:
	setx	0x3b0022, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_306:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_306), 16, 16)) -> intp(1, 0, 33)
	.word 0xb3a58960  ! 3603: FMULq	dis not found

iob_intr_1_307:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_307), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_276:
	setx	0x390322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeb5c000  ! 3608: SUBCcc_R	orncc 	%r23, %r0, %r31
	.word 0xb5aac820  ! 3611: FMOVGE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_159:
	mov	0x2d, %r14
	.word 0xf2db84a0  ! 3612: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_1_277:
	setx	0x390031, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_308:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_308), 16, 16)) -> intp(1, 0, 5)
cpu_intr_1_278:
	setx	0x38021f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_279:
	setx	0x3a023c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_309:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_309), 16, 16)) -> intp(1, 0, 19)
	.word 0xb1a40840  ! 3621: FADDd	faddd	%f16, %f0, %f24
	.word 0xba1d8000  ! 3622: XOR_R	xor 	%r22, %r0, %r29
	.word 0xb01521b3  ! 3625: OR_I	or 	%r20, 0x01b3, %r24
cpu_intr_1_280:
	setx	0x3a0110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6358000  ! 3628: ORN_R	orn 	%r22, %r0, %r27
	.word 0xb32c0000  ! 3629: SLL_R	sll 	%r16, %r0, %r25
iob_intr_1_310:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_310), 16, 16)) -> intp(1, 0, a)
iob_intr_1_311:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_311), 16, 16)) -> intp(1, 0, 1b)
T1_asi_reg_rd_160:
	mov	0x3c8, %r14
	.word 0xfcdb8e40  ! 3634: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_281:
	setx	0x3a0319, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_312:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_312), 16, 16)) -> intp(1, 0, 35)
cpu_intr_1_282:
	setx	0x3a0018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb405614c  ! 3639: ADD_I	add 	%r21, 0x014c, %r26
cpu_intr_1_283:
	setx	0x390116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda84820  ! 3643: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xb3a408e0  ! 3644: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a00520  ! 3647: FSQRTs	fsqrt	
cpu_intr_1_284:
	setx	0x39001b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_313:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_313), 16, 16)) -> intp(1, 0, 1e)
T1_asi_reg_rd_161:
	mov	0x1a, %r14
	.word 0xf8db8e40  ! 3650: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb77c8400  ! 3651: MOVR_R	movre	%r18, %r0, %r27
	.word 0xb9a00560  ! 3653: FSQRTq	fsqrt	
cpu_intr_1_285:
	setx	0x39023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81420  ! 3656: FMOVRNZ	dis not found

iob_intr_1_314:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_314), 16, 16)) -> intp(1, 0, 26)
cpu_intr_1_286:
	setx	0x380134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a9c820  ! 3661: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xbcb56064  ! 3663: SUBCcc_I	orncc 	%r21, 0x0064, %r30
T1_asi_reg_wr_155:
	mov	0x22, %r14
	.word 0xf4f38e40  ! 3664: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb3a80420  ! 3666: FMOVRZ	dis not found

T1_asi_reg_rd_162:
	mov	0x29, %r14
	.word 0xf6db8e40  ! 3671: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb1a4c920  ! 3675: FMULs	fmuls	%f19, %f0, %f24
T1_asi_reg_rd_163:
	mov	0x3c8, %r14
	.word 0xf0db89e0  ! 3677: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T1_asi_reg_wr_156:
	mov	0x28, %r14
	.word 0xf6f38e60  ! 3680: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T1_asi_reg_wr_157:
	mov	0x3c5, %r14
	.word 0xf8f38e40  ! 3686: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_1_315:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_315), 16, 16)) -> intp(1, 0, 36)
T1_asi_reg_wr_158:
	mov	0xf, %r14
	.word 0xfcf389e0  ! 3690: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb3aac820  ! 3692: FMOVGE	fmovs	%fcc1, %f0, %f25
iob_intr_1_316:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_316), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb1a98820  ! 3694: FMOVNEG	fmovs	%fcc1, %f0, %f24
cpu_intr_1_287:
	setx	0x3d0122, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_159:
	mov	0x36, %r14
	.word 0xfcf38e40  ! 3699: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb5a48960  ! 3702: FMULq	dis not found

cpu_intr_1_288:
	setx	0x3f0230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe34a0b7  ! 3706: SUBC_I	orn 	%r18, 0x00b7, %r31
cpu_intr_1_289:
	setx	0x3d033c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_290:
	setx	0x3d0318, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_160:
	mov	0x23, %r14
	.word 0xf8f38e40  ! 3711: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbda00560  ! 3712: FSQRTq	fsqrt	
	.word 0xbfa44940  ! 3716: FMULd	fmuld	%f48, %f0, %f62
cpu_intr_1_291:
	setx	0x3d013f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_292:
	setx	0x3e033a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_317:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_317), 16, 16)) -> intp(1, 0, 32)
	.word 0xb5a9c820  ! 3726: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb3a80820  ! 3727: FMOVN	fmovs	%fcc1, %f0, %f25
iob_intr_1_318:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_318), 16, 16)) -> intp(1, 0, 14)
	.word 0xbe2dc000  ! 3730: ANDN_R	andn 	%r23, %r0, %r31
iob_intr_1_319:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_319), 16, 16)) -> intp(1, 0, 15)
	.word 0xbdaa0820  ! 3738: FMOVA	fmovs	%fcc1, %f0, %f30
cpu_intr_1_293:
	setx	0x3d0130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa509e0  ! 3745: FDIVq	dis not found

	.word 0xb1a80820  ! 3746: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
cpu_intr_1_294:
	setx	0x3f0033, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_320:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_320), 16, 16)) -> intp(1, 0, a)
T1_asi_reg_wr_161:
	mov	0x3c3, %r14
	.word 0xf0f38e80  ! 3750: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_1_321:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_321), 16, 16)) -> intp(1, 0, 2e)
	.word 0x89946060  ! 3752: WRPR_TICK_I	wrpr	%r17, 0x0060, %tick
T1_asi_reg_wr_162:
	mov	0x17, %r14
	.word 0xfef384a0  ! 3753: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xbc352172  ! 3755: SUBC_I	orn 	%r20, 0x0172, %r30
T1_asi_reg_rd_164:
	mov	0x3c1, %r14
	.word 0xfedb89e0  ! 3756: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb9a00520  ! 3757: FSQRTs	fsqrt	
iob_intr_1_322:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_322), 16, 16)) -> intp(1, 0, 34)
	.word 0xb5a81c20  ! 3765: FMOVRGEZ	dis not found

cpu_intr_1_295:
	setx	0x3e0206, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_163:
	mov	0x3, %r14
	.word 0xfef38e40  ! 3768: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_1_296:
	setx	0x3d0029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a508e0  ! 3775: FSUBq	dis not found

T1_asi_reg_wr_164:
	mov	0x16, %r14
	.word 0xf4f38400  ! 3778: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T1_asi_reg_rd_165:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 3782: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_rd_166:
	mov	0x1e, %r14
	.word 0xfadb8e80  ! 3785: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_1_323:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_323), 16, 16)) -> intp(1, 0, 36)
cpu_intr_1_297:
	setx	0x3c021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a508e0  ! 3789: FSUBq	dis not found

T1_asi_reg_rd_167:
	mov	0x3c1, %r14
	.word 0xf2db8e40  ! 3790: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_324:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_324), 16, 16)) -> intp(1, 0, 3b)
cpu_intr_1_298:
	setx	0x3f000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_168:
	mov	0x32, %r14
	.word 0xfedb8e40  ! 3797: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbda4c8e0  ! 3799: FSUBq	dis not found

iob_intr_1_325:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_325), 16, 16)) -> intp(1, 0, 10)
T1_asi_reg_wr_165:
	mov	0xb, %r14
	.word 0xf4f384a0  ! 3804: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb5a549a0  ! 3806: FDIVs	fdivs	%f21, %f0, %f26
T1_asi_reg_rd_169:
	mov	0x33, %r14
	.word 0xf8db8e80  ! 3812: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_1_299:
	setx	0x3f0100, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_166:
	mov	0x1a, %r14
	.word 0xfef384a0  ! 3814: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_1_300:
	setx	0x3e0217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a8c820  ! 3820: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xbfab0820  ! 3821: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb3a549c0  ! 3822: FDIVd	fdivd	%f52, %f0, %f56
T1_asi_reg_wr_167:
	mov	0x3c7, %r14
	.word 0xf4f38e60  ! 3826: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_1_326:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_326), 16, 16)) -> intp(1, 0, 36)
	.word 0xbda88820  ! 3830: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb5a5c940  ! 3832: FMULd	fmuld	%f54, %f0, %f26
iob_intr_1_327:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_327), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb1a4c9c0  ! 3840: FDIVd	fdivd	%f50, %f0, %f24
	.word 0xb834c000  ! 3842: ORN_R	orn 	%r19, %r0, %r28
	.word 0xbec4603a  ! 3843: ADDCcc_I	addccc 	%r17, 0x003a, %r31
	.word 0xb7a54840  ! 3844: FADDd	faddd	%f52, %f0, %f58
T1_asi_reg_rd_170:
	mov	0x28, %r14
	.word 0xf8db8400  ! 3847: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T1_asi_reg_wr_168:
	mov	0x26, %r14
	.word 0xf4f38e40  ! 3849: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xb3a48940  ! 3852: FMULd	fmuld	%f18, %f0, %f56
	.word 0xbfa4c9e0  ! 3853: FDIVq	dis not found

cpu_intr_1_301:
	setx	0x3d013c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_328:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_328), 16, 16)) -> intp(1, 0, 20)
	.word 0xbbaa0820  ! 3860: FMOVA	fmovs	%fcc1, %f0, %f29
iob_intr_1_329:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_329), 16, 16)) -> intp(1, 0, d)
	.word 0xb3a448c0  ! 3863: FSUBd	fsubd	%f48, %f0, %f56
iob_intr_1_330:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_330), 16, 16)) -> intp(1, 0, 24)
iob_intr_1_331:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_331), 16, 16)) -> intp(1, 0, 35)
iob_intr_1_332:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_332), 16, 16)) -> intp(1, 0, 38)
	.word 0xb9a54860  ! 3875: FADDq	dis not found

	.word 0xb7a88820  ! 3880: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb5a80820  ! 3881: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_169:
	mov	0x24, %r14
	.word 0xf8f38e60  ! 3883: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb5a549e0  ! 3884: FDIVq	dis not found

T1_asi_reg_wr_170:
	mov	0x28, %r14
	.word 0xf0f38e40  ! 3887: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_wr_171:
	mov	0x1c, %r14
	.word 0xf4f384a0  ! 3888: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_1_333:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_333), 16, 16)) -> intp(1, 0, 3)
cpu_intr_1_302:
	setx	0x3c000a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_334:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_334), 16, 16)) -> intp(1, 0, 2d)
	.word 0xbfa00520  ! 3892: FSQRTs	fsqrt	
iob_intr_1_335:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_335), 16, 16)) -> intp(1, 0, b)
	.word 0xb1358000  ! 3894: SRL_R	srl 	%r22, %r0, %r24
	.word 0xb9ab8820  ! 3895: FMOVPOS	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_171:
	mov	0x3c3, %r14
	.word 0xf0db8e80  ! 3896: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbfa5c9e0  ! 3897: FDIVq	dis not found

iob_intr_1_336:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_336), 16, 16)) -> intp(1, 0, 8)
	.word 0xb9a00560  ! 3899: FSQRTq	fsqrt	
	.word 0xbda81820  ! 3903: FMOVRGZ	fmovs	%fcc3, %f0, %f30
T1_asi_reg_wr_172:
	mov	0xc, %r14
	.word 0xfaf384a0  ! 3904: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb7a40840  ! 3908: FADDd	faddd	%f16, %f0, %f58
	.word 0xbfa44920  ! 3909: FMULs	fmuls	%f17, %f0, %f31
	.word 0xb7a00560  ! 3912: FSQRTq	fsqrt	
	.word 0xb9a00520  ! 3913: FSQRTs	fsqrt	
T1_asi_reg_wr_173:
	mov	0xd, %r14
	.word 0xf2f38e60  ! 3915: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_1_337:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_337), 16, 16)) -> intp(1, 0, 31)
	.word 0xb6146061  ! 3921: OR_I	or 	%r17, 0x0061, %r27
	.word 0xb33c7001  ! 3922: SRAX_I	srax	%r17, 0x0001, %r25
	.word 0xbf3c3001  ! 3925: SRAX_I	srax	%r16, 0x0001, %r31
T1_asi_reg_wr_174:
	mov	0x8, %r14
	.word 0xfef38e80  ! 3927: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_1_303:
	setx	0x3f0115, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_175:
	mov	0x17, %r14
	.word 0xf2f389e0  ! 3933: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbba81820  ! 3935: FMOVRGZ	fmovs	%fcc3, %f0, %f29
T1_asi_reg_wr_176:
	mov	0x3c4, %r14
	.word 0xf8f384a0  ! 3937: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_1_304:
	setx	0x3c0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a48940  ! 3939: FMULd	fmuld	%f18, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbba4c820  ! 3944: FADDs	fadds	%f19, %f0, %f29
iob_intr_1_338:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_338), 16, 16)) -> intp(1, 0, 38)
iob_intr_1_339:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_339), 16, 16)) -> intp(1, 0, 36)
cpu_intr_1_305:
	setx	0x3f001f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_340:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_340), 16, 16)) -> intp(1, 0, 3c)
	.word 0xbc440000  ! 3956: ADDC_R	addc 	%r16, %r0, %r30
cpu_intr_1_306:
	setx	0x3e033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb844e112  ! 3960: ADDC_I	addc 	%r19, 0x0112, %r28
	.word 0xbfa589c0  ! 3963: FDIVd	fdivd	%f22, %f0, %f62
iob_intr_1_341:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_341), 16, 16)) -> intp(1, 0, a)
iob_intr_1_342:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_342), 16, 16)) -> intp(1, 0, 23)
T1_asi_reg_rd_172:
	mov	0x3c3, %r14
	.word 0xf8db8e40  ! 3967: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb9aa0820  ! 3969: FMOVA	fmovs	%fcc1, %f0, %f28
iob_intr_1_343:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_343), 16, 16)) -> intp(1, 0, 9)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9a00520  ! 3974: FSQRTs	fsqrt	
	.word 0xb5a48920  ! 3975: FMULs	fmuls	%f18, %f0, %f26
	.word 0xb5a40860  ! 3976: FADDq	dis not found

	.word 0xb9a509e0  ! 3979: FDIVq	dis not found

	lda	[%r16 + %g0] 0xf0, %f2
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_344:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_344), 16, 16)) -> intp(1, 0, 17)
	.word 0xb9a54840  ! 3990: FADDd	faddd	%f52, %f0, %f28
T1_asi_reg_rd_173:
	mov	0x3c2, %r14
	.word 0xf8db8e40  ! 3991: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_1_307:
	setx	0x3f0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa44920  ! 3999: FMULs	fmuls	%f17, %f0, %f31
T1_asi_reg_rd_174:
	mov	0x3c5, %r14
	.word 0xf0db8e40  ! 4000: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_wr_177:
	mov	0xa, %r14
	.word 0xf4f38e40  ! 4001: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbda00560  ! 4002: FSQRTq	fsqrt	
cpu_intr_1_308:
	setx	0x3d013d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_178:
	mov	0x6, %r14
	.word 0xfef38400  ! 4005: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T1_asi_reg_rd_175:
	mov	0x2e, %r14
	.word 0xfcdb8e60  ! 4006: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_1_345:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_345), 16, 16)) -> intp(1, 0, 3a)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda40860  ! 4013: FADDq	dis not found

	.word 0xbba98820  ! 4015: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xbfa40960  ! 4020: FMULq	dis not found

T1_asi_reg_wr_179:
	mov	0xa, %r14
	.word 0xf0f38e40  ! 4021: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_rd_176:
	mov	0x8, %r14
	.word 0xfadb8400  ! 4022: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb1ab8820  ! 4024: FMOVPOS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_177:
	mov	0x17, %r14
	.word 0xfedb8400  ! 4026: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T1_asi_reg_wr_180:
	mov	0x3c2, %r14
	.word 0xf4f38e40  ! 4028: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb934b001  ! 4029: SRLX_I	srlx	%r18, 0x0001, %r28
	.word 0xb9a00040  ! 4030: FMOVd	fmovd	%f0, %f28
	.word 0xbfa9c820  ! 4032: FMOVVS	fmovs	%fcc1, %f0, %f31
	lda	[%r16 + %g0] 0xf0, %f2
T1_asi_reg_wr_181:
	mov	0x0, %r14
	.word 0xf4f38400  ! 4038: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbba40960  ! 4041: FMULq	dis not found

	.word 0xb12d1000  ! 4042: SLLX_R	sllx	%r20, %r0, %r24
T1_asi_reg_rd_178:
	mov	0x1, %r14
	.word 0xf0db84a0  ! 4044: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T1_asi_reg_rd_179:
	mov	0x21, %r14
	.word 0xf6db8e60  ! 4045: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb7a98820  ! 4047: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb1aac820  ! 4049: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xbba90820  ! 4050: FMOVLEU	fmovs	%fcc1, %f0, %f29
cpu_intr_1_309:
	setx	0x3e0211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1ab0820  ! 4059: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb5a80c20  ! 4065: FMOVRLZ	dis not found

iob_intr_1_346:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_346), 16, 16)) -> intp(1, 0, 16)
	.word 0xb7a449c0  ! 4071: FDIVd	fdivd	%f48, %f0, %f58
iob_intr_1_347:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_347), 16, 16)) -> intp(1, 0, 24)
	.word 0x8194a16f  ! 4073: WRPR_TPC_I	wrpr	%r18, 0x016f, %tpc
	.word 0xbaad21dd  ! 4075: ANDNcc_I	andncc 	%r20, 0x01dd, %r29
iob_intr_1_348:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_348), 16, 16)) -> intp(1, 0, 5)
cpu_intr_1_310:
	setx	0x3f031b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_349:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_349), 16, 16)) -> intp(1, 0, 18)
	.word 0xba058000  ! 4082: ADD_R	add 	%r22, %r0, %r29
cpu_intr_1_311:
	setx	0x3d0008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a98820  ! 4088: FMOVNEG	fmovs	%fcc1, %f0, %f25
cpu_intr_1_312:
	setx	0x3e0233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_313:
	setx	0x3d031a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_180:
	mov	0x3c7, %r14
	.word 0xfedb84a0  ! 4097: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb1a94820  ! 4098: FMOVCS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_181:
	mov	0x0, %r14
	.word 0xf6db84a0  ! 4100: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbda589e0  ! 4102: FDIVq	dis not found

	.word 0xb3a449a0  ! 4103: FDIVs	fdivs	%f17, %f0, %f25
T1_asi_reg_wr_182:
	mov	0x3c1, %r14
	.word 0xf2f389e0  ! 4104: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbda00020  ! 4107: FMOVs	fmovs	%f0, %f30
cpu_intr_1_314:
	setx	0x3e0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a88820  ! 4112: FMOVLE	fmovs	%fcc1, %f0, %f24
iob_intr_1_350:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_350), 16, 16)) -> intp(1, 0, 35)
	.word 0xbfa00520  ! 4117: FSQRTs	fsqrt	
	.word 0xb3aa4820  ! 4119: FMOVNE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_183:
	mov	0x2b, %r14
	.word 0xfaf384a0  ! 4120: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T1_asi_reg_rd_182:
	mov	0x3c7, %r14
	.word 0xfedb8e60  ! 4121: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xbba81420  ! 4122: FMOVRNZ	dis not found

T1_asi_reg_rd_183:
	mov	0x3c7, %r14
	.word 0xf8db8400  ! 4124: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_1_315:
	setx	0x420227, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_184:
	mov	0x8, %r14
	.word 0xf6f389e0  ! 4127: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb5a58860  ! 4128: FADDq	dis not found

	.word 0xb3a84820  ! 4129: FMOVE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_184:
	mov	0x3c0, %r14
	.word 0xf2db89e0  ! 4131: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb6356151  ! 4133: SUBC_I	orn 	%r21, 0x0151, %r27
	.word 0xb4b54000  ! 4134: ORNcc_R	orncc 	%r21, %r0, %r26
cpu_intr_1_316:
	setx	0x40010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda81420  ! 4146: FMOVRNZ	dis not found

	.word 0xbbabc820  ! 4148: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb6b48000  ! 4149: ORNcc_R	orncc 	%r18, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a84820  ! 4155: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb1a80820  ! 4156: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb9a00540  ! 4158: FSQRTd	fsqrt	
cpu_intr_1_317:
	setx	0x430107, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_318:
	setx	0x400305, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_351:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_351), 16, 16)) -> intp(1, 0, 10)
T1_asi_reg_rd_185:
	mov	0x24, %r14
	.word 0xfedb8e80  ! 4166: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T1_asi_reg_wr_185:
	mov	0x29, %r14
	.word 0xf4f38e80  ! 4167: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb1a80820  ! 4175: FMOVN	fmovs	%fcc1, %f0, %f24
cpu_intr_1_319:
	setx	0x430001, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_186:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 4181: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb9a4c860  ! 4182: FADDq	dis not found

T1_asi_reg_wr_187:
	mov	0x6, %r14
	.word 0xf4f38e60  ! 4184: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xbfa00540  ! 4185: FSQRTd	fsqrt	
	.word 0xb1aa8820  ! 4186: FMOVG	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_188:
	mov	0x30, %r14
	.word 0xf8f38e40  ! 4188: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb9a00520  ! 4190: FSQRTs	fsqrt	
T1_asi_reg_wr_189:
	mov	0x34, %r14
	.word 0xfef38e80  ! 4192: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_1_352:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_352), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb1a448e0  ! 4196: FSUBq	dis not found

	.word 0xb3a44940  ! 4198: FMULd	fmuld	%f48, %f0, %f56
	.word 0xbfa88820  ! 4201: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb61ca08d  ! 4202: XOR_I	xor 	%r18, 0x008d, %r27
	.word 0xb9a94820  ! 4203: FMOVCS	fmovs	%fcc1, %f0, %f28
cpu_intr_1_320:
	setx	0x41013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_190:
	mov	0x24, %r14
	.word 0xf0f38400  ! 4209: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_1_353:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_353), 16, 16)) -> intp(1, 0, 1a)
	.word 0xbc3dc000  ! 4211: XNOR_R	xnor 	%r23, %r0, %r30
	.word 0xb334c000  ! 4213: SRL_R	srl 	%r19, %r0, %r25
cpu_intr_1_321:
	setx	0x43022d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_191:
	mov	0x13, %r14
	.word 0xfef384a0  ! 4219: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb1a44920  ! 4220: FMULs	fmuls	%f17, %f0, %f24
T1_asi_reg_rd_186:
	mov	0x2, %r14
	.word 0xf4db8e60  ! 4221: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_1_354:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_354), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb1a8c820  ! 4227: FMOVL	fmovs	%fcc1, %f0, %f24
iob_intr_1_355:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_355), 16, 16)) -> intp(1, 0, 3c)
cpu_intr_1_322:
	setx	0x43021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_323:
	setx	0x410122, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_356:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_356), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_rd_187:
	mov	0x3c6, %r14
	.word 0xf0db89e0  ! 4236: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb1aac820  ! 4237: FMOVGE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_188:
	mov	0x18, %r14
	.word 0xfcdb89e0  ! 4248: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb1a549e0  ! 4249: FDIVq	dis not found

iob_intr_1_357:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_357), 16, 16)) -> intp(1, 0, 34)
	.word 0xb7345000  ! 4256: SRLX_R	srlx	%r17, %r0, %r27
cpu_intr_1_324:
	setx	0x43010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda4c920  ! 4263: FMULs	fmuls	%f19, %f0, %f30
iob_intr_1_358:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_358), 16, 16)) -> intp(1, 0, 35)
T1_asi_reg_wr_192:
	mov	0x3c3, %r14
	.word 0xfaf38e40  ! 4266: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_1_359:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_359), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb1abc820  ! 4269: FMOVVC	fmovs	%fcc1, %f0, %f24
cpu_intr_1_325:
	setx	0x420113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb77d0400  ! 4274: MOVR_R	movre	%r20, %r0, %r27
T1_asi_reg_rd_189:
	mov	0x18, %r14
	.word 0xfcdb8e80  ! 4276: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_1_326:
	setx	0x430213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1643801  ! 4279: MOVcc_I	<illegal instruction>
cpu_intr_1_327:
	setx	0x410124, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_328:
	setx	0x43013f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_360:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_360), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb5a488a0  ! 4290: FSUBs	fsubs	%f18, %f0, %f26
	.word 0xb3a4c840  ! 4291: FADDd	faddd	%f50, %f0, %f56
	.word 0xb9a58860  ! 4293: FADDq	dis not found

	.word 0xb52da001  ! 4295: SLL_I	sll 	%r22, 0x0001, %r26
cpu_intr_1_329:
	setx	0x420201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80420  ! 4299: FMOVRZ	dis not found

iob_intr_1_361:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_361), 16, 16)) -> intp(1, 0, 33)
T1_asi_reg_rd_190:
	mov	0x3, %r14
	.word 0xf6db8400  ! 4304: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb1a84820  ! 4305: FMOVE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_191:
	mov	0x33, %r14
	.word 0xfadb8e80  ! 4307: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb3aac820  ! 4308: FMOVGE	fmovs	%fcc1, %f0, %f25
iob_intr_1_362:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_362), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb3a00560  ! 4315: FSQRTq	fsqrt	
iob_intr_1_363:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_363), 16, 16)) -> intp(1, 0, 13)
	.word 0xba04e0d9  ! 4318: ADD_I	add 	%r19, 0x00d9, %r29
T1_asi_reg_wr_193:
	mov	0x3c8, %r14
	.word 0xfcf38e80  ! 4319: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T1_asi_reg_wr_194:
	mov	0x5, %r14
	.word 0xf4f38400  ! 4324: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbba98820  ! 4326: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xb09c8000  ! 4327: XORcc_R	xorcc 	%r18, %r0, %r24
	.word 0xb1a80820  ! 4330: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
iob_intr_1_364:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_364), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_wr_195:
	mov	0x10, %r14
	.word 0xf2f38400  ! 4332: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_1_330:
	setx	0x42031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 4335: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xbba4c8c0  ! 4337: FSUBd	fsubd	%f50, %f0, %f60
cpu_intr_1_331:
	setx	0x410303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80820  ! 4343: FMOVN	fmovs	%fcc1, %f0, %f24
cpu_intr_1_332:
	setx	0x42020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0358000  ! 4345: ORN_R	orn 	%r22, %r0, %r24
cpu_intr_1_333:
	setx	0x400313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba3461e3  ! 4350: SUBC_I	orn 	%r17, 0x01e3, %r29
	.word 0xb5a589e0  ! 4353: FDIVq	dis not found

	.word 0xb1a00020  ! 4356: FMOVs	fmovs	%f0, %f24
	.word 0xbfa508a0  ! 4357: FSUBs	fsubs	%f20, %f0, %f31
iob_intr_1_365:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_365), 16, 16)) -> intp(1, 0, 8)
cpu_intr_1_334:
	setx	0x400208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb351c000  ! 4360: RDPR_TL	<illegal instruction>
cpu_intr_1_335:
	setx	0x40030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_196:
	mov	0x13, %r14
	.word 0xfef389e0  ! 4365: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_rd_192:
	mov	0x19, %r14
	.word 0xfedb8e40  ! 4366: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_1_366:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_366), 16, 16)) -> intp(1, 0, 37)
cpu_intr_1_336:
	setx	0x42002b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_337:
	setx	0x400105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c920  ! 4375: FMULs	fmuls	%f19, %f0, %f31
iob_intr_1_367:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_367), 16, 16)) -> intp(1, 0, 14)
	.word 0xb9a508e0  ! 4378: FSUBq	dis not found

T1_asi_reg_rd_193:
	mov	0x27, %r14
	.word 0xf6db89e0  ! 4381: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xbba00560  ! 4383: FSQRTq	fsqrt	
	.word 0xb9354000  ! 4384: SRL_R	srl 	%r21, %r0, %r28
	.word 0xb494e1af  ! 4386: ORcc_I	orcc 	%r19, 0x01af, %r26
cpu_intr_1_338:
	setx	0x410202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1abc820  ! 4394: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb3a548e0  ! 4395: FSUBq	dis not found

	.word 0xbe8520fc  ! 4397: ADDcc_I	addcc 	%r20, 0x00fc, %r31
cpu_intr_1_339:
	setx	0x400000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8358000  ! 4401: ORN_R	orn 	%r22, %r0, %r28
	.word 0xb83d21ca  ! 4404: XNOR_I	xnor 	%r20, 0x01ca, %r28
iob_intr_1_368:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_368), 16, 16)) -> intp(1, 0, 16)
iob_intr_1_369:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_369), 16, 16)) -> intp(1, 0, 38)
T1_asi_reg_wr_197:
	mov	0x2c, %r14
	.word 0xf4f38e40  ! 4411: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xba848000  ! 4412: ADDcc_R	addcc 	%r18, %r0, %r29
T1_asi_reg_rd_194:
	mov	0x3, %r14
	.word 0xf2db84a0  ! 4413: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_1_340:
	setx	0x400100, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_341:
	setx	0x40002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab4820  ! 4424: FMOVCC	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_195:
	mov	0x0, %r14
	.word 0xfcdb8400  ! 4426: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_1_342:
	setx	0x410034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe95e0ef  ! 4428: ORcc_I	orcc 	%r23, 0x00ef, %r31
iob_intr_1_370:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_370), 16, 16)) -> intp(1, 0, 39)
cpu_intr_1_343:
	setx	0x41013b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_344:
	setx	0x420209, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_198:
	mov	0x28, %r14
	.word 0xf0f38e40  ! 4433: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_wr_199:
	mov	0x20, %r14
	.word 0xfef38e40  ! 4435: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_1_345:
	setx	0x43023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a488e0  ! 4437: FSUBq	dis not found

iob_intr_1_371:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_371), 16, 16)) -> intp(1, 0, 29)
	.word 0xbda448a0  ! 4444: FSUBs	fsubs	%f17, %f0, %f30
	.word 0xbda81420  ! 4448: FMOVRNZ	dis not found

cpu_intr_1_346:
	setx	0x400320, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_196:
	mov	0x1b, %r14
	.word 0xf8db8e40  ! 4451: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_1_347:
	setx	0x430208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a588e0  ! 4453: FSUBq	dis not found

iob_intr_1_372:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_372), 16, 16)) -> intp(1, 0, 20)
T1_asi_reg_rd_197:
	mov	0xb, %r14
	.word 0xfadb8e40  ! 4466: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbdaa0820  ! 4469: FMOVA	fmovs	%fcc1, %f0, %f30
iob_intr_1_373:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_373), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_wr_200:
	mov	0x3c5, %r14
	.word 0xfcf38e80  ! 4472: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_1_374:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_374), 16, 16)) -> intp(1, 0, e)
	.word 0xbba5c9a0  ! 4475: FDIVs	fdivs	%f23, %f0, %f29
cpu_intr_1_348:
	setx	0x41021b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_375:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_375), 16, 16)) -> intp(1, 0, 2b)
T1_asi_reg_rd_198:
	mov	0x3c6, %r14
	.word 0xfadb84a0  ! 4480: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb3a408e0  ! 4482: FSUBq	dis not found

	.word 0xbba00520  ! 4483: FSQRTs	fsqrt	
iob_intr_1_376:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_376), 16, 16)) -> intp(1, 0, 3f)
iob_intr_1_377:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_377), 16, 16)) -> intp(1, 0, 36)
cpu_intr_1_349:
	setx	0x400131, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_350:
	setx	0x40010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb09d0000  ! 4494: XORcc_R	xorcc 	%r20, %r0, %r24
	.word 0xbba80c20  ! 4496: FMOVRLZ	dis not found

	.word 0xb5a84820  ! 4497: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb5a50920  ! 4498: FMULs	fmuls	%f20, %f0, %f26
iob_intr_1_378:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_378), 16, 16)) -> intp(1, 0, 1d)
T1_asi_reg_rd_199:
	mov	0x15, %r14
	.word 0xf6db89e0  ! 4501: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T1_asi_reg_wr_201:
	mov	0x1e, %r14
	.word 0xf2f38400  ! 4504: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb3a5c9c0  ! 4506: FDIVd	fdivd	%f54, %f0, %f56
cpu_intr_1_351:
	setx	0x400004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba549e0  ! 4509: FDIVq	dis not found

iob_intr_1_379:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_379), 16, 16)) -> intp(1, 0, a)
	.word 0xb7a98820  ! 4511: FMOVNEG	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_380:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_380), 16, 16)) -> intp(1, 0, 20)
	.word 0xb8a4c000  ! 4515: SUBcc_R	subcc 	%r19, %r0, %r28
cpu_intr_1_352:
	setx	0x400220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a9c820  ! 4529: FMOVVS	fmovs	%fcc1, %f0, %f25
iob_intr_1_381:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_381), 16, 16)) -> intp(1, 0, 26)
cpu_intr_1_353:
	setx	0x410131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa508e0  ! 4534: FSUBq	dis not found

	.word 0xb5a94820  ! 4536: FMOVCS	fmovs	%fcc1, %f0, %f26
cpu_intr_1_354:
	setx	0x410030, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_355:
	setx	0x41003d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_382:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_382), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbfa40960  ! 4545: FMULq	dis not found

	.word 0xb1a00560  ! 4546: FSQRTq	fsqrt	
cpu_intr_1_356:
	setx	0x43010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba81420  ! 4550: FMOVRNZ	dis not found

	.word 0xb3a80820  ! 4551: FMOVN	fmovs	%fcc1, %f0, %f25
cpu_intr_1_357:
	setx	0x43012a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_200:
	mov	0x3c5, %r14
	.word 0xf2db89e0  ! 4558: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T1_asi_reg_rd_201:
	mov	0x1a, %r14
	.word 0xfcdb84a0  ! 4560: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb3aa4820  ! 4562: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xb7a00540  ! 4564: FSQRTd	fsqrt	
cpu_intr_1_358:
	setx	0x410333, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_383:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_383), 16, 16)) -> intp(1, 0, 3f)
cpu_intr_1_359:
	setx	0x41011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00520  ! 4573: FSQRTs	fsqrt	
T1_asi_reg_rd_202:
	mov	0x16, %r14
	.word 0xf8db84a0  ! 4574: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_1_360:
	setx	0x42003f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_361:
	setx	0x400131, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_203:
	mov	0x3c5, %r14
	.word 0xf8db84a0  ! 4580: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_1_384:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_384), 16, 16)) -> intp(1, 0, 9)
iob_intr_1_385:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_385), 16, 16)) -> intp(1, 0, 29)
T1_asi_reg_wr_202:
	mov	0x3c2, %r14
	.word 0xf8f38e80  ! 4588: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xb6a44000  ! 4593: SUBcc_R	subcc 	%r17, %r0, %r27
	.word 0xb025c000  ! 4596: SUB_R	sub 	%r23, %r0, %r24
T1_asi_reg_rd_204:
	mov	0x3c4, %r14
	.word 0xfcdb8400  ! 4597: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb41de157  ! 4599: XOR_I	xor 	%r23, 0x0157, %r26
cpu_intr_1_362:
	setx	0x44002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a489e0  ! 4603: FDIVq	dis not found

cpu_intr_1_363:
	setx	0x460301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa9c820  ! 4605: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xbfa58940  ! 4607: FMULd	fmuld	%f22, %f0, %f62
T1_asi_reg_rd_205:
	mov	0x3, %r14
	.word 0xfadb8e60  ! 4613: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb24460d6  ! 4615: ADDC_I	addc 	%r17, 0x00d6, %r25
iob_intr_1_386:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_386), 16, 16)) -> intp(1, 0, 2f)
iob_intr_1_387:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_387), 16, 16)) -> intp(1, 0, 15)
	.word 0xb7a81420  ! 4622: FMOVRNZ	dis not found

iob_intr_1_388:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_388), 16, 16)) -> intp(1, 0, 2e)
cpu_intr_1_364:
	setx	0x460017, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_389:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_389), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_365:
	setx	0x44030f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_390:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_390), 16, 16)) -> intp(1, 0, 23)
T1_asi_reg_wr_203:
	mov	0x3c0, %r14
	.word 0xf0f384a0  ! 4631: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T1_asi_reg_wr_204:
	mov	0x34, %r14
	.word 0xf0f389e0  ! 4633: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_1_366:
	setx	0x470023, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_391:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_391), 16, 16)) -> intp(1, 0, 21)
	.word 0xbba80c20  ! 4638: FMOVRLZ	dis not found

	.word 0xbfa48860  ! 4639: FADDq	dis not found

cpu_intr_1_367:
	setx	0x46022f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_205:
	mov	0x3c0, %r14
	.word 0xfef38400  ! 4641: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_1_392:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_392), 16, 16)) -> intp(1, 0, 28)
T1_asi_reg_wr_206:
	mov	0x1b, %r14
	.word 0xf2f38e60  ! 4647: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb9a54820  ! 4650: FADDs	fadds	%f21, %f0, %f28
	.word 0xbda5c960  ! 4651: FMULq	dis not found

	.word 0xb1340000  ! 4653: SRL_R	srl 	%r16, %r0, %r24
iob_intr_1_393:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_393), 16, 16)) -> intp(1, 0, 25)
	.word 0xb68c0000  ! 4656: ANDcc_R	andcc 	%r16, %r0, %r27
	.word 0x8994212e  ! 4660: WRPR_TICK_I	wrpr	%r16, 0x012e, %tick
	.word 0xb9a8c820  ! 4661: FMOVL	fmovs	%fcc1, %f0, %f28
iob_intr_1_394:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_394), 16, 16)) -> intp(1, 0, 14)
	.word 0xbda94820  ! 4666: FMOVCS	fmovs	%fcc1, %f0, %f30
iob_intr_1_395:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_395), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_396:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_396), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_rd_206:
	mov	0x3c0, %r14
	.word 0xfadb8e60  ! 4674: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb7a54840  ! 4675: FADDd	faddd	%f52, %f0, %f58
T1_asi_reg_rd_207:
	mov	0x3c6, %r14
	.word 0xfadb8e60  ! 4677: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbba589c0  ! 4682: FDIVd	fdivd	%f22, %f0, %f60
	.word 0xbba548c0  ! 4684: FSUBd	fsubd	%f52, %f0, %f60
iob_intr_1_397:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_397), 16, 16)) -> intp(1, 0, 25)
T1_asi_reg_wr_207:
	mov	0x26, %r14
	.word 0xf0f38e60  ! 4689: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xbfa5c820  ! 4692: FADDs	fadds	%f23, %f0, %f31
cpu_intr_1_368:
	setx	0x450111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80c20  ! 4697: FMOVRLZ	dis not found

	.word 0xbfa00540  ! 4699: FSQRTd	fsqrt	
	.word 0xb7a489a0  ! 4700: FDIVs	fdivs	%f18, %f0, %f27
	.word 0xbba98820  ! 4702: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xb9a40860  ! 4703: FADDq	dis not found

	.word 0xb3a508c0  ! 4706: FSUBd	fsubd	%f20, %f0, %f56
	.word 0xbfa589c0  ! 4707: FDIVd	fdivd	%f22, %f0, %f62
iob_intr_1_398:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_398), 16, 16)) -> intp(1, 0, 36)
	.word 0xb3a50860  ! 4712: FADDq	dis not found

T1_asi_reg_rd_208:
	mov	0x2d, %r14
	.word 0xfcdb8e60  ! 4713: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_1_369:
	setx	0x450306, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_208:
	mov	0x14, %r14
	.word 0xf8f384a0  ! 4718: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T1_asi_reg_wr_209:
	mov	0x3c8, %r14
	.word 0xf6f38e40  ! 4719: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa81420  ! 4721: FMOVRNZ	dis not found

cpu_intr_1_370:
	setx	0x46010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aa0820  ! 4724: FMOVA	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_210:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 4727: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb4944000  ! 4729: ORcc_R	orcc 	%r17, %r0, %r26
	.word 0xb1a81820  ! 4732: FMOVRGZ	fmovs	%fcc3, %f0, %f24
T1_asi_reg_rd_209:
	mov	0x1c, %r14
	.word 0xf0db8400  ! 4736: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_rd_210:
	mov	0x3c2, %r14
	.word 0xf8db84a0  ! 4737: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_1_371:
	setx	0x470206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeb44000  ! 4743: ORNcc_R	orncc 	%r17, %r0, %r31
	.word 0xb3a4c960  ! 4745: FMULq	dis not found

	.word 0xb5a488a0  ! 4747: FSUBs	fsubs	%f18, %f0, %f26
	.word 0xb1ab8820  ! 4748: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb0b56026  ! 4749: ORNcc_I	orncc 	%r21, 0x0026, %r24
	.word 0xbfa5c940  ! 4754: FMULd	fmuld	%f54, %f0, %f62
	.word 0xbda00540  ! 4756: FSQRTd	fsqrt	
iob_intr_1_399:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_399), 16, 16)) -> intp(1, 0, 6)
	.word 0xb9a81c20  ! 4758: FMOVRGEZ	dis not found

cpu_intr_1_372:
	setx	0x46033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa0820  ! 4762: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xbb2de001  ! 4764: SLL_I	sll 	%r23, 0x0001, %r29
cpu_intr_1_373:
	setx	0x45000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb49c0000  ! 4768: XORcc_R	xorcc 	%r16, %r0, %r26
iob_intr_1_400:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_400), 16, 16)) -> intp(1, 0, 20)
	.word 0xb3a8c820  ! 4776: FMOVL	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_211:
	mov	0x3c3, %r14
	.word 0xfadb8e80  ! 4777: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb835e02c  ! 4778: SUBC_I	orn 	%r23, 0x002c, %r28
	.word 0xb7abc820  ! 4779: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xbda44840  ! 4780: FADDd	faddd	%f48, %f0, %f30
	.word 0xbda5c8c0  ! 4781: FSUBd	fsubd	%f54, %f0, %f30
iob_intr_1_401:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_401), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb5a5c860  ! 4783: FADDq	dis not found

iob_intr_1_402:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_402), 16, 16)) -> intp(1, 0, 28)
	.word 0xb9a409a0  ! 4788: FDIVs	fdivs	%f16, %f0, %f28
	.word 0xbda94820  ! 4789: FMOVCS	fmovs	%fcc1, %f0, %f30
iob_intr_1_403:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_403), 16, 16)) -> intp(1, 0, f)
	.word 0xbba48840  ! 4792: FADDd	faddd	%f18, %f0, %f60
	.word 0xb23c0000  ! 4793: XNOR_R	xnor 	%r16, %r0, %r25
iob_intr_1_404:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_404), 16, 16)) -> intp(1, 0, 28)
	.word 0xbe35a0fa  ! 4798: ORN_I	orn 	%r22, 0x00fa, %r31
T1_asi_reg_rd_212:
	mov	0x19, %r14
	.word 0xf0db8e40  ! 4805: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbda80820  ! 4806: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb3a50860  ! 4807: FADDq	dis not found

iob_intr_1_405:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_405), 16, 16)) -> intp(1, 0, 37)
cpu_intr_1_374:
	setx	0x460106, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_213:
	mov	0x3c2, %r14
	.word 0xf8db84a0  ! 4814: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_1_406:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_406), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb1a4c8e0  ! 4818: FSUBq	dis not found

	.word 0xb1a9c820  ! 4819: FMOVVS	fmovs	%fcc1, %f0, %f24
cpu_intr_1_375:
	setx	0x450333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a588c0  ! 4823: FSUBd	fsubd	%f22, %f0, %f28
	.word 0xb2242003  ! 4824: SUB_I	sub 	%r16, 0x0003, %r25
	.word 0xbfa40860  ! 4825: FADDq	dis not found

	.word 0xbda8c820  ! 4826: FMOVL	fmovs	%fcc1, %f0, %f30
cpu_intr_1_376:
	setx	0x45031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdabc820  ! 4832: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xbdab0820  ! 4836: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb5a408e0  ! 4838: FSUBq	dis not found

	.word 0xb3a88820  ! 4840: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb2044000  ! 4841: ADD_R	add 	%r17, %r0, %r25
T1_asi_reg_wr_211:
	mov	0x3c0, %r14
	.word 0xf6f384a0  ! 4842: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0x8d9460b4  ! 4843: WRPR_PSTATE_I	wrpr	%r17, 0x00b4, %pstate
T1_asi_reg_rd_214:
	mov	0x21, %r14
	.word 0xfedb8e60  ! 4845: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T1_asi_reg_wr_212:
	mov	0x3c3, %r14
	.word 0xf6f38400  ! 4847: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_1_377:
	setx	0x450118, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_378:
	setx	0x440115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5520000  ! 4850: RDPR_PIL	<illegal instruction>
	.word 0xb9aa0820  ! 4851: FMOVA	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_213:
	mov	0x21, %r14
	.word 0xfcf38e40  ! 4853: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb3a80820  ! 4854: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
iob_intr_1_407:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_407), 16, 16)) -> intp(1, 0, b)
iob_intr_1_408:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_408), 16, 16)) -> intp(1, 0, 12)
	.word 0xbfa509e0  ! 4867: FDIVq	dis not found

T1_asi_reg_rd_215:
	mov	0x3c4, %r14
	.word 0xfadb8e40  ! 4868: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_409:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_409), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_379:
	setx	0x46021f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_410:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_410), 16, 16)) -> intp(1, 0, 1c)
T1_asi_reg_rd_216:
	mov	0x27, %r14
	.word 0xfadb8e40  ! 4872: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_rd_217:
	mov	0x2e, %r14
	.word 0xf0db84a0  ! 4873: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_1_411:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_411), 16, 16)) -> intp(1, 0, 5)
T1_asi_reg_wr_214:
	mov	0x3c1, %r14
	.word 0xfef38400  ! 4878: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T1_asi_reg_rd_218:
	mov	0x3c4, %r14
	.word 0xf2db8e80  ! 4881: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_1_380:
	setx	0x470211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6bce1d9  ! 4884: XNORcc_I	xnorcc 	%r19, 0x01d9, %r27
cpu_intr_1_381:
	setx	0x45013a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_412:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_412), 16, 16)) -> intp(1, 0, 18)
iob_intr_1_413:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_413), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_wr_215:
	mov	0x28, %r14
	.word 0xf6f38e40  ! 4894: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_wr_216:
	mov	0x1, %r14
	.word 0xf0f38e40  ! 4896: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbfa9c820  ! 4897: FMOVVS	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_219:
	mov	0x27, %r14
	.word 0xfadb8e40  ! 4899: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_wr_217:
	mov	0x1d, %r14
	.word 0xfef38e80  ! 4900: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb095a099  ! 4902: ORcc_I	orcc 	%r22, 0x0099, %r24
iob_intr_1_414:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_414), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb41da1cd  ! 4904: XOR_I	xor 	%r22, 0x01cd, %r26
T1_asi_reg_rd_220:
	mov	0x3c4, %r14
	.word 0xf2db8e80  ! 4908: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb1ab4820  ! 4912: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xbbabc820  ! 4915: FMOVVC	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_218:
	mov	0x23, %r14
	.word 0xf6f389e0  ! 4917: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_1_382:
	setx	0x46033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb97d8400  ! 4919: MOVR_R	movre	%r22, %r0, %r28
iob_intr_1_415:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_415), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_wr_219:
	mov	0x4, %r14
	.word 0xf0f38e40  ! 4922: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbba84820  ! 4924: FMOVE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_383:
	setx	0x44001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a40860  ! 4926: FADDq	dis not found

T1_asi_reg_wr_220:
	mov	0x2, %r14
	.word 0xf0f38e80  ! 4929: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbda5c860  ! 4931: FADDq	dis not found

	.word 0xb1a00540  ! 4933: FSQRTd	fsqrt	
	.word 0xb805e181  ! 4934: ADD_I	add 	%r23, 0x0181, %r28
cpu_intr_1_384:
	setx	0x470121, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_221:
	mov	0x3c8, %r14
	.word 0xf0db8e80  ! 4937: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T1_asi_reg_wr_221:
	mov	0x33, %r14
	.word 0xfcf38e80  ! 4938: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T1_asi_reg_wr_222:
	mov	0x3c6, %r14
	.word 0xf4f38e80  ! 4939: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb01d0000  ! 4940: XOR_R	xor 	%r20, %r0, %r24
	.word 0xb4054000  ! 4944: ADD_R	add 	%r21, %r0, %r26
	.word 0xbba549e0  ! 4947: FDIVq	dis not found

	lda	[%r20 + %g0] 0xf0, %f2
cpu_intr_1_385:
	setx	0x470036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a589a0  ! 4953: FDIVs	fdivs	%f22, %f0, %f28
cpu_intr_1_386:
	setx	0x470303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80820  ! 4958: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xbb7c4400  ! 4961: MOVR_R	movre	%r17, %r0, %r29
	.word 0xb9a48920  ! 4962: FMULs	fmuls	%f18, %f0, %f28
	lda	[%r20 + %g0] 0xf0, %f2
T1_asi_reg_rd_222:
	mov	0x3c4, %r14
	.word 0xf2db8e40  ! 4968: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_416:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_416), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb5aa0820  ! 4970: FMOVA	fmovs	%fcc1, %f0, %f26
cpu_intr_1_387:
	setx	0x46021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb42d2182  ! 4972: ANDN_I	andn 	%r20, 0x0182, %r26
	.word 0xbda54940  ! 4974: FMULd	fmuld	%f52, %f0, %f30
	.word 0xb2454000  ! 4975: ADDC_R	addc 	%r21, %r0, %r25
	.word 0xb9a00040  ! 4977: FMOVd	fmovd	%f0, %f28
T1_asi_reg_rd_223:
	mov	0x35, %r14
	.word 0xf4db84a0  ! 4980: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_1_388:
	setx	0x46010f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_389:
	setx	0x460034, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_224:
	mov	0x26, %r14
	.word 0xf8db8e40  ! 4983: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_1_390:
	setx	0x450133, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_417:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_417), 16, 16)) -> intp(1, 0, 3a)
T1_asi_reg_wr_223:
	mov	0x3c5, %r14
	.word 0xfef38e60  ! 4988: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_1_391:
	setx	0x460035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00560  ! 4991: FSQRTq	fsqrt	
	lda	[%r20 + %g0] 0xf0, %f2
T1_asi_reg_wr_224:
	mov	0x3c7, %r14
	.word 0xf0f389e0  ! 4998: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_1_418:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_418), 16, 16)) -> intp(1, 0, 1c)

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

	.xword	0x239b87ffe1c71b6f
	.xword	0xd85ca0f510446629
	.xword	0xed33dcc30fd9f821
	.xword	0x1a92d2d280c50c98
	.xword	0x10d2c4bce1c59880
	.xword	0x12145ea9d9d5cdce
	.xword	0x99321a55f13f9396
	.xword	0x8c95419fdb984421
	.xword	0xb6ffc94499c23890
	.xword	0x24cb043b0d16525a
	.xword	0xd37fccef86b08474
	.xword	0x38e6b229fefcfaa9
	.xword	0x3e3904e52e94f617
	.xword	0xd3080a331828f66f
	.xword	0x193029a22faa88c8
	.xword	0x60f6aa8ffa41e1a6
	.xword	0xf4da82cf3a960dad
	.xword	0xe19f8887d9c51907
	.xword	0xeb15beb161233005
	.xword	0x64bd3a1d4cbb78fc
	.xword	0x11c02030a747d3a4
	.xword	0xbf06a52d92e70ee1
	.xword	0x9e46dd3e81d0807b
	.xword	0xa7741b1114bf7b6a
	.xword	0x82f66af113d10757
	.xword	0x51488f860635289e
	.xword	0x45534bb872989da9
	.xword	0x551c346df44f020b
	.xword	0xab5405116b4bbf74
	.xword	0x883274ab944c878c
	.xword	0xc5b76a9dacc9e4fd
	.xword	0x49cc5b1fa7693f7a
	.xword	0x9edd44fe2376c8e8
	.xword	0xdeb7f6a93d3e92d0
	.xword	0x8cf993e7071820b9
	.xword	0x4ef929e8439d5944
	.xword	0x91a19462008ef802
	.xword	0xf30f0aee63f1c649
	.xword	0xf4c0128a40823c2e
	.xword	0x8713cf4e45dfde76
	.xword	0x48fdc103860780ea
	.xword	0x3ed2b53e5c996ff0
	.xword	0xd38d16482006e144
	.xword	0x597714b5e580dde3
	.xword	0x08e69158eddc24c0
	.xword	0xf15cdb3928364d93
	.xword	0x029fb1c915e9c5cb
	.xword	0x0ef07c1dfb45ba6e
	.xword	0xed8127306d5956e6
	.xword	0x783cc939409102cb
	.xword	0xcda99d2776107cc1
	.xword	0x6a01ba084b776dd6
	.xword	0xe9952ab9bb3b7862
	.xword	0xfeef50e487f870ce
	.xword	0x2cecf0f3431680df
	.xword	0xb971df748d4d632f
	.xword	0xcc887f3ab52558c8
	.xword	0x123f77e923f4080c
	.xword	0x53d450eaf06ed9af
	.xword	0x8476c39b7bf84ad3
	.xword	0x475da604ef3d5efa
	.xword	0x33f98b6ae92e6914
	.xword	0xa2c7f4e760aa95a6
	.xword	0x508c28795e0c1c63
	.xword	0x7fd54a752802e22b
	.xword	0xc91166abe6cee9d9
	.xword	0x0b3a33605dc8a831
	.xword	0xac0e8b65aa8e64de
	.xword	0xc0d0d5cd4ad56d87
	.xword	0x9ddf7ebeee5e7a26
	.xword	0x77c16022b925f8d9
	.xword	0x6ae5033b0c2e40a1
	.xword	0x7d936caf66a8f881
	.xword	0xb1c1bc3450437569
	.xword	0x74e0ba9d8fb894b1
	.xword	0xa9d9dd49afe9f6bc
	.xword	0x1df14ea21588b4ad
	.xword	0xd25fb0392e8af4ed
	.xword	0x300ddd8bc670c4e6
	.xword	0x878823affaf57e9b
	.xword	0x82b9a9b14e12d753
	.xword	0x2dde518ad5c4f7df
	.xword	0xd640396a3da68900
	.xword	0x4fdb94bbf9ee49f0
	.xword	0x75a1761a31926aa8
	.xword	0x4a29df9bbe3d74fd
	.xword	0x5b35c5aa367ac681
	.xword	0x7a3ff8399859f3e7
	.xword	0xb6ba4757afafed59
	.xword	0xaabc4a75cf4d2c5e
	.xword	0x4627c63310efcb64
	.xword	0xb8144d5699fb3001
	.xword	0xa1d339d683dbe962
	.xword	0x4a58ad4811217e78
	.xword	0xe76a567dcc20c935
	.xword	0x4227f33cd3def2f4
	.xword	0xab0042168477a515
	.xword	0xa0cc755cb495be8c
	.xword	0xd3de6fd63e554cb8
	.xword	0x8915ff470dd19bff
	.xword	0x4626a50419577ca8
	.xword	0xdc0e24e756956b1a
	.xword	0x1e8d9ba093a1a846
	.xword	0x78b0409b96f81b0e
	.xword	0x0262524ce1b3a17e
	.xword	0x253c290d47fdb78f
	.xword	0x5b798273ef0c41f4
	.xword	0x25764fbac1a429eb
	.xword	0x50e0891fcd106b32
	.xword	0xd2306a1c630f27d3
	.xword	0x882404d424ea5499
	.xword	0xfc5787aa97ed97ba
	.xword	0x9c3e6177367d623d
	.xword	0xd3a11fdf6864aac5
	.xword	0x835fcea85ce17afd
	.xword	0xa5d981a77dc48a05
	.xword	0x893f2f5e4fbb177a
	.xword	0xd4bb5b4c440d9217
	.xword	0xf1199dfda54f5630
	.xword	0xebcefaad84609f8f
	.xword	0x2305426584a290d4
	.xword	0x8fa4fce03c5b58be
	.xword	0x764e9026f1361605
	.xword	0x8ea60f420cb1f429
	.xword	0x9ca8981cf13890d8
	.xword	0x18891f3aff8b859d
	.xword	0x9c481ceacbfbcf3a
	.xword	0xf0cadcc6cbcf6fd3
	.xword	0xc015f1fc71cbf919
	.xword	0x04c94b7aafb22dbf
	.xword	0x309531a95147950c
	.xword	0x097a0a3bbde0a6f3
	.xword	0xad32766daa948316
	.xword	0x4bcd0579cdd6352c
	.xword	0xda54a980eed470d5
	.xword	0xe9fc842ab4a5c75b
	.xword	0x10c754ddd2d1f102
	.xword	0x1069310b9d99354c
	.xword	0x38741aa2958d2dd0
	.xword	0xe42d1d1954632b35
	.xword	0x1973c93a3bc51b21
	.xword	0x6713f17e88b5619e
	.xword	0x711f9dc59a0fe22d
	.xword	0x6d3fdbf172562325
	.xword	0xab852886499b152b
	.xword	0x068efb2277f16749
	.xword	0x779030e517dd3b5b
	.xword	0xdaf69dd21af72317
	.xword	0x9cde103c4f201ce3
	.xword	0xab5481d281f04c97
	.xword	0x5e6b8b6305eb927d
	.xword	0xc58697907be39836
	.xword	0x0ddcf74f0dfb1214
	.xword	0x3f6983726158b47a
	.xword	0xe3512a5dc9406679
	.xword	0x32376bca69587da8
	.xword	0xc998bb727bdd9fd4
	.xword	0xa19e590b389b6a9d
	.xword	0x664a8235cbed9d44
	.xword	0xf859ef0e0b23794d
	.xword	0x5de760c70a234d19
	.xword	0xf5cd832470c1bac2
	.xword	0x0ee5d230036dbf22
	.xword	0x834326404e87ea4f
	.xword	0x5f543d9cc348f8f6
	.xword	0x53641ebb1b93de0e
	.xword	0xe03da8e1d8656084
	.xword	0x69da5e171523c1d8
	.xword	0xfcfdee31024ad84a
	.xword	0xd27b5b9df752f25f
	.xword	0x00590c78c9776129
	.xword	0xdb37bdc609a9079e
	.xword	0x05de880bbed6a6b8
	.xword	0x9d799e41fe2b9730
	.xword	0x6177c5e2f891c19d
	.xword	0xa833c83205d4ab34
	.xword	0xe8c8a84c6c9c111f
	.xword	0x6fa3bb0dd7c6785b
	.xword	0x0f4b5722a5bdd5f3
	.xword	0x3ca5931a76efd3bb
	.xword	0x61a4c4b295678ade
	.xword	0x6fcb035744200fec
	.xword	0x4ebf5a29b974d951
	.xword	0x84b678f3c6ed40d9
	.xword	0x11dba19eb3e22eac
	.xword	0xf95d679a044eadb6
	.xword	0xee9dbd9a46b7dc14
	.xword	0x9dc759e868721792
	.xword	0x7397993e8c41ec5b
	.xword	0xf5804c70366dff44
	.xword	0xb46847fcdf04166a
	.xword	0xad90c9b95d643996
	.xword	0x6d9849faa534bcd1
	.xword	0x2168a31ad247b8c1
	.xword	0x01578e5fda20832f
	.xword	0xb684f0ca1056e988
	.xword	0xcebcf9e8cb880b25
	.xword	0x3f9af2be64b3ad21
	.xword	0x1219abc807ebe4f6
	.xword	0xbafe6ffa0db1b4a7
	.xword	0xdc6107905764dd9f
	.xword	0x069d4c19f00ab621
	.xword	0xc2ee328d2df9c024
	.xword	0xe834c7ab23c669b4
	.xword	0x2b4f6367f1d0ab17
	.xword	0x3966bfd4461e023c
	.xword	0x52e9889e41a21a3c
	.xword	0xb02ee73559f48cf0
	.xword	0xea8903f8ec730d9b
	.xword	0x5da3902a6121a0fc
	.xword	0x043a74778db0255a
	.xword	0xe3cb810b8895d681
	.xword	0x0cbf6ce6760e91fd
	.xword	0x2019f6a92f59d41e
	.xword	0x0a769a33e5bdb9f3
	.xword	0x9e196442fcc5f232
	.xword	0xf9146c3504d1ff5a
	.xword	0x26689b4fbaeb1795
	.xword	0x557f6d7c87e997e2
	.xword	0x676873c77eb6642a
	.xword	0x258fa7d388ffa358
	.xword	0xc18e8905570ec4f0
	.xword	0x252d89b44b33c478
	.xword	0xce71a7a907f4f36e
	.xword	0x8ca0a39c0bb37d29
	.xword	0x81a50cfc61f1d207
	.xword	0x80e6d083d0142624
	.xword	0xec73111cad3517f2
	.xword	0x1e5dc1a41934b023
	.xword	0x377d24059c70126b
	.xword	0xb858b5de355f0c33
	.xword	0x8bb227a19cde194f
	.xword	0x0d2adc2996969852
	.xword	0x1d43a63946c36875
	.xword	0x4f2a62405d7b3f73
	.xword	0x93b2fa194d0dd006
	.xword	0xa8c3688bc865be14
	.xword	0x4907fa483a5bbcb8
	.xword	0xc7444769fd4dcbf7
	.xword	0x3a35fe04a1ad3a74
	.xword	0x3c73f5ee970babc1
	.xword	0x342c624048b7d198
	.xword	0xd3fa7034d013cfa5
	.xword	0x09d127a208acd93c
	.xword	0xfbfda5859ec46125
	.xword	0x4c716b0679f19ad1
	.xword	0x78fdc9b47fdaf5aa
	.xword	0x5081f736abe43b1a
	.xword	0x00dd5bb742bbc1e2
	.xword	0xfc3fb6ecac23d2d4
	.xword	0xe9ce22f0f5be52d8
	.xword	0x3f961fe16e307ca3
	.xword	0x1edc05e9bcf213ea
	.xword	0x5a8aa3355fa61b21
	.xword	0x2b301ca891265563
	.xword	0xc29a8efc282c5755
	.align 0x2000
	.data
data_start_1:

	.xword	0x4700b12a774aede0
	.xword	0xf783a51344fc822f
	.xword	0xdb41615aa6995322
	.xword	0x1e30c1fa1ef51620
	.xword	0xce5c314fd4b231ad
	.xword	0xe44210b6c1bc49cd
	.xword	0xb7351693c7b6e77d
	.xword	0x5aaa609ff940e0f2
	.xword	0xfd3b074de44d18b2
	.xword	0x1b10a8c47e203cdf
	.xword	0x59fe63974b18114c
	.xword	0xda8a998561f4e2e2
	.xword	0xe396dc9049b4f510
	.xword	0x30d54fb13efc14a8
	.xword	0x4d789457961a3237
	.xword	0xf22f0bc7be9f4ba5
	.xword	0x5f10f30854908a99
	.xword	0xee7b46964e66d713
	.xword	0xdf3d058571683dac
	.xword	0xa7de6fcec65165c1
	.xword	0x32a2e4d875e7fc06
	.xword	0x8f146f1a0a853071
	.xword	0x4586ca9aa8954877
	.xword	0xf4bd312e9a41a2a6
	.xword	0xb49e16ae437a5a75
	.xword	0x6aee07d0fdda7b4f
	.xword	0x39d56c88f4a1bede
	.xword	0x42abe68dc0f93f22
	.xword	0xa3d2c002da56e74e
	.xword	0xef02a7da28544daa
	.xword	0xdf98e9be78edd846
	.xword	0xd413ae0f19d7805f
	.xword	0xa5819543f2383f33
	.xword	0xc9361c1a49c3c379
	.xword	0x5106029e3f30218f
	.xword	0x0bef10cda0891665
	.xword	0x20d964290254ca01
	.xword	0x7bb64544a7ab82f4
	.xword	0xd5debb6ed0ee627f
	.xword	0x1a6d2cbc1bf4ba09
	.xword	0xd6078626f11dd51a
	.xword	0x817dc512d3c44be2
	.xword	0x133eea7775045719
	.xword	0x91e43e9337b5b678
	.xword	0xda59b472109d04c1
	.xword	0xd1cbc58dd4094f99
	.xword	0xd33b3df6bd2e8c8f
	.xword	0x7ec406fdc6c623e5
	.xword	0x89a47d8acc4e14dc
	.xword	0x3baf22874986e58e
	.xword	0x7fd7ca5f8c249f4a
	.xword	0xa30edfc8ed5e0c14
	.xword	0xfb7e17afecef37fd
	.xword	0x2d12927ea340ced6
	.xword	0x23712591f7d4e75b
	.xword	0x264a2250041e0a46
	.xword	0xdd294c18fd7d3c03
	.xword	0xdf923469c48f94d4
	.xword	0xd38eed9eb99d8a39
	.xword	0xd25ffa3de97e86d3
	.xword	0x54cbf1d26d40ad27
	.xword	0x713a868268911293
	.xword	0x4a53caea8a2034e5
	.xword	0x71cfa4f77591368e
	.xword	0x5491dd2bad670d2c
	.xword	0xcfc255d40aff8a5a
	.xword	0x5ee957acddfe67d7
	.xword	0x6a6b300bc02162ae
	.xword	0xbb07d3e47fea23bb
	.xword	0xd64fb2f73062b72d
	.xword	0x6a5ffba6e347b7cf
	.xword	0x456a6d4d4fdd3c27
	.xword	0x0b30fa82044a7a65
	.xword	0xc137b576179c7911
	.xword	0x0b5fb18611fd2bb0
	.xword	0x58ae4d20768b97fb
	.xword	0x3b4d931a10c64d1c
	.xword	0xc3bac74b8ba475d2
	.xword	0x5ac57f20a530c2ca
	.xword	0x3bc09d44274a3de2
	.xword	0x68169af049d4505d
	.xword	0x65748d00644e85fc
	.xword	0xb5a4ef4e3248aa42
	.xword	0xf28854151378bb11
	.xword	0x86979dc2fc5d2bef
	.xword	0x4b70b25a1cfbf5ea
	.xword	0xf0752a7ec0d6e101
	.xword	0xaee81e7100c62221
	.xword	0x7bdec0e2e8619500
	.xword	0xac5485a97d1cdd86
	.xword	0x8c4337b46e48397a
	.xword	0x02067dd7a391eab5
	.xword	0x03036ff411bfe767
	.xword	0xb9b5f3de22b1359d
	.xword	0x7d26af475994a739
	.xword	0xbcb90bf65666c0cc
	.xword	0x305a99683d584df6
	.xword	0x3409dd3c39bf16e4
	.xword	0x415841329088179d
	.xword	0xf347c359e7252a59
	.xword	0x9c29fd014689ff62
	.xword	0xbd4303602c7abb86
	.xword	0x02ef239b1aab8616
	.xword	0x30dbc9e77cf80d33
	.xword	0xfd29ffaba64b3211
	.xword	0x9118a0f79b682417
	.xword	0x53807e1a69ab24cc
	.xword	0xa9263ce45059d07f
	.xword	0x2f441f98635bc7c6
	.xword	0x3a023491a558ed59
	.xword	0x22b839bbe0151f2c
	.xword	0x687187d8ca4ee0eb
	.xword	0xac3b4c53f968bf62
	.xword	0x84b42eb40e0d724d
	.xword	0x69d96165d73a7d33
	.xword	0x75e70cd8703cf7f3
	.xword	0xedc1904099d8896a
	.xword	0x107c82ec9bf81320
	.xword	0x16d9ebf2ffdcf828
	.xword	0x00adf84ad2de16e0
	.xword	0x17e2b3ac5fc88c49
	.xword	0x42debe3178d6c3cb
	.xword	0x735bd1ce2f1c1f31
	.xword	0x7548e727ac678e53
	.xword	0x0c3c18a3b59dc953
	.xword	0x4920de9202396c0f
	.xword	0x15f0455205b2c73c
	.xword	0x36dc3f829e722b4b
	.xword	0xe356ff7371abc8a5
	.xword	0x63d108a7248eaa8b
	.xword	0x577a31cf074681c2
	.xword	0xac36876cf9065186
	.xword	0xe855f29db20c5292
	.xword	0x46f82c27a20a7931
	.xword	0x701b80b89f8e45fc
	.xword	0x3def12dcb14b52e3
	.xword	0xa8a76c0a521f8978
	.xword	0x63fa5aed16bf671d
	.xword	0x96cf5db5af9a1cb0
	.xword	0x411a78040403586a
	.xword	0xee46239efd44a8ff
	.xword	0xf8e79d8673e5650d
	.xword	0xcd015298b07bcf45
	.xword	0x62b9141a66a0baf2
	.xword	0x8ae6f17c29dbdbea
	.xword	0x5cdf48b3634ec93e
	.xword	0xe18e7ae3588ede86
	.xword	0x2fc30a93c522a967
	.xword	0xedb88c08d56564a9
	.xword	0x805a097ccb5520c3
	.xword	0x856db61c0177c1c0
	.xword	0x58b56300524b2a15
	.xword	0x57f9627fffe916f6
	.xword	0x87f5cf9b787f1d55
	.xword	0xc55c59e91bc7e0ef
	.xword	0x5d29396f85ac16e4
	.xword	0x68230d0f9f749984
	.xword	0x73987c4ede23be9b
	.xword	0x4fe3169d5272ef2d
	.xword	0x2e2daf4eb9f4fd28
	.xword	0x5ad89c4557e693ba
	.xword	0xdfe64c0c00be729e
	.xword	0xd674e0466df3bb90
	.xword	0x06096d794dca12a9
	.xword	0x6bfc5012e5f13a70
	.xword	0xab3fc8060feeb86b
	.xword	0xcf3118d47b0c1e83
	.xword	0x644f9282a9e393d1
	.xword	0x23aac4fac3e5e0d6
	.xword	0x2caca543e6a5a53b
	.xword	0x5e9b65c13b5877e0
	.xword	0x19ad2f244a43a309
	.xword	0x78bb567a1f80a434
	.xword	0x5c26d8601e92def0
	.xword	0x3a63fda02bbbc703
	.xword	0x02139296bdfe7d75
	.xword	0x141be205685aec21
	.xword	0xe0e568f1cb9b49d9
	.xword	0xbba0663bb9bfef83
	.xword	0xea476a1bda221540
	.xword	0xd9f1e270cc899438
	.xword	0x14aed87f12b8f3af
	.xword	0xb838194d979c1892
	.xword	0x24f7c7dfe129f1a7
	.xword	0x51123192abad9169
	.xword	0xa04b5c05900c32e8
	.xword	0x17f90308e7258420
	.xword	0xa86bc0e33fefaddb
	.xword	0x3d727e0af7324ced
	.xword	0xe6f97b41a9d585cb
	.xword	0x2b53d5780c270594
	.xword	0x5b32279a5a4e44d8
	.xword	0x7bf61fe0a247f4fb
	.xword	0xc598eab1246501f6
	.xword	0x079a9e8d684c6b26
	.xword	0xb0dff8804ada8c32
	.xword	0x94223ddace7d3167
	.xword	0xefb1afce7e810146
	.xword	0x36e8437bf10e33f0
	.xword	0x0ad5a07ff24f8c28
	.xword	0xfc11c1b700fdfc1f
	.xword	0x9751a69a59b8b02a
	.xword	0x534fc0b6220440f5
	.xword	0xb109314a542060b7
	.xword	0x7fc3e67ebcb973e5
	.xword	0x6992679ef3759d61
	.xword	0x61de05151d5fbfe0
	.xword	0x1c83a497219fdd8d
	.xword	0x62fb4d298590dcc9
	.xword	0xe77add91846da443
	.xword	0xbff9cc3af6c8a081
	.xword	0xd39092df018afde3
	.xword	0x5a0dd38e1206dc57
	.xword	0x7361ce314d39d224
	.xword	0xcc631aa96e26ac5f
	.xword	0xdb608d2b6c4061f4
	.xword	0x94726679c2ce65a8
	.xword	0x973ea9365c5a5ac8
	.xword	0xaee5190d81f8e111
	.xword	0x80e18d65e234b3b6
	.xword	0x94fe677779a98b43
	.xword	0x0ddec79e7a3d1a20
	.xword	0x0e013be4daf9d808
	.xword	0xfebeabec2d142f69
	.xword	0x4e1d25f05f736f39
	.xword	0xa088ecd676b09b16
	.xword	0x271116ab017044af
	.xword	0xd38454d8890301cf
	.xword	0x159fea405821dcbc
	.xword	0x424e01f6d1aee180
	.xword	0xfec91a61342f38d9
	.xword	0xa25d5ecd99d52e9e
	.xword	0xe2c13f2095002293
	.xword	0x79426a06d3f957e1
	.xword	0x130956166c2e65a8
	.xword	0x3193b2a885ed33b2
	.xword	0x5029026eb4ac50ef
	.xword	0x066964e3e94e6825
	.xword	0xd5f2cfd2f3009d74
	.xword	0xcfac79186cc2829d
	.xword	0x29d10ce2db11093b
	.xword	0x2818922f7e5f6ec5
	.xword	0xf972cd2c0615bbf4
	.xword	0x59d5aa8d53a9f487
	.xword	0xd17ca2b8d927d10c
	.xword	0x2b9427896e2f3a0d
	.xword	0x130ed5af1b94442a
	.xword	0xe4ee75c1415e95d1
	.xword	0x26caf7019e8cc949
	.xword	0x057ca7cf66a3ca22
	.xword	0xdea83f63505d6025
	.xword	0xff373b6525edf5b1
	.xword	0x57d8b7dbdf6bed04
	.xword	0xf811f1d87ceb2582
	.xword	0xd7caa10bea56771a
	.xword	0x6d1781f7ddcac51f
	.align 0x4000
	.data
data_start_2:

	.xword	0xebbffe80c66b57b6
	.xword	0x605360edb4b8ee16
	.xword	0xcd1cbe6e4f4c8aa5
	.xword	0x5c6d80abef97be25
	.xword	0xc6960925a2ecc42e
	.xword	0xbd18d1f73480ade1
	.xword	0xaf13cfdb0dd52515
	.xword	0xfd8b5167a6426315
	.xword	0xc54e3f8a293f4cec
	.xword	0xf8b43f482b825c80
	.xword	0xa59e6f7b84693184
	.xword	0x80a0cb8aac9a0907
	.xword	0x92e888885d6430d9
	.xword	0xf96e72318bdc2c85
	.xword	0x8c264d70474f399d
	.xword	0x60b094da8f0194da
	.xword	0x2b4fffad7e4fa6a5
	.xword	0xe0459dd6b38ea715
	.xword	0x3358bd115abca680
	.xword	0xfd5572a56c6b040d
	.xword	0xfff77a92f7ee6f29
	.xword	0xeebac00f1d9db543
	.xword	0x4ab5f6efd55aaa5d
	.xword	0xdea24ea28910920b
	.xword	0x4ad6667472b1a435
	.xword	0x9a23985fdc115269
	.xword	0x38bfc519769528b0
	.xword	0xa65db370f77ca203
	.xword	0xdbb97790c5c6fdbc
	.xword	0x7cb91d3b6b7d8f1b
	.xword	0x5c61bc9a249425f6
	.xword	0xfc6562a96fe523ce
	.xword	0x3f814aa837c5aeee
	.xword	0xdd7740623415ee68
	.xword	0xca2ff937370f7b0c
	.xword	0x4c021cd2cedf6c47
	.xword	0xc05ae3f35436ce8a
	.xword	0x271239879e8c1f3e
	.xword	0x1f9ca02f4bbdaa0d
	.xword	0x6409d7dfd496884e
	.xword	0x78faf5fe042a67c7
	.xword	0x6ea96c6a44fb3f5a
	.xword	0x2b2de28165ea71b2
	.xword	0xb55310ada4b6a69a
	.xword	0x5f7e4bd2fc268199
	.xword	0x32db4a76ac077326
	.xword	0x38d1deb9fb2f68d9
	.xword	0xf36aabc6824ef438
	.xword	0xdc196116f56ce6aa
	.xword	0x48f4cb275c369349
	.xword	0x6240563ed860e67f
	.xword	0x815d21ea2cca6fa9
	.xword	0xf97566505e9efa7a
	.xword	0xeaef3f92984c1a09
	.xword	0x2eb6f37e05029cfe
	.xword	0x6c9e4d852446a77d
	.xword	0x5e569cab831a1c18
	.xword	0xded594c51750197a
	.xword	0xbe5a5d6237da8c0c
	.xword	0x1de6bb0630a2c21d
	.xword	0x3b5fd887197070e3
	.xword	0xc9f2641ac19a37fc
	.xword	0x6c0e3f40388d01a6
	.xword	0x1a7aa90b2b60d006
	.xword	0x390a4dc04b78dd3f
	.xword	0x5c0d55ceda055f8c
	.xword	0xb1dfe78c8ed62741
	.xword	0xa9d94199e2c012d0
	.xword	0xa52ac2041585d5b5
	.xword	0x793e2c6e84844bfc
	.xword	0xa9d621a179120259
	.xword	0xf501eae71f274010
	.xword	0x69037e86ed148958
	.xword	0x2e4aba88333396f1
	.xword	0xdcbf87e3f8703413
	.xword	0x8c6bf6369d47446d
	.xword	0xe0982bcee5f394b4
	.xword	0x6dc89453f2dfd120
	.xword	0x3a0cb7f2ccd119a8
	.xword	0x328a81b534753488
	.xword	0x6b3cae896ed1ab52
	.xword	0xc820e7604cf9387f
	.xword	0x970fd94a78e2602b
	.xword	0xed4598f4a33f3bf2
	.xword	0xb5ebc28e6884dbbf
	.xword	0x663d0083676f8b63
	.xword	0xde0fa8fb8ca8c179
	.xword	0xfda8bc5d0f4a8baf
	.xword	0x3c8de77275768e70
	.xword	0xc00c825be1dc401e
	.xword	0x1d31f4a0a1b6b38a
	.xword	0x576a3af26f54985c
	.xword	0x7e00c89f23b1c6e1
	.xword	0x3a978b6517d8b348
	.xword	0x9ba7f213909550ca
	.xword	0x8fa106c96fead10a
	.xword	0x42c5d7472a04bf36
	.xword	0x7763783ca35143e0
	.xword	0xc3bf06d0caf45e39
	.xword	0x13902a32d34bfcba
	.xword	0x916198acd89beefb
	.xword	0xc2c380d17c235b47
	.xword	0x22cff144298401bc
	.xword	0x5572ef6ff6f40d32
	.xword	0x756d97f5060a0e2d
	.xword	0x563555c1534a51a8
	.xword	0x709337b5b8d45dab
	.xword	0x1602bc5efde54517
	.xword	0xfa115a5e8356fa6b
	.xword	0x5ed0ad57c27aa181
	.xword	0x885ee3eb3036e2ee
	.xword	0xcf519c31d9a3ed66
	.xword	0xc7e825176f6a0a83
	.xword	0xf25844b0b43c600c
	.xword	0xdf63485955fd4b9b
	.xword	0x8cdc909cedc033be
	.xword	0x798cf91bc48e6412
	.xword	0x912f9f8566b19371
	.xword	0x14079e5048d30241
	.xword	0x9df39e0537d7fe38
	.xword	0x06eddedc696bd2ac
	.xword	0x91bd76998c6182c2
	.xword	0x57c74a8e6fb58c38
	.xword	0x63ce71fa6ab4f162
	.xword	0x754203e45e80bd6c
	.xword	0x3ac68529d36a5440
	.xword	0xcab6b245372f2810
	.xword	0xcb0216d976f7ff34
	.xword	0xb784df0f7aec6aae
	.xword	0x18986a950557e098
	.xword	0xecee69928f37c794
	.xword	0x88bd349d787a46cc
	.xword	0x8c6d9964ed266c13
	.xword	0x0a3e3891385a4622
	.xword	0x52ee10a04dab0235
	.xword	0xef75f778f1e58e5e
	.xword	0x2f084321c6818292
	.xword	0xe8410fbe21721a14
	.xword	0x91d68f660501c0b2
	.xword	0xfe889b622176b759
	.xword	0xc01ea8b4b5b7ffca
	.xword	0x2ccc7788a0e6f49f
	.xword	0x371fe1a1b6153ec0
	.xword	0x32fc8399b716fee7
	.xword	0x2186cc8f3eae6b41
	.xword	0x0e30e689624d1754
	.xword	0x31700d9ae058956b
	.xword	0x57a5eacfa4628b1c
	.xword	0x23ddd0024f7f7934
	.xword	0x6c91f376225e2f15
	.xword	0xa4729365fdf0094a
	.xword	0xdbbddf1111bc37f0
	.xword	0x520ac3dad4c7dd47
	.xword	0xab0f7e53502718a3
	.xword	0x4a4ababbec827ece
	.xword	0x0dcf256dc87f0da2
	.xword	0xea7eeb40a0585013
	.xword	0xb0350ac4991e5931
	.xword	0x3debd7fb6869dcd1
	.xword	0x42e5498f5410125d
	.xword	0x1329c5f1e4352752
	.xword	0x2a1273393ce20c33
	.xword	0x09f9d1f6c3f355a9
	.xword	0x879d91f058e67ab9
	.xword	0xeff14de5d7562477
	.xword	0x9947289f03983eae
	.xword	0xca8ef3e3c9c99d91
	.xword	0x1598d9e7aebbfd3b
	.xword	0xa16589280857d76b
	.xword	0xc952e85456551082
	.xword	0xd0d26998f4e4ba35
	.xword	0xc767ab1def183809
	.xword	0x925a5efbf091e085
	.xword	0x5cc0badc05745417
	.xword	0xbafa8296445b53c0
	.xword	0x1677e8ac44cf5841
	.xword	0xc3760e8d3cac5677
	.xword	0xf1fa562a03df42f6
	.xword	0x561e652d6aa7a235
	.xword	0x863afa15a8e4c5f3
	.xword	0x5ef90dd6ce643e86
	.xword	0xbe94ba2a720a06fb
	.xword	0xbe32a3841f0f2df6
	.xword	0xb03332d429699178
	.xword	0xc1b453cb82086ffb
	.xword	0xcff3264fc10c4fd4
	.xword	0x8d9dc0f8f16fb49a
	.xword	0x7501c7c65ce278f4
	.xword	0x1ef82baddf425566
	.xword	0xbd83682c79a139b3
	.xword	0xe9daddb10d643f68
	.xword	0xd1723525eca9e71c
	.xword	0x01c5ac99ce139101
	.xword	0x5455180cdf9de7a4
	.xword	0x8d710474bd4e65c8
	.xword	0xeb8105228f69a4f4
	.xword	0xe98a2457fc01e633
	.xword	0x7f0d49e0cb313676
	.xword	0xc961646250a10df5
	.xword	0x9302ea98846a44a9
	.xword	0x77a76eef2c6ca4e9
	.xword	0x94cc1442a287522a
	.xword	0x6b2a411fa63d1168
	.xword	0x364f3f3454181b49
	.xword	0x0992bf8b80de1c5f
	.xword	0xa2b1d15dd75652dd
	.xword	0x670b6c86448dd0e9
	.xword	0x4eb31a04009006f4
	.xword	0x4e391d179d117665
	.xword	0x5dce9e7a5f81766e
	.xword	0x41e2cb372b2c041f
	.xword	0xab163cbb6464e277
	.xword	0x0dabd8846a460dac
	.xword	0x904d7d34f89955ce
	.xword	0xf010ddfe3dad32d2
	.xword	0xf013e5e33dcb7a18
	.xword	0x274cc20cac61c5ff
	.xword	0x921f905e9a9779a0
	.xword	0x5425930e82583268
	.xword	0xa62b1210b2e1d542
	.xword	0x01a41c3908727722
	.xword	0x35281e5171b72b5d
	.xword	0xb41d810ea158a131
	.xword	0xd8c4fb5f6f6e361e
	.xword	0x4f286f077e7a9d3f
	.xword	0x7e44db083071e3cc
	.xword	0xaa7e77a5fa81618d
	.xword	0xdd9df747ad8d5682
	.xword	0x9f5a09adc0ac08a9
	.xword	0x751e7d5b6f0b7e09
	.xword	0x163a79e6b25a0547
	.xword	0x61ded951dbf19e42
	.xword	0x39aa3c8fbc8d3d9d
	.xword	0xee6c00ef5612b5e2
	.xword	0xd812e08a125363fb
	.xword	0x71add0d88d1cdfe6
	.xword	0x0c97ad5b147e4795
	.xword	0xb6a8387625ade4c4
	.xword	0x4df17d632e4a2b78
	.xword	0xddaad1f0b848f8db
	.xword	0x615fb80f6c20e7a4
	.xword	0x43107ea9705e649a
	.xword	0xb425c9d8d8e0066d
	.xword	0x00af1f94561dd0d1
	.xword	0x7170d1907e7c5420
	.xword	0x72101ce8e6d49c8a
	.xword	0x0bac55dba4e17077
	.xword	0x405c44ba67596b40
	.xword	0xa68fef4f71312e38
	.xword	0x9416d8748d06aa5d
	.xword	0xd204449635765de7
	.xword	0x796abe438065c4c7
	.xword	0xde47c6a31d1a8056
	.xword	0x520d19dd4e78b9fd
	.xword	0x7937904033c42901
	.xword	0x73b9b737c75e22c5
	.align 0x8000
	.data
data_start_3:

	.xword	0x1d12e27998bb2356
	.xword	0x907d60e3de275cc8
	.xword	0x8acdddc159ad8115
	.xword	0xa83c8e2d5a815206
	.xword	0x1a4ae70e787e72ca
	.xword	0x41120adb0dea94b8
	.xword	0x5fb314cb1e6e5ac2
	.xword	0x0e074183d6a82943
	.xword	0xd75905237039a5fc
	.xword	0xd3c8219e82b862a6
	.xword	0x451c7ed8b843e3d0
	.xword	0x4fcdfd1c07012737
	.xword	0xf091894bb96d7465
	.xword	0xa06c52dd7c4f01bd
	.xword	0x7761636fea44a65d
	.xword	0x8a42905c7d2a247d
	.xword	0xd330c746d0643978
	.xword	0x3387de1a05c5d6f9
	.xword	0xe296eb8ae48bccf0
	.xword	0x4f6bd7458523749d
	.xword	0xb2a665f18cc253a1
	.xword	0x64fa1cfc1693a1ea
	.xword	0x5efd052be777ac09
	.xword	0x0443e4b72eb452cd
	.xword	0x9890130f47ae3420
	.xword	0x08b6e4d78f23d899
	.xword	0x223ebd9f09f3f95c
	.xword	0x98d1a7d69086e7d9
	.xword	0xdb37b894825e51da
	.xword	0x1a35197078ab3408
	.xword	0xd3b6e317208337a1
	.xword	0xcae96637e3ac2415
	.xword	0x0253fd4103212868
	.xword	0xd515a65f610cc715
	.xword	0x5873d0f176c4dd37
	.xword	0xda45f7f5cffab777
	.xword	0x02a5ee8b9ffab2dd
	.xword	0xcb072a395d9ca78e
	.xword	0xbf31677c2f36a8a9
	.xword	0x961c1c28a7d542fd
	.xword	0x876f7122316f4509
	.xword	0x88aadabcb0ecade3
	.xword	0x9b27853c5eee2a9d
	.xword	0x64a40603b666dacd
	.xword	0xdf2d8668cde01051
	.xword	0xa62dcf243bce7d6e
	.xword	0xcad68a30a32f65fa
	.xword	0x8f5bb5abd47080db
	.xword	0x43706ba67174dfb6
	.xword	0xa0c1cd4a53a1a108
	.xword	0x2b17e3e0c62097c2
	.xword	0x49d284dd9d21b90e
	.xword	0x33e03f6df6449f35
	.xword	0x04b9759b5caa47a0
	.xword	0x9f3eb90cef7ccd70
	.xword	0x91e1b9c8c508f336
	.xword	0xd178e2153f0a415c
	.xword	0xc46d71bfa70ec7f5
	.xword	0x045b369e7d906491
	.xword	0x25c64e8298c33905
	.xword	0xb6901ac38ca583f9
	.xword	0x4acf501335dfd157
	.xword	0x90b6b952c160dc8d
	.xword	0x7fc354f7f8fc6b0c
	.xword	0x1a32ba1fb0d89cd4
	.xword	0x5be572946e3cf158
	.xword	0xde9c27f089208bae
	.xword	0x68ce85ebe69d46b0
	.xword	0x5a73cb583da97599
	.xword	0xa26c698f235ec5ae
	.xword	0x68730536024179fc
	.xword	0xdaf408e81e4871c3
	.xword	0xfdb7f8eed1fdf51e
	.xword	0xa714473ba618af23
	.xword	0x6eab39b7d6407f20
	.xword	0xb879f770098ef3cc
	.xword	0x7d18b8028f2e7098
	.xword	0xe4dc0b85173699ce
	.xword	0x5fa68fe8bf6558fb
	.xword	0x27aaf8951a2f73f9
	.xword	0x0904778273fcce06
	.xword	0xd4155488530c61bf
	.xword	0x272666adbde8c5eb
	.xword	0x09dcc264537bbe8c
	.xword	0x45f382f2243fe9e9
	.xword	0xa5397840ca09bc28
	.xword	0x0310a05cbbdc01f2
	.xword	0xbae272b94f010c0f
	.xword	0x479c078a00510431
	.xword	0xc687aede6b4a4fc7
	.xword	0xd7d61498420b1c91
	.xword	0x77c2c08cd2f307a1
	.xword	0x95627b1d3bf89d57
	.xword	0xa789019107d366b6
	.xword	0x267ea28bf87479eb
	.xword	0x2c50d86e5056edf9
	.xword	0xdc2b1225e73d2c00
	.xword	0xdc4a5094c4c84bf3
	.xword	0x709da768ddbea3a4
	.xword	0xf37f1ace509a24eb
	.xword	0xb2bc953c0e569c4a
	.xword	0x03a77bdc245f80be
	.xword	0x88139441b6cd04cb
	.xword	0x5e8096abbffb4640
	.xword	0xd016ddf89e9e38d5
	.xword	0x191644ba00e0bd2b
	.xword	0x9bfcd692ebbc23e4
	.xword	0xee3d163e45829d16
	.xword	0x5f8de42ec31b04bb
	.xword	0x3c34cf4b01d0b5b3
	.xword	0xdf1b345271ff441b
	.xword	0x999d40b252edade7
	.xword	0x53b318b1206d411b
	.xword	0x79fbf664f918bae5
	.xword	0x859aeaf73bc75912
	.xword	0x6e1e693312e7f728
	.xword	0x3af325c122909bd2
	.xword	0x613f86311592ec7e
	.xword	0x4f0644eff6b4f8e9
	.xword	0x658aacccef5ac09c
	.xword	0xd8c8f05fcfa5143e
	.xword	0x39631a7c3464c49e
	.xword	0x94240a50a3078a4e
	.xword	0x4e7867b2e11d5dc3
	.xword	0xe53b4109828a7cd1
	.xword	0x83dc24b1b6cfd23f
	.xword	0xb7170cdcd2dbe9ce
	.xword	0x3ff0e50f067071a3
	.xword	0x36388f9d298d8601
	.xword	0xc037228707751a53
	.xword	0x4dae2bef57654530
	.xword	0xcfdd8334d19b84b8
	.xword	0x3be3f1a3b3d85d0b
	.xword	0x395ac5f8168e4bdd
	.xword	0xe7502dcd2a87f8f2
	.xword	0x130372333a342d2b
	.xword	0x085fc899dfa135ef
	.xword	0x705961dbcf2b0c02
	.xword	0xbc084342ee98f3fe
	.xword	0x4500519ac0a435d0
	.xword	0x495ede9abf291c9a
	.xword	0x30ae513c9641f246
	.xword	0x195ac67c1f138cdf
	.xword	0x59749db084fc8c6f
	.xword	0x195d93ba31ca8e99
	.xword	0x6ba2c99839cb8285
	.xword	0x651ea9c8936225e3
	.xword	0x8815ec573f719cd8
	.xword	0xc8d67501ac4078c9
	.xword	0x7bc8aa3eb64781b4
	.xword	0xdc52cffddd83ce8b
	.xword	0xc95dea094b3904e2
	.xword	0x539d273cd58ec567
	.xword	0xb1da241d42745616
	.xword	0x049851108ce7f8ad
	.xword	0x342ce610e6c40bcc
	.xword	0x1a1674ccdafe9bd1
	.xword	0x9959316e9545a592
	.xword	0x3c4d63640cb08cca
	.xword	0xa056e586cd5b4333
	.xword	0x0a7479ed84c881b7
	.xword	0x41e69b5cb78783f6
	.xword	0xe63710ab7714e383
	.xword	0x04a609dbaba05cc4
	.xword	0xa59c471c5a9a24c0
	.xword	0x0a41512720981316
	.xword	0xbb24c93855ce8fcf
	.xword	0x04b914ed343bc1d1
	.xword	0xc14d041e35f5e690
	.xword	0x3e434f7492c6314e
	.xword	0xd6fa31975501a027
	.xword	0xdcca877284f1cb6c
	.xword	0xd50fd4cb432c7742
	.xword	0xc245f4bbe95235a9
	.xword	0xaa78d448781d1671
	.xword	0xaaa6d72a545ccdfd
	.xword	0x9885cde462f88d16
	.xword	0xde9a0322cd671f41
	.xword	0x118db164b27a1858
	.xword	0xdfcf4f842fe9c0b6
	.xword	0x4bb39131ed17356a
	.xword	0xe1c8470c0e014e12
	.xword	0xdbf4b12f1148fc9a
	.xword	0xac276a16cd7d12b1
	.xword	0x8bb58a6bb48f9c84
	.xword	0x89cc2fa62ef02885
	.xword	0x3348eaedc52e45b7
	.xword	0x8dee43775f551fd0
	.xword	0x0962fa498e9dbab7
	.xword	0x15e4269299f4c950
	.xword	0xe4f8ddcefd9a1c49
	.xword	0xaa503f682b083a9f
	.xword	0x0d80245919532515
	.xword	0xa696855383c43b62
	.xword	0x4df75d2ba5421a3c
	.xword	0xfbe1176fa797a49a
	.xword	0x0b662d97869581fb
	.xword	0xe773eb5840fda6ef
	.xword	0x6fc422f7f74a7a26
	.xword	0xc6a2d1b3c895facf
	.xword	0xbab870704f4d52c6
	.xword	0x4493cf4fa2dc0ccb
	.xword	0xea2dd39c48e88bcf
	.xword	0x0b2605295912ec33
	.xword	0xff0a922ad3ff31fa
	.xword	0x21e805a5065c7872
	.xword	0x02d9157fb6446473
	.xword	0x644d134b4c3f45e0
	.xword	0xad469842b77105d8
	.xword	0x528ef3af8d2270dd
	.xword	0x135b9a8f2ed0ef77
	.xword	0x0c320ac964bdb486
	.xword	0xc89a6232212ecff8
	.xword	0x1c4cf75b3762bda6
	.xword	0xb4df3dd41ebb85f8
	.xword	0x6823c94b189b71dc
	.xword	0x37639091fe61f38b
	.xword	0xa78eba5184e8df29
	.xword	0xb195552bf2ec15a9
	.xword	0xc569cd3c79007657
	.xword	0xd2b28ab5c0a49cc6
	.xword	0xa52b20654e05a9b1
	.xword	0x42af271d4ddcaae3
	.xword	0x323cef96e3be8ad7
	.xword	0xb3c9673865b42770
	.xword	0x93a3355f04f247cb
	.xword	0x52620084b0c3d059
	.xword	0x7fdafbd63b717a29
	.xword	0xf824e89102fdd6a7
	.xword	0x44df610128ef0542
	.xword	0x89659009ec6b1128
	.xword	0x47bca3060da94c6b
	.xword	0x2deee6d86a9f1d62
	.xword	0x38d95fd3589c8f58
	.xword	0xedeb3f795e80b59c
	.xword	0x4afa4dc6e76139b7
	.xword	0xf6418585b63a40af
	.xword	0x97adf36167c6688c
	.xword	0x1a2ce47e1e780d24
	.xword	0x367fbe9c1de029af
	.xword	0x738ce40a0df08fc7
	.xword	0xe5f3630253f90c6a
	.xword	0x5aa221d4ce34ad0a
	.xword	0x5d25a2102941bf47
	.xword	0x3f9fb2168c65dfa8
	.xword	0x4b0890237799bbbf
	.xword	0x1a079dd08f0b067d
	.xword	0x4bc577b80c35cf72
	.xword	0x010203e960e9addd
	.xword	0x5a8f82d4cbccb51f
	.xword	0x621b85c49e9990ba
	.xword	0xd3ea8b87d2dcc5f4
	.xword	0x885bbf0b63265748
	.xword	0xf5fef5cd17734d62
	.xword	0xad4fcc7aa97f257c
	.xword	0xb725ca01bab15d39
	.align 0x10000
	.data
data_start_4:

	.xword	0xd5662049c78c3aa1
	.xword	0xa945f45a2cd665e6
	.xword	0x971f747854bd2473
	.xword	0x9f1d0f2e108b1f2f
	.xword	0x50ae62d30470df7b
	.xword	0x2d7c52a12c4b94fa
	.xword	0xfecae13a3d55e0e3
	.xword	0x534c59183ea7865f
	.xword	0x915fae1a3d1885d7
	.xword	0xb931ece4b90ec120
	.xword	0x82c2fa8f43d7a5ba
	.xword	0xef9c7633913d2985
	.xword	0x6e35c211d09b5ab8
	.xword	0x86fea6ded9e8fd05
	.xword	0x61d954f1e8abfb07
	.xword	0xf2c4d8615f9dbae6
	.xword	0x254867be271eef76
	.xword	0x1424c5dea820332a
	.xword	0x8464d2654cd4a1d7
	.xword	0xda9d58cf25a93207
	.xword	0x3bdaed3c1c0e73da
	.xword	0xff69756c03ea5cf5
	.xword	0x509cd49620226982
	.xword	0x2579312c017ffae1
	.xword	0x32e249b0c2dfcb3b
	.xword	0x512859d8a7e6b0e9
	.xword	0x5827e1e10bc63120
	.xword	0x17596d193465f2fa
	.xword	0x6052dbce0d805e93
	.xword	0x9fd1cbf4d61cf026
	.xword	0x4ce4fd016d710b90
	.xword	0x9d5e887869c3bd57
	.xword	0x8c04f90e1c497466
	.xword	0x85f3a7dcbb842d68
	.xword	0xc4a2ff7d168430ad
	.xword	0x7e664039295ffa8b
	.xword	0x591cc067a9c14c78
	.xword	0x5df8c3324882a1eb
	.xword	0xa418b8f1a7a126bc
	.xword	0x463dd2d48d7f58fd
	.xword	0x3d4a34d9ba4f5243
	.xword	0x732a6475bccd2707
	.xword	0x95af6fb26e29aa51
	.xword	0xa28ea06a7bf78885
	.xword	0xbad52cb0de317d61
	.xword	0xae2caa6ed4fe7caa
	.xword	0xe52ad093660fcaa7
	.xword	0xf3814690c8cd029b
	.xword	0xde09d1570f6b2a85
	.xword	0x73513ee18a482367
	.xword	0x460c4cd4bb937b29
	.xword	0x15b7acecfc234914
	.xword	0x6c869f538c0ebd31
	.xword	0x37d37f7e30710396
	.xword	0x00d0e8c7a347e382
	.xword	0xf4003cc9f56ee488
	.xword	0x87a86a0feeafd5c2
	.xword	0x943104bc9bd120f4
	.xword	0xbcb234c579c31c60
	.xword	0xd0d1fdd73e5768ed
	.xword	0xbe87b91fac317287
	.xword	0xc9916c33edc9b82f
	.xword	0xbfec70e8c8f16a7c
	.xword	0x823395b2e7eb3e57
	.xword	0xfb112b180107072d
	.xword	0x7d33925ec21118af
	.xword	0x0244aceaef674860
	.xword	0x5465bba5dbe4c223
	.xword	0xf7ed3c9bc53cc363
	.xword	0x670a3c197e48af46
	.xword	0x4f7a1ac78a7dc2c4
	.xword	0xfc6bcb872544b943
	.xword	0x63f05dfb5ec548e7
	.xword	0x22dc9a1fe4dcf30d
	.xword	0x098a9303e414d944
	.xword	0x57b00aef5da2211d
	.xword	0xce05c0bd81d5f198
	.xword	0x957abd514b4b5e64
	.xword	0x80eb4f7171266b32
	.xword	0xe5501bb37e38420a
	.xword	0xa653d3c0a9641faf
	.xword	0x176dc84357505310
	.xword	0x39a60ebefd1c38a5
	.xword	0x3c8b86989aa7ec51
	.xword	0x264a8a0c01c6a4b3
	.xword	0x15381860582dc7ba
	.xword	0x1730a5fbce0a07d3
	.xword	0x4e5a3148862be47a
	.xword	0xa070d2993b392af3
	.xword	0x8718a2a2f97f5acd
	.xword	0xc66e444c15e52978
	.xword	0xdfd28e567b04b8a2
	.xword	0xc127b5ef475f6dd4
	.xword	0xc3a0d29fa463fef1
	.xword	0x32c55141b235d8c7
	.xword	0x65545b400c54a428
	.xword	0x0bbc9db50607b6c2
	.xword	0xdb94811b2008ee57
	.xword	0x8e11de16a675bb28
	.xword	0x29f2774d6cc07818
	.xword	0x01b96f744f1ebf83
	.xword	0x4246fbdd4a3791bd
	.xword	0x7a283170a7ca4001
	.xword	0xc53c017283e29db6
	.xword	0x8e0c9fe978778d71
	.xword	0x1ef30f69baefaeda
	.xword	0x3fcb5d11ba8258ba
	.xword	0x3399aa5e0c40d909
	.xword	0x070075fbbc5a2459
	.xword	0xc47dd6656a7a0b1a
	.xword	0xe7023c446e5e2e06
	.xword	0x4741a22d475cec5d
	.xword	0x23e821e307706550
	.xword	0xde2cd8d3a5d7a983
	.xword	0x8e7bf3a0cd548005
	.xword	0x44b3c98110c2d48c
	.xword	0x5a4668ca23087585
	.xword	0x4ceec4bd89227a0a
	.xword	0xe14d4dfe26e728b6
	.xword	0x8454fa60f4ca3315
	.xword	0xfcbe7d0109318a7a
	.xword	0x375dc5155ade446c
	.xword	0x44c9cbeb5fd21f5f
	.xword	0x8c12ce8754b675e2
	.xword	0xa6012028f409b2b4
	.xword	0xd13a016358e7592d
	.xword	0x650c25095473c6ff
	.xword	0x2285b4aaa02c30b6
	.xword	0xaf00a520c27c7204
	.xword	0x54d6b88d787d58e3
	.xword	0x095d8c29a7dbab1e
	.xword	0xcad64d0fc404636c
	.xword	0x6223a51a81d6714f
	.xword	0xc14649df1b7b640e
	.xword	0xf834257f76914de9
	.xword	0x9e7f0e729ef2294a
	.xword	0x21afe54b52223691
	.xword	0x6ba7f44f3e9faa98
	.xword	0x63495a39eb19a65b
	.xword	0xaebf638778d40261
	.xword	0x05a5a6805100a3b0
	.xword	0x2ab91e2b34bcf306
	.xword	0x769fce756dfd0f42
	.xword	0x77b95a5f0e5a4a3b
	.xword	0xd6ea05f2c56f280a
	.xword	0x194aaa3fe8e0a8c1
	.xword	0xee0569fbdb9437d7
	.xword	0x8f1c00d0c36a0fe8
	.xword	0xe3cd92babe49a16e
	.xword	0x49ec6388cd77e8a6
	.xword	0xab34bce774212666
	.xword	0x8e4559464acafcf8
	.xword	0x628a928638f69bb4
	.xword	0x9039eec4f336142f
	.xword	0x8bc6e511cac2d4b3
	.xword	0x7410da45d474c10f
	.xword	0x36a0e855007be247
	.xword	0xdc58e6c18d19a8ed
	.xword	0xf091c9e72e26b0f4
	.xword	0xae13c51e1f98aa57
	.xword	0xc8e2cca344054b7e
	.xword	0x4a7f0e40db519583
	.xword	0x375d4129f86d4530
	.xword	0x41357ec237144eb3
	.xword	0x07c0ccd96a7157c3
	.xword	0x2c870560ab4ae868
	.xword	0xd4704e846b531171
	.xword	0x8fa3e8359483857b
	.xword	0x3fe0a48570666ee7
	.xword	0x556709a3bcb9da15
	.xword	0x249268d963a5c448
	.xword	0xa2a7783b406f7893
	.xword	0x836c4f32d1dc4c95
	.xword	0x84e1e472b6449570
	.xword	0x67a82318773451a4
	.xword	0x261ef45bad2b8772
	.xword	0x76123f4af87aac11
	.xword	0x730689c5410d6377
	.xword	0x4128b5d4eb3c5c03
	.xword	0x50561bc2f74faa48
	.xword	0x05718b71727aad65
	.xword	0x66888e0a540e95ba
	.xword	0xf1ac92bdd1ddfe05
	.xword	0x84ea314708e69b6e
	.xword	0x78caccf7f9163876
	.xword	0xa73224ba7d2fdb3d
	.xword	0x6f3303121bd84fc2
	.xword	0xc727813a9cdde0b2
	.xword	0xba6022c8e3154d11
	.xword	0x5fcecdc4ead2c9f0
	.xword	0x6583bb566bf6f11e
	.xword	0xa8ffb7d70cac1c6e
	.xword	0x46ba48893f7381ac
	.xword	0x88052e2a5aff4eb7
	.xword	0x3f62036453226798
	.xword	0xcce7e803128942aa
	.xword	0xad2c3cf3167d0bd9
	.xword	0x8510eaa7cf150b4d
	.xword	0x3fc738e957276d22
	.xword	0xdc7165a5a8107270
	.xword	0xe2c827693d8d82ff
	.xword	0x6fe31d3c0b120bb3
	.xword	0x96654d1c92a7d6ea
	.xword	0x409b811c7f27176a
	.xword	0xd301f22590214961
	.xword	0xa0f7e4ea394d54e9
	.xword	0x341744871c3a423b
	.xword	0xd50a5afc33bd1879
	.xword	0x77bf4bf324971810
	.xword	0xf2efc4111edb0ac7
	.xword	0xa44cdc9616cc7786
	.xword	0x030d6410e40af951
	.xword	0xa34172117c07cd51
	.xword	0x0972a12b4b033ddc
	.xword	0xb7eb70ac98ece135
	.xword	0x60586dfdf05a0b4b
	.xword	0xcddc488853cef345
	.xword	0x4c9272cdbda1edb6
	.xword	0x595bcc97ebf9d492
	.xword	0x10db9541de42850d
	.xword	0x4d69759a6272fe57
	.xword	0x9cfe2e9163ecff66
	.xword	0xb1119beeb378529c
	.xword	0xeb5a784eef9b08f5
	.xword	0xaa8a29f79c926aab
	.xword	0xea1bc77c6550ff80
	.xword	0x9a7d3be91d63d011
	.xword	0xf315ae704535facb
	.xword	0xe7034e40ba7e6789
	.xword	0x8ab791d84d9519e6
	.xword	0xf9b3bddb17208dbd
	.xword	0x3ffcea68702d5e6a
	.xword	0x6259e9b8c2ae5923
	.xword	0x55816aba543a2bf0
	.xword	0x68072492d0725b75
	.xword	0x3086831ef4c53ea7
	.xword	0x84d79f96c8d1c094
	.xword	0xd4340cd02a341ffa
	.xword	0xd27d21dd16369d19
	.xword	0x1ad2260573182a5b
	.xword	0xed23022240addf27
	.xword	0x3aec09425dd433dd
	.xword	0x124a41267514bcc6
	.xword	0xae058b72575c8909
	.xword	0x1ba77be2980426f1
	.xword	0x289c20128c02571b
	.xword	0x34d7605077aaed30
	.xword	0x087a63cbeb5c107d
	.xword	0xfc429193c2b26fbe
	.xword	0x805d7be1131b7add
	.xword	0x3a1bc82989f6f587
	.xword	0xd471981e3add8cb7
	.xword	0xa487271613c8b10c
	.xword	0x90a859fa517c377a
	.xword	0xa2dd8f2bf4504f96
	.xword	0x816e25195655f062
	.align 0x20000
	.data
data_start_5:

	.xword	0x8e29da4636090453
	.xword	0xfb936cdc1c07b66a
	.xword	0xac5d8f22334ba571
	.xword	0xa90689e3fe229c47
	.xword	0xbfe2cefc4267740b
	.xword	0x78909f793db0cebf
	.xword	0xc3c604d5b901efc5
	.xword	0x48cb86bb95c3eaf2
	.xword	0xf38dbdd0a2f2c2a7
	.xword	0xb5db5d75239cb711
	.xword	0xa2a6b85e7617bded
	.xword	0x3127c2ec94d46c66
	.xword	0x0ad776a0a79bf70d
	.xword	0x10aab411ed2883a2
	.xword	0x0e81ce10ca233cfb
	.xword	0x03ed2bcd23ae1256
	.xword	0xb9e78e064e64b357
	.xword	0xd3c0405441c9bb46
	.xword	0x980732cf257ddfb9
	.xword	0x1d22d542c2e88292
	.xword	0x186b37312155f0d0
	.xword	0xcf97e5cbf59470f3
	.xword	0x70bdabab54e1e0a6
	.xword	0xcb5b1141805c7ad0
	.xword	0x8b02d8167352a29c
	.xword	0xe8bc62628282a978
	.xword	0x58c2f7b60baad5dd
	.xword	0x5917e78ee8213835
	.xword	0x2120e33fed64f2a3
	.xword	0x9dc0bd3dccbeff58
	.xword	0x42ad17f56353be3b
	.xword	0x24b8e2ddf9e6689b
	.xword	0x8c583a32dd3238c6
	.xword	0xdafbfe7bc7336371
	.xword	0xae2496b3ceb6b198
	.xword	0x173b56c4435587f9
	.xword	0xb9d9c9c5346f93e7
	.xword	0x722ca443b67aba5c
	.xword	0xee51296553f5910a
	.xword	0x56943dc9f3483d23
	.xword	0x291b1dc9a98de9e2
	.xword	0x23a3b7efead7f4ff
	.xword	0xc5641e508d9490b1
	.xword	0x6a984e608d810afe
	.xword	0x0191f4bad7052ac9
	.xword	0x14fcfd9eb75720d2
	.xword	0xc5484cf318006516
	.xword	0x144ee1a9b601ef53
	.xword	0xcddf125cbe29d1fe
	.xword	0xc07841840e964ed5
	.xword	0xd7911f81969d5081
	.xword	0x2270f705eeca9239
	.xword	0xb7c74436a088063c
	.xword	0x2305432f3e52c5cb
	.xword	0x94be13ca4d8fa7d9
	.xword	0xbf31cf1e6a619c3d
	.xword	0x57b56a744e7b6164
	.xword	0x6f1faf00e4bca7ab
	.xword	0xf21c2d900bf4555b
	.xword	0xc57e4548d507ece0
	.xword	0x44a2e8c58b2f1306
	.xword	0x0ac372b9d0b95039
	.xword	0x55511e90bf3447fd
	.xword	0x5c730f8884ce226a
	.xword	0x242d41a784c8868b
	.xword	0x82d74a3201ef6744
	.xword	0x0bccd01e95a2982e
	.xword	0x6014e8902ebb8287
	.xword	0xb1a9f77a4f77a709
	.xword	0x7f12ddd9f277b6d9
	.xword	0x249c14e6da692bf9
	.xword	0xcecd50d11e33559e
	.xword	0xe83ce422ec673c57
	.xword	0xf89a43f1f4595ae1
	.xword	0x7fdbd7df0011e211
	.xword	0x6fbbe88663bb7579
	.xword	0x8d889777d9fc40f5
	.xword	0x53188dc7d9726f2f
	.xword	0x453d6f571c2d9420
	.xword	0x8748f025f1e7ba4d
	.xword	0x28d7e722dfc9d0f3
	.xword	0x1107f17cde65dd75
	.xword	0x2d3e5d331a3a1eea
	.xword	0x10e3049d7f1de2a4
	.xword	0xb4e3ea688eb0e172
	.xword	0xd702e1aaf140e136
	.xword	0xf1d9a208a32e2867
	.xword	0x3986fafdb6630ce0
	.xword	0xca1f7a06ac7a10c6
	.xword	0xa99f916f375c6a29
	.xword	0x6c69e46a62bf4540
	.xword	0xbb05e7039547df8e
	.xword	0x0ff5a66a6889264d
	.xword	0xe804fc1beb093652
	.xword	0xe76909a60408dea8
	.xword	0x6f571cd37ef0612a
	.xword	0x510776ada9469a18
	.xword	0xc3143ab0427aaa48
	.xword	0xbb3f90c63efd6d5b
	.xword	0xbcfc3c7135a2cae9
	.xword	0x58925ff5d2cf74e3
	.xword	0x3f1681f447fe19fd
	.xword	0xffc50227ac382429
	.xword	0xfa9c11ded57f08c1
	.xword	0xe9f70a2b5ff00cbe
	.xword	0x1b5d2f756ffb1773
	.xword	0x106ce1af6b12f14f
	.xword	0x115702daef646fcf
	.xword	0xd25cd6244691e9b0
	.xword	0x00dc346aa7af241b
	.xword	0xf0b420afecd85dbf
	.xword	0xf1edf374c081dbdd
	.xword	0x79bfe6ba3cb6f460
	.xword	0xd33e4bee9e477917
	.xword	0x910dcf33f18d7be9
	.xword	0xc63a12c984cde186
	.xword	0x475aed7ccac19139
	.xword	0x946338cc2ed89200
	.xword	0x907a55e95ed2861d
	.xword	0x23d0453a2ba4e743
	.xword	0x7acaad51a55db4b2
	.xword	0xc568b34f66c8f168
	.xword	0x9ac870f0438f4f15
	.xword	0x7918b5ec61215b8d
	.xword	0x4d887d1c91644fe3
	.xword	0xfea095bae37e4eb3
	.xword	0x5db6f11726581cda
	.xword	0x76e2a7e9c468087c
	.xword	0xedce37e88cf56bcd
	.xword	0xc97551d4902943b2
	.xword	0x1d8dbbae2ed559aa
	.xword	0x350e077a99e35050
	.xword	0x1c52f01957bd8d46
	.xword	0x9a8902b671f31ed8
	.xword	0xd138897ed5d48107
	.xword	0xaccb763e038a7bcb
	.xword	0x36cf5945169085fb
	.xword	0xe9da0680b0d27c8b
	.xword	0xefdd891793c5cc1b
	.xword	0xcebdb47904241122
	.xword	0x8a675ae4bb78fd9a
	.xword	0x7057ac3f273e01e0
	.xword	0x811044d1f61f72a2
	.xword	0xece35cfb50ae1fa1
	.xword	0xd90d80836a0ea98c
	.xword	0x9fc48e94f58f1ec5
	.xword	0x2c4038468e68c352
	.xword	0x38cc09537b190f6f
	.xword	0x897bd8e45d6d6012
	.xword	0x265324acba2126f5
	.xword	0xbb52fafbb6e353f8
	.xword	0xbc1a2b31ad2c942e
	.xword	0x3df5faac81aa7d0a
	.xword	0x5e20d7d8a2f1c45c
	.xword	0x132a65c126e405f9
	.xword	0xe62bc30ba06b99b7
	.xword	0x1aa267ef73d4a81c
	.xword	0x8fb818e99ceaf998
	.xword	0xb4f2f919fec0f126
	.xword	0x0019426e0c377c8f
	.xword	0x0df9c62571c73fc1
	.xword	0x7f2034eb20ab7080
	.xword	0xfe9068b8a4809ab4
	.xword	0x4c707f76b9600994
	.xword	0xd5902fc994e182b2
	.xword	0x1ec71043893ce12c
	.xword	0x3db304ecb9db9a77
	.xword	0x3184b79967087bc5
	.xword	0x0b679aa5a3f3550f
	.xword	0xa3eb08646cabba7b
	.xword	0x5fa6b46897bf092b
	.xword	0xaf0a5dfe6f7579d4
	.xword	0x0d9c5406da83540f
	.xword	0x39ff67793fee7a2c
	.xword	0x5326a90e9089a6c2
	.xword	0xd9246142665c07e6
	.xword	0x7cb1f4b78dbeda21
	.xword	0x138c3b51ddfa54fa
	.xword	0xb41d57bb298cbc7d
	.xword	0xa948e6a127d0457c
	.xword	0xf7c30ec79730d344
	.xword	0xd9d0e7bb526b6e2a
	.xword	0x5251511ef864c9ae
	.xword	0x96b056ba3077b65b
	.xword	0x1596ef7977a2f7e0
	.xword	0x39cc6541e4d0203b
	.xword	0xac6539a51db68b5a
	.xword	0x2a6baa38da92fdc9
	.xword	0x19eeb71725382fa5
	.xword	0x5e053f904b2b829c
	.xword	0x12fcc36db92ccca3
	.xword	0xe025406facc6eca7
	.xword	0x95a1e0034ecebbe0
	.xword	0xb32ce8873e9d3593
	.xword	0xf60337a4babbd827
	.xword	0x8dcf5ce439c91512
	.xword	0xa7ec1697c2fa4f0e
	.xword	0x17d37ebbd1287138
	.xword	0x5e93f507fba6a6df
	.xword	0xb41a326b4b67f7e1
	.xword	0x9c8ed046f197b724
	.xword	0x8cb8433e12a562c4
	.xword	0x04c375d3e16921bc
	.xword	0xc984b0fb6f442058
	.xword	0x8223974ae2f41fd8
	.xword	0xd63b4ed023f61443
	.xword	0x3d32dbc0c4d77568
	.xword	0xe8c8f4dbf611620c
	.xword	0xc20d4846d07817c8
	.xword	0x02593e8cae5d9d2c
	.xword	0xaf901548b1d11237
	.xword	0xd049a0350e397a97
	.xword	0x680ce511c88dac11
	.xword	0x02c00f3cfc538612
	.xword	0xc6b3deb18bfef9fd
	.xword	0x9bca6c5ca5b9a17b
	.xword	0x127e847b2dd24bd2
	.xword	0x12e78e45a57f2cce
	.xword	0x9862e5f2a0a3081b
	.xword	0x5dbce1174956aba6
	.xword	0x49ff92498757267e
	.xword	0x4c2c0b8b5a2cf399
	.xword	0x8d271b7f2556e0a5
	.xword	0x5ba7e9f02ae14ec9
	.xword	0xacf082ee3f988923
	.xword	0x6a98a32354a0f4f8
	.xword	0x76a0b52b50c143bb
	.xword	0x445a328bea662b44
	.xword	0x8dc1c421379cc3a2
	.xword	0x24ac84500dc3ea62
	.xword	0x38d53a93abae38db
	.xword	0x5c2c40dfcecc9541
	.xword	0x80f16970a29bcd5b
	.xword	0xcff163ee264ab051
	.xword	0x73ee602f7eacb62d
	.xword	0xf3844c5b46b63494
	.xword	0x54ef6f662115949f
	.xword	0x6a5ddb062c0a3c8a
	.xword	0xe20aa648dcb77474
	.xword	0x498d5721394df664
	.xword	0xfbe42f45264a6eae
	.xword	0x9ad68bce4524b370
	.xword	0xa0509dec879250b6
	.xword	0x8ee7a5edfe4adcb3
	.xword	0xb8d28d3d9d684c3f
	.xword	0xd81acad001498c77
	.xword	0x9703dcd606932e2d
	.xword	0x1946ab99533a4abe
	.xword	0x0092115cd1695a50
	.xword	0x593d45ea6aba966e
	.xword	0x1b0fd9bf2efb9081
	.xword	0x7408dad6d631087b
	.xword	0x413147c50c949b79
	.xword	0x1ee16dfe0d20d96d
	.xword	0x4481e4ed21d36bfd
	.xword	0x1a48e4084db02e0c
	.align 0x40000
	.data
data_start_6:

	.xword	0x6566ccf87092946f
	.xword	0x271cd4776ecf322d
	.xword	0x3fae8ef564c758af
	.xword	0x9acee5a8c773cbe7
	.xword	0x75c3133a660ac5ab
	.xword	0x62f32de9d4043813
	.xword	0x7047863b5fbce2bd
	.xword	0x69b998a0d0553df1
	.xword	0xb6f45fc53aa4a56e
	.xword	0xb9bfc53e14c34ab8
	.xword	0x93afd1c64e71d635
	.xword	0x1ed6e6475552749a
	.xword	0xaf14aa14ea79189c
	.xword	0x1ab79fa7bf191abf
	.xword	0x5ad2d3aca86a8860
	.xword	0x9a6f48879e08cba2
	.xword	0x921496b8b4a982ea
	.xword	0xe97d5f2b35b0e15e
	.xword	0x17cac888bd386008
	.xword	0x5cc7780bad361f8e
	.xword	0x13841e60a70ef1bb
	.xword	0xb1148e0a766298f8
	.xword	0x40cc8a28e9a144d8
	.xword	0xbb4b40ff9e2f979e
	.xword	0x12d8e3abb78fd5b2
	.xword	0x2805b8db47f781f3
	.xword	0x7a61c3549a41738d
	.xword	0xd5145ac2651f904f
	.xword	0x1a42c939c7a202c2
	.xword	0x7aa4fa3938960429
	.xword	0x57157d83428b17c2
	.xword	0xd7cd2bb34305212a
	.xword	0x6414784049c94c6d
	.xword	0xe99caa5481b0d587
	.xword	0xcd50500f66acfbca
	.xword	0x10bf45be508f9a87
	.xword	0x49048cd2be80b86f
	.xword	0xb74e7133b208f9c5
	.xword	0xb208c3eb2c50a8cb
	.xword	0x2a83618d469d5522
	.xword	0x0cc3debb783ca4ef
	.xword	0x05885c54c7b43c90
	.xword	0xd95b681dd531ed54
	.xword	0x53bfddcee51ef13c
	.xword	0xc7b3ea8b8d6d95e4
	.xword	0x46af6fed6c10ea6b
	.xword	0xfd67ced238236634
	.xword	0xaf326e6cf014a9ca
	.xword	0x7372775fbbd860f2
	.xword	0x42059cdcbcf60ac7
	.xword	0xcd29a1116adbac06
	.xword	0xbb9690937c32f85a
	.xword	0x4ea39314d484fba9
	.xword	0xe47a6197a669df69
	.xword	0xa67b6c8730d9bb27
	.xword	0xc5ee4cd8a7769669
	.xword	0xbc30a7a47e78e422
	.xword	0xc07c94f1690c9afd
	.xword	0x97ce2d4cc8569dd4
	.xword	0x4cc006405fe4c1fd
	.xword	0x5a6a67b909d22087
	.xword	0xcdd1044e6719204e
	.xword	0x8862dc8adeb9b33a
	.xword	0xa68ac7287a6920f1
	.xword	0x7ef1048e3a7251e9
	.xword	0xbeca19550a90b91f
	.xword	0xb0a0607d0315978d
	.xword	0x0a19ef9d00aacb0e
	.xword	0x016be1fadd9b6c01
	.xword	0x3b9d97f41e9c38ae
	.xword	0x11d9c7662d4c5073
	.xword	0x77cf985ae50eca03
	.xword	0xbd6269cd8b1f63ed
	.xword	0x809e6c7c0f9f9447
	.xword	0xd760e8d5420d9370
	.xword	0x3e475b0f858c3ce4
	.xword	0x071ba29e9fa9b235
	.xword	0xc372cfbd2bcc94d7
	.xword	0xb84e881107e83a11
	.xword	0x9e8620fdbbf1ab60
	.xword	0x70798675ac8bdeb5
	.xword	0x91da40c7965d4118
	.xword	0xd4728444f6342a32
	.xword	0xdb6a6c5b23367d3b
	.xword	0x3718ee0b3cc78ce3
	.xword	0x16d975da09dd1d76
	.xword	0x17a013710f93781d
	.xword	0xd4f714600c28d5f3
	.xword	0xc836e0ea6d5487bf
	.xword	0x2a146322385c91bb
	.xword	0xf2ce317290d0bf25
	.xword	0xfe1fcf4bdb54ab8f
	.xword	0x3c71df228a76c63d
	.xword	0xf48a62be7898cb01
	.xword	0x3199072b79181114
	.xword	0x5a4e3bbd42899792
	.xword	0xff1677718b77951d
	.xword	0x58e1a17c5dece4ac
	.xword	0xc6dfb132748e8579
	.xword	0x1327e87828a240c0
	.xword	0x3e17eacaee619e26
	.xword	0x175e0584c3bd469d
	.xword	0xc6cfe58df5c4bfd2
	.xword	0x321f7217a257ce92
	.xword	0x926a448c6a3f5905
	.xword	0x1ad825f6200fd02f
	.xword	0x0ef3dba82bb7049c
	.xword	0xafc7adec8b2a81c6
	.xword	0x96ba7b71a5f51ab1
	.xword	0x4b483821e26047bd
	.xword	0xede3003a32b9ca86
	.xword	0x484b6b777772d187
	.xword	0x8e1a0b7fcf7f939b
	.xword	0x874282602f1d6817
	.xword	0x4202fcac4e15f817
	.xword	0xbb28d9c651acf881
	.xword	0xb799ef09b0d9be43
	.xword	0x5fcd61e28fb27174
	.xword	0x904fd03c92e93a4e
	.xword	0x2c1537d51cc3e280
	.xword	0xbd729cb65f78e70a
	.xword	0xcb23d31dd8fa385b
	.xword	0xa8292bf6bcea4f6a
	.xword	0xd6adcabaa85559c6
	.xword	0xaabc2bc743fc4ad1
	.xword	0xbc08132f032f94f4
	.xword	0x447532207e304e7f
	.xword	0x5de6599e5cfd2925
	.xword	0x07fc6d21edae7406
	.xword	0xcdc3b64cdffe9cbf
	.xword	0x8a687a7557cace5c
	.xword	0x56ab3c26e59843ec
	.xword	0x27bb6df6f428e450
	.xword	0x0c1f8ad4fc751908
	.xword	0x3d65d023d6f7c3f3
	.xword	0x1097cab54eb4e2f2
	.xword	0xd697613f894c5a54
	.xword	0xa1fa4296062b1fcb
	.xword	0x1b020485455b8724
	.xword	0xa1907e68946f87a9
	.xword	0x735b120ffe27e9eb
	.xword	0x7d07b48d2d38e4fd
	.xword	0x5542ccb923078b56
	.xword	0x913a176c8b387bb2
	.xword	0xb5b3ad09c09862aa
	.xword	0x87935dea612b38b0
	.xword	0xfa92945e173f96be
	.xword	0x8b15ea5205edd2ba
	.xword	0x590b775b6e6064ae
	.xword	0x230dff7aa567741d
	.xword	0x5caf92efda3b35db
	.xword	0xdf81dbb78ed6986a
	.xword	0x51638a06aef22622
	.xword	0x2469820aa2c57859
	.xword	0x2276768a5d76e099
	.xword	0x9acdf5fbe3ab3fa1
	.xword	0x750d2dcb03f4689c
	.xword	0x81ad3177b2b9e62f
	.xword	0xd7953e01eb0aa0e0
	.xword	0xb184a9877c370e12
	.xword	0x93578cc86a599f37
	.xword	0x2598125893831a32
	.xword	0x0728b3ea1ccf3986
	.xword	0x86a3b0ec003bd48b
	.xword	0xbca16668a75e5f05
	.xword	0x967f106745d40322
	.xword	0xb208e080e66d2c25
	.xword	0x053481bc691a5026
	.xword	0xf7e6bd85c669f363
	.xword	0x0a344b0b7a82c95d
	.xword	0x533ac5962365e066
	.xword	0x72aff50fea4ac6c2
	.xword	0x1fed2d8e561a171a
	.xword	0xe3f5802195b8b8db
	.xword	0xad718bd996aaa379
	.xword	0xb2df849ddc771b7d
	.xword	0xe9e3adf34f624576
	.xword	0xdd0aca4eaf7b0c52
	.xword	0x03eb767d99d4b554
	.xword	0xec73bcb6f6cb7f77
	.xword	0xa1a347ff843322ce
	.xword	0x478046c5f9656b6c
	.xword	0xb425bdf2a4e0630f
	.xword	0xede5bc451b14508a
	.xword	0xcfcb3801ef9a7658
	.xword	0x8c7229f0d82acd0b
	.xword	0x596c710c51a55ff6
	.xword	0xb2dc6a565a27381d
	.xword	0x1e00b6b9c112a731
	.xword	0x2a445698f7166a18
	.xword	0x8a0731e4535584b3
	.xword	0xadafc3661a6ecccb
	.xword	0xd5a1334726466b32
	.xword	0xaa763b6d012dc6bc
	.xword	0x5c99ccc11f0f4fbf
	.xword	0x608d8e680624e1d7
	.xword	0xc4d19240e2481c98
	.xword	0x9e571d98b09cf3ab
	.xword	0x0c14c4e7cccc55ba
	.xword	0xe7a3d098eab2df91
	.xword	0x7d4270fb7fb01d05
	.xword	0xc43a392b9f93c072
	.xword	0x4ebe79d29699e986
	.xword	0x0953fc0b4718aa48
	.xword	0x0c841dafdae3f486
	.xword	0xd9d7d81916b5daf0
	.xword	0x62d6c60eb57493e9
	.xword	0xc6e22dd2aaaa1fd0
	.xword	0xd27232493ad74cee
	.xword	0xefb106bf0ccef522
	.xword	0xb60d4c4c1fd39a5a
	.xword	0xfd4476b1b6f2ab1d
	.xword	0x4b707bf2100e9604
	.xword	0x7e78ac16e08ed9e3
	.xword	0xc8072eb03b1a9e68
	.xword	0x652d02346c665aa5
	.xword	0xcc1f03f4a12bbb56
	.xword	0x71bb094988d10009
	.xword	0x03b769ebf5a827d8
	.xword	0xd90dbbddd7cad151
	.xword	0x5055ac4873756712
	.xword	0xd176f4d440893e79
	.xword	0xc76e77f05fa222b7
	.xword	0xafad05bd15a1b075
	.xword	0x9bb670629230fcc2
	.xword	0x22f52b8fb0edb0ea
	.xword	0x135fb3f654df1228
	.xword	0xad4401460e47afa6
	.xword	0x017c7d79b5f6f302
	.xword	0x7f56e43175db7463
	.xword	0xfaa05e381817db14
	.xword	0x79e24a42966f8c1c
	.xword	0xe0210a0c3643067c
	.xword	0xed21b7c92e05884e
	.xword	0xacf21ea7e80905ea
	.xword	0x07700ee9e5c8b931
	.xword	0x7f463a83e082fc30
	.xword	0x01b59d7bd1e986ec
	.xword	0x21c5f1fe1c28f343
	.xword	0xb766dab72d173e40
	.xword	0x923f832085189d30
	.xword	0xb6836526175e5cb0
	.xword	0x21f2e7128e004b12
	.xword	0xf2e49679bc6e3c6f
	.xword	0x222094a5989a5492
	.xword	0xec10bb1122f7f74a
	.xword	0x200f8808d3566e09
	.xword	0xfbc3835ba267b947
	.xword	0x3b2164a22de5992e
	.xword	0xe2065ee7caba7f25
	.xword	0x4bb28e23df5a6947
	.xword	0x09c095b53940f211
	.xword	0xf7476ca9707e9d62
	.xword	0xd8c29dcc6933eada
	.xword	0x05ed77c8b9ab22d8
	.xword	0x9395900b83e77268
	.align 0x80000
	.data
data_start_7:

	.xword	0x36a03eb3ccffadb4
	.xword	0x79230fbeb0f63606
	.xword	0x0a6f89aac0548e51
	.xword	0xfe36e3dc1548075b
	.xword	0x699693944e1ebb23
	.xword	0x7479716ef161fc60
	.xword	0x5f7fce625ca61c49
	.xword	0xbfd738e29e3508b9
	.xword	0x4b8cb75e05a5f563
	.xword	0xcf1ed0df84ec4d2b
	.xword	0x1674d271023edc28
	.xword	0x5c9b5ff1efa068e0
	.xword	0x2f6d61fee8536bc1
	.xword	0xc0550b02b0f6b3c3
	.xword	0x47bd34beea18e6be
	.xword	0x76b19a8a9adf7ad3
	.xword	0x909542e716a8d09d
	.xword	0x592196029f3ba8bc
	.xword	0x8bc21d1024fb2d73
	.xword	0x30b4a5a30f0c551b
	.xword	0xd6a54feb56b610b9
	.xword	0xd8790dfe5734289c
	.xword	0x92384b6ff72796b6
	.xword	0xde74fe3429e78690
	.xword	0x33535aff6a8e1f14
	.xword	0x00bbda1cda78e5c5
	.xword	0x573a5e379c12378b
	.xword	0x4421c706c5e91f19
	.xword	0x02baa67e529816c1
	.xword	0x6ae36531117e51d5
	.xword	0xd2d6c5b539fcc0ab
	.xword	0xe9ea07c8b92c18b8
	.xword	0x82c67e14da20899c
	.xword	0x7e41eaf21114297a
	.xword	0xe191ce16238ee6da
	.xword	0x80cc393602ae58dd
	.xword	0x6c16951b5e41770e
	.xword	0x7e6cd9366615c255
	.xword	0x6fe22373d3e36358
	.xword	0xb6741fa8d97cb1b6
	.xword	0x5409797840643b06
	.xword	0x50a573cffedd4cc9
	.xword	0xe62eeee4efab8cdf
	.xword	0xed34099a5f5b1cd8
	.xword	0x8d6fd6f170c17221
	.xword	0xf608bd0bfacd86fd
	.xword	0xb2d69eb54281baec
	.xword	0xe7a3f0e05bcd8fa6
	.xword	0x19d5223ad88578be
	.xword	0xba5fee9b540370fd
	.xword	0x53875c00a7a55511
	.xword	0xd6f237a4dd129236
	.xword	0x530417072ecb7b0a
	.xword	0x851a49a5b9164a00
	.xword	0x8b0f62d6633f81c6
	.xword	0x22f8b0bf88687a9a
	.xword	0x95efae2ddabe0531
	.xword	0xb848b231ab51af29
	.xword	0x5cace7dbdab7913a
	.xword	0x5a783c4eaa7727a4
	.xword	0xa391ebb7e1957b04
	.xword	0xc104f81450739e73
	.xword	0xcd65a042e88b4bf0
	.xword	0x50ee9f7f213035b4
	.xword	0xe14fad4ba4e5fe8b
	.xword	0x513440f3ce8a5d8e
	.xword	0x9d8347a9fbefd7ae
	.xword	0x34e357a39c721df3
	.xword	0xc0e2d25bec85300d
	.xword	0xce02e433fa368cc7
	.xword	0x8b9a84532616cb8f
	.xword	0x047c6fb96260f494
	.xword	0x7956690fba7acf09
	.xword	0x2721b25d4eb6ab05
	.xword	0xec7ba205d3fa523f
	.xword	0xd7896e330dd42c47
	.xword	0x7efd25aaf3c6272a
	.xword	0xc328a233018f9ed2
	.xword	0xcf133a245d8c26cf
	.xword	0x4260c606939e2388
	.xword	0xa9bb151786400796
	.xword	0x09f7d81227f89333
	.xword	0xea212f19dc57f4e6
	.xword	0x126f2d462faffa6a
	.xword	0x6cdd1647df4f46a4
	.xword	0x7a63152d56997b2e
	.xword	0x0409f7d326c4261b
	.xword	0xbb54bb537d1d58a2
	.xword	0x628561aa3fabc489
	.xword	0xcbf60f81484a53ed
	.xword	0x3bf74efc14ea35dc
	.xword	0xe3f5628366f02cd1
	.xword	0x29f9335b40ab08eb
	.xword	0x55b36791c29519da
	.xword	0xc10a29a2e77167c0
	.xword	0x573d228827d226f9
	.xword	0xc11376123dcaa398
	.xword	0x8897bab5c21bb0f9
	.xword	0x32e4ccd12b1964fa
	.xword	0x5606c9952abdc8ef
	.xword	0x66e32f1c49adb8bb
	.xword	0x76014905a790d19d
	.xword	0x4727e645397d2c9b
	.xword	0x8ef5f003d8165090
	.xword	0x011c5cc144e909bc
	.xword	0xc1d51f4fe1542691
	.xword	0x78679fce3590dd9a
	.xword	0xaf6dc7e2df8ab3c2
	.xword	0x499e8a9a2699d5a2
	.xword	0xca14bf576a493ccf
	.xword	0xa72a9dddfccf893b
	.xword	0xfd0d1bfc6ce5a604
	.xword	0xd2d8a8c2243602d5
	.xword	0x960ff30d01286a8c
	.xword	0xd677e235921a5b24
	.xword	0xbc0b71f4da5a40ed
	.xword	0x24fe4f3c1c5af9ca
	.xword	0x096e0ffa58ac1ace
	.xword	0xddeb86ae9d82d5c8
	.xword	0xe8e173924077fe97
	.xword	0xfe0fe0372b2fcf11
	.xword	0x9b44760a70091ae2
	.xword	0xcab8a1c0608acaee
	.xword	0xd3c45c7de880e4d1
	.xword	0x93fc5df292856757
	.xword	0xd5fd98ffe7059c70
	.xword	0x093be92bd70dc507
	.xword	0x9fb98b5c808c5045
	.xword	0x761f15dbb772001c
	.xword	0x2d2168aea72c2d99
	.xword	0x7bfcc69775323bbe
	.xword	0x31286334074af72e
	.xword	0x44ca939cbabc5881
	.xword	0x8174223b8caf568e
	.xword	0x04acaba1778cbf75
	.xword	0x7150625a9446cb80
	.xword	0x4d136359299dc2b5
	.xword	0x693ac0f7503f62ce
	.xword	0x659e2939e1719023
	.xword	0x6f1913d7b9736f7d
	.xword	0xa848cbbfc9344177
	.xword	0x1506263c7aee3c2a
	.xword	0xa55d690d6d972a86
	.xword	0x92ccce36b27c8ccd
	.xword	0x56bda5f3a6191010
	.xword	0x23c72906f5f55544
	.xword	0x37b9c59cf7aa33dc
	.xword	0x712a52d8a551a1c4
	.xword	0xff72304a47295abc
	.xword	0x1b11501e8de6c083
	.xword	0x7d620094ff826749
	.xword	0x839422b3063ddceb
	.xword	0x5c60dce51991cada
	.xword	0x26cc06b51f50a9c5
	.xword	0xec5f51e6fbe62a2d
	.xword	0xbf186c87bd755bfe
	.xword	0x765261e5686e0ecd
	.xword	0x75dd4e24f0e5a6be
	.xword	0xdb4af3bb609497de
	.xword	0x9a234ff727aa9aa8
	.xword	0x55bcc9c710add4d2
	.xword	0xa01a1abd3556eb63
	.xword	0x23b395542c22f68d
	.xword	0xa7a9ede33dd53b95
	.xword	0x518ab4465e28c31c
	.xword	0x2e4061e90e373382
	.xword	0x05ab5f8ca42496d7
	.xword	0x74ec14f525d6dcb5
	.xword	0x721c6751520b37ef
	.xword	0xac00d104981357ac
	.xword	0xc652a17308ac07d0
	.xword	0xfe528e38b5674c23
	.xword	0xb4ede9bced744e4f
	.xword	0x97cf1d5f83aa4e47
	.xword	0x21fabd80f869d8ed
	.xword	0xe692a777f20b84de
	.xword	0x91e90ba2ba5e284a
	.xword	0x03d144cc06eb7567
	.xword	0x88091df504fb03f0
	.xword	0x95f082d444d6f06c
	.xword	0x7c7274c374eaeff0
	.xword	0xd5790c58ec55720b
	.xword	0xb76463c0928f606c
	.xword	0xe246f7da37ea848c
	.xword	0x9019616f14c7b298
	.xword	0x5622fc909381a545
	.xword	0xd750cf926d3f0389
	.xword	0xfd44282384c51197
	.xword	0xd5926093799ce89d
	.xword	0x7e364f41ba924875
	.xword	0x72116aa5b54c1f97
	.xword	0x55d0a4f1154293b7
	.xword	0xb3764b1d516227e4
	.xword	0xdf476e7b50b29c3c
	.xword	0xf97902378d4e4a43
	.xword	0xf8bfdc19f2e0a863
	.xword	0xe87fab03f6aba2f6
	.xword	0x9af1e2d7a5cffe59
	.xword	0x7930b36f7197f220
	.xword	0x748108bb94e545bc
	.xword	0xa4dce0d181f919d2
	.xword	0x158b9fb8291fe3c6
	.xword	0xf464e6f41fb2cb0e
	.xword	0x61654348ea4861c6
	.xword	0x9837676e96978d03
	.xword	0xdf9e7c9621961099
	.xword	0x92b11d4c79eca40b
	.xword	0x531f57165749a3db
	.xword	0x181927e0257e1dea
	.xword	0x2d6074f0f9f481b9
	.xword	0x8e9d7a2cd977f9b2
	.xword	0x641b11aef578e8ad
	.xword	0x4cc339202ea94510
	.xword	0x47a32187b2532269
	.xword	0x5c23e3f667ecf5f9
	.xword	0x4bcf6ffd23a81641
	.xword	0xf504d3da8ee158ff
	.xword	0xa16b1e14262d4704
	.xword	0x2223d32401d7fa17
	.xword	0x25bafa178537cbd9
	.xword	0xd3f6e642d6d9df5e
	.xword	0x0a92912eecb18ad8
	.xword	0x15dbba93345bf952
	.xword	0x0cf1139d4dbf79ad
	.xword	0xca859d35b1c1d729
	.xword	0x7bb00874a70d4439
	.xword	0xd3927e0e43bb722f
	.xword	0x324dd723fefb5a62
	.xword	0x0a61f059a54d89b5
	.xword	0x7dc73baeded39350
	.xword	0xe2725b93aca9ab35
	.xword	0x3ff0d3f3c94fbc53
	.xword	0xff69e101a12d928d
	.xword	0xb0ea081c61b6ccb6
	.xword	0x85d99961e4a54c1a
	.xword	0x25b736b2388dd014
	.xword	0xf6f68235aa0fe444
	.xword	0xcea7762f4bfb3451
	.xword	0x8ad4bc275ad22425
	.xword	0x5042f1b32a39a67f
	.xword	0x17ffe3aa3185e3ea
	.xword	0xa85c1bdbb3a60524
	.xword	0xe0fc4b906cde8968
	.xword	0xd14952571402da80
	.xword	0x5b624ce8ed49a5c9
	.xword	0x55fe3312abb13fc7
	.xword	0xbbbe6d91aeadb05e
	.xword	0x5575eb5c3bf33d8b
	.xword	0x32886e32d9b2eba9
	.xword	0xb8b795362442843c
	.xword	0x43eef4deca6d95e6
	.xword	0xb172969ead5c08c1
	.xword	0x57c54ee94c7d4255
	.xword	0x3c44393bc4c71c82
	.xword	0x943b9f8d04dd2269
	.xword	0x2796c1854d72d7f8



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
