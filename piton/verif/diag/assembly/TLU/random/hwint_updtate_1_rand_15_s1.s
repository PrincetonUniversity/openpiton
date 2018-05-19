// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hwint_updtate_1_rand_15_s1.s
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
   random seed:	923937669
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

	setx 0xb5f17c13d8da9a0e, %g1, %g0
	setx 0xfccf3ed5714516d0, %g1, %g1
	setx 0x2905e6e3f0cb0090, %g1, %g2
	setx 0xd6ab69faf6019126, %g1, %g3
	setx 0x484bd2ca31a58069, %g1, %g4
	setx 0x4eff2ddf8c532664, %g1, %g5
	setx 0x154c7559e09923fc, %g1, %g6
	setx 0x32a3ffb0a89526f7, %g1, %g7
	setx 0x7e0a775b316d873b, %g1, %r16
	setx 0x31e8bb12dc9a9bf1, %g1, %r17
	setx 0xb1feaa31079ed245, %g1, %r18
	setx 0x1c8464ad0910b704, %g1, %r19
	setx 0x0f2b2f4bf9d0a286, %g1, %r20
	setx 0xbd2610b9d8cb37aa, %g1, %r21
	setx 0xf390839df7682538, %g1, %r22
	setx 0xc7c40c6e9e2d90b7, %g1, %r23
	setx 0xb8145f5d5cdd1046, %g1, %r24
	setx 0x5a07eb1d7ed17953, %g1, %r25
	setx 0x6624a75f74d313af, %g1, %r26
	setx 0x0e72eb0d0d623e2c, %g1, %r27
	setx 0x147e5ef6e10c9565, %g1, %r28
	setx 0xfe50d037ffa97af7, %g1, %r29
	setx 0x47df55f2a041e386, %g1, %r30
	setx 0x408f3bf945f3530d, %g1, %r31
	save
	setx 0x37a7ffa4e1895f13, %g1, %r16
	setx 0x1edaba39dbdbf331, %g1, %r17
	setx 0x66fd2d8507aff702, %g1, %r18
	setx 0xf015180e457a84c0, %g1, %r19
	setx 0x11d884f2b2863733, %g1, %r20
	setx 0xd44e7a129c518744, %g1, %r21
	setx 0xd5bc21b8af61c173, %g1, %r22
	setx 0x188469cc7df7b88b, %g1, %r23
	setx 0x8699f5d1159e4a37, %g1, %r24
	setx 0xc3c15664f6b54149, %g1, %r25
	setx 0x9d3967551c1986e8, %g1, %r26
	setx 0xcd30555ad4b8a9d7, %g1, %r27
	setx 0x1402a6818527baa1, %g1, %r28
	setx 0xd69f1d4cc7fb7428, %g1, %r29
	setx 0xfa58da070697ed8b, %g1, %r30
	setx 0xd8d5a7e620cb0d22, %g1, %r31
	save
	setx 0x6b6b2e6a67c62fbe, %g1, %r16
	setx 0x2dabe7f3c0a3e783, %g1, %r17
	setx 0x40a185627d6e7792, %g1, %r18
	setx 0x29ad2eb3bf2216a9, %g1, %r19
	setx 0xc82c158b44502f08, %g1, %r20
	setx 0xae6bb8b9981d0199, %g1, %r21
	setx 0x670b1d9202266033, %g1, %r22
	setx 0x716aee1f33c7f4b3, %g1, %r23
	setx 0x4f197bbdbea6537e, %g1, %r24
	setx 0xbce86154620ec3b7, %g1, %r25
	setx 0xd395c5f704dd061e, %g1, %r26
	setx 0x93a79846c4a004f8, %g1, %r27
	setx 0xcd8fb386a8c42900, %g1, %r28
	setx 0x31f9a9872fcafda2, %g1, %r29
	setx 0xc4a3bc05256133de, %g1, %r30
	setx 0xdf55ae9aa61ed59b, %g1, %r31
	save
	setx 0x669a90aad5e51a43, %g1, %r16
	setx 0xfea3b8552e0884e9, %g1, %r17
	setx 0x6a11e06c6d194bde, %g1, %r18
	setx 0xd3df5599bece5900, %g1, %r19
	setx 0x9d1618d708239a25, %g1, %r20
	setx 0x5e10214054cc23db, %g1, %r21
	setx 0x561eb002e9faebd0, %g1, %r22
	setx 0x0c1be2907340dcc8, %g1, %r23
	setx 0xed31210b2d7ee8b8, %g1, %r24
	setx 0x57e1526a7e7c0051, %g1, %r25
	setx 0x307e966dcd6fed5f, %g1, %r26
	setx 0x5d7edd4ade9e7dc0, %g1, %r27
	setx 0x182010b35a6287dd, %g1, %r28
	setx 0xb697b0e9bede153c, %g1, %r29
	setx 0x4de76c315058ef3a, %g1, %r30
	setx 0xd687f1ce446e3706, %g1, %r31
	save
	setx 0x6cdac853019b598c, %g1, %r16
	setx 0x372858240137ec2d, %g1, %r17
	setx 0x8c0ecf997de06f46, %g1, %r18
	setx 0x32949e0df5cd1e1d, %g1, %r19
	setx 0xae31bf1798f4597b, %g1, %r20
	setx 0x4b4a9dbd7370f710, %g1, %r21
	setx 0x32e8b2de81b38aaa, %g1, %r22
	setx 0xe3036baf823bfb47, %g1, %r23
	setx 0x9164b89a4df5a931, %g1, %r24
	setx 0x68864edd870c48b2, %g1, %r25
	setx 0x69d13030fb5e75b0, %g1, %r26
	setx 0xe3a32c54d188985f, %g1, %r27
	setx 0x73143e8a0f43acfe, %g1, %r28
	setx 0x31fb5235e59665ef, %g1, %r29
	setx 0x6865b779819748f4, %g1, %r30
	setx 0x88c5ff0a725973e8, %g1, %r31
	save
	setx 0x22610e90182e299d, %g1, %r16
	setx 0x66ad60692a6dfbe6, %g1, %r17
	setx 0x62cf86b059edc7b6, %g1, %r18
	setx 0xc1b1746ea6f9f1fc, %g1, %r19
	setx 0xb321d2f9b7ea97ff, %g1, %r20
	setx 0x52d3787505a7a95a, %g1, %r21
	setx 0xe446d7f4460de8c0, %g1, %r22
	setx 0x0dbd257cdbc70509, %g1, %r23
	setx 0xb284eca455daa0dd, %g1, %r24
	setx 0x260f648ee60b0b8b, %g1, %r25
	setx 0x3a22e9d052cb6f59, %g1, %r26
	setx 0xa68c7d7ae3817b01, %g1, %r27
	setx 0xb2128f1dd10055a2, %g1, %r28
	setx 0x8eb59a4d636d6102, %g1, %r29
	setx 0x302a562aeac5b3ae, %g1, %r30
	setx 0x1f3ef7e75348e0dc, %g1, %r31
	save
	setx 0x61c40631ab9a19aa, %g1, %r16
	setx 0x5e7aaa9b385dbc7e, %g1, %r17
	setx 0x930ca7f98e2c0ac6, %g1, %r18
	setx 0x4c7a3427e0dc2b12, %g1, %r19
	setx 0x8938651889977af7, %g1, %r20
	setx 0x80f3286d807c3f8a, %g1, %r21
	setx 0x731d59cd36b92c69, %g1, %r22
	setx 0x0cab941358c9f930, %g1, %r23
	setx 0xf683e6ef01182534, %g1, %r24
	setx 0x73b3b5bffafb0db3, %g1, %r25
	setx 0xb5a24372d04f95eb, %g1, %r26
	setx 0xbf04c430d2b11653, %g1, %r27
	setx 0x59e7c2d025baf90d, %g1, %r28
	setx 0x6e2d06d5703b00df, %g1, %r29
	setx 0xba24bd51c080d9ac, %g1, %r30
	setx 0xa7f7cc6274ede5f8, %g1, %r31
	save
	setx 0xb4b54277a4532efd, %g1, %r16
	setx 0x72f39146d89c727b, %g1, %r17
	setx 0x3dc3812da2c83b8f, %g1, %r18
	setx 0xc8dbebd7988b9f36, %g1, %r19
	setx 0x7759c1179b4ab16c, %g1, %r20
	setx 0x9e8f97736b81751e, %g1, %r21
	setx 0x3a7caa93e5ff8d95, %g1, %r22
	setx 0x1bebf9dbc7271f11, %g1, %r23
	setx 0x6c063ffe2a355aa5, %g1, %r24
	setx 0xcf2719e5ebbd4db5, %g1, %r25
	setx 0x1fd7bc0687bd1c39, %g1, %r26
	setx 0xb5afaee6a9af809f, %g1, %r27
	setx 0x6103f5659a123c3e, %g1, %r28
	setx 0x595604b97655034c, %g1, %r29
	setx 0xed9a2e4bdde847cf, %g1, %r30
	setx 0x8afd637b17510b5a, %g1, %r31
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
	.word 0xbfe4e09e  ! 1: SAVE_I	save	%r19, 0x0001, %r31
T0_asi_reg_wr_0:
	mov	0x29, %r14
	.word 0xf0f38e60  ! 3: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_0), 16, 16)) -> intp(0, 0, 0)
cpu_intr_0_0:
	setx	0x1a0233, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_1), 16, 16)) -> intp(0, 0, 38)
	.word 0xb1e4216d  ! 10: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e4217e  ! 13: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5e4a17d  ! 17: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbb643801  ! 19: MOVcc_I	<illegal instruction>
	.word 0xbfe5a12d  ! 23: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe460b8  ! 25: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbde52077  ! 26: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbfe5200e  ! 30: SAVE_I	save	%r20, 0x0001, %r31
cpu_intr_0_1:
	setx	0x1e0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb23d4000  ! 37: XNOR_R	xnor 	%r21, %r0, %r25
	.word 0xb5e54000  ! 38: SAVE_R	save	%r21, %r0, %r26
	.word 0xb9e4c000  ! 39: SAVE_R	save	%r19, %r0, %r28
cpu_intr_0_2:
	setx	0x1e000a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_1:
	mov	0x24, %r14
	.word 0xfcf384a0  ! 42: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_2), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_wr_2:
	mov	0x19, %r14
	.word 0xf4f389e0  ! 45: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_0_3:
	setx	0x1c011b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_3), 16, 16)) -> intp(0, 0, 20)
T0_asi_reg_wr_3:
	mov	0x2a, %r14
	.word 0xfef38e40  ! 49: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_4), 16, 16)) -> intp(0, 0, 1b)
iob_intr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_5), 16, 16)) -> intp(0, 0, 22)
cpu_intr_0_4:
	setx	0x1e030b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_5:
	setx	0x1c0103, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_0:
	mov	0x15, %r14
	.word 0xfadb8e40  ! 60: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_6:
	setx	0x1c0104, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_1:
	mov	0xf, %r14
	.word 0xf8db8e80  ! 63: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_0_7:
	setx	0x1e0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 65: SAVE_R	save	%r20, %r0, %r27
	.word 0xbde4a0b4  ! 67: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e54000  ! 70: SAVE_R	save	%r21, %r0, %r25
iob_intr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_6), 16, 16)) -> intp(0, 0, 2b)
T0_asi_reg_wr_4:
	mov	0x2d, %r14
	.word 0xf4f38e40  ! 74: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_8:
	setx	0x1c0322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb224c000  ! 76: SUB_R	sub 	%r19, %r0, %r25
T0_asi_reg_wr_5:
	mov	0xb, %r14
	.word 0xf4f389e0  ! 77: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbc8d8000  ! 83: ANDcc_R	andcc 	%r22, %r0, %r30
	.word 0xb7e5a1c6  ! 86: SAVE_I	save	%r22, 0x0001, %r27
T0_asi_reg_wr_6:
	mov	0xb, %r14
	.word 0xfcf38e80  ! 87: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbfe4a034  ! 89: SAVE_I	save	%r18, 0x0001, %r31
cpu_intr_0_9:
	setx	0x1e012f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_2:
	mov	0x31, %r14
	.word 0xf4db8e80  ! 96: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_7), 16, 16)) -> intp(0, 0, 32)
	.word 0xbc858000  ! 100: ADDcc_R	addcc 	%r22, %r0, %r30
	.word 0xb20561fc  ! 101: ADD_I	add 	%r21, 0x01fc, %r25
	.word 0xb7e40000  ! 104: SAVE_R	save	%r16, %r0, %r27
iob_intr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_8), 16, 16)) -> intp(0, 0, 15)
iob_intr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_9), 16, 16)) -> intp(0, 0, 10)
	.word 0xb5e40000  ! 107: SAVE_R	save	%r16, %r0, %r26
iob_intr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_10), 16, 16)) -> intp(0, 0, 25)
T0_asi_reg_wr_7:
	mov	0x3c0, %r14
	.word 0xfef38400  ! 113: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb1e4e1e9  ! 114: SAVE_I	save	%r19, 0x0001, %r24
	.word 0x8795a1ee  ! 115: WRPR_TT_I	wrpr	%r22, 0x01ee, %tt
iob_intr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_11), 16, 16)) -> intp(0, 0, e)
	.word 0xb7e4c000  ! 117: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_wr_8:
	mov	0x3c4, %r14
	.word 0xf4f38e40  ! 119: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_10:
	setx	0x1c0335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e46116  ! 125: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3e40000  ! 131: SAVE_R	save	%r16, %r0, %r25
cpu_intr_0_11:
	setx	0x1d021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e48000  ! 134: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_rd_3:
	mov	0x11, %r14
	.word 0xf4db8e80  ! 137: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_0_12:
	setx	0x1d0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde46171  ! 140: SAVE_I	save	%r17, 0x0001, %r30
T0_asi_reg_wr_9:
	mov	0xc, %r14
	.word 0xfaf38e80  ! 141: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbbe4c000  ! 142: SAVE_R	save	%r19, %r0, %r29
cpu_intr_0_13:
	setx	0x1c0000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5e003  ! 145: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb4b5a068  ! 147: ORNcc_I	orncc 	%r22, 0x0068, %r26
iob_intr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_12), 16, 16)) -> intp(0, 0, 2)
	.word 0xbbe58000  ! 150: SAVE_R	save	%r22, %r0, %r29
	.word 0xbbe48000  ! 151: SAVE_R	save	%r18, %r0, %r29
	.word 0xb00c8000  ! 155: AND_R	and 	%r18, %r0, %r24
	.word 0xb5e421b7  ! 156: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb635a147  ! 159: ORN_I	orn 	%r22, 0x0147, %r27
cpu_intr_0_14:
	setx	0x1f023d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_13), 16, 16)) -> intp(0, 0, 38)
	.word 0xb8bd4000  ! 166: XNORcc_R	xnorcc 	%r21, %r0, %r28
	.word 0xb1e421df  ! 167: SAVE_I	save	%r16, 0x0001, %r24
cpu_intr_0_15:
	setx	0x1e033c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_14), 16, 16)) -> intp(0, 0, 15)
	.word 0xb225a136  ! 174: SUB_I	sub 	%r22, 0x0136, %r25
iob_intr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_15), 16, 16)) -> intp(0, 0, e)
	.word 0xb0048000  ! 178: ADD_R	add 	%r18, %r0, %r24
	.word 0xb1e5a0f6  ! 180: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_16), 16, 16)) -> intp(0, 0, 10)
iob_intr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_17), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb9e4a07e  ! 185: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_wr_10:
	mov	0x3c1, %r14
	.word 0xf0f384a0  ! 187: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xba8c6058  ! 188: ANDcc_I	andcc 	%r17, 0x0058, %r29
	.word 0xbde44000  ! 189: SAVE_R	save	%r17, %r0, %r30
	.word 0xbc0de0d2  ! 190: AND_I	and 	%r23, 0x00d2, %r30
	.word 0xb8c58000  ! 193: ADDCcc_R	addccc 	%r22, %r0, %r28
cpu_intr_0_16:
	setx	0x1f011b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_17:
	setx	0x1f0311, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_4:
	mov	0x3c1, %r14
	.word 0xfedb8e40  ! 207: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbbe4e1b9  ! 208: SAVE_I	save	%r19, 0x0001, %r29
cpu_intr_0_18:
	setx	0x1e0223, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_19:
	setx	0x1c021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e069  ! 216: SAVE_I	save	%r23, 0x0001, %r26
iob_intr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_18), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb3e58000  ! 224: SAVE_R	save	%r22, %r0, %r25
T0_asi_reg_wr_11:
	mov	0x38, %r14
	.word 0xf2f38e60  ! 226: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T0_asi_reg_wr_12:
	mov	0x7, %r14
	.word 0xfcf38e80  ! 228: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_19), 16, 16)) -> intp(0, 0, 1)
T0_asi_reg_rd_5:
	mov	0x3c6, %r14
	.word 0xf8db84a0  ! 235: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T0_asi_reg_rd_6:
	mov	0x1, %r14
	.word 0xf2db8e80  ! 236: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xa1902000  ! 239: WRPR_GL_I	wrpr	%r0, 0x0000, %-
iob_intr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_20), 16, 16)) -> intp(0, 0, 12)
cpu_intr_0_20:
	setx	0x1d0231, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_21), 16, 16)) -> intp(0, 0, 17)
	.word 0xbbe5a06e  ! 253: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_22), 16, 16)) -> intp(0, 0, 29)
	.word 0xbfe46048  ! 259: SAVE_I	save	%r17, 0x0001, %r31
cpu_intr_0_21:
	setx	0x1c0103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbab54000  ! 265: SUBCcc_R	orncc 	%r21, %r0, %r29
cpu_intr_0_22:
	setx	0x1f032e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_13:
	mov	0x22, %r14
	.word 0xf4f38e60  ! 267: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_0_23:
	setx	0x1d011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde40000  ! 276: SAVE_R	save	%r16, %r0, %r30
	.word 0xb1e5c000  ! 277: SAVE_R	save	%r23, %r0, %r24
	.word 0xb9641800  ! 281: MOVcc_R	<illegal instruction>
	.word 0xb5e44000  ! 286: SAVE_R	save	%r17, %r0, %r26
cpu_intr_0_24:
	setx	0x1e0104, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_23), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb1e4e1b1  ! 292: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_rd_7:
	mov	0x3c0, %r14
	.word 0xf6db84a0  ! 296: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb5e4c000  ! 298: SAVE_R	save	%r19, %r0, %r26
T0_asi_reg_wr_14:
	mov	0x16, %r14
	.word 0xf2f384a0  ! 301: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_0_25:
	setx	0x1d0225, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_15:
	mov	0x2f, %r14
	.word 0xf2f38e40  ! 304: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb5e40000  ! 306: SAVE_R	save	%r16, %r0, %r26
cpu_intr_0_26:
	setx	0x1d0002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e56091  ! 308: SAVE_I	save	%r21, 0x0001, %r25
cpu_intr_0_27:
	setx	0x1d001e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_28:
	setx	0x1d021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a198  ! 319: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb5e52199  ! 320: SAVE_I	save	%r20, 0x0001, %r26
iob_intr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_24), 16, 16)) -> intp(0, 0, 16)
	.word 0xb3e40000  ! 324: SAVE_R	save	%r16, %r0, %r25
iob_intr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_25), 16, 16)) -> intp(0, 0, 39)
cpu_intr_0_29:
	setx	0x1e002d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_26), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_wr_16:
	mov	0x33, %r14
	.word 0xfaf38e60  ! 334: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T0_asi_reg_rd_8:
	mov	0xf, %r14
	.word 0xf2db8e40  ! 335: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_30:
	setx	0x1e0234, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_9:
	mov	0x36, %r14
	.word 0xfcdb89e0  ! 337: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbfe5c000  ! 340: SAVE_R	save	%r23, %r0, %r31
cpu_intr_0_31:
	setx	0x1c0324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e40000  ! 342: SAVE_R	save	%r16, %r0, %r28
T0_asi_reg_rd_10:
	mov	0x32, %r14
	.word 0xf6db8e40  ! 344: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_0_32:
	setx	0x1c0027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e40000  ! 349: SAVE_R	save	%r16, %r0, %r26
	.word 0xb1e54000  ! 352: SAVE_R	save	%r21, %r0, %r24
	.word 0xbde50000  ! 354: SAVE_R	save	%r20, %r0, %r30
cpu_intr_0_33:
	setx	0x1f0130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e04c  ! 363: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb8b5e1df  ! 365: ORNcc_I	orncc 	%r23, 0x01df, %r28
	.word 0xbfe54000  ! 366: SAVE_R	save	%r21, %r0, %r31
T0_asi_reg_rd_11:
	mov	0xf, %r14
	.word 0xf0db8e80  ! 368: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb7e5c000  ! 369: SAVE_R	save	%r23, %r0, %r27
iob_intr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_27), 16, 16)) -> intp(0, 0, a)
iob_intr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_28), 16, 16)) -> intp(0, 0, 38)
	.word 0xb734a001  ! 373: SRL_I	srl 	%r18, 0x0001, %r27
	.word 0xb7e58000  ! 374: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_rd_12:
	mov	0x3c8, %r14
	.word 0xf6db8e60  ! 377: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_29), 16, 16)) -> intp(0, 0, 4)
iob_intr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_30), 16, 16)) -> intp(0, 0, 15)
iob_intr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_31), 16, 16)) -> intp(0, 0, 1e)
iob_intr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_32), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb9e50000  ! 384: SAVE_R	save	%r20, %r0, %r28
cpu_intr_0_34:
	setx	0x1c0013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde50000  ! 387: SAVE_R	save	%r20, %r0, %r30
iob_intr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_33), 16, 16)) -> intp(0, 0, 5)
	.word 0xbde44000  ! 391: SAVE_R	save	%r17, %r0, %r30
cpu_intr_0_35:
	setx	0x1e003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde44000  ! 393: SAVE_R	save	%r17, %r0, %r30
cpu_intr_0_36:
	setx	0x1d0008, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_34), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb5e50000  ! 397: SAVE_R	save	%r20, %r0, %r26
T0_asi_reg_rd_13:
	mov	0x2a, %r14
	.word 0xfedb8e60  ! 398: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T0_asi_reg_wr_17:
	mov	0x27, %r14
	.word 0xf0f38e40  ! 400: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbfe54000  ! 401: SAVE_R	save	%r21, %r0, %r31
	.word 0xbde421c9  ! 402: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_wr_18:
	mov	0x1, %r14
	.word 0xf4f389e0  ! 404: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T0_asi_reg_rd_14:
	mov	0x29, %r14
	.word 0xf4db8e40  ! 409: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb9e54000  ! 412: SAVE_R	save	%r21, %r0, %r28
	.word 0xbbe44000  ! 413: SAVE_R	save	%r17, %r0, %r29
iob_intr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_35), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_37:
	setx	0x1c012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a08d  ! 419: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb7e561c9  ! 420: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb5e58000  ! 422: SAVE_R	save	%r22, %r0, %r26
	.word 0xb1e4c000  ! 423: SAVE_R	save	%r19, %r0, %r24
T0_asi_reg_rd_15:
	mov	0x3c2, %r14
	.word 0xf2db8e80  ! 425: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xa1902000  ! 427: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xb9e52156  ! 428: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb5e460ff  ! 433: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_38:
	setx	0x1d0213, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_39:
	setx	0x1d010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b4a0ce  ! 439: ORNcc_I	orncc 	%r18, 0x00ce, %r28
	.word 0xb8052079  ! 440: ADD_I	add 	%r20, 0x0079, %r28
T0_asi_reg_rd_16:
	mov	0x3c4, %r14
	.word 0xf2db8e80  ! 444: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_36), 16, 16)) -> intp(0, 0, 30)
	.word 0xb5e48000  ! 449: SAVE_R	save	%r18, %r0, %r26
cpu_intr_0_40:
	setx	0x1c002b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_37), 16, 16)) -> intp(0, 0, 14)
	.word 0xbbe4601d  ! 456: SAVE_I	save	%r17, 0x0001, %r29
T0_asi_reg_wr_19:
	mov	0x9, %r14
	.word 0xfcf38e80  ! 458: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_0_41:
	setx	0x1c0333, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_20:
	mov	0x38, %r14
	.word 0xf6f38e80  ! 461: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb1e4c000  ! 462: SAVE_R	save	%r19, %r0, %r24
	.word 0xb3e5c000  ! 463: SAVE_R	save	%r23, %r0, %r25
	.word 0xbde4c000  ! 465: SAVE_R	save	%r19, %r0, %r30
iob_intr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_38), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb624c000  ! 471: SUB_R	sub 	%r19, %r0, %r27
T0_asi_reg_wr_21:
	mov	0x2c, %r14
	.word 0xf0f389e0  ! 472: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T0_asi_reg_rd_17:
	mov	0x2, %r14
	.word 0xf2db8e60  ! 473: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_0_42:
	setx	0x200315, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_22:
	mov	0x3c7, %r14
	.word 0xfef384a0  ! 476: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T0_asi_reg_wr_23:
	mov	0x3c1, %r14
	.word 0xfef384a0  ! 478: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xbfe420d9  ! 483: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_wr_24:
	mov	0x14, %r14
	.word 0xfcf38e40  ! 484: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbde40000  ! 485: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_39), 16, 16)) -> intp(0, 0, 37)
	.word 0xb3e52081  ! 492: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb3e50000  ! 493: SAVE_R	save	%r20, %r0, %r25
T0_asi_reg_rd_18:
	mov	0x1e, %r14
	.word 0xf4db8e40  ! 494: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_40), 16, 16)) -> intp(0, 0, 2b)
cpu_intr_0_43:
	setx	0x21031c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_41), 16, 16)) -> intp(0, 0, 14)
	.word 0xb9e56140  ! 498: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbfe42178  ! 499: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb3e4a0f4  ! 500: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7e5e048  ! 502: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbb349000  ! 503: SRLX_R	srlx	%r18, %r0, %r29
cpu_intr_0_44:
	setx	0x230334, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_45:
	setx	0x220210, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_25:
	mov	0x34, %r14
	.word 0xfaf389e0  ! 508: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_42), 16, 16)) -> intp(0, 0, 13)
	.word 0xb3e4a015  ! 512: SAVE_I	save	%r18, 0x0001, %r25
cpu_intr_0_46:
	setx	0x220314, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_43), 16, 16)) -> intp(0, 0, 26)
	.word 0xbcac216e  ! 523: ANDNcc_I	andncc 	%r16, 0x016e, %r30
iob_intr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_44), 16, 16)) -> intp(0, 0, 39)
	.word 0xb7e5211e  ! 527: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbe440000  ! 531: ADDC_R	addc 	%r16, %r0, %r31
T0_asi_reg_wr_26:
	mov	0x1, %r14
	.word 0xf6f389e0  ! 533: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb9e56152  ! 535: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb1e5c000  ! 538: SAVE_R	save	%r23, %r0, %r24
cpu_intr_0_47:
	setx	0x23032e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_19:
	mov	0x3, %r14
	.word 0xfedb8e80  ! 541: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_45), 16, 16)) -> intp(0, 0, 5)
	.word 0xb7e58000  ! 545: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_rd_20:
	mov	0x2b, %r14
	.word 0xf4db8e80  ! 547: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_0_48:
	setx	0x20022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_21:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 550: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_49:
	setx	0x230318, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_27:
	mov	0x3c5, %r14
	.word 0xfaf389e0  ! 554: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_0_50:
	setx	0x200121, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_46), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_wr_28:
	mov	0x3c4, %r14
	.word 0xf4f38e40  ! 557: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_rd_22:
	mov	0x16, %r14
	.word 0xfcdb8400  ! 559: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T0_asi_reg_wr_29:
	mov	0x3c8, %r14
	.word 0xfef38e40  ! 560: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_0_51:
	setx	0x220015, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_52:
	setx	0x21011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e461c6  ! 571: SAVE_I	save	%r17, 0x0001, %r24
iob_intr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_47), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_wr_30:
	mov	0x12, %r14
	.word 0xfaf38e40  ! 573: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_wr_31:
	mov	0x3c4, %r14
	.word 0xfef38e40  ! 577: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb9e44000  ! 578: SAVE_R	save	%r17, %r0, %r28
cpu_intr_0_53:
	setx	0x210115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5c000  ! 580: SAVE_R	save	%r23, %r0, %r26
T0_asi_reg_wr_32:
	mov	0x3c4, %r14
	.word 0xf0f38e80  ! 581: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbf34d000  ! 585: SRLX_R	srlx	%r19, %r0, %r31
cpu_intr_0_54:
	setx	0x20003f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_48), 16, 16)) -> intp(0, 0, 13)
cpu_intr_0_55:
	setx	0x230210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e58000  ! 592: SAVE_R	save	%r22, %r0, %r25
cpu_intr_0_56:
	setx	0x230109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe56039  ! 598: SAVE_I	save	%r21, 0x0001, %r31
cpu_intr_0_57:
	setx	0x21000a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_33:
	mov	0x3c5, %r14
	.word 0xf0f38400  ! 601: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb3e5c000  ! 609: SAVE_R	save	%r23, %r0, %r25
	.word 0xbfe40000  ! 612: SAVE_R	save	%r16, %r0, %r31
cpu_intr_0_58:
	setx	0x200327, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_59:
	setx	0x200107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e48000  ! 616: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_49), 16, 16)) -> intp(0, 0, 19)
cpu_intr_0_60:
	setx	0x200018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 622: SAVE_R	save	%r22, %r0, %r26
	.word 0xb1e58000  ! 626: SAVE_R	save	%r22, %r0, %r24
cpu_intr_0_61:
	setx	0x220131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e42026  ! 630: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbabdc000  ! 631: XNORcc_R	xnorcc 	%r23, %r0, %r29
iob_intr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_50), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb3e50000  ! 635: SAVE_R	save	%r20, %r0, %r25
cpu_intr_0_62:
	setx	0x210023, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_51), 16, 16)) -> intp(0, 0, 39)
iob_intr_0_52:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_52), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_wr_34:
	mov	0x1c, %r14
	.word 0xfef38400  ! 642: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_0_53:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_53), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbfe44000  ! 646: SAVE_R	save	%r17, %r0, %r31
cpu_intr_0_63:
	setx	0x230207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb61d0000  ! 648: XOR_R	xor 	%r20, %r0, %r27
	.word 0xb33c8000  ! 649: SRA_R	sra 	%r18, %r0, %r25
T0_asi_reg_wr_35:
	mov	0x3c7, %r14
	.word 0xf6f38e40  ! 650: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_rd_23:
	mov	0x34, %r14
	.word 0xf2db8e80  ! 651: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb1e4e15c  ! 652: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_wr_36:
	mov	0xe, %r14
	.word 0xf4f38e60  ! 653: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T0_asi_reg_rd_24:
	mov	0x3c4, %r14
	.word 0xf2db8400  ! 655: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_64:
	setx	0x22022c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_37:
	mov	0x35, %r14
	.word 0xfaf38e80  ! 663: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb7e58000  ! 664: SAVE_R	save	%r22, %r0, %r27
	.word 0xb9e48000  ! 665: SAVE_R	save	%r18, %r0, %r28
T0_asi_reg_wr_38:
	mov	0xf, %r14
	.word 0xf4f38e80  ! 667: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T0_asi_reg_rd_25:
	mov	0x30, %r14
	.word 0xf6db84a0  ! 669: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_0_54:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_54), 16, 16)) -> intp(0, 0, 35)
cpu_intr_0_65:
	setx	0x21000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf2c8000  ! 677: SLL_R	sll 	%r18, %r0, %r31
cpu_intr_0_66:
	setx	0x21002f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_55:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_55), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_56:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_56), 16, 16)) -> intp(0, 0, 13)
cpu_intr_0_67:
	setx	0x22002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e48000  ! 686: SAVE_R	save	%r18, %r0, %r28
iob_intr_0_57:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_57), 16, 16)) -> intp(0, 0, 3e)
cpu_intr_0_68:
	setx	0x220236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe42146  ! 689: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_wr_39:
	mov	0x2c, %r14
	.word 0xfcf38e60  ! 692: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_0_58:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_58), 16, 16)) -> intp(0, 0, 3c)
cpu_intr_0_69:
	setx	0x21013a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_59:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_59), 16, 16)) -> intp(0, 0, 12)
	.word 0xb234c000  ! 701: ORN_R	orn 	%r19, %r0, %r25
	.word 0xb535f001  ! 703: SRLX_I	srlx	%r23, 0x0001, %r26
	.word 0xbfe48000  ! 704: SAVE_R	save	%r18, %r0, %r31
	.word 0xb5e4214e  ! 707: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb9e4a1cd  ! 711: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb3e5a1c9  ! 712: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbbe5e0e9  ! 715: SAVE_I	save	%r23, 0x0001, %r29
T0_asi_reg_rd_26:
	mov	0xe, %r14
	.word 0xf6db8e40  ! 716: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_rd_27:
	mov	0x3c0, %r14
	.word 0xf2db8e40  ! 717: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T0_asi_reg_wr_40:
	mov	0x5, %r14
	.word 0xfaf38e80  ! 721: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbfe48000  ! 725: SAVE_R	save	%r18, %r0, %r31
	.word 0xbde5c000  ! 727: SAVE_R	save	%r23, %r0, %r30
T0_asi_reg_rd_28:
	mov	0x3c6, %r14
	.word 0xf4db84a0  ! 728: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_0_70:
	setx	0x200306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde520a0  ! 731: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb3e4e108  ! 734: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbde50000  ! 735: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_wr_41:
	mov	0x1e, %r14
	.word 0xf2f38400  ! 736: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T0_asi_reg_wr_42:
	mov	0x3c7, %r14
	.word 0xf8f38e60  ! 738: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb3e4e114  ! 739: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_rd_29:
	mov	0x3c3, %r14
	.word 0xfedb89e0  ! 742: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb535f001  ! 744: SRLX_I	srlx	%r23, 0x0001, %r26
	.word 0xb9e561d6  ! 745: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb1e4a1ab  ! 752: SAVE_I	save	%r18, 0x0001, %r24
cpu_intr_0_71:
	setx	0x210002, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_72:
	setx	0x23021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe461c1  ! 758: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb9e5a165  ! 760: SAVE_I	save	%r22, 0x0001, %r28
cpu_intr_0_73:
	setx	0x23003b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_43:
	mov	0x3c4, %r14
	.word 0xf8f389e0  ! 763: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T0_asi_reg_rd_30:
	mov	0xe, %r14
	.word 0xf6db84a0  ! 764: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb3e4c000  ! 772: SAVE_R	save	%r19, %r0, %r25
	.word 0xb3e421ff  ! 774: SAVE_I	save	%r16, 0x0001, %r25
iob_intr_0_60:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_60), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_74:
	setx	0x210216, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_44:
	mov	0x3c5, %r14
	.word 0xf8f38e40  ! 780: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_75:
	setx	0x200038, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_45:
	mov	0x2e, %r14
	.word 0xf4f38e40  ! 784: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb57d8400  ! 789: MOVR_R	movre	%r22, %r0, %r26
	.word 0xb5e40000  ! 790: SAVE_R	save	%r16, %r0, %r26
	.word 0xbc354000  ! 794: ORN_R	orn 	%r21, %r0, %r30
	.word 0xb7e58000  ! 797: SAVE_R	save	%r22, %r0, %r27
	.word 0xbbe50000  ! 799: SAVE_R	save	%r20, %r0, %r29
	.word 0xb5e4e15f  ! 800: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb72dc000  ! 802: SLL_R	sll 	%r23, %r0, %r27
	.word 0xb3e4c000  ! 803: SAVE_R	save	%r19, %r0, %r25
	.word 0xb9e4e19d  ! 806: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbfe4e1b4  ! 808: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbbe48000  ! 809: SAVE_R	save	%r18, %r0, %r29
	.word 0xbfe40000  ! 811: SAVE_R	save	%r16, %r0, %r31
T0_asi_reg_wr_46:
	mov	0x3c0, %r14
	.word 0xfef38e80  ! 812: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb9e56069  ! 815: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb9e50000  ! 817: SAVE_R	save	%r20, %r0, %r28
T0_asi_reg_rd_31:
	mov	0x7, %r14
	.word 0xfedb8e40  ! 818: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb3e5a1f6  ! 822: SAVE_I	save	%r22, 0x0001, %r25
iob_intr_0_61:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_61), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_62:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_62), 16, 16)) -> intp(0, 0, 19)
T0_asi_reg_rd_32:
	mov	0x35, %r14
	.word 0xfcdb8e40  ! 828: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb8956183  ! 829: ORcc_I	orcc 	%r21, 0x0183, %r28
T0_asi_reg_wr_47:
	mov	0x23, %r14
	.word 0xf4f38e40  ! 830: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_76:
	setx	0x22000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a1a1  ! 833: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb884a0ad  ! 835: ADDcc_I	addcc 	%r18, 0x00ad, %r28
iob_intr_0_63:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_63), 16, 16)) -> intp(0, 0, 27)
	.word 0xb7348000  ! 843: SRL_R	srl 	%r18, %r0, %r27
iob_intr_0_64:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_64), 16, 16)) -> intp(0, 0, 9)
T0_asi_reg_wr_48:
	mov	0x1c, %r14
	.word 0xf6f38400  ! 845: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_0_65:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_65), 16, 16)) -> intp(0, 0, 4)
T0_asi_reg_wr_49:
	mov	0x2f, %r14
	.word 0xfaf38e60  ! 853: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbde40000  ! 855: SAVE_R	save	%r16, %r0, %r30
cpu_intr_0_77:
	setx	0x220013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbea4c000  ! 858: SUBcc_R	subcc 	%r19, %r0, %r31
T0_asi_reg_rd_33:
	mov	0x30, %r14
	.word 0xf0db8e40  ! 860: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbfe44000  ! 861: SAVE_R	save	%r17, %r0, %r31
	.word 0xbfe42146  ! 863: SAVE_I	save	%r16, 0x0001, %r31
cpu_intr_0_78:
	setx	0x210136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e52026  ! 867: SAVE_I	save	%r20, 0x0001, %r27
cpu_intr_0_79:
	setx	0x230236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 874: SAVE_R	save	%r16, %r0, %r24
	.word 0xb82c8000  ! 876: ANDN_R	andn 	%r18, %r0, %r28
	.word 0xb5e4c000  ! 877: SAVE_R	save	%r19, %r0, %r26
	.word 0xb5e4e077  ! 879: SAVE_I	save	%r19, 0x0001, %r26
iob_intr_0_66:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_66), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_rd_34:
	mov	0x3c6, %r14
	.word 0xfcdb89e0  ! 883: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0x8594609f  ! 886: WRPR_TSTATE_I	wrpr	%r17, 0x009f, %tstate
	.word 0xbbe54000  ! 887: SAVE_R	save	%r21, %r0, %r29
	.word 0xbd2c2001  ! 888: SLL_I	sll 	%r16, 0x0001, %r30
	.word 0xb2146168  ! 889: OR_I	or 	%r17, 0x0168, %r25
T0_asi_reg_wr_50:
	mov	0x1d, %r14
	.word 0xf4f38400  ! 893: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T0_asi_reg_rd_35:
	mov	0x3c7, %r14
	.word 0xfadb8e60  ! 896: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb7e48000  ! 899: SAVE_R	save	%r18, %r0, %r27
	.word 0xb3e44000  ! 901: SAVE_R	save	%r17, %r0, %r25
cpu_intr_0_80:
	setx	0x270232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e169  ! 904: SAVE_I	save	%r19, 0x0001, %r25
cpu_intr_0_81:
	setx	0x25002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e178  ! 908: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb61520dd  ! 909: OR_I	or 	%r20, 0x00dd, %r27
	.word 0xbde5a1c9  ! 912: SAVE_I	save	%r22, 0x0001, %r30
iob_intr_0_67:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_67), 16, 16)) -> intp(0, 0, a)
T0_asi_reg_wr_51:
	mov	0x3c4, %r14
	.word 0xf6f38e80  ! 915: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_0_68:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_68), 16, 16)) -> intp(0, 0, 22)
	.word 0xb77d8400  ! 917: MOVR_R	movre	%r22, %r0, %r27
	.word 0xb1e54000  ! 918: SAVE_R	save	%r21, %r0, %r24
T0_asi_reg_wr_52:
	mov	0x19, %r14
	.word 0xfcf38e40  ! 919: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_rd_36:
	mov	0x10, %r14
	.word 0xfedb84a0  ! 920: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb8c58000  ! 921: ADDCcc_R	addccc 	%r22, %r0, %r28
cpu_intr_0_82:
	setx	0x270205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd520000  ! 926: RDPR_PIL	<illegal instruction>
	.word 0xb5e58000  ! 932: SAVE_R	save	%r22, %r0, %r26
	.word 0xbbe48000  ! 933: SAVE_R	save	%r18, %r0, %r29
	.word 0xbfe44000  ! 934: SAVE_R	save	%r17, %r0, %r31
	.word 0xb3e48000  ! 936: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_wr_53:
	mov	0x3c3, %r14
	.word 0xf4f38e40  ! 937: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_83:
	setx	0x270308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e421a9  ! 940: SAVE_I	save	%r16, 0x0001, %r28
cpu_intr_0_84:
	setx	0x27010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e44000  ! 943: SAVE_R	save	%r17, %r0, %r26
iob_intr_0_69:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_69), 16, 16)) -> intp(0, 0, 15)
	.word 0xb62c0000  ! 949: ANDN_R	andn 	%r16, %r0, %r27
	.word 0xb1e4218f  ! 952: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbbe461a3  ! 953: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb1e48000  ! 955: SAVE_R	save	%r18, %r0, %r24
	.word 0xb13d2001  ! 956: SRA_I	sra 	%r20, 0x0001, %r24
iob_intr_0_70:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_70), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb5e46079  ! 960: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbde50000  ! 962: SAVE_R	save	%r20, %r0, %r30
iob_intr_0_71:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_71), 16, 16)) -> intp(0, 0, 5)
T0_asi_reg_rd_37:
	mov	0x13, %r14
	.word 0xf0db8400  ! 971: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbc0cc000  ! 972: AND_R	and 	%r19, %r0, %r30
	.word 0xbfe50000  ! 978: SAVE_R	save	%r20, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_85:
	setx	0x270230, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_86:
	setx	0x240328, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_87:
	setx	0x270313, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_88:
	setx	0x25021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6ac20a9  ! 996: ANDNcc_I	andncc 	%r16, 0x00a9, %r27
	.word 0xb295c000  ! 997: ORcc_R	orcc 	%r23, %r0, %r25
T0_asi_reg_wr_54:
	mov	0x3c5, %r14
	.word 0xfef384a0  ! 999: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T0_asi_reg_rd_38:
	mov	0x1f, %r14
	.word 0xf8db8e80  ! 1000: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_0_89:
	setx	0x270103, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_90:
	setx	0x24030d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_39:
	mov	0x3c6, %r14
	.word 0xfadb8e80  ! 1005: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_0_72:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_72), 16, 16)) -> intp(0, 0, 2)
iob_intr_0_73:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_73), 16, 16)) -> intp(0, 0, 24)
	.word 0xb8a58000  ! 1009: SUBcc_R	subcc 	%r22, %r0, %r28
cpu_intr_0_91:
	setx	0x27001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde44000  ! 1012: SAVE_R	save	%r17, %r0, %r30
cpu_intr_0_92:
	setx	0x270221, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_40:
	mov	0x29, %r14
	.word 0xfadb8e40  ! 1016: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb7e521dc  ! 1020: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9e48000  ! 1021: SAVE_R	save	%r18, %r0, %r28
iob_intr_0_74:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_74), 16, 16)) -> intp(0, 0, 9)
	.word 0xb3e50000  ! 1026: SAVE_R	save	%r20, %r0, %r25
	.word 0xb004618e  ! 1028: ADD_I	add 	%r17, 0x018e, %r24
T0_asi_reg_rd_41:
	mov	0x3c3, %r14
	.word 0xfcdb89e0  ! 1030: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb3e44000  ! 1037: SAVE_R	save	%r17, %r0, %r25
	.word 0xb22c8000  ! 1044: ANDN_R	andn 	%r18, %r0, %r25
T0_asi_reg_wr_55:
	mov	0x3c1, %r14
	.word 0xfaf38e40  ! 1046: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_rd_42:
	mov	0x3c8, %r14
	.word 0xfadb8e40  ! 1048: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_93:
	setx	0x250218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0140000  ! 1052: OR_R	or 	%r16, %r0, %r24
cpu_intr_0_94:
	setx	0x270202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e58000  ! 1054: SAVE_R	save	%r22, %r0, %r28
	.word 0xb9e5a00f  ! 1057: SAVE_I	save	%r22, 0x0001, %r28
cpu_intr_0_95:
	setx	0x270037, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_56:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 1061: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xba150000  ! 1067: OR_R	or 	%r20, %r0, %r29
T0_asi_reg_rd_43:
	mov	0x3c5, %r14
	.word 0xfcdb8e40  ! 1072: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb3e56083  ! 1075: SAVE_I	save	%r21, 0x0001, %r25
iob_intr_0_75:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_75), 16, 16)) -> intp(0, 0, 32)
T0_asi_reg_rd_44:
	mov	0x3c0, %r14
	.word 0xfcdb84a0  ! 1078: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T0_asi_reg_wr_57:
	mov	0x1, %r14
	.word 0xf4f38e60  ! 1080: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb3e4c000  ! 1081: SAVE_R	save	%r19, %r0, %r25
	.word 0xbbe52072  ! 1082: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb9e5c000  ! 1083: SAVE_R	save	%r23, %r0, %r28
	.word 0xbbe4e16e  ! 1084: SAVE_I	save	%r19, 0x0001, %r29
cpu_intr_0_96:
	setx	0x260211, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_76:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_76), 16, 16)) -> intp(0, 0, 0)
	.word 0xb7e54000  ! 1090: SAVE_R	save	%r21, %r0, %r27
	.word 0xb43c21dd  ! 1091: XNOR_I	xnor 	%r16, 0x01dd, %r26
cpu_intr_0_97:
	setx	0x24032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e50000  ! 1097: SAVE_R	save	%r20, %r0, %r24
cpu_intr_0_98:
	setx	0x260001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x89946026  ! 1104: WRPR_TICK_I	wrpr	%r17, 0x0026, %tick
	.word 0xbbe5a0f6  ! 1106: SAVE_I	save	%r22, 0x0001, %r29
cpu_intr_0_99:
	setx	0x250339, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_77:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_77), 16, 16)) -> intp(0, 0, a)
	.word 0xb2ad8000  ! 1116: ANDNcc_R	andncc 	%r22, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb13c8000  ! 1119: SRA_R	sra 	%r18, %r0, %r24
cpu_intr_0_100:
	setx	0x27013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e44000  ! 1123: SAVE_R	save	%r17, %r0, %r28
	.word 0xbc8da119  ! 1124: ANDcc_I	andcc 	%r22, 0x0119, %r30
cpu_intr_0_101:
	setx	0x240022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e44000  ! 1128: SAVE_R	save	%r17, %r0, %r24
iob_intr_0_78:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_78), 16, 16)) -> intp(0, 0, 16)
	.word 0xb9e50000  ! 1133: SAVE_R	save	%r20, %r0, %r28
cpu_intr_0_102:
	setx	0x240218, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_103:
	setx	0x250121, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_104:
	setx	0x25010d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_105:
	setx	0x27030d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_79:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_79), 16, 16)) -> intp(0, 0, 22)
	.word 0xb7e5e016  ! 1143: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_rd_45:
	mov	0x3c1, %r14
	.word 0xf8db8400  ! 1146: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T0_asi_reg_wr_58:
	mov	0x13, %r14
	.word 0xf2f389e0  ! 1148: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T0_asi_reg_wr_59:
	mov	0x16, %r14
	.word 0xf6f38e40  ! 1149: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb5e4e148  ! 1151: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb9e5a0c3  ! 1152: SAVE_I	save	%r22, 0x0001, %r28
iob_intr_0_80:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_80), 16, 16)) -> intp(0, 0, 1)
	.word 0xb3e54000  ! 1154: SAVE_R	save	%r21, %r0, %r25
T0_asi_reg_rd_46:
	mov	0x3c5, %r14
	.word 0xfadb8e40  ! 1155: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_106:
	setx	0x270032, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_60:
	mov	0x32, %r14
	.word 0xf6f384a0  ! 1162: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xbbe40000  ! 1165: SAVE_R	save	%r16, %r0, %r29
	.word 0xb3e52024  ! 1166: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb9e5a171  ! 1167: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7e58000  ! 1168: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_rd_47:
	mov	0x3c6, %r14
	.word 0xfadb8e60  ! 1170: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbde5a005  ! 1171: SAVE_I	save	%r22, 0x0001, %r30
iob_intr_0_81:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_81), 16, 16)) -> intp(0, 0, 23)
T0_asi_reg_rd_48:
	mov	0x37, %r14
	.word 0xfcdb84a0  ! 1173: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_0_107:
	setx	0x27021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_108:
	setx	0x240310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcbd2027  ! 1178: XNORcc_I	xnorcc 	%r20, 0x0027, %r30
iob_intr_0_82:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_82), 16, 16)) -> intp(0, 0, 3)
T0_asi_reg_rd_49:
	mov	0x27, %r14
	.word 0xf8db8e40  ! 1182: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_109:
	setx	0x240233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e50000  ! 1187: SAVE_R	save	%r20, %r0, %r28
iob_intr_0_83:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_83), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb1e4215e  ! 1199: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb5e46198  ! 1200: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb9e5617d  ! 1203: SAVE_I	save	%r21, 0x0001, %r28
cpu_intr_0_110:
	setx	0x250213, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_61:
	mov	0x19, %r14
	.word 0xf2f38e80  ! 1210: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbe0d0000  ! 1212: AND_R	and 	%r20, %r0, %r31
	.word 0xba44a0fc  ! 1216: ADDC_I	addc 	%r18, 0x00fc, %r29
T0_asi_reg_rd_50:
	mov	0x27, %r14
	.word 0xf8db8e40  ! 1217: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_wr_62:
	mov	0x9, %r14
	.word 0xf4f38e40  ! 1220: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb9e58000  ! 1223: SAVE_R	save	%r22, %r0, %r28
	.word 0xb5e4e112  ! 1224: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb9e44000  ! 1231: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_84:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_84), 16, 16)) -> intp(0, 0, 20)
	.word 0xb0448000  ! 1235: ADDC_R	addc 	%r18, %r0, %r24
cpu_intr_0_111:
	setx	0x26023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e40000  ! 1240: SAVE_R	save	%r16, %r0, %r25
cpu_intr_0_112:
	setx	0x26001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde520e5  ! 1242: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb9e58000  ! 1247: SAVE_R	save	%r22, %r0, %r28
iob_intr_0_85:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_85), 16, 16)) -> intp(0, 0, 2f)
	.word 0xbbe40000  ! 1249: SAVE_R	save	%r16, %r0, %r29
	.word 0xb5e460a1  ! 1251: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb3e58000  ! 1252: SAVE_R	save	%r22, %r0, %r25
cpu_intr_0_113:
	setx	0x27031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e46159  ! 1259: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb1e54000  ! 1263: SAVE_R	save	%r21, %r0, %r24
	.word 0xb9e56128  ! 1264: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb035e098  ! 1266: SUBC_I	orn 	%r23, 0x0098, %r24
	.word 0xb834606f  ! 1267: ORN_I	orn 	%r17, 0x006f, %r28
iob_intr_0_86:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_86), 16, 16)) -> intp(0, 0, 0)
	.word 0xb7e4e0c4  ! 1274: SAVE_I	save	%r19, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde52144  ! 1278: SAVE_I	save	%r20, 0x0001, %r30
iob_intr_0_87:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_87), 16, 16)) -> intp(0, 0, e)
iob_intr_0_88:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_88), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb9e5610b  ! 1284: SAVE_I	save	%r21, 0x0001, %r28
T0_asi_reg_wr_63:
	mov	0x1, %r14
	.word 0xf0f38400  ! 1285: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbde40000  ! 1286: SAVE_R	save	%r16, %r0, %r30
	.word 0xb9e4c000  ! 1290: SAVE_R	save	%r19, %r0, %r28
	.word 0xb2c58000  ! 1291: ADDCcc_R	addccc 	%r22, %r0, %r25
	.word 0xb5e4e0f6  ! 1295: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e44000  ! 1297: SAVE_R	save	%r17, %r0, %r27
T0_asi_reg_wr_64:
	mov	0x3c0, %r14
	.word 0xf4f38e80  ! 1298: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb6a5c000  ! 1301: SUBcc_R	subcc 	%r23, %r0, %r27
iob_intr_0_89:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_89), 16, 16)) -> intp(0, 0, 14)
iob_intr_0_90:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_90), 16, 16)) -> intp(0, 0, 16)
	.word 0xb9e5c000  ! 1314: SAVE_R	save	%r23, %r0, %r28
	.word 0xbde4c000  ! 1317: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_114:
	setx	0x270328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 1326: SAVE_R	save	%r22, %r0, %r26
	.word 0xbfe44000  ! 1327: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_91:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_91), 16, 16)) -> intp(0, 0, 8)
	.word 0xb9e4e160  ! 1339: SAVE_I	save	%r19, 0x0001, %r28
cpu_intr_0_115:
	setx	0x270313, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_65:
	mov	0x3, %r14
	.word 0xf0f38e40  ! 1342: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb1e56078  ! 1343: SAVE_I	save	%r21, 0x0001, %r24
iob_intr_0_92:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_92), 16, 16)) -> intp(0, 0, 5)
	.word 0xb37c8400  ! 1346: MOVR_R	movre	%r18, %r0, %r25
cpu_intr_0_116:
	setx	0x240019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e56006  ! 1349: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbbe5a14f  ! 1350: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5e40000  ! 1351: SAVE_R	save	%r16, %r0, %r26
	.word 0xb5e50000  ! 1353: SAVE_R	save	%r20, %r0, %r26
T0_asi_reg_wr_66:
	mov	0x2, %r14
	.word 0xf6f384a0  ! 1355: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb17c8400  ! 1358: MOVR_R	movre	%r18, %r0, %r24
iob_intr_0_93:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_93), 16, 16)) -> intp(0, 0, 23)
cpu_intr_0_117:
	setx	0x270224, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_94:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_94), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb9e5a12f  ! 1363: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_wr_67:
	mov	0x21, %r14
	.word 0xf8f38e60  ! 1365: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T0_asi_reg_rd_51:
	mov	0x15, %r14
	.word 0xf6db8e60  ! 1366: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb9e4e1b0  ! 1367: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_wr_68:
	mov	0x36, %r14
	.word 0xf4f389e0  ! 1369: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbbe54000  ! 1370: SAVE_R	save	%r21, %r0, %r29
	.word 0xbfe521c0  ! 1371: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbbe50000  ! 1374: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_rd_52:
	mov	0x22, %r14
	.word 0xf4db8e40  ! 1375: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb1e50000  ! 1376: SAVE_R	save	%r20, %r0, %r24
iob_intr_0_95:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_95), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_rd_53:
	mov	0xc, %r14
	.word 0xf4db8e40  ! 1378: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb7e50000  ! 1380: SAVE_R	save	%r20, %r0, %r27
T0_asi_reg_wr_69:
	mov	0x37, %r14
	.word 0xfef384a0  ! 1381: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb2c560f3  ! 1385: ADDCcc_I	addccc 	%r21, 0x00f3, %r25
	.word 0xbfe4601f  ! 1386: SAVE_I	save	%r17, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_70:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 1389: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_rd_54:
	mov	0x3, %r14
	.word 0xf4db8e40  ! 1390: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_0_118:
	setx	0x29033c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_119:
	setx	0x28012a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_55:
	mov	0x3c0, %r14
	.word 0xfcdb84a0  ! 1398: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb9e4a171  ! 1400: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb9e5c000  ! 1401: SAVE_R	save	%r23, %r0, %r28
	.word 0xbfe58000  ! 1408: SAVE_R	save	%r22, %r0, %r31
T0_asi_reg_rd_56:
	mov	0x9, %r14
	.word 0xf0db8e40  ! 1410: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_rd_57:
	mov	0x2, %r14
	.word 0xfedb8400  ! 1413: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb1e460fb  ! 1417: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb9e58000  ! 1418: SAVE_R	save	%r22, %r0, %r28
	.word 0xb9e44000  ! 1419: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_96:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_96), 16, 16)) -> intp(0, 0, a)
	.word 0xbe3560ff  ! 1423: SUBC_I	orn 	%r21, 0x00ff, %r31
cpu_intr_0_120:
	setx	0x28022b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_97:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_97), 16, 16)) -> intp(0, 0, 3a)
cpu_intr_0_121:
	setx	0x2b0313, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_98:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_98), 16, 16)) -> intp(0, 0, 2e)
	.word 0xbde44000  ! 1433: SAVE_R	save	%r17, %r0, %r30
	.word 0xb1e56135  ! 1435: SAVE_I	save	%r21, 0x0001, %r24
cpu_intr_0_122:
	setx	0x29001b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_99:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_99), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_rd_58:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 1444: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbde50000  ! 1446: SAVE_R	save	%r20, %r0, %r30
	.word 0xbb2cb001  ! 1447: SLLX_I	sllx	%r18, 0x0001, %r29
iob_intr_0_100:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_100), 16, 16)) -> intp(0, 0, 15)
	.word 0xb6242138  ! 1450: SUB_I	sub 	%r16, 0x0138, %r27
	.word 0xb5e48000  ! 1451: SAVE_R	save	%r18, %r0, %r26
	.word 0xb4ad6145  ! 1454: ANDNcc_I	andncc 	%r21, 0x0145, %r26
	.word 0xbde460a8  ! 1455: SAVE_I	save	%r17, 0x0001, %r30
T0_asi_reg_rd_59:
	mov	0x25, %r14
	.word 0xf2db8e60  ! 1456: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe40000  ! 1458: SAVE_R	save	%r16, %r0, %r31
T0_asi_reg_rd_60:
	mov	0x3c6, %r14
	.word 0xfadb8e60  ! 1460: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_0_101:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_101), 16, 16)) -> intp(0, 0, 14)
cpu_intr_0_123:
	setx	0x28020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e54000  ! 1466: SAVE_R	save	%r21, %r0, %r26
iob_intr_0_102:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_102), 16, 16)) -> intp(0, 0, 36)
cpu_intr_0_124:
	setx	0x2a033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6148000  ! 1469: OR_R	or 	%r18, %r0, %r27
T0_asi_reg_wr_71:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 1470: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb3e4a15a  ! 1471: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe5a0d7  ! 1472: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbde461bd  ! 1473: SAVE_I	save	%r17, 0x0001, %r30
T0_asi_reg_rd_61:
	mov	0x24, %r14
	.word 0xf8db89e0  ! 1475: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb7e4e0e3  ! 1478: SAVE_I	save	%r19, 0x0001, %r27
T0_asi_reg_rd_62:
	mov	0x23, %r14
	.word 0xf6db8e40  ! 1480: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_103:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_103), 16, 16)) -> intp(0, 0, d)
	.word 0xbde44000  ! 1483: SAVE_R	save	%r17, %r0, %r30
cpu_intr_0_125:
	setx	0x2b0117, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_126:
	setx	0x2b0122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 1486: SAVE_R	save	%r22, %r0, %r26
cpu_intr_0_127:
	setx	0x2b010e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_128:
	setx	0x2b022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e42152  ! 1491: SAVE_I	save	%r16, 0x0001, %r27
T0_asi_reg_rd_63:
	mov	0x18, %r14
	.word 0xfcdb8e80  ! 1493: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb7e44000  ! 1494: SAVE_R	save	%r17, %r0, %r27
	.word 0xbde54000  ! 1495: SAVE_R	save	%r21, %r0, %r30
T0_asi_reg_wr_72:
	mov	0x24, %r14
	.word 0xf0f38e40  ! 1497: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbbe5205b  ! 1501: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbfe54000  ! 1502: SAVE_R	save	%r21, %r0, %r31
	.word 0xbbe4a195  ! 1506: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb1e54000  ! 1507: SAVE_R	save	%r21, %r0, %r24
	.word 0xb13d8000  ! 1513: SRA_R	sra 	%r22, %r0, %r24
	.word 0xb5e4e180  ! 1516: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbebc6094  ! 1517: XNORcc_I	xnorcc 	%r17, 0x0094, %r31
iob_intr_0_104:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_104), 16, 16)) -> intp(0, 0, 2f)
	.word 0xbde50000  ! 1519: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_wr_73:
	mov	0x11, %r14
	.word 0xfcf38e40  ! 1520: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_129:
	setx	0x2b0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe48000  ! 1524: SAVE_R	save	%r18, %r0, %r31
	.word 0xb9e56038  ! 1526: SAVE_I	save	%r21, 0x0001, %r28
cpu_intr_0_130:
	setx	0x2a023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb02d60c2  ! 1529: ANDN_I	andn 	%r21, 0x00c2, %r24
cpu_intr_0_131:
	setx	0x2a0207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e48000  ! 1540: SAVE_R	save	%r18, %r0, %r26
cpu_intr_0_132:
	setx	0x2b0033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b54000  ! 1542: ORNcc_R	orncc 	%r21, %r0, %r24
	.word 0xb1e44000  ! 1545: SAVE_R	save	%r17, %r0, %r24
cpu_intr_0_133:
	setx	0x2b0120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e460dd  ! 1550: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_wr_74:
	mov	0x3c6, %r14
	.word 0xf8f384a0  ! 1553: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb1e58000  ! 1554: SAVE_R	save	%r22, %r0, %r24
T0_asi_reg_rd_64:
	mov	0x3c2, %r14
	.word 0xfadb8e40  ! 1557: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb9e48000  ! 1562: SAVE_R	save	%r18, %r0, %r28
iob_intr_0_105:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_105), 16, 16)) -> intp(0, 0, 3a)
iob_intr_0_106:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_106), 16, 16)) -> intp(0, 0, 2c)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_107:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_107), 16, 16)) -> intp(0, 0, 1)
	.word 0xb5e44000  ! 1579: SAVE_R	save	%r17, %r0, %r26
	.word 0xb3e50000  ! 1582: SAVE_R	save	%r20, %r0, %r25
T0_asi_reg_rd_65:
	mov	0x1a, %r14
	.word 0xf2db89e0  ! 1585: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_0_134:
	setx	0x280333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb13da001  ! 1591: SRA_I	sra 	%r22, 0x0001, %r24
	.word 0xb1e4211c  ! 1596: SAVE_I	save	%r16, 0x0001, %r24
cpu_intr_0_135:
	setx	0x280031, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_75:
	mov	0x1d, %r14
	.word 0xfaf38400  ! 1598: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_0_136:
	setx	0x280113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_108:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_108), 16, 16)) -> intp(0, 0, 37)
	.word 0xb17d0400  ! 1605: MOVR_R	movre	%r20, %r0, %r24
	.word 0xbb3d0000  ! 1606: SRA_R	sra 	%r20, %r0, %r29
	.word 0xbfe5e095  ! 1607: SAVE_I	save	%r23, 0x0001, %r31
T0_asi_reg_rd_66:
	mov	0x7, %r14
	.word 0xf2db8e40  ! 1611: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb9e5a08f  ! 1612: SAVE_I	save	%r22, 0x0001, %r28
iob_intr_0_109:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_109), 16, 16)) -> intp(0, 0, b)
cpu_intr_0_137:
	setx	0x290314, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_67:
	mov	0x14, %r14
	.word 0xf0db8400  ! 1615: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_0_110:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_110), 16, 16)) -> intp(0, 0, 35)
T0_asi_reg_rd_68:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 1620: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_111:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_111), 16, 16)) -> intp(0, 0, 3d)
T0_asi_reg_wr_76:
	mov	0xf, %r14
	.word 0xf6f38e40  ! 1627: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_0_138:
	setx	0x2a0308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe48000  ! 1635: SAVE_R	save	%r18, %r0, %r31
	.word 0xbde5c000  ! 1636: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_139:
	setx	0x2a001c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_112:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_112), 16, 16)) -> intp(0, 0, 31)
	.word 0xbfe44000  ! 1645: SAVE_R	save	%r17, %r0, %r31
	.word 0xb9e52097  ! 1646: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb9e5a039  ! 1648: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_rd_69:
	mov	0x28, %r14
	.word 0xfedb8400  ! 1649: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb5e420ce  ! 1653: SAVE_I	save	%r16, 0x0001, %r26
cpu_intr_0_140:
	setx	0x280039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e461dd  ! 1656: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb3e421ce  ! 1657: SAVE_I	save	%r16, 0x0001, %r25
iob_intr_0_113:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_113), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb3e56178  ! 1659: SAVE_I	save	%r21, 0x0001, %r25
T0_asi_reg_rd_70:
	mov	0x9, %r14
	.word 0xf8db8e40  ! 1663: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb9e4213a  ! 1664: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbbe560ca  ! 1666: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb9e5e188  ! 1667: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_wr_77:
	mov	0x3c8, %r14
	.word 0xf0f38e80  ! 1668: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_0_141:
	setx	0x290230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4c000  ! 1680: SAVE_R	save	%r19, %r0, %r28
iob_intr_0_114:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_114), 16, 16)) -> intp(0, 0, b)
cpu_intr_0_142:
	setx	0x2b0014, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_78:
	mov	0x18, %r14
	.word 0xfaf389e0  ! 1684: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb5e48000  ! 1689: SAVE_R	save	%r18, %r0, %r26
	.word 0xb9e5c000  ! 1690: SAVE_R	save	%r23, %r0, %r28
	.word 0xb8240000  ! 1691: SUB_R	sub 	%r16, %r0, %r28
	.word 0xb1e44000  ! 1695: SAVE_R	save	%r17, %r0, %r24
iob_intr_0_115:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_115), 16, 16)) -> intp(0, 0, 0)
cpu_intr_0_143:
	setx	0x290108, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_116:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_116), 16, 16)) -> intp(0, 0, 3c)
iob_intr_0_117:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_117), 16, 16)) -> intp(0, 0, 17)
	.word 0xbde5a0eb  ! 1702: SAVE_I	save	%r22, 0x0001, %r30
cpu_intr_0_144:
	setx	0x2a0203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde52036  ! 1707: SAVE_I	save	%r20, 0x0001, %r30
cpu_intr_0_145:
	setx	0x2a0200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5357001  ! 1712: SRLX_I	srlx	%r21, 0x0001, %r26
	.word 0xb1e461fb  ! 1713: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb5e54000  ! 1716: SAVE_R	save	%r21, %r0, %r26
	.word 0xb57c4400  ! 1722: MOVR_R	movre	%r17, %r0, %r26
	.word 0xb3e5e08f  ! 1723: SAVE_I	save	%r23, 0x0001, %r25
cpu_intr_0_146:
	setx	0x290133, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_118:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_118), 16, 16)) -> intp(0, 0, 33)
	.word 0xb3e4a0b0  ! 1732: SAVE_I	save	%r18, 0x0001, %r25
iob_intr_0_119:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_119), 16, 16)) -> intp(0, 0, 9)
	.word 0xbbe46030  ! 1734: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb21d8000  ! 1735: XOR_R	xor 	%r22, %r0, %r25
	.word 0x8f902001  ! 1738: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
cpu_intr_0_147:
	setx	0x2a001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb49d209d  ! 1742: XORcc_I	xorcc 	%r20, 0x009d, %r26
	.word 0xb1e58000  ! 1743: SAVE_R	save	%r22, %r0, %r24
T0_asi_reg_wr_79:
	mov	0x34, %r14
	.word 0xfcf38e40  ! 1750: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_148:
	setx	0x2b0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e075  ! 1754: SAVE_I	save	%r23, 0x0001, %r28
iob_intr_0_120:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_120), 16, 16)) -> intp(0, 0, 1b)
cpu_intr_0_149:
	setx	0x280034, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_121:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_121), 16, 16)) -> intp(0, 0, 34)
	.word 0xb550c000  ! 1767: RDPR_TT	<illegal instruction>
	.word 0xb5e54000  ! 1768: SAVE_R	save	%r21, %r0, %r26
iob_intr_0_122:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_122), 16, 16)) -> intp(0, 0, 27)
iob_intr_0_123:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_123), 16, 16)) -> intp(0, 0, 3b)
iob_intr_0_124:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_124), 16, 16)) -> intp(0, 0, 21)
	.word 0xbd510000  ! 1774: RDPR_TICK	<illegal instruction>
iob_intr_0_125:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_125), 16, 16)) -> intp(0, 0, 1f)
cpu_intr_0_150:
	setx	0x2b0135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e58000  ! 1786: SAVE_R	save	%r22, %r0, %r27
cpu_intr_0_151:
	setx	0x2b0121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e54000  ! 1790: SAVE_R	save	%r21, %r0, %r26
cpu_intr_0_152:
	setx	0x28010e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_126:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_126), 16, 16)) -> intp(0, 0, 10)
	.word 0xb7e40000  ! 1794: SAVE_R	save	%r16, %r0, %r27
	.word 0xb1e5e08c  ! 1796: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_127:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_127), 16, 16)) -> intp(0, 0, 33)
	.word 0xb9e56054  ! 1800: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb7e50000  ! 1802: SAVE_R	save	%r20, %r0, %r27
iob_intr_0_128:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_128), 16, 16)) -> intp(0, 0, 1d)
T0_asi_reg_wr_80:
	mov	0x3c2, %r14
	.word 0xf2f38e80  ! 1804: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_71:
	mov	0x33, %r14
	.word 0xf0db8e40  ! 1808: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb3e5e031  ! 1814: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e5c000  ! 1818: SAVE_R	save	%r23, %r0, %r26
	.word 0xb1e5c000  ! 1819: SAVE_R	save	%r23, %r0, %r24
	.word 0xb3e560aa  ! 1825: SAVE_I	save	%r21, 0x0001, %r25
cpu_intr_0_153:
	setx	0x28012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb245a190  ! 1828: ADDC_I	addc 	%r22, 0x0190, %r25
	.word 0xb5e560c4  ! 1829: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbde4e1b8  ! 1830: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_rd_72:
	mov	0x4, %r14
	.word 0xf2db8e40  ! 1834: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0x8f902002  ! 1835: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
T0_asi_reg_wr_81:
	mov	0x33, %r14
	.word 0xfaf38e40  ! 1836: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_rd_73:
	mov	0x1c, %r14
	.word 0xfadb8e60  ! 1837: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_0_154:
	setx	0x2e0002, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_155:
	setx	0x2f023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x879461dc  ! 1842: WRPR_TT_I	wrpr	%r17, 0x01dc, %tt
	.word 0xbfe44000  ! 1844: SAVE_R	save	%r17, %r0, %r31
	.word 0xb1e5c000  ! 1845: SAVE_R	save	%r23, %r0, %r24
	.word 0xb3e4e111  ! 1847: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb7e5211d  ! 1850: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb0340000  ! 1851: SUBC_R	orn 	%r16, %r0, %r24
cpu_intr_0_156:
	setx	0x2f0310, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_129:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_129), 16, 16)) -> intp(0, 0, 35)
	.word 0xb1e4a0f6  ! 1855: SAVE_I	save	%r18, 0x0001, %r24
T0_asi_reg_rd_74:
	mov	0x8, %r14
	.word 0xf6db89e0  ! 1856: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb3e48000  ! 1857: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_wr_82:
	mov	0x5, %r14
	.word 0xf2f38e80  ! 1862: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb1e48000  ! 1863: SAVE_R	save	%r18, %r0, %r24
cpu_intr_0_157:
	setx	0x2d003c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_75:
	mov	0x1d, %r14
	.word 0xfadb8e40  ! 1867: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb01c0000  ! 1871: XOR_R	xor 	%r16, %r0, %r24
T0_asi_reg_wr_83:
	mov	0xe, %r14
	.word 0xf6f38e40  ! 1874: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb244a1ac  ! 1877: ADDC_I	addc 	%r18, 0x01ac, %r25
T0_asi_reg_rd_76:
	mov	0x38, %r14
	.word 0xf8db89e0  ! 1878: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb285c000  ! 1880: ADDcc_R	addcc 	%r23, %r0, %r25
	.word 0xbfe5a1e9  ! 1881: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb7e5e172  ! 1882: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbbe58000  ! 1883: SAVE_R	save	%r22, %r0, %r29
	.word 0xb9e5a0a9  ! 1884: SAVE_I	save	%r22, 0x0001, %r28
iob_intr_0_130:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_130), 16, 16)) -> intp(0, 0, 3a)
	.word 0xbac420a0  ! 1896: ADDCcc_I	addccc 	%r16, 0x00a0, %r29
	.word 0xbbe48000  ! 1897: SAVE_R	save	%r18, %r0, %r29
iob_intr_0_131:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_131), 16, 16)) -> intp(0, 0, 35)
iob_intr_0_132:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_132), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb3e48000  ! 1901: SAVE_R	save	%r18, %r0, %r25
	.word 0xb014c000  ! 1902: OR_R	or 	%r19, %r0, %r24
	.word 0xbbe48000  ! 1903: SAVE_R	save	%r18, %r0, %r29
cpu_intr_0_158:
	setx	0x2e0135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e50000  ! 1908: SAVE_R	save	%r20, %r0, %r28
	.word 0xb3e4c000  ! 1909: SAVE_R	save	%r19, %r0, %r25
	.word 0xbfe5c000  ! 1911: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_133:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_133), 16, 16)) -> intp(0, 0, 21)
T0_asi_reg_wr_84:
	mov	0x3c7, %r14
	.word 0xfaf389e0  ! 1917: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_0_159:
	setx	0x2d0114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e521b0  ! 1927: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_wr_85:
	mov	0x24, %r14
	.word 0xfcf384a0  ! 1929: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_0_134:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_134), 16, 16)) -> intp(0, 0, 12)
T0_asi_reg_rd_77:
	mov	0x19, %r14
	.word 0xf8db8e80  ! 1933: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T0_asi_reg_wr_86:
	mov	0x3c5, %r14
	.word 0xf8f38e40  ! 1934: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_160:
	setx	0x2f0024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe56078  ! 1936: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbd7d0400  ! 1939: MOVR_R	movre	%r20, %r0, %r30
T0_asi_reg_rd_78:
	mov	0x3c8, %r14
	.word 0xfcdb8e60  ! 1941: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb5e58000  ! 1942: SAVE_R	save	%r22, %r0, %r26
	.word 0xbbe54000  ! 1945: SAVE_R	save	%r21, %r0, %r29
T0_asi_reg_rd_79:
	mov	0xd, %r14
	.word 0xf6db84a0  ! 1947: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_80:
	mov	0x2, %r14
	.word 0xf6db8400  ! 1950: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb1e4c000  ! 1951: SAVE_R	save	%r19, %r0, %r24
	.word 0xb5e5a1ba  ! 1953: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb9e52143  ! 1954: SAVE_I	save	%r20, 0x0001, %r28
iob_intr_0_135:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_135), 16, 16)) -> intp(0, 0, 33)
iob_intr_0_136:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_136), 16, 16)) -> intp(0, 0, e)
cpu_intr_0_161:
	setx	0x2d0333, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_137:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_137), 16, 16)) -> intp(0, 0, 12)
	.word 0xbd540000  ! 1961: RDPR_GL	<illegal instruction>
	.word 0xb69c0000  ! 1963: XORcc_R	xorcc 	%r16, %r0, %r27
iob_intr_0_138:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_138), 16, 16)) -> intp(0, 0, a)
iob_intr_0_139:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_139), 16, 16)) -> intp(0, 0, 1b)
iob_intr_0_140:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_140), 16, 16)) -> intp(0, 0, 1d)
iob_intr_0_141:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_141), 16, 16)) -> intp(0, 0, 3e)
T0_asi_reg_rd_81:
	mov	0x3c3, %r14
	.word 0xf0db8e80  ! 1969: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T0_asi_reg_wr_87:
	mov	0x3c7, %r14
	.word 0xfcf38e40  ! 1970: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_142:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_142), 16, 16)) -> intp(0, 0, 3)
	.word 0xb1e5c000  ! 1973: SAVE_R	save	%r23, %r0, %r24
cpu_intr_0_162:
	setx	0x2d011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e082  ! 1979: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb4944000  ! 1981: ORcc_R	orcc 	%r17, %r0, %r26
iob_intr_0_143:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_143), 16, 16)) -> intp(0, 0, 2a)
iob_intr_0_144:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_144), 16, 16)) -> intp(0, 0, 0)
iob_intr_0_145:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_145), 16, 16)) -> intp(0, 0, 3)
iob_intr_0_146:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_146), 16, 16)) -> intp(0, 0, 9)
	.word 0xbfe5a02b  ! 1990: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_147:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_147), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb6c561a8  ! 2002: ADDCcc_I	addccc 	%r21, 0x01a8, %r27
T0_asi_reg_wr_88:
	mov	0x14, %r14
	.word 0xf8f38e80  ! 2008: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T0_asi_reg_wr_89:
	mov	0x11, %r14
	.word 0xf0f389e0  ! 2010: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T0_asi_reg_wr_90:
	mov	0x4, %r14
	.word 0xf4f38e60  ! 2011: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xbde5e0b1  ! 2014: SAVE_I	save	%r23, 0x0001, %r30
cpu_intr_0_163:
	setx	0x2e000b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_82:
	mov	0x3c0, %r14
	.word 0xf6db8e60  ! 2017: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb57c2401  ! 2021: MOVR_I	movre	%r16, 0x1, %r26
	.word 0xbde44000  ! 2022: SAVE_R	save	%r17, %r0, %r30
cpu_intr_0_164:
	setx	0x2f0325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbabd4000  ! 2025: XNORcc_R	xnorcc 	%r21, %r0, %r29
cpu_intr_0_165:
	setx	0x2c0120, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_91:
	mov	0x1, %r14
	.word 0xfef38e80  ! 2027: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T0_asi_reg_wr_92:
	mov	0x3c8, %r14
	.word 0xf0f38e60  ! 2028: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T0_asi_reg_rd_83:
	mov	0xe, %r14
	.word 0xf6db8e60  ! 2029: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_0_148:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_148), 16, 16)) -> intp(0, 0, 1f)
	.word 0xbfe4209f  ! 2034: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_rd_84:
	mov	0x9, %r14
	.word 0xf0db84a0  ! 2036: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb3e50000  ! 2039: SAVE_R	save	%r20, %r0, %r25
cpu_intr_0_166:
	setx	0x2d0021, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_85:
	mov	0x3c6, %r14
	.word 0xfedb8e40  ! 2043: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbfe4201e  ! 2044: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_rd_86:
	mov	0x24, %r14
	.word 0xf6db84a0  ! 2045: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_0_149:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_149), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_rd_87:
	mov	0x5, %r14
	.word 0xfcdb84a0  ! 2049: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T0_asi_reg_rd_88:
	mov	0x4, %r14
	.word 0xfadb84a0  ! 2051: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_0_167:
	setx	0x2f013e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_150:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_150), 16, 16)) -> intp(0, 0, c)
	.word 0xb1e4609e  ! 2059: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbfe4a1d1  ! 2061: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb5e48000  ! 2063: SAVE_R	save	%r18, %r0, %r26
	.word 0xb4344000  ! 2064: SUBC_R	orn 	%r17, %r0, %r26
	.word 0xbbe50000  ! 2067: SAVE_R	save	%r20, %r0, %r29
	.word 0xbfe54000  ! 2070: SAVE_R	save	%r21, %r0, %r31
cpu_intr_0_168:
	setx	0x2e0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe420db  ! 2074: SAVE_I	save	%r16, 0x0001, %r31
cpu_intr_0_169:
	setx	0x2e0322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb004e017  ! 2078: ADD_I	add 	%r19, 0x0017, %r24
	.word 0xbfe4c000  ! 2081: SAVE_R	save	%r19, %r0, %r31
T0_asi_reg_rd_89:
	mov	0x1c, %r14
	.word 0xf8db89e0  ! 2082: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb1e4204f  ! 2083: SAVE_I	save	%r16, 0x0001, %r24
cpu_intr_0_170:
	setx	0x2e021f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_171:
	setx	0x2c000a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_172:
	setx	0x2d0112, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_90:
	mov	0x1b, %r14
	.word 0xfedb84a0  ! 2091: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T0_asi_reg_rd_91:
	mov	0x1f, %r14
	.word 0xfedb89e0  ! 2092: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbb51c000  ! 2097: RDPR_TL	<illegal instruction>
	.word 0xbbe4c000  ! 2102: SAVE_R	save	%r19, %r0, %r29
	.word 0xbc8ce1f6  ! 2107: ANDcc_I	andcc 	%r19, 0x01f6, %r30
	.word 0xb3e58000  ! 2109: SAVE_R	save	%r22, %r0, %r25
	.word 0xbfe460af  ! 2110: SAVE_I	save	%r17, 0x0001, %r31
iob_intr_0_151:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_151), 16, 16)) -> intp(0, 0, 2a)
iob_intr_0_152:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_152), 16, 16)) -> intp(0, 0, 2d)
T0_asi_reg_rd_92:
	mov	0x3c0, %r14
	.word 0xfcdb8e80  ! 2116: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_0_173:
	setx	0x2d0332, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_93:
	mov	0x1, %r14
	.word 0xf8f38400  ! 2118: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_0_153:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_153), 16, 16)) -> intp(0, 0, 31)
cpu_intr_0_174:
	setx	0x2c0120, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_154:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_154), 16, 16)) -> intp(0, 0, 20)
	.word 0xb3e50000  ! 2128: SAVE_R	save	%r20, %r0, %r25
iob_intr_0_155:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_155), 16, 16)) -> intp(0, 0, 28)
T0_asi_reg_rd_93:
	mov	0x2c, %r14
	.word 0xfcdb8e40  ! 2130: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb9e4c000  ! 2132: SAVE_R	save	%r19, %r0, %r28
	.word 0xbfe4a0e7  ! 2135: SAVE_I	save	%r18, 0x0001, %r31
iob_intr_0_156:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_156), 16, 16)) -> intp(0, 0, 17)
cpu_intr_0_175:
	setx	0x2d0032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e54000  ! 2140: SAVE_R	save	%r21, %r0, %r26
	.word 0xbbe4a19d  ! 2143: SAVE_I	save	%r18, 0x0001, %r29
cpu_intr_0_176:
	setx	0x2e0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a15d  ! 2148: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb52c6001  ! 2149: SLL_I	sll 	%r17, 0x0001, %r26
	.word 0xb1e54000  ! 2152: SAVE_R	save	%r21, %r0, %r24
cpu_intr_0_177:
	setx	0x2e022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd340000  ! 2155: SRL_R	srl 	%r16, %r0, %r30
	.word 0xbbe56008  ! 2158: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb9e58000  ! 2159: SAVE_R	save	%r22, %r0, %r28
iob_intr_0_157:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_157), 16, 16)) -> intp(0, 0, 35)
	.word 0xb1e5a134  ! 2161: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e40000  ! 2163: SAVE_R	save	%r16, %r0, %r26
	.word 0xbb7d2401  ! 2164: MOVR_I	movre	%r20, 0x1, %r29
	.word 0xb9e4e17b  ! 2169: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb5e4c000  ! 2170: SAVE_R	save	%r19, %r0, %r26
iob_intr_0_158:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_158), 16, 16)) -> intp(0, 0, 23)
	.word 0xbbe4e173  ! 2174: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb9e40000  ! 2177: SAVE_R	save	%r16, %r0, %r28
	.word 0xb9350000  ! 2178: SRL_R	srl 	%r20, %r0, %r28
cpu_intr_0_178:
	setx	0x2f0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a19d  ! 2184: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbfe520ee  ! 2186: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb7e46182  ! 2189: SAVE_I	save	%r17, 0x0001, %r27
cpu_intr_0_179:
	setx	0x2d0202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a004  ! 2196: SAVE_I	save	%r22, 0x0001, %r26
iob_intr_0_159:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_159), 16, 16)) -> intp(0, 0, 29)
cpu_intr_0_180:
	setx	0x2f021c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_181:
	setx	0x2d032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a19a  ! 2204: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_rd_94:
	mov	0x1d, %r14
	.word 0xf2db8e60  ! 2209: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb5354000  ! 2210: SRL_R	srl 	%r21, %r0, %r26
	.word 0xb7e58000  ! 2211: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_wr_94:
	mov	0x8, %r14
	.word 0xf4f38e80  ! 2212: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_0_182:
	setx	0x2d031b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_183:
	setx	0x2d0021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb845e170  ! 2225: ADDC_I	addc 	%r23, 0x0170, %r28
cpu_intr_0_184:
	setx	0x2e0315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e54000  ! 2230: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_wr_95:
	mov	0x3c4, %r14
	.word 0xfcf38e80  ! 2232: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb1e48000  ! 2233: SAVE_R	save	%r18, %r0, %r24
	.word 0xb1e421e7  ! 2236: SAVE_I	save	%r16, 0x0001, %r24
cpu_intr_0_185:
	setx	0x2f0200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe8cc000  ! 2240: ANDcc_R	andcc 	%r19, %r0, %r31
	.word 0xb73d6001  ! 2241: SRA_I	sra 	%r21, 0x0001, %r27
	.word 0xb9e58000  ! 2246: SAVE_R	save	%r22, %r0, %r28
iob_intr_0_160:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_160), 16, 16)) -> intp(0, 0, 3)
	.word 0xb53c3001  ! 2249: SRAX_I	srax	%r16, 0x0001, %r26
iob_intr_0_161:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_161), 16, 16)) -> intp(0, 0, 3)
	.word 0xb3e4a083  ! 2256: SAVE_I	save	%r18, 0x0001, %r25
T0_asi_reg_wr_96:
	mov	0x3, %r14
	.word 0xfaf384a0  ! 2258: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T0_asi_reg_rd_95:
	mov	0x1a, %r14
	.word 0xf4db8e40  ! 2260: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_162:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_162), 16, 16)) -> intp(0, 0, 23)
T0_asi_reg_rd_96:
	mov	0x9, %r14
	.word 0xfcdb8e80  ! 2264: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbbe4a071  ! 2267: SAVE_I	save	%r18, 0x0001, %r29
cpu_intr_0_186:
	setx	0x2e000b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_97:
	mov	0x10, %r14
	.word 0xf6f389e0  ! 2271: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb9e4a0cc  ! 2273: SAVE_I	save	%r18, 0x0001, %r28
iob_intr_0_163:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_163), 16, 16)) -> intp(0, 0, 18)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_187:
	setx	0x2d033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e06a  ! 2282: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_164:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_164), 16, 16)) -> intp(0, 0, 1d)
cpu_intr_0_188:
	setx	0x2f0330, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_97:
	mov	0x36, %r14
	.word 0xf0db8e40  ! 2285: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_165:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_165), 16, 16)) -> intp(0, 0, 5)
cpu_intr_0_189:
	setx	0x2f011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6bc2049  ! 2289: XNORcc_I	xnorcc 	%r16, 0x0049, %r27
	.word 0xbe0de12f  ! 2297: AND_I	and 	%r23, 0x012f, %r31
cpu_intr_0_190:
	setx	0x31001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4c000  ! 2301: SAVE_R	save	%r19, %r0, %r24
cpu_intr_0_191:
	setx	0x310017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e15e  ! 2305: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb445c000  ! 2306: ADDC_R	addc 	%r23, %r0, %r26
iob_intr_0_166:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_166), 16, 16)) -> intp(0, 0, 5)
cpu_intr_0_192:
	setx	0x30030f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_193:
	setx	0x310011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e40000  ! 2315: SAVE_R	save	%r16, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_98:
	mov	0x3c4, %r14
	.word 0xfaf38400  ! 2320: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_0_167:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_167), 16, 16)) -> intp(0, 0, 0)
iob_intr_0_168:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_168), 16, 16)) -> intp(0, 0, 3f)
cpu_intr_0_194:
	setx	0x300304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12d1000  ! 2328: SLLX_R	sllx	%r20, %r0, %r24
	.word 0xbde54000  ! 2331: SAVE_R	save	%r21, %r0, %r30
T0_asi_reg_wr_99:
	mov	0x22, %r14
	.word 0xf2f38e40  ! 2332: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbd520000  ! 2333: RDPR_PIL	<illegal instruction>
	.word 0xbf520000  ! 2334: RDPR_PIL	<illegal instruction>
T0_asi_reg_rd_98:
	mov	0x1f, %r14
	.word 0xf6db8e40  ! 2338: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0x8995615e  ! 2340: WRPR_TICK_I	wrpr	%r21, 0x015e, %tick
iob_intr_0_169:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_169), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_wr_100:
	mov	0x3c4, %r14
	.word 0xfef38e80  ! 2347: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb9e521d5  ! 2348: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_195:
	setx	0x30023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8c618c  ! 2351: ANDcc_I	andcc 	%r17, 0x018c, %r30
	.word 0xb2b5e07b  ! 2354: SUBCcc_I	orncc 	%r23, 0x007b, %r25
	.word 0xb1e4a15b  ! 2355: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbf504000  ! 2356: RDPR_TNPC	<illegal instruction>
	.word 0xb0b4c000  ! 2361: SUBCcc_R	orncc 	%r19, %r0, %r24
	.word 0xbbe5a164  ! 2366: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_170:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_170), 16, 16)) -> intp(0, 0, 5)
	.word 0xb7e50000  ! 2375: SAVE_R	save	%r20, %r0, %r27
cpu_intr_0_196:
	setx	0x32031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb77d6401  ! 2381: MOVR_I	movre	%r21, 0x1, %r27
	.word 0xb97c4400  ! 2382: MOVR_R	movre	%r17, %r0, %r28
T0_asi_reg_rd_99:
	mov	0x27, %r14
	.word 0xf0db8400  ! 2384: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_0_197:
	setx	0x33011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e48000  ! 2387: SAVE_R	save	%r18, %r0, %r27
	.word 0xb6846117  ! 2389: ADDcc_I	addcc 	%r17, 0x0117, %r27
	.word 0xb1e5e0f5  ! 2393: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_wr_101:
	mov	0x3c3, %r14
	.word 0xf8f384a0  ! 2396: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbf2ce001  ! 2397: SLL_I	sll 	%r19, 0x0001, %r31
cpu_intr_0_198:
	setx	0x320029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a00f  ! 2399: SAVE_I	save	%r22, 0x0001, %r28
iob_intr_0_171:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_171), 16, 16)) -> intp(0, 0, 11)
	.word 0xbfe5e00c  ! 2409: SAVE_I	save	%r23, 0x0001, %r31
cpu_intr_0_199:
	setx	0x330023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe58000  ! 2411: SAVE_R	save	%r22, %r0, %r29
	.word 0xbfe4e1e6  ! 2413: SAVE_I	save	%r19, 0x0001, %r31
cpu_intr_0_200:
	setx	0x300032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4c000  ! 2416: SAVE_R	save	%r19, %r0, %r31
T0_asi_reg_wr_102:
	mov	0x27, %r14
	.word 0xfaf38e80  ! 2417: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_0_201:
	setx	0x300323, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_202:
	setx	0x320225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e46039  ! 2421: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb9e5a14b  ! 2424: SAVE_I	save	%r22, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_203:
	setx	0x320211, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_103:
	mov	0x38, %r14
	.word 0xfcf38e40  ! 2434: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_172:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_172), 16, 16)) -> intp(0, 0, 33)
T0_asi_reg_wr_104:
	mov	0x3c6, %r14
	.word 0xf0f384a0  ! 2437: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb1e4a127  ! 2438: SAVE_I	save	%r18, 0x0001, %r24
T0_asi_reg_wr_105:
	mov	0x3c3, %r14
	.word 0xfaf38e80  ! 2439: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb1641800  ! 2441: MOVcc_R	<illegal instruction>
iob_intr_0_173:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_173), 16, 16)) -> intp(0, 0, 15)
	.word 0xb9e44000  ! 2448: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_wr_106:
	mov	0x23, %r14
	.word 0xfcf38e40  ! 2449: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbde58000  ! 2450: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_204:
	setx	0x320033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde44000  ! 2460: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_rd_100:
	mov	0x1e, %r14
	.word 0xf6db84a0  ! 2462: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbbe4a10d  ! 2466: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde44000  ! 2468: SAVE_R	save	%r17, %r0, %r30
	.word 0xbfe5e11f  ! 2469: SAVE_I	save	%r23, 0x0001, %r31
iob_intr_0_174:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_174), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_rd_101:
	mov	0x3c4, %r14
	.word 0xfcdb89e0  ! 2474: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_0_205:
	setx	0x310035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_206:
	setx	0x30032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2c40000  ! 2478: ADDCcc_R	addccc 	%r16, %r0, %r25
T0_asi_reg_wr_107:
	mov	0x7, %r14
	.word 0xf6f38e80  ! 2482: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb02cc000  ! 2484: ANDN_R	andn 	%r19, %r0, %r24
T0_asi_reg_rd_102:
	mov	0x14, %r14
	.word 0xf2db8400  ! 2485: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T0_asi_reg_wr_108:
	mov	0x3c7, %r14
	.word 0xf2f38e80  ! 2486: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T0_asi_reg_rd_103:
	mov	0x3c6, %r14
	.word 0xfadb84a0  ! 2487: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb69dc000  ! 2488: XORcc_R	xorcc 	%r23, %r0, %r27
	.word 0xb9e5200d  ! 2489: SAVE_I	save	%r20, 0x0001, %r28
T0_asi_reg_rd_104:
	mov	0xe, %r14
	.word 0xf6db8400  ! 2491: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb3e520ee  ! 2492: SAVE_I	save	%r20, 0x0001, %r25
cpu_intr_0_207:
	setx	0x330137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x91946167  ! 2494: WRPR_PIL_I	wrpr	%r17, 0x0167, %pil
cpu_intr_0_208:
	setx	0x30030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_105:
	mov	0x7, %r14
	.word 0xf0db8400  ! 2498: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb335b001  ! 2499: SRLX_I	srlx	%r22, 0x0001, %r25
	.word 0xb1e4c000  ! 2500: SAVE_R	save	%r19, %r0, %r24
	.word 0xbfe44000  ! 2506: SAVE_R	save	%r17, %r0, %r31
T0_asi_reg_rd_106:
	mov	0x35, %r14
	.word 0xf2db8e40  ! 2507: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T0_asi_reg_wr_109:
	mov	0x13, %r14
	.word 0xf4f38e40  ! 2509: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_wr_110:
	mov	0x3c6, %r14
	.word 0xfcf38e40  ! 2510: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_rd_107:
	mov	0x7, %r14
	.word 0xf2db8e40  ! 2511: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T0_asi_reg_wr_111:
	mov	0x14, %r14
	.word 0xfaf38e80  ! 2512: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T0_asi_reg_rd_108:
	mov	0x32, %r14
	.word 0xfedb8e80  ! 2513: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb0b4e077  ! 2515: SUBCcc_I	orncc 	%r19, 0x0077, %r24
T0_asi_reg_wr_112:
	mov	0x6, %r14
	.word 0xf0f38e80  ! 2517: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_0_175:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_175), 16, 16)) -> intp(0, 0, 30)
	.word 0xb3e50000  ! 2520: SAVE_R	save	%r20, %r0, %r25
iob_intr_0_176:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_176), 16, 16)) -> intp(0, 0, 10)
cpu_intr_0_209:
	setx	0x300024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde50000  ! 2525: SAVE_R	save	%r20, %r0, %r30
iob_intr_0_177:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_177), 16, 16)) -> intp(0, 0, 27)
	.word 0xb7e4a0c6  ! 2530: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb9e54000  ! 2532: SAVE_R	save	%r21, %r0, %r28
cpu_intr_0_210:
	setx	0x32020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4c000  ! 2536: SAVE_R	save	%r19, %r0, %r24
	.word 0xb1e5e0a9  ! 2537: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_rd_109:
	mov	0x26, %r14
	.word 0xf8db8400  ! 2539: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_0_211:
	setx	0x320233, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_113:
	mov	0x24, %r14
	.word 0xf0f38400  ! 2545: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbfe4a0e4  ! 2550: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_wr_114:
	mov	0x3c2, %r14
	.word 0xf8f384a0  ! 2551: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T0_asi_reg_rd_110:
	mov	0x1, %r14
	.word 0xfadb8e80  ! 2553: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T0_asi_reg_wr_115:
	mov	0x1c, %r14
	.word 0xf4f384a0  ! 2554: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_0_212:
	setx	0x33033a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_178:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_178), 16, 16)) -> intp(0, 0, 1c)
iob_intr_0_179:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_179), 16, 16)) -> intp(0, 0, 1)
	.word 0xbfe421e8  ! 2559: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbde50000  ! 2561: SAVE_R	save	%r20, %r0, %r30
	.word 0xb9e421e6  ! 2562: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbbe5e054  ! 2563: SAVE_I	save	%r23, 0x0001, %r29
T0_asi_reg_wr_116:
	mov	0x8, %r14
	.word 0xf4f38e60  ! 2564: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb1e44000  ! 2566: SAVE_R	save	%r17, %r0, %r24
cpu_intr_0_213:
	setx	0x33022a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_117:
	mov	0x3c1, %r14
	.word 0xf0f38e60  ! 2569: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_0_214:
	setx	0x310020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe40000  ! 2571: SAVE_R	save	%r16, %r0, %r31
cpu_intr_0_215:
	setx	0x320029, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_111:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 2573: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_216:
	setx	0x31033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde44000  ! 2578: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_wr_118:
	mov	0x2e, %r14
	.word 0xf4f38e40  ! 2579: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb5e44000  ! 2580: SAVE_R	save	%r17, %r0, %r26
T0_asi_reg_wr_119:
	mov	0x26, %r14
	.word 0xfef389e0  ! 2586: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb6bc2199  ! 2590: XNORcc_I	xnorcc 	%r16, 0x0199, %r27
	.word 0xbde5e070  ! 2591: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbfe4a1ba  ! 2592: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7e5c000  ! 2595: SAVE_R	save	%r23, %r0, %r27
cpu_intr_0_217:
	setx	0x300330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5c000  ! 2599: SAVE_R	save	%r23, %r0, %r26
	.word 0xb3e5a1ff  ! 2602: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb7e5c000  ! 2605: SAVE_R	save	%r23, %r0, %r27
	.word 0xbcb4a1b7  ! 2607: SUBCcc_I	orncc 	%r18, 0x01b7, %r30
cpu_intr_0_218:
	setx	0x320308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e50000  ! 2613: SAVE_R	save	%r20, %r0, %r25
	.word 0xbd34d000  ! 2614: SRLX_R	srlx	%r19, %r0, %r30
iob_intr_0_180:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_180), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_wr_120:
	mov	0x3c4, %r14
	.word 0xf6f389e0  ! 2622: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb9e4615e  ! 2623: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbf7da401  ! 2624: MOVR_I	movre	%r22, 0x1, %r31
T0_asi_reg_rd_112:
	mov	0x2c, %r14
	.word 0xf8db8e80  ! 2626: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbfe4e0cf  ! 2628: SAVE_I	save	%r19, 0x0001, %r31
T0_asi_reg_wr_121:
	mov	0x1b, %r14
	.word 0xf2f384a0  ! 2631: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbbe54000  ! 2633: SAVE_R	save	%r21, %r0, %r29
	.word 0xbfe4613d  ! 2639: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_rd_113:
	mov	0x12, %r14
	.word 0xf8db8e80  ! 2645: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb7e44000  ! 2649: SAVE_R	save	%r17, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_219:
	setx	0x10323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe0d605f  ! 2655: AND_I	and 	%r21, 0x005f, %r31
	.word 0xbd3d9000  ! 2656: SRAX_R	srax	%r22, %r0, %r30
iob_intr_0_181:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_181), 16, 16)) -> intp(0, 0, 23)
	.word 0xba8420de  ! 2659: ADDcc_I	addcc 	%r16, 0x00de, %r29
	.word 0xb9e4203f  ! 2660: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbfe40000  ! 2661: SAVE_R	save	%r16, %r0, %r31
cpu_intr_0_220:
	setx	0x310314, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_182:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_182), 16, 16)) -> intp(0, 0, 15)
iob_intr_0_183:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_183), 16, 16)) -> intp(0, 0, 19)
	.word 0xb7e4c000  ! 2671: SAVE_R	save	%r19, %r0, %r27
	.word 0xb4b58000  ! 2673: SUBCcc_R	orncc 	%r22, %r0, %r26
	.word 0xb9e5a15b  ! 2675: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbde58000  ! 2676: SAVE_R	save	%r22, %r0, %r30
iob_intr_0_184:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_184), 16, 16)) -> intp(0, 0, 28)
T0_asi_reg_wr_122:
	mov	0x3c4, %r14
	.word 0xf0f389e0  ! 2680: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T0_asi_reg_wr_123:
	mov	0x35, %r14
	.word 0xf0f38e40  ! 2681: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbde40000  ! 2684: SAVE_R	save	%r16, %r0, %r30
	.word 0xbfe4c000  ! 2685: SAVE_R	save	%r19, %r0, %r31
	.word 0xb52d0000  ! 2686: SLL_R	sll 	%r20, %r0, %r26
	.word 0xb9e5a06b  ! 2689: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_wr_124:
	mov	0x5, %r14
	.word 0xfaf38e40  ! 2690: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb3e4e1c4  ! 2694: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_rd_114:
	mov	0x1, %r14
	.word 0xf2db84a0  ! 2697: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb28d0000  ! 2699: ANDcc_R	andcc 	%r20, %r0, %r25
T0_asi_reg_wr_125:
	mov	0x3c0, %r14
	.word 0xf0f38400  ! 2701: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_0_185:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_185), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb6a4614a  ! 2709: SUBcc_I	subcc 	%r17, 0x014a, %r27
	.word 0xb7e461e2  ! 2712: SAVE_I	save	%r17, 0x0001, %r27
iob_intr_0_186:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_186), 16, 16)) -> intp(0, 0, 36)
iob_intr_0_187:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_187), 16, 16)) -> intp(0, 0, 1f)
iob_intr_0_188:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_188), 16, 16)) -> intp(0, 0, 37)
	.word 0xb2c4213b  ! 2720: ADDCcc_I	addccc 	%r16, 0x013b, %r25
iob_intr_0_189:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_189), 16, 16)) -> intp(0, 0, 19)
	.word 0xb7e5e061  ! 2725: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_rd_115:
	mov	0x26, %r14
	.word 0xf8db8e60  ! 2727: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb9e52132  ! 2729: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbb2d3001  ! 2732: SLLX_I	sllx	%r20, 0x0001, %r29
cpu_intr_0_221:
	setx	0x37013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e40000  ! 2746: SAVE_R	save	%r16, %r0, %r28
	.word 0xb1e5611f  ! 2749: SAVE_I	save	%r21, 0x0001, %r24
T0_asi_reg_rd_116:
	mov	0x3c7, %r14
	.word 0xfcdb8e80  ! 2751: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb2b58000  ! 2752: SUBCcc_R	orncc 	%r22, %r0, %r25
T0_asi_reg_rd_117:
	mov	0x3c5, %r14
	.word 0xfadb8e80  ! 2756: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_0_222:
	setx	0x34022b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_190:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_190), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb9e44000  ! 2764: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_191:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_191), 16, 16)) -> intp(0, 0, 6)
	.word 0xb3e48000  ! 2766: SAVE_R	save	%r18, %r0, %r25
	.word 0xb9e40000  ! 2767: SAVE_R	save	%r16, %r0, %r28
	.word 0xbc1cc000  ! 2769: XOR_R	xor 	%r19, %r0, %r30
iob_intr_0_192:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_192), 16, 16)) -> intp(0, 0, 4)
T0_asi_reg_rd_118:
	mov	0x5, %r14
	.word 0xf0db8e80  ! 2773: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_0_223:
	setx	0x360332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbac42109  ! 2775: ADDCcc_I	addccc 	%r16, 0x0109, %r29
iob_intr_0_193:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_193), 16, 16)) -> intp(0, 0, b)
T0_asi_reg_rd_119:
	mov	0x3c8, %r14
	.word 0xf0db8e40  ! 2783: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb9e48000  ! 2784: SAVE_R	save	%r18, %r0, %r28
	.word 0xbfe54000  ! 2789: SAVE_R	save	%r21, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb1e50000  ! 2791: SAVE_R	save	%r20, %r0, %r24
iob_intr_0_194:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_194), 16, 16)) -> intp(0, 0, 1)
T0_asi_reg_wr_126:
	mov	0x37, %r14
	.word 0xfaf38400  ! 2794: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb1e4a1ba  ! 2798: SAVE_I	save	%r18, 0x0001, %r24
iob_intr_0_195:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_195), 16, 16)) -> intp(0, 0, 32)
iob_intr_0_196:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_196), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb7e4e174  ! 2808: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde461bd  ! 2810: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7e5e13e  ! 2811: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e4a000  ! 2813: SAVE_I	save	%r18, 0x0001, %r26
cpu_intr_0_224:
	setx	0x350127, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_120:
	mov	0x1f, %r14
	.word 0xf0db8400  ! 2816: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb3e421d0  ! 2819: SAVE_I	save	%r16, 0x0001, %r25
iob_intr_0_197:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_197), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb7e4e13b  ! 2821: SAVE_I	save	%r19, 0x0001, %r27
cpu_intr_0_225:
	setx	0x34021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e52074  ! 2824: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb9e4e02e  ! 2825: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_wr_127:
	mov	0x36, %r14
	.word 0xf4f38e40  ! 2826: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_rd_121:
	mov	0x20, %r14
	.word 0xf2db8e40  ! 2827: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_226:
	setx	0x35023a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_198:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_198), 16, 16)) -> intp(0, 0, 10)
iob_intr_0_199:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_199), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_227:
	setx	0x360016, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_200:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_200), 16, 16)) -> intp(0, 0, 4)
	.word 0xbde5a05b  ! 2834: SAVE_I	save	%r22, 0x0001, %r30
iob_intr_0_201:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_201), 16, 16)) -> intp(0, 0, 3b)
T0_asi_reg_rd_122:
	mov	0xc, %r14
	.word 0xf4db8e40  ! 2838: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_0_228:
	setx	0x34020a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_229:
	setx	0x370021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4601d  ! 2846: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbab48000  ! 2847: SUBCcc_R	orncc 	%r18, %r0, %r29
	.word 0xbfe48000  ! 2848: SAVE_R	save	%r18, %r0, %r31
	.word 0xbb7cc400  ! 2849: MOVR_R	movre	%r19, %r0, %r29
T0_asi_reg_wr_128:
	mov	0x36, %r14
	.word 0xf6f38e40  ! 2850: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_0_202:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_202), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_203:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_203), 16, 16)) -> intp(0, 0, 38)
	.word 0xb32cc000  ! 2855: SLL_R	sll 	%r19, %r0, %r25
	.word 0x8795e15a  ! 2856: WRPR_TT_I	wrpr	%r23, 0x015a, %tt
cpu_intr_0_230:
	setx	0x36031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5603b  ! 2860: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb7e50000  ! 2861: SAVE_R	save	%r20, %r0, %r27
	.word 0xb3e5e06f  ! 2872: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb9e50000  ! 2874: SAVE_R	save	%r20, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_204:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_204), 16, 16)) -> intp(0, 0, 3d)
T0_asi_reg_wr_129:
	mov	0x10, %r14
	.word 0xf4f38e80  ! 2878: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_0_231:
	setx	0x37032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb48cc000  ! 2895: ANDcc_R	andcc 	%r19, %r0, %r26
T0_asi_reg_wr_130:
	mov	0x14, %r14
	.word 0xfaf38e40  ! 2899: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_205:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_205), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_rd_123:
	mov	0x6, %r14
	.word 0xf2db84a0  ! 2901: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbde5a145  ! 2904: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_wr_131:
	mov	0x1b, %r14
	.word 0xf8f38e40  ! 2905: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbbe460ae  ! 2906: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb3e5e161  ! 2908: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_rd_124:
	mov	0x13, %r14
	.word 0xf2db8400  ! 2910: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb17c0400  ! 2911: MOVR_R	movre	%r16, %r0, %r24
	.word 0xb9e44000  ! 2912: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_wr_132:
	mov	0x3c0, %r14
	.word 0xfef38e80  ! 2914: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb1e48000  ! 2921: SAVE_R	save	%r18, %r0, %r24
T0_asi_reg_wr_133:
	mov	0x3c6, %r14
	.word 0xf8f384a0  ! 2922: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T0_asi_reg_wr_134:
	mov	0x34, %r14
	.word 0xf2f38e40  ! 2923: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_0_232:
	setx	0x36011a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_135:
	mov	0xb, %r14
	.word 0xf2f38400  ! 2926: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb7e5e120  ! 2928: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb3e5618a  ! 2929: SAVE_I	save	%r21, 0x0001, %r25
cpu_intr_0_233:
	setx	0x340220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5c000  ! 2931: SAVE_R	save	%r23, %r0, %r31
	.word 0xb9e4213c  ! 2932: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9e5c000  ! 2933: SAVE_R	save	%r23, %r0, %r28
cpu_intr_0_234:
	setx	0x350201, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_235:
	setx	0x34031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_206:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_206), 16, 16)) -> intp(0, 0, 5)
	.word 0xb5e5e1eb  ! 2938: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_wr_136:
	mov	0x15, %r14
	.word 0xf6f38400  ! 2941: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbde5a009  ! 2944: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_wr_137:
	mov	0x3c2, %r14
	.word 0xf6f38e80  ! 2945: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb3e44000  ! 2946: SAVE_R	save	%r17, %r0, %r25
	.word 0xbde5e190  ! 2947: SAVE_I	save	%r23, 0x0001, %r30
T0_asi_reg_rd_125:
	mov	0x2f, %r14
	.word 0xfcdb8400  ! 2948: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_138:
	mov	0x3c4, %r14
	.word 0xfcf38e60  ! 2950: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb1e4a1d9  ! 2957: SAVE_I	save	%r18, 0x0001, %r24
iob_intr_0_207:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_207), 16, 16)) -> intp(0, 0, 29)
	.word 0xbbe54000  ! 2959: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_208:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_208), 16, 16)) -> intp(0, 0, 24)
	.word 0xbf34d000  ! 2973: SRLX_R	srlx	%r19, %r0, %r31
T0_asi_reg_wr_139:
	mov	0x32, %r14
	.word 0xf0f38e80  ! 2974: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_0_236:
	setx	0x350308, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_209:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_209), 16, 16)) -> intp(0, 0, 8)
	.word 0xbde5a139  ! 2977: SAVE_I	save	%r22, 0x0001, %r30
iob_intr_0_210:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_210), 16, 16)) -> intp(0, 0, a)
cpu_intr_0_237:
	setx	0x36033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e44000  ! 2983: SAVE_R	save	%r17, %r0, %r27
	.word 0xbde5e1c4  ! 2985: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbde48000  ! 2986: SAVE_R	save	%r18, %r0, %r30
cpu_intr_0_238:
	setx	0x370338, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_211:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_211), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_rd_126:
	mov	0x3c2, %r14
	.word 0xfcdb8400  ! 2991: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbde4c000  ! 2992: SAVE_R	save	%r19, %r0, %r30
	.word 0xb3e44000  ! 2993: SAVE_R	save	%r17, %r0, %r25
cpu_intr_0_239:
	setx	0x340024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a17c  ! 2999: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1e5e0c4  ! 3006: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_212:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_212), 16, 16)) -> intp(0, 0, 1d)
cpu_intr_0_240:
	setx	0x340331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4201f  ! 3009: SAVE_I	save	%r16, 0x0001, %r27
T0_asi_reg_wr_140:
	mov	0xe, %r14
	.word 0xf2f38400  ! 3010: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbfe5c000  ! 3011: SAVE_R	save	%r23, %r0, %r31
	.word 0xb37d0400  ! 3012: MOVR_R	movre	%r20, %r0, %r25
T0_asi_reg_rd_127:
	mov	0x4, %r14
	.word 0xfcdb89e0  ! 3013: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_0_241:
	setx	0x37012f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_242:
	setx	0x370132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a176  ! 3023: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb9e4c000  ! 3024: SAVE_R	save	%r19, %r0, %r28
iob_intr_0_213:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_213), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb7e58000  ! 3026: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_rd_128:
	mov	0x1c, %r14
	.word 0xf8db8e80  ! 3028: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_0_243:
	setx	0x35011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4c000  ! 3037: SAVE_R	save	%r19, %r0, %r24
iob_intr_0_214:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_214), 16, 16)) -> intp(0, 0, 1c)
iob_intr_0_215:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_215), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb9e50000  ! 3042: SAVE_R	save	%r20, %r0, %r28
iob_intr_0_216:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_216), 16, 16)) -> intp(0, 0, 1e)
cpu_intr_0_244:
	setx	0x350311, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_245:
	setx	0x34002a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_246:
	setx	0x35033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e005  ! 3059: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbe252128  ! 3061: SUB_I	sub 	%r20, 0x0128, %r31
	.word 0xbbe54000  ! 3064: SAVE_R	save	%r21, %r0, %r29
	.word 0xb5e54000  ! 3065: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_wr_141:
	mov	0xd, %r14
	.word 0xfaf384a0  ! 3069: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbde54000  ! 3071: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_247:
	setx	0x350018, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_217:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_217), 16, 16)) -> intp(0, 0, 1e)
iob_intr_0_218:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_218), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb1e46160  ! 3078: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb9e521e6  ! 3079: SAVE_I	save	%r20, 0x0001, %r28
iob_intr_0_219:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_219), 16, 16)) -> intp(0, 0, 34)
	.word 0xb5e40000  ! 3082: SAVE_R	save	%r16, %r0, %r26
	.word 0xb9e40000  ! 3083: SAVE_R	save	%r16, %r0, %r28
	.word 0xb1e40000  ! 3085: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_248:
	setx	0x340202, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_249:
	setx	0x35032b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_250:
	setx	0x350013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e0e9  ! 3091: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb93d6001  ! 3093: SRA_I	sra 	%r21, 0x0001, %r28
T0_asi_reg_wr_142:
	mov	0x3c3, %r14
	.word 0xf4f38e40  ! 3095: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb9e561c8  ! 3097: SAVE_I	save	%r21, 0x0001, %r28
cpu_intr_0_251:
	setx	0x360018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a10d  ! 3101: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbfe561dd  ! 3102: SAVE_I	save	%r21, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e4c000  ! 3104: SAVE_R	save	%r19, %r0, %r28
iob_intr_0_220:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_220), 16, 16)) -> intp(0, 0, 11)
cpu_intr_0_252:
	setx	0x360009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a0ed  ! 3113: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb3e4e006  ! 3116: SAVE_I	save	%r19, 0x0001, %r25
cpu_intr_0_253:
	setx	0x37031c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_143:
	mov	0x3, %r14
	.word 0xf2f38e80  ! 3119: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb9e4a125  ! 3120: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbbe46086  ! 3121: SAVE_I	save	%r17, 0x0001, %r29
T0_asi_reg_rd_129:
	mov	0x27, %r14
	.word 0xf2db8e40  ! 3122: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb1e521db  ! 3126: SAVE_I	save	%r20, 0x0001, %r24
cpu_intr_0_254:
	setx	0x34023c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_221:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_221), 16, 16)) -> intp(0, 0, 4)
	.word 0xbfe44000  ! 3139: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_222:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_222), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb7e48000  ! 3142: SAVE_R	save	%r18, %r0, %r27
T0_asi_reg_rd_130:
	mov	0x3, %r14
	.word 0xfedb8e40  ! 3143: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_0_255:
	setx	0x360238, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_144:
	mov	0x3c5, %r14
	.word 0xfaf384a0  ! 3148: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbe348000  ! 3150: ORN_R	orn 	%r18, %r0, %r31
	.word 0xbde52152  ! 3151: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb5e48000  ! 3153: SAVE_R	save	%r18, %r0, %r26
cpu_intr_0_256:
	setx	0x360118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 3157: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_223:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_223), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_224:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_224), 16, 16)) -> intp(0, 0, 27)
cpu_intr_0_257:
	setx	0x360004, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_225:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_225), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_rd_131:
	mov	0x1e, %r14
	.word 0xf8db8e80  ! 3166: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb7e54000  ! 3168: SAVE_R	save	%r21, %r0, %r27
iob_intr_0_226:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_226), 16, 16)) -> intp(0, 0, 2f)
iob_intr_0_227:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_227), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb9354000  ! 3176: SRL_R	srl 	%r21, %r0, %r28
	.word 0xb5e44000  ! 3179: SAVE_R	save	%r17, %r0, %r26
	.word 0xb1e58000  ! 3180: SAVE_R	save	%r22, %r0, %r24
T0_asi_reg_rd_132:
	mov	0x3c2, %r14
	.word 0xf4db84a0  ! 3182: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb7e5c000  ! 3183: SAVE_R	save	%r23, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_145:
	mov	0xd, %r14
	.word 0xfef38e40  ! 3186: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_0_228:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_228), 16, 16)) -> intp(0, 0, 27)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xa1902001  ! 3190: WRPR_GL_I	wrpr	%r0, 0x0001, %-
T0_asi_reg_wr_146:
	mov	0x14, %r14
	.word 0xfaf38e40  ! 3200: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_147:
	mov	0x2c, %r14
	.word 0xfaf384a0  ! 3203: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb351c000  ! 3204: RDPR_TL	<illegal instruction>
cpu_intr_0_258:
	setx	0x390006, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_133:
	mov	0x12, %r14
	.word 0xf8db8e80  ! 3209: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb1e44000  ! 3212: SAVE_R	save	%r17, %r0, %r24
cpu_intr_0_259:
	setx	0x3a010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e58000  ! 3214: SAVE_R	save	%r22, %r0, %r28
iob_intr_0_229:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_229), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb03da13c  ! 3217: XNOR_I	xnor 	%r22, 0x013c, %r24
	.word 0xb9e5a018  ! 3218: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_rd_134:
	mov	0x2b, %r14
	.word 0xfadb8e40  ! 3222: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb97d4400  ! 3226: MOVR_R	movre	%r21, %r0, %r28
	.word 0xb9e5e027  ! 3229: SAVE_I	save	%r23, 0x0001, %r28
iob_intr_0_230:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_230), 16, 16)) -> intp(0, 0, 2e)
cpu_intr_0_260:
	setx	0x390300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e58000  ! 3232: SAVE_R	save	%r22, %r0, %r28
	.word 0xb3e44000  ! 3233: SAVE_R	save	%r17, %r0, %r25
cpu_intr_0_261:
	setx	0x380327, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_135:
	mov	0x3c4, %r14
	.word 0xf2db8400  ! 3238: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T0_asi_reg_wr_148:
	mov	0x2, %r14
	.word 0xf6f38e40  ! 3239: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb1e4e0fb  ! 3240: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7e5c000  ! 3241: SAVE_R	save	%r23, %r0, %r27
cpu_intr_0_262:
	setx	0x390111, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e40000  ! 3245: SAVE_R	save	%r16, %r0, %r27
iob_intr_0_231:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_231), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_232:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_232), 16, 16)) -> intp(0, 0, 39)
	.word 0xb634a17a  ! 3259: ORN_I	orn 	%r18, 0x017a, %r27
iob_intr_0_233:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_233), 16, 16)) -> intp(0, 0, 10)
	.word 0xb5e40000  ! 3261: SAVE_R	save	%r16, %r0, %r26
cpu_intr_0_263:
	setx	0x380030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc3c0000  ! 3263: XNOR_R	xnor 	%r16, %r0, %r30
	.word 0xbf7c0400  ! 3264: MOVR_R	movre	%r16, %r0, %r31
cpu_intr_0_264:
	setx	0x3a030f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_149:
	mov	0x3c4, %r14
	.word 0xfaf389e0  ! 3267: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbde48000  ! 3268: SAVE_R	save	%r18, %r0, %r30
	.word 0xbfe50000  ! 3269: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_265:
	setx	0x3a012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e05a  ! 3276: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbbe40000  ! 3277: SAVE_R	save	%r16, %r0, %r29
	.word 0xb1e42159  ! 3279: SAVE_I	save	%r16, 0x0001, %r24
T0_asi_reg_rd_136:
	mov	0x0, %r14
	.word 0xf8db8e80  ! 3282: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T0_asi_reg_rd_137:
	mov	0x1d, %r14
	.word 0xf6db8400  ! 3285: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb5e40000  ! 3289: SAVE_R	save	%r16, %r0, %r26
	.word 0xbab520ff  ! 3290: SUBCcc_I	orncc 	%r20, 0x00ff, %r29
T0_asi_reg_wr_150:
	mov	0x3c3, %r14
	.word 0xf8f38e60  ! 3291: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbfe56095  ! 3293: SAVE_I	save	%r21, 0x0001, %r31
cpu_intr_0_266:
	setx	0x3b020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb63d4000  ! 3301: XNOR_R	xnor 	%r21, %r0, %r27
T0_asi_reg_rd_138:
	mov	0xe, %r14
	.word 0xf4db8e40  ! 3302: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_234:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_234), 16, 16)) -> intp(0, 0, 31)
	.word 0xb9e4c000  ! 3306: SAVE_R	save	%r19, %r0, %r28
T0_asi_reg_wr_151:
	mov	0x1a, %r14
	.word 0xf0f384a0  ! 3307: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb3e5201a  ! 3311: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_rd_139:
	mov	0x1, %r14
	.word 0xfcdb84a0  ! 3312: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbbe5205c  ! 3314: SAVE_I	save	%r20, 0x0001, %r29
iob_intr_0_235:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_235), 16, 16)) -> intp(0, 0, 38)
	.word 0xb3e4a16b  ! 3317: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb3e5c000  ! 3321: SAVE_R	save	%r23, %r0, %r25
	.word 0xbf2cc000  ! 3323: SLL_R	sll 	%r19, %r0, %r31
	.word 0xbde5610a  ! 3324: SAVE_I	save	%r21, 0x0001, %r30
cpu_intr_0_267:
	setx	0x3b0133, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_268:
	setx	0x3b0312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e06f  ! 3329: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_wr_152:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 3331: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbbe5c000  ! 3341: SAVE_R	save	%r23, %r0, %r29
	.word 0xb2358000  ! 3343: SUBC_R	orn 	%r22, %r0, %r25
	.word 0xbfe4e105  ! 3350: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb1e4a002  ! 3351: SAVE_I	save	%r18, 0x0001, %r24
iob_intr_0_236:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_236), 16, 16)) -> intp(0, 0, 33)
	.word 0xb41da1a9  ! 3356: XOR_I	xor 	%r22, 0x01a9, %r26
	.word 0xb3e4a033  ! 3357: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7e5a114  ! 3359: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_269:
	setx	0x3a0109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_237:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_237), 16, 16)) -> intp(0, 0, 10)
iob_intr_0_238:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_238), 16, 16)) -> intp(0, 0, 6)
	.word 0xb1e58000  ! 3370: SAVE_R	save	%r22, %r0, %r24
T0_asi_reg_wr_153:
	mov	0x3c0, %r14
	.word 0xfcf38e60  ! 3373: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_0_270:
	setx	0x390205, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_140:
	mov	0x13, %r14
	.word 0xf4db84a0  ! 3381: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T0_asi_reg_wr_154:
	mov	0x2a, %r14
	.word 0xf6f38e40  ! 3384: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_wr_155:
	mov	0x29, %r14
	.word 0xf8f38400  ! 3385: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbde54000  ! 3391: SAVE_R	save	%r21, %r0, %r30
	.word 0xbfe54000  ! 3392: SAVE_R	save	%r21, %r0, %r31
	.word 0xb5e461d6  ! 3393: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_271:
	setx	0x3b0309, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_272:
	setx	0x3a0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe40000  ! 3398: SAVE_R	save	%r16, %r0, %r31
T0_asi_reg_wr_156:
	mov	0x17, %r14
	.word 0xfcf384a0  ! 3399: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_0_239:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_239), 16, 16)) -> intp(0, 0, 0)
cpu_intr_0_273:
	setx	0x3a0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb51c000  ! 3407: RDPR_TL	<illegal instruction>
	.word 0xbde4e182  ! 3408: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb8b44000  ! 3410: ORNcc_R	orncc 	%r17, %r0, %r28
T0_asi_reg_wr_157:
	mov	0x27, %r14
	.word 0xf2f38e40  ! 3411: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb7e5e08d  ! 3416: SAVE_I	save	%r23, 0x0001, %r27
iob_intr_0_240:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_240), 16, 16)) -> intp(0, 0, 7)
	.word 0xbde4c000  ! 3421: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_274:
	setx	0x3b0330, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e50000  ! 3434: SAVE_R	save	%r20, %r0, %r26
T0_asi_reg_wr_158:
	mov	0x29, %r14
	.word 0xfcf38e80  ! 3435: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbfe4c000  ! 3437: SAVE_R	save	%r19, %r0, %r31
cpu_intr_0_275:
	setx	0x380328, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_141:
	mov	0x10, %r14
	.word 0xf0db84a0  ! 3440: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb735a001  ! 3448: SRL_I	srl 	%r22, 0x0001, %r27
T0_asi_reg_wr_159:
	mov	0x26, %r14
	.word 0xfcf38e80  ! 3449: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb5e5615d  ! 3452: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb9e5e06c  ! 3454: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_rd_142:
	mov	0x10, %r14
	.word 0xf2db89e0  ! 3455: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbde521a6  ! 3461: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_rd_143:
	mov	0x32, %r14
	.word 0xfadb89e0  ! 3468: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_0_241:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_241), 16, 16)) -> intp(0, 0, 32)
	.word 0xb23c0000  ! 3471: XNOR_R	xnor 	%r16, %r0, %r25
iob_intr_0_242:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_242), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_rd_144:
	mov	0x3c0, %r14
	.word 0xfcdb8e40  ! 3478: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb5e420b9  ! 3479: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_243:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_243), 16, 16)) -> intp(0, 0, 1f)
iob_intr_0_244:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_244), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb9e56092  ! 3484: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbde54000  ! 3487: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_245:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_245), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb52c5000  ! 3492: SLLX_R	sllx	%r17, %r0, %r26
T0_asi_reg_wr_160:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 3497: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb7e44000  ! 3500: SAVE_R	save	%r17, %r0, %r27
T0_asi_reg_rd_145:
	mov	0x1b, %r14
	.word 0xfcdb8400  ! 3501: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T0_asi_reg_wr_161:
	mov	0x3c8, %r14
	.word 0xfcf38e80  ! 3502: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T0_asi_reg_wr_162:
	mov	0x0, %r14
	.word 0xf2f389e0  ! 3503: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T0_asi_reg_rd_146:
	mov	0x8, %r14
	.word 0xfedb8e40  ! 3504: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_wr_163:
	mov	0x3c3, %r14
	.word 0xfaf389e0  ! 3505: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T0_asi_reg_rd_147:
	mov	0x25, %r14
	.word 0xfedb8e60  ! 3506: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T0_asi_reg_wr_164:
	mov	0x3c6, %r14
	.word 0xf2f38e60  ! 3508: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_0_276:
	setx	0x380033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a087  ! 3512: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb9e40000  ! 3515: SAVE_R	save	%r16, %r0, %r28
cpu_intr_0_277:
	setx	0x38012b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_148:
	mov	0x3c5, %r14
	.word 0xfadb8e80  ! 3518: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_0_278:
	setx	0x380336, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_149:
	mov	0x3c3, %r14
	.word 0xfedb8e40  ! 3520: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbfe420e9  ! 3521: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_rd_150:
	mov	0x17, %r14
	.word 0xf8db8e80  ! 3522: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_0_279:
	setx	0x38020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5c000  ! 3530: SAVE_R	save	%r23, %r0, %r31
	.word 0xbd643801  ! 3531: MOVcc_I	<illegal instruction>
	.word 0xbbe461f4  ! 3532: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb7e40000  ! 3541: SAVE_R	save	%r16, %r0, %r27
T0_asi_reg_wr_165:
	mov	0x32, %r14
	.word 0xf0f38e40  ! 3542: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb3e420b6  ! 3543: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_wr_166:
	mov	0x1b, %r14
	.word 0xf8f38e40  ! 3545: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_280:
	setx	0x38033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xa1902002  ! 3552: WRPR_GL_I	wrpr	%r0, 0x0002, %-
iob_intr_0_246:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_246), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb9e5a153  ! 3555: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3e4200d  ! 3557: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_rd_151:
	mov	0x2c, %r14
	.word 0xf8db8e80  ! 3563: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_0_247:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_247), 16, 16)) -> intp(0, 0, 0)
	.word 0xbe1c0000  ! 3567: XOR_R	xor 	%r16, %r0, %r31
	.word 0xbbe5602a  ! 3569: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb1e4c000  ! 3570: SAVE_R	save	%r19, %r0, %r24
	.word 0xb5e5c000  ! 3571: SAVE_R	save	%r23, %r0, %r26
T0_asi_reg_wr_167:
	mov	0x3c2, %r14
	.word 0xf4f389e0  ! 3572: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_248:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_248), 16, 16)) -> intp(0, 0, 30)
	.word 0xbfe48000  ! 3577: SAVE_R	save	%r18, %r0, %r31
	.word 0xbbe40000  ! 3579: SAVE_R	save	%r16, %r0, %r29
	.word 0x85946140  ! 3581: WRPR_TSTATE_I	wrpr	%r17, 0x0140, %tstate
	.word 0xb3e5e115  ! 3583: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb3e58000  ! 3585: SAVE_R	save	%r22, %r0, %r25
T0_asi_reg_rd_152:
	mov	0x3c0, %r14
	.word 0xf2db8e80  ! 3593: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb7e4a07e  ! 3594: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3344000  ! 3595: SRL_R	srl 	%r17, %r0, %r25
cpu_intr_0_281:
	setx	0x3a0338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba044000  ! 3604: ADD_R	add 	%r17, %r0, %r29
T0_asi_reg_wr_168:
	mov	0x4, %r14
	.word 0xf0f38e80  ! 3608: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T0_asi_reg_rd_153:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 3609: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb3e5217f  ! 3610: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb5e421b4  ! 3611: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb3e40000  ! 3613: SAVE_R	save	%r16, %r0, %r25
	.word 0xb8048000  ! 3614: ADD_R	add 	%r18, %r0, %r28
	.word 0xb7e5608b  ! 3620: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb6bc8000  ! 3621: XNORcc_R	xnorcc 	%r18, %r0, %r27
T0_asi_reg_rd_154:
	mov	0x0, %r14
	.word 0xf8db89e0  ! 3622: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T0_asi_reg_rd_155:
	mov	0x1a, %r14
	.word 0xf6db8e40  ! 3629: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb1e54000  ! 3632: SAVE_R	save	%r21, %r0, %r24
iob_intr_0_249:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_249), 16, 16)) -> intp(0, 0, 7)
cpu_intr_0_282:
	setx	0x3d0122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e560c1  ! 3640: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb8a48000  ! 3641: SUBcc_R	subcc 	%r18, %r0, %r28
cpu_intr_0_283:
	setx	0x3d0010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb37de401  ! 3648: MOVR_I	movre	%r23, 0x1, %r25
cpu_intr_0_284:
	setx	0x3e033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e0cc  ! 3651: SAVE_I	save	%r19, 0x0001, %r30
iob_intr_0_250:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_250), 16, 16)) -> intp(0, 0, 1a)
iob_intr_0_251:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_251), 16, 16)) -> intp(0, 0, e)
	.word 0xb7e50000  ! 3654: SAVE_R	save	%r20, %r0, %r27
iob_intr_0_252:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_252), 16, 16)) -> intp(0, 0, 2c)
T0_asi_reg_rd_156:
	mov	0x22, %r14
	.word 0xf4db8e40  ! 3657: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb6248000  ! 3662: SUB_R	sub 	%r18, %r0, %r27
	.word 0xb1e5e077  ! 3666: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_wr_169:
	mov	0x1a, %r14
	.word 0xf4f38400  ! 3675: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_285:
	setx	0x3f0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xa1902002  ! 3682: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xb1e420de  ! 3683: SAVE_I	save	%r16, 0x0001, %r24
iob_intr_0_253:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_253), 16, 16)) -> intp(0, 0, c)
iob_intr_0_254:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_254), 16, 16)) -> intp(0, 0, 1e)
iob_intr_0_255:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_255), 16, 16)) -> intp(0, 0, 38)
	.word 0xb7e4e124  ! 3692: SAVE_I	save	%r19, 0x0001, %r27
T0_asi_reg_wr_170:
	mov	0x18, %r14
	.word 0xfef389e0  ! 3694: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb1e4a0ff  ! 3696: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb7e4c000  ! 3700: SAVE_R	save	%r19, %r0, %r27
cpu_intr_0_286:
	setx	0x3d0308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4c000  ! 3705: SAVE_R	save	%r19, %r0, %r27
	.word 0xb28461e9  ! 3707: ADDcc_I	addcc 	%r17, 0x01e9, %r25
cpu_intr_0_287:
	setx	0x3d0034, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_256:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_256), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb73c1000  ! 3711: SRAX_R	srax	%r16, %r0, %r27
	.word 0xb03461c0  ! 3712: ORN_I	orn 	%r17, 0x01c0, %r24
	.word 0xb3e4c000  ! 3714: SAVE_R	save	%r19, %r0, %r25
T0_asi_reg_rd_157:
	mov	0x18, %r14
	.word 0xf6db8e80  ! 3715: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb1e58000  ! 3716: SAVE_R	save	%r22, %r0, %r24
iob_intr_0_257:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_257), 16, 16)) -> intp(0, 0, 6)
	.word 0xb9e46116  ! 3726: SAVE_I	save	%r17, 0x0001, %r28
cpu_intr_0_288:
	setx	0x3e0337, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_258:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_258), 16, 16)) -> intp(0, 0, 3d)
cpu_intr_0_289:
	setx	0x3e0012, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_259:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_259), 16, 16)) -> intp(0, 0, 27)
	.word 0xb9e4614a  ! 3736: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb43cc000  ! 3739: XNOR_R	xnor 	%r19, %r0, %r26
cpu_intr_0_290:
	setx	0x3f0128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4615f  ! 3746: SAVE_I	save	%r17, 0x0001, %r31
cpu_intr_0_291:
	setx	0x3f0104, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_171:
	mov	0x3c6, %r14
	.word 0xf4f389e0  ! 3758: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T0_asi_reg_rd_158:
	mov	0x26, %r14
	.word 0xf2db8e80  ! 3762: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T0_asi_reg_rd_159:
	mov	0x24, %r14
	.word 0xf2db8400  ! 3769: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb604c000  ! 3770: ADD_R	add 	%r19, %r0, %r27
T0_asi_reg_rd_160:
	mov	0x3c3, %r14
	.word 0xfcdb8e40  ! 3771: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb62cc000  ! 3774: ANDN_R	andn 	%r19, %r0, %r27
cpu_intr_0_292:
	setx	0x3e0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5c000  ! 3776: SAVE_R	save	%r23, %r0, %r25
T0_asi_reg_rd_161:
	mov	0x3c7, %r14
	.word 0xf2db8e60  ! 3777: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_0_293:
	setx	0x3f0216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_260:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_260), 16, 16)) -> intp(0, 0, a)
	.word 0xb5e50000  ! 3784: SAVE_R	save	%r20, %r0, %r26
	.word 0xb5e50000  ! 3788: SAVE_R	save	%r20, %r0, %r26
cpu_intr_0_294:
	setx	0x3d0303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb60ca013  ! 3794: AND_I	and 	%r18, 0x0013, %r27
cpu_intr_0_295:
	setx	0x3e0000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_296:
	setx	0x3c0312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4c000  ! 3799: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_297:
	setx	0x3c0025, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_261:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_261), 16, 16)) -> intp(0, 0, 14)
cpu_intr_0_298:
	setx	0x3e003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_299:
	setx	0x3e0119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0452108  ! 3815: ADDC_I	addc 	%r20, 0x0108, %r24
T0_asi_reg_rd_162:
	mov	0x1b, %r14
	.word 0xf8db8e40  ! 3816: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb9e420ef  ! 3819: SAVE_I	save	%r16, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbca4c000  ! 3826: SUBcc_R	subcc 	%r19, %r0, %r30
	.word 0xb7e46116  ! 3828: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb5e52010  ! 3829: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb6b58000  ! 3832: ORNcc_R	orncc 	%r22, %r0, %r27
T0_asi_reg_wr_172:
	mov	0x3c2, %r14
	.word 0xfaf38e60  ! 3834: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbbe4205e  ! 3835: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbde5a1fe  ! 3842: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb4048000  ! 3845: ADD_R	add 	%r18, %r0, %r26
T0_asi_reg_rd_163:
	mov	0x3c7, %r14
	.word 0xf6db8400  ! 3847: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_0_300:
	setx	0x3c0039, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_173:
	mov	0x3c0, %r14
	.word 0xfef38e60  ! 3850: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbbe5a0f4  ! 3852: SAVE_I	save	%r22, 0x0001, %r29
T0_asi_reg_rd_164:
	mov	0x21, %r14
	.word 0xfadb89e0  ! 3853: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T0_asi_reg_wr_174:
	mov	0xa, %r14
	.word 0xf0f38e80  ! 3854: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_0_262:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_262), 16, 16)) -> intp(0, 0, b)
	.word 0xb43dc000  ! 3857: XNOR_R	xnor 	%r23, %r0, %r26
	.word 0xbde48000  ! 3859: SAVE_R	save	%r18, %r0, %r30
	.word 0xbbe461c5  ! 3862: SAVE_I	save	%r17, 0x0001, %r29
cpu_intr_0_301:
	setx	0x3e012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4c000  ! 3867: SAVE_R	save	%r19, %r0, %r25
	.word 0xbb3d6001  ! 3875: SRA_I	sra 	%r21, 0x0001, %r29
iob_intr_0_263:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_263), 16, 16)) -> intp(0, 0, 27)
T0_asi_reg_rd_165:
	mov	0xc, %r14
	.word 0xf8db8e40  ! 3877: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_wr_175:
	mov	0x17, %r14
	.word 0xfef38e60  ! 3879: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbbe42105  ! 3880: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbfe54000  ! 3881: SAVE_R	save	%r21, %r0, %r31
	.word 0xb9e5c000  ! 3883: SAVE_R	save	%r23, %r0, %r28
	.word 0xbfe54000  ! 3884: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_264:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_264), 16, 16)) -> intp(0, 0, 0)
	.word 0xb5e54000  ! 3892: SAVE_R	save	%r21, %r0, %r26
	.word 0xb1e44000  ! 3893: SAVE_R	save	%r17, %r0, %r24
T0_asi_reg_wr_176:
	mov	0x25, %r14
	.word 0xf8f384a0  ! 3894: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_0_265:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_265), 16, 16)) -> intp(0, 0, 12)
	.word 0xb08460df  ! 3899: ADDcc_I	addcc 	%r17, 0x00df, %r24
T0_asi_reg_rd_166:
	mov	0x29, %r14
	.word 0xf8db8e80  ! 3900: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb02461e5  ! 3901: SUB_I	sub 	%r17, 0x01e5, %r24
iob_intr_0_266:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_266), 16, 16)) -> intp(0, 0, 3b)
iob_intr_0_267:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_267), 16, 16)) -> intp(0, 0, 0)
iob_intr_0_268:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_268), 16, 16)) -> intp(0, 0, 18)
	.word 0xb9e44000  ! 3908: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_wr_177:
	mov	0x19, %r14
	.word 0xfaf38e40  ! 3910: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb5e50000  ! 3911: SAVE_R	save	%r20, %r0, %r26
iob_intr_0_269:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_269), 16, 16)) -> intp(0, 0, 39)
	.word 0xb1e44000  ! 3913: SAVE_R	save	%r17, %r0, %r24
T0_asi_reg_wr_178:
	mov	0xf, %r14
	.word 0xf8f38e40  ! 3914: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_wr_179:
	mov	0x1d, %r14
	.word 0xfaf38e40  ! 3915: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb5e4a016  ! 3916: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb6b4e11d  ! 3917: SUBCcc_I	orncc 	%r19, 0x011d, %r27
cpu_intr_0_302:
	setx	0x3d003d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_270:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_270), 16, 16)) -> intp(0, 0, 39)
	.word 0xb9e54000  ! 3924: SAVE_R	save	%r21, %r0, %r28
	.word 0xb0c4c000  ! 3927: ADDCcc_R	addccc 	%r19, %r0, %r24
	.word 0xb5e48000  ! 3929: SAVE_R	save	%r18, %r0, %r26
cpu_intr_0_303:
	setx	0x3e011c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_180:
	mov	0x1e, %r14
	.word 0xfef38e60  ! 3933: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb7e5a09f  ! 3935: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_304:
	setx	0x3c0304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e48000  ! 3938: SAVE_R	save	%r18, %r0, %r26
T0_asi_reg_wr_181:
	mov	0x13, %r14
	.word 0xfef389e0  ! 3939: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb08d0000  ! 3942: ANDcc_R	andcc 	%r20, %r0, %r24
iob_intr_0_271:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_271), 16, 16)) -> intp(0, 0, 20)
	.word 0xb3e44000  ! 3944: SAVE_R	save	%r17, %r0, %r25
cpu_intr_0_305:
	setx	0x3f011c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_306:
	setx	0x3e023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4618f  ! 3952: SAVE_I	save	%r17, 0x0001, %r26
T0_asi_reg_rd_167:
	mov	0x38, %r14
	.word 0xfadb84a0  ! 3954: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_0_272:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_272), 16, 16)) -> intp(0, 0, 1)
	.word 0xb1e4a1cf  ! 3959: SAVE_I	save	%r18, 0x0001, %r24
iob_intr_0_273:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_273), 16, 16)) -> intp(0, 0, 23)
cpu_intr_0_307:
	setx	0x3e023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e42146  ! 3966: SAVE_I	save	%r16, 0x0001, %r24
T0_asi_reg_rd_168:
	mov	0x3c1, %r14
	.word 0xf6db8400  ! 3967: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbfe4e046  ! 3969: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbde460e7  ! 3970: SAVE_I	save	%r17, 0x0001, %r30
cpu_intr_0_308:
	setx	0x3e0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5c000  ! 3975: SAVE_R	save	%r23, %r0, %r30
T0_asi_reg_wr_182:
	mov	0x1c, %r14
	.word 0xfef38e40  ! 3976: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_0_274:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_274), 16, 16)) -> intp(0, 0, 17)
iob_intr_0_275:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_275), 16, 16)) -> intp(0, 0, 1)
	.word 0xb5e5e07b  ! 3982: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb5e4c000  ! 3985: SAVE_R	save	%r19, %r0, %r26
iob_intr_0_276:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_276), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb9e4a002  ! 3997: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb7e4a088  ! 3998: SAVE_I	save	%r18, 0x0001, %r27
iob_intr_0_277:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_277), 16, 16)) -> intp(0, 0, 3c)
cpu_intr_0_309:
	setx	0x3c0109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8595a0ec  ! 4003: WRPR_TSTATE_I	wrpr	%r22, 0x00ec, %tstate
	.word 0xb9e4c000  ! 4005: SAVE_R	save	%r19, %r0, %r28
	.word 0xbbe4e17a  ! 4006: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_rd_169:
	mov	0x3c3, %r14
	.word 0xf6db8400  ! 4008: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_0_310:
	setx	0x3e0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4603f  ! 4013: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_311:
	setx	0x3c0324, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_278:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_278), 16, 16)) -> intp(0, 0, 32)
cpu_intr_0_312:
	setx	0x10007, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_279:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_279), 16, 16)) -> intp(0, 0, 36)
iob_intr_0_280:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_280), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb1e4e0dd  ! 4026: SAVE_I	save	%r19, 0x0001, %r24
iob_intr_0_281:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_281), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb7e521a1  ! 4029: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb5e54000  ! 4032: SAVE_R	save	%r21, %r0, %r26
	.word 0xb1643801  ! 4033: MOVcc_I	<illegal instruction>
cpu_intr_0_313:
	setx	0x3e0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 4036: SAVE_R	save	%r20, %r0, %r29
cpu_intr_0_314:
	setx	0x3d001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc854000  ! 4039: ADDcc_R	addcc 	%r21, %r0, %r30
cpu_intr_0_315:
	setx	0x3d0128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb92d7001  ! 4042: SLLX_I	sllx	%r21, 0x0001, %r28
cpu_intr_0_316:
	setx	0x3d001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12c8000  ! 4049: SLL_R	sll 	%r18, %r0, %r24
cpu_intr_0_317:
	setx	0x3f002d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_282:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_282), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb9e40000  ! 4057: SAVE_R	save	%r16, %r0, %r28
T0_asi_reg_wr_183:
	mov	0x7, %r14
	.word 0xfef38e60  ! 4059: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb5e4c000  ! 4062: SAVE_R	save	%r19, %r0, %r26
	.word 0xb3e40000  ! 4063: SAVE_R	save	%r16, %r0, %r25
cpu_intr_0_318:
	setx	0x3c0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e421c3  ! 4065: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb12c8000  ! 4066: SLL_R	sll 	%r18, %r0, %r24
	.word 0xb151c000  ! 4074: RDPR_TL	<illegal instruction>
	.word 0xbbe5c000  ! 4075: SAVE_R	save	%r23, %r0, %r29
	.word 0xbfe50000  ! 4076: SAVE_R	save	%r20, %r0, %r31
	.word 0xbfe5c000  ! 4079: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_283:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_283), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_wr_184:
	mov	0x0, %r14
	.word 0xfef38e40  ! 4084: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb1e4a03e  ! 4086: SAVE_I	save	%r18, 0x0001, %r24
iob_intr_0_284:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_284), 16, 16)) -> intp(0, 0, 11)
T0_asi_reg_rd_170:
	mov	0x3c5, %r14
	.word 0xfadb8e40  ! 4088: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3e58000  ! 4092: SAVE_R	save	%r22, %r0, %r25
iob_intr_0_285:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_285), 16, 16)) -> intp(0, 0, 23)
iob_intr_0_286:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_286), 16, 16)) -> intp(0, 0, 29)
iob_intr_0_287:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_287), 16, 16)) -> intp(0, 0, e)
cpu_intr_0_319:
	setx	0x400135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe48000  ! 4111: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_rd_171:
	mov	0x33, %r14
	.word 0xf8db89e0  ! 4112: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb3e4a131  ! 4113: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7e52128  ! 4116: SAVE_I	save	%r20, 0x0001, %r27
cpu_intr_0_320:
	setx	0x420139, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_185:
	mov	0x33, %r14
	.word 0xf0f38e80  ! 4120: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_0_321:
	setx	0x420327, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_288:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_288), 16, 16)) -> intp(0, 0, 37)
	.word 0xb9e5c000  ! 4128: SAVE_R	save	%r23, %r0, %r28
	.word 0xbde4e1ac  ! 4129: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_wr_186:
	mov	0x3c2, %r14
	.word 0xfef38e40  ! 4132: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_0_289:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_289), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_322:
	setx	0x43002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e44000  ! 4141: SAVE_R	save	%r17, %r0, %r24
	.word 0xbbe40000  ! 4142: SAVE_R	save	%r16, %r0, %r29
	.word 0xbbe461af  ! 4147: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbc0460ef  ! 4149: ADD_I	add 	%r17, 0x00ef, %r30
	.word 0xbf2c5000  ! 4152: SLLX_R	sllx	%r17, %r0, %r31
	.word 0xb72c8000  ! 4160: SLL_R	sll 	%r18, %r0, %r27
cpu_intr_0_323:
	setx	0x430016, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_290:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_290), 16, 16)) -> intp(0, 0, 22)
	.word 0xb5e4e09e  ! 4165: SAVE_I	save	%r19, 0x0001, %r26
cpu_intr_0_324:
	setx	0x410025, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_325:
	setx	0x420215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe48000  ! 4168: SAVE_R	save	%r18, %r0, %r29
	.word 0xb9e42129  ! 4171: SAVE_I	save	%r16, 0x0001, %r28
T0_asi_reg_wr_187:
	mov	0x1c, %r14
	.word 0xfaf38400  ! 4173: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb7e5a064  ! 4176: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_326:
	setx	0x400217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5c000  ! 4185: SAVE_R	save	%r23, %r0, %r30
T0_asi_reg_rd_172:
	mov	0x4, %r14
	.word 0xfadb8e80  ! 4188: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb1e50000  ! 4190: SAVE_R	save	%r20, %r0, %r24
	.word 0xb7e56102  ! 4192: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbde44000  ! 4193: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_rd_173:
	mov	0x36, %r14
	.word 0xf2db8e40  ! 4194: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbde5c000  ! 4195: SAVE_R	save	%r23, %r0, %r30
	.word 0xbde5a190  ! 4196: SAVE_I	save	%r22, 0x0001, %r30
iob_intr_0_291:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_291), 16, 16)) -> intp(0, 0, 16)
	.word 0xb5e4606b  ! 4200: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb9e52043  ! 4203: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb5e4c000  ! 4205: SAVE_R	save	%r19, %r0, %r26
	.word 0xb7e40000  ! 4207: SAVE_R	save	%r16, %r0, %r27
cpu_intr_0_327:
	setx	0x420029, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_188:
	mov	0xe, %r14
	.word 0xf4f38e40  ! 4216: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_328:
	setx	0x420229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e44000  ! 4219: SAVE_R	save	%r17, %r0, %r25
	.word 0xbbe50000  ! 4221: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_292:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_292), 16, 16)) -> intp(0, 0, 25)
T0_asi_reg_wr_189:
	mov	0x3c3, %r14
	.word 0xfcf38e40  ! 4229: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_wr_190:
	mov	0x3c3, %r14
	.word 0xf8f38e40  ! 4232: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_rd_174:
	mov	0x1f, %r14
	.word 0xfcdb84a0  ! 4239: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T0_asi_reg_rd_175:
	mov	0x3c1, %r14
	.word 0xf4db84a0  ! 4242: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbbe5a123  ! 4247: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_293:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_293), 16, 16)) -> intp(0, 0, 14)
cpu_intr_0_329:
	setx	0x430107, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_294:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_294), 16, 16)) -> intp(0, 0, 5)
cpu_intr_0_330:
	setx	0x420104, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_295:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_295), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb1e40000  ! 4258: SAVE_R	save	%r16, %r0, %r24
	.word 0xb9e42150  ! 4262: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbde561c6  ! 4263: SAVE_I	save	%r21, 0x0001, %r30
cpu_intr_0_331:
	setx	0x400027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8ac8000  ! 4265: ANDNcc_R	andncc 	%r18, %r0, %r28
	.word 0xb33c9000  ! 4269: SRAX_R	srax	%r18, %r0, %r25
T0_asi_reg_rd_176:
	mov	0x26, %r14
	.word 0xfcdb89e0  ! 4271: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_0_332:
	setx	0x40023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a1f1  ! 4273: SAVE_I	save	%r22, 0x0001, %r24
cpu_intr_0_333:
	setx	0x420000, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_177:
	mov	0x3c1, %r14
	.word 0xf2db8e80  ! 4277: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T0_asi_reg_rd_178:
	mov	0x3c3, %r14
	.word 0xfedb8e60  ! 4278: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_0_334:
	setx	0x430233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e56164  ! 4281: SAVE_I	save	%r21, 0x0001, %r26
cpu_intr_0_335:
	setx	0x42011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde50000  ! 4285: SAVE_R	save	%r20, %r0, %r30
cpu_intr_0_336:
	setx	0x43000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e40000  ! 4288: SAVE_R	save	%r16, %r0, %r25
cpu_intr_0_337:
	setx	0x430137, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_296:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_296), 16, 16)) -> intp(0, 0, 15)
cpu_intr_0_338:
	setx	0x420311, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_339:
	setx	0x400030, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_340:
	setx	0x41032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e106  ! 4303: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbe0c0000  ! 4304: AND_R	and 	%r16, %r0, %r31
	.word 0xb5e54000  ! 4306: SAVE_R	save	%r21, %r0, %r26
	.word 0xb9e420a6  ! 4307: SAVE_I	save	%r16, 0x0001, %r28
T0_asi_reg_rd_179:
	mov	0x19, %r14
	.word 0xf2db8400  ! 4308: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xbb2d0000  ! 4310: SLL_R	sll 	%r20, %r0, %r29
iob_intr_0_297:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_297), 16, 16)) -> intp(0, 0, 15)
T0_asi_reg_rd_180:
	mov	0x3c1, %r14
	.word 0xfcdb8e60  ! 4314: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_0_298:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_298), 16, 16)) -> intp(0, 0, 3f)
	.word 0xbde4e119  ! 4319: SAVE_I	save	%r19, 0x0001, %r30
cpu_intr_0_341:
	setx	0x40000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e58000  ! 4322: SAVE_R	save	%r22, %r0, %r24
cpu_intr_0_342:
	setx	0x430339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e1d8  ! 4325: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbd508000  ! 4326: RDPR_TSTATE	<illegal instruction>
T0_asi_reg_wr_191:
	mov	0x3c0, %r14
	.word 0xf8f38400  ! 4327: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T0_asi_reg_rd_181:
	mov	0x38, %r14
	.word 0xfedb8400  ! 4328: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbc24207d  ! 4329: SUB_I	sub 	%r16, 0x007d, %r30
cpu_intr_0_343:
	setx	0x430021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb63560be  ! 4334: SUBC_I	orn 	%r21, 0x00be, %r27
T0_asi_reg_wr_192:
	mov	0x13, %r14
	.word 0xf8f38400  ! 4337: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbbe56009  ! 4338: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7643801  ! 4342: MOVcc_I	<illegal instruction>
	.word 0xb3e5c000  ! 4344: SAVE_R	save	%r23, %r0, %r25
T0_asi_reg_wr_193:
	mov	0x1, %r14
	.word 0xf6f384a0  ! 4348: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T0_asi_reg_rd_182:
	mov	0x16, %r14
	.word 0xfadb8e40  ! 4350: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_wr_194:
	mov	0x3c7, %r14
	.word 0xfaf38e40  ! 4352: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb8bce11a  ! 4353: XNORcc_I	xnorcc 	%r19, 0x011a, %r28
cpu_intr_0_344:
	setx	0x410319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e461ac  ! 4366: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1e4612e  ! 4369: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb7e48000  ! 4370: SAVE_R	save	%r18, %r0, %r27
	.word 0xb01461c3  ! 4372: OR_I	or 	%r17, 0x01c3, %r24
	.word 0xbc25e049  ! 4373: SUB_I	sub 	%r23, 0x0049, %r30
	.word 0xb7e4c000  ! 4374: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_wr_195:
	mov	0x1e, %r14
	.word 0xf6f38400  ! 4378: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbde42115  ! 4381: SAVE_I	save	%r16, 0x0001, %r30
iob_intr_0_299:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_299), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb3e461da  ! 4385: SAVE_I	save	%r17, 0x0001, %r25
cpu_intr_0_345:
	setx	0x420332, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_300:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_300), 16, 16)) -> intp(0, 0, 1)
cpu_intr_0_346:
	setx	0x420118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e44000  ! 4391: SAVE_R	save	%r17, %r0, %r28
	.word 0xbfe58000  ! 4397: SAVE_R	save	%r22, %r0, %r31
	.word 0xbfe48000  ! 4398: SAVE_R	save	%r18, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb0144000  ! 4400: OR_R	or 	%r17, %r0, %r24
iob_intr_0_301:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_301), 16, 16)) -> intp(0, 0, b)
T0_asi_reg_rd_183:
	mov	0x17, %r14
	.word 0xfedb8400  ! 4404: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb72cf001  ! 4405: SLLX_I	sllx	%r19, 0x0001, %r27
	.word 0xbbe420ad  ! 4408: SAVE_I	save	%r16, 0x0001, %r29
cpu_intr_0_347:
	setx	0x43000f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_348:
	setx	0x430233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_349:
	setx	0x410020, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_302:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_302), 16, 16)) -> intp(0, 0, 3e)
T0_asi_reg_rd_184:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 4425: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_wr_196:
	mov	0x12, %r14
	.word 0xf6f38e80  ! 4427: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbde4c000  ! 4429: SAVE_R	save	%r19, %r0, %r30
	.word 0xb9e44000  ! 4432: SAVE_R	save	%r17, %r0, %r28
cpu_intr_0_350:
	setx	0x420037, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_351:
	setx	0x430302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5c000  ! 4438: SAVE_R	save	%r23, %r0, %r26
T0_asi_reg_rd_185:
	mov	0x18, %r14
	.word 0xf6db8e80  ! 4440: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_0_352:
	setx	0x400011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe40000  ! 4443: SAVE_R	save	%r16, %r0, %r29
iob_intr_0_303:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_303), 16, 16)) -> intp(0, 0, 32)
	.word 0xb5e54000  ! 4446: SAVE_R	save	%r21, %r0, %r26
	.word 0xbbe561b7  ! 4450: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb3e50000  ! 4453: SAVE_R	save	%r20, %r0, %r25
cpu_intr_0_353:
	setx	0x400026, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_354:
	setx	0x40020a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_304:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_304), 16, 16)) -> intp(0, 0, 3)
	.word 0xb1e5c000  ! 4467: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_wr_197:
	mov	0x3c5, %r14
	.word 0xf0f38e80  ! 4468: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb9e4c000  ! 4470: SAVE_R	save	%r19, %r0, %r28
	.word 0xb9e40000  ! 4473: SAVE_R	save	%r16, %r0, %r28
cpu_intr_0_355:
	setx	0x430210, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_186:
	mov	0x3c5, %r14
	.word 0xf4db8400  ! 4478: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb9e48000  ! 4479: SAVE_R	save	%r18, %r0, %r28
T0_asi_reg_wr_198:
	mov	0x3c7, %r14
	.word 0xf0f38e80  ! 4480: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb33cb001  ! 4483: SRAX_I	srax	%r18, 0x0001, %r25
iob_intr_0_305:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_305), 16, 16)) -> intp(0, 0, 9)
T0_asi_reg_rd_187:
	mov	0x3c5, %r14
	.word 0xf4db8e40  ! 4487: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb49c20da  ! 4493: XORcc_I	xorcc 	%r16, 0x00da, %r26
T0_asi_reg_rd_188:
	mov	0xf, %r14
	.word 0xfadb8400  ! 4495: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_0_356:
	setx	0x41021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_306:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_306), 16, 16)) -> intp(0, 0, b)
	.word 0xb7e5602f  ! 4507: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_rd_189:
	mov	0xb, %r14
	.word 0xfedb8e40  ! 4512: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_0_307:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_307), 16, 16)) -> intp(0, 0, 30)
	.word 0xb9e54000  ! 4515: SAVE_R	save	%r21, %r0, %r28
	.word 0xbfe48000  ! 4516: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_357:
	setx	0x410202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8d4000  ! 4519: ANDcc_R	andcc 	%r21, %r0, %r30
	.word 0xb3e561c2  ! 4520: SAVE_I	save	%r21, 0x0001, %r25
T0_asi_reg_wr_199:
	mov	0x3c1, %r14
	.word 0xf6f38e60  ! 4521: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_0_358:
	setx	0x410212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3d2001  ! 4527: SRA_I	sra 	%r20, 0x0001, %r31
	.word 0xb9e50000  ! 4530: SAVE_R	save	%r20, %r0, %r28
	.word 0xb1e4a15f  ! 4532: SAVE_I	save	%r18, 0x0001, %r24
iob_intr_0_308:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_308), 16, 16)) -> intp(0, 0, a)
iob_intr_0_309:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_309), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb3e50000  ! 4540: SAVE_R	save	%r20, %r0, %r25
iob_intr_0_310:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_310), 16, 16)) -> intp(0, 0, 1d)
T0_asi_reg_rd_190:
	mov	0x3c1, %r14
	.word 0xf6db8e40  ! 4549: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_0_359:
	setx	0x410204, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_360:
	setx	0x43020b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_191:
	mov	0xf, %r14
	.word 0xfcdb8e40  ! 4555: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb5e4a1f2  ! 4556: SAVE_I	save	%r18, 0x0001, %r26
cpu_intr_0_361:
	setx	0x42003a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_362:
	setx	0x40000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_200:
	mov	0x14, %r14
	.word 0xf6f38400  ! 4560: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_0_363:
	setx	0x42032f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_201:
	mov	0x0, %r14
	.word 0xf0f389e0  ! 4562: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb7e4211b  ! 4563: SAVE_I	save	%r16, 0x0001, %r27
cpu_intr_0_364:
	setx	0x460204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5518000  ! 4568: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e5a057  ! 4569: SAVE_I	save	%r22, 0x0001, %r26
T0_asi_reg_wr_202:
	mov	0x1d, %r14
	.word 0xf4f38e40  ! 4573: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbde46147  ! 4575: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb1e5a034  ! 4576: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_311:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_311), 16, 16)) -> intp(0, 0, 9)
cpu_intr_0_365:
	setx	0x47013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe52100  ! 4584: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_312:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_312), 16, 16)) -> intp(0, 0, 2b)
T0_asi_reg_rd_192:
	mov	0x27, %r14
	.word 0xfedb89e0  ! 4589: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T0_asi_reg_rd_193:
	mov	0x3c2, %r14
	.word 0xfedb8e40  ! 4590: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb49460b8  ! 4592: ORcc_I	orcc 	%r17, 0x00b8, %r26
cpu_intr_0_366:
	setx	0x470211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b5c000  ! 4596: ORNcc_R	orncc 	%r23, %r0, %r25
cpu_intr_0_367:
	setx	0x460235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e461cf  ! 4601: SAVE_I	save	%r17, 0x0001, %r27
T0_asi_reg_rd_194:
	mov	0xa, %r14
	.word 0xfadb8e80  ! 4603: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_0_313:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_313), 16, 16)) -> intp(0, 0, d)
	.word 0xb635a061  ! 4610: SUBC_I	orn 	%r22, 0x0061, %r27
	.word 0xb29d0000  ! 4612: XORcc_R	xorcc 	%r20, %r0, %r25
	.word 0xb7e44000  ! 4614: SAVE_R	save	%r17, %r0, %r27
	.word 0xb9e4c000  ! 4617: SAVE_R	save	%r19, %r0, %r28
T0_asi_reg_wr_203:
	mov	0x16, %r14
	.word 0xfaf38e80  ! 4619: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_0_368:
	setx	0x460016, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_314:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_314), 16, 16)) -> intp(0, 0, 26)
	.word 0xb61d8000  ! 4623: XOR_R	xor 	%r22, %r0, %r27
iob_intr_0_315:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_315), 16, 16)) -> intp(0, 0, a)
T0_asi_reg_wr_204:
	mov	0x31, %r14
	.word 0xfef38e40  ! 4626: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_369:
	setx	0x46012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 4629: SAVE_R	save	%r21, %r0, %r27
	.word 0xbe2da162  ! 4631: ANDN_I	andn 	%r22, 0x0162, %r31
	.word 0xb1e461e0  ! 4633: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_rd_195:
	mov	0x3c0, %r14
	.word 0xfcdb8e40  ! 4634: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbfe4e10e  ! 4636: SAVE_I	save	%r19, 0x0001, %r31
T0_asi_reg_rd_196:
	mov	0x3c7, %r14
	.word 0xf6db8e60  ! 4638: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T0_asi_reg_rd_197:
	mov	0x3c8, %r14
	.word 0xf0db8e40  ! 4639: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbde5a106  ! 4640: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb4344000  ! 4641: ORN_R	orn 	%r17, %r0, %r26
	.word 0xb3e5607a  ! 4642: SAVE_I	save	%r21, 0x0001, %r25
iob_intr_0_316:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_316), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_wr_205:
	mov	0x18, %r14
	.word 0xfaf38e60  ! 4647: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb93dd000  ! 4648: SRAX_R	srax	%r23, %r0, %r28
iob_intr_0_317:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_317), 16, 16)) -> intp(0, 0, 3)
cpu_intr_0_370:
	setx	0x460104, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_206:
	mov	0x2e, %r14
	.word 0xf0f389e0  ! 4657: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_0_371:
	setx	0x44031b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_372:
	setx	0x44011f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_318:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_318), 16, 16)) -> intp(0, 0, 3e)
iob_intr_0_319:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_319), 16, 16)) -> intp(0, 0, 13)
T0_asi_reg_wr_207:
	mov	0x29, %r14
	.word 0xfaf38e80  ! 4669: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbde50000  ! 4670: SAVE_R	save	%r20, %r0, %r30
iob_intr_0_320:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_320), 16, 16)) -> intp(0, 0, b)
T0_asi_reg_rd_198:
	mov	0x3c4, %r14
	.word 0xfcdb8e80  ! 4674: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_0_321:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_321), 16, 16)) -> intp(0, 0, 28)
cpu_intr_0_373:
	setx	0x44022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e44000  ! 4677: SAVE_R	save	%r17, %r0, %r28
cpu_intr_0_374:
	setx	0x47032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e42178  ! 4679: SAVE_I	save	%r16, 0x0001, %r28
T0_asi_reg_rd_199:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 4681: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb3e4e1d4  ! 4685: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_322:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_322), 16, 16)) -> intp(0, 0, 3b)
T0_asi_reg_rd_200:
	mov	0xe, %r14
	.word 0xf4db89e0  ! 4690: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb7e58000  ! 4692: SAVE_R	save	%r22, %r0, %r27
	.word 0xb1e5a102  ! 4694: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbfe40000  ! 4698: SAVE_R	save	%r16, %r0, %r31
T0_asi_reg_wr_208:
	mov	0x3c6, %r14
	.word 0xfaf389e0  ! 4701: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb1e54000  ! 4702: SAVE_R	save	%r21, %r0, %r24
cpu_intr_0_375:
	setx	0x450122, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_323:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_323), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb7e5e140  ! 4708: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbfe44000  ! 4716: SAVE_R	save	%r17, %r0, %r31
	.word 0xb3e54000  ! 4718: SAVE_R	save	%r21, %r0, %r25
iob_intr_0_324:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_324), 16, 16)) -> intp(0, 0, f)
iob_intr_0_325:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_325), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_wr_209:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 4724: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb634e013  ! 4725: ORN_I	orn 	%r19, 0x0013, %r27
T0_asi_reg_rd_201:
	mov	0xf, %r14
	.word 0xf6db8e60  ! 4727: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T0_asi_reg_wr_210:
	mov	0x19, %r14
	.word 0xfef384a0  ! 4728: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_0_326:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_326), 16, 16)) -> intp(0, 0, 21)
cpu_intr_0_376:
	setx	0x45012c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_202:
	mov	0x3c1, %r14
	.word 0xf2db8e40  ! 4732: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T0_asi_reg_wr_211:
	mov	0x32, %r14
	.word 0xf2f38e80  ! 4733: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_0_377:
	setx	0x450137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e44000  ! 4737: SAVE_R	save	%r17, %r0, %r25
cpu_intr_0_378:
	setx	0x46021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e1d6  ! 4741: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_rd_203:
	mov	0x4, %r14
	.word 0xf2db8e80  ! 4745: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbde4a0d1  ! 4748: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde42020  ! 4752: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbfe4c000  ! 4754: SAVE_R	save	%r19, %r0, %r31
T0_asi_reg_rd_204:
	mov	0x33, %r14
	.word 0xfcdb8e40  ! 4757: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbde5615d  ! 4758: SAVE_I	save	%r21, 0x0001, %r30
T0_asi_reg_wr_212:
	mov	0x34, %r14
	.word 0xfef38e40  ! 4759: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_0_379:
	setx	0x460000, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_205:
	mov	0x6, %r14
	.word 0xf6db89e0  ! 4763: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb005e03c  ! 4764: ADD_I	add 	%r23, 0x003c, %r24
iob_intr_0_327:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_327), 16, 16)) -> intp(0, 0, 10)
	.word 0xb5e50000  ! 4766: SAVE_R	save	%r20, %r0, %r26
iob_intr_0_328:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_328), 16, 16)) -> intp(0, 0, 29)
	.word 0xb7e461a6  ! 4770: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb044e13b  ! 4771: ADDC_I	addc 	%r19, 0x013b, %r24
cpu_intr_0_380:
	setx	0x460106, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_213:
	mov	0x23, %r14
	.word 0xf8f38400  ! 4774: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T0_asi_reg_rd_206:
	mov	0x29, %r14
	.word 0xfadb89e0  ! 4778: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_0_381:
	setx	0x440131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e0ae  ! 4784: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbbe54000  ! 4787: SAVE_R	save	%r21, %r0, %r29
	.word 0xb3e54000  ! 4788: SAVE_R	save	%r21, %r0, %r25
	.word 0xbc246157  ! 4793: SUB_I	sub 	%r17, 0x0157, %r30
	.word 0xb7e54000  ! 4796: SAVE_R	save	%r21, %r0, %r27
	.word 0xb3e46127  ! 4797: SAVE_I	save	%r17, 0x0001, %r25
T0_asi_reg_wr_214:
	mov	0x9, %r14
	.word 0xfaf38e40  ! 4800: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_329:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_329), 16, 16)) -> intp(0, 0, 19)
	.word 0xb5e48000  ! 4802: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_330:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_330), 16, 16)) -> intp(0, 0, 2c)
T0_asi_reg_rd_207:
	mov	0x14, %r14
	.word 0xfadb89e0  ! 4810: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_0_331:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_331), 16, 16)) -> intp(0, 0, a)
iob_intr_0_332:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_332), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_rd_208:
	mov	0x1d, %r14
	.word 0xf4db8e40  ! 4813: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb9e520a0  ! 4814: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb5e40000  ! 4817: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_rd_209:
	mov	0x6, %r14
	.word 0xfadb8e60  ! 4823: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_0_333:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_333), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_wr_215:
	mov	0x38, %r14
	.word 0xfaf389e0  ! 4830: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb3e54000  ! 4832: SAVE_R	save	%r21, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e5603f  ! 4835: SAVE_I	save	%r21, 0x0001, %r27
cpu_intr_0_382:
	setx	0x460213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb735c000  ! 4839: SRL_R	srl 	%r23, %r0, %r27
T0_asi_reg_rd_210:
	mov	0x2e, %r14
	.word 0xf0db89e0  ! 4840: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_0_383:
	setx	0x47011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5c000  ! 4846: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_384:
	setx	0x44022e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_385:
	setx	0x440216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 4858: SAVE_R	save	%r23, %r0, %r27
	.word 0xb9e4c000  ! 4859: SAVE_R	save	%r19, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_334:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_334), 16, 16)) -> intp(0, 0, 6)
cpu_intr_0_386:
	setx	0x45011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb49c0000  ! 4866: XORcc_R	xorcc 	%r16, %r0, %r26
	.word 0xbfe421a9  ! 4868: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbfe50000  ! 4869: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_387:
	setx	0x45031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb00c6141  ! 4871: AND_I	and 	%r17, 0x0141, %r24
T0_asi_reg_rd_211:
	mov	0x3c8, %r14
	.word 0xf2db84a0  ! 4873: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb3e42030  ! 4874: SAVE_I	save	%r16, 0x0001, %r25
cpu_intr_0_388:
	setx	0x450211, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_335:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_335), 16, 16)) -> intp(0, 0, 30)
cpu_intr_0_389:
	setx	0x47012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_336:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_336), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb5e4e153  ! 4880: SAVE_I	save	%r19, 0x0001, %r26
cpu_intr_0_390:
	setx	0x450116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_337:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_337), 16, 16)) -> intp(0, 0, 1)
	.word 0xbbe44000  ! 4888: SAVE_R	save	%r17, %r0, %r29
	.word 0xbde44000  ! 4889: SAVE_R	save	%r17, %r0, %r30
	.word 0xbe3ce1f1  ! 4891: XNOR_I	xnor 	%r19, 0x01f1, %r31
	.word 0xb9e560c3  ! 4893: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb1e50000  ! 4895: SAVE_R	save	%r20, %r0, %r24
iob_intr_0_338:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_338), 16, 16)) -> intp(0, 0, 2f)
T0_asi_reg_rd_212:
	mov	0xe, %r14
	.word 0xf2db84a0  ! 4897: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_0_339:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_339), 16, 16)) -> intp(0, 0, 17)
	.word 0xbfe48000  ! 4899: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_wr_216:
	mov	0x3c6, %r14
	.word 0xfaf38400  ! 4900: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbde52115  ! 4905: SAVE_I	save	%r20, 0x0001, %r30
cpu_intr_0_391:
	setx	0x470201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e0fb  ! 4909: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb9e40000  ! 4911: SAVE_R	save	%r16, %r0, %r28
cpu_intr_0_392:
	setx	0x47013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_213:
	mov	0x2b, %r14
	.word 0xf2db8e40  ! 4916: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb3e58000  ! 4917: SAVE_R	save	%r22, %r0, %r25
T0_asi_reg_wr_217:
	mov	0x2b, %r14
	.word 0xfef38e60  ! 4921: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb3e4600e  ! 4923: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3e460f3  ! 4924: SAVE_I	save	%r17, 0x0001, %r25
cpu_intr_0_393:
	setx	0x45033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6248000  ! 4931: SUB_R	sub 	%r18, %r0, %r27
	.word 0xbfe461d9  ! 4932: SAVE_I	save	%r17, 0x0001, %r31
iob_intr_0_340:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_340), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_wr_218:
	mov	0x15, %r14
	.word 0xf8f389e0  ! 4937: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbde52102  ! 4940: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_rd_214:
	mov	0x3c7, %r14
	.word 0xfcdb8e60  ! 4942: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb93d2001  ! 4944: SRA_I	sra 	%r20, 0x0001, %r28
cpu_intr_0_394:
	setx	0x45033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb08d617b  ! 4948: ANDcc_I	andcc 	%r21, 0x017b, %r24
T0_asi_reg_rd_215:
	mov	0x2e, %r14
	.word 0xf4db8e60  ! 4949: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_0_341:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_341), 16, 16)) -> intp(0, 0, 16)
iob_intr_0_342:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_342), 16, 16)) -> intp(0, 0, 9)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbde420ef  ! 4960: SAVE_I	save	%r16, 0x0001, %r30
iob_intr_0_343:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_343), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_rd_216:
	mov	0x3c4, %r14
	.word 0xf2db84a0  ! 4967: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb1358000  ! 4969: SRL_R	srl 	%r22, %r0, %r24
iob_intr_0_344:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_344), 16, 16)) -> intp(0, 0, 7)
	.word 0xb9e460e8  ! 4977: SAVE_I	save	%r17, 0x0001, %r28
T0_asi_reg_wr_219:
	mov	0x18, %r14
	.word 0xfaf38e80  ! 4978: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T0_asi_reg_rd_217:
	mov	0x3c3, %r14
	.word 0xf0db89e0  ! 4979: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb3e40000  ! 4982: SAVE_R	save	%r16, %r0, %r25
cpu_intr_0_395:
	setx	0x46031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4c000  ! 4992: SAVE_R	save	%r19, %r0, %r27
	.word 0xb3e520a7  ! 4995: SAVE_I	save	%r20, 0x0001, %r25
iob_intr_0_345:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_345), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb7e4e15a  ! 4998: SAVE_I	save	%r19, 0x0001, %r27
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
	.word 0xf2f5a026  ! 2: STXA_I	stxa	%r25, [%r22 + 0x0026] %asi
T3_asi_reg_wr_0:
	mov	0x1b, %r14
	.word 0xf0f38400  ! 3: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_0), 16, 16)) -> intp(3, 0, a)
cpu_intr_3_0:
	setx	0x1a003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0aca00d  ! 7: STBA_I	stba	%r24, [%r18 + 0x000d] %asi
iob_intr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_1), 16, 16)) -> intp(3, 0, e)
	.word 0xf4a50020  ! 11: STWA_R	stwa	%r26, [%r20 + %r0] 0x01
	.word 0xf8352104  ! 15: STH_I	sth	%r28, [%r20 + 0x0104]
	.word 0xfc250000  ! 18: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xbd643801  ! 19: MOVcc_I	<illegal instruction>
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983840  ! 21: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1840, %hpstate
	.word 0xf8250000  ! 22: STW_R	stw	%r28, [%r20 + %r0]
	.word 0xf0b5e0ad  ! 27: STHA_I	stha	%r24, [%r23 + 0x00ad] %asi
	.word 0xfea4c020  ! 29: STWA_R	stwa	%r31, [%r19 + %r0] 0x01
cpu_intr_3_1:
	setx	0x1e0302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb63c0000  ! 37: XNOR_R	xnor 	%r16, %r0, %r27
cpu_intr_3_2:
	setx	0x1f000a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_1:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 42: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_2), 16, 16)) -> intp(3, 0, 30)
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_2:
	mov	0x3c1, %r14
	.word 0xfcf384a0  ! 45: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_3_3:
	setx	0x1c0220, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_3), 16, 16)) -> intp(3, 0, 4)
T3_asi_reg_wr_3:
	mov	0x3c4, %r14
	.word 0xf2f389e0  ! 49: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_TO_TL0
iob_intr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_4), 16, 16)) -> intp(3, 0, 2b)
iob_intr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_5), 16, 16)) -> intp(3, 0, 1c)
cpu_intr_3_4:
	setx	0x1f033a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_5:
	setx	0x1f0237, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_0:
	mov	0x3c4, %r14
	.word 0xf0db84a0  ! 60: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_3_6:
	setx	0x1d020f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_1:
	mov	0x36, %r14
	.word 0xf8db8e40  ! 63: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_7:
	setx	0x1f0138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b5c020  ! 68: STHA_R	stha	%r26, [%r23 + %r0] 0x01
	.word 0xf6f4e1c3  ! 69: STXA_I	stxa	%r27, [%r19 + 0x01c3] %asi
	.word 0xf42c0000  ! 71: STB_R	stb	%r26, [%r16 + %r0]
	.word 0xf6352053  ! 72: STH_I	sth	%r27, [%r20 + 0x0053]
iob_intr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_6), 16, 16)) -> intp(3, 0, 1b)
T3_asi_reg_wr_4:
	mov	0x34, %r14
	.word 0xf0f384a0  ! 74: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_3_8:
	setx	0x1f031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc248000  ! 76: SUB_R	sub 	%r18, %r0, %r30
T3_asi_reg_wr_5:
	mov	0x7, %r14
	.word 0xfef384a0  ! 77: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf274e01b  ! 79: STX_I	stx	%r25, [%r19 + 0x001b]
	.word 0xf4748000  ! 80: STX_R	stx	%r26, [%r18 + %r0]
	.word 0xb68d8000  ! 83: ANDcc_R	andcc 	%r22, %r0, %r27
	.word 0xfe74e1c5  ! 84: STX_I	stx	%r31, [%r19 + 0x01c5]
	.word 0xfc75a1df  ! 85: STX_I	stx	%r30, [%r22 + 0x01df]
T3_asi_reg_wr_6:
	mov	0x3c5, %r14
	.word 0xf4f38e80  ! 87: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL1
cpu_intr_3_9:
	setx	0x1f010e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_2:
	mov	0x24, %r14
	.word 0xfadb8e40  ! 96: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_7), 16, 16)) -> intp(3, 0, 14)
	.word 0xfa350000  ! 99: STH_R	sth	%r29, [%r20 + %r0]
	.word 0xba850000  ! 100: ADDcc_R	addcc 	%r20, %r0, %r29
	.word 0xb605e059  ! 101: ADD_I	add 	%r23, 0x0059, %r27
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983cd0  ! 102: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd0, %hpstate
iob_intr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_8), 16, 16)) -> intp(3, 0, 8)
iob_intr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_9), 16, 16)) -> intp(3, 0, 1b)
iob_intr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_10), 16, 16)) -> intp(3, 0, 27)
	ta	T_CHANGE_TO_TL0
	.word 0xf225c000  ! 112: STW_R	stw	%r25, [%r23 + %r0]
T3_asi_reg_wr_7:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 113: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0x8795e168  ! 115: WRPR_TT_I	wrpr	%r23, 0x0168, %tt
iob_intr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_11), 16, 16)) -> intp(3, 0, 2a)
T3_asi_reg_wr_8:
	mov	0x1a, %r14
	.word 0xf6f38e40  ! 119: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL0
cpu_intr_3_10:
	setx	0x1c0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62c600e  ! 129: STB_I	stb	%r27, [%r17 + 0x000e]
cpu_intr_3_11:
	setx	0x1f000d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_3:
	mov	0xe, %r14
	.word 0xf8db8e40  ! 137: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfe2d0000  ! 138: STB_R	stb	%r31, [%r20 + %r0]
cpu_intr_3_12:
	setx	0x1d0036, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_9:
	mov	0xc, %r14
	.word 0xf2f38e40  ! 141: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_3_13:
	setx	0x1c0002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82c4000  ! 144: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xb2b5217d  ! 147: ORNcc_I	orncc 	%r20, 0x017d, %r25
iob_intr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_12), 16, 16)) -> intp(3, 0, 14)
	ta	T_CHANGE_TO_TL0
	.word 0xfaad0020  ! 154: STBA_R	stba	%r29, [%r20 + %r0] 0x01
	.word 0xb20c4000  ! 155: AND_R	and 	%r17, %r0, %r25
	.word 0xf0b4a127  ! 157: STHA_I	stha	%r24, [%r18 + 0x0127] %asi
	ta	T_CHANGE_HPRIV
	.word 0xb434e063  ! 159: ORN_I	orn 	%r19, 0x0063, %r26
cpu_intr_3_14:
	setx	0x1c0314, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_13), 16, 16)) -> intp(3, 0, 3f)
	.word 0xfa25e1ba  ! 164: STW_I	stw	%r29, [%r23 + 0x01ba]
	.word 0xb4bc4000  ! 166: XNORcc_R	xnorcc 	%r17, %r0, %r26
cpu_intr_3_15:
	setx	0x1d0015, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_14), 16, 16)) -> intp(3, 0, 34)
	.word 0xba25a0a1  ! 174: SUB_I	sub 	%r22, 0x00a1, %r29
iob_intr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_15), 16, 16)) -> intp(3, 0, 25)
	.word 0xfc25e169  ! 176: STW_I	stw	%r30, [%r23 + 0x0169]
	.word 0xba058000  ! 178: ADD_R	add 	%r22, %r0, %r29
	.word 0xfa248000  ! 182: STW_R	stw	%r29, [%r18 + %r0]
iob_intr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_16), 16, 16)) -> intp(3, 0, 2a)
iob_intr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_17), 16, 16)) -> intp(3, 0, 7)
T3_asi_reg_wr_10:
	mov	0x3c5, %r14
	.word 0xf2f38400  ! 187: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb28de061  ! 188: ANDcc_I	andcc 	%r23, 0x0061, %r25
	.word 0xbc0ca140  ! 190: AND_I	and 	%r18, 0x0140, %r30
	.word 0xf8a48020  ! 191: STWA_R	stwa	%r28, [%r18 + %r0] 0x01
	.word 0xb6c50000  ! 193: ADDCcc_R	addccc 	%r20, %r0, %r27
	.word 0xfeb5a187  ! 195: STHA_I	stha	%r31, [%r22 + 0x0187] %asi
	.word 0xfaac61d3  ! 196: STBA_I	stba	%r29, [%r17 + 0x01d3] %asi
cpu_intr_3_16:
	setx	0x1e0104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2da02a  ! 200: STB_I	stb	%r30, [%r22 + 0x002a]
cpu_intr_3_17:
	setx	0x1e0008, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_4:
	mov	0x3c6, %r14
	.word 0xf4db8400  ! 207: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf0b40020  ! 209: STHA_R	stha	%r24, [%r16 + %r0] 0x01
cpu_intr_3_18:
	setx	0x1d0020, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_19:
	setx	0x1c0001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe748000  ! 212: STX_R	stx	%r31, [%r18 + %r0]
	.word 0xfe250000  ! 213: STW_R	stw	%r31, [%r20 + %r0]
iob_intr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_18), 16, 16)) -> intp(3, 0, 11)
	.word 0xfe75c000  ! 220: STX_R	stx	%r31, [%r23 + %r0]
	.word 0xf0ada0f7  ! 225: STBA_I	stba	%r24, [%r22 + 0x00f7] %asi
T3_asi_reg_wr_11:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 226: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T3_asi_reg_wr_12:
	mov	0x1c, %r14
	.word 0xf0f38e80  ! 228: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf634a0a1  ! 229: STH_I	sth	%r27, [%r18 + 0x00a1]
iob_intr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_19), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf434202f  ! 234: STH_I	sth	%r26, [%r16 + 0x002f]
T3_asi_reg_rd_5:
	mov	0x2b, %r14
	.word 0xfadb8e60  ! 235: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T3_asi_reg_rd_6:
	mov	0x24, %r14
	.word 0xf4db8e60  ! 236: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	ta	T_CHANGE_TO_TL1
	.word 0xa1902002  ! 239: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983a10  ! 240: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a10, %hpstate
	.word 0xfe2c21e6  ! 241: STB_I	stb	%r31, [%r16 + 0x01e6]
iob_intr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_20), 16, 16)) -> intp(3, 0, d)
cpu_intr_3_20:
	setx	0x1f0130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcace1b9  ! 249: STBA_I	stba	%r30, [%r19 + 0x01b9] %asi
iob_intr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_21), 16, 16)) -> intp(3, 0, 2e)
	.word 0xfeb58020  ! 255: STHA_R	stha	%r31, [%r22 + %r0] 0x01
iob_intr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_22), 16, 16)) -> intp(3, 0, 6)
	.word 0xf4ac0020  ! 258: STBA_R	stba	%r26, [%r16 + %r0] 0x01
cpu_intr_3_21:
	setx	0x1e0330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa340000  ! 263: STH_R	sth	%r29, [%r16 + %r0]
	.word 0xfe750000  ! 264: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xb6b58000  ! 265: SUBCcc_R	orncc 	%r22, %r0, %r27
cpu_intr_3_22:
	setx	0x1d0006, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_13:
	mov	0x29, %r14
	.word 0xfcf38400  ! 267: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xf8b5a059  ! 268: STHA_I	stha	%r28, [%r22 + 0x0059] %asi
	.word 0xf22421ba  ! 270: STW_I	stw	%r25, [%r16 + 0x01ba]
cpu_intr_3_23:
	setx	0x1e030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf6b46053  ! 275: STHA_I	stha	%r27, [%r17 + 0x0053] %asi
	.word 0xf8250000  ! 278: STW_R	stw	%r28, [%r20 + %r0]
	.word 0xf6b58020  ! 280: STHA_R	stha	%r27, [%r22 + %r0] 0x01
	.word 0xb1641800  ! 281: MOVcc_R	<illegal instruction>
	.word 0xfe2da0cc  ! 285: STB_I	stb	%r31, [%r22 + 0x00cc]
cpu_intr_3_24:
	setx	0x1d0027, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_23), 16, 16)) -> intp(3, 0, 1c)
	.word 0xf274c000  ! 291: STX_R	stx	%r25, [%r19 + %r0]
	.word 0xf6b4e098  ! 293: STHA_I	stha	%r27, [%r19 + 0x0098] %asi
	.word 0xf4a4a0e5  ! 295: STWA_I	stwa	%r26, [%r18 + 0x00e5] %asi
T3_asi_reg_rd_7:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 296: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf825e136  ! 297: STW_I	stw	%r28, [%r23 + 0x0136]
T3_asi_reg_wr_14:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 301: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_3_25:
	setx	0x1e010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc24601b  ! 303: STW_I	stw	%r30, [%r17 + 0x001b]
T3_asi_reg_wr_15:
	mov	0x22, %r14
	.word 0xf4f38e60  ! 304: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_3_26:
	setx	0x1d0313, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_27:
	setx	0x1e012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8258000  ! 310: STW_R	stw	%r28, [%r22 + %r0]
	ta	T_CHANGE_NONHPRIV
	.word 0xf22ce113  ! 312: STB_I	stb	%r25, [%r19 + 0x0113]
	.word 0xfe752017  ! 313: STX_I	stx	%r31, [%r20 + 0x0017]
	.word 0xfc7421fc  ! 315: STX_I	stx	%r30, [%r16 + 0x01fc]
cpu_intr_3_28:
	setx	0x1f003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b4c020  ! 317: STHA_R	stha	%r26, [%r19 + %r0] 0x01
	.word 0xfeb42009  ! 318: STHA_I	stha	%r31, [%r16 + 0x0009] %asi
iob_intr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_24), 16, 16)) -> intp(3, 0, 1e)
	.word 0xfaa50020  ! 323: STWA_R	stwa	%r29, [%r20 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
iob_intr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_25), 16, 16)) -> intp(3, 0, 1f)
cpu_intr_3_29:
	setx	0x1e0231, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_26), 16, 16)) -> intp(3, 0, 29)
T3_asi_reg_wr_16:
	mov	0x3c6, %r14
	.word 0xfcf389e0  ! 334: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T3_asi_reg_rd_8:
	mov	0xa, %r14
	.word 0xf4db8400  ! 335: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_3_30:
	setx	0x1c021c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_9:
	mov	0x2e, %r14
	.word 0xf0db84a0  ! 337: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf6ade15d  ! 339: STBA_I	stba	%r27, [%r23 + 0x015d] %asi
cpu_intr_3_31:
	setx	0x1f0019, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_10:
	mov	0x3c8, %r14
	.word 0xf4db8e60  ! 344: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf6f5e0ec  ! 345: STXA_I	stxa	%r27, [%r23 + 0x00ec] %asi
cpu_intr_3_32:
	setx	0x1f033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_TO_TL1
	.word 0xf6b560df  ! 358: STHA_I	stha	%r27, [%r21 + 0x00df] %asi
	.word 0xf8f520e3  ! 361: STXA_I	stxa	%r28, [%r20 + 0x00e3] %asi
cpu_intr_3_33:
	setx	0x1e003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b5a160  ! 365: ORNcc_I	orncc 	%r22, 0x0160, %r28
T3_asi_reg_rd_11:
	mov	0x3c1, %r14
	.word 0xfadb8e60  ! 368: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_27), 16, 16)) -> intp(3, 0, 37)
iob_intr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_28), 16, 16)) -> intp(3, 0, d)
	.word 0xb1356001  ! 373: SRL_I	srl 	%r21, 0x0001, %r24
T3_asi_reg_rd_12:
	mov	0x0, %r14
	.word 0xf8db8400  ! 377: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982c4a  ! 378: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4a, %hpstate
iob_intr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_29), 16, 16)) -> intp(3, 0, 19)
iob_intr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_30), 16, 16)) -> intp(3, 0, 31)
iob_intr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_31), 16, 16)) -> intp(3, 0, 11)
iob_intr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_32), 16, 16)) -> intp(3, 0, a)
	.word 0xf8ac4020  ! 385: STBA_R	stba	%r28, [%r17 + %r0] 0x01
cpu_intr_3_34:
	setx	0x1d021a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_33), 16, 16)) -> intp(3, 0, 27)
cpu_intr_3_35:
	setx	0x1d0228, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_36:
	setx	0x1c0127, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_34), 16, 16)) -> intp(3, 0, 18)
T3_asi_reg_rd_13:
	mov	0x19, %r14
	.word 0xf6db8e60  ! 398: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf6a42064  ! 399: STWA_I	stwa	%r27, [%r16 + 0x0064] %asi
T3_asi_reg_wr_17:
	mov	0x15, %r14
	.word 0xf2f384a0  ! 400: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf4a5a095  ! 403: STWA_I	stwa	%r26, [%r22 + 0x0095] %asi
T3_asi_reg_wr_18:
	mov	0x35, %r14
	.word 0xf2f38400  ! 404: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xfaf421d6  ! 405: STXA_I	stxa	%r29, [%r16 + 0x01d6] %asi
	.word 0xf2a4a136  ! 406: STWA_I	stwa	%r25, [%r18 + 0x0136] %asi
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982902  ! 407: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0902, %hpstate
T3_asi_reg_rd_14:
	mov	0x16, %r14
	.word 0xf6db8e40  ! 409: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfc75e1e7  ! 414: STX_I	stx	%r30, [%r23 + 0x01e7]
iob_intr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_35), 16, 16)) -> intp(3, 0, 38)
cpu_intr_3_37:
	setx	0x1f0324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8256039  ! 417: STW_I	stw	%r28, [%r21 + 0x0039]
T3_asi_reg_rd_15:
	mov	0x5, %r14
	.word 0xf2db8e40  ! 425: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xa1902001  ! 427: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xf6a5a1be  ! 430: STWA_I	stwa	%r27, [%r22 + 0x01be] %asi
	.word 0xfc2da0b5  ! 434: STB_I	stb	%r30, [%r22 + 0x00b5]
cpu_intr_3_38:
	setx	0x1c0001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeac0020  ! 437: STBA_R	stba	%r31, [%r16 + %r0] 0x01
cpu_intr_3_39:
	setx	0x1e0130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeb5e1bb  ! 439: ORNcc_I	orncc 	%r23, 0x01bb, %r31
	.word 0xb2052142  ! 440: ADD_I	add 	%r20, 0x0142, %r25
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_16:
	mov	0x3c2, %r14
	.word 0xf0db89e0  ! 444: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983a98  ! 446: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a98, %hpstate
iob_intr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_36), 16, 16)) -> intp(3, 0, 3a)
	.word 0xfc342051  ! 450: STH_I	sth	%r30, [%r16 + 0x0051]
cpu_intr_3_40:
	setx	0x1c0000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb5a179  ! 452: STHA_I	stha	%r31, [%r22 + 0x0179] %asi
iob_intr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_37), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf0ad0020  ! 455: STBA_R	stba	%r24, [%r20 + %r0] 0x01
T3_asi_reg_wr_19:
	mov	0x23, %r14
	.word 0xf0f389e0  ! 458: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_3_41:
	setx	0x1d0110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a44020  ! 460: STWA_R	stwa	%r25, [%r17 + %r0] 0x01
T3_asi_reg_wr_20:
	mov	0x22, %r14
	.word 0xf8f38e80  ! 461: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xfca5e082  ! 464: STWA_I	stwa	%r30, [%r23 + 0x0082] %asi
iob_intr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_38), 16, 16)) -> intp(3, 0, 21)
	.word 0xf0a4a115  ! 468: STWA_I	stwa	%r24, [%r18 + 0x0115] %asi
	.word 0xfcb48020  ! 469: STHA_R	stha	%r30, [%r18 + %r0] 0x01
	.word 0xf22560cc  ! 470: STW_I	stw	%r25, [%r21 + 0x00cc]
	.word 0xb6254000  ! 471: SUB_R	sub 	%r21, %r0, %r27
T3_asi_reg_wr_21:
	mov	0x2f, %r14
	.word 0xf6f384a0  ! 472: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T3_asi_reg_rd_17:
	mov	0x38, %r14
	.word 0xfcdb8e60  ! 473: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf2a44020  ! 474: STWA_R	stwa	%r25, [%r17 + %r0] 0x01
cpu_intr_3_42:
	setx	0x22001a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_22:
	mov	0x23, %r14
	.word 0xfef38e40  ! 476: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_wr_23:
	mov	0x33, %r14
	.word 0xf8f38e80  ! 478: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf874618b  ! 479: STX_I	stx	%r28, [%r17 + 0x018b]
	.word 0xf2342110  ! 482: STH_I	sth	%r25, [%r16 + 0x0110]
T3_asi_reg_wr_24:
	mov	0x1, %r14
	.word 0xf2f38e40  ! 484: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
	.word 0xfc250000  ! 489: STW_R	stw	%r30, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
iob_intr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_39), 16, 16)) -> intp(3, 0, 2f)
T3_asi_reg_rd_18:
	mov	0x13, %r14
	.word 0xf4db8e60  ! 494: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_40), 16, 16)) -> intp(3, 0, 2)
cpu_intr_3_43:
	setx	0x22011f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_41), 16, 16)) -> intp(3, 0, d)
	.word 0xb3355000  ! 503: SRLX_R	srlx	%r21, %r0, %r25
cpu_intr_3_44:
	setx	0x220122, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_45:
	setx	0x20013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983850  ! 506: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1850, %hpstate
	.word 0xf874c000  ! 507: STX_R	stx	%r28, [%r19 + %r0]
T3_asi_reg_wr_25:
	mov	0x2, %r14
	.word 0xf2f38400  ! 508: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xf074e156  ! 509: STX_I	stx	%r24, [%r19 + 0x0156]
iob_intr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_42), 16, 16)) -> intp(3, 0, 3c)
cpu_intr_3_46:
	setx	0x23012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2460b5  ! 518: STW_I	stw	%r29, [%r17 + 0x00b5]
	.word 0xf6f4a0ca  ! 519: STXA_I	stxa	%r27, [%r18 + 0x00ca] %asi
iob_intr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_43), 16, 16)) -> intp(3, 0, 35)
	.word 0xbeada0fa  ! 523: ANDNcc_I	andncc 	%r22, 0x00fa, %r31
	ta	T_CHANGE_TO_TL0
iob_intr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_44), 16, 16)) -> intp(3, 0, 2e)
	.word 0xbe458000  ! 531: ADDC_R	addc 	%r22, %r0, %r31
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983c18  ! 532: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c18, %hpstate
T3_asi_reg_wr_26:
	mov	0x3c6, %r14
	.word 0xfef38e40  ! 533: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983b82  ! 536: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b82, %hpstate
cpu_intr_3_47:
	setx	0x200301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a4c020  ! 540: STWA_R	stwa	%r24, [%r19 + %r0] 0x01
T3_asi_reg_rd_19:
	mov	0xc, %r14
	.word 0xfadb8e80  ! 541: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_45), 16, 16)) -> intp(3, 0, 15)
	.word 0xfcac0020  ! 544: STBA_R	stba	%r30, [%r16 + %r0] 0x01
T3_asi_reg_rd_20:
	mov	0x2f, %r14
	.word 0xf6db8e40  ! 547: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfa740000  ! 548: STX_R	stx	%r29, [%r16 + %r0]
cpu_intr_3_48:
	setx	0x20011f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_21:
	mov	0x19, %r14
	.word 0xf4db8e40  ! 550: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_49:
	setx	0x230123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe758000  ! 553: STX_R	stx	%r31, [%r22 + %r0]
T3_asi_reg_wr_27:
	mov	0x3c1, %r14
	.word 0xfcf38e60  ! 554: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_3_50:
	setx	0x21011b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_46), 16, 16)) -> intp(3, 0, 3c)
T3_asi_reg_wr_28:
	mov	0xd, %r14
	.word 0xf4f389e0  ! 557: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T3_asi_reg_rd_22:
	mov	0x37, %r14
	.word 0xfadb8400  ! 559: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T3_asi_reg_wr_29:
	mov	0x34, %r14
	.word 0xf6f38e60  ! 560: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_3_51:
	setx	0x230006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf824c000  ! 562: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xf2a5603f  ! 563: STWA_I	stwa	%r25, [%r21 + 0x003f] %asi
	ta	T_CHANGE_TO_TL1
cpu_intr_3_52:
	setx	0x220204, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_47), 16, 16)) -> intp(3, 0, 1d)
T3_asi_reg_wr_30:
	mov	0x21, %r14
	.word 0xf4f38e60  ! 573: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf62da08b  ! 575: STB_I	stb	%r27, [%r22 + 0x008b]
	.word 0xf0b460fe  ! 576: STHA_I	stha	%r24, [%r17 + 0x00fe] %asi
T3_asi_reg_wr_31:
	mov	0x3c7, %r14
	.word 0xf8f384a0  ! 577: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_3_53:
	setx	0x22011b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_32:
	mov	0x2c, %r14
	.word 0xf2f38e40  ! 581: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbb341000  ! 585: SRLX_R	srlx	%r16, %r0, %r29
cpu_intr_3_54:
	setx	0x220112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcac8020  ! 587: STBA_R	stba	%r30, [%r18 + %r0] 0x01
iob_intr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_48), 16, 16)) -> intp(3, 0, 33)
cpu_intr_3_55:
	setx	0x200239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf474e0a6  ! 593: STX_I	stx	%r26, [%r19 + 0x00a6]
cpu_intr_3_56:
	setx	0x20032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2340000  ! 595: STH_R	sth	%r25, [%r16 + %r0]
	.word 0xf234a157  ! 599: STH_I	sth	%r25, [%r18 + 0x0157]
cpu_intr_3_57:
	setx	0x22013d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_33:
	mov	0xb, %r14
	.word 0xfef389e0  ! 601: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf6352178  ! 604: STH_I	sth	%r27, [%r20 + 0x0178]
	.word 0xfef5e154  ! 606: STXA_I	stxa	%r31, [%r23 + 0x0154] %asi
cpu_intr_3_58:
	setx	0x22002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf624e06c  ! 614: STW_I	stw	%r27, [%r19 + 0x006c]
cpu_intr_3_59:
	setx	0x20012c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_49), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf675e0e1  ! 620: STX_I	stx	%r27, [%r23 + 0x00e1]
cpu_intr_3_60:
	setx	0x200210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b5e17b  ! 623: STHA_I	stha	%r26, [%r23 + 0x017b] %asi
	.word 0xf2744000  ! 624: STX_R	stx	%r25, [%r17 + %r0]
	ta	T_CHANGE_TO_TL1
cpu_intr_3_61:
	setx	0x21031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2dc000  ! 629: STB_R	stb	%r31, [%r23 + %r0]
	.word 0xbabdc000  ! 631: XNORcc_R	xnorcc 	%r23, %r0, %r29
	.word 0xfcb50020  ! 632: STHA_R	stha	%r30, [%r20 + %r0] 0x01
	.word 0xf6ac8020  ! 633: STBA_R	stba	%r27, [%r18 + %r0] 0x01
iob_intr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_50), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_62:
	setx	0x20030e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_51), 16, 16)) -> intp(3, 0, 38)
iob_intr_3_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_52), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_wr_34:
	mov	0x3c1, %r14
	.word 0xf4f384a0  ! 642: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_3_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_53), 16, 16)) -> intp(3, 0, 34)
cpu_intr_3_63:
	setx	0x21032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb41cc000  ! 648: XOR_R	xor 	%r19, %r0, %r26
	.word 0xbd3dc000  ! 649: SRA_R	sra 	%r23, %r0, %r30
T3_asi_reg_wr_35:
	mov	0x19, %r14
	.word 0xf4f38e40  ! 650: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T3_asi_reg_rd_23:
	mov	0x17, %r14
	.word 0xfedb8400  ! 651: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T3_asi_reg_wr_36:
	mov	0x34, %r14
	.word 0xf0f38e60  ! 653: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T3_asi_reg_rd_24:
	mov	0x3c6, %r14
	.word 0xf2db8e40  ! 655: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf0a44020  ! 656: STWA_R	stwa	%r24, [%r17 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf02ce125  ! 659: STB_I	stb	%r24, [%r19 + 0x0125]
	.word 0xf0a461df  ! 660: STWA_I	stwa	%r24, [%r17 + 0x01df] %asi
	.word 0xfeb48020  ! 661: STHA_R	stha	%r31, [%r18 + %r0] 0x01
cpu_intr_3_64:
	setx	0x210012, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_37:
	mov	0x6, %r14
	.word 0xfaf38e80  ! 663: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf675c000  ! 666: STX_R	stx	%r27, [%r23 + %r0]
T3_asi_reg_wr_38:
	mov	0xf, %r14
	.word 0xf2f38e80  ! 667: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983dd2  ! 668: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dd2, %hpstate
T3_asi_reg_rd_25:
	mov	0x2d, %r14
	.word 0xf0db8400  ! 669: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xfea58020  ! 670: STWA_R	stwa	%r31, [%r22 + %r0] 0x01
	.word 0xf62c4000  ! 671: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xf625601a  ! 673: STW_I	stw	%r27, [%r21 + 0x001a]
iob_intr_3_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_54), 16, 16)) -> intp(3, 0, b)
cpu_intr_3_65:
	setx	0x210203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb52c8000  ! 677: SLL_R	sll 	%r18, %r0, %r26
cpu_intr_3_66:
	setx	0x230233, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_3_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_55), 16, 16)) -> intp(3, 0, 4)
iob_intr_3_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_56), 16, 16)) -> intp(3, 0, 35)
cpu_intr_3_67:
	setx	0x220016, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_57), 16, 16)) -> intp(3, 0, e)
cpu_intr_3_68:
	setx	0x23022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a42060  ! 690: STWA_I	stwa	%r26, [%r16 + 0x0060] %asi
T3_asi_reg_wr_39:
	mov	0x2c, %r14
	.word 0xf0f38400  ! 692: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_3_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_58), 16, 16)) -> intp(3, 0, 32)
cpu_intr_3_69:
	setx	0x200311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b54020  ! 697: STHA_R	stha	%r28, [%r21 + %r0] 0x01
iob_intr_3_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_59), 16, 16)) -> intp(3, 0, 1e)
	.word 0xfcac4020  ! 700: STBA_R	stba	%r30, [%r17 + %r0] 0x01
	.word 0xb634c000  ! 701: ORN_R	orn 	%r19, %r0, %r27
	.word 0xfaac211b  ! 702: STBA_I	stba	%r29, [%r16 + 0x011b] %asi
	.word 0xb9343001  ! 703: SRLX_I	srlx	%r16, 0x0001, %r28
	.word 0xfe2c20da  ! 705: STB_I	stb	%r31, [%r16 + 0x00da]
	.word 0xf075a1ed  ! 706: STX_I	stx	%r24, [%r22 + 0x01ed]
	ta	T_CHANGE_TO_TL0
	.word 0xfaa44020  ! 709: STWA_R	stwa	%r29, [%r17 + %r0] 0x01
	.word 0xf02dc000  ! 713: STB_R	stb	%r24, [%r23 + %r0]
	.word 0xf4f521a3  ! 714: STXA_I	stxa	%r26, [%r20 + 0x01a3] %asi
T3_asi_reg_rd_26:
	mov	0xf, %r14
	.word 0xf4db84a0  ! 716: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T3_asi_reg_rd_27:
	mov	0xe, %r14
	.word 0xf8db84a0  ! 717: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf82c2007  ! 719: STB_I	stb	%r28, [%r16 + 0x0007]
T3_asi_reg_wr_40:
	mov	0x5, %r14
	.word 0xf6f389e0  ! 721: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T3_asi_reg_rd_28:
	mov	0x3c6, %r14
	.word 0xfadb8e80  ! 728: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_3_70:
	setx	0x210302, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_41:
	mov	0x3c4, %r14
	.word 0xfcf384a0  ! 736: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T3_asi_reg_wr_42:
	mov	0x2c, %r14
	.word 0xf8f38e40  ! 738: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T3_asi_reg_rd_29:
	mov	0x19, %r14
	.word 0xf4db8e60  ! 742: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xfe350000  ! 743: STH_R	sth	%r31, [%r20 + %r0]
	.word 0xb9353001  ! 744: SRLX_I	srlx	%r20, 0x0001, %r28
	.word 0xfe346105  ! 748: STH_I	sth	%r31, [%r17 + 0x0105]
	.word 0xf4a560c0  ! 749: STWA_I	stwa	%r26, [%r21 + 0x00c0] %asi
	.word 0xf4a44020  ! 751: STWA_R	stwa	%r26, [%r17 + %r0] 0x01
cpu_intr_3_71:
	setx	0x220127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ade0d8  ! 754: STBA_I	stba	%r24, [%r23 + 0x00d8] %asi
cpu_intr_3_72:
	setx	0x21002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ac0020  ! 757: STBA_R	stba	%r28, [%r16 + %r0] 0x01
	.word 0xf8f4a1c4  ! 759: STXA_I	stxa	%r28, [%r18 + 0x01c4] %asi
cpu_intr_3_73:
	setx	0x23002c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_43:
	mov	0x2c, %r14
	.word 0xfcf38e60  ! 763: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T3_asi_reg_rd_30:
	mov	0x27, %r14
	.word 0xf2db8400  ! 764: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xfea4a123  ! 766: STWA_I	stwa	%r31, [%r18 + 0x0123] %asi
	.word 0xf0248000  ! 771: STW_R	stw	%r24, [%r18 + %r0]
	.word 0xfca5e0fd  ! 773: STWA_I	stwa	%r30, [%r23 + 0x00fd] %asi
iob_intr_3_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_60), 16, 16)) -> intp(3, 0, 37)
cpu_intr_3_74:
	setx	0x23031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_44:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 780: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf67420de  ! 781: STX_I	stx	%r27, [%r16 + 0x00de]
cpu_intr_3_75:
	setx	0x230127, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_45:
	mov	0x33, %r14
	.word 0xf4f38e60  ! 784: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf0ade09b  ! 786: STBA_I	stba	%r24, [%r23 + 0x009b] %asi
	.word 0xf0b50020  ! 787: STHA_R	stha	%r24, [%r20 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
	.word 0xb17d0400  ! 789: MOVR_R	movre	%r20, %r0, %r24
	.word 0xf42c0000  ! 792: STB_R	stb	%r26, [%r16 + %r0]
	.word 0xba354000  ! 794: ORN_R	orn 	%r21, %r0, %r29
	.word 0xfc2d20fd  ! 795: STB_I	stb	%r30, [%r20 + 0x00fd]
	.word 0xf2a561f0  ! 796: STWA_I	stwa	%r25, [%r21 + 0x01f0] %asi
	.word 0xf6ac4020  ! 798: STBA_R	stba	%r27, [%r17 + %r0] 0x01
	.word 0xfc75e132  ! 801: STX_I	stx	%r30, [%r23 + 0x0132]
	.word 0xbf2dc000  ! 802: SLL_R	sll 	%r23, %r0, %r31
	.word 0xf874e116  ! 804: STX_I	stx	%r28, [%r19 + 0x0116]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_46:
	mov	0x3c5, %r14
	.word 0xf6f38e80  ! 812: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf2b5a186  ! 814: STHA_I	stha	%r25, [%r22 + 0x0186] %asi
T3_asi_reg_rd_31:
	mov	0x30, %r14
	.word 0xfadb84a0  ! 818: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xfcb5a1d7  ! 820: STHA_I	stha	%r30, [%r22 + 0x01d7] %asi
iob_intr_3_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_61), 16, 16)) -> intp(3, 0, e)
iob_intr_3_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_62), 16, 16)) -> intp(3, 0, 33)
T3_asi_reg_rd_32:
	mov	0xd, %r14
	.word 0xf8db8e40  ! 828: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb295a00e  ! 829: ORcc_I	orcc 	%r22, 0x000e, %r25
T3_asi_reg_wr_47:
	mov	0x5, %r14
	.word 0xfef38e40  ! 830: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_3_76:
	setx	0x22013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb884a05c  ! 835: ADDcc_I	addcc 	%r18, 0x005c, %r28
iob_intr_3_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_63), 16, 16)) -> intp(3, 0, 1c)
	.word 0xb134c000  ! 843: SRL_R	srl 	%r19, %r0, %r24
iob_intr_3_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_64), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_wr_48:
	mov	0x1a, %r14
	.word 0xfef389e0  ! 845: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf2a5e0fc  ! 846: STWA_I	stwa	%r25, [%r23 + 0x00fc] %asi
	.word 0xf6ad602c  ! 847: STBA_I	stba	%r27, [%r21 + 0x002c] %asi
iob_intr_3_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_65), 16, 16)) -> intp(3, 0, 17)
T3_asi_reg_wr_49:
	mov	0x20, %r14
	.word 0xf8f38e60  ! 853: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xfcad2121  ! 854: STBA_I	stba	%r30, [%r20 + 0x0121] %asi
	.word 0xfa346153  ! 856: STH_I	sth	%r29, [%r17 + 0x0153]
cpu_intr_3_77:
	setx	0x220115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6a54000  ! 858: SUBcc_R	subcc 	%r21, %r0, %r27
T3_asi_reg_rd_33:
	mov	0x26, %r14
	.word 0xf8db8400  ! 860: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_3_78:
	setx	0x21013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf274a0af  ! 866: STX_I	stx	%r25, [%r18 + 0x00af]
cpu_intr_3_79:
	setx	0x230216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb421a6  ! 872: STHA_I	stha	%r30, [%r16 + 0x01a6] %asi
	.word 0xfe358000  ! 875: STH_R	sth	%r31, [%r22 + %r0]
	.word 0xb62c0000  ! 876: ANDN_R	andn 	%r16, %r0, %r27
	.word 0xf02cc000  ! 878: STB_R	stb	%r24, [%r19 + %r0]
iob_intr_3_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_66), 16, 16)) -> intp(3, 0, 2a)
T3_asi_reg_rd_34:
	mov	0x17, %r14
	.word 0xf0db84a0  ! 883: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0x859420a8  ! 886: WRPR_TSTATE_I	wrpr	%r16, 0x00a8, %tstate
	.word 0xbf2c2001  ! 888: SLL_I	sll 	%r16, 0x0001, %r31
	.word 0xb014205b  ! 889: OR_I	or 	%r16, 0x005b, %r24
	.word 0xf4b5e1de  ! 891: STHA_I	stha	%r26, [%r23 + 0x01de] %asi
T3_asi_reg_wr_50:
	mov	0x33, %r14
	.word 0xf4f38e60  ! 893: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	ta	T_CHANGE_TO_TL0
	.word 0xf0748000  ! 895: STX_R	stx	%r24, [%r18 + %r0]
T3_asi_reg_rd_35:
	mov	0x3c7, %r14
	.word 0xf4db8e80  ! 896: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xf62c4000  ! 897: STB_R	stb	%r27, [%r17 + %r0]
	ta	T_CHANGE_TO_TL1
cpu_intr_3_80:
	setx	0x260138, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_81:
	setx	0x24002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa54020  ! 906: STWA_R	stwa	%r29, [%r21 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
	.word 0xb814e0d3  ! 909: OR_I	or 	%r19, 0x00d3, %r28
iob_intr_3_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_67), 16, 16)) -> intp(3, 0, 4)
T3_asi_reg_wr_51:
	mov	0x7, %r14
	.word 0xfcf38e40  ! 915: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_68), 16, 16)) -> intp(3, 0, 1f)
	.word 0xbf7cc400  ! 917: MOVR_R	movre	%r19, %r0, %r31
T3_asi_reg_wr_52:
	mov	0x29, %r14
	.word 0xfaf38e60  ! 919: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T3_asi_reg_rd_36:
	mov	0xe, %r14
	.word 0xf0db8e40  ! 920: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb0c54000  ! 921: ADDCcc_R	addccc 	%r21, %r0, %r24
	.word 0xf6aca1a0  ! 922: STBA_I	stba	%r27, [%r18 + 0x01a0] %asi
cpu_intr_3_82:
	setx	0x260111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf034601a  ! 925: STH_I	sth	%r24, [%r17 + 0x001a]
	.word 0xbb520000  ! 926: RDPR_PIL	rdpr	%pil, %r29
	.word 0xfaa44020  ! 929: STWA_R	stwa	%r29, [%r17 + %r0] 0x01
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983b92  ! 935: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b92, %hpstate
T3_asi_reg_wr_53:
	mov	0x24, %r14
	.word 0xfaf38e60  ! 937: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_3_83:
	setx	0x240319, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_84:
	setx	0x26003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a48020  ! 944: STWA_R	stwa	%r26, [%r18 + %r0] 0x01
iob_intr_3_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_69), 16, 16)) -> intp(3, 0, 7)
	.word 0xfa34a151  ! 946: STH_I	sth	%r29, [%r18 + 0x0151]
	.word 0xf0b5c020  ! 947: STHA_R	stha	%r24, [%r23 + %r0] 0x01
	.word 0xb42d8000  ! 949: ANDN_R	andn 	%r22, %r0, %r26
	.word 0xb73c2001  ! 956: SRA_I	sra 	%r16, 0x0001, %r27
iob_intr_3_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_70), 16, 16)) -> intp(3, 0, 17)
	ta	T_CHANGE_TO_TL0
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983812  ! 961: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1812, %hpstate
iob_intr_3_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_71), 16, 16)) -> intp(3, 0, 32)
	.word 0xf625e1fb  ! 964: STW_I	stw	%r27, [%r23 + 0x01fb]
	.word 0xf4b4e01c  ! 966: STHA_I	stha	%r26, [%r19 + 0x001c] %asi
	.word 0xfa244000  ! 967: STW_R	stw	%r29, [%r17 + %r0]
	.word 0xf62d0000  ! 969: STB_R	stb	%r27, [%r20 + %r0]
T3_asi_reg_rd_37:
	mov	0x2f, %r14
	.word 0xf6db8e60  ! 971: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb00c0000  ! 972: AND_R	and 	%r16, %r0, %r24
	.word 0xfe74a0d3  ! 974: STX_I	stx	%r31, [%r18 + 0x00d3]
	.word 0xfcb4c020  ! 975: STHA_R	stha	%r30, [%r19 + %r0] 0x01
	.word 0xfef520bc  ! 976: STXA_I	stxa	%r31, [%r20 + 0x00bc] %asi
	.word 0xfab5a0d0  ! 977: STHA_I	stha	%r29, [%r22 + 0x00d0] %asi
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_85:
	setx	0x240028, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_86:
	setx	0x250020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe242122  ! 985: STW_I	stw	%r31, [%r16 + 0x0122]
	.word 0xfab50020  ! 986: STHA_R	stha	%r29, [%r20 + %r0] 0x01
	.word 0xfc2c61f3  ! 987: STB_I	stb	%r30, [%r17 + 0x01f3]
cpu_intr_3_87:
	setx	0x27033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982b08  ! 993: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b08, %hpstate
	.word 0xf4b4606f  ! 994: STHA_I	stha	%r26, [%r17 + 0x006f] %asi
cpu_intr_3_88:
	setx	0x25021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4ac2154  ! 996: ANDNcc_I	andncc 	%r16, 0x0154, %r26
	.word 0xb2954000  ! 997: ORcc_R	orcc 	%r21, %r0, %r25
	.word 0xf0742017  ! 998: STX_I	stx	%r24, [%r16 + 0x0017]
T3_asi_reg_wr_54:
	mov	0x3c3, %r14
	.word 0xf0f38e80  ! 999: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T3_asi_reg_rd_38:
	mov	0x22, %r14
	.word 0xfedb89e0  ! 1000: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_3_89:
	setx	0x240105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcf4a151  ! 1002: STXA_I	stxa	%r30, [%r18 + 0x0151] %asi
cpu_intr_3_90:
	setx	0x24022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_39:
	mov	0x1, %r14
	.word 0xf4db84a0  ! 1005: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_3_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_72), 16, 16)) -> intp(3, 0, 26)
iob_intr_3_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_73), 16, 16)) -> intp(3, 0, 6)
	.word 0xfe750000  ! 1008: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xb0a5c000  ! 1009: SUBcc_R	subcc 	%r23, %r0, %r24
	ta	T_CHANGE_TO_TL1
cpu_intr_3_91:
	setx	0x27011c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_92:
	setx	0x260337, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_40:
	mov	0x3c5, %r14
	.word 0xf0db84a0  ! 1016: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf874a1b0  ! 1023: STX_I	stx	%r28, [%r18 + 0x01b0]
iob_intr_3_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_74), 16, 16)) -> intp(3, 0, 5)
	.word 0xbc04a125  ! 1028: ADD_I	add 	%r18, 0x0125, %r30
	.word 0xfc24a098  ! 1029: STW_I	stw	%r30, [%r18 + 0x0098]
T3_asi_reg_rd_41:
	mov	0x31, %r14
	.word 0xf2db8400  ! 1030: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf8358000  ! 1031: STH_R	sth	%r28, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xf2a520dc  ! 1038: STWA_I	stwa	%r25, [%r20 + 0x00dc] %asi
	.word 0xf625c000  ! 1041: STW_R	stw	%r27, [%r23 + %r0]
	.word 0xb82d4000  ! 1044: ANDN_R	andn 	%r21, %r0, %r28
T3_asi_reg_wr_55:
	mov	0x3c3, %r14
	.word 0xfef38400  ! 1046: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T3_asi_reg_rd_42:
	mov	0xc, %r14
	.word 0xf2db8e40  ! 1048: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_3_93:
	setx	0x270023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ac0020  ! 1051: STBA_R	stba	%r24, [%r16 + %r0] 0x01
	.word 0xbc15c000  ! 1052: OR_R	or 	%r23, %r0, %r30
cpu_intr_3_94:
	setx	0x250015, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf8ad0020  ! 1058: STBA_R	stba	%r28, [%r20 + %r0] 0x01
cpu_intr_3_95:
	setx	0x250309, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_56:
	mov	0x1e, %r14
	.word 0xfaf38e40  ! 1061: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	.word 0xb2140000  ! 1067: OR_R	or 	%r16, %r0, %r25
T3_asi_reg_rd_43:
	mov	0x27, %r14
	.word 0xf2db8e40  ! 1072: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf22520a0  ! 1074: STW_I	stw	%r25, [%r20 + 0x00a0]
iob_intr_3_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_75), 16, 16)) -> intp(3, 0, 11)
T3_asi_reg_rd_44:
	mov	0x3c4, %r14
	.word 0xf8db84a0  ! 1078: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf2ac217b  ! 1079: STBA_I	stba	%r25, [%r16 + 0x017b] %asi
T3_asi_reg_wr_57:
	mov	0x2d, %r14
	.word 0xfef384a0  ! 1080: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf4350000  ! 1085: STH_R	sth	%r26, [%r20 + %r0]
cpu_intr_3_96:
	setx	0x240123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b50020  ! 1087: STHA_R	stha	%r27, [%r20 + %r0] 0x01
iob_intr_3_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_76), 16, 16)) -> intp(3, 0, b)
	.word 0xb63da019  ! 1091: XNOR_I	xnor 	%r22, 0x0019, %r27
cpu_intr_3_97:
	setx	0x240324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ada147  ! 1095: STBA_I	stba	%r28, [%r22 + 0x0147] %asi
cpu_intr_3_98:
	setx	0x24031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab54020  ! 1100: STHA_R	stha	%r29, [%r21 + %r0] 0x01
	.word 0xf0358000  ! 1101: STH_R	sth	%r24, [%r22 + %r0]
	.word 0xfaac0020  ! 1102: STBA_R	stba	%r29, [%r16 + %r0] 0x01
	.word 0xfea4a1ce  ! 1103: STWA_I	stwa	%r31, [%r18 + 0x01ce] %asi
	.word 0x8995e19a  ! 1104: WRPR_TICK_I	wrpr	%r23, 0x019a, %tick
cpu_intr_3_99:
	setx	0x270201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca58020  ! 1110: STWA_R	stwa	%r30, [%r22 + %r0] 0x01
iob_intr_3_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_77), 16, 16)) -> intp(3, 0, 26)
	.word 0xfe2c6022  ! 1112: STB_I	stb	%r31, [%r17 + 0x0022]
	ta	T_CHANGE_HPRIV
	.word 0xb6ac4000  ! 1116: ANDNcc_R	andncc 	%r17, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbd3c4000  ! 1119: SRA_R	sra 	%r17, %r0, %r30
	.word 0xf8f420ef  ! 1121: STXA_I	stxa	%r28, [%r16 + 0x00ef] %asi
cpu_intr_3_100:
	setx	0x270024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba8c60be  ! 1124: ANDcc_I	andcc 	%r17, 0x00be, %r29
cpu_intr_3_101:
	setx	0x26000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b461d1  ! 1131: STHA_I	stha	%r28, [%r17 + 0x01d1] %asi
iob_intr_3_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_78), 16, 16)) -> intp(3, 0, 16)
cpu_intr_3_102:
	setx	0x240039, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_103:
	setx	0x26003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_104:
	setx	0x250339, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_105:
	setx	0x270134, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_79), 16, 16)) -> intp(3, 0, 11)
	.word 0xf2adc020  ! 1140: STBA_R	stba	%r25, [%r23 + %r0] 0x01
	.word 0xf624c000  ! 1142: STW_R	stw	%r27, [%r19 + %r0]
	.word 0xf0244000  ! 1144: STW_R	stw	%r24, [%r17 + %r0]
T3_asi_reg_rd_45:
	mov	0x24, %r14
	.word 0xf0db8e40  ! 1146: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_wr_58:
	mov	0xc, %r14
	.word 0xfcf38e60  ! 1148: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T3_asi_reg_wr_59:
	mov	0x3c4, %r14
	.word 0xf6f38e60  ! 1149: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf62d60a1  ! 1150: STB_I	stb	%r27, [%r21 + 0x00a1]
iob_intr_3_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_80), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_rd_46:
	mov	0xd, %r14
	.word 0xf8db8e40  ! 1155: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_106:
	setx	0x250331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf474e063  ! 1157: STX_I	stx	%r26, [%r19 + 0x0063]
	.word 0xf275c000  ! 1158: STX_R	stx	%r25, [%r23 + %r0]
	.word 0xfca54020  ! 1160: STWA_R	stwa	%r30, [%r21 + %r0] 0x01
T3_asi_reg_wr_60:
	mov	0x2a, %r14
	.word 0xf2f38e80  ! 1162: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf82de179  ! 1163: STB_I	stb	%r28, [%r23 + 0x0179]
	.word 0xf2240000  ! 1164: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xfc25a0c8  ! 1169: STW_I	stw	%r30, [%r22 + 0x00c8]
T3_asi_reg_rd_47:
	mov	0x3c0, %r14
	.word 0xf6db8400  ! 1170: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_3_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_81), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_rd_48:
	mov	0x14, %r14
	.word 0xf0db8e80  ! 1173: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_3_107:
	setx	0x250311, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_108:
	setx	0x24003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbebc20e6  ! 1178: XNORcc_I	xnorcc 	%r16, 0x00e6, %r31
iob_intr_3_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_82), 16, 16)) -> intp(3, 0, 3f)
	.word 0xfeac0020  ! 1181: STBA_R	stba	%r31, [%r16 + %r0] 0x01
T3_asi_reg_rd_49:
	mov	0x3c4, %r14
	.word 0xfadb8400  ! 1182: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_3_109:
	setx	0x25013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02c0000  ! 1184: STB_R	stb	%r24, [%r16 + %r0]
	.word 0xf8b5a1c7  ! 1188: STHA_I	stha	%r28, [%r22 + 0x01c7] %asi
	.word 0xf0adc020  ! 1191: STBA_R	stba	%r24, [%r23 + %r0] 0x01
iob_intr_3_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_83), 16, 16)) -> intp(3, 0, 29)
	.word 0xf075a0c1  ! 1196: STX_I	stx	%r24, [%r22 + 0x00c1]
	.word 0xf6344000  ! 1202: STH_R	sth	%r27, [%r17 + %r0]
cpu_intr_3_110:
	setx	0x26012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf87561d2  ! 1205: STX_I	stx	%r28, [%r21 + 0x01d2]
	.word 0xf434e00b  ! 1206: STH_I	sth	%r26, [%r19 + 0x000b]
	.word 0xf0ad6075  ! 1209: STBA_I	stba	%r24, [%r21 + 0x0075] %asi
T3_asi_reg_wr_61:
	mov	0x36, %r14
	.word 0xfaf384a0  ! 1210: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbe0dc000  ! 1212: AND_R	and 	%r23, %r0, %r31
	.word 0xb444600e  ! 1216: ADDC_I	addc 	%r17, 0x000e, %r26
T3_asi_reg_rd_50:
	mov	0x34, %r14
	.word 0xf2db8e60  ! 1217: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983c88  ! 1218: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c88, %hpstate
T3_asi_reg_wr_62:
	mov	0xb, %r14
	.word 0xfef38e60  ! 1220: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf4a50020  ! 1225: STWA_R	stwa	%r26, [%r20 + %r0] 0x01
	.word 0xf274c000  ! 1227: STX_R	stx	%r25, [%r19 + %r0]
iob_intr_3_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_84), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf63561d6  ! 1233: STH_I	sth	%r27, [%r21 + 0x01d6]
	.word 0xf02c4000  ! 1234: STB_R	stb	%r24, [%r17 + %r0]
	.word 0xb645c000  ! 1235: ADDC_R	addc 	%r23, %r0, %r27
	.word 0xfead0020  ! 1236: STBA_R	stba	%r31, [%r20 + %r0] 0x01
	.word 0xf8acc020  ! 1237: STBA_R	stba	%r28, [%r19 + %r0] 0x01
cpu_intr_3_111:
	setx	0x270219, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_112:
	setx	0x27033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0acc020  ! 1245: STBA_R	stba	%r24, [%r19 + %r0] 0x01
	.word 0xf8244000  ! 1246: STW_R	stw	%r28, [%r17 + %r0]
iob_intr_3_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_85), 16, 16)) -> intp(3, 0, 1c)
	.word 0xfa25c000  ! 1255: STW_R	stw	%r29, [%r23 + %r0]
	.word 0xfef4e1de  ! 1256: STXA_I	stxa	%r31, [%r19 + 0x01de] %asi
cpu_intr_3_113:
	setx	0x25001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe744000  ! 1265: STX_R	stx	%r31, [%r17 + %r0]
	.word 0xba35a076  ! 1266: SUBC_I	orn 	%r22, 0x0076, %r29
	.word 0xb435e1e7  ! 1267: ORN_I	orn 	%r23, 0x01e7, %r26
iob_intr_3_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_86), 16, 16)) -> intp(3, 0, 32)
	.word 0xf2f4608e  ! 1271: STXA_I	stxa	%r25, [%r17 + 0x008e] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983d5a  ! 1276: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d5a, %hpstate
	.word 0xf82cc000  ! 1277: STB_R	stb	%r28, [%r19 + %r0]
iob_intr_3_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_87), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_88), 16, 16)) -> intp(3, 0, 1)
T3_asi_reg_wr_63:
	mov	0x31, %r14
	.word 0xfaf389e0  ! 1285: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf6f461b8  ! 1287: STXA_I	stxa	%r27, [%r17 + 0x01b8] %asi
	ta	T_CHANGE_HPRIV
	.word 0xb2c5c000  ! 1291: ADDCcc_R	addccc 	%r23, %r0, %r25
	.word 0xf8b5e180  ! 1294: STHA_I	stha	%r28, [%r23 + 0x0180] %asi
T3_asi_reg_wr_64:
	mov	0xf, %r14
	.word 0xfaf38400  ! 1298: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xfcad8020  ! 1299: STBA_R	stba	%r30, [%r22 + %r0] 0x01
	.word 0xfa744000  ! 1300: STX_R	stx	%r29, [%r17 + %r0]
	.word 0xbaa54000  ! 1301: SUBcc_R	subcc 	%r21, %r0, %r29
	ta	T_CHANGE_TO_TL1
	.word 0xf4a5a157  ! 1306: STWA_I	stwa	%r26, [%r22 + 0x0157] %asi
iob_intr_3_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_89), 16, 16)) -> intp(3, 0, 23)
	.word 0xf2f56063  ! 1312: STXA_I	stxa	%r25, [%r21 + 0x0063] %asi
iob_intr_3_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_90), 16, 16)) -> intp(3, 0, 1b)
	.word 0xfa744000  ! 1315: STX_R	stx	%r29, [%r17 + %r0]
	.word 0xfca4c020  ! 1322: STWA_R	stwa	%r30, [%r19 + %r0] 0x01
	.word 0xf4748000  ! 1323: STX_R	stx	%r26, [%r18 + %r0]
cpu_intr_3_114:
	setx	0x25010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea58020  ! 1329: STWA_R	stwa	%r31, [%r22 + %r0] 0x01
iob_intr_3_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_91), 16, 16)) -> intp(3, 0, 13)
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982cc0  ! 1332: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc0, %hpstate
	.word 0xf62cc000  ! 1335: STB_R	stb	%r27, [%r19 + %r0]
	.word 0xfaa4a1eb  ! 1336: STWA_I	stwa	%r29, [%r18 + 0x01eb] %asi
	.word 0xfa740000  ! 1338: STX_R	stx	%r29, [%r16 + %r0]
cpu_intr_3_115:
	setx	0x250021, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_65:
	mov	0x2d, %r14
	.word 0xf6f38e60  ! 1342: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_3_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_92), 16, 16)) -> intp(3, 0, 24)
	.word 0xbf7c0400  ! 1346: MOVR_R	movre	%r16, %r0, %r31
cpu_intr_3_116:
	setx	0x25011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2c0000  ! 1352: STB_R	stb	%r30, [%r16 + %r0]
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982f02  ! 1354: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f02, %hpstate
T3_asi_reg_wr_66:
	mov	0x33, %r14
	.word 0xfef384a0  ! 1355: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982eda  ! 1357: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0eda, %hpstate
	.word 0xb57d8400  ! 1358: MOVR_R	movre	%r22, %r0, %r26
iob_intr_3_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_93), 16, 16)) -> intp(3, 0, 25)
cpu_intr_3_117:
	setx	0x27010f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_94), 16, 16)) -> intp(3, 0, 14)
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_67:
	mov	0x3c4, %r14
	.word 0xfcf389e0  ! 1365: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T3_asi_reg_rd_51:
	mov	0x38, %r14
	.word 0xfadb8e60  ! 1366: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T3_asi_reg_wr_68:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 1369: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfa2c4000  ! 1373: STB_R	stb	%r29, [%r17 + %r0]
T3_asi_reg_rd_52:
	mov	0x6, %r14
	.word 0xf0db8e80  ! 1375: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_3_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_95), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_rd_53:
	mov	0x1f, %r14
	.word 0xfcdb8400  ! 1378: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf634a032  ! 1379: STH_I	sth	%r27, [%r18 + 0x0032]
T3_asi_reg_wr_69:
	mov	0x0, %r14
	.word 0xf2f389e0  ! 1381: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xfaac4020  ! 1382: STBA_R	stba	%r29, [%r17 + %r0] 0x01
	.word 0xf425c000  ! 1384: STW_R	stw	%r26, [%r23 + %r0]
	.word 0xb4c5a081  ! 1385: ADDCcc_I	addccc 	%r22, 0x0081, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_wr_70:
	mov	0x1b, %r14
	.word 0xf4f38400  ! 1389: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T3_asi_reg_rd_54:
	mov	0x1e, %r14
	.word 0xf4db89e0  ! 1390: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_3_118:
	setx	0x2b010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42c8000  ! 1394: STB_R	stb	%r26, [%r18 + %r0]
	.word 0xfca46008  ! 1395: STWA_I	stwa	%r30, [%r17 + 0x0008] %asi
cpu_intr_3_119:
	setx	0x290132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8348000  ! 1397: STH_R	sth	%r28, [%r18 + %r0]
T3_asi_reg_rd_55:
	mov	0x3c5, %r14
	.word 0xf2db8e80  ! 1398: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xfa2cc000  ! 1402: STB_R	stb	%r29, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0xf6b44020  ! 1405: STHA_R	stha	%r27, [%r17 + %r0] 0x01
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_56:
	mov	0x3c0, %r14
	.word 0xf2db8e80  ! 1410: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T3_asi_reg_rd_57:
	mov	0x0, %r14
	.word 0xf8db8e60  ! 1413: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	ta	T_CHANGE_HPRIV
	.word 0xf0340000  ! 1415: STH_R	sth	%r24, [%r16 + %r0]
	.word 0xf22d0000  ! 1416: STB_R	stb	%r25, [%r20 + %r0]
iob_intr_3_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_96), 16, 16)) -> intp(3, 0, 13)
	.word 0xba35e0af  ! 1423: SUBC_I	orn 	%r23, 0x00af, %r29
cpu_intr_3_120:
	setx	0x28013a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_97), 16, 16)) -> intp(3, 0, 3d)
	ta	T_CHANGE_TO_TL0
cpu_intr_3_121:
	setx	0x290201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_98), 16, 16)) -> intp(3, 0, 1)
	.word 0xf2b46144  ! 1438: STHA_I	stha	%r25, [%r17 + 0x0144] %asi
cpu_intr_3_122:
	setx	0x2b0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf2b4c020  ! 1441: STHA_R	stha	%r25, [%r19 + %r0] 0x01
iob_intr_3_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_99), 16, 16)) -> intp(3, 0, 10)
	.word 0xfcf42116  ! 1443: STXA_I	stxa	%r30, [%r16 + 0x0116] %asi
T3_asi_reg_rd_58:
	mov	0x0, %r14
	.word 0xf0db8400  ! 1444: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb12d7001  ! 1447: SLLX_I	sllx	%r21, 0x0001, %r24
iob_intr_3_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_100), 16, 16)) -> intp(3, 0, c)
	.word 0xfe242023  ! 1449: STW_I	stw	%r31, [%r16 + 0x0023]
	.word 0xbe24a1c9  ! 1450: SUB_I	sub 	%r18, 0x01c9, %r31
	.word 0xb4ad20e8  ! 1454: ANDNcc_I	andncc 	%r20, 0x00e8, %r26
T3_asi_reg_rd_59:
	mov	0x2e, %r14
	.word 0xfcdb8e60  ! 1456: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_60:
	mov	0x36, %r14
	.word 0xf8db89e0  ! 1460: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_3_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_101), 16, 16)) -> intp(3, 0, 29)
cpu_intr_3_123:
	setx	0x2a022b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_102), 16, 16)) -> intp(3, 0, 14)
cpu_intr_3_124:
	setx	0x29010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0154000  ! 1469: OR_R	or 	%r21, %r0, %r24
T3_asi_reg_wr_71:
	mov	0x3, %r14
	.word 0xf6f38e40  ! 1470: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_rd_61:
	mov	0x1, %r14
	.word 0xf2db8e40  ! 1475: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf42ce186  ! 1477: STB_I	stb	%r26, [%r19 + 0x0186]
	.word 0xf82da0c1  ! 1479: STB_I	stb	%r28, [%r22 + 0x00c1]
T3_asi_reg_rd_62:
	mov	0x27, %r14
	.word 0xf0db8e80  ! 1480: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_3_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_103), 16, 16)) -> intp(3, 0, 23)
cpu_intr_3_125:
	setx	0x2b003f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_126:
	setx	0x290037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf234a07a  ! 1488: STH_I	sth	%r25, [%r18 + 0x007a]
cpu_intr_3_127:
	setx	0x29032d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_128:
	setx	0x2a0323, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_63:
	mov	0x5, %r14
	.word 0xfadb8e80  ! 1493: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_72:
	mov	0x20, %r14
	.word 0xfef38e40  ! 1497: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfc35a05f  ! 1499: STH_I	sth	%r30, [%r22 + 0x005f]
	.word 0xf6ac0020  ! 1503: STBA_R	stba	%r27, [%r16 + %r0] 0x01
	.word 0xfca421d2  ! 1508: STWA_I	stwa	%r30, [%r16 + 0x01d2] %asi
	.word 0xb13c8000  ! 1513: SRA_R	sra 	%r18, %r0, %r24
	.word 0xb4bde102  ! 1517: XNORcc_I	xnorcc 	%r23, 0x0102, %r26
iob_intr_3_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_104), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_wr_73:
	mov	0x2, %r14
	.word 0xf0f384a0  ! 1520: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_3_129:
	setx	0x290310, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_130:
	setx	0x280029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc2da103  ! 1529: ANDN_I	andn 	%r22, 0x0103, %r30
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xf43460df  ! 1537: STH_I	sth	%r26, [%r17 + 0x00df]
cpu_intr_3_131:
	setx	0x2a033f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_132:
	setx	0x29013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b5c000  ! 1542: ORNcc_R	orncc 	%r23, %r0, %r28
cpu_intr_3_133:
	setx	0x290330, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_74:
	mov	0x7, %r14
	.word 0xf0f389e0  ! 1553: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T3_asi_reg_rd_64:
	mov	0x3c1, %r14
	.word 0xf4db8e80  ! 1557: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xf02d20cd  ! 1561: STB_I	stb	%r24, [%r20 + 0x00cd]
iob_intr_3_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_105), 16, 16)) -> intp(3, 0, 3b)
	ta	T_CHANGE_HPRIV
	.word 0xf8a5c020  ! 1566: STWA_R	stwa	%r28, [%r23 + %r0] 0x01
	.word 0xf02d0000  ! 1567: STB_R	stb	%r24, [%r20 + %r0]
iob_intr_3_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_106), 16, 16)) -> intp(3, 0, 30)
	.word 0xf435a13c  ! 1572: STH_I	sth	%r26, [%r22 + 0x013c]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_107), 16, 16)) -> intp(3, 0, 18)
	.word 0xfcb40020  ! 1578: STHA_R	stha	%r30, [%r16 + %r0] 0x01
	.word 0xf62da0f9  ! 1584: STB_I	stb	%r27, [%r22 + 0x00f9]
T3_asi_reg_rd_65:
	mov	0xb, %r14
	.word 0xfedb8e60  ! 1585: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf225a0db  ! 1586: STW_I	stw	%r25, [%r22 + 0x00db]
cpu_intr_3_134:
	setx	0x2a032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf075c000  ! 1590: STX_R	stx	%r24, [%r23 + %r0]
	.word 0xbf3da001  ! 1591: SRA_I	sra 	%r22, 0x0001, %r31
cpu_intr_3_135:
	setx	0x29010c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_75:
	mov	0x35, %r14
	.word 0xfcf38e40  ! 1598: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfe24a073  ! 1599: STW_I	stw	%r31, [%r18 + 0x0073]
cpu_intr_3_136:
	setx	0x2b011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ac4020  ! 1601: STBA_R	stba	%r25, [%r17 + %r0] 0x01
iob_intr_3_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_108), 16, 16)) -> intp(3, 0, 31)
	.word 0xbb7d8400  ! 1605: MOVR_R	movre	%r22, %r0, %r29
	.word 0xb93c4000  ! 1606: SRA_R	sra 	%r17, %r0, %r28
	.word 0xf6ac6188  ! 1610: STBA_I	stba	%r27, [%r17 + 0x0188] %asi
T3_asi_reg_rd_66:
	mov	0x32, %r14
	.word 0xf0db89e0  ! 1611: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_3_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_109), 16, 16)) -> intp(3, 0, 2a)
cpu_intr_3_137:
	setx	0x2a0302, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_67:
	mov	0xa, %r14
	.word 0xf2db8e40  ! 1615: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf0258000  ! 1616: STW_R	stw	%r24, [%r22 + %r0]
iob_intr_3_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_110), 16, 16)) -> intp(3, 0, 21)
T3_asi_reg_rd_68:
	mov	0x2, %r14
	.word 0xf8db8e40  ! 1620: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_111), 16, 16)) -> intp(3, 0, 1e)
	.word 0xfa25211d  ! 1624: STW_I	stw	%r29, [%r20 + 0x011d]
	.word 0xf0b5e045  ! 1626: STHA_I	stha	%r24, [%r23 + 0x0045] %asi
T3_asi_reg_wr_76:
	mov	0x3c0, %r14
	.word 0xfef384a0  ! 1627: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xfa25e197  ! 1629: STW_I	stw	%r29, [%r23 + 0x0197]
cpu_intr_3_138:
	setx	0x10121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b46025  ! 1632: STHA_I	stha	%r28, [%r17 + 0x0025] %asi
	.word 0xf675e164  ! 1633: STX_I	stx	%r27, [%r23 + 0x0164]
	.word 0xf0b4e1c5  ! 1634: STHA_I	stha	%r24, [%r19 + 0x01c5] %asi
	.word 0xf0246167  ! 1637: STW_I	stw	%r24, [%r17 + 0x0167]
cpu_intr_3_139:
	setx	0x2b0017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa746011  ! 1642: STX_I	stx	%r29, [%r17 + 0x0011]
iob_intr_3_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_112), 16, 16)) -> intp(3, 0, 24)
	.word 0xfca48020  ! 1647: STWA_R	stwa	%r30, [%r18 + %r0] 0x01
T3_asi_reg_rd_69:
	mov	0x8, %r14
	.word 0xf8db8e40  ! 1649: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf275610c  ! 1651: STX_I	stx	%r25, [%r21 + 0x010c]
	.word 0xf2b40020  ! 1654: STHA_R	stha	%r25, [%r16 + %r0] 0x01
cpu_intr_3_140:
	setx	0x2a0203, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_113), 16, 16)) -> intp(3, 0, 7)
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_70:
	mov	0x32, %r14
	.word 0xf4db8e40  ! 1663: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_77:
	mov	0x3c5, %r14
	.word 0xfaf38400  ! 1668: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf0ada033  ! 1671: STBA_I	stba	%r24, [%r22 + 0x0033] %asi
	.word 0xf234a105  ! 1674: STH_I	sth	%r25, [%r18 + 0x0105]
	.word 0xf0350000  ! 1677: STH_R	sth	%r24, [%r20 + %r0]
	.word 0xf8ad20db  ! 1678: STBA_I	stba	%r28, [%r20 + 0x00db] %asi
cpu_intr_3_141:
	setx	0x2a0134, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_114), 16, 16)) -> intp(3, 0, 39)
cpu_intr_3_142:
	setx	0x2a0309, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_78:
	mov	0xa, %r14
	.word 0xf6f38400  ! 1684: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL0
	.word 0xb6248000  ! 1691: SUB_R	sub 	%r18, %r0, %r27
	.word 0xf0350000  ! 1692: STH_R	sth	%r24, [%r20 + %r0]
iob_intr_3_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_115), 16, 16)) -> intp(3, 0, 1e)
cpu_intr_3_143:
	setx	0x2b030c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_116), 16, 16)) -> intp(3, 0, 14)
iob_intr_3_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_117), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf675a1f0  ! 1703: STX_I	stx	%r27, [%r22 + 0x01f0]
	.word 0xfa244000  ! 1704: STW_R	stw	%r29, [%r17 + %r0]
cpu_intr_3_144:
	setx	0x280214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeac8020  ! 1706: STBA_R	stba	%r31, [%r18 + %r0] 0x01
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982f58  ! 1710: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f58, %hpstate
cpu_intr_3_145:
	setx	0x2b012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1357001  ! 1712: SRLX_I	srlx	%r21, 0x0001, %r24
	ta	T_CHANGE_TO_TL1
	.word 0xf034a1f5  ! 1718: STH_I	sth	%r24, [%r18 + 0x01f5]
	.word 0xfc25c000  ! 1721: STW_R	stw	%r30, [%r23 + %r0]
	.word 0xbf7d8400  ! 1722: MOVR_R	movre	%r22, %r0, %r31
cpu_intr_3_146:
	setx	0x290224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa25a1ce  ! 1730: STW_I	stw	%r29, [%r22 + 0x01ce]
iob_intr_3_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_118), 16, 16)) -> intp(3, 0, 24)
iob_intr_3_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_119), 16, 16)) -> intp(3, 0, 31)
	.word 0xb41c0000  ! 1735: XOR_R	xor 	%r16, %r0, %r26
	.word 0xfaad4020  ! 1736: STBA_R	stba	%r29, [%r21 + %r0] 0x01
	.word 0xfe744000  ! 1737: STX_R	stx	%r31, [%r17 + %r0]
	.word 0x8f902001  ! 1738: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
cpu_intr_3_147:
	setx	0x280238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc9c2039  ! 1742: XORcc_I	xorcc 	%r16, 0x0039, %r30
	ta	T_CHANGE_HPRIV
	.word 0xf43420e9  ! 1748: STH_I	sth	%r26, [%r16 + 0x00e9]
T3_asi_reg_wr_79:
	mov	0x22, %r14
	.word 0xf8f389e0  ! 1750: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_3_148:
	setx	0x29002f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_120), 16, 16)) -> intp(3, 0, 30)
	.word 0xf8a50020  ! 1757: STWA_R	stwa	%r28, [%r20 + %r0] 0x01
cpu_intr_3_149:
	setx	0x2b0234, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_121), 16, 16)) -> intp(3, 0, 15)
	.word 0xfe35c000  ! 1761: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xf6a5e1b9  ! 1763: STWA_I	stwa	%r27, [%r23 + 0x01b9] %asi
	.word 0xfe246058  ! 1765: STW_I	stw	%r31, [%r17 + 0x0058]
	.word 0xfcf5216b  ! 1766: STXA_I	stxa	%r30, [%r20 + 0x016b] %asi
	.word 0xb350c000  ! 1767: RDPR_TT	rdpr	%tt, %r25
iob_intr_3_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_122), 16, 16)) -> intp(3, 0, 1)
iob_intr_3_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_123), 16, 16)) -> intp(3, 0, 3f)
iob_intr_3_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_124), 16, 16)) -> intp(3, 0, 1c)
	.word 0xf6ac4020  ! 1773: STBA_R	stba	%r27, [%r17 + %r0] 0x01
	.word 0xbb510000  ! 1774: RDPR_TICK	<illegal instruction>
	.word 0xf0ac0020  ! 1775: STBA_R	stba	%r24, [%r16 + %r0] 0x01
	.word 0xfca48020  ! 1776: STWA_R	stwa	%r30, [%r18 + %r0] 0x01
iob_intr_3_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_125), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_150:
	setx	0x29032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2d20ef  ! 1781: STB_I	stb	%r29, [%r20 + 0x00ef]
	.word 0xf4b44020  ! 1788: STHA_R	stha	%r26, [%r17 + %r0] 0x01
cpu_intr_3_151:
	setx	0x2b003b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_152:
	setx	0x290139, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_126), 16, 16)) -> intp(3, 0, 1c)
iob_intr_3_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_127), 16, 16)) -> intp(3, 0, 3a)
	.word 0xfaaca12f  ! 1798: STBA_I	stba	%r29, [%r18 + 0x012f] %asi
	.word 0xf6b4e022  ! 1801: STHA_I	stha	%r27, [%r19 + 0x0022] %asi
iob_intr_3_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_128), 16, 16)) -> intp(3, 0, 0)
T3_asi_reg_wr_80:
	mov	0x4, %r14
	.word 0xf6f38e40  ! 1804: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf42d2112  ! 1805: STB_I	stb	%r26, [%r20 + 0x0112]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_71:
	mov	0x3c3, %r14
	.word 0xfcdb8e40  ! 1808: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfa34a027  ! 1812: STH_I	sth	%r29, [%r18 + 0x0027]
	.word 0xfa350000  ! 1813: STH_R	sth	%r29, [%r20 + %r0]
	.word 0xf62c61b9  ! 1815: STB_I	stb	%r27, [%r17 + 0x01b9]
	.word 0xf0ac60f8  ! 1820: STBA_I	stba	%r24, [%r17 + 0x00f8] %asi
	.word 0xfc248000  ! 1823: STW_R	stw	%r30, [%r18 + %r0]
	.word 0xf835c000  ! 1824: STH_R	sth	%r28, [%r23 + %r0]
cpu_intr_3_153:
	setx	0x2b003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb845e1cf  ! 1828: ADDC_I	addc 	%r23, 0x01cf, %r28
	.word 0xf635c000  ! 1832: STH_R	sth	%r27, [%r23 + %r0]
	.word 0xf4348000  ! 1833: STH_R	sth	%r26, [%r18 + %r0]
T3_asi_reg_rd_72:
	mov	0x10, %r14
	.word 0xf0db8e40  ! 1834: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0x8f902001  ! 1835: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
T3_asi_reg_wr_81:
	mov	0x22, %r14
	.word 0xf2f38e40  ! 1836: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_rd_73:
	mov	0x3c1, %r14
	.word 0xf4db89e0  ! 1837: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_3_154:
	setx	0x2c0321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a40020  ! 1839: STWA_R	stwa	%r24, [%r16 + %r0] 0x01
cpu_intr_3_155:
	setx	0x2f022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x87956073  ! 1842: WRPR_TT_I	wrpr	%r21, 0x0073, %tt
	.word 0xb635c000  ! 1851: SUBC_R	orn 	%r23, %r0, %r27
cpu_intr_3_156:
	setx	0x2f011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf675c000  ! 1853: STX_R	stx	%r27, [%r23 + %r0]
iob_intr_3_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_129), 16, 16)) -> intp(3, 0, 33)
T3_asi_reg_rd_74:
	mov	0x3c1, %r14
	.word 0xf6db8e80  ! 1856: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xfa2d0000  ! 1860: STB_R	stb	%r29, [%r20 + %r0]
T3_asi_reg_wr_82:
	mov	0x23, %r14
	.word 0xf6f38400  ! 1862: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_3_157:
	setx	0x2d0027, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_75:
	mov	0x33, %r14
	.word 0xf4db8e60  ! 1867: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb01d0000  ! 1871: XOR_R	xor 	%r20, %r0, %r24
	.word 0xfc358000  ! 1872: STH_R	sth	%r30, [%r22 + %r0]
T3_asi_reg_wr_83:
	mov	0x38, %r14
	.word 0xf2f38e60  ! 1874: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xbe44a09f  ! 1877: ADDC_I	addc 	%r18, 0x009f, %r31
T3_asi_reg_rd_76:
	mov	0x0, %r14
	.word 0xfadb89e0  ! 1878: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb0850000  ! 1880: ADDcc_R	addcc 	%r20, %r0, %r24
	.word 0xf0ac0020  ! 1885: STBA_R	stba	%r24, [%r16 + %r0] 0x01
iob_intr_3_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_130), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf2b4c020  ! 1891: STHA_R	stha	%r25, [%r19 + %r0] 0x01
	.word 0xb6c46007  ! 1896: ADDCcc_I	addccc 	%r17, 0x0007, %r27
iob_intr_3_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_131), 16, 16)) -> intp(3, 0, 12)
iob_intr_3_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_132), 16, 16)) -> intp(3, 0, 17)
	.word 0xb8144000  ! 1902: OR_R	or 	%r17, %r0, %r28
cpu_intr_3_158:
	setx	0x2c0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982b08  ! 1910: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b08, %hpstate
iob_intr_3_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_133), 16, 16)) -> intp(3, 0, 31)
T3_asi_reg_wr_84:
	mov	0x2a, %r14
	.word 0xfaf38e60  ! 1917: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf2348000  ! 1922: STH_R	sth	%r25, [%r18 + %r0]
cpu_intr_3_159:
	setx	0x2d0130, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_85:
	mov	0x10, %r14
	.word 0xfaf38e80  ! 1929: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_3_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_134), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_rd_77:
	mov	0x36, %r14
	.word 0xfadb8e40  ! 1933: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_wr_86:
	mov	0x5, %r14
	.word 0xf8f38e40  ! 1934: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_3_160:
	setx	0x2f0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xbf7d0400  ! 1939: MOVR_R	movre	%r20, %r0, %r31
	.word 0xfab561cb  ! 1940: STHA_I	stha	%r29, [%r21 + 0x01cb] %asi
T3_asi_reg_rd_78:
	mov	0x8, %r14
	.word 0xf2db84a0  ! 1941: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf42d4000  ! 1946: STB_R	stb	%r26, [%r21 + %r0]
T3_asi_reg_rd_79:
	mov	0x3c7, %r14
	.word 0xfadb8e40  ! 1947: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf0b40020  ! 1948: STHA_R	stha	%r24, [%r16 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_80:
	mov	0xb, %r14
	.word 0xf0db8400  ! 1950: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xfc25c000  ! 1952: STW_R	stw	%r30, [%r23 + %r0]
iob_intr_3_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_135), 16, 16)) -> intp(3, 0, 2f)
iob_intr_3_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_136), 16, 16)) -> intp(3, 0, 3a)
	.word 0xfca50020  ! 1958: STWA_R	stwa	%r30, [%r20 + %r0] 0x01
cpu_intr_3_161:
	setx	0x2f0219, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_137), 16, 16)) -> intp(3, 0, 27)
	.word 0xbd540000  ! 1961: RDPR_GL	rdpr	%-, %r30
	.word 0xf2b5a1be  ! 1962: STHA_I	stha	%r25, [%r22 + 0x01be] %asi
	.word 0xba9dc000  ! 1963: XORcc_R	xorcc 	%r23, %r0, %r29
iob_intr_3_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_138), 16, 16)) -> intp(3, 0, 1c)
iob_intr_3_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_139), 16, 16)) -> intp(3, 0, 19)
iob_intr_3_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_140), 16, 16)) -> intp(3, 0, 16)
iob_intr_3_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_141), 16, 16)) -> intp(3, 0, f)
T3_asi_reg_rd_81:
	mov	0x1d, %r14
	.word 0xf8db8e40  ! 1969: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T3_asi_reg_wr_87:
	mov	0x2d, %r14
	.word 0xfcf38e40  ! 1970: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf224c000  ! 1971: STW_R	stw	%r25, [%r19 + %r0]
iob_intr_3_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_142), 16, 16)) -> intp(3, 0, 15)
cpu_intr_3_162:
	setx	0x2d0327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf825210b  ! 1978: STW_I	stw	%r28, [%r20 + 0x010b]
	.word 0xba948000  ! 1981: ORcc_R	orcc 	%r18, %r0, %r29
iob_intr_3_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_143), 16, 16)) -> intp(3, 0, 18)
iob_intr_3_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_144), 16, 16)) -> intp(3, 0, e)
	.word 0xfe350000  ! 1985: STH_R	sth	%r31, [%r20 + %r0]
iob_intr_3_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_145), 16, 16)) -> intp(3, 0, 18)
	.word 0xf2250000  ! 1988: STW_R	stw	%r25, [%r20 + %r0]
iob_intr_3_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_146), 16, 16)) -> intp(3, 0, 7)
	.word 0xf8ad0020  ! 1991: STBA_R	stba	%r28, [%r20 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
	.word 0xf8a5a1e2  ! 1993: STWA_I	stwa	%r28, [%r22 + 0x01e2] %asi
	.word 0xfa354000  ! 1997: STH_R	sth	%r29, [%r21 + %r0]
iob_intr_3_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_147), 16, 16)) -> intp(3, 0, 2a)
	.word 0xb4c5e1e6  ! 2002: ADDCcc_I	addccc 	%r23, 0x01e6, %r26
	.word 0xf674e0c6  ! 2004: STX_I	stx	%r27, [%r19 + 0x00c6]
T3_asi_reg_wr_88:
	mov	0x3c8, %r14
	.word 0xfef38e80  ! 2008: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T3_asi_reg_wr_89:
	mov	0x25, %r14
	.word 0xfaf384a0  ! 2010: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T3_asi_reg_wr_90:
	mov	0x38, %r14
	.word 0xfaf38e60  ! 2011: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	ta	T_CHANGE_NONHPRIV
	.word 0xf6a56167  ! 2013: STWA_I	stwa	%r27, [%r21 + 0x0167] %asi
cpu_intr_3_163:
	setx	0x2f0217, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_82:
	mov	0x2b, %r14
	.word 0xf2db8e40  ! 2017: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfa74e098  ! 2018: STX_I	stx	%r29, [%r19 + 0x0098]
	.word 0xb77c2401  ! 2021: MOVR_I	movre	%r16, 0x1, %r27
cpu_intr_3_164:
	setx	0x2c0004, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xb6bc8000  ! 2025: XNORcc_R	xnorcc 	%r18, %r0, %r27
cpu_intr_3_165:
	setx	0x2d0119, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_91:
	mov	0x3c4, %r14
	.word 0xfaf38e60  ! 2027: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T3_asi_reg_wr_92:
	mov	0x3c3, %r14
	.word 0xfcf384a0  ! 2028: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T3_asi_reg_rd_83:
	mov	0x1, %r14
	.word 0xfedb8e40  ! 2029: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfa352055  ! 2030: STH_I	sth	%r29, [%r20 + 0x0055]
iob_intr_3_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_148), 16, 16)) -> intp(3, 0, f)
	.word 0xf8b5205a  ! 2035: STHA_I	stha	%r28, [%r20 + 0x005a] %asi
T3_asi_reg_rd_84:
	mov	0x3c1, %r14
	.word 0xf6db8e80  ! 2036: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf2ada045  ! 2037: STBA_I	stba	%r25, [%r22 + 0x0045] %asi
cpu_intr_3_166:
	setx	0x2c0227, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_85:
	mov	0x3c1, %r14
	.word 0xfcdb8400  ! 2043: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T3_asi_reg_rd_86:
	mov	0xc, %r14
	.word 0xfedb8e60  ! 2045: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_3_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_149), 16, 16)) -> intp(3, 0, 3d)
T3_asi_reg_rd_87:
	mov	0x3c0, %r14
	.word 0xf4db8400  ! 2049: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf034a130  ! 2050: STH_I	sth	%r24, [%r18 + 0x0130]
T3_asi_reg_rd_88:
	mov	0x5, %r14
	.word 0xf4db8e60  ! 2051: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_3_167:
	setx	0x2f032d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_150), 16, 16)) -> intp(3, 0, 36)
	.word 0xfe254000  ! 2056: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xf4342157  ! 2062: STH_I	sth	%r26, [%r16 + 0x0157]
	.word 0xb6358000  ! 2064: SUBC_R	orn 	%r22, %r0, %r27
	.word 0xf8b42025  ! 2065: STHA_I	stha	%r28, [%r16 + 0x0025] %asi
cpu_intr_3_168:
	setx	0x2c0215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa3521c5  ! 2072: STH_I	sth	%r29, [%r20 + 0x01c5]
	.word 0xfcf52195  ! 2075: STXA_I	stxa	%r30, [%r20 + 0x0195] %asi
cpu_intr_3_169:
	setx	0x2d0001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb60460d3  ! 2078: ADD_I	add 	%r17, 0x00d3, %r27
	.word 0xf0a4c020  ! 2079: STWA_R	stwa	%r24, [%r19 + %r0] 0x01
	.word 0xf424a00e  ! 2080: STW_I	stw	%r26, [%r18 + 0x000e]
T3_asi_reg_rd_89:
	mov	0x14, %r14
	.word 0xf2db84a0  ! 2082: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_3_170:
	setx	0x2c010d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_171:
	setx	0x2c0005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ad4020  ! 2089: STBA_R	stba	%r24, [%r21 + %r0] 0x01
cpu_intr_3_172:
	setx	0x2f0038, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_90:
	mov	0x6, %r14
	.word 0xf2db8e40  ! 2091: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T3_asi_reg_rd_91:
	mov	0x2c, %r14
	.word 0xf0db84a0  ! 2092: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf2346135  ! 2093: STH_I	sth	%r25, [%r17 + 0x0135]
	.word 0xf02d2089  ! 2094: STB_I	stb	%r24, [%r20 + 0x0089]
	.word 0xfc74c000  ! 2096: STX_R	stx	%r30, [%r19 + %r0]
	.word 0xb951c000  ! 2097: RDPR_TL	rdpr	%tl, %r28
	.word 0xf075203c  ! 2098: STX_I	stx	%r24, [%r20 + 0x003c]
	.word 0xf0248000  ! 2099: STW_R	stw	%r24, [%r18 + %r0]
	.word 0xfea5e12e  ! 2100: STWA_I	stwa	%r31, [%r23 + 0x012e] %asi
	.word 0xf8aca1fe  ! 2103: STBA_I	stba	%r28, [%r18 + 0x01fe] %asi
	.word 0xfe240000  ! 2106: STW_R	stw	%r31, [%r16 + %r0]
	.word 0xb68c61b3  ! 2107: ANDcc_I	andcc 	%r17, 0x01b3, %r27
	.word 0xf8a40020  ! 2111: STWA_R	stwa	%r28, [%r16 + %r0] 0x01
iob_intr_3_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_151), 16, 16)) -> intp(3, 0, 25)
iob_intr_3_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_152), 16, 16)) -> intp(3, 0, a)
T3_asi_reg_rd_92:
	mov	0x12, %r14
	.word 0xfedb8e40  ! 2116: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_173:
	setx	0x2f002c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_93:
	mov	0x17, %r14
	.word 0xf0f38e40  ! 2118: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_153), 16, 16)) -> intp(3, 0, 21)
cpu_intr_3_174:
	setx	0x2f0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc35c000  ! 2124: STH_R	sth	%r30, [%r23 + %r0]
iob_intr_3_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_154), 16, 16)) -> intp(3, 0, 33)
iob_intr_3_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_155), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_rd_93:
	mov	0x3c5, %r14
	.word 0xf2db8e40  ! 2130: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfeb560aa  ! 2131: STHA_I	stha	%r31, [%r21 + 0x00aa] %asi
	.word 0xf875e132  ! 2133: STX_I	stx	%r28, [%r23 + 0x0132]
	.word 0xf0ad8020  ! 2134: STBA_R	stba	%r24, [%r22 + %r0] 0x01
iob_intr_3_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_156), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_175:
	setx	0x2f0308, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_176:
	setx	0x2e0206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb92d2001  ! 2149: SLL_I	sll 	%r20, 0x0001, %r28
cpu_intr_3_177:
	setx	0x2c0035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb134c000  ! 2155: SRL_R	srl 	%r19, %r0, %r24
	.word 0xfcac8020  ! 2156: STBA_R	stba	%r30, [%r18 + %r0] 0x01
iob_intr_3_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_157), 16, 16)) -> intp(3, 0, 2e)
	.word 0xbf7c6401  ! 2164: MOVR_I	movre	%r17, 0x1, %r31
	.word 0xfca50020  ! 2165: STWA_R	stwa	%r30, [%r20 + %r0] 0x01
	.word 0xf6258000  ! 2166: STW_R	stw	%r27, [%r22 + %r0]
	.word 0xfaf4e096  ! 2168: STXA_I	stxa	%r29, [%r19 + 0x0096] %asi
	.word 0xf43561fa  ! 2171: STH_I	sth	%r26, [%r21 + 0x01fa]
iob_intr_3_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_158), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf0ad0020  ! 2175: STBA_R	stba	%r24, [%r20 + %r0] 0x01
	.word 0xf225a0da  ! 2176: STW_I	stw	%r25, [%r22 + 0x00da]
	.word 0xbb358000  ! 2178: SRL_R	srl 	%r22, %r0, %r29
cpu_intr_3_178:
	setx	0x2d0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8f5a16f  ! 2180: STXA_I	stxa	%r28, [%r22 + 0x016f] %asi
	.word 0xf4354000  ! 2181: STH_R	sth	%r26, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0xf6752053  ! 2183: STX_I	stx	%r27, [%r20 + 0x0053]
	.word 0xf4a52057  ! 2185: STWA_I	stwa	%r26, [%r20 + 0x0057] %asi
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_179:
	setx	0x2e0322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf275e177  ! 2195: STX_I	stx	%r25, [%r23 + 0x0177]
	ta	T_CHANGE_TO_TL1
iob_intr_3_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_159), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf2252011  ! 2199: STW_I	stw	%r25, [%r20 + 0x0011]
cpu_intr_3_180:
	setx	0x2d0337, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_181:
	setx	0x2d013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_94:
	mov	0x35, %r14
	.word 0xf2db8e60  ! 2209: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbf344000  ! 2210: SRL_R	srl 	%r17, %r0, %r31
T3_asi_reg_wr_94:
	mov	0x9, %r14
	.word 0xfcf389e0  ! 2212: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_3_182:
	setx	0x2d0119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42d8000  ! 2219: STB_R	stb	%r26, [%r22 + %r0]
cpu_intr_3_183:
	setx	0x2c0330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a5a0cb  ! 2223: STWA_I	stwa	%r26, [%r22 + 0x00cb] %asi
	.word 0xb644e102  ! 2225: ADDC_I	addc 	%r19, 0x0102, %r27
	.word 0xf6a58020  ! 2226: STWA_R	stwa	%r27, [%r22 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
cpu_intr_3_184:
	setx	0x2d000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_95:
	mov	0x1b, %r14
	.word 0xfaf38e80  ! 2232: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xfea40020  ! 2234: STWA_R	stwa	%r31, [%r16 + %r0] 0x01
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983a90  ! 2235: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a90, %hpstate
cpu_intr_3_185:
	setx	0x2f0026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28d0000  ! 2240: ANDcc_R	andcc 	%r20, %r0, %r25
	.word 0xb93ca001  ! 2241: SRA_I	sra 	%r18, 0x0001, %r28
	.word 0xfc746152  ! 2242: STX_I	stx	%r30, [%r17 + 0x0152]
	.word 0xf6b40020  ! 2243: STHA_R	stha	%r27, [%r16 + %r0] 0x01
iob_intr_3_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_160), 16, 16)) -> intp(3, 0, 8)
	.word 0xb93c7001  ! 2249: SRAX_I	srax	%r17, 0x0001, %r28
iob_intr_3_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_161), 16, 16)) -> intp(3, 0, a)
	.word 0xf4256181  ! 2253: STW_I	stw	%r26, [%r21 + 0x0181]
	.word 0xf4ac2031  ! 2257: STBA_I	stba	%r26, [%r16 + 0x0031] %asi
T3_asi_reg_wr_96:
	mov	0x18, %r14
	.word 0xf8f38e40  ! 2258: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T3_asi_reg_rd_95:
	mov	0x14, %r14
	.word 0xf0db89e0  ! 2260: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_3_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_162), 16, 16)) -> intp(3, 0, 39)
T3_asi_reg_rd_96:
	mov	0xd, %r14
	.word 0xf6db89e0  ! 2264: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xf03461c4  ! 2266: STH_I	sth	%r24, [%r17 + 0x01c4]
cpu_intr_3_186:
	setx	0x2d003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe348000  ! 2269: STH_R	sth	%r31, [%r18 + %r0]
	.word 0xfe2c0000  ! 2270: STB_R	stb	%r31, [%r16 + %r0]
T3_asi_reg_wr_97:
	mov	0x25, %r14
	.word 0xfcf38400  ! 2271: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xfef5a0b5  ! 2272: STXA_I	stxa	%r31, [%r22 + 0x00b5] %asi
iob_intr_3_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_163), 16, 16)) -> intp(3, 0, 29)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_187:
	setx	0x2f0306, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_164), 16, 16)) -> intp(3, 0, 33)
cpu_intr_3_188:
	setx	0x2e0205, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_97:
	mov	0x21, %r14
	.word 0xf0db8400  ! 2285: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_3_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_165), 16, 16)) -> intp(3, 0, 2f)
cpu_intr_3_189:
	setx	0x2c012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8bde132  ! 2289: XNORcc_I	xnorcc 	%r23, 0x0132, %r28
	.word 0xfa248000  ! 2292: STW_R	stw	%r29, [%r18 + %r0]
	.word 0xba0ca116  ! 2297: AND_I	and 	%r18, 0x0116, %r29
	.word 0xf62c8000  ! 2298: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xf2f46090  ! 2299: STXA_I	stxa	%r25, [%r17 + 0x0090] %asi
cpu_intr_3_190:
	setx	0x320129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_191:
	setx	0x310208, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xbc454000  ! 2306: ADDC_R	addc 	%r21, %r0, %r30
iob_intr_3_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_166), 16, 16)) -> intp(3, 0, d)
cpu_intr_3_192:
	setx	0x330327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6f42114  ! 2311: STXA_I	stxa	%r27, [%r16 + 0x0114] %asi
cpu_intr_3_193:
	setx	0x30013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca46124  ! 2316: STWA_I	stwa	%r30, [%r17 + 0x0124] %asi
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_wr_98:
	mov	0x4, %r14
	.word 0xf4f38e60  ! 2320: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_3_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_167), 16, 16)) -> intp(3, 0, 12)
iob_intr_3_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_168), 16, 16)) -> intp(3, 0, 14)
cpu_intr_3_194:
	setx	0x320213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72cd000  ! 2328: SLLX_R	sllx	%r19, %r0, %r27
	.word 0xfcf5e16f  ! 2329: STXA_I	stxa	%r30, [%r23 + 0x016f] %asi
T3_asi_reg_wr_99:
	mov	0x24, %r14
	.word 0xfef38400  ! 2332: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb5520000  ! 2333: RDPR_PIL	rdpr	%pil, %r26
	.word 0xbb520000  ! 2334: RDPR_PIL	<illegal instruction>
	.word 0xfc2521b1  ! 2336: STW_I	stw	%r30, [%r20 + 0x01b1]
	.word 0xf6b54020  ! 2337: STHA_R	stha	%r27, [%r21 + %r0] 0x01
T3_asi_reg_rd_98:
	mov	0x3c5, %r14
	.word 0xf8db8400  ! 2338: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0x899460de  ! 2340: WRPR_TICK_I	wrpr	%r17, 0x00de, %tick
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982c18  ! 2341: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c18, %hpstate
	.word 0xf6a44020  ! 2344: STWA_R	stwa	%r27, [%r17 + %r0] 0x01
iob_intr_3_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_169), 16, 16)) -> intp(3, 0, 9)
T3_asi_reg_wr_100:
	mov	0x2d, %r14
	.word 0xfef38e80  ! 2347: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xfcf4e135  ! 2349: STXA_I	stxa	%r30, [%r19 + 0x0135] %asi
cpu_intr_3_195:
	setx	0x31001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb08da1d5  ! 2351: ANDcc_I	andcc 	%r22, 0x01d5, %r24
	.word 0xbab4a068  ! 2354: SUBCcc_I	orncc 	%r18, 0x0068, %r29
	.word 0xbf504000  ! 2356: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xf6356185  ! 2358: STH_I	sth	%r27, [%r21 + 0x0185]
	ta	T_CHANGE_TO_TL0
	.word 0xb8b40000  ! 2361: SUBCcc_R	orncc 	%r16, %r0, %r28
	ta	T_CHANGE_NONHPRIV
	.word 0xfc2d20f8  ! 2365: STB_I	stb	%r30, [%r20 + 0x00f8]
	ta	T_CHANGE_NONHPRIV
iob_intr_3_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_170), 16, 16)) -> intp(3, 0, 22)
	.word 0xfa350000  ! 2370: STH_R	sth	%r29, [%r20 + %r0]
	.word 0xfc3420dc  ! 2372: STH_I	sth	%r30, [%r16 + 0x00dc]
	.word 0xfa74a1b3  ! 2377: STX_I	stx	%r29, [%r18 + 0x01b3]
cpu_intr_3_196:
	setx	0x320221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb7da401  ! 2381: MOVR_I	movre	%r22, 0x1, %r29
	.word 0xb77d8400  ! 2382: MOVR_R	movre	%r22, %r0, %r27
T3_asi_reg_rd_99:
	mov	0x3c3, %r14
	.word 0xf8db89e0  ! 2384: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf6750000  ! 2385: STX_R	stx	%r27, [%r20 + %r0]
cpu_intr_3_197:
	setx	0x310232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb284e14d  ! 2389: ADDcc_I	addcc 	%r19, 0x014d, %r25
	.word 0xf0f5e036  ! 2390: STXA_I	stxa	%r24, [%r23 + 0x0036] %asi
	.word 0xfea58020  ! 2392: STWA_R	stwa	%r31, [%r22 + %r0] 0x01
	.word 0xf0a5e11c  ! 2395: STWA_I	stwa	%r24, [%r23 + 0x011c] %asi
T3_asi_reg_wr_101:
	mov	0x2c, %r14
	.word 0xf0f384a0  ! 2396: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb52d6001  ! 2397: SLL_I	sll 	%r21, 0x0001, %r26
cpu_intr_3_198:
	setx	0x31013a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_171), 16, 16)) -> intp(3, 0, a)
	.word 0xf8b50020  ! 2403: STHA_R	stha	%r28, [%r20 + %r0] 0x01
	.word 0xf2ac6188  ! 2404: STBA_I	stba	%r25, [%r17 + 0x0188] %asi
	ta	T_CHANGE_NONHPRIV
	.word 0xf82c20c7  ! 2408: STB_I	stb	%r28, [%r16 + 0x00c7]
cpu_intr_3_199:
	setx	0x310128, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_200:
	setx	0x310334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4adc020  ! 2415: STBA_R	stba	%r26, [%r23 + %r0] 0x01
T3_asi_reg_wr_102:
	mov	0x3c8, %r14
	.word 0xf4f38e80  ! 2417: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xfea5a191  ! 2418: STWA_I	stwa	%r31, [%r22 + 0x0191] %asi
cpu_intr_3_201:
	setx	0x300023, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_202:
	setx	0x32023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983850  ! 2426: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1850, %hpstate
	.word 0xfc2dc000  ! 2427: STB_R	stb	%r30, [%r23 + %r0]
	.word 0xfe2d20ff  ! 2428: STB_I	stb	%r31, [%r20 + 0x00ff]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf0350000  ! 2430: STH_R	sth	%r24, [%r20 + %r0]
cpu_intr_3_203:
	setx	0x300232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a4e1e1  ! 2433: STWA_I	stwa	%r28, [%r19 + 0x01e1] %asi
T3_asi_reg_wr_103:
	mov	0x28, %r14
	.word 0xfef389e0  ! 2434: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_3_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_172), 16, 16)) -> intp(3, 0, 33)
T3_asi_reg_wr_104:
	mov	0x3c1, %r14
	.word 0xf6f384a0  ! 2437: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T3_asi_reg_wr_105:
	mov	0x2f, %r14
	.word 0xfcf384a0  ! 2439: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbb641800  ! 2441: MOVcc_R	<illegal instruction>
	.word 0xf2a420ab  ! 2442: STWA_I	stwa	%r25, [%r16 + 0x00ab] %asi
iob_intr_3_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_173), 16, 16)) -> intp(3, 0, 1)
	.word 0xf22d212a  ! 2446: STB_I	stb	%r25, [%r20 + 0x012a]
	.word 0xfc2421d6  ! 2447: STW_I	stw	%r30, [%r16 + 0x01d6]
T3_asi_reg_wr_106:
	mov	0xa, %r14
	.word 0xf8f389e0  ! 2449: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xfa2461d5  ! 2454: STW_I	stw	%r29, [%r17 + 0x01d5]
cpu_intr_3_204:
	setx	0x31032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb40020  ! 2458: STHA_R	stha	%r30, [%r16 + %r0] 0x01
	.word 0xf4ac4020  ! 2461: STBA_R	stba	%r26, [%r17 + %r0] 0x01
T3_asi_reg_rd_100:
	mov	0x30, %r14
	.word 0xf6db89e0  ! 2462: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xf475a111  ! 2463: STX_I	stx	%r26, [%r22 + 0x0111]
	.word 0xf6ac6015  ! 2465: STBA_I	stba	%r27, [%r17 + 0x0015] %asi
	ta	T_CHANGE_TO_TL1
iob_intr_3_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_174), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_rd_101:
	mov	0x32, %r14
	.word 0xf8db8e60  ! 2474: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_3_205:
	setx	0x32023b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_206:
	setx	0x30032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6acc020  ! 2477: STBA_R	stba	%r27, [%r19 + %r0] 0x01
	.word 0xb4c4c000  ! 2478: ADDCcc_R	addccc 	%r19, %r0, %r26
T3_asi_reg_wr_107:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 2482: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb02dc000  ! 2484: ANDN_R	andn 	%r23, %r0, %r24
T3_asi_reg_rd_102:
	mov	0x8, %r14
	.word 0xf6db8e80  ! 2485: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T3_asi_reg_wr_108:
	mov	0xc, %r14
	.word 0xf8f38400  ! 2486: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T3_asi_reg_rd_103:
	mov	0x3c0, %r14
	.word 0xfedb8e60  ! 2487: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb29d4000  ! 2488: XORcc_R	xorcc 	%r21, %r0, %r25
T3_asi_reg_rd_104:
	mov	0x26, %r14
	.word 0xf0db89e0  ! 2491: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_3_207:
	setx	0x320207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9195a1a9  ! 2494: WRPR_PIL_I	wrpr	%r22, 0x01a9, %pil
	.word 0xf2f4a061  ! 2495: STXA_I	stxa	%r25, [%r18 + 0x0061] %asi
	.word 0xf62d0000  ! 2496: STB_R	stb	%r27, [%r20 + %r0]
cpu_intr_3_208:
	setx	0x320203, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_105:
	mov	0x31, %r14
	.word 0xfadb8e40  ! 2498: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbd34f001  ! 2499: SRLX_I	srlx	%r19, 0x0001, %r30
	.word 0xf0a46183  ! 2501: STWA_I	stwa	%r24, [%r17 + 0x0183] %asi
	.word 0xf0b48020  ! 2503: STHA_R	stha	%r24, [%r18 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_106:
	mov	0x19, %r14
	.word 0xf4db8e40  ! 2507: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf42521f5  ! 2508: STW_I	stw	%r26, [%r20 + 0x01f5]
T3_asi_reg_wr_109:
	mov	0x1d, %r14
	.word 0xfef38e40  ! 2509: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_wr_110:
	mov	0x8, %r14
	.word 0xf4f384a0  ! 2510: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T3_asi_reg_rd_107:
	mov	0x13, %r14
	.word 0xf6db8e40  ! 2511: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_wr_111:
	mov	0x3c6, %r14
	.word 0xfaf384a0  ! 2512: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T3_asi_reg_rd_108:
	mov	0x36, %r14
	.word 0xfedb8e40  ! 2513: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf6750000  ! 2514: STX_R	stx	%r27, [%r20 + %r0]
	.word 0xb4b460c1  ! 2515: SUBCcc_I	orncc 	%r17, 0x00c1, %r26
T3_asi_reg_wr_112:
	mov	0x10, %r14
	.word 0xfef38e60  ! 2517: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_3_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_175), 16, 16)) -> intp(3, 0, 1a)
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983a48  ! 2521: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a48, %hpstate
iob_intr_3_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_176), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_209:
	setx	0x320137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ad61bf  ! 2526: STBA_I	stba	%r26, [%r21 + 0x01bf] %asi
iob_intr_3_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_177), 16, 16)) -> intp(3, 0, 2)
	.word 0xfe34a0ae  ! 2531: STH_I	sth	%r31, [%r18 + 0x00ae]
cpu_intr_3_210:
	setx	0x30020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf67520af  ! 2534: STX_I	stx	%r27, [%r20 + 0x00af]
T3_asi_reg_rd_109:
	mov	0x3c1, %r14
	.word 0xf6db8e60  ! 2539: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf22c4000  ! 2541: STB_R	stb	%r25, [%r17 + %r0]
cpu_intr_3_211:
	setx	0x330333, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_113:
	mov	0x3c3, %r14
	.word 0xf0f389e0  ! 2545: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf22c4000  ! 2546: STB_R	stb	%r25, [%r17 + %r0]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_114:
	mov	0xa, %r14
	.word 0xf6f389e0  ! 2551: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T3_asi_reg_rd_110:
	mov	0x3c3, %r14
	.word 0xf4db8e60  ! 2553: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T3_asi_reg_wr_115:
	mov	0x4, %r14
	.word 0xf8f38400  ! 2554: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_3_212:
	setx	0x320126, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_178), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_179), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_wr_116:
	mov	0x1a, %r14
	.word 0xf0f38400  ! 2564: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf83461be  ! 2567: STH_I	sth	%r28, [%r17 + 0x01be]
cpu_intr_3_213:
	setx	0x33011d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_117:
	mov	0x3c2, %r14
	.word 0xf4f38e40  ! 2569: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_3_214:
	setx	0x330104, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_215:
	setx	0x33013c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_111:
	mov	0x2, %r14
	.word 0xfcdb8e40  ! 2573: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf0ade083  ! 2575: STBA_I	stba	%r24, [%r23 + 0x0083] %asi
cpu_intr_3_216:
	setx	0x330304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62d8000  ! 2577: STB_R	stb	%r27, [%r22 + %r0]
T3_asi_reg_wr_118:
	mov	0x28, %r14
	.word 0xf2f384a0  ! 2579: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xfc242167  ! 2581: STW_I	stw	%r30, [%r16 + 0x0167]
	.word 0xfab4618a  ! 2583: STHA_I	stha	%r29, [%r17 + 0x018a] %asi
	.word 0xf0f5610f  ! 2584: STXA_I	stxa	%r24, [%r21 + 0x010f] %asi
T3_asi_reg_wr_119:
	mov	0x6, %r14
	.word 0xf8f38e80  ! 2586: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb2bc2105  ! 2590: XNORcc_I	xnorcc 	%r16, 0x0105, %r25
cpu_intr_3_217:
	setx	0x330212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc35c000  ! 2597: STH_R	sth	%r30, [%r23 + %r0]
	.word 0xfc34c000  ! 2601: STH_R	sth	%r30, [%r19 + %r0]
	.word 0xf62461f4  ! 2604: STW_I	stw	%r27, [%r17 + 0x01f4]
	.word 0xb8b561e4  ! 2607: SUBCcc_I	orncc 	%r21, 0x01e4, %r28
cpu_intr_3_218:
	setx	0x330336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf355000  ! 2614: SRLX_R	srlx	%r21, %r0, %r31
iob_intr_3_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_180), 16, 16)) -> intp(3, 0, 24)
	.word 0xf6b4e0ae  ! 2619: STHA_I	stha	%r27, [%r19 + 0x00ae] %asi
	.word 0xfead2021  ! 2621: STBA_I	stba	%r31, [%r20 + 0x0021] %asi
T3_asi_reg_wr_120:
	mov	0x3, %r14
	.word 0xfcf38e60  ! 2622: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb17ca401  ! 2624: MOVR_I	movre	%r18, 0x1, %r24
	.word 0xf8352120  ! 2625: STH_I	sth	%r28, [%r20 + 0x0120]
T3_asi_reg_rd_112:
	mov	0x34, %r14
	.word 0xf2db89e0  ! 2626: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xf2a48020  ! 2630: STWA_R	stwa	%r25, [%r18 + %r0] 0x01
T3_asi_reg_wr_121:
	mov	0x12, %r14
	.word 0xf8f38e80  ! 2631: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf8b460e7  ! 2638: STHA_I	stha	%r28, [%r17 + 0x00e7] %asi
T3_asi_reg_rd_113:
	mov	0x3c6, %r14
	.word 0xf0db8e40  ! 2645: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfa758000  ! 2646: STX_R	stx	%r29, [%r22 + %r0]
	.word 0xfea40020  ! 2648: STWA_R	stwa	%r31, [%r16 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6f56166  ! 2651: STXA_I	stxa	%r27, [%r21 + 0x0166] %asi
cpu_intr_3_219:
	setx	0x32003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a54020  ! 2654: STWA_R	stwa	%r24, [%r21 + %r0] 0x01
	.word 0xb00d6036  ! 2655: AND_I	and 	%r21, 0x0036, %r24
	.word 0xb93d9000  ! 2656: SRAX_R	srax	%r22, %r0, %r28
iob_intr_3_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_181), 16, 16)) -> intp(3, 0, 3c)
	.word 0xb2856193  ! 2659: ADDcc_I	addcc 	%r21, 0x0193, %r25
	ta	T_CHANGE_TO_TL0
cpu_intr_3_220:
	setx	0x31013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02ca15a  ! 2664: STB_I	stb	%r24, [%r18 + 0x015a]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_182), 16, 16)) -> intp(3, 0, 32)
iob_intr_3_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_183), 16, 16)) -> intp(3, 0, 36)
	.word 0xf4ac61d1  ! 2672: STBA_I	stba	%r26, [%r17 + 0x01d1] %asi
	.word 0xbeb50000  ! 2673: SUBCcc_R	orncc 	%r20, %r0, %r31
	.word 0xfe240000  ! 2677: STW_R	stw	%r31, [%r16 + %r0]
	.word 0xf4a50020  ! 2678: STWA_R	stwa	%r26, [%r20 + %r0] 0x01
iob_intr_3_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_184), 16, 16)) -> intp(3, 0, 0)
T3_asi_reg_wr_122:
	mov	0x14, %r14
	.word 0xf2f38e60  ! 2680: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T3_asi_reg_wr_123:
	mov	0x3c8, %r14
	.word 0xf2f384a0  ! 2681: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb32c4000  ! 2686: SLL_R	sll 	%r17, %r0, %r25
T3_asi_reg_wr_124:
	mov	0x0, %r14
	.word 0xf0f38e80  ! 2690: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	.word 0xfa74e085  ! 2693: STX_I	stx	%r29, [%r19 + 0x0085]
	.word 0xfe34c000  ! 2695: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xf8ada1a2  ! 2696: STBA_I	stba	%r28, [%r22 + 0x01a2] %asi
T3_asi_reg_rd_114:
	mov	0x3c8, %r14
	.word 0xfadb8400  ! 2697: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb28c0000  ! 2699: ANDcc_R	andcc 	%r16, %r0, %r25
	.word 0xfc2c61c2  ! 2700: STB_I	stb	%r30, [%r17 + 0x01c2]
T3_asi_reg_wr_125:
	mov	0x3c1, %r14
	.word 0xfaf38e80  ! 2701: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf6750000  ! 2705: STX_R	stx	%r27, [%r20 + %r0]
iob_intr_3_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_185), 16, 16)) -> intp(3, 0, 22)
	.word 0xbca5e1d6  ! 2709: SUBcc_I	subcc 	%r23, 0x01d6, %r30
	.word 0xfab5c020  ! 2710: STHA_R	stha	%r29, [%r23 + %r0] 0x01
	.word 0xf0a50020  ! 2711: STWA_R	stwa	%r24, [%r20 + %r0] 0x01
iob_intr_3_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_186), 16, 16)) -> intp(3, 0, 1e)
iob_intr_3_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_187), 16, 16)) -> intp(3, 0, 20)
iob_intr_3_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_188), 16, 16)) -> intp(3, 0, 29)
	.word 0xf8254000  ! 2716: STW_R	stw	%r28, [%r21 + %r0]
	.word 0xfa342133  ! 2717: STH_I	sth	%r29, [%r16 + 0x0133]
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983a9a  ! 2719: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a9a, %hpstate
	.word 0xb6c46037  ! 2720: ADDCcc_I	addccc 	%r17, 0x0037, %r27
	.word 0xf0758000  ! 2721: STX_R	stx	%r24, [%r22 + %r0]
	.word 0xf2a42073  ! 2722: STWA_I	stwa	%r25, [%r16 + 0x0073] %asi
iob_intr_3_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_189), 16, 16)) -> intp(3, 0, 3c)
T3_asi_reg_rd_115:
	mov	0x3c3, %r14
	.word 0xf0db8e40  ! 2727: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf4a40020  ! 2731: STWA_R	stwa	%r26, [%r16 + %r0] 0x01
	.word 0xbd2d3001  ! 2732: SLLX_I	sllx	%r20, 0x0001, %r30
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_221:
	setx	0x360302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa40020  ! 2741: STWA_R	stwa	%r29, [%r16 + %r0] 0x01
	.word 0xf225e1d0  ! 2744: STW_I	stw	%r25, [%r23 + 0x01d0]
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983e82  ! 2747: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e82, %hpstate
	.word 0xf2b4a037  ! 2748: STHA_I	stha	%r25, [%r18 + 0x0037] %asi
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_116:
	mov	0x2e, %r14
	.word 0xfedb8e80  ! 2751: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xbcb40000  ! 2752: SUBCcc_R	orncc 	%r16, %r0, %r30
T3_asi_reg_rd_117:
	mov	0x32, %r14
	.word 0xf0db8e40  ! 2756: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_3_222:
	setx	0x35033d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_190), 16, 16)) -> intp(3, 0, 3c)
iob_intr_3_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_191), 16, 16)) -> intp(3, 0, 29)
	.word 0xfaac8020  ! 2768: STBA_R	stba	%r29, [%r18 + %r0] 0x01
	.word 0xba1d0000  ! 2769: XOR_R	xor 	%r20, %r0, %r29
iob_intr_3_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_192), 16, 16)) -> intp(3, 0, 17)
T3_asi_reg_rd_118:
	mov	0x30, %r14
	.word 0xfcdb8e40  ! 2773: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_3_223:
	setx	0x37032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6c560f7  ! 2775: ADDCcc_I	addccc 	%r21, 0x00f7, %r27
	.word 0xfeac4020  ! 2777: STBA_R	stba	%r31, [%r17 + %r0] 0x01
iob_intr_3_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_193), 16, 16)) -> intp(3, 0, b)
	.word 0xf22dc000  ! 2779: STB_R	stb	%r25, [%r23 + %r0]
T3_asi_reg_rd_119:
	mov	0x4, %r14
	.word 0xf4db8e40  ! 2783: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf6744000  ! 2785: STX_R	stx	%r27, [%r17 + %r0]
	.word 0xfaac8020  ! 2787: STBA_R	stba	%r29, [%r18 + %r0] 0x01
	.word 0xf6350000  ! 2788: STH_R	sth	%r27, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_194), 16, 16)) -> intp(3, 0, 34)
	.word 0xfa250000  ! 2793: STW_R	stw	%r29, [%r20 + %r0]
T3_asi_reg_wr_126:
	mov	0x25, %r14
	.word 0xf4f38e40  ! 2794: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfc2d4000  ! 2795: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xfe74a064  ! 2797: STX_I	stx	%r31, [%r18 + 0x0064]
	.word 0xf8aca0fa  ! 2799: STBA_I	stba	%r28, [%r18 + 0x00fa] %asi
	ta	T_CHANGE_TO_TL0
iob_intr_3_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_195), 16, 16)) -> intp(3, 0, 18)
	.word 0xf22da15b  ! 2805: STB_I	stb	%r25, [%r22 + 0x015b]
iob_intr_3_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_196), 16, 16)) -> intp(3, 0, 3d)
	.word 0xfcb4c020  ! 2812: STHA_R	stha	%r30, [%r19 + %r0] 0x01
cpu_intr_3_224:
	setx	0x350230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa75a110  ! 2815: STX_I	stx	%r29, [%r22 + 0x0110]
T3_asi_reg_rd_120:
	mov	0x0, %r14
	.word 0xf0db8e40  ! 2816: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_3_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_197), 16, 16)) -> intp(3, 0, 29)
cpu_intr_3_225:
	setx	0x340307, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_127:
	mov	0x3, %r14
	.word 0xf6f38e80  ! 2826: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T3_asi_reg_rd_121:
	mov	0x1d, %r14
	.word 0xfedb8e40  ! 2827: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_226:
	setx	0x340208, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_198), 16, 16)) -> intp(3, 0, 2b)
iob_intr_3_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_199), 16, 16)) -> intp(3, 0, 36)
cpu_intr_3_227:
	setx	0x370236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_200), 16, 16)) -> intp(3, 0, 13)
	.word 0xf22de0ea  ! 2833: STB_I	stb	%r25, [%r23 + 0x00ea]
	.word 0xfea4601a  ! 2835: STWA_I	stwa	%r31, [%r17 + 0x001a] %asi
iob_intr_3_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_201), 16, 16)) -> intp(3, 0, 3)
T3_asi_reg_rd_122:
	mov	0x10, %r14
	.word 0xf4db8e80  ! 2838: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_3_228:
	setx	0x340015, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_229:
	setx	0x35022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xbeb50000  ! 2847: SUBCcc_R	orncc 	%r20, %r0, %r31
	.word 0xbb7cc400  ! 2849: MOVR_R	movre	%r19, %r0, %r29
T3_asi_reg_wr_128:
	mov	0x33, %r14
	.word 0xfaf38e60  ! 2850: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_3_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_202), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf0b4a1d9  ! 2852: STHA_I	stha	%r24, [%r18 + 0x01d9] %asi
iob_intr_3_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_203), 16, 16)) -> intp(3, 0, 33)
	.word 0xb12d4000  ! 2855: SLL_R	sll 	%r21, %r0, %r24
	.word 0x8794e156  ! 2856: WRPR_TT_I	wrpr	%r19, 0x0156, %tt
cpu_intr_3_230:
	setx	0x340106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc752056  ! 2863: STX_I	stx	%r30, [%r20 + 0x0056]
	.word 0xf8ac4020  ! 2870: STBA_R	stba	%r28, [%r17 + %r0] 0x01
	.word 0xf4b4c020  ! 2871: STHA_R	stha	%r26, [%r19 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_204), 16, 16)) -> intp(3, 0, 30)
T3_asi_reg_wr_129:
	mov	0x3c8, %r14
	.word 0xf0f384a0  ! 2878: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf6f5211f  ! 2880: STXA_I	stxa	%r27, [%r20 + 0x011f] %asi
	.word 0xf0b46154  ! 2884: STHA_I	stha	%r24, [%r17 + 0x0154] %asi
cpu_intr_3_231:
	setx	0x370335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2d4000  ! 2889: STB_R	stb	%r31, [%r21 + %r0]
	.word 0xf8ad8020  ! 2890: STBA_R	stba	%r28, [%r22 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
	.word 0xf635a194  ! 2894: STH_I	sth	%r27, [%r22 + 0x0194]
	.word 0xb68c0000  ! 2895: ANDcc_R	andcc 	%r16, %r0, %r27
T3_asi_reg_wr_130:
	mov	0x19, %r14
	.word 0xf4f384a0  ! 2899: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_3_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_205), 16, 16)) -> intp(3, 0, 32)
T3_asi_reg_rd_123:
	mov	0x7, %r14
	.word 0xf2db8e60  ! 2901: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfab52181  ! 2903: STHA_I	stha	%r29, [%r20 + 0x0181] %asi
T3_asi_reg_wr_131:
	mov	0x2f, %r14
	.word 0xf6f389e0  ! 2905: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982f98  ! 2907: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f98, %hpstate
T3_asi_reg_rd_124:
	mov	0x1f, %r14
	.word 0xf2db8400  ! 2910: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb37cc400  ! 2911: MOVR_R	movre	%r19, %r0, %r25
T3_asi_reg_wr_132:
	mov	0x28, %r14
	.word 0xfcf38e80  ! 2914: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	ta	T_CHANGE_NONHPRIV
	.word 0xf834a061  ! 2916: STH_I	sth	%r28, [%r18 + 0x0061]
	.word 0xfaf4a061  ! 2917: STXA_I	stxa	%r29, [%r18 + 0x0061] %asi
	ta	T_CHANGE_NONHPRIV
	.word 0xfcb54020  ! 2919: STHA_R	stha	%r30, [%r21 + %r0] 0x01
	.word 0xfa354000  ! 2920: STH_R	sth	%r29, [%r21 + %r0]
T3_asi_reg_wr_133:
	mov	0x2a, %r14
	.word 0xf8f384a0  ! 2922: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T3_asi_reg_wr_134:
	mov	0x3c8, %r14
	.word 0xfaf389e0  ! 2923: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_3_232:
	setx	0x34033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_135:
	mov	0x2a, %r14
	.word 0xf8f38e80  ! 2926: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_3_233:
	setx	0x350027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_234:
	setx	0x370023, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_235:
	setx	0x360302, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_206), 16, 16)) -> intp(3, 0, 38)
	.word 0xf2f520f1  ! 2939: STXA_I	stxa	%r25, [%r20 + 0x00f1] %asi
	.word 0xf674c000  ! 2940: STX_R	stx	%r27, [%r19 + %r0]
T3_asi_reg_wr_136:
	mov	0x0, %r14
	.word 0xf4f38e60  ! 2941: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T3_asi_reg_wr_137:
	mov	0x3c6, %r14
	.word 0xf2f389e0  ! 2945: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T3_asi_reg_rd_125:
	mov	0x1d, %r14
	.word 0xfedb8400  ! 2948: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_138:
	mov	0x3c2, %r14
	.word 0xf2f38e80  ! 2950: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xfc2460a7  ! 2951: STW_I	stw	%r30, [%r17 + 0x00a7]
	.word 0xf82d0000  ! 2953: STB_R	stb	%r28, [%r20 + %r0]
	.word 0xf8f5600a  ! 2956: STXA_I	stxa	%r28, [%r21 + 0x000a] %asi
iob_intr_3_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_207), 16, 16)) -> intp(3, 0, 9)
	.word 0xf42c2095  ! 2961: STB_I	stb	%r26, [%r16 + 0x0095]
iob_intr_3_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_208), 16, 16)) -> intp(3, 0, 39)
	.word 0xf62cc000  ! 2967: STB_R	stb	%r27, [%r19 + %r0]
	.word 0xf424e050  ! 2969: STW_I	stw	%r26, [%r19 + 0x0050]
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983b18  ! 2971: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b18, %hpstate
	.word 0xb334d000  ! 2973: SRLX_R	srlx	%r19, %r0, %r25
T3_asi_reg_wr_139:
	mov	0x3c3, %r14
	.word 0xf4f38e80  ! 2974: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_3_236:
	setx	0x350121, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_209), 16, 16)) -> intp(3, 0, 28)
iob_intr_3_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_210), 16, 16)) -> intp(3, 0, 16)
cpu_intr_3_237:
	setx	0x370039, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_238:
	setx	0x370120, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_211), 16, 16)) -> intp(3, 0, 21)
T3_asi_reg_rd_126:
	mov	0x3c5, %r14
	.word 0xf6db8400  ! 2991: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf8754000  ! 2995: STX_R	stx	%r28, [%r21 + %r0]
	.word 0xfa2561e8  ! 2997: STW_I	stw	%r29, [%r21 + 0x01e8]
cpu_intr_3_239:
	setx	0x370225, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_212), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_240:
	setx	0x350135, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_140:
	mov	0xd, %r14
	.word 0xfaf38e40  ! 3010: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb17c4400  ! 3012: MOVR_R	movre	%r17, %r0, %r24
T3_asi_reg_rd_127:
	mov	0x23, %r14
	.word 0xf6db8e80  ! 3013: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf2b52013  ! 3015: STHA_I	stha	%r25, [%r20 + 0x0013] %asi
cpu_intr_3_241:
	setx	0x37030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6f46192  ! 3019: STXA_I	stxa	%r27, [%r17 + 0x0192] %asi
cpu_intr_3_242:
	setx	0x370005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf434206e  ! 3022: STH_I	sth	%r26, [%r16 + 0x006e]
iob_intr_3_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_213), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_rd_128:
	mov	0x3c6, %r14
	.word 0xf8db84a0  ! 3028: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf835205a  ! 3029: STH_I	sth	%r28, [%r20 + 0x005a]
cpu_intr_3_243:
	setx	0x34000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a40020  ! 3031: STWA_R	stwa	%r26, [%r16 + %r0] 0x01
	.word 0xf62c8000  ! 3032: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xf8b46141  ! 3033: STHA_I	stha	%r28, [%r17 + 0x0141] %asi
	.word 0xfeace0e9  ! 3035: STBA_I	stba	%r31, [%r19 + 0x00e9] %asi
	.word 0xf4f4607a  ! 3036: STXA_I	stxa	%r26, [%r17 + 0x007a] %asi
iob_intr_3_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_214), 16, 16)) -> intp(3, 0, 8)
iob_intr_3_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_215), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf225a125  ! 3041: STW_I	stw	%r25, [%r22 + 0x0125]
iob_intr_3_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_216), 16, 16)) -> intp(3, 0, 25)
cpu_intr_3_244:
	setx	0x20204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ada075  ! 3051: STBA_I	stba	%r25, [%r22 + 0x0075] %asi
	ta	T_CHANGE_TO_TL1
cpu_intr_3_245:
	setx	0x360101, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_246:
	setx	0x37001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a5a0ba  ! 3058: STWA_I	stwa	%r26, [%r22 + 0x00ba] %asi
	.word 0xbe246199  ! 3061: SUB_I	sub 	%r17, 0x0199, %r31
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982a82  ! 3068: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a82, %hpstate
T3_asi_reg_wr_141:
	mov	0x14, %r14
	.word 0xf4f389e0  ! 3069: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf8b521f4  ! 3070: STHA_I	stha	%r28, [%r20 + 0x01f4] %asi
cpu_intr_3_247:
	setx	0x35033b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_217), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf8ad204d  ! 3075: STBA_I	stba	%r28, [%r20 + 0x004d] %asi
	.word 0xfe24e04b  ! 3076: STW_I	stw	%r31, [%r19 + 0x004b]
iob_intr_3_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_218), 16, 16)) -> intp(3, 0, 3c)
iob_intr_3_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_219), 16, 16)) -> intp(3, 0, 28)
cpu_intr_3_248:
	setx	0x340221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb40020  ! 3087: STHA_R	stha	%r31, [%r16 + %r0] 0x01
	.word 0xf42d4000  ! 3088: STB_R	stb	%r26, [%r21 + %r0]
cpu_intr_3_249:
	setx	0x36022e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_250:
	setx	0x350139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53de001  ! 3093: SRA_I	sra 	%r23, 0x0001, %r26
	.word 0xfc2da1f2  ! 3094: STB_I	stb	%r30, [%r22 + 0x01f2]
T3_asi_reg_wr_142:
	mov	0x3c8, %r14
	.word 0xf2f38400  ! 3095: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_3_251:
	setx	0x360032, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe74a042  ! 3109: STX_I	stx	%r31, [%r18 + 0x0042]
iob_intr_3_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_220), 16, 16)) -> intp(3, 0, 19)
cpu_intr_3_252:
	setx	0x35022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe358000  ! 3114: STH_R	sth	%r31, [%r22 + %r0]
	.word 0xf0a4607c  ! 3115: STWA_I	stwa	%r24, [%r17 + 0x007c] %asi
cpu_intr_3_253:
	setx	0x36012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82de1e9  ! 3118: STB_I	stb	%r28, [%r23 + 0x01e9]
T3_asi_reg_wr_143:
	mov	0x8, %r14
	.word 0xfcf389e0  ! 3119: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T3_asi_reg_rd_129:
	mov	0xf, %r14
	.word 0xf8db8400  ! 3122: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_3_254:
	setx	0x36001d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_221), 16, 16)) -> intp(3, 0, 39)
	.word 0xf4254000  ! 3134: STW_R	stw	%r26, [%r21 + %r0]
	.word 0xfea54020  ! 3137: STWA_R	stwa	%r31, [%r21 + %r0] 0x01
iob_intr_3_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_222), 16, 16)) -> intp(3, 0, 3b)
T3_asi_reg_rd_130:
	mov	0x23, %r14
	.word 0xf4db8e60  ! 3143: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_3_255:
	setx	0x370004, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_144:
	mov	0x3c6, %r14
	.word 0xf2f38400  ! 3148: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xba35c000  ! 3150: ORN_R	orn 	%r23, %r0, %r29
cpu_intr_3_256:
	setx	0x360027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf624a0b1  ! 3156: STW_I	stw	%r27, [%r18 + 0x00b1]
iob_intr_3_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_223), 16, 16)) -> intp(3, 0, 29)
iob_intr_3_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_224), 16, 16)) -> intp(3, 0, 0)
cpu_intr_3_257:
	setx	0x36000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab5a01f  ! 3162: STHA_I	stha	%r29, [%r22 + 0x001f] %asi
iob_intr_3_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_225), 16, 16)) -> intp(3, 0, 2d)
T3_asi_reg_rd_131:
	mov	0x0, %r14
	.word 0xf2db8e60  ! 3166: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf8a40020  ! 3167: STWA_R	stwa	%r28, [%r16 + %r0] 0x01
iob_intr_3_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_226), 16, 16)) -> intp(3, 0, 1e)
iob_intr_3_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_227), 16, 16)) -> intp(3, 0, 3a)
	.word 0xfc2c4000  ! 3174: STB_R	stb	%r30, [%r17 + %r0]
	.word 0xfab40020  ! 3175: STHA_R	stha	%r29, [%r16 + %r0] 0x01
	.word 0xbf354000  ! 3176: SRL_R	srl 	%r21, %r0, %r31
	.word 0xfab420eb  ! 3177: STHA_I	stha	%r29, [%r16 + 0x00eb] %asi
	ta	T_CHANGE_TO_TL0
	.word 0xf42ca19b  ! 3181: STB_I	stb	%r26, [%r18 + 0x019b]
T3_asi_reg_rd_132:
	mov	0x1d, %r14
	.word 0xf0db8e60  ! 3182: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_145:
	mov	0x27, %r14
	.word 0xfcf38e80  ! 3186: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_3_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_228), 16, 16)) -> intp(3, 0, 3c)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xa1902000  ! 3190: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xfa748000  ! 3191: STX_R	stx	%r29, [%r18 + %r0]
	.word 0xf2258000  ! 3192: STW_R	stw	%r25, [%r22 + %r0]
	.word 0xf42de15c  ! 3199: STB_I	stb	%r26, [%r23 + 0x015c]
T3_asi_reg_wr_146:
	mov	0x3c5, %r14
	.word 0xfef38e40  ! 3200: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_wr_147:
	mov	0x3, %r14
	.word 0xf2f389e0  ! 3203: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb351c000  ! 3204: RDPR_TL	rdpr	%tl, %r25
	.word 0xf075601f  ! 3205: STX_I	stx	%r24, [%r21 + 0x001f]
cpu_intr_3_258:
	setx	0x3a011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb58020  ! 3207: STHA_R	stha	%r30, [%r22 + %r0] 0x01
T3_asi_reg_rd_133:
	mov	0x3c6, %r14
	.word 0xfedb8e60  ! 3209: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xfc250000  ! 3210: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xf825e09b  ! 3211: STW_I	stw	%r28, [%r23 + 0x009b]
cpu_intr_3_259:
	setx	0x3b033f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_229), 16, 16)) -> intp(3, 0, 21)
	.word 0xbe3d2019  ! 3217: XNOR_I	xnor 	%r20, 0x0019, %r31
	.word 0xf6340000  ! 3219: STH_R	sth	%r27, [%r16 + %r0]
	.word 0xfeac0020  ! 3221: STBA_R	stba	%r31, [%r16 + %r0] 0x01
T3_asi_reg_rd_134:
	mov	0x23, %r14
	.word 0xf2db8e80  ! 3222: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf4752031  ! 3224: STX_I	stx	%r26, [%r20 + 0x0031]
	.word 0xf2ac4020  ! 3225: STBA_R	stba	%r25, [%r17 + %r0] 0x01
	.word 0xbf7dc400  ! 3226: MOVR_R	movre	%r23, %r0, %r31
iob_intr_3_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_230), 16, 16)) -> intp(3, 0, 1d)
cpu_intr_3_260:
	setx	0x39030b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_261:
	setx	0x3a020d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_135:
	mov	0x3c0, %r14
	.word 0xf4db8e40  ! 3238: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_wr_148:
	mov	0x3c5, %r14
	.word 0xf4f384a0  ! 3239: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_3_262:
	setx	0x38012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6a4606e  ! 3249: STWA_I	stwa	%r27, [%r17 + 0x006e] %asi
iob_intr_3_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_231), 16, 16)) -> intp(3, 0, 6)
iob_intr_3_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_232), 16, 16)) -> intp(3, 0, 2)
	.word 0xfead0020  ! 3255: STBA_R	stba	%r31, [%r20 + %r0] 0x01
	.word 0xfc246135  ! 3256: STW_I	stw	%r30, [%r17 + 0x0135]
	.word 0xb43420a7  ! 3259: ORN_I	orn 	%r16, 0x00a7, %r26
iob_intr_3_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_233), 16, 16)) -> intp(3, 0, 23)
cpu_intr_3_263:
	setx	0x3a0106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe3d4000  ! 3263: XNOR_R	xnor 	%r21, %r0, %r31
	.word 0xb17cc400  ! 3264: MOVR_R	movre	%r19, %r0, %r24
	.word 0xf87561cc  ! 3265: STX_I	stx	%r28, [%r21 + 0x01cc]
cpu_intr_3_264:
	setx	0x3b0212, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_149:
	mov	0x22, %r14
	.word 0xf4f389e0  ! 3267: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_3_265:
	setx	0x3a021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82d8000  ! 3271: STB_R	stb	%r28, [%r22 + %r0]
	.word 0xfa358000  ! 3273: STH_R	sth	%r29, [%r22 + %r0]
	.word 0xf8ada1d8  ! 3278: STBA_I	stba	%r28, [%r22 + 0x01d8] %asi
T3_asi_reg_rd_136:
	mov	0x3c8, %r14
	.word 0xfedb84a0  ! 3282: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xfcf4a1f9  ! 3284: STXA_I	stxa	%r30, [%r18 + 0x01f9] %asi
T3_asi_reg_rd_137:
	mov	0x1f, %r14
	.word 0xfedb8e40  ! 3285: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf8ad8020  ! 3286: STBA_R	stba	%r28, [%r22 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
	.word 0xb8b561e6  ! 3290: SUBCcc_I	orncc 	%r21, 0x01e6, %r28
T3_asi_reg_wr_150:
	mov	0x7, %r14
	.word 0xf8f38e80  ! 3291: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf0ada14e  ! 3294: STBA_I	stba	%r24, [%r22 + 0x014e] %asi
	.word 0xfe25c000  ! 3296: STW_R	stw	%r31, [%r23 + %r0]
	.word 0xfc24c000  ! 3297: STW_R	stw	%r30, [%r19 + %r0]
cpu_intr_3_266:
	setx	0x3b0019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6350000  ! 3300: STH_R	sth	%r27, [%r20 + %r0]
	.word 0xba3cc000  ! 3301: XNOR_R	xnor 	%r19, %r0, %r29
T3_asi_reg_rd_138:
	mov	0x22, %r14
	.word 0xfedb8400  ! 3302: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_3_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_234), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_wr_151:
	mov	0x17, %r14
	.word 0xf6f38e80  ! 3307: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf82ca148  ! 3308: STB_I	stb	%r28, [%r18 + 0x0148]
	.word 0xfcada045  ! 3310: STBA_I	stba	%r30, [%r22 + 0x0045] %asi
T3_asi_reg_rd_139:
	mov	0x5, %r14
	.word 0xfedb84a0  ! 3312: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_3_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_235), 16, 16)) -> intp(3, 0, 10)
	.word 0xf67461a7  ! 3318: STX_I	stx	%r27, [%r17 + 0x01a7]
	.word 0xf8b40020  ! 3320: STHA_R	stha	%r28, [%r16 + %r0] 0x01
	.word 0xfcac21f0  ! 3322: STBA_I	stba	%r30, [%r16 + 0x01f0] %asi
	.word 0xb32dc000  ! 3323: SLL_R	sll 	%r23, %r0, %r25
cpu_intr_3_267:
	setx	0x3b0223, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_268:
	setx	0x390206, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983882  ! 3330: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1882, %hpstate
T3_asi_reg_wr_152:
	mov	0x3, %r14
	.word 0xfcf384a0  ! 3331: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf224e191  ! 3332: STW_I	stw	%r25, [%r19 + 0x0191]
	.word 0xf4ac2013  ! 3334: STBA_I	stba	%r26, [%r16 + 0x0013] %asi
	ta	T_CHANGE_TO_TL0
	.word 0xb434c000  ! 3343: SUBC_R	orn 	%r19, %r0, %r26
	.word 0xfca50020  ! 3344: STWA_R	stwa	%r30, [%r20 + %r0] 0x01
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982c08  ! 3346: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c08, %hpstate
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	.word 0xf0f421ca  ! 3354: STXA_I	stxa	%r24, [%r16 + 0x01ca] %asi
iob_intr_3_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_236), 16, 16)) -> intp(3, 0, 35)
	.word 0xbc1de017  ! 3356: XOR_I	xor 	%r23, 0x0017, %r30
cpu_intr_3_269:
	setx	0x38023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ad2092  ! 3363: STBA_I	stba	%r28, [%r20 + 0x0092] %asi
iob_intr_3_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_237), 16, 16)) -> intp(3, 0, 11)
iob_intr_3_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_238), 16, 16)) -> intp(3, 0, f)
	.word 0xfa2c2003  ! 3372: STB_I	stb	%r29, [%r16 + 0x0003]
T3_asi_reg_wr_153:
	mov	0x2c, %r14
	.word 0xf8f38e80  ! 3373: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_3_270:
	setx	0x39030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ad0020  ! 3378: STBA_R	stba	%r26, [%r20 + %r0] 0x01
	.word 0xfe750000  ! 3380: STX_R	stx	%r31, [%r20 + %r0]
T3_asi_reg_rd_140:
	mov	0x3c6, %r14
	.word 0xfcdb89e0  ! 3381: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf2ac8020  ! 3382: STBA_R	stba	%r25, [%r18 + %r0] 0x01
T3_asi_reg_wr_154:
	mov	0x7, %r14
	.word 0xfcf38e40  ! 3384: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T3_asi_reg_wr_155:
	mov	0x29, %r14
	.word 0xfcf38e60  ! 3385: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_3_271:
	setx	0x3b031c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_272:
	setx	0x39030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf274e07e  ! 3397: STX_I	stx	%r25, [%r19 + 0x007e]
T3_asi_reg_wr_156:
	mov	0x3c7, %r14
	.word 0xfef389e0  ! 3399: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_3_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_239), 16, 16)) -> intp(3, 0, 3d)
cpu_intr_3_273:
	setx	0x3a0139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02ca018  ! 3403: STB_I	stb	%r24, [%r18 + 0x0018]
	.word 0xf4adc020  ! 3406: STBA_R	stba	%r26, [%r23 + %r0] 0x01
	.word 0xb551c000  ! 3407: RDPR_TL	rdpr	%tl, %r26
	.word 0xbeb48000  ! 3410: ORNcc_R	orncc 	%r18, %r0, %r31
T3_asi_reg_wr_157:
	mov	0x28, %r14
	.word 0xf0f389e0  ! 3411: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf425a06f  ! 3412: STW_I	stw	%r26, [%r22 + 0x006f]
	.word 0xf4240000  ! 3413: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xfc748000  ! 3414: STX_R	stx	%r30, [%r18 + %r0]
iob_intr_3_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_240), 16, 16)) -> intp(3, 0, 34)
	ta	T_CHANGE_TO_TL0
	.word 0xf4b560e2  ! 3420: STHA_I	stha	%r26, [%r21 + 0x00e2] %asi
cpu_intr_3_274:
	setx	0x3a033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b5c020  ! 3425: STHA_R	stha	%r24, [%r23 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa2c4000  ! 3429: STB_R	stb	%r29, [%r17 + %r0]
	.word 0xf2f521e8  ! 3431: STXA_I	stxa	%r25, [%r20 + 0x01e8] %asi
	.word 0xf0248000  ! 3433: STW_R	stw	%r24, [%r18 + %r0]
T3_asi_reg_wr_158:
	mov	0x3c4, %r14
	.word 0xf8f389e0  ! 3435: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xfe748000  ! 3436: STX_R	stx	%r31, [%r18 + %r0]
cpu_intr_3_275:
	setx	0x3a0105, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_141:
	mov	0x3c0, %r14
	.word 0xfcdb8400  ! 3440: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf0b4609b  ! 3446: STHA_I	stha	%r24, [%r17 + 0x009b] %asi
	ta	T_CHANGE_TO_TL0
	.word 0xb534a001  ! 3448: SRL_I	srl 	%r18, 0x0001, %r26
T3_asi_reg_wr_159:
	mov	0x3c7, %r14
	.word 0xf6f389e0  ! 3449: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983e52  ! 3451: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e52, %hpstate
T3_asi_reg_rd_142:
	mov	0xd, %r14
	.word 0xf8db84a0  ! 3455: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xfe744000  ! 3459: STX_R	stx	%r31, [%r17 + %r0]
	.word 0xf8b4c020  ! 3463: STHA_R	stha	%r28, [%r19 + %r0] 0x01
	.word 0xf22da189  ! 3464: STB_I	stb	%r25, [%r22 + 0x0189]
	.word 0xfea4606e  ! 3465: STWA_I	stwa	%r31, [%r17 + 0x006e] %asi
	.word 0xfca4e16f  ! 3466: STWA_I	stwa	%r30, [%r19 + 0x016f] %asi
	.word 0xfeb40020  ! 3467: STHA_R	stha	%r31, [%r16 + %r0] 0x01
T3_asi_reg_rd_143:
	mov	0x3c5, %r14
	.word 0xfcdb84a0  ! 3468: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_3_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_241), 16, 16)) -> intp(3, 0, 27)
	.word 0xb83d4000  ! 3471: XNOR_R	xnor 	%r21, %r0, %r28
	.word 0xfe254000  ! 3472: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xf8a4a17f  ! 3474: STWA_I	stwa	%r28, [%r18 + 0x017f] %asi
	.word 0xfab4601c  ! 3476: STHA_I	stha	%r29, [%r17 + 0x001c] %asi
iob_intr_3_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_242), 16, 16)) -> intp(3, 0, a)
T3_asi_reg_rd_144:
	mov	0x3c0, %r14
	.word 0xfadb8e40  ! 3478: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_3_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_243), 16, 16)) -> intp(3, 0, 23)
iob_intr_3_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_244), 16, 16)) -> intp(3, 0, 1d)
	.word 0xf674a125  ! 3483: STX_I	stx	%r27, [%r18 + 0x0125]
iob_intr_3_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_245), 16, 16)) -> intp(3, 0, 38)
	ta	T_CHANGE_TO_TL1
	.word 0xf2252083  ! 3491: STW_I	stw	%r25, [%r20 + 0x0083]
	.word 0xbb2d1000  ! 3492: SLLX_R	sllx	%r20, %r0, %r29
	.word 0xfe24e15c  ! 3494: STW_I	stw	%r31, [%r19 + 0x015c]
	.word 0xf835e1fa  ! 3495: STH_I	sth	%r28, [%r23 + 0x01fa]
T3_asi_reg_wr_160:
	mov	0x3c6, %r14
	.word 0xfaf38e60  ! 3497: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf6adc020  ! 3498: STBA_R	stba	%r27, [%r23 + %r0] 0x01
T3_asi_reg_rd_145:
	mov	0x2a, %r14
	.word 0xf8db89e0  ! 3501: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T3_asi_reg_wr_161:
	mov	0x3c6, %r14
	.word 0xf4f38400  ! 3502: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T3_asi_reg_wr_162:
	mov	0x1a, %r14
	.word 0xf8f389e0  ! 3503: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T3_asi_reg_rd_146:
	mov	0x5, %r14
	.word 0xfcdb8e60  ! 3504: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T3_asi_reg_wr_163:
	mov	0x32, %r14
	.word 0xf8f38e40  ! 3505: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T3_asi_reg_rd_147:
	mov	0x30, %r14
	.word 0xfadb8e40  ! 3506: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_wr_164:
	mov	0x36, %r14
	.word 0xfaf384a0  ! 3508: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xfc2dc000  ! 3510: STB_R	stb	%r30, [%r23 + %r0]
cpu_intr_3_276:
	setx	0x380021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22c8000  ! 3513: STB_R	stb	%r25, [%r18 + %r0]
cpu_intr_3_277:
	setx	0x39001b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_148:
	mov	0x2f, %r14
	.word 0xf6db8e80  ! 3518: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_3_278:
	setx	0x3b0316, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_149:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 3520: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_rd_150:
	mov	0x3c2, %r14
	.word 0xfcdb89e0  ! 3522: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_3_279:
	setx	0x390319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1643801  ! 3531: MOVcc_I	<illegal instruction>
	.word 0xf27561fa  ! 3539: STX_I	stx	%r25, [%r21 + 0x01fa]
	.word 0xf23561d5  ! 3540: STH_I	sth	%r25, [%r21 + 0x01d5]
T3_asi_reg_wr_165:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 3542: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfcb48020  ! 3544: STHA_R	stha	%r30, [%r18 + %r0] 0x01
T3_asi_reg_wr_166:
	mov	0x3c8, %r14
	.word 0xf8f384a0  ! 3545: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf6ac8020  ! 3546: STBA_R	stba	%r27, [%r18 + %r0] 0x01
cpu_intr_3_280:
	setx	0x390323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xa1902000  ! 3552: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xf0ad4020  ! 3553: STBA_R	stba	%r24, [%r21 + %r0] 0x01
iob_intr_3_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_246), 16, 16)) -> intp(3, 0, d)
	.word 0xf0b460a4  ! 3559: STHA_I	stha	%r24, [%r17 + 0x00a4] %asi
	.word 0xfe2c20ad  ! 3562: STB_I	stb	%r31, [%r16 + 0x00ad]
T3_asi_reg_rd_151:
	mov	0x2, %r14
	.word 0xfedb8e40  ! 3563: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_3_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_247), 16, 16)) -> intp(3, 0, 5)
	.word 0xba1cc000  ! 3567: XOR_R	xor 	%r19, %r0, %r29
	setx	data_start_4, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982f18  ! 3568: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f18, %hpstate
T3_asi_reg_wr_167:
	mov	0x33, %r14
	.word 0xf2f38e60  ! 3572: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xfeb44020  ! 3573: STHA_R	stha	%r31, [%r17 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_248), 16, 16)) -> intp(3, 0, 11)
	.word 0xf8f4e1ee  ! 3578: STXA_I	stxa	%r28, [%r19 + 0x01ee] %asi
	.word 0x8594203c  ! 3581: WRPR_TSTATE_I	wrpr	%r16, 0x003c, %tstate
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
	.word 0xfcf4a0fe  ! 3589: STXA_I	stxa	%r30, [%r18 + 0x00fe] %asi
	.word 0xf02dc000  ! 3590: STB_R	stb	%r24, [%r23 + %r0]
T3_asi_reg_rd_152:
	mov	0x0, %r14
	.word 0xfedb8e80  ! 3593: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb9348000  ! 3595: SRL_R	srl 	%r18, %r0, %r28
	.word 0xfc2ca0aa  ! 3596: STB_I	stb	%r30, [%r18 + 0x00aa]
cpu_intr_3_281:
	setx	0x390212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6248000  ! 3598: STW_R	stw	%r27, [%r18 + %r0]
	.word 0xf8b58020  ! 3600: STHA_R	stha	%r28, [%r22 + %r0] 0x01
	.word 0xf6b5e032  ! 3602: STHA_I	stha	%r27, [%r23 + 0x0032] %asi
	.word 0xb4054000  ! 3604: ADD_R	add 	%r21, %r0, %r26
	.word 0xfca5a112  ! 3605: STWA_I	stwa	%r30, [%r22 + 0x0112] %asi
	.word 0xfead20ed  ! 3607: STBA_I	stba	%r31, [%r20 + 0x00ed] %asi
T3_asi_reg_wr_168:
	mov	0x11, %r14
	.word 0xf2f38e80  ! 3608: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T3_asi_reg_rd_153:
	mov	0xe, %r14
	.word 0xf4db8e80  ! 3609: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbe044000  ! 3614: ADD_R	add 	%r17, %r0, %r31
	.word 0xf4f4a16f  ! 3615: STXA_I	stxa	%r26, [%r18 + 0x016f] %asi
	.word 0xf035e0dd  ! 3617: STH_I	sth	%r24, [%r23 + 0x00dd]
	.word 0xf425c000  ! 3618: STW_R	stw	%r26, [%r23 + %r0]
	.word 0xbabc4000  ! 3621: XNORcc_R	xnorcc 	%r17, %r0, %r29
T3_asi_reg_rd_154:
	mov	0x1c, %r14
	.word 0xfcdb8400  ! 3622: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	ta	T_CHANGE_TO_TL0
	.word 0xf02d0000  ! 3628: STB_R	stb	%r24, [%r20 + %r0]
T3_asi_reg_rd_155:
	mov	0x13, %r14
	.word 0xf2db89e0  ! 3629: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xfeb4c020  ! 3630: STHA_R	stha	%r31, [%r19 + %r0] 0x01
iob_intr_3_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_249), 16, 16)) -> intp(3, 0, 3f)
	.word 0xfa344000  ! 3636: STH_R	sth	%r29, [%r17 + %r0]
cpu_intr_3_282:
	setx	0x10131, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982d02  ! 3639: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d02, %hpstate
	.word 0xb6a54000  ! 3641: SUBcc_R	subcc 	%r21, %r0, %r27
	.word 0xfcac0020  ! 3642: STBA_R	stba	%r30, [%r16 + %r0] 0x01
	.word 0xfc754000  ! 3643: STX_R	stx	%r30, [%r21 + %r0]
cpu_intr_3_283:
	setx	0x3f0200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb57c6401  ! 3648: MOVR_I	movre	%r17, 0x1, %r26
	ta	T_CHANGE_HPRIV
cpu_intr_3_284:
	setx	0x3d001c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_250), 16, 16)) -> intp(3, 0, 23)
iob_intr_3_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_251), 16, 16)) -> intp(3, 0, 36)
iob_intr_3_252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_252), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf2748000  ! 3656: STX_R	stx	%r25, [%r18 + %r0]
T3_asi_reg_rd_156:
	mov	0x15, %r14
	.word 0xf6db8e80  ! 3657: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xf62c6141  ! 3661: STB_I	stb	%r27, [%r17 + 0x0141]
	.word 0xb024c000  ! 3662: SUB_R	sub 	%r19, %r0, %r24
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_NONHPRIV
	.word 0xf4ad8020  ! 3674: STBA_R	stba	%r26, [%r22 + %r0] 0x01
T3_asi_reg_wr_169:
	mov	0xe, %r14
	.word 0xfcf38400  ! 3675: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf87561fd  ! 3679: STX_I	stx	%r28, [%r21 + 0x01fd]
cpu_intr_3_285:
	setx	0x3f011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xa1902001  ! 3682: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xfc25c000  ! 3684: STW_R	stw	%r30, [%r23 + %r0]
iob_intr_3_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_253), 16, 16)) -> intp(3, 0, f)
	.word 0xf42c21d1  ! 3689: STB_I	stb	%r26, [%r16 + 0x01d1]
iob_intr_3_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_254), 16, 16)) -> intp(3, 0, 8)
iob_intr_3_255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_255), 16, 16)) -> intp(3, 0, 23)
T3_asi_reg_wr_170:
	mov	0x3c8, %r14
	.word 0xf8f38e40  ! 3694: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfcb4e082  ! 3695: STHA_I	stha	%r30, [%r19 + 0x0082] %asi
	.word 0xf6b58020  ! 3698: STHA_R	stha	%r27, [%r22 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_286:
	setx	0x3e0104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb5206e  ! 3704: STHA_I	stha	%r31, [%r20 + 0x006e] %asi
	.word 0xf82c0000  ! 3706: STB_R	stb	%r28, [%r16 + %r0]
	.word 0xb284e1b8  ! 3707: ADDcc_I	addcc 	%r19, 0x01b8, %r25
cpu_intr_3_287:
	setx	0x3e0221, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_256), 16, 16)) -> intp(3, 0, 5)
	.word 0xf22d60dd  ! 3710: STB_I	stb	%r25, [%r21 + 0x00dd]
	.word 0xb93d1000  ! 3711: SRAX_R	srax	%r20, %r0, %r28
	.word 0xb435a0a3  ! 3712: ORN_I	orn 	%r22, 0x00a3, %r26
T3_asi_reg_rd_157:
	mov	0x16, %r14
	.word 0xfcdb8e40  ! 3715: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfab46099  ! 3718: STHA_I	stha	%r29, [%r17 + 0x0099] %asi
	.word 0xfead2171  ! 3722: STBA_I	stba	%r31, [%r20 + 0x0171] %asi
iob_intr_3_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_257), 16, 16)) -> intp(3, 0, e)
cpu_intr_3_288:
	setx	0x3f0320, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_258), 16, 16)) -> intp(3, 0, 28)
cpu_intr_3_289:
	setx	0x3f0210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22d8000  ! 3730: STB_R	stb	%r25, [%r22 + %r0]
iob_intr_3_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_259), 16, 16)) -> intp(3, 0, 2e)
	.word 0xfa34a06c  ! 3737: STH_I	sth	%r29, [%r18 + 0x006c]
	.word 0xb63c8000  ! 3739: XNOR_R	xnor 	%r18, %r0, %r27
	.word 0xf674c000  ! 3740: STX_R	stx	%r27, [%r19 + %r0]
	.word 0xf62d214a  ! 3742: STB_I	stb	%r27, [%r20 + 0x014a]
cpu_intr_3_290:
	setx	0x3e033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a561c5  ! 3747: STWA_I	stwa	%r27, [%r21 + 0x01c5] %asi
	.word 0xf62de199  ! 3748: STB_I	stb	%r27, [%r23 + 0x0199]
cpu_intr_3_291:
	setx	0x3d023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6358000  ! 3751: STH_R	sth	%r27, [%r22 + %r0]
	ta	T_CHANGE_TO_TL0
	.word 0xf62c204d  ! 3755: STB_I	stb	%r27, [%r16 + 0x004d]
T3_asi_reg_wr_171:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 3758: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf6354000  ! 3761: STH_R	sth	%r27, [%r21 + %r0]
T3_asi_reg_rd_158:
	mov	0x3c8, %r14
	.word 0xf4db8400  ! 3762: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xfcf52163  ! 3766: STXA_I	stxa	%r30, [%r20 + 0x0163] %asi
T3_asi_reg_rd_159:
	mov	0x3c2, %r14
	.word 0xf6db84a0  ! 3769: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbe054000  ! 3770: ADD_R	add 	%r21, %r0, %r31
T3_asi_reg_rd_160:
	mov	0x3c6, %r14
	.word 0xf0db8e40  ! 3771: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfaa54020  ! 3772: STWA_R	stwa	%r29, [%r21 + %r0] 0x01
	.word 0xb82d4000  ! 3774: ANDN_R	andn 	%r21, %r0, %r28
cpu_intr_3_292:
	setx	0x3e0117, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_161:
	mov	0x7, %r14
	.word 0xfcdb8e40  ! 3777: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_3_293:
	setx	0x3e000c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_260), 16, 16)) -> intp(3, 0, 17)
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982aca  ! 3785: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0aca, %hpstate
	.word 0xf42ca12d  ! 3791: STB_I	stb	%r26, [%r18 + 0x012d]
cpu_intr_3_294:
	setx	0x3e0316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc0d614c  ! 3794: AND_I	and 	%r21, 0x014c, %r30
cpu_intr_3_295:
	setx	0x3d023b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_296:
	setx	0x3c0102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_297:
	setx	0x3f031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe24c000  ! 3801: STW_R	stw	%r31, [%r19 + %r0]
	.word 0xf6346020  ! 3802: STH_I	sth	%r27, [%r17 + 0x0020]
iob_intr_3_261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_261), 16, 16)) -> intp(3, 0, d)
cpu_intr_3_298:
	setx	0x3d0121, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
cpu_intr_3_299:
	setx	0x3c0101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb045a067  ! 3815: ADDC_I	addc 	%r22, 0x0067, %r24
T3_asi_reg_rd_162:
	mov	0x3c8, %r14
	.word 0xf0db8e80  ! 3816: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	setx	data_start_4, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983f10  ! 3817: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f10, %hpstate
	.word 0xfa740000  ! 3820: STX_R	stx	%r29, [%r16 + %r0]
	.word 0xfef56132  ! 3824: STXA_I	stxa	%r31, [%r21 + 0x0132] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb8a50000  ! 3826: SUBcc_R	subcc 	%r20, %r0, %r28
	.word 0xf4340000  ! 3830: STH_R	sth	%r26, [%r16 + %r0]
	.word 0xb2b48000  ! 3832: ORNcc_R	orncc 	%r18, %r0, %r25
T3_asi_reg_wr_172:
	mov	0x20, %r14
	.word 0xf4f389e0  ! 3834: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf4750000  ! 3837: STX_R	stx	%r26, [%r20 + %r0]
	.word 0xf0ad4020  ! 3839: STBA_R	stba	%r24, [%r21 + %r0] 0x01
	.word 0xb6040000  ! 3845: ADD_R	add 	%r16, %r0, %r27
T3_asi_reg_rd_163:
	mov	0x3c8, %r14
	.word 0xfcdb84a0  ! 3847: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_3_300:
	setx	0x3f0132, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_173:
	mov	0x35, %r14
	.word 0xfaf38e80  ! 3850: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf274a1d4  ! 3851: STX_I	stx	%r25, [%r18 + 0x01d4]
T3_asi_reg_rd_164:
	mov	0x14, %r14
	.word 0xfcdb89e0  ! 3853: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T3_asi_reg_wr_174:
	mov	0x27, %r14
	.word 0xfef389e0  ! 3854: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_3_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_262), 16, 16)) -> intp(3, 0, 36)
	.word 0xfaac8020  ! 3856: STBA_R	stba	%r29, [%r18 + %r0] 0x01
	.word 0xbe3dc000  ! 3857: XNOR_R	xnor 	%r23, %r0, %r31
	.word 0xfcf56080  ! 3858: STXA_I	stxa	%r30, [%r21 + 0x0080] %asi
	.word 0xfcf5a06d  ! 3860: STXA_I	stxa	%r30, [%r22 + 0x006d] %asi
	.word 0xfa2d0000  ! 3861: STB_R	stb	%r29, [%r20 + %r0]
cpu_intr_3_301:
	setx	0x3f0215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa25c000  ! 3868: STW_R	stw	%r29, [%r23 + %r0]
	.word 0xfc340000  ! 3869: STH_R	sth	%r30, [%r16 + %r0]
	.word 0xfe34c000  ! 3871: STH_R	sth	%r31, [%r19 + %r0]
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983e0a  ! 3873: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e0a, %hpstate
	.word 0xf0348000  ! 3874: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xb93c2001  ! 3875: SRA_I	sra 	%r16, 0x0001, %r28
iob_intr_3_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_263), 16, 16)) -> intp(3, 0, 33)
T3_asi_reg_rd_165:
	mov	0x2a, %r14
	.word 0xfcdb8e80  ! 3877: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf67421a8  ! 3878: STX_I	stx	%r27, [%r16 + 0x01a8]
T3_asi_reg_wr_175:
	mov	0x11, %r14
	.word 0xfef38e40  ! 3879: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf6a42075  ! 3882: STWA_I	stwa	%r27, [%r16 + 0x0075] %asi
	.word 0xf47521fe  ! 3886: STX_I	stx	%r26, [%r20 + 0x01fe]
	.word 0xf4756103  ! 3887: STX_I	stx	%r26, [%r21 + 0x0103]
	ta	T_CHANGE_TO_TL0
iob_intr_3_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_264), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_wr_176:
	mov	0x9, %r14
	.word 0xf0f38e40  ! 3894: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfe258000  ! 3895: STW_R	stw	%r31, [%r22 + %r0]
	.word 0xf2a5e01f  ! 3896: STWA_I	stwa	%r25, [%r23 + 0x001f] %asi
iob_intr_3_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_265), 16, 16)) -> intp(3, 0, d)
	.word 0xba85a1b9  ! 3899: ADDcc_I	addcc 	%r22, 0x01b9, %r29
T3_asi_reg_rd_166:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 3900: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xba25a1e3  ! 3901: SUB_I	sub 	%r22, 0x01e3, %r29
iob_intr_3_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_266), 16, 16)) -> intp(3, 0, 35)
	.word 0xf6256080  ! 3904: STW_I	stw	%r27, [%r21 + 0x0080]
iob_intr_3_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_267), 16, 16)) -> intp(3, 0, 2e)
iob_intr_3_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_268), 16, 16)) -> intp(3, 0, 3b)
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983f4a  ! 3907: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f4a, %hpstate
T3_asi_reg_wr_177:
	mov	0x29, %r14
	.word 0xf0f38e80  ! 3910: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_3_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_269), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_wr_178:
	mov	0xb, %r14
	.word 0xf2f38e80  ! 3914: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T3_asi_reg_wr_179:
	mov	0x10, %r14
	.word 0xf4f38400  ! 3915: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbab4a0d9  ! 3917: SUBCcc_I	orncc 	%r18, 0x00d9, %r29
	ta	T_CHANGE_TO_TL0
cpu_intr_3_302:
	setx	0x3f0221, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_270), 16, 16)) -> intp(3, 0, 12)
	.word 0xfe2c0000  ! 3921: STB_R	stb	%r31, [%r16 + %r0]
	ta	T_CHANGE_TO_TL1
	.word 0xfaf5e070  ! 3923: STXA_I	stxa	%r29, [%r23 + 0x0070] %asi
	.word 0xfaf4206b  ! 3926: STXA_I	stxa	%r29, [%r16 + 0x006b] %asi
	.word 0xbac40000  ! 3927: ADDCcc_R	addccc 	%r16, %r0, %r29
cpu_intr_3_303:
	setx	0x3f000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02ca16f  ! 3931: STB_I	stb	%r24, [%r18 + 0x016f]
T3_asi_reg_wr_180:
	mov	0x3c6, %r14
	.word 0xf4f389e0  ! 3933: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_3_304:
	setx	0x3c033c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_181:
	mov	0x3c1, %r14
	.word 0xf8f38e60  ! 3939: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf0358000  ! 3940: STH_R	sth	%r24, [%r22 + %r0]
	.word 0xb48c8000  ! 3942: ANDcc_R	andcc 	%r18, %r0, %r26
iob_intr_3_271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_271), 16, 16)) -> intp(3, 0, 11)
	.word 0xfc24a100  ! 3946: STW_I	stw	%r30, [%r18 + 0x0100]
cpu_intr_3_305:
	setx	0x3f0115, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_306:
	setx	0x3c0210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b5e111  ! 3953: STHA_I	stha	%r27, [%r23 + 0x0111] %asi
T3_asi_reg_rd_167:
	mov	0x20, %r14
	.word 0xf4db8e40  ! 3954: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_272), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf2ac4020  ! 3957: STBA_R	stba	%r25, [%r17 + %r0] 0x01
	.word 0xf0754000  ! 3958: STX_R	stx	%r24, [%r21 + %r0]
	.word 0xfa24c000  ! 3961: STW_R	stw	%r29, [%r19 + %r0]
iob_intr_3_273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_273), 16, 16)) -> intp(3, 0, 1d)
cpu_intr_3_307:
	setx	0x3f0339, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_168:
	mov	0x12, %r14
	.word 0xfcdb8e60  ! 3967: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf025c000  ! 3968: STW_R	stw	%r24, [%r23 + %r0]
cpu_intr_3_308:
	setx	0x3e013b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_182:
	mov	0x3c5, %r14
	.word 0xfaf389e0  ! 3976: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_3_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_274), 16, 16)) -> intp(3, 0, 26)
iob_intr_3_275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_275), 16, 16)) -> intp(3, 0, d)
	.word 0xfcf5a125  ! 3988: STXA_I	stxa	%r30, [%r22 + 0x0125] %asi
	.word 0xf4b5215a  ! 3990: STHA_I	stha	%r26, [%r20 + 0x015a] %asi
iob_intr_3_276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_276), 16, 16)) -> intp(3, 0, 37)
iob_intr_3_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_277), 16, 16)) -> intp(3, 0, 25)
cpu_intr_3_309:
	setx	0x3f031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8594a17f  ! 4003: WRPR_TSTATE_I	wrpr	%r18, 0x017f, %tstate
T3_asi_reg_rd_169:
	mov	0x2b, %r14
	.word 0xf0db8400  ! 4008: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_3_310:
	setx	0x3f023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42521d3  ! 4010: STW_I	stw	%r26, [%r20 + 0x01d3]
cpu_intr_3_311:
	setx	0x3f0020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe74205b  ! 4015: STX_I	stx	%r31, [%r16 + 0x005b]
	.word 0xf8b4c020  ! 4017: STHA_R	stha	%r28, [%r19 + %r0] 0x01
iob_intr_3_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_278), 16, 16)) -> intp(3, 0, 2b)
cpu_intr_3_312:
	setx	0x3f0020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa58020  ! 4022: STWA_R	stwa	%r29, [%r22 + %r0] 0x01
iob_intr_3_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_279), 16, 16)) -> intp(3, 0, 1d)
iob_intr_3_280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_280), 16, 16)) -> intp(3, 0, 21)
	.word 0xfe2c4000  ! 4025: STB_R	stb	%r31, [%r17 + %r0]
iob_intr_3_281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_281), 16, 16)) -> intp(3, 0, c)
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982cc2  ! 4030: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc2, %hpstate
	.word 0xbb643801  ! 4033: MOVcc_I	<illegal instruction>
cpu_intr_3_313:
	setx	0x3e0126, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_314:
	setx	0x3f012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba854000  ! 4039: ADDcc_R	addcc 	%r21, %r0, %r29
cpu_intr_3_315:
	setx	0x3f0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12c3001  ! 4042: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0xfc258000  ! 4046: STW_R	stw	%r30, [%r22 + %r0]
cpu_intr_3_316:
	setx	0x3f0004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb32dc000  ! 4049: SLL_R	sll 	%r23, %r0, %r25
	.word 0xf4f4e19c  ! 4053: STXA_I	stxa	%r26, [%r19 + 0x019c] %asi
cpu_intr_3_317:
	setx	0x3f0339, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_282), 16, 16)) -> intp(3, 0, 3c)
T3_asi_reg_wr_183:
	mov	0x1d, %r14
	.word 0xfaf38e40  ! 4059: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf835c000  ! 4061: STH_R	sth	%r28, [%r23 + %r0]
cpu_intr_3_318:
	setx	0x3c0315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb32d4000  ! 4066: SLL_R	sll 	%r21, %r0, %r25
	.word 0xfcb4a0e2  ! 4072: STHA_I	stha	%r30, [%r18 + 0x00e2] %asi
	.word 0xf2a4213b  ! 4073: STWA_I	stwa	%r25, [%r16 + 0x013b] %asi
	.word 0xb951c000  ! 4074: RDPR_TL	rdpr	%tl, %r28
	.word 0xfeace1c9  ! 4078: STBA_I	stba	%r31, [%r19 + 0x01c9] %asi
	.word 0xf42ce0bd  ! 4081: STB_I	stb	%r26, [%r19 + 0x00bd]
	.word 0xfab40020  ! 4082: STHA_R	stha	%r29, [%r16 + %r0] 0x01
iob_intr_3_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_283), 16, 16)) -> intp(3, 0, 2f)
T3_asi_reg_wr_184:
	mov	0x1b, %r14
	.word 0xfaf38e60  ! 4084: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_3_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_284), 16, 16)) -> intp(3, 0, f)
T3_asi_reg_rd_170:
	mov	0x34, %r14
	.word 0xf2db84a0  ! 4088: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf4a5a161  ! 4093: STWA_I	stwa	%r26, [%r22 + 0x0161] %asi
	.word 0xf42de169  ! 4094: STB_I	stb	%r26, [%r23 + 0x0169]
	.word 0xfa2cc000  ! 4095: STB_R	stb	%r29, [%r19 + %r0]
iob_intr_3_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_285), 16, 16)) -> intp(3, 0, 2)
iob_intr_3_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_286), 16, 16)) -> intp(3, 0, 2e)
	ta	T_CHANGE_NONHPRIV
	.word 0xfead0020  ! 4103: STBA_R	stba	%r31, [%r20 + %r0] 0x01
	.word 0xf42d61b6  ! 4108: STB_I	stb	%r26, [%r21 + 0x01b6]
iob_intr_3_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_287), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_319:
	setx	0x42010d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_171:
	mov	0x3c7, %r14
	.word 0xf0db84a0  ! 4112: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf6b5c020  ! 4115: STHA_R	stha	%r27, [%r23 + %r0] 0x01
cpu_intr_3_320:
	setx	0x40001a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_185:
	mov	0x22, %r14
	.word 0xfaf384a0  ! 4120: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_3_321:
	setx	0x420218, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_288), 16, 16)) -> intp(3, 0, 26)
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983b5a  ! 4124: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b5a, %hpstate
	ta	T_CHANGE_TO_TL0
	.word 0xf2344000  ! 4127: STH_R	sth	%r25, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0xf8b5c020  ! 4131: STHA_R	stha	%r28, [%r23 + %r0] 0x01
T3_asi_reg_wr_186:
	mov	0x25, %r14
	.word 0xfcf38e80  ! 4132: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_3_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_289), 16, 16)) -> intp(3, 0, 2c)
cpu_intr_3_322:
	setx	0x400325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a4e14c  ! 4137: STWA_I	stwa	%r25, [%r19 + 0x014c] %asi
	.word 0xf4356120  ! 4140: STH_I	sth	%r26, [%r21 + 0x0120]
	.word 0xfeb54020  ! 4143: STHA_R	stha	%r31, [%r21 + %r0] 0x01
	.word 0xf4ade0ff  ! 4148: STBA_I	stba	%r26, [%r23 + 0x00ff] %asi
	.word 0xb60560e8  ! 4149: ADD_I	add 	%r21, 0x00e8, %r27
	.word 0xfa2ca1e1  ! 4150: STB_I	stb	%r29, [%r18 + 0x01e1]
	.word 0xb72cd000  ! 4152: SLLX_R	sllx	%r19, %r0, %r27
	.word 0xfcf5201f  ! 4155: STXA_I	stxa	%r30, [%r20 + 0x001f] %asi
	.word 0xfc2cc000  ! 4159: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xb52d4000  ! 4160: SLL_R	sll 	%r21, %r0, %r26
cpu_intr_3_323:
	setx	0x400006, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_290), 16, 16)) -> intp(3, 0, 23)
cpu_intr_3_324:
	setx	0x400028, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_325:
	setx	0x41011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab4c020  ! 4169: STHA_R	stha	%r29, [%r19 + %r0] 0x01
	.word 0xf47461aa  ! 4172: STX_I	stx	%r26, [%r17 + 0x01aa]
T3_asi_reg_wr_187:
	mov	0x3c8, %r14
	.word 0xf6f38e60  ! 4173: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf8750000  ! 4177: STX_R	stx	%r28, [%r20 + %r0]
cpu_intr_3_326:
	setx	0x420131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0246191  ! 4181: STW_I	stw	%r24, [%r17 + 0x0191]
	.word 0xf6a50020  ! 4186: STWA_R	stwa	%r27, [%r20 + %r0] 0x01
T3_asi_reg_rd_172:
	mov	0x1c, %r14
	.word 0xf6db8400  ! 4188: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xfc7421ac  ! 4189: STX_I	stx	%r30, [%r16 + 0x01ac]
T3_asi_reg_rd_173:
	mov	0x25, %r14
	.word 0xf8db84a0  ! 4194: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_3_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_291), 16, 16)) -> intp(3, 0, 26)
	.word 0xfc740000  ! 4204: STX_R	stx	%r30, [%r16 + %r0]
	ta	T_CHANGE_TO_TL0
	.word 0xfeac60ec  ! 4208: STBA_I	stba	%r31, [%r17 + 0x00ec] %asi
cpu_intr_3_327:
	setx	0x420222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ace0d1  ! 4214: STBA_I	stba	%r28, [%r19 + 0x00d1] %asi
T3_asi_reg_wr_188:
	mov	0x20, %r14
	.word 0xf6f384a0  ! 4216: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_3_328:
	setx	0x420123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a5a1bf  ! 4218: STWA_I	stwa	%r25, [%r22 + 0x01bf] %asi
	.word 0xfea50020  ! 4223: STWA_R	stwa	%r31, [%r20 + %r0] 0x01
	.word 0xfc248000  ! 4224: STW_R	stw	%r30, [%r18 + %r0]
	.word 0xfeace144  ! 4225: STBA_I	stba	%r31, [%r19 + 0x0144] %asi
iob_intr_3_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_292), 16, 16)) -> intp(3, 0, 34)
T3_asi_reg_wr_189:
	mov	0x6, %r14
	.word 0xf6f38e60  ! 4229: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T3_asi_reg_wr_190:
	mov	0x3c7, %r14
	.word 0xf2f38400  ! 4232: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982948  ! 4237: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0948, %hpstate
T3_asi_reg_rd_174:
	mov	0x3c4, %r14
	.word 0xf2db8e40  ! 4239: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf02c203b  ! 4240: STB_I	stb	%r24, [%r16 + 0x003b]
T3_asi_reg_rd_175:
	mov	0x3c3, %r14
	.word 0xf0db8e80  ! 4242: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xf83421a2  ! 4244: STH_I	sth	%r28, [%r16 + 0x01a2]
iob_intr_3_293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_293), 16, 16)) -> intp(3, 0, 5)
cpu_intr_3_329:
	setx	0x430123, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_294), 16, 16)) -> intp(3, 0, 1c)
cpu_intr_3_330:
	setx	0x42012e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_295), 16, 16)) -> intp(3, 0, 20)
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_331:
	setx	0x40013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbead8000  ! 4265: ANDNcc_R	andncc 	%r22, %r0, %r31
	.word 0xb73c9000  ! 4269: SRAX_R	srax	%r18, %r0, %r27
	.word 0xf42d6187  ! 4270: STB_I	stb	%r26, [%r21 + 0x0187]
T3_asi_reg_rd_176:
	mov	0x1a, %r14
	.word 0xfcdb89e0  ! 4271: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_3_332:
	setx	0x430334, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_333:
	setx	0x400222, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_177:
	mov	0x13, %r14
	.word 0xf4db8e40  ! 4277: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_rd_178:
	mov	0x37, %r14
	.word 0xfcdb8e60  ! 4278: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_3_334:
	setx	0x420005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf634e1a4  ! 4280: STH_I	sth	%r27, [%r19 + 0x01a4]
cpu_intr_3_335:
	setx	0x43001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_336:
	setx	0x41033f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_337:
	setx	0x42022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8248000  ! 4290: STW_R	stw	%r28, [%r18 + %r0]
iob_intr_3_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_296), 16, 16)) -> intp(3, 0, 4)
cpu_intr_3_338:
	setx	0x430103, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_339:
	setx	0x40011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ad0020  ! 4299: STBA_R	stba	%r25, [%r20 + %r0] 0x01
cpu_intr_3_340:
	setx	0x420302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf824c000  ! 4302: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xb60c8000  ! 4304: AND_R	and 	%r18, %r0, %r27
	.word 0xf8ac0020  ! 4305: STBA_R	stba	%r28, [%r16 + %r0] 0x01
T3_asi_reg_rd_179:
	mov	0x21, %r14
	.word 0xfedb8e40  ! 4308: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf4ad8020  ! 4309: STBA_R	stba	%r26, [%r22 + %r0] 0x01
	.word 0xbf2d0000  ! 4310: SLL_R	sll 	%r20, %r0, %r31
iob_intr_3_297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_297), 16, 16)) -> intp(3, 0, a)
T3_asi_reg_rd_180:
	mov	0x3c4, %r14
	.word 0xf6db84a0  ! 4314: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf8b56180  ! 4315: STHA_I	stha	%r28, [%r21 + 0x0180] %asi
iob_intr_3_298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_298), 16, 16)) -> intp(3, 0, 2d)
cpu_intr_3_341:
	setx	0x42021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a4a1f9  ! 4321: STWA_I	stwa	%r27, [%r18 + 0x01f9] %asi
	ta	T_CHANGE_TO_TL1
cpu_intr_3_342:
	setx	0x42013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3508000  ! 4326: RDPR_TSTATE	rdpr	%tstate, %r25
T3_asi_reg_wr_191:
	mov	0x34, %r14
	.word 0xf2f384a0  ! 4327: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T3_asi_reg_rd_181:
	mov	0xd, %r14
	.word 0xfadb8e60  ! 4328: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbe256019  ! 4329: SUB_I	sub 	%r21, 0x0019, %r31
cpu_intr_3_343:
	setx	0x430030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6acc020  ! 4333: STBA_R	stba	%r27, [%r19 + %r0] 0x01
	.word 0xb835e1fd  ! 4334: SUBC_I	orn 	%r23, 0x01fd, %r28
T3_asi_reg_wr_192:
	mov	0x3c2, %r14
	.word 0xfcf38e40  ! 4337: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	ta	T_CHANGE_NONHPRIV
	.word 0xbf643801  ! 4342: MOVcc_I	<illegal instruction>
	.word 0xf275e05a  ! 4343: STX_I	stx	%r25, [%r23 + 0x005a]
	.word 0xf2ace1b9  ! 4345: STBA_I	stba	%r25, [%r19 + 0x01b9] %asi
T3_asi_reg_wr_193:
	mov	0x3c5, %r14
	.word 0xf6f38e60  ! 4348: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T3_asi_reg_rd_182:
	mov	0x3c0, %r14
	.word 0xf4db8e60  ! 4350: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T3_asi_reg_wr_194:
	mov	0x3c1, %r14
	.word 0xf4f38e60  ! 4352: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xbebc21dc  ! 4353: XNORcc_I	xnorcc 	%r16, 0x01dc, %r31
	ta	T_CHANGE_TO_TL0
	.word 0xf2aca0ac  ! 4356: STBA_I	stba	%r25, [%r18 + 0x00ac] %asi
cpu_intr_3_344:
	setx	0x430036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8acc020  ! 4362: STBA_R	stba	%r28, [%r19 + %r0] 0x01
	.word 0xf2354000  ! 4363: STH_R	sth	%r25, [%r21 + %r0]
	.word 0xfa758000  ! 4364: STX_R	stx	%r29, [%r22 + %r0]
	.word 0xf024a12c  ! 4365: STW_I	stw	%r24, [%r18 + 0x012c]
	.word 0xfe2d4000  ! 4368: STB_R	stb	%r31, [%r21 + %r0]
	.word 0xbe15e0f9  ! 4372: OR_I	or 	%r23, 0x00f9, %r31
	.word 0xba25a162  ! 4373: SUB_I	sub 	%r22, 0x0162, %r29
	.word 0xf6754000  ! 4376: STX_R	stx	%r27, [%r21 + %r0]
T3_asi_reg_wr_195:
	mov	0x1, %r14
	.word 0xf8f384a0  ! 4378: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf2b40020  ! 4380: STHA_R	stha	%r25, [%r16 + %r0] 0x01
iob_intr_3_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_299), 16, 16)) -> intp(3, 0, 9)
	ta	T_CHANGE_NONHPRIV
	.word 0xfa2da09f  ! 4384: STB_I	stb	%r29, [%r22 + 0x009f]
cpu_intr_3_345:
	setx	0x410137, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_300), 16, 16)) -> intp(3, 0, b)
cpu_intr_3_346:
	setx	0x420237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea4e1d1  ! 4392: STWA_I	stwa	%r31, [%r19 + 0x01d1] %asi
	.word 0xf034a0ce  ! 4395: STH_I	sth	%r24, [%r18 + 0x00ce]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb4150000  ! 4400: OR_R	or 	%r20, %r0, %r26
iob_intr_3_301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_301), 16, 16)) -> intp(3, 0, a)
	.word 0xf4a4c020  ! 4403: STWA_R	stwa	%r26, [%r19 + %r0] 0x01
T3_asi_reg_rd_183:
	mov	0x3c7, %r14
	.word 0xfcdb84a0  ! 4404: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb12cf001  ! 4405: SLLX_I	sllx	%r19, 0x0001, %r24
	.word 0xf625c000  ! 4407: STW_R	stw	%r27, [%r23 + %r0]
cpu_intr_3_347:
	setx	0x43003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982b5a  ! 4411: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5a, %hpstate
	.word 0xf2f4e1ac  ! 4412: STXA_I	stxa	%r25, [%r19 + 0x01ac] %asi
	ta	T_CHANGE_HPRIV
cpu_intr_3_348:
	setx	0x400230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe25a0d0  ! 4416: STW_I	stw	%r31, [%r22 + 0x00d0]
	.word 0xf22d8000  ! 4417: STB_R	stb	%r25, [%r22 + %r0]
	.word 0xf0b4e09c  ! 4418: STHA_I	stha	%r24, [%r19 + 0x009c] %asi
cpu_intr_3_349:
	setx	0x420305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6254000  ! 4421: STW_R	stw	%r27, [%r21 + %r0]
	.word 0xf8ad8020  ! 4422: STBA_R	stba	%r28, [%r22 + %r0] 0x01
iob_intr_3_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_302), 16, 16)) -> intp(3, 0, 18)
	.word 0xfe244000  ! 4424: STW_R	stw	%r31, [%r17 + %r0]
T3_asi_reg_rd_184:
	mov	0x2d, %r14
	.word 0xf4db8e40  ! 4425: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_wr_196:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 4427: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfcac8020  ! 4430: STBA_R	stba	%r30, [%r18 + %r0] 0x01
	.word 0xf2a521a9  ! 4431: STWA_I	stwa	%r25, [%r20 + 0x01a9] %asi
	.word 0xfa256149  ! 4433: STW_I	stw	%r29, [%r21 + 0x0149]
cpu_intr_3_350:
	setx	0x430303, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_351:
	setx	0x420239, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_185:
	mov	0x2c, %r14
	.word 0xfcdb8400  ! 4440: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_3_352:
	setx	0x42032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a52089  ! 4444: STWA_I	stwa	%r24, [%r20 + 0x0089] %asi
iob_intr_3_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_303), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf0ade045  ! 4447: STBA_I	stba	%r24, [%r23 + 0x0045] %asi
	.word 0xf42d6095  ! 4448: STB_I	stb	%r26, [%r21 + 0x0095]
	.word 0xf224c000  ! 4451: STW_R	stw	%r25, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
cpu_intr_3_353:
	setx	0x40001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02da122  ! 4455: STB_I	stb	%r24, [%r22 + 0x0122]
cpu_intr_3_354:
	setx	0x40000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4acc020  ! 4460: STBA_R	stba	%r26, [%r19 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
iob_intr_3_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_304), 16, 16)) -> intp(3, 0, 24)
T3_asi_reg_wr_197:
	mov	0x3c5, %r14
	.word 0xfaf38400  ! 4468: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf62c0000  ! 4472: STB_R	stb	%r27, [%r16 + %r0]
	.word 0xf8adc020  ! 4475: STBA_R	stba	%r28, [%r23 + %r0] 0x01
cpu_intr_3_355:
	setx	0x430216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc25a1de  ! 4477: STW_I	stw	%r30, [%r22 + 0x01de]
T3_asi_reg_rd_186:
	mov	0x3c0, %r14
	.word 0xf2db8e80  ! 4478: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T3_asi_reg_wr_198:
	mov	0x26, %r14
	.word 0xfef38e40  ! 4480: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf6ac0020  ! 4481: STBA_R	stba	%r27, [%r16 + %r0] 0x01
	.word 0xf82c211b  ! 4482: STB_I	stb	%r28, [%r16 + 0x011b]
	.word 0xbd3c7001  ! 4483: SRAX_I	srax	%r17, 0x0001, %r30
iob_intr_3_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_305), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_rd_187:
	mov	0x3c5, %r14
	.word 0xfedb8e60  ! 4487: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf82c8000  ! 4490: STB_R	stb	%r28, [%r18 + %r0]
	.word 0xf4b5e05e  ! 4491: STHA_I	stha	%r26, [%r23 + 0x005e] %asi
	.word 0xbe9ca086  ! 4493: XORcc_I	xorcc 	%r18, 0x0086, %r31
T3_asi_reg_rd_188:
	mov	0x2c, %r14
	.word 0xfedb8e60  ! 4495: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_3_356:
	setx	0x40020e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_306), 16, 16)) -> intp(3, 0, 26)
	.word 0xfc244000  ! 4506: STW_R	stw	%r30, [%r17 + %r0]
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983c80  ! 4509: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c80, %hpstate
T3_asi_reg_rd_189:
	mov	0x3c2, %r14
	.word 0xf2db84a0  ! 4512: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_3_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_307), 16, 16)) -> intp(3, 0, 17)
	.word 0xf02da186  ! 4514: STB_I	stb	%r24, [%r22 + 0x0186]
	.word 0xf2748000  ! 4517: STX_R	stx	%r25, [%r18 + %r0]
cpu_intr_3_357:
	setx	0x41032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8d8000  ! 4519: ANDcc_R	andcc 	%r22, %r0, %r30
T3_asi_reg_wr_199:
	mov	0x3c8, %r14
	.word 0xf4f38e40  ! 4521: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_3_358:
	setx	0x410217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a4c020  ! 4523: STWA_R	stwa	%r27, [%r19 + %r0] 0x01
	.word 0xfcb5a1b7  ! 4525: STHA_I	stha	%r30, [%r22 + 0x01b7] %asi
	.word 0xf0ace1b3  ! 4526: STBA_I	stba	%r24, [%r19 + 0x01b3] %asi
	.word 0xb73de001  ! 4527: SRA_I	sra 	%r23, 0x0001, %r27
	.word 0xf2348000  ! 4528: STH_R	sth	%r25, [%r18 + %r0]
iob_intr_3_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_308), 16, 16)) -> intp(3, 0, 7)
iob_intr_3_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_309), 16, 16)) -> intp(3, 0, 24)
	.word 0xf8ad60ce  ! 4541: STBA_I	stba	%r28, [%r21 + 0x00ce] %asi
	.word 0xfcac0020  ! 4542: STBA_R	stba	%r30, [%r16 + %r0] 0x01
	.word 0xfa2cc000  ! 4544: STB_R	stb	%r29, [%r19 + %r0]
iob_intr_3_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_310), 16, 16)) -> intp(3, 0, 25)
T3_asi_reg_rd_190:
	mov	0x15, %r14
	.word 0xf2db8400  ! 4549: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf2248000  ! 4550: STW_R	stw	%r25, [%r18 + %r0]
cpu_intr_3_359:
	setx	0x420116, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_360:
	setx	0x420319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4358000  ! 4553: STH_R	sth	%r26, [%r22 + %r0]
	.word 0xfaace104  ! 4554: STBA_I	stba	%r29, [%r19 + 0x0104] %asi
T3_asi_reg_rd_191:
	mov	0x3c5, %r14
	.word 0xf6db8e40  ! 4555: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_361:
	setx	0x42031a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_362:
	setx	0x410126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2c6123  ! 4559: STB_I	stb	%r31, [%r17 + 0x0123]
T3_asi_reg_wr_200:
	mov	0x3c0, %r14
	.word 0xf2f38e60  ! 4560: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_3_363:
	setx	0x420109, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_201:
	mov	0x3c4, %r14
	.word 0xf4f384a0  ! 4562: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_3_364:
	setx	0x400106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe744000  ! 4567: STX_R	stx	%r31, [%r17 + %r0]
	.word 0xb3518000  ! 4568: RDPR_PSTATE	rdpr	%pstate, %r25
	.word 0xf82c4000  ! 4571: STB_R	stb	%r28, [%r17 + %r0]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_202:
	mov	0x28, %r14
	.word 0xf2f389e0  ! 4573: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	.word 0xfa250000  ! 4579: STW_R	stw	%r29, [%r20 + %r0]
	.word 0xf224a039  ! 4580: STW_I	stw	%r25, [%r18 + 0x0039]
iob_intr_3_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_311), 16, 16)) -> intp(3, 0, 2c)
cpu_intr_3_365:
	setx	0x440319, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_312), 16, 16)) -> intp(3, 0, 2)
T3_asi_reg_rd_192:
	mov	0x28, %r14
	.word 0xf4db8e60  ! 4589: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T3_asi_reg_rd_193:
	mov	0x29, %r14
	.word 0xf6db8400  ! 4590: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982dd8  ! 4591: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd8, %hpstate
	.word 0xba95e03d  ! 4592: ORcc_I	orcc 	%r23, 0x003d, %r29
	.word 0xfa2da0d9  ! 4593: STB_I	stb	%r29, [%r22 + 0x00d9]
cpu_intr_3_366:
	setx	0x470328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcb40000  ! 4596: ORNcc_R	orncc 	%r16, %r0, %r30
cpu_intr_3_367:
	setx	0x470030, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_194:
	mov	0x1f, %r14
	.word 0xf4db8400  ! 4603: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf8a50020  ! 4604: STWA_R	stwa	%r28, [%r20 + %r0] 0x01
	.word 0xf6750000  ! 4605: STX_R	stx	%r27, [%r20 + %r0]
iob_intr_3_313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_313), 16, 16)) -> intp(3, 0, a)
	ta	T_CHANGE_TO_TL0
	.word 0xb035e146  ! 4610: SUBC_I	orn 	%r23, 0x0146, %r24
	.word 0xf6350000  ! 4611: STH_R	sth	%r27, [%r20 + %r0]
	.word 0xb29d8000  ! 4612: XORcc_R	xorcc 	%r22, %r0, %r25
	.word 0xfef4618e  ! 4613: STXA_I	stxa	%r31, [%r17 + 0x018e] %asi
	.word 0xf6346039  ! 4616: STH_I	sth	%r27, [%r17 + 0x0039]
T3_asi_reg_wr_203:
	mov	0x26, %r14
	.word 0xf0f38e80  ! 4619: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_3_368:
	setx	0x45011a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_314), 16, 16)) -> intp(3, 0, a)
	.word 0xb21cc000  ! 4623: XOR_R	xor 	%r19, %r0, %r25
iob_intr_3_315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_315), 16, 16)) -> intp(3, 0, 17)
T3_asi_reg_wr_204:
	mov	0x8, %r14
	.word 0xfcf384a0  ! 4626: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_369:
	setx	0x440239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe2da0fc  ! 4631: ANDN_I	andn 	%r22, 0x00fc, %r31
T3_asi_reg_rd_195:
	mov	0x13, %r14
	.word 0xfadb89e0  ! 4634: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xfaad4020  ! 4637: STBA_R	stba	%r29, [%r21 + %r0] 0x01
T3_asi_reg_rd_196:
	mov	0x25, %r14
	.word 0xf2db8e60  ! 4638: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T3_asi_reg_rd_197:
	mov	0x22, %r14
	.word 0xf8db8e60  ! 4639: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb2344000  ! 4641: ORN_R	orn 	%r17, %r0, %r25
iob_intr_3_316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_316), 16, 16)) -> intp(3, 0, f)
T3_asi_reg_wr_205:
	mov	0x3c1, %r14
	.word 0xfcf38400  ! 4647: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb93d9000  ! 4648: SRAX_R	srax	%r22, %r0, %r28
	.word 0xf875602d  ! 4649: STX_I	stx	%r28, [%r21 + 0x002d]
iob_intr_3_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_317), 16, 16)) -> intp(3, 0, 1d)
cpu_intr_3_370:
	setx	0x46030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4746002  ! 4656: STX_I	stx	%r26, [%r17 + 0x0002]
T3_asi_reg_wr_206:
	mov	0x3c4, %r14
	.word 0xf8f384a0  ! 4657: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_3_371:
	setx	0x47002d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_372:
	setx	0x460310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a5e0d2  ! 4661: STWA_I	stwa	%r27, [%r23 + 0x00d2] %asi
iob_intr_3_318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_318), 16, 16)) -> intp(3, 0, 0)
	ta	T_CHANGE_TO_TL1
	.word 0xf4350000  ! 4664: STH_R	sth	%r26, [%r20 + %r0]
	.word 0xfe3461c8  ! 4665: STH_I	sth	%r31, [%r17 + 0x01c8]
	.word 0xf8ac8020  ! 4666: STBA_R	stba	%r28, [%r18 + %r0] 0x01
	.word 0xf2a56016  ! 4667: STWA_I	stwa	%r25, [%r21 + 0x0016] %asi
iob_intr_3_319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_319), 16, 16)) -> intp(3, 0, 3)
T3_asi_reg_wr_207:
	mov	0x3c5, %r14
	.word 0xf2f38e40  ! 4669: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfc240000  ! 4671: STW_R	stw	%r30, [%r16 + %r0]
iob_intr_3_320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_320), 16, 16)) -> intp(3, 0, c)
T3_asi_reg_rd_198:
	mov	0x27, %r14
	.word 0xfedb8e40  ! 4674: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_3_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_321), 16, 16)) -> intp(3, 0, 33)
cpu_intr_3_373:
	setx	0x440112, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_374:
	setx	0x440015, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_199:
	mov	0x3c7, %r14
	.word 0xfedb89e0  ! 4681: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf6ad4020  ! 4682: STBA_R	stba	%r27, [%r21 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
iob_intr_3_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_322), 16, 16)) -> intp(3, 0, 18)
	.word 0xf2acc020  ! 4687: STBA_R	stba	%r25, [%r19 + %r0] 0x01
	.word 0xf8b52053  ! 4688: STHA_I	stha	%r28, [%r20 + 0x0053] %asi
T3_asi_reg_rd_200:
	mov	0x1e, %r14
	.word 0xf8db89e0  ! 4690: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xfc2d6183  ! 4699: STB_I	stb	%r30, [%r21 + 0x0183]
	.word 0xf02c20b7  ! 4700: STB_I	stb	%r24, [%r16 + 0x00b7]
T3_asi_reg_wr_208:
	mov	0x9, %r14
	.word 0xf6f384a0  ! 4701: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_3_375:
	setx	0x47012f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_323), 16, 16)) -> intp(3, 0, 35)
	setx	data_start_4, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982b80  ! 4709: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b80, %hpstate
	ta	T_CHANGE_TO_TL1
	.word 0xfe2d8000  ! 4717: STB_R	stb	%r31, [%r22 + %r0]
	.word 0xfc2c0000  ! 4719: STB_R	stb	%r30, [%r16 + %r0]
iob_intr_3_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_324), 16, 16)) -> intp(3, 0, 3a)
iob_intr_3_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_325), 16, 16)) -> intp(3, 0, 22)
T3_asi_reg_wr_209:
	mov	0x9, %r14
	.word 0xf0f38e40  ! 4724: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb635e1e5  ! 4725: ORN_I	orn 	%r23, 0x01e5, %r27
T3_asi_reg_rd_201:
	mov	0x11, %r14
	.word 0xf4db89e0  ! 4727: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T3_asi_reg_wr_210:
	mov	0xa, %r14
	.word 0xf6f38400  ! 4728: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_3_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_326), 16, 16)) -> intp(3, 0, 7)
cpu_intr_3_376:
	setx	0x440115, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_202:
	mov	0x2e, %r14
	.word 0xf2db8e40  ! 4732: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T3_asi_reg_wr_211:
	mov	0x34, %r14
	.word 0xf0f38e40  ! 4733: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_377:
	setx	0x470235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe240000  ! 4736: STW_R	stw	%r31, [%r16 + %r0]
cpu_intr_3_378:
	setx	0x47013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82d8000  ! 4742: STB_R	stb	%r28, [%r22 + %r0]
T3_asi_reg_rd_203:
	mov	0x3c4, %r14
	.word 0xf6db8e80  ! 4745: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xfeb520c8  ! 4749: STHA_I	stha	%r31, [%r20 + 0x00c8] %asi
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983908  ! 4750: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1908, %hpstate
	.word 0xf4748000  ! 4751: STX_R	stx	%r26, [%r18 + %r0]
	.word 0xf4b40020  ! 4755: STHA_R	stha	%r26, [%r16 + %r0] 0x01
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_204:
	mov	0x33, %r14
	.word 0xf6db8400  ! 4757: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T3_asi_reg_wr_212:
	mov	0x2d, %r14
	.word 0xf6f384a0  ! 4759: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xfe75e187  ! 4760: STX_I	stx	%r31, [%r23 + 0x0187]
cpu_intr_3_379:
	setx	0x1f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_205:
	mov	0x4, %r14
	.word 0xfcdb8e40  ! 4763: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbe04a144  ! 4764: ADD_I	add 	%r18, 0x0144, %r31
iob_intr_3_327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_327), 16, 16)) -> intp(3, 0, 1)
iob_intr_3_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_328), 16, 16)) -> intp(3, 0, 1)
	.word 0xf274c000  ! 4768: STX_R	stx	%r25, [%r19 + %r0]
	.word 0xf2a4c020  ! 4769: STWA_R	stwa	%r25, [%r19 + %r0] 0x01
	.word 0xbe45e1a8  ! 4771: ADDC_I	addc 	%r23, 0x01a8, %r31
cpu_intr_3_380:
	setx	0x44001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_213:
	mov	0x7, %r14
	.word 0xfaf38e60  ! 4774: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf82d4000  ! 4776: STB_R	stb	%r28, [%r21 + %r0]
T3_asi_reg_rd_206:
	mov	0x3c5, %r14
	.word 0xfadb89e0  ! 4778: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf62de13e  ! 4780: STB_I	stb	%r27, [%r23 + 0x013e]
	.word 0xf2b42121  ! 4781: STHA_I	stha	%r25, [%r16 + 0x0121] %asi
cpu_intr_3_381:
	setx	0x46002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0740000  ! 4790: STX_R	stx	%r24, [%r16 + %r0]
	.word 0xfca58020  ! 4792: STWA_R	stwa	%r30, [%r22 + %r0] 0x01
	.word 0xb624e03d  ! 4793: SUB_I	sub 	%r19, 0x003d, %r27
T3_asi_reg_wr_214:
	mov	0x3c1, %r14
	.word 0xf0f38e40  ! 4800: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_329), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf024a01e  ! 4808: STW_I	stw	%r24, [%r18 + 0x001e]
iob_intr_3_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_330), 16, 16)) -> intp(3, 0, 4)
T3_asi_reg_rd_207:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 4810: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_3_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_331), 16, 16)) -> intp(3, 0, 3c)
iob_intr_3_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_332), 16, 16)) -> intp(3, 0, 31)
T3_asi_reg_rd_208:
	mov	0x3c8, %r14
	.word 0xf4db8e80  ! 4813: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xfc2d61f0  ! 4815: STB_I	stb	%r30, [%r21 + 0x01f0]
	.word 0xfcf4e0ad  ! 4820: STXA_I	stxa	%r30, [%r19 + 0x00ad] %asi
	.word 0xfeaca0ee  ! 4821: STBA_I	stba	%r31, [%r18 + 0x00ee] %asi
	.word 0xfe2d20b2  ! 4822: STB_I	stb	%r31, [%r20 + 0x00b2]
T3_asi_reg_rd_209:
	mov	0x16, %r14
	.word 0xf6db8e40  ! 4823: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf0ac4020  ! 4825: STBA_R	stba	%r24, [%r17 + %r0] 0x01
	.word 0xfc742188  ! 4827: STX_I	stx	%r30, [%r16 + 0x0188]
	.word 0xf62c4000  ! 4828: STB_R	stb	%r27, [%r17 + %r0]
iob_intr_3_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_333), 16, 16)) -> intp(3, 0, 34)
T3_asi_reg_wr_215:
	mov	0x3c8, %r14
	.word 0xf0f384a0  ! 4830: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf4a56008  ! 4836: STWA_I	stwa	%r26, [%r21 + 0x0008] %asi
cpu_intr_3_382:
	setx	0x440336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb334c000  ! 4839: SRL_R	srl 	%r19, %r0, %r25
T3_asi_reg_rd_210:
	mov	0x2a, %r14
	.word 0xf8db8e80  ! 4840: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xfc250000  ! 4841: STW_R	stw	%r30, [%r20 + %r0]
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982c5a  ! 4843: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c5a, %hpstate
cpu_intr_3_383:
	setx	0x440237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab54020  ! 4847: STHA_R	stha	%r29, [%r21 + %r0] 0x01
	.word 0xfab5c020  ! 4850: STHA_R	stha	%r29, [%r23 + %r0] 0x01
cpu_intr_3_384:
	setx	0x460132, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_385:
	setx	0x460128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ace0c8  ! 4857: STBA_I	stba	%r25, [%r19 + 0x00c8] %asi
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_334), 16, 16)) -> intp(3, 0, 34)
	.word 0xf6ad8020  ! 4863: STBA_R	stba	%r27, [%r22 + %r0] 0x01
cpu_intr_3_386:
	setx	0x470134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc9d4000  ! 4866: XORcc_R	xorcc 	%r21, %r0, %r30
cpu_intr_3_387:
	setx	0x440319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb20c2175  ! 4871: AND_I	and 	%r16, 0x0175, %r25
	.word 0xfa2de064  ! 4872: STB_I	stb	%r29, [%r23 + 0x0064]
T3_asi_reg_rd_211:
	mov	0x7, %r14
	.word 0xfcdb8e40  ! 4873: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_3_388:
	setx	0x460124, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_335), 16, 16)) -> intp(3, 0, 7)
cpu_intr_3_389:
	setx	0x22b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_336), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_390:
	setx	0x470004, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_337), 16, 16)) -> intp(3, 0, 2a)
	ta	T_CHANGE_HPRIV
	.word 0xfeb58020  ! 4890: STHA_R	stha	%r31, [%r22 + %r0] 0x01
	.word 0xbe3d20b0  ! 4891: XNOR_I	xnor 	%r20, 0x00b0, %r31
iob_intr_3_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_338), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_rd_212:
	mov	0xd, %r14
	.word 0xf2db8400  ! 4897: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_3_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_339), 16, 16)) -> intp(3, 0, 0)
T3_asi_reg_wr_216:
	mov	0x35, %r14
	.word 0xfaf384a0  ! 4900: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xfaaca1ae  ! 4901: STBA_I	stba	%r29, [%r18 + 0x01ae] %asi
	.word 0xf6ad60ef  ! 4907: STBA_I	stba	%r27, [%r21 + 0x00ef] %asi
cpu_intr_3_391:
	setx	0x440307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_392:
	setx	0x440227, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_213:
	mov	0x17, %r14
	.word 0xf2db8e60  ! 4916: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xfcb44020  ! 4918: STHA_R	stha	%r30, [%r17 + %r0] 0x01
T3_asi_reg_wr_217:
	mov	0x3c7, %r14
	.word 0xf0f38400  ! 4921: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xfaf520d9  ! 4922: STXA_I	stxa	%r29, [%r20 + 0x00d9] %asi
cpu_intr_3_393:
	setx	0x470104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ac8020  ! 4927: STBA_R	stba	%r25, [%r18 + %r0] 0x01
	.word 0xb6254000  ! 4931: SUB_R	sub 	%r21, %r0, %r27
	.word 0xfc25e06b  ! 4933: STW_I	stw	%r30, [%r23 + 0x006b]
	.word 0xf0ac4020  ! 4934: STBA_R	stba	%r24, [%r17 + %r0] 0x01
iob_intr_3_340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_340), 16, 16)) -> intp(3, 0, e)
T3_asi_reg_wr_218:
	mov	0x1f, %r14
	.word 0xf2f38e80  ! 4937: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf4352038  ! 4938: STH_I	sth	%r26, [%r20 + 0x0038]
T3_asi_reg_rd_214:
	mov	0x14, %r14
	.word 0xfedb8e40  ! 4942: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb73de001  ! 4944: SRA_I	sra 	%r23, 0x0001, %r27
cpu_intr_3_394:
	setx	0x460320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0254000  ! 4947: STW_R	stw	%r24, [%r21 + %r0]
	.word 0xb48d60a9  ! 4948: ANDcc_I	andcc 	%r21, 0x00a9, %r26
T3_asi_reg_rd_215:
	mov	0x38, %r14
	.word 0xf4db8e40  ! 4949: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_341), 16, 16)) -> intp(3, 0, 12)
	.word 0xfaa52153  ! 4954: STWA_I	stwa	%r29, [%r20 + 0x0153] %asi
	.word 0xfea5e1d8  ! 4955: STWA_I	stwa	%r31, [%r23 + 0x01d8] %asi
iob_intr_3_342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_342), 16, 16)) -> intp(3, 0, 3d)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf0ac4020  ! 4959: STBA_R	stba	%r24, [%r17 + %r0] 0x01
	.word 0xf2ace15e  ! 4963: STBA_I	stba	%r25, [%r19 + 0x015e] %asi
	.word 0xf8a42070  ! 4965: STWA_I	stwa	%r28, [%r16 + 0x0070] %asi
iob_intr_3_343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_343), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_rd_216:
	mov	0xf, %r14
	.word 0xfcdb8e80  ! 4967: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	ta	T_CHANGE_TO_TL1
	.word 0xb3350000  ! 4969: SRL_R	srl 	%r20, %r0, %r25
	.word 0xf82c8000  ! 4971: STB_R	stb	%r28, [%r18 + %r0]
iob_intr_3_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_344), 16, 16)) -> intp(3, 0, b)
T3_asi_reg_wr_219:
	mov	0x5, %r14
	.word 0xfaf38e40  ! 4978: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_rd_217:
	mov	0x3c4, %r14
	.word 0xf4db89e0  ! 4979: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_3_395:
	setx	0x450228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a4a0be  ! 4985: STWA_I	stwa	%r26, [%r18 + 0x00be] %asi
	.word 0xf6a58020  ! 4990: STWA_R	stwa	%r27, [%r22 + %r0] 0x01
	.word 0xfeb40020  ! 4994: STHA_R	stha	%r31, [%r16 + %r0] 0x01
iob_intr_3_345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_345), 16, 16)) -> intp(3, 0, 33)
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
	mov	0x3c3, %r14
	.word 0xfef38e40  ! 3: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_0), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_0:
	setx	0x1b0114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfccdc020  ! 6: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r30
iob_intr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_1), 16, 16)) -> intp(2, 0, 18)
	.word 0xb3643801  ! 19: MOVcc_I	<illegal instruction>
	.word 0xf445e177  ! 20: LDSW_I	ldsw	[%r23 + 0x0177], %r26
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982800  ! 21: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0800, %hpstate
	.word 0xf81560e5  ! 31: LDUH_I	lduh	[%r21 + 0x00e5], %r28
cpu_intr_2_1:
	setx	0x1e0214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc544000  ! 35: LDSH_R	ldsh	[%r17 + %r0], %r30
	.word 0xf20d0000  ! 36: LDUB_R	ldub	[%r20 + %r0], %r25
	.word 0xb03c0000  ! 37: XNOR_R	xnor 	%r16, %r0, %r24
cpu_intr_2_2:
	setx	0x1d0309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45c6107  ! 41: LDX_I	ldx	[%r17 + 0x0107], %r26
T2_asi_reg_wr_1:
	mov	0xf, %r14
	.word 0xf4f38e40  ! 42: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_2), 16, 16)) -> intp(2, 0, 25)
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_2:
	mov	0x3c8, %r14
	.word 0xf4f384a0  ! 45: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_2_3:
	setx	0x1f0314, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_3), 16, 16)) -> intp(2, 0, 3b)
T2_asi_reg_wr_3:
	mov	0x3c6, %r14
	.word 0xfaf38e60  ! 49: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xfa840020  ! 50: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_TO_TL0
iob_intr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_4), 16, 16)) -> intp(2, 0, 31)
	.word 0xf0d58020  ! 54: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r24
iob_intr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_5), 16, 16)) -> intp(2, 0, 23)
	.word 0xf28ce1f0  ! 56: LDUBA_I	lduba	[%r19, + 0x01f0] %asi, %r25
cpu_intr_2_4:
	setx	0x1c0201, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_5:
	setx	0x1c0209, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_0:
	mov	0x3c4, %r14
	.word 0xf0db8400  ! 60: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf6cc8020  ! 61: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r27
cpu_intr_2_6:
	setx	0x1f013b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_1:
	mov	0x10, %r14
	.word 0xfedb8e80  ! 63: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_2_7:
	setx	0x1f0020, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_6), 16, 16)) -> intp(2, 0, b)
T2_asi_reg_wr_4:
	mov	0x16, %r14
	.word 0xf2f38e40  ! 74: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_2_8:
	setx	0x1e0119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6254000  ! 76: SUB_R	sub 	%r21, %r0, %r27
T2_asi_reg_wr_5:
	mov	0x22, %r14
	.word 0xf8f38e80  ! 77: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb68d0000  ! 83: ANDcc_R	andcc 	%r20, %r0, %r27
T2_asi_reg_wr_6:
	mov	0x37, %r14
	.word 0xf0f38e60  ! 87: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xf8c5e188  ! 88: LDSWA_I	ldswa	[%r23, + 0x0188] %asi, %r28
	ta	T_CHANGE_TO_TL1
cpu_intr_2_9:
	setx	0x1e0338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6c50020  ! 95: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r27
T2_asi_reg_rd_2:
	mov	0x2e, %r14
	.word 0xfcdb8e80  ! 96: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf04d8000  ! 97: LDSB_R	ldsb	[%r22 + %r0], %r24
iob_intr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_7), 16, 16)) -> intp(2, 0, 2)
	.word 0xb084c000  ! 100: ADDcc_R	addcc 	%r19, %r0, %r24
	.word 0xb4046052  ! 101: ADD_I	add 	%r17, 0x0052, %r26
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982c8a  ! 102: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c8a, %hpstate
iob_intr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_8), 16, 16)) -> intp(2, 0, 3d)
iob_intr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_9), 16, 16)) -> intp(2, 0, 28)
iob_intr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_10), 16, 16)) -> intp(2, 0, 21)
	ta	T_CHANGE_TO_TL0
	.word 0xfe8de19f  ! 111: LDUBA_I	lduba	[%r23, + 0x019f] %asi, %r31
T2_asi_reg_wr_7:
	mov	0x2d, %r14
	.word 0xfef38e40  ! 113: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0x87942139  ! 115: WRPR_TT_I	wrpr	%r16, 0x0139, %tt
iob_intr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_11), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_wr_8:
	mov	0x3, %r14
	.word 0xf4f38400  ! 119: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf04c609a  ! 120: LDSB_I	ldsb	[%r17 + 0x009a], %r24
	ta	T_CHANGE_TO_TL0
cpu_intr_2_10:
	setx	0x1d011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04c0000  ! 126: LDSB_R	ldsb	[%r16 + %r0], %r24
	.word 0xfa5c8000  ! 128: LDX_R	ldx	[%r18 + %r0], %r29
	.word 0xf45c0000  ! 130: LDX_R	ldx	[%r16 + %r0], %r26
cpu_intr_2_11:
	setx	0x1f0121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0058000  ! 135: LDUW_R	lduw	[%r22 + %r0], %r24
T2_asi_reg_rd_3:
	mov	0x4, %r14
	.word 0xf6db8e60  ! 137: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_2_12:
	setx	0x1e0323, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_9:
	mov	0x1a, %r14
	.word 0xf4f389e0  ! 141: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_2_13:
	setx	0x1c002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8cc0020  ! 146: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r28
	.word 0xb8b4a078  ! 147: ORNcc_I	orncc 	%r18, 0x0078, %r28
	.word 0xf4458000  ! 148: LDSW_R	ldsw	[%r22 + %r0], %r26
iob_intr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_12), 16, 16)) -> intp(2, 0, 2)
	ta	T_CHANGE_TO_TL0
	.word 0xf8154000  ! 153: LDUH_R	lduh	[%r21 + %r0], %r28
	.word 0xbc0d8000  ! 155: AND_R	and 	%r22, %r0, %r30
	ta	T_CHANGE_HPRIV
	.word 0xbc34e0a2  ! 159: ORN_I	orn 	%r19, 0x00a2, %r30
	.word 0xfa4c211f  ! 161: LDSB_I	ldsb	[%r16 + 0x011f], %r29
cpu_intr_2_14:
	setx	0x1c030a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_13), 16, 16)) -> intp(2, 0, 3e)
	.word 0xfe5c217d  ! 165: LDX_I	ldx	[%r16 + 0x017d], %r31
	.word 0xbebdc000  ! 166: XNORcc_R	xnorcc 	%r23, %r0, %r31
	.word 0xf00ca149  ! 168: LDUB_I	ldub	[%r18 + 0x0149], %r24
cpu_intr_2_15:
	setx	0x1e0125, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_14), 16, 16)) -> intp(2, 0, d)
	.word 0xfe05c000  ! 172: LDUW_R	lduw	[%r23 + %r0], %r31
	.word 0xb824607f  ! 174: SUB_I	sub 	%r17, 0x007f, %r28
iob_intr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_15), 16, 16)) -> intp(2, 0, 28)
	.word 0xfcc4c020  ! 177: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r30
	.word 0xb4044000  ! 178: ADD_R	add 	%r17, %r0, %r26
	.word 0xf8454000  ! 181: LDSW_R	ldsw	[%r21 + %r0], %r28
iob_intr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_16), 16, 16)) -> intp(2, 0, 17)
iob_intr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_17), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_wr_10:
	mov	0x3c8, %r14
	.word 0xf0f38e40  ! 187: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb08c61db  ! 188: ANDcc_I	andcc 	%r17, 0x01db, %r24
	.word 0xbe0d615f  ! 190: AND_I	and 	%r21, 0x015f, %r31
	.word 0xb8c48000  ! 193: ADDCcc_R	addccc 	%r18, %r0, %r28
	.word 0xf6548000  ! 194: LDSH_R	ldsh	[%r18 + %r0], %r27
cpu_intr_2_16:
	setx	0x1c0208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8dd21ad  ! 199: LDXA_I	ldxa	[%r20, + 0x01ad] %asi, %r28
	.word 0xf654e14b  ! 201: LDSH_I	ldsh	[%r19 + 0x014b], %r27
cpu_intr_2_17:
	setx	0x1d0025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4940020  ! 205: LDUHA_R	lduha	[%r16, %r0] 0x01, %r26
T2_asi_reg_rd_4:
	mov	0x3c7, %r14
	.word 0xf4db8e40  ! 207: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_2_18:
	setx	0x1f0338, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_19:
	setx	0x1f0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa048000  ! 215: LDUW_R	lduw	[%r18 + %r0], %r29
	.word 0xfcdc2078  ! 217: LDXA_I	ldxa	[%r16, + 0x0078] %asi, %r30
iob_intr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_18), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf855e1d1  ! 219: LDSH_I	ldsh	[%r23 + 0x01d1], %r28
T2_asi_reg_wr_11:
	mov	0x3c4, %r14
	.word 0xf6f38e60  ! 226: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T2_asi_reg_wr_12:
	mov	0x2, %r14
	.word 0xf8f384a0  ! 228: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_19), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_rd_5:
	mov	0x20, %r14
	.word 0xfadb8e80  ! 235: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T2_asi_reg_rd_6:
	mov	0x24, %r14
	.word 0xf8db84a0  ! 236: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xfc0c0000  ! 237: LDUB_R	ldub	[%r16 + %r0], %r30
	ta	T_CHANGE_TO_TL1
	.word 0xa1902000  ! 239: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982c48  ! 240: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c48, %hpstate
iob_intr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_20), 16, 16)) -> intp(2, 0, 24)
	.word 0xf25d61c3  ! 243: LDX_I	ldx	[%r21 + 0x01c3], %r25
cpu_intr_2_20:
	setx	0x1d022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfedda027  ! 245: LDXA_I	ldxa	[%r22, + 0x0027] %asi, %r31
	.word 0xf6958020  ! 246: LDUHA_R	lduha	[%r22, %r0] 0x01, %r27
	.word 0xf414e0ff  ! 247: LDUH_I	lduh	[%r19 + 0x00ff], %r26
	.word 0xfc54c000  ! 248: LDSH_R	ldsh	[%r19 + %r0], %r30
	.word 0xfad5c020  ! 251: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r29
iob_intr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_21), 16, 16)) -> intp(2, 0, 10)
	.word 0xf80dc000  ! 254: LDUB_R	ldub	[%r23 + %r0], %r28
iob_intr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_22), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf445e112  ! 260: LDSW_I	ldsw	[%r23 + 0x0112], %r26
cpu_intr_2_21:
	setx	0x1e0238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4b54000  ! 265: SUBCcc_R	orncc 	%r21, %r0, %r26
cpu_intr_2_22:
	setx	0x1d0303, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_13:
	mov	0x2e, %r14
	.word 0xfef38e60  ! 267: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf6542133  ! 272: LDSH_I	ldsh	[%r16 + 0x0133], %r27
cpu_intr_2_23:
	setx	0x1d0038, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf244a073  ! 279: LDSW_I	ldsw	[%r18 + 0x0073], %r25
	.word 0xbb641800  ! 281: MOVcc_R	<illegal instruction>
	.word 0xf8140000  ! 282: LDUH_R	lduh	[%r16 + %r0], %r28
	.word 0xfa04a05e  ! 284: LDUW_I	lduw	[%r18 + 0x005e], %r29
cpu_intr_2_24:
	setx	0x1c0002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf644e047  ! 288: LDSW_I	ldsw	[%r19 + 0x0047], %r27
iob_intr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_23), 16, 16)) -> intp(2, 0, 6)
T2_asi_reg_rd_7:
	mov	0x3c6, %r14
	.word 0xf4db8e40  ! 296: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_wr_14:
	mov	0x6, %r14
	.word 0xf2f38e80  ! 301: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_2_25:
	setx	0x1d001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_15:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 304: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_2_26:
	setx	0x1e0031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_27:
	setx	0x1f0324, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xfc8c4020  ! 314: LDUBA_R	lduba	[%r17, %r0] 0x01, %r30
cpu_intr_2_28:
	setx	0x1d0026, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_24), 16, 16)) -> intp(2, 0, 3b)
	.word 0xfa5d4000  ! 322: LDX_R	ldx	[%r21 + %r0], %r29
	ta	T_CHANGE_TO_TL0
	.word 0xfcdc618d  ! 326: LDXA_I	ldxa	[%r17, + 0x018d] %asi, %r30
iob_intr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_25), 16, 16)) -> intp(2, 0, 36)
cpu_intr_2_29:
	setx	0x1f0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60521f3  ! 330: LDUW_I	lduw	[%r20 + 0x01f3], %r27
	.word 0xf68da10a  ! 332: LDUBA_I	lduba	[%r22, + 0x010a] %asi, %r27
iob_intr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_26), 16, 16)) -> intp(2, 0, d)
T2_asi_reg_wr_16:
	mov	0x3c3, %r14
	.word 0xf2f389e0  ! 334: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T2_asi_reg_rd_8:
	mov	0x3c4, %r14
	.word 0xf2db8e40  ! 335: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_2_30:
	setx	0x1d023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_9:
	mov	0xe, %r14
	.word 0xfedb8e60  ! 337: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf8cc8020  ! 338: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r28
cpu_intr_2_31:
	setx	0x1f0039, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_10:
	mov	0x17, %r14
	.word 0xfcdb8e60  ! 344: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_2_32:
	setx	0x1e0227, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_TO_TL1
cpu_intr_2_33:
	setx	0x1f0304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc95a02a  ! 364: LDUHA_I	lduha	[%r22, + 0x002a] %asi, %r30
	.word 0xb2b4e02b  ! 365: ORNcc_I	orncc 	%r19, 0x002b, %r25
T2_asi_reg_rd_11:
	mov	0x3c8, %r14
	.word 0xfedb89e0  ! 368: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_27), 16, 16)) -> intp(2, 0, 20)
iob_intr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_28), 16, 16)) -> intp(2, 0, 3f)
	.word 0xbd35e001  ! 373: SRL_I	srl 	%r23, 0x0001, %r30
	.word 0xfcd48020  ! 376: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r30
T2_asi_reg_rd_12:
	mov	0x36, %r14
	.word 0xf2db8e80  ! 377: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983d98  ! 378: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d98, %hpstate
iob_intr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_29), 16, 16)) -> intp(2, 0, 3d)
iob_intr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_30), 16, 16)) -> intp(2, 0, f)
iob_intr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_31), 16, 16)) -> intp(2, 0, b)
iob_intr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_32), 16, 16)) -> intp(2, 0, 35)
cpu_intr_2_34:
	setx	0x1d013f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_33), 16, 16)) -> intp(2, 0, 29)
cpu_intr_2_35:
	setx	0x1c0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_36:
	setx	0x1d010b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_34), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_rd_13:
	mov	0x38, %r14
	.word 0xfcdb8e60  ! 398: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T2_asi_reg_wr_17:
	mov	0x8, %r14
	.word 0xf2f38e60  ! 400: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T2_asi_reg_wr_18:
	mov	0x31, %r14
	.word 0xfef38e80  ! 404: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983ac0  ! 407: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ac0, %hpstate
	.word 0xf44dc000  ! 408: LDSB_R	ldsb	[%r23 + %r0], %r26
T2_asi_reg_rd_14:
	mov	0x2c, %r14
	.word 0xf6db8400  ! 409: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf2c5608e  ! 410: LDSWA_I	ldswa	[%r21, + 0x008e] %asi, %r25
iob_intr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_35), 16, 16)) -> intp(2, 0, 1f)
cpu_intr_2_37:
	setx	0x1c0121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfadda0c9  ! 421: LDXA_I	ldxa	[%r22, + 0x00c9] %asi, %r29
	.word 0xf65d6056  ! 424: LDX_I	ldx	[%r21 + 0x0056], %r27
T2_asi_reg_rd_15:
	mov	0x3c7, %r14
	.word 0xf4db8e40  ! 425: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf8040000  ! 426: LDUW_R	lduw	[%r16 + %r0], %r28
	.word 0xa1902002  ! 427: WRPR_GL_I	wrpr	%r0, 0x0002, %-
cpu_intr_2_38:
	setx	0x1c0000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_39:
	setx	0x1e000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b4e14a  ! 439: ORNcc_I	orncc 	%r19, 0x014a, %r28
	.word 0xb005216b  ! 440: ADD_I	add 	%r20, 0x016b, %r24
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_16:
	mov	0x2, %r14
	.word 0xf2db8e80  ! 444: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xfed5202e  ! 445: LDSHA_I	ldsha	[%r20, + 0x002e] %asi, %r31
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982b10  ! 446: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b10, %hpstate
iob_intr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_36), 16, 16)) -> intp(2, 0, 2b)
	.word 0xfcdc20bc  ! 448: LDXA_I	ldxa	[%r16, + 0x00bc] %asi, %r30
cpu_intr_2_40:
	setx	0x1c0122, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_37), 16, 16)) -> intp(2, 0, 35)
	.word 0xf4456164  ! 457: LDSW_I	ldsw	[%r21 + 0x0164], %r26
T2_asi_reg_wr_19:
	mov	0x3c1, %r14
	.word 0xfef38e80  ! 458: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_2_41:
	setx	0x1c0035, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_20:
	mov	0x3c7, %r14
	.word 0xf0f389e0  ! 461: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_38), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf24c2038  ! 467: LDSB_I	ldsb	[%r16 + 0x0038], %r25
	.word 0xb8240000  ! 471: SUB_R	sub 	%r16, %r0, %r28
T2_asi_reg_wr_21:
	mov	0x3c1, %r14
	.word 0xf8f384a0  ! 472: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T2_asi_reg_rd_17:
	mov	0x3c7, %r14
	.word 0xf4db8e80  ! 473: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_2_42:
	setx	0x220315, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_22:
	mov	0x17, %r14
	.word 0xfef384a0  ! 476: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf64d0000  ! 477: LDSB_R	ldsb	[%r20 + %r0], %r27
T2_asi_reg_wr_23:
	mov	0x21, %r14
	.word 0xfef389e0  ! 478: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf4dce15a  ! 481: LDXA_I	ldxa	[%r19, + 0x015a] %asi, %r26
T2_asi_reg_wr_24:
	mov	0x33, %r14
	.word 0xf4f384a0  ! 484: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	ta	T_CHANGE_TO_TL1
	.word 0xf8cdc020  ! 487: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r28
	ta	T_CHANGE_HPRIV
iob_intr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_39), 16, 16)) -> intp(2, 0, 3f)
T2_asi_reg_rd_18:
	mov	0x25, %r14
	.word 0xfedb8400  ! 494: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_40), 16, 16)) -> intp(2, 0, 9)
cpu_intr_2_43:
	setx	0x21020a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_41), 16, 16)) -> intp(2, 0, 15)
	.word 0xf28cc020  ! 501: LDUBA_R	lduba	[%r19, %r0] 0x01, %r25
	.word 0xbb35d000  ! 503: SRLX_R	srlx	%r23, %r0, %r29
cpu_intr_2_44:
	setx	0x220235, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_45:
	setx	0x210335, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982cda  ! 506: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cda, %hpstate
T2_asi_reg_wr_25:
	mov	0x25, %r14
	.word 0xfaf389e0  ! 508: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xfa85215e  ! 510: LDUWA_I	lduwa	[%r20, + 0x015e] %asi, %r29
iob_intr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_42), 16, 16)) -> intp(2, 0, 1a)
cpu_intr_2_46:
	setx	0x230103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8521f9  ! 515: LDUWA_I	lduwa	[%r20, + 0x01f9] %asi, %r31
	.word 0xf2440000  ! 516: LDSW_R	ldsw	[%r16 + %r0], %r25
	.word 0xf614e014  ! 517: LDUH_I	lduh	[%r19 + 0x0014], %r27
iob_intr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_43), 16, 16)) -> intp(2, 0, 7)
	.word 0xbcad209d  ! 523: ANDNcc_I	andncc 	%r20, 0x009d, %r30
	ta	T_CHANGE_TO_TL0
iob_intr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_44), 16, 16)) -> intp(2, 0, 17)
	.word 0xf44c4000  ! 526: LDSB_R	ldsb	[%r17 + %r0], %r26
	.word 0xfec5a055  ! 529: LDSWA_I	ldswa	[%r22, + 0x0055] %asi, %r31
	.word 0xb2440000  ! 531: ADDC_R	addc 	%r16, %r0, %r25
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983cda  ! 532: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cda, %hpstate
T2_asi_reg_wr_26:
	mov	0x21, %r14
	.word 0xf0f38e60  ! 533: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xf2cc6104  ! 534: LDSBA_I	ldsba	[%r17, + 0x0104] %asi, %r25
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983940  ! 536: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1940, %hpstate
cpu_intr_2_47:
	setx	0x21012a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_19:
	mov	0x3c0, %r14
	.word 0xfcdb8e40  ! 541: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_45), 16, 16)) -> intp(2, 0, 3c)
T2_asi_reg_rd_20:
	mov	0x1f, %r14
	.word 0xfadb8e40  ! 547: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_2_48:
	setx	0x220230, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_21:
	mov	0x3c4, %r14
	.word 0xfcdb89e0  ! 550: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf05ca1d1  ! 551: LDX_I	ldx	[%r18 + 0x01d1], %r24
cpu_intr_2_49:
	setx	0x200126, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_27:
	mov	0x3c2, %r14
	.word 0xfef38400  ! 554: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_2_50:
	setx	0x23031c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_46), 16, 16)) -> intp(2, 0, 5)
T2_asi_reg_wr_28:
	mov	0x1, %r14
	.word 0xfef384a0  ! 557: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T2_asi_reg_rd_22:
	mov	0x17, %r14
	.word 0xf2db84a0  ! 559: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T2_asi_reg_wr_29:
	mov	0xb, %r14
	.word 0xf8f384a0  ! 560: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_2_51:
	setx	0x230019, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfe5d602a  ! 565: LDX_I	ldx	[%r21 + 0x002a], %r31
cpu_intr_2_52:
	setx	0x21001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0cce08e  ! 569: LDSBA_I	ldsba	[%r19, + 0x008e] %asi, %r24
iob_intr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_47), 16, 16)) -> intp(2, 0, 19)
T2_asi_reg_wr_30:
	mov	0x3c7, %r14
	.word 0xf0f38e80  ! 573: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xfe44e0fc  ! 574: LDSW_I	ldsw	[%r19 + 0x00fc], %r31
T2_asi_reg_wr_31:
	mov	0xb, %r14
	.word 0xf6f38e60  ! 577: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_2_53:
	setx	0x21030f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_32:
	mov	0x9, %r14
	.word 0xf4f38e80  ! 581: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf24d205c  ! 582: LDSB_I	ldsb	[%r20 + 0x005c], %r25
	.word 0xf4dca1ed  ! 583: LDXA_I	ldxa	[%r18, + 0x01ed] %asi, %r26
	.word 0xf44c4000  ! 584: LDSB_R	ldsb	[%r17 + %r0], %r26
	.word 0xbf341000  ! 585: SRLX_R	srlx	%r16, %r0, %r31
cpu_intr_2_54:
	setx	0x230032, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_48), 16, 16)) -> intp(2, 0, d)
cpu_intr_2_55:
	setx	0x20020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4054000  ! 591: LDUW_R	lduw	[%r21 + %r0], %r26
cpu_intr_2_56:
	setx	0x210029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2046125  ! 596: LDUW_I	lduw	[%r17 + 0x0125], %r25
cpu_intr_2_57:
	setx	0x23001a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_33:
	mov	0x2b, %r14
	.word 0xfef38e60  ! 601: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfe854020  ! 607: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r31
	.word 0xfc958020  ! 608: LDUHA_R	lduha	[%r22, %r0] 0x01, %r30
	.word 0xf4d48020  ! 610: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r26
	.word 0xf60521f1  ! 611: LDUW_I	lduw	[%r20 + 0x01f1], %r27
cpu_intr_2_58:
	setx	0x200000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_59:
	setx	0x23003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc550000  ! 617: LDSH_R	ldsh	[%r20 + %r0], %r30
iob_intr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_49), 16, 16)) -> intp(2, 0, 39)
	.word 0xfa4c617c  ! 619: LDSB_I	ldsb	[%r17 + 0x017c], %r29
cpu_intr_2_60:
	setx	0x210330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc04c000  ! 625: LDUW_R	lduw	[%r19 + %r0], %r30
	ta	T_CHANGE_TO_TL1
cpu_intr_2_61:
	setx	0x220313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbebc4000  ! 631: XNORcc_R	xnorcc 	%r17, %r0, %r31
iob_intr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_50), 16, 16)) -> intp(2, 0, 12)
cpu_intr_2_62:
	setx	0x23030b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_51), 16, 16)) -> intp(2, 0, 9)
	.word 0xfe044000  ! 639: LDUW_R	lduw	[%r17 + %r0], %r31
iob_intr_2_52:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_52), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf445c000  ! 641: LDSW_R	ldsw	[%r23 + %r0], %r26
T2_asi_reg_wr_34:
	mov	0x8, %r14
	.word 0xf0f38e40  ! 642: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfac54020  ! 644: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r29
iob_intr_2_53:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_53), 16, 16)) -> intp(2, 0, 7)
cpu_intr_2_63:
	setx	0x21021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba1d4000  ! 648: XOR_R	xor 	%r21, %r0, %r29
	.word 0xb13cc000  ! 649: SRA_R	sra 	%r19, %r0, %r24
T2_asi_reg_wr_35:
	mov	0x38, %r14
	.word 0xfef38e40  ! 650: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_rd_23:
	mov	0x3c5, %r14
	.word 0xf2db8e60  ! 651: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T2_asi_reg_wr_36:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 653: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_rd_24:
	mov	0x1f, %r14
	.word 0xf4db8e60  ! 655: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf0458000  ! 657: LDSW_R	ldsw	[%r22 + %r0], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_64:
	setx	0x210101, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_37:
	mov	0x20, %r14
	.word 0xfcf38e60  ! 663: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T2_asi_reg_wr_38:
	mov	0x3c5, %r14
	.word 0xf2f38e60  ! 667: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x819828c2  ! 668: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c2, %hpstate
T2_asi_reg_rd_25:
	mov	0x3c3, %r14
	.word 0xf6db8400  ! 669: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_2_54:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_54), 16, 16)) -> intp(2, 0, 3a)
	.word 0xf85d21ba  ! 675: LDX_I	ldx	[%r20 + 0x01ba], %r28
cpu_intr_2_65:
	setx	0x20023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72d8000  ! 677: SLL_R	sll 	%r22, %r0, %r27
cpu_intr_2_66:
	setx	0x230011, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_2_55:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_55), 16, 16)) -> intp(2, 0, 3a)
iob_intr_2_56:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_56), 16, 16)) -> intp(2, 0, 28)
cpu_intr_2_67:
	setx	0x200333, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_57:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_57), 16, 16)) -> intp(2, 0, 11)
cpu_intr_2_68:
	setx	0x22033b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_39:
	mov	0xa, %r14
	.word 0xf6f38e40  ! 692: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_2_58:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_58), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_69:
	setx	0x22001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf68461d5  ! 698: LDUWA_I	lduwa	[%r17, + 0x01d5] %asi, %r27
iob_intr_2_59:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_59), 16, 16)) -> intp(2, 0, 13)
	.word 0xb034c000  ! 701: ORN_R	orn 	%r19, %r0, %r24
	.word 0xb9357001  ! 703: SRLX_I	srlx	%r21, 0x0001, %r28
	ta	T_CHANGE_TO_TL0
	.word 0xf8cce0df  ! 710: LDSBA_I	ldsba	[%r19, + 0x00df] %asi, %r28
T2_asi_reg_rd_26:
	mov	0x1c, %r14
	.word 0xfedb8e80  ! 716: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T2_asi_reg_rd_27:
	mov	0x11, %r14
	.word 0xfadb84a0  ! 717: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xfa450000  ! 718: LDSW_R	ldsw	[%r20 + %r0], %r29
T2_asi_reg_wr_40:
	mov	0xc, %r14
	.word 0xf2f38e40  ! 721: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfedd2035  ! 723: LDXA_I	ldxa	[%r20, + 0x0035] %asi, %r31
	.word 0xf0d40020  ! 724: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r24
	.word 0xfa15e1e1  ! 726: LDUH_I	lduh	[%r23 + 0x01e1], %r29
T2_asi_reg_rd_28:
	mov	0x30, %r14
	.word 0xf4db8e80  ! 728: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_2_70:
	setx	0x22033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45cc000  ! 732: LDX_R	ldx	[%r19 + %r0], %r26
T2_asi_reg_wr_41:
	mov	0x3c1, %r14
	.word 0xf6f38e80  ! 736: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xfc8c616f  ! 737: LDUBA_I	lduba	[%r17, + 0x016f] %asi, %r30
T2_asi_reg_wr_42:
	mov	0x1d, %r14
	.word 0xfcf38400  ! 738: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xfcdd2157  ! 740: LDXA_I	ldxa	[%r20, + 0x0157] %asi, %r30
	.word 0xfe544000  ! 741: LDSH_R	ldsh	[%r17 + %r0], %r31
T2_asi_reg_rd_29:
	mov	0x3c4, %r14
	.word 0xf8db84a0  ! 742: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb5343001  ! 744: SRLX_I	srlx	%r16, 0x0001, %r26
	.word 0xf6458000  ! 747: LDSW_R	ldsw	[%r22 + %r0], %r27
cpu_intr_2_71:
	setx	0x220337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf68de083  ! 755: LDUBA_I	lduba	[%r23, + 0x0083] %asi, %r27
cpu_intr_2_72:
	setx	0x210332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcd4c020  ! 761: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r30
cpu_intr_2_73:
	setx	0x220106, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_43:
	mov	0x3c3, %r14
	.word 0xf6f38e40  ! 763: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_rd_30:
	mov	0x3c6, %r14
	.word 0xfedb8e40  ! 764: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfe5ce183  ! 767: LDX_I	ldx	[%r19 + 0x0183], %r31
	.word 0xf005a102  ! 768: LDUW_I	lduw	[%r22 + 0x0102], %r24
	.word 0xf415a1c4  ! 770: LDUH_I	lduh	[%r22 + 0x01c4], %r26
	.word 0xf4d50020  ! 775: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r26
	.word 0xfe85206b  ! 777: LDUWA_I	lduwa	[%r20, + 0x006b] %asi, %r31
iob_intr_2_60:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_60), 16, 16)) -> intp(2, 0, 25)
cpu_intr_2_74:
	setx	0x23031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_44:
	mov	0x3c6, %r14
	.word 0xf0f38e40  ! 780: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_2_75:
	setx	0x21002c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_45:
	mov	0x1d, %r14
	.word 0xf4f38400  ! 784: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	ta	T_CHANGE_NONHPRIV
	.word 0xbd7d4400  ! 789: MOVR_R	movre	%r21, %r0, %r30
	.word 0xf4946151  ! 791: LDUHA_I	lduha	[%r17, + 0x0151] %asi, %r26
	.word 0xb4358000  ! 794: ORN_R	orn 	%r22, %r0, %r26
	.word 0xbd2dc000  ! 802: SLL_R	sll 	%r23, %r0, %r30
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_46:
	mov	0x2b, %r14
	.word 0xf4f384a0  ! 812: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf484c020  ! 813: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r26
	.word 0xf0c44020  ! 816: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r24
T2_asi_reg_rd_31:
	mov	0x3c3, %r14
	.word 0xf0db84a0  ! 818: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf0cc0020  ! 819: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r24
iob_intr_2_61:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_61), 16, 16)) -> intp(2, 0, 15)
iob_intr_2_62:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_62), 16, 16)) -> intp(2, 0, 2a)
T2_asi_reg_rd_32:
	mov	0x1c, %r14
	.word 0xfedb84a0  ! 828: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb294a180  ! 829: ORcc_I	orcc 	%r18, 0x0180, %r25
T2_asi_reg_wr_47:
	mov	0x3c7, %r14
	.word 0xf0f38e60  ! 830: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_2_76:
	setx	0x20031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0cc0020  ! 832: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r24
	.word 0xfc140000  ! 834: LDUH_R	lduh	[%r16 + %r0], %r30
	.word 0xb685e195  ! 835: ADDcc_I	addcc 	%r23, 0x0195, %r27
	.word 0xf25c8000  ! 836: LDX_R	ldx	[%r18 + %r0], %r25
iob_intr_2_63:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_63), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf8d5617e  ! 838: LDSHA_I	ldsha	[%r21, + 0x017e] %asi, %r28
	.word 0xf05c0000  ! 839: LDX_R	ldx	[%r16 + %r0], %r24
	.word 0xf844e0f8  ! 840: LDSW_I	ldsw	[%r19 + 0x00f8], %r28
	.word 0xf0d58020  ! 841: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r24
	.word 0xbf354000  ! 843: SRL_R	srl 	%r21, %r0, %r31
iob_intr_2_64:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_64), 16, 16)) -> intp(2, 0, 27)
T2_asi_reg_wr_48:
	mov	0x12, %r14
	.word 0xf6f38e80  ! 845: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_2_65:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_65), 16, 16)) -> intp(2, 0, 14)
	.word 0xf2cca0e9  ! 849: LDSBA_I	ldsba	[%r18, + 0x00e9] %asi, %r25
T2_asi_reg_wr_49:
	mov	0x2d, %r14
	.word 0xfcf38e40  ! 853: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_77:
	setx	0x210025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4a54000  ! 858: SUBcc_R	subcc 	%r21, %r0, %r26
T2_asi_reg_rd_33:
	mov	0x2e, %r14
	.word 0xfcdb84a0  ! 860: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf484c020  ! 862: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r26
cpu_intr_2_78:
	setx	0x210105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcd54020  ! 868: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r30
	.word 0xfa044000  ! 869: LDUW_R	lduw	[%r17 + %r0], %r29
	.word 0xf6840020  ! 870: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r27
cpu_intr_2_79:
	setx	0x200005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb82c0000  ! 876: ANDN_R	andn 	%r16, %r0, %r28
iob_intr_2_66:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_66), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf6858020  ! 881: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r27
	.word 0xf4cd8020  ! 882: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r26
T2_asi_reg_rd_34:
	mov	0x3c3, %r14
	.word 0xfedb8e60  ! 883: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0x8595e037  ! 886: WRPR_TSTATE_I	wrpr	%r23, 0x0037, %tstate
	.word 0xb92ce001  ! 888: SLL_I	sll 	%r19, 0x0001, %r28
	.word 0xb21561ab  ! 889: OR_I	or 	%r21, 0x01ab, %r25
	.word 0xfec4c020  ! 892: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r31
T2_asi_reg_wr_50:
	mov	0x3c6, %r14
	.word 0xf6f38400  ! 893: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_35:
	mov	0x3c6, %r14
	.word 0xfcdb89e0  ! 896: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf08d6096  ! 898: LDUBA_I	lduba	[%r21, + 0x0096] %asi, %r24
	ta	T_CHANGE_TO_TL1
	.word 0xf45c0000  ! 902: LDX_R	ldx	[%r16 + %r0], %r26
cpu_intr_2_80:
	setx	0x26012a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_81:
	setx	0x250211, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xbe1521a2  ! 909: OR_I	or 	%r20, 0x01a2, %r31
	.word 0xf49460ea  ! 910: LDUHA_I	lduha	[%r17, + 0x00ea] %asi, %r26
	.word 0xf28c20c0  ! 911: LDUBA_I	lduba	[%r16, + 0x00c0] %asi, %r25
	.word 0xf6cdc020  ! 913: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r27
iob_intr_2_67:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_67), 16, 16)) -> intp(2, 0, 36)
T2_asi_reg_wr_51:
	mov	0x35, %r14
	.word 0xfaf38e80  ! 915: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_2_68:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_68), 16, 16)) -> intp(2, 0, 2c)
	.word 0xbd7c0400  ! 917: MOVR_R	movre	%r16, %r0, %r30
T2_asi_reg_wr_52:
	mov	0x0, %r14
	.word 0xf4f38e60  ! 919: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T2_asi_reg_rd_36:
	mov	0x3c5, %r14
	.word 0xf0db8e80  ! 920: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb6c44000  ! 921: ADDCcc_R	addccc 	%r17, %r0, %r27
cpu_intr_2_82:
	setx	0x27011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd520000  ! 926: RDPR_PIL	<illegal instruction>
	.word 0xfc0cc000  ! 930: LDUB_R	ldub	[%r19 + %r0], %r30
	.word 0xf895e147  ! 931: LDUHA_I	lduha	[%r23, + 0x0147] %asi, %r28
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983b48  ! 935: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b48, %hpstate
T2_asi_reg_wr_53:
	mov	0x25, %r14
	.word 0xfef38e80  ! 937: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_2_83:
	setx	0x240309, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_84:
	setx	0x27031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_69:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_69), 16, 16)) -> intp(2, 0, 37)
	.word 0xb42c0000  ! 949: ANDN_R	andn 	%r16, %r0, %r26
	.word 0xfe8ce14d  ! 950: LDUBA_I	lduba	[%r19, + 0x014d] %asi, %r31
	.word 0xb13d6001  ! 956: SRA_I	sra 	%r21, 0x0001, %r24
iob_intr_2_70:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_70), 16, 16)) -> intp(2, 0, 3b)
	.word 0xfe5ce1b4  ! 958: LDX_I	ldx	[%r19 + 0x01b4], %r31
	ta	T_CHANGE_TO_TL0
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x8198380a  ! 961: WRHPR_HPSTATE_I	wrhpr	%r0, 0x180a, %hpstate
iob_intr_2_71:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_71), 16, 16)) -> intp(2, 0, 14)
	.word 0xfa0421c8  ! 968: LDUW_I	lduw	[%r16 + 0x01c8], %r29
	.word 0xfa4c8000  ! 970: LDSB_R	ldsb	[%r18 + %r0], %r29
T2_asi_reg_rd_37:
	mov	0x2b, %r14
	.word 0xf6db8400  ! 971: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xba0dc000  ! 972: AND_R	and 	%r23, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_85:
	setx	0x260014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44ce0f5  ! 982: LDSB_I	ldsb	[%r19 + 0x00f5], %r26
cpu_intr_2_86:
	setx	0x27020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0dde0a6  ! 988: LDXA_I	ldxa	[%r23, + 0x00a6] %asi, %r24
cpu_intr_2_87:
	setx	0x25012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec4c020  ! 990: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r31
	.word 0xfe154000  ! 991: LDUH_R	lduh	[%r21 + %r0], %r31
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x8198398a  ! 993: WRHPR_HPSTATE_I	wrhpr	%r0, 0x198a, %hpstate
cpu_intr_2_88:
	setx	0x26033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2ace183  ! 996: ANDNcc_I	andncc 	%r19, 0x0183, %r25
	.word 0xbc95c000  ! 997: ORcc_R	orcc 	%r23, %r0, %r30
T2_asi_reg_wr_54:
	mov	0x3c8, %r14
	.word 0xfcf389e0  ! 999: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T2_asi_reg_rd_38:
	mov	0x30, %r14
	.word 0xf8db8e40  ! 1000: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_2_89:
	setx	0x27020b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_90:
	setx	0x250004, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_39:
	mov	0x8, %r14
	.word 0xfcdb84a0  ! 1005: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_2_72:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_72), 16, 16)) -> intp(2, 0, 3e)
iob_intr_2_73:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_73), 16, 16)) -> intp(2, 0, 2b)
	.word 0xb0a50000  ! 1009: SUBcc_R	subcc 	%r20, %r0, %r24
	ta	T_CHANGE_TO_TL1
cpu_intr_2_91:
	setx	0x270009, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_92:
	setx	0x260119, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_40:
	mov	0x29, %r14
	.word 0xfadb84a0  ! 1016: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_2_74:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_74), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf804c000  ! 1025: LDUW_R	lduw	[%r19 + %r0], %r28
	.word 0xb8056132  ! 1028: ADD_I	add 	%r21, 0x0132, %r28
T2_asi_reg_rd_41:
	mov	0xc, %r14
	.word 0xf6db8e60  ! 1030: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	ta	T_CHANGE_HPRIV
	.word 0xfcc4e1c1  ! 1034: LDSWA_I	ldswa	[%r19, + 0x01c1] %asi, %r30
	ta	T_CHANGE_TO_TL1
	.word 0xf64de112  ! 1043: LDSB_I	ldsb	[%r23 + 0x0112], %r27
	.word 0xb22c8000  ! 1044: ANDN_R	andn 	%r18, %r0, %r25
T2_asi_reg_wr_55:
	mov	0x25, %r14
	.word 0xfcf38e40  ! 1046: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_rd_42:
	mov	0x28, %r14
	.word 0xf2db8e40  ! 1048: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf41420a3  ! 1049: LDUH_I	lduh	[%r16 + 0x00a3], %r26
cpu_intr_2_93:
	setx	0x27031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe15c000  ! 1052: OR_R	or 	%r23, %r0, %r31
cpu_intr_2_94:
	setx	0x24013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_2_95:
	setx	0x260106, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_56:
	mov	0xb, %r14
	.word 0xf8f38400  ! 1061: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	.word 0xfe554000  ! 1063: LDSH_R	ldsh	[%r21 + %r0], %r31
	.word 0xf0c560e0  ! 1064: LDSWA_I	ldswa	[%r21, + 0x00e0] %asi, %r24
	.word 0xfcd4c020  ! 1065: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r30
	.word 0xfc8c210e  ! 1066: LDUBA_I	lduba	[%r16, + 0x010e] %asi, %r30
	.word 0xb815c000  ! 1067: OR_R	or 	%r23, %r0, %r28
	.word 0xfe540000  ! 1068: LDSH_R	ldsh	[%r16 + %r0], %r31
	.word 0xf6c48020  ! 1069: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r27
T2_asi_reg_rd_43:
	mov	0x16, %r14
	.word 0xf8db8e40  ! 1072: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_2_75:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_75), 16, 16)) -> intp(2, 0, 28)
T2_asi_reg_rd_44:
	mov	0x1b, %r14
	.word 0xf6db8e40  ! 1078: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_wr_57:
	mov	0x3c3, %r14
	.word 0xfef38400  ! 1080: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_2_96:
	setx	0x25001c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_76:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_76), 16, 16)) -> intp(2, 0, 34)
	.word 0xfe556074  ! 1089: LDSH_I	ldsh	[%r21 + 0x0074], %r31
	.word 0xb83c218a  ! 1091: XNOR_I	xnor 	%r16, 0x018a, %r28
	.word 0xfe05e04f  ! 1092: LDUW_I	lduw	[%r23 + 0x004f], %r31
cpu_intr_2_97:
	setx	0x240033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf455c000  ! 1096: LDSH_R	ldsh	[%r23 + %r0], %r26
cpu_intr_2_98:
	setx	0x270216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x899521ae  ! 1104: WRPR_TICK_I	wrpr	%r20, 0x01ae, %tick
	.word 0xf294607d  ! 1108: LDUHA_I	lduha	[%r17, + 0x007d] %asi, %r25
cpu_intr_2_99:
	setx	0x250025, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_77:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_77), 16, 16)) -> intp(2, 0, 25)
	ta	T_CHANGE_HPRIV
	.word 0xf60520a1  ! 1115: LDUW_I	lduw	[%r20 + 0x00a1], %r27
	.word 0xb2ad4000  ! 1116: ANDNcc_R	andncc 	%r21, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf494e0d5  ! 1118: LDUHA_I	lduha	[%r19, + 0x00d5] %asi, %r26
	.word 0xb73d8000  ! 1119: SRA_R	sra 	%r22, %r0, %r27
cpu_intr_2_100:
	setx	0x27001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb88da117  ! 1124: ANDcc_I	andcc 	%r22, 0x0117, %r28
cpu_intr_2_101:
	setx	0x270306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6dca022  ! 1129: LDXA_I	ldxa	[%r18, + 0x0022] %asi, %r27
iob_intr_2_78:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_78), 16, 16)) -> intp(2, 0, 2e)
cpu_intr_2_102:
	setx	0x240238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfccc20bf  ! 1135: LDSBA_I	ldsba	[%r16, + 0x00bf] %asi, %r30
cpu_intr_2_103:
	setx	0x260103, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_104:
	setx	0x24031c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_105:
	setx	0x260221, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_79:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_79), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_rd_45:
	mov	0x4, %r14
	.word 0xf8db89e0  ! 1146: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T2_asi_reg_wr_58:
	mov	0x3c6, %r14
	.word 0xf6f384a0  ! 1148: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T2_asi_reg_wr_59:
	mov	0x3c2, %r14
	.word 0xfcf384a0  ! 1149: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_2_80:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_80), 16, 16)) -> intp(2, 0, 20)
T2_asi_reg_rd_46:
	mov	0x3c8, %r14
	.word 0xf4db89e0  ! 1155: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_2_106:
	setx	0x270329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf28d200d  ! 1159: LDUBA_I	lduba	[%r20, + 0x000d] %asi, %r25
	.word 0xfacc21d4  ! 1161: LDSBA_I	ldsba	[%r16, + 0x01d4] %asi, %r29
T2_asi_reg_wr_60:
	mov	0x1c, %r14
	.word 0xfaf38e60  ! 1162: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T2_asi_reg_rd_47:
	mov	0x2f, %r14
	.word 0xfedb89e0  ! 1170: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_2_81:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_81), 16, 16)) -> intp(2, 0, 23)
T2_asi_reg_rd_48:
	mov	0x8, %r14
	.word 0xf6db8400  ! 1173: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_2_107:
	setx	0x240219, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_108:
	setx	0x25022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbabc6088  ! 1178: XNORcc_I	xnorcc 	%r17, 0x0088, %r29
iob_intr_2_82:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_82), 16, 16)) -> intp(2, 0, 14)
	.word 0xf6056001  ! 1180: LDUW_I	lduw	[%r21 + 0x0001], %r27
T2_asi_reg_rd_49:
	mov	0x3c4, %r14
	.word 0xfedb8400  ! 1182: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_2_109:
	setx	0x25023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6cc4020  ! 1186: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r27
	.word 0xfa8c8020  ! 1189: LDUBA_R	lduba	[%r18, %r0] 0x01, %r29
iob_intr_2_83:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_83), 16, 16)) -> intp(2, 0, 5)
	.word 0xf20c8000  ! 1195: LDUB_R	ldub	[%r18 + %r0], %r25
	.word 0xf0d520a4  ! 1197: LDSHA_I	ldsha	[%r20, + 0x00a4] %asi, %r24
	.word 0xf8954020  ! 1201: LDUHA_R	lduha	[%r21, %r0] 0x01, %r28
cpu_intr_2_110:
	setx	0x240012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0c5c020  ! 1207: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r24
	.word 0xf08d4020  ! 1208: LDUBA_R	lduba	[%r21, %r0] 0x01, %r24
T2_asi_reg_wr_61:
	mov	0x22, %r14
	.word 0xf2f38e40  ! 1210: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbe0c8000  ! 1212: AND_R	and 	%r18, %r0, %r31
	.word 0xb245618f  ! 1216: ADDC_I	addc 	%r21, 0x018f, %r25
T2_asi_reg_rd_50:
	mov	0x3c2, %r14
	.word 0xfadb84a0  ! 1217: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983b52  ! 1218: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b52, %hpstate
T2_asi_reg_wr_62:
	mov	0x33, %r14
	.word 0xf2f38e80  ! 1220: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf6c48020  ! 1221: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r27
iob_intr_2_84:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_84), 16, 16)) -> intp(2, 0, 39)
	.word 0xbc44c000  ! 1235: ADDC_R	addc 	%r19, %r0, %r30
	.word 0xfc548000  ! 1238: LDSH_R	ldsh	[%r18 + %r0], %r30
cpu_intr_2_111:
	setx	0x24012b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_112:
	setx	0x24012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0d0000  ! 1243: LDUB_R	ldub	[%r20 + %r0], %r31
	.word 0xf24c0000  ! 1244: LDSB_R	ldsb	[%r16 + %r0], %r25
iob_intr_2_85:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_85), 16, 16)) -> intp(2, 0, 19)
cpu_intr_2_113:
	setx	0x25022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe440000  ! 1258: LDSW_R	ldsw	[%r16 + %r0], %r31
	.word 0xf64c6059  ! 1261: LDSB_I	ldsb	[%r17 + 0x0059], %r27
	.word 0xbe35a135  ! 1266: SUBC_I	orn 	%r22, 0x0135, %r31
	.word 0xb83520cc  ! 1267: ORN_I	orn 	%r20, 0x00cc, %r28
iob_intr_2_86:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_86), 16, 16)) -> intp(2, 0, b)
	.word 0xfe454000  ! 1272: LDSW_R	ldsw	[%r21 + %r0], %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983a1a  ! 1276: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a1a, %hpstate
	.word 0xfed50020  ! 1279: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r31
iob_intr_2_87:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_87), 16, 16)) -> intp(2, 0, 1a)
	.word 0xfc4421df  ! 1282: LDSW_I	ldsw	[%r16 + 0x01df], %r30
iob_intr_2_88:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_88), 16, 16)) -> intp(2, 0, 27)
T2_asi_reg_wr_63:
	mov	0x3c6, %r14
	.word 0xf4f38e80  ! 1285: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xfe854020  ! 1288: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r31
	ta	T_CHANGE_HPRIV
	.word 0xb0c40000  ! 1291: ADDCcc_R	addccc 	%r16, %r0, %r24
	.word 0xfc4d20ed  ! 1292: LDSB_I	ldsb	[%r20 + 0x00ed], %r30
	.word 0xf85d4000  ! 1296: LDX_R	ldx	[%r21 + %r0], %r28
T2_asi_reg_wr_64:
	mov	0xe, %r14
	.word 0xf0f38e40  ! 1298: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbea54000  ! 1301: SUBcc_R	subcc 	%r21, %r0, %r31
	.word 0xfe558000  ! 1303: LDSH_R	ldsh	[%r22 + %r0], %r31
	ta	T_CHANGE_TO_TL1
	.word 0xf44cc000  ! 1305: LDSB_R	ldsb	[%r19 + %r0], %r26
	.word 0xf48da081  ! 1308: LDUBA_I	lduba	[%r22, + 0x0081] %asi, %r26
	.word 0xf0dce12b  ! 1310: LDXA_I	ldxa	[%r19, + 0x012b] %asi, %r24
iob_intr_2_89:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_89), 16, 16)) -> intp(2, 0, 1b)
iob_intr_2_90:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_90), 16, 16)) -> intp(2, 0, 25)
	.word 0xfed5c020  ! 1316: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r31
	.word 0xfe95a1c5  ! 1320: LDUHA_I	lduha	[%r22, + 0x01c5] %asi, %r31
	.word 0xf64d0000  ! 1321: LDSB_R	ldsb	[%r20 + %r0], %r27
cpu_intr_2_114:
	setx	0x260333, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_91:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_91), 16, 16)) -> intp(2, 0, 28)
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983f5a  ! 1332: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f5a, %hpstate
	.word 0xf2d5e0a7  ! 1333: LDSHA_I	ldsha	[%r23, + 0x00a7] %asi, %r25
	.word 0xfe0da101  ! 1334: LDUB_I	ldub	[%r22 + 0x0101], %r31
cpu_intr_2_115:
	setx	0x10315, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_65:
	mov	0x3c5, %r14
	.word 0xf8f38e40  ! 1342: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_92:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_92), 16, 16)) -> intp(2, 0, 27)
	.word 0xb97d8400  ! 1346: MOVR_R	movre	%r22, %r0, %r28
cpu_intr_2_116:
	setx	0x270021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0d42168  ! 1348: LDSHA_I	ldsha	[%r16, + 0x0168] %asi, %r24
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982a18  ! 1354: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a18, %hpstate
T2_asi_reg_wr_66:
	mov	0x32, %r14
	.word 0xf4f389e0  ! 1355: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983842  ! 1357: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1842, %hpstate
	.word 0xb17c8400  ! 1358: MOVR_R	movre	%r18, %r0, %r24
iob_intr_2_93:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_93), 16, 16)) -> intp(2, 0, 22)
cpu_intr_2_117:
	setx	0x270139, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_94:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_94), 16, 16)) -> intp(2, 0, 10)
	ta	T_CHANGE_TO_TL1
	.word 0xf6cd20d7  ! 1364: LDSBA_I	ldsba	[%r20, + 0x00d7] %asi, %r27
T2_asi_reg_wr_67:
	mov	0x5, %r14
	.word 0xf0f38e40  ! 1365: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_rd_51:
	mov	0x5, %r14
	.word 0xf0db8e60  ! 1366: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xfc8d0020  ! 1368: LDUBA_R	lduba	[%r20, %r0] 0x01, %r30
T2_asi_reg_wr_68:
	mov	0x17, %r14
	.word 0xf4f38e60  ! 1369: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T2_asi_reg_rd_52:
	mov	0x12, %r14
	.word 0xf8db89e0  ! 1375: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_2_95:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_95), 16, 16)) -> intp(2, 0, d)
T2_asi_reg_rd_53:
	mov	0x3c7, %r14
	.word 0xfcdb89e0  ! 1378: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T2_asi_reg_wr_69:
	mov	0x1d, %r14
	.word 0xf2f389e0  ! 1381: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xfa4d0000  ! 1383: LDSB_R	ldsb	[%r20 + %r0], %r29
	.word 0xb4c56052  ! 1385: ADDCcc_I	addccc 	%r21, 0x0052, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf8cc0020  ! 1388: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r28
T2_asi_reg_wr_70:
	mov	0x1c, %r14
	.word 0xfaf38e40  ! 1389: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_rd_54:
	mov	0x3c1, %r14
	.word 0xfcdb84a0  ! 1390: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_2_118:
	setx	0x280309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf20c8000  ! 1392: LDUB_R	ldub	[%r18 + %r0], %r25
cpu_intr_2_119:
	setx	0x2a0204, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_55:
	mov	0x28, %r14
	.word 0xf6db8400  ! 1398: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	ta	T_CHANGE_HPRIV
	.word 0xf88ca0df  ! 1407: LDUBA_I	lduba	[%r18, + 0x00df] %asi, %r28
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_56:
	mov	0x12, %r14
	.word 0xf4db84a0  ! 1410: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf844c000  ! 1412: LDSW_R	ldsw	[%r19 + %r0], %r28
T2_asi_reg_rd_57:
	mov	0x3c7, %r14
	.word 0xf4db8e40  ! 1413: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_HPRIV
	.word 0xf2940020  ! 1421: LDUHA_R	lduha	[%r16, %r0] 0x01, %r25
iob_intr_2_96:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_96), 16, 16)) -> intp(2, 0, 8)
	.word 0xb035a10a  ! 1423: SUBC_I	orn 	%r22, 0x010a, %r24
cpu_intr_2_120:
	setx	0x2a030e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_97:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_97), 16, 16)) -> intp(2, 0, 22)
	.word 0xfc050000  ! 1426: LDUW_R	lduw	[%r20 + %r0], %r30
	ta	T_CHANGE_TO_TL0
	.word 0xf8cca02b  ! 1428: LDSBA_I	ldsba	[%r18, + 0x002b] %asi, %r28
cpu_intr_2_121:
	setx	0x290220, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_98:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_98), 16, 16)) -> intp(2, 0, 31)
	.word 0xf685c020  ! 1431: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r27
	.word 0xfa554000  ! 1432: LDSH_R	ldsh	[%r21 + %r0], %r29
	.word 0xfe044000  ! 1434: LDUW_R	lduw	[%r17 + %r0], %r31
	.word 0xf0c4a062  ! 1436: LDSWA_I	ldswa	[%r18, + 0x0062] %asi, %r24
cpu_intr_2_122:
	setx	0x29011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_2_99:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_99), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_rd_58:
	mov	0x3c5, %r14
	.word 0xf2db8e80  ! 1444: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbd2db001  ! 1447: SLLX_I	sllx	%r22, 0x0001, %r30
iob_intr_2_100:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_100), 16, 16)) -> intp(2, 0, 21)
	.word 0xbc25209b  ! 1450: SUB_I	sub 	%r20, 0x009b, %r30
	.word 0xbcade1eb  ! 1454: ANDNcc_I	andncc 	%r23, 0x01eb, %r30
T2_asi_reg_rd_59:
	mov	0x21, %r14
	.word 0xf2db8400  ! 1456: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_60:
	mov	0x3c7, %r14
	.word 0xf6db8e40  ! 1460: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf814a139  ! 1461: LDUH_I	lduh	[%r18 + 0x0139], %r28
iob_intr_2_101:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_101), 16, 16)) -> intp(2, 0, 1c)
cpu_intr_2_123:
	setx	0x2b0312, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_102:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_102), 16, 16)) -> intp(2, 0, 3a)
cpu_intr_2_124:
	setx	0x2b0325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe15c000  ! 1469: OR_R	or 	%r23, %r0, %r31
T2_asi_reg_wr_71:
	mov	0x2d, %r14
	.word 0xfef38400  ! 1470: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T2_asi_reg_rd_61:
	mov	0x24, %r14
	.word 0xf2db8e60  ! 1475: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T2_asi_reg_rd_62:
	mov	0x16, %r14
	.word 0xf6db89e0  ! 1480: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_2_103:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_103), 16, 16)) -> intp(2, 0, 3e)
cpu_intr_2_125:
	setx	0x280334, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_126:
	setx	0x29032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8cc616f  ! 1487: LDSBA_I	ldsba	[%r17, + 0x016f] %asi, %r28
cpu_intr_2_127:
	setx	0x2b010f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_128:
	setx	0x2a033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ccc020  ! 1492: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r24
T2_asi_reg_rd_63:
	mov	0x3c7, %r14
	.word 0xf6db8e60  ! 1493: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_72:
	mov	0x26, %r14
	.word 0xf2f384a0  ! 1497: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf205c000  ! 1504: LDUW_R	lduw	[%r23 + %r0], %r25
	.word 0xfc8c60a3  ! 1512: LDUBA_I	lduba	[%r17, + 0x00a3] %asi, %r30
	.word 0xbf3c8000  ! 1513: SRA_R	sra 	%r18, %r0, %r31
	.word 0xb4bde000  ! 1517: XNORcc_I	xnorcc 	%r23, 0x0000, %r26
iob_intr_2_104:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_104), 16, 16)) -> intp(2, 0, 3b)
T2_asi_reg_wr_73:
	mov	0x22, %r14
	.word 0xfef384a0  ! 1520: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xfec5a17a  ! 1521: LDSWA_I	ldswa	[%r22, + 0x017a] %asi, %r31
	.word 0xfc95204a  ! 1522: LDUHA_I	lduha	[%r20, + 0x004a] %asi, %r30
cpu_intr_2_129:
	setx	0x28010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85da1b8  ! 1525: LDX_I	ldx	[%r22 + 0x01b8], %r28
	.word 0xf6c58020  ! 1527: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r27
cpu_intr_2_130:
	setx	0x2b0101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe2ce10c  ! 1529: ANDN_I	andn 	%r19, 0x010c, %r31
	.word 0xf0cc0020  ! 1531: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r24
	.word 0xf885c020  ! 1532: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r28
	.word 0xf28c4020  ! 1533: LDUBA_R	lduba	[%r17, %r0] 0x01, %r25
	ta	T_CHANGE_HPRIV
	.word 0xf0c560c9  ! 1535: LDSWA_I	ldswa	[%r21, + 0x00c9] %asi, %r24
	ta	T_CHANGE_TO_TL1
cpu_intr_2_131:
	setx	0x2b0014, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_132:
	setx	0x280113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b58000  ! 1542: ORNcc_R	orncc 	%r22, %r0, %r24
	.word 0xfc4c2064  ! 1543: LDSB_I	ldsb	[%r16 + 0x0064], %r30
	.word 0xfa45e18f  ! 1546: LDSW_I	ldsw	[%r23 + 0x018f], %r29
	.word 0xf0044000  ! 1547: LDUW_R	lduw	[%r17 + %r0], %r24
cpu_intr_2_133:
	setx	0x2b022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04ce133  ! 1549: LDSB_I	ldsb	[%r19 + 0x0133], %r24
T2_asi_reg_wr_74:
	mov	0x2e, %r14
	.word 0xf0f38e80  ! 1553: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf40dc000  ! 1555: LDUB_R	ldub	[%r23 + %r0], %r26
	.word 0xf24d607b  ! 1556: LDSB_I	ldsb	[%r21 + 0x007b], %r25
T2_asi_reg_rd_64:
	mov	0x15, %r14
	.word 0xfedb84a0  ! 1557: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xfe8d4020  ! 1558: LDUBA_R	lduba	[%r21, %r0] 0x01, %r31
	.word 0xfc0ca14d  ! 1559: LDUB_I	ldub	[%r18 + 0x014d], %r30
	.word 0xf6848020  ! 1560: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r27
iob_intr_2_105:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_105), 16, 16)) -> intp(2, 0, 9)
	.word 0xf6c520db  ! 1564: LDSWA_I	ldswa	[%r20, + 0x00db] %asi, %r27
	ta	T_CHANGE_HPRIV
	.word 0xfa8d4020  ! 1568: LDUBA_R	lduba	[%r21, %r0] 0x01, %r29
iob_intr_2_106:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_106), 16, 16)) -> intp(2, 0, 25)
	.word 0xfe5d20ea  ! 1570: LDX_I	ldx	[%r20 + 0x00ea], %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_107:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_107), 16, 16)) -> intp(2, 0, 23)
	.word 0xfe4d8000  ! 1580: LDSB_R	ldsb	[%r22 + %r0], %r31
T2_asi_reg_rd_65:
	mov	0x12, %r14
	.word 0xf8db89e0  ! 1585: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_2_134:
	setx	0x280117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb33ce001  ! 1591: SRA_I	sra 	%r19, 0x0001, %r25
	.word 0xf085218d  ! 1592: LDUWA_I	lduwa	[%r20, + 0x018d] %asi, %r24
	.word 0xfe846113  ! 1594: LDUWA_I	lduwa	[%r17, + 0x0113] %asi, %r31
	.word 0xfedc20b9  ! 1595: LDXA_I	ldxa	[%r16, + 0x00b9] %asi, %r31
cpu_intr_2_135:
	setx	0x2b0008, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_75:
	mov	0x3c3, %r14
	.word 0xfef384a0  ! 1598: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_2_136:
	setx	0x29022c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_108:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_108), 16, 16)) -> intp(2, 0, 27)
	.word 0xf8d5e073  ! 1603: LDSHA_I	ldsha	[%r23, + 0x0073] %asi, %r28
	.word 0xfa944020  ! 1604: LDUHA_R	lduha	[%r17, %r0] 0x01, %r29
	.word 0xb37c4400  ! 1605: MOVR_R	movre	%r17, %r0, %r25
	.word 0xbf3d0000  ! 1606: SRA_R	sra 	%r20, %r0, %r31
	.word 0xfa4c8000  ! 1608: LDSB_R	ldsb	[%r18 + %r0], %r29
T2_asi_reg_rd_66:
	mov	0x2a, %r14
	.word 0xfcdb8e80  ! 1611: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_2_109:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_109), 16, 16)) -> intp(2, 0, c)
cpu_intr_2_137:
	setx	0x2b0038, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_67:
	mov	0x36, %r14
	.word 0xf0db8400  ! 1615: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf0d561ca  ! 1618: LDSHA_I	ldsha	[%r21, + 0x01ca] %asi, %r24
iob_intr_2_110:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_110), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_rd_68:
	mov	0xf, %r14
	.word 0xfcdb8e60  ! 1620: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xfc940020  ! 1621: LDUHA_R	lduha	[%r16, %r0] 0x01, %r30
iob_intr_2_111:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_111), 16, 16)) -> intp(2, 0, 31)
T2_asi_reg_wr_76:
	mov	0x25, %r14
	.word 0xf4f38e60  ! 1627: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf4040000  ! 1628: LDUW_R	lduw	[%r16 + %r0], %r26
cpu_intr_2_138:
	setx	0x290122, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_139:
	setx	0x28021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2148000  ! 1641: LDUH_R	lduh	[%r18 + %r0], %r25
	.word 0xf4d4616b  ! 1643: LDSHA_I	ldsha	[%r17, + 0x016b] %asi, %r26
iob_intr_2_112:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_112), 16, 16)) -> intp(2, 0, b)
T2_asi_reg_rd_69:
	mov	0x3c2, %r14
	.word 0xfedb89e0  ! 1649: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf2ccc020  ! 1650: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r25
	.word 0xfc956160  ! 1652: LDUHA_I	lduha	[%r21, + 0x0160] %asi, %r30
cpu_intr_2_140:
	setx	0x29002b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_113:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_113), 16, 16)) -> intp(2, 0, 39)
	ta	T_CHANGE_NONHPRIV
	.word 0xf4c5a04c  ! 1661: LDSWA_I	ldswa	[%r22, + 0x004c] %asi, %r26
	.word 0xf4550000  ! 1662: LDSH_R	ldsh	[%r20 + %r0], %r26
T2_asi_reg_rd_70:
	mov	0xb, %r14
	.word 0xf8db8e60  ! 1663: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_77:
	mov	0x3c3, %r14
	.word 0xf0f38e80  ! 1668: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xfcc5e137  ! 1669: LDSWA_I	ldswa	[%r23, + 0x0137] %asi, %r30
cpu_intr_2_141:
	setx	0x2b0002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_114:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_114), 16, 16)) -> intp(2, 0, 5)
cpu_intr_2_142:
	setx	0x2a021f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_78:
	mov	0x16, %r14
	.word 0xf8f38e60  ! 1684: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf8d44020  ! 1685: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r28
	ta	T_CHANGE_TO_TL0
	.word 0xf085e1d8  ! 1688: LDUWA_I	lduwa	[%r23, + 0x01d8] %asi, %r24
	.word 0xb0240000  ! 1691: SUB_R	sub 	%r16, %r0, %r24
	.word 0xfe054000  ! 1693: LDUW_R	lduw	[%r21 + %r0], %r31
iob_intr_2_115:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_115), 16, 16)) -> intp(2, 0, 5)
	.word 0xf44da04f  ! 1697: LDSB_I	ldsb	[%r22 + 0x004f], %r26
cpu_intr_2_143:
	setx	0x29020d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_116:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_116), 16, 16)) -> intp(2, 0, 1c)
iob_intr_2_117:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_117), 16, 16)) -> intp(2, 0, 18)
cpu_intr_2_144:
	setx	0x29012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4cd2131  ! 1708: LDSBA_I	ldsba	[%r20, + 0x0131] %asi, %r26
	setx	data_start_4, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982b82  ! 1710: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b82, %hpstate
cpu_intr_2_145:
	setx	0x2a0227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd35b001  ! 1712: SRLX_I	srlx	%r22, 0x0001, %r30
	ta	T_CHANGE_TO_TL1
	.word 0xf204c000  ! 1717: LDUW_R	lduw	[%r19 + %r0], %r25
	.word 0xf84d0000  ! 1719: LDSB_R	ldsb	[%r20 + %r0], %r28
	.word 0xbb7c4400  ! 1722: MOVR_R	movre	%r17, %r0, %r29
	.word 0xf4ccc020  ! 1724: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r26
	.word 0xfa058000  ! 1725: LDUW_R	lduw	[%r22 + %r0], %r29
	.word 0xf20cc000  ! 1726: LDUB_R	ldub	[%r19 + %r0], %r25
cpu_intr_2_146:
	setx	0x2b0336, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_118:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_118), 16, 16)) -> intp(2, 0, 6)
iob_intr_2_119:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_119), 16, 16)) -> intp(2, 0, f)
	.word 0xb61cc000  ! 1735: XOR_R	xor 	%r19, %r0, %r27
	.word 0x8f902000  ! 1738: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xfc154000  ! 1739: LDUH_R	lduh	[%r21 + %r0], %r30
cpu_intr_2_147:
	setx	0x2b0314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe9ca0d1  ! 1742: XORcc_I	xorcc 	%r18, 0x00d1, %r31
	ta	T_CHANGE_HPRIV
	.word 0xf8dc610d  ! 1747: LDXA_I	ldxa	[%r17, + 0x010d] %asi, %r28
	.word 0xf245a117  ! 1749: LDSW_I	ldsw	[%r22 + 0x0117], %r25
T2_asi_reg_wr_79:
	mov	0x31, %r14
	.word 0xfef38e40  ! 1750: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfc0c4000  ! 1751: LDUB_R	ldub	[%r17 + %r0], %r30
cpu_intr_2_148:
	setx	0x2b0338, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_120:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_120), 16, 16)) -> intp(2, 0, 16)
	.word 0xfe95e0e4  ! 1756: LDUHA_I	lduha	[%r23, + 0x00e4] %asi, %r31
cpu_intr_2_149:
	setx	0x2b031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf854e09b  ! 1759: LDSH_I	ldsh	[%r19 + 0x009b], %r28
iob_intr_2_121:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_121), 16, 16)) -> intp(2, 0, 6)
	.word 0xf254a125  ! 1764: LDSH_I	ldsh	[%r18 + 0x0125], %r25
	.word 0xb550c000  ! 1767: RDPR_TT	<illegal instruction>
iob_intr_2_122:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_122), 16, 16)) -> intp(2, 0, 1)
iob_intr_2_123:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_123), 16, 16)) -> intp(2, 0, 12)
iob_intr_2_124:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_124), 16, 16)) -> intp(2, 0, 23)
	.word 0xf6048000  ! 1772: LDUW_R	lduw	[%r18 + %r0], %r27
	.word 0xb1510000  ! 1774: RDPR_TICK	<illegal instruction>
iob_intr_2_125:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_125), 16, 16)) -> intp(2, 0, 2f)
	.word 0xfa944020  ! 1778: LDUHA_R	lduha	[%r17, %r0] 0x01, %r29
cpu_intr_2_150:
	setx	0x28020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf48da034  ! 1784: LDUBA_I	lduba	[%r22, + 0x0034] %asi, %r26
cpu_intr_2_151:
	setx	0x28022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04c2027  ! 1791: LDSB_I	ldsb	[%r16 + 0x0027], %r24
cpu_intr_2_152:
	setx	0x28013a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_126:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_126), 16, 16)) -> intp(2, 0, d)
iob_intr_2_127:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_127), 16, 16)) -> intp(2, 0, 3c)
iob_intr_2_128:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_128), 16, 16)) -> intp(2, 0, 11)
T2_asi_reg_wr_80:
	mov	0x4, %r14
	.word 0xfcf38e80  ! 1804: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_71:
	mov	0x3c4, %r14
	.word 0xf2db8e40  ! 1808: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfcc44020  ! 1809: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r30
	.word 0xf4558000  ! 1810: LDSH_R	ldsh	[%r22 + %r0], %r26
	.word 0xfac54020  ! 1822: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r29
cpu_intr_2_153:
	setx	0x290219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe4460bb  ! 1828: ADDC_I	addc 	%r17, 0x00bb, %r31
T2_asi_reg_rd_72:
	mov	0xd, %r14
	.word 0xfcdb84a0  ! 1834: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0x8f902000  ! 1835: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
T2_asi_reg_wr_81:
	mov	0x27, %r14
	.word 0xfef38e40  ! 1836: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_rd_73:
	mov	0x2c, %r14
	.word 0xf0db8e40  ! 1837: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_154:
	setx	0x2e021f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_155:
	setx	0x2e020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x879420ef  ! 1842: WRPR_TT_I	wrpr	%r16, 0x00ef, %tt
	.word 0xfedce191  ! 1846: LDXA_I	ldxa	[%r19, + 0x0191] %asi, %r31
	.word 0xfad4600a  ! 1849: LDSHA_I	ldsha	[%r17, + 0x000a] %asi, %r29
	.word 0xb034c000  ! 1851: SUBC_R	orn 	%r19, %r0, %r24
cpu_intr_2_156:
	setx	0x2c0326, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_129:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_129), 16, 16)) -> intp(2, 0, 21)
T2_asi_reg_rd_74:
	mov	0x37, %r14
	.word 0xf0db8e80  ! 1856: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xfc1561f8  ! 1858: LDUH_I	lduh	[%r21 + 0x01f8], %r30
	.word 0xfe444000  ! 1859: LDSW_R	ldsw	[%r17 + %r0], %r31
T2_asi_reg_wr_82:
	mov	0x3c3, %r14
	.word 0xf0f38400  ! 1862: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_2_157:
	setx	0x2f022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0de15a  ! 1865: LDUB_I	ldub	[%r23 + 0x015a], %r31
T2_asi_reg_rd_75:
	mov	0x38, %r14
	.word 0xf8db8e80  ! 1867: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf6858020  ! 1868: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r27
	.word 0xf25421a1  ! 1869: LDSH_I	ldsh	[%r16 + 0x01a1], %r25
	.word 0xf0d58020  ! 1870: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r24
	.word 0xba1d4000  ! 1871: XOR_R	xor 	%r21, %r0, %r29
T2_asi_reg_wr_83:
	mov	0x36, %r14
	.word 0xfaf38e60  ! 1874: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xfccca034  ! 1875: LDSBA_I	ldsba	[%r18, + 0x0034] %asi, %r30
	.word 0xb645212d  ! 1877: ADDC_I	addc 	%r20, 0x012d, %r27
T2_asi_reg_rd_76:
	mov	0xc, %r14
	.word 0xfcdb84a0  ! 1878: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbe84c000  ! 1880: ADDcc_R	addcc 	%r19, %r0, %r31
	.word 0xf4954020  ! 1886: LDUHA_R	lduha	[%r21, %r0] 0x01, %r26
iob_intr_2_130:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_130), 16, 16)) -> intp(2, 0, 33)
	.word 0xf45d6013  ! 1890: LDX_I	ldx	[%r21 + 0x0013], %r26
	.word 0xf6c5e040  ! 1892: LDSWA_I	ldswa	[%r23, + 0x0040] %asi, %r27
	.word 0xbec4e17e  ! 1896: ADDCcc_I	addccc 	%r19, 0x017e, %r31
iob_intr_2_131:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_131), 16, 16)) -> intp(2, 0, 9)
	.word 0xfe5d4000  ! 1899: LDX_R	ldx	[%r21 + %r0], %r31
iob_intr_2_132:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_132), 16, 16)) -> intp(2, 0, a)
	.word 0xb4148000  ! 1902: OR_R	or 	%r18, %r0, %r26
cpu_intr_2_158:
	setx	0x2d001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982e0a  ! 1910: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e0a, %hpstate
	.word 0xf24cc000  ! 1913: LDSB_R	ldsb	[%r19 + %r0], %r25
iob_intr_2_133:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_133), 16, 16)) -> intp(2, 0, 1f)
T2_asi_reg_wr_84:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 1917: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf84c8000  ! 1918: LDSB_R	ldsb	[%r18 + %r0], %r28
	.word 0xfe15e1af  ! 1919: LDUH_I	lduh	[%r23 + 0x01af], %r31
cpu_intr_2_159:
	setx	0x2c000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44c4000  ! 1924: LDSB_R	ldsb	[%r17 + %r0], %r26
	.word 0xfc85e0ab  ! 1926: LDUWA_I	lduwa	[%r23, + 0x00ab] %asi, %r30
T2_asi_reg_wr_85:
	mov	0x27, %r14
	.word 0xf8f38e40  ! 1929: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf80c8000  ! 1930: LDUB_R	ldub	[%r18 + %r0], %r28
iob_intr_2_134:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_134), 16, 16)) -> intp(2, 0, 31)
T2_asi_reg_rd_77:
	mov	0x3c1, %r14
	.word 0xf4db8e60  ! 1933: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T2_asi_reg_wr_86:
	mov	0x2d, %r14
	.word 0xf8f38400  ! 1934: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_2_160:
	setx	0x2c033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc0c8000  ! 1937: LDUB_R	ldub	[%r18 + %r0], %r30
	ta	T_CHANGE_NONHPRIV
	.word 0xb37c8400  ! 1939: MOVR_R	movre	%r18, %r0, %r25
T2_asi_reg_rd_78:
	mov	0x3c5, %r14
	.word 0xfadb8e40  ! 1941: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_rd_79:
	mov	0x3c3, %r14
	.word 0xf0db8e40  ! 1947: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_80:
	mov	0x35, %r14
	.word 0xf6db84a0  ! 1950: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_2_135:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_135), 16, 16)) -> intp(2, 0, 8)
iob_intr_2_136:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_136), 16, 16)) -> intp(2, 0, 19)
cpu_intr_2_161:
	setx	0x2d0132, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_137:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_137), 16, 16)) -> intp(2, 0, 23)
	.word 0xb5540000  ! 1961: RDPR_GL	<illegal instruction>
	.word 0xb49c0000  ! 1963: XORcc_R	xorcc 	%r16, %r0, %r26
iob_intr_2_138:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_138), 16, 16)) -> intp(2, 0, 29)
iob_intr_2_139:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_139), 16, 16)) -> intp(2, 0, 2)
	.word 0xf2d4a01c  ! 1966: LDSHA_I	ldsha	[%r18, + 0x001c] %asi, %r25
iob_intr_2_140:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_140), 16, 16)) -> intp(2, 0, 35)
iob_intr_2_141:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_141), 16, 16)) -> intp(2, 0, 4)
T2_asi_reg_rd_81:
	mov	0x36, %r14
	.word 0xf8db89e0  ! 1969: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T2_asi_reg_wr_87:
	mov	0x3c2, %r14
	.word 0xfef384a0  ! 1970: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_2_142:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_142), 16, 16)) -> intp(2, 0, 21)
	.word 0xf405c000  ! 1975: LDUW_R	lduw	[%r23 + %r0], %r26
	.word 0xfac50020  ! 1976: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r29
cpu_intr_2_162:
	setx	0x2c0224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4de11c  ! 1980: LDSB_I	ldsb	[%r23 + 0x011c], %r30
	.word 0xb694c000  ! 1981: ORcc_R	orcc 	%r19, %r0, %r27
	.word 0xf2d46191  ! 1982: LDSHA_I	ldsha	[%r17, + 0x0191] %asi, %r25
iob_intr_2_143:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_143), 16, 16)) -> intp(2, 0, 3b)
iob_intr_2_144:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_144), 16, 16)) -> intp(2, 0, 18)
	.word 0xf0450000  ! 1986: LDSW_R	ldsw	[%r20 + %r0], %r24
iob_intr_2_145:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_145), 16, 16)) -> intp(2, 0, a)
iob_intr_2_146:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_146), 16, 16)) -> intp(2, 0, 3)
	ta	T_CHANGE_NONHPRIV
	.word 0xf6156170  ! 1994: LDUH_I	lduh	[%r21 + 0x0170], %r27
	.word 0xfa950020  ! 1996: LDUHA_R	lduha	[%r20, %r0] 0x01, %r29
iob_intr_2_147:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_147), 16, 16)) -> intp(2, 0, 11)
	.word 0xf295e124  ! 1999: LDUHA_I	lduha	[%r23, + 0x0124] %asi, %r25
	.word 0xfc95e1b0  ! 2000: LDUHA_I	lduha	[%r23, + 0x01b0] %asi, %r30
	.word 0xbec421a0  ! 2002: ADDCcc_I	addccc 	%r16, 0x01a0, %r31
	.word 0xf8958020  ! 2005: LDUHA_R	lduha	[%r22, %r0] 0x01, %r28
	.word 0xfe0de149  ! 2006: LDUB_I	ldub	[%r23 + 0x0149], %r31
	.word 0xf20d6068  ! 2007: LDUB_I	ldub	[%r21 + 0x0068], %r25
T2_asi_reg_wr_88:
	mov	0x14, %r14
	.word 0xfaf384a0  ! 2008: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xf655e1e7  ! 2009: LDSH_I	ldsh	[%r23 + 0x01e7], %r27
T2_asi_reg_wr_89:
	mov	0x32, %r14
	.word 0xf8f38e40  ! 2010: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_wr_90:
	mov	0x3c0, %r14
	.word 0xfef38e80  ! 2011: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	ta	T_CHANGE_NONHPRIV
	.word 0xf2840020  ! 2015: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r25
cpu_intr_2_163:
	setx	0x2d0216, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_82:
	mov	0x1b, %r14
	.word 0xf0db84a0  ! 2017: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf2c46013  ! 2019: LDSWA_I	ldswa	[%r17, + 0x0013] %asi, %r25
	.word 0xf895a1a4  ! 2020: LDUHA_I	lduha	[%r22, + 0x01a4] %asi, %r28
	.word 0xb97d6401  ! 2021: MOVR_I	movre	%r21, 0x1, %r28
cpu_intr_2_164:
	setx	0x2c033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xb0bcc000  ! 2025: XNORcc_R	xnorcc 	%r19, %r0, %r24
cpu_intr_2_165:
	setx	0x2c0234, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_91:
	mov	0x3c2, %r14
	.word 0xf0f389e0  ! 2027: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T2_asi_reg_wr_92:
	mov	0x6, %r14
	.word 0xfcf38e60  ! 2028: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T2_asi_reg_rd_83:
	mov	0x3c6, %r14
	.word 0xfcdb8e80  ! 2029: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_2_148:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_148), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_rd_84:
	mov	0xf, %r14
	.word 0xf0db8e80  ! 2036: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xfcc42033  ! 2038: LDSWA_I	ldswa	[%r16, + 0x0033] %asi, %r30
	.word 0xf4942058  ! 2040: LDUHA_I	lduha	[%r16, + 0x0058] %asi, %r26
cpu_intr_2_166:
	setx	0x2d0017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04da178  ! 2042: LDSB_I	ldsb	[%r22 + 0x0178], %r24
T2_asi_reg_rd_85:
	mov	0xa, %r14
	.word 0xfedb84a0  ! 2043: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T2_asi_reg_rd_86:
	mov	0x3c5, %r14
	.word 0xf2db89e0  ! 2045: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xfa44614b  ! 2047: LDSW_I	ldsw	[%r17 + 0x014b], %r29
iob_intr_2_149:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_149), 16, 16)) -> intp(2, 0, 4)
T2_asi_reg_rd_87:
	mov	0x3c7, %r14
	.word 0xfcdb84a0  ! 2049: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T2_asi_reg_rd_88:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 2051: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_2_167:
	setx	0x2e011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8144000  ! 2053: LDUH_R	lduh	[%r17 + %r0], %r28
	.word 0xfc4d8000  ! 2054: LDSB_R	ldsb	[%r22 + %r0], %r30
iob_intr_2_150:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_150), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf4cd8020  ! 2058: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r26
	.word 0xb4348000  ! 2064: SUBC_R	orn 	%r18, %r0, %r26
	.word 0xf6c44020  ! 2066: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r27
	.word 0xf4150000  ! 2069: LDUH_R	lduh	[%r20 + %r0], %r26
cpu_intr_2_168:
	setx	0x2f013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec4610e  ! 2073: LDSWA_I	ldswa	[%r17, + 0x010e] %asi, %r31
cpu_intr_2_169:
	setx	0x2f032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa048000  ! 2077: LDUW_R	lduw	[%r18 + %r0], %r29
	.word 0xbc046060  ! 2078: ADD_I	add 	%r17, 0x0060, %r30
T2_asi_reg_rd_89:
	mov	0x26, %r14
	.word 0xfedb8400  ! 2082: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_2_170:
	setx	0x2f0120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_171:
	setx	0x2c033f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_172:
	setx	0x2e003a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_90:
	mov	0x1, %r14
	.word 0xf8db8e60  ! 2091: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T2_asi_reg_rd_91:
	mov	0x12, %r14
	.word 0xf8db8e80  ! 2092: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb951c000  ! 2097: RDPR_TL	<illegal instruction>
	.word 0xb88d21da  ! 2107: ANDcc_I	andcc 	%r20, 0x01da, %r28
iob_intr_2_151:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_151), 16, 16)) -> intp(2, 0, 3d)
iob_intr_2_152:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_152), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf2dc2047  ! 2115: LDXA_I	ldxa	[%r16, + 0x0047] %asi, %r25
T2_asi_reg_rd_92:
	mov	0x3c4, %r14
	.word 0xfedb8400  ! 2116: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_2_173:
	setx	0x2d0236, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_93:
	mov	0x8, %r14
	.word 0xf8f38e80  ! 2118: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_2_153:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_153), 16, 16)) -> intp(2, 0, 31)
	.word 0xf6c50020  ! 2120: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r27
cpu_intr_2_174:
	setx	0x2f022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf68cc020  ! 2122: LDUBA_R	lduba	[%r19, %r0] 0x01, %r27
iob_intr_2_154:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_154), 16, 16)) -> intp(2, 0, 11)
iob_intr_2_155:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_155), 16, 16)) -> intp(2, 0, 2f)
T2_asi_reg_rd_93:
	mov	0x33, %r14
	.word 0xf4db89e0  ! 2130: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xfe444000  ! 2136: LDSW_R	ldsw	[%r17 + %r0], %r31
iob_intr_2_156:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_156), 16, 16)) -> intp(2, 0, 19)
cpu_intr_2_175:
	setx	0x2f0018, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_176:
	setx	0x2c0322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe94a000  ! 2146: LDUHA_I	lduha	[%r18, + 0x0000] %asi, %r31
	.word 0xb72ce001  ! 2149: SLL_I	sll 	%r19, 0x0001, %r27
	.word 0xfc5c4000  ! 2150: LDX_R	ldx	[%r17 + %r0], %r30
cpu_intr_2_177:
	setx	0x2c0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0142024  ! 2154: LDUH_I	lduh	[%r16 + 0x0024], %r24
	.word 0xbd358000  ! 2155: SRL_R	srl 	%r22, %r0, %r30
iob_intr_2_157:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_157), 16, 16)) -> intp(2, 0, 14)
	.word 0xbf7d6401  ! 2164: MOVR_I	movre	%r21, 0x1, %r31
	.word 0xfe5d4000  ! 2172: LDX_R	ldx	[%r21 + %r0], %r31
iob_intr_2_158:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_158), 16, 16)) -> intp(2, 0, 22)
	.word 0xb534c000  ! 2178: SRL_R	srl 	%r19, %r0, %r26
cpu_intr_2_178:
	setx	0x2d0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_179:
	setx	0x2e0326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65de17e  ! 2194: LDX_I	ldx	[%r23 + 0x017e], %r27
	ta	T_CHANGE_TO_TL1
iob_intr_2_159:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_159), 16, 16)) -> intp(2, 0, d)
cpu_intr_2_180:
	setx	0x2e0208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44420a5  ! 2201: LDSW_I	ldsw	[%r16 + 0x00a5], %r26
cpu_intr_2_181:
	setx	0x2f033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_94:
	mov	0x3c3, %r14
	.word 0xf8db8400  ! 2209: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbb340000  ! 2210: SRL_R	srl 	%r16, %r0, %r29
T2_asi_reg_wr_94:
	mov	0x3c6, %r14
	.word 0xf8f38e40  ! 2212: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf25d8000  ! 2215: LDX_R	ldx	[%r22 + %r0], %r25
cpu_intr_2_182:
	setx	0x2d021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4d4000  ! 2221: LDSB_R	ldsb	[%r21 + %r0], %r30
cpu_intr_2_183:
	setx	0x2c0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe4561df  ! 2225: ADDC_I	addc 	%r21, 0x01df, %r31
	ta	T_CHANGE_TO_TL1
cpu_intr_2_184:
	setx	0x2f002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_95:
	mov	0x25, %r14
	.word 0xf0f38e80  ! 2232: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983f98  ! 2235: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f98, %hpstate
cpu_intr_2_185:
	setx	0x2d0300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf845a1c1  ! 2239: LDSW_I	ldsw	[%r22 + 0x01c1], %r28
	.word 0xbc8d4000  ! 2240: ANDcc_R	andcc 	%r21, %r0, %r30
	.word 0xbb3c6001  ! 2241: SRA_I	sra 	%r17, 0x0001, %r29
	.word 0xf65c20f1  ! 2244: LDX_I	ldx	[%r16 + 0x00f1], %r27
	.word 0xf6452073  ! 2245: LDSW_I	ldsw	[%r20 + 0x0073], %r27
iob_intr_2_160:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_160), 16, 16)) -> intp(2, 0, 15)
	.word 0xb13c3001  ! 2249: SRAX_I	srax	%r16, 0x0001, %r24
iob_intr_2_161:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_161), 16, 16)) -> intp(2, 0, a)
	.word 0xf80d8000  ! 2251: LDUB_R	ldub	[%r22 + %r0], %r28
	.word 0xf6544000  ! 2254: LDSH_R	ldsh	[%r17 + %r0], %r27
	.word 0xf454a1e4  ! 2255: LDSH_I	ldsh	[%r18 + 0x01e4], %r26
T2_asi_reg_wr_96:
	mov	0x1d, %r14
	.word 0xfaf38400  ! 2258: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T2_asi_reg_rd_95:
	mov	0x15, %r14
	.word 0xf4db89e0  ! 2260: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf295211a  ! 2262: LDUHA_I	lduha	[%r20, + 0x011a] %asi, %r25
iob_intr_2_162:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_162), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_rd_96:
	mov	0x3c7, %r14
	.word 0xfcdb89e0  ! 2264: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_2_186:
	setx	0x2e0231, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_97:
	mov	0x25, %r14
	.word 0xf4f38e40  ! 2271: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf4054000  ! 2274: LDUW_R	lduw	[%r21 + %r0], %r26
iob_intr_2_163:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_163), 16, 16)) -> intp(2, 0, 2b)
	.word 0xfa4ce019  ! 2276: LDSB_I	ldsb	[%r19 + 0x0019], %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6950020  ! 2279: LDUHA_R	lduha	[%r20, %r0] 0x01, %r27
cpu_intr_2_187:
	setx	0x2e013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6cdc020  ! 2281: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r27
iob_intr_2_164:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_164), 16, 16)) -> intp(2, 0, a)
cpu_intr_2_188:
	setx	0x2f0206, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_97:
	mov	0x3c2, %r14
	.word 0xf2db89e0  ! 2285: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xf0d5211b  ! 2286: LDSHA_I	ldsha	[%r20, + 0x011b] %asi, %r24
iob_intr_2_165:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_165), 16, 16)) -> intp(2, 0, 37)
cpu_intr_2_189:
	setx	0x2f011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0bda059  ! 2289: XNORcc_I	xnorcc 	%r22, 0x0059, %r24
	.word 0xf414a05f  ! 2293: LDUH_I	lduh	[%r18 + 0x005f], %r26
	.word 0xfa0d61b4  ! 2294: LDUB_I	ldub	[%r21 + 0x01b4], %r29
	.word 0xf0cc8020  ! 2295: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r24
	.word 0xfa15a1f5  ! 2296: LDUH_I	lduh	[%r22 + 0x01f5], %r29
	.word 0xbc0da074  ! 2297: AND_I	and 	%r22, 0x0074, %r30
cpu_intr_2_190:
	setx	0x33011c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_191:
	setx	0x32011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6c5e197  ! 2303: LDSWA_I	ldswa	[%r23, + 0x0197] %asi, %r27
	ta	T_CHANGE_TO_TL1
	.word 0xb644c000  ! 2306: ADDC_R	addc 	%r19, %r0, %r27
	.word 0xf40c4000  ! 2307: LDUB_R	ldub	[%r17 + %r0], %r26
iob_intr_2_166:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_166), 16, 16)) -> intp(2, 0, 3e)
cpu_intr_2_192:
	setx	0x300336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60c207d  ! 2312: LDUB_I	ldub	[%r16 + 0x007d], %r27
cpu_intr_2_193:
	setx	0x10f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0d5a04b  ! 2317: LDSHA_I	ldsha	[%r22, + 0x004b] %asi, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_wr_98:
	mov	0x1a, %r14
	.word 0xfcf38e40  ! 2320: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_2_167:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_167), 16, 16)) -> intp(2, 0, a)
iob_intr_2_168:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_168), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_194:
	setx	0x310327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12d1000  ! 2328: SLLX_R	sllx	%r20, %r0, %r24
T2_asi_reg_wr_99:
	mov	0x3c0, %r14
	.word 0xf4f38e40  ! 2332: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbf520000  ! 2333: RDPR_PIL	<illegal instruction>
	.word 0xb7520000  ! 2334: RDPR_PIL	<illegal instruction>
	.word 0xfc8c4020  ! 2335: LDUBA_R	lduba	[%r17, %r0] 0x01, %r30
T2_asi_reg_rd_98:
	mov	0x1c, %r14
	.word 0xfedb8400  ! 2338: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf8140000  ! 2339: LDUH_R	lduh	[%r16 + %r0], %r28
	.word 0x89956090  ! 2340: WRPR_TICK_I	wrpr	%r21, 0x0090, %tick
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983a88  ! 2341: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a88, %hpstate
	.word 0xfe04201e  ! 2342: LDUW_I	lduw	[%r16 + 0x001e], %r31
	.word 0xfc94c020  ! 2343: LDUHA_R	lduha	[%r19, %r0] 0x01, %r30
iob_intr_2_169:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_169), 16, 16)) -> intp(2, 0, 4)
	.word 0xfc0dc000  ! 2346: LDUB_R	ldub	[%r23 + %r0], %r30
T2_asi_reg_wr_100:
	mov	0x3c2, %r14
	.word 0xfcf38400  ! 2347: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_2_195:
	setx	0x310003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28d60be  ! 2351: ANDcc_I	andcc 	%r21, 0x00be, %r25
	.word 0xb6b5616b  ! 2354: SUBCcc_I	orncc 	%r21, 0x016b, %r27
	.word 0xb9504000  ! 2356: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xf8dda1ef  ! 2357: LDXA_I	ldxa	[%r22, + 0x01ef] %asi, %r28
	ta	T_CHANGE_TO_TL0
	.word 0xb4b54000  ! 2361: SUBCcc_R	orncc 	%r21, %r0, %r26
	ta	T_CHANGE_NONHPRIV
	.word 0xf40c8000  ! 2364: LDUB_R	ldub	[%r18 + %r0], %r26
	.word 0xf645e10c  ! 2367: LDSW_I	ldsw	[%r23 + 0x010c], %r27
	ta	T_CHANGE_NONHPRIV
iob_intr_2_170:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_170), 16, 16)) -> intp(2, 0, 39)
	.word 0xfec420e1  ! 2374: LDSWA_I	ldswa	[%r16, + 0x00e1] %asi, %r31
cpu_intr_2_196:
	setx	0x33023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb37ca401  ! 2381: MOVR_I	movre	%r18, 0x1, %r25
	.word 0xbd7d0400  ! 2382: MOVR_R	movre	%r20, %r0, %r30
	.word 0xf40461a2  ! 2383: LDUW_I	lduw	[%r17 + 0x01a2], %r26
T2_asi_reg_rd_99:
	mov	0x3c1, %r14
	.word 0xf6db8e60  ! 2384: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_2_197:
	setx	0x320312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba85a083  ! 2389: ADDcc_I	addcc 	%r22, 0x0083, %r29
	.word 0xfecda10c  ! 2391: LDSBA_I	ldsba	[%r22, + 0x010c] %asi, %r31
T2_asi_reg_wr_101:
	mov	0x3c8, %r14
	.word 0xf8f38e60  ! 2396: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb52d2001  ! 2397: SLL_I	sll 	%r20, 0x0001, %r26
cpu_intr_2_198:
	setx	0x32030c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_171:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_171), 16, 16)) -> intp(2, 0, 1)
	.word 0xf604206d  ! 2402: LDUW_I	lduw	[%r16 + 0x006d], %r27
	.word 0xfe45e1bf  ! 2405: LDSW_I	ldsw	[%r23 + 0x01bf], %r31
	.word 0xfad5e170  ! 2406: LDSHA_I	ldsha	[%r23, + 0x0170] %asi, %r29
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_199:
	setx	0x32003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc940020  ! 2412: LDUHA_R	lduha	[%r16, %r0] 0x01, %r30
cpu_intr_2_200:
	setx	0x320336, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_102:
	mov	0x3c6, %r14
	.word 0xfcf38e60  ! 2417: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_2_201:
	setx	0x300320, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_202:
	setx	0x330322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc040000  ! 2422: LDUW_R	lduw	[%r16 + %r0], %r30
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x819829c2  ! 2426: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c2, %hpstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_203:
	setx	0x33022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04d4000  ! 2432: LDSB_R	ldsb	[%r21 + %r0], %r24
T2_asi_reg_wr_103:
	mov	0xf, %r14
	.word 0xf2f384a0  ! 2434: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xfe5c8000  ! 2435: LDX_R	ldx	[%r18 + %r0], %r31
iob_intr_2_172:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_172), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_wr_104:
	mov	0x2f, %r14
	.word 0xfaf38e80  ! 2437: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T2_asi_reg_wr_105:
	mov	0x13, %r14
	.word 0xf0f38e60  ! 2439: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xf84cc000  ! 2440: LDSB_R	ldsb	[%r19 + %r0], %r28
	.word 0xb3641800  ! 2441: MOVcc_R	<illegal instruction>
iob_intr_2_173:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_173), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_wr_106:
	mov	0x11, %r14
	.word 0xf4f38e80  ! 2449: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xfc15e05d  ! 2451: LDUH_I	lduh	[%r23 + 0x005d], %r30
	.word 0xfcd5a02d  ! 2452: LDSHA_I	ldsha	[%r22, + 0x002d] %asi, %r30
cpu_intr_2_204:
	setx	0x330213, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_100:
	mov	0x21, %r14
	.word 0xf6db84a0  ! 2462: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xfc85e04e  ! 2464: LDUWA_I	lduwa	[%r23, + 0x004e] %asi, %r30
	.word 0xfc84c020  ! 2467: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r30
	ta	T_CHANGE_TO_TL1
iob_intr_2_174:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_174), 16, 16)) -> intp(2, 0, 2e)
	.word 0xfa552173  ! 2473: LDSH_I	ldsh	[%r20 + 0x0173], %r29
T2_asi_reg_rd_101:
	mov	0x3c1, %r14
	.word 0xfedb84a0  ! 2474: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_2_205:
	setx	0x300206, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_206:
	setx	0x310238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbec4c000  ! 2478: ADDCcc_R	addccc 	%r19, %r0, %r31
	.word 0xf84d4000  ! 2480: LDSB_R	ldsb	[%r21 + %r0], %r28
	.word 0xfec561d8  ! 2481: LDSWA_I	ldswa	[%r21, + 0x01d8] %asi, %r31
T2_asi_reg_wr_107:
	mov	0x3c6, %r14
	.word 0xf0f389e0  ! 2482: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xfe840020  ! 2483: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r31
	.word 0xb82dc000  ! 2484: ANDN_R	andn 	%r23, %r0, %r28
T2_asi_reg_rd_102:
	mov	0x8, %r14
	.word 0xfcdb89e0  ! 2485: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T2_asi_reg_wr_108:
	mov	0xd, %r14
	.word 0xfef38400  ! 2486: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T2_asi_reg_rd_103:
	mov	0xa, %r14
	.word 0xf0db8400  ! 2487: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb89c4000  ! 2488: XORcc_R	xorcc 	%r17, %r0, %r28
	.word 0xf64cc000  ! 2490: LDSB_R	ldsb	[%r19 + %r0], %r27
T2_asi_reg_rd_104:
	mov	0x1f, %r14
	.word 0xf4db8e80  ! 2491: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_2_207:
	setx	0x300330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9195e06d  ! 2494: WRPR_PIL_I	wrpr	%r23, 0x006d, %pil
cpu_intr_2_208:
	setx	0x32021f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_105:
	mov	0x14, %r14
	.word 0xf8db8e60  ! 2498: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xbb35b001  ! 2499: SRLX_I	srlx	%r22, 0x0001, %r29
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_106:
	mov	0x23, %r14
	.word 0xfcdb8e60  ! 2507: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T2_asi_reg_wr_109:
	mov	0x26, %r14
	.word 0xf8f38e60  ! 2509: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T2_asi_reg_wr_110:
	mov	0x8, %r14
	.word 0xf0f384a0  ! 2510: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T2_asi_reg_rd_107:
	mov	0x3c1, %r14
	.word 0xf0db84a0  ! 2511: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T2_asi_reg_wr_111:
	mov	0x2c, %r14
	.word 0xf8f38e60  ! 2512: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T2_asi_reg_rd_108:
	mov	0x3c2, %r14
	.word 0xfcdb84a0  ! 2513: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb6b5a1a9  ! 2515: SUBCcc_I	orncc 	%r22, 0x01a9, %r27
	.word 0xfe444000  ! 2516: LDSW_R	ldsw	[%r17 + %r0], %r31
T2_asi_reg_wr_112:
	mov	0x3c6, %r14
	.word 0xf6f38e40  ! 2517: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_2_175:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_175), 16, 16)) -> intp(2, 0, 31)
	.word 0xf2442154  ! 2519: LDSW_I	ldsw	[%r16 + 0x0154], %r25
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983e0a  ! 2521: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e0a, %hpstate
iob_intr_2_176:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_176), 16, 16)) -> intp(2, 0, 14)
	.word 0xfc45e0e0  ! 2523: LDSW_I	ldsw	[%r23 + 0x00e0], %r30
cpu_intr_2_209:
	setx	0x31001c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_177:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_177), 16, 16)) -> intp(2, 0, b)
	.word 0xfa054000  ! 2529: LDUW_R	lduw	[%r21 + %r0], %r29
cpu_intr_2_210:
	setx	0x310037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfed5c020  ! 2535: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r31
T2_asi_reg_rd_109:
	mov	0x2a, %r14
	.word 0xf6db84a0  ! 2539: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf65da196  ! 2542: LDX_I	ldx	[%r22 + 0x0196], %r27
cpu_intr_2_211:
	setx	0x32011e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_113:
	mov	0x14, %r14
	.word 0xfaf38e40  ! 2545: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_114:
	mov	0x18, %r14
	.word 0xfaf389e0  ! 2551: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xfe558000  ! 2552: LDSH_R	ldsh	[%r22 + %r0], %r31
T2_asi_reg_rd_110:
	mov	0x3c6, %r14
	.word 0xfcdb8e40  ! 2553: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_wr_115:
	mov	0x15, %r14
	.word 0xfcf38e80  ! 2554: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_2_212:
	setx	0x310337, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_178:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_178), 16, 16)) -> intp(2, 0, 19)
	.word 0xf85de04e  ! 2557: LDX_I	ldx	[%r23 + 0x004e], %r28
iob_intr_2_179:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_179), 16, 16)) -> intp(2, 0, 5)
	.word 0xfecca047  ! 2560: LDSBA_I	ldsba	[%r18, + 0x0047] %asi, %r31
T2_asi_reg_wr_116:
	mov	0x3c3, %r14
	.word 0xfaf38e40  ! 2564: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_213:
	setx	0x310237, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_117:
	mov	0x25, %r14
	.word 0xfaf38400  ! 2569: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_2_214:
	setx	0x310019, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_215:
	setx	0x300321, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_111:
	mov	0x6, %r14
	.word 0xf6db8e80  ! 2573: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xfecda0ae  ! 2574: LDSBA_I	ldsba	[%r22, + 0x00ae] %asi, %r31
cpu_intr_2_216:
	setx	0x330223, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_118:
	mov	0x3c8, %r14
	.word 0xfef38e80  ! 2579: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T2_asi_reg_wr_119:
	mov	0x3c5, %r14
	.word 0xfaf38e60  ! 2586: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb2bc2121  ! 2590: XNORcc_I	xnorcc 	%r16, 0x0121, %r25
	.word 0xfa14a1b7  ! 2593: LDUH_I	lduh	[%r18 + 0x01b7], %r29
cpu_intr_2_217:
	setx	0x330327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfac461cc  ! 2598: LDSWA_I	ldswa	[%r17, + 0x01cc] %asi, %r29
	.word 0xf0d40020  ! 2600: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r24
	.word 0xfa14c000  ! 2606: LDUH_R	lduh	[%r19 + %r0], %r29
	.word 0xbab421ff  ! 2607: SUBCcc_I	orncc 	%r16, 0x01ff, %r29
	.word 0xfedd20e4  ! 2608: LDXA_I	ldxa	[%r20, + 0x00e4] %asi, %r31
cpu_intr_2_218:
	setx	0x32013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa554000  ! 2612: LDSH_R	ldsh	[%r21 + %r0], %r29
	.word 0xbf345000  ! 2614: SRLX_R	srlx	%r17, %r0, %r31
iob_intr_2_180:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_180), 16, 16)) -> intp(2, 0, 0)
	.word 0xf60d6169  ! 2620: LDUB_I	ldub	[%r21 + 0x0169], %r27
T2_asi_reg_wr_120:
	mov	0x3c7, %r14
	.word 0xf2f384a0  ! 2622: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbb7d2401  ! 2624: MOVR_I	movre	%r20, 0x1, %r29
T2_asi_reg_rd_112:
	mov	0x3c2, %r14
	.word 0xf8db8e40  ! 2626: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf8dd20a9  ! 2627: LDXA_I	ldxa	[%r20, + 0x00a9] %asi, %r28
T2_asi_reg_wr_121:
	mov	0x17, %r14
	.word 0xf6f389e0  ! 2631: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf2c521e2  ! 2632: LDSWA_I	ldswa	[%r20, + 0x01e2] %asi, %r25
	.word 0xfa0c8000  ! 2636: LDUB_R	ldub	[%r18 + %r0], %r29
	.word 0xf8144000  ! 2640: LDUH_R	lduh	[%r17 + %r0], %r28
	.word 0xfe550000  ! 2643: LDSH_R	ldsh	[%r20 + %r0], %r31
T2_asi_reg_rd_113:
	mov	0x3c5, %r14
	.word 0xf8db8e80  ! 2645: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6ccc020  ! 2652: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r27
cpu_intr_2_219:
	setx	0x320327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc0c6044  ! 2655: AND_I	and 	%r17, 0x0044, %r30
	.word 0xb13c1000  ! 2656: SRAX_R	srax	%r16, %r0, %r24
iob_intr_2_181:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_181), 16, 16)) -> intp(2, 0, 28)
	.word 0xb084a164  ! 2659: ADDcc_I	addcc 	%r18, 0x0164, %r24
	ta	T_CHANGE_TO_TL0
cpu_intr_2_220:
	setx	0x330311, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc040000  ! 2666: LDUW_R	lduw	[%r16 + %r0], %r30
	.word 0xf044a092  ! 2668: LDSW_I	ldsw	[%r18 + 0x0092], %r24
iob_intr_2_182:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_182), 16, 16)) -> intp(2, 0, 2)
iob_intr_2_183:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_183), 16, 16)) -> intp(2, 0, 24)
	.word 0xbcb54000  ! 2673: SUBCcc_R	orncc 	%r21, %r0, %r30
iob_intr_2_184:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_184), 16, 16)) -> intp(2, 0, 15)
T2_asi_reg_wr_122:
	mov	0x3c2, %r14
	.word 0xf8f38400  ! 2680: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T2_asi_reg_wr_123:
	mov	0x31, %r14
	.word 0xf4f38e80  ! 2681: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbd2c0000  ! 2686: SLL_R	sll 	%r16, %r0, %r30
	.word 0xfe4c4000  ! 2688: LDSB_R	ldsb	[%r17 + %r0], %r31
T2_asi_reg_wr_124:
	mov	0x21, %r14
	.word 0xf0f384a0  ! 2690: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf895e107  ! 2691: LDUHA_I	lduha	[%r23, + 0x0107] %asi, %r28
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_114:
	mov	0x6, %r14
	.word 0xfadb89e0  ! 2697: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xfe84c020  ! 2698: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r31
	.word 0xb48dc000  ! 2699: ANDcc_R	andcc 	%r23, %r0, %r26
T2_asi_reg_wr_125:
	mov	0xd, %r14
	.word 0xfef384a0  ! 2701: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf4cdc020  ! 2702: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r26
	.word 0xf6050000  ! 2703: LDUW_R	lduw	[%r20 + %r0], %r27
iob_intr_2_185:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_185), 16, 16)) -> intp(2, 0, 15)
	.word 0xf04d6123  ! 2707: LDSB_I	ldsb	[%r21 + 0x0123], %r24
	.word 0xf0544000  ! 2708: LDSH_R	ldsh	[%r17 + %r0], %r24
	.word 0xbea4605c  ! 2709: SUBcc_I	subcc 	%r17, 0x005c, %r31
iob_intr_2_186:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_186), 16, 16)) -> intp(2, 0, 12)
iob_intr_2_187:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_187), 16, 16)) -> intp(2, 0, 9)
iob_intr_2_188:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_188), 16, 16)) -> intp(2, 0, 4)
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982e8a  ! 2719: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8a, %hpstate
	.word 0xb6c5e023  ! 2720: ADDCcc_I	addccc 	%r23, 0x0023, %r27
	.word 0xf855e040  ! 2723: LDSH_I	ldsh	[%r23 + 0x0040], %r28
iob_intr_2_189:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_189), 16, 16)) -> intp(2, 0, d)
T2_asi_reg_rd_115:
	mov	0x29, %r14
	.word 0xf0db84a0  ! 2727: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xfccd61de  ! 2728: LDSBA_I	ldsba	[%r21, + 0x01de] %asi, %r30
	.word 0xfe84c020  ! 2730: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r31
	.word 0xbf2c7001  ! 2732: SLLX_I	sllx	%r17, 0x0001, %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xf85460dd  ! 2735: LDSH_I	ldsh	[%r17 + 0x00dd], %r28
cpu_intr_2_221:
	setx	0x340005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05d0000  ! 2739: LDX_R	ldx	[%r20 + %r0], %r24
	.word 0xf64c8000  ! 2745: LDSB_R	ldsb	[%r18 + %r0], %r27
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983dc8  ! 2747: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dc8, %hpstate
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_116:
	mov	0x2d, %r14
	.word 0xf4db8e40  ! 2751: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb4b4c000  ! 2752: SUBCcc_R	orncc 	%r19, %r0, %r26
	.word 0xf8dce178  ! 2755: LDXA_I	ldxa	[%r19, + 0x0178] %asi, %r28
T2_asi_reg_rd_117:
	mov	0x38, %r14
	.word 0xf6db8e60  ! 2756: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_2_222:
	setx	0x340106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0c4000  ! 2758: LDUB_R	ldub	[%r17 + %r0], %r29
iob_intr_2_190:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_190), 16, 16)) -> intp(2, 0, 19)
	.word 0xf0d5c020  ! 2760: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r24
iob_intr_2_191:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_191), 16, 16)) -> intp(2, 0, 26)
	.word 0xb81c0000  ! 2769: XOR_R	xor 	%r16, %r0, %r28
iob_intr_2_192:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_192), 16, 16)) -> intp(2, 0, 37)
T2_asi_reg_rd_118:
	mov	0x3c0, %r14
	.word 0xf6db8e80  ! 2773: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_2_223:
	setx	0x37003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcc5e159  ! 2775: ADDCcc_I	addccc 	%r23, 0x0159, %r30
	.word 0xf80d4000  ! 2776: LDUB_R	ldub	[%r21 + %r0], %r28
iob_intr_2_193:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_193), 16, 16)) -> intp(2, 0, 19)
T2_asi_reg_rd_119:
	mov	0x34, %r14
	.word 0xfadb8e40  ! 2783: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_194:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_194), 16, 16)) -> intp(2, 0, 15)
T2_asi_reg_wr_126:
	mov	0xb, %r14
	.word 0xf0f38e40  ! 2794: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf85c0000  ! 2800: LDX_R	ldx	[%r16 + %r0], %r28
	.word 0xf415e16f  ! 2801: LDUH_I	lduh	[%r23 + 0x016f], %r26
	ta	T_CHANGE_TO_TL0
	.word 0xf8cde128  ! 2803: LDSBA_I	ldsba	[%r23, + 0x0128] %asi, %r28
iob_intr_2_195:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_195), 16, 16)) -> intp(2, 0, 1c)
iob_intr_2_196:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_196), 16, 16)) -> intp(2, 0, 6)
cpu_intr_2_224:
	setx	0x370323, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_120:
	mov	0x28, %r14
	.word 0xf2db8e60  ! 2816: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf4446036  ! 2817: LDSW_I	ldsw	[%r17 + 0x0036], %r26
	.word 0xfccc4020  ! 2818: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r30
iob_intr_2_197:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_197), 16, 16)) -> intp(2, 0, 3e)
cpu_intr_2_225:
	setx	0x370002, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_127:
	mov	0x3c8, %r14
	.word 0xfaf38e80  ! 2826: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T2_asi_reg_rd_121:
	mov	0x27, %r14
	.word 0xf8db8e80  ! 2827: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_2_226:
	setx	0x370211, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_198:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_198), 16, 16)) -> intp(2, 0, 15)
iob_intr_2_199:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_199), 16, 16)) -> intp(2, 0, 26)
cpu_intr_2_227:
	setx	0x360110, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_200:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_200), 16, 16)) -> intp(2, 0, 0)
iob_intr_2_201:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_201), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_rd_122:
	mov	0x2d, %r14
	.word 0xf2db8e60  ! 2838: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_2_228:
	setx	0x340027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_229:
	setx	0x36021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf015c000  ! 2841: LDUH_R	lduh	[%r23 + %r0], %r24
	.word 0xf8d5e166  ! 2844: LDSHA_I	ldsha	[%r23, + 0x0166] %asi, %r28
	ta	T_CHANGE_TO_TL1
	.word 0xb4b50000  ! 2847: SUBCcc_R	orncc 	%r20, %r0, %r26
	.word 0xbf7d0400  ! 2849: MOVR_R	movre	%r20, %r0, %r31
T2_asi_reg_wr_128:
	mov	0xd, %r14
	.word 0xf4f38e40  ! 2850: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_202:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_202), 16, 16)) -> intp(2, 0, 37)
iob_intr_2_203:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_203), 16, 16)) -> intp(2, 0, 23)
	.word 0xb12d8000  ! 2855: SLL_R	sll 	%r22, %r0, %r24
	.word 0x879420e2  ! 2856: WRPR_TT_I	wrpr	%r16, 0x00e2, %tt
cpu_intr_2_230:
	setx	0x36013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf08d0020  ! 2864: LDUBA_R	lduba	[%r20, %r0] 0x01, %r24
	.word 0xf2ccc020  ! 2867: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r25
	.word 0xfa042002  ! 2868: LDUW_I	lduw	[%r16 + 0x0002], %r29
	.word 0xfa5ca1ce  ! 2869: LDX_I	ldx	[%r18 + 0x01ce], %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfe5421ef  ! 2876: LDSH_I	ldsh	[%r16 + 0x01ef], %r31
iob_intr_2_204:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_204), 16, 16)) -> intp(2, 0, 5)
T2_asi_reg_wr_129:
	mov	0x2d, %r14
	.word 0xfef38e60  ! 2878: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf6958020  ! 2879: LDUHA_R	lduha	[%r22, %r0] 0x01, %r27
	.word 0xfe04a0ba  ! 2881: LDUW_I	lduw	[%r18 + 0x00ba], %r31
cpu_intr_2_231:
	setx	0x340336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6cd4020  ! 2887: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xf65c4000  ! 2893: LDX_R	ldx	[%r17 + %r0], %r27
	.word 0xb48d4000  ! 2895: ANDcc_R	andcc 	%r21, %r0, %r26
	.word 0xf454e14d  ! 2896: LDSH_I	ldsh	[%r19 + 0x014d], %r26
	.word 0xf6d54020  ! 2897: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r27
T2_asi_reg_wr_130:
	mov	0x3c4, %r14
	.word 0xfcf384a0  ! 2899: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_2_205:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_205), 16, 16)) -> intp(2, 0, 0)
T2_asi_reg_rd_123:
	mov	0x3c4, %r14
	.word 0xf8db8e40  ! 2901: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_131:
	mov	0x3c1, %r14
	.word 0xf8f38e40  ! 2905: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982c82  ! 2907: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c82, %hpstate
	.word 0xf8cde14c  ! 2909: LDSBA_I	ldsba	[%r23, + 0x014c] %asi, %r28
T2_asi_reg_rd_124:
	mov	0x9, %r14
	.word 0xf8db89e0  ! 2910: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xbb7c8400  ! 2911: MOVR_R	movre	%r18, %r0, %r29
	.word 0xfc148000  ! 2913: LDUH_R	lduh	[%r18 + %r0], %r30
T2_asi_reg_wr_132:
	mov	0x3c6, %r14
	.word 0xf4f389e0  ! 2914: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_133:
	mov	0x3c5, %r14
	.word 0xf0f38e40  ! 2922: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_wr_134:
	mov	0x36, %r14
	.word 0xf8f38e60  ! 2923: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_2_232:
	setx	0x34000a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_135:
	mov	0x3c8, %r14
	.word 0xfaf38e80  ! 2926: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xfe0c0000  ! 2927: LDUB_R	ldub	[%r16 + %r0], %r31
cpu_intr_2_233:
	setx	0x34033d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_234:
	setx	0x20201, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_235:
	setx	0x34031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf644a033  ! 2936: LDSW_I	ldsw	[%r18 + 0x0033], %r27
iob_intr_2_206:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_206), 16, 16)) -> intp(2, 0, 1)
T2_asi_reg_wr_136:
	mov	0x26, %r14
	.word 0xf8f38e80  ! 2941: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xfe44215f  ! 2943: LDSW_I	ldsw	[%r16 + 0x015f], %r31
T2_asi_reg_wr_137:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 2945: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T2_asi_reg_rd_125:
	mov	0x3c5, %r14
	.word 0xf0db8e40  ! 2948: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_138:
	mov	0x3c3, %r14
	.word 0xfcf384a0  ! 2950: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf6448000  ! 2952: LDSW_R	ldsw	[%r18 + %r0], %r27
iob_intr_2_207:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_207), 16, 16)) -> intp(2, 0, 26)
	.word 0xf09521ef  ! 2962: LDUHA_I	lduha	[%r20, + 0x01ef] %asi, %r24
iob_intr_2_208:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_208), 16, 16)) -> intp(2, 0, 19)
	.word 0xf49521fe  ! 2964: LDUHA_I	lduha	[%r20, + 0x01fe] %asi, %r26
	.word 0xfa948020  ! 2965: LDUHA_R	lduha	[%r18, %r0] 0x01, %r29
	.word 0xf6450000  ! 2968: LDSW_R	ldsw	[%r20 + %r0], %r27
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983982  ! 2971: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1982, %hpstate
	.word 0xb335d000  ! 2973: SRLX_R	srlx	%r23, %r0, %r25
T2_asi_reg_wr_139:
	mov	0x1a, %r14
	.word 0xf6f38400  ! 2974: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_2_236:
	setx	0x370231, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_209:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_209), 16, 16)) -> intp(2, 0, 2d)
iob_intr_2_210:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_210), 16, 16)) -> intp(2, 0, 2d)
cpu_intr_2_237:
	setx	0x360230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf84d0000  ! 2982: LDSB_R	ldsb	[%r20 + %r0], %r28
cpu_intr_2_238:
	setx	0x36000d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_211:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_211), 16, 16)) -> intp(2, 0, b)
	.word 0xf0540000  ! 2990: LDSH_R	ldsh	[%r16 + %r0], %r24
T2_asi_reg_rd_126:
	mov	0x2d, %r14
	.word 0xfedb8400  ! 2991: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf85d20e9  ! 2996: LDX_I	ldx	[%r20 + 0x00e9], %r28
cpu_intr_2_239:
	setx	0x36021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf894a156  ! 3000: LDUHA_I	lduha	[%r18, + 0x0156] %asi, %r28
	.word 0xfc554000  ! 3002: LDSH_R	ldsh	[%r21 + %r0], %r30
	.word 0xf00d0000  ! 3004: LDUB_R	ldub	[%r20 + %r0], %r24
iob_intr_2_212:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_212), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_240:
	setx	0x370217, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_140:
	mov	0xf, %r14
	.word 0xf6f384a0  ! 3010: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xbb7d8400  ! 3012: MOVR_R	movre	%r22, %r0, %r29
T2_asi_reg_rd_127:
	mov	0x3c5, %r14
	.word 0xf8db8e80  ! 3013: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_2_241:
	setx	0x36013e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_242:
	setx	0x34012e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_213:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_213), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_rd_128:
	mov	0x3c3, %r14
	.word 0xfadb8e40  ! 3028: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_2_243:
	setx	0x350118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe052196  ! 3034: LDUW_I	lduw	[%r20 + 0x0196], %r31
	.word 0xfc858020  ! 3038: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r30
iob_intr_2_214:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_214), 16, 16)) -> intp(2, 0, 1c)
iob_intr_2_215:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_215), 16, 16)) -> intp(2, 0, 32)
	.word 0xf6d44020  ! 3043: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r27
	.word 0xf8948020  ! 3044: LDUHA_R	lduha	[%r18, %r0] 0x01, %r28
iob_intr_2_216:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_216), 16, 16)) -> intp(2, 0, 18)
	.word 0xfccc2016  ! 3047: LDSBA_I	ldsba	[%r16, + 0x0016] %asi, %r30
cpu_intr_2_244:
	setx	0x37002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf854e0dc  ! 3049: LDSH_I	ldsh	[%r19 + 0x00dc], %r28
	ta	T_CHANGE_TO_TL1
cpu_intr_2_245:
	setx	0x370027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8dde0a0  ! 3054: LDXA_I	ldxa	[%r23, + 0x00a0] %asi, %r28
	.word 0xfa0c0000  ! 3055: LDUB_R	ldub	[%r16 + %r0], %r29
cpu_intr_2_246:
	setx	0x34031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24c8000  ! 3057: LDSB_R	ldsb	[%r18 + %r0], %r25
	.word 0xb625e0ef  ! 3061: SUB_I	sub 	%r23, 0x00ef, %r27
	.word 0xf44c8000  ! 3066: LDSB_R	ldsb	[%r18 + %r0], %r26
	.word 0xf8c54020  ! 3067: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r28
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982d40  ! 3068: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d40, %hpstate
T2_asi_reg_wr_141:
	mov	0x3c8, %r14
	.word 0xf4f38e80  ! 3069: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_2_247:
	setx	0x37022b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_217:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_217), 16, 16)) -> intp(2, 0, 36)
iob_intr_2_218:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_218), 16, 16)) -> intp(2, 0, 32)
iob_intr_2_219:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_219), 16, 16)) -> intp(2, 0, c)
cpu_intr_2_248:
	setx	0x35001a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_249:
	setx	0x350305, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_250:
	setx	0x360336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3c6001  ! 3093: SRA_I	sra 	%r17, 0x0001, %r29
T2_asi_reg_wr_142:
	mov	0x3c7, %r14
	.word 0xf2f38e60  ! 3095: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_2_251:
	setx	0x34001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfccca174  ! 3099: LDSBA_I	ldsba	[%r18, + 0x0174] %asi, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc15c000  ! 3105: LDUH_R	lduh	[%r23 + %r0], %r30
iob_intr_2_220:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_220), 16, 16)) -> intp(2, 0, 38)
cpu_intr_2_252:
	setx	0x35011b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_253:
	setx	0x350034, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_143:
	mov	0xa, %r14
	.word 0xfef38e40  ! 3119: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_rd_129:
	mov	0x12, %r14
	.word 0xf4db8e40  ! 3122: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfad5c020  ! 3123: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r29
	.word 0xf64d61ae  ! 3125: LDSB_I	ldsb	[%r21 + 0x01ae], %r27
cpu_intr_2_254:
	setx	0x350122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa95c020  ! 3128: LDUHA_R	lduha	[%r23, %r0] 0x01, %r29
	.word 0xf695a048  ! 3130: LDUHA_I	lduha	[%r22, + 0x0048] %asi, %r27
iob_intr_2_221:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_221), 16, 16)) -> intp(2, 0, 8)
	.word 0xf4956029  ! 3133: LDUHA_I	lduha	[%r21, + 0x0029] %asi, %r26
	.word 0xfad42069  ! 3140: LDSHA_I	ldsha	[%r16, + 0x0069] %asi, %r29
iob_intr_2_222:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_222), 16, 16)) -> intp(2, 0, 8)
T2_asi_reg_rd_130:
	mov	0x24, %r14
	.word 0xf4db84a0  ! 3143: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf8044000  ! 3144: LDUW_R	lduw	[%r17 + %r0], %r28
cpu_intr_2_255:
	setx	0x370316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf09420d9  ! 3147: LDUHA_I	lduha	[%r16, + 0x00d9] %asi, %r24
T2_asi_reg_wr_144:
	mov	0x3c1, %r14
	.word 0xfaf38e80  ! 3148: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbe35c000  ! 3150: ORN_R	orn 	%r23, %r0, %r31
cpu_intr_2_256:
	setx	0x34012d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_223:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_223), 16, 16)) -> intp(2, 0, 19)
iob_intr_2_224:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_224), 16, 16)) -> intp(2, 0, 30)
	.word 0xf48ca1c2  ! 3160: LDUBA_I	lduba	[%r18, + 0x01c2] %asi, %r26
cpu_intr_2_257:
	setx	0x340016, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_225:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_225), 16, 16)) -> intp(2, 0, 38)
T2_asi_reg_rd_131:
	mov	0x13, %r14
	.word 0xf2db8400  ! 3166: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_2_226:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_226), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf68ce016  ! 3170: LDUBA_I	lduba	[%r19, + 0x0016] %asi, %r27
	.word 0xf88d215d  ! 3172: LDUBA_I	lduba	[%r20, + 0x015d] %asi, %r28
iob_intr_2_227:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_227), 16, 16)) -> intp(2, 0, 7)
	.word 0xbb348000  ! 3176: SRL_R	srl 	%r18, %r0, %r29
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_132:
	mov	0x3c6, %r14
	.word 0xfedb8e40  ! 3182: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6d42115  ! 3185: LDSHA_I	ldsha	[%r16, + 0x0115] %asi, %r27
T2_asi_reg_wr_145:
	mov	0xe, %r14
	.word 0xfef384a0  ! 3186: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf48da1d1  ! 3187: LDUBA_I	lduba	[%r22, + 0x01d1] %asi, %r26
iob_intr_2_228:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_228), 16, 16)) -> intp(2, 0, 17)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xa1902002  ! 3190: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xfc14e071  ! 3194: LDUH_I	lduh	[%r19 + 0x0071], %r30
	.word 0xf404e188  ! 3195: LDUW_I	lduw	[%r19 + 0x0188], %r26
	.word 0xfe45618c  ! 3197: LDSW_I	ldsw	[%r21 + 0x018c], %r31
T2_asi_reg_wr_146:
	mov	0xf, %r14
	.word 0xf8f38e40  ! 3200: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfe45a011  ! 3201: LDSW_I	ldsw	[%r22 + 0x0011], %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_wr_147:
	mov	0x35, %r14
	.word 0xf4f389e0  ! 3203: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb351c000  ! 3204: RDPR_TL	<illegal instruction>
cpu_intr_2_258:
	setx	0x3b030e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_133:
	mov	0x1b, %r14
	.word 0xf6db8e80  ! 3209: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_2_259:
	setx	0x3a010b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_229:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_229), 16, 16)) -> intp(2, 0, 7)
	.word 0xb23ca119  ! 3217: XNOR_I	xnor 	%r18, 0x0119, %r25
T2_asi_reg_rd_134:
	mov	0x34, %r14
	.word 0xfedb89e0  ! 3222: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xfa15215f  ! 3223: LDUH_I	lduh	[%r20 + 0x015f], %r29
	.word 0xb57c4400  ! 3226: MOVR_R	movre	%r17, %r0, %r26
	.word 0xf45c0000  ! 3227: LDX_R	ldx	[%r16 + %r0], %r26
iob_intr_2_230:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_230), 16, 16)) -> intp(2, 0, 16)
cpu_intr_2_260:
	setx	0x390335, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_261:
	setx	0x3a0319, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_135:
	mov	0x3c4, %r14
	.word 0xf4db89e0  ! 3238: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T2_asi_reg_wr_148:
	mov	0x1c, %r14
	.word 0xf0f389e0  ! 3239: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_2_262:
	setx	0x3a0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa554000  ! 3246: LDSH_R	ldsh	[%r21 + %r0], %r29
	.word 0xf015e18b  ! 3247: LDUH_I	lduh	[%r23 + 0x018b], %r24
iob_intr_2_231:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_231), 16, 16)) -> intp(2, 0, 31)
iob_intr_2_232:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_232), 16, 16)) -> intp(2, 0, 24)
	.word 0xf0d50020  ! 3257: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r24
	.word 0xf4544000  ! 3258: LDSH_R	ldsh	[%r17 + %r0], %r26
	.word 0xbc34215c  ! 3259: ORN_I	orn 	%r16, 0x015c, %r30
iob_intr_2_233:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_233), 16, 16)) -> intp(2, 0, 3f)
cpu_intr_2_263:
	setx	0x38030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb63c4000  ! 3263: XNOR_R	xnor 	%r17, %r0, %r27
	.word 0xbb7c0400  ! 3264: MOVR_R	movre	%r16, %r0, %r29
cpu_intr_2_264:
	setx	0x3b0318, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_149:
	mov	0x13, %r14
	.word 0xfcf38e40  ! 3267: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_265:
	setx	0x3b0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfecdc020  ! 3272: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r31
T2_asi_reg_rd_136:
	mov	0x3c8, %r14
	.word 0xfcdb8e40  ! 3282: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_rd_137:
	mov	0x3c1, %r14
	.word 0xfcdb8e80  ! 3285: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	ta	T_CHANGE_TO_TL0
	.word 0xbcb461d5  ! 3290: SUBCcc_I	orncc 	%r17, 0x01d5, %r30
T2_asi_reg_wr_150:
	mov	0x3c8, %r14
	.word 0xfef38e80  ! 3291: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xfe840020  ! 3292: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r31
cpu_intr_2_266:
	setx	0x3b0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfccc217c  ! 3299: LDSBA_I	ldsba	[%r16, + 0x017c] %asi, %r30
	.word 0xb03c4000  ! 3301: XNOR_R	xnor 	%r17, %r0, %r24
T2_asi_reg_rd_138:
	mov	0x3c5, %r14
	.word 0xf6db8400  ! 3302: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_2_234:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_234), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf454e159  ! 3305: LDSH_I	ldsh	[%r19 + 0x0159], %r26
T2_asi_reg_wr_151:
	mov	0x5, %r14
	.word 0xf6f38e40  ! 3307: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf4d5a19b  ! 3309: LDSHA_I	ldsha	[%r22, + 0x019b] %asi, %r26
T2_asi_reg_rd_139:
	mov	0x3c5, %r14
	.word 0xf0db8e40  ! 3312: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfed40020  ! 3313: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r31
	.word 0xf40cc000  ! 3315: LDUB_R	ldub	[%r19 + %r0], %r26
iob_intr_2_235:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_235), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf085e149  ! 3319: LDUWA_I	lduwa	[%r23, + 0x0149] %asi, %r24
	.word 0xb12d8000  ! 3323: SLL_R	sll 	%r22, %r0, %r24
cpu_intr_2_267:
	setx	0x3b021a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_268:
	setx	0x3a010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982940  ! 3330: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0940, %hpstate
T2_asi_reg_wr_152:
	mov	0x30, %r14
	.word 0xfcf38400  ! 3331: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xfcdd614d  ! 3333: LDXA_I	ldxa	[%r21, + 0x014d] %asi, %r30
	.word 0xf6440000  ! 3335: LDSW_R	ldsw	[%r16 + %r0], %r27
	ta	T_CHANGE_TO_TL0
	.word 0xfc4d20c6  ! 3337: LDSB_I	ldsb	[%r20 + 0x00c6], %r30
	.word 0xf694c020  ! 3339: LDUHA_R	lduha	[%r19, %r0] 0x01, %r27
	.word 0xfe95c020  ! 3340: LDUHA_R	lduha	[%r23, %r0] 0x01, %r31
	.word 0xb2344000  ! 3343: SUBC_R	orn 	%r17, %r0, %r25
	.word 0xfa954020  ! 3345: LDUHA_R	lduha	[%r21, %r0] 0x01, %r29
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x8198390a  ! 3346: WRHPR_HPSTATE_I	wrhpr	%r0, 0x190a, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0xfecde04d  ! 3348: LDSBA_I	ldsba	[%r23, + 0x004d] %asi, %r31
	ta	T_CHANGE_HPRIV
iob_intr_2_236:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_236), 16, 16)) -> intp(2, 0, 6)
	.word 0xb61c20e0  ! 3356: XOR_I	xor 	%r16, 0x00e0, %r27
	.word 0xf2c521f5  ! 3358: LDSWA_I	ldswa	[%r20, + 0x01f5] %asi, %r25
cpu_intr_2_269:
	setx	0x30333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5cc000  ! 3362: LDX_R	ldx	[%r19 + %r0], %r29
iob_intr_2_237:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_237), 16, 16)) -> intp(2, 0, 2)
	.word 0xf2cd0020  ! 3365: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r25
iob_intr_2_238:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_238), 16, 16)) -> intp(2, 0, 3b)
	.word 0xfe4560ca  ! 3371: LDSW_I	ldsw	[%r21 + 0x00ca], %r31
T2_asi_reg_wr_153:
	mov	0x21, %r14
	.word 0xf0f38e80  ! 3373: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf6dd2039  ! 3374: LDXA_I	ldxa	[%r20, + 0x0039] %asi, %r27
cpu_intr_2_270:
	setx	0x390024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf054c000  ! 3377: LDSH_R	ldsh	[%r19 + %r0], %r24
	.word 0xfe8d0020  ! 3379: LDUBA_R	lduba	[%r20, %r0] 0x01, %r31
T2_asi_reg_rd_140:
	mov	0x3c4, %r14
	.word 0xf2db8400  ! 3381: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf44c60c5  ! 3383: LDSB_I	ldsb	[%r17 + 0x00c5], %r26
T2_asi_reg_wr_154:
	mov	0x24, %r14
	.word 0xf8f38e40  ! 3384: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_wr_155:
	mov	0x3c3, %r14
	.word 0xf8f38e80  ! 3385: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf844e1ec  ! 3387: LDSW_I	ldsw	[%r19 + 0x01ec], %r28
	.word 0xf4cde1d5  ! 3389: LDSBA_I	ldsba	[%r23, + 0x01d5] %asi, %r26
	.word 0xfe154000  ! 3394: LDUH_R	lduh	[%r21 + %r0], %r31
cpu_intr_2_271:
	setx	0x39020f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_272:
	setx	0x380016, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_156:
	mov	0x22, %r14
	.word 0xf0f38e40  ! 3399: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_2_239:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_239), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_273:
	setx	0x3b010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf054605c  ! 3405: LDSH_I	ldsh	[%r17 + 0x005c], %r24
	.word 0xbb51c000  ! 3407: RDPR_TL	<illegal instruction>
	.word 0xb0b58000  ! 3410: ORNcc_R	orncc 	%r22, %r0, %r24
T2_asi_reg_wr_157:
	mov	0x0, %r14
	.word 0xfcf384a0  ! 3411: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf654a145  ! 3417: LDSH_I	ldsh	[%r18 + 0x0145], %r27
iob_intr_2_240:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_240), 16, 16)) -> intp(2, 0, 1a)
	ta	T_CHANGE_TO_TL0
	.word 0xf8946011  ! 3422: LDUHA_I	lduha	[%r17, + 0x0011] %asi, %r28
cpu_intr_2_274:
	setx	0x390231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4550000  ! 3426: LDSH_R	ldsh	[%r20 + %r0], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf68da119  ! 3428: LDUBA_I	lduba	[%r22, + 0x0119] %asi, %r27
	.word 0xf214a194  ! 3430: LDUH_I	lduh	[%r18 + 0x0194], %r25
T2_asi_reg_wr_158:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 3435: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_2_275:
	setx	0x390100, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_141:
	mov	0x3c4, %r14
	.word 0xfadb8e80  ! 3440: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xfc85e1bd  ! 3441: LDUWA_I	lduwa	[%r23, + 0x01bd] %asi, %r30
	.word 0xf6948020  ! 3442: LDUHA_R	lduha	[%r18, %r0] 0x01, %r27
	.word 0xf2d5e1cb  ! 3443: LDSHA_I	ldsha	[%r23, + 0x01cb] %asi, %r25
	.word 0xf0c54020  ! 3445: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r24
	ta	T_CHANGE_TO_TL0
	.word 0xb135e001  ! 3448: SRL_I	srl 	%r23, 0x0001, %r24
T2_asi_reg_wr_159:
	mov	0x21, %r14
	.word 0xfaf384a0  ! 3449: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xfe14a1b7  ! 3450: LDUH_I	lduh	[%r18 + 0x01b7], %r31
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983fc2  ! 3451: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc2, %hpstate
	.word 0xfe0dc000  ! 3453: LDUB_R	ldub	[%r23 + %r0], %r31
T2_asi_reg_rd_142:
	mov	0x1c, %r14
	.word 0xf0db8e40  ! 3455: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf8d58020  ! 3456: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r28
	.word 0xf454e01a  ! 3457: LDSH_I	ldsh	[%r19 + 0x001a], %r26
	.word 0xf20d61ad  ! 3458: LDUB_I	ldub	[%r21 + 0x01ad], %r25
	.word 0xfe954020  ! 3460: LDUHA_R	lduha	[%r21, %r0] 0x01, %r31
T2_asi_reg_rd_143:
	mov	0x27, %r14
	.word 0xf0db8400  ! 3468: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf6d4615e  ! 3469: LDSHA_I	ldsha	[%r17, + 0x015e] %asi, %r27
iob_intr_2_241:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_241), 16, 16)) -> intp(2, 0, 21)
	.word 0xb23c4000  ! 3471: XNOR_R	xnor 	%r17, %r0, %r25
	.word 0xf0440000  ! 3473: LDSW_R	ldsw	[%r16 + %r0], %r24
iob_intr_2_242:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_242), 16, 16)) -> intp(2, 0, 2a)
T2_asi_reg_rd_144:
	mov	0x11, %r14
	.word 0xf4db8e80  ! 3478: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_2_243:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_243), 16, 16)) -> intp(2, 0, 39)
iob_intr_2_244:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_244), 16, 16)) -> intp(2, 0, 19)
	.word 0xf45da07c  ! 3482: LDX_I	ldx	[%r22 + 0x007c], %r26
	.word 0xfad5e043  ! 3485: LDSHA_I	ldsha	[%r23, + 0x0043] %asi, %r29
iob_intr_2_245:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_245), 16, 16)) -> intp(2, 0, 2c)
	ta	T_CHANGE_TO_TL1
	.word 0xb12d5000  ! 3492: SLLX_R	sllx	%r21, %r0, %r24
	.word 0xf815a079  ! 3496: LDUH_I	lduh	[%r22 + 0x0079], %r28
T2_asi_reg_wr_160:
	mov	0x28, %r14
	.word 0xfcf38e60  ! 3497: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T2_asi_reg_rd_145:
	mov	0x2d, %r14
	.word 0xf2db8e40  ! 3501: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_wr_161:
	mov	0x3c1, %r14
	.word 0xfaf384a0  ! 3502: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T2_asi_reg_wr_162:
	mov	0x13, %r14
	.word 0xf6f389e0  ! 3503: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T2_asi_reg_rd_146:
	mov	0x3c0, %r14
	.word 0xfcdb8e60  ! 3504: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T2_asi_reg_wr_163:
	mov	0x37, %r14
	.word 0xf6f38e80  ! 3505: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T2_asi_reg_rd_147:
	mov	0xb, %r14
	.word 0xf4db8e80  ! 3506: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xf855c000  ! 3507: LDSH_R	ldsh	[%r23 + %r0], %r28
T2_asi_reg_wr_164:
	mov	0xc, %r14
	.word 0xfaf38e60  ! 3508: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_2_276:
	setx	0x3a0129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_277:
	setx	0x3b0218, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_148:
	mov	0x16, %r14
	.word 0xf6db8e80  ! 3518: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_2_278:
	setx	0x3a000a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_149:
	mov	0x16, %r14
	.word 0xf4db8e40  ! 3520: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_rd_150:
	mov	0x3c8, %r14
	.word 0xfcdb8e80  ! 3522: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_2_279:
	setx	0x39021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf494c020  ! 3525: LDUHA_R	lduha	[%r19, %r0] 0x01, %r26
	.word 0xf4dde05a  ! 3527: LDXA_I	ldxa	[%r23, + 0x005a] %asi, %r26
	.word 0xb1643801  ! 3531: MOVcc_I	<illegal instruction>
	.word 0xf8cd4020  ! 3533: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r28
	.word 0xf294a07f  ! 3535: LDUHA_I	lduha	[%r18, + 0x007f] %asi, %r25
	.word 0xfc15a01b  ! 3536: LDUH_I	lduh	[%r22 + 0x001b], %r30
	.word 0xf854a103  ! 3537: LDSH_I	ldsh	[%r18 + 0x0103], %r28
T2_asi_reg_wr_165:
	mov	0x10, %r14
	.word 0xfaf38e40  ! 3542: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_wr_166:
	mov	0x24, %r14
	.word 0xfaf384a0  ! 3545: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xf8142034  ! 3547: LDUH_I	lduh	[%r16 + 0x0034], %r28
	.word 0xf8cc200b  ! 3548: LDSBA_I	ldsba	[%r16, + 0x000b] %asi, %r28
	.word 0xfec4a0c1  ! 3549: LDSWA_I	ldswa	[%r18, + 0x00c1] %asi, %r31
	.word 0xf40dc000  ! 3550: LDUB_R	ldub	[%r23 + %r0], %r26
cpu_intr_2_280:
	setx	0x3b011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xa1902000  ! 3552: WRPR_GL_I	wrpr	%r0, 0x0000, %-
iob_intr_2_246:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_246), 16, 16)) -> intp(2, 0, 21)
	.word 0xf0cc602e  ! 3558: LDSBA_I	ldsba	[%r17, + 0x002e] %asi, %r24
	.word 0xfc8d4020  ! 3560: LDUBA_R	lduba	[%r21, %r0] 0x01, %r30
	.word 0xf64de1aa  ! 3561: LDSB_I	ldsb	[%r23 + 0x01aa], %r27
T2_asi_reg_rd_151:
	mov	0x3c5, %r14
	.word 0xfedb8400  ! 3563: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf2d460c3  ! 3564: LDSHA_I	ldsha	[%r17, + 0x00c3] %asi, %r25
	.word 0xf2940020  ! 3565: LDUHA_R	lduha	[%r16, %r0] 0x01, %r25
iob_intr_2_247:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_247), 16, 16)) -> intp(2, 0, 2c)
	.word 0xbe1dc000  ! 3567: XOR_R	xor 	%r23, %r0, %r31
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982a8a  ! 3568: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8a, %hpstate
T2_asi_reg_wr_167:
	mov	0x24, %r14
	.word 0xf2f384a0  ! 3572: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf294c020  ! 3574: LDUHA_R	lduha	[%r19, %r0] 0x01, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_248:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_248), 16, 16)) -> intp(2, 0, 37)
	.word 0x8594e113  ! 3581: WRPR_TSTATE_I	wrpr	%r19, 0x0113, %tstate
	ta	T_CHANGE_NONHPRIV
	.word 0xf65c20fa  ! 3586: LDX_I	ldx	[%r16 + 0x00fa], %r27
	ta	T_CHANGE_TO_TL0
	.word 0xfc5ca083  ! 3592: LDX_I	ldx	[%r18 + 0x0083], %r30
T2_asi_reg_rd_152:
	mov	0x1, %r14
	.word 0xf4db8e60  ! 3593: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xbb358000  ! 3595: SRL_R	srl 	%r22, %r0, %r29
cpu_intr_2_281:
	setx	0x38011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf21460dc  ! 3599: LDUH_I	lduh	[%r17 + 0x00dc], %r25
	.word 0xf8d5c020  ! 3603: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r28
	.word 0xb0054000  ! 3604: ADD_R	add 	%r21, %r0, %r24
T2_asi_reg_wr_168:
	mov	0x33, %r14
	.word 0xfaf384a0  ! 3608: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T2_asi_reg_rd_153:
	mov	0x34, %r14
	.word 0xfedb8e40  ! 3609: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb005c000  ! 3614: ADD_R	add 	%r23, %r0, %r24
	.word 0xbabc0000  ! 3621: XNORcc_R	xnorcc 	%r16, %r0, %r29
T2_asi_reg_rd_154:
	mov	0x3c2, %r14
	.word 0xf4db8e80  ! 3622: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	ta	T_CHANGE_TO_TL0
	.word 0xf25de199  ! 3627: LDX_I	ldx	[%r23 + 0x0199], %r25
T2_asi_reg_rd_155:
	mov	0x1f, %r14
	.word 0xf0db8e40  ! 3629: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_2_249:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_249), 16, 16)) -> intp(2, 0, 37)
cpu_intr_2_282:
	setx	0x3f022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983a10  ! 3639: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a10, %hpstate
	.word 0xb6a40000  ! 3641: SUBcc_R	subcc 	%r16, %r0, %r27
	.word 0xfcd4e1f8  ! 3645: LDSHA_I	ldsha	[%r19, + 0x01f8] %asi, %r30
cpu_intr_2_283:
	setx	0x3d0310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf7ce401  ! 3648: MOVR_I	movre	%r19, 0x1, %r31
	ta	T_CHANGE_HPRIV
cpu_intr_2_284:
	setx	0x3c0219, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_250:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_250), 16, 16)) -> intp(2, 0, 3d)
iob_intr_2_251:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_251), 16, 16)) -> intp(2, 0, 18)
iob_intr_2_252:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_252), 16, 16)) -> intp(2, 0, 37)
T2_asi_reg_rd_156:
	mov	0x2c, %r14
	.word 0xf2db8e80  ! 3657: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	ta	T_CHANGE_NONHPRIV
	.word 0xf05c2086  ! 3659: LDX_I	ldx	[%r16 + 0x0086], %r24
	.word 0xb4248000  ! 3662: SUB_R	sub 	%r18, %r0, %r26
	ta	T_CHANGE_HPRIV
	.word 0xf204c000  ! 3669: LDUW_R	lduw	[%r19 + %r0], %r25
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_169:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 3675: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfc8561c0  ! 3676: LDUWA_I	lduwa	[%r21, + 0x01c0] %asi, %r30
	.word 0xf014e0f5  ! 3677: LDUH_I	lduh	[%r19 + 0x00f5], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_285:
	setx	0x3e022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf804c000  ! 3681: LDUW_R	lduw	[%r19 + %r0], %r28
	.word 0xa1902000  ! 3682: WRPR_GL_I	wrpr	%r0, 0x0000, %-
iob_intr_2_253:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_253), 16, 16)) -> intp(2, 0, 22)
	.word 0xfc040000  ! 3688: LDUW_R	lduw	[%r16 + %r0], %r30
iob_intr_2_254:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_254), 16, 16)) -> intp(2, 0, 22)
iob_intr_2_255:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_255), 16, 16)) -> intp(2, 0, 4)
	.word 0xf2dd6111  ! 3693: LDXA_I	ldxa	[%r21, + 0x0111] %asi, %r25
T2_asi_reg_wr_170:
	mov	0x3c0, %r14
	.word 0xfcf389e0  ! 3694: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf6958020  ! 3699: LDUHA_R	lduha	[%r22, %r0] 0x01, %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xfa05c000  ! 3702: LDUW_R	lduw	[%r23 + %r0], %r29
cpu_intr_2_286:
	setx	0x3e0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe85a1ec  ! 3707: ADDcc_I	addcc 	%r22, 0x01ec, %r31
cpu_intr_2_287:
	setx	0x3f0012, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_256:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_256), 16, 16)) -> intp(2, 0, 32)
	.word 0xb53d5000  ! 3711: SRAX_R	srax	%r21, %r0, %r26
	.word 0xb83461d7  ! 3712: ORN_I	orn 	%r17, 0x01d7, %r28
T2_asi_reg_rd_157:
	mov	0x1b, %r14
	.word 0xf8db84a0  ! 3715: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf6d4605c  ! 3717: LDSHA_I	ldsha	[%r17, + 0x005c] %asi, %r27
	.word 0xf4144000  ! 3719: LDUH_R	lduh	[%r17 + %r0], %r26
iob_intr_2_257:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_257), 16, 16)) -> intp(2, 0, 19)
	.word 0xf205a074  ! 3724: LDUW_I	lduw	[%r22 + 0x0074], %r25
cpu_intr_2_288:
	setx	0x3e0334, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_258:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_258), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_289:
	setx	0x3f0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfedd6152  ! 3731: LDXA_I	ldxa	[%r21, + 0x0152] %asi, %r31
	.word 0xf6140000  ! 3732: LDUH_R	lduh	[%r16 + %r0], %r27
	.word 0xfe554000  ! 3733: LDSH_R	ldsh	[%r21 + %r0], %r31
	.word 0xfccd21f0  ! 3734: LDSBA_I	ldsba	[%r20, + 0x01f0] %asi, %r30
iob_intr_2_259:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_259), 16, 16)) -> intp(2, 0, 34)
	.word 0xf60c4000  ! 3738: LDUB_R	ldub	[%r17 + %r0], %r27
	.word 0xb03dc000  ! 3739: XNOR_R	xnor 	%r23, %r0, %r24
cpu_intr_2_290:
	setx	0x3e0133, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_291:
	setx	0x3e021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44c8000  ! 3750: LDSB_R	ldsb	[%r18 + %r0], %r26
	ta	T_CHANGE_TO_TL0
	.word 0xfe5dc000  ! 3754: LDX_R	ldx	[%r23 + %r0], %r31
	.word 0xf65d4000  ! 3756: LDX_R	ldx	[%r21 + %r0], %r27
T2_asi_reg_wr_171:
	mov	0x2f, %r14
	.word 0xf0f38e80  ! 3758: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf285e0dc  ! 3759: LDUWA_I	lduwa	[%r23, + 0x00dc] %asi, %r25
T2_asi_reg_rd_158:
	mov	0x25, %r14
	.word 0xf0db89e0  ! 3762: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T2_asi_reg_rd_159:
	mov	0xe, %r14
	.word 0xfedb84a0  ! 3769: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xba04c000  ! 3770: ADD_R	add 	%r19, %r0, %r29
T2_asi_reg_rd_160:
	mov	0x2d, %r14
	.word 0xf2db8e80  ! 3771: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb02c4000  ! 3774: ANDN_R	andn 	%r17, %r0, %r24
cpu_intr_2_292:
	setx	0x3e0305, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_161:
	mov	0x25, %r14
	.word 0xfcdb84a0  ! 3777: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xfcd5a1cf  ! 3778: LDSHA_I	ldsha	[%r22, + 0x01cf] %asi, %r30
cpu_intr_2_293:
	setx	0x3c010e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_260:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_260), 16, 16)) -> intp(2, 0, 11)
	.word 0xf0d461fb  ! 3783: LDSHA_I	ldsha	[%r17, + 0x01fb] %asi, %r24
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983a08  ! 3785: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a08, %hpstate
	.word 0xf6550000  ! 3789: LDSH_R	ldsh	[%r20 + %r0], %r27
	.word 0xfa85c020  ! 3790: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r29
cpu_intr_2_294:
	setx	0x3c003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44c8000  ! 3793: LDSB_R	ldsb	[%r18 + %r0], %r26
	.word 0xbe0d2185  ! 3794: AND_I	and 	%r20, 0x0185, %r31
	.word 0xf4dd613e  ! 3795: LDXA_I	ldxa	[%r21, + 0x013e] %asi, %r26
cpu_intr_2_295:
	setx	0x3e0020, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_296:
	setx	0x3f002a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_297:
	setx	0x3f0315, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_261:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_261), 16, 16)) -> intp(2, 0, 38)
	.word 0xf4c44020  ! 3805: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r26
cpu_intr_2_298:
	setx	0x3e0024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8544000  ! 3809: LDSH_R	ldsh	[%r17 + %r0], %r28
	ta	T_CHANGE_TO_TL0
cpu_intr_2_299:
	setx	0x3e0001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf445e1c7  ! 3814: LDSW_I	ldsw	[%r23 + 0x01c7], %r26
	.word 0xb0452109  ! 3815: ADDC_I	addc 	%r20, 0x0109, %r24
T2_asi_reg_rd_162:
	mov	0x3c1, %r14
	.word 0xf6db8400  ! 3816: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982f8a  ! 3817: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f8a, %hpstate
	.word 0xfe944020  ! 3818: LDUHA_R	lduha	[%r17, %r0] 0x01, %r31
	.word 0xfe05c000  ! 3823: LDUW_R	lduw	[%r23 + %r0], %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb0a44000  ! 3826: SUBcc_R	subcc 	%r17, %r0, %r24
	.word 0xfe848020  ! 3827: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r31
	.word 0xf44d0000  ! 3831: LDSB_R	ldsb	[%r20 + %r0], %r26
	.word 0xb6b4c000  ! 3832: ORNcc_R	orncc 	%r19, %r0, %r27
T2_asi_reg_wr_172:
	mov	0x2c, %r14
	.word 0xfcf389e0  ! 3834: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf8850020  ! 3836: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r28
	.word 0xf05d0000  ! 3840: LDX_R	ldx	[%r20 + %r0], %r24
	.word 0xf6850020  ! 3844: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r27
	.word 0xb6048000  ! 3845: ADD_R	add 	%r18, %r0, %r27
	.word 0xfc5dc000  ! 3846: LDX_R	ldx	[%r23 + %r0], %r30
T2_asi_reg_rd_163:
	mov	0x28, %r14
	.word 0xf2db8e40  ! 3847: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_2_300:
	setx	0x3f012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf00560f6  ! 3849: LDUW_I	lduw	[%r21 + 0x00f6], %r24
T2_asi_reg_wr_173:
	mov	0x12, %r14
	.word 0xf4f38e40  ! 3850: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_rd_164:
	mov	0x24, %r14
	.word 0xf6db8400  ! 3853: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T2_asi_reg_wr_174:
	mov	0x3c4, %r14
	.word 0xfaf38400  ! 3854: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_2_262:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_262), 16, 16)) -> intp(2, 0, 3c)
	.word 0xb03d4000  ! 3857: XNOR_R	xnor 	%r21, %r0, %r24
	.word 0xfe452025  ! 3863: LDSW_I	ldsw	[%r20 + 0x0025], %r31
cpu_intr_2_301:
	setx	0x3f0236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf085e0f3  ! 3872: LDUWA_I	lduwa	[%r23, + 0x00f3] %asi, %r24
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982cca  ! 3873: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cca, %hpstate
	.word 0xb93de001  ! 3875: SRA_I	sra 	%r23, 0x0001, %r28
iob_intr_2_263:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_263), 16, 16)) -> intp(2, 0, 16)
T2_asi_reg_rd_165:
	mov	0x1f, %r14
	.word 0xf6db8e40  ! 3877: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_wr_175:
	mov	0x3c5, %r14
	.word 0xf6f384a0  ! 3879: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	ta	T_CHANGE_TO_TL0
iob_intr_2_264:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_264), 16, 16)) -> intp(2, 0, 16)
T2_asi_reg_wr_176:
	mov	0x3c6, %r14
	.word 0xf6f389e0  ! 3894: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_2_265:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_265), 16, 16)) -> intp(2, 0, 5)
	.word 0xf01560fd  ! 3898: LDUH_I	lduh	[%r21 + 0x00fd], %r24
	.word 0xb084606b  ! 3899: ADDcc_I	addcc 	%r17, 0x006b, %r24
T2_asi_reg_rd_166:
	mov	0x5, %r14
	.word 0xfedb84a0  ! 3900: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xba24e00d  ! 3901: SUB_I	sub 	%r19, 0x000d, %r29
iob_intr_2_266:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_266), 16, 16)) -> intp(2, 0, 28)
iob_intr_2_267:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_267), 16, 16)) -> intp(2, 0, d)
iob_intr_2_268:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_268), 16, 16)) -> intp(2, 0, 3b)
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x819839d2  ! 3907: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19d2, %hpstate
T2_asi_reg_wr_177:
	mov	0x36, %r14
	.word 0xf0f38e40  ! 3910: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_2_269:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_269), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_wr_178:
	mov	0x0, %r14
	.word 0xfaf384a0  ! 3914: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T2_asi_reg_wr_179:
	mov	0x19, %r14
	.word 0xfcf38e80  ! 3915: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb0b5e0ed  ! 3917: SUBCcc_I	orncc 	%r23, 0x00ed, %r24
	ta	T_CHANGE_TO_TL0
cpu_intr_2_302:
	setx	0x3e013a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_270:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_270), 16, 16)) -> intp(2, 0, 26)
	ta	T_CHANGE_TO_TL1
	.word 0xfecc6086  ! 3925: LDSBA_I	ldsba	[%r17, + 0x0086] %asi, %r31
	.word 0xb8c40000  ! 3927: ADDCcc_R	addccc 	%r16, %r0, %r28
cpu_intr_2_303:
	setx	0x3d0207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf28cc020  ! 3932: LDUBA_R	lduba	[%r19, %r0] 0x01, %r25
T2_asi_reg_wr_180:
	mov	0x1f, %r14
	.word 0xf8f38e40  ! 3933: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf0056156  ! 3934: LDUW_I	lduw	[%r21 + 0x0156], %r24
	.word 0xfecd0020  ! 3936: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r31
cpu_intr_2_304:
	setx	0x3e033f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_181:
	mov	0x24, %r14
	.word 0xf6f38e80  ! 3939: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf6554000  ! 3941: LDSH_R	ldsh	[%r21 + %r0], %r27
	.word 0xbc8d0000  ! 3942: ANDcc_R	andcc 	%r20, %r0, %r30
iob_intr_2_271:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_271), 16, 16)) -> intp(2, 0, 12)
	.word 0xfad46026  ! 3945: LDSHA_I	ldsha	[%r17, + 0x0026] %asi, %r29
cpu_intr_2_305:
	setx	0x3f010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf004a080  ! 3949: LDUW_I	lduw	[%r18 + 0x0080], %r24
cpu_intr_2_306:
	setx	0x3e031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf284218b  ! 3951: LDUWA_I	lduwa	[%r16, + 0x018b] %asi, %r25
T2_asi_reg_rd_167:
	mov	0x27, %r14
	.word 0xf2db8e40  ! 3954: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfad44020  ! 3955: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r29
iob_intr_2_272:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_272), 16, 16)) -> intp(2, 0, 0)
	.word 0xf2cd2045  ! 3960: LDSBA_I	ldsba	[%r20, + 0x0045] %asi, %r25
iob_intr_2_273:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_273), 16, 16)) -> intp(2, 0, 31)
cpu_intr_2_307:
	setx	0x3e0221, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_168:
	mov	0x22, %r14
	.word 0xfadb89e0  ! 3967: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_2_308:
	setx	0x3f030d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_182:
	mov	0x21, %r14
	.word 0xf2f38e80  ! 3976: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf85520e0  ! 3978: LDSH_I	ldsh	[%r20 + 0x00e0], %r28
iob_intr_2_274:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_274), 16, 16)) -> intp(2, 0, 19)
iob_intr_2_275:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_275), 16, 16)) -> intp(2, 0, b)
	.word 0xf0848020  ! 3984: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r24
	.word 0xfc544000  ! 3991: LDSH_R	ldsh	[%r17 + %r0], %r30
	.word 0xfe442053  ! 3993: LDSW_I	ldsw	[%r16 + 0x0053], %r31
iob_intr_2_276:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_276), 16, 16)) -> intp(2, 0, 28)
iob_intr_2_277:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_277), 16, 16)) -> intp(2, 0, 38)
cpu_intr_2_309:
	setx	0x3e0309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8595217f  ! 4003: WRPR_TSTATE_I	wrpr	%r20, 0x017f, %tstate
	.word 0xfa4d0000  ! 4004: LDSB_R	ldsb	[%r20 + %r0], %r29
	.word 0xf0d40020  ! 4007: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r24
T2_asi_reg_rd_169:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 4008: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_2_310:
	setx	0x3f0227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe84a1fc  ! 4011: LDUWA_I	lduwa	[%r18, + 0x01fc] %asi, %r31
cpu_intr_2_311:
	setx	0x3c0118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8cc020  ! 4016: LDUBA_R	lduba	[%r19, %r0] 0x01, %r29
iob_intr_2_278:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_278), 16, 16)) -> intp(2, 0, 4)
cpu_intr_2_312:
	setx	0x3d020d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_279:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_279), 16, 16)) -> intp(2, 0, 1b)
iob_intr_2_280:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_280), 16, 16)) -> intp(2, 0, 2a)
	.word 0xfa5de0e3  ! 4027: LDX_I	ldx	[%r23 + 0x00e3], %r29
iob_intr_2_281:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_281), 16, 16)) -> intp(2, 0, 1a)
	setx	data_start_4, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983e1a  ! 4030: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e1a, %hpstate
	.word 0xb1643801  ! 4033: MOVcc_I	<illegal instruction>
cpu_intr_2_313:
	setx	0x3c0033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf814c000  ! 4037: LDUH_R	lduh	[%r19 + %r0], %r28
cpu_intr_2_314:
	setx	0x3c013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb684c000  ! 4039: ADDcc_R	addcc 	%r19, %r0, %r27
cpu_intr_2_315:
	setx	0x10209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72c7001  ! 4042: SLLX_I	sllx	%r17, 0x0001, %r27
cpu_intr_2_316:
	setx	0x3d0330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb52d4000  ! 4049: SLL_R	sll 	%r21, %r0, %r26
	.word 0xfa55e0b3  ! 4052: LDSH_I	ldsh	[%r23 + 0x00b3], %r29
	.word 0xf2544000  ! 4054: LDSH_R	ldsh	[%r17 + %r0], %r25
cpu_intr_2_317:
	setx	0x3c0304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_282:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_282), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf6944020  ! 4058: LDUHA_R	lduha	[%r17, %r0] 0x01, %r27
T2_asi_reg_wr_183:
	mov	0x3c6, %r14
	.word 0xfef38e40  ! 4059: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfed5a043  ! 4060: LDSHA_I	ldsha	[%r22, + 0x0043] %asi, %r31
cpu_intr_2_318:
	setx	0x3e0114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb32c0000  ! 4066: SLL_R	sll 	%r16, %r0, %r25
	.word 0xfe4ce052  ! 4068: LDSB_I	ldsb	[%r19 + 0x0052], %r31
	.word 0xb551c000  ! 4074: RDPR_TL	<illegal instruction>
	.word 0xf094e12f  ! 4080: LDUHA_I	lduha	[%r19, + 0x012f] %asi, %r24
iob_intr_2_283:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_283), 16, 16)) -> intp(2, 0, 14)
T2_asi_reg_wr_184:
	mov	0x6, %r14
	.word 0xf4f38400  ! 4084: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_2_284:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_284), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_rd_170:
	mov	0xd, %r14
	.word 0xf0db8e60  ! 4088: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf0c48020  ! 4091: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r24
iob_intr_2_285:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_285), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_286:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_286), 16, 16)) -> intp(2, 0, 15)
	ta	T_CHANGE_NONHPRIV
	.word 0xf00c8000  ! 4101: LDUB_R	ldub	[%r18 + %r0], %r24
	.word 0xf04d0000  ! 4106: LDSB_R	ldsb	[%r20 + %r0], %r24
	.word 0xf2cc4020  ! 4107: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r25
iob_intr_2_287:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_287), 16, 16)) -> intp(2, 0, 3e)
cpu_intr_2_319:
	setx	0x400318, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_171:
	mov	0x7, %r14
	.word 0xf0db8e40  ! 4112: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_320:
	setx	0x430223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf444e012  ! 4118: LDSW_I	ldsw	[%r19 + 0x0012], %r26
	.word 0xf45c4000  ! 4119: LDX_R	ldx	[%r17 + %r0], %r26
T2_asi_reg_wr_185:
	mov	0x26, %r14
	.word 0xfef38e80  ! 4120: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_2_321:
	setx	0x430203, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_288:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_288), 16, 16)) -> intp(2, 0, 16)
	setx	data_start_3, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983c58  ! 4124: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c58, %hpstate
	ta	T_CHANGE_TO_TL0
	.word 0xf4d5c020  ! 4126: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r26
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_186:
	mov	0x3c5, %r14
	.word 0xf0f38e60  ! 4132: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_2_289:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_289), 16, 16)) -> intp(2, 0, 1)
cpu_intr_2_322:
	setx	0x410012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4054000  ! 4136: LDUW_R	lduw	[%r21 + %r0], %r26
	.word 0xf0c56088  ! 4139: LDSWA_I	ldswa	[%r21, + 0x0088] %asi, %r24
	.word 0xfa15c000  ! 4144: LDUH_R	lduh	[%r23 + %r0], %r29
	.word 0xbe056005  ! 4149: ADD_I	add 	%r21, 0x0005, %r31
	.word 0xbf2dd000  ! 4152: SLLX_R	sllx	%r23, %r0, %r31
	.word 0xf695c020  ! 4154: LDUHA_R	lduha	[%r23, %r0] 0x01, %r27
	.word 0xf294609a  ! 4157: LDUHA_I	lduha	[%r17, + 0x009a] %asi, %r25
	.word 0xb32dc000  ! 4160: SLL_R	sll 	%r23, %r0, %r25
	.word 0xfec56070  ! 4161: LDSWA_I	ldswa	[%r21, + 0x0070] %asi, %r31
cpu_intr_2_323:
	setx	0x430216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_290:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_290), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_324:
	setx	0x400035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_325:
	setx	0x430011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa148000  ! 4170: LDUH_R	lduh	[%r18 + %r0], %r29
T2_asi_reg_wr_187:
	mov	0x24, %r14
	.word 0xf0f384a0  ! 4173: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_2_326:
	setx	0x400012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf40c4000  ! 4180: LDUB_R	ldub	[%r17 + %r0], %r26
	.word 0xfec5a05f  ! 4183: LDSWA_I	ldswa	[%r22, + 0x005f] %asi, %r31
	.word 0xf25c6144  ! 4184: LDX_I	ldx	[%r17 + 0x0144], %r25
	.word 0xfc946160  ! 4187: LDUHA_I	lduha	[%r17, + 0x0160] %asi, %r30
T2_asi_reg_rd_172:
	mov	0x36, %r14
	.word 0xfadb8e40  ! 4188: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_rd_173:
	mov	0x2f, %r14
	.word 0xfedb8e40  ! 4194: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf84c8000  ! 4197: LDSB_R	ldsb	[%r18 + %r0], %r28
iob_intr_2_291:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_291), 16, 16)) -> intp(2, 0, 17)
	.word 0xfa158000  ! 4201: LDUH_R	lduh	[%r22 + %r0], %r29
	.word 0xf8cc0020  ! 4202: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r28
	ta	T_CHANGE_TO_TL0
cpu_intr_2_327:
	setx	0x42010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65cc000  ! 4212: LDX_R	ldx	[%r19 + %r0], %r27
T2_asi_reg_wr_188:
	mov	0x24, %r14
	.word 0xf4f389e0  ! 4216: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_2_328:
	setx	0x410205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf80dc000  ! 4220: LDUB_R	ldub	[%r23 + %r0], %r28
iob_intr_2_292:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_292), 16, 16)) -> intp(2, 0, 16)
T2_asi_reg_wr_189:
	mov	0x3c0, %r14
	.word 0xf4f38400  ! 4229: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T2_asi_reg_wr_190:
	mov	0x37, %r14
	.word 0xf6f384a0  ! 4232: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf254a0e4  ! 4233: LDSH_I	ldsh	[%r18 + 0x00e4], %r25
	.word 0xf6142052  ! 4234: LDUH_I	lduh	[%r16 + 0x0052], %r27
	.word 0xf0c48020  ! 4235: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r24
	.word 0xf20c21f6  ! 4236: LDUB_I	ldub	[%r16 + 0x01f6], %r25
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982ed0  ! 4237: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed0, %hpstate
	.word 0xf054a03c  ! 4238: LDSH_I	ldsh	[%r18 + 0x003c], %r24
T2_asi_reg_rd_174:
	mov	0x3c3, %r14
	.word 0xf8db8e80  ! 4239: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T2_asi_reg_rd_175:
	mov	0x3c7, %r14
	.word 0xf4db84a0  ! 4242: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xfccd21bd  ! 4243: LDSBA_I	ldsba	[%r20, + 0x01bd] %asi, %r30
	.word 0xf6844020  ! 4245: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r27
	.word 0xfa95c020  ! 4248: LDUHA_R	lduha	[%r23, %r0] 0x01, %r29
iob_intr_2_293:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_293), 16, 16)) -> intp(2, 0, 7)
cpu_intr_2_329:
	setx	0x42002e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_294:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_294), 16, 16)) -> intp(2, 0, 3b)
cpu_intr_2_330:
	setx	0x410201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_295:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_295), 16, 16)) -> intp(2, 0, 12)
	ta	T_CHANGE_NONHPRIV
	.word 0xfa4c4000  ! 4261: LDSB_R	ldsb	[%r17 + %r0], %r29
cpu_intr_2_331:
	setx	0x40012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeacc000  ! 4265: ANDNcc_R	andncc 	%r19, %r0, %r31
	.word 0xbd3c9000  ! 4269: SRAX_R	srax	%r18, %r0, %r30
T2_asi_reg_rd_176:
	mov	0x23, %r14
	.word 0xfedb84a0  ! 4271: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_2_332:
	setx	0x40013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44de1c0  ! 4275: LDSB_I	ldsb	[%r23 + 0x01c0], %r26
cpu_intr_2_333:
	setx	0x430120, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_177:
	mov	0xf, %r14
	.word 0xfcdb8400  ! 4277: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T2_asi_reg_rd_178:
	mov	0x31, %r14
	.word 0xf6db8400  ! 4278: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_2_334:
	setx	0x410033, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_335:
	setx	0x41033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2c5a078  ! 4283: LDSWA_I	ldswa	[%r22, + 0x0078] %asi, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_336:
	setx	0x43013d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_337:
	setx	0x43000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfac5a09a  ! 4291: LDSWA_I	ldswa	[%r22, + 0x009a] %asi, %r29
iob_intr_2_296:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_296), 16, 16)) -> intp(2, 0, 22)
	.word 0xf2c560ca  ! 4293: LDSWA_I	ldswa	[%r21, + 0x00ca] %asi, %r25
cpu_intr_2_338:
	setx	0x400316, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_339:
	setx	0x410217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa844020  ! 4298: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r29
cpu_intr_2_340:
	setx	0x420311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc0d4000  ! 4304: AND_R	and 	%r21, %r0, %r30
T2_asi_reg_rd_179:
	mov	0x3c8, %r14
	.word 0xfcdb8e60  ! 4308: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb12d8000  ! 4310: SLL_R	sll 	%r22, %r0, %r24
	.word 0xfa948020  ! 4311: LDUHA_R	lduha	[%r18, %r0] 0x01, %r29
iob_intr_2_297:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_297), 16, 16)) -> intp(2, 0, 21)
T2_asi_reg_rd_180:
	mov	0x3c6, %r14
	.word 0xfcdb84a0  ! 4314: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_2_298:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_298), 16, 16)) -> intp(2, 0, f)
	.word 0xf04d0000  ! 4318: LDSB_R	ldsb	[%r20 + %r0], %r24
cpu_intr_2_341:
	setx	0x42001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_2_342:
	setx	0x430020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7508000  ! 4326: RDPR_TSTATE	<illegal instruction>
T2_asi_reg_wr_191:
	mov	0x27, %r14
	.word 0xfaf38e40  ! 4327: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_rd_181:
	mov	0x1c, %r14
	.word 0xfedb8e40  ! 4328: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb025a197  ! 4329: SUB_I	sub 	%r22, 0x0197, %r24
cpu_intr_2_343:
	setx	0x430202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5c208f  ! 4332: LDX_I	ldx	[%r16 + 0x008f], %r29
	.word 0xb6346079  ! 4334: SUBC_I	orn 	%r17, 0x0079, %r27
	.word 0xf8dde0c7  ! 4336: LDXA_I	ldxa	[%r23, + 0x00c7] %asi, %r28
T2_asi_reg_wr_192:
	mov	0x3c4, %r14
	.word 0xfcf384a0  ! 4337: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf614e13f  ! 4340: LDUH_I	lduh	[%r19 + 0x013f], %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xbf643801  ! 4342: MOVcc_I	<illegal instruction>
	.word 0xfe446070  ! 4346: LDSW_I	ldsw	[%r17 + 0x0070], %r31
	.word 0xf844c000  ! 4347: LDSW_R	ldsw	[%r19 + %r0], %r28
T2_asi_reg_wr_193:
	mov	0x3c4, %r14
	.word 0xf0f38e80  ! 4348: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T2_asi_reg_rd_182:
	mov	0x9, %r14
	.word 0xfadb8e40  ! 4350: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_wr_194:
	mov	0x37, %r14
	.word 0xf4f38e40  ! 4352: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb0bd214d  ! 4353: XNORcc_I	xnorcc 	%r20, 0x014d, %r24
	ta	T_CHANGE_TO_TL0
	.word 0xfed44020  ! 4357: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r31
cpu_intr_2_344:
	setx	0x43020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf844a184  ! 4360: LDSW_I	ldsw	[%r18 + 0x0184], %r28
	.word 0xfac54020  ! 4371: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r29
	.word 0xb615e15f  ! 4372: OR_I	or 	%r23, 0x015f, %r27
	.word 0xb824e14f  ! 4373: SUB_I	sub 	%r19, 0x014f, %r28
	.word 0xf04c61aa  ! 4375: LDSB_I	ldsb	[%r17 + 0x01aa], %r24
	.word 0xf8054000  ! 4377: LDUW_R	lduw	[%r21 + %r0], %r28
T2_asi_reg_wr_195:
	mov	0x10, %r14
	.word 0xfcf38e80  ! 4378: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_2_299:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_299), 16, 16)) -> intp(2, 0, 26)
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_345:
	setx	0x43010c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_300:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_300), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf60421a6  ! 4389: LDUW_I	lduw	[%r16 + 0x01a6], %r27
cpu_intr_2_346:
	setx	0x40012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4c48020  ! 4393: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r26
	.word 0xf20420bd  ! 4396: LDUW_I	lduw	[%r16 + 0x00bd], %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb2140000  ! 4400: OR_R	or 	%r16, %r0, %r25
	.word 0xf8444000  ! 4401: LDSW_R	ldsw	[%r17 + %r0], %r28
iob_intr_2_301:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_301), 16, 16)) -> intp(2, 0, 37)
T2_asi_reg_rd_183:
	mov	0x1f, %r14
	.word 0xf6db84a0  ! 4404: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb72c3001  ! 4405: SLLX_I	sllx	%r16, 0x0001, %r27
cpu_intr_2_347:
	setx	0x410334, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982898  ! 4411: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0898, %hpstate
	ta	T_CHANGE_HPRIV
cpu_intr_2_348:
	setx	0x42001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5c8000  ! 4415: LDX_R	ldx	[%r18 + %r0], %r29
cpu_intr_2_349:
	setx	0x400204, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_302:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_302), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_rd_184:
	mov	0xa, %r14
	.word 0xfedb8400  ! 4425: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf40dc000  ! 4426: LDUB_R	ldub	[%r23 + %r0], %r26
T2_asi_reg_wr_196:
	mov	0x26, %r14
	.word 0xfaf389e0  ! 4427: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_2_350:
	setx	0x420123, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_351:
	setx	0x41002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2cc6056  ! 4439: LDSBA_I	ldsba	[%r17, + 0x0056] %asi, %r25
T2_asi_reg_rd_185:
	mov	0x22, %r14
	.word 0xfcdb8e80  ! 4440: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_2_352:
	setx	0x410035, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_303:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_303), 16, 16)) -> intp(2, 0, 31)
	.word 0xf80d4000  ! 4449: LDUB_R	ldub	[%r21 + %r0], %r28
	ta	T_CHANGE_HPRIV
cpu_intr_2_353:
	setx	0x40003e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_354:
	setx	0x430203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24c600b  ! 4458: LDSB_I	ldsb	[%r17 + 0x000b], %r25
	.word 0xf654207e  ! 4459: LDSH_I	ldsh	[%r16 + 0x007e], %r27
	.word 0xfe558000  ! 4461: LDSH_R	ldsh	[%r22 + %r0], %r31
	ta	T_CHANGE_TO_TL1
iob_intr_2_304:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_304), 16, 16)) -> intp(2, 0, 2c)
	.word 0xfcc4a155  ! 4464: LDSWA_I	ldswa	[%r18, + 0x0155] %asi, %r30
T2_asi_reg_wr_197:
	mov	0x13, %r14
	.word 0xf8f38e40  ! 4468: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf8c40020  ! 4474: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r28
cpu_intr_2_355:
	setx	0x420108, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_186:
	mov	0xf, %r14
	.word 0xfedb8e60  ! 4478: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T2_asi_reg_wr_198:
	mov	0x28, %r14
	.word 0xf0f38e80  ! 4480: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbb3cb001  ! 4483: SRAX_I	srax	%r18, 0x0001, %r29
iob_intr_2_305:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_305), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_rd_187:
	mov	0x9, %r14
	.word 0xf8db89e0  ! 4487: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xfa54617a  ! 4488: LDSH_I	ldsh	[%r17 + 0x017a], %r29
	.word 0xfcd4611b  ! 4489: LDSHA_I	ldsha	[%r17, + 0x011b] %asi, %r30
	.word 0xbc9ca174  ! 4493: XORcc_I	xorcc 	%r18, 0x0174, %r30
T2_asi_reg_rd_188:
	mov	0x3c5, %r14
	.word 0xf8db84a0  ! 4495: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_2_356:
	setx	0x40020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf84c61a6  ! 4499: LDSB_I	ldsb	[%r17 + 0x01a6], %r28
	.word 0xf25d0000  ! 4500: LDX_R	ldx	[%r20 + %r0], %r25
	.word 0xf685c020  ! 4502: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r27
iob_intr_2_306:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_306), 16, 16)) -> intp(2, 0, b)
	.word 0xfc8da1c7  ! 4508: LDUBA_I	lduba	[%r22, + 0x01c7] %asi, %r30
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982c12  ! 4509: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c12, %hpstate
	.word 0xf65de12e  ! 4510: LDX_I	ldx	[%r23 + 0x012e], %r27
T2_asi_reg_rd_189:
	mov	0x22, %r14
	.word 0xf2db8e60  ! 4512: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_2_307:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_307), 16, 16)) -> intp(2, 0, 3d)
cpu_intr_2_357:
	setx	0x42002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28c0000  ! 4519: ANDcc_R	andcc 	%r16, %r0, %r25
T2_asi_reg_wr_199:
	mov	0x12, %r14
	.word 0xf4f38e40  ! 4521: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_358:
	setx	0x430102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb33de001  ! 4527: SRA_I	sra 	%r23, 0x0001, %r25
iob_intr_2_308:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_308), 16, 16)) -> intp(2, 0, 26)
	.word 0xf254200c  ! 4534: LDSH_I	ldsh	[%r16 + 0x000c], %r25
	.word 0xf20d4000  ! 4536: LDUB_R	ldub	[%r21 + %r0], %r25
iob_intr_2_309:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_309), 16, 16)) -> intp(2, 0, 28)
	.word 0xf4c5200e  ! 4543: LDSWA_I	ldswa	[%r20, + 0x000e] %asi, %r26
iob_intr_2_310:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_310), 16, 16)) -> intp(2, 0, 2e)
	.word 0xfa54e123  ! 4548: LDSH_I	ldsh	[%r19 + 0x0123], %r29
T2_asi_reg_rd_190:
	mov	0x3c7, %r14
	.word 0xf2db89e0  ! 4549: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_2_359:
	setx	0x420233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_360:
	setx	0x420123, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_191:
	mov	0x2, %r14
	.word 0xfcdb8400  ! 4555: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_2_361:
	setx	0x42021d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_362:
	setx	0x410208, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_200:
	mov	0x3c3, %r14
	.word 0xf8f38e40  ! 4560: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_2_363:
	setx	0x420222, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_201:
	mov	0x5, %r14
	.word 0xfaf38e40  ! 4562: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_364:
	setx	0x410106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe04c000  ! 4566: LDUW_R	lduw	[%r19 + %r0], %r31
	.word 0xb7518000  ! 4568: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_202:
	mov	0x3c4, %r14
	.word 0xfcf38e40  ! 4573: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfc946128  ! 4574: LDUHA_I	lduha	[%r17, + 0x0128] %asi, %r30
	.word 0xf8cc215f  ! 4577: LDSBA_I	ldsba	[%r16, + 0x015f] %asi, %r28
	ta	T_CHANGE_HPRIV
iob_intr_2_311:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_311), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_365:
	setx	0x470238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6054000  ! 4583: LDUW_R	lduw	[%r21 + %r0], %r27
iob_intr_2_312:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_312), 16, 16)) -> intp(2, 0, 25)
	.word 0xf6848020  ! 4586: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r27
	.word 0xf655601f  ! 4587: LDSH_I	ldsh	[%r21 + 0x001f], %r27
T2_asi_reg_rd_192:
	mov	0xa, %r14
	.word 0xf2db8e60  ! 4589: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T2_asi_reg_rd_193:
	mov	0xc, %r14
	.word 0xfedb8e60  ! 4590: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983942  ! 4591: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1942, %hpstate
	.word 0xb494e1b7  ! 4592: ORcc_I	orcc 	%r19, 0x01b7, %r26
cpu_intr_2_366:
	setx	0x45012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b58000  ! 4596: ORNcc_R	orncc 	%r22, %r0, %r27
cpu_intr_2_367:
	setx	0x470030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6040000  ! 4599: LDUW_R	lduw	[%r16 + %r0], %r27
	.word 0xfe8421a9  ! 4602: LDUWA_I	lduwa	[%r16, + 0x01a9] %asi, %r31
T2_asi_reg_rd_194:
	mov	0x3c1, %r14
	.word 0xfedb8e40  ! 4603: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_2_313:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_313), 16, 16)) -> intp(2, 0, 2c)
	ta	T_CHANGE_TO_TL0
	.word 0xbe352195  ! 4610: SUBC_I	orn 	%r20, 0x0195, %r31
	.word 0xbe9dc000  ! 4612: XORcc_R	xorcc 	%r23, %r0, %r31
	.word 0xf0d54020  ! 4615: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r24
T2_asi_reg_wr_203:
	mov	0x3c2, %r14
	.word 0xf6f38e80  ! 4619: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_2_368:
	setx	0x45002b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_314:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_314), 16, 16)) -> intp(2, 0, f)
	.word 0xb01d0000  ! 4623: XOR_R	xor 	%r20, %r0, %r24
	.word 0xf6d58020  ! 4624: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r27
iob_intr_2_315:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_315), 16, 16)) -> intp(2, 0, 1d)
T2_asi_reg_wr_204:
	mov	0x3c6, %r14
	.word 0xf6f38e40  ! 4626: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_369:
	setx	0x470112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0560ff  ! 4630: LDUW_I	lduw	[%r21 + 0x00ff], %r29
	.word 0xb22ca1df  ! 4631: ANDN_I	andn 	%r18, 0x01df, %r25
	.word 0xfed40020  ! 4632: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r31
T2_asi_reg_rd_195:
	mov	0x15, %r14
	.word 0xf4db8e40  ! 4634: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf8054000  ! 4635: LDUW_R	lduw	[%r21 + %r0], %r28
T2_asi_reg_rd_196:
	mov	0x11, %r14
	.word 0xf4db8e60  ! 4638: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T2_asi_reg_rd_197:
	mov	0x3c4, %r14
	.word 0xf0db8400  ! 4639: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb6344000  ! 4641: ORN_R	orn 	%r17, %r0, %r27
	.word 0xf2444000  ! 4643: LDSW_R	ldsw	[%r17 + %r0], %r25
	.word 0xfe552104  ! 4644: LDSH_I	ldsh	[%r20 + 0x0104], %r31
	.word 0xfc94e084  ! 4645: LDUHA_I	lduha	[%r19, + 0x0084] %asi, %r30
iob_intr_2_316:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_316), 16, 16)) -> intp(2, 0, 9)
T2_asi_reg_wr_205:
	mov	0x3c0, %r14
	.word 0xf4f384a0  ! 4647: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbf3c5000  ! 4648: SRAX_R	srax	%r17, %r0, %r31
iob_intr_2_317:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_317), 16, 16)) -> intp(2, 0, 24)
	.word 0xfc85c020  ! 4652: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r30
	.word 0xfa4ce0d2  ! 4653: LDSB_I	ldsb	[%r19 + 0x00d2], %r29
cpu_intr_2_370:
	setx	0x460137, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_206:
	mov	0x3c0, %r14
	.word 0xf4f38e60  ! 4657: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_2_371:
	setx	0x46022d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_372:
	setx	0x45003f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_318:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_318), 16, 16)) -> intp(2, 0, 31)
	ta	T_CHANGE_TO_TL1
iob_intr_2_319:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_319), 16, 16)) -> intp(2, 0, b)
T2_asi_reg_wr_207:
	mov	0x1, %r14
	.word 0xfef38e40  ! 4669: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_320:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_320), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_rd_198:
	mov	0x30, %r14
	.word 0xf8db89e0  ! 4674: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_2_321:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_321), 16, 16)) -> intp(2, 0, 3d)
cpu_intr_2_373:
	setx	0x47031a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_374:
	setx	0x47020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa1460d7  ! 4680: LDUH_I	lduh	[%r17 + 0x00d7], %r29
T2_asi_reg_rd_199:
	mov	0x0, %r14
	.word 0xf8db89e0  ! 4681: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	ta	T_CHANGE_NONHPRIV
iob_intr_2_322:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_322), 16, 16)) -> intp(2, 0, 35)
	.word 0xfec4208a  ! 4689: LDSWA_I	ldswa	[%r16, + 0x008a] %asi, %r31
T2_asi_reg_rd_200:
	mov	0x2c, %r14
	.word 0xf4db8e40  ! 4690: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf68de1d7  ! 4691: LDUBA_I	lduba	[%r23, + 0x01d7] %asi, %r27
	.word 0xf404a0d0  ! 4695: LDUW_I	lduw	[%r18 + 0x00d0], %r26
T2_asi_reg_wr_208:
	mov	0x2a, %r14
	.word 0xfef38e40  ! 4701: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_2_375:
	setx	0x460132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf654c000  ! 4704: LDSH_R	ldsh	[%r19 + %r0], %r27
iob_intr_2_323:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_323), 16, 16)) -> intp(2, 0, d)
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982d82  ! 4709: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d82, %hpstate
	.word 0xf4c5e0ce  ! 4710: LDSWA_I	ldswa	[%r23, + 0x00ce] %asi, %r26
	ta	T_CHANGE_TO_TL1
iob_intr_2_324:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_324), 16, 16)) -> intp(2, 0, 36)
iob_intr_2_325:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_325), 16, 16)) -> intp(2, 0, 2c)
	.word 0xfe5c2037  ! 4723: LDX_I	ldx	[%r16 + 0x0037], %r31
T2_asi_reg_wr_209:
	mov	0x2d, %r14
	.word 0xf4f389e0  ! 4724: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xba342077  ! 4725: ORN_I	orn 	%r16, 0x0077, %r29
	.word 0xfe0ca1bc  ! 4726: LDUB_I	ldub	[%r18 + 0x01bc], %r31
T2_asi_reg_rd_201:
	mov	0xf, %r14
	.word 0xfcdb8e40  ! 4727: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_wr_210:
	mov	0x3c1, %r14
	.word 0xfef38e80  ! 4728: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_2_326:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_326), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_376:
	setx	0x440114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfecca145  ! 4731: LDSBA_I	ldsba	[%r18, + 0x0145] %asi, %r31
T2_asi_reg_rd_202:
	mov	0x3c7, %r14
	.word 0xf2db8e80  ! 4732: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T2_asi_reg_wr_211:
	mov	0x14, %r14
	.word 0xf8f38e40  ! 4733: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_2_377:
	setx	0x460210, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_378:
	setx	0x450213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa14c000  ! 4743: LDUH_R	lduh	[%r19 + %r0], %r29
T2_asi_reg_rd_203:
	mov	0x3c2, %r14
	.word 0xf2db8400  ! 4745: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982ada  ! 4750: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ada, %hpstate
	.word 0xf80c8000  ! 4753: LDUB_R	ldub	[%r18 + %r0], %r28
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_204:
	mov	0x3c0, %r14
	.word 0xf2db8e80  ! 4757: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T2_asi_reg_wr_212:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 4759: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_2_379:
	setx	0x45022a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_205:
	mov	0x3c5, %r14
	.word 0xf2db84a0  ! 4763: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb805a0cc  ! 4764: ADD_I	add 	%r22, 0x00cc, %r28
iob_intr_2_327:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_327), 16, 16)) -> intp(2, 0, 22)
iob_intr_2_328:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_328), 16, 16)) -> intp(2, 0, 35)
	.word 0xbe45a17c  ! 4771: ADDC_I	addc 	%r22, 0x017c, %r31
cpu_intr_2_380:
	setx	0x440338, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_213:
	mov	0xf, %r14
	.word 0xf4f38e80  ! 4774: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf6458000  ! 4777: LDSW_R	ldsw	[%r22 + %r0], %r27
T2_asi_reg_rd_206:
	mov	0x3c3, %r14
	.word 0xfcdb84a0  ! 4778: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xfe4d214a  ! 4779: LDSB_I	ldsb	[%r20 + 0x014a], %r31
cpu_intr_2_381:
	setx	0x450307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4cc4020  ! 4791: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r26
	.word 0xbe24a164  ! 4793: SUB_I	sub 	%r18, 0x0164, %r31
	.word 0xf6dca15e  ! 4794: LDXA_I	ldxa	[%r18, + 0x015e] %asi, %r27
	.word 0xf04d201c  ! 4795: LDSB_I	ldsb	[%r20 + 0x001c], %r24
	.word 0xf685e023  ! 4798: LDUWA_I	lduwa	[%r23, + 0x0023] %asi, %r27
T2_asi_reg_wr_214:
	mov	0x2a, %r14
	.word 0xf8f38e40  ! 4800: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_329:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_329), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf65ce0b0  ! 4803: LDX_I	ldx	[%r19 + 0x00b0], %r27
	.word 0xfc0c0000  ! 4804: LDUB_R	ldub	[%r16 + %r0], %r30
	.word 0xf404613c  ! 4806: LDUW_I	lduw	[%r17 + 0x013c], %r26
iob_intr_2_330:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_330), 16, 16)) -> intp(2, 0, 27)
T2_asi_reg_rd_207:
	mov	0x19, %r14
	.word 0xf2db8e60  ! 4810: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_2_331:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_331), 16, 16)) -> intp(2, 0, c)
iob_intr_2_332:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_332), 16, 16)) -> intp(2, 0, 0)
T2_asi_reg_rd_208:
	mov	0x3c6, %r14
	.word 0xf8db8400  ! 4813: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xfa05e14a  ! 4819: LDUW_I	lduw	[%r23 + 0x014a], %r29
T2_asi_reg_rd_209:
	mov	0x34, %r14
	.word 0xfedb8e40  ! 4823: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfe8d4020  ! 4826: LDUBA_R	lduba	[%r21, %r0] 0x01, %r31
iob_intr_2_333:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_333), 16, 16)) -> intp(2, 0, 3f)
T2_asi_reg_wr_215:
	mov	0x2c, %r14
	.word 0xf6f38e40  ! 4830: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_382:
	setx	0x470008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3350000  ! 4839: SRL_R	srl 	%r20, %r0, %r25
T2_asi_reg_rd_210:
	mov	0x26, %r14
	.word 0xf4db8e60  ! 4840: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x819828c2  ! 4843: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c2, %hpstate
cpu_intr_2_383:
	setx	0x470008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf085c020  ! 4848: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r24
	.word 0xf2cd4020  ! 4853: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r25
	.word 0xf495607e  ! 4854: LDUHA_I	lduha	[%r21, + 0x007e] %asi, %r26
cpu_intr_2_384:
	setx	0x450338, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_385:
	setx	0x460017, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_334:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_334), 16, 16)) -> intp(2, 0, 1b)
	.word 0xfc55e03c  ! 4862: LDSH_I	ldsh	[%r23 + 0x003c], %r30
cpu_intr_2_386:
	setx	0x450110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4dc000  ! 4865: LDSB_R	ldsb	[%r23 + %r0], %r29
	.word 0xb29dc000  ! 4866: XORcc_R	xorcc 	%r23, %r0, %r25
cpu_intr_2_387:
	setx	0x46011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb40c2098  ! 4871: AND_I	and 	%r16, 0x0098, %r26
T2_asi_reg_rd_211:
	mov	0x3c2, %r14
	.word 0xfedb8e40  ! 4873: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_2_388:
	setx	0x460121, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_335:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_335), 16, 16)) -> intp(2, 0, 12)
cpu_intr_2_389:
	setx	0x450238, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_336:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_336), 16, 16)) -> intp(2, 0, 25)
	.word 0xf694c020  ! 4881: LDUHA_R	lduha	[%r19, %r0] 0x01, %r27
cpu_intr_2_390:
	setx	0x47032e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_337:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_337), 16, 16)) -> intp(2, 0, 1b)
	ta	T_CHANGE_HPRIV
	.word 0xfa4ce1ce  ! 4887: LDSB_I	ldsb	[%r19 + 0x01ce], %r29
	.word 0xb83da175  ! 4891: XNOR_I	xnor 	%r22, 0x0175, %r28
	.word 0xf80ca103  ! 4892: LDUB_I	ldub	[%r18 + 0x0103], %r28
	.word 0xf8154000  ! 4894: LDUH_R	lduh	[%r21 + %r0], %r28
iob_intr_2_338:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_338), 16, 16)) -> intp(2, 0, b)
T2_asi_reg_rd_212:
	mov	0x1e, %r14
	.word 0xfadb8e40  ! 4897: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_2_339:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_339), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_wr_216:
	mov	0x34, %r14
	.word 0xf2f38e60  ! 4900: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf4cc0020  ! 4902: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r26
cpu_intr_2_391:
	setx	0x460321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc8c8020  ! 4912: LDUBA_R	lduba	[%r18, %r0] 0x01, %r30
cpu_intr_2_392:
	setx	0x470024, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf284a1ec  ! 4915: LDUWA_I	lduwa	[%r18, + 0x01ec] %asi, %r25
T2_asi_reg_rd_213:
	mov	0x26, %r14
	.word 0xf4db8400  ! 4916: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xfe446154  ! 4920: LDSW_I	ldsw	[%r17 + 0x0154], %r31
T2_asi_reg_wr_217:
	mov	0x3c5, %r14
	.word 0xf2f38e60  ! 4921: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_2_393:
	setx	0x470119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec44020  ! 4928: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r31
	.word 0xf85dc000  ! 4929: LDX_R	ldx	[%r23 + %r0], %r28
	.word 0xb4240000  ! 4931: SUB_R	sub 	%r16, %r0, %r26
iob_intr_2_340:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_340), 16, 16)) -> intp(2, 0, 36)
T2_asi_reg_wr_218:
	mov	0x2e, %r14
	.word 0xf6f384a0  ! 4937: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xfc8dc020  ! 4939: LDUBA_R	lduba	[%r23, %r0] 0x01, %r30
T2_asi_reg_rd_214:
	mov	0x23, %r14
	.word 0xfedb8e60  ! 4942: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb13c2001  ! 4944: SRA_I	sra 	%r16, 0x0001, %r24
cpu_intr_2_394:
	setx	0x44023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8d6061  ! 4948: ANDcc_I	andcc 	%r21, 0x0061, %r30
T2_asi_reg_rd_215:
	mov	0x38, %r14
	.word 0xf8db89e0  ! 4949: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_2_341:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_341), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf61561d2  ! 4953: LDUH_I	lduh	[%r21 + 0x01d2], %r27
iob_intr_2_342:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_342), 16, 16)) -> intp(2, 0, 30)
	.word 0xf095e09c  ! 4957: LDUHA_I	lduha	[%r23, + 0x009c] %asi, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_343:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_343), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_rd_216:
	mov	0x13, %r14
	.word 0xf6db8e80  ! 4967: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	ta	T_CHANGE_TO_TL1
	.word 0xbd35c000  ! 4969: SRL_R	srl 	%r23, %r0, %r30
	.word 0xf8cc61e8  ! 4973: LDSBA_I	ldsba	[%r17, + 0x01e8] %asi, %r28
iob_intr_2_344:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_344), 16, 16)) -> intp(2, 0, 34)
	.word 0xf805606a  ! 4976: LDUW_I	lduw	[%r21 + 0x006a], %r28
T2_asi_reg_wr_219:
	mov	0xb, %r14
	.word 0xf2f38e80  ! 4978: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T2_asi_reg_rd_217:
	mov	0x3c6, %r14
	.word 0xfadb8e60  ! 4979: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xfe54a11e  ! 4980: LDSH_I	ldsh	[%r18 + 0x011e], %r31
cpu_intr_2_395:
	setx	0x470006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc95c020  ! 4988: LDUHA_R	lduha	[%r23, %r0] 0x01, %r30
	.word 0xf6154000  ! 4989: LDUH_R	lduh	[%r21 + %r0], %r27
	.word 0xf845a10d  ! 4991: LDSW_I	ldsw	[%r22 + 0x010d], %r28
	.word 0xf44da0ed  ! 4993: LDSB_I	ldsb	[%r22 + 0x00ed], %r26
iob_intr_2_345:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_345), 16, 16)) -> intp(2, 0, 26)
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
T1_asi_reg_wr_0:
	mov	0x11, %r14
	.word 0xfaf384a0  ! 3: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_0), 16, 16)) -> intp(1, 0, f)
cpu_intr_1_0:
	setx	0x1a0121, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_1), 16, 16)) -> intp(1, 0, 37)
	.word 0xb3a00540  ! 9: FSQRTd	fsqrt	
	.word 0xbba40960  ! 12: FMULq	dis not found

	.word 0xb9a4c820  ! 14: FADDs	fadds	%f19, %f0, %f28
	.word 0xb3a00020  ! 16: FMOVs	fmovs	%f0, %f25
	.word 0xbf643801  ! 19: MOVcc_I	<illegal instruction>
	.word 0xbdab0820  ! 24: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xbba81420  ! 28: FMOVRNZ	dis not found

cpu_intr_1_1:
	setx	0x1f0332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda588e0  ! 33: FSUBq	dis not found

	.word 0xb3a4c860  ! 34: FADDq	dis not found

	.word 0xb43c0000  ! 37: XNOR_R	xnor 	%r16, %r0, %r26
cpu_intr_1_2:
	setx	0x1d031b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_1:
	mov	0xf, %r14
	.word 0xf4f384a0  ! 42: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_2), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_wr_2:
	mov	0x10, %r14
	.word 0xfef384a0  ! 45: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_1_3:
	setx	0x1e0036, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_3), 16, 16)) -> intp(1, 0, 18)
	.word 0xb7a94820  ! 48: FMOVCS	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_3:
	mov	0x3c8, %r14
	.word 0xf4f38e80  ! 49: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_4), 16, 16)) -> intp(1, 0, 35)
iob_intr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_5), 16, 16)) -> intp(1, 0, d)
cpu_intr_1_4:
	setx	0x1c0215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda5c9a0  ! 58: FDIVs	fdivs	%f23, %f0, %f30
cpu_intr_1_5:
	setx	0x1e012f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_0:
	mov	0x6, %r14
	.word 0xfedb8e80  ! 60: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_1_6:
	setx	0x1f0206, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_1:
	mov	0x25, %r14
	.word 0xf0db8e40  ! 63: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_1_7:
	setx	0x1e0203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00520  ! 66: FSQRTs	fsqrt	
iob_intr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_6), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_wr_4:
	mov	0x3c0, %r14
	.word 0xfaf384a0  ! 74: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_1_8:
	setx	0x1c0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba240000  ! 76: SUB_R	sub 	%r16, %r0, %r29
T1_asi_reg_wr_5:
	mov	0x3c8, %r14
	.word 0xf8f38e40  ! 77: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbfa549a0  ! 78: FDIVs	fdivs	%f21, %f0, %f31
	.word 0xbfa81820  ! 81: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb9a81420  ! 82: FMOVRNZ	dis not found

	.word 0xbe8d8000  ! 83: ANDcc_R	andcc 	%r22, %r0, %r31
T1_asi_reg_wr_6:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 87: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb3a5c840  ! 90: FADDd	faddd	%f54, %f0, %f56
	.word 0xbfa448c0  ! 91: FSUBd	fsubd	%f48, %f0, %f62
	.word 0xb3a98820  ! 92: FMOVNEG	fmovs	%fcc1, %f0, %f25
cpu_intr_1_9:
	setx	0x1d0226, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_2:
	mov	0x18, %r14
	.word 0xf4db89e0  ! 96: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_7), 16, 16)) -> intp(1, 0, 4)
	.word 0xb685c000  ! 100: ADDcc_R	addcc 	%r23, %r0, %r27
	.word 0xba046090  ! 101: ADD_I	add 	%r17, 0x0090, %r29
	.word 0xbba5c820  ! 103: FADDs	fadds	%f23, %f0, %f29
iob_intr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_8), 16, 16)) -> intp(1, 0, 3e)
iob_intr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_9), 16, 16)) -> intp(1, 0, 31)
	.word 0xb9a589a0  ! 108: FDIVs	fdivs	%f22, %f0, %f28
iob_intr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_10), 16, 16)) -> intp(1, 0, 3a)
T1_asi_reg_wr_7:
	mov	0x11, %r14
	.word 0xf0f38400  ! 113: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0x8795a176  ! 115: WRPR_TT_I	wrpr	%r22, 0x0176, %tt
iob_intr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_11), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb7a5c9c0  ! 118: FDIVd	fdivd	%f54, %f0, %f58
T1_asi_reg_wr_8:
	mov	0x3c0, %r14
	.word 0xf2f389e0  ! 119: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb9a00020  ! 121: FMOVs	fmovs	%f0, %f28
	.word 0xbda98820  ! 123: FMOVNEG	fmovs	%fcc1, %f0, %f30
cpu_intr_1_10:
	setx	0x1d0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a9c820  ! 127: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb3a4c9a0  ! 132: FDIVs	fdivs	%f19, %f0, %f25
cpu_intr_1_11:
	setx	0x1c0336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80c20  ! 136: FMOVRLZ	dis not found

T1_asi_reg_rd_3:
	mov	0x21, %r14
	.word 0xfedb8e80  ! 137: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_1_12:
	setx	0x1e030d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_9:
	mov	0x3c6, %r14
	.word 0xf2f389e0  ! 141: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_1_13:
	setx	0x1e0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeb5e0ed  ! 147: ORNcc_I	orncc 	%r23, 0x00ed, %r31
iob_intr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_12), 16, 16)) -> intp(1, 0, 2)
	.word 0xbe0cc000  ! 155: AND_R	and 	%r19, %r0, %r31
	.word 0xbe342114  ! 159: ORN_I	orn 	%r16, 0x0114, %r31
	.word 0xbda4c9a0  ! 160: FDIVs	fdivs	%f19, %f0, %f30
cpu_intr_1_14:
	setx	0x1c0010, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_13), 16, 16)) -> intp(1, 0, 1e)
	.word 0xbabc4000  ! 166: XNORcc_R	xnorcc 	%r17, %r0, %r29
	.word 0xb9a98820  ! 169: FMOVNEG	fmovs	%fcc1, %f0, %f28
cpu_intr_1_15:
	setx	0x1d0206, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_14), 16, 16)) -> intp(1, 0, 10)
	.word 0xb1aac820  ! 173: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb2252169  ! 174: SUB_I	sub 	%r20, 0x0169, %r25
iob_intr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_15), 16, 16)) -> intp(1, 0, 3a)
	.word 0xbe050000  ! 178: ADD_R	add 	%r20, %r0, %r31
	.word 0xbba00540  ! 179: FSQRTd	fsqrt	
iob_intr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_16), 16, 16)) -> intp(1, 0, 15)
iob_intr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_17), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb9a4c960  ! 186: FMULq	dis not found

T1_asi_reg_wr_10:
	mov	0x3c1, %r14
	.word 0xf2f38e80  ! 187: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbe8c206c  ! 188: ANDcc_I	andcc 	%r16, 0x006c, %r31
	.word 0xb80d206a  ! 190: AND_I	and 	%r20, 0x006a, %r28
	.word 0xb5a4c940  ! 192: FMULd	fmuld	%f50, %f0, %f26
	.word 0xb4c5c000  ! 193: ADDCcc_R	addccc 	%r23, %r0, %r26
	.word 0xb7a00520  ! 197: FSQRTs	fsqrt	
cpu_intr_1_16:
	setx	0x1c033d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_17:
	setx	0x1f0107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda84820  ! 203: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xbba80420  ! 204: FMOVRZ	dis not found

	.word 0xbba00040  ! 206: FMOVd	fmovd	%f0, %f60
T1_asi_reg_rd_4:
	mov	0x3c4, %r14
	.word 0xf6db8e40  ! 207: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_18:
	setx	0x1e0238, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_19:
	setx	0x1c001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a4c840  ! 214: FADDd	faddd	%f50, %f0, %f26
iob_intr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_18), 16, 16)) -> intp(1, 0, 22)
	.word 0xbba54920  ! 221: FMULs	fmuls	%f21, %f0, %f29
	.word 0xbba88820  ! 222: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb5a00020  ! 223: FMOVs	fmovs	%f0, %f26
T1_asi_reg_wr_11:
	mov	0x3c1, %r14
	.word 0xfcf38400  ! 226: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb9aa8820  ! 227: FMOVG	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_12:
	mov	0x3c2, %r14
	.word 0xf8f38e80  ! 228: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xbbaa0820  ! 230: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xbfab0820  ! 231: FMOVGU	fmovs	%fcc1, %f0, %f31
iob_intr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_19), 16, 16)) -> intp(1, 0, 25)
	.word 0xb9a548a0  ! 233: FSUBs	fsubs	%f21, %f0, %f28
T1_asi_reg_rd_5:
	mov	0x2, %r14
	.word 0xf2db8e40  ! 235: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_rd_6:
	mov	0x3c6, %r14
	.word 0xf2db84a0  ! 236: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xa1902000  ! 239: WRPR_GL_I	wrpr	%r0, 0x0000, %-
iob_intr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_20), 16, 16)) -> intp(1, 0, 3e)
cpu_intr_1_20:
	setx	0x1e0310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00040  ! 250: FMOVd	fmovd	%f0, %f62
iob_intr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_21), 16, 16)) -> intp(1, 0, 8)
	.word 0xb1a488e0  ! 256: FSUBq	dis not found

iob_intr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_22), 16, 16)) -> intp(1, 0, 1c)
cpu_intr_1_21:
	setx	0x1f0106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00040  ! 262: FMOVd	fmovd	%f0, %f28
	.word 0xbcb48000  ! 265: SUBCcc_R	orncc 	%r18, %r0, %r30
cpu_intr_1_22:
	setx	0x1c0129, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_13:
	mov	0x1, %r14
	.word 0xfaf389e0  ! 267: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbda00020  ! 269: FMOVs	fmovs	%f0, %f30
	.word 0xb5a88820  ! 271: FMOVLE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_23:
	setx	0x1f0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1641800  ! 281: MOVcc_R	<illegal instruction>
	.word 0xb9a84820  ! 283: FMOVE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_24:
	setx	0x1e010d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_23), 16, 16)) -> intp(1, 0, 9)
	.word 0xbbab4820  ! 290: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb5a4c9e0  ! 294: FDIVq	dis not found

T1_asi_reg_rd_7:
	mov	0xb, %r14
	.word 0xf2db8400  ! 296: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb3a00020  ! 299: FMOVs	fmovs	%f0, %f25
	.word 0xb7aac820  ! 300: FMOVGE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_14:
	mov	0x1b, %r14
	.word 0xf4f38e40  ! 301: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_25:
	setx	0x1d0105, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_15:
	mov	0x26, %r14
	.word 0xf6f38e80  ! 304: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb5a90820  ! 305: FMOVLEU	fmovs	%fcc1, %f0, %f26
cpu_intr_1_26:
	setx	0x1c0319, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_27:
	setx	0x1f0223, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_28:
	setx	0x1e0202, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_24), 16, 16)) -> intp(1, 0, f)
iob_intr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_25), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb9a4c820  ! 328: FADDs	fadds	%f19, %f0, %f28
cpu_intr_1_29:
	setx	0x1e000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3aac820  ! 331: FMOVGE	fmovs	%fcc1, %f0, %f25
iob_intr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_26), 16, 16)) -> intp(1, 0, 1d)
T1_asi_reg_wr_16:
	mov	0x16, %r14
	.word 0xf4f38e60  ! 334: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T1_asi_reg_rd_8:
	mov	0x1c, %r14
	.word 0xfadb89e0  ! 335: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_1_30:
	setx	0x1c0323, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_9:
	mov	0x3c4, %r14
	.word 0xf8db89e0  ! 337: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_1_31:
	setx	0x1e0236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aa8820  ! 343: FMOVG	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_10:
	mov	0x3c0, %r14
	.word 0xf8db84a0  ! 344: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_1_32:
	setx	0x1e032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfabc820  ! 347: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb3a88820  ! 348: FMOVLE	fmovs	%fcc1, %f0, %f25
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xb7a489e0  ! 355: FDIVq	dis not found

	.word 0xb1a4c960  ! 356: FMULq	dis not found

	.word 0xb1aa8820  ! 357: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xbba84820  ! 359: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb9a88820  ! 360: FMOVLE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_33:
	setx	0x1c0026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b561b4  ! 365: ORNcc_I	orncc 	%r21, 0x01b4, %r25
	lda	[%r19 + %g0] 0xf0, %f2
T1_asi_reg_rd_11:
	mov	0x3, %r14
	.word 0xf8db84a0  ! 368: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbfa40960  ! 370: FMULq	dis not found

iob_intr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_27), 16, 16)) -> intp(1, 0, 3f)
iob_intr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_28), 16, 16)) -> intp(1, 0, 3b)
	.word 0xbb346001  ! 373: SRL_I	srl 	%r17, 0x0001, %r29
	.word 0xb3a81c20  ! 375: FMOVRGEZ	dis not found

T1_asi_reg_rd_12:
	mov	0xd, %r14
	.word 0xf2db84a0  ! 377: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_29), 16, 16)) -> intp(1, 0, 29)
iob_intr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_30), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_31), 16, 16)) -> intp(1, 0, 35)
	.word 0xb3ab0820  ! 382: FMOVGU	fmovs	%fcc1, %f0, %f25
iob_intr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_32), 16, 16)) -> intp(1, 0, 20)
cpu_intr_1_34:
	setx	0x1c0201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda489c0  ! 388: FDIVd	fdivd	%f18, %f0, %f30
iob_intr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_33), 16, 16)) -> intp(1, 0, 8)
	.word 0xb1a00040  ! 390: FMOVd	fmovd	%f0, %f24
cpu_intr_1_35:
	setx	0x1c0013, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_36:
	setx	0x1f0110, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_34), 16, 16)) -> intp(1, 0, 3f)
T1_asi_reg_rd_13:
	mov	0x3, %r14
	.word 0xfcdb84a0  ! 398: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T1_asi_reg_wr_17:
	mov	0x3c5, %r14
	.word 0xf8f38400  ! 400: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T1_asi_reg_wr_18:
	mov	0x3c5, %r14
	.word 0xf8f38e60  ! 404: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T1_asi_reg_rd_14:
	mov	0x3c3, %r14
	.word 0xf8db84a0  ! 409: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb9a8c820  ! 411: FMOVL	fmovs	%fcc1, %f0, %f28
iob_intr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_35), 16, 16)) -> intp(1, 0, 3c)
cpu_intr_1_37:
	setx	0x1d0304, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r18 + %g0] 0xf0, %f2
T1_asi_reg_rd_15:
	mov	0xe, %r14
	.word 0xf8db89e0  ! 425: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xa1902001  ! 427: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xb3abc820  ! 429: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb1a58860  ! 431: FADDq	dis not found

	.word 0xb3a5c960  ! 432: FMULq	dis not found

	.word 0xb5a44960  ! 435: FMULq	dis not found

cpu_intr_1_38:
	setx	0x1c0031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_39:
	setx	0x1f001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b521a0  ! 439: ORNcc_I	orncc 	%r20, 0x01a0, %r27
	.word 0xb80460dd  ! 440: ADD_I	add 	%r17, 0x00dd, %r28
	.word 0xbfa00560  ! 442: FSQRTq	fsqrt	
	.word 0xb3a48920  ! 443: FMULs	fmuls	%f18, %f0, %f25
T1_asi_reg_rd_16:
	mov	0x1f, %r14
	.word 0xf8db8e80  ! 444: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_36), 16, 16)) -> intp(1, 0, 2e)
cpu_intr_1_40:
	setx	0x1f033b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_37), 16, 16)) -> intp(1, 0, f)
	.word 0xb3a88820  ! 454: FMOVLE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_19:
	mov	0x2a, %r14
	.word 0xf2f389e0  ! 458: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_1_41:
	setx	0x1f010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_20:
	mov	0x32, %r14
	.word 0xf6f384a0  ! 461: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_38), 16, 16)) -> intp(1, 0, 2f)
	.word 0xbc24c000  ! 471: SUB_R	sub 	%r19, %r0, %r30
T1_asi_reg_wr_21:
	mov	0x19, %r14
	.word 0xf6f38e60  ! 472: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T1_asi_reg_rd_17:
	mov	0x1c, %r14
	.word 0xf4db8e80  ! 473: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_1_42:
	setx	0x23002f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_22:
	mov	0xb, %r14
	.word 0xfef38e60  ! 476: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T1_asi_reg_wr_23:
	mov	0x3c3, %r14
	.word 0xfcf38e40  ! 478: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb5a80820  ! 480: FMOVN	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_24:
	mov	0x6, %r14
	.word 0xfef38e60  ! 484: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb1aa8820  ! 488: FMOVG	fmovs	%fcc1, %f0, %f24
iob_intr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_39), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_rd_18:
	mov	0x1d, %r14
	.word 0xf8db8400  ! 494: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_40), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_43:
	setx	0x210102, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_41), 16, 16)) -> intp(1, 0, 8)
	.word 0xb1351000  ! 503: SRLX_R	srlx	%r20, %r0, %r24
cpu_intr_1_44:
	setx	0x22013f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_45:
	setx	0x220129, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_25:
	mov	0x3c3, %r14
	.word 0xf8f384a0  ! 508: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_42), 16, 16)) -> intp(1, 0, 3c)
cpu_intr_1_46:
	setx	0x22013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda58860  ! 514: FADDq	dis not found

	.word 0xb7aa4820  ! 520: FMOVNE	fmovs	%fcc1, %f0, %f27
	lda	[%r18 + %g0] 0xf0, %f2
iob_intr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_43), 16, 16)) -> intp(1, 0, 30)
	.word 0xb0ac616f  ! 523: ANDNcc_I	andncc 	%r17, 0x016f, %r24
iob_intr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_44), 16, 16)) -> intp(1, 0, 1a)
	.word 0xbba54920  ! 528: FMULs	fmuls	%f21, %f0, %f29
	.word 0xb5a588c0  ! 530: FSUBd	fsubd	%f22, %f0, %f26
	.word 0xb0448000  ! 531: ADDC_R	addc 	%r18, %r0, %r24
T1_asi_reg_wr_26:
	mov	0x32, %r14
	.word 0xfcf38400  ! 533: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb5a00520  ! 537: FSQRTs	fsqrt	
cpu_intr_1_47:
	setx	0x22001e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_19:
	mov	0x15, %r14
	.word 0xf0db89e0  ! 541: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_45), 16, 16)) -> intp(1, 0, 22)
	.word 0xbda5c840  ! 543: FADDd	faddd	%f54, %f0, %f30
	.word 0xbbab4820  ! 546: FMOVCC	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_20:
	mov	0x18, %r14
	.word 0xfcdb8e60  ! 547: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_1_48:
	setx	0x230237, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_21:
	mov	0x3c3, %r14
	.word 0xf4db8e60  ! 550: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_1_49:
	setx	0x22000e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_27:
	mov	0x26, %r14
	.word 0xf8f38400  ! 554: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_1_50:
	setx	0x21030f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_46), 16, 16)) -> intp(1, 0, 12)
T1_asi_reg_wr_28:
	mov	0xe, %r14
	.word 0xf6f38e80  ! 557: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbbab8820  ! 558: FMOVPOS	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_22:
	mov	0x15, %r14
	.word 0xfadb8e80  ! 559: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T1_asi_reg_wr_29:
	mov	0x17, %r14
	.word 0xf6f384a0  ! 560: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_1_51:
	setx	0x230212, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_52:
	setx	0x22021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3aa4820  ! 567: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xbbab8820  ! 568: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb3a549c0  ! 570: FDIVd	fdivd	%f52, %f0, %f56
iob_intr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_47), 16, 16)) -> intp(1, 0, 28)
T1_asi_reg_wr_30:
	mov	0x0, %r14
	.word 0xfef38e60  ! 573: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T1_asi_reg_wr_31:
	mov	0x3c5, %r14
	.word 0xf0f38e40  ! 577: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_1_53:
	setx	0x200305, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_32:
	mov	0x35, %r14
	.word 0xf8f38e40  ! 581: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb7359000  ! 585: SRLX_R	srlx	%r22, %r0, %r27
cpu_intr_1_54:
	setx	0x220208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00020  ! 588: FMOVs	fmovs	%f0, %f24
iob_intr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_48), 16, 16)) -> intp(1, 0, 5)
cpu_intr_1_55:
	setx	0x230032, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_56:
	setx	0x210201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a588e0  ! 597: FSUBq	dis not found

cpu_intr_1_57:
	setx	0x23030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_33:
	mov	0x3c6, %r14
	.word 0xf4f384a0  ! 601: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb3a508e0  ! 602: FSUBq	dis not found

	.word 0xbbab4820  ! 603: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb5a90820  ! 605: FMOVLEU	fmovs	%fcc1, %f0, %f26
cpu_intr_1_58:
	setx	0x23011f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_59:
	setx	0x220028, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_49), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_60:
	setx	0x23021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_61:
	setx	0x22010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2bc8000  ! 631: XNORcc_R	xnorcc 	%r18, %r0, %r25
iob_intr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_50), 16, 16)) -> intp(1, 0, 4)
cpu_intr_1_62:
	setx	0x220008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a81420  ! 637: FMOVRNZ	dis not found

iob_intr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_51), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_52:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_52), 16, 16)) -> intp(1, 0, 2e)
T1_asi_reg_wr_34:
	mov	0x25, %r14
	.word 0xf0f384a0  ! 642: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbba00560  ! 643: FSQRTq	fsqrt	
iob_intr_1_53:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_53), 16, 16)) -> intp(1, 0, 21)
cpu_intr_1_63:
	setx	0x230100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba1c8000  ! 648: XOR_R	xor 	%r18, %r0, %r29
	.word 0xb73d8000  ! 649: SRA_R	sra 	%r22, %r0, %r27
T1_asi_reg_wr_35:
	mov	0x3c2, %r14
	.word 0xf4f389e0  ! 650: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T1_asi_reg_rd_23:
	mov	0x5, %r14
	.word 0xfadb89e0  ! 651: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T1_asi_reg_wr_36:
	mov	0x3, %r14
	.word 0xf2f38e60  ! 653: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb9a48960  ! 654: FMULq	dis not found

T1_asi_reg_rd_24:
	mov	0x25, %r14
	.word 0xfadb8400  ! 655: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_64:
	setx	0x21023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_37:
	mov	0x3c8, %r14
	.word 0xf0f38e40  ! 663: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_wr_38:
	mov	0x3c2, %r14
	.word 0xf0f389e0  ! 667: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T1_asi_reg_rd_25:
	mov	0x7, %r14
	.word 0xfadb8400  ! 669: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbda00560  ! 672: FSQRTq	fsqrt	
iob_intr_1_54:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_54), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_65:
	setx	0x20002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb32d8000  ! 677: SLL_R	sll 	%r22, %r0, %r25
cpu_intr_1_66:
	setx	0x230123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a54920  ! 679: FMULs	fmuls	%f21, %f0, %f28
iob_intr_1_55:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_55), 16, 16)) -> intp(1, 0, c)
	.word 0xbdaa0820  ! 682: FMOVA	fmovs	%fcc1, %f0, %f30
iob_intr_1_56:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_56), 16, 16)) -> intp(1, 0, 2f)
cpu_intr_1_67:
	setx	0x210004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aa8820  ! 685: FMOVG	fmovs	%fcc1, %f0, %f24
iob_intr_1_57:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_57), 16, 16)) -> intp(1, 0, 21)
cpu_intr_1_68:
	setx	0x220319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa488e0  ! 691: FSUBq	dis not found

T1_asi_reg_wr_39:
	mov	0x1a, %r14
	.word 0xf2f38e80  ! 692: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_1_58:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_58), 16, 16)) -> intp(1, 0, 1f)
cpu_intr_1_69:
	setx	0x210228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00520  ! 695: FSQRTs	fsqrt	
	.word 0xb7a448e0  ! 696: FSUBq	dis not found

iob_intr_1_59:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_59), 16, 16)) -> intp(1, 0, 19)
	.word 0xb835c000  ! 701: ORN_R	orn 	%r23, %r0, %r28
	.word 0xbb343001  ! 703: SRLX_I	srlx	%r16, 0x0001, %r29
T1_asi_reg_rd_26:
	mov	0x6, %r14
	.word 0xfcdb8e40  ! 716: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_rd_27:
	mov	0x3c6, %r14
	.word 0xf2db89e0  ! 717: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb3a00520  ! 720: FSQRTs	fsqrt	
T1_asi_reg_wr_40:
	mov	0x14, %r14
	.word 0xfef384a0  ! 721: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xbda00540  ! 722: FSQRTd	fsqrt	
T1_asi_reg_rd_28:
	mov	0x11, %r14
	.word 0xfedb89e0  ! 728: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_1_70:
	setx	0x200310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaa8820  ! 730: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb5a00520  ! 733: FSQRTs	fsqrt	
T1_asi_reg_wr_41:
	mov	0xd, %r14
	.word 0xf2f384a0  ! 736: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T1_asi_reg_wr_42:
	mov	0x2d, %r14
	.word 0xf8f389e0  ! 738: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T1_asi_reg_rd_29:
	mov	0x2d, %r14
	.word 0xf4db8e40  ! 742: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbb34f001  ! 744: SRLX_I	srlx	%r19, 0x0001, %r29
	.word 0xbfa00540  ! 746: FSQRTd	fsqrt	
	.word 0xb7a4c8a0  ! 750: FSUBs	fsubs	%f19, %f0, %f27
cpu_intr_1_71:
	setx	0x220115, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_72:
	setx	0x23010b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_73:
	setx	0x200236, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_43:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 763: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_rd_30:
	mov	0x3c2, %r14
	.word 0xfedb8e40  ! 764: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb9a548c0  ! 765: FSUBd	fsubd	%f52, %f0, %f28
	.word 0xb3a81820  ! 769: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xbda549a0  ! 776: FDIVs	fdivs	%f21, %f0, %f30
iob_intr_1_60:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_60), 16, 16)) -> intp(1, 0, 1b)
cpu_intr_1_74:
	setx	0x230324, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_44:
	mov	0x29, %r14
	.word 0xf4f38e60  ! 780: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_1_75:
	setx	0x230032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c940  ! 783: FMULd	fmuld	%f50, %f0, %f62
T1_asi_reg_wr_45:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 784: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbfa98820  ! 785: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xbf7c4400  ! 789: MOVR_R	movre	%r17, %r0, %r31
	.word 0xb3a488c0  ! 793: FSUBd	fsubd	%f18, %f0, %f56
	.word 0xbc350000  ! 794: ORN_R	orn 	%r20, %r0, %r30
	.word 0xbd2c0000  ! 802: SLL_R	sll 	%r16, %r0, %r30
	.word 0xb5abc820  ! 805: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb7a48960  ! 807: FMULq	dis not found

T1_asi_reg_wr_46:
	mov	0x16, %r14
	.word 0xf6f38e60  ! 812: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T1_asi_reg_rd_31:
	mov	0x3c2, %r14
	.word 0xf4db8e80  ! 818: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbbabc820  ! 821: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb1a448c0  ! 823: FSUBd	fsubd	%f48, %f0, %f24
	.word 0xb7a80820  ! 824: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
iob_intr_1_61:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_61), 16, 16)) -> intp(1, 0, 8)
	.word 0xb5a8c820  ! 826: FMOVL	fmovs	%fcc1, %f0, %f26
iob_intr_1_62:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_62), 16, 16)) -> intp(1, 0, 3)
T1_asi_reg_rd_32:
	mov	0x3c8, %r14
	.word 0xf0db8e80  ! 828: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb095a01c  ! 829: ORcc_I	orcc 	%r22, 0x001c, %r24
T1_asi_reg_wr_47:
	mov	0x3c7, %r14
	.word 0xf0f38e40  ! 830: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_1_76:
	setx	0x220013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb88421bf  ! 835: ADDcc_I	addcc 	%r16, 0x01bf, %r28
iob_intr_1_63:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_63), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb5a40940  ! 842: FMULd	fmuld	%f16, %f0, %f26
	.word 0xbb354000  ! 843: SRL_R	srl 	%r21, %r0, %r29
iob_intr_1_64:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_64), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_wr_48:
	mov	0x3c7, %r14
	.word 0xfcf38e40  ! 845: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_65:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_65), 16, 16)) -> intp(1, 0, 30)
	.word 0xb1a00020  ! 850: FMOVs	fmovs	%f0, %f24
	.word 0xbda44820  ! 851: FADDs	fadds	%f17, %f0, %f30
	.word 0xb3a4c9c0  ! 852: FDIVd	fdivd	%f50, %f0, %f56
T1_asi_reg_wr_49:
	mov	0x32, %r14
	.word 0xfcf38e60  ! 853: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_1_77:
	setx	0x20011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbea50000  ! 858: SUBcc_R	subcc 	%r20, %r0, %r31
	.word 0xbfa54820  ! 859: FADDs	fadds	%f21, %f0, %f31
T1_asi_reg_rd_33:
	mov	0xb, %r14
	.word 0xf2db8e60  ! 860: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb5a88820  ! 864: FMOVLE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_78:
	setx	0x230105, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_79:
	setx	0x22000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfab4820  ! 873: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb22d0000  ! 876: ANDN_R	andn 	%r20, %r0, %r25
iob_intr_1_66:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_66), 16, 16)) -> intp(1, 0, 2b)
T1_asi_reg_rd_34:
	mov	0x1d, %r14
	.word 0xf2db8e40  ! 883: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbfa80820  ! 884: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xbda48940  ! 885: FMULd	fmuld	%f18, %f0, %f30
	.word 0x85942101  ! 886: WRPR_TSTATE_I	wrpr	%r16, 0x0101, %tstate
	.word 0xbd2c2001  ! 888: SLL_I	sll 	%r16, 0x0001, %r30
	.word 0xb814e07c  ! 889: OR_I	or 	%r19, 0x007c, %r28
	.word 0xb7a54860  ! 890: FADDq	dis not found

T1_asi_reg_wr_50:
	mov	0x3c4, %r14
	.word 0xf6f38e60  ! 893: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T1_asi_reg_rd_35:
	mov	0x3c8, %r14
	.word 0xf2db8400  ! 896: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_1_80:
	setx	0x260031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_81:
	setx	0x26023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb21520f7  ! 909: OR_I	or 	%r20, 0x00f7, %r25
iob_intr_1_67:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_67), 16, 16)) -> intp(1, 0, 30)
T1_asi_reg_wr_51:
	mov	0x3c5, %r14
	.word 0xf8f389e0  ! 915: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_1_68:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_68), 16, 16)) -> intp(1, 0, 20)
	.word 0xb17c0400  ! 917: MOVR_R	movre	%r16, %r0, %r24
T1_asi_reg_wr_52:
	mov	0x20, %r14
	.word 0xf4f38e40  ! 919: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_rd_36:
	mov	0x25, %r14
	.word 0xf4db8e80  ! 920: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb8c40000  ! 921: ADDCcc_R	addccc 	%r16, %r0, %r28
cpu_intr_1_82:
	setx	0x270032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a44820  ! 924: FADDs	fadds	%f17, %f0, %f24
	.word 0xbd520000  ! 926: RDPR_PIL	<illegal instruction>
	.word 0xb1a00040  ! 927: FMOVd	fmovd	%f0, %f24
	.word 0xbda81c20  ! 928: FMOVRGEZ	dis not found

T1_asi_reg_wr_53:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 937: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbba80420  ! 938: FMOVRZ	dis not found

cpu_intr_1_83:
	setx	0x260302, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_84:
	setx	0x25031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a84820  ! 942: FMOVE	fmovs	%fcc1, %f0, %f26
iob_intr_1_69:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_69), 16, 16)) -> intp(1, 0, 14)
	.word 0xb7a9c820  ! 948: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb22d4000  ! 949: ANDN_R	andn 	%r21, %r0, %r25
	.word 0xb9a94820  ! 951: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xbba00040  ! 954: FMOVd	fmovd	%f0, %f60
	.word 0xb53ca001  ! 956: SRA_I	sra 	%r18, 0x0001, %r26
iob_intr_1_70:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_70), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_71:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_71), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb1a58920  ! 965: FMULs	fmuls	%f22, %f0, %f24
T1_asi_reg_rd_37:
	mov	0x2c, %r14
	.word 0xfedb8e80  ! 971: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xbe0c0000  ! 972: AND_R	and 	%r16, %r0, %r31
	.word 0xbba40840  ! 973: FADDd	faddd	%f16, %f0, %f60
	lda	[%r17 + %g0] 0xf0, %f2
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_85:
	setx	0x240217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a409c0  ! 983: FDIVd	fdivd	%f16, %f0, %f26
cpu_intr_1_86:
	setx	0x260321, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_87:
	setx	0x270333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80820  ! 992: FMOVN	fmovs	%fcc1, %f0, %f31
cpu_intr_1_88:
	setx	0x270010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0ade117  ! 996: ANDNcc_I	andncc 	%r23, 0x0117, %r24
	.word 0xb6944000  ! 997: ORcc_R	orcc 	%r17, %r0, %r27
T1_asi_reg_wr_54:
	mov	0x3c1, %r14
	.word 0xfef38e80  ! 999: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T1_asi_reg_rd_38:
	mov	0x11, %r14
	.word 0xf8db8e60  ! 1000: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_1_89:
	setx	0x270218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a408a0  ! 1003: FSUBs	fsubs	%f16, %f0, %f25
cpu_intr_1_90:
	setx	0x250029, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_39:
	mov	0x3c2, %r14
	.word 0xf8db8e80  ! 1005: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_1_72:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_72), 16, 16)) -> intp(1, 0, 35)
iob_intr_1_73:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_73), 16, 16)) -> intp(1, 0, 1e)
	.word 0xbca58000  ! 1009: SUBcc_R	subcc 	%r22, %r0, %r30
cpu_intr_1_91:
	setx	0x250208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba81820  ! 1013: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb3a80c20  ! 1014: FMOVRLZ	dis not found

cpu_intr_1_92:
	setx	0x270037, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_40:
	mov	0x8, %r14
	.word 0xfcdb89e0  ! 1016: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb5aac820  ! 1017: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb5a90820  ! 1018: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xbfa509a0  ! 1019: FDIVs	fdivs	%f20, %f0, %f31
	.word 0xbda54860  ! 1022: FADDq	dis not found

iob_intr_1_74:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_74), 16, 16)) -> intp(1, 0, 28)
	.word 0xbda90820  ! 1027: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xbe0460b6  ! 1028: ADD_I	add 	%r17, 0x00b6, %r31
T1_asi_reg_rd_41:
	mov	0xc, %r14
	.word 0xfadb8e40  ! 1030: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb3a4c820  ! 1033: FADDs	fadds	%f19, %f0, %f25
	.word 0xbfa589e0  ! 1036: FDIVq	dis not found

	.word 0xb7a81820  ! 1039: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xbfaa4820  ! 1040: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xbba81820  ! 1042: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb62c4000  ! 1044: ANDN_R	andn 	%r17, %r0, %r27
	.word 0xbda80420  ! 1045: FMOVRZ	dis not found

T1_asi_reg_wr_55:
	mov	0x3c0, %r14
	.word 0xf0f389e0  ! 1046: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb5a48920  ! 1047: FMULs	fmuls	%f18, %f0, %f26
T1_asi_reg_rd_42:
	mov	0x3c2, %r14
	.word 0xf0db84a0  ! 1048: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_1_93:
	setx	0x27020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe140000  ! 1052: OR_R	or 	%r16, %r0, %r31
cpu_intr_1_94:
	setx	0x270127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 1055: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb3aa0820  ! 1059: FMOVA	fmovs	%fcc1, %f0, %f25
cpu_intr_1_95:
	setx	0x240024, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_56:
	mov	0x3c0, %r14
	.word 0xfaf38e60  ! 1061: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbe14c000  ! 1067: OR_R	or 	%r19, %r0, %r31
	.word 0xb9a48940  ! 1070: FMULd	fmuld	%f18, %f0, %f28
	.word 0xb9a5c940  ! 1071: FMULd	fmuld	%f54, %f0, %f28
T1_asi_reg_rd_43:
	mov	0x3c0, %r14
	.word 0xf4db8e40  ! 1072: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb1a00040  ! 1073: FMOVd	fmovd	%f0, %f24
	.word 0xb9a508e0  ! 1076: FSUBq	dis not found

iob_intr_1_75:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_75), 16, 16)) -> intp(1, 0, 3a)
T1_asi_reg_rd_44:
	mov	0x23, %r14
	.word 0xfcdb8e40  ! 1078: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_wr_57:
	mov	0xb, %r14
	.word 0xf8f38e40  ! 1080: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_96:
	setx	0x250335, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_76:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_76), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb63ce0dc  ! 1091: XNOR_I	xnor 	%r19, 0x00dc, %r27
	.word 0xbda98820  ! 1093: FMOVNEG	fmovs	%fcc1, %f0, %f30
cpu_intr_1_97:
	setx	0x26021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80420  ! 1098: FMOVRZ	dis not found

cpu_intr_1_98:
	setx	0x250317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x899561cf  ! 1104: WRPR_TICK_I	wrpr	%r21, 0x01cf, %tick
	.word 0xbda9c820  ! 1105: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xbda80420  ! 1107: FMOVRZ	dis not found

cpu_intr_1_99:
	setx	0x240306, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_77:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_77), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb1a4c960  ! 1114: FMULq	dis not found

	.word 0xb6acc000  ! 1116: ANDNcc_R	andncc 	%r19, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbd3c8000  ! 1119: SRA_R	sra 	%r18, %r0, %r30
	.word 0xbbab8820  ! 1120: FMOVPOS	fmovs	%fcc1, %f0, %f29
cpu_intr_1_100:
	setx	0x25031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba8ca1aa  ! 1124: ANDcc_I	andcc 	%r18, 0x01aa, %r29
	.word 0xb7aac820  ! 1125: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb1aac820  ! 1126: FMOVGE	fmovs	%fcc1, %f0, %f24
cpu_intr_1_101:
	setx	0x240227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9ab4820  ! 1130: FMOVCC	fmovs	%fcc1, %f0, %f28
iob_intr_1_78:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_78), 16, 16)) -> intp(1, 0, 2)
cpu_intr_1_102:
	setx	0x250013, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_103:
	setx	0x240034, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_104:
	setx	0x260339, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_105:
	setx	0x250025, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_79:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_79), 16, 16)) -> intp(1, 0, 24)
	.word 0xb1a00540  ! 1141: FSQRTd	fsqrt	
	.word 0xbfa80420  ! 1145: FMOVRZ	dis not found

T1_asi_reg_rd_45:
	mov	0x3c5, %r14
	.word 0xfedb8e60  ! 1146: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb9ab0820  ! 1147: FMOVGU	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_58:
	mov	0x28, %r14
	.word 0xf2f389e0  ! 1148: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T1_asi_reg_wr_59:
	mov	0x7, %r14
	.word 0xf2f38e80  ! 1149: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_1_80:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_80), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_rd_46:
	mov	0x32, %r14
	.word 0xfadb8e40  ! 1155: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_1_106:
	setx	0x260236, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_60:
	mov	0x3c3, %r14
	.word 0xf6f384a0  ! 1162: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T1_asi_reg_rd_47:
	mov	0xd, %r14
	.word 0xf8db84a0  ! 1170: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_1_81:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_81), 16, 16)) -> intp(1, 0, 1f)
T1_asi_reg_rd_48:
	mov	0xa, %r14
	.word 0xf6db89e0  ! 1173: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb3a00520  ! 1174: FSQRTs	fsqrt	
	.word 0xbfa94820  ! 1175: FMOVCS	fmovs	%fcc1, %f0, %f31
cpu_intr_1_107:
	setx	0x240228, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_108:
	setx	0x240212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbabda13a  ! 1178: XNORcc_I	xnorcc 	%r22, 0x013a, %r29
iob_intr_1_82:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_82), 16, 16)) -> intp(1, 0, 3d)
T1_asi_reg_rd_49:
	mov	0x31, %r14
	.word 0xf6db8e40  ! 1182: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_109:
	setx	0x24012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c9e0  ! 1185: FDIVq	dis not found

	.word 0xbda40860  ! 1190: FADDq	dis not found

	.word 0xbba81820  ! 1192: FMOVRGZ	fmovs	%fcc3, %f0, %f29
iob_intr_1_83:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_83), 16, 16)) -> intp(1, 0, 8)
	.word 0xb5a549e0  ! 1194: FDIVq	dis not found

	.word 0xb3a5c960  ! 1198: FMULq	dis not found

cpu_intr_1_110:
	setx	0x240325, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_61:
	mov	0x3c6, %r14
	.word 0xfcf38400  ! 1210: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb1aa8820  ! 1211: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb00c4000  ! 1212: AND_R	and 	%r17, %r0, %r24
	.word 0xb5a80820  ! 1213: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xbfa58940  ! 1214: FMULd	fmuld	%f22, %f0, %f62
	.word 0xb1a4c9e0  ! 1215: FDIVq	dis not found

	.word 0xb645e1f7  ! 1216: ADDC_I	addc 	%r23, 0x01f7, %r27
T1_asi_reg_rd_50:
	mov	0x33, %r14
	.word 0xfedb89e0  ! 1217: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb3aa0820  ! 1219: FMOVA	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_62:
	mov	0x7, %r14
	.word 0xfcf38400  ! 1220: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb9a489e0  ! 1222: FDIVq	dis not found

	.word 0xbfa00520  ! 1226: FSQRTs	fsqrt	
	.word 0xb5a40920  ! 1228: FMULs	fmuls	%f16, %f0, %f26
	.word 0xbfa80820  ! 1229: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	lda	[%r21 + %g0] 0xf0, %f2
iob_intr_1_84:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_84), 16, 16)) -> intp(1, 0, 3c)
	.word 0xba450000  ! 1235: ADDC_R	addc 	%r20, %r0, %r29
cpu_intr_1_111:
	setx	0x27021e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_112:
	setx	0x270205, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_85:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_85), 16, 16)) -> intp(1, 0, 28)
	.word 0xbba80820  ! 1250: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	lda	[%r21 + %g0] 0xf0, %f2
	.word 0xb5a489a0  ! 1254: FDIVs	fdivs	%f18, %f0, %f26
cpu_intr_1_113:
	setx	0x260030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba508c0  ! 1260: FSUBd	fsubd	%f20, %f0, %f60
	.word 0xb1a48840  ! 1262: FADDd	faddd	%f18, %f0, %f24
	.word 0xbc34617c  ! 1266: SUBC_I	orn 	%r17, 0x017c, %r30
	.word 0xb43460f8  ! 1267: ORN_I	orn 	%r17, 0x00f8, %r26
iob_intr_1_86:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_86), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb1a81c20  ! 1269: FMOVRGEZ	dis not found

	.word 0xbfa5c9a0  ! 1270: FDIVs	fdivs	%f23, %f0, %f31
	.word 0xbfa5c8c0  ! 1273: FSUBd	fsubd	%f54, %f0, %f62
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_87:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_87), 16, 16)) -> intp(1, 0, f)
	.word 0xb1a80c20  ! 1281: FMOVRLZ	dis not found

iob_intr_1_88:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_88), 16, 16)) -> intp(1, 0, 3d)
T1_asi_reg_wr_63:
	mov	0x26, %r14
	.word 0xfcf38400  ! 1285: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbcc48000  ! 1291: ADDCcc_R	addccc 	%r18, %r0, %r30
	.word 0xb3a94820  ! 1293: FMOVCS	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_64:
	mov	0x29, %r14
	.word 0xfaf384a0  ! 1298: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbea54000  ! 1301: SUBcc_R	subcc 	%r21, %r0, %r31
	.word 0xb9a48860  ! 1302: FADDq	dis not found

	.word 0xb1a44840  ! 1307: FADDd	faddd	%f48, %f0, %f24
	.word 0xb1a94820  ! 1309: FMOVCS	fmovs	%fcc1, %f0, %f24
iob_intr_1_89:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_89), 16, 16)) -> intp(1, 0, 34)
iob_intr_1_90:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_90), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb3ab0820  ! 1318: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xbda90820  ! 1319: FMOVLEU	fmovs	%fcc1, %f0, %f30
cpu_intr_1_114:
	setx	0x250208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a81c20  ! 1325: FMOVRGEZ	dis not found

	.word 0xb1a81c20  ! 1328: FMOVRGEZ	dis not found

iob_intr_1_91:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_91), 16, 16)) -> intp(1, 0, 2d)
	.word 0xbda4c8e0  ! 1331: FSUBq	dis not found

	.word 0xb1a54820  ! 1337: FADDs	fadds	%f21, %f0, %f24
cpu_intr_1_115:
	setx	0x250019, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_65:
	mov	0x30, %r14
	.word 0xf4f38e40  ! 1342: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbba81420  ! 1344: FMOVRNZ	dis not found

iob_intr_1_92:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_92), 16, 16)) -> intp(1, 0, 3)
	.word 0xb37c0400  ! 1346: MOVR_R	movre	%r16, %r0, %r25
cpu_intr_1_116:
	setx	0x260121, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_66:
	mov	0x17, %r14
	.word 0xf2f38e60  ! 1355: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xbfa00560  ! 1356: FSQRTq	fsqrt	
	.word 0xb57d4400  ! 1358: MOVR_R	movre	%r21, %r0, %r26
iob_intr_1_93:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_93), 16, 16)) -> intp(1, 0, 22)
cpu_intr_1_117:
	setx	0x240316, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_94:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_94), 16, 16)) -> intp(1, 0, 1e)
T1_asi_reg_wr_67:
	mov	0x19, %r14
	.word 0xf4f38e80  ! 1365: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T1_asi_reg_rd_51:
	mov	0x3c6, %r14
	.word 0xf4db8e80  ! 1366: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T1_asi_reg_wr_68:
	mov	0x35, %r14
	.word 0xf8f389e0  ! 1369: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb1a5c9e0  ! 1372: FDIVq	dis not found

T1_asi_reg_rd_52:
	mov	0x3c0, %r14
	.word 0xfedb84a0  ! 1375: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_1_95:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_95), 16, 16)) -> intp(1, 0, 35)
T1_asi_reg_rd_53:
	mov	0x3c5, %r14
	.word 0xf2db8e40  ! 1378: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_wr_69:
	mov	0x3c7, %r14
	.word 0xf0f38400  ! 1381: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb8c5a146  ! 1385: ADDCcc_I	addccc 	%r22, 0x0146, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_wr_70:
	mov	0x2c, %r14
	.word 0xf8f38400  ! 1389: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T1_asi_reg_rd_54:
	mov	0x38, %r14
	.word 0xf2db8400  ! 1390: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_1_118:
	setx	0x2a0005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80c20  ! 1393: FMOVRLZ	dis not found

cpu_intr_1_119:
	setx	0x2a0222, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_55:
	mov	0xd, %r14
	.word 0xf2db8e60  ! 1398: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb9a81420  ! 1399: FMOVRNZ	dis not found

	.word 0xbba548e0  ! 1403: FSUBq	dis not found

	.word 0xb5a00560  ! 1406: FSQRTq	fsqrt	
T1_asi_reg_rd_56:
	mov	0x3c5, %r14
	.word 0xf4db89e0  ! 1410: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb1a00520  ! 1411: FSQRTs	fsqrt	
T1_asi_reg_rd_57:
	mov	0x11, %r14
	.word 0xf8db89e0  ! 1413: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb7a448e0  ! 1420: FSUBq	dis not found

iob_intr_1_96:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_96), 16, 16)) -> intp(1, 0, f)
	.word 0xb435a011  ! 1423: SUBC_I	orn 	%r22, 0x0011, %r26
cpu_intr_1_120:
	setx	0x2b0129, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_97:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_97), 16, 16)) -> intp(1, 0, 1f)
cpu_intr_1_121:
	setx	0x29023b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_98:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_98), 16, 16)) -> intp(1, 0, b)
	.word 0xbda81c20  ! 1437: FMOVRGEZ	dis not found

cpu_intr_1_122:
	setx	0x2b0003, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_99:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_99), 16, 16)) -> intp(1, 0, 34)
T1_asi_reg_rd_58:
	mov	0x3c0, %r14
	.word 0xfadb84a0  ! 1444: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb3a90820  ! 1445: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xbf2c3001  ! 1447: SLLX_I	sllx	%r16, 0x0001, %r31
iob_intr_1_100:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_100), 16, 16)) -> intp(1, 0, 33)
	.word 0xba2420c3  ! 1450: SUB_I	sub 	%r16, 0x00c3, %r29
	.word 0xb5ab0820  ! 1452: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xbda58940  ! 1453: FMULd	fmuld	%f22, %f0, %f30
	.word 0xb8ac6183  ! 1454: ANDNcc_I	andncc 	%r17, 0x0183, %r28
T1_asi_reg_rd_59:
	mov	0x7, %r14
	.word 0xfadb84a0  ! 1456: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a81420  ! 1459: FMOVRNZ	dis not found

T1_asi_reg_rd_60:
	mov	0x1, %r14
	.word 0xfedb84a0  ! 1460: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbba5c9c0  ! 1462: FDIVd	fdivd	%f54, %f0, %f60
	.word 0xbda00540  ! 1463: FSQRTd	fsqrt	
iob_intr_1_101:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_101), 16, 16)) -> intp(1, 0, f)
cpu_intr_1_123:
	setx	0x28000d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_102:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_102), 16, 16)) -> intp(1, 0, 27)
cpu_intr_1_124:
	setx	0x28032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6154000  ! 1469: OR_R	or 	%r21, %r0, %r27
T1_asi_reg_wr_71:
	mov	0x3c7, %r14
	.word 0xfaf38e80  ! 1470: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbba548a0  ! 1474: FSUBs	fsubs	%f21, %f0, %f29
T1_asi_reg_rd_61:
	mov	0x22, %r14
	.word 0xfcdb84a0  ! 1475: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb1a58860  ! 1476: FADDq	dis not found

T1_asi_reg_rd_62:
	mov	0x1b, %r14
	.word 0xfadb84a0  ! 1480: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_1_103:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_103), 16, 16)) -> intp(1, 0, 5)
	.word 0xbda80820  ! 1482: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
cpu_intr_1_125:
	setx	0x2a012e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_126:
	setx	0x280109, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_127:
	setx	0x290333, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_128:
	setx	0x280216, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_63:
	mov	0x3c2, %r14
	.word 0xfadb8e80  ! 1493: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T1_asi_reg_wr_72:
	mov	0x3c6, %r14
	.word 0xf6f38400  ! 1497: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbda5c920  ! 1498: FMULs	fmuls	%f23, %f0, %f30
	.word 0xbba90820  ! 1500: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xbbaa8820  ! 1505: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb1a90820  ! 1509: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xbfa00540  ! 1510: FSQRTd	fsqrt	
	.word 0xb9a00020  ! 1511: FMOVs	fmovs	%f0, %f28
	.word 0xbd3dc000  ! 1513: SRA_R	sra 	%r23, %r0, %r30
	lda	[%r23 + %g0] 0xf0, %f2
	.word 0xbfa408a0  ! 1515: FSUBs	fsubs	%f16, %f0, %f31
	.word 0xbabc6163  ! 1517: XNORcc_I	xnorcc 	%r17, 0x0163, %r29
iob_intr_1_104:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_104), 16, 16)) -> intp(1, 0, 23)
T1_asi_reg_wr_73:
	mov	0x3c1, %r14
	.word 0xf4f38e40  ! 1520: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_129:
	setx	0x280117, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_130:
	setx	0x290136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb82c21c6  ! 1529: ANDN_I	andn 	%r16, 0x01c6, %r28
	.word 0xb9a94820  ! 1530: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xb9a88820  ! 1538: FMOVLE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_131:
	setx	0x290034, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_132:
	setx	0x29003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b40000  ! 1542: ORNcc_R	orncc 	%r16, %r0, %r24
	.word 0xb3a508c0  ! 1544: FSUBd	fsubd	%f20, %f0, %f56
cpu_intr_1_133:
	setx	0x29010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 1551: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xb1a81420  ! 1552: FMOVRNZ	dis not found

T1_asi_reg_wr_74:
	mov	0x26, %r14
	.word 0xfcf384a0  ! 1553: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T1_asi_reg_rd_64:
	mov	0x32, %r14
	.word 0xf8db8400  ! 1557: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_1_105:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_105), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_106:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_106), 16, 16)) -> intp(1, 0, 2)
	.word 0xbda00520  ! 1571: FSQRTs	fsqrt	
	.word 0xbda81820  ! 1573: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xbfa80420  ! 1574: FMOVRZ	dis not found

	.word 0xb7a00540  ! 1575: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_107:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_107), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbba80c20  ! 1581: FMOVRLZ	dis not found

	.word 0xb3a80820  ! 1583: FMOVN	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_65:
	mov	0x1, %r14
	.word 0xfcdb89e0  ! 1585: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb7a54820  ! 1587: FADDs	fadds	%f21, %f0, %f27
	.word 0xb1a98820  ! 1588: FMOVNEG	fmovs	%fcc1, %f0, %f24
cpu_intr_1_134:
	setx	0x2b0112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3d2001  ! 1591: SRA_I	sra 	%r20, 0x0001, %r29
	.word 0xb9a48820  ! 1593: FADDs	fadds	%f18, %f0, %f28
cpu_intr_1_135:
	setx	0x280117, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_75:
	mov	0x1d, %r14
	.word 0xf8f38400  ! 1598: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_1_136:
	setx	0x280215, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_108:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_108), 16, 16)) -> intp(1, 0, 28)
	.word 0xb17d4400  ! 1605: MOVR_R	movre	%r21, %r0, %r24
	.word 0xb73cc000  ! 1606: SRA_R	sra 	%r19, %r0, %r27
	.word 0xbba81c20  ! 1609: FMOVRGEZ	dis not found

T1_asi_reg_rd_66:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 1611: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_109:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_109), 16, 16)) -> intp(1, 0, c)
cpu_intr_1_137:
	setx	0x290204, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_67:
	mov	0x3c8, %r14
	.word 0xf0db8e40  ! 1615: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbba488a0  ! 1617: FSUBs	fsubs	%f18, %f0, %f29
iob_intr_1_110:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_110), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_rd_68:
	mov	0x1e, %r14
	.word 0xf2db84a0  ! 1620: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb1a80820  ! 1622: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
iob_intr_1_111:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_111), 16, 16)) -> intp(1, 0, 31)
	.word 0xb9ab4820  ! 1625: FMOVCC	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_76:
	mov	0x3c4, %r14
	.word 0xfcf38400  ! 1627: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_1_138:
	setx	0x290009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a84820  ! 1631: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xbfabc820  ! 1638: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb7a509e0  ! 1639: FDIVq	dis not found

cpu_intr_1_139:
	setx	0x280117, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_112:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_112), 16, 16)) -> intp(1, 0, 10)
T1_asi_reg_rd_69:
	mov	0x1f, %r14
	.word 0xf2db8e40  ! 1649: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_1_140:
	setx	0x2a0119, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_113:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_113), 16, 16)) -> intp(1, 0, 1d)
T1_asi_reg_rd_70:
	mov	0x23, %r14
	.word 0xfadb89e0  ! 1663: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T1_asi_reg_wr_77:
	mov	0x3c2, %r14
	.word 0xf0f38e60  ! 1668: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	lda	[%r23 + %g0] 0xf0, %f2
	.word 0xb3a98820  ! 1672: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xb5a81c20  ! 1673: FMOVRGEZ	dis not found

	lda	[%r23 + %g0] 0xf0, %f2
	.word 0xb9a98820  ! 1676: FMOVNEG	fmovs	%fcc1, %f0, %f28
cpu_intr_1_141:
	setx	0x28030a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_114:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_114), 16, 16)) -> intp(1, 0, 3b)
cpu_intr_1_142:
	setx	0x280303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a589e0  ! 1683: FDIVq	dis not found

T1_asi_reg_wr_78:
	mov	0x1, %r14
	.word 0xf8f389e0  ! 1684: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb7a00520  ! 1686: FSQRTs	fsqrt	
	.word 0xb6254000  ! 1691: SUB_R	sub 	%r21, %r0, %r27
	.word 0xb9aa8820  ! 1694: FMOVG	fmovs	%fcc1, %f0, %f28
iob_intr_1_115:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_115), 16, 16)) -> intp(1, 0, 18)
cpu_intr_1_143:
	setx	0x290023, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_116:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_116), 16, 16)) -> intp(1, 0, a)
	.word 0xbba98820  ! 1700: FMOVNEG	fmovs	%fcc1, %f0, %f29
iob_intr_1_117:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_117), 16, 16)) -> intp(1, 0, 37)
cpu_intr_1_144:
	setx	0x2b0113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba81820  ! 1709: FMOVRGZ	fmovs	%fcc3, %f0, %f29
cpu_intr_1_145:
	setx	0x2b0333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7357001  ! 1712: SRLX_I	srlx	%r21, 0x0001, %r27
	.word 0xb1ab4820  ! 1714: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb5ab4820  ! 1720: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb97d8400  ! 1722: MOVR_R	movre	%r22, %r0, %r28
cpu_intr_1_146:
	setx	0x2b0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda58940  ! 1728: FMULd	fmuld	%f22, %f0, %f30
	.word 0xb3ab0820  ! 1729: FMOVGU	fmovs	%fcc1, %f0, %f25
iob_intr_1_118:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_118), 16, 16)) -> intp(1, 0, 2e)
iob_intr_1_119:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_119), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb41cc000  ! 1735: XOR_R	xor 	%r19, %r0, %r26
	.word 0x8f902000  ! 1738: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xbda80820  ! 1740: FMOVN	fmovs	%fcc1, %f0, %f30
cpu_intr_1_147:
	setx	0x280239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb29d21e5  ! 1742: XORcc_I	xorcc 	%r20, 0x01e5, %r25
	.word 0xb9a80420  ! 1745: FMOVRZ	dis not found

	.word 0xbba44960  ! 1746: FMULq	dis not found

T1_asi_reg_wr_79:
	mov	0x3c0, %r14
	.word 0xfaf38e80  ! 1750: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbda84820  ! 1752: FMOVE	fmovs	%fcc1, %f0, %f30
cpu_intr_1_148:
	setx	0x2b0103, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_120:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_120), 16, 16)) -> intp(1, 0, 3c)
cpu_intr_1_149:
	setx	0x2b0217, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_121:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_121), 16, 16)) -> intp(1, 0, 15)
	.word 0xb5a9c820  ! 1762: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb150c000  ! 1767: RDPR_TT	<illegal instruction>
iob_intr_1_122:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_122), 16, 16)) -> intp(1, 0, 4)
iob_intr_1_123:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_123), 16, 16)) -> intp(1, 0, 1e)
iob_intr_1_124:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_124), 16, 16)) -> intp(1, 0, 29)
	.word 0xb3510000  ! 1774: RDPR_TICK	<illegal instruction>
iob_intr_1_125:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_125), 16, 16)) -> intp(1, 0, 26)
cpu_intr_1_150:
	setx	0x2b0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda54820  ! 1780: FADDs	fadds	%f21, %f0, %f30
	.word 0xb5a449a0  ! 1782: FDIVs	fdivs	%f17, %f0, %f26
	.word 0xb9a00020  ! 1783: FMOVs	fmovs	%f0, %f28
	.word 0xbdaac820  ! 1785: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xbda58960  ! 1787: FMULq	dis not found

cpu_intr_1_151:
	setx	0x2b0317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_152:
	setx	0x2b0011, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_126:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_126), 16, 16)) -> intp(1, 0, 37)
	.word 0xbbab8820  ! 1795: FMOVPOS	fmovs	%fcc1, %f0, %f29
iob_intr_1_127:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_127), 16, 16)) -> intp(1, 0, 5)
	.word 0xbfa48920  ! 1799: FMULs	fmuls	%f18, %f0, %f31
iob_intr_1_128:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_128), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_wr_80:
	mov	0x11, %r14
	.word 0xf4f38e60  ! 1804: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb5a8c820  ! 1806: FMOVL	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_71:
	mov	0x3c2, %r14
	.word 0xf6db8e80  ! 1808: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb5a84820  ! 1811: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xbfa548e0  ! 1816: FSUBq	dis not found

	.word 0xb7a84820  ! 1817: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb7ab0820  ! 1821: FMOVGU	fmovs	%fcc1, %f0, %f27
cpu_intr_1_153:
	setx	0x2a0106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab4820  ! 1827: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb0452140  ! 1828: ADDC_I	addc 	%r20, 0x0140, %r24
	.word 0xbfa40940  ! 1831: FMULd	fmuld	%f16, %f0, %f62
T1_asi_reg_rd_72:
	mov	0x20, %r14
	.word 0xf6db84a0  ! 1834: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0x8f902000  ! 1835: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
T1_asi_reg_wr_81:
	mov	0xf, %r14
	.word 0xfef389e0  ! 1836: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_rd_73:
	mov	0x22, %r14
	.word 0xfadb8e40  ! 1837: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_1_154:
	setx	0x2f0020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00020  ! 1840: FMOVs	fmovs	%f0, %f27
cpu_intr_1_155:
	setx	0x2d0110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8795205f  ! 1842: WRPR_TT_I	wrpr	%r20, 0x005f, %tt
	.word 0xb7a48940  ! 1843: FMULd	fmuld	%f18, %f0, %f58
	.word 0xb3a00540  ! 1848: FSQRTd	fsqrt	
	.word 0xb034c000  ! 1851: SUBC_R	orn 	%r19, %r0, %r24
cpu_intr_1_156:
	setx	0x2e0109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_129:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_129), 16, 16)) -> intp(1, 0, 22)
T1_asi_reg_rd_74:
	mov	0x3c2, %r14
	.word 0xf8db8e40  ! 1856: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbda40920  ! 1861: FMULs	fmuls	%f16, %f0, %f30
T1_asi_reg_wr_82:
	mov	0x32, %r14
	.word 0xfcf38e60  ! 1862: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_1_157:
	setx	0x2e0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00040  ! 1866: FMOVd	fmovd	%f0, %f28
T1_asi_reg_rd_75:
	mov	0xd, %r14
	.word 0xfadb8400  ! 1867: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb41cc000  ! 1871: XOR_R	xor 	%r19, %r0, %r26
	.word 0xbfaac820  ! 1873: FMOVGE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_83:
	mov	0x1, %r14
	.word 0xfaf38e40  ! 1874: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbda00540  ! 1876: FSQRTd	fsqrt	
	.word 0xbe44e174  ! 1877: ADDC_I	addc 	%r19, 0x0174, %r31
T1_asi_reg_rd_76:
	mov	0x1f, %r14
	.word 0xf0db84a0  ! 1878: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbfa00020  ! 1879: FMOVs	fmovs	%f0, %f31
	.word 0xbc840000  ! 1880: ADDcc_R	addcc 	%r16, %r0, %r30
	.word 0xbba40840  ! 1887: FADDd	faddd	%f16, %f0, %f60
	.word 0xb5a8c820  ! 1888: FMOVL	fmovs	%fcc1, %f0, %f26
iob_intr_1_130:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_130), 16, 16)) -> intp(1, 0, 33)
	.word 0xbda48840  ! 1893: FADDd	faddd	%f18, %f0, %f30
	.word 0xbfa90820  ! 1894: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb5aa4820  ! 1895: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb4c5a1a5  ! 1896: ADDCcc_I	addccc 	%r22, 0x01a5, %r26
iob_intr_1_131:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_131), 16, 16)) -> intp(1, 0, 28)
iob_intr_1_132:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_132), 16, 16)) -> intp(1, 0, 30)
	.word 0xb6144000  ! 1902: OR_R	or 	%r17, %r0, %r27
	.word 0xbfaac820  ! 1904: FMOVGE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_158:
	setx	0x2f022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00020  ! 1906: FMOVs	fmovs	%f0, %f30
	.word 0xbba00020  ! 1912: FMOVs	fmovs	%f0, %f29
iob_intr_1_133:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_133), 16, 16)) -> intp(1, 0, 22)
	.word 0xbfa80820  ! 1915: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xbba00560  ! 1916: FSQRTq	fsqrt	
T1_asi_reg_wr_84:
	mov	0x28, %r14
	.word 0xf0f38e60  ! 1917: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb5a98820  ! 1920: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb5a80820  ! 1921: FMOVN	fmovs	%fcc1, %f0, %f26
cpu_intr_1_159:
	setx	0x2f0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00040  ! 1925: FMOVd	fmovd	%f0, %f30
	.word 0xb1a84820  ! 1928: FMOVE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_85:
	mov	0x17, %r14
	.word 0xf2f389e0  ! 1929: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbda4c940  ! 1931: FMULd	fmuld	%f50, %f0, %f30
iob_intr_1_134:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_134), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_rd_77:
	mov	0x38, %r14
	.word 0xfedb8400  ! 1933: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T1_asi_reg_wr_86:
	mov	0x9, %r14
	.word 0xf8f38e40  ! 1934: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_160:
	setx	0x2f000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd7cc400  ! 1939: MOVR_R	movre	%r19, %r0, %r30
T1_asi_reg_rd_78:
	mov	0xa, %r14
	.word 0xfadb8400  ! 1941: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbfa408c0  ! 1943: FSUBd	fsubd	%f16, %f0, %f62
	.word 0xbda9c820  ! 1944: FMOVVS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_79:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 1947: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_80:
	mov	0x14, %r14
	.word 0xfedb89e0  ! 1950: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_1_135:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_135), 16, 16)) -> intp(1, 0, 3f)
iob_intr_1_136:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_136), 16, 16)) -> intp(1, 0, d)
	.word 0xb1a00040  ! 1957: FMOVd	fmovd	%f0, %f24
cpu_intr_1_161:
	setx	0x2c0230, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_137:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_137), 16, 16)) -> intp(1, 0, 14)
	.word 0xb1540000  ! 1961: RDPR_GL	<illegal instruction>
	.word 0xb29d8000  ! 1963: XORcc_R	xorcc 	%r22, %r0, %r25
iob_intr_1_138:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_138), 16, 16)) -> intp(1, 0, 39)
iob_intr_1_139:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_139), 16, 16)) -> intp(1, 0, 28)
iob_intr_1_140:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_140), 16, 16)) -> intp(1, 0, 33)
iob_intr_1_141:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_141), 16, 16)) -> intp(1, 0, 31)
T1_asi_reg_rd_81:
	mov	0x29, %r14
	.word 0xf0db8e40  ! 1969: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_wr_87:
	mov	0x3c0, %r14
	.word 0xf2f384a0  ! 1970: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_1_142:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_142), 16, 16)) -> intp(1, 0, 4)
	.word 0xb9ab0820  ! 1974: FMOVGU	fmovs	%fcc1, %f0, %f28
cpu_intr_1_162:
	setx	0x2e0010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6940000  ! 1981: ORcc_R	orcc 	%r16, %r0, %r27
iob_intr_1_143:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_143), 16, 16)) -> intp(1, 0, 34)
iob_intr_1_144:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_144), 16, 16)) -> intp(1, 0, 1b)
iob_intr_1_145:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_145), 16, 16)) -> intp(1, 0, 31)
iob_intr_1_146:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_146), 16, 16)) -> intp(1, 0, 16)
	.word 0xbfa5c920  ! 1995: FMULs	fmuls	%f23, %f0, %f31
iob_intr_1_147:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_147), 16, 16)) -> intp(1, 0, 37)
	.word 0xbbaa4820  ! 2001: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xbcc5a1bc  ! 2002: ADDCcc_I	addccc 	%r22, 0x01bc, %r30
	.word 0xb5a98820  ! 2003: FMOVNEG	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_88:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 2008: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_wr_89:
	mov	0x3c7, %r14
	.word 0xfef38400  ! 2010: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T1_asi_reg_wr_90:
	mov	0x13, %r14
	.word 0xfef384a0  ! 2011: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_1_163:
	setx	0x2f030d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_82:
	mov	0x2, %r14
	.word 0xfedb84a0  ! 2017: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbf7c6401  ! 2021: MOVR_I	movre	%r17, 0x1, %r31
cpu_intr_1_164:
	setx	0x2d0017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbabc8000  ! 2025: XNORcc_R	xnorcc 	%r18, %r0, %r29
cpu_intr_1_165:
	setx	0x2e033c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_91:
	mov	0x2c, %r14
	.word 0xf0f38e80  ! 2027: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T1_asi_reg_wr_92:
	mov	0x9, %r14
	.word 0xf2f389e0  ! 2028: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T1_asi_reg_rd_83:
	mov	0x3c4, %r14
	.word 0xfedb8e80  ! 2029: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_1_148:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_148), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbba00540  ! 2032: FSQRTd	fsqrt	
	.word 0xb7a00560  ! 2033: FSQRTq	fsqrt	
T1_asi_reg_rd_84:
	mov	0x24, %r14
	.word 0xf4db8400  ! 2036: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_1_166:
	setx	0x2e0204, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_85:
	mov	0x3c0, %r14
	.word 0xf2db84a0  ! 2043: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T1_asi_reg_rd_86:
	mov	0x30, %r14
	.word 0xf6db8400  ! 2045: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbda81420  ! 2046: FMOVRNZ	dis not found

iob_intr_1_149:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_149), 16, 16)) -> intp(1, 0, 7)
T1_asi_reg_rd_87:
	mov	0x3c8, %r14
	.word 0xfedb84a0  ! 2049: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T1_asi_reg_rd_88:
	mov	0x2f, %r14
	.word 0xf2db8e40  ! 2051: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_1_167:
	setx	0x2e0215, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_150:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_150), 16, 16)) -> intp(1, 0, 4)
	.word 0xb3a81820  ! 2057: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb9ab0820  ! 2060: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xbc34c000  ! 2064: SUBC_R	orn 	%r19, %r0, %r30
	.word 0xbfaac820  ! 2068: FMOVGE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_168:
	setx	0x2f0111, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_169:
	setx	0x2f0130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb804e193  ! 2078: ADD_I	add 	%r19, 0x0193, %r28
T1_asi_reg_rd_89:
	mov	0x4, %r14
	.word 0xf4db8e40  ! 2082: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_1_170:
	setx	0x2e0009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba408e0  ! 2085: FSUBq	dis not found

	.word 0xb1aa4820  ! 2086: FMOVNE	fmovs	%fcc1, %f0, %f24
cpu_intr_1_171:
	setx	0x2c003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a98820  ! 2088: FMOVNEG	fmovs	%fcc1, %f0, %f25
cpu_intr_1_172:
	setx	0x2e013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_90:
	mov	0x29, %r14
	.word 0xf6db8e80  ! 2091: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T1_asi_reg_rd_91:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 2092: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb7a50960  ! 2095: FMULq	dis not found

	.word 0xbb51c000  ! 2097: RDPR_TL	<illegal instruction>
	.word 0xb5a44960  ! 2101: FMULq	dis not found

	.word 0xb9a00560  ! 2104: FSQRTq	fsqrt	
	.word 0xbdaa0820  ! 2105: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb48de017  ! 2107: ANDcc_I	andcc 	%r23, 0x0017, %r26
	.word 0xb7a58940  ! 2108: FMULd	fmuld	%f22, %f0, %f58
iob_intr_1_151:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_151), 16, 16)) -> intp(1, 0, 32)
	.word 0xb7a80820  ! 2113: FMOVN	fmovs	%fcc1, %f0, %f27
iob_intr_1_152:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_152), 16, 16)) -> intp(1, 0, 5)
T1_asi_reg_rd_92:
	mov	0x6, %r14
	.word 0xf2db89e0  ! 2116: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_1_173:
	setx	0x2d021e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_93:
	mov	0x24, %r14
	.word 0xfef389e0  ! 2118: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_1_153:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_153), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_174:
	setx	0x2f022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7ab8820  ! 2123: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xbda48840  ! 2125: FADDd	faddd	%f18, %f0, %f30
iob_intr_1_154:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_154), 16, 16)) -> intp(1, 0, 29)
	.word 0xbda8c820  ! 2127: FMOVL	fmovs	%fcc1, %f0, %f30
iob_intr_1_155:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_155), 16, 16)) -> intp(1, 0, 27)
T1_asi_reg_rd_93:
	mov	0x11, %r14
	.word 0xfcdb8e40  ! 2130: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_156:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_156), 16, 16)) -> intp(1, 0, 24)
	.word 0xb3a40860  ! 2138: FADDq	dis not found

cpu_intr_1_175:
	setx	0x2c0232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa90820  ! 2141: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xbda00040  ! 2142: FMOVd	fmovd	%f0, %f30
	.word 0xb9a5c820  ! 2144: FADDs	fadds	%f23, %f0, %f28
cpu_intr_1_176:
	setx	0x2f031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa5c920  ! 2147: FMULs	fmuls	%f23, %f0, %f31
	.word 0xb52ca001  ! 2149: SLL_I	sll 	%r18, 0x0001, %r26
	.word 0xb5abc820  ! 2151: FMOVVC	fmovs	%fcc1, %f0, %f26
cpu_intr_1_177:
	setx	0x2c0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5340000  ! 2155: SRL_R	srl 	%r16, %r0, %r26
	.word 0xbdaa8820  ! 2157: FMOVG	fmovs	%fcc1, %f0, %f30
iob_intr_1_157:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_157), 16, 16)) -> intp(1, 0, 9)
	.word 0xbfa90820  ! 2162: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xbf7ce401  ! 2164: MOVR_I	movre	%r19, 0x1, %r31
	.word 0xbfab4820  ! 2167: FMOVCC	fmovs	%fcc1, %f0, %f31
iob_intr_1_158:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_158), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbf350000  ! 2178: SRL_R	srl 	%r20, %r0, %r31
cpu_intr_1_178:
	setx	0x2e0235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a81820  ! 2187: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb3a80420  ! 2191: FMOVRZ	dis not found

	.word 0xbba81820  ! 2192: FMOVRGZ	fmovs	%fcc3, %f0, %f29
cpu_intr_1_179:
	setx	0x2f001b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_159:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_159), 16, 16)) -> intp(1, 0, 29)
cpu_intr_1_180:
	setx	0x2d001c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_181:
	setx	0x2c012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda84820  ! 2203: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xb9a5c860  ! 2205: FADDq	dis not found

	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xb3a54940  ! 2208: FMULd	fmuld	%f52, %f0, %f56
T1_asi_reg_rd_94:
	mov	0x21, %r14
	.word 0xf0db84a0  ! 2209: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb134c000  ! 2210: SRL_R	srl 	%r19, %r0, %r24
T1_asi_reg_wr_94:
	mov	0x19, %r14
	.word 0xf4f38e40  ! 2212: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb5a80c20  ! 2213: FMOVRLZ	dis not found

	.word 0xb9a84820  ! 2214: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb1a00520  ! 2216: FSQRTs	fsqrt	
cpu_intr_1_182:
	setx	0x2c0301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab8820  ! 2218: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xbfa84820  ! 2220: FMOVE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_183:
	setx	0x2f0224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaac820  ! 2224: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xba44217b  ! 2225: ADDC_I	addc 	%r16, 0x017b, %r29
cpu_intr_1_184:
	setx	0x2d0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00560  ! 2229: FSQRTq	fsqrt	
T1_asi_reg_wr_95:
	mov	0x10, %r14
	.word 0xfcf38e40  ! 2232: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb5a80820  ! 2237: FMOVN	fmovs	%fcc1, %f0, %f26
cpu_intr_1_185:
	setx	0x2e0122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb88cc000  ! 2240: ANDcc_R	andcc 	%r19, %r0, %r28
	.word 0xb13d6001  ! 2241: SRA_I	sra 	%r21, 0x0001, %r24
iob_intr_1_160:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_160), 16, 16)) -> intp(1, 0, 21)
	.word 0xbba90820  ! 2248: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xbd3cb001  ! 2249: SRAX_I	srax	%r18, 0x0001, %r30
iob_intr_1_161:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_161), 16, 16)) -> intp(1, 0, 2d)
	lda	[%r18 + %g0] 0xf0, %f2
T1_asi_reg_wr_96:
	mov	0x33, %r14
	.word 0xf6f38e80  ! 2258: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb5a98820  ! 2259: FMOVNEG	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_95:
	mov	0x3c4, %r14
	.word 0xfadb8400  ! 2260: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb1aa4820  ! 2261: FMOVNE	fmovs	%fcc1, %f0, %f24
iob_intr_1_162:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_162), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_rd_96:
	mov	0x3c6, %r14
	.word 0xfadb8e80  ! 2264: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xbba81c20  ! 2265: FMOVRGEZ	dis not found

cpu_intr_1_186:
	setx	0x2d0236, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_97:
	mov	0xe, %r14
	.word 0xf8f38e40  ! 2271: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_1_163:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_163), 16, 16)) -> intp(1, 0, 18)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a00520  ! 2278: FSQRTs	fsqrt	
cpu_intr_1_187:
	setx	0x2c011d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_164:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_164), 16, 16)) -> intp(1, 0, 1c)
cpu_intr_1_188:
	setx	0x2e001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_97:
	mov	0x22, %r14
	.word 0xfcdb84a0  ! 2285: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_1_165:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_165), 16, 16)) -> intp(1, 0, 2c)
cpu_intr_1_189:
	setx	0x2f0025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4bce1b0  ! 2289: XNORcc_I	xnorcc 	%r19, 0x01b0, %r26
	.word 0xb3a44940  ! 2290: FMULd	fmuld	%f48, %f0, %f56
	.word 0xb3a9c820  ! 2291: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb60ce0fb  ! 2297: AND_I	and 	%r19, 0x00fb, %r27
cpu_intr_1_190:
	setx	0x310219, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_191:
	setx	0x310127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6440000  ! 2306: ADDC_R	addc 	%r16, %r0, %r27
	.word 0xbda00540  ! 2308: FSQRTd	fsqrt	
iob_intr_1_166:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_166), 16, 16)) -> intp(1, 0, 17)
cpu_intr_1_192:
	setx	0x330108, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r18 + %g0] 0xf0, %f2
cpu_intr_1_193:
	setx	0x300107, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7a4c8c0  ! 2319: FSUBd	fsubd	%f50, %f0, %f58
T1_asi_reg_wr_98:
	mov	0x33, %r14
	.word 0xf0f384a0  ! 2320: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbdaa0820  ! 2321: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xbfa508a0  ! 2322: FSUBs	fsubs	%f20, %f0, %f31
iob_intr_1_167:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_167), 16, 16)) -> intp(1, 0, 16)
iob_intr_1_168:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_168), 16, 16)) -> intp(1, 0, 32)
cpu_intr_1_194:
	setx	0x330327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00040  ! 2326: FMOVd	fmovd	%f0, %f62
	.word 0xb7a409c0  ! 2327: FDIVd	fdivd	%f16, %f0, %f58
	.word 0xb72d5000  ! 2328: SLLX_R	sllx	%r21, %r0, %r27
	.word 0xbba94820  ! 2330: FMOVCS	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_99:
	mov	0x29, %r14
	.word 0xf6f38e40  ! 2332: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb3520000  ! 2333: RDPR_PIL	<illegal instruction>
	.word 0xb3520000  ! 2334: RDPR_PIL	<illegal instruction>
T1_asi_reg_rd_98:
	mov	0x26, %r14
	.word 0xf0db8e80  ! 2338: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0x89942084  ! 2340: WRPR_TICK_I	wrpr	%r16, 0x0084, %tick
iob_intr_1_169:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_169), 16, 16)) -> intp(1, 0, 30)
T1_asi_reg_wr_100:
	mov	0x3c0, %r14
	.word 0xfef38e40  ! 2347: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_1_195:
	setx	0x310205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb88c61e9  ! 2351: ANDcc_I	andcc 	%r17, 0x01e9, %r28
	.word 0xb3a50820  ! 2352: FADDs	fadds	%f20, %f0, %f25
	.word 0xbbaa4820  ! 2353: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xbeb52053  ! 2354: SUBCcc_I	orncc 	%r20, 0x0053, %r31
	.word 0xb9504000  ! 2356: RDPR_TNPC	<illegal instruction>
	.word 0xb1a4c860  ! 2359: FADDq	dis not found

	.word 0xb6b5c000  ! 2361: SUBCcc_R	orncc 	%r23, %r0, %r27
	.word 0xb5a80c20  ! 2363: FMOVRLZ	dis not found

iob_intr_1_170:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_170), 16, 16)) -> intp(1, 0, 1c)
	.word 0xbbaac820  ! 2371: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xbba9c820  ! 2373: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb1a588a0  ! 2376: FSUBs	fsubs	%f22, %f0, %f24
cpu_intr_1_196:
	setx	0x330235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda588a0  ! 2379: FSUBs	fsubs	%f22, %f0, %f30
	.word 0xbda589a0  ! 2380: FDIVs	fdivs	%f22, %f0, %f30
	.word 0xbb7ce401  ! 2381: MOVR_I	movre	%r19, 0x1, %r29
	.word 0xb97d8400  ! 2382: MOVR_R	movre	%r22, %r0, %r28
T1_asi_reg_rd_99:
	mov	0x3c6, %r14
	.word 0xfcdb8e40  ! 2384: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_197:
	setx	0x330139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a449e0  ! 2388: FDIVq	dis not found

	.word 0xbc84e04a  ! 2389: ADDcc_I	addcc 	%r19, 0x004a, %r30
	.word 0xb7a88820  ! 2394: FMOVLE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_101:
	mov	0x35, %r14
	.word 0xf0f38e40  ! 2396: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbd2da001  ! 2397: SLL_I	sll 	%r22, 0x0001, %r30
cpu_intr_1_198:
	setx	0x310128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a50820  ! 2400: FADDs	fadds	%f20, %f0, %f26
iob_intr_1_171:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_171), 16, 16)) -> intp(1, 0, 2d)
cpu_intr_1_199:
	setx	0x320025, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_200:
	setx	0x33010e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_102:
	mov	0x4, %r14
	.word 0xfef384a0  ! 2417: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_1_201:
	setx	0x320014, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_202:
	setx	0x310135, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xb3a4c9c0  ! 2425: FDIVd	fdivd	%f50, %f0, %f56
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_203:
	setx	0x320303, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_103:
	mov	0x2, %r14
	.word 0xf4f384a0  ! 2434: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_1_172:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_172), 16, 16)) -> intp(1, 0, 7)
T1_asi_reg_wr_104:
	mov	0x3c5, %r14
	.word 0xf8f384a0  ! 2437: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T1_asi_reg_wr_105:
	mov	0x3c8, %r14
	.word 0xf2f38e80  ! 2439: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb5641800  ! 2441: MOVcc_R	<illegal instruction>
iob_intr_1_173:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_173), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbda81c20  ! 2444: FMOVRGEZ	dis not found

	.word 0xbba549c0  ! 2445: FDIVd	fdivd	%f52, %f0, %f60
T1_asi_reg_wr_106:
	mov	0x2d, %r14
	.word 0xfcf38e80  ! 2449: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb3a4c8c0  ! 2453: FSUBd	fsubd	%f50, %f0, %f56
cpu_intr_1_204:
	setx	0x310131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a88820  ! 2456: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xbfa80c20  ! 2457: FMOVRLZ	dis not found

	.word 0xbba50840  ! 2459: FADDd	faddd	%f20, %f0, %f60
T1_asi_reg_rd_100:
	mov	0x3c3, %r14
	.word 0xf4db8e80  ! 2462: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbba4c860  ! 2470: FADDq	dis not found

iob_intr_1_174:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_174), 16, 16)) -> intp(1, 0, 31)
T1_asi_reg_rd_101:
	mov	0x3c0, %r14
	.word 0xf4db8e40  ! 2474: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_1_205:
	setx	0x320102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_206:
	setx	0x30032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4c5c000  ! 2478: ADDCcc_R	addccc 	%r23, %r0, %r26
	.word 0xb5a9c820  ! 2479: FMOVVS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_107:
	mov	0x3c0, %r14
	.word 0xf4f38e40  ! 2482: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb22cc000  ! 2484: ANDN_R	andn 	%r19, %r0, %r25
T1_asi_reg_rd_102:
	mov	0x3c2, %r14
	.word 0xf0db8400  ! 2485: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_wr_108:
	mov	0x1, %r14
	.word 0xfaf384a0  ! 2486: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T1_asi_reg_rd_103:
	mov	0x24, %r14
	.word 0xf4db8400  ! 2487: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xbe9c0000  ! 2488: XORcc_R	xorcc 	%r16, %r0, %r31
T1_asi_reg_rd_104:
	mov	0x26, %r14
	.word 0xf4db8e40  ! 2491: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_1_207:
	setx	0x32020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x919520ea  ! 2494: WRPR_PIL_I	wrpr	%r20, 0x00ea, %pil
cpu_intr_1_208:
	setx	0x330122, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_105:
	mov	0x1c, %r14
	.word 0xfcdb8e80  ! 2498: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb734b001  ! 2499: SRLX_I	srlx	%r18, 0x0001, %r27
	.word 0xbfa8c820  ! 2502: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb7a00560  ! 2505: FSQRTq	fsqrt	
T1_asi_reg_rd_106:
	mov	0x1d, %r14
	.word 0xf0db8e40  ! 2507: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_wr_109:
	mov	0xd, %r14
	.word 0xf2f38e40  ! 2509: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_wr_110:
	mov	0x2e, %r14
	.word 0xfef384a0  ! 2510: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T1_asi_reg_rd_107:
	mov	0x3c3, %r14
	.word 0xfadb84a0  ! 2511: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T1_asi_reg_wr_111:
	mov	0x3c8, %r14
	.word 0xf2f38e80  ! 2512: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T1_asi_reg_rd_108:
	mov	0x3c0, %r14
	.word 0xf4db8e80  ! 2513: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb8b4e1a5  ! 2515: SUBCcc_I	orncc 	%r19, 0x01a5, %r28
T1_asi_reg_wr_112:
	mov	0x20, %r14
	.word 0xf6f384a0  ! 2517: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_1_175:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_175), 16, 16)) -> intp(1, 0, 3d)
iob_intr_1_176:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_176), 16, 16)) -> intp(1, 0, 2e)
cpu_intr_1_209:
	setx	0x32013b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_177:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_177), 16, 16)) -> intp(1, 0, 26)
	.word 0xbda549c0  ! 2528: FDIVd	fdivd	%f52, %f0, %f30
cpu_intr_1_210:
	setx	0x330138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00520  ! 2538: FSQRTs	fsqrt	
T1_asi_reg_rd_109:
	mov	0x1b, %r14
	.word 0xfadb84a0  ! 2539: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb5a4c9c0  ! 2540: FDIVd	fdivd	%f50, %f0, %f26
cpu_intr_1_211:
	setx	0x320013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba9c820  ! 2544: FMOVVS	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_113:
	mov	0x9, %r14
	.word 0xfef389e0  ! 2545: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbfa80820  ! 2548: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb5ab8820  ! 2549: FMOVPOS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_114:
	mov	0x5, %r14
	.word 0xf6f38e40  ! 2551: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_rd_110:
	mov	0x3c5, %r14
	.word 0xf4db8e40  ! 2553: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_wr_115:
	mov	0x3c3, %r14
	.word 0xf0f38e40  ! 2554: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_1_212:
	setx	0x31020a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_178:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_178), 16, 16)) -> intp(1, 0, 8)
iob_intr_1_179:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_179), 16, 16)) -> intp(1, 0, 34)
T1_asi_reg_wr_116:
	mov	0x34, %r14
	.word 0xf4f38e40  ! 2564: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbba00560  ! 2565: FSQRTq	fsqrt	
cpu_intr_1_213:
	setx	0x30031c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_117:
	mov	0x20, %r14
	.word 0xfef38e80  ! 2569: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_1_214:
	setx	0x300024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_215:
	setx	0x32022f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_111:
	mov	0x3c5, %r14
	.word 0xf2db8400  ! 2573: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_1_216:
	setx	0x31010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_118:
	mov	0x3c3, %r14
	.word 0xf6f38e40  ! 2579: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb1a589c0  ! 2582: FDIVd	fdivd	%f22, %f0, %f24
	.word 0xb9a5c8a0  ! 2585: FSUBs	fsubs	%f23, %f0, %f28
T1_asi_reg_wr_119:
	mov	0x3c5, %r14
	.word 0xf4f384a0  ! 2586: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb3a44840  ! 2587: FADDd	faddd	%f48, %f0, %f56
	.word 0xbfa00020  ! 2588: FMOVs	fmovs	%f0, %f31
	.word 0xbda00020  ! 2589: FMOVs	fmovs	%f0, %f30
	.word 0xbebca0a0  ! 2590: XNORcc_I	xnorcc 	%r18, 0x00a0, %r31
	.word 0xbda80420  ! 2594: FMOVRZ	dis not found

cpu_intr_1_217:
	setx	0x320227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda58840  ! 2603: FADDd	faddd	%f22, %f0, %f30
	.word 0xb2b561c2  ! 2607: SUBCcc_I	orncc 	%r21, 0x01c2, %r25
cpu_intr_1_218:
	setx	0x30020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00540  ! 2610: FSQRTd	fsqrt	
	.word 0xbbab4820  ! 2611: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xbd34d000  ! 2614: SRLX_R	srlx	%r19, %r0, %r30
iob_intr_1_180:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_180), 16, 16)) -> intp(1, 0, d)
	.word 0xbfa81420  ! 2616: FMOVRNZ	dis not found

	.word 0xb1a80820  ! 2617: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb1a48920  ! 2618: FMULs	fmuls	%f18, %f0, %f24
T1_asi_reg_wr_120:
	mov	0x2c, %r14
	.word 0xf2f38400  ! 2622: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbf7ca401  ! 2624: MOVR_I	movre	%r18, 0x1, %r31
T1_asi_reg_rd_112:
	mov	0xc, %r14
	.word 0xfcdb8e60  ! 2626: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb3a509c0  ! 2629: FDIVd	fdivd	%f20, %f0, %f56
T1_asi_reg_wr_121:
	mov	0x2d, %r14
	.word 0xf4f38400  ! 2631: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xb1a8c820  ! 2635: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xb7aa4820  ! 2637: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb1ab0820  ! 2641: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb9aa4820  ! 2642: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb3a44960  ! 2644: FMULq	dis not found

T1_asi_reg_rd_113:
	mov	0x3c2, %r14
	.word 0xfadb8e40  ! 2645: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbda44960  ! 2647: FMULq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_219:
	setx	0x330314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb20de09a  ! 2655: AND_I	and 	%r23, 0x009a, %r25
	.word 0xb73c5000  ! 2656: SRAX_R	srax	%r17, %r0, %r27
iob_intr_1_181:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_181), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb9a8c820  ! 2658: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xba8521bc  ! 2659: ADDcc_I	addcc 	%r20, 0x01bc, %r29
cpu_intr_1_220:
	setx	0x31003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbdaa8820  ! 2667: FMOVG	fmovs	%fcc1, %f0, %f30
iob_intr_1_182:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_182), 16, 16)) -> intp(1, 0, 2a)
iob_intr_1_183:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_183), 16, 16)) -> intp(1, 0, 4)
	.word 0xbcb4c000  ! 2673: SUBCcc_R	orncc 	%r19, %r0, %r30
	.word 0xbda81c20  ! 2674: FMOVRGEZ	dis not found

iob_intr_1_184:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_184), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_wr_122:
	mov	0x22, %r14
	.word 0xf0f38e40  ! 2680: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_wr_123:
	mov	0x3c6, %r14
	.word 0xf4f38e80  ! 2681: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbda80820  ! 2682: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb5a408a0  ! 2683: FSUBs	fsubs	%f16, %f0, %f26
	.word 0xbd2d8000  ! 2686: SLL_R	sll 	%r22, %r0, %r30
	.word 0xbfa9c820  ! 2687: FMOVVS	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_124:
	mov	0x4, %r14
	.word 0xf0f384a0  ! 2690: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T1_asi_reg_rd_114:
	mov	0x3c3, %r14
	.word 0xf6db8e40  ! 2697: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb48c0000  ! 2699: ANDcc_R	andcc 	%r16, %r0, %r26
T1_asi_reg_wr_125:
	mov	0xc, %r14
	.word 0xf6f38400  ! 2701: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	lda	[%r16 + %g0] 0xf0, %f2
iob_intr_1_185:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_185), 16, 16)) -> intp(1, 0, 37)
	.word 0xb8a4e09f  ! 2709: SUBcc_I	subcc 	%r19, 0x009f, %r28
iob_intr_1_186:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_186), 16, 16)) -> intp(1, 0, 18)
iob_intr_1_187:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_187), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_188:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_188), 16, 16)) -> intp(1, 0, 34)
	.word 0xbda00560  ! 2718: FSQRTq	fsqrt	
	.word 0xbec52132  ! 2720: ADDCcc_I	addccc 	%r20, 0x0132, %r31
iob_intr_1_189:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_189), 16, 16)) -> intp(1, 0, 27)
	.word 0xbdaa0820  ! 2726: FMOVA	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_115:
	mov	0x3c4, %r14
	.word 0xfcdb84a0  ! 2727: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbb2db001  ! 2732: SLLX_I	sllx	%r22, 0x0001, %r29
	.word 0xb7a00520  ! 2733: FSQRTs	fsqrt	
	.word 0xbbabc820  ! 2736: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xbfa44840  ! 2737: FADDd	faddd	%f48, %f0, %f62
cpu_intr_1_221:
	setx	0x34012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1ab8820  ! 2740: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb3a00560  ! 2742: FSQRTq	fsqrt	
	.word 0xb9a81c20  ! 2743: FMOVRGEZ	dis not found

T1_asi_reg_rd_116:
	mov	0x36, %r14
	.word 0xf4db84a0  ! 2751: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb0b50000  ! 2752: SUBCcc_R	orncc 	%r20, %r0, %r24
	.word 0xb5a58840  ! 2753: FADDd	faddd	%f22, %f0, %f26
	.word 0xb1a40840  ! 2754: FADDd	faddd	%f16, %f0, %f24
T1_asi_reg_rd_117:
	mov	0x38, %r14
	.word 0xf6db8e80  ! 2756: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_1_222:
	setx	0x34021c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_190:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_190), 16, 16)) -> intp(1, 0, 18)
	.word 0xb9aa8820  ! 2761: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xb1a00020  ! 2762: FMOVs	fmovs	%f0, %f24
	.word 0xb1ab8820  ! 2763: FMOVPOS	fmovs	%fcc1, %f0, %f24
iob_intr_1_191:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_191), 16, 16)) -> intp(1, 0, 2a)
	.word 0xba1d4000  ! 2769: XOR_R	xor 	%r21, %r0, %r29
	.word 0xbda80820  ! 2770: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xbfa48920  ! 2771: FMULs	fmuls	%f18, %f0, %f31
iob_intr_1_192:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_192), 16, 16)) -> intp(1, 0, 37)
T1_asi_reg_rd_118:
	mov	0x3c6, %r14
	.word 0xfcdb8e40  ! 2773: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_223:
	setx	0x37021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcc5e070  ! 2775: ADDCcc_I	addccc 	%r23, 0x0070, %r30
iob_intr_1_193:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_193), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb1a00020  ! 2780: FMOVs	fmovs	%f0, %f24
	.word 0xbba54920  ! 2781: FMULs	fmuls	%f21, %f0, %f29
	.word 0xb7a449a0  ! 2782: FDIVs	fdivs	%f17, %f0, %f27
T1_asi_reg_rd_119:
	mov	0x6, %r14
	.word 0xfadb84a0  ! 2783: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb7a81420  ! 2786: FMOVRNZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_194:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_194), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_wr_126:
	mov	0x12, %r14
	.word 0xf0f389e0  ! 2794: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb5a44840  ! 2796: FADDd	faddd	%f48, %f0, %f26
iob_intr_1_195:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_195), 16, 16)) -> intp(1, 0, 0)
	.word 0xb9a80820  ! 2806: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
iob_intr_1_196:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_196), 16, 16)) -> intp(1, 0, 15)
	.word 0xbda98820  ! 2809: FMOVNEG	fmovs	%fcc1, %f0, %f30
cpu_intr_1_224:
	setx	0x36010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_120:
	mov	0x2, %r14
	.word 0xf6db84a0  ! 2816: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_1_197:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_197), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb1a4c860  ! 2822: FADDq	dis not found

cpu_intr_1_225:
	setx	0x370011, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_127:
	mov	0x2e, %r14
	.word 0xf2f38e40  ! 2826: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_rd_121:
	mov	0x24, %r14
	.word 0xfadb8e60  ! 2827: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_1_226:
	setx	0x35033a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_198:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_198), 16, 16)) -> intp(1, 0, 27)
iob_intr_1_199:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_199), 16, 16)) -> intp(1, 0, 21)
cpu_intr_1_227:
	setx	0x370230, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_200:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_200), 16, 16)) -> intp(1, 0, 5)
	.word 0xb7aa8820  ! 2836: FMOVG	fmovs	%fcc1, %f0, %f27
iob_intr_1_201:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_201), 16, 16)) -> intp(1, 0, 3a)
T1_asi_reg_rd_122:
	mov	0x19, %r14
	.word 0xf8db8e60  ! 2838: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_1_228:
	setx	0x350309, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_229:
	setx	0x340103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a54940  ! 2842: FMULd	fmuld	%f52, %f0, %f58
	.word 0xbba408c0  ! 2843: FSUBd	fsubd	%f16, %f0, %f60
	.word 0xb2b48000  ! 2847: SUBCcc_R	orncc 	%r18, %r0, %r25
	.word 0xb17c0400  ! 2849: MOVR_R	movre	%r16, %r0, %r24
T1_asi_reg_wr_128:
	mov	0x25, %r14
	.word 0xf4f38e40  ! 2850: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_202:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_202), 16, 16)) -> intp(1, 0, 26)
	.word 0xb7a94820  ! 2853: FMOVCS	fmovs	%fcc1, %f0, %f27
iob_intr_1_203:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_203), 16, 16)) -> intp(1, 0, 5)
	.word 0xb92d0000  ! 2855: SLL_R	sll 	%r20, %r0, %r28
	.word 0x87946109  ! 2856: WRPR_TT_I	wrpr	%r17, 0x0109, %tt
	.word 0xbba448c0  ! 2857: FSUBd	fsubd	%f48, %f0, %f60
	.word 0xbfa4c940  ! 2858: FMULd	fmuld	%f50, %f0, %f62
cpu_intr_1_230:
	setx	0x370112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba4c8c0  ! 2862: FSUBd	fsubd	%f50, %f0, %f60
	.word 0xb9a8c820  ! 2865: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xbda4c9e0  ! 2866: FDIVq	dis not found

	.word 0xb3a549a0  ! 2873: FDIVs	fdivs	%f21, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_204:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_204), 16, 16)) -> intp(1, 0, 0)
T1_asi_reg_wr_129:
	mov	0x3c7, %r14
	.word 0xf8f38e60  ! 2878: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb9ab0820  ! 2882: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xbda588c0  ! 2883: FSUBd	fsubd	%f22, %f0, %f30
cpu_intr_1_231:
	setx	0x37010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda8c820  ! 2886: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xbda80c20  ! 2888: FMOVRLZ	dis not found

	.word 0xbfaa0820  ! 2891: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xb48d0000  ! 2895: ANDcc_R	andcc 	%r20, %r0, %r26
	.word 0xb5a4c9e0  ! 2898: FDIVq	dis not found

T1_asi_reg_wr_130:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 2899: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_1_205:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_205), 16, 16)) -> intp(1, 0, 22)
T1_asi_reg_rd_123:
	mov	0x36, %r14
	.word 0xfcdb89e0  ! 2901: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_131:
	mov	0x3c6, %r14
	.word 0xfaf38400  ! 2905: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T1_asi_reg_rd_124:
	mov	0x7, %r14
	.word 0xf8db8e80  ! 2910: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbf7dc400  ! 2911: MOVR_R	movre	%r23, %r0, %r31
T1_asi_reg_wr_132:
	mov	0x16, %r14
	.word 0xf8f38400  ! 2914: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T1_asi_reg_wr_133:
	mov	0x12, %r14
	.word 0xf8f389e0  ! 2922: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T1_asi_reg_wr_134:
	mov	0xb, %r14
	.word 0xfaf389e0  ! 2923: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb3a509c0  ! 2924: FDIVd	fdivd	%f20, %f0, %f56
cpu_intr_1_232:
	setx	0x35033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_135:
	mov	0x14, %r14
	.word 0xfcf38e80  ! 2926: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_1_233:
	setx	0x370039, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_234:
	setx	0x350211, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_235:
	setx	0x35033b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_206:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_206), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_wr_136:
	mov	0x2b, %r14
	.word 0xf6f389e0  ! 2941: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	lda	[%r23 + %g0] 0xf0, %f2
T1_asi_reg_wr_137:
	mov	0x22, %r14
	.word 0xf6f389e0  ! 2945: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T1_asi_reg_rd_125:
	mov	0x25, %r14
	.word 0xf6db8e60  ! 2948: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_138:
	mov	0x3c2, %r14
	.word 0xf0f384a0  ! 2950: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	lda	[%r23 + %g0] 0xf0, %f2
	.word 0xb9a80420  ! 2955: FMOVRZ	dis not found

iob_intr_1_207:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_207), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb7a5c960  ! 2960: FMULq	dis not found

iob_intr_1_208:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_208), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb5ab0820  ! 2966: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb9a80820  ! 2970: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xb7a80420  ! 2972: FMOVRZ	dis not found

	.word 0xb535d000  ! 2973: SRLX_R	srlx	%r23, %r0, %r26
T1_asi_reg_wr_139:
	mov	0x2d, %r14
	.word 0xfcf38e40  ! 2974: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_1_236:
	setx	0x350308, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_209:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_209), 16, 16)) -> intp(1, 0, 14)
	.word 0xb5a00540  ! 2978: FSQRTd	fsqrt	
iob_intr_1_210:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_210), 16, 16)) -> intp(1, 0, 29)
	.word 0xb9a408e0  ! 2980: FSUBq	dis not found

cpu_intr_1_237:
	setx	0x34031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a81820  ! 2984: FMOVRGZ	fmovs	%fcc3, %f0, %f26
cpu_intr_1_238:
	setx	0x37000d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_211:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_211), 16, 16)) -> intp(1, 0, e)
	.word 0xb5a408c0  ! 2989: FSUBd	fsubd	%f16, %f0, %f26
T1_asi_reg_rd_126:
	mov	0x3c4, %r14
	.word 0xfedb84a0  ! 2991: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb7a409e0  ! 2994: FDIVq	dis not found

cpu_intr_1_239:
	setx	0x36010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a409a0  ! 3001: FDIVs	fdivs	%f16, %f0, %f24
	.word 0xbda00040  ! 3003: FMOVd	fmovd	%f0, %f30
	.word 0xb1aac820  ! 3005: FMOVGE	fmovs	%fcc1, %f0, %f24
iob_intr_1_212:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_212), 16, 16)) -> intp(1, 0, 18)
cpu_intr_1_240:
	setx	0x370335, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_140:
	mov	0x21, %r14
	.word 0xfef38e60  ! 3010: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb17c8400  ! 3012: MOVR_R	movre	%r18, %r0, %r24
T1_asi_reg_rd_127:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 3013: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb3a80c20  ! 3014: FMOVRLZ	dis not found

	.word 0xb1a00560  ! 3016: FSQRTq	fsqrt	
cpu_intr_1_241:
	setx	0x340115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aac820  ! 3018: FMOVGE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_242:
	setx	0x350326, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r16 + %g0] 0xf0, %f2
iob_intr_1_213:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_213), 16, 16)) -> intp(1, 0, 12)
	.word 0xb3a4c8c0  ! 3027: FSUBd	fsubd	%f50, %f0, %f56
T1_asi_reg_rd_128:
	mov	0x1f, %r14
	.word 0xf4db8e40  ! 3028: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_1_243:
	setx	0x35021b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_214:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_214), 16, 16)) -> intp(1, 0, 25)
iob_intr_1_215:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_215), 16, 16)) -> intp(1, 0, 1f)
iob_intr_1_216:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_216), 16, 16)) -> intp(1, 0, 10)
	.word 0xb1ab4820  ! 3046: FMOVCC	fmovs	%fcc1, %f0, %f24
cpu_intr_1_244:
	setx	0x37033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba50960  ! 3050: FMULq	dis not found

cpu_intr_1_245:
	setx	0x350014, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_246:
	setx	0x35022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5ab8820  ! 3060: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb225e05d  ! 3061: SUB_I	sub 	%r23, 0x005d, %r25
	.word 0xbfa58920  ! 3062: FMULs	fmuls	%f22, %f0, %f31
	.word 0xbfa50860  ! 3063: FADDq	dis not found

T1_asi_reg_wr_141:
	mov	0x1e, %r14
	.word 0xf4f389e0  ! 3069: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb3a81420  ! 3072: FMOVRNZ	dis not found

cpu_intr_1_247:
	setx	0x34023c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_217:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_217), 16, 16)) -> intp(1, 0, 1c)
iob_intr_1_218:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_218), 16, 16)) -> intp(1, 0, 4)
iob_intr_1_219:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_219), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb7a00520  ! 3081: FSQRTs	fsqrt	
	.word 0xb7a80820  ! 3084: FMOVN	fmovs	%fcc1, %f0, %f27
cpu_intr_1_248:
	setx	0x35022d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_249:
	setx	0x360008, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_250:
	setx	0x350208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda408c0  ! 3092: FSUBd	fsubd	%f16, %f0, %f30
	.word 0xbf3c6001  ! 3093: SRA_I	sra 	%r17, 0x0001, %r31
T1_asi_reg_wr_142:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 3095: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbda548a0  ! 3096: FSUBs	fsubs	%f21, %f0, %f30
cpu_intr_1_251:
	setx	0x360021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aa0820  ! 3100: FMOVA	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa4c9c0  ! 3106: FDIVd	fdivd	%f50, %f0, %f62
	.word 0xb3abc820  ! 3107: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb1aa8820  ! 3108: FMOVG	fmovs	%fcc1, %f0, %f24
iob_intr_1_220:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_220), 16, 16)) -> intp(1, 0, 32)
	.word 0xbda5c820  ! 3111: FADDs	fadds	%f23, %f0, %f30
cpu_intr_1_252:
	setx	0x350131, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_253:
	setx	0x340204, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_143:
	mov	0x3c8, %r14
	.word 0xf2f38e60  ! 3119: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T1_asi_reg_rd_129:
	mov	0x31, %r14
	.word 0xfedb84a0  ! 3122: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb3aa4820  ! 3124: FMOVNE	fmovs	%fcc1, %f0, %f25
cpu_intr_1_254:
	setx	0x370200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a50860  ! 3129: FADDq	dis not found

	.word 0xb5aac820  ! 3131: FMOVGE	fmovs	%fcc1, %f0, %f26
iob_intr_1_221:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_221), 16, 16)) -> intp(1, 0, 26)
	.word 0xb3a5c8e0  ! 3135: FSUBq	dis not found

	.word 0xb1a409e0  ! 3136: FDIVq	dis not found

	.word 0xb5aac820  ! 3138: FMOVGE	fmovs	%fcc1, %f0, %f26
iob_intr_1_222:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_222), 16, 16)) -> intp(1, 0, 4)
T1_asi_reg_rd_130:
	mov	0x3c7, %r14
	.word 0xf0db84a0  ! 3143: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb3a00040  ! 3145: FMOVd	fmovd	%f0, %f56
cpu_intr_1_255:
	setx	0x340100, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_144:
	mov	0x2f, %r14
	.word 0xf6f38e40  ! 3148: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbfa80820  ! 3149: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb434c000  ! 3150: ORN_R	orn 	%r19, %r0, %r26
	.word 0xbbab4820  ! 3152: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb9a80c20  ! 3154: FMOVRLZ	dis not found

cpu_intr_1_256:
	setx	0x340304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_223:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_223), 16, 16)) -> intp(1, 0, 35)
iob_intr_1_224:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_224), 16, 16)) -> intp(1, 0, 6)
cpu_intr_1_257:
	setx	0x350304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80820  ! 3163: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
iob_intr_1_225:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_225), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbfa80820  ! 3165: FMOVN	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_131:
	mov	0xa, %r14
	.word 0xf2db84a0  ! 3166: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_1_226:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_226), 16, 16)) -> intp(1, 0, 6)
	.word 0xbfaa4820  ! 3171: FMOVNE	fmovs	%fcc1, %f0, %f31
iob_intr_1_227:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_227), 16, 16)) -> intp(1, 0, 37)
	.word 0xbd340000  ! 3176: SRL_R	srl 	%r16, %r0, %r30
T1_asi_reg_rd_132:
	mov	0x5, %r14
	.word 0xf2db84a0  ! 3182: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_145:
	mov	0x25, %r14
	.word 0xfef389e0  ! 3186: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_1_228:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_228), 16, 16)) -> intp(1, 0, 3b)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xa1902000  ! 3190: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xbfa8c820  ! 3193: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb1a84820  ! 3196: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb3a488a0  ! 3198: FSUBs	fsubs	%f18, %f0, %f25
T1_asi_reg_wr_146:
	mov	0x27, %r14
	.word 0xfef384a0  ! 3200: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_wr_147:
	mov	0x3c1, %r14
	.word 0xfaf389e0  ! 3203: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb351c000  ! 3204: RDPR_TL	<illegal instruction>
cpu_intr_1_258:
	setx	0x380200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a588a0  ! 3208: FSUBs	fsubs	%f22, %f0, %f26
T1_asi_reg_rd_133:
	mov	0x3c8, %r14
	.word 0xf0db8e80  ! 3209: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_1_259:
	setx	0x3a0339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a8c820  ! 3215: FMOVL	fmovs	%fcc1, %f0, %f24
iob_intr_1_229:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_229), 16, 16)) -> intp(1, 0, 0)
	.word 0xb43ca071  ! 3217: XNOR_I	xnor 	%r18, 0x0071, %r26
	.word 0xb1aa4820  ! 3220: FMOVNE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_134:
	mov	0x3c0, %r14
	.word 0xf8db8e60  ! 3222: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb37c0400  ! 3226: MOVR_R	movre	%r16, %r0, %r25
	.word 0xb1a4c960  ! 3228: FMULq	dis not found

iob_intr_1_230:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_230), 16, 16)) -> intp(1, 0, 23)
cpu_intr_1_260:
	setx	0x3b012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa58920  ! 3234: FMULs	fmuls	%f22, %f0, %f31
	.word 0xbda98820  ! 3235: FMOVNEG	fmovs	%fcc1, %f0, %f30
cpu_intr_1_261:
	setx	0x3b023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa409e0  ! 3237: FDIVq	dis not found

T1_asi_reg_rd_135:
	mov	0x16, %r14
	.word 0xf8db8e40  ! 3238: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_wr_148:
	mov	0x29, %r14
	.word 0xfcf38e40  ! 3239: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_1_262:
	setx	0x3b011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00520  ! 3243: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a589e0  ! 3248: FDIVq	dis not found

iob_intr_1_231:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_231), 16, 16)) -> intp(1, 0, e)
	.word 0xb5a81c20  ! 3251: FMOVRGEZ	dis not found

	.word 0xb5ab8820  ! 3252: FMOVPOS	fmovs	%fcc1, %f0, %f26
iob_intr_1_232:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_232), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb5a489a0  ! 3254: FDIVs	fdivs	%f18, %f0, %f26
	.word 0xb035e1fe  ! 3259: ORN_I	orn 	%r23, 0x01fe, %r24
iob_intr_1_233:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_233), 16, 16)) -> intp(1, 0, 3b)
cpu_intr_1_263:
	setx	0x3a0211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb23c8000  ! 3263: XNOR_R	xnor 	%r18, %r0, %r25
	.word 0xbd7cc400  ! 3264: MOVR_R	movre	%r19, %r0, %r30
cpu_intr_1_264:
	setx	0x3a0021, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_149:
	mov	0x28, %r14
	.word 0xfaf384a0  ! 3267: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_1_265:
	setx	0x3a000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80c20  ! 3274: FMOVRLZ	dis not found

	.word 0xbda5c8a0  ! 3275: FSUBs	fsubs	%f23, %f0, %f30
	.word 0xb7a549a0  ! 3280: FDIVs	fdivs	%f21, %f0, %f27
	.word 0xb9a50840  ! 3281: FADDd	faddd	%f20, %f0, %f28
T1_asi_reg_rd_136:
	mov	0x6, %r14
	.word 0xf0db8e40  ! 3282: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbda8c820  ! 3283: FMOVL	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_137:
	mov	0x3c1, %r14
	.word 0xf2db8e80  ! 3285: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbba00560  ! 3288: FSQRTq	fsqrt	
	.word 0xb6b5219b  ! 3290: SUBCcc_I	orncc 	%r20, 0x019b, %r27
T1_asi_reg_wr_150:
	mov	0x8, %r14
	.word 0xf6f38e60  ! 3291: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb9a88820  ! 3295: FMOVLE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_266:
	setx	0x3a0002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc3cc000  ! 3301: XNOR_R	xnor 	%r19, %r0, %r30
T1_asi_reg_rd_138:
	mov	0x29, %r14
	.word 0xf0db84a0  ! 3302: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_1_234:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_234), 16, 16)) -> intp(1, 0, 23)
	.word 0xbba58820  ! 3304: FADDs	fadds	%f22, %f0, %f29
T1_asi_reg_wr_151:
	mov	0x11, %r14
	.word 0xfef38e40  ! 3307: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_rd_139:
	mov	0x16, %r14
	.word 0xf4db8e80  ! 3312: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_1_235:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_235), 16, 16)) -> intp(1, 0, 20)
	.word 0xb72d4000  ! 3323: SLL_R	sll 	%r21, %r0, %r27
	.word 0xbfa54920  ! 3325: FMULs	fmuls	%f21, %f0, %f31
	.word 0xbda408e0  ! 3326: FSUBq	dis not found

cpu_intr_1_267:
	setx	0x380236, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_268:
	setx	0x39012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_152:
	mov	0x26, %r14
	.word 0xfef389e0  ! 3331: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb7a54920  ! 3338: FMULs	fmuls	%f21, %f0, %f27
	.word 0xbba84820  ! 3342: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xba358000  ! 3343: SUBC_R	orn 	%r22, %r0, %r29
	.word 0xb9abc820  ! 3349: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xbfa5c840  ! 3353: FADDd	faddd	%f54, %f0, %f62
iob_intr_1_236:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_236), 16, 16)) -> intp(1, 0, 1c)
	.word 0xbe1c61a3  ! 3356: XOR_I	xor 	%r17, 0x01a3, %r31
cpu_intr_1_269:
	setx	0x38002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba58960  ! 3361: FMULq	dis not found

iob_intr_1_237:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_237), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb7a88820  ! 3366: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb5a408e0  ! 3367: FSUBq	dis not found

iob_intr_1_238:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_238), 16, 16)) -> intp(1, 0, 3)
	.word 0xb9aa8820  ! 3369: FMOVG	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_153:
	mov	0x3c5, %r14
	.word 0xfcf38e40  ! 3373: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb5aac820  ! 3375: FMOVGE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_270:
	setx	0x380235, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_140:
	mov	0x30, %r14
	.word 0xf6db8e40  ! 3381: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T1_asi_reg_wr_154:
	mov	0x2b, %r14
	.word 0xfaf38e40  ! 3384: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_wr_155:
	mov	0x24, %r14
	.word 0xf8f38400  ! 3385: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb5aa8820  ! 3386: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb9aac820  ! 3388: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xb1a80820  ! 3390: FMOVN	fmovs	%fcc1, %f0, %f24
cpu_intr_1_271:
	setx	0x3a010c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_272:
	setx	0x3b0026, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_156:
	mov	0x3c4, %r14
	.word 0xfcf38400  ! 3399: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_1_239:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_239), 16, 16)) -> intp(1, 0, 38)
	.word 0xbfa90820  ! 3401: FMOVLEU	fmovs	%fcc1, %f0, %f31
cpu_intr_1_273:
	setx	0x380335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a9c820  ! 3404: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xbf51c000  ! 3407: RDPR_TL	<illegal instruction>
	.word 0xb1a84820  ! 3409: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb2b4c000  ! 3410: ORNcc_R	orncc 	%r19, %r0, %r25
T1_asi_reg_wr_157:
	mov	0x2c, %r14
	.word 0xfef389e0  ! 3411: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb3ab8820  ! 3415: FMOVPOS	fmovs	%fcc1, %f0, %f25
iob_intr_1_240:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_240), 16, 16)) -> intp(1, 0, 29)
cpu_intr_1_274:
	setx	0x3b032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aac820  ! 3424: FMOVGE	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a00560  ! 3432: FSQRTq	fsqrt	
T1_asi_reg_wr_158:
	mov	0x9, %r14
	.word 0xfaf38e80  ! 3435: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb3a00540  ! 3438: FSQRTd	fsqrt	
cpu_intr_1_275:
	setx	0x3b0206, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_141:
	mov	0x6, %r14
	.word 0xfadb8e40  ! 3440: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb1abc820  ! 3444: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xbb34e001  ! 3448: SRL_I	srl 	%r19, 0x0001, %r29
T1_asi_reg_wr_159:
	mov	0x14, %r14
	.word 0xfef38e40  ! 3449: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_rd_142:
	mov	0x1f, %r14
	.word 0xfcdb8e60  ! 3455: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb7a5c8e0  ! 3462: FSUBq	dis not found

T1_asi_reg_rd_143:
	mov	0x30, %r14
	.word 0xf6db8e60  ! 3468: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_1_241:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_241), 16, 16)) -> intp(1, 0, a)
	.word 0xb03d4000  ! 3471: XNOR_R	xnor 	%r21, %r0, %r24
	.word 0xb9a50840  ! 3475: FADDd	faddd	%f20, %f0, %f28
iob_intr_1_242:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_242), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_rd_144:
	mov	0x1f, %r14
	.word 0xfcdb8e40  ! 3478: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_243:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_243), 16, 16)) -> intp(1, 0, 30)
iob_intr_1_244:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_244), 16, 16)) -> intp(1, 0, 8)
	.word 0xbda4c960  ! 3486: FMULq	dis not found

iob_intr_1_245:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_245), 16, 16)) -> intp(1, 0, 1)
	.word 0xb7a00520  ! 3489: FSQRTs	fsqrt	
	.word 0xb32cd000  ! 3492: SLLX_R	sllx	%r19, %r0, %r25
	.word 0xb1a00560  ! 3493: FSQRTq	fsqrt	
T1_asi_reg_wr_160:
	mov	0x29, %r14
	.word 0xfcf38e80  ! 3497: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb7a81c20  ! 3499: FMOVRGEZ	dis not found

T1_asi_reg_rd_145:
	mov	0x38, %r14
	.word 0xf6db89e0  ! 3501: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T1_asi_reg_wr_161:
	mov	0x3c3, %r14
	.word 0xf0f38e60  ! 3502: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T1_asi_reg_wr_162:
	mov	0x7, %r14
	.word 0xf2f38400  ! 3503: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T1_asi_reg_rd_146:
	mov	0x23, %r14
	.word 0xf0db8e60  ! 3504: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T1_asi_reg_wr_163:
	mov	0x37, %r14
	.word 0xfcf38e40  ! 3505: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T1_asi_reg_rd_147:
	mov	0x2b, %r14
	.word 0xfedb8e60  ! 3506: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T1_asi_reg_wr_164:
	mov	0x1d, %r14
	.word 0xf0f38e40  ! 3508: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	lda	[%r21 + %g0] 0xf0, %f2
cpu_intr_1_276:
	setx	0x390237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c960  ! 3514: FMULq	dis not found

	.word 0xb7a8c820  ! 3516: FMOVL	fmovs	%fcc1, %f0, %f27
cpu_intr_1_277:
	setx	0x3b022c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_148:
	mov	0x3c6, %r14
	.word 0xf0db8e40  ! 3518: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_1_278:
	setx	0x3a021c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_149:
	mov	0x9, %r14
	.word 0xf4db8e40  ! 3520: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_rd_150:
	mov	0x1d, %r14
	.word 0xf6db8e40  ! 3522: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_279:
	setx	0x3b002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaa0820  ! 3524: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb5a4c9a0  ! 3526: FDIVs	fdivs	%f19, %f0, %f26
	.word 0xb3a40860  ! 3528: FADDq	dis not found

	.word 0xb3a00520  ! 3529: FSQRTs	fsqrt	
	.word 0xb9643801  ! 3531: MOVcc_I	<illegal instruction>
	.word 0xbba00040  ! 3534: FMOVd	fmovd	%f0, %f60
	.word 0xb9a44940  ! 3538: FMULd	fmuld	%f48, %f0, %f28
T1_asi_reg_wr_165:
	mov	0x3c6, %r14
	.word 0xf6f38e40  ! 3542: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_wr_166:
	mov	0x3c7, %r14
	.word 0xf4f38400  ! 3545: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_1_280:
	setx	0x38010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xa1902002  ! 3552: WRPR_GL_I	wrpr	%r0, 0x0002, %-
iob_intr_1_246:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_246), 16, 16)) -> intp(1, 0, 2)
	.word 0xbfa588e0  ! 3556: FSUBq	dis not found

T1_asi_reg_rd_151:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 3563: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_1_247:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_247), 16, 16)) -> intp(1, 0, 21)
	.word 0xbc1cc000  ! 3567: XOR_R	xor 	%r19, %r0, %r30
T1_asi_reg_wr_167:
	mov	0x1a, %r14
	.word 0xfaf389e0  ! 3572: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_248:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_248), 16, 16)) -> intp(1, 0, a)
	.word 0xbba00560  ! 3580: FSQRTq	fsqrt	
	.word 0x8595e1ab  ! 3581: WRPR_TSTATE_I	wrpr	%r23, 0x01ab, %tstate
	.word 0xbda5c8a0  ! 3582: FSUBs	fsubs	%f23, %f0, %f30
	.word 0xbda54840  ! 3587: FADDd	faddd	%f52, %f0, %f30
	.word 0xb3aa8820  ! 3591: FMOVG	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_152:
	mov	0x5, %r14
	.word 0xfadb84a0  ! 3593: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbd340000  ! 3595: SRL_R	srl 	%r16, %r0, %r30
cpu_intr_1_281:
	setx	0x380015, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xbc05c000  ! 3604: ADD_R	add 	%r23, %r0, %r30
	.word 0xbda94820  ! 3606: FMOVCS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_168:
	mov	0x3c7, %r14
	.word 0xfef389e0  ! 3608: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_rd_153:
	mov	0x3c4, %r14
	.word 0xf2db8e40  ! 3609: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbda44920  ! 3612: FMULs	fmuls	%f17, %f0, %f30
	.word 0xb405c000  ! 3614: ADD_R	add 	%r23, %r0, %r26
	.word 0xb5a88820  ! 3616: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xbba5c8e0  ! 3619: FSUBq	dis not found

	.word 0xb0bd0000  ! 3621: XNORcc_R	xnorcc 	%r20, %r0, %r24
T1_asi_reg_rd_154:
	mov	0x1e, %r14
	.word 0xf2db8e40  ! 3622: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb9a588e0  ! 3623: FSUBq	dis not found

	.word 0xb7a4c9c0  ! 3624: FDIVd	fdivd	%f50, %f0, %f58
	.word 0xb1a4c940  ! 3626: FMULd	fmuld	%f50, %f0, %f24
T1_asi_reg_rd_155:
	mov	0x36, %r14
	.word 0xf8db8400  ! 3629: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb1a8c820  ! 3631: FMOVL	fmovs	%fcc1, %f0, %f24
iob_intr_1_249:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_249), 16, 16)) -> intp(1, 0, c)
	.word 0xb1ab4820  ! 3634: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb1a58920  ! 3635: FMULs	fmuls	%f22, %f0, %f24
cpu_intr_1_282:
	setx	0x3d0118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00540  ! 3638: FSQRTd	fsqrt	
	.word 0xb6a54000  ! 3641: SUBcc_R	subcc 	%r21, %r0, %r27
	.word 0xbfa98820  ! 3644: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xbda81c20  ! 3646: FMOVRGEZ	dis not found

cpu_intr_1_283:
	setx	0x3c0025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb97da401  ! 3648: MOVR_I	movre	%r22, 0x1, %r28
cpu_intr_1_284:
	setx	0x3e0214, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_250:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_250), 16, 16)) -> intp(1, 0, 2f)
iob_intr_1_251:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_251), 16, 16)) -> intp(1, 0, 16)
iob_intr_1_252:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_252), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_rd_156:
	mov	0x32, %r14
	.word 0xf4db8e80  ! 3657: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbda54820  ! 3660: FADDs	fadds	%f21, %f0, %f30
	.word 0xb4258000  ! 3662: SUB_R	sub 	%r22, %r0, %r26
	.word 0xb9a84820  ! 3663: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb7a4c820  ! 3664: FADDs	fadds	%f19, %f0, %f27
	.word 0xb7aac820  ! 3667: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb1a408a0  ! 3668: FSUBs	fsubs	%f16, %f0, %f24
	.word 0xb7a549a0  ! 3670: FDIVs	fdivs	%f21, %f0, %f27
	.word 0xbda00540  ! 3672: FSQRTd	fsqrt	
	.word 0xb7a00040  ! 3673: FMOVd	fmovd	%f0, %f58
T1_asi_reg_wr_169:
	mov	0x2c, %r14
	.word 0xfaf38400  ! 3675: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_285:
	setx	0x3c0301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xa1902000  ! 3682: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xb3a88820  ! 3685: FMOVLE	fmovs	%fcc1, %f0, %f25
iob_intr_1_253:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_253), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbfa8c820  ! 3687: FMOVL	fmovs	%fcc1, %f0, %f31
iob_intr_1_254:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_254), 16, 16)) -> intp(1, 0, 3a)
iob_intr_1_255:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_255), 16, 16)) -> intp(1, 0, e)
T1_asi_reg_wr_170:
	mov	0x3c1, %r14
	.word 0xf2f38e40  ! 3694: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb7ab0820  ! 3697: FMOVGU	fmovs	%fcc1, %f0, %f27
cpu_intr_1_286:
	setx	0x3c010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba846132  ! 3707: ADDcc_I	addcc 	%r17, 0x0132, %r29
cpu_intr_1_287:
	setx	0x3e0307, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_256:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_256), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbd3dd000  ! 3711: SRAX_R	srax	%r23, %r0, %r30
	.word 0xbe34e12b  ! 3712: ORN_I	orn 	%r19, 0x012b, %r31
	.word 0xb7a50840  ! 3713: FADDd	faddd	%f20, %f0, %f58
T1_asi_reg_rd_157:
	mov	0xe, %r14
	.word 0xfcdb8e40  ! 3715: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb3a00040  ! 3720: FMOVd	fmovd	%f0, %f56
	.word 0xb9a488e0  ! 3721: FSUBq	dis not found

iob_intr_1_257:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_257), 16, 16)) -> intp(1, 0, 14)
	.word 0xbba58940  ! 3725: FMULd	fmuld	%f22, %f0, %f60
cpu_intr_1_288:
	setx	0x3d0110, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_258:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_258), 16, 16)) -> intp(1, 0, 3f)
cpu_intr_1_289:
	setx	0x3e013a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_259:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_259), 16, 16)) -> intp(1, 0, 8)
	.word 0xb43dc000  ! 3739: XNOR_R	xnor 	%r23, %r0, %r26
	.word 0xb7a81820  ! 3741: FMOVRGZ	fmovs	%fcc3, %f0, %f27
cpu_intr_1_290:
	setx	0x3c0016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a508c0  ! 3744: FSUBd	fsubd	%f20, %f0, %f56
	.word 0xb9a40820  ! 3745: FADDs	fadds	%f16, %f0, %f28
cpu_intr_1_291:
	setx	0x3c012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00040  ! 3753: FMOVd	fmovd	%f0, %f28
	lda	[%r18 + %g0] 0xf0, %f2
T1_asi_reg_wr_171:
	mov	0x3c5, %r14
	.word 0xf0f38e60  ! 3758: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb1a509a0  ! 3760: FDIVs	fdivs	%f20, %f0, %f24
T1_asi_reg_rd_158:
	mov	0x29, %r14
	.word 0xf4db84a0  ! 3762: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbfa4c9e0  ! 3763: FDIVq	dis not found

	.word 0xb5a84820  ! 3764: FMOVE	fmovs	%fcc1, %f0, %f26
	lda	[%r18 + %g0] 0xf0, %f2
	.word 0xbba408e0  ! 3767: FSUBq	dis not found

	.word 0xb5a00540  ! 3768: FSQRTd	fsqrt	
T1_asi_reg_rd_159:
	mov	0x36, %r14
	.word 0xf0db84a0  ! 3769: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb8048000  ! 3770: ADD_R	add 	%r18, %r0, %r28
T1_asi_reg_rd_160:
	mov	0x3c3, %r14
	.word 0xf0db8e80  ! 3771: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	lda	[%r18 + %g0] 0xf0, %f2
	.word 0xb62dc000  ! 3774: ANDN_R	andn 	%r23, %r0, %r27
cpu_intr_1_292:
	setx	0x3f012a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_161:
	mov	0x10, %r14
	.word 0xf2db84a0  ! 3777: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb3ab0820  ! 3779: FMOVGU	fmovs	%fcc1, %f0, %f25
cpu_intr_1_293:
	setx	0x3f0324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab0820  ! 3781: FMOVGU	fmovs	%fcc1, %f0, %f25
iob_intr_1_260:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_260), 16, 16)) -> intp(1, 0, 34)
	.word 0xbda80c20  ! 3786: FMOVRLZ	dis not found

	.word 0xb7a509c0  ! 3787: FDIVd	fdivd	%f20, %f0, %f58
cpu_intr_1_294:
	setx	0x3e0327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb80da1c3  ! 3794: AND_I	and 	%r22, 0x01c3, %r28
cpu_intr_1_295:
	setx	0x3f010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a48960  ! 3797: FMULq	dis not found

cpu_intr_1_296:
	setx	0x3d0202, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_297:
	setx	0x3f0200, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_261:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_261), 16, 16)) -> intp(1, 0, 2b)
	.word 0xbda80820  ! 3804: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xbba80820  ! 3806: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xb9ab4820  ! 3807: FMOVCC	fmovs	%fcc1, %f0, %f28
cpu_intr_1_298:
	setx	0x3c012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a54840  ! 3810: FADDd	faddd	%f52, %f0, %f24
	.word 0xbdab4820  ! 3812: FMOVCC	fmovs	%fcc1, %f0, %f30
cpu_intr_1_299:
	setx	0x3c0035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe4421a4  ! 3815: ADDC_I	addc 	%r16, 0x01a4, %r31
T1_asi_reg_rd_162:
	mov	0x3c7, %r14
	.word 0xf4db89e0  ! 3816: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb1a44840  ! 3821: FADDd	faddd	%f48, %f0, %f24
	.word 0xbba48920  ! 3822: FMULs	fmuls	%f18, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb6a48000  ! 3826: SUBcc_R	subcc 	%r18, %r0, %r27
	.word 0xb6b4c000  ! 3832: ORNcc_R	orncc 	%r19, %r0, %r27
	.word 0xb7a508c0  ! 3833: FSUBd	fsubd	%f20, %f0, %f58
T1_asi_reg_wr_172:
	mov	0x1a, %r14
	.word 0xf2f38e40  ! 3834: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbfa81820  ! 3838: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb3a80820  ! 3841: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xbba58840  ! 3843: FADDd	faddd	%f22, %f0, %f60
	.word 0xba050000  ! 3845: ADD_R	add 	%r20, %r0, %r29
T1_asi_reg_rd_163:
	mov	0x14, %r14
	.word 0xf0db8e80  ! 3847: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_1_300:
	setx	0x3f003f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_173:
	mov	0x17, %r14
	.word 0xf2f389e0  ! 3850: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T1_asi_reg_rd_164:
	mov	0x3c5, %r14
	.word 0xf0db84a0  ! 3853: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T1_asi_reg_wr_174:
	mov	0x3c8, %r14
	.word 0xfaf38e40  ! 3854: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_1_262:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_262), 16, 16)) -> intp(1, 0, b)
	.word 0xb03c8000  ! 3857: XNOR_R	xnor 	%r18, %r0, %r24
cpu_intr_1_301:
	setx	0x3c0228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba5c8e0  ! 3865: FSUBq	dis not found

	.word 0xb5a548c0  ! 3866: FSUBd	fsubd	%f52, %f0, %f26
	.word 0xbfaa8820  ! 3870: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xb13c6001  ! 3875: SRA_I	sra 	%r17, 0x0001, %r24
iob_intr_1_263:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_263), 16, 16)) -> intp(1, 0, 38)
T1_asi_reg_rd_165:
	mov	0xf, %r14
	.word 0xf0db8400  ! 3877: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_wr_175:
	mov	0x3c2, %r14
	.word 0xf6f38e60  ! 3879: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb7a88820  ! 3885: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb5a50920  ! 3888: FMULs	fmuls	%f20, %f0, %f26
	.word 0xb3a00040  ! 3889: FMOVd	fmovd	%f0, %f56
iob_intr_1_264:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_264), 16, 16)) -> intp(1, 0, 22)
T1_asi_reg_wr_176:
	mov	0x22, %r14
	.word 0xf2f38e40  ! 3894: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_1_265:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_265), 16, 16)) -> intp(1, 0, 23)
	.word 0xb6842142  ! 3899: ADDcc_I	addcc 	%r16, 0x0142, %r27
T1_asi_reg_rd_166:
	mov	0x5, %r14
	.word 0xf0db84a0  ! 3900: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbc24a007  ! 3901: SUB_I	sub 	%r18, 0x0007, %r30
	.word 0xbba50860  ! 3902: FADDq	dis not found

iob_intr_1_266:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_266), 16, 16)) -> intp(1, 0, 18)
iob_intr_1_267:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_267), 16, 16)) -> intp(1, 0, a)
iob_intr_1_268:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_268), 16, 16)) -> intp(1, 0, 37)
	.word 0xbba548a0  ! 3909: FSUBs	fsubs	%f21, %f0, %f29
T1_asi_reg_wr_177:
	mov	0x3c5, %r14
	.word 0xf6f38e40  ! 3910: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_269:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_269), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_wr_178:
	mov	0x18, %r14
	.word 0xfaf38400  ! 3914: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T1_asi_reg_wr_179:
	mov	0x3c1, %r14
	.word 0xfaf38400  ! 3915: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbeb4e07c  ! 3917: SUBCcc_I	orncc 	%r19, 0x007c, %r31
cpu_intr_1_302:
	setx	0x3f0021, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_270:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_270), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbcc48000  ! 3927: ADDCcc_R	addccc 	%r18, %r0, %r30
	.word 0xbfa4c9a0  ! 3928: FDIVs	fdivs	%f19, %f0, %f31
cpu_intr_1_303:
	setx	0x3f022d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_180:
	mov	0x30, %r14
	.word 0xf4f38e60  ! 3933: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_1_304:
	setx	0x3c022a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_181:
	mov	0x36, %r14
	.word 0xf8f384a0  ! 3939: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb28d0000  ! 3942: ANDcc_R	andcc 	%r20, %r0, %r25
iob_intr_1_271:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_271), 16, 16)) -> intp(1, 0, 7)
	.word 0xb9a81820  ! 3947: FMOVRGZ	fmovs	%fcc3, %f0, %f28
cpu_intr_1_305:
	setx	0x3d013a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_306:
	setx	0x3d002c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_167:
	mov	0x16, %r14
	.word 0xfadb8e40  ! 3954: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_272:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_272), 16, 16)) -> intp(1, 0, 4)
	.word 0xb1a549a0  ! 3962: FDIVs	fdivs	%f21, %f0, %f24
	.word 0xb7a488e0  ! 3963: FSUBq	dis not found

iob_intr_1_273:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_273), 16, 16)) -> intp(1, 0, 1)
cpu_intr_1_307:
	setx	0x3f0205, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_168:
	mov	0xb, %r14
	.word 0xf6db8e40  ! 3967: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_308:
	setx	0x3f0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00540  ! 3972: FSQRTd	fsqrt	
	.word 0xb3a81420  ! 3973: FMOVRNZ	dis not found

	.word 0xb9a00560  ! 3974: FSQRTq	fsqrt	
T1_asi_reg_wr_182:
	mov	0x26, %r14
	.word 0xfcf38e80  ! 3976: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb3a00540  ! 3977: FSQRTd	fsqrt	
iob_intr_1_274:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_274), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_275:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_275), 16, 16)) -> intp(1, 0, d)
	.word 0xb1a589e0  ! 3981: FDIVq	dis not found

	.word 0xb9a4c820  ! 3983: FADDs	fadds	%f19, %f0, %f28
	.word 0xb5a81c20  ! 3986: FMOVRGEZ	dis not found

	.word 0xb7a00540  ! 3987: FSQRTd	fsqrt	
	.word 0xbdab4820  ! 3989: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb1a549c0  ! 3992: FDIVd	fdivd	%f52, %f0, %f24
iob_intr_1_276:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_276), 16, 16)) -> intp(1, 0, 26)
	.word 0xb7a00020  ! 3995: FMOVs	fmovs	%f0, %f27
	.word 0xb3a00540  ! 3996: FSQRTd	fsqrt	
iob_intr_1_277:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_277), 16, 16)) -> intp(1, 0, 3d)
cpu_intr_1_309:
	setx	0x3f0324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c960  ! 4001: FMULq	dis not found

	.word 0xb1a80420  ! 4002: FMOVRZ	dis not found

	.word 0x8595a03d  ! 4003: WRPR_TSTATE_I	wrpr	%r22, 0x003d, %tstate
T1_asi_reg_rd_169:
	mov	0x6, %r14
	.word 0xfedb84a0  ! 4008: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_1_310:
	setx	0x3f0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a48860  ! 4012: FADDq	dis not found

cpu_intr_1_311:
	setx	0x3c0026, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_278:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_278), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb1a00560  ! 4019: FSQRTq	fsqrt	
cpu_intr_1_312:
	setx	0x3c033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3abc820  ! 4021: FMOVVC	fmovs	%fcc1, %f0, %f25
iob_intr_1_279:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_279), 16, 16)) -> intp(1, 0, 9)
iob_intr_1_280:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_280), 16, 16)) -> intp(1, 0, 20)
iob_intr_1_281:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_281), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb1a84820  ! 4031: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xbb643801  ! 4033: MOVcc_I	<illegal instruction>
	.word 0xb1a00520  ! 4034: FSQRTs	fsqrt	
cpu_intr_1_313:
	setx	0x3e032d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_314:
	setx	0x3d0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba84c000  ! 4039: ADDcc_R	addcc 	%r19, %r0, %r29
cpu_intr_1_315:
	setx	0x3e0229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a88820  ! 4041: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb32c7001  ! 4042: SLLX_I	sllx	%r17, 0x0001, %r25
	.word 0xb7a448a0  ! 4043: FSUBs	fsubs	%f17, %f0, %f27
	.word 0xb9a508e0  ! 4044: FSUBq	dis not found

	.word 0xb5aac820  ! 4045: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb1a00040  ! 4047: FMOVd	fmovd	%f0, %f24
cpu_intr_1_316:
	setx	0x3f0021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb2d8000  ! 4049: SLL_R	sll 	%r22, %r0, %r29
	.word 0xb7aa0820  ! 4050: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xbda80c20  ! 4051: FMOVRLZ	dis not found

cpu_intr_1_317:
	setx	0x3f0018, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_282:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_282), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_wr_183:
	mov	0x2, %r14
	.word 0xf4f38e40  ! 4059: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_318:
	setx	0x3c0100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf2c4000  ! 4066: SLL_R	sll 	%r17, %r0, %r31
	.word 0xbfa4c820  ! 4067: FADDs	fadds	%f19, %f0, %f31
	.word 0xb7a488a0  ! 4069: FSUBs	fsubs	%f18, %f0, %f27
	.word 0xbba508c0  ! 4070: FSUBd	fsubd	%f20, %f0, %f60
	.word 0xbbaa8820  ! 4071: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xbb51c000  ! 4074: RDPR_TL	<illegal instruction>
	.word 0xb5a40840  ! 4077: FADDd	faddd	%f16, %f0, %f26
iob_intr_1_283:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_283), 16, 16)) -> intp(1, 0, 33)
T1_asi_reg_wr_184:
	mov	0x24, %r14
	.word 0xf4f38e80  ! 4084: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbba58920  ! 4085: FMULs	fmuls	%f22, %f0, %f29
iob_intr_1_284:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_284), 16, 16)) -> intp(1, 0, 21)
T1_asi_reg_rd_170:
	mov	0xc, %r14
	.word 0xf6db8400  ! 4088: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfa508a0  ! 4096: FSUBs	fsubs	%f20, %f0, %f31
	.word 0xb5a548c0  ! 4097: FSUBd	fsubd	%f52, %f0, %f26
iob_intr_1_285:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_285), 16, 16)) -> intp(1, 0, b)
iob_intr_1_286:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_286), 16, 16)) -> intp(1, 0, 7)
	.word 0xbbaa0820  ! 4102: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xbba84820  ! 4104: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb5a4c820  ! 4105: FADDs	fadds	%f19, %f0, %f26
iob_intr_1_287:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_287), 16, 16)) -> intp(1, 0, 13)
cpu_intr_1_319:
	setx	0x400102, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_171:
	mov	0x23, %r14
	.word 0xf8db8400  ! 4112: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb3a5c820  ! 4114: FADDs	fadds	%f23, %f0, %f25
cpu_intr_1_320:
	setx	0x410014, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_185:
	mov	0x1, %r14
	.word 0xf8f389e0  ! 4120: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbfa00020  ! 4121: FMOVs	fmovs	%f0, %f31
cpu_intr_1_321:
	setx	0x43022c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_288:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_288), 16, 16)) -> intp(1, 0, 22)
T1_asi_reg_wr_186:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 4132: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_289:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_289), 16, 16)) -> intp(1, 0, 32)
cpu_intr_1_322:
	setx	0x430307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80c20  ! 4135: FMOVRLZ	dis not found

	.word 0xb7a81820  ! 4138: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xb3a00020  ! 4145: FMOVs	fmovs	%f0, %f25
	.word 0xbba81c20  ! 4146: FMOVRGEZ	dis not found

	.word 0xb605e17d  ! 4149: ADD_I	add 	%r23, 0x017d, %r27
	.word 0xbfa9c820  ! 4151: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xbd2cd000  ! 4152: SLLX_R	sllx	%r19, %r0, %r30
	.word 0xb3a00540  ! 4153: FSQRTd	fsqrt	
	.word 0xb3aa8820  ! 4156: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb1a58960  ! 4158: FMULq	dis not found

	.word 0xb92d0000  ! 4160: SLL_R	sll 	%r20, %r0, %r28
cpu_intr_1_323:
	setx	0x43001c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_290:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_290), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb9a54820  ! 4164: FADDs	fadds	%f21, %f0, %f28
cpu_intr_1_324:
	setx	0x400202, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_325:
	setx	0x420305, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_187:
	mov	0x7, %r14
	.word 0xf4f38e80  ! 4173: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbba508c0  ! 4174: FSUBd	fsubd	%f20, %f0, %f60
	.word 0xbda44960  ! 4175: FMULq	dis not found

cpu_intr_1_326:
	setx	0x410001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a5c820  ! 4179: FADDs	fadds	%f23, %f0, %f24
	.word 0xbba588e0  ! 4182: FSUBq	dis not found

T1_asi_reg_rd_172:
	mov	0x1a, %r14
	.word 0xf4db8e40  ! 4188: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb1a489a0  ! 4191: FDIVs	fdivs	%f18, %f0, %f24
T1_asi_reg_rd_173:
	mov	0x2d, %r14
	.word 0xf8db8e80  ! 4194: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb3abc820  ! 4198: FMOVVC	fmovs	%fcc1, %f0, %f25
iob_intr_1_291:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_291), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_327:
	setx	0x41022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a489c0  ! 4210: FDIVd	fdivd	%f18, %f0, %f56
	.word 0xb5a98820  ! 4211: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xbfa5c920  ! 4213: FMULs	fmuls	%f23, %f0, %f31
	.word 0xb1ab0820  ! 4215: FMOVGU	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_188:
	mov	0x35, %r14
	.word 0xf4f384a0  ! 4216: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_1_328:
	setx	0x400316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a48940  ! 4222: FMULd	fmuld	%f18, %f0, %f58
	.word 0xb5a84820  ! 4226: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xbfa40860  ! 4227: FADDq	dis not found

iob_intr_1_292:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_292), 16, 16)) -> intp(1, 0, 27)
T1_asi_reg_wr_189:
	mov	0x3c8, %r14
	.word 0xf2f38e60  ! 4229: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb7a80820  ! 4230: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xbba90820  ! 4231: FMOVLEU	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_190:
	mov	0x3c1, %r14
	.word 0xf4f38e60  ! 4232: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T1_asi_reg_rd_174:
	mov	0x20, %r14
	.word 0xf6db8400  ! 4239: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb1a81820  ! 4241: FMOVRGZ	fmovs	%fcc3, %f0, %f24
T1_asi_reg_rd_175:
	mov	0xa, %r14
	.word 0xfadb8e40  ! 4242: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbba589e0  ! 4246: FDIVq	dis not found

	.word 0xb7a509e0  ! 4249: FDIVq	dis not found

iob_intr_1_293:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_293), 16, 16)) -> intp(1, 0, 1f)
cpu_intr_1_329:
	setx	0x43011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00520  ! 4252: FSQRTs	fsqrt	
iob_intr_1_294:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_294), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_330:
	setx	0x400336, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_295:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_295), 16, 16)) -> intp(1, 0, 6)
	.word 0xbda588c0  ! 4256: FSUBd	fsubd	%f22, %f0, %f30
	.word 0xbfab8820  ! 4257: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb3a00040  ! 4259: FMOVd	fmovd	%f0, %f56
cpu_intr_1_331:
	setx	0x420017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaad0000  ! 4265: ANDNcc_R	andncc 	%r20, %r0, %r29
	.word 0xb5a54860  ! 4266: FADDq	dis not found

	.word 0xbba58820  ! 4267: FADDs	fadds	%f22, %f0, %f29
	.word 0xb3a5c960  ! 4268: FMULq	dis not found

	.word 0xbb3cd000  ! 4269: SRAX_R	srax	%r19, %r0, %r29
T1_asi_reg_rd_176:
	mov	0x3c3, %r14
	.word 0xfadb8e40  ! 4271: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_1_332:
	setx	0x430226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a54920  ! 4274: FMULs	fmuls	%f21, %f0, %f26
cpu_intr_1_333:
	setx	0x40032c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_177:
	mov	0x25, %r14
	.word 0xfedb8e80  ! 4277: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T1_asi_reg_rd_178:
	mov	0x3c3, %r14
	.word 0xfcdb84a0  ! 4278: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_1_334:
	setx	0x40000a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_335:
	setx	0x400026, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_336:
	setx	0x41020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa8c820  ! 4287: FMOVL	fmovs	%fcc1, %f0, %f31
cpu_intr_1_337:
	setx	0x430133, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_296:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_296), 16, 16)) -> intp(1, 0, 30)
	.word 0xbfa409c0  ! 4294: FDIVd	fdivd	%f16, %f0, %f62
	.word 0xb7a50860  ! 4295: FADDq	dis not found

cpu_intr_1_338:
	setx	0x43003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_339:
	setx	0x400120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_340:
	setx	0x410119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab4820  ! 4301: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb60d4000  ! 4304: AND_R	and 	%r21, %r0, %r27
T1_asi_reg_rd_179:
	mov	0x3c1, %r14
	.word 0xfcdb84a0  ! 4308: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbf2c0000  ! 4310: SLL_R	sll 	%r16, %r0, %r31
iob_intr_1_297:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_297), 16, 16)) -> intp(1, 0, 25)
	.word 0xb5a4c9a0  ! 4313: FDIVs	fdivs	%f19, %f0, %f26
T1_asi_reg_rd_180:
	mov	0x3c4, %r14
	.word 0xfedb8e40  ! 4314: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_1_298:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_298), 16, 16)) -> intp(1, 0, f)
	.word 0xbda44960  ! 4317: FMULq	dis not found

cpu_intr_1_341:
	setx	0x40002e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_342:
	setx	0x410201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5508000  ! 4326: RDPR_TSTATE	<illegal instruction>
T1_asi_reg_wr_191:
	mov	0x2f, %r14
	.word 0xf0f384a0  ! 4327: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T1_asi_reg_rd_181:
	mov	0x3c3, %r14
	.word 0xf8db8400  ! 4328: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbe2420f6  ! 4329: SUB_I	sub 	%r16, 0x00f6, %r31
cpu_intr_1_343:
	setx	0x420310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a549a0  ! 4331: FDIVs	fdivs	%f21, %f0, %f27
	.word 0xbe34a074  ! 4334: SUBC_I	orn 	%r18, 0x0074, %r31
	.word 0xb3ab4820  ! 4335: FMOVCC	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_192:
	mov	0x22, %r14
	.word 0xf8f384a0  ! 4337: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbfa40840  ! 4339: FADDd	faddd	%f16, %f0, %f62
	.word 0xb3643801  ! 4342: MOVcc_I	<illegal instruction>
T1_asi_reg_wr_193:
	mov	0x31, %r14
	.word 0xf2f38e40  ! 4348: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbfa48960  ! 4349: FMULq	dis not found

T1_asi_reg_rd_182:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 4350: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb3aa8820  ! 4351: FMOVG	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_194:
	mov	0x3c2, %r14
	.word 0xf6f38e40  ! 4352: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb6bc20b2  ! 4353: XNORcc_I	xnorcc 	%r16, 0x00b2, %r27
	.word 0xb9a408c0  ! 4354: FSUBd	fsubd	%f16, %f0, %f28
cpu_intr_1_344:
	setx	0x410211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaac820  ! 4359: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xbba00040  ! 4361: FMOVd	fmovd	%f0, %f60
	.word 0xbfa00040  ! 4367: FMOVd	fmovd	%f0, %f62
	.word 0xb01560bb  ! 4372: OR_I	or 	%r21, 0x00bb, %r24
	.word 0xba25614f  ! 4373: SUB_I	sub 	%r21, 0x014f, %r29
T1_asi_reg_wr_195:
	mov	0x2, %r14
	.word 0xfcf38e80  ! 4378: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb1a408a0  ! 4379: FSUBs	fsubs	%f16, %f0, %f24
iob_intr_1_299:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_299), 16, 16)) -> intp(1, 0, 9)
cpu_intr_1_345:
	setx	0x430311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80820  ! 4387: FMOVN	fmovs	%fcc1, %f0, %f29
iob_intr_1_300:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_300), 16, 16)) -> intp(1, 0, 1b)
cpu_intr_1_346:
	setx	0x430216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a44940  ! 4394: FMULd	fmuld	%f48, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbc158000  ! 4400: OR_R	or 	%r22, %r0, %r30
iob_intr_1_301:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_301), 16, 16)) -> intp(1, 0, 12)
T1_asi_reg_rd_183:
	mov	0x11, %r14
	.word 0xfadb8e40  ! 4404: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbb2cf001  ! 4405: SLLX_I	sllx	%r19, 0x0001, %r29
	.word 0xb1a90820  ! 4406: FMOVLEU	fmovs	%fcc1, %f0, %f24
cpu_intr_1_347:
	setx	0x410227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a8c820  ! 4410: FMOVL	fmovs	%fcc1, %f0, %f26
cpu_intr_1_348:
	setx	0x410111, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_349:
	setx	0x410039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a44920  ! 4420: FMULs	fmuls	%f17, %f0, %f27
iob_intr_1_302:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_302), 16, 16)) -> intp(1, 0, 1b)
T1_asi_reg_rd_184:
	mov	0x2d, %r14
	.word 0xf0db8e40  ! 4425: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_wr_196:
	mov	0x3c4, %r14
	.word 0xfcf384a0  ! 4427: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb9a94820  ! 4428: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xb5a80820  ! 4434: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xb9a58960  ! 4435: FMULq	dis not found

cpu_intr_1_350:
	setx	0x43012c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_351:
	setx	0x410030, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_185:
	mov	0x16, %r14
	.word 0xf4db8e40  ! 4440: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbfa00520  ! 4441: FSQRTs	fsqrt	
cpu_intr_1_352:
	setx	0x410303, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_303:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_303), 16, 16)) -> intp(1, 0, 2e)
cpu_intr_1_353:
	setx	0x410330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a58960  ! 4456: FMULq	dis not found

cpu_intr_1_354:
	setx	0x400308, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_304:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_304), 16, 16)) -> intp(1, 0, 2a)
	.word 0xbda88820  ! 4465: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb7aac820  ! 4466: FMOVGE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_197:
	mov	0x1e, %r14
	.word 0xfcf38e80  ! 4468: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbfa00540  ! 4469: FSQRTd	fsqrt	
	.word 0xb3a54940  ! 4471: FMULd	fmuld	%f52, %f0, %f56
cpu_intr_1_355:
	setx	0x40031d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_186:
	mov	0x3c7, %r14
	.word 0xf6db8e40  ! 4478: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T1_asi_reg_wr_198:
	mov	0x34, %r14
	.word 0xfaf38e40  ! 4480: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb33df001  ! 4483: SRAX_I	srax	%r23, 0x0001, %r25
	.word 0xb5aac820  ! 4484: FMOVGE	fmovs	%fcc1, %f0, %f26
iob_intr_1_305:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_305), 16, 16)) -> intp(1, 0, 12)
	.word 0xb7a80c20  ! 4486: FMOVRLZ	dis not found

T1_asi_reg_rd_187:
	mov	0x1c, %r14
	.word 0xf0db8e40  ! 4487: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbda00020  ! 4492: FMOVs	fmovs	%f0, %f30
	.word 0xb69de124  ! 4493: XORcc_I	xorcc 	%r23, 0x0124, %r27
	.word 0xbda8c820  ! 4494: FMOVL	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_188:
	mov	0x3c5, %r14
	.word 0xf8db8e80  ! 4495: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb5a90820  ! 4496: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xb7ab4820  ! 4497: FMOVCC	fmovs	%fcc1, %f0, %f27
cpu_intr_1_356:
	setx	0x400001, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r23 + %g0] 0xf0, %f2
	.word 0xb5a4c960  ! 4503: FMULq	dis not found

iob_intr_1_306:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_306), 16, 16)) -> intp(1, 0, 36)
	.word 0xbfa90820  ! 4505: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xbba50920  ! 4511: FMULs	fmuls	%f20, %f0, %f29
T1_asi_reg_rd_189:
	mov	0x3c0, %r14
	.word 0xfadb89e0  ! 4512: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_1_307:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_307), 16, 16)) -> intp(1, 0, 15)
cpu_intr_1_357:
	setx	0x400307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb08dc000  ! 4519: ANDcc_R	andcc 	%r23, %r0, %r24
T1_asi_reg_wr_199:
	mov	0x4, %r14
	.word 0xfaf38e80  ! 4521: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_1_358:
	setx	0x410105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a54920  ! 4524: FMULs	fmuls	%f21, %f0, %f24
	.word 0xb73de001  ! 4527: SRA_I	sra 	%r23, 0x0001, %r27
	.word 0xb1a80820  ! 4529: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb9abc820  ! 4531: FMOVVC	fmovs	%fcc1, %f0, %f28
iob_intr_1_308:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_308), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbfa44940  ! 4535: FMULd	fmuld	%f48, %f0, %f62
iob_intr_1_309:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_309), 16, 16)) -> intp(1, 0, 4)
	.word 0xbba5c820  ! 4538: FADDs	fadds	%f23, %f0, %f29
	.word 0xbba80820  ! 4539: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xb1a4c820  ! 4545: FADDs	fadds	%f19, %f0, %f24
iob_intr_1_310:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_310), 16, 16)) -> intp(1, 0, 2a)
	.word 0xbba409c0  ! 4547: FDIVd	fdivd	%f16, %f0, %f60
T1_asi_reg_rd_190:
	mov	0x34, %r14
	.word 0xfcdb8e60  ! 4549: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_1_359:
	setx	0x410311, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_360:
	setx	0x400239, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_191:
	mov	0x3c3, %r14
	.word 0xfedb89e0  ! 4555: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_1_361:
	setx	0x420203, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_362:
	setx	0x42013b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_200:
	mov	0x1c, %r14
	.word 0xfcf38e60  ! 4560: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_1_363:
	setx	0x430328, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_201:
	mov	0x2e, %r14
	.word 0xf8f384a0  ! 4562: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_1_364:
	setx	0x460033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aac820  ! 4565: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xbd518000  ! 4568: RDPR_PSTATE	<illegal instruction>
	.word 0xbfaa8820  ! 4570: FMOVG	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_202:
	mov	0x30, %r14
	.word 0xf6f38e40  ! 4573: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_311:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_311), 16, 16)) -> intp(1, 0, 39)
cpu_intr_1_365:
	setx	0x44003f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_312:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_312), 16, 16)) -> intp(1, 0, 22)
	.word 0xbba509c0  ! 4588: FDIVd	fdivd	%f20, %f0, %f60
T1_asi_reg_rd_192:
	mov	0x25, %r14
	.word 0xf6db8e40  ! 4589: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T1_asi_reg_rd_193:
	mov	0x2f, %r14
	.word 0xf0db8e40  ! 4590: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb2952004  ! 4592: ORcc_I	orcc 	%r20, 0x0004, %r25
	.word 0xb9a80c20  ! 4594: FMOVRLZ	dis not found

cpu_intr_1_366:
	setx	0x460015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbab40000  ! 4596: ORNcc_R	orncc 	%r16, %r0, %r29
cpu_intr_1_367:
	setx	0x44001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a9c820  ! 4598: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xbba54820  ! 4600: FADDs	fadds	%f21, %f0, %f29
T1_asi_reg_rd_194:
	mov	0x2f, %r14
	.word 0xf4db8400  ! 4603: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb1a58820  ! 4606: FADDs	fadds	%f22, %f0, %f24
iob_intr_1_313:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_313), 16, 16)) -> intp(1, 0, 30)
	.word 0xb7a80420  ! 4608: FMOVRZ	dis not found

	.word 0xba346143  ! 4610: SUBC_I	orn 	%r17, 0x0143, %r29
	.word 0xb89c4000  ! 4612: XORcc_R	xorcc 	%r17, %r0, %r28
	.word 0xb5a588e0  ! 4618: FSUBq	dis not found

T1_asi_reg_wr_203:
	mov	0x3c3, %r14
	.word 0xf8f38e40  ! 4619: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_368:
	setx	0x470218, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_314:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_314), 16, 16)) -> intp(1, 0, 2c)
	.word 0xbfa588e0  ! 4622: FSUBq	dis not found

	.word 0xb61c4000  ! 4623: XOR_R	xor 	%r17, %r0, %r27
iob_intr_1_315:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_315), 16, 16)) -> intp(1, 0, 34)
T1_asi_reg_wr_204:
	mov	0xa, %r14
	.word 0xf2f38e40  ! 4626: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_369:
	setx	0x440020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe2da0d0  ! 4631: ANDN_I	andn 	%r22, 0x00d0, %r31
T1_asi_reg_rd_195:
	mov	0x3c8, %r14
	.word 0xfadb8e80  ! 4634: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T1_asi_reg_rd_196:
	mov	0x3c0, %r14
	.word 0xfcdb8e80  ! 4638: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T1_asi_reg_rd_197:
	mov	0x38, %r14
	.word 0xfadb8e60  ! 4639: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbc344000  ! 4641: ORN_R	orn 	%r17, %r0, %r30
iob_intr_1_316:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_316), 16, 16)) -> intp(1, 0, 3d)
T1_asi_reg_wr_205:
	mov	0x4, %r14
	.word 0xf0f389e0  ! 4647: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb53c5000  ! 4648: SRAX_R	srax	%r17, %r0, %r26
iob_intr_1_317:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_317), 16, 16)) -> intp(1, 0, 2a)
	.word 0xbdab4820  ! 4651: FMOVCC	fmovs	%fcc1, %f0, %f30
cpu_intr_1_370:
	setx	0x450207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80420  ! 4655: FMOVRZ	dis not found

T1_asi_reg_wr_206:
	mov	0x1, %r14
	.word 0xf2f38e40  ! 4657: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb5abc820  ! 4658: FMOVVC	fmovs	%fcc1, %f0, %f26
cpu_intr_1_371:
	setx	0x44011d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_372:
	setx	0x470114, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_318:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_318), 16, 16)) -> intp(1, 0, 17)
iob_intr_1_319:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_319), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_wr_207:
	mov	0x14, %r14
	.word 0xf4f38e60  ! 4669: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_1_320:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_320), 16, 16)) -> intp(1, 0, 29)
	.word 0xb1a90820  ! 4673: FMOVLEU	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_198:
	mov	0x3c6, %r14
	.word 0xf8db89e0  ! 4674: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_1_321:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_321), 16, 16)) -> intp(1, 0, 7)
cpu_intr_1_373:
	setx	0x45011f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_374:
	setx	0x47020d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_199:
	mov	0x26, %r14
	.word 0xfadb89e0  ! 4681: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb3a5c8e0  ! 4684: FSUBq	dis not found

iob_intr_1_322:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_322), 16, 16)) -> intp(1, 0, 12)
T1_asi_reg_rd_200:
	mov	0x1e, %r14
	.word 0xf0db84a0  ! 4690: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb3aac820  ! 4693: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xbda40860  ! 4696: FADDq	dis not found

	.word 0xb9a00540  ! 4697: FSQRTd	fsqrt	
T1_asi_reg_wr_208:
	mov	0x3c2, %r14
	.word 0xf2f38400  ! 4701: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_1_375:
	setx	0x440311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00520  ! 4705: FSQRTs	fsqrt	
iob_intr_1_323:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_323), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb3a588a0  ! 4707: FSUBs	fsubs	%f22, %f0, %f25
	.word 0xbbabc820  ! 4711: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb7a488e0  ! 4712: FSUBq	dis not found

	.word 0xb9a80420  ! 4713: FMOVRZ	dis not found

	.word 0xbfa48960  ! 4714: FMULq	dis not found

	lda	[%r22 + %g0] 0xf0, %f2
iob_intr_1_324:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_324), 16, 16)) -> intp(1, 0, 1e)
iob_intr_1_325:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_325), 16, 16)) -> intp(1, 0, 3f)
T1_asi_reg_wr_209:
	mov	0x3c5, %r14
	.word 0xf4f389e0  ! 4724: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb03420e1  ! 4725: ORN_I	orn 	%r16, 0x00e1, %r24
T1_asi_reg_rd_201:
	mov	0x3c7, %r14
	.word 0xfadb8e40  ! 4727: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_wr_210:
	mov	0xd, %r14
	.word 0xf0f384a0  ! 4728: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_1_326:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_326), 16, 16)) -> intp(1, 0, 23)
cpu_intr_1_376:
	setx	0x460134, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_202:
	mov	0x3c8, %r14
	.word 0xfedb89e0  ! 4732: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T1_asi_reg_wr_211:
	mov	0x3c5, %r14
	.word 0xfef38400  ! 4733: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_1_377:
	setx	0x460008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80420  ! 4735: FMOVRZ	dis not found

cpu_intr_1_378:
	setx	0x470303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a549c0  ! 4739: FDIVd	fdivd	%f52, %f0, %f24
	.word 0xbba8c820  ! 4740: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xbfa9c820  ! 4744: FMOVVS	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_203:
	mov	0x3c2, %r14
	.word 0xfedb8e40  ! 4745: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbba549c0  ! 4746: FDIVd	fdivd	%f52, %f0, %f60
	.word 0xbda448a0  ! 4747: FSUBs	fsubs	%f17, %f0, %f30
T1_asi_reg_rd_204:
	mov	0x16, %r14
	.word 0xfcdb8e40  ! 4757: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_wr_212:
	mov	0x3c3, %r14
	.word 0xf6f38e40  ! 4759: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_379:
	setx	0x44000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaa4820  ! 4762: FMOVNE	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_205:
	mov	0x3c5, %r14
	.word 0xf0db8400  ! 4763: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbe0560b2  ! 4764: ADD_I	add 	%r21, 0x00b2, %r31
iob_intr_1_327:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_327), 16, 16)) -> intp(1, 0, 36)
iob_intr_1_328:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_328), 16, 16)) -> intp(1, 0, 8)
	.word 0xb244202e  ! 4771: ADDC_I	addc 	%r16, 0x002e, %r25
	.word 0xbda98820  ! 4772: FMOVNEG	fmovs	%fcc1, %f0, %f30
cpu_intr_1_380:
	setx	0x46001b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_213:
	mov	0x38, %r14
	.word 0xfcf38e60  ! 4774: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb7a00540  ! 4775: FSQRTd	fsqrt	
T1_asi_reg_rd_206:
	mov	0x1d, %r14
	.word 0xfcdb8e40  ! 4778: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_381:
	setx	0x450118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00560  ! 4783: FSQRTq	fsqrt	
	.word 0xb7a4c920  ! 4785: FMULs	fmuls	%f19, %f0, %f27
	lda	[%r23 + %g0] 0xf0, %f2
	.word 0xbba4c960  ! 4789: FMULq	dis not found

	.word 0xb0256156  ! 4793: SUB_I	sub 	%r21, 0x0156, %r24
	.word 0xbfa408c0  ! 4799: FSUBd	fsubd	%f16, %f0, %f62
T1_asi_reg_wr_214:
	mov	0x38, %r14
	.word 0xf2f389e0  ! 4800: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_1_329:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_329), 16, 16)) -> intp(1, 0, 11)
	.word 0xb1a5c840  ! 4805: FADDd	faddd	%f54, %f0, %f24
	.word 0xb1a58860  ! 4807: FADDq	dis not found

iob_intr_1_330:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_330), 16, 16)) -> intp(1, 0, 4)
T1_asi_reg_rd_207:
	mov	0x7, %r14
	.word 0xf0db8e60  ! 4810: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_1_331:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_331), 16, 16)) -> intp(1, 0, 2c)
iob_intr_1_332:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_332), 16, 16)) -> intp(1, 0, 1b)
T1_asi_reg_rd_208:
	mov	0x20, %r14
	.word 0xfedb8e40  ! 4813: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbda54940  ! 4816: FMULd	fmuld	%f52, %f0, %f30
	.word 0xb1aa8820  ! 4818: FMOVG	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_209:
	mov	0x3c3, %r14
	.word 0xfedb89e0  ! 4823: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbda90820  ! 4824: FMOVLEU	fmovs	%fcc1, %f0, %f30
iob_intr_1_333:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_333), 16, 16)) -> intp(1, 0, 27)
T1_asi_reg_wr_215:
	mov	0x3c6, %r14
	.word 0xf0f38e60  ! 4830: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb9a80820  ! 4831: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb7a94820  ! 4833: FMOVCS	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a9c820  ! 4837: FMOVVS	fmovs	%fcc1, %f0, %f24
cpu_intr_1_382:
	setx	0x440328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9354000  ! 4839: SRL_R	srl 	%r21, %r0, %r28
T1_asi_reg_rd_210:
	mov	0x3c4, %r14
	.word 0xf0db8e60  ! 4840: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb3ab8820  ! 4842: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xbbabc820  ! 4844: FMOVVC	fmovs	%fcc1, %f0, %f29
cpu_intr_1_383:
	setx	0x440205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a90820  ! 4849: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xbda5c9a0  ! 4851: FDIVs	fdivs	%f23, %f0, %f30
	.word 0xbfa4c8c0  ! 4852: FSUBd	fsubd	%f50, %f0, %f62
cpu_intr_1_384:
	setx	0x450029, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_385:
	setx	0x450317, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_334:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_334), 16, 16)) -> intp(1, 0, 15)
cpu_intr_1_386:
	setx	0x460124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb69c8000  ! 4866: XORcc_R	xorcc 	%r18, %r0, %r27
	.word 0xbda81820  ! 4867: FMOVRGZ	fmovs	%fcc3, %f0, %f30
cpu_intr_1_387:
	setx	0x470139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb20d60ac  ! 4871: AND_I	and 	%r21, 0x00ac, %r25
T1_asi_reg_rd_211:
	mov	0x3c6, %r14
	.word 0xfedb8e40  ! 4873: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_1_388:
	setx	0x440333, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_335:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_335), 16, 16)) -> intp(1, 0, e)
cpu_intr_1_389:
	setx	0x46012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_336:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_336), 16, 16)) -> intp(1, 0, 33)
cpu_intr_1_390:
	setx	0x45030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00560  ! 4883: FSQRTq	fsqrt	
iob_intr_1_337:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_337), 16, 16)) -> intp(1, 0, 9)
	.word 0xb3a00540  ! 4886: FSQRTd	fsqrt	
	.word 0xbe3c60a8  ! 4891: XNOR_I	xnor 	%r17, 0x00a8, %r31
iob_intr_1_338:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_338), 16, 16)) -> intp(1, 0, 21)
T1_asi_reg_rd_212:
	mov	0x3c1, %r14
	.word 0xf0db84a0  ! 4897: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_1_339:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_339), 16, 16)) -> intp(1, 0, 27)
T1_asi_reg_wr_216:
	mov	0x3c0, %r14
	.word 0xfef389e0  ! 4900: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb3a88820  ! 4903: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xbfa9c820  ! 4904: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xb9a448c0  ! 4906: FSUBd	fsubd	%f48, %f0, %f28
cpu_intr_1_391:
	setx	0x460316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00540  ! 4910: FSQRTd	fsqrt	
cpu_intr_1_392:
	setx	0x450002, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_213:
	mov	0x3c6, %r14
	.word 0xfedb8e60  ! 4916: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb1a00540  ! 4919: FSQRTd	fsqrt	
T1_asi_reg_wr_217:
	mov	0x18, %r14
	.word 0xf2f38e40  ! 4921: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_1_393:
	setx	0x47013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00540  ! 4926: FSQRTd	fsqrt	
	.word 0xb1a589c0  ! 4930: FDIVd	fdivd	%f22, %f0, %f24
	.word 0xb2250000  ! 4931: SUB_R	sub 	%r20, %r0, %r25
iob_intr_1_340:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_340), 16, 16)) -> intp(1, 0, 35)
	.word 0xb3a80820  ! 4936: FMOVN	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_218:
	mov	0x13, %r14
	.word 0xf6f38400  ! 4937: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb1a408a0  ! 4941: FSUBs	fsubs	%f16, %f0, %f24
T1_asi_reg_rd_214:
	mov	0x3c7, %r14
	.word 0xf4db8e40  ! 4942: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbfa00540  ! 4943: FSQRTd	fsqrt	
	.word 0xb93ca001  ! 4944: SRA_I	sra 	%r18, 0x0001, %r28
	.word 0xb1a81420  ! 4945: FMOVRNZ	dis not found

cpu_intr_1_394:
	setx	0x10304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb68de089  ! 4948: ANDcc_I	andcc 	%r23, 0x0089, %r27
T1_asi_reg_rd_215:
	mov	0x1b, %r14
	.word 0xfedb8400  ! 4949: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbba549e0  ! 4950: FDIVq	dis not found

	lda	[%r17 + %g0] 0xf0, %f2
iob_intr_1_341:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_341), 16, 16)) -> intp(1, 0, 35)
iob_intr_1_342:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_342), 16, 16)) -> intp(1, 0, 33)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3a81820  ! 4961: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xbda81820  ! 4962: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb5a8c820  ! 4964: FMOVL	fmovs	%fcc1, %f0, %f26
iob_intr_1_343:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_343), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_rd_216:
	mov	0x3c8, %r14
	.word 0xf8db8400  ! 4967: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbb340000  ! 4969: SRL_R	srl 	%r16, %r0, %r29
	.word 0xb1ab0820  ! 4970: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb9a00560  ! 4972: FSQRTq	fsqrt	
iob_intr_1_344:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_344), 16, 16)) -> intp(1, 0, 17)
	.word 0xb3a80420  ! 4975: FMOVRZ	dis not found

T1_asi_reg_wr_219:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 4978: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_rd_217:
	mov	0x23, %r14
	.word 0xfcdb8e80  ! 4979: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb7a00560  ! 4981: FSQRTq	fsqrt	
cpu_intr_1_395:
	setx	0x47021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba81820  ! 4984: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xbdab0820  ! 4986: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb1a4c8c0  ! 4987: FSUBd	fsubd	%f50, %f0, %f24
	.word 0xb3a00540  ! 4996: FSQRTd	fsqrt	
iob_intr_1_345:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_345), 16, 16)) -> intp(1, 0, 26)

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

	.xword	0x24f84914f4f40839
	.xword	0xb5a5b62b3a5a19fe
	.xword	0x6323e0e63d7d5c79
	.xword	0xce6ea8c305b3f261
	.xword	0x1641077f6c66c19f
	.xword	0xff0a44ddb182e668
	.xword	0x51402b258e49f24d
	.xword	0x38fb70f3a7690bc9
	.xword	0x9b7948e729baddfc
	.xword	0xc5e6bf88665f5dc5
	.xword	0x31dda53807025ea6
	.xword	0xfc3bf908769e04a4
	.xword	0x137fbccf4fc717e7
	.xword	0xeef35be58d8740fa
	.xword	0x5988ba6f56134086
	.xword	0xf5b18cb5036c0023
	.xword	0x03067c53a4851c59
	.xword	0xba9222a19623eb5f
	.xword	0xc128df9703e28728
	.xword	0x66d6d31af1fd1b31
	.xword	0xdfc6134636399a98
	.xword	0x37198bacde7ff671
	.xword	0x9ecf53793a4dca6c
	.xword	0xd9cd1181d470e24c
	.xword	0x51cbff1ab223e242
	.xword	0x4a5e58d5a5b24a77
	.xword	0xb7d03e0686906edb
	.xword	0xd2a412e698e1bb52
	.xword	0x72600623bbd791a2
	.xword	0x9d832037ae44a607
	.xword	0x03cdb09c01cf7adc
	.xword	0x9960559b1a067056
	.xword	0x03d7820d821d4601
	.xword	0x9701ef158172b937
	.xword	0x3c5af078e3b0991b
	.xword	0xdf62c75eaa565257
	.xword	0xf136fdbeba85e509
	.xword	0x61ba341328323c05
	.xword	0x5a31a3cf603bdf1f
	.xword	0x43eacfd2ee3c38e2
	.xword	0xaada4875ae0d22bb
	.xword	0x9f00b46230bfef62
	.xword	0x801f1c30b3abbf00
	.xword	0x354f85ee98ce23bf
	.xword	0x62a636f25f0bcf2b
	.xword	0x0974ddecdc40fd7c
	.xword	0x95240b1891796580
	.xword	0x53e2d586637e18ed
	.xword	0x4e2c13db38b8cfd5
	.xword	0x20da574b94d3916b
	.xword	0xc60a91ab127978a5
	.xword	0x34a62b470b3f049f
	.xword	0x1c3e8eed12a157b2
	.xword	0x01c41484ac0901be
	.xword	0xdead1930f5fca584
	.xword	0x60b968a9ae252141
	.xword	0xc1265ba8cd72d8a1
	.xword	0xcb0f1569efb15386
	.xword	0x095c1bf569df3aaa
	.xword	0x2db7ee84ab5a8379
	.xword	0xac01af15e5cd011c
	.xword	0x73af79a3ddf6c080
	.xword	0xa7af09750104f877
	.xword	0x0cb29c0e7c861344
	.xword	0xd9b884c4fee05827
	.xword	0x1ec2059b9723640b
	.xword	0x8b9111db3987216e
	.xword	0x9278f071009f3ba3
	.xword	0xa288e42c30b827cd
	.xword	0xbb45ce6f36203a97
	.xword	0x3b4e7b9330820e9b
	.xword	0xe0a653967e4adea3
	.xword	0xbfa4ef9159a0604d
	.xword	0xc9e6a48b4ec36242
	.xword	0xdf6b7cd1d18c886c
	.xword	0xd779d7d72c0b6ee1
	.xword	0x4daa2a11463cc31d
	.xword	0xedd6cde2a935084c
	.xword	0xd34ecda7b8cafe6a
	.xword	0x01ff589f448b2065
	.xword	0x152dddcc4f6e1bbf
	.xword	0x53f15487ebd7f68e
	.xword	0x2ebb47f123ceca40
	.xword	0x206051533b2c1ad8
	.xword	0x1353517d83deb4cd
	.xword	0x6890d6f293050bfb
	.xword	0x3dc9441debf5c408
	.xword	0xc5964ef2e9247421
	.xword	0xceb72bb0a257c702
	.xword	0x498a798269ad277d
	.xword	0x346f63f8add73b29
	.xword	0xc5502c95f67e0aa3
	.xword	0x05c5ed6192541411
	.xword	0x9c24185185b82d3f
	.xword	0x34f6aa93c8f9f3a7
	.xword	0x27e35d15b86c8012
	.xword	0x3d33a0b8db0de400
	.xword	0x10b7452ddcf705b4
	.xword	0xd5ffa55d06234c3f
	.xword	0x57a11f88c15be7ed
	.xword	0xc98849b330d620b5
	.xword	0x953188a8c3818281
	.xword	0x72e20af202294f6f
	.xword	0xa38692d8d92bf955
	.xword	0x7e5053ec486abf25
	.xword	0x2ef3380f6e6ed67d
	.xword	0x8a0bcbaeb3fba94e
	.xword	0x674619773ad978ee
	.xword	0x9b6d284f08d22705
	.xword	0x75793818363b6179
	.xword	0xe463f703a0767238
	.xword	0x2a49c24267942b5e
	.xword	0x4724b67841c776f0
	.xword	0xcd8694993f651b7c
	.xword	0x46c54e41bba24e1b
	.xword	0xbefebd1a2af03e0b
	.xword	0x8569de891e302762
	.xword	0x5e895ee52344904d
	.xword	0xce6638a02d4fe2da
	.xword	0x0ec66e6177e17c38
	.xword	0xd712b5d85270a1cc
	.xword	0xe171f253b8e2d176
	.xword	0xb02e71690b93bfbb
	.xword	0xbd3579824af80e2d
	.xword	0xfbdd68eac1956595
	.xword	0xa3314713af6d865d
	.xword	0x539217d7a503bd0d
	.xword	0x6467e5311438a2ac
	.xword	0x2b3144f4d5e1d4dc
	.xword	0xd9bb5b91fe6086e5
	.xword	0xc3acb75a1fc18b93
	.xword	0xf0c868804a68d083
	.xword	0xd0ab7a878beb51a9
	.xword	0x377fde276f13ac86
	.xword	0xbecc72d31dd04608
	.xword	0x34fd41611a103dac
	.xword	0x6fa42d153ef45f18
	.xword	0xc22277f2b987e246
	.xword	0xf516b56933134e33
	.xword	0x52accd193a65bde8
	.xword	0x40545cfa1d451ce5
	.xword	0x3953d5e4c6b2a51c
	.xword	0xb832391bcc61ebd6
	.xword	0xe9d91f3c8687d6a5
	.xword	0xaa46673d4ec3d0d7
	.xword	0x1483caee879fb82f
	.xword	0xe8ff7e8d7ae48a65
	.xword	0xcaa35557b7941a14
	.xword	0xea1cb7eff5e20115
	.xword	0x7a3b58d1dd055ea7
	.xword	0xa4a7a572ffaa7ce0
	.xword	0x224cde3984ebbbf4
	.xword	0xa493837aef454670
	.xword	0xcc31a957f000f936
	.xword	0xabff3c4df8fed5f6
	.xword	0x6bfeb9c43d6545ac
	.xword	0xb1ba8a0c5714b8e5
	.xword	0x3947fe1dddd45385
	.xword	0xae97fb12977b5b95
	.xword	0x81529d50d8e7fc6e
	.xword	0xaa5fa6f19a66db7a
	.xword	0x48abc0df935ae9c5
	.xword	0x18dbb985d9c86bd1
	.xword	0x0d6c51f0b4b551cc
	.xword	0xb2ea6a1e53d74913
	.xword	0xea4fac97bf88ecc6
	.xword	0x9541001dd0075813
	.xword	0x0a51dd60eaa3486a
	.xword	0xb6bf97a45b9a680a
	.xword	0x578b66415d78001d
	.xword	0xce03bfa0f1bd61c0
	.xword	0xa0bd240d535fb77d
	.xword	0x6b95d100420c36a7
	.xword	0xf5ef7d1b82eef95b
	.xword	0xcfa5cdb074607e67
	.xword	0xd6cbd5843c1ade50
	.xword	0x4b53c5ac902effd0
	.xword	0x13a18ac1e5efac32
	.xword	0x558c14c9c94ae39d
	.xword	0x9e5b899e56c0624e
	.xword	0x20b5a5d5ea145ddb
	.xword	0xfb3573c72ab82452
	.xword	0xe4ce0c489ccb4886
	.xword	0x6ab1f3e0116efe29
	.xword	0x67c09aa27ebcabc2
	.xword	0x8c3806bd57079feb
	.xword	0xd86903d902aaedd0
	.xword	0xb64ea1302cd688c6
	.xword	0x2faceae92429a9b9
	.xword	0xea0a9958c334667c
	.xword	0xa8a8dd47096bc96f
	.xword	0x446f6d824ee4b919
	.xword	0x0c45ea6c97e3fc50
	.xword	0x69bbb05e637f06b4
	.xword	0xc5407a021b2184a4
	.xword	0xf645bd729e278194
	.xword	0x6371b5f125f0d73e
	.xword	0x4d4ac023e36ac7e9
	.xword	0x450d97856702699d
	.xword	0x916b270cf6db55c8
	.xword	0xd23cad956bcb1eb8
	.xword	0x61fdb866f48d8dd6
	.xword	0xd00dbf200f2a1a87
	.xword	0xc3802eb8ac1b20c8
	.xword	0x0b6ecdf39369f6f7
	.xword	0x63856499b4f5bd79
	.xword	0x77715d18f65c8c11
	.xword	0x65d3ba1730292412
	.xword	0x8ba97f769dcc91f1
	.xword	0x6fa1ba4dbb5ca3f3
	.xword	0x7570aa04f70aafd6
	.xword	0x20924bd238c34f2a
	.xword	0xedac366b5aaa459d
	.xword	0x60557a8c033d733b
	.xword	0x750b2ee9d9dcbfee
	.xword	0x617d2fe68269b796
	.xword	0x6fb7fe890aa921a2
	.xword	0x02ec818fbd32620a
	.xword	0x2421b50411bc6b9c
	.xword	0x8a433b229bc796ce
	.xword	0x21db81e6691e139a
	.xword	0x570a7455aafec907
	.xword	0xf4e56fd38e01c507
	.xword	0xed232dd512d56d38
	.xword	0x7586733088b9f318
	.xword	0x794d880052c17b8f
	.xword	0x5b0f1cf904d7ebbe
	.xword	0x2eefff7256bd588d
	.xword	0x26f8b9e2d3641af7
	.xword	0xd507fdfe4aa0a615
	.xword	0xa0fa18ee06a038bd
	.xword	0xc4fecc0f9c72779a
	.xword	0xeba9486c3b6bf3d0
	.xword	0x92590d42263fda8a
	.xword	0xdd43673f7df47ecc
	.xword	0x7e9cac6bed47d71a
	.xword	0x935166695961c325
	.xword	0x31cefb4fe37a5ebd
	.xword	0xce32f70240ce334c
	.xword	0x4a1a84dfc1e77680
	.xword	0x8feb3c2ef2031a7c
	.xword	0x3995db93f95969f2
	.xword	0xbf83d579890d760f
	.xword	0x47bd585a4097b9c0
	.xword	0xa06ae6b5359c3436
	.xword	0xa806b90c649af5e1
	.xword	0x5bb0c9686a2068f0
	.xword	0xabfeee1d7da2a65f
	.xword	0x5b2be13322a7e6af
	.xword	0xcca895a6a2dc4a6b
	.xword	0xc5d8a1ab7e9a722b
	.xword	0x67414c8941a3e7df
	.xword	0xa75f086250d20891
	.xword	0xc47127e797d443b6
	.xword	0xe241a3acd94c8757
	.xword	0xd4f7890320713bd6
	.align 0x2000
	.data
data_start_1:

	.xword	0x555baa22ec9212eb
	.xword	0x4b318d2488200d1b
	.xword	0xe4a6c34c5f989eb4
	.xword	0xc05e712ea179c5ad
	.xword	0x45bbcb3e50853571
	.xword	0xcc2fcb81a23591d5
	.xword	0x4535f851eff53098
	.xword	0x385f840b8638d416
	.xword	0x9530866de1ab2c44
	.xword	0xaa2a5b2456b0504f
	.xword	0x3e59ca5ca17464fc
	.xword	0xe9def9ce9bb91991
	.xword	0xc965faea53ec12a4
	.xword	0x5bc4590f89aa1ae6
	.xword	0x9301ff73b2edf282
	.xword	0x7bc1163e738eb9d6
	.xword	0xd0c7473774ae12b5
	.xword	0xf5121d35283d974c
	.xword	0x8d68124706c879ab
	.xword	0x2c62c5b201e8ae71
	.xword	0x14dc7cd8a7d4b552
	.xword	0xd35174f38e639840
	.xword	0x462f254bf3ebf8c3
	.xword	0xea53e5ec6c24933f
	.xword	0x580634349383a393
	.xword	0x519b6a6201954e1c
	.xword	0x13dfba4e968dc680
	.xword	0x1686931b2f98ca31
	.xword	0x802d2aa75cb9ca70
	.xword	0x72fa23de9c293764
	.xword	0x669281812625325b
	.xword	0x0b87eba1c1c8d1e9
	.xword	0xe908e1b886cbf4e6
	.xword	0xfe65bc0f80ff738b
	.xword	0x954397c886338800
	.xword	0x1c09ecb0582139f8
	.xword	0x25fd12bb6966c89a
	.xword	0x3f0ffceeffa234f2
	.xword	0x6bfb0b8fdf76c3d8
	.xword	0xc675ed2e01b5b361
	.xword	0x95a277526f36dfec
	.xword	0x4f7623bc4e294795
	.xword	0xce4ced87a224385a
	.xword	0xb4901e8ad929bca9
	.xword	0xac18743900f34c6e
	.xword	0x80e6acd8aa045b15
	.xword	0xad7d1b4c9149a0de
	.xword	0xe92674d5025a8189
	.xword	0x1799675954ff585d
	.xword	0x5473b37911b4f743
	.xword	0xcd9f890ad2a576d6
	.xword	0x4cce85d338e98c4c
	.xword	0x77ce459e2410fb83
	.xword	0xb3c2a733314aab3e
	.xword	0xbbc06659719633a2
	.xword	0xd5202457db69f66c
	.xword	0xdbcb3e08431da975
	.xword	0x451834e98aebc1f2
	.xword	0x4c14f6b8a816c32b
	.xword	0xe508de8a1aeac82a
	.xword	0xf336d9379c25b7cd
	.xword	0x51313ef660ba1ccd
	.xword	0xc2c271c4a8a6db71
	.xword	0xb6fda760a6b16565
	.xword	0x345952198efaa6e5
	.xword	0x312018d2e59552fd
	.xword	0x0b50c8ebe792a7f1
	.xword	0x69d1b0c8955677c0
	.xword	0xf3235dd328fca0ac
	.xword	0x0d90ec4823e12747
	.xword	0xb2053f435e170d8b
	.xword	0x8581f4c3ab815953
	.xword	0x3b7008883ccc13db
	.xword	0xf840fa839a1dfb43
	.xword	0x893e50a370865d7a
	.xword	0x35aba4d007bfc103
	.xword	0xf7b6ffcfaa60e43b
	.xword	0x38f8190fad924877
	.xword	0x72c22909a2b87e12
	.xword	0x0853726e7e8c02f9
	.xword	0x8adc026da78b67a6
	.xword	0x1812510279ef545a
	.xword	0x3991c8ba97d85144
	.xword	0xd150d7adb42bc24b
	.xword	0x4e29f8818e0fda16
	.xword	0xa742a8f86eff6e4a
	.xword	0x626eb73dc70ed8c3
	.xword	0x33727d427786bf9e
	.xword	0x10117b4c434e1415
	.xword	0x8de6e336b615ef8b
	.xword	0x2bb85105bba7230d
	.xword	0xf25f3d276aad5ee0
	.xword	0x5ddb1a1c64c2c96c
	.xword	0x40e91f404346f4a3
	.xword	0xed10a3a7f24b698a
	.xword	0x8ff317f05f5db73f
	.xword	0xaeda2d4bfec98597
	.xword	0x80d72f1c67c2bf0e
	.xword	0x647c7dc1f8a759f0
	.xword	0x5e7b27b3a48fc435
	.xword	0xa4a3f3dd15aee57f
	.xword	0x42dce92aa03e9097
	.xword	0x2429f89b1195e378
	.xword	0x85c6af82c86e0f8d
	.xword	0x34b923b2275bbea5
	.xword	0x5a27a2ee28dd067c
	.xword	0xb87cf84559c9bfe9
	.xword	0x0106e7ae16db40d4
	.xword	0x635926c15b89e92f
	.xword	0xaf78df93e5e64338
	.xword	0x060cce9180ff5ecb
	.xword	0x68b0984a77f86850
	.xword	0xaf80e8d43969045d
	.xword	0x95c2e649d1a34269
	.xword	0x3e85dc2a555261ce
	.xword	0x60ffb56d115d7132
	.xword	0x7ae8d1b277f8a9f5
	.xword	0xf7f4162c841fb995
	.xword	0xabae9d74b2aebf21
	.xword	0x8bed756839bc357e
	.xword	0x78a72420ed9f38f1
	.xword	0xc2845a5b7eae070c
	.xword	0x461c396fe878bedc
	.xword	0xfdd0f5c76502788a
	.xword	0x8d7639976250044e
	.xword	0xa64dfedc6ac7603e
	.xword	0x752c6cf7cd8cf660
	.xword	0xe0ccf7757c95e9f5
	.xword	0xe16f955fa5e0281d
	.xword	0xf8ffb9991a97450d
	.xword	0x616de766d619fe93
	.xword	0x5ff7ac1bb06bdbd8
	.xword	0xc6d05bc901402308
	.xword	0x5ba08dc6c3a4cd77
	.xword	0x694bfae437ffed17
	.xword	0x0a1322c1710571e4
	.xword	0xde28605c2507ee6f
	.xword	0xf57400bdaa6832ec
	.xword	0x5b9ae0b16e5b0100
	.xword	0x44b532d49fda7690
	.xword	0x289e48048ee77a8d
	.xword	0x2765da7770eaab97
	.xword	0x351cd9fa2aaadf9d
	.xword	0x7f58586d81c6d41f
	.xword	0x423a0240720534a2
	.xword	0xa839a524286b9f3f
	.xword	0xc026bb7e5ab54202
	.xword	0xb2cd1a12e9d26618
	.xword	0x196eca1a400ea696
	.xword	0x3a228990890359ab
	.xword	0x92c1965201c8acd0
	.xword	0x909ba9347ffca351
	.xword	0x4dde2b1d81807910
	.xword	0xccabf3e540b96e63
	.xword	0xba7ddc82bc588f9d
	.xword	0x66a0a9283b547f9d
	.xword	0x9bb39955dffc7ef2
	.xword	0x212842422d724892
	.xword	0xe3d98aedd48c6f8d
	.xword	0xc1a6e0c852279676
	.xword	0xa889d5793b8d2d87
	.xword	0x1c4ab2aff5981b01
	.xword	0xdfc3abd31a08cd59
	.xword	0xca6218474b1e4e10
	.xword	0xb8e6eb574899ae05
	.xword	0x18c9db1b5f06e1bf
	.xword	0xaa4dc764658ac4d7
	.xword	0x65d0e15ba415ad04
	.xword	0x8f3db6b772e4b0a4
	.xword	0xb89968c2a27c0739
	.xword	0x4ccdf3a56d3be23a
	.xword	0xdd4a85cdd53ccd31
	.xword	0x10307241c8b973ce
	.xword	0x1c084144464e07bf
	.xword	0x8249df634a3310a9
	.xword	0xd3f2983a209143b0
	.xword	0x30a5f45374b6287a
	.xword	0xd41a882a59c38eae
	.xword	0xe8a07793cd12886e
	.xword	0x0b41697b618922a8
	.xword	0xa6c78b2c89e7d939
	.xword	0x7cd5e23884544335
	.xword	0x44c4bbb1fcee9ec8
	.xword	0x88e2a2c2999170ed
	.xword	0x40d8571351e2e91b
	.xword	0x75b82b51d4289270
	.xword	0x87838dbb6392c26d
	.xword	0xf49fb92e36cc553f
	.xword	0xd6ce04ef787bea7e
	.xword	0x31e2421786277ea1
	.xword	0x9b79107b21f08215
	.xword	0x80c8ee592c2b5f59
	.xword	0xfd9d28484e59248c
	.xword	0x087ecd3dc53b6462
	.xword	0x5e1bcb85e1b287de
	.xword	0xe1fbeda3b133b3b6
	.xword	0xfbb624c4c2e2feff
	.xword	0x4a7ec8f74fbd0c81
	.xword	0xdf09b3e22cf0771d
	.xword	0x7771f0fb6f81439b
	.xword	0xc15c62eb3cc2de50
	.xword	0x06c942966e88eb60
	.xword	0xb19ce6cef1a19d5e
	.xword	0x31be96df51a7e2b0
	.xword	0xb714738514c0f64b
	.xword	0x826bd8e066c0862d
	.xword	0x3ff5553b52ccc578
	.xword	0xa1e83f96880ca3d8
	.xword	0xe11a7f6dadf92ea8
	.xword	0x5e249c90ac177a0e
	.xword	0xb5b0c9060a1c0920
	.xword	0xffe5060b246f8fc6
	.xword	0x0c66069845110fbd
	.xword	0xabad328f3efd8f80
	.xword	0xddf7303cc3cd1df0
	.xword	0x46b1541cab29d525
	.xword	0xc0ec18cc8f6d7875
	.xword	0x613763654797cc8f
	.xword	0x766de9792d711b55
	.xword	0xbdde98ffed956df2
	.xword	0xc3622719d7a685ec
	.xword	0x02d4080ea819fcdd
	.xword	0xcca917fa6fbb5429
	.xword	0xc75fb855322c08ec
	.xword	0x141c7385404bcef9
	.xword	0x419eea5b0262c234
	.xword	0x910e910eac6d8ab2
	.xword	0x95c9e473cce3d457
	.xword	0xc5cabff839fc81e1
	.xword	0x9ddc2c39b9145d56
	.xword	0x6493dfdbf8b30d01
	.xword	0x9f5706ec87799bf1
	.xword	0x960a73a837cb2b81
	.xword	0x955555877b9acd03
	.xword	0x2ac514bcfa69ec03
	.xword	0xbbff25b9e55a5bb4
	.xword	0xd535195587e38e0d
	.xword	0xade17eb32ee54761
	.xword	0xfff297d384df496a
	.xword	0xcd1b737770fb9f20
	.xword	0x88316488142141ef
	.xword	0xd43c0e2efbd030e4
	.xword	0x3743419175bd577c
	.xword	0x579db5eb31162243
	.xword	0xdfc37b368f1b67c0
	.xword	0x681ec8c80b92d647
	.xword	0xbd33d2c3d3f11694
	.xword	0x04d7cc538b05f187
	.xword	0x7de5eadb61354e28
	.xword	0x202f10c2928f94b1
	.xword	0x61b75c41d9d4ec4f
	.xword	0xafc06954cd4d1fbc
	.xword	0x06285b6c3d37133f
	.xword	0x131a5731c338acc2
	.xword	0x377f66c396dcc0b4
	.xword	0x809b8bf80cec6171
	.align 0x4000
	.data
data_start_2:

	.xword	0x3b0413fe4bc10bb9
	.xword	0x6071fcf7b3964a87
	.xword	0x32745b69f3809462
	.xword	0x20be50a38e55cf0a
	.xword	0x5665450ead4d813a
	.xword	0xfaa3b7e32de74fc2
	.xword	0x53aba573d1e1da5a
	.xword	0xf755b5a16c457135
	.xword	0x88eb269128fc52c7
	.xword	0x9ee67e84b371cd7e
	.xword	0xd3c6de13ce66fe1a
	.xword	0x4553194eb796dfbf
	.xword	0xaca77958bf8665f0
	.xword	0x93c0a32369b3bc14
	.xword	0xa51c9c995f1f5999
	.xword	0x3f71a12ca8d56fdf
	.xword	0x61abb53f0836f445
	.xword	0x0a690dd9831a6bc6
	.xword	0xd404bee975fc9271
	.xword	0x099165bec39ea1f7
	.xword	0xdc9794ead6570064
	.xword	0x42b197a1aa37c4fe
	.xword	0x9d9d06f48cbe6f92
	.xword	0x3948a22d5908f50d
	.xword	0x5ec63d288e54a029
	.xword	0xcc77b423be8739a8
	.xword	0x12c21ba1cdde851e
	.xword	0x0ef9fd0c80d3c958
	.xword	0xb5362de4e0f56dc6
	.xword	0x6fcb6fff67fc49f8
	.xword	0x2460c013ab7a3791
	.xword	0x8a66d77684e942c8
	.xword	0xcb216c2360f23532
	.xword	0x1d8d7745b82709b1
	.xword	0x8297fb2c9e97cb81
	.xword	0xf1fdeb6d8f4baf5b
	.xword	0xf0837342a5d5392a
	.xword	0x2aaaaecda0ba2c26
	.xword	0x37eb155a47b2daae
	.xword	0x2f06e2705bc71d4b
	.xword	0x7f4ed1ce75ff0cbc
	.xword	0xbe0b413bbb6f457d
	.xword	0xb963f277a9d70a40
	.xword	0x5de537153a41c741
	.xword	0x77a246b8efec6ccd
	.xword	0x34f55d3ea29a10bc
	.xword	0x95720494044dea17
	.xword	0x0918cb66ce5363d8
	.xword	0x3ec2e90c73a991ff
	.xword	0xcb4697f770c69729
	.xword	0x5e08ab3ab9918594
	.xword	0x444fd776c1329ceb
	.xword	0x576801a7dadd0171
	.xword	0x3465f1357763d95e
	.xword	0x4f489b09489e7431
	.xword	0x12aaffe10e7459a2
	.xword	0x8a5d8c07a0880e2d
	.xword	0x7d14098da5e79685
	.xword	0x31e728836db62a3e
	.xword	0x09ed879d4afa2a56
	.xword	0xfeba3ab9447edbf7
	.xword	0x8480d0f13ee35894
	.xword	0x6e1907247f90a3fb
	.xword	0xb26751759cf481ad
	.xword	0x8eeff091c6659d87
	.xword	0x659dfbb985941a4f
	.xword	0x6580e262468a6afc
	.xword	0xfb6208aba75c6f83
	.xword	0xee426c88d536af49
	.xword	0xcd0a14c33e730153
	.xword	0x37d8785c3fb41631
	.xword	0x9ce71cce0b378bf0
	.xword	0xd3a828c3e2b073d0
	.xword	0x891425e32431184c
	.xword	0x30058f534b59d4d5
	.xword	0x682f7825a5c1f177
	.xword	0x7a7f9fd7c668af04
	.xword	0x8d70eff65f9155ee
	.xword	0x443356c2f8cf9bc9
	.xword	0x4980047f70fc9ebb
	.xword	0x40fafe8508dea431
	.xword	0x17db0939db04cdb9
	.xword	0x57c33861ffd9e256
	.xword	0x9a65342eddecbc76
	.xword	0x3a6366012e12c3b4
	.xword	0xee5d4c84175fdfd9
	.xword	0x70a83e6b274ffd07
	.xword	0x7d5ae6aa7e63e8a1
	.xword	0x92e3131db23665e1
	.xword	0x2bfa82be329ce8b0
	.xword	0x41565c97eae63b3b
	.xword	0x200c3d96f0415efe
	.xword	0xfeee0f9f96a3d616
	.xword	0x3a4912f85a4242dc
	.xword	0x0a0f3d6254286b41
	.xword	0xc33c2c7d3c726694
	.xword	0xd2c8928121116f23
	.xword	0xe7eb8e52150ceb30
	.xword	0x5d7a1e526a6f44f6
	.xword	0x82631a246a173c3e
	.xword	0xff7157be6467f5c1
	.xword	0x8a8b15f850ca2924
	.xword	0xab7c6c2058bf8557
	.xword	0x5dd0c05dd92ba1f3
	.xword	0x0231a987392d305c
	.xword	0xb6586861bd5b31db
	.xword	0x9bc14c8acbcf675a
	.xword	0x8d3a4f0da3ac2d6d
	.xword	0x0e617fd67b1dbed6
	.xword	0x7e146a97a5fa7522
	.xword	0x117d34114e9193fc
	.xword	0xaf69a9eefa0c6122
	.xword	0x5fff7cfbe3c88937
	.xword	0x66374df970bf7f7a
	.xword	0xae0856a98c3999ca
	.xword	0x36181f5c65eb9d6c
	.xword	0xd03cf6f45ca9585f
	.xword	0xcbc8aebac9f59957
	.xword	0x72c729dbb2d2723d
	.xword	0xddbbf2b53e2cc763
	.xword	0x6b71a1da3b730509
	.xword	0xd6811887beedffe6
	.xword	0x63168c237d575e6d
	.xword	0xfe22d82253d8e01c
	.xword	0xb8883dec5d1ba55c
	.xword	0x338c631c13f9ec8b
	.xword	0x55ec0796bb977c6c
	.xword	0xf970f0c07fcf4d67
	.xword	0x0b84dc2d4470edac
	.xword	0xd2f11341f2142f3d
	.xword	0xf41345cb5fddd05c
	.xword	0xb49d2837927e696c
	.xword	0xf303620082983293
	.xword	0x4719eb9bcf0f1564
	.xword	0xd49f8c41ee53b842
	.xword	0xe08e52be98287bb6
	.xword	0x6317f13b2a39dc88
	.xword	0x23f059d5cf1b72c8
	.xword	0x539bd7eae2a5c741
	.xword	0x0aa69dd3289d2d5b
	.xword	0xfa1ffe8382c5d25c
	.xword	0xab499c3e0ed13bdb
	.xword	0x34daa58f4b4042b9
	.xword	0x3a9500feb2da43a2
	.xword	0xdcca7e2436645366
	.xword	0xfa2bd46da6dbd4a7
	.xword	0xd9d8e0093c91e7d6
	.xword	0x68f0776f6db178f3
	.xword	0xc102be793d692360
	.xword	0xa026f3062e108b37
	.xword	0xd89de8cda6e21511
	.xword	0x494e86fecb99c900
	.xword	0xf26e2d2f0b66375c
	.xword	0x0ee38777381ef2b5
	.xword	0x0e73c331faa9a1de
	.xword	0xdcb11873c9901069
	.xword	0x7afbc7559436b84d
	.xword	0x1ea9a3acba340245
	.xword	0x7a854542736855e7
	.xword	0xa2c6eb467827248e
	.xword	0xe06c1ee22991d243
	.xword	0x1613b779f10c396c
	.xword	0x58cf9a187a3b1bdb
	.xword	0xe78a3bafe185bab5
	.xword	0xfbc8525de2d900e5
	.xword	0xf60db60e5475bfda
	.xword	0xfed48afb6cc79300
	.xword	0x8d86e38c00379dc3
	.xword	0x5cf08bdcb79402e6
	.xword	0x84aaba0f5901e400
	.xword	0xdf99e73b0871bfdc
	.xword	0xd20d79885fc23da9
	.xword	0x1822a60b0cd7faf7
	.xword	0xc917cf6bb20a31b7
	.xword	0xa0a77979c40c925f
	.xword	0x73905a466534dd5c
	.xword	0x8ae6bff87fab38b6
	.xword	0xc0fa49b6844e9386
	.xword	0x73bb5b943f648f6d
	.xword	0xc35fbde8f8311254
	.xword	0x30541266d54e91ce
	.xword	0x153a9a2d83a8caf6
	.xword	0x2661a93b03903b12
	.xword	0xf0e080fd096c02b2
	.xword	0x7a5780ec918f6d59
	.xword	0x5bb2145c93a2d864
	.xword	0xf7e9ef21da4631d2
	.xword	0xaed47326f606a863
	.xword	0x448db67d1806f389
	.xword	0x9a7ceab0ca8a0772
	.xword	0x204d57b5def7aa18
	.xword	0xa9312db8eb505f75
	.xword	0x9c20e592244ac453
	.xword	0x6b313262747a0a8c
	.xword	0x3cd9d2ec8cf7f103
	.xword	0x430d9f683196f413
	.xword	0xc2b440b803e8cc28
	.xword	0x06914f34c8a74564
	.xword	0x16a22868620a9ba5
	.xword	0xa05f3b066e8cdb41
	.xword	0xfa0b976e37321df5
	.xword	0xd668577e9b091ec8
	.xword	0x581c415146e3dc4b
	.xword	0x46f2b3ec243e97fe
	.xword	0xe0c27e759aee38c5
	.xword	0x2ecd76603c040fff
	.xword	0x69567af04e0b476a
	.xword	0x581d21f9e54d4f5f
	.xword	0xd5e473a0b92d0e8f
	.xword	0x874ebbc9973c7d27
	.xword	0x9cad5f3d0f34fbd5
	.xword	0x6a31fa5c6597c743
	.xword	0x2420d649ef46f8dd
	.xword	0x3ca0080bc99a24e2
	.xword	0xa9d6ddeb31ee924c
	.xword	0x761ea70a99bd6e9a
	.xword	0x50fdf165d82be214
	.xword	0x79f0aaffc9c9e3b9
	.xword	0xc12d2c96086fd7d1
	.xword	0xe510f265715162ef
	.xword	0x3479ba15d48c13c1
	.xword	0x40e6213665219784
	.xword	0xdd6c6cb48d85788c
	.xword	0xfaecf04bc6aad6a9
	.xword	0x955f79d071b116f4
	.xword	0x775e56695a9cd8ca
	.xword	0xfe917ffe0836c6b0
	.xword	0xbf1e617efcb636cb
	.xword	0xaf6465fff4bba655
	.xword	0x3f1e48425d1b81dc
	.xword	0x3a0e1228b3fa9840
	.xword	0xba1bd2756eb5268f
	.xword	0x1feab80c6f0b5acd
	.xword	0x644e3ab4d18ff728
	.xword	0x4c086b405b907f28
	.xword	0x2419b4b07bf65541
	.xword	0xc184e13da25e7626
	.xword	0x3b606cc8a3d63a9d
	.xword	0x2b6509636f1ff708
	.xword	0x46a0db1b6561fb96
	.xword	0x0ec87a24d59a74fa
	.xword	0x24bc9cb20936e000
	.xword	0x95410dba89a93574
	.xword	0x87de879b02108b26
	.xword	0xfb7eada91efa8adf
	.xword	0x3e5a381b68f00c12
	.xword	0xfd39ed5f71e45a64
	.xword	0x01c60c5cf27ee476
	.xword	0x642c32242b538a7f
	.xword	0x12240d8ed2016a7c
	.xword	0x7292894695a817ff
	.xword	0x07e540941fd9f433
	.xword	0x204460d2046045d3
	.xword	0xb5f44cd1c07668c9
	.xword	0x2990b670456d73f9
	.xword	0x12fb14c75b23d5bb
	.align 0x8000
	.data
data_start_3:

	.xword	0xf43b68ce08261b62
	.xword	0x646d05c7fb7cb794
	.xword	0x5ff33e147edaebca
	.xword	0x42d6bdcae949d428
	.xword	0xa238ef297d8e2e55
	.xword	0x0b1ff36baf476c9c
	.xword	0xde4ea05a7bd8353c
	.xword	0xd939155cd340a35f
	.xword	0x83a0d338553985f3
	.xword	0xe917382b4f39a867
	.xword	0xd4aca3673efba6ed
	.xword	0x72ee5d4f694ed58d
	.xword	0x8558aaa12a9d310e
	.xword	0xab7e16cab91d40c8
	.xword	0xdca76d97c870e52e
	.xword	0xdebf5459dd9df472
	.xword	0x40330c680668f6c6
	.xword	0x50ea5a98bedf4cff
	.xword	0xaf496f7c2ad6e868
	.xword	0x47d28ac4e4210e45
	.xword	0x18664b454d82d685
	.xword	0x184c89d6eecd9d62
	.xword	0x3b7683c92bbda5a6
	.xword	0x415b4c41ecc94966
	.xword	0xff028732d3faf052
	.xword	0xe07c88d9d12bcfea
	.xword	0x6aeaf0bac6a67490
	.xword	0x0b937e2ff2f02c90
	.xword	0x63d2b9ce9aece6e3
	.xword	0x36be6065dadf2d30
	.xword	0x61452eb8406c9aab
	.xword	0xa6fd581baff2e07f
	.xword	0x0fe867c7aedbddfb
	.xword	0xa4eea6a3772fe574
	.xword	0xf7df0af6e1566d14
	.xword	0x0122e269f9e86fae
	.xword	0xd345af7e30f75077
	.xword	0x198d162d44f501c1
	.xword	0x835c80b82daf8265
	.xword	0x1bc0c1f02e9841e5
	.xword	0x130b1c6060b6d6b0
	.xword	0xfc03052c2eae6735
	.xword	0x595692afe94c8033
	.xword	0x8ff50f7d3121641d
	.xword	0xe4cee8e4bdaca45d
	.xword	0x00b5d5e8ac998728
	.xword	0x64bf735d4266ecc2
	.xword	0xc58a4ec3a7a9b341
	.xword	0xea841505ae349619
	.xword	0x55fa4e44e93d9d23
	.xword	0x1227187f889fe5e5
	.xword	0x877960edd9c778f1
	.xword	0xbe12391ae411e60f
	.xword	0x2d2b93dc99188beb
	.xword	0x6d2c893343da595c
	.xword	0xc15a76c206abc42d
	.xword	0xb42f9815eb2ab2f5
	.xword	0x128579ffc75093c2
	.xword	0x4fe0615552d3c4d4
	.xword	0xa946f8314a89a493
	.xword	0xfb3f427f83a7c257
	.xword	0xcb738fcf58ce3655
	.xword	0xca504a1e5d778528
	.xword	0x1d9348303e6cb268
	.xword	0x1b1c943ea129abe4
	.xword	0xb6f8123e2fbb7102
	.xword	0x07b9dded72f1d069
	.xword	0x524676b386eae192
	.xword	0xd95b4a552accb2ad
	.xword	0x260297daad62332f
	.xword	0x69f2c1608fc9eb9d
	.xword	0xef04d41e566d3b72
	.xword	0xf74323c55959f2bc
	.xword	0x1f1725cd8db70a24
	.xword	0xb9be06c08d0c37e4
	.xword	0x79a7998537ea45a3
	.xword	0xb8e3cd22bea29528
	.xword	0x32d5fcfcfaf3e411
	.xword	0x056f68c8dea3894b
	.xword	0x8d6bd1eadad7c380
	.xword	0x9d77612b6ddbae6e
	.xword	0x87135e3d235544b0
	.xword	0x8ec6dfc815f83123
	.xword	0xda0cd7f57ae7ec57
	.xword	0x4afe8e793dfe3aad
	.xword	0x41b2800094ee4b16
	.xword	0xcaa21c468beb8d3d
	.xword	0x1e7e3d255bddf14b
	.xword	0xa6bc49b75a3eced0
	.xword	0x5dbf4a286cf0f441
	.xword	0x87635954bbae5e07
	.xword	0x29418d8bd37d2d92
	.xword	0x781b6fb6e67241af
	.xword	0xa567b0e37558afad
	.xword	0xe9415cfee074a3bb
	.xword	0xda3493e614541156
	.xword	0x47211a83aa026b44
	.xword	0xf13c8d6a12dd14bc
	.xword	0x91cf01fdeca1a0a1
	.xword	0x7ac0a8024da28141
	.xword	0x94db433608661e37
	.xword	0xf1032e8e501de481
	.xword	0x52a06ab048c8906c
	.xword	0xb00de75f0ab2be13
	.xword	0xe1107f5de37d3ff1
	.xword	0x5465c8f8d28c3f45
	.xword	0xcba8bffe3d1d0aed
	.xword	0xedd3857a72c068b0
	.xword	0xe442317459a0514d
	.xword	0x2f9670c26e28e85e
	.xword	0xffbeeb7c4c547965
	.xword	0x2c820c0001d979a9
	.xword	0xd3d19fef5161ff93
	.xword	0xeb0ea667a5913ea5
	.xword	0x93468d5110496236
	.xword	0x26101c6e0f7503a9
	.xword	0xa5b5be0ba9f0c372
	.xword	0xfcc3ae522d7ea742
	.xword	0xcfc4a34a1d12222d
	.xword	0x8fb0cdb6f90ab5bf
	.xword	0xc4fed2c006417bc7
	.xword	0x5ce67dd8b6f7598d
	.xword	0x7e2703a0ccc4b250
	.xword	0x358f76a78f0f9268
	.xword	0x69ac6fb240655662
	.xword	0x3016ae8674f12dca
	.xword	0x6ff9d4f73038c981
	.xword	0x37e74733c1f7ae4f
	.xword	0x9b3666340c1d79e4
	.xword	0xb454d551d3baedf8
	.xword	0x780b8ed3b5f2effc
	.xword	0x1bd1a13698a693cc
	.xword	0x410d2e87be95a95a
	.xword	0x4be0f64accaaee63
	.xword	0x453c7071ecd503c0
	.xword	0x485ad3e4ab5df347
	.xword	0x667be0e96dd1e0b5
	.xword	0xb7c7ddd076a868a7
	.xword	0xd75e98057cffc5a7
	.xword	0x44c0bc7976e4fdb5
	.xword	0xe73076bb53fda651
	.xword	0x045e011d9346ce82
	.xword	0xd691ac37f3c738e1
	.xword	0x94e2f46bfa9336be
	.xword	0xf8020c40ac659d83
	.xword	0xc0e94c9758f79bc3
	.xword	0xb0872e16bf88fd42
	.xword	0xa6769e074c7fea34
	.xword	0x15d05e7365ae603f
	.xword	0x11d478b1d1507649
	.xword	0xde756fc666dadb4c
	.xword	0x1cb0736f150a7b0d
	.xword	0xebfcf3d4a30f2698
	.xword	0x7d26d4370d06ae94
	.xword	0x8aa1e92d14bdb920
	.xword	0x17370c1c4f214dfe
	.xword	0x26081fdf12060879
	.xword	0x96da2253743955c5
	.xword	0xc7109a745c0258fd
	.xword	0xbe75cf7a1a5f70de
	.xword	0xd5413f0dece10670
	.xword	0x0b3882dcc5cc1cb9
	.xword	0x2d2a6211891e6627
	.xword	0xfedcc36d5f420fe0
	.xword	0x8f8921e0ae7a3e19
	.xword	0x804278da70c8e23b
	.xword	0xc111e10768d2940a
	.xword	0xccee3de607bd9213
	.xword	0xde554cdd75eb6dda
	.xword	0xbd720da3f7f932bf
	.xword	0x4dbd70408e66d2df
	.xword	0x6d848316a7973d80
	.xword	0x8f75650584a05f39
	.xword	0xf3b7569582e8a19d
	.xword	0x6feb7d8e08a9eea4
	.xword	0xb66084e6090d98f1
	.xword	0x2d697397f00a3f53
	.xword	0x25cbe15c1123e3c2
	.xword	0x39e952da8c1fec7e
	.xword	0x18bfe6386ed10394
	.xword	0x8a56fa11aa6bd4a6
	.xword	0x394ebfd9a0cc23d7
	.xword	0x7fa17dfb1e69fe34
	.xword	0x8e85a7df79256d4d
	.xword	0xf8feaa24d5b40768
	.xword	0x847c84253b2c9ef2
	.xword	0xdeaad897cd409d24
	.xword	0xbf932e711490393b
	.xword	0x4f704bc441984854
	.xword	0x5c3b689db40a6daf
	.xword	0xb7df6f079438b1ec
	.xword	0x0b104ff1ac0332c8
	.xword	0x9ef3a37fbcce1b60
	.xword	0x76df0bbc76129f8e
	.xword	0xdb725e5fe0f8242a
	.xword	0xd466860b79e000d0
	.xword	0xa0fbaa551585397c
	.xword	0x7354f5cb0872a69d
	.xword	0x2854ececeb103581
	.xword	0xd9c8f8c457e8603a
	.xword	0x0d1283716d212c14
	.xword	0x96d7050ce99f23b9
	.xword	0x45a9fef4999b13b9
	.xword	0x4f67cc26af9e17f8
	.xword	0x0d1e30365b4439c5
	.xword	0xcd56814c7b0835da
	.xword	0xb3fd36266e9622ce
	.xword	0x11d05261601437bc
	.xword	0x9a9655f401a9a2ea
	.xword	0xdf9026c4261d443e
	.xword	0xf25de48c876135f4
	.xword	0xcb91d24fa8f5dc5a
	.xword	0xfee337eda66500a0
	.xword	0xcf3f3f9fc4c99743
	.xword	0x0fdcfa83754c2243
	.xword	0x99ef4642001d87b7
	.xword	0x9e68b5ff9f18d720
	.xword	0xe9677d2c9f0a758f
	.xword	0xa10ed2cad5481f97
	.xword	0xfd59697e8060cb13
	.xword	0x7f876a383624a763
	.xword	0x393b70e84285f49a
	.xword	0x4f4f212f82335cc9
	.xword	0xf3790eff0cc2cb37
	.xword	0x911c8b312f47ba1b
	.xword	0x06adb239ec65c427
	.xword	0xa223d453ea6b6ee0
	.xword	0x7d78bb4956656c36
	.xword	0x674afe745809001a
	.xword	0x2957db034944a953
	.xword	0xcfa4f71e01379984
	.xword	0xfbc65f09051e3d14
	.xword	0xa0687f0ecad68b5b
	.xword	0x71c1d1f76e7b5b0c
	.xword	0x7d6e11d134ca743b
	.xword	0xe5bacd2d111a3bfd
	.xword	0x907388228411aa26
	.xword	0x123999e7accd37a7
	.xword	0x98e630c72e212fec
	.xword	0x1434645e9578c58f
	.xword	0xfc8f3719ffa7f47f
	.xword	0x9e599a2ecd27f3f0
	.xword	0xadc8de162d1b4b7a
	.xword	0x54af9a9e5425a621
	.xword	0x0330551f103dbc14
	.xword	0x3b097ba7a327843f
	.xword	0x3c0f3f72f709678c
	.xword	0x14e2a5210e88b4af
	.xword	0x6cc17fa6eac72695
	.xword	0xe355ad31f356f9b7
	.xword	0x143d106873d7b7f4
	.xword	0xfd55ea24dbcf1a16
	.xword	0x94bf566271297535
	.xword	0x26b5341fa8e90b15
	.xword	0x4ded6b53b9e0bd27
	.xword	0x2dc055d45c65577c
	.align 0x10000
	.data
data_start_4:

	.xword	0x5dff962f6d844aa7
	.xword	0x602ca1bf53418b4a
	.xword	0x5b490ad3409927eb
	.xword	0xc5d2e9c058eac223
	.xword	0xffa92e4ec57f423f
	.xword	0x61315763df6bb927
	.xword	0xb3ba54d325329575
	.xword	0x1c2940a6f16ef217
	.xword	0xea8527d893700b24
	.xword	0x6cf8ed70eee54ae0
	.xword	0x3744f591ed6972f1
	.xword	0xc87fa5964482fa5a
	.xword	0x3f6d2e6aed623051
	.xword	0x5363ba151cbf467d
	.xword	0x91d5d53934745896
	.xword	0x5bb7bf226f918f95
	.xword	0xdc23ba618d11ad92
	.xword	0x52c84ca8315dc074
	.xword	0xd2f589d891c98197
	.xword	0x1ff0cfb72b4b5548
	.xword	0xba6124311c255759
	.xword	0x075209095b4328e2
	.xword	0x650529fb7dd4b592
	.xword	0x8b7c1c286fb569e3
	.xword	0x64ea750f01fe4ff5
	.xword	0x048527a72e659367
	.xword	0xcd24f0fad1fe3b93
	.xword	0x768dab31b33b5a01
	.xword	0xa22ae773e304e771
	.xword	0xc5af3fa6d75f47db
	.xword	0x87053980aab8eaf8
	.xword	0x0aee38f418ef41ee
	.xword	0x15dbd4fe1f4bf37e
	.xword	0xe6c00425f30ea410
	.xword	0x6ff24859665ee338
	.xword	0x3685adf561b08384
	.xword	0xa1d068a449717901
	.xword	0x00ca0274dc453d14
	.xword	0xeb33d41d209aba82
	.xword	0x84c95722ea993987
	.xword	0xba920cec258c6f1a
	.xword	0xfd8dffa65fa03b40
	.xword	0xc2953c01f8c78577
	.xword	0x410781e70e614820
	.xword	0x8ccbdd43de646de4
	.xword	0x3e40d9fb8daeccfe
	.xword	0xaeffc85074af1e4c
	.xword	0x04759d4d725460c9
	.xword	0x9b2aeb95797763dd
	.xword	0x459672daa094920b
	.xword	0x30ad6a751870385b
	.xword	0xc38a60c6f5ee46bf
	.xword	0x758ec6fbb7b3a3fa
	.xword	0x10379161bf40ddd8
	.xword	0xe53f2629dc3cc043
	.xword	0x0496cf69a0733524
	.xword	0xfc2358e7cde1ea6b
	.xword	0x228dfb2b76e82d81
	.xword	0x9d090dba51aa9ee1
	.xword	0x06b311f632c121bb
	.xword	0xf173a6588b3541e1
	.xword	0x883a0bbb9892b238
	.xword	0xb21386bf4da74875
	.xword	0x5f3ba6bfa3508c2a
	.xword	0xb21141ea4e465aa6
	.xword	0x6cf724702cc2288f
	.xword	0xc68c54abf34f0b72
	.xword	0x8694e2cc0f9f65f6
	.xword	0x06ddaf68a43169ba
	.xword	0x6fe5e94eb1e4aa63
	.xword	0x77f198dabc060b1f
	.xword	0x3cc78c262dc64687
	.xword	0x21961288165ab187
	.xword	0x02f0e871126f5c56
	.xword	0xfbc31e6f474c6e21
	.xword	0xdabe53702bf3eae1
	.xword	0xab38d4bdf21f03ff
	.xword	0xb8ea68eb2272af4a
	.xword	0x5d1ed389ae9488dc
	.xword	0x2c6575b7269ba88a
	.xword	0x9d077c79424c131a
	.xword	0xcf74d54deb27b3cd
	.xword	0xcada8a7a75c4ef01
	.xword	0xeace065bd50ab92c
	.xword	0xed4b6d0c465cfbde
	.xword	0x0ea6fdac3350a5e4
	.xword	0x46bcecfe88dc3af6
	.xword	0x317a2de7c6a80f78
	.xword	0x7eceec0f1c9ffed5
	.xword	0xc3d98688d9d420e2
	.xword	0xf245abe74cb19e30
	.xword	0x1d51f5024c47788a
	.xword	0x1ee094a1e18a01d4
	.xword	0x8f2d3a243f4ac29c
	.xword	0xc744d5d9e533df8d
	.xword	0xb6e62b97638a24a4
	.xword	0xe5a6afc7f3209171
	.xword	0x71883023f9d1f9bd
	.xword	0x645d51d204a12a41
	.xword	0xa475f225b860b192
	.xword	0x8a48464c77790ca1
	.xword	0xd6a95b8420144cf0
	.xword	0xe7e7edf1c2f09502
	.xword	0x0c5a54c57178eade
	.xword	0x86a8bdec6943b9f9
	.xword	0xfa854164b7a18cfb
	.xword	0xfc6796cd12a8492b
	.xword	0xd5d1d55d40f90e18
	.xword	0xe62c335e6de0a32a
	.xword	0x625258e40fe8a6f0
	.xword	0xb6ff4094cf2e79fc
	.xword	0x19c429079b508b59
	.xword	0x6c50d54253513b76
	.xword	0x277369f3e25f94b5
	.xword	0x6f398a085f49c923
	.xword	0x865766f1dd37dfef
	.xword	0x974101fd3433a9b7
	.xword	0xf970f82dcb50db03
	.xword	0x82f60eb67932071c
	.xword	0x5b923d2a43ecd0f1
	.xword	0x24bac82511983b4c
	.xword	0xcb4e5b108ddf0231
	.xword	0x86dd3b966014e6e3
	.xword	0x5ea485327b03421f
	.xword	0xf0895e8a31465461
	.xword	0xe1845f90364cc9cf
	.xword	0x8941962f39fdea96
	.xword	0xf7d742d1a43301b4
	.xword	0xf53dc0c46460830e
	.xword	0x8b80767ffdf95260
	.xword	0x345bd680e7ac746e
	.xword	0x1febf43cce0d3fda
	.xword	0xb012bd38a83e713b
	.xword	0xf3582b73af6d5d57
	.xword	0xfaea31c3b0251afb
	.xword	0xd0e6cc7087ab0be3
	.xword	0x43714a1342ff0cd3
	.xword	0x0b7476f4ac010fb6
	.xword	0xffa61f375012bd27
	.xword	0x9edf2b22444712e1
	.xword	0x4ef3716d2305220b
	.xword	0x37773413e4d39d82
	.xword	0xfa666bebbefe2052
	.xword	0x7afa866d321e49d7
	.xword	0xd0073eb9e95dff54
	.xword	0xb01ccf38ba93429b
	.xword	0x516baf0c5ad6a934
	.xword	0x4f7e08ddd353eb3f
	.xword	0x693411629dd5ee14
	.xword	0x00dce975d42e9421
	.xword	0x6d10bb58e122bd19
	.xword	0xf8b5195abcc2b541
	.xword	0x26f6680e1bc203c6
	.xword	0x15075cbb08e68b26
	.xword	0xa970a7e96d4674b5
	.xword	0xe2a440b1894ad809
	.xword	0xfec728a588dd3718
	.xword	0x165e7cf51e75baff
	.xword	0x4762fc5b42f57ff3
	.xword	0xb0bcd6e28f1912d0
	.xword	0x1719099af1f76fed
	.xword	0xabab46f6eb8ead64
	.xword	0x1aaa870c5d5c2ff3
	.xword	0x2eb2320cf9adfad6
	.xword	0x48755ccfce3592bf
	.xword	0x718c056aa6326d37
	.xword	0x451249baca4ded59
	.xword	0x64a561e3b709c055
	.xword	0x26473a854dd92bc9
	.xword	0x18529d6a73add90f
	.xword	0x550fe1e3054d0a90
	.xword	0x405cae78ee9f4209
	.xword	0x841b194ef79f2af1
	.xword	0x378e811c3686f838
	.xword	0xf27302a12cc417a9
	.xword	0x363e78baa0cb3922
	.xword	0xc37a33952402256e
	.xword	0xfc1783a6675f2805
	.xword	0x160ed4bef0867073
	.xword	0x99c34140322cfd68
	.xword	0xbcf498d36593ec8c
	.xword	0x54931488ae08efd1
	.xword	0x176b4d7e9696a7ef
	.xword	0xfb0bfe8d6daf013e
	.xword	0x69045b39968464b6
	.xword	0x34f39d215462af99
	.xword	0xc6175e511e3ebab2
	.xword	0x40c915e4235fefe3
	.xword	0xa47fc3b451115878
	.xword	0x7e226c93e2810999
	.xword	0x9905167435e05bc2
	.xword	0x3de031312828cb32
	.xword	0x1c5ea72395b35615
	.xword	0x63293045c97132dd
	.xword	0xc5e2cf36d780278c
	.xword	0x874604f47ae6fef7
	.xword	0x5ef3e8eca72c25a1
	.xword	0x744f3263a92dc155
	.xword	0x67716b338b155e78
	.xword	0xe0b8ac20a5986f07
	.xword	0x569235655d88cda0
	.xword	0x77ad8ce0424cda99
	.xword	0xbfb753f35733211d
	.xword	0xe44f0416d5e56a09
	.xword	0xcce2a894b67cf9db
	.xword	0xfe92fa7d519cd516
	.xword	0x7eb6360917e2e1ce
	.xword	0xa145a6ab127d0f53
	.xword	0x1228e2f1ef5a0caf
	.xword	0x18a65411627fda2e
	.xword	0x03ce155b2cc47d0a
	.xword	0x49dab3a54935bcd5
	.xword	0xbfbb78bbd59c0d87
	.xword	0x5747d0d6564e4785
	.xword	0xc8d1fc3d95c5981b
	.xword	0xb29dab7ddea1f789
	.xword	0x327688c7ce66c917
	.xword	0xade27529fc448e0d
	.xword	0x834c6d6cddb32e73
	.xword	0xefbf36bf904d38e0
	.xword	0xd94786fe2fccafe3
	.xword	0x29a2a842a2b769a8
	.xword	0x66f0209e98a99674
	.xword	0x2e638b4bc7cd1d1f
	.xword	0x7ecccf5f71c06a39
	.xword	0xa3c8801c3a61b004
	.xword	0xd78535cb7d1d2d25
	.xword	0x91eeaa3c2f90ac0f
	.xword	0xb93e715fdf36381f
	.xword	0x2d92bb24e37296fd
	.xword	0x804752f5fa87b4de
	.xword	0x88e65b42039a829e
	.xword	0x323083f5e6aa3561
	.xword	0x37d207a5b522b534
	.xword	0xa211bf3260e8828d
	.xword	0x500f25b7ee14aa60
	.xword	0x39529cd2f0cca089
	.xword	0x9cb8f6396515b8c0
	.xword	0x991837dfe6049406
	.xword	0xcc0ea10411741e7c
	.xword	0x19665e99a1f18595
	.xword	0xe058111093e5bb88
	.xword	0x6182e648369c8d02
	.xword	0x789c29bc126789ee
	.xword	0x63e2c839fdc9753a
	.xword	0xad96df03ddd94a9f
	.xword	0x8652ba4d8da3bd18
	.xword	0xeffa2af96fa298fe
	.xword	0xf74c50b163cd4ba0
	.xword	0x6085b8eb9de264eb
	.xword	0xcea28d9e431b27d6
	.xword	0xabd04007a39db03d
	.xword	0xe06c0ab7a356f5f0
	.xword	0xef3bd0f5ebc76aa8
	.xword	0xae56bdfae37cde49
	.xword	0x21a12ea9120b8c70
	.align 0x20000
	.data
data_start_5:

	.xword	0x1a4b1f41c6a69008
	.xword	0x4888b4f160bb5a22
	.xword	0x2feb3e886885096d
	.xword	0xc999b9cd2efe6985
	.xword	0x3ad8ed2293d841a0
	.xword	0x2179a02076ec005b
	.xword	0xb2dbc071ae666bd4
	.xword	0xb31dc76a734e6f24
	.xword	0x3ab0c0dbeaba1f40
	.xword	0x41b4db7d024ffb7b
	.xword	0xfc62641f6046c3cf
	.xword	0xac99dacef78cc1f2
	.xword	0x8426ff9cb53a7f94
	.xword	0xa5dc94966e5eccdd
	.xword	0x57fe5d27edeb28d5
	.xword	0x26218e174a38e765
	.xword	0xfcd8480e79669e98
	.xword	0xa7fdb88f0ff3e84c
	.xword	0x16019a1d695926e5
	.xword	0x48ffc92334b0d288
	.xword	0x1e03f5edff9612a2
	.xword	0x136e81918d953d30
	.xword	0xb6b5a02f75fd443d
	.xword	0x18a3dd06fcdd35bd
	.xword	0x8550ca9b17182f37
	.xword	0x5b40fb0197120135
	.xword	0x7cf975952b864ac4
	.xword	0x6fadd5d6621ba462
	.xword	0xbb47a07dbcb80173
	.xword	0x3db870b015bdeafb
	.xword	0x33bc038325eb4633
	.xword	0x6f4e030e3eb17f7e
	.xword	0x0e2da8364207679c
	.xword	0x10f3a21c74fd1d57
	.xword	0x7ea16bee9a2b7c1a
	.xword	0xd979815aff13f8b1
	.xword	0x84fba3a668b3cbd6
	.xword	0x5c29f0b314e21cc1
	.xword	0xee6941365b267755
	.xword	0x1e6fc6204c6ea65a
	.xword	0x26a9d4b0ad1e7cd3
	.xword	0x10656f82e5f1ef8f
	.xword	0x51e212f9ccdf0485
	.xword	0xd5867c0edd4a1350
	.xword	0x6eb89153d4dc9b95
	.xword	0xc7b2cc4b77e3dab5
	.xword	0xbe077f70a4674243
	.xword	0x07e010aee7c70694
	.xword	0x8382d30865518b2d
	.xword	0xf9cedb948bdfcb36
	.xword	0x34ec4b31129769f4
	.xword	0xe173b967fa64cf77
	.xword	0x339c93d4ac4b5cc7
	.xword	0x50ea4c060c5bbbc3
	.xword	0x8707984c97baeb47
	.xword	0x7f5ba96feb54bc84
	.xword	0x3a07bfb0664a9c49
	.xword	0xda2b4e62a64ac48d
	.xword	0xb0c73e6851d492ef
	.xword	0xd5f2aeb6e2b1599f
	.xword	0x9f6b739d12ce3d46
	.xword	0x0dc22ef8647d8753
	.xword	0xe4df483d8342e7f0
	.xword	0xf14cd0fcb246eec9
	.xword	0xb51b8e81e8372a0b
	.xword	0x38d06ae3bb42992d
	.xword	0x7c3f637bff642536
	.xword	0xd329706d26cac501
	.xword	0x1766f5c80da3a3ea
	.xword	0x609c4a4df23dc947
	.xword	0x510eb155650cd404
	.xword	0x668ca844678dc5b9
	.xword	0x5acce12dd8a16476
	.xword	0x36fb554881e094d3
	.xword	0xedde96d76761d055
	.xword	0x1156d6d62654ce7f
	.xword	0xed79090c8fceb1bb
	.xword	0x97f8e066c336ea9b
	.xword	0x44e3ac83663e024d
	.xword	0x7ea7c97204c0e4b8
	.xword	0xaa0f3f38524a7586
	.xword	0x835681ae9b445132
	.xword	0xec10c8661369b597
	.xword	0x0c86a12ab952222e
	.xword	0x1cfc371b71d4de88
	.xword	0x19946e488eb20f5e
	.xword	0x5b53a608d8818dab
	.xword	0x8e7ce790f8db9915
	.xword	0x8b94191e713ef534
	.xword	0x338c02d35e9a6f55
	.xword	0xc1c00e64c9df363f
	.xword	0x6bf8785134f3d8dd
	.xword	0x4d563ce9d28f4ef3
	.xword	0x4fec8ecac9d0301c
	.xword	0x140275f1b53f46ba
	.xword	0x31c41a04c952a7f2
	.xword	0x9ef0bc5a001d04e6
	.xword	0xd0431e859b9a02e7
	.xword	0x3176ab54f8c0a896
	.xword	0xe28afe56f852f24f
	.xword	0xa2d03462d57247a7
	.xword	0x1bc73614f9d4f41c
	.xword	0x5a46b7d0ac0da9c4
	.xword	0xdde42bd8cac6c28e
	.xword	0xafb06c87c26cec60
	.xword	0x1c0508e7af4adc24
	.xword	0xba0e7f904063d70f
	.xword	0xe61bf6ffbfc1b239
	.xword	0xdce37ca8e732bedf
	.xword	0x92d7493dd047ce20
	.xword	0x1bf99ccde165f659
	.xword	0x78d3c1ce28bbf940
	.xword	0x9906c237038e7380
	.xword	0x119170d3baf3e7c8
	.xword	0x53f7fabf25969e5c
	.xword	0x6ad94d042593d09d
	.xword	0xcff8507020b49613
	.xword	0xd9e73e797e5ceb10
	.xword	0x6c079be91a7dd54e
	.xword	0x8385aeef18c8d30f
	.xword	0xa60cd0dd2345bca7
	.xword	0x99286e12d40000ee
	.xword	0x034864bfdb0b8766
	.xword	0xf6a2ddfa641a7089
	.xword	0x928810e0ee772ca4
	.xword	0xc993dbe4e22d2ce2
	.xword	0xb4cda3974f67e08f
	.xword	0x4f4a0314314e0348
	.xword	0x9b92caa99bf20ac5
	.xword	0x798f4faa05fee7dd
	.xword	0xc8448edf1e3755b9
	.xword	0xe596b111a5a96bd8
	.xword	0x9abe8c00e68e05f2
	.xword	0xbd1bf9a309aa5aa4
	.xword	0xb1b7992a2c05d8f3
	.xword	0x04a9c62c43f5a2e6
	.xword	0x780362ec78805f2c
	.xword	0xfe64bb72a42dc679
	.xword	0x65d78b8aa3b5a009
	.xword	0x21eef5ca2cae4fc3
	.xword	0x5bb0dd97beccf882
	.xword	0x237630bc4fa674d4
	.xword	0xfc8125492c328e39
	.xword	0x77dd46de17b93265
	.xword	0x93a934718bcf98f0
	.xword	0xb4f8b280440afdc1
	.xword	0xfd0555ad7912cb95
	.xword	0x5cb2e6105cf92350
	.xword	0x6ad28d17e8814c8f
	.xword	0xe5a8e011456f562f
	.xword	0x5f3b3b1575962bfa
	.xword	0xbdc4036b84962205
	.xword	0x40b8169a3a2d9706
	.xword	0x3535ac0483b35463
	.xword	0x8120cde5226f38bf
	.xword	0x98fa0ccd9dce1f58
	.xword	0x5b236d42c90a2d74
	.xword	0x95b1b121a5578101
	.xword	0x542ab7bd7a614828
	.xword	0x268046080bdf3640
	.xword	0xdd9eec33db143162
	.xword	0x075a06c33a797c81
	.xword	0x6dfe220a4a6198e7
	.xword	0xbcb5d71532265810
	.xword	0x52a52591fc4b9989
	.xword	0xe2250fe0c66bc5cf
	.xword	0xbf5c700e89f71114
	.xword	0x246620577347ee5b
	.xword	0x4f52ef201850b47f
	.xword	0x77cfe142e307ff78
	.xword	0x6b067d71e7b08dfe
	.xword	0xd14274d0a5db6321
	.xword	0x4ccc5c53e4dbe200
	.xword	0xf1750b7d4fbd4228
	.xword	0xdfbb18cbd6a839a2
	.xword	0x2f27892d3311f871
	.xword	0xb46f29b904b1c1f2
	.xword	0xf6130ba6205201c7
	.xword	0x90ffbe384ed51240
	.xword	0x7864944c96f5b51b
	.xword	0xe0783359fdfdcff0
	.xword	0x44f86775d0364987
	.xword	0x4d5a17215a2cc62a
	.xword	0x85c4bc7db12e170b
	.xword	0x8c020f4a3e6d95ad
	.xword	0x44d4bcdbc2ee226f
	.xword	0x14b8795701508b80
	.xword	0xbeeead051856a025
	.xword	0x32ff040c0d625665
	.xword	0x40dff14e97505499
	.xword	0xb840cf03231014a1
	.xword	0xc526af3513cd377d
	.xword	0xa1d3170d88fd895f
	.xword	0x4bb7f13b9281ae42
	.xword	0xce782071aa154ed8
	.xword	0xbf4caacbc792119f
	.xword	0xecf181b9fe290f92
	.xword	0x23ad2e3c760a1b2e
	.xword	0x1487cb3e16a4cd1d
	.xword	0x5d7aea40c39597f6
	.xword	0x218c37aed2d50c48
	.xword	0xeb71d78376d6c708
	.xword	0xec0d666271199b75
	.xword	0x087191b0e4fa575e
	.xword	0x72657c006b725bd3
	.xword	0x9300af8c5a29c859
	.xword	0x04f92d22bff9514f
	.xword	0xd83b0f9238046a77
	.xword	0xde9b75ebe4bf9340
	.xword	0x2bdedaa17948f1e8
	.xword	0x6c36538d149ac7a1
	.xword	0x443527aeacd63937
	.xword	0x4bfcb18a90a110ec
	.xword	0x3b97926dfd3cf897
	.xword	0x2674b1713bd6378d
	.xword	0x9baf5f6f8c5c5d4c
	.xword	0x087a760b41b18915
	.xword	0x808f63da3d8fd877
	.xword	0x082ed6b853fb28b7
	.xword	0xfa2ae73935e9aa36
	.xword	0x8187436da9cf877d
	.xword	0x1374b7f14a48ad6c
	.xword	0xc7769f73c90b252d
	.xword	0x344086d4c9c0d0b8
	.xword	0x75b25d09c21aa83c
	.xword	0xaeb1e78350a24b16
	.xword	0xcafbe9ae5f4c0fdb
	.xword	0x235f3163979ffb49
	.xword	0xb9ce59443d3f1ca9
	.xword	0xd0f6a4d674f69689
	.xword	0x66e48fac35161cdd
	.xword	0x87ca1d65c0d53132
	.xword	0x39d63505853af747
	.xword	0x1e8829936fd1b3e8
	.xword	0x614a36292ca2541c
	.xword	0x7e08413f05aeb5eb
	.xword	0x53276e343af4c5ed
	.xword	0x9ee1a58aaac611f6
	.xword	0xa0c1116842610a37
	.xword	0x595e94b6b908b60c
	.xword	0xef5fd1c52faa1ae8
	.xword	0x50dc840637e5c099
	.xword	0xc32f39931af216e4
	.xword	0xeff78ff5498c63a5
	.xword	0x7d95ed2c93c6b44b
	.xword	0x3b24200567b2df5e
	.xword	0x5a9e02c46acb1090
	.xword	0xd3ac74ea19678a6e
	.xword	0x444d24b90c7c1b03
	.xword	0x27c2d91a3bca8118
	.xword	0xb53ea2b2a4c6f94e
	.xword	0xfe55bc2de3430b22
	.xword	0x93610e673fcea5c5
	.xword	0x4590669bbb385cb3
	.xword	0x51223df1bc2a6b1c
	.xword	0x9c489f294185f017
	.align 0x40000
	.data
data_start_6:

	.xword	0x7de31cf59e991fc6
	.xword	0x6930c1d2004e4f3e
	.xword	0x283b67e1ceaeb846
	.xword	0xcee2eefeaa82763f
	.xword	0x6d3278710f8ae6ee
	.xword	0x1d2265cc25a6406e
	.xword	0x1d1dfc7736f9beed
	.xword	0xe0b3b10b3e144f8b
	.xword	0x086344c7e6f96912
	.xword	0xbd3c51a5d5b35516
	.xword	0x72c059838422bd98
	.xword	0x6db2696baf07d373
	.xword	0x9d3ed92f38200851
	.xword	0xe5a05c19d51ab238
	.xword	0x77859bab22f4b7d2
	.xword	0xf8133226538588ba
	.xword	0x1749fd33cf4d7fca
	.xword	0xd593758ff8af9138
	.xword	0x83b23aefd850700c
	.xword	0x17916ec40c6a5f6a
	.xword	0x619755170e126257
	.xword	0xa4af1e17b7509924
	.xword	0x3dd24ca63e68617c
	.xword	0x31f3973d84b8d134
	.xword	0xd0292c6917bf1a78
	.xword	0x60aa729a52a8ca81
	.xword	0x8b7086c95a326b70
	.xword	0x29a26b4617c9a57e
	.xword	0x7801c0dea78bfb5c
	.xword	0x1a2a3b5a57db497c
	.xword	0x24785fcd73202366
	.xword	0x3226ecb6596f2da1
	.xword	0x19c9d1965622df3d
	.xword	0x8fc6b3814ebb2e29
	.xword	0x2bd1bb6ff8bc6c6d
	.xword	0x2336c68af54c443d
	.xword	0x846069d097fbde93
	.xword	0x090d79d53540ce84
	.xword	0xa115b3e715dfebbe
	.xword	0x45b7d666a32c9515
	.xword	0x78ffe6cc52dd0889
	.xword	0x62b92e2c0be1898d
	.xword	0x519b9dc131f3782a
	.xword	0x97c5c27005b90c46
	.xword	0x61a61c939ed55f4f
	.xword	0xa98a5250f4ba3b19
	.xword	0xed677711e0a1651e
	.xword	0x5b7dd5273638bfcd
	.xword	0x1a665650a2db8e3d
	.xword	0x9ca38ee24ab634ca
	.xword	0x6dfd01a07a56cdb2
	.xword	0xd5e56d6cea407205
	.xword	0x9418a166c0ee5285
	.xword	0x3be0b8d4586930e1
	.xword	0xd619e9ea6471408d
	.xword	0x91e30b451dd9f1ac
	.xword	0x7ca148751926d6e1
	.xword	0x05f48266153adbcb
	.xword	0x85b561eea1b8025e
	.xword	0xf19f5aad62a6e572
	.xword	0x874e5ffe14ce131a
	.xword	0x73399ed906db3771
	.xword	0x65f7fa6cee84f090
	.xword	0x71b6772c2c36e52f
	.xword	0x2db8f86a7e8c54d0
	.xword	0x2007f513f51b7709
	.xword	0x621dcb950479347b
	.xword	0x98f71b1b4fdb029d
	.xword	0x7f8f7b796eabec0a
	.xword	0xc74b330b5cd83582
	.xword	0xacb2d53e431a23ea
	.xword	0xc0db136074c71e8f
	.xword	0xa66416741826e0cd
	.xword	0xf609bd3efe8dd693
	.xword	0x0cb3a4f0127d3964
	.xword	0xff845faaf4c9f9eb
	.xword	0x0053566c2a665525
	.xword	0x39dc1aab74c4eaac
	.xword	0x14f90a4b9b8a075e
	.xword	0x1c74427db9971085
	.xword	0xdd1c86d86b34a97f
	.xword	0xbc089ae28de75147
	.xword	0xc27346fa2b60671a
	.xword	0xce15d157476dd223
	.xword	0xb5a03fa91e1ae33c
	.xword	0x452188215f746b65
	.xword	0x2ed6dfd39264118c
	.xword	0x0ea2e3f1bc49f450
	.xword	0xe8bf0ccbde062b2b
	.xword	0x5fa1de8e92e836cb
	.xword	0xf12e9956effc2536
	.xword	0x237c6f4d0c8a2483
	.xword	0x0d7bba2a733fcbdb
	.xword	0x63c81a82b12e9592
	.xword	0xcf452289572c5f73
	.xword	0x617b27610e7c575c
	.xword	0x7f54825bf4901d1a
	.xword	0x7dfd9d08bf31e972
	.xword	0x0ec2eb974a9c56ee
	.xword	0x2e01523024dcc7b1
	.xword	0x223962729538cc9e
	.xword	0x6c7bf0486e65f2e5
	.xword	0x7da70b686afb1e16
	.xword	0x062b0da58c3e7fb7
	.xword	0x23df92b469b28d2d
	.xword	0x9831b60258655809
	.xword	0x9b2921ecb03a0690
	.xword	0x3c2f4c09c03486b6
	.xword	0x835fe90d4b8da6c2
	.xword	0x28a67d317ef1e2c8
	.xword	0x9310d1f18d47f5f7
	.xword	0xd9a9803129a0314e
	.xword	0x52488728864d494b
	.xword	0x9115dae7077abdeb
	.xword	0xa97aecce9ee78a2c
	.xword	0x8c941ee4328c163f
	.xword	0x198082eb5d8d6892
	.xword	0x504f4bca87c9347c
	.xword	0x242bc9b53340c8ec
	.xword	0xb8fa211bda40f323
	.xword	0x9c7004dc795c903a
	.xword	0x56cff8653cda30aa
	.xword	0x0178aec2a5c8c596
	.xword	0xf29bf88c3cce6f6f
	.xword	0xa89478d83c26f4ef
	.xword	0x82faf7214f14142e
	.xword	0x7e460365b3e225d4
	.xword	0xffcfcbcb485d5be2
	.xword	0xf7cbe771ca8beac9
	.xword	0x5642b89901c023d3
	.xword	0x2bda89c5743dbd83
	.xword	0xc65dee7e074c039b
	.xword	0x3301a19824adfa19
	.xword	0xea6d231dde6f4fc2
	.xword	0x9eb79ad8ba063f72
	.xword	0xfb300be91ac53de1
	.xword	0x01cbff41a12769ad
	.xword	0xf0c7a405498d99d7
	.xword	0x67e6410551913d20
	.xword	0x8d9654cecec6f3a4
	.xword	0xcfdd651a6e5d1a97
	.xword	0x81e70fd147b33d64
	.xword	0x16728c0305f8eb1c
	.xword	0xbf3699c600ed7d30
	.xword	0x41d42c3d8cf69097
	.xword	0xaca8f38df484fda6
	.xword	0xef52c4eb0d35c228
	.xword	0x22931183d3a257f8
	.xword	0x0e5e511f27674d3e
	.xword	0x42e2ee26111db129
	.xword	0x8fb899dfbe51965e
	.xword	0x3ffaed0c17eb2447
	.xword	0x20792cc9d2a2aaf2
	.xword	0xdbfc388af4863f9c
	.xword	0x16e405455531b658
	.xword	0xa51cf6e43b0e3811
	.xword	0x027be6152cd1569b
	.xword	0x49262d086b2ae6b1
	.xword	0xcf6840ce6fe05488
	.xword	0x7971d7468c94e353
	.xword	0x2e5662e5c59b479e
	.xword	0x27930f981734c2f0
	.xword	0x72828ac862f0cce0
	.xword	0xd6a8b1b75b885466
	.xword	0x7d63db12de4fb1fc
	.xword	0xd3109c56e0a8bf57
	.xword	0xb79c4596e8057b03
	.xword	0x97aaa83a4afc13f6
	.xword	0xfb400ce822b8ff63
	.xword	0x1b7e0c25093b1b09
	.xword	0x726f5540cece717a
	.xword	0x8a4ffe1ae0392a66
	.xword	0x7942195e087f5a09
	.xword	0x0ca026595c02de41
	.xword	0x22f0a9070b385702
	.xword	0x7864eeb801b8d2b8
	.xword	0xa73259061dacfdb4
	.xword	0xb24d0cd7969d4590
	.xword	0x88f66c12f5249903
	.xword	0xb1c17b84aacc6351
	.xword	0xd3f744d0572c4597
	.xword	0x656e5bd3a05d7ca7
	.xword	0x8d6f30cd04b5f83b
	.xword	0x351e46428cbbe09f
	.xword	0x0eb007a6bce2a41c
	.xword	0x40f7c32b7e42612b
	.xword	0x3ba3d11408e91f3c
	.xword	0x6e30a2569c302d13
	.xword	0x51adf5b2b648d0d5
	.xword	0x599b8d4b7a4cd935
	.xword	0x762155c8dd352f47
	.xword	0x0d0ee91ce92a472d
	.xword	0x1a6c8e75a8cba124
	.xword	0x1391c8d3ce4ec7d5
	.xword	0x8b1e007c075038ca
	.xword	0x7a26711fd1b5bf6f
	.xword	0xa3778eafb95a132a
	.xword	0xe89150f783479437
	.xword	0x7565c657bde06952
	.xword	0xb90afc506bd512ed
	.xword	0x72ffb291a6dba75c
	.xword	0x9949426b025512f7
	.xword	0xdcd450fb2ef205a5
	.xword	0x9dc9dd2eba36193b
	.xword	0x71a676ea4b021811
	.xword	0xf789c420a25f9605
	.xword	0x77c206a03883df25
	.xword	0xa12cd6bba288ba04
	.xword	0x484a483e28d28078
	.xword	0xf648ea89c6605cbc
	.xword	0xc263102e368e1506
	.xword	0x0984971102223350
	.xword	0x34dedb1058c8e82b
	.xword	0x393365103996cc54
	.xword	0x9668914a21603355
	.xword	0x12ae6d278babbc0f
	.xword	0x4d6f082be8ae8905
	.xword	0xdc44d183456e4445
	.xword	0x1395086ed88dd9ee
	.xword	0x69cbe84aa931b0e3
	.xword	0x76919a79b7e5d4c4
	.xword	0xa9a45c4a9feec3bb
	.xword	0xa1e190bfc5cecec3
	.xword	0x7690ce0ed9c093d5
	.xword	0x9ad0a5294eca58f2
	.xword	0x01952a40e9482bae
	.xword	0xaf3534abb47dc727
	.xword	0xb49704be93563644
	.xword	0xd8eeb3855019a52f
	.xword	0x6bdc02b875d5c407
	.xword	0xe199877812cc2260
	.xword	0xb3020544376f173d
	.xword	0x2f8d48f884e82653
	.xword	0x6380a1f7614d7abf
	.xword	0xe970a2bc6efa9e0c
	.xword	0xf712d09a91fdf3ca
	.xword	0xd503d9abd0d37c2e
	.xword	0xbe0dd0e2745a3e99
	.xword	0x7cb243473b285899
	.xword	0xa7b4db8ff01b643a
	.xword	0xa49777e6de41aae2
	.xword	0x80f8c26fc2e66ac3
	.xword	0x8bbac342571a6987
	.xword	0x4f42e8993ef72f83
	.xword	0x0128e210eb2ba69e
	.xword	0xf742404d66811115
	.xword	0xbe30dd98e34e2796
	.xword	0xcbcfe275537a57f6
	.xword	0x9522a58f09feac4a
	.xword	0x446ed24dabd19503
	.xword	0xe58e069129d00118
	.xword	0x5a25b146acafd206
	.xword	0xc7ab06811318a6c0
	.xword	0xfd84443410f47a3b
	.xword	0x6a9e88bd914db155
	.xword	0xeb6ac413e7116211
	.align 0x80000
	.data
data_start_7:

	.xword	0x77545dfb25fff5c2
	.xword	0xe2ba4b5b48fc1bf8
	.xword	0xea75942c431ab8cd
	.xword	0xcb412a90dafe1744
	.xword	0x255f96e2c6b9a5e1
	.xword	0x8a448ea9b4fcfa72
	.xword	0x4b2fb75659c3dd75
	.xword	0x303b14f232edae1c
	.xword	0x761166c943453a11
	.xword	0x7164b5f7dcda93e8
	.xword	0xf328bdc7af36fdf4
	.xword	0x84abe77ce7d6add8
	.xword	0x23e7fc50d67043c9
	.xword	0xa88c90845dff6f85
	.xword	0x83f7cf51de9948df
	.xword	0xc383370a956b097c
	.xword	0xa650c9b895eb3160
	.xword	0x61405153825f8829
	.xword	0x762a90f461f7147d
	.xword	0x758d85938623aeec
	.xword	0x0abe976b73157a7b
	.xword	0x8acd23236e837091
	.xword	0xf2a2bcf7190dcca6
	.xword	0x3ec1919fc5b16b17
	.xword	0x0fe2ddf5eadc5208
	.xword	0xd9b0e68a29a77e07
	.xword	0xe28ee6ae5147e887
	.xword	0xca8e337a5b969f44
	.xword	0xc6295d2d7f473052
	.xword	0xb1e8733bb895ba0c
	.xword	0x07a5c9958993a208
	.xword	0xef03eaf89acc5191
	.xword	0x4e4a1ef408474d7c
	.xword	0xcb739a395b8fc17f
	.xword	0xb2acb10949a4edf1
	.xword	0x647ee7a3bc3cee26
	.xword	0xb53642a70bd9d4b0
	.xword	0x6decbce35bd47251
	.xword	0xbfc632fd6f774efa
	.xword	0x363500babbcca543
	.xword	0x04a08a52a86199f2
	.xword	0x28d312454553437a
	.xword	0x1cd7a47906c6346e
	.xword	0xab13c909d2cc9bff
	.xword	0xeb058edc2e8c8ec9
	.xword	0xf566d92fe8f05acc
	.xword	0x8bd157e3c1b1b400
	.xword	0xc4ea68cf4068a120
	.xword	0x436f3d9f28531a4f
	.xword	0x00c3be9672525b11
	.xword	0x35fcb1e1e69f2af6
	.xword	0x2e7cfdb091715633
	.xword	0x20c1b5b7481d6fd9
	.xword	0xd40c9fb0e7772c95
	.xword	0xb2efed83aeb3a1ac
	.xword	0x389317beabf623fc
	.xword	0x5da9b95eefdae501
	.xword	0xff860c43ee179c75
	.xword	0xbfbcf1067ad8f092
	.xword	0x4ace7f1e6994d8f2
	.xword	0xec9c9dce123d9868
	.xword	0x1c664affcbe465fb
	.xword	0x5231d4cca7c9b967
	.xword	0x7cf0dd3dd58b9c6b
	.xword	0x702fa5676cfdada2
	.xword	0x5e6122a7faa36ba2
	.xword	0xe6a177813aa72df9
	.xword	0xba51cab1634b6374
	.xword	0xa5c2358a411cb430
	.xword	0x6828e03a08d5e218
	.xword	0x55f1de9f37984e01
	.xword	0xda63b8c87ece692c
	.xword	0xb0f4f1ee555ca7a6
	.xword	0x3e4094c9d20e71ec
	.xword	0xc06bd1efcbad8418
	.xword	0x75b7ed2de6116bc6
	.xword	0x1e052ae5360919bb
	.xword	0xd0328db458d3795a
	.xword	0xeee9ac254df6bbe7
	.xword	0x76588fb06c5d6892
	.xword	0x38775f53484213de
	.xword	0x3f672a89faf1bbd4
	.xword	0x9d6f80b632dfaed2
	.xword	0x1e3bd3edc6e10b6b
	.xword	0xe42843ec3cb9995f
	.xword	0x6f2dcf482b0c72be
	.xword	0x16da558cd9f4435b
	.xword	0x6564eed524703675
	.xword	0x09ed899ae52fd58d
	.xword	0x6795af23e53c9f2d
	.xword	0x9fd4d3eb80e62bd0
	.xword	0xf02943ecdb7633c4
	.xword	0x7b25830e802ba2b0
	.xword	0x9cd2735124faa852
	.xword	0xfe51f37b59e73307
	.xword	0xff6c9d2d74ac407e
	.xword	0x6f8c2d434046f826
	.xword	0xc20cf73e9cabeaa0
	.xword	0x7d3e312a888c3f78
	.xword	0x5f6c056be0ed2168
	.xword	0xea886970d187dc8e
	.xword	0x9e1c3ab2feccc85f
	.xword	0xd1b82af13dd593fb
	.xword	0xf82f72009aaf7ead
	.xword	0x312d5c6e78400f78
	.xword	0xc9a553343e1c44fe
	.xword	0x88c482eb4ea28a90
	.xword	0x2057f9e94f852ab4
	.xword	0xd7f7b290ba64368e
	.xword	0x6bdb428a2f2ca3a6
	.xword	0xb98cb5cfbc175b0d
	.xword	0x5db0225a07e1cf75
	.xword	0x58c2546656ed7661
	.xword	0x23c721969a027db0
	.xword	0x28a9c0c07fa6cf3d
	.xword	0x22a1dc38aa68b72c
	.xword	0x4a358ceda5af5f5f
	.xword	0x82800e4d951da7eb
	.xword	0x4b4d8096fd16ee59
	.xword	0xb2af70b604332e5b
	.xword	0x2398421634fed65b
	.xword	0x1ea66a1abcdd2bce
	.xword	0x33f2bbb99ae9e298
	.xword	0x66fe663ea0ba4f52
	.xword	0x19eff26c02338aeb
	.xword	0xc00ac69b8e20a559
	.xword	0xda1b1f95750257d7
	.xword	0xf2eff88cc1c1d595
	.xword	0xf4565db7e972a163
	.xword	0x30d6aa7040583c2a
	.xword	0x402a10712b5a1994
	.xword	0xa6b7cfeca6f85af2
	.xword	0x96b627338f439885
	.xword	0x0c0e509256604a6a
	.xword	0x3ea84bb8dc106198
	.xword	0xb263f3663b7be2bd
	.xword	0xc4911070f133797f
	.xword	0x17ded249c233252a
	.xword	0x299c82c73ea57cb4
	.xword	0xf2164a44792e4369
	.xword	0xb6b3a60284905918
	.xword	0xdc9aa04b0e9cc939
	.xword	0xcd1edbe14c3cd600
	.xword	0x955c82bf677fa02f
	.xword	0xdb7ec451c7167103
	.xword	0xd27ae85b5103f53a
	.xword	0xc733618dcc5ca54e
	.xword	0x038349e1cdce6180
	.xword	0xa5000f11b92a8ab2
	.xword	0x059f7bf5b5e3dbd2
	.xword	0x9d3b2cbc2017a684
	.xword	0xe77bddd23b42c103
	.xword	0x92fceba3f8266bd4
	.xword	0x15cad9e13fe6e32c
	.xword	0xf810203b0dc20beb
	.xword	0x8232df57926f5abc
	.xword	0x162cc7191da2bdeb
	.xword	0x98caa150a8716857
	.xword	0x40ddf76661685569
	.xword	0xf56f670d7a03b082
	.xword	0xf7fb2f8e769a6a6e
	.xword	0xbe5ebe8f039bbe36
	.xword	0xacda3f73f7f607e4
	.xword	0x9f8c8e82f6180e3d
	.xword	0xbbaa9d26e2c03ba8
	.xword	0x0007c5eb164711c0
	.xword	0x0aeed7ea8516dba1
	.xword	0xb85a53ec685a38a5
	.xword	0x7bc833d0913cca0a
	.xword	0x734dddfa71fcb898
	.xword	0x87cef452c21e2212
	.xword	0xab60a87f8088dd70
	.xword	0x47b41e33b54aa226
	.xword	0x6dc814f537a12757
	.xword	0xa37410fa70feaec6
	.xword	0xcc6022209c828207
	.xword	0x10b011846c5bfb41
	.xword	0xae2d37de656be372
	.xword	0xba01b4b2051fab4f
	.xword	0xe94a80b68dd6dc80
	.xword	0x1738c526c968fb51
	.xword	0x072e701cf2ac545a
	.xword	0xfc76a67133e80b35
	.xword	0x94c8b27377f439ea
	.xword	0x97d7ed2d98b3a75e
	.xword	0x06505f64fa88d8b3
	.xword	0xec749654dde395a2
	.xword	0x2241cc65e3a999bd
	.xword	0x097a78283e358e72
	.xword	0xceab2b59270346c3
	.xword	0x3ea839505ddcbfc9
	.xword	0x2be582f363293c1c
	.xword	0x75253c7f311942c8
	.xword	0xfad7ef031dd1be6f
	.xword	0xbe5f136c3f03e4fb
	.xword	0x5ecb583a00897c22
	.xword	0xb3fc1c68e4a5790f
	.xword	0x8040c39625efbbc3
	.xword	0xb12ed4310c5d5d6b
	.xword	0xedfdbb4eb4faa0f8
	.xword	0xc0ef05aecfb26d1d
	.xword	0x04110cf75f88e44c
	.xword	0xc893ba7c41fcb0b9
	.xword	0x1a5fa00b4a8af471
	.xword	0x2b550bf49a76e512
	.xword	0x822ec6387be503da
	.xword	0x7c0e7cc83f8c263b
	.xword	0x765bf7ef10575a63
	.xword	0xcd7a75ecdbd0ce61
	.xword	0xf1d2345014ed626f
	.xword	0x12d92ed4f608af6c
	.xword	0xe417a9541d585c5f
	.xword	0x66071b834108f8f1
	.xword	0xb9c303397b620f7c
	.xword	0x1d3d007b2a5a0574
	.xword	0x419b8191034ca953
	.xword	0x6dce271fb00ca08e
	.xword	0xfd680c00e75ea209
	.xword	0xbeeff8724ff4e321
	.xword	0x8b3b77ecd860a680
	.xword	0xd312e7197e9a9969
	.xword	0x990a4411f17e74e6
	.xword	0x3ce4fd8b47dfbb7b
	.xword	0x00e7e3d446ff906a
	.xword	0x3be77f36e8233902
	.xword	0xb9cc25d8897bc8ec
	.xword	0x8b85aa4f1dcc6020
	.xword	0x51ae0c24b165af8f
	.xword	0xcef1338da08cd364
	.xword	0xfd9191d82069e924
	.xword	0xf597cf793cf291cc
	.xword	0x580d4add60896577
	.xword	0x2c4d0f550c10a14c
	.xword	0xb101518df93e9a89
	.xword	0xddc485df050becdb
	.xword	0x7663ba70076753a8
	.xword	0xf068c386f7ffadcf
	.xword	0xefcff6b21fa7d544
	.xword	0x96120ab7197a2c4b
	.xword	0x66cdb13067fcc386
	.xword	0x1b799229d9481557
	.xword	0x7b2b9435f02556fb
	.xword	0xc9877bb4bffb5d3d
	.xword	0x3c83913150621c1b
	.xword	0x170ebb310e0ad0fa
	.xword	0x425724595f867de0
	.xword	0x748a15230fc9e655
	.xword	0x0afcfc80737ad8fd
	.xword	0x448fc1ebc4c9398b
	.xword	0x6eb95a8131d6f554
	.xword	0x25c27898aa1ef5ae
	.xword	0xab73d55894d8911b
	.xword	0x74201875a104fe6a
	.xword	0x02fc1c22f2d0eb6f
	.xword	0xe587a515297b6280
	.xword	0x955486260612ad49



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
