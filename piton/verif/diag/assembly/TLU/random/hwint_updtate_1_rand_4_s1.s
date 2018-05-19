// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hwint_updtate_1_rand_4_s1.s
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
   random seed:	90409843
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

	setx 0x77e504869888308c, %g1, %g0
	setx 0x65cf94886f497565, %g1, %g1
	setx 0x9f124f550f72a792, %g1, %g2
	setx 0x7379955c551acaad, %g1, %g3
	setx 0x5f27b1a313f565fd, %g1, %g4
	setx 0x905f07aae7f65891, %g1, %g5
	setx 0x20d18f5768debb66, %g1, %g6
	setx 0xe24658382bbd1d6a, %g1, %g7
	setx 0xbfde731c9d57bac0, %g1, %r16
	setx 0x1f1442230db01709, %g1, %r17
	setx 0x64b587ca93576307, %g1, %r18
	setx 0x4173fd65ee2b1445, %g1, %r19
	setx 0xb9f8688314ab813f, %g1, %r20
	setx 0x3f05067cd6ac65e1, %g1, %r21
	setx 0x7b61a300f02a80c8, %g1, %r22
	setx 0xe028a23753770d1a, %g1, %r23
	setx 0x9abcaade0d220fb3, %g1, %r24
	setx 0xc7d0b1b373e93502, %g1, %r25
	setx 0x09ccd70544b4c07d, %g1, %r26
	setx 0x577885815b4c83fb, %g1, %r27
	setx 0x2f687b9e6accc849, %g1, %r28
	setx 0x9eb49f4b74321c0d, %g1, %r29
	setx 0x46c432fd0b67a882, %g1, %r30
	setx 0x5969c5519c136000, %g1, %r31
	save
	setx 0xba4804b004a06753, %g1, %r16
	setx 0x6a623f719c30d8a0, %g1, %r17
	setx 0x8899adf268990ee0, %g1, %r18
	setx 0x1104b7ae45df98c8, %g1, %r19
	setx 0x74972db4e2a86bff, %g1, %r20
	setx 0x279316af6725f648, %g1, %r21
	setx 0xcfb29768f5f86093, %g1, %r22
	setx 0x2a74f1218950af59, %g1, %r23
	setx 0xee919bcc21c66f54, %g1, %r24
	setx 0x3c25579e7e6f366c, %g1, %r25
	setx 0x3830b6197cdfeac1, %g1, %r26
	setx 0x37300910f0168140, %g1, %r27
	setx 0x97b117f442ec99d7, %g1, %r28
	setx 0x84f52f2da755b47e, %g1, %r29
	setx 0xc4bc895936dbd57b, %g1, %r30
	setx 0xe67f8c533dedec15, %g1, %r31
	save
	setx 0xa6e09fa58e3c8b1b, %g1, %r16
	setx 0xca37b1d0bad14dad, %g1, %r17
	setx 0xc8d0404b36e4de9f, %g1, %r18
	setx 0x2cc603648a61a5f4, %g1, %r19
	setx 0xe5e0dbafeb3423db, %g1, %r20
	setx 0x0d6967501206bf9e, %g1, %r21
	setx 0xf92b1f1fb708ef3f, %g1, %r22
	setx 0x53dcbc048aec073c, %g1, %r23
	setx 0x6af98f1e725876f3, %g1, %r24
	setx 0xe509474d58800761, %g1, %r25
	setx 0xf5665a44be69d111, %g1, %r26
	setx 0xb017de77020cd094, %g1, %r27
	setx 0xb40aa41ddaafb5f1, %g1, %r28
	setx 0x76cf231d652de740, %g1, %r29
	setx 0x554f485990ddc460, %g1, %r30
	setx 0x8432648989a995ca, %g1, %r31
	save
	setx 0x45ecc625a026ca0b, %g1, %r16
	setx 0xd8f7a17e343cb56a, %g1, %r17
	setx 0x6afc7c559b7f8e42, %g1, %r18
	setx 0x65aa4fae3af0bb79, %g1, %r19
	setx 0xdb5a0c3b005e33f1, %g1, %r20
	setx 0x58a568583dac991c, %g1, %r21
	setx 0x842a24c4ecf26848, %g1, %r22
	setx 0x36d13f8522762304, %g1, %r23
	setx 0xe1a8dfc6bcf5c5f8, %g1, %r24
	setx 0x9e76af1afe95fe14, %g1, %r25
	setx 0xa46a1cb7c5c2b793, %g1, %r26
	setx 0x41c5cca6714b2f57, %g1, %r27
	setx 0xf0f9774657db65bd, %g1, %r28
	setx 0x6059827cdfa4ba71, %g1, %r29
	setx 0x848508fe1c267f6b, %g1, %r30
	setx 0x04d7e3acb9b06e15, %g1, %r31
	save
	setx 0x714696f637b0d2f3, %g1, %r16
	setx 0x196a8715f79a6b29, %g1, %r17
	setx 0xbce72c9a87962779, %g1, %r18
	setx 0xaa80ee34ea5b843a, %g1, %r19
	setx 0x29282e93eb9d45b4, %g1, %r20
	setx 0x78c286823d805881, %g1, %r21
	setx 0xe9f0cd417fc14aca, %g1, %r22
	setx 0x143c56087abfe45a, %g1, %r23
	setx 0x6ab9e1a6f6e0195d, %g1, %r24
	setx 0x769c4efca100ff42, %g1, %r25
	setx 0x8cb8aeaf9a5dc3e9, %g1, %r26
	setx 0x4d3c11737a067409, %g1, %r27
	setx 0x10c32a290b6da9ed, %g1, %r28
	setx 0xeaa9cee06b5cbd57, %g1, %r29
	setx 0xe8c0ec7fb6464ac8, %g1, %r30
	setx 0xa104098317f8b37f, %g1, %r31
	save
	setx 0x8960026b1f27c5d7, %g1, %r16
	setx 0x0997d6aae9046ffd, %g1, %r17
	setx 0x4ff843d85a602f87, %g1, %r18
	setx 0xfb6cfd6eb08a9224, %g1, %r19
	setx 0x5bf96ad0e03eb2ec, %g1, %r20
	setx 0xab169e3ab60ae46a, %g1, %r21
	setx 0x5fc5d34ffce04bcf, %g1, %r22
	setx 0xc323142c19d3a6a5, %g1, %r23
	setx 0x22507d72c4956c45, %g1, %r24
	setx 0x4143c9bf07f6552a, %g1, %r25
	setx 0x5a5e75ddc2fd17a7, %g1, %r26
	setx 0x7b417407a6d99884, %g1, %r27
	setx 0xb0477379af5bf7e3, %g1, %r28
	setx 0x5d1ae0b45587dd49, %g1, %r29
	setx 0x21721830fece1b5a, %g1, %r30
	setx 0xca30cd25067287e5, %g1, %r31
	save
	setx 0x9e5d4885cb792d8e, %g1, %r16
	setx 0x5bfe85a0e5e2d8ec, %g1, %r17
	setx 0xf46fb4438f58785e, %g1, %r18
	setx 0xcb3108963213bdff, %g1, %r19
	setx 0x92301c3baf06cd13, %g1, %r20
	setx 0x902ebc4272408689, %g1, %r21
	setx 0xf839837799759c0c, %g1, %r22
	setx 0x44d019d7dde3f46a, %g1, %r23
	setx 0xecbac825a8521630, %g1, %r24
	setx 0x4f379b405d184fdf, %g1, %r25
	setx 0xa6ef4ea6a07f15f1, %g1, %r26
	setx 0x088c7026af65799a, %g1, %r27
	setx 0xba26678462b159d0, %g1, %r28
	setx 0x45030d6b7085d819, %g1, %r29
	setx 0x3dda1c1807c71c65, %g1, %r30
	setx 0xcdcc7a045d886260, %g1, %r31
	save
	setx 0x4182d7b36b1c6265, %g1, %r16
	setx 0x015c5869e8004881, %g1, %r17
	setx 0x02c884ea98a39de5, %g1, %r18
	setx 0x74387f0640f2c4d9, %g1, %r19
	setx 0x1045080578e48ecb, %g1, %r20
	setx 0x2d820d8ceb8c0669, %g1, %r21
	setx 0xcd7dc9f96f0334e8, %g1, %r22
	setx 0xf81d620a32368672, %g1, %r23
	setx 0x58cd632f3b8d1d75, %g1, %r24
	setx 0xc826d810f395c1c3, %g1, %r25
	setx 0xe1151beab80c01b3, %g1, %r26
	setx 0x27f1a76ace7c2c2a, %g1, %r27
	setx 0x65bcc3bb867a4206, %g1, %r28
	setx 0xf9cf2545bc8baf8b, %g1, %r29
	setx 0x7a54bba552e2d9d2, %g1, %r30
	setx 0x00cb5b8912f77f94, %g1, %r31
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
cpu_intr_0_0:
	setx	0x1b0016, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_0), 16, 16)) -> intp(0, 0, 3c)
T0_asi_reg_rd_0:
	mov	0x2, %r14
	.word 0xfcdb8e80  ! 3: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbbe561b8  ! 5: SAVE_I	save	%r21, 0x0001, %r29
iob_intr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_1), 16, 16)) -> intp(0, 0, 11)
	.word 0xb7e4602e  ! 8: SAVE_I	save	%r17, 0x0001, %r27
iob_intr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_2), 16, 16)) -> intp(0, 0, 22)
iob_intr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_3), 16, 16)) -> intp(0, 0, d)
iob_intr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_4), 16, 16)) -> intp(0, 0, 2b)
T0_asi_reg_wr_0:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 23: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_0_1:
	setx	0x1f0225, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_1:
	mov	0x20, %r14
	.word 0xfef389e0  ! 25: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T0_asi_reg_rd_1:
	mov	0x1c, %r14
	.word 0xfedb84a0  ! 29: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb97c0400  ! 31: MOVR_R	movre	%r16, %r0, %r28
T0_asi_reg_rd_2:
	mov	0x34, %r14
	.word 0xf0db8e80  ! 32: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb3e460b2  ! 34: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7e4c000  ! 36: SAVE_R	save	%r19, %r0, %r27
cpu_intr_0_2:
	setx	0x1f0211, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_5), 16, 16)) -> intp(0, 0, 23)
iob_intr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_6), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_rd_3:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 46: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_7), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb9e40000  ! 49: SAVE_R	save	%r16, %r0, %r28
	.word 0xb0bd6192  ! 52: XNORcc_I	xnorcc 	%r21, 0x0192, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbbe5a03d  ! 57: SAVE_I	save	%r22, 0x0001, %r29
cpu_intr_0_3:
	setx	0x1f0038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde44000  ! 60: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_wr_2:
	mov	0x2d, %r14
	.word 0xf2f38e60  ! 62: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xbfe4601a  ! 64: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbbe50000  ! 65: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_wr_3:
	mov	0xc, %r14
	.word 0xf8f384a0  ! 66: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T0_asi_reg_wr_4:
	mov	0x35, %r14
	.word 0xfef389e0  ! 67: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb9e44000  ! 71: SAVE_R	save	%r17, %r0, %r28
	.word 0xb0340000  ! 75: ORN_R	orn 	%r16, %r0, %r24
iob_intr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_8), 16, 16)) -> intp(0, 0, 21)
	.word 0xbfe50000  ! 78: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_rd_4:
	mov	0x1c, %r14
	.word 0xf4db84a0  ! 81: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_0_4:
	setx	0x1e030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_5:
	mov	0x22, %r14
	.word 0xf0db8e40  ! 85: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_9), 16, 16)) -> intp(0, 0, 37)
	.word 0xbebdc000  ! 90: XNORcc_R	xnorcc 	%r23, %r0, %r31
T0_asi_reg_wr_5:
	mov	0x12, %r14
	.word 0xf4f38e40  ! 93: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_5:
	setx	0x1c002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e52085  ! 98: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbb35d000  ! 99: SRLX_R	srlx	%r23, %r0, %r29
	.word 0xbde44000  ! 102: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_rd_6:
	mov	0x7, %r14
	.word 0xf0db89e0  ! 103: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T0_asi_reg_rd_7:
	mov	0x21, %r14
	.word 0xf8db89e0  ! 104: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T0_asi_reg_wr_6:
	mov	0x24, %r14
	.word 0xf4f384a0  ! 106: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbde54000  ! 107: SAVE_R	save	%r21, %r0, %r30
T0_asi_reg_wr_7:
	mov	0x1a, %r14
	.word 0xf0f38e40  ! 113: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_10), 16, 16)) -> intp(0, 0, 2)
	.word 0xbe358000  ! 116: SUBC_R	orn 	%r22, %r0, %r31
	.word 0xbfe42048  ! 119: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbbe56188  ! 120: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb4354000  ! 121: SUBC_R	orn 	%r21, %r0, %r26
	.word 0xb48c6197  ! 122: ANDcc_I	andcc 	%r17, 0x0197, %r26
T0_asi_reg_rd_8:
	mov	0xc, %r14
	.word 0xf4db8400  ! 123: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb9e5a1a5  ! 124: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_wr_8:
	mov	0x5, %r14
	.word 0xf2f38e40  ! 126: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb9e4203a  ! 129: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb5e4e054  ! 134: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x8394a115  ! 136: WRPR_TNPC_I	wrpr	%r18, 0x0115, %tnpc
T0_asi_reg_wr_9:
	mov	0x2d, %r14
	.word 0xf6f38e80  ! 137: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb5e40000  ! 138: SAVE_R	save	%r16, %r0, %r26
cpu_intr_0_6:
	setx	0x1c0314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe44000  ! 141: SAVE_R	save	%r17, %r0, %r29
	.word 0xbb343001  ! 142: SRLX_I	srlx	%r16, 0x0001, %r29
T0_asi_reg_wr_10:
	mov	0x3c4, %r14
	.word 0xfaf389e0  ! 144: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb7e5a005  ! 145: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9e4e1bb  ! 147: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbde48000  ! 149: SAVE_R	save	%r18, %r0, %r30
T0_asi_reg_wr_11:
	mov	0x2a, %r14
	.word 0xfcf38e80  ! 151: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_11), 16, 16)) -> intp(0, 0, 15)
	.word 0xb1e5e1cd  ! 154: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_12), 16, 16)) -> intp(0, 0, 29)
T0_asi_reg_wr_12:
	mov	0x19, %r14
	.word 0xfcf38e40  ! 162: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbbe58000  ! 164: SAVE_R	save	%r22, %r0, %r29
	.word 0xb7e4e0f8  ! 169: SAVE_I	save	%r19, 0x0001, %r27
cpu_intr_0_7:
	setx	0x1e0013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5347001  ! 172: SRLX_I	srlx	%r17, 0x0001, %r26
cpu_intr_0_8:
	setx	0x1f0318, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_13), 16, 16)) -> intp(0, 0, a)
T0_asi_reg_rd_9:
	mov	0x6, %r14
	.word 0xf6db89e0  ! 182: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xbe058000  ! 183: ADD_R	add 	%r22, %r0, %r31
	.word 0xb1e58000  ! 184: SAVE_R	save	%r22, %r0, %r24
	.word 0xb1e40000  ! 186: SAVE_R	save	%r16, %r0, %r24
T0_asi_reg_wr_13:
	mov	0x16, %r14
	.word 0xf4f384a0  ! 192: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb1342001  ! 193: SRL_I	srl 	%r16, 0x0001, %r24
	.word 0xb3e461d7  ! 195: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3e46075  ! 196: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7e4609e  ! 197: SAVE_I	save	%r17, 0x0001, %r27
iob_intr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_14), 16, 16)) -> intp(0, 0, 25)
	.word 0xb9e44000  ! 199: SAVE_R	save	%r17, %r0, %r28
	.word 0xb6250000  ! 200: SUB_R	sub 	%r20, %r0, %r27
	.word 0xb6bd0000  ! 201: XNORcc_R	xnorcc 	%r20, %r0, %r27
	.word 0xbde40000  ! 202: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_15), 16, 16)) -> intp(0, 0, 30)
	.word 0xb3e56061  ! 204: SAVE_I	save	%r21, 0x0001, %r25
iob_intr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_16), 16, 16)) -> intp(0, 0, 4)
	.word 0xb9e58000  ! 208: SAVE_R	save	%r22, %r0, %r28
	.word 0xb0c48000  ! 209: ADDCcc_R	addccc 	%r18, %r0, %r24
T0_asi_reg_rd_10:
	mov	0x1c, %r14
	.word 0xf0db89e0  ! 213: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbfe4e04f  ! 217: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbbe40000  ! 225: SAVE_R	save	%r16, %r0, %r29
	.word 0xb7e40000  ! 228: SAVE_R	save	%r16, %r0, %r27
iob_intr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_17), 16, 16)) -> intp(0, 0, 10)
	.word 0xb5e40000  ! 235: SAVE_R	save	%r16, %r0, %r26
iob_intr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_18), 16, 16)) -> intp(0, 0, 3)
iob_intr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_19), 16, 16)) -> intp(0, 0, 2f)
cpu_intr_0_9:
	setx	0x1c021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5c000  ! 240: SAVE_R	save	%r23, %r0, %r24
	.word 0xb3e4a1a0  ! 241: SAVE_I	save	%r18, 0x0001, %r25
T0_asi_reg_wr_14:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 243: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_20), 16, 16)) -> intp(0, 0, 26)
	.word 0xbbe48000  ! 248: SAVE_R	save	%r18, %r0, %r29
	.word 0xb5e4a07a  ! 251: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb28c8000  ! 252: ANDcc_R	andcc 	%r18, %r0, %r25
T0_asi_reg_wr_15:
	mov	0x2d, %r14
	.word 0xfaf38e60  ! 254: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbbe4c000  ! 255: SAVE_R	save	%r19, %r0, %r29
T0_asi_reg_rd_11:
	mov	0x38, %r14
	.word 0xfadb8e60  ! 256: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_0_10:
	setx	0x1e021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba158000  ! 259: OR_R	or 	%r22, %r0, %r29
cpu_intr_0_11:
	setx	0x1e032e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_12:
	setx	0x1e002b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_21), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbbe50000  ! 264: SAVE_R	save	%r20, %r0, %r29
	.word 0xbbe521ed  ! 265: SAVE_I	save	%r20, 0x0001, %r29
cpu_intr_0_13:
	setx	0x1d0327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e421d7  ! 268: SAVE_I	save	%r16, 0x0001, %r28
cpu_intr_0_14:
	setx	0x1d0204, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_12:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 275: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbe0de0c0  ! 276: AND_I	and 	%r23, 0x00c0, %r31
	.word 0xbbe44000  ! 277: SAVE_R	save	%r17, %r0, %r29
cpu_intr_0_15:
	setx	0x1e031a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_22), 16, 16)) -> intp(0, 0, 2)
	.word 0xb1e5209a  ! 283: SAVE_I	save	%r20, 0x0001, %r24
T0_asi_reg_rd_13:
	mov	0x3c8, %r14
	.word 0xf0db84a0  ! 287: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e50000  ! 292: SAVE_R	save	%r20, %r0, %r24
T0_asi_reg_rd_14:
	mov	0x0, %r14
	.word 0xf0db8400  ! 294: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb1e5e0a3  ! 295: SAVE_I	save	%r23, 0x0001, %r24
cpu_intr_0_16:
	setx	0x1d0035, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_23), 16, 16)) -> intp(0, 0, 28)
iob_intr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_24), 16, 16)) -> intp(0, 0, c)
cpu_intr_0_17:
	setx	0x1e0116, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_18:
	setx	0x1f0330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e133  ! 308: SAVE_I	save	%r23, 0x0001, %r28
cpu_intr_0_19:
	setx	0x1e0130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e50000  ! 313: SAVE_R	save	%r20, %r0, %r24
T0_asi_reg_rd_15:
	mov	0x3c0, %r14
	.word 0xf6db8400  ! 318: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb9e4e185  ! 322: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_rd_16:
	mov	0x34, %r14
	.word 0xf8db84a0  ! 323: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_0_20:
	setx	0x1f031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7354000  ! 331: SRL_R	srl 	%r21, %r0, %r27
	.word 0xb7e46130  ! 334: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb5e561a8  ! 337: SAVE_I	save	%r21, 0x0001, %r26
cpu_intr_0_21:
	setx	0x1c0120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a054  ! 342: SAVE_I	save	%r18, 0x0001, %r26
cpu_intr_0_22:
	setx	0x1d0137, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_25), 16, 16)) -> intp(0, 0, 4)
	.word 0xb5e5206a  ! 350: SAVE_I	save	%r20, 0x0001, %r26
T0_asi_reg_wr_16:
	mov	0x3c5, %r14
	.word 0xfaf38400  ! 351: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb9e5e1e6  ! 352: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_rd_17:
	mov	0x36, %r14
	.word 0xf2db84a0  ! 357: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb6242093  ! 361: SUB_I	sub 	%r16, 0x0093, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e50000  ! 368: SAVE_R	save	%r20, %r0, %r25
T0_asi_reg_rd_18:
	mov	0x3c0, %r14
	.word 0xf4db8400  ! 369: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_26), 16, 16)) -> intp(0, 0, 12)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_27), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbc15e16a  ! 379: OR_I	or 	%r23, 0x016a, %r30
iob_intr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_28), 16, 16)) -> intp(0, 0, 23)
T0_asi_reg_wr_17:
	mov	0x31, %r14
	.word 0xf0f38e40  ! 381: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb9e40000  ! 382: SAVE_R	save	%r16, %r0, %r28
	.word 0xb5e40000  ! 383: SAVE_R	save	%r16, %r0, %r26
	.word 0xbfe54000  ! 384: SAVE_R	save	%r21, %r0, %r31
T0_asi_reg_rd_19:
	mov	0x3c5, %r14
	.word 0xfedb89e0  ! 385: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T0_asi_reg_wr_18:
	mov	0x3c3, %r14
	.word 0xfaf389e0  ! 386: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_0_23:
	setx	0x1d0206, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_24:
	setx	0x20108, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_20:
	mov	0x3c3, %r14
	.word 0xf4db84a0  ! 392: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbbe5607c  ! 394: SAVE_I	save	%r21, 0x0001, %r29
iob_intr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_29), 16, 16)) -> intp(0, 0, 4)
iob_intr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_30), 16, 16)) -> intp(0, 0, 29)
iob_intr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_31), 16, 16)) -> intp(0, 0, 25)
iob_intr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_32), 16, 16)) -> intp(0, 0, 29)
	.word 0xbbe4a001  ! 407: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb3643801  ! 411: MOVcc_I	<illegal instruction>
	.word 0xb7e5600b  ! 413: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb83da13c  ! 414: XNOR_I	xnor 	%r22, 0x013c, %r28
T0_asi_reg_rd_21:
	mov	0x3c7, %r14
	.word 0xf6db8e40  ! 415: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_0_25:
	setx	0x1d0212, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_26:
	setx	0x10038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 430: SAVE_R	save	%r20, %r0, %r27
	.word 0xb1e48000  ! 433: SAVE_R	save	%r18, %r0, %r24
	.word 0xb0c50000  ! 434: ADDCcc_R	addccc 	%r20, %r0, %r24
T0_asi_reg_rd_22:
	mov	0x2f, %r14
	.word 0xfcdb8e60  ! 437: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_33), 16, 16)) -> intp(0, 0, 17)
iob_intr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_34), 16, 16)) -> intp(0, 0, 10)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb8a52170  ! 443: SUBcc_I	subcc 	%r20, 0x0170, %r28
T0_asi_reg_wr_19:
	mov	0x20, %r14
	.word 0xf8f38e40  ! 446: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_rd_23:
	mov	0x6, %r14
	.word 0xfedb8e80  ! 447: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb3e4a1c7  ! 448: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb62ca049  ! 449: ANDN_I	andn 	%r18, 0x0049, %r27
	.word 0xb1e44000  ! 458: SAVE_R	save	%r17, %r0, %r24
T0_asi_reg_wr_20:
	mov	0x2, %r14
	.word 0xf6f384a0  ! 460: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xbde40000  ! 463: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_35), 16, 16)) -> intp(0, 0, 5)
	.word 0xb7e4e161  ! 472: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb9e4c000  ! 474: SAVE_R	save	%r19, %r0, %r28
	.word 0xb5e5a033  ! 476: SAVE_I	save	%r22, 0x0001, %r26
iob_intr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_36), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_rd_24:
	mov	0xd, %r14
	.word 0xf4db8e40  ! 489: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T0_asi_reg_wr_21:
	mov	0x3c8, %r14
	.word 0xf8f38400  ! 490: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_37), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb1e54000  ! 493: SAVE_R	save	%r21, %r0, %r24
	.word 0xbc340000  ! 495: ORN_R	orn 	%r16, %r0, %r30
T0_asi_reg_rd_25:
	mov	0x20, %r14
	.word 0xf2db8e80  ! 499: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_38), 16, 16)) -> intp(0, 0, 14)
	.word 0xbfe44000  ! 501: SAVE_R	save	%r17, %r0, %r31
	.word 0xb0b44000  ! 504: SUBCcc_R	orncc 	%r17, %r0, %r24
T0_asi_reg_rd_26:
	mov	0x11, %r14
	.word 0xfedb8e40  ! 506: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_39), 16, 16)) -> intp(0, 0, 3a)
cpu_intr_0_27:
	setx	0x21013d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_28:
	setx	0x220036, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_27:
	mov	0x1c, %r14
	.word 0xf0db8e40  ! 517: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_40), 16, 16)) -> intp(0, 0, 1a)
T0_asi_reg_rd_28:
	mov	0x7, %r14
	.word 0xf0db8e40  ! 525: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_29:
	setx	0x220115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e50000  ! 528: SAVE_R	save	%r20, %r0, %r25
iob_intr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_41), 16, 16)) -> intp(0, 0, 34)
	.word 0xb1e4613c  ! 532: SAVE_I	save	%r17, 0x0001, %r24
cpu_intr_0_30:
	setx	0x23001b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_42), 16, 16)) -> intp(0, 0, 37)
cpu_intr_0_31:
	setx	0x220202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a06f  ! 538: SAVE_I	save	%r18, 0x0001, %r24
T0_asi_reg_rd_29:
	mov	0x28, %r14
	.word 0xfadb89e0  ! 539: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_43), 16, 16)) -> intp(0, 0, 12)
iob_intr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_44), 16, 16)) -> intp(0, 0, 1b)
T0_asi_reg_wr_22:
	mov	0x3c7, %r14
	.word 0xf8f38e60  ! 549: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb3e58000  ! 550: SAVE_R	save	%r22, %r0, %r25
	.word 0xb244c000  ! 551: ADDC_R	addc 	%r19, %r0, %r25
	.word 0xb5e44000  ! 555: SAVE_R	save	%r17, %r0, %r26
	.word 0xb3e50000  ! 556: SAVE_R	save	%r20, %r0, %r25
cpu_intr_0_32:
	setx	0x20a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb224a163  ! 560: SUB_I	sub 	%r18, 0x0163, %r25
T0_asi_reg_rd_30:
	mov	0x2, %r14
	.word 0xf8db8e80  ! 561: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T0_asi_reg_rd_31:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 562: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbec520b7  ! 566: ADDCcc_I	addccc 	%r20, 0x00b7, %r31
T0_asi_reg_rd_32:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 568: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_45), 16, 16)) -> intp(0, 0, 2)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e40000  ! 573: SAVE_R	save	%r16, %r0, %r26
iob_intr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_46), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_rd_33:
	mov	0x10, %r14
	.word 0xfadb84a0  ! 576: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_0_33:
	setx	0x22010d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_47), 16, 16)) -> intp(0, 0, a)
	.word 0xb7e5e0d6  ! 580: SAVE_I	save	%r23, 0x0001, %r27
cpu_intr_0_34:
	setx	0x210237, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_48), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_49), 16, 16)) -> intp(0, 0, 2e)
cpu_intr_0_35:
	setx	0x200214, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_50), 16, 16)) -> intp(0, 0, 28)
	.word 0xb1e58000  ! 589: SAVE_R	save	%r22, %r0, %r24
	.word 0xbc84a1ff  ! 593: ADDcc_I	addcc 	%r18, 0x01ff, %r30
	.word 0xb9e44000  ! 594: SAVE_R	save	%r17, %r0, %r28
	.word 0xb3e48000  ! 595: SAVE_R	save	%r18, %r0, %r25
iob_intr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_51), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_rd_34:
	mov	0x3c6, %r14
	.word 0xf8db8e80  ! 599: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_0_52:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_52), 16, 16)) -> intp(0, 0, 29)
	.word 0xb63ce0d4  ! 602: XNOR_I	xnor 	%r19, 0x00d4, %r27
iob_intr_0_53:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_53), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb9e50000  ! 606: SAVE_R	save	%r20, %r0, %r28
iob_intr_0_54:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_54), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb7e58000  ! 609: SAVE_R	save	%r22, %r0, %r27
	.word 0xb9e54000  ! 610: SAVE_R	save	%r21, %r0, %r28
	.word 0xb9e58000  ! 611: SAVE_R	save	%r22, %r0, %r28
iob_intr_0_55:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_55), 16, 16)) -> intp(0, 0, 15)
	.word 0xbf2c5000  ! 616: SLLX_R	sllx	%r17, %r0, %r31
T0_asi_reg_rd_35:
	mov	0xa, %r14
	.word 0xf6db89e0  ! 621: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb7e5208d  ! 625: SAVE_I	save	%r20, 0x0001, %r27
cpu_intr_0_36:
	setx	0x200038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_56:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_56), 16, 16)) -> intp(0, 0, 37)
cpu_intr_0_37:
	setx	0x220339, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_38:
	setx	0x23023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_36:
	mov	0x30, %r14
	.word 0xfadb8e60  ! 634: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_0_39:
	setx	0x230034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4c000  ! 636: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_40:
	setx	0x22010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e520d5  ! 638: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_wr_23:
	mov	0x33, %r14
	.word 0xf8f38e40  ! 639: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_wr_24:
	mov	0x18, %r14
	.word 0xf8f38e60  ! 643: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_0_41:
	setx	0x23011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e56173  ! 647: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbbe52043  ! 649: SAVE_I	save	%r20, 0x0001, %r29
cpu_intr_0_42:
	setx	0x230016, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_57:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_57), 16, 16)) -> intp(0, 0, 2a)
iob_intr_0_58:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_58), 16, 16)) -> intp(0, 0, 3f)
	.word 0xbd340000  ! 655: SRL_R	srl 	%r16, %r0, %r30
T0_asi_reg_wr_25:
	mov	0x22, %r14
	.word 0xfaf384a0  ! 657: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb1e5a11e  ! 658: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_59:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_59), 16, 16)) -> intp(0, 0, 25)
	.word 0xb1e5c000  ! 664: SAVE_R	save	%r23, %r0, %r24
	.word 0xb3e560b4  ! 665: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xba0c4000  ! 666: AND_R	and 	%r17, %r0, %r29
	.word 0xb934f001  ! 668: SRLX_I	srlx	%r19, 0x0001, %r28
	.word 0xb9e50000  ! 669: SAVE_R	save	%r20, %r0, %r28
	.word 0xb3e460fc  ! 672: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb28d4000  ! 673: ANDcc_R	andcc 	%r21, %r0, %r25
	.word 0xb1e56037  ! 674: SAVE_I	save	%r21, 0x0001, %r24
cpu_intr_0_43:
	setx	0x200102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e44000  ! 678: SAVE_R	save	%r17, %r0, %r25
	.word 0xbfe42124  ! 679: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_rd_37:
	mov	0x3c0, %r14
	.word 0xf8db8e80  ! 680: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb09c60bc  ! 683: XORcc_I	xorcc 	%r17, 0x00bc, %r24
cpu_intr_0_44:
	setx	0x230135, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_38:
	mov	0x3c8, %r14
	.word 0xf0db8e40  ! 685: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_60:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_60), 16, 16)) -> intp(0, 0, 31)
	.word 0xb3e4c000  ! 687: SAVE_R	save	%r19, %r0, %r25
cpu_intr_0_45:
	setx	0x200211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde56077  ! 695: SAVE_I	save	%r21, 0x0001, %r30
iob_intr_0_61:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_61), 16, 16)) -> intp(0, 0, 31)
cpu_intr_0_46:
	setx	0x220126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e40000  ! 700: SAVE_R	save	%r16, %r0, %r25
iob_intr_0_62:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_62), 16, 16)) -> intp(0, 0, 32)
T0_asi_reg_rd_39:
	mov	0x1c, %r14
	.word 0xfadb89e0  ! 706: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb5e561f2  ! 707: SAVE_I	save	%r21, 0x0001, %r26
cpu_intr_0_47:
	setx	0x210124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 709: SAVE_R	save	%r22, %r0, %r26
	.word 0xbde5a1a2  ! 710: SAVE_I	save	%r22, 0x0001, %r30
iob_intr_0_63:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_63), 16, 16)) -> intp(0, 0, 17)
	.word 0xbe9ca0a9  ! 717: XORcc_I	xorcc 	%r18, 0x00a9, %r31
	.word 0xb8240000  ! 719: SUB_R	sub 	%r16, %r0, %r28
T0_asi_reg_rd_40:
	mov	0x23, %r14
	.word 0xfadb84a0  ! 720: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_0_64:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_64), 16, 16)) -> intp(0, 0, 19)
	.word 0xb6b4a19e  ! 722: ORNcc_I	orncc 	%r18, 0x019e, %r27
	.word 0xb5e54000  ! 727: SAVE_R	save	%r21, %r0, %r26
cpu_intr_0_48:
	setx	0x20020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5c000  ! 730: SAVE_R	save	%r23, %r0, %r28
cpu_intr_0_49:
	setx	0x20001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbde40000  ! 735: SAVE_R	save	%r16, %r0, %r30
T0_asi_reg_rd_41:
	mov	0x9, %r14
	.word 0xfadb8e40  ! 736: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb7e5e12d  ! 737: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e5a022  ! 738: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb77da401  ! 742: MOVR_I	movre	%r22, 0x1, %r27
	.word 0xbbe5202c  ! 743: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb1e48000  ! 746: SAVE_R	save	%r18, %r0, %r24
	.word 0xbbe46123  ! 748: SAVE_I	save	%r17, 0x0001, %r29
cpu_intr_0_50:
	setx	0x23000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbca5c000  ! 751: SUBcc_R	subcc 	%r23, %r0, %r30
	.word 0xb9e58000  ! 756: SAVE_R	save	%r22, %r0, %r28
iob_intr_0_65:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_65), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb9e4210b  ! 760: SAVE_I	save	%r16, 0x0001, %r28
iob_intr_0_66:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_66), 16, 16)) -> intp(0, 0, 18)
cpu_intr_0_51:
	setx	0x23003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e520f2  ! 766: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb9e5e022  ! 767: SAVE_I	save	%r23, 0x0001, %r28
cpu_intr_0_52:
	setx	0x200119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_53:
	setx	0x23022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e40000  ! 772: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_rd_42:
	mov	0x3c6, %r14
	.word 0xf0db84a0  ! 773: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb9e5e17c  ! 774: SAVE_I	save	%r23, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_43:
	mov	0x1f, %r14
	.word 0xfadb8e40  ! 778: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_wr_26:
	mov	0x3c3, %r14
	.word 0xf0f38e60  ! 779: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_0_54:
	setx	0x200231, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_27:
	mov	0x17, %r14
	.word 0xfcf38e80  ! 785: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_0_55:
	setx	0x220139, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_44:
	mov	0x10, %r14
	.word 0xfcdb84a0  ! 787: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbbe40000  ! 788: SAVE_R	save	%r16, %r0, %r29
	.word 0xbde5208f  ! 789: SAVE_I	save	%r20, 0x0001, %r30
cpu_intr_0_56:
	setx	0x21013d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_67:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_67), 16, 16)) -> intp(0, 0, 1c)
cpu_intr_0_57:
	setx	0x230001, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_58:
	setx	0x200015, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_68:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_68), 16, 16)) -> intp(0, 0, 0)
	.word 0xb5e5610c  ! 802: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbe94a026  ! 803: ORcc_I	orcc 	%r18, 0x0026, %r31
iob_intr_0_69:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_69), 16, 16)) -> intp(0, 0, a)
	.word 0xb1e42080  ! 805: SAVE_I	save	%r16, 0x0001, %r24
iob_intr_0_70:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_70), 16, 16)) -> intp(0, 0, f)
iob_intr_0_71:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_71), 16, 16)) -> intp(0, 0, 12)
T0_asi_reg_wr_28:
	mov	0x3c3, %r14
	.word 0xf0f38e80  ! 810: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_0_59:
	setx	0x21000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5c000  ! 812: SAVE_R	save	%r23, %r0, %r29
	.word 0xb7e5e035  ! 814: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb1e48000  ! 816: SAVE_R	save	%r18, %r0, %r24
cpu_intr_0_60:
	setx	0x230203, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_61:
	setx	0x21032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe461ec  ! 820: SAVE_I	save	%r17, 0x0001, %r29
T0_asi_reg_rd_45:
	mov	0xa, %r14
	.word 0xf8db8e40  ! 822: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbfe5e09f  ! 824: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbc9d21db  ! 826: XORcc_I	xorcc 	%r20, 0x01db, %r30
T0_asi_reg_wr_29:
	mov	0x15, %r14
	.word 0xf2f38e40  ! 830: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_72:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_72), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb9e4c000  ! 832: SAVE_R	save	%r19, %r0, %r28
	.word 0xbbe5c000  ! 833: SAVE_R	save	%r23, %r0, %r29
T0_asi_reg_rd_46:
	mov	0x29, %r14
	.word 0xf2db89e0  ! 835: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb7e52132  ! 837: SAVE_I	save	%r20, 0x0001, %r27
T0_asi_reg_wr_30:
	mov	0x37, %r14
	.word 0xf6f38e40  ! 839: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_rd_47:
	mov	0x3c4, %r14
	.word 0xf0db84a0  ! 841: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb9e4a1e9  ! 842: SAVE_I	save	%r18, 0x0001, %r28
iob_intr_0_73:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_73), 16, 16)) -> intp(0, 0, 32)
	.word 0xbde5e070  ! 850: SAVE_I	save	%r23, 0x0001, %r30
cpu_intr_0_62:
	setx	0x230118, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_31:
	mov	0x3c5, %r14
	.word 0xfcf38e40  ! 853: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb435e169  ! 855: ORN_I	orn 	%r23, 0x0169, %r26
	.word 0xb9e58000  ! 858: SAVE_R	save	%r22, %r0, %r28
iob_intr_0_74:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_74), 16, 16)) -> intp(0, 0, 33)
	.word 0xb00ca081  ! 864: AND_I	and 	%r18, 0x0081, %r24
iob_intr_0_75:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_75), 16, 16)) -> intp(0, 0, 10)
	.word 0xb5e50000  ! 866: SAVE_R	save	%r20, %r0, %r26
cpu_intr_0_63:
	setx	0x230129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_64:
	setx	0x21033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3c5000  ! 869: SRAX_R	srax	%r17, %r0, %r30
cpu_intr_0_65:
	setx	0x20013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_48:
	mov	0x17, %r14
	.word 0xfcdb8e60  ! 880: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_0_66:
	setx	0x21033c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_67:
	setx	0x230017, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_68:
	setx	0x220230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb17cc400  ! 892: MOVR_R	movre	%r19, %r0, %r24
T0_asi_reg_rd_49:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 894: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb5e42158  ! 901: SAVE_I	save	%r16, 0x0001, %r26
cpu_intr_0_69:
	setx	0x250120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe520c9  ! 903: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_rd_50:
	mov	0x24, %r14
	.word 0xf2db8e40  ! 905: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_70:
	setx	0x250027, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_32:
	mov	0x2a, %r14
	.word 0xfaf38e40  ! 910: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb884e120  ! 912: ADDcc_I	addcc 	%r19, 0x0120, %r28
	.word 0xbbe54000  ! 914: SAVE_R	save	%r21, %r0, %r29
	.word 0xbde54000  ! 915: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_76:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_76), 16, 16)) -> intp(0, 0, 2d)
	.word 0x8f902001  ! 918: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xb204e114  ! 920: ADD_I	add 	%r19, 0x0114, %r25
T0_asi_reg_rd_51:
	mov	0x33, %r14
	.word 0xf0db8e40  ! 922: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_71:
	setx	0x260024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_72:
	setx	0x260129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 926: SAVE_R	save	%r20, %r0, %r27
T0_asi_reg_wr_33:
	mov	0x25, %r14
	.word 0xfef38e40  ! 929: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_rd_52:
	mov	0x15, %r14
	.word 0xfcdb8e80  ! 930: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_0_73:
	setx	0x270330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf7dc400  ! 936: MOVR_R	movre	%r23, %r0, %r31
	.word 0xbbe521bc  ! 939: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x8f902001  ! 940: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xb8b56104  ! 941: SUBCcc_I	orncc 	%r21, 0x0104, %r28
	.word 0xb0458000  ! 942: ADDC_R	addc 	%r22, %r0, %r24
T0_asi_reg_rd_53:
	mov	0x1b, %r14
	.word 0xf0db8e40  ! 943: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb21d0000  ! 944: XOR_R	xor 	%r20, %r0, %r25
iob_intr_0_77:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_77), 16, 16)) -> intp(0, 0, 15)
	.word 0xb5e5a0b8  ! 947: SAVE_I	save	%r22, 0x0001, %r26
iob_intr_0_78:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_78), 16, 16)) -> intp(0, 0, 36)
	.word 0xb5e54000  ! 950: SAVE_R	save	%r21, %r0, %r26
	.word 0xb3e4c000  ! 953: SAVE_R	save	%r19, %r0, %r25
	.word 0xb7e50000  ! 958: SAVE_R	save	%r20, %r0, %r27
T0_asi_reg_rd_54:
	mov	0x3c6, %r14
	.word 0xf2db8e40  ! 959: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbbe40000  ! 962: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_rd_55:
	mov	0x35, %r14
	.word 0xf2db8400  ! 963: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb9e5e181  ! 966: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e44000  ! 970: SAVE_R	save	%r17, %r0, %r26
	.word 0xbe2c6188  ! 971: ANDN_I	andn 	%r17, 0x0188, %r31
	.word 0xb7e4c000  ! 972: SAVE_R	save	%r19, %r0, %r27
	.word 0xb7e4c000  ! 973: SAVE_R	save	%r19, %r0, %r27
iob_intr_0_79:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_79), 16, 16)) -> intp(0, 0, 2e)
iob_intr_0_80:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_80), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb1e4a0d9  ! 977: SAVE_I	save	%r18, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_81:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_81), 16, 16)) -> intp(0, 0, 22)
	.word 0xb3e4206c  ! 983: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde44000  ! 986: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_wr_34:
	mov	0xb, %r14
	.word 0xfef389e0  ! 989: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_0_74:
	setx	0x260238, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_75:
	setx	0x260219, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_35:
	mov	0x27, %r14
	.word 0xf4f38e40  ! 997: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_76:
	setx	0x27033d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_82:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_82), 16, 16)) -> intp(0, 0, 3a)
iob_intr_0_83:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_83), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbbe50000  ! 1005: SAVE_R	save	%r20, %r0, %r29
cpu_intr_0_77:
	setx	0x26012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e48000  ! 1009: SAVE_R	save	%r18, %r0, %r27
	.word 0xb3e46064  ! 1011: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb9e44000  ! 1013: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_84:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_84), 16, 16)) -> intp(0, 0, 34)
T0_asi_reg_rd_56:
	mov	0x17, %r14
	.word 0xf0db89e0  ! 1015: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T0_asi_reg_rd_57:
	mov	0x27, %r14
	.word 0xf2db8e80  ! 1016: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_0_78:
	setx	0x27011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e40000  ! 1019: SAVE_R	save	%r16, %r0, %r26
	.word 0xb7e56166  ! 1020: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_wr_36:
	mov	0x1d, %r14
	.word 0xfef38e80  ! 1021: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbde460b2  ! 1022: SAVE_I	save	%r17, 0x0001, %r30
cpu_intr_0_79:
	setx	0x240028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e46009  ! 1024: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7e54000  ! 1026: SAVE_R	save	%r21, %r0, %r27
	.word 0xb3e5209e  ! 1027: SAVE_I	save	%r20, 0x0001, %r25
cpu_intr_0_80:
	setx	0x240325, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_81:
	setx	0x250222, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_85:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_85), 16, 16)) -> intp(0, 0, 34)
	.word 0xb5e50000  ! 1031: SAVE_R	save	%r20, %r0, %r26
T0_asi_reg_wr_37:
	mov	0x30, %r14
	.word 0xfcf384a0  ! 1032: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_0_82:
	setx	0x260100, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_86:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_86), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbde5e0a8  ! 1040: SAVE_I	save	%r23, 0x0001, %r30
T0_asi_reg_wr_38:
	mov	0x29, %r14
	.word 0xf0f38e40  ! 1041: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb1e48000  ! 1043: SAVE_R	save	%r18, %r0, %r24
T0_asi_reg_rd_58:
	mov	0x12, %r14
	.word 0xf2db8e40  ! 1044: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_87:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_87), 16, 16)) -> intp(0, 0, 32)
cpu_intr_0_83:
	setx	0x240201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3de001  ! 1060: SRA_I	sra 	%r23, 0x0001, %r29
	.word 0xbd643801  ! 1063: MOVcc_I	<illegal instruction>
	.word 0xb734e001  ! 1064: SRL_I	srl 	%r19, 0x0001, %r27
cpu_intr_0_84:
	setx	0x24021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_rd_59:
	mov	0x1a, %r14
	.word 0xfcdb84a0  ! 1072: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T0_asi_reg_wr_39:
	mov	0x3c8, %r14
	.word 0xfef389e0  ! 1074: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_0_88:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_88), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbfe5a0ac  ! 1080: SAVE_I	save	%r22, 0x0001, %r31
cpu_intr_0_85:
	setx	0x260301, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_86:
	setx	0x25003b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_87:
	setx	0x26021c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_60:
	mov	0x15, %r14
	.word 0xfadb8e80  ! 1091: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb5e50000  ! 1092: SAVE_R	save	%r20, %r0, %r26
	.word 0xb7e5e01e  ! 1094: SAVE_I	save	%r23, 0x0001, %r27
iob_intr_0_89:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_89), 16, 16)) -> intp(0, 0, f)
	.word 0xbde460e9  ! 1096: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb9e460a1  ! 1098: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_90:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_90), 16, 16)) -> intp(0, 0, 1f)
iob_intr_0_91:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_91), 16, 16)) -> intp(0, 0, e)
	.word 0xbc25e0c9  ! 1104: SUB_I	sub 	%r23, 0x00c9, %r30
T0_asi_reg_rd_61:
	mov	0xf, %r14
	.word 0xfadb89e0  ! 1105: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T0_asi_reg_wr_40:
	mov	0x1e, %r14
	.word 0xf8f38e80  ! 1107: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_0_88:
	setx	0x25032c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_89:
	setx	0x27013a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_92:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_92), 16, 16)) -> intp(0, 0, 1)
	.word 0xbde56076  ! 1117: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e5c000  ! 1120: SAVE_R	save	%r23, %r0, %r27
iob_intr_0_93:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_93), 16, 16)) -> intp(0, 0, 32)
T0_asi_reg_wr_41:
	mov	0x3c0, %r14
	.word 0xfaf38400  ! 1123: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_0_94:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_94), 16, 16)) -> intp(0, 0, 8)
	.word 0x81956140  ! 1127: WRPR_TPC_I	wrpr	%r21, 0x0140, %tpc
	.word 0xbfe44000  ! 1129: SAVE_R	save	%r17, %r0, %r31
T0_asi_reg_rd_62:
	mov	0x3c5, %r14
	.word 0xf0db89e0  ! 1130: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbfe5a061  ! 1131: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_95:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_95), 16, 16)) -> intp(0, 0, 30)
cpu_intr_0_90:
	setx	0x260307, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_96:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_96), 16, 16)) -> intp(0, 0, 22)
iob_intr_0_97:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_97), 16, 16)) -> intp(0, 0, 19)
iob_intr_0_98:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_98), 16, 16)) -> intp(0, 0, 2c)
iob_intr_0_99:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_99), 16, 16)) -> intp(0, 0, 22)
	.word 0xbbe5c000  ! 1152: SAVE_R	save	%r23, %r0, %r29
	.word 0xbbe50000  ! 1159: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_100:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_100), 16, 16)) -> intp(0, 0, 24)
cpu_intr_0_91:
	setx	0x24013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e50000  ! 1163: SAVE_R	save	%r20, %r0, %r28
cpu_intr_0_92:
	setx	0x270024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e1d7  ! 1166: SAVE_I	save	%r19, 0x0001, %r29
cpu_intr_0_93:
	setx	0x26021c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_101:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_101), 16, 16)) -> intp(0, 0, 32)
cpu_intr_0_94:
	setx	0x26031e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_102:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_102), 16, 16)) -> intp(0, 0, 1b)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_95:
	setx	0x260239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e44000  ! 1180: SAVE_R	save	%r17, %r0, %r26
cpu_intr_0_96:
	setx	0x24032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_42:
	mov	0x3c0, %r14
	.word 0xf2f389e0  ! 1184: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_0_103:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_103), 16, 16)) -> intp(0, 0, 7)
iob_intr_0_104:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_104), 16, 16)) -> intp(0, 0, 3b)
T0_asi_reg_rd_63:
	mov	0x1a, %r14
	.word 0xf8db84a0  ! 1192: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_0_97:
	setx	0x260225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4606a  ! 1194: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb7e40000  ! 1195: SAVE_R	save	%r16, %r0, %r27
T0_asi_reg_rd_64:
	mov	0x28, %r14
	.word 0xf6db84a0  ! 1196: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T0_asi_reg_wr_43:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 1199: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_98:
	setx	0x27032b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_99:
	setx	0x27012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe44000  ! 1207: SAVE_R	save	%r17, %r0, %r29
cpu_intr_0_100:
	setx	0x24023e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_105:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_105), 16, 16)) -> intp(0, 0, d)
T0_asi_reg_wr_44:
	mov	0x37, %r14
	.word 0xf4f38e40  ! 1216: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb33c4000  ! 1218: SRA_R	sra 	%r17, %r0, %r25
	.word 0xbfe44000  ! 1220: SAVE_R	save	%r17, %r0, %r31
	.word 0xb12d1000  ! 1222: SLLX_R	sllx	%r20, %r0, %r24
	.word 0xb1e44000  ! 1227: SAVE_R	save	%r17, %r0, %r24
iob_intr_0_106:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_106), 16, 16)) -> intp(0, 0, 29)
cpu_intr_0_101:
	setx	0x250017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e58000  ! 1233: SAVE_R	save	%r22, %r0, %r25
T0_asi_reg_wr_45:
	mov	0x2, %r14
	.word 0xf4f38e40  ! 1234: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_rd_65:
	mov	0x16, %r14
	.word 0xf6db84a0  ! 1237: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T0_asi_reg_rd_66:
	mov	0x34, %r14
	.word 0xfcdb8e40  ! 1239: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_102:
	setx	0x250315, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_107:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_107), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbac40000  ! 1243: ADDCcc_R	addccc 	%r16, %r0, %r29
iob_intr_0_108:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_108), 16, 16)) -> intp(0, 0, 35)
	.word 0xb9e40000  ! 1248: SAVE_R	save	%r16, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_103:
	setx	0x26023d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_67:
	mov	0x3c2, %r14
	.word 0xf2db89e0  ! 1251: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb5e50000  ! 1254: SAVE_R	save	%r20, %r0, %r26
cpu_intr_0_104:
	setx	0x26000d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_105:
	setx	0x25003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e58000  ! 1260: SAVE_R	save	%r22, %r0, %r28
	.word 0xbbe4e05f  ! 1261: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb3e48000  ! 1262: SAVE_R	save	%r18, %r0, %r25
	.word 0x8994e117  ! 1265: WRPR_TICK_I	wrpr	%r19, 0x0117, %tick
T0_asi_reg_wr_46:
	mov	0x2a, %r14
	.word 0xfcf38400  ! 1266: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T0_asi_reg_rd_68:
	mov	0x2, %r14
	.word 0xfcdb8e80  ! 1267: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_0_109:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_109), 16, 16)) -> intp(0, 0, 26)
cpu_intr_0_106:
	setx	0x260024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb335e001  ! 1271: SRL_I	srl 	%r23, 0x0001, %r25
cpu_intr_0_107:
	setx	0x24013e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_110:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_110), 16, 16)) -> intp(0, 0, 12)
	.word 0xb8c5c000  ! 1274: ADDCcc_R	addccc 	%r23, %r0, %r28
	.word 0xb9e52183  ! 1275: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbde4e102  ! 1276: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_wr_47:
	mov	0x2, %r14
	.word 0xf8f38e60  ! 1285: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_0_108:
	setx	0x240110, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_69:
	mov	0x3c1, %r14
	.word 0xf8db8e80  ! 1291: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T0_asi_reg_wr_48:
	mov	0x2f, %r14
	.word 0xf8f38e40  ! 1296: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_rd_70:
	mov	0x33, %r14
	.word 0xf6db8e40  ! 1297: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_111:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_111), 16, 16)) -> intp(0, 0, b)
	.word 0xb8344000  ! 1299: SUBC_R	orn 	%r17, %r0, %r28
	.word 0xbbe4e15d  ! 1301: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbde54000  ! 1302: SAVE_R	save	%r21, %r0, %r30
T0_asi_reg_wr_49:
	mov	0x3c7, %r14
	.word 0xf6f384a0  ! 1305: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T0_asi_reg_wr_50:
	mov	0x2, %r14
	.word 0xf8f38e60  ! 1309: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbbe54000  ! 1318: SAVE_R	save	%r21, %r0, %r29
	.word 0xbfe4a096  ! 1320: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbde5c000  ! 1321: SAVE_R	save	%r23, %r0, %r30
iob_intr_0_112:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_112), 16, 16)) -> intp(0, 0, f)
	.word 0xb7e5a063  ! 1327: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbeac20f9  ! 1331: ANDNcc_I	andncc 	%r16, 0x00f9, %r31
	.word 0xb3e4c000  ! 1332: SAVE_R	save	%r19, %r0, %r25
T0_asi_reg_rd_71:
	mov	0x23, %r14
	.word 0xfadb8e40  ! 1335: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_rd_72:
	mov	0x3c4, %r14
	.word 0xfadb8e80  ! 1339: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xbb341000  ! 1342: SRLX_R	srlx	%r16, %r0, %r29
	.word 0xbde5e13f  ! 1343: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbde4c000  ! 1346: SAVE_R	save	%r19, %r0, %r30
	.word 0xbfe5a006  ! 1347: SAVE_I	save	%r22, 0x0001, %r31
cpu_intr_0_109:
	setx	0x24033d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_113:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_113), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb9e54000  ! 1352: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_wr_51:
	mov	0x11, %r14
	.word 0xf6f38e40  ! 1353: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_0_114:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_114), 16, 16)) -> intp(0, 0, 14)
	.word 0xbbe5e1a5  ! 1355: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb7510000  ! 1356: RDPR_TICK	<illegal instruction>
T0_asi_reg_wr_52:
	mov	0x3c1, %r14
	.word 0xf4f384a0  ! 1358: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_0_115:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_115), 16, 16)) -> intp(0, 0, 27)
iob_intr_0_116:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_116), 16, 16)) -> intp(0, 0, 7)
cpu_intr_0_110:
	setx	0x24021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe520fb  ! 1369: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb3e4e13a  ! 1372: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1520000  ! 1375: RDPR_PIL	<illegal instruction>
iob_intr_0_117:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_117), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_wr_53:
	mov	0x23, %r14
	.word 0xfef38e80  ! 1377: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb5e420c4  ! 1380: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7e4a08f  ! 1382: SAVE_I	save	%r18, 0x0001, %r27
cpu_intr_0_111:
	setx	0x2a0003, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_73:
	mov	0x3c2, %r14
	.word 0xfedb8e60  ! 1389: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_0_118:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_118), 16, 16)) -> intp(0, 0, 24)
iob_intr_0_119:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_119), 16, 16)) -> intp(0, 0, 2e)
iob_intr_0_120:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_120), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_wr_54:
	mov	0x1c, %r14
	.word 0xf6f389e0  ! 1395: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xbfe560cc  ! 1396: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb73c1000  ! 1397: SRAX_R	srax	%r16, %r0, %r27
T0_asi_reg_wr_55:
	mov	0x2b, %r14
	.word 0xfcf38e80  ! 1399: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T0_asi_reg_rd_74:
	mov	0xb, %r14
	.word 0xf4db8e60  ! 1400: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb7e5a094  ! 1403: SAVE_I	save	%r22, 0x0001, %r27
T0_asi_reg_rd_75:
	mov	0x19, %r14
	.word 0xf2db8400  ! 1404: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_0_121:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_121), 16, 16)) -> intp(0, 0, 2d)
cpu_intr_0_112:
	setx	0x2a011b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_122:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_122), 16, 16)) -> intp(0, 0, 11)
iob_intr_0_123:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_123), 16, 16)) -> intp(0, 0, 1d)
T0_asi_reg_wr_56:
	mov	0x24, %r14
	.word 0xf6f38e80  ! 1413: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_0_113:
	setx	0x280000, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_124:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_124), 16, 16)) -> intp(0, 0, 2a)
cpu_intr_0_114:
	setx	0x280033, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_125:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_125), 16, 16)) -> intp(0, 0, 4)
	.word 0xbe844000  ! 1431: ADDcc_R	addcc 	%r17, %r0, %r31
cpu_intr_0_115:
	setx	0x2a032f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_57:
	mov	0x3c0, %r14
	.word 0xf2f38e40  ! 1440: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb5e5c000  ! 1441: SAVE_R	save	%r23, %r0, %r26
	.word 0xb9e40000  ! 1444: SAVE_R	save	%r16, %r0, %r28
	.word 0xb9e4e172  ! 1445: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbde40000  ! 1447: SAVE_R	save	%r16, %r0, %r30
	.word 0xbde5a1e8  ! 1449: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb3e4a0ee  ! 1450: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb5e4c000  ! 1452: SAVE_R	save	%r19, %r0, %r26
	.word 0xbde44000  ! 1453: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_wr_58:
	mov	0x36, %r14
	.word 0xf2f38400  ! 1454: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_0_116:
	setx	0x29031c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_117:
	setx	0x280201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e521a4  ! 1459: SAVE_I	save	%r20, 0x0001, %r25
cpu_intr_0_118:
	setx	0x290339, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_126:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_126), 16, 16)) -> intp(0, 0, 2b)
iob_intr_0_127:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_127), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_rd_76:
	mov	0x34, %r14
	.word 0xf4db8e80  ! 1471: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbbe4c000  ! 1475: SAVE_R	save	%r19, %r0, %r29
	.word 0xb5e5c000  ! 1476: SAVE_R	save	%r23, %r0, %r26
	.word 0xb1e40000  ! 1478: SAVE_R	save	%r16, %r0, %r24
	.word 0xb5e4e1cf  ! 1488: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbd3da001  ! 1490: SRA_I	sra 	%r22, 0x0001, %r30
	.word 0xbbe58000  ! 1491: SAVE_R	save	%r22, %r0, %r29
cpu_intr_0_119:
	setx	0x280312, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_59:
	mov	0x0, %r14
	.word 0xf0f38e40  ! 1493: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb3e460b9  ! 1494: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xba2d8000  ! 1495: ANDN_R	andn 	%r22, %r0, %r29
	.word 0xb5345000  ! 1496: SRLX_R	srlx	%r17, %r0, %r26
	.word 0xbde521e9  ! 1497: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb3e44000  ! 1498: SAVE_R	save	%r17, %r0, %r25
	.word 0xb9e5a1f4  ! 1501: SAVE_I	save	%r22, 0x0001, %r28
iob_intr_0_128:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_128), 16, 16)) -> intp(0, 0, e)
iob_intr_0_129:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_129), 16, 16)) -> intp(0, 0, 11)
	.word 0xb3e50000  ! 1509: SAVE_R	save	%r20, %r0, %r25
	.word 0xb1e5e1c6  ! 1510: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_rd_77:
	mov	0x1a, %r14
	.word 0xfadb8e80  ! 1511: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xbde5e192  ! 1512: SAVE_I	save	%r23, 0x0001, %r30
iob_intr_0_130:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_130), 16, 16)) -> intp(0, 0, 29)
	.word 0xb3e58000  ! 1514: SAVE_R	save	%r22, %r0, %r25
	.word 0xb9e42151  ! 1515: SAVE_I	save	%r16, 0x0001, %r28
iob_intr_0_131:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_131), 16, 16)) -> intp(0, 0, 24)
	.word 0xb9e460c1  ! 1520: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb5e4e038  ! 1521: SAVE_I	save	%r19, 0x0001, %r26
cpu_intr_0_120:
	setx	0x2a0221, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_78:
	mov	0x8, %r14
	.word 0xf2db8e40  ! 1524: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_132:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_132), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb7e58000  ! 1527: SAVE_R	save	%r22, %r0, %r27
	.word 0xb3e54000  ! 1529: SAVE_R	save	%r21, %r0, %r25
cpu_intr_0_121:
	setx	0x290214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e44000  ! 1534: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_rd_79:
	mov	0x13, %r14
	.word 0xf2db8e40  ! 1536: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T0_asi_reg_rd_80:
	mov	0x11, %r14
	.word 0xf8db8e40  ! 1540: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb5e5212c  ! 1542: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb9e5e0aa  ! 1544: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb1e4216a  ! 1546: SAVE_I	save	%r16, 0x0001, %r24
iob_intr_0_133:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_133), 16, 16)) -> intp(0, 0, 24)
	.word 0xbbe50000  ! 1550: SAVE_R	save	%r20, %r0, %r29
	.word 0xb9e40000  ! 1551: SAVE_R	save	%r16, %r0, %r28
	.word 0xb2bdc000  ! 1552: XNORcc_R	xnorcc 	%r23, %r0, %r25
	.word 0xb1e40000  ! 1554: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_134:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_134), 16, 16)) -> intp(0, 0, 30)
	.word 0xb3e521fe  ! 1562: SAVE_I	save	%r20, 0x0001, %r25
iob_intr_0_135:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_135), 16, 16)) -> intp(0, 0, 5)
T0_asi_reg_wr_60:
	mov	0x3c4, %r14
	.word 0xf0f389e0  ! 1573: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_0_122:
	setx	0x290012, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_61:
	mov	0x3c5, %r14
	.word 0xf2f38e80  ! 1575: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb7e4c000  ! 1578: SAVE_R	save	%r19, %r0, %r27
	.word 0xb2b54000  ! 1580: SUBCcc_R	orncc 	%r21, %r0, %r25
T0_asi_reg_wr_62:
	mov	0xa, %r14
	.word 0xf6f38e80  ! 1581: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbfe58000  ! 1585: SAVE_R	save	%r22, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb4340000  ! 1590: SUBC_R	orn 	%r16, %r0, %r26
	.word 0xb63ce0b7  ! 1593: XNOR_I	xnor 	%r19, 0x00b7, %r27
	.word 0xb7e58000  ! 1594: SAVE_R	save	%r22, %r0, %r27
	.word 0xb0bce054  ! 1595: XNORcc_I	xnorcc 	%r19, 0x0054, %r24
	.word 0xb9e52146  ! 1601: SAVE_I	save	%r20, 0x0001, %r28
iob_intr_0_136:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_136), 16, 16)) -> intp(0, 0, 13)
T0_asi_reg_wr_63:
	mov	0x3c6, %r14
	.word 0xfcf384a0  ! 1603: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbfe521cb  ! 1606: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9e5e0da  ! 1608: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_wr_64:
	mov	0x3c4, %r14
	.word 0xfef38e60  ! 1609: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_0_123:
	setx	0x2a0130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a01c  ! 1616: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_rd_81:
	mov	0x7, %r14
	.word 0xf2db84a0  ! 1620: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbbe4a1ef  ! 1621: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb5e50000  ! 1622: SAVE_R	save	%r20, %r0, %r26
	.word 0xb9e50000  ! 1624: SAVE_R	save	%r20, %r0, %r28
	.word 0xb5e4a1e2  ! 1625: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb894a186  ! 1627: ORcc_I	orcc 	%r18, 0x0186, %r28
	.word 0xb7e58000  ! 1628: SAVE_R	save	%r22, %r0, %r27
iob_intr_0_137:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_137), 16, 16)) -> intp(0, 0, 3f)
cpu_intr_0_124:
	setx	0x280010, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_82:
	mov	0x3, %r14
	.word 0xf2db89e0  ! 1631: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb7e58000  ! 1634: SAVE_R	save	%r22, %r0, %r27
	.word 0xb1e44000  ! 1636: SAVE_R	save	%r17, %r0, %r24
cpu_intr_0_125:
	setx	0x280325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a0b9  ! 1638: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb9e5c000  ! 1639: SAVE_R	save	%r23, %r0, %r28
	.word 0xb32ce001  ! 1642: SLL_I	sll 	%r19, 0x0001, %r25
	.word 0xba8d21ff  ! 1644: ANDcc_I	andcc 	%r20, 0x01ff, %r29
cpu_intr_0_126:
	setx	0x2b0028, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_138:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_138), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb7e44000  ! 1652: SAVE_R	save	%r17, %r0, %r27
cpu_intr_0_127:
	setx	0x2b0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3dd000  ! 1655: SRAX_R	srax	%r23, %r0, %r29
	.word 0xb5641800  ! 1656: MOVcc_R	<illegal instruction>
	.word 0xbfe4e037  ! 1657: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e5a104  ! 1660: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbbe40000  ! 1662: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_wr_65:
	mov	0x1d, %r14
	.word 0xfcf38e80  ! 1663: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb9e48000  ! 1664: SAVE_R	save	%r18, %r0, %r28
T0_asi_reg_rd_83:
	mov	0x25, %r14
	.word 0xf0db89e0  ! 1667: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb5e5219d  ! 1668: SAVE_I	save	%r20, 0x0001, %r26
T0_asi_reg_rd_84:
	mov	0x1d, %r14
	.word 0xfcdb8e40  ! 1670: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_wr_66:
	mov	0x1f, %r14
	.word 0xf8f389e0  ! 1672: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T0_asi_reg_wr_67:
	mov	0x3c6, %r14
	.word 0xf0f389e0  ! 1673: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_0_128:
	setx	0x2b0128, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_85:
	mov	0x3c7, %r14
	.word 0xfadb8e40  ! 1681: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbfe56151  ! 1684: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb035e045  ! 1686: ORN_I	orn 	%r23, 0x0045, %r24
iob_intr_0_139:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_139), 16, 16)) -> intp(0, 0, 2d)
iob_intr_0_140:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_140), 16, 16)) -> intp(0, 0, 1b)
cpu_intr_0_129:
	setx	0x29033c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_130:
	setx	0x2a003b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_131:
	setx	0x280111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e48000  ! 1701: SAVE_R	save	%r18, %r0, %r26
	.word 0xb3e48000  ! 1703: SAVE_R	save	%r18, %r0, %r25
	.word 0xb02d4000  ! 1706: ANDN_R	andn 	%r21, %r0, %r24
	.word 0xb81c8000  ! 1709: XOR_R	xor 	%r18, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb751c000  ! 1714: RDPR_TL	<illegal instruction>
T0_asi_reg_wr_68:
	mov	0x3c3, %r14
	.word 0xfef38e40  ! 1715: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_wr_69:
	mov	0x15, %r14
	.word 0xfcf38e60  ! 1718: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T0_asi_reg_wr_70:
	mov	0x30, %r14
	.word 0xfcf38e40  ! 1721: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb3e5e1c0  ! 1722: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbbe40000  ! 1724: SAVE_R	save	%r16, %r0, %r29
	.word 0xbfe44000  ! 1728: SAVE_R	save	%r17, %r0, %r31
	.word 0xb1e42187  ! 1730: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb5e54000  ! 1731: SAVE_R	save	%r21, %r0, %r26
	.word 0xb3e5c000  ! 1732: SAVE_R	save	%r23, %r0, %r25
	.word 0xb7e4a1ed  ! 1736: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3e5a109  ! 1737: SAVE_I	save	%r22, 0x0001, %r25
T0_asi_reg_rd_86:
	mov	0x2c, %r14
	.word 0xf0db84a0  ! 1738: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_0_132:
	setx	0x2b0225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5c000  ! 1742: SAVE_R	save	%r23, %r0, %r30
	.word 0xbde4a10a  ! 1744: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_wr_71:
	mov	0x3c7, %r14
	.word 0xf2f384a0  ! 1745: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb3e40000  ! 1749: SAVE_R	save	%r16, %r0, %r25
iob_intr_0_141:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_141), 16, 16)) -> intp(0, 0, 1)
	.word 0xb83ce05b  ! 1752: XNOR_I	xnor 	%r19, 0x005b, %r28
	.word 0xbb641800  ! 1753: MOVcc_R	<illegal instruction>
T0_asi_reg_wr_72:
	mov	0x36, %r14
	.word 0xf4f38e80  ! 1755: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T0_asi_reg_rd_87:
	mov	0x31, %r14
	.word 0xf0db8400  ! 1756: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T0_asi_reg_wr_73:
	mov	0x12, %r14
	.word 0xf8f389e0  ! 1759: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T0_asi_reg_wr_74:
	mov	0x36, %r14
	.word 0xf2f38e60  ! 1760: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T0_asi_reg_wr_75:
	mov	0xa, %r14
	.word 0xf0f38e80  ! 1761: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb12c2001  ! 1762: SLL_I	sll 	%r16, 0x0001, %r24
T0_asi_reg_wr_76:
	mov	0x3, %r14
	.word 0xfaf38e40  ! 1765: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_0_133:
	setx	0x280233, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_142:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_142), 16, 16)) -> intp(0, 0, f)
iob_intr_0_143:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_143), 16, 16)) -> intp(0, 0, 37)
cpu_intr_0_134:
	setx	0x2a030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde54000  ! 1781: SAVE_R	save	%r21, %r0, %r30
	.word 0xb89d214c  ! 1792: XORcc_I	xorcc 	%r20, 0x014c, %r28
	.word 0xbfe56113  ! 1794: SAVE_I	save	%r21, 0x0001, %r31
iob_intr_0_144:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_144), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb3e50000  ! 1799: SAVE_R	save	%r20, %r0, %r25
T0_asi_reg_wr_77:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 1800: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb7e4c000  ! 1801: SAVE_R	save	%r19, %r0, %r27
iob_intr_0_145:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_145), 16, 16)) -> intp(0, 0, 32)
	.word 0xbde5e1ef  ! 1804: SAVE_I	save	%r23, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb295e12a  ! 1807: ORcc_I	orcc 	%r23, 0x012a, %r25
iob_intr_0_146:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_146), 16, 16)) -> intp(0, 0, 9)
T0_asi_reg_rd_88:
	mov	0x2f, %r14
	.word 0xf6db8e40  ! 1816: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_147:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_147), 16, 16)) -> intp(0, 0, 1a)
	.word 0xbbe4e12c  ! 1823: SAVE_I	save	%r19, 0x0001, %r29
iob_intr_0_148:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_148), 16, 16)) -> intp(0, 0, 11)
T0_asi_reg_rd_89:
	mov	0x3c2, %r14
	.word 0xf4db8e60  ! 1826: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_0_149:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_149), 16, 16)) -> intp(0, 0, e)
iob_intr_0_150:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_150), 16, 16)) -> intp(0, 0, 35)
	.word 0xb9540000  ! 1832: RDPR_GL	<illegal instruction>
	.word 0xbbe5e1d7  ! 1838: SAVE_I	save	%r23, 0x0001, %r29
iob_intr_0_151:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_151), 16, 16)) -> intp(0, 0, 32)
	.word 0xbde42001  ! 1843: SAVE_I	save	%r16, 0x0001, %r30
cpu_intr_0_135:
	setx	0x2d0236, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_136:
	setx	0x2c021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_137:
	setx	0x2e023b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_78:
	mov	0x3c4, %r14
	.word 0xf0f38e40  ! 1855: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb22d2144  ! 1856: ANDN_I	andn 	%r20, 0x0144, %r25
iob_intr_0_152:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_152), 16, 16)) -> intp(0, 0, 23)
iob_intr_0_153:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_153), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_rd_90:
	mov	0x1f, %r14
	.word 0xf0db8400  ! 1866: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T0_asi_reg_wr_79:
	mov	0x3c2, %r14
	.word 0xfef38400  ! 1867: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T0_asi_reg_rd_91:
	mov	0x1c, %r14
	.word 0xfadb84a0  ! 1871: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbde40000  ! 1873: SAVE_R	save	%r16, %r0, %r30
	.word 0xbfe48000  ! 1877: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_rd_92:
	mov	0x31, %r14
	.word 0xf0db8e80  ! 1878: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_0_138:
	setx	0x2f0029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_154:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_154), 16, 16)) -> intp(0, 0, 33)
cpu_intr_0_139:
	setx	0x2d0035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_140:
	setx	0x2c0005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8bca108  ! 1905: XNORcc_I	xnorcc 	%r18, 0x0108, %r28
T0_asi_reg_wr_80:
	mov	0x35, %r14
	.word 0xfef38e40  ! 1907: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb7e5a0fc  ! 1911: SAVE_I	save	%r22, 0x0001, %r27
iob_intr_0_155:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_155), 16, 16)) -> intp(0, 0, f)
	.word 0x9194214b  ! 1917: WRPR_PIL_I	wrpr	%r16, 0x014b, %pil
cpu_intr_0_141:
	setx	0x2c0030, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_81:
	mov	0x38, %r14
	.word 0xfaf384a0  ! 1922: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb6b520b8  ! 1923: ORNcc_I	orncc 	%r20, 0x00b8, %r27
cpu_intr_0_142:
	setx	0x2c0132, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_93:
	mov	0x3c7, %r14
	.word 0xf8db8400  ! 1927: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_0_143:
	setx	0x2c0027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4c000  ! 1930: SAVE_R	save	%r19, %r0, %r25
T0_asi_reg_wr_82:
	mov	0x3c6, %r14
	.word 0xfcf38400  ! 1931: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_0_144:
	setx	0x2d0109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe50000  ! 1934: SAVE_R	save	%r20, %r0, %r31
	.word 0xb5e5a140  ! 1937: SAVE_I	save	%r22, 0x0001, %r26
cpu_intr_0_145:
	setx	0x2f021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf643801  ! 1941: MOVcc_I	<illegal instruction>
cpu_intr_0_146:
	setx	0x2e030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb00420b9  ! 1946: ADD_I	add 	%r16, 0x00b9, %r24
cpu_intr_0_147:
	setx	0x2c0312, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_148:
	setx	0x2f0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4c000  ! 1955: SAVE_R	save	%r19, %r0, %r27
cpu_intr_0_149:
	setx	0x2d0236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_156:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_156), 16, 16)) -> intp(0, 0, 33)
	.word 0xbfe4205d  ! 1962: SAVE_I	save	%r16, 0x0001, %r31
cpu_intr_0_150:
	setx	0x2e0338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb234c000  ! 1968: SUBC_R	orn 	%r19, %r0, %r25
T0_asi_reg_rd_94:
	mov	0xb, %r14
	.word 0xf0db84a0  ! 1970: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_0_151:
	setx	0x2f0008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb414c000  ! 1975: OR_R	or 	%r19, %r0, %r26
iob_intr_0_157:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_157), 16, 16)) -> intp(0, 0, 19)
T0_asi_reg_rd_95:
	mov	0x17, %r14
	.word 0xf0db8400  ! 1977: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_0_152:
	setx	0x2e0107, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_96:
	mov	0x3c2, %r14
	.word 0xfadb84a0  ! 1979: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T0_asi_reg_rd_97:
	mov	0x0, %r14
	.word 0xf0db8e60  ! 1981: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb8a54000  ! 1983: SUBcc_R	subcc 	%r21, %r0, %r28
T0_asi_reg_wr_83:
	mov	0x30, %r14
	.word 0xf6f38e40  ! 1986: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_rd_98:
	mov	0x3c3, %r14
	.word 0xfedb8e60  ! 1988: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T0_asi_reg_wr_84:
	mov	0x36, %r14
	.word 0xf2f38e40  ! 1989: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb03de145  ! 1992: XNOR_I	xnor 	%r23, 0x0145, %r24
cpu_intr_0_153:
	setx	0x2d0237, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_154:
	setx	0x2e023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb88c617d  ! 2004: ANDcc_I	andcc 	%r17, 0x017d, %r28
cpu_intr_0_155:
	setx	0x30126, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_99:
	mov	0x3c5, %r14
	.word 0xf2db89e0  ! 2006: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb1e42037  ! 2007: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbfe4a0ed  ! 2013: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3e4212b  ! 2014: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbc1ca1c7  ! 2016: XOR_I	xor 	%r18, 0x01c7, %r30
cpu_intr_0_156:
	setx	0x2d0316, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_157:
	setx	0x2f020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe44000  ! 2024: SAVE_R	save	%r17, %r0, %r29
	.word 0xb9e40000  ! 2026: SAVE_R	save	%r16, %r0, %r28
	.word 0xb3e5e141  ! 2027: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_rd_100:
	mov	0x35, %r14
	.word 0xfedb8e80  ! 2028: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb1e5a0df  ! 2029: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbfe52092  ! 2031: SAVE_I	save	%r20, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_101:
	mov	0x3c8, %r14
	.word 0xf8db8e40  ! 2034: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb1e40000  ! 2036: SAVE_R	save	%r16, %r0, %r24
	.word 0xbbe4c000  ! 2039: SAVE_R	save	%r19, %r0, %r29
	.word 0xb7e54000  ! 2042: SAVE_R	save	%r21, %r0, %r27
cpu_intr_0_158:
	setx	0x2e0120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde50000  ! 2044: SAVE_R	save	%r20, %r0, %r30
cpu_intr_0_159:
	setx	0x2c001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4200e  ! 2046: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb1e5a0b8  ! 2048: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_rd_102:
	mov	0x3c4, %r14
	.word 0xfadb84a0  ! 2049: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T0_asi_reg_wr_85:
	mov	0x3c6, %r14
	.word 0xf2f389e0  ! 2050: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T0_asi_reg_wr_86:
	mov	0x3c6, %r14
	.word 0xf0f389e0  ! 2054: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_0_158:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_158), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb8454000  ! 2057: ADDC_R	addc 	%r21, %r0, %r28
cpu_intr_0_160:
	setx	0x2c031e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_159:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_159), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbfe46014  ! 2066: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_wr_87:
	mov	0x2, %r14
	.word 0xf6f38e40  ! 2067: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_wr_88:
	mov	0x18, %r14
	.word 0xf6f38e80  ! 2070: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb1e40000  ! 2071: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_160:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_160), 16, 16)) -> intp(0, 0, 17)
iob_intr_0_161:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_161), 16, 16)) -> intp(0, 0, 13)
T0_asi_reg_wr_89:
	mov	0xd, %r14
	.word 0xf4f38e40  ! 2075: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0x8594e1b3  ! 2077: WRPR_TSTATE_I	wrpr	%r19, 0x01b3, %tstate
cpu_intr_0_161:
	setx	0x2f0110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde560de  ! 2082: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb9e520de  ! 2086: SAVE_I	save	%r20, 0x0001, %r28
iob_intr_0_162:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_162), 16, 16)) -> intp(0, 0, 17)
	.word 0xb5e56077  ! 2089: SAVE_I	save	%r21, 0x0001, %r26
iob_intr_0_163:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_163), 16, 16)) -> intp(0, 0, 28)
T0_asi_reg_rd_103:
	mov	0x1e, %r14
	.word 0xf8db8e40  ! 2093: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_162:
	setx	0x2e031c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_104:
	mov	0x15, %r14
	.word 0xf6db8e40  ! 2095: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_0_163:
	setx	0x2e0220, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_164:
	setx	0x2d012e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_165:
	setx	0x2c0026, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_90:
	mov	0x28, %r14
	.word 0xf0f38e40  ! 2100: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_wr_91:
	mov	0x26, %r14
	.word 0xfaf38e80  ! 2102: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbde5c000  ! 2104: SAVE_R	save	%r23, %r0, %r30
iob_intr_0_164:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_164), 16, 16)) -> intp(0, 0, 28)
	.word 0xbfe5619a  ! 2106: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbfe560cf  ! 2108: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbde44000  ! 2111: SAVE_R	save	%r17, %r0, %r30
	.word 0xb9e4a0c6  ! 2115: SAVE_I	save	%r18, 0x0001, %r28
cpu_intr_0_166:
	setx	0x2c012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e58000  ! 2120: SAVE_R	save	%r22, %r0, %r24
cpu_intr_0_167:
	setx	0x2c0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe520f0  ! 2125: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbde50000  ! 2129: SAVE_R	save	%r20, %r0, %r30
cpu_intr_0_168:
	setx	0x2d0225, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_165:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_165), 16, 16)) -> intp(0, 0, 3)
	.word 0xbbe52051  ! 2137: SAVE_I	save	%r20, 0x0001, %r29
cpu_intr_0_169:
	setx	0x2f000c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_166:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_166), 16, 16)) -> intp(0, 0, 25)
iob_intr_0_167:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_167), 16, 16)) -> intp(0, 0, 2)
cpu_intr_0_170:
	setx	0x2f013c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_171:
	setx	0x2d0333, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_168:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_168), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_172:
	setx	0x2d0001, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_105:
	mov	0x3c7, %r14
	.word 0xfcdb8e80  ! 2153: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbfe560de  ! 2156: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_wr_92:
	mov	0x14, %r14
	.word 0xf2f38e80  ! 2158: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbbe4e042  ! 2160: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb9e4c000  ! 2162: SAVE_R	save	%r19, %r0, %r28
	.word 0xb9e5e0d5  ! 2163: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e44000  ! 2164: SAVE_R	save	%r17, %r0, %r27
	.word 0xb9e5617e  ! 2165: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb7e5a04e  ! 2167: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbfe4a130  ! 2169: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xba054000  ! 2170: ADD_R	add 	%r21, %r0, %r29
	.word 0xbfe42114  ! 2172: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5e46079  ! 2173: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbde58000  ! 2174: SAVE_R	save	%r22, %r0, %r30
iob_intr_0_169:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_169), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb9e48000  ! 2177: SAVE_R	save	%r18, %r0, %r28
cpu_intr_0_173:
	setx	0x2d001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e0fd  ! 2179: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb2854000  ! 2182: ADDcc_R	addcc 	%r21, %r0, %r25
iob_intr_0_170:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_170), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb1e4e147  ! 2187: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7e5e152  ! 2188: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb1e50000  ! 2189: SAVE_R	save	%r20, %r0, %r24
iob_intr_0_171:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_171), 16, 16)) -> intp(0, 0, 32)
	.word 0xb7e54000  ! 2191: SAVE_R	save	%r21, %r0, %r27
	.word 0xb9e5e1e4  ! 2194: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_rd_106:
	mov	0x2e, %r14
	.word 0xf0db8e40  ! 2198: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_172:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_172), 16, 16)) -> intp(0, 0, a)
cpu_intr_0_174:
	setx	0x2f0334, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_93:
	mov	0xb, %r14
	.word 0xfcf384a0  ! 2205: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb1480000  ! 2208: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
T0_asi_reg_rd_107:
	mov	0xa, %r14
	.word 0xf6db8e40  ! 2210: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_173:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_173), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb3e54000  ! 2213: SAVE_R	save	%r21, %r0, %r25
	.word 0xbfe5c000  ! 2214: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_174:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_174), 16, 16)) -> intp(0, 0, 35)
cpu_intr_0_175:
	setx	0x2c0314, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_94:
	mov	0x27, %r14
	.word 0xf0f38e40  ! 2222: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb2ad6133  ! 2224: ANDNcc_I	andncc 	%r21, 0x0133, %r25
	.word 0xb7e54000  ! 2229: SAVE_R	save	%r21, %r0, %r27
iob_intr_0_175:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_175), 16, 16)) -> intp(0, 0, 2e)
	.word 0xbde5a038  ! 2231: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb7e5c000  ! 2232: SAVE_R	save	%r23, %r0, %r27
	.word 0xb8c50000  ! 2238: ADDCcc_R	addccc 	%r20, %r0, %r28
	.word 0xb7e5a1a3  ! 2239: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb2b4c000  ! 2244: ORNcc_R	orncc 	%r19, %r0, %r25
	.word 0xbfe560bc  ! 2245: SAVE_I	save	%r21, 0x0001, %r31
iob_intr_0_176:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_176), 16, 16)) -> intp(0, 0, 0)
	.word 0xbfe5e118  ! 2255: SAVE_I	save	%r23, 0x0001, %r31
T0_asi_reg_rd_108:
	mov	0x3c2, %r14
	.word 0xf2db89e0  ! 2256: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb5e52051  ! 2258: SAVE_I	save	%r20, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbc34e18b  ! 2261: SUBC_I	orn 	%r19, 0x018b, %r30
	.word 0xb7e4c000  ! 2263: SAVE_R	save	%r19, %r0, %r27
	.word 0xb024619d  ! 2265: SUB_I	sub 	%r17, 0x019d, %r24
	.word 0xb97de401  ! 2266: MOVR_I	movre	%r23, 0x1, %r28
iob_intr_0_177:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_177), 16, 16)) -> intp(0, 0, c)
	.word 0x8394a01e  ! 2270: WRPR_TNPC_I	wrpr	%r18, 0x001e, %tnpc
iob_intr_0_178:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_178), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_wr_95:
	mov	0x29, %r14
	.word 0xf4f384a0  ! 2275: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe420ea  ! 2280: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb5e460e6  ! 2282: SAVE_I	save	%r17, 0x0001, %r26
T0_asi_reg_rd_109:
	mov	0x38, %r14
	.word 0xf0db89e0  ! 2284: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb2b58000  ! 2285: ORNcc_R	orncc 	%r22, %r0, %r25
T0_asi_reg_rd_110:
	mov	0x5, %r14
	.word 0xfcdb84a0  ! 2290: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe50000  ! 2294: SAVE_R	save	%r20, %r0, %r31
iob_intr_0_179:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_179), 16, 16)) -> intp(0, 0, 39)
	.word 0xbfe5e07d  ! 2299: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb7e5a1b3  ! 2300: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb434213e  ! 2302: SUBC_I	orn 	%r16, 0x013e, %r26
	.word 0xbfe4e1c1  ! 2309: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e4e147  ! 2312: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_180:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_180), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb73c3001  ! 2319: SRAX_I	srax	%r16, 0x0001, %r27
	.word 0xbde50000  ! 2321: SAVE_R	save	%r20, %r0, %r30
	.word 0xb0940000  ! 2323: ORcc_R	orcc 	%r16, %r0, %r24
cpu_intr_0_176:
	setx	0x310107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb835e0a0  ! 2335: SUBC_I	orn 	%r23, 0x00a0, %r28
T0_asi_reg_wr_96:
	mov	0xd, %r14
	.word 0xf8f38e80  ! 2336: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_0_181:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_181), 16, 16)) -> intp(0, 0, 29)
	.word 0xbbe58000  ! 2341: SAVE_R	save	%r22, %r0, %r29
	.word 0xbbe460a8  ! 2343: SAVE_I	save	%r17, 0x0001, %r29
iob_intr_0_182:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_182), 16, 16)) -> intp(0, 0, d)
	.word 0xb9e5a0d7  ! 2346: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbbe50000  ! 2349: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_rd_111:
	mov	0x3c2, %r14
	.word 0xf6db84a0  ! 2350: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbca44000  ! 2352: SUBcc_R	subcc 	%r17, %r0, %r30
	.word 0xb015a17b  ! 2353: OR_I	or 	%r22, 0x017b, %r24
	.word 0xbbe4a1d9  ! 2354: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb4340000  ! 2355: ORN_R	orn 	%r16, %r0, %r26
cpu_intr_0_177:
	setx	0x300326, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_97:
	mov	0x2, %r14
	.word 0xf0f384a0  ! 2361: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb3e54000  ! 2362: SAVE_R	save	%r21, %r0, %r25
	.word 0xbbe50000  ! 2363: SAVE_R	save	%r20, %r0, %r29
	.word 0xb3e5e0fa  ! 2366: SAVE_I	save	%r23, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_112:
	mov	0x34, %r14
	.word 0xf6db84a0  ! 2371: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_0_183:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_183), 16, 16)) -> intp(0, 0, 31)
T0_asi_reg_rd_113:
	mov	0x12, %r14
	.word 0xfadb8e40  ! 2373: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_wr_98:
	mov	0x10, %r14
	.word 0xfaf38e40  ! 2374: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_0_178:
	setx	0x320128, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_179:
	setx	0x320004, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_180:
	setx	0x320038, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_114:
	mov	0x3c8, %r14
	.word 0xf4db8e80  ! 2384: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_0_184:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_184), 16, 16)) -> intp(0, 0, 2)
	.word 0xbfe42061  ! 2386: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_wr_99:
	mov	0xc, %r14
	.word 0xf6f38e40  ! 2389: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbde520df  ! 2390: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7e420a5  ! 2393: SAVE_I	save	%r16, 0x0001, %r27
cpu_intr_0_181:
	setx	0x320139, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_100:
	mov	0x6, %r14
	.word 0xfaf38400  ! 2400: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T0_asi_reg_rd_115:
	mov	0x2e, %r14
	.word 0xf8db8e40  ! 2401: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_182:
	setx	0x320104, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_183:
	setx	0x32032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e156  ! 2407: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e420f3  ! 2409: SAVE_I	save	%r16, 0x0001, %r26
cpu_intr_0_184:
	setx	0x30000c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_185:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_185), 16, 16)) -> intp(0, 0, 35)
	.word 0xb9e44000  ! 2413: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_rd_116:
	mov	0x20, %r14
	.word 0xf8db8e80  ! 2418: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T0_asi_reg_wr_101:
	mov	0x3c6, %r14
	.word 0xf8f38e40  ! 2420: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_186:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_186), 16, 16)) -> intp(0, 0, 39)
iob_intr_0_187:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_187), 16, 16)) -> intp(0, 0, 20)
iob_intr_0_188:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_188), 16, 16)) -> intp(0, 0, 1)
	.word 0xb7e4a0e8  ! 2425: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb214c000  ! 2427: OR_R	or 	%r19, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_189:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_189), 16, 16)) -> intp(0, 0, 31)
	.word 0xb7e5c000  ! 2432: SAVE_R	save	%r23, %r0, %r27
	.word 0xbbe54000  ! 2434: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_190:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_190), 16, 16)) -> intp(0, 0, 39)
	.word 0xb3e54000  ! 2436: SAVE_R	save	%r21, %r0, %r25
iob_intr_0_191:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_191), 16, 16)) -> intp(0, 0, 38)
	.word 0xb5e5a1be  ! 2440: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb1e5a0ae  ! 2441: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_192:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_192), 16, 16)) -> intp(0, 0, 2f)
T0_asi_reg_rd_117:
	mov	0x3c7, %r14
	.word 0xf4db8e60  ! 2449: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_0_193:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_193), 16, 16)) -> intp(0, 0, c)
T0_asi_reg_rd_118:
	mov	0x16, %r14
	.word 0xf0db8400  ! 2452: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_0_185:
	setx	0x330028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4c000  ! 2456: SAVE_R	save	%r19, %r0, %r31
	.word 0xbc950000  ! 2459: ORcc_R	orcc 	%r20, %r0, %r30
T0_asi_reg_wr_102:
	mov	0x1e, %r14
	.word 0xfef38e80  ! 2460: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb1e4c000  ! 2464: SAVE_R	save	%r19, %r0, %r24
	.word 0xb3e4a109  ! 2465: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb5e5204b  ! 2466: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb3e5e1eb  ! 2469: SAVE_I	save	%r23, 0x0001, %r25
iob_intr_0_194:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_194), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbfe50000  ! 2474: SAVE_R	save	%r20, %r0, %r31
	.word 0xb1e52039  ! 2476: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb9e4a084  ! 2477: SAVE_I	save	%r18, 0x0001, %r28
iob_intr_0_195:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_195), 16, 16)) -> intp(0, 0, 3c)
iob_intr_0_196:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_196), 16, 16)) -> intp(0, 0, 27)
cpu_intr_0_186:
	setx	0x32030c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_187:
	setx	0x320114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e50000  ! 2487: SAVE_R	save	%r20, %r0, %r26
cpu_intr_0_188:
	setx	0x30020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_197:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_197), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_rd_119:
	mov	0x20, %r14
	.word 0xfadb8400  ! 2492: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T0_asi_reg_rd_120:
	mov	0x28, %r14
	.word 0xfedb89e0  ! 2493: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T0_asi_reg_wr_103:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 2498: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_0_198:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_198), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbbe56095  ! 2501: SAVE_I	save	%r21, 0x0001, %r29
T0_asi_reg_wr_104:
	mov	0x24, %r14
	.word 0xfef38e60  ! 2504: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb61ce19b  ! 2508: XOR_I	xor 	%r19, 0x019b, %r27
T0_asi_reg_wr_105:
	mov	0x38, %r14
	.word 0xf6f38e40  ! 2510: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb8350000  ! 2515: ORN_R	orn 	%r20, %r0, %r28
	.word 0xbbe4e1fe  ! 2518: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb9e4a150  ! 2520: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_rd_121:
	mov	0x3c2, %r14
	.word 0xf8db8e80  ! 2526: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb0c40000  ! 2527: ADDCcc_R	addccc 	%r16, %r0, %r24
	.word 0xb9e4e1ba  ! 2528: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_rd_122:
	mov	0x3c1, %r14
	.word 0xf6db89e0  ! 2529: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_0_199:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_199), 16, 16)) -> intp(0, 0, 26)
	.word 0xbeb5e0c3  ! 2531: ORNcc_I	orncc 	%r23, 0x00c3, %r31
	.word 0xb3e4a1b3  ! 2535: SAVE_I	save	%r18, 0x0001, %r25
cpu_intr_0_189:
	setx	0x300017, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_190:
	setx	0x310201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe2d0000  ! 2539: ANDN_R	andn 	%r20, %r0, %r31
	.word 0xbfe5c000  ! 2542: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_200:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_200), 16, 16)) -> intp(0, 0, 1c)
cpu_intr_0_191:
	setx	0x30010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_106:
	mov	0x16, %r14
	.word 0xf0f38400  ! 2563: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_0_192:
	setx	0x320316, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_193:
	setx	0x300206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4219d  ! 2566: SAVE_I	save	%r16, 0x0001, %r27
T0_asi_reg_rd_123:
	mov	0x34, %r14
	.word 0xf4db8e80  ! 2568: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_0_201:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_201), 16, 16)) -> intp(0, 0, 8)
	.word 0xb9e4a0df  ! 2575: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb1e44000  ! 2581: SAVE_R	save	%r17, %r0, %r24
T0_asi_reg_rd_124:
	mov	0x16, %r14
	.word 0xf2db84a0  ! 2582: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_0_202:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_202), 16, 16)) -> intp(0, 0, 35)
iob_intr_0_203:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_203), 16, 16)) -> intp(0, 0, 3f)
cpu_intr_0_194:
	setx	0x320109, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_195:
	setx	0x320117, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_196:
	setx	0x30031c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_197:
	setx	0x320305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e12a  ! 2597: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb3e4206b  ! 2598: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_rd_125:
	mov	0x28, %r14
	.word 0xfadb8400  ! 2601: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T0_asi_reg_rd_126:
	mov	0x3c0, %r14
	.word 0xfcdb8e60  ! 2602: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbfe5c000  ! 2603: SAVE_R	save	%r23, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_127:
	mov	0x1f, %r14
	.word 0xf6db8400  ! 2606: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbbe50000  ! 2608: SAVE_R	save	%r20, %r0, %r29
cpu_intr_0_198:
	setx	0x320117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 2612: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_rd_128:
	mov	0x7, %r14
	.word 0xf0db8e40  ! 2614: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_199:
	setx	0x30011f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_204:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_204), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb135f001  ! 2617: SRLX_I	srlx	%r23, 0x0001, %r24
	.word 0xbfe44000  ! 2618: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_205:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_205), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb12cc000  ! 2623: SLL_R	sll 	%r19, %r0, %r24
T0_asi_reg_rd_129:
	mov	0x3c6, %r14
	.word 0xf4db8e80  ! 2629: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_0_200:
	setx	0x33001d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_201:
	setx	0x320229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_202:
	setx	0x330205, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_206:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_206), 16, 16)) -> intp(0, 0, a)
	.word 0xb7e4e034  ! 2635: SAVE_I	save	%r19, 0x0001, %r27
T0_asi_reg_rd_130:
	mov	0x0, %r14
	.word 0xf0db84a0  ! 2636: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_0_207:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_207), 16, 16)) -> intp(0, 0, 2f)
cpu_intr_0_203:
	setx	0x310128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e560cb  ! 2646: SAVE_I	save	%r21, 0x0001, %r28
cpu_intr_0_204:
	setx	0x33020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeb4610c  ! 2652: ORNcc_I	orncc 	%r17, 0x010c, %r31
	.word 0xb3e5a171  ! 2653: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb3e5c000  ! 2655: SAVE_R	save	%r23, %r0, %r25
T0_asi_reg_wr_107:
	mov	0x14, %r14
	.word 0xf2f38e40  ! 2657: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_rd_131:
	mov	0x1e, %r14
	.word 0xfadb84a0  ! 2660: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb5e520b0  ! 2663: SAVE_I	save	%r20, 0x0001, %r26
cpu_intr_0_205:
	setx	0x300005, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e50000  ! 2666: SAVE_R	save	%r20, %r0, %r28
iob_intr_0_208:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_208), 16, 16)) -> intp(0, 0, 35)
T0_asi_reg_rd_132:
	mov	0x33, %r14
	.word 0xf0db89e0  ! 2669: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_0_209:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_209), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbbe44000  ! 2672: SAVE_R	save	%r17, %r0, %r29
iob_intr_0_210:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_210), 16, 16)) -> intp(0, 0, f)
cpu_intr_0_206:
	setx	0x310117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb49c8000  ! 2683: XORcc_R	xorcc 	%r18, %r0, %r26
	.word 0xb7e58000  ! 2685: SAVE_R	save	%r22, %r0, %r27
cpu_intr_0_207:
	setx	0x33001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a0aa  ! 2687: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbde44000  ! 2691: SAVE_R	save	%r17, %r0, %r30
cpu_intr_0_208:
	setx	0x32001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_133:
	mov	0xd, %r14
	.word 0xfedb8e60  ! 2695: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_0_211:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_211), 16, 16)) -> intp(0, 0, 0)
iob_intr_0_212:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_212), 16, 16)) -> intp(0, 0, 3b)
cpu_intr_0_209:
	setx	0x310132, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_213:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_213), 16, 16)) -> intp(0, 0, 19)
iob_intr_0_214:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_214), 16, 16)) -> intp(0, 0, 1c)
cpu_intr_0_210:
	setx	0x330136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a008  ! 2711: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbbe4e010  ! 2712: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb1e4e0fc  ! 2714: SAVE_I	save	%r19, 0x0001, %r24
iob_intr_0_215:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_215), 16, 16)) -> intp(0, 0, 2f)
cpu_intr_0_211:
	setx	0x32000d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_216:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_216), 16, 16)) -> intp(0, 0, 24)
	.word 0xbde40000  ! 2721: SAVE_R	save	%r16, %r0, %r30
	.word 0xb094a111  ! 2723: ORcc_I	orcc 	%r18, 0x0111, %r24
	.word 0xb5e44000  ! 2724: SAVE_R	save	%r17, %r0, %r26
T0_asi_reg_rd_134:
	mov	0x11, %r14
	.word 0xf8db89e0  ! 2725: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T0_asi_reg_rd_135:
	mov	0x3c6, %r14
	.word 0xf0db8e80  ! 2727: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbde4c000  ! 2728: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_212:
	setx	0x300309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e54000  ! 2730: SAVE_R	save	%r21, %r0, %r25
	.word 0xb69de180  ! 2733: XORcc_I	xorcc 	%r23, 0x0180, %r27
cpu_intr_0_213:
	setx	0x33003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e46034  ! 2738: SAVE_I	save	%r17, 0x0001, %r27
iob_intr_0_217:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_217), 16, 16)) -> intp(0, 0, 2)
cpu_intr_0_214:
	setx	0x310301, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_108:
	mov	0x3, %r14
	.word 0xfaf38e60  ! 2741: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb3e4e1b7  ! 2743: SAVE_I	save	%r19, 0x0001, %r25
cpu_intr_0_215:
	setx	0x34032d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_218:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_218), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_219:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_219), 16, 16)) -> intp(0, 0, 13)
	.word 0xb7508000  ! 2753: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e4203e  ! 2754: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde421fc  ! 2755: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_wr_109:
	mov	0x3c5, %r14
	.word 0xf8f38e40  ! 2760: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_216:
	setx	0x35000e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_136:
	mov	0x3c8, %r14
	.word 0xf4db8e60  ! 2763: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_0_217:
	setx	0x340324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5c000  ! 2772: SAVE_R	save	%r23, %r0, %r28
T0_asi_reg_rd_137:
	mov	0x17, %r14
	.word 0xf6db84a0  ! 2774: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T0_asi_reg_wr_110:
	mov	0x1e, %r14
	.word 0xfcf38e60  ! 2778: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb9e44000  ! 2780: SAVE_R	save	%r17, %r0, %r28
	.word 0xbbe4c000  ! 2782: SAVE_R	save	%r19, %r0, %r29
	.word 0xb5e5a10b  ! 2784: SAVE_I	save	%r22, 0x0001, %r26
cpu_intr_0_218:
	setx	0x34023f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_220:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_220), 16, 16)) -> intp(0, 0, 2f)
	.word 0xbfe5a010  ! 2794: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb1e4e0d1  ! 2796: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e5a1a9  ! 2797: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb7643801  ! 2798: MOVcc_I	<illegal instruction>
cpu_intr_0_219:
	setx	0x370324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e40000  ! 2801: SAVE_R	save	%r16, %r0, %r25
	.word 0xb3e4e072  ! 2806: SAVE_I	save	%r19, 0x0001, %r25
cpu_intr_0_220:
	setx	0x35031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbde4a0d0  ! 2816: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb23c4000  ! 2820: XNOR_R	xnor 	%r17, %r0, %r25
	.word 0xbfe4e0e6  ! 2822: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_221:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_221), 16, 16)) -> intp(0, 0, 3a)
iob_intr_0_222:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_222), 16, 16)) -> intp(0, 0, 18)
T0_asi_reg_wr_111:
	mov	0xa, %r14
	.word 0xf0f38e40  ! 2825: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb634c000  ! 2828: ORN_R	orn 	%r19, %r0, %r27
iob_intr_0_223:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_223), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb92cb001  ! 2830: SLLX_I	sllx	%r18, 0x0001, %r28
	.word 0xbf2d9000  ! 2832: SLLX_R	sllx	%r22, %r0, %r31
T0_asi_reg_rd_138:
	mov	0x22, %r14
	.word 0xf0db8400  ! 2835: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbbe5a15d  ! 2836: SAVE_I	save	%r22, 0x0001, %r29
cpu_intr_0_221:
	setx	0x360315, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_112:
	mov	0x3c4, %r14
	.word 0xfaf389e0  ! 2841: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T0_asi_reg_wr_113:
	mov	0x2d, %r14
	.word 0xf0f38e40  ! 2843: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbf3d8000  ! 2846: SRA_R	sra 	%r22, %r0, %r31
cpu_intr_0_222:
	setx	0x370226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_223:
	setx	0x360115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5c000  ! 2853: SAVE_R	save	%r23, %r0, %r25
	.word 0xb5e54000  ! 2855: SAVE_R	save	%r21, %r0, %r26
cpu_intr_0_224:
	setx	0x360322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a18e  ! 2858: SAVE_I	save	%r22, 0x0001, %r27
T0_asi_reg_wr_114:
	mov	0x4, %r14
	.word 0xf8f38400  ! 2859: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T0_asi_reg_wr_115:
	mov	0x25, %r14
	.word 0xf2f38e40  ! 2860: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_224:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_224), 16, 16)) -> intp(0, 0, 24)
cpu_intr_0_225:
	setx	0x350212, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_139:
	mov	0x1d, %r14
	.word 0xfadb84a0  ! 2873: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_0_225:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_225), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_rd_140:
	mov	0x38, %r14
	.word 0xf0db8400  ! 2877: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T0_asi_reg_wr_116:
	mov	0x19, %r14
	.word 0xf2f38e60  ! 2881: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_0_226:
	setx	0x370217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde54000  ! 2883: SAVE_R	save	%r21, %r0, %r30
	.word 0xbbe58000  ! 2886: SAVE_R	save	%r22, %r0, %r29
	.word 0xbbe54000  ! 2889: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_226:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_226), 16, 16)) -> intp(0, 0, 2b)
	.word 0xbfe5c000  ! 2891: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_227:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_227), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_228:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_228), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbbe56168  ! 2896: SAVE_I	save	%r21, 0x0001, %r29
iob_intr_0_229:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_229), 16, 16)) -> intp(0, 0, 3e)
	.word 0xbfe50000  ! 2898: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_227:
	setx	0x340214, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_141:
	mov	0x3c7, %r14
	.word 0xf6db8e40  ! 2900: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb1e56066  ! 2901: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbde4a133  ! 2903: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_rd_142:
	mov	0xe, %r14
	.word 0xfadb8e40  ! 2905: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_rd_143:
	mov	0x3c8, %r14
	.word 0xfcdb8400  ! 2906: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbd2d0000  ! 2909: SLL_R	sll 	%r20, %r0, %r30
	.word 0xb3e54000  ! 2910: SAVE_R	save	%r21, %r0, %r25
iob_intr_0_230:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_230), 16, 16)) -> intp(0, 0, 6)
	.word 0xbbe4c000  ! 2914: SAVE_R	save	%r19, %r0, %r29
iob_intr_0_231:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_231), 16, 16)) -> intp(0, 0, c)
iob_intr_0_232:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_232), 16, 16)) -> intp(0, 0, 36)
	.word 0xbde40000  ! 2918: SAVE_R	save	%r16, %r0, %r30
	.word 0xbde5608a  ! 2919: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e48000  ! 2922: SAVE_R	save	%r18, %r0, %r27
iob_intr_0_233:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_233), 16, 16)) -> intp(0, 0, 3d)
iob_intr_0_234:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_234), 16, 16)) -> intp(0, 0, 9)
	.word 0xb5e5e175  ! 2935: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbbe5203f  ! 2937: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb9e4a13f  ! 2938: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbbe5e077  ! 2942: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb3e52117  ! 2943: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_rd_144:
	mov	0x20, %r14
	.word 0xfedb8400  ! 2945: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_0_235:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_235), 16, 16)) -> intp(0, 0, b)
	.word 0xb3e50000  ! 2947: SAVE_R	save	%r20, %r0, %r25
	.word 0xb7e5e1a0  ! 2948: SAVE_I	save	%r23, 0x0001, %r27
cpu_intr_0_228:
	setx	0x37012a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_236:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_236), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_229:
	setx	0x370335, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_145:
	mov	0x3c0, %r14
	.word 0xf2db8e80  ! 2954: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_0_237:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_237), 16, 16)) -> intp(0, 0, 1c)
iob_intr_0_238:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_238), 16, 16)) -> intp(0, 0, 3)
	.word 0xb3e561c9  ! 2964: SAVE_I	save	%r21, 0x0001, %r25
iob_intr_0_239:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_239), 16, 16)) -> intp(0, 0, d)
	.word 0xb02dc000  ! 2972: ANDN_R	andn 	%r23, %r0, %r24
	.word 0xb5e40000  ! 2973: SAVE_R	save	%r16, %r0, %r26
	.word 0xb1348000  ! 2975: SRL_R	srl 	%r18, %r0, %r24
	.word 0xb1e48000  ! 2976: SAVE_R	save	%r18, %r0, %r24
	.word 0xb5e50000  ! 2978: SAVE_R	save	%r20, %r0, %r26
cpu_intr_0_230:
	setx	0x350004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e460ca  ! 2980: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_wr_117:
	mov	0x3c5, %r14
	.word 0xf8f389e0  ! 2981: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb5e4c000  ! 2982: SAVE_R	save	%r19, %r0, %r26
iob_intr_0_240:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_240), 16, 16)) -> intp(0, 0, f)
T0_asi_reg_rd_146:
	mov	0x3c5, %r14
	.word 0xf6db8400  ! 2987: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_0_231:
	setx	0x370008, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_147:
	mov	0x15, %r14
	.word 0xf8db8e60  ! 2990: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T0_asi_reg_wr_118:
	mov	0x1b, %r14
	.word 0xf4f384a0  ! 2991: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_0_232:
	setx	0x35020f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_233:
	setx	0x360222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe50000  ! 2999: SAVE_R	save	%r20, %r0, %r31
	.word 0xbfe58000  ! 3001: SAVE_R	save	%r22, %r0, %r31
	.word 0xbbe5c000  ! 3007: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_234:
	setx	0x360229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_235:
	setx	0x34002a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_241:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_241), 16, 16)) -> intp(0, 0, 2b)
cpu_intr_0_236:
	setx	0x37010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53de001  ! 3023: SRA_I	sra 	%r23, 0x0001, %r26
T0_asi_reg_wr_119:
	mov	0x3c3, %r14
	.word 0xfcf38e40  ! 3026: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0x8394e0ab  ! 3028: WRPR_TNPC_I	wrpr	%r19, 0x00ab, %tnpc
cpu_intr_0_237:
	setx	0x34023a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_238:
	setx	0x35001e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_239:
	setx	0x36021f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_240:
	setx	0x370307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_241:
	setx	0x35031f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_242:
	setx	0x37003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a012  ! 3041: SAVE_I	save	%r18, 0x0001, %r28
cpu_intr_0_243:
	setx	0x370238, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_244:
	setx	0x34000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4c000  ! 3044: SAVE_R	save	%r19, %r0, %r28
	.word 0xb635200a  ! 3047: ORN_I	orn 	%r20, 0x000a, %r27
	.word 0xb5e4207d  ! 3051: SAVE_I	save	%r16, 0x0001, %r26
T0_asi_reg_rd_148:
	mov	0x8, %r14
	.word 0xf8db8e40  ! 3052: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_245:
	setx	0x34030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b48000  ! 3064: ORNcc_R	orncc 	%r18, %r0, %r25
	.word 0xbde5207b  ! 3066: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_wr_120:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 3069: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_wr_121:
	mov	0x30, %r14
	.word 0xf2f38e80  ! 3070: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbe35e191  ! 3071: ORN_I	orn 	%r23, 0x0191, %r31
	.word 0xbde5c000  ! 3072: SAVE_R	save	%r23, %r0, %r30
	.word 0xb9341000  ! 3076: SRLX_R	srlx	%r16, %r0, %r28
	.word 0xbde420cf  ! 3077: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbcb44000  ! 3078: ORNcc_R	orncc 	%r17, %r0, %r30
iob_intr_0_242:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_242), 16, 16)) -> intp(0, 0, 3b)
T0_asi_reg_wr_122:
	mov	0x3c6, %r14
	.word 0xf8f38e40  ! 3081: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb3e5a0e6  ! 3082: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbde40000  ! 3083: SAVE_R	save	%r16, %r0, %r30
T0_asi_reg_wr_123:
	mov	0x3c7, %r14
	.word 0xf8f38e80  ! 3084: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_0_246:
	setx	0x36020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e520a3  ! 3089: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbaa46037  ! 3090: SUBcc_I	subcc 	%r17, 0x0037, %r29
	.word 0xbbe5e146  ! 3094: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbe344000  ! 3096: ORN_R	orn 	%r17, %r0, %r31
	.word 0xb5e48000  ! 3097: SAVE_R	save	%r18, %r0, %r26
	.word 0xbde5a0c5  ! 3102: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_rd_149:
	mov	0x11, %r14
	.word 0xf6db8e80  ! 3103: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbbe5c000  ! 3107: SAVE_R	save	%r23, %r0, %r29
	.word 0xbfe4619b  ! 3108: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbde52007  ! 3109: SAVE_I	save	%r20, 0x0001, %r30
cpu_intr_0_247:
	setx	0x350031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5601a  ! 3117: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb6942127  ! 3118: ORcc_I	orcc 	%r16, 0x0127, %r27
cpu_intr_0_248:
	setx	0x34032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7480000  ! 3120: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb1e4e16a  ! 3123: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbbe5a032  ! 3124: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_243:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_243), 16, 16)) -> intp(0, 0, 31)
	.word 0xbde461ac  ! 3126: SAVE_I	save	%r17, 0x0001, %r30
cpu_intr_0_249:
	setx	0x32c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_150:
	mov	0x2a, %r14
	.word 0xf6db89e0  ! 3129: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb5e44000  ! 3131: SAVE_R	save	%r17, %r0, %r26
iob_intr_0_244:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_244), 16, 16)) -> intp(0, 0, 20)
cpu_intr_0_250:
	setx	0x370231, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_124:
	mov	0x33, %r14
	.word 0xf6f38e40  ! 3140: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbbe461e0  ! 3141: SAVE_I	save	%r17, 0x0001, %r29
cpu_intr_0_251:
	setx	0x37033b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_151:
	mov	0x1, %r14
	.word 0xf4db8400  ! 3145: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T0_asi_reg_rd_152:
	mov	0x24, %r14
	.word 0xf0db8e60  ! 3146: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T0_asi_reg_rd_153:
	mov	0x3c8, %r14
	.word 0xf8db84a0  ! 3147: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_0_245:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_245), 16, 16)) -> intp(0, 0, 9)
	.word 0xb7e54000  ! 3149: SAVE_R	save	%r21, %r0, %r27
cpu_intr_0_252:
	setx	0x340229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e56081  ! 3158: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb9508000  ! 3159: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e40000  ! 3160: SAVE_R	save	%r16, %r0, %r27
iob_intr_0_246:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_246), 16, 16)) -> intp(0, 0, 30)
	.word 0xb5e5a113  ! 3162: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb9e5c000  ! 3163: SAVE_R	save	%r23, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbde5a0fd  ! 3165: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_wr_125:
	mov	0x4, %r14
	.word 0xfaf389e0  ! 3167: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T0_asi_reg_wr_126:
	mov	0x3c3, %r14
	.word 0xf4f389e0  ! 3169: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_0_253:
	setx	0x370025, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_247:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_247), 16, 16)) -> intp(0, 0, 3d)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfe5c000  ! 3178: SAVE_R	save	%r23, %r0, %r31
	.word 0xb1e4a0b1  ! 3179: SAVE_I	save	%r18, 0x0001, %r24
cpu_intr_0_254:
	setx	0x360335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e54000  ! 3184: SAVE_R	save	%r21, %r0, %r28
	.word 0xb5e420a6  ! 3187: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb1e56075  ! 3188: SAVE_I	save	%r21, 0x0001, %r24
T0_asi_reg_rd_154:
	mov	0x3c7, %r14
	.word 0xfcdb8400  ! 3189: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbde40000  ! 3190: SAVE_R	save	%r16, %r0, %r30
	.word 0xb9e52037  ! 3192: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb7e58000  ! 3193: SAVE_R	save	%r22, %r0, %r27
iob_intr_0_248:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_248), 16, 16)) -> intp(0, 0, 16)
	.word 0x89942085  ! 3200: WRPR_TICK_I	wrpr	%r16, 0x0085, %tick
	.word 0xb3e48000  ! 3201: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_wr_127:
	mov	0x1f, %r14
	.word 0xfef38e40  ! 3202: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbea4a0dc  ! 3203: SUBcc_I	subcc 	%r18, 0x00dc, %r31
cpu_intr_0_255:
	setx	0x3b0209, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_155:
	mov	0x3c0, %r14
	.word 0xf4db8e40  ! 3206: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_0_256:
	setx	0x39011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e520d9  ! 3210: SAVE_I	save	%r20, 0x0001, %r27
T0_asi_reg_rd_156:
	mov	0x34, %r14
	.word 0xf4db8e60  ! 3211: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_0_249:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_249), 16, 16)) -> intp(0, 0, 37)
	.word 0xb7e48000  ! 3213: SAVE_R	save	%r18, %r0, %r27
	.word 0xb5e4603a  ! 3214: SAVE_I	save	%r17, 0x0001, %r26
iob_intr_0_250:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_250), 16, 16)) -> intp(0, 0, 36)
cpu_intr_0_257:
	setx	0x3b033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 3217: SAVE_R	save	%r23, %r0, %r27
	.word 0xb3e5a0c6  ! 3219: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_258:
	setx	0x3a032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_259:
	setx	0x3b020f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_157:
	mov	0x22, %r14
	.word 0xf4db8400  ! 3228: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T0_asi_reg_rd_158:
	mov	0x27, %r14
	.word 0xfedb8e60  ! 3230: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb7e54000  ! 3233: SAVE_R	save	%r21, %r0, %r27
	.word 0xb5e421bc  ! 3234: SAVE_I	save	%r16, 0x0001, %r26
T0_asi_reg_rd_159:
	mov	0x34, %r14
	.word 0xf0db89e0  ! 3240: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_0_251:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_251), 16, 16)) -> intp(0, 0, 2b)
	.word 0xbb643801  ! 3247: MOVcc_I	<illegal instruction>
iob_intr_0_252:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_252), 16, 16)) -> intp(0, 0, 2b)
T0_asi_reg_rd_160:
	mov	0x36, %r14
	.word 0xfcdb8e40  ! 3252: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_rd_161:
	mov	0x3c3, %r14
	.word 0xf8db84a0  ! 3255: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_0_260:
	setx	0x38001a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_128:
	mov	0x33, %r14
	.word 0xfcf38e60  ! 3260: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_0_261:
	setx	0x3b010b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_262:
	setx	0x390337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e58000  ! 3265: SAVE_R	save	%r22, %r0, %r27
	.word 0xb3e48000  ! 3267: SAVE_R	save	%r18, %r0, %r25
	.word 0xb9e54000  ! 3268: SAVE_R	save	%r21, %r0, %r28
	.word 0xba3d619a  ! 3273: XNOR_I	xnor 	%r21, 0x019a, %r29
	.word 0xb5e54000  ! 3275: SAVE_R	save	%r21, %r0, %r26
iob_intr_0_253:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_253), 16, 16)) -> intp(0, 0, 2e)
iob_intr_0_254:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_254), 16, 16)) -> intp(0, 0, 24)
	.word 0xb1e561ab  ! 3283: SAVE_I	save	%r21, 0x0001, %r24
iob_intr_0_255:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_255), 16, 16)) -> intp(0, 0, 3a)
	.word 0xbde4a14a  ! 3285: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbfe4206c  ! 3287: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbfe50000  ! 3290: SAVE_R	save	%r20, %r0, %r31
	.word 0xbfe44000  ! 3292: SAVE_R	save	%r17, %r0, %r31
	.word 0xbbe58000  ! 3293: SAVE_R	save	%r22, %r0, %r29
	.word 0xbde56002  ! 3295: SAVE_I	save	%r21, 0x0001, %r30
T0_asi_reg_rd_162:
	mov	0x33, %r14
	.word 0xf0db84a0  ! 3296: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb214c000  ! 3297: OR_R	or 	%r19, %r0, %r25
	.word 0xbfe48000  ! 3298: SAVE_R	save	%r18, %r0, %r31
	.word 0xb01d0000  ! 3299: XOR_R	xor 	%r20, %r0, %r24
iob_intr_0_256:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_256), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb9e50000  ! 3301: SAVE_R	save	%r20, %r0, %r28
T0_asi_reg_wr_129:
	mov	0x2a, %r14
	.word 0xfaf38e40  ! 3307: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb6c5218a  ! 3309: ADDCcc_I	addccc 	%r20, 0x018a, %r27
cpu_intr_0_263:
	setx	0x3b0300, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_163:
	mov	0xd, %r14
	.word 0xfadb8e60  ! 3312: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb5e560ac  ! 3313: SAVE_I	save	%r21, 0x0001, %r26
iob_intr_0_257:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_257), 16, 16)) -> intp(0, 0, 2d)
cpu_intr_0_264:
	setx	0x38020e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_265:
	setx	0x39001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb80c8000  ! 3318: AND_R	and 	%r18, %r0, %r28
	.word 0xb1e5a085  ! 3320: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_258:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_258), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbcc5c000  ! 3323: ADDCcc_R	addccc 	%r23, %r0, %r30
	.word 0xb72c4000  ! 3324: SLL_R	sll 	%r17, %r0, %r27
T0_asi_reg_wr_130:
	mov	0x35, %r14
	.word 0xf8f38e60  ! 3327: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb5e4e131  ! 3329: SAVE_I	save	%r19, 0x0001, %r26
iob_intr_0_259:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_259), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb1e48000  ! 3332: SAVE_R	save	%r18, %r0, %r24
	.word 0xbbe40000  ! 3335: SAVE_R	save	%r16, %r0, %r29
iob_intr_0_260:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_260), 16, 16)) -> intp(0, 0, 39)
	.word 0xb7e48000  ! 3345: SAVE_R	save	%r18, %r0, %r27
T0_asi_reg_rd_164:
	mov	0xf, %r14
	.word 0xf2db84a0  ! 3347: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_0_266:
	setx	0x380329, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_261:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_261), 16, 16)) -> intp(0, 0, 2f)
cpu_intr_0_267:
	setx	0x38022d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_131:
	mov	0x35, %r14
	.word 0xf6f38e40  ! 3352: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_0_268:
	setx	0x3a0215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe46040  ! 3358: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_wr_132:
	mov	0x3c3, %r14
	.word 0xfaf38e60  ! 3360: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_0_262:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_262), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb3e5a063  ! 3368: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb9e42144  ! 3370: SAVE_I	save	%r16, 0x0001, %r28
T0_asi_reg_wr_133:
	mov	0x26, %r14
	.word 0xf4f38400  ! 3371: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbf643801  ! 3373: MOVcc_I	<illegal instruction>
iob_intr_0_263:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_263), 16, 16)) -> intp(0, 0, 17)
	.word 0xbfe4e1c9  ! 3376: SAVE_I	save	%r19, 0x0001, %r31
T0_asi_reg_wr_134:
	mov	0x3c7, %r14
	.word 0xf8f38e60  ! 3378: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_0_269:
	setx	0x3b011e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_135:
	mov	0x1b, %r14
	.word 0xf8f389e0  ! 3385: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbfe58000  ! 3386: SAVE_R	save	%r22, %r0, %r31
T0_asi_reg_wr_136:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 3387: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_270:
	setx	0x3b0129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_271:
	setx	0x3a0237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5219c  ! 3391: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbbe5206e  ! 3393: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb9e40000  ! 3394: SAVE_R	save	%r16, %r0, %r28
cpu_intr_0_272:
	setx	0x380212, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_165:
	mov	0x1f, %r14
	.word 0xfadb84a0  ! 3397: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T0_asi_reg_rd_166:
	mov	0x1d, %r14
	.word 0xfcdb8e60  ! 3398: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_0_264:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_264), 16, 16)) -> intp(0, 0, 12)
T0_asi_reg_rd_167:
	mov	0x3c8, %r14
	.word 0xf0db89e0  ! 3406: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb3e50000  ! 3412: SAVE_R	save	%r20, %r0, %r25
	.word 0xbde42025  ! 3414: SAVE_I	save	%r16, 0x0001, %r30
cpu_intr_0_273:
	setx	0x3b020f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_137:
	mov	0x3c0, %r14
	.word 0xf0f38400  ! 3419: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb7e50000  ! 3420: SAVE_R	save	%r20, %r0, %r27
	.word 0xb72cb001  ! 3423: SLLX_I	sllx	%r18, 0x0001, %r27
cpu_intr_0_274:
	setx	0x390309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e44000  ! 3426: SAVE_R	save	%r17, %r0, %r26
	.word 0xb695c000  ! 3431: ORcc_R	orcc 	%r23, %r0, %r27
	.word 0xbfe54000  ! 3432: SAVE_R	save	%r21, %r0, %r31
cpu_intr_0_275:
	setx	0x3a010f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_265:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_265), 16, 16)) -> intp(0, 0, 13)
cpu_intr_0_276:
	setx	0x3a022e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_266:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_266), 16, 16)) -> intp(0, 0, 2e)
T0_asi_reg_rd_168:
	mov	0x31, %r14
	.word 0xf8db8400  ! 3447: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T0_asi_reg_rd_169:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 3451: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbbe52099  ! 3454: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbfe54000  ! 3456: SAVE_R	save	%r21, %r0, %r31
	.word 0xbde5c000  ! 3457: SAVE_R	save	%r23, %r0, %r30
	.word 0x919460de  ! 3459: WRPR_PIL_I	wrpr	%r17, 0x00de, %pil
T0_asi_reg_rd_170:
	mov	0x3c3, %r14
	.word 0xf2db84a0  ! 3468: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_277:
	setx	0x3b0000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e58000  ! 3474: SAVE_R	save	%r22, %r0, %r28
	.word 0xb5e40000  ! 3475: SAVE_R	save	%r16, %r0, %r26
	.word 0xb9e40000  ! 3476: SAVE_R	save	%r16, %r0, %r28
	.word 0xb9e56193  ! 3483: SAVE_I	save	%r21, 0x0001, %r28
T0_asi_reg_rd_171:
	mov	0x1c, %r14
	.word 0xfadb8e40  ! 3484: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_267:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_267), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb3e4e143  ! 3487: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_wr_138:
	mov	0x3c7, %r14
	.word 0xfcf384a0  ! 3492: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb7e5e1d8  ! 3493: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbbe40000  ! 3495: SAVE_R	save	%r16, %r0, %r29
	.word 0xbbe4c000  ! 3499: SAVE_R	save	%r19, %r0, %r29
T0_asi_reg_rd_172:
	mov	0x34, %r14
	.word 0xfadb8400  ! 3506: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb9e5a1de  ! 3509: SAVE_I	save	%r22, 0x0001, %r28
cpu_intr_0_278:
	setx	0x380332, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_139:
	mov	0xc, %r14
	.word 0xfef38e40  ! 3513: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_0_268:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_268), 16, 16)) -> intp(0, 0, 3)
cpu_intr_0_279:
	setx	0x380013, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_269:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_269), 16, 16)) -> intp(0, 0, 1b)
T0_asi_reg_rd_173:
	mov	0x36, %r14
	.word 0xfadb8e60  ! 3518: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb5e52121  ! 3521: SAVE_I	save	%r20, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_280:
	setx	0x390137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e0e5  ! 3528: SAVE_I	save	%r19, 0x0001, %r27
iob_intr_0_270:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_270), 16, 16)) -> intp(0, 0, 18)
cpu_intr_0_281:
	setx	0x3b0330, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_282:
	setx	0x3a031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e17e  ! 3534: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb3e4c000  ! 3538: SAVE_R	save	%r19, %r0, %r25
	.word 0xb33ce001  ! 3539: SRA_I	sra 	%r19, 0x0001, %r25
	.word 0xb1e5a055  ! 3540: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_271:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_271), 16, 16)) -> intp(0, 0, 1b)
iob_intr_0_272:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_272), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb9e48000  ! 3543: SAVE_R	save	%r18, %r0, %r28
	.word 0xb9e54000  ! 3545: SAVE_R	save	%r21, %r0, %r28
	.word 0xbfe50000  ! 3546: SAVE_R	save	%r20, %r0, %r31
iob_intr_0_273:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_273), 16, 16)) -> intp(0, 0, 29)
cpu_intr_0_283:
	setx	0x3a012f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_174:
	mov	0x2e, %r14
	.word 0xf4db8e80  ! 3556: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbfe40000  ! 3557: SAVE_R	save	%r16, %r0, %r31
	.word 0xbbe4a1f5  ! 3558: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb9e4a0a2  ! 3559: SAVE_I	save	%r18, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_175:
	mov	0x7, %r14
	.word 0xf6db8400  ! 3561: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb4a56189  ! 3565: SUBcc_I	subcc 	%r21, 0x0189, %r26
cpu_intr_0_284:
	setx	0x380027, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_274:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_274), 16, 16)) -> intp(0, 0, 31)
	.word 0xbde5e015  ! 3568: SAVE_I	save	%r23, 0x0001, %r30
cpu_intr_0_285:
	setx	0x380207, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_176:
	mov	0x34, %r14
	.word 0xfcdb84a0  ! 3571: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T0_asi_reg_rd_177:
	mov	0x26, %r14
	.word 0xf4db8e40  ! 3573: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T0_asi_reg_rd_178:
	mov	0x5, %r14
	.word 0xfadb8e40  ! 3574: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_286:
	setx	0x380121, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_140:
	mov	0x1a, %r14
	.word 0xfef38e60  ! 3577: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_0_287:
	setx	0x380027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_288:
	setx	0x3b022c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_275:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_275), 16, 16)) -> intp(0, 0, 7)
	.word 0xb3e56062  ! 3584: SAVE_I	save	%r21, 0x0001, %r25
cpu_intr_0_289:
	setx	0x39001f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_276:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_276), 16, 16)) -> intp(0, 0, 35)
	.word 0xbfe4c000  ! 3588: SAVE_R	save	%r19, %r0, %r31
cpu_intr_0_290:
	setx	0x390016, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_277:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_277), 16, 16)) -> intp(0, 0, 16)
iob_intr_0_278:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_278), 16, 16)) -> intp(0, 0, 1b)
T0_asi_reg_rd_179:
	mov	0x26, %r14
	.word 0xf4db8e40  ! 3593: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_279:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_279), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_rd_180:
	mov	0x28, %r14
	.word 0xfadb84a0  ! 3596: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb9e4609f  ! 3598: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_280:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_280), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb1e4a169  ! 3601: SAVE_I	save	%r18, 0x0001, %r24
iob_intr_0_281:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_281), 16, 16)) -> intp(0, 0, 30)
	.word 0xbf2c7001  ! 3606: SLLX_I	sllx	%r17, 0x0001, %r31
	.word 0xb1e4c000  ! 3610: SAVE_R	save	%r19, %r0, %r24
cpu_intr_0_291:
	setx	0x3b0027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_292:
	setx	0x39002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5c000  ! 3619: SAVE_R	save	%r23, %r0, %r24
	.word 0xb6ac60b9  ! 3620: ANDNcc_I	andncc 	%r17, 0x00b9, %r27
	.word 0xb1e40000  ! 3624: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_282:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_282), 16, 16)) -> intp(0, 0, 27)
iob_intr_0_283:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_283), 16, 16)) -> intp(0, 0, 23)
	.word 0xb1e44000  ! 3631: SAVE_R	save	%r17, %r0, %r24
	.word 0xb5e5c000  ! 3635: SAVE_R	save	%r23, %r0, %r26
	.word 0xb5e4c000  ! 3641: SAVE_R	save	%r19, %r0, %r26
	.word 0xb7e4e1c8  ! 3642: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb1e4c000  ! 3645: SAVE_R	save	%r19, %r0, %r24
T0_asi_reg_rd_181:
	mov	0xf, %r14
	.word 0xf0db8400  ! 3646: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T0_asi_reg_rd_182:
	mov	0x3c4, %r14
	.word 0xf6db8e40  ! 3648: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_284:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_284), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb1e50000  ! 3652: SAVE_R	save	%r20, %r0, %r24
	.word 0xb5e56094  ! 3654: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5e5e0b2  ! 3655: SAVE_I	save	%r23, 0x0001, %r26
iob_intr_0_285:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_285), 16, 16)) -> intp(0, 0, b)
	.word 0xb5e4600a  ! 3662: SAVE_I	save	%r17, 0x0001, %r26
T0_asi_reg_wr_141:
	mov	0x3c1, %r14
	.word 0xf6f38400  ! 3663: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb1e48000  ! 3665: SAVE_R	save	%r18, %r0, %r24
iob_intr_0_286:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_286), 16, 16)) -> intp(0, 0, 24)
	.word 0xb8b5e029  ! 3675: SUBCcc_I	orncc 	%r23, 0x0029, %r28
cpu_intr_0_293:
	setx	0x3f030c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_294:
	setx	0x3f0038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_287:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_287), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbde5214e  ! 3681: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb2956080  ! 3684: ORcc_I	orcc 	%r21, 0x0080, %r25
T0_asi_reg_wr_142:
	mov	0x3c7, %r14
	.word 0xfcf38e80  ! 3685: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0x8594e164  ! 3688: WRPR_TSTATE_I	wrpr	%r19, 0x0164, %tstate
T0_asi_reg_rd_183:
	mov	0x3c5, %r14
	.word 0xfedb84a0  ! 3689: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_0_288:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_288), 16, 16)) -> intp(0, 0, 3)
	.word 0xbf3ca001  ! 3695: SRA_I	sra 	%r18, 0x0001, %r31
iob_intr_0_289:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_289), 16, 16)) -> intp(0, 0, 23)
	.word 0xb1e5213b  ! 3698: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbd518000  ! 3702: RDPR_PSTATE	<illegal instruction>
T0_asi_reg_wr_143:
	mov	0x10, %r14
	.word 0xfaf384a0  ! 3704: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_0_295:
	setx	0x3f0306, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_290:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_290), 16, 16)) -> intp(0, 0, 37)
T0_asi_reg_wr_144:
	mov	0x2c, %r14
	.word 0xfcf38e60  ! 3708: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbbe44000  ! 3711: SAVE_R	save	%r17, %r0, %r29
	.word 0xb1e44000  ! 3712: SAVE_R	save	%r17, %r0, %r24
T0_asi_reg_rd_184:
	mov	0x11, %r14
	.word 0xf2db89e0  ! 3713: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbfe5a172  ! 3718: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbfe5e115  ! 3720: SAVE_I	save	%r23, 0x0001, %r31
cpu_intr_0_296:
	setx	0x3c0238, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e5c000  ! 3726: SAVE_R	save	%r23, %r0, %r26
	.word 0xbde421fc  ! 3728: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbbe5c000  ! 3729: SAVE_R	save	%r23, %r0, %r29
T0_asi_reg_wr_145:
	mov	0x4, %r14
	.word 0xfcf38e80  ! 3732: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb1e4600b  ! 3733: SAVE_I	save	%r17, 0x0001, %r24
cpu_intr_0_297:
	setx	0x3e023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e1dc  ! 3736: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_291:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_291), 16, 16)) -> intp(0, 0, 33)
	.word 0xbfe5a062  ! 3747: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbde4c000  ! 3749: SAVE_R	save	%r19, %r0, %r30
	.word 0xbbe4a1f7  ! 3751: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb5e48000  ! 3752: SAVE_R	save	%r18, %r0, %r26
	.word 0xbfe5a188  ! 3753: SAVE_I	save	%r22, 0x0001, %r31
T0_asi_reg_rd_185:
	mov	0x3c2, %r14
	.word 0xfedb8400  ! 3755: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T0_asi_reg_wr_146:
	mov	0x38, %r14
	.word 0xfef38e60  ! 3757: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_0_292:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_292), 16, 16)) -> intp(0, 0, d)
	.word 0xbde4c000  ! 3764: SAVE_R	save	%r19, %r0, %r30
	.word 0xbbe46022  ! 3765: SAVE_I	save	%r17, 0x0001, %r29
T0_asi_reg_rd_186:
	mov	0x3c1, %r14
	.word 0xf2db8e80  ! 3766: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbbe5211e  ! 3768: SAVE_I	save	%r20, 0x0001, %r29
cpu_intr_0_298:
	setx	0x3c023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_147:
	mov	0x33, %r14
	.word 0xfaf38e60  ! 3771: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb295e19f  ! 3772: ORcc_I	orcc 	%r23, 0x019f, %r25
	.word 0xb1e5c000  ! 3773: SAVE_R	save	%r23, %r0, %r24
	.word 0xbbe4c000  ! 3776: SAVE_R	save	%r19, %r0, %r29
	.word 0xb1e5a05c  ! 3778: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_293:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_293), 16, 16)) -> intp(0, 0, b)
cpu_intr_0_299:
	setx	0x3c0133, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_148:
	mov	0x33, %r14
	.word 0xfaf384a0  ! 3786: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T0_asi_reg_wr_149:
	mov	0x16, %r14
	.word 0xf0f389e0  ! 3790: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T0_asi_reg_wr_150:
	mov	0x1d, %r14
	.word 0xf4f389e0  ! 3791: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T0_asi_reg_wr_151:
	mov	0x30, %r14
	.word 0xf8f389e0  ! 3799: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_0_294:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_294), 16, 16)) -> intp(0, 0, 13)
	.word 0xbbe4e0a7  ! 3815: SAVE_I	save	%r19, 0x0001, %r29
iob_intr_0_295:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_295), 16, 16)) -> intp(0, 0, 10)
	.word 0xbde40000  ! 3822: SAVE_R	save	%r16, %r0, %r30
	.word 0xb88d4000  ! 3826: ANDcc_R	andcc 	%r21, %r0, %r28
cpu_intr_0_300:
	setx	0x3e031a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_301:
	setx	0x3c0026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e521ba  ! 3829: SAVE_I	save	%r20, 0x0001, %r27
T0_asi_reg_rd_187:
	mov	0x3c2, %r14
	.word 0xf6db89e0  ! 3832: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_0_296:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_296), 16, 16)) -> intp(0, 0, 20)
	.word 0xb9e58000  ! 3838: SAVE_R	save	%r22, %r0, %r28
	.word 0xb1e5c000  ! 3839: SAVE_R	save	%r23, %r0, %r24
iob_intr_0_297:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_297), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_wr_152:
	mov	0x3c2, %r14
	.word 0xf0f384a0  ! 3844: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T0_asi_reg_rd_188:
	mov	0x35, %r14
	.word 0xfcdb8e40  ! 3845: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_rd_189:
	mov	0x29, %r14
	.word 0xfcdb8e40  ! 3847: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_0_298:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_298), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_rd_190:
	mov	0x3c8, %r14
	.word 0xfadb89e0  ! 3849: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T0_asi_reg_rd_191:
	mov	0x4, %r14
	.word 0xf6db84a0  ! 3851: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T0_asi_reg_rd_192:
	mov	0x4, %r14
	.word 0xfcdb8e40  ! 3852: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb7e44000  ! 3853: SAVE_R	save	%r17, %r0, %r27
iob_intr_0_299:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_299), 16, 16)) -> intp(0, 0, 13)
cpu_intr_0_302:
	setx	0x3d0234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e0b6  ! 3857: SAVE_I	save	%r23, 0x0001, %r29
T0_asi_reg_rd_193:
	mov	0x3c4, %r14
	.word 0xfadb8400  ! 3859: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb5e58000  ! 3860: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_rd_194:
	mov	0x3c8, %r14
	.word 0xfadb8e40  ! 3861: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbde4a09d  ! 3862: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e56094  ! 3863: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbf2c9000  ! 3867: SLLX_R	sllx	%r18, %r0, %r31
cpu_intr_0_303:
	setx	0x3d011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x89946131  ! 3870: WRPR_TICK_I	wrpr	%r17, 0x0131, %tick
iob_intr_0_300:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_300), 16, 16)) -> intp(0, 0, 13)
	.word 0xb68420a7  ! 3876: ADDcc_I	addcc 	%r16, 0x00a7, %r27
T0_asi_reg_wr_153:
	mov	0x3c1, %r14
	.word 0xf0f38e40  ! 3878: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_304:
	setx	0x3f0033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb32c4000  ! 3880: SLL_R	sll 	%r17, %r0, %r25
	.word 0xbfe40000  ! 3881: SAVE_R	save	%r16, %r0, %r31
	.word 0xb1e4210f  ! 3883: SAVE_I	save	%r16, 0x0001, %r24
cpu_intr_0_305:
	setx	0x3e031a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_195:
	mov	0x30, %r14
	.word 0xf4db89e0  ! 3890: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb43c217c  ! 3891: XNOR_I	xnor 	%r16, 0x017c, %r26
	.word 0xb3e54000  ! 3892: SAVE_R	save	%r21, %r0, %r25
iob_intr_0_301:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_301), 16, 16)) -> intp(0, 0, 31)
T0_asi_reg_rd_196:
	mov	0x3c8, %r14
	.word 0xfcdb8e40  ! 3896: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb3e46136  ! 3897: SAVE_I	save	%r17, 0x0001, %r25
iob_intr_0_302:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_302), 16, 16)) -> intp(0, 0, 2e)
iob_intr_0_303:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_303), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb1e50000  ! 3906: SAVE_R	save	%r20, %r0, %r24
T0_asi_reg_wr_154:
	mov	0x2f, %r14
	.word 0xf6f38400  ! 3908: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb5e48000  ! 3909: SAVE_R	save	%r18, %r0, %r26
cpu_intr_0_306:
	setx	0x3e002a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_307:
	setx	0x3f0338, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_304:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_304), 16, 16)) -> intp(0, 0, 10)
cpu_intr_0_308:
	setx	0x3f0300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf2c0000  ! 3921: SLL_R	sll 	%r16, %r0, %r31
cpu_intr_0_309:
	setx	0x3c032b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_305:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_305), 16, 16)) -> intp(0, 0, a)
iob_intr_0_306:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_306), 16, 16)) -> intp(0, 0, 28)
	.word 0xb2852184  ! 3927: ADDcc_I	addcc 	%r20, 0x0184, %r25
T0_asi_reg_rd_197:
	mov	0x1f, %r14
	.word 0xf4db8e40  ! 3928: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_0_310:
	setx	0x3c0009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb22ce196  ! 3931: ANDN_I	andn 	%r19, 0x0196, %r25
	.word 0xbbe40000  ! 3934: SAVE_R	save	%r16, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_155:
	mov	0x12, %r14
	.word 0xfef38e60  ! 3940: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_0_311:
	setx	0x3c030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a0c2  ! 3942: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_rd_198:
	mov	0x13, %r14
	.word 0xfedb8e60  ! 3943: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_0_307:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_307), 16, 16)) -> intp(0, 0, 16)
	.word 0xb1e5e142  ! 3946: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_wr_156:
	mov	0x2f, %r14
	.word 0xfef38e80  ! 3951: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb5e48000  ! 3952: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_308:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_308), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_rd_199:
	mov	0x3c8, %r14
	.word 0xf2db8400  ! 3957: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb7e4a164  ! 3959: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb9e4e0c4  ! 3960: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbfe54000  ! 3961: SAVE_R	save	%r21, %r0, %r31
	.word 0xb085e174  ! 3962: ADDcc_I	addcc 	%r23, 0x0174, %r24
iob_intr_0_309:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_309), 16, 16)) -> intp(0, 0, b)
T0_asi_reg_rd_200:
	mov	0x2b, %r14
	.word 0xf2db84a0  ! 3970: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb1e521c2  ! 3971: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb1e4e135  ! 3976: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbde5c000  ! 3979: SAVE_R	save	%r23, %r0, %r30
iob_intr_0_310:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_310), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_wr_157:
	mov	0x19, %r14
	.word 0xfcf38e60  ! 3982: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb73cc000  ! 3983: SRA_R	sra 	%r19, %r0, %r27
cpu_intr_0_312:
	setx	0x3f010a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_311:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_311), 16, 16)) -> intp(0, 0, e)
	.word 0xbde58000  ! 3989: SAVE_R	save	%r22, %r0, %r30
	.word 0xb3e5e1c8  ! 3992: SAVE_I	save	%r23, 0x0001, %r25
cpu_intr_0_313:
	setx	0x3c0033, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_314:
	setx	0x3e031b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_201:
	mov	0x25, %r14
	.word 0xfadb89e0  ! 3995: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_0_312:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_312), 16, 16)) -> intp(0, 0, 26)
cpu_intr_0_315:
	setx	0x3d0110, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_313:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_313), 16, 16)) -> intp(0, 0, 3a)
cpu_intr_0_316:
	setx	0x3f002a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_317:
	setx	0x3e0113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_314:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_314), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb2846178  ! 4016: ADDcc_I	addcc 	%r17, 0x0178, %r25
	.word 0xb1e461f4  ! 4019: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb5e5e081  ! 4023: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb4858000  ! 4024: ADDcc_R	addcc 	%r22, %r0, %r26
	.word 0xb9e50000  ! 4025: SAVE_R	save	%r20, %r0, %r28
cpu_intr_0_318:
	setx	0x3e0309, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_202:
	mov	0x1c, %r14
	.word 0xfedb8e40  ! 4028: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb1e5219b  ! 4029: SAVE_I	save	%r20, 0x0001, %r24
cpu_intr_0_319:
	setx	0x3d0324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde50000  ! 4033: SAVE_R	save	%r20, %r0, %r30
cpu_intr_0_320:
	setx	0x3d0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a120  ! 4037: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_315:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_315), 16, 16)) -> intp(0, 0, 3a)
cpu_intr_0_321:
	setx	0x3f013a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_316:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_316), 16, 16)) -> intp(0, 0, 8)
	.word 0xb7e58000  ! 4046: SAVE_R	save	%r22, %r0, %r27
	.word 0xb3e40000  ! 4049: SAVE_R	save	%r16, %r0, %r25
	.word 0xb9e4c000  ! 4050: SAVE_R	save	%r19, %r0, %r28
T0_asi_reg_wr_158:
	mov	0x3c6, %r14
	.word 0xf2f38e80  ! 4053: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_0_322:
	setx	0x3d0302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5c000  ! 4059: SAVE_R	save	%r23, %r0, %r29
	.word 0xbbe52198  ! 4061: SAVE_I	save	%r20, 0x0001, %r29
cpu_intr_0_323:
	setx	0x3f0031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5208c  ! 4064: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb4a4c000  ! 4068: SUBcc_R	subcc 	%r19, %r0, %r26
cpu_intr_0_324:
	setx	0x3e0117, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_317:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_317), 16, 16)) -> intp(0, 0, 20)
	.word 0xbde520b6  ! 4076: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7e54000  ! 4078: SAVE_R	save	%r21, %r0, %r27
	.word 0xbfe4e1cd  ! 4079: SAVE_I	save	%r19, 0x0001, %r31
cpu_intr_0_325:
	setx	0x3f0205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e56011  ! 4082: SAVE_I	save	%r21, 0x0001, %r27
cpu_intr_0_326:
	setx	0x3f023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e521a5  ! 4089: SAVE_I	save	%r20, 0x0001, %r24
T0_asi_reg_wr_159:
	mov	0x19, %r14
	.word 0xfef38e40  ! 4090: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb7e561af  ! 4092: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb3e42103  ! 4093: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb9e461a4  ! 4096: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_318:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_318), 16, 16)) -> intp(0, 0, 25)
	.word 0xb3e4c000  ! 4100: SAVE_R	save	%r19, %r0, %r25
cpu_intr_0_327:
	setx	0x3d003b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_319:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_319), 16, 16)) -> intp(0, 0, 29)
iob_intr_0_320:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_320), 16, 16)) -> intp(0, 0, 15)
iob_intr_0_321:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_321), 16, 16)) -> intp(0, 0, 13)
cpu_intr_0_328:
	setx	0x3d001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbebdc000  ! 4111: XNORcc_R	xnorcc 	%r23, %r0, %r31
	.word 0xb3e5c000  ! 4112: SAVE_R	save	%r23, %r0, %r25
	.word 0xb9e58000  ! 4117: SAVE_R	save	%r22, %r0, %r28
T0_asi_reg_rd_203:
	mov	0x3c6, %r14
	.word 0xfedb8e40  ! 4119: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbde520f4  ! 4120: SAVE_I	save	%r20, 0x0001, %r30
cpu_intr_0_329:
	setx	0x3f030c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_330:
	setx	0x3e0131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe44000  ! 4131: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_322:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_322), 16, 16)) -> intp(0, 0, 32)
T0_asi_reg_rd_204:
	mov	0x2d, %r14
	.word 0xf8db89e0  ! 4134: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xbbe42063  ! 4138: SAVE_I	save	%r16, 0x0001, %r29
cpu_intr_0_331:
	setx	0x430001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde52041  ! 4146: SAVE_I	save	%r20, 0x0001, %r30
cpu_intr_0_332:
	setx	0x420332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4c000  ! 4150: SAVE_R	save	%r19, %r0, %r25
	.word 0xbbe560de  ! 4154: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb3e4e047  ! 4155: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_323:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_323), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb0950000  ! 4160: ORcc_R	orcc 	%r20, %r0, %r24
cpu_intr_0_333:
	setx	0x40020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a02d  ! 4165: SAVE_I	save	%r22, 0x0001, %r28
cpu_intr_0_334:
	setx	0x43032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde44000  ! 4167: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_rd_205:
	mov	0x3c5, %r14
	.word 0xf0db8e80  ! 4168: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_0_335:
	setx	0x430214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe58000  ! 4172: SAVE_R	save	%r22, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb734c000  ! 4177: SRL_R	srl 	%r19, %r0, %r27
	.word 0xb1e46146  ! 4181: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_wr_160:
	mov	0xf, %r14
	.word 0xfcf38e40  ! 4185: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbbe5a05f  ! 4187: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3e4e1b3  ! 4192: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb235a0df  ! 4193: SUBC_I	orn 	%r22, 0x00df, %r25
	.word 0xb3e5e1d3  ! 4194: SAVE_I	save	%r23, 0x0001, %r25
cpu_intr_0_336:
	setx	0x41013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e520ff  ! 4198: SAVE_I	save	%r20, 0x0001, %r24
iob_intr_0_324:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_324), 16, 16)) -> intp(0, 0, 35)
	.word 0xb7e4e0b3  ! 4204: SAVE_I	save	%r19, 0x0001, %r27
cpu_intr_0_337:
	setx	0x430219, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9641800  ! 4211: MOVcc_R	<illegal instruction>
	.word 0xbde48000  ! 4217: SAVE_R	save	%r18, %r0, %r30
cpu_intr_0_338:
	setx	0x43011d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_325:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_325), 16, 16)) -> intp(0, 0, 11)
iob_intr_0_326:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_326), 16, 16)) -> intp(0, 0, 37)
	.word 0xb0adc000  ! 4226: ANDNcc_R	andncc 	%r23, %r0, %r24
	.word 0xb3e50000  ! 4228: SAVE_R	save	%r20, %r0, %r25
	.word 0xba2c20b5  ! 4230: ANDN_I	andn 	%r16, 0x00b5, %r29
	.word 0xb7e56026  ! 4231: SAVE_I	save	%r21, 0x0001, %r27
cpu_intr_0_339:
	setx	0x40013b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_206:
	mov	0x3c3, %r14
	.word 0xf4db8e40  ! 4237: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_0_340:
	setx	0x40010e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_327:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_327), 16, 16)) -> intp(0, 0, 22)
T0_asi_reg_rd_207:
	mov	0x3c3, %r14
	.word 0xf0db8e80  ! 4244: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb1e560e6  ! 4246: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb5e561fe  ! 4247: SAVE_I	save	%r21, 0x0001, %r26
iob_intr_0_328:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_328), 16, 16)) -> intp(0, 0, 25)
T0_asi_reg_rd_208:
	mov	0xa, %r14
	.word 0xf0db84a0  ! 4252: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb1e58000  ! 4253: SAVE_R	save	%r22, %r0, %r24
	.word 0xb3e5e12e  ! 4255: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_wr_161:
	mov	0x3c6, %r14
	.word 0xf6f38e40  ! 4258: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_rd_209:
	mov	0xf, %r14
	.word 0xf8db8e80  ! 4260: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbfe5c000  ! 4263: SAVE_R	save	%r23, %r0, %r31
	.word 0xb9e50000  ! 4265: SAVE_R	save	%r20, %r0, %r28
	.word 0xb5e54000  ! 4268: SAVE_R	save	%r21, %r0, %r26
	.word 0xb7e50000  ! 4269: SAVE_R	save	%r20, %r0, %r27
	.word 0xb1510000  ! 4270: RDPR_TICK	<illegal instruction>
cpu_intr_0_341:
	setx	0x430012, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_329:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_329), 16, 16)) -> intp(0, 0, d)
	.word 0xbde48000  ! 4273: SAVE_R	save	%r18, %r0, %r30
T0_asi_reg_wr_162:
	mov	0x3c4, %r14
	.word 0xf0f38e40  ! 4274: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_342:
	setx	0x400233, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_210:
	mov	0x2f, %r14
	.word 0xf8db8e40  ! 4278: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb3e5a057  ! 4282: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb3e48000  ! 4285: SAVE_R	save	%r18, %r0, %r25
	.word 0xbbe5e1e2  ! 4286: SAVE_I	save	%r23, 0x0001, %r29
cpu_intr_0_343:
	setx	0x420224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e44000  ! 4292: SAVE_R	save	%r17, %r0, %r28
	.word 0xbeb5c000  ! 4293: ORNcc_R	orncc 	%r23, %r0, %r31
	.word 0xbbe4e005  ! 4294: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_rd_211:
	mov	0x3c5, %r14
	.word 0xf0db8400  ! 4299: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb80d8000  ! 4306: AND_R	and 	%r22, %r0, %r28
iob_intr_0_330:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_330), 16, 16)) -> intp(0, 0, 5)
	.word 0xb9e58000  ! 4309: SAVE_R	save	%r22, %r0, %r28
	.word 0xb1e4e17a  ! 4316: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbfe460a1  ! 4317: SAVE_I	save	%r17, 0x0001, %r31
cpu_intr_0_344:
	setx	0x41023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4348000  ! 4319: SUBC_R	orn 	%r18, %r0, %r26
T0_asi_reg_wr_163:
	mov	0x1d, %r14
	.word 0xf0f38e60  ! 4320: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T0_asi_reg_wr_164:
	mov	0x36, %r14
	.word 0xfaf389e0  ! 4322: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbfe5a10d  ! 4324: SAVE_I	save	%r22, 0x0001, %r31
cpu_intr_0_345:
	setx	0x410220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde54000  ! 4326: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_346:
	setx	0x420310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6bdc000  ! 4329: XNORcc_R	xnorcc 	%r23, %r0, %r27
	.word 0xb9e4a1df  ! 4330: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbde5209a  ! 4331: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbfe4c000  ! 4333: SAVE_R	save	%r19, %r0, %r31
cpu_intr_0_347:
	setx	0x42022b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_212:
	mov	0x1a, %r14
	.word 0xf0db8e40  ! 4340: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_348:
	setx	0x430306, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_349:
	setx	0x43021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe56063  ! 4347: SAVE_I	save	%r21, 0x0001, %r31
cpu_intr_0_350:
	setx	0x400129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e48000  ! 4352: SAVE_R	save	%r18, %r0, %r26
T0_asi_reg_wr_165:
	mov	0xa, %r14
	.word 0xf4f38e40  ! 4353: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_0_331:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_331), 16, 16)) -> intp(0, 0, 2)
iob_intr_0_332:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_332), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb3e50000  ! 4356: SAVE_R	save	%r20, %r0, %r25
	.word 0xb5e54000  ! 4358: SAVE_R	save	%r21, %r0, %r26
	.word 0xb3e461f6  ! 4360: SAVE_I	save	%r17, 0x0001, %r25
iob_intr_0_333:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_333), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb9e5e1a8  ! 4364: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb9e461e4  ! 4365: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_334:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_334), 16, 16)) -> intp(0, 0, 37)
	.word 0xbde5c000  ! 4370: SAVE_R	save	%r23, %r0, %r30
	.word 0xb1e4c000  ! 4371: SAVE_R	save	%r19, %r0, %r24
cpu_intr_0_351:
	setx	0x400007, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_335:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_335), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb9e4c000  ! 4378: SAVE_R	save	%r19, %r0, %r28
iob_intr_0_336:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_336), 16, 16)) -> intp(0, 0, 1)
	.word 0xb7e5a0e7  ! 4383: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_352:
	setx	0x420018, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_213:
	mov	0x11, %r14
	.word 0xf6db8e80  ! 4390: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_0_337:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_337), 16, 16)) -> intp(0, 0, 3)
	.word 0xb7e54000  ! 4394: SAVE_R	save	%r21, %r0, %r27
iob_intr_0_338:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_338), 16, 16)) -> intp(0, 0, 16)
	.word 0xbb641800  ! 4398: MOVcc_R	<illegal instruction>
iob_intr_0_339:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_339), 16, 16)) -> intp(0, 0, 28)
	.word 0xb5e421b6  ! 4401: SAVE_I	save	%r16, 0x0001, %r26
cpu_intr_0_353:
	setx	0x410038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e42096  ! 4405: SAVE_I	save	%r16, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e5a1bd  ! 4409: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_340:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_340), 16, 16)) -> intp(0, 0, 13)
cpu_intr_0_354:
	setx	0x40003d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_166:
	mov	0x7, %r14
	.word 0xfef38400  ! 4419: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbbe4c000  ! 4424: SAVE_R	save	%r19, %r0, %r29
	.word 0xb5e5e10a  ! 4425: SAVE_I	save	%r23, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_341:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_341), 16, 16)) -> intp(0, 0, 1)
	.word 0xb62d8000  ! 4428: ANDN_R	andn 	%r22, %r0, %r27
T0_asi_reg_wr_167:
	mov	0x3c8, %r14
	.word 0xf2f389e0  ! 4429: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb7e58000  ! 4431: SAVE_R	save	%r22, %r0, %r27
	.word 0xb7e42170  ! 4438: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbde58000  ! 4440: SAVE_R	save	%r22, %r0, %r30
iob_intr_0_342:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_342), 16, 16)) -> intp(0, 0, 27)
T0_asi_reg_wr_168:
	mov	0x7, %r14
	.word 0xf0f38e40  ! 4443: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_0_343:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_343), 16, 16)) -> intp(0, 0, 8)
cpu_intr_0_355:
	setx	0x420113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4c000  ! 4447: SAVE_R	save	%r19, %r0, %r24
	.word 0xb9e5a051  ! 4448: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_rd_214:
	mov	0x3c6, %r14
	.word 0xf6db8e80  ! 4452: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb9e420c2  ! 4454: SAVE_I	save	%r16, 0x0001, %r28
T0_asi_reg_rd_215:
	mov	0x34, %r14
	.word 0xf6db8e60  ! 4455: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_0_356:
	setx	0x410027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe44000  ! 4459: SAVE_R	save	%r17, %r0, %r31
T0_asi_reg_wr_169:
	mov	0x2f, %r14
	.word 0xfcf38e80  ! 4460: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_0_344:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_344), 16, 16)) -> intp(0, 0, a)
cpu_intr_0_357:
	setx	0x41030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4c000  ! 4465: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_rd_216:
	mov	0x25, %r14
	.word 0xf0db8400  ! 4469: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_0_345:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_345), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbde48000  ! 4472: SAVE_R	save	%r18, %r0, %r30
	.word 0xb7e421f4  ! 4475: SAVE_I	save	%r16, 0x0001, %r27
iob_intr_0_346:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_346), 16, 16)) -> intp(0, 0, 3)
iob_intr_0_347:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_347), 16, 16)) -> intp(0, 0, 10)
cpu_intr_0_358:
	setx	0x41023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e561da  ! 4484: SAVE_I	save	%r21, 0x0001, %r28
iob_intr_0_348:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_348), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_wr_170:
	mov	0x24, %r14
	.word 0xfef38e60  ! 4489: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_0_349:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_349), 16, 16)) -> intp(0, 0, 0)
	.word 0xbfe54000  ! 4492: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_350:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_350), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_rd_217:
	mov	0x1b, %r14
	.word 0xf2db8e40  ! 4498: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb5e4e147  ! 4502: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb5e40000  ! 4503: SAVE_R	save	%r16, %r0, %r26
	.word 0xb1349000  ! 4505: SRLX_R	srlx	%r18, %r0, %r24
	.word 0xb7e5a060  ! 4508: SAVE_I	save	%r22, 0x0001, %r27
T0_asi_reg_wr_171:
	mov	0x18, %r14
	.word 0xf2f38e80  ! 4511: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T0_asi_reg_wr_172:
	mov	0x2, %r14
	.word 0xf6f38e80  ! 4512: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T0_asi_reg_wr_173:
	mov	0x2b, %r14
	.word 0xfcf38e40  ! 4514: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_rd_218:
	mov	0x2d, %r14
	.word 0xfedb8e80  ! 4515: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb5e560ff  ! 4517: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbbe5213b  ! 4520: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7e4e10e  ! 4523: SAVE_I	save	%r19, 0x0001, %r27
cpu_intr_0_359:
	setx	0x400231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e40000  ! 4527: SAVE_R	save	%r16, %r0, %r25
	.word 0xbde5e1a1  ! 4529: SAVE_I	save	%r23, 0x0001, %r30
iob_intr_0_351:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_351), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb3e5c000  ! 4532: SAVE_R	save	%r23, %r0, %r25
	.word 0xbbe46148  ! 4534: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb7e5c000  ! 4535: SAVE_R	save	%r23, %r0, %r27
iob_intr_0_352:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_352), 16, 16)) -> intp(0, 0, 5)
T0_asi_reg_wr_174:
	mov	0x38, %r14
	.word 0xfcf38e80  ! 4540: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbde561b0  ! 4542: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbbe4e096  ! 4543: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb1e4a150  ! 4544: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3e560e5  ! 4549: SAVE_I	save	%r21, 0x0001, %r25
T0_asi_reg_rd_219:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 4550: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_360:
	setx	0x420007, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_361:
	setx	0x410028, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_175:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 4556: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_wr_176:
	mov	0x27, %r14
	.word 0xfef38e40  ! 4559: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_0_362:
	setx	0x40023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e42041  ! 4563: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbbe4a177  ! 4564: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbf7c6401  ! 4565: MOVR_I	movre	%r17, 0x1, %r31
T0_asi_reg_rd_220:
	mov	0x23, %r14
	.word 0xfcdb8e40  ! 4567: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbc3c4000  ! 4569: XNOR_R	xnor 	%r17, %r0, %r30
	.word 0xb9e58000  ! 4570: SAVE_R	save	%r22, %r0, %r28
T0_asi_reg_wr_177:
	mov	0x15, %r14
	.word 0xf4f389e0  ! 4571: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T0_asi_reg_rd_221:
	mov	0x3c0, %r14
	.word 0xfedb8e40  ! 4572: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_0_353:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_353), 16, 16)) -> intp(0, 0, 11)
	.word 0xbfe48000  ! 4574: SAVE_R	save	%r18, %r0, %r31
	.word 0xb684c000  ! 4579: ADDcc_R	addcc 	%r19, %r0, %r27
cpu_intr_0_363:
	setx	0x42001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb02d615e  ! 4582: ANDN_I	andn 	%r21, 0x015e, %r24
	.word 0xb3e58000  ! 4584: SAVE_R	save	%r22, %r0, %r25
iob_intr_0_354:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_354), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb205616e  ! 4586: ADD_I	add 	%r21, 0x016e, %r25
	.word 0xbde5c000  ! 4587: SAVE_R	save	%r23, %r0, %r30
iob_intr_0_355:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_355), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_wr_178:
	mov	0xc, %r14
	.word 0xfef389e0  ! 4596: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_0_356:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_356), 16, 16)) -> intp(0, 0, 1c)
iob_intr_0_357:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_357), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbeb421a6  ! 4601: ORNcc_I	orncc 	%r16, 0x01a6, %r31
cpu_intr_0_364:
	setx	0x42012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a00d  ! 4603: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb9e5c000  ! 4604: SAVE_R	save	%r23, %r0, %r28
cpu_intr_0_365:
	setx	0x410218, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_222:
	mov	0x2, %r14
	.word 0xf4db8400  ! 4607: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_0_366:
	setx	0x440036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe58000  ! 4611: SAVE_R	save	%r22, %r0, %r31
T0_asi_reg_rd_223:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 4616: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbb7cc400  ! 4617: MOVR_R	movre	%r19, %r0, %r29
iob_intr_0_358:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_358), 16, 16)) -> intp(0, 0, 1)
	.word 0xba15206c  ! 4619: OR_I	or 	%r20, 0x006c, %r29
cpu_intr_0_367:
	setx	0x470324, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_179:
	mov	0x3c2, %r14
	.word 0xfef38e60  ! 4622: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T0_asi_reg_rd_224:
	mov	0x1b, %r14
	.word 0xf0db8e40  ! 4623: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_359:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_359), 16, 16)) -> intp(0, 0, c)
	.word 0xb9e56045  ! 4625: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbb3d1000  ! 4628: SRAX_R	srax	%r20, %r0, %r29
	.word 0xb6040000  ! 4629: ADD_R	add 	%r16, %r0, %r27
T0_asi_reg_wr_180:
	mov	0x3c5, %r14
	.word 0xf0f38e60  ! 4633: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb9e5c000  ! 4634: SAVE_R	save	%r23, %r0, %r28
	.word 0xbfe40000  ! 4635: SAVE_R	save	%r16, %r0, %r31
	.word 0xb2bda1b1  ! 4636: XNORcc_I	xnorcc 	%r22, 0x01b1, %r25
cpu_intr_0_368:
	setx	0x46010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e54000  ! 4643: SAVE_R	save	%r21, %r0, %r25
	.word 0xb3e44000  ! 4649: SAVE_R	save	%r17, %r0, %r25
	.word 0xb9e4a000  ! 4653: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb3e4a06f  ! 4657: SAVE_I	save	%r18, 0x0001, %r25
cpu_intr_0_369:
	setx	0x45021e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_181:
	mov	0x26, %r14
	.word 0xf2f38400  ! 4660: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_0_360:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_360), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_370:
	setx	0x47011c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_182:
	mov	0x3c3, %r14
	.word 0xf6f389e0  ! 4665: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T0_asi_reg_rd_225:
	mov	0x2, %r14
	.word 0xf4db8e40  ! 4666: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb1e560d6  ! 4668: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbde421d4  ! 4670: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_rd_226:
	mov	0x37, %r14
	.word 0xf6db8e80  ! 4673: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb1e48000  ! 4675: SAVE_R	save	%r18, %r0, %r24
	.word 0xbfe40000  ! 4676: SAVE_R	save	%r16, %r0, %r31
iob_intr_0_361:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_361), 16, 16)) -> intp(0, 0, 13)
cpu_intr_0_371:
	setx	0x470125, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_227:
	mov	0x2a, %r14
	.word 0xf8db84a0  ! 4683: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_0_362:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_362), 16, 16)) -> intp(0, 0, 14)
cpu_intr_0_372:
	setx	0x450305, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfe48000  ! 4693: SAVE_R	save	%r18, %r0, %r31
	.word 0xb82ca1ba  ! 4695: ANDN_I	andn 	%r18, 0x01ba, %r28
cpu_intr_0_373:
	setx	0x460202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8c4a143  ! 4699: ADDCcc_I	addccc 	%r18, 0x0143, %r28
	.word 0xbcacc000  ! 4700: ANDNcc_R	andncc 	%r19, %r0, %r30
	.word 0xbf7c0400  ! 4701: MOVR_R	movre	%r16, %r0, %r31
	.word 0xbfe4e1e0  ! 4703: SAVE_I	save	%r19, 0x0001, %r31
T0_asi_reg_rd_228:
	mov	0x3c1, %r14
	.word 0xf6db8e60  ! 4706: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb5e4c000  ! 4708: SAVE_R	save	%r19, %r0, %r26
	.word 0xbde5c000  ! 4709: SAVE_R	save	%r23, %r0, %r30
	.word 0xb9e4c000  ! 4711: SAVE_R	save	%r19, %r0, %r28
	.word 0xb9e54000  ! 4712: SAVE_R	save	%r21, %r0, %r28
	.word 0xb4950000  ! 4715: ORcc_R	orcc 	%r20, %r0, %r26
	.word 0xb6158000  ! 4719: OR_R	or 	%r22, %r0, %r27
T0_asi_reg_rd_229:
	mov	0x20, %r14
	.word 0xfadb8e80  ! 4720: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T0_asi_reg_wr_183:
	mov	0x35, %r14
	.word 0xf2f38e80  ! 4723: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbfe4209a  ! 4728: SAVE_I	save	%r16, 0x0001, %r31
cpu_intr_0_374:
	setx	0x460325, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_375:
	setx	0x47032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e48000  ! 4736: SAVE_R	save	%r18, %r0, %r28
	.word 0xbde58000  ! 4737: SAVE_R	save	%r22, %r0, %r30
	.word 0xb1e56149  ! 4741: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbfe42041  ! 4745: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbfe560ec  ! 4747: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb7e5a1be  ! 4751: SAVE_I	save	%r22, 0x0001, %r27
T0_asi_reg_wr_184:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 4752: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_363:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_363), 16, 16)) -> intp(0, 0, 20)
iob_intr_0_364:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_364), 16, 16)) -> intp(0, 0, 3)
T0_asi_reg_wr_185:
	mov	0x3c5, %r14
	.word 0xf8f38e80  ! 4761: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb4a5e0ed  ! 4765: SUBcc_I	subcc 	%r23, 0x00ed, %r26
T0_asi_reg_wr_186:
	mov	0x3c8, %r14
	.word 0xfef38e60  ! 4766: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbcad4000  ! 4769: ANDNcc_R	andncc 	%r21, %r0, %r30
	.word 0xb3e5a1c5  ! 4770: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbbe54000  ! 4771: SAVE_R	save	%r21, %r0, %r29
	.word 0xb5e5c000  ! 4773: SAVE_R	save	%r23, %r0, %r26
T0_asi_reg_rd_230:
	mov	0x3c8, %r14
	.word 0xf6db8e40  ! 4775: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_0_376:
	setx	0x450336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e560ba  ! 4777: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbde5c000  ! 4780: SAVE_R	save	%r23, %r0, %r30
	.word 0xbde42098  ! 4782: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbfe54000  ! 4783: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_365:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_365), 16, 16)) -> intp(0, 0, 2f)
T0_asi_reg_wr_187:
	mov	0x12, %r14
	.word 0xf2f38e40  ! 4787: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_0_377:
	setx	0x46013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_188:
	mov	0x3c3, %r14
	.word 0xfaf38e40  ! 4789: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_rd_231:
	mov	0x1c, %r14
	.word 0xf4db8e80  ! 4790: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_0_378:
	setx	0x46022e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_366:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_366), 16, 16)) -> intp(0, 0, 1)
cpu_intr_0_379:
	setx	0x44002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e54000  ! 4795: SAVE_R	save	%r21, %r0, %r24
	.word 0xb094c000  ! 4797: ORcc_R	orcc 	%r19, %r0, %r24
	.word 0xbde48000  ! 4798: SAVE_R	save	%r18, %r0, %r30
iob_intr_0_367:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_367), 16, 16)) -> intp(0, 0, 7)
	.word 0xb7e5a07d  ! 4803: SAVE_I	save	%r22, 0x0001, %r27
iob_intr_0_368:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_368), 16, 16)) -> intp(0, 0, 18)
	.word 0xbfe5a15c  ! 4806: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe48000  ! 4808: SAVE_R	save	%r18, %r0, %r29
	.word 0xbbe560fb  ! 4809: SAVE_I	save	%r21, 0x0001, %r29
T0_asi_reg_rd_232:
	mov	0x19, %r14
	.word 0xf0db8e80  ! 4810: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb2952193  ! 4812: ORcc_I	orcc 	%r20, 0x0193, %r25
iob_intr_0_369:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_369), 16, 16)) -> intp(0, 0, a)
T0_asi_reg_wr_189:
	mov	0x3c7, %r14
	.word 0xfef38400  ! 4815: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbbe5e17d  ! 4817: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb5e4a190  ! 4818: SAVE_I	save	%r18, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbd3c1000  ! 4824: SRAX_R	srax	%r16, %r0, %r30
T0_asi_reg_wr_190:
	mov	0x3c0, %r14
	.word 0xfaf384a0  ! 4825: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_0_370:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_370), 16, 16)) -> intp(0, 0, 2)
	.word 0xbbe5e099  ! 4827: SAVE_I	save	%r23, 0x0001, %r29
iob_intr_0_371:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_371), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_rd_233:
	mov	0x1c, %r14
	.word 0xf2db8e40  ! 4831: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_372:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_372), 16, 16)) -> intp(0, 0, 15)
	.word 0xbbe4e184  ! 4837: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb6bd4000  ! 4839: XNORcc_R	xnorcc 	%r21, %r0, %r27
	.word 0xb9e4c000  ! 4840: SAVE_R	save	%r19, %r0, %r28
iob_intr_0_373:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_373), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb3e48000  ! 4843: SAVE_R	save	%r18, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe40000  ! 4851: SAVE_R	save	%r16, %r0, %r31
	.word 0xbde5c000  ! 4852: SAVE_R	save	%r23, %r0, %r30
T0_asi_reg_rd_234:
	mov	0x34, %r14
	.word 0xf4db84a0  ! 4855: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb3e4a0b6  ! 4856: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb12d7001  ! 4859: SLLX_I	sllx	%r21, 0x0001, %r24
iob_intr_0_374:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_374), 16, 16)) -> intp(0, 0, 12)
	.word 0xb9353001  ! 4864: SRLX_I	srlx	%r20, 0x0001, %r28
	.word 0xb7e44000  ! 4865: SAVE_R	save	%r17, %r0, %r27
iob_intr_0_375:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_375), 16, 16)) -> intp(0, 0, 7)
	.word 0xbfe4c000  ! 4870: SAVE_R	save	%r19, %r0, %r31
cpu_intr_0_380:
	setx	0x440329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e148  ! 4873: SAVE_I	save	%r19, 0x0001, %r30
iob_intr_0_376:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_376), 16, 16)) -> intp(0, 0, f)
	.word 0xbbe50000  ! 4878: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_377:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_377), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb9e4c000  ! 4885: SAVE_R	save	%r19, %r0, %r28
T0_asi_reg_rd_235:
	mov	0x19, %r14
	.word 0xfadb89e0  ! 4886: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb3e48000  ! 4887: SAVE_R	save	%r18, %r0, %r25
	.word 0xbfe5e085  ! 4889: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbf34b001  ! 4890: SRLX_I	srlx	%r18, 0x0001, %r31
iob_intr_0_378:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_378), 16, 16)) -> intp(0, 0, e)
	.word 0xba3d4000  ! 4892: XNOR_R	xnor 	%r21, %r0, %r29
	.word 0xb5e44000  ! 4896: SAVE_R	save	%r17, %r0, %r26
	.word 0xb7e4219a  ! 4898: SAVE_I	save	%r16, 0x0001, %r27
cpu_intr_0_381:
	setx	0x44001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e019  ! 4901: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb5e52135  ! 4909: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb9e48000  ! 4911: SAVE_R	save	%r18, %r0, %r28
	.word 0xbc3da0a0  ! 4915: XNOR_I	xnor 	%r22, 0x00a0, %r30
cpu_intr_0_382:
	setx	0x460306, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_379:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_379), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_380:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_380), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_wr_191:
	mov	0x3c2, %r14
	.word 0xfef38e40  ! 4928: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_0_381:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_381), 16, 16)) -> intp(0, 0, 9)
cpu_intr_0_383:
	setx	0x470317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4612b  ! 4933: SAVE_I	save	%r17, 0x0001, %r25
cpu_intr_0_384:
	setx	0x470210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4c000  ! 4935: SAVE_R	save	%r19, %r0, %r31
T0_asi_reg_rd_236:
	mov	0x3c2, %r14
	.word 0xf6db8e40  ! 4938: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_wr_192:
	mov	0x38, %r14
	.word 0xf8f38400  ! 4941: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb7e420ce  ! 4942: SAVE_I	save	%r16, 0x0001, %r27
cpu_intr_0_385:
	setx	0x46013e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_382:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_382), 16, 16)) -> intp(0, 0, c)
T0_asi_reg_wr_193:
	mov	0x1f, %r14
	.word 0xfcf38e80  ! 4947: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_0_383:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_383), 16, 16)) -> intp(0, 0, 1)
T0_asi_reg_wr_194:
	mov	0x12, %r14
	.word 0xf4f38e80  ! 4952: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T0_asi_reg_rd_237:
	mov	0x1c, %r14
	.word 0xf8db84a0  ! 4959: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb5e58000  ! 4960: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_wr_195:
	mov	0x36, %r14
	.word 0xfaf38400  ! 4961: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb0858000  ! 4962: ADDcc_R	addcc 	%r22, %r0, %r24
	.word 0xbbe54000  ! 4963: SAVE_R	save	%r21, %r0, %r29
T0_asi_reg_rd_238:
	mov	0x2f, %r14
	.word 0xfadb8e60  ! 4964: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_0_386:
	setx	0x45012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e50000  ! 4968: SAVE_R	save	%r20, %r0, %r24
T0_asi_reg_rd_239:
	mov	0x24, %r14
	.word 0xfadb84a0  ! 4970: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb9e40000  ! 4974: SAVE_R	save	%r16, %r0, %r28
	.word 0xb2b58000  ! 4975: SUBCcc_R	orncc 	%r22, %r0, %r25
T0_asi_reg_wr_196:
	mov	0x23, %r14
	.word 0xf0f389e0  ! 4977: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_0_387:
	setx	0x440130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb40c60cf  ! 4983: AND_I	and 	%r17, 0x00cf, %r26
	.word 0xbbe48000  ! 4985: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_rd_240:
	mov	0x0, %r14
	.word 0xf8db8e60  ! 4988: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_0_388:
	setx	0x44011e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_384:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_384), 16, 16)) -> intp(0, 0, 1a)
	.word 0xbde5a059  ! 4993: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbbe58000  ! 4996: SAVE_R	save	%r22, %r0, %r29
T0_asi_reg_wr_197:
	mov	0x3c2, %r14
	.word 0xfef38e80  ! 4997: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
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
cpu_intr_3_0:
	setx	0x19031c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_0), 16, 16)) -> intp(3, 0, 2f)
T3_asi_reg_rd_0:
	mov	0x1b, %r14
	.word 0xfcdb8400  ! 3: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_1), 16, 16)) -> intp(3, 0, 18)
iob_intr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_2), 16, 16)) -> intp(3, 0, 36)
iob_intr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_3), 16, 16)) -> intp(3, 0, 3e)
iob_intr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_4), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf22521e8  ! 21: STW_I	stw	%r25, [%r20 + 0x01e8]
T3_asi_reg_wr_0:
	mov	0x1e, %r14
	.word 0xf4f389e0  ! 23: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_3_1:
	setx	0x1d0001, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_1:
	mov	0x3c2, %r14
	.word 0xf6f384a0  ! 25: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T3_asi_reg_rd_1:
	mov	0x22, %r14
	.word 0xf0db8e80  ! 29: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb37c8400  ! 31: MOVR_R	movre	%r18, %r0, %r25
T3_asi_reg_rd_2:
	mov	0x1b, %r14
	.word 0xf4db8e40  ! 32: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfea50020  ! 33: STWA_R	stwa	%r31, [%r20 + %r0] 0x01
cpu_intr_3_2:
	setx	0x3021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_5), 16, 16)) -> intp(3, 0, 1)
iob_intr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_6), 16, 16)) -> intp(3, 0, 2f)
T3_asi_reg_rd_3:
	mov	0x3c7, %r14
	.word 0xf2db89e0  ! 46: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_7), 16, 16)) -> intp(3, 0, 36)
	ta	T_CHANGE_TO_TL1
	.word 0xfcb4c020  ! 51: STHA_R	stha	%r30, [%r19 + %r0] 0x01
	.word 0xb6bca0dd  ! 52: XNORcc_I	xnorcc 	%r18, 0x00dd, %r27
	.word 0xfeade1e5  ! 53: STBA_I	stba	%r31, [%r23 + 0x01e5] %asi
	.word 0xf0a5e19d  ! 54: STWA_I	stwa	%r24, [%r23 + 0x019d] %asi
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_3:
	setx	0x1d033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaad21ca  ! 59: STBA_I	stba	%r29, [%r20 + 0x01ca] %asi
T3_asi_reg_wr_2:
	mov	0x9, %r14
	.word 0xf8f38e80  ! 62: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf2f5619a  ! 63: STXA_I	stxa	%r25, [%r21 + 0x019a] %asi
T3_asi_reg_wr_3:
	mov	0x12, %r14
	.word 0xf6f38e60  ! 66: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T3_asi_reg_wr_4:
	mov	0x3c7, %r14
	.word 0xfef384a0  ! 67: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	.word 0xfc344000  ! 74: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xbe340000  ! 75: ORN_R	orn 	%r16, %r0, %r31
iob_intr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_8), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf2256018  ! 80: STW_I	stw	%r25, [%r21 + 0x0018]
T3_asi_reg_rd_4:
	mov	0x16, %r14
	.word 0xf6db8e80  ! 81: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_3_4:
	setx	0x1f023a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_5:
	mov	0x3c6, %r14
	.word 0xfcdb8e40  ! 85: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfa74a13a  ! 86: STX_I	stx	%r29, [%r18 + 0x013a]
	.word 0xf2250000  ! 87: STW_R	stw	%r25, [%r20 + %r0]
iob_intr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_9), 16, 16)) -> intp(3, 0, 28)
	.word 0xb4bd8000  ! 90: XNORcc_R	xnorcc 	%r22, %r0, %r26
	.word 0xf8ad4020  ! 91: STBA_R	stba	%r28, [%r21 + %r0] 0x01
T3_asi_reg_wr_5:
	mov	0x28, %r14
	.word 0xf8f38e80  ! 93: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_3_5:
	setx	0x1e0024, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xbf351000  ! 99: SRLX_R	srlx	%r20, %r0, %r31
	.word 0xf22c0000  ! 101: STB_R	stb	%r25, [%r16 + %r0]
T3_asi_reg_rd_6:
	mov	0x3c6, %r14
	.word 0xfedb89e0  ! 103: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T3_asi_reg_rd_7:
	mov	0x3c7, %r14
	.word 0xf0db8400  ! 104: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T3_asi_reg_wr_6:
	mov	0x3c5, %r14
	.word 0xfaf38e60  ! 106: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf8ade069  ! 108: STBA_I	stba	%r28, [%r23 + 0x0069] %asi
	.word 0xf6a44020  ! 112: STWA_R	stwa	%r27, [%r17 + %r0] 0x01
T3_asi_reg_wr_7:
	mov	0x3c1, %r14
	.word 0xfef38e60  ! 113: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfe2dc000  ! 114: STB_R	stb	%r31, [%r23 + %r0]
iob_intr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_10), 16, 16)) -> intp(3, 0, 0)
	.word 0xb234c000  ! 116: SUBC_R	orn 	%r19, %r0, %r25
	.word 0xfe34a066  ! 117: STH_I	sth	%r31, [%r18 + 0x0066]
	.word 0xb2358000  ! 121: SUBC_R	orn 	%r22, %r0, %r25
	.word 0xb28c6139  ! 122: ANDcc_I	andcc 	%r17, 0x0139, %r25
T3_asi_reg_rd_8:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 123: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_wr_8:
	mov	0x12, %r14
	.word 0xf4f38e60  ! 126: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf23520ac  ! 128: STH_I	sth	%r25, [%r20 + 0x00ac]
	.word 0xfc348000  ! 133: STH_R	sth	%r30, [%r18 + %r0]
	.word 0x839460ac  ! 136: WRPR_TNPC_I	wrpr	%r17, 0x00ac, %tnpc
T3_asi_reg_wr_9:
	mov	0x3, %r14
	.word 0xfaf384a0  ! 137: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983f1a  ! 139: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f1a, %hpstate
cpu_intr_3_6:
	setx	0x1c0314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9343001  ! 142: SRLX_I	srlx	%r16, 0x0001, %r28
T3_asi_reg_wr_10:
	mov	0x3c2, %r14
	.word 0xf8f38400  ! 144: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf0ac8020  ! 146: STBA_R	stba	%r24, [%r18 + %r0] 0x01
T3_asi_reg_wr_11:
	mov	0x2d, %r14
	.word 0xf0f38e40  ! 151: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_11), 16, 16)) -> intp(3, 0, 9)
	.word 0xfeac215c  ! 153: STBA_I	stba	%r31, [%r16 + 0x015c] %asi
	.word 0xf8ace0c2  ! 157: STBA_I	stba	%r28, [%r19 + 0x00c2] %asi
	.word 0xf62ca17c  ! 158: STB_I	stb	%r27, [%r18 + 0x017c]
iob_intr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_12), 16, 16)) -> intp(3, 0, 10)
	.word 0xf2aca1c1  ! 160: STBA_I	stba	%r25, [%r18 + 0x01c1] %asi
T3_asi_reg_wr_12:
	mov	0x3c3, %r14
	.word 0xf4f38e40  ! 162: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf82d202a  ! 165: STB_I	stb	%r28, [%r20 + 0x002a]
	.word 0xfe2d602a  ! 168: STB_I	stb	%r31, [%r21 + 0x002a]
	.word 0xf4a4e161  ! 170: STWA_I	stwa	%r26, [%r19 + 0x0161] %asi
cpu_intr_3_7:
	setx	0x1f0304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf353001  ! 172: SRLX_I	srlx	%r20, 0x0001, %r31
	.word 0xf235a18e  ! 174: STH_I	sth	%r25, [%r22 + 0x018e]
cpu_intr_3_8:
	setx	0x1f012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf63421b6  ! 176: STH_I	sth	%r27, [%r16 + 0x01b6]
iob_intr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_13), 16, 16)) -> intp(3, 0, 3a)
	.word 0xfca44020  ! 179: STWA_R	stwa	%r30, [%r17 + %r0] 0x01
T3_asi_reg_rd_9:
	mov	0x1c, %r14
	.word 0xf6db84a0  ! 182: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb204c000  ! 183: ADD_R	add 	%r19, %r0, %r25
	.word 0xf42ce0fe  ! 188: STB_I	stb	%r26, [%r19 + 0x00fe]
	.word 0xf0b4e082  ! 190: STHA_I	stha	%r24, [%r19 + 0x0082] %asi
T3_asi_reg_wr_13:
	mov	0x3c0, %r14
	.word 0xfef389e0  ! 192: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb5356001  ! 193: SRL_I	srl 	%r21, 0x0001, %r26
iob_intr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_14), 16, 16)) -> intp(3, 0, b)
	.word 0xb824c000  ! 200: SUB_R	sub 	%r19, %r0, %r28
	.word 0xbabc8000  ! 201: XNORcc_R	xnorcc 	%r18, %r0, %r29
iob_intr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_15), 16, 16)) -> intp(3, 0, 34)
iob_intr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_16), 16, 16)) -> intp(3, 0, 0)
	.word 0xf42ce1c6  ! 206: STB_I	stb	%r26, [%r19 + 0x01c6]
	.word 0xb2c5c000  ! 209: ADDCcc_R	addccc 	%r23, %r0, %r25
	.word 0xf8350000  ! 210: STH_R	sth	%r28, [%r20 + %r0]
	.word 0xf8250000  ! 212: STW_R	stw	%r28, [%r20 + %r0]
T3_asi_reg_rd_10:
	mov	0x3c2, %r14
	.word 0xf6db8e80  ! 213: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xfe75a096  ! 216: STX_I	stx	%r31, [%r22 + 0x0096]
	.word 0xfa340000  ! 219: STH_R	sth	%r29, [%r16 + %r0]
	.word 0xfcb5c020  ! 220: STHA_R	stha	%r30, [%r23 + %r0] 0x01
	.word 0xfea5c020  ! 226: STWA_R	stwa	%r31, [%r23 + %r0] 0x01
iob_intr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_17), 16, 16)) -> intp(3, 0, c)
	ta	T_CHANGE_TO_TL0
iob_intr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_18), 16, 16)) -> intp(3, 0, 35)
iob_intr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_19), 16, 16)) -> intp(3, 0, 3e)
	.word 0xfc740000  ! 238: STX_R	stx	%r30, [%r16 + %r0]
cpu_intr_3_9:
	setx	0x1e0226, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_14:
	mov	0x28, %r14
	.word 0xfef38e80  ! 243: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_20), 16, 16)) -> intp(3, 0, e)
	.word 0xf2248000  ! 249: STW_R	stw	%r25, [%r18 + %r0]
	.word 0xbc8d4000  ! 252: ANDcc_R	andcc 	%r21, %r0, %r30
T3_asi_reg_wr_15:
	mov	0x1e, %r14
	.word 0xf4f38e80  ! 254: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T3_asi_reg_rd_11:
	mov	0x34, %r14
	.word 0xfcdb89e0  ! 256: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_3_10:
	setx	0x1e012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6158000  ! 259: OR_R	or 	%r22, %r0, %r27
cpu_intr_3_11:
	setx	0x1e003c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_12:
	setx	0x1d020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2cc000  ! 262: STB_R	stb	%r30, [%r19 + %r0]
iob_intr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_21), 16, 16)) -> intp(3, 0, 38)
	.word 0xf2a5e114  ! 266: STWA_I	stwa	%r25, [%r23 + 0x0114] %asi
cpu_intr_3_13:
	setx	0x1d021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02de07f  ! 269: STB_I	stb	%r24, [%r23 + 0x007f]
	.word 0xf624a093  ! 270: STW_I	stw	%r27, [%r18 + 0x0093]
cpu_intr_3_14:
	setx	0x1c010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_12:
	mov	0x15, %r14
	.word 0xfadb8400  ! 275: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbe0d6091  ! 276: AND_I	and 	%r21, 0x0091, %r31
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982fda  ! 278: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fda, %hpstate
cpu_intr_3_15:
	setx	0x1c0003, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_22), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf0350000  ! 286: STH_R	sth	%r24, [%r20 + %r0]
T3_asi_reg_rd_13:
	mov	0x20, %r14
	.word 0xf6db8e40  ! 287: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf6354000  ! 288: STH_R	sth	%r27, [%r21 + %r0]
	.word 0xf8a461ea  ! 290: STWA_I	stwa	%r28, [%r17 + 0x01ea] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_14:
	mov	0x25, %r14
	.word 0xf4db8e80  ! 294: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xfe2cc000  ! 297: STB_R	stb	%r31, [%r19 + %r0]
cpu_intr_3_16:
	setx	0x1f0032, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_23), 16, 16)) -> intp(3, 0, 23)
iob_intr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_24), 16, 16)) -> intp(3, 0, 1e)
cpu_intr_3_17:
	setx	0x1f003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_18:
	setx	0x1d0219, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_19:
	setx	0x1d0020, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_15:
	mov	0x27, %r14
	.word 0xf2db8400  ! 318: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf8a4e0b3  ! 320: STWA_I	stwa	%r28, [%r19 + 0x00b3] %asi
T3_asi_reg_rd_16:
	mov	0xf, %r14
	.word 0xf8db8e40  ! 323: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfcb40020  ! 324: STHA_R	stha	%r30, [%r16 + %r0] 0x01
	.word 0xf62d8000  ! 325: STB_R	stb	%r27, [%r22 + %r0]
	.word 0xf6744000  ! 326: STX_R	stx	%r27, [%r17 + %r0]
cpu_intr_3_20:
	setx	0x1d032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9340000  ! 331: SRL_R	srl 	%r16, %r0, %r28
	ta	T_CHANGE_TO_TL1
	.word 0xf4356141  ! 338: STH_I	sth	%r26, [%r21 + 0x0141]
	.word 0xf2b560f0  ! 339: STHA_I	stha	%r25, [%r21 + 0x00f0] %asi
cpu_intr_3_21:
	setx	0x1f020d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_22:
	setx	0x1c0132, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_25), 16, 16)) -> intp(3, 0, 3c)
T3_asi_reg_wr_16:
	mov	0x3c3, %r14
	.word 0xf2f389e0  ! 351: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf6258000  ! 355: STW_R	stw	%r27, [%r22 + %r0]
T3_asi_reg_rd_17:
	mov	0x1f, %r14
	.word 0xfedb8e40  ! 357: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf8a5c020  ! 359: STWA_R	stwa	%r28, [%r23 + %r0] 0x01
	.word 0xf02ce168  ! 360: STB_I	stb	%r24, [%r19 + 0x0168]
	.word 0xb025617c  ! 361: SUB_I	sub 	%r21, 0x017c, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf82c4000  ! 367: STB_R	stb	%r28, [%r17 + %r0]
T3_asi_reg_rd_18:
	mov	0x3c0, %r14
	.word 0xfedb8e40  ! 369: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_26), 16, 16)) -> intp(3, 0, b)
	.word 0xfa254000  ! 371: STW_R	stw	%r29, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa346120  ! 373: STH_I	sth	%r29, [%r17 + 0x0120]
iob_intr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_27), 16, 16)) -> intp(3, 0, 1a)
	.word 0xfe254000  ! 375: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xf0758000  ! 377: STX_R	stx	%r24, [%r22 + %r0]
	.word 0xbe14e1c5  ! 379: OR_I	or 	%r19, 0x01c5, %r31
iob_intr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_28), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_wr_17:
	mov	0x17, %r14
	.word 0xf6f38e40  ! 381: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_rd_19:
	mov	0x3c5, %r14
	.word 0xf6db8400  ! 385: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T3_asi_reg_wr_18:
	mov	0x28, %r14
	.word 0xf2f38e40  ! 386: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_3_23:
	setx	0x1e0210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ad4020  ! 390: STBA_R	stba	%r24, [%r21 + %r0] 0x01
cpu_intr_3_24:
	setx	0x1d002f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_20:
	mov	0x26, %r14
	.word 0xf6db8e40  ! 392: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_29), 16, 16)) -> intp(3, 0, 13)
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982952  ! 397: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0952, %hpstate
iob_intr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_30), 16, 16)) -> intp(3, 0, 1c)
	.word 0xfaf46117  ! 399: STXA_I	stxa	%r29, [%r17 + 0x0117] %asi
	.word 0xfe2d0000  ! 400: STB_R	stb	%r31, [%r20 + %r0]
iob_intr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_31), 16, 16)) -> intp(3, 0, 14)
iob_intr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_32), 16, 16)) -> intp(3, 0, 4)
	.word 0xfca461a6  ! 408: STWA_I	stwa	%r30, [%r17 + 0x01a6] %asi
	.word 0xf4b4203e  ! 409: STHA_I	stha	%r26, [%r16 + 0x003e] %asi
	.word 0xf67561eb  ! 410: STX_I	stx	%r27, [%r21 + 0x01eb]
	.word 0xbd643801  ! 411: MOVcc_I	<illegal instruction>
	.word 0xf874c000  ! 412: STX_R	stx	%r28, [%r19 + %r0]
	.word 0xbe3da0d0  ! 414: XNOR_I	xnor 	%r22, 0x00d0, %r31
T3_asi_reg_rd_21:
	mov	0x4, %r14
	.word 0xf4db89e0  ! 415: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf2a50020  ! 417: STWA_R	stwa	%r25, [%r20 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
	.word 0xfab48020  ! 419: STHA_R	stha	%r29, [%r18 + %r0] 0x01
	.word 0xf42c2026  ! 420: STB_I	stb	%r26, [%r16 + 0x0026]
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982908  ! 421: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0908, %hpstate
cpu_intr_3_25:
	setx	0x1c0117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a48020  ! 423: STWA_R	stwa	%r28, [%r18 + %r0] 0x01
cpu_intr_3_26:
	setx	0x1d0324, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfaa5208f  ! 427: STWA_I	stwa	%r29, [%r20 + 0x008f] %asi
	.word 0xfe34e1fa  ! 428: STH_I	sth	%r31, [%r19 + 0x01fa]
	.word 0xb8c4c000  ! 434: ADDCcc_R	addccc 	%r19, %r0, %r28
T3_asi_reg_rd_22:
	mov	0x2, %r14
	.word 0xfadb89e0  ! 437: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_33), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf22c8000  ! 440: STB_R	stb	%r25, [%r18 + %r0]
iob_intr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_34), 16, 16)) -> intp(3, 0, 3)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb8a56118  ! 443: SUBcc_I	subcc 	%r21, 0x0118, %r28
T3_asi_reg_wr_19:
	mov	0x3c3, %r14
	.word 0xfcf384a0  ! 446: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T3_asi_reg_rd_23:
	mov	0x3c8, %r14
	.word 0xf8db89e0  ! 447: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xbe2c2136  ! 449: ANDN_I	andn 	%r16, 0x0136, %r31
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982e58  ! 451: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e58, %hpstate
	.word 0xf435c000  ! 453: STH_R	sth	%r26, [%r23 + %r0]
	.word 0xf4f4a163  ! 455: STXA_I	stxa	%r26, [%r18 + 0x0163] %asi
T3_asi_reg_wr_20:
	mov	0x38, %r14
	.word 0xf0f38e60  ! 460: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xfa7420e6  ! 467: STX_I	stx	%r29, [%r16 + 0x00e6]
	.word 0xf6b5e1cc  ! 468: STHA_I	stha	%r27, [%r23 + 0x01cc] %asi
iob_intr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_35), 16, 16)) -> intp(3, 0, 19)
	.word 0xfcf4e070  ! 475: STXA_I	stxa	%r30, [%r19 + 0x0070] %asi
	.word 0xfeac8020  ! 477: STBA_R	stba	%r31, [%r18 + %r0] 0x01
	.word 0xfa34a0da  ! 478: STH_I	sth	%r29, [%r18 + 0x00da]
	.word 0xfc74e0d7  ! 479: STX_I	stx	%r30, [%r19 + 0x00d7]
	.word 0xf4748000  ! 481: STX_R	stx	%r26, [%r18 + %r0]
iob_intr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_36), 16, 16)) -> intp(3, 0, 25)
	.word 0xf4b44020  ! 485: STHA_R	stha	%r26, [%r17 + %r0] 0x01
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982e58  ! 488: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e58, %hpstate
T3_asi_reg_rd_24:
	mov	0x3c7, %r14
	.word 0xf6db89e0  ! 489: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T3_asi_reg_wr_21:
	mov	0x20, %r14
	.word 0xfef38e80  ! 490: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_37), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf2ac4020  ! 492: STBA_R	stba	%r25, [%r17 + %r0] 0x01
	.word 0xbe340000  ! 495: ORN_R	orn 	%r16, %r0, %r31
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_25:
	mov	0x28, %r14
	.word 0xfedb8e60  ! 499: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_38), 16, 16)) -> intp(3, 0, 29)
	.word 0xf62c2098  ! 503: STB_I	stb	%r27, [%r16 + 0x0098]
	.word 0xb2b44000  ! 504: SUBCcc_R	orncc 	%r17, %r0, %r25
	.word 0xfcade1b1  ! 505: STBA_I	stba	%r30, [%r23 + 0x01b1] %asi
T3_asi_reg_rd_26:
	mov	0x10, %r14
	.word 0xfadb8400  ! 506: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe748000  ! 509: STX_R	stx	%r31, [%r18 + %r0]
iob_intr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_39), 16, 16)) -> intp(3, 0, 0)
cpu_intr_3_27:
	setx	0x230230, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_28:
	setx	0x22012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983a4a  ! 514: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a4a, %hpstate
	.word 0xf625c000  ! 515: STW_R	stw	%r27, [%r23 + %r0]
T3_asi_reg_rd_27:
	mov	0x3, %r14
	.word 0xfadb8e40  ! 517: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf8b50020  ! 518: STHA_R	stha	%r28, [%r20 + %r0] 0x01
	.word 0xfcaca1c1  ! 519: STBA_I	stba	%r30, [%r18 + 0x01c1] %asi
iob_intr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_40), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf4746160  ! 524: STX_I	stx	%r26, [%r17 + 0x0160]
T3_asi_reg_rd_28:
	mov	0x23, %r14
	.word 0xf4db84a0  ! 525: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_3_29:
	setx	0x220338, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982892  ! 529: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0892, %hpstate
iob_intr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_41), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf02da0b5  ! 531: STB_I	stb	%r24, [%r22 + 0x00b5]
cpu_intr_3_30:
	setx	0x210038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_42), 16, 16)) -> intp(3, 0, 1f)
cpu_intr_3_31:
	setx	0x230126, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_29:
	mov	0xe, %r14
	.word 0xfcdb8e40  ! 539: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_43), 16, 16)) -> intp(3, 0, 5)
iob_intr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_44), 16, 16)) -> intp(3, 0, 38)
	.word 0xf835e118  ! 543: STH_I	sth	%r28, [%r23 + 0x0118]
	.word 0xfe75e1ec  ! 544: STX_I	stx	%r31, [%r23 + 0x01ec]
	.word 0xf2b4e146  ! 547: STHA_I	stha	%r25, [%r19 + 0x0146] %asi
T3_asi_reg_wr_22:
	mov	0x3c0, %r14
	.word 0xfcf38400  ! 549: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xba458000  ! 551: ADDC_R	addc 	%r22, %r0, %r29
	.word 0xf624c000  ! 557: STW_R	stw	%r27, [%r19 + %r0]
	.word 0xfcb52059  ! 558: STHA_I	stha	%r30, [%r20 + 0x0059] %asi
cpu_intr_3_32:
	setx	0x230206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb224a1c7  ! 560: SUB_I	sub 	%r18, 0x01c7, %r25
T3_asi_reg_rd_30:
	mov	0x2d, %r14
	.word 0xf4db8e60  ! 561: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T3_asi_reg_rd_31:
	mov	0x33, %r14
	.word 0xf0db8e60  ! 562: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xfe758000  ! 563: STX_R	stx	%r31, [%r22 + %r0]
	.word 0xfcb52193  ! 564: STHA_I	stha	%r30, [%r20 + 0x0193] %asi
	.word 0xb6c460a2  ! 566: ADDCcc_I	addccc 	%r17, 0x00a2, %r27
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_32:
	mov	0x27, %r14
	.word 0xfadb84a0  ! 568: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_45), 16, 16)) -> intp(3, 0, 29)
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982f00  ! 571: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f00, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa35a190  ! 574: STH_I	sth	%r29, [%r22 + 0x0190]
iob_intr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_46), 16, 16)) -> intp(3, 0, e)
T3_asi_reg_rd_33:
	mov	0x3c1, %r14
	.word 0xfadb8400  ! 576: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_3_33:
	setx	0x220002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_47), 16, 16)) -> intp(3, 0, 32)
cpu_intr_3_34:
	setx	0x200336, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_48), 16, 16)) -> intp(3, 0, 1f)
iob_intr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_49), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_35:
	setx	0x210003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb54020  ! 586: STHA_R	stha	%r30, [%r21 + %r0] 0x01
iob_intr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_50), 16, 16)) -> intp(3, 0, 2)
	.word 0xfa24c000  ! 588: STW_R	stw	%r29, [%r19 + %r0]
	.word 0xf82d4000  ! 592: STB_R	stb	%r28, [%r21 + %r0]
	.word 0xb085614a  ! 593: ADDcc_I	addcc 	%r21, 0x014a, %r24
	ta	T_CHANGE_NONHPRIV
iob_intr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_51), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_rd_34:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 599: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_52), 16, 16)) -> intp(3, 0, 23)
	.word 0xbe3d2157  ! 602: XNOR_I	xnor 	%r20, 0x0157, %r31
iob_intr_3_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_53), 16, 16)) -> intp(3, 0, c)
iob_intr_3_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_54), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf2248000  ! 608: STW_R	stw	%r25, [%r18 + %r0]
iob_intr_3_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_55), 16, 16)) -> intp(3, 0, a)
	.word 0xf4344000  ! 613: STH_R	sth	%r26, [%r17 + %r0]
	.word 0xf2ad4020  ! 614: STBA_R	stba	%r25, [%r21 + %r0] 0x01
	.word 0xbb2cd000  ! 616: SLLX_R	sllx	%r19, %r0, %r29
	.word 0xf0244000  ! 617: STW_R	stw	%r24, [%r17 + %r0]
	.word 0xf8a40020  ! 618: STWA_R	stwa	%r28, [%r16 + %r0] 0x01
T3_asi_reg_rd_35:
	mov	0x36, %r14
	.word 0xf8db84a0  ! 621: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_TO_TL0
cpu_intr_3_36:
	setx	0x210014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc75e1f7  ! 628: STX_I	stx	%r30, [%r23 + 0x01f7]
iob_intr_3_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_56), 16, 16)) -> intp(3, 0, 3a)
	.word 0xfc25e020  ! 630: STW_I	stw	%r30, [%r23 + 0x0020]
cpu_intr_3_37:
	setx	0x200228, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_38:
	setx	0x23000f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_36:
	mov	0x3c8, %r14
	.word 0xf8db8e80  ! 634: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_3_39:
	setx	0x22031c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_40:
	setx	0x220011, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_23:
	mov	0x7, %r14
	.word 0xf6f38e60  ! 639: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf6344000  ! 640: STH_R	sth	%r27, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_24:
	mov	0x1f, %r14
	.word 0xf2f38400  ! 643: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_3_41:
	setx	0x230300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8746197  ! 645: STX_I	stx	%r28, [%r17 + 0x0197]
cpu_intr_3_42:
	setx	0x200310, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_57), 16, 16)) -> intp(3, 0, c)
iob_intr_3_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_58), 16, 16)) -> intp(3, 0, 5)
	.word 0xf2b48020  ! 654: STHA_R	stha	%r25, [%r18 + %r0] 0x01
	.word 0xb1354000  ! 655: SRL_R	srl 	%r21, %r0, %r24
T3_asi_reg_wr_25:
	mov	0x31, %r14
	.word 0xf0f38e60  ! 657: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_3_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_59), 16, 16)) -> intp(3, 0, 2)
	.word 0xb00d4000  ! 666: AND_R	and 	%r21, %r0, %r24
	.word 0xf2a44020  ! 667: STWA_R	stwa	%r25, [%r17 + %r0] 0x01
	.word 0xb5357001  ! 668: SRLX_I	srlx	%r21, 0x0001, %r26
	.word 0xbe8c8000  ! 673: ANDcc_R	andcc 	%r18, %r0, %r31
cpu_intr_3_43:
	setx	0x21010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f4a175  ! 677: STXA_I	stxa	%r25, [%r18 + 0x0175] %asi
T3_asi_reg_rd_37:
	mov	0x10, %r14
	.word 0xf6db8e80  ! 680: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xb09d611f  ! 683: XORcc_I	xorcc 	%r21, 0x011f, %r24
cpu_intr_3_44:
	setx	0x200021, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_38:
	mov	0xa, %r14
	.word 0xf4db8e40  ! 685: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_60), 16, 16)) -> intp(3, 0, 1e)
	.word 0xfea560ca  ! 689: STWA_I	stwa	%r31, [%r21 + 0x00ca] %asi
	.word 0xfa348000  ! 691: STH_R	sth	%r29, [%r18 + %r0]
	.word 0xf8b4c020  ! 692: STHA_R	stha	%r28, [%r19 + %r0] 0x01
cpu_intr_3_45:
	setx	0x230234, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_61), 16, 16)) -> intp(3, 0, 13)
cpu_intr_3_46:
	setx	0x21001c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_62), 16, 16)) -> intp(3, 0, 6)
	.word 0xfab48020  ! 705: STHA_R	stha	%r29, [%r18 + %r0] 0x01
T3_asi_reg_rd_39:
	mov	0xe, %r14
	.word 0xf8db8e40  ! 706: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_47:
	setx	0x21011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc25e1fd  ! 711: STW_I	stw	%r30, [%r23 + 0x01fd]
	ta	T_CHANGE_NONHPRIV
	.word 0xfeade131  ! 714: STBA_I	stba	%r31, [%r23 + 0x0131] %asi
	.word 0xf8246040  ! 715: STW_I	stw	%r28, [%r17 + 0x0040]
iob_intr_3_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_63), 16, 16)) -> intp(3, 0, 1a)
	.word 0xb69d20b2  ! 717: XORcc_I	xorcc 	%r20, 0x00b2, %r27
	.word 0xb8258000  ! 719: SUB_R	sub 	%r22, %r0, %r28
T3_asi_reg_rd_40:
	mov	0x3c7, %r14
	.word 0xf6db8e80  ! 720: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_3_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_64), 16, 16)) -> intp(3, 0, 33)
	.word 0xb2b5e0ae  ! 722: ORNcc_I	orncc 	%r23, 0x00ae, %r25
	.word 0xf6a5a009  ! 728: STWA_I	stwa	%r27, [%r22 + 0x0009] %asi
cpu_intr_3_48:
	setx	0x230020, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_49:
	setx	0x23000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_41:
	mov	0x9, %r14
	.word 0xf2db8400  ! 736: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	ta	T_CHANGE_TO_TL0
	.word 0xb97c2401  ! 742: MOVR_I	movre	%r16, 0x1, %r28
	.word 0xfa740000  ! 744: STX_R	stx	%r29, [%r16 + %r0]
	.word 0xf2750000  ! 745: STX_R	stx	%r25, [%r20 + %r0]
cpu_intr_3_50:
	setx	0x23032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0a5c000  ! 751: SUBcc_R	subcc 	%r23, %r0, %r24
	.word 0xf6246080  ! 752: STW_I	stw	%r27, [%r17 + 0x0080]
	.word 0xf82d4000  ! 757: STB_R	stb	%r28, [%r21 + %r0]
	.word 0xf8a5200e  ! 758: STWA_I	stwa	%r28, [%r20 + 0x000e] %asi
iob_intr_3_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_65), 16, 16)) -> intp(3, 0, b)
iob_intr_3_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_66), 16, 16)) -> intp(3, 0, 1)
cpu_intr_3_51:
	setx	0x20021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82460c6  ! 765: STW_I	stw	%r28, [%r17 + 0x00c6]
cpu_intr_3_52:
	setx	0x21023c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_53:
	setx	0x220018, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_42:
	mov	0x2a, %r14
	.word 0xfcdb89e0  ! 773: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfe74e146  ! 777: STX_I	stx	%r31, [%r19 + 0x0146]
T3_asi_reg_rd_43:
	mov	0x2d, %r14
	.word 0xf8db8e40  ! 778: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T3_asi_reg_wr_26:
	mov	0x2f, %r14
	.word 0xfaf38e40  ! 779: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf6b5a16f  ! 780: STHA_I	stha	%r27, [%r22 + 0x016f] %asi
cpu_intr_3_54:
	setx	0x210005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b4a1bb  ! 782: STHA_I	stha	%r25, [%r18 + 0x01bb] %asi
	.word 0xfea48020  ! 783: STWA_R	stwa	%r31, [%r18 + %r0] 0x01
	.word 0xfe34c000  ! 784: STH_R	sth	%r31, [%r19 + %r0]
T3_asi_reg_wr_27:
	mov	0x12, %r14
	.word 0xfcf38e60  ! 785: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_3_55:
	setx	0x220131, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_44:
	mov	0x18, %r14
	.word 0xf2db84a0  ! 787: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	ta	T_CHANGE_TO_TL0
cpu_intr_3_56:
	setx	0x220002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_67), 16, 16)) -> intp(3, 0, 28)
cpu_intr_3_57:
	setx	0x230118, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_58:
	setx	0x22002c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_68), 16, 16)) -> intp(3, 0, 1a)
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983a98  ! 801: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a98, %hpstate
	.word 0xb895a04b  ! 803: ORcc_I	orcc 	%r22, 0x004b, %r28
iob_intr_3_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_69), 16, 16)) -> intp(3, 0, 14)
	ta	T_CHANGE_TO_TL0
iob_intr_3_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_70), 16, 16)) -> intp(3, 0, b)
iob_intr_3_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_71), 16, 16)) -> intp(3, 0, e)
	.word 0xfcac212d  ! 809: STBA_I	stba	%r30, [%r16 + 0x012d] %asi
T3_asi_reg_wr_28:
	mov	0x24, %r14
	.word 0xf8f384a0  ! 810: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_3_59:
	setx	0x210305, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf62dc000  ! 815: STB_R	stb	%r27, [%r23 + %r0]
cpu_intr_3_60:
	setx	0x23030f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_61:
	setx	0x230134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb54020  ! 821: STHA_R	stha	%r31, [%r21 + %r0] 0x01
T3_asi_reg_rd_45:
	mov	0x1a, %r14
	.word 0xfcdb8e40  ! 822: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfc240000  ! 823: STW_R	stw	%r30, [%r16 + %r0]
	.word 0xf22c60d0  ! 825: STB_I	stb	%r25, [%r17 + 0x00d0]
	.word 0xbc9da1ee  ! 826: XORcc_I	xorcc 	%r22, 0x01ee, %r30
	.word 0xf2ad4020  ! 827: STBA_R	stba	%r25, [%r21 + %r0] 0x01
T3_asi_reg_wr_29:
	mov	0x1, %r14
	.word 0xf4f389e0  ! 830: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_3_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_72), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_rd_46:
	mov	0x3c2, %r14
	.word 0xfadb8e80  ! 835: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xfe25c000  ! 838: STW_R	stw	%r31, [%r23 + %r0]
T3_asi_reg_wr_30:
	mov	0x11, %r14
	.word 0xfaf38e40  ! 839: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_rd_47:
	mov	0x3c6, %r14
	.word 0xf2db89e0  ! 841: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xf8750000  ! 843: STX_R	stx	%r28, [%r20 + %r0]
iob_intr_3_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_73), 16, 16)) -> intp(3, 0, 6)
	.word 0xf2f4e0d4  ! 845: STXA_I	stxa	%r25, [%r19 + 0x00d4] %asi
	ta	T_CHANGE_TO_TL1
	.word 0xfcac0020  ! 847: STBA_R	stba	%r30, [%r16 + %r0] 0x01
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983ad8  ! 849: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ad8, %hpstate
cpu_intr_3_62:
	setx	0x200231, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_31:
	mov	0x3c8, %r14
	.word 0xf6f38400  ! 853: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xba35a0d7  ! 855: ORN_I	orn 	%r22, 0x00d7, %r29
	.word 0xf635e1f1  ! 857: STH_I	sth	%r27, [%r23 + 0x01f1]
iob_intr_3_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_74), 16, 16)) -> intp(3, 0, 3f)
	.word 0xfc34c000  ! 862: STH_R	sth	%r30, [%r19 + %r0]
	.word 0xb00de185  ! 864: AND_I	and 	%r23, 0x0185, %r24
iob_intr_3_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_75), 16, 16)) -> intp(3, 0, 3c)
cpu_intr_3_63:
	setx	0x20003f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_64:
	setx	0x20021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3c5000  ! 869: SRAX_R	srax	%r17, %r0, %r30
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_TO_TL0
	.word 0xf634c000  ! 874: STH_R	sth	%r27, [%r19 + %r0]
cpu_intr_3_65:
	setx	0x220328, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf02d60e8  ! 879: STB_I	stb	%r24, [%r21 + 0x00e8]
T3_asi_reg_rd_48:
	mov	0xb, %r14
	.word 0xf6db8e60  ! 880: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf434a124  ! 882: STH_I	sth	%r26, [%r18 + 0x0124]
cpu_intr_3_66:
	setx	0x20031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a48020  ! 887: STWA_R	stwa	%r25, [%r18 + %r0] 0x01
cpu_intr_3_67:
	setx	0x220216, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_68:
	setx	0x22022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb97c0400  ! 892: MOVR_R	movre	%r16, %r0, %r28
T3_asi_reg_rd_49:
	mov	0x1e, %r14
	.word 0xf8db84a0  ! 894: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf035c000  ! 896: STH_R	sth	%r24, [%r23 + %r0]
	.word 0xf62560cc  ! 897: STW_I	stw	%r27, [%r21 + 0x00cc]
cpu_intr_3_69:
	setx	0x10f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_50:
	mov	0x17, %r14
	.word 0xf6db8e40  ! 905: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_70:
	setx	0x270122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe758000  ! 907: STX_R	stx	%r31, [%r22 + %r0]
	.word 0xf434c000  ! 909: STH_R	sth	%r26, [%r19 + %r0]
T3_asi_reg_wr_32:
	mov	0xb, %r14
	.word 0xfcf38e60  ! 910: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb8842181  ! 912: ADDcc_I	addcc 	%r16, 0x0181, %r28
	.word 0xf234c000  ! 913: STH_R	sth	%r25, [%r19 + %r0]
iob_intr_3_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_76), 16, 16)) -> intp(3, 0, 28)
	.word 0x8f902002  ! 918: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xf224a036  ! 919: STW_I	stw	%r25, [%r18 + 0x0036]
	.word 0xb0052175  ! 920: ADD_I	add 	%r20, 0x0175, %r24
T3_asi_reg_rd_51:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 922: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_71:
	setx	0x26000f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_72:
	setx	0x250317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab421b6  ! 925: STHA_I	stha	%r29, [%r16 + 0x01b6] %asi
T3_asi_reg_wr_33:
	mov	0x2f, %r14
	.word 0xf4f38e80  ! 929: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T3_asi_reg_rd_52:
	mov	0x2c, %r14
	.word 0xf0db8e40  ! 930: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf2a54020  ! 931: STWA_R	stwa	%r25, [%r21 + %r0] 0x01
	.word 0xfaad4020  ! 932: STBA_R	stba	%r29, [%r21 + %r0] 0x01
	.word 0xfc2dc000  ! 933: STB_R	stb	%r30, [%r23 + %r0]
	.word 0xf874c000  ! 934: STX_R	stx	%r28, [%r19 + %r0]
cpu_intr_3_73:
	setx	0x270230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb57cc400  ! 936: MOVR_R	movre	%r19, %r0, %r26
	.word 0x8f902001  ! 940: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xb4b46006  ! 941: SUBCcc_I	orncc 	%r17, 0x0006, %r26
	.word 0xbe454000  ! 942: ADDC_R	addc 	%r21, %r0, %r31
T3_asi_reg_rd_53:
	mov	0x3c8, %r14
	.word 0xfedb8e60  ! 943: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xba1c0000  ! 944: XOR_R	xor 	%r16, %r0, %r29
iob_intr_3_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_77), 16, 16)) -> intp(3, 0, 34)
iob_intr_3_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_78), 16, 16)) -> intp(3, 0, 24)
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_54:
	mov	0x2d, %r14
	.word 0xf2db8400  ! 959: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf6a421d9  ! 960: STWA_I	stwa	%r27, [%r16 + 0x01d9] %asi
	.word 0xfc2c601c  ! 961: STB_I	stb	%r30, [%r17 + 0x001c]
T3_asi_reg_rd_55:
	mov	0x3c0, %r14
	.word 0xf6db8e80  ! 963: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf0f4a049  ! 969: STXA_I	stxa	%r24, [%r18 + 0x0049] %asi
	.word 0xb22de1c7  ! 971: ANDN_I	andn 	%r23, 0x01c7, %r25
iob_intr_3_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_79), 16, 16)) -> intp(3, 0, 32)
iob_intr_3_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_80), 16, 16)) -> intp(3, 0, 26)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf82dc000  ! 979: STB_R	stb	%r28, [%r23 + %r0]
	.word 0xf4258000  ! 980: STW_R	stw	%r26, [%r22 + %r0]
iob_intr_3_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_81), 16, 16)) -> intp(3, 0, 31)
	.word 0xf2b561d7  ! 982: STHA_I	stha	%r25, [%r21 + 0x01d7] %asi
T3_asi_reg_wr_34:
	mov	0x3c6, %r14
	.word 0xfef38400  ! 989: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xfc348000  ! 990: STH_R	sth	%r30, [%r18 + %r0]
cpu_intr_3_74:
	setx	0x260322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_75:
	setx	0x270326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2adc020  ! 995: STBA_R	stba	%r25, [%r23 + %r0] 0x01
T3_asi_reg_wr_35:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 997: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_76:
	setx	0x250122, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_82), 16, 16)) -> intp(3, 0, 31)
iob_intr_3_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_83), 16, 16)) -> intp(3, 0, 3e)
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
	.word 0xfa350000  ! 1007: STH_R	sth	%r29, [%r20 + %r0]
cpu_intr_3_77:
	setx	0x27023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc740000  ! 1012: STX_R	stx	%r30, [%r16 + %r0]
iob_intr_3_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_84), 16, 16)) -> intp(3, 0, 35)
T3_asi_reg_rd_56:
	mov	0x1b, %r14
	.word 0xf4db8e40  ! 1015: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_rd_57:
	mov	0x18, %r14
	.word 0xf2db8e40  ! 1016: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_3_78:
	setx	0x26032e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_36:
	mov	0x2d, %r14
	.word 0xf8f38400  ! 1021: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_3_79:
	setx	0x26000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6754000  ! 1025: STX_R	stx	%r27, [%r21 + %r0]
cpu_intr_3_80:
	setx	0x250006, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_81:
	setx	0x260100, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_85), 16, 16)) -> intp(3, 0, 2f)
T3_asi_reg_wr_37:
	mov	0x3c7, %r14
	.word 0xf2f38e40  ! 1032: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf6a54020  ! 1033: STWA_R	stwa	%r27, [%r21 + %r0] 0x01
cpu_intr_3_82:
	setx	0x26022e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_86), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf0246114  ! 1036: STW_I	stw	%r24, [%r17 + 0x0114]
T3_asi_reg_wr_38:
	mov	0x1c, %r14
	.word 0xfef389e0  ! 1041: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf02d0000  ! 1042: STB_R	stb	%r24, [%r20 + %r0]
T3_asi_reg_rd_58:
	mov	0x3c4, %r14
	.word 0xf2db84a0  ! 1044: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf6a58020  ! 1047: STWA_R	stwa	%r27, [%r22 + %r0] 0x01
	.word 0xfc244000  ! 1049: STW_R	stw	%r30, [%r17 + %r0]
	.word 0xf2350000  ! 1050: STH_R	sth	%r25, [%r20 + %r0]
iob_intr_3_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_87), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf4f5e118  ! 1055: STXA_I	stxa	%r26, [%r23 + 0x0118] %asi
	.word 0xf82de1e6  ! 1056: STB_I	stb	%r28, [%r23 + 0x01e6]
	.word 0xfea44020  ! 1058: STWA_R	stwa	%r31, [%r17 + %r0] 0x01
cpu_intr_3_83:
	setx	0x260208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53de001  ! 1060: SRA_I	sra 	%r23, 0x0001, %r26
	.word 0xb7643801  ! 1063: MOVcc_I	<illegal instruction>
	.word 0xbb35e001  ! 1064: SRL_I	srl 	%r23, 0x0001, %r29
	.word 0xf0a58020  ! 1065: STWA_R	stwa	%r24, [%r22 + %r0] 0x01
cpu_intr_3_84:
	setx	0x240101, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfeb48020  ! 1071: STHA_R	stha	%r31, [%r18 + %r0] 0x01
T3_asi_reg_rd_59:
	mov	0x6, %r14
	.word 0xfadb8e40  ! 1072: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_wr_39:
	mov	0x1, %r14
	.word 0xfaf38e60  ! 1074: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf2a5203f  ! 1075: STWA_I	stwa	%r25, [%r20 + 0x003f] %asi
iob_intr_3_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_88), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf0b5e132  ! 1081: STHA_I	stha	%r24, [%r23 + 0x0132] %asi
cpu_intr_3_85:
	setx	0x270208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82561fc  ! 1085: STW_I	stw	%r28, [%r21 + 0x01fc]
cpu_intr_3_86:
	setx	0x240228, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_87:
	setx	0x26002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_60:
	mov	0x20, %r14
	.word 0xfcdb8e40  ! 1091: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf2242151  ! 1093: STW_I	stw	%r25, [%r16 + 0x0151]
iob_intr_3_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_89), 16, 16)) -> intp(3, 0, 8)
	.word 0xfc75e0a4  ! 1097: STX_I	stx	%r30, [%r23 + 0x00a4]
iob_intr_3_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_90), 16, 16)) -> intp(3, 0, 27)
iob_intr_3_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_91), 16, 16)) -> intp(3, 0, 33)
	.word 0xfa2d0000  ! 1103: STB_R	stb	%r29, [%r20 + %r0]
	.word 0xb8252152  ! 1104: SUB_I	sub 	%r20, 0x0152, %r28
T3_asi_reg_rd_61:
	mov	0x3c8, %r14
	.word 0xf0db8e40  ! 1105: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfaace00f  ! 1106: STBA_I	stba	%r29, [%r19 + 0x000f] %asi
T3_asi_reg_wr_40:
	mov	0x20, %r14
	.word 0xf2f38e40  ! 1107: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_3_88:
	setx	0x260113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8f52156  ! 1110: STXA_I	stxa	%r28, [%r20 + 0x0156] %asi
cpu_intr_3_89:
	setx	0x250003, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_92), 16, 16)) -> intp(3, 0, 3e)
	.word 0xfc2c21dd  ! 1115: STB_I	stb	%r30, [%r16 + 0x01dd]
	.word 0xf82dc000  ! 1116: STB_R	stb	%r28, [%r23 + %r0]
	.word 0xf02560e3  ! 1118: STW_I	stw	%r24, [%r21 + 0x00e3]
iob_intr_3_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_93), 16, 16)) -> intp(3, 0, 20)
T3_asi_reg_wr_41:
	mov	0x3c7, %r14
	.word 0xfaf38e40  ! 1123: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_3_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_94), 16, 16)) -> intp(3, 0, 34)
	.word 0xf2f46166  ! 1126: STXA_I	stxa	%r25, [%r17 + 0x0166] %asi
	.word 0x8195e14f  ! 1127: WRPR_TPC_I	wrpr	%r23, 0x014f, %tpc
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_62:
	mov	0x3c8, %r14
	.word 0xfadb8e80  ! 1130: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf6f421ff  ! 1132: STXA_I	stxa	%r27, [%r16 + 0x01ff] %asi
	.word 0xf0350000  ! 1134: STH_R	sth	%r24, [%r20 + %r0]
	.word 0xfaaca033  ! 1135: STBA_I	stba	%r29, [%r18 + 0x0033] %asi
iob_intr_3_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_95), 16, 16)) -> intp(3, 0, 3)
cpu_intr_3_90:
	setx	0x25001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc35e1ef  ! 1139: STH_I	sth	%r30, [%r23 + 0x01ef]
iob_intr_3_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_96), 16, 16)) -> intp(3, 0, 37)
iob_intr_3_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_97), 16, 16)) -> intp(3, 0, 19)
iob_intr_3_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_98), 16, 16)) -> intp(3, 0, 33)
iob_intr_3_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_99), 16, 16)) -> intp(3, 0, 1b)
	.word 0xfcb42047  ! 1153: STHA_I	stha	%r30, [%r16 + 0x0047] %asi
	.word 0xfea48020  ! 1155: STWA_R	stwa	%r31, [%r18 + %r0] 0x01
	.word 0xfcb520c3  ! 1157: STHA_I	stha	%r30, [%r20 + 0x00c3] %asi
iob_intr_3_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_100), 16, 16)) -> intp(3, 0, 1c)
	.word 0xfab54020  ! 1161: STHA_R	stha	%r29, [%r21 + %r0] 0x01
cpu_intr_3_91:
	setx	0x25012d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_92:
	setx	0x250015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc75e0ad  ! 1165: STX_I	stx	%r30, [%r23 + 0x00ad]
cpu_intr_3_93:
	setx	0x25022c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_101), 16, 16)) -> intp(3, 0, 1e)
cpu_intr_3_94:
	setx	0x27032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_3_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_102), 16, 16)) -> intp(3, 0, 28)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_95:
	setx	0x250215, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_96:
	setx	0x260234, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983990  ! 1183: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1990, %hpstate
T3_asi_reg_wr_42:
	mov	0x35, %r14
	.word 0xf0f38e40  ! 1184: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf0f4218c  ! 1185: STXA_I	stxa	%r24, [%r16 + 0x018c] %asi
iob_intr_3_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_103), 16, 16)) -> intp(3, 0, a)
	.word 0xf82d8000  ! 1189: STB_R	stb	%r28, [%r22 + %r0]
iob_intr_3_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_104), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf42d6174  ! 1191: STB_I	stb	%r26, [%r21 + 0x0174]
T3_asi_reg_rd_63:
	mov	0x33, %r14
	.word 0xfadb8e60  ! 1192: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_3_97:
	setx	0x27000e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_64:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 1196: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_wr_43:
	mov	0x31, %r14
	.word 0xf8f38400  ! 1199: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf225a116  ! 1202: STW_I	stw	%r25, [%r22 + 0x0116]
	.word 0xfca44020  ! 1204: STWA_R	stwa	%r30, [%r17 + %r0] 0x01
cpu_intr_3_98:
	setx	0x250234, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_99:
	setx	0x240025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab5c020  ! 1210: STHA_R	stha	%r29, [%r23 + %r0] 0x01
cpu_intr_3_100:
	setx	0x270117, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_105), 16, 16)) -> intp(3, 0, 20)
	.word 0xf82da02e  ! 1215: STB_I	stb	%r28, [%r22 + 0x002e]
T3_asi_reg_wr_44:
	mov	0x18, %r14
	.word 0xfef38400  ! 1216: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf675a121  ! 1217: STX_I	stx	%r27, [%r22 + 0x0121]
	.word 0xbb3c0000  ! 1218: SRA_R	sra 	%r16, %r0, %r29
	.word 0xfc35215e  ! 1219: STH_I	sth	%r30, [%r20 + 0x015e]
	.word 0xbf2d9000  ! 1222: SLLX_R	sllx	%r22, %r0, %r31
	.word 0xfaa5c020  ! 1225: STWA_R	stwa	%r29, [%r23 + %r0] 0x01
iob_intr_3_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_106), 16, 16)) -> intp(3, 0, 1c)
	.word 0xf035e17e  ! 1229: STH_I	sth	%r24, [%r23 + 0x017e]
	.word 0xfaf5e038  ! 1231: STXA_I	stxa	%r29, [%r23 + 0x0038] %asi
cpu_intr_3_101:
	setx	0x250209, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_45:
	mov	0x15, %r14
	.word 0xf6f38e40  ! 1234: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfa2d20ba  ! 1236: STB_I	stb	%r29, [%r20 + 0x00ba]
T3_asi_reg_rd_65:
	mov	0x3c6, %r14
	.word 0xf8db8400  ! 1237: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T3_asi_reg_rd_66:
	mov	0xb, %r14
	.word 0xfedb84a0  ! 1239: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_3_102:
	setx	0x26023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf475c000  ! 1241: STX_R	stx	%r26, [%r23 + %r0]
iob_intr_3_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_107), 16, 16)) -> intp(3, 0, d)
	.word 0xb0c4c000  ! 1243: ADDCcc_R	addccc 	%r19, %r0, %r24
	.word 0xf22ce12b  ! 1245: STB_I	stb	%r25, [%r19 + 0x012b]
iob_intr_3_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_108), 16, 16)) -> intp(3, 0, 10)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_103:
	setx	0x240322, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_67:
	mov	0x3c6, %r14
	.word 0xf2db8e40  ! 1251: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_NONHPRIV
	.word 0xf8b54020  ! 1253: STHA_R	stha	%r28, [%r21 + %r0] 0x01
cpu_intr_3_104:
	setx	0x24022a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_105:
	setx	0x260316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc244000  ! 1263: STW_R	stw	%r30, [%r17 + %r0]
	.word 0xf62d4000  ! 1264: STB_R	stb	%r27, [%r21 + %r0]
	.word 0x89942139  ! 1265: WRPR_TICK_I	wrpr	%r16, 0x0139, %tick
T3_asi_reg_wr_46:
	mov	0xf, %r14
	.word 0xfef389e0  ! 1266: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T3_asi_reg_rd_68:
	mov	0x1d, %r14
	.word 0xf6db8e40  ! 1267: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_3_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_109), 16, 16)) -> intp(3, 0, 3e)
cpu_intr_3_106:
	setx	0x250030, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xb5356001  ! 1271: SRL_I	srl 	%r21, 0x0001, %r26
cpu_intr_3_107:
	setx	0x260010, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_110), 16, 16)) -> intp(3, 0, 23)
	.word 0xb0c4c000  ! 1274: ADDCcc_R	addccc 	%r19, %r0, %r24
	setx	data_start_4, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982c9a  ! 1280: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c9a, %hpstate
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_47:
	mov	0x23, %r14
	.word 0xfcf38e60  ! 1285: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_3_108:
	setx	0x240228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4348000  ! 1287: STH_R	sth	%r26, [%r18 + %r0]
T3_asi_reg_rd_69:
	mov	0x12, %r14
	.word 0xf8db8e40  ! 1291: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfc3421b2  ! 1293: STH_I	sth	%r30, [%r16 + 0x01b2]
T3_asi_reg_wr_48:
	mov	0xa, %r14
	.word 0xf2f389e0  ! 1296: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T3_asi_reg_rd_70:
	mov	0x35, %r14
	.word 0xf0db89e0  ! 1297: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_3_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_111), 16, 16)) -> intp(3, 0, 1f)
	.word 0xba34c000  ! 1299: SUBC_R	orn 	%r19, %r0, %r29
	.word 0xf2b44020  ! 1300: STHA_R	stha	%r25, [%r17 + %r0] 0x01
T3_asi_reg_wr_49:
	mov	0x22, %r14
	.word 0xfaf38e80  ! 1305: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_50:
	mov	0x3c0, %r14
	.word 0xf6f38e80  ! 1309: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf2752147  ! 1311: STX_I	stx	%r25, [%r20 + 0x0147]
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xf8b4e16c  ! 1316: STHA_I	stha	%r28, [%r19 + 0x016c] %asi
	.word 0xfea48020  ! 1319: STWA_R	stwa	%r31, [%r18 + %r0] 0x01
	.word 0xf275a02f  ! 1323: STX_I	stx	%r25, [%r22 + 0x002f]
iob_intr_3_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_112), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf6b5c020  ! 1328: STHA_R	stha	%r27, [%r23 + %r0] 0x01
	.word 0xb6ad212d  ! 1331: ANDNcc_I	andncc 	%r20, 0x012d, %r27
	.word 0xf8b5c020  ! 1333: STHA_R	stha	%r28, [%r23 + %r0] 0x01
T3_asi_reg_rd_71:
	mov	0x29, %r14
	.word 0xf4db8e40  ! 1335: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982d98  ! 1337: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d98, %hpstate
	.word 0xf8ad8020  ! 1338: STBA_R	stba	%r28, [%r22 + %r0] 0x01
T3_asi_reg_rd_72:
	mov	0x24, %r14
	.word 0xfadb8400  ! 1339: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xfa250000  ! 1341: STW_R	stw	%r29, [%r20 + %r0]
	.word 0xb734d000  ! 1342: SRLX_R	srlx	%r19, %r0, %r27
	.word 0xf8a50020  ! 1344: STWA_R	stwa	%r28, [%r20 + %r0] 0x01
cpu_intr_3_109:
	setx	0x260221, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_113), 16, 16)) -> intp(3, 0, 1b)
T3_asi_reg_wr_51:
	mov	0xb, %r14
	.word 0xfcf389e0  ! 1353: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_3_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_114), 16, 16)) -> intp(3, 0, 1a)
	.word 0xb7510000  ! 1356: RDPR_TICK	rdpr	%tick, %r27
T3_asi_reg_wr_52:
	mov	0x24, %r14
	.word 0xfcf38e80  ! 1358: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_3_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_115), 16, 16)) -> intp(3, 0, 33)
iob_intr_3_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_116), 16, 16)) -> intp(3, 0, 5)
cpu_intr_3_110:
	setx	0x25010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb42114  ! 1367: STHA_I	stha	%r30, [%r16 + 0x0114] %asi
	.word 0xf6aca0e3  ! 1371: STBA_I	stba	%r27, [%r18 + 0x00e3] %asi
	.word 0xbf520000  ! 1375: RDPR_PIL	<illegal instruction>
iob_intr_3_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_117), 16, 16)) -> intp(3, 0, 8)
T3_asi_reg_wr_53:
	mov	0x6, %r14
	.word 0xf0f38400  ! 1377: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_3_111:
	setx	0x2a013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42cc000  ! 1386: STB_R	stb	%r26, [%r19 + %r0]
	.word 0xf2a561a3  ! 1388: STWA_I	stwa	%r25, [%r21 + 0x01a3] %asi
T3_asi_reg_rd_73:
	mov	0x3c2, %r14
	.word 0xf8db8e40  ! 1389: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf824a02a  ! 1391: STW_I	stw	%r28, [%r18 + 0x002a]
iob_intr_3_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_118), 16, 16)) -> intp(3, 0, 1)
iob_intr_3_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_119), 16, 16)) -> intp(3, 0, f)
iob_intr_3_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_120), 16, 16)) -> intp(3, 0, 1f)
T3_asi_reg_wr_54:
	mov	0x38, %r14
	.word 0xfcf384a0  ! 1395: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb13cd000  ! 1397: SRAX_R	srax	%r19, %r0, %r24
T3_asi_reg_wr_55:
	mov	0x2f, %r14
	.word 0xf2f38e40  ! 1399: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_rd_74:
	mov	0x7, %r14
	.word 0xf4db89e0  ! 1400: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf0758000  ! 1401: STX_R	stx	%r24, [%r22 + %r0]
T3_asi_reg_rd_75:
	mov	0x3c3, %r14
	.word 0xf8db8e40  ! 1404: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_121), 16, 16)) -> intp(3, 0, 1)
	.word 0xf075e0dd  ! 1406: STX_I	stx	%r24, [%r23 + 0x00dd]
cpu_intr_3_112:
	setx	0x290104, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_122), 16, 16)) -> intp(3, 0, d)
iob_intr_3_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_123), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_wr_56:
	mov	0x23, %r14
	.word 0xf6f38e80  ! 1413: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xfaa54020  ! 1414: STWA_R	stwa	%r29, [%r21 + %r0] 0x01
cpu_intr_3_113:
	setx	0x2b0038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_124), 16, 16)) -> intp(3, 0, 2f)
cpu_intr_3_114:
	setx	0x2b013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982b1a  ! 1425: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1a, %hpstate
	ta	T_CHANGE_TO_TL0
iob_intr_3_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_125), 16, 16)) -> intp(3, 0, 17)
	.word 0xb6840000  ! 1431: ADDcc_R	addcc 	%r16, %r0, %r27
cpu_intr_3_115:
	setx	0x2b0225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b56000  ! 1434: STHA_I	stha	%r27, [%r21 + 0x0000] %asi
	.word 0xf4a44020  ! 1436: STWA_R	stwa	%r26, [%r17 + %r0] 0x01
	.word 0xf625c000  ! 1437: STW_R	stw	%r27, [%r23 + %r0]
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_57:
	mov	0x15, %r14
	.word 0xf6f38e80  ! 1440: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xfeac0020  ! 1442: STBA_R	stba	%r31, [%r16 + %r0] 0x01
	.word 0xf4ac8020  ! 1443: STBA_R	stba	%r26, [%r18 + %r0] 0x01
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983990  ! 1446: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1990, %hpstate
	.word 0xf6b58020  ! 1448: STHA_R	stha	%r27, [%r22 + %r0] 0x01
T3_asi_reg_wr_58:
	mov	0x1b, %r14
	.word 0xfcf389e0  ! 1454: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_3_116:
	setx	0x2b0008, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_117:
	setx	0x28003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_TO_TL1
cpu_intr_3_118:
	setx	0x2a023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982e88  ! 1463: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e88, %hpstate
iob_intr_3_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_126), 16, 16)) -> intp(3, 0, 18)
iob_intr_3_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_127), 16, 16)) -> intp(3, 0, d)
	ta	T_CHANGE_HPRIV
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983a8a  ! 1468: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a8a, %hpstate
	ta	T_CHANGE_TO_TL1
	.word 0xf075c000  ! 1470: STX_R	stx	%r24, [%r23 + %r0]
T3_asi_reg_rd_76:
	mov	0x3c1, %r14
	.word 0xf0db8e60  ! 1471: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983e8a  ! 1473: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e8a, %hpstate
	.word 0xf875c000  ! 1477: STX_R	stx	%r28, [%r23 + %r0]
	.word 0xf8b520e4  ! 1479: STHA_I	stha	%r28, [%r20 + 0x00e4] %asi
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982f4a  ! 1481: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4a, %hpstate
	.word 0xfeb48020  ! 1484: STHA_R	stha	%r31, [%r18 + %r0] 0x01
	.word 0xf4a4a005  ! 1485: STWA_I	stwa	%r26, [%r18 + 0x0005] %asi
	.word 0xbd3ca001  ! 1490: SRA_I	sra 	%r18, 0x0001, %r30
cpu_intr_3_119:
	setx	0x280004, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_59:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 1493: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbc2c4000  ! 1495: ANDN_R	andn 	%r17, %r0, %r30
	.word 0xbd35d000  ! 1496: SRLX_R	srlx	%r23, %r0, %r30
	.word 0xfc244000  ! 1502: STW_R	stw	%r30, [%r17 + %r0]
iob_intr_3_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_128), 16, 16)) -> intp(3, 0, 22)
iob_intr_3_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_129), 16, 16)) -> intp(3, 0, 13)
T3_asi_reg_rd_77:
	mov	0x18, %r14
	.word 0xf8db8400  ! 1511: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_3_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_130), 16, 16)) -> intp(3, 0, 3)
iob_intr_3_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_131), 16, 16)) -> intp(3, 0, 17)
cpu_intr_3_120:
	setx	0x2b012a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_78:
	mov	0x28, %r14
	.word 0xf6db8400  ! 1524: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_3_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_132), 16, 16)) -> intp(3, 0, 19)
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982e52  ! 1531: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e52, %hpstate
	.word 0xf6b46143  ! 1532: STHA_I	stha	%r27, [%r17 + 0x0143] %asi
cpu_intr_3_121:
	setx	0x2a0111, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_79:
	mov	0x3c0, %r14
	.word 0xf6db8e60  ! 1536: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf8754000  ! 1537: STX_R	stx	%r28, [%r21 + %r0]
T3_asi_reg_rd_80:
	mov	0x19, %r14
	.word 0xfadb84a0  ! 1540: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf4248000  ! 1541: STW_R	stw	%r26, [%r18 + %r0]
	.word 0xfa75e02d  ! 1543: STX_I	stx	%r29, [%r23 + 0x002d]
iob_intr_3_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_133), 16, 16)) -> intp(3, 0, b)
	.word 0xf0b54020  ! 1548: STHA_R	stha	%r24, [%r21 + %r0] 0x01
	.word 0xf8a44020  ! 1549: STWA_R	stwa	%r28, [%r17 + %r0] 0x01
	.word 0xb0bcc000  ! 1552: XNORcc_R	xnorcc 	%r19, %r0, %r24
	.word 0xfaa4a0e2  ! 1555: STWA_I	stwa	%r29, [%r18 + 0x00e2] %asi
iob_intr_3_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_134), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf8b50020  ! 1560: STHA_R	stha	%r28, [%r20 + %r0] 0x01
iob_intr_3_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_135), 16, 16)) -> intp(3, 0, 32)
	.word 0xfea5a0e6  ! 1564: STWA_I	stwa	%r31, [%r22 + 0x00e6] %asi
	.word 0xf8a460c3  ! 1567: STWA_I	stwa	%r28, [%r17 + 0x00c3] %asi
T3_asi_reg_wr_60:
	mov	0x1a, %r14
	.word 0xfaf38e80  ! 1573: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_3_122:
	setx	0x28001c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_61:
	mov	0x30, %r14
	.word 0xf4f38400  ! 1575: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xfa24c000  ! 1576: STW_R	stw	%r29, [%r19 + %r0]
	.word 0xf6240000  ! 1577: STW_R	stw	%r27, [%r16 + %r0]
	ta	T_CHANGE_TO_TL1
	.word 0xbab50000  ! 1580: SUBCcc_R	orncc 	%r20, %r0, %r29
T3_asi_reg_wr_62:
	mov	0x11, %r14
	.word 0xf4f38e60  ! 1581: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xfaf4a186  ! 1583: STXA_I	stxa	%r29, [%r18 + 0x0186] %asi
	.word 0xf2254000  ! 1584: STW_R	stw	%r25, [%r21 + %r0]
	.word 0xf2a50020  ! 1587: STWA_R	stwa	%r25, [%r20 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xba344000  ! 1590: SUBC_R	orn 	%r17, %r0, %r29
	.word 0xf8b50020  ! 1592: STHA_R	stha	%r28, [%r20 + %r0] 0x01
	.word 0xba3da0f3  ! 1593: XNOR_I	xnor 	%r22, 0x00f3, %r29
	.word 0xb0bd2051  ! 1595: XNORcc_I	xnorcc 	%r20, 0x0051, %r24
	.word 0xf8ace01e  ! 1596: STBA_I	stba	%r28, [%r19 + 0x001e] %asi
	.word 0xf6348000  ! 1597: STH_R	sth	%r27, [%r18 + %r0]
	.word 0xfe35c000  ! 1598: STH_R	sth	%r31, [%r23 + %r0]
iob_intr_3_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_136), 16, 16)) -> intp(3, 0, 3b)
T3_asi_reg_wr_63:
	mov	0x2e, %r14
	.word 0xf0f38e60  ! 1603: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_64:
	mov	0x15, %r14
	.word 0xf2f384a0  ! 1609: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf834c000  ! 1610: STH_R	sth	%r28, [%r19 + %r0]
cpu_intr_3_123:
	setx	0x29001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6354000  ! 1618: STH_R	sth	%r27, [%r21 + %r0]
	.word 0xf43421fa  ! 1619: STH_I	sth	%r26, [%r16 + 0x01fa]
T3_asi_reg_rd_81:
	mov	0x34, %r14
	.word 0xfadb8e40  ! 1620: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb894a023  ! 1627: ORcc_I	orcc 	%r18, 0x0023, %r28
iob_intr_3_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_137), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_124:
	setx	0x2b0007, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_82:
	mov	0x28, %r14
	.word 0xf2db84a0  ! 1631: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xfcf4e125  ! 1635: STXA_I	stxa	%r30, [%r19 + 0x0125] %asi
cpu_intr_3_125:
	setx	0x2a0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb32c2001  ! 1642: SLL_I	sll 	%r16, 0x0001, %r25
	.word 0xb28de020  ! 1644: ANDcc_I	andcc 	%r23, 0x0020, %r25
cpu_intr_3_126:
	setx	0x290005, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_138), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf0254000  ! 1648: STW_R	stw	%r24, [%r21 + %r0]
	.word 0xf4ad8020  ! 1651: STBA_R	stba	%r26, [%r22 + %r0] 0x01
cpu_intr_3_127:
	setx	0x290101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb93c1000  ! 1655: SRAX_R	srax	%r16, %r0, %r28
	.word 0xb5641800  ! 1656: MOVcc_R	<illegal instruction>
	.word 0xfeac4020  ! 1661: STBA_R	stba	%r31, [%r17 + %r0] 0x01
T3_asi_reg_wr_65:
	mov	0x3c8, %r14
	.word 0xf4f389e0  ! 1663: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf2b56047  ! 1665: STHA_I	stha	%r25, [%r21 + 0x0047] %asi
T3_asi_reg_rd_83:
	mov	0x9, %r14
	.word 0xfedb8e80  ! 1667: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf274e0f3  ! 1669: STX_I	stx	%r25, [%r19 + 0x00f3]
T3_asi_reg_rd_84:
	mov	0x4, %r14
	.word 0xfadb89e0  ! 1670: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T3_asi_reg_wr_66:
	mov	0x3, %r14
	.word 0xf0f389e0  ! 1672: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T3_asi_reg_wr_67:
	mov	0x3c8, %r14
	.word 0xfaf38e60  ! 1673: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xfe2c20b7  ! 1674: STB_I	stb	%r31, [%r16 + 0x00b7]
cpu_intr_3_128:
	setx	0x290219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa5e011  ! 1676: STWA_I	stwa	%r29, [%r23 + 0x0011] %asi
T3_asi_reg_rd_85:
	mov	0x9, %r14
	.word 0xf0db8e60  ! 1681: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb434204e  ! 1686: ORN_I	orn 	%r16, 0x004e, %r26
iob_intr_3_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_139), 16, 16)) -> intp(3, 0, 1)
iob_intr_3_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_140), 16, 16)) -> intp(3, 0, d)
cpu_intr_3_129:
	setx	0x2a013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2ca17c  ! 1693: STB_I	stb	%r30, [%r18 + 0x017c]
	.word 0xfe2d0000  ! 1694: STB_R	stb	%r31, [%r20 + %r0]
	.word 0xf6ac61c7  ! 1695: STBA_I	stba	%r27, [%r17 + 0x01c7] %asi
	.word 0xf6b40020  ! 1696: STHA_R	stha	%r27, [%r16 + %r0] 0x01
	.word 0xf63560f9  ! 1697: STH_I	sth	%r27, [%r21 + 0x00f9]
cpu_intr_3_130:
	setx	0x280327, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_131:
	setx	0x29032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb62c8000  ! 1706: ANDN_R	andn 	%r18, %r0, %r27
	.word 0xf42c21f2  ! 1708: STB_I	stb	%r26, [%r16 + 0x01f2]
	.word 0xb41c8000  ! 1709: XOR_R	xor 	%r18, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc248000  ! 1711: STW_R	stw	%r30, [%r18 + %r0]
	.word 0xb351c000  ! 1714: RDPR_TL	rdpr	%tl, %r25
T3_asi_reg_wr_68:
	mov	0x16, %r14
	.word 0xfaf38e80  ! 1715: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf4b560c4  ! 1717: STHA_I	stha	%r26, [%r21 + 0x00c4] %asi
T3_asi_reg_wr_69:
	mov	0x31, %r14
	.word 0xf2f38e40  ! 1718: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf8742104  ! 1720: STX_I	stx	%r28, [%r16 + 0x0104]
T3_asi_reg_wr_70:
	mov	0x1e, %r14
	.word 0xfcf389e0  ! 1721: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf2248000  ! 1723: STW_R	stw	%r25, [%r18 + %r0]
	ta	T_CHANGE_NONHPRIV
	.word 0xf825e0c4  ! 1733: STW_I	stw	%r28, [%r23 + 0x00c4]
T3_asi_reg_rd_86:
	mov	0x12, %r14
	.word 0xfcdb8e40  ! 1738: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_3_132:
	setx	0x1011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ad0020  ! 1743: STBA_R	stba	%r28, [%r20 + %r0] 0x01
T3_asi_reg_wr_71:
	mov	0x3c4, %r14
	.word 0xfcf38400  ! 1745: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xf2758000  ! 1746: STX_R	stx	%r25, [%r22 + %r0]
	.word 0xfa350000  ! 1748: STH_R	sth	%r29, [%r20 + %r0]
iob_intr_3_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_141), 16, 16)) -> intp(3, 0, 15)
	.word 0xb03ca088  ! 1752: XNOR_I	xnor 	%r18, 0x0088, %r24
	.word 0xb1641800  ! 1753: MOVcc_R	<illegal instruction>
T3_asi_reg_wr_72:
	mov	0x23, %r14
	.word 0xf8f389e0  ! 1755: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T3_asi_reg_rd_87:
	mov	0x1d, %r14
	.word 0xfadb8400  ! 1756: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xfc75618b  ! 1757: STX_I	stx	%r30, [%r21 + 0x018b]
	.word 0xf8356049  ! 1758: STH_I	sth	%r28, [%r21 + 0x0049]
T3_asi_reg_wr_73:
	mov	0x29, %r14
	.word 0xfcf38e40  ! 1759: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T3_asi_reg_wr_74:
	mov	0x3c6, %r14
	.word 0xf0f384a0  ! 1760: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T3_asi_reg_wr_75:
	mov	0x3c7, %r14
	.word 0xf8f384a0  ! 1761: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbd2ca001  ! 1762: SLL_I	sll 	%r18, 0x0001, %r30
	.word 0xfab5a074  ! 1764: STHA_I	stha	%r29, [%r22 + 0x0074] %asi
T3_asi_reg_wr_76:
	mov	0x35, %r14
	.word 0xf8f38400  ! 1765: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf2a48020  ! 1767: STWA_R	stwa	%r25, [%r18 + %r0] 0x01
	.word 0xf22d4000  ! 1770: STB_R	stb	%r25, [%r21 + %r0]
cpu_intr_3_133:
	setx	0x2a0030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe75206d  ! 1772: STX_I	stx	%r31, [%r20 + 0x006d]
	.word 0xfea48020  ! 1773: STWA_R	stwa	%r31, [%r18 + %r0] 0x01
iob_intr_3_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_142), 16, 16)) -> intp(3, 0, 2f)
	.word 0xfc2d209e  ! 1776: STB_I	stb	%r30, [%r20 + 0x009e]
iob_intr_3_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_143), 16, 16)) -> intp(3, 0, 32)
	.word 0xf025a18f  ! 1778: STW_I	stw	%r24, [%r22 + 0x018f]
	.word 0xf82ce0bf  ! 1779: STB_I	stb	%r28, [%r19 + 0x00bf]
cpu_intr_3_134:
	setx	0x290106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a40020  ! 1782: STWA_R	stwa	%r27, [%r16 + %r0] 0x01
	.word 0xf63560c4  ! 1783: STH_I	sth	%r27, [%r21 + 0x00c4]
	.word 0xfc35e102  ! 1785: STH_I	sth	%r30, [%r23 + 0x0102]
	.word 0xfeac2154  ! 1787: STBA_I	stba	%r31, [%r16 + 0x0154] %asi
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x819828da  ! 1789: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08da, %hpstate
	.word 0xf02c8000  ! 1790: STB_R	stb	%r24, [%r18 + %r0]
	.word 0xf6a5a02c  ! 1791: STWA_I	stwa	%r27, [%r22 + 0x002c] %asi
	.word 0xb89ce08b  ! 1792: XORcc_I	xorcc 	%r19, 0x008b, %r28
	ta	T_CHANGE_TO_TL1
iob_intr_3_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_144), 16, 16)) -> intp(3, 0, 32)
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_77:
	mov	0x14, %r14
	.word 0xfcf38e80  ! 1800: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_3_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_145), 16, 16)) -> intp(3, 0, 1b)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbc94e1b2  ! 1807: ORcc_I	orcc 	%r19, 0x01b2, %r30
	.word 0xf8b4e08d  ! 1812: STHA_I	stha	%r28, [%r19 + 0x008d] %asi
	.word 0xf8f46138  ! 1814: STXA_I	stxa	%r28, [%r17 + 0x0138] %asi
iob_intr_3_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_146), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_rd_88:
	mov	0x1, %r14
	.word 0xf2db84a0  ! 1816: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xfe2c8000  ! 1819: STB_R	stb	%r31, [%r18 + %r0]
iob_intr_3_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_147), 16, 16)) -> intp(3, 0, 28)
iob_intr_3_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_148), 16, 16)) -> intp(3, 0, d)
T3_asi_reg_rd_89:
	mov	0x13, %r14
	.word 0xf8db89e0  ! 1826: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_3_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_149), 16, 16)) -> intp(3, 0, 2)
iob_intr_3_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_150), 16, 16)) -> intp(3, 0, 7)
	.word 0xb1540000  ! 1832: RDPR_GL	rdpr	%-, %r24
	.word 0xf02c21fb  ! 1834: STB_I	stb	%r24, [%r16 + 0x01fb]
	.word 0xfa2c4000  ! 1837: STB_R	stb	%r29, [%r17 + %r0]
	.word 0xf0348000  ! 1839: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xfe2560e5  ! 1840: STW_I	stw	%r31, [%r21 + 0x00e5]
iob_intr_3_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_151), 16, 16)) -> intp(3, 0, 2f)
cpu_intr_3_135:
	setx	0x2f0338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf235a091  ! 1845: STH_I	sth	%r25, [%r22 + 0x0091]
cpu_intr_3_136:
	setx	0x2f0200, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_137:
	setx	0x2c0031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf675e0e9  ! 1851: STX_I	stx	%r27, [%r23 + 0x00e9]
	.word 0xf67520e4  ! 1852: STX_I	stx	%r27, [%r20 + 0x00e4]
	.word 0xfc35a090  ! 1854: STH_I	sth	%r30, [%r22 + 0x0090]
T3_asi_reg_wr_78:
	mov	0x9, %r14
	.word 0xf4f38e40  ! 1855: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xba2c6163  ! 1856: ANDN_I	andn 	%r17, 0x0163, %r29
	.word 0xf6252087  ! 1857: STW_I	stw	%r27, [%r20 + 0x0087]
	.word 0xfaad8020  ! 1859: STBA_R	stba	%r29, [%r22 + %r0] 0x01
iob_intr_3_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_152), 16, 16)) -> intp(3, 0, 16)
	ta	T_CHANGE_TO_TL1
iob_intr_3_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_153), 16, 16)) -> intp(3, 0, 37)
	.word 0xf42de0e9  ! 1865: STB_I	stb	%r26, [%r23 + 0x00e9]
T3_asi_reg_rd_90:
	mov	0x3c3, %r14
	.word 0xf8db8e80  ! 1866: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T3_asi_reg_wr_79:
	mov	0x9, %r14
	.word 0xfcf389e0  ! 1867: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf4f420ba  ! 1868: STXA_I	stxa	%r26, [%r16 + 0x00ba] %asi
	.word 0xfe258000  ! 1869: STW_R	stw	%r31, [%r22 + %r0]
T3_asi_reg_rd_91:
	mov	0x3c4, %r14
	.word 0xfedb8e80  ! 1871: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xfea4a137  ! 1872: STWA_I	stwa	%r31, [%r18 + 0x0137] %asi
	.word 0xfa248000  ! 1875: STW_R	stw	%r29, [%r18 + %r0]
	.word 0xfa25e0b3  ! 1876: STW_I	stw	%r29, [%r23 + 0x00b3]
T3_asi_reg_rd_92:
	mov	0x18, %r14
	.word 0xfcdb8e40  ! 1878: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_3_138:
	setx	0x2e0117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ac8020  ! 1885: STBA_R	stba	%r28, [%r18 + %r0] 0x01
iob_intr_3_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_154), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_139:
	setx	0x2d0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf035a111  ! 1893: STH_I	sth	%r24, [%r22 + 0x0111]
	.word 0xf634a172  ! 1897: STH_I	sth	%r27, [%r18 + 0x0172]
	.word 0xf2ade0e6  ! 1899: STBA_I	stba	%r25, [%r23 + 0x00e6] %asi
	.word 0xfc74618c  ! 1900: STX_I	stx	%r30, [%r17 + 0x018c]
	.word 0xfaa46037  ! 1901: STWA_I	stwa	%r29, [%r17 + 0x0037] %asi
	.word 0xfe7460fb  ! 1902: STX_I	stx	%r31, [%r17 + 0x00fb]
cpu_intr_3_140:
	setx	0x2d011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42ca050  ! 1904: STB_I	stb	%r26, [%r18 + 0x0050]
	.word 0xb6bc2095  ! 1905: XNORcc_I	xnorcc 	%r16, 0x0095, %r27
	.word 0xf475a17d  ! 1906: STX_I	stx	%r26, [%r22 + 0x017d]
T3_asi_reg_wr_80:
	mov	0x1d, %r14
	.word 0xfef38e40  ! 1907: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf624a097  ! 1908: STW_I	stw	%r27, [%r18 + 0x0097]
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982c00  ! 1913: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c00, %hpstate
iob_intr_3_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_155), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf2b48020  ! 1916: STHA_R	stha	%r25, [%r18 + %r0] 0x01
	.word 0x919461c3  ! 1917: WRPR_PIL_I	wrpr	%r17, 0x01c3, %pil
cpu_intr_3_141:
	setx	0x2d013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2d6083  ! 1919: STB_I	stb	%r29, [%r21 + 0x0083]
T3_asi_reg_wr_81:
	mov	0x2a, %r14
	.word 0xf0f38e80  ! 1922: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb8b52100  ! 1923: ORNcc_I	orncc 	%r20, 0x0100, %r28
cpu_intr_3_142:
	setx	0x2d030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf434a072  ! 1925: STH_I	sth	%r26, [%r18 + 0x0072]
	.word 0xfc740000  ! 1926: STX_R	stx	%r30, [%r16 + %r0]
T3_asi_reg_rd_93:
	mov	0x1e, %r14
	.word 0xf6db8e40  ! 1927: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_143:
	setx	0x2f0325, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_82:
	mov	0x31, %r14
	.word 0xfef38400  ! 1931: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_3_144:
	setx	0x2c0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62ce0bd  ! 1936: STB_I	stb	%r27, [%r19 + 0x00bd]
cpu_intr_3_145:
	setx	0x2e0236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b58020  ! 1940: STHA_R	stha	%r28, [%r22 + %r0] 0x01
	.word 0xb7643801  ! 1941: MOVcc_I	<illegal instruction>
	.word 0xf6ace046  ! 1942: STBA_I	stba	%r27, [%r19 + 0x0046] %asi
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x819829c8  ! 1943: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c8, %hpstate
cpu_intr_3_146:
	setx	0x2f0122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb405a010  ! 1946: ADD_I	add 	%r22, 0x0010, %r26
cpu_intr_3_147:
	setx	0x2c022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a4e058  ! 1948: STWA_I	stwa	%r27, [%r19 + 0x0058] %asi
cpu_intr_3_148:
	setx	0x2d0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4344000  ! 1953: STH_R	sth	%r26, [%r17 + %r0]
	.word 0xfc34e052  ! 1956: STH_I	sth	%r30, [%r19 + 0x0052]
	.word 0xf6248000  ! 1958: STW_R	stw	%r27, [%r18 + %r0]
cpu_intr_3_149:
	setx	0x2e0039, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_156), 16, 16)) -> intp(3, 0, 1e)
cpu_intr_3_150:
	setx	0x2e000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc25e157  ! 1965: STW_I	stw	%r30, [%r23 + 0x0157]
	.word 0xbc354000  ! 1968: SUBC_R	orn 	%r21, %r0, %r30
T3_asi_reg_rd_94:
	mov	0x27, %r14
	.word 0xf4db8e40  ! 1970: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_151:
	setx	0x2f023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaf4210f  ! 1973: STXA_I	stxa	%r29, [%r16 + 0x010f] %asi
	.word 0xf2a54020  ! 1974: STWA_R	stwa	%r25, [%r21 + %r0] 0x01
	.word 0xbe144000  ! 1975: OR_R	or 	%r17, %r0, %r31
iob_intr_3_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_157), 16, 16)) -> intp(3, 0, 2d)
T3_asi_reg_rd_95:
	mov	0x3c7, %r14
	.word 0xf0db8e40  ! 1977: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_3_152:
	setx	0x2d0228, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_96:
	mov	0x37, %r14
	.word 0xf6db8e80  ! 1979: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T3_asi_reg_rd_97:
	mov	0x30, %r14
	.word 0xfadb8400  ! 1981: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbea4c000  ! 1983: SUBcc_R	subcc 	%r19, %r0, %r31
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_83:
	mov	0x3c3, %r14
	.word 0xf4f38e60  ! 1986: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T3_asi_reg_rd_98:
	mov	0x35, %r14
	.word 0xf0db84a0  ! 1988: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T3_asi_reg_wr_84:
	mov	0x35, %r14
	.word 0xf2f38e60  ! 1989: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf0f4602c  ! 1990: STXA_I	stxa	%r24, [%r17 + 0x002c] %asi
	.word 0xba3d2145  ! 1992: XNOR_I	xnor 	%r20, 0x0145, %r29
cpu_intr_3_153:
	setx	0x2f022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4748000  ! 1995: STX_R	stx	%r26, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_154:
	setx	0x2f0019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb68d21b4  ! 2004: ANDcc_I	andcc 	%r20, 0x01b4, %r27
cpu_intr_3_155:
	setx	0x2d010e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_99:
	mov	0x1c, %r14
	.word 0xf8db8400  ! 2006: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xf42c0000  ! 2012: STB_R	stb	%r26, [%r16 + %r0]
	.word 0xfa740000  ! 2015: STX_R	stx	%r29, [%r16 + %r0]
	.word 0xb21de06e  ! 2016: XOR_I	xor 	%r23, 0x006e, %r25
	.word 0xfa2dc000  ! 2018: STB_R	stb	%r29, [%r23 + %r0]
	.word 0xfa75a073  ! 2020: STX_I	stx	%r29, [%r22 + 0x0073]
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983fd2  ! 2021: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fd2, %hpstate
cpu_intr_3_156:
	setx	0x2c0337, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_157:
	setx	0x2e0105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab40020  ! 2025: STHA_R	stha	%r29, [%r16 + %r0] 0x01
T3_asi_reg_rd_100:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 2028: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_101:
	mov	0x21, %r14
	.word 0xfedb8e40  ! 2034: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xf4744000  ! 2038: STX_R	stx	%r26, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
cpu_intr_3_158:
	setx	0x2f032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_159:
	setx	0x2e021d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_102:
	mov	0x32, %r14
	.word 0xf2db89e0  ! 2049: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T3_asi_reg_wr_85:
	mov	0x1e, %r14
	.word 0xfef38e80  ! 2050: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL0
	setx	data_start_1, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983c12  ! 2053: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c12, %hpstate
T3_asi_reg_wr_86:
	mov	0x18, %r14
	.word 0xf4f38e80  ! 2054: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_3_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_158), 16, 16)) -> intp(3, 0, 35)
	.word 0xb6440000  ! 2057: ADDC_R	addc 	%r16, %r0, %r27
cpu_intr_3_160:
	setx	0x2e0023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca5a126  ! 2059: STWA_I	stwa	%r30, [%r22 + 0x0126] %asi
	.word 0xfe2d208b  ! 2060: STB_I	stb	%r31, [%r20 + 0x008b]
iob_intr_3_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_159), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_wr_87:
	mov	0x16, %r14
	.word 0xf0f38400  ! 2067: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983a18  ! 2068: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a18, %hpstate
T3_asi_reg_wr_88:
	mov	0x19, %r14
	.word 0xfcf38e80  ! 2070: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_3_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_160), 16, 16)) -> intp(3, 0, 3)
iob_intr_3_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_161), 16, 16)) -> intp(3, 0, 32)
T3_asi_reg_wr_89:
	mov	0xb, %r14
	.word 0xfcf38400  ! 2075: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0x8594e021  ! 2077: WRPR_TSTATE_I	wrpr	%r19, 0x0021, %tstate
cpu_intr_3_161:
	setx	0x2e0219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f420c2  ! 2083: STXA_I	stxa	%r25, [%r16 + 0x00c2] %asi
iob_intr_3_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_162), 16, 16)) -> intp(3, 0, 1c)
iob_intr_3_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_163), 16, 16)) -> intp(3, 0, 2)
	.word 0xf62dc000  ! 2092: STB_R	stb	%r27, [%r23 + %r0]
T3_asi_reg_rd_103:
	mov	0x3c4, %r14
	.word 0xfadb84a0  ! 2093: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_3_162:
	setx	0x2f021f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_104:
	mov	0x3c4, %r14
	.word 0xfcdb8e60  ! 2095: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_3_163:
	setx	0x2c020d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_164:
	setx	0x2f033a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_165:
	setx	0x2c0036, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_90:
	mov	0x17, %r14
	.word 0xf2f38e40  ! 2100: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_wr_91:
	mov	0x3c0, %r14
	.word 0xfaf384a0  ! 2102: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_3_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_164), 16, 16)) -> intp(3, 0, 14)
	ta	T_CHANGE_TO_TL0
	.word 0xf03461d4  ! 2113: STH_I	sth	%r24, [%r17 + 0x01d4]
	.word 0xfe750000  ! 2114: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xf2344000  ! 2116: STH_R	sth	%r25, [%r17 + %r0]
cpu_intr_3_166:
	setx	0x2f0334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc24e0cf  ! 2121: STW_I	stw	%r30, [%r19 + 0x00cf]
cpu_intr_3_167:
	setx	0x2c0214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a44020  ! 2128: STWA_R	stwa	%r28, [%r17 + %r0] 0x01
	.word 0xf6ac6119  ! 2130: STBA_I	stba	%r27, [%r17 + 0x0119] %asi
	.word 0xfc748000  ! 2131: STX_R	stx	%r30, [%r18 + %r0]
cpu_intr_3_168:
	setx	0x2f0315, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_165), 16, 16)) -> intp(3, 0, 24)
cpu_intr_3_169:
	setx	0x2d0302, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_166), 16, 16)) -> intp(3, 0, 1)
iob_intr_3_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_167), 16, 16)) -> intp(3, 0, 0)
cpu_intr_3_170:
	setx	0x2d001c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_171:
	setx	0x2f0133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaac4020  ! 2148: STBA_R	stba	%r29, [%r17 + %r0] 0x01
iob_intr_3_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_168), 16, 16)) -> intp(3, 0, 19)
cpu_intr_3_172:
	setx	0x2c0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a5215c  ! 2152: STWA_I	stwa	%r27, [%r20 + 0x015c] %asi
T3_asi_reg_rd_105:
	mov	0x3c0, %r14
	.word 0xf6db89e0  ! 2153: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T3_asi_reg_wr_92:
	mov	0x1c, %r14
	.word 0xf8f384a0  ! 2158: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xfa25a09d  ! 2161: STW_I	stw	%r29, [%r22 + 0x009d]
	.word 0xb805c000  ! 2170: ADD_R	add 	%r23, %r0, %r28
iob_intr_3_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_169), 16, 16)) -> intp(3, 0, 3f)
cpu_intr_3_173:
	setx	0x2e0028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc850000  ! 2182: ADDcc_R	addcc 	%r20, %r0, %r30
	.word 0xf6350000  ! 2183: STH_R	sth	%r27, [%r20 + %r0]
iob_intr_3_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_170), 16, 16)) -> intp(3, 0, 1f)
iob_intr_3_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_171), 16, 16)) -> intp(3, 0, 35)
	.word 0xfab560da  ! 2192: STHA_I	stha	%r29, [%r21 + 0x00da] %asi
	.word 0xfca58020  ! 2193: STWA_R	stwa	%r30, [%r22 + %r0] 0x01
T3_asi_reg_rd_106:
	mov	0x6, %r14
	.word 0xf2db8e40  ! 2198: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_3_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_172), 16, 16)) -> intp(3, 0, 3b)
cpu_intr_3_174:
	setx	0x2e021e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_93:
	mov	0x3c8, %r14
	.word 0xfef38e60  ! 2205: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb5480000  ! 2208: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
T3_asi_reg_rd_107:
	mov	0x1, %r14
	.word 0xfedb8e60  ! 2210: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_3_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_173), 16, 16)) -> intp(3, 0, 2e)
iob_intr_3_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_174), 16, 16)) -> intp(3, 0, 3d)
cpu_intr_3_175:
	setx	0x2c0233, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_94:
	mov	0x4, %r14
	.word 0xfcf38e80  ! 2222: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbaaca154  ! 2224: ANDNcc_I	andncc 	%r18, 0x0154, %r29
	.word 0xfe34c000  ! 2225: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xf67461ca  ! 2228: STX_I	stx	%r27, [%r17 + 0x01ca]
iob_intr_3_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_175), 16, 16)) -> intp(3, 0, c)
	.word 0xf0b5c020  ! 2233: STHA_R	stha	%r24, [%r23 + %r0] 0x01
	.word 0xfca521b5  ! 2234: STWA_I	stwa	%r30, [%r20 + 0x01b5] %asi
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982d42  ! 2235: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d42, %hpstate
	.word 0xf2f5e0bb  ! 2237: STXA_I	stxa	%r25, [%r23 + 0x00bb] %asi
	.word 0xb2c54000  ! 2238: ADDCcc_R	addccc 	%r21, %r0, %r25
	.word 0xf0b50020  ! 2242: STHA_R	stha	%r24, [%r20 + %r0] 0x01
	.word 0xb2b4c000  ! 2244: ORNcc_R	orncc 	%r19, %r0, %r25
	.word 0xfe35e085  ! 2247: STH_I	sth	%r31, [%r23 + 0x0085]
	.word 0xf835205e  ! 2248: STH_I	sth	%r28, [%r20 + 0x005e]
	.word 0xfaac6088  ! 2250: STBA_I	stba	%r29, [%r17 + 0x0088] %asi
iob_intr_3_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_176), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_rd_108:
	mov	0x37, %r14
	.word 0xf2db8e40  ! 2256: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb834a0fe  ! 2261: SUBC_I	orn 	%r18, 0x00fe, %r28
	.word 0xfca5e0cd  ! 2262: STWA_I	stwa	%r30, [%r23 + 0x00cd] %asi
	.word 0xbc24613e  ! 2265: SUB_I	sub 	%r17, 0x013e, %r30
	.word 0xb17c6401  ! 2266: MOVR_I	movre	%r17, 0x1, %r24
iob_intr_3_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_177), 16, 16)) -> intp(3, 0, 1c)
	.word 0x8394a08a  ! 2270: WRPR_TNPC_I	wrpr	%r18, 0x008a, %tnpc
iob_intr_3_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_178), 16, 16)) -> intp(3, 0, 20)
T3_asi_reg_wr_95:
	mov	0x3c0, %r14
	.word 0xfaf384a0  ! 2275: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf234a0af  ! 2281: STH_I	sth	%r25, [%r18 + 0x00af]
T3_asi_reg_rd_109:
	mov	0x27, %r14
	.word 0xf0db8e40  ! 2284: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb8b54000  ! 2285: ORNcc_R	orncc 	%r21, %r0, %r28
	.word 0xf6ad0020  ! 2286: STBA_R	stba	%r27, [%r20 + %r0] 0x01
	.word 0xf825c000  ! 2287: STW_R	stw	%r28, [%r23 + %r0]
	.word 0xf4750000  ! 2289: STX_R	stx	%r26, [%r20 + %r0]
T3_asi_reg_rd_110:
	mov	0xa, %r14
	.word 0xf4db8e80  ! 2290: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2744000  ! 2293: STX_R	stx	%r25, [%r17 + %r0]
iob_intr_3_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_179), 16, 16)) -> intp(3, 0, 11)
	.word 0xf02de038  ! 2297: STB_I	stb	%r24, [%r23 + 0x0038]
	.word 0xb63521e9  ! 2302: SUBC_I	orn 	%r20, 0x01e9, %r27
	.word 0xf6f4e001  ! 2305: STXA_I	stxa	%r27, [%r19 + 0x0001] %asi
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_TO_TL0
	.word 0xfc740000  ! 2314: STX_R	stx	%r30, [%r16 + %r0]
iob_intr_3_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_180), 16, 16)) -> intp(3, 0, 2d)
	.word 0xbf3cf001  ! 2319: SRAX_I	srax	%r19, 0x0001, %r31
	.word 0xfea5c020  ! 2322: STWA_R	stwa	%r31, [%r23 + %r0] 0x01
	.word 0xb2940000  ! 2323: ORcc_R	orcc 	%r16, %r0, %r25
	.word 0xf8b4e174  ! 2324: STHA_I	stha	%r28, [%r19 + 0x0174] %asi
cpu_intr_3_176:
	setx	0x320118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf674a0eb  ! 2327: STX_I	stx	%r27, [%r18 + 0x00eb]
	.word 0xf6a44020  ! 2331: STWA_R	stwa	%r27, [%r17 + %r0] 0x01
	.word 0xf2a4e0a7  ! 2334: STWA_I	stwa	%r25, [%r19 + 0x00a7] %asi
	.word 0xb034a135  ! 2335: SUBC_I	orn 	%r18, 0x0135, %r24
T3_asi_reg_wr_96:
	mov	0x2e, %r14
	.word 0xf4f38e80  ! 2336: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xfea521b7  ! 2337: STWA_I	stwa	%r31, [%r20 + 0x01b7] %asi
iob_intr_3_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_181), 16, 16)) -> intp(3, 0, 3)
	ta	T_CHANGE_NONHPRIV
iob_intr_3_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_182), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf0ade1d7  ! 2347: STBA_I	stba	%r24, [%r23 + 0x01d7] %asi
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_111:
	mov	0x4, %r14
	.word 0xf8db8e60  ! 2350: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb0a50000  ! 2352: SUBcc_R	subcc 	%r20, %r0, %r24
	.word 0xb014203d  ! 2353: OR_I	or 	%r16, 0x003d, %r24
	.word 0xb6344000  ! 2355: ORN_R	orn 	%r17, %r0, %r27
cpu_intr_3_177:
	setx	0x31003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xfead8020  ! 2358: STBA_R	stba	%r31, [%r22 + %r0] 0x01
	.word 0xfca44020  ! 2359: STWA_R	stwa	%r30, [%r17 + %r0] 0x01
	.word 0xf6a54020  ! 2360: STWA_R	stwa	%r27, [%r21 + %r0] 0x01
T3_asi_reg_wr_97:
	mov	0x26, %r14
	.word 0xfef384a0  ! 2361: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf435e1a6  ! 2368: STH_I	sth	%r26, [%r23 + 0x01a6]
	.word 0xf6256163  ! 2370: STW_I	stw	%r27, [%r21 + 0x0163]
T3_asi_reg_rd_112:
	mov	0x13, %r14
	.word 0xf4db8e40  ! 2371: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_183), 16, 16)) -> intp(3, 0, 16)
T3_asi_reg_rd_113:
	mov	0xd, %r14
	.word 0xf4db8e80  ! 2373: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T3_asi_reg_wr_98:
	mov	0x11, %r14
	.word 0xfef389e0  ! 2374: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf0b44020  ! 2375: STHA_R	stha	%r24, [%r17 + %r0] 0x01
cpu_intr_3_178:
	setx	0x31003c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_179:
	setx	0x33022c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_180:
	setx	0x30000d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_114:
	mov	0x3c0, %r14
	.word 0xfcdb89e0  ! 2384: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_3_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_184), 16, 16)) -> intp(3, 0, 18)
T3_asi_reg_wr_99:
	mov	0x8, %r14
	.word 0xf4f384a0  ! 2389: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xfc346048  ! 2395: STH_I	sth	%r30, [%r17 + 0x0048]
	.word 0xf82d6194  ! 2396: STB_I	stb	%r28, [%r21 + 0x0194]
cpu_intr_3_181:
	setx	0x330011, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_100:
	mov	0x3c5, %r14
	.word 0xfaf38400  ! 2400: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T3_asi_reg_rd_115:
	mov	0x3c4, %r14
	.word 0xfcdb8400  ! 2401: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_3_182:
	setx	0x33030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x8198294a  ! 2404: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094a, %hpstate
cpu_intr_3_183:
	setx	0x310201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2d60ef  ! 2406: STB_I	stb	%r29, [%r21 + 0x00ef]
	.word 0xf2b560c3  ! 2408: STHA_I	stha	%r25, [%r21 + 0x00c3] %asi
cpu_intr_3_184:
	setx	0x33002b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_185), 16, 16)) -> intp(3, 0, 21)
	.word 0xf835e1c9  ! 2415: STH_I	sth	%r28, [%r23 + 0x01c9]
	.word 0xf4f5a11a  ! 2417: STXA_I	stxa	%r26, [%r22 + 0x011a] %asi
T3_asi_reg_rd_116:
	mov	0x7, %r14
	.word 0xf6db89e0  ! 2418: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_101:
	mov	0xf, %r14
	.word 0xf4f38e40  ! 2420: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_3_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_186), 16, 16)) -> intp(3, 0, 2a)
iob_intr_3_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_187), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf2f5a113  ! 2423: STXA_I	stxa	%r25, [%r22 + 0x0113] %asi
iob_intr_3_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_188), 16, 16)) -> intp(3, 0, 2f)
	.word 0xb2158000  ! 2427: OR_R	or 	%r22, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_189), 16, 16)) -> intp(3, 0, 11)
	.word 0xfc354000  ! 2431: STH_R	sth	%r30, [%r21 + %r0]
iob_intr_3_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_190), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf8ac21b4  ! 2437: STBA_I	stba	%r28, [%r16 + 0x01b4] %asi
	.word 0xfcf4a1ba  ! 2438: STXA_I	stxa	%r30, [%r18 + 0x01ba] %asi
iob_intr_3_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_191), 16, 16)) -> intp(3, 0, 11)
iob_intr_3_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_192), 16, 16)) -> intp(3, 0, 3)
	.word 0xfea54020  ! 2445: STWA_R	stwa	%r31, [%r21 + %r0] 0x01
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_117:
	mov	0x14, %r14
	.word 0xf6db8400  ! 2449: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_3_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_193), 16, 16)) -> intp(3, 0, 15)
T3_asi_reg_rd_118:
	mov	0x24, %r14
	.word 0xf0db8e40  ! 2452: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_3_185:
	setx	0x330221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ac4020  ! 2457: STBA_R	stba	%r25, [%r17 + %r0] 0x01
	.word 0xb4950000  ! 2459: ORcc_R	orcc 	%r20, %r0, %r26
T3_asi_reg_wr_102:
	mov	0x3c0, %r14
	.word 0xf4f38e80  ! 2460: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_3_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_194), 16, 16)) -> intp(3, 0, 2f)
	.word 0xfaf520c8  ! 2472: STXA_I	stxa	%r29, [%r20 + 0x00c8] %asi
	ta	T_CHANGE_NONHPRIV
iob_intr_3_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_195), 16, 16)) -> intp(3, 0, 17)
iob_intr_3_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_196), 16, 16)) -> intp(3, 0, 31)
	ta	T_CHANGE_TO_TL1
	.word 0xfea54020  ! 2482: STWA_R	stwa	%r31, [%r21 + %r0] 0x01
cpu_intr_3_186:
	setx	0x30013e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_187:
	setx	0x33013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa74205c  ! 2486: STX_I	stx	%r29, [%r16 + 0x005c]
cpu_intr_3_188:
	setx	0x30030d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_197), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_rd_119:
	mov	0x18, %r14
	.word 0xfcdb8e40  ! 2492: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_rd_120:
	mov	0x3c7, %r14
	.word 0xfcdb8e40  ! 2493: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf2354000  ! 2497: STH_R	sth	%r25, [%r21 + %r0]
T3_asi_reg_wr_103:
	mov	0xb, %r14
	.word 0xfcf389e0  ! 2498: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_3_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_198), 16, 16)) -> intp(3, 0, 32)
T3_asi_reg_wr_104:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 2504: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfe758000  ! 2507: STX_R	stx	%r31, [%r22 + %r0]
	.word 0xb41d21ba  ! 2508: XOR_I	xor 	%r20, 0x01ba, %r26
T3_asi_reg_wr_105:
	mov	0x36, %r14
	.word 0xf6f384a0  ! 2510: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xfeac8020  ! 2513: STBA_R	stba	%r31, [%r18 + %r0] 0x01
	.word 0xfab56041  ! 2514: STHA_I	stha	%r29, [%r21 + 0x0041] %asi
	.word 0xb0358000  ! 2515: ORN_R	orn 	%r22, %r0, %r24
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982b82  ! 2522: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b82, %hpstate
	.word 0xfeb46034  ! 2523: STHA_I	stha	%r31, [%r17 + 0x0034] %asi
	.word 0xf4ada1a5  ! 2525: STBA_I	stba	%r26, [%r22 + 0x01a5] %asi
T3_asi_reg_rd_121:
	mov	0x6, %r14
	.word 0xf0db8e40  ! 2526: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb0c5c000  ! 2527: ADDCcc_R	addccc 	%r23, %r0, %r24
T3_asi_reg_rd_122:
	mov	0x3c6, %r14
	.word 0xf2db8e40  ! 2529: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_3_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_199), 16, 16)) -> intp(3, 0, 7)
	.word 0xb2b4200a  ! 2531: ORNcc_I	orncc 	%r16, 0x000a, %r25
	.word 0xf6ac4020  ! 2532: STBA_R	stba	%r27, [%r17 + %r0] 0x01
	ta	T_CHANGE_HPRIV
cpu_intr_3_189:
	setx	0x330211, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_190:
	setx	0x31002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb42d8000  ! 2539: ANDN_R	andn 	%r22, %r0, %r26
	.word 0xf2a58020  ! 2544: STWA_R	stwa	%r25, [%r22 + %r0] 0x01
	.word 0xf8ad8020  ! 2548: STBA_R	stba	%r28, [%r22 + %r0] 0x01
	.word 0xf6258000  ! 2549: STW_R	stw	%r27, [%r22 + %r0]
iob_intr_3_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_200), 16, 16)) -> intp(3, 0, 14)
	.word 0xf6740000  ! 2556: STX_R	stx	%r27, [%r16 + %r0]
cpu_intr_3_191:
	setx	0x30030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf074e16b  ! 2559: STX_I	stx	%r24, [%r19 + 0x016b]
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_106:
	mov	0x15, %r14
	.word 0xf0f384a0  ! 2563: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_3_192:
	setx	0x310233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_193:
	setx	0x300319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02d0000  ! 2567: STB_R	stb	%r24, [%r20 + %r0]
T3_asi_reg_rd_123:
	mov	0x3c0, %r14
	.word 0xf0db8e60  ! 2568: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_3_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_201), 16, 16)) -> intp(3, 0, 23)
	.word 0xf8aca1f9  ! 2570: STBA_I	stba	%r28, [%r18 + 0x01f9] %asi
	.word 0xf4b461d0  ! 2577: STHA_I	stha	%r26, [%r17 + 0x01d0] %asi
	.word 0xfcb460e9  ! 2578: STHA_I	stha	%r30, [%r17 + 0x00e9] %asi
T3_asi_reg_rd_124:
	mov	0x2a, %r14
	.word 0xf8db89e0  ! 2582: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_3_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_202), 16, 16)) -> intp(3, 0, 30)
iob_intr_3_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_203), 16, 16)) -> intp(3, 0, 2f)
	ta	T_CHANGE_TO_TL0
cpu_intr_3_194:
	setx	0x300112, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_195:
	setx	0x310219, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_196:
	setx	0x31013c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_197:
	setx	0x300019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc75c000  ! 2599: STX_R	stx	%r30, [%r23 + %r0]
T3_asi_reg_rd_125:
	mov	0x31, %r14
	.word 0xfedb8e40  ! 2601: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_rd_126:
	mov	0x6, %r14
	.word 0xf6db8400  ! 2602: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_127:
	mov	0x8, %r14
	.word 0xf6db8400  ! 2606: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf6a4e1c6  ! 2607: STWA_I	stwa	%r27, [%r19 + 0x01c6] %asi
cpu_intr_3_198:
	setx	0x31003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf434a1c3  ! 2611: STH_I	sth	%r26, [%r18 + 0x01c3]
	.word 0xfea5c020  ! 2613: STWA_R	stwa	%r31, [%r23 + %r0] 0x01
T3_asi_reg_rd_128:
	mov	0x3c2, %r14
	.word 0xfadb8400  ! 2614: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_3_199:
	setx	0x320235, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_204), 16, 16)) -> intp(3, 0, 11)
	.word 0xb135f001  ! 2617: SRLX_I	srlx	%r23, 0x0001, %r24
iob_intr_3_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_205), 16, 16)) -> intp(3, 0, 1d)
	.word 0xf074c000  ! 2622: STX_R	stx	%r24, [%r19 + %r0]
	.word 0xb52c8000  ! 2623: SLL_R	sll 	%r18, %r0, %r26
	.word 0xf434c000  ! 2625: STH_R	sth	%r26, [%r19 + %r0]
	.word 0xf274c000  ! 2626: STX_R	stx	%r25, [%r19 + %r0]
	.word 0xf4744000  ! 2628: STX_R	stx	%r26, [%r17 + %r0]
T3_asi_reg_rd_129:
	mov	0x2d, %r14
	.word 0xf8db8400  ! 2629: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_3_200:
	setx	0x32012a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_201:
	setx	0x30020c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_202:
	setx	0x32023f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_206), 16, 16)) -> intp(3, 0, 13)
T3_asi_reg_rd_130:
	mov	0xa, %r14
	.word 0xfcdb84a0  ! 2636: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	ta	T_CHANGE_TO_TL0
iob_intr_3_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_207), 16, 16)) -> intp(3, 0, 32)
	.word 0xfeb5e1c9  ! 2642: STHA_I	stha	%r31, [%r23 + 0x01c9] %asi
cpu_intr_3_203:
	setx	0x310137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe35a0d1  ! 2645: STH_I	sth	%r31, [%r22 + 0x00d1]
	.word 0xf8350000  ! 2649: STH_R	sth	%r28, [%r20 + %r0]
cpu_intr_3_204:
	setx	0x300033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b4e048  ! 2652: ORNcc_I	orncc 	%r19, 0x0048, %r25
	.word 0xfea4e073  ! 2656: STWA_I	stwa	%r31, [%r19 + 0x0073] %asi
T3_asi_reg_wr_107:
	mov	0x7, %r14
	.word 0xf4f384a0  ! 2657: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf0b46003  ! 2658: STHA_I	stha	%r24, [%r17 + 0x0003] %asi
T3_asi_reg_rd_131:
	mov	0x3c0, %r14
	.word 0xf2db8400  ! 2660: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_3_205:
	setx	0x31032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_208), 16, 16)) -> intp(3, 0, 19)
T3_asi_reg_rd_132:
	mov	0x4, %r14
	.word 0xf4db84a0  ! 2669: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xfea5c020  ! 2670: STWA_R	stwa	%r31, [%r23 + %r0] 0x01
iob_intr_3_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_209), 16, 16)) -> intp(3, 0, 20)
iob_intr_3_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_210), 16, 16)) -> intp(3, 0, 16)
	.word 0xf0358000  ! 2679: STH_R	sth	%r24, [%r22 + %r0]
cpu_intr_3_206:
	setx	0x330004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcacc020  ! 2681: STBA_R	stba	%r30, [%r19 + %r0] 0x01
	.word 0xf82561d2  ! 2682: STW_I	stw	%r28, [%r21 + 0x01d2]
	.word 0xb69d4000  ! 2683: XORcc_R	xorcc 	%r21, %r0, %r27
	.word 0xf8f520c4  ! 2684: STXA_I	stxa	%r28, [%r20 + 0x00c4] %asi
cpu_intr_3_207:
	setx	0x33011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f460d4  ! 2693: STXA_I	stxa	%r25, [%r17 + 0x00d4] %asi
cpu_intr_3_208:
	setx	0x320306, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_133:
	mov	0x14, %r14
	.word 0xf0db8400  ! 2695: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_3_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_211), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_212), 16, 16)) -> intp(3, 0, 2)
	.word 0xf4248000  ! 2701: STW_R	stw	%r26, [%r18 + %r0]
cpu_intr_3_209:
	setx	0x33021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc35a1ff  ! 2706: STH_I	sth	%r30, [%r22 + 0x01ff]
	.word 0xf4b560ab  ! 2707: STHA_I	stha	%r26, [%r21 + 0x00ab] %asi
iob_intr_3_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_213), 16, 16)) -> intp(3, 0, 26)
iob_intr_3_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_214), 16, 16)) -> intp(3, 0, 38)
cpu_intr_3_210:
	setx	0x33022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a48020  ! 2713: STWA_R	stwa	%r27, [%r18 + %r0] 0x01
iob_intr_3_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_215), 16, 16)) -> intp(3, 0, 36)
cpu_intr_3_211:
	setx	0x320016, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_216), 16, 16)) -> intp(3, 0, 35)
	.word 0xfa25c000  ! 2722: STW_R	stw	%r29, [%r23 + %r0]
	.word 0xbc956079  ! 2723: ORcc_I	orcc 	%r21, 0x0079, %r30
T3_asi_reg_rd_134:
	mov	0x3c2, %r14
	.word 0xfedb8e40  ! 2725: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_rd_135:
	mov	0x2d, %r14
	.word 0xf2db8e40  ! 2727: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_3_212:
	setx	0x32021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb29ce12d  ! 2733: XORcc_I	xorcc 	%r19, 0x012d, %r25
cpu_intr_3_213:
	setx	0x300301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0f4e085  ! 2737: STXA_I	stxa	%r24, [%r19 + 0x0085] %asi
iob_intr_3_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_217), 16, 16)) -> intp(3, 0, 23)
cpu_intr_3_214:
	setx	0x320131, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_108:
	mov	0x3c0, %r14
	.word 0xf0f389e0  ! 2741: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_3_215:
	setx	0x37031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_218), 16, 16)) -> intp(3, 0, 2)
	.word 0xfc34208f  ! 2748: STH_I	sth	%r30, [%r16 + 0x008f]
	ta	T_CHANGE_TO_TL0
iob_intr_3_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_219), 16, 16)) -> intp(3, 0, 6)
	.word 0xb9508000  ! 2753: RDPR_TSTATE	rdpr	%tstate, %r28
	ta	T_CHANGE_NONHPRIV
	.word 0xf0a44020  ! 2757: STWA_R	stwa	%r24, [%r17 + %r0] 0x01
	.word 0xfeacc020  ! 2759: STBA_R	stba	%r31, [%r19 + %r0] 0x01
T3_asi_reg_wr_109:
	mov	0x27, %r14
	.word 0xf8f38400  ! 2760: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_3_216:
	setx	0x34003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2348000  ! 2762: STH_R	sth	%r25, [%r18 + %r0]
T3_asi_reg_rd_136:
	mov	0x26, %r14
	.word 0xf2db8400  ! 2763: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_3_217:
	setx	0x360229, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfca4c020  ! 2770: STWA_R	stwa	%r30, [%r19 + %r0] 0x01
T3_asi_reg_rd_137:
	mov	0x2b, %r14
	.word 0xf2db8e80  ! 2774: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf2f5e11a  ! 2775: STXA_I	stxa	%r25, [%r23 + 0x011a] %asi
	.word 0xf034a061  ! 2776: STH_I	sth	%r24, [%r18 + 0x0061]
T3_asi_reg_wr_110:
	mov	0x3c2, %r14
	.word 0xf4f384a0  ! 2778: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf4254000  ! 2779: STW_R	stw	%r26, [%r21 + %r0]
	.word 0xf624203d  ! 2781: STW_I	stw	%r27, [%r16 + 0x003d]
	.word 0xf2b5c020  ! 2785: STHA_R	stha	%r25, [%r23 + %r0] 0x01
	.word 0xf42c61af  ! 2786: STB_I	stb	%r26, [%r17 + 0x01af]
cpu_intr_3_218:
	setx	0x350200, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_220), 16, 16)) -> intp(3, 0, 1)
	.word 0xbb643801  ! 2798: MOVcc_I	<illegal instruction>
cpu_intr_3_219:
	setx	0x35022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4754000  ! 2804: STX_R	stx	%r26, [%r21 + %r0]
	ta	T_CHANGE_NONHPRIV
	.word 0xfa750000  ! 2807: STX_R	stx	%r29, [%r20 + %r0]
	.word 0xfc75a054  ! 2809: STX_I	stx	%r30, [%r22 + 0x0054]
	.word 0xfef5207b  ! 2811: STXA_I	stxa	%r31, [%r20 + 0x007b] %asi
cpu_intr_3_220:
	setx	0x340314, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf22ca1e5  ! 2815: STB_I	stb	%r25, [%r18 + 0x01e5]
	ta	T_CHANGE_NONHPRIV
	.word 0xb23d4000  ! 2820: XNOR_R	xnor 	%r21, %r0, %r25
	.word 0xfe7461f0  ! 2821: STX_I	stx	%r31, [%r17 + 0x01f0]
iob_intr_3_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_221), 16, 16)) -> intp(3, 0, 1c)
iob_intr_3_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_222), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_wr_111:
	mov	0x24, %r14
	.word 0xf6f38e40  ! 2825: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf0a44020  ! 2826: STWA_R	stwa	%r24, [%r17 + %r0] 0x01
	.word 0xb435c000  ! 2828: ORN_R	orn 	%r23, %r0, %r26
iob_intr_3_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_223), 16, 16)) -> intp(3, 0, 3e)
	.word 0xb92d7001  ! 2830: SLLX_I	sllx	%r21, 0x0001, %r28
	.word 0xbf2d5000  ! 2832: SLLX_R	sllx	%r21, %r0, %r31
	.word 0xfca461c6  ! 2833: STWA_I	stwa	%r30, [%r17 + 0x01c6] %asi
	.word 0xf6ad0020  ! 2834: STBA_R	stba	%r27, [%r20 + %r0] 0x01
T3_asi_reg_rd_138:
	mov	0x3c8, %r14
	.word 0xf6db89e0  ! 2835: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	ta	T_CHANGE_HPRIV
cpu_intr_3_221:
	setx	0x34031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa744000  ! 2840: STX_R	stx	%r29, [%r17 + %r0]
T3_asi_reg_wr_112:
	mov	0x34, %r14
	.word 0xfaf38e60  ! 2841: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T3_asi_reg_wr_113:
	mov	0x3c0, %r14
	.word 0xfcf38e80  ! 2843: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbd3c4000  ! 2846: SRA_R	sra 	%r17, %r0, %r30
cpu_intr_3_222:
	setx	0x34030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_223:
	setx	0x340236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a561b7  ! 2856: STWA_I	stwa	%r27, [%r21 + 0x01b7] %asi
cpu_intr_3_224:
	setx	0x35032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_114:
	mov	0x30, %r14
	.word 0xf6f38400  ! 2859: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T3_asi_reg_wr_115:
	mov	0x15, %r14
	.word 0xfef38e40  ! 2860: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_3_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_224), 16, 16)) -> intp(3, 0, 9)
	.word 0xf6b4e030  ! 2864: STHA_I	stha	%r27, [%r19 + 0x0030] %asi
cpu_intr_3_225:
	setx	0x360031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2ca0bf  ! 2866: STB_I	stb	%r30, [%r18 + 0x00bf]
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983982  ! 2868: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1982, %hpstate
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_139:
	mov	0x27, %r14
	.word 0xf6db89e0  ! 2873: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_3_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_225), 16, 16)) -> intp(3, 0, 26)
	.word 0xf2ad4020  ! 2875: STBA_R	stba	%r25, [%r21 + %r0] 0x01
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982c18  ! 2876: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c18, %hpstate
T3_asi_reg_rd_140:
	mov	0x33, %r14
	.word 0xf4db8e80  ! 2877: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	ta	T_CHANGE_NONHPRIV
	.word 0xf8250000  ! 2880: STW_R	stw	%r28, [%r20 + %r0]
T3_asi_reg_wr_116:
	mov	0x3c5, %r14
	.word 0xfef38400  ! 2881: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_3_226:
	setx	0x34011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf424e062  ! 2884: STW_I	stw	%r26, [%r19 + 0x0062]
	.word 0xf0244000  ! 2888: STW_R	stw	%r24, [%r17 + %r0]
iob_intr_3_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_226), 16, 16)) -> intp(3, 0, 2f)
iob_intr_3_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_227), 16, 16)) -> intp(3, 0, 12)
	.word 0xfa2420c8  ! 2893: STW_I	stw	%r29, [%r16 + 0x00c8]
iob_intr_3_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_228), 16, 16)) -> intp(3, 0, 3c)
iob_intr_3_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_229), 16, 16)) -> intp(3, 0, 1)
cpu_intr_3_227:
	setx	0x37011b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_141:
	mov	0x3c5, %r14
	.word 0xf0db8400  ! 2900: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xfc2d610c  ! 2902: STB_I	stb	%r30, [%r21 + 0x010c]
T3_asi_reg_rd_142:
	mov	0x24, %r14
	.word 0xf4db8e60  ! 2905: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T3_asi_reg_rd_143:
	mov	0x3c7, %r14
	.word 0xf4db8400  ! 2906: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb12d8000  ! 2909: SLL_R	sll 	%r22, %r0, %r24
iob_intr_3_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_230), 16, 16)) -> intp(3, 0, 28)
	ta	T_CHANGE_HPRIV
	.word 0xf4a56075  ! 2913: STWA_I	stwa	%r26, [%r21 + 0x0075] %asi
iob_intr_3_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_231), 16, 16)) -> intp(3, 0, 7)
iob_intr_3_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_232), 16, 16)) -> intp(3, 0, 16)
	.word 0xfa742077  ! 2920: STX_I	stx	%r29, [%r16 + 0x0077]
	.word 0xfe75e050  ! 2921: STX_I	stx	%r31, [%r23 + 0x0050]
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL0
iob_intr_3_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_233), 16, 16)) -> intp(3, 0, 3a)
iob_intr_3_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_234), 16, 16)) -> intp(3, 0, 16)
	.word 0xfaacc020  ! 2934: STBA_R	stba	%r29, [%r19 + %r0] 0x01
T3_asi_reg_rd_144:
	mov	0x3c4, %r14
	.word 0xf8db8e80  ! 2945: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_3_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_235), 16, 16)) -> intp(3, 0, 16)
cpu_intr_3_228:
	setx	0x350202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ad20c0  ! 2950: STBA_I	stba	%r28, [%r20 + 0x00c0] %asi
iob_intr_3_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_236), 16, 16)) -> intp(3, 0, 9)
cpu_intr_3_229:
	setx	0x35002f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_145:
	mov	0x11, %r14
	.word 0xf4db89e0  ! 2954: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	ta	T_CHANGE_TO_TL0
iob_intr_3_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_237), 16, 16)) -> intp(3, 0, 3b)
iob_intr_3_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_238), 16, 16)) -> intp(3, 0, 30)
	.word 0xf22d0000  ! 2963: STB_R	stb	%r25, [%r20 + %r0]
iob_intr_3_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_239), 16, 16)) -> intp(3, 0, e)
	.word 0xf274e0b7  ! 2971: STX_I	stx	%r25, [%r19 + 0x00b7]
	.word 0xb22c4000  ! 2972: ANDN_R	andn 	%r17, %r0, %r25
	.word 0xb1344000  ! 2975: SRL_R	srl 	%r17, %r0, %r24
cpu_intr_3_230:
	setx	0x370012, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_117:
	mov	0x2a, %r14
	.word 0xf8f38e40  ! 2981: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_3_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_240), 16, 16)) -> intp(3, 0, 32)
T3_asi_reg_rd_146:
	mov	0x16, %r14
	.word 0xfedb8400  ! 2987: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_3_231:
	setx	0x36013b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_147:
	mov	0x1e, %r14
	.word 0xf2db8e60  ! 2990: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T3_asi_reg_wr_118:
	mov	0x3c2, %r14
	.word 0xf6f38e40  ! 2991: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfa2c4000  ! 2994: STB_R	stb	%r29, [%r17 + %r0]
cpu_intr_3_232:
	setx	0x360129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_233:
	setx	0x370232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf834e1fe  ! 3000: STH_I	sth	%r28, [%r19 + 0x01fe]
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982912  ! 3008: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0912, %hpstate
	.word 0xf8ad605c  ! 3009: STBA_I	stba	%r28, [%r21 + 0x005c] %asi
cpu_intr_3_234:
	setx	0x360226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_235:
	setx	0x36012b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_241), 16, 16)) -> intp(3, 0, c)
	.word 0xf275e005  ! 3018: STX_I	stx	%r25, [%r23 + 0x0005]
	.word 0xf6b5a0a7  ! 3020: STHA_I	stha	%r27, [%r22 + 0x00a7] %asi
cpu_intr_3_236:
	setx	0x350038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73d6001  ! 3023: SRA_I	sra 	%r21, 0x0001, %r27
	.word 0xfa740000  ! 3024: STX_R	stx	%r29, [%r16 + %r0]
T3_asi_reg_wr_119:
	mov	0x3c0, %r14
	.word 0xfef38e60  ! 3026: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0x8394a0b7  ! 3028: WRPR_TNPC_I	wrpr	%r18, 0x00b7, %tnpc
cpu_intr_3_237:
	setx	0x35022c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_238:
	setx	0x37020e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_239:
	setx	0x360336, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_240:
	setx	0x34011e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_241:
	setx	0x34003b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_242:
	setx	0x35000a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_243:
	setx	0x360107, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_244:
	setx	0x370134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb834200b  ! 3047: ORN_I	orn 	%r16, 0x000b, %r28
T3_asi_reg_rd_148:
	mov	0x3c4, %r14
	.word 0xfedb8e60  ! 3052: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_3_245:
	setx	0x340307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ac0020  ! 3055: STBA_R	stba	%r27, [%r16 + %r0] 0x01
	.word 0xf4ac4020  ! 3056: STBA_R	stba	%r26, [%r17 + %r0] 0x01
	.word 0xf8a40020  ! 3058: STWA_R	stwa	%r28, [%r16 + %r0] 0x01
	.word 0xf2a52003  ! 3060: STWA_I	stwa	%r25, [%r20 + 0x0003] %asi
	.word 0xf0344000  ! 3061: STH_R	sth	%r24, [%r17 + %r0]
	.word 0xf8354000  ! 3063: STH_R	sth	%r28, [%r21 + %r0]
	.word 0xb2b54000  ! 3064: ORNcc_R	orncc 	%r21, %r0, %r25
	.word 0xf0ac8020  ! 3065: STBA_R	stba	%r24, [%r18 + %r0] 0x01
	.word 0xf8350000  ! 3067: STH_R	sth	%r28, [%r20 + %r0]
	.word 0xf4a4c020  ! 3068: STWA_R	stwa	%r26, [%r19 + %r0] 0x01
T3_asi_reg_wr_120:
	mov	0x3c5, %r14
	.word 0xfcf389e0  ! 3069: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T3_asi_reg_wr_121:
	mov	0x3c3, %r14
	.word 0xfaf38e60  ! 3070: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xba34e115  ! 3071: ORN_I	orn 	%r19, 0x0115, %r29
	.word 0xbb341000  ! 3076: SRLX_R	srlx	%r16, %r0, %r29
	.word 0xbcb58000  ! 3078: ORNcc_R	orncc 	%r22, %r0, %r30
iob_intr_3_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_242), 16, 16)) -> intp(3, 0, 3c)
T3_asi_reg_wr_122:
	mov	0x25, %r14
	.word 0xfcf38e60  ! 3081: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T3_asi_reg_wr_123:
	mov	0x3c3, %r14
	.word 0xf0f38e60  ! 3084: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_3_246:
	setx	0x34031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2a5a04b  ! 3090: SUBcc_I	subcc 	%r22, 0x004b, %r25
	.word 0xf4aca0ee  ! 3091: STBA_I	stba	%r26, [%r18 + 0x00ee] %asi
	.word 0xfaa58020  ! 3092: STWA_R	stwa	%r29, [%r22 + %r0] 0x01
	.word 0xb634c000  ! 3096: ORN_R	orn 	%r19, %r0, %r27
	.word 0xf4ac213a  ! 3098: STBA_I	stba	%r26, [%r16 + 0x013a] %asi
T3_asi_reg_rd_149:
	mov	0x1, %r14
	.word 0xfcdb84a0  ! 3103: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf0ad0020  ! 3104: STBA_R	stba	%r24, [%r20 + %r0] 0x01
	.word 0xfcac2082  ! 3114: STBA_I	stba	%r30, [%r16 + 0x0082] %asi
cpu_intr_3_247:
	setx	0x35033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2956131  ! 3118: ORcc_I	orcc 	%r21, 0x0131, %r25
cpu_intr_3_248:
	setx	0x370317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3480000  ! 3120: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	ta	T_CHANGE_TO_TL0
	.word 0xf82c8000  ! 3122: STB_R	stb	%r28, [%r18 + %r0]
iob_intr_3_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_243), 16, 16)) -> intp(3, 0, 26)
cpu_intr_3_249:
	setx	0x340121, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_150:
	mov	0x38, %r14
	.word 0xf2db84a0  ! 3129: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_3_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_244), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf4f5e0ff  ! 3134: STXA_I	stxa	%r26, [%r23 + 0x00ff] %asi
	.word 0xfe74a1dc  ! 3137: STX_I	stx	%r31, [%r18 + 0x01dc]
cpu_intr_3_250:
	setx	0x370016, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_124:
	mov	0x28, %r14
	.word 0xf0f38e40  ! 3140: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf22d200a  ! 3142: STB_I	stb	%r25, [%r20 + 0x000a]
	.word 0xf8258000  ! 3143: STW_R	stw	%r28, [%r22 + %r0]
cpu_intr_3_251:
	setx	0x350303, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_151:
	mov	0x2b, %r14
	.word 0xf0db8e80  ! 3145: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T3_asi_reg_rd_152:
	mov	0x7, %r14
	.word 0xf2db89e0  ! 3146: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T3_asi_reg_rd_153:
	mov	0x3c0, %r14
	.word 0xf4db8e40  ! 3147: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_245), 16, 16)) -> intp(3, 0, 7)
cpu_intr_3_252:
	setx	0x370225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2adc020  ! 3152: STBA_R	stba	%r25, [%r23 + %r0] 0x01
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983852  ! 3153: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1852, %hpstate
	.word 0xf8a5a024  ! 3156: STWA_I	stwa	%r28, [%r22 + 0x0024] %asi
	.word 0xb9508000  ! 3159: RDPR_TSTATE	rdpr	%tstate, %r28
iob_intr_3_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_246), 16, 16)) -> intp(3, 0, e)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_wr_125:
	mov	0x0, %r14
	.word 0xfcf38e60  ! 3167: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T3_asi_reg_wr_126:
	mov	0x23, %r14
	.word 0xf8f389e0  ! 3169: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_3_253:
	setx	0x35011c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_247), 16, 16)) -> intp(3, 0, 3b)
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf22560ec  ! 3177: STW_I	stw	%r25, [%r21 + 0x00ec]
	.word 0xf8ac4020  ! 3181: STBA_R	stba	%r28, [%r17 + %r0] 0x01
	.word 0xf0ace17e  ! 3182: STBA_I	stba	%r24, [%r19 + 0x017e] %asi
cpu_intr_3_254:
	setx	0x36010e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_154:
	mov	0x3c8, %r14
	.word 0xfadb8400  ! 3189: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_3_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_248), 16, 16)) -> intp(3, 0, 15)
	ta	T_CHANGE_HPRIV
	.word 0x89956081  ! 3200: WRPR_TICK_I	wrpr	%r21, 0x0081, %tick
T3_asi_reg_wr_127:
	mov	0x32, %r14
	.word 0xfaf38e40  ! 3202: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb8a42158  ! 3203: SUBcc_I	subcc 	%r16, 0x0158, %r28
	.word 0xf22d8000  ! 3204: STB_R	stb	%r25, [%r22 + %r0]
cpu_intr_3_255:
	setx	0x390318, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_155:
	mov	0x2d, %r14
	.word 0xf6db8e60  ! 3206: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_3_256:
	setx	0x3b032f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_156:
	mov	0x2b, %r14
	.word 0xf4db8e80  ! 3211: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_3_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_249), 16, 16)) -> intp(3, 0, 1b)
iob_intr_3_250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_250), 16, 16)) -> intp(3, 0, 2)
cpu_intr_3_257:
	setx	0x3a0338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc240000  ! 3220: STW_R	stw	%r30, [%r16 + %r0]
cpu_intr_3_258:
	setx	0x38001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b4e022  ! 3223: STHA_I	stha	%r28, [%r19 + 0x0022] %asi
	.word 0xfeb421c6  ! 3224: STHA_I	stha	%r31, [%r16 + 0x01c6] %asi
cpu_intr_3_259:
	setx	0x3a0324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2aca02c  ! 3226: STBA_I	stba	%r25, [%r18 + 0x002c] %asi
T3_asi_reg_rd_157:
	mov	0x6, %r14
	.word 0xf0db89e0  ! 3228: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf2ad614f  ! 3229: STBA_I	stba	%r25, [%r21 + 0x014f] %asi
T3_asi_reg_rd_158:
	mov	0x25, %r14
	.word 0xfedb8e40  ! 3230: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf2356126  ! 3235: STH_I	sth	%r25, [%r21 + 0x0126]
	.word 0xfa24e1fd  ! 3237: STW_I	stw	%r29, [%r19 + 0x01fd]
	.word 0xfab40020  ! 3238: STHA_R	stha	%r29, [%r16 + %r0] 0x01
	.word 0xfa344000  ! 3239: STH_R	sth	%r29, [%r17 + %r0]
T3_asi_reg_rd_159:
	mov	0x15, %r14
	.word 0xf8db8400  ! 3240: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_3_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_251), 16, 16)) -> intp(3, 0, 36)
	.word 0xfef5a1b8  ! 3244: STXA_I	stxa	%r31, [%r22 + 0x01b8] %asi
	.word 0xb7643801  ! 3247: MOVcc_I	<illegal instruction>
	ta	T_CHANGE_TO_TL0
iob_intr_3_252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_252), 16, 16)) -> intp(3, 0, 19)
T3_asi_reg_rd_160:
	mov	0x2d, %r14
	.word 0xf6db8e40  ! 3252: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_HPRIV
	.word 0xf4adc020  ! 3254: STBA_R	stba	%r26, [%r23 + %r0] 0x01
T3_asi_reg_rd_161:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 3255: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf0a4e0e9  ! 3257: STWA_I	stwa	%r24, [%r19 + 0x00e9] %asi
cpu_intr_3_260:
	setx	0x39001f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_128:
	mov	0x3c2, %r14
	.word 0xf2f38e40  ! 3260: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x819838d8  ! 3261: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18d8, %hpstate
cpu_intr_3_261:
	setx	0x3b0131, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_262:
	setx	0x3b0122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcace0ea  ! 3266: STBA_I	stba	%r30, [%r19 + 0x00ea] %asi
	.word 0xbc3d6092  ! 3273: XNOR_I	xnor 	%r21, 0x0092, %r30
	.word 0xf6f42119  ! 3274: STXA_I	stxa	%r27, [%r16 + 0x0119] %asi
iob_intr_3_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_253), 16, 16)) -> intp(3, 0, 2c)
	.word 0xfc2c6092  ! 3278: STB_I	stb	%r30, [%r17 + 0x0092]
iob_intr_3_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_254), 16, 16)) -> intp(3, 0, 1f)
iob_intr_3_255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_255), 16, 16)) -> intp(3, 0, 3c)
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_162:
	mov	0x3c4, %r14
	.word 0xf8db84a0  ! 3296: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb4144000  ! 3297: OR_R	or 	%r17, %r0, %r26
	.word 0xb61d8000  ! 3299: XOR_R	xor 	%r22, %r0, %r27
iob_intr_3_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_256), 16, 16)) -> intp(3, 0, 25)
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983b88  ! 3306: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b88, %hpstate
T3_asi_reg_wr_129:
	mov	0x3c4, %r14
	.word 0xfef38e60  ! 3307: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb4c5216b  ! 3309: ADDCcc_I	addccc 	%r20, 0x016b, %r26
cpu_intr_3_263:
	setx	0x390312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2350000  ! 3311: STH_R	sth	%r25, [%r20 + %r0]
T3_asi_reg_rd_163:
	mov	0x5, %r14
	.word 0xfedb8e40  ! 3312: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_3_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_257), 16, 16)) -> intp(3, 0, 38)
cpu_intr_3_264:
	setx	0x3b022b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_265:
	setx	0x3a0306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb80d0000  ! 3318: AND_R	and 	%r20, %r0, %r28
iob_intr_3_258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_258), 16, 16)) -> intp(3, 0, 30)
	.word 0xbac48000  ! 3323: ADDCcc_R	addccc 	%r18, %r0, %r29
	.word 0xb72d4000  ! 3324: SLL_R	sll 	%r21, %r0, %r27
T3_asi_reg_wr_130:
	mov	0x13, %r14
	.word 0xfef38400  ! 3327: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_3_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_259), 16, 16)) -> intp(3, 0, f)
	.word 0xfeb40020  ! 3331: STHA_R	stha	%r31, [%r16 + %r0] 0x01
	.word 0xfa35e14b  ! 3334: STH_I	sth	%r29, [%r23 + 0x014b]
	.word 0xfa2d8000  ! 3337: STB_R	stb	%r29, [%r22 + %r0]
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_TO_TL1
iob_intr_3_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_260), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf424e0c3  ! 3346: STW_I	stw	%r26, [%r19 + 0x00c3]
T3_asi_reg_rd_164:
	mov	0x3c8, %r14
	.word 0xf8db8e40  ! 3347: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_266:
	setx	0x390236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_261), 16, 16)) -> intp(3, 0, 30)
cpu_intr_3_267:
	setx	0x3a0303, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_131:
	mov	0x2b, %r14
	.word 0xfcf38e60  ! 3352: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_3_268:
	setx	0x38021d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_132:
	mov	0x3c0, %r14
	.word 0xf8f38e60  ! 3360: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_3_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_262), 16, 16)) -> intp(3, 0, 3e)
	.word 0xfcb44020  ! 3366: STHA_R	stha	%r30, [%r17 + %r0] 0x01
	.word 0xf8b4c020  ! 3367: STHA_R	stha	%r28, [%r19 + %r0] 0x01
	.word 0xf82c4000  ! 3369: STB_R	stb	%r28, [%r17 + %r0]
T3_asi_reg_wr_133:
	mov	0x3c4, %r14
	.word 0xfcf38e60  ! 3371: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb5643801  ! 3373: MOVcc_I	<illegal instruction>
iob_intr_3_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_263), 16, 16)) -> intp(3, 0, a)
	.word 0xf034e15c  ! 3375: STH_I	sth	%r24, [%r19 + 0x015c]
	.word 0xf22c4000  ! 3377: STB_R	stb	%r25, [%r17 + %r0]
T3_asi_reg_wr_134:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 3378: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf0a54020  ! 3379: STWA_R	stwa	%r24, [%r21 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
cpu_intr_3_269:
	setx	0x380017, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_135:
	mov	0x27, %r14
	.word 0xfcf389e0  ! 3385: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T3_asi_reg_wr_136:
	mov	0x13, %r14
	.word 0xfaf38e80  ! 3387: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_3_270:
	setx	0x39001c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_271:
	setx	0x390233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6f420c1  ! 3395: STXA_I	stxa	%r27, [%r16 + 0x00c1] %asi
cpu_intr_3_272:
	setx	0x3a000d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_165:
	mov	0x26, %r14
	.word 0xf4db8400  ! 3397: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T3_asi_reg_rd_166:
	mov	0x27, %r14
	.word 0xfcdb89e0  ! 3398: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_3_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_264), 16, 16)) -> intp(3, 0, 2e)
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_167:
	mov	0x1b, %r14
	.word 0xf0db8e60  ! 3406: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf2b5c020  ! 3411: STHA_R	stha	%r25, [%r23 + %r0] 0x01
	.word 0xf0354000  ! 3413: STH_R	sth	%r24, [%r21 + %r0]
	.word 0xf0b5207e  ! 3415: STHA_I	stha	%r24, [%r20 + 0x007e] %asi
	.word 0xfe2d0000  ! 3416: STB_R	stb	%r31, [%r20 + %r0]
cpu_intr_3_273:
	setx	0x3a0106, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_137:
	mov	0x3c4, %r14
	.word 0xfef38400  ! 3419: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb52c7001  ! 3423: SLLX_I	sllx	%r17, 0x0001, %r26
cpu_intr_3_274:
	setx	0x3b0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb40020  ! 3425: STHA_R	stha	%r31, [%r16 + %r0] 0x01
	.word 0xb294c000  ! 3431: ORcc_R	orcc 	%r19, %r0, %r25
cpu_intr_3_275:
	setx	0x38003b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_265), 16, 16)) -> intp(3, 0, 37)
	.word 0xf6344000  ! 3435: STH_R	sth	%r27, [%r17 + %r0]
cpu_intr_3_276:
	setx	0x3a003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa75e08d  ! 3439: STX_I	stx	%r29, [%r23 + 0x008d]
	.word 0xfcb5c020  ! 3443: STHA_R	stha	%r30, [%r23 + %r0] 0x01
	.word 0xf0acc020  ! 3444: STBA_R	stba	%r24, [%r19 + %r0] 0x01
	.word 0xfef4617f  ! 3445: STXA_I	stxa	%r31, [%r17 + 0x017f] %asi
iob_intr_3_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_266), 16, 16)) -> intp(3, 0, 3b)
T3_asi_reg_rd_168:
	mov	0x34, %r14
	.word 0xf8db84a0  ! 3447: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xfa74614e  ! 3450: STX_I	stx	%r29, [%r17 + 0x014e]
T3_asi_reg_rd_169:
	mov	0x25, %r14
	.word 0xf4db8e80  ! 3451: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xfc240000  ! 3452: STW_R	stw	%r30, [%r16 + %r0]
	.word 0x9194605f  ! 3459: WRPR_PIL_I	wrpr	%r17, 0x005f, %pil
	.word 0xf635e17f  ! 3462: STH_I	sth	%r27, [%r23 + 0x017f]
T3_asi_reg_rd_170:
	mov	0x1c, %r14
	.word 0xf0db84a0  ! 3468: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfa2d8000  ! 3471: STB_R	stb	%r29, [%r22 + %r0]
	.word 0xf624603f  ! 3472: STW_I	stw	%r27, [%r17 + 0x003f]
cpu_intr_3_277:
	setx	0x3b030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc74c000  ! 3477: STX_R	stx	%r30, [%r19 + %r0]
	ta	T_CHANGE_TO_TL1
	.word 0xf6a44020  ! 3480: STWA_R	stwa	%r27, [%r17 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_171:
	mov	0xd, %r14
	.word 0xf8db8e60  ! 3484: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_267), 16, 16)) -> intp(3, 0, 3b)
	ta	T_CHANGE_TO_TL1
	.word 0xf42d0000  ! 3490: STB_R	stb	%r26, [%r20 + %r0]
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982908  ! 3491: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0908, %hpstate
T3_asi_reg_wr_138:
	mov	0x0, %r14
	.word 0xfcf389e0  ! 3492: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf4b42168  ! 3500: STHA_I	stha	%r26, [%r16 + 0x0168] %asi
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983b48  ! 3501: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b48, %hpstate
	.word 0xf62ce004  ! 3503: STB_I	stb	%r27, [%r19 + 0x0004]
T3_asi_reg_rd_172:
	mov	0x3c8, %r14
	.word 0xf8db84a0  ! 3506: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf02ce063  ! 3508: STB_I	stb	%r24, [%r19 + 0x0063]
cpu_intr_3_278:
	setx	0x3b002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ad2186  ! 3512: STBA_I	stba	%r26, [%r20 + 0x0186] %asi
T3_asi_reg_wr_139:
	mov	0x20, %r14
	.word 0xf0f384a0  ! 3513: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_3_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_268), 16, 16)) -> intp(3, 0, 16)
cpu_intr_3_279:
	setx	0x38000d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_269), 16, 16)) -> intp(3, 0, e)
	.word 0xf4a4a117  ! 3517: STWA_I	stwa	%r26, [%r18 + 0x0117] %asi
T3_asi_reg_rd_173:
	mov	0x1, %r14
	.word 0xf6db84a0  ! 3518: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf2246031  ! 3519: STW_I	stw	%r25, [%r17 + 0x0031]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_280:
	setx	0x38002d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_270), 16, 16)) -> intp(3, 0, 32)
cpu_intr_3_281:
	setx	0x3b0317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_282:
	setx	0x3b002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3c6001  ! 3539: SRA_I	sra 	%r17, 0x0001, %r30
iob_intr_3_271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_271), 16, 16)) -> intp(3, 0, 2a)
iob_intr_3_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_272), 16, 16)) -> intp(3, 0, 8)
	.word 0xfea5a138  ! 3544: STWA_I	stwa	%r31, [%r22 + 0x0138] %asi
	.word 0xf0b4a0b0  ! 3547: STHA_I	stha	%r24, [%r18 + 0x00b0] %asi
	.word 0xf0a461d8  ! 3550: STWA_I	stwa	%r24, [%r17 + 0x01d8] %asi
	.word 0xf2aca019  ! 3551: STBA_I	stba	%r25, [%r18 + 0x0019] %asi
	.word 0xf0740000  ! 3552: STX_R	stx	%r24, [%r16 + %r0]
iob_intr_3_273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_273), 16, 16)) -> intp(3, 0, 16)
cpu_intr_3_283:
	setx	0x38023e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_174:
	mov	0x17, %r14
	.word 0xfedb8e40  ! 3556: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_175:
	mov	0x0, %r14
	.word 0xf4db8e60  ! 3561: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	ta	T_CHANGE_NONHPRIV
	.word 0xb2a560c6  ! 3565: SUBcc_I	subcc 	%r21, 0x00c6, %r25
cpu_intr_3_284:
	setx	0x390332, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_274), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_285:
	setx	0x3b0035, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_176:
	mov	0x3c3, %r14
	.word 0xfadb89e0  ! 3571: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T3_asi_reg_rd_177:
	mov	0x34, %r14
	.word 0xf0db8e40  ! 3573: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_rd_178:
	mov	0x33, %r14
	.word 0xfedb8e40  ! 3574: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_286:
	setx	0x3a0114, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982898  ! 3576: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0898, %hpstate
T3_asi_reg_wr_140:
	mov	0xa, %r14
	.word 0xf8f38e40  ! 3577: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_3_287:
	setx	0x380238, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
cpu_intr_3_288:
	setx	0x3b0121, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_275), 16, 16)) -> intp(3, 0, 28)
cpu_intr_3_289:
	setx	0x3b0005, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_276), 16, 16)) -> intp(3, 0, 19)
cpu_intr_3_290:
	setx	0x3a0307, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_277), 16, 16)) -> intp(3, 0, 15)
iob_intr_3_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_278), 16, 16)) -> intp(3, 0, 6)
T3_asi_reg_rd_179:
	mov	0x20, %r14
	.word 0xf6db8400  ! 3593: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf0ad60f8  ! 3594: STBA_I	stba	%r24, [%r21 + 0x00f8] %asi
iob_intr_3_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_279), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_rd_180:
	mov	0x21, %r14
	.word 0xf6db89e0  ! 3596: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_3_280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_280), 16, 16)) -> intp(3, 0, e)
iob_intr_3_281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_281), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf224c000  ! 3603: STW_R	stw	%r25, [%r19 + %r0]
	.word 0xb52cb001  ! 3606: SLLX_I	sllx	%r18, 0x0001, %r26
	.word 0xfcb5c020  ! 3607: STHA_R	stha	%r30, [%r23 + %r0] 0x01
	.word 0xf2ac20f2  ! 3609: STBA_I	stba	%r25, [%r16 + 0x00f2] %asi
cpu_intr_3_291:
	setx	0x3a023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_292:
	setx	0x39010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a50020  ! 3617: STWA_R	stwa	%r26, [%r20 + %r0] 0x01
	.word 0xb8aca0de  ! 3620: ANDNcc_I	andncc 	%r18, 0x00de, %r28
	.word 0xf0b4e064  ! 3622: STHA_I	stha	%r24, [%r19 + 0x0064] %asi
	.word 0xf42ca07b  ! 3623: STB_I	stb	%r26, [%r18 + 0x007b]
iob_intr_3_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_282), 16, 16)) -> intp(3, 0, 38)
iob_intr_3_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_283), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf4244000  ! 3627: STW_R	stw	%r26, [%r17 + %r0]
	.word 0xf2a4c020  ! 3629: STWA_R	stwa	%r25, [%r19 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
	.word 0xfab58020  ! 3632: STHA_R	stha	%r29, [%r22 + %r0] 0x01
	.word 0xfaad4020  ! 3633: STBA_R	stba	%r29, [%r21 + %r0] 0x01
	.word 0xfa746174  ! 3634: STX_I	stx	%r29, [%r17 + 0x0174]
	.word 0xf6354000  ! 3638: STH_R	sth	%r27, [%r21 + %r0]
	.word 0xfa25c000  ! 3643: STW_R	stw	%r29, [%r23 + %r0]
T3_asi_reg_rd_181:
	mov	0x3c4, %r14
	.word 0xfedb8e40  ! 3646: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_rd_182:
	mov	0x3c7, %r14
	.word 0xf2db8e80  ! 3648: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf82c2067  ! 3649: STB_I	stb	%r28, [%r16 + 0x0067]
iob_intr_3_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_284), 16, 16)) -> intp(3, 0, c)
	.word 0xf6a46032  ! 3653: STWA_I	stwa	%r27, [%r17 + 0x0032] %asi
	.word 0xfaac2021  ! 3656: STBA_I	stba	%r29, [%r16 + 0x0021] %asi
iob_intr_3_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_285), 16, 16)) -> intp(3, 0, 35)
	.word 0xf8250000  ! 3659: STW_R	stw	%r28, [%r20 + %r0]
T3_asi_reg_wr_141:
	mov	0x16, %r14
	.word 0xfcf38e40  ! 3663: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf42d2079  ! 3664: STB_I	stb	%r26, [%r20 + 0x0079]
iob_intr_3_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_286), 16, 16)) -> intp(3, 0, 21)
	.word 0xf0adc020  ! 3667: STBA_R	stba	%r24, [%r23 + %r0] 0x01
	.word 0xfa340000  ! 3672: STH_R	sth	%r29, [%r16 + %r0]
	.word 0xf8ac8020  ! 3673: STBA_R	stba	%r28, [%r18 + %r0] 0x01
	.word 0xfa748000  ! 3674: STX_R	stx	%r29, [%r18 + %r0]
	.word 0xbab5e02b  ! 3675: SUBCcc_I	orncc 	%r23, 0x002b, %r29
cpu_intr_3_293:
	setx	0x3f033a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_294:
	setx	0x3f0028, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_287), 16, 16)) -> intp(3, 0, 39)
	.word 0xf4ac8020  ! 3683: STBA_R	stba	%r26, [%r18 + %r0] 0x01
	.word 0xb6956169  ! 3684: ORcc_I	orcc 	%r21, 0x0169, %r27
T3_asi_reg_wr_142:
	mov	0x22, %r14
	.word 0xfef38400  ! 3685: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0x859420dc  ! 3688: WRPR_TSTATE_I	wrpr	%r16, 0x00dc, %tstate
T3_asi_reg_rd_183:
	mov	0x3c7, %r14
	.word 0xf0db8e60  ! 3689: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_3_288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_288), 16, 16)) -> intp(3, 0, 32)
	ta	T_CHANGE_NONHPRIV
	.word 0xf6b54020  ! 3693: STHA_R	stha	%r27, [%r21 + %r0] 0x01
	.word 0xb93de001  ! 3695: SRA_I	sra 	%r23, 0x0001, %r28
iob_intr_3_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_289), 16, 16)) -> intp(3, 0, 11)
	ta	T_CHANGE_TO_TL0
	.word 0xb9518000  ! 3702: RDPR_PSTATE	rdpr	%pstate, %r28
T3_asi_reg_wr_143:
	mov	0x3c6, %r14
	.word 0xfef38e40  ! 3704: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_3_295:
	setx	0x3c021c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_290), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_wr_144:
	mov	0x29, %r14
	.word 0xf0f38e80  ! 3708: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T3_asi_reg_rd_184:
	mov	0x2e, %r14
	.word 0xf6db8e40  ! 3713: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfcb58020  ! 3719: STHA_R	stha	%r30, [%r22 + %r0] 0x01
cpu_intr_3_296:
	setx	0x3d000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc2c8000  ! 3724: STB_R	stb	%r30, [%r18 + %r0]
T3_asi_reg_wr_145:
	mov	0x3c4, %r14
	.word 0xf6f38e60  ! 3732: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_3_297:
	setx	0x3d030f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_291), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf62560f0  ! 3742: STW_I	stw	%r27, [%r21 + 0x00f0]
	.word 0xf0b4a122  ! 3750: STHA_I	stha	%r24, [%r18 + 0x0122] %asi
T3_asi_reg_rd_185:
	mov	0x8, %r14
	.word 0xfadb8e60  ! 3755: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf6258000  ! 3756: STW_R	stw	%r27, [%r22 + %r0]
T3_asi_reg_wr_146:
	mov	0x3c3, %r14
	.word 0xf8f389e0  ! 3757: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf2ac61ca  ! 3758: STBA_I	stba	%r25, [%r17 + 0x01ca] %asi
iob_intr_3_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_292), 16, 16)) -> intp(3, 0, 11)
T3_asi_reg_rd_186:
	mov	0x3c6, %r14
	.word 0xfedb8e40  ! 3766: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfcb521b9  ! 3769: STHA_I	stha	%r30, [%r20 + 0x01b9] %asi
cpu_intr_3_298:
	setx	0x3f0019, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_147:
	mov	0x1, %r14
	.word 0xfcf38e40  ! 3771: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb694a0d5  ! 3772: ORcc_I	orcc 	%r18, 0x00d5, %r27
	.word 0xf0f520f5  ! 3774: STXA_I	stxa	%r24, [%r20 + 0x00f5] %asi
	.word 0xf6b5e133  ! 3775: STHA_I	stha	%r27, [%r23 + 0x0133] %asi
	.word 0xf4340000  ! 3779: STH_R	sth	%r26, [%r16 + %r0]
iob_intr_3_293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_293), 16, 16)) -> intp(3, 0, 2d)
cpu_intr_3_299:
	setx	0x3d011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf435e062  ! 3784: STH_I	sth	%r26, [%r23 + 0x0062]
T3_asi_reg_wr_148:
	mov	0x3c2, %r14
	.word 0xfaf38e60  ! 3786: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T3_asi_reg_wr_149:
	mov	0x2f, %r14
	.word 0xf0f38e80  ! 3790: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T3_asi_reg_wr_150:
	mov	0x34, %r14
	.word 0xf4f384a0  ! 3791: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982e42  ! 3793: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e42, %hpstate
	ta	T_CHANGE_NONHPRIV
	.word 0xfa24e034  ! 3798: STW_I	stw	%r29, [%r19 + 0x0034]
T3_asi_reg_wr_151:
	mov	0x3c2, %r14
	.word 0xf6f38e40  ! 3799: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf8354000  ! 3801: STH_R	sth	%r28, [%r21 + %r0]
	.word 0xfe744000  ! 3802: STX_R	stx	%r31, [%r17 + %r0]
	.word 0xf0ad8020  ! 3805: STBA_R	stba	%r24, [%r22 + %r0] 0x01
	.word 0xf0256089  ! 3807: STW_I	stw	%r24, [%r21 + 0x0089]
	.word 0xfea4a12c  ! 3808: STWA_I	stwa	%r31, [%r18 + 0x012c] %asi
	.word 0xf625c000  ! 3809: STW_R	stw	%r27, [%r23 + %r0]
iob_intr_3_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_294), 16, 16)) -> intp(3, 0, 31)
	.word 0xf0a4c020  ! 3818: STWA_R	stwa	%r24, [%r19 + %r0] 0x01
iob_intr_3_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_295), 16, 16)) -> intp(3, 0, 12)
	ta	T_CHANGE_NONHPRIV
	.word 0xbe8c4000  ! 3826: ANDcc_R	andcc 	%r17, %r0, %r31
cpu_intr_3_300:
	setx	0x3e0323, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_301:
	setx	0x3e0216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe24e118  ! 3831: STW_I	stw	%r31, [%r19 + 0x0118]
T3_asi_reg_rd_187:
	mov	0x3c2, %r14
	.word 0xfedb8400  ! 3832: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf4f4e076  ! 3834: STXA_I	stxa	%r26, [%r19 + 0x0076] %asi
iob_intr_3_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_296), 16, 16)) -> intp(3, 0, 3f)
iob_intr_3_297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_297), 16, 16)) -> intp(3, 0, 36)
	.word 0xf2f4a08c  ! 3841: STXA_I	stxa	%r25, [%r18 + 0x008c] %asi
	ta	T_CHANGE_NONHPRIV
	.word 0xf635a054  ! 3843: STH_I	sth	%r27, [%r22 + 0x0054]
T3_asi_reg_wr_152:
	mov	0x11, %r14
	.word 0xfef38400  ! 3844: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T3_asi_reg_rd_188:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 3845: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfcac8020  ! 3846: STBA_R	stba	%r30, [%r18 + %r0] 0x01
T3_asi_reg_rd_189:
	mov	0x3c5, %r14
	.word 0xfcdb8e40  ! 3847: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_298), 16, 16)) -> intp(3, 0, 1b)
T3_asi_reg_rd_190:
	mov	0x22, %r14
	.word 0xfedb8e40  ! 3849: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_rd_191:
	mov	0x3c0, %r14
	.word 0xf0db8e60  ! 3851: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T3_asi_reg_rd_192:
	mov	0x4, %r14
	.word 0xf6db8e60  ! 3852: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_3_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_299), 16, 16)) -> intp(3, 0, 3b)
cpu_intr_3_302:
	setx	0x3e003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf42de065  ! 3858: STB_I	stb	%r26, [%r23 + 0x0065]
T3_asi_reg_rd_193:
	mov	0x2c, %r14
	.word 0xfcdb8e40  ! 3859: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_rd_194:
	mov	0x3c7, %r14
	.word 0xf6db8e80  ! 3861: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf4a42169  ! 3864: STWA_I	stwa	%r26, [%r16 + 0x0169] %asi
	.word 0xb92dd000  ! 3867: SLLX_R	sllx	%r23, %r0, %r28
cpu_intr_3_303:
	setx	0x3c0121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a52185  ! 3869: STWA_I	stwa	%r24, [%r20 + 0x0185] %asi
	.word 0x899461cc  ! 3870: WRPR_TICK_I	wrpr	%r17, 0x01cc, %tick
iob_intr_3_300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_300), 16, 16)) -> intp(3, 0, 0)
	.word 0xba852110  ! 3876: ADDcc_I	addcc 	%r20, 0x0110, %r29
T3_asi_reg_wr_153:
	mov	0x2f, %r14
	.word 0xf6f38e40  ! 3878: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_304:
	setx	0x3d010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd2c8000  ! 3880: SLL_R	sll 	%r18, %r0, %r30
cpu_intr_3_305:
	setx	0x3f0113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf035e1c4  ! 3886: STH_I	sth	%r24, [%r23 + 0x01c4]
	ta	T_CHANGE_TO_TL0
	.word 0xfcb46132  ! 3889: STHA_I	stha	%r30, [%r17 + 0x0132] %asi
T3_asi_reg_rd_195:
	mov	0x36, %r14
	.word 0xf0db8400  ! 3890: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb63c2196  ! 3891: XNOR_I	xnor 	%r16, 0x0196, %r27
iob_intr_3_301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_301), 16, 16)) -> intp(3, 0, 1)
	.word 0xf62c8000  ! 3895: STB_R	stb	%r27, [%r18 + %r0]
T3_asi_reg_rd_196:
	mov	0x3c8, %r14
	.word 0xf2db89e0  ! 3896: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xf0aca068  ! 3898: STBA_I	stba	%r24, [%r18 + 0x0068] %asi
	.word 0xf034a098  ! 3901: STH_I	sth	%r24, [%r18 + 0x0098]
	ta	T_CHANGE_HPRIV
iob_intr_3_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_302), 16, 16)) -> intp(3, 0, 13)
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982c92  ! 3904: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c92, %hpstate
iob_intr_3_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_303), 16, 16)) -> intp(3, 0, 23)
	.word 0xfcb5c020  ! 3907: STHA_R	stha	%r30, [%r23 + %r0] 0x01
T3_asi_reg_wr_154:
	mov	0x2, %r14
	.word 0xf6f38e60  ! 3908: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xfa25616b  ! 3910: STW_I	stw	%r29, [%r21 + 0x016b]
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
	.word 0xf624c000  ! 3913: STW_R	stw	%r27, [%r19 + %r0]
cpu_intr_3_306:
	setx	0x3e0213, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_307:
	setx	0x3d010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe74e00d  ! 3917: STX_I	stx	%r31, [%r19 + 0x000d]
iob_intr_3_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_304), 16, 16)) -> intp(3, 0, 24)
	.word 0xfaade14d  ! 3919: STBA_I	stba	%r29, [%r23 + 0x014d] %asi
cpu_intr_3_308:
	setx	0x3e002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb32cc000  ! 3921: SLL_R	sll 	%r19, %r0, %r25
cpu_intr_3_309:
	setx	0x3d0000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa75e0de  ! 3923: STX_I	stx	%r29, [%r23 + 0x00de]
iob_intr_3_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_305), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf4a4217c  ! 3925: STWA_I	stwa	%r26, [%r16 + 0x017c] %asi
iob_intr_3_306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_306), 16, 16)) -> intp(3, 0, 2b)
	.word 0xb885a1c2  ! 3927: ADDcc_I	addcc 	%r22, 0x01c2, %r28
T3_asi_reg_rd_197:
	mov	0x27, %r14
	.word 0xfcdb8e40  ! 3928: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfe2c215d  ! 3929: STB_I	stb	%r31, [%r16 + 0x015d]
cpu_intr_3_310:
	setx	0x3f0233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb22de13d  ! 3931: ANDN_I	andn 	%r23, 0x013d, %r25
	.word 0xfef460cd  ! 3932: STXA_I	stxa	%r31, [%r17 + 0x00cd] %asi
	.word 0xf0f421eb  ! 3933: STXA_I	stxa	%r24, [%r16 + 0x01eb] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_155:
	mov	0x3c2, %r14
	.word 0xf4f389e0  ! 3940: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_3_311:
	setx	0x3c0234, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_198:
	mov	0x32, %r14
	.word 0xf6db8e60  ! 3943: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_3_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_307), 16, 16)) -> intp(3, 0, 31)
	.word 0xf474e001  ! 3945: STX_I	stx	%r26, [%r19 + 0x0001]
T3_asi_reg_wr_156:
	mov	0x1b, %r14
	.word 0xf0f384a0  ! 3951: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xfe2c4000  ! 3953: STB_R	stb	%r31, [%r17 + %r0]
iob_intr_3_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_308), 16, 16)) -> intp(3, 0, 10)
T3_asi_reg_rd_199:
	mov	0x1c, %r14
	.word 0xf0db8e40  ! 3957: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	ta	T_CHANGE_HPRIV
	.word 0xb08461af  ! 3962: ADDcc_I	addcc 	%r17, 0x01af, %r24
iob_intr_3_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_309), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf4342087  ! 3964: STH_I	sth	%r26, [%r16 + 0x0087]
T3_asi_reg_rd_200:
	mov	0x1, %r14
	.word 0xf4db84a0  ! 3970: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf2340000  ! 3978: STH_R	sth	%r25, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
iob_intr_3_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_310), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_wr_157:
	mov	0x34, %r14
	.word 0xf0f38e40  ! 3982: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb53c0000  ! 3983: SRA_R	sra 	%r16, %r0, %r26
cpu_intr_3_312:
	setx	0x3d0120, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_311), 16, 16)) -> intp(3, 0, 7)
	.word 0xf2246158  ! 3991: STW_I	stw	%r25, [%r17 + 0x0158]
cpu_intr_3_313:
	setx	0x3c0334, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_314:
	setx	0x3c023a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_201:
	mov	0x28, %r14
	.word 0xf4db8e40  ! 3995: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_312), 16, 16)) -> intp(3, 0, 21)
cpu_intr_3_315:
	setx	0x3f0215, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_313), 16, 16)) -> intp(3, 0, 0)
	.word 0xf8758000  ! 4001: STX_R	stx	%r28, [%r22 + %r0]
	.word 0xf8ac6156  ! 4002: STBA_I	stba	%r28, [%r17 + 0x0156] %asi
	.word 0xf8248000  ! 4004: STW_R	stw	%r28, [%r18 + %r0]
cpu_intr_3_316:
	setx	0x3c0234, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_317:
	setx	0x3f0329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc34e1d1  ! 4008: STH_I	sth	%r30, [%r19 + 0x01d1]
	ta	T_CHANGE_TO_TL0
	.word 0xf0ac4020  ! 4012: STBA_R	stba	%r24, [%r17 + %r0] 0x01
	.word 0xf2b5c020  ! 4013: STHA_R	stha	%r25, [%r23 + %r0] 0x01
iob_intr_3_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_314), 16, 16)) -> intp(3, 0, 1a)
	ta	T_CHANGE_TO_TL0
	.word 0xb484e1ba  ! 4016: ADDcc_I	addcc 	%r19, 0x01ba, %r26
	.word 0xb4854000  ! 4024: ADDcc_R	addcc 	%r21, %r0, %r26
	.word 0xf8ad0020  ! 4026: STBA_R	stba	%r28, [%r20 + %r0] 0x01
cpu_intr_3_318:
	setx	0x3d0117, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_202:
	mov	0x4, %r14
	.word 0xf6db84a0  ! 4028: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_3_319:
	setx	0x3d0113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe756069  ! 4031: STX_I	stx	%r31, [%r21 + 0x0069]
cpu_intr_3_320:
	setx	0x3e0120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb5e167  ! 4039: STHA_I	stha	%r31, [%r23 + 0x0167] %asi
iob_intr_3_315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_315), 16, 16)) -> intp(3, 0, e)
cpu_intr_3_321:
	setx	0x3c0131, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_316), 16, 16)) -> intp(3, 0, 21)
	.word 0xfab5a063  ! 4051: STHA_I	stha	%r29, [%r22 + 0x0063] %asi
T3_asi_reg_wr_158:
	mov	0x15, %r14
	.word 0xf6f389e0  ! 4053: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xfea4c020  ! 4055: STWA_R	stwa	%r31, [%r19 + %r0] 0x01
cpu_intr_3_322:
	setx	0x3e010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22c602d  ! 4058: STB_I	stb	%r25, [%r17 + 0x002d]
	.word 0xf4742073  ! 4060: STX_I	stx	%r26, [%r16 + 0x0073]
cpu_intr_3_323:
	setx	0x3c0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983ada  ! 4067: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ada, %hpstate
	.word 0xbca48000  ! 4068: SUBcc_R	subcc 	%r18, %r0, %r30
cpu_intr_3_324:
	setx	0x3d0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_317), 16, 16)) -> intp(3, 0, 28)
	ta	T_CHANGE_TO_TL1
cpu_intr_3_325:
	setx	0x3c0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf625617a  ! 4081: STW_I	stw	%r27, [%r21 + 0x017a]
	.word 0xfe74e11b  ! 4083: STX_I	stx	%r31, [%r19 + 0x011b]
	.word 0xf4744000  ! 4084: STX_R	stx	%r26, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
cpu_intr_3_326:
	setx	0x3d0026, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_159:
	mov	0x2e, %r14
	.word 0xf0f38e60  ! 4090: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_3_318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_318), 16, 16)) -> intp(3, 0, 3)
	.word 0xf425a138  ! 4098: STW_I	stw	%r26, [%r22 + 0x0138]
	.word 0xf0350000  ! 4102: STH_R	sth	%r24, [%r20 + %r0]
	.word 0xf42da08e  ! 4103: STB_I	stb	%r26, [%r22 + 0x008e]
cpu_intr_3_327:
	setx	0x3e010c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_319), 16, 16)) -> intp(3, 0, 2a)
iob_intr_3_320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_320), 16, 16)) -> intp(3, 0, e)
iob_intr_3_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_321), 16, 16)) -> intp(3, 0, 28)
cpu_intr_3_328:
	setx	0x3f000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8bdc000  ! 4111: XNORcc_R	xnorcc 	%r23, %r0, %r28
	.word 0xfca48020  ! 4114: STWA_R	stwa	%r30, [%r18 + %r0] 0x01
	.word 0xf424a125  ! 4115: STW_I	stw	%r26, [%r18 + 0x0125]
	.word 0xfef5a102  ! 4118: STXA_I	stxa	%r31, [%r22 + 0x0102] %asi
T3_asi_reg_rd_203:
	mov	0x2c, %r14
	.word 0xfadb8e80  ! 4119: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_3_329:
	setx	0x3d012c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_330:
	setx	0x3f022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b54020  ! 4129: STHA_R	stha	%r26, [%r21 + %r0] 0x01
	.word 0xf8a4c020  ! 4130: STWA_R	stwa	%r28, [%r19 + %r0] 0x01
iob_intr_3_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_322), 16, 16)) -> intp(3, 0, 16)
T3_asi_reg_rd_204:
	mov	0x1e, %r14
	.word 0xfedb8400  ! 4134: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_3_331:
	setx	0x410207, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_332:
	setx	0x410137, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_323), 16, 16)) -> intp(3, 0, 9)
	ta	T_CHANGE_NONHPRIV
	.word 0xb2954000  ! 4160: ORcc_R	orcc 	%r21, %r0, %r25
cpu_intr_3_333:
	setx	0x400030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa24a0cf  ! 4163: STW_I	stw	%r29, [%r18 + 0x00cf]
cpu_intr_3_334:
	setx	0x400309, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_205:
	mov	0x3c0, %r14
	.word 0xf0db8e40  ! 4168: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	ta	T_CHANGE_TO_TL1
cpu_intr_3_335:
	setx	0x41011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca5e1cc  ! 4175: STWA_I	stwa	%r30, [%r23 + 0x01cc] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9344000  ! 4177: SRL_R	srl 	%r17, %r0, %r28
	.word 0xf4ad211e  ! 4180: STBA_I	stba	%r26, [%r20 + 0x011e] %asi
T3_asi_reg_wr_160:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 4185: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf635605e  ! 4189: STH_I	sth	%r27, [%r21 + 0x005e]
	.word 0xf235e125  ! 4190: STH_I	sth	%r25, [%r23 + 0x0125]
	.word 0xb635a0dc  ! 4193: SUBC_I	orn 	%r22, 0x00dc, %r27
cpu_intr_3_336:
	setx	0x430216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62c61c4  ! 4200: STB_I	stb	%r27, [%r17 + 0x01c4]
iob_intr_3_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_324), 16, 16)) -> intp(3, 0, 24)
cpu_intr_3_337:
	setx	0x41031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbf641800  ! 4211: MOVcc_R	<illegal instruction>
	.word 0xfc258000  ! 4213: STW_R	stw	%r30, [%r22 + %r0]
cpu_intr_3_338:
	setx	0x430018, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_325), 16, 16)) -> intp(3, 0, 27)
iob_intr_3_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_326), 16, 16)) -> intp(3, 0, 12)
	.word 0xbead0000  ! 4226: ANDNcc_R	andncc 	%r20, %r0, %r31
	.word 0xf0ace0ee  ! 4229: STBA_I	stba	%r24, [%r19 + 0x00ee] %asi
	.word 0xba2d2076  ! 4230: ANDN_I	andn 	%r20, 0x0076, %r29
	.word 0xfab40020  ! 4232: STHA_R	stha	%r29, [%r16 + %r0] 0x01
	.word 0xfe254000  ! 4233: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xfe3461bc  ! 4235: STH_I	sth	%r31, [%r17 + 0x01bc]
cpu_intr_3_339:
	setx	0x410311, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_206:
	mov	0x3c4, %r14
	.word 0xf6db8e40  ! 4237: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_340:
	setx	0x400116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_327), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_rd_207:
	mov	0x2d, %r14
	.word 0xf0db8e40  ! 4244: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_3_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_328), 16, 16)) -> intp(3, 0, 5)
	.word 0xf22c8000  ! 4251: STB_R	stb	%r25, [%r18 + %r0]
T3_asi_reg_rd_208:
	mov	0x31, %r14
	.word 0xf6db8e40  ! 4252: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf8ad0020  ! 4254: STBA_R	stba	%r28, [%r20 + %r0] 0x01
T3_asi_reg_wr_161:
	mov	0x4, %r14
	.word 0xfef38400  ! 4258: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xfe2c2136  ! 4259: STB_I	stb	%r31, [%r16 + 0x0136]
T3_asi_reg_rd_209:
	mov	0x33, %r14
	.word 0xf0db8400  ! 4260: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf22d8000  ! 4262: STB_R	stb	%r25, [%r22 + %r0]
	ta	T_CHANGE_TO_TL0
	.word 0xb9510000  ! 4270: RDPR_TICK	rdpr	%tick, %r28
cpu_intr_3_341:
	setx	0x41002b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_329), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_wr_162:
	mov	0x31, %r14
	.word 0xfef38e80  ! 4274: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_3_342:
	setx	0x420102, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_210:
	mov	0x3c3, %r14
	.word 0xfcdb84a0  ! 4278: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf8ad4020  ! 4279: STBA_R	stba	%r28, [%r21 + %r0] 0x01
	.word 0xfc752055  ! 4281: STX_I	stx	%r30, [%r20 + 0x0055]
	.word 0xfa2561f3  ! 4283: STW_I	stw	%r29, [%r21 + 0x01f3]
	.word 0xfa35a149  ! 4288: STH_I	sth	%r29, [%r22 + 0x0149]
	.word 0xfe2d4000  ! 4290: STB_R	stb	%r31, [%r21 + %r0]
cpu_intr_3_343:
	setx	0x41023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4b44000  ! 4293: ORNcc_R	orncc 	%r17, %r0, %r26
	.word 0xf0758000  ! 4295: STX_R	stx	%r24, [%r22 + %r0]
	.word 0xf8250000  ! 4298: STW_R	stw	%r28, [%r20 + %r0]
T3_asi_reg_rd_211:
	mov	0x22, %r14
	.word 0xfcdb8e40  ! 4299: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf0756161  ! 4300: STX_I	stx	%r24, [%r21 + 0x0161]
	.word 0xfead0020  ! 4301: STBA_R	stba	%r31, [%r20 + %r0] 0x01
	.word 0xf6348000  ! 4302: STH_R	sth	%r27, [%r18 + %r0]
	.word 0xf4758000  ! 4305: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xb20c8000  ! 4306: AND_R	and 	%r18, %r0, %r25
	.word 0xfa340000  ! 4307: STH_R	sth	%r29, [%r16 + %r0]
iob_intr_3_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_330), 16, 16)) -> intp(3, 0, 1d)
	.word 0xf274c000  ! 4310: STX_R	stx	%r25, [%r19 + %r0]
	.word 0xf8252027  ! 4311: STW_I	stw	%r28, [%r20 + 0x0027]
	.word 0xf87520b6  ! 4312: STX_I	stx	%r28, [%r20 + 0x00b6]
	.word 0xfe34c000  ! 4314: STH_R	sth	%r31, [%r19 + %r0]
cpu_intr_3_344:
	setx	0x43013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc35c000  ! 4319: SUBC_R	orn 	%r23, %r0, %r30
T3_asi_reg_wr_163:
	mov	0x10, %r14
	.word 0xfcf384a0  ! 4320: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T3_asi_reg_wr_164:
	mov	0x0, %r14
	.word 0xfcf38e60  ! 4322: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_3_345:
	setx	0x41030e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_346:
	setx	0x400213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcbd0000  ! 4329: XNORcc_R	xnorcc 	%r20, %r0, %r30
	.word 0xf62520b7  ! 4332: STW_I	stw	%r27, [%r20 + 0x00b7]
	.word 0xfe2d0000  ! 4335: STB_R	stb	%r31, [%r20 + %r0]
	.word 0xf0a48020  ! 4336: STWA_R	stwa	%r24, [%r18 + %r0] 0x01
cpu_intr_3_347:
	setx	0x410011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a58020  ! 4339: STWA_R	stwa	%r27, [%r22 + %r0] 0x01
T3_asi_reg_rd_212:
	mov	0x22, %r14
	.word 0xf8db89e0  ! 4340: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_3_348:
	setx	0x41030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_349:
	setx	0x41020f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_350:
	setx	0x420137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4240000  ! 4351: STW_R	stw	%r26, [%r16 + %r0]
T3_asi_reg_wr_165:
	mov	0x26, %r14
	.word 0xf0f389e0  ! 4353: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_3_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_331), 16, 16)) -> intp(3, 0, 1d)
iob_intr_3_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_332), 16, 16)) -> intp(3, 0, 28)
iob_intr_3_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_333), 16, 16)) -> intp(3, 0, 19)
	.word 0xf8ac4020  ! 4363: STBA_R	stba	%r28, [%r17 + %r0] 0x01
	.word 0xf034e0a3  ! 4366: STH_I	sth	%r24, [%r19 + 0x00a3]
iob_intr_3_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_334), 16, 16)) -> intp(3, 0, 17)
	.word 0xfa2d2082  ! 4372: STB_I	stb	%r29, [%r20 + 0x0082]
cpu_intr_3_351:
	setx	0x40023d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_335), 16, 16)) -> intp(3, 0, 5)
	.word 0xfef5a1e2  ! 4381: STXA_I	stxa	%r31, [%r22 + 0x01e2] %asi
iob_intr_3_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_336), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_352:
	setx	0x400203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe744000  ! 4385: STX_R	stx	%r31, [%r17 + %r0]
	.word 0xf8b4c020  ! 4386: STHA_R	stha	%r28, [%r19 + %r0] 0x01
	.word 0xfa2c0000  ! 4387: STB_R	stb	%r29, [%r16 + %r0]
	.word 0xfea4a0b4  ! 4389: STWA_I	stwa	%r31, [%r18 + 0x00b4] %asi
T3_asi_reg_rd_213:
	mov	0x15, %r14
	.word 0xf6db8400  ! 4390: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_3_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_337), 16, 16)) -> intp(3, 0, 31)
	.word 0xfef4a151  ! 4393: STXA_I	stxa	%r31, [%r18 + 0x0151] %asi
	.word 0xf225c000  ! 4395: STW_R	stw	%r25, [%r23 + %r0]
iob_intr_3_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_338), 16, 16)) -> intp(3, 0, 27)
	.word 0xbf641800  ! 4398: MOVcc_R	<illegal instruction>
	ta	T_CHANGE_NONHPRIV
iob_intr_3_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_339), 16, 16)) -> intp(3, 0, 9)
cpu_intr_3_353:
	setx	0x43023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf2358000  ! 4407: STH_R	sth	%r25, [%r22 + %r0]
	.word 0xfc744000  ! 4408: STX_R	stx	%r30, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
iob_intr_3_340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_340), 16, 16)) -> intp(3, 0, 10)
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x8198285a  ! 4416: WRHPR_HPSTATE_I	wrhpr	%r0, 0x085a, %hpstate
cpu_intr_3_354:
	setx	0x400210, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_166:
	mov	0x1, %r14
	.word 0xf8f38e40  ! 4419: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf624e027  ! 4421: STW_I	stw	%r27, [%r19 + 0x0027]
	.word 0xf234e03d  ! 4422: STH_I	sth	%r25, [%r19 + 0x003d]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_341), 16, 16)) -> intp(3, 0, 18)
	.word 0xb42d0000  ! 4428: ANDN_R	andn 	%r20, %r0, %r26
T3_asi_reg_wr_167:
	mov	0x3c7, %r14
	.word 0xfaf389e0  ! 4429: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf6248000  ! 4430: STW_R	stw	%r27, [%r18 + %r0]
	.word 0xf0a50020  ! 4432: STWA_R	stwa	%r24, [%r20 + %r0] 0x01
	.word 0xf4b4a0f2  ! 4434: STHA_I	stha	%r26, [%r18 + 0x00f2] %asi
	.word 0xf4748000  ! 4435: STX_R	stx	%r26, [%r18 + %r0]
	.word 0xf8f4a123  ! 4436: STXA_I	stxa	%r28, [%r18 + 0x0123] %asi
iob_intr_3_342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_342), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf0f560a2  ! 4442: STXA_I	stxa	%r24, [%r21 + 0x00a2] %asi
T3_asi_reg_wr_168:
	mov	0x26, %r14
	.word 0xf6f38e40  ! 4443: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_3_343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_343), 16, 16)) -> intp(3, 0, 7)
cpu_intr_3_355:
	setx	0x420011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa34e02e  ! 4446: STH_I	sth	%r29, [%r19 + 0x002e]
	.word 0xf0a460cb  ! 4450: STWA_I	stwa	%r24, [%r17 + 0x00cb] %asi
	.word 0xfaad214f  ! 4451: STBA_I	stba	%r29, [%r20 + 0x014f] %asi
T3_asi_reg_rd_214:
	mov	0x3c7, %r14
	.word 0xfcdb89e0  ! 4452: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T3_asi_reg_rd_215:
	mov	0x1d, %r14
	.word 0xf4db8e40  ! 4455: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_356:
	setx	0x40021e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_169:
	mov	0xb, %r14
	.word 0xfaf389e0  ! 4460: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf82d0000  ! 4461: STB_R	stb	%r28, [%r20 + %r0]
iob_intr_3_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_344), 16, 16)) -> intp(3, 0, 2d)
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_357:
	setx	0x430007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b5e086  ! 4468: STHA_I	stha	%r25, [%r23 + 0x0086] %asi
T3_asi_reg_rd_216:
	mov	0x2a, %r14
	.word 0xfadb8e60  ! 4469: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf0a5608d  ! 4470: STWA_I	stwa	%r24, [%r21 + 0x008d] %asi
iob_intr_3_345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_345), 16, 16)) -> intp(3, 0, c)
	.word 0xf2b5a053  ! 4473: STHA_I	stha	%r25, [%r22 + 0x0053] %asi
	.word 0xfa35c000  ! 4474: STH_R	sth	%r29, [%r23 + %r0]
iob_intr_3_346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_346), 16, 16)) -> intp(3, 0, f)
iob_intr_3_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_347), 16, 16)) -> intp(3, 0, 0)
	.word 0xf42ca076  ! 4480: STB_I	stb	%r26, [%r18 + 0x0076]
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983b52  ! 4481: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b52, %hpstate
cpu_intr_3_358:
	setx	0x410100, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
iob_intr_3_348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_348), 16, 16)) -> intp(3, 0, 34)
	.word 0xf0b48020  ! 4486: STHA_R	stha	%r24, [%r18 + %r0] 0x01
T3_asi_reg_wr_170:
	mov	0x11, %r14
	.word 0xf2f38400  ! 4489: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_3_349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_349), 16, 16)) -> intp(3, 0, 3c)
	ta	T_CHANGE_HPRIV
iob_intr_3_350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_350), 16, 16)) -> intp(3, 0, 13)
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982840  ! 4495: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0840, %hpstate
T3_asi_reg_rd_217:
	mov	0xb, %r14
	.word 0xf2db8e40  ! 4498: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfa34a106  ! 4499: STH_I	sth	%r29, [%r18 + 0x0106]
	.word 0xf0b5e158  ! 4500: STHA_I	stha	%r24, [%r23 + 0x0158] %asi
	.word 0xbf34d000  ! 4505: SRLX_R	srlx	%r19, %r0, %r31
	.word 0xf4a54020  ! 4509: STWA_R	stwa	%r26, [%r21 + %r0] 0x01
T3_asi_reg_wr_171:
	mov	0x25, %r14
	.word 0xf0f384a0  ! 4511: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T3_asi_reg_wr_172:
	mov	0x3, %r14
	.word 0xf4f384a0  ! 4512: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T3_asi_reg_wr_173:
	mov	0x8, %r14
	.word 0xf4f38e40  ! 4514: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T3_asi_reg_rd_218:
	mov	0x1b, %r14
	.word 0xf0db8e40  ! 4515: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf475c000  ! 4518: STX_R	stx	%r26, [%r23 + %r0]
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983bca  ! 4522: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bca, %hpstate
	.word 0xfa358000  ! 4524: STH_R	sth	%r29, [%r22 + %r0]
cpu_intr_3_359:
	setx	0x41023a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_351), 16, 16)) -> intp(3, 0, 24)
	.word 0xf42ce0ee  ! 4533: STB_I	stb	%r26, [%r19 + 0x00ee]
iob_intr_3_352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_352), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf4a521db  ! 4537: STWA_I	stwa	%r26, [%r20 + 0x01db] %asi
	.word 0xf2a48020  ! 4538: STWA_R	stwa	%r25, [%r18 + %r0] 0x01
	.word 0xf2752053  ! 4539: STX_I	stx	%r25, [%r20 + 0x0053]
T3_asi_reg_wr_174:
	mov	0x1c, %r14
	.word 0xf0f38e40  ! 4540: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf8f5a027  ! 4548: STXA_I	stxa	%r28, [%r22 + 0x0027] %asi
T3_asi_reg_rd_219:
	mov	0x3c8, %r14
	.word 0xf6db8e80  ! 4550: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_3_360:
	setx	0x41032e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_361:
	setx	0x420223, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_175:
	mov	0x37, %r14
	.word 0xf2f38e40  ! 4556: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf6b4a1ff  ! 4558: STHA_I	stha	%r27, [%r18 + 0x01ff] %asi
T3_asi_reg_wr_176:
	mov	0x3c6, %r14
	.word 0xfcf38400  ! 4559: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_3_362:
	setx	0x43030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb7ce401  ! 4565: MOVR_I	movre	%r19, 0x1, %r29
T3_asi_reg_rd_220:
	mov	0x10, %r14
	.word 0xf8db8e60  ! 4567: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb43d4000  ! 4569: XNOR_R	xnor 	%r21, %r0, %r26
T3_asi_reg_wr_177:
	mov	0x33, %r14
	.word 0xfef38e40  ! 4571: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_rd_221:
	mov	0xe, %r14
	.word 0xfedb8e60  ! 4572: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_3_353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_353), 16, 16)) -> intp(3, 0, 20)
	.word 0xfc24c000  ! 4575: STW_R	stw	%r30, [%r19 + %r0]
	.word 0xfaacc020  ! 4577: STBA_R	stba	%r29, [%r19 + %r0] 0x01
	.word 0xb6844000  ! 4579: ADDcc_R	addcc 	%r17, %r0, %r27
	.word 0xf6a44020  ! 4580: STWA_R	stwa	%r27, [%r17 + %r0] 0x01
cpu_intr_3_363:
	setx	0x42002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc2c20db  ! 4582: ANDN_I	andn 	%r16, 0x00db, %r30
	.word 0xf225c000  ! 4583: STW_R	stw	%r25, [%r23 + %r0]
iob_intr_3_354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_354), 16, 16)) -> intp(3, 0, 37)
	.word 0xb005a054  ! 4586: ADD_I	add 	%r22, 0x0054, %r24
	ta	T_CHANGE_HPRIV
	.word 0xf8348000  ! 4589: STH_R	sth	%r28, [%r18 + %r0]
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982f88  ! 4590: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f88, %hpstate
iob_intr_3_355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_355), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_wr_178:
	mov	0x2b, %r14
	.word 0xfaf38e60  ! 4596: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_3_356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_356), 16, 16)) -> intp(3, 0, f)
	.word 0xf4b50020  ! 4598: STHA_R	stha	%r26, [%r20 + %r0] 0x01
iob_intr_3_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_357), 16, 16)) -> intp(3, 0, 30)
	.word 0xbab42029  ! 4601: ORNcc_I	orncc 	%r16, 0x0029, %r29
cpu_intr_3_364:
	setx	0x410112, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_365:
	setx	0x43021c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_222:
	mov	0xb, %r14
	.word 0xf2db8e60  ! 4607: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_3_366:
	setx	0x460034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcac0020  ! 4612: STBA_R	stba	%r30, [%r16 + %r0] 0x01
	.word 0xfe2c2047  ! 4613: STB_I	stb	%r31, [%r16 + 0x0047]
T3_asi_reg_rd_223:
	mov	0x3c0, %r14
	.word 0xf8db8e80  ! 4616: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbd7d0400  ! 4617: MOVR_R	movre	%r20, %r0, %r30
iob_intr_3_358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_358), 16, 16)) -> intp(3, 0, 2b)
	.word 0xbc14e13b  ! 4619: OR_I	or 	%r19, 0x013b, %r30
cpu_intr_3_367:
	setx	0x45013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_179:
	mov	0xf, %r14
	.word 0xf0f389e0  ! 4622: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T3_asi_reg_rd_224:
	mov	0x5, %r14
	.word 0xf0db89e0  ! 4623: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_3_359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_359), 16, 16)) -> intp(3, 0, 4)
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982b50  ! 4626: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b50, %hpstate
	.word 0xb73c1000  ! 4628: SRAX_R	srax	%r16, %r0, %r27
	.word 0xb805c000  ! 4629: ADD_R	add 	%r23, %r0, %r28
	.word 0xf874a13c  ! 4632: STX_I	stx	%r28, [%r18 + 0x013c]
T3_asi_reg_wr_180:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 4633: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb8bc215e  ! 4636: XNORcc_I	xnorcc 	%r16, 0x015e, %r28
	.word 0xf4acc020  ! 4638: STBA_R	stba	%r26, [%r19 + %r0] 0x01
	.word 0xf6adc020  ! 4639: STBA_R	stba	%r27, [%r23 + %r0] 0x01
cpu_intr_3_368:
	setx	0x440313, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xfc74e1cc  ! 4644: STX_I	stx	%r30, [%r19 + 0x01cc]
	.word 0xf82c615b  ! 4645: STB_I	stb	%r28, [%r17 + 0x015b]
	.word 0xf2a5a18f  ! 4646: STWA_I	stwa	%r25, [%r22 + 0x018f] %asi
	.word 0xfaf56112  ! 4648: STXA_I	stxa	%r29, [%r21 + 0x0112] %asi
	.word 0xfab48020  ! 4651: STHA_R	stha	%r29, [%r18 + %r0] 0x01
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982ac2  ! 4655: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac2, %hpstate
	.word 0xf8b48020  ! 4656: STHA_R	stha	%r28, [%r18 + %r0] 0x01
cpu_intr_3_369:
	setx	0x440315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab4a009  ! 4659: STHA_I	stha	%r29, [%r18 + 0x0009] %asi
T3_asi_reg_wr_181:
	mov	0x3c3, %r14
	.word 0xfaf384a0  ! 4660: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_3_360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_360), 16, 16)) -> intp(3, 0, 2f)
cpu_intr_3_370:
	setx	0x44031b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_182:
	mov	0x2, %r14
	.word 0xf2f38e60  ! 4665: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T3_asi_reg_rd_225:
	mov	0x3c8, %r14
	.word 0xf6db8e40  ! 4666: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_rd_226:
	mov	0x3c2, %r14
	.word 0xf4db89e0  ! 4673: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf4f4e0d4  ! 4674: STXA_I	stxa	%r26, [%r19 + 0x00d4] %asi
	.word 0xfe35a00d  ! 4677: STH_I	sth	%r31, [%r22 + 0x000d]
	.word 0xfab40020  ! 4678: STHA_R	stha	%r29, [%r16 + %r0] 0x01
iob_intr_3_361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_361), 16, 16)) -> intp(3, 0, 20)
cpu_intr_3_371:
	setx	0x450326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8748000  ! 4681: STX_R	stx	%r28, [%r18 + %r0]
T3_asi_reg_rd_227:
	mov	0x3c6, %r14
	.word 0xf0db8e40  ! 4683: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfca4a07c  ! 4684: STWA_I	stwa	%r30, [%r18 + 0x007c] %asi
iob_intr_3_362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_362), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_372:
	setx	0x450118, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983a88  ! 4689: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a88, %hpstate
	.word 0xb62da0a1  ! 4695: ANDN_I	andn 	%r22, 0x00a1, %r27
cpu_intr_3_373:
	setx	0x20239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a48020  ! 4697: STWA_R	stwa	%r28, [%r18 + %r0] 0x01
	.word 0xfcad4020  ! 4698: STBA_R	stba	%r30, [%r21 + %r0] 0x01
	.word 0xb6c5608e  ! 4699: ADDCcc_I	addccc 	%r21, 0x008e, %r27
	.word 0xb4ad0000  ! 4700: ANDNcc_R	andncc 	%r20, %r0, %r26
	.word 0xb57c4400  ! 4701: MOVR_R	movre	%r17, %r0, %r26
	.word 0xf02cc000  ! 4705: STB_R	stb	%r24, [%r19 + %r0]
T3_asi_reg_rd_228:
	mov	0x2d, %r14
	.word 0xf0db89e0  ! 4706: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xfcacc020  ! 4710: STBA_R	stba	%r30, [%r19 + %r0] 0x01
	.word 0xf874219a  ! 4714: STX_I	stx	%r28, [%r16 + 0x019a]
	.word 0xb2948000  ! 4715: ORcc_R	orcc 	%r18, %r0, %r25
	.word 0xbc144000  ! 4719: OR_R	or 	%r17, %r0, %r30
T3_asi_reg_rd_229:
	mov	0x1b, %r14
	.word 0xfcdb8e60  ! 4720: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xfe350000  ! 4721: STH_R	sth	%r31, [%r20 + %r0]
T3_asi_reg_wr_183:
	mov	0x3c2, %r14
	.word 0xfef38e60  ! 4723: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf8754000  ! 4726: STX_R	stx	%r28, [%r21 + %r0]
	.word 0xf6ad606e  ! 4727: STBA_I	stba	%r27, [%r21 + 0x006e] %asi
cpu_intr_3_374:
	setx	0x440006, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_375:
	setx	0x440218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8354000  ! 4735: STH_R	sth	%r28, [%r21 + %r0]
	ta	T_CHANGE_NONHPRIV
	.word 0xfa2ce199  ! 4740: STB_I	stb	%r29, [%r19 + 0x0199]
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983842  ! 4742: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1842, %hpstate
	.word 0xf034c000  ! 4744: STH_R	sth	%r24, [%r19 + %r0]
	.word 0xfaad4020  ! 4746: STBA_R	stba	%r29, [%r21 + %r0] 0x01
	.word 0xf02ca0d2  ! 4749: STB_I	stb	%r24, [%r18 + 0x00d2]
	.word 0xf8ac8020  ! 4750: STBA_R	stba	%r28, [%r18 + %r0] 0x01
T3_asi_reg_wr_184:
	mov	0x35, %r14
	.word 0xf4f38e80  ! 4752: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_3_363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_363), 16, 16)) -> intp(3, 0, 3a)
iob_intr_3_364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_364), 16, 16)) -> intp(3, 0, 30)
T3_asi_reg_wr_185:
	mov	0x3c8, %r14
	.word 0xf4f38e40  ! 4761: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbaa420b6  ! 4765: SUBcc_I	subcc 	%r16, 0x00b6, %r29
T3_asi_reg_wr_186:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 4766: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf6b52160  ! 4767: STHA_I	stha	%r27, [%r20 + 0x0160] %asi
	.word 0xfea5c020  ! 4768: STWA_R	stwa	%r31, [%r23 + %r0] 0x01
	.word 0xb4ad0000  ! 4769: ANDNcc_R	andncc 	%r20, %r0, %r26
T3_asi_reg_rd_230:
	mov	0x3c4, %r14
	.word 0xfedb8e60  ! 4775: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_3_376:
	setx	0x47001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaac21d3  ! 4784: STBA_I	stba	%r29, [%r16 + 0x01d3] %asi
	.word 0xf674a110  ! 4785: STX_I	stx	%r27, [%r18 + 0x0110]
iob_intr_3_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_365), 16, 16)) -> intp(3, 0, 16)
T3_asi_reg_wr_187:
	mov	0x1, %r14
	.word 0xfcf389e0  ! 4787: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_3_377:
	setx	0x450205, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_188:
	mov	0x3c0, %r14
	.word 0xf2f384a0  ! 4789: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T3_asi_reg_rd_231:
	mov	0x5, %r14
	.word 0xf8db8400  ! 4790: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_3_378:
	setx	0x440329, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_366), 16, 16)) -> intp(3, 0, 23)
cpu_intr_3_379:
	setx	0x460124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2950000  ! 4797: ORcc_R	orcc 	%r20, %r0, %r25
	.word 0xf4b5a1d5  ! 4800: STHA_I	stha	%r26, [%r22 + 0x01d5] %asi
	.word 0xfca58020  ! 4801: STWA_R	stwa	%r30, [%r22 + %r0] 0x01
iob_intr_3_367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_367), 16, 16)) -> intp(3, 0, 3d)
	.word 0xfaa5e1e8  ! 4804: STWA_I	stwa	%r29, [%r23 + 0x01e8] %asi
iob_intr_3_368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_368), 16, 16)) -> intp(3, 0, 39)
	.word 0xf824a121  ! 4807: STW_I	stw	%r28, [%r18 + 0x0121]
T3_asi_reg_rd_232:
	mov	0x6, %r14
	.word 0xfcdb8e60  ! 4810: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xba94e050  ! 4812: ORcc_I	orcc 	%r19, 0x0050, %r29
iob_intr_3_369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_369), 16, 16)) -> intp(3, 0, d)
T3_asi_reg_wr_189:
	mov	0x2e, %r14
	.word 0xfcf38e40  ! 4815: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf675a019  ! 4821: STX_I	stx	%r27, [%r22 + 0x0019]
	.word 0xf4240000  ! 4822: STW_R	stw	%r26, [%r16 + %r0]
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983b18  ! 4823: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b18, %hpstate
	.word 0xb53c5000  ! 4824: SRAX_R	srax	%r17, %r0, %r26
T3_asi_reg_wr_190:
	mov	0xe, %r14
	.word 0xfef389e0  ! 4825: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_3_370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_370), 16, 16)) -> intp(3, 0, 20)
iob_intr_3_371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_371), 16, 16)) -> intp(3, 0, 1c)
	.word 0xf42d4000  ! 4829: STB_R	stb	%r26, [%r21 + %r0]
	.word 0xf22ca01e  ! 4830: STB_I	stb	%r25, [%r18 + 0x001e]
T3_asi_reg_rd_233:
	mov	0x3c6, %r14
	.word 0xf0db8e80  ! 4831: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_3_372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_372), 16, 16)) -> intp(3, 0, 8)
	.word 0xf4a4c020  ! 4834: STWA_R	stwa	%r26, [%r19 + %r0] 0x01
	.word 0xfaa54020  ! 4835: STWA_R	stwa	%r29, [%r21 + %r0] 0x01
	.word 0xf434a070  ! 4836: STH_I	sth	%r26, [%r18 + 0x0070]
	ta	T_CHANGE_HPRIV
	.word 0xb8bcc000  ! 4839: XNORcc_R	xnorcc 	%r19, %r0, %r28
iob_intr_3_373:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_373), 16, 16)) -> intp(3, 0, 2a)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfca5603b  ! 4845: STWA_I	stwa	%r30, [%r21 + 0x003b] %asi
	.word 0xf2f4e0b3  ! 4847: STXA_I	stxa	%r25, [%r19 + 0x00b3] %asi
	.word 0xf6354000  ! 4848: STH_R	sth	%r27, [%r21 + %r0]
	.word 0xf0b5602b  ! 4849: STHA_I	stha	%r24, [%r21 + 0x002b] %asi
	.word 0xf6250000  ! 4853: STW_R	stw	%r27, [%r20 + %r0]
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_234:
	mov	0x35, %r14
	.word 0xf0db8e60  ! 4855: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	ta	T_CHANGE_TO_TL0
	.word 0xbb2cf001  ! 4859: SLLX_I	sllx	%r19, 0x0001, %r29
	.word 0xfca420d7  ! 4860: STWA_I	stwa	%r30, [%r16 + 0x00d7] %asi
	.word 0xf82c4000  ! 4861: STB_R	stb	%r28, [%r17 + %r0]
iob_intr_3_374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_374), 16, 16)) -> intp(3, 0, 19)
	.word 0xfab421a8  ! 4863: STHA_I	stha	%r29, [%r16 + 0x01a8] %asi
	.word 0xb935b001  ! 4864: SRLX_I	srlx	%r22, 0x0001, %r28
iob_intr_3_375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_375), 16, 16)) -> intp(3, 0, 33)
	.word 0xf2b44020  ! 4869: STHA_R	stha	%r25, [%r17 + %r0] 0x01
cpu_intr_3_380:
	setx	0x440238, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_376), 16, 16)) -> intp(3, 0, 1)
	.word 0xfab5e0b6  ! 4875: STHA_I	stha	%r29, [%r23 + 0x00b6] %asi
	.word 0xf235206d  ! 4879: STH_I	sth	%r25, [%r20 + 0x006d]
	.word 0xf8ac609d  ! 4880: STBA_I	stba	%r28, [%r17 + 0x009d] %asi
iob_intr_3_377:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_377), 16, 16)) -> intp(3, 0, d)
	.word 0xfca5c020  ! 4882: STWA_R	stwa	%r30, [%r23 + %r0] 0x01
T3_asi_reg_rd_235:
	mov	0xc, %r14
	.word 0xf6db84a0  ! 4886: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbd35b001  ! 4890: SRLX_I	srlx	%r22, 0x0001, %r30
iob_intr_3_378:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_378), 16, 16)) -> intp(3, 0, 32)
	.word 0xb83d4000  ! 4892: XNOR_R	xnor 	%r21, %r0, %r28
	ta	T_CHANGE_TO_TL0
cpu_intr_3_381:
	setx	0x45003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc250000  ! 4905: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xfaac61a5  ! 4906: STBA_I	stba	%r29, [%r17 + 0x01a5] %asi
	ta	T_CHANGE_TO_TL1
	.word 0xfe348000  ! 4912: STH_R	sth	%r31, [%r18 + %r0]
	.word 0xba3da19e  ! 4915: XNOR_I	xnor 	%r22, 0x019e, %r29
cpu_intr_3_382:
	setx	0x460115, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_379:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_379), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_380), 16, 16)) -> intp(3, 0, 25)
	.word 0xf4ac0020  ! 4920: STBA_R	stba	%r26, [%r16 + %r0] 0x01
	.word 0xfcadc020  ! 4923: STBA_R	stba	%r30, [%r23 + %r0] 0x01
	.word 0xf82c2119  ! 4924: STB_I	stb	%r28, [%r16 + 0x0119]
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x8198299a  ! 4926: WRHPR_HPSTATE_I	wrhpr	%r0, 0x099a, %hpstate
T3_asi_reg_wr_191:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 4928: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_3_381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_381), 16, 16)) -> intp(3, 0, 29)
cpu_intr_3_383:
	setx	0x460202, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_384:
	setx	0x44021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2750000  ! 4936: STX_R	stx	%r25, [%r20 + %r0]
T3_asi_reg_rd_236:
	mov	0x25, %r14
	.word 0xf8db8e40  ! 4938: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T3_asi_reg_wr_192:
	mov	0x3c6, %r14
	.word 0xf6f384a0  ! 4941: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
cpu_intr_3_385:
	setx	0x47030c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_382:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_382), 16, 16)) -> intp(3, 0, 16)
T3_asi_reg_wr_193:
	mov	0x1, %r14
	.word 0xfcf38e40  ! 4947: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
iob_intr_3_383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_383), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_wr_194:
	mov	0x36, %r14
	.word 0xf0f38e40  ! 4952: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf6750000  ! 4953: STX_R	stx	%r27, [%r20 + %r0]
	.word 0xfc35213a  ! 4958: STH_I	sth	%r30, [%r20 + 0x013a]
T3_asi_reg_rd_237:
	mov	0x17, %r14
	.word 0xf8db8400  ! 4959: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T3_asi_reg_wr_195:
	mov	0x2d, %r14
	.word 0xf6f38e80  ! 4961: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbe84c000  ! 4962: ADDcc_R	addcc 	%r19, %r0, %r31
T3_asi_reg_rd_238:
	mov	0x1c, %r14
	.word 0xf2db8e40  ! 4964: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_3_386:
	setx	0x44022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b4c020  ! 4967: STHA_R	stha	%r26, [%r19 + %r0] 0x01
T3_asi_reg_rd_239:
	mov	0x3c6, %r14
	.word 0xfedb8e80  ! 4970: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xfab50020  ! 4972: STHA_R	stha	%r29, [%r20 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
	.word 0xbcb48000  ! 4975: SUBCcc_R	orncc 	%r18, %r0, %r30
T3_asi_reg_wr_196:
	mov	0x1c, %r14
	.word 0xf2f38e80  ! 4977: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
cpu_intr_3_387:
	setx	0x460232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb40c2020  ! 4983: AND_I	and 	%r16, 0x0020, %r26
	.word 0xfc244000  ! 4986: STW_R	stw	%r30, [%r17 + %r0]
	.word 0xf0a5c020  ! 4987: STWA_R	stwa	%r24, [%r23 + %r0] 0x01
T3_asi_reg_rd_240:
	mov	0x3c1, %r14
	.word 0xf4db8e80  ! 4988: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	ta	T_CHANGE_TO_TL1
cpu_intr_3_388:
	setx	0x450308, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_384:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_384), 16, 16)) -> intp(3, 0, 1e)
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_197:
	mov	0x15, %r14
	.word 0xfcf38e40  ! 4997: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
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
cpu_intr_2_0:
	setx	0x18002f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_0), 16, 16)) -> intp(2, 0, 3d)
T2_asi_reg_rd_0:
	mov	0x25, %r14
	.word 0xfcdb8e80  ! 3: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_1), 16, 16)) -> intp(2, 0, 39)
	.word 0xf654a17d  ! 9: LDSH_I	ldsh	[%r18 + 0x017d], %r27
	.word 0xfe0cc000  ! 10: LDUB_R	ldub	[%r19 + %r0], %r31
	.word 0xfc95e058  ! 12: LDUHA_I	lduha	[%r23, + 0x0058] %asi, %r30
	.word 0xf88ce059  ! 13: LDUBA_I	lduba	[%r19, + 0x0059] %asi, %r28
	.word 0xf2c5a0de  ! 14: LDSWA_I	ldswa	[%r22, + 0x00de] %asi, %r25
iob_intr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_2), 16, 16)) -> intp(2, 0, 17)
iob_intr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_3), 16, 16)) -> intp(2, 0, 11)
iob_intr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_4), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf8dca0ea  ! 22: LDXA_I	ldxa	[%r18, + 0x00ea] %asi, %r28
T2_asi_reg_wr_0:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 23: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_2_1:
	setx	0x1d0003, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_1:
	mov	0x3c2, %r14
	.word 0xf0f384a0  ! 25: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xfa5d2006  ! 27: LDX_I	ldx	[%r20 + 0x0006], %r29
	.word 0xfed56182  ! 28: LDSHA_I	ldsha	[%r21, + 0x0182] %asi, %r31
T2_asi_reg_rd_1:
	mov	0x3c8, %r14
	.word 0xf8db8e60  ! 29: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb37dc400  ! 31: MOVR_R	movre	%r23, %r0, %r25
T2_asi_reg_rd_2:
	mov	0x0, %r14
	.word 0xf4db84a0  ! 32: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_2_2:
	setx	0x1f001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_5), 16, 16)) -> intp(2, 0, 17)
	.word 0xf4142033  ! 42: LDUH_I	lduh	[%r16 + 0x0033], %r26
	.word 0xf0c5c020  ! 43: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r24
	.word 0xf6c40020  ! 44: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r27
iob_intr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_6), 16, 16)) -> intp(2, 0, 34)
T2_asi_reg_rd_3:
	mov	0x0, %r14
	.word 0xf4db8e40  ! 46: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_7), 16, 16)) -> intp(2, 0, 11)
	.word 0xf094a006  ! 48: LDUHA_I	lduha	[%r18, + 0x0006] %asi, %r24
	ta	T_CHANGE_TO_TL1
	.word 0xbcbd20d9  ! 52: XNORcc_I	xnorcc 	%r20, 0x00d9, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf2dd21ad  ! 56: LDXA_I	ldxa	[%r20, + 0x01ad] %asi, %r25
cpu_intr_2_3:
	setx	0x1c0132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfad520b7  ! 61: LDSHA_I	ldsha	[%r20, + 0x00b7] %asi, %r29
T2_asi_reg_wr_2:
	mov	0x2d, %r14
	.word 0xf2f38e60  ! 62: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T2_asi_reg_wr_3:
	mov	0x24, %r14
	.word 0xf0f38e40  ! 66: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_wr_4:
	mov	0x3c4, %r14
	.word 0xfcf38400  ! 67: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xfe14a174  ! 69: LDUH_I	lduh	[%r18 + 0x0174], %r31
	ta	T_CHANGE_HPRIV
	.word 0xf08c0020  ! 72: LDUBA_R	lduba	[%r16, %r0] 0x01, %r24
	.word 0xb4344000  ! 75: ORN_R	orn 	%r17, %r0, %r26
iob_intr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_8), 16, 16)) -> intp(2, 0, 3f)
T2_asi_reg_rd_4:
	mov	0xf, %r14
	.word 0xf0db8e80  ! 81: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xfe5561c5  ! 82: LDSH_I	ldsh	[%r21 + 0x01c5], %r31
cpu_intr_2_4:
	setx	0x1c0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe046196  ! 84: LDUW_I	lduw	[%r17 + 0x0196], %r31
T2_asi_reg_rd_5:
	mov	0x10, %r14
	.word 0xfedb84a0  ! 85: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_9), 16, 16)) -> intp(2, 0, 1e)
	.word 0xb2bd8000  ! 90: XNORcc_R	xnorcc 	%r22, %r0, %r25
	.word 0xfcd5e1be  ! 92: LDSHA_I	ldsha	[%r23, + 0x01be] %asi, %r30
T2_asi_reg_wr_5:
	mov	0x33, %r14
	.word 0xf6f384a0  ! 93: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_2_5:
	setx	0x1c0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf294a097  ! 96: LDUHA_I	lduha	[%r18, + 0x0097] %asi, %r25
	ta	T_CHANGE_TO_TL1
	.word 0xb134d000  ! 99: SRLX_R	srlx	%r19, %r0, %r24
T2_asi_reg_rd_6:
	mov	0x16, %r14
	.word 0xfcdb8e80  ! 103: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T2_asi_reg_rd_7:
	mov	0x3, %r14
	.word 0xfadb89e0  ! 104: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xfec5c020  ! 105: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r31
T2_asi_reg_wr_6:
	mov	0x28, %r14
	.word 0xfef389e0  ! 106: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf0c54020  ! 109: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r24
	.word 0xf0c420cd  ! 111: LDSWA_I	ldswa	[%r16, + 0x00cd] %asi, %r24
T2_asi_reg_wr_7:
	mov	0x35, %r14
	.word 0xf6f38e40  ! 113: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_10), 16, 16)) -> intp(2, 0, 1b)
	.word 0xbc348000  ! 116: SUBC_R	orn 	%r18, %r0, %r30
	.word 0xf845a043  ! 118: LDSW_I	ldsw	[%r22 + 0x0043], %r28
	.word 0xb2358000  ! 121: SUBC_R	orn 	%r22, %r0, %r25
	.word 0xb28de1f7  ! 122: ANDcc_I	andcc 	%r23, 0x01f7, %r25
T2_asi_reg_rd_8:
	mov	0x28, %r14
	.word 0xf6db8400  ! 123: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xfc15a168  ! 125: LDUH_I	lduh	[%r22 + 0x0168], %r30
T2_asi_reg_wr_8:
	mov	0x3c1, %r14
	.word 0xf2f38e40  ! 126: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfa84e1c4  ! 131: LDUWA_I	lduwa	[%r19, + 0x01c4] %asi, %r29
	.word 0xfa0cc000  ! 132: LDUB_R	ldub	[%r19 + %r0], %r29
	.word 0xf88ca0c3  ! 135: LDUBA_I	lduba	[%r18, + 0x00c3] %asi, %r28
	.word 0x8394a0a8  ! 136: WRPR_TNPC_I	wrpr	%r18, 0x00a8, %tnpc
T2_asi_reg_wr_9:
	mov	0x26, %r14
	.word 0xf2f38400  ! 137: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983f4a  ! 139: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f4a, %hpstate
cpu_intr_2_6:
	setx	0x1d0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5353001  ! 142: SRLX_I	srlx	%r20, 0x0001, %r26
	.word 0xfcdce11e  ! 143: LDXA_I	ldxa	[%r19, + 0x011e] %asi, %r30
T2_asi_reg_wr_10:
	mov	0x34, %r14
	.word 0xfaf38e60  ! 144: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf05d2135  ! 150: LDX_I	ldx	[%r20 + 0x0135], %r24
T2_asi_reg_wr_11:
	mov	0x3c0, %r14
	.word 0xfaf38e40  ! 151: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_11), 16, 16)) -> intp(2, 0, 14)
	.word 0xf2954020  ! 155: LDUHA_R	lduha	[%r21, %r0] 0x01, %r25
	.word 0xf0cd4020  ! 156: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r24
iob_intr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_12), 16, 16)) -> intp(2, 0, 10)
	.word 0xfad4c020  ! 161: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r29
T2_asi_reg_wr_12:
	mov	0x2e, %r14
	.word 0xf6f389e0  ! 162: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf4cc0020  ! 163: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r26
	.word 0xf6c40020  ! 167: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r27
cpu_intr_2_7:
	setx	0x1c0115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb353001  ! 172: SRLX_I	srlx	%r20, 0x0001, %r29
cpu_intr_2_8:
	setx	0x1f0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf84ce1f9  ! 177: LDSB_I	ldsb	[%r19 + 0x01f9], %r28
iob_intr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_13), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_rd_9:
	mov	0xd, %r14
	.word 0xf4db84a0  ! 182: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb004c000  ! 183: ADD_R	add 	%r19, %r0, %r24
	.word 0xf604e14d  ! 185: LDUW_I	lduw	[%r19 + 0x014d], %r27
	.word 0xf6d4e186  ! 189: LDSHA_I	ldsha	[%r19, + 0x0186] %asi, %r27
T2_asi_reg_wr_13:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 192: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbd34e001  ! 193: SRL_I	srl 	%r19, 0x0001, %r30
	.word 0xf004a06e  ! 194: LDUW_I	lduw	[%r18 + 0x006e], %r24
iob_intr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_14), 16, 16)) -> intp(2, 0, 11)
	.word 0xb8258000  ! 200: SUB_R	sub 	%r22, %r0, %r28
	.word 0xbebc0000  ! 201: XNORcc_R	xnorcc 	%r16, %r0, %r31
iob_intr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_15), 16, 16)) -> intp(2, 0, 22)
iob_intr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_16), 16, 16)) -> intp(2, 0, 25)
	.word 0xfa444000  ! 207: LDSW_R	ldsw	[%r17 + %r0], %r29
	.word 0xb6c48000  ! 209: ADDCcc_R	addccc 	%r18, %r0, %r27
T2_asi_reg_rd_10:
	mov	0x8, %r14
	.word 0xf6db8e60  ! 213: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf0cdc020  ! 227: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r24
	.word 0xf0050000  ! 230: LDUW_R	lduw	[%r20 + %r0], %r24
	.word 0xf04da193  ! 231: LDSB_I	ldsb	[%r22 + 0x0193], %r24
iob_intr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_17), 16, 16)) -> intp(2, 0, 2d)
	ta	T_CHANGE_TO_TL0
iob_intr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_18), 16, 16)) -> intp(2, 0, 3a)
iob_intr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_19), 16, 16)) -> intp(2, 0, 39)
cpu_intr_2_9:
	setx	0x1e012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcd5c020  ! 242: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r30
T2_asi_reg_wr_14:
	mov	0x19, %r14
	.word 0xf8f38e60  ! 243: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_20), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf604c000  ! 245: LDUW_R	lduw	[%r19 + %r0], %r27
	.word 0xfa5c0000  ! 247: LDX_R	ldx	[%r16 + %r0], %r29
	.word 0xf8cd8020  ! 250: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r28
	.word 0xb68c8000  ! 252: ANDcc_R	andcc 	%r18, %r0, %r27
	.word 0xfa4c8000  ! 253: LDSB_R	ldsb	[%r18 + %r0], %r29
T2_asi_reg_wr_15:
	mov	0x29, %r14
	.word 0xf0f38e80  ! 254: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T2_asi_reg_rd_11:
	mov	0x10, %r14
	.word 0xf4db8400  ! 256: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_2_10:
	setx	0x1f0321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6154000  ! 259: OR_R	or 	%r21, %r0, %r27
cpu_intr_2_11:
	setx	0x1c0008, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_12:
	setx	0x1d0209, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_21), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_13:
	setx	0x1e000a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_14:
	setx	0x1c0319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa550000  ! 272: LDSH_R	ldsh	[%r20 + %r0], %r29
	.word 0xfa05c000  ! 273: LDUW_R	lduw	[%r23 + %r0], %r29
T2_asi_reg_rd_12:
	mov	0x15, %r14
	.word 0xf6db8e40  ! 275: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbc0c2031  ! 276: AND_I	and 	%r16, 0x0031, %r30
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982ac2  ! 278: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac2, %hpstate
cpu_intr_2_15:
	setx	0x1d0330, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_22), 16, 16)) -> intp(2, 0, 38)
	.word 0xf2540000  ! 284: LDSH_R	ldsh	[%r16 + %r0], %r25
T2_asi_reg_rd_13:
	mov	0x5, %r14
	.word 0xf6db89e0  ! 287: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xfa8420fb  ! 289: LDUWA_I	lduwa	[%r16, + 0x00fb] %asi, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_14:
	mov	0xa, %r14
	.word 0xfadb8e80  ! 294: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_2_16:
	setx	0x1e003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04dc000  ! 299: LDSB_R	ldsb	[%r23 + %r0], %r24
	.word 0xf0542148  ! 300: LDSH_I	ldsh	[%r16 + 0x0148], %r24
iob_intr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_23), 16, 16)) -> intp(2, 0, 3)
	.word 0xf4cce11e  ! 302: LDSBA_I	ldsba	[%r19, + 0x011e] %asi, %r26
	.word 0xf60c4000  ! 303: LDUB_R	ldub	[%r17 + %r0], %r27
iob_intr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_24), 16, 16)) -> intp(2, 0, d)
cpu_intr_2_17:
	setx	0x1c0129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60d4000  ! 306: LDUB_R	ldub	[%r21 + %r0], %r27
cpu_intr_2_18:
	setx	0x1e001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec4c020  ! 309: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r31
	.word 0xf254c000  ! 310: LDSH_R	ldsh	[%r19 + %r0], %r25
cpu_intr_2_19:
	setx	0x1e0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0958020  ! 312: LDUHA_R	lduha	[%r22, %r0] 0x01, %r24
	.word 0xfe8c0020  ! 317: LDUBA_R	lduba	[%r16, %r0] 0x01, %r31
T2_asi_reg_rd_15:
	mov	0x18, %r14
	.word 0xf6db8e40  ! 318: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf24de05d  ! 319: LDSB_I	ldsb	[%r23 + 0x005d], %r25
	.word 0xf04d6066  ! 321: LDSB_I	ldsb	[%r21 + 0x0066], %r24
T2_asi_reg_rd_16:
	mov	0x1c, %r14
	.word 0xf8db8e40  ! 323: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_2_20:
	setx	0x1d0301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60d8000  ! 329: LDUB_R	ldub	[%r22 + %r0], %r27
	.word 0xbf344000  ! 331: SRL_R	srl 	%r17, %r0, %r31
	ta	T_CHANGE_TO_TL1
	.word 0xf8c58020  ! 333: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r28
	.word 0xf2dc21c5  ! 335: LDXA_I	ldxa	[%r16, + 0x01c5] %asi, %r25
	.word 0xf0040000  ! 336: LDUW_R	lduw	[%r16 + %r0], %r24
cpu_intr_2_21:
	setx	0x1d0220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc15c000  ! 341: LDUH_R	lduh	[%r23 + %r0], %r30
cpu_intr_2_22:
	setx	0x1d021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc95e141  ! 344: LDUHA_I	lduha	[%r23, + 0x0141] %asi, %r30
iob_intr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_25), 16, 16)) -> intp(2, 0, 31)
	.word 0xfac4c020  ! 346: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r29
	.word 0xf6058000  ! 347: LDUW_R	lduw	[%r22 + %r0], %r27
	.word 0xfe048000  ! 348: LDUW_R	lduw	[%r18 + %r0], %r31
T2_asi_reg_wr_16:
	mov	0x2, %r14
	.word 0xfaf38400  ! 351: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf4454000  ! 353: LDSW_R	ldsw	[%r21 + %r0], %r26
	.word 0xf0850020  ! 356: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r24
T2_asi_reg_rd_17:
	mov	0x3c7, %r14
	.word 0xf2db8400  ! 357: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb024a0d1  ! 361: SUB_I	sub 	%r18, 0x00d1, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfe45c000  ! 364: LDSW_R	ldsw	[%r23 + %r0], %r31
T2_asi_reg_rd_18:
	mov	0x3c0, %r14
	.word 0xf8db84a0  ! 369: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_26), 16, 16)) -> intp(2, 0, 0)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_27), 16, 16)) -> intp(2, 0, 2a)
	.word 0xbe1461ce  ! 379: OR_I	or 	%r17, 0x01ce, %r31
iob_intr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_28), 16, 16)) -> intp(2, 0, 1d)
T2_asi_reg_wr_17:
	mov	0x23, %r14
	.word 0xf6f38e60  ! 381: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T2_asi_reg_rd_19:
	mov	0x2e, %r14
	.word 0xfcdb84a0  ! 385: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T2_asi_reg_wr_18:
	mov	0x3c1, %r14
	.word 0xf4f38e60  ! 386: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xfa542048  ! 387: LDSH_I	ldsh	[%r16 + 0x0048], %r29
	.word 0xf294a040  ! 388: LDUHA_I	lduha	[%r18, + 0x0040] %asi, %r25
cpu_intr_2_23:
	setx	0x1e031d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_24:
	setx	0x1f0034, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_20:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 392: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfc4c21b2  ! 393: LDSB_I	ldsb	[%r16 + 0x01b2], %r30
iob_intr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_29), 16, 16)) -> intp(2, 0, 0)
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983a88  ! 397: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a88, %hpstate
iob_intr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_30), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf4d5a0e9  ! 403: LDSHA_I	ldsha	[%r22, + 0x00e9] %asi, %r26
	.word 0xf2552071  ! 404: LDSH_I	ldsh	[%r20 + 0x0071], %r25
iob_intr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_31), 16, 16)) -> intp(2, 0, 24)
iob_intr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_32), 16, 16)) -> intp(2, 0, 2)
	.word 0xb9643801  ! 411: MOVcc_I	<illegal instruction>
	.word 0xba3da084  ! 414: XNOR_I	xnor 	%r22, 0x0084, %r29
T2_asi_reg_rd_21:
	mov	0x32, %r14
	.word 0xf8db8400  ! 415: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	ta	T_CHANGE_TO_TL0
	setx	data_start_1, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982c08  ! 421: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c08, %hpstate
cpu_intr_2_25:
	setx	0x1f021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_26:
	setx	0x1e0114, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfe8d0020  ! 431: LDUBA_R	lduba	[%r20, %r0] 0x01, %r31
	.word 0xf4850020  ! 432: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r26
	.word 0xb8c54000  ! 434: ADDCcc_R	addccc 	%r21, %r0, %r28
	.word 0xfc8c4020  ! 435: LDUBA_R	lduba	[%r17, %r0] 0x01, %r30
T2_asi_reg_rd_22:
	mov	0x3c0, %r14
	.word 0xf6db84a0  ! 437: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_33), 16, 16)) -> intp(2, 0, 14)
iob_intr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_34), 16, 16)) -> intp(2, 0, 2f)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbea4a0ff  ! 443: SUBcc_I	subcc 	%r18, 0x00ff, %r31
	.word 0xf055e08f  ! 444: LDSH_I	ldsh	[%r23 + 0x008f], %r24
	.word 0xfc14c000  ! 445: LDUH_R	lduh	[%r19 + %r0], %r30
T2_asi_reg_wr_19:
	mov	0x2e, %r14
	.word 0xf0f38e40  ! 446: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_rd_23:
	mov	0x2, %r14
	.word 0xf0db8400  ! 447: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbe2c2150  ! 449: ANDN_I	andn 	%r16, 0x0150, %r31
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982fda  ! 451: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fda, %hpstate
	.word 0xf84d4000  ! 452: LDSB_R	ldsb	[%r21 + %r0], %r28
	.word 0xf40c4000  ! 456: LDUB_R	ldub	[%r17 + %r0], %r26
	.word 0xf4c50020  ! 457: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r26
T2_asi_reg_wr_20:
	mov	0x7, %r14
	.word 0xf4f384a0  ! 460: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xfad4e046  ! 461: LDSHA_I	ldsha	[%r19, + 0x0046] %asi, %r29
	.word 0xf094a00a  ! 464: LDUHA_I	lduha	[%r18, + 0x000a] %asi, %r24
	.word 0xf6dde0b1  ! 469: LDXA_I	ldxa	[%r23, + 0x00b1] %asi, %r27
	.word 0xf415e050  ! 470: LDUH_I	lduh	[%r23 + 0x0050], %r26
iob_intr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_35), 16, 16)) -> intp(2, 0, c)
	.word 0xf24d4000  ! 480: LDSB_R	ldsb	[%r21 + %r0], %r25
	.word 0xf8054000  ! 482: LDUW_R	lduw	[%r21 + %r0], %r28
iob_intr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_36), 16, 16)) -> intp(2, 0, 10)
	.word 0xfcd5c020  ! 486: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r30
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982cc8  ! 488: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc8, %hpstate
T2_asi_reg_rd_24:
	mov	0x2, %r14
	.word 0xfedb8e40  ! 489: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T2_asi_reg_wr_21:
	mov	0x12, %r14
	.word 0xf8f38e80  ! 490: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_37), 16, 16)) -> intp(2, 0, 1c)
	.word 0xfa84204a  ! 494: LDUWA_I	lduwa	[%r16, + 0x004a] %asi, %r29
	.word 0xba348000  ! 495: ORN_R	orn 	%r18, %r0, %r29
	ta	T_CHANGE_HPRIV
	.word 0xf80c0000  ! 498: LDUB_R	ldub	[%r16 + %r0], %r28
T2_asi_reg_rd_25:
	mov	0x3c2, %r14
	.word 0xf0db8e60  ! 499: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_38), 16, 16)) -> intp(2, 0, 36)
	.word 0xbeb48000  ! 504: SUBCcc_R	orncc 	%r18, %r0, %r31
T2_asi_reg_rd_26:
	mov	0x3c2, %r14
	.word 0xf0db8e60  ! 506: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_39), 16, 16)) -> intp(2, 0, 33)
	.word 0xfe5ca09b  ! 511: LDX_I	ldx	[%r18 + 0x009b], %r31
cpu_intr_2_27:
	setx	0x23030d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_28:
	setx	0x230211, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982858  ! 514: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0858, %hpstate
	.word 0xf2154000  ! 516: LDUH_R	lduh	[%r21 + %r0], %r25
T2_asi_reg_rd_27:
	mov	0x3c8, %r14
	.word 0xf4db84a0  ! 517: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_40), 16, 16)) -> intp(2, 0, 33)
	.word 0xfecd4020  ! 522: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r31
	.word 0xfc95a003  ! 523: LDUHA_I	lduha	[%r22, + 0x0003] %asi, %r30
T2_asi_reg_rd_28:
	mov	0xc, %r14
	.word 0xf6db8e60  ! 525: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_2_29:
	setx	0x230219, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983e90  ! 529: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e90, %hpstate
iob_intr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_41), 16, 16)) -> intp(2, 0, 33)
cpu_intr_2_30:
	setx	0x20021f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_42), 16, 16)) -> intp(2, 0, 24)
cpu_intr_2_31:
	setx	0x230027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0842002  ! 537: LDUWA_I	lduwa	[%r16, + 0x0002] %asi, %r24
T2_asi_reg_rd_29:
	mov	0x3c4, %r14
	.word 0xf0db8e60  ! 539: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_43), 16, 16)) -> intp(2, 0, 30)
iob_intr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_44), 16, 16)) -> intp(2, 0, 27)
T2_asi_reg_wr_22:
	mov	0x3c1, %r14
	.word 0xfaf384a0  ! 549: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb8454000  ! 551: ADDC_R	addc 	%r21, %r0, %r28
	.word 0xf6144000  ! 552: LDUH_R	lduh	[%r17 + %r0], %r27
	.word 0xf214a0f9  ! 554: LDUH_I	lduh	[%r18 + 0x00f9], %r25
cpu_intr_2_32:
	setx	0x210322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb824e171  ! 560: SUB_I	sub 	%r19, 0x0171, %r28
T2_asi_reg_rd_30:
	mov	0x3c6, %r14
	.word 0xfadb84a0  ! 561: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T2_asi_reg_rd_31:
	mov	0x3c2, %r14
	.word 0xf8db8e80  ! 562: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb2c5a018  ! 566: ADDCcc_I	addccc 	%r22, 0x0018, %r25
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_32:
	mov	0x6, %r14
	.word 0xf0db8e60  ! 568: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_45), 16, 16)) -> intp(2, 0, 11)
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983d9a  ! 571: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d9a, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_46), 16, 16)) -> intp(2, 0, 24)
T2_asi_reg_rd_33:
	mov	0x2d, %r14
	.word 0xf4db8400  ! 576: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_2_33:
	setx	0x21003f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_47), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_34:
	setx	0x220100, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_48), 16, 16)) -> intp(2, 0, 3e)
iob_intr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_49), 16, 16)) -> intp(2, 0, 3d)
cpu_intr_2_35:
	setx	0x22012d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_50), 16, 16)) -> intp(2, 0, 1d)
	.word 0xbc842013  ! 593: ADDcc_I	addcc 	%r16, 0x0013, %r30
	ta	T_CHANGE_NONHPRIV
iob_intr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_51), 16, 16)) -> intp(2, 0, 36)
T2_asi_reg_rd_34:
	mov	0x13, %r14
	.word 0xf0db8e80  ! 599: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_2_52:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_52), 16, 16)) -> intp(2, 0, 2b)
	.word 0xb23ca0ab  ! 602: XNOR_I	xnor 	%r18, 0x00ab, %r25
	.word 0xf48d4020  ! 603: LDUBA_R	lduba	[%r21, %r0] 0x01, %r26
	.word 0xf4c46012  ! 604: LDSWA_I	ldswa	[%r17, + 0x0012] %asi, %r26
iob_intr_2_53:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_53), 16, 16)) -> intp(2, 0, 19)
iob_intr_2_54:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_54), 16, 16)) -> intp(2, 0, 31)
iob_intr_2_55:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_55), 16, 16)) -> intp(2, 0, 12)
	.word 0xfa5d601b  ! 615: LDX_I	ldx	[%r21 + 0x001b], %r29
	.word 0xb12d9000  ! 616: SLLX_R	sllx	%r22, %r0, %r24
	.word 0xf08dc020  ! 619: LDUBA_R	lduba	[%r23, %r0] 0x01, %r24
	.word 0xf6054000  ! 620: LDUW_R	lduw	[%r21 + %r0], %r27
T2_asi_reg_rd_35:
	mov	0x23, %r14
	.word 0xfedb8e60  ! 621: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf65d60ec  ! 623: LDX_I	ldx	[%r21 + 0x00ec], %r27
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_TO_TL0
cpu_intr_2_36:
	setx	0x22013f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_56:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_56), 16, 16)) -> intp(2, 0, 37)
	.word 0xf48d8020  ! 631: LDUBA_R	lduba	[%r22, %r0] 0x01, %r26
cpu_intr_2_37:
	setx	0x220036, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_38:
	setx	0x230104, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_36:
	mov	0x3c6, %r14
	.word 0xf0db8e80  ! 634: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_2_39:
	setx	0x230132, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_40:
	setx	0x22030f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_23:
	mov	0x32, %r14
	.word 0xfcf38e40  ! 639: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_24:
	mov	0x33, %r14
	.word 0xf6f38e80  ! 643: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_2_41:
	setx	0x230000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_42:
	setx	0x210103, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_57:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_57), 16, 16)) -> intp(2, 0, c)
iob_intr_2_58:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_58), 16, 16)) -> intp(2, 0, e)
	.word 0xbd358000  ! 655: SRL_R	srl 	%r22, %r0, %r30
	.word 0xfa152074  ! 656: LDUH_I	lduh	[%r20 + 0x0074], %r29
T2_asi_reg_wr_25:
	mov	0x3c6, %r14
	.word 0xf8f384a0  ! 657: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_2_59:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_59), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf8d46096  ! 661: LDSHA_I	ldsha	[%r17, + 0x0096] %asi, %r28
	.word 0xf6d58020  ! 662: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r27
	.word 0xbc0c4000  ! 666: AND_R	and 	%r17, %r0, %r30
	.word 0xbb34f001  ! 668: SRLX_I	srlx	%r19, 0x0001, %r29
	.word 0xfa040000  ! 671: LDUW_R	lduw	[%r16 + %r0], %r29
	.word 0xb28d4000  ! 673: ANDcc_R	andcc 	%r21, %r0, %r25
cpu_intr_2_43:
	setx	0x210121, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_37:
	mov	0x3c1, %r14
	.word 0xf4db89e0  ! 680: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf48d21b5  ! 681: LDUBA_I	lduba	[%r20, + 0x01b5] %asi, %r26
	ta	T_CHANGE_NONHPRIV
	.word 0xb89c6189  ! 683: XORcc_I	xorcc 	%r17, 0x0189, %r28
cpu_intr_2_44:
	setx	0x21010a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_38:
	mov	0xc, %r14
	.word 0xfedb89e0  ! 685: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_2_60:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_60), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf6cdc020  ! 688: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r27
	.word 0xfc4dc000  ! 690: LDSB_R	ldsb	[%r23 + %r0], %r30
cpu_intr_2_45:
	setx	0x220212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4c56103  ! 696: LDSWA_I	ldswa	[%r21, + 0x0103] %asi, %r26
iob_intr_2_61:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_61), 16, 16)) -> intp(2, 0, 22)
cpu_intr_2_46:
	setx	0x200217, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_62:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_62), 16, 16)) -> intp(2, 0, 3c)
T2_asi_reg_rd_39:
	mov	0x3, %r14
	.word 0xfcdb84a0  ! 706: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_2_47:
	setx	0x230010, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xfc8ce011  ! 713: LDUBA_I	lduba	[%r19, + 0x0011] %asi, %r30
iob_intr_2_63:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_63), 16, 16)) -> intp(2, 0, 37)
	.word 0xb89c61f0  ! 717: XORcc_I	xorcc 	%r17, 0x01f0, %r28
	.word 0xf04d8000  ! 718: LDSB_R	ldsb	[%r22 + %r0], %r24
	.word 0xba254000  ! 719: SUB_R	sub 	%r21, %r0, %r29
T2_asi_reg_rd_40:
	mov	0x3c2, %r14
	.word 0xf8db8e60  ! 720: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_2_64:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_64), 16, 16)) -> intp(2, 0, 3e)
	.word 0xb4b5e044  ! 722: ORNcc_I	orncc 	%r23, 0x0044, %r26
	.word 0xf44d6173  ! 723: LDSB_I	ldsb	[%r21 + 0x0173], %r26
	.word 0xf4c58020  ! 724: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r26
	.word 0xf045615c  ! 726: LDSW_I	ldsw	[%r21 + 0x015c], %r24
cpu_intr_2_48:
	setx	0x210304, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_49:
	setx	0x22021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_rd_41:
	mov	0x31, %r14
	.word 0xf2db8e40  ! 736: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf8058000  ! 740: LDUW_R	lduw	[%r22 + %r0], %r28
	ta	T_CHANGE_TO_TL0
	.word 0xbd7da401  ! 742: MOVR_I	movre	%r22, 0x1, %r30
cpu_intr_2_50:
	setx	0x20031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6a54000  ! 751: SUBcc_R	subcc 	%r21, %r0, %r27
	.word 0xfccc0020  ! 753: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r30
iob_intr_2_65:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_65), 16, 16)) -> intp(2, 0, 12)
iob_intr_2_66:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_66), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_51:
	setx	0x220209, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_52:
	setx	0x200239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25c60e8  ! 770: LDX_I	ldx	[%r17 + 0x00e8], %r25
cpu_intr_2_53:
	setx	0x210218, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_42:
	mov	0x9, %r14
	.word 0xf0db8e80  ! 773: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_43:
	mov	0x3c3, %r14
	.word 0xfadb8e60  ! 778: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T2_asi_reg_wr_26:
	mov	0x33, %r14
	.word 0xfaf38e60  ! 779: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_2_54:
	setx	0x230134, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_27:
	mov	0x3c6, %r14
	.word 0xf0f38e60  ! 785: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_2_55:
	setx	0x230016, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_44:
	mov	0xe, %r14
	.word 0xfedb8400  ! 787: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	ta	T_CHANGE_TO_TL0
	.word 0xfe54a1fa  ! 791: LDSH_I	ldsh	[%r18 + 0x01fa], %r31
	.word 0xf084e1d7  ! 792: LDUWA_I	lduwa	[%r19, + 0x01d7] %asi, %r24
cpu_intr_2_56:
	setx	0x21013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0ce0ce  ! 795: LDUB_I	ldub	[%r19 + 0x00ce], %r31
iob_intr_2_67:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_67), 16, 16)) -> intp(2, 0, 3d)
cpu_intr_2_57:
	setx	0x230035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_58:
	setx	0x230103, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_68:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_68), 16, 16)) -> intp(2, 0, d)
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x819839c0  ! 801: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19c0, %hpstate
	.word 0xb095e032  ! 803: ORcc_I	orcc 	%r23, 0x0032, %r24
iob_intr_2_69:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_69), 16, 16)) -> intp(2, 0, 3c)
	ta	T_CHANGE_TO_TL0
iob_intr_2_70:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_70), 16, 16)) -> intp(2, 0, 2)
iob_intr_2_71:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_71), 16, 16)) -> intp(2, 0, b)
T2_asi_reg_wr_28:
	mov	0x3c8, %r14
	.word 0xfef38e40  ! 810: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_2_59:
	setx	0x23011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_2_60:
	setx	0x20031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8446090  ! 818: LDSW_I	ldsw	[%r17 + 0x0090], %r28
cpu_intr_2_61:
	setx	0x21011a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_45:
	mov	0x38, %r14
	.word 0xf6db8e60  ! 822: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xba9ca152  ! 826: XORcc_I	xorcc 	%r18, 0x0152, %r29
	.word 0xfcc521b6  ! 828: LDSWA_I	ldswa	[%r20, + 0x01b6] %asi, %r30
T2_asi_reg_wr_29:
	mov	0x3c0, %r14
	.word 0xf8f384a0  ! 830: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_2_72:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_72), 16, 16)) -> intp(2, 0, 2d)
	.word 0xfccce14e  ! 834: LDSBA_I	ldsba	[%r19, + 0x014e] %asi, %r30
T2_asi_reg_rd_46:
	mov	0x3c8, %r14
	.word 0xf8db8e80  ! 835: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf28cc020  ! 836: LDUBA_R	lduba	[%r19, %r0] 0x01, %r25
T2_asi_reg_wr_30:
	mov	0xf, %r14
	.word 0xfaf389e0  ! 839: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xfcdca099  ! 840: LDXA_I	ldxa	[%r18, + 0x0099] %asi, %r30
T2_asi_reg_rd_47:
	mov	0xf, %r14
	.word 0xf0db8e80  ! 841: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_2_73:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_73), 16, 16)) -> intp(2, 0, 2f)
	ta	T_CHANGE_TO_TL1
	.word 0xf40c61dd  ! 848: LDUB_I	ldub	[%r17 + 0x01dd], %r26
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982c02  ! 849: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c02, %hpstate
cpu_intr_2_62:
	setx	0x22020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_31:
	mov	0x12, %r14
	.word 0xf2f38400  ! 853: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xfa4c60ea  ! 854: LDSB_I	ldsb	[%r17 + 0x00ea], %r29
	.word 0xbe3521e9  ! 855: ORN_I	orn 	%r20, 0x01e9, %r31
	.word 0xfe84c020  ! 856: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r31
iob_intr_2_74:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_74), 16, 16)) -> intp(2, 0, f)
	.word 0xf885e117  ! 860: LDUWA_I	lduwa	[%r23, + 0x0117] %asi, %r28
	.word 0xf604e089  ! 861: LDUW_I	lduw	[%r19 + 0x0089], %r27
	.word 0xbe0de19f  ! 864: AND_I	and 	%r23, 0x019f, %r31
iob_intr_2_75:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_75), 16, 16)) -> intp(2, 0, 14)
cpu_intr_2_63:
	setx	0x220101, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_64:
	setx	0x200325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3c9000  ! 869: SRAX_R	srax	%r18, %r0, %r29
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_TO_TL0
	.word 0xfa9561d7  ! 875: LDUHA_I	lduha	[%r21, + 0x01d7] %asi, %r29
cpu_intr_2_65:
	setx	0x20022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45d0000  ! 877: LDX_R	ldx	[%r20 + %r0], %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_48:
	mov	0xb, %r14
	.word 0xfadb8e60  ! 880: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf254a11d  ! 883: LDSH_I	ldsh	[%r18 + 0x011d], %r25
	.word 0xfcdda138  ! 884: LDXA_I	ldxa	[%r22, + 0x0138] %asi, %r30
cpu_intr_2_66:
	setx	0x10003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe048000  ! 888: LDUW_R	lduw	[%r18 + %r0], %r31
	.word 0xf255a0f1  ! 889: LDSH_I	ldsh	[%r22 + 0x00f1], %r25
cpu_intr_2_67:
	setx	0x210221, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_68:
	setx	0x210104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd7c4400  ! 892: MOVR_R	movre	%r17, %r0, %r30
T2_asi_reg_rd_49:
	mov	0x14, %r14
	.word 0xf6db8400  ! 894: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xfa4d8000  ! 895: LDSB_R	ldsb	[%r22 + %r0], %r29
cpu_intr_2_69:
	setx	0x24002e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_50:
	mov	0xf, %r14
	.word 0xf4db89e0  ! 905: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_2_70:
	setx	0x260238, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_32:
	mov	0x10, %r14
	.word 0xfaf38e80  ! 910: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb68421c1  ! 912: ADDcc_I	addcc 	%r16, 0x01c1, %r27
	.word 0xfcdce01a  ! 916: LDXA_I	ldxa	[%r19, + 0x001a] %asi, %r30
iob_intr_2_76:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_76), 16, 16)) -> intp(2, 0, b)
	.word 0x8f902000  ! 918: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xb0052068  ! 920: ADD_I	add 	%r20, 0x0068, %r24
	.word 0xf6952089  ! 921: LDUHA_I	lduha	[%r20, + 0x0089] %asi, %r27
T2_asi_reg_rd_51:
	mov	0x3c1, %r14
	.word 0xf6db89e0  ! 922: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_2_71:
	setx	0x270216, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_72:
	setx	0x24003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf285e1b9  ! 927: LDUWA_I	lduwa	[%r23, + 0x01b9] %asi, %r25
T2_asi_reg_wr_33:
	mov	0x3c3, %r14
	.word 0xf2f384a0  ! 929: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T2_asi_reg_rd_52:
	mov	0x3c8, %r14
	.word 0xfedb8e60  ! 930: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_2_73:
	setx	0x26022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb37d4400  ! 936: MOVR_R	movre	%r21, %r0, %r25
	.word 0xfe450000  ! 937: LDSW_R	ldsw	[%r20 + %r0], %r31
	.word 0xfe4d21df  ! 938: LDSB_I	ldsb	[%r20 + 0x01df], %r31
	.word 0x8f902000  ! 940: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xbcb5a19a  ! 941: SUBCcc_I	orncc 	%r22, 0x019a, %r30
	.word 0xb4444000  ! 942: ADDC_R	addc 	%r17, %r0, %r26
T2_asi_reg_rd_53:
	mov	0x3c6, %r14
	.word 0xf2db84a0  ! 943: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb81c0000  ! 944: XOR_R	xor 	%r16, %r0, %r28
iob_intr_2_77:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_77), 16, 16)) -> intp(2, 0, 1c)
iob_intr_2_78:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_78), 16, 16)) -> intp(2, 0, 15)
	ta	T_CHANGE_NONHPRIV
	.word 0xf0cd2070  ! 951: LDSBA_I	ldsba	[%r20, + 0x0070] %asi, %r24
	ta	T_CHANGE_NONHPRIV
	.word 0xfe55a167  ! 956: LDSH_I	ldsh	[%r22 + 0x0167], %r31
	.word 0xf6840020  ! 957: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r27
T2_asi_reg_rd_54:
	mov	0x33, %r14
	.word 0xf6db8400  ! 959: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T2_asi_reg_rd_55:
	mov	0xc, %r14
	.word 0xf6db8e40  ! 963: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf84d8000  ! 965: LDSB_R	ldsb	[%r22 + %r0], %r28
	.word 0xf4840020  ! 967: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r26
	.word 0xb02d61d2  ! 971: ANDN_I	andn 	%r21, 0x01d2, %r24
	.word 0xf2dc6002  ! 974: LDXA_I	ldxa	[%r17, + 0x0002] %asi, %r25
iob_intr_2_79:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_79), 16, 16)) -> intp(2, 0, 37)
iob_intr_2_80:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_80), 16, 16)) -> intp(2, 0, 30)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_81:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_81), 16, 16)) -> intp(2, 0, f)
	.word 0xfc946151  ! 985: LDUHA_I	lduha	[%r17, + 0x0151] %asi, %r30
	.word 0xf295e0c8  ! 988: LDUHA_I	lduha	[%r23, + 0x00c8] %asi, %r25
T2_asi_reg_wr_34:
	mov	0x2c, %r14
	.word 0xfaf389e0  ! 989: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_2_74:
	setx	0x260101, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_75:
	setx	0x26000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24c8000  ! 996: LDSB_R	ldsb	[%r18 + %r0], %r25
T2_asi_reg_wr_35:
	mov	0x3c1, %r14
	.word 0xf8f384a0  ! 997: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_2_76:
	setx	0x270304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_82:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_82), 16, 16)) -> intp(2, 0, 1e)
iob_intr_2_83:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_83), 16, 16)) -> intp(2, 0, 31)
	.word 0xf4942198  ! 1003: LDUHA_I	lduha	[%r16, + 0x0198] %asi, %r26
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
cpu_intr_2_77:
	setx	0x240037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcc420de  ! 1010: LDSWA_I	ldswa	[%r16, + 0x00de] %asi, %r30
iob_intr_2_84:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_84), 16, 16)) -> intp(2, 0, 3b)
T2_asi_reg_rd_56:
	mov	0x27, %r14
	.word 0xfcdb84a0  ! 1015: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T2_asi_reg_rd_57:
	mov	0xa, %r14
	.word 0xf4db89e0  ! 1016: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xfed561b6  ! 1017: LDSHA_I	ldsha	[%r21, + 0x01b6] %asi, %r31
cpu_intr_2_78:
	setx	0x260200, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_36:
	mov	0x34, %r14
	.word 0xf0f38e60  ! 1021: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_2_79:
	setx	0x24013f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_80:
	setx	0x25013b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_81:
	setx	0x250324, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_85:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_85), 16, 16)) -> intp(2, 0, 1b)
T2_asi_reg_wr_37:
	mov	0x3c6, %r14
	.word 0xfcf38e60  ! 1032: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_2_82:
	setx	0x260308, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_86:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_86), 16, 16)) -> intp(2, 0, 23)
	.word 0xfe154000  ! 1038: LDUH_R	lduh	[%r21 + %r0], %r31
	.word 0xf0c4e0b9  ! 1039: LDSWA_I	ldswa	[%r19, + 0x00b9] %asi, %r24
T2_asi_reg_wr_38:
	mov	0x20, %r14
	.word 0xfaf384a0  ! 1041: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T2_asi_reg_rd_58:
	mov	0xf, %r14
	.word 0xf8db8400  ! 1044: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xf0c5c020  ! 1051: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r24
	.word 0xf2ccc020  ! 1052: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r25
	.word 0xf2dd61dc  ! 1053: LDXA_I	ldxa	[%r21, + 0x01dc] %asi, %r25
iob_intr_2_87:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_87), 16, 16)) -> intp(2, 0, 2c)
cpu_intr_2_83:
	setx	0x24010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3ce001  ! 1060: SRA_I	sra 	%r19, 0x0001, %r29
	.word 0xf69421cd  ! 1061: LDUHA_I	lduha	[%r16, + 0x01cd] %asi, %r27
	.word 0xb5643801  ! 1063: MOVcc_I	<illegal instruction>
	.word 0xbd352001  ! 1064: SRL_I	srl 	%r20, 0x0001, %r30
cpu_intr_2_84:
	setx	0x26020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe05e148  ! 1067: LDUW_I	lduw	[%r23 + 0x0148], %r31
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_rd_59:
	mov	0xb, %r14
	.word 0xfadb8400  ! 1072: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf08de17a  ! 1073: LDUBA_I	lduba	[%r23, + 0x017a] %asi, %r24
T2_asi_reg_wr_39:
	mov	0x3c3, %r14
	.word 0xf8f38e60  ! 1074: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xfad50020  ! 1076: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r29
iob_intr_2_88:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_88), 16, 16)) -> intp(2, 0, 1b)
	.word 0xfa95c020  ! 1079: LDUHA_R	lduha	[%r23, %r0] 0x01, %r29
	.word 0xfa0c4000  ! 1082: LDUB_R	ldub	[%r17 + %r0], %r29
cpu_intr_2_85:
	setx	0x270218, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_86:
	setx	0x270112, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_87:
	setx	0x270322, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xfacd8020  ! 1090: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r29
T2_asi_reg_rd_60:
	mov	0x3c4, %r14
	.word 0xf8db8e40  ! 1091: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_2_89:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_89), 16, 16)) -> intp(2, 0, 3b)
iob_intr_2_90:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_90), 16, 16)) -> intp(2, 0, 2f)
iob_intr_2_91:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_91), 16, 16)) -> intp(2, 0, 4)
	.word 0xf0d40020  ! 1102: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r24
	.word 0xb82561c3  ! 1104: SUB_I	sub 	%r21, 0x01c3, %r28
T2_asi_reg_rd_61:
	mov	0x2, %r14
	.word 0xfcdb8e80  ! 1105: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T2_asi_reg_wr_40:
	mov	0x3c4, %r14
	.word 0xf8f38400  ! 1107: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_2_88:
	setx	0x250208, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_89:
	setx	0x260139, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_92:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_92), 16, 16)) -> intp(2, 0, 28)
	.word 0xfe0520ff  ! 1113: LDUW_I	lduw	[%r20 + 0x00ff], %r31
	.word 0xfe4cc000  ! 1114: LDSB_R	ldsb	[%r19 + %r0], %r31
	.word 0xf08da111  ! 1119: LDUBA_I	lduba	[%r22, + 0x0111] %asi, %r24
iob_intr_2_93:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_93), 16, 16)) -> intp(2, 0, 18)
T2_asi_reg_wr_41:
	mov	0x19, %r14
	.word 0xf8f38400  ! 1123: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_2_94:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_94), 16, 16)) -> intp(2, 0, 1e)
	.word 0x8194e014  ! 1127: WRPR_TPC_I	wrpr	%r19, 0x0014, %tpc
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_62:
	mov	0x2d, %r14
	.word 0xf8db8e80  ! 1130: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_2_95:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_95), 16, 16)) -> intp(2, 0, 21)
cpu_intr_2_90:
	setx	0x27032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf495c020  ! 1141: LDUHA_R	lduha	[%r23, %r0] 0x01, %r26
	.word 0xfec5c020  ! 1142: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r31
	.word 0xf8c4c020  ! 1143: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r28
iob_intr_2_96:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_96), 16, 16)) -> intp(2, 0, e)
	.word 0xf44c6084  ! 1146: LDSB_I	ldsb	[%r17 + 0x0084], %r26
	.word 0xf6140000  ! 1147: LDUH_R	lduh	[%r16 + %r0], %r27
iob_intr_2_97:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_97), 16, 16)) -> intp(2, 0, 2)
iob_intr_2_98:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_98), 16, 16)) -> intp(2, 0, 1f)
iob_intr_2_99:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_99), 16, 16)) -> intp(2, 0, 13)
	.word 0xf28d6077  ! 1151: LDUBA_I	lduba	[%r21, + 0x0077] %asi, %r25
	.word 0xf0cd60b2  ! 1154: LDSBA_I	ldsba	[%r21, + 0x00b2] %asi, %r24
iob_intr_2_100:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_100), 16, 16)) -> intp(2, 0, 25)
cpu_intr_2_91:
	setx	0x26021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_92:
	setx	0x260200, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_93:
	setx	0x260330, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_101:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_101), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf4cc8020  ! 1170: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r26
cpu_intr_2_94:
	setx	0x25002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_2_102:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_102), 16, 16)) -> intp(2, 0, 8)
	.word 0xf40de1d7  ! 1175: LDUB_I	ldub	[%r23 + 0x01d7], %r26
	.word 0xf8d4a044  ! 1176: LDSHA_I	ldsha	[%r18, + 0x0044] %asi, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_95:
	setx	0x25013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_96:
	setx	0x250000, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982e00  ! 1183: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e00, %hpstate
T2_asi_reg_wr_42:
	mov	0x10, %r14
	.word 0xf6f38e60  ! 1184: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xfa8de1ef  ! 1186: LDUBA_I	lduba	[%r23, + 0x01ef] %asi, %r29
iob_intr_2_103:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_103), 16, 16)) -> intp(2, 0, 24)
iob_intr_2_104:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_104), 16, 16)) -> intp(2, 0, 19)
T2_asi_reg_rd_63:
	mov	0x3c4, %r14
	.word 0xfedb89e0  ! 1192: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_2_97:
	setx	0x260229, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_64:
	mov	0xa, %r14
	.word 0xfedb8e80  ! 1196: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xfaccc020  ! 1198: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r29
T2_asi_reg_wr_43:
	mov	0x15, %r14
	.word 0xf2f38e40  ! 1199: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf2c44020  ! 1200: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r25
	.word 0xf68561d7  ! 1203: LDUWA_I	lduwa	[%r21, + 0x01d7] %asi, %r27
cpu_intr_2_98:
	setx	0x25011e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_99:
	setx	0x270132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa548000  ! 1208: LDSH_R	ldsh	[%r18 + %r0], %r29
cpu_intr_2_100:
	setx	0x24003e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_105:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_105), 16, 16)) -> intp(2, 0, c)
	.word 0xf4446066  ! 1214: LDSW_I	ldsw	[%r17 + 0x0066], %r26
T2_asi_reg_wr_44:
	mov	0x20, %r14
	.word 0xf6f384a0  ! 1216: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb33c0000  ! 1218: SRA_R	sra 	%r16, %r0, %r25
	.word 0xb92c9000  ! 1222: SLLX_R	sllx	%r18, %r0, %r28
	.word 0xf695a058  ! 1223: LDUHA_I	lduha	[%r22, + 0x0058] %asi, %r27
iob_intr_2_106:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_106), 16, 16)) -> intp(2, 0, 34)
	.word 0xf4dde1ac  ! 1230: LDXA_I	ldxa	[%r23, + 0x01ac] %asi, %r26
cpu_intr_2_101:
	setx	0x27011c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_45:
	mov	0x28, %r14
	.word 0xfaf38e40  ! 1234: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_rd_65:
	mov	0x21, %r14
	.word 0xfcdb89e0  ! 1237: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T2_asi_reg_rd_66:
	mov	0x1a, %r14
	.word 0xf2db8e60  ! 1239: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_2_102:
	setx	0x26023e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_107:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_107), 16, 16)) -> intp(2, 0, 2d)
	.word 0xb6c58000  ! 1243: ADDCcc_R	addccc 	%r22, %r0, %r27
	.word 0xf8454000  ! 1246: LDSW_R	ldsw	[%r21 + %r0], %r28
iob_intr_2_108:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_108), 16, 16)) -> intp(2, 0, 18)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_103:
	setx	0x270214, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_67:
	mov	0x10, %r14
	.word 0xf2db89e0  ! 1251: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_104:
	setx	0x260201, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_105:
	setx	0x270235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4c2187  ! 1258: LDSB_I	ldsb	[%r16 + 0x0187], %r29
	.word 0x8994a13d  ! 1265: WRPR_TICK_I	wrpr	%r18, 0x013d, %tick
T2_asi_reg_wr_46:
	mov	0x1b, %r14
	.word 0xf6f384a0  ! 1266: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T2_asi_reg_rd_68:
	mov	0x14, %r14
	.word 0xf8db8e40  ! 1267: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_2_109:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_109), 16, 16)) -> intp(2, 0, 25)
cpu_intr_2_106:
	setx	0x24021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xbf352001  ! 1271: SRL_I	srl 	%r20, 0x0001, %r31
cpu_intr_2_107:
	setx	0x240125, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_110:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_110), 16, 16)) -> intp(2, 0, 3f)
	.word 0xbcc5c000  ! 1274: ADDCcc_R	addccc 	%r23, %r0, %r30
	.word 0xf6dc21a7  ! 1277: LDXA_I	ldxa	[%r16, + 0x01a7] %asi, %r27
	.word 0xf8140000  ! 1278: LDUH_R	lduh	[%r16 + %r0], %r28
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982d08  ! 1280: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d08, %hpstate
	.word 0xf2144000  ! 1281: LDUH_R	lduh	[%r17 + %r0], %r25
	.word 0xf25c61e2  ! 1282: LDX_I	ldx	[%r17 + 0x01e2], %r25
	.word 0xf6450000  ! 1283: LDSW_R	ldsw	[%r20 + %r0], %r27
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_47:
	mov	0x1e, %r14
	.word 0xf4f38e60  ! 1285: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_2_108:
	setx	0x260205, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_69:
	mov	0x3c7, %r14
	.word 0xf0db84a0  ! 1291: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf0dda1d4  ! 1294: LDXA_I	ldxa	[%r22, + 0x01d4] %asi, %r24
	.word 0xf8cdc020  ! 1295: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r28
T2_asi_reg_wr_48:
	mov	0x3c4, %r14
	.word 0xf4f38e40  ! 1296: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_rd_70:
	mov	0x12, %r14
	.word 0xfcdb8400  ! 1297: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_2_111:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_111), 16, 16)) -> intp(2, 0, 37)
	.word 0xb8340000  ! 1299: SUBC_R	orn 	%r16, %r0, %r28
	.word 0xfa0dc000  ! 1304: LDUB_R	ldub	[%r23 + %r0], %r29
T2_asi_reg_wr_49:
	mov	0x36, %r14
	.word 0xfcf38e40  ! 1305: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_50:
	mov	0x12, %r14
	.word 0xf8f38400  ! 1309: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xf8d48020  ! 1315: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r28
	.word 0xf2c40020  ! 1324: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r25
	.word 0xf2cd4020  ! 1325: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r25
iob_intr_2_112:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_112), 16, 16)) -> intp(2, 0, e)
	.word 0xbaad6008  ! 1331: ANDNcc_I	andncc 	%r21, 0x0008, %r29
T2_asi_reg_rd_71:
	mov	0x2c, %r14
	.word 0xfadb89e0  ! 1335: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983e98  ! 1337: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e98, %hpstate
T2_asi_reg_rd_72:
	mov	0x29, %r14
	.word 0xf6db84a0  ! 1339: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xfccc617a  ! 1340: LDSBA_I	ldsba	[%r17, + 0x017a] %asi, %r30
	.word 0xb335d000  ! 1342: SRLX_R	srlx	%r23, %r0, %r25
cpu_intr_2_109:
	setx	0x25020b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_113:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_113), 16, 16)) -> intp(2, 0, 1)
T2_asi_reg_wr_51:
	mov	0x25, %r14
	.word 0xf4f389e0  ! 1353: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_2_114:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_114), 16, 16)) -> intp(2, 0, 2f)
	.word 0xb1510000  ! 1356: RDPR_TICK	<illegal instruction>
T2_asi_reg_wr_52:
	mov	0x37, %r14
	.word 0xf8f38e80  ! 1358: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_2_115:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_115), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf615c000  ! 1360: LDUH_R	lduh	[%r23 + %r0], %r27
	.word 0xf85d2134  ! 1361: LDX_I	ldx	[%r20 + 0x0134], %r28
iob_intr_2_116:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_116), 16, 16)) -> intp(2, 0, 34)
	.word 0xf84c8000  ! 1365: LDSB_R	ldsb	[%r18 + %r0], %r28
cpu_intr_2_110:
	setx	0x270039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa540000  ! 1368: LDSH_R	ldsh	[%r16 + %r0], %r29
	.word 0xf6cc4020  ! 1370: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r27
	.word 0xf80cc000  ! 1373: LDUB_R	ldub	[%r19 + %r0], %r28
	.word 0xf64d4000  ! 1374: LDSB_R	ldsb	[%r21 + %r0], %r27
	.word 0xb9520000  ! 1375: RDPR_PIL	<illegal instruction>
iob_intr_2_117:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_117), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_wr_53:
	mov	0x21, %r14
	.word 0xfcf389e0  ! 1377: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf80d4000  ! 1381: LDUB_R	ldub	[%r21 + %r0], %r28
cpu_intr_2_111:
	setx	0x2b0120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0042168  ! 1384: LDUW_I	lduw	[%r16 + 0x0168], %r24
	.word 0xf0848020  ! 1385: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r24
	.word 0xf6cde055  ! 1387: LDSBA_I	ldsba	[%r23, + 0x0055] %asi, %r27
T2_asi_reg_rd_73:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 1389: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_2_118:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_118), 16, 16)) -> intp(2, 0, 13)
iob_intr_2_119:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_119), 16, 16)) -> intp(2, 0, 1d)
iob_intr_2_120:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_120), 16, 16)) -> intp(2, 0, e)
T2_asi_reg_wr_54:
	mov	0x38, %r14
	.word 0xf6f38e80  ! 1395: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb93d1000  ! 1397: SRAX_R	srax	%r20, %r0, %r28
T2_asi_reg_wr_55:
	mov	0x1a, %r14
	.word 0xf4f38400  ! 1399: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T2_asi_reg_rd_74:
	mov	0x14, %r14
	.word 0xfadb8e80  ! 1400: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xfe4d8000  ! 1402: LDSB_R	ldsb	[%r22 + %r0], %r31
T2_asi_reg_rd_75:
	mov	0xc, %r14
	.word 0xfadb8400  ! 1404: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_2_121:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_121), 16, 16)) -> intp(2, 0, 11)
cpu_intr_2_112:
	setx	0x2a010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8946144  ! 1409: LDUHA_I	lduha	[%r17, + 0x0144] %asi, %r28
iob_intr_2_122:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_122), 16, 16)) -> intp(2, 0, 9)
iob_intr_2_123:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_123), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_wr_56:
	mov	0x2d, %r14
	.word 0xfaf38400  ! 1413: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_2_113:
	setx	0x280019, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_124:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_124), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf6946040  ! 1418: LDUHA_I	lduha	[%r17, + 0x0040] %asi, %r27
cpu_intr_2_114:
	setx	0x2b0112, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982bda  ! 1425: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bda, %hpstate
	ta	T_CHANGE_TO_TL0
iob_intr_2_125:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_125), 16, 16)) -> intp(2, 0, 3)
	.word 0xb6840000  ! 1431: ADDcc_R	addcc 	%r16, %r0, %r27
	.word 0xf844c000  ! 1432: LDSW_R	ldsw	[%r19 + %r0], %r28
cpu_intr_2_115:
	setx	0x290026, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_57:
	mov	0x3c1, %r14
	.word 0xf2f38e40  ! 1440: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982f48  ! 1446: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f48, %hpstate
	.word 0xf895c020  ! 1451: LDUHA_R	lduha	[%r23, %r0] 0x01, %r28
T2_asi_reg_wr_58:
	mov	0x10, %r14
	.word 0xfcf38400  ! 1454: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_2_116:
	setx	0x280202, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_117:
	setx	0x280323, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_TO_TL1
cpu_intr_2_118:
	setx	0x2a031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85d8000  ! 1461: LDX_R	ldx	[%r22 + %r0], %r28
	.word 0xf85c0000  ! 1462: LDX_R	ldx	[%r16 + %r0], %r28
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982b92  ! 1463: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b92, %hpstate
iob_intr_2_126:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_126), 16, 16)) -> intp(2, 0, 31)
iob_intr_2_127:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_127), 16, 16)) -> intp(2, 0, 1e)
	ta	T_CHANGE_HPRIV
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983990  ! 1468: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1990, %hpstate
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_76:
	mov	0x3c2, %r14
	.word 0xf4db8e40  ! 1471: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfc452044  ! 1472: LDSW_I	ldsw	[%r20 + 0x0044], %r30
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982b02  ! 1473: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b02, %hpstate
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982bc2  ! 1481: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc2, %hpstate
	.word 0xf0dd21b3  ! 1482: LDXA_I	ldxa	[%r20, + 0x01b3] %asi, %r24
	.word 0xf49521f9  ! 1483: LDUHA_I	lduha	[%r20, + 0x01f9] %asi, %r26
	.word 0xfa442003  ! 1487: LDSW_I	ldsw	[%r16 + 0x0003], %r29
	.word 0xfa040000  ! 1489: LDUW_R	lduw	[%r16 + %r0], %r29
	.word 0xbd3c6001  ! 1490: SRA_I	sra 	%r17, 0x0001, %r30
cpu_intr_2_119:
	setx	0x290232, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_59:
	mov	0x15, %r14
	.word 0xfcf389e0  ! 1493: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb02d4000  ! 1495: ANDN_R	andn 	%r21, %r0, %r24
	.word 0xb1351000  ! 1496: SRLX_R	srlx	%r20, %r0, %r24
	.word 0xf6d5a131  ! 1500: LDSHA_I	ldsha	[%r22, + 0x0131] %asi, %r27
iob_intr_2_128:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_128), 16, 16)) -> intp(2, 0, 28)
	.word 0xfc0c4000  ! 1505: LDUB_R	ldub	[%r17 + %r0], %r30
iob_intr_2_129:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_129), 16, 16)) -> intp(2, 0, 7)
T2_asi_reg_rd_77:
	mov	0xd, %r14
	.word 0xf8db89e0  ! 1511: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_2_130:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_130), 16, 16)) -> intp(2, 0, 2)
	.word 0xfc8c8020  ! 1516: LDUBA_R	lduba	[%r18, %r0] 0x01, %r30
iob_intr_2_131:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_131), 16, 16)) -> intp(2, 0, 5)
	.word 0xf4440000  ! 1519: LDSW_R	ldsw	[%r16 + %r0], %r26
cpu_intr_2_120:
	setx	0x2a012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4448000  ! 1523: LDSW_R	ldsw	[%r18 + %r0], %r26
T2_asi_reg_rd_78:
	mov	0x0, %r14
	.word 0xfedb8e80  ! 1524: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_2_132:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_132), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf6948020  ! 1530: LDUHA_R	lduha	[%r18, %r0] 0x01, %r27
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983c00  ! 1531: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c00, %hpstate
cpu_intr_2_121:
	setx	0x2b0126, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_79:
	mov	0x35, %r14
	.word 0xf4db8400  ! 1536: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf8d5618e  ! 1538: LDSHA_I	ldsha	[%r21, + 0x018e] %asi, %r28
	.word 0xf64d214f  ! 1539: LDSB_I	ldsb	[%r20 + 0x014f], %r27
T2_asi_reg_rd_80:
	mov	0x21, %r14
	.word 0xfadb8e60  ! 1540: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xfa8c2012  ! 1545: LDUBA_I	lduba	[%r16, + 0x0012] %asi, %r29
iob_intr_2_133:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_133), 16, 16)) -> intp(2, 0, 28)
	.word 0xb2bd4000  ! 1552: XNORcc_R	xnorcc 	%r21, %r0, %r25
	.word 0xf48d203b  ! 1556: LDUBA_I	lduba	[%r20, + 0x003b] %asi, %r26
iob_intr_2_134:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_134), 16, 16)) -> intp(2, 0, 33)
	.word 0xf8c5612e  ! 1559: LDSWA_I	ldswa	[%r21, + 0x012e] %asi, %r28
	.word 0xfcd460df  ! 1561: LDSHA_I	ldsha	[%r17, + 0x00df] %asi, %r30
iob_intr_2_135:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_135), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf8444000  ! 1566: LDSW_R	ldsw	[%r17 + %r0], %r28
	.word 0xf0848020  ! 1570: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r24
	.word 0xf4554000  ! 1572: LDSH_R	ldsh	[%r21 + %r0], %r26
T2_asi_reg_wr_60:
	mov	0xa, %r14
	.word 0xf4f389e0  ! 1573: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_2_122:
	setx	0x2a0108, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_61:
	mov	0xd, %r14
	.word 0xf0f384a0  ! 1575: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	ta	T_CHANGE_TO_TL1
	.word 0xbcb54000  ! 1580: SUBCcc_R	orncc 	%r21, %r0, %r30
T2_asi_reg_wr_62:
	mov	0x3c5, %r14
	.word 0xfaf38e40  ! 1581: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb2344000  ! 1590: SUBC_R	orn 	%r17, %r0, %r25
	.word 0xf08460f2  ! 1591: LDUWA_I	lduwa	[%r17, + 0x00f2] %asi, %r24
	.word 0xb23d20f0  ! 1593: XNOR_I	xnor 	%r20, 0x00f0, %r25
	.word 0xbabd600b  ! 1595: XNORcc_I	xnorcc 	%r21, 0x000b, %r29
	.word 0xf80561f0  ! 1599: LDUW_I	lduw	[%r21 + 0x01f0], %r28
	.word 0xf4152014  ! 1600: LDUH_I	lduh	[%r20 + 0x0014], %r26
iob_intr_2_136:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_136), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_wr_63:
	mov	0x37, %r14
	.word 0xf6f38e80  ! 1603: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_64:
	mov	0xa, %r14
	.word 0xf4f38e40  ! 1609: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf484e0c0  ! 1614: LDUWA_I	lduwa	[%r19, + 0x00c0] %asi, %r26
cpu_intr_2_123:
	setx	0x2b0100, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_81:
	mov	0x33, %r14
	.word 0xfcdb8e40  ! 1620: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf8c40020  ! 1623: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r28
	.word 0xb2942056  ! 1627: ORcc_I	orcc 	%r16, 0x0056, %r25
iob_intr_2_137:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_137), 16, 16)) -> intp(2, 0, 32)
cpu_intr_2_124:
	setx	0x290209, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_82:
	mov	0x2a, %r14
	.word 0xf6db8400  ! 1631: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf0cd21d1  ! 1633: LDSBA_I	ldsba	[%r20, + 0x01d1] %asi, %r24
cpu_intr_2_125:
	setx	0x2a011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf845618c  ! 1640: LDSW_I	ldsw	[%r21 + 0x018c], %r28
	.word 0xf04d8000  ! 1641: LDSB_R	ldsb	[%r22 + %r0], %r24
	.word 0xb32c6001  ! 1642: SLL_I	sll 	%r17, 0x0001, %r25
	.word 0xfa448000  ! 1643: LDSW_R	ldsw	[%r18 + %r0], %r29
	.word 0xb68c615e  ! 1644: ANDcc_I	andcc 	%r17, 0x015e, %r27
cpu_intr_2_126:
	setx	0x2a031d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_138:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_138), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf4d5c020  ! 1647: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r26
	.word 0xf28d6031  ! 1649: LDUBA_I	lduba	[%r21, + 0x0031] %asi, %r25
cpu_intr_2_127:
	setx	0x28013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3d5000  ! 1655: SRAX_R	srax	%r21, %r0, %r29
	.word 0xb9641800  ! 1656: MOVcc_R	<illegal instruction>
	.word 0xf0cc615b  ! 1659: LDSBA_I	ldsba	[%r17, + 0x015b] %asi, %r24
T2_asi_reg_wr_65:
	mov	0x21, %r14
	.word 0xf0f38e40  ! 1663: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf24de032  ! 1666: LDSB_I	ldsb	[%r23 + 0x0032], %r25
T2_asi_reg_rd_83:
	mov	0x0, %r14
	.word 0xf8db89e0  ! 1667: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T2_asi_reg_rd_84:
	mov	0x3c5, %r14
	.word 0xf0db89e0  ! 1670: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xfe958020  ! 1671: LDUHA_R	lduha	[%r22, %r0] 0x01, %r31
T2_asi_reg_wr_66:
	mov	0x3c1, %r14
	.word 0xfaf38e40  ! 1672: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_wr_67:
	mov	0x6, %r14
	.word 0xf6f38400  ! 1673: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_2_128:
	setx	0x290121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcc5e0cd  ! 1677: LDSWA_I	ldswa	[%r23, + 0x00cd] %asi, %r30
	.word 0xf615c000  ! 1678: LDUH_R	lduh	[%r23 + %r0], %r27
	.word 0xf25d6131  ! 1679: LDX_I	ldx	[%r21 + 0x0131], %r25
T2_asi_reg_rd_85:
	mov	0x3c4, %r14
	.word 0xfadb89e0  ! 1681: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf6c58020  ! 1682: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r27
	.word 0xfe54c000  ! 1685: LDSH_R	ldsh	[%r19 + %r0], %r31
	.word 0xb635612f  ! 1686: ORN_I	orn 	%r21, 0x012f, %r27
	.word 0xfa5cc000  ! 1688: LDX_R	ldx	[%r19 + %r0], %r29
iob_intr_2_139:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_139), 16, 16)) -> intp(2, 0, 35)
	.word 0xfa55e15b  ! 1690: LDSH_I	ldsh	[%r23 + 0x015b], %r29
iob_intr_2_140:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_140), 16, 16)) -> intp(2, 0, 5)
cpu_intr_2_129:
	setx	0x29020c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_130:
	setx	0x2a011d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_131:
	setx	0x2b023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe152118  ! 1704: LDUH_I	lduh	[%r20 + 0x0118], %r31
	.word 0xfa0ce032  ! 1705: LDUB_I	ldub	[%r19 + 0x0032], %r29
	.word 0xbe2c4000  ! 1706: ANDN_R	andn 	%r17, %r0, %r31
	.word 0xba1d0000  ! 1709: XOR_R	xor 	%r20, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb751c000  ! 1714: RDPR_TL	<illegal instruction>
T2_asi_reg_wr_68:
	mov	0x7, %r14
	.word 0xf4f38e40  ! 1715: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_wr_69:
	mov	0x2d, %r14
	.word 0xfef38400  ! 1718: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xfc05c000  ! 1719: LDUW_R	lduw	[%r23 + %r0], %r30
T2_asi_reg_wr_70:
	mov	0x3c2, %r14
	.word 0xf6f384a0  ! 1721: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	ta	T_CHANGE_NONHPRIV
	.word 0xf2cd8020  ! 1726: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r25
T2_asi_reg_rd_86:
	mov	0x9, %r14
	.word 0xfadb8400  ! 1738: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf4d56179  ! 1740: LDSHA_I	ldsha	[%r21, + 0x0179] %asi, %r26
cpu_intr_2_132:
	setx	0x2b000e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_71:
	mov	0x2e, %r14
	.word 0xf2f38e40  ! 1745: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf2544000  ! 1747: LDSH_R	ldsh	[%r17 + %r0], %r25
iob_intr_2_141:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_141), 16, 16)) -> intp(2, 0, 2)
	.word 0xb83d6099  ! 1752: XNOR_I	xnor 	%r21, 0x0099, %r28
	.word 0xb9641800  ! 1753: MOVcc_R	<illegal instruction>
T2_asi_reg_wr_72:
	mov	0x3c4, %r14
	.word 0xfaf38e80  ! 1755: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T2_asi_reg_rd_87:
	mov	0x37, %r14
	.word 0xf4db8e40  ! 1756: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_wr_73:
	mov	0x3c4, %r14
	.word 0xf4f38e60  ! 1759: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T2_asi_reg_wr_74:
	mov	0x20, %r14
	.word 0xfcf38400  ! 1760: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T2_asi_reg_wr_75:
	mov	0x30, %r14
	.word 0xf8f38e40  ! 1761: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb72c2001  ! 1762: SLL_I	sll 	%r16, 0x0001, %r27
T2_asi_reg_wr_76:
	mov	0x10, %r14
	.word 0xf8f38e40  ! 1765: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf4c4c020  ! 1766: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r26
cpu_intr_2_133:
	setx	0x2b0212, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_142:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_142), 16, 16)) -> intp(2, 0, 3d)
iob_intr_2_143:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_143), 16, 16)) -> intp(2, 0, 6)
cpu_intr_2_134:
	setx	0x28023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf645a0cf  ! 1786: LDSW_I	ldsw	[%r22 + 0x00cf], %r27
	.word 0xf84d61a9  ! 1788: LDSB_I	ldsb	[%r21 + 0x01a9], %r28
	setx	data_start_1, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x8198284a  ! 1789: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084a, %hpstate
	.word 0xbc9c20e7  ! 1792: XORcc_I	xorcc 	%r16, 0x00e7, %r30
	ta	T_CHANGE_TO_TL1
iob_intr_2_144:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_144), 16, 16)) -> intp(2, 0, 15)
	ta	T_CHANGE_TO_TL1
	.word 0xf45ce15e  ! 1797: LDX_I	ldx	[%r19 + 0x015e], %r26
T2_asi_reg_wr_77:
	mov	0x3c8, %r14
	.word 0xfaf38e40  ! 1800: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_145:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_145), 16, 16)) -> intp(2, 0, 1f)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xba94216e  ! 1807: ORcc_I	orcc 	%r16, 0x016e, %r29
	.word 0xf05dc000  ! 1809: LDX_R	ldx	[%r23 + %r0], %r24
	.word 0xfcc42132  ! 1810: LDSWA_I	ldswa	[%r16, + 0x0132] %asi, %r30
	.word 0xfc942053  ! 1811: LDUHA_I	lduha	[%r16, + 0x0053] %asi, %r30
iob_intr_2_146:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_146), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_rd_88:
	mov	0xd, %r14
	.word 0xf2db8e40  ! 1816: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_2_147:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_147), 16, 16)) -> intp(2, 0, 38)
	.word 0xf25c6122  ! 1822: LDX_I	ldx	[%r17 + 0x0122], %r25
iob_intr_2_148:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_148), 16, 16)) -> intp(2, 0, 3e)
	.word 0xfc440000  ! 1825: LDSW_R	ldsw	[%r16 + %r0], %r30
T2_asi_reg_rd_89:
	mov	0x3c8, %r14
	.word 0xf2db84a0  ! 1826: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_2_149:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_149), 16, 16)) -> intp(2, 0, 6)
	.word 0xfccc0020  ! 1828: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r30
	.word 0xfe844020  ! 1829: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r31
iob_intr_2_150:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_150), 16, 16)) -> intp(2, 0, 34)
	.word 0xbd540000  ! 1832: RDPR_GL	<illegal instruction>
	.word 0xfe95c020  ! 1833: LDUHA_R	lduha	[%r23, %r0] 0x01, %r31
	.word 0xf40dc000  ! 1836: LDUB_R	ldub	[%r23 + %r0], %r26
iob_intr_2_151:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_151), 16, 16)) -> intp(2, 0, 1a)
cpu_intr_2_135:
	setx	0x2f0232, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_136:
	setx	0x2e0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4d4a0e9  ! 1848: LDSHA_I	ldsha	[%r18, + 0x00e9] %asi, %r26
cpu_intr_2_137:
	setx	0x2f031d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_78:
	mov	0xe, %r14
	.word 0xfaf389e0  ! 1855: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb62ce04e  ! 1856: ANDN_I	andn 	%r19, 0x004e, %r27
	.word 0xf695c020  ! 1858: LDUHA_R	lduha	[%r23, %r0] 0x01, %r27
iob_intr_2_152:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_152), 16, 16)) -> intp(2, 0, 7)
	ta	T_CHANGE_TO_TL1
iob_intr_2_153:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_153), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_rd_90:
	mov	0x11, %r14
	.word 0xfadb8e80  ! 1866: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T2_asi_reg_wr_79:
	mov	0x1a, %r14
	.word 0xf8f38e80  ! 1867: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xfc0da074  ! 1870: LDUB_I	ldub	[%r22 + 0x0074], %r30
T2_asi_reg_rd_91:
	mov	0x1b, %r14
	.word 0xf4db8e40  ! 1871: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_rd_92:
	mov	0x3c5, %r14
	.word 0xf2db84a0  ! 1878: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf0546094  ! 1880: LDSH_I	ldsh	[%r17 + 0x0094], %r24
cpu_intr_2_138:
	setx	0x2c023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8c5c020  ! 1882: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r28
	.word 0xfa444000  ! 1883: LDSW_R	ldsw	[%r17 + %r0], %r29
	.word 0xf20c0000  ! 1884: LDUB_R	ldub	[%r16 + %r0], %r25
	.word 0xf8d5a1e3  ! 1886: LDSHA_I	ldsha	[%r22, + 0x01e3] %asi, %r28
iob_intr_2_154:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_154), 16, 16)) -> intp(2, 0, a)
cpu_intr_2_139:
	setx	0x2c000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6cd2025  ! 1889: LDSBA_I	ldsba	[%r20, + 0x0025] %asi, %r27
	.word 0xfedda024  ! 1890: LDXA_I	ldxa	[%r22, + 0x0024] %asi, %r31
	.word 0xf88d0020  ! 1891: LDUBA_R	lduba	[%r20, %r0] 0x01, %r28
	.word 0xf8540000  ! 1895: LDSH_R	ldsh	[%r16 + %r0], %r28
	.word 0xfcd44020  ! 1898: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r30
cpu_intr_2_140:
	setx	0x2f0011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4bce14a  ! 1905: XNORcc_I	xnorcc 	%r19, 0x014a, %r26
T2_asi_reg_wr_80:
	mov	0x3c4, %r14
	.word 0xf2f38e60  ! 1907: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf88c8020  ! 1909: LDUBA_R	lduba	[%r18, %r0] 0x01, %r28
	.word 0xf805607c  ! 1910: LDUW_I	lduw	[%r21 + 0x007c], %r28
	.word 0xfccc21d7  ! 1912: LDSBA_I	ldsba	[%r16, + 0x01d7] %asi, %r30
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983bda  ! 1913: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bda, %hpstate
iob_intr_2_155:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_155), 16, 16)) -> intp(2, 0, 3c)
	.word 0x9194e0a5  ! 1917: WRPR_PIL_I	wrpr	%r19, 0x00a5, %pil
cpu_intr_2_141:
	setx	0x2d0334, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_81:
	mov	0x3c1, %r14
	.word 0xf6f38400  ! 1922: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbeb5e08e  ! 1923: ORNcc_I	orncc 	%r23, 0x008e, %r31
cpu_intr_2_142:
	setx	0x2c0217, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_93:
	mov	0x22, %r14
	.word 0xf6db8e80  ! 1927: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_2_143:
	setx	0x2c033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8154000  ! 1929: LDUH_R	lduh	[%r21 + %r0], %r28
T2_asi_reg_wr_82:
	mov	0x3c2, %r14
	.word 0xf0f384a0  ! 1931: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_2_144:
	setx	0x2e0332, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_145:
	setx	0x2e021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb643801  ! 1941: MOVcc_I	<illegal instruction>
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x819839d0  ! 1943: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19d0, %hpstate
cpu_intr_2_146:
	setx	0x2d013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2158000  ! 1945: LDUH_R	lduh	[%r22 + %r0], %r25
	.word 0xb00520c6  ! 1946: ADD_I	add 	%r20, 0x00c6, %r24
cpu_intr_2_147:
	setx	0x2d033a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_148:
	setx	0x2c0105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe458000  ! 1952: LDSW_R	ldsw	[%r22 + %r0], %r31
	.word 0xf2d48020  ! 1954: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r25
cpu_intr_2_149:
	setx	0x2d0015, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_156:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_156), 16, 16)) -> intp(2, 0, 38)
cpu_intr_2_150:
	setx	0x2f0310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0358000  ! 1968: SUBC_R	orn 	%r22, %r0, %r24
T2_asi_reg_rd_94:
	mov	0x30, %r14
	.word 0xfcdb8e80  ! 1970: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_2_151:
	setx	0x2d0138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba158000  ! 1975: OR_R	or 	%r22, %r0, %r29
iob_intr_2_157:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_157), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_rd_95:
	mov	0x3c7, %r14
	.word 0xfcdb8e60  ! 1977: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_2_152:
	setx	0x2e010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_96:
	mov	0x28, %r14
	.word 0xfcdb89e0  ! 1979: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T2_asi_reg_rd_97:
	mov	0x29, %r14
	.word 0xf4db8400  ! 1981: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb6a44000  ! 1983: SUBcc_R	subcc 	%r17, %r0, %r27
	.word 0xf85c8000  ! 1984: LDX_R	ldx	[%r18 + %r0], %r28
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_83:
	mov	0x1d, %r14
	.word 0xfcf384a0  ! 1986: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfc4de0af  ! 1987: LDSB_I	ldsb	[%r23 + 0x00af], %r30
T2_asi_reg_rd_98:
	mov	0x1e, %r14
	.word 0xf0db89e0  ! 1988: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T2_asi_reg_wr_84:
	mov	0x6, %r14
	.word 0xf4f38e40  ! 1989: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf2152102  ! 1991: LDUH_I	lduh	[%r20 + 0x0102], %r25
	.word 0xb63de095  ! 1992: XNOR_I	xnor 	%r23, 0x0095, %r27
cpu_intr_2_153:
	setx	0x2d0031, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_154:
	setx	0x2c0026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf254e16c  ! 1998: LDSH_I	ldsh	[%r19 + 0x016c], %r25
	.word 0xf4c5217d  ! 1999: LDSWA_I	ldswa	[%r20, + 0x017d] %asi, %r26
	.word 0xf44de099  ! 2000: LDSB_I	ldsb	[%r23 + 0x0099], %r26
	.word 0xb88d6199  ! 2004: ANDcc_I	andcc 	%r21, 0x0199, %r28
cpu_intr_2_155:
	setx	0x2c0132, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_99:
	mov	0x3c3, %r14
	.word 0xf0db89e0  ! 2006: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf6150000  ! 2008: LDUH_R	lduh	[%r20 + %r0], %r27
	.word 0xf0d5e055  ! 2009: LDSHA_I	ldsha	[%r23, + 0x0055] %asi, %r24
	.word 0xfcd5200c  ! 2011: LDSHA_I	ldsha	[%r20, + 0x000c] %asi, %r30
	.word 0xbe1de152  ! 2016: XOR_I	xor 	%r23, 0x0152, %r31
	.word 0xf44d2149  ! 2019: LDSB_I	ldsb	[%r20 + 0x0149], %r26
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982d0a  ! 2021: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d0a, %hpstate
cpu_intr_2_156:
	setx	0x2e023f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_157:
	setx	0x2d0033, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_100:
	mov	0x20, %r14
	.word 0xfedb8e80  ! 2028: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf6946045  ! 2032: LDUHA_I	lduha	[%r17, + 0x0045] %asi, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_101:
	mov	0x1, %r14
	.word 0xf6db89e0  ! 2034: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xf2cd8020  ! 2035: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r25
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
cpu_intr_2_158:
	setx	0x2d031c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_159:
	setx	0x2e0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcc4a038  ! 2047: LDSWA_I	ldswa	[%r18, + 0x0038] %asi, %r30
T2_asi_reg_rd_102:
	mov	0x36, %r14
	.word 0xfcdb8e40  ! 2049: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_wr_85:
	mov	0x3c2, %r14
	.word 0xfef38e40  ! 2050: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL0
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983b12  ! 2053: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b12, %hpstate
T2_asi_reg_wr_86:
	mov	0xa, %r14
	.word 0xf4f38e60  ! 2054: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xfa5d0000  ! 2055: LDX_R	ldx	[%r20 + %r0], %r29
iob_intr_2_158:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_158), 16, 16)) -> intp(2, 0, 1b)
	.word 0xb4448000  ! 2057: ADDC_R	addc 	%r18, %r0, %r26
cpu_intr_2_160:
	setx	0x2c0202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05d8000  ! 2062: LDX_R	ldx	[%r22 + %r0], %r24
iob_intr_2_159:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_159), 16, 16)) -> intp(2, 0, 25)
	.word 0xf8d5619e  ! 2065: LDSHA_I	ldsha	[%r21, + 0x019e] %asi, %r28
T2_asi_reg_wr_87:
	mov	0x3c0, %r14
	.word 0xf4f38e80  ! 2067: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983c48  ! 2068: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c48, %hpstate
	.word 0xf04461d0  ! 2069: LDSW_I	ldsw	[%r17 + 0x01d0], %r24
T2_asi_reg_wr_88:
	mov	0x9, %r14
	.word 0xfef38e40  ! 2070: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_160:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_160), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_161:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_161), 16, 16)) -> intp(2, 0, f)
	.word 0xfa0c8000  ! 2074: LDUB_R	ldub	[%r18 + %r0], %r29
T2_asi_reg_wr_89:
	mov	0x29, %r14
	.word 0xf4f389e0  ! 2075: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xfc5c214b  ! 2076: LDX_I	ldx	[%r16 + 0x014b], %r30
	.word 0x8595609a  ! 2077: WRPR_TSTATE_I	wrpr	%r21, 0x009a, %tstate
	.word 0xf45c6026  ! 2078: LDX_I	ldx	[%r17 + 0x0026], %r26
cpu_intr_2_161:
	setx	0x2c020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf095c020  ! 2085: LDUHA_R	lduha	[%r23, %r0] 0x01, %r24
iob_intr_2_162:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_162), 16, 16)) -> intp(2, 0, 3d)
iob_intr_2_163:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_163), 16, 16)) -> intp(2, 0, 33)
	.word 0xf0cc4020  ! 2091: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r24
T2_asi_reg_rd_103:
	mov	0x1, %r14
	.word 0xf4db8400  ! 2093: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_2_162:
	setx	0x2d011e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_104:
	mov	0x6, %r14
	.word 0xf6db8e60  ! 2095: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_2_163:
	setx	0x2e0202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5d0000  ! 2097: LDX_R	ldx	[%r20 + %r0], %r31
cpu_intr_2_164:
	setx	0x2f0031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_165:
	setx	0x2d023c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_90:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 2100: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T2_asi_reg_wr_91:
	mov	0x5, %r14
	.word 0xf2f38e40  ! 2102: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_164:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_164), 16, 16)) -> intp(2, 0, e)
	.word 0xf45dc000  ! 2107: LDX_R	ldx	[%r23 + %r0], %r26
	.word 0xf20c60a2  ! 2109: LDUB_I	ldub	[%r17 + 0x00a2], %r25
	ta	T_CHANGE_TO_TL0
	.word 0xfa45e11c  ! 2118: LDSW_I	ldsw	[%r23 + 0x011c], %r29
cpu_intr_2_166:
	setx	0x2e0302, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_167:
	setx	0x2f0219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4dc000  ! 2123: LDSB_R	ldsb	[%r23 + %r0], %r31
	.word 0xf0844020  ! 2127: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r24
	.word 0xf40c2063  ! 2132: LDUB_I	ldub	[%r16 + 0x0063], %r26
cpu_intr_2_168:
	setx	0x2c0132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe148000  ! 2134: LDUH_R	lduh	[%r18 + %r0], %r31
iob_intr_2_165:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_165), 16, 16)) -> intp(2, 0, c)
	.word 0xfe55a1a7  ! 2136: LDSH_I	ldsh	[%r22 + 0x01a7], %r31
	.word 0xf65d616e  ! 2138: LDX_I	ldx	[%r21 + 0x016e], %r27
cpu_intr_2_169:
	setx	0x2c0128, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_166:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_166), 16, 16)) -> intp(2, 0, 21)
iob_intr_2_167:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_167), 16, 16)) -> intp(2, 0, 26)
	.word 0xfed4218b  ! 2145: LDSHA_I	ldsha	[%r16, + 0x018b] %asi, %r31
cpu_intr_2_170:
	setx	0x2f030f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_171:
	setx	0x2f0230, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_168:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_168), 16, 16)) -> intp(2, 0, 2f)
cpu_intr_2_172:
	setx	0x2c0134, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_105:
	mov	0xe, %r14
	.word 0xf2db8e40  ! 2153: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf4148000  ! 2154: LDUH_R	lduh	[%r18 + %r0], %r26
	.word 0xf0558000  ! 2157: LDSH_R	ldsh	[%r22 + %r0], %r24
T2_asi_reg_wr_92:
	mov	0x25, %r14
	.word 0xf6f38400  ! 2158: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb8044000  ! 2170: ADD_R	add 	%r17, %r0, %r28
	.word 0xf80ca0a7  ! 2171: LDUB_I	ldub	[%r18 + 0x00a7], %r28
iob_intr_2_169:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_169), 16, 16)) -> intp(2, 0, c)
	.word 0xfe0cc000  ! 2176: LDUB_R	ldub	[%r19 + %r0], %r31
cpu_intr_2_173:
	setx	0x2c0027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf894209d  ! 2180: LDUHA_I	lduha	[%r16, + 0x009d] %asi, %r28
	.word 0xbe844000  ! 2182: ADDcc_R	addcc 	%r17, %r0, %r31
iob_intr_2_170:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_170), 16, 16)) -> intp(2, 0, 38)
iob_intr_2_171:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_171), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf844a186  ! 2195: LDSW_I	ldsw	[%r18 + 0x0186], %r28
	.word 0xf44dc000  ! 2196: LDSB_R	ldsb	[%r23 + %r0], %r26
	.word 0xf48c6103  ! 2197: LDUBA_I	lduba	[%r17, + 0x0103] %asi, %r26
T2_asi_reg_rd_106:
	mov	0x1a, %r14
	.word 0xf4db89e0  ! 2198: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_2_172:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_172), 16, 16)) -> intp(2, 0, 8)
cpu_intr_2_174:
	setx	0x2f010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcc44020  ! 2201: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r30
	.word 0xf84421ca  ! 2202: LDSW_I	ldsw	[%r16 + 0x01ca], %r28
	.word 0xf85ca0ed  ! 2204: LDX_I	ldx	[%r18 + 0x00ed], %r28
T2_asi_reg_wr_93:
	mov	0x18, %r14
	.word 0xf2f38e80  ! 2205: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbf480000  ! 2208: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xfec4a183  ! 2209: LDSWA_I	ldswa	[%r18, + 0x0183] %asi, %r31
T2_asi_reg_rd_107:
	mov	0x3, %r14
	.word 0xf4db84a0  ! 2210: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_2_173:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_173), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf88ca113  ! 2212: LDUBA_I	lduba	[%r18, + 0x0113] %asi, %r28
	.word 0xf645c000  ! 2215: LDSW_R	ldsw	[%r23 + %r0], %r27
	.word 0xf454e1e0  ! 2217: LDSH_I	ldsh	[%r19 + 0x01e0], %r26
iob_intr_2_174:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_174), 16, 16)) -> intp(2, 0, 1c)
cpu_intr_2_175:
	setx	0x2d001c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_94:
	mov	0x30, %r14
	.word 0xfcf38400  ! 2222: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbead6013  ! 2224: ANDNcc_I	andncc 	%r21, 0x0013, %r31
	.word 0xf8d54020  ! 2226: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r28
iob_intr_2_175:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_175), 16, 16)) -> intp(2, 0, 27)
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982e92  ! 2235: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e92, %hpstate
	.word 0xbcc50000  ! 2238: ADDCcc_R	addccc 	%r20, %r0, %r30
	.word 0xb8b58000  ! 2244: ORNcc_R	orncc 	%r22, %r0, %r28
	.word 0xfe95c020  ! 2246: LDUHA_R	lduha	[%r23, %r0] 0x01, %r31
	.word 0xfe5d4000  ! 2251: LDX_R	ldx	[%r21 + %r0], %r31
	.word 0xf4d52149  ! 2252: LDSHA_I	ldsha	[%r20, + 0x0149] %asi, %r26
iob_intr_2_176:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_176), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_rd_108:
	mov	0x3c4, %r14
	.word 0xf8db8e40  ! 2256: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xba34a193  ! 2261: SUBC_I	orn 	%r18, 0x0193, %r29
	.word 0xfe04a14b  ! 2264: LDUW_I	lduw	[%r18 + 0x014b], %r31
	.word 0xb025e02d  ! 2265: SUB_I	sub 	%r23, 0x002d, %r24
	.word 0xb37de401  ! 2266: MOVR_I	movre	%r23, 0x1, %r25
iob_intr_2_177:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_177), 16, 16)) -> intp(2, 0, 15)
	.word 0x83942127  ! 2270: WRPR_TNPC_I	wrpr	%r16, 0x0127, %tnpc
iob_intr_2_178:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_178), 16, 16)) -> intp(2, 0, 38)
	.word 0xf405601d  ! 2273: LDUW_I	lduw	[%r21 + 0x001d], %r26
	.word 0xf48ce059  ! 2274: LDUBA_I	lduba	[%r19, + 0x0059] %asi, %r26
T2_asi_reg_wr_95:
	mov	0xd, %r14
	.word 0xf2f38e40  ! 2275: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf81560e3  ! 2277: LDUH_I	lduh	[%r21 + 0x00e3], %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_109:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 2284: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbeb54000  ! 2285: ORNcc_R	orncc 	%r21, %r0, %r31
T2_asi_reg_rd_110:
	mov	0x2a, %r14
	.word 0xf6db8e40  ! 2290: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf4140000  ! 2291: LDUH_R	lduh	[%r16 + %r0], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf84460fd  ! 2295: LDSW_I	ldsw	[%r17 + 0x00fd], %r28
iob_intr_2_179:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_179), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf6d58020  ! 2298: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r27
	.word 0xfe5de1ad  ! 2301: LDX_I	ldx	[%r23 + 0x01ad], %r31
	.word 0xbc3521ef  ! 2302: SUBC_I	orn 	%r20, 0x01ef, %r30
	.word 0xfa540000  ! 2303: LDSH_R	ldsh	[%r16 + %r0], %r29
	.word 0xfe440000  ! 2304: LDSW_R	ldsw	[%r16 + %r0], %r31
	ta	T_CHANGE_TO_TL0
	.word 0xf20dc000  ! 2307: LDUB_R	ldub	[%r23 + %r0], %r25
	.word 0xfe0c609c  ! 2308: LDUB_I	ldub	[%r17 + 0x009c], %r31
	ta	T_CHANGE_TO_TL0
	.word 0xfc84e146  ! 2311: LDUWA_I	lduwa	[%r19, + 0x0146] %asi, %r30
	.word 0xfcc46034  ! 2313: LDSWA_I	ldswa	[%r17, + 0x0034] %asi, %r30
iob_intr_2_180:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_180), 16, 16)) -> intp(2, 0, 32)
	.word 0xf28d0020  ! 2316: LDUBA_R	lduba	[%r20, %r0] 0x01, %r25
	.word 0xb33cb001  ! 2319: SRAX_I	srax	%r18, 0x0001, %r25
	.word 0xb0948000  ! 2323: ORcc_R	orcc 	%r18, %r0, %r24
cpu_intr_2_176:
	setx	0x320106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8c48020  ! 2328: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r28
	.word 0xf08d611e  ! 2329: LDUBA_I	lduba	[%r21, + 0x011e] %asi, %r24
	.word 0xf8c42143  ! 2330: LDSWA_I	ldswa	[%r16, + 0x0143] %asi, %r28
	.word 0xb034613a  ! 2335: SUBC_I	orn 	%r17, 0x013a, %r24
T2_asi_reg_wr_96:
	mov	0x17, %r14
	.word 0xfef384a0  ! 2336: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_2_181:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_181), 16, 16)) -> intp(2, 0, 19)
	ta	T_CHANGE_NONHPRIV
	.word 0xf6cc2000  ! 2344: LDSBA_I	ldsba	[%r16, + 0x0000] %asi, %r27
iob_intr_2_182:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_182), 16, 16)) -> intp(2, 0, 17)
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_111:
	mov	0x3c5, %r14
	.word 0xf0db89e0  ! 2350: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf4cd4020  ! 2351: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r26
	.word 0xb4a40000  ! 2352: SUBcc_R	subcc 	%r16, %r0, %r26
	.word 0xbc156088  ! 2353: OR_I	or 	%r21, 0x0088, %r30
	.word 0xb6358000  ! 2355: ORN_R	orn 	%r22, %r0, %r27
cpu_intr_2_177:
	setx	0x310037, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_97:
	mov	0x14, %r14
	.word 0xf8f38e60  ! 2361: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf84dc000  ! 2365: LDSB_R	ldsb	[%r23 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_112:
	mov	0x22, %r14
	.word 0xf8db84a0  ! 2371: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_2_183:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_183), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_rd_113:
	mov	0x3c8, %r14
	.word 0xfedb8e60  ! 2373: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T2_asi_reg_wr_98:
	mov	0x2d, %r14
	.word 0xf4f389e0  ! 2374: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf04de188  ! 2376: LDSB_I	ldsb	[%r23 + 0x0188], %r24
cpu_intr_2_178:
	setx	0x33030b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_179:
	setx	0x31011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc05e1f3  ! 2379: LDUW_I	lduw	[%r23 + 0x01f3], %r30
cpu_intr_2_180:
	setx	0x31011c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_114:
	mov	0x30, %r14
	.word 0xf6db8e60  ! 2384: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_2_184:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_184), 16, 16)) -> intp(2, 0, 36)
T2_asi_reg_wr_99:
	mov	0x3c1, %r14
	.word 0xf8f38e40  ! 2389: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfec50020  ! 2391: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r31
	.word 0xf8552183  ! 2397: LDSH_I	ldsh	[%r20 + 0x0183], %r28
cpu_intr_2_181:
	setx	0x310031, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_100:
	mov	0x3c3, %r14
	.word 0xf0f38e80  ! 2400: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T2_asi_reg_rd_115:
	mov	0x12, %r14
	.word 0xf8db8400  ! 2401: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_2_182:
	setx	0x330020, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x819838c2  ! 2404: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18c2, %hpstate
cpu_intr_2_183:
	setx	0x330025, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_184:
	setx	0x30003c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_185:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_185), 16, 16)) -> intp(2, 0, 3e)
	.word 0xfe55601f  ! 2414: LDSH_I	ldsh	[%r21 + 0x001f], %r31
	.word 0xf8d5a116  ! 2416: LDSHA_I	ldsha	[%r22, + 0x0116] %asi, %r28
T2_asi_reg_rd_116:
	mov	0x11, %r14
	.word 0xfedb8e60  ! 2418: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_101:
	mov	0x1d, %r14
	.word 0xfcf38400  ! 2420: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_2_186:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_186), 16, 16)) -> intp(2, 0, 39)
iob_intr_2_187:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_187), 16, 16)) -> intp(2, 0, 37)
iob_intr_2_188:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_188), 16, 16)) -> intp(2, 0, 11)
	.word 0xbc14c000  ! 2427: OR_R	or 	%r19, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_189:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_189), 16, 16)) -> intp(2, 0, a)
iob_intr_2_190:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_190), 16, 16)) -> intp(2, 0, 5)
iob_intr_2_191:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_191), 16, 16)) -> intp(2, 0, 3b)
	.word 0xf65d2021  ! 2442: LDX_I	ldx	[%r20 + 0x0021], %r27
iob_intr_2_192:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_192), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf2d461ca  ! 2444: LDSHA_I	ldsha	[%r17, + 0x01ca] %asi, %r25
	ta	T_CHANGE_HPRIV
	.word 0xfa558000  ! 2448: LDSH_R	ldsh	[%r22 + %r0], %r29
T2_asi_reg_rd_117:
	mov	0x26, %r14
	.word 0xf4db89e0  ! 2449: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_2_193:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_193), 16, 16)) -> intp(2, 0, 26)
T2_asi_reg_rd_118:
	mov	0x32, %r14
	.word 0xf8db84a0  ! 2452: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_2_185:
	setx	0x30020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc954000  ! 2459: ORcc_R	orcc 	%r21, %r0, %r30
T2_asi_reg_wr_102:
	mov	0x7, %r14
	.word 0xf2f389e0  ! 2460: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf4d5c020  ! 2461: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r26
	.word 0xf60c4000  ! 2462: LDUB_R	ldub	[%r17 + %r0], %r27
	.word 0xfe840020  ! 2468: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r31
iob_intr_2_194:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_194), 16, 16)) -> intp(2, 0, 23)
	ta	T_CHANGE_NONHPRIV
iob_intr_2_195:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_195), 16, 16)) -> intp(2, 0, 3e)
iob_intr_2_196:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_196), 16, 16)) -> intp(2, 0, 12)
	ta	T_CHANGE_TO_TL1
cpu_intr_2_186:
	setx	0x31021f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_187:
	setx	0x33012e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_188:
	setx	0x330336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85de116  ! 2490: LDX_I	ldx	[%r23 + 0x0116], %r28
iob_intr_2_197:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_197), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_rd_119:
	mov	0x3c3, %r14
	.word 0xfcdb8e40  ! 2492: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_rd_120:
	mov	0x1b, %r14
	.word 0xf0db8e40  ! 2493: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T2_asi_reg_wr_103:
	mov	0x3c2, %r14
	.word 0xf2f38e40  ! 2498: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_198:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_198), 16, 16)) -> intp(2, 0, 9)
	.word 0xfe054000  ! 2500: LDUW_R	lduw	[%r21 + %r0], %r31
	.word 0xfad54020  ! 2502: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r29
	.word 0xfe0d8000  ! 2503: LDUB_R	ldub	[%r22 + %r0], %r31
T2_asi_reg_wr_104:
	mov	0x31, %r14
	.word 0xf0f38400  ! 2504: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xba1d2123  ! 2508: XOR_I	xor 	%r20, 0x0123, %r29
T2_asi_reg_wr_105:
	mov	0x3c8, %r14
	.word 0xfaf38e40  ! 2510: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfe458000  ! 2511: LDSW_R	ldsw	[%r22 + %r0], %r31
	.word 0xb6344000  ! 2515: ORN_R	orn 	%r17, %r0, %r27
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982aca  ! 2522: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0aca, %hpstate
	.word 0xf00c8000  ! 2524: LDUB_R	ldub	[%r18 + %r0], %r24
T2_asi_reg_rd_121:
	mov	0x3c5, %r14
	.word 0xfedb8e60  ! 2526: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb0c48000  ! 2527: ADDCcc_R	addccc 	%r18, %r0, %r24
T2_asi_reg_rd_122:
	mov	0x34, %r14
	.word 0xfcdb8400  ! 2529: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_2_199:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_199), 16, 16)) -> intp(2, 0, 4)
	.word 0xb4b52099  ! 2531: ORNcc_I	orncc 	%r20, 0x0099, %r26
	.word 0xfc15c000  ! 2533: LDUH_R	lduh	[%r23 + %r0], %r30
	ta	T_CHANGE_HPRIV
cpu_intr_2_189:
	setx	0x310318, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_190:
	setx	0x310128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe2c4000  ! 2539: ANDN_R	andn 	%r17, %r0, %r31
	.word 0xf8950020  ! 2540: LDUHA_R	lduha	[%r20, %r0] 0x01, %r28
	.word 0xf004c000  ! 2541: LDUW_R	lduw	[%r19 + %r0], %r24
	.word 0xfad44020  ! 2543: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r29
	.word 0xf6c50020  ! 2545: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r27
	.word 0xfa550000  ! 2546: LDSH_R	ldsh	[%r20 + %r0], %r29
	.word 0xf8150000  ! 2550: LDUH_R	lduh	[%r20 + %r0], %r28
	.word 0xfc0ca0dc  ! 2551: LDUB_I	ldub	[%r18 + 0x00dc], %r30
iob_intr_2_200:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_200), 16, 16)) -> intp(2, 0, 39)
	.word 0xf80ce0a5  ! 2554: LDUB_I	ldub	[%r19 + 0x00a5], %r28
	.word 0xfa8dc020  ! 2555: LDUBA_R	lduba	[%r23, %r0] 0x01, %r29
cpu_intr_2_191:
	setx	0x310014, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xfe94e0e2  ! 2562: LDUHA_I	lduha	[%r19, + 0x00e2] %asi, %r31
T2_asi_reg_wr_106:
	mov	0x32, %r14
	.word 0xf2f38e40  ! 2563: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_2_192:
	setx	0x32010c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_193:
	setx	0x300103, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_123:
	mov	0x6, %r14
	.word 0xfedb8e60  ! 2568: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_2_201:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_201), 16, 16)) -> intp(2, 0, 17)
	.word 0xfcd421bc  ! 2571: LDSHA_I	ldsha	[%r16, + 0x01bc] %asi, %r30
	.word 0xf4d4e039  ! 2572: LDSHA_I	ldsha	[%r19, + 0x0039] %asi, %r26
	.word 0xfc448000  ! 2574: LDSW_R	ldsw	[%r18 + %r0], %r30
	.word 0xf0954020  ! 2579: LDUHA_R	lduha	[%r21, %r0] 0x01, %r24
T2_asi_reg_rd_124:
	mov	0x3c3, %r14
	.word 0xf0db8e60  ! 2582: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_2_202:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_202), 16, 16)) -> intp(2, 0, 22)
iob_intr_2_203:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_203), 16, 16)) -> intp(2, 0, 30)
	ta	T_CHANGE_TO_TL0
cpu_intr_2_194:
	setx	0x300106, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_195:
	setx	0x330102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe44208a  ! 2589: LDSW_I	ldsw	[%r16 + 0x008a], %r31
	.word 0xfe5c4000  ! 2590: LDX_R	ldx	[%r17 + %r0], %r31
cpu_intr_2_196:
	setx	0x32033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4d5e172  ! 2592: LDSHA_I	ldsha	[%r23, + 0x0172] %asi, %r26
	.word 0xf2148000  ! 2593: LDUH_R	lduh	[%r18 + %r0], %r25
	.word 0xf4cde015  ! 2594: LDSBA_I	ldsba	[%r23, + 0x0015] %asi, %r26
	.word 0xfa8c8020  ! 2595: LDUBA_R	lduba	[%r18, %r0] 0x01, %r29
cpu_intr_2_197:
	setx	0x320131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8440000  ! 2600: LDSW_R	ldsw	[%r16 + %r0], %r28
T2_asi_reg_rd_125:
	mov	0x3c5, %r14
	.word 0xfadb8e60  ! 2601: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T2_asi_reg_rd_126:
	mov	0x19, %r14
	.word 0xf6db8400  ! 2602: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_127:
	mov	0x1, %r14
	.word 0xf0db8e40  ! 2606: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf05dc000  ! 2609: LDX_R	ldx	[%r23 + %r0], %r24
cpu_intr_2_198:
	setx	0x30023e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_128:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 2614: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_2_199:
	setx	0x33032a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_204:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_204), 16, 16)) -> intp(2, 0, 25)
	.word 0xbf347001  ! 2617: SRLX_I	srlx	%r17, 0x0001, %r31
	.word 0xf085e15a  ! 2619: LDUWA_I	lduwa	[%r23, + 0x015a] %asi, %r24
	.word 0xf2d50020  ! 2620: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r25
iob_intr_2_205:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_205), 16, 16)) -> intp(2, 0, 3c)
	.word 0xb92c8000  ! 2623: SLL_R	sll 	%r18, %r0, %r28
	.word 0xfe5c0000  ! 2624: LDX_R	ldx	[%r16 + %r0], %r31
	.word 0xf8858020  ! 2627: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r28
T2_asi_reg_rd_129:
	mov	0x12, %r14
	.word 0xfcdb8e40  ! 2629: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfa444000  ! 2630: LDSW_R	ldsw	[%r17 + %r0], %r29
cpu_intr_2_200:
	setx	0x300310, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_201:
	setx	0x330213, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_202:
	setx	0x320321, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_206:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_206), 16, 16)) -> intp(2, 0, 13)
T2_asi_reg_rd_130:
	mov	0x3c6, %r14
	.word 0xf2db8e40  ! 2636: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_TO_TL0
iob_intr_2_207:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_207), 16, 16)) -> intp(2, 0, 2)
	.word 0xfc94e03a  ! 2641: LDUHA_I	lduha	[%r19, + 0x003a] %asi, %r30
cpu_intr_2_203:
	setx	0x33030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5d6197  ! 2644: LDX_I	ldx	[%r21 + 0x0197], %r31
	.word 0xf2c4c020  ! 2647: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r25
cpu_intr_2_204:
	setx	0x300121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b4203f  ! 2652: ORNcc_I	orncc 	%r16, 0x003f, %r28
T2_asi_reg_wr_107:
	mov	0x36, %r14
	.word 0xf2f38e80  ! 2657: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T2_asi_reg_rd_131:
	mov	0xd, %r14
	.word 0xf6db8e80  ! 2660: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_2_205:
	setx	0x320030, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_208:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_208), 16, 16)) -> intp(2, 0, 1f)
T2_asi_reg_rd_132:
	mov	0x28, %r14
	.word 0xfedb8e60  ! 2669: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_2_209:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_209), 16, 16)) -> intp(2, 0, 1f)
iob_intr_2_210:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_210), 16, 16)) -> intp(2, 0, 2d)
	.word 0xfa144000  ! 2675: LDUH_R	lduh	[%r17 + %r0], %r29
	.word 0xf68cc020  ! 2677: LDUBA_R	lduba	[%r19, %r0] 0x01, %r27
cpu_intr_2_206:
	setx	0x330211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb89c4000  ! 2683: XORcc_R	xorcc 	%r17, %r0, %r28
cpu_intr_2_207:
	setx	0x300201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc54a12c  ! 2689: LDSH_I	ldsh	[%r18 + 0x012c], %r30
	.word 0xf285a090  ! 2690: LDUWA_I	lduwa	[%r22, + 0x0090] %asi, %r25
cpu_intr_2_208:
	setx	0x300336, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_133:
	mov	0x27, %r14
	.word 0xf6db8400  ! 2695: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xfac4a12c  ! 2696: LDSWA_I	ldswa	[%r18, + 0x012c] %asi, %r29
iob_intr_2_211:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_211), 16, 16)) -> intp(2, 0, 23)
iob_intr_2_212:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_212), 16, 16)) -> intp(2, 0, 35)
cpu_intr_2_209:
	setx	0x330100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe544000  ! 2704: LDSH_R	ldsh	[%r17 + %r0], %r31
iob_intr_2_213:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_213), 16, 16)) -> intp(2, 0, 25)
iob_intr_2_214:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_214), 16, 16)) -> intp(2, 0, 11)
cpu_intr_2_210:
	setx	0x32001d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_215:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_215), 16, 16)) -> intp(2, 0, 26)
cpu_intr_2_211:
	setx	0x31003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8c0020  ! 2719: LDUBA_R	lduba	[%r16, %r0] 0x01, %r29
iob_intr_2_216:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_216), 16, 16)) -> intp(2, 0, 1a)
	.word 0xb29521dc  ! 2723: ORcc_I	orcc 	%r20, 0x01dc, %r25
T2_asi_reg_rd_134:
	mov	0x38, %r14
	.word 0xfadb8e40  ! 2725: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_rd_135:
	mov	0x3c7, %r14
	.word 0xf0db8400  ! 2727: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_2_212:
	setx	0x30022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc8de14f  ! 2731: LDUBA_I	lduba	[%r23, + 0x014f] %asi, %r30
	.word 0xba9da03c  ! 2733: XORcc_I	xorcc 	%r22, 0x003c, %r29
	.word 0xf6156023  ! 2734: LDUH_I	lduh	[%r21 + 0x0023], %r27
cpu_intr_2_213:
	setx	0x33003f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_217:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_217), 16, 16)) -> intp(2, 0, 2c)
cpu_intr_2_214:
	setx	0x300029, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_108:
	mov	0x3c4, %r14
	.word 0xfef38e40  ! 2741: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_2_215:
	setx	0x37023e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_218:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_218), 16, 16)) -> intp(2, 0, 2b)
	ta	T_CHANGE_TO_TL0
iob_intr_2_219:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_219), 16, 16)) -> intp(2, 0, 20)
	.word 0xf244a110  ! 2752: LDSW_I	ldsw	[%r18 + 0x0110], %r25
	.word 0xbb508000  ! 2753: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_109:
	mov	0x3c3, %r14
	.word 0xf0f384a0  ! 2760: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_2_216:
	setx	0x340310, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_136:
	mov	0x3c2, %r14
	.word 0xf4db89e0  ! 2763: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_2_217:
	setx	0x370333, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf2858020  ! 2767: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r25
	.word 0xfe15e1c0  ! 2768: LDUH_I	lduh	[%r23 + 0x01c0], %r31
	.word 0xf2050000  ! 2771: LDUW_R	lduw	[%r20 + %r0], %r25
T2_asi_reg_rd_137:
	mov	0x3c4, %r14
	.word 0xf2db8e80  ! 2774: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T2_asi_reg_wr_110:
	mov	0x17, %r14
	.word 0xfcf389e0  ! 2778: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf2558000  ! 2783: LDSH_R	ldsh	[%r22 + %r0], %r25
	.word 0xf68c4020  ! 2787: LDUBA_R	lduba	[%r17, %r0] 0x01, %r27
cpu_intr_2_218:
	setx	0x37030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc858020  ! 2790: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r30
	.word 0xfa0dc000  ! 2791: LDUB_R	ldub	[%r23 + %r0], %r29
iob_intr_2_220:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_220), 16, 16)) -> intp(2, 0, 36)
	.word 0xb1643801  ! 2798: MOVcc_I	<illegal instruction>
cpu_intr_2_219:
	setx	0x350017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64d2051  ! 2802: LDSB_I	ldsb	[%r20 + 0x0051], %r27
	.word 0xfa0c0000  ! 2803: LDUB_R	ldub	[%r16 + %r0], %r29
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_220:
	setx	0x35020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf054c000  ! 2818: LDSH_R	ldsh	[%r19 + %r0], %r24
	ta	T_CHANGE_NONHPRIV
	.word 0xba3d8000  ! 2820: XNOR_R	xnor 	%r22, %r0, %r29
iob_intr_2_221:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_221), 16, 16)) -> intp(2, 0, d)
iob_intr_2_222:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_222), 16, 16)) -> intp(2, 0, 8)
T2_asi_reg_wr_111:
	mov	0x2b, %r14
	.word 0xf8f384a0  ! 2825: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb0350000  ! 2828: ORN_R	orn 	%r20, %r0, %r24
iob_intr_2_223:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_223), 16, 16)) -> intp(2, 0, 38)
	.word 0xb52d3001  ! 2830: SLLX_I	sllx	%r20, 0x0001, %r26
	.word 0xf08c0020  ! 2831: LDUBA_R	lduba	[%r16, %r0] 0x01, %r24
	.word 0xb32cd000  ! 2832: SLLX_R	sllx	%r19, %r0, %r25
T2_asi_reg_rd_138:
	mov	0x28, %r14
	.word 0xf0db89e0  ! 2835: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	ta	T_CHANGE_HPRIV
cpu_intr_2_221:
	setx	0x370204, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_112:
	mov	0x20, %r14
	.word 0xf2f38400  ! 2841: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T2_asi_reg_wr_113:
	mov	0x2, %r14
	.word 0xf2f38e60  ! 2843: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xfcd421f0  ! 2844: LDSHA_I	ldsha	[%r16, + 0x01f0] %asi, %r30
	.word 0xf64d0000  ! 2845: LDSB_R	ldsb	[%r20 + %r0], %r27
	.word 0xb33d4000  ! 2846: SRA_R	sra 	%r21, %r0, %r25
cpu_intr_2_222:
	setx	0x350126, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_223:
	setx	0x360135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf28d0020  ! 2854: LDUBA_R	lduba	[%r20, %r0] 0x01, %r25
cpu_intr_2_224:
	setx	0x35012b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_114:
	mov	0x3c5, %r14
	.word 0xfaf38400  ! 2859: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T2_asi_reg_wr_115:
	mov	0x16, %r14
	.word 0xf8f389e0  ! 2860: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_2_224:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_224), 16, 16)) -> intp(2, 0, 1)
	.word 0xf0cc0020  ! 2863: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r24
cpu_intr_2_225:
	setx	0x370212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf054e03e  ! 2867: LDSH_I	ldsh	[%r19 + 0x003e], %r24
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983b82  ! 2868: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b82, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0xf00d20c9  ! 2870: LDUB_I	ldub	[%r20 + 0x00c9], %r24
	ta	T_CHANGE_TO_TL0
	.word 0xf61560d5  ! 2872: LDUH_I	lduh	[%r21 + 0x00d5], %r27
T2_asi_reg_rd_139:
	mov	0x1e, %r14
	.word 0xf4db8e40  ! 2873: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_2_225:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_225), 16, 16)) -> intp(2, 0, 14)
	setx	data_start_1, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983a08  ! 2876: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a08, %hpstate
T2_asi_reg_rd_140:
	mov	0x3c3, %r14
	.word 0xf8db8e40  ! 2877: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	ta	T_CHANGE_NONHPRIV
	.word 0xf2146120  ! 2879: LDUH_I	lduh	[%r17 + 0x0120], %r25
T2_asi_reg_wr_116:
	mov	0x11, %r14
	.word 0xfaf38e40  ! 2881: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_226:
	setx	0x350221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc940020  ! 2887: LDUHA_R	lduha	[%r16, %r0] 0x01, %r30
iob_intr_2_226:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_226), 16, 16)) -> intp(2, 0, 29)
iob_intr_2_227:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_227), 16, 16)) -> intp(2, 0, 22)
iob_intr_2_228:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_228), 16, 16)) -> intp(2, 0, 28)
	.word 0xfc45e1b0  ! 2895: LDSW_I	ldsw	[%r23 + 0x01b0], %r30
iob_intr_2_229:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_229), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_227:
	setx	0x360222, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_141:
	mov	0x31, %r14
	.word 0xfcdb8e40  ! 2900: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_rd_142:
	mov	0x30, %r14
	.word 0xfadb8400  ! 2905: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T2_asi_reg_rd_143:
	mov	0x9, %r14
	.word 0xf8db8e80  ! 2906: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf24d6178  ! 2908: LDSB_I	ldsb	[%r21 + 0x0178], %r25
	.word 0xb72dc000  ! 2909: SLL_R	sll 	%r23, %r0, %r27
iob_intr_2_230:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_230), 16, 16)) -> intp(2, 0, 26)
	ta	T_CHANGE_HPRIV
iob_intr_2_231:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_231), 16, 16)) -> intp(2, 0, e)
iob_intr_2_232:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_232), 16, 16)) -> intp(2, 0, a)
	ta	T_CHANGE_TO_TL1
	.word 0xf0dc6063  ! 2924: LDXA_I	ldxa	[%r17, + 0x0063] %asi, %r24
	ta	T_CHANGE_HPRIV
	.word 0xfc554000  ! 2926: LDSH_R	ldsh	[%r21 + %r0], %r30
	ta	T_CHANGE_TO_TL0
	.word 0xfa84a13d  ! 2929: LDUWA_I	lduwa	[%r18, + 0x013d] %asi, %r29
iob_intr_2_233:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_233), 16, 16)) -> intp(2, 0, 25)
	.word 0xfe550000  ! 2932: LDSH_R	ldsh	[%r20 + %r0], %r31
iob_intr_2_234:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_234), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf4c40020  ! 2936: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r26
	.word 0xf0c4a07a  ! 2940: LDSWA_I	ldswa	[%r18, + 0x007a] %asi, %r24
	.word 0xf0cc2188  ! 2941: LDSBA_I	ldsba	[%r16, + 0x0188] %asi, %r24
T2_asi_reg_rd_144:
	mov	0x1, %r14
	.word 0xfcdb84a0  ! 2945: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_2_235:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_235), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_228:
	setx	0x360014, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_236:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_236), 16, 16)) -> intp(2, 0, 3)
	.word 0xf0454000  ! 2952: LDSW_R	ldsw	[%r21 + %r0], %r24
cpu_intr_2_229:
	setx	0x350338, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_145:
	mov	0x3c3, %r14
	.word 0xfcdb8e60  ! 2954: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	ta	T_CHANGE_TO_TL0
	.word 0xf4dda1b2  ! 2956: LDXA_I	ldxa	[%r22, + 0x01b2] %asi, %r26
	.word 0xf4844020  ! 2957: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r26
iob_intr_2_237:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_237), 16, 16)) -> intp(2, 0, 11)
	.word 0xf2454000  ! 2960: LDSW_R	ldsw	[%r21 + %r0], %r25
iob_intr_2_238:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_238), 16, 16)) -> intp(2, 0, 6)
	.word 0xf4c4c020  ! 2962: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r26
	.word 0xf6958020  ! 2966: LDUHA_R	lduha	[%r22, %r0] 0x01, %r27
iob_intr_2_239:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_239), 16, 16)) -> intp(2, 0, 31)
	.word 0xfac5e065  ! 2970: LDSWA_I	ldswa	[%r23, + 0x0065] %asi, %r29
	.word 0xb02d8000  ! 2972: ANDN_R	andn 	%r22, %r0, %r24
	.word 0xf655e0e5  ! 2974: LDSH_I	ldsh	[%r23 + 0x00e5], %r27
	.word 0xbf354000  ! 2975: SRL_R	srl 	%r21, %r0, %r31
cpu_intr_2_230:
	setx	0x37023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_117:
	mov	0x3c2, %r14
	.word 0xfcf384a0  ! 2981: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf24d4000  ! 2983: LDSB_R	ldsb	[%r21 + %r0], %r25
iob_intr_2_240:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_240), 16, 16)) -> intp(2, 0, 32)
	.word 0xfc5461b0  ! 2985: LDSH_I	ldsh	[%r17 + 0x01b0], %r30
	.word 0xf8dc21be  ! 2986: LDXA_I	ldxa	[%r16, + 0x01be] %asi, %r28
T2_asi_reg_rd_146:
	mov	0x24, %r14
	.word 0xfadb8e80  ! 2987: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_2_231:
	setx	0x360015, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_147:
	mov	0x1f, %r14
	.word 0xfadb89e0  ! 2990: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T2_asi_reg_wr_118:
	mov	0x3c1, %r14
	.word 0xf8f384a0  ! 2991: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xfc54e130  ! 2992: LDSH_I	ldsh	[%r19 + 0x0130], %r30
	.word 0xfc054000  ! 2993: LDUW_R	lduw	[%r21 + %r0], %r30
cpu_intr_2_232:
	setx	0x350219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6d46023  ! 2997: LDSHA_I	ldsha	[%r17, + 0x0023] %asi, %r27
cpu_intr_2_233:
	setx	0x36000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d48020  ! 3003: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r25
	.word 0xfe8520b7  ! 3005: LDUWA_I	lduwa	[%r20, + 0x00b7] %asi, %r31
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983d58  ! 3008: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d58, %hpstate
cpu_intr_2_234:
	setx	0x370336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf294a113  ! 3011: LDUHA_I	lduha	[%r18, + 0x0113] %asi, %r25
cpu_intr_2_235:
	setx	0x37031b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_241:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_241), 16, 16)) -> intp(2, 0, 2)
	.word 0xfc940020  ! 3017: LDUHA_R	lduha	[%r16, %r0] 0x01, %r30
	.word 0xfa144000  ! 3019: LDUH_R	lduh	[%r17 + %r0], %r29
	.word 0xf6958020  ! 3021: LDUHA_R	lduha	[%r22, %r0] 0x01, %r27
cpu_intr_2_236:
	setx	0x360305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb13ce001  ! 3023: SRA_I	sra 	%r19, 0x0001, %r24
T2_asi_reg_wr_119:
	mov	0x14, %r14
	.word 0xfef38e60  ! 3026: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfa8ce004  ! 3027: LDUBA_I	lduba	[%r19, + 0x0004] %asi, %r29
	.word 0x8394e189  ! 3028: WRPR_TNPC_I	wrpr	%r19, 0x0189, %tnpc
cpu_intr_2_237:
	setx	0x350301, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_238:
	setx	0x36011e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_239:
	setx	0x370216, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_240:
	setx	0x36013b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_241:
	setx	0x37023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0158000  ! 3035: LDUH_R	lduh	[%r22 + %r0], %r24
cpu_intr_2_242:
	setx	0x370339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45ce030  ! 3038: LDX_I	ldx	[%r19 + 0x0030], %r26
	.word 0xf25d8000  ! 3039: LDX_R	ldx	[%r22 + %r0], %r25
cpu_intr_2_243:
	setx	0x350209, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_244:
	setx	0x35033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb03461d2  ! 3047: ORN_I	orn 	%r17, 0x01d2, %r24
	.word 0xf254c000  ! 3049: LDSH_R	ldsh	[%r19 + %r0], %r25
	.word 0xf0ccc020  ! 3050: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r24
T2_asi_reg_rd_148:
	mov	0x3c7, %r14
	.word 0xf4db8e40  ! 3052: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_2_245:
	setx	0x360121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf285c020  ! 3062: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r25
	.word 0xbeb4c000  ! 3064: ORNcc_R	orncc 	%r19, %r0, %r31
T2_asi_reg_wr_120:
	mov	0x9, %r14
	.word 0xf2f389e0  ! 3069: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T2_asi_reg_wr_121:
	mov	0x8, %r14
	.word 0xf2f384a0  ! 3070: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb83461c1  ! 3071: ORN_I	orn 	%r17, 0x01c1, %r28
	.word 0xfa454000  ! 3074: LDSW_R	ldsw	[%r21 + %r0], %r29
	.word 0xb9349000  ! 3076: SRLX_R	srlx	%r18, %r0, %r28
	.word 0xbcb44000  ! 3078: ORNcc_R	orncc 	%r17, %r0, %r30
iob_intr_2_242:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_242), 16, 16)) -> intp(2, 0, 11)
T2_asi_reg_wr_122:
	mov	0x34, %r14
	.word 0xf6f38e80  ! 3081: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T2_asi_reg_wr_123:
	mov	0x3c5, %r14
	.word 0xf6f38400  ! 3084: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xfcdc20a0  ! 3085: LDXA_I	ldxa	[%r16, + 0x00a0] %asi, %r30
cpu_intr_2_246:
	setx	0x340313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf495c020  ! 3088: LDUHA_R	lduha	[%r23, %r0] 0x01, %r26
	.word 0xb8a460f1  ! 3090: SUBcc_I	subcc 	%r17, 0x00f1, %r28
	.word 0xbe358000  ! 3096: ORN_R	orn 	%r22, %r0, %r31
	.word 0xf80c4000  ! 3100: LDUB_R	ldub	[%r17 + %r0], %r28
T2_asi_reg_rd_149:
	mov	0x1f, %r14
	.word 0xf2db8e40  ! 3103: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf65c217e  ! 3105: LDX_I	ldx	[%r16 + 0x017e], %r27
	.word 0xfad4c020  ! 3106: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r29
	.word 0xf84ce0b2  ! 3110: LDSB_I	ldsb	[%r19 + 0x00b2], %r28
	.word 0xfcc46113  ! 3113: LDSWA_I	ldswa	[%r17, + 0x0113] %asi, %r30
	.word 0xfac42110  ! 3115: LDSWA_I	ldswa	[%r16, + 0x0110] %asi, %r29
cpu_intr_2_247:
	setx	0x35000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2946129  ! 3118: ORcc_I	orcc 	%r17, 0x0129, %r25
cpu_intr_2_248:
	setx	0x350223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7480000  ! 3120: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	ta	T_CHANGE_TO_TL0
iob_intr_2_243:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_243), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_249:
	setx	0x370116, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_150:
	mov	0x29, %r14
	.word 0xfadb8e40  ! 3129: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_2_244:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_244), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf2554000  ! 3133: LDSH_R	ldsh	[%r21 + %r0], %r25
cpu_intr_2_250:
	setx	0x360136, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_124:
	mov	0x3c2, %r14
	.word 0xf0f389e0  ! 3140: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_2_251:
	setx	0x360206, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_151:
	mov	0x19, %r14
	.word 0xf4db8e80  ! 3145: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T2_asi_reg_rd_152:
	mov	0x1d, %r14
	.word 0xf4db8e40  ! 3146: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_rd_153:
	mov	0x24, %r14
	.word 0xf0db8e80  ! 3147: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_2_245:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_245), 16, 16)) -> intp(2, 0, 8)
cpu_intr_2_252:
	setx	0x36030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x8198388a  ! 3153: WRHPR_HPSTATE_I	wrhpr	%r0, 0x188a, %hpstate
	.word 0xf245c000  ! 3154: LDSW_R	ldsw	[%r23 + %r0], %r25
	.word 0xb9508000  ! 3159: RDPR_TSTATE	<illegal instruction>
iob_intr_2_246:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_246), 16, 16)) -> intp(2, 0, 7)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf6d5e0ca  ! 3166: LDSHA_I	ldsha	[%r23, + 0x00ca] %asi, %r27
T2_asi_reg_wr_125:
	mov	0x3c6, %r14
	.word 0xf8f38e80  ! 3167: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T2_asi_reg_wr_126:
	mov	0x30, %r14
	.word 0xfef384a0  ! 3169: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_2_253:
	setx	0x340332, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_247:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_247), 16, 16)) -> intp(2, 0, 5)
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
	.word 0xf255e1b3  ! 3175: LDSH_I	ldsh	[%r23 + 0x01b3], %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf0d4206f  ! 3180: LDSHA_I	ldsha	[%r16, + 0x006f] %asi, %r24
cpu_intr_2_254:
	setx	0x340119, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_154:
	mov	0x3c8, %r14
	.word 0xf4db8e40  ! 3189: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfec48020  ! 3196: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r31
iob_intr_2_248:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_248), 16, 16)) -> intp(2, 0, e)
	ta	T_CHANGE_HPRIV
	.word 0x89956039  ! 3200: WRPR_TICK_I	wrpr	%r21, 0x0039, %tick
T2_asi_reg_wr_127:
	mov	0x3c2, %r14
	.word 0xf6f389e0  ! 3202: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb8a52019  ! 3203: SUBcc_I	subcc 	%r20, 0x0019, %r28
cpu_intr_2_255:
	setx	0x39010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_155:
	mov	0x10, %r14
	.word 0xfadb8e60  ! 3206: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_2_256:
	setx	0x3a0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa050000  ! 3208: LDUW_R	lduw	[%r20 + %r0], %r29
T2_asi_reg_rd_156:
	mov	0x1d, %r14
	.word 0xf4db8e60  ! 3211: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_2_249:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_249), 16, 16)) -> intp(2, 0, 28)
iob_intr_2_250:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_250), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_257:
	setx	0x3b022c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_258:
	setx	0x380301, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_259:
	setx	0x390120, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_157:
	mov	0x34, %r14
	.word 0xfcdb8400  ! 3228: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T2_asi_reg_rd_158:
	mov	0x3c7, %r14
	.word 0xf0db8e60  ! 3230: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T2_asi_reg_rd_159:
	mov	0x3c1, %r14
	.word 0xf2db8e60  ! 3240: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_2_251:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_251), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf445a193  ! 3243: LDSW_I	ldsw	[%r22 + 0x0193], %r26
	.word 0xb9643801  ! 3247: MOVcc_I	<illegal instruction>
	ta	T_CHANGE_TO_TL0
iob_intr_2_252:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_252), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_rd_160:
	mov	0x3c1, %r14
	.word 0xf2db8400  ! 3252: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_161:
	mov	0x3c8, %r14
	.word 0xf6db84a0  ! 3255: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_2_260:
	setx	0x3b002f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_128:
	mov	0x1d, %r14
	.word 0xf4f38e80  ! 3260: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982b80  ! 3261: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b80, %hpstate
cpu_intr_2_261:
	setx	0x3b0322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_262:
	setx	0x3b0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2cc21f9  ! 3271: LDSBA_I	ldsba	[%r16, + 0x01f9] %asi, %r25
	.word 0xf60c60d0  ! 3272: LDUB_I	ldub	[%r17 + 0x00d0], %r27
	.word 0xb83ca139  ! 3273: XNOR_I	xnor 	%r18, 0x0139, %r28
iob_intr_2_253:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_253), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf24dc000  ! 3280: LDSB_R	ldsb	[%r23 + %r0], %r25
	.word 0xfa04a123  ! 3281: LDUW_I	lduw	[%r18 + 0x0123], %r29
iob_intr_2_254:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_254), 16, 16)) -> intp(2, 0, 2c)
iob_intr_2_255:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_255), 16, 16)) -> intp(2, 0, 35)
	.word 0xfc958020  ! 3286: LDUHA_R	lduha	[%r22, %r0] 0x01, %r30
	.word 0xfed5c020  ! 3291: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r31
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_162:
	mov	0x7, %r14
	.word 0xf8db8400  ! 3296: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb015c000  ! 3297: OR_R	or 	%r23, %r0, %r24
	.word 0xb61d4000  ! 3299: XOR_R	xor 	%r21, %r0, %r27
iob_intr_2_256:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_256), 16, 16)) -> intp(2, 0, 3c)
	.word 0xfa85c020  ! 3302: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r29
	.word 0xf6c5e04b  ! 3303: LDSWA_I	ldswa	[%r23, + 0x004b] %asi, %r27
	.word 0xf4d54020  ! 3304: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r26
	.word 0xf0d4c020  ! 3305: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r24
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982b50  ! 3306: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b50, %hpstate
T2_asi_reg_wr_129:
	mov	0x14, %r14
	.word 0xf4f38400  ! 3307: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb4c561fd  ! 3309: ADDCcc_I	addccc 	%r21, 0x01fd, %r26
cpu_intr_2_263:
	setx	0x390016, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_163:
	mov	0x32, %r14
	.word 0xf0db8e40  ! 3312: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_2_257:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_257), 16, 16)) -> intp(2, 0, 2d)
cpu_intr_2_264:
	setx	0x3a020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfecce1b6  ! 3316: LDSBA_I	ldsba	[%r19, + 0x01b6] %asi, %r31
cpu_intr_2_265:
	setx	0x3b0020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb80c0000  ! 3318: AND_R	and 	%r16, %r0, %r28
	.word 0xf85c2141  ! 3319: LDX_I	ldx	[%r16 + 0x0141], %r28
	.word 0xf455e188  ! 3321: LDSH_I	ldsh	[%r23 + 0x0188], %r26
iob_intr_2_258:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_258), 16, 16)) -> intp(2, 0, 1)
	.word 0xb2c40000  ! 3323: ADDCcc_R	addccc 	%r16, %r0, %r25
	.word 0xbd2d8000  ! 3324: SLL_R	sll 	%r22, %r0, %r30
	.word 0xf25d0000  ! 3325: LDX_R	ldx	[%r20 + %r0], %r25
	.word 0xf24421a8  ! 3326: LDSW_I	ldsw	[%r16 + 0x01a8], %r25
T2_asi_reg_wr_130:
	mov	0xd, %r14
	.word 0xf8f389e0  ! 3327: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf815218b  ! 3328: LDUH_I	lduh	[%r20 + 0x018b], %r28
iob_intr_2_259:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_259), 16, 16)) -> intp(2, 0, 2e)
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_TO_TL1
	.word 0xf444c000  ! 3341: LDSW_R	ldsw	[%r19 + %r0], %r26
	.word 0xfad4c020  ! 3342: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r29
iob_intr_2_260:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_260), 16, 16)) -> intp(2, 0, 3)
	.word 0xf65c61bf  ! 3344: LDX_I	ldx	[%r17 + 0x01bf], %r27
T2_asi_reg_rd_164:
	mov	0x22, %r14
	.word 0xf6db8e40  ! 3347: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_2_266:
	setx	0x39013c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_261:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_261), 16, 16)) -> intp(2, 0, 18)
cpu_intr_2_267:
	setx	0x3a0023, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_131:
	mov	0x3c7, %r14
	.word 0xf8f38e80  ! 3352: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf6c50020  ! 3353: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r27
cpu_intr_2_268:
	setx	0x3a013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_132:
	mov	0x3c7, %r14
	.word 0xf6f389e0  ! 3360: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xfac4c020  ! 3361: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r29
iob_intr_2_262:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_262), 16, 16)) -> intp(2, 0, 20)
	.word 0xf24d6103  ! 3363: LDSB_I	ldsb	[%r21 + 0x0103], %r25
	.word 0xfe8c8020  ! 3364: LDUBA_R	lduba	[%r18, %r0] 0x01, %r31
	.word 0xf2848020  ! 3365: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r25
T2_asi_reg_wr_133:
	mov	0x3c5, %r14
	.word 0xf6f384a0  ! 3371: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb5643801  ! 3373: MOVcc_I	<illegal instruction>
iob_intr_2_263:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_263), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_wr_134:
	mov	0x8, %r14
	.word 0xf8f38e40  ! 3378: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL0
	.word 0xf8d48020  ! 3382: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r28
cpu_intr_2_269:
	setx	0x38001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_135:
	mov	0x3c4, %r14
	.word 0xf6f38e60  ! 3385: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T2_asi_reg_wr_136:
	mov	0x35, %r14
	.word 0xfcf38e80  ! 3387: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_2_270:
	setx	0x3a0316, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_271:
	setx	0x3a000b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_272:
	setx	0x380319, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_165:
	mov	0x3c2, %r14
	.word 0xf4db8400  ! 3397: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T2_asi_reg_rd_166:
	mov	0x3c2, %r14
	.word 0xf2db8400  ! 3398: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_2_264:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_264), 16, 16)) -> intp(2, 0, d)
	ta	T_CHANGE_TO_TL1
	.word 0xf4050000  ! 3404: LDUW_R	lduw	[%r20 + %r0], %r26
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_167:
	mov	0x1a, %r14
	.word 0xf8db8e60  ! 3406: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf45520a6  ! 3407: LDSH_I	ldsh	[%r20 + 0x00a6], %r26
	.word 0xf2dca17f  ! 3408: LDXA_I	ldxa	[%r18, + 0x017f] %asi, %r25
	.word 0xf0548000  ! 3410: LDSH_R	ldsh	[%r18 + %r0], %r24
cpu_intr_2_273:
	setx	0x390212, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_137:
	mov	0x2b, %r14
	.word 0xf0f38e60  ! 3419: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xfa45a091  ! 3422: LDSW_I	ldsw	[%r22 + 0x0091], %r29
	.word 0xbd2d3001  ! 3423: SLLX_I	sllx	%r20, 0x0001, %r30
cpu_intr_2_274:
	setx	0x38020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc44a1e1  ! 3427: LDSW_I	ldsw	[%r18 + 0x01e1], %r30
	.word 0xf6856051  ! 3430: LDUWA_I	lduwa	[%r21, + 0x0051] %asi, %r27
	.word 0xba948000  ! 3431: ORcc_R	orcc 	%r18, %r0, %r29
cpu_intr_2_275:
	setx	0x380039, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_265:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_265), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf84c4000  ! 3437: LDSB_R	ldsb	[%r17 + %r0], %r28
cpu_intr_2_276:
	setx	0x39031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8558000  ! 3440: LDSH_R	ldsh	[%r22 + %r0], %r28
iob_intr_2_266:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_266), 16, 16)) -> intp(2, 0, 24)
T2_asi_reg_rd_168:
	mov	0x17, %r14
	.word 0xfcdb8e40  ! 3447: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf01561d3  ! 3448: LDUH_I	lduh	[%r21 + 0x01d3], %r24
T2_asi_reg_rd_169:
	mov	0x3c6, %r14
	.word 0xfcdb8e80  ! 3451: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xfa5ca1ad  ! 3453: LDX_I	ldx	[%r18 + 0x01ad], %r29
	.word 0xf48c0020  ! 3455: LDUBA_R	lduba	[%r16, %r0] 0x01, %r26
	.word 0xf48d4020  ! 3458: LDUBA_R	lduba	[%r21, %r0] 0x01, %r26
	.word 0x91946108  ! 3459: WRPR_PIL_I	wrpr	%r17, 0x0108, %pil
	.word 0xf68c0020  ! 3460: LDUBA_R	lduba	[%r16, %r0] 0x01, %r27
	.word 0xf68c2164  ! 3464: LDUBA_I	lduba	[%r16, + 0x0164] %asi, %r27
	.word 0xfc944020  ! 3465: LDUHA_R	lduha	[%r17, %r0] 0x01, %r30
	.word 0xfa4da028  ! 3466: LDSB_I	ldsb	[%r22 + 0x0028], %r29
	.word 0xfc15c000  ! 3467: LDUH_R	lduh	[%r23 + %r0], %r30
T2_asi_reg_rd_170:
	mov	0x27, %r14
	.word 0xfedb84a0  ! 3468: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xfa4c4000  ! 3469: LDSB_R	ldsb	[%r17 + %r0], %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_277:
	setx	0x39011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_171:
	mov	0x3c0, %r14
	.word 0xf6db8400  ! 3484: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_267:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_267), 16, 16)) -> intp(2, 0, 20)
	.word 0xfe4c20fd  ! 3488: LDSB_I	ldsb	[%r16 + 0x00fd], %r31
	ta	T_CHANGE_TO_TL1
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x8198289a  ! 3491: WRHPR_HPSTATE_I	wrhpr	%r0, 0x089a, %hpstate
T2_asi_reg_wr_138:
	mov	0x3c4, %r14
	.word 0xf0f38400  ! 3492: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xfa0d60a2  ! 3497: LDUB_I	ldub	[%r21 + 0x00a2], %r29
	.word 0xfe4ce1c3  ! 3498: LDSB_I	ldsb	[%r19 + 0x01c3], %r31
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x819829c2  ! 3501: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c2, %hpstate
	.word 0xf6dc6038  ! 3502: LDXA_I	ldxa	[%r17, + 0x0038] %asi, %r27
	.word 0xf20c0000  ! 3505: LDUB_R	ldub	[%r16 + %r0], %r25
T2_asi_reg_rd_172:
	mov	0x3c2, %r14
	.word 0xfedb84a0  ! 3506: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xfad4a0c1  ! 3507: LDSHA_I	ldsha	[%r18, + 0x00c1] %asi, %r29
cpu_intr_2_278:
	setx	0x3a0239, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_139:
	mov	0x30, %r14
	.word 0xfef38400  ! 3513: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_2_268:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_268), 16, 16)) -> intp(2, 0, 17)
cpu_intr_2_279:
	setx	0x3b0300, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_269:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_269), 16, 16)) -> intp(2, 0, 2)
T2_asi_reg_rd_173:
	mov	0x3c6, %r14
	.word 0xfcdb8e80  ! 3518: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf2944020  ! 3520: LDUHA_R	lduha	[%r17, %r0] 0x01, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf84da133  ! 3523: LDSB_I	ldsb	[%r22 + 0x0133], %r28
	.word 0xf20dc000  ! 3524: LDUB_R	ldub	[%r23 + %r0], %r25
cpu_intr_2_280:
	setx	0x390038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc154000  ! 3527: LDUH_R	lduh	[%r21 + %r0], %r30
iob_intr_2_270:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_270), 16, 16)) -> intp(2, 0, 37)
	.word 0xfa4c2078  ! 3531: LDSB_I	ldsb	[%r16 + 0x0078], %r29
cpu_intr_2_281:
	setx	0x3b033f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_282:
	setx	0x3a0220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4cd8020  ! 3535: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r26
	.word 0xf0d54020  ! 3536: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r24
	.word 0xfac48020  ! 3537: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r29
	.word 0xbb3da001  ! 3539: SRA_I	sra 	%r22, 0x0001, %r29
iob_intr_2_271:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_271), 16, 16)) -> intp(2, 0, 3c)
iob_intr_2_272:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_272), 16, 16)) -> intp(2, 0, 13)
	.word 0xfa5c8000  ! 3548: LDX_R	ldx	[%r18 + %r0], %r29
	.word 0xfe948020  ! 3549: LDUHA_R	lduha	[%r18, %r0] 0x01, %r31
iob_intr_2_273:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_273), 16, 16)) -> intp(2, 0, 4)
cpu_intr_2_283:
	setx	0x3b0223, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_174:
	mov	0x1f, %r14
	.word 0xf2db8e80  ! 3556: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_175:
	mov	0x23, %r14
	.word 0xf8db89e0  ! 3561: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	ta	T_CHANGE_NONHPRIV
	.word 0xbaa5a063  ! 3565: SUBcc_I	subcc 	%r22, 0x0063, %r29
cpu_intr_2_284:
	setx	0x390137, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_274:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_274), 16, 16)) -> intp(2, 0, 36)
cpu_intr_2_285:
	setx	0x3a010c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_176:
	mov	0x13, %r14
	.word 0xf6db8400  ! 3571: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T2_asi_reg_rd_177:
	mov	0x3c6, %r14
	.word 0xfcdb8e40  ! 3573: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_rd_178:
	mov	0xf, %r14
	.word 0xf6db89e0  ! 3574: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_2_286:
	setx	0x380130, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983fd0  ! 3576: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fd0, %hpstate
T2_asi_reg_wr_140:
	mov	0x1a, %r14
	.word 0xf0f38e80  ! 3577: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_2_287:
	setx	0x3a0130, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
cpu_intr_2_288:
	setx	0x39033d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_275:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_275), 16, 16)) -> intp(2, 0, b)
	.word 0xf40d0000  ! 3583: LDUB_R	ldub	[%r20 + %r0], %r26
cpu_intr_2_289:
	setx	0x3a003e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_276:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_276), 16, 16)) -> intp(2, 0, 3c)
cpu_intr_2_290:
	setx	0x39030f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_277:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_277), 16, 16)) -> intp(2, 0, 25)
iob_intr_2_278:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_278), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_rd_179:
	mov	0x0, %r14
	.word 0xfcdb8e40  ! 3593: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_2_279:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_279), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_rd_180:
	mov	0x3c5, %r14
	.word 0xf2db8e80  ! 3596: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf604e075  ! 3597: LDUW_I	lduw	[%r19 + 0x0075], %r27
	.word 0xf2556084  ! 3599: LDSH_I	ldsh	[%r21 + 0x0084], %r25
iob_intr_2_280:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_280), 16, 16)) -> intp(2, 0, 30)
iob_intr_2_281:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_281), 16, 16)) -> intp(2, 0, 3b)
	.word 0xfcc520ba  ! 3604: LDSWA_I	ldswa	[%r20, + 0x00ba] %asi, %r30
	.word 0xb72df001  ! 3606: SLLX_I	sllx	%r23, 0x0001, %r27
	.word 0xf8d5a16b  ! 3608: LDSHA_I	ldsha	[%r22, + 0x016b] %asi, %r28
	.word 0xf685a098  ! 3612: LDUWA_I	lduwa	[%r22, + 0x0098] %asi, %r27
cpu_intr_2_291:
	setx	0x3b023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_292:
	setx	0x3b0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8d4e0c1  ! 3618: LDSHA_I	ldsha	[%r19, + 0x00c1] %asi, %r28
	.word 0xb8ada1dd  ! 3620: ANDNcc_I	andncc 	%r22, 0x01dd, %r28
iob_intr_2_282:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_282), 16, 16)) -> intp(2, 0, 3d)
iob_intr_2_283:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_283), 16, 16)) -> intp(2, 0, 21)
	.word 0xf84421ef  ! 3628: LDSW_I	ldsw	[%r16 + 0x01ef], %r28
	ta	T_CHANGE_TO_TL1
	.word 0xf65c611c  ! 3636: LDX_I	ldx	[%r17 + 0x011c], %r27
	.word 0xfe5d20e4  ! 3639: LDX_I	ldx	[%r20 + 0x00e4], %r31
T2_asi_reg_rd_181:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 3646: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfecca069  ! 3647: LDSBA_I	ldsba	[%r18, + 0x0069] %asi, %r31
T2_asi_reg_rd_182:
	mov	0x3c8, %r14
	.word 0xf8db8e40  ! 3648: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_2_284:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_284), 16, 16)) -> intp(2, 0, 30)
	.word 0xfa840020  ! 3651: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r29
iob_intr_2_285:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_285), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_wr_141:
	mov	0x3c3, %r14
	.word 0xf4f384a0  ! 3663: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_2_286:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_286), 16, 16)) -> intp(2, 0, 1b)
	.word 0xfe4c4000  ! 3668: LDSB_R	ldsb	[%r17 + %r0], %r31
	.word 0xf80dc000  ! 3669: LDUB_R	ldub	[%r23 + %r0], %r28
	.word 0xf054a164  ! 3670: LDSH_I	ldsh	[%r18 + 0x0164], %r24
	.word 0xbcb5600e  ! 3675: SUBCcc_I	orncc 	%r21, 0x000e, %r30
	.word 0xf44c0000  ! 3676: LDSB_R	ldsb	[%r16 + %r0], %r26
cpu_intr_2_293:
	setx	0x3f020e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_294:
	setx	0x3e033b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_287:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_287), 16, 16)) -> intp(2, 0, b)
	.word 0xb695a0d6  ! 3684: ORcc_I	orcc 	%r22, 0x00d6, %r27
T2_asi_reg_wr_142:
	mov	0x1c, %r14
	.word 0xfef38e60  ! 3685: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfe952057  ! 3686: LDUHA_I	lduha	[%r20, + 0x0057] %asi, %r31
	.word 0x85956136  ! 3688: WRPR_TSTATE_I	wrpr	%r21, 0x0136, %tstate
T2_asi_reg_rd_183:
	mov	0x6, %r14
	.word 0xf4db8400  ! 3689: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_2_288:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_288), 16, 16)) -> intp(2, 0, 5)
	.word 0xfe540000  ! 3691: LDSH_R	ldsh	[%r16 + %r0], %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xb33ce001  ! 3695: SRA_I	sra 	%r19, 0x0001, %r25
	.word 0xf8c5a13f  ! 3696: LDSWA_I	ldswa	[%r22, + 0x013f] %asi, %r28
iob_intr_2_289:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_289), 16, 16)) -> intp(2, 0, 7)
	.word 0xf48d0020  ! 3699: LDUBA_R	lduba	[%r20, %r0] 0x01, %r26
	ta	T_CHANGE_TO_TL0
	.word 0xf8548000  ! 3701: LDSH_R	ldsh	[%r18 + %r0], %r28
	.word 0xb7518000  ! 3702: RDPR_PSTATE	<illegal instruction>
	.word 0xfadda122  ! 3703: LDXA_I	ldxa	[%r22, + 0x0122] %asi, %r29
T2_asi_reg_wr_143:
	mov	0x2, %r14
	.word 0xf6f38e80  ! 3704: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_2_295:
	setx	0x3f0228, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_290:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_290), 16, 16)) -> intp(2, 0, 7)
T2_asi_reg_wr_144:
	mov	0xb, %r14
	.word 0xfef389e0  ! 3708: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf2940020  ! 3710: LDUHA_R	lduha	[%r16, %r0] 0x01, %r25
T2_asi_reg_rd_184:
	mov	0x3c7, %r14
	.word 0xf6db84a0  ! 3713: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf0950020  ! 3714: LDUHA_R	lduha	[%r20, %r0] 0x01, %r24
	.word 0xfcd560ce  ! 3717: LDSHA_I	ldsha	[%r21, + 0x00ce] %asi, %r30
cpu_intr_2_296:
	setx	0x3d001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf0cc4020  ! 3725: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r24
T2_asi_reg_wr_145:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 3732: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_2_297:
	setx	0x3c0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfed54020  ! 3735: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r31
	.word 0xfe146025  ! 3737: LDUH_I	lduh	[%r17 + 0x0025], %r31
iob_intr_2_291:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_291), 16, 16)) -> intp(2, 0, 11)
	.word 0xf444e1bb  ! 3741: LDSW_I	ldsw	[%r19 + 0x01bb], %r26
	.word 0xf205c000  ! 3746: LDUW_R	lduw	[%r23 + %r0], %r25
T2_asi_reg_rd_185:
	mov	0x6, %r14
	.word 0xf4db84a0  ! 3755: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T2_asi_reg_wr_146:
	mov	0x25, %r14
	.word 0xfaf38400  ! 3757: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_2_292:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_292), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf25d0000  ! 3761: LDX_R	ldx	[%r20 + %r0], %r25
	.word 0xfacde0dd  ! 3762: LDSBA_I	ldsba	[%r23, + 0x00dd] %asi, %r29
	.word 0xfc4da0e6  ! 3763: LDSB_I	ldsb	[%r22 + 0x00e6], %r30
T2_asi_reg_rd_186:
	mov	0x3c2, %r14
	.word 0xfadb8e40  ! 3766: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_2_298:
	setx	0x3e0010, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_147:
	mov	0x2a, %r14
	.word 0xf6f38e60  ! 3771: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbc94a1cb  ! 3772: ORcc_I	orcc 	%r18, 0x01cb, %r30
	.word 0xf45de1f2  ! 3777: LDX_I	ldx	[%r23 + 0x01f2], %r26
iob_intr_2_293:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_293), 16, 16)) -> intp(2, 0, 9)
cpu_intr_2_299:
	setx	0x3d0317, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_148:
	mov	0x26, %r14
	.word 0xf6f38400  ! 3786: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf48da1c7  ! 3788: LDUBA_I	lduba	[%r22, + 0x01c7] %asi, %r26
	.word 0xf4054000  ! 3789: LDUW_R	lduw	[%r21 + %r0], %r26
T2_asi_reg_wr_149:
	mov	0x2e, %r14
	.word 0xfcf38e40  ! 3790: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_wr_150:
	mov	0x23, %r14
	.word 0xf6f38e80  ! 3791: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xfe0c4000  ! 3792: LDUB_R	ldub	[%r17 + %r0], %r31
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983ac8  ! 3793: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ac8, %hpstate
	.word 0xf6858020  ! 3794: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r27
	.word 0xfc144000  ! 3795: LDUH_R	lduh	[%r17 + %r0], %r30
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_151:
	mov	0x19, %r14
	.word 0xf2f38e80  ! 3799: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf60da13e  ! 3800: LDUB_I	ldub	[%r22 + 0x013e], %r27
	.word 0xfa054000  ! 3804: LDUW_R	lduw	[%r21 + %r0], %r29
iob_intr_2_294:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_294), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf05da121  ! 3812: LDX_I	ldx	[%r22 + 0x0121], %r24
	.word 0xfe05a0a4  ! 3814: LDUW_I	lduw	[%r22 + 0x00a4], %r31
	.word 0xf4040000  ! 3819: LDUW_R	lduw	[%r16 + %r0], %r26
iob_intr_2_295:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_295), 16, 16)) -> intp(2, 0, 0)
	ta	T_CHANGE_NONHPRIV
	.word 0xf8056128  ! 3825: LDUW_I	lduw	[%r21 + 0x0128], %r28
	.word 0xba8d8000  ! 3826: ANDcc_R	andcc 	%r22, %r0, %r29
cpu_intr_2_300:
	setx	0x3e0229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_301:
	setx	0x3d030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_187:
	mov	0x38, %r14
	.word 0xfadb84a0  ! 3832: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xfcc40020  ! 3835: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r30
iob_intr_2_296:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_296), 16, 16)) -> intp(2, 0, 2a)
iob_intr_2_297:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_297), 16, 16)) -> intp(2, 0, 32)
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_152:
	mov	0x3c1, %r14
	.word 0xf8f38400  ! 3844: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T2_asi_reg_rd_188:
	mov	0x1f, %r14
	.word 0xfedb8400  ! 3845: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T2_asi_reg_rd_189:
	mov	0x2c, %r14
	.word 0xfcdb8e40  ! 3847: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_2_298:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_298), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_rd_190:
	mov	0x3c0, %r14
	.word 0xf0db8e80  ! 3849: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xfc45c000  ! 3850: LDSW_R	ldsw	[%r23 + %r0], %r30
T2_asi_reg_rd_191:
	mov	0x8, %r14
	.word 0xf4db89e0  ! 3851: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T2_asi_reg_rd_192:
	mov	0x23, %r14
	.word 0xf6db8400  ! 3852: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_2_299:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_299), 16, 16)) -> intp(2, 0, 2d)
cpu_intr_2_302:
	setx	0x3f0338, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_193:
	mov	0x3c2, %r14
	.word 0xf2db8400  ! 3859: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T2_asi_reg_rd_194:
	mov	0x20, %r14
	.word 0xfedb89e0  ! 3861: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xfec5215a  ! 3866: LDSWA_I	ldswa	[%r20, + 0x015a] %asi, %r31
	.word 0xbf2c5000  ! 3867: SLLX_R	sllx	%r17, %r0, %r31
cpu_intr_2_303:
	setx	0x3e0033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x899461f5  ! 3870: WRPR_TICK_I	wrpr	%r17, 0x01f5, %tick
	.word 0xf2dce1e9  ! 3871: LDXA_I	ldxa	[%r19, + 0x01e9] %asi, %r25
	.word 0xfc84a037  ! 3872: LDUWA_I	lduwa	[%r18, + 0x0037] %asi, %r30
iob_intr_2_300:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_300), 16, 16)) -> intp(2, 0, 13)
	.word 0xf8c461ed  ! 3874: LDSWA_I	ldswa	[%r17, + 0x01ed] %asi, %r28
	.word 0xf24d0000  ! 3875: LDSB_R	ldsb	[%r20 + %r0], %r25
	.word 0xbe856093  ! 3876: ADDcc_I	addcc 	%r21, 0x0093, %r31
T2_asi_reg_wr_153:
	mov	0x1e, %r14
	.word 0xfef38e40  ! 3878: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_2_304:
	setx	0x3c0114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf2d0000  ! 3880: SLL_R	sll 	%r20, %r0, %r31
	.word 0xf25ce094  ! 3884: LDX_I	ldx	[%r19 + 0x0094], %r25
cpu_intr_2_305:
	setx	0x3c022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04d0000  ! 3887: LDSB_R	ldsb	[%r20 + %r0], %r24
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_195:
	mov	0x1a, %r14
	.word 0xf2db8400  ! 3890: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb63de0dc  ! 3891: XNOR_I	xnor 	%r23, 0x00dc, %r27
	.word 0xfcd5c020  ! 3893: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r30
iob_intr_2_301:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_301), 16, 16)) -> intp(2, 0, 3f)
T2_asi_reg_rd_196:
	mov	0x3c1, %r14
	.word 0xfadb8e60  ! 3896: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf0cca04c  ! 3900: LDSBA_I	ldsba	[%r18, + 0x004c] %asi, %r24
	ta	T_CHANGE_HPRIV
iob_intr_2_302:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_302), 16, 16)) -> intp(2, 0, 11)
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983fc2  ! 3904: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc2, %hpstate
iob_intr_2_303:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_303), 16, 16)) -> intp(2, 0, 21)
T2_asi_reg_wr_154:
	mov	0x27, %r14
	.word 0xf8f38400  ! 3908: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_306:
	setx	0x3e022d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_307:
	setx	0x3f0208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfecc6027  ! 3916: LDSBA_I	ldsba	[%r17, + 0x0027] %asi, %r31
iob_intr_2_304:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_304), 16, 16)) -> intp(2, 0, 26)
cpu_intr_2_308:
	setx	0x3c001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12dc000  ! 3921: SLL_R	sll 	%r23, %r0, %r24
cpu_intr_2_309:
	setx	0x3c0102, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_305:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_305), 16, 16)) -> intp(2, 0, 1e)
iob_intr_2_306:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_306), 16, 16)) -> intp(2, 0, 23)
	.word 0xbe852048  ! 3927: ADDcc_I	addcc 	%r20, 0x0048, %r31
T2_asi_reg_rd_197:
	mov	0x2c, %r14
	.word 0xfcdb84a0  ! 3928: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_2_310:
	setx	0x3f021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb22ca18e  ! 3931: ANDN_I	andn 	%r18, 0x018e, %r25
	.word 0xfa8420b0  ! 3937: LDUWA_I	lduwa	[%r16, + 0x00b0] %asi, %r29
	.word 0xfa0ca0d2  ! 3938: LDUB_I	ldub	[%r18 + 0x00d2], %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_155:
	mov	0x3c3, %r14
	.word 0xfaf384a0  ! 3940: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_2_311:
	setx	0x3f013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_198:
	mov	0x11, %r14
	.word 0xf8db84a0  ! 3943: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_2_307:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_307), 16, 16)) -> intp(2, 0, 1a)
	.word 0xfe4d4000  ! 3947: LDSB_R	ldsb	[%r21 + %r0], %r31
	.word 0xf655c000  ! 3948: LDSH_R	ldsh	[%r23 + %r0], %r27
	.word 0xf85c216f  ! 3949: LDX_I	ldx	[%r16 + 0x016f], %r28
T2_asi_reg_wr_156:
	mov	0x36, %r14
	.word 0xf6f38e40  ! 3951: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_2_308:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_308), 16, 16)) -> intp(2, 0, 18)
	.word 0xf8dd609c  ! 3955: LDXA_I	ldxa	[%r21, + 0x009c] %asi, %r28
	.word 0xfe440000  ! 3956: LDSW_R	ldsw	[%r16 + %r0], %r31
T2_asi_reg_rd_199:
	mov	0x35, %r14
	.word 0xf6db8400  ! 3957: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	ta	T_CHANGE_HPRIV
	.word 0xb6856045  ! 3962: ADDcc_I	addcc 	%r21, 0x0045, %r27
iob_intr_2_309:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_309), 16, 16)) -> intp(2, 0, 17)
	.word 0xf25d60c6  ! 3965: LDX_I	ldx	[%r21 + 0x00c6], %r25
T2_asi_reg_rd_200:
	mov	0x3c2, %r14
	.word 0xf8db84a0  ! 3970: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf4446089  ! 3973: LDSW_I	ldsw	[%r17 + 0x0089], %r26
	.word 0xf8cce0c7  ! 3975: LDSBA_I	ldsba	[%r19, + 0x00c7] %asi, %r28
	.word 0xf40cc000  ! 3977: LDUB_R	ldub	[%r19 + %r0], %r26
	ta	T_CHANGE_HPRIV
iob_intr_2_310:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_310), 16, 16)) -> intp(2, 0, 2b)
T2_asi_reg_wr_157:
	mov	0x18, %r14
	.word 0xfaf38e80  ! 3982: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb73c0000  ! 3983: SRA_R	sra 	%r16, %r0, %r27
	.word 0xf294e0aa  ! 3985: LDUHA_I	lduha	[%r19, + 0x00aa] %asi, %r25
	.word 0xfe5d201d  ! 3986: LDX_I	ldx	[%r20 + 0x001d], %r31
cpu_intr_2_312:
	setx	0x3e021c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_311:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_311), 16, 16)) -> intp(2, 0, 5)
cpu_intr_2_313:
	setx	0x3d033b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_314:
	setx	0x3c0028, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_201:
	mov	0x37, %r14
	.word 0xf4db8e40  ! 3995: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_2_312:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_312), 16, 16)) -> intp(2, 0, 31)
cpu_intr_2_315:
	setx	0x3c000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d58020  ! 3998: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r25
iob_intr_2_313:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_313), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf0040000  ! 4000: LDUW_R	lduw	[%r16 + %r0], %r24
cpu_intr_2_316:
	setx	0x3f0331, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_317:
	setx	0x3e003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4de048  ! 4009: LDSB_I	ldsb	[%r23 + 0x0048], %r29
	.word 0xf84c6015  ! 4010: LDSB_I	ldsb	[%r17 + 0x0015], %r28
	ta	T_CHANGE_TO_TL0
iob_intr_2_314:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_314), 16, 16)) -> intp(2, 0, 35)
	ta	T_CHANGE_TO_TL0
	.word 0xba842000  ! 4016: ADDcc_I	addcc 	%r16, 0x0000, %r29
	.word 0xfc8c8020  ! 4017: LDUBA_R	lduba	[%r18, %r0] 0x01, %r30
	.word 0xfe94e02f  ! 4018: LDUHA_I	lduha	[%r19, + 0x002f] %asi, %r31
	.word 0xba848000  ! 4024: ADDcc_R	addcc 	%r18, %r0, %r29
cpu_intr_2_318:
	setx	0x3e0212, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_202:
	mov	0xa, %r14
	.word 0xf2db8400  ! 4028: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_2_319:
	setx	0x3d0138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25c2133  ! 4032: LDX_I	ldx	[%r16 + 0x0133], %r25
cpu_intr_2_320:
	setx	0x3e033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa058000  ! 4035: LDUW_R	lduw	[%r22 + %r0], %r29
	.word 0xfe04e01b  ! 4036: LDUW_I	lduw	[%r19 + 0x001b], %r31
	.word 0xf4140000  ! 4038: LDUH_R	lduh	[%r16 + %r0], %r26
	.word 0xf2c5611d  ! 4040: LDSWA_I	ldswa	[%r21, + 0x011d] %asi, %r25
iob_intr_2_315:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_315), 16, 16)) -> intp(2, 0, 22)
cpu_intr_2_321:
	setx	0x3e0123, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_316:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_316), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_wr_158:
	mov	0xb, %r14
	.word 0xfaf38e40  ! 4053: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_322:
	setx	0x3c030f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_323:
	setx	0x3c0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfecd2186  ! 4065: LDSBA_I	ldsba	[%r20, + 0x0186] %asi, %r31
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982a8a  ! 4067: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8a, %hpstate
	.word 0xbaa48000  ! 4068: SUBcc_R	subcc 	%r18, %r0, %r29
cpu_intr_2_324:
	setx	0x3d012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf8850020  ! 4072: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r28
iob_intr_2_317:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_317), 16, 16)) -> intp(2, 0, 3e)
	.word 0xfad4a1d1  ! 4075: LDSHA_I	ldsha	[%r18, + 0x01d1] %asi, %r29
	ta	T_CHANGE_TO_TL1
cpu_intr_2_325:
	setx	0x3d0330, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_2_326:
	setx	0x3d0214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf894a023  ! 4088: LDUHA_I	lduha	[%r18, + 0x0023] %asi, %r28
T2_asi_reg_wr_159:
	mov	0x1, %r14
	.word 0xf6f38e40  ! 4090: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf445e06b  ! 4091: LDSW_I	ldsw	[%r23 + 0x006b], %r26
iob_intr_2_318:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_318), 16, 16)) -> intp(2, 0, 25)
	.word 0xfe8461f8  ! 4099: LDUWA_I	lduwa	[%r17, + 0x01f8] %asi, %r31
cpu_intr_2_327:
	setx	0x3f0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0cda020  ! 4105: LDSBA_I	ldsba	[%r22, + 0x0020] %asi, %r24
iob_intr_2_319:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_319), 16, 16)) -> intp(2, 0, 1c)
iob_intr_2_320:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_320), 16, 16)) -> intp(2, 0, 22)
iob_intr_2_321:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_321), 16, 16)) -> intp(2, 0, 1e)
cpu_intr_2_328:
	setx	0x3d0213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2bc8000  ! 4111: XNORcc_R	xnorcc 	%r18, %r0, %r25
	.word 0xfa4ce151  ! 4116: LDSB_I	ldsb	[%r19 + 0x0151], %r29
T2_asi_reg_rd_203:
	mov	0x3c1, %r14
	.word 0xfcdb89e0  ! 4119: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_2_329:
	setx	0x3d023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf84c0000  ! 4123: LDSB_R	ldsb	[%r16 + %r0], %r28
cpu_intr_2_330:
	setx	0x3d0032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8852088  ! 4125: LDUWA_I	lduwa	[%r20, + 0x0088] %asi, %r28
iob_intr_2_322:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_322), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_rd_204:
	mov	0x23, %r14
	.word 0xfcdb89e0  ! 4134: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xfa55a072  ! 4135: LDSH_I	ldsh	[%r22 + 0x0072], %r29
	.word 0xf405e10c  ! 4136: LDUW_I	lduw	[%r23 + 0x010c], %r26
	.word 0xfa5c4000  ! 4139: LDX_R	ldx	[%r17 + %r0], %r29
	.word 0xf08c0020  ! 4141: LDUBA_R	lduba	[%r16, %r0] 0x01, %r24
	.word 0xfc0c0000  ! 4142: LDUB_R	ldub	[%r16 + %r0], %r30
	.word 0xf85d8000  ! 4143: LDX_R	ldx	[%r22 + %r0], %r28
	.word 0xf2cc8020  ! 4144: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r25
cpu_intr_2_331:
	setx	0x41001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec460bc  ! 4148: LDSWA_I	ldswa	[%r17, + 0x00bc] %asi, %r31
cpu_intr_2_332:
	setx	0x410131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf40c4000  ! 4151: LDUB_R	ldub	[%r17 + %r0], %r26
iob_intr_2_323:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_323), 16, 16)) -> intp(2, 0, 4)
	ta	T_CHANGE_NONHPRIV
	.word 0xfac58020  ! 4159: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r29
	.word 0xb2954000  ! 4160: ORcc_R	orcc 	%r21, %r0, %r25
	.word 0xf8cd0020  ! 4161: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r28
cpu_intr_2_333:
	setx	0x400306, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_334:
	setx	0x430116, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_205:
	mov	0x3c8, %r14
	.word 0xf4db8e40  ! 4168: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_TO_TL1
cpu_intr_2_335:
	setx	0x42001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc05e035  ! 4173: LDUW_I	lduw	[%r23 + 0x0035], %r30
	.word 0xf055c000  ! 4174: LDSH_R	ldsh	[%r23 + %r0], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbb340000  ! 4177: SRL_R	srl 	%r16, %r0, %r29
	.word 0xf294c020  ! 4178: LDUHA_R	lduha	[%r19, %r0] 0x01, %r25
	.word 0xf65d4000  ! 4179: LDX_R	ldx	[%r21 + %r0], %r27
	.word 0xfecd214d  ! 4182: LDSBA_I	ldsba	[%r20, + 0x014d] %asi, %r31
T2_asi_reg_wr_160:
	mov	0x5, %r14
	.word 0xf8f38e40  ! 4185: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfccda135  ! 4191: LDSBA_I	ldsba	[%r22, + 0x0135] %asi, %r30
	.word 0xb63421df  ! 4193: SUBC_I	orn 	%r16, 0x01df, %r27
cpu_intr_2_336:
	setx	0x420221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2958020  ! 4196: LDUHA_R	lduha	[%r22, %r0] 0x01, %r25
	.word 0xfe8c602c  ! 4201: LDUBA_I	lduba	[%r17, + 0x002c] %asi, %r31
iob_intr_2_324:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_324), 16, 16)) -> intp(2, 0, 3c)
cpu_intr_2_337:
	setx	0x41022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05d6005  ! 4206: LDX_I	ldx	[%r21 + 0x0005], %r24
	.word 0xfe15a0bd  ! 4209: LDUH_I	lduh	[%r22 + 0x00bd], %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3641800  ! 4211: MOVcc_R	<illegal instruction>
cpu_intr_2_338:
	setx	0x410238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64d4000  ! 4219: LDSB_R	ldsb	[%r21 + %r0], %r27
iob_intr_2_325:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_325), 16, 16)) -> intp(2, 0, 1a)
iob_intr_2_326:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_326), 16, 16)) -> intp(2, 0, 13)
	.word 0xfe054000  ! 4223: LDUW_R	lduw	[%r21 + %r0], %r31
	.word 0xf4c4e196  ! 4224: LDSWA_I	ldswa	[%r19, + 0x0196] %asi, %r26
	.word 0xfc95a1da  ! 4225: LDUHA_I	lduha	[%r22, + 0x01da] %asi, %r30
	.word 0xb8ad4000  ! 4226: ANDNcc_R	andncc 	%r21, %r0, %r28
	.word 0xf8dc60df  ! 4227: LDXA_I	ldxa	[%r17, + 0x00df] %asi, %r28
	.word 0xbc2ce01f  ! 4230: ANDN_I	andn 	%r19, 0x001f, %r30
	.word 0xf28d0020  ! 4234: LDUBA_R	lduba	[%r20, %r0] 0x01, %r25
cpu_intr_2_339:
	setx	0x43033e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_206:
	mov	0x25, %r14
	.word 0xfadb8e60  ! 4237: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xfadc2126  ! 4240: LDXA_I	ldxa	[%r16, + 0x0126] %asi, %r29
	.word 0xfe8461af  ! 4241: LDUWA_I	lduwa	[%r17, + 0x01af] %asi, %r31
cpu_intr_2_340:
	setx	0x400308, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_327:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_327), 16, 16)) -> intp(2, 0, 34)
T2_asi_reg_rd_207:
	mov	0x2f, %r14
	.word 0xf0db8e80  ! 4244: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xfe0d8000  ! 4245: LDUB_R	ldub	[%r22 + %r0], %r31
	.word 0xf244618a  ! 4248: LDSW_I	ldsw	[%r17 + 0x018a], %r25
iob_intr_2_328:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_328), 16, 16)) -> intp(2, 0, 14)
	.word 0xfed4c020  ! 4250: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r31
T2_asi_reg_rd_208:
	mov	0x16, %r14
	.word 0xfcdb8e60  ! 4252: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf45460f8  ! 4256: LDSH_I	ldsh	[%r17 + 0x00f8], %r26
T2_asi_reg_wr_161:
	mov	0x12, %r14
	.word 0xf0f38400  ! 4258: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T2_asi_reg_rd_209:
	mov	0x3c7, %r14
	.word 0xfedb84a0  ! 4260: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf895c020  ! 4261: LDUHA_R	lduha	[%r23, %r0] 0x01, %r28
	ta	T_CHANGE_TO_TL0
	.word 0xfe14a0af  ! 4267: LDUH_I	lduh	[%r18 + 0x00af], %r31
	.word 0xb1510000  ! 4270: RDPR_TICK	<illegal instruction>
cpu_intr_2_341:
	setx	0x410218, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_329:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_329), 16, 16)) -> intp(2, 0, 12)
T2_asi_reg_wr_162:
	mov	0x3c4, %r14
	.word 0xf6f389e0  ! 4274: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_2_342:
	setx	0x420010, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_210:
	mov	0x3c6, %r14
	.word 0xf6db8e80  ! 4278: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xfa85e1fd  ! 4284: LDUWA_I	lduwa	[%r23, + 0x01fd] %asi, %r29
	.word 0xf8948020  ! 4287: LDUHA_R	lduha	[%r18, %r0] 0x01, %r28
cpu_intr_2_343:
	setx	0x41031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b40000  ! 4293: ORNcc_R	orncc 	%r16, %r0, %r24
T2_asi_reg_rd_211:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 4299: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf645a169  ! 4303: LDSW_I	ldsw	[%r22 + 0x0169], %r27
	.word 0xf4150000  ! 4304: LDUH_R	lduh	[%r20 + %r0], %r26
	.word 0xbc0c8000  ! 4306: AND_R	and 	%r18, %r0, %r30
iob_intr_2_330:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_330), 16, 16)) -> intp(2, 0, 37)
	.word 0xf685e026  ! 4315: LDUWA_I	lduwa	[%r23, + 0x0026] %asi, %r27
cpu_intr_2_344:
	setx	0x430236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0344000  ! 4319: SUBC_R	orn 	%r17, %r0, %r24
T2_asi_reg_wr_163:
	mov	0x23, %r14
	.word 0xfcf384a0  ! 4320: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T2_asi_reg_wr_164:
	mov	0x3c8, %r14
	.word 0xf8f38e40  ! 4322: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_2_345:
	setx	0x41010f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_346:
	setx	0x420218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcbdc000  ! 4329: XNORcc_R	xnorcc 	%r23, %r0, %r30
	.word 0xf64d0000  ! 4337: LDSB_R	ldsb	[%r20 + %r0], %r27
cpu_intr_2_347:
	setx	0x42031b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_212:
	mov	0x3c0, %r14
	.word 0xf2db8e40  ! 4340: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf44c4000  ! 4341: LDSB_R	ldsb	[%r17 + %r0], %r26
cpu_intr_2_348:
	setx	0x400116, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_349:
	setx	0x400026, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_350:
	setx	0x41002c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_165:
	mov	0x2f, %r14
	.word 0xfef384a0  ! 4353: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_2_331:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_331), 16, 16)) -> intp(2, 0, 29)
iob_intr_2_332:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_332), 16, 16)) -> intp(2, 0, 38)
iob_intr_2_333:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_333), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf4d44020  ! 4362: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r26
	.word 0xfcc5a13e  ! 4367: LDSWA_I	ldswa	[%r22, + 0x013e] %asi, %r30
iob_intr_2_334:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_334), 16, 16)) -> intp(2, 0, 10)
	.word 0xf6c5c020  ! 4373: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r27
	.word 0xf65520d3  ! 4374: LDSH_I	ldsh	[%r20 + 0x00d3], %r27
cpu_intr_2_351:
	setx	0x430337, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_335:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_335), 16, 16)) -> intp(2, 0, 1)
	.word 0xf8d50020  ! 4380: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r28
iob_intr_2_336:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_336), 16, 16)) -> intp(2, 0, 23)
cpu_intr_2_352:
	setx	0x41002b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_213:
	mov	0x34, %r14
	.word 0xf2db8e40  ! 4390: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_2_337:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_337), 16, 16)) -> intp(2, 0, 6)
iob_intr_2_338:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_338), 16, 16)) -> intp(2, 0, d)
	.word 0xb5641800  ! 4398: MOVcc_R	<illegal instruction>
	ta	T_CHANGE_NONHPRIV
iob_intr_2_339:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_339), 16, 16)) -> intp(2, 0, 1a)
	.word 0xfa848020  ! 4403: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r29
cpu_intr_2_353:
	setx	0x430013, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf4048000  ! 4410: LDUW_R	lduw	[%r18 + %r0], %r26
	ta	T_CHANGE_HPRIV
	.word 0xf88d21cc  ! 4413: LDUBA_I	lduba	[%r20, + 0x01cc] %asi, %r28
iob_intr_2_340:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_340), 16, 16)) -> intp(2, 0, a)
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982fc0  ! 4416: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc0, %hpstate
cpu_intr_2_354:
	setx	0x43033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88d8020  ! 4418: LDUBA_R	lduba	[%r22, %r0] 0x01, %r28
T2_asi_reg_wr_166:
	mov	0x3c4, %r14
	.word 0xf0f38e60  ! 4419: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xf4d4a12a  ! 4420: LDSHA_I	ldsha	[%r18, + 0x012a] %asi, %r26
	.word 0xfcc54020  ! 4423: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_341:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_341), 16, 16)) -> intp(2, 0, 3b)
	.word 0xb82c4000  ! 4428: ANDN_R	andn 	%r17, %r0, %r28
T2_asi_reg_wr_167:
	mov	0x19, %r14
	.word 0xfef38e80  ! 4429: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xfc4c0000  ! 4433: LDSB_R	ldsb	[%r16 + %r0], %r30
	.word 0xf255e1bf  ! 4437: LDSH_I	ldsh	[%r23 + 0x01bf], %r25
iob_intr_2_342:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_342), 16, 16)) -> intp(2, 0, b)
T2_asi_reg_wr_168:
	mov	0x32, %r14
	.word 0xfef38e40  ! 4443: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_343:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_343), 16, 16)) -> intp(2, 0, 22)
cpu_intr_2_355:
	setx	0x41001e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_214:
	mov	0x3c0, %r14
	.word 0xfcdb8e40  ! 4452: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_rd_215:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 4455: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf294a187  ! 4456: LDUHA_I	lduha	[%r18, + 0x0187] %asi, %r25
	.word 0xf61560e3  ! 4457: LDUH_I	lduh	[%r21 + 0x00e3], %r27
cpu_intr_2_356:
	setx	0x42030e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_169:
	mov	0xa, %r14
	.word 0xf6f38e80  ! 4460: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_2_344:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_344), 16, 16)) -> intp(2, 0, f)
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_357:
	setx	0x40003c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_216:
	mov	0x25, %r14
	.word 0xf0db8e80  ! 4469: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_2_345:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_345), 16, 16)) -> intp(2, 0, 26)
iob_intr_2_346:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_346), 16, 16)) -> intp(2, 0, 4)
iob_intr_2_347:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_347), 16, 16)) -> intp(2, 0, 1f)
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982e48  ! 4481: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e48, %hpstate
cpu_intr_2_358:
	setx	0x410007, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
iob_intr_2_348:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_348), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf015c000  ! 4487: LDUH_R	lduh	[%r23 + %r0], %r24
	.word 0xf00ca08c  ! 4488: LDUB_I	ldub	[%r18 + 0x008c], %r24
T2_asi_reg_wr_170:
	mov	0x2d, %r14
	.word 0xf2f38e60  ! 4489: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_2_349:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_349), 16, 16)) -> intp(2, 0, 34)
	ta	T_CHANGE_HPRIV
iob_intr_2_350:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_350), 16, 16)) -> intp(2, 0, 12)
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983b92  ! 4495: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b92, %hpstate
	.word 0xf844a18d  ! 4496: LDSW_I	ldsw	[%r18 + 0x018d], %r28
T2_asi_reg_rd_217:
	mov	0x8, %r14
	.word 0xf0db89e0  ! 4498: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf2d54020  ! 4501: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r25
	.word 0xb3359000  ! 4505: SRLX_R	srlx	%r22, %r0, %r25
	.word 0xfe04e15a  ! 4506: LDUW_I	lduw	[%r19 + 0x015a], %r31
	.word 0xf08c8020  ! 4507: LDUBA_R	lduba	[%r18, %r0] 0x01, %r24
	.word 0xf0d48020  ! 4510: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r24
T2_asi_reg_wr_171:
	mov	0x11, %r14
	.word 0xfcf384a0  ! 4511: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T2_asi_reg_wr_172:
	mov	0x19, %r14
	.word 0xf8f38e40  ! 4512: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfe044000  ! 4513: LDUW_R	lduw	[%r17 + %r0], %r31
T2_asi_reg_wr_173:
	mov	0x3c6, %r14
	.word 0xfef38400  ! 4514: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T2_asi_reg_rd_218:
	mov	0x15, %r14
	.word 0xfcdb84a0  ! 4515: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982892  ! 4522: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0892, %hpstate
cpu_intr_2_359:
	setx	0x410229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6cdc020  ! 4526: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r27
	.word 0xf2dda140  ! 4528: LDXA_I	ldxa	[%r22, + 0x0140] %asi, %r25
iob_intr_2_351:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_351), 16, 16)) -> intp(2, 0, 3c)
iob_intr_2_352:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_352), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_wr_174:
	mov	0x25, %r14
	.word 0xfcf38e40  ! 4540: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf0d520cb  ! 4541: LDSHA_I	ldsha	[%r20, + 0x00cb] %asi, %r24
	.word 0xfaccc020  ! 4545: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r29
	.word 0xfcc48020  ! 4546: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r30
T2_asi_reg_rd_219:
	mov	0x2b, %r14
	.word 0xfcdb8e60  ! 4550: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf084c020  ! 4551: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r24
cpu_intr_2_360:
	setx	0x420311, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_361:
	setx	0x430307, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_175:
	mov	0x1a, %r14
	.word 0xfcf389e0  ! 4556: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T2_asi_reg_wr_176:
	mov	0x3c6, %r14
	.word 0xf8f38e60  ! 4559: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_2_362:
	setx	0x420308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb97c2401  ! 4565: MOVR_I	movre	%r16, 0x1, %r28
T2_asi_reg_rd_220:
	mov	0x13, %r14
	.word 0xf8db8e40  ! 4567: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb03d4000  ! 4569: XNOR_R	xnor 	%r21, %r0, %r24
T2_asi_reg_wr_177:
	mov	0x3c6, %r14
	.word 0xfaf38e80  ! 4571: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T2_asi_reg_rd_221:
	mov	0x17, %r14
	.word 0xf4db8e40  ! 4572: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_2_353:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_353), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf8858020  ! 4576: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r28
	.word 0xf85d2191  ! 4578: LDX_I	ldx	[%r20 + 0x0191], %r28
	.word 0xba858000  ! 4579: ADDcc_R	addcc 	%r22, %r0, %r29
cpu_intr_2_363:
	setx	0x43033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb42ce189  ! 4582: ANDN_I	andn 	%r19, 0x0189, %r26
iob_intr_2_354:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_354), 16, 16)) -> intp(2, 0, 20)
	.word 0xba0420a1  ! 4586: ADD_I	add 	%r16, 0x00a1, %r29
	ta	T_CHANGE_HPRIV
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982d80  ! 4590: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d80, %hpstate
	.word 0xf8940020  ! 4591: LDUHA_R	lduha	[%r16, %r0] 0x01, %r28
iob_intr_2_355:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_355), 16, 16)) -> intp(2, 0, 34)
	.word 0xfc0ce05e  ! 4595: LDUB_I	ldub	[%r19 + 0x005e], %r30
T2_asi_reg_wr_178:
	mov	0x31, %r14
	.word 0xfef38e60  ! 4596: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_2_356:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_356), 16, 16)) -> intp(2, 0, 33)
iob_intr_2_357:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_357), 16, 16)) -> intp(2, 0, 21)
	.word 0xfc544000  ! 4600: LDSH_R	ldsh	[%r17 + %r0], %r30
	.word 0xbeb4e0f8  ! 4601: ORNcc_I	orncc 	%r19, 0x00f8, %r31
cpu_intr_2_364:
	setx	0x43021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_365:
	setx	0x410000, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_222:
	mov	0x1e, %r14
	.word 0xf0db8400  ! 4607: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_2_366:
	setx	0x460127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5c20ce  ! 4615: LDX_I	ldx	[%r16 + 0x00ce], %r31
T2_asi_reg_rd_223:
	mov	0xa, %r14
	.word 0xf6db8e40  ! 4616: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbf7cc400  ! 4617: MOVR_R	movre	%r19, %r0, %r31
iob_intr_2_358:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_358), 16, 16)) -> intp(2, 0, 29)
	.word 0xb215a0b2  ! 4619: OR_I	or 	%r22, 0x00b2, %r25
	.word 0xfcc48020  ! 4620: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r30
cpu_intr_2_367:
	setx	0x44033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_179:
	mov	0x13, %r14
	.word 0xf8f38e60  ! 4622: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T2_asi_reg_rd_224:
	mov	0x3c0, %r14
	.word 0xf8db84a0  ! 4623: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_2_359:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_359), 16, 16)) -> intp(2, 0, a)
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982ec2  ! 4626: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec2, %hpstate
	.word 0xbd3c5000  ! 4628: SRAX_R	srax	%r17, %r0, %r30
	.word 0xb0058000  ! 4629: ADD_R	add 	%r22, %r0, %r24
T2_asi_reg_wr_180:
	mov	0x1d, %r14
	.word 0xf2f38e80  ! 4633: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb6bde12c  ! 4636: XNORcc_I	xnorcc 	%r23, 0x012c, %r27
	.word 0xfa14c000  ! 4640: LDUH_R	lduh	[%r19 + %r0], %r29
cpu_intr_2_368:
	setx	0x450302, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xfc4561cd  ! 4654: LDSW_I	ldsw	[%r21 + 0x01cd], %r30
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983d00  ! 4655: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d00, %hpstate
cpu_intr_2_369:
	setx	0x46003c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_181:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 4660: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfc0da0bf  ! 4661: LDUB_I	ldub	[%r22 + 0x00bf], %r30
iob_intr_2_360:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_360), 16, 16)) -> intp(2, 0, 2e)
cpu_intr_2_370:
	setx	0x44032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_182:
	mov	0xf, %r14
	.word 0xf8f384a0  ! 4665: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T2_asi_reg_rd_225:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 4666: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf05c21f0  ! 4669: LDX_I	ldx	[%r16 + 0x01f0], %r24
	.word 0xfe0cc000  ! 4671: LDUB_R	ldub	[%r19 + %r0], %r31
T2_asi_reg_rd_226:
	mov	0x3c3, %r14
	.word 0xf6db8e60  ! 4673: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_2_361:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_361), 16, 16)) -> intp(2, 0, 0)
cpu_intr_2_371:
	setx	0x44013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05dc000  ! 4682: LDX_R	ldx	[%r23 + %r0], %r24
T2_asi_reg_rd_227:
	mov	0x3c5, %r14
	.word 0xf0db8e40  ! 4683: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfc158000  ! 4685: LDUH_R	lduh	[%r22 + %r0], %r30
iob_intr_2_362:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_362), 16, 16)) -> intp(2, 0, 3a)
cpu_intr_2_372:
	setx	0x460122, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982a8a  ! 4689: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8a, %hpstate
	.word 0xf685e064  ! 4690: LDUWA_I	lduwa	[%r23, + 0x0064] %asi, %r27
	.word 0xf295e126  ! 4692: LDUHA_I	lduha	[%r23, + 0x0126] %asi, %r25
	.word 0xf0558000  ! 4694: LDSH_R	ldsh	[%r22 + %r0], %r24
	.word 0xbc2ce038  ! 4695: ANDN_I	andn 	%r19, 0x0038, %r30
cpu_intr_2_373:
	setx	0x46030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbec4e08d  ! 4699: ADDCcc_I	addccc 	%r19, 0x008d, %r31
	.word 0xbcadc000  ! 4700: ANDNcc_R	andncc 	%r23, %r0, %r30
	.word 0xbb7c4400  ! 4701: MOVR_R	movre	%r17, %r0, %r29
	.word 0xfc85c020  ! 4704: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r30
T2_asi_reg_rd_228:
	mov	0x20, %r14
	.word 0xfadb8e80  ! 4706: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xfecde13b  ! 4707: LDSBA_I	ldsba	[%r23, + 0x013b] %asi, %r31
	.word 0xf6152190  ! 4713: LDUH_I	lduh	[%r20 + 0x0190], %r27
	.word 0xb8944000  ! 4715: ORcc_R	orcc 	%r17, %r0, %r28
	.word 0xba144000  ! 4719: OR_R	or 	%r17, %r0, %r29
T2_asi_reg_rd_229:
	mov	0x3c3, %r14
	.word 0xf6db89e0  ! 4720: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xfa85c020  ! 4722: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r29
T2_asi_reg_wr_183:
	mov	0x18, %r14
	.word 0xfcf38e80  ! 4723: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_2_374:
	setx	0x460131, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_375:
	setx	0x46003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe158000  ! 4732: LDUH_R	lduh	[%r22 + %r0], %r31
	.word 0xf8954020  ! 4734: LDUHA_R	lduha	[%r21, %r0] 0x01, %r28
	ta	T_CHANGE_NONHPRIV
	.word 0xf65d8000  ! 4739: LDX_R	ldx	[%r22 + %r0], %r27
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983e40  ! 4742: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e40, %hpstate
T2_asi_reg_wr_184:
	mov	0x3c6, %r14
	.word 0xf0f38e40  ! 4752: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_2_363:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_363), 16, 16)) -> intp(2, 0, e)
iob_intr_2_364:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_364), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf8d5204e  ! 4759: LDSHA_I	ldsha	[%r20, + 0x004e] %asi, %r28
	.word 0xf655a0f2  ! 4760: LDSH_I	ldsh	[%r22 + 0x00f2], %r27
T2_asi_reg_wr_185:
	mov	0x1b, %r14
	.word 0xfcf384a0  ! 4761: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf4d50020  ! 4762: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r26
	.word 0xfc9560e0  ! 4763: LDUHA_I	lduha	[%r21, + 0x00e0] %asi, %r30
	.word 0xfc44a009  ! 4764: LDSW_I	ldsw	[%r18 + 0x0009], %r30
	.word 0xb2a5a10b  ! 4765: SUBcc_I	subcc 	%r22, 0x010b, %r25
T2_asi_reg_wr_186:
	mov	0x27, %r14
	.word 0xfef38e40  ! 4766: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb0ad0000  ! 4769: ANDNcc_R	andncc 	%r20, %r0, %r24
T2_asi_reg_rd_230:
	mov	0x3c3, %r14
	.word 0xf8db8e40  ! 4775: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_2_376:
	setx	0x470113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_365:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_365), 16, 16)) -> intp(2, 0, 9)
T2_asi_reg_wr_187:
	mov	0x26, %r14
	.word 0xf8f38e60  ! 4787: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_2_377:
	setx	0x44030e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_188:
	mov	0x4, %r14
	.word 0xfef389e0  ! 4789: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T2_asi_reg_rd_231:
	mov	0x34, %r14
	.word 0xfadb8e80  ! 4790: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_2_378:
	setx	0x470134, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_366:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_366), 16, 16)) -> intp(2, 0, 8)
cpu_intr_2_379:
	setx	0x45032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4450000  ! 4796: LDSW_R	ldsw	[%r20 + %r0], %r26
	.word 0xbc95c000  ! 4797: ORcc_R	orcc 	%r23, %r0, %r30
	.word 0xfc5d4000  ! 4799: LDX_R	ldx	[%r21 + %r0], %r30
iob_intr_2_367:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_367), 16, 16)) -> intp(2, 0, 3e)
iob_intr_2_368:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_368), 16, 16)) -> intp(2, 0, 2)
T2_asi_reg_rd_232:
	mov	0x0, %r14
	.word 0xf4db8e60  ! 4810: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xfa54203e  ! 4811: LDSH_I	ldsh	[%r16 + 0x003e], %r29
	.word 0xb094213f  ! 4812: ORcc_I	orcc 	%r16, 0x013f, %r24
iob_intr_2_369:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_369), 16, 16)) -> intp(2, 0, 18)
T2_asi_reg_wr_189:
	mov	0x37, %r14
	.word 0xf0f38e80  ! 4815: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xfe0de0b0  ! 4819: LDUB_I	ldub	[%r23 + 0x00b0], %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982a08  ! 4823: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a08, %hpstate
	.word 0xb73d9000  ! 4824: SRAX_R	srax	%r22, %r0, %r27
T2_asi_reg_wr_190:
	mov	0x3c6, %r14
	.word 0xf8f38400  ! 4825: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_2_370:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_370), 16, 16)) -> intp(2, 0, f)
iob_intr_2_371:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_371), 16, 16)) -> intp(2, 0, 38)
T2_asi_reg_rd_233:
	mov	0x3c1, %r14
	.word 0xf6db89e0  ! 4831: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_2_372:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_372), 16, 16)) -> intp(2, 0, 19)
	ta	T_CHANGE_HPRIV
	.word 0xb4bc0000  ! 4839: XNORcc_R	xnorcc 	%r16, %r0, %r26
iob_intr_2_373:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_373), 16, 16)) -> intp(2, 0, 27)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf20d0000  ! 4846: LDUB_R	ldub	[%r20 + %r0], %r25
	.word 0xf005a07f  ! 4850: LDUW_I	lduw	[%r22 + 0x007f], %r24
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_234:
	mov	0x37, %r14
	.word 0xf2db8e40  ! 4855: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_TO_TL0
	.word 0xf24c603c  ! 4858: LDSB_I	ldsb	[%r17 + 0x003c], %r25
	.word 0xb32c7001  ! 4859: SLLX_I	sllx	%r17, 0x0001, %r25
iob_intr_2_374:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_374), 16, 16)) -> intp(2, 0, 2b)
	.word 0xb334f001  ! 4864: SRLX_I	srlx	%r19, 0x0001, %r25
	.word 0xfe9561ef  ! 4866: LDUHA_I	lduha	[%r21, + 0x01ef] %asi, %r31
iob_intr_2_375:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_375), 16, 16)) -> intp(2, 0, 23)
	.word 0xf88de034  ! 4868: LDUBA_I	lduba	[%r23, + 0x0034] %asi, %r28
cpu_intr_2_380:
	setx	0x46033a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_376:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_376), 16, 16)) -> intp(2, 0, 15)
	.word 0xf4c561bc  ! 4877: LDSWA_I	ldswa	[%r21, + 0x01bc] %asi, %r26
iob_intr_2_377:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_377), 16, 16)) -> intp(2, 0, 2b)
T2_asi_reg_rd_235:
	mov	0x3c3, %r14
	.word 0xfcdb8e60  ! 4886: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf084a045  ! 4888: LDUWA_I	lduwa	[%r18, + 0x0045] %asi, %r24
	.word 0xb5343001  ! 4890: SRLX_I	srlx	%r16, 0x0001, %r26
iob_intr_2_378:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_378), 16, 16)) -> intp(2, 0, 12)
	.word 0xbc3c4000  ! 4892: XNOR_R	xnor 	%r17, %r0, %r30
	.word 0xf494a101  ! 4893: LDUHA_I	lduha	[%r18, + 0x0101] %asi, %r26
	ta	T_CHANGE_TO_TL0
	.word 0xf0cd4020  ! 4895: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r24
cpu_intr_2_381:
	setx	0x45032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5d20a9  ! 4902: LDX_I	ldx	[%r20 + 0x00a9], %r29
	.word 0xfacdc020  ! 4904: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r29
	.word 0xfccc0020  ! 4907: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r30
	ta	T_CHANGE_TO_TL1
	.word 0xf04ca054  ! 4913: LDSB_I	ldsb	[%r18 + 0x0054], %r24
	.word 0xb83d609f  ! 4915: XNOR_I	xnor 	%r21, 0x009f, %r28
	.word 0xf48dc020  ! 4916: LDUBA_R	lduba	[%r23, %r0] 0x01, %r26
cpu_intr_2_382:
	setx	0x470132, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_379:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_379), 16, 16)) -> intp(2, 0, 12)
iob_intr_2_380:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_380), 16, 16)) -> intp(2, 0, c)
	.word 0xf255e146  ! 4921: LDSH_I	ldsh	[%r23 + 0x0146], %r25
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983950  ! 4926: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1950, %hpstate
T2_asi_reg_wr_191:
	mov	0x3c6, %r14
	.word 0xfef38e40  ! 4928: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_381:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_381), 16, 16)) -> intp(2, 0, 1a)
	.word 0xfc85e050  ! 4930: LDUWA_I	lduwa	[%r23, + 0x0050] %asi, %r30
cpu_intr_2_383:
	setx	0x470024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_384:
	setx	0x440101, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_236:
	mov	0x2a, %r14
	.word 0xf4db89e0  ! 4938: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf2c5e0f2  ! 4939: LDSWA_I	ldswa	[%r23, + 0x00f2] %asi, %r25
T2_asi_reg_wr_192:
	mov	0x25, %r14
	.word 0xf6f38e40  ! 4941: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
cpu_intr_2_385:
	setx	0x440139, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_382:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_382), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf65c200b  ! 4946: LDX_I	ldx	[%r16 + 0x000b], %r27
T2_asi_reg_wr_193:
	mov	0x20, %r14
	.word 0xfef38e60  ! 4947: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
iob_intr_2_383:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_383), 16, 16)) -> intp(2, 0, a)
	.word 0xf6042083  ! 4950: LDUW_I	lduw	[%r16 + 0x0083], %r27
	.word 0xfc0da0aa  ! 4951: LDUB_I	ldub	[%r22 + 0x00aa], %r30
T2_asi_reg_wr_194:
	mov	0x33, %r14
	.word 0xf2f38e80  ! 4952: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf44d8000  ! 4955: LDSB_R	ldsb	[%r22 + %r0], %r26
T2_asi_reg_rd_237:
	mov	0x17, %r14
	.word 0xfcdb89e0  ! 4959: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T2_asi_reg_wr_195:
	mov	0x34, %r14
	.word 0xfef38e60  ! 4961: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb084c000  ! 4962: ADDcc_R	addcc 	%r19, %r0, %r24
T2_asi_reg_rd_238:
	mov	0x3c8, %r14
	.word 0xf4db8e60  ! 4964: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_2_386:
	setx	0x460222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25da17f  ! 4969: LDX_I	ldx	[%r22 + 0x017f], %r25
T2_asi_reg_rd_239:
	mov	0x12, %r14
	.word 0xfadb8400  ! 4970: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf0144000  ! 4971: LDUH_R	lduh	[%r17 + %r0], %r24
	ta	T_CHANGE_NONHPRIV
	.word 0xbab5c000  ! 4975: SUBCcc_R	orncc 	%r23, %r0, %r29
T2_asi_reg_wr_196:
	mov	0x34, %r14
	.word 0xf0f38400  ! 4977: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	.word 0xf6058000  ! 4979: LDUW_R	lduw	[%r22 + %r0], %r27
	.word 0xf045e02b  ! 4980: LDSW_I	ldsw	[%r23 + 0x002b], %r24
cpu_intr_2_387:
	setx	0x47030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb20ce068  ! 4983: AND_I	and 	%r19, 0x0068, %r25
	.word 0xf4cce059  ! 4984: LDSBA_I	ldsba	[%r19, + 0x0059] %asi, %r26
T2_asi_reg_rd_240:
	mov	0x3c0, %r14
	.word 0xf8db8e40  ! 4988: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	ta	T_CHANGE_TO_TL1
cpu_intr_2_388:
	setx	0x45020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa140000  ! 4991: LDUH_R	lduh	[%r16 + %r0], %r29
iob_intr_2_384:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_384), 16, 16)) -> intp(2, 0, 2)
	.word 0xfcc5a0ed  ! 4994: LDSWA_I	ldswa	[%r22, + 0x00ed] %asi, %r30
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_197:
	mov	0x20, %r14
	.word 0xf8f38e40  ! 4997: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
cpu_intr_1_0:
	setx	0x1b020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_0), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_rd_0:
	mov	0x26, %r14
	.word 0xfcdb84a0  ! 3: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbfab4820  ! 4: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb3a80820  ! 6: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
iob_intr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_1), 16, 16)) -> intp(1, 0, 3c)
	.word 0xbba4c840  ! 11: FADDd	faddd	%f50, %f0, %f60
	.word 0xbda8c820  ! 15: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb7a81420  ! 16: FMOVRNZ	dis not found

iob_intr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_2), 16, 16)) -> intp(1, 0, 2b)
iob_intr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_3), 16, 16)) -> intp(1, 0, 27)
iob_intr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_4), 16, 16)) -> intp(1, 0, 9)
	.word 0xb7a84820  ! 20: FMOVE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_0:
	mov	0x4, %r14
	.word 0xf8f38400  ! 23: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_1_1:
	setx	0x1e030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_1:
	mov	0x18, %r14
	.word 0xf0f38400  ! 25: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb9a9c820  ! 26: FMOVVS	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_1:
	mov	0x3, %r14
	.word 0xf4db89e0  ! 29: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb3a00020  ! 30: FMOVs	fmovs	%f0, %f25
	.word 0xbd7dc400  ! 31: MOVR_R	movre	%r23, %r0, %r30
T1_asi_reg_rd_2:
	mov	0xd, %r14
	.word 0xf4db89e0  ! 32: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbfa00560  ! 35: FSQRTq	fsqrt	
cpu_intr_1_2:
	setx	0x1f0314, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfab4820  ! 39: FMOVCC	fmovs	%fcc1, %f0, %f31
iob_intr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_5), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb5a509e0  ! 41: FDIVq	dis not found

iob_intr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_6), 16, 16)) -> intp(1, 0, 8)
T1_asi_reg_rd_3:
	mov	0xa, %r14
	.word 0xf2db89e0  ! 46: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_7), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbcbd60f7  ! 52: XNORcc_I	xnorcc 	%r21, 0x00f7, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_3:
	setx	0x30304, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_2:
	mov	0x27, %r14
	.word 0xfcf38e80  ! 62: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T1_asi_reg_wr_3:
	mov	0xb, %r14
	.word 0xfaf389e0  ! 66: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T1_asi_reg_wr_4:
	mov	0x3c1, %r14
	.word 0xf4f38e60  ! 67: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb3a00540  ! 68: FSQRTd	fsqrt	
	.word 0xb3a94820  ! 73: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xba350000  ! 75: ORN_R	orn 	%r20, %r0, %r29
	lda	[%r23 + %g0] 0xf0, %f2
iob_intr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_8), 16, 16)) -> intp(1, 0, c)
	.word 0xbda4c9e0  ! 79: FDIVq	dis not found

T1_asi_reg_rd_4:
	mov	0x3c5, %r14
	.word 0xf0db8e60  ! 81: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_1_4:
	setx	0x1d0232, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_5:
	mov	0x3c8, %r14
	.word 0xfedb89e0  ! 85: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb1a48820  ! 88: FADDs	fadds	%f18, %f0, %f24
iob_intr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_9), 16, 16)) -> intp(1, 0, 27)
	.word 0xb6bdc000  ! 90: XNORcc_R	xnorcc 	%r23, %r0, %r27
T1_asi_reg_wr_5:
	mov	0x2d, %r14
	.word 0xfef389e0  ! 93: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_1_5:
	setx	0x1f0017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba9c820  ! 95: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb1341000  ! 99: SRLX_R	srlx	%r16, %r0, %r24
	.word 0xb1a84820  ! 100: FMOVE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_6:
	mov	0x19, %r14
	.word 0xf6db89e0  ! 103: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T1_asi_reg_rd_7:
	mov	0x6, %r14
	.word 0xf4db84a0  ! 104: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T1_asi_reg_wr_6:
	mov	0x38, %r14
	.word 0xf8f38e40  ! 106: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb1ab8820  ! 110: FMOVPOS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_7:
	mov	0xd, %r14
	.word 0xf0f38400  ! 113: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_10), 16, 16)) -> intp(1, 0, 19)
	.word 0xbe354000  ! 116: SUBC_R	orn 	%r21, %r0, %r31
	.word 0xbe358000  ! 121: SUBC_R	orn 	%r22, %r0, %r31
	.word 0xb68d6017  ! 122: ANDcc_I	andcc 	%r21, 0x0017, %r27
T1_asi_reg_rd_8:
	mov	0x2e, %r14
	.word 0xf2db89e0  ! 123: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T1_asi_reg_wr_8:
	mov	0x3c5, %r14
	.word 0xfef38e80  ! 126: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbfa00540  ! 127: FSQRTd	fsqrt	
	.word 0xb3a80c20  ! 130: FMOVRLZ	dis not found

	.word 0x839421a2  ! 136: WRPR_TNPC_I	wrpr	%r16, 0x01a2, %tnpc
T1_asi_reg_wr_9:
	mov	0x21, %r14
	.word 0xf4f384a0  ! 137: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_1_6:
	setx	0x1f0119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb335b001  ! 142: SRLX_I	srlx	%r22, 0x0001, %r25
T1_asi_reg_wr_10:
	mov	0x17, %r14
	.word 0xf6f38400  ! 144: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbda90820  ! 148: FMOVLEU	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_11:
	mov	0x3c3, %r14
	.word 0xfcf38e80  ! 151: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_11), 16, 16)) -> intp(1, 0, 31)
iob_intr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_12), 16, 16)) -> intp(1, 0, 15)
T1_asi_reg_wr_12:
	mov	0x20, %r14
	.word 0xfef38400  ! 162: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb7a58840  ! 166: FADDd	faddd	%f22, %f0, %f58
cpu_intr_1_7:
	setx	0x1f012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3343001  ! 172: SRLX_I	srlx	%r16, 0x0001, %r25
	.word 0xb5a00520  ! 173: FSQRTs	fsqrt	
cpu_intr_1_8:
	setx	0x1f0219, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_13), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbfa448c0  ! 180: FSUBd	fsubd	%f48, %f0, %f62
	.word 0xb3a48840  ! 181: FADDd	faddd	%f18, %f0, %f56
T1_asi_reg_rd_9:
	mov	0xf, %r14
	.word 0xf8db89e0  ! 182: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb805c000  ! 183: ADD_R	add 	%r23, %r0, %r28
	.word 0xb5ab0820  ! 187: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xbfa94820  ! 191: FMOVCS	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_13:
	mov	0x9, %r14
	.word 0xf8f38e60  ! 192: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbd35a001  ! 193: SRL_I	srl 	%r22, 0x0001, %r30
iob_intr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_14), 16, 16)) -> intp(1, 0, 6)
	.word 0xbc240000  ! 200: SUB_R	sub 	%r16, %r0, %r30
	.word 0xb6bc4000  ! 201: XNORcc_R	xnorcc 	%r17, %r0, %r27
iob_intr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_15), 16, 16)) -> intp(1, 0, 23)
iob_intr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_16), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb0c54000  ! 209: ADDCcc_R	addccc 	%r21, %r0, %r24
	.word 0xbda4c840  ! 211: FADDd	faddd	%f50, %f0, %f30
T1_asi_reg_rd_10:
	mov	0x23, %r14
	.word 0xf4db84a0  ! 213: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb9aac820  ! 214: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xbda408e0  ! 215: FSUBq	dis not found

	.word 0xbda489c0  ! 218: FDIVd	fdivd	%f18, %f0, %f30
	.word 0xb5a00020  ! 221: FMOVs	fmovs	%f0, %f26
	.word 0xb9a81420  ! 222: FMOVRNZ	dis not found

	.word 0xb7ab8820  ! 223: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xbfa548a0  ! 224: FSUBs	fsubs	%f21, %f0, %f31
	.word 0xbba58940  ! 229: FMULd	fmuld	%f22, %f0, %f60
iob_intr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_17), 16, 16)) -> intp(1, 0, c)
	.word 0xb5aa0820  ! 233: FMOVA	fmovs	%fcc1, %f0, %f26
iob_intr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_18), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_19), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_9:
	setx	0x1e013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_14:
	mov	0x3c1, %r14
	.word 0xf8f384a0  ! 243: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_20), 16, 16)) -> intp(1, 0, 25)
	.word 0xb5a80c20  ! 246: FMOVRLZ	dis not found

	.word 0xb88cc000  ! 252: ANDcc_R	andcc 	%r19, %r0, %r28
T1_asi_reg_wr_15:
	mov	0x3c7, %r14
	.word 0xf4f384a0  ! 254: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T1_asi_reg_rd_11:
	mov	0x3c5, %r14
	.word 0xf4db8e40  ! 256: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb7a81420  ! 257: FMOVRNZ	dis not found

cpu_intr_1_10:
	setx	0x1c023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb015c000  ! 259: OR_R	or 	%r23, %r0, %r24
cpu_intr_1_11:
	setx	0x1f003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_12:
	setx	0x1e0005, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_21), 16, 16)) -> intp(1, 0, 23)
cpu_intr_1_13:
	setx	0x1d0002, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_14:
	setx	0x1c002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r23 + %g0] 0xf0, %f2
T1_asi_reg_rd_12:
	mov	0x37, %r14
	.word 0xf4db89e0  ! 275: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb40d20b9  ! 276: AND_I	and 	%r20, 0x00b9, %r26
	.word 0xbda50820  ! 279: FADDs	fadds	%f20, %f0, %f30
	.word 0xb1a509c0  ! 280: FDIVd	fdivd	%f20, %f0, %f24
cpu_intr_1_15:
	setx	0x1f022a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_22), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbda408a0  ! 285: FSUBs	fsubs	%f16, %f0, %f30
T1_asi_reg_rd_13:
	mov	0x1b, %r14
	.word 0xf4db8e40  ! 287: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_14:
	mov	0x3c6, %r14
	.word 0xfadb8e80  ! 294: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb5a5c8a0  ! 296: FSUBs	fsubs	%f23, %f0, %f26
cpu_intr_1_16:
	setx	0x1f0116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_23), 16, 16)) -> intp(1, 0, 2e)
iob_intr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_24), 16, 16)) -> intp(1, 0, 31)
cpu_intr_1_17:
	setx	0x1c0030, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_18:
	setx	0x1f023d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_19:
	setx	0x1f0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80420  ! 314: FMOVRZ	dis not found

	.word 0xb9a00020  ! 315: FMOVs	fmovs	%f0, %f28
	.word 0xbba88820  ! 316: FMOVLE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_15:
	mov	0x11, %r14
	.word 0xf2db8e60  ! 318: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T1_asi_reg_rd_16:
	mov	0x1f, %r14
	.word 0xfadb8e80  ! 323: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb5aa4820  ! 327: FMOVNE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_20:
	setx	0x1c002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa81c20  ! 330: FMOVRGEZ	dis not found

	.word 0xbd354000  ! 331: SRL_R	srl 	%r21, %r0, %r30
cpu_intr_1_21:
	setx	0x1c022a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_22:
	setx	0x1c010f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_25), 16, 16)) -> intp(1, 0, 23)
	.word 0xb3a84820  ! 349: FMOVE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_16:
	mov	0x3c0, %r14
	.word 0xf0f38400  ! 351: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb3a48820  ! 354: FADDs	fadds	%f18, %f0, %f25
T1_asi_reg_rd_17:
	mov	0x11, %r14
	.word 0xfcdb8e40  ! 357: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb7a90820  ! 358: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb024205f  ! 361: SUB_I	sub 	%r16, 0x005f, %r24
	.word 0xbdaa4820  ! 362: FMOVNE	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbda58820  ! 365: FADDs	fadds	%f22, %f0, %f30
	.word 0xb7a48960  ! 366: FMULq	dis not found

T1_asi_reg_rd_18:
	mov	0x22, %r14
	.word 0xf4db84a0  ! 369: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_26), 16, 16)) -> intp(1, 0, 23)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_27), 16, 16)) -> intp(1, 0, 9)
	.word 0xb3a54920  ! 376: FMULs	fmuls	%f21, %f0, %f25
	.word 0xb3a48960  ! 378: FMULq	dis not found

	.word 0xba156058  ! 379: OR_I	or 	%r21, 0x0058, %r29
iob_intr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_28), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_wr_17:
	mov	0x3c4, %r14
	.word 0xf6f389e0  ! 381: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T1_asi_reg_rd_19:
	mov	0x12, %r14
	.word 0xf4db8e80  ! 385: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T1_asi_reg_wr_18:
	mov	0x29, %r14
	.word 0xf2f38e80  ! 386: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_1_23:
	setx	0x1f0210, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_24:
	setx	0x1e0011, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_20:
	mov	0x19, %r14
	.word 0xf8db89e0  ! 392: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_29), 16, 16)) -> intp(1, 0, 22)
	.word 0xb1a88820  ! 396: FMOVLE	fmovs	%fcc1, %f0, %f24
iob_intr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_30), 16, 16)) -> intp(1, 0, 6)
	.word 0xb7a50840  ! 401: FADDd	faddd	%f20, %f0, %f58
	.word 0xbfa00560  ! 402: FSQRTq	fsqrt	
iob_intr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_31), 16, 16)) -> intp(1, 0, 18)
iob_intr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_32), 16, 16)) -> intp(1, 0, f)
	.word 0xb3643801  ! 411: MOVcc_I	<illegal instruction>
	.word 0xbe3d2110  ! 414: XNOR_I	xnor 	%r20, 0x0110, %r31
T1_asi_reg_rd_21:
	mov	0xa, %r14
	.word 0xfcdb8e40  ! 415: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb1a8c820  ! 416: FMOVL	fmovs	%fcc1, %f0, %f24
cpu_intr_1_25:
	setx	0x1c023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a40960  ! 424: FMULq	dis not found

cpu_intr_1_26:
	setx	0x1c013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a58920  ! 429: FMULs	fmuls	%f22, %f0, %f24
	.word 0xb4c40000  ! 434: ADDCcc_R	addccc 	%r16, %r0, %r26
	.word 0xbda80c20  ! 436: FMOVRLZ	dis not found

T1_asi_reg_rd_22:
	mov	0x6, %r14
	.word 0xfcdb8e60  ! 437: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_33), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbba00560  ! 439: FSQRTq	fsqrt	
iob_intr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_34), 16, 16)) -> intp(1, 0, 25)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb6a56146  ! 443: SUBcc_I	subcc 	%r21, 0x0146, %r27
T1_asi_reg_wr_19:
	mov	0x3c4, %r14
	.word 0xf6f389e0  ! 446: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T1_asi_reg_rd_23:
	mov	0x33, %r14
	.word 0xf8db8e40  ! 447: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb82c2071  ! 449: ANDN_I	andn 	%r16, 0x0071, %r28
	.word 0xb7a488a0  ! 450: FSUBs	fsubs	%f18, %f0, %f27
	.word 0xb5ab0820  ! 454: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb5ab0820  ! 459: FMOVGU	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_20:
	mov	0x3c8, %r14
	.word 0xf0f384a0  ! 460: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb1ab0820  ! 462: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb7a90820  ! 465: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb1a9c820  ! 466: FMOVVS	fmovs	%fcc1, %f0, %f24
iob_intr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_35), 16, 16)) -> intp(1, 0, 16)
	.word 0xbdab0820  ! 473: FMOVGU	fmovs	%fcc1, %f0, %f30
iob_intr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_36), 16, 16)) -> intp(1, 0, 4)
	.word 0xb9a80820  ! 484: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xb9a4c920  ! 487: FMULs	fmuls	%f19, %f0, %f28
T1_asi_reg_rd_24:
	mov	0x8, %r14
	.word 0xf0db8e80  ! 489: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T1_asi_reg_wr_21:
	mov	0x34, %r14
	.word 0xf0f38e80  ! 490: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_37), 16, 16)) -> intp(1, 0, 14)
	.word 0xb6350000  ! 495: ORN_R	orn 	%r20, %r0, %r27
	.word 0xbda5c8e0  ! 497: FSUBq	dis not found

T1_asi_reg_rd_25:
	mov	0x2a, %r14
	.word 0xf8db8e60  ! 499: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_38), 16, 16)) -> intp(1, 0, 10)
	.word 0xb9a549c0  ! 502: FDIVd	fdivd	%f52, %f0, %f28
	.word 0xb8b4c000  ! 504: SUBCcc_R	orncc 	%r19, %r0, %r28
T1_asi_reg_rd_26:
	mov	0x17, %r14
	.word 0xf4db8e80  ! 506: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbba80c20  ! 507: FMOVRLZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_39), 16, 16)) -> intp(1, 0, 3c)
cpu_intr_1_27:
	setx	0x200117, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_28:
	setx	0x200136, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_27:
	mov	0x38, %r14
	.word 0xfedb8e60  ! 517: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb3a81c20  ! 520: FMOVRGEZ	dis not found

iob_intr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_40), 16, 16)) -> intp(1, 0, 3a)
T1_asi_reg_rd_28:
	mov	0x15, %r14
	.word 0xf0db8e80  ! 525: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_1_29:
	setx	0x220003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a48840  ! 527: FADDd	faddd	%f18, %f0, %f28
iob_intr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_41), 16, 16)) -> intp(1, 0, 37)
	.word 0xb9a00520  ! 533: FSQRTs	fsqrt	
cpu_intr_1_30:
	setx	0x21010e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_42), 16, 16)) -> intp(1, 0, 21)
cpu_intr_1_31:
	setx	0x200323, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_29:
	mov	0x3c4, %r14
	.word 0xfedb8e40  ! 539: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb3a80420  ! 540: FMOVRZ	dis not found

iob_intr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_43), 16, 16)) -> intp(1, 0, 32)
iob_intr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_44), 16, 16)) -> intp(1, 0, 24)
	.word 0xbfa00560  ! 545: FSQRTq	fsqrt	
	.word 0xbda44840  ! 546: FADDd	faddd	%f48, %f0, %f30
	.word 0xb7a5c9a0  ! 548: FDIVs	fdivs	%f23, %f0, %f27
T1_asi_reg_wr_22:
	mov	0x27, %r14
	.word 0xfaf38e40  ! 549: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb444c000  ! 551: ADDC_R	addc 	%r19, %r0, %r26
	.word 0xb9aa8820  ! 553: FMOVG	fmovs	%fcc1, %f0, %f28
cpu_intr_1_32:
	setx	0x210103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb225a0a6  ! 560: SUB_I	sub 	%r22, 0x00a6, %r25
T1_asi_reg_rd_30:
	mov	0x3c0, %r14
	.word 0xfedb84a0  ! 561: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T1_asi_reg_rd_31:
	mov	0x14, %r14
	.word 0xf8db8e40  ! 562: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb5a80c20  ! 565: FMOVRLZ	dis not found

	.word 0xb2c4e1f1  ! 566: ADDCcc_I	addccc 	%r19, 0x01f1, %r25
T1_asi_reg_rd_32:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 568: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_45), 16, 16)) -> intp(1, 0, 20)
	lda	[%r16 + %g0] 0xf0, %f2
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_46), 16, 16)) -> intp(1, 0, 30)
T1_asi_reg_rd_33:
	mov	0x3c0, %r14
	.word 0xf2db89e0  ! 576: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbba54940  ! 577: FMULd	fmuld	%f52, %f0, %f60
cpu_intr_1_33:
	setx	0x23013c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_47), 16, 16)) -> intp(1, 0, 18)
cpu_intr_1_34:
	setx	0x23030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a88820  ! 582: FMOVLE	fmovs	%fcc1, %f0, %f27
iob_intr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_48), 16, 16)) -> intp(1, 0, 29)
iob_intr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_49), 16, 16)) -> intp(1, 0, 27)
cpu_intr_1_35:
	setx	0x200024, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_50), 16, 16)) -> intp(1, 0, 25)
	.word 0xbba54940  ! 590: FMULd	fmuld	%f52, %f0, %f60
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xb085e1e2  ! 593: ADDcc_I	addcc 	%r23, 0x01e2, %r24
	.word 0xbda54860  ! 597: FADDq	dis not found

iob_intr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_51), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_rd_34:
	mov	0x2c, %r14
	.word 0xfcdb8e60  ! 599: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_1_52:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_52), 16, 16)) -> intp(1, 0, 3b)
	.word 0xbba88820  ! 601: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb23c6043  ! 602: XNOR_I	xnor 	%r17, 0x0043, %r25
iob_intr_1_53:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_53), 16, 16)) -> intp(1, 0, 23)
iob_intr_1_54:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_54), 16, 16)) -> intp(1, 0, 3e)
iob_intr_1_55:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_55), 16, 16)) -> intp(1, 0, 34)
	.word 0xb72c9000  ! 616: SLLX_R	sllx	%r18, %r0, %r27
T1_asi_reg_rd_35:
	mov	0x12, %r14
	.word 0xfcdb8e80  ! 621: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb1a40960  ! 622: FMULq	dis not found

cpu_intr_1_36:
	setx	0x230026, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_56:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_56), 16, 16)) -> intp(1, 0, 21)
cpu_intr_1_37:
	setx	0x230117, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_38:
	setx	0x230024, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_36:
	mov	0x1a, %r14
	.word 0xf2db8e40  ! 634: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_1_39:
	setx	0x230207, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_40:
	setx	0x200124, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_23:
	mov	0x14, %r14
	.word 0xf2f38e60  ! 639: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb7a44840  ! 641: FADDd	faddd	%f48, %f0, %f58
T1_asi_reg_wr_24:
	mov	0x2f, %r14
	.word 0xf8f38e40  ! 643: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_41:
	setx	0x200205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a88820  ! 646: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xbba48920  ! 648: FMULs	fmuls	%f18, %f0, %f29
	lda	[%r16 + %g0] 0xf0, %f2
cpu_intr_1_42:
	setx	0x220226, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_57:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_57), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_58:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_58), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb3358000  ! 655: SRL_R	srl 	%r22, %r0, %r25
T1_asi_reg_wr_25:
	mov	0xb, %r14
	.word 0xfef384a0  ! 657: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_1_59:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_59), 16, 16)) -> intp(1, 0, 30)
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xbfa00560  ! 663: FSQRTq	fsqrt	
	.word 0xb20d0000  ! 666: AND_R	and 	%r20, %r0, %r25
	.word 0xb7343001  ! 668: SRLX_I	srlx	%r16, 0x0001, %r27
	.word 0xb3a88820  ! 670: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb48cc000  ! 673: ANDcc_R	andcc 	%r19, %r0, %r26
cpu_intr_1_43:
	setx	0x23020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00540  ! 676: FSQRTd	fsqrt	
T1_asi_reg_rd_37:
	mov	0x1a, %r14
	.word 0xfadb8e40  ! 680: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xba9d61fc  ! 683: XORcc_I	xorcc 	%r21, 0x01fc, %r29
cpu_intr_1_44:
	setx	0x210221, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_38:
	mov	0x35, %r14
	.word 0xf0db8e40  ! 685: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_60:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_60), 16, 16)) -> intp(1, 0, 30)
cpu_intr_1_45:
	setx	0x220027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a44920  ! 694: FMULs	fmuls	%f17, %f0, %f26
	.word 0xb7a81420  ! 697: FMOVRNZ	dis not found

iob_intr_1_61:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_61), 16, 16)) -> intp(1, 0, 33)
cpu_intr_1_46:
	setx	0x200225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaac820  ! 701: FMOVGE	fmovs	%fcc1, %f0, %f31
iob_intr_1_62:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_62), 16, 16)) -> intp(1, 0, 3c)
	.word 0xbda88820  ! 703: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb5a81820  ! 704: FMOVRGZ	fmovs	%fcc3, %f0, %f26
T1_asi_reg_rd_39:
	mov	0xc, %r14
	.word 0xf2db8400  ! 706: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_1_47:
	setx	0x21001f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_63:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_63), 16, 16)) -> intp(1, 0, 36)
	.word 0xb29c60a6  ! 717: XORcc_I	xorcc 	%r17, 0x00a6, %r25
	.word 0xb0250000  ! 719: SUB_R	sub 	%r20, %r0, %r24
T1_asi_reg_rd_40:
	mov	0x3c2, %r14
	.word 0xfadb8e60  ! 720: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_1_64:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_64), 16, 16)) -> intp(1, 0, 35)
	.word 0xb4b4e0ef  ! 722: ORNcc_I	orncc 	%r19, 0x00ef, %r26
	lda	[%r16 + %g0] 0xf0, %f2
cpu_intr_1_48:
	setx	0x200106, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_49:
	setx	0x23020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9a81420  ! 733: FMOVRNZ	dis not found

	.word 0xb9a00540  ! 734: FSQRTd	fsqrt	
T1_asi_reg_rd_41:
	mov	0x8, %r14
	.word 0xf0db8e80  ! 736: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb9a00020  ! 739: FMOVs	fmovs	%f0, %f28
	.word 0xbf7c2401  ! 742: MOVR_I	movre	%r16, 0x1, %r31
	.word 0xb3a8c820  ! 747: FMOVL	fmovs	%fcc1, %f0, %f25
cpu_intr_1_50:
	setx	0x220032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a44820  ! 750: FADDs	fadds	%f17, %f0, %f26
	.word 0xbca58000  ! 751: SUBcc_R	subcc 	%r22, %r0, %r30
	.word 0xbda80c20  ! 754: FMOVRLZ	dis not found

	.word 0xbda50960  ! 755: FMULq	dis not found

iob_intr_1_65:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_65), 16, 16)) -> intp(1, 0, 20)
iob_intr_1_66:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_66), 16, 16)) -> intp(1, 0, 3f)
cpu_intr_1_51:
	setx	0x200034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a449e0  ! 763: FDIVq	dis not found

	.word 0xb3aac820  ! 764: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xb3a00040  ! 768: FMOVd	fmovd	%f0, %f56
cpu_intr_1_52:
	setx	0x23002e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_53:
	setx	0x220114, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_42:
	mov	0x29, %r14
	.word 0xf0db8400  ! 773: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb7a00020  ! 775: FMOVs	fmovs	%f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_43:
	mov	0xb, %r14
	.word 0xf8db8e40  ! 778: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_wr_26:
	mov	0x3c0, %r14
	.word 0xfef384a0  ! 779: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_1_54:
	setx	0x22020a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_27:
	mov	0x13, %r14
	.word 0xf4f38400  ! 785: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_1_55:
	setx	0x220322, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_44:
	mov	0x3c3, %r14
	.word 0xf2db8e60  ! 787: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbba4c860  ! 793: FADDq	dis not found

cpu_intr_1_56:
	setx	0x21030f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_67:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_67), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_57:
	setx	0x220323, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_58:
	setx	0x22021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda81c20  ! 799: FMOVRGEZ	dis not found

iob_intr_1_68:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_68), 16, 16)) -> intp(1, 0, 0)
	.word 0xb295e159  ! 803: ORcc_I	orcc 	%r23, 0x0159, %r25
iob_intr_1_69:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_69), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_70:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_70), 16, 16)) -> intp(1, 0, 9)
iob_intr_1_71:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_71), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_wr_28:
	mov	0x3c5, %r14
	.word 0xfef38e40  ! 810: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_1_59:
	setx	0x200003, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_60:
	setx	0x230136, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_61:
	setx	0x200223, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_45:
	mov	0x1d, %r14
	.word 0xf8db89e0  ! 822: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb69ce1f6  ! 826: XORcc_I	xorcc 	%r19, 0x01f6, %r27
	.word 0xb3a9c820  ! 829: FMOVVS	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_29:
	mov	0x2, %r14
	.word 0xfef38e60  ! 830: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_1_72:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_72), 16, 16)) -> intp(1, 0, 13)
T1_asi_reg_rd_46:
	mov	0x3c5, %r14
	.word 0xf2db8e60  ! 835: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T1_asi_reg_wr_30:
	mov	0x3c3, %r14
	.word 0xf8f384a0  ! 839: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T1_asi_reg_rd_47:
	mov	0x1c, %r14
	.word 0xf4db8e80  ! 841: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_1_73:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_73), 16, 16)) -> intp(1, 0, 13)
	.word 0xb5a40820  ! 851: FADDs	fadds	%f16, %f0, %f26
cpu_intr_1_62:
	setx	0x210111, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_31:
	mov	0xf, %r14
	.word 0xf2f389e0  ! 853: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb43560bd  ! 855: ORN_I	orn 	%r21, 0x00bd, %r26
iob_intr_1_74:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_74), 16, 16)) -> intp(1, 0, 29)
	.word 0xb1aa0820  ! 863: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb40ce1e3  ! 864: AND_I	and 	%r19, 0x01e3, %r26
iob_intr_1_75:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_75), 16, 16)) -> intp(1, 0, 19)
cpu_intr_1_63:
	setx	0x22011c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_64:
	setx	0x23020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3c1000  ! 869: SRAX_R	srax	%r16, %r0, %r30
	.word 0xb1a00560  ! 870: FSQRTq	fsqrt	
	.word 0xbfa81420  ! 873: FMOVRNZ	dis not found

cpu_intr_1_65:
	setx	0x220013, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_48:
	mov	0xd, %r14
	.word 0xfcdb8e60  ! 880: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb1a80820  ! 881: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
cpu_intr_1_66:
	setx	0x220107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00560  ! 886: FSQRTq	fsqrt	
cpu_intr_1_67:
	setx	0x22023a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_68:
	setx	0x200333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb37d4400  ! 892: MOVR_R	movre	%r21, %r0, %r25
	.word 0xb3a589a0  ! 893: FDIVs	fdivs	%f22, %f0, %f25
T1_asi_reg_rd_49:
	mov	0x18, %r14
	.word 0xf2db8e40  ! 894: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb1aac820  ! 898: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb5a549c0  ! 899: FDIVd	fdivd	%f52, %f0, %f26
	.word 0xbfa90820  ! 900: FMOVLEU	fmovs	%fcc1, %f0, %f31
cpu_intr_1_69:
	setx	0x26011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a509c0  ! 904: FDIVd	fdivd	%f20, %f0, %f56
T1_asi_reg_rd_50:
	mov	0x33, %r14
	.word 0xfadb84a0  ! 905: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_1_70:
	setx	0x26012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00540  ! 908: FSQRTd	fsqrt	
T1_asi_reg_wr_32:
	mov	0x3c3, %r14
	.word 0xfcf38400  ! 910: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb5a58960  ! 911: FMULq	dis not found

	.word 0xb4852035  ! 912: ADDcc_I	addcc 	%r20, 0x0035, %r26
iob_intr_1_76:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_76), 16, 16)) -> intp(1, 0, 10)
	.word 0x8f902002  ! 918: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xba05607a  ! 920: ADD_I	add 	%r21, 0x007a, %r29
T1_asi_reg_rd_51:
	mov	0x35, %r14
	.word 0xf6db84a0  ! 922: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_1_71:
	setx	0x240005, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_72:
	setx	0x270228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a489e0  ! 928: FDIVq	dis not found

T1_asi_reg_wr_33:
	mov	0x3, %r14
	.word 0xf6f38e80  ! 929: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T1_asi_reg_rd_52:
	mov	0x3c4, %r14
	.word 0xf0db8e60  ! 930: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_1_73:
	setx	0x25023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb17c4400  ! 936: MOVR_R	movre	%r17, %r0, %r24
	.word 0x8f902002  ! 940: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xb6b4601a  ! 941: SUBCcc_I	orncc 	%r17, 0x001a, %r27
	.word 0xb644c000  ! 942: ADDC_R	addc 	%r19, %r0, %r27
T1_asi_reg_rd_53:
	mov	0x3c6, %r14
	.word 0xf4db89e0  ! 943: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb81d8000  ! 944: XOR_R	xor 	%r22, %r0, %r28
	.word 0xb1a88820  ! 945: FMOVLE	fmovs	%fcc1, %f0, %f24
iob_intr_1_77:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_77), 16, 16)) -> intp(1, 0, a)
iob_intr_1_78:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_78), 16, 16)) -> intp(1, 0, 26)
	.word 0xbda5c9a0  ! 954: FDIVs	fdivs	%f23, %f0, %f30
	.word 0xb3a4c840  ! 955: FADDd	faddd	%f50, %f0, %f56
T1_asi_reg_rd_54:
	mov	0x3c2, %r14
	.word 0xf0db89e0  ! 959: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T1_asi_reg_rd_55:
	mov	0x18, %r14
	.word 0xfcdb8e80  ! 963: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbba80420  ! 964: FMOVRZ	dis not found

	.word 0xb3a8c820  ! 968: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb42c21cb  ! 971: ANDN_I	andn 	%r16, 0x01cb, %r26
iob_intr_1_79:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_79), 16, 16)) -> intp(1, 0, 5)
iob_intr_1_80:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_80), 16, 16)) -> intp(1, 0, 3d)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_81:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_81), 16, 16)) -> intp(1, 0, 39)
	.word 0xbba80820  ! 984: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xb1abc820  ! 987: FMOVVC	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_34:
	mov	0x1d, %r14
	.word 0xfaf38e80  ! 989: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_1_74:
	setx	0x270202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9ab8820  ! 992: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xbbaa8820  ! 993: FMOVG	fmovs	%fcc1, %f0, %f29
cpu_intr_1_75:
	setx	0x260015, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_35:
	mov	0x8, %r14
	.word 0xf2f38400  ! 997: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_1_76:
	setx	0x25022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r22 + %g0] 0xf0, %f2
iob_intr_1_82:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_82), 16, 16)) -> intp(1, 0, 8)
iob_intr_1_83:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_83), 16, 16)) -> intp(1, 0, 10)
	.word 0xbba40940  ! 1002: FMULd	fmuld	%f16, %f0, %f60
cpu_intr_1_77:
	setx	0x250226, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_84:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_84), 16, 16)) -> intp(1, 0, 33)
T1_asi_reg_rd_56:
	mov	0x3c7, %r14
	.word 0xf4db8e40  ! 1015: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_rd_57:
	mov	0x3c5, %r14
	.word 0xfadb8e80  ! 1016: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_1_78:
	setx	0x25033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_36:
	mov	0x1c, %r14
	.word 0xfcf38e80  ! 1021: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_1_79:
	setx	0x270319, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_80:
	setx	0x270120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_81:
	setx	0x250307, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_85:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_85), 16, 16)) -> intp(1, 0, 1b)
T1_asi_reg_wr_37:
	mov	0x3c7, %r14
	.word 0xfcf389e0  ! 1032: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_1_82:
	setx	0x250127, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_86:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_86), 16, 16)) -> intp(1, 0, 24)
	.word 0xb3a00540  ! 1037: FSQRTd	fsqrt	
T1_asi_reg_wr_38:
	mov	0x3c4, %r14
	.word 0xf8f38e80  ! 1041: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T1_asi_reg_rd_58:
	mov	0x18, %r14
	.word 0xf8db8e60  ! 1044: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb5a489e0  ! 1045: FDIVq	dis not found

	.word 0xb7a00020  ! 1046: FMOVs	fmovs	%f0, %f27
	lda	[%r22 + %g0] 0xf0, %f2
iob_intr_1_87:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_87), 16, 16)) -> intp(1, 0, f)
	.word 0xb7a81c20  ! 1057: FMOVRGEZ	dis not found

cpu_intr_1_83:
	setx	0x270333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73da001  ! 1060: SRA_I	sra 	%r22, 0x0001, %r27
	.word 0xbba5c960  ! 1062: FMULq	dis not found

	.word 0xbd643801  ! 1063: MOVcc_I	<illegal instruction>
	.word 0xb1346001  ! 1064: SRL_I	srl 	%r17, 0x0001, %r24
cpu_intr_1_84:
	setx	0x240104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfabc820  ! 1069: FMOVVC	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_rd_59:
	mov	0x7, %r14
	.word 0xf6db8e40  ! 1072: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T1_asi_reg_wr_39:
	mov	0x3c8, %r14
	.word 0xf4f38400  ! 1074: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb9a4c820  ! 1077: FADDs	fadds	%f19, %f0, %f28
iob_intr_1_88:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_88), 16, 16)) -> intp(1, 0, 1)
	.word 0xb9a81c20  ! 1083: FMOVRGEZ	dis not found

cpu_intr_1_85:
	setx	0x27002f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_86:
	setx	0x240337, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_87:
	setx	0x240300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a54940  ! 1089: FMULd	fmuld	%f52, %f0, %f58
T1_asi_reg_rd_60:
	mov	0x9, %r14
	.word 0xfedb8e60  ! 1091: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_1_89:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_89), 16, 16)) -> intp(1, 0, 6)
iob_intr_1_90:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_90), 16, 16)) -> intp(1, 0, 17)
	.word 0xbfa90820  ! 1100: FMOVLEU	fmovs	%fcc1, %f0, %f31
iob_intr_1_91:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_91), 16, 16)) -> intp(1, 0, 20)
	.word 0xba246010  ! 1104: SUB_I	sub 	%r17, 0x0010, %r29
T1_asi_reg_rd_61:
	mov	0x3c2, %r14
	.word 0xf4db8400  ! 1105: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T1_asi_reg_wr_40:
	mov	0x35, %r14
	.word 0xf0f38e60  ! 1107: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_1_88:
	setx	0x270105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a449a0  ! 1109: FDIVs	fdivs	%f17, %f0, %f24
cpu_intr_1_89:
	setx	0x26031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_92:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_92), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb7abc820  ! 1121: FMOVVC	fmovs	%fcc1, %f0, %f27
iob_intr_1_93:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_93), 16, 16)) -> intp(1, 0, 3a)
T1_asi_reg_wr_41:
	mov	0x11, %r14
	.word 0xf4f38e40  ! 1123: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbfa98820  ! 1124: FMOVNEG	fmovs	%fcc1, %f0, %f31
iob_intr_1_94:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_94), 16, 16)) -> intp(1, 0, 1d)
	.word 0x8194207e  ! 1127: WRPR_TPC_I	wrpr	%r16, 0x007e, %tpc
T1_asi_reg_rd_62:
	mov	0x31, %r14
	.word 0xf0db8e40  ! 1130: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbda00560  ! 1133: FSQRTq	fsqrt	
iob_intr_1_95:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_95), 16, 16)) -> intp(1, 0, 35)
cpu_intr_1_90:
	setx	0x250237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a4c860  ! 1138: FADDq	dis not found

	.word 0xb3ab0820  ! 1140: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb1a80820  ! 1144: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
iob_intr_1_96:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_96), 16, 16)) -> intp(1, 0, 21)
iob_intr_1_97:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_97), 16, 16)) -> intp(1, 0, 1b)
iob_intr_1_98:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_98), 16, 16)) -> intp(1, 0, 3d)
iob_intr_1_99:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_99), 16, 16)) -> intp(1, 0, 8)
	.word 0xb9a58960  ! 1156: FMULq	dis not found

	.word 0xb3a8c820  ! 1158: FMOVL	fmovs	%fcc1, %f0, %f25
iob_intr_1_100:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_100), 16, 16)) -> intp(1, 0, 33)
cpu_intr_1_91:
	setx	0x26033c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_92:
	setx	0x250237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a94820  ! 1167: FMOVCS	fmovs	%fcc1, %f0, %f27
cpu_intr_1_93:
	setx	0x240112, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_101:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_101), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb1a00020  ! 1171: FMOVs	fmovs	%f0, %f24
cpu_intr_1_94:
	setx	0x240033, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_102:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_102), 16, 16)) -> intp(1, 0, 3a)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_95:
	setx	0x24031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a5c820  ! 1181: FADDs	fadds	%f23, %f0, %f26
cpu_intr_1_96:
	setx	0x260126, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_42:
	mov	0x37, %r14
	.word 0xfaf38e80  ! 1184: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbfa489c0  ! 1187: FDIVd	fdivd	%f18, %f0, %f62
iob_intr_1_103:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_103), 16, 16)) -> intp(1, 0, 25)
iob_intr_1_104:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_104), 16, 16)) -> intp(1, 0, 32)
T1_asi_reg_rd_63:
	mov	0x1c, %r14
	.word 0xf6db8e60  ! 1192: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_1_97:
	setx	0x240325, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_64:
	mov	0x27, %r14
	.word 0xf0db8400  ! 1196: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbba00560  ! 1197: FSQRTq	fsqrt	
T1_asi_reg_wr_43:
	mov	0x31, %r14
	.word 0xfaf38e60  ! 1199: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb1a88820  ! 1201: FMOVLE	fmovs	%fcc1, %f0, %f24
cpu_intr_1_98:
	setx	0x26003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_99:
	setx	0x270134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda81c20  ! 1209: FMOVRGEZ	dis not found

	.word 0xb1a00520  ! 1211: FSQRTs	fsqrt	
cpu_intr_1_100:
	setx	0x27003a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_105:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_105), 16, 16)) -> intp(1, 0, a)
T1_asi_reg_wr_44:
	mov	0x23, %r14
	.word 0xfaf38e60  ! 1216: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb13dc000  ! 1218: SRA_R	sra 	%r23, %r0, %r24
	.word 0xbba81420  ! 1221: FMOVRNZ	dis not found

	.word 0xb32d9000  ! 1222: SLLX_R	sllx	%r22, %r0, %r25
	.word 0xbba00540  ! 1224: FSQRTd	fsqrt	
	.word 0xbba4c840  ! 1226: FADDd	faddd	%f50, %f0, %f60
iob_intr_1_106:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_106), 16, 16)) -> intp(1, 0, 9)
cpu_intr_1_101:
	setx	0x25003e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_45:
	mov	0xc, %r14
	.word 0xfef38400  ! 1234: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbba88820  ! 1235: FMOVLE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_65:
	mov	0x17, %r14
	.word 0xfadb8400  ! 1237: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbfa8c820  ! 1238: FMOVL	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_66:
	mov	0x23, %r14
	.word 0xf8db8400  ! 1239: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_1_102:
	setx	0x27012d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_107:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_107), 16, 16)) -> intp(1, 0, b)
	.word 0xbcc50000  ! 1243: ADDCcc_R	addccc 	%r20, %r0, %r30
	.word 0xbba80420  ! 1244: FMOVRZ	dis not found

iob_intr_1_108:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_108), 16, 16)) -> intp(1, 0, 15)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_103:
	setx	0x260331, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_67:
	mov	0x3c4, %r14
	.word 0xf4db8e40  ! 1251: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb1a00040  ! 1255: FMOVd	fmovd	%f0, %f24
cpu_intr_1_104:
	setx	0x240112, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_105:
	setx	0x270225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa0820  ! 1259: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0x89946049  ! 1265: WRPR_TICK_I	wrpr	%r17, 0x0049, %tick
T1_asi_reg_wr_46:
	mov	0x1, %r14
	.word 0xfaf38e40  ! 1266: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_rd_68:
	mov	0x3c2, %r14
	.word 0xfedb8400  ! 1267: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_1_109:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_109), 16, 16)) -> intp(1, 0, 3f)
cpu_intr_1_106:
	setx	0x260301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd34a001  ! 1271: SRL_I	srl 	%r18, 0x0001, %r30
cpu_intr_1_107:
	setx	0x25033f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_110:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_110), 16, 16)) -> intp(1, 0, 27)
	.word 0xb2c58000  ! 1274: ADDCcc_R	addccc 	%r22, %r0, %r25
	.word 0xbfa48960  ! 1279: FMULq	dis not found

T1_asi_reg_wr_47:
	mov	0x18, %r14
	.word 0xf4f38e40  ! 1285: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_108:
	setx	0x270131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaa8820  ! 1288: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xbba54940  ! 1289: FMULd	fmuld	%f52, %f0, %f60
	.word 0xbfa589c0  ! 1290: FDIVd	fdivd	%f22, %f0, %f62
T1_asi_reg_rd_69:
	mov	0x3c0, %r14
	.word 0xf6db8e80  ! 1291: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb1a408c0  ! 1292: FSUBd	fsubd	%f16, %f0, %f24
T1_asi_reg_wr_48:
	mov	0x1c, %r14
	.word 0xf2f389e0  ! 1296: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T1_asi_reg_rd_70:
	mov	0x2d, %r14
	.word 0xfedb8e60  ! 1297: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_1_111:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_111), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb2340000  ! 1299: SUBC_R	orn 	%r16, %r0, %r25
	.word 0xbda508a0  ! 1303: FSUBs	fsubs	%f20, %f0, %f30
T1_asi_reg_wr_49:
	mov	0x3c2, %r14
	.word 0xfcf38e80  ! 1305: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb3a8c820  ! 1306: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xbfa40960  ! 1308: FMULq	dis not found

T1_asi_reg_wr_50:
	mov	0x17, %r14
	.word 0xfaf384a0  ! 1309: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbdab0820  ! 1310: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xbda408c0  ! 1312: FSUBd	fsubd	%f16, %f0, %f30
	.word 0xbfa80420  ! 1317: FMOVRZ	dis not found

	.word 0xbda408e0  ! 1322: FSUBq	dis not found

iob_intr_1_112:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_112), 16, 16)) -> intp(1, 0, 1)
	.word 0xbbabc820  ! 1329: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xbbaa0820  ! 1330: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb2ad613f  ! 1331: ANDNcc_I	andncc 	%r21, 0x013f, %r25
	.word 0xb9a80c20  ! 1334: FMOVRLZ	dis not found

T1_asi_reg_rd_71:
	mov	0x1c, %r14
	.word 0xfedb84a0  ! 1335: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbda548e0  ! 1336: FSUBq	dis not found

T1_asi_reg_rd_72:
	mov	0x3c1, %r14
	.word 0xf4db8e80  ! 1339: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb1341000  ! 1342: SRLX_R	srlx	%r16, %r0, %r24
	.word 0xb9a81c20  ! 1345: FMOVRGEZ	dis not found

cpu_intr_1_109:
	setx	0x240328, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_113:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_113), 16, 16)) -> intp(1, 0, c)
	.word 0xb3a44840  ! 1350: FADDd	faddd	%f48, %f0, %f56
	.word 0xbba00560  ! 1351: FSQRTq	fsqrt	
T1_asi_reg_wr_51:
	mov	0x2, %r14
	.word 0xf4f384a0  ! 1353: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_1_114:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_114), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb1510000  ! 1356: RDPR_TICK	<illegal instruction>
	.word 0xb1aa8820  ! 1357: FMOVG	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_52:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 1358: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_115:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_115), 16, 16)) -> intp(1, 0, 5)
	.word 0xb7aa0820  ! 1362: FMOVA	fmovs	%fcc1, %f0, %f27
iob_intr_1_116:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_116), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb7aa4820  ! 1364: FMOVNE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_110:
	setx	0x250239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd520000  ! 1375: RDPR_PIL	<illegal instruction>
iob_intr_1_117:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_117), 16, 16)) -> intp(1, 0, 3a)
T1_asi_reg_wr_53:
	mov	0x2a, %r14
	.word 0xf8f384a0  ! 1377: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb9a54940  ! 1378: FMULd	fmuld	%f52, %f0, %f28
	.word 0xbfa84820  ! 1379: FMOVE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_111:
	setx	0x2a0101, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_73:
	mov	0x3c6, %r14
	.word 0xfadb84a0  ! 1389: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbfa88820  ! 1390: FMOVLE	fmovs	%fcc1, %f0, %f31
iob_intr_1_118:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_118), 16, 16)) -> intp(1, 0, 3e)
iob_intr_1_119:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_119), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_120:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_120), 16, 16)) -> intp(1, 0, 0)
T1_asi_reg_wr_54:
	mov	0x3c0, %r14
	.word 0xf8f38e80  ! 1395: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb93d9000  ! 1397: SRAX_R	srax	%r22, %r0, %r28
	.word 0xb5a489a0  ! 1398: FDIVs	fdivs	%f18, %f0, %f26
T1_asi_reg_wr_55:
	mov	0x3c0, %r14
	.word 0xf0f38e40  ! 1399: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_rd_74:
	mov	0x3c2, %r14
	.word 0xf0db84a0  ! 1400: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T1_asi_reg_rd_75:
	mov	0x18, %r14
	.word 0xf0db8400  ! 1404: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_1_121:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_121), 16, 16)) -> intp(1, 0, 23)
cpu_intr_1_112:
	setx	0x2a0218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80820  ! 1408: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	lda	[%r18 + %g0] 0xf0, %f2
iob_intr_1_122:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_122), 16, 16)) -> intp(1, 0, 37)
iob_intr_1_123:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_123), 16, 16)) -> intp(1, 0, 11)
T1_asi_reg_wr_56:
	mov	0x10, %r14
	.word 0xfef384a0  ! 1413: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xbda4c9e0  ! 1415: FDIVq	dis not found

cpu_intr_1_113:
	setx	0x2a0027, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_124:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_124), 16, 16)) -> intp(1, 0, 32)
	.word 0xb9a81820  ! 1419: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb5aa0820  ! 1420: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xbba489c0  ! 1421: FDIVd	fdivd	%f18, %f0, %f60
	.word 0xb3a80420  ! 1422: FMOVRZ	dis not found

	.word 0xb5a40840  ! 1423: FADDd	faddd	%f16, %f0, %f26
cpu_intr_1_114:
	setx	0x28010f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_125:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_125), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb5aa0820  ! 1428: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb7a48920  ! 1429: FMULs	fmuls	%f18, %f0, %f27
	.word 0xbba81820  ! 1430: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb085c000  ! 1431: ADDcc_R	addcc 	%r23, %r0, %r24
cpu_intr_1_115:
	setx	0x2a0336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a5c9a0  ! 1435: FDIVs	fdivs	%f23, %f0, %f26
	.word 0xb3aac820  ! 1438: FMOVGE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_57:
	mov	0x13, %r14
	.word 0xfaf38400  ! 1440: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T1_asi_reg_wr_58:
	mov	0x3c2, %r14
	.word 0xfef38e40  ! 1454: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_1_116:
	setx	0x2b023f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_117:
	setx	0x2b0013, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_118:
	setx	0x290233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa449c0  ! 1464: FDIVd	fdivd	%f48, %f0, %f62
iob_intr_1_126:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_126), 16, 16)) -> intp(1, 0, f)
iob_intr_1_127:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_127), 16, 16)) -> intp(1, 0, e)
T1_asi_reg_rd_76:
	mov	0x3c5, %r14
	.word 0xf0db8e40  ! 1471: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb1a509c0  ! 1474: FDIVd	fdivd	%f20, %f0, %f24
	.word 0xbfa90820  ! 1480: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb9a88820  ! 1486: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xb53c6001  ! 1490: SRA_I	sra 	%r17, 0x0001, %r26
cpu_intr_1_119:
	setx	0x28021a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_59:
	mov	0x2a, %r14
	.word 0xf6f38e60  ! 1493: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb82d4000  ! 1495: ANDN_R	andn 	%r21, %r0, %r28
	.word 0xb3359000  ! 1496: SRLX_R	srlx	%r22, %r0, %r25
	.word 0xbba448c0  ! 1499: FSUBd	fsubd	%f48, %f0, %f60
	.word 0xb3a4c940  ! 1503: FMULd	fmuld	%f50, %f0, %f56
iob_intr_1_128:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_128), 16, 16)) -> intp(1, 0, 2e)
iob_intr_1_129:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_129), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb7aac820  ! 1507: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb3a548c0  ! 1508: FSUBd	fsubd	%f52, %f0, %f56
T1_asi_reg_rd_77:
	mov	0x3c1, %r14
	.word 0xf4db8e80  ! 1511: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_1_130:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_130), 16, 16)) -> intp(1, 0, 3e)
iob_intr_1_131:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_131), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb7a449c0  ! 1518: FDIVd	fdivd	%f48, %f0, %f58
cpu_intr_1_120:
	setx	0x2a023e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_78:
	mov	0x2d, %r14
	.word 0xfcdb8e40  ! 1524: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_132:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_132), 16, 16)) -> intp(1, 0, 1f)
	lda	[%r18 + %g0] 0xf0, %f2
	lda	[%r18 + %g0] 0xf0, %f2
cpu_intr_1_121:
	setx	0x2b0138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda58860  ! 1535: FADDq	dis not found

T1_asi_reg_rd_79:
	mov	0x3c0, %r14
	.word 0xfadb84a0  ! 1536: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T1_asi_reg_rd_80:
	mov	0x3c4, %r14
	.word 0xf2db8e60  ! 1540: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_1_133:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_133), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb8bd8000  ! 1552: XNORcc_R	xnorcc 	%r22, %r0, %r28
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xbda549e0  ! 1557: FDIVq	dis not found

iob_intr_1_134:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_134), 16, 16)) -> intp(1, 0, 27)
iob_intr_1_135:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_135), 16, 16)) -> intp(1, 0, 3)
	.word 0xb7ab4820  ! 1565: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xbba00520  ! 1568: FSQRTs	fsqrt	
	.word 0xbda90820  ! 1569: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb7a5c8a0  ! 1571: FSUBs	fsubs	%f23, %f0, %f27
T1_asi_reg_wr_60:
	mov	0x22, %r14
	.word 0xf6f38400  ! 1573: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_1_122:
	setx	0x2b0322, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_61:
	mov	0xf, %r14
	.word 0xf4f38e60  ! 1575: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb0b58000  ! 1580: SUBCcc_R	orncc 	%r22, %r0, %r24
T1_asi_reg_wr_62:
	mov	0x3c8, %r14
	.word 0xf8f384a0  ! 1581: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbba448e0  ! 1582: FSUBq	dis not found

	.word 0xb7a44860  ! 1586: FADDq	dis not found

	.word 0xb9a88820  ! 1588: FMOVLE	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb8348000  ! 1590: SUBC_R	orn 	%r18, %r0, %r28
	.word 0xba3d6078  ! 1593: XNOR_I	xnor 	%r21, 0x0078, %r29
	.word 0xb8bc60f3  ! 1595: XNORcc_I	xnorcc 	%r17, 0x00f3, %r28
iob_intr_1_136:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_136), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_wr_63:
	mov	0x10, %r14
	.word 0xf8f38e40  ! 1603: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb5a80c20  ! 1604: FMOVRLZ	dis not found

	.word 0xbda98820  ! 1605: FMOVNEG	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_64:
	mov	0x1b, %r14
	.word 0xf0f389e0  ! 1609: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb3aac820  ! 1611: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xb3abc820  ! 1612: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb7a80420  ! 1613: FMOVRZ	dis not found

cpu_intr_1_123:
	setx	0x2b0304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a84820  ! 1617: FMOVE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_81:
	mov	0x2, %r14
	.word 0xfcdb8e60  ! 1620: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb3aa0820  ! 1626: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb4946033  ! 1627: ORcc_I	orcc 	%r17, 0x0033, %r26
iob_intr_1_137:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_137), 16, 16)) -> intp(1, 0, 1f)
cpu_intr_1_124:
	setx	0x2a0300, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_82:
	mov	0x33, %r14
	.word 0xf0db8400  ! 1631: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbba94820  ! 1632: FMOVCS	fmovs	%fcc1, %f0, %f29
cpu_intr_1_125:
	setx	0x2a022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb2d6001  ! 1642: SLL_I	sll 	%r21, 0x0001, %r29
	.word 0xb88ce080  ! 1644: ANDcc_I	andcc 	%r19, 0x0080, %r28
cpu_intr_1_126:
	setx	0x280200, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_138:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_138), 16, 16)) -> intp(1, 0, 22)
	.word 0xb1a58820  ! 1650: FADDs	fadds	%f22, %f0, %f24
	.word 0xb5a48960  ! 1653: FMULq	dis not found

cpu_intr_1_127:
	setx	0x2a0003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb93c9000  ! 1655: SRAX_R	srax	%r18, %r0, %r28
	.word 0xb9641800  ! 1656: MOVcc_R	<illegal instruction>
	.word 0xb3a00020  ! 1658: FMOVs	fmovs	%f0, %f25
T1_asi_reg_wr_65:
	mov	0x9, %r14
	.word 0xfef38e40  ! 1663: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_rd_83:
	mov	0x3c8, %r14
	.word 0xf4db8400  ! 1667: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T1_asi_reg_rd_84:
	mov	0x31, %r14
	.word 0xf0db84a0  ! 1670: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T1_asi_reg_wr_66:
	mov	0x3c0, %r14
	.word 0xfef389e0  ! 1672: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_wr_67:
	mov	0x1, %r14
	.word 0xf8f384a0  ! 1673: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_1_128:
	setx	0x290303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a84820  ! 1680: FMOVE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_85:
	mov	0x27, %r14
	.word 0xf0db8e40  ! 1681: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbbaa0820  ! 1683: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb435219e  ! 1686: ORN_I	orn 	%r20, 0x019e, %r26
	.word 0xb9a80820  ! 1687: FMOVN	fmovs	%fcc1, %f0, %f28
iob_intr_1_139:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_139), 16, 16)) -> intp(1, 0, 3c)
iob_intr_1_140:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_140), 16, 16)) -> intp(1, 0, 17)
cpu_intr_1_129:
	setx	0x280303, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_130:
	setx	0x2b0014, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_131:
	setx	0x290026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba58960  ! 1700: FMULq	dis not found

	.word 0xbfa4c860  ! 1702: FADDq	dis not found

	.word 0xbe2c0000  ! 1706: ANDN_R	andn 	%r16, %r0, %r31
	.word 0xbfa80820  ! 1707: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xba1d8000  ! 1709: XOR_R	xor 	%r22, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbab8820  ! 1712: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xbba00020  ! 1713: FMOVs	fmovs	%f0, %f29
	.word 0xbd51c000  ! 1714: RDPR_TL	<illegal instruction>
T1_asi_reg_wr_68:
	mov	0xc, %r14
	.word 0xf8f38400  ! 1715: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbfab8820  ! 1716: FMOVPOS	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_69:
	mov	0x3c2, %r14
	.word 0xf6f38400  ! 1718: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T1_asi_reg_wr_70:
	mov	0x18, %r14
	.word 0xf0f38e60  ! 1721: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xbda81420  ! 1727: FMOVRNZ	dis not found

	.word 0xbdab8820  ! 1729: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xbdaa4820  ! 1734: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xb7a509a0  ! 1735: FDIVs	fdivs	%f20, %f0, %f27
T1_asi_reg_rd_86:
	mov	0xa, %r14
	.word 0xfcdb8e40  ! 1738: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbda90820  ! 1739: FMOVLEU	fmovs	%fcc1, %f0, %f30
cpu_intr_1_132:
	setx	0x2b0232, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_71:
	mov	0x3c8, %r14
	.word 0xf8f38e60  ! 1745: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_1_141:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_141), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb9a81c20  ! 1751: FMOVRGEZ	dis not found

	.word 0xbe3da063  ! 1752: XNOR_I	xnor 	%r22, 0x0063, %r31
	.word 0xb5641800  ! 1753: MOVcc_R	<illegal instruction>
	.word 0xb5a00020  ! 1754: FMOVs	fmovs	%f0, %f26
T1_asi_reg_wr_72:
	mov	0x36, %r14
	.word 0xf0f38e40  ! 1755: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_rd_87:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 1756: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_wr_73:
	mov	0x10, %r14
	.word 0xf2f389e0  ! 1759: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T1_asi_reg_wr_74:
	mov	0x28, %r14
	.word 0xf8f38e40  ! 1760: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_wr_75:
	mov	0xa, %r14
	.word 0xf0f384a0  ! 1761: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbd2da001  ! 1762: SLL_I	sll 	%r22, 0x0001, %r30
	.word 0xbfa81420  ! 1763: FMOVRNZ	dis not found

T1_asi_reg_wr_76:
	mov	0x3c1, %r14
	.word 0xfcf38400  ! 1765: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb5abc820  ! 1768: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xbda589e0  ! 1769: FDIVq	dis not found

cpu_intr_1_133:
	setx	0x2b013b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_142:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_142), 16, 16)) -> intp(1, 0, 33)
	.word 0xbfa48920  ! 1775: FMULs	fmuls	%f18, %f0, %f31
iob_intr_1_143:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_143), 16, 16)) -> intp(1, 0, 3c)
cpu_intr_1_134:
	setx	0x2b031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda50820  ! 1784: FADDs	fadds	%f20, %f0, %f30
	.word 0xb29ce097  ! 1792: XORcc_I	xorcc 	%r19, 0x0097, %r25
iob_intr_1_144:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_144), 16, 16)) -> intp(1, 0, d)
	.word 0xb1a5c960  ! 1798: FMULq	dis not found

T1_asi_reg_wr_77:
	mov	0xe, %r14
	.word 0xf6f38e40  ! 1800: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb3a00560  ! 1802: FSQRTq	fsqrt	
iob_intr_1_145:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_145), 16, 16)) -> intp(1, 0, 31)
	.word 0xbba40840  ! 1805: FADDd	faddd	%f16, %f0, %f60
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb09561a2  ! 1807: ORcc_I	orcc 	%r21, 0x01a2, %r24
	.word 0xb9a54920  ! 1808: FMULs	fmuls	%f21, %f0, %f28
	.word 0xb5a80420  ! 1813: FMOVRZ	dis not found

iob_intr_1_146:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_146), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_rd_88:
	mov	0x3c1, %r14
	.word 0xf8db89e0  ! 1816: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb7a81c20  ! 1817: FMOVRGEZ	dis not found

	.word 0xb5a50820  ! 1818: FADDs	fadds	%f20, %f0, %f26
iob_intr_1_147:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_147), 16, 16)) -> intp(1, 0, 19)
	.word 0xb5a80420  ! 1821: FMOVRZ	dis not found

iob_intr_1_148:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_148), 16, 16)) -> intp(1, 0, 36)
T1_asi_reg_rd_89:
	mov	0x0, %r14
	.word 0xf2db8400  ! 1826: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_1_149:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_149), 16, 16)) -> intp(1, 0, 16)
iob_intr_1_150:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_150), 16, 16)) -> intp(1, 0, 27)
	.word 0xb5a409c0  ! 1831: FDIVd	fdivd	%f16, %f0, %f26
	.word 0xb7540000  ! 1832: RDPR_GL	<illegal instruction>
	.word 0xbda84820  ! 1835: FMOVE	fmovs	%fcc1, %f0, %f30
iob_intr_1_151:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_151), 16, 16)) -> intp(1, 0, 23)
	.word 0xbba94820  ! 1842: FMOVCS	fmovs	%fcc1, %f0, %f29
cpu_intr_1_135:
	setx	0x2f0213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab4820  ! 1846: FMOVCC	fmovs	%fcc1, %f0, %f30
cpu_intr_1_136:
	setx	0x2d0202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a8c820  ! 1849: FMOVL	fmovs	%fcc1, %f0, %f28
cpu_intr_1_137:
	setx	0x2c021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a508e0  ! 1853: FSUBq	dis not found

T1_asi_reg_wr_78:
	mov	0xb, %r14
	.word 0xf8f38e80  ! 1855: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb22d21c3  ! 1856: ANDN_I	andn 	%r20, 0x01c3, %r25
iob_intr_1_152:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_152), 16, 16)) -> intp(1, 0, 7)
	.word 0xb1a54820  ! 1861: FADDs	fadds	%f21, %f0, %f24
	.word 0xb3a50960  ! 1862: FMULq	dis not found

iob_intr_1_153:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_153), 16, 16)) -> intp(1, 0, 1c)
T1_asi_reg_rd_90:
	mov	0x3c4, %r14
	.word 0xf4db8e60  ! 1866: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T1_asi_reg_wr_79:
	mov	0x3c6, %r14
	.word 0xf0f38e40  ! 1867: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_rd_91:
	mov	0x3c4, %r14
	.word 0xf8db84a0  ! 1871: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbdaa0820  ! 1874: FMOVA	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_92:
	mov	0x34, %r14
	.word 0xf2db89e0  ! 1878: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb7a409c0  ! 1879: FDIVd	fdivd	%f16, %f0, %f58
cpu_intr_1_138:
	setx	0x2e012e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_154:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_154), 16, 16)) -> intp(1, 0, 36)
cpu_intr_1_139:
	setx	0x2e030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a588c0  ! 1892: FSUBd	fsubd	%f22, %f0, %f58
	.word 0xb9a509e0  ! 1894: FDIVq	dis not found

	.word 0xbba81420  ! 1896: FMOVRNZ	dis not found

cpu_intr_1_140:
	setx	0x2e031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2bda108  ! 1905: XNORcc_I	xnorcc 	%r22, 0x0108, %r25
T1_asi_reg_wr_80:
	mov	0x24, %r14
	.word 0xf0f389e0  ! 1907: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbdab4820  ! 1914: FMOVCC	fmovs	%fcc1, %f0, %f30
iob_intr_1_155:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_155), 16, 16)) -> intp(1, 0, 1c)
	.word 0x9194a043  ! 1917: WRPR_PIL_I	wrpr	%r18, 0x0043, %pil
cpu_intr_1_141:
	setx	0x2c022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a5c8c0  ! 1920: FSUBd	fsubd	%f54, %f0, %f56
	.word 0xb7a589e0  ! 1921: FDIVq	dis not found

T1_asi_reg_wr_81:
	mov	0x3c5, %r14
	.word 0xfef389e0  ! 1922: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb0b5e063  ! 1923: ORNcc_I	orncc 	%r23, 0x0063, %r24
cpu_intr_1_142:
	setx	0x2f021e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_93:
	mov	0x1f, %r14
	.word 0xfcdb8e40  ! 1927: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_143:
	setx	0x2f012c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_82:
	mov	0x3c5, %r14
	.word 0xf6f38e60  ! 1931: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_1_144:
	setx	0x2c0113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba58860  ! 1933: FADDq	dis not found

	.word 0xbfa00040  ! 1935: FMOVd	fmovd	%f0, %f62
cpu_intr_1_145:
	setx	0x2d031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c860  ! 1939: FADDq	dis not found

	.word 0xbb643801  ! 1941: MOVcc_I	<illegal instruction>
cpu_intr_1_146:
	setx	0x2e0306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb204a069  ! 1946: ADD_I	add 	%r18, 0x0069, %r25
cpu_intr_1_147:
	setx	0x2f032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa50840  ! 1949: FADDd	faddd	%f20, %f0, %f62
	.word 0xb3ab4820  ! 1950: FMOVCC	fmovs	%fcc1, %f0, %f25
cpu_intr_1_148:
	setx	0x2c021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aa8820  ! 1957: FMOVG	fmovs	%fcc1, %f0, %f24
cpu_intr_1_149:
	setx	0x2e021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_156:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_156), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbda44940  ! 1961: FMULd	fmuld	%f48, %f0, %f30
cpu_intr_1_150:
	setx	0x2e0138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a5c8e0  ! 1964: FSUBq	dis not found

	.word 0xbba488a0  ! 1966: FSUBs	fsubs	%f18, %f0, %f29
	.word 0xb3a508e0  ! 1967: FSUBq	dis not found

	.word 0xb2344000  ! 1968: SUBC_R	orn 	%r17, %r0, %r25
	lda	[%r22 + %g0] 0xf0, %f2
T1_asi_reg_rd_94:
	mov	0x20, %r14
	.word 0xfcdb84a0  ! 1970: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb5a90820  ! 1971: FMOVLEU	fmovs	%fcc1, %f0, %f26
cpu_intr_1_151:
	setx	0x2d013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0150000  ! 1975: OR_R	or 	%r20, %r0, %r24
iob_intr_1_157:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_157), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_rd_95:
	mov	0x4, %r14
	.word 0xfadb8e40  ! 1977: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_1_152:
	setx	0x2d0318, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_96:
	mov	0x26, %r14
	.word 0xf8db8e40  ! 1979: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbfaa4820  ! 1980: FMOVNE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_97:
	mov	0x2f, %r14
	.word 0xfadb8400  ! 1981: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbea4c000  ! 1983: SUBcc_R	subcc 	%r19, %r0, %r31
T1_asi_reg_wr_83:
	mov	0x11, %r14
	.word 0xf2f38e40  ! 1986: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_rd_98:
	mov	0x15, %r14
	.word 0xf8db8e60  ! 1988: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T1_asi_reg_wr_84:
	mov	0x2b, %r14
	.word 0xf6f38e40  ! 1989: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb83de10a  ! 1992: XNOR_I	xnor 	%r23, 0x010a, %r28
	.word 0xb5a00540  ! 1993: FSQRTd	fsqrt	
cpu_intr_1_153:
	setx	0x2e003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_154:
	setx	0x2e002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda58920  ! 2001: FMULs	fmuls	%f22, %f0, %f30
	.word 0xb9aac820  ! 2002: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xb9a409a0  ! 2003: FDIVs	fdivs	%f16, %f0, %f28
	.word 0xb88de1e9  ! 2004: ANDcc_I	andcc 	%r23, 0x01e9, %r28
cpu_intr_1_155:
	setx	0x2e0038, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_99:
	mov	0x2c, %r14
	.word 0xfadb84a0  ! 2006: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb1a80420  ! 2010: FMOVRZ	dis not found

	.word 0xb61de161  ! 2016: XOR_I	xor 	%r23, 0x0161, %r27
	.word 0xbfa588a0  ! 2017: FSUBs	fsubs	%f22, %f0, %f31
cpu_intr_1_156:
	setx	0x2c0217, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_157:
	setx	0x2f0117, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_100:
	mov	0x1f, %r14
	.word 0xf0db8e60  ! 2028: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb7a00020  ! 2030: FMOVs	fmovs	%f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_101:
	mov	0x38, %r14
	.word 0xf2db8400  ! 2034: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xbba00560  ! 2041: FSQRTq	fsqrt	
cpu_intr_1_158:
	setx	0x2e0234, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_159:
	setx	0x2c020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_102:
	mov	0x3c5, %r14
	.word 0xfadb8e40  ! 2049: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_wr_85:
	mov	0x3c7, %r14
	.word 0xfaf389e0  ! 2050: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb7a5c860  ! 2051: FADDq	dis not found

T1_asi_reg_wr_86:
	mov	0x3c2, %r14
	.word 0xf2f389e0  ! 2054: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_1_158:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_158), 16, 16)) -> intp(1, 0, 3)
	.word 0xbc44c000  ! 2057: ADDC_R	addc 	%r19, %r0, %r30
cpu_intr_1_160:
	setx	0x2d0028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab4820  ! 2061: FMOVCC	fmovs	%fcc1, %f0, %f30
iob_intr_1_159:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_159), 16, 16)) -> intp(1, 0, 29)
	.word 0xbda80420  ! 2064: FMOVRZ	dis not found

T1_asi_reg_wr_87:
	mov	0x3c8, %r14
	.word 0xf6f384a0  ! 2067: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T1_asi_reg_wr_88:
	mov	0x28, %r14
	.word 0xf0f389e0  ! 2070: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_1_160:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_160), 16, 16)) -> intp(1, 0, 2b)
iob_intr_1_161:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_161), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_wr_89:
	mov	0x3c6, %r14
	.word 0xf6f384a0  ! 2075: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0x8595e037  ! 2077: WRPR_TSTATE_I	wrpr	%r23, 0x0037, %tstate
cpu_intr_1_161:
	setx	0x2f001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaac820  ! 2080: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb1a80820  ! 2081: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xbda508c0  ! 2084: FSUBd	fsubd	%f20, %f0, %f30
iob_intr_1_162:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_162), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb9a5c940  ! 2088: FMULd	fmuld	%f54, %f0, %f28
iob_intr_1_163:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_163), 16, 16)) -> intp(1, 0, 3f)
T1_asi_reg_rd_103:
	mov	0x32, %r14
	.word 0xf4db89e0  ! 2093: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_1_162:
	setx	0x2f020d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_104:
	mov	0x22, %r14
	.word 0xf0db89e0  ! 2095: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_1_163:
	setx	0x2f0005, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_164:
	setx	0x2f0320, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_165:
	setx	0x2e0137, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_90:
	mov	0x4, %r14
	.word 0xf6f38e60  ! 2100: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	lda	[%r16 + %g0] 0xf0, %f2
T1_asi_reg_wr_91:
	mov	0x33, %r14
	.word 0xf4f38e40  ! 2102: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb9a509c0  ! 2103: FDIVd	fdivd	%f20, %f0, %f28
iob_intr_1_164:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_164), 16, 16)) -> intp(1, 0, 2)
	.word 0xb9a80820  ! 2112: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xb9a9c820  ! 2117: FMOVVS	fmovs	%fcc1, %f0, %f28
cpu_intr_1_166:
	setx	0x2f0015, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_167:
	setx	0x2f032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a8c820  ! 2124: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xbda5c9e0  ! 2126: FDIVq	dis not found

cpu_intr_1_168:
	setx	0x2f032f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_165:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_165), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb1a5c9c0  ! 2139: FDIVd	fdivd	%f54, %f0, %f24
	.word 0xb3aac820  ! 2140: FMOVGE	fmovs	%fcc1, %f0, %f25
cpu_intr_1_169:
	setx	0x2f0128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a94820  ! 2142: FMOVCS	fmovs	%fcc1, %f0, %f27
iob_intr_1_166:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_166), 16, 16)) -> intp(1, 0, e)
iob_intr_1_167:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_167), 16, 16)) -> intp(1, 0, 8)
cpu_intr_1_170:
	setx	0x2e0236, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_171:
	setx	0x2f0104, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_168:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_168), 16, 16)) -> intp(1, 0, b)
	.word 0xbdaac820  ! 2150: FMOVGE	fmovs	%fcc1, %f0, %f30
cpu_intr_1_172:
	setx	0x2d0017, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_105:
	mov	0x3c8, %r14
	.word 0xfedb8e80  ! 2153: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb7a00560  ! 2155: FSQRTq	fsqrt	
T1_asi_reg_wr_92:
	mov	0x2e, %r14
	.word 0xfef389e0  ! 2158: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb5a00040  ! 2159: FMOVd	fmovd	%f0, %f26
	.word 0xbdabc820  ! 2166: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xb3a84820  ! 2168: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xba048000  ! 2170: ADD_R	add 	%r18, %r0, %r29
iob_intr_1_169:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_169), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_173:
	setx	0x2e0027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80c20  ! 2181: FMOVRLZ	dis not found

	.word 0xb4848000  ! 2182: ADDcc_R	addcc 	%r18, %r0, %r26
	.word 0xb3a00020  ! 2184: FMOVs	fmovs	%f0, %f25
iob_intr_1_170:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_170), 16, 16)) -> intp(1, 0, e)
	.word 0xb1a00040  ! 2186: FMOVd	fmovd	%f0, %f24
iob_intr_1_171:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_171), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_rd_106:
	mov	0x8, %r14
	.word 0xf8db8e80  ! 2198: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_1_172:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_172), 16, 16)) -> intp(1, 0, 2d)
cpu_intr_1_174:
	setx	0x2c002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a50840  ! 2203: FADDd	faddd	%f20, %f0, %f24
T1_asi_reg_wr_93:
	mov	0x20, %r14
	.word 0xfcf389e0  ! 2205: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xbda80c20  ! 2206: FMOVRLZ	dis not found

	.word 0xb5a00020  ! 2207: FMOVs	fmovs	%f0, %f26
	.word 0xb7480000  ! 2208: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
T1_asi_reg_rd_107:
	mov	0x10, %r14
	.word 0xfadb89e0  ! 2210: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_1_173:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_173), 16, 16)) -> intp(1, 0, 19)
	lda	[%r16 + %g0] 0xf0, %f2
iob_intr_1_174:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_174), 16, 16)) -> intp(1, 0, 37)
	.word 0xbfa54940  ! 2219: FMULd	fmuld	%f52, %f0, %f62
cpu_intr_1_175:
	setx	0x2c0004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a5c940  ! 2221: FMULd	fmuld	%f54, %f0, %f56
T1_asi_reg_wr_94:
	mov	0x2c, %r14
	.word 0xfaf384a0  ! 2222: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbaac21d4  ! 2224: ANDNcc_I	andncc 	%r16, 0x01d4, %r29
	.word 0xb9a4c9e0  ! 2227: FDIVq	dis not found

iob_intr_1_175:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_175), 16, 16)) -> intp(1, 0, 0)
	.word 0xbdaa0820  ! 2236: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb6c50000  ! 2238: ADDCcc_R	addccc 	%r20, %r0, %r27
	.word 0xb5a94820  ! 2240: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xbfa88820  ! 2241: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb1a94820  ! 2243: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb6b54000  ! 2244: ORNcc_R	orncc 	%r21, %r0, %r27
	.word 0xb5a5c9e0  ! 2249: FDIVq	dis not found

iob_intr_1_176:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_176), 16, 16)) -> intp(1, 0, 6)
	.word 0xb5aa4820  ! 2254: FMOVNE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_108:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 2256: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbfa509a0  ! 2257: FDIVs	fdivs	%f20, %f0, %f31
	.word 0xb5a00560  ! 2259: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb2356142  ! 2261: SUBC_I	orn 	%r21, 0x0142, %r25
	.word 0xbe24a05c  ! 2265: SUB_I	sub 	%r18, 0x005c, %r31
	.word 0xbf7ca401  ! 2266: MOVR_I	movre	%r18, 0x1, %r31
	.word 0xb3a81420  ! 2267: FMOVRNZ	dis not found

iob_intr_1_177:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_177), 16, 16)) -> intp(1, 0, 36)
	.word 0xbdab0820  ! 2269: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0x8395e022  ! 2270: WRPR_TNPC_I	wrpr	%r23, 0x0022, %tnpc
iob_intr_1_178:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_178), 16, 16)) -> intp(1, 0, 5)
	.word 0xb5aa0820  ! 2272: FMOVA	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_95:
	mov	0x3c3, %r14
	.word 0xf6f38e80  ! 2275: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbba508e0  ! 2276: FSUBq	dis not found

	.word 0xb9aa8820  ! 2278: FMOVG	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a81c20  ! 2283: FMOVRGEZ	dis not found

T1_asi_reg_rd_109:
	mov	0x3c6, %r14
	.word 0xfcdb8400  ! 2284: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb8b50000  ! 2285: ORNcc_R	orncc 	%r20, %r0, %r28
	.word 0xb5a81c20  ! 2288: FMOVRGEZ	dis not found

T1_asi_reg_rd_110:
	mov	0x22, %r14
	.word 0xfadb8e60  ! 2290: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_179:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_179), 16, 16)) -> intp(1, 0, 2b)
	.word 0xbe34e06e  ! 2302: SUBC_I	orn 	%r19, 0x006e, %r31
iob_intr_1_180:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_180), 16, 16)) -> intp(1, 0, 2)
	.word 0xb5a00560  ! 2317: FSQRTq	fsqrt	
	.word 0xbba4c9a0  ! 2318: FDIVs	fdivs	%f19, %f0, %f29
	.word 0xbd3df001  ! 2319: SRAX_I	srax	%r23, 0x0001, %r30
	.word 0xb3a5c9a0  ! 2320: FDIVs	fdivs	%f23, %f0, %f25
	.word 0xbe950000  ! 2323: ORcc_R	orcc 	%r20, %r0, %r31
	.word 0xbba00560  ! 2325: FSQRTq	fsqrt	
cpu_intr_1_176:
	setx	0x300219, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xb3aa8820  ! 2333: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb634a074  ! 2335: SUBC_I	orn 	%r18, 0x0074, %r27
T1_asi_reg_wr_96:
	mov	0x5, %r14
	.word 0xf2f38e40  ! 2336: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_1_181:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_181), 16, 16)) -> intp(1, 0, 24)
	.word 0xb9a84820  ! 2339: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb3a88820  ! 2342: FMOVLE	fmovs	%fcc1, %f0, %f25
iob_intr_1_182:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_182), 16, 16)) -> intp(1, 0, 18)
T1_asi_reg_rd_111:
	mov	0x12, %r14
	.word 0xf2db8e60  ! 2350: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb4a50000  ! 2352: SUBcc_R	subcc 	%r20, %r0, %r26
	.word 0xba142189  ! 2353: OR_I	or 	%r16, 0x0189, %r29
	.word 0xba34c000  ! 2355: ORN_R	orn 	%r19, %r0, %r29
cpu_intr_1_177:
	setx	0x31011f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_97:
	mov	0x20, %r14
	.word 0xfef384a0  ! 2361: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb1a00020  ! 2364: FMOVs	fmovs	%f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a00020  ! 2369: FMOVs	fmovs	%f0, %f27
T1_asi_reg_rd_112:
	mov	0x3c7, %r14
	.word 0xfedb8e40  ! 2371: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_1_183:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_183), 16, 16)) -> intp(1, 0, 22)
T1_asi_reg_rd_113:
	mov	0x21, %r14
	.word 0xf6db84a0  ! 2373: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T1_asi_reg_wr_98:
	mov	0x1d, %r14
	.word 0xf6f38e40  ! 2374: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_178:
	setx	0x330104, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_179:
	setx	0x310112, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xb9a00560  ! 2381: FSQRTq	fsqrt	
	.word 0xb5a90820  ! 2382: FMOVLEU	fmovs	%fcc1, %f0, %f26
cpu_intr_1_180:
	setx	0x300016, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_114:
	mov	0x3c8, %r14
	.word 0xfedb8e40  ! 2384: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_1_184:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_184), 16, 16)) -> intp(1, 0, 21)
	.word 0xb7a81c20  ! 2387: FMOVRGEZ	dis not found

	.word 0xb7a00020  ! 2388: FMOVs	fmovs	%f0, %f27
T1_asi_reg_wr_99:
	mov	0x3c5, %r14
	.word 0xf0f38e60  ! 2389: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb3a9c820  ! 2392: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xbba5c8e0  ! 2394: FSUBq	dis not found

	.word 0xb1a4c940  ! 2398: FMULd	fmuld	%f50, %f0, %f24
cpu_intr_1_181:
	setx	0x330112, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_100:
	mov	0x3c0, %r14
	.word 0xfaf389e0  ! 2400: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T1_asi_reg_rd_115:
	mov	0x36, %r14
	.word 0xf2db89e0  ! 2401: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_1_182:
	setx	0x320011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab4820  ! 2403: FMOVCC	fmovs	%fcc1, %f0, %f29
cpu_intr_1_183:
	setx	0x32011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a84820  ! 2410: FMOVE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_184:
	setx	0x330032, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_185:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_185), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_rd_116:
	mov	0x26, %r14
	.word 0xf6db8e40  ! 2418: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T1_asi_reg_wr_101:
	mov	0x1, %r14
	.word 0xfcf38e40  ! 2420: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_186:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_186), 16, 16)) -> intp(1, 0, 4)
iob_intr_1_187:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_187), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_188:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_188), 16, 16)) -> intp(1, 0, 3)
	.word 0xb1a509e0  ! 2426: FDIVq	dis not found

	.word 0xba140000  ! 2427: OR_R	or 	%r16, %r0, %r29
	.word 0xbda90820  ! 2428: FMOVLEU	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_189:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_189), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb5a81820  ! 2433: FMOVRGZ	fmovs	%fcc3, %f0, %f26
iob_intr_1_190:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_190), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_191:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_191), 16, 16)) -> intp(1, 0, 30)
iob_intr_1_192:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_192), 16, 16)) -> intp(1, 0, 12)
	.word 0xbfa80420  ! 2446: FMOVRZ	dis not found

T1_asi_reg_rd_117:
	mov	0x5, %r14
	.word 0xfadb84a0  ! 2449: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbfa00040  ! 2450: FMOVd	fmovd	%f0, %f62
iob_intr_1_193:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_193), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_rd_118:
	mov	0x13, %r14
	.word 0xf2db8e60  ! 2452: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbfaa4820  ! 2453: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb1a58940  ! 2454: FMULd	fmuld	%f22, %f0, %f24
cpu_intr_1_185:
	setx	0x320324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa588c0  ! 2458: FSUBd	fsubd	%f22, %f0, %f62
	.word 0xb0948000  ! 2459: ORcc_R	orcc 	%r18, %r0, %r24
T1_asi_reg_wr_102:
	mov	0x3c6, %r14
	.word 0xf8f38e40  ! 2460: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb3a4c860  ! 2463: FADDq	dis not found

	.word 0xb9a549a0  ! 2467: FDIVs	fdivs	%f21, %f0, %f28
	.word 0xb5a44960  ! 2470: FMULq	dis not found

iob_intr_1_194:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_194), 16, 16)) -> intp(1, 0, 2b)
	.word 0xbda489c0  ! 2473: FDIVd	fdivd	%f18, %f0, %f30
iob_intr_1_195:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_195), 16, 16)) -> intp(1, 0, 1d)
	.word 0xbda84820  ! 2479: FMOVE	fmovs	%fcc1, %f0, %f30
iob_intr_1_196:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_196), 16, 16)) -> intp(1, 0, 2c)
cpu_intr_1_186:
	setx	0x310033, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_187:
	setx	0x33000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa98820  ! 2485: FMOVNEG	fmovs	%fcc1, %f0, %f31
cpu_intr_1_188:
	setx	0x33030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00020  ! 2489: FMOVs	fmovs	%f0, %f31
iob_intr_1_197:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_197), 16, 16)) -> intp(1, 0, 1e)
T1_asi_reg_rd_119:
	mov	0x14, %r14
	.word 0xfcdb8e40  ! 2492: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_rd_120:
	mov	0x1f, %r14
	.word 0xf6db8e60  ! 2493: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbfa588e0  ! 2494: FSUBq	dis not found

	.word 0xb5a80820  ! 2495: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xb7a44920  ! 2496: FMULs	fmuls	%f17, %f0, %f27
T1_asi_reg_wr_103:
	mov	0x1d, %r14
	.word 0xf4f384a0  ! 2498: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_1_198:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_198), 16, 16)) -> intp(1, 0, 2e)
T1_asi_reg_wr_104:
	mov	0x25, %r14
	.word 0xf2f38e60  ! 2504: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb3a509c0  ! 2505: FDIVd	fdivd	%f20, %f0, %f56
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbe1d2195  ! 2508: XOR_I	xor 	%r20, 0x0195, %r31
	.word 0xb3a58940  ! 2509: FMULd	fmuld	%f22, %f0, %f56
T1_asi_reg_wr_105:
	mov	0x3c0, %r14
	.word 0xf4f38e80  ! 2510: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbfa9c820  ! 2512: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xb835c000  ! 2515: ORN_R	orn 	%r23, %r0, %r28
	.word 0xbba4c840  ! 2516: FADDd	faddd	%f50, %f0, %f60
	.word 0xb3a88820  ! 2517: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xbda81c20  ! 2519: FMOVRGEZ	dis not found

	.word 0xbda00040  ! 2521: FMOVd	fmovd	%f0, %f30
T1_asi_reg_rd_121:
	mov	0x3c5, %r14
	.word 0xfedb8e80  ! 2526: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xbac48000  ! 2527: ADDCcc_R	addccc 	%r18, %r0, %r29
T1_asi_reg_rd_122:
	mov	0x3c0, %r14
	.word 0xfcdb84a0  ! 2529: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_1_199:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_199), 16, 16)) -> intp(1, 0, 1a)
	.word 0xbeb5216d  ! 2531: ORNcc_I	orncc 	%r20, 0x016d, %r31
cpu_intr_1_189:
	setx	0x330337, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_190:
	setx	0x310237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00540  ! 2538: FSQRTd	fsqrt	
	.word 0xb82d4000  ! 2539: ANDN_R	andn 	%r21, %r0, %r28
	.word 0xbba58820  ! 2547: FADDs	fadds	%f22, %f0, %f29
	.word 0xb9a80820  ! 2552: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
iob_intr_1_200:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_200), 16, 16)) -> intp(1, 0, 18)
cpu_intr_1_191:
	setx	0x310303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00020  ! 2558: FMOVs	fmovs	%f0, %f29
	lda	[%r19 + %g0] 0xf0, %f2
T1_asi_reg_wr_106:
	mov	0x3c8, %r14
	.word 0xf0f38e40  ! 2563: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_1_192:
	setx	0x32030e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_193:
	setx	0x32011d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_123:
	mov	0xc, %r14
	.word 0xf2db8e40  ! 2568: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_201:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_201), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb5a84820  ! 2573: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb3a58820  ! 2576: FADDs	fadds	%f22, %f0, %f25
	.word 0xbba00560  ! 2580: FSQRTq	fsqrt	
T1_asi_reg_rd_124:
	mov	0x28, %r14
	.word 0xf6db8400  ! 2582: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_1_202:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_202), 16, 16)) -> intp(1, 0, 1f)
	lda	[%r19 + %g0] 0xf0, %f2
iob_intr_1_203:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_203), 16, 16)) -> intp(1, 0, 3a)
cpu_intr_1_194:
	setx	0x300216, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_195:
	setx	0x33003c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_196:
	setx	0x32001f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_197:
	setx	0x320200, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_125:
	mov	0x1c, %r14
	.word 0xfcdb8e80  ! 2601: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T1_asi_reg_rd_126:
	mov	0x1c, %r14
	.word 0xf0db84a0  ! 2602: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbba80820  ! 2604: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_127:
	mov	0x33, %r14
	.word 0xfcdb8400  ! 2606: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_1_198:
	setx	0x300228, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_128:
	mov	0x36, %r14
	.word 0xf6db8e40  ! 2614: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_199:
	setx	0x31012e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_204:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_204), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb3357001  ! 2617: SRLX_I	srlx	%r21, 0x0001, %r25
iob_intr_1_205:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_205), 16, 16)) -> intp(1, 0, 25)
	.word 0xbb2d4000  ! 2623: SLL_R	sll 	%r21, %r0, %r29
T1_asi_reg_rd_129:
	mov	0x22, %r14
	.word 0xf6db8400  ! 2629: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_1_200:
	setx	0x320320, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_201:
	setx	0x310110, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_202:
	setx	0x330319, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_206:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_206), 16, 16)) -> intp(1, 0, 2e)
T1_asi_reg_rd_130:
	mov	0x19, %r14
	.word 0xf6db8e40  ! 2636: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_207:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_207), 16, 16)) -> intp(1, 0, 28)
	.word 0xb5a4c9c0  ! 2639: FDIVd	fdivd	%f50, %f0, %f26
	.word 0xb1ab4820  ! 2640: FMOVCC	fmovs	%fcc1, %f0, %f24
cpu_intr_1_203:
	setx	0x300128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80820  ! 2648: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xbfa00520  ! 2650: FSQRTs	fsqrt	
cpu_intr_1_204:
	setx	0x32001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeb421d8  ! 2652: ORNcc_I	orncc 	%r16, 0x01d8, %r31
	.word 0xb7ab4820  ! 2654: FMOVCC	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_107:
	mov	0x3c2, %r14
	.word 0xfaf38e60  ! 2657: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb7a4c820  ! 2659: FADDs	fadds	%f19, %f0, %f27
T1_asi_reg_rd_131:
	mov	0x1, %r14
	.word 0xf6db8e60  ! 2660: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xb3a548a0  ! 2662: FSUBs	fsubs	%f21, %f0, %f25
cpu_intr_1_205:
	setx	0x320323, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbba589c0  ! 2667: FDIVd	fdivd	%f22, %f0, %f60
iob_intr_1_208:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_208), 16, 16)) -> intp(1, 0, 1e)
T1_asi_reg_rd_132:
	mov	0x3c7, %r14
	.word 0xfedb8e80  ! 2669: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_1_209:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_209), 16, 16)) -> intp(1, 0, 38)
iob_intr_1_210:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_210), 16, 16)) -> intp(1, 0, 34)
	.word 0xb7a84820  ! 2674: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb7a00560  ! 2676: FSQRTq	fsqrt	
	.word 0xb7ab4820  ! 2678: FMOVCC	fmovs	%fcc1, %f0, %f27
cpu_intr_1_206:
	setx	0x300139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe9d4000  ! 2683: XORcc_R	xorcc 	%r21, %r0, %r31
cpu_intr_1_207:
	setx	0x310315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa50920  ! 2688: FMULs	fmuls	%f20, %f0, %f31
	.word 0xb9aa0820  ! 2692: FMOVA	fmovs	%fcc1, %f0, %f28
cpu_intr_1_208:
	setx	0x320006, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_133:
	mov	0x1f, %r14
	.word 0xf0db8400  ! 2695: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb7a48960  ! 2697: FMULq	dis not found

	.word 0xb1a9c820  ! 2698: FMOVVS	fmovs	%fcc1, %f0, %f24
iob_intr_1_211:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_211), 16, 16)) -> intp(1, 0, 28)
iob_intr_1_212:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_212), 16, 16)) -> intp(1, 0, 3a)
cpu_intr_1_209:
	setx	0x330314, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xb7a5c9c0  ! 2705: FDIVd	fdivd	%f54, %f0, %f58
iob_intr_1_213:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_213), 16, 16)) -> intp(1, 0, 11)
iob_intr_1_214:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_214), 16, 16)) -> intp(1, 0, 3a)
cpu_intr_1_210:
	setx	0x30020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda408a0  ! 2715: FSUBs	fsubs	%f16, %f0, %f30
iob_intr_1_215:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_215), 16, 16)) -> intp(1, 0, 2)
	.word 0xbfa9c820  ! 2717: FMOVVS	fmovs	%fcc1, %f0, %f31
cpu_intr_1_211:
	setx	0x30030f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_216:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_216), 16, 16)) -> intp(1, 0, 30)
	.word 0xb494e0df  ! 2723: ORcc_I	orcc 	%r19, 0x00df, %r26
T1_asi_reg_rd_134:
	mov	0x18, %r14
	.word 0xf0db8e40  ! 2725: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb3a00560  ! 2726: FSQRTq	fsqrt	
T1_asi_reg_rd_135:
	mov	0x1c, %r14
	.word 0xf8db89e0  ! 2727: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_1_212:
	setx	0x330008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a549a0  ! 2732: FDIVs	fdivs	%f21, %f0, %f26
	.word 0xb49c60d3  ! 2733: XORcc_I	xorcc 	%r17, 0x00d3, %r26
cpu_intr_1_213:
	setx	0x330115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a81820  ! 2736: FMOVRGZ	fmovs	%fcc3, %f0, %f25
iob_intr_1_217:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_217), 16, 16)) -> intp(1, 0, 3b)
cpu_intr_1_214:
	setx	0x310332, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_108:
	mov	0x3c6, %r14
	.word 0xf2f38e80  ! 2741: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb7a54940  ! 2742: FMULd	fmuld	%f52, %f0, %f58
	.word 0xb1a84820  ! 2744: FMOVE	fmovs	%fcc1, %f0, %f24
cpu_intr_1_215:
	setx	0x34010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a449e0  ! 2746: FDIVq	dis not found

iob_intr_1_218:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_218), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb5a40840  ! 2749: FADDd	faddd	%f16, %f0, %f26
iob_intr_1_219:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_219), 16, 16)) -> intp(1, 0, 28)
	.word 0xb7508000  ! 2753: RDPR_TSTATE	<illegal instruction>
	.word 0xbba81420  ! 2758: FMOVRNZ	dis not found

T1_asi_reg_wr_109:
	mov	0x23, %r14
	.word 0xf2f389e0  ! 2760: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_1_216:
	setx	0x360224, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_136:
	mov	0x9, %r14
	.word 0xfcdb8e40  ! 2763: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_217:
	setx	0x370024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a88820  ! 2765: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xbdab4820  ! 2769: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xbfa409a0  ! 2773: FDIVs	fdivs	%f16, %f0, %f31
T1_asi_reg_rd_137:
	mov	0xa, %r14
	.word 0xfedb8e80  ! 2774: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb3a5c9e0  ! 2777: FDIVq	dis not found

T1_asi_reg_wr_110:
	mov	0x5, %r14
	.word 0xf4f38e40  ! 2778: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_218:
	setx	0x360233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00560  ! 2789: FSQRTq	fsqrt	
iob_intr_1_220:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_220), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb9a80820  ! 2793: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xbfa9c820  ! 2795: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xb3643801  ! 2798: MOVcc_I	<illegal instruction>
cpu_intr_1_219:
	setx	0x360303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a94820  ! 2800: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xbda00040  ! 2808: FMOVd	fmovd	%f0, %f30
	.word 0xb1a81820  ! 2810: FMOVRGZ	fmovs	%fcc3, %f0, %f24
cpu_intr_1_220:
	setx	0x340239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda88820  ! 2813: FMOVLE	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a50840  ! 2817: FADDd	faddd	%f20, %f0, %f26
	.word 0xb83d8000  ! 2820: XNOR_R	xnor 	%r22, %r0, %r28
iob_intr_1_221:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_221), 16, 16)) -> intp(1, 0, c)
iob_intr_1_222:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_222), 16, 16)) -> intp(1, 0, e)
T1_asi_reg_wr_111:
	mov	0x2c, %r14
	.word 0xf6f38e80  ! 2825: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb7a448c0  ! 2827: FSUBd	fsubd	%f48, %f0, %f58
	.word 0xb6350000  ! 2828: ORN_R	orn 	%r20, %r0, %r27
iob_intr_1_223:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_223), 16, 16)) -> intp(1, 0, 1d)
	.word 0xbd2db001  ! 2830: SLLX_I	sllx	%r22, 0x0001, %r30
	.word 0xb92c5000  ! 2832: SLLX_R	sllx	%r17, %r0, %r28
T1_asi_reg_rd_138:
	mov	0x1c, %r14
	.word 0xf8db84a0  ! 2835: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb7a00520  ! 2838: FSQRTs	fsqrt	
cpu_intr_1_221:
	setx	0x36011c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_112:
	mov	0x31, %r14
	.word 0xfef38400  ! 2841: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb5a81420  ! 2842: FMOVRNZ	dis not found

T1_asi_reg_wr_113:
	mov	0x23, %r14
	.word 0xf6f384a0  ! 2843: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb13d8000  ! 2846: SRA_R	sra 	%r22, %r0, %r24
	.word 0xbda80820  ! 2847: FMOVN	fmovs	%fcc1, %f0, %f30
cpu_intr_1_222:
	setx	0x350025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00560  ! 2849: FSQRTq	fsqrt	
	.word 0xbfa81c20  ! 2851: FMOVRGEZ	dis not found

cpu_intr_1_223:
	setx	0x36010d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_224:
	setx	0x350118, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_114:
	mov	0x1, %r14
	.word 0xf2f38e80  ! 2859: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T1_asi_reg_wr_115:
	mov	0x3c7, %r14
	.word 0xf2f38e40  ! 2860: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_1_224:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_224), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbda81820  ! 2862: FMOVRGZ	fmovs	%fcc3, %f0, %f30
cpu_intr_1_225:
	setx	0x360305, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_139:
	mov	0x2c, %r14
	.word 0xf6db8e80  ! 2873: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_1_225:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_225), 16, 16)) -> intp(1, 0, 7)
T1_asi_reg_rd_140:
	mov	0x3c2, %r14
	.word 0xfadb8e80  ! 2877: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T1_asi_reg_wr_116:
	mov	0x27, %r14
	.word 0xf8f38e60  ! 2881: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_1_226:
	setx	0x350206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa5c8c0  ! 2885: FSUBd	fsubd	%f54, %f0, %f62
iob_intr_1_226:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_226), 16, 16)) -> intp(1, 0, 35)
iob_intr_1_227:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_227), 16, 16)) -> intp(1, 0, b)
iob_intr_1_228:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_228), 16, 16)) -> intp(1, 0, 12)
iob_intr_1_229:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_229), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_227:
	setx	0x360216, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_141:
	mov	0x3c3, %r14
	.word 0xfedb8e80  ! 2900: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb5a489c0  ! 2904: FDIVd	fdivd	%f18, %f0, %f26
T1_asi_reg_rd_142:
	mov	0x30, %r14
	.word 0xf2db8e60  ! 2905: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T1_asi_reg_rd_143:
	mov	0x3c3, %r14
	.word 0xf4db8400  ! 2906: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb3a81820  ! 2907: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb72cc000  ! 2909: SLL_R	sll 	%r19, %r0, %r27
iob_intr_1_230:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_230), 16, 16)) -> intp(1, 0, 3e)
iob_intr_1_231:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_231), 16, 16)) -> intp(1, 0, 38)
	.word 0xbba4c820  ! 2916: FADDs	fadds	%f19, %f0, %f29
iob_intr_1_232:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_232), 16, 16)) -> intp(1, 0, 25)
	.word 0xb5a50860  ! 2928: FADDq	dis not found

	.word 0xb9a4c820  ! 2930: FADDs	fadds	%f19, %f0, %f28
iob_intr_1_233:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_233), 16, 16)) -> intp(1, 0, 17)
iob_intr_1_234:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_234), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb1a94820  ! 2939: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xbfa00560  ! 2944: FSQRTq	fsqrt	
T1_asi_reg_rd_144:
	mov	0x1, %r14
	.word 0xf2db8e40  ! 2945: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_235:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_235), 16, 16)) -> intp(1, 0, 4)
cpu_intr_1_228:
	setx	0x35023c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_236:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_236), 16, 16)) -> intp(1, 0, 2)
cpu_intr_1_229:
	setx	0x340304, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_145:
	mov	0x3c6, %r14
	.word 0xf8db8e60  ! 2954: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_1_237:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_237), 16, 16)) -> intp(1, 0, 33)
	.word 0xb7a5c920  ! 2959: FMULs	fmuls	%f23, %f0, %f27
iob_intr_1_238:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_238), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb9ab0820  ! 2965: FMOVGU	fmovs	%fcc1, %f0, %f28
iob_intr_1_239:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_239), 16, 16)) -> intp(1, 0, c)
	.word 0xbba98820  ! 2968: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xb9ab8820  ! 2969: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xbc2d0000  ! 2972: ANDN_R	andn 	%r20, %r0, %r30
	.word 0xb735c000  ! 2975: SRL_R	srl 	%r23, %r0, %r27
	.word 0xbfa54920  ! 2977: FMULs	fmuls	%f21, %f0, %f31
cpu_intr_1_230:
	setx	0x370315, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_117:
	mov	0x3c6, %r14
	.word 0xfaf384a0  ! 2981: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_1_240:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_240), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_rd_146:
	mov	0x1a, %r14
	.word 0xfcdb84a0  ! 2987: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbba588a0  ! 2988: FSUBs	fsubs	%f22, %f0, %f29
cpu_intr_1_231:
	setx	0x35011c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_147:
	mov	0x6, %r14
	.word 0xf8db8e40  ! 2990: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_wr_118:
	mov	0x3c5, %r14
	.word 0xf2f38e60  ! 2991: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_1_232:
	setx	0x340327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa88820  ! 2996: FMOVLE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_233:
	setx	0x34023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80820  ! 3002: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb5a4c940  ! 3004: FMULd	fmuld	%f50, %f0, %f26
	.word 0xbfa48920  ! 3006: FMULs	fmuls	%f18, %f0, %f31
cpu_intr_1_234:
	setx	0x37012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaa8820  ! 3012: FMOVG	fmovs	%fcc1, %f0, %f29
cpu_intr_1_235:
	setx	0x360227, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_241:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_241), 16, 16)) -> intp(1, 0, 1f)
	lda	[%r21 + %g0] 0xf0, %f2
	.word 0xb1a8c820  ! 3016: FMOVL	fmovs	%fcc1, %f0, %f24
cpu_intr_1_236:
	setx	0x34010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73de001  ! 3023: SRA_I	sra 	%r23, 0x0001, %r27
	.word 0xbba588e0  ! 3025: FSUBq	dis not found

T1_asi_reg_wr_119:
	mov	0x3c2, %r14
	.word 0xf8f38400  ! 3026: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0x8395e0da  ! 3028: WRPR_TNPC_I	wrpr	%r23, 0x00da, %tnpc
cpu_intr_1_237:
	setx	0x370100, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_238:
	setx	0x35020f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_239:
	setx	0x350118, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_240:
	setx	0x340219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00540  ! 3033: FSQRTd	fsqrt	
cpu_intr_1_241:
	setx	0x360010, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_242:
	setx	0x340106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba40840  ! 3037: FADDd	faddd	%f16, %f0, %f60
	.word 0xb3a00040  ! 3040: FMOVd	fmovd	%f0, %f56
cpu_intr_1_243:
	setx	0x350036, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_244:
	setx	0x35023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa50940  ! 3045: FMULd	fmuld	%f20, %f0, %f62
	.word 0xbba00560  ! 3046: FSQRTq	fsqrt	
	.word 0xb6342150  ! 3047: ORN_I	orn 	%r16, 0x0150, %r27
	.word 0xb1a90820  ! 3048: FMOVLEU	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_148:
	mov	0x21, %r14
	.word 0xf4db8e40  ! 3052: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb5a84820  ! 3053: FMOVE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_245:
	setx	0x360331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a9c820  ! 3057: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb9a5c960  ! 3059: FMULq	dis not found

	.word 0xb6b44000  ! 3064: ORNcc_R	orncc 	%r17, %r0, %r27
T1_asi_reg_wr_120:
	mov	0x15, %r14
	.word 0xfaf38400  ! 3069: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T1_asi_reg_wr_121:
	mov	0x19, %r14
	.word 0xfef38e80  ! 3070: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb235619e  ! 3071: ORN_I	orn 	%r21, 0x019e, %r25
	.word 0xbfa448e0  ! 3073: FSUBq	dis not found

	.word 0xb1a00040  ! 3075: FMOVd	fmovd	%f0, %f24
	.word 0xb935d000  ! 3076: SRLX_R	srlx	%r23, %r0, %r28
	.word 0xb8b54000  ! 3078: ORNcc_R	orncc 	%r21, %r0, %r28
iob_intr_1_242:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_242), 16, 16)) -> intp(1, 0, 5)
	.word 0xb5a4c960  ! 3080: FMULq	dis not found

T1_asi_reg_wr_122:
	mov	0x2f, %r14
	.word 0xf4f38400  ! 3081: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T1_asi_reg_wr_123:
	mov	0x26, %r14
	.word 0xf8f38e40  ! 3084: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbfa5c8c0  ! 3086: FSUBd	fsubd	%f54, %f0, %f62
cpu_intr_1_246:
	setx	0x36023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4a4e147  ! 3090: SUBcc_I	subcc 	%r19, 0x0147, %r26
	.word 0xb7a8c820  ! 3093: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb9a88820  ! 3095: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xbc34c000  ! 3096: ORN_R	orn 	%r19, %r0, %r30
	.word 0xb3a00020  ! 3099: FMOVs	fmovs	%f0, %f25
	.word 0xb5a8c820  ! 3101: FMOVL	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_149:
	mov	0x1f, %r14
	.word 0xfcdb89e0  ! 3103: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbfa5c9a0  ! 3111: FDIVs	fdivs	%f23, %f0, %f31
	lda	[%r21 + %g0] 0xf0, %f2
cpu_intr_1_247:
	setx	0x37011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb694200f  ! 3118: ORcc_I	orcc 	%r16, 0x000f, %r27
cpu_intr_1_248:
	setx	0x34032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1480000  ! 3120: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
iob_intr_1_243:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_243), 16, 16)) -> intp(1, 0, 20)
	.word 0xb5aac820  ! 3127: FMOVGE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_249:
	setx	0x36012b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_150:
	mov	0x3c5, %r14
	.word 0xf8db8e80  ! 3129: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbba4c8e0  ! 3130: FSUBq	dis not found

iob_intr_1_244:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_244), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb5a489c0  ! 3135: FDIVd	fdivd	%f18, %f0, %f26
	.word 0xbda4c820  ! 3136: FADDs	fadds	%f19, %f0, %f30
cpu_intr_1_250:
	setx	0x34011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_124:
	mov	0x4, %r14
	.word 0xfcf38e80  ! 3140: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_1_251:
	setx	0x360137, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_151:
	mov	0x15, %r14
	.word 0xf8db8e40  ! 3145: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_rd_152:
	mov	0x3c3, %r14
	.word 0xf8db8e40  ! 3146: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_rd_153:
	mov	0x3c5, %r14
	.word 0xf6db8e40  ! 3147: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_245:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_245), 16, 16)) -> intp(1, 0, 21)
cpu_intr_1_252:
	setx	0x340330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba81420  ! 3151: FMOVRNZ	dis not found

	.word 0xbbaa4820  ! 3155: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb5ab0820  ! 3157: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xbf508000  ! 3159: RDPR_TSTATE	<illegal instruction>
iob_intr_1_246:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_246), 16, 16)) -> intp(1, 0, 23)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_wr_125:
	mov	0x3c3, %r14
	.word 0xf0f389e0  ! 3167: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb1a00520  ! 3168: FSQRTs	fsqrt	
T1_asi_reg_wr_126:
	mov	0x3c5, %r14
	.word 0xf6f38e80  ! 3169: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_1_253:
	setx	0x36012a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_247:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_247), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb7a44940  ! 3172: FMULd	fmuld	%f48, %f0, %f58
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_254:
	setx	0x35001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda94820  ! 3185: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xb7a58940  ! 3186: FMULd	fmuld	%f22, %f0, %f58
T1_asi_reg_rd_154:
	mov	0x14, %r14
	.word 0xf0db8e40  ! 3189: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbda00540  ! 3191: FSQRTd	fsqrt	
	.word 0xbfa44920  ! 3194: FMULs	fmuls	%f17, %f0, %f31
	.word 0xb7a00020  ! 3195: FMOVs	fmovs	%f0, %f27
	.word 0xbbab0820  ! 3197: FMOVGU	fmovs	%fcc1, %f0, %f29
iob_intr_1_248:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_248), 16, 16)) -> intp(1, 0, 38)
	.word 0x899561bf  ! 3200: WRPR_TICK_I	wrpr	%r21, 0x01bf, %tick
T1_asi_reg_wr_127:
	mov	0x8, %r14
	.word 0xf0f38e60  ! 3202: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xbea46144  ! 3203: SUBcc_I	subcc 	%r17, 0x0144, %r31
cpu_intr_1_255:
	setx	0x380028, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_155:
	mov	0x3c8, %r14
	.word 0xf6db8e40  ! 3206: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_256:
	setx	0x3a000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aa0820  ! 3209: FMOVA	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_156:
	mov	0x3c6, %r14
	.word 0xf2db8e80  ! 3211: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_1_249:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_249), 16, 16)) -> intp(1, 0, 2f)
iob_intr_1_250:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_250), 16, 16)) -> intp(1, 0, 31)
cpu_intr_1_257:
	setx	0x390202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7abc820  ! 3218: FMOVVC	fmovs	%fcc1, %f0, %f27
cpu_intr_1_258:
	setx	0x3a0238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a589c0  ! 3222: FDIVd	fdivd	%f22, %f0, %f56
cpu_intr_1_259:
	setx	0x380308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa94820  ! 3227: FMOVCS	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_157:
	mov	0x1e, %r14
	.word 0xf0db8400  ! 3228: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_rd_158:
	mov	0x3c7, %r14
	.word 0xfcdb8e60  ! 3230: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbfa80c20  ! 3231: FMOVRLZ	dis not found

	.word 0xbda50840  ! 3232: FADDd	faddd	%f20, %f0, %f30
	.word 0xb9a80820  ! 3236: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_159:
	mov	0x3c5, %r14
	.word 0xf6db8e40  ! 3240: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_251:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_251), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb5a509a0  ! 3242: FDIVs	fdivs	%f20, %f0, %f26
	.word 0xbfa98820  ! 3245: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xbbab0820  ! 3246: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb3643801  ! 3247: MOVcc_I	<illegal instruction>
	.word 0xbda00520  ! 3249: FSQRTs	fsqrt	
iob_intr_1_252:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_252), 16, 16)) -> intp(1, 0, c)
	.word 0xbfa81420  ! 3251: FMOVRNZ	dis not found

T1_asi_reg_rd_160:
	mov	0x37, %r14
	.word 0xf0db89e0  ! 3252: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T1_asi_reg_rd_161:
	mov	0x3c1, %r14
	.word 0xf0db8e60  ! 3255: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb3ab4820  ! 3256: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb1a81420  ! 3258: FMOVRNZ	dis not found

cpu_intr_1_260:
	setx	0x380328, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_128:
	mov	0x2, %r14
	.word 0xf8f389e0  ! 3260: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_1_261:
	setx	0x3b0013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c860  ! 3263: FADDq	dis not found

cpu_intr_1_262:
	setx	0x3a000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a90820  ! 3269: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xbfa80420  ! 3270: FMOVRZ	dis not found

	.word 0xb83da065  ! 3273: XNOR_I	xnor 	%r22, 0x0065, %r28
iob_intr_1_253:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_253), 16, 16)) -> intp(1, 0, 3)
	.word 0xbfa44840  ! 3277: FADDd	faddd	%f48, %f0, %f62
	.word 0xb9a40960  ! 3279: FMULq	dis not found

iob_intr_1_254:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_254), 16, 16)) -> intp(1, 0, 26)
iob_intr_1_255:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_255), 16, 16)) -> intp(1, 0, 31)
	.word 0xbba98820  ! 3288: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xb1a40820  ! 3289: FADDs	fadds	%f16, %f0, %f24
T1_asi_reg_rd_162:
	mov	0xa, %r14
	.word 0xfcdb8e60  ! 3296: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbe154000  ! 3297: OR_R	or 	%r21, %r0, %r31
	.word 0xb01c0000  ! 3299: XOR_R	xor 	%r16, %r0, %r24
iob_intr_1_256:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_256), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_wr_129:
	mov	0x2a, %r14
	.word 0xf4f384a0  ! 3307: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb1a9c820  ! 3308: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xbcc4a158  ! 3309: ADDCcc_I	addccc 	%r18, 0x0158, %r30
cpu_intr_1_263:
	setx	0x38003a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_163:
	mov	0x3c6, %r14
	.word 0xf2db84a0  ! 3312: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_1_257:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_257), 16, 16)) -> intp(1, 0, 1f)
cpu_intr_1_264:
	setx	0x3a0235, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_265:
	setx	0x380132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb80c4000  ! 3318: AND_R	and 	%r17, %r0, %r28
iob_intr_1_258:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_258), 16, 16)) -> intp(1, 0, 20)
	.word 0xbcc44000  ! 3323: ADDCcc_R	addccc 	%r17, %r0, %r30
	.word 0xbf2cc000  ! 3324: SLL_R	sll 	%r19, %r0, %r31
T1_asi_reg_wr_130:
	mov	0x25, %r14
	.word 0xf6f38400  ! 3327: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_1_259:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_259), 16, 16)) -> intp(1, 0, 11)
	.word 0xb5a8c820  ! 3333: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xb9a80820  ! 3336: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb5a548c0  ! 3339: FSUBd	fsubd	%f52, %f0, %f26
iob_intr_1_260:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_260), 16, 16)) -> intp(1, 0, 3f)
T1_asi_reg_rd_164:
	mov	0x2f, %r14
	.word 0xf0db8e40  ! 3347: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_1_266:
	setx	0x3b0332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a88820  ! 3349: FMOVLE	fmovs	%fcc1, %f0, %f24
iob_intr_1_261:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_261), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_267:
	setx	0x380136, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_131:
	mov	0x3c2, %r14
	.word 0xf4f38e60  ! 3352: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xbda549a0  ! 3354: FDIVs	fdivs	%f21, %f0, %f30
cpu_intr_1_268:
	setx	0x38000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa4820  ! 3356: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb3a80820  ! 3357: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb5a448a0  ! 3359: FSUBs	fsubs	%f17, %f0, %f26
T1_asi_reg_wr_132:
	mov	0x3c8, %r14
	.word 0xf8f38e80  ! 3360: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_1_262:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_262), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_wr_133:
	mov	0x2c, %r14
	.word 0xf0f38400  ! 3371: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb9a00560  ! 3372: FSQRTq	fsqrt	
	.word 0xb7643801  ! 3373: MOVcc_I	<illegal instruction>
iob_intr_1_263:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_263), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_wr_134:
	mov	0x3c8, %r14
	.word 0xfaf38400  ! 3378: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb5a5c9c0  ! 3380: FDIVd	fdivd	%f54, %f0, %f26
cpu_intr_1_269:
	setx	0x3a001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a98820  ! 3384: FMOVNEG	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_135:
	mov	0x3c6, %r14
	.word 0xf4f38e80  ! 3385: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T1_asi_reg_wr_136:
	mov	0x29, %r14
	.word 0xfcf38e40  ! 3387: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_1_270:
	setx	0x3a031b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_271:
	setx	0x3b001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a408c0  ! 3390: FSUBd	fsubd	%f16, %f0, %f28
	.word 0xbda48860  ! 3392: FADDq	dis not found

cpu_intr_1_272:
	setx	0x39030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_165:
	mov	0x27, %r14
	.word 0xf2db8400  ! 3397: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T1_asi_reg_rd_166:
	mov	0xb, %r14
	.word 0xfedb89e0  ! 3398: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbda489e0  ! 3399: FDIVq	dis not found

iob_intr_1_264:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_264), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb7a94820  ! 3401: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb5a58840  ! 3402: FADDd	faddd	%f22, %f0, %f26
T1_asi_reg_rd_167:
	mov	0x2f, %r14
	.word 0xfcdb8e40  ! 3406: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb1a50820  ! 3409: FADDs	fadds	%f20, %f0, %f24
	.word 0xb9a5c860  ! 3417: FADDq	dis not found

cpu_intr_1_273:
	setx	0x3a0133, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_137:
	mov	0x2, %r14
	.word 0xfef38400  ! 3419: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb1a44860  ! 3421: FADDq	dis not found

	.word 0xb52d3001  ! 3423: SLLX_I	sllx	%r20, 0x0001, %r26
cpu_intr_1_274:
	setx	0x3a0110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a44860  ! 3428: FADDq	dis not found

	.word 0xbda5c920  ! 3429: FMULs	fmuls	%f23, %f0, %f30
	.word 0xba948000  ! 3431: ORcc_R	orcc 	%r18, %r0, %r29
cpu_intr_1_275:
	setx	0x3a012a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_265:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_265), 16, 16)) -> intp(1, 0, 18)
	.word 0xbfa94820  ! 3436: FMOVCS	fmovs	%fcc1, %f0, %f31
cpu_intr_1_276:
	setx	0x3a0115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00540  ! 3441: FSQRTd	fsqrt	
	.word 0xbba489e0  ! 3442: FDIVq	dis not found

iob_intr_1_266:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_266), 16, 16)) -> intp(1, 0, 37)
T1_asi_reg_rd_168:
	mov	0x3c7, %r14
	.word 0xf2db8e60  ! 3447: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb3a84820  ! 3449: FMOVE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_169:
	mov	0x18, %r14
	.word 0xfadb84a0  ! 3451: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0x9194e1bd  ! 3459: WRPR_PIL_I	wrpr	%r19, 0x01bd, %pil
	.word 0xbda00040  ! 3461: FMOVd	fmovd	%f0, %f30
	.word 0xb3a408a0  ! 3463: FSUBs	fsubs	%f16, %f0, %f25
T1_asi_reg_rd_170:
	mov	0x3c8, %r14
	.word 0xf8db8e60  ! 3468: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_277:
	setx	0x3a0231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a5c8a0  ! 3479: FSUBs	fsubs	%f23, %f0, %f28
	.word 0xbfa90820  ! 3481: FMOVLEU	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_171:
	mov	0x3c1, %r14
	.word 0xf0db84a0  ! 3484: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_267:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_267), 16, 16)) -> intp(1, 0, 11)
T1_asi_reg_wr_138:
	mov	0x3c8, %r14
	.word 0xf4f38e60  ! 3492: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb3a488c0  ! 3494: FSUBd	fsubd	%f18, %f0, %f56
	.word 0xb7ab0820  ! 3496: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xbfa9c820  ! 3504: FMOVVS	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_172:
	mov	0x36, %r14
	.word 0xf8db8e80  ! 3506: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb7aac820  ! 3510: FMOVGE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_278:
	setx	0x3a0303, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_139:
	mov	0x2b, %r14
	.word 0xf2f38400  ! 3513: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_1_268:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_268), 16, 16)) -> intp(1, 0, 23)
cpu_intr_1_279:
	setx	0x3a0311, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_269:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_269), 16, 16)) -> intp(1, 0, 2c)
T1_asi_reg_rd_173:
	mov	0x2d, %r14
	.word 0xf6db84a0  ! 3518: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_280:
	setx	0x380126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa48960  ! 3526: FMULq	dis not found

	.word 0xbba81c20  ! 3529: FMOVRGEZ	dis not found

iob_intr_1_270:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_270), 16, 16)) -> intp(1, 0, 18)
cpu_intr_1_281:
	setx	0x2030e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_282:
	setx	0x380106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53de001  ! 3539: SRA_I	sra 	%r23, 0x0001, %r26
iob_intr_1_271:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_271), 16, 16)) -> intp(1, 0, 15)
iob_intr_1_272:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_272), 16, 16)) -> intp(1, 0, 2b)
iob_intr_1_273:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_273), 16, 16)) -> intp(1, 0, 31)
cpu_intr_1_283:
	setx	0x3a000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba488e0  ! 3555: FSUBq	dis not found

T1_asi_reg_rd_174:
	mov	0x0, %r14
	.word 0xfcdb8e80  ! 3556: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_175:
	mov	0x2c, %r14
	.word 0xf6db89e0  ! 3561: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xbba448e0  ! 3563: FSUBq	dis not found

	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xb4a4617b  ! 3565: SUBcc_I	subcc 	%r17, 0x017b, %r26
cpu_intr_1_284:
	setx	0x39002c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_274:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_274), 16, 16)) -> intp(1, 0, 38)
	.word 0xb1a50940  ! 3569: FMULd	fmuld	%f20, %f0, %f24
cpu_intr_1_285:
	setx	0x3b003c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_176:
	mov	0x37, %r14
	.word 0xf0db84a0  ! 3571: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbfa50820  ! 3572: FADDs	fadds	%f20, %f0, %f31
T1_asi_reg_rd_177:
	mov	0x3c2, %r14
	.word 0xf4db84a0  ! 3573: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T1_asi_reg_rd_178:
	mov	0x29, %r14
	.word 0xfadb8e80  ! 3574: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_1_286:
	setx	0x38030e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_140:
	mov	0x10, %r14
	.word 0xfef389e0  ! 3577: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_1_287:
	setx	0x39021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aa8820  ! 3579: FMOVG	fmovs	%fcc1, %f0, %f28
cpu_intr_1_288:
	setx	0x38000f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_275:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_275), 16, 16)) -> intp(1, 0, 33)
cpu_intr_1_289:
	setx	0x38022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a84820  ! 3586: FMOVE	fmovs	%fcc1, %f0, %f27
iob_intr_1_276:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_276), 16, 16)) -> intp(1, 0, 1b)
cpu_intr_1_290:
	setx	0x3b0332, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_277:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_277), 16, 16)) -> intp(1, 0, 1)
	.word 0xbba50960  ! 3591: FMULq	dis not found

iob_intr_1_278:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_278), 16, 16)) -> intp(1, 0, c)
T1_asi_reg_rd_179:
	mov	0xc, %r14
	.word 0xf4db89e0  ! 3593: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_1_279:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_279), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_rd_180:
	mov	0x7, %r14
	.word 0xfadb8e60  ! 3596: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_1_280:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_280), 16, 16)) -> intp(1, 0, d)
iob_intr_1_281:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_281), 16, 16)) -> intp(1, 0, 11)
	.word 0xbbaa0820  ! 3605: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb92c3001  ! 3606: SLLX_I	sllx	%r16, 0x0001, %r28
	.word 0xb1a8c820  ! 3611: FMOVL	fmovs	%fcc1, %f0, %f24
cpu_intr_1_291:
	setx	0x39030e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_292:
	setx	0x380035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeada092  ! 3620: ANDNcc_I	andncc 	%r22, 0x0092, %r31
	.word 0xb3a94820  ! 3621: FMOVCS	fmovs	%fcc1, %f0, %f25
iob_intr_1_282:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_282), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_283:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_283), 16, 16)) -> intp(1, 0, 1d)
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xb3a5c940  ! 3640: FMULd	fmuld	%f54, %f0, %f56
	.word 0xbda81420  ! 3644: FMOVRNZ	dis not found

T1_asi_reg_rd_181:
	mov	0x8, %r14
	.word 0xfcdb8e80  ! 3646: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T1_asi_reg_rd_182:
	mov	0x3c2, %r14
	.word 0xf4db8e80  ! 3648: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_1_284:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_284), 16, 16)) -> intp(1, 0, 32)
iob_intr_1_285:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_285), 16, 16)) -> intp(1, 0, 39)
	.word 0xbdab8820  ! 3658: FMOVPOS	fmovs	%fcc1, %f0, %f30
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xb7a9c820  ! 3661: FMOVVS	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_141:
	mov	0x12, %r14
	.word 0xf8f38400  ! 3663: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_1_286:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_286), 16, 16)) -> intp(1, 0, 16)
	.word 0xbfa44820  ! 3671: FADDs	fadds	%f17, %f0, %f31
	.word 0xbeb52133  ! 3675: SUBCcc_I	orncc 	%r20, 0x0133, %r31
	.word 0xb5aa8820  ! 3677: FMOVG	fmovs	%fcc1, %f0, %f26
cpu_intr_1_293:
	setx	0x3c032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_294:
	setx	0x3f032b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_287:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_287), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb3a58960  ! 3682: FMULq	dis not found

	.word 0xb494e09d  ! 3684: ORcc_I	orcc 	%r19, 0x009d, %r26
T1_asi_reg_wr_142:
	mov	0x3c2, %r14
	.word 0xf2f389e0  ! 3685: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb5a54940  ! 3687: FMULd	fmuld	%f52, %f0, %f26
	.word 0x8595a131  ! 3688: WRPR_TSTATE_I	wrpr	%r22, 0x0131, %tstate
T1_asi_reg_rd_183:
	mov	0xb, %r14
	.word 0xf2db84a0  ! 3689: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_1_288:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_288), 16, 16)) -> intp(1, 0, 35)
	.word 0xb3a80420  ! 3694: FMOVRZ	dis not found

	.word 0xbb3c6001  ! 3695: SRA_I	sra 	%r17, 0x0001, %r29
iob_intr_1_289:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_289), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb7518000  ! 3702: RDPR_PSTATE	<illegal instruction>
T1_asi_reg_wr_143:
	mov	0x3c6, %r14
	.word 0xfef384a0  ! 3704: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb3a5c940  ! 3705: FMULd	fmuld	%f54, %f0, %f56
cpu_intr_1_295:
	setx	0x3c0012, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_290:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_290), 16, 16)) -> intp(1, 0, 29)
T1_asi_reg_wr_144:
	mov	0x3c5, %r14
	.word 0xfaf389e0  ! 3708: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbfabc820  ! 3709: FMOVVC	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_184:
	mov	0x27, %r14
	.word 0xfedb8e60  ! 3713: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xbfa50960  ! 3715: FMULq	dis not found

	.word 0xb9a90820  ! 3716: FMOVLEU	fmovs	%fcc1, %f0, %f28
cpu_intr_1_296:
	setx	0x3c0100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda50920  ! 3722: FMULs	fmuls	%f20, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xb3a449c0  ! 3730: FDIVd	fdivd	%f48, %f0, %f56
	.word 0xbda48860  ! 3731: FADDq	dis not found

T1_asi_reg_wr_145:
	mov	0x3c1, %r14
	.word 0xf4f389e0  ! 3732: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_1_297:
	setx	0x3d0329, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_291:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_291), 16, 16)) -> intp(1, 0, 1d)
	.word 0xbdaac820  ! 3739: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xbba00560  ! 3740: FSQRTq	fsqrt	
	.word 0xbbaa0820  ! 3743: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb7a48940  ! 3744: FMULd	fmuld	%f18, %f0, %f58
	.word 0xb1a98820  ! 3745: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb7a81c20  ! 3748: FMOVRGEZ	dis not found

	.word 0xbda00020  ! 3754: FMOVs	fmovs	%f0, %f30
T1_asi_reg_rd_185:
	mov	0x28, %r14
	.word 0xfcdb84a0  ! 3755: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T1_asi_reg_wr_146:
	mov	0x31, %r14
	.word 0xf8f38e40  ! 3757: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb9a5c860  ! 3759: FADDq	dis not found

iob_intr_1_292:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_292), 16, 16)) -> intp(1, 0, 38)
T1_asi_reg_rd_186:
	mov	0x1a, %r14
	.word 0xf0db8e60  ! 3766: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb5a00540  ! 3767: FSQRTd	fsqrt	
cpu_intr_1_298:
	setx	0x3f023b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_147:
	mov	0x2e, %r14
	.word 0xf2f389e0  ! 3771: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xba94e0ba  ! 3772: ORcc_I	orcc 	%r19, 0x00ba, %r29
iob_intr_1_293:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_293), 16, 16)) -> intp(1, 0, 33)
	.word 0xb7a9c820  ! 3781: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xbba98820  ! 3782: FMOVNEG	fmovs	%fcc1, %f0, %f29
cpu_intr_1_299:
	setx	0x3c032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00520  ! 3785: FSQRTs	fsqrt	
T1_asi_reg_wr_148:
	mov	0x24, %r14
	.word 0xf2f389e0  ! 3786: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbba81c20  ! 3787: FMOVRGEZ	dis not found

T1_asi_reg_wr_149:
	mov	0x1b, %r14
	.word 0xf8f38e60  ! 3790: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T1_asi_reg_wr_150:
	mov	0x2b, %r14
	.word 0xf6f384a0  ! 3791: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb3aa4820  ! 3797: FMOVNE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_151:
	mov	0x25, %r14
	.word 0xfcf389e0  ! 3799: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xbda00560  ! 3803: FSQRTq	fsqrt	
	.word 0xb7a40840  ! 3806: FADDd	faddd	%f16, %f0, %f58
	.word 0xb3a588a0  ! 3810: FSUBs	fsubs	%f22, %f0, %f25
iob_intr_1_294:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_294), 16, 16)) -> intp(1, 0, 23)
	.word 0xb3a408a0  ! 3813: FSUBs	fsubs	%f16, %f0, %f25
	.word 0xbda54940  ! 3816: FMULd	fmuld	%f52, %f0, %f30
	.word 0xb7a40860  ! 3817: FADDq	dis not found

	.word 0xb3a4c9e0  ! 3820: FDIVq	dis not found

iob_intr_1_295:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_295), 16, 16)) -> intp(1, 0, a)
	.word 0xb5a548c0  ! 3824: FSUBd	fsubd	%f52, %f0, %f26
	.word 0xb28d4000  ! 3826: ANDcc_R	andcc 	%r21, %r0, %r25
cpu_intr_1_300:
	setx	0x3c0228, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_301:
	setx	0x3c003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a44960  ! 3830: FMULq	dis not found

T1_asi_reg_rd_187:
	mov	0x19, %r14
	.word 0xf0db8e40  ! 3832: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb1a5c8e0  ! 3833: FSUBq	dis not found

iob_intr_1_296:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_296), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb3a00520  ! 3837: FSQRTs	fsqrt	
iob_intr_1_297:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_297), 16, 16)) -> intp(1, 0, 1d)
T1_asi_reg_wr_152:
	mov	0x15, %r14
	.word 0xf4f38e60  ! 3844: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T1_asi_reg_rd_188:
	mov	0x21, %r14
	.word 0xf0db8e40  ! 3845: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_rd_189:
	mov	0x1c, %r14
	.word 0xf6db8e60  ! 3847: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_1_298:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_298), 16, 16)) -> intp(1, 0, 5)
T1_asi_reg_rd_190:
	mov	0x36, %r14
	.word 0xfadb8e40  ! 3849: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_rd_191:
	mov	0x1, %r14
	.word 0xf4db8e40  ! 3851: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_rd_192:
	mov	0x6, %r14
	.word 0xf4db8e60  ! 3852: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_1_299:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_299), 16, 16)) -> intp(1, 0, 2e)
cpu_intr_1_302:
	setx	0x3e0032, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_193:
	mov	0x13, %r14
	.word 0xfcdb8e40  ! 3859: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_rd_194:
	mov	0x37, %r14
	.word 0xf0db8e80  ! 3861: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbda00540  ! 3865: FSQRTd	fsqrt	
	.word 0xbf2dd000  ! 3867: SLLX_R	sllx	%r23, %r0, %r31
cpu_intr_1_303:
	setx	0x3e013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8995605b  ! 3870: WRPR_TICK_I	wrpr	%r21, 0x005b, %tick
iob_intr_1_300:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_300), 16, 16)) -> intp(1, 0, 8)
	.word 0xb084600f  ! 3876: ADDcc_I	addcc 	%r17, 0x000f, %r24
	.word 0xb3a88820  ! 3877: FMOVLE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_153:
	mov	0x3c1, %r14
	.word 0xfef38e80  ! 3878: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_1_304:
	setx	0x3c0223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb32c4000  ! 3880: SLL_R	sll 	%r17, %r0, %r25
	.word 0xbfa9c820  ! 3882: FMOVVS	fmovs	%fcc1, %f0, %f31
cpu_intr_1_305:
	setx	0x3d021e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_195:
	mov	0x1d, %r14
	.word 0xf4db8400  ! 3890: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb43c20aa  ! 3891: XNOR_I	xnor 	%r16, 0x00aa, %r26
iob_intr_1_301:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_301), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_rd_196:
	mov	0x1f, %r14
	.word 0xf8db8e40  ! 3896: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb5a00040  ! 3899: FMOVd	fmovd	%f0, %f26
iob_intr_1_302:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_302), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_303:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_303), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_wr_154:
	mov	0xf, %r14
	.word 0xf0f389e0  ! 3908: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_1_306:
	setx	0x3c0309, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_307:
	setx	0x3f022b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_304:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_304), 16, 16)) -> intp(1, 0, 11)
cpu_intr_1_308:
	setx	0x3f0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb92c8000  ! 3921: SLL_R	sll 	%r18, %r0, %r28
cpu_intr_1_309:
	setx	0x3c0128, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_305:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_305), 16, 16)) -> intp(1, 0, 1a)
iob_intr_1_306:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_306), 16, 16)) -> intp(1, 0, 20)
	.word 0xb6842076  ! 3927: ADDcc_I	addcc 	%r16, 0x0076, %r27
T1_asi_reg_rd_197:
	mov	0x13, %r14
	.word 0xf6db89e0  ! 3928: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_1_310:
	setx	0x3c030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb62c2118  ! 3931: ANDN_I	andn 	%r16, 0x0118, %r27
	.word 0xb1aa8820  ! 3935: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb1a588c0  ! 3936: FSUBd	fsubd	%f22, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_155:
	mov	0x3c1, %r14
	.word 0xfaf38e80  ! 3940: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_1_311:
	setx	0x3c012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_198:
	mov	0x37, %r14
	.word 0xf0db8e40  ! 3943: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_307:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_307), 16, 16)) -> intp(1, 0, 10)
	.word 0xb9a98820  ! 3950: FMOVNEG	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_156:
	mov	0x18, %r14
	.word 0xfef38e40  ! 3951: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_308:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_308), 16, 16)) -> intp(1, 0, 32)
T1_asi_reg_rd_199:
	mov	0x34, %r14
	.word 0xfadb89e0  ! 3957: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb6842028  ! 3962: ADDcc_I	addcc 	%r16, 0x0028, %r27
iob_intr_1_309:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_309), 16, 16)) -> intp(1, 0, 29)
	.word 0xbfaa0820  ! 3966: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xbfa00520  ! 3967: FSQRTs	fsqrt	
	.word 0xb9aa8820  ! 3968: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xb9a40840  ! 3969: FADDd	faddd	%f16, %f0, %f28
T1_asi_reg_rd_200:
	mov	0x3c0, %r14
	.word 0xf4db84a0  ! 3970: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb7a94820  ! 3972: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb3a489c0  ! 3974: FDIVd	fdivd	%f18, %f0, %f56
iob_intr_1_310:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_310), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_wr_157:
	mov	0x20, %r14
	.word 0xf0f38e60  ! 3982: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xbd3d0000  ! 3983: SRA_R	sra 	%r20, %r0, %r30
	.word 0xb5a80820  ! 3984: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
cpu_intr_1_312:
	setx	0x3e0121, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_311:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_311), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb5a5c8e0  ! 3990: FSUBq	dis not found

cpu_intr_1_313:
	setx	0x3f013a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_314:
	setx	0x3f0319, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_201:
	mov	0x3c1, %r14
	.word 0xfcdb8e60  ! 3995: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_1_312:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_312), 16, 16)) -> intp(1, 0, 4)
cpu_intr_1_315:
	setx	0x3c0319, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_313:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_313), 16, 16)) -> intp(1, 0, 29)
	.word 0xbbaa8820  ! 4003: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb5a4c940  ! 4005: FMULd	fmuld	%f50, %f0, %f26
cpu_intr_1_316:
	setx	0x3f0138, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_317:
	setx	0x3f0229, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_314:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_314), 16, 16)) -> intp(1, 0, 24)
	.word 0xba842122  ! 4016: ADDcc_I	addcc 	%r16, 0x0122, %r29
	.word 0xb1a54920  ! 4020: FMULs	fmuls	%f21, %f0, %f24
	.word 0xb9a98820  ! 4021: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xb1a88820  ! 4022: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xba854000  ! 4024: ADDcc_R	addcc 	%r21, %r0, %r29
cpu_intr_1_318:
	setx	0x3c0208, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_202:
	mov	0x29, %r14
	.word 0xfcdb8e40  ! 4028: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_319:
	setx	0x3f0232, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_320:
	setx	0x3f0312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a5c820  ! 4041: FADDs	fadds	%f23, %f0, %f28
	.word 0xb7a48820  ! 4042: FADDs	fadds	%f18, %f0, %f27
iob_intr_1_315:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_315), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_321:
	setx	0x3d011e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_316:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_316), 16, 16)) -> intp(1, 0, 1d)
	lda	[%r23 + %g0] 0xf0, %f2
	.word 0xbba80820  ! 4048: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xb1a489a0  ! 4052: FDIVs	fdivs	%f18, %f0, %f24
T1_asi_reg_wr_158:
	mov	0x0, %r14
	.word 0xfef384a0  ! 4053: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb9a00540  ! 4054: FSQRTd	fsqrt	
	.word 0xb9a9c820  ! 4056: FMOVVS	fmovs	%fcc1, %f0, %f28
cpu_intr_1_322:
	setx	0x3e011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a448c0  ! 4062: FSUBd	fsubd	%f48, %f0, %f24
cpu_intr_1_323:
	setx	0x3d012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfab4820  ! 4066: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb2a48000  ! 4068: SUBcc_R	subcc 	%r18, %r0, %r25
cpu_intr_1_324:
	setx	0x3c030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a54840  ! 4070: FADDd	faddd	%f52, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_317:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_317), 16, 16)) -> intp(1, 0, 14)
	.word 0xb9a81820  ! 4074: FMOVRGZ	fmovs	%fcc3, %f0, %f28
cpu_intr_1_325:
	setx	0x3f011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80420  ! 4085: FMOVRZ	dis not found

cpu_intr_1_326:
	setx	0x3d0307, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_159:
	mov	0x2b, %r14
	.word 0xf8f38e40  ! 4090: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb7a90820  ! 4094: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xbfa90820  ! 4095: FMOVLEU	fmovs	%fcc1, %f0, %f31
iob_intr_1_318:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_318), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb9a98820  ! 4101: FMOVNEG	fmovs	%fcc1, %f0, %f28
cpu_intr_1_327:
	setx	0x3f0010, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_319:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_319), 16, 16)) -> intp(1, 0, 21)
iob_intr_1_320:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_320), 16, 16)) -> intp(1, 0, 39)
	.word 0xbda508c0  ! 4108: FSUBd	fsubd	%f20, %f0, %f30
iob_intr_1_321:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_321), 16, 16)) -> intp(1, 0, 15)
cpu_intr_1_328:
	setx	0x3d0316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbabc0000  ! 4111: XNORcc_R	xnorcc 	%r16, %r0, %r29
	.word 0xbfab4820  ! 4113: FMOVCC	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_203:
	mov	0x3c3, %r14
	.word 0xfadb8e80  ! 4119: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_1_329:
	setx	0x3d001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a58960  ! 4122: FMULq	dis not found

cpu_intr_1_330:
	setx	0x3c002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00560  ! 4126: FSQRTq	fsqrt	
	.word 0xbdaa8820  ! 4127: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb3a489e0  ! 4128: FDIVq	dis not found

iob_intr_1_322:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_322), 16, 16)) -> intp(1, 0, 9)
	.word 0xbfa40960  ! 4133: FMULq	dis not found

T1_asi_reg_rd_204:
	mov	0x26, %r14
	.word 0xf8db8e40  ! 4134: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb5a81420  ! 4137: FMOVRNZ	dis not found

	.word 0xb1a81c20  ! 4140: FMOVRGEZ	dis not found

cpu_intr_1_331:
	setx	0x400339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00560  ! 4147: FSQRTq	fsqrt	
cpu_intr_1_332:
	setx	0x41022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab8820  ! 4152: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb1a588c0  ! 4153: FSUBd	fsubd	%f22, %f0, %f24
iob_intr_1_323:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_323), 16, 16)) -> intp(1, 0, 3)
	.word 0xbba90820  ! 4157: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xbc940000  ! 4160: ORcc_R	orcc 	%r16, %r0, %r30
cpu_intr_1_333:
	setx	0x430106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a508a0  ! 4164: FSUBs	fsubs	%f20, %f0, %f24
cpu_intr_1_334:
	setx	0x430204, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_205:
	mov	0x3c7, %r14
	.word 0xf6db84a0  ! 4168: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbba94820  ! 4169: FMOVCS	fmovs	%fcc1, %f0, %f29
cpu_intr_1_335:
	setx	0x430228, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbf350000  ! 4177: SRL_R	srl 	%r20, %r0, %r31
	.word 0xb1aac820  ! 4183: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb3a00560  ! 4184: FSQRTq	fsqrt	
T1_asi_reg_wr_160:
	mov	0x28, %r14
	.word 0xfcf38e60  ! 4185: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbba98820  ! 4186: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xb1a548a0  ! 4188: FSUBs	fsubs	%f21, %f0, %f24
	.word 0xbc3460b7  ! 4193: SUBC_I	orn 	%r17, 0x00b7, %r30
cpu_intr_1_336:
	setx	0x430312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba4c8c0  ! 4197: FSUBd	fsubd	%f50, %f0, %f60
	lda	[%r17 + %g0] 0xf0, %f2
iob_intr_1_324:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_324), 16, 16)) -> intp(1, 0, 3a)
	.word 0xbba00560  ! 4203: FSQRTq	fsqrt	
cpu_intr_1_337:
	setx	0x43000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00520  ! 4207: FSQRTs	fsqrt	
	.word 0xbba00540  ! 4208: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9641800  ! 4211: MOVcc_R	<illegal instruction>
	.word 0xb7a588c0  ! 4212: FSUBd	fsubd	%f22, %f0, %f58
	.word 0xb1aa0820  ! 4214: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb3a90820  ! 4215: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xb5a54960  ! 4216: FMULq	dis not found

cpu_intr_1_338:
	setx	0x43011b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_325:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_325), 16, 16)) -> intp(1, 0, 15)
iob_intr_1_326:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_326), 16, 16)) -> intp(1, 0, 3)
	.word 0xb9a88820  ! 4222: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xb8adc000  ! 4226: ANDNcc_R	andncc 	%r23, %r0, %r28
	.word 0xb62ca1e3  ! 4230: ANDN_I	andn 	%r18, 0x01e3, %r27
cpu_intr_1_339:
	setx	0x42033b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_206:
	mov	0x3c5, %r14
	.word 0xf8db8e60  ! 4237: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xbba00540  ! 4238: FSQRTd	fsqrt	
	.word 0xbfaa0820  ! 4239: FMOVA	fmovs	%fcc1, %f0, %f31
cpu_intr_1_340:
	setx	0x410231, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_327:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_327), 16, 16)) -> intp(1, 0, 14)
T1_asi_reg_rd_207:
	mov	0x20, %r14
	.word 0xf6db84a0  ! 4244: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_1_328:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_328), 16, 16)) -> intp(1, 0, 1d)
T1_asi_reg_rd_208:
	mov	0x2c, %r14
	.word 0xfadb8400  ! 4252: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbfa40860  ! 4257: FADDq	dis not found

T1_asi_reg_wr_161:
	mov	0x25, %r14
	.word 0xfaf389e0  ! 4258: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T1_asi_reg_rd_209:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 4260: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbba5c940  ! 4266: FMULd	fmuld	%f54, %f0, %f60
	.word 0xbb510000  ! 4270: RDPR_TICK	<illegal instruction>
cpu_intr_1_341:
	setx	0x410320, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_329:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_329), 16, 16)) -> intp(1, 0, 28)
T1_asi_reg_wr_162:
	mov	0x3c1, %r14
	.word 0xf8f38400  ! 4274: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb9a588e0  ! 4275: FSUBq	dis not found

cpu_intr_1_342:
	setx	0x430033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a40960  ! 4277: FMULq	dis not found

T1_asi_reg_rd_210:
	mov	0xe, %r14
	.word 0xf8db8e80  ! 4278: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb9a40860  ! 4280: FADDq	dis not found

	.word 0xb1a408c0  ! 4289: FSUBd	fsubd	%f16, %f0, %f24
cpu_intr_1_343:
	setx	0x420118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeb40000  ! 4293: ORNcc_R	orncc 	%r16, %r0, %r31
	.word 0xb9a40920  ! 4296: FMULs	fmuls	%f16, %f0, %f28
	.word 0xb1a00540  ! 4297: FSQRTd	fsqrt	
T1_asi_reg_rd_211:
	mov	0x21, %r14
	.word 0xf0db8e60  ! 4299: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbe0c0000  ! 4306: AND_R	and 	%r16, %r0, %r31
iob_intr_1_330:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_330), 16, 16)) -> intp(1, 0, 23)
	.word 0xb9a48860  ! 4313: FADDq	dis not found

cpu_intr_1_344:
	setx	0x410222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba344000  ! 4319: SUBC_R	orn 	%r17, %r0, %r29
T1_asi_reg_wr_163:
	mov	0x2b, %r14
	.word 0xf2f38e40  ! 4320: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb5a80820  ! 4321: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_164:
	mov	0x3c8, %r14
	.word 0xfaf38e40  ! 4322: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb3a4c940  ! 4323: FMULd	fmuld	%f50, %f0, %f56
cpu_intr_1_345:
	setx	0x400020, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_346:
	setx	0x430100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa5c9e0  ! 4328: FDIVq	dis not found

	.word 0xb4bc4000  ! 4329: XNORcc_R	xnorcc 	%r17, %r0, %r26
	.word 0xbba00020  ! 4334: FMOVs	fmovs	%f0, %f29
cpu_intr_1_347:
	setx	0x420334, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_212:
	mov	0x21, %r14
	.word 0xfedb8e60  ! 4340: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xbda588e0  ! 4342: FSUBq	dis not found

	.word 0xb9a8c820  ! 4343: FMOVL	fmovs	%fcc1, %f0, %f28
cpu_intr_1_348:
	setx	0x410126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda409a0  ! 4345: FDIVs	fdivs	%f16, %f0, %f30
cpu_intr_1_349:
	setx	0x420311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80420  ! 4348: FMOVRZ	dis not found

	.word 0xbda58960  ! 4349: FMULq	dis not found

cpu_intr_1_350:
	setx	0x40001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_165:
	mov	0x3c5, %r14
	.word 0xf8f384a0  ! 4353: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_1_331:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_331), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_332:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_332), 16, 16)) -> intp(1, 0, 23)
	.word 0xbda549a0  ! 4357: FDIVs	fdivs	%f21, %f0, %f30
	.word 0xb7a00560  ! 4359: FSQRTq	fsqrt	
iob_intr_1_333:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_333), 16, 16)) -> intp(1, 0, a)
iob_intr_1_334:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_334), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb9a00560  ! 4369: FSQRTq	fsqrt	
	.word 0xb9a489a0  ! 4375: FDIVs	fdivs	%f18, %f0, %f28
cpu_intr_1_351:
	setx	0x430302, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_335:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_335), 16, 16)) -> intp(1, 0, 5)
	.word 0xb5a00520  ! 4379: FSQRTs	fsqrt	
iob_intr_1_336:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_336), 16, 16)) -> intp(1, 0, 27)
cpu_intr_1_352:
	setx	0x410306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a449e0  ! 4388: FDIVq	dis not found

T1_asi_reg_rd_213:
	mov	0x3c3, %r14
	.word 0xfadb8e80  ! 4390: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_1_337:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_337), 16, 16)) -> intp(1, 0, 1)
	.word 0xb9a548a0  ! 4392: FSUBs	fsubs	%f21, %f0, %f28
iob_intr_1_338:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_338), 16, 16)) -> intp(1, 0, 35)
	.word 0xbba00020  ! 4397: FMOVs	fmovs	%f0, %f29
	.word 0xb3641800  ! 4398: MOVcc_R	<illegal instruction>
iob_intr_1_339:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_339), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb7a98820  ! 4402: FMOVNEG	fmovs	%fcc1, %f0, %f27
cpu_intr_1_353:
	setx	0x42031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a81c20  ! 4411: FMOVRGEZ	dis not found

iob_intr_1_340:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_340), 16, 16)) -> intp(1, 0, 3c)
	.word 0xbfa5c820  ! 4415: FADDs	fadds	%f23, %f0, %f31
cpu_intr_1_354:
	setx	0x410017, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_166:
	mov	0x3c2, %r14
	.word 0xf4f389e0  ! 4419: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_341:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_341), 16, 16)) -> intp(1, 0, 28)
	.word 0xb02d8000  ! 4428: ANDN_R	andn 	%r22, %r0, %r24
T1_asi_reg_wr_167:
	mov	0x29, %r14
	.word 0xf4f389e0  ! 4429: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbfa84820  ! 4439: FMOVE	fmovs	%fcc1, %f0, %f31
iob_intr_1_342:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_342), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_wr_168:
	mov	0x15, %r14
	.word 0xf2f38400  ! 4443: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_1_343:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_343), 16, 16)) -> intp(1, 0, e)
cpu_intr_1_355:
	setx	0x410132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a408e0  ! 4449: FSUBq	dis not found

T1_asi_reg_rd_214:
	mov	0x3c4, %r14
	.word 0xf6db8e60  ! 4452: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	lda	[%r21 + %g0] 0xf0, %f2
T1_asi_reg_rd_215:
	mov	0x2d, %r14
	.word 0xf8db8400  ! 4455: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_1_356:
	setx	0x410022, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_169:
	mov	0x1b, %r14
	.word 0xf8f38e40  ! 4460: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_1_344:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_344), 16, 16)) -> intp(1, 0, 2)
cpu_intr_1_357:
	setx	0x40031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a508e0  ! 4466: FSUBq	dis not found

	.word 0xbba58940  ! 4467: FMULd	fmuld	%f22, %f0, %f60
T1_asi_reg_rd_216:
	mov	0x32, %r14
	.word 0xf8db84a0  ! 4469: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_1_345:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_345), 16, 16)) -> intp(1, 0, 30)
	.word 0xbda5c8a0  ! 4476: FSUBs	fsubs	%f23, %f0, %f30
	.word 0xbba94820  ! 4477: FMOVCS	fmovs	%fcc1, %f0, %f29
iob_intr_1_346:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_346), 16, 16)) -> intp(1, 0, 3f)
iob_intr_1_347:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_347), 16, 16)) -> intp(1, 0, 1f)
cpu_intr_1_358:
	setx	0x400023, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_348:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_348), 16, 16)) -> intp(1, 0, 3)
T1_asi_reg_wr_170:
	mov	0x3c3, %r14
	.word 0xfcf389e0  ! 4489: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_1_349:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_349), 16, 16)) -> intp(1, 0, 18)
	.word 0xb1a00020  ! 4491: FMOVs	fmovs	%f0, %f24
iob_intr_1_350:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_350), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb3aac820  ! 4497: FMOVGE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_217:
	mov	0x2e, %r14
	.word 0xf2db8e40  ! 4498: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbfab4820  ! 4504: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb1351000  ! 4505: SRLX_R	srlx	%r20, %r0, %r24
T1_asi_reg_wr_171:
	mov	0x32, %r14
	.word 0xf0f38e60  ! 4511: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T1_asi_reg_wr_172:
	mov	0x16, %r14
	.word 0xf8f389e0  ! 4512: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T1_asi_reg_wr_173:
	mov	0x13, %r14
	.word 0xf0f38e40  ! 4514: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_rd_218:
	mov	0x20, %r14
	.word 0xf8db8400  ! 4515: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb7aac820  ! 4516: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb7abc820  ! 4519: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb9a54840  ! 4521: FADDd	faddd	%f52, %f0, %f28
cpu_intr_1_359:
	setx	0x43021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00040  ! 4530: FMOVd	fmovd	%f0, %f62
iob_intr_1_351:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_351), 16, 16)) -> intp(1, 0, 21)
iob_intr_1_352:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_352), 16, 16)) -> intp(1, 0, 10)
T1_asi_reg_wr_174:
	mov	0x2, %r14
	.word 0xfcf38400  ! 4540: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbda00520  ! 4547: FSQRTs	fsqrt	
T1_asi_reg_rd_219:
	mov	0x26, %r14
	.word 0xf6db8e80  ! 4550: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb5a54820  ! 4552: FADDs	fadds	%f21, %f0, %f26
cpu_intr_1_360:
	setx	0x42033c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_361:
	setx	0x42021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80820  ! 4555: FMOVN	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_175:
	mov	0x26, %r14
	.word 0xf6f38400  ! 4556: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb3a00560  ! 4557: FSQRTq	fsqrt	
T1_asi_reg_wr_176:
	mov	0x3c6, %r14
	.word 0xf2f38e60  ! 4559: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_1_362:
	setx	0x420115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c860  ! 4561: FADDq	dis not found

	.word 0xb5a00020  ! 4562: FMOVs	fmovs	%f0, %f26
	.word 0xb57c6401  ! 4565: MOVR_I	movre	%r17, 0x1, %r26
	.word 0xbba508e0  ! 4566: FSUBq	dis not found

T1_asi_reg_rd_220:
	mov	0x3c5, %r14
	.word 0xf8db84a0  ! 4567: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb1aac820  ! 4568: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb43d8000  ! 4569: XNOR_R	xnor 	%r22, %r0, %r26
T1_asi_reg_wr_177:
	mov	0x37, %r14
	.word 0xfcf389e0  ! 4571: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T1_asi_reg_rd_221:
	mov	0x33, %r14
	.word 0xfcdb8e40  ! 4572: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_353:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_353), 16, 16)) -> intp(1, 0, b)
	.word 0xb2840000  ! 4579: ADDcc_R	addcc 	%r16, %r0, %r25
cpu_intr_1_363:
	setx	0x400023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb42d61f4  ! 4582: ANDN_I	andn 	%r21, 0x01f4, %r26
iob_intr_1_354:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_354), 16, 16)) -> intp(1, 0, 31)
	.word 0xb004a1d7  ! 4586: ADD_I	add 	%r18, 0x01d7, %r24
	.word 0xb3a00020  ! 4592: FMOVs	fmovs	%f0, %f25
	.word 0xb5a40860  ! 4593: FADDq	dis not found

iob_intr_1_355:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_355), 16, 16)) -> intp(1, 0, 23)
T1_asi_reg_wr_178:
	mov	0xc, %r14
	.word 0xf4f38e40  ! 4596: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_356:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_356), 16, 16)) -> intp(1, 0, 38)
iob_intr_1_357:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_357), 16, 16)) -> intp(1, 0, 13)
	.word 0xbab5e0c8  ! 4601: ORNcc_I	orncc 	%r23, 0x00c8, %r29
cpu_intr_1_364:
	setx	0x430329, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_365:
	setx	0x430321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c9c0  ! 4606: FDIVd	fdivd	%f50, %f0, %f58
T1_asi_reg_rd_222:
	mov	0x27, %r14
	.word 0xfcdb8e40  ! 4607: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_366:
	setx	0x460321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00560  ! 4609: FSQRTq	fsqrt	
	.word 0xb7a81420  ! 4610: FMOVRNZ	dis not found

	.word 0xbda81820  ! 4614: FMOVRGZ	fmovs	%fcc3, %f0, %f30
T1_asi_reg_rd_223:
	mov	0x0, %r14
	.word 0xf0db8e60  ! 4616: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbf7d4400  ! 4617: MOVR_R	movre	%r21, %r0, %r31
iob_intr_1_358:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_358), 16, 16)) -> intp(1, 0, 15)
	.word 0xba14e047  ! 4619: OR_I	or 	%r19, 0x0047, %r29
cpu_intr_1_367:
	setx	0x44033d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_179:
	mov	0x3c8, %r14
	.word 0xfef38e80  ! 4622: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T1_asi_reg_rd_224:
	mov	0x1e, %r14
	.word 0xf8db8e40  ! 4623: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_1_359:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_359), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb3a448a0  ! 4627: FSUBs	fsubs	%f17, %f0, %f25
	.word 0xb73dd000  ! 4628: SRAX_R	srax	%r23, %r0, %r27
	.word 0xb8044000  ! 4629: ADD_R	add 	%r17, %r0, %r28
	.word 0xb1a409e0  ! 4630: FDIVq	dis not found

	.word 0xbda88820  ! 4631: FMOVLE	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_180:
	mov	0x3c5, %r14
	.word 0xfef38400  ! 4633: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb2bda161  ! 4636: XNORcc_I	xnorcc 	%r22, 0x0161, %r25
	.word 0xbda9c820  ! 4637: FMOVVS	fmovs	%fcc1, %f0, %f30
cpu_intr_1_368:
	setx	0x45000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a54860  ! 4647: FADDq	dis not found

	.word 0xb7a58840  ! 4650: FADDd	faddd	%f22, %f0, %f58
	.word 0xbba00020  ! 4652: FMOVs	fmovs	%f0, %f29
cpu_intr_1_369:
	setx	0x460018, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_181:
	mov	0x3c6, %r14
	.word 0xf6f38e40  ! 4660: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_360:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_360), 16, 16)) -> intp(1, 0, 16)
cpu_intr_1_370:
	setx	0x460333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00520  ! 4664: FSQRTs	fsqrt	
T1_asi_reg_wr_182:
	mov	0x3c5, %r14
	.word 0xfaf384a0  ! 4665: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T1_asi_reg_rd_225:
	mov	0x16, %r14
	.word 0xf8db8400  ! 4666: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb3ab4820  ! 4667: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb3a44920  ! 4672: FMULs	fmuls	%f17, %f0, %f25
T1_asi_reg_rd_226:
	mov	0x31, %r14
	.word 0xfcdb8e60  ! 4673: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_1_361:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_361), 16, 16)) -> intp(1, 0, 1f)
cpu_intr_1_371:
	setx	0x450120, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_227:
	mov	0x37, %r14
	.word 0xfadb8e40  ! 4683: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_362:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_362), 16, 16)) -> intp(1, 0, 30)
cpu_intr_1_372:
	setx	0x46020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5aa0820  ! 4691: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xba2ce187  ! 4695: ANDN_I	andn 	%r19, 0x0187, %r29
cpu_intr_1_373:
	setx	0x440035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4c5a16e  ! 4699: ADDCcc_I	addccc 	%r22, 0x016e, %r26
	.word 0xbaadc000  ! 4700: ANDNcc_R	andncc 	%r23, %r0, %r29
	.word 0xb57d4400  ! 4701: MOVR_R	movre	%r21, %r0, %r26
	.word 0xbba589c0  ! 4702: FDIVd	fdivd	%f22, %f0, %f60
T1_asi_reg_rd_228:
	mov	0x1, %r14
	.word 0xf2db84a0  ! 4706: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbc958000  ! 4715: ORcc_R	orcc 	%r22, %r0, %r30
	.word 0xb3a88820  ! 4716: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xbda54920  ! 4717: FMULs	fmuls	%f21, %f0, %f30
	.word 0xb3a409c0  ! 4718: FDIVd	fdivd	%f16, %f0, %f56
	.word 0xb014c000  ! 4719: OR_R	or 	%r19, %r0, %r24
T1_asi_reg_rd_229:
	mov	0x1b, %r14
	.word 0xfadb89e0  ! 4720: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T1_asi_reg_wr_183:
	mov	0x3c4, %r14
	.word 0xfcf38400  ! 4723: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xbfa589e0  ! 4725: FDIVq	dis not found

	.word 0xbfa50960  ! 4729: FMULq	dis not found

cpu_intr_1_374:
	setx	0x47030f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_375:
	setx	0x46032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80420  ! 4733: FMOVRZ	dis not found

	.word 0xbda94820  ! 4743: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xbfaac820  ! 4748: FMOVGE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_184:
	mov	0x3c1, %r14
	.word 0xf0f384a0  ! 4752: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_1_363:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_363), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb5a00520  ! 4754: FSQRTs	fsqrt	
iob_intr_1_364:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_364), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb3a80c20  ! 4756: FMOVRLZ	dis not found

	.word 0xb1a448a0  ! 4757: FSUBs	fsubs	%f17, %f0, %f24
	.word 0xb1a00560  ! 4758: FSQRTq	fsqrt	
T1_asi_reg_wr_185:
	mov	0x3, %r14
	.word 0xf2f38e40  ! 4761: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb6a4e08e  ! 4765: SUBcc_I	subcc 	%r19, 0x008e, %r27
T1_asi_reg_wr_186:
	mov	0x6, %r14
	.word 0xf2f389e0  ! 4766: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb4ac8000  ! 4769: ANDNcc_R	andncc 	%r18, %r0, %r26
	.word 0xb1aac820  ! 4772: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xbda54920  ! 4774: FMULs	fmuls	%f21, %f0, %f30
T1_asi_reg_rd_230:
	mov	0x22, %r14
	.word 0xf0db89e0  ! 4775: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_1_376:
	setx	0x47011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c9a0  ! 4778: FDIVs	fdivs	%f19, %f0, %f25
	.word 0xb1a5c840  ! 4779: FADDd	faddd	%f54, %f0, %f24
	.word 0xb9a509e0  ! 4781: FDIVq	dis not found

iob_intr_1_365:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_365), 16, 16)) -> intp(1, 0, e)
T1_asi_reg_wr_187:
	mov	0x6, %r14
	.word 0xf0f38400  ! 4787: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_1_377:
	setx	0x450005, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_188:
	mov	0xf, %r14
	.word 0xf6f38400  ! 4789: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T1_asi_reg_rd_231:
	mov	0x26, %r14
	.word 0xf4db84a0  ! 4790: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb7ab4820  ! 4791: FMOVCC	fmovs	%fcc1, %f0, %f27
cpu_intr_1_378:
	setx	0x470219, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_366:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_366), 16, 16)) -> intp(1, 0, 1a)
cpu_intr_1_379:
	setx	0x460332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8944000  ! 4797: ORcc_R	orcc 	%r17, %r0, %r28
iob_intr_1_367:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_367), 16, 16)) -> intp(1, 0, 38)
iob_intr_1_368:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_368), 16, 16)) -> intp(1, 0, 5)
T1_asi_reg_rd_232:
	mov	0x1, %r14
	.word 0xfcdb8e40  ! 4810: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb295e080  ! 4812: ORcc_I	orcc 	%r23, 0x0080, %r25
iob_intr_1_369:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_369), 16, 16)) -> intp(1, 0, 5)
	.word 0xb7a80820  ! 4814: FMOVN	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_189:
	mov	0x1e, %r14
	.word 0xfaf384a0  ! 4815: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb3a80820  ! 4816: FMOVN	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb93dd000  ! 4824: SRAX_R	srax	%r23, %r0, %r28
T1_asi_reg_wr_190:
	mov	0x23, %r14
	.word 0xfaf38e60  ! 4825: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_1_370:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_370), 16, 16)) -> intp(1, 0, 3a)
iob_intr_1_371:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_371), 16, 16)) -> intp(1, 0, 22)
T1_asi_reg_rd_233:
	mov	0x30, %r14
	.word 0xf0db8400  ! 4831: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_1_372:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_372), 16, 16)) -> intp(1, 0, 3c)
	.word 0xbba5c8c0  ! 4833: FSUBd	fsubd	%f54, %f0, %f60
	.word 0xb2bd4000  ! 4839: XNORcc_R	xnorcc 	%r21, %r0, %r25
	.word 0xbfa5c8a0  ! 4841: FSUBs	fsubs	%f23, %f0, %f31
iob_intr_1_373:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_373), 16, 16)) -> intp(1, 0, 24)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_234:
	mov	0x3c2, %r14
	.word 0xf6db8e80  ! 4855: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb52c7001  ! 4859: SLLX_I	sllx	%r17, 0x0001, %r26
iob_intr_1_374:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_374), 16, 16)) -> intp(1, 0, d)
	.word 0xb7353001  ! 4864: SRLX_I	srlx	%r20, 0x0001, %r27
iob_intr_1_375:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_375), 16, 16)) -> intp(1, 0, 7)
cpu_intr_1_380:
	setx	0x450200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00560  ! 4872: FSQRTq	fsqrt	
iob_intr_1_376:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_376), 16, 16)) -> intp(1, 0, a)
	.word 0xbbaac820  ! 4876: FMOVGE	fmovs	%fcc1, %f0, %f29
iob_intr_1_377:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_377), 16, 16)) -> intp(1, 0, 0)
	.word 0xbda00040  ! 4883: FMOVd	fmovd	%f0, %f30
	.word 0xb7a5c9e0  ! 4884: FDIVq	dis not found

T1_asi_reg_rd_235:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 4886: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbd35b001  ! 4890: SRLX_I	srlx	%r22, 0x0001, %r30
iob_intr_1_378:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_378), 16, 16)) -> intp(1, 0, d)
	.word 0xb83d0000  ! 4892: XNOR_R	xnor 	%r20, %r0, %r28
	.word 0xb7a48940  ! 4897: FMULd	fmuld	%f18, %f0, %f58
	.word 0xbfa588e0  ! 4899: FSUBq	dis not found

cpu_intr_1_381:
	setx	0x470136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda8c820  ! 4903: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xbba409a0  ! 4908: FDIVs	fdivs	%f16, %f0, %f29
	.word 0xb1a00520  ! 4914: FSQRTs	fsqrt	
	.word 0xbc3d60c4  ! 4915: XNOR_I	xnor 	%r21, 0x00c4, %r30
cpu_intr_1_382:
	setx	0x47003b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_379:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_379), 16, 16)) -> intp(1, 0, 7)
iob_intr_1_380:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_380), 16, 16)) -> intp(1, 0, 1c)
	.word 0xbfa508e0  ! 4922: FSUBq	dis not found

	.word 0xb9a549e0  ! 4925: FDIVq	dis not found

	.word 0xbba84820  ! 4927: FMOVE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_191:
	mov	0x11, %r14
	.word 0xf0f389e0  ! 4928: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_1_381:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_381), 16, 16)) -> intp(1, 0, 38)
	.word 0xb3a409e0  ! 4931: FDIVq	dis not found

cpu_intr_1_383:
	setx	0x450203, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_384:
	setx	0x47033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa94820  ! 4937: FMOVCS	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_236:
	mov	0x27, %r14
	.word 0xf6db8e60  ! 4938: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb5a40960  ! 4940: FMULq	dis not found

T1_asi_reg_wr_192:
	mov	0x1, %r14
	.word 0xf6f389e0  ! 4941: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_1_385:
	setx	0x45020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_382:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_382), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_wr_193:
	mov	0x11, %r14
	.word 0xf2f38e40  ! 4947: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_1_383:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_383), 16, 16)) -> intp(1, 0, 38)
T1_asi_reg_wr_194:
	mov	0x3c8, %r14
	.word 0xf6f389e0  ! 4952: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb1ab4820  ! 4954: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xbda4c940  ! 4956: FMULd	fmuld	%f50, %f0, %f30
	.word 0xb9a98820  ! 4957: FMOVNEG	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_237:
	mov	0x32, %r14
	.word 0xf2db89e0  ! 4959: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T1_asi_reg_wr_195:
	mov	0x3c2, %r14
	.word 0xf6f384a0  ! 4961: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb4848000  ! 4962: ADDcc_R	addcc 	%r18, %r0, %r26
T1_asi_reg_rd_238:
	mov	0x3c3, %r14
	.word 0xfedb8e40  ! 4964: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb1a589a0  ! 4965: FDIVs	fdivs	%f22, %f0, %f24
cpu_intr_1_386:
	setx	0x450322, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_239:
	mov	0x1d, %r14
	.word 0xf4db8e40  ! 4970: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbeb44000  ! 4975: SUBCcc_R	orncc 	%r17, %r0, %r31
	.word 0xb7a58820  ! 4976: FADDs	fadds	%f22, %f0, %f27
T1_asi_reg_wr_196:
	mov	0x3c2, %r14
	.word 0xf2f38e80  ! 4977: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_1_387:
	setx	0x460311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5ab8820  ! 4982: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xbe0da12f  ! 4983: AND_I	and 	%r22, 0x012f, %r31
T1_asi_reg_rd_240:
	mov	0x35, %r14
	.word 0xf0db89e0  ! 4988: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_1_388:
	setx	0x46020c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_384:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_384), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_wr_197:
	mov	0x1, %r14
	.word 0xf4f384a0  ! 4997: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb3a40960  ! 4998: FMULq	dis not found


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

	.xword	0xc5202d83e277ea10
	.xword	0xb2dd254c64f07e4b
	.xword	0x0a9e1f6ebadfe66e
	.xword	0x3830026756432ffe
	.xword	0x37bc96c1671bba51
	.xword	0xa2b784fe139057d5
	.xword	0xf206be181bbdd682
	.xword	0xd5dd137c89f86a6e
	.xword	0x63e490289f33d8d9
	.xword	0xe54052b0f0f0a803
	.xword	0x5836491eb429c910
	.xword	0x69b241db595b7707
	.xword	0x26201ac7af966ca4
	.xword	0xdaf5425f25f866e5
	.xword	0x5d7d7783c5c4a988
	.xword	0x6bcdf68afc6784c0
	.xword	0x4d2dc20fbcf90432
	.xword	0xc14a676d619c300f
	.xword	0x879913d2bc0d0824
	.xword	0x9e786aed2902319e
	.xword	0xdb0a6cabd2e01659
	.xword	0x20d09d6941968635
	.xword	0xca626987ceb4bc1d
	.xword	0x8034b6d4e8a1db38
	.xword	0x442f1f0ad2608746
	.xword	0xc9592d3503547ba0
	.xword	0xe5cf0d480e8342d8
	.xword	0x3b0723aa41acc2ea
	.xword	0x6441990b08bc0090
	.xword	0x09b08fc88716c0b4
	.xword	0x457a69fd54a5ceee
	.xword	0xaa703c8a877a8e14
	.xword	0x79cd658d41aa32a3
	.xword	0x5a9487236177490b
	.xword	0x1e34354f11d2fe23
	.xword	0x60068e47e6944e3e
	.xword	0xb10f788974a4a663
	.xword	0x7f03260eca6c78f4
	.xword	0x935ad04f4434dcbb
	.xword	0x2a1090ac3a57d93c
	.xword	0x0e9208eda448c7b0
	.xword	0x2e6b6be8ad3baee9
	.xword	0xf14f56613b685aee
	.xword	0x24d16c804d61a842
	.xword	0x3e914e6bcce99310
	.xword	0x5b5daf1f4570fbeb
	.xword	0xe2cc35c7e78192e1
	.xword	0x2ddfa7adafd1d9ea
	.xword	0x2fc2ea61a355f6a5
	.xword	0x526f1a563ac3b81f
	.xword	0x6bf563c9da170af2
	.xword	0x9f2a1eded813c481
	.xword	0x238ee0f572d9018f
	.xword	0x3be4aa00b079d1ec
	.xword	0xa0048caa39599ecc
	.xword	0xf12e1774d4e00466
	.xword	0xe2ff810b17f4cc35
	.xword	0xffe630a4fb6195b8
	.xword	0x08b3a311fa6f3390
	.xword	0x896a5493488a0997
	.xword	0x76b5373a3410195a
	.xword	0x06b565f30edea68d
	.xword	0x7f0882d1ccdcd411
	.xword	0x5f59e4fd1f433e9c
	.xword	0x70dbcbdd6c2f7e7d
	.xword	0x2b4c6028fb1575c1
	.xword	0xd08d8d77d2bda7e1
	.xword	0xa90b36b870daf319
	.xword	0xfce1e4c83f5df13d
	.xword	0xb07b8b849bc794bf
	.xword	0xe0d9ad77b7fb81ef
	.xword	0x1fa0c21c0c848ced
	.xword	0xd68628884fb52440
	.xword	0x5c22becbd46ba9e4
	.xword	0xd8caac85f0c3cbbd
	.xword	0x2d8dbbf704b7df74
	.xword	0x70f4667367340be0
	.xword	0x668720678681c784
	.xword	0x98b1919c7163263c
	.xword	0x86503aa2c75af80a
	.xword	0x15e9513cd93d5d26
	.xword	0x1205421fbe26f446
	.xword	0x4dde14667d5d5b84
	.xword	0xac2c9c36300c1748
	.xword	0xaa6e7db44f8a82dd
	.xword	0xa425dd4391671657
	.xword	0x6b4ede8ae998acc8
	.xword	0x41ef64ea591ed707
	.xword	0xe339382fccc17339
	.xword	0xb5acedcf4ce6f8ca
	.xword	0x5b8f7a334670b569
	.xword	0x84f80bf8c5690915
	.xword	0x8151b164073eae16
	.xword	0xab3893ddbfba67b7
	.xword	0x25ffc7076fe3aed7
	.xword	0xee9cede52c1641fb
	.xword	0x6ad6731ec43d6602
	.xword	0x29c9cbae1edc82af
	.xword	0x0fd5ef6f9e98f8b5
	.xword	0x1cdb034b9e6eb468
	.xword	0x7a2c69aa26eb2f17
	.xword	0x775f8d2f285c7645
	.xword	0x24e44d0c3e58d4f1
	.xword	0xf0aac36ef9dfd095
	.xword	0xe77e8fd28b3ff68b
	.xword	0x7205e90941236bd1
	.xword	0x1438368b3ea3f868
	.xword	0x8c2d73f206566173
	.xword	0x05421e1f727e6354
	.xword	0xf23df4ca32782e3c
	.xword	0x39b0b8293c04dd2f
	.xword	0x08eb435709ce7236
	.xword	0x4a35df37b217728b
	.xword	0xad6c48fe743fcd72
	.xword	0x2e1e728defb32862
	.xword	0xac46461a14641283
	.xword	0x6270c95d7f0a585c
	.xword	0x881e020e767c7cf4
	.xword	0xf1085fb141d80933
	.xword	0x794710b493494256
	.xword	0xc95c91241a6a7d47
	.xword	0xfd5144525466891d
	.xword	0x8413dced34d293f1
	.xword	0x7d05fa1d061d9a6f
	.xword	0xfb58dd7064f6db1e
	.xword	0x8c4111795921d688
	.xword	0xabc058878eccc62d
	.xword	0xe1438458299a3fa7
	.xword	0xfbf58932e41da753
	.xword	0xb42c566a1d89723b
	.xword	0xf215efc665a0ef8a
	.xword	0x44d6abcac59e55af
	.xword	0x6f23b84bf8e9bd2f
	.xword	0x8f1b82a63e15723b
	.xword	0x2586313eb33a3045
	.xword	0xdd65fdf272ba5528
	.xword	0x97054ab077f3a64d
	.xword	0x99b2a017a247042b
	.xword	0xa1d1f39dd4dd6355
	.xword	0x27b602780807301e
	.xword	0x01152c6fd4c74219
	.xword	0xa66423765edec521
	.xword	0x943db334865ca32f
	.xword	0x7a06604f7d517d53
	.xword	0x99cfcc125bcdad6e
	.xword	0x5b3a9d89a1ca3b3f
	.xword	0xdbdde91ae028284b
	.xword	0x3c8a7dbe1e543a4c
	.xword	0x715b451ccad93edf
	.xword	0xe0fafef01090d3a7
	.xword	0x02d0d264ebf3c082
	.xword	0x57760e180b618681
	.xword	0x2d3525a3284d6644
	.xword	0xb3d35cef41b8bdfa
	.xword	0xfc01d696fb77edec
	.xword	0x1b9a94d31f678b0a
	.xword	0x4fbf23eba9c543ff
	.xword	0xe8eb9bdd6a9ec5e4
	.xword	0x09d369792c55799f
	.xword	0x126a3e761d971c74
	.xword	0x4756bb994ec7485d
	.xword	0x021e9c94b81a19b9
	.xword	0x1660167e4aa76469
	.xword	0x6bcdefed057fc00b
	.xword	0xb6cfa65e22cb6582
	.xword	0xc66907694374c29e
	.xword	0xb9296a0dcd0d4072
	.xword	0xbc47d426949afcca
	.xword	0x96c024015b26a69b
	.xword	0xb075ed70a90346c2
	.xword	0xd82d8a9164d15aed
	.xword	0xab454571392b6cbe
	.xword	0x03b75e737ad9e0e8
	.xword	0x7679b1133abaa642
	.xword	0x6c8f1072d906a750
	.xword	0xf6309947a75afaca
	.xword	0xa76cd2c089c6a066
	.xword	0x716b2393bd603c32
	.xword	0x808a8e9a12c157f3
	.xword	0x6315d36ee0e71ed1
	.xword	0xb0b9e2cf3720d675
	.xword	0x0ce4d882c6e508c9
	.xword	0x815064c1b79b901b
	.xword	0x7e6194bd4a736ede
	.xword	0x353eb65b77e2ada4
	.xword	0xc59c72e6c54b10eb
	.xword	0x9d6fd6aabbf18563
	.xword	0x5ad3d92c0c1aa6ac
	.xword	0xe7aa41e221dc163c
	.xword	0x2d6a96c1151c1f7d
	.xword	0xf68cab42c140d6b9
	.xword	0xd7e44d2cc9d293b9
	.xword	0x882ef2c5e853659d
	.xword	0x7fca2131588a2098
	.xword	0xb7519352ab8a166d
	.xword	0x6287ddc45b7fa3cb
	.xword	0xa9a47e35eea6ea71
	.xword	0xc0fa020139610014
	.xword	0x1a444bca18113b63
	.xword	0x3dcdd8179af1e746
	.xword	0x5b2b35850324cae7
	.xword	0xd3e6ea82bb3b6f42
	.xword	0x3b4db5396e776d6d
	.xword	0x0e84a5a80dac83d3
	.xword	0xca0078588e216777
	.xword	0x321698b5484dc931
	.xword	0x82c8b143bdb4f31f
	.xword	0x39439cf261ec8711
	.xword	0x6a0e387f33ec039c
	.xword	0x7cac1e27a49829bd
	.xword	0xa42878e87b9d9345
	.xword	0x6ea5970ed74b3496
	.xword	0xbab155362bcb194b
	.xword	0x81c211715bfb786d
	.xword	0x22e2242ee17d34b7
	.xword	0x99183bea6dacff8d
	.xword	0x0ca7330bd7591e34
	.xword	0xa7562696336ae43a
	.xword	0xc0a64d02a27c5711
	.xword	0xee35ec655051e9f4
	.xword	0xa5c98ef44fe8fc12
	.xword	0x37ef21817accd358
	.xword	0xfd87706493e90b4f
	.xword	0xed90a1a5169edc1c
	.xword	0x57784b55013c7a62
	.xword	0x28971dc0a0b0de07
	.xword	0xf76bfe482a6a52e0
	.xword	0xd9500d59e54af6ce
	.xword	0x48f0ef76db29a259
	.xword	0x3c9735cba69b87a9
	.xword	0x8d7ef506b5b0cdcc
	.xword	0xb97bf033d4b550c8
	.xword	0xdaf1e07fab5a8a87
	.xword	0x95e32321bc37976d
	.xword	0x5dd2efe97dede2a9
	.xword	0x87f981f398a08e2c
	.xword	0x19ac0d99b4439f4b
	.xword	0x779bd1ff6c55548c
	.xword	0x634b0605ff6f9400
	.xword	0xfd4860f3163799eb
	.xword	0x1838a036a7f482e4
	.xword	0x318bf5d2f2abfe52
	.xword	0x6c6c5f2481b5e0e9
	.xword	0x98040efb810afbbd
	.xword	0xc52ee58335802e31
	.xword	0x0f5629acfd3480a7
	.xword	0x6a20824ae6e271a9
	.xword	0x0e4430fa9c0ad8e6
	.xword	0x9e225f967e938744
	.xword	0x6856a1665e3dfa7f
	.xword	0xfeb0691a61c13a6b
	.xword	0xb440088d344e62b5
	.xword	0x8995a22f3b43fe3f
	.xword	0x78cdb700e2e7a4da
	.xword	0xf1bab1142bcd238a
	.xword	0xa06b4cbdb10b9708
	.align 0x2000
	.data
data_start_1:

	.xword	0x22de4d082897857d
	.xword	0xbbcc9236cf73600e
	.xword	0x6ed1680d80f86e67
	.xword	0x497e1d5f2b4b3174
	.xword	0xd24c69b5da9ad251
	.xword	0x02280274216f4319
	.xword	0x44d66e920d0a04bb
	.xword	0xd7d5f07033d857ba
	.xword	0x87e0a39a65fce626
	.xword	0x3702cd4c556710dc
	.xword	0xbbe611c4c67913a9
	.xword	0x68624150378e8942
	.xword	0xab5e0b8695cecb8a
	.xword	0x0f6d475ea108a42c
	.xword	0xa4fa015739b10bd8
	.xword	0xd81301e1c5de6c89
	.xword	0x1a16971dcd5f8543
	.xword	0xab6249376b8c5253
	.xword	0x7f415b94e3e1253c
	.xword	0x03d2f2b022fbdf78
	.xword	0xef350977d83a05c2
	.xword	0xf15ffa85a19b646b
	.xword	0x296195ab0d72b081
	.xword	0x1913da99a6c375bb
	.xword	0x31243d011b4ca083
	.xword	0xefd7ec7cd0257f29
	.xword	0xb08d318d7c7ce055
	.xword	0xb531487b3ab070c4
	.xword	0x588cf4dbe4c7cdd0
	.xword	0x3206ca5125468c84
	.xword	0x95675362c5337800
	.xword	0xedd2bcdc7c08be78
	.xword	0x9748b93a0b184e01
	.xword	0x715dd61e3b78c50c
	.xword	0xb283f8c033dd062b
	.xword	0xd1d81593ab8ce8db
	.xword	0x14ab4324aed7cb01
	.xword	0x8480b9e36ccc747f
	.xword	0x161a4cbf24e60deb
	.xword	0xe48ddddf8c06d3ff
	.xword	0x7f7a4568727b8330
	.xword	0xc176529a0e9705b6
	.xword	0xce15c5cea7cd2794
	.xword	0x85b4b8d4a81340d6
	.xword	0xe3aea63411e9ee64
	.xword	0x80cd2b92ce4f663e
	.xword	0xeaa9615015bc9955
	.xword	0x88d65c3734e25c4e
	.xword	0x2f81bd92afeed113
	.xword	0xd8d95d1e15048e10
	.xword	0xa6aac369fd047b9a
	.xword	0x678bd28fd5443a5c
	.xword	0x3cffc1e41388a6ce
	.xword	0xcb15d523c40dacad
	.xword	0x8238358907e46b53
	.xword	0x0c2471226c8dfe16
	.xword	0x5aa7e0ca2a9d62a3
	.xword	0x2b7c684dccfcd4c5
	.xword	0x6b4e0e4ff0793e6a
	.xword	0xf747320249485b61
	.xword	0x7e55ddc8a68b64e3
	.xword	0x22a2abfba435c12d
	.xword	0xf668d7cff2854394
	.xword	0xd8285b7b3e78ddd7
	.xword	0x29bee96bfe99f005
	.xword	0x86ca1f6aab354a80
	.xword	0x314cd87e53ac01cf
	.xword	0x97c6891a75882542
	.xword	0x2d57faaaa810c518
	.xword	0x05a08d3cd9d450f7
	.xword	0x94e7f7ab7c0794cb
	.xword	0xdc98d0af659a8a20
	.xword	0x9c6899612eec811d
	.xword	0xc5403b51c5ac722d
	.xword	0x6faa5a599b6a8e7e
	.xword	0x694097357fd3766d
	.xword	0xc5baf95084cc94af
	.xword	0x1438bd307c367093
	.xword	0x3ed5084e4b856278
	.xword	0x76e646db2b879f58
	.xword	0x2d8a52f20cb9ab93
	.xword	0x21f8995e5f2f7360
	.xword	0xec163cb97deb40ba
	.xword	0xab1129d58fd036fd
	.xword	0x98c8e2281096232f
	.xword	0xba3a7f789af4eed1
	.xword	0xfc1d190564807829
	.xword	0xf9f462da7fc06775
	.xword	0xcfc9e7a728a7378b
	.xword	0x9c66c236b17e5151
	.xword	0xe41cae836dbbbcb8
	.xword	0xfab1f8a92951ec4d
	.xword	0xa84cf002ff76e185
	.xword	0x51d3b440b50e89e4
	.xword	0x91529e838a5cde6b
	.xword	0x4b1471b9591acae3
	.xword	0xae845bbd7390a4a1
	.xword	0xf9ff56a7c659b939
	.xword	0x82ac34c6f017e89a
	.xword	0x2069114673771211
	.xword	0xe92465cc5db1635f
	.xword	0xa7a689b79f3b7cd2
	.xword	0x35ace4087f5c7527
	.xword	0xc358af7797b3221c
	.xword	0x8e303a33ddc9ac1b
	.xword	0xe33a4b1bad523c60
	.xword	0xe4625cf685b3ccae
	.xword	0x8dce8f85d22d4668
	.xword	0x713d3f067ce2a7e8
	.xword	0xe6bbcfcd283713fa
	.xword	0x7e35de9979b36d30
	.xword	0xffa66a89c1009538
	.xword	0xda67a99f8d59ee3f
	.xword	0x2781cffcfba81f97
	.xword	0x16ef784bd171480c
	.xword	0x0bf45695c37a91d9
	.xword	0x9f812467e1c486fe
	.xword	0xddad6867b45f8540
	.xword	0x56987bcfa99f9496
	.xword	0xa1f4ea2e95a23826
	.xword	0xa5ddebcf05dc70fc
	.xword	0x5e43f481c6f876a7
	.xword	0xa4559a1cd4d13d1a
	.xword	0x0225578cec6af9e9
	.xword	0x974da982a4f4bbd9
	.xword	0x0bfaff0eddaa2b57
	.xword	0x2e0ed8778499a37d
	.xword	0xaeca4327e9965990
	.xword	0xc24cd425e9b26158
	.xword	0xc54a6722178de07b
	.xword	0x629d5c01757bf8c0
	.xword	0xd02d02369581f4b9
	.xword	0x98c8d4feee2fbdae
	.xword	0x0c848cac546caf43
	.xword	0xf55887ef15c9de4b
	.xword	0x38702ea097edaa06
	.xword	0x58ce55d4c4df3f5c
	.xword	0x5c812d2b1751603d
	.xword	0xde23294326cda9c0
	.xword	0xa255641488373ce7
	.xword	0xd62b1ad212edb8c8
	.xword	0x84c951de77c54480
	.xword	0xf0cb8dabb5fc8715
	.xword	0xe0c528b4e5b4a952
	.xword	0x284b85278ee06a53
	.xword	0x3a779c25dbe26b27
	.xword	0xde78009eb77d95a0
	.xword	0x11d5868212301124
	.xword	0x239a61bc3a618199
	.xword	0x51ccb5e13632efa2
	.xword	0xd08e2db19751bfb2
	.xword	0xa039e2daf5b57a63
	.xword	0x1dceacf74a3225e1
	.xword	0x8f86ce2166cf7410
	.xword	0xb3c2b5cd14c1d5c3
	.xword	0x1e196f011b9fc6de
	.xword	0x35681040c4b8b456
	.xword	0x5160bb785244280b
	.xword	0x8fd4a9501e49d1dc
	.xword	0xe780e4fe35fa3179
	.xword	0x4d6584370e225721
	.xword	0x825b48689e7dd146
	.xword	0xecbec47651328d42
	.xword	0xffedd036e5977f4e
	.xword	0x24daaa254db1c2bc
	.xword	0xebe2c1e26267a31a
	.xword	0x90c6327bff1fc641
	.xword	0x8b6f34e218653907
	.xword	0xa525edd31b6881cb
	.xword	0x14b594788b1c702e
	.xword	0x321573c76712be0b
	.xword	0x4a99fab6eeda6df2
	.xword	0x79cc8c07e396fa35
	.xword	0x3491f538f52356c7
	.xword	0x72140c805df0a89a
	.xword	0x3e9622b0a06bdce0
	.xword	0x8e805b25024ee72c
	.xword	0xe20cd8d1c60e7518
	.xword	0xd30080e99e427432
	.xword	0x13aa5a5e022f1e9a
	.xword	0x75e087ccf770308a
	.xword	0x09bd6cfe4f35f3e9
	.xword	0x7e9715b41a061e26
	.xword	0xdc3986086a610f70
	.xword	0xdf756504954eb218
	.xword	0x645b0b3cd48e8fef
	.xword	0x25ea083d57917502
	.xword	0x3fb2626a1d5bb74b
	.xword	0x8a17f2272842564b
	.xword	0x69296863819bfe35
	.xword	0x9ba9e4d0f739e91a
	.xword	0x5da87e055e2a8404
	.xword	0x61e01c4da61439c5
	.xword	0xb65ff8cf1d383c5b
	.xword	0xbd1c015ba9be4651
	.xword	0x58086fd255209114
	.xword	0x749b3e9dda26b1ed
	.xword	0x1a8d11b44c1b0efa
	.xword	0xcb2637dece07597b
	.xword	0x303829a650aac475
	.xword	0xf1f5b2cc8e2ee4eb
	.xword	0xac25806a52d2a886
	.xword	0xdf9e9e6ea6e27a62
	.xword	0xbbbad277a986d96c
	.xword	0xb22f6d31de8f7bc6
	.xword	0x4eadd46fd9ace4be
	.xword	0x6ef42f382f219f3e
	.xword	0x97be86d480cb5112
	.xword	0xe873886e9a04e60e
	.xword	0x82bd67064460e652
	.xword	0x5a3585fdbe53bc2a
	.xword	0xd37ed703f165b759
	.xword	0xd37622b751c7cb80
	.xword	0x41352e129f17ff0e
	.xword	0xfa1f04ed5b783659
	.xword	0xb89a988076e17a81
	.xword	0xaf5d163e43a96835
	.xword	0xfff8dfaead850eb3
	.xword	0x20f2239211d5afd1
	.xword	0xeaf12cbb502ab019
	.xword	0xcdfe8ab1b586aaaf
	.xword	0xc02f27f159031efc
	.xword	0x4d49c811efc1f2a5
	.xword	0x2064d2380f6b54ea
	.xword	0xd4fbef13c84377b1
	.xword	0xeae76d32cf0836a5
	.xword	0x911b7df51ed114bb
	.xword	0x487196b67e9affee
	.xword	0xf5c68469c72e1cae
	.xword	0xca86f84b37f8307b
	.xword	0xed7208a7af9ba32d
	.xword	0xac3fc0a5aca82ed6
	.xword	0xa17248a68a339931
	.xword	0x932024aac7867bcf
	.xword	0xc937f1a07042b11a
	.xword	0x53dc943fea2d29c3
	.xword	0x90e83b95a03e7e95
	.xword	0xb3d71b17e7e5b2c4
	.xword	0x0ddf50841977bb78
	.xword	0x91c1ab0eb4940059
	.xword	0x7eefc26d38c829f4
	.xword	0xb17935d2981723c3
	.xword	0x371711f0934e13ef
	.xword	0xc06f80be6283b4d5
	.xword	0x206083f2e9f6cad9
	.xword	0x26608f8fc77dfb84
	.xword	0x330f03d5f001da3e
	.xword	0xe13c80ce29971d5c
	.xword	0xc29b401adc4fd9c5
	.xword	0x271d7fb7e3f387d6
	.xword	0x6a674d17ffee4be2
	.xword	0xdb92226afc29609f
	.xword	0x40f4cc117e9ecb7d
	.xword	0x444b9854a6de0532
	.xword	0x0077b4cf547e6a54
	.xword	0x42d95dd312fa67ee
	.align 0x4000
	.data
data_start_2:

	.xword	0x1297009da1f76d43
	.xword	0x7fa9edcba795f6ec
	.xword	0xdeff2c087207f6da
	.xword	0x7f8ca2a46722f019
	.xword	0xd5c382c2baaedec6
	.xword	0xe6d3ff8639c08e4b
	.xword	0x1293d8f1a7d8514b
	.xword	0xca0c3cac6b1fae5c
	.xword	0x1431036c03efc123
	.xword	0xe962c731728143d7
	.xword	0x36430b125c859416
	.xword	0x8cc4161056dd45e8
	.xword	0xdc3cd22d227c040e
	.xword	0x81f169fada33f735
	.xword	0x9d018578e9985714
	.xword	0xb4c72ee76642c5fb
	.xword	0x6a5661702a77968c
	.xword	0xc38a8a2f0d9e7f26
	.xword	0x555feabd5b2b7d74
	.xword	0x891d20566bee1ec9
	.xword	0xe27f0640f71e2b3f
	.xword	0x8bd3df660c16ab43
	.xword	0xdbbcd6ed3e41914c
	.xword	0x074080fae76a20a0
	.xword	0x1aafa474df4d6d10
	.xword	0x1c1c0340c0a90a30
	.xword	0xd26488b9a517b4d3
	.xword	0xc4664e36fa969da6
	.xword	0x3839cacb3305a741
	.xword	0x7febbe2fbe0dc755
	.xword	0xe142de9c7a26b7f5
	.xword	0x6624fc2dcca32782
	.xword	0x435a4dfd65d4ddc9
	.xword	0x98c375f185d488be
	.xword	0xc1da965bde9fc5e0
	.xword	0x3e1a9bdd135f8d51
	.xword	0xd516dc6a990150dd
	.xword	0x30c2530c5dd001a2
	.xword	0x0253b65b2625360c
	.xword	0x22836e3f2779b116
	.xword	0x149c112799fc5dca
	.xword	0xbab678337f517e9f
	.xword	0x3927e82d32d38fa1
	.xword	0xf18be51854620629
	.xword	0xe76e4c8e44137014
	.xword	0x62d619e6980a3297
	.xword	0x1d2f8d8e17022776
	.xword	0x0ee7fc6f6e7939a5
	.xword	0x690f2e94650dc9c5
	.xword	0xfb68c9efa47d2cf4
	.xword	0xbe41226b3b690e58
	.xword	0xaf36d8dcf9f80fe8
	.xword	0x4c94be32f64a513a
	.xword	0x7a5571e6296aca50
	.xword	0x9b596dd146a89365
	.xword	0x82ab1a082a87b6e6
	.xword	0x9f8891476e4ed1cb
	.xword	0x7c0ec7bac3594c28
	.xword	0x5dea008e298ba908
	.xword	0xc3897d69290d3a79
	.xword	0x616f638169acd1bc
	.xword	0x065abaf0e9b28f2e
	.xword	0xa0450965a5001933
	.xword	0xff33cdc36c4379ce
	.xword	0xc3f9091531f7858a
	.xword	0x213f887bab78a1eb
	.xword	0xfd785106edd88add
	.xword	0x65c843747c2ef0f0
	.xword	0x48546f6477fe02f5
	.xword	0xad3f5bbe7a0a565d
	.xword	0x2b27c117b51f58cd
	.xword	0x1cf1b13b1c120b6d
	.xword	0x3625129a3a5c51b9
	.xword	0x62381ade16aad48a
	.xword	0xf61cd15764e080bb
	.xword	0x8879921a20b0d718
	.xword	0x8ded1b64c9afde15
	.xword	0xfa4fc0ca9f0187a6
	.xword	0x1a1c4f1ba740123e
	.xword	0xd693507ddb57c55e
	.xword	0xb9989fc43906ef85
	.xword	0x822388e802792a94
	.xword	0x806ec0411824567a
	.xword	0xbc3e19d8bfaa433e
	.xword	0xb4860f65bb1993de
	.xword	0xb7939dfacd52c459
	.xword	0xfff056e691094c21
	.xword	0xaa038f743e97f87b
	.xword	0x788d1544a7f59bb2
	.xword	0xb40a917d0297f9ac
	.xword	0x8fd17f32e49b837a
	.xword	0x4c1aac2e462a5c7d
	.xword	0xa0eceae12155e004
	.xword	0xb86182b5f80fd325
	.xword	0xda10187896da311f
	.xword	0x3eced4a57419aa7f
	.xword	0x1d0ee49f035d04cf
	.xword	0x29b06eb473590f4e
	.xword	0xefc3935175651b15
	.xword	0xf4a163ffb6f0f163
	.xword	0xf2c5f2996bf9e878
	.xword	0x47a5f6aca850ee33
	.xword	0x141a7560350f931c
	.xword	0xe78c1a66e5629145
	.xword	0x9a2770d01cf53bfa
	.xword	0xb33b32c1ec0a2085
	.xword	0xba93be68f03b0ab4
	.xword	0x4163c5d323685b3e
	.xword	0x824c24beb278436f
	.xword	0xf86324d6ecbe951e
	.xword	0x28967215ea014b92
	.xword	0x177a7500ed5145ec
	.xword	0x8a10fb74c248a2da
	.xword	0x2fc91999634b5d4b
	.xword	0x104d7167c77f0d79
	.xword	0x8c8fc4309adebe20
	.xword	0x35959d936af700b3
	.xword	0x4f93b503c478f06b
	.xword	0x2c03079e992b74e4
	.xword	0xd7c43e9b7adac6f7
	.xword	0x210b28a8db76d798
	.xword	0xc627247eba0091d4
	.xword	0xcab7767fbcd158f0
	.xword	0x333f9af2417f628f
	.xword	0x85c85939c14b62ee
	.xword	0x11e6460d2b08e66e
	.xword	0x4ab1cdb3bb037fd8
	.xword	0x2043245820992248
	.xword	0x7f3a39dba7086b56
	.xword	0xd553122d78c17091
	.xword	0x706ae799f5365fc8
	.xword	0x26ab20a9794c5497
	.xword	0xa72af48fb0c40936
	.xword	0x1b93b088da42f0db
	.xword	0x282d105585b1b958
	.xword	0x373d02965eb6753c
	.xword	0xd0e31d089e8dec7d
	.xword	0xfca417e7d4418cd9
	.xword	0x991d91ad6f0621a8
	.xword	0xe3154b45cbf9a733
	.xword	0xbe495be04920ab6a
	.xword	0x98d70918339caf82
	.xword	0x30cdaa7ca20ec804
	.xword	0xc7f47f38afd80a1f
	.xword	0x37ac73f727edf335
	.xword	0x5877017492f01402
	.xword	0x2a4fc4ff75cb610c
	.xword	0x6b02f435cfbbe684
	.xword	0x326f6567abac6b4b
	.xword	0xb3750525d51ca694
	.xword	0x0009e32b764b497d
	.xword	0x3b7766e1496882e8
	.xword	0x54b2665250334431
	.xword	0xf2851eb835c57768
	.xword	0xa9602ac1706a192e
	.xword	0x901e1e7e8fea6c93
	.xword	0x617d948a448fed37
	.xword	0x9cf1e108513854b3
	.xword	0x045c7b9a8f2e8dbe
	.xword	0x15fe9e212fbb0ef2
	.xword	0x130f22666650df3b
	.xword	0xef0f4a96c026d7eb
	.xword	0xd23be6a1241ee7a9
	.xword	0xf03018f23affb841
	.xword	0xd869c306aff489fa
	.xword	0x6bee5ba1ac489480
	.xword	0x6bef8be67907be65
	.xword	0x8052bf2acf704650
	.xword	0xe7819405c6b0b2e1
	.xword	0xfd9679ebf0bebdc2
	.xword	0x4652f01bec4b4929
	.xword	0x5592cee1f799901e
	.xword	0x4a5b56ec7e8d98d7
	.xword	0x512f1dc14cd5aebc
	.xword	0xd71273035011765a
	.xword	0x2e4aea681276497f
	.xword	0x34e272b964ed3d54
	.xword	0x627153aa8c5dbadc
	.xword	0x1e39c4c373c1bfdc
	.xword	0x5f7739083b5566e8
	.xword	0xfa328a27e9a5c036
	.xword	0xd9fe34bd16c98ef7
	.xword	0x6b950ff4a0982181
	.xword	0x7b4c7d1ae4e7f303
	.xword	0x5fa0da4cea39463f
	.xword	0x792acb76027c9b41
	.xword	0x604d9d522bb12396
	.xword	0x44b68c770c9d0850
	.xword	0x00c8969ad6006e8b
	.xword	0x658c91a5fdae5600
	.xword	0xbd8580405096ba09
	.xword	0xe6dd7ae8c6101323
	.xword	0x4359bcdd97c0e630
	.xword	0xdc22da81150ddadc
	.xword	0xe64965ddf57479ed
	.xword	0xcbf6c52e771bddb9
	.xword	0x07ee5eaf033971c5
	.xword	0x3ba309b1415d99fc
	.xword	0x2928b9a292f0e6b6
	.xword	0x54d1927ec209515b
	.xword	0xa454f4bc9b741ad0
	.xword	0xf356f184f2aa0af0
	.xword	0x90c46cffe7a24eb4
	.xword	0x19dba4d7fc76d530
	.xword	0x7e845fbb68e378d3
	.xword	0xaad667f4363aa4cc
	.xword	0xd44b2228dafbf542
	.xword	0x66d0784551c630cd
	.xword	0x9300afb339be4d6e
	.xword	0xdc8b81f750f5116e
	.xword	0xd684436ae9dc9e3f
	.xword	0x1c184e47826d6d5b
	.xword	0xfe83ed40204419dd
	.xword	0x88dd955297a7e6fd
	.xword	0x4e6974b89637f61a
	.xword	0x589f1ee7cda1a456
	.xword	0xac33ae6ad7bf6817
	.xword	0xeea02fe312dbe048
	.xword	0x71ab308a1d0ed795
	.xword	0xd641ca75051b30e4
	.xword	0xaab4ea2d478b7848
	.xword	0x9a2eb176ba8b10ac
	.xword	0x72aeaa839b4f131b
	.xword	0xd5ac0000a9ce3fc7
	.xword	0x1c93ecfe72fe806e
	.xword	0x7cef6c0b4d152511
	.xword	0xdfd718c3c53464c5
	.xword	0xd45fb6938d078162
	.xword	0xb9ca578e1d59838d
	.xword	0x6c3b70c3633cae25
	.xword	0xbf5e9df567ca923e
	.xword	0xf942aa0ddd0e3a12
	.xword	0x72833e2c6b421bfa
	.xword	0xca574a18a9aeb6bd
	.xword	0x8c50191c530d7709
	.xword	0x9b491824549c1455
	.xword	0x305527a027f25c87
	.xword	0x3cc5e6b7e81db82e
	.xword	0xc7a27eedb64475c2
	.xword	0x12b0533e69497331
	.xword	0xf2f9eb69d996cc6d
	.xword	0x6b83b17bf9543d39
	.xword	0x0f50fda311a57112
	.xword	0x03c80bda29dc21bb
	.xword	0x7d6efaccf2adc494
	.xword	0x10067932247d80af
	.xword	0x717c292b385d1813
	.xword	0x0723c60c5e070b64
	.xword	0x3c14a258813fd4dd
	.xword	0xeb87d1f641ad7038
	.xword	0x73a6b0925561c00a
	.xword	0x9f1d3ebbb018499e
	.xword	0x8b07af5fd944ba14
	.xword	0xb9bd7dcd71f36669
	.xword	0xf74433e63759e4bc
	.xword	0x30ca90daae37ce18
	.align 0x8000
	.data
data_start_3:

	.xword	0x6d41458c890d7a90
	.xword	0xb56536925cb3b2b8
	.xword	0x53a9e37912a53920
	.xword	0xb0b045ffd8cfd1ef
	.xword	0x20c32675d72367bc
	.xword	0x1fc5f984409cdeaa
	.xword	0x5713a0d22ec45d21
	.xword	0xc3ffb6faf2be22fa
	.xword	0x444458f007775f4b
	.xword	0xee9bd404af23cfe9
	.xword	0xbf08dfc57c0ab8a7
	.xword	0xac9a440e5d60ac18
	.xword	0x597e91776a7bd6a3
	.xword	0xd18d381aea10d43c
	.xword	0x00cddda21791f711
	.xword	0x53388245d851f55d
	.xword	0xc2e2a61be2e30fd8
	.xword	0x82a5463d59aa3226
	.xword	0x042bbb50cf87bda4
	.xword	0xb3fdce103b571005
	.xword	0x3dbb1a8fc51caf2f
	.xword	0xee322cfd3aa6798e
	.xword	0xff93c8804b02ff42
	.xword	0xc66b54139a46b6fc
	.xword	0xf6507521de88115e
	.xword	0x57324c46cfbd97ae
	.xword	0x7b227aa5ec6b8e58
	.xword	0xd5d00d6f4b5b60c1
	.xword	0xbe0db55cd4edf379
	.xword	0xbe8ed24d89f3979a
	.xword	0x7b13711ec1e0ba9f
	.xword	0xf28c1dc3e3b1ded9
	.xword	0x7f7a652a00c2e49c
	.xword	0x79a55440759c148e
	.xword	0x89565e431ddbe7b2
	.xword	0xbd74956bad37054b
	.xword	0x23339688facf823a
	.xword	0x4ff11fbbd17ccd84
	.xword	0x3550d8bb429d61cd
	.xword	0x4c4add084a960392
	.xword	0x8f5fd4271543dd09
	.xword	0xe426d5931dcf5f8b
	.xword	0x910574e5440ec5f1
	.xword	0x2bebd47bc62c96f8
	.xword	0xd5fde58a881c3c36
	.xword	0xe02950ebd2e4e94d
	.xword	0x52b0ffb59a6b16fc
	.xword	0x2e7e9d615e95b121
	.xword	0x476d868e5b8f23cb
	.xword	0x3fdf6755a43bee1a
	.xword	0x8083b238bf0fedbf
	.xword	0xbefc66ce110cd583
	.xword	0xcfbb467ccf66621a
	.xword	0x62158f158794b124
	.xword	0xb38777e78fa1b7c5
	.xword	0xc0964e9b7370e297
	.xword	0x7a8ca5c22e6d7b82
	.xword	0x65157d12039351b3
	.xword	0x35575e9edecbceb7
	.xword	0x82e94fa23e95242d
	.xword	0x31042090b58ef857
	.xword	0xe72d4771c9831eb3
	.xword	0x0415effd32ab52cf
	.xword	0xfbdd959e9580f226
	.xword	0x2282447d2feaff5b
	.xword	0xf657333908649105
	.xword	0x625dca97155d10f2
	.xword	0xd25d2095c67f609f
	.xword	0x55d2b7243bc76b58
	.xword	0x8e67ec88e63b19a6
	.xword	0xdb7356ceec4bfe95
	.xword	0x51efc92e9d604283
	.xword	0xe7c69d50f7abd9c5
	.xword	0x4cd985ec5f46b262
	.xword	0xab88156a451e0315
	.xword	0xd1c480cd65785076
	.xword	0xa3b5a36603c3cd89
	.xword	0xb053cefed137cabc
	.xword	0x4924f28894c637e0
	.xword	0xb86fdf3fa8cf2085
	.xword	0x92ce2fb5c824fd87
	.xword	0x7a6424f71827876f
	.xword	0x49bedc4024163c56
	.xword	0x0280215849bb4e78
	.xword	0x68515e271ec6e478
	.xword	0xadd2044be2335e5f
	.xword	0x3d0c17364c0ae31f
	.xword	0x69ee113060f85156
	.xword	0x5c9376e71bd7e55a
	.xword	0xb8ded25298aa7379
	.xword	0x898e26f7763076a5
	.xword	0x29bb782bc1b0ae46
	.xword	0xc402a5beeff2438f
	.xword	0x1ef290903498b6eb
	.xword	0x75b3abacb4db3437
	.xword	0x2ddf7449cd72facd
	.xword	0xb50822918212b9f9
	.xword	0x1a734e21e8452a87
	.xword	0xc5d11c12d3b222d8
	.xword	0x6304db4af5aef960
	.xword	0x4c5a88ee214a6185
	.xword	0x8721318b9e9c5b99
	.xword	0x96aa3a0d55c42e3b
	.xword	0x526418b11a73ee63
	.xword	0x686ab9dd19672ebb
	.xword	0x3aab893503bc9973
	.xword	0x4549e50408245fe3
	.xword	0x54aa2a71ab2a0b03
	.xword	0x9a13b434fb065a89
	.xword	0x40321dc172f5a4d6
	.xword	0xb076113f2491ae2e
	.xword	0x0cc6a0a547f4aca5
	.xword	0xa353c5b2fc32ff2d
	.xword	0xd2d78023dc21e08c
	.xword	0xe1a6059fbada34bc
	.xword	0x204fa0f0d5420769
	.xword	0xb2ca284ad1438e64
	.xword	0xcbbf13f2eb98bcf2
	.xword	0x78a0a26b94f971cf
	.xword	0x3df28ddc1b7526a3
	.xword	0xf38198a88040dd51
	.xword	0x55e328eea82333a9
	.xword	0x0dc4786d97dfc4c9
	.xword	0x7c44fb050988ff9a
	.xword	0xe68f6d8568b15bb9
	.xword	0x75f7530bf2cfbc72
	.xword	0x079d582fa7baf344
	.xword	0x1bddc181a6f79501
	.xword	0x3a6eea8abb6307d9
	.xword	0x73208bc6a0d60636
	.xword	0x39f0c48562a83e8a
	.xword	0x1ce0f7b552063a17
	.xword	0x16eb6c33a28e2f34
	.xword	0xb9976fdb5ae9d421
	.xword	0x04d26416426af6d4
	.xword	0xad30c4803e0da0f8
	.xword	0x0fa79d5c9dc1677f
	.xword	0x5909a912fc00dcc9
	.xword	0xedb9772e3d146b72
	.xword	0xe1eafa3f989d2555
	.xword	0x4bcdb13407274d62
	.xword	0xc59842c8ba507868
	.xword	0xcaeda783c482a8ea
	.xword	0x0b5e3b9edf80c2c3
	.xword	0x11023af9eb511426
	.xword	0xd496ebafac373758
	.xword	0x07e1fe6b70e6418c
	.xword	0xc133e4b497c76a24
	.xword	0x58aa8ba7d6fde3d8
	.xword	0xdca5e28c7c646a99
	.xword	0xb1e8ad69e87b7e94
	.xword	0xe5996546971280e3
	.xword	0x165a8c2a522d04ec
	.xword	0xce3c7ef63d0b4501
	.xword	0xb8fad867d1e7175e
	.xword	0xe085dd7d1977017f
	.xword	0xf196d0483ae860ed
	.xword	0x75dbde4194b54112
	.xword	0x6914100ec59d969f
	.xword	0xef6ae843fdcef355
	.xword	0x52b1fc6942d946d4
	.xword	0x7f19cdc1b048f125
	.xword	0xdf4442e38728ca9b
	.xword	0x90db6d52acb918be
	.xword	0x8950b3bef6eb095c
	.xword	0xb3caad84fc87cf2f
	.xword	0x02fc3ff3c83a7659
	.xword	0xb379a03ce3cdb9c5
	.xword	0x6cb619b987db034c
	.xword	0x5d5c9d9150dd37e3
	.xword	0x856a97fcf136b279
	.xword	0x9783a22b5c3cdcaa
	.xword	0xfbc4590300bb315b
	.xword	0x28be1cc2534f55be
	.xword	0x23de989c2e6e5ee5
	.xword	0x6b7e0b685b55c888
	.xword	0x7550dc5244889cf4
	.xword	0x53add6fd685073a0
	.xword	0xc16c4494ea920bd0
	.xword	0x257d16250544e12c
	.xword	0xe733374784d4ba80
	.xword	0x89ca351b89e1cc54
	.xword	0xa94d1103db916960
	.xword	0xf3a4d987cea800d3
	.xword	0x8e86687d43661e80
	.xword	0x1accfa09eff592c0
	.xword	0x7482eee619b75f9d
	.xword	0x5b68b72a9ffd4724
	.xword	0x38eb9134404da9ee
	.xword	0xb198c693c49a9e87
	.xword	0x14b3f9d86b620601
	.xword	0x3368c025d29707ac
	.xword	0x7c38061d43e17374
	.xword	0xec59c9687d7a4cbe
	.xword	0x34613d7f5cab670b
	.xword	0x09b7b067fd637ee0
	.xword	0xb0cd320a87fe11f7
	.xword	0x7b2c32acced92ef3
	.xword	0xe23a9247ebba6903
	.xword	0xb70f7194b92cc829
	.xword	0xb01af91162332ad3
	.xword	0x293cc94a3b4c983b
	.xword	0x631bea32b9c60fcb
	.xword	0x014cbc865aaeca42
	.xword	0xee483e450554ee6d
	.xword	0xe242510936aceafb
	.xword	0x83d4bb010ff8fcad
	.xword	0x35656271a8c2f1f2
	.xword	0x6239105e4e6acfec
	.xword	0xa7f3bf4887c95efc
	.xword	0x3d662bde601be7e0
	.xword	0x3ae787711787fe32
	.xword	0xaf627b88524b4625
	.xword	0xe468ad35263009da
	.xword	0x79d4f0239843c90d
	.xword	0x975c9b8579d4a58c
	.xword	0x524b9a914a343ca1
	.xword	0x823fc94e0d8a8d71
	.xword	0xb54b3f396355e008
	.xword	0x2792ac0c33b80908
	.xword	0x056f2869168a5499
	.xword	0x57a69c5c015e923c
	.xword	0x9b3b800564ed7665
	.xword	0xeae9f50c9da2c72f
	.xword	0x1540aa10cd94d066
	.xword	0x1dcabee27442c944
	.xword	0xa641627d45c0b8d2
	.xword	0x8e8a327d0d532f76
	.xword	0x886c69d25eeb54ea
	.xword	0x5436c4f228ddc24b
	.xword	0x8acf8ed31fa17244
	.xword	0xa3fa8d9979a4514f
	.xword	0xcb7f3850b7f34cf6
	.xword	0x6a16bcd30c02bb3b
	.xword	0xbedbb37a141cf575
	.xword	0x9fa73778625780d3
	.xword	0xa7986d3822bd8726
	.xword	0x3f144508c033f6e6
	.xword	0x5b54f5d0d5c3e00a
	.xword	0x06a83d53a0b43025
	.xword	0x2cf10844fb5e94e7
	.xword	0x5cfc74ced0edbcd4
	.xword	0x71df985400a89ff1
	.xword	0x453206a9a22567d0
	.xword	0xc488644a9a1e8057
	.xword	0x30cdc74cbe02c70a
	.xword	0x78bd937df5cd85d7
	.xword	0x84e23efb46880824
	.xword	0x204ad24cf70d5e95
	.xword	0x0582bf7c9f00b632
	.xword	0xf3391cd8f0aa1d88
	.xword	0x3a7d7c2f4046ec72
	.xword	0x0737cf001a160de8
	.xword	0x50f270d05d98e9a2
	.xword	0x7e5a89905992dd26
	.xword	0xd2525e1514d3904f
	.align 0x10000
	.data
data_start_4:

	.xword	0x4d6cb6b38d6c10fa
	.xword	0x424e9be8f48d8820
	.xword	0x02086199c900d407
	.xword	0xcd525b9ae81dbfd1
	.xword	0x2bd0916dc1b817d7
	.xword	0x643698337e1eb4fa
	.xword	0xe533cebdbf10523a
	.xword	0x3816864ae8d299d3
	.xword	0x03783f30b300f4f8
	.xword	0xccc045bad8b2ed06
	.xword	0x2b13d9ba19143247
	.xword	0x9c49a747d4e49fe0
	.xword	0xb7aeb208ee2ff87c
	.xword	0x4c0789400220b4d4
	.xword	0xebbea0856efb0214
	.xword	0x2d3538683f74444d
	.xword	0x8ca3ca370ba97971
	.xword	0x417a6d00347b2746
	.xword	0x7d10d85849048f3b
	.xword	0x64540cb90694cf7e
	.xword	0xd0ac7f8478d9d047
	.xword	0xd6fcd032f72e3cfa
	.xword	0x096bd5d16f5b401f
	.xword	0x0f26cce85cba4702
	.xword	0xf45678cbbb09b7cc
	.xword	0x328c3f1e0ddb6b59
	.xword	0x49722d12d20ffd64
	.xword	0x09beec457c8f19d5
	.xword	0x05b598c4bceffbc8
	.xword	0x767162e475225224
	.xword	0xd119e9b7a2869efa
	.xword	0x144e1c4c73e12879
	.xword	0xae1d54f52c6fdfd1
	.xword	0x3447377d2bb71934
	.xword	0xc648df9e74fd71d1
	.xword	0x2c926f40304c5499
	.xword	0x0cf8a562f2a0717e
	.xword	0xb87dd2a852c1f323
	.xword	0x54c1f5c86cc38299
	.xword	0x5b6a0299ba5be9e6
	.xword	0x8b52b2783440d6b0
	.xword	0xb9e82d7ce5f05def
	.xword	0xfb7770e8f2112133
	.xword	0x1c5c6f77ccd05d0e
	.xword	0xcc0d0f5e590c1c4e
	.xword	0x80aa09f4039c4e73
	.xword	0x73e7396694896a5f
	.xword	0x5c4157945036dcbc
	.xword	0xeb21eff99f0fd8fc
	.xword	0x56cfb9f662aec005
	.xword	0x2fe53c95260ea093
	.xword	0xc48ddcb95d2923f8
	.xword	0x0a3fb2212f552e45
	.xword	0xe30fe1e5741e3d47
	.xword	0x1b65f37d4efcf45f
	.xword	0x7ca6d46a588c04c5
	.xword	0xed5ed5bddf82295e
	.xword	0xfab9e17f1b87bf1c
	.xword	0x2df2aa8f479ecb65
	.xword	0xa0942a0a974ece4b
	.xword	0x1911b7f916b10185
	.xword	0x141ee9bd9b463590
	.xword	0x789704ce163643e6
	.xword	0x76a004065d72a6fd
	.xword	0xf2a03da0f95668bb
	.xword	0x2d21b3d09b7a0f35
	.xword	0x53626484a6a97692
	.xword	0xf7bbc52ff802dac6
	.xword	0x45df45540ff73691
	.xword	0x56b28e2fff80cfe1
	.xword	0xb8785a0533968d37
	.xword	0x61e83ac826926bb1
	.xword	0xbdd56af701250a1c
	.xword	0xf96228314a160a6f
	.xword	0x648791660584a9ae
	.xword	0xb131f98fa8f5afe4
	.xword	0x6c1debfc1d51feba
	.xword	0x5c896c762b286dbf
	.xword	0xf27c663da01cff62
	.xword	0xee13f46c39b8b34e
	.xword	0x6a9dbef3abced573
	.xword	0x484af5ccaa2d0e4d
	.xword	0x79d2364c374dd60c
	.xword	0xdb2a341946ac8c80
	.xword	0x68c04a24399e3e60
	.xword	0x8fe701d085daa475
	.xword	0x895f54f8d3587a83
	.xword	0x9f755336a0bc348f
	.xword	0x17c0a4a84e509fb3
	.xword	0xde771ce5951fc52b
	.xword	0x2d766a01d1aab358
	.xword	0x05ff7a4c14cff423
	.xword	0x2f29da2dff6f85b5
	.xword	0xa2b9242f621c6593
	.xword	0x1f120b44a234a376
	.xword	0x996de95f20d42fb4
	.xword	0x43647cffee1822d2
	.xword	0x66954609d9c5a768
	.xword	0x0d40690e6e58b601
	.xword	0xf324475399773c07
	.xword	0x0b1e47a7976a496e
	.xword	0x5f97fffaa47c0a8f
	.xword	0x59908276b2f8f1ba
	.xword	0x3191132679b8b12a
	.xword	0xe9d869e9eb3336f2
	.xword	0x674404128b84cbcc
	.xword	0x95c9ced06c2d15b4
	.xword	0xe6ab56fe5f1a9049
	.xword	0x40c9f85aea1ebd32
	.xword	0xf20cc628cc023cff
	.xword	0x9e50c0fa4b0b2bfa
	.xword	0x7606b67757410bac
	.xword	0xea146f0672ea2ba6
	.xword	0x7d0bb787f78570a8
	.xword	0x5a5503e87c8bf9a9
	.xword	0xf43fc2504818cee5
	.xword	0x59b9ba30672448a4
	.xword	0x6b968c5a57d472f1
	.xword	0xf4eb4d0c25ae54b6
	.xword	0x267d9ae15ae064b8
	.xword	0x8f766ae1a662a2f1
	.xword	0x78b284dbf3ac9f68
	.xword	0x1e7017c358623c76
	.xword	0x17d03f3a222ef171
	.xword	0xd760d7bc032dcfde
	.xword	0x47c96dd3838c1024
	.xword	0x3e0c9c0d562befef
	.xword	0xcc0a82aa9c181e9f
	.xword	0x0d5eef88cb3c39f6
	.xword	0xd6c54b8ca4aaf6c6
	.xword	0x2aa16f1c80836b7e
	.xword	0x9607eaf18232b3c2
	.xword	0xfca69d3b55117533
	.xword	0x9abc709e1adf1649
	.xword	0x81bb3552cf872f78
	.xword	0x0962beb21d31509f
	.xword	0x8e8ed80be983c0df
	.xword	0x9574a1369e92bef3
	.xword	0x4f24d0fa1efa29f9
	.xword	0x5b5d8e566e989456
	.xword	0xaf2b5c017ad92831
	.xword	0x520b075048a14ce9
	.xword	0xc705d824dd125130
	.xword	0xe83719ca1f973745
	.xword	0x58142c3d4610c1e4
	.xword	0x94659091d2749009
	.xword	0x37bdf486b19bac0c
	.xword	0xe928b8af22ffc8ba
	.xword	0x15f793dbceb1ccda
	.xword	0xaffd7cb4c5e362c2
	.xword	0x73dd36d6e6737a9f
	.xword	0x1586f42566a0a20d
	.xword	0x040d22d22534c7c1
	.xword	0xa8bb053afc18fc63
	.xword	0x3307e2a0e598bdd6
	.xword	0x0f7e22fa0a13acde
	.xword	0x1459e5dfff3ecfe1
	.xword	0xbbbc1e61daecba8b
	.xword	0x1b043d476e83af2f
	.xword	0xa04bf591be44f154
	.xword	0x4342082012846e95
	.xword	0x0e9a69636118bdd1
	.xword	0x821f34233539237a
	.xword	0xcfc519e5769d2a49
	.xword	0xcd09eb6d81b1932d
	.xword	0x4ac2dc0b2a9aba8f
	.xword	0x1bd09fe0e09fb67c
	.xword	0xb45d9296934990b3
	.xword	0xe08cd14dd45df177
	.xword	0x16e218426d29e79a
	.xword	0x7e06f701bb4d2d6d
	.xword	0x65a9fb27dadee6c0
	.xword	0xe607a7c236f6b9b2
	.xword	0x1347fd5ff3664f88
	.xword	0x1d99c4175b55226b
	.xword	0xfbb5725dfedf9b59
	.xword	0x756fe6077ad35e23
	.xword	0x654db59e84175447
	.xword	0xd1c6d58b59f55fc0
	.xword	0x6527d94f278cce25
	.xword	0x316f44f7c1564d3c
	.xword	0x293272b7da52dd5c
	.xword	0xd62995cc9b4f266d
	.xword	0x1c1f5da1b0ff28ea
	.xword	0x623f465b98a4dc5a
	.xword	0x3b604e61e5f4d101
	.xword	0x93bb3827daf15130
	.xword	0x545a7d9750484092
	.xword	0x1ed11140ecb7ecbf
	.xword	0x32e855c845c5f91d
	.xword	0x52d4926931ee8507
	.xword	0x47d87cafa9c77701
	.xword	0xad7bf7a12d431d72
	.xword	0xae6bbe97fa73d057
	.xword	0x3d28b2760e4043bb
	.xword	0x9f77604af22018ef
	.xword	0x47a6c819dbaddee7
	.xword	0x7601fb1ebf2ce1a4
	.xword	0xb9f3158406a4dfa0
	.xword	0x029346b65460dd28
	.xword	0xdad07a6e8b596838
	.xword	0x7dbf5bdd8a969f75
	.xword	0x1f8a91b691e3ec83
	.xword	0x62b523b49c0bc4c1
	.xword	0x066a57944c279e8b
	.xword	0xdc2457a0584df00c
	.xword	0xb44553bff54790d3
	.xword	0xd8c367a864761e46
	.xword	0xe7f9aff10e46833b
	.xword	0x03e748c69c6caee0
	.xword	0x0ec4ef3980813aff
	.xword	0x2ba3b77856b604d4
	.xword	0x1dae5f59e9086284
	.xword	0x793c21edda149872
	.xword	0x612873ebd9dacf80
	.xword	0x2d68c03c2f2de76b
	.xword	0x2f60a3a6ec0e8d75
	.xword	0xca787d6b12b516ef
	.xword	0xaaaeb060a4f1b078
	.xword	0x744ad379638afb00
	.xword	0xd6fef21e9c93421b
	.xword	0xb87f39d20a875a12
	.xword	0xba9ae2dd67cfe8f2
	.xword	0x4968d38f7b7716b7
	.xword	0xa48fc43841c5a6a5
	.xword	0xca79cc398eebf571
	.xword	0x11f038afd1f0b115
	.xword	0x0ac36357e4a0e21e
	.xword	0x535fbfd88e3602f0
	.xword	0x5ca63bb7ed4d7e6f
	.xword	0x6e27de49f7f51a37
	.xword	0x538d238a1f792423
	.xword	0xa18023a37e343f2c
	.xword	0xfbf799e884328129
	.xword	0x0d1dccf3ed0ad12d
	.xword	0xbd2539ded3b09c73
	.xword	0xf957859216a6022b
	.xword	0x89723fc71027290d
	.xword	0xd39eb7e799890932
	.xword	0x6df08998ed4c2044
	.xword	0xf5a6edf0a8a9fd91
	.xword	0x61a295147f3ba5d6
	.xword	0x76a2b4a819297d19
	.xword	0x00f90d103e245e3a
	.xword	0x5f92ae7aa6b6a669
	.xword	0x36e7324c9e2df67e
	.xword	0x54df22ccd0d8e3c1
	.xword	0xa9935d406f590699
	.xword	0xaf96be1f5fae83c9
	.xword	0x2589a8a1fb1fc55a
	.xword	0x0303715764a5d83d
	.xword	0xdba40d6c957c287d
	.xword	0xfaebb3fea3130828
	.xword	0x17c17efdb068e8f6
	.xword	0x734d15143bb85993
	.xword	0x70e9c2b926f7f643
	.align 0x20000
	.data
data_start_5:

	.xword	0x523b15ca16ac56d7
	.xword	0x8607237fadca5d5d
	.xword	0x3597e1168ff0b4e5
	.xword	0xa5647ecc085590a0
	.xword	0x32c482e4f94fbce9
	.xword	0x6e58f497f66116d0
	.xword	0x4b73b0c05e4321cc
	.xword	0x1c4bc4af5aa126e3
	.xword	0xc1cd18a66cdc9239
	.xword	0x8b187db02f997049
	.xword	0xd3a2a658ab74c9aa
	.xword	0xe3a4c5e88d691495
	.xword	0x22faad957a2bde05
	.xword	0x00233585748b9660
	.xword	0xdd7903d3a9684789
	.xword	0x5812f8e0aba8228c
	.xword	0x5bfe88b33bce6293
	.xword	0x83d70d538b452f85
	.xword	0x2ab90d541ef79aa4
	.xword	0xb2bf1ef7a4f1e476
	.xword	0x0a335e272662b224
	.xword	0xd6605ba29dfc43d4
	.xword	0x55df55ebde312679
	.xword	0xca4cdb1a02744589
	.xword	0x35d9c444a173d6ce
	.xword	0x5061e8dc5a0ed01e
	.xword	0xa7fd46f0c5b78799
	.xword	0xe2826140442eff8c
	.xword	0x6ae9e4a7c6e02906
	.xword	0x275eff725b4cd615
	.xword	0x174435e6b5f20912
	.xword	0x936d75e77b3c6edf
	.xword	0x85312c39692f2265
	.xword	0x7b73b34ce667dc51
	.xword	0x1569b71dd79f2cab
	.xword	0x733b6683d4e1fa1b
	.xword	0xe448591d84c28087
	.xword	0xc158d9e805fb96ab
	.xword	0xb1ae9e7bcd173468
	.xword	0xc8a039a1269af701
	.xword	0xd274f8e9778bb123
	.xword	0xa07fc1ad412bfaed
	.xword	0x91c3f89d4ef25b37
	.xword	0xbd0735ae9ded7960
	.xword	0xdfda9cb2c8881447
	.xword	0x80fd2d8ac11e60f3
	.xword	0x3abed422730ac34a
	.xword	0x814cd106de4e9cff
	.xword	0x6d7e5b4ba52972b2
	.xword	0xdd3baf81ec1e9c9c
	.xword	0x689eb5f561e5a508
	.xword	0x8f8b413922a83fe2
	.xword	0xa3b1c404ad63d4de
	.xword	0x1cc4318e5f7617a5
	.xword	0x537d4f4751ca7f89
	.xword	0x9da3a992d9cba7cf
	.xword	0x8bf6b3b1f10cc5fd
	.xword	0xd63de2c693b5cc23
	.xword	0xc3e90657a39265e5
	.xword	0x778e4a6b6ab471fd
	.xword	0xb746894c382709cd
	.xword	0x912ff1a19bd07f2c
	.xword	0x3d9d05b312ae481f
	.xword	0x2af3f8a4ef41405a
	.xword	0xca59b0e20d92024b
	.xword	0x8620b99af512a8ae
	.xword	0x9df9ddcf9e2e252a
	.xword	0xffcf092e4b81f825
	.xword	0x871b67ab045ce356
	.xword	0x8a4ee2ac33bb0015
	.xword	0xd8a65c3b289c36b5
	.xword	0xe9b3901dd52f915b
	.xword	0x71ec1afc7e5bd811
	.xword	0xfaf85f7bdc47b00b
	.xword	0x386fdb5195c7547f
	.xword	0x9bbb90a5751a407f
	.xword	0x9411c6f32c9d5926
	.xword	0x7eb01e4be50c7421
	.xword	0xde116e096482c930
	.xword	0x07f21028988d6830
	.xword	0xb056d112e4233c26
	.xword	0x99c39f2d367e1c9a
	.xword	0x800907506a481d86
	.xword	0x25ceec2485a4e27b
	.xword	0xf89e9bc65cd0f47f
	.xword	0xd62f111bbcd95998
	.xword	0x08137b03d67a168f
	.xword	0x7c944757d68c00f1
	.xword	0x09c299b016ace0d2
	.xword	0x5d87fd60dd4a5c0c
	.xword	0xbdf34ac0c1b5f09f
	.xword	0x2a9eab623c6c9be4
	.xword	0x3307bc44e4bc255d
	.xword	0xf5aa99d3c3b7c66c
	.xword	0xf83f25c15344ae7d
	.xword	0x1cdf5af2e336152c
	.xword	0x6da5388d27ba38bd
	.xword	0xcd3cca53aa256fa5
	.xword	0x263b9ffb84d04f3f
	.xword	0x67f1bf2af9178ed1
	.xword	0x4e0d90c6013328e3
	.xword	0xee85386d2eb523e8
	.xword	0x28a15b68a2e749a7
	.xword	0x96273dd73d35a9d8
	.xword	0x593060a7e2918f18
	.xword	0xb069e9ebb25b48b7
	.xword	0x7943c4fa6598d819
	.xword	0x2a4307a90230a770
	.xword	0x6c9b48df4c7f3307
	.xword	0xc1b1aa8faf8f4a33
	.xword	0x99f3174e0efd53ce
	.xword	0x5f33a9dfa96f8903
	.xword	0x48b4fb9421e53383
	.xword	0xdf59951ad596a97f
	.xword	0x366ee101b0c806f7
	.xword	0x1cded012fa09d5e4
	.xword	0xc20c9812e37f2b93
	.xword	0xff784b345d2539bb
	.xword	0xe94722bd65cefa2c
	.xword	0xc0fb745c29b85afa
	.xword	0x9d61a21c3edf30e7
	.xword	0x810c055fe75d77fc
	.xword	0x0f27954c0e62efd5
	.xword	0xb2ea905357cc5835
	.xword	0x65563e43f8478c95
	.xword	0x77b987d7c4432881
	.xword	0x8891198801bbd722
	.xword	0xf4105f0a07b73d36
	.xword	0x439e0697fd320c3b
	.xword	0x9d645481e002cc83
	.xword	0x22695cb05780c3fa
	.xword	0x6472055a86dfc6fd
	.xword	0x8c18d27ebd4620a0
	.xword	0x2a640546490ef3d1
	.xword	0xb8fd67a35f628d08
	.xword	0x915855f05a815fc4
	.xword	0xb2e18da764a74c4b
	.xword	0xef8d99757fc220fd
	.xword	0xa5e53a1c2468fccf
	.xword	0x64bf98094885db25
	.xword	0x5445d214526a8819
	.xword	0xea9290dd37f037bb
	.xword	0xec9e6ccfc2d2207f
	.xword	0x3fcd217fcc266f80
	.xword	0xe7047c4829aea990
	.xword	0x8c68f5b42d550031
	.xword	0xbd965d1b3e7d6b6e
	.xword	0x07af422c5945d700
	.xword	0x955cba288c2bf22d
	.xword	0xf35cc0bf58afc96a
	.xword	0xc78f454f9c8f7327
	.xword	0x977ba76c17901538
	.xword	0x6e0a949ff9376687
	.xword	0xd858440f17d956ad
	.xword	0xc01e10939ed7f827
	.xword	0x333c0d2c2093b657
	.xword	0x03d3b6ad1884fe91
	.xword	0x06d21025f5f1ce7f
	.xword	0x78ae2e07f43d9b59
	.xword	0x149669d2f14d4d8b
	.xword	0x991ecb2627515f0a
	.xword	0xfd9990dba57bcdd5
	.xword	0x0bdf9a662ddcf8f1
	.xword	0xcaff53067e54893a
	.xword	0xc6960f2bb1b1560e
	.xword	0x9eb02451ee9507bd
	.xword	0xacbce9d5e72590dc
	.xword	0x2d6bec66d4c30a39
	.xword	0x3b7f467e27d1f30b
	.xword	0x8f8da8c2e6be3a7e
	.xword	0x0ed4fc01e903042b
	.xword	0xc3b20fbd6fa0ac23
	.xword	0x3553deb9089e85c7
	.xword	0x262217618de8ed53
	.xword	0xcbe777c7dd59c911
	.xword	0x6ac4a35f3a972359
	.xword	0x5dadf543b635055e
	.xword	0x57726f51672e51a3
	.xword	0x01ca2202c731b8bd
	.xword	0xd5e31f720cc71e48
	.xword	0x79eb56a06f1a1a58
	.xword	0xec12907ad8f52183
	.xword	0x4db6c9eef37745a7
	.xword	0x1e45bafb7d20078b
	.xword	0x2b07ce92ce9c9f60
	.xword	0xe3ff8e91fe4fe3d6
	.xword	0xb34f0620c2424692
	.xword	0xc5ae47dcba759081
	.xword	0x955b19ecc2938e03
	.xword	0xeb93f9626eb9ee55
	.xword	0x6c61ff0d8530b501
	.xword	0xc300992e2a46cb6c
	.xword	0xfde6b1a28cdac7c0
	.xword	0x7e0b376d77db7f10
	.xword	0x9e4ae463d949f06e
	.xword	0x59e51c7362505ce3
	.xword	0x1fd5fc96f6e8593e
	.xword	0xaf626171e6cd23ec
	.xword	0x5931e48496431eb9
	.xword	0xd063da3ad3a64715
	.xword	0x01071f5843d01d45
	.xword	0xce1dca6c3b941487
	.xword	0x8fea4b0938c367ea
	.xword	0x6dc4523192c8c413
	.xword	0x4005b4e99dc5638d
	.xword	0x5a4c2ead4bc64110
	.xword	0xc7939e4105516196
	.xword	0x1ed659e88d7f70da
	.xword	0xd4b7c98a4fb70a26
	.xword	0x271e761b4721ea48
	.xword	0x62cf0cfe3bf38e9c
	.xword	0x0179c3ce41f09fcb
	.xword	0x9163b214ebb2c283
	.xword	0xe1b29504d515442f
	.xword	0xee2dfc04e0d9b25d
	.xword	0xe6e4f8cafd6a4a4f
	.xword	0xcf17f53bfd591736
	.xword	0x368462f10b7db807
	.xword	0x9b7dbae4b0375a3e
	.xword	0xce24976db63fc554
	.xword	0xa32762da822c9a56
	.xword	0x428b70cb89548170
	.xword	0x2647fd04180b92b5
	.xword	0xf1001a38478783ee
	.xword	0xaea321829ed7eef3
	.xword	0x8c30f73d2ac295de
	.xword	0x023fa988f52c6eab
	.xword	0x11818b396ca80b31
	.xword	0xaf825247f59f8634
	.xword	0xed522994ca4fefd2
	.xword	0xf98103ccbb54ba9c
	.xword	0x07c840b917ea80ce
	.xword	0xab3fe8d2fca14b53
	.xword	0xe26e9abbb81b28bb
	.xword	0xc5ede784206929ba
	.xword	0xeaf71d70d50839d5
	.xword	0x2aa80c4408b3e6ac
	.xword	0x0a630339fdc0fca5
	.xword	0xe95b61883e64a77d
	.xword	0x7c2442940159fb2c
	.xword	0x0addad675c29256b
	.xword	0xca78f351adf38824
	.xword	0xc24e0db95e402792
	.xword	0x0c75082c789fa584
	.xword	0x7696152cbf050fa5
	.xword	0xc61f2e96f243c2a9
	.xword	0x11b3ae048eccd85a
	.xword	0xa1d006135747267d
	.xword	0x923ca9f30ee7316c
	.xword	0xfbeb2e81e7b7b81e
	.xword	0x9f26be4e4f195bc8
	.xword	0x31e89a4eaa3d7bb4
	.xword	0xf4c24be7aee25924
	.xword	0x8351482ed9806f87
	.xword	0x3490ddad8008b096
	.xword	0x7e9a08031a64e6e9
	.align 0x40000
	.data
data_start_6:

	.xword	0xc5d81b713bf82678
	.xword	0x11ee27c6593b46df
	.xword	0x1afdb7e229ee4d07
	.xword	0xca64263903ae0162
	.xword	0x3fcc3d55f9998b4a
	.xword	0xbd79b8ed8e02ea2c
	.xword	0xcaa89bb040a6f386
	.xword	0xaf6b472a65c51d6f
	.xword	0xc95888ad5ca0f6a8
	.xword	0xb88d15fedd5e57b9
	.xword	0x67245cf46e5315a6
	.xword	0xa9ac1cc6f9b0df06
	.xword	0xe5cee3981f2e01c3
	.xword	0xafc1eb34281f0b9d
	.xword	0x0c17f2fc9a26a406
	.xword	0xe400e1849595cecf
	.xword	0x604974bd45c16bc1
	.xword	0x470cb1c79ef1d86e
	.xword	0xa18f4775103c6666
	.xword	0x2fcc30124a40a1a8
	.xword	0x4eaf730559aa7dbf
	.xword	0x250ece4c7f37fe12
	.xword	0x4ed996e808cabf7d
	.xword	0x5ff4101a6f6dd122
	.xword	0x3963f5586c3346c0
	.xword	0x33b655b2c354ea4a
	.xword	0x1b87511f80c49bea
	.xword	0xc7a5637533d9b506
	.xword	0x72b451012ef9e2f3
	.xword	0x4a4791476ae3d3cd
	.xword	0x27d248da8bd3c161
	.xword	0x78ca7570ddf4a7ae
	.xword	0x228a1ee7beb7143b
	.xword	0xd75c851887ca1168
	.xword	0x835b417ac264f15a
	.xword	0x294aba7cfe57ebf8
	.xword	0xb16d08808fae5d5b
	.xword	0xeaa1b0274cf3afe6
	.xword	0x8f5806a643375a5d
	.xword	0x858ca95cd551f0a3
	.xword	0xdb9ff9feb1fc5009
	.xword	0x89a463f184a5e213
	.xword	0x40f7822a370b067a
	.xword	0xa70f60817488ef7c
	.xword	0xb849c2eb4149f736
	.xword	0x0e1ab4af0d8497b5
	.xword	0x328472ef8b8067bd
	.xword	0x52c0cc3d48371889
	.xword	0x9d081f4ec06bd627
	.xword	0xf8f159c6be9cc6b5
	.xword	0x0b6128749f6b0689
	.xword	0xfd10027b032091a9
	.xword	0xbf2e31d0e29fd9fd
	.xword	0x2ce6ca77e7b828ff
	.xword	0x3084bc5e2eae4e0a
	.xword	0xfdfabbf37264abfb
	.xword	0xb9733684140d06ab
	.xword	0xa7ae53239f58124c
	.xword	0xf3499356ce0650f9
	.xword	0x47c9b09cbfd3768f
	.xword	0x058562a13d5f9659
	.xword	0x10d697408148bed5
	.xword	0xc45245a05082800e
	.xword	0x9c36f988ff149412
	.xword	0xd48acce2b8631ab7
	.xword	0xfddb5e4c47f8cb53
	.xword	0x99e4330789efdbae
	.xword	0xcee50b9e77a5b72d
	.xword	0x1c433c31f524f7f7
	.xword	0x1bd52d403f25c250
	.xword	0xf74fc25be5b5ef13
	.xword	0xab215b6c0c7468c1
	.xword	0x13deffd76bbcda55
	.xword	0xb4e85d934f63826a
	.xword	0xa5fc2ff0cdfcd1ab
	.xword	0x2d05dc41202ee9dd
	.xword	0xac0a3167c37cfe0e
	.xword	0x5a14dcf462e78f7e
	.xword	0xe783a6d5fc2f3737
	.xword	0x46db6dbafa224688
	.xword	0x4a83dc846b92b2a3
	.xword	0x51c1b323433a6251
	.xword	0x7d72526808a6b129
	.xword	0x7c85dfb9ddcac8a3
	.xword	0x97674ef052bbc165
	.xword	0x135756d0399b8c48
	.xword	0xc57c1d7fe45e2dbc
	.xword	0xdd986f43e7a24b9c
	.xword	0x316299a12ebe24b9
	.xword	0x41a18dd185f4e0b5
	.xword	0x591b05b5111a31ea
	.xword	0x104869e59cdd8ce9
	.xword	0x74669ffc87663fc8
	.xword	0xc2a7cee0c41dab26
	.xword	0x08256833387c7591
	.xword	0xf7ac5e2e31496d5d
	.xword	0x7520dd087a73d261
	.xword	0xb97f4a26401268c9
	.xword	0xe24573a0dd627c5e
	.xword	0xaa14b2c226fb2591
	.xword	0xe1c1902285092138
	.xword	0x471e821fc9eb5946
	.xword	0x4ca37234cda76e18
	.xword	0x4aa295587cbca3b8
	.xword	0x4af5daddcac1806e
	.xword	0xbb8b0500cd2d0457
	.xword	0x8bc4c1267bb9dd56
	.xword	0xf702160ef321b706
	.xword	0x27ba031eec27b179
	.xword	0x6a254b08a0d7be8c
	.xword	0x291ee2aa8a2235ac
	.xword	0xa1d8bc65147b581d
	.xword	0xee0aaab7bf120cd3
	.xword	0x85ae46ed3317ae8f
	.xword	0xa233405fb5a47b7e
	.xword	0x04417f1f9a6efe17
	.xword	0xfae401507b524e79
	.xword	0x97e48ab4487a24b8
	.xword	0x9f3a9f05d3438ee1
	.xword	0x0314f60cefdf1a9d
	.xword	0xf7c3e2eda9695938
	.xword	0x9c71230ab16df3e7
	.xword	0xdd06d72d478fb129
	.xword	0x66fab4b332acf77a
	.xword	0x30383d4f2f1a32c4
	.xword	0xc1fdc1e2e57e0f74
	.xword	0x327ac1b8049fbdd9
	.xword	0xd29a5d5c99b6ffbd
	.xword	0xa37ae609ce68fc69
	.xword	0xfdfc4edb1d794e6f
	.xword	0xa5c407fc37e232c4
	.xword	0xd35d50d6ab153329
	.xword	0x5e1fd8c80d7d745d
	.xword	0x13122d2e081fd4cd
	.xword	0x97d3297599d9717a
	.xword	0xa99a0af0759670b1
	.xword	0xd2a0d5b6cad5a477
	.xword	0x404994a4ea5dd130
	.xword	0x5e29065d365f939c
	.xword	0x3defec9e4e40da04
	.xword	0x5ed5e7053293a9a3
	.xword	0x0c9105b6b1ac9985
	.xword	0xc97cbc8a24715974
	.xword	0xdb716184eb109c65
	.xword	0x68256c831679b157
	.xword	0x56f0040d189577f7
	.xword	0xd8239fd272a65e97
	.xword	0xfb01ed7f625aba41
	.xword	0x410fb1ba779c3380
	.xword	0x6ebba8cb494f7690
	.xword	0x20dcf22a718b9ea4
	.xword	0xf44ba1be7b475f8f
	.xword	0x6702f2a7a40a53d4
	.xword	0x3fc6006be6cb06df
	.xword	0x80e985c42a48c8c2
	.xword	0x3a0dbbc40fba3dc4
	.xword	0x25613fd645ffd078
	.xword	0x72137a62fcc2b7ec
	.xword	0x91aab69ea7ca2351
	.xword	0x3a429564ba6209ba
	.xword	0x9b81195a102d85b0
	.xword	0xaf6b9d145c6a9c12
	.xword	0xe71d03bffaa42683
	.xword	0xf3624765a1cbcc07
	.xword	0x51d8a2dee5d3b7e1
	.xword	0x6d10d1485e8c6d1d
	.xword	0x60870dba5a114734
	.xword	0xa9f208936a64933e
	.xword	0x13a29d0e3ec4ef55
	.xword	0x95fd5537a51b8d98
	.xword	0xea6de48e3451c975
	.xword	0x619b9409ce15eb40
	.xword	0x1c459b4dc2417ab8
	.xword	0x17249f4d2db71c5c
	.xword	0x29ee8af7ea48a34f
	.xword	0x3bba83f00b25c9aa
	.xword	0x7848c4ae4f592428
	.xword	0x2b72cf13b42ffd4e
	.xword	0xf9f40343ca7d1842
	.xword	0xea112997a9cb5be5
	.xword	0xbc624f67714cca3e
	.xword	0x1635591d48b8ac15
	.xword	0x5f4ad297bb3575dc
	.xword	0x5834192627612573
	.xword	0x0c5fc4a09454ce44
	.xword	0x419a6cbf34c872fb
	.xword	0x2c1d7b2a1e8e6f1c
	.xword	0xe16b7759813ec00c
	.xword	0x3eb8cb7ed9a8d4ba
	.xword	0x3f233e52bfb5a6c2
	.xword	0x72c0d39eaec35e85
	.xword	0xbf4eaf4e9196c2ae
	.xword	0x492fc8dd17ba9c36
	.xword	0xe1a4c13b32c4cc85
	.xword	0x658705d82ecc395a
	.xword	0x4a7988020823f508
	.xword	0xa0ba4b1adff3fcbc
	.xword	0x050c6636a7de2b12
	.xword	0xf1c82def9db2b9ec
	.xword	0x106e8b13274c4f9a
	.xword	0x9b6042a7cd9badf8
	.xword	0x1aa756548b6d28d5
	.xword	0x580775e345abaf22
	.xword	0x615f8d2d8f894afd
	.xword	0x4084423b33cc3f16
	.xword	0xfec7776034990e3d
	.xword	0x05ecd4f7369d0b6e
	.xword	0x6f2383e19245f36f
	.xword	0x179b17dede96c15f
	.xword	0x042a8ba0c098ef9a
	.xword	0x256f8047629bc37a
	.xword	0x6dc8a1f4ae006534
	.xword	0xe7e685761f990a97
	.xword	0xa872e9ad377d4de6
	.xword	0x39402dd8f0507be0
	.xword	0xfc1bc668cb4c44a2
	.xword	0x00dd8e6feb0c38ec
	.xword	0x1309db80f58da787
	.xword	0x87092f50980a59ca
	.xword	0x7905c6c31dc7c472
	.xword	0xff5f967dfe2f087e
	.xword	0x2b81d643741c0b4d
	.xword	0x411b92f065e5d31c
	.xword	0x059b752a67a2431a
	.xword	0x1cb5787210cb0567
	.xword	0xf9a21241da2dab48
	.xword	0xac85f5421765f097
	.xword	0xd5f7f7baf05b8cfd
	.xword	0x2bbc7d0b47303c54
	.xword	0x0d5ce551ea31523b
	.xword	0x978259dc2eabfc6a
	.xword	0x15ecd8d4fff9e07b
	.xword	0xfb64e63d2fa3cc4e
	.xword	0x33cefb9c57d177bc
	.xword	0x20e774be0b611930
	.xword	0x5debed655cb83220
	.xword	0x2ec79bd9b36526d1
	.xword	0xcc60bde03599f81f
	.xword	0xd88b970779a2ceef
	.xword	0x87baef891cc42196
	.xword	0xc07973481a21713b
	.xword	0xec745d18f0c9b069
	.xword	0xe9fc61adcdd00f91
	.xword	0x0519a6beb0c8f558
	.xword	0xc8095270c78a7dfa
	.xword	0x78a69248be573524
	.xword	0xa4866dbbab8fceec
	.xword	0xf185e80b3e864f05
	.xword	0x56816a0330fe4755
	.xword	0xc92ff9f5e8dd9aad
	.xword	0x46f8d18449ebec48
	.xword	0x7bad4c0bfae348e5
	.xword	0x6a4d7cc0297c57fa
	.xword	0x11229d2721423654
	.xword	0x0df756583eef5b48
	.xword	0x646c23fcf5a5e740
	.align 0x80000
	.data
data_start_7:

	.xword	0x451982e75d20da04
	.xword	0x34454b5e9ebe64b8
	.xword	0x3f1dc5698f9ce424
	.xword	0x7e6b9453a2b7c91e
	.xword	0xdf8a7fbb78eb4cd0
	.xword	0xcc7da130e3494b62
	.xword	0x2801e17cb1a4fb0e
	.xword	0x29ceabaa5fffef9c
	.xword	0xb5a9dffd4d3c3b61
	.xword	0xb2819559303d6a06
	.xword	0x372c6c950cf894c8
	.xword	0xd94f38e731961029
	.xword	0x83529d77f9f80694
	.xword	0xe1efa2c5d9cba085
	.xword	0x6d03e2bd1c032b4a
	.xword	0x81a87befb244aa01
	.xword	0xa3784458bf50a70d
	.xword	0xd397057c152061e9
	.xword	0x0c6f235cdbc54989
	.xword	0x3eba9e3cfa19ba69
	.xword	0x1faec21d93dab65b
	.xword	0xfdb1585fde8dba9a
	.xword	0xcd59561a17195dd2
	.xword	0xd03308b6fc84d2bc
	.xword	0xe129a48cc3572ca7
	.xword	0x1725eb744b1baae5
	.xword	0x845c1a6f1c11d9a9
	.xword	0x075fbe23c9332225
	.xword	0x32df819248fd554d
	.xword	0x9c92dbc221026e41
	.xword	0x08254248f394623d
	.xword	0x813838711e3fe0a3
	.xword	0x1916096b6e35661b
	.xword	0x0e23f25b830db4eb
	.xword	0xadff8d09effc140c
	.xword	0x336f69c40dd1e3f8
	.xword	0x8c8e6172ba130c37
	.xword	0x9e3b94178576181a
	.xword	0xb51e3b2b2e88f92e
	.xword	0xbce25a244cf2df93
	.xword	0x075cad11e05cef86
	.xword	0x2a05418982ea2c8e
	.xword	0xbb37aeb7d23b8046
	.xword	0xb04a6ff55ca74f75
	.xword	0xd280db0b86edeb3b
	.xword	0x82623247fb339334
	.xword	0x4d03dd8f741411e6
	.xword	0x30c914510d2e872b
	.xword	0x1eedd3df06b9dc57
	.xword	0xcaac60407036c66f
	.xword	0xae2775a16cc5138f
	.xword	0xa66788d99474a59b
	.xword	0xfdb518fcd5570247
	.xword	0x550c33f21c87fd32
	.xword	0x969e2d3278a13385
	.xword	0x505c6a593b473de8
	.xword	0x2cecd3f93a940c0d
	.xword	0x5eef5ccb1ca148ed
	.xword	0x5b15608d660b969c
	.xword	0xfaa40b1d65c92216
	.xword	0x8fc336ddb63240f8
	.xword	0x0f2ab3a9a7373bce
	.xword	0x053665eb8fc987a7
	.xword	0xec1851d551b439ac
	.xword	0x2cebece36678fe4a
	.xword	0xb593df5f0fe99877
	.xword	0xf6fe5716ce82c0a7
	.xword	0xd36139c078b82956
	.xword	0x8a5a9d7039aa84b2
	.xword	0x4b2127d640c1b4e8
	.xword	0xd4c4e0bcdd6c5b0d
	.xword	0xdc1335dee4570c26
	.xword	0xcdf6feef8a7457c1
	.xword	0x397bfa1bf413d8af
	.xword	0x59a3345cd1bcae39
	.xword	0x9494f568199994f7
	.xword	0xaaff9d532914792a
	.xword	0x47f8c16f9b4bc3ac
	.xword	0x2fa348c65b00420d
	.xword	0x537faf4f3f6e3c4d
	.xword	0x5ffbc539bfad5d42
	.xword	0x3d6014a6b10ab848
	.xword	0x348aade4826db806
	.xword	0x9e1f2adc58baaf69
	.xword	0x566b2123c6c2c381
	.xword	0x9e00d2a27a429d06
	.xword	0xef32ad8a406548f3
	.xword	0xa928f6621b4d5c04
	.xword	0xfff4f4da95d5385b
	.xword	0xf245fbc2e031b7d2
	.xword	0xfdf0f67b4ba916b2
	.xword	0x0692b0ed27662742
	.xword	0x14aafda58f76480f
	.xword	0xc24b949eff1e08bd
	.xword	0x6a8c478181097a2d
	.xword	0x9937bdf86e808366
	.xword	0xc14f15e90c555de4
	.xword	0x3a103e036713abe4
	.xword	0xf2d21efac0915b10
	.xword	0x295cdb03bd9ccdb0
	.xword	0xdc865bf1f3500284
	.xword	0x5abd5a2703c43cc3
	.xword	0xfa33ff47b4cbee05
	.xword	0xd131550100146d8d
	.xword	0x87d1da90d95cec69
	.xword	0x53e3b4257ab61cf5
	.xword	0x52b08c5e42c20ed7
	.xword	0xbebd31129438bf6e
	.xword	0xeb4a1c29214fbbb8
	.xword	0xf51bcd1a6abb175e
	.xword	0xf404e4a6422bdc39
	.xword	0x94f48b2d0622fdca
	.xword	0x636c494e00286ab0
	.xword	0x4ae29842bc5c17d5
	.xword	0x39a978ac7bb2c3be
	.xword	0x0e14b2052559e26e
	.xword	0x4977077cb1471d93
	.xword	0x1119958784c634fb
	.xword	0x3c7a3071f892f05d
	.xword	0xa57ca508c330eef1
	.xword	0xbfa485522d566f5d
	.xword	0x9354953b5e55fab3
	.xword	0x095a8a1c3c775a3d
	.xword	0x0a60af67ff6eaa90
	.xword	0x76d9cd6731c35f47
	.xword	0x22d8714c999e9f83
	.xword	0xfcb2e10bfcc960ec
	.xword	0x76a6882761f175f5
	.xword	0x57a85021189fcd35
	.xword	0x4b650df08578272c
	.xword	0x844b6972ed8bf82b
	.xword	0xfd4c898073244909
	.xword	0x4c49c35189fc883b
	.xword	0x356a6b63079cd3c0
	.xword	0x750497fd79f13e1c
	.xword	0xf36ce524c058e98d
	.xword	0x08ce0fac03fe7f58
	.xword	0xe9c6d279ec537201
	.xword	0x97740b7fab36f9ca
	.xword	0x5a42f35a7cb8ad39
	.xword	0xcc0d6e6dbd9bde8a
	.xword	0xf91d1e871942ef39
	.xword	0xdf75d690e20087d2
	.xword	0x006652860c6a3d3d
	.xword	0x8f656c73391a8a1a
	.xword	0x55c61d255c246e2c
	.xword	0x7eb82ee0f97076ce
	.xword	0xee509a162480383f
	.xword	0xf1ef3c6793f1fef1
	.xword	0xae2f201a3779406c
	.xword	0xb0611cbdd94c3dac
	.xword	0xf6177089b0d56697
	.xword	0x09577c6aa3f50718
	.xword	0xd2e2c24a28f08da4
	.xword	0xd20022cd8b77cd8b
	.xword	0x5016e937bd251e83
	.xword	0xa6dfda596c8a821e
	.xword	0x129279883663e994
	.xword	0x73aed3fb123b2c19
	.xword	0xd6e7c89d40fbc62a
	.xword	0xbbf3a4ed55ca69da
	.xword	0xc3127e60bcdc05a3
	.xword	0x91ee0b55e7cef4fe
	.xword	0xdf07af040b939751
	.xword	0xf996965a13270fd3
	.xword	0xc55068b1337e380d
	.xword	0x5511897e4f79c49f
	.xword	0xf4db918dca391fa3
	.xword	0x70d16996564078eb
	.xword	0xfef0d17b96c63a7c
	.xword	0x867f31fb4655de38
	.xword	0x6c8fbfba0c799e31
	.xword	0xfcb101062ecce97e
	.xword	0x99b099c377233d96
	.xword	0x7ee49d1b16653948
	.xword	0x3a0d2f7b60ef4d8f
	.xword	0xfd1d0dafd7d8d29c
	.xword	0xdfeff686dce06bd7
	.xword	0x72ce2fb53a75988f
	.xword	0x32fd9f169fb63ba7
	.xword	0xbb8088c91984de42
	.xword	0x72912fe6269069a6
	.xword	0x0d7bf8fdc901dc8d
	.xword	0x98d4b215fd020141
	.xword	0x0bfab6c91b119c91
	.xword	0xe2b84e8759c888c6
	.xword	0xdf3597c11156df1b
	.xword	0x388db4f57d884f49
	.xword	0x4045c369dbc4096c
	.xword	0xd7adcf56b719d4f3
	.xword	0xa396a99556d55405
	.xword	0x9d473a4ca255fe87
	.xword	0x45cec4be41e785e1
	.xword	0x75856847b73ef828
	.xword	0x38e53d994bc1fcc6
	.xword	0x167b71fc04ff26e5
	.xword	0xa2cdb1259d157c21
	.xword	0xd98777392811b732
	.xword	0x5937edb58ee9eac7
	.xword	0x1addefd892358440
	.xword	0x2427ea4083d7b702
	.xword	0x16ab38b91df1764b
	.xword	0x91cb32015e60637d
	.xword	0xef5a315397bcc155
	.xword	0x42e8b513b3940005
	.xword	0xce7b6ed1e1891d43
	.xword	0x425918840ff35f77
	.xword	0xce5e66fc485cd492
	.xword	0x6302ecbf841e1cd1
	.xword	0xab5cd30cf24a211b
	.xword	0x6b8e6cdfbf2bbbba
	.xword	0xd532299e982f8bff
	.xword	0x836e46458eef5bc4
	.xword	0xb98f8c0618739824
	.xword	0x10fd54caabe08de0
	.xword	0x4b629cd73cb7aa37
	.xword	0x62facdcac8029dda
	.xword	0x3cc38a4b759c64cb
	.xword	0x5d5bf6d947488cea
	.xword	0xe38c6bb733bc9d4c
	.xword	0x899d21529eb8baee
	.xword	0xb58318b085213943
	.xword	0x0afc7876800d53c6
	.xword	0x5d9841441827d795
	.xword	0xaadba0f3c2002094
	.xword	0x4dd9bac5616ddaee
	.xword	0xae2d2cdd90da08ef
	.xword	0x122c5592826cb4d9
	.xword	0xba07faabbf309f85
	.xword	0x290257bfd0b8de3e
	.xword	0x3fbc24d1a9cd91a0
	.xword	0xe040bcf1e12eced7
	.xword	0xe5f33f5662610ac8
	.xword	0x51bd33fac2af86e8
	.xword	0xb2d2515e1075901c
	.xword	0x76d6fc320ba79aca
	.xword	0xdc1aead6381e2e51
	.xword	0x08baaa81e8de4b07
	.xword	0xf2ef87a8ea6a0cab
	.xword	0x9d91bb10f176c4e9
	.xword	0x483ba5c51b930fff
	.xword	0xe2ee7bbe62c2bee6
	.xword	0xa924b432c9c7a575
	.xword	0xb9a7bc8d93d3c3b3
	.xword	0x45bfda4ac905d598
	.xword	0x95b14928a3527ad6
	.xword	0xd224dcb240383632
	.xword	0x49ffa1cbb708a7e0
	.xword	0x41f7e4477ee91c5b
	.xword	0x7f3886b899b1ab8e
	.xword	0xb845802ef3910b52
	.xword	0x5f16683633d807f8
	.xword	0xf93924496818733f
	.xword	0xd5f70b53296c3da8
	.xword	0xd37da8caf0946908
	.xword	0x4a2b48860c35fea3



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
