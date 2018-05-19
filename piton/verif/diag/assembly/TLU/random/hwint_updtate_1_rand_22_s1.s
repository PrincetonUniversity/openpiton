// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hwint_updtate_1_rand_22_s1.s
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
   random seed:	498007570
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

	setx 0x5517577be207db73, %g1, %g0
	setx 0xdd01ed3d5a7710c4, %g1, %g1
	setx 0xba9a94dede51b303, %g1, %g2
	setx 0x1d35eb0d06fa2ffd, %g1, %g3
	setx 0x2d6f083474f3873f, %g1, %g4
	setx 0x57053b33a809da73, %g1, %g5
	setx 0x65c3c7decd101e9b, %g1, %g6
	setx 0x6ac2015c15112aff, %g1, %g7
	setx 0x0e89dea9175e25af, %g1, %r16
	setx 0x3c6a97f0d17a162d, %g1, %r17
	setx 0xcbb260436d28dd48, %g1, %r18
	setx 0xab089ac134abb372, %g1, %r19
	setx 0xe0a8fb3f50685310, %g1, %r20
	setx 0x51e155391b9bd670, %g1, %r21
	setx 0x97c6c71d715588f8, %g1, %r22
	setx 0x36b27b48a05b8dc8, %g1, %r23
	setx 0xe140954284ed677d, %g1, %r24
	setx 0xde280fe63f449566, %g1, %r25
	setx 0xd8069ab0e41a8264, %g1, %r26
	setx 0xa0d0392b2c013127, %g1, %r27
	setx 0x1ec6d06a5845e3cb, %g1, %r28
	setx 0x6a5f75edbd6db3f0, %g1, %r29
	setx 0x293b22ae0a4a5b50, %g1, %r30
	setx 0x38c8fd7dc2daeca6, %g1, %r31
	save
	setx 0xdb672606f215f093, %g1, %r16
	setx 0xa0040c45b0138beb, %g1, %r17
	setx 0x786353d582dcf12f, %g1, %r18
	setx 0xdf00de1e03c80174, %g1, %r19
	setx 0xc37540b5ab9e84bd, %g1, %r20
	setx 0x5ab06649d5351f02, %g1, %r21
	setx 0x776d60301f48f423, %g1, %r22
	setx 0x44e7d400c2a8e360, %g1, %r23
	setx 0x0b76f14d4aeaa59e, %g1, %r24
	setx 0x54a8b1e3f703fba1, %g1, %r25
	setx 0xefc2b82b1f5d9b9a, %g1, %r26
	setx 0x6167209b69408a59, %g1, %r27
	setx 0x0519182acdc3da42, %g1, %r28
	setx 0xb2dc044a7ae626a9, %g1, %r29
	setx 0xf903faba420d7983, %g1, %r30
	setx 0xce77219e315de032, %g1, %r31
	save
	setx 0x87cb8487f757be06, %g1, %r16
	setx 0x3945cbc32e34ab72, %g1, %r17
	setx 0xd48dad0be50c9d49, %g1, %r18
	setx 0xbba2e810baa22725, %g1, %r19
	setx 0x6c131c390a6dd1e0, %g1, %r20
	setx 0xc575f4f81e4bb97d, %g1, %r21
	setx 0x1623ef4a3964535d, %g1, %r22
	setx 0xf136cf83053579c5, %g1, %r23
	setx 0xf6e6fe3a5f9882f2, %g1, %r24
	setx 0x9d60911ddbadccee, %g1, %r25
	setx 0x362576cf128f908f, %g1, %r26
	setx 0xf7fe6ad4eeb93f3a, %g1, %r27
	setx 0x6dc7298db6da5e5d, %g1, %r28
	setx 0x05c809a81e89d7f7, %g1, %r29
	setx 0xdf9ad793baecbb91, %g1, %r30
	setx 0x3359fb1c22bbb715, %g1, %r31
	save
	setx 0x53e075ae6d261997, %g1, %r16
	setx 0xe4cb6e9efebfb81e, %g1, %r17
	setx 0xf565f346948a856c, %g1, %r18
	setx 0x504896248848d871, %g1, %r19
	setx 0xd3019ffd166d0f9f, %g1, %r20
	setx 0xe4d504944df1a5c8, %g1, %r21
	setx 0x3a19ccb5a9957d34, %g1, %r22
	setx 0x8fe75a541c31936a, %g1, %r23
	setx 0x22ff35e866c2ca90, %g1, %r24
	setx 0xa62b69527e48aeda, %g1, %r25
	setx 0x1fd53fc410e16cf5, %g1, %r26
	setx 0xcf31169ce651af7f, %g1, %r27
	setx 0xbac96dacabae07f5, %g1, %r28
	setx 0xd7e70769b485894f, %g1, %r29
	setx 0xd0906de9eb1e7848, %g1, %r30
	setx 0x82e50e8369949d08, %g1, %r31
	save
	setx 0x1570944c1eba71bb, %g1, %r16
	setx 0x47e902a208f9662f, %g1, %r17
	setx 0x7fe01727136162ff, %g1, %r18
	setx 0x5c7ef65b1294e8fc, %g1, %r19
	setx 0x04c096815e9bc5a4, %g1, %r20
	setx 0x69bcf8b958319556, %g1, %r21
	setx 0x7b65afdfbe60fcb2, %g1, %r22
	setx 0xb9d53c21764853cf, %g1, %r23
	setx 0xb9469a44f800d043, %g1, %r24
	setx 0x7c139b87316156ea, %g1, %r25
	setx 0xa93b7aeb46bb8542, %g1, %r26
	setx 0xd568bb3fb3e15ede, %g1, %r27
	setx 0x8fc662cd3cce6711, %g1, %r28
	setx 0x2f1610796f774fd3, %g1, %r29
	setx 0x53573e0a25932e2a, %g1, %r30
	setx 0x435ef82419988f9f, %g1, %r31
	save
	setx 0xd67e8285e63521d4, %g1, %r16
	setx 0x4883d0d7056a5e85, %g1, %r17
	setx 0x5b7d802cdd44d02b, %g1, %r18
	setx 0xc26bcd262f47ff10, %g1, %r19
	setx 0x22c91158ec65c5bf, %g1, %r20
	setx 0x38bca701e2bda1da, %g1, %r21
	setx 0xd81f2f0137b21bc3, %g1, %r22
	setx 0x6d636784838bfd4b, %g1, %r23
	setx 0xb3b70109cc073f51, %g1, %r24
	setx 0xe67d7d0b47e7efed, %g1, %r25
	setx 0x82cf11f7e3996afe, %g1, %r26
	setx 0xa253672914feb551, %g1, %r27
	setx 0x4937e777cb0d29f8, %g1, %r28
	setx 0x3c31d3ec561a8581, %g1, %r29
	setx 0xbc9d946b47855548, %g1, %r30
	setx 0x3893eb2c70a9dcf6, %g1, %r31
	save
	setx 0x69852e775c7cd8d0, %g1, %r16
	setx 0xc5f0f647b1a9610b, %g1, %r17
	setx 0x6dc0dd608a732d22, %g1, %r18
	setx 0x12c96c92b97eb7f2, %g1, %r19
	setx 0x4f0d5cf0a8a212a9, %g1, %r20
	setx 0x27b274f1aa30a755, %g1, %r21
	setx 0x228e2d9cc4fff4aa, %g1, %r22
	setx 0x6e7f974181145a07, %g1, %r23
	setx 0xae53eb08a9740636, %g1, %r24
	setx 0xd30c9b749188106d, %g1, %r25
	setx 0x7ffa5f88d291503c, %g1, %r26
	setx 0x96354b59d70d9efa, %g1, %r27
	setx 0xcb9bfd3e46b1f15d, %g1, %r28
	setx 0x53378bd640b0df46, %g1, %r29
	setx 0x32572b8f2ff40096, %g1, %r30
	setx 0x3585920d78656e74, %g1, %r31
	save
	setx 0x4f83f9d99a9bd461, %g1, %r16
	setx 0x3745bcf6317949fc, %g1, %r17
	setx 0xc219cf5d30bc7558, %g1, %r18
	setx 0x6916a421067a7fd7, %g1, %r19
	setx 0xe8fe1eece694252e, %g1, %r20
	setx 0xf28845d489a84f23, %g1, %r21
	setx 0x54fa7f2cf6e1a5d6, %g1, %r22
	setx 0x3db5b16e44b60d57, %g1, %r23
	setx 0x599a930cbb621445, %g1, %r24
	setx 0x734dc7a9fb8b48ca, %g1, %r25
	setx 0x7b64c48c77dc1148, %g1, %r26
	setx 0x77459784bd383b2b, %g1, %r27
	setx 0x27197566f9100e4a, %g1, %r28
	setx 0x210f987b6147b0bf, %g1, %r29
	setx 0xd83c0e8a246fba70, %g1, %r30
	setx 0x180bf728c5da7ab1, %g1, %r31
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
	.word 0xbfe56185  ! 2: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb80d4000  ! 3: AND_R	and 	%r21, %r0, %r28
	.word 0xb1e40000  ! 4: SAVE_R	save	%r16, %r0, %r24
T0_asi_reg_rd_0:
	mov	0xe, %r14
	.word 0xfadb8e80  ! 5: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T0_asi_reg_rd_1:
	mov	0x2c, %r14
	.word 0xf0db8e40  ! 8: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_0:
	setx	0x1e023c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_1:
	setx	0x1d002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb2c5000  ! 19: SLLX_R	sllx	%r17, %r0, %r29
cpu_intr_0_2:
	setx	0x3032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb735f001  ! 21: SRLX_I	srlx	%r23, 0x0001, %r27
cpu_intr_0_3:
	setx	0x1d001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_0), 16, 16)) -> intp(0, 0, 36)
	.word 0xbc8c61db  ! 26: ANDcc_I	andcc 	%r17, 0x01db, %r30
	.word 0xb9e52027  ! 31: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb7e5606c  ! 32: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbde50000  ! 34: SAVE_R	save	%r20, %r0, %r30
	.word 0xbde461b4  ! 35: SAVE_I	save	%r17, 0x0001, %r30
cpu_intr_0_4:
	setx	0x1c0202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e0bb  ! 37: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_rd_2:
	mov	0x38, %r14
	.word 0xf0db8400  ! 38: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbde40000  ! 39: SAVE_R	save	%r16, %r0, %r30
	.word 0xb5e48000  ! 41: SAVE_R	save	%r18, %r0, %r26
	.word 0xbbe58000  ! 44: SAVE_R	save	%r22, %r0, %r29
cpu_intr_0_5:
	setx	0x1d0107, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_6:
	setx	0x1c031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 48: SAVE_R	save	%r21, %r0, %r31
	.word 0xbde5e0e7  ! 49: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbfe42050  ! 51: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb60c4000  ! 53: AND_R	and 	%r17, %r0, %r27
	.word 0xbde5e0e4  ! 56: SAVE_I	save	%r23, 0x0001, %r30
T0_asi_reg_wr_0:
	mov	0x32, %r14
	.word 0xfaf38e40  ! 57: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb7e58000  ! 58: SAVE_R	save	%r22, %r0, %r27
	.word 0xb3e5c000  ! 64: SAVE_R	save	%r23, %r0, %r25
iob_intr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_1), 16, 16)) -> intp(0, 0, 8)
	.word 0xb7e5614b  ! 66: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_rd_3:
	mov	0x18, %r14
	.word 0xf4db8e40  ! 67: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbbe4e006  ! 72: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_wr_1:
	mov	0x3c2, %r14
	.word 0xfaf389e0  ! 73: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T0_asi_reg_wr_2:
	mov	0x16, %r14
	.word 0xf6f389e0  ! 74: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_2), 16, 16)) -> intp(0, 0, 34)
cpu_intr_0_7:
	setx	0x1f0016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc1c211e  ! 82: XOR_I	xor 	%r16, 0x011e, %r30
T0_asi_reg_rd_4:
	mov	0x3c2, %r14
	.word 0xf0db84a0  ! 84: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_0_8:
	setx	0x1d003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4203e  ! 86: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbfe50000  ! 87: SAVE_R	save	%r20, %r0, %r31
	.word 0xbfe5215f  ! 91: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_3), 16, 16)) -> intp(0, 0, 28)
	.word 0xbfe5e130  ! 96: SAVE_I	save	%r23, 0x0001, %r31
T0_asi_reg_wr_3:
	mov	0xb, %r14
	.word 0xfcf38400  ! 100: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_0_9:
	setx	0x1c033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe48000  ! 103: SAVE_R	save	%r18, %r0, %r29
	.word 0xbf34f001  ! 107: SRLX_I	srlx	%r19, 0x0001, %r31
	.word 0xbbe54000  ! 109: SAVE_R	save	%r21, %r0, %r29
	.word 0xb9e52141  ! 113: SAVE_I	save	%r20, 0x0001, %r28
T0_asi_reg_wr_4:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 117: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_0_10:
	setx	0x1e001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_5:
	mov	0x3c2, %r14
	.word 0xf8db8e80  ! 121: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb5e58000  ! 122: SAVE_R	save	%r22, %r0, %r26
	.word 0xbb641800  ! 123: MOVcc_R	<illegal instruction>
cpu_intr_0_11:
	setx	0x1f012f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_12:
	setx	0x1e0200, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_4), 16, 16)) -> intp(0, 0, 1)
iob_intr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_5), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb1e4e174  ! 131: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbde420a6  ! 132: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb1e54000  ! 134: SAVE_R	save	%r21, %r0, %r24
T0_asi_reg_rd_6:
	mov	0x2d, %r14
	.word 0xf2db8e60  ! 136: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_0_13:
	setx	0x1d0207, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_6), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_rd_7:
	mov	0x12, %r14
	.word 0xf6db8e40  ! 142: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb9e5209b  ! 144: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_14:
	setx	0x1f0011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5a0a8  ! 146: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb7e40000  ! 150: SAVE_R	save	%r16, %r0, %r27
cpu_intr_0_15:
	setx	0x1e0203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5c000  ! 153: SAVE_R	save	%r23, %r0, %r29
	.word 0xb9e54000  ! 155: SAVE_R	save	%r21, %r0, %r28
	.word 0xbde50000  ! 157: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_rd_8:
	mov	0x36, %r14
	.word 0xf8db8e40  ! 162: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb8b561d8  ! 164: ORNcc_I	orncc 	%r21, 0x01d8, %r28
T0_asi_reg_rd_9:
	mov	0x3c3, %r14
	.word 0xf2db89e0  ! 167: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb7e5200c  ! 168: SAVE_I	save	%r20, 0x0001, %r27
T0_asi_reg_rd_10:
	mov	0xf, %r14
	.word 0xfadb8e40  ! 169: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb1e58000  ! 172: SAVE_R	save	%r22, %r0, %r24
	.word 0xb53cc000  ! 176: SRA_R	sra 	%r19, %r0, %r26
cpu_intr_0_16:
	setx	0x1d0223, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_7), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb3342001  ! 180: SRL_I	srl 	%r16, 0x0001, %r25
T0_asi_reg_wr_5:
	mov	0x3c1, %r14
	.word 0xf4f38400  ! 182: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_8), 16, 16)) -> intp(0, 0, 39)
	.word 0xb5e40000  ! 185: SAVE_R	save	%r16, %r0, %r26
	.word 0xbde54000  ! 186: SAVE_R	save	%r21, %r0, %r30
	.word 0xbe946125  ! 190: ORcc_I	orcc 	%r17, 0x0125, %r31
iob_intr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_9), 16, 16)) -> intp(0, 0, 2c)
T0_asi_reg_wr_6:
	mov	0x3c8, %r14
	.word 0xf8f38e80  ! 197: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb1e50000  ! 198: SAVE_R	save	%r20, %r0, %r24
	.word 0xb7e4613a  ! 200: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbde5e17c  ! 203: SAVE_I	save	%r23, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbc358000  ! 208: ORN_R	orn 	%r22, %r0, %r30
cpu_intr_0_17:
	setx	0x1d000b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_18:
	setx	0x1e0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e0fe  ! 215: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_rd_11:
	mov	0x2b, %r14
	.word 0xf2db8e40  ! 216: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb334b001  ! 219: SRLX_I	srlx	%r18, 0x0001, %r25
T0_asi_reg_wr_7:
	mov	0x29, %r14
	.word 0xf2f389e0  ! 221: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_10), 16, 16)) -> intp(0, 0, 9)
iob_intr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_11), 16, 16)) -> intp(0, 0, 18)
T0_asi_reg_wr_8:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 226: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbfe50000  ! 228: SAVE_R	save	%r20, %r0, %r31
iob_intr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_12), 16, 16)) -> intp(0, 0, 3a)
iob_intr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_13), 16, 16)) -> intp(0, 0, 3e)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_19:
	setx	0x1c0023, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_20:
	setx	0x1f002b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_9:
	mov	0x1b, %r14
	.word 0xf4f38e80  ! 248: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T0_asi_reg_wr_10:
	mov	0x3c7, %r14
	.word 0xfcf38e40  ! 249: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_21:
	setx	0x1d021f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_14), 16, 16)) -> intp(0, 0, 6)
	.word 0xbfe42123  ! 256: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_wr_11:
	mov	0x1f, %r14
	.word 0xf6f384a0  ! 259: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_15), 16, 16)) -> intp(0, 0, 33)
	.word 0xb93d0000  ! 263: SRA_R	sra 	%r20, %r0, %r28
iob_intr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_16), 16, 16)) -> intp(0, 0, 1)
	.word 0xbde42113  ! 270: SAVE_I	save	%r16, 0x0001, %r30
iob_intr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_17), 16, 16)) -> intp(0, 0, e)
	.word 0xb1e48000  ! 278: SAVE_R	save	%r18, %r0, %r24
	.word 0xb3510000  ! 279: RDPR_TICK	<illegal instruction>
iob_intr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_18), 16, 16)) -> intp(0, 0, 35)
iob_intr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_19), 16, 16)) -> intp(0, 0, d)
T0_asi_reg_rd_12:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 284: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb5e4c000  ! 288: SAVE_R	save	%r19, %r0, %r26
	.word 0xb9e40000  ! 291: SAVE_R	save	%r16, %r0, %r28
	.word 0xbbe461da  ! 293: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb69c4000  ! 294: XORcc_R	xorcc 	%r17, %r0, %r27
	.word 0xb735f001  ! 296: SRLX_I	srlx	%r23, 0x0001, %r27
	.word 0xb5e4c000  ! 300: SAVE_R	save	%r19, %r0, %r26
cpu_intr_0_22:
	setx	0x1d003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4c000  ! 305: SAVE_R	save	%r19, %r0, %r24
	.word 0xb5e40000  ! 308: SAVE_R	save	%r16, %r0, %r26
	.word 0xb9e421a0  ! 310: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbde50000  ! 318: SAVE_R	save	%r20, %r0, %r30
	.word 0xb9e4a030  ! 320: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_rd_13:
	mov	0x3c1, %r14
	.word 0xf0db89e0  ! 326: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_20), 16, 16)) -> intp(0, 0, 3)
	.word 0xb7e40000  ! 330: SAVE_R	save	%r16, %r0, %r27
iob_intr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_21), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_rd_14:
	mov	0x24, %r14
	.word 0xf6db8400  ! 340: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_0_23:
	setx	0x1e032c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_24:
	setx	0x1f0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe84c000  ! 352: ADDcc_R	addcc 	%r19, %r0, %r31
iob_intr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_22), 16, 16)) -> intp(0, 0, 36)
	.word 0xb3e48000  ! 354: SAVE_R	save	%r18, %r0, %r25
iob_intr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_23), 16, 16)) -> intp(0, 0, 1d)
	.word 0xbfe5a16f  ! 360: SAVE_I	save	%r22, 0x0001, %r31
cpu_intr_0_25:
	setx	0x1d0114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e1b5  ! 364: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_24), 16, 16)) -> intp(0, 0, 17)
	.word 0xb32c8000  ! 368: SLL_R	sll 	%r18, %r0, %r25
T0_asi_reg_wr_12:
	mov	0xf, %r14
	.word 0xfaf38e40  ! 369: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_0_26:
	setx	0x1e0108, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_25), 16, 16)) -> intp(0, 0, 33)
T0_asi_reg_rd_15:
	mov	0x1, %r14
	.word 0xf8db8400  ! 374: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb3e44000  ! 377: SAVE_R	save	%r17, %r0, %r25
	.word 0xb1e4e030  ! 378: SAVE_I	save	%r19, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_rd_16:
	mov	0x6, %r14
	.word 0xfcdb8400  ! 380: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbde4e120  ! 381: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb81dc000  ! 383: XOR_R	xor 	%r23, %r0, %r28
	.word 0xbb351000  ! 386: SRLX_R	srlx	%r20, %r0, %r29
	.word 0xb1e50000  ! 389: SAVE_R	save	%r20, %r0, %r24
T0_asi_reg_wr_13:
	mov	0x4, %r14
	.word 0xf6f38400  ! 391: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb3e52095  ! 392: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbbe4c000  ! 394: SAVE_R	save	%r19, %r0, %r29
cpu_intr_0_27:
	setx	0x1c0107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5e0d5  ! 397: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbbe40000  ! 402: SAVE_R	save	%r16, %r0, %r29
iob_intr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_26), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb9e5e1d7  ! 408: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xba1520f7  ! 409: OR_I	or 	%r20, 0x00f7, %r29
	.word 0xbd7d6401  ! 410: MOVR_I	movre	%r21, 0x1, %r30
cpu_intr_0_28:
	setx	0x1f0337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e1a4  ! 416: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb9e5e0c3  ! 419: SAVE_I	save	%r23, 0x0001, %r28
cpu_intr_0_29:
	setx	0x1e0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 425: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_27), 16, 16)) -> intp(0, 0, 37)
	.word 0xb5520000  ! 432: RDPR_PIL	<illegal instruction>
	.word 0xb9e50000  ! 435: SAVE_R	save	%r20, %r0, %r28
cpu_intr_0_30:
	setx	0x1c0101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde52112  ! 440: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_rd_17:
	mov	0x26, %r14
	.word 0xfedb8e60  ! 442: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T0_asi_reg_rd_18:
	mov	0x18, %r14
	.word 0xf6db8400  ! 443: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_28), 16, 16)) -> intp(0, 0, 33)
cpu_intr_0_31:
	setx	0x1d0000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4c000  ! 447: SAVE_R	save	%r19, %r0, %r31
iob_intr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_29), 16, 16)) -> intp(0, 0, 24)
cpu_intr_0_32:
	setx	0x1e010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_14:
	mov	0x2a, %r14
	.word 0xf0f38e40  ! 457: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_30), 16, 16)) -> intp(0, 0, 28)
	.word 0xbfe44000  ! 459: SAVE_R	save	%r17, %r0, %r31
	.word 0xbfe421b8  ! 464: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5e460e9  ! 470: SAVE_I	save	%r17, 0x0001, %r26
iob_intr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_31), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_32), 16, 16)) -> intp(0, 0, 2f)
T0_asi_reg_wr_15:
	mov	0x23, %r14
	.word 0xf4f38e80  ! 474: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb3e5e16b  ! 475: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb9e48000  ! 476: SAVE_R	save	%r18, %r0, %r28
cpu_intr_0_33:
	setx	0x230222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4c000  ! 479: SAVE_R	save	%r19, %r0, %r31
	.word 0xb5e58000  ! 480: SAVE_R	save	%r22, %r0, %r26
	.word 0xb9e5a151  ! 481: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_rd_19:
	mov	0x3c4, %r14
	.word 0xfedb8e60  ! 484: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e4617f  ! 492: SAVE_I	save	%r17, 0x0001, %r27
iob_intr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_33), 16, 16)) -> intp(0, 0, 32)
iob_intr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_34), 16, 16)) -> intp(0, 0, 6)
iob_intr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_35), 16, 16)) -> intp(0, 0, 23)
	.word 0xb1e5a084  ! 501: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb2ac6098  ! 506: ANDNcc_I	andncc 	%r17, 0x0098, %r25
	.word 0xb035a083  ! 508: ORN_I	orn 	%r22, 0x0083, %r24
	.word 0xb7e561e8  ! 509: SAVE_I	save	%r21, 0x0001, %r27
cpu_intr_0_34:
	setx	0x21003e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_36), 16, 16)) -> intp(0, 0, 5)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_35:
	setx	0x200212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8f902001  ! 523: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
T0_asi_reg_wr_16:
	mov	0x18, %r14
	.word 0xfef38e80  ! 527: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_37), 16, 16)) -> intp(0, 0, c)
	.word 0xb7e56009  ! 530: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb7e56129  ! 531: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb3e54000  ! 532: SAVE_R	save	%r21, %r0, %r25
cpu_intr_0_36:
	setx	0x230229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_37:
	setx	0x200032, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_38:
	setx	0x200115, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_38), 16, 16)) -> intp(0, 0, d)
T0_asi_reg_wr_17:
	mov	0x3c2, %r14
	.word 0xf2f38e40  ! 542: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e50000  ! 544: SAVE_R	save	%r20, %r0, %r24
cpu_intr_0_39:
	setx	0x200230, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_39), 16, 16)) -> intp(0, 0, 14)
	.word 0xbbe58000  ! 552: SAVE_R	save	%r22, %r0, %r29
	.word 0xb9e4c000  ! 556: SAVE_R	save	%r19, %r0, %r28
T0_asi_reg_rd_20:
	mov	0x3c0, %r14
	.word 0xfcdb8e40  ! 557: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_40:
	setx	0x230020, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_40), 16, 16)) -> intp(0, 0, 2b)
T0_asi_reg_rd_21:
	mov	0x14, %r14
	.word 0xfadb8e60  ! 564: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_0_41:
	setx	0x210004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e42167  ! 572: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbbe44000  ! 575: SAVE_R	save	%r17, %r0, %r29
	.word 0xb7e4a0e8  ! 578: SAVE_I	save	%r18, 0x0001, %r27
cpu_intr_0_42:
	setx	0x20000d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_41), 16, 16)) -> intp(0, 0, 21)
	.word 0xb5e44000  ! 583: SAVE_R	save	%r17, %r0, %r26
	.word 0xbc8c609d  ! 584: ANDcc_I	andcc 	%r17, 0x009d, %r30
iob_intr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_42), 16, 16)) -> intp(0, 0, 25)
	.word 0xb28c2164  ! 587: ANDcc_I	andcc 	%r16, 0x0164, %r25
cpu_intr_0_43:
	setx	0x220139, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_44:
	setx	0x220339, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_18:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 593: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbbe5a1e0  ! 594: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9e56180  ! 597: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb2358000  ! 598: SUBC_R	orn 	%r22, %r0, %r25
cpu_intr_0_45:
	setx	0x21033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e104  ! 602: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb1e5e14e  ! 606: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_wr_19:
	mov	0x3c2, %r14
	.word 0xfaf38400  ! 608: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_0_46:
	setx	0x200300, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_47:
	setx	0x220037, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_22:
	mov	0x3c2, %r14
	.word 0xfedb8400  ! 613: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_0_48:
	setx	0x220005, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_43), 16, 16)) -> intp(0, 0, 2b)
T0_asi_reg_wr_20:
	mov	0x13, %r14
	.word 0xf0f389e0  ! 620: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_44), 16, 16)) -> intp(0, 0, 24)
	.word 0xb5e56020  ! 623: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbde54000  ! 626: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_45), 16, 16)) -> intp(0, 0, 14)
	.word 0xb3e560ab  ! 632: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb5e4c000  ! 634: SAVE_R	save	%r19, %r0, %r26
iob_intr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_46), 16, 16)) -> intp(0, 0, 0)
	.word 0xbe84a14d  ! 639: ADDcc_I	addcc 	%r18, 0x014d, %r31
	.word 0xb0446046  ! 641: ADDC_I	addc 	%r17, 0x0046, %r24
	.word 0xbe35c000  ! 642: ORN_R	orn 	%r23, %r0, %r31
T0_asi_reg_rd_23:
	mov	0x4, %r14
	.word 0xf6db8e60  ! 643: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb3e4609b  ! 649: SAVE_I	save	%r17, 0x0001, %r25
iob_intr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_47), 16, 16)) -> intp(0, 0, 3f)
iob_intr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_48), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb3e4c000  ! 657: SAVE_R	save	%r19, %r0, %r25
	.word 0xbde5e0fb  ! 658: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb3e40000  ! 659: SAVE_R	save	%r16, %r0, %r25
	.word 0xbde5202a  ! 661: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb52de001  ! 662: SLL_I	sll 	%r23, 0x0001, %r26
T0_asi_reg_wr_21:
	mov	0x2d, %r14
	.word 0xf6f38e40  ! 663: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_0_49:
	setx	0x230004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a092  ! 666: SAVE_I	save	%r18, 0x0001, %r24
T0_asi_reg_rd_24:
	mov	0x3c3, %r14
	.word 0xf8db89e0  ! 667: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xbbe44000  ! 668: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_wr_22:
	mov	0x3c6, %r14
	.word 0xfcf38e40  ! 669: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbde5c000  ! 672: SAVE_R	save	%r23, %r0, %r30
iob_intr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_49), 16, 16)) -> intp(0, 0, 3a)
cpu_intr_0_50:
	setx	0x200035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde44000  ! 675: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_rd_25:
	mov	0xc, %r14
	.word 0xf0db8400  ! 676: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbde4a136  ! 678: SAVE_I	save	%r18, 0x0001, %r30
iob_intr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_50), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_rd_26:
	mov	0x18, %r14
	.word 0xfcdb8e80  ! 685: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb9e4c000  ! 689: SAVE_R	save	%r19, %r0, %r28
	.word 0xb9e4a09b  ! 691: SAVE_I	save	%r18, 0x0001, %r28
iob_intr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_51), 16, 16)) -> intp(0, 0, e)
	.word 0xb3e40000  ! 694: SAVE_R	save	%r16, %r0, %r25
T0_asi_reg_wr_23:
	mov	0xa, %r14
	.word 0xf6f38400  ! 695: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbde44000  ! 696: SAVE_R	save	%r17, %r0, %r30
iob_intr_0_52:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_52), 16, 16)) -> intp(0, 0, 9)
	.word 0xb1e50000  ! 700: SAVE_R	save	%r20, %r0, %r24
cpu_intr_0_51:
	setx	0x23003e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_53:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_53), 16, 16)) -> intp(0, 0, 24)
iob_intr_0_54:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_54), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_52:
	setx	0x20000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 711: SAVE_R	save	%r16, %r0, %r24
	.word 0xb13c8000  ! 719: SRA_R	sra 	%r18, %r0, %r24
	.word 0xb9e54000  ! 720: SAVE_R	save	%r21, %r0, %r28
cpu_intr_0_53:
	setx	0x200038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde54000  ! 724: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_55:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_55), 16, 16)) -> intp(0, 0, 8)
iob_intr_0_56:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_56), 16, 16)) -> intp(0, 0, 7)
iob_intr_0_57:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_57), 16, 16)) -> intp(0, 0, a)
	.word 0xbfe58000  ! 735: SAVE_R	save	%r22, %r0, %r31
iob_intr_0_58:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_58), 16, 16)) -> intp(0, 0, 15)
cpu_intr_0_54:
	setx	0x230101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e16f  ! 740: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb9e4c000  ! 741: SAVE_R	save	%r19, %r0, %r28
	.word 0xb3e421e5  ! 743: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb1e5a182  ! 746: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_wr_24:
	mov	0x5, %r14
	.word 0xf8f384a0  ! 749: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbde5a1fe  ! 750: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbc8d612d  ! 753: ANDcc_I	andcc 	%r21, 0x012d, %r30
iob_intr_0_59:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_59), 16, 16)) -> intp(0, 0, 9)
iob_intr_0_60:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_60), 16, 16)) -> intp(0, 0, 14)
	.word 0xbc950000  ! 762: ORcc_R	orcc 	%r20, %r0, %r30
	.word 0xbe040000  ! 763: ADD_R	add 	%r16, %r0, %r31
iob_intr_0_61:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_61), 16, 16)) -> intp(0, 0, 21)
	.word 0xb7e4c000  ! 767: SAVE_R	save	%r19, %r0, %r27
iob_intr_0_62:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_62), 16, 16)) -> intp(0, 0, 3e)
T0_asi_reg_wr_25:
	mov	0x32, %r14
	.word 0xf2f38e80  ! 772: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_0_63:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_63), 16, 16)) -> intp(0, 0, 1d)
cpu_intr_0_55:
	setx	0x200202, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_56:
	setx	0x220131, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_64:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_64), 16, 16)) -> intp(0, 0, 1a)
iob_intr_0_65:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_65), 16, 16)) -> intp(0, 0, 18)
	.word 0xb3e52062  ! 785: SAVE_I	save	%r20, 0x0001, %r25
iob_intr_0_66:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_66), 16, 16)) -> intp(0, 0, 2c)
iob_intr_0_67:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_67), 16, 16)) -> intp(0, 0, 1a)
iob_intr_0_68:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_68), 16, 16)) -> intp(0, 0, 31)
	.word 0xb1e4e1aa  ! 790: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbbe5a127  ! 791: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_69:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_69), 16, 16)) -> intp(0, 0, 3)
T0_asi_reg_rd_27:
	mov	0x34, %r14
	.word 0xfedb8e40  ! 796: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_rd_28:
	mov	0x3c1, %r14
	.word 0xf8db8400  ! 799: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb1e460dc  ! 801: SAVE_I	save	%r17, 0x0001, %r24
iob_intr_0_70:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_70), 16, 16)) -> intp(0, 0, 3e)
cpu_intr_0_57:
	setx	0x220225, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_26:
	mov	0x2a, %r14
	.word 0xf0f389e0  ! 804: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb9e520d0  ! 807: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbfe50000  ! 808: SAVE_R	save	%r20, %r0, %r31
	.word 0xbbe44000  ! 813: SAVE_R	save	%r17, %r0, %r29
	.word 0xb1e50000  ! 814: SAVE_R	save	%r20, %r0, %r24
cpu_intr_0_58:
	setx	0x200302, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_71:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_71), 16, 16)) -> intp(0, 0, 3f)
cpu_intr_0_59:
	setx	0x230003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd520000  ! 821: RDPR_PIL	<illegal instruction>
	.word 0xb5e54000  ! 822: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_wr_27:
	mov	0x1a, %r14
	.word 0xf8f389e0  ! 824: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_0_72:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_72), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb1e5a178  ! 826: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde4c000  ! 828: SAVE_R	save	%r19, %r0, %r30
iob_intr_0_73:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_73), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb5e58000  ! 836: SAVE_R	save	%r22, %r0, %r26
cpu_intr_0_60:
	setx	0x210134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7351000  ! 839: SRLX_R	srlx	%r20, %r0, %r27
	.word 0xb1e58000  ! 840: SAVE_R	save	%r22, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e4c000  ! 842: SAVE_R	save	%r19, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbbe4a0bb  ! 844: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb1e5e1a8  ! 845: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_rd_29:
	mov	0x30, %r14
	.word 0xfedb8e40  ! 846: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb9e46163  ! 848: SAVE_I	save	%r17, 0x0001, %r28
T0_asi_reg_wr_28:
	mov	0x2a, %r14
	.word 0xf2f38e40  ! 850: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb234c000  ! 851: SUBC_R	orn 	%r19, %r0, %r25
	.word 0xb9e5c000  ! 853: SAVE_R	save	%r23, %r0, %r28
T0_asi_reg_wr_29:
	mov	0x9, %r14
	.word 0xfaf38e60  ! 855: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T0_asi_reg_rd_30:
	mov	0x3c7, %r14
	.word 0xf4db89e0  ! 856: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T0_asi_reg_wr_30:
	mov	0x1d, %r14
	.word 0xf8f38e60  ! 857: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T0_asi_reg_wr_31:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 859: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_61:
	setx	0x21000a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_31:
	mov	0x3c5, %r14
	.word 0xf8db89e0  ! 866: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xbbe40000  ! 869: SAVE_R	save	%r16, %r0, %r29
	.word 0xbde5c000  ! 870: SAVE_R	save	%r23, %r0, %r30
T0_asi_reg_rd_32:
	mov	0x2, %r14
	.word 0xf8db8e40  ! 873: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_wr_32:
	mov	0x3c0, %r14
	.word 0xf8f384a0  ! 875: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb7e4e024  ! 876: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7e4619a  ! 879: SAVE_I	save	%r17, 0x0001, %r27
cpu_intr_0_62:
	setx	0x21012a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_33:
	mov	0x1b, %r14
	.word 0xfadb89e0  ! 892: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T0_asi_reg_rd_34:
	mov	0x1b, %r14
	.word 0xfedb8e40  ! 893: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_wr_33:
	mov	0x32, %r14
	.word 0xf4f38e80  ! 894: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb89c6081  ! 895: XORcc_I	xorcc 	%r17, 0x0081, %r28
	.word 0xb2356138  ! 897: ORN_I	orn 	%r21, 0x0138, %r25
	.word 0xb5e54000  ! 898: SAVE_R	save	%r21, %r0, %r26
	.word 0xbfe52172  ! 899: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_74:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_74), 16, 16)) -> intp(0, 0, 1b)
iob_intr_0_75:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_75), 16, 16)) -> intp(0, 0, 2)
iob_intr_0_76:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_76), 16, 16)) -> intp(0, 0, 33)
iob_intr_0_77:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_77), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb9e40000  ! 907: SAVE_R	save	%r16, %r0, %r28
cpu_intr_0_63:
	setx	0x220236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_78:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_78), 16, 16)) -> intp(0, 0, 6)
	.word 0xb9e44000  ! 919: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_79:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_79), 16, 16)) -> intp(0, 0, 4)
iob_intr_0_80:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_80), 16, 16)) -> intp(0, 0, 7)
	.word 0xb1e46176  ! 928: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb5e5a198  ! 931: SAVE_I	save	%r22, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_34:
	mov	0x3c0, %r14
	.word 0xfcf389e0  ! 938: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb7e5e02f  ! 941: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_rd_35:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 942: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb5e46044  ! 944: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_64:
	setx	0x25032d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_81:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_81), 16, 16)) -> intp(0, 0, 2f)
	.word 0xbbe4e0a7  ! 949: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbde46026  ! 956: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbfe46102  ! 957: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb3e5c000  ! 958: SAVE_R	save	%r23, %r0, %r25
cpu_intr_0_65:
	setx	0x240132, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e4e1c1  ! 967: SAVE_I	save	%r19, 0x0001, %r24
cpu_intr_0_66:
	setx	0x25012f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_82:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_82), 16, 16)) -> intp(0, 0, b)
	.word 0xbfe48000  ! 973: SAVE_R	save	%r18, %r0, %r31
	.word 0xb3e460cc  ! 976: SAVE_I	save	%r17, 0x0001, %r25
T0_asi_reg_wr_35:
	mov	0x3c1, %r14
	.word 0xfcf389e0  ! 978: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_0_67:
	setx	0x26033d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_36:
	mov	0x3c6, %r14
	.word 0xf8f389e0  ! 981: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_0_83:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_83), 16, 16)) -> intp(0, 0, 1)
	.word 0xbde5a0ee  ! 983: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb1e48000  ! 984: SAVE_R	save	%r18, %r0, %r24
	.word 0xbde5c000  ! 987: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_68:
	setx	0x24011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4205c  ! 990: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_wr_37:
	mov	0xf, %r14
	.word 0xf0f38e40  ! 991: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb2ada045  ! 992: ANDNcc_I	andncc 	%r22, 0x0045, %r25
	.word 0xb3e44000  ! 993: SAVE_R	save	%r17, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_69:
	setx	0x27003f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_36:
	mov	0x3c3, %r14
	.word 0xf2db8e40  ! 999: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbde5a196  ! 1001: SAVE_I	save	%r22, 0x0001, %r30
iob_intr_0_84:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_84), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_rd_37:
	mov	0x13, %r14
	.word 0xfcdb89e0  ! 1007: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb1e560b8  ! 1009: SAVE_I	save	%r21, 0x0001, %r24
cpu_intr_0_70:
	setx	0x270021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e561b9  ! 1011: SAVE_I	save	%r21, 0x0001, %r25
T0_asi_reg_wr_38:
	mov	0x20, %r14
	.word 0xfaf389e0  ! 1013: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb5e58000  ! 1014: SAVE_R	save	%r22, %r0, %r26
	.word 0xb9e48000  ! 1016: SAVE_R	save	%r18, %r0, %r28
T0_asi_reg_rd_38:
	mov	0x3c6, %r14
	.word 0xf2db89e0  ! 1017: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_0_71:
	setx	0x26022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e58000  ! 1019: SAVE_R	save	%r22, %r0, %r28
iob_intr_0_85:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_85), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_72:
	setx	0x25003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5605a  ! 1022: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbc35a0f8  ! 1026: ORN_I	orn 	%r22, 0x00f8, %r30
	.word 0xb1e5e12b  ! 1028: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb1e58000  ! 1029: SAVE_R	save	%r22, %r0, %r24
cpu_intr_0_73:
	setx	0x250223, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_74:
	setx	0x250213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e420d7  ! 1035: SAVE_I	save	%r16, 0x0001, %r25
cpu_intr_0_75:
	setx	0x250129, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_39:
	mov	0x3c2, %r14
	.word 0xfef38e40  ! 1039: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_0_86:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_86), 16, 16)) -> intp(0, 0, 31)
	.word 0xb1e40000  ! 1042: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_87:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_87), 16, 16)) -> intp(0, 0, 9)
	.word 0xbbe421d5  ! 1051: SAVE_I	save	%r16, 0x0001, %r29
cpu_intr_0_76:
	setx	0x240136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a194  ! 1054: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_wr_40:
	mov	0x3c6, %r14
	.word 0xf2f384a0  ! 1056: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T0_asi_reg_rd_39:
	mov	0x12, %r14
	.word 0xfedb8e40  ! 1058: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb9e561ae  ! 1061: SAVE_I	save	%r21, 0x0001, %r28
T0_asi_reg_rd_40:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 1063: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_0_77:
	setx	0x24003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde58000  ! 1069: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_78:
	setx	0x260231, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_79:
	setx	0x250234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde40000  ! 1072: SAVE_R	save	%r16, %r0, %r30
cpu_intr_0_80:
	setx	0x25002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba054000  ! 1075: ADD_R	add 	%r21, %r0, %r29
T0_asi_reg_rd_41:
	mov	0x3c1, %r14
	.word 0xfedb8e60  ! 1076: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_0_81:
	setx	0x270314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b40000  ! 1078: ORNcc_R	orncc 	%r16, %r0, %r28
	.word 0xbca54000  ! 1081: SUBcc_R	subcc 	%r21, %r0, %r30
T0_asi_reg_rd_42:
	mov	0x3c6, %r14
	.word 0xf0db8e40  ! 1083: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_rd_43:
	mov	0x3, %r14
	.word 0xfcdb8400  ! 1086: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb3e4a15c  ! 1087: SAVE_I	save	%r18, 0x0001, %r25
cpu_intr_0_82:
	setx	0x240208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe40000  ! 1092: SAVE_R	save	%r16, %r0, %r29
	.word 0xb9e5e0f7  ! 1093: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3e44000  ! 1094: SAVE_R	save	%r17, %r0, %r25
T0_asi_reg_rd_44:
	mov	0x3c5, %r14
	.word 0xfedb8400  ! 1098: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb3540000  ! 1099: RDPR_GL	<illegal instruction>
T0_asi_reg_rd_45:
	mov	0x30, %r14
	.word 0xf0db84a0  ! 1100: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb9520000  ! 1105: RDPR_PIL	<illegal instruction>
	.word 0xb3e5e0d6  ! 1108: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb1e58000  ! 1109: SAVE_R	save	%r22, %r0, %r24
cpu_intr_0_83:
	setx	0x240310, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_88:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_88), 16, 16)) -> intp(0, 0, 13)
	.word 0xb1e5c000  ! 1115: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_rd_46:
	mov	0x3c6, %r14
	.word 0xfedb8e80  ! 1116: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb3e48000  ! 1117: SAVE_R	save	%r18, %r0, %r25
	.word 0xb0350000  ! 1119: SUBC_R	orn 	%r20, %r0, %r24
T0_asi_reg_wr_41:
	mov	0x34, %r14
	.word 0xfcf384a0  ! 1121: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_89:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_89), 16, 16)) -> intp(0, 0, 17)
	.word 0xb7e5a15e  ! 1124: SAVE_I	save	%r22, 0x0001, %r27
	.word 0x819560d2  ! 1127: WRPR_TPC_I	wrpr	%r21, 0x00d2, %tpc
	.word 0xb9e420fe  ! 1129: SAVE_I	save	%r16, 0x0001, %r28
cpu_intr_0_84:
	setx	0x27001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e421b1  ! 1138: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb9e5a08b  ! 1139: SAVE_I	save	%r22, 0x0001, %r28
cpu_intr_0_85:
	setx	0x260033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e46118  ! 1143: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_90:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_90), 16, 16)) -> intp(0, 0, 4)
T0_asi_reg_rd_47:
	mov	0x3c1, %r14
	.word 0xf8db8e40  ! 1147: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb9e40000  ! 1155: SAVE_R	save	%r16, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe5a109  ! 1161: SAVE_I	save	%r22, 0x0001, %r31
T0_asi_reg_rd_48:
	mov	0x2b, %r14
	.word 0xf2db8e60  ! 1162: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T0_asi_reg_rd_49:
	mov	0x1c, %r14
	.word 0xfedb89e0  ! 1165: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T0_asi_reg_wr_42:
	mov	0x2c, %r14
	.word 0xf4f38e40  ! 1166: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_wr_43:
	mov	0x8, %r14
	.word 0xf8f38400  ! 1168: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbde44000  ! 1170: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_wr_44:
	mov	0x3c6, %r14
	.word 0xf4f38e40  ! 1172: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_0_91:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_91), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb5e5a09f  ! 1175: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb7e421e2  ! 1178: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbfe50000  ! 1182: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_86:
	setx	0x270235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5604f  ! 1184: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbbe461d6  ! 1187: SAVE_I	save	%r17, 0x0001, %r29
cpu_intr_0_87:
	setx	0x1003e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_92:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_92), 16, 16)) -> intp(0, 0, 2a)
iob_intr_0_93:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_93), 16, 16)) -> intp(0, 0, 1)
	.word 0xb1e4e056  ! 1194: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_wr_45:
	mov	0x3c7, %r14
	.word 0xf8f389e0  ! 1195: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_0_88:
	setx	0x24021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb61560b9  ! 1201: OR_I	or 	%r21, 0x00b9, %r27
cpu_intr_0_89:
	setx	0x27000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 1204: RDPR_TT	<illegal instruction>
	.word 0xb9e4a0b0  ! 1205: SAVE_I	save	%r18, 0x0001, %r28
iob_intr_0_94:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_94), 16, 16)) -> intp(0, 0, 17)
cpu_intr_0_90:
	setx	0x240133, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_91:
	setx	0x240012, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_46:
	mov	0xa, %r14
	.word 0xfaf38e40  ! 1210: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_rd_50:
	mov	0x2c, %r14
	.word 0xf6db8e60  ! 1213: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_0_92:
	setx	0x25002d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_93:
	setx	0x25013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e46041  ! 1220: SAVE_I	save	%r17, 0x0001, %r27
T0_asi_reg_rd_51:
	mov	0x2a, %r14
	.word 0xf6db8e80  ! 1221: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb9e54000  ! 1222: SAVE_R	save	%r21, %r0, %r28
cpu_intr_0_94:
	setx	0x250122, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_95:
	setx	0x270205, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_52:
	mov	0x1, %r14
	.word 0xf0db8e80  ! 1227: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T0_asi_reg_wr_47:
	mov	0x36, %r14
	.word 0xf6f38e60  ! 1231: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb3e56198  ! 1235: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbde5c000  ! 1236: SAVE_R	save	%r23, %r0, %r30
	.word 0xbde5e18a  ! 1237: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbd643801  ! 1241: MOVcc_I	<illegal instruction>
T0_asi_reg_wr_48:
	mov	0x3c6, %r14
	.word 0xf6f384a0  ! 1242: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb9e52169  ! 1245: SAVE_I	save	%r20, 0x0001, %r28
T0_asi_reg_rd_53:
	mov	0x3c6, %r14
	.word 0xfcdb8e80  ! 1246: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T0_asi_reg_rd_54:
	mov	0x14, %r14
	.word 0xfcdb8e60  ! 1247: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_0_95:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_95), 16, 16)) -> intp(0, 0, 3a)
cpu_intr_0_96:
	setx	0x240316, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_55:
	mov	0x2b, %r14
	.word 0xf2db8400  ! 1257: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T0_asi_reg_rd_56:
	mov	0x27, %r14
	.word 0xf4db8e60  ! 1258: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_0_96:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_96), 16, 16)) -> intp(0, 0, 2e)
iob_intr_0_97:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_97), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb9e5a189  ! 1267: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7e50000  ! 1271: SAVE_R	save	%r20, %r0, %r27
cpu_intr_0_97:
	setx	0x25031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_49:
	mov	0x1e, %r14
	.word 0xfcf38e80  ! 1280: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T0_asi_reg_wr_50:
	mov	0x3c3, %r14
	.word 0xfef38e40  ! 1281: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_0_98:
	setx	0x27033d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_98:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_98), 16, 16)) -> intp(0, 0, 11)
cpu_intr_0_99:
	setx	0x25032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcacc000  ! 1288: ANDNcc_R	andncc 	%r19, %r0, %r30
	.word 0xb3e58000  ! 1290: SAVE_R	save	%r22, %r0, %r25
	.word 0xbbe40000  ! 1294: SAVE_R	save	%r16, %r0, %r29
	.word 0xb3e42016  ! 1295: SAVE_I	save	%r16, 0x0001, %r25
iob_intr_0_99:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_99), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_wr_51:
	mov	0x0, %r14
	.word 0xf6f38400  ! 1297: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T0_asi_reg_wr_52:
	mov	0x3c0, %r14
	.word 0xf6f38e60  ! 1298: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb5e4a1fa  ! 1303: SAVE_I	save	%r18, 0x0001, %r26
T0_asi_reg_wr_53:
	mov	0xe, %r14
	.word 0xfef38e60  ! 1304: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_0_100:
	setx	0x250121, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_100:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_100), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb4154000  ! 1307: OR_R	or 	%r21, %r0, %r26
cpu_intr_0_101:
	setx	0x24030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a18a  ! 1310: SAVE_I	save	%r18, 0x0001, %r26
iob_intr_0_101:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_101), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb1e56093  ! 1316: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbfe48000  ! 1318: SAVE_R	save	%r18, %r0, %r31
iob_intr_0_102:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_102), 16, 16)) -> intp(0, 0, 34)
iob_intr_0_103:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_103), 16, 16)) -> intp(0, 0, 0)
cpu_intr_0_102:
	setx	0x26000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb014c000  ! 1331: OR_R	or 	%r19, %r0, %r24
	.word 0xbbe42112  ! 1333: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb1e5e19f  ! 1334: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_rd_57:
	mov	0x15, %r14
	.word 0xf6db8e40  ! 1335: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_0_103:
	setx	0x240103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb57ce401  ! 1337: MOVR_I	movre	%r19, 0x1, %r26
cpu_intr_0_104:
	setx	0x25020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e46176  ! 1341: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbde48000  ! 1343: SAVE_R	save	%r18, %r0, %r30
	.word 0xb3e50000  ! 1347: SAVE_R	save	%r20, %r0, %r25
iob_intr_0_104:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_104), 16, 16)) -> intp(0, 0, 8)
	.word 0xbf2d6001  ! 1349: SLL_I	sll 	%r21, 0x0001, %r31
cpu_intr_0_105:
	setx	0x260124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5c000  ! 1357: SAVE_R	save	%r23, %r0, %r25
iob_intr_0_105:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_105), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_106:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_106), 16, 16)) -> intp(0, 0, 2)
	.word 0xbde4204b  ! 1362: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbfe56054  ! 1363: SAVE_I	save	%r21, 0x0001, %r31
cpu_intr_0_106:
	setx	0x260029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e54000  ! 1365: SAVE_R	save	%r21, %r0, %r24
iob_intr_0_107:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_107), 16, 16)) -> intp(0, 0, 33)
	.word 0xb6944000  ! 1368: ORcc_R	orcc 	%r17, %r0, %r27
iob_intr_0_108:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_108), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbe34c000  ! 1372: ORN_R	orn 	%r19, %r0, %r31
iob_intr_0_109:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_109), 16, 16)) -> intp(0, 0, 15)
T0_asi_reg_rd_58:
	mov	0x3c2, %r14
	.word 0xf6db89e0  ! 1378: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb3e5e0e0  ! 1380: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb9349000  ! 1383: SRLX_R	srlx	%r18, %r0, %r28
cpu_intr_0_107:
	setx	0x240331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e44000  ! 1392: SAVE_R	save	%r17, %r0, %r25
T0_asi_reg_wr_54:
	mov	0x37, %r14
	.word 0xf4f38e40  ! 1393: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_rd_59:
	mov	0x3c7, %r14
	.word 0xf0db8e40  ! 1395: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_110:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_110), 16, 16)) -> intp(0, 0, 2c)
cpu_intr_0_108:
	setx	0x260117, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_109:
	setx	0x240004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e54000  ! 1407: SAVE_R	save	%r21, %r0, %r24
	.word 0xbde4e15f  ! 1409: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_wr_55:
	mov	0x3c0, %r14
	.word 0xf4f384a0  ! 1411: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb5e4c000  ! 1413: SAVE_R	save	%r19, %r0, %r26
	.word 0xb9e46089  ! 1414: SAVE_I	save	%r17, 0x0001, %r28
T0_asi_reg_wr_56:
	mov	0x3c2, %r14
	.word 0xf8f384a0  ! 1415: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T0_asi_reg_wr_57:
	mov	0x28, %r14
	.word 0xf0f38400  ! 1417: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_0_110:
	setx	0x280037, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_58:
	mov	0x3c5, %r14
	.word 0xf6f38e60  ! 1421: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_0_111:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_111), 16, 16)) -> intp(0, 0, 29)
	.word 0xb5e4e0bd  ! 1424: SAVE_I	save	%r19, 0x0001, %r26
cpu_intr_0_111:
	setx	0x290201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e19d  ! 1428: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb7e5c000  ! 1429: SAVE_R	save	%r23, %r0, %r27
cpu_intr_0_112:
	setx	0x2a000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e58000  ! 1434: SAVE_R	save	%r22, %r0, %r24
	.word 0xb9e4a1ae  ! 1437: SAVE_I	save	%r18, 0x0001, %r28
iob_intr_0_112:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_112), 16, 16)) -> intp(0, 0, 1f)
	.word 0xbbe54000  ! 1443: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_113:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_113), 16, 16)) -> intp(0, 0, 17)
	.word 0xb3e54000  ! 1450: SAVE_R	save	%r21, %r0, %r25
	.word 0xbfe5a051  ! 1451: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbde5e09e  ! 1452: SAVE_I	save	%r23, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe52133  ! 1454: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_wr_59:
	mov	0x18, %r14
	.word 0xf6f38e40  ! 1455: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb550c000  ! 1458: RDPR_TT	<illegal instruction>
iob_intr_0_114:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_114), 16, 16)) -> intp(0, 0, c)
iob_intr_0_115:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_115), 16, 16)) -> intp(0, 0, 29)
iob_intr_0_116:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_116), 16, 16)) -> intp(0, 0, 35)
cpu_intr_0_113:
	setx	0x29032c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_117:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_117), 16, 16)) -> intp(0, 0, 1e)
	.word 0xbab460a0  ! 1475: ORNcc_I	orncc 	%r17, 0x00a0, %r29
iob_intr_0_118:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_118), 16, 16)) -> intp(0, 0, 38)
	.word 0xb73cf001  ! 1480: SRAX_I	srax	%r19, 0x0001, %r27
iob_intr_0_119:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_119), 16, 16)) -> intp(0, 0, 16)
	.word 0xb1e58000  ! 1485: SAVE_R	save	%r22, %r0, %r24
cpu_intr_0_114:
	setx	0x2b0114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1357001  ! 1490: SRLX_I	srlx	%r21, 0x0001, %r24
cpu_intr_0_115:
	setx	0x2a0336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a1f7  ! 1495: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_rd_60:
	mov	0x1d, %r14
	.word 0xf4db8e40  ! 1498: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbde5a17f  ! 1499: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb5e44000  ! 1501: SAVE_R	save	%r17, %r0, %r26
	.word 0xb5e5615a  ! 1502: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb7e48000  ! 1503: SAVE_R	save	%r18, %r0, %r27
cpu_intr_0_116:
	setx	0x280227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb32d8000  ! 1505: SLL_R	sll 	%r22, %r0, %r25
	.word 0xb5e4a046  ! 1507: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb9e44000  ! 1510: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_120:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_120), 16, 16)) -> intp(0, 0, 7)
	.word 0xb3e5619b  ! 1513: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbfe54000  ! 1515: SAVE_R	save	%r21, %r0, %r31
	.word 0xbc35a0b0  ! 1516: ORN_I	orn 	%r22, 0x00b0, %r30
iob_intr_0_121:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_121), 16, 16)) -> intp(0, 0, 39)
cpu_intr_0_117:
	setx	0x280327, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_61:
	mov	0x3c6, %r14
	.word 0xfedb8e40  ! 1521: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbde48000  ! 1523: SAVE_R	save	%r18, %r0, %r30
	.word 0xb7e4614b  ! 1527: SAVE_I	save	%r17, 0x0001, %r27
cpu_intr_0_118:
	setx	0x28011e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_122:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_122), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbfe4e161  ! 1531: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_123:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_123), 16, 16)) -> intp(0, 0, 21)
T0_asi_reg_rd_62:
	mov	0x23, %r14
	.word 0xf0db8e40  ! 1535: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e520e1  ! 1538: SAVE_I	save	%r20, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe54000  ! 1550: SAVE_R	save	%r21, %r0, %r31
cpu_intr_0_119:
	setx	0x2a021b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_124:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_124), 16, 16)) -> intp(0, 0, 27)
	.word 0xb9e40000  ! 1565: SAVE_R	save	%r16, %r0, %r28
iob_intr_0_125:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_125), 16, 16)) -> intp(0, 0, 7)
	.word 0xbc94c000  ! 1570: ORcc_R	orcc 	%r19, %r0, %r30
	.word 0xb9e4c000  ! 1572: SAVE_R	save	%r19, %r0, %r28
T0_asi_reg_rd_63:
	mov	0x1c, %r14
	.word 0xf6db8e40  ! 1573: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbbe54000  ! 1575: SAVE_R	save	%r21, %r0, %r29
T0_asi_reg_wr_60:
	mov	0x2d, %r14
	.word 0xf4f38e60  ! 1579: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_0_120:
	setx	0x2b0333, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_126:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_126), 16, 16)) -> intp(0, 0, 37)
	.word 0xbde4c000  ! 1584: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_rd_64:
	mov	0x17, %r14
	.word 0xf0db84a0  ! 1585: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb5e40000  ! 1589: SAVE_R	save	%r16, %r0, %r26
	.word 0xbfe4e0b7  ! 1590: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbaa4a1de  ! 1591: SUBcc_I	subcc 	%r18, 0x01de, %r29
	.word 0xbde4c000  ! 1594: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_wr_61:
	mov	0x33, %r14
	.word 0xf4f38400  ! 1595: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T0_asi_reg_wr_62:
	mov	0x34, %r14
	.word 0xfcf38e60  ! 1598: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xba35616e  ! 1599: SUBC_I	orn 	%r21, 0x016e, %r29
	.word 0xbabd21a3  ! 1603: XNORcc_I	xnorcc 	%r20, 0x01a3, %r29
T0_asi_reg_wr_63:
	mov	0x2b, %r14
	.word 0xf2f389e0  ! 1604: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T0_asi_reg_rd_65:
	mov	0x34, %r14
	.word 0xf8db8400  ! 1605: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbfe5e04b  ! 1608: SAVE_I	save	%r23, 0x0001, %r31
cpu_intr_0_121:
	setx	0x280210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a191  ! 1611: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbfe58000  ! 1613: SAVE_R	save	%r22, %r0, %r31
T0_asi_reg_rd_66:
	mov	0x24, %r14
	.word 0xfcdb8e40  ! 1614: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_122:
	setx	0x2b0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e44000  ! 1616: SAVE_R	save	%r17, %r0, %r25
	.word 0xb7e461b9  ! 1619: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb6a48000  ! 1621: SUBcc_R	subcc 	%r18, %r0, %r27
	.word 0xb3e4e0e2  ! 1623: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbb3c4000  ! 1626: SRA_R	sra 	%r17, %r0, %r29
	.word 0xb9e58000  ! 1627: SAVE_R	save	%r22, %r0, %r28
	.word 0x8795601b  ! 1629: WRPR_TT_I	wrpr	%r21, 0x001b, %tt
T0_asi_reg_rd_67:
	mov	0x3c8, %r14
	.word 0xf0db8e40  ! 1632: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbde561cb  ! 1635: SAVE_I	save	%r21, 0x0001, %r30
cpu_intr_0_123:
	setx	0x2a0024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_124:
	setx	0x280330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 1639: SAVE_R	save	%r22, %r0, %r26
iob_intr_0_127:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_127), 16, 16)) -> intp(0, 0, 30)
	.word 0xbde5208d  ! 1641: SAVE_I	save	%r20, 0x0001, %r30
iob_intr_0_128:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_128), 16, 16)) -> intp(0, 0, 20)
iob_intr_0_129:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_129), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_rd_68:
	mov	0x24, %r14
	.word 0xf2db84a0  ! 1647: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T0_asi_reg_rd_69:
	mov	0x32, %r14
	.word 0xfadb89e0  ! 1649: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_0_125:
	setx	0x290126, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_70:
	mov	0x17, %r14
	.word 0xf6db8e80  ! 1652: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb28ce0f7  ! 1655: ANDcc_I	andcc 	%r19, 0x00f7, %r25
	.word 0xb1e5214f  ! 1656: SAVE_I	save	%r20, 0x0001, %r24
cpu_intr_0_126:
	setx	0x2a0136, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_127:
	setx	0x2b0008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde54000  ! 1668: SAVE_R	save	%r21, %r0, %r30
	.word 0xb81c0000  ! 1671: XOR_R	xor 	%r16, %r0, %r28
cpu_intr_0_128:
	setx	0x280231, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_130:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_130), 16, 16)) -> intp(0, 0, 34)
	.word 0xb1e5c000  ! 1675: SAVE_R	save	%r23, %r0, %r24
	.word 0xba8dc000  ! 1676: ANDcc_R	andcc 	%r23, %r0, %r29
cpu_intr_0_129:
	setx	0x2a013d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_130:
	setx	0x2b031b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_71:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 1682: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_72:
	mov	0x15, %r14
	.word 0xf2db8e60  ! 1694: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbde58000  ! 1700: SAVE_R	save	%r22, %r0, %r30
iob_intr_0_131:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_131), 16, 16)) -> intp(0, 0, 15)
	.word 0xb815c000  ! 1705: OR_R	or 	%r23, %r0, %r28
iob_intr_0_132:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_132), 16, 16)) -> intp(0, 0, 0)
	.word 0xbfe56110  ! 1707: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb1e50000  ! 1710: SAVE_R	save	%r20, %r0, %r24
cpu_intr_0_131:
	setx	0x2a0232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf356001  ! 1712: SRL_I	srl 	%r21, 0x0001, %r31
	.word 0xbbe4e0e0  ! 1714: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbfe5c000  ! 1715: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_133:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_133), 16, 16)) -> intp(0, 0, b)
	.word 0xbfe5e1ac  ! 1717: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbde50000  ! 1719: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_rd_73:
	mov	0xe, %r14
	.word 0xfadb89e0  ! 1720: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_0_134:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_134), 16, 16)) -> intp(0, 0, 37)
	.word 0xb5e4a083  ! 1724: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb7e4e14a  ! 1729: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7e4c000  ! 1730: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_rd_74:
	mov	0x1, %r14
	.word 0xf8db84a0  ! 1734: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb7e4e051  ! 1741: SAVE_I	save	%r19, 0x0001, %r27
iob_intr_0_135:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_135), 16, 16)) -> intp(0, 0, 2e)
T0_asi_reg_wr_64:
	mov	0x13, %r14
	.word 0xf0f38e40  ! 1743: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb5e52173  ! 1750: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xba2d0000  ! 1751: ANDN_R	andn 	%r20, %r0, %r29
	.word 0xb00d8000  ! 1755: AND_R	and 	%r22, %r0, %r24
iob_intr_0_136:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_136), 16, 16)) -> intp(0, 0, 18)
	.word 0xb3e4e0a1  ! 1759: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_rd_75:
	mov	0x35, %r14
	.word 0xf8db8e40  ! 1760: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_132:
	setx	0x2b0017, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_137:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_137), 16, 16)) -> intp(0, 0, 31)
	.word 0xb4a4c000  ! 1765: SUBcc_R	subcc 	%r19, %r0, %r26
	.word 0xb9e5c000  ! 1766: SAVE_R	save	%r23, %r0, %r28
	.word 0xbaad617e  ! 1767: ANDNcc_I	andncc 	%r21, 0x017e, %r29
	.word 0xb32d6001  ! 1768: SLL_I	sll 	%r21, 0x0001, %r25
	.word 0xbbe4611e  ! 1769: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb7e54000  ! 1770: SAVE_R	save	%r21, %r0, %r27
	.word 0xbbe4c000  ! 1772: SAVE_R	save	%r19, %r0, %r29
	.word 0xb1e40000  ! 1773: SAVE_R	save	%r16, %r0, %r24
	.word 0x8595e1bb  ! 1775: WRPR_TSTATE_I	wrpr	%r23, 0x01bb, %tstate
T0_asi_reg_rd_76:
	mov	0x3c1, %r14
	.word 0xfcdb89e0  ! 1778: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T0_asi_reg_wr_65:
	mov	0x28, %r14
	.word 0xfef38e60  ! 1779: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T0_asi_reg_wr_66:
	mov	0x13, %r14
	.word 0xf8f38e60  ! 1783: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbfe44000  ! 1784: SAVE_R	save	%r17, %r0, %r31
	.word 0xb5e54000  ! 1785: SAVE_R	save	%r21, %r0, %r26
	.word 0xbfe421ee  ! 1786: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb7643801  ! 1787: MOVcc_I	<illegal instruction>
	.word 0xb1e4a163  ! 1788: SAVE_I	save	%r18, 0x0001, %r24
iob_intr_0_138:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_138), 16, 16)) -> intp(0, 0, 32)
	.word 0x859420f8  ! 1791: WRPR_TSTATE_I	wrpr	%r16, 0x00f8, %tstate
	.word 0xb9e4207b  ! 1793: SAVE_I	save	%r16, 0x0001, %r28
iob_intr_0_139:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_139), 16, 16)) -> intp(0, 0, 28)
cpu_intr_0_133:
	setx	0x29033e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_67:
	mov	0x3c4, %r14
	.word 0xf4f38e80  ! 1799: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb1e4a1f6  ! 1801: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3e48000  ! 1805: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_rd_77:
	mov	0x35, %r14
	.word 0xfadb8e40  ! 1808: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb3e520ba  ! 1809: SAVE_I	save	%r20, 0x0001, %r25
cpu_intr_0_134:
	setx	0x280124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e12e  ! 1813: SAVE_I	save	%r23, 0x0001, %r24
cpu_intr_0_135:
	setx	0x2b0302, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_140:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_140), 16, 16)) -> intp(0, 0, 26)
	.word 0xbaa4e13c  ! 1817: SUBcc_I	subcc 	%r19, 0x013c, %r29
	.word 0xb5e460c7  ! 1819: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1e40000  ! 1821: SAVE_R	save	%r16, %r0, %r24
	.word 0xb0c5a168  ! 1822: ADDCcc_I	addccc 	%r22, 0x0168, %r24
cpu_intr_0_136:
	setx	0x2a0106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e17d  ! 1829: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbde50000  ! 1832: SAVE_R	save	%r20, %r0, %r30
	.word 0xb9e54000  ! 1837: SAVE_R	save	%r21, %r0, %r28
	.word 0xb1e54000  ! 1838: SAVE_R	save	%r21, %r0, %r24
	.word 0xb1e4e07c  ! 1839: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_wr_68:
	mov	0x31, %r14
	.word 0xf2f384a0  ! 1842: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb7e50000  ! 1843: SAVE_R	save	%r20, %r0, %r27
iob_intr_0_141:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_141), 16, 16)) -> intp(0, 0, 2e)
iob_intr_0_142:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_142), 16, 16)) -> intp(0, 0, d)
	.word 0xbbe58000  ! 1848: SAVE_R	save	%r22, %r0, %r29
iob_intr_0_143:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_143), 16, 16)) -> intp(0, 0, 35)
	.word 0xbbe4a0f1  ! 1854: SAVE_I	save	%r18, 0x0001, %r29
iob_intr_0_144:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_144), 16, 16)) -> intp(0, 0, 33)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_145:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_145), 16, 16)) -> intp(0, 0, f)
iob_intr_0_146:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_146), 16, 16)) -> intp(0, 0, 3d)
cpu_intr_0_137:
	setx	0x2c0233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb37d2401  ! 1867: MOVR_I	movre	%r20, 0x1, %r25
T0_asi_reg_wr_69:
	mov	0x3c8, %r14
	.word 0xf8f38e40  ! 1873: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbfe48000  ! 1875: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_138:
	setx	0x2c0109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde50000  ! 1878: SAVE_R	save	%r20, %r0, %r30
iob_intr_0_147:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_147), 16, 16)) -> intp(0, 0, 38)
	.word 0xb9e4c000  ! 1880: SAVE_R	save	%r19, %r0, %r28
iob_intr_0_148:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_148), 16, 16)) -> intp(0, 0, 2c)
iob_intr_0_149:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_149), 16, 16)) -> intp(0, 0, 7)
	.word 0xb1e50000  ! 1887: SAVE_R	save	%r20, %r0, %r24
iob_intr_0_150:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_150), 16, 16)) -> intp(0, 0, b)
T0_asi_reg_wr_70:
	mov	0x3c1, %r14
	.word 0xfaf389e0  ! 1893: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_0_151:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_151), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbde5e0f3  ! 1897: SAVE_I	save	%r23, 0x0001, %r30
T0_asi_reg_wr_71:
	mov	0x2f, %r14
	.word 0xf6f38e60  ! 1898: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_0_139:
	setx	0x30237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a00e  ! 1901: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_152:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_152), 16, 16)) -> intp(0, 0, 14)
	.word 0xb3e48000  ! 1904: SAVE_R	save	%r18, %r0, %r25
	.word 0xb8254000  ! 1905: SUB_R	sub 	%r21, %r0, %r28
	.word 0xb9e44000  ! 1907: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_wr_72:
	mov	0x3c0, %r14
	.word 0xf8f38e80  ! 1908: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T0_asi_reg_wr_73:
	mov	0x3c6, %r14
	.word 0xf8f38400  ! 1912: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbe2ca07e  ! 1915: ANDN_I	andn 	%r18, 0x007e, %r31
	.word 0xbbe4e0fc  ! 1918: SAVE_I	save	%r19, 0x0001, %r29
iob_intr_0_153:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_153), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_wr_74:
	mov	0x36, %r14
	.word 0xf4f389e0  ! 1922: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb68c6011  ! 1925: ANDcc_I	andcc 	%r17, 0x0011, %r27
T0_asi_reg_rd_78:
	mov	0x3c0, %r14
	.word 0xf8db89e0  ! 1926: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T0_asi_reg_wr_75:
	mov	0x3c5, %r14
	.word 0xf4f38e60  ! 1928: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb3e5e1da  ! 1933: SAVE_I	save	%r23, 0x0001, %r25
cpu_intr_0_140:
	setx	0x2d0230, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_141:
	setx	0x2c031a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_142:
	setx	0x2c013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4c000  ! 1939: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_143:
	setx	0x2f0028, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_154:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_154), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_wr_76:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 1943: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_155:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_155), 16, 16)) -> intp(0, 0, 28)
	.word 0xbde42150  ! 1949: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbb520000  ! 1953: RDPR_PIL	<illegal instruction>
T0_asi_reg_wr_77:
	mov	0x27, %r14
	.word 0xf4f389e0  ! 1958: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_0_144:
	setx	0x2f0227, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_145:
	setx	0x2f0019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a105  ! 1965: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_wr_78:
	mov	0x3c0, %r14
	.word 0xf4f38e40  ! 1967: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbde5215f  ! 1971: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbbe58000  ! 1974: SAVE_R	save	%r22, %r0, %r29
	.word 0xb3e460d4  ! 1975: SAVE_I	save	%r17, 0x0001, %r25
cpu_intr_0_146:
	setx	0x2d0129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_147:
	setx	0x2e011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e078  ! 1983: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb684a084  ! 1985: ADDcc_I	addcc 	%r18, 0x0084, %r27
T0_asi_reg_rd_79:
	mov	0x19, %r14
	.word 0xfedb89e0  ! 1991: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_0_156:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_156), 16, 16)) -> intp(0, 0, 3d)
iob_intr_0_157:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_157), 16, 16)) -> intp(0, 0, 15)
	.word 0xb404a07d  ! 1996: ADD_I	add 	%r18, 0x007d, %r26
cpu_intr_0_148:
	setx	0x2c022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e1d3  ! 1999: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbb354000  ! 2003: SRL_R	srl 	%r21, %r0, %r29
	.word 0xb8bdc000  ! 2005: XNORcc_R	xnorcc 	%r23, %r0, %r28
iob_intr_0_158:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_158), 16, 16)) -> intp(0, 0, c)
	.word 0xbfe58000  ! 2012: SAVE_R	save	%r22, %r0, %r31
iob_intr_0_159:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_159), 16, 16)) -> intp(0, 0, 36)
	.word 0xb9e54000  ! 2014: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_wr_79:
	mov	0x3c4, %r14
	.word 0xf2f384a0  ! 2015: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T0_asi_reg_rd_80:
	mov	0x3c2, %r14
	.word 0xf0db8e80  ! 2016: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_0_160:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_160), 16, 16)) -> intp(0, 0, 35)
T0_asi_reg_rd_81:
	mov	0x10, %r14
	.word 0xf6db8e40  ! 2029: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_161:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_161), 16, 16)) -> intp(0, 0, 8)
	.word 0xb1e54000  ! 2032: SAVE_R	save	%r21, %r0, %r24
	.word 0xb7e48000  ! 2034: SAVE_R	save	%r18, %r0, %r27
cpu_intr_0_149:
	setx	0x2c0115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5c000  ! 2036: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_150:
	setx	0x2e0020, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_151:
	setx	0x2d032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5349000  ! 2040: SRLX_R	srlx	%r18, %r0, %r26
	.word 0xbde5c000  ! 2041: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_152:
	setx	0x2e000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5643801  ! 2043: MOVcc_I	<illegal instruction>
	.word 0xbcb48000  ! 2046: SUBCcc_R	orncc 	%r18, %r0, %r30
T0_asi_reg_rd_82:
	mov	0xb, %r14
	.word 0xfedb8400  ! 2050: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_0_162:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_162), 16, 16)) -> intp(0, 0, 13)
iob_intr_0_163:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_163), 16, 16)) -> intp(0, 0, 23)
	.word 0xb7643801  ! 2056: MOVcc_I	<illegal instruction>
	.word 0xbfe5c000  ! 2059: SAVE_R	save	%r23, %r0, %r31
	.word 0xbfe46156  ! 2064: SAVE_I	save	%r17, 0x0001, %r31
iob_intr_0_164:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_164), 16, 16)) -> intp(0, 0, 10)
iob_intr_0_165:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_165), 16, 16)) -> intp(0, 0, 3)
	.word 0xbde40000  ! 2070: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_166:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_166), 16, 16)) -> intp(0, 0, 1e)
cpu_intr_0_153:
	setx	0x2d0110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e44000  ! 2078: SAVE_R	save	%r17, %r0, %r24
	.word 0xb7e50000  ! 2080: SAVE_R	save	%r20, %r0, %r27
cpu_intr_0_154:
	setx	0x2f0129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_155:
	setx	0x2e020c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_167:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_167), 16, 16)) -> intp(0, 0, 3)
	.word 0xb5e4c000  ! 2086: SAVE_R	save	%r19, %r0, %r26
T0_asi_reg_wr_80:
	mov	0x2d, %r14
	.word 0xf6f38400  ! 2087: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbbe42198  ! 2091: SAVE_I	save	%r16, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_168:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_168), 16, 16)) -> intp(0, 0, 1f)
iob_intr_0_169:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_169), 16, 16)) -> intp(0, 0, 1a)
iob_intr_0_170:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_170), 16, 16)) -> intp(0, 0, 39)
	.word 0xbc246170  ! 2102: SUB_I	sub 	%r17, 0x0170, %r30
	.word 0xb7e5c000  ! 2103: SAVE_R	save	%r23, %r0, %r27
	.word 0xb3e5e017  ! 2104: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_wr_81:
	mov	0x2a, %r14
	.word 0xfcf389e0  ! 2105: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb4ad0000  ! 2106: ANDNcc_R	andncc 	%r20, %r0, %r26
	.word 0xbde58000  ! 2108: SAVE_R	save	%r22, %r0, %r30
	.word 0xb5e4a10e  ! 2109: SAVE_I	save	%r18, 0x0001, %r26
T0_asi_reg_rd_83:
	mov	0x32, %r14
	.word 0xf0db8e40  ! 2115: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_wr_82:
	mov	0x7, %r14
	.word 0xf2f38e40  ! 2116: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_rd_84:
	mov	0xd, %r14
	.word 0xfedb8e40  ! 2118: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb3e4c000  ! 2120: SAVE_R	save	%r19, %r0, %r25
cpu_intr_0_156:
	setx	0x2c0304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_171:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_171), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_rd_85:
	mov	0x5, %r14
	.word 0xfedb8400  ! 2125: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbfe58000  ! 2126: SAVE_R	save	%r22, %r0, %r31
cpu_intr_0_157:
	setx	0x2d031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e460f3  ! 2130: SAVE_I	save	%r17, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_172:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_172), 16, 16)) -> intp(0, 0, 9)
	.word 0xb1e54000  ! 2137: SAVE_R	save	%r21, %r0, %r24
cpu_intr_0_158:
	setx	0x2c0228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e0bd  ! 2140: SAVE_I	save	%r23, 0x0001, %r29
cpu_intr_0_159:
	setx	0x2f0110, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_173:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_173), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_wr_83:
	mov	0x28, %r14
	.word 0xf8f38e60  ! 2143: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb6850000  ! 2145: ADDcc_R	addcc 	%r20, %r0, %r27
	.word 0xb1e42062  ! 2150: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9e5e119  ! 2151: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e4a108  ! 2152: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbfe5c000  ! 2154: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_174:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_174), 16, 16)) -> intp(0, 0, a)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8f902001  ! 2157: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xb3e5a00f  ! 2158: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb3e52004  ! 2159: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb7e520c2  ! 2160: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb5e48000  ! 2168: SAVE_R	save	%r18, %r0, %r26
cpu_intr_0_160:
	setx	0x2c0029, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_84:
	mov	0x2, %r14
	.word 0xfaf38e60  ! 2170: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T0_asi_reg_wr_85:
	mov	0x1c, %r14
	.word 0xfef38e80  ! 2173: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T0_asi_reg_rd_86:
	mov	0x1d, %r14
	.word 0xf6db8e60  ! 2175: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb9e5c000  ! 2176: SAVE_R	save	%r23, %r0, %r28
iob_intr_0_175:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_175), 16, 16)) -> intp(0, 0, 21)
cpu_intr_0_161:
	setx	0x2d0329, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_86:
	mov	0xe, %r14
	.word 0xf8f38e40  ! 2183: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_162:
	setx	0x2c0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e54000  ! 2187: SAVE_R	save	%r21, %r0, %r28
iob_intr_0_176:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_176), 16, 16)) -> intp(0, 0, 6)
cpu_intr_0_163:
	setx	0x2c0223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a03f  ! 2197: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb33c4000  ! 2199: SRA_R	sra 	%r17, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb08d8000  ! 2205: ANDcc_R	andcc 	%r22, %r0, %r24
	.word 0xb6340000  ! 2206: ORN_R	orn 	%r16, %r0, %r27
	.word 0xb4bc8000  ! 2209: XNORcc_R	xnorcc 	%r18, %r0, %r26
T0_asi_reg_rd_87:
	mov	0x3c5, %r14
	.word 0xfcdb8e80  ! 2213: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_0_164:
	setx	0x2e002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb33c5000  ! 2215: SRAX_R	srax	%r17, %r0, %r25
	.word 0xbfe50000  ! 2216: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_rd_88:
	mov	0x36, %r14
	.word 0xf4db84a0  ! 2218: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb42dc000  ! 2220: ANDN_R	andn 	%r23, %r0, %r26
iob_intr_0_177:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_177), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb7e5e192  ! 2223: SAVE_I	save	%r23, 0x0001, %r27
iob_intr_0_178:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_178), 16, 16)) -> intp(0, 0, 3c)
cpu_intr_0_165:
	setx	0x2d000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5213b  ! 2230: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbfe561f0  ! 2231: SAVE_I	save	%r21, 0x0001, %r31
iob_intr_0_179:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_179), 16, 16)) -> intp(0, 0, 32)
	.word 0xbc9d2129  ! 2233: XORcc_I	xorcc 	%r20, 0x0129, %r30
	.word 0xb1e40000  ! 2240: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_180:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_180), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_181:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_181), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb9e4c000  ! 2250: SAVE_R	save	%r19, %r0, %r28
cpu_intr_0_166:
	setx	0x2c022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4212e  ! 2254: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e4e1c3  ! 2255: SAVE_I	save	%r19, 0x0001, %r27
cpu_intr_0_167:
	setx	0x2e0224, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_89:
	mov	0x3c0, %r14
	.word 0xfadb8e40  ! 2261: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_rd_90:
	mov	0x20, %r14
	.word 0xf8db8e40  ! 2264: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbe844000  ! 2268: ADDcc_R	addcc 	%r17, %r0, %r31
	.word 0xb5e58000  ! 2272: SAVE_R	save	%r22, %r0, %r26
	.word 0xbb641800  ! 2273: MOVcc_R	<illegal instruction>
T0_asi_reg_rd_91:
	mov	0x31, %r14
	.word 0xfcdb84a0  ! 2274: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_0_168:
	setx	0x2e011e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_169:
	setx	0x2f0315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e44000  ! 2280: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_wr_87:
	mov	0x3c1, %r14
	.word 0xf4f38e40  ! 2281: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_170:
	setx	0x2f0133, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_182:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_182), 16, 16)) -> intp(0, 0, 19)
iob_intr_0_183:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_183), 16, 16)) -> intp(0, 0, 1)
T0_asi_reg_rd_92:
	mov	0x12, %r14
	.word 0xf0db8e40  ! 2290: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_184:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_184), 16, 16)) -> intp(0, 0, 35)
	.word 0xb7e4c000  ! 2292: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_rd_93:
	mov	0xb, %r14
	.word 0xf2db8e80  ! 2293: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb5e4a033  ! 2294: SAVE_I	save	%r18, 0x0001, %r26
T0_asi_reg_wr_88:
	mov	0x32, %r14
	.word 0xfaf389e0  ! 2302: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb0ac0000  ! 2304: ANDNcc_R	andncc 	%r16, %r0, %r24
cpu_intr_0_171:
	setx	0x2c0026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5c000  ! 2310: SAVE_R	save	%r23, %r0, %r31
	.word 0xb29cc000  ! 2312: XORcc_R	xorcc 	%r19, %r0, %r25
	.word 0xb2052040  ! 2314: ADD_I	add 	%r20, 0x0040, %r25
	.word 0xba0ce11c  ! 2315: AND_I	and 	%r19, 0x011c, %r29
cpu_intr_0_172:
	setx	0x300205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b50000  ! 2319: SUBCcc_R	orncc 	%r20, %r0, %r28
iob_intr_0_185:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_185), 16, 16)) -> intp(0, 0, 3d)
T0_asi_reg_wr_89:
	mov	0x3c3, %r14
	.word 0xf8f38e80  ! 2327: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_0_186:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_186), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_rd_94:
	mov	0x1d, %r14
	.word 0xf6db8400  ! 2334: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb73d1000  ! 2335: SRAX_R	srax	%r20, %r0, %r27
iob_intr_0_187:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_187), 16, 16)) -> intp(0, 0, 3c)
iob_intr_0_188:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_188), 16, 16)) -> intp(0, 0, 3c)
	.word 0xba1ca113  ! 2342: XOR_I	xor 	%r18, 0x0113, %r29
iob_intr_0_189:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_189), 16, 16)) -> intp(0, 0, b)
T0_asi_reg_wr_90:
	mov	0x4, %r14
	.word 0xfaf38e40  ! 2345: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_190:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_190), 16, 16)) -> intp(0, 0, 3a)
iob_intr_0_191:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_191), 16, 16)) -> intp(0, 0, 17)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_173:
	setx	0x300010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e56135  ! 2356: SAVE_I	save	%r21, 0x0001, %r26
T0_asi_reg_wr_91:
	mov	0x34, %r14
	.word 0xfef38400  ! 2357: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_0_192:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_192), 16, 16)) -> intp(0, 0, 2e)
T0_asi_reg_wr_92:
	mov	0x1, %r14
	.word 0xf2f38e60  ! 2363: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xbde420cf  ! 2364: SAVE_I	save	%r16, 0x0001, %r30
iob_intr_0_193:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_193), 16, 16)) -> intp(0, 0, 3d)
cpu_intr_0_174:
	setx	0x32023b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_93:
	mov	0x13, %r14
	.word 0xfef38e40  ! 2373: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xba85214f  ! 2375: ADDcc_I	addcc 	%r20, 0x014f, %r29
cpu_intr_0_175:
	setx	0x310314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb348000  ! 2377: SRL_R	srl 	%r18, %r0, %r29
T0_asi_reg_wr_94:
	mov	0x19, %r14
	.word 0xfef38e40  ! 2378: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_wr_95:
	mov	0x3c7, %r14
	.word 0xf2f389e0  ! 2379: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb5e5c000  ! 2381: SAVE_R	save	%r23, %r0, %r26
	.word 0xbde4e095  ! 2382: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb9e44000  ! 2383: SAVE_R	save	%r17, %r0, %r28
	.word 0xb035c000  ! 2384: ORN_R	orn 	%r23, %r0, %r24
iob_intr_0_194:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_194), 16, 16)) -> intp(0, 0, 30)
	.word 0xbde4a13f  ! 2387: SAVE_I	save	%r18, 0x0001, %r30
cpu_intr_0_176:
	setx	0x300115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2bd8000  ! 2390: XNORcc_R	xnorcc 	%r22, %r0, %r25
	.word 0xbb2c8000  ! 2391: SLL_R	sll 	%r18, %r0, %r29
	.word 0xbfe50000  ! 2397: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_rd_95:
	mov	0x3c8, %r14
	.word 0xf2db84a0  ! 2399: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbde520fe  ! 2400: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_wr_96:
	mov	0x30, %r14
	.word 0xf0f38400  ! 2401: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_0_177:
	setx	0x330300, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_97:
	mov	0x2e, %r14
	.word 0xf4f384a0  ! 2405: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_0_195:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_195), 16, 16)) -> intp(0, 0, 32)
	.word 0xb1e5c000  ! 2412: SAVE_R	save	%r23, %r0, %r24
iob_intr_0_196:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_196), 16, 16)) -> intp(0, 0, 38)
	.word 0xb1e44000  ! 2415: SAVE_R	save	%r17, %r0, %r24
	.word 0xbde52077  ! 2422: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_rd_96:
	mov	0xf, %r14
	.word 0xf0db8e80  ! 2425: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb004612a  ! 2429: ADD_I	add 	%r17, 0x012a, %r24
T0_asi_reg_rd_97:
	mov	0x29, %r14
	.word 0xfedb8e60  ! 2430: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_0_197:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_197), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_wr_98:
	mov	0x38, %r14
	.word 0xfcf38e80  ! 2437: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb83c8000  ! 2447: XNOR_R	xnor 	%r18, %r0, %r28
cpu_intr_0_178:
	setx	0x330230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e48000  ! 2449: SAVE_R	save	%r18, %r0, %r27
T0_asi_reg_wr_99:
	mov	0x3c5, %r14
	.word 0xf4f384a0  ! 2450: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb20d4000  ! 2451: AND_R	and 	%r21, %r0, %r25
T0_asi_reg_wr_100:
	mov	0x3c0, %r14
	.word 0xf8f38400  ! 2453: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_0_179:
	setx	0x30011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe58000  ! 2457: SAVE_R	save	%r22, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e44000  ! 2463: SAVE_R	save	%r17, %r0, %r27
cpu_intr_0_180:
	setx	0x320000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a1cf  ! 2466: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbde48000  ! 2472: SAVE_R	save	%r18, %r0, %r30
T0_asi_reg_rd_98:
	mov	0x31, %r14
	.word 0xfcdb8e40  ! 2479: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xba356143  ! 2482: ORN_I	orn 	%r21, 0x0143, %r29
	.word 0xbde4a175  ! 2485: SAVE_I	save	%r18, 0x0001, %r30
cpu_intr_0_181:
	setx	0x320127, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_182:
	setx	0x320104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0adc000  ! 2490: ANDNcc_R	andncc 	%r23, %r0, %r24
	.word 0xba05c000  ! 2491: ADD_R	add 	%r23, %r0, %r29
	.word 0xbde4c000  ! 2495: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_wr_101:
	mov	0x2f, %r14
	.word 0xf6f38e40  ! 2496: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb7e48000  ! 2497: SAVE_R	save	%r18, %r0, %r27
	.word 0xb7e40000  ! 2498: SAVE_R	save	%r16, %r0, %r27
iob_intr_0_198:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_198), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb7e50000  ! 2502: SAVE_R	save	%r20, %r0, %r27
	.word 0xb5e58000  ! 2507: SAVE_R	save	%r22, %r0, %r26
	.word 0xb3e5607a  ! 2508: SAVE_I	save	%r21, 0x0001, %r25
cpu_intr_0_183:
	setx	0x33022a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_99:
	mov	0x3c1, %r14
	.word 0xf4db89e0  ! 2512: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb2058000  ! 2513: ADD_R	add 	%r22, %r0, %r25
T0_asi_reg_wr_102:
	mov	0x3c1, %r14
	.word 0xf4f38e80  ! 2518: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_0_184:
	setx	0x31032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e48000  ! 2530: SAVE_R	save	%r18, %r0, %r24
	.word 0xbde4e160  ! 2531: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbfe54000  ! 2532: SAVE_R	save	%r21, %r0, %r31
T0_asi_reg_wr_103:
	mov	0x3c5, %r14
	.word 0xf2f38e40  ! 2536: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_199:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_199), 16, 16)) -> intp(0, 0, 9)
	.word 0xbfe5607b  ! 2541: SAVE_I	save	%r21, 0x0001, %r31
iob_intr_0_200:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_200), 16, 16)) -> intp(0, 0, 39)
cpu_intr_0_185:
	setx	0x31001c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_186:
	setx	0x300334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6340000  ! 2548: ORN_R	orn 	%r16, %r0, %r27
T0_asi_reg_rd_100:
	mov	0x27, %r14
	.word 0xf6db8e40  ! 2549: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbbe4e086  ! 2552: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb43ce0f0  ! 2553: XNOR_I	xnor 	%r19, 0x00f0, %r26
	.word 0xbb34c000  ! 2559: SRL_R	srl 	%r19, %r0, %r29
	.word 0xbbe560d4  ! 2560: SAVE_I	save	%r21, 0x0001, %r29
T0_asi_reg_rd_101:
	mov	0x25, %r14
	.word 0xf6db8e40  ! 2561: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbfe56160  ! 2565: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb69460bb  ! 2566: ORcc_I	orcc 	%r17, 0x00bb, %r27
cpu_intr_0_187:
	setx	0x30030d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_102:
	mov	0xb, %r14
	.word 0xfcdb8e80  ! 2569: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T0_asi_reg_wr_104:
	mov	0x23, %r14
	.word 0xf6f389e0  ! 2570: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_0_188:
	setx	0x320100, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_105:
	mov	0xf, %r14
	.word 0xf0f38e40  ! 2577: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_0_201:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_201), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbfe46051  ! 2588: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_wr_106:
	mov	0x21, %r14
	.word 0xfcf389e0  ! 2589: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb3e5613c  ! 2591: SAVE_I	save	%r21, 0x0001, %r25
cpu_intr_0_189:
	setx	0x300311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5200d  ! 2596: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb7e42024  ! 2597: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb9e50000  ! 2599: SAVE_R	save	%r20, %r0, %r28
	.word 0xb7e58000  ! 2601: SAVE_R	save	%r22, %r0, %r27
cpu_intr_0_190:
	setx	0x320314, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_202:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_202), 16, 16)) -> intp(0, 0, 10)
cpu_intr_0_191:
	setx	0x300016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe421f6  ! 2608: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7e5212f  ! 2609: SAVE_I	save	%r20, 0x0001, %r27
T0_asi_reg_rd_103:
	mov	0xb, %r14
	.word 0xf6db8e60  ! 2610: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_0_192:
	setx	0x320010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e520ad  ! 2614: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbbe54000  ! 2615: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_203:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_203), 16, 16)) -> intp(0, 0, 37)
cpu_intr_0_193:
	setx	0x30011a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_194:
	setx	0x30031d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_107:
	mov	0x34, %r14
	.word 0xf6f389e0  ! 2632: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_0_195:
	setx	0x300102, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_204:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_204), 16, 16)) -> intp(0, 0, 5)
cpu_intr_0_196:
	setx	0x300302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 2643: SAVE_R	save	%r16, %r0, %r24
	.word 0xbfe5c000  ! 2644: SAVE_R	save	%r23, %r0, %r31
	.word 0xba8d0000  ! 2646: ANDcc_R	andcc 	%r20, %r0, %r29
	.word 0xb644212a  ! 2647: ADDC_I	addc 	%r16, 0x012a, %r27
	.word 0xb9e420f4  ! 2649: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb1e4c000  ! 2650: SAVE_R	save	%r19, %r0, %r24
T0_asi_reg_wr_108:
	mov	0x33, %r14
	.word 0xf2f38e60  ! 2655: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb7e5a0de  ! 2656: SAVE_I	save	%r22, 0x0001, %r27
iob_intr_0_205:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_205), 16, 16)) -> intp(0, 0, 12)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_206:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_206), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_rd_104:
	mov	0x14, %r14
	.word 0xf8db8e40  ! 2671: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb9e5a042  ! 2674: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbbe5c000  ! 2675: SAVE_R	save	%r23, %r0, %r29
T0_asi_reg_wr_109:
	mov	0x3c2, %r14
	.word 0xf0f38e60  ! 2676: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T0_asi_reg_rd_105:
	mov	0x1b, %r14
	.word 0xf0db84a0  ! 2678: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_0_207:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_207), 16, 16)) -> intp(0, 0, 39)
	.word 0xbd2ce001  ! 2683: SLL_I	sll 	%r19, 0x0001, %r30
	.word 0xbde58000  ! 2684: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_197:
	setx	0x320323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5c000  ! 2693: SAVE_R	save	%r23, %r0, %r24
	.word 0xb9e5a134  ! 2696: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7e52039  ! 2698: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb02cc000  ! 2700: ANDN_R	andn 	%r19, %r0, %r24
	.word 0xbbe5e0cd  ! 2709: SAVE_I	save	%r23, 0x0001, %r29
cpu_intr_0_198:
	setx	0x32013b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_199:
	setx	0x330316, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_200:
	setx	0x310103, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_208:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_208), 16, 16)) -> intp(0, 0, 33)
cpu_intr_0_201:
	setx	0x330301, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_202:
	setx	0x310236, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_106:
	mov	0x22, %r14
	.word 0xf4db89e0  ! 2727: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbfe5e1e5  ! 2729: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbbe421c1  ! 2730: SAVE_I	save	%r16, 0x0001, %r29
cpu_intr_0_203:
	setx	0x300333, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_209:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_209), 16, 16)) -> intp(0, 0, 2e)
	.word 0xbfe50000  ! 2734: SAVE_R	save	%r20, %r0, %r31
	.word 0xb5e40000  ! 2735: SAVE_R	save	%r16, %r0, %r26
	.word 0xb3e4618c  ! 2736: SAVE_I	save	%r17, 0x0001, %r25
cpu_intr_0_204:
	setx	0x330111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5602a  ! 2738: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e40000  ! 2741: SAVE_R	save	%r16, %r0, %r27
T0_asi_reg_rd_107:
	mov	0x1a, %r14
	.word 0xf6db8e80  ! 2742: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbde44000  ! 2745: SAVE_R	save	%r17, %r0, %r30
	.word 0xb8352125  ! 2748: SUBC_I	orn 	%r20, 0x0125, %r28
T0_asi_reg_wr_110:
	mov	0x20, %r14
	.word 0xf2f38e80  ! 2749: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb1e5e0e0  ! 2754: SAVE_I	save	%r23, 0x0001, %r24
cpu_intr_0_205:
	setx	0x31023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e560f0  ! 2758: SAVE_I	save	%r21, 0x0001, %r25
cpu_intr_0_206:
	setx	0x30003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e58000  ! 2760: SAVE_R	save	%r22, %r0, %r27
	.word 0xbde5a13c  ! 2763: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb9e44000  ! 2765: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_wr_111:
	mov	0x4, %r14
	.word 0xf2f389e0  ! 2767: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb7e5e0a7  ! 2768: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbbe58000  ! 2770: SAVE_R	save	%r22, %r0, %r29
T0_asi_reg_wr_112:
	mov	0x31, %r14
	.word 0xf4f38e80  ! 2771: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbde58000  ! 2777: SAVE_R	save	%r22, %r0, %r30
	.word 0xb244c000  ! 2779: ADDC_R	addc 	%r19, %r0, %r25
T0_asi_reg_wr_113:
	mov	0x3c0, %r14
	.word 0xfaf389e0  ! 2782: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbde5212f  ! 2784: SAVE_I	save	%r20, 0x0001, %r30
cpu_intr_0_207:
	setx	0x340222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e46141  ! 2787: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_210:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_210), 16, 16)) -> intp(0, 0, 11)
	.word 0xb5e4c000  ! 2790: SAVE_R	save	%r19, %r0, %r26
	.word 0xbde48000  ! 2791: SAVE_R	save	%r18, %r0, %r30
	.word 0xb9e44000  ! 2794: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_rd_108:
	mov	0x3c1, %r14
	.word 0xfcdb8e60  ! 2796: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T0_asi_reg_wr_114:
	mov	0x8, %r14
	.word 0xfef38400  ! 2797: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_0_208:
	setx	0x36023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e461cc  ! 2799: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb9e5c000  ! 2800: SAVE_R	save	%r23, %r0, %r28
T0_asi_reg_rd_109:
	mov	0x3c7, %r14
	.word 0xfedb8400  ! 2803: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb3e56198  ! 2806: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb1e460e4  ! 2808: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbbe58000  ! 2809: SAVE_R	save	%r22, %r0, %r29
	.word 0xbbe5c000  ! 2810: SAVE_R	save	%r23, %r0, %r29
T0_asi_reg_rd_110:
	mov	0x32, %r14
	.word 0xfadb8e60  ! 2811: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T0_asi_reg_rd_111:
	mov	0x17, %r14
	.word 0xf0db8e80  ! 2812: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_0_211:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_211), 16, 16)) -> intp(0, 0, 28)
	.word 0xbde50000  ! 2816: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_wr_115:
	mov	0x2b, %r14
	.word 0xf6f384a0  ! 2818: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_0_209:
	setx	0x340228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb444201b  ! 2823: ADDC_I	addc 	%r16, 0x001b, %r26
T0_asi_reg_wr_116:
	mov	0x1e, %r14
	.word 0xf4f384a0  ! 2824: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_0_210:
	setx	0x340128, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_212:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_212), 16, 16)) -> intp(0, 0, 33)
	.word 0xbbe48000  ! 2832: SAVE_R	save	%r18, %r0, %r29
iob_intr_0_213:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_213), 16, 16)) -> intp(0, 0, 22)
	.word 0xbde4605d  ! 2836: SAVE_I	save	%r17, 0x0001, %r30
cpu_intr_0_211:
	setx	0x370027, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_214:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_214), 16, 16)) -> intp(0, 0, 1)
iob_intr_0_215:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_215), 16, 16)) -> intp(0, 0, 27)
T0_asi_reg_rd_112:
	mov	0x1c, %r14
	.word 0xfadb8e40  ! 2845: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb1e48000  ! 2846: SAVE_R	save	%r18, %r0, %r24
cpu_intr_0_212:
	setx	0x340008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4c000  ! 2858: SAVE_R	save	%r19, %r0, %r24
cpu_intr_0_213:
	setx	0x37030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_117:
	mov	0x38, %r14
	.word 0xf2f38e40  ! 2863: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbcac6158  ! 2864: ANDNcc_I	andncc 	%r17, 0x0158, %r30
cpu_intr_0_214:
	setx	0x37000b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_216:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_216), 16, 16)) -> intp(0, 0, c)
	.word 0xb7e5c000  ! 2871: SAVE_R	save	%r23, %r0, %r27
	.word 0xb5643801  ! 2872: MOVcc_I	<illegal instruction>
	.word 0xb77ce401  ! 2874: MOVR_I	movre	%r19, 0x1, %r27
cpu_intr_0_215:
	setx	0x340337, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_118:
	mov	0x3c2, %r14
	.word 0xf8f38e60  ! 2876: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_0_217:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_217), 16, 16)) -> intp(0, 0, 3a)
iob_intr_0_218:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_218), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb5e520ce  ! 2885: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbbe50000  ! 2886: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_wr_119:
	mov	0x3c4, %r14
	.word 0xfcf38e40  ! 2887: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_219:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_219), 16, 16)) -> intp(0, 0, 32)
	.word 0xbfe4e0b7  ! 2890: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_220:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_220), 16, 16)) -> intp(0, 0, 1f)
cpu_intr_0_216:
	setx	0x370038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_221:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_221), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_222:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_222), 16, 16)) -> intp(0, 0, 14)
	.word 0xb7e44000  ! 2902: SAVE_R	save	%r17, %r0, %r27
	.word 0xb5e5201f  ! 2903: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb1e56197  ! 2905: SAVE_I	save	%r21, 0x0001, %r24
T0_asi_reg_rd_113:
	mov	0x3c0, %r14
	.word 0xf4db89e0  ! 2906: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb9e58000  ! 2908: SAVE_R	save	%r22, %r0, %r28
	.word 0xb9e40000  ! 2909: SAVE_R	save	%r16, %r0, %r28
T0_asi_reg_rd_114:
	mov	0x3c5, %r14
	.word 0xf8db8e60  ! 2911: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb3e50000  ! 2913: SAVE_R	save	%r20, %r0, %r25
T0_asi_reg_wr_120:
	mov	0x3c3, %r14
	.word 0xfef38e40  ! 2915: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb1e5c000  ! 2919: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_wr_121:
	mov	0x20, %r14
	.word 0xf0f38e60  ! 2921: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T0_asi_reg_wr_122:
	mov	0x11, %r14
	.word 0xf8f38e40  ! 2924: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_217:
	setx	0x360109, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_115:
	mov	0x3c1, %r14
	.word 0xf2db89e0  ! 2929: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_0_218:
	setx	0x350207, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_219:
	setx	0x350033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe42193  ! 2934: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_223:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_223), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb3e5201b  ! 2939: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbbe4c000  ! 2941: SAVE_R	save	%r19, %r0, %r29
iob_intr_0_224:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_224), 16, 16)) -> intp(0, 0, 33)
T0_asi_reg_wr_123:
	mov	0x31, %r14
	.word 0xfef38400  ! 2945: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T0_asi_reg_wr_124:
	mov	0x3c7, %r14
	.word 0xf6f384a0  ! 2949: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_0_225:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_225), 16, 16)) -> intp(0, 0, 2f)
	.word 0xbfe48000  ! 2957: SAVE_R	save	%r18, %r0, %r31
	.word 0xbbe5a18b  ! 2961: SAVE_I	save	%r22, 0x0001, %r29
T0_asi_reg_wr_125:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 2963: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb1e4c000  ! 2965: SAVE_R	save	%r19, %r0, %r24
cpu_intr_0_220:
	setx	0x34023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e58000  ! 2968: SAVE_R	save	%r22, %r0, %r25
T0_asi_reg_rd_116:
	mov	0xb, %r14
	.word 0xfadb8e40  ! 2969: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_wr_126:
	mov	0x22, %r14
	.word 0xf6f38e60  ! 2970: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_0_221:
	setx	0x34002c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_226:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_226), 16, 16)) -> intp(0, 0, 20)
	.word 0xbfe5217a  ! 2975: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb60ca07e  ! 2977: AND_I	and 	%r18, 0x007e, %r27
T0_asi_reg_rd_117:
	mov	0x3c5, %r14
	.word 0xfcdb8e40  ! 2980: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbfe58000  ! 2981: SAVE_R	save	%r22, %r0, %r31
iob_intr_0_227:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_227), 16, 16)) -> intp(0, 0, 28)
	.word 0xb3e521d7  ! 2985: SAVE_I	save	%r20, 0x0001, %r25
iob_intr_0_228:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_228), 16, 16)) -> intp(0, 0, 1)
	.word 0xbbe52159  ! 2993: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb934d000  ! 2994: SRLX_R	srlx	%r19, %r0, %r28
T0_asi_reg_wr_127:
	mov	0x2e, %r14
	.word 0xf8f38e40  ! 2996: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_222:
	setx	0x350231, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_229:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_229), 16, 16)) -> intp(0, 0, 1d)
	.word 0xbbe58000  ! 2999: SAVE_R	save	%r22, %r0, %r29
T0_asi_reg_wr_128:
	mov	0x1f, %r14
	.word 0xf2f389e0  ! 3000: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T0_asi_reg_rd_118:
	mov	0x3c6, %r14
	.word 0xf6db8400  ! 3001: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb5e42159  ! 3002: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7e561b8  ! 3003: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb1e54000  ! 3005: SAVE_R	save	%r21, %r0, %r24
cpu_intr_0_223:
	setx	0x36032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e40000  ! 3007: SAVE_R	save	%r16, %r0, %r26
cpu_intr_0_224:
	setx	0x340232, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_119:
	mov	0x17, %r14
	.word 0xf2db8e40  ! 3009: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb1e4c000  ! 3011: SAVE_R	save	%r19, %r0, %r24
iob_intr_0_230:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_230), 16, 16)) -> intp(0, 0, 12)
	.word 0xb5e561d3  ! 3013: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbbe50000  ! 3014: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_231:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_231), 16, 16)) -> intp(0, 0, c)
T0_asi_reg_rd_120:
	mov	0x25, %r14
	.word 0xf2db8e40  ! 3020: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xba15c000  ! 3023: OR_R	or 	%r23, %r0, %r29
cpu_intr_0_225:
	setx	0x370004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a118  ! 3028: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3e5c000  ! 3029: SAVE_R	save	%r23, %r0, %r25
iob_intr_0_232:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_232), 16, 16)) -> intp(0, 0, 8)
	.word 0xb9e5e03f  ! 3032: SAVE_I	save	%r23, 0x0001, %r28
cpu_intr_0_226:
	setx	0x36011a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_233:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_233), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_rd_121:
	mov	0x3c7, %r14
	.word 0xfcdb8400  ! 3037: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_0_234:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_234), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_wr_129:
	mov	0x3c6, %r14
	.word 0xf0f38e60  ! 3039: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb61d2047  ! 3041: XOR_I	xor 	%r20, 0x0047, %r27
	.word 0xbd358000  ! 3045: SRL_R	srl 	%r22, %r0, %r30
	.word 0xb1359000  ! 3046: SRLX_R	srlx	%r22, %r0, %r24
	.word 0xbfe46060  ! 3047: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_rd_122:
	mov	0x2b, %r14
	.word 0xf0db8e40  ! 3048: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_235:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_235), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb7e52083  ! 3050: SAVE_I	save	%r20, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_227:
	setx	0x360102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4c000  ! 3059: SAVE_R	save	%r19, %r0, %r26
	.word 0xbbe5a142  ! 3065: SAVE_I	save	%r22, 0x0001, %r29
T0_asi_reg_wr_130:
	mov	0x11, %r14
	.word 0xfcf38e80  ! 3066: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb12c3001  ! 3068: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0xb32c6001  ! 3069: SLL_I	sll 	%r17, 0x0001, %r25
cpu_intr_0_228:
	setx	0x350101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e40000  ! 3072: SAVE_R	save	%r16, %r0, %r25
	.word 0xbfe4e1fe  ! 3073: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_236:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_236), 16, 16)) -> intp(0, 0, 2)
cpu_intr_0_229:
	setx	0x360118, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_237:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_237), 16, 16)) -> intp(0, 0, 3d)
cpu_intr_0_230:
	setx	0x350027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe58000  ! 3082: SAVE_R	save	%r22, %r0, %r29
cpu_intr_0_231:
	setx	0x340033, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_238:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_238), 16, 16)) -> intp(0, 0, 2)
	.word 0x839421cb  ! 3091: WRPR_TNPC_I	wrpr	%r16, 0x01cb, %tnpc
iob_intr_0_239:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_239), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_rd_123:
	mov	0x3c2, %r14
	.word 0xf0db8e60  ! 3098: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbde58000  ! 3099: SAVE_R	save	%r22, %r0, %r30
	.word 0xbc04e06e  ! 3102: ADD_I	add 	%r19, 0x006e, %r30
T0_asi_reg_wr_131:
	mov	0x34, %r14
	.word 0xf2f38e40  ! 3104: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_240:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_240), 16, 16)) -> intp(0, 0, 4)
T0_asi_reg_rd_124:
	mov	0x3c8, %r14
	.word 0xfcdb8400  ! 3108: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_0_232:
	setx	0x360221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde56074  ! 3110: SAVE_I	save	%r21, 0x0001, %r30
cpu_intr_0_233:
	setx	0x360116, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_234:
	setx	0x34000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe58000  ! 3118: SAVE_R	save	%r22, %r0, %r31
cpu_intr_0_235:
	setx	0x340313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e50000  ! 3121: SAVE_R	save	%r20, %r0, %r26
cpu_intr_0_236:
	setx	0x36010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e11a  ! 3124: SAVE_I	save	%r23, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e50000  ! 3128: SAVE_R	save	%r20, %r0, %r26
cpu_intr_0_237:
	setx	0x34012e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_132:
	mov	0x6, %r14
	.word 0xfcf384a0  ! 3130: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb3e54000  ! 3131: SAVE_R	save	%r21, %r0, %r25
	.word 0xbbe560bc  ! 3133: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbb2cb001  ! 3134: SLLX_I	sllx	%r18, 0x0001, %r29
iob_intr_0_241:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_241), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb7e5c000  ! 3136: SAVE_R	save	%r23, %r0, %r27
	.word 0xbde56021  ! 3137: SAVE_I	save	%r21, 0x0001, %r30
T0_asi_reg_wr_133:
	mov	0xb, %r14
	.word 0xfaf384a0  ! 3143: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb7e5e0e6  ! 3152: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb9e5219a  ! 3153: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb7e4a052  ! 3154: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_wr_134:
	mov	0x3, %r14
	.word 0xfef38e40  ! 3159: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb9e54000  ! 3161: SAVE_R	save	%r21, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe5e1a8  ! 3164: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbde560e1  ! 3165: SAVE_I	save	%r21, 0x0001, %r30
iob_intr_0_242:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_242), 16, 16)) -> intp(0, 0, 26)
	.word 0xbbe56085  ! 3173: SAVE_I	save	%r21, 0x0001, %r29
T0_asi_reg_wr_135:
	mov	0x20, %r14
	.word 0xfaf384a0  ! 3177: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_0_238:
	setx	0x350330, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_243:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_243), 16, 16)) -> intp(0, 0, 24)
	.word 0xb1e5c000  ! 3184: SAVE_R	save	%r23, %r0, %r24
iob_intr_0_244:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_244), 16, 16)) -> intp(0, 0, 37)
	.word 0xb3e4a15b  ! 3191: SAVE_I	save	%r18, 0x0001, %r25
iob_intr_0_245:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_245), 16, 16)) -> intp(0, 0, 21)
T0_asi_reg_wr_136:
	mov	0x19, %r14
	.word 0xf4f38e40  ! 3194: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_239:
	setx	0x370333, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_246:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_246), 16, 16)) -> intp(0, 0, 2c)
iob_intr_0_247:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_247), 16, 16)) -> intp(0, 0, 18)
	.word 0xb3e52151  ! 3202: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb7e52017  ! 3204: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbde54000  ! 3206: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_240:
	setx	0x350117, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_241:
	setx	0x36032c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_248:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_248), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_rd_125:
	mov	0x3, %r14
	.word 0xfadb8e40  ! 3215: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_0_249:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_249), 16, 16)) -> intp(0, 0, 14)
	.word 0xb1e40000  ! 3219: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_242:
	setx	0x360200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e19f  ! 3224: SAVE_I	save	%r23, 0x0001, %r28
iob_intr_0_250:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_250), 16, 16)) -> intp(0, 0, 36)
iob_intr_0_251:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_251), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb3e4a050  ! 3230: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb9e4c000  ! 3231: SAVE_R	save	%r19, %r0, %r28
cpu_intr_0_243:
	setx	0x3a030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e52025  ! 3234: SAVE_I	save	%r20, 0x0001, %r24
cpu_intr_0_244:
	setx	0x3a0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5c000  ! 3238: SAVE_R	save	%r23, %r0, %r31
	.word 0xb634600c  ! 3243: ORN_I	orn 	%r17, 0x000c, %r27
	.word 0xb9e5613b  ! 3245: SAVE_I	save	%r21, 0x0001, %r28
T0_asi_reg_wr_137:
	mov	0x2d, %r14
	.word 0xfef38e40  ! 3248: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb1e54000  ! 3252: SAVE_R	save	%r21, %r0, %r24
	.word 0xb9e4e18f  ! 3256: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbfe4a129  ! 3257: SAVE_I	save	%r18, 0x0001, %r31
iob_intr_0_252:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_252), 16, 16)) -> intp(0, 0, 2)
iob_intr_0_253:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_253), 16, 16)) -> intp(0, 0, 2)
iob_intr_0_254:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_254), 16, 16)) -> intp(0, 0, c)
iob_intr_0_255:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_255), 16, 16)) -> intp(0, 0, 31)
iob_intr_0_256:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_256), 16, 16)) -> intp(0, 0, 2e)
	.word 0xbbe4a157  ! 3276: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb8144000  ! 3279: OR_R	or 	%r17, %r0, %r28
iob_intr_0_257:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_257), 16, 16)) -> intp(0, 0, 17)
	.word 0xb89c8000  ! 3282: XORcc_R	xorcc 	%r18, %r0, %r28
iob_intr_0_258:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_258), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb48d0000  ! 3289: ANDcc_R	andcc 	%r20, %r0, %r26
T0_asi_reg_wr_138:
	mov	0x3c8, %r14
	.word 0xf4f389e0  ! 3290: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_0_245:
	setx	0x3b0217, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_259:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_259), 16, 16)) -> intp(0, 0, 15)
	.word 0xbb3c3001  ! 3293: SRAX_I	srax	%r16, 0x0001, %r29
cpu_intr_0_246:
	setx	0x3a0319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a16a  ! 3299: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb22da0e1  ! 3306: ANDN_I	andn 	%r22, 0x00e1, %r25
cpu_intr_0_247:
	setx	0x390039, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_248:
	setx	0x3a011f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_126:
	mov	0x3c6, %r14
	.word 0xfcdb8e40  ! 3314: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb685e15a  ! 3315: ADDcc_I	addcc 	%r23, 0x015a, %r27
	.word 0xb6b521c8  ! 3322: SUBCcc_I	orncc 	%r20, 0x01c8, %r27
cpu_intr_0_249:
	setx	0x38003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e48000  ! 3324: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_rd_127:
	mov	0x9, %r14
	.word 0xf2db8e40  ! 3329: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbde5c000  ! 3331: SAVE_R	save	%r23, %r0, %r30
iob_intr_0_260:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_260), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb9e421f7  ! 3335: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb7e56198  ! 3340: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb9e5c000  ! 3341: SAVE_R	save	%r23, %r0, %r28
	.word 0xb1e4c000  ! 3342: SAVE_R	save	%r19, %r0, %r24
cpu_intr_0_250:
	setx	0x38030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e52020  ! 3345: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9e461fa  ! 3346: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb1e40000  ! 3349: SAVE_R	save	%r16, %r0, %r24
	.word 0xb9e5a07f  ! 3351: SAVE_I	save	%r22, 0x0001, %r28
iob_intr_0_261:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_261), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb7e5e1df  ! 3361: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_wr_139:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 3362: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb1e4e0e0  ! 3365: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbab5e1a3  ! 3366: ORNcc_I	orncc 	%r23, 0x01a3, %r29
	.word 0xbbe48000  ! 3368: SAVE_R	save	%r18, %r0, %r29
	.word 0xbfe5e166  ! 3372: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbde4e0ab  ! 3373: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1e40000  ! 3376: SAVE_R	save	%r16, %r0, %r24
T0_asi_reg_rd_128:
	mov	0x3c6, %r14
	.word 0xfcdb8400  ! 3377: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_0_251:
	setx	0x3b0000, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_262:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_262), 16, 16)) -> intp(0, 0, 22)
T0_asi_reg_wr_140:
	mov	0x38, %r14
	.word 0xfaf38e40  ! 3380: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_0_252:
	setx	0x3a0312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb41d6000  ! 3384: XOR_I	xor 	%r21, 0x0000, %r26
cpu_intr_0_253:
	setx	0x3a0216, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_254:
	setx	0x39031c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_255:
	setx	0x3b0102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_256:
	setx	0x3b0301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde40000  ! 3397: SAVE_R	save	%r16, %r0, %r30
	.word 0xb9351000  ! 3399: SRLX_R	srlx	%r20, %r0, %r28
	.word 0xb9e46058  ! 3400: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_263:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_263), 16, 16)) -> intp(0, 0, 1f)
iob_intr_0_264:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_264), 16, 16)) -> intp(0, 0, 8)
iob_intr_0_265:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_265), 16, 16)) -> intp(0, 0, 1d)
	.word 0xbd7de401  ! 3407: MOVR_I	movre	%r23, 0x1, %r30
T0_asi_reg_wr_141:
	mov	0x19, %r14
	.word 0xf0f38e40  ! 3409: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_rd_129:
	mov	0x3c7, %r14
	.word 0xfedb8e40  ! 3411: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_wr_142:
	mov	0x2c, %r14
	.word 0xf8f384a0  ! 3412: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb884e10d  ! 3414: ADDcc_I	addcc 	%r19, 0x010d, %r28
	.word 0xbf3c4000  ! 3418: SRA_R	sra 	%r17, %r0, %r31
cpu_intr_0_257:
	setx	0x3a000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4c000  ! 3422: SAVE_R	save	%r19, %r0, %r30
iob_intr_0_266:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_266), 16, 16)) -> intp(0, 0, 29)
	.word 0xb3e44000  ! 3426: SAVE_R	save	%r17, %r0, %r25
T0_asi_reg_wr_143:
	mov	0x2b, %r14
	.word 0xf0f38e40  ! 3427: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb3e5c000  ! 3428: SAVE_R	save	%r23, %r0, %r25
iob_intr_0_267:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_267), 16, 16)) -> intp(0, 0, 3a)
cpu_intr_0_258:
	setx	0x3a010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e48000  ! 3437: SAVE_R	save	%r18, %r0, %r24
	.word 0xb0340000  ! 3438: ORN_R	orn 	%r16, %r0, %r24
T0_asi_reg_wr_144:
	mov	0xc, %r14
	.word 0xf6f384a0  ! 3439: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_0_268:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_268), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_wr_145:
	mov	0x3c3, %r14
	.word 0xfef38e40  ! 3443: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_wr_146:
	mov	0x7, %r14
	.word 0xf0f38e40  ! 3444: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbfe420f7  ! 3447: SAVE_I	save	%r16, 0x0001, %r31
cpu_intr_0_259:
	setx	0x3b0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e0c8  ! 3450: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1e48000  ! 3452: SAVE_R	save	%r18, %r0, %r24
iob_intr_0_269:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_269), 16, 16)) -> intp(0, 0, 28)
T0_asi_reg_wr_147:
	mov	0x1b, %r14
	.word 0xf2f38e40  ! 3455: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb9e52031  ! 3457: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbe05e167  ! 3461: ADD_I	add 	%r23, 0x0167, %r31
T0_asi_reg_rd_130:
	mov	0x15, %r14
	.word 0xf0db89e0  ! 3462: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_0_270:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_270), 16, 16)) -> intp(0, 0, 6)
cpu_intr_0_260:
	setx	0x380121, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_131:
	mov	0x3c6, %r14
	.word 0xf6db8e60  ! 3471: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_0_271:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_271), 16, 16)) -> intp(0, 0, 22)
cpu_intr_0_261:
	setx	0x390003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4c000  ! 3478: SAVE_R	save	%r19, %r0, %r29
iob_intr_0_272:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_272), 16, 16)) -> intp(0, 0, 36)
T0_asi_reg_rd_132:
	mov	0x2b, %r14
	.word 0xfcdb8e40  ! 3483: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbd3df001  ! 3484: SRAX_I	srax	%r23, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_148:
	mov	0x3c8, %r14
	.word 0xfef38e80  ! 3487: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T0_asi_reg_rd_133:
	mov	0x12, %r14
	.word 0xf2db8e40  ! 3488: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_273:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_273), 16, 16)) -> intp(0, 0, e)
	.word 0xb9e5a0a4  ! 3490: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3e48000  ! 3491: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_rd_134:
	mov	0x3c3, %r14
	.word 0xfadb8e40  ! 3492: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_0_274:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_274), 16, 16)) -> intp(0, 0, 28)
	.word 0xb1e40000  ! 3496: SAVE_R	save	%r16, %r0, %r24
	.word 0xb68cc000  ! 3500: ANDcc_R	andcc 	%r19, %r0, %r27
T0_asi_reg_wr_149:
	mov	0x3c7, %r14
	.word 0xf4f384a0  ! 3503: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb5e40000  ! 3506: SAVE_R	save	%r16, %r0, %r26
	.word 0xb834c000  ! 3507: ORN_R	orn 	%r19, %r0, %r28
cpu_intr_0_262:
	setx	0x3a0216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a106  ! 3511: SAVE_I	save	%r22, 0x0001, %r27
iob_intr_0_275:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_275), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb3e5e0b9  ! 3518: SAVE_I	save	%r23, 0x0001, %r25
iob_intr_0_276:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_276), 16, 16)) -> intp(0, 0, f)
iob_intr_0_277:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_277), 16, 16)) -> intp(0, 0, 27)
iob_intr_0_278:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_278), 16, 16)) -> intp(0, 0, 31)
cpu_intr_0_263:
	setx	0x3a010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8342161  ! 3527: ORN_I	orn 	%r16, 0x0161, %r28
cpu_intr_0_264:
	setx	0x3b010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e1e0  ! 3531: SAVE_I	save	%r23, 0x0001, %r31
T0_asi_reg_rd_135:
	mov	0x3c8, %r14
	.word 0xf4db8e40  ! 3533: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb1e5e0d4  ! 3534: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb9e50000  ! 3536: SAVE_R	save	%r20, %r0, %r28
	.word 0xbfe4e0a9  ! 3537: SAVE_I	save	%r19, 0x0001, %r31
cpu_intr_0_265:
	setx	0x390330, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_136:
	mov	0x35, %r14
	.word 0xf6db8e40  ! 3543: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb3e50000  ! 3547: SAVE_R	save	%r20, %r0, %r25
cpu_intr_0_266:
	setx	0x390139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4612f  ! 3551: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb9e52180  ! 3552: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbde4e0cc  ! 3554: SAVE_I	save	%r19, 0x0001, %r30
iob_intr_0_279:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_279), 16, 16)) -> intp(0, 0, 23)
	.word 0xb9e54000  ! 3557: SAVE_R	save	%r21, %r0, %r28
cpu_intr_0_267:
	setx	0x3a0324, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_268:
	setx	0x39011c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_137:
	mov	0x1e, %r14
	.word 0xf6db8e60  ! 3563: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb28d4000  ! 3564: ANDcc_R	andcc 	%r21, %r0, %r25
iob_intr_0_280:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_280), 16, 16)) -> intp(0, 0, 15)
	.word 0xbbe5c000  ! 3574: SAVE_R	save	%r23, %r0, %r29
	.word 0xbe9c8000  ! 3575: XORcc_R	xorcc 	%r18, %r0, %r31
iob_intr_0_281:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_281), 16, 16)) -> intp(0, 0, 33)
iob_intr_0_282:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_282), 16, 16)) -> intp(0, 0, 3f)
iob_intr_0_283:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_283), 16, 16)) -> intp(0, 0, 13)
cpu_intr_0_269:
	setx	0x3a0028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 3584: SAVE_R	save	%r16, %r0, %r24
T0_asi_reg_rd_138:
	mov	0x19, %r14
	.word 0xf4db8e60  ! 3585: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_0_284:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_284), 16, 16)) -> intp(0, 0, 37)
cpu_intr_0_270:
	setx	0x380014, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_139:
	mov	0x27, %r14
	.word 0xfadb8e40  ! 3593: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_wr_150:
	mov	0x2f, %r14
	.word 0xf8f38e60  ! 3594: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T0_asi_reg_rd_140:
	mov	0x2, %r14
	.word 0xf8db8e60  ! 3595: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb3e4e099  ! 3597: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbf341000  ! 3598: SRLX_R	srlx	%r16, %r0, %r31
	.word 0xbfe4e018  ! 3599: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbb351000  ! 3600: SRLX_R	srlx	%r20, %r0, %r29
	.word 0xbead8000  ! 3606: ANDNcc_R	andncc 	%r22, %r0, %r31
	.word 0xb9e44000  ! 3607: SAVE_R	save	%r17, %r0, %r28
	.word 0xb1e58000  ! 3610: SAVE_R	save	%r22, %r0, %r24
iob_intr_0_285:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_285), 16, 16)) -> intp(0, 0, 0)
	.word 0xb1e50000  ! 3619: SAVE_R	save	%r20, %r0, %r24
	.word 0xb9e5213d  ! 3622: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbb520000  ! 3628: RDPR_PIL	<illegal instruction>
	.word 0xbfe48000  ! 3629: SAVE_R	save	%r18, %r0, %r31
	.word 0xbbe40000  ! 3631: SAVE_R	save	%r16, %r0, %r29
	.word 0xb9e46157  ! 3635: SAVE_I	save	%r17, 0x0001, %r28
cpu_intr_0_271:
	setx	0x3b0107, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_141:
	mov	0x3c1, %r14
	.word 0xfcdb8e60  ! 3642: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_0_286:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_286), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_rd_142:
	mov	0x25, %r14
	.word 0xf0db89e0  ! 3644: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T0_asi_reg_wr_151:
	mov	0xd, %r14
	.word 0xfef384a0  ! 3645: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_0_287:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_287), 16, 16)) -> intp(0, 0, 3f)
	.word 0xbfe4c000  ! 3652: SAVE_R	save	%r19, %r0, %r31
	.word 0xb5e4a189  ! 3655: SAVE_I	save	%r18, 0x0001, %r26
T0_asi_reg_wr_152:
	mov	0x16, %r14
	.word 0xf2f389e0  ! 3658: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T0_asi_reg_rd_143:
	mov	0x3c3, %r14
	.word 0xfadb8e60  ! 3659: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbbe460db  ! 3663: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb5e56018  ! 3664: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb3e5c000  ! 3666: SAVE_R	save	%r23, %r0, %r25
cpu_intr_0_272:
	setx	0x3b012a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_288:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_288), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_rd_144:
	mov	0x9, %r14
	.word 0xfedb8400  ! 3681: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T0_asi_reg_wr_153:
	mov	0x2a, %r14
	.word 0xf6f38e40  ! 3682: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_wr_154:
	mov	0x18, %r14
	.word 0xf0f389e0  ! 3684: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T0_asi_reg_wr_155:
	mov	0x11, %r14
	.word 0xf8f38e60  ! 3688: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T0_asi_reg_rd_145:
	mov	0x25, %r14
	.word 0xf2db8e40  ! 3692: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_289:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_289), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb9e4a1b8  ! 3696: SAVE_I	save	%r18, 0x0001, %r28
iob_intr_0_290:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_290), 16, 16)) -> intp(0, 0, 31)
T0_asi_reg_wr_156:
	mov	0x22, %r14
	.word 0xfaf38e40  ! 3704: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_0_273:
	setx	0x3f0004, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_291:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_291), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_wr_157:
	mov	0xa, %r14
	.word 0xfef38400  ! 3708: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T0_asi_reg_rd_146:
	mov	0x3c5, %r14
	.word 0xf4db8e80  ! 3710: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T0_asi_reg_rd_147:
	mov	0x10, %r14
	.word 0xf2db8e40  ! 3711: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb9e5617b  ! 3713: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xba354000  ! 3714: SUBC_R	orn 	%r21, %r0, %r29
	.word 0xbde4a01d  ! 3715: SAVE_I	save	%r18, 0x0001, %r30
iob_intr_0_292:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_292), 16, 16)) -> intp(0, 0, 13)
	.word 0xb9e5a176  ! 3719: SAVE_I	save	%r22, 0x0001, %r28
iob_intr_0_293:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_293), 16, 16)) -> intp(0, 0, 9)
	.word 0xb5e54000  ! 3726: SAVE_R	save	%r21, %r0, %r26
cpu_intr_0_274:
	setx	0x3d0234, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_294:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_294), 16, 16)) -> intp(0, 0, 26)
	.word 0xbde40000  ! 3731: SAVE_R	save	%r16, %r0, %r30
	.word 0xb7e5c000  ! 3732: SAVE_R	save	%r23, %r0, %r27
	.word 0xbfe42000  ! 3734: SAVE_I	save	%r16, 0x0001, %r31
cpu_intr_0_275:
	setx	0x3e0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e521a3  ! 3744: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_276:
	setx	0x3e0103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e58000  ! 3750: SAVE_R	save	%r22, %r0, %r27
	.word 0xbde54000  ! 3754: SAVE_R	save	%r21, %r0, %r30
	.word 0xb1520000  ! 3757: RDPR_PIL	<illegal instruction>
	.word 0xbbe5c000  ! 3759: SAVE_R	save	%r23, %r0, %r29
	.word 0xb49d8000  ! 3760: XORcc_R	xorcc 	%r22, %r0, %r26
iob_intr_0_295:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_295), 16, 16)) -> intp(0, 0, 12)
T0_asi_reg_rd_148:
	mov	0x4, %r14
	.word 0xf2db8400  ! 3765: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T0_asi_reg_wr_158:
	mov	0x8, %r14
	.word 0xfaf38e60  ! 3766: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_0_277:
	setx	0x3c0206, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_159:
	mov	0x31, %r14
	.word 0xf4f384a0  ! 3776: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T0_asi_reg_rd_149:
	mov	0x1e, %r14
	.word 0xf0db8e40  ! 3777: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_278:
	setx	0x3d0031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e521dd  ! 3781: SAVE_I	save	%r20, 0x0001, %r24
T0_asi_reg_rd_150:
	mov	0x11, %r14
	.word 0xfadb8e40  ! 3785: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb4a4e10e  ! 3787: SUBcc_I	subcc 	%r19, 0x010e, %r26
	.word 0xb63ca05c  ! 3789: XNOR_I	xnor 	%r18, 0x005c, %r27
	.word 0xba1520d1  ! 3790: OR_I	or 	%r20, 0x00d1, %r29
iob_intr_0_296:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_296), 16, 16)) -> intp(0, 0, 2f)
T0_asi_reg_rd_151:
	mov	0x3c3, %r14
	.word 0xf4db8e40  ! 3795: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbde5c000  ! 3796: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_279:
	setx	0x3d0315, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_160:
	mov	0x2a, %r14
	.word 0xfaf38400  ! 3803: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb3e44000  ! 3806: SAVE_R	save	%r17, %r0, %r25
	.word 0xb03d617c  ! 3808: XNOR_I	xnor 	%r21, 0x017c, %r24
	.word 0xb1e44000  ! 3810: SAVE_R	save	%r17, %r0, %r24
iob_intr_0_297:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_297), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_rd_152:
	mov	0x3c6, %r14
	.word 0xf6db8400  ! 3813: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T0_asi_reg_rd_153:
	mov	0xf, %r14
	.word 0xfcdb8e80  ! 3814: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T0_asi_reg_wr_161:
	mov	0x2d, %r14
	.word 0xf8f38e40  ! 3815: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_298:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_298), 16, 16)) -> intp(0, 0, 1b)
iob_intr_0_299:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_299), 16, 16)) -> intp(0, 0, 2b)
T0_asi_reg_rd_154:
	mov	0x3c7, %r14
	.word 0xfcdb8400  ! 3818: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb92d2001  ! 3819: SLL_I	sll 	%r20, 0x0001, %r28
	.word 0xbfe5c000  ! 3820: SAVE_R	save	%r23, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_300:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_300), 16, 16)) -> intp(0, 0, 7)
T0_asi_reg_rd_155:
	mov	0x2e, %r14
	.word 0xfedb8e40  ! 3826: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_0_280:
	setx	0x3f000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 3831: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_281:
	setx	0x3f0202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a02a  ! 3833: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbde5c000  ! 3834: SAVE_R	save	%r23, %r0, %r30
	.word 0xbbe5612b  ! 3835: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb9e520ea  ! 3836: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb815a0ac  ! 3837: OR_I	or 	%r22, 0x00ac, %r28
	.word 0xb9e4e1c8  ! 3839: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbbe521a5  ! 3841: SAVE_I	save	%r20, 0x0001, %r29
cpu_intr_0_282:
	setx	0x3e0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e1d1  ! 3847: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_301:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_301), 16, 16)) -> intp(0, 0, 13)
	.word 0xb1e4202b  ! 3850: SAVE_I	save	%r16, 0x0001, %r24
cpu_intr_0_283:
	setx	0x3e021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 3853: SAVE_R	save	%r22, %r0, %r26
	.word 0xbcb4e0a9  ! 3854: ORNcc_I	orncc 	%r19, 0x00a9, %r30
	.word 0xb9e56035  ! 3857: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb7e40000  ! 3859: SAVE_R	save	%r16, %r0, %r27
	.word 0xbde56085  ! 3860: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb3e520a4  ! 3861: SAVE_I	save	%r20, 0x0001, %r25
cpu_intr_0_284:
	setx	0x3f0219, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_302:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_302), 16, 16)) -> intp(0, 0, 13)
	.word 0xb3e4a1ec  ! 3868: SAVE_I	save	%r18, 0x0001, %r25
iob_intr_0_303:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_303), 16, 16)) -> intp(0, 0, 1b)
cpu_intr_0_285:
	setx	0x3c023c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_156:
	mov	0xd, %r14
	.word 0xfedb8e40  ! 3874: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb49c8000  ! 3875: XORcc_R	xorcc 	%r18, %r0, %r26
	.word 0xbbe44000  ! 3877: SAVE_R	save	%r17, %r0, %r29
iob_intr_0_304:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_304), 16, 16)) -> intp(0, 0, 3a)
iob_intr_0_305:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_305), 16, 16)) -> intp(0, 0, 19)
	.word 0xbfe5e1f5  ! 3888: SAVE_I	save	%r23, 0x0001, %r31
T0_asi_reg_wr_162:
	mov	0x31, %r14
	.word 0xfef38e60  ! 3889: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb3e520de  ! 3892: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb5e5e03b  ! 3893: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_wr_163:
	mov	0xf, %r14
	.word 0xfaf389e0  ! 3897: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb7e5a05c  ! 3898: SAVE_I	save	%r22, 0x0001, %r27
iob_intr_0_306:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_306), 16, 16)) -> intp(0, 0, 1b)
	.word 0xbbe42121  ! 3901: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb1e44000  ! 3902: SAVE_R	save	%r17, %r0, %r24
	.word 0xb3e5a0a6  ! 3904: SAVE_I	save	%r22, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe5a100  ! 3910: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb40c0000  ! 3911: AND_R	and 	%r16, %r0, %r26
cpu_intr_0_286:
	setx	0x3c001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde56082  ! 3919: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e56151  ! 3920: SAVE_I	save	%r21, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_287:
	setx	0x3e021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e09d  ! 3925: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbbe4215d  ! 3926: SAVE_I	save	%r16, 0x0001, %r29
cpu_intr_0_288:
	setx	0x3d0005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc0d4000  ! 3929: AND_R	and 	%r21, %r0, %r30
	.word 0xbfe40000  ! 3930: SAVE_R	save	%r16, %r0, %r31
cpu_intr_0_289:
	setx	0x3d0028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e03d  ! 3933: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbf2c1000  ! 3934: SLLX_R	sllx	%r16, %r0, %r31
iob_intr_0_307:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_307), 16, 16)) -> intp(0, 0, d)
cpu_intr_0_290:
	setx	0x3f0031, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_308:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_308), 16, 16)) -> intp(0, 0, 3c)
T0_asi_reg_wr_164:
	mov	0x37, %r14
	.word 0xf8f38e60  ! 3947: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_0_291:
	setx	0x3d0127, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_165:
	mov	0x7, %r14
	.word 0xf6f38e40  ! 3950: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_rd_157:
	mov	0x2, %r14
	.word 0xfadb8e40  ! 3953: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbf641800  ! 3956: MOVcc_R	<illegal instruction>
	.word 0xb3e5e123  ! 3958: SAVE_I	save	%r23, 0x0001, %r25
cpu_intr_0_292:
	setx	0x3d031c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_309:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_309), 16, 16)) -> intp(0, 0, 28)
iob_intr_0_310:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_310), 16, 16)) -> intp(0, 0, 36)
	.word 0xb1518000  ! 3964: RDPR_PSTATE	<illegal instruction>
	.word 0xb494e15d  ! 3965: ORcc_I	orcc 	%r19, 0x015d, %r26
cpu_intr_0_293:
	setx	0x3e030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc358000  ! 3972: SUBC_R	orn 	%r22, %r0, %r30
	.word 0xbfe4208b  ! 3974: SAVE_I	save	%r16, 0x0001, %r31
cpu_intr_0_294:
	setx	0x3c011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde48000  ! 3977: SAVE_R	save	%r18, %r0, %r30
	.word 0xb3e48000  ! 3978: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_wr_166:
	mov	0x1, %r14
	.word 0xf0f38e80  ! 3980: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbbe58000  ! 3984: SAVE_R	save	%r22, %r0, %r29
	.word 0xb9e5e073  ! 3986: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_rd_158:
	mov	0x3c8, %r14
	.word 0xfadb8400  ! 3988: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_0_295:
	setx	0x3f0029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e40000  ! 3991: SAVE_R	save	%r16, %r0, %r28
	.word 0xb7e560a0  ! 3998: SAVE_I	save	%r21, 0x0001, %r27
iob_intr_0_311:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_311), 16, 16)) -> intp(0, 0, 15)
T0_asi_reg_wr_167:
	mov	0x3c2, %r14
	.word 0xf6f38e60  ! 4005: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbde44000  ! 4008: SAVE_R	save	%r17, %r0, %r30
	.word 0xb625c000  ! 4010: SUB_R	sub 	%r23, %r0, %r27
iob_intr_0_312:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_312), 16, 16)) -> intp(0, 0, 27)
cpu_intr_0_296:
	setx	0x3e0133, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_159:
	mov	0x3c5, %r14
	.word 0xf2db89e0  ! 4015: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_0_313:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_313), 16, 16)) -> intp(0, 0, 14)
cpu_intr_0_297:
	setx	0x3d0102, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_314:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_314), 16, 16)) -> intp(0, 0, c)
	.word 0xbde5c000  ! 4022: SAVE_R	save	%r23, %r0, %r30
iob_intr_0_315:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_315), 16, 16)) -> intp(0, 0, 2e)
iob_intr_0_316:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_316), 16, 16)) -> intp(0, 0, 0)
	.word 0xb7e48000  ! 4029: SAVE_R	save	%r18, %r0, %r27
cpu_intr_0_298:
	setx	0x3d031d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_160:
	mov	0x3c7, %r14
	.word 0xf0db8e40  ! 4032: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_rd_161:
	mov	0x3c3, %r14
	.word 0xf2db8e40  ! 4038: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_317:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_317), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_318:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_318), 16, 16)) -> intp(0, 0, 2f)
T0_asi_reg_rd_162:
	mov	0x5, %r14
	.word 0xfcdb8e40  ! 4042: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbfe40000  ! 4043: SAVE_R	save	%r16, %r0, %r31
cpu_intr_0_299:
	setx	0x3d0229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe52037  ! 4045: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbfe52036  ! 4046: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbbe5213b  ! 4050: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbbe52010  ! 4051: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb5e42049  ! 4053: SAVE_I	save	%r16, 0x0001, %r26
cpu_intr_0_300:
	setx	0x3c0308, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_301:
	setx	0x3e020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 4057: SAVE_R	save	%r16, %r0, %r24
	.word 0xbb2d2001  ! 4058: SLL_I	sll 	%r20, 0x0001, %r29
	.word 0xb9e50000  ! 4059: SAVE_R	save	%r20, %r0, %r28
cpu_intr_0_302:
	setx	0x3f0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e50000  ! 4062: SAVE_R	save	%r20, %r0, %r28
T0_asi_reg_rd_163:
	mov	0x0, %r14
	.word 0xf2db8e40  ! 4064: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T0_asi_reg_rd_164:
	mov	0x3c4, %r14
	.word 0xf6db8400  ! 4068: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb9e50000  ! 4069: SAVE_R	save	%r20, %r0, %r28
	.word 0xb3e44000  ! 4071: SAVE_R	save	%r17, %r0, %r25
	.word 0xbfe52142  ! 4079: SAVE_I	save	%r20, 0x0001, %r31
cpu_intr_0_303:
	setx	0x3c0323, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_319:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_319), 16, 16)) -> intp(0, 0, 34)
	.word 0xb1e44000  ! 4083: SAVE_R	save	%r17, %r0, %r24
	.word 0xb1e44000  ! 4085: SAVE_R	save	%r17, %r0, %r24
cpu_intr_0_304:
	setx	0x3e0023, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_305:
	setx	0x3c0138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 4090: SAVE_R	save	%r16, %r0, %r24
	.word 0xbfe58000  ! 4091: SAVE_R	save	%r22, %r0, %r31
iob_intr_0_320:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_320), 16, 16)) -> intp(0, 0, 39)
	.word 0xb4058000  ! 4094: ADD_R	add 	%r22, %r0, %r26
	.word 0xb7e40000  ! 4095: SAVE_R	save	%r16, %r0, %r27
	.word 0xb5e4e111  ! 4098: SAVE_I	save	%r19, 0x0001, %r26
iob_intr_0_321:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_321), 16, 16)) -> intp(0, 0, 12)
iob_intr_0_322:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_322), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb7e5e190  ! 4105: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbbe58000  ! 4107: SAVE_R	save	%r22, %r0, %r29
iob_intr_0_323:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_323), 16, 16)) -> intp(0, 0, 23)
	.word 0xbfe40000  ! 4112: SAVE_R	save	%r16, %r0, %r31
cpu_intr_0_306:
	setx	0x3f0303, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_324:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_324), 16, 16)) -> intp(0, 0, 2)
	.word 0xbbe50000  ! 4116: SAVE_R	save	%r20, %r0, %r29
cpu_intr_0_307:
	setx	0x3e0112, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_308:
	setx	0x3c012e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_168:
	mov	0x6, %r14
	.word 0xfcf38e80  ! 4119: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_0_309:
	setx	0x3c0304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e560c5  ! 4121: SAVE_I	save	%r21, 0x0001, %r26
iob_intr_0_325:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_325), 16, 16)) -> intp(0, 0, 1f)
iob_intr_0_326:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_326), 16, 16)) -> intp(0, 0, 3e)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb750c000  ! 4131: RDPR_TT	<illegal instruction>
T0_asi_reg_rd_165:
	mov	0x24, %r14
	.word 0xfcdb8e40  ! 4132: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_310:
	setx	0x3d032d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_327:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_327), 16, 16)) -> intp(0, 0, 1e)
iob_intr_0_328:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_328), 16, 16)) -> intp(0, 0, 12)
	.word 0xb3e46195  ! 4140: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb094c000  ! 4147: ORcc_R	orcc 	%r19, %r0, %r24
	.word 0xb9e54000  ! 4149: SAVE_R	save	%r21, %r0, %r28
	.word 0xb3e58000  ! 4150: SAVE_R	save	%r22, %r0, %r25
	.word 0xb5e44000  ! 4151: SAVE_R	save	%r17, %r0, %r26
iob_intr_0_329:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_329), 16, 16)) -> intp(0, 0, 25)
	.word 0xb9e48000  ! 4157: SAVE_R	save	%r18, %r0, %r28
	.word 0xbfe54000  ! 4160: SAVE_R	save	%r21, %r0, %r31
	.word 0xb1e4c000  ! 4164: SAVE_R	save	%r19, %r0, %r24
	.word 0xbde4a13a  ! 4165: SAVE_I	save	%r18, 0x0001, %r30
iob_intr_0_330:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_330), 16, 16)) -> intp(0, 0, 37)
	.word 0xb1e58000  ! 4168: SAVE_R	save	%r22, %r0, %r24
	.word 0xbfe42002  ! 4170: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_wr_169:
	mov	0xb, %r14
	.word 0xf0f384a0  ! 4174: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_0_311:
	setx	0x420030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4610c  ! 4177: SAVE_I	save	%r17, 0x0001, %r24
	.word 0x8795e051  ! 4178: WRPR_TT_I	wrpr	%r23, 0x0051, %tt
T0_asi_reg_rd_166:
	mov	0x1d, %r14
	.word 0xf4db8e80  ! 4180: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T0_asi_reg_wr_170:
	mov	0x15, %r14
	.word 0xf6f389e0  ! 4183: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_0_331:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_331), 16, 16)) -> intp(0, 0, 39)
	.word 0xb2ac8000  ! 4188: ANDNcc_R	andncc 	%r18, %r0, %r25
cpu_intr_0_312:
	setx	0x43002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e54000  ! 4191: SAVE_R	save	%r21, %r0, %r24
iob_intr_0_332:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_332), 16, 16)) -> intp(0, 0, 2a)
cpu_intr_0_313:
	setx	0x420319, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_314:
	setx	0x400006, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_315:
	setx	0x40020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba352157  ! 4202: SUBC_I	orn 	%r20, 0x0157, %r29
	.word 0xba24a00c  ! 4206: SUB_I	sub 	%r18, 0x000c, %r29
	.word 0xb5e50000  ! 4209: SAVE_R	save	%r20, %r0, %r26
iob_intr_0_333:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_333), 16, 16)) -> intp(0, 0, 19)
cpu_intr_0_316:
	setx	0x40033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5c000  ! 4213: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_317:
	setx	0x410007, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_167:
	mov	0x2, %r14
	.word 0xf2db89e0  ! 4217: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbde561e1  ! 4220: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1e4a0ac  ! 4221: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbfe48000  ! 4225: SAVE_R	save	%r18, %r0, %r31
	.word 0xb5e52104  ! 4226: SAVE_I	save	%r20, 0x0001, %r26
T0_asi_reg_wr_171:
	mov	0x29, %r14
	.word 0xfaf384a0  ! 4227: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_0_318:
	setx	0x40023a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_334:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_334), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_rd_168:
	mov	0x12, %r14
	.word 0xf0db8e40  ! 4232: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb7e4e197  ! 4233: SAVE_I	save	%r19, 0x0001, %r27
cpu_intr_0_319:
	setx	0x43022b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_172:
	mov	0x3c2, %r14
	.word 0xf2f38e80  ! 4239: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbbe40000  ! 4240: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_wr_173:
	mov	0x25, %r14
	.word 0xf4f38e40  ! 4241: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_320:
	setx	0x42023e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_174:
	mov	0x2d, %r14
	.word 0xfcf38e40  ! 4244: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb63c8000  ! 4253: XNOR_R	xnor 	%r18, %r0, %r27
iob_intr_0_335:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_335), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_336:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_336), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_wr_175:
	mov	0x3c8, %r14
	.word 0xf8f38e60  ! 4259: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_0_337:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_337), 16, 16)) -> intp(0, 0, 23)
cpu_intr_0_321:
	setx	0x41012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcc52142  ! 4262: ADDCcc_I	addccc 	%r20, 0x0142, %r30
	.word 0xb1e4c000  ! 4264: SAVE_R	save	%r19, %r0, %r24
	.word 0xb1e5a097  ! 4265: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_rd_169:
	mov	0x3c1, %r14
	.word 0xf8db8e40  ! 4266: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb1e521a2  ! 4267: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbfe5e169  ! 4270: SAVE_I	save	%r23, 0x0001, %r31
cpu_intr_0_322:
	setx	0x430301, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_323:
	setx	0x430308, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_324:
	setx	0x420220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8395207e  ! 4274: WRPR_TNPC_I	wrpr	%r20, 0x007e, %tnpc
iob_intr_0_338:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_338), 16, 16)) -> intp(0, 0, 21)
T0_asi_reg_rd_170:
	mov	0x33, %r14
	.word 0xfedb8e40  ! 4277: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_0_339:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_339), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb0b5c000  ! 4279: SUBCcc_R	orncc 	%r23, %r0, %r24
	.word 0xb3e56095  ! 4280: SAVE_I	save	%r21, 0x0001, %r25
T0_asi_reg_rd_171:
	mov	0x3c0, %r14
	.word 0xfedb8e40  ! 4282: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb5e4a0ba  ! 4283: SAVE_I	save	%r18, 0x0001, %r26
T0_asi_reg_rd_172:
	mov	0x37, %r14
	.word 0xf4db8e80  ! 4284: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_0_340:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_340), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_rd_173:
	mov	0x7, %r14
	.word 0xfadb8e40  ! 4286: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb77ce401  ! 4288: MOVR_I	movre	%r19, 0x1, %r27
T0_asi_reg_wr_176:
	mov	0x3c8, %r14
	.word 0xf4f38400  ! 4289: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T0_asi_reg_wr_177:
	mov	0x24, %r14
	.word 0xfef38e60  ! 4291: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T0_asi_reg_rd_174:
	mov	0x3c3, %r14
	.word 0xf4db8e80  ! 4292: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb12ce001  ! 4293: SLL_I	sll 	%r19, 0x0001, %r24
iob_intr_0_341:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_341), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_wr_178:
	mov	0x35, %r14
	.word 0xf8f389e0  ! 4302: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T0_asi_reg_rd_175:
	mov	0x3c7, %r14
	.word 0xfcdb8400  ! 4303: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_0_342:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_342), 16, 16)) -> intp(0, 0, 2f)
cpu_intr_0_325:
	setx	0x400306, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_326:
	setx	0x430110, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_343:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_343), 16, 16)) -> intp(0, 0, 24)
	.word 0xbde40000  ! 4308: SAVE_R	save	%r16, %r0, %r30
	.word 0xb1e4e191  ! 4309: SAVE_I	save	%r19, 0x0001, %r24
iob_intr_0_344:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_344), 16, 16)) -> intp(0, 0, f)
T0_asi_reg_wr_179:
	mov	0x3c1, %r14
	.word 0xf4f38e60  ! 4312: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xbf7cc400  ! 4317: MOVR_R	movre	%r19, %r0, %r31
	.word 0xbde5c000  ! 4319: SAVE_R	save	%r23, %r0, %r30
iob_intr_0_345:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_345), 16, 16)) -> intp(0, 0, 11)
iob_intr_0_346:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_346), 16, 16)) -> intp(0, 0, 17)
	.word 0xbbe48000  ! 4326: SAVE_R	save	%r18, %r0, %r29
	.word 0xbde48000  ! 4330: SAVE_R	save	%r18, %r0, %r30
T0_asi_reg_rd_176:
	mov	0x3c3, %r14
	.word 0xfcdb8e40  ! 4331: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_wr_180:
	mov	0x12, %r14
	.word 0xf6f38400  ! 4332: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_0_347:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_347), 16, 16)) -> intp(0, 0, 12)
	.word 0xb9e4a05b  ! 4334: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbb50c000  ! 4338: RDPR_TT	<illegal instruction>
	.word 0xb5e5e1a8  ! 4339: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_rd_177:
	mov	0x3c5, %r14
	.word 0xf8db84a0  ! 4340: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbb3dd000  ! 4342: SRAX_R	srax	%r23, %r0, %r29
cpu_intr_0_327:
	setx	0x430036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5201e  ! 4345: SAVE_I	save	%r20, 0x0001, %r26
T0_asi_reg_wr_181:
	mov	0x24, %r14
	.word 0xfaf38e40  ! 4346: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_0_328:
	setx	0x41032b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_178:
	mov	0xc, %r14
	.word 0xf0db8400  ! 4348: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbfe461e7  ! 4349: SAVE_I	save	%r17, 0x0001, %r31
	.word 0x8994e0f6  ! 4350: WRPR_TICK_I	wrpr	%r19, 0x00f6, %tick
iob_intr_0_348:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_348), 16, 16)) -> intp(0, 0, 9)
	.word 0xbfe40000  ! 4353: SAVE_R	save	%r16, %r0, %r31
	.word 0xb3e44000  ! 4355: SAVE_R	save	%r17, %r0, %r25
	.word 0xbde5e1e0  ! 4356: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xba9c4000  ! 4359: XORcc_R	xorcc 	%r17, %r0, %r29
cpu_intr_0_329:
	setx	0x410114, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_330:
	setx	0x420231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e44000  ! 4370: SAVE_R	save	%r17, %r0, %r24
T0_asi_reg_rd_179:
	mov	0x1c, %r14
	.word 0xf4db8e40  ! 4371: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_349:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_349), 16, 16)) -> intp(0, 0, d)
	.word 0xb1e5c000  ! 4378: SAVE_R	save	%r23, %r0, %r24
iob_intr_0_350:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_350), 16, 16)) -> intp(0, 0, 3f)
iob_intr_0_351:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_351), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb5e40000  ! 4384: SAVE_R	save	%r16, %r0, %r26
	.word 0xbbe48000  ! 4385: SAVE_R	save	%r18, %r0, %r29
	.word 0xba848000  ! 4386: ADDcc_R	addcc 	%r18, %r0, %r29
cpu_intr_0_331:
	setx	0x42023f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_332:
	setx	0x400102, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_180:
	mov	0x3c8, %r14
	.word 0xf6db8e80  ! 4393: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb3e5e0b6  ! 4394: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb1e40000  ! 4395: SAVE_R	save	%r16, %r0, %r24
	.word 0xb5e48000  ! 4397: SAVE_R	save	%r18, %r0, %r26
	.word 0xb3e4c000  ! 4399: SAVE_R	save	%r19, %r0, %r25
iob_intr_0_352:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_352), 16, 16)) -> intp(0, 0, 3f)
cpu_intr_0_333:
	setx	0x410335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe48000  ! 4406: SAVE_R	save	%r18, %r0, %r31
	.word 0xb5e54000  ! 4410: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_rd_181:
	mov	0xb, %r14
	.word 0xfedb89e0  ! 4411: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb7e5a0f7  ! 4415: SAVE_I	save	%r22, 0x0001, %r27
T0_asi_reg_rd_182:
	mov	0x29, %r14
	.word 0xf0db8e40  ! 4416: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_rd_183:
	mov	0x16, %r14
	.word 0xf2db84a0  ! 4420: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbfe52112  ! 4425: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb3e54000  ! 4426: SAVE_R	save	%r21, %r0, %r25
	.word 0xb004a0dd  ! 4428: ADD_I	add 	%r18, 0x00dd, %r24
T0_asi_reg_rd_184:
	mov	0x3c7, %r14
	.word 0xfcdb8400  ! 4429: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_0_353:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_353), 16, 16)) -> intp(0, 0, 29)
	.word 0xb7e4e0db  ! 4432: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb9e4215c  ! 4435: SAVE_I	save	%r16, 0x0001, %r28
T0_asi_reg_wr_182:
	mov	0x3c2, %r14
	.word 0xf6f389e0  ! 4437: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0x839460a4  ! 4438: WRPR_TNPC_I	wrpr	%r17, 0x00a4, %tnpc
	.word 0xb9e5a03f  ! 4440: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3e4a17e  ! 4444: SAVE_I	save	%r18, 0x0001, %r25
T0_asi_reg_rd_185:
	mov	0x0, %r14
	.word 0xf8db8e40  ! 4445: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_334:
	setx	0x410317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe520a3  ! 4449: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7e420d4  ! 4451: SAVE_I	save	%r16, 0x0001, %r27
	.word 0x8f902001  ! 4453: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xb9e421a6  ! 4454: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbde4c000  ! 4456: SAVE_R	save	%r19, %r0, %r30
	.word 0xb6a56132  ! 4457: SUBcc_I	subcc 	%r21, 0x0132, %r27
	.word 0xb3e5c000  ! 4458: SAVE_R	save	%r23, %r0, %r25
	.word 0xbbe44000  ! 4460: SAVE_R	save	%r17, %r0, %r29
cpu_intr_0_335:
	setx	0x410307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0844000  ! 4467: ADDcc_R	addcc 	%r17, %r0, %r24
cpu_intr_0_336:
	setx	0x400107, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_337:
	setx	0x42003e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_338:
	setx	0x43030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_183:
	mov	0x1a, %r14
	.word 0xf0f38e60  ! 4475: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T0_asi_reg_wr_184:
	mov	0x2a, %r14
	.word 0xfcf38e40  ! 4479: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_339:
	setx	0x41021c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_340:
	setx	0x40020a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_185:
	mov	0xb, %r14
	.word 0xfcf38e40  ! 4486: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_rd_186:
	mov	0x1b, %r14
	.word 0xf4db8e40  ! 4487: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_0_341:
	setx	0x420019, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_354:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_354), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_rd_187:
	mov	0x1, %r14
	.word 0xf4db8e60  ! 4491: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T0_asi_reg_wr_186:
	mov	0x28, %r14
	.word 0xfef38400  ! 4492: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_0_342:
	setx	0x430006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4c000  ! 4494: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_rd_188:
	mov	0x3c4, %r14
	.word 0xf4db89e0  ! 4495: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_0_355:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_355), 16, 16)) -> intp(0, 0, 27)
	.word 0xb1e520fe  ! 4498: SAVE_I	save	%r20, 0x0001, %r24
cpu_intr_0_343:
	setx	0x43020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba0421b0  ! 4502: ADD_I	add 	%r16, 0x01b0, %r29
	.word 0xb9e461f4  ! 4503: SAVE_I	save	%r17, 0x0001, %r28
T0_asi_reg_wr_187:
	mov	0x3c2, %r14
	.word 0xf4f389e0  ! 4506: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbbe56030  ! 4509: SAVE_I	save	%r21, 0x0001, %r29
T0_asi_reg_wr_188:
	mov	0x10, %r14
	.word 0xf6f38400  ! 4510: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_0_344:
	setx	0x430017, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_356:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_356), 16, 16)) -> intp(0, 0, 3d)
T0_asi_reg_rd_189:
	mov	0x3c7, %r14
	.word 0xfedb8e80  ! 4513: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_0_345:
	setx	0x420328, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_190:
	mov	0x21, %r14
	.word 0xfedb8e40  ! 4515: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbe95a1a8  ! 4518: ORcc_I	orcc 	%r22, 0x01a8, %r31
iob_intr_0_357:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_357), 16, 16)) -> intp(0, 0, 35)
cpu_intr_0_346:
	setx	0x420338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5c000  ! 4527: SAVE_R	save	%r23, %r0, %r24
cpu_intr_0_347:
	setx	0x43002d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_191:
	mov	0x3c2, %r14
	.word 0xf0db84a0  ! 4533: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb9e44000  ! 4535: SAVE_R	save	%r17, %r0, %r28
	.word 0xbfe48000  ! 4538: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_rd_192:
	mov	0x7, %r14
	.word 0xf4db84a0  ! 4540: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_0_348:
	setx	0x43022d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_349:
	setx	0x410126, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_193:
	mov	0x3c1, %r14
	.word 0xf6db84a0  ! 4548: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb3e40000  ! 4549: SAVE_R	save	%r16, %r0, %r25
	.word 0xbbe4a179  ! 4550: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb48ce0d0  ! 4553: ANDcc_I	andcc 	%r19, 0x00d0, %r26
iob_intr_0_358:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_358), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_wr_189:
	mov	0x3c4, %r14
	.word 0xfaf384a0  ! 4557: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_0_350:
	setx	0x410119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_351:
	setx	0x430027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e461d5  ! 4561: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3e50000  ! 4562: SAVE_R	save	%r20, %r0, %r25
	.word 0xb1e54000  ! 4564: SAVE_R	save	%r21, %r0, %r24
iob_intr_0_359:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_359), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_wr_190:
	mov	0x36, %r14
	.word 0xf6f38400  ! 4569: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_0_352:
	setx	0x41000a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_353:
	setx	0x43030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb614e110  ! 4573: OR_I	or 	%r19, 0x0110, %r27
iob_intr_0_360:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_360), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb5e48000  ! 4575: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_361:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_361), 16, 16)) -> intp(0, 0, 16)
iob_intr_0_362:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_362), 16, 16)) -> intp(0, 0, 24)
	.word 0xb5e50000  ! 4578: SAVE_R	save	%r20, %r0, %r26
	.word 0xbde44000  ! 4580: SAVE_R	save	%r17, %r0, %r30
	.word 0xbbe4c000  ! 4581: SAVE_R	save	%r19, %r0, %r29
iob_intr_0_363:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_363), 16, 16)) -> intp(0, 0, 1d)
cpu_intr_0_354:
	setx	0x420339, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_364:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_364), 16, 16)) -> intp(0, 0, 14)
cpu_intr_0_355:
	setx	0x420232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe348000  ! 4590: ORN_R	orn 	%r18, %r0, %r31
	.word 0xb7e461a8  ! 4591: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xba1ca07e  ! 4594: XOR_I	xor 	%r18, 0x007e, %r29
T0_asi_reg_wr_191:
	mov	0x2e, %r14
	.word 0xfaf384a0  ! 4599: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbc3c6055  ! 4600: XNOR_I	xnor 	%r17, 0x0055, %r30
	.word 0xb5e48000  ! 4601: SAVE_R	save	%r18, %r0, %r26
cpu_intr_0_356:
	setx	0x420024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e520d7  ! 4609: SAVE_I	save	%r20, 0x0001, %r24
iob_intr_0_365:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_365), 16, 16)) -> intp(0, 0, d)
cpu_intr_0_357:
	setx	0x460133, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_194:
	mov	0x8, %r14
	.word 0xf4db89e0  ! 4614: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_0_366:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_366), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_wr_192:
	mov	0xe, %r14
	.word 0xf2f38400  ! 4616: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbbe52133  ! 4617: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_rd_195:
	mov	0x3c5, %r14
	.word 0xf8db8400  ! 4619: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T0_asi_reg_wr_193:
	mov	0x34, %r14
	.word 0xf2f38400  ! 4620: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T0_asi_reg_rd_196:
	mov	0x2b, %r14
	.word 0xfadb8400  ! 4621: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb3e5e0cd  ! 4622: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e44000  ! 4623: SAVE_R	save	%r17, %r0, %r26
	.word 0xb2b52197  ! 4626: SUBCcc_I	orncc 	%r20, 0x0197, %r25
T0_asi_reg_rd_197:
	mov	0xd, %r14
	.word 0xfedb8e60  ! 4628: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb9e40000  ! 4631: SAVE_R	save	%r16, %r0, %r28
	.word 0xb1e54000  ! 4633: SAVE_R	save	%r21, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_358:
	setx	0x460008, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_367:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_367), 16, 16)) -> intp(0, 0, 6)
iob_intr_0_368:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_368), 16, 16)) -> intp(0, 0, 38)
cpu_intr_0_359:
	setx	0x460237, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_194:
	mov	0x3c1, %r14
	.word 0xf4f384a0  ! 4641: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_0_369:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_369), 16, 16)) -> intp(0, 0, 21)
	.word 0xb52d6001  ! 4645: SLL_I	sll 	%r21, 0x0001, %r26
	.word 0xb1e56155  ! 4647: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb7e4a00f  ! 4648: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_wr_195:
	mov	0xc, %r14
	.word 0xf0f38400  ! 4649: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T0_asi_reg_rd_198:
	mov	0x23, %r14
	.word 0xfadb8e80  ! 4653: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb3e4201b  ! 4657: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb1e4e18d  ! 4658: SAVE_I	save	%r19, 0x0001, %r24
iob_intr_0_370:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_370), 16, 16)) -> intp(0, 0, 38)
	.word 0xb5e48000  ! 4661: SAVE_R	save	%r18, %r0, %r26
	.word 0xb5518000  ! 4664: RDPR_PSTATE	<illegal instruction>
	.word 0xb5641800  ! 4670: MOVcc_R	<illegal instruction>
T0_asi_reg_rd_199:
	mov	0x3c4, %r14
	.word 0xf6db8e80  ! 4673: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb3641800  ! 4678: MOVcc_R	<illegal instruction>
T0_asi_reg_wr_196:
	mov	0x3c3, %r14
	.word 0xf0f384a0  ! 4680: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_0_360:
	setx	0x47033c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_371:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_371), 16, 16)) -> intp(0, 0, 6)
	.word 0xbbe4e1dd  ! 4687: SAVE_I	save	%r19, 0x0001, %r29
iob_intr_0_372:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_372), 16, 16)) -> intp(0, 0, 3e)
T0_asi_reg_wr_197:
	mov	0x3c8, %r14
	.word 0xf2f38e60  ! 4690: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_0_361:
	setx	0x46013c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_198:
	mov	0x3c8, %r14
	.word 0xfaf38e80  ! 4692: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T0_asi_reg_wr_199:
	mov	0x3c1, %r14
	.word 0xf2f38400  ! 4697: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbfe46058  ! 4699: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb9e4c000  ! 4700: SAVE_R	save	%r19, %r0, %r28
T0_asi_reg_wr_200:
	mov	0x3c4, %r14
	.word 0xfef38e80  ! 4701: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0x839560db  ! 4704: WRPR_TNPC_I	wrpr	%r21, 0x00db, %tnpc
	.word 0xbfe4e11d  ! 4706: SAVE_I	save	%r19, 0x0001, %r31
cpu_intr_0_362:
	setx	0x44032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e561eb  ! 4711: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbde52123  ! 4716: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb3e561a6  ! 4719: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbbe48000  ! 4721: SAVE_R	save	%r18, %r0, %r29
	.word 0xb3e40000  ! 4723: SAVE_R	save	%r16, %r0, %r25
cpu_intr_0_363:
	setx	0x450014, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_201:
	mov	0x26, %r14
	.word 0xf8f384a0  ! 4726: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_0_373:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_373), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbde44000  ! 4732: SAVE_R	save	%r17, %r0, %r30
	.word 0xbfe5a171  ! 4735: SAVE_I	save	%r22, 0x0001, %r31
cpu_intr_0_364:
	setx	0x47023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x839560d4  ! 4739: WRPR_TNPC_I	wrpr	%r21, 0x00d4, %tnpc
iob_intr_0_374:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_374), 16, 16)) -> intp(0, 0, 33)
T0_asi_reg_rd_200:
	mov	0x31, %r14
	.word 0xf6db89e0  ! 4744: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_0_375:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_375), 16, 16)) -> intp(0, 0, 28)
T0_asi_reg_wr_202:
	mov	0x3c1, %r14
	.word 0xf8f38400  ! 4746: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb3e42077  ! 4747: SAVE_I	save	%r16, 0x0001, %r25
cpu_intr_0_365:
	setx	0x450301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e44000  ! 4753: SAVE_R	save	%r17, %r0, %r25
	.word 0xbbe44000  ! 4756: SAVE_R	save	%r17, %r0, %r29
	.word 0xb29c4000  ! 4757: XORcc_R	xorcc 	%r17, %r0, %r25
	.word 0xbde42061  ! 4762: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_wr_203:
	mov	0x3c1, %r14
	.word 0xf2f38e80  ! 4763: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb9e50000  ! 4764: SAVE_R	save	%r20, %r0, %r28
	.word 0xb5e5203c  ! 4765: SAVE_I	save	%r20, 0x0001, %r26
T0_asi_reg_wr_204:
	mov	0x3c0, %r14
	.word 0xf2f38400  ! 4766: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb63cc000  ! 4776: XNOR_R	xnor 	%r19, %r0, %r27
	.word 0xb1e560e1  ! 4777: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb1e44000  ! 4778: SAVE_R	save	%r17, %r0, %r24
iob_intr_0_376:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_376), 16, 16)) -> intp(0, 0, 16)
	.word 0xb535f001  ! 4788: SRLX_I	srlx	%r23, 0x0001, %r26
cpu_intr_0_366:
	setx	0x450020, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_377:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_377), 16, 16)) -> intp(0, 0, b)
T0_asi_reg_rd_201:
	mov	0x38, %r14
	.word 0xf4db8e40  ! 4791: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb5e4a171  ! 4793: SAVE_I	save	%r18, 0x0001, %r26
cpu_intr_0_367:
	setx	0x44023b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_205:
	mov	0x2b, %r14
	.word 0xf8f38400  ! 4797: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_0_368:
	setx	0x44021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb135d000  ! 4802: SRLX_R	srlx	%r23, %r0, %r24
T0_asi_reg_wr_206:
	mov	0x28, %r14
	.word 0xf2f38400  ! 4803: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbbe54000  ! 4806: SAVE_R	save	%r21, %r0, %r29
	.word 0xb7e44000  ! 4808: SAVE_R	save	%r17, %r0, %r27
T0_asi_reg_rd_202:
	mov	0x1f, %r14
	.word 0xf2db8e40  ! 4810: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbbe48000  ! 4811: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_wr_207:
	mov	0x3c7, %r14
	.word 0xf4f38400  ! 4816: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb3e5a146  ! 4817: SAVE_I	save	%r22, 0x0001, %r25
iob_intr_0_378:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_378), 16, 16)) -> intp(0, 0, 18)
	.word 0xb9e48000  ! 4819: SAVE_R	save	%r18, %r0, %r28
T0_asi_reg_rd_203:
	mov	0x38, %r14
	.word 0xfedb8e40  ! 4822: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_wr_208:
	mov	0x33, %r14
	.word 0xf2f384a0  ! 4823: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_0_379:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_379), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb9e50000  ! 4826: SAVE_R	save	%r20, %r0, %r28
	.word 0xb03c0000  ! 4827: XNOR_R	xnor 	%r16, %r0, %r24
T0_asi_reg_wr_209:
	mov	0x2e, %r14
	.word 0xfaf38400  ! 4829: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_0_380:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_380), 16, 16)) -> intp(0, 0, 39)
	.word 0xbbe56165  ! 4832: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e5a14b  ! 4834: SAVE_I	save	%r22, 0x0001, %r27
T0_asi_reg_rd_204:
	mov	0x9, %r14
	.word 0xf2db89e0  ! 4835: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb9504000  ! 4837: RDPR_TNPC	<illegal instruction>
iob_intr_0_381:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_381), 16, 16)) -> intp(0, 0, 33)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e4e06d  ! 4849: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb5e42063  ! 4851: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbbe44000  ! 4854: SAVE_R	save	%r17, %r0, %r29
	.word 0xb1e54000  ! 4858: SAVE_R	save	%r21, %r0, %r24
	.word 0xbfe40000  ! 4861: SAVE_R	save	%r16, %r0, %r31
T0_asi_reg_rd_205:
	mov	0x3c6, %r14
	.word 0xf2db8e40  ! 4862: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbde5217c  ! 4863: SAVE_I	save	%r20, 0x0001, %r30
cpu_intr_0_369:
	setx	0x47020e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_206:
	mov	0x3c6, %r14
	.word 0xf6db8e80  ! 4868: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb3e48000  ! 4870: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_rd_207:
	mov	0x3c4, %r14
	.word 0xfadb8e40  ! 4871: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_370:
	setx	0x460008, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_208:
	mov	0x36, %r14
	.word 0xfedb8e80  ! 4876: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T0_asi_reg_wr_210:
	mov	0xe, %r14
	.word 0xf4f384a0  ! 4878: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbfe5c000  ! 4880: SAVE_R	save	%r23, %r0, %r31
cpu_intr_0_371:
	setx	0x460133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e58000  ! 4884: SAVE_R	save	%r22, %r0, %r25
	.word 0xb3e46140  ! 4885: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e50000  ! 4887: SAVE_R	save	%r20, %r0, %r26
iob_intr_0_382:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_382), 16, 16)) -> intp(0, 0, 29)
	.word 0xb8b42116  ! 4900: SUBCcc_I	orncc 	%r16, 0x0116, %r28
iob_intr_0_383:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_383), 16, 16)) -> intp(0, 0, 16)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbd3d5000  ! 4906: SRAX_R	srax	%r21, %r0, %r30
iob_intr_0_384:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_384), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb1e5603f  ! 4908: SAVE_I	save	%r21, 0x0001, %r24
T0_asi_reg_rd_209:
	mov	0x1b, %r14
	.word 0xf0db84a0  ! 4913: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb7e44000  ! 4914: SAVE_R	save	%r17, %r0, %r27
T0_asi_reg_rd_210:
	mov	0x2, %r14
	.word 0xf2db8400  ! 4915: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_0_372:
	setx	0x460213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2c4202d  ! 4917: ADDCcc_I	addccc 	%r16, 0x002d, %r25
	.word 0xb3e5a0e2  ! 4918: SAVE_I	save	%r22, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_385:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_385), 16, 16)) -> intp(0, 0, 12)
	.word 0xb5e5a0a0  ! 4927: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb3e48000  ! 4928: SAVE_R	save	%r18, %r0, %r25
	.word 0xbfe421d9  ! 4929: SAVE_I	save	%r16, 0x0001, %r31
cpu_intr_0_373:
	setx	0x470300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5c000  ! 4931: SAVE_R	save	%r23, %r0, %r26
iob_intr_0_386:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_386), 16, 16)) -> intp(0, 0, b)
cpu_intr_0_374:
	setx	0x460020, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_387:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_387), 16, 16)) -> intp(0, 0, 28)
	.word 0xbbe4a170  ! 4937: SAVE_I	save	%r18, 0x0001, %r29
T0_asi_reg_wr_211:
	mov	0x2b, %r14
	.word 0xf0f38e40  ! 4938: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_0_388:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_388), 16, 16)) -> intp(0, 0, 2c)
cpu_intr_0_375:
	setx	0x46003e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_389:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_389), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbbe4c000  ! 4946: SAVE_R	save	%r19, %r0, %r29
T0_asi_reg_rd_211:
	mov	0x3c2, %r14
	.word 0xfedb8e40  ! 4947: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb9e4a04b  ! 4948: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb7e50000  ! 4949: SAVE_R	save	%r20, %r0, %r27
	.word 0xbb2cc000  ! 4950: SLL_R	sll 	%r19, %r0, %r29
iob_intr_0_390:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_390), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb3e5a1bb  ! 4956: SAVE_I	save	%r22, 0x0001, %r25
T0_asi_reg_wr_212:
	mov	0x3c4, %r14
	.word 0xf4f384a0  ! 4958: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_0_376:
	setx	0x470204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a03d  ! 4963: SAVE_I	save	%r22, 0x0001, %r26
iob_intr_0_391:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_391), 16, 16)) -> intp(0, 0, 2)
	.word 0xbde40000  ! 4966: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_392:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_392), 16, 16)) -> intp(0, 0, 3d)
T0_asi_reg_wr_213:
	mov	0x36, %r14
	.word 0xf0f384a0  ! 4968: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb1e54000  ! 4970: SAVE_R	save	%r21, %r0, %r24
	.word 0xb7e50000  ! 4971: SAVE_R	save	%r20, %r0, %r27
cpu_intr_0_377:
	setx	0x45022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_214:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 4973: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_0_393:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_393), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb1e4c000  ! 4978: SAVE_R	save	%r19, %r0, %r24
cpu_intr_0_378:
	setx	0x440111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e1b4  ! 4984: SAVE_I	save	%r23, 0x0001, %r26
iob_intr_0_394:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_394), 16, 16)) -> intp(0, 0, 35)
T0_asi_reg_wr_215:
	mov	0x3c5, %r14
	.word 0xf6f38400  ! 4991: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T0_asi_reg_rd_212:
	mov	0xe, %r14
	.word 0xfcdb8e40  ! 4993: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb3e4e152  ! 4994: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb5e5e11f  ! 4998: SAVE_I	save	%r23, 0x0001, %r26
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
	.word 0xf8b5c020  ! 1: STHA_R	stha	%r28, [%r23 + %r0] 0x01
	.word 0xbc0d4000  ! 3: AND_R	and 	%r21, %r0, %r30
T3_asi_reg_rd_0:
	mov	0x3c2, %r14
	.word 0xf8db8e40  ! 5: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T3_asi_reg_rd_1:
	mov	0x3c5, %r14
	.word 0xf0db8e80  ! 8: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_3_0:
	setx	0x1f0226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_1:
	setx	0x1d0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2c613e  ! 14: STB_I	stb	%r31, [%r17 + 0x013e]
	ta	T_CHANGE_TO_TL0
	.word 0xbd2dd000  ! 19: SLLX_R	sllx	%r23, %r0, %r30
cpu_intr_3_2:
	setx	0x1f0327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb535b001  ! 21: SRLX_I	srlx	%r22, 0x0001, %r26
cpu_intr_3_3:
	setx	0x1e0215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a58020  ! 23: STWA_R	stwa	%r24, [%r22 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_0), 16, 16)) -> intp(3, 0, 3d)
	.word 0xb48ce058  ! 26: ANDcc_I	andcc 	%r19, 0x0058, %r26
	.word 0xf435a125  ! 28: STH_I	sth	%r26, [%r22 + 0x0125]
	.word 0xf42ce1d2  ! 30: STB_I	stb	%r26, [%r19 + 0x01d2]
cpu_intr_3_4:
	setx	0x1f0007, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_2:
	mov	0x3c4, %r14
	.word 0xfcdb8400  ! 38: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf22cc000  ! 40: STB_R	stb	%r25, [%r19 + %r0]
	.word 0xfeb40020  ! 42: STHA_R	stha	%r31, [%r16 + %r0] 0x01
	.word 0xfab421df  ! 43: STHA_I	stha	%r29, [%r16 + 0x01df] %asi
cpu_intr_3_5:
	setx	0x1c033a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_6:
	setx	0x1c001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb20c8000  ! 53: AND_R	and 	%r18, %r0, %r25
	.word 0xfeb5c020  ! 54: STHA_R	stha	%r31, [%r23 + %r0] 0x01
T3_asi_reg_wr_0:
	mov	0x3c7, %r14
	.word 0xfaf384a0  ! 57: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xfc2d60c6  ! 61: STB_I	stb	%r30, [%r21 + 0x00c6]
	.word 0xf0350000  ! 63: STH_R	sth	%r24, [%r20 + %r0]
iob_intr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_1), 16, 16)) -> intp(3, 0, 1b)
T3_asi_reg_rd_3:
	mov	0x12, %r14
	.word 0xf2db84a0  ! 67: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xfaf4a118  ! 70: STXA_I	stxa	%r29, [%r18 + 0x0118] %asi
T3_asi_reg_wr_1:
	mov	0x3, %r14
	.word 0xfef38400  ! 73: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T3_asi_reg_wr_2:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 74: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_2), 16, 16)) -> intp(3, 0, 39)
cpu_intr_3_7:
	setx	0x1e0330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe1c60c4  ! 82: XOR_I	xor 	%r17, 0x00c4, %r31
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_4:
	mov	0xd, %r14
	.word 0xfcdb8e60  ! 84: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_3_8:
	setx	0x1d001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_3), 16, 16)) -> intp(3, 0, 1)
	.word 0xf0744000  ! 98: STX_R	stx	%r24, [%r17 + %r0]
T3_asi_reg_wr_3:
	mov	0xb, %r14
	.word 0xfef38400  ! 100: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_3_9:
	setx	0x1d0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a5e024  ! 106: STWA_I	stwa	%r28, [%r23 + 0x0024] %asi
	.word 0xb3357001  ! 107: SRLX_I	srlx	%r21, 0x0001, %r25
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xf275a059  ! 115: STX_I	stx	%r25, [%r22 + 0x0059]
T3_asi_reg_wr_4:
	mov	0x0, %r14
	.word 0xf8f384a0  ! 117: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf025a025  ! 119: STW_I	stw	%r24, [%r22 + 0x0025]
cpu_intr_3_10:
	setx	0x1c032b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_5:
	mov	0x3c8, %r14
	.word 0xf2db8e60  ! 121: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbb641800  ! 123: MOVcc_R	<illegal instruction>
cpu_intr_3_11:
	setx	0x1d0032, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_12:
	setx	0x1e0133, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_4), 16, 16)) -> intp(3, 0, 23)
iob_intr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_5), 16, 16)) -> intp(3, 0, 0)
	.word 0xfaa48020  ! 133: STWA_R	stwa	%r29, [%r18 + %r0] 0x01
T3_asi_reg_rd_6:
	mov	0xe, %r14
	.word 0xf4db89e0  ! 136: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_3_13:
	setx	0x1e022b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_6), 16, 16)) -> intp(3, 0, 32)
T3_asi_reg_rd_7:
	mov	0x32, %r14
	.word 0xf6db8e60  ! 142: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf4a4203d  ! 143: STWA_I	stwa	%r26, [%r16 + 0x003d] %asi
cpu_intr_3_14:
	setx	0x1d0111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf875e1c8  ! 147: STX_I	stx	%r28, [%r23 + 0x01c8]
cpu_intr_3_15:
	setx	0x1c0033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a44020  ! 156: STWA_R	stwa	%r25, [%r17 + %r0] 0x01
T3_asi_reg_rd_8:
	mov	0x3c5, %r14
	.word 0xf8db8400  ! 162: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb4b4607f  ! 164: ORNcc_I	orncc 	%r17, 0x007f, %r26
T3_asi_reg_rd_9:
	mov	0x3c4, %r14
	.word 0xfadb8e40  ! 167: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_rd_10:
	mov	0x0, %r14
	.word 0xfcdb8400  ! 169: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf2ad600b  ! 171: STBA_I	stba	%r25, [%r21 + 0x000b] %asi
	.word 0xf6254000  ! 175: STW_R	stw	%r27, [%r21 + %r0]
	.word 0xb73c4000  ! 176: SRA_R	sra 	%r17, %r0, %r27
cpu_intr_3_16:
	setx	0x1c0304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_7), 16, 16)) -> intp(3, 0, 7)
	.word 0xbd35a001  ! 180: SRL_I	srl 	%r22, 0x0001, %r30
T3_asi_reg_wr_5:
	mov	0x3c6, %r14
	.word 0xf0f389e0  ! 182: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_8), 16, 16)) -> intp(3, 0, 1a)
	.word 0xb094a00a  ! 190: ORcc_I	orcc 	%r18, 0x000a, %r24
	.word 0xf2758000  ! 191: STX_R	stx	%r25, [%r22 + %r0]
	.word 0xf2b4e0a5  ! 194: STHA_I	stha	%r25, [%r19 + 0x00a5] %asi
iob_intr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_9), 16, 16)) -> intp(3, 0, 28)
	.word 0xf8b4208c  ! 196: STHA_I	stha	%r28, [%r16 + 0x008c] %asi
T3_asi_reg_wr_6:
	mov	0x32, %r14
	.word 0xfaf38e60  ! 197: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf62ce0e0  ! 199: STB_I	stb	%r27, [%r19 + 0x00e0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa2d8000  ! 206: STB_R	stb	%r29, [%r22 + %r0]
	.word 0xf6750000  ! 207: STX_R	stx	%r27, [%r20 + %r0]
	.word 0xb4358000  ! 208: ORN_R	orn 	%r22, %r0, %r26
	.word 0xf4a42108  ! 209: STWA_I	stwa	%r26, [%r16 + 0x0108] %asi
cpu_intr_3_17:
	setx	0x1e033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa246026  ! 213: STW_I	stw	%r29, [%r17 + 0x0026]
cpu_intr_3_18:
	setx	0x1f0121, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_11:
	mov	0x3c2, %r14
	.word 0xfedb8e40  ! 216: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf8242001  ! 217: STW_I	stw	%r28, [%r16 + 0x0001]
	.word 0xf42dc000  ! 218: STB_R	stb	%r26, [%r23 + %r0]
	.word 0xbf343001  ! 219: SRLX_I	srlx	%r16, 0x0001, %r31
T3_asi_reg_wr_7:
	mov	0x12, %r14
	.word 0xf4f384a0  ! 221: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_10), 16, 16)) -> intp(3, 0, 2)
iob_intr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_11), 16, 16)) -> intp(3, 0, 21)
	.word 0xf82cc000  ! 224: STB_R	stb	%r28, [%r19 + %r0]
T3_asi_reg_wr_8:
	mov	0x2a, %r14
	.word 0xfef38e40  ! 226: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_12), 16, 16)) -> intp(3, 0, 26)
	.word 0xfa75e17a  ! 236: STX_I	stx	%r29, [%r23 + 0x017a]
iob_intr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_13), 16, 16)) -> intp(3, 0, 1)
	.word 0xf8ad6166  ! 241: STBA_I	stba	%r28, [%r21 + 0x0166] %asi
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_19:
	setx	0x1e0232, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_20:
	setx	0x1c0221, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_9:
	mov	0x22, %r14
	.word 0xf2f38e80  ! 248: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T3_asi_reg_wr_10:
	mov	0x3c0, %r14
	.word 0xf0f389e0  ! 249: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf8f52164  ! 251: STXA_I	stxa	%r28, [%r20 + 0x0164] %asi
cpu_intr_3_21:
	setx	0x1f0331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf074c000  ! 254: STX_R	stx	%r24, [%r19 + %r0]
iob_intr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_14), 16, 16)) -> intp(3, 0, 2a)
T3_asi_reg_wr_11:
	mov	0x2d, %r14
	.word 0xf4f38e60  ! 259: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_15), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf82cc000  ! 262: STB_R	stb	%r28, [%r19 + %r0]
	.word 0xbd3c8000  ! 263: SRA_R	sra 	%r18, %r0, %r30
	ta	T_CHANGE_TO_TL0
iob_intr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_16), 16, 16)) -> intp(3, 0, 2d)
	.word 0xfe34e1b5  ! 272: STH_I	sth	%r31, [%r19 + 0x01b5]
iob_intr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_17), 16, 16)) -> intp(3, 0, 32)
	.word 0xbb510000  ! 279: RDPR_TICK	rdpr	%tick, %r29
iob_intr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_18), 16, 16)) -> intp(3, 0, 36)
iob_intr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_19), 16, 16)) -> intp(3, 0, 24)
T3_asi_reg_rd_12:
	mov	0x3c7, %r14
	.word 0xfadb89e0  ! 284: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf034a15b  ! 287: STH_I	sth	%r24, [%r18 + 0x015b]
	.word 0xf6358000  ! 289: STH_R	sth	%r27, [%r22 + %r0]
	.word 0xf4a5a0ee  ! 290: STWA_I	stwa	%r26, [%r22 + 0x00ee] %asi
	.word 0xf22dc000  ! 292: STB_R	stb	%r25, [%r23 + %r0]
	.word 0xb09cc000  ! 294: XORcc_R	xorcc 	%r19, %r0, %r24
	.word 0xf6ac616f  ! 295: STBA_I	stba	%r27, [%r17 + 0x016f] %asi
	.word 0xb7353001  ! 296: SRLX_I	srlx	%r20, 0x0001, %r27
	.word 0xf2f560d5  ! 299: STXA_I	stxa	%r25, [%r21 + 0x00d5] %asi
cpu_intr_3_22:
	setx	0x1e0132, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfc2c61d1  ! 317: STB_I	stb	%r30, [%r17 + 0x01d1]
	.word 0xf0758000  ! 322: STX_R	stx	%r24, [%r22 + %r0]
	.word 0xf0b4c020  ! 323: STHA_R	stha	%r24, [%r19 + %r0] 0x01
T3_asi_reg_rd_13:
	mov	0x31, %r14
	.word 0xfcdb8e60  ! 326: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf4a4e1c3  ! 328: STWA_I	stwa	%r26, [%r19 + 0x01c3] %asi
iob_intr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_20), 16, 16)) -> intp(3, 0, 10)
	.word 0xf22c4000  ! 331: STB_R	stb	%r25, [%r17 + %r0]
	ta	T_CHANGE_TO_TL1
	.word 0xf634a105  ! 335: STH_I	sth	%r27, [%r18 + 0x0105]
iob_intr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_21), 16, 16)) -> intp(3, 0, 1b)
T3_asi_reg_rd_14:
	mov	0x32, %r14
	.word 0xfcdb8e80  ! 340: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_3_23:
	setx	0x1e000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982f8a  ! 342: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f8a, %hpstate
	.word 0xf2b5a174  ! 343: STHA_I	stha	%r25, [%r22 + 0x0174] %asi
cpu_intr_3_24:
	setx	0x1e001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe740000  ! 346: STX_R	stx	%r31, [%r16 + %r0]
	.word 0xf62de0bd  ! 348: STB_I	stb	%r27, [%r23 + 0x00bd]
	.word 0xb285c000  ! 352: ADDcc_R	addcc 	%r23, %r0, %r25
iob_intr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_22), 16, 16)) -> intp(3, 0, 3d)
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	.word 0xf4a46047  ! 357: STWA_I	stwa	%r26, [%r17 + 0x0047] %asi
iob_intr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_23), 16, 16)) -> intp(3, 0, 7)
	.word 0xfc2d8000  ! 362: STB_R	stb	%r30, [%r22 + %r0]
cpu_intr_3_25:
	setx	0x1d0311, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_24), 16, 16)) -> intp(3, 0, 2c)
	ta	T_CHANGE_NONHPRIV
	.word 0xf6348000  ! 367: STH_R	sth	%r27, [%r18 + %r0]
	.word 0xbf2c0000  ! 368: SLL_R	sll 	%r16, %r0, %r31
T3_asi_reg_wr_12:
	mov	0x34, %r14
	.word 0xf8f38e40  ! 369: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_3_26:
	setx	0x1e0003, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_25), 16, 16)) -> intp(3, 0, 3b)
T3_asi_reg_rd_15:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 374: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_16:
	mov	0x3c0, %r14
	.word 0xfedb8400  ! 380: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbe1dc000  ! 383: XOR_R	xor 	%r23, %r0, %r31
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983c12  ! 384: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c12, %hpstate
	.word 0xbf359000  ! 386: SRLX_R	srlx	%r22, %r0, %r31
T3_asi_reg_wr_13:
	mov	0x2e, %r14
	.word 0xfef38400  ! 391: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf0ad2075  ! 395: STBA_I	stba	%r24, [%r20 + 0x0075] %asi
cpu_intr_3_27:
	setx	0x1c011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf42d8000  ! 401: STB_R	stb	%r26, [%r22 + %r0]
	ta	T_CHANGE_NONHPRIV
	.word 0xfc7461b0  ! 404: STX_I	stx	%r30, [%r17 + 0x01b0]
	ta	T_CHANGE_HPRIV
iob_intr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_26), 16, 16)) -> intp(3, 0, 2f)
	.word 0xba14a121  ! 409: OR_I	or 	%r18, 0x0121, %r29
	.word 0xb37da401  ! 410: MOVR_I	movre	%r22, 0x1, %r25
	.word 0xf2acc020  ! 413: STBA_R	stba	%r25, [%r19 + %r0] 0x01
	.word 0xfc254000  ! 414: STW_R	stw	%r30, [%r21 + %r0]
cpu_intr_3_28:
	setx	0x1f0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcacc020  ! 421: STBA_R	stba	%r30, [%r19 + %r0] 0x01
cpu_intr_3_29:
	setx	0x1c0220, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf0344000  ! 429: STH_R	sth	%r24, [%r17 + %r0]
iob_intr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_27), 16, 16)) -> intp(3, 0, 0)
	.word 0xb5520000  ! 432: RDPR_PIL	rdpr	%pil, %r26
	.word 0xf2242044  ! 434: STW_I	stw	%r25, [%r16 + 0x0044]
	.word 0xf42cc000  ! 437: STB_R	stb	%r26, [%r19 + %r0]
cpu_intr_3_30:
	setx	0x1f012e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_17:
	mov	0x1d, %r14
	.word 0xf4db89e0  ! 442: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T3_asi_reg_rd_18:
	mov	0x27, %r14
	.word 0xfedb89e0  ! 443: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xfcb56065  ! 444: STHA_I	stha	%r30, [%r21 + 0x0065] %asi
iob_intr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_28), 16, 16)) -> intp(3, 0, 17)
cpu_intr_3_31:
	setx	0x1f0320, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_29), 16, 16)) -> intp(3, 0, 26)
	.word 0xfc358000  ! 451: STH_R	sth	%r30, [%r22 + %r0]
	.word 0xf82d6194  ! 452: STB_I	stb	%r28, [%r21 + 0x0194]
cpu_intr_3_32:
	setx	0x1c033b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_14:
	mov	0x12, %r14
	.word 0xfcf38e60  ! 457: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_30), 16, 16)) -> intp(3, 0, 1d)
	.word 0xfc2d8000  ! 460: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xf2adc020  ! 465: STBA_R	stba	%r25, [%r23 + %r0] 0x01
	.word 0xfaa4e151  ! 466: STWA_I	stwa	%r29, [%r19 + 0x0151] %asi
	.word 0xfc2c8000  ! 467: STB_R	stb	%r30, [%r18 + %r0]
	.word 0xf0354000  ! 468: STH_R	sth	%r24, [%r21 + %r0]
	.word 0xf0748000  ! 469: STX_R	stx	%r24, [%r18 + %r0]
iob_intr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_31), 16, 16)) -> intp(3, 0, b)
iob_intr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_32), 16, 16)) -> intp(3, 0, 34)
T3_asi_reg_wr_15:
	mov	0x35, %r14
	.word 0xf6f384a0  ! 474: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_3_33:
	setx	0x220320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2ce004  ! 478: STB_I	stb	%r30, [%r19 + 0x0004]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_19:
	mov	0x3c5, %r14
	.word 0xf0db89e0  ! 484: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf4748000  ! 486: STX_R	stx	%r26, [%r18 + %r0]
	setx	data_start_3, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982d12  ! 487: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d12, %hpstate
	.word 0xf0a58020  ! 488: STWA_R	stwa	%r24, [%r22 + %r0] 0x01
	.word 0xf2a50020  ! 489: STWA_R	stwa	%r25, [%r20 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_33), 16, 16)) -> intp(3, 0, 1)
iob_intr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_34), 16, 16)) -> intp(3, 0, d)
iob_intr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_35), 16, 16)) -> intp(3, 0, 31)
	.word 0xfcb5c020  ! 502: STHA_R	stha	%r30, [%r23 + %r0] 0x01
	.word 0xfeb56052  ! 503: STHA_I	stha	%r31, [%r21 + 0x0052] %asi
	.word 0xf0a58020  ! 504: STWA_R	stwa	%r24, [%r22 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
	.word 0xb4ace1a8  ! 506: ANDNcc_I	andncc 	%r19, 0x01a8, %r26
	.word 0xba3561f0  ! 508: ORN_I	orn 	%r21, 0x01f0, %r29
cpu_intr_3_34:
	setx	0x230136, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_36), 16, 16)) -> intp(3, 0, 15)
	.word 0xf2ace0df  ! 513: STBA_I	stba	%r25, [%r19 + 0x00df] %asi
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_35:
	setx	0x200009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8f902000  ! 523: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
T3_asi_reg_wr_16:
	mov	0x3c6, %r14
	.word 0xf4f38400  ! 527: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_37), 16, 16)) -> intp(3, 0, 11)
cpu_intr_3_36:
	setx	0x230026, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_37:
	setx	0x23010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a561ea  ! 535: STWA_I	stwa	%r25, [%r21 + 0x01ea] %asi
	.word 0xf6adc020  ! 536: STBA_R	stba	%r27, [%r23 + %r0] 0x01
	.word 0xf675c000  ! 537: STX_R	stx	%r27, [%r23 + %r0]
	.word 0xf635a09a  ! 538: STH_I	sth	%r27, [%r22 + 0x009a]
	.word 0xf6b4e0f5  ! 539: STHA_I	stha	%r27, [%r19 + 0x00f5] %asi
cpu_intr_3_38:
	setx	0x230127, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_38), 16, 16)) -> intp(3, 0, 1a)
T3_asi_reg_wr_17:
	mov	0x34, %r14
	.word 0xf4f38e60  ! 542: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_39:
	setx	0x220305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcad2153  ! 548: STBA_I	stba	%r30, [%r20 + 0x0153] %asi
iob_intr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_39), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf0b560d4  ! 555: STHA_I	stha	%r24, [%r21 + 0x00d4] %asi
T3_asi_reg_rd_20:
	mov	0xf, %r14
	.word 0xfcdb8e60  ! 557: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf8258000  ! 558: STW_R	stw	%r28, [%r22 + %r0]
cpu_intr_3_40:
	setx	0x200121, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_40), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_rd_21:
	mov	0x13, %r14
	.word 0xf6db8e40  ! 564: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_41:
	setx	0x230032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb42095  ! 569: STHA_I	stha	%r31, [%r16 + 0x0095] %asi
	.word 0xf0252070  ! 570: STW_I	stw	%r24, [%r20 + 0x0070]
	.word 0xf275c000  ! 574: STX_R	stx	%r25, [%r23 + %r0]
cpu_intr_3_42:
	setx	0x21023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaac8020  ! 580: STBA_R	stba	%r29, [%r18 + %r0] 0x01
	.word 0xf2b4c020  ! 581: STHA_R	stha	%r25, [%r19 + %r0] 0x01
iob_intr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_41), 16, 16)) -> intp(3, 0, 24)
	.word 0xb68c205e  ! 584: ANDcc_I	andcc 	%r16, 0x005e, %r27
iob_intr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_42), 16, 16)) -> intp(3, 0, 2c)
	.word 0xba8c6011  ! 587: ANDcc_I	andcc 	%r17, 0x0011, %r29
	.word 0xf6ad0020  ! 588: STBA_R	stba	%r27, [%r20 + %r0] 0x01
cpu_intr_3_43:
	setx	0x210031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_44:
	setx	0x220127, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_18:
	mov	0x1e, %r14
	.word 0xf8f38400  ! 593: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf4354000  ! 595: STH_R	sth	%r26, [%r21 + %r0]
	.word 0xf624e0e8  ! 596: STW_I	stw	%r27, [%r19 + 0x00e8]
	.word 0xb235c000  ! 598: SUBC_R	orn 	%r23, %r0, %r25
cpu_intr_3_45:
	setx	0x230003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2cc000  ! 600: STB_R	stb	%r31, [%r19 + %r0]
	.word 0xfc758000  ! 607: STX_R	stx	%r30, [%r22 + %r0]
T3_asi_reg_wr_19:
	mov	0x9, %r14
	.word 0xf2f38e40  ! 608: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf8b4a1ba  ! 609: STHA_I	stha	%r28, [%r18 + 0x01ba] %asi
cpu_intr_3_46:
	setx	0x23001a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_47:
	setx	0x220233, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_22:
	mov	0x26, %r14
	.word 0xfadb8400  ! 613: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xfaf5a081  ! 616: STXA_I	stxa	%r29, [%r22 + 0x0081] %asi
cpu_intr_3_48:
	setx	0x23012c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_43), 16, 16)) -> intp(3, 0, 13)
T3_asi_reg_wr_20:
	mov	0x3c3, %r14
	.word 0xfef38400  ! 620: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_44), 16, 16)) -> intp(3, 0, 0)
	ta	T_CHANGE_NONHPRIV
	.word 0xfc258000  ! 625: STW_R	stw	%r30, [%r22 + %r0]
iob_intr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_45), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf4b5c020  ! 631: STHA_R	stha	%r26, [%r23 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
iob_intr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_46), 16, 16)) -> intp(3, 0, 10)
	.word 0xf0b54020  ! 638: STHA_R	stha	%r24, [%r21 + %r0] 0x01
	.word 0xb684e138  ! 639: ADDcc_I	addcc 	%r19, 0x0138, %r27
	.word 0xb045a004  ! 641: ADDC_I	addc 	%r22, 0x0004, %r24
	.word 0xb2354000  ! 642: ORN_R	orn 	%r21, %r0, %r25
T3_asi_reg_rd_23:
	mov	0x3c5, %r14
	.word 0xf4db8e40  ! 643: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf2a50020  ! 648: STWA_R	stwa	%r25, [%r20 + %r0] 0x01
iob_intr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_47), 16, 16)) -> intp(3, 0, 2a)
iob_intr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_48), 16, 16)) -> intp(3, 0, 9)
	.word 0xf4b50020  ! 655: STHA_R	stha	%r26, [%r20 + %r0] 0x01
	.word 0xf8ac0020  ! 660: STBA_R	stba	%r28, [%r16 + %r0] 0x01
	.word 0xb92d6001  ! 662: SLL_I	sll 	%r21, 0x0001, %r28
T3_asi_reg_wr_21:
	mov	0x1b, %r14
	.word 0xfef38e60  ! 663: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_3_49:
	setx	0x200120, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_24:
	mov	0x2d, %r14
	.word 0xf6db8400  ! 667: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T3_asi_reg_wr_22:
	mov	0x37, %r14
	.word 0xf0f38400  ! 669: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_49), 16, 16)) -> intp(3, 0, 34)
cpu_intr_3_50:
	setx	0x230322, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_25:
	mov	0xb, %r14
	.word 0xf4db84a0  ! 676: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf0b4c020  ! 677: STHA_R	stha	%r24, [%r19 + %r0] 0x01
iob_intr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_50), 16, 16)) -> intp(3, 0, 4)
T3_asi_reg_rd_26:
	mov	0x28, %r14
	.word 0xf6db84a0  ! 685: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xfeb5a123  ! 686: STHA_I	stha	%r31, [%r22 + 0x0123] %asi
	.word 0xf0b58020  ! 687: STHA_R	stha	%r24, [%r22 + %r0] 0x01
	.word 0xfeb40020  ! 690: STHA_R	stha	%r31, [%r16 + %r0] 0x01
iob_intr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_51), 16, 16)) -> intp(3, 0, 1f)
	.word 0xfa2da161  ! 693: STB_I	stb	%r29, [%r22 + 0x0161]
T3_asi_reg_wr_23:
	mov	0x2f, %r14
	.word 0xf0f38e80  ! 695: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf234a00a  ! 697: STH_I	sth	%r25, [%r18 + 0x000a]
iob_intr_3_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_52), 16, 16)) -> intp(3, 0, 1f)
	.word 0xfea5a07b  ! 702: STWA_I	stwa	%r31, [%r22 + 0x007b] %asi
cpu_intr_3_51:
	setx	0x23031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2d61ff  ! 704: STB_I	stb	%r31, [%r21 + 0x01ff]
	.word 0xfc250000  ! 705: STW_R	stw	%r30, [%r20 + %r0]
iob_intr_3_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_53), 16, 16)) -> intp(3, 0, 1)
iob_intr_3_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_54), 16, 16)) -> intp(3, 0, 25)
	.word 0xf62d2157  ! 709: STB_I	stb	%r27, [%r20 + 0x0157]
cpu_intr_3_52:
	setx	0x210139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b5a0b7  ! 713: STHA_I	stha	%r27, [%r22 + 0x00b7] %asi
	ta	T_CHANGE_TO_TL1
	.word 0xf434a0eb  ! 717: STH_I	sth	%r26, [%r18 + 0x00eb]
	.word 0xf4aca1f9  ! 718: STBA_I	stba	%r26, [%r18 + 0x01f9] %asi
	.word 0xbb3d8000  ! 719: SRA_R	sra 	%r22, %r0, %r29
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982850  ! 722: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0850, %hpstate
cpu_intr_3_53:
	setx	0x22020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_55), 16, 16)) -> intp(3, 0, 39)
	.word 0xfc242023  ! 727: STW_I	stw	%r30, [%r16 + 0x0023]
iob_intr_3_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_56), 16, 16)) -> intp(3, 0, 0)
iob_intr_3_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_57), 16, 16)) -> intp(3, 0, 15)
	.word 0xfa258000  ! 734: STW_R	stw	%r29, [%r22 + %r0]
iob_intr_3_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_58), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_54:
	setx	0x230235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf425c000  ! 742: STW_R	stw	%r26, [%r23 + %r0]
	.word 0xfcb5e180  ! 748: STHA_I	stha	%r30, [%r23 + 0x0180] %asi
T3_asi_reg_wr_24:
	mov	0x1, %r14
	.word 0xfcf389e0  ! 749: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xbc8ce0d3  ! 753: ANDcc_I	andcc 	%r19, 0x00d3, %r30
iob_intr_3_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_59), 16, 16)) -> intp(3, 0, 0)
iob_intr_3_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_60), 16, 16)) -> intp(3, 0, 2b)
	.word 0xb2950000  ! 762: ORcc_R	orcc 	%r20, %r0, %r25
	.word 0xb2044000  ! 763: ADD_R	add 	%r17, %r0, %r25
iob_intr_3_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_61), 16, 16)) -> intp(3, 0, 1b)
	.word 0xfef5a053  ! 766: STXA_I	stxa	%r31, [%r22 + 0x0053] %asi
iob_intr_3_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_62), 16, 16)) -> intp(3, 0, b)
T3_asi_reg_wr_25:
	mov	0x6, %r14
	.word 0xf0f389e0  ! 772: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xfe35a0f2  ! 774: STH_I	sth	%r31, [%r22 + 0x00f2]
iob_intr_3_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_63), 16, 16)) -> intp(3, 0, 13)
cpu_intr_3_55:
	setx	0x210033, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_56:
	setx	0x23003d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_64), 16, 16)) -> intp(3, 0, 3a)
iob_intr_3_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_65), 16, 16)) -> intp(3, 0, 9)
	.word 0xf4342121  ! 783: STH_I	sth	%r26, [%r16 + 0x0121]
	.word 0xfcad60c8  ! 784: STBA_I	stba	%r30, [%r21 + 0x00c8] %asi
	.word 0xfcb40020  ! 786: STHA_R	stha	%r30, [%r16 + %r0] 0x01
iob_intr_3_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_66), 16, 16)) -> intp(3, 0, 15)
iob_intr_3_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_67), 16, 16)) -> intp(3, 0, 28)
iob_intr_3_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_68), 16, 16)) -> intp(3, 0, 33)
	.word 0xf8a52097  ! 793: STWA_I	stwa	%r28, [%r20 + 0x0097] %asi
iob_intr_3_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_69), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_rd_27:
	mov	0x18, %r14
	.word 0xf6db89e0  ! 796: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xf4a58020  ! 797: STWA_R	stwa	%r26, [%r22 + %r0] 0x01
T3_asi_reg_rd_28:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 799: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf2a4a042  ! 800: STWA_I	stwa	%r25, [%r18 + 0x0042] %asi
iob_intr_3_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_70), 16, 16)) -> intp(3, 0, 3f)
cpu_intr_3_57:
	setx	0x23012f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_26:
	mov	0xc, %r14
	.word 0xf2f384a0  ! 804: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982d5a  ! 805: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5a, %hpstate
	.word 0xfa344000  ! 809: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xf234c000  ! 811: STH_R	sth	%r25, [%r19 + %r0]
	.word 0xfe240000  ! 816: STW_R	stw	%r31, [%r16 + %r0]
cpu_intr_3_58:
	setx	0x220021, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_71), 16, 16)) -> intp(3, 0, 21)
cpu_intr_3_59:
	setx	0x220207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1520000  ! 821: RDPR_PIL	rdpr	%pil, %r24
T3_asi_reg_wr_27:
	mov	0x3c4, %r14
	.word 0xf6f38e80  ! 824: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_3_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_72), 16, 16)) -> intp(3, 0, 1a)
	.word 0xfe340000  ! 829: STH_R	sth	%r31, [%r16 + %r0]
iob_intr_3_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_73), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf6354000  ! 833: STH_R	sth	%r27, [%r21 + %r0]
	.word 0xfc758000  ! 834: STX_R	stx	%r30, [%r22 + %r0]
	.word 0xfe2d4000  ! 837: STB_R	stb	%r31, [%r21 + %r0]
cpu_intr_3_60:
	setx	0x23011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd351000  ! 839: SRLX_R	srlx	%r20, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_29:
	mov	0x1a, %r14
	.word 0xf4db8400  ! 846: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xfca46120  ! 849: STWA_I	stwa	%r30, [%r17 + 0x0120] %asi
T3_asi_reg_wr_28:
	mov	0x6, %r14
	.word 0xf6f38e40  ! 850: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb4354000  ! 851: SUBC_R	orn 	%r21, %r0, %r26
	.word 0xfc35e0d0  ! 852: STH_I	sth	%r30, [%r23 + 0x00d0]
	.word 0xfcad0020  ! 854: STBA_R	stba	%r30, [%r20 + %r0] 0x01
T3_asi_reg_wr_29:
	mov	0x1b, %r14
	.word 0xf4f38e40  ! 855: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T3_asi_reg_rd_30:
	mov	0x3c5, %r14
	.word 0xf8db89e0  ! 856: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T3_asi_reg_wr_30:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 857: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T3_asi_reg_wr_31:
	mov	0x26, %r14
	.word 0xf6f38e60  ! 859: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xfaad0020  ! 863: STBA_R	stba	%r29, [%r20 + %r0] 0x01
cpu_intr_3_61:
	setx	0x210138, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_31:
	mov	0x3c3, %r14
	.word 0xf8db8e60  ! 866: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T3_asi_reg_rd_32:
	mov	0x2e, %r14
	.word 0xf6db8400  ! 873: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T3_asi_reg_wr_32:
	mov	0x3c2, %r14
	.word 0xf6f389e0  ! 875: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf2a54020  ! 877: STWA_R	stwa	%r25, [%r21 + %r0] 0x01
	.word 0xfc246032  ! 878: STW_I	stw	%r30, [%r17 + 0x0032]
	.word 0xf224a1fc  ! 880: STW_I	stw	%r25, [%r18 + 0x01fc]
	.word 0xf6754000  ! 887: STX_R	stx	%r27, [%r21 + %r0]
	.word 0xf03560ef  ! 888: STH_I	sth	%r24, [%r21 + 0x00ef]
cpu_intr_3_62:
	setx	0x220337, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983b02  ! 890: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b02, %hpstate
	.word 0xf0a5a1b2  ! 891: STWA_I	stwa	%r24, [%r22 + 0x01b2] %asi
T3_asi_reg_rd_33:
	mov	0x3c3, %r14
	.word 0xfedb8e40  ! 892: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_rd_34:
	mov	0x10, %r14
	.word 0xf4db89e0  ! 893: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T3_asi_reg_wr_33:
	mov	0xf, %r14
	.word 0xf8f389e0  ! 894: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb49ca1eb  ! 895: XORcc_I	xorcc 	%r18, 0x01eb, %r26
	ta	T_CHANGE_HPRIV
	.word 0xbc3520c3  ! 897: ORN_I	orn 	%r20, 0x00c3, %r30
iob_intr_3_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_74), 16, 16)) -> intp(3, 0, 1d)
iob_intr_3_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_75), 16, 16)) -> intp(3, 0, 2)
	.word 0xf2ad0020  ! 904: STBA_R	stba	%r25, [%r20 + %r0] 0x01
iob_intr_3_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_76), 16, 16)) -> intp(3, 0, e)
iob_intr_3_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_77), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf6346063  ! 911: STH_I	sth	%r27, [%r17 + 0x0063]
cpu_intr_3_63:
	setx	0x220025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b44020  ! 913: STHA_R	stha	%r26, [%r17 + %r0] 0x01
	.word 0xf6a40020  ! 917: STWA_R	stwa	%r27, [%r16 + %r0] 0x01
iob_intr_3_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_78), 16, 16)) -> intp(3, 0, 29)
	.word 0xfa344000  ! 920: STH_R	sth	%r29, [%r17 + %r0]
iob_intr_3_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_79), 16, 16)) -> intp(3, 0, 2a)
	.word 0xfaa5c020  ! 925: STWA_R	stwa	%r29, [%r23 + %r0] 0x01
iob_intr_3_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_80), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf6254000  ! 929: STW_R	stw	%r27, [%r21 + %r0]
	.word 0xf6f5e14e  ! 932: STXA_I	stxa	%r27, [%r23 + 0x014e] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2ac61cc  ! 935: STBA_I	stba	%r25, [%r17 + 0x01cc] %asi
T3_asi_reg_wr_34:
	mov	0x1b, %r14
	.word 0xf8f38400  ! 938: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf6244000  ! 940: STW_R	stw	%r27, [%r17 + %r0]
T3_asi_reg_rd_35:
	mov	0x2a, %r14
	.word 0xf4db8400  ! 942: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xfc244000  ! 943: STW_R	stw	%r30, [%r17 + %r0]
cpu_intr_3_64:
	setx	0x27013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b50020  ! 947: STHA_R	stha	%r28, [%r20 + %r0] 0x01
iob_intr_3_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_81), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf0354000  ! 950: STH_R	sth	%r24, [%r21 + %r0]
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982802  ! 953: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0802, %hpstate
	.word 0xfa746031  ! 960: STX_I	stx	%r29, [%r17 + 0x0031]
	ta	T_CHANGE_TO_TL1
cpu_intr_3_65:
	setx	0x24033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf8754000  ! 966: STX_R	stx	%r28, [%r21 + %r0]
cpu_intr_3_66:
	setx	0x270023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4750000  ! 970: STX_R	stx	%r26, [%r20 + %r0]
iob_intr_3_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_82), 16, 16)) -> intp(3, 0, 19)
	.word 0xf274a13f  ! 975: STX_I	stx	%r25, [%r18 + 0x013f]
	.word 0xf4340000  ! 977: STH_R	sth	%r26, [%r16 + %r0]
T3_asi_reg_wr_35:
	mov	0x19, %r14
	.word 0xf2f38e40  ! 978: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_3_67:
	setx	0x240001, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_36:
	mov	0x3c1, %r14
	.word 0xf2f389e0  ! 981: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_3_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_83), 16, 16)) -> intp(3, 0, 3f)
cpu_intr_3_68:
	setx	0x250001, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_37:
	mov	0x6, %r14
	.word 0xfaf38e40  ! 991: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbaad6011  ! 992: ANDNcc_I	andncc 	%r21, 0x0011, %r29
	.word 0xf024c000  ! 994: STW_R	stw	%r24, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_69:
	setx	0x270301, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_36:
	mov	0x3c8, %r14
	.word 0xfadb8e40  ! 999: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_3_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_84), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_rd_37:
	mov	0x36, %r14
	.word 0xf4db8e40  ! 1007: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf22c4000  ! 1008: STB_R	stb	%r25, [%r17 + %r0]
cpu_intr_3_70:
	setx	0x26031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b4c020  ! 1012: STHA_R	stha	%r27, [%r19 + %r0] 0x01
T3_asi_reg_wr_38:
	mov	0x3c5, %r14
	.word 0xf4f38e60  ! 1013: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf635c000  ! 1015: STH_R	sth	%r27, [%r23 + %r0]
T3_asi_reg_rd_38:
	mov	0x33, %r14
	.word 0xf6db8e60  ! 1017: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_3_71:
	setx	0x240227, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_85), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_72:
	setx	0x270320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb58020  ! 1025: STHA_R	stha	%r31, [%r22 + %r0] 0x01
	.word 0xb03421bc  ! 1026: ORN_I	orn 	%r16, 0x01bc, %r24
cpu_intr_3_73:
	setx	0x260136, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_74:
	setx	0x260020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b4e044  ! 1034: STHA_I	stha	%r27, [%r19 + 0x0044] %asi
	.word 0xfead0020  ! 1036: STBA_R	stba	%r31, [%r20 + %r0] 0x01
cpu_intr_3_75:
	setx	0x260023, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_39:
	mov	0x3c3, %r14
	.word 0xfef38e80  ! 1039: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_3_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_86), 16, 16)) -> intp(3, 0, 33)
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983b02  ! 1041: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b02, %hpstate
	.word 0xf875e0d1  ! 1045: STX_I	stx	%r28, [%r23 + 0x00d1]
	.word 0xf424219f  ! 1047: STW_I	stw	%r26, [%r16 + 0x019f]
	.word 0xf8a48020  ! 1048: STWA_R	stwa	%r28, [%r18 + %r0] 0x01
iob_intr_3_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_87), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_76:
	setx	0x260102, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_40:
	mov	0x20, %r14
	.word 0xfaf38e40  ! 1056: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_rd_39:
	mov	0xc, %r14
	.word 0xfcdb84a0  ! 1058: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf8358000  ! 1060: STH_R	sth	%r28, [%r22 + %r0]
T3_asi_reg_rd_40:
	mov	0x2c, %r14
	.word 0xf6db89e0  ! 1063: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_3_77:
	setx	0x240237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a4e13c  ! 1065: STWA_I	stwa	%r25, [%r19 + 0x013c] %asi
	.word 0xf2b56136  ! 1066: STHA_I	stha	%r25, [%r21 + 0x0136] %asi
cpu_intr_3_78:
	setx	0x270237, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_79:
	setx	0x27012f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_80:
	setx	0x260138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb805c000  ! 1075: ADD_R	add 	%r23, %r0, %r28
T3_asi_reg_rd_41:
	mov	0x3c3, %r14
	.word 0xf8db8e40  ! 1076: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_81:
	setx	0x24023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b40000  ! 1078: ORNcc_R	orncc 	%r16, %r0, %r25
	.word 0xf6352014  ! 1080: STH_I	sth	%r27, [%r20 + 0x0014]
	.word 0xb6a58000  ! 1081: SUBcc_R	subcc 	%r22, %r0, %r27
T3_asi_reg_rd_42:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 1083: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983e9a  ! 1085: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e9a, %hpstate
T3_asi_reg_rd_43:
	mov	0x36, %r14
	.word 0xfedb89e0  ! 1086: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf635603c  ! 1088: STH_I	sth	%r27, [%r21 + 0x003c]
cpu_intr_3_82:
	setx	0x26032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6344000  ! 1090: STH_R	sth	%r27, [%r17 + %r0]
T3_asi_reg_rd_44:
	mov	0x10, %r14
	.word 0xf2db8e40  ! 1098: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb1540000  ! 1099: RDPR_GL	rdpr	%-, %r24
T3_asi_reg_rd_45:
	mov	0x2b, %r14
	.word 0xfedb8e80  ! 1100: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xfe34a1bb  ! 1103: STH_I	sth	%r31, [%r18 + 0x01bb]
	.word 0xb7520000  ! 1105: RDPR_PIL	<illegal instruction>
cpu_intr_3_83:
	setx	0x250317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf875a09f  ! 1111: STX_I	stx	%r28, [%r22 + 0x009f]
iob_intr_3_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_88), 16, 16)) -> intp(3, 0, 1f)
T3_asi_reg_rd_46:
	mov	0x38, %r14
	.word 0xf4db8e60  ! 1116: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb4348000  ! 1119: SUBC_R	orn 	%r18, %r0, %r26
	.word 0xfab54020  ! 1120: STHA_R	stha	%r29, [%r21 + %r0] 0x01
T3_asi_reg_wr_41:
	mov	0x2, %r14
	.word 0xf2f38e60  ! 1121: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_89), 16, 16)) -> intp(3, 0, 2f)
	.word 0x8195e15b  ! 1127: WRPR_TPC_I	wrpr	%r23, 0x015b, %tpc
cpu_intr_3_84:
	setx	0x240026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa240000  ! 1135: STW_R	stw	%r29, [%r16 + %r0]
	.word 0xfc354000  ! 1140: STH_R	sth	%r30, [%r21 + %r0]
	.word 0xfab4608f  ! 1141: STHA_I	stha	%r29, [%r17 + 0x008f] %asi
cpu_intr_3_85:
	setx	0x24012d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_90), 16, 16)) -> intp(3, 0, 35)
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_47:
	mov	0xb, %r14
	.word 0xf0db8400  ! 1147: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xfe3561d3  ! 1153: STH_I	sth	%r31, [%r21 + 0x01d3]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4ade121  ! 1159: STBA_I	stba	%r26, [%r23 + 0x0121] %asi
T3_asi_reg_rd_48:
	mov	0x3c6, %r14
	.word 0xfcdb8e60  ! 1162: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf6750000  ! 1164: STX_R	stx	%r27, [%r20 + %r0]
T3_asi_reg_rd_49:
	mov	0x10, %r14
	.word 0xf2db84a0  ! 1165: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T3_asi_reg_wr_42:
	mov	0x3c0, %r14
	.word 0xf4f38e40  ! 1166: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf4b48020  ! 1167: STHA_R	stha	%r26, [%r18 + %r0] 0x01
T3_asi_reg_wr_43:
	mov	0x29, %r14
	.word 0xfcf38e60  ! 1168: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf43521e2  ! 1169: STH_I	sth	%r26, [%r20 + 0x01e2]
	.word 0xfcb4e0c9  ! 1171: STHA_I	stha	%r30, [%r19 + 0x00c9] %asi
T3_asi_reg_wr_44:
	mov	0x3c6, %r14
	.word 0xfef38400  ! 1172: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_3_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_91), 16, 16)) -> intp(3, 0, 27)
	.word 0xf8ad4020  ! 1177: STBA_R	stba	%r28, [%r21 + %r0] 0x01
	.word 0xfef5a1fd  ! 1179: STXA_I	stxa	%r31, [%r22 + 0x01fd] %asi
	.word 0xf235a06f  ! 1181: STH_I	sth	%r25, [%r22 + 0x006f]
cpu_intr_3_86:
	setx	0x25002e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_87:
	setx	0x250221, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_92), 16, 16)) -> intp(3, 0, 25)
iob_intr_3_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_93), 16, 16)) -> intp(3, 0, 1a)
T3_asi_reg_wr_45:
	mov	0x23, %r14
	.word 0xf4f384a0  ! 1195: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_3_88:
	setx	0x250219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42d8000  ! 1198: STB_R	stb	%r26, [%r22 + %r0]
	.word 0xb2142092  ! 1201: OR_I	or 	%r16, 0x0092, %r25
cpu_intr_3_89:
	setx	0x250215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb750c000  ! 1204: RDPR_TT	rdpr	%tt, %r27
iob_intr_3_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_94), 16, 16)) -> intp(3, 0, 7)
cpu_intr_3_90:
	setx	0x24001e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_91:
	setx	0x26031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea520b8  ! 1209: STWA_I	stwa	%r31, [%r20 + 0x00b8] %asi
T3_asi_reg_wr_46:
	mov	0x13, %r14
	.word 0xf4f38e40  ! 1210: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf07461db  ! 1211: STX_I	stx	%r24, [%r17 + 0x01db]
	.word 0xf4a54020  ! 1212: STWA_R	stwa	%r26, [%r21 + %r0] 0x01
T3_asi_reg_rd_50:
	mov	0x1, %r14
	.word 0xf8db8400  ! 1213: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_92:
	setx	0x240001, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_93:
	setx	0x25001f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_51:
	mov	0x3c0, %r14
	.word 0xf0db8400  ! 1221: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xfca50020  ! 1223: STWA_R	stwa	%r30, [%r20 + %r0] 0x01
cpu_intr_3_94:
	setx	0x25021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe25e1ad  ! 1225: STW_I	stw	%r31, [%r23 + 0x01ad]
cpu_intr_3_95:
	setx	0x24030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_52:
	mov	0x17, %r14
	.word 0xf0db8400  ! 1227: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T3_asi_reg_wr_47:
	mov	0x35, %r14
	.word 0xf2f38e40  ! 1231: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL0
	.word 0xb9643801  ! 1241: MOVcc_I	<illegal instruction>
T3_asi_reg_wr_48:
	mov	0x8, %r14
	.word 0xfaf38e40  ! 1242: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_rd_53:
	mov	0xc, %r14
	.word 0xfadb8e60  ! 1246: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T3_asi_reg_rd_54:
	mov	0x3c6, %r14
	.word 0xfadb8e80  ! 1247: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xfa754000  ! 1250: STX_R	stx	%r29, [%r21 + %r0]
iob_intr_3_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_95), 16, 16)) -> intp(3, 0, 2b)
	.word 0xfa340000  ! 1254: STH_R	sth	%r29, [%r16 + %r0]
cpu_intr_3_96:
	setx	0x26011c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_55:
	mov	0x27, %r14
	.word 0xf6db8e40  ! 1257: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_rd_56:
	mov	0x32, %r14
	.word 0xfedb84a0  ! 1258: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_3_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_96), 16, 16)) -> intp(3, 0, 5)
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983d8a  ! 1262: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d8a, %hpstate
iob_intr_3_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_97), 16, 16)) -> intp(3, 0, c)
	.word 0xfab5c020  ! 1266: STHA_R	stha	%r29, [%r23 + %r0] 0x01
cpu_intr_3_97:
	setx	0x27010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4358000  ! 1278: STH_R	sth	%r26, [%r22 + %r0]
	.word 0xfeb4c020  ! 1279: STHA_R	stha	%r31, [%r19 + %r0] 0x01
T3_asi_reg_wr_49:
	mov	0x1a, %r14
	.word 0xf0f389e0  ! 1280: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T3_asi_reg_wr_50:
	mov	0xb, %r14
	.word 0xf4f384a0  ! 1281: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_3_98:
	setx	0x240332, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_98), 16, 16)) -> intp(3, 0, 13)
cpu_intr_3_99:
	setx	0x240036, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xb8acc000  ! 1288: ANDNcc_R	andncc 	%r19, %r0, %r28
	.word 0xf6a44020  ! 1289: STWA_R	stwa	%r27, [%r17 + %r0] 0x01
	.word 0xf4250000  ! 1293: STW_R	stw	%r26, [%r20 + %r0]
iob_intr_3_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_99), 16, 16)) -> intp(3, 0, 29)
T3_asi_reg_wr_51:
	mov	0x1d, %r14
	.word 0xf0f38e60  ! 1297: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T3_asi_reg_wr_52:
	mov	0x3c0, %r14
	.word 0xf0f38e60  ! 1298: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xfe2d600b  ! 1299: STB_I	stb	%r31, [%r21 + 0x000b]
	.word 0xfe752040  ! 1302: STX_I	stx	%r31, [%r20 + 0x0040]
T3_asi_reg_wr_53:
	mov	0x24, %r14
	.word 0xf6f38e80  ! 1304: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_3_100:
	setx	0x270023, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_100), 16, 16)) -> intp(3, 0, 0)
	.word 0xbc144000  ! 1307: OR_R	or 	%r17, %r0, %r30
cpu_intr_3_101:
	setx	0x240305, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_101), 16, 16)) -> intp(3, 0, 32)
	.word 0xf0a56011  ! 1317: STWA_I	stwa	%r24, [%r21 + 0x0011] %asi
iob_intr_3_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_102), 16, 16)) -> intp(3, 0, 2)
iob_intr_3_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_103), 16, 16)) -> intp(3, 0, 1)
	.word 0xf8350000  ! 1323: STH_R	sth	%r28, [%r20 + %r0]
	.word 0xf27560c8  ! 1324: STX_I	stx	%r25, [%r21 + 0x00c8]
	.word 0xf82cc000  ! 1326: STB_R	stb	%r28, [%r19 + %r0]
cpu_intr_3_102:
	setx	0x26000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6148000  ! 1331: OR_R	or 	%r18, %r0, %r27
T3_asi_reg_rd_57:
	mov	0x3c5, %r14
	.word 0xfcdb8e60  ! 1335: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_3_103:
	setx	0x27032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd7c2401  ! 1337: MOVR_I	movre	%r16, 0x1, %r30
cpu_intr_3_104:
	setx	0x26000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa52114  ! 1339: STWA_I	stwa	%r29, [%r20 + 0x0114] %asi
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf435e01f  ! 1342: STH_I	sth	%r26, [%r23 + 0x001f]
	.word 0xf6358000  ! 1344: STH_R	sth	%r27, [%r22 + %r0]
	.word 0xf235a123  ! 1346: STH_I	sth	%r25, [%r22 + 0x0123]
iob_intr_3_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_104), 16, 16)) -> intp(3, 0, 2e)
	.word 0xb12c6001  ! 1349: SLL_I	sll 	%r17, 0x0001, %r24
cpu_intr_3_105:
	setx	0x30217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b5a154  ! 1354: STHA_I	stha	%r24, [%r22 + 0x0154] %asi
	.word 0xfaa52111  ! 1356: STWA_I	stwa	%r29, [%r20 + 0x0111] %asi
iob_intr_3_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_105), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf2258000  ! 1359: STW_R	stw	%r25, [%r22 + %r0]
iob_intr_3_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_106), 16, 16)) -> intp(3, 0, 27)
cpu_intr_3_106:
	setx	0x270326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4f52021  ! 1366: STXA_I	stxa	%r26, [%r20 + 0x0021] %asi
iob_intr_3_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_107), 16, 16)) -> intp(3, 0, 29)
	.word 0xb6954000  ! 1368: ORcc_R	orcc 	%r21, %r0, %r27
iob_intr_3_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_108), 16, 16)) -> intp(3, 0, f)
	.word 0xb6340000  ! 1372: ORN_R	orn 	%r16, %r0, %r27
	.word 0xfaad4020  ! 1374: STBA_R	stba	%r29, [%r21 + %r0] 0x01
iob_intr_3_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_109), 16, 16)) -> intp(3, 0, 2c)
	.word 0xfa25c000  ! 1376: STW_R	stw	%r29, [%r23 + %r0]
T3_asi_reg_rd_58:
	mov	0x3c2, %r14
	.word 0xfedb8e60  ! 1378: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf02dc000  ! 1381: STB_R	stb	%r24, [%r23 + %r0]
	.word 0xb534d000  ! 1383: SRLX_R	srlx	%r19, %r0, %r26
	.word 0xf0a5e028  ! 1384: STWA_I	stwa	%r24, [%r23 + 0x0028] %asi
cpu_intr_3_107:
	setx	0x27020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_54:
	mov	0x28, %r14
	.word 0xf4f384a0  ! 1393: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T3_asi_reg_rd_59:
	mov	0x2f, %r14
	.word 0xf8db8e40  ! 1395: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfca42020  ! 1396: STWA_I	stwa	%r30, [%r16 + 0x0020] %asi
iob_intr_3_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_110), 16, 16)) -> intp(3, 0, 3)
cpu_intr_3_108:
	setx	0x240111, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_109:
	setx	0x250233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4758000  ! 1404: STX_R	stx	%r26, [%r22 + %r0]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_55:
	mov	0x2b, %r14
	.word 0xf2f389e0  ! 1411: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T3_asi_reg_wr_56:
	mov	0x3c2, %r14
	.word 0xfcf38e80  ! 1415: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T3_asi_reg_wr_57:
	mov	0x3c4, %r14
	.word 0xf2f38400  ! 1417: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_3_110:
	setx	0x28011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_58:
	mov	0x16, %r14
	.word 0xfcf38400  ! 1421: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_3_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_111), 16, 16)) -> intp(3, 0, b)
	.word 0xfc7460e6  ! 1423: STX_I	stx	%r30, [%r17 + 0x00e6]
cpu_intr_3_111:
	setx	0x280138, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_112:
	setx	0x290314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe35c000  ! 1432: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xf8748000  ! 1435: STX_R	stx	%r28, [%r18 + %r0]
	.word 0xfc75c000  ! 1436: STX_R	stx	%r30, [%r23 + %r0]
iob_intr_3_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_112), 16, 16)) -> intp(3, 0, 1)
	.word 0xfc35c000  ! 1441: STH_R	sth	%r30, [%r23 + %r0]
iob_intr_3_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_113), 16, 16)) -> intp(3, 0, a)
	.word 0xfc754000  ! 1447: STX_R	stx	%r30, [%r21 + %r0]
	.word 0xfa2ca11f  ! 1448: STB_I	stb	%r29, [%r18 + 0x011f]
	.word 0xf8b5206d  ! 1449: STHA_I	stha	%r28, [%r20 + 0x006d] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_59:
	mov	0xd, %r14
	.word 0xfcf38e60  ! 1455: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf2b4208d  ! 1456: STHA_I	stha	%r25, [%r16 + 0x008d] %asi
	.word 0xfc24a0a8  ! 1457: STW_I	stw	%r30, [%r18 + 0x00a8]
	.word 0xb550c000  ! 1458: RDPR_TT	rdpr	%tt, %r26
iob_intr_3_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_114), 16, 16)) -> intp(3, 0, 6)
	.word 0xfc74a1c6  ! 1460: STX_I	stx	%r30, [%r18 + 0x01c6]
	.word 0xf635e060  ! 1461: STH_I	sth	%r27, [%r23 + 0x0060]
iob_intr_3_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_115), 16, 16)) -> intp(3, 0, 30)
iob_intr_3_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_116), 16, 16)) -> intp(3, 0, d)
	.word 0xf2a56199  ! 1465: STWA_I	stwa	%r25, [%r21 + 0x0199] %asi
cpu_intr_3_113:
	setx	0x280003, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_117), 16, 16)) -> intp(3, 0, 35)
	.word 0xf8ad6155  ! 1468: STBA_I	stba	%r28, [%r21 + 0x0155] %asi
	.word 0xf4ac2123  ! 1470: STBA_I	stba	%r26, [%r16 + 0x0123] %asi
	.word 0xf6b44020  ! 1472: STHA_R	stha	%r27, [%r17 + %r0] 0x01
	.word 0xfea52009  ! 1473: STWA_I	stwa	%r31, [%r20 + 0x0009] %asi
	.word 0xb2b4613f  ! 1475: ORNcc_I	orncc 	%r17, 0x013f, %r25
iob_intr_3_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_118), 16, 16)) -> intp(3, 0, 23)
	.word 0xb53cf001  ! 1480: SRAX_I	srax	%r19, 0x0001, %r26
iob_intr_3_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_119), 16, 16)) -> intp(3, 0, 8)
	ta	T_CHANGE_HPRIV
cpu_intr_3_114:
	setx	0x280008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd343001  ! 1490: SRLX_I	srlx	%r16, 0x0001, %r30
cpu_intr_3_115:
	setx	0x2a023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab48020  ! 1492: STHA_R	stha	%r29, [%r18 + %r0] 0x01
	.word 0xf435c000  ! 1493: STH_R	sth	%r26, [%r23 + %r0]
	.word 0xfcb40020  ! 1497: STHA_R	stha	%r30, [%r16 + %r0] 0x01
T3_asi_reg_rd_60:
	mov	0x3c4, %r14
	.word 0xfadb8e40  ! 1498: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_3_116:
	setx	0x28031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12d0000  ! 1505: SLL_R	sll 	%r20, %r0, %r24
	.word 0xf0adc020  ! 1506: STBA_R	stba	%r24, [%r23 + %r0] 0x01
	.word 0xfa248000  ! 1508: STW_R	stw	%r29, [%r18 + %r0]
iob_intr_3_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_120), 16, 16)) -> intp(3, 0, 3e)
	.word 0xfef52088  ! 1514: STXA_I	stxa	%r31, [%r20 + 0x0088] %asi
	.word 0xb635614d  ! 1516: ORN_I	orn 	%r21, 0x014d, %r27
iob_intr_3_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_121), 16, 16)) -> intp(3, 0, a)
cpu_intr_3_117:
	setx	0x28030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_61:
	mov	0x18, %r14
	.word 0xf8db89e0  ! 1521: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_3_118:
	setx	0x2a0129, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_122), 16, 16)) -> intp(3, 0, 3c)
iob_intr_3_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_123), 16, 16)) -> intp(3, 0, 31)
T3_asi_reg_rd_62:
	mov	0x3c8, %r14
	.word 0xf6db8e80  ! 1535: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	ta	T_CHANGE_NONHPRIV
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
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_119:
	setx	0x2a0312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6aca1bf  ! 1553: STBA_I	stba	%r27, [%r18 + 0x01bf] %asi
	.word 0xf0a5c020  ! 1555: STWA_R	stwa	%r24, [%r23 + %r0] 0x01
	.word 0xf6a42139  ! 1562: STWA_I	stwa	%r27, [%r16 + 0x0139] %asi
iob_intr_3_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_124), 16, 16)) -> intp(3, 0, 2)
	.word 0xf435c000  ! 1564: STH_R	sth	%r26, [%r23 + %r0]
	.word 0xf2ad205b  ! 1566: STBA_I	stba	%r25, [%r20 + 0x005b] %asi
	.word 0xf82dc000  ! 1567: STB_R	stb	%r28, [%r23 + %r0]
iob_intr_3_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_125), 16, 16)) -> intp(3, 0, 11)
	.word 0xb4958000  ! 1570: ORcc_R	orcc 	%r22, %r0, %r26
	.word 0xf6a4c020  ! 1571: STWA_R	stwa	%r27, [%r19 + %r0] 0x01
T3_asi_reg_rd_63:
	mov	0x1a, %r14
	.word 0xf8db8e60  ! 1573: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T3_asi_reg_wr_60:
	mov	0x15, %r14
	.word 0xf0f38400  ! 1579: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf275e0ba  ! 1580: STX_I	stx	%r25, [%r23 + 0x00ba]
cpu_intr_3_120:
	setx	0x2b0325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8f4a13c  ! 1582: STXA_I	stxa	%r28, [%r18 + 0x013c] %asi
iob_intr_3_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_126), 16, 16)) -> intp(3, 0, 24)
T3_asi_reg_rd_64:
	mov	0x1d, %r14
	.word 0xf4db89e0  ! 1585: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf475c000  ! 1587: STX_R	stx	%r26, [%r23 + %r0]
	.word 0xf22d61c0  ! 1588: STB_I	stb	%r25, [%r21 + 0x01c0]
	.word 0xbca52102  ! 1591: SUBcc_I	subcc 	%r20, 0x0102, %r30
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982a80  ! 1593: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a80, %hpstate
T3_asi_reg_wr_61:
	mov	0x29, %r14
	.word 0xfcf389e0  ! 1595: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xfcada006  ! 1596: STBA_I	stba	%r30, [%r22 + 0x0006] %asi
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982b58  ! 1597: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b58, %hpstate
T3_asi_reg_wr_62:
	mov	0x2d, %r14
	.word 0xf0f38e80  ! 1598: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb63520f9  ! 1599: SUBC_I	orn 	%r20, 0x00f9, %r27
	.word 0xf0754000  ! 1600: STX_R	stx	%r24, [%r21 + %r0]
	.word 0xfe256179  ! 1601: STW_I	stw	%r31, [%r21 + 0x0179]
	.word 0xf875c000  ! 1602: STX_R	stx	%r28, [%r23 + %r0]
	.word 0xb8bde1cd  ! 1603: XNORcc_I	xnorcc 	%r23, 0x01cd, %r28
T3_asi_reg_wr_63:
	mov	0x3c3, %r14
	.word 0xf2f38400  ! 1604: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T3_asi_reg_rd_65:
	mov	0x12, %r14
	.word 0xfcdb8e40  ! 1605: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_3_121:
	setx	0x2b0010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfead8020  ! 1610: STBA_R	stba	%r31, [%r22 + %r0] 0x01
T3_asi_reg_rd_66:
	mov	0x23, %r14
	.word 0xfcdb84a0  ! 1614: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_3_122:
	setx	0x2a0304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6a50000  ! 1621: SUBcc_R	subcc 	%r20, %r0, %r27
	.word 0xf6ac8020  ! 1622: STBA_R	stba	%r27, [%r18 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
	.word 0xb73d0000  ! 1626: SRA_R	sra 	%r20, %r0, %r27
	ta	T_CHANGE_TO_TL0
	.word 0x8794e0e9  ! 1629: WRPR_TT_I	wrpr	%r19, 0x00e9, %tt
T3_asi_reg_rd_67:
	mov	0x3c0, %r14
	.word 0xf0db8e40  ! 1632: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_3_123:
	setx	0x10100, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983818  ! 1637: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1818, %hpstate
cpu_intr_3_124:
	setx	0x2a0313, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_127), 16, 16)) -> intp(3, 0, 0)
	.word 0xf2a421cd  ! 1642: STWA_I	stwa	%r25, [%r16 + 0x01cd] %asi
	.word 0xf2a5a0fa  ! 1643: STWA_I	stwa	%r25, [%r22 + 0x00fa] %asi
iob_intr_3_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_128), 16, 16)) -> intp(3, 0, 28)
iob_intr_3_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_129), 16, 16)) -> intp(3, 0, 2)
	.word 0xf42d60bd  ! 1646: STB_I	stb	%r26, [%r21 + 0x00bd]
T3_asi_reg_rd_68:
	mov	0x31, %r14
	.word 0xf6db8e60  ! 1647: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf8a561c2  ! 1648: STWA_I	stwa	%r28, [%r21 + 0x01c2] %asi
T3_asi_reg_rd_69:
	mov	0x1e, %r14
	.word 0xf6db8e80  ! 1649: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_3_125:
	setx	0x280212, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_70:
	mov	0x1d, %r14
	.word 0xf4db89e0  ! 1652: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf8ad8020  ! 1653: STBA_R	stba	%r28, [%r22 + %r0] 0x01
	.word 0xf025a07b  ! 1654: STW_I	stw	%r24, [%r22 + 0x007b]
	.word 0xba8ca0a2  ! 1655: ANDcc_I	andcc 	%r18, 0x00a2, %r29
cpu_intr_3_126:
	setx	0x280035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_127:
	setx	0x290305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a54020  ! 1663: STWA_R	stwa	%r28, [%r21 + %r0] 0x01
	.word 0xfe250000  ! 1664: STW_R	stw	%r31, [%r20 + %r0]
	.word 0xfaa4602a  ! 1666: STWA_I	stwa	%r29, [%r17 + 0x002a] %asi
	.word 0xfc75a015  ! 1667: STX_I	stx	%r30, [%r22 + 0x0015]
	.word 0xfc248000  ! 1670: STW_R	stw	%r30, [%r18 + %r0]
	.word 0xb21d8000  ! 1671: XOR_R	xor 	%r22, %r0, %r25
cpu_intr_3_128:
	setx	0x2b0118, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_130), 16, 16)) -> intp(3, 0, 26)
	.word 0xf62d20ba  ! 1674: STB_I	stb	%r27, [%r20 + 0x00ba]
	.word 0xb08c0000  ! 1676: ANDcc_R	andcc 	%r16, %r0, %r24
cpu_intr_3_129:
	setx	0x2b002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc25c000  ! 1678: STW_R	stw	%r30, [%r23 + %r0]
cpu_intr_3_130:
	setx	0x290309, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_71:
	mov	0x3c1, %r14
	.word 0xf4db89e0  ! 1682: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
	.word 0xfe240000  ! 1692: STW_R	stw	%r31, [%r16 + %r0]
T3_asi_reg_rd_72:
	mov	0x3c7, %r14
	.word 0xf4db8e40  ! 1694: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfeb420bf  ! 1696: STHA_I	stha	%r31, [%r16 + 0x00bf] %asi
	.word 0xfc344000  ! 1699: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xf2f46188  ! 1702: STXA_I	stxa	%r25, [%r17 + 0x0188] %asi
iob_intr_3_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_131), 16, 16)) -> intp(3, 0, 7)
	.word 0xb2150000  ! 1705: OR_R	or 	%r20, %r0, %r25
iob_intr_3_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_132), 16, 16)) -> intp(3, 0, 3d)
cpu_intr_3_131:
	setx	0x280138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf34a001  ! 1712: SRL_I	srl 	%r18, 0x0001, %r31
iob_intr_3_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_133), 16, 16)) -> intp(3, 0, a)
T3_asi_reg_rd_73:
	mov	0x3c4, %r14
	.word 0xf2db8e60  ! 1720: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_3_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_134), 16, 16)) -> intp(3, 0, 23)
	.word 0xf8a4c020  ! 1722: STWA_R	stwa	%r28, [%r19 + %r0] 0x01
	.word 0xf8b54020  ! 1732: STHA_R	stha	%r28, [%r21 + %r0] 0x01
T3_asi_reg_rd_74:
	mov	0x1, %r14
	.word 0xfadb8e60  ! 1734: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xfc75a169  ! 1738: STX_I	stx	%r30, [%r22 + 0x0169]
	.word 0xf42c4000  ! 1740: STB_R	stb	%r26, [%r17 + %r0]
iob_intr_3_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_135), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_wr_64:
	mov	0x1c, %r14
	.word 0xf0f38400  ! 1743: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf6ace1bd  ! 1744: STBA_I	stba	%r27, [%r19 + 0x01bd] %asi
	.word 0xf2358000  ! 1745: STH_R	sth	%r25, [%r22 + %r0]
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982c5a  ! 1748: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c5a, %hpstate
	.word 0xb42d8000  ! 1751: ANDN_R	andn 	%r22, %r0, %r26
	.word 0xf075205a  ! 1753: STX_I	stx	%r24, [%r20 + 0x005a]
	.word 0xb20d0000  ! 1755: AND_R	and 	%r20, %r0, %r25
iob_intr_3_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_136), 16, 16)) -> intp(3, 0, 3e)
T3_asi_reg_rd_75:
	mov	0x27, %r14
	.word 0xf6db8e60  ! 1760: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_3_132:
	setx	0x290112, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_137), 16, 16)) -> intp(3, 0, 3a)
	.word 0xbea44000  ! 1765: SUBcc_R	subcc 	%r17, %r0, %r31
	.word 0xbcad619c  ! 1767: ANDNcc_I	andncc 	%r21, 0x019c, %r30
	.word 0xb52c2001  ! 1768: SLL_I	sll 	%r16, 0x0001, %r26
	.word 0xfab4e1ec  ! 1771: STHA_I	stha	%r29, [%r19 + 0x01ec] %asi
	.word 0x85946073  ! 1775: WRPR_TSTATE_I	wrpr	%r17, 0x0073, %tstate
	.word 0xf8b54020  ! 1776: STHA_R	stha	%r28, [%r21 + %r0] 0x01
T3_asi_reg_rd_76:
	mov	0x1c, %r14
	.word 0xf6db8e40  ! 1778: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_wr_65:
	mov	0x38, %r14
	.word 0xf2f38e40  ! 1779: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf8ad4020  ! 1780: STBA_R	stba	%r28, [%r21 + %r0] 0x01
	.word 0xf4250000  ! 1781: STW_R	stw	%r26, [%r20 + %r0]
T3_asi_reg_wr_66:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 1783: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb5643801  ! 1787: MOVcc_I	<illegal instruction>
	.word 0xf2a54020  ! 1789: STWA_R	stwa	%r25, [%r21 + %r0] 0x01
iob_intr_3_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_138), 16, 16)) -> intp(3, 0, 4)
	.word 0x8594a0f9  ! 1791: WRPR_TSTATE_I	wrpr	%r18, 0x00f9, %tstate
	.word 0xfa2c608e  ! 1795: STB_I	stb	%r29, [%r17 + 0x008e]
	.word 0xfaad8020  ! 1796: STBA_R	stba	%r29, [%r22 + %r0] 0x01
iob_intr_3_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_139), 16, 16)) -> intp(3, 0, 2a)
cpu_intr_3_133:
	setx	0x290300, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_67:
	mov	0x3c0, %r14
	.word 0xf6f38e80  ! 1799: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xfe34a1b3  ! 1800: STH_I	sth	%r31, [%r18 + 0x01b3]
	.word 0xfc34a029  ! 1802: STH_I	sth	%r30, [%r18 + 0x0029]
	.word 0xfcb54020  ! 1804: STHA_R	stha	%r30, [%r21 + %r0] 0x01
T3_asi_reg_rd_77:
	mov	0x3c4, %r14
	.word 0xf8db8e80  ! 1808: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_3_134:
	setx	0x2b0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2c2132  ! 1811: STB_I	stb	%r30, [%r16 + 0x0132]
cpu_intr_3_135:
	setx	0x29031d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_140), 16, 16)) -> intp(3, 0, 2b)
	.word 0xbea52195  ! 1817: SUBcc_I	subcc 	%r20, 0x0195, %r31
	.word 0xb4c4e068  ! 1822: ADDCcc_I	addccc 	%r19, 0x0068, %r26
cpu_intr_3_136:
	setx	0x2b0224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfead0020  ! 1824: STBA_R	stba	%r31, [%r20 + %r0] 0x01
	.word 0xf22ca056  ! 1825: STB_I	stb	%r25, [%r18 + 0x0056]
	.word 0xfaacc020  ! 1828: STBA_R	stba	%r29, [%r19 + %r0] 0x01
	.word 0xfa348000  ! 1830: STH_R	sth	%r29, [%r18 + %r0]
	.word 0xfaad4020  ! 1831: STBA_R	stba	%r29, [%r21 + %r0] 0x01
	.word 0xfeb58020  ! 1833: STHA_R	stha	%r31, [%r22 + %r0] 0x01
	.word 0xfa244000  ! 1840: STW_R	stw	%r29, [%r17 + %r0]
T3_asi_reg_wr_68:
	mov	0x2f, %r14
	.word 0xf2f389e0  ! 1842: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_3_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_141), 16, 16)) -> intp(3, 0, 7)
iob_intr_3_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_142), 16, 16)) -> intp(3, 0, 25)
	.word 0xfeb44020  ! 1849: STHA_R	stha	%r31, [%r17 + %r0] 0x01
	.word 0xf62c8000  ! 1851: STB_R	stb	%r27, [%r18 + %r0]
iob_intr_3_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_143), 16, 16)) -> intp(3, 0, 10)
	.word 0xfe340000  ! 1855: STH_R	sth	%r31, [%r16 + %r0]
iob_intr_3_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_144), 16, 16)) -> intp(3, 0, 8)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfaa5a19c  ! 1860: STWA_I	stwa	%r29, [%r22 + 0x019c] %asi
iob_intr_3_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_145), 16, 16)) -> intp(3, 0, 4)
iob_intr_3_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_146), 16, 16)) -> intp(3, 0, 29)
	.word 0xf4750000  ! 1863: STX_R	stx	%r26, [%r20 + %r0]
	.word 0xf624a1b9  ! 1864: STW_I	stw	%r27, [%r18 + 0x01b9]
cpu_intr_3_137:
	setx	0x2f0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb7d6401  ! 1867: MOVR_I	movre	%r21, 0x1, %r29
	ta	T_CHANGE_NONHPRIV
	.word 0xf8258000  ! 1871: STW_R	stw	%r28, [%r22 + %r0]
T3_asi_reg_wr_69:
	mov	0x3c2, %r14
	.word 0xf2f389e0  ! 1873: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_3_138:
	setx	0x2f022b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_147), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_148), 16, 16)) -> intp(3, 0, 32)
iob_intr_3_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_149), 16, 16)) -> intp(3, 0, 8)
	.word 0xf0f42194  ! 1888: STXA_I	stxa	%r24, [%r16 + 0x0194] %asi
iob_intr_3_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_150), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_wr_70:
	mov	0xa, %r14
	.word 0xf0f389e0  ! 1893: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_3_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_151), 16, 16)) -> intp(3, 0, 7)
	.word 0xfcf5a056  ! 1896: STXA_I	stxa	%r30, [%r22 + 0x0056] %asi
T3_asi_reg_wr_71:
	mov	0x3c6, %r14
	.word 0xf0f38e40  ! 1898: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_139:
	setx	0x2c0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_3_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_152), 16, 16)) -> intp(3, 0, 30)
	.word 0xba244000  ! 1905: SUB_R	sub 	%r17, %r0, %r29
T3_asi_reg_wr_72:
	mov	0x3c3, %r14
	.word 0xf2f38400  ! 1908: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xfcb54020  ! 1909: STHA_R	stha	%r30, [%r21 + %r0] 0x01
	.word 0xf4a560ed  ! 1910: STWA_I	stwa	%r26, [%r21 + 0x00ed] %asi
T3_asi_reg_wr_73:
	mov	0x3c4, %r14
	.word 0xfef389e0  ! 1912: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbe2ce189  ! 1915: ANDN_I	andn 	%r19, 0x0189, %r31
	.word 0xf675a103  ! 1919: STX_I	stx	%r27, [%r22 + 0x0103]
iob_intr_3_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_153), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf4a5c020  ! 1921: STWA_R	stwa	%r26, [%r23 + %r0] 0x01
T3_asi_reg_wr_74:
	mov	0x21, %r14
	.word 0xf2f38400  ! 1922: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983852  ! 1924: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1852, %hpstate
	.word 0xba8c208f  ! 1925: ANDcc_I	andcc 	%r16, 0x008f, %r29
T3_asi_reg_rd_78:
	mov	0x1a, %r14
	.word 0xf2db89e0  ! 1926: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xf83421fb  ! 1927: STH_I	sth	%r28, [%r16 + 0x01fb]
T3_asi_reg_wr_75:
	mov	0x3c3, %r14
	.word 0xf4f38e80  ! 1928: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf435a0ae  ! 1930: STH_I	sth	%r26, [%r22 + 0x00ae]
cpu_intr_3_140:
	setx	0x2d013a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_141:
	setx	0x2e003a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_142:
	setx	0x2e0210, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_143:
	setx	0x2c0129, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_154), 16, 16)) -> intp(3, 0, 1b)
T3_asi_reg_wr_76:
	mov	0x3c5, %r14
	.word 0xf2f38e60  ! 1943: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_3_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_155), 16, 16)) -> intp(3, 0, e)
	.word 0xf274a1f3  ! 1951: STX_I	stx	%r25, [%r18 + 0x01f3]
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983ada  ! 1952: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ada, %hpstate
	.word 0xb3520000  ! 1953: RDPR_PIL	rdpr	%pil, %r25
	.word 0xfcb54020  ! 1956: STHA_R	stha	%r30, [%r21 + %r0] 0x01
	.word 0xf024a11f  ! 1957: STW_I	stw	%r24, [%r18 + 0x011f]
T3_asi_reg_wr_77:
	mov	0x3c2, %r14
	.word 0xfcf38e40  ! 1958: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_144:
	setx	0x2f033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a5a075  ! 1962: STWA_I	stwa	%r28, [%r22 + 0x0075] %asi
cpu_intr_3_145:
	setx	0x2c0314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6f561be  ! 1966: STXA_I	stxa	%r27, [%r21 + 0x01be] %asi
T3_asi_reg_wr_78:
	mov	0x2b, %r14
	.word 0xfaf389e0  ! 1967: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_3_146:
	setx	0x2c0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4f4e087  ! 1978: STXA_I	stxa	%r26, [%r19 + 0x0087] %asi
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982dda  ! 1979: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dda, %hpstate
cpu_intr_3_147:
	setx	0x2e001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4248000  ! 1982: STW_R	stw	%r26, [%r18 + %r0]
	.word 0xbc8461e0  ! 1985: ADDcc_I	addcc 	%r17, 0x01e0, %r30
	.word 0xfca560e6  ! 1986: STWA_I	stwa	%r30, [%r21 + 0x00e6] %asi
	.word 0xfaa5604d  ! 1989: STWA_I	stwa	%r29, [%r21 + 0x004d] %asi
T3_asi_reg_rd_79:
	mov	0x1b, %r14
	.word 0xf6db8e40  ! 1991: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_3_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_156), 16, 16)) -> intp(3, 0, a)
iob_intr_3_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_157), 16, 16)) -> intp(3, 0, 4)
	.word 0xb005a108  ! 1996: ADD_I	add 	%r22, 0x0108, %r24
cpu_intr_3_148:
	setx	0x2f0334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b52010  ! 2000: STHA_I	stha	%r27, [%r20 + 0x0010] %asi
	.word 0xf224a0af  ! 2001: STW_I	stw	%r25, [%r18 + 0x00af]
	.word 0xbb34c000  ! 2003: SRL_R	srl 	%r19, %r0, %r29
	.word 0xb8bdc000  ! 2005: XNORcc_R	xnorcc 	%r23, %r0, %r28
iob_intr_3_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_158), 16, 16)) -> intp(3, 0, 3c)
iob_intr_3_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_159), 16, 16)) -> intp(3, 0, 16)
T3_asi_reg_wr_79:
	mov	0x38, %r14
	.word 0xf6f38e80  ! 2015: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T3_asi_reg_rd_80:
	mov	0x3c8, %r14
	.word 0xfedb89e0  ! 2016: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983ed8  ! 2020: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ed8, %hpstate
	.word 0xf2f5a0f5  ! 2021: STXA_I	stxa	%r25, [%r22 + 0x00f5] %asi
	.word 0xfa2d6089  ! 2022: STB_I	stb	%r29, [%r21 + 0x0089]
	.word 0xfca48020  ! 2024: STWA_R	stwa	%r30, [%r18 + %r0] 0x01
	.word 0xf6a48020  ! 2025: STWA_R	stwa	%r27, [%r18 + %r0] 0x01
iob_intr_3_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_160), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_rd_81:
	mov	0x2, %r14
	.word 0xf8db89e0  ! 2029: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf074e0f6  ! 2030: STX_I	stx	%r24, [%r19 + 0x00f6]
iob_intr_3_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_161), 16, 16)) -> intp(3, 0, 2b)
	.word 0xfe254000  ! 2033: STW_R	stw	%r31, [%r21 + %r0]
cpu_intr_3_149:
	setx	0x2e0323, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_150:
	setx	0x2f0015, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_151:
	setx	0x2f0228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb341000  ! 2040: SRLX_R	srlx	%r16, %r0, %r29
cpu_intr_3_152:
	setx	0x2c0117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9643801  ! 2043: MOVcc_I	<illegal instruction>
	.word 0xfaf56096  ! 2044: STXA_I	stxa	%r29, [%r21 + 0x0096] %asi
	.word 0xf2ad0020  ! 2045: STBA_R	stba	%r25, [%r20 + %r0] 0x01
	.word 0xbcb44000  ! 2046: SUBCcc_R	orncc 	%r17, %r0, %r30
	.word 0xf4b4604e  ! 2047: STHA_I	stha	%r26, [%r17 + 0x004e] %asi
T3_asi_reg_rd_82:
	mov	0x12, %r14
	.word 0xfcdb8e60  ! 2050: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_3_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_162), 16, 16)) -> intp(3, 0, 3f)
iob_intr_3_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_163), 16, 16)) -> intp(3, 0, 1a)
	.word 0xb7643801  ! 2056: MOVcc_I	<illegal instruction>
	ta	T_CHANGE_NONHPRIV
	.word 0xfc2461b6  ! 2062: STW_I	stw	%r30, [%r17 + 0x01b6]
iob_intr_3_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_164), 16, 16)) -> intp(3, 0, e)
iob_intr_3_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_165), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf6b4e077  ! 2069: STHA_I	stha	%r27, [%r19 + 0x0077] %asi
	.word 0xf834c000  ! 2071: STH_R	sth	%r28, [%r19 + %r0]
iob_intr_3_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_166), 16, 16)) -> intp(3, 0, 23)
cpu_intr_3_153:
	setx	0x2e0122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b5c020  ! 2077: STHA_R	stha	%r25, [%r23 + %r0] 0x01
	.word 0xfe2c4000  ! 2079: STB_R	stb	%r31, [%r17 + %r0]
cpu_intr_3_154:
	setx	0x2e000e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_155:
	setx	0x2f0208, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_167), 16, 16)) -> intp(3, 0, 25)
T3_asi_reg_wr_80:
	mov	0xb, %r14
	.word 0xf0f38e40  ! 2087: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf6f42010  ! 2089: STXA_I	stxa	%r27, [%r16 + 0x0010] %asi
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_168), 16, 16)) -> intp(3, 0, 26)
iob_intr_3_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_169), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf2f46157  ! 2097: STXA_I	stxa	%r25, [%r17 + 0x0157] %asi
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982f00  ! 2098: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f00, %hpstate
	.word 0xf0a54020  ! 2099: STWA_R	stwa	%r24, [%r21 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
iob_intr_3_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_170), 16, 16)) -> intp(3, 0, 34)
	.word 0xbe2420c0  ! 2102: SUB_I	sub 	%r16, 0x00c0, %r31
T3_asi_reg_wr_81:
	mov	0x3c3, %r14
	.word 0xf2f389e0  ! 2105: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb8adc000  ! 2106: ANDNcc_R	andncc 	%r23, %r0, %r28
	.word 0xf234a143  ! 2107: STH_I	sth	%r25, [%r18 + 0x0143]
	.word 0xfa344000  ! 2110: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xfeada178  ! 2111: STBA_I	stba	%r31, [%r22 + 0x0178] %asi
T3_asi_reg_rd_83:
	mov	0x3c7, %r14
	.word 0xfedb8e60  ! 2115: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T3_asi_reg_wr_82:
	mov	0x4, %r14
	.word 0xf8f38400  ! 2116: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf4a561c8  ! 2117: STWA_I	stwa	%r26, [%r21 + 0x01c8] %asi
T3_asi_reg_rd_84:
	mov	0x3c0, %r14
	.word 0xf2db8e40  ! 2118: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfca56082  ! 2121: STWA_I	stwa	%r30, [%r21 + 0x0082] %asi
cpu_intr_3_156:
	setx	0x2e0304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62ca049  ! 2123: STB_I	stb	%r27, [%r18 + 0x0049]
iob_intr_3_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_171), 16, 16)) -> intp(3, 0, 11)
T3_asi_reg_rd_85:
	mov	0x25, %r14
	.word 0xfcdb8400  ! 2125: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_3_157:
	setx	0x2d0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_172), 16, 16)) -> intp(3, 0, 21)
	.word 0xf82560b8  ! 2135: STW_I	stw	%r28, [%r21 + 0x00b8]
cpu_intr_3_158:
	setx	0x2f0026, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_159:
	setx	0x2f0225, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_173), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_wr_83:
	mov	0xf, %r14
	.word 0xf2f38e40  ! 2143: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb4844000  ! 2145: ADDcc_R	addcc 	%r17, %r0, %r26
iob_intr_3_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_174), 16, 16)) -> intp(3, 0, 1f)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8f902000  ! 2157: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xfeb560e6  ! 2162: STHA_I	stha	%r31, [%r21 + 0x00e6] %asi
	.word 0xf4b5c020  ! 2163: STHA_R	stha	%r26, [%r23 + %r0] 0x01
	.word 0xf4a5209f  ! 2166: STWA_I	stwa	%r26, [%r20 + 0x009f] %asi
cpu_intr_3_160:
	setx	0x2f0200, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_84:
	mov	0x18, %r14
	.word 0xf4f38e40  ! 2170: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfef4e1ae  ! 2172: STXA_I	stxa	%r31, [%r19 + 0x01ae] %asi
T3_asi_reg_wr_85:
	mov	0x12, %r14
	.word 0xf2f38e80  ! 2173: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf8ade0e4  ! 2174: STBA_I	stba	%r28, [%r23 + 0x00e4] %asi
T3_asi_reg_rd_86:
	mov	0x1f, %r14
	.word 0xf8db8e60  ! 2175: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_3_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_175), 16, 16)) -> intp(3, 0, 24)
cpu_intr_3_161:
	setx	0x2d0025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf225c000  ! 2182: STW_R	stw	%r25, [%r23 + %r0]
T3_asi_reg_wr_86:
	mov	0xb, %r14
	.word 0xf6f38e80  ! 2183: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_3_162:
	setx	0x2d0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_176), 16, 16)) -> intp(3, 0, 2f)
	ta	T_CHANGE_TO_TL0
	.word 0xf8748000  ! 2192: STX_R	stx	%r28, [%r18 + %r0]
cpu_intr_3_163:
	setx	0x2c001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf675e0d3  ! 2196: STX_I	stx	%r27, [%r23 + 0x00d3]
	.word 0xf62421f7  ! 2198: STW_I	stw	%r27, [%r16 + 0x01f7]
	.word 0xb93d8000  ! 2199: SRA_R	sra 	%r22, %r0, %r28
	.word 0xf02c20b1  ! 2202: STB_I	stb	%r24, [%r16 + 0x00b1]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb08d4000  ! 2205: ANDcc_R	andcc 	%r21, %r0, %r24
	.word 0xbe35c000  ! 2206: ORN_R	orn 	%r23, %r0, %r31
	.word 0xb2bd8000  ! 2209: XNORcc_R	xnorcc 	%r22, %r0, %r25
	.word 0xf2aca153  ! 2211: STBA_I	stba	%r25, [%r18 + 0x0153] %asi
T3_asi_reg_rd_87:
	mov	0x34, %r14
	.word 0xf2db8400  ! 2213: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_3_164:
	setx	0x2f0000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3d1000  ! 2215: SRAX_R	srax	%r20, %r0, %r31
T3_asi_reg_rd_88:
	mov	0x25, %r14
	.word 0xf0db84a0  ! 2218: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb42dc000  ! 2220: ANDN_R	andn 	%r23, %r0, %r26
	.word 0xf8f5a143  ! 2221: STXA_I	stxa	%r28, [%r22 + 0x0143] %asi
iob_intr_3_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_177), 16, 16)) -> intp(3, 0, a)
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982a50  ! 2225: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a50, %hpstate
iob_intr_3_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_178), 16, 16)) -> intp(3, 0, f)
cpu_intr_3_165:
	setx	0x2e0233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2d61df  ! 2228: STB_I	stb	%r29, [%r21 + 0x01df]
iob_intr_3_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_179), 16, 16)) -> intp(3, 0, 3b)
	.word 0xbe9ce1e0  ! 2233: XORcc_I	xorcc 	%r19, 0x01e0, %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xfea4e0ad  ! 2241: STWA_I	stwa	%r31, [%r19 + 0x00ad] %asi
iob_intr_3_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_180), 16, 16)) -> intp(3, 0, b)
iob_intr_3_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_181), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf42421d4  ! 2247: STW_I	stw	%r26, [%r16 + 0x01d4]
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982d50  ! 2248: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d50, %hpstate
	.word 0xfc748000  ! 2249: STX_R	stx	%r30, [%r18 + %r0]
cpu_intr_3_166:
	setx	0x2f0130, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_167:
	setx	0x2d0134, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_89:
	mov	0x29, %r14
	.word 0xfadb8400  ! 2261: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T3_asi_reg_rd_90:
	mov	0x3c5, %r14
	.word 0xf2db8e40  ! 2264: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbc85c000  ! 2268: ADDcc_R	addcc 	%r23, %r0, %r30
	.word 0xf42561f9  ! 2269: STW_I	stw	%r26, [%r21 + 0x01f9]
	.word 0xfcacc020  ! 2270: STBA_R	stba	%r30, [%r19 + %r0] 0x01
	.word 0xfcb44020  ! 2271: STHA_R	stha	%r30, [%r17 + %r0] 0x01
	.word 0xb9641800  ! 2273: MOVcc_R	<illegal instruction>
T3_asi_reg_rd_91:
	mov	0x3c7, %r14
	.word 0xfadb8e40  ! 2274: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_3_168:
	setx	0x2f0005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4750000  ! 2276: STX_R	stx	%r26, [%r20 + %r0]
cpu_intr_3_169:
	setx	0x2d010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_87:
	mov	0x5, %r14
	.word 0xfcf38e80  ! 2281: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xfa342007  ! 2283: STH_I	sth	%r29, [%r16 + 0x0007]
cpu_intr_3_170:
	setx	0x2f0125, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_182), 16, 16)) -> intp(3, 0, 4)
	.word 0xf87560ad  ! 2286: STX_I	stx	%r28, [%r21 + 0x00ad]
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982802  ! 2287: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0802, %hpstate
iob_intr_3_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_183), 16, 16)) -> intp(3, 0, 20)
T3_asi_reg_rd_92:
	mov	0x3c7, %r14
	.word 0xfedb8e40  ! 2290: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_3_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_184), 16, 16)) -> intp(3, 0, 18)
T3_asi_reg_rd_93:
	mov	0x1a, %r14
	.word 0xf0db8e40  ! 2293: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfaaca1da  ! 2297: STBA_I	stba	%r29, [%r18 + 0x01da] %asi
	.word 0xf82ca165  ! 2300: STB_I	stb	%r28, [%r18 + 0x0165]
	.word 0xf2a42014  ! 2301: STWA_I	stwa	%r25, [%r16 + 0x0014] %asi
T3_asi_reg_wr_88:
	mov	0x3c8, %r14
	.word 0xf6f384a0  ! 2302: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf6b4a0e0  ! 2303: STHA_I	stha	%r27, [%r18 + 0x00e0] %asi
	.word 0xb4ad8000  ! 2304: ANDNcc_R	andncc 	%r22, %r0, %r26
	.word 0xfead61e2  ! 2305: STBA_I	stba	%r31, [%r21 + 0x01e2] %asi
cpu_intr_3_171:
	setx	0x2f0211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf675e002  ! 2309: STX_I	stx	%r27, [%r23 + 0x0002]
	.word 0xb89d8000  ! 2312: XORcc_R	xorcc 	%r22, %r0, %r28
	.word 0xf4a5a199  ! 2313: STWA_I	stwa	%r26, [%r22 + 0x0199] %asi
	.word 0xb805e040  ! 2314: ADD_I	add 	%r23, 0x0040, %r28
	.word 0xbe0de1fa  ! 2315: AND_I	and 	%r23, 0x01fa, %r31
cpu_intr_3_172:
	setx	0x31003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4b4c000  ! 2319: SUBCcc_R	orncc 	%r19, %r0, %r26
iob_intr_3_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_185), 16, 16)) -> intp(3, 0, 2c)
	.word 0xfcb5610f  ! 2321: STHA_I	stha	%r30, [%r21 + 0x010f] %asi
	.word 0xfa2d8000  ! 2324: STB_R	stb	%r29, [%r22 + %r0]
T3_asi_reg_wr_89:
	mov	0x6, %r14
	.word 0xf2f38e40  ! 2327: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_186), 16, 16)) -> intp(3, 0, e)
	.word 0xf42dc000  ! 2329: STB_R	stb	%r26, [%r23 + %r0]
	.word 0xf2a4e195  ! 2331: STWA_I	stwa	%r25, [%r19 + 0x0195] %asi
T3_asi_reg_rd_94:
	mov	0x35, %r14
	.word 0xf8db8e40  ! 2334: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb93c9000  ! 2335: SRAX_R	srax	%r18, %r0, %r28
iob_intr_3_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_187), 16, 16)) -> intp(3, 0, 2b)
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983b50  ! 2340: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b50, %hpstate
iob_intr_3_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_188), 16, 16)) -> intp(3, 0, 7)
	.word 0xb61de02e  ! 2342: XOR_I	xor 	%r23, 0x002e, %r27
	.word 0xf625c000  ! 2343: STW_R	stw	%r27, [%r23 + %r0]
iob_intr_3_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_189), 16, 16)) -> intp(3, 0, 1d)
T3_asi_reg_wr_90:
	mov	0x29, %r14
	.word 0xf4f389e0  ! 2345: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfcade0d8  ! 2347: STBA_I	stba	%r30, [%r23 + 0x00d8] %asi
iob_intr_3_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_190), 16, 16)) -> intp(3, 0, 1f)
iob_intr_3_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_191), 16, 16)) -> intp(3, 0, 28)
	.word 0xf0740000  ! 2350: STX_R	stx	%r24, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_173:
	setx	0x32000d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_91:
	mov	0x3c6, %r14
	.word 0xfef389e0  ! 2357: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf2742100  ! 2358: STX_I	stx	%r25, [%r16 + 0x0100]
iob_intr_3_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_192), 16, 16)) -> intp(3, 0, 11)
	.word 0xfcf520c1  ! 2362: STXA_I	stxa	%r30, [%r20 + 0x00c1] %asi
T3_asi_reg_wr_92:
	mov	0x3c0, %r14
	.word 0xf4f389e0  ! 2363: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf8340000  ! 2366: STH_R	sth	%r28, [%r16 + %r0]
	.word 0xfc24a018  ! 2368: STW_I	stw	%r30, [%r18 + 0x0018]
iob_intr_3_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_193), 16, 16)) -> intp(3, 0, 3d)
cpu_intr_3_174:
	setx	0x310214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf83421b7  ! 2372: STH_I	sth	%r28, [%r16 + 0x01b7]
T3_asi_reg_wr_93:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 2373: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb884a007  ! 2375: ADDcc_I	addcc 	%r18, 0x0007, %r28
cpu_intr_3_175:
	setx	0x310134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9348000  ! 2377: SRL_R	srl 	%r18, %r0, %r28
T3_asi_reg_wr_94:
	mov	0x20, %r14
	.word 0xfcf38400  ! 2378: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T3_asi_reg_wr_95:
	mov	0x3c3, %r14
	.word 0xfaf389e0  ! 2379: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf2b58020  ! 2380: STHA_R	stha	%r25, [%r22 + %r0] 0x01
	.word 0xbc350000  ! 2384: ORN_R	orn 	%r20, %r0, %r30
iob_intr_3_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_194), 16, 16)) -> intp(3, 0, 23)
cpu_intr_3_176:
	setx	0x30012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2bc8000  ! 2390: XNORcc_R	xnorcc 	%r18, %r0, %r25
	.word 0xb12d0000  ! 2391: SLL_R	sll 	%r20, %r0, %r24
	.word 0xf8342036  ! 2395: STH_I	sth	%r28, [%r16 + 0x0036]
T3_asi_reg_rd_95:
	mov	0x2e, %r14
	.word 0xf2db8e40  ! 2399: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T3_asi_reg_wr_96:
	mov	0x3c4, %r14
	.word 0xf2f384a0  ! 2401: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_3_177:
	setx	0x310206, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_97:
	mov	0x4, %r14
	.word 0xfcf38e40  ! 2405: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf6f461cb  ! 2407: STXA_I	stxa	%r27, [%r17 + 0x01cb] %asi
	.word 0xf0ade14a  ! 2408: STBA_I	stba	%r24, [%r23 + 0x014a] %asi
	.word 0xfcaca055  ! 2409: STBA_I	stba	%r30, [%r18 + 0x0055] %asi
iob_intr_3_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_195), 16, 16)) -> intp(3, 0, 2e)
iob_intr_3_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_196), 16, 16)) -> intp(3, 0, 2d)
	.word 0xfab58020  ! 2417: STHA_R	stha	%r29, [%r22 + %r0] 0x01
	.word 0xf2a44020  ! 2418: STWA_R	stwa	%r25, [%r17 + %r0] 0x01
	.word 0xfa35a104  ! 2420: STH_I	sth	%r29, [%r22 + 0x0104]
	.word 0xf0ad6025  ! 2424: STBA_I	stba	%r24, [%r21 + 0x0025] %asi
T3_asi_reg_rd_96:
	mov	0x2b, %r14
	.word 0xfcdb84a0  ! 2425: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xfea4a1a1  ! 2427: STWA_I	stwa	%r31, [%r18 + 0x01a1] %asi
	.word 0xb205e16b  ! 2429: ADD_I	add 	%r23, 0x016b, %r25
T3_asi_reg_rd_97:
	mov	0x35, %r14
	.word 0xfadb8e80  ! 2430: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_3_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_197), 16, 16)) -> intp(3, 0, 31)
	.word 0xf62ca1bb  ! 2434: STB_I	stb	%r27, [%r18 + 0x01bb]
	.word 0xfab44020  ! 2435: STHA_R	stha	%r29, [%r17 + %r0] 0x01
T3_asi_reg_wr_98:
	mov	0xc, %r14
	.word 0xf8f38400  ! 2437: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf8344000  ! 2442: STH_R	sth	%r28, [%r17 + %r0]
	.word 0xf22c20fc  ! 2443: STB_I	stb	%r25, [%r16 + 0x00fc]
	.word 0xf4a5e055  ! 2446: STWA_I	stwa	%r26, [%r23 + 0x0055] %asi
	.word 0xbe3c0000  ! 2447: XNOR_R	xnor 	%r16, %r0, %r31
cpu_intr_3_178:
	setx	0x33011a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_99:
	mov	0x3c5, %r14
	.word 0xf8f384a0  ! 2450: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb20c0000  ! 2451: AND_R	and 	%r16, %r0, %r25
T3_asi_reg_wr_100:
	mov	0x18, %r14
	.word 0xfcf38e60  ! 2453: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_3_179:
	setx	0x320228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6240000  ! 2460: STW_R	stw	%r27, [%r16 + %r0]
	.word 0xf02ca1bb  ! 2461: STB_I	stb	%r24, [%r18 + 0x01bb]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfcaca09b  ! 2464: STBA_I	stba	%r30, [%r18 + 0x009b] %asi
cpu_intr_3_180:
	setx	0x30021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a44020  ! 2471: STWA_R	stwa	%r27, [%r17 + %r0] 0x01
	.word 0xfe2c4000  ! 2473: STB_R	stb	%r31, [%r17 + %r0]
	.word 0xf2ade0b5  ! 2476: STBA_I	stba	%r25, [%r23 + 0x00b5] %asi
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983d40  ! 2478: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d40, %hpstate
T3_asi_reg_rd_98:
	mov	0x5, %r14
	.word 0xfcdb8e40  ! 2479: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb635e121  ! 2482: ORN_I	orn 	%r23, 0x0121, %r27
	.word 0xf6b5c020  ! 2483: STHA_R	stha	%r27, [%r23 + %r0] 0x01
cpu_intr_3_181:
	setx	0x30011c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_182:
	setx	0x320324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8744000  ! 2489: STX_R	stx	%r28, [%r17 + %r0]
	.word 0xbead8000  ! 2490: ANDNcc_R	andncc 	%r22, %r0, %r31
	.word 0xb405c000  ! 2491: ADD_R	add 	%r23, %r0, %r26
	.word 0xf634c000  ! 2492: STH_R	sth	%r27, [%r19 + %r0]
	ta	T_CHANGE_NONHPRIV
	.word 0xf0b54020  ! 2494: STHA_R	stha	%r24, [%r21 + %r0] 0x01
T3_asi_reg_wr_101:
	mov	0x36, %r14
	.word 0xf0f38e40  ! 2496: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf6b46021  ! 2499: STHA_I	stha	%r27, [%r17 + 0x0021] %asi
iob_intr_3_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_198), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf8354000  ! 2503: STH_R	sth	%r28, [%r21 + %r0]
	.word 0xf8740000  ! 2510: STX_R	stx	%r28, [%r16 + %r0]
cpu_intr_3_183:
	setx	0x300037, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_99:
	mov	0x3c1, %r14
	.word 0xfedb8e40  ! 2512: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb205c000  ! 2513: ADD_R	add 	%r23, %r0, %r25
	.word 0xf6a40020  ! 2514: STWA_R	stwa	%r27, [%r16 + %r0] 0x01
	.word 0xf0ad2046  ! 2516: STBA_I	stba	%r24, [%r20 + 0x0046] %asi
T3_asi_reg_wr_102:
	mov	0x12, %r14
	.word 0xfcf38e60  ! 2518: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf8254000  ! 2519: STW_R	stw	%r28, [%r21 + %r0]
	.word 0xfea4e1cc  ! 2522: STWA_I	stwa	%r31, [%r19 + 0x01cc] %asi
	.word 0xf6240000  ! 2523: STW_R	stw	%r27, [%r16 + %r0]
	.word 0xfe758000  ! 2524: STX_R	stx	%r31, [%r22 + %r0]
	.word 0xfeaca0c7  ! 2525: STBA_I	stba	%r31, [%r18 + 0x00c7] %asi
	.word 0xf4a40020  ! 2527: STWA_R	stwa	%r26, [%r16 + %r0] 0x01
cpu_intr_3_184:
	setx	0x330031, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982a88  ! 2533: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a88, %hpstate
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_103:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 2536: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_199), 16, 16)) -> intp(3, 0, 32)
	.word 0xf22dc000  ! 2542: STB_R	stb	%r25, [%r23 + %r0]
iob_intr_3_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_200), 16, 16)) -> intp(3, 0, 37)
	.word 0xf0b5e1e1  ! 2544: STHA_I	stha	%r24, [%r23 + 0x01e1] %asi
cpu_intr_3_185:
	setx	0x320317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab521a3  ! 2546: STHA_I	stha	%r29, [%r20 + 0x01a3] %asi
cpu_intr_3_186:
	setx	0x330315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0344000  ! 2548: ORN_R	orn 	%r17, %r0, %r24
T3_asi_reg_rd_100:
	mov	0x15, %r14
	.word 0xfadb89e0  ! 2549: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb03d61e3  ! 2553: XNOR_I	xnor 	%r21, 0x01e3, %r24
	.word 0xf4f5a0eb  ! 2554: STXA_I	stxa	%r26, [%r22 + 0x00eb] %asi
	.word 0xf2b40020  ! 2556: STHA_R	stha	%r25, [%r16 + %r0] 0x01
	.word 0xfaf42006  ! 2557: STXA_I	stxa	%r29, [%r16 + 0x0006] %asi
	.word 0xb5350000  ! 2559: SRL_R	srl 	%r20, %r0, %r26
T3_asi_reg_rd_101:
	mov	0x21, %r14
	.word 0xfedb8e60  ! 2561: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb694a1df  ! 2566: ORcc_I	orcc 	%r18, 0x01df, %r27
cpu_intr_3_187:
	setx	0x33033c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_102:
	mov	0x9, %r14
	.word 0xf4db8e40  ! 2569: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_wr_104:
	mov	0x1d, %r14
	.word 0xfef389e0  ! 2570: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xfeb4208a  ! 2572: STHA_I	stha	%r31, [%r16 + 0x008a] %asi
cpu_intr_3_188:
	setx	0x310229, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_105:
	mov	0x38, %r14
	.word 0xf8f38e80  ! 2577: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xfc350000  ! 2578: STH_R	sth	%r30, [%r20 + %r0]
	.word 0xf634e15d  ! 2579: STH_I	sth	%r27, [%r19 + 0x015d]
	.word 0xfea50020  ! 2583: STWA_R	stwa	%r31, [%r20 + %r0] 0x01
	.word 0xf6b4a16a  ! 2584: STHA_I	stha	%r27, [%r18 + 0x016a] %asi
iob_intr_3_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_201), 16, 16)) -> intp(3, 0, 25)
T3_asi_reg_wr_106:
	mov	0x14, %r14
	.word 0xf4f38e60  ! 2589: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_3_189:
	setx	0x33011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc258000  ! 2598: STW_R	stw	%r30, [%r22 + %r0]
	.word 0xf0b4a114  ! 2602: STHA_I	stha	%r24, [%r18 + 0x0114] %asi
cpu_intr_3_190:
	setx	0x30000d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_202), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_191:
	setx	0x320212, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_103:
	mov	0x3, %r14
	.word 0xfcdb8e40  ! 2610: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_3_192:
	setx	0x330030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf425209c  ! 2613: STW_I	stw	%r26, [%r20 + 0x009c]
	.word 0xfea4c020  ! 2617: STWA_R	stwa	%r31, [%r19 + %r0] 0x01
iob_intr_3_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_203), 16, 16)) -> intp(3, 0, 25)
	.word 0xf2b58020  ! 2623: STHA_R	stha	%r25, [%r22 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
cpu_intr_3_193:
	setx	0x320222, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_194:
	setx	0x31033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc24a18f  ! 2627: STW_I	stw	%r30, [%r18 + 0x018f]
	.word 0xfe2c6093  ! 2629: STB_I	stb	%r31, [%r17 + 0x0093]
T3_asi_reg_wr_107:
	mov	0x14, %r14
	.word 0xfcf384a0  ! 2632: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfaac8020  ! 2634: STBA_R	stba	%r29, [%r18 + %r0] 0x01
	.word 0xf4a58020  ! 2635: STWA_R	stwa	%r26, [%r22 + %r0] 0x01
	.word 0xf0748000  ! 2637: STX_R	stx	%r24, [%r18 + %r0]
cpu_intr_3_195:
	setx	0x30021a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_204), 16, 16)) -> intp(3, 0, 2a)
cpu_intr_3_196:
	setx	0x300008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28c0000  ! 2646: ANDcc_R	andcc 	%r16, %r0, %r25
	.word 0xb845e1b9  ! 2647: ADDC_I	addc 	%r23, 0x01b9, %r28
	.word 0xf8f4a078  ! 2651: STXA_I	stxa	%r28, [%r18 + 0x0078] %asi
T3_asi_reg_wr_108:
	mov	0x38, %r14
	.word 0xf8f38e60  ! 2655: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf825c000  ! 2657: STW_R	stw	%r28, [%r23 + %r0]
iob_intr_3_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_205), 16, 16)) -> intp(3, 0, 8)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_206), 16, 16)) -> intp(3, 0, 33)
	ta	T_CHANGE_TO_TL1
	.word 0xf6ac215d  ! 2665: STBA_I	stba	%r27, [%r16 + 0x015d] %asi
	.word 0xfea54020  ! 2670: STWA_R	stwa	%r31, [%r21 + %r0] 0x01
T3_asi_reg_rd_104:
	mov	0x20, %r14
	.word 0xfedb89e0  ! 2671: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf2a5a0fb  ! 2672: STWA_I	stwa	%r25, [%r22 + 0x00fb] %asi
T3_asi_reg_wr_109:
	mov	0x11, %r14
	.word 0xf6f38e80  ! 2676: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T3_asi_reg_rd_105:
	mov	0x19, %r14
	.word 0xf2db8e80  ! 2678: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xfeace1e2  ! 2679: STBA_I	stba	%r31, [%r19 + 0x01e2] %asi
iob_intr_3_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_207), 16, 16)) -> intp(3, 0, 16)
	.word 0xb52ce001  ! 2683: SLL_I	sll 	%r19, 0x0001, %r26
	.word 0xfef5e12c  ! 2686: STXA_I	stxa	%r31, [%r23 + 0x012c] %asi
	.word 0xf4b52124  ! 2690: STHA_I	stha	%r26, [%r20 + 0x0124] %asi
cpu_intr_3_197:
	setx	0x320319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22ca1b9  ! 2695: STB_I	stb	%r25, [%r18 + 0x01b9]
	.word 0xf235a093  ! 2699: STH_I	sth	%r25, [%r22 + 0x0093]
	.word 0xb62d4000  ! 2700: ANDN_R	andn 	%r21, %r0, %r27
	.word 0xf4ac20ae  ! 2707: STBA_I	stba	%r26, [%r16 + 0x00ae] %asi
	.word 0xf225c000  ! 2708: STW_R	stw	%r25, [%r23 + %r0]
	.word 0xfa344000  ! 2711: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xf8250000  ! 2712: STW_R	stw	%r28, [%r20 + %r0]
cpu_intr_3_198:
	setx	0x30003b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_199:
	setx	0x31003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_200:
	setx	0x31010c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_208), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_201:
	setx	0x330306, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_202:
	setx	0x310128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaf5e0cb  ! 2722: STXA_I	stxa	%r29, [%r23 + 0x00cb] %asi
	.word 0xf075e169  ! 2725: STX_I	stx	%r24, [%r23 + 0x0169]
T3_asi_reg_rd_106:
	mov	0x30, %r14
	.word 0xfedb8e60  ! 2727: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_3_203:
	setx	0x31011b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_209), 16, 16)) -> intp(3, 0, 7)
cpu_intr_3_204:
	setx	0x30023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa756116  ! 2740: STX_I	stx	%r29, [%r21 + 0x0116]
T3_asi_reg_rd_107:
	mov	0x3c1, %r14
	.word 0xf0db8e60  ! 2742: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb634a035  ! 2748: SUBC_I	orn 	%r18, 0x0035, %r27
T3_asi_reg_wr_110:
	mov	0x0, %r14
	.word 0xfaf38e40  ! 2749: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfcb560f5  ! 2755: STHA_I	stha	%r30, [%r21 + 0x00f5] %asi
	.word 0xf4f52063  ! 2756: STXA_I	stxa	%r26, [%r20 + 0x0063] %asi
cpu_intr_3_205:
	setx	0x33030e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_206:
	setx	0x330306, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_111:
	mov	0x30, %r14
	.word 0xf6f38e80  ! 2767: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf03461b0  ! 2769: STH_I	sth	%r24, [%r17 + 0x01b0]
T3_asi_reg_wr_112:
	mov	0x25, %r14
	.word 0xf6f38e80  ! 2771: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf4a421cb  ! 2772: STWA_I	stwa	%r26, [%r16 + 0x01cb] %asi
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
	.word 0xf6356147  ! 2778: STH_I	sth	%r27, [%r21 + 0x0147]
	.word 0xb8458000  ! 2779: ADDC_R	addc 	%r22, %r0, %r28
	.word 0xfe248000  ! 2781: STW_R	stw	%r31, [%r18 + %r0]
T3_asi_reg_wr_113:
	mov	0x3c1, %r14
	.word 0xf0f389e0  ! 2782: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_3_207:
	setx	0x35022f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_210), 16, 16)) -> intp(3, 0, 36)
	.word 0xf0b44020  ! 2789: STHA_R	stha	%r24, [%r17 + %r0] 0x01
	.word 0xfa7461dc  ! 2795: STX_I	stx	%r29, [%r17 + 0x01dc]
T3_asi_reg_rd_108:
	mov	0x12, %r14
	.word 0xfadb84a0  ! 2796: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T3_asi_reg_wr_114:
	mov	0x8, %r14
	.word 0xf8f38e40  ! 2797: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_3_208:
	setx	0x37030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4250000  ! 2802: STW_R	stw	%r26, [%r20 + %r0]
T3_asi_reg_rd_109:
	mov	0x3c6, %r14
	.word 0xfedb8e80  ! 2803: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf62d0000  ! 2805: STB_R	stb	%r27, [%r20 + %r0]
T3_asi_reg_rd_110:
	mov	0x3c0, %r14
	.word 0xf2db84a0  ! 2811: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T3_asi_reg_rd_111:
	mov	0x3c3, %r14
	.word 0xf2db8e40  ! 2812: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfe35a173  ! 2813: STH_I	sth	%r31, [%r22 + 0x0173]
iob_intr_3_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_211), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf6b5201b  ! 2817: STHA_I	stha	%r27, [%r20 + 0x001b] %asi
T3_asi_reg_wr_115:
	mov	0x19, %r14
	.word 0xfaf38e80  ! 2818: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_3_209:
	setx	0x34000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4f521bd  ! 2822: STXA_I	stxa	%r26, [%r20 + 0x01bd] %asi
	.word 0xb245e13e  ! 2823: ADDC_I	addc 	%r23, 0x013e, %r25
T3_asi_reg_wr_116:
	mov	0x22, %r14
	.word 0xfaf38e40  ! 2824: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_3_210:
	setx	0x37011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ac61ea  ! 2826: STBA_I	stba	%r24, [%r17 + 0x01ea] %asi
	.word 0xf4a58020  ! 2828: STWA_R	stwa	%r26, [%r22 + %r0] 0x01
	.word 0xfaf5e04e  ! 2829: STXA_I	stxa	%r29, [%r23 + 0x004e] %asi
iob_intr_3_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_212), 16, 16)) -> intp(3, 0, 3f)
	.word 0xfcf52082  ! 2833: STXA_I	stxa	%r30, [%r20 + 0x0082] %asi
iob_intr_3_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_213), 16, 16)) -> intp(3, 0, 23)
cpu_intr_3_211:
	setx	0x37002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa350000  ! 2839: STH_R	sth	%r29, [%r20 + %r0]
iob_intr_3_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_214), 16, 16)) -> intp(3, 0, 3e)
iob_intr_3_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_215), 16, 16)) -> intp(3, 0, b)
	.word 0xf4ad201f  ! 2844: STBA_I	stba	%r26, [%r20 + 0x001f] %asi
T3_asi_reg_rd_112:
	mov	0x3c5, %r14
	.word 0xf4db8e40  ! 2845: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfa75a0ae  ! 2848: STX_I	stx	%r29, [%r22 + 0x00ae]
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_212:
	setx	0x350336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b48020  ! 2856: STHA_R	stha	%r28, [%r18 + %r0] 0x01
cpu_intr_3_213:
	setx	0x350112, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_117:
	mov	0x3c5, %r14
	.word 0xfaf389e0  ! 2863: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb6ac6021  ! 2864: ANDNcc_I	andncc 	%r17, 0x0021, %r27
cpu_intr_3_214:
	setx	0x360124, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_216), 16, 16)) -> intp(3, 0, 11)
	.word 0xbb643801  ! 2872: MOVcc_I	<illegal instruction>
	.word 0xfef5a185  ! 2873: STXA_I	stxa	%r31, [%r22 + 0x0185] %asi
	.word 0xbf7ca401  ! 2874: MOVR_I	movre	%r18, 0x1, %r31
cpu_intr_3_215:
	setx	0x370306, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_118:
	mov	0x22, %r14
	.word 0xf0f38e60  ! 2876: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_3_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_217), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf6346012  ! 2881: STH_I	sth	%r27, [%r17 + 0x0012]
iob_intr_3_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_218), 16, 16)) -> intp(3, 0, 9)
T3_asi_reg_wr_119:
	mov	0x20, %r14
	.word 0xfaf389e0  ! 2887: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_3_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_219), 16, 16)) -> intp(3, 0, 19)
iob_intr_3_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_220), 16, 16)) -> intp(3, 0, 9)
cpu_intr_3_216:
	setx	0x340301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca52183  ! 2893: STWA_I	stwa	%r30, [%r20 + 0x0183] %asi
iob_intr_3_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_221), 16, 16)) -> intp(3, 0, d)
iob_intr_3_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_222), 16, 16)) -> intp(3, 0, 28)
	.word 0xfeb4a0f5  ! 2898: STHA_I	stha	%r31, [%r18 + 0x00f5] %asi
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983dd8  ! 2900: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dd8, %hpstate
	.word 0xf424a150  ! 2901: STW_I	stw	%r26, [%r18 + 0x0150]
T3_asi_reg_rd_113:
	mov	0x1a, %r14
	.word 0xf6db8e60  ! 2906: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xfc748000  ! 2907: STX_R	stx	%r30, [%r18 + %r0]
T3_asi_reg_rd_114:
	mov	0x3c1, %r14
	.word 0xf4db8e60  ! 2911: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf4342098  ! 2914: STH_I	sth	%r26, [%r16 + 0x0098]
T3_asi_reg_wr_120:
	mov	0x3c4, %r14
	.word 0xf2f38e80  ! 2915: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf034e04b  ! 2916: STH_I	sth	%r24, [%r19 + 0x004b]
	.word 0xfca5c020  ! 2918: STWA_R	stwa	%r30, [%r23 + %r0] 0x01
T3_asi_reg_wr_121:
	mov	0x38, %r14
	.word 0xf4f38e40  ! 2921: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf235e143  ! 2922: STH_I	sth	%r25, [%r23 + 0x0143]
T3_asi_reg_wr_122:
	mov	0x2d, %r14
	.word 0xf2f38e40  ! 2924: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_3_217:
	setx	0x34030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_115:
	mov	0x16, %r14
	.word 0xf2db84a0  ! 2929: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_3_218:
	setx	0x360026, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
cpu_intr_3_219:
	setx	0x34023d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_223), 16, 16)) -> intp(3, 0, 23)
	.word 0xf235a18f  ! 2938: STH_I	sth	%r25, [%r22 + 0x018f]
	.word 0xfa2c2045  ! 2940: STB_I	stb	%r29, [%r16 + 0x0045]
	ta	T_CHANGE_TO_TL0
iob_intr_3_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_224), 16, 16)) -> intp(3, 0, 15)
T3_asi_reg_wr_123:
	mov	0x32, %r14
	.word 0xfaf38e40  ! 2945: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf0a46042  ! 2948: STWA_I	stwa	%r24, [%r17 + 0x0042] %asi
T3_asi_reg_wr_124:
	mov	0x3c8, %r14
	.word 0xf6f384a0  ! 2949: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_3_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_225), 16, 16)) -> intp(3, 0, 6)
	.word 0xf2adc020  ! 2956: STBA_R	stba	%r25, [%r23 + %r0] 0x01
	.word 0xfaf460b8  ! 2958: STXA_I	stxa	%r29, [%r17 + 0x00b8] %asi
	.word 0xf0ace075  ! 2959: STBA_I	stba	%r24, [%r19 + 0x0075] %asi
	.word 0xfe750000  ! 2960: STX_R	stx	%r31, [%r20 + %r0]
T3_asi_reg_wr_125:
	mov	0x35, %r14
	.word 0xfcf384a0  ! 2963: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfaadc020  ! 2964: STBA_R	stba	%r29, [%r23 + %r0] 0x01
cpu_intr_3_220:
	setx	0x35020a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_116:
	mov	0x3c1, %r14
	.word 0xfcdb8400  ! 2969: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T3_asi_reg_wr_126:
	mov	0x2b, %r14
	.word 0xfaf38e40  ! 2970: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_3_221:
	setx	0x35013d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_226), 16, 16)) -> intp(3, 0, 25)
	.word 0xf82d8000  ! 2976: STB_R	stb	%r28, [%r22 + %r0]
	.word 0xb60c209c  ! 2977: AND_I	and 	%r16, 0x009c, %r27
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_117:
	mov	0x1d, %r14
	.word 0xf0db8e80  ! 2980: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xf42c8000  ! 2982: STB_R	stb	%r26, [%r18 + %r0]
iob_intr_3_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_227), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf0aca0f3  ! 2984: STBA_I	stba	%r24, [%r18 + 0x00f3] %asi
	.word 0xf435e1d3  ! 2987: STH_I	sth	%r26, [%r23 + 0x01d3]
	ta	T_CHANGE_NONHPRIV
iob_intr_3_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_228), 16, 16)) -> intp(3, 0, b)
	.word 0xbb341000  ! 2994: SRLX_R	srlx	%r16, %r0, %r29
	.word 0xfc75a04a  ! 2995: STX_I	stx	%r30, [%r22 + 0x004a]
T3_asi_reg_wr_127:
	mov	0x29, %r14
	.word 0xfcf38e40  ! 2996: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_222:
	setx	0x370228, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_229), 16, 16)) -> intp(3, 0, 36)
T3_asi_reg_wr_128:
	mov	0x30, %r14
	.word 0xfef38e40  ! 3000: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_rd_118:
	mov	0x19, %r14
	.word 0xf0db84a0  ! 3001: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf4f52191  ! 3004: STXA_I	stxa	%r26, [%r20 + 0x0191] %asi
cpu_intr_3_223:
	setx	0x34000b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_224:
	setx	0x35001c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_119:
	mov	0x24, %r14
	.word 0xf2db84a0  ! 3009: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_3_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_230), 16, 16)) -> intp(3, 0, 20)
iob_intr_3_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_231), 16, 16)) -> intp(3, 0, 35)
T3_asi_reg_rd_120:
	mov	0x1b, %r14
	.word 0xfadb8400  ! 3020: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf8748000  ! 3022: STX_R	stx	%r28, [%r18 + %r0]
	.word 0xb6150000  ! 3023: OR_R	or 	%r20, %r0, %r27
cpu_intr_3_225:
	setx	0x37020d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_232), 16, 16)) -> intp(3, 0, 7)
	ta	T_CHANGE_TO_TL0
cpu_intr_3_226:
	setx	0x340125, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_233), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_rd_121:
	mov	0x8, %r14
	.word 0xf8db84a0  ! 3037: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_3_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_234), 16, 16)) -> intp(3, 0, 17)
T3_asi_reg_wr_129:
	mov	0x2f, %r14
	.word 0xf2f389e0  ! 3039: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb21ce173  ! 3041: XOR_I	xor 	%r19, 0x0173, %r25
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983b88  ! 3042: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b88, %hpstate
	.word 0xbb34c000  ! 3045: SRL_R	srl 	%r19, %r0, %r29
	.word 0xb9351000  ! 3046: SRLX_R	srlx	%r20, %r0, %r28
T3_asi_reg_rd_122:
	mov	0x2, %r14
	.word 0xf4db8e60  ! 3048: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_3_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_235), 16, 16)) -> intp(3, 0, 14)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_227:
	setx	0x370123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2d0000  ! 3061: STB_R	stb	%r31, [%r20 + %r0]
T3_asi_reg_wr_130:
	mov	0x2, %r14
	.word 0xf0f38400  ! 3066: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb12d3001  ! 3068: SLLX_I	sllx	%r20, 0x0001, %r24
	.word 0xbd2da001  ! 3069: SLL_I	sll 	%r22, 0x0001, %r30
cpu_intr_3_228:
	setx	0x360117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8248000  ! 3071: STW_R	stw	%r28, [%r18 + %r0]
	.word 0xfe244000  ! 3074: STW_R	stw	%r31, [%r17 + %r0]
iob_intr_3_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_236), 16, 16)) -> intp(3, 0, 17)
cpu_intr_3_229:
	setx	0x370107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf87460ea  ! 3078: STX_I	stx	%r28, [%r17 + 0x00ea]
iob_intr_3_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_237), 16, 16)) -> intp(3, 0, 23)
cpu_intr_3_230:
	setx	0x350203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea52057  ! 3083: STWA_I	stwa	%r31, [%r20 + 0x0057] %asi
cpu_intr_3_231:
	setx	0x34010e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_238), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf22cc000  ! 3090: STB_R	stb	%r25, [%r19 + %r0]
	.word 0x839520bf  ! 3091: WRPR_TNPC_I	wrpr	%r20, 0x00bf, %tnpc
	.word 0xf8b4a1ad  ! 3093: STHA_I	stha	%r28, [%r18 + 0x01ad] %asi
	.word 0xf2f4a124  ! 3095: STXA_I	stxa	%r25, [%r18 + 0x0124] %asi
iob_intr_3_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_239), 16, 16)) -> intp(3, 0, 5)
	.word 0xf025607b  ! 3097: STW_I	stw	%r24, [%r21 + 0x007b]
T3_asi_reg_rd_123:
	mov	0x3c0, %r14
	.word 0xfedb8e80  ! 3098: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	ta	T_CHANGE_TO_TL1
	.word 0xbc042077  ! 3102: ADD_I	add 	%r16, 0x0077, %r30
T3_asi_reg_wr_131:
	mov	0x35, %r14
	.word 0xf6f384a0  ! 3104: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf6b48020  ! 3106: STHA_R	stha	%r27, [%r18 + %r0] 0x01
iob_intr_3_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_240), 16, 16)) -> intp(3, 0, d)
T3_asi_reg_rd_124:
	mov	0x1a, %r14
	.word 0xf8db8400  ! 3108: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_3_232:
	setx	0x350322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_233:
	setx	0x37032b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_234:
	setx	0x370327, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_235:
	setx	0x36011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f42080  ! 3120: STXA_I	stxa	%r25, [%r16 + 0x0080] %asi
cpu_intr_3_236:
	setx	0x34030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf62c8000  ! 3127: STB_R	stb	%r27, [%r18 + %r0]
cpu_intr_3_237:
	setx	0x35032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_132:
	mov	0x3c2, %r14
	.word 0xf6f38400  ! 3130: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf8340000  ! 3132: STH_R	sth	%r28, [%r16 + %r0]
	.word 0xbf2df001  ! 3134: SLLX_I	sllx	%r23, 0x0001, %r31
iob_intr_3_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_241), 16, 16)) -> intp(3, 0, 24)
	.word 0xf67560e0  ! 3138: STX_I	stx	%r27, [%r21 + 0x00e0]
	.word 0xfe74c000  ! 3140: STX_R	stx	%r31, [%r19 + %r0]
	.word 0xfca4c020  ! 3141: STWA_R	stwa	%r30, [%r19 + %r0] 0x01
	.word 0xf4b40020  ! 3142: STHA_R	stha	%r26, [%r16 + %r0] 0x01
T3_asi_reg_wr_133:
	mov	0x3, %r14
	.word 0xfef38e60  ! 3143: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfaf5a06c  ! 3156: STXA_I	stxa	%r29, [%r22 + 0x006c] %asi
T3_asi_reg_wr_134:
	mov	0x3c7, %r14
	.word 0xf6f38400  ! 3159: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf6758000  ! 3160: STX_R	stx	%r27, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfef56073  ! 3163: STXA_I	stxa	%r31, [%r21 + 0x0073] %asi
iob_intr_3_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_242), 16, 16)) -> intp(3, 0, 22)
	ta	T_CHANGE_TO_TL0
	.word 0xfaf5617d  ! 3175: STXA_I	stxa	%r29, [%r21 + 0x017d] %asi
T3_asi_reg_wr_135:
	mov	0x17, %r14
	.word 0xfef38e60  ! 3177: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_3_238:
	setx	0x35030b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_243), 16, 16)) -> intp(3, 0, 1b)
	.word 0xfa34a1b3  ! 3182: STH_I	sth	%r29, [%r18 + 0x01b3]
	.word 0xfaac4020  ! 3186: STBA_R	stba	%r29, [%r17 + %r0] 0x01
iob_intr_3_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_244), 16, 16)) -> intp(3, 0, 0)
	.word 0xfa35c000  ! 3190: STH_R	sth	%r29, [%r23 + %r0]
iob_intr_3_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_245), 16, 16)) -> intp(3, 0, 13)
T3_asi_reg_wr_136:
	mov	0x3c4, %r14
	.word 0xfef38e40  ! 3194: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfa75c000  ! 3195: STX_R	stx	%r29, [%r23 + %r0]
cpu_intr_3_239:
	setx	0x360203, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_246), 16, 16)) -> intp(3, 0, 14)
iob_intr_3_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_247), 16, 16)) -> intp(3, 0, 33)
	.word 0xf2b4e0d1  ! 3201: STHA_I	stha	%r25, [%r19 + 0x00d1] %asi
cpu_intr_3_240:
	setx	0x340222, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_241:
	setx	0x340201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4750000  ! 3210: STX_R	stx	%r26, [%r20 + %r0]
iob_intr_3_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_248), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf0ad600f  ! 3213: STBA_I	stba	%r24, [%r21 + 0x000f] %asi
T3_asi_reg_rd_125:
	mov	0x18, %r14
	.word 0xfedb8e40  ! 3215: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf8348000  ! 3216: STH_R	sth	%r28, [%r18 + %r0]
iob_intr_3_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_249), 16, 16)) -> intp(3, 0, 21)
	.word 0xfe746080  ! 3218: STX_I	stx	%r31, [%r17 + 0x0080]
	.word 0xf074a12b  ! 3220: STX_I	stx	%r24, [%r18 + 0x012b]
	.word 0xf0b58020  ! 3222: STHA_R	stha	%r24, [%r22 + %r0] 0x01
cpu_intr_3_242:
	setx	0x360213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4340000  ! 3226: STH_R	sth	%r26, [%r16 + %r0]
iob_intr_3_250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_250), 16, 16)) -> intp(3, 0, 34)
iob_intr_3_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_251), 16, 16)) -> intp(3, 0, 34)
	.word 0xfa354000  ! 3229: STH_R	sth	%r29, [%r21 + %r0]
cpu_intr_3_243:
	setx	0x39003f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_244:
	setx	0x390306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6f5a130  ! 3239: STXA_I	stxa	%r27, [%r22 + 0x0130] %asi
	.word 0xf62c21dd  ! 3241: STB_I	stb	%r27, [%r16 + 0x01dd]
	.word 0xb43561b5  ! 3243: ORN_I	orn 	%r21, 0x01b5, %r26
	.word 0xfaa44020  ! 3244: STWA_R	stwa	%r29, [%r17 + %r0] 0x01
	.word 0xf8350000  ! 3246: STH_R	sth	%r28, [%r20 + %r0]
T3_asi_reg_wr_137:
	mov	0x3c8, %r14
	.word 0xfaf38e40  ! 3248: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfe758000  ! 3253: STX_R	stx	%r31, [%r22 + %r0]
	.word 0xfc2c6127  ! 3255: STB_I	stb	%r30, [%r17 + 0x0127]
	.word 0xfa2d8000  ! 3259: STB_R	stb	%r29, [%r22 + %r0]
	.word 0xf42c8000  ! 3260: STB_R	stb	%r26, [%r18 + %r0]
iob_intr_3_252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_252), 16, 16)) -> intp(3, 0, 16)
	.word 0xf825c000  ! 3262: STW_R	stw	%r28, [%r23 + %r0]
iob_intr_3_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_253), 16, 16)) -> intp(3, 0, 17)
	.word 0xf4ad8020  ! 3268: STBA_R	stba	%r26, [%r22 + %r0] 0x01
iob_intr_3_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_254), 16, 16)) -> intp(3, 0, 18)
iob_intr_3_255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_255), 16, 16)) -> intp(3, 0, 21)
iob_intr_3_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_256), 16, 16)) -> intp(3, 0, 5)
	.word 0xf8a54020  ! 3277: STWA_R	stwa	%r28, [%r21 + %r0] 0x01
	.word 0xb2140000  ! 3279: OR_R	or 	%r16, %r0, %r25
iob_intr_3_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_257), 16, 16)) -> intp(3, 0, 11)
	.word 0xbe9c0000  ! 3282: XORcc_R	xorcc 	%r16, %r0, %r31
iob_intr_3_258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_258), 16, 16)) -> intp(3, 0, 10)
	.word 0xf6a54020  ! 3287: STWA_R	stwa	%r27, [%r21 + %r0] 0x01
	.word 0xb88c0000  ! 3289: ANDcc_R	andcc 	%r16, %r0, %r28
T3_asi_reg_wr_138:
	mov	0x2a, %r14
	.word 0xf2f38e80  ! 3290: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_3_245:
	setx	0x380012, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_259), 16, 16)) -> intp(3, 0, 10)
	.word 0xb93df001  ! 3293: SRAX_I	srax	%r23, 0x0001, %r28
cpu_intr_3_246:
	setx	0x380120, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982c40  ! 3298: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c40, %hpstate
	.word 0xf6748000  ! 3300: STX_R	stx	%r27, [%r18 + %r0]
	.word 0xf8240000  ! 3302: STW_R	stw	%r28, [%r16 + %r0]
	.word 0xfead0020  ! 3304: STBA_R	stba	%r31, [%r20 + %r0] 0x01
	.word 0xb02ce1a7  ! 3306: ANDN_I	andn 	%r19, 0x01a7, %r24
cpu_intr_3_247:
	setx	0x3b0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaf5e001  ! 3309: STXA_I	stxa	%r29, [%r23 + 0x0001] %asi
	ta	T_CHANGE_TO_TL0
cpu_intr_3_248:
	setx	0x390038, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_126:
	mov	0x2, %r14
	.word 0xf6db8e60  ! 3314: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb4852076  ! 3315: ADDcc_I	addcc 	%r20, 0x0076, %r26
	.word 0xfc7420fc  ! 3319: STX_I	stx	%r30, [%r16 + 0x00fc]
	.word 0xf4b56113  ! 3321: STHA_I	stha	%r26, [%r21 + 0x0113] %asi
	.word 0xb6b4214c  ! 3322: SUBCcc_I	orncc 	%r16, 0x014c, %r27
cpu_intr_3_249:
	setx	0x3b0007, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982c0a  ! 3325: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c0a, %hpstate
	ta	T_CHANGE_TO_TL0
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983f58  ! 3328: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f58, %hpstate
T3_asi_reg_rd_127:
	mov	0x2e, %r14
	.word 0xf8db8e80  ! 3329: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_3_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_260), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf4f52139  ! 3336: STXA_I	stxa	%r26, [%r20 + 0x0139] %asi
	.word 0xf6354000  ! 3338: STH_R	sth	%r27, [%r21 + %r0]
	.word 0xf4b5e085  ! 3339: STHA_I	stha	%r26, [%r23 + 0x0085] %asi
cpu_intr_3_250:
	setx	0x210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc25a1ea  ! 3348: STW_I	stw	%r30, [%r22 + 0x01ea]
	.word 0xfcac8020  ! 3350: STBA_R	stba	%r30, [%r18 + %r0] 0x01
	.word 0xf4f42147  ! 3352: STXA_I	stxa	%r26, [%r16 + 0x0147] %asi
	.word 0xfe750000  ! 3353: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xf8ac61d5  ! 3355: STBA_I	stba	%r28, [%r17 + 0x01d5] %asi
	.word 0xf0a5e072  ! 3357: STWA_I	stwa	%r24, [%r23 + 0x0072] %asi
iob_intr_3_261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_261), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_wr_139:
	mov	0x3, %r14
	.word 0xf0f38e40  ! 3362: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf0ad4020  ! 3364: STBA_R	stba	%r24, [%r21 + %r0] 0x01
	.word 0xb8b521f7  ! 3366: ORNcc_I	orncc 	%r20, 0x01f7, %r28
	.word 0xf22d6109  ! 3370: STB_I	stb	%r25, [%r21 + 0x0109]
	.word 0xfa2d2037  ! 3375: STB_I	stb	%r29, [%r20 + 0x0037]
T3_asi_reg_rd_128:
	mov	0x22, %r14
	.word 0xfedb8e60  ! 3377: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_3_251:
	setx	0x3a0127, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_262), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_wr_140:
	mov	0x24, %r14
	.word 0xf0f38e40  ! 3380: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf62c8000  ! 3381: STB_R	stb	%r27, [%r18 + %r0]
cpu_intr_3_252:
	setx	0x390218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb61ce005  ! 3384: XOR_I	xor 	%r19, 0x0005, %r27
cpu_intr_3_253:
	setx	0x39013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b5205b  ! 3387: STHA_I	stha	%r25, [%r20 + 0x005b] %asi
	.word 0xf2adc020  ! 3391: STBA_R	stba	%r25, [%r23 + %r0] 0x01
cpu_intr_3_254:
	setx	0x380300, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_255:
	setx	0x3b0103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa748000  ! 3394: STX_R	stx	%r29, [%r18 + %r0]
cpu_intr_3_256:
	setx	0x3b0120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf355000  ! 3399: SRLX_R	srlx	%r21, %r0, %r31
iob_intr_3_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_263), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf2350000  ! 3403: STH_R	sth	%r25, [%r20 + %r0]
iob_intr_3_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_264), 16, 16)) -> intp(3, 0, 2c)
iob_intr_3_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_265), 16, 16)) -> intp(3, 0, 35)
	.word 0xb97ce401  ! 3407: MOVR_I	movre	%r19, 0x1, %r28
T3_asi_reg_wr_141:
	mov	0x23, %r14
	.word 0xf4f38e60  ! 3409: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T3_asi_reg_rd_129:
	mov	0x29, %r14
	.word 0xfcdb8400  ! 3411: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T3_asi_reg_wr_142:
	mov	0x37, %r14
	.word 0xfaf38400  ! 3412: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbe842096  ! 3414: ADDcc_I	addcc 	%r16, 0x0096, %r31
	.word 0xf435c000  ! 3415: STH_R	sth	%r26, [%r23 + %r0]
	.word 0xfcf42064  ! 3416: STXA_I	stxa	%r30, [%r16 + 0x0064] %asi
	.word 0xbb3d8000  ! 3418: SRA_R	sra 	%r22, %r0, %r29
	.word 0xfaf52197  ! 3419: STXA_I	stxa	%r29, [%r20 + 0x0197] %asi
cpu_intr_3_257:
	setx	0x3a011e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_266), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_wr_143:
	mov	0x31, %r14
	.word 0xfef38e40  ! 3427: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
iob_intr_3_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_267), 16, 16)) -> intp(3, 0, 13)
	.word 0xfeb4608c  ! 3434: STHA_I	stha	%r31, [%r17 + 0x008c] %asi
cpu_intr_3_258:
	setx	0x3b0219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6350000  ! 3438: ORN_R	orn 	%r20, %r0, %r27
T3_asi_reg_wr_144:
	mov	0x10, %r14
	.word 0xf0f38e40  ! 3439: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_268), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_wr_145:
	mov	0x2c, %r14
	.word 0xfcf389e0  ! 3443: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T3_asi_reg_wr_146:
	mov	0x13, %r14
	.word 0xf2f384a0  ! 3444: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_3_259:
	setx	0x3a0316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf474e152  ! 3451: STX_I	stx	%r26, [%r19 + 0x0152]
iob_intr_3_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_269), 16, 16)) -> intp(3, 0, 23)
T3_asi_reg_wr_147:
	mov	0x1f, %r14
	.word 0xfcf384a0  ! 3455: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfc248000  ! 3456: STW_R	stw	%r30, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0xb204a170  ! 3461: ADD_I	add 	%r18, 0x0170, %r25
T3_asi_reg_rd_130:
	mov	0x1b, %r14
	.word 0xf4db8400  ! 3462: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf0ac8020  ! 3463: STBA_R	stba	%r24, [%r18 + %r0] 0x01
iob_intr_3_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_270), 16, 16)) -> intp(3, 0, 1e)
cpu_intr_3_260:
	setx	0x3b031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ada12d  ! 3468: STBA_I	stba	%r25, [%r22 + 0x012d] %asi
	.word 0xfe2c4000  ! 3469: STB_R	stb	%r31, [%r17 + %r0]
T3_asi_reg_rd_131:
	mov	0x2b, %r14
	.word 0xfedb84a0  ! 3471: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_3_271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_271), 16, 16)) -> intp(3, 0, a)
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982d8a  ! 3473: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8a, %hpstate
cpu_intr_3_261:
	setx	0x3a0315, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_272), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf8adc020  ! 3481: STBA_R	stba	%r28, [%r23 + %r0] 0x01
	.word 0xf6f561f3  ! 3482: STXA_I	stxa	%r27, [%r21 + 0x01f3] %asi
T3_asi_reg_rd_132:
	mov	0x1d, %r14
	.word 0xfadb8e80  ! 3483: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xbd3d3001  ! 3484: SRAX_I	srax	%r20, 0x0001, %r30
	.word 0xfeb5e076  ! 3485: STHA_I	stha	%r31, [%r23 + 0x0076] %asi
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_148:
	mov	0x3c3, %r14
	.word 0xf4f38e60  ! 3487: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T3_asi_reg_rd_133:
	mov	0x1a, %r14
	.word 0xfadb8e60  ! 3488: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_3_273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_273), 16, 16)) -> intp(3, 0, 3d)
T3_asi_reg_rd_134:
	mov	0x18, %r14
	.word 0xf2db8400  ! 3492: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	ta	T_CHANGE_NONHPRIV
iob_intr_3_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_274), 16, 16)) -> intp(3, 0, d)
	.word 0xb08c0000  ! 3500: ANDcc_R	andcc 	%r16, %r0, %r24
	.word 0xf2a58020  ! 3501: STWA_R	stwa	%r25, [%r22 + %r0] 0x01
	.word 0xfea48020  ! 3502: STWA_R	stwa	%r31, [%r18 + %r0] 0x01
T3_asi_reg_wr_149:
	mov	0x19, %r14
	.word 0xf8f384a0  ! 3503: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb834c000  ! 3507: ORN_R	orn 	%r19, %r0, %r28
cpu_intr_3_262:
	setx	0x3a022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_3_275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_275), 16, 16)) -> intp(3, 0, 32)
iob_intr_3_276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_276), 16, 16)) -> intp(3, 0, 23)
iob_intr_3_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_277), 16, 16)) -> intp(3, 0, 8)
iob_intr_3_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_278), 16, 16)) -> intp(3, 0, 3)
cpu_intr_3_263:
	setx	0x380105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe346092  ! 3527: ORN_I	orn 	%r17, 0x0092, %r31
cpu_intr_3_264:
	setx	0x3b0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82d8000  ! 3532: STB_R	stb	%r28, [%r22 + %r0]
T3_asi_reg_rd_135:
	mov	0x3c0, %r14
	.word 0xf2db8400  ! 3533: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf4a58020  ! 3538: STWA_R	stwa	%r26, [%r22 + %r0] 0x01
cpu_intr_3_265:
	setx	0x39012a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_136:
	mov	0x3c7, %r14
	.word 0xf4db84a0  ! 3543: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf6ad6000  ! 3545: STBA_I	stba	%r27, [%r21 + 0x0000] %asi
cpu_intr_3_266:
	setx	0x380232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf274c000  ! 3549: STX_R	stx	%r25, [%r19 + %r0]
	.word 0xf2b5a144  ! 3553: STHA_I	stha	%r25, [%r22 + 0x0144] %asi
iob_intr_3_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_279), 16, 16)) -> intp(3, 0, 32)
	.word 0xf6a42193  ! 3556: STWA_I	stwa	%r27, [%r16 + 0x0193] %asi
cpu_intr_3_267:
	setx	0x38031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6746113  ! 3561: STX_I	stx	%r27, [%r17 + 0x0113]
cpu_intr_3_268:
	setx	0x390134, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_137:
	mov	0x3c6, %r14
	.word 0xf0db8400  ! 3563: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb08c8000  ! 3564: ANDcc_R	andcc 	%r18, %r0, %r24
	.word 0xfea56076  ! 3565: STWA_I	stwa	%r31, [%r21 + 0x0076] %asi
	.word 0xfa2d61fb  ! 3566: STB_I	stb	%r29, [%r21 + 0x01fb]
	.word 0xfeb4c020  ! 3568: STHA_R	stha	%r31, [%r19 + %r0] 0x01
iob_intr_3_280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_280), 16, 16)) -> intp(3, 0, 10)
	.word 0xf6b561dd  ! 3570: STHA_I	stha	%r27, [%r21 + 0x01dd] %asi
	.word 0xfe740000  ! 3571: STX_R	stx	%r31, [%r16 + %r0]
	.word 0xb09c4000  ! 3575: XORcc_R	xorcc 	%r17, %r0, %r24
iob_intr_3_281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_281), 16, 16)) -> intp(3, 0, 1c)
iob_intr_3_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_282), 16, 16)) -> intp(3, 0, 1)
iob_intr_3_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_283), 16, 16)) -> intp(3, 0, d)
	.word 0xf42d8000  ! 3581: STB_R	stb	%r26, [%r22 + %r0]
	.word 0xfaa4a0b4  ! 3582: STWA_I	stwa	%r29, [%r18 + 0x00b4] %asi
cpu_intr_3_269:
	setx	0x3b0211, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_138:
	mov	0x10, %r14
	.word 0xfadb8400  ! 3585: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf87561e6  ! 3587: STX_I	stx	%r28, [%r21 + 0x01e6]
iob_intr_3_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_284), 16, 16)) -> intp(3, 0, 33)
cpu_intr_3_270:
	setx	0x390003, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_139:
	mov	0x28, %r14
	.word 0xf2db8e40  ! 3593: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T3_asi_reg_wr_150:
	mov	0x3c0, %r14
	.word 0xf6f38e80  ! 3594: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T3_asi_reg_rd_140:
	mov	0x20, %r14
	.word 0xfedb84a0  ! 3595: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbd355000  ! 3598: SRLX_R	srlx	%r21, %r0, %r30
	.word 0xbd35d000  ! 3600: SRLX_R	srlx	%r23, %r0, %r30
	.word 0xf8ad0020  ! 3602: STBA_R	stba	%r28, [%r20 + %r0] 0x01
	.word 0xf434203f  ! 3605: STH_I	sth	%r26, [%r16 + 0x003f]
	.word 0xb6ac0000  ! 3606: ANDNcc_R	andncc 	%r16, %r0, %r27
iob_intr_3_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_285), 16, 16)) -> intp(3, 0, 6)
	.word 0xf22c602c  ! 3618: STB_I	stb	%r25, [%r17 + 0x002c]
	.word 0xf0b50020  ! 3623: STHA_R	stha	%r24, [%r20 + %r0] 0x01
	.word 0xbd520000  ! 3628: RDPR_PIL	rdpr	%pil, %r30
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_271:
	setx	0x380328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62de05c  ! 3637: STB_I	stb	%r27, [%r23 + 0x005c]
T3_asi_reg_rd_141:
	mov	0x11, %r14
	.word 0xf0db8e40  ! 3642: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_3_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_286), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_rd_142:
	mov	0xd, %r14
	.word 0xfadb8e60  ! 3644: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T3_asi_reg_wr_151:
	mov	0x25, %r14
	.word 0xfef384a0  ! 3645: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_3_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_287), 16, 16)) -> intp(3, 0, b)
	.word 0xf625e062  ! 3651: STW_I	stw	%r27, [%r23 + 0x0062]
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982e08  ! 3653: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e08, %hpstate
T3_asi_reg_wr_152:
	mov	0x3c2, %r14
	.word 0xf8f389e0  ! 3658: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T3_asi_reg_rd_143:
	mov	0x30, %r14
	.word 0xf2db8e60  ! 3659: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf4756187  ! 3662: STX_I	stx	%r26, [%r21 + 0x0187]
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982ad8  ! 3667: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad8, %hpstate
	.word 0xf6f4e087  ! 3669: STXA_I	stxa	%r27, [%r19 + 0x0087] %asi
cpu_intr_3_272:
	setx	0x39003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf03420df  ! 3677: STH_I	sth	%r24, [%r16 + 0x00df]
iob_intr_3_288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_288), 16, 16)) -> intp(3, 0, 31)
T3_asi_reg_rd_144:
	mov	0x3c2, %r14
	.word 0xf6db89e0  ! 3681: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T3_asi_reg_wr_153:
	mov	0x3c8, %r14
	.word 0xfaf384a0  ! 3682: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T3_asi_reg_wr_154:
	mov	0xb, %r14
	.word 0xf0f384a0  ! 3684: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf4b5e002  ! 3686: STHA_I	stha	%r26, [%r23 + 0x0002] %asi
T3_asi_reg_wr_155:
	mov	0x3c8, %r14
	.word 0xf0f38e40  ! 3688: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfa2da1f4  ! 3690: STB_I	stb	%r29, [%r22 + 0x01f4]
	.word 0xf8ad0020  ! 3691: STBA_R	stba	%r28, [%r20 + %r0] 0x01
T3_asi_reg_rd_145:
	mov	0xe, %r14
	.word 0xf6db84a0  ! 3692: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_3_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_289), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf074a115  ! 3694: STX_I	stx	%r24, [%r18 + 0x0115]
	.word 0xf2f560cd  ! 3695: STXA_I	stxa	%r25, [%r21 + 0x00cd] %asi
	.word 0xfaac6044  ! 3698: STBA_I	stba	%r29, [%r17 + 0x0044] %asi
	.word 0xfaac0020  ! 3700: STBA_R	stba	%r29, [%r16 + %r0] 0x01
iob_intr_3_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_290), 16, 16)) -> intp(3, 0, 26)
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_156:
	mov	0x25, %r14
	.word 0xf6f38e40  ! 3704: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfaade1ea  ! 3705: STBA_I	stba	%r29, [%r23 + 0x01ea] %asi
cpu_intr_3_273:
	setx	0x3d0222, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_291), 16, 16)) -> intp(3, 0, 22)
T3_asi_reg_wr_157:
	mov	0x31, %r14
	.word 0xf2f384a0  ! 3708: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T3_asi_reg_rd_146:
	mov	0x3c0, %r14
	.word 0xfedb8400  ! 3710: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T3_asi_reg_rd_147:
	mov	0x14, %r14
	.word 0xf2db8e80  ! 3711: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xba344000  ! 3714: SUBC_R	orn 	%r17, %r0, %r29
iob_intr_3_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_292), 16, 16)) -> intp(3, 0, 0)
	.word 0xfeb50020  ! 3721: STHA_R	stha	%r31, [%r20 + %r0] 0x01
	.word 0xfe750000  ! 3723: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xfcf4603d  ! 3724: STXA_I	stxa	%r30, [%r17 + 0x003d] %asi
iob_intr_3_293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_293), 16, 16)) -> intp(3, 0, 29)
cpu_intr_3_274:
	setx	0x3c0111, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_294), 16, 16)) -> intp(3, 0, 34)
cpu_intr_3_275:
	setx	0x3c0035, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982988  ! 3740: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0988, %hpstate
cpu_intr_3_276:
	setx	0x3d0027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4346049  ! 3748: STH_I	sth	%r26, [%r17 + 0x0049]
	.word 0xf275a143  ! 3752: STX_I	stx	%r25, [%r22 + 0x0143]
	.word 0xbb520000  ! 3757: RDPR_PIL	rdpr	%pil, %r29
	.word 0xf4ad8020  ! 3758: STBA_R	stba	%r26, [%r22 + %r0] 0x01
	.word 0xb69c0000  ! 3760: XORcc_R	xorcc 	%r16, %r0, %r27
	.word 0xf6ac0020  ! 3761: STBA_R	stba	%r27, [%r16 + %r0] 0x01
	.word 0xfea4e105  ! 3763: STWA_I	stwa	%r31, [%r19 + 0x0105] %asi
iob_intr_3_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_295), 16, 16)) -> intp(3, 0, 10)
T3_asi_reg_rd_148:
	mov	0x1a, %r14
	.word 0xf6db84a0  ! 3765: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T3_asi_reg_wr_158:
	mov	0x3c1, %r14
	.word 0xf0f38e60  ! 3766: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_3_277:
	setx	0x1023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a58020  ! 3769: STWA_R	stwa	%r25, [%r22 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe2c4000  ! 3771: STB_R	stb	%r31, [%r17 + %r0]
	.word 0xfe748000  ! 3774: STX_R	stx	%r31, [%r18 + %r0]
	.word 0xfeadc020  ! 3775: STBA_R	stba	%r31, [%r23 + %r0] 0x01
T3_asi_reg_wr_159:
	mov	0xa, %r14
	.word 0xf2f38e80  ! 3776: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T3_asi_reg_rd_149:
	mov	0x21, %r14
	.word 0xf8db84a0  ! 3777: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xfe352106  ! 3778: STH_I	sth	%r31, [%r20 + 0x0106]
cpu_intr_3_278:
	setx	0x3e021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4aca0cb  ! 3782: STBA_I	stba	%r26, [%r18 + 0x00cb] %asi
	.word 0xfc2da0fd  ! 3783: STB_I	stb	%r30, [%r22 + 0x00fd]
T3_asi_reg_rd_150:
	mov	0x13, %r14
	.word 0xf6db8e40  ! 3785: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbea5e0cd  ! 3787: SUBcc_I	subcc 	%r23, 0x00cd, %r31
	.word 0xfe740000  ! 3788: STX_R	stx	%r31, [%r16 + %r0]
	.word 0xba3d61e1  ! 3789: XNOR_I	xnor 	%r21, 0x01e1, %r29
	.word 0xbe1561ca  ! 3790: OR_I	or 	%r21, 0x01ca, %r31
iob_intr_3_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_296), 16, 16)) -> intp(3, 0, 9)
T3_asi_reg_rd_151:
	mov	0x10, %r14
	.word 0xfadb8e80  ! 3795: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf4a461f8  ! 3797: STWA_I	stwa	%r26, [%r17 + 0x01f8] %asi
cpu_intr_3_279:
	setx	0x3d0204, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_160:
	mov	0x3c6, %r14
	.word 0xf4f38e40  ! 3803: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfa2420f5  ! 3805: STW_I	stw	%r29, [%r16 + 0x00f5]
	.word 0xba3ce02a  ! 3808: XNOR_I	xnor 	%r19, 0x002a, %r29
iob_intr_3_297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_297), 16, 16)) -> intp(3, 0, 0)
	.word 0xf2758000  ! 3812: STX_R	stx	%r25, [%r22 + %r0]
T3_asi_reg_rd_152:
	mov	0x1b, %r14
	.word 0xf2db8400  ! 3813: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T3_asi_reg_rd_153:
	mov	0x27, %r14
	.word 0xf2db8e60  ! 3814: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T3_asi_reg_wr_161:
	mov	0x29, %r14
	.word 0xfef38e80  ! 3815: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_3_298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_298), 16, 16)) -> intp(3, 0, 3c)
iob_intr_3_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_299), 16, 16)) -> intp(3, 0, 32)
T3_asi_reg_rd_154:
	mov	0x1c, %r14
	.word 0xf4db89e0  ! 3818: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbb2d2001  ! 3819: SLL_I	sll 	%r20, 0x0001, %r29
	.word 0xf22ce089  ! 3821: STB_I	stb	%r25, [%r19 + 0x0089]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf8b5a04a  ! 3824: STHA_I	stha	%r28, [%r22 + 0x004a] %asi
iob_intr_3_300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_300), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_rd_155:
	mov	0x3c1, %r14
	.word 0xf0db84a0  ! 3826: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_3_280:
	setx	0x3c0302, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_281:
	setx	0x3c0333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb414a114  ! 3837: OR_I	or 	%r18, 0x0114, %r26
cpu_intr_3_282:
	setx	0x3c0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc358000  ! 3848: STH_R	sth	%r30, [%r22 + %r0]
iob_intr_3_301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_301), 16, 16)) -> intp(3, 0, 5)
cpu_intr_3_283:
	setx	0x3d0232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b42196  ! 3854: ORNcc_I	orncc 	%r16, 0x0196, %r27
	.word 0xf02c215a  ! 3856: STB_I	stb	%r24, [%r16 + 0x015a]
	.word 0xf8340000  ! 3862: STH_R	sth	%r28, [%r16 + %r0]
cpu_intr_3_284:
	setx	0x3d0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa342081  ! 3864: STH_I	sth	%r29, [%r16 + 0x0081]
iob_intr_3_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_302), 16, 16)) -> intp(3, 0, 5)
	ta	T_CHANGE_HPRIV
iob_intr_3_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_303), 16, 16)) -> intp(3, 0, 2a)
cpu_intr_3_285:
	setx	0x3d0213, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_156:
	mov	0xb, %r14
	.word 0xf0db84a0  ! 3874: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbe9d8000  ! 3875: XORcc_R	xorcc 	%r22, %r0, %r31
iob_intr_3_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_304), 16, 16)) -> intp(3, 0, 2f)
iob_intr_3_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_305), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf474614d  ! 3884: STX_I	stx	%r26, [%r17 + 0x014d]
	.word 0xf4f4204e  ! 3885: STXA_I	stxa	%r26, [%r16 + 0x004e] %asi
	.word 0xf835610d  ! 3886: STH_I	sth	%r28, [%r21 + 0x010d]
T3_asi_reg_wr_162:
	mov	0x11, %r14
	.word 0xf8f38400  ! 3889: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983b9a  ! 3890: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b9a, %hpstate
	.word 0xfab5c020  ! 3895: STHA_R	stha	%r29, [%r23 + %r0] 0x01
T3_asi_reg_wr_163:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 3897: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_306), 16, 16)) -> intp(3, 0, 39)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfa3560d1  ! 3907: STH_I	sth	%r29, [%r21 + 0x00d1]
	.word 0xfa25e1c9  ! 3909: STW_I	stw	%r29, [%r23 + 0x01c9]
	.word 0xb00c4000  ! 3911: AND_R	and 	%r17, %r0, %r24
	.word 0xf834215e  ! 3912: STH_I	sth	%r28, [%r16 + 0x015e]
	.word 0xf0758000  ! 3913: STX_R	stx	%r24, [%r22 + %r0]
	.word 0xf2744000  ! 3914: STX_R	stx	%r25, [%r17 + %r0]
	.word 0xfe2dc000  ! 3916: STB_R	stb	%r31, [%r23 + %r0]
cpu_intr_3_286:
	setx	0x3d011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf2358000  ! 3922: STH_R	sth	%r25, [%r22 + %r0]
cpu_intr_3_287:
	setx	0x3d0303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8354000  ! 3927: STH_R	sth	%r28, [%r21 + %r0]
cpu_intr_3_288:
	setx	0x3e003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba0d8000  ! 3929: AND_R	and 	%r22, %r0, %r29
	.word 0xf4750000  ! 3931: STX_R	stx	%r26, [%r20 + %r0]
cpu_intr_3_289:
	setx	0x3f012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12cd000  ! 3934: SLLX_R	sllx	%r19, %r0, %r24
	.word 0xf22ce01b  ! 3936: STB_I	stb	%r25, [%r19 + 0x001b]
iob_intr_3_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_307), 16, 16)) -> intp(3, 0, 3)
cpu_intr_3_290:
	setx	0x3d031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe740000  ! 3943: STX_R	stx	%r31, [%r16 + %r0]
iob_intr_3_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_308), 16, 16)) -> intp(3, 0, c)
	.word 0xf4b4e16a  ! 3946: STHA_I	stha	%r26, [%r19 + 0x016a] %asi
T3_asi_reg_wr_164:
	mov	0x2b, %r14
	.word 0xfef38e80  ! 3947: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_3_291:
	setx	0x3f023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ade08e  ! 3949: STBA_I	stba	%r27, [%r23 + 0x008e] %asi
T3_asi_reg_wr_165:
	mov	0x19, %r14
	.word 0xfef38e60  ! 3950: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf4a48020  ! 3951: STWA_R	stwa	%r26, [%r18 + %r0] 0x01
T3_asi_reg_rd_157:
	mov	0xe, %r14
	.word 0xf6db8e60  ! 3953: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf4ac8020  ! 3955: STBA_R	stba	%r26, [%r18 + %r0] 0x01
	.word 0xbb641800  ! 3956: MOVcc_R	<illegal instruction>
cpu_intr_3_292:
	setx	0x3d010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_3_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_309), 16, 16)) -> intp(3, 0, 2f)
	.word 0xfcb40020  ! 3962: STHA_R	stha	%r30, [%r16 + %r0] 0x01
iob_intr_3_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_310), 16, 16)) -> intp(3, 0, 15)
	.word 0xb5518000  ! 3964: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0xb495a120  ! 3965: ORcc_I	orcc 	%r22, 0x0120, %r26
cpu_intr_3_293:
	setx	0x3d0203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b4a0d3  ! 3967: STHA_I	stha	%r25, [%r18 + 0x00d3] %asi
	.word 0xfc75c000  ! 3969: STX_R	stx	%r30, [%r23 + %r0]
	.word 0xfa250000  ! 3970: STW_R	stw	%r29, [%r20 + %r0]
	.word 0xb834c000  ! 3972: SUBC_R	orn 	%r19, %r0, %r28
cpu_intr_3_294:
	setx	0x3d012a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_166:
	mov	0x12, %r14
	.word 0xf0f38e40  ! 3980: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf0254000  ! 3985: STW_R	stw	%r24, [%r21 + %r0]
T3_asi_reg_rd_158:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 3988: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_3_295:
	setx	0x3d0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42c0000  ! 3993: STB_R	stb	%r26, [%r16 + %r0]
	.word 0xf4256047  ! 3995: STW_I	stw	%r26, [%r21 + 0x0047]
	.word 0xf025a0b0  ! 3999: STW_I	stw	%r24, [%r22 + 0x00b0]
	.word 0xf435a025  ! 4002: STH_I	sth	%r26, [%r22 + 0x0025]
iob_intr_3_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_311), 16, 16)) -> intp(3, 0, 0)
T3_asi_reg_wr_167:
	mov	0x15, %r14
	.word 0xfef38e40  ! 4005: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfca5e0a9  ! 4007: STWA_I	stwa	%r30, [%r23 + 0x00a9] %asi
	.word 0xf225c000  ! 4009: STW_R	stw	%r25, [%r23 + %r0]
	.word 0xb8248000  ! 4010: SUB_R	sub 	%r18, %r0, %r28
iob_intr_3_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_312), 16, 16)) -> intp(3, 0, 3e)
cpu_intr_3_296:
	setx	0x3c0200, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_159:
	mov	0x1, %r14
	.word 0xf6db8400  ! 4015: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_3_313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_313), 16, 16)) -> intp(3, 0, 36)
cpu_intr_3_297:
	setx	0x3f002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b5c020  ! 4020: STHA_R	stha	%r25, [%r23 + %r0] 0x01
iob_intr_3_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_314), 16, 16)) -> intp(3, 0, 3d)
iob_intr_3_315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_315), 16, 16)) -> intp(3, 0, 22)
	.word 0xf8b50020  ! 4024: STHA_R	stha	%r28, [%r20 + %r0] 0x01
	.word 0xfaa58020  ! 4025: STWA_R	stwa	%r29, [%r22 + %r0] 0x01
	.word 0xfea4e1e5  ! 4026: STWA_I	stwa	%r31, [%r19 + 0x01e5] %asi
iob_intr_3_316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_316), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf4ac0020  ! 4028: STBA_R	stba	%r26, [%r16 + %r0] 0x01
cpu_intr_3_298:
	setx	0x3c0107, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_160:
	mov	0x20, %r14
	.word 0xfadb8e80  ! 4032: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	ta	T_CHANGE_HPRIV
	.word 0xf6ac2092  ! 4036: STBA_I	stba	%r27, [%r16 + 0x0092] %asi
T3_asi_reg_rd_161:
	mov	0x5, %r14
	.word 0xf8db8e60  ! 4038: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_3_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_317), 16, 16)) -> intp(3, 0, 30)
iob_intr_3_318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_318), 16, 16)) -> intp(3, 0, 13)
	.word 0xf4f4a0cd  ! 4041: STXA_I	stxa	%r26, [%r18 + 0x00cd] %asi
T3_asi_reg_rd_162:
	mov	0xa, %r14
	.word 0xf0db8e40  ! 4042: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_3_299:
	setx	0x3d0034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4758000  ! 4047: STX_R	stx	%r26, [%r22 + %r0]
cpu_intr_3_300:
	setx	0x3f0205, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_301:
	setx	0x3c0117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12d2001  ! 4058: SLL_I	sll 	%r20, 0x0001, %r24
cpu_intr_3_302:
	setx	0x3e0205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa34e1cd  ! 4063: STH_I	sth	%r29, [%r19 + 0x01cd]
T3_asi_reg_rd_163:
	mov	0x3c5, %r14
	.word 0xfedb84a0  ! 4064: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf63461af  ! 4065: STH_I	sth	%r27, [%r17 + 0x01af]
T3_asi_reg_rd_164:
	mov	0x14, %r14
	.word 0xf2db8400  ! 4068: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf835e028  ! 4072: STH_I	sth	%r28, [%r23 + 0x0028]
	.word 0xfeac0020  ! 4076: STBA_R	stba	%r31, [%r16 + %r0] 0x01
	.word 0xf8244000  ! 4077: STW_R	stw	%r28, [%r17 + %r0]
cpu_intr_3_303:
	setx	0x3e002d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_319), 16, 16)) -> intp(3, 0, 18)
cpu_intr_3_304:
	setx	0x3d0317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_305:
	setx	0x3f0204, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_320), 16, 16)) -> intp(3, 0, 1c)
	.word 0xba048000  ! 4094: ADD_R	add 	%r18, %r0, %r29
iob_intr_3_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_321), 16, 16)) -> intp(3, 0, 1b)
iob_intr_3_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_322), 16, 16)) -> intp(3, 0, 1f)
	.word 0xfa244000  ! 4106: STW_R	stw	%r29, [%r17 + %r0]
	.word 0xf62c4000  ! 4110: STB_R	stb	%r27, [%r17 + %r0]
iob_intr_3_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_323), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_306:
	setx	0x3e010b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_324), 16, 16)) -> intp(3, 0, 17)
cpu_intr_3_307:
	setx	0x3c0124, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_308:
	setx	0x3f021d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_168:
	mov	0x3c6, %r14
	.word 0xfef38e40  ! 4119: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_3_309:
	setx	0x3e022c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_325), 16, 16)) -> intp(3, 0, 2c)
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983f5a  ! 4124: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f5a, %hpstate
iob_intr_3_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_326), 16, 16)) -> intp(3, 0, 16)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfc25c000  ! 4129: STW_R	stw	%r30, [%r23 + %r0]
	.word 0xb350c000  ! 4131: RDPR_TT	rdpr	%tt, %r25
T3_asi_reg_rd_165:
	mov	0x3c0, %r14
	.word 0xfcdb89e0  ! 4132: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_3_310:
	setx	0x3c0133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6f5e141  ! 4134: STXA_I	stxa	%r27, [%r23 + 0x0141] %asi
	.word 0xfa2de1c9  ! 4135: STB_I	stb	%r29, [%r23 + 0x01c9]
iob_intr_3_327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_327), 16, 16)) -> intp(3, 0, d)
iob_intr_3_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_328), 16, 16)) -> intp(3, 0, 3a)
	ta	T_CHANGE_TO_TL0
	.word 0xb2944000  ! 4147: ORcc_R	orcc 	%r17, %r0, %r25
	ta	T_CHANGE_TO_TL1
iob_intr_3_329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_329), 16, 16)) -> intp(3, 0, 2e)
	.word 0xfaf52104  ! 4154: STXA_I	stxa	%r29, [%r20 + 0x0104] %asi
	.word 0xfcac20d6  ! 4159: STBA_I	stba	%r30, [%r16 + 0x00d6] %asi
iob_intr_3_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_330), 16, 16)) -> intp(3, 0, 25)
	.word 0xfcf521f7  ! 4173: STXA_I	stxa	%r30, [%r20 + 0x01f7] %asi
T3_asi_reg_wr_169:
	mov	0x9, %r14
	.word 0xf2f38e40  ! 4174: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf4ac8020  ! 4175: STBA_R	stba	%r26, [%r18 + %r0] 0x01
cpu_intr_3_311:
	setx	0x410119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x879460e0  ! 4178: WRPR_TT_I	wrpr	%r17, 0x00e0, %tt
T3_asi_reg_rd_166:
	mov	0x2c, %r14
	.word 0xf2db8400  ! 4180: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xfe25607a  ! 4182: STW_I	stw	%r31, [%r21 + 0x007a]
T3_asi_reg_wr_170:
	mov	0x3c4, %r14
	.word 0xf2f389e0  ! 4183: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL0
iob_intr_3_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_331), 16, 16)) -> intp(3, 0, 3f)
	.word 0xbcac8000  ! 4188: ANDNcc_R	andncc 	%r18, %r0, %r30
cpu_intr_3_312:
	setx	0x43020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_332), 16, 16)) -> intp(3, 0, 27)
cpu_intr_3_313:
	setx	0x410204, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_314:
	setx	0x420335, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_315:
	setx	0x420013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ac20d0  ! 4199: STBA_I	stba	%r28, [%r16 + 0x00d0] %asi
	.word 0xf02d6029  ! 4200: STB_I	stb	%r24, [%r21 + 0x0029]
	.word 0xb635e0ef  ! 4202: SUBC_I	orn 	%r23, 0x00ef, %r27
	.word 0xf6744000  ! 4203: STX_R	stx	%r27, [%r17 + %r0]
	.word 0xf634e199  ! 4205: STH_I	sth	%r27, [%r19 + 0x0199]
	.word 0xbe24e1cc  ! 4206: SUB_I	sub 	%r19, 0x01cc, %r31
iob_intr_3_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_333), 16, 16)) -> intp(3, 0, 15)
cpu_intr_3_316:
	setx	0x420037, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_317:
	setx	0x400300, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_167:
	mov	0xe, %r14
	.word 0xf0db8e60  ! 4217: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf8248000  ! 4218: STW_R	stw	%r28, [%r18 + %r0]
	.word 0xf875c000  ! 4219: STX_R	stx	%r28, [%r23 + %r0]
	.word 0xfa348000  ! 4222: STH_R	sth	%r29, [%r18 + %r0]
	.word 0xf6b5c020  ! 4223: STHA_R	stha	%r27, [%r23 + %r0] 0x01
	.word 0xf0f4a1e1  ! 4224: STXA_I	stxa	%r24, [%r18 + 0x01e1] %asi
T3_asi_reg_wr_171:
	mov	0x16, %r14
	.word 0xf2f38e40  ! 4227: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_3_318:
	setx	0x420210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2de0ed  ! 4230: STB_I	stb	%r29, [%r23 + 0x00ed]
iob_intr_3_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_334), 16, 16)) -> intp(3, 0, 6)
T3_asi_reg_rd_168:
	mov	0x3c2, %r14
	.word 0xf2db84a0  ! 4232: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xfc7461b8  ! 4234: STX_I	stx	%r30, [%r17 + 0x01b8]
cpu_intr_3_319:
	setx	0x42013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_172:
	mov	0x18, %r14
	.word 0xf6f38400  ! 4239: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T3_asi_reg_wr_173:
	mov	0x22, %r14
	.word 0xf4f38e40  ! 4241: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfe2c8000  ! 4242: STB_R	stb	%r31, [%r18 + %r0]
cpu_intr_3_320:
	setx	0x410332, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_174:
	mov	0x32, %r14
	.word 0xf8f384a0  ! 4244: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf4a46038  ! 4245: STWA_I	stwa	%r26, [%r17 + 0x0038] %asi
	.word 0xfc756069  ! 4248: STX_I	stx	%r30, [%r21 + 0x0069]
	.word 0xfe740000  ! 4250: STX_R	stx	%r31, [%r16 + %r0]
	.word 0xf0ac8020  ! 4251: STBA_R	stba	%r24, [%r18 + %r0] 0x01
	.word 0xb83d4000  ! 4253: XNOR_R	xnor 	%r21, %r0, %r28
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982d58  ! 4254: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d58, %hpstate
iob_intr_3_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_335), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_336), 16, 16)) -> intp(3, 0, 10)
T3_asi_reg_wr_175:
	mov	0xa, %r14
	.word 0xf6f384a0  ! 4259: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_3_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_337), 16, 16)) -> intp(3, 0, 11)
cpu_intr_3_321:
	setx	0x400009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4c5e108  ! 4262: ADDCcc_I	addccc 	%r23, 0x0108, %r26
T3_asi_reg_rd_169:
	mov	0x3c1, %r14
	.word 0xf8db84a0  ! 4266: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xfa25c000  ! 4268: STW_R	stw	%r29, [%r23 + %r0]
cpu_intr_3_322:
	setx	0x400216, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_323:
	setx	0x40030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_324:
	setx	0x420110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x839521c0  ! 4274: WRPR_TNPC_I	wrpr	%r20, 0x01c0, %tnpc
iob_intr_3_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_338), 16, 16)) -> intp(3, 0, d)
T3_asi_reg_rd_170:
	mov	0x1, %r14
	.word 0xf6db89e0  ! 4277: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_3_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_339), 16, 16)) -> intp(3, 0, 5)
	.word 0xbeb48000  ! 4279: SUBCcc_R	orncc 	%r18, %r0, %r31
T3_asi_reg_rd_171:
	mov	0x1c, %r14
	.word 0xf8db84a0  ! 4282: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T3_asi_reg_rd_172:
	mov	0x5, %r14
	.word 0xf4db8e80  ! 4284: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_3_340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_340), 16, 16)) -> intp(3, 0, 3b)
T3_asi_reg_rd_173:
	mov	0x3c4, %r14
	.word 0xfedb8e40  ! 4286: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb97c2401  ! 4288: MOVR_I	movre	%r16, 0x1, %r28
T3_asi_reg_wr_176:
	mov	0x20, %r14
	.word 0xf4f384a0  ! 4289: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T3_asi_reg_wr_177:
	mov	0x3c6, %r14
	.word 0xf4f38400  ! 4291: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T3_asi_reg_rd_174:
	mov	0x17, %r14
	.word 0xf6db8e40  ! 4292: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbf2d6001  ! 4293: SLL_I	sll 	%r21, 0x0001, %r31
	.word 0xfa352195  ! 4295: STH_I	sth	%r29, [%r20 + 0x0195]
	.word 0xf6348000  ! 4296: STH_R	sth	%r27, [%r18 + %r0]
iob_intr_3_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_341), 16, 16)) -> intp(3, 0, 16)
T3_asi_reg_wr_178:
	mov	0x1b, %r14
	.word 0xf6f38e60  ! 4302: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T3_asi_reg_rd_175:
	mov	0xb, %r14
	.word 0xfcdb8e40  ! 4303: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_342), 16, 16)) -> intp(3, 0, 23)
cpu_intr_3_325:
	setx	0x430205, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_326:
	setx	0x410208, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_343), 16, 16)) -> intp(3, 0, 11)
iob_intr_3_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_344), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_wr_179:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 4312: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
	.word 0xb77c4400  ! 4317: MOVR_R	movre	%r17, %r0, %r27
	.word 0xfab4e095  ! 4318: STHA_I	stha	%r29, [%r19 + 0x0095] %asi
iob_intr_3_345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_345), 16, 16)) -> intp(3, 0, 30)
	.word 0xfea4a102  ! 4323: STWA_I	stwa	%r31, [%r18 + 0x0102] %asi
	.word 0xfcb4c020  ! 4324: STHA_R	stha	%r30, [%r19 + %r0] 0x01
iob_intr_3_346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_346), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_rd_176:
	mov	0x17, %r14
	.word 0xf8db8e40  ! 4331: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T3_asi_reg_wr_180:
	mov	0x2, %r14
	.word 0xf4f38e80  ! 4332: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_3_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_347), 16, 16)) -> intp(3, 0, 3c)
	.word 0xfcac2175  ! 4335: STBA_I	stba	%r30, [%r16 + 0x0175] %asi
	ta	T_CHANGE_NONHPRIV
	.word 0xb950c000  ! 4338: RDPR_TT	rdpr	%tt, %r28
T3_asi_reg_rd_177:
	mov	0x3c6, %r14
	.word 0xf4db8e40  ! 4340: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb13d1000  ! 4342: SRAX_R	srax	%r20, %r0, %r24
	.word 0xfa2da1ed  ! 4343: STB_I	stb	%r29, [%r22 + 0x01ed]
cpu_intr_3_327:
	setx	0x41000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_181:
	mov	0x3c8, %r14
	.word 0xf2f384a0  ! 4346: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_3_328:
	setx	0x430308, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_178:
	mov	0x37, %r14
	.word 0xf0db8e60  ! 4348: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0x8995602f  ! 4350: WRPR_TICK_I	wrpr	%r21, 0x002f, %tick
	.word 0xfaa5a0d5  ! 4351: STWA_I	stwa	%r29, [%r22 + 0x00d5] %asi
iob_intr_3_348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_348), 16, 16)) -> intp(3, 0, 9)
	.word 0xf0a4c020  ! 4357: STWA_R	stwa	%r24, [%r19 + %r0] 0x01
	.word 0xfaf460b3  ! 4358: STXA_I	stxa	%r29, [%r17 + 0x00b3] %asi
	.word 0xb49dc000  ! 4359: XORcc_R	xorcc 	%r23, %r0, %r26
	.word 0xfc34e1b3  ! 4361: STH_I	sth	%r30, [%r19 + 0x01b3]
	.word 0xfe75c000  ! 4362: STX_R	stx	%r31, [%r23 + %r0]
	.word 0xfc3520c5  ! 4363: STH_I	sth	%r30, [%r20 + 0x00c5]
cpu_intr_3_329:
	setx	0x400104, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_330:
	setx	0x40013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_179:
	mov	0x20, %r14
	.word 0xfadb84a0  ! 4371: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_3_349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_349), 16, 16)) -> intp(3, 0, 26)
	.word 0xf02460cc  ! 4374: STW_I	stw	%r24, [%r17 + 0x00cc]
	.word 0xf0340000  ! 4376: STH_R	sth	%r24, [%r16 + %r0]
	.word 0xf8acc020  ! 4379: STBA_R	stba	%r28, [%r19 + %r0] 0x01
iob_intr_3_350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_350), 16, 16)) -> intp(3, 0, 2f)
iob_intr_3_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_351), 16, 16)) -> intp(3, 0, 28)
	.word 0xbc848000  ! 4386: ADDcc_R	addcc 	%r18, %r0, %r30
	.word 0xfe250000  ! 4387: STW_R	stw	%r31, [%r20 + %r0]
cpu_intr_3_331:
	setx	0x400331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf634219e  ! 4389: STH_I	sth	%r27, [%r16 + 0x019e]
cpu_intr_3_332:
	setx	0x410009, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_180:
	mov	0x3c7, %r14
	.word 0xf8db8e80  ! 4393: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_3_352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_352), 16, 16)) -> intp(3, 0, 38)
cpu_intr_3_333:
	setx	0x410316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe35a1d5  ! 4403: STH_I	sth	%r31, [%r22 + 0x01d5]
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_181:
	mov	0x6, %r14
	.word 0xfadb89e0  ! 4411: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T3_asi_reg_rd_182:
	mov	0xf, %r14
	.word 0xf8db8e40  ! 4416: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf4b48020  ! 4419: STHA_R	stha	%r26, [%r18 + %r0] 0x01
T3_asi_reg_rd_183:
	mov	0x3c2, %r14
	.word 0xf6db8e80  ! 4420: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf02461d8  ! 4423: STW_I	stw	%r24, [%r17 + 0x01d8]
	.word 0xbc04a109  ! 4428: ADD_I	add 	%r18, 0x0109, %r30
T3_asi_reg_rd_184:
	mov	0x3c6, %r14
	.word 0xf6db89e0  ! 4429: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_3_353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_353), 16, 16)) -> intp(3, 0, 36)
	.word 0xfaad614d  ! 4433: STBA_I	stba	%r29, [%r21 + 0x014d] %asi
	.word 0xf0a40020  ! 4436: STWA_R	stwa	%r24, [%r16 + %r0] 0x01
T3_asi_reg_wr_182:
	mov	0x10, %r14
	.word 0xfcf38e40  ! 4437: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0x8395e1ec  ! 4438: WRPR_TNPC_I	wrpr	%r23, 0x01ec, %tnpc
	.word 0xf0ac2031  ! 4442: STBA_I	stba	%r24, [%r16 + 0x0031] %asi
T3_asi_reg_rd_185:
	mov	0x8, %r14
	.word 0xf4db8e40  ! 4445: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_334:
	setx	0x420229, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x8f902002  ! 4453: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xb4a4a059  ! 4457: SUBcc_I	subcc 	%r18, 0x0059, %r26
	ta	T_CHANGE_TO_TL0
cpu_intr_3_335:
	setx	0x42022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a42080  ! 4464: STWA_I	stwa	%r26, [%r16 + 0x0080] %asi
	.word 0xfc248000  ! 4466: STW_R	stw	%r30, [%r18 + %r0]
	.word 0xba858000  ! 4467: ADDcc_R	addcc 	%r22, %r0, %r29
cpu_intr_3_336:
	setx	0x400324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8256153  ! 4471: STW_I	stw	%r28, [%r21 + 0x0153]
cpu_intr_3_337:
	setx	0x40001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf83520c0  ! 4473: STH_I	sth	%r28, [%r20 + 0x00c0]
cpu_intr_3_338:
	setx	0x42010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_183:
	mov	0x2c, %r14
	.word 0xf8f384a0  ! 4475: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xfa358000  ! 4477: STH_R	sth	%r29, [%r22 + %r0]
T3_asi_reg_wr_184:
	mov	0x3c1, %r14
	.word 0xfef38400  ! 4479: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xfeb50020  ! 4481: STHA_R	stha	%r31, [%r20 + %r0] 0x01
cpu_intr_3_339:
	setx	0x410018, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_340:
	setx	0x420021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa250000  ! 4484: STW_R	stw	%r29, [%r20 + %r0]
T3_asi_reg_wr_185:
	mov	0x14, %r14
	.word 0xfaf384a0  ! 4486: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T3_asi_reg_rd_186:
	mov	0x13, %r14
	.word 0xfcdb8e40  ! 4487: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_3_341:
	setx	0x41010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaac0020  ! 4489: STBA_R	stba	%r29, [%r16 + %r0] 0x01
iob_intr_3_354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_354), 16, 16)) -> intp(3, 0, 17)
T3_asi_reg_rd_187:
	mov	0x24, %r14
	.word 0xf4db8400  ! 4491: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T3_asi_reg_wr_186:
	mov	0x30, %r14
	.word 0xfaf38e40  ! 4492: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_3_342:
	setx	0x420321, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_188:
	mov	0x7, %r14
	.word 0xf6db84a0  ! 4495: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf0f4e1be  ! 4496: STXA_I	stxa	%r24, [%r19 + 0x01be] %asi
iob_intr_3_355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_355), 16, 16)) -> intp(3, 0, 28)
cpu_intr_3_343:
	setx	0x400305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82c21db  ! 4501: STB_I	stb	%r28, [%r16 + 0x01db]
	.word 0xbe04e143  ! 4502: ADD_I	add 	%r19, 0x0143, %r31
	.word 0xf8b58020  ! 4504: STHA_R	stha	%r28, [%r22 + %r0] 0x01
T3_asi_reg_wr_187:
	mov	0x3c5, %r14
	.word 0xfaf384a0  ! 4506: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xf6b40020  ! 4507: STHA_R	stha	%r27, [%r16 + %r0] 0x01
T3_asi_reg_wr_188:
	mov	0x3c6, %r14
	.word 0xf8f38400  ! 4510: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_3_344:
	setx	0x430114, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_356), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_rd_189:
	mov	0x3c5, %r14
	.word 0xfadb8e40  ! 4513: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_3_345:
	setx	0x40001a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_190:
	mov	0x3c6, %r14
	.word 0xfcdb8400  ! 4515: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf035201c  ! 4517: STH_I	sth	%r24, [%r20 + 0x001c]
	.word 0xba94619d  ! 4518: ORcc_I	orcc 	%r17, 0x019d, %r29
iob_intr_3_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_357), 16, 16)) -> intp(3, 0, 1c)
	.word 0xfe74610a  ! 4525: STX_I	stx	%r31, [%r17 + 0x010a]
cpu_intr_3_346:
	setx	0x42020e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_347:
	setx	0x40031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab58020  ! 4530: STHA_R	stha	%r29, [%r22 + %r0] 0x01
T3_asi_reg_rd_191:
	mov	0x17, %r14
	.word 0xf8db8e60  ! 4533: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T3_asi_reg_rd_192:
	mov	0x1e, %r14
	.word 0xf0db8e40  ! 4540: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_3_348:
	setx	0x430202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22c61a7  ! 4543: STB_I	stb	%r25, [%r17 + 0x01a7]
cpu_intr_3_349:
	setx	0x410013, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_193:
	mov	0x3c1, %r14
	.word 0xf2db89e0  ! 4548: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xfeac6190  ! 4551: STBA_I	stba	%r31, [%r17 + 0x0190] %asi
	.word 0xba8de121  ! 4553: ANDcc_I	andcc 	%r23, 0x0121, %r29
iob_intr_3_358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_358), 16, 16)) -> intp(3, 0, 31)
	.word 0xf82c6188  ! 4556: STB_I	stb	%r28, [%r17 + 0x0188]
T3_asi_reg_wr_189:
	mov	0x11, %r14
	.word 0xf6f38e40  ! 4557: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_350:
	setx	0x400334, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_351:
	setx	0x420308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe250000  ! 4565: STW_R	stw	%r31, [%r20 + %r0]
iob_intr_3_359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_359), 16, 16)) -> intp(3, 0, a)
	.word 0xf0f421de  ! 4567: STXA_I	stxa	%r24, [%r16 + 0x01de] %asi
T3_asi_reg_wr_190:
	mov	0x25, %r14
	.word 0xfef389e0  ! 4569: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_3_352:
	setx	0x43032e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_353:
	setx	0x41030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb614a0ac  ! 4573: OR_I	or 	%r18, 0x00ac, %r27
iob_intr_3_360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_360), 16, 16)) -> intp(3, 0, 2a)
iob_intr_3_361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_361), 16, 16)) -> intp(3, 0, 25)
iob_intr_3_362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_362), 16, 16)) -> intp(3, 0, 3f)
iob_intr_3_363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_363), 16, 16)) -> intp(3, 0, 18)
	.word 0xf0a5c020  ! 4583: STWA_R	stwa	%r24, [%r23 + %r0] 0x01
cpu_intr_3_354:
	setx	0x42013b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_364), 16, 16)) -> intp(3, 0, 15)
cpu_intr_3_355:
	setx	0x43001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe344000  ! 4590: ORN_R	orn 	%r17, %r0, %r31
	.word 0xb61da05f  ! 4594: XOR_I	xor 	%r22, 0x005f, %r27
T3_asi_reg_wr_191:
	mov	0x33, %r14
	.word 0xfcf38e60  ! 4599: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xba3ca028  ! 4600: XNOR_I	xnor 	%r18, 0x0028, %r29
cpu_intr_3_356:
	setx	0x410018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2752009  ! 4603: STX_I	stx	%r25, [%r20 + 0x0009]
	.word 0xf6ac8020  ! 4604: STBA_R	stba	%r27, [%r18 + %r0] 0x01
	.word 0xf4342084  ! 4605: STH_I	sth	%r26, [%r16 + 0x0084]
iob_intr_3_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_365), 16, 16)) -> intp(3, 0, 25)
cpu_intr_3_357:
	setx	0x45013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b54020  ! 4613: STHA_R	stha	%r24, [%r21 + %r0] 0x01
T3_asi_reg_rd_194:
	mov	0x3c5, %r14
	.word 0xf2db8e60  ! 4614: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_3_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_366), 16, 16)) -> intp(3, 0, 30)
T3_asi_reg_wr_192:
	mov	0x3c5, %r14
	.word 0xfcf38e60  ! 4616: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T3_asi_reg_rd_195:
	mov	0x33, %r14
	.word 0xf4db8e80  ! 4619: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T3_asi_reg_wr_193:
	mov	0x3c5, %r14
	.word 0xf0f38400  ! 4620: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T3_asi_reg_rd_196:
	mov	0x3c2, %r14
	.word 0xf6db8e60  ! 4621: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf2a4a134  ! 4625: STWA_I	stwa	%r25, [%r18 + 0x0134] %asi
	.word 0xb4b421ec  ! 4626: SUBCcc_I	orncc 	%r16, 0x01ec, %r26
T3_asi_reg_rd_197:
	mov	0x3c8, %r14
	.word 0xf6db8e40  ! 4628: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983e10  ! 4629: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e10, %hpstate
	.word 0xfa246070  ! 4632: STW_I	stw	%r29, [%r17 + 0x0070]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_358:
	setx	0x470113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_367), 16, 16)) -> intp(3, 0, 5)
iob_intr_3_368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_368), 16, 16)) -> intp(3, 0, 32)
cpu_intr_3_359:
	setx	0x440339, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_194:
	mov	0x3c0, %r14
	.word 0xf0f38e60  ! 4641: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_3_369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_369), 16, 16)) -> intp(3, 0, 9)
	.word 0xf42d8000  ! 4643: STB_R	stb	%r26, [%r22 + %r0]
	.word 0xbb2c2001  ! 4645: SLL_I	sll 	%r16, 0x0001, %r29
T3_asi_reg_wr_195:
	mov	0x23, %r14
	.word 0xf0f38e40  ! 4649: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf0ad8020  ! 4650: STBA_R	stba	%r24, [%r22 + %r0] 0x01
	.word 0xf825e063  ! 4652: STW_I	stw	%r28, [%r23 + 0x0063]
T3_asi_reg_rd_198:
	mov	0x8, %r14
	.word 0xfadb89e0  ! 4653: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf6752105  ! 4655: STX_I	stx	%r27, [%r20 + 0x0105]
iob_intr_3_370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_370), 16, 16)) -> intp(3, 0, 31)
	.word 0xb9518000  ! 4664: RDPR_PSTATE	rdpr	%pstate, %r28
	.word 0xfa256071  ! 4667: STW_I	stw	%r29, [%r21 + 0x0071]
	.word 0xf62dc000  ! 4668: STB_R	stb	%r27, [%r23 + %r0]
	.word 0xfa2ca119  ! 4669: STB_I	stb	%r29, [%r18 + 0x0119]
	.word 0xb7641800  ! 4670: MOVcc_R	<illegal instruction>
T3_asi_reg_rd_199:
	mov	0x1b, %r14
	.word 0xf2db84a0  ! 4673: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf6ad6191  ! 4674: STBA_I	stba	%r27, [%r21 + 0x0191] %asi
	.word 0xb1641800  ! 4678: MOVcc_R	<illegal instruction>
T3_asi_reg_wr_196:
	mov	0x33, %r14
	.word 0xf0f389e0  ! 4680: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_3_360:
	setx	0x44011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8250000  ! 4683: STW_R	stw	%r28, [%r20 + %r0]
iob_intr_3_371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_371), 16, 16)) -> intp(3, 0, 23)
iob_intr_3_372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_372), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_wr_197:
	mov	0x3c5, %r14
	.word 0xfaf38e60  ! 4690: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_3_361:
	setx	0x440004, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_198:
	mov	0x12, %r14
	.word 0xfef38400  ! 4692: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xfe25a02c  ! 4693: STW_I	stw	%r31, [%r22 + 0x002c]
	.word 0xf0f52004  ! 4695: STXA_I	stxa	%r24, [%r20 + 0x0004] %asi
T3_asi_reg_wr_199:
	mov	0x1e, %r14
	.word 0xf0f384a0  ! 4697: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xfeacc020  ! 4698: STBA_R	stba	%r31, [%r19 + %r0] 0x01
T3_asi_reg_wr_200:
	mov	0x5, %r14
	.word 0xfaf38e80  ! 4701: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0x8394e167  ! 4704: WRPR_TNPC_I	wrpr	%r19, 0x0167, %tnpc
cpu_intr_3_362:
	setx	0x46000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf03420e8  ! 4713: STH_I	sth	%r24, [%r16 + 0x00e8]
	.word 0xfe75c000  ! 4714: STX_R	stx	%r31, [%r23 + %r0]
	.word 0xf6740000  ! 4715: STX_R	stx	%r27, [%r16 + %r0]
cpu_intr_3_363:
	setx	0x450332, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_201:
	mov	0x2b, %r14
	.word 0xfef38e60  ! 4726: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfa742076  ! 4728: STX_I	stx	%r29, [%r16 + 0x0076]
iob_intr_3_373:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_373), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf6ad4020  ! 4733: STBA_R	stba	%r27, [%r21 + %r0] 0x01
	.word 0xf0a40020  ! 4736: STWA_R	stwa	%r24, [%r16 + %r0] 0x01
cpu_intr_3_364:
	setx	0x460327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8394e0b5  ! 4739: WRPR_TNPC_I	wrpr	%r19, 0x00b5, %tnpc
iob_intr_3_374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_374), 16, 16)) -> intp(3, 0, 20)
	.word 0xf0b4619c  ! 4741: STHA_I	stha	%r24, [%r17 + 0x019c] %asi
T3_asi_reg_rd_200:
	mov	0x3c2, %r14
	.word 0xfcdb8e60  ! 4744: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_3_375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_375), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_wr_202:
	mov	0x3c6, %r14
	.word 0xfcf38e40  ! 4746: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL0
cpu_intr_3_365:
	setx	0x450127, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf0b420c4  ! 4754: STHA_I	stha	%r24, [%r16 + 0x00c4] %asi
	.word 0xb69d0000  ! 4757: XORcc_R	xorcc 	%r20, %r0, %r27
	.word 0xf235c000  ! 4758: STH_R	sth	%r25, [%r23 + %r0]
T3_asi_reg_wr_203:
	mov	0x2f, %r14
	.word 0xf8f38e40  ! 4763: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T3_asi_reg_wr_204:
	mov	0xe, %r14
	.word 0xfcf38e80  ! 4766: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf4b4a1a3  ! 4768: STHA_I	stha	%r26, [%r18 + 0x01a3] %asi
	.word 0xf43521e9  ! 4770: STH_I	sth	%r26, [%r20 + 0x01e9]
	.word 0xf2ade137  ! 4772: STBA_I	stba	%r25, [%r23 + 0x0137] %asi
	.word 0xf0a4212f  ! 4775: STWA_I	stwa	%r24, [%r16 + 0x012f] %asi
	.word 0xbe3c0000  ! 4776: XNOR_R	xnor 	%r16, %r0, %r31
	.word 0xfc24208c  ! 4779: STW_I	stw	%r30, [%r16 + 0x008c]
	.word 0xf62da029  ! 4781: STB_I	stb	%r27, [%r22 + 0x0029]
	.word 0xf8254000  ! 4782: STW_R	stw	%r28, [%r21 + %r0]
	.word 0xfa2c8000  ! 4783: STB_R	stb	%r29, [%r18 + %r0]
iob_intr_3_376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_376), 16, 16)) -> intp(3, 0, 6)
	.word 0xb735b001  ! 4788: SRLX_I	srlx	%r22, 0x0001, %r27
cpu_intr_3_366:
	setx	0x45011e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_377:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_377), 16, 16)) -> intp(3, 0, 39)
T3_asi_reg_rd_201:
	mov	0x36, %r14
	.word 0xf6db84a0  ! 4791: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_3_367:
	setx	0x44033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf625e067  ! 4796: STW_I	stw	%r27, [%r23 + 0x0067]
T3_asi_reg_wr_205:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 4797: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_3_368:
	setx	0x460021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b520a0  ! 4801: STHA_I	stha	%r28, [%r20 + 0x00a0] %asi
	.word 0xbb351000  ! 4802: SRLX_R	srlx	%r20, %r0, %r29
T3_asi_reg_wr_206:
	mov	0x3c3, %r14
	.word 0xf8f38e60  ! 4803: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf034e129  ! 4805: STH_I	sth	%r24, [%r19 + 0x0129]
	.word 0xfa2c61bd  ! 4809: STB_I	stb	%r29, [%r17 + 0x01bd]
T3_asi_reg_rd_202:
	mov	0xa, %r14
	.word 0xf2db8400  ! 4810: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xfa24e06b  ! 4814: STW_I	stw	%r29, [%r19 + 0x006b]
T3_asi_reg_wr_207:
	mov	0xb, %r14
	.word 0xf0f38e40  ! 4816: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_378:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_378), 16, 16)) -> intp(3, 0, 10)
	ta	T_CHANGE_HPRIV
	.word 0xf8244000  ! 4821: STW_R	stw	%r28, [%r17 + %r0]
T3_asi_reg_rd_203:
	mov	0x3c1, %r14
	.word 0xf6db8400  ! 4822: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T3_asi_reg_wr_208:
	mov	0x3c0, %r14
	.word 0xf6f389e0  ! 4823: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_3_379:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_379), 16, 16)) -> intp(3, 0, 39)
	.word 0xb43d4000  ! 4827: XNOR_R	xnor 	%r21, %r0, %r26
T3_asi_reg_wr_209:
	mov	0x9, %r14
	.word 0xf6f389e0  ! 4829: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_3_380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_380), 16, 16)) -> intp(3, 0, 22)
T3_asi_reg_rd_204:
	mov	0xf, %r14
	.word 0xfcdb8400  ! 4835: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb7504000  ! 4837: RDPR_TNPC	rdpr	%tnpc, %r27
iob_intr_3_381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_381), 16, 16)) -> intp(3, 0, 36)
	.word 0xfaa42086  ! 4839: STWA_I	stwa	%r29, [%r16 + 0x0086] %asi
	.word 0xfea42184  ! 4840: STWA_I	stwa	%r31, [%r16 + 0x0184] %asi
	.word 0xf234201c  ! 4843: STH_I	sth	%r25, [%r16 + 0x001c]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
	.word 0xfa24c000  ! 4847: STW_R	stw	%r29, [%r19 + %r0]
	.word 0xf024604a  ! 4853: STW_I	stw	%r24, [%r17 + 0x004a]
T3_asi_reg_rd_205:
	mov	0x3c8, %r14
	.word 0xf6db8e40  ! 4862: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_369:
	setx	0x470126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb58020  ! 4867: STHA_R	stha	%r31, [%r22 + %r0] 0x01
T3_asi_reg_rd_206:
	mov	0xa, %r14
	.word 0xfcdb8e40  ! 4868: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_rd_207:
	mov	0x2f, %r14
	.word 0xf0db8e40  ! 4871: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_3_370:
	setx	0x440006, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_208:
	mov	0x15, %r14
	.word 0xfcdb8400  ! 4876: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T3_asi_reg_wr_210:
	mov	0x19, %r14
	.word 0xfaf38400  ! 4878: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xfc74a02c  ! 4882: STX_I	stx	%r30, [%r18 + 0x002c]
cpu_intr_3_371:
	setx	0x45021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb5a062  ! 4886: STHA_I	stha	%r31, [%r22 + 0x0062] %asi
	.word 0xfead6019  ! 4891: STBA_I	stba	%r31, [%r21 + 0x0019] %asi
	.word 0xfe358000  ! 4892: STH_R	sth	%r31, [%r22 + %r0]
iob_intr_3_382:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_382), 16, 16)) -> intp(3, 0, 14)
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983a18  ! 4897: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a18, %hpstate
	.word 0xb4b52036  ! 4900: SUBCcc_I	orncc 	%r20, 0x0036, %r26
iob_intr_3_383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_383), 16, 16)) -> intp(3, 0, 33)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf22520e1  ! 4904: STW_I	stw	%r25, [%r20 + 0x00e1]
	.word 0xb53c5000  ! 4906: SRAX_R	srax	%r17, %r0, %r26
iob_intr_3_384:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_384), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf02c4000  ! 4909: STB_R	stb	%r24, [%r17 + %r0]
	.word 0xf0a54020  ! 4910: STWA_R	stwa	%r24, [%r21 + %r0] 0x01
T3_asi_reg_rd_209:
	mov	0x15, %r14
	.word 0xfadb8e40  ! 4913: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_rd_210:
	mov	0x3c5, %r14
	.word 0xfedb89e0  ! 4915: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_3_372:
	setx	0x440309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4c5e1b7  ! 4917: ADDCcc_I	addccc 	%r23, 0x01b7, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6ad0020  ! 4925: STBA_R	stba	%r27, [%r20 + %r0] 0x01
iob_intr_3_385:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_385), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_373:
	setx	0x46012a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_386:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_386), 16, 16)) -> intp(3, 0, 33)
cpu_intr_3_374:
	setx	0x46030c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_387:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_387), 16, 16)) -> intp(3, 0, 36)
T3_asi_reg_wr_211:
	mov	0x1f, %r14
	.word 0xfaf389e0  ! 4938: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xfcaca145  ! 4939: STBA_I	stba	%r30, [%r18 + 0x0145] %asi
iob_intr_3_388:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_388), 16, 16)) -> intp(3, 0, 21)
	.word 0xf8756004  ! 4941: STX_I	stx	%r28, [%r21 + 0x0004]
	.word 0xfca48020  ! 4942: STWA_R	stwa	%r30, [%r18 + %r0] 0x01
cpu_intr_3_375:
	setx	0x460038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_389:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_389), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_rd_211:
	mov	0x3c4, %r14
	.word 0xfcdb84a0  ! 4947: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb52dc000  ! 4950: SLL_R	sll 	%r23, %r0, %r26
iob_intr_3_390:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_390), 16, 16)) -> intp(3, 0, 6)
	.word 0xf4ace102  ! 4952: STBA_I	stba	%r26, [%r19 + 0x0102] %asi
	.word 0xf4b5c020  ! 4953: STHA_R	stha	%r26, [%r23 + %r0] 0x01
T3_asi_reg_wr_212:
	mov	0x15, %r14
	.word 0xf8f38e60  ! 4958: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf8aca10c  ! 4960: STBA_I	stba	%r28, [%r18 + 0x010c] %asi
cpu_intr_3_376:
	setx	0x440100, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_391:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_391), 16, 16)) -> intp(3, 0, 2e)
iob_intr_3_392:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_392), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_wr_213:
	mov	0x3c1, %r14
	.word 0xf2f38400  ! 4968: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_3_377:
	setx	0x440332, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_214:
	mov	0x23, %r14
	.word 0xfaf38400  ! 4973: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_3_393:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_393), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf0340000  ! 4977: STH_R	sth	%r24, [%r16 + %r0]
	.word 0xf6358000  ! 4980: STH_R	sth	%r27, [%r22 + %r0]
	.word 0xfea4a083  ! 4981: STWA_I	stwa	%r31, [%r18 + 0x0083] %asi
cpu_intr_3_378:
	setx	0x440201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0f5e1a5  ! 4985: STXA_I	stxa	%r24, [%r23 + 0x01a5] %asi
iob_intr_3_394:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_394), 16, 16)) -> intp(3, 0, c)
	.word 0xfeb5e189  ! 4988: STHA_I	stha	%r31, [%r23 + 0x0189] %asi
	.word 0xf0b4e0c5  ! 4989: STHA_I	stha	%r24, [%r19 + 0x00c5] %asi
T3_asi_reg_wr_215:
	mov	0x3c4, %r14
	.word 0xf0f38e40  ! 4991: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T3_asi_reg_rd_212:
	mov	0x16, %r14
	.word 0xf2db8e60  ! 4993: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
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
	.word 0xb80d8000  ! 3: AND_R	and 	%r22, %r0, %r28
T2_asi_reg_rd_0:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 5: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_rd_1:
	mov	0x19, %r14
	.word 0xf0db8e80  ! 8: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_2_0:
	setx	0x1f0227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfccc204b  ! 11: LDSBA_I	ldsba	[%r16, + 0x004b] %asi, %r30
cpu_intr_2_1:
	setx	0x1d022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf015609c  ! 15: LDUH_I	lduh	[%r21 + 0x009c], %r24
	.word 0xf6c42161  ! 16: LDSWA_I	ldswa	[%r16, + 0x0161] %asi, %r27
	ta	T_CHANGE_TO_TL0
	.word 0xbf2c1000  ! 19: SLLX_R	sllx	%r16, %r0, %r31
cpu_intr_2_2:
	setx	0x1d0001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb357001  ! 21: SRLX_I	srlx	%r21, 0x0001, %r29
cpu_intr_2_3:
	setx	0x1c0108, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_0), 16, 16)) -> intp(2, 0, 8)
	.word 0xbc8c21aa  ! 26: ANDcc_I	andcc 	%r16, 0x01aa, %r30
	.word 0xf6044000  ! 29: LDUW_R	lduw	[%r17 + %r0], %r27
cpu_intr_2_4:
	setx	0x1d032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_2:
	mov	0x13, %r14
	.word 0xf8db8e80  ! 38: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_2_5:
	setx	0x1f0032, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_6:
	setx	0x1d0233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba0cc000  ! 53: AND_R	and 	%r19, %r0, %r29
	.word 0xfa540000  ! 55: LDSH_R	ldsh	[%r16 + %r0], %r29
T2_asi_reg_wr_0:
	mov	0x1c, %r14
	.word 0xf2f38400  ! 57: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xfed54020  ! 60: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r31
	.word 0xf655e118  ! 62: LDSH_I	ldsh	[%r23 + 0x0118], %r27
iob_intr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_1), 16, 16)) -> intp(2, 0, 2a)
T2_asi_reg_rd_3:
	mov	0x4, %r14
	.word 0xf4db8e40  ! 67: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf6ccc020  ! 68: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r27
	.word 0xfe948020  ! 69: LDUHA_R	lduha	[%r18, %r0] 0x01, %r31
T2_asi_reg_wr_1:
	mov	0x3c0, %r14
	.word 0xf0f38e40  ! 73: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_wr_2:
	mov	0x3c8, %r14
	.word 0xfef389e0  ! 74: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf045a031  ! 75: LDSW_I	ldsw	[%r22 + 0x0031], %r24
	.word 0xf60dc000  ! 76: LDUB_R	ldub	[%r23 + %r0], %r27
iob_intr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_2), 16, 16)) -> intp(2, 0, 39)
	.word 0xfe0ce04e  ! 78: LDUB_I	ldub	[%r19 + 0x004e], %r31
cpu_intr_2_7:
	setx	0x1d0100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba1da0c4  ! 82: XOR_I	xor 	%r22, 0x00c4, %r29
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_4:
	mov	0x3c0, %r14
	.word 0xf0db8e40  ! 84: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_8:
	setx	0x1f012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xfe15e0c4  ! 90: LDUH_I	lduh	[%r23 + 0x00c4], %r31
iob_intr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_3), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_wr_3:
	mov	0x13, %r14
	.word 0xf0f38400  ! 100: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_2_9:
	setx	0x1c0107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa052078  ! 105: LDUW_I	lduw	[%r20 + 0x0078], %r29
	.word 0xbf347001  ! 107: SRLX_I	srlx	%r17, 0x0001, %r31
	.word 0xf0040000  ! 108: LDUW_R	lduw	[%r16 + %r0], %r24
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_4:
	mov	0x2b, %r14
	.word 0xfaf38e80  ! 117: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_2_10:
	setx	0x1f0104, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_5:
	mov	0x26, %r14
	.word 0xf2db8e40  ! 121: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb1641800  ! 123: MOVcc_R	<illegal instruction>
	.word 0xf40c2092  ! 124: LDUB_I	ldub	[%r16 + 0x0092], %r26
cpu_intr_2_11:
	setx	0x1c023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf085210b  ! 127: LDUWA_I	lduwa	[%r20, + 0x010b] %asi, %r24
cpu_intr_2_12:
	setx	0x1c023f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_4), 16, 16)) -> intp(2, 0, 3d)
iob_intr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_5), 16, 16)) -> intp(2, 0, a)
	.word 0xf814a1b0  ! 135: LDUH_I	lduh	[%r18 + 0x01b0], %r28
T2_asi_reg_rd_6:
	mov	0x1f, %r14
	.word 0xf8db89e0  ! 136: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_2_13:
	setx	0x1d0332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0ca188  ! 139: LDUB_I	ldub	[%r18 + 0x0188], %r31
iob_intr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_6), 16, 16)) -> intp(2, 0, 0)
	.word 0xfc85c020  ! 141: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r30
T2_asi_reg_rd_7:
	mov	0x38, %r14
	.word 0xf4db8e60  ! 142: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_2_14:
	setx	0x1f0329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc040000  ! 151: LDUW_R	lduw	[%r16 + %r0], %r30
cpu_intr_2_15:
	setx	0x1d0113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0ca02b  ! 158: LDUB_I	ldub	[%r18 + 0x002b], %r31
	.word 0xf80c8000  ! 159: LDUB_R	ldub	[%r18 + %r0], %r28
	.word 0xf28de1ec  ! 160: LDUBA_I	lduba	[%r23, + 0x01ec] %asi, %r25
	.word 0xfa550000  ! 161: LDSH_R	ldsh	[%r20 + %r0], %r29
T2_asi_reg_rd_8:
	mov	0x7, %r14
	.word 0xf0db89e0  ! 162: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf25461f8  ! 163: LDSH_I	ldsh	[%r17 + 0x01f8], %r25
	.word 0xb2b5a1db  ! 164: ORNcc_I	orncc 	%r22, 0x01db, %r25
T2_asi_reg_rd_9:
	mov	0x3c3, %r14
	.word 0xf0db84a0  ! 167: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T2_asi_reg_rd_10:
	mov	0x29, %r14
	.word 0xfadb8e40  ! 169: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfed58020  ! 170: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r31
	.word 0xb33d8000  ! 176: SRA_R	sra 	%r22, %r0, %r25
cpu_intr_2_16:
	setx	0x1f012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d50020  ! 178: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r25
iob_intr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_7), 16, 16)) -> intp(2, 0, 2c)
	.word 0xb7356001  ! 180: SRL_I	srl 	%r21, 0x0001, %r27
T2_asi_reg_wr_5:
	mov	0x23, %r14
	.word 0xfaf384a0  ! 182: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_8), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf8cc8020  ! 189: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r28
	.word 0xbe9461d9  ! 190: ORcc_I	orcc 	%r17, 0x01d9, %r31
iob_intr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_9), 16, 16)) -> intp(2, 0, 8)
T2_asi_reg_wr_6:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 197: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf0448000  ! 201: LDSW_R	ldsw	[%r18 + %r0], %r24
	.word 0xfe4d211c  ! 202: LDSB_I	ldsb	[%r20 + 0x011c], %r31
	.word 0xf645601a  ! 204: LDSW_I	ldsw	[%r21 + 0x001a], %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb235c000  ! 208: ORN_R	orn 	%r23, %r0, %r25
cpu_intr_2_17:
	setx	0x1f030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf00d4000  ! 212: LDUB_R	ldub	[%r21 + %r0], %r24
cpu_intr_2_18:
	setx	0x1e023c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_11:
	mov	0x15, %r14
	.word 0xfedb84a0  ! 216: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbd353001  ! 219: SRLX_I	srlx	%r20, 0x0001, %r30
	.word 0xfc84a103  ! 220: LDUWA_I	lduwa	[%r18, + 0x0103] %asi, %r30
T2_asi_reg_wr_7:
	mov	0x37, %r14
	.word 0xf0f38e80  ! 221: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_10), 16, 16)) -> intp(2, 0, 30)
iob_intr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_11), 16, 16)) -> intp(2, 0, 3b)
T2_asi_reg_wr_8:
	mov	0xe, %r14
	.word 0xf4f38e60  ! 226: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xfa94e12c  ! 227: LDUHA_I	lduha	[%r19, + 0x012c] %asi, %r29
iob_intr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_12), 16, 16)) -> intp(2, 0, 14)
	.word 0xfa0d6088  ! 231: LDUB_I	ldub	[%r21 + 0x0088], %r29
	.word 0xf6d5e107  ! 232: LDSHA_I	ldsha	[%r23, + 0x0107] %asi, %r27
	.word 0xf0152018  ! 234: LDUH_I	lduh	[%r20 + 0x0018], %r24
	.word 0xfa8da102  ! 235: LDUBA_I	lduba	[%r22, + 0x0102] %asi, %r29
	.word 0xf685c020  ! 237: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r27
	.word 0xf88c8020  ! 238: LDUBA_R	lduba	[%r18, %r0] 0x01, %r28
	.word 0xfcd48020  ! 239: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r30
iob_intr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_13), 16, 16)) -> intp(2, 0, 2e)
	.word 0xfc050000  ! 242: LDUW_R	lduw	[%r20 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_19:
	setx	0x1f0009, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_20:
	setx	0x1d0120, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_9:
	mov	0x3c2, %r14
	.word 0xf6f389e0  ! 248: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T2_asi_reg_wr_10:
	mov	0x2b, %r14
	.word 0xfcf384a0  ! 249: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfcc5a14d  ! 250: LDSWA_I	ldswa	[%r22, + 0x014d] %asi, %r30
cpu_intr_2_21:
	setx	0x1d0314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfed5e1f3  ! 253: LDSHA_I	ldsha	[%r23, + 0x01f3] %asi, %r31
iob_intr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_14), 16, 16)) -> intp(2, 0, 3e)
	.word 0xfacd2028  ! 258: LDSBA_I	ldsba	[%r20, + 0x0028] %asi, %r29
T2_asi_reg_wr_11:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 259: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfed5c020  ! 260: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r31
iob_intr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_15), 16, 16)) -> intp(2, 0, 2e)
	.word 0xbb3c4000  ! 263: SRA_R	sra 	%r17, %r0, %r29
	ta	T_CHANGE_TO_TL0
	.word 0xf0840020  ! 265: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r24
	.word 0xf044203a  ! 266: LDSW_I	ldsw	[%r16 + 0x003a], %r24
iob_intr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_16), 16, 16)) -> intp(2, 0, 17)
iob_intr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_17), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf255e0c4  ! 275: LDSH_I	ldsh	[%r23 + 0x00c4], %r25
	.word 0xf8d4e0f8  ! 276: LDSHA_I	ldsha	[%r19, + 0x00f8] %asi, %r28
	.word 0xb1510000  ! 279: RDPR_TICK	<illegal instruction>
	.word 0xf2dd61e1  ! 280: LDXA_I	ldxa	[%r21, + 0x01e1] %asi, %r25
iob_intr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_18), 16, 16)) -> intp(2, 0, e)
iob_intr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_19), 16, 16)) -> intp(2, 0, 3)
	.word 0xf6148000  ! 283: LDUH_R	lduh	[%r18 + %r0], %r27
T2_asi_reg_rd_12:
	mov	0x2c, %r14
	.word 0xf0db8e40  ! 284: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf4442114  ! 286: LDSW_I	ldsw	[%r16 + 0x0114], %r26
	.word 0xb89c0000  ! 294: XORcc_R	xorcc 	%r16, %r0, %r28
	.word 0xbf353001  ! 296: SRLX_I	srlx	%r20, 0x0001, %r31
	.word 0xfe8d6085  ! 297: LDUBA_I	lduba	[%r21, + 0x0085] %asi, %r31
	.word 0xf8ccc020  ! 298: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r28
	.word 0xfadca132  ! 301: LDXA_I	ldxa	[%r18, + 0x0132] %asi, %r29
cpu_intr_2_22:
	setx	0x1f0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88c0020  ! 303: LDUBA_R	lduba	[%r16, %r0] 0x01, %r28
	.word 0xf0d54020  ! 304: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r24
	ta	T_CHANGE_TO_TL1
	.word 0xfc94e0ed  ! 313: LDUHA_I	lduha	[%r19, + 0x00ed] %asi, %r30
	.word 0xfedc2092  ! 315: LDXA_I	ldxa	[%r16, + 0x0092] %asi, %r31
	.word 0xf6dda07b  ! 324: LDXA_I	ldxa	[%r22, + 0x007b] %asi, %r27
	.word 0xf8c58020  ! 325: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r28
T2_asi_reg_rd_13:
	mov	0x26, %r14
	.word 0xf4db89e0  ! 326: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_20), 16, 16)) -> intp(2, 0, 32)
	ta	T_CHANGE_TO_TL1
iob_intr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_21), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_rd_14:
	mov	0x35, %r14
	.word 0xf2db8e40  ! 340: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_2_23:
	setx	0x1d0339, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982c1a  ! 342: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c1a, %hpstate
cpu_intr_2_24:
	setx	0x1f020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa840020  ! 345: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r29
	.word 0xf44c8000  ! 347: LDSB_R	ldsb	[%r18 + %r0], %r26
	.word 0xf80cc000  ! 349: LDUB_R	ldub	[%r19 + %r0], %r28
	.word 0xf2c5c020  ! 351: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r25
	.word 0xb4858000  ! 352: ADDcc_R	addcc 	%r22, %r0, %r26
iob_intr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_22), 16, 16)) -> intp(2, 0, 3c)
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
iob_intr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_23), 16, 16)) -> intp(2, 0, 6)
cpu_intr_2_25:
	setx	0x1c011f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_24), 16, 16)) -> intp(2, 0, 2)
	ta	T_CHANGE_NONHPRIV
	.word 0xb32c4000  ! 368: SLL_R	sll 	%r17, %r0, %r25
T2_asi_reg_wr_12:
	mov	0x3c8, %r14
	.word 0xf2f38400  ! 369: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_2_26:
	setx	0x1d032a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_25), 16, 16)) -> intp(2, 0, 23)
T2_asi_reg_rd_15:
	mov	0x3c3, %r14
	.word 0xf4db84a0  ! 374: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf4144000  ! 376: LDUH_R	lduh	[%r17 + %r0], %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_rd_16:
	mov	0x30, %r14
	.word 0xf2db89e0  ! 380: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbe1dc000  ! 383: XOR_R	xor 	%r23, %r0, %r31
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982ed8  ! 384: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed8, %hpstate
	.word 0xfe444000  ! 385: LDSW_R	ldsw	[%r17 + %r0], %r31
	.word 0xbf34d000  ! 386: SRLX_R	srlx	%r19, %r0, %r31
	.word 0xf6cdc020  ! 387: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r27
T2_asi_reg_wr_13:
	mov	0x3c8, %r14
	.word 0xfaf389e0  ! 391: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf6d420e9  ! 393: LDSHA_I	ldsha	[%r16, + 0x00e9] %asi, %r27
cpu_intr_2_27:
	setx	0x1e0027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec5c020  ! 398: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r31
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
iob_intr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_26), 16, 16)) -> intp(2, 0, 2e)
	.word 0xb815212b  ! 409: OR_I	or 	%r20, 0x012b, %r28
	.word 0xb17c2401  ! 410: MOVR_I	movre	%r16, 0x1, %r24
	.word 0xf0c4a104  ! 411: LDSWA_I	ldswa	[%r18, + 0x0104] %asi, %r24
cpu_intr_2_28:
	setx	0x1d0117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfadda171  ! 418: LDXA_I	ldxa	[%r22, + 0x0171] %asi, %r29
	.word 0xf68d2192  ! 420: LDUBA_I	lduba	[%r20, + 0x0192] %asi, %r27
	.word 0xf2944020  ! 422: LDUHA_R	lduha	[%r17, %r0] 0x01, %r25
cpu_intr_2_29:
	setx	0x1d0331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44da1ec  ! 424: LDSB_I	ldsb	[%r22 + 0x01ec], %r26
	ta	T_CHANGE_NONHPRIV
iob_intr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_27), 16, 16)) -> intp(2, 0, 18)
	.word 0xf8058000  ! 431: LDUW_R	lduw	[%r22 + %r0], %r28
	.word 0xb5520000  ! 432: RDPR_PIL	<illegal instruction>
	.word 0xfed4e10a  ! 433: LDSHA_I	ldsha	[%r19, + 0x010a] %asi, %r31
cpu_intr_2_30:
	setx	0x1d0316, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_17:
	mov	0x29, %r14
	.word 0xf8db89e0  ! 442: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T2_asi_reg_rd_18:
	mov	0x30, %r14
	.word 0xfcdb89e0  ! 443: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_28), 16, 16)) -> intp(2, 0, 11)
cpu_intr_2_31:
	setx	0x1c0301, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_29), 16, 16)) -> intp(2, 0, 37)
cpu_intr_2_32:
	setx	0x1f001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfccd6077  ! 454: LDSBA_I	ldsba	[%r21, + 0x0077] %asi, %r30
	.word 0xfac4e10b  ! 456: LDSWA_I	ldswa	[%r19, + 0x010b] %asi, %r29
T2_asi_reg_wr_14:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 457: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_30), 16, 16)) -> intp(2, 0, b)
	.word 0xf0c5e05a  ! 462: LDSWA_I	ldswa	[%r23, + 0x005a] %asi, %r24
	.word 0xf015610f  ! 463: LDUH_I	lduh	[%r21 + 0x010f], %r24
iob_intr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_31), 16, 16)) -> intp(2, 0, 21)
iob_intr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_32), 16, 16)) -> intp(2, 0, 16)
	.word 0xfc94c020  ! 473: LDUHA_R	lduha	[%r19, %r0] 0x01, %r30
T2_asi_reg_wr_15:
	mov	0x3c3, %r14
	.word 0xf8f38e40  ! 474: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_2_33:
	setx	0x220206, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf284a1c4  ! 483: LDUWA_I	lduwa	[%r18, + 0x01c4] %asi, %r25
T2_asi_reg_rd_19:
	mov	0x9, %r14
	.word 0xf8db8e60  ! 484: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983988  ! 487: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1988, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4c521a8  ! 493: LDSWA_I	ldswa	[%r20, + 0x01a8] %asi, %r26
iob_intr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_33), 16, 16)) -> intp(2, 0, 23)
iob_intr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_34), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_35), 16, 16)) -> intp(2, 0, 26)
	ta	T_CHANGE_TO_TL1
	.word 0xbcac2142  ! 506: ANDNcc_I	andncc 	%r16, 0x0142, %r30
	.word 0xbc356039  ! 508: ORN_I	orn 	%r21, 0x0039, %r30
cpu_intr_2_34:
	setx	0x220027, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_36), 16, 16)) -> intp(2, 0, 16)
	.word 0xf0cd0020  ! 514: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r24
	.word 0xf0550000  ! 515: LDSH_R	ldsh	[%r20 + %r0], %r24
	.word 0xf214e0ce  ! 516: LDUH_I	lduh	[%r19 + 0x00ce], %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf44c60c4  ! 519: LDSB_I	ldsb	[%r17 + 0x00c4], %r26
	.word 0xf40c2036  ! 520: LDUB_I	ldub	[%r16 + 0x0036], %r26
cpu_intr_2_35:
	setx	0x230017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04da097  ! 522: LDSB_I	ldsb	[%r22 + 0x0097], %r24
	.word 0x8f902000  ! 523: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xf845e0c3  ! 524: LDSW_I	ldsw	[%r23 + 0x00c3], %r28
T2_asi_reg_wr_16:
	mov	0x2c, %r14
	.word 0xf6f389e0  ! 527: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_37), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_36:
	setx	0x210319, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_37:
	setx	0x200117, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_38:
	setx	0x210216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_38), 16, 16)) -> intp(2, 0, 26)
T2_asi_reg_wr_17:
	mov	0x34, %r14
	.word 0xfcf38e60  ! 542: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_39:
	setx	0x230209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec48020  ! 546: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r31
iob_intr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_39), 16, 16)) -> intp(2, 0, 30)
T2_asi_reg_rd_20:
	mov	0x14, %r14
	.word 0xfedb8e80  ! 557: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_2_40:
	setx	0x22003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88dc020  ! 560: LDUBA_R	lduba	[%r23, %r0] 0x01, %r28
iob_intr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_40), 16, 16)) -> intp(2, 0, 6)
	.word 0xfc5d8000  ! 562: LDX_R	ldx	[%r22 + %r0], %r30
T2_asi_reg_rd_21:
	mov	0x3c3, %r14
	.word 0xfadb84a0  ! 564: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf0848020  ! 565: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r24
cpu_intr_2_41:
	setx	0x220222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec5205c  ! 567: LDSWA_I	ldswa	[%r20, + 0x005c] %asi, %r31
	.word 0xf65cc000  ! 571: LDX_R	ldx	[%r19 + %r0], %r27
	.word 0xf215a01d  ! 573: LDUH_I	lduh	[%r22 + 0x001d], %r25
cpu_intr_2_42:
	setx	0x20011b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_41), 16, 16)) -> intp(2, 0, 18)
	.word 0xbc8de159  ! 584: ANDcc_I	andcc 	%r23, 0x0159, %r30
iob_intr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_42), 16, 16)) -> intp(2, 0, a)
	.word 0xb48ca079  ! 587: ANDcc_I	andcc 	%r18, 0x0079, %r26
	.word 0xfe554000  ! 589: LDSH_R	ldsh	[%r21 + %r0], %r31
	.word 0xf805c000  ! 590: LDUW_R	lduw	[%r23 + %r0], %r28
cpu_intr_2_43:
	setx	0x230018, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_44:
	setx	0x200324, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_18:
	mov	0x1e, %r14
	.word 0xf4f38e40  ! 593: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xba358000  ! 598: SUBC_R	orn 	%r22, %r0, %r29
cpu_intr_2_45:
	setx	0x23030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0548000  ! 603: LDSH_R	ldsh	[%r18 + %r0], %r24
	.word 0xf4958020  ! 605: LDUHA_R	lduha	[%r22, %r0] 0x01, %r26
T2_asi_reg_wr_19:
	mov	0xd, %r14
	.word 0xf8f38e40  ! 608: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_2_46:
	setx	0x22002e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_47:
	setx	0x21010c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_22:
	mov	0x37, %r14
	.word 0xf6db8e40  ! 613: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf2cd4020  ! 614: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r25
	.word 0xf08d60e6  ! 615: LDUBA_I	lduba	[%r21, + 0x00e6] %asi, %r24
cpu_intr_2_48:
	setx	0x1003f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_43), 16, 16)) -> intp(2, 0, 1)
	.word 0xf4d560a6  ! 619: LDSHA_I	ldsha	[%r21, + 0x00a6] %asi, %r26
T2_asi_reg_wr_20:
	mov	0x28, %r14
	.word 0xf2f38e40  ! 620: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_44), 16, 16)) -> intp(2, 0, 2)
	ta	T_CHANGE_NONHPRIV
	.word 0xfa8c60c3  ! 627: LDUBA_I	lduba	[%r17, + 0x00c3] %asi, %r29
iob_intr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_45), 16, 16)) -> intp(2, 0, 17)
	ta	T_CHANGE_TO_TL1
iob_intr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_46), 16, 16)) -> intp(2, 0, 36)
	.word 0xfc558000  ! 637: LDSH_R	ldsh	[%r22 + %r0], %r30
	.word 0xb685e10e  ! 639: ADDcc_I	addcc 	%r23, 0x010e, %r27
	.word 0xb644a1be  ! 641: ADDC_I	addc 	%r18, 0x01be, %r27
	.word 0xb2340000  ! 642: ORN_R	orn 	%r16, %r0, %r25
T2_asi_reg_rd_23:
	mov	0xf, %r14
	.word 0xfcdb8400  ! 643: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf8c50020  ! 646: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r28
	.word 0xf48ca112  ! 647: LDUBA_I	lduba	[%r18, + 0x0112] %asi, %r26
	.word 0xf65d0000  ! 650: LDX_R	ldx	[%r20 + %r0], %r27
iob_intr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_47), 16, 16)) -> intp(2, 0, 11)
iob_intr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_48), 16, 16)) -> intp(2, 0, 13)
	.word 0xf48d21f1  ! 654: LDUBA_I	lduba	[%r20, + 0x01f1] %asi, %r26
	.word 0xbf2d2001  ! 662: SLL_I	sll 	%r20, 0x0001, %r31
T2_asi_reg_wr_21:
	mov	0x3c6, %r14
	.word 0xf4f38400  ! 663: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_2_49:
	setx	0x210030, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_24:
	mov	0x27, %r14
	.word 0xf6db8e80  ! 667: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T2_asi_reg_wr_22:
	mov	0x32, %r14
	.word 0xf4f38e40  ! 669: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf694e043  ! 670: LDUHA_I	lduha	[%r19, + 0x0043] %asi, %r27
iob_intr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_49), 16, 16)) -> intp(2, 0, 32)
cpu_intr_2_50:
	setx	0x22003f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_25:
	mov	0x2d, %r14
	.word 0xfedb8e80  ! 676: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf015e163  ! 679: LDUH_I	lduh	[%r23 + 0x0163], %r24
iob_intr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_50), 16, 16)) -> intp(2, 0, 19)
T2_asi_reg_rd_26:
	mov	0x1f, %r14
	.word 0xf4db8e80  ! 685: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xfa5d6168  ! 688: LDX_I	ldx	[%r21 + 0x0168], %r29
iob_intr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_51), 16, 16)) -> intp(2, 0, 32)
T2_asi_reg_wr_23:
	mov	0x3c6, %r14
	.word 0xf0f38400  ! 695: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_2_52:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_52), 16, 16)) -> intp(2, 0, 4)
	.word 0xfed40020  ! 701: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r31
cpu_intr_2_51:
	setx	0x210010, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_53:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_53), 16, 16)) -> intp(2, 0, 1c)
iob_intr_2_54:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_54), 16, 16)) -> intp(2, 0, 1e)
cpu_intr_2_52:
	setx	0x220007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc0c0000  ! 712: LDUB_R	ldub	[%r16 + %r0], %r30
	.word 0xf60c6144  ! 714: LDUB_I	ldub	[%r17 + 0x0144], %r27
	ta	T_CHANGE_TO_TL1
	.word 0xfcd460ee  ! 716: LDSHA_I	ldsha	[%r17, + 0x00ee] %asi, %r30
	.word 0xbb3c8000  ! 719: SRA_R	sra 	%r18, %r0, %r29
	.word 0xf845a1d2  ! 721: LDSW_I	ldsw	[%r22 + 0x01d2], %r28
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983b5a  ! 722: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b5a, %hpstate
cpu_intr_2_53:
	setx	0x200105, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_55:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_55), 16, 16)) -> intp(2, 0, 15)
iob_intr_2_56:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_56), 16, 16)) -> intp(2, 0, 39)
	.word 0xf24c2057  ! 730: LDSB_I	ldsb	[%r16 + 0x0057], %r25
	.word 0xf45da13e  ! 731: LDX_I	ldx	[%r22 + 0x013e], %r26
	.word 0xf0444000  ! 732: LDSW_R	ldsw	[%r17 + %r0], %r24
iob_intr_2_57:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_57), 16, 16)) -> intp(2, 0, 2d)
iob_intr_2_58:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_58), 16, 16)) -> intp(2, 0, 2e)
	.word 0xfccdc020  ! 737: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r30
cpu_intr_2_54:
	setx	0x200108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf845e03d  ! 747: LDSW_I	ldsw	[%r23 + 0x003d], %r28
T2_asi_reg_wr_24:
	mov	0x34, %r14
	.word 0xf0f38e40  ! 749: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb48d208d  ! 753: ANDcc_I	andcc 	%r20, 0x008d, %r26
iob_intr_2_59:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_59), 16, 16)) -> intp(2, 0, 1b)
	.word 0xfe0ca061  ! 756: LDUB_I	ldub	[%r18 + 0x0061], %r31
iob_intr_2_60:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_60), 16, 16)) -> intp(2, 0, 22)
	.word 0xfc550000  ! 760: LDSH_R	ldsh	[%r20 + %r0], %r30
	.word 0xf6c48020  ! 761: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r27
	.word 0xbc944000  ! 762: ORcc_R	orcc 	%r17, %r0, %r30
	.word 0xba05c000  ! 763: ADD_R	add 	%r23, %r0, %r29
iob_intr_2_61:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_61), 16, 16)) -> intp(2, 0, 33)
iob_intr_2_62:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_62), 16, 16)) -> intp(2, 0, b)
	.word 0xf28ce0cb  ! 771: LDUBA_I	lduba	[%r19, + 0x00cb] %asi, %r25
T2_asi_reg_wr_25:
	mov	0x2e, %r14
	.word 0xfaf38e40  ! 772: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_63:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_63), 16, 16)) -> intp(2, 0, 23)
cpu_intr_2_55:
	setx	0x200309, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_56:
	setx	0x23023b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_64:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_64), 16, 16)) -> intp(2, 0, 2)
	.word 0xfc8c20c9  ! 780: LDUBA_I	lduba	[%r16, + 0x00c9] %asi, %r30
	.word 0xf24da0a3  ! 781: LDSB_I	ldsb	[%r22 + 0x00a3], %r25
iob_intr_2_65:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_65), 16, 16)) -> intp(2, 0, 2d)
iob_intr_2_66:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_66), 16, 16)) -> intp(2, 0, 30)
iob_intr_2_67:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_67), 16, 16)) -> intp(2, 0, 6)
iob_intr_2_68:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_68), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf0cc21c9  ! 792: LDSBA_I	ldsba	[%r16, + 0x01c9] %asi, %r24
iob_intr_2_69:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_69), 16, 16)) -> intp(2, 0, 32)
	.word 0xfc15a155  ! 795: LDUH_I	lduh	[%r22 + 0x0155], %r30
T2_asi_reg_rd_27:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 796: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_rd_28:
	mov	0x1a, %r14
	.word 0xf2db8e80  ! 799: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_2_70:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_70), 16, 16)) -> intp(2, 0, 3a)
cpu_intr_2_57:
	setx	0x22021a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_26:
	mov	0xa, %r14
	.word 0xf6f38e40  ! 804: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x819838c2  ! 805: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18c2, %hpstate
	.word 0xf68d603f  ! 806: LDUBA_I	lduba	[%r21, + 0x003f] %asi, %r27
	.word 0xfa150000  ! 812: LDUH_R	lduh	[%r20 + %r0], %r29
cpu_intr_2_58:
	setx	0x21030c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_71:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_71), 16, 16)) -> intp(2, 0, c)
cpu_intr_2_59:
	setx	0x230016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5520000  ! 821: RDPR_PIL	<illegal instruction>
	.word 0xfa054000  ! 823: LDUW_R	lduw	[%r21 + %r0], %r29
T2_asi_reg_wr_27:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 824: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_72:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_72), 16, 16)) -> intp(2, 0, 13)
iob_intr_2_73:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_73), 16, 16)) -> intp(2, 0, 38)
	.word 0xf2558000  ! 831: LDSH_R	ldsh	[%r22 + %r0], %r25
	.word 0xfad44020  ! 832: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r29
	.word 0xf6554000  ! 835: LDSH_R	ldsh	[%r21 + %r0], %r27
cpu_intr_2_60:
	setx	0x20033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9351000  ! 839: SRLX_R	srlx	%r20, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_rd_29:
	mov	0x1b, %r14
	.word 0xf2db84a0  ! 846: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xfa8d8020  ! 847: LDUBA_R	lduba	[%r22, %r0] 0x01, %r29
T2_asi_reg_wr_28:
	mov	0x1c, %r14
	.word 0xf2f38400  ! 850: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbc354000  ! 851: SUBC_R	orn 	%r21, %r0, %r30
T2_asi_reg_wr_29:
	mov	0x17, %r14
	.word 0xfcf38e40  ! 855: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_rd_30:
	mov	0x3c2, %r14
	.word 0xfadb84a0  ! 856: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T2_asi_reg_wr_30:
	mov	0x3c3, %r14
	.word 0xfaf38e60  ! 857: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T2_asi_reg_wr_31:
	mov	0x3c0, %r14
	.word 0xf6f384a0  ! 859: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_2_61:
	setx	0x20020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_31:
	mov	0xf, %r14
	.word 0xfedb8e40  ! 866: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf00421a0  ! 867: LDUW_I	lduw	[%r16 + 0x01a0], %r24
	.word 0xfed44020  ! 868: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r31
	.word 0xf8cc4020  ! 872: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r28
T2_asi_reg_rd_32:
	mov	0x34, %r14
	.word 0xfedb8e80  ! 873: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xfa0cc000  ! 874: LDUB_R	ldub	[%r19 + %r0], %r29
T2_asi_reg_wr_32:
	mov	0x4, %r14
	.word 0xfaf38e40  ! 875: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf6dda036  ! 881: LDXA_I	ldxa	[%r22, + 0x0036] %asi, %r27
	.word 0xf4d4a09a  ! 882: LDSHA_I	ldsha	[%r18, + 0x009a] %asi, %r26
	.word 0xf254c000  ! 884: LDSH_R	ldsh	[%r19 + %r0], %r25
cpu_intr_2_62:
	setx	0x220134, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982c48  ! 890: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c48, %hpstate
T2_asi_reg_rd_33:
	mov	0x35, %r14
	.word 0xfadb8400  ! 892: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T2_asi_reg_rd_34:
	mov	0x7, %r14
	.word 0xfadb8e60  ! 893: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T2_asi_reg_wr_33:
	mov	0x14, %r14
	.word 0xf4f38e80  ! 894: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbc9ca103  ! 895: XORcc_I	xorcc 	%r18, 0x0103, %r30
	ta	T_CHANGE_HPRIV
	.word 0xb43461c4  ! 897: ORN_I	orn 	%r17, 0x01c4, %r26
iob_intr_2_74:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_74), 16, 16)) -> intp(2, 0, 21)
iob_intr_2_75:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_75), 16, 16)) -> intp(2, 0, 26)
	.word 0xf845a105  ! 902: LDSW_I	ldsw	[%r22 + 0x0105], %r28
iob_intr_2_76:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_76), 16, 16)) -> intp(2, 0, 21)
iob_intr_2_77:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_77), 16, 16)) -> intp(2, 0, 36)
	.word 0xf65c8000  ! 908: LDX_R	ldx	[%r18 + %r0], %r27
	.word 0xf085a0cd  ! 909: LDUWA_I	lduwa	[%r22, + 0x00cd] %asi, %r24
cpu_intr_2_63:
	setx	0x23012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24d614b  ! 915: LDSB_I	ldsb	[%r21 + 0x014b], %r25
	.word 0xf61521c6  ! 916: LDUH_I	lduh	[%r20 + 0x01c6], %r27
iob_intr_2_78:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_78), 16, 16)) -> intp(2, 0, 23)
	.word 0xfc8d6102  ! 921: LDUBA_I	lduba	[%r21, + 0x0102] %asi, %r30
	.word 0xf8c561bd  ! 922: LDSWA_I	ldswa	[%r21, + 0x01bd] %asi, %r28
iob_intr_2_79:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_79), 16, 16)) -> intp(2, 0, 2d)
iob_intr_2_80:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_80), 16, 16)) -> intp(2, 0, 2)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4cd605d  ! 936: LDSBA_I	ldsba	[%r21, + 0x005d] %asi, %r26
T2_asi_reg_wr_34:
	mov	0x3c4, %r14
	.word 0xf0f38400  ! 938: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf445e0db  ! 939: LDSW_I	ldsw	[%r23 + 0x00db], %r26
T2_asi_reg_rd_35:
	mov	0x3, %r14
	.word 0xfcdb8e40  ! 942: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_2_64:
	setx	0x26001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0058000  ! 946: LDUW_R	lduw	[%r22 + %r0], %r24
iob_intr_2_81:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_81), 16, 16)) -> intp(2, 0, 8)
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983908  ! 953: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1908, %hpstate
	.word 0xf405c000  ! 954: LDUW_R	lduw	[%r23 + %r0], %r26
	.word 0xf6144000  ! 955: LDUH_R	lduh	[%r17 + %r0], %r27
	.word 0xf885c020  ! 961: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r28
	.word 0xf6958020  ! 962: LDUHA_R	lduha	[%r22, %r0] 0x01, %r27
	ta	T_CHANGE_TO_TL1
cpu_intr_2_65:
	setx	0x270014, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_66:
	setx	0x260017, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_82:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_82), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf295614d  ! 972: LDUHA_I	lduha	[%r21, + 0x014d] %asi, %r25
	.word 0xf65d8000  ! 974: LDX_R	ldx	[%r22 + %r0], %r27
T2_asi_reg_wr_35:
	mov	0x2f, %r14
	.word 0xf2f384a0  ! 978: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_2_67:
	setx	0x260225, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_36:
	mov	0x13, %r14
	.word 0xf4f38e40  ! 981: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_83:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_83), 16, 16)) -> intp(2, 0, 23)
	.word 0xf8d52075  ! 986: LDSHA_I	ldsha	[%r20, + 0x0075] %asi, %r28
cpu_intr_2_68:
	setx	0x240134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0de1d8  ! 989: LDUB_I	ldub	[%r23 + 0x01d8], %r29
T2_asi_reg_wr_37:
	mov	0x2, %r14
	.word 0xf8f384a0  ! 991: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb0aca16a  ! 992: ANDNcc_I	andncc 	%r18, 0x016a, %r24
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_69:
	setx	0x270033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0cc0020  ! 998: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r24
T2_asi_reg_rd_36:
	mov	0x29, %r14
	.word 0xf0db8e40  ! 999: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_2_84:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_84), 16, 16)) -> intp(2, 0, 18)
	.word 0xf04dc000  ! 1004: LDSB_R	ldsb	[%r23 + %r0], %r24
	.word 0xfad4a16e  ! 1006: LDSHA_I	ldsha	[%r18, + 0x016e] %asi, %r29
T2_asi_reg_rd_37:
	mov	0x0, %r14
	.word 0xf8db89e0  ! 1007: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_2_70:
	setx	0x270235, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_38:
	mov	0x1, %r14
	.word 0xf2f389e0  ! 1013: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T2_asi_reg_rd_38:
	mov	0x3c3, %r14
	.word 0xf6db8e40  ! 1017: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_2_71:
	setx	0x24033a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_85:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_85), 16, 16)) -> intp(2, 0, 5)
cpu_intr_2_72:
	setx	0x250236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0954020  ! 1024: LDUHA_R	lduha	[%r21, %r0] 0x01, %r24
	.word 0xb235e194  ! 1026: ORN_I	orn 	%r23, 0x0194, %r25
	.word 0xf05d61b0  ! 1027: LDX_I	ldx	[%r21 + 0x01b0], %r24
cpu_intr_2_73:
	setx	0x24023d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_74:
	setx	0x24030f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_75:
	setx	0x260208, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_39:
	mov	0x3, %r14
	.word 0xfcf38e40  ! 1039: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_2_86:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_86), 16, 16)) -> intp(2, 0, 3d)
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983a52  ! 1041: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a52, %hpstate
	.word 0xf4d4c020  ! 1044: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r26
iob_intr_2_87:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_87), 16, 16)) -> intp(2, 0, 30)
	.word 0xf0848020  ! 1052: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r24
cpu_intr_2_76:
	setx	0x27002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0d461ab  ! 1055: LDSHA_I	ldsha	[%r17, + 0x01ab] %asi, %r24
T2_asi_reg_wr_40:
	mov	0x31, %r14
	.word 0xfef384a0  ! 1056: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xfe5d4000  ! 1057: LDX_R	ldx	[%r21 + %r0], %r31
T2_asi_reg_rd_39:
	mov	0x1e, %r14
	.word 0xf6db89e0  ! 1058: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xf2844020  ! 1059: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r25
	.word 0xfecde0e2  ! 1062: LDSBA_I	ldsba	[%r23, + 0x00e2] %asi, %r31
T2_asi_reg_rd_40:
	mov	0x29, %r14
	.word 0xfcdb8e40  ! 1063: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_2_77:
	setx	0x250126, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_78:
	setx	0x250331, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_79:
	setx	0x25021d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_80:
	setx	0x260200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60ce046  ! 1074: LDUB_I	ldub	[%r19 + 0x0046], %r27
	.word 0xbe05c000  ! 1075: ADD_R	add 	%r23, %r0, %r31
T2_asi_reg_rd_41:
	mov	0x20, %r14
	.word 0xf4db8e40  ! 1076: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_2_81:
	setx	0x27030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeb44000  ! 1078: ORNcc_R	orncc 	%r17, %r0, %r31
	.word 0xbaa58000  ! 1081: SUBcc_R	subcc 	%r22, %r0, %r29
	.word 0xf4852005  ! 1082: LDUWA_I	lduwa	[%r20, + 0x0005] %asi, %r26
T2_asi_reg_rd_42:
	mov	0x38, %r14
	.word 0xfadb8e80  ! 1083: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	setx	data_start_0, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983f82  ! 1085: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f82, %hpstate
T2_asi_reg_rd_43:
	mov	0x37, %r14
	.word 0xf0db8400  ! 1086: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_2_82:
	setx	0x27031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85d4000  ! 1091: LDX_R	ldx	[%r21 + %r0], %r28
	.word 0xf8c58020  ! 1097: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r28
T2_asi_reg_rd_44:
	mov	0x1b, %r14
	.word 0xf4db8e60  ! 1098: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb3540000  ! 1099: RDPR_GL	<illegal instruction>
T2_asi_reg_rd_45:
	mov	0xd, %r14
	.word 0xf0db8400  ! 1100: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xfa5cc000  ! 1102: LDX_R	ldx	[%r19 + %r0], %r29
	.word 0xfc4d8000  ! 1104: LDSB_R	ldsb	[%r22 + %r0], %r30
	.word 0xbf520000  ! 1105: RDPR_PIL	<illegal instruction>
cpu_intr_2_83:
	setx	0x240318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4456121  ! 1113: LDSW_I	ldsw	[%r21 + 0x0121], %r26
iob_intr_2_88:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_88), 16, 16)) -> intp(2, 0, 20)
T2_asi_reg_rd_46:
	mov	0x3c6, %r14
	.word 0xfedb8e80  ! 1116: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xbe350000  ! 1119: SUBC_R	orn 	%r20, %r0, %r31
T2_asi_reg_wr_41:
	mov	0x19, %r14
	.word 0xf8f384a0  ! 1121: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_89:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_89), 16, 16)) -> intp(2, 0, 8)
	.word 0xfcc5e120  ! 1125: LDSWA_I	ldswa	[%r23, + 0x0120] %asi, %r30
	.word 0xf4550000  ! 1126: LDSH_R	ldsh	[%r20 + %r0], %r26
	.word 0x8194e170  ! 1127: WRPR_TPC_I	wrpr	%r19, 0x0170, %tpc
	.word 0xf84c4000  ! 1128: LDSB_R	ldsb	[%r17 + %r0], %r28
	.word 0xf2dc2131  ! 1130: LDXA_I	ldxa	[%r16, + 0x0131] %asi, %r25
	.word 0xf2c5a16a  ! 1131: LDSWA_I	ldswa	[%r22, + 0x016a] %asi, %r25
cpu_intr_2_84:
	setx	0x240218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2cd8020  ! 1134: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r25
	.word 0xf28d8020  ! 1136: LDUBA_R	lduba	[%r22, %r0] 0x01, %r25
cpu_intr_2_85:
	setx	0x24031b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_90:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_90), 16, 16)) -> intp(2, 0, 32)
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_47:
	mov	0x7, %r14
	.word 0xfadb8e40  ! 1147: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf29561ae  ! 1148: LDUHA_I	lduha	[%r21, + 0x01ae] %asi, %r25
	.word 0xfe950020  ! 1150: LDUHA_R	lduha	[%r20, %r0] 0x01, %r31
	.word 0xf08560f2  ! 1152: LDUWA_I	lduwa	[%r21, + 0x00f2] %asi, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_48:
	mov	0x3c5, %r14
	.word 0xf8db8400  ! 1162: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xfad52164  ! 1163: LDSHA_I	ldsha	[%r20, + 0x0164] %asi, %r29
T2_asi_reg_rd_49:
	mov	0x3c3, %r14
	.word 0xf8db84a0  ! 1165: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T2_asi_reg_wr_42:
	mov	0x24, %r14
	.word 0xf6f384a0  ! 1166: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T2_asi_reg_wr_43:
	mov	0xf, %r14
	.word 0xf8f38e60  ! 1168: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T2_asi_reg_wr_44:
	mov	0x5, %r14
	.word 0xf0f38400  ! 1172: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_2_91:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_91), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_86:
	setx	0x260205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcc4202b  ! 1185: LDSWA_I	ldswa	[%r16, + 0x002b] %asi, %r30
cpu_intr_2_87:
	setx	0x260308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4d54020  ! 1189: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r26
	.word 0xf0954020  ! 1190: LDUHA_R	lduha	[%r21, %r0] 0x01, %r24
iob_intr_2_92:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_92), 16, 16)) -> intp(2, 0, 39)
iob_intr_2_93:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_93), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf24d2115  ! 1193: LDSB_I	ldsb	[%r20 + 0x0115], %r25
T2_asi_reg_wr_45:
	mov	0x23, %r14
	.word 0xf8f389e0  ! 1195: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_2_88:
	setx	0x250138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6150000  ! 1197: LDUH_R	lduh	[%r20 + %r0], %r27
	.word 0xf24dc000  ! 1200: LDSB_R	ldsb	[%r23 + %r0], %r25
	.word 0xbe14e025  ! 1201: OR_I	or 	%r19, 0x0025, %r31
	.word 0xf80dc000  ! 1202: LDUB_R	ldub	[%r23 + %r0], %r28
cpu_intr_2_89:
	setx	0x260131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb50c000  ! 1204: RDPR_TT	<illegal instruction>
iob_intr_2_94:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_94), 16, 16)) -> intp(2, 0, 16)
cpu_intr_2_90:
	setx	0x240037, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_91:
	setx	0x1001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_46:
	mov	0x3c6, %r14
	.word 0xf0f38400  ! 1210: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T2_asi_reg_rd_50:
	mov	0x2a, %r14
	.word 0xf4db8e40  ! 1213: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_92:
	setx	0x27021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_93:
	setx	0x260315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf804e12a  ! 1219: LDUW_I	lduw	[%r19 + 0x012a], %r28
T2_asi_reg_rd_51:
	mov	0xf, %r14
	.word 0xf4db8e40  ! 1221: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_2_94:
	setx	0x27013c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_95:
	setx	0x26023a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_52:
	mov	0x32, %r14
	.word 0xf2db8e80  ! 1227: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf8456014  ! 1228: LDSW_I	ldsw	[%r21 + 0x0014], %r28
	.word 0xf2dca1cd  ! 1229: LDXA_I	ldxa	[%r18, + 0x01cd] %asi, %r25
T2_asi_reg_wr_47:
	mov	0x2f, %r14
	.word 0xfaf38e40  ! 1231: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf88d4020  ! 1232: LDUBA_R	lduba	[%r21, %r0] 0x01, %r28
	ta	T_CHANGE_TO_TL0
	.word 0xf00de0dd  ! 1234: LDUB_I	ldub	[%r23 + 0x00dd], %r24
	.word 0xfa546020  ! 1238: LDSH_I	ldsh	[%r17 + 0x0020], %r29
	.word 0xb7643801  ! 1241: MOVcc_I	<illegal instruction>
T2_asi_reg_wr_48:
	mov	0x3c2, %r14
	.word 0xf2f38e40  ! 1242: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfcd5e04f  ! 1244: LDSHA_I	ldsha	[%r23, + 0x004f] %asi, %r30
T2_asi_reg_rd_53:
	mov	0xa, %r14
	.word 0xf4db8e80  ! 1246: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T2_asi_reg_rd_54:
	mov	0x1b, %r14
	.word 0xf0db8e40  ! 1247: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_2_95:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_95), 16, 16)) -> intp(2, 0, 38)
	.word 0xf0144000  ! 1253: LDUH_R	lduh	[%r17 + %r0], %r24
cpu_intr_2_96:
	setx	0x240029, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_55:
	mov	0x37, %r14
	.word 0xfedb8e80  ! 1257: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T2_asi_reg_rd_56:
	mov	0x13, %r14
	.word 0xfcdb84a0  ! 1258: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_2_96:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_96), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf44c4000  ! 1261: LDSB_R	ldsb	[%r17 + %r0], %r26
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983e0a  ! 1262: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e0a, %hpstate
	.word 0xfc95a0cb  ! 1263: LDUHA_I	lduha	[%r22, + 0x00cb] %asi, %r30
	.word 0xf60cc000  ! 1264: LDUB_R	ldub	[%r19 + %r0], %r27
iob_intr_2_97:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_97), 16, 16)) -> intp(2, 0, 4)
	.word 0xfac5a141  ! 1269: LDSWA_I	ldswa	[%r22, + 0x0141] %asi, %r29
	.word 0xf81561b1  ! 1273: LDUH_I	lduh	[%r21 + 0x01b1], %r28
cpu_intr_2_97:
	setx	0x250021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0d5e11b  ! 1277: LDSHA_I	ldsha	[%r23, + 0x011b] %asi, %r24
T2_asi_reg_wr_49:
	mov	0x18, %r14
	.word 0xf2f38e40  ! 1280: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T2_asi_reg_wr_50:
	mov	0x23, %r14
	.word 0xfcf384a0  ! 1281: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_2_98:
	setx	0x27032a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_98:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_98), 16, 16)) -> intp(2, 0, 1a)
cpu_intr_2_99:
	setx	0x240111, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xbead8000  ! 1288: ANDNcc_R	andncc 	%r22, %r0, %r31
iob_intr_2_99:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_99), 16, 16)) -> intp(2, 0, 2f)
T2_asi_reg_wr_51:
	mov	0x2, %r14
	.word 0xf6f38e40  ! 1297: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_wr_52:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 1298: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf0c5c020  ! 1300: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r24
T2_asi_reg_wr_53:
	mov	0x3c1, %r14
	.word 0xfaf384a0  ! 1304: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_2_100:
	setx	0x24003e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_100:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_100), 16, 16)) -> intp(2, 0, 24)
	.word 0xb4140000  ! 1307: OR_R	or 	%r16, %r0, %r26
cpu_intr_2_101:
	setx	0x27023e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_101:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_101), 16, 16)) -> intp(2, 0, 1b)
iob_intr_2_102:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_102), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf8952096  ! 1320: LDUHA_I	lduha	[%r20, + 0x0096] %asi, %r28
iob_intr_2_103:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_103), 16, 16)) -> intp(2, 0, 35)
	.word 0xf8952110  ! 1325: LDUHA_I	lduha	[%r20, + 0x0110] %asi, %r28
	.word 0xfe844020  ! 1327: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r31
cpu_intr_2_102:
	setx	0x25031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4856167  ! 1330: LDUWA_I	lduwa	[%r21, + 0x0167] %asi, %r26
	.word 0xb2148000  ! 1331: OR_R	or 	%r18, %r0, %r25
	.word 0xfe14e1dd  ! 1332: LDUH_I	lduh	[%r19 + 0x01dd], %r31
T2_asi_reg_rd_57:
	mov	0x23, %r14
	.word 0xf2db8e40  ! 1335: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_2_103:
	setx	0x240324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb77d2401  ! 1337: MOVR_I	movre	%r20, 0x1, %r27
cpu_intr_2_104:
	setx	0x24000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfe450000  ! 1345: LDSW_R	ldsw	[%r20 + %r0], %r31
iob_intr_2_104:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_104), 16, 16)) -> intp(2, 0, 24)
	.word 0xbd2da001  ! 1349: SLL_I	sll 	%r22, 0x0001, %r30
cpu_intr_2_105:
	setx	0x270138, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_105:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_105), 16, 16)) -> intp(2, 0, 14)
iob_intr_2_106:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_106), 16, 16)) -> intp(2, 0, d)
cpu_intr_2_106:
	setx	0x250031, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_107:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_107), 16, 16)) -> intp(2, 0, 0)
	.word 0xb6950000  ! 1368: ORcc_R	orcc 	%r20, %r0, %r27
iob_intr_2_108:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_108), 16, 16)) -> intp(2, 0, 14)
	.word 0xfa9421f8  ! 1370: LDUHA_I	lduha	[%r16, + 0x01f8] %asi, %r29
	.word 0xf4d50020  ! 1371: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r26
	.word 0xb0340000  ! 1372: ORN_R	orn 	%r16, %r0, %r24
	.word 0xf28c8020  ! 1373: LDUBA_R	lduba	[%r18, %r0] 0x01, %r25
iob_intr_2_109:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_109), 16, 16)) -> intp(2, 0, 15)
T2_asi_reg_rd_58:
	mov	0x20, %r14
	.word 0xfcdb8e40  ! 1378: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf685a0f0  ! 1379: LDUWA_I	lduwa	[%r22, + 0x00f0] %asi, %r27
	.word 0xb3355000  ! 1383: SRLX_R	srlx	%r21, %r0, %r25
	.word 0xfec520c0  ! 1385: LDSWA_I	ldswa	[%r20, + 0x00c0] %asi, %r31
	.word 0xfec5214f  ! 1386: LDSWA_I	ldswa	[%r20, + 0x014f] %asi, %r31
cpu_intr_2_107:
	setx	0x26030f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_54:
	mov	0x3c3, %r14
	.word 0xf2f38e80  ! 1393: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf0850020  ! 1394: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r24
T2_asi_reg_rd_59:
	mov	0x15, %r14
	.word 0xfadb84a0  ! 1395: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_2_110:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_110), 16, 16)) -> intp(2, 0, 21)
cpu_intr_2_108:
	setx	0x25031d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_109:
	setx	0x270025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcc56058  ! 1401: LDSWA_I	ldswa	[%r21, + 0x0058] %asi, %r30
	.word 0xfa55a108  ! 1402: LDSH_I	ldsh	[%r22 + 0x0108], %r29
	.word 0xf2042067  ! 1403: LDUW_I	lduw	[%r16 + 0x0067], %r25
	.word 0xfcc50020  ! 1405: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r30
	.word 0xfa0d0000  ! 1406: LDUB_R	ldub	[%r20 + %r0], %r29
	ta	T_CHANGE_TO_TL1
	.word 0xf4844020  ! 1410: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r26
T2_asi_reg_wr_55:
	mov	0xd, %r14
	.word 0xfaf38e60  ! 1411: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf0d46072  ! 1412: LDSHA_I	ldsha	[%r17, + 0x0072] %asi, %r24
T2_asi_reg_wr_56:
	mov	0x3c0, %r14
	.word 0xf2f389e0  ! 1415: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T2_asi_reg_wr_57:
	mov	0x38, %r14
	.word 0xfcf384a0  ! 1417: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfe5cc000  ! 1418: LDX_R	ldx	[%r19 + %r0], %r31
cpu_intr_2_110:
	setx	0x2a0229, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_58:
	mov	0x12, %r14
	.word 0xf8f389e0  ! 1421: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_2_111:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_111), 16, 16)) -> intp(2, 0, 3d)
cpu_intr_2_111:
	setx	0x28021a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_112:
	setx	0x29032b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_112:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_112), 16, 16)) -> intp(2, 0, 15)
	.word 0xf65d4000  ! 1442: LDX_R	ldx	[%r21 + %r0], %r27
iob_intr_2_113:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_113), 16, 16)) -> intp(2, 0, 1)
	.word 0xfa4d20c4  ! 1445: LDSB_I	ldsb	[%r20 + 0x00c4], %r29
	.word 0xfc4d0000  ! 1446: LDSB_R	ldsb	[%r20 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_59:
	mov	0x13, %r14
	.word 0xf2f38e60  ! 1455: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xbb50c000  ! 1458: RDPR_TT	<illegal instruction>
iob_intr_2_114:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_114), 16, 16)) -> intp(2, 0, 37)
iob_intr_2_115:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_115), 16, 16)) -> intp(2, 0, 3)
iob_intr_2_116:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_116), 16, 16)) -> intp(2, 0, e)
	.word 0xf65560eb  ! 1464: LDSH_I	ldsh	[%r21 + 0x00eb], %r27
cpu_intr_2_113:
	setx	0x2b0305, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_117:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_117), 16, 16)) -> intp(2, 0, 3b)
	.word 0xf6c5a025  ! 1469: LDSWA_I	ldswa	[%r22, + 0x0025] %asi, %r27
	.word 0xbeb461ec  ! 1475: ORNcc_I	orncc 	%r17, 0x01ec, %r31
	.word 0xf814e0ec  ! 1476: LDUH_I	lduh	[%r19 + 0x00ec], %r28
iob_intr_2_118:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_118), 16, 16)) -> intp(2, 0, 16)
	.word 0xf25d60c3  ! 1478: LDX_I	ldx	[%r21 + 0x00c3], %r25
	.word 0xbf3d7001  ! 1480: SRAX_I	srax	%r21, 0x0001, %r31
iob_intr_2_119:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_119), 16, 16)) -> intp(2, 0, 18)
	.word 0xf25dc000  ! 1483: LDX_R	ldx	[%r23 + %r0], %r25
	.word 0xf0cdc020  ! 1484: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r24
	ta	T_CHANGE_HPRIV
	.word 0xfe05c000  ! 1487: LDUW_R	lduw	[%r23 + %r0], %r31
	.word 0xf0d58020  ! 1488: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r24
cpu_intr_2_114:
	setx	0x2b0011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd357001  ! 1490: SRLX_I	srlx	%r21, 0x0001, %r30
cpu_intr_2_115:
	setx	0x2a0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa85e1c8  ! 1494: LDUWA_I	lduwa	[%r23, + 0x01c8] %asi, %r29
	.word 0xf4152009  ! 1496: LDUH_I	lduh	[%r20 + 0x0009], %r26
T2_asi_reg_rd_60:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 1498: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_2_116:
	setx	0x28020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb32d8000  ! 1505: SLL_R	sll 	%r22, %r0, %r25
	.word 0xfc548000  ! 1511: LDSH_R	ldsh	[%r18 + %r0], %r30
iob_intr_2_120:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_120), 16, 16)) -> intp(2, 0, 13)
	.word 0xb634e168  ! 1516: ORN_I	orn 	%r19, 0x0168, %r27
iob_intr_2_121:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_121), 16, 16)) -> intp(2, 0, 2e)
cpu_intr_2_117:
	setx	0x280101, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_61:
	mov	0x3c7, %r14
	.word 0xfedb8e40  ! 1521: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfac5604a  ! 1525: LDSWA_I	ldswa	[%r21, + 0x004a] %asi, %r29
cpu_intr_2_118:
	setx	0x290006, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_122:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_122), 16, 16)) -> intp(2, 0, 26)
iob_intr_2_123:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_123), 16, 16)) -> intp(2, 0, 3f)
T2_asi_reg_rd_62:
	mov	0x3c2, %r14
	.word 0xf4db8e40  ! 1535: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4044000  ! 1539: LDUW_R	lduw	[%r17 + %r0], %r26
	.word 0xf45de115  ! 1540: LDX_I	ldx	[%r23 + 0x0115], %r26
	.word 0xf0452008  ! 1543: LDSW_I	ldsw	[%r20 + 0x0008], %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf04da075  ! 1545: LDSB_I	ldsb	[%r22 + 0x0075], %r24
	.word 0xfe556111  ! 1546: LDSH_I	ldsh	[%r21 + 0x0111], %r31
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_119:
	setx	0x29033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe85a0fc  ! 1556: LDUWA_I	lduwa	[%r22, + 0x00fc] %asi, %r31
	.word 0xfa85c020  ! 1560: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r29
	.word 0xf415e166  ! 1561: LDUH_I	lduh	[%r23 + 0x0166], %r26
iob_intr_2_124:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_124), 16, 16)) -> intp(2, 0, 14)
iob_intr_2_125:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_125), 16, 16)) -> intp(2, 0, 18)
	.word 0xbe94c000  ! 1570: ORcc_R	orcc 	%r19, %r0, %r31
T2_asi_reg_rd_63:
	mov	0x2b, %r14
	.word 0xf4db8e60  ! 1573: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf6858020  ! 1577: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r27
T2_asi_reg_wr_60:
	mov	0x3c4, %r14
	.word 0xfef389e0  ! 1579: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_2_120:
	setx	0x28000e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_126:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_126), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_rd_64:
	mov	0x3, %r14
	.word 0xf2db8e40  ! 1585: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfe05a014  ! 1586: LDUW_I	lduw	[%r22 + 0x0014], %r31
	.word 0xb4a461e0  ! 1591: SUBcc_I	subcc 	%r17, 0x01e0, %r26
	.word 0xfe4de060  ! 1592: LDSB_I	ldsb	[%r23 + 0x0060], %r31
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982d08  ! 1593: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d08, %hpstate
T2_asi_reg_wr_61:
	mov	0x3c5, %r14
	.word 0xfef38e60  ! 1595: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983898  ! 1597: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1898, %hpstate
T2_asi_reg_wr_62:
	mov	0x1f, %r14
	.word 0xf8f38400  ! 1598: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb235605e  ! 1599: SUBC_I	orn 	%r21, 0x005e, %r25
	.word 0xbcbce12f  ! 1603: XNORcc_I	xnorcc 	%r19, 0x012f, %r30
T2_asi_reg_wr_63:
	mov	0x8, %r14
	.word 0xfef38e60  ! 1604: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T2_asi_reg_rd_65:
	mov	0x3c0, %r14
	.word 0xf6db8e80  ! 1605: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf85dc000  ! 1607: LDX_R	ldx	[%r23 + %r0], %r28
cpu_intr_2_121:
	setx	0x2a0030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6c5e156  ! 1612: LDSWA_I	ldswa	[%r23, + 0x0156] %asi, %r27
T2_asi_reg_rd_66:
	mov	0x4, %r14
	.word 0xf4db8e80  ! 1614: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_2_122:
	setx	0x280037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45ca099  ! 1617: LDX_I	ldx	[%r18 + 0x0099], %r26
	.word 0xf24c0000  ! 1620: LDSB_R	ldsb	[%r16 + %r0], %r25
	.word 0xb2a40000  ! 1621: SUBcc_R	subcc 	%r16, %r0, %r25
	ta	T_CHANGE_TO_TL0
	.word 0xb73dc000  ! 1626: SRA_R	sra 	%r23, %r0, %r27
	ta	T_CHANGE_TO_TL0
	.word 0x8795e0b6  ! 1629: WRPR_TT_I	wrpr	%r23, 0x00b6, %tt
	.word 0xfc8d2051  ! 1630: LDUBA_I	lduba	[%r20, + 0x0051] %asi, %r30
T2_asi_reg_rd_67:
	mov	0x30, %r14
	.word 0xf0db8e80  ! 1632: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xf694e0ec  ! 1634: LDUHA_I	lduha	[%r19, + 0x00ec] %asi, %r27
cpu_intr_2_123:
	setx	0x280323, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982c02  ! 1637: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c02, %hpstate
cpu_intr_2_124:
	setx	0x2a0326, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_127:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_127), 16, 16)) -> intp(2, 0, 32)
iob_intr_2_128:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_128), 16, 16)) -> intp(2, 0, 3a)
iob_intr_2_129:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_129), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_rd_68:
	mov	0x3c3, %r14
	.word 0xf2db89e0  ! 1647: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T2_asi_reg_rd_69:
	mov	0x1f, %r14
	.word 0xf8db8400  ! 1649: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_2_125:
	setx	0x280136, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_70:
	mov	0x3c8, %r14
	.word 0xf8db8e40  ! 1652: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbe8ca028  ! 1655: ANDcc_I	andcc 	%r18, 0x0028, %r31
	.word 0xfa4c0000  ! 1657: LDSB_R	ldsb	[%r16 + %r0], %r29
cpu_intr_2_126:
	setx	0x280002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf28c20f5  ! 1659: LDUBA_I	lduba	[%r16, + 0x00f5] %asi, %r25
cpu_intr_2_127:
	setx	0x290202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8c4c020  ! 1662: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r28
	.word 0xf04d2129  ! 1665: LDSB_I	ldsb	[%r20 + 0x0129], %r24
	.word 0xb81c4000  ! 1671: XOR_R	xor 	%r17, %r0, %r28
cpu_intr_2_128:
	setx	0x29023b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_130:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_130), 16, 16)) -> intp(2, 0, 9)
	.word 0xbe8c0000  ! 1676: ANDcc_R	andcc 	%r16, %r0, %r31
cpu_intr_2_129:
	setx	0x29011b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_130:
	setx	0x2b032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc846055  ! 1681: LDUWA_I	lduwa	[%r17, + 0x0055] %asi, %r30
T2_asi_reg_rd_71:
	mov	0x1f, %r14
	.word 0xfadb8e40  ! 1682: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfe04c000  ! 1684: LDUW_R	lduw	[%r19 + %r0], %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfedd202f  ! 1686: LDXA_I	ldxa	[%r20, + 0x002f] %asi, %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xf445a171  ! 1690: LDSW_I	ldsw	[%r22 + 0x0171], %r26
	.word 0xf6852036  ! 1691: LDUWA_I	lduwa	[%r20, + 0x0036] %asi, %r27
	.word 0xfa8c4020  ! 1693: LDUBA_R	lduba	[%r17, %r0] 0x01, %r29
T2_asi_reg_rd_72:
	mov	0x22, %r14
	.word 0xf0db84a0  ! 1694: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf45dc000  ! 1698: LDX_R	ldx	[%r23 + %r0], %r26
iob_intr_2_131:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_131), 16, 16)) -> intp(2, 0, 39)
	.word 0xbe140000  ! 1705: OR_R	or 	%r16, %r0, %r31
iob_intr_2_132:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_132), 16, 16)) -> intp(2, 0, 28)
	.word 0xf8058000  ! 1709: LDUW_R	lduw	[%r22 + %r0], %r28
cpu_intr_2_131:
	setx	0x29003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3342001  ! 1712: SRL_I	srl 	%r16, 0x0001, %r25
	.word 0xf8556017  ! 1713: LDSH_I	ldsh	[%r21 + 0x0017], %r28
iob_intr_2_133:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_133), 16, 16)) -> intp(2, 0, 19)
T2_asi_reg_rd_73:
	mov	0x9, %r14
	.word 0xf4db84a0  ! 1720: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_2_134:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_134), 16, 16)) -> intp(2, 0, 27)
	.word 0xf8cd21f5  ! 1725: LDSBA_I	ldsba	[%r20, + 0x01f5] %asi, %r28
	.word 0xf68de032  ! 1726: LDUBA_I	lduba	[%r23, + 0x0032] %asi, %r27
	.word 0xfe0c0000  ! 1727: LDUB_R	ldub	[%r16 + %r0], %r31
T2_asi_reg_rd_74:
	mov	0x14, %r14
	.word 0xf8db8e40  ! 1734: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfe950020  ! 1735: LDUHA_R	lduha	[%r20, %r0] 0x01, %r31
	.word 0xf00ca0ad  ! 1736: LDUB_I	ldub	[%r18 + 0x00ad], %r24
iob_intr_2_135:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_135), 16, 16)) -> intp(2, 0, 36)
T2_asi_reg_wr_64:
	mov	0x32, %r14
	.word 0xf6f384a0  ! 1743: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf495218d  ! 1747: LDUHA_I	lduha	[%r20, + 0x018d] %asi, %r26
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982952  ! 1748: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0952, %hpstate
	.word 0xf2942084  ! 1749: LDUHA_I	lduha	[%r16, + 0x0084] %asi, %r25
	.word 0xb22d0000  ! 1751: ANDN_R	andn 	%r20, %r0, %r25
	.word 0xb80d8000  ! 1755: AND_R	and 	%r22, %r0, %r28
	.word 0xfa84619e  ! 1757: LDUWA_I	lduwa	[%r17, + 0x019e] %asi, %r29
iob_intr_2_136:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_136), 16, 16)) -> intp(2, 0, 2c)
T2_asi_reg_rd_75:
	mov	0x6, %r14
	.word 0xfedb89e0  ! 1760: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_2_132:
	setx	0x280234, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_137:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_137), 16, 16)) -> intp(2, 0, 1c)
	.word 0xb0a44000  ! 1765: SUBcc_R	subcc 	%r17, %r0, %r24
	.word 0xb0ada012  ! 1767: ANDNcc_I	andncc 	%r22, 0x0012, %r24
	.word 0xb12da001  ! 1768: SLL_I	sll 	%r22, 0x0001, %r24
	.word 0xfcd4a131  ! 1774: LDSHA_I	ldsha	[%r18, + 0x0131] %asi, %r30
	.word 0x859460df  ! 1775: WRPR_TSTATE_I	wrpr	%r17, 0x00df, %tstate
T2_asi_reg_rd_76:
	mov	0x26, %r14
	.word 0xf2db8e60  ! 1778: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T2_asi_reg_wr_65:
	mov	0xb, %r14
	.word 0xf4f38e80  ! 1779: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T2_asi_reg_wr_66:
	mov	0xf, %r14
	.word 0xf2f38400  ! 1783: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbb643801  ! 1787: MOVcc_I	<illegal instruction>
iob_intr_2_138:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_138), 16, 16)) -> intp(2, 0, 1e)
	.word 0x859521e8  ! 1791: WRPR_TSTATE_I	wrpr	%r20, 0x01e8, %tstate
	.word 0xf8158000  ! 1792: LDUH_R	lduh	[%r22 + %r0], %r28
iob_intr_2_139:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_139), 16, 16)) -> intp(2, 0, 3b)
cpu_intr_2_133:
	setx	0x280211, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_67:
	mov	0x28, %r14
	.word 0xf2f38e80  ! 1799: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf6c421bb  ! 1803: LDSWA_I	ldswa	[%r16, + 0x01bb] %asi, %r27
	.word 0xf4c4e028  ! 1806: LDSWA_I	ldswa	[%r19, + 0x0028] %asi, %r26
	.word 0xfa156195  ! 1807: LDUH_I	lduh	[%r21 + 0x0195], %r29
T2_asi_reg_rd_77:
	mov	0x25, %r14
	.word 0xfcdb84a0  ! 1808: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_2_134:
	setx	0x2a032e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_135:
	setx	0x2a0018, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_140:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_140), 16, 16)) -> intp(2, 0, 22)
	.word 0xf6c58020  ! 1816: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r27
	.word 0xbaa4e0c9  ! 1817: SUBcc_I	subcc 	%r19, 0x00c9, %r29
	.word 0xfe0c8000  ! 1818: LDUB_R	ldub	[%r18 + %r0], %r31
	.word 0xb2c56017  ! 1822: ADDCcc_I	addccc 	%r21, 0x0017, %r25
cpu_intr_2_136:
	setx	0x290234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc05a16b  ! 1827: LDUW_I	lduw	[%r22 + 0x016b], %r30
	.word 0xf44c2035  ! 1841: LDSB_I	ldsb	[%r16 + 0x0035], %r26
T2_asi_reg_wr_68:
	mov	0x19, %r14
	.word 0xf6f384a0  ! 1842: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_2_141:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_141), 16, 16)) -> intp(2, 0, 3c)
iob_intr_2_142:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_142), 16, 16)) -> intp(2, 0, 7)
iob_intr_2_143:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_143), 16, 16)) -> intp(2, 0, d)
iob_intr_2_144:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_144), 16, 16)) -> intp(2, 0, 39)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_145:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_145), 16, 16)) -> intp(2, 0, 22)
iob_intr_2_146:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_146), 16, 16)) -> intp(2, 0, 3e)
	.word 0xfc4c0000  ! 1865: LDSB_R	ldsb	[%r16 + %r0], %r30
cpu_intr_2_137:
	setx	0x2f0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb17ca401  ! 1867: MOVR_I	movre	%r18, 0x1, %r24
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_69:
	mov	0x9, %r14
	.word 0xf4f38e40  ! 1873: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_138:
	setx	0x2c0030, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_147:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_147), 16, 16)) -> intp(2, 0, 24)
iob_intr_2_148:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_148), 16, 16)) -> intp(2, 0, a)
iob_intr_2_149:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_149), 16, 16)) -> intp(2, 0, 5)
	.word 0xf45ce135  ! 1886: LDX_I	ldx	[%r19 + 0x0135], %r26
	.word 0xf6158000  ! 1890: LDUH_R	lduh	[%r22 + %r0], %r27
iob_intr_2_150:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_150), 16, 16)) -> intp(2, 0, 33)
	.word 0xfedc20e6  ! 1892: LDXA_I	ldxa	[%r16, + 0x00e6] %asi, %r31
T2_asi_reg_wr_70:
	mov	0x19, %r14
	.word 0xfef38400  ! 1893: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xfc5ce127  ! 1894: LDX_I	ldx	[%r19 + 0x0127], %r30
iob_intr_2_151:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_151), 16, 16)) -> intp(2, 0, 1f)
T2_asi_reg_wr_71:
	mov	0x38, %r14
	.word 0xfaf38e60  ! 1898: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_2_139:
	setx	0x2c0311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5d0000  ! 1900: LDX_R	ldx	[%r20 + %r0], %r29
	ta	T_CHANGE_TO_TL0
iob_intr_2_152:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_152), 16, 16)) -> intp(2, 0, 3f)
	.word 0xb2248000  ! 1905: SUB_R	sub 	%r18, %r0, %r25
T2_asi_reg_wr_72:
	mov	0x26, %r14
	.word 0xfcf38e80  ! 1908: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T2_asi_reg_wr_73:
	mov	0x3c8, %r14
	.word 0xfef38e80  ! 1912: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf2540000  ! 1913: LDSH_R	ldsh	[%r16 + %r0], %r25
	.word 0xb02ca0ac  ! 1915: ANDN_I	andn 	%r18, 0x00ac, %r24
	.word 0xfcdca10f  ! 1917: LDXA_I	ldxa	[%r18, + 0x010f] %asi, %r30
iob_intr_2_153:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_153), 16, 16)) -> intp(2, 0, 2a)
T2_asi_reg_wr_74:
	mov	0x17, %r14
	.word 0xf8f389e0  ! 1922: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983c8a  ! 1924: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c8a, %hpstate
	.word 0xb08c20f4  ! 1925: ANDcc_I	andcc 	%r16, 0x00f4, %r24
T2_asi_reg_rd_78:
	mov	0x25, %r14
	.word 0xf2db8e40  ! 1926: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_wr_75:
	mov	0x5, %r14
	.word 0xfaf38e40  ! 1928: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfe4c4000  ! 1931: LDSB_R	ldsb	[%r17 + %r0], %r31
	.word 0xf285c020  ! 1932: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r25
	.word 0xfa8dc020  ! 1935: LDUBA_R	lduba	[%r23, %r0] 0x01, %r29
cpu_intr_2_140:
	setx	0x2d0004, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_141:
	setx	0x2f021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_142:
	setx	0x2e0007, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_143:
	setx	0x2f010c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_154:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_154), 16, 16)) -> intp(2, 0, 13)
T2_asi_reg_wr_76:
	mov	0x2a, %r14
	.word 0xf8f38e60  ! 1943: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xfc94a162  ! 1945: LDUHA_I	lduha	[%r18, + 0x0162] %asi, %r30
	.word 0xf6148000  ! 1947: LDUH_R	lduh	[%r18 + %r0], %r27
iob_intr_2_155:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_155), 16, 16)) -> intp(2, 0, 25)
	.word 0xfe8c4020  ! 1950: LDUBA_R	lduba	[%r17, %r0] 0x01, %r31
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983f58  ! 1952: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f58, %hpstate
	.word 0xbd520000  ! 1953: RDPR_PIL	<illegal instruction>
	.word 0xf054a099  ! 1955: LDSH_I	ldsh	[%r18 + 0x0099], %r24
T2_asi_reg_wr_77:
	mov	0x9, %r14
	.word 0xf2f384a0  ! 1958: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_2_144:
	setx	0x2d010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc5d61a3  ! 1963: LDX_I	ldx	[%r21 + 0x01a3], %r30
cpu_intr_2_145:
	setx	0x2c0103, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_78:
	mov	0x3c7, %r14
	.word 0xf6f384a0  ! 1967: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf6c54020  ! 1968: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r27
	.word 0xf8850020  ! 1976: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r28
cpu_intr_2_146:
	setx	0x2d0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x819839c2  ! 1979: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19c2, %hpstate
cpu_intr_2_147:
	setx	0x2f000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfad48020  ! 1981: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r29
	.word 0xbe8560a2  ! 1985: ADDcc_I	addcc 	%r21, 0x00a2, %r31
	.word 0xf44560f1  ! 1988: LDSW_I	ldsw	[%r21 + 0x00f1], %r26
T2_asi_reg_rd_79:
	mov	0x25, %r14
	.word 0xfedb8e80  ! 1991: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_2_156:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_156), 16, 16)) -> intp(2, 0, 7)
	.word 0xf6d54020  ! 1993: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r27
	.word 0xfc8dc020  ! 1994: LDUBA_R	lduba	[%r23, %r0] 0x01, %r30
iob_intr_2_157:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_157), 16, 16)) -> intp(2, 0, c)
	.word 0xb604a0c6  ! 1996: ADD_I	add 	%r18, 0x00c6, %r27
cpu_intr_2_148:
	setx	0x2f022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9348000  ! 2003: SRL_R	srl 	%r18, %r0, %r28
	.word 0xb6bc8000  ! 2005: XNORcc_R	xnorcc 	%r18, %r0, %r27
	.word 0xf25c8000  ! 2007: LDX_R	ldx	[%r18 + %r0], %r25
iob_intr_2_158:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_158), 16, 16)) -> intp(2, 0, 29)
	.word 0xf0d4e1fc  ! 2010: LDSHA_I	ldsha	[%r19, + 0x01fc] %asi, %r24
iob_intr_2_159:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_159), 16, 16)) -> intp(2, 0, 32)
T2_asi_reg_wr_79:
	mov	0x1b, %r14
	.word 0xf6f38400  ! 2015: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T2_asi_reg_rd_80:
	mov	0x3c1, %r14
	.word 0xfedb84a0  ! 2016: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf05d4000  ! 2019: LDX_R	ldx	[%r21 + %r0], %r24
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983a50  ! 2020: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a50, %hpstate
	.word 0xf0152062  ! 2023: LDUH_I	lduh	[%r20 + 0x0062], %r24
iob_intr_2_160:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_160), 16, 16)) -> intp(2, 0, 7)
	.word 0xfa140000  ! 2027: LDUH_R	lduh	[%r16 + %r0], %r29
	.word 0xfe0ce076  ! 2028: LDUB_I	ldub	[%r19 + 0x0076], %r31
T2_asi_reg_rd_81:
	mov	0x38, %r14
	.word 0xf2db8e80  ! 2029: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_2_161:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_161), 16, 16)) -> intp(2, 0, 33)
cpu_intr_2_149:
	setx	0x2c0334, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_150:
	setx	0x2f021d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_151:
	setx	0x2e0316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1359000  ! 2040: SRLX_R	srlx	%r22, %r0, %r24
cpu_intr_2_152:
	setx	0x2d011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7643801  ! 2043: MOVcc_I	<illegal instruction>
	.word 0xbcb40000  ! 2046: SUBCcc_R	orncc 	%r16, %r0, %r30
	.word 0xfa8de0fa  ! 2048: LDUBA_I	lduba	[%r23, + 0x00fa] %asi, %r29
	.word 0xfcd5a0b8  ! 2049: LDSHA_I	ldsha	[%r22, + 0x00b8] %asi, %r30
T2_asi_reg_rd_82:
	mov	0x3c0, %r14
	.word 0xf6db8e80  ! 2050: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf2948020  ! 2052: LDUHA_R	lduha	[%r18, %r0] 0x01, %r25
	.word 0xf2144000  ! 2053: LDUH_R	lduh	[%r17 + %r0], %r25
iob_intr_2_162:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_162), 16, 16)) -> intp(2, 0, 21)
iob_intr_2_163:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_163), 16, 16)) -> intp(2, 0, 27)
	.word 0xbb643801  ! 2056: MOVcc_I	<illegal instruction>
	.word 0xf68dc020  ! 2058: LDUBA_R	lduba	[%r23, %r0] 0x01, %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xf454e07d  ! 2065: LDSH_I	ldsh	[%r19 + 0x007d], %r26
iob_intr_2_164:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_164), 16, 16)) -> intp(2, 0, 5)
iob_intr_2_165:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_165), 16, 16)) -> intp(2, 0, e)
iob_intr_2_166:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_166), 16, 16)) -> intp(2, 0, 2e)
	.word 0xfc152192  ! 2073: LDUH_I	lduh	[%r20 + 0x0192], %r30
cpu_intr_2_153:
	setx	0x2d0105, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_154:
	setx	0x2c0030, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_155:
	setx	0x2f0128, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_167:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_167), 16, 16)) -> intp(2, 0, 27)
	.word 0xf8cc8020  ! 2084: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r28
	.word 0xf20460e2  ! 2085: LDUW_I	lduw	[%r17 + 0x00e2], %r25
T2_asi_reg_wr_80:
	mov	0x2e, %r14
	.word 0xfaf389e0  ! 2087: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xfe540000  ! 2088: LDSH_R	ldsh	[%r16 + %r0], %r31
	.word 0xf8944020  ! 2090: LDUHA_R	lduha	[%r17, %r0] 0x01, %r28
	.word 0xf8946124  ! 2092: LDUHA_I	lduha	[%r17, + 0x0124] %asi, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_168:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_168), 16, 16)) -> intp(2, 0, 1)
iob_intr_2_169:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_169), 16, 16)) -> intp(2, 0, 2c)
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983c5a  ! 2098: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c5a, %hpstate
	ta	T_CHANGE_TO_TL0
iob_intr_2_170:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_170), 16, 16)) -> intp(2, 0, 13)
	.word 0xb824619f  ! 2102: SUB_I	sub 	%r17, 0x019f, %r28
T2_asi_reg_wr_81:
	mov	0x29, %r14
	.word 0xf8f38e80  ! 2105: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb6ad8000  ! 2106: ANDNcc_R	andncc 	%r22, %r0, %r27
	.word 0xf88ca076  ! 2112: LDUBA_I	lduba	[%r18, + 0x0076] %asi, %r28
	.word 0xfa142112  ! 2114: LDUH_I	lduh	[%r16 + 0x0112], %r29
T2_asi_reg_rd_83:
	mov	0x2, %r14
	.word 0xfcdb89e0  ! 2115: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T2_asi_reg_wr_82:
	mov	0x3c4, %r14
	.word 0xf0f38400  ! 2116: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T2_asi_reg_rd_84:
	mov	0x2f, %r14
	.word 0xf8db8e80  ! 2118: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_2_156:
	setx	0x2e0238, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_171:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_171), 16, 16)) -> intp(2, 0, 1d)
T2_asi_reg_rd_85:
	mov	0x2f, %r14
	.word 0xf0db8e40  ! 2125: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfa0d600a  ! 2127: LDUB_I	ldub	[%r21 + 0x000a], %r29
cpu_intr_2_157:
	setx	0x2c0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_172:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_172), 16, 16)) -> intp(2, 0, 26)
	.word 0xf654c000  ! 2134: LDSH_R	ldsh	[%r19 + %r0], %r27
	.word 0xf215e173  ! 2136: LDUH_I	lduh	[%r23 + 0x0173], %r25
cpu_intr_2_158:
	setx	0x2e012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe95c020  ! 2139: LDUHA_R	lduha	[%r23, %r0] 0x01, %r31
cpu_intr_2_159:
	setx	0x2c0233, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_173:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_173), 16, 16)) -> intp(2, 0, 26)
T2_asi_reg_wr_83:
	mov	0x2a, %r14
	.word 0xf0f38400  ! 2143: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbc84c000  ! 2145: ADDcc_R	addcc 	%r19, %r0, %r30
	.word 0xfe154000  ! 2146: LDUH_R	lduh	[%r21 + %r0], %r31
	.word 0xf8d58020  ! 2149: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r28
iob_intr_2_174:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_174), 16, 16)) -> intp(2, 0, 20)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8f902001  ! 2157: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xfa15a133  ! 2161: LDUH_I	lduh	[%r22 + 0x0133], %r29
	.word 0xf84560ce  ! 2165: LDSW_I	ldsw	[%r21 + 0x00ce], %r28
	.word 0xf085606d  ! 2167: LDUWA_I	lduwa	[%r21, + 0x006d] %asi, %r24
cpu_intr_2_160:
	setx	0x2f001f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_84:
	mov	0xc, %r14
	.word 0xf0f38e40  ! 2170: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfc95c020  ! 2171: LDUHA_R	lduha	[%r23, %r0] 0x01, %r30
T2_asi_reg_wr_85:
	mov	0xe, %r14
	.word 0xf0f389e0  ! 2173: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T2_asi_reg_rd_86:
	mov	0x3c0, %r14
	.word 0xfadb8e60  ! 2175: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_2_175:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_175), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_161:
	setx	0x2f033d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_86:
	mov	0x34, %r14
	.word 0xf6f38e40  ! 2183: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf495609d  ! 2184: LDUHA_I	lduha	[%r21, + 0x009d] %asi, %r26
cpu_intr_2_162:
	setx	0x2e0137, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_176:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_176), 16, 16)) -> intp(2, 0, 2c)
	ta	T_CHANGE_TO_TL0
	.word 0xfec54020  ! 2193: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r31
cpu_intr_2_163:
	setx	0x2d033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53d0000  ! 2199: SRA_R	sra 	%r20, %r0, %r26
	.word 0xf804611f  ! 2200: LDUW_I	lduw	[%r17 + 0x011f], %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbc8d8000  ! 2205: ANDcc_R	andcc 	%r22, %r0, %r30
	.word 0xbe348000  ! 2206: ORN_R	orn 	%r18, %r0, %r31
	.word 0xf654c000  ! 2208: LDSH_R	ldsh	[%r19 + %r0], %r27
	.word 0xbebdc000  ! 2209: XNORcc_R	xnorcc 	%r23, %r0, %r31
	.word 0xf80c0000  ! 2210: LDUB_R	ldub	[%r16 + %r0], %r28
T2_asi_reg_rd_87:
	mov	0x3c3, %r14
	.word 0xf2db89e0  ! 2213: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_2_164:
	setx	0x2c0234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3dd000  ! 2215: SRAX_R	srax	%r23, %r0, %r30
	.word 0xf0440000  ! 2217: LDSW_R	ldsw	[%r16 + %r0], %r24
T2_asi_reg_rd_88:
	mov	0x16, %r14
	.word 0xf4db89e0  ! 2218: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb42c0000  ! 2220: ANDN_R	andn 	%r16, %r0, %r26
iob_intr_2_177:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_177), 16, 16)) -> intp(2, 0, 2f)
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x8198284a  ! 2225: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084a, %hpstate
iob_intr_2_178:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_178), 16, 16)) -> intp(2, 0, 36)
cpu_intr_2_165:
	setx	0x2e0013, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_179:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_179), 16, 16)) -> intp(2, 0, 17)
	.word 0xbc9de1fd  ! 2233: XORcc_I	xorcc 	%r23, 0x01fd, %r30
	ta	T_CHANGE_NONHPRIV
iob_intr_2_180:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_180), 16, 16)) -> intp(2, 0, 10)
iob_intr_2_181:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_181), 16, 16)) -> intp(2, 0, 39)
	.word 0xf4040000  ! 2246: LDUW_R	lduw	[%r16 + %r0], %r26
	setx	data_start_4, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982c42  ! 2248: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c42, %hpstate
cpu_intr_2_166:
	setx	0x2f0330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc450000  ! 2252: LDSW_R	ldsw	[%r20 + %r0], %r30
cpu_intr_2_167:
	setx	0x2e0024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2c5e03a  ! 2260: LDSWA_I	ldswa	[%r23, + 0x003a] %asi, %r25
T2_asi_reg_rd_89:
	mov	0x38, %r14
	.word 0xf4db84a0  ! 2261: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf004c000  ! 2262: LDUW_R	lduw	[%r19 + %r0], %r24
	.word 0xf6840020  ! 2263: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r27
T2_asi_reg_rd_90:
	mov	0x3c1, %r14
	.word 0xf4db84a0  ! 2264: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xfac58020  ! 2265: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r29
	.word 0xfc146079  ! 2267: LDUH_I	lduh	[%r17 + 0x0079], %r30
	.word 0xbc848000  ! 2268: ADDcc_R	addcc 	%r18, %r0, %r30
	.word 0xb1641800  ! 2273: MOVcc_R	<illegal instruction>
T2_asi_reg_rd_91:
	mov	0x3c3, %r14
	.word 0xf2db8e40  ! 2274: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_2_168:
	setx	0x2f023b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_169:
	setx	0x2e0311, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_87:
	mov	0x3c3, %r14
	.word 0xf8f38e80  ! 2281: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_2_170:
	setx	0x2f001e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_182:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_182), 16, 16)) -> intp(2, 0, 35)
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982f98  ! 2287: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f98, %hpstate
iob_intr_2_183:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_183), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf44d6192  ! 2289: LDSB_I	ldsb	[%r21 + 0x0192], %r26
T2_asi_reg_rd_92:
	mov	0x11, %r14
	.word 0xf4db89e0  ! 2290: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_2_184:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_184), 16, 16)) -> intp(2, 0, 3c)
T2_asi_reg_rd_93:
	mov	0x3c3, %r14
	.word 0xfadb8400  ! 2293: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf8050000  ! 2296: LDUW_R	lduw	[%r20 + %r0], %r28
	.word 0xf2c4a168  ! 2298: LDSWA_I	ldswa	[%r18, + 0x0168] %asi, %r25
T2_asi_reg_wr_88:
	mov	0xe, %r14
	.word 0xf6f38e40  ! 2302: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb4ad4000  ! 2304: ANDNcc_R	andncc 	%r21, %r0, %r26
	.word 0xf6cd0020  ! 2306: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r27
cpu_intr_2_171:
	setx	0x2e0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfadda1ce  ! 2308: LDXA_I	ldxa	[%r22, + 0x01ce] %asi, %r29
	.word 0xf6cd609e  ! 2311: LDSBA_I	ldsba	[%r21, + 0x009e] %asi, %r27
	.word 0xb09c8000  ! 2312: XORcc_R	xorcc 	%r18, %r0, %r24
	.word 0xb20421c6  ! 2314: ADD_I	add 	%r16, 0x01c6, %r25
	.word 0xb20de194  ! 2315: AND_I	and 	%r23, 0x0194, %r25
cpu_intr_2_172:
	setx	0x33011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b44000  ! 2319: SUBCcc_R	orncc 	%r17, %r0, %r27
iob_intr_2_185:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_185), 16, 16)) -> intp(2, 0, b)
	.word 0xf654610f  ! 2322: LDSH_I	ldsh	[%r17 + 0x010f], %r27
T2_asi_reg_wr_89:
	mov	0x15, %r14
	.word 0xf6f38e40  ! 2327: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_2_186:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_186), 16, 16)) -> intp(2, 0, 28)
	.word 0xfc4c21e6  ! 2330: LDSB_I	ldsb	[%r16 + 0x01e6], %r30
	.word 0xf65c0000  ! 2332: LDX_R	ldx	[%r16 + %r0], %r27
	.word 0xfa54c000  ! 2333: LDSH_R	ldsh	[%r19 + %r0], %r29
T2_asi_reg_rd_94:
	mov	0x3c3, %r14
	.word 0xf8db8e60  ! 2334: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb53c5000  ! 2335: SRAX_R	srax	%r17, %r0, %r26
iob_intr_2_187:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_187), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf054a055  ! 2337: LDSH_I	ldsh	[%r18 + 0x0055], %r24
	.word 0xf8d4c020  ! 2339: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r28
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x819839d2  ! 2340: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19d2, %hpstate
iob_intr_2_188:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_188), 16, 16)) -> intp(2, 0, 2c)
	.word 0xba1d60b0  ! 2342: XOR_I	xor 	%r21, 0x00b0, %r29
iob_intr_2_189:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_189), 16, 16)) -> intp(2, 0, 5)
T2_asi_reg_wr_90:
	mov	0x3c1, %r14
	.word 0xfef384a0  ! 2345: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_190:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_190), 16, 16)) -> intp(2, 0, 2a)
iob_intr_2_191:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_191), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf415e1b1  ! 2351: LDUH_I	lduh	[%r23 + 0x01b1], %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_173:
	setx	0x300025, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_91:
	mov	0x19, %r14
	.word 0xfaf384a0  ! 2357: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xfe04a058  ! 2359: LDUW_I	lduw	[%r18 + 0x0058], %r31
iob_intr_2_192:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_192), 16, 16)) -> intp(2, 0, 2c)
T2_asi_reg_wr_92:
	mov	0x3c6, %r14
	.word 0xfcf38e60  ! 2363: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf44d8000  ! 2367: LDSB_R	ldsb	[%r22 + %r0], %r26
iob_intr_2_193:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_193), 16, 16)) -> intp(2, 0, 30)
	.word 0xfe850020  ! 2370: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r31
cpu_intr_2_174:
	setx	0x33001a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_93:
	mov	0xe, %r14
	.word 0xfaf38e40  ! 2373: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbc84616d  ! 2375: ADDcc_I	addcc 	%r17, 0x016d, %r30
cpu_intr_2_175:
	setx	0x31013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1348000  ! 2377: SRL_R	srl 	%r18, %r0, %r24
T2_asi_reg_wr_94:
	mov	0x38, %r14
	.word 0xf6f38e60  ! 2378: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T2_asi_reg_wr_95:
	mov	0x16, %r14
	.word 0xfcf38e40  ! 2379: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb8340000  ! 2384: ORN_R	orn 	%r16, %r0, %r28
iob_intr_2_194:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_194), 16, 16)) -> intp(2, 0, 0)
	.word 0xf805c000  ! 2386: LDUW_R	lduw	[%r23 + %r0], %r28
cpu_intr_2_176:
	setx	0x310328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2bc4000  ! 2390: XNORcc_R	xnorcc 	%r17, %r0, %r25
	.word 0xb12c0000  ! 2391: SLL_R	sll 	%r16, %r0, %r24
	.word 0xf0d58020  ! 2392: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r24
	.word 0xfecda021  ! 2393: LDSBA_I	ldsba	[%r22, + 0x0021] %asi, %r31
	.word 0xfc85c020  ! 2396: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r30
T2_asi_reg_rd_95:
	mov	0x22, %r14
	.word 0xf0db84a0  ! 2399: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T2_asi_reg_wr_96:
	mov	0x3c6, %r14
	.word 0xf8f384a0  ! 2401: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_2_177:
	setx	0x30010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4d5c020  ! 2404: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r26
T2_asi_reg_wr_97:
	mov	0x26, %r14
	.word 0xfaf38400  ! 2405: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_2_195:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_195), 16, 16)) -> intp(2, 0, 17)
	.word 0xfe1461c5  ! 2411: LDUH_I	lduh	[%r17 + 0x01c5], %r31
	.word 0xf6cd0020  ! 2413: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r27
iob_intr_2_196:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_196), 16, 16)) -> intp(2, 0, 36)
	.word 0xf0958020  ! 2421: LDUHA_R	lduha	[%r22, %r0] 0x01, %r24
T2_asi_reg_rd_96:
	mov	0xd, %r14
	.word 0xf8db8e40  ! 2425: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf0d54020  ! 2426: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r24
	.word 0xf6454000  ! 2428: LDSW_R	ldsw	[%r21 + %r0], %r27
	.word 0xb204e1de  ! 2429: ADD_I	add 	%r19, 0x01de, %r25
T2_asi_reg_rd_97:
	mov	0x1c, %r14
	.word 0xfadb89e0  ! 2430: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_2_197:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_197), 16, 16)) -> intp(2, 0, 38)
	.word 0xfa148000  ! 2433: LDUH_R	lduh	[%r18 + %r0], %r29
	.word 0xf8058000  ! 2436: LDUW_R	lduw	[%r22 + %r0], %r28
T2_asi_reg_wr_98:
	mov	0x2b, %r14
	.word 0xf4f38e40  ! 2437: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfc5c2013  ! 2438: LDX_I	ldx	[%r16 + 0x0013], %r30
	.word 0xf88d0020  ! 2439: LDUBA_R	lduba	[%r20, %r0] 0x01, %r28
	.word 0xf054e1e9  ! 2440: LDSH_I	ldsh	[%r19 + 0x01e9], %r24
	.word 0xf20d204d  ! 2445: LDUB_I	ldub	[%r20 + 0x004d], %r25
	.word 0xb23d8000  ! 2447: XNOR_R	xnor 	%r22, %r0, %r25
cpu_intr_2_178:
	setx	0x300215, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_99:
	mov	0x3c4, %r14
	.word 0xfef38e40  ! 2450: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb00c8000  ! 2451: AND_R	and 	%r18, %r0, %r24
	.word 0xf85c8000  ! 2452: LDX_R	ldx	[%r18 + %r0], %r28
T2_asi_reg_wr_100:
	mov	0x3c5, %r14
	.word 0xfcf38e40  ! 2453: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfc850020  ! 2454: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r30
cpu_intr_2_179:
	setx	0x320212, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_180:
	setx	0x300300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf80c20b4  ! 2467: LDUB_I	ldub	[%r16 + 0x00b4], %r28
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x819829d2  ! 2478: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d2, %hpstate
T2_asi_reg_rd_98:
	mov	0x2b, %r14
	.word 0xf6db8e80  ! 2479: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbc346137  ! 2482: ORN_I	orn 	%r17, 0x0137, %r30
	.word 0xf88d8020  ! 2484: LDUBA_R	lduba	[%r22, %r0] 0x01, %r28
cpu_intr_2_181:
	setx	0x330307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_182:
	setx	0x31023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcad4000  ! 2490: ANDNcc_R	andncc 	%r21, %r0, %r30
	.word 0xb2040000  ! 2491: ADD_R	add 	%r16, %r0, %r25
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_101:
	mov	0x15, %r14
	.word 0xf4f38e40  ! 2496: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf0448000  ! 2500: LDSW_R	ldsw	[%r18 + %r0], %r24
iob_intr_2_198:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_198), 16, 16)) -> intp(2, 0, 3f)
	.word 0xfccd4020  ! 2505: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r30
	.word 0xf6d40020  ! 2506: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r27
	.word 0xf4dc2157  ! 2509: LDXA_I	ldxa	[%r16, + 0x0157] %asi, %r26
cpu_intr_2_183:
	setx	0x310002, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_99:
	mov	0x13, %r14
	.word 0xf4db8e60  ! 2512: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb204c000  ! 2513: ADD_R	add 	%r19, %r0, %r25
	.word 0xf695e0a9  ! 2517: LDUHA_I	lduha	[%r23, + 0x00a9] %asi, %r27
T2_asi_reg_wr_102:
	mov	0x3c3, %r14
	.word 0xf6f38e40  ! 2518: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf8848020  ! 2521: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r28
	.word 0xfe954020  ! 2526: LDUHA_R	lduha	[%r21, %r0] 0x01, %r31
cpu_intr_2_184:
	setx	0x310115, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983958  ! 2533: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1958, %hpstate
	ta	T_CHANGE_TO_TL1
	.word 0xfa44c000  ! 2535: LDSW_R	ldsw	[%r19 + %r0], %r29
T2_asi_reg_wr_103:
	mov	0xb, %r14
	.word 0xf8f389e0  ! 2536: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xfecd0020  ! 2537: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r31
	.word 0xfc444000  ! 2538: LDSW_R	ldsw	[%r17 + %r0], %r30
iob_intr_2_199:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_199), 16, 16)) -> intp(2, 0, 10)
iob_intr_2_200:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_200), 16, 16)) -> intp(2, 0, 2e)
cpu_intr_2_185:
	setx	0x320230, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_186:
	setx	0x330314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8340000  ! 2548: ORN_R	orn 	%r16, %r0, %r28
T2_asi_reg_rd_100:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 2549: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfad5210d  ! 2550: LDSHA_I	ldsha	[%r20, + 0x010d] %asi, %r29
	.word 0xf80dc000  ! 2551: LDUB_R	ldub	[%r23 + %r0], %r28
	.word 0xb63d2170  ! 2553: XNOR_I	xnor 	%r20, 0x0170, %r27
	.word 0xf8848020  ! 2558: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r28
	.word 0xb3348000  ! 2559: SRL_R	srl 	%r18, %r0, %r25
T2_asi_reg_rd_101:
	mov	0x3c6, %r14
	.word 0xfadb8400  ! 2561: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbe95211d  ! 2566: ORcc_I	orcc 	%r20, 0x011d, %r31
cpu_intr_2_187:
	setx	0x31013c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_102:
	mov	0x3c2, %r14
	.word 0xf2db84a0  ! 2569: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T2_asi_reg_wr_104:
	mov	0x3c3, %r14
	.word 0xf0f38e80  ! 2570: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xfa84c020  ! 2571: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r29
	.word 0xfe8c8020  ! 2573: LDUBA_R	lduba	[%r18, %r0] 0x01, %r31
cpu_intr_2_188:
	setx	0x33031a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_105:
	mov	0x1e, %r14
	.word 0xfef38e60  ! 2577: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfcccc020  ! 2580: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r30
	.word 0xf085209e  ! 2582: LDUWA_I	lduwa	[%r20, + 0x009e] %asi, %r24
iob_intr_2_201:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_201), 16, 16)) -> intp(2, 0, 22)
T2_asi_reg_wr_106:
	mov	0x1c, %r14
	.word 0xf0f389e0  ! 2589: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_2_189:
	setx	0x30001f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_190:
	setx	0x300305, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_202:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_202), 16, 16)) -> intp(2, 0, 1e)
cpu_intr_2_191:
	setx	0x330011, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_103:
	mov	0xa, %r14
	.word 0xfedb8400  ! 2610: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_2_192:
	setx	0x33003f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_203:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_203), 16, 16)) -> intp(2, 0, 29)
	.word 0xfe5c4000  ! 2621: LDX_R	ldx	[%r17 + %r0], %r31
	.word 0xf24c21e8  ! 2622: LDSB_I	ldsb	[%r16 + 0x01e8], %r25
	ta	T_CHANGE_TO_TL1
cpu_intr_2_193:
	setx	0x310210, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_194:
	setx	0x32001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85c0000  ! 2628: LDX_R	ldx	[%r16 + %r0], %r28
	.word 0xf2c5c020  ! 2630: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r25
	.word 0xfc95a070  ! 2631: LDUHA_I	lduha	[%r22, + 0x0070] %asi, %r30
T2_asi_reg_wr_107:
	mov	0x1c, %r14
	.word 0xf6f38e40  ! 2632: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_2_195:
	setx	0x310231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc956187  ! 2639: LDUHA_I	lduha	[%r21, + 0x0187] %asi, %r30
iob_intr_2_204:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_204), 16, 16)) -> intp(2, 0, 3e)
cpu_intr_2_196:
	setx	0x320305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4cd6122  ! 2642: LDSBA_I	ldsba	[%r21, + 0x0122] %asi, %r26
	.word 0xb88c0000  ! 2646: ANDcc_R	andcc 	%r16, %r0, %r28
	.word 0xbc45e1a5  ! 2647: ADDC_I	addc 	%r23, 0x01a5, %r30
	.word 0xf00de055  ! 2648: LDUB_I	ldub	[%r23 + 0x0055], %r24
T2_asi_reg_wr_108:
	mov	0x21, %r14
	.word 0xf6f38e60  ! 2655: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_2_205:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_205), 16, 16)) -> intp(2, 0, 13)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_206:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_206), 16, 16)) -> intp(2, 0, 4)
	ta	T_CHANGE_TO_TL1
	.word 0xf40ce194  ! 2666: LDUB_I	ldub	[%r19 + 0x0194], %r26
	.word 0xf404c000  ! 2669: LDUW_R	lduw	[%r19 + %r0], %r26
T2_asi_reg_rd_104:
	mov	0x31, %r14
	.word 0xf8db8e40  ! 2671: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf495a0c7  ! 2673: LDUHA_I	lduha	[%r22, + 0x00c7] %asi, %r26
T2_asi_reg_wr_109:
	mov	0x3c7, %r14
	.word 0xfcf38e80  ! 2676: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T2_asi_reg_rd_105:
	mov	0x14, %r14
	.word 0xf0db8e80  ! 2678: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_2_207:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_207), 16, 16)) -> intp(2, 0, a)
	.word 0xf0956056  ! 2682: LDUHA_I	lduha	[%r21, + 0x0056] %asi, %r24
	.word 0xb92d2001  ! 2683: SLL_I	sll 	%r20, 0x0001, %r28
	.word 0xfc4cc000  ! 2685: LDSB_R	ldsb	[%r19 + %r0], %r30
	.word 0xf6d50020  ! 2687: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r27
	.word 0xfe154000  ! 2688: LDUH_R	lduh	[%r21 + %r0], %r31
cpu_intr_2_197:
	setx	0x33032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb02d8000  ! 2700: ANDN_R	andn 	%r22, %r0, %r24
	.word 0xfccda015  ! 2701: LDSBA_I	ldsba	[%r22, + 0x0015] %asi, %r30
	.word 0xf6cc8020  ! 2703: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r27
	.word 0xfc158000  ! 2705: LDUH_R	lduh	[%r22 + %r0], %r30
	.word 0xf6cd61d9  ! 2706: LDSBA_I	ldsba	[%r21, + 0x01d9] %asi, %r27
cpu_intr_2_198:
	setx	0x330010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8cc020  ! 2714: LDUBA_R	lduba	[%r19, %r0] 0x01, %r29
cpu_intr_2_199:
	setx	0x320318, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_200:
	setx	0x32022b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_208:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_208), 16, 16)) -> intp(2, 0, 3d)
cpu_intr_2_201:
	setx	0x300130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe150000  ! 2719: LDUH_R	lduh	[%r20 + %r0], %r31
cpu_intr_2_202:
	setx	0x330236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf214c000  ! 2721: LDUH_R	lduh	[%r19 + %r0], %r25
	.word 0xf4140000  ! 2723: LDUH_R	lduh	[%r16 + %r0], %r26
T2_asi_reg_rd_106:
	mov	0x3c5, %r14
	.word 0xfcdb89e0  ! 2727: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf255613f  ! 2728: LDSH_I	ldsh	[%r21 + 0x013f], %r25
	.word 0xfe0d61fc  ! 2731: LDUB_I	ldub	[%r21 + 0x01fc], %r31
cpu_intr_2_203:
	setx	0x32000c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_209:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_209), 16, 16)) -> intp(2, 0, 19)
cpu_intr_2_204:
	setx	0x30000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe14e180  ! 2739: LDUH_I	lduh	[%r19 + 0x0180], %r31
T2_asi_reg_rd_107:
	mov	0x12, %r14
	.word 0xf0db8e40  ! 2742: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf295e087  ! 2744: LDUHA_I	lduha	[%r23, + 0x0087] %asi, %r25
	.word 0xbc352187  ! 2748: SUBC_I	orn 	%r20, 0x0187, %r30
T2_asi_reg_wr_110:
	mov	0x3c6, %r14
	.word 0xfef389e0  ! 2749: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf60dc000  ! 2750: LDUB_R	ldub	[%r23 + %r0], %r27
	.word 0xf44d4000  ! 2752: LDSB_R	ldsb	[%r21 + %r0], %r26
cpu_intr_2_205:
	setx	0x300317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_206:
	setx	0x31001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf805e044  ! 2761: LDUW_I	lduw	[%r23 + 0x0044], %r28
	.word 0xfe150000  ! 2762: LDUH_R	lduh	[%r20 + %r0], %r31
	.word 0xf4844020  ! 2764: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r26
	.word 0xf25da1e0  ! 2766: LDX_I	ldx	[%r22 + 0x01e0], %r25
T2_asi_reg_wr_111:
	mov	0x11, %r14
	.word 0xf6f38e60  ! 2767: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T2_asi_reg_wr_112:
	mov	0x3c4, %r14
	.word 0xf4f38e40  ! 2771: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf6cd8020  ! 2773: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r27
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
	.word 0xbc448000  ! 2779: ADDC_R	addc 	%r18, %r0, %r30
	.word 0xf84dc000  ! 2780: LDSB_R	ldsb	[%r23 + %r0], %r28
T2_asi_reg_wr_113:
	mov	0x1a, %r14
	.word 0xf8f38e80  ! 2782: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf054e1ff  ! 2785: LDSH_I	ldsh	[%r19 + 0x01ff], %r24
cpu_intr_2_207:
	setx	0x360032, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_210:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_210), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_rd_108:
	mov	0x3c8, %r14
	.word 0xf4db8e40  ! 2796: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_wr_114:
	mov	0x3c7, %r14
	.word 0xfcf38e80  ! 2797: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_2_208:
	setx	0x350116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfacd0020  ! 2801: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r29
T2_asi_reg_rd_109:
	mov	0x3c8, %r14
	.word 0xfadb8400  ! 2803: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf64ca184  ! 2804: LDSB_I	ldsb	[%r18 + 0x0184], %r27
T2_asi_reg_rd_110:
	mov	0x3c3, %r14
	.word 0xf4db8400  ! 2811: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T2_asi_reg_rd_111:
	mov	0x3c6, %r14
	.word 0xfcdb84a0  ! 2812: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_2_211:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_211), 16, 16)) -> intp(2, 0, f)
T2_asi_reg_wr_115:
	mov	0x21, %r14
	.word 0xf2f384a0  ! 2818: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf8552106  ! 2820: LDSH_I	ldsh	[%r20 + 0x0106], %r28
cpu_intr_2_209:
	setx	0x35013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba45e13a  ! 2823: ADDC_I	addc 	%r23, 0x013a, %r29
T2_asi_reg_wr_116:
	mov	0x2a, %r14
	.word 0xf4f38400  ! 2824: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_2_210:
	setx	0x35031e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_212:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_212), 16, 16)) -> intp(2, 0, 1e)
	.word 0xfcc54020  ! 2831: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r30
	.word 0xf2d54020  ! 2834: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r25
iob_intr_2_213:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_213), 16, 16)) -> intp(2, 0, 13)
cpu_intr_2_211:
	setx	0x360137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcd5204e  ! 2838: LDSHA_I	ldsha	[%r20, + 0x004e] %asi, %r30
	.word 0xf84461dc  ! 2840: LDSW_I	ldsw	[%r17 + 0x01dc], %r28
iob_intr_2_214:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_214), 16, 16)) -> intp(2, 0, 3d)
iob_intr_2_215:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_215), 16, 16)) -> intp(2, 0, 2d)
T2_asi_reg_rd_112:
	mov	0x28, %r14
	.word 0xfedb8e60  ! 2845: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf20420c9  ! 2847: LDUW_I	lduw	[%r16 + 0x00c9], %r25
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_212:
	setx	0x370328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8442095  ! 2851: LDSW_I	ldsw	[%r16 + 0x0095], %r28
	.word 0xfa9561ee  ! 2853: LDUHA_I	lduha	[%r21, + 0x01ee] %asi, %r29
	.word 0xfe5c8000  ! 2854: LDX_R	ldx	[%r18 + %r0], %r31
cpu_intr_2_213:
	setx	0x35021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa154000  ! 2861: LDUH_R	lduh	[%r21 + %r0], %r29
T2_asi_reg_wr_117:
	mov	0x2c, %r14
	.word 0xf6f38e80  ! 2863: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb4ad61fc  ! 2864: ANDNcc_I	andncc 	%r21, 0x01fc, %r26
	.word 0xf684e18c  ! 2865: LDUWA_I	lduwa	[%r19, + 0x018c] %asi, %r27
cpu_intr_2_214:
	setx	0x360024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcd44020  ! 2868: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r30
	.word 0xfcd44020  ! 2869: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r30
iob_intr_2_216:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_216), 16, 16)) -> intp(2, 0, 21)
	.word 0xbf643801  ! 2872: MOVcc_I	<illegal instruction>
	.word 0xb77da401  ! 2874: MOVR_I	movre	%r22, 0x1, %r27
cpu_intr_2_215:
	setx	0x34001e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_118:
	mov	0x1f, %r14
	.word 0xfaf38e40  ! 2876: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_217:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_217), 16, 16)) -> intp(2, 0, 0)
	.word 0xfe8c4020  ! 2878: LDUBA_R	lduba	[%r17, %r0] 0x01, %r31
	.word 0xfadda160  ! 2882: LDXA_I	ldxa	[%r22, + 0x0160] %asi, %r29
iob_intr_2_218:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_218), 16, 16)) -> intp(2, 0, 13)
T2_asi_reg_wr_119:
	mov	0x30, %r14
	.word 0xf4f38e60  ! 2887: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_2_219:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_219), 16, 16)) -> intp(2, 0, 21)
iob_intr_2_220:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_220), 16, 16)) -> intp(2, 0, 1c)
cpu_intr_2_216:
	setx	0x360106, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_221:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_221), 16, 16)) -> intp(2, 0, 3c)
iob_intr_2_222:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_222), 16, 16)) -> intp(2, 0, 29)
	.word 0xf0940020  ! 2899: LDUHA_R	lduha	[%r16, %r0] 0x01, %r24
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982d10  ! 2900: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d10, %hpstate
T2_asi_reg_rd_113:
	mov	0x27, %r14
	.word 0xfadb89e0  ! 2906: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T2_asi_reg_rd_114:
	mov	0x14, %r14
	.word 0xfcdb8e40  ! 2911: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_wr_120:
	mov	0xb, %r14
	.word 0xf4f38e60  ! 2915: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T2_asi_reg_wr_121:
	mov	0x29, %r14
	.word 0xf0f384a0  ! 2921: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T2_asi_reg_wr_122:
	mov	0x23, %r14
	.word 0xf2f38e40  ! 2924: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfccca161  ! 2925: LDSBA_I	ldsba	[%r18, + 0x0161] %asi, %r30
cpu_intr_2_217:
	setx	0x36013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2048000  ! 2927: LDUW_R	lduw	[%r18 + %r0], %r25
	.word 0xfadca159  ! 2928: LDXA_I	ldxa	[%r18, + 0x0159] %asi, %r29
T2_asi_reg_rd_115:
	mov	0x3c3, %r14
	.word 0xf0db8e80  ! 2929: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_2_218:
	setx	0x36020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
cpu_intr_2_219:
	setx	0x370306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0854020  ! 2933: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r24
iob_intr_2_223:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_223), 16, 16)) -> intp(2, 0, 17)
	.word 0xf4c4a0d0  ! 2936: LDSWA_I	ldswa	[%r18, + 0x00d0] %asi, %r26
	ta	T_CHANGE_TO_TL0
iob_intr_2_224:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_224), 16, 16)) -> intp(2, 0, 1f)
T2_asi_reg_wr_123:
	mov	0x3c4, %r14
	.word 0xfaf389e0  ! 2945: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf40d4000  ! 2947: LDUB_R	ldub	[%r21 + %r0], %r26
T2_asi_reg_wr_124:
	mov	0x5, %r14
	.word 0xf8f38e40  ! 2949: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfa4dc000  ! 2952: LDSB_R	ldsb	[%r23 + %r0], %r29
	.word 0xfccde06d  ! 2953: LDSBA_I	ldsba	[%r23, + 0x006d] %asi, %r30
iob_intr_2_225:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_225), 16, 16)) -> intp(2, 0, 14)
	.word 0xf48d6129  ! 2962: LDUBA_I	lduba	[%r21, + 0x0129] %asi, %r26
T2_asi_reg_wr_125:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 2963: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_220:
	setx	0x340126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45c4000  ! 2967: LDX_R	ldx	[%r17 + %r0], %r26
T2_asi_reg_rd_116:
	mov	0x20, %r14
	.word 0xfadb8e40  ! 2969: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_wr_126:
	mov	0x33, %r14
	.word 0xfcf38e80  ! 2970: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_2_221:
	setx	0x350037, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_226:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_226), 16, 16)) -> intp(2, 0, 1a)
	.word 0xb80d21c3  ! 2977: AND_I	and 	%r20, 0x01c3, %r28
	.word 0xf4056128  ! 2978: LDUW_I	lduw	[%r21 + 0x0128], %r26
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_117:
	mov	0x27, %r14
	.word 0xf6db8400  ! 2980: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_2_227:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_227), 16, 16)) -> intp(2, 0, 23)
	.word 0xfcd4c020  ! 2988: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r30
	ta	T_CHANGE_NONHPRIV
iob_intr_2_228:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_228), 16, 16)) -> intp(2, 0, f)
	.word 0xb335d000  ! 2994: SRLX_R	srlx	%r23, %r0, %r25
T2_asi_reg_wr_127:
	mov	0x33, %r14
	.word 0xfcf384a0  ! 2996: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_2_222:
	setx	0x340327, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_229:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_229), 16, 16)) -> intp(2, 0, 13)
T2_asi_reg_wr_128:
	mov	0x27, %r14
	.word 0xf8f38e40  ! 3000: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_rd_118:
	mov	0x3c0, %r14
	.word 0xf6db8400  ! 3001: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_2_223:
	setx	0x36012f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_224:
	setx	0x350206, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_119:
	mov	0xe, %r14
	.word 0xfcdb8e80  ! 3009: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf60c8000  ! 3010: LDUB_R	ldub	[%r18 + %r0], %r27
iob_intr_2_230:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_230), 16, 16)) -> intp(2, 0, 10)
	.word 0xfa942159  ! 3015: LDUHA_I	lduha	[%r16, + 0x0159] %asi, %r29
iob_intr_2_231:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_231), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_rd_120:
	mov	0x3c5, %r14
	.word 0xf0db8400  ! 3020: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf4d48020  ! 3021: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r26
	.word 0xb0148000  ! 3023: OR_R	or 	%r18, %r0, %r24
	.word 0xf0140000  ! 3025: LDUH_R	lduh	[%r16 + %r0], %r24
cpu_intr_2_225:
	setx	0x36013f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_232:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_232), 16, 16)) -> intp(2, 0, f)
	.word 0xf014c000  ! 3031: LDUH_R	lduh	[%r19 + %r0], %r24
	ta	T_CHANGE_TO_TL0
	.word 0xf655219e  ! 3034: LDSH_I	ldsh	[%r20 + 0x019e], %r27
cpu_intr_2_226:
	setx	0x34021b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_233:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_233), 16, 16)) -> intp(2, 0, 12)
T2_asi_reg_rd_121:
	mov	0x3c5, %r14
	.word 0xf2db8e80  ! 3037: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_2_234:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_234), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_wr_129:
	mov	0x6, %r14
	.word 0xf8f38e40  ! 3039: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf0146189  ! 3040: LDUH_I	lduh	[%r17 + 0x0189], %r24
	.word 0xb01c20d1  ! 3041: XOR_I	xor 	%r16, 0x00d1, %r24
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982d80  ! 3042: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d80, %hpstate
	.word 0xf4440000  ! 3044: LDSW_R	ldsw	[%r16 + %r0], %r26
	.word 0xbd348000  ! 3045: SRL_R	srl 	%r18, %r0, %r30
	.word 0xbd341000  ! 3046: SRLX_R	srlx	%r16, %r0, %r30
T2_asi_reg_rd_122:
	mov	0x2e, %r14
	.word 0xfcdb8e40  ! 3048: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_2_235:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_235), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf80d200a  ! 3051: LDUB_I	ldub	[%r20 + 0x000a], %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfec561cb  ! 3056: LDSWA_I	ldswa	[%r21, + 0x01cb] %asi, %r31
cpu_intr_2_227:
	setx	0x370122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa458000  ! 3062: LDSW_R	ldsw	[%r22 + %r0], %r29
	.word 0xf80421e0  ! 3063: LDUW_I	lduw	[%r16 + 0x01e0], %r28
T2_asi_reg_wr_130:
	mov	0xd, %r14
	.word 0xf4f38e80  ! 3066: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb92c3001  ! 3068: SLLX_I	sllx	%r16, 0x0001, %r28
	.word 0xb72de001  ! 3069: SLL_I	sll 	%r23, 0x0001, %r27
cpu_intr_2_228:
	setx	0x350116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_236:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_236), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf415e17f  ! 3076: LDUH_I	lduh	[%r23 + 0x017f], %r26
cpu_intr_2_229:
	setx	0x340132, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_237:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_237), 16, 16)) -> intp(2, 0, 2a)
cpu_intr_2_230:
	setx	0x34011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6d58020  ! 3084: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r27
cpu_intr_2_231:
	setx	0x340131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0cd2020  ! 3086: LDSBA_I	ldsba	[%r20, + 0x0020] %asi, %r24
	.word 0xf45ca1ba  ! 3087: LDX_I	ldx	[%r18 + 0x01ba], %r26
iob_intr_2_238:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_238), 16, 16)) -> intp(2, 0, 12)
	.word 0xf814e1fb  ! 3089: LDUH_I	lduh	[%r19 + 0x01fb], %r28
	.word 0x8395215f  ! 3091: WRPR_TNPC_I	wrpr	%r20, 0x015f, %tnpc
	.word 0xfa04a018  ! 3092: LDUW_I	lduw	[%r18 + 0x0018], %r29
	.word 0xf08520c7  ! 3094: LDUWA_I	lduwa	[%r20, + 0x00c7] %asi, %r24
iob_intr_2_239:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_239), 16, 16)) -> intp(2, 0, 2d)
T2_asi_reg_rd_123:
	mov	0x34, %r14
	.word 0xfcdb8e60  ! 3098: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xfc95e14f  ! 3100: LDUHA_I	lduha	[%r23, + 0x014f] %asi, %r30
	ta	T_CHANGE_TO_TL1
	.word 0xb4046197  ! 3102: ADD_I	add 	%r17, 0x0197, %r26
	.word 0xf005c000  ! 3103: LDUW_R	lduw	[%r23 + %r0], %r24
T2_asi_reg_wr_131:
	mov	0x38, %r14
	.word 0xf0f38e40  ! 3104: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_2_240:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_240), 16, 16)) -> intp(2, 0, 22)
T2_asi_reg_rd_124:
	mov	0x31, %r14
	.word 0xf4db89e0  ! 3108: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_2_232:
	setx	0x370215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2150000  ! 3112: LDUH_R	lduh	[%r20 + %r0], %r25
cpu_intr_2_233:
	setx	0x350339, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_234:
	setx	0x35032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44de1b9  ! 3116: LDSB_I	ldsb	[%r23 + 0x01b9], %r26
	.word 0xfc0da130  ! 3117: LDUB_I	ldub	[%r22 + 0x0130], %r30
cpu_intr_2_235:
	setx	0x34031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf014208a  ! 3122: LDUH_I	lduh	[%r16 + 0x008a], %r24
cpu_intr_2_236:
	setx	0x37023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf08c208e  ! 3125: LDUBA_I	lduba	[%r16, + 0x008e] %asi, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_237:
	setx	0x340302, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_132:
	mov	0x3c4, %r14
	.word 0xfef38e40  ! 3130: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb32db001  ! 3134: SLLX_I	sllx	%r22, 0x0001, %r25
iob_intr_2_241:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_241), 16, 16)) -> intp(2, 0, 32)
	.word 0xf05d4000  ! 3139: LDX_R	ldx	[%r21 + %r0], %r24
T2_asi_reg_wr_133:
	mov	0x35, %r14
	.word 0xf8f38400  ! 3143: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf05d604b  ! 3145: LDX_I	ldx	[%r21 + 0x004b], %r24
	.word 0xfe444000  ! 3146: LDSW_R	ldsw	[%r17 + %r0], %r31
	.word 0xf8dc2117  ! 3147: LDXA_I	ldxa	[%r16, + 0x0117] %asi, %r28
	.word 0xf68521f8  ! 3148: LDUWA_I	lduwa	[%r20, + 0x01f8] %asi, %r27
	.word 0xf2054000  ! 3149: LDUW_R	lduw	[%r21 + %r0], %r25
	.word 0xf8c4e0c6  ! 3155: LDSWA_I	ldswa	[%r19, + 0x00c6] %asi, %r28
	.word 0xfa052067  ! 3157: LDUW_I	lduw	[%r20 + 0x0067], %r29
T2_asi_reg_wr_134:
	mov	0x1d, %r14
	.word 0xf8f389e0  ! 3159: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_242:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_242), 16, 16)) -> intp(2, 0, 3f)
	ta	T_CHANGE_TO_TL0
	.word 0xfc0dc000  ! 3169: LDUB_R	ldub	[%r23 + %r0], %r30
	.word 0xfe5c2031  ! 3171: LDX_I	ldx	[%r16 + 0x0031], %r31
T2_asi_reg_wr_135:
	mov	0x3c8, %r14
	.word 0xf6f38e40  ! 3177: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf80d21bc  ! 3179: LDUB_I	ldub	[%r20 + 0x01bc], %r28
cpu_intr_2_238:
	setx	0x350033, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_243:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_243), 16, 16)) -> intp(2, 0, 7)
	.word 0xf645e14c  ! 3183: LDSW_I	ldsw	[%r23 + 0x014c], %r27
	.word 0xf8050000  ! 3188: LDUW_R	lduw	[%r20 + %r0], %r28
iob_intr_2_244:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_244), 16, 16)) -> intp(2, 0, 2)
iob_intr_2_245:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_245), 16, 16)) -> intp(2, 0, 1e)
	.word 0xfc4c0000  ! 3193: LDSB_R	ldsb	[%r16 + %r0], %r30
T2_asi_reg_wr_136:
	mov	0x11, %r14
	.word 0xf8f38e40  ! 3194: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_2_239:
	setx	0x370035, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_246:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_246), 16, 16)) -> intp(2, 0, 3b)
iob_intr_2_247:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_247), 16, 16)) -> intp(2, 0, 16)
	.word 0xf05c60ef  ! 3205: LDX_I	ldx	[%r17 + 0x00ef], %r24
	.word 0xf495a186  ! 3207: LDUHA_I	lduha	[%r22, + 0x0186] %asi, %r26
cpu_intr_2_240:
	setx	0x350305, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_241:
	setx	0x370317, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_248:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_248), 16, 16)) -> intp(2, 0, 23)
	.word 0xf4cd8020  ! 3212: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r26
	.word 0xfcc48020  ! 3214: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r30
T2_asi_reg_rd_125:
	mov	0x34, %r14
	.word 0xf4db8400  ! 3215: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_2_249:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_249), 16, 16)) -> intp(2, 0, 38)
cpu_intr_2_242:
	setx	0x360115, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_250:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_250), 16, 16)) -> intp(2, 0, 3a)
iob_intr_2_251:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_251), 16, 16)) -> intp(2, 0, 24)
cpu_intr_2_243:
	setx	0x390126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6558000  ! 3233: LDSH_R	ldsh	[%r22 + %r0], %r27
cpu_intr_2_244:
	setx	0x38033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfed58020  ! 3236: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r31
	.word 0xf2440000  ! 3237: LDSW_R	ldsw	[%r16 + %r0], %r25
	.word 0xf68d0020  ! 3240: LDUBA_R	lduba	[%r20, %r0] 0x01, %r27
	.word 0xbc34201f  ! 3243: ORN_I	orn 	%r16, 0x001f, %r30
T2_asi_reg_wr_137:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 3248: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfed4e09e  ! 3251: LDSHA_I	ldsha	[%r19, + 0x009e] %asi, %r31
iob_intr_2_252:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_252), 16, 16)) -> intp(2, 0, 3a)
	.word 0xf6d4a0af  ! 3263: LDSHA_I	ldsha	[%r18, + 0x00af] %asi, %r27
	.word 0xf68de181  ! 3264: LDUBA_I	lduba	[%r23, + 0x0181] %asi, %r27
	.word 0xfcdc216c  ! 3265: LDXA_I	ldxa	[%r16, + 0x016c] %asi, %r30
iob_intr_2_253:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_253), 16, 16)) -> intp(2, 0, 1b)
iob_intr_2_254:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_254), 16, 16)) -> intp(2, 0, 1)
	.word 0xf294c020  ! 3272: LDUHA_R	lduha	[%r19, %r0] 0x01, %r25
iob_intr_2_255:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_255), 16, 16)) -> intp(2, 0, 35)
	.word 0xfccd8020  ! 3274: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r30
iob_intr_2_256:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_256), 16, 16)) -> intp(2, 0, 33)
	.word 0xbc148000  ! 3279: OR_R	or 	%r18, %r0, %r30
iob_intr_2_257:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_257), 16, 16)) -> intp(2, 0, 1c)
	.word 0xbc9cc000  ! 3282: XORcc_R	xorcc 	%r19, %r0, %r30
iob_intr_2_258:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_258), 16, 16)) -> intp(2, 0, 17)
	.word 0xf2440000  ! 3285: LDSW_R	ldsw	[%r16 + %r0], %r25
	.word 0xf6d460fc  ! 3288: LDSHA_I	ldsha	[%r17, + 0x00fc] %asi, %r27
	.word 0xbe8d0000  ! 3289: ANDcc_R	andcc 	%r20, %r0, %r31
T2_asi_reg_wr_138:
	mov	0x9, %r14
	.word 0xfcf38e80  ! 3290: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_2_245:
	setx	0x380028, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_259:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_259), 16, 16)) -> intp(2, 0, 11)
	.word 0xb73db001  ! 3293: SRAX_I	srax	%r22, 0x0001, %r27
cpu_intr_2_246:
	setx	0x390334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4cc000  ! 3295: LDSB_R	ldsb	[%r19 + %r0], %r29
	.word 0xf615c000  ! 3296: LDUH_R	lduh	[%r23 + %r0], %r27
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982fc2  ! 3298: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc2, %hpstate
	.word 0xb62ca1d5  ! 3306: ANDN_I	andn 	%r18, 0x01d5, %r27
cpu_intr_2_247:
	setx	0x3a0316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf084a083  ! 3308: LDUWA_I	lduwa	[%r18, + 0x0083] %asi, %r24
	ta	T_CHANGE_TO_TL0
cpu_intr_2_248:
	setx	0x3a032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8c0020  ! 3313: LDUBA_R	lduba	[%r16, %r0] 0x01, %r29
T2_asi_reg_rd_126:
	mov	0x18, %r14
	.word 0xf4db8e60  ! 3314: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xbc84618e  ! 3315: ADDcc_I	addcc 	%r17, 0x018e, %r30
	.word 0xf2948020  ! 3318: LDUHA_R	lduha	[%r18, %r0] 0x01, %r25
	.word 0xfec40020  ! 3320: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r31
	.word 0xb4b4206a  ! 3322: SUBCcc_I	orncc 	%r16, 0x006a, %r26
cpu_intr_2_249:
	setx	0x390128, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983dc8  ! 3325: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dc8, %hpstate
	.word 0xf814a1de  ! 3326: LDUH_I	lduh	[%r18 + 0x01de], %r28
	ta	T_CHANGE_TO_TL0
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982b82  ! 3328: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b82, %hpstate
T2_asi_reg_rd_127:
	mov	0x3c8, %r14
	.word 0xf6db8400  ! 3329: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf2840020  ! 3330: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r25
iob_intr_2_260:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_260), 16, 16)) -> intp(2, 0, 27)
	.word 0xf05dc000  ! 3334: LDX_R	ldx	[%r23 + %r0], %r24
cpu_intr_2_250:
	setx	0x3a030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfecda1ca  ! 3354: LDSBA_I	ldsba	[%r22, + 0x01ca] %asi, %r31
	.word 0xf2456188  ! 3358: LDSW_I	ldsw	[%r21 + 0x0188], %r25
iob_intr_2_261:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_261), 16, 16)) -> intp(2, 0, 31)
T2_asi_reg_wr_139:
	mov	0x3c7, %r14
	.word 0xfcf38e80  ! 3362: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbcb4a194  ! 3366: ORNcc_I	orncc 	%r18, 0x0194, %r30
	.word 0xf0952193  ! 3367: LDUHA_I	lduha	[%r20, + 0x0193] %asi, %r24
	.word 0xf495e0be  ! 3374: LDUHA_I	lduha	[%r23, + 0x00be] %asi, %r26
T2_asi_reg_rd_128:
	mov	0x33, %r14
	.word 0xf0db8e40  ! 3377: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_251:
	setx	0x38033a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_262:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_262), 16, 16)) -> intp(2, 0, 15)
T2_asi_reg_wr_140:
	mov	0x33, %r14
	.word 0xf4f38e60  ! 3380: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_2_252:
	setx	0x3b0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0d209e  ! 3383: LDUB_I	ldub	[%r20 + 0x009e], %r29
	.word 0xb41de14e  ! 3384: XOR_I	xor 	%r23, 0x014e, %r26
cpu_intr_2_253:
	setx	0x380128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2dda1db  ! 3388: LDXA_I	ldxa	[%r22, + 0x01db] %asi, %r25
	.word 0xf6c5e173  ! 3390: LDSWA_I	ldswa	[%r23, + 0x0173] %asi, %r27
cpu_intr_2_254:
	setx	0x3a0203, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_255:
	setx	0x380037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0cc0020  ! 3395: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r24
cpu_intr_2_256:
	setx	0x3b013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb534d000  ! 3399: SRLX_R	srlx	%r19, %r0, %r26
iob_intr_2_263:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_263), 16, 16)) -> intp(2, 0, 32)
	.word 0xf48ca162  ! 3404: LDUBA_I	lduba	[%r18, + 0x0162] %asi, %r26
iob_intr_2_264:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_264), 16, 16)) -> intp(2, 0, d)
iob_intr_2_265:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_265), 16, 16)) -> intp(2, 0, 1)
	.word 0xb17c6401  ! 3407: MOVR_I	movre	%r17, 0x1, %r24
T2_asi_reg_wr_141:
	mov	0xc, %r14
	.word 0xf2f389e0  ! 3409: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf095c020  ! 3410: LDUHA_R	lduha	[%r23, %r0] 0x01, %r24
T2_asi_reg_rd_129:
	mov	0x30, %r14
	.word 0xf4db8e40  ! 3411: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_wr_142:
	mov	0x37, %r14
	.word 0xf4f38e40  ! 3412: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf6146198  ! 3413: LDUH_I	lduh	[%r17 + 0x0198], %r27
	.word 0xb8852043  ! 3414: ADDcc_I	addcc 	%r20, 0x0043, %r28
	.word 0xb73c0000  ! 3418: SRA_R	sra 	%r16, %r0, %r27
cpu_intr_2_257:
	setx	0x380032, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_266:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_266), 16, 16)) -> intp(2, 0, 2c)
	.word 0xfc44c000  ! 3424: LDSW_R	ldsw	[%r19 + %r0], %r30
T2_asi_reg_wr_143:
	mov	0x3c8, %r14
	.word 0xfef38e80  ! 3427: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf25de045  ! 3429: LDX_I	ldx	[%r23 + 0x0045], %r25
	ta	T_CHANGE_TO_TL1
iob_intr_2_267:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_267), 16, 16)) -> intp(2, 0, 16)
cpu_intr_2_258:
	setx	0x380033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0354000  ! 3438: ORN_R	orn 	%r21, %r0, %r24
T2_asi_reg_wr_144:
	mov	0xe, %r14
	.word 0xf6f384a0  ! 3439: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_2_268:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_268), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf415a0b4  ! 3441: LDUH_I	lduh	[%r22 + 0x00b4], %r26
T2_asi_reg_wr_145:
	mov	0x17, %r14
	.word 0xf0f389e0  ! 3443: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T2_asi_reg_wr_146:
	mov	0x2f, %r14
	.word 0xf8f38e80  ! 3444: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf04d6120  ! 3445: LDSB_I	ldsb	[%r21 + 0x0120], %r24
cpu_intr_2_259:
	setx	0x390000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4d21e5  ! 3449: LDSB_I	ldsb	[%r20 + 0x01e5], %r30
iob_intr_2_269:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_269), 16, 16)) -> intp(2, 0, 3f)
T2_asi_reg_wr_147:
	mov	0x1a, %r14
	.word 0xf2f389e0  ! 3455: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	.word 0xb8052012  ! 3461: ADD_I	add 	%r20, 0x0012, %r28
T2_asi_reg_rd_130:
	mov	0x3c1, %r14
	.word 0xfedb84a0  ! 3462: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_2_270:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_270), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_260:
	setx	0x3b0107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf49560bb  ! 3470: LDUHA_I	lduha	[%r21, + 0x00bb] %asi, %r26
T2_asi_reg_rd_131:
	mov	0x3c5, %r14
	.word 0xfcdb8e60  ! 3471: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_2_271:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_271), 16, 16)) -> intp(2, 0, 2f)
	setx	data_start_4, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983b88  ! 3473: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b88, %hpstate
cpu_intr_2_261:
	setx	0x380138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2c40020  ! 3475: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r25
	.word 0xfa440000  ! 3476: LDSW_R	ldsw	[%r16 + %r0], %r29
iob_intr_2_272:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_272), 16, 16)) -> intp(2, 0, 12)
T2_asi_reg_rd_132:
	mov	0x12, %r14
	.word 0xf8db89e0  ! 3483: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb73cb001  ! 3484: SRAX_I	srax	%r18, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_148:
	mov	0x1e, %r14
	.word 0xf6f38e40  ! 3487: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_rd_133:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 3488: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_2_273:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_273), 16, 16)) -> intp(2, 0, 2b)
T2_asi_reg_rd_134:
	mov	0x1, %r14
	.word 0xfcdb89e0  ! 3492: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	ta	T_CHANGE_NONHPRIV
iob_intr_2_274:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_274), 16, 16)) -> intp(2, 0, 30)
	.word 0xf48d60c2  ! 3495: LDUBA_I	lduba	[%r21, + 0x00c2] %asi, %r26
	.word 0xfccd6063  ! 3499: LDSBA_I	ldsba	[%r21, + 0x0063] %asi, %r30
	.word 0xb08d8000  ! 3500: ANDcc_R	andcc 	%r22, %r0, %r24
T2_asi_reg_wr_149:
	mov	0x36, %r14
	.word 0xfef38400  ! 3503: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb6344000  ! 3507: ORN_R	orn 	%r17, %r0, %r27
cpu_intr_2_262:
	setx	0x390324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc544000  ! 3510: LDSH_R	ldsh	[%r17 + %r0], %r30
	.word 0xf45d0000  ! 3513: LDX_R	ldx	[%r20 + %r0], %r26
	ta	T_CHANGE_TO_TL0
iob_intr_2_275:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_275), 16, 16)) -> intp(2, 0, 9)
iob_intr_2_276:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_276), 16, 16)) -> intp(2, 0, 3d)
iob_intr_2_277:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_277), 16, 16)) -> intp(2, 0, 3c)
	.word 0xfc5c8000  ! 3523: LDX_R	ldx	[%r18 + %r0], %r30
iob_intr_2_278:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_278), 16, 16)) -> intp(2, 0, 2b)
cpu_intr_2_263:
	setx	0x380014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb234a1e0  ! 3527: ORN_I	orn 	%r18, 0x01e0, %r25
	.word 0xf45d61cc  ! 3528: LDX_I	ldx	[%r21 + 0x01cc], %r26
	.word 0xfe55a08d  ! 3529: LDSH_I	ldsh	[%r22 + 0x008d], %r31
cpu_intr_2_264:
	setx	0x39000a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_135:
	mov	0x3c1, %r14
	.word 0xf6db8400  ! 3533: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf2c5c020  ! 3535: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r25
cpu_intr_2_265:
	setx	0x38030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5cc000  ! 3540: LDX_R	ldx	[%r19 + %r0], %r29
	.word 0xfa146045  ! 3541: LDUH_I	lduh	[%r17 + 0x0045], %r29
	.word 0xf88d6109  ! 3542: LDUBA_I	lduba	[%r21, + 0x0109] %asi, %r28
T2_asi_reg_rd_136:
	mov	0x35, %r14
	.word 0xf6db8e60  ! 3543: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf4c5e18a  ! 3544: LDSWA_I	ldswa	[%r23, + 0x018a] %asi, %r26
cpu_intr_2_266:
	setx	0x3a0218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa04e110  ! 3550: LDUW_I	lduw	[%r19 + 0x0110], %r29
iob_intr_2_279:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_279), 16, 16)) -> intp(2, 0, 23)
	.word 0xf0c58020  ! 3558: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r24
	.word 0xf85421a3  ! 3559: LDSH_I	ldsh	[%r16 + 0x01a3], %r28
cpu_intr_2_267:
	setx	0x3a0121, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_268:
	setx	0x3a0212, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_137:
	mov	0x5, %r14
	.word 0xf4db84a0  ! 3563: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbc8d8000  ! 3564: ANDcc_R	andcc 	%r22, %r0, %r30
iob_intr_2_280:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_280), 16, 16)) -> intp(2, 0, 15)
	.word 0xfc850020  ! 3572: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r30
	.word 0xb49dc000  ! 3575: XORcc_R	xorcc 	%r23, %r0, %r26
iob_intr_2_281:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_281), 16, 16)) -> intp(2, 0, 18)
	.word 0xfec4c020  ! 3577: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r31
iob_intr_2_282:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_282), 16, 16)) -> intp(2, 0, 3)
iob_intr_2_283:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_283), 16, 16)) -> intp(2, 0, 8)
cpu_intr_2_269:
	setx	0x390131, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_138:
	mov	0x3c5, %r14
	.word 0xfcdb89e0  ! 3585: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xfec54020  ! 3586: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r31
iob_intr_2_284:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_284), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_270:
	setx	0x38021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf695c020  ! 3592: LDUHA_R	lduha	[%r23, %r0] 0x01, %r27
T2_asi_reg_rd_139:
	mov	0x3c0, %r14
	.word 0xf8db8e80  ! 3593: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T2_asi_reg_wr_150:
	mov	0x38, %r14
	.word 0xf2f38e80  ! 3594: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T2_asi_reg_rd_140:
	mov	0x29, %r14
	.word 0xf2db89e0  ! 3595: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbb341000  ! 3598: SRLX_R	srlx	%r16, %r0, %r29
	.word 0xb5341000  ! 3600: SRLX_R	srlx	%r16, %r0, %r26
	.word 0xf81521fa  ! 3603: LDUH_I	lduh	[%r20 + 0x01fa], %r28
	.word 0xf0844020  ! 3604: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r24
	.word 0xbeac0000  ! 3606: ANDNcc_R	andncc 	%r16, %r0, %r31
	.word 0xf85c210b  ! 3612: LDX_I	ldx	[%r16 + 0x010b], %r28
iob_intr_2_285:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_285), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf245a01c  ! 3616: LDSW_I	ldsw	[%r22 + 0x001c], %r25
	.word 0xfa456190  ! 3621: LDSW_I	ldsw	[%r21 + 0x0190], %r29
	.word 0xfe8d0020  ! 3625: LDUBA_R	lduba	[%r20, %r0] 0x01, %r31
	.word 0xf2d48020  ! 3627: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r25
	.word 0xb3520000  ! 3628: RDPR_PIL	<illegal instruction>
	.word 0xf08ca1fe  ! 3630: LDUBA_I	lduba	[%r18, + 0x01fe] %asi, %r24
	.word 0xfc854020  ! 3632: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r30
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_271:
	setx	0x3a033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65cc000  ! 3639: LDX_R	ldx	[%r19 + %r0], %r27
	.word 0xfe444000  ! 3640: LDSW_R	ldsw	[%r17 + %r0], %r31
	.word 0xf6144000  ! 3641: LDUH_R	lduh	[%r17 + %r0], %r27
T2_asi_reg_rd_141:
	mov	0x10, %r14
	.word 0xf8db89e0  ! 3642: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_2_286:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_286), 16, 16)) -> intp(2, 0, 0)
T2_asi_reg_rd_142:
	mov	0xa, %r14
	.word 0xf6db8e80  ! 3644: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T2_asi_reg_wr_151:
	mov	0x3c4, %r14
	.word 0xfcf38e40  ! 3645: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf84c60bb  ! 3646: LDSB_I	ldsb	[%r17 + 0x00bb], %r28
iob_intr_2_287:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_287), 16, 16)) -> intp(2, 0, 37)
	.word 0xf4054000  ! 3649: LDUW_R	lduw	[%r21 + %r0], %r26
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982b88  ! 3653: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b88, %hpstate
	.word 0xf28c4020  ! 3654: LDUBA_R	lduba	[%r17, %r0] 0x01, %r25
	.word 0xfa0d8000  ! 3656: LDUB_R	ldub	[%r22 + %r0], %r29
	.word 0xf25460f1  ! 3657: LDSH_I	ldsh	[%r17 + 0x00f1], %r25
T2_asi_reg_wr_152:
	mov	0x2, %r14
	.word 0xf4f38e80  ! 3658: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T2_asi_reg_rd_143:
	mov	0x4, %r14
	.word 0xfadb89e0  ! 3659: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf84460c5  ! 3661: LDSW_I	ldsw	[%r17 + 0x00c5], %r28
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982f98  ! 3667: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f98, %hpstate
	.word 0xfc8de0c7  ! 3668: LDUBA_I	lduba	[%r23, + 0x00c7] %asi, %r30
	.word 0xf64c0000  ! 3670: LDSB_R	ldsb	[%r16 + %r0], %r27
cpu_intr_2_272:
	setx	0x10018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf644a143  ! 3672: LDSW_I	ldsw	[%r18 + 0x0143], %r27
	.word 0xf20c4000  ! 3673: LDUB_R	ldub	[%r17 + %r0], %r25
	.word 0xf8944020  ! 3674: LDUHA_R	lduha	[%r17, %r0] 0x01, %r28
	.word 0xf4cd6150  ! 3675: LDSBA_I	ldsba	[%r21, + 0x0150] %asi, %r26
iob_intr_2_288:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_288), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf40d6195  ! 3679: LDUB_I	ldub	[%r21 + 0x0195], %r26
	.word 0xf855e12f  ! 3680: LDSH_I	ldsh	[%r23 + 0x012f], %r28
T2_asi_reg_rd_144:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 3681: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_wr_153:
	mov	0x26, %r14
	.word 0xf6f389e0  ! 3682: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf2dca060  ! 3683: LDXA_I	ldxa	[%r18, + 0x0060] %asi, %r25
T2_asi_reg_wr_154:
	mov	0x1d, %r14
	.word 0xfef38e60  ! 3684: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T2_asi_reg_wr_155:
	mov	0x1e, %r14
	.word 0xf2f38e40  ! 3688: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T2_asi_reg_rd_145:
	mov	0x20, %r14
	.word 0xfcdb8e40  ! 3692: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_2_289:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_289), 16, 16)) -> intp(2, 0, 3f)
	.word 0xfa846199  ! 3697: LDUWA_I	lduwa	[%r17, + 0x0199] %asi, %r29
	.word 0xf69521fd  ! 3699: LDUHA_I	lduha	[%r20, + 0x01fd] %asi, %r27
iob_intr_2_290:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_290), 16, 16)) -> intp(2, 0, 0)
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_156:
	mov	0x15, %r14
	.word 0xfaf38e80  ! 3704: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_2_273:
	setx	0x3e0036, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_291:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_291), 16, 16)) -> intp(2, 0, 13)
T2_asi_reg_wr_157:
	mov	0x15, %r14
	.word 0xf2f384a0  ! 3708: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T2_asi_reg_rd_146:
	mov	0x38, %r14
	.word 0xfcdb84a0  ! 3710: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T2_asi_reg_rd_147:
	mov	0x27, %r14
	.word 0xf2db8e80  ! 3711: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb8350000  ! 3714: SUBC_R	orn 	%r20, %r0, %r28
iob_intr_2_292:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_292), 16, 16)) -> intp(2, 0, 21)
	.word 0xf0156096  ! 3718: LDUH_I	lduh	[%r21 + 0x0096], %r24
	.word 0xfc8d4020  ! 3720: LDUBA_R	lduba	[%r21, %r0] 0x01, %r30
iob_intr_2_293:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_293), 16, 16)) -> intp(2, 0, 18)
cpu_intr_2_274:
	setx	0x3e0134, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_294:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_294), 16, 16)) -> intp(2, 0, 20)
	.word 0xf8c4a03b  ! 3730: LDSWA_I	ldswa	[%r18, + 0x003b] %asi, %r28
cpu_intr_2_275:
	setx	0x3f0325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6456125  ! 3737: LDSW_I	ldsw	[%r21 + 0x0125], %r27
	.word 0xfed4614c  ! 3739: LDSHA_I	ldsha	[%r17, + 0x014c] %asi, %r31
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983e98  ! 3740: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e98, %hpstate
	.word 0xfa5d0000  ! 3741: LDX_R	ldx	[%r20 + %r0], %r29
	.word 0xfa8cc020  ! 3742: LDUBA_R	lduba	[%r19, %r0] 0x01, %r29
	.word 0xf04c4000  ! 3743: LDSB_R	ldsb	[%r17 + %r0], %r24
	.word 0xf2cde08e  ! 3745: LDSBA_I	ldsba	[%r23, + 0x008e] %asi, %r25
cpu_intr_2_276:
	setx	0x3e0107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25c6108  ! 3747: LDX_I	ldx	[%r17 + 0x0108], %r25
	.word 0xf40d8000  ! 3751: LDUB_R	ldub	[%r22 + %r0], %r26
	.word 0xfc94200e  ! 3755: LDUHA_I	lduha	[%r16, + 0x000e] %asi, %r30
	.word 0xf40420e6  ! 3756: LDUW_I	lduw	[%r16 + 0x00e6], %r26
	.word 0xbb520000  ! 3757: RDPR_PIL	<illegal instruction>
	.word 0xb09c0000  ! 3760: XORcc_R	xorcc 	%r16, %r0, %r24
	.word 0xfa04a07e  ! 3762: LDUW_I	lduw	[%r18 + 0x007e], %r29
iob_intr_2_295:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_295), 16, 16)) -> intp(2, 0, 0)
T2_asi_reg_rd_148:
	mov	0x1, %r14
	.word 0xfedb8e40  ! 3765: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T2_asi_reg_wr_158:
	mov	0x36, %r14
	.word 0xfcf38400  ! 3766: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_2_277:
	setx	0x3f0123, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_159:
	mov	0x33, %r14
	.word 0xfef38e60  ! 3776: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T2_asi_reg_rd_149:
	mov	0x3c6, %r14
	.word 0xf4db8e60  ! 3777: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_2_278:
	setx	0x3d0030, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_150:
	mov	0x26, %r14
	.word 0xf2db8400  ! 3785: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xbaa5207a  ! 3787: SUBcc_I	subcc 	%r20, 0x007a, %r29
	.word 0xbc3c60e6  ! 3789: XNOR_I	xnor 	%r17, 0x00e6, %r30
	.word 0xb014a113  ! 3790: OR_I	or 	%r18, 0x0113, %r24
	.word 0xfcd5e160  ! 3793: LDSHA_I	ldsha	[%r23, + 0x0160] %asi, %r30
iob_intr_2_296:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_296), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_rd_151:
	mov	0x2f, %r14
	.word 0xf4db8e60  ! 3795: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_2_279:
	setx	0x3f0132, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_160:
	mov	0x3c7, %r14
	.word 0xf6f389e0  ! 3803: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf604a127  ! 3804: LDUW_I	lduw	[%r18 + 0x0127], %r27
	.word 0xfe54c000  ! 3807: LDSH_R	ldsh	[%r19 + %r0], %r31
	.word 0xb43ce0df  ! 3808: XNOR_I	xnor 	%r19, 0x00df, %r26
	.word 0xfe8d61ca  ! 3809: LDUBA_I	lduba	[%r21, + 0x01ca] %asi, %r31
iob_intr_2_297:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_297), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_rd_152:
	mov	0x5, %r14
	.word 0xfadb89e0  ! 3813: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T2_asi_reg_rd_153:
	mov	0x15, %r14
	.word 0xfedb8400  ! 3814: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T2_asi_reg_wr_161:
	mov	0x3c7, %r14
	.word 0xf6f38400  ! 3815: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_2_298:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_298), 16, 16)) -> intp(2, 0, 1e)
iob_intr_2_299:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_299), 16, 16)) -> intp(2, 0, 2b)
T2_asi_reg_rd_154:
	mov	0x3c4, %r14
	.word 0xfcdb8e80  ! 3818: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb32c2001  ! 3819: SLL_I	sll 	%r16, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_300:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_300), 16, 16)) -> intp(2, 0, d)
T2_asi_reg_rd_155:
	mov	0x17, %r14
	.word 0xfadb8e80  ! 3826: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xfc440000  ! 3829: LDSW_R	ldsw	[%r16 + %r0], %r30
cpu_intr_2_280:
	setx	0x3e010d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_281:
	setx	0x3c0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb014e145  ! 3837: OR_I	or 	%r19, 0x0145, %r24
	.word 0xfc8cc020  ! 3842: LDUBA_R	lduba	[%r19, %r0] 0x01, %r30
	.word 0xfa854020  ! 3843: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r29
	.word 0xfe5dc000  ! 3844: LDX_R	ldx	[%r23 + %r0], %r31
	.word 0xf60d0000  ! 3845: LDUB_R	ldub	[%r20 + %r0], %r27
cpu_intr_2_282:
	setx	0x3c011d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_301:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_301), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_283:
	setx	0x3e0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbab5e14c  ! 3854: ORNcc_I	orncc 	%r23, 0x014c, %r29
cpu_intr_2_284:
	setx	0x3f0310, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_302:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_302), 16, 16)) -> intp(2, 0, 38)
	.word 0xf884a01f  ! 3866: LDUWA_I	lduwa	[%r18, + 0x001f] %asi, %r28
	ta	T_CHANGE_HPRIV
	.word 0xf005e10a  ! 3869: LDUW_I	lduw	[%r23 + 0x010a], %r24
iob_intr_2_303:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_303), 16, 16)) -> intp(2, 0, 19)
cpu_intr_2_285:
	setx	0x3f031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8d46026  ! 3873: LDSHA_I	ldsha	[%r17, + 0x0026] %asi, %r28
T2_asi_reg_rd_156:
	mov	0x3c3, %r14
	.word 0xf4db89e0  ! 3874: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbe9d0000  ! 3875: XORcc_R	xorcc 	%r20, %r0, %r31
	.word 0xf44ca0f5  ! 3880: LDSB_I	ldsb	[%r18 + 0x00f5], %r26
	.word 0xf44d4000  ! 3881: LDSB_R	ldsb	[%r21 + %r0], %r26
iob_intr_2_304:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_304), 16, 16)) -> intp(2, 0, 30)
iob_intr_2_305:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_305), 16, 16)) -> intp(2, 0, 36)
T2_asi_reg_wr_162:
	mov	0xa, %r14
	.word 0xf8f389e0  ! 3889: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982fd8  ! 3890: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd8, %hpstate
	.word 0xf0d5e026  ! 3891: LDSHA_I	ldsha	[%r23, + 0x0026] %asi, %r24
	.word 0xf4cc8020  ! 3894: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r26
	.word 0xfed54020  ! 3896: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r31
T2_asi_reg_wr_163:
	mov	0x30, %r14
	.word 0xfef38e60  ! 3897: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_2_306:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_306), 16, 16)) -> intp(2, 0, 29)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf0058000  ! 3906: LDUW_R	lduw	[%r22 + %r0], %r24
	.word 0xb40d8000  ! 3911: AND_R	and 	%r22, %r0, %r26
cpu_intr_2_286:
	setx	0x3c0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe958020  ! 3918: LDUHA_R	lduha	[%r22, %r0] 0x01, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_287:
	setx	0x3e0119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_288:
	setx	0x3c022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba0cc000  ! 3929: AND_R	and 	%r19, %r0, %r29
cpu_intr_2_289:
	setx	0x3f023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb52c1000  ! 3934: SLLX_R	sllx	%r16, %r0, %r26
	.word 0xf6944020  ! 3935: LDUHA_R	lduha	[%r17, %r0] 0x01, %r27
iob_intr_2_307:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_307), 16, 16)) -> intp(2, 0, e)
	.word 0xfacd8020  ! 3938: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r29
cpu_intr_2_290:
	setx	0x3d0217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0cc0020  ! 3940: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r24
	.word 0xf8454000  ! 3942: LDSW_R	ldsw	[%r21 + %r0], %r28
iob_intr_2_308:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_308), 16, 16)) -> intp(2, 0, a)
	.word 0xfe8ce0a6  ! 3945: LDUBA_I	lduba	[%r19, + 0x00a6] %asi, %r31
T2_asi_reg_wr_164:
	mov	0x3c3, %r14
	.word 0xf8f38e40  ! 3947: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_2_291:
	setx	0x3c013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_165:
	mov	0x31, %r14
	.word 0xf8f38e60  ! 3950: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf08c0020  ! 3952: LDUBA_R	lduba	[%r16, %r0] 0x01, %r24
T2_asi_reg_rd_157:
	mov	0x3c6, %r14
	.word 0xfadb8e80  ! 3953: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xfc0d8000  ! 3954: LDUB_R	ldub	[%r22 + %r0], %r30
	.word 0xb5641800  ! 3956: MOVcc_R	<illegal instruction>
cpu_intr_2_292:
	setx	0x3e021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_2_309:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_309), 16, 16)) -> intp(2, 0, 28)
iob_intr_2_310:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_310), 16, 16)) -> intp(2, 0, 1c)
	.word 0xb7518000  ! 3964: RDPR_PSTATE	<illegal instruction>
	.word 0xb495a14d  ! 3965: ORcc_I	orcc 	%r22, 0x014d, %r26
cpu_intr_2_293:
	setx	0x3c011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf204a199  ! 3968: LDUW_I	lduw	[%r18 + 0x0199], %r25
	.word 0xf84da186  ! 3971: LDSB_I	ldsb	[%r22 + 0x0186], %r28
	.word 0xbe348000  ! 3972: SUBC_R	orn 	%r18, %r0, %r31
	.word 0xf60c8000  ! 3973: LDUB_R	ldub	[%r18 + %r0], %r27
cpu_intr_2_294:
	setx	0x3e0226, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_166:
	mov	0x33, %r14
	.word 0xf6f38e40  ! 3980: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfe14a124  ! 3981: LDUH_I	lduh	[%r18 + 0x0124], %r31
	.word 0xf6844020  ! 3982: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r27
T2_asi_reg_rd_158:
	mov	0x3c5, %r14
	.word 0xfcdb8400  ! 3988: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_2_295:
	setx	0x3d012d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_311:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_311), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_wr_167:
	mov	0x14, %r14
	.word 0xf0f384a0  ! 4005: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb0244000  ! 4010: SUB_R	sub 	%r17, %r0, %r24
iob_intr_2_312:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_312), 16, 16)) -> intp(2, 0, e)
	.word 0xf244c000  ! 4012: LDSW_R	ldsw	[%r19 + %r0], %r25
cpu_intr_2_296:
	setx	0x3e0015, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_159:
	mov	0x3c1, %r14
	.word 0xfedb8e40  ! 4015: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_2_313:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_313), 16, 16)) -> intp(2, 0, 36)
cpu_intr_2_297:
	setx	0x3c0303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d4e0d2  ! 4019: LDSHA_I	ldsha	[%r19, + 0x00d2] %asi, %r25
iob_intr_2_314:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_314), 16, 16)) -> intp(2, 0, 37)
iob_intr_2_315:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_315), 16, 16)) -> intp(2, 0, 27)
iob_intr_2_316:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_316), 16, 16)) -> intp(2, 0, 19)
cpu_intr_2_298:
	setx	0x3d003d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_160:
	mov	0x4, %r14
	.word 0xfedb8e40  ! 4032: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	ta	T_CHANGE_HPRIV
	.word 0xf8cce02e  ! 4035: LDSBA_I	ldsba	[%r19, + 0x002e] %asi, %r28
T2_asi_reg_rd_161:
	mov	0xd, %r14
	.word 0xf4db8400  ! 4038: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_2_317:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_317), 16, 16)) -> intp(2, 0, 11)
iob_intr_2_318:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_318), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_rd_162:
	mov	0x28, %r14
	.word 0xf4db84a0  ! 4042: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_2_299:
	setx	0x3d0035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_300:
	setx	0x3e0339, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_301:
	setx	0x3c020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb92de001  ! 4058: SLL_I	sll 	%r23, 0x0001, %r28
cpu_intr_2_302:
	setx	0x3f0326, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_163:
	mov	0x1f, %r14
	.word 0xfedb8e60  ! 4064: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf44c4000  ! 4067: LDSB_R	ldsb	[%r17 + %r0], %r26
T2_asi_reg_rd_164:
	mov	0x1f, %r14
	.word 0xf4db8e80  ! 4068: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xf28d6149  ! 4070: LDUBA_I	lduba	[%r21, + 0x0149] %asi, %r25
	.word 0xf2c4a097  ! 4074: LDSWA_I	ldswa	[%r18, + 0x0097] %asi, %r25
	.word 0xf8cca126  ! 4080: LDSBA_I	ldsba	[%r18, + 0x0126] %asi, %r28
cpu_intr_2_303:
	setx	0x3e0127, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_319:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_319), 16, 16)) -> intp(2, 0, 12)
	.word 0xf8c44020  ! 4084: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r28
	.word 0xf205a18c  ! 4086: LDUW_I	lduw	[%r22 + 0x018c], %r25
cpu_intr_2_304:
	setx	0x3c0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf40d0000  ! 4088: LDUB_R	ldub	[%r20 + %r0], %r26
cpu_intr_2_305:
	setx	0x3d003f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_320:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_320), 16, 16)) -> intp(2, 0, 9)
	.word 0xf094c020  ! 4093: LDUHA_R	lduha	[%r19, %r0] 0x01, %r24
	.word 0xb605c000  ! 4094: ADD_R	add 	%r23, %r0, %r27
iob_intr_2_321:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_321), 16, 16)) -> intp(2, 0, 16)
iob_intr_2_322:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_322), 16, 16)) -> intp(2, 0, 6)
	.word 0xf6540000  ! 4108: LDSH_R	ldsh	[%r16 + %r0], %r27
	.word 0xf24d204c  ! 4109: LDSB_I	ldsb	[%r20 + 0x004c], %r25
iob_intr_2_323:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_323), 16, 16)) -> intp(2, 0, 11)
cpu_intr_2_306:
	setx	0x3f0037, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_324:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_324), 16, 16)) -> intp(2, 0, 2c)
cpu_intr_2_307:
	setx	0x3c032c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_308:
	setx	0x3f030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_168:
	mov	0x25, %r14
	.word 0xf2f384a0  ! 4119: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_2_309:
	setx	0x3d0210, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_325:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_325), 16, 16)) -> intp(2, 0, 3e)
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983a48  ! 4124: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a48, %hpstate
iob_intr_2_326:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_326), 16, 16)) -> intp(2, 0, 10)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf68d60b9  ! 4127: LDUBA_I	lduba	[%r21, + 0x00b9] %asi, %r27
	.word 0xfc95c020  ! 4128: LDUHA_R	lduha	[%r23, %r0] 0x01, %r30
	.word 0xbd50c000  ! 4131: RDPR_TT	<illegal instruction>
T2_asi_reg_rd_165:
	mov	0x2, %r14
	.word 0xf0db8e40  ! 4132: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_310:
	setx	0x3c0022, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_327:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_327), 16, 16)) -> intp(2, 0, 20)
	.word 0xf2c44020  ! 4137: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r25
iob_intr_2_328:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_328), 16, 16)) -> intp(2, 0, 25)
	.word 0xfccc0020  ! 4139: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r30
	ta	T_CHANGE_TO_TL0
	.word 0xf2d4c020  ! 4144: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r25
	.word 0xfc946198  ! 4146: LDUHA_I	lduha	[%r17, + 0x0198] %asi, %r30
	.word 0xb0944000  ! 4147: ORcc_R	orcc 	%r17, %r0, %r24
	ta	T_CHANGE_TO_TL1
iob_intr_2_329:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_329), 16, 16)) -> intp(2, 0, 26)
	.word 0xf6144000  ! 4153: LDUH_R	lduh	[%r17 + %r0], %r27
	.word 0xf4148000  ! 4161: LDUH_R	lduh	[%r18 + %r0], %r26
	.word 0xf6948020  ! 4166: LDUHA_R	lduha	[%r18, %r0] 0x01, %r27
iob_intr_2_330:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_330), 16, 16)) -> intp(2, 0, 3e)
	.word 0xfe454000  ! 4169: LDSW_R	ldsw	[%r21 + %r0], %r31
T2_asi_reg_wr_169:
	mov	0x3c8, %r14
	.word 0xf4f38e40  ! 4174: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_311:
	setx	0x42020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x87952012  ! 4178: WRPR_TT_I	wrpr	%r20, 0x0012, %tt
T2_asi_reg_rd_166:
	mov	0x3c3, %r14
	.word 0xf6db8e80  ! 4180: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T2_asi_reg_wr_170:
	mov	0x24, %r14
	.word 0xf4f38e80  ! 4183: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf64ca1fe  ! 4184: LDSB_I	ldsb	[%r18 + 0x01fe], %r27
	ta	T_CHANGE_TO_TL0
iob_intr_2_331:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_331), 16, 16)) -> intp(2, 0, 4)
	.word 0xb4ac4000  ! 4188: ANDNcc_R	andncc 	%r17, %r0, %r26
cpu_intr_2_312:
	setx	0x42021c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_332:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_332), 16, 16)) -> intp(2, 0, 3f)
cpu_intr_2_313:
	setx	0x43023d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_314:
	setx	0x42013a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_315:
	setx	0x42021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45c8000  ! 4198: LDX_R	ldx	[%r18 + %r0], %r26
	.word 0xb435e074  ! 4202: SUBC_I	orn 	%r23, 0x0074, %r26
	.word 0xbc24a1b0  ! 4206: SUB_I	sub 	%r18, 0x01b0, %r30
	.word 0xfa84217e  ! 4207: LDUWA_I	lduwa	[%r16, + 0x017e] %asi, %r29
	.word 0xf48c4020  ! 4208: LDUBA_R	lduba	[%r17, %r0] 0x01, %r26
iob_intr_2_333:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_333), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_316:
	setx	0x430127, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_317:
	setx	0x40023e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_167:
	mov	0x26, %r14
	.word 0xf0db8e40  ! 4217: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T2_asi_reg_wr_171:
	mov	0x14, %r14
	.word 0xf2f38e60  ! 4227: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_2_318:
	setx	0x40021d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_334:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_334), 16, 16)) -> intp(2, 0, 2)
T2_asi_reg_rd_168:
	mov	0x13, %r14
	.word 0xfcdb8e60  ! 4232: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_2_319:
	setx	0x42033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcc4619b  ! 4237: LDSWA_I	ldswa	[%r17, + 0x019b] %asi, %r30
T2_asi_reg_wr_172:
	mov	0x3c5, %r14
	.word 0xfcf384a0  ! 4239: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T2_asi_reg_wr_173:
	mov	0x1, %r14
	.word 0xf8f384a0  ! 4241: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_2_320:
	setx	0x400307, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_174:
	mov	0x13, %r14
	.word 0xf0f38400  ! 4244: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf0c421d1  ! 4247: LDSWA_I	ldswa	[%r16, + 0x01d1] %asi, %r24
	.word 0xba3dc000  ! 4253: XNOR_R	xnor 	%r23, %r0, %r29
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983f4a  ! 4254: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f4a, %hpstate
iob_intr_2_335:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_335), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf25c8000  ! 4257: LDX_R	ldx	[%r18 + %r0], %r25
iob_intr_2_336:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_336), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_wr_175:
	mov	0x3c1, %r14
	.word 0xf4f389e0  ! 4259: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_2_337:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_337), 16, 16)) -> intp(2, 0, 8)
cpu_intr_2_321:
	setx	0x21d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2c42047  ! 4262: ADDCcc_I	addccc 	%r16, 0x0047, %r25
	.word 0xf495c020  ! 4263: LDUHA_R	lduha	[%r23, %r0] 0x01, %r26
T2_asi_reg_rd_169:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 4266: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf294212b  ! 4269: LDUHA_I	lduha	[%r16, + 0x012b] %asi, %r25
cpu_intr_2_322:
	setx	0x430216, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_323:
	setx	0x41010f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_324:
	setx	0x400028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8395217a  ! 4274: WRPR_TNPC_I	wrpr	%r20, 0x017a, %tnpc
iob_intr_2_338:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_338), 16, 16)) -> intp(2, 0, 3)
T2_asi_reg_rd_170:
	mov	0x2e, %r14
	.word 0xfcdb84a0  ! 4277: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_2_339:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_339), 16, 16)) -> intp(2, 0, b)
	.word 0xb8b54000  ! 4279: SUBCcc_R	orncc 	%r21, %r0, %r28
	.word 0xf4cd0020  ! 4281: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r26
T2_asi_reg_rd_171:
	mov	0x0, %r14
	.word 0xfcdb8e40  ! 4282: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_rd_172:
	mov	0x3c7, %r14
	.word 0xfcdb8e60  ! 4284: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_2_340:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_340), 16, 16)) -> intp(2, 0, 16)
T2_asi_reg_rd_173:
	mov	0x13, %r14
	.word 0xf8db8e60  ! 4286: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf2dd614b  ! 4287: LDXA_I	ldxa	[%r21, + 0x014b] %asi, %r25
	.word 0xb57c6401  ! 4288: MOVR_I	movre	%r17, 0x1, %r26
T2_asi_reg_wr_176:
	mov	0x32, %r14
	.word 0xfcf38e40  ! 4289: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_wr_177:
	mov	0x21, %r14
	.word 0xf0f38e40  ! 4291: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_rd_174:
	mov	0x14, %r14
	.word 0xfedb84a0  ! 4292: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbb2c2001  ! 4293: SLL_I	sll 	%r16, 0x0001, %r29
	.word 0xf64ce186  ! 4294: LDSB_I	ldsb	[%r19 + 0x0186], %r27
iob_intr_2_341:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_341), 16, 16)) -> intp(2, 0, 3a)
T2_asi_reg_wr_178:
	mov	0x15, %r14
	.word 0xfcf38e60  ! 4302: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T2_asi_reg_rd_175:
	mov	0x4, %r14
	.word 0xf0db8e80  ! 4303: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_2_342:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_342), 16, 16)) -> intp(2, 0, f)
cpu_intr_2_325:
	setx	0x410024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_326:
	setx	0x420225, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_343:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_343), 16, 16)) -> intp(2, 0, 32)
iob_intr_2_344:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_344), 16, 16)) -> intp(2, 0, 5)
T2_asi_reg_wr_179:
	mov	0x36, %r14
	.word 0xfef38e60  ! 4312: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	ta	T_CHANGE_TO_TL1
	.word 0xfe0c616d  ! 4314: LDUB_I	ldub	[%r17 + 0x016d], %r31
	.word 0xf2440000  ! 4316: LDSW_R	ldsw	[%r16 + %r0], %r25
	.word 0xbf7c8400  ! 4317: MOVR_R	movre	%r18, %r0, %r31
iob_intr_2_345:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_345), 16, 16)) -> intp(2, 0, e)
iob_intr_2_346:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_346), 16, 16)) -> intp(2, 0, 3c)
	.word 0xfe0c8000  ! 4327: LDUB_R	ldub	[%r18 + %r0], %r31
	.word 0xfe8d2071  ! 4328: LDUBA_I	lduba	[%r20, + 0x0071] %asi, %r31
T2_asi_reg_rd_176:
	mov	0x1d, %r14
	.word 0xf4db84a0  ! 4331: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T2_asi_reg_wr_180:
	mov	0x5, %r14
	.word 0xfcf38400  ! 4332: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_2_347:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_347), 16, 16)) -> intp(2, 0, 14)
	ta	T_CHANGE_NONHPRIV
	.word 0xfcdca02f  ! 4337: LDXA_I	ldxa	[%r18, + 0x002f] %asi, %r30
	.word 0xb950c000  ! 4338: RDPR_TT	<illegal instruction>
T2_asi_reg_rd_177:
	mov	0x3c8, %r14
	.word 0xf0db8e40  ! 4340: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbd3d9000  ! 4342: SRAX_R	srax	%r22, %r0, %r30
cpu_intr_2_327:
	setx	0x420312, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_181:
	mov	0x38, %r14
	.word 0xf0f384a0  ! 4346: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_2_328:
	setx	0x43023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_178:
	mov	0x3c1, %r14
	.word 0xf2db8e80  ! 4348: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0x899421ec  ! 4350: WRPR_TICK_I	wrpr	%r16, 0x01ec, %tick
iob_intr_2_348:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_348), 16, 16)) -> intp(2, 0, 15)
	.word 0xfa45e1a5  ! 4354: LDSW_I	ldsw	[%r23 + 0x01a5], %r29
	.word 0xb89d8000  ! 4359: XORcc_R	xorcc 	%r22, %r0, %r28
cpu_intr_2_329:
	setx	0x430001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0c50020  ! 4365: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r24
cpu_intr_2_330:
	setx	0x42032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf645a029  ! 4368: LDSW_I	ldsw	[%r22 + 0x0029], %r27
	.word 0xf2cd61ea  ! 4369: LDSBA_I	ldsba	[%r21, + 0x01ea] %asi, %r25
T2_asi_reg_rd_179:
	mov	0x3c4, %r14
	.word 0xf2db8e80  ! 4371: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xfe5d8000  ! 4372: LDX_R	ldx	[%r22 + %r0], %r31
iob_intr_2_349:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_349), 16, 16)) -> intp(2, 0, 32)
iob_intr_2_350:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_350), 16, 16)) -> intp(2, 0, 7)
iob_intr_2_351:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_351), 16, 16)) -> intp(2, 0, 16)
	.word 0xf20dc000  ! 4383: LDUB_R	ldub	[%r23 + %r0], %r25
	.word 0xb484c000  ! 4386: ADDcc_R	addcc 	%r19, %r0, %r26
cpu_intr_2_331:
	setx	0x41010c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_332:
	setx	0x400115, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_180:
	mov	0x4, %r14
	.word 0xf2db84a0  ! 4393: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xfc45a037  ! 4396: LDSW_I	ldsw	[%r22 + 0x0037], %r30
iob_intr_2_352:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_352), 16, 16)) -> intp(2, 0, 27)
cpu_intr_2_333:
	setx	0x400231, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf4cce1c7  ! 4407: LDSBA_I	ldsba	[%r19, + 0x01c7] %asi, %r26
	ta	T_CHANGE_HPRIV
	.word 0xfe45a04d  ! 4409: LDSW_I	ldsw	[%r22 + 0x004d], %r31
T2_asi_reg_rd_181:
	mov	0x3c0, %r14
	.word 0xfedb8e80  ! 4411: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf00d6100  ! 4413: LDUB_I	ldub	[%r21 + 0x0100], %r24
T2_asi_reg_rd_182:
	mov	0x1f, %r14
	.word 0xfcdb89e0  ! 4416: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xfe150000  ! 4417: LDUH_R	lduh	[%r20 + %r0], %r31
T2_asi_reg_rd_183:
	mov	0x29, %r14
	.word 0xf6db8e40  ! 4420: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf6450000  ! 4421: LDSW_R	ldsw	[%r20 + %r0], %r27
	.word 0xf6144000  ! 4422: LDUH_R	lduh	[%r17 + %r0], %r27
	.word 0xf08da01a  ! 4424: LDUBA_I	lduba	[%r22, + 0x001a] %asi, %r24
	.word 0xb204e159  ! 4428: ADD_I	add 	%r19, 0x0159, %r25
T2_asi_reg_rd_184:
	mov	0x33, %r14
	.word 0xf4db8e80  ! 4429: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_2_353:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_353), 16, 16)) -> intp(2, 0, 1)
	.word 0xfa840020  ! 4431: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r29
	.word 0xf2d5c020  ! 4434: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r25
T2_asi_reg_wr_182:
	mov	0xd, %r14
	.word 0xf4f38e40  ! 4437: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0x8395a0ea  ! 4438: WRPR_TNPC_I	wrpr	%r22, 0x00ea, %tnpc
	.word 0xfa4d8000  ! 4439: LDSB_R	ldsb	[%r22 + %r0], %r29
	.word 0xf25ca0fd  ! 4441: LDX_I	ldx	[%r18 + 0x00fd], %r25
T2_asi_reg_rd_185:
	mov	0x1c, %r14
	.word 0xfadb84a0  ! 4445: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_2_334:
	setx	0x430114, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x8f902002  ! 4453: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xb4a4e1df  ! 4457: SUBcc_I	subcc 	%r19, 0x01df, %r26
	ta	T_CHANGE_TO_TL0
cpu_intr_2_335:
	setx	0x410113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe55c000  ! 4465: LDSH_R	ldsh	[%r23 + %r0], %r31
	.word 0xb485c000  ! 4467: ADDcc_R	addcc 	%r23, %r0, %r26
cpu_intr_2_336:
	setx	0x400129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2448000  ! 4469: LDSW_R	ldsw	[%r18 + %r0], %r25
cpu_intr_2_337:
	setx	0x410219, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_338:
	setx	0x42021e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_183:
	mov	0xd, %r14
	.word 0xfef38400  ! 4475: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf20c8000  ! 4476: LDUB_R	ldub	[%r18 + %r0], %r25
T2_asi_reg_wr_184:
	mov	0x3c2, %r14
	.word 0xf4f38e60  ! 4479: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_2_339:
	setx	0x400034, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_340:
	setx	0x40002d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_185:
	mov	0x31, %r14
	.word 0xfef384a0  ! 4486: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T2_asi_reg_rd_186:
	mov	0x3c2, %r14
	.word 0xfedb8e60  ! 4487: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_2_341:
	setx	0x43000f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_354:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_354), 16, 16)) -> intp(2, 0, 34)
T2_asi_reg_rd_187:
	mov	0x37, %r14
	.word 0xf2db8e80  ! 4491: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T2_asi_reg_wr_186:
	mov	0x20, %r14
	.word 0xf8f389e0  ! 4492: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_2_342:
	setx	0x400111, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_188:
	mov	0x3c8, %r14
	.word 0xfcdb8e40  ! 4495: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_2_355:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_355), 16, 16)) -> intp(2, 0, 5)
cpu_intr_2_343:
	setx	0x41003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc1521b8  ! 4500: LDUH_I	lduh	[%r20 + 0x01b8], %r30
	.word 0xbc0560f3  ! 4502: ADD_I	add 	%r21, 0x00f3, %r30
T2_asi_reg_wr_187:
	mov	0x2e, %r14
	.word 0xfaf38e60  ! 4506: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xfc5d215d  ! 4508: LDX_I	ldx	[%r20 + 0x015d], %r30
T2_asi_reg_wr_188:
	mov	0x1d, %r14
	.word 0xf4f38e60  ! 4510: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_2_344:
	setx	0x410337, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_356:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_356), 16, 16)) -> intp(2, 0, 20)
T2_asi_reg_rd_189:
	mov	0x15, %r14
	.word 0xfadb8e40  ! 4513: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_2_345:
	setx	0x410139, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_190:
	mov	0x15, %r14
	.word 0xfadb8e60  ! 4515: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf0d421d0  ! 4516: LDSHA_I	ldsha	[%r16, + 0x01d0] %asi, %r24
	.word 0xb8946059  ! 4518: ORcc_I	orcc 	%r17, 0x0059, %r28
iob_intr_2_357:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_357), 16, 16)) -> intp(2, 0, 6)
	.word 0xf8c44020  ! 4524: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r28
cpu_intr_2_346:
	setx	0x410024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_347:
	setx	0x42012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfed4a0e0  ! 4531: LDSHA_I	ldsha	[%r18, + 0x00e0] %asi, %r31
	.word 0xf0054000  ! 4532: LDUW_R	lduw	[%r21 + %r0], %r24
T2_asi_reg_rd_191:
	mov	0x3c0, %r14
	.word 0xf2db8e40  ! 4533: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfc558000  ! 4534: LDSH_R	ldsh	[%r22 + %r0], %r30
	.word 0xf0942164  ! 4536: LDUHA_I	lduha	[%r16, + 0x0164] %asi, %r24
	.word 0xfa0521f6  ! 4537: LDUW_I	lduw	[%r20 + 0x01f6], %r29
T2_asi_reg_rd_192:
	mov	0x10, %r14
	.word 0xf8db8e40  ! 4540: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_2_348:
	setx	0x430311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfedce021  ! 4542: LDXA_I	ldxa	[%r19, + 0x0021] %asi, %r31
cpu_intr_2_349:
	setx	0x410236, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_193:
	mov	0x3c6, %r14
	.word 0xfcdb8e40  ! 4548: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfa4de07e  ! 4552: LDSB_I	ldsb	[%r23 + 0x007e], %r29
	.word 0xb28c60b2  ! 4553: ANDcc_I	andcc 	%r17, 0x00b2, %r25
iob_intr_2_358:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_358), 16, 16)) -> intp(2, 0, 9)
T2_asi_reg_wr_189:
	mov	0x1e, %r14
	.word 0xf0f38e40  ! 4557: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_2_350:
	setx	0x400227, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_351:
	setx	0x410126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2958020  ! 4560: LDUHA_R	lduha	[%r22, %r0] 0x01, %r25
	.word 0xf2cd8020  ! 4563: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r25
iob_intr_2_359:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_359), 16, 16)) -> intp(2, 0, 18)
T2_asi_reg_wr_190:
	mov	0x32, %r14
	.word 0xfaf389e0  ! 4569: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_2_352:
	setx	0x420207, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_353:
	setx	0x400004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb01521f9  ! 4573: OR_I	or 	%r20, 0x01f9, %r24
iob_intr_2_360:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_360), 16, 16)) -> intp(2, 0, 19)
iob_intr_2_361:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_361), 16, 16)) -> intp(2, 0, 15)
iob_intr_2_362:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_362), 16, 16)) -> intp(2, 0, 16)
	.word 0xf695616d  ! 4579: LDUHA_I	lduha	[%r21, + 0x016d] %asi, %r27
iob_intr_2_363:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_363), 16, 16)) -> intp(2, 0, 26)
cpu_intr_2_354:
	setx	0x410220, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_364:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_364), 16, 16)) -> intp(2, 0, 39)
cpu_intr_2_355:
	setx	0x41011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2344000  ! 4590: ORN_R	orn 	%r17, %r0, %r25
	.word 0xf0c5c020  ! 4592: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r24
	.word 0xb61c21ff  ! 4594: XOR_I	xor 	%r16, 0x01ff, %r27
	.word 0xf2dd6099  ! 4596: LDXA_I	ldxa	[%r21, + 0x0099] %asi, %r25
	.word 0xfad40020  ! 4598: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r29
T2_asi_reg_wr_191:
	mov	0x2a, %r14
	.word 0xf2f38e40  ! 4599: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbc3da10a  ! 4600: XNOR_I	xnor 	%r22, 0x010a, %r30
cpu_intr_2_356:
	setx	0x400000, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_365:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_365), 16, 16)) -> intp(2, 0, 34)
cpu_intr_2_357:
	setx	0x440028, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_194:
	mov	0x2d, %r14
	.word 0xf8db8e40  ! 4614: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_2_366:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_366), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_wr_192:
	mov	0x37, %r14
	.word 0xf2f38e40  ! 4616: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf014614a  ! 4618: LDUH_I	lduh	[%r17 + 0x014a], %r24
T2_asi_reg_rd_195:
	mov	0x3c5, %r14
	.word 0xf0db8e40  ! 4619: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T2_asi_reg_wr_193:
	mov	0x27, %r14
	.word 0xfcf38e60  ! 4620: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T2_asi_reg_rd_196:
	mov	0x3c4, %r14
	.word 0xfedb8e60  ! 4621: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf8050000  ! 4624: LDUW_R	lduw	[%r20 + %r0], %r28
	.word 0xb0b4605f  ! 4626: SUBCcc_I	orncc 	%r17, 0x005f, %r24
T2_asi_reg_rd_197:
	mov	0x3c2, %r14
	.word 0xf6db8e80  ! 4628: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982d82  ! 4629: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d82, %hpstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfe14a114  ! 4635: LDUH_I	lduh	[%r18 + 0x0114], %r31
cpu_intr_2_358:
	setx	0x440002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf614a14b  ! 4637: LDUH_I	lduh	[%r18 + 0x014b], %r27
iob_intr_2_367:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_367), 16, 16)) -> intp(2, 0, c)
iob_intr_2_368:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_368), 16, 16)) -> intp(2, 0, 12)
cpu_intr_2_359:
	setx	0x450119, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_194:
	mov	0x38, %r14
	.word 0xfaf38400  ! 4641: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_2_369:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_369), 16, 16)) -> intp(2, 0, 1f)
	.word 0xb72ca001  ! 4645: SLL_I	sll 	%r18, 0x0001, %r27
	.word 0xf00d8000  ! 4646: LDUB_R	ldub	[%r22 + %r0], %r24
T2_asi_reg_wr_195:
	mov	0x32, %r14
	.word 0xf0f38e40  ! 4649: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_rd_198:
	mov	0x1d, %r14
	.word 0xf2db84a0  ! 4653: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xfa85619e  ! 4654: LDUWA_I	lduwa	[%r21, + 0x019e] %asi, %r29
	.word 0xf6d40020  ! 4656: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r27
iob_intr_2_370:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_370), 16, 16)) -> intp(2, 0, 35)
	.word 0xb3518000  ! 4664: RDPR_PSTATE	<illegal instruction>
	.word 0xfe8c614f  ! 4665: LDUBA_I	lduba	[%r17, + 0x014f] %asi, %r31
	.word 0xfa55a16c  ! 4666: LDSH_I	ldsh	[%r22 + 0x016c], %r29
	.word 0xbd641800  ! 4670: MOVcc_R	<illegal instruction>
	.word 0xf444c000  ! 4671: LDSW_R	ldsw	[%r19 + %r0], %r26
	.word 0xf68c0020  ! 4672: LDUBA_R	lduba	[%r16, %r0] 0x01, %r27
T2_asi_reg_rd_199:
	mov	0x3c0, %r14
	.word 0xf0db8e80  ! 4673: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xf014c000  ! 4675: LDUH_R	lduh	[%r19 + %r0], %r24
	.word 0xfe5ca19f  ! 4676: LDX_I	ldx	[%r18 + 0x019f], %r31
	.word 0xb5641800  ! 4678: MOVcc_R	<illegal instruction>
	.word 0xf84d0000  ! 4679: LDSB_R	ldsb	[%r20 + %r0], %r28
T2_asi_reg_wr_196:
	mov	0x36, %r14
	.word 0xfcf38e60  ! 4680: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_2_360:
	setx	0x470127, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_371:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_371), 16, 16)) -> intp(2, 0, f)
	.word 0xfe156096  ! 4686: LDUH_I	lduh	[%r21 + 0x0096], %r31
iob_intr_2_372:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_372), 16, 16)) -> intp(2, 0, 22)
T2_asi_reg_wr_197:
	mov	0x25, %r14
	.word 0xf0f38e60  ! 4690: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_2_361:
	setx	0x460207, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_198:
	mov	0x8, %r14
	.word 0xfef38400  ! 4692: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf284a0d5  ! 4694: LDUWA_I	lduwa	[%r18, + 0x00d5] %asi, %r25
	.word 0xfac54020  ! 4696: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r29
T2_asi_reg_wr_199:
	mov	0x32, %r14
	.word 0xfcf38e40  ! 4697: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_wr_200:
	mov	0x38, %r14
	.word 0xf8f38400  ! 4701: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf21420df  ! 4702: LDUH_I	lduh	[%r16 + 0x00df], %r25
	.word 0xfc95e155  ! 4703: LDUHA_I	lduha	[%r23, + 0x0155] %asi, %r30
	.word 0x8395a0d2  ! 4704: WRPR_TNPC_I	wrpr	%r22, 0x00d2, %tnpc
	.word 0xf614a0e7  ! 4705: LDUH_I	lduh	[%r18 + 0x00e7], %r27
	.word 0xfac42094  ! 4707: LDSWA_I	ldswa	[%r16, + 0x0094] %asi, %r29
cpu_intr_2_362:
	setx	0x470232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4d61d5  ! 4712: LDSB_I	ldsb	[%r21 + 0x01d5], %r30
	.word 0xfc54c000  ! 4717: LDSH_R	ldsh	[%r19 + %r0], %r30
	.word 0xf85dc000  ! 4718: LDX_R	ldx	[%r23 + %r0], %r28
	.word 0xfe452091  ! 4720: LDSW_I	ldsw	[%r20 + 0x0091], %r31
	.word 0xfecde1ee  ! 4722: LDSBA_I	ldsba	[%r23, + 0x01ee] %asi, %r31
cpu_intr_2_363:
	setx	0x46000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf40dc000  ! 4725: LDUB_R	ldub	[%r23 + %r0], %r26
T2_asi_reg_wr_201:
	mov	0x3c0, %r14
	.word 0xfcf38e80  ! 4726: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf285e1f9  ! 4727: LDUWA_I	lduwa	[%r23, + 0x01f9] %asi, %r25
	.word 0xf4dde122  ! 4729: LDXA_I	ldxa	[%r23, + 0x0122] %asi, %r26
	.word 0xf0dda104  ! 4730: LDXA_I	ldxa	[%r22, + 0x0104] %asi, %r24
iob_intr_2_373:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_373), 16, 16)) -> intp(2, 0, 14)
	.word 0xfacc8020  ! 4737: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r29
cpu_intr_2_364:
	setx	0x44002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8394a1a7  ! 4739: WRPR_TNPC_I	wrpr	%r18, 0x01a7, %tnpc
iob_intr_2_374:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_374), 16, 16)) -> intp(2, 0, 24)
	.word 0xf044a1a5  ! 4742: LDSW_I	ldsw	[%r18 + 0x01a5], %r24
T2_asi_reg_rd_200:
	mov	0x3c4, %r14
	.word 0xfadb8e60  ! 4744: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_2_375:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_375), 16, 16)) -> intp(2, 0, 19)
T2_asi_reg_wr_202:
	mov	0x21, %r14
	.word 0xf4f38e80  ! 4746: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL0
	.word 0xf4cc603c  ! 4749: LDSBA_I	ldsba	[%r17, + 0x003c] %asi, %r26
cpu_intr_2_365:
	setx	0x46020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf60d6029  ! 4755: LDUB_I	ldub	[%r21 + 0x0029], %r27
	.word 0xb69dc000  ! 4757: XORcc_R	xorcc 	%r23, %r0, %r27
T2_asi_reg_wr_203:
	mov	0x13, %r14
	.word 0xf4f38e40  ! 4763: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_wr_204:
	mov	0x36, %r14
	.word 0xfaf38e80  ! 4766: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xfe0d6076  ! 4769: LDUB_I	ldub	[%r21 + 0x0076], %r31
	.word 0xf60d4000  ! 4771: LDUB_R	ldub	[%r21 + %r0], %r27
	.word 0xf8556014  ! 4774: LDSH_I	ldsh	[%r21 + 0x0014], %r28
	.word 0xb83cc000  ! 4776: XNOR_R	xnor 	%r19, %r0, %r28
	.word 0xfe042020  ! 4780: LDUW_I	lduw	[%r16 + 0x0020], %r31
	.word 0xf655e17d  ! 4785: LDSH_I	ldsh	[%r23 + 0x017d], %r27
iob_intr_2_376:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_376), 16, 16)) -> intp(2, 0, e)
	.word 0xb335f001  ! 4788: SRLX_I	srlx	%r23, 0x0001, %r25
cpu_intr_2_366:
	setx	0x44023e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_377:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_377), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_rd_201:
	mov	0x3c4, %r14
	.word 0xf2db8e60  ! 4791: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xfccd6099  ! 4792: LDSBA_I	ldsba	[%r21, + 0x0099] %asi, %r30
	.word 0xf20ce02b  ! 4794: LDUB_I	ldub	[%r19 + 0x002b], %r25
cpu_intr_2_367:
	setx	0x46032c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_205:
	mov	0x12, %r14
	.word 0xfef384a0  ! 4797: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_2_368:
	setx	0x470001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6dd21f0  ! 4800: LDXA_I	ldxa	[%r20, + 0x01f0] %asi, %r27
	.word 0xb934d000  ! 4802: SRLX_R	srlx	%r19, %r0, %r28
T2_asi_reg_wr_206:
	mov	0x23, %r14
	.word 0xf2f38e80  ! 4803: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xfa84a183  ! 4804: LDUWA_I	lduwa	[%r18, + 0x0183] %asi, %r29
	.word 0xf40d8000  ! 4807: LDUB_R	ldub	[%r22 + %r0], %r26
T2_asi_reg_rd_202:
	mov	0x17, %r14
	.word 0xfadb8e80  ! 4810: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xfa4c4000  ! 4812: LDSB_R	ldsb	[%r17 + %r0], %r29
	.word 0xfc456119  ! 4815: LDSW_I	ldsw	[%r21 + 0x0119], %r30
T2_asi_reg_wr_207:
	mov	0x27, %r14
	.word 0xfcf38e80  ! 4816: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_2_378:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_378), 16, 16)) -> intp(2, 0, 2f)
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_203:
	mov	0xb, %r14
	.word 0xfcdb84a0  ! 4822: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T2_asi_reg_wr_208:
	mov	0xc, %r14
	.word 0xf0f38e40  ! 4823: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf0950020  ! 4824: LDUHA_R	lduha	[%r20, %r0] 0x01, %r24
iob_intr_2_379:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_379), 16, 16)) -> intp(2, 0, 2)
	.word 0xb23dc000  ! 4827: XNOR_R	xnor 	%r23, %r0, %r25
	.word 0xfe14e0f1  ! 4828: LDUH_I	lduh	[%r19 + 0x00f1], %r31
T2_asi_reg_wr_209:
	mov	0x19, %r14
	.word 0xf2f38400  ! 4829: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xfa148000  ! 4830: LDUH_R	lduh	[%r18 + %r0], %r29
iob_intr_2_380:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_380), 16, 16)) -> intp(2, 0, 14)
	.word 0xfcd58020  ! 4833: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r30
T2_asi_reg_rd_204:
	mov	0x11, %r14
	.word 0xfcdb8e40  ! 4835: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb9504000  ! 4837: RDPR_TNPC	<illegal instruction>
iob_intr_2_381:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_381), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf80de0c4  ! 4841: LDUB_I	ldub	[%r23 + 0x00c4], %r28
	.word 0xf6150000  ! 4842: LDUH_R	lduh	[%r20 + %r0], %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
	.word 0xf81521be  ! 4848: LDUH_I	lduh	[%r20 + 0x01be], %r28
	.word 0xf8d48020  ! 4850: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r28
	.word 0xfc8ce04c  ! 4852: LDUBA_I	lduba	[%r19, + 0x004c] %asi, %r30
	.word 0xf814c000  ! 4855: LDUH_R	lduh	[%r19 + %r0], %r28
	.word 0xf695a1b2  ! 4856: LDUHA_I	lduha	[%r22, + 0x01b2] %asi, %r27
	.word 0xf8140000  ! 4857: LDUH_R	lduh	[%r16 + %r0], %r28
	.word 0xf40560a3  ! 4859: LDUW_I	lduw	[%r21 + 0x00a3], %r26
	.word 0xf60c6170  ! 4860: LDUB_I	ldub	[%r17 + 0x0170], %r27
T2_asi_reg_rd_205:
	mov	0x22, %r14
	.word 0xf2db8e40  ! 4862: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf284c020  ! 4865: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r25
cpu_intr_2_369:
	setx	0x46023e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_206:
	mov	0xd, %r14
	.word 0xf8db8400  ! 4868: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xfed5e0ce  ! 4869: LDSHA_I	ldsha	[%r23, + 0x00ce] %asi, %r31
T2_asi_reg_rd_207:
	mov	0x0, %r14
	.word 0xf0db8e40  ! 4871: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_370:
	setx	0x470018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8458000  ! 4875: LDSW_R	ldsw	[%r22 + %r0], %r28
T2_asi_reg_rd_208:
	mov	0x35, %r14
	.word 0xfcdb8e40  ! 4876: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfccc0020  ! 4877: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r30
T2_asi_reg_wr_210:
	mov	0x1a, %r14
	.word 0xfcf38e40  ! 4878: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf84da1aa  ! 4879: LDSB_I	ldsb	[%r22 + 0x01aa], %r28
	.word 0xfe0de076  ! 4881: LDUB_I	ldub	[%r23 + 0x0076], %r31
cpu_intr_2_371:
	setx	0x44002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc044000  ! 4889: LDUW_R	lduw	[%r17 + %r0], %r30
iob_intr_2_382:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_382), 16, 16)) -> intp(2, 0, e)
	.word 0xfe4561bc  ! 4895: LDSW_I	ldsw	[%r21 + 0x01bc], %r31
	.word 0xfcd58020  ! 4896: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r30
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983808  ! 4897: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1808, %hpstate
	.word 0xf204a0f2  ! 4898: LDUW_I	lduw	[%r18 + 0x00f2], %r25
	.word 0xb2b5a174  ! 4900: SUBCcc_I	orncc 	%r22, 0x0174, %r25
iob_intr_2_383:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_383), 16, 16)) -> intp(2, 0, 39)
	.word 0xfa048000  ! 4902: LDUW_R	lduw	[%r18 + %r0], %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf40d8000  ! 4905: LDUB_R	ldub	[%r22 + %r0], %r26
	.word 0xb33c9000  ! 4906: SRAX_R	srax	%r18, %r0, %r25
iob_intr_2_384:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_384), 16, 16)) -> intp(2, 0, 4)
	.word 0xfe848020  ! 4911: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r31
	.word 0xfe5d8000  ! 4912: LDX_R	ldx	[%r22 + %r0], %r31
T2_asi_reg_rd_209:
	mov	0x1a, %r14
	.word 0xf0db8e60  ! 4913: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T2_asi_reg_rd_210:
	mov	0x6, %r14
	.word 0xf4db8e60  ! 4915: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_2_372:
	setx	0x470319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0c4a175  ! 4917: ADDCcc_I	addccc 	%r18, 0x0175, %r24
	.word 0xf68dc020  ! 4919: LDUBA_R	lduba	[%r23, %r0] 0x01, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf8858020  ! 4921: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r28
	.word 0xf0942150  ! 4922: LDUHA_I	lduha	[%r16, + 0x0150] %asi, %r24
iob_intr_2_385:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_385), 16, 16)) -> intp(2, 0, 2d)
cpu_intr_2_373:
	setx	0x450206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfad44020  ! 4932: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r29
iob_intr_2_386:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_386), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_374:
	setx	0x44030c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_387:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_387), 16, 16)) -> intp(2, 0, 2f)
	.word 0xfa55a1ae  ! 4936: LDSH_I	ldsh	[%r22 + 0x01ae], %r29
T2_asi_reg_wr_211:
	mov	0x3c5, %r14
	.word 0xfaf38e60  ! 4938: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_2_388:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_388), 16, 16)) -> intp(2, 0, 21)
	.word 0xfe4de018  ! 4943: LDSB_I	ldsb	[%r23 + 0x0018], %r31
cpu_intr_2_375:
	setx	0x440029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_389:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_389), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_rd_211:
	mov	0x3c7, %r14
	.word 0xfadb84a0  ! 4947: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbd2c8000  ! 4950: SLL_R	sll 	%r18, %r0, %r30
iob_intr_2_390:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_390), 16, 16)) -> intp(2, 0, 4)
	.word 0xfaccc020  ! 4954: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r29
T2_asi_reg_wr_212:
	mov	0x36, %r14
	.word 0xfef38e40  ! 4958: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_2_376:
	setx	0x470322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa54a140  ! 4964: LDSH_I	ldsh	[%r18 + 0x0140], %r29
iob_intr_2_391:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_391), 16, 16)) -> intp(2, 0, 19)
iob_intr_2_392:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_392), 16, 16)) -> intp(2, 0, 31)
T2_asi_reg_wr_213:
	mov	0x2, %r14
	.word 0xfef38400  ! 4968: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_2_377:
	setx	0x45020f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_214:
	mov	0x3c6, %r14
	.word 0xfaf38e80  ! 4973: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_2_393:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_393), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf8454000  ! 4979: LDSW_R	ldsw	[%r21 + %r0], %r28
	.word 0xf8d4213e  ! 4982: LDSHA_I	ldsha	[%r16, + 0x013e] %asi, %r28
cpu_intr_2_378:
	setx	0x44010f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_394:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_394), 16, 16)) -> intp(2, 0, 34)
	.word 0xf4cda0a3  ! 4990: LDSBA_I	ldsba	[%r22, + 0x00a3] %asi, %r26
T2_asi_reg_wr_215:
	mov	0x3c4, %r14
	.word 0xf8f389e0  ! 4991: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf84c4000  ! 4992: LDSB_R	ldsb	[%r17 + %r0], %r28
T2_asi_reg_rd_212:
	mov	0x3c7, %r14
	.word 0xf0db8e40  ! 4993: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xb80d8000  ! 3: AND_R	and 	%r22, %r0, %r28
T1_asi_reg_rd_0:
	mov	0x3c0, %r14
	.word 0xf0db8e80  ! 5: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb5a50820  ! 6: FADDs	fadds	%f20, %f0, %f26
	.word 0xb3aa8820  ! 7: FMOVG	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_1:
	mov	0xb, %r14
	.word 0xf0db8400  ! 8: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_1_0:
	setx	0x1d0002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a488e0  ! 10: FSUBq	dis not found

cpu_intr_1_1:
	setx	0x1c023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00020  ! 13: FMOVs	fmovs	%f0, %f30
	.word 0xb7a508c0  ! 17: FSUBd	fsubd	%f20, %f0, %f58
	.word 0xb12dd000  ! 19: SLLX_R	sllx	%r23, %r0, %r24
cpu_intr_1_2:
	setx	0x1f0026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5343001  ! 21: SRLX_I	srlx	%r16, 0x0001, %r26
cpu_intr_1_3:
	setx	0x1c0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_0), 16, 16)) -> intp(1, 0, 37)
	.word 0xb08de086  ! 26: ANDcc_I	andcc 	%r23, 0x0086, %r24
	.word 0xbfa549e0  ! 27: FDIVq	dis not found

	.word 0xb7a48860  ! 33: FADDq	dis not found

cpu_intr_1_4:
	setx	0x1d003b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_2:
	mov	0x0, %r14
	.word 0xfcdb8e40  ! 38: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_5:
	setx	0x1c031f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_6:
	setx	0x1f0321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda58840  ! 47: FADDd	faddd	%f22, %f0, %f30
	.word 0xb7ab8820  ! 50: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xb7a54860  ! 52: FADDq	dis not found

	.word 0xb00c4000  ! 53: AND_R	and 	%r17, %r0, %r24
T1_asi_reg_wr_0:
	mov	0x3c7, %r14
	.word 0xfef38e60  ! 57: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb9a80420  ! 59: FMOVRZ	dis not found

iob_intr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_1), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_rd_3:
	mov	0x3c7, %r14
	.word 0xf6db8400  ! 67: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb3a00520  ! 71: FSQRTs	fsqrt	
T1_asi_reg_wr_1:
	mov	0x1d, %r14
	.word 0xf2f38e40  ! 73: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_wr_2:
	mov	0x2b, %r14
	.word 0xfcf38e60  ! 74: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_2), 16, 16)) -> intp(1, 0, d)
	.word 0xb3a00540  ! 79: FSQRTd	fsqrt	
	.word 0xbfa4c9c0  ! 80: FDIVd	fdivd	%f50, %f0, %f62
cpu_intr_1_7:
	setx	0x1d0211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb01d601e  ! 82: XOR_I	xor 	%r21, 0x001e, %r24
T1_asi_reg_rd_4:
	mov	0x13, %r14
	.word 0xf4db89e0  ! 84: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_1_8:
	setx	0x1c022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r23 + %g0] 0xf0, %f2
	.word 0xb3a50940  ! 92: FMULd	fmuld	%f20, %f0, %f56
	.word 0xbfa00540  ! 93: FSQRTd	fsqrt	
iob_intr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_3), 16, 16)) -> intp(1, 0, 1d)
	.word 0xbba88820  ! 95: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb5a50860  ! 97: FADDq	dis not found

	.word 0xbda588a0  ! 99: FSUBs	fsubs	%f22, %f0, %f30
T1_asi_reg_wr_3:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 100: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_1_9:
	setx	0x1c0123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81c20  ! 102: FMOVRGEZ	dis not found

	.word 0xbfa509e0  ! 104: FDIVq	dis not found

	.word 0xb3357001  ! 107: SRLX_I	srlx	%r21, 0x0001, %r25
	.word 0xbba50940  ! 110: FMULd	fmuld	%f20, %f0, %f60
	.word 0xb1a50960  ! 112: FMULq	dis not found

	.word 0xb1a88820  ! 116: FMOVLE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_4:
	mov	0x3c0, %r14
	.word 0xf6f38400  ! 117: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb9a00520  ! 118: FSQRTs	fsqrt	
cpu_intr_1_10:
	setx	0x1f0001, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_5:
	mov	0x2d, %r14
	.word 0xf6db84a0  ! 121: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbf641800  ! 123: MOVcc_R	<illegal instruction>
	.word 0xb1a94820  ! 125: FMOVCS	fmovs	%fcc1, %f0, %f24
cpu_intr_1_11:
	setx	0x1f0108, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_12:
	setx	0x1d021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_4), 16, 16)) -> intp(1, 0, 8)
iob_intr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_5), 16, 16)) -> intp(1, 0, 0)
T1_asi_reg_rd_6:
	mov	0x3c8, %r14
	.word 0xf6db84a0  ! 136: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_1_13:
	setx	0x1f023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda408c0  ! 138: FSUBd	fsubd	%f16, %f0, %f30
iob_intr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_6), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_rd_7:
	mov	0x35, %r14
	.word 0xf4db8400  ! 142: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_1_14:
	setx	0x1c022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00040  ! 148: FMOVd	fmovd	%f0, %f30
	.word 0xb5a589c0  ! 149: FDIVd	fdivd	%f22, %f0, %f26
cpu_intr_1_15:
	setx	0x1f0123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda58960  ! 154: FMULq	dis not found

T1_asi_reg_rd_8:
	mov	0x3c6, %r14
	.word 0xfadb89e0  ! 162: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb8b52133  ! 164: ORNcc_I	orncc 	%r20, 0x0133, %r28
	.word 0xbfa80820  ! 165: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xbba80420  ! 166: FMOVRZ	dis not found

T1_asi_reg_rd_9:
	mov	0x3c7, %r14
	.word 0xfedb8e40  ! 167: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T1_asi_reg_rd_10:
	mov	0x24, %r14
	.word 0xfadb8e40  ! 169: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbda9c820  ! 173: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xbfa48840  ! 174: FADDd	faddd	%f18, %f0, %f62
	.word 0xb93d4000  ! 176: SRA_R	sra 	%r21, %r0, %r28
cpu_intr_1_16:
	setx	0x1e0039, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_7), 16, 16)) -> intp(1, 0, 13)
	.word 0xb7346001  ! 180: SRL_I	srl 	%r17, 0x0001, %r27
	.word 0xbfaa4820  ! 181: FMOVNE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_5:
	mov	0x2a, %r14
	.word 0xfcf38400  ! 182: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb1a548e0  ! 183: FSUBq	dis not found

iob_intr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_8), 16, 16)) -> intp(1, 0, 0)
	.word 0xb3aa0820  ! 187: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xbfaa8820  ! 188: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xb094e0e4  ! 190: ORcc_I	orcc 	%r19, 0x00e4, %r24
	.word 0xbba5c9a0  ! 192: FDIVs	fdivs	%f23, %f0, %f29
	.word 0xb7a509e0  ! 193: FDIVq	dis not found

iob_intr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_9), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_wr_6:
	mov	0x37, %r14
	.word 0xfaf38e40  ! 197: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbe34c000  ! 208: ORN_R	orn 	%r19, %r0, %r31
cpu_intr_1_17:
	setx	0x1e031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80820  ! 211: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
cpu_intr_1_18:
	setx	0x1d002d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_11:
	mov	0x6, %r14
	.word 0xf4db89e0  ! 216: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbd353001  ! 219: SRLX_I	srlx	%r20, 0x0001, %r30
T1_asi_reg_wr_7:
	mov	0x8, %r14
	.word 0xfaf389e0  ! 221: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_10), 16, 16)) -> intp(1, 0, 2f)
iob_intr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_11), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb3ab4820  ! 225: FMOVCC	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_8:
	mov	0x2d, %r14
	.word 0xfcf38e40  ! 226: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_12), 16, 16)) -> intp(1, 0, 13)
	.word 0xb5a81c20  ! 230: FMOVRGEZ	dis not found

	.word 0xbfa80820  ! 233: FMOVN	fmovs	%fcc1, %f0, %f31
iob_intr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_13), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb7a80820  ! 243: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbdabc820  ! 245: FMOVVC	fmovs	%fcc1, %f0, %f30
cpu_intr_1_19:
	setx	0x1c011c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_20:
	setx	0x1c0031, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_9:
	mov	0x4, %r14
	.word 0xfcf38e60  ! 248: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T1_asi_reg_wr_10:
	mov	0x20, %r14
	.word 0xf6f38e40  ! 249: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_21:
	setx	0x1c002f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_14), 16, 16)) -> intp(1, 0, b)
	.word 0xbfa54820  ! 257: FADDs	fadds	%f21, %f0, %f31
T1_asi_reg_wr_11:
	mov	0x3c8, %r14
	.word 0xf2f384a0  ! 259: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_15), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb33d4000  ! 263: SRA_R	sra 	%r21, %r0, %r25
iob_intr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_16), 16, 16)) -> intp(1, 0, d)
	.word 0xb5a00520  ! 268: FSQRTs	fsqrt	
	.word 0xb1a50840  ! 269: FADDd	faddd	%f20, %f0, %f24
	.word 0xb1a448e0  ! 271: FSUBq	dis not found

iob_intr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_17), 16, 16)) -> intp(1, 0, c)
	.word 0xbda80c20  ! 274: FMOVRLZ	dis not found

	.word 0xb7aa4820  ! 277: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb1510000  ! 279: RDPR_TICK	<illegal instruction>
iob_intr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_18), 16, 16)) -> intp(1, 0, 6)
iob_intr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_19), 16, 16)) -> intp(1, 0, 2b)
T1_asi_reg_rd_12:
	mov	0x3c6, %r14
	.word 0xf0db8e40  ! 284: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb9ab0820  ! 285: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xb89d0000  ! 294: XORcc_R	xorcc 	%r20, %r0, %r28
	.word 0xbd35b001  ! 296: SRLX_I	srlx	%r22, 0x0001, %r30
cpu_intr_1_22:
	setx	0x1e0311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80c20  ! 306: FMOVRLZ	dis not found

	.word 0xb9a80420  ! 307: FMOVRZ	dis not found

	.word 0xb9abc820  ! 311: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xb3a81820  ! 312: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb5aa4820  ! 314: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb9a81420  ! 316: FMOVRNZ	dis not found

	.word 0xb1a80820  ! 319: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb1a94820  ! 321: FMOVCS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_13:
	mov	0x3c1, %r14
	.word 0xf0db84a0  ! 326: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbbaa8820  ! 327: FMOVG	fmovs	%fcc1, %f0, %f29
iob_intr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_20), 16, 16)) -> intp(1, 0, 25)
	.word 0xbdaa0820  ! 333: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb9a84820  ! 334: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xbbaac820  ! 336: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xbda98820  ! 337: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb5a509a0  ! 338: FDIVs	fdivs	%f20, %f0, %f26
iob_intr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_21), 16, 16)) -> intp(1, 0, 9)
T1_asi_reg_rd_14:
	mov	0x3c2, %r14
	.word 0xfcdb8400  ! 340: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_1_23:
	setx	0x1f0008, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_24:
	setx	0x1e021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a40960  ! 350: FMULq	dis not found

	.word 0xb2850000  ! 352: ADDcc_R	addcc 	%r20, %r0, %r25
iob_intr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_22), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb5a80820  ! 358: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
iob_intr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_23), 16, 16)) -> intp(1, 0, 21)
	.word 0xb7a00540  ! 361: FSQRTd	fsqrt	
cpu_intr_1_25:
	setx	0x1f0226, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_24), 16, 16)) -> intp(1, 0, 28)
	.word 0xb72cc000  ! 368: SLL_R	sll 	%r19, %r0, %r27
T1_asi_reg_wr_12:
	mov	0x3c1, %r14
	.word 0xfaf38e80  ! 369: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb1a5c9e0  ! 370: FDIVq	dis not found

cpu_intr_1_26:
	setx	0x1c032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00560  ! 372: FSQRTq	fsqrt	
iob_intr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_25), 16, 16)) -> intp(1, 0, 25)
T1_asi_reg_rd_15:
	mov	0x36, %r14
	.word 0xf8db8e60  ! 374: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xbfaac820  ! 375: FMOVGE	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_rd_16:
	mov	0x21, %r14
	.word 0xfadb8e40  ! 380: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbfaa4820  ! 382: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb01c4000  ! 383: XOR_R	xor 	%r17, %r0, %r24
	.word 0xbf35d000  ! 386: SRLX_R	srlx	%r23, %r0, %r31
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xb5a81420  ! 390: FMOVRNZ	dis not found

T1_asi_reg_wr_13:
	mov	0x19, %r14
	.word 0xfcf389e0  ! 391: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_1_27:
	setx	0x1f0304, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xbdab8820  ! 406: FMOVPOS	fmovs	%fcc1, %f0, %f30
iob_intr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_26), 16, 16)) -> intp(1, 0, 26)
	.word 0xbe14e058  ! 409: OR_I	or 	%r19, 0x0058, %r31
	.word 0xbb7da401  ! 410: MOVR_I	movre	%r22, 0x1, %r29
	.word 0xb3a8c820  ! 412: FMOVL	fmovs	%fcc1, %f0, %f25
cpu_intr_1_28:
	setx	0x1e000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81420  ! 417: FMOVRNZ	dis not found

cpu_intr_1_29:
	setx	0x1e0117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a4c9e0  ! 426: FDIVq	dis not found

	.word 0xb7a00560  ! 427: FSQRTq	fsqrt	
iob_intr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_27), 16, 16)) -> intp(1, 0, 30)
	.word 0xbb520000  ! 432: RDPR_PIL	<illegal instruction>
	.word 0xb1a408a0  ! 436: FSUBs	fsubs	%f16, %f0, %f24
	.word 0xbba81420  ! 438: FMOVRNZ	dis not found

cpu_intr_1_30:
	setx	0x1f0230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbabc820  ! 441: FMOVVC	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_17:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 442: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_rd_18:
	mov	0x20, %r14
	.word 0xf6db8e40  ! 443: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_28), 16, 16)) -> intp(1, 0, 2)
cpu_intr_1_31:
	setx	0x1e020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a94820  ! 448: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xb3a488c0  ! 449: FSUBd	fsubd	%f18, %f0, %f56
iob_intr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_29), 16, 16)) -> intp(1, 0, 17)
cpu_intr_1_32:
	setx	0x1e0228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a40920  ! 455: FMULs	fmuls	%f16, %f0, %f27
T1_asi_reg_wr_14:
	mov	0x3c2, %r14
	.word 0xf6f38e60  ! 457: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_30), 16, 16)) -> intp(1, 0, 1e)
	.word 0xbba9c820  ! 461: FMOVVS	fmovs	%fcc1, %f0, %f29
iob_intr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_31), 16, 16)) -> intp(1, 0, 28)
iob_intr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_32), 16, 16)) -> intp(1, 0, 29)
T1_asi_reg_wr_15:
	mov	0x13, %r14
	.word 0xf6f38e40  ! 474: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_33:
	setx	0x220338, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_19:
	mov	0x21, %r14
	.word 0xf6db8e40  ! 484: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb1a4c9a0  ! 485: FDIVs	fdivs	%f19, %f0, %f24
	.word 0xb5a00560  ! 490: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_33), 16, 16)) -> intp(1, 0, 25)
	.word 0xb1a50920  ! 495: FMULs	fmuls	%f20, %f0, %f24
iob_intr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_34), 16, 16)) -> intp(1, 0, 14)
	.word 0xb3a54940  ! 497: FMULd	fmuld	%f52, %f0, %f56
iob_intr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_35), 16, 16)) -> intp(1, 0, 36)
	.word 0xb3a88820  ! 499: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb1a589e0  ! 500: FDIVq	dis not found

	.word 0xb2ace183  ! 506: ANDNcc_I	andncc 	%r19, 0x0183, %r25
	.word 0xb5a48960  ! 507: FMULq	dis not found

	.word 0xbc35e01d  ! 508: ORN_I	orn 	%r23, 0x001d, %r30
cpu_intr_1_34:
	setx	0x22000b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_36), 16, 16)) -> intp(1, 0, 23)
	lda	[%r21 + %g0] 0xf0, %f2
	.word 0xb7ab4820  ! 517: FMOVCC	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_35:
	setx	0x22032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8f902000  ! 523: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xbfab4820  ! 525: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb5a80820  ! 526: FMOVN	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_16:
	mov	0x29, %r14
	.word 0xfaf384a0  ! 527: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_37), 16, 16)) -> intp(1, 0, 9)
	.word 0xb7a5c9a0  ! 529: FDIVs	fdivs	%f23, %f0, %f27
cpu_intr_1_36:
	setx	0x230129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_37:
	setx	0x200002, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_38:
	setx	0x22020a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_38), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_wr_17:
	mov	0x1c, %r14
	.word 0xfcf38e40  ! 542: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_39:
	setx	0x210214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aa0820  ! 547: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb5a00020  ! 549: FMOVs	fmovs	%f0, %f26
iob_intr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_39), 16, 16)) -> intp(1, 0, 14)
	.word 0xb1a58940  ! 551: FMULd	fmuld	%f22, %f0, %f24
	.word 0xb7a489c0  ! 553: FDIVd	fdivd	%f18, %f0, %f58
	.word 0xbda81c20  ! 554: FMOVRGEZ	dis not found

T1_asi_reg_rd_20:
	mov	0x37, %r14
	.word 0xfadb8e80  ! 557: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_1_40:
	setx	0x220112, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_40), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb9a00020  ! 563: FMOVs	fmovs	%f0, %f28
T1_asi_reg_rd_21:
	mov	0x3c2, %r14
	.word 0xf6db8400  ! 564: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_1_41:
	setx	0x200324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00020  ! 568: FMOVs	fmovs	%f0, %f31
	.word 0xb5a4c840  ! 576: FADDd	faddd	%f50, %f0, %f26
	.word 0xbda548e0  ! 577: FSUBq	dis not found

cpu_intr_1_42:
	setx	0x220133, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_41), 16, 16)) -> intp(1, 0, 4)
	.word 0xb08d6174  ! 584: ANDcc_I	andcc 	%r21, 0x0174, %r24
iob_intr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_42), 16, 16)) -> intp(1, 0, 30)
	.word 0xbfaa8820  ! 586: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xbc8d60d0  ! 587: ANDcc_I	andcc 	%r21, 0x00d0, %r30
cpu_intr_1_43:
	setx	0x210135, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_44:
	setx	0x220020, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_18:
	mov	0x1d, %r14
	.word 0xf8f38e40  ! 593: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb6358000  ! 598: SUBC_R	orn 	%r22, %r0, %r27
cpu_intr_1_45:
	setx	0x20012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a488a0  ! 601: FSUBs	fsubs	%f18, %f0, %f28
	.word 0xb3a00020  ! 604: FMOVs	fmovs	%f0, %f25
T1_asi_reg_wr_19:
	mov	0x1c, %r14
	.word 0xf8f38e40  ! 608: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_46:
	setx	0x230319, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r21 + %g0] 0xf0, %f2
cpu_intr_1_47:
	setx	0x21002e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_22:
	mov	0x24, %r14
	.word 0xfedb8e40  ! 613: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_1_48:
	setx	0x22012e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_43), 16, 16)) -> intp(1, 0, 3f)
T1_asi_reg_wr_20:
	mov	0x34, %r14
	.word 0xf4f389e0  ! 620: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_44), 16, 16)) -> intp(1, 0, 32)
	.word 0xbda9c820  ! 624: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb9a81c20  ! 628: FMOVRGEZ	dis not found

	.word 0xb1a00540  ! 629: FSQRTd	fsqrt	
iob_intr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_45), 16, 16)) -> intp(1, 0, 1a)
iob_intr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_46), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb1a80c20  ! 636: FMOVRLZ	dis not found

	.word 0xbe856081  ! 639: ADDcc_I	addcc 	%r21, 0x0081, %r31
	.word 0xbba81420  ! 640: FMOVRNZ	dis not found

	.word 0xb845209a  ! 641: ADDC_I	addc 	%r20, 0x009a, %r28
	.word 0xb6354000  ! 642: ORN_R	orn 	%r21, %r0, %r27
T1_asi_reg_rd_23:
	mov	0x3c1, %r14
	.word 0xfedb8400  ! 643: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb5a508c0  ! 644: FSUBd	fsubd	%f20, %f0, %f26
	.word 0xb1a409c0  ! 645: FDIVd	fdivd	%f16, %f0, %f24
iob_intr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_47), 16, 16)) -> intp(1, 0, 23)
	.word 0xbba4c820  ! 652: FADDs	fadds	%f19, %f0, %f29
iob_intr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_48), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb5a90820  ! 656: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xb92c2001  ! 662: SLL_I	sll 	%r16, 0x0001, %r28
T1_asi_reg_wr_21:
	mov	0x2a, %r14
	.word 0xf8f38e80  ! 663: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	lda	[%r21 + %g0] 0xf0, %f2
cpu_intr_1_49:
	setx	0x20011c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_24:
	mov	0xa, %r14
	.word 0xf2db8e40  ! 667: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_wr_22:
	mov	0x0, %r14
	.word 0xf0f38e60  ! 669: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb7a00040  ! 671: FMOVd	fmovd	%f0, %f58
iob_intr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_49), 16, 16)) -> intp(1, 0, 3b)
cpu_intr_1_50:
	setx	0x210138, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_25:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 676: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb3a58920  ! 680: FMULs	fmuls	%f22, %f0, %f25
iob_intr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_50), 16, 16)) -> intp(1, 0, d)
	.word 0xb5a5c8a0  ! 682: FSUBs	fsubs	%f23, %f0, %f26
	.word 0xb9a00040  ! 683: FMOVd	fmovd	%f0, %f28
	.word 0xbdab4820  ! 684: FMOVCC	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_26:
	mov	0x3c7, %r14
	.word 0xfcdb84a0  ! 685: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_51), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_wr_23:
	mov	0x16, %r14
	.word 0xf4f384a0  ! 695: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb1a00520  ! 698: FSQRTs	fsqrt	
iob_intr_1_52:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_52), 16, 16)) -> intp(1, 0, 1f)
cpu_intr_1_51:
	setx	0x220118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda98820  ! 706: FMOVNEG	fmovs	%fcc1, %f0, %f30
iob_intr_1_53:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_53), 16, 16)) -> intp(1, 0, 1e)
iob_intr_1_54:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_54), 16, 16)) -> intp(1, 0, 13)
cpu_intr_1_52:
	setx	0x200131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb33c4000  ! 719: SRA_R	sra 	%r17, %r0, %r25
cpu_intr_1_53:
	setx	0x22010e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_55:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_55), 16, 16)) -> intp(1, 0, 33)
	.word 0xb7a4c8a0  ! 726: FSUBs	fsubs	%f19, %f0, %f27
iob_intr_1_56:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_56), 16, 16)) -> intp(1, 0, 25)
	.word 0xb1aa8820  ! 729: FMOVG	fmovs	%fcc1, %f0, %f24
iob_intr_1_57:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_57), 16, 16)) -> intp(1, 0, 24)
iob_intr_1_58:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_58), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb3a81420  ! 738: FMOVRNZ	dis not found

cpu_intr_1_54:
	setx	0x220104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a44840  ! 744: FADDd	faddd	%f48, %f0, %f58
	.word 0xb5a54820  ! 745: FADDs	fadds	%f21, %f0, %f26
T1_asi_reg_wr_24:
	mov	0x3c6, %r14
	.word 0xf8f38e80  ! 749: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb3aa8820  ! 751: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb3a48860  ! 752: FADDq	dis not found

	.word 0xba8de0e7  ! 753: ANDcc_I	andcc 	%r23, 0x00e7, %r29
	.word 0xb9a54820  ! 754: FADDs	fadds	%f21, %f0, %f28
iob_intr_1_59:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_59), 16, 16)) -> intp(1, 0, 8)
	.word 0xbfa408c0  ! 757: FSUBd	fsubd	%f16, %f0, %f62
iob_intr_1_60:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_60), 16, 16)) -> intp(1, 0, 30)
	.word 0xb9a00560  ! 759: FSQRTq	fsqrt	
	.word 0xbe94c000  ! 762: ORcc_R	orcc 	%r19, %r0, %r31
	.word 0xb4054000  ! 763: ADD_R	add 	%r21, %r0, %r26
	.word 0xb7a81c20  ! 764: FMOVRGEZ	dis not found

iob_intr_1_61:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_61), 16, 16)) -> intp(1, 0, c)
iob_intr_1_62:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_62), 16, 16)) -> intp(1, 0, 34)
	.word 0xb3a489e0  ! 769: FDIVq	dis not found

	.word 0xb7a8c820  ! 770: FMOVL	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_25:
	mov	0x1f, %r14
	.word 0xf2f38e60  ! 772: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xbba5c920  ! 773: FMULs	fmuls	%f23, %f0, %f29
	.word 0xb3aac820  ! 775: FMOVGE	fmovs	%fcc1, %f0, %f25
iob_intr_1_63:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_63), 16, 16)) -> intp(1, 0, 3)
cpu_intr_1_55:
	setx	0x20032d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_56:
	setx	0x23023e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_64:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_64), 16, 16)) -> intp(1, 0, 21)
iob_intr_1_65:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_65), 16, 16)) -> intp(1, 0, 39)
iob_intr_1_66:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_66), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_67:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_67), 16, 16)) -> intp(1, 0, 36)
iob_intr_1_68:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_68), 16, 16)) -> intp(1, 0, 1)
iob_intr_1_69:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_69), 16, 16)) -> intp(1, 0, 3d)
T1_asi_reg_rd_27:
	mov	0x22, %r14
	.word 0xfcdb89e0  ! 796: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb5a8c820  ! 798: FMOVL	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_28:
	mov	0x17, %r14
	.word 0xfcdb8e60  ! 799: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_1_70:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_70), 16, 16)) -> intp(1, 0, 0)
cpu_intr_1_57:
	setx	0x220333, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_26:
	mov	0x1, %r14
	.word 0xf0f389e0  ! 804: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xb7a44840  ! 815: FADDd	faddd	%f48, %f0, %f58
	.word 0xbda81c20  ! 817: FMOVRGEZ	dis not found

cpu_intr_1_58:
	setx	0x220308, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_71:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_71), 16, 16)) -> intp(1, 0, 3d)
cpu_intr_1_59:
	setx	0x220033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7520000  ! 821: RDPR_PIL	<illegal instruction>
T1_asi_reg_wr_27:
	mov	0x3c5, %r14
	.word 0xf2f384a0  ! 824: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_1_72:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_72), 16, 16)) -> intp(1, 0, 37)
	.word 0xbba88820  ! 827: FMOVLE	fmovs	%fcc1, %f0, %f29
iob_intr_1_73:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_73), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_60:
	setx	0x21020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb334d000  ! 839: SRLX_R	srlx	%r19, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_rd_29:
	mov	0x2f, %r14
	.word 0xfedb8400  ! 846: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T1_asi_reg_wr_28:
	mov	0x13, %r14
	.word 0xfaf38400  ! 850: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb2340000  ! 851: SUBC_R	orn 	%r16, %r0, %r25
T1_asi_reg_wr_29:
	mov	0x23, %r14
	.word 0xf4f38e40  ! 855: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_rd_30:
	mov	0x27, %r14
	.word 0xf6db8e40  ! 856: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T1_asi_reg_wr_30:
	mov	0x3c1, %r14
	.word 0xf8f384a0  ! 857: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb1a00520  ! 858: FSQRTs	fsqrt	
T1_asi_reg_wr_31:
	mov	0x16, %r14
	.word 0xf0f38e40  ! 859: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb7a88820  ! 860: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xbfa8c820  ! 861: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xbba5c840  ! 862: FADDd	faddd	%f54, %f0, %f60
cpu_intr_1_61:
	setx	0x20021a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_31:
	mov	0x3c3, %r14
	.word 0xfedb89e0  ! 866: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb7a00040  ! 871: FMOVd	fmovd	%f0, %f58
T1_asi_reg_rd_32:
	mov	0x3c8, %r14
	.word 0xf0db8e40  ! 873: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_wr_32:
	mov	0x1f, %r14
	.word 0xf6f38e60  ! 875: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb3a589e0  ! 883: FDIVq	dis not found

	.word 0xbfa81420  ! 885: FMOVRNZ	dis not found

	.word 0xbda00040  ! 886: FMOVd	fmovd	%f0, %f30
cpu_intr_1_62:
	setx	0x210339, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_33:
	mov	0x2f, %r14
	.word 0xf8db89e0  ! 892: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T1_asi_reg_rd_34:
	mov	0x33, %r14
	.word 0xfcdb84a0  ! 893: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T1_asi_reg_wr_33:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 894: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb09ce051  ! 895: XORcc_I	xorcc 	%r19, 0x0051, %r24
	.word 0xb23461d0  ! 897: ORN_I	orn 	%r17, 0x01d0, %r25
iob_intr_1_74:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_74), 16, 16)) -> intp(1, 0, 2a)
iob_intr_1_75:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_75), 16, 16)) -> intp(1, 0, e)
	.word 0xb7a88820  ! 903: FMOVLE	fmovs	%fcc1, %f0, %f27
iob_intr_1_76:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_76), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_77:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_77), 16, 16)) -> intp(1, 0, 1)
	.word 0xb9ab8820  ! 910: FMOVPOS	fmovs	%fcc1, %f0, %f28
cpu_intr_1_63:
	setx	0x210001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00520  ! 914: FSQRTs	fsqrt	
iob_intr_1_78:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_78), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb5a00520  ! 923: FSQRTs	fsqrt	
iob_intr_1_79:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_79), 16, 16)) -> intp(1, 0, 30)
iob_intr_1_80:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_80), 16, 16)) -> intp(1, 0, 36)
	.word 0xb9a40860  ! 927: FADDq	dis not found

	.word 0xb7a4c8c0  ! 930: FSUBd	fsubd	%f50, %f0, %f58
	.word 0xb7a588c0  ! 933: FSUBd	fsubd	%f22, %f0, %f58
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a81c20  ! 937: FMOVRGEZ	dis not found

T1_asi_reg_wr_34:
	mov	0x3c2, %r14
	.word 0xf6f38e80  ! 938: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T1_asi_reg_rd_35:
	mov	0x3c1, %r14
	.word 0xf8db8e40  ! 942: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_1_64:
	setx	0x26012d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_81:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_81), 16, 16)) -> intp(1, 0, 11)
	.word 0xb9a00560  ! 951: FSQRTq	fsqrt	
	.word 0xbfa80c20  ! 952: FMOVRLZ	dis not found

	.word 0xb9a00520  ! 959: FSQRTs	fsqrt	
cpu_intr_1_65:
	setx	0x260308, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_66:
	setx	0x240319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa48840  ! 969: FADDd	faddd	%f18, %f0, %f62
iob_intr_1_82:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_82), 16, 16)) -> intp(1, 0, 5)
T1_asi_reg_wr_35:
	mov	0x27, %r14
	.word 0xfcf38400  ! 978: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbbab8820  ! 979: FMOVPOS	fmovs	%fcc1, %f0, %f29
cpu_intr_1_67:
	setx	0x270109, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_36:
	mov	0xc, %r14
	.word 0xf0f389e0  ! 981: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_1_83:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_83), 16, 16)) -> intp(1, 0, f)
	.word 0xb9a80820  ! 985: FMOVN	fmovs	%fcc1, %f0, %f28
cpu_intr_1_68:
	setx	0x27013c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_37:
	mov	0x38, %r14
	.word 0xf2f384a0  ! 991: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbcace191  ! 992: ANDNcc_I	andncc 	%r19, 0x0191, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_69:
	setx	0x250323, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_36:
	mov	0x9, %r14
	.word 0xf8db89e0  ! 999: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb5a44840  ! 1000: FADDd	faddd	%f48, %f0, %f26
	.word 0xbfa80820  ! 1002: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
iob_intr_1_84:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_84), 16, 16)) -> intp(1, 0, 31)
	.word 0xb9a00020  ! 1005: FMOVs	fmovs	%f0, %f28
T1_asi_reg_rd_37:
	mov	0x2a, %r14
	.word 0xf4db8e40  ! 1007: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_1_70:
	setx	0x25012c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_38:
	mov	0x3c6, %r14
	.word 0xfcf38e40  ! 1013: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T1_asi_reg_rd_38:
	mov	0x1e, %r14
	.word 0xf2db8e40  ! 1017: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_1_71:
	setx	0x27030b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_85:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_85), 16, 16)) -> intp(1, 0, 30)
cpu_intr_1_72:
	setx	0x25003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00540  ! 1023: FSQRTd	fsqrt	
	.word 0xba34e0c4  ! 1026: ORN_I	orn 	%r19, 0x00c4, %r29
cpu_intr_1_73:
	setx	0x25033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c9a0  ! 1031: FDIVs	fdivs	%f19, %f0, %f31
	.word 0xbda81420  ! 1032: FMOVRNZ	dis not found

cpu_intr_1_74:
	setx	0x240306, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_75:
	setx	0x260315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa0820  ! 1038: FMOVA	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_39:
	mov	0x2a, %r14
	.word 0xf0f38e60  ! 1039: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_1_86:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_86), 16, 16)) -> intp(1, 0, 24)
	.word 0xb3a488c0  ! 1043: FSUBd	fsubd	%f18, %f0, %f56
	.word 0xb1a44860  ! 1046: FADDq	dis not found

	.word 0xb3a44860  ! 1049: FADDq	dis not found

iob_intr_1_87:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_87), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_76:
	setx	0x250020, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_40:
	mov	0x3c6, %r14
	.word 0xfcf384a0  ! 1056: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T1_asi_reg_rd_39:
	mov	0x3c0, %r14
	.word 0xf8db8e80  ! 1058: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T1_asi_reg_rd_40:
	mov	0x3c0, %r14
	.word 0xf0db8e40  ! 1063: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_1_77:
	setx	0x240010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda54820  ! 1067: FADDs	fadds	%f21, %f0, %f30
	.word 0xb9a489a0  ! 1068: FDIVs	fdivs	%f18, %f0, %f28
cpu_intr_1_78:
	setx	0x25020f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_79:
	setx	0x260101, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_80:
	setx	0x250016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe050000  ! 1075: ADD_R	add 	%r20, %r0, %r31
T1_asi_reg_rd_41:
	mov	0x3c4, %r14
	.word 0xf2db8e60  ! 1076: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_1_81:
	setx	0x260335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b50000  ! 1078: ORNcc_R	orncc 	%r20, %r0, %r27
	.word 0xbba81c20  ! 1079: FMOVRGEZ	dis not found

	.word 0xbaa58000  ! 1081: SUBcc_R	subcc 	%r22, %r0, %r29
T1_asi_reg_rd_42:
	mov	0xb, %r14
	.word 0xfcdb8e80  ! 1083: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb7a00540  ! 1084: FSQRTd	fsqrt	
T1_asi_reg_rd_43:
	mov	0x3c8, %r14
	.word 0xf6db89e0  ! 1086: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_1_82:
	setx	0x24032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80420  ! 1095: FMOVRZ	dis not found

	.word 0xbfa00520  ! 1096: FSQRTs	fsqrt	
T1_asi_reg_rd_44:
	mov	0x3c4, %r14
	.word 0xf0db89e0  ! 1098: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbb540000  ! 1099: RDPR_GL	<illegal instruction>
T1_asi_reg_rd_45:
	mov	0x3c0, %r14
	.word 0xf2db8e60  ! 1100: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xb1520000  ! 1105: RDPR_PIL	<illegal instruction>
	.word 0xb5a5c9c0  ! 1106: FDIVd	fdivd	%f54, %f0, %f26
	.word 0xbba5c8c0  ! 1107: FSUBd	fsubd	%f54, %f0, %f60
cpu_intr_1_83:
	setx	0x240215, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r20 + %g0] 0xf0, %f2
iob_intr_1_88:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_88), 16, 16)) -> intp(1, 0, 30)
T1_asi_reg_rd_46:
	mov	0x12, %r14
	.word 0xf2db8e40  ! 1116: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb9a00040  ! 1118: FMOVd	fmovd	%f0, %f28
	.word 0xb8340000  ! 1119: SUBC_R	orn 	%r16, %r0, %r28
T1_asi_reg_wr_41:
	mov	0xf, %r14
	.word 0xfcf384a0  ! 1121: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_89:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_89), 16, 16)) -> intp(1, 0, 3a)
	.word 0x8195e098  ! 1127: WRPR_TPC_I	wrpr	%r23, 0x0098, %tpc
cpu_intr_1_84:
	setx	0x24022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a90820  ! 1133: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb3a84820  ! 1137: FMOVE	fmovs	%fcc1, %f0, %f25
cpu_intr_1_85:
	setx	0x240036, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_90:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_90), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb3a4c960  ! 1146: FMULq	dis not found

T1_asi_reg_rd_47:
	mov	0x3c4, %r14
	.word 0xfedb8e60  ! 1147: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xbba81420  ! 1149: FMOVRNZ	dis not found

	.word 0xbba588c0  ! 1151: FSUBd	fsubd	%f22, %f0, %f60
	.word 0xb5aa4820  ! 1154: FMOVNE	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbba88820  ! 1157: FMOVLE	fmovs	%fcc1, %f0, %f29
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xbba588a0  ! 1160: FSUBs	fsubs	%f22, %f0, %f29
T1_asi_reg_rd_48:
	mov	0x3c5, %r14
	.word 0xf0db8e80  ! 1162: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T1_asi_reg_rd_49:
	mov	0x2a, %r14
	.word 0xf6db8e40  ! 1165: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T1_asi_reg_wr_42:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 1166: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_wr_43:
	mov	0x2f, %r14
	.word 0xfaf384a0  ! 1168: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T1_asi_reg_wr_44:
	mov	0x19, %r14
	.word 0xfef38e40  ! 1172: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbba98820  ! 1173: FMOVNEG	fmovs	%fcc1, %f0, %f29
iob_intr_1_91:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_91), 16, 16)) -> intp(1, 0, 34)
	.word 0xbda00540  ! 1176: FSQRTd	fsqrt	
	.word 0xb5ab8820  ! 1180: FMOVPOS	fmovs	%fcc1, %f0, %f26
cpu_intr_1_86:
	setx	0x26032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5ab0820  ! 1186: FMOVGU	fmovs	%fcc1, %f0, %f26
cpu_intr_1_87:
	setx	0x26021f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_92:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_92), 16, 16)) -> intp(1, 0, a)
iob_intr_1_93:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_93), 16, 16)) -> intp(1, 0, 14)
T1_asi_reg_wr_45:
	mov	0x12, %r14
	.word 0xfcf38e60  ! 1195: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_1_88:
	setx	0x240239, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xb41520a7  ! 1201: OR_I	or 	%r20, 0x00a7, %r26
cpu_intr_1_89:
	setx	0x240223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf50c000  ! 1204: RDPR_TT	<illegal instruction>
iob_intr_1_94:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_94), 16, 16)) -> intp(1, 0, 34)
cpu_intr_1_90:
	setx	0x270308, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_91:
	setx	0x260107, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_46:
	mov	0x38, %r14
	.word 0xf2f38e40  ! 1210: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_rd_50:
	mov	0x28, %r14
	.word 0xf0db8e60  ! 1213: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb9a40940  ! 1214: FMULd	fmuld	%f16, %f0, %f28
	lda	[%r20 + %g0] 0xf0, %f2
cpu_intr_1_92:
	setx	0x250112, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_93:
	setx	0x260038, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_51:
	mov	0x24, %r14
	.word 0xf4db89e0  ! 1221: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_1_94:
	setx	0x240316, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_95:
	setx	0x260317, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_52:
	mov	0x1a, %r14
	.word 0xf6db8e80  ! 1227: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb1a84820  ! 1230: FMOVE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_47:
	mov	0x3c7, %r14
	.word 0xf4f38400  ! 1231: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbfa81820  ! 1239: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb3a94820  ! 1240: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xb7643801  ! 1241: MOVcc_I	<illegal instruction>
T1_asi_reg_wr_48:
	mov	0xc, %r14
	.word 0xfcf38400  ! 1242: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb7a548e0  ! 1243: FSUBq	dis not found

T1_asi_reg_rd_53:
	mov	0x4, %r14
	.word 0xf6db84a0  ! 1246: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T1_asi_reg_rd_54:
	mov	0x1c, %r14
	.word 0xfadb8400  ! 1247: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbba50820  ! 1248: FADDs	fadds	%f20, %f0, %f29
	.word 0xbba84820  ! 1249: FMOVE	fmovs	%fcc1, %f0, %f29
iob_intr_1_95:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_95), 16, 16)) -> intp(1, 0, 2)
	.word 0xb1a54960  ! 1252: FMULq	dis not found

cpu_intr_1_96:
	setx	0x24000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r20 + %g0] 0xf0, %f2
T1_asi_reg_rd_55:
	mov	0x17, %r14
	.word 0xf4db8e60  ! 1257: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T1_asi_reg_rd_56:
	mov	0x3c5, %r14
	.word 0xf0db89e0  ! 1258: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_1_96:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_96), 16, 16)) -> intp(1, 0, 4)
	.word 0xb9a4c820  ! 1260: FADDs	fadds	%f19, %f0, %f28
iob_intr_1_97:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_97), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb5a88820  ! 1268: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb9a81c20  ! 1270: FMOVRGEZ	dis not found

	.word 0xb1a58940  ! 1272: FMULd	fmuld	%f22, %f0, %f24
	.word 0xbda00520  ! 1274: FSQRTs	fsqrt	
cpu_intr_1_97:
	setx	0x250005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c920  ! 1276: FMULs	fmuls	%f19, %f0, %f27
T1_asi_reg_wr_49:
	mov	0x16, %r14
	.word 0xfaf38e80  ! 1280: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T1_asi_reg_wr_50:
	mov	0x30, %r14
	.word 0xf2f389e0  ! 1281: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb7a548e0  ! 1282: FSUBq	dis not found

cpu_intr_1_98:
	setx	0x260004, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_98:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_98), 16, 16)) -> intp(1, 0, 29)
cpu_intr_1_99:
	setx	0x250128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa5c9e0  ! 1287: FDIVq	dis not found

	.word 0xb0ad8000  ! 1288: ANDNcc_R	andncc 	%r22, %r0, %r24
	.word 0xbda589a0  ! 1291: FDIVs	fdivs	%f22, %f0, %f30
	.word 0xbba549e0  ! 1292: FDIVq	dis not found

iob_intr_1_99:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_99), 16, 16)) -> intp(1, 0, 2b)
T1_asi_reg_wr_51:
	mov	0x0, %r14
	.word 0xf8f389e0  ! 1297: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T1_asi_reg_wr_52:
	mov	0x3c4, %r14
	.word 0xf0f38e80  ! 1298: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb9a5c9a0  ! 1301: FDIVs	fdivs	%f23, %f0, %f28
T1_asi_reg_wr_53:
	mov	0x24, %r14
	.word 0xf4f38e40  ! 1304: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_100:
	setx	0x24011e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_100:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_100), 16, 16)) -> intp(1, 0, 2d)
	.word 0xba15c000  ! 1307: OR_R	or 	%r23, %r0, %r29
	.word 0xbfa48820  ! 1308: FADDs	fadds	%f18, %f0, %f31
cpu_intr_1_101:
	setx	0x27011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00520  ! 1311: FSQRTs	fsqrt	
iob_intr_1_101:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_101), 16, 16)) -> intp(1, 0, 18)
	.word 0xbda00540  ! 1313: FSQRTd	fsqrt	
	.word 0xb5a50960  ! 1314: FMULq	dis not found

	.word 0xbba84820  ! 1315: FMOVE	fmovs	%fcc1, %f0, %f29
iob_intr_1_102:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_102), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb3a8c820  ! 1321: FMOVL	fmovs	%fcc1, %f0, %f25
iob_intr_1_103:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_103), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb3a00560  ! 1328: FSQRTq	fsqrt	
cpu_intr_1_102:
	setx	0x260233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc154000  ! 1331: OR_R	or 	%r21, %r0, %r30
T1_asi_reg_rd_57:
	mov	0x2d, %r14
	.word 0xf6db8e40  ! 1335: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_103:
	setx	0x26013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb17ca401  ! 1337: MOVR_I	movre	%r18, 0x1, %r24
cpu_intr_1_104:
	setx	0x270101, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_104:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_104), 16, 16)) -> intp(1, 0, 33)
	.word 0xb52de001  ! 1349: SLL_I	sll 	%r23, 0x0001, %r26
	.word 0xb9a4c860  ! 1350: FADDq	dis not found

	.word 0xbfa589c0  ! 1351: FDIVd	fdivd	%f22, %f0, %f62
	.word 0xb5a8c820  ! 1352: FMOVL	fmovs	%fcc1, %f0, %f26
cpu_intr_1_105:
	setx	0x240339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaa4820  ! 1355: FMOVNE	fmovs	%fcc1, %f0, %f30
iob_intr_1_105:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_105), 16, 16)) -> intp(1, 0, 16)
	.word 0xbba4c920  ! 1360: FMULs	fmuls	%f19, %f0, %f29
iob_intr_1_106:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_106), 16, 16)) -> intp(1, 0, 23)
cpu_intr_1_106:
	setx	0x25030f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_107:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_107), 16, 16)) -> intp(1, 0, 0)
	.word 0xb0944000  ! 1368: ORcc_R	orcc 	%r17, %r0, %r24
iob_intr_1_108:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_108), 16, 16)) -> intp(1, 0, 30)
	.word 0xb2348000  ! 1372: ORN_R	orn 	%r18, %r0, %r25
iob_intr_1_109:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_109), 16, 16)) -> intp(1, 0, 10)
	lda	[%r16 + %g0] 0xf0, %f2
T1_asi_reg_rd_58:
	mov	0x23, %r14
	.word 0xf8db8400  ! 1378: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb5a00540  ! 1382: FSQRTd	fsqrt	
	.word 0xbd349000  ! 1383: SRLX_R	srlx	%r18, %r0, %r30
	.word 0xbfa80420  ! 1387: FMOVRZ	dis not found

	.word 0xb1aa4820  ! 1388: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb7aac820  ! 1389: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xbfa54820  ! 1390: FADDs	fadds	%f21, %f0, %f31
cpu_intr_1_107:
	setx	0x26012b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_54:
	mov	0x9, %r14
	.word 0xfef389e0  ! 1393: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_rd_59:
	mov	0x3c6, %r14
	.word 0xf4db8e80  ! 1395: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbda81420  ! 1397: FMOVRNZ	dis not found

iob_intr_1_110:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_110), 16, 16)) -> intp(1, 0, 32)
cpu_intr_1_108:
	setx	0x240310, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_109:
	setx	0x27020a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_55:
	mov	0xb, %r14
	.word 0xf2f389e0  ! 1411: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T1_asi_reg_wr_56:
	mov	0x2, %r14
	.word 0xf2f38e80  ! 1415: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	lda	[%r16 + %g0] 0xf0, %f2
T1_asi_reg_wr_57:
	mov	0x3c7, %r14
	.word 0xf4f38e80  ! 1417: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_1_110:
	setx	0x280315, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_58:
	mov	0x3c3, %r14
	.word 0xfef38e60  ! 1421: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_1_111:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_111), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb3a4c9c0  ! 1425: FDIVd	fdivd	%f50, %f0, %f56
cpu_intr_1_111:
	setx	0x28022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00560  ! 1427: FSQRTq	fsqrt	
cpu_intr_1_112:
	setx	0x280322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaa8820  ! 1431: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xbfa588e0  ! 1433: FSUBq	dis not found

	.word 0xbfa40940  ! 1438: FMULd	fmuld	%f16, %f0, %f62
iob_intr_1_112:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_112), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb9abc820  ! 1440: FMOVVC	fmovs	%fcc1, %f0, %f28
iob_intr_1_113:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_113), 16, 16)) -> intp(1, 0, 19)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_59:
	mov	0x6, %r14
	.word 0xf2f38e40  ! 1455: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb950c000  ! 1458: RDPR_TT	<illegal instruction>
iob_intr_1_114:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_114), 16, 16)) -> intp(1, 0, 2f)
iob_intr_1_115:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_115), 16, 16)) -> intp(1, 0, 34)
iob_intr_1_116:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_116), 16, 16)) -> intp(1, 0, 2)
cpu_intr_1_113:
	setx	0x280328, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_117:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_117), 16, 16)) -> intp(1, 0, 14)
	.word 0xb1a58820  ! 1471: FADDs	fadds	%f22, %f0, %f24
	.word 0xbfa548a0  ! 1474: FSUBs	fsubs	%f21, %f0, %f31
	.word 0xb8b4e0ea  ! 1475: ORNcc_I	orncc 	%r19, 0x00ea, %r28
iob_intr_1_118:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_118), 16, 16)) -> intp(1, 0, 8)
	.word 0xbfa80c20  ! 1479: FMOVRLZ	dis not found

	.word 0xb33d7001  ! 1480: SRAX_I	srax	%r21, 0x0001, %r25
iob_intr_1_119:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_119), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb5aa0820  ! 1482: FMOVA	fmovs	%fcc1, %f0, %f26
cpu_intr_1_114:
	setx	0x29021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb934f001  ! 1490: SRLX_I	srlx	%r19, 0x0001, %r28
cpu_intr_1_115:
	setx	0x2a0035, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_60:
	mov	0x12, %r14
	.word 0xf0db8e40  ! 1498: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb5abc820  ! 1500: FMOVVC	fmovs	%fcc1, %f0, %f26
cpu_intr_1_116:
	setx	0x2b021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb32d8000  ! 1505: SLL_R	sll 	%r22, %r0, %r25
	.word 0xb9a98820  ! 1509: FMOVNEG	fmovs	%fcc1, %f0, %f28
iob_intr_1_120:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_120), 16, 16)) -> intp(1, 0, 11)
	.word 0xbe3520b9  ! 1516: ORN_I	orn 	%r20, 0x00b9, %r31
	.word 0xb7ab4820  ! 1517: FMOVCC	fmovs	%fcc1, %f0, %f27
iob_intr_1_121:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_121), 16, 16)) -> intp(1, 0, 1f)
	lda	[%r16 + %g0] 0xf0, %f2
cpu_intr_1_117:
	setx	0x280226, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_61:
	mov	0x3c0, %r14
	.word 0xf0db8e80  ! 1521: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb5a549a0  ! 1522: FDIVs	fdivs	%f21, %f0, %f26
	.word 0xb1ab4820  ! 1524: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb1a508e0  ! 1526: FSUBq	dis not found

	.word 0xb9a84820  ! 1528: FMOVE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_118:
	setx	0x28003a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_122:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_122), 16, 16)) -> intp(1, 0, b)
	.word 0xbfa9c820  ! 1532: FMOVVS	fmovs	%fcc1, %f0, %f31
iob_intr_1_123:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_123), 16, 16)) -> intp(1, 0, 22)
	.word 0xbda81820  ! 1534: FMOVRGZ	fmovs	%fcc3, %f0, %f30
T1_asi_reg_rd_62:
	mov	0xd, %r14
	.word 0xf6db84a0  ! 1535: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa5c8e0  ! 1541: FSUBq	dis not found

	.word 0xbda48840  ! 1542: FADDd	faddd	%f18, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a54920  ! 1547: FMULs	fmuls	%f21, %f0, %f24
	.word 0xb5a588c0  ! 1548: FSUBd	fsubd	%f22, %f0, %f26
	.word 0xbda5c9a0  ! 1551: FDIVs	fdivs	%f23, %f0, %f30
cpu_intr_1_119:
	setx	0x2b0134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaa4820  ! 1554: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb7a449c0  ! 1557: FDIVd	fdivd	%f48, %f0, %f58
	.word 0xb3a449c0  ! 1558: FDIVd	fdivd	%f48, %f0, %f56
	.word 0xb5aac820  ! 1559: FMOVGE	fmovs	%fcc1, %f0, %f26
iob_intr_1_124:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_124), 16, 16)) -> intp(1, 0, a)
iob_intr_1_125:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_125), 16, 16)) -> intp(1, 0, 3a)
	.word 0xbdaa8820  ! 1569: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb4954000  ! 1570: ORcc_R	orcc 	%r21, %r0, %r26
T1_asi_reg_rd_63:
	mov	0x3c4, %r14
	.word 0xfedb8e40  ! 1573: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbba5c8a0  ! 1574: FSUBs	fsubs	%f23, %f0, %f29
	.word 0xb5a98820  ! 1576: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xbda448c0  ! 1578: FSUBd	fsubd	%f48, %f0, %f30
T1_asi_reg_wr_60:
	mov	0x2b, %r14
	.word 0xf8f384a0  ! 1579: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_1_120:
	setx	0x280331, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_126:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_126), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_rd_64:
	mov	0xb, %r14
	.word 0xfcdb8400  ! 1585: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbea4e132  ! 1591: SUBcc_I	subcc 	%r19, 0x0132, %r31
T1_asi_reg_wr_61:
	mov	0xf, %r14
	.word 0xfaf38400  ! 1595: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T1_asi_reg_wr_62:
	mov	0x6, %r14
	.word 0xfcf389e0  ! 1598: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xbc3560c2  ! 1599: SUBC_I	orn 	%r21, 0x00c2, %r30
	.word 0xb0bda0b7  ! 1603: XNORcc_I	xnorcc 	%r22, 0x00b7, %r24
T1_asi_reg_wr_63:
	mov	0x13, %r14
	.word 0xf2f384a0  ! 1604: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T1_asi_reg_rd_65:
	mov	0x3c2, %r14
	.word 0xf6db8e60  ! 1605: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb3a80820  ! 1606: FMOVN	fmovs	%fcc1, %f0, %f25
cpu_intr_1_121:
	setx	0x280236, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_66:
	mov	0x16, %r14
	.word 0xfadb8400  ! 1614: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_1_122:
	setx	0x290310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba94820  ! 1618: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xbca54000  ! 1621: SUBcc_R	subcc 	%r21, %r0, %r30
	.word 0xb7a58960  ! 1624: FMULq	dis not found

	.word 0xbd3d4000  ! 1626: SRA_R	sra 	%r21, %r0, %r30
	.word 0x8794614e  ! 1629: WRPR_TT_I	wrpr	%r17, 0x014e, %tt
	.word 0xb7a509e0  ! 1631: FDIVq	dis not found

T1_asi_reg_rd_67:
	mov	0x21, %r14
	.word 0xf4db8e80  ! 1632: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb3a4c8c0  ! 1633: FSUBd	fsubd	%f50, %f0, %f56
cpu_intr_1_123:
	setx	0x2b011a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_124:
	setx	0x2a0319, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_127:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_127), 16, 16)) -> intp(1, 0, 6)
iob_intr_1_128:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_128), 16, 16)) -> intp(1, 0, c)
iob_intr_1_129:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_129), 16, 16)) -> intp(1, 0, 3d)
T1_asi_reg_rd_68:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 1647: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_rd_69:
	mov	0x1b, %r14
	.word 0xfcdb8e60  ! 1649: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb7ab0820  ! 1650: FMOVGU	fmovs	%fcc1, %f0, %f27
cpu_intr_1_125:
	setx	0x2a031c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_70:
	mov	0x22, %r14
	.word 0xf4db8e40  ! 1652: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb88c201b  ! 1655: ANDcc_I	andcc 	%r16, 0x001b, %r28
cpu_intr_1_126:
	setx	0x2b0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a589a0  ! 1660: FDIVs	fdivs	%f22, %f0, %f24
cpu_intr_1_127:
	setx	0x2b030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a48940  ! 1669: FMULd	fmuld	%f18, %f0, %f58
	.word 0xbe1cc000  ! 1671: XOR_R	xor 	%r19, %r0, %r31
cpu_intr_1_128:
	setx	0x2b0115, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_130:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_130), 16, 16)) -> intp(1, 0, 3c)
	.word 0xbe8c4000  ! 1676: ANDcc_R	andcc 	%r17, %r0, %r31
cpu_intr_1_129:
	setx	0x29013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00540  ! 1679: FSQRTd	fsqrt	
cpu_intr_1_130:
	setx	0x28021d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_71:
	mov	0x38, %r14
	.word 0xf6db8e40  ! 1682: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb3a80820  ! 1683: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xb3a40940  ! 1689: FMULd	fmuld	%f16, %f0, %f56
T1_asi_reg_rd_72:
	mov	0xc, %r14
	.word 0xfedb8e40  ! 1694: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb3a00560  ! 1695: FSQRTq	fsqrt	
	.word 0xbba54960  ! 1697: FMULq	dis not found

	.word 0xbba81420  ! 1701: FMOVRNZ	dis not found

iob_intr_1_131:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_131), 16, 16)) -> intp(1, 0, 23)
	.word 0xb7a90820  ! 1704: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb4154000  ! 1705: OR_R	or 	%r21, %r0, %r26
iob_intr_1_132:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_132), 16, 16)) -> intp(1, 0, 2c)
	.word 0xbfa80820  ! 1708: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
cpu_intr_1_131:
	setx	0x290111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb935e001  ! 1712: SRL_I	srl 	%r23, 0x0001, %r28
iob_intr_1_133:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_133), 16, 16)) -> intp(1, 0, 15)
	.word 0xb3a84820  ! 1718: FMOVE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_73:
	mov	0x3c3, %r14
	.word 0xf2db89e0  ! 1720: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_1_134:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_134), 16, 16)) -> intp(1, 0, 2a)
	.word 0xbbaa8820  ! 1723: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xbda448a0  ! 1728: FSUBs	fsubs	%f17, %f0, %f30
	.word 0xb5a44860  ! 1731: FADDq	dis not found

	.word 0xbbaa4820  ! 1733: FMOVNE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_74:
	mov	0x3c8, %r14
	.word 0xfedb8e40  ! 1734: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbba488c0  ! 1737: FSUBd	fsubd	%f18, %f0, %f60
	.word 0xb7a80820  ! 1739: FMOVN	fmovs	%fcc1, %f0, %f27
iob_intr_1_135:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_135), 16, 16)) -> intp(1, 0, 1f)
T1_asi_reg_wr_64:
	mov	0xf, %r14
	.word 0xf0f38e60  ! 1743: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb1a5c8e0  ! 1746: FSUBq	dis not found

	.word 0xb42c4000  ! 1751: ANDN_R	andn 	%r17, %r0, %r26
	.word 0xb1a98820  ! 1752: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xbba44860  ! 1754: FADDq	dis not found

	.word 0xba0d0000  ! 1755: AND_R	and 	%r20, %r0, %r29
	.word 0xbfa48860  ! 1756: FADDq	dis not found

iob_intr_1_136:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_136), 16, 16)) -> intp(1, 0, 9)
T1_asi_reg_rd_75:
	mov	0x30, %r14
	.word 0xf8db8e40  ! 1760: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb9a98820  ! 1761: FMOVNEG	fmovs	%fcc1, %f0, %f28
cpu_intr_1_132:
	setx	0x28032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00560  ! 1763: FSQRTq	fsqrt	
iob_intr_1_137:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_137), 16, 16)) -> intp(1, 0, 19)
	.word 0xb6a40000  ! 1765: SUBcc_R	subcc 	%r16, %r0, %r27
	.word 0xb6ad21b9  ! 1767: ANDNcc_I	andncc 	%r20, 0x01b9, %r27
	.word 0xb52da001  ! 1768: SLL_I	sll 	%r22, 0x0001, %r26
	.word 0x8595601f  ! 1775: WRPR_TSTATE_I	wrpr	%r21, 0x001f, %tstate
	.word 0xb5a508a0  ! 1777: FSUBs	fsubs	%f20, %f0, %f26
T1_asi_reg_rd_76:
	mov	0x7, %r14
	.word 0xfadb84a0  ! 1778: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T1_asi_reg_wr_65:
	mov	0x3c4, %r14
	.word 0xf6f384a0  ! 1779: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb9a88820  ! 1782: FMOVLE	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_66:
	mov	0x12, %r14
	.word 0xfcf384a0  ! 1783: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbf643801  ! 1787: MOVcc_I	<illegal instruction>
iob_intr_1_138:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_138), 16, 16)) -> intp(1, 0, 9)
	.word 0x85946152  ! 1791: WRPR_TSTATE_I	wrpr	%r17, 0x0152, %tstate
	.word 0xb7a548e0  ! 1794: FSUBq	dis not found

iob_intr_1_139:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_139), 16, 16)) -> intp(1, 0, 11)
cpu_intr_1_133:
	setx	0x2a0004, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_67:
	mov	0x1b, %r14
	.word 0xf6f38400  ! 1799: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T1_asi_reg_rd_77:
	mov	0x3c5, %r14
	.word 0xfadb8e40  ! 1808: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_1_134:
	setx	0x290208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a84820  ! 1812: FMOVE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_135:
	setx	0x2b0310, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_140:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_140), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb6a4e1f3  ! 1817: SUBcc_I	subcc 	%r19, 0x01f3, %r27
	.word 0xb7a94820  ! 1820: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xbec4202b  ! 1822: ADDCcc_I	addccc 	%r16, 0x002b, %r31
cpu_intr_1_136:
	setx	0x2a0107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80820  ! 1826: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb1a00540  ! 1834: FSQRTd	fsqrt	
	.word 0xb7a80820  ! 1835: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xbbab4820  ! 1836: FMOVCC	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_68:
	mov	0x3c4, %r14
	.word 0xfaf389e0  ! 1842: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb9a48860  ! 1844: FADDq	dis not found

iob_intr_1_141:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_141), 16, 16)) -> intp(1, 0, 28)
	.word 0xbba448c0  ! 1846: FSUBd	fsubd	%f48, %f0, %f60
iob_intr_1_142:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_142), 16, 16)) -> intp(1, 0, 2b)
	lda	[%r20 + %g0] 0xf0, %f2
iob_intr_1_143:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_143), 16, 16)) -> intp(1, 0, 2)
	.word 0xbfa00520  ! 1853: FSQRTs	fsqrt	
	.word 0xbba589c0  ! 1856: FDIVd	fdivd	%f22, %f0, %f60
iob_intr_1_144:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_144), 16, 16)) -> intp(1, 0, 35)
	.word 0xb5a00520  ! 1858: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_145:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_145), 16, 16)) -> intp(1, 0, 1f)
iob_intr_1_146:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_146), 16, 16)) -> intp(1, 0, 38)
cpu_intr_1_137:
	setx	0x2d021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb97d6401  ! 1867: MOVR_I	movre	%r21, 0x1, %r28
	.word 0xbfa98820  ! 1868: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb7aa0820  ! 1870: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xbda50920  ! 1872: FMULs	fmuls	%f20, %f0, %f30
T1_asi_reg_wr_69:
	mov	0x3c4, %r14
	.word 0xfaf38e40  ! 1873: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb5ab4820  ! 1874: FMOVCC	fmovs	%fcc1, %f0, %f26
cpu_intr_1_138:
	setx	0x2e0231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a549c0  ! 1877: FDIVd	fdivd	%f52, %f0, %f26
iob_intr_1_147:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_147), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb7aa8820  ! 1881: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xbfa5c8a0  ! 1882: FSUBs	fsubs	%f23, %f0, %f31
iob_intr_1_148:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_148), 16, 16)) -> intp(1, 0, 25)
iob_intr_1_149:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_149), 16, 16)) -> intp(1, 0, 25)
	.word 0xbda9c820  ! 1885: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb7a81420  ! 1889: FMOVRNZ	dis not found

iob_intr_1_150:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_150), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_wr_70:
	mov	0x18, %r14
	.word 0xfef38400  ! 1893: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_1_151:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_151), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_wr_71:
	mov	0x15, %r14
	.word 0xf2f384a0  ! 1898: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_1_139:
	setx	0x2e0209, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_152:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_152), 16, 16)) -> intp(1, 0, 5)
	.word 0xb824c000  ! 1905: SUB_R	sub 	%r19, %r0, %r28
	.word 0xb9a5c960  ! 1906: FMULq	dis not found

T1_asi_reg_wr_72:
	mov	0x3c8, %r14
	.word 0xf2f384a0  ! 1908: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb9a81420  ! 1911: FMOVRNZ	dis not found

T1_asi_reg_wr_73:
	mov	0x33, %r14
	.word 0xfaf38400  ! 1912: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb3a00540  ! 1914: FSQRTd	fsqrt	
	.word 0xbc2d201d  ! 1915: ANDN_I	andn 	%r20, 0x001d, %r30
	.word 0xb7a588e0  ! 1916: FSUBq	dis not found

iob_intr_1_153:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_153), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_wr_74:
	mov	0x22, %r14
	.word 0xfef384a0  ! 1922: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xbda508e0  ! 1923: FSUBq	dis not found

	.word 0xb68ce192  ! 1925: ANDcc_I	andcc 	%r19, 0x0192, %r27
T1_asi_reg_rd_78:
	mov	0x21, %r14
	.word 0xf6db8e60  ! 1926: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T1_asi_reg_wr_75:
	mov	0x3c1, %r14
	.word 0xf8f389e0  ! 1928: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb3a548c0  ! 1929: FSUBd	fsubd	%f52, %f0, %f56
	.word 0xbfa588a0  ! 1934: FSUBs	fsubs	%f22, %f0, %f31
cpu_intr_1_140:
	setx	0x2d031f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_141:
	setx	0x2f000c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_142:
	setx	0x2f0339, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_143:
	setx	0x2d0118, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_154:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_154), 16, 16)) -> intp(1, 0, 9)
T1_asi_reg_wr_76:
	mov	0x1d, %r14
	.word 0xf0f38e40  ! 1943: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbfa98820  ! 1944: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xbfa80c20  ! 1946: FMOVRLZ	dis not found

iob_intr_1_155:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_155), 16, 16)) -> intp(1, 0, c)
	.word 0xb7520000  ! 1953: RDPR_PIL	<illegal instruction>
	.word 0xbba00040  ! 1954: FMOVd	fmovd	%f0, %f60
T1_asi_reg_wr_77:
	mov	0x1f, %r14
	.word 0xf8f384a0  ! 1958: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb7a00540  ! 1959: FSQRTd	fsqrt	
	.word 0xbfa00560  ! 1960: FSQRTq	fsqrt	
cpu_intr_1_144:
	setx	0x2e002c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_145:
	setx	0x2c0318, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_78:
	mov	0x22, %r14
	.word 0xf4f384a0  ! 1967: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb1aa4820  ! 1969: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb9ab8820  ! 1970: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb9a80820  ! 1972: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xbba80820  ! 1973: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
cpu_intr_1_146:
	setx	0x2e0006, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_147:
	setx	0x2f0109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a50860  ! 1984: FADDq	dis not found

	.word 0xb684e100  ! 1985: ADDcc_I	addcc 	%r19, 0x0100, %r27
	.word 0xb7a40820  ! 1987: FADDs	fadds	%f16, %f0, %f27
	.word 0xb3a00560  ! 1990: FSQRTq	fsqrt	
T1_asi_reg_rd_79:
	mov	0x3c3, %r14
	.word 0xfadb8e40  ! 1991: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_156:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_156), 16, 16)) -> intp(1, 0, 15)
iob_intr_1_157:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_157), 16, 16)) -> intp(1, 0, 29)
	.word 0xb4042193  ! 1996: ADD_I	add 	%r16, 0x0193, %r26
cpu_intr_1_148:
	setx	0x2f0025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab8820  ! 1998: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb1aa8820  ! 2002: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb7340000  ! 2003: SRL_R	srl 	%r16, %r0, %r27
	.word 0xbdaa8820  ! 2004: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb8bd0000  ! 2005: XNORcc_R	xnorcc 	%r20, %r0, %r28
	.word 0xb3a00040  ! 2006: FMOVd	fmovd	%f0, %f56
iob_intr_1_158:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_158), 16, 16)) -> intp(1, 0, c)
	.word 0xbda48860  ! 2009: FADDq	dis not found

	.word 0xb3a81c20  ! 2011: FMOVRGEZ	dis not found

iob_intr_1_159:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_159), 16, 16)) -> intp(1, 0, 0)
T1_asi_reg_wr_79:
	mov	0x37, %r14
	.word 0xf0f38400  ! 2015: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T1_asi_reg_rd_80:
	mov	0x8, %r14
	.word 0xf4db8e80  ! 2016: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb7a80c20  ! 2017: FMOVRLZ	dis not found

	.word 0xbdaa8820  ! 2018: FMOVG	fmovs	%fcc1, %f0, %f30
iob_intr_1_160:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_160), 16, 16)) -> intp(1, 0, 2b)
T1_asi_reg_rd_81:
	mov	0x26, %r14
	.word 0xfcdb8400  ! 2029: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_1_161:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_161), 16, 16)) -> intp(1, 0, 3d)
cpu_intr_1_149:
	setx	0x2c023a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_150:
	setx	0x2f001c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_151:
	setx	0x2c032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80420  ! 2039: FMOVRZ	dis not found

	.word 0xbf355000  ! 2040: SRLX_R	srlx	%r21, %r0, %r31
cpu_intr_1_152:
	setx	0x2d0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf643801  ! 2043: MOVcc_I	<illegal instruction>
	.word 0xb4b50000  ! 2046: SUBCcc_R	orncc 	%r20, %r0, %r26
T1_asi_reg_rd_82:
	mov	0x3c3, %r14
	.word 0xfedb8400  ! 2050: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb3a489c0  ! 2051: FDIVd	fdivd	%f18, %f0, %f56
iob_intr_1_162:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_162), 16, 16)) -> intp(1, 0, a)
iob_intr_1_163:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_163), 16, 16)) -> intp(1, 0, 2)
	.word 0xbd643801  ! 2056: MOVcc_I	<illegal instruction>
	.word 0xb9a549a0  ! 2057: FDIVs	fdivs	%f21, %f0, %f28
	.word 0xbfa54960  ! 2061: FMULq	dis not found

	.word 0xb5a90820  ! 2063: FMOVLEU	fmovs	%fcc1, %f0, %f26
iob_intr_1_164:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_164), 16, 16)) -> intp(1, 0, 1b)
iob_intr_1_165:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_165), 16, 16)) -> intp(1, 0, 37)
	.word 0xbbab0820  ! 2068: FMOVGU	fmovs	%fcc1, %f0, %f29
iob_intr_1_166:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_166), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb5a00040  ! 2074: FMOVd	fmovd	%f0, %f26
	.word 0xb7a489c0  ! 2075: FDIVd	fdivd	%f18, %f0, %f58
cpu_intr_1_153:
	setx	0x2d0035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_154:
	setx	0x2f0120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_155:
	setx	0x2e0001, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_167:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_167), 16, 16)) -> intp(1, 0, 33)
T1_asi_reg_wr_80:
	mov	0x1a, %r14
	.word 0xf6f38400  ! 2087: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_168:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_168), 16, 16)) -> intp(1, 0, 23)
iob_intr_1_169:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_169), 16, 16)) -> intp(1, 0, 4)
	.word 0xb5a00040  ! 2096: FMOVd	fmovd	%f0, %f26
iob_intr_1_170:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_170), 16, 16)) -> intp(1, 0, 11)
	.word 0xbe25a06a  ! 2102: SUB_I	sub 	%r22, 0x006a, %r31
T1_asi_reg_wr_81:
	mov	0x3c4, %r14
	.word 0xfcf38e40  ! 2105: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbaad8000  ! 2106: ANDNcc_R	andncc 	%r22, %r0, %r29
	.word 0xbfab4820  ! 2113: FMOVCC	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_83:
	mov	0x11, %r14
	.word 0xfedb84a0  ! 2115: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T1_asi_reg_wr_82:
	mov	0x3c4, %r14
	.word 0xf6f389e0  ! 2116: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T1_asi_reg_rd_84:
	mov	0x3c4, %r14
	.word 0xf8db8e60  ! 2118: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb1ab8820  ! 2119: FMOVPOS	fmovs	%fcc1, %f0, %f24
cpu_intr_1_156:
	setx	0x2d0016, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_171:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_171), 16, 16)) -> intp(1, 0, 1e)
T1_asi_reg_rd_85:
	mov	0x3c8, %r14
	.word 0xf6db8e80  ! 2125: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb7a408a0  ! 2128: FSUBs	fsubs	%f16, %f0, %f27
cpu_intr_1_157:
	setx	0x2f021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_172:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_172), 16, 16)) -> intp(1, 0, 2b)
	lda	[%r17 + %g0] 0xf0, %f2
cpu_intr_1_158:
	setx	0x2d0135, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_159:
	setx	0x2e003c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_173:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_173), 16, 16)) -> intp(1, 0, 1f)
T1_asi_reg_wr_83:
	mov	0xc, %r14
	.word 0xfcf38e40  ! 2143: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb7a84820  ! 2144: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb4854000  ! 2145: ADDcc_R	addcc 	%r21, %r0, %r26
	.word 0xbdab4820  ! 2147: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb1a48940  ! 2148: FMULd	fmuld	%f18, %f0, %f24
	.word 0xb7a5c840  ! 2153: FADDd	faddd	%f54, %f0, %f58
iob_intr_1_174:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_174), 16, 16)) -> intp(1, 0, 24)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8f902001  ! 2157: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xbfa80c20  ! 2164: FMOVRLZ	dis not found

cpu_intr_1_160:
	setx	0x2f0111, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_84:
	mov	0x3c5, %r14
	.word 0xfef38e40  ! 2170: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_wr_85:
	mov	0x0, %r14
	.word 0xf6f384a0  ! 2173: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T1_asi_reg_rd_86:
	mov	0x8, %r14
	.word 0xfedb8400  ! 2175: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xb1a8c820  ! 2178: FMOVL	fmovs	%fcc1, %f0, %f24
iob_intr_1_175:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_175), 16, 16)) -> intp(1, 0, 20)
cpu_intr_1_161:
	setx	0x2e0326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba58840  ! 2181: FADDd	faddd	%f22, %f0, %f60
T1_asi_reg_wr_86:
	mov	0x2c, %r14
	.word 0xf0f38400  ! 2183: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_1_162:
	setx	0x2c0115, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbaa4820  ! 2188: FMOVNE	fmovs	%fcc1, %f0, %f29
iob_intr_1_176:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_176), 16, 16)) -> intp(1, 0, 35)
	.word 0xbfa88820  ! 2190: FMOVLE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_163:
	setx	0x2e020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1abc820  ! 2195: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb73cc000  ! 2199: SRA_R	sra 	%r19, %r0, %r27
	.word 0xb7ab4820  ! 2201: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xbfa00540  ! 2203: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb28c0000  ! 2205: ANDcc_R	andcc 	%r16, %r0, %r25
	.word 0xb434c000  ! 2206: ORN_R	orn 	%r19, %r0, %r26
	.word 0xb1a81420  ! 2207: FMOVRNZ	dis not found

	.word 0xb4bd4000  ! 2209: XNORcc_R	xnorcc 	%r21, %r0, %r26
	.word 0xb7a00040  ! 2212: FMOVd	fmovd	%f0, %f58
T1_asi_reg_rd_87:
	mov	0x3c1, %r14
	.word 0xf6db89e0  ! 2213: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_1_164:
	setx	0x2e0001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb13d9000  ! 2215: SRAX_R	srax	%r22, %r0, %r24
T1_asi_reg_rd_88:
	mov	0x20, %r14
	.word 0xfedb8e80  ! 2218: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb5a00020  ! 2219: FMOVs	fmovs	%f0, %f26
	.word 0xbc2d4000  ! 2220: ANDN_R	andn 	%r21, %r0, %r30
iob_intr_1_177:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_177), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb1a00560  ! 2224: FSQRTq	fsqrt	
iob_intr_1_178:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_178), 16, 16)) -> intp(1, 0, 1a)
cpu_intr_1_165:
	setx	0x2c0101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00040  ! 2229: FMOVd	fmovd	%f0, %f60
iob_intr_1_179:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_179), 16, 16)) -> intp(1, 0, 10)
	.word 0xb29da1c1  ! 2233: XORcc_I	xorcc 	%r22, 0x01c1, %r25
	.word 0xb1aa4820  ! 2234: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xbda00540  ! 2235: FSQRTd	fsqrt	
	.word 0xbda588c0  ! 2236: FSUBd	fsubd	%f22, %f0, %f30
	.word 0xb3a00540  ! 2238: FSQRTd	fsqrt	
	.word 0xb5a8c820  ! 2239: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xb3a80820  ! 2242: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
iob_intr_1_180:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_180), 16, 16)) -> intp(1, 0, 33)
iob_intr_1_181:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_181), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb9a489a0  ! 2245: FDIVs	fdivs	%f18, %f0, %f28
cpu_intr_1_166:
	setx	0x2e0019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a4c8c0  ! 2253: FSUBd	fsubd	%f50, %f0, %f26
	lda	[%r18 + %g0] 0xf0, %f2
cpu_intr_1_167:
	setx	0x2d0213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00520  ! 2258: FSQRTs	fsqrt	
	.word 0xb1a00560  ! 2259: FSQRTq	fsqrt	
T1_asi_reg_rd_89:
	mov	0x33, %r14
	.word 0xf0db8400  ! 2261: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_rd_90:
	mov	0x7, %r14
	.word 0xfcdb84a0  ! 2264: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb9a90820  ! 2266: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xb2854000  ! 2268: ADDcc_R	addcc 	%r21, %r0, %r25
	.word 0xb5641800  ! 2273: MOVcc_R	<illegal instruction>
T1_asi_reg_rd_91:
	mov	0x3c3, %r14
	.word 0xfadb8e80  ! 2274: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_1_168:
	setx	0x2f010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00560  ! 2277: FSQRTq	fsqrt	
cpu_intr_1_169:
	setx	0x2e0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda449c0  ! 2279: FDIVd	fdivd	%f48, %f0, %f30
T1_asi_reg_wr_87:
	mov	0xa, %r14
	.word 0xfaf384a0  ! 2281: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb9aa0820  ! 2282: FMOVA	fmovs	%fcc1, %f0, %f28
cpu_intr_1_170:
	setx	0x2f0120, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_182:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_182), 16, 16)) -> intp(1, 0, b)
iob_intr_1_183:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_183), 16, 16)) -> intp(1, 0, 3)
T1_asi_reg_rd_92:
	mov	0x6, %r14
	.word 0xf4db84a0  ! 2290: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_1_184:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_184), 16, 16)) -> intp(1, 0, 7)
T1_asi_reg_rd_93:
	mov	0x3c3, %r14
	.word 0xf0db84a0  ! 2293: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbfa00520  ! 2295: FSQRTs	fsqrt	
	.word 0xbda80c20  ! 2299: FMOVRLZ	dis not found

T1_asi_reg_wr_88:
	mov	0xc, %r14
	.word 0xf0f389e0  ! 2302: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb0ac8000  ! 2304: ANDNcc_R	andncc 	%r18, %r0, %r24
cpu_intr_1_171:
	setx	0x2e0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb89c4000  ! 2312: XORcc_R	xorcc 	%r17, %r0, %r28
	.word 0xb405603c  ! 2314: ADD_I	add 	%r21, 0x003c, %r26
	.word 0xba0d6184  ! 2315: AND_I	and 	%r21, 0x0184, %r29
cpu_intr_1_172:
	setx	0x330337, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xbba48840  ! 2318: FADDd	faddd	%f18, %f0, %f60
	.word 0xb4b40000  ! 2319: SUBCcc_R	orncc 	%r16, %r0, %r26
iob_intr_1_185:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_185), 16, 16)) -> intp(1, 0, 6)
	.word 0xb3a00520  ! 2323: FSQRTs	fsqrt	
	.word 0xb7a88820  ! 2325: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xbda94820  ! 2326: FMOVCS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_89:
	mov	0x1c, %r14
	.word 0xf6f384a0  ! 2327: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_1_186:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_186), 16, 16)) -> intp(1, 0, 37)
T1_asi_reg_rd_94:
	mov	0x3c4, %r14
	.word 0xfcdb84a0  ! 2334: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbf3d1000  ! 2335: SRAX_R	srax	%r20, %r0, %r31
iob_intr_1_187:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_187), 16, 16)) -> intp(1, 0, c)
	.word 0xbba00520  ! 2338: FSQRTs	fsqrt	
iob_intr_1_188:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_188), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb01d6174  ! 2342: XOR_I	xor 	%r21, 0x0174, %r24
iob_intr_1_189:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_189), 16, 16)) -> intp(1, 0, 3)
T1_asi_reg_wr_90:
	mov	0x1f, %r14
	.word 0xf6f389e0  ! 2345: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_190:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_190), 16, 16)) -> intp(1, 0, e)
iob_intr_1_191:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_191), 16, 16)) -> intp(1, 0, 2f)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_173:
	setx	0x320311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa98820  ! 2354: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb9aa8820  ! 2355: FMOVG	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_91:
	mov	0x3c6, %r14
	.word 0xfef384a0  ! 2357: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_1_192:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_192), 16, 16)) -> intp(1, 0, 11)
	.word 0xb7a9c820  ! 2361: FMOVVS	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_92:
	mov	0x2b, %r14
	.word 0xfcf389e0  ! 2363: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb7a00540  ! 2365: FSQRTd	fsqrt	
iob_intr_1_193:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_193), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_174:
	setx	0x330031, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_93:
	mov	0x37, %r14
	.word 0xfef38400  ! 2373: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xb285608c  ! 2375: ADDcc_I	addcc 	%r21, 0x008c, %r25
cpu_intr_1_175:
	setx	0x31012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5340000  ! 2377: SRL_R	srl 	%r16, %r0, %r26
T1_asi_reg_wr_94:
	mov	0x3c7, %r14
	.word 0xfcf38400  ! 2378: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T1_asi_reg_wr_95:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 2379: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb8358000  ! 2384: ORN_R	orn 	%r22, %r0, %r28
iob_intr_1_194:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_194), 16, 16)) -> intp(1, 0, 10)
	.word 0xbfa44920  ! 2388: FMULs	fmuls	%f17, %f0, %f31
cpu_intr_1_176:
	setx	0x310126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4bd8000  ! 2390: XNORcc_R	xnorcc 	%r22, %r0, %r26
	.word 0xb92d8000  ! 2391: SLL_R	sll 	%r22, %r0, %r28
	.word 0xbfab8820  ! 2394: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb1aa4820  ! 2398: FMOVNE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_95:
	mov	0x3c0, %r14
	.word 0xf8db89e0  ! 2399: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T1_asi_reg_wr_96:
	mov	0x6, %r14
	.word 0xfaf38e60  ! 2401: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb5a4c9a0  ! 2402: FDIVs	fdivs	%f19, %f0, %f26
cpu_intr_1_177:
	setx	0x32030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_97:
	mov	0x26, %r14
	.word 0xf2f38e40  ! 2405: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbda508c0  ! 2406: FSUBd	fsubd	%f20, %f0, %f30
iob_intr_1_195:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_195), 16, 16)) -> intp(1, 0, a)
iob_intr_1_196:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_196), 16, 16)) -> intp(1, 0, 3)
	.word 0xb9a509e0  ! 2416: FDIVq	dis not found

	.word 0xb1a408a0  ! 2419: FSUBs	fsubs	%f16, %f0, %f24
	.word 0xbdaa8820  ! 2423: FMOVG	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_96:
	mov	0x2e, %r14
	.word 0xfadb8e40  ! 2425: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbe04e0c1  ! 2429: ADD_I	add 	%r19, 0x00c1, %r31
T1_asi_reg_rd_97:
	mov	0x1e, %r14
	.word 0xf4db8e60  ! 2430: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb3a5c960  ! 2431: FMULq	dis not found

iob_intr_1_197:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_197), 16, 16)) -> intp(1, 0, 32)
T1_asi_reg_wr_98:
	mov	0x9, %r14
	.word 0xfef38400  ! 2437: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb3aa4820  ! 2441: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xbda4c940  ! 2444: FMULd	fmuld	%f50, %f0, %f30
	.word 0xbc3d8000  ! 2447: XNOR_R	xnor 	%r22, %r0, %r30
cpu_intr_1_178:
	setx	0x320019, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_99:
	mov	0x29, %r14
	.word 0xfcf384a0  ! 2450: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xba0c4000  ! 2451: AND_R	and 	%r17, %r0, %r29
T1_asi_reg_wr_100:
	mov	0x30, %r14
	.word 0xf4f389e0  ! 2453: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_1_179:
	setx	0x320018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a449e0  ! 2456: FDIVq	dis not found

	.word 0xb1a00540  ! 2458: FSQRTd	fsqrt	
	.word 0xb9a80c20  ! 2459: FMOVRLZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_180:
	setx	0x330233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80420  ! 2468: FMOVRZ	dis not found

	.word 0xb1a4c8e0  ! 2469: FSUBq	dis not found

	.word 0xb1a81c20  ! 2470: FMOVRGEZ	dis not found

	.word 0xbda4c8a0  ! 2474: FSUBs	fsubs	%f19, %f0, %f30
	.word 0xb3a80820  ! 2475: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb9aac820  ! 2477: FMOVGE	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_98:
	mov	0x2f, %r14
	.word 0xf6db8e40  ! 2479: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbda81820  ! 2480: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb3a8c820  ! 2481: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb235e06b  ! 2482: ORN_I	orn 	%r23, 0x006b, %r25
cpu_intr_1_181:
	setx	0x33032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aac820  ! 2487: FMOVGE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_182:
	setx	0x32001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcac0000  ! 2490: ANDNcc_R	andncc 	%r16, %r0, %r30
	.word 0xbe044000  ! 2491: ADD_R	add 	%r17, %r0, %r31
T1_asi_reg_wr_101:
	mov	0x14, %r14
	.word 0xfcf38e80  ! 2496: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_1_198:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_198), 16, 16)) -> intp(1, 0, 28)
	.word 0xbfa50920  ! 2504: FMULs	fmuls	%f20, %f0, %f31
cpu_intr_1_183:
	setx	0x330329, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_99:
	mov	0xf, %r14
	.word 0xf6db8400  ! 2512: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb405c000  ! 2513: ADD_R	add 	%r23, %r0, %r26
	.word 0xb5a80820  ! 2515: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_102:
	mov	0xb, %r14
	.word 0xf0f38e40  ! 2518: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb7a48960  ! 2520: FMULq	dis not found

	.word 0xbba00540  ! 2528: FSQRTd	fsqrt	
cpu_intr_1_184:
	setx	0x310105, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_103:
	mov	0x11, %r14
	.word 0xfef38400  ! 2536: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbda4c9c0  ! 2539: FDIVd	fdivd	%f50, %f0, %f30
iob_intr_1_199:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_199), 16, 16)) -> intp(1, 0, 4)
iob_intr_1_200:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_200), 16, 16)) -> intp(1, 0, 20)
cpu_intr_1_185:
	setx	0x330221, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_186:
	setx	0x33013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb834c000  ! 2548: ORN_R	orn 	%r19, %r0, %r28
T1_asi_reg_rd_100:
	mov	0x14, %r14
	.word 0xf8db8e40  ! 2549: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb03d210a  ! 2553: XNOR_I	xnor 	%r20, 0x010a, %r24
	.word 0xb1a80820  ! 2555: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xbd350000  ! 2559: SRL_R	srl 	%r20, %r0, %r30
T1_asi_reg_rd_101:
	mov	0x3c8, %r14
	.word 0xfcdb89e0  ! 2561: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbba00540  ! 2562: FSQRTd	fsqrt	
	.word 0xb5a58820  ! 2563: FADDs	fadds	%f22, %f0, %f26
	.word 0xb1a80420  ! 2564: FMOVRZ	dis not found

	.word 0xba94a094  ! 2566: ORcc_I	orcc 	%r18, 0x0094, %r29
cpu_intr_1_187:
	setx	0x310336, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r23 + %g0] 0xf0, %f2
T1_asi_reg_rd_102:
	mov	0x33, %r14
	.word 0xf0db89e0  ! 2569: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T1_asi_reg_wr_104:
	mov	0x3c5, %r14
	.word 0xf0f38e60  ! 2570: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb3a9c820  ! 2574: FMOVVS	fmovs	%fcc1, %f0, %f25
cpu_intr_1_188:
	setx	0x320009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c860  ! 2576: FADDq	dis not found

T1_asi_reg_wr_105:
	mov	0x2e, %r14
	.word 0xf8f38e80  ! 2577: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	lda	[%r23 + %g0] 0xf0, %f2
	.word 0xbda81c20  ! 2585: FMOVRGEZ	dis not found

	.word 0xb5a5c9e0  ! 2586: FDIVq	dis not found

iob_intr_1_201:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_201), 16, 16)) -> intp(1, 0, 20)
T1_asi_reg_wr_106:
	mov	0x21, %r14
	.word 0xfaf38400  ! 2589: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbba48840  ! 2590: FADDd	faddd	%f18, %f0, %f60
	.word 0xb9a54860  ! 2592: FADDq	dis not found

	.word 0xb3a80820  ! 2593: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
cpu_intr_1_189:
	setx	0x31012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c9e0  ! 2595: FDIVq	dis not found

	.word 0xb9a9c820  ! 2600: FMOVVS	fmovs	%fcc1, %f0, %f28
cpu_intr_1_190:
	setx	0x33010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c840  ! 2604: FADDd	faddd	%f50, %f0, %f56
iob_intr_1_202:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_202), 16, 16)) -> intp(1, 0, 1a)
cpu_intr_1_191:
	setx	0x320124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a8c820  ! 2607: FMOVL	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_103:
	mov	0x38, %r14
	.word 0xfedb84a0  ! 2610: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_1_192:
	setx	0x20101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a81420  ! 2612: FMOVRNZ	dis not found

	.word 0xb7a81c20  ! 2616: FMOVRGEZ	dis not found

iob_intr_1_203:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_203), 16, 16)) -> intp(1, 0, 10)
	.word 0xb5a44940  ! 2619: FMULd	fmuld	%f48, %f0, %f26
	.word 0xbfab8820  ! 2620: FMOVPOS	fmovs	%fcc1, %f0, %f31
cpu_intr_1_193:
	setx	0x310316, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_194:
	setx	0x330137, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_107:
	mov	0x3c2, %r14
	.word 0xf4f384a0  ! 2632: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb9a50820  ! 2633: FADDs	fadds	%f20, %f0, %f28
	.word 0xb7a508a0  ! 2636: FSUBs	fsubs	%f20, %f0, %f27
cpu_intr_1_195:
	setx	0x310030, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_204:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_204), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_196:
	setx	0x330110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a54860  ! 2645: FADDq	dis not found

	.word 0xb28d4000  ! 2646: ANDcc_R	andcc 	%r21, %r0, %r25
	.word 0xba4420b5  ! 2647: ADDC_I	addc 	%r16, 0x00b5, %r29
	.word 0xb5a9c820  ! 2652: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb5abc820  ! 2653: FMOVVC	fmovs	%fcc1, %f0, %f26
	lda	[%r23 + %g0] 0xf0, %f2
T1_asi_reg_wr_108:
	mov	0x20, %r14
	.word 0xf6f38e60  ! 2655: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb1a84820  ! 2658: FMOVE	fmovs	%fcc1, %f0, %f24
iob_intr_1_205:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_205), 16, 16)) -> intp(1, 0, 1b)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbba00540  ! 2661: FSQRTd	fsqrt	
iob_intr_1_206:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_206), 16, 16)) -> intp(1, 0, 17)
	.word 0xb3a80820  ! 2663: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xbdabc820  ! 2667: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xbda4c860  ! 2668: FADDq	dis not found

T1_asi_reg_rd_104:
	mov	0x17, %r14
	.word 0xfedb8e40  ! 2671: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T1_asi_reg_wr_109:
	mov	0x2c, %r14
	.word 0xf8f38e60  ! 2676: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb1a84820  ! 2677: FMOVE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_105:
	mov	0x3c4, %r14
	.word 0xfadb89e0  ! 2678: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_1_207:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_207), 16, 16)) -> intp(1, 0, 31)
	.word 0xb9a5c9c0  ! 2681: FDIVd	fdivd	%f54, %f0, %f28
	.word 0xbb2da001  ! 2683: SLL_I	sll 	%r22, 0x0001, %r29
	.word 0xb3a489a0  ! 2689: FDIVs	fdivs	%f18, %f0, %f25
cpu_intr_1_197:
	setx	0x300208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aa8820  ! 2692: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb7a48960  ! 2694: FMULq	dis not found

	.word 0xb5a80820  ! 2697: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xb62cc000  ! 2700: ANDN_R	andn 	%r19, %r0, %r27
	.word 0xb1a4c920  ! 2702: FMULs	fmuls	%f19, %f0, %f24
	.word 0xb3a4c8c0  ! 2704: FSUBd	fsubd	%f50, %f0, %f56
	.word 0xbfa00520  ! 2710: FSQRTs	fsqrt	
cpu_intr_1_198:
	setx	0x30022f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_199:
	setx	0x30003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_200:
	setx	0x32021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_208:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_208), 16, 16)) -> intp(1, 0, d)
cpu_intr_1_201:
	setx	0x300212, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_202:
	setx	0x33003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba589e0  ! 2724: FDIVq	dis not found

	.word 0xb9aa4820  ! 2726: FMOVNE	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_106:
	mov	0x1a, %r14
	.word 0xfadb8e60  ! 2727: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_1_203:
	setx	0x310235, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_209:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_209), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_204:
	setx	0x33020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_107:
	mov	0x6, %r14
	.word 0xf6db89e0  ! 2742: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb1a81c20  ! 2743: FMOVRGEZ	dis not found

	.word 0xbda00520  ! 2746: FSQRTs	fsqrt	
	.word 0xbfa80820  ! 2747: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb834211c  ! 2748: SUBC_I	orn 	%r16, 0x011c, %r28
T1_asi_reg_wr_110:
	mov	0x7, %r14
	.word 0xf6f384a0  ! 2749: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb9a488c0  ! 2751: FSUBd	fsubd	%f18, %f0, %f28
	.word 0xb7a81c20  ! 2753: FMOVRGEZ	dis not found

cpu_intr_1_205:
	setx	0x32000d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_206:
	setx	0x330119, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_111:
	mov	0xd, %r14
	.word 0xf0f389e0  ! 2767: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T1_asi_reg_wr_112:
	mov	0xf, %r14
	.word 0xfcf38e40  ! 2771: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb1a549c0  ! 2774: FDIVd	fdivd	%f52, %f0, %f24
	.word 0xbe444000  ! 2779: ADDC_R	addc 	%r17, %r0, %r31
T1_asi_reg_wr_113:
	mov	0x18, %r14
	.word 0xfef389e0  ! 2782: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbba489e0  ! 2783: FDIVq	dis not found

cpu_intr_1_207:
	setx	0x370018, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_210:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_210), 16, 16)) -> intp(1, 0, 2c)
	.word 0xbba80820  ! 2792: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb3a408e0  ! 2793: FSUBq	dis not found

T1_asi_reg_rd_108:
	mov	0x3c4, %r14
	.word 0xf8db8e40  ! 2796: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_wr_114:
	mov	0x1, %r14
	.word 0xf0f38e80  ! 2797: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_1_208:
	setx	0x36011d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_109:
	mov	0x3c4, %r14
	.word 0xf2db8e40  ! 2803: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbda48860  ! 2807: FADDq	dis not found

T1_asi_reg_rd_110:
	mov	0x3c2, %r14
	.word 0xfadb8e40  ! 2811: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_rd_111:
	mov	0x3c1, %r14
	.word 0xf6db84a0  ! 2812: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_1_211:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_211), 16, 16)) -> intp(1, 0, 1d)
	.word 0xbfa44940  ! 2815: FMULd	fmuld	%f48, %f0, %f62
T1_asi_reg_wr_115:
	mov	0x1b, %r14
	.word 0xf0f38e40  ! 2818: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbba81420  ! 2819: FMOVRNZ	dis not found

cpu_intr_1_209:
	setx	0x340111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb244e17c  ! 2823: ADDC_I	addc 	%r19, 0x017c, %r25
T1_asi_reg_wr_116:
	mov	0x3c0, %r14
	.word 0xf0f38e40  ! 2824: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_1_210:
	setx	0x350230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c920  ! 2827: FMULs	fmuls	%f19, %f0, %f25
iob_intr_1_212:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_212), 16, 16)) -> intp(1, 0, 2c)
iob_intr_1_213:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_213), 16, 16)) -> intp(1, 0, 34)
cpu_intr_1_211:
	setx	0x370229, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_214:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_214), 16, 16)) -> intp(1, 0, 27)
	.word 0xbba509e0  ! 2842: FDIVq	dis not found

iob_intr_1_215:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_215), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_rd_112:
	mov	0x13, %r14
	.word 0xf2db84a0  ! 2845: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_1_212:
	setx	0x36000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a5c960  ! 2852: FMULq	dis not found

	.word 0xbfa00040  ! 2855: FMOVd	fmovd	%f0, %f62
	.word 0xb1a48860  ! 2857: FADDq	dis not found

	.word 0xb1a98820  ! 2859: FMOVNEG	fmovs	%fcc1, %f0, %f24
cpu_intr_1_213:
	setx	0x370100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda448a0  ! 2862: FSUBs	fsubs	%f17, %f0, %f30
T1_asi_reg_wr_117:
	mov	0x2c, %r14
	.word 0xfaf38400  ! 2863: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbaac6048  ! 2864: ANDNcc_I	andncc 	%r17, 0x0048, %r29
cpu_intr_1_214:
	setx	0x360239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00520  ! 2867: FSQRTs	fsqrt	
iob_intr_1_216:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_216), 16, 16)) -> intp(1, 0, 27)
	.word 0xbd643801  ! 2872: MOVcc_I	<illegal instruction>
	.word 0xb57c6401  ! 2874: MOVR_I	movre	%r17, 0x1, %r26
cpu_intr_1_215:
	setx	0x350110, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_118:
	mov	0x3c3, %r14
	.word 0xf6f38400  ! 2876: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_1_217:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_217), 16, 16)) -> intp(1, 0, c)
	.word 0xb3a4c960  ! 2879: FMULq	dis not found

	.word 0xb7a4c860  ! 2880: FADDq	dis not found

iob_intr_1_218:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_218), 16, 16)) -> intp(1, 0, 3c)
	.word 0xbda00020  ! 2884: FMOVs	fmovs	%f0, %f30
T1_asi_reg_wr_119:
	mov	0x20, %r14
	.word 0xf6f38e40  ! 2887: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbba80420  ! 2888: FMOVRZ	dis not found

iob_intr_1_219:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_219), 16, 16)) -> intp(1, 0, 37)
iob_intr_1_220:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_220), 16, 16)) -> intp(1, 0, 39)
cpu_intr_1_216:
	setx	0x350304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_221:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_221), 16, 16)) -> intp(1, 0, 15)
	.word 0xbba9c820  ! 2895: FMOVVS	fmovs	%fcc1, %f0, %f29
	lda	[%r23 + %g0] 0xf0, %f2
iob_intr_1_222:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_222), 16, 16)) -> intp(1, 0, 2)
	.word 0xb9a94820  ! 2904: FMOVCS	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_113:
	mov	0x1c, %r14
	.word 0xf8db8e40  ! 2906: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb3a50860  ! 2910: FADDq	dis not found

T1_asi_reg_rd_114:
	mov	0x25, %r14
	.word 0xfcdb8e80  ! 2911: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbbaa0820  ! 2912: FMOVA	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_120:
	mov	0x3c0, %r14
	.word 0xf8f384a0  ! 2915: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb7aa4820  ! 2917: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb5a509e0  ! 2920: FDIVq	dis not found

T1_asi_reg_wr_121:
	mov	0x3c3, %r14
	.word 0xf0f384a0  ! 2921: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb3a88820  ! 2923: FMOVLE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_122:
	mov	0x20, %r14
	.word 0xf8f38400  ! 2924: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_1_217:
	setx	0x360222, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_115:
	mov	0x3c4, %r14
	.word 0xfcdb8e80  ! 2929: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_1_218:
	setx	0x35032e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_219:
	setx	0x36003b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_223:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_223), 16, 16)) -> intp(1, 0, 39)
	.word 0xbda00520  ! 2937: FSQRTs	fsqrt	
	.word 0xb9a54940  ! 2943: FMULd	fmuld	%f52, %f0, %f28
iob_intr_1_224:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_224), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_wr_123:
	mov	0xa, %r14
	.word 0xf6f384a0  ! 2945: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xbda00560  ! 2946: FSQRTq	fsqrt	
T1_asi_reg_wr_124:
	mov	0x1a, %r14
	.word 0xf4f38e60  ! 2949: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb9a408c0  ! 2950: FSUBd	fsubd	%f16, %f0, %f28
	.word 0xb9a81820  ! 2951: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb3aa0820  ! 2954: FMOVA	fmovs	%fcc1, %f0, %f25
iob_intr_1_225:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_225), 16, 16)) -> intp(1, 0, 13)
T1_asi_reg_wr_125:
	mov	0x21, %r14
	.word 0xf6f389e0  ! 2963: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_1_220:
	setx	0x37012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_116:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 2969: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_wr_126:
	mov	0x3c1, %r14
	.word 0xf0f38e40  ! 2970: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_1_221:
	setx	0x350322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a408e0  ! 2972: FSUBq	dis not found

	.word 0xb7a80820  ! 2973: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
iob_intr_1_226:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_226), 16, 16)) -> intp(1, 0, b)
	.word 0xb80d600f  ! 2977: AND_I	and 	%r21, 0x000f, %r28
T1_asi_reg_rd_117:
	mov	0xa, %r14
	.word 0xf8db89e0  ! 2980: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_1_227:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_227), 16, 16)) -> intp(1, 0, c)
	.word 0xb9a00540  ! 2986: FSQRTd	fsqrt	
	.word 0xb3a4c9e0  ! 2989: FDIVq	dis not found

iob_intr_1_228:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_228), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb5a48940  ! 2992: FMULd	fmuld	%f18, %f0, %f26
	.word 0xbf34d000  ! 2994: SRLX_R	srlx	%r19, %r0, %r31
T1_asi_reg_wr_127:
	mov	0x3c6, %r14
	.word 0xfef38e40  ! 2996: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_1_222:
	setx	0x370030, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_229:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_229), 16, 16)) -> intp(1, 0, 4)
T1_asi_reg_wr_128:
	mov	0x2d, %r14
	.word 0xfcf38400  ! 3000: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T1_asi_reg_rd_118:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 3001: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_1_223:
	setx	0x370029, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_224:
	setx	0x35032a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_119:
	mov	0x1a, %r14
	.word 0xfadb8e80  ! 3009: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_1_230:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_230), 16, 16)) -> intp(1, 0, 36)
	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xb5aa0820  ! 3017: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xbfaa8820  ! 3018: FMOVG	fmovs	%fcc1, %f0, %f31
iob_intr_1_231:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_231), 16, 16)) -> intp(1, 0, 28)
T1_asi_reg_rd_120:
	mov	0x3c1, %r14
	.word 0xf2db8400  ! 3020: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb6158000  ! 3023: OR_R	or 	%r22, %r0, %r27
	.word 0xb7a48920  ! 3024: FMULs	fmuls	%f18, %f0, %f27
	.word 0xb9a548a0  ! 3026: FSUBs	fsubs	%f21, %f0, %f28
cpu_intr_1_225:
	setx	0x340127, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_232:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_232), 16, 16)) -> intp(1, 0, 15)
cpu_intr_1_226:
	setx	0x350031, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_233:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_233), 16, 16)) -> intp(1, 0, 23)
T1_asi_reg_rd_121:
	mov	0x3, %r14
	.word 0xf4db8e80  ! 3037: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_1_234:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_234), 16, 16)) -> intp(1, 0, e)
T1_asi_reg_wr_129:
	mov	0x3c2, %r14
	.word 0xf2f384a0  ! 3039: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xba1ca13c  ! 3041: XOR_I	xor 	%r18, 0x013c, %r29
	.word 0xbfa589e0  ! 3043: FDIVq	dis not found

	.word 0xb535c000  ! 3045: SRL_R	srl 	%r23, %r0, %r26
	.word 0xb734d000  ! 3046: SRLX_R	srlx	%r19, %r0, %r27
T1_asi_reg_rd_122:
	mov	0x1, %r14
	.word 0xfadb8e40  ! 3048: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_235:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_235), 16, 16)) -> intp(1, 0, b)
	.word 0xb5a81c20  ! 3052: FMOVRGEZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9a4c840  ! 3054: FADDd	faddd	%f50, %f0, %f28
	.word 0xbba48960  ! 3055: FMULq	dis not found

	lda	[%r22 + %g0] 0xf0, %f2
cpu_intr_1_227:
	setx	0x36012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a58840  ! 3060: FADDd	faddd	%f22, %f0, %f26
	.word 0xbdab8820  ! 3064: FMOVPOS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_130:
	mov	0x31, %r14
	.word 0xf8f38e40  ! 3066: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbda48860  ! 3067: FADDq	dis not found

	.word 0xb12c3001  ! 3068: SLLX_I	sllx	%r16, 0x0001, %r24
	.word 0xb12ce001  ! 3069: SLL_I	sll 	%r19, 0x0001, %r24
cpu_intr_1_228:
	setx	0x360323, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_236:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_236), 16, 16)) -> intp(1, 0, 3d)
cpu_intr_1_229:
	setx	0x370308, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_237:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_237), 16, 16)) -> intp(1, 0, 15)
	.word 0xb9a00540  ! 3080: FSQRTd	fsqrt	
cpu_intr_1_230:
	setx	0x340007, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_231:
	setx	0x350307, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_238:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_238), 16, 16)) -> intp(1, 0, 11)
	.word 0x8395e099  ! 3091: WRPR_TNPC_I	wrpr	%r23, 0x0099, %tnpc
iob_intr_1_239:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_239), 16, 16)) -> intp(1, 0, 33)
T1_asi_reg_rd_123:
	mov	0x3c1, %r14
	.word 0xf2db8e40  ! 3098: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb80421ec  ! 3102: ADD_I	add 	%r16, 0x01ec, %r28
T1_asi_reg_wr_131:
	mov	0x20, %r14
	.word 0xf6f38e60  ! 3104: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbfa48860  ! 3105: FADDq	dis not found

iob_intr_1_240:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_240), 16, 16)) -> intp(1, 0, 33)
T1_asi_reg_rd_124:
	mov	0x6, %r14
	.word 0xfadb8e40  ! 3108: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_1_232:
	setx	0x370236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa508e0  ! 3111: FSUBq	dis not found

cpu_intr_1_233:
	setx	0x34012a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_234:
	setx	0x360011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00540  ! 3115: FSQRTd	fsqrt	
cpu_intr_1_235:
	setx	0x360321, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_236:
	setx	0x370035, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_237:
	setx	0x34003d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_132:
	mov	0x3c1, %r14
	.word 0xf8f38e40  ! 3130: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb72c3001  ! 3134: SLLX_I	sllx	%r16, 0x0001, %r27
iob_intr_1_241:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_241), 16, 16)) -> intp(1, 0, 3d)
T1_asi_reg_wr_133:
	mov	0x19, %r14
	.word 0xf6f38400  ! 3143: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbfa98820  ! 3144: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xbda80820  ! 3150: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xbfa50960  ! 3151: FMULq	dis not found

	.word 0xb7a58860  ! 3158: FADDq	dis not found

T1_asi_reg_wr_134:
	mov	0x3c7, %r14
	.word 0xf2f38e80  ! 3159: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_242:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_242), 16, 16)) -> intp(1, 0, 33)
	.word 0xb3a5c8c0  ! 3167: FSUBd	fsubd	%f54, %f0, %f56
	.word 0xb1a84820  ! 3170: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb7ab8820  ! 3172: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xb5a489e0  ! 3174: FDIVq	dis not found

	.word 0xb7a00560  ! 3176: FSQRTq	fsqrt	
T1_asi_reg_wr_135:
	mov	0x3c7, %r14
	.word 0xfaf38e60  ! 3177: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb1a54840  ! 3178: FADDd	faddd	%f52, %f0, %f24
cpu_intr_1_238:
	setx	0x35010c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_243:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_243), 16, 16)) -> intp(1, 0, 27)
	.word 0xb5a00520  ! 3185: FSQRTs	fsqrt	
	.word 0xb9aa4820  ! 3187: FMOVNE	fmovs	%fcc1, %f0, %f28
iob_intr_1_244:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_244), 16, 16)) -> intp(1, 0, 29)
iob_intr_1_245:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_245), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_wr_136:
	mov	0x1, %r14
	.word 0xf2f389e0  ! 3194: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_1_239:
	setx	0x37020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_246:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_246), 16, 16)) -> intp(1, 0, 20)
	.word 0xb5a00520  ! 3198: FSQRTs	fsqrt	
	.word 0xb9ab4820  ! 3199: FMOVCC	fmovs	%fcc1, %f0, %f28
iob_intr_1_247:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_247), 16, 16)) -> intp(1, 0, 13)
	.word 0xb1a81420  ! 3203: FMOVRNZ	dis not found

cpu_intr_1_240:
	setx	0x34033b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_241:
	setx	0x36023c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_248:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_248), 16, 16)) -> intp(1, 0, 35)
T1_asi_reg_rd_125:
	mov	0x31, %r14
	.word 0xf6db84a0  ! 3215: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_1_249:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_249), 16, 16)) -> intp(1, 0, 24)
	.word 0xb5a00540  ! 3221: FSQRTd	fsqrt	
cpu_intr_1_242:
	setx	0x340020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80820  ! 3225: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
iob_intr_1_250:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_250), 16, 16)) -> intp(1, 0, 10)
iob_intr_1_251:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_251), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_243:
	setx	0x39001b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_244:
	setx	0x380111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa5c860  ! 3242: FADDq	dis not found

	.word 0xb8356108  ! 3243: ORN_I	orn 	%r21, 0x0108, %r28
	.word 0xb1a00520  ! 3247: FSQRTs	fsqrt	
T1_asi_reg_wr_137:
	mov	0x1f, %r14
	.word 0xf0f38400  ! 3248: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb7a4c820  ! 3249: FADDs	fadds	%f19, %f0, %f27
	.word 0xb5aa0820  ! 3250: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb9a98820  ! 3254: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xbfa44840  ! 3258: FADDd	faddd	%f48, %f0, %f62
iob_intr_1_252:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_252), 16, 16)) -> intp(1, 0, 1)
iob_intr_1_253:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_253), 16, 16)) -> intp(1, 0, e)
	.word 0xb5a50940  ! 3267: FMULd	fmuld	%f20, %f0, %f26
iob_intr_1_254:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_254), 16, 16)) -> intp(1, 0, 3f)
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xbdaa0820  ! 3271: FMOVA	fmovs	%fcc1, %f0, %f30
iob_intr_1_255:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_255), 16, 16)) -> intp(1, 0, 2b)
iob_intr_1_256:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_256), 16, 16)) -> intp(1, 0, 9)
	.word 0xbbabc820  ! 3278: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xbe158000  ! 3279: OR_R	or 	%r22, %r0, %r31
	.word 0xb9a40920  ! 3280: FMULs	fmuls	%f16, %f0, %f28
iob_intr_1_257:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_257), 16, 16)) -> intp(1, 0, e)
	.word 0xb09d4000  ! 3282: XORcc_R	xorcc 	%r21, %r0, %r24
	.word 0xb3a84820  ! 3283: FMOVE	fmovs	%fcc1, %f0, %f25
iob_intr_1_258:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_258), 16, 16)) -> intp(1, 0, 10)
	.word 0xb7a81c20  ! 3286: FMOVRGEZ	dis not found

	.word 0xbc8c0000  ! 3289: ANDcc_R	andcc 	%r16, %r0, %r30
T1_asi_reg_wr_138:
	mov	0x23, %r14
	.word 0xfaf38400  ! 3290: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_1_245:
	setx	0x380235, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_259:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_259), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbb3db001  ! 3293: SRAX_I	srax	%r22, 0x0001, %r29
cpu_intr_1_246:
	setx	0x38013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xb5a00540  ! 3301: FSQRTd	fsqrt	
	.word 0xb3a449c0  ! 3303: FDIVd	fdivd	%f48, %f0, %f56
	.word 0xb3a00040  ! 3305: FMOVd	fmovd	%f0, %f56
	.word 0xb82d619d  ! 3306: ANDN_I	andn 	%r21, 0x019d, %r28
cpu_intr_1_247:
	setx	0x3b021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00040  ! 3311: FMOVd	fmovd	%f0, %f24
cpu_intr_1_248:
	setx	0x3b030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_126:
	mov	0x2a, %r14
	.word 0xfedb84a0  ! 3314: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbc85e17f  ! 3315: ADDcc_I	addcc 	%r23, 0x017f, %r30
	.word 0xb3a80c20  ! 3316: FMOVRLZ	dis not found

	.word 0xbda54940  ! 3317: FMULd	fmuld	%f52, %f0, %f30
	.word 0xb8b4a11e  ! 3322: SUBCcc_I	orncc 	%r18, 0x011e, %r28
cpu_intr_1_249:
	setx	0x3b010c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_127:
	mov	0x1c, %r14
	.word 0xf2db84a0  ! 3329: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb1a81c20  ! 3332: FMOVRGEZ	dis not found

iob_intr_1_260:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_260), 16, 16)) -> intp(1, 0, 11)
	.word 0xb1a00520  ! 3337: FSQRTs	fsqrt	
	.word 0xb3a508c0  ! 3343: FSUBd	fsubd	%f20, %f0, %f56
cpu_intr_1_250:
	setx	0x380317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a98820  ! 3347: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xbba48820  ! 3356: FADDs	fadds	%f18, %f0, %f29
iob_intr_1_261:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_261), 16, 16)) -> intp(1, 0, 23)
	.word 0xb5a48940  ! 3360: FMULd	fmuld	%f18, %f0, %f26
T1_asi_reg_wr_139:
	mov	0x5, %r14
	.word 0xfef38e40  ! 3362: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb3a84820  ! 3363: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xb4b5e0e9  ! 3366: ORNcc_I	orncc 	%r23, 0x00e9, %r26
	.word 0xbbab4820  ! 3369: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb1a98820  ! 3371: FMOVNEG	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_128:
	mov	0x2, %r14
	.word 0xf0db8e80  ! 3377: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_1_251:
	setx	0x390204, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_262:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_262), 16, 16)) -> intp(1, 0, 2e)
T1_asi_reg_wr_140:
	mov	0x0, %r14
	.word 0xf4f38e80  ! 3380: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_1_252:
	setx	0x38031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb81c611d  ! 3384: XOR_I	xor 	%r17, 0x011d, %r28
	.word 0xbba80c20  ! 3385: FMOVRLZ	dis not found

cpu_intr_1_253:
	setx	0x3b020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a508c0  ! 3389: FSUBd	fsubd	%f20, %f0, %f56
cpu_intr_1_254:
	setx	0x390334, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_255:
	setx	0x39011f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_256:
	setx	0x3a0335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaa0820  ! 3398: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xb5351000  ! 3399: SRLX_R	srlx	%r20, %r0, %r26
iob_intr_1_263:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_263), 16, 16)) -> intp(1, 0, 3)
	.word 0xb9a00560  ! 3402: FSQRTq	fsqrt	
iob_intr_1_264:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_264), 16, 16)) -> intp(1, 0, 28)
iob_intr_1_265:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_265), 16, 16)) -> intp(1, 0, 32)
	.word 0xb37da401  ! 3407: MOVR_I	movre	%r22, 0x1, %r25
	.word 0xb7a90820  ! 3408: FMOVLEU	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_141:
	mov	0x2f, %r14
	.word 0xfcf38e40  ! 3409: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T1_asi_reg_rd_129:
	mov	0xc, %r14
	.word 0xfedb8e60  ! 3411: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T1_asi_reg_wr_142:
	mov	0x25, %r14
	.word 0xf0f38e40  ! 3412: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb084e03c  ! 3414: ADDcc_I	addcc 	%r19, 0x003c, %r24
	.word 0xbfa48960  ! 3417: FMULq	dis not found

	.word 0xb73dc000  ! 3418: SRA_R	sra 	%r23, %r0, %r27
	lda	[%r20 + %g0] 0xf0, %f2
cpu_intr_1_257:
	setx	0x39000f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_266:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_266), 16, 16)) -> intp(1, 0, 22)
	.word 0xb1a58940  ! 3425: FMULd	fmuld	%f22, %f0, %f24
T1_asi_reg_wr_143:
	mov	0x3c0, %r14
	.word 0xf0f389e0  ! 3427: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb1a80420  ! 3431: FMOVRZ	dis not found

	.word 0xb5ab8820  ! 3432: FMOVPOS	fmovs	%fcc1, %f0, %f26
iob_intr_1_267:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_267), 16, 16)) -> intp(1, 0, 3d)
cpu_intr_1_258:
	setx	0x39022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a98820  ! 3436: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xb0344000  ! 3438: ORN_R	orn 	%r17, %r0, %r24
T1_asi_reg_wr_144:
	mov	0x8, %r14
	.word 0xfef38e40  ! 3439: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_268:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_268), 16, 16)) -> intp(1, 0, 38)
	.word 0xb5aa0820  ! 3442: FMOVA	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_145:
	mov	0x3c7, %r14
	.word 0xf0f38400  ! 3443: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T1_asi_reg_wr_146:
	mov	0x3c8, %r14
	.word 0xf4f389e0  ! 3444: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb1a58960  ! 3446: FMULq	dis not found

cpu_intr_1_259:
	setx	0x38021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_269:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_269), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb5a4c940  ! 3454: FMULd	fmuld	%f50, %f0, %f26
T1_asi_reg_wr_147:
	mov	0x23, %r14
	.word 0xf2f389e0  ! 3455: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbba589a0  ! 3458: FDIVs	fdivs	%f22, %f0, %f29
	.word 0xb5a84820  ! 3459: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb004209a  ! 3461: ADD_I	add 	%r16, 0x009a, %r24
T1_asi_reg_rd_130:
	mov	0x1, %r14
	.word 0xf6db84a0  ! 3462: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_1_270:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_270), 16, 16)) -> intp(1, 0, c)
	.word 0xb3a81c20  ! 3465: FMOVRGEZ	dis not found

cpu_intr_1_260:
	setx	0x3b001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba40920  ! 3467: FMULs	fmuls	%f16, %f0, %f29
T1_asi_reg_rd_131:
	mov	0x1d, %r14
	.word 0xf6db8e80  ! 3471: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_1_271:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_271), 16, 16)) -> intp(1, 0, 2c)
cpu_intr_1_261:
	setx	0x3b022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a549e0  ! 3477: FDIVq	dis not found

iob_intr_1_272:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_272), 16, 16)) -> intp(1, 0, 36)
	.word 0xbfa00540  ! 3480: FSQRTd	fsqrt	
T1_asi_reg_rd_132:
	mov	0x31, %r14
	.word 0xf2db8e40  ! 3483: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb73d7001  ! 3484: SRAX_I	srax	%r21, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_148:
	mov	0x17, %r14
	.word 0xfaf38400  ! 3487: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T1_asi_reg_rd_133:
	mov	0xc, %r14
	.word 0xf2db8e60  ! 3488: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_1_273:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_273), 16, 16)) -> intp(1, 0, 21)
T1_asi_reg_rd_134:
	mov	0x3c7, %r14
	.word 0xfcdb8e60  ! 3492: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_1_274:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_274), 16, 16)) -> intp(1, 0, 1)
	.word 0xb3a00560  ! 3497: FSQRTq	fsqrt	
	.word 0xb9a81c20  ! 3498: FMOVRGEZ	dis not found

	.word 0xb88cc000  ! 3500: ANDcc_R	andcc 	%r19, %r0, %r28
T1_asi_reg_wr_149:
	mov	0x18, %r14
	.word 0xf8f38e40  ! 3503: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbba409e0  ! 3504: FDIVq	dis not found

	.word 0xbfab8820  ! 3505: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb6340000  ! 3507: ORN_R	orn 	%r16, %r0, %r27
	.word 0xb9ab0820  ! 3508: FMOVGU	fmovs	%fcc1, %f0, %f28
cpu_intr_1_262:
	setx	0x390111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80c20  ! 3512: FMOVRLZ	dis not found

iob_intr_1_275:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_275), 16, 16)) -> intp(1, 0, 1d)
	.word 0xbba81c20  ! 3516: FMOVRGEZ	dis not found

	.word 0xb1a80420  ! 3517: FMOVRZ	dis not found

	.word 0xb5a00540  ! 3519: FSQRTd	fsqrt	
	.word 0xb9a9c820  ! 3520: FMOVVS	fmovs	%fcc1, %f0, %f28
iob_intr_1_276:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_276), 16, 16)) -> intp(1, 0, 16)
iob_intr_1_277:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_277), 16, 16)) -> intp(1, 0, 26)
iob_intr_1_278:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_278), 16, 16)) -> intp(1, 0, 4)
	.word 0xbba489a0  ! 3525: FDIVs	fdivs	%f18, %f0, %f29
cpu_intr_1_263:
	setx	0x38003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb634e088  ! 3527: ORN_I	orn 	%r19, 0x0088, %r27
cpu_intr_1_264:
	setx	0x390122, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_135:
	mov	0x13, %r14
	.word 0xf0db8e40  ! 3533: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_1_265:
	setx	0x3a031b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_136:
	mov	0x17, %r14
	.word 0xf6db8e40  ! 3543: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbfa90820  ! 3546: FMOVLEU	fmovs	%fcc1, %f0, %f31
cpu_intr_1_266:
	setx	0x3a0002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_279:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_279), 16, 16)) -> intp(1, 0, 2)
cpu_intr_1_267:
	setx	0x3a000a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_268:
	setx	0x39022c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_137:
	mov	0x10, %r14
	.word 0xf8db8e40  ! 3563: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb68d8000  ! 3564: ANDcc_R	andcc 	%r22, %r0, %r27
	.word 0xb5a44940  ! 3567: FMULd	fmuld	%f48, %f0, %f26
iob_intr_1_280:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_280), 16, 16)) -> intp(1, 0, 36)
	.word 0xb5a88820  ! 3573: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb49dc000  ! 3575: XORcc_R	xorcc 	%r23, %r0, %r26
iob_intr_1_281:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_281), 16, 16)) -> intp(1, 0, 3c)
	.word 0xbda80820  ! 3578: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
iob_intr_1_282:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_282), 16, 16)) -> intp(1, 0, 18)
iob_intr_1_283:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_283), 16, 16)) -> intp(1, 0, 16)
cpu_intr_1_269:
	setx	0x390207, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_138:
	mov	0x38, %r14
	.word 0xfcdb8e60  ! 3585: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb1a90820  ! 3588: FMOVLEU	fmovs	%fcc1, %f0, %f24
iob_intr_1_284:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_284), 16, 16)) -> intp(1, 0, 2f)
cpu_intr_1_270:
	setx	0x390327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a88820  ! 3591: FMOVLE	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_139:
	mov	0x3c3, %r14
	.word 0xfadb8e60  ! 3593: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T1_asi_reg_wr_150:
	mov	0x1d, %r14
	.word 0xf4f38400  ! 3594: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T1_asi_reg_rd_140:
	mov	0x3c7, %r14
	.word 0xf0db8e40  ! 3595: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb3a80820  ! 3596: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb5351000  ! 3598: SRLX_R	srlx	%r20, %r0, %r26
	.word 0xbf349000  ! 3600: SRLX_R	srlx	%r18, %r0, %r31
	.word 0xbda589a0  ! 3601: FDIVs	fdivs	%f22, %f0, %f30
	.word 0xbcadc000  ! 3606: ANDNcc_R	andncc 	%r23, %r0, %r30
	.word 0xb5a00540  ! 3608: FSQRTd	fsqrt	
	.word 0xbfa50860  ! 3609: FADDq	dis not found

	.word 0xb9a44960  ! 3611: FMULq	dis not found

	.word 0xb7a488c0  ! 3613: FSUBd	fsubd	%f18, %f0, %f58
iob_intr_1_285:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_285), 16, 16)) -> intp(1, 0, 33)
	.word 0xb9a00520  ! 3615: FSQRTs	fsqrt	
	.word 0xb7a40820  ! 3617: FADDs	fadds	%f16, %f0, %f27
	.word 0xb5a80820  ! 3620: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb9a00560  ! 3624: FSQRTq	fsqrt	
	.word 0xb1ab4820  ! 3626: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xbd520000  ! 3628: RDPR_PIL	<illegal instruction>
	.word 0xb1a4c9c0  ! 3634: FDIVd	fdivd	%f50, %f0, %f24
cpu_intr_1_271:
	setx	0x38010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a84820  ! 3638: FMOVE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_141:
	mov	0x3c3, %r14
	.word 0xf2db84a0  ! 3642: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_1_286:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_286), 16, 16)) -> intp(1, 0, 1b)
T1_asi_reg_rd_142:
	mov	0x1b, %r14
	.word 0xfedb89e0  ! 3644: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T1_asi_reg_wr_151:
	mov	0x29, %r14
	.word 0xf0f38e80  ! 3645: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_1_287:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_287), 16, 16)) -> intp(1, 0, 18)
	.word 0xb1a80820  ! 3648: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb9a488a0  ! 3650: FSUBs	fsubs	%f18, %f0, %f28
T1_asi_reg_wr_152:
	mov	0x31, %r14
	.word 0xfef389e0  ! 3658: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_rd_143:
	mov	0x38, %r14
	.word 0xfadb8e40  ! 3659: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb5a00560  ! 3660: FSQRTq	fsqrt	
	.word 0xb5a81820  ! 3665: FMOVRGZ	fmovs	%fcc3, %f0, %f26
cpu_intr_1_272:
	setx	0x3a0001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba4c8a0  ! 3676: FSUBs	fsubs	%f19, %f0, %f29
iob_intr_1_288:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_288), 16, 16)) -> intp(1, 0, 33)
T1_asi_reg_rd_144:
	mov	0x37, %r14
	.word 0xf8db89e0  ! 3681: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T1_asi_reg_wr_153:
	mov	0x3c7, %r14
	.word 0xf2f38e40  ! 3682: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_wr_154:
	mov	0x33, %r14
	.word 0xf2f384a0  ! 3684: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb7a81820  ! 3685: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xbdaa8820  ! 3687: FMOVG	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_155:
	mov	0x3c1, %r14
	.word 0xf0f384a0  ! 3688: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbba50920  ! 3689: FMULs	fmuls	%f20, %f0, %f29
T1_asi_reg_rd_145:
	mov	0x3c2, %r14
	.word 0xf8db8e80  ! 3692: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_1_289:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_289), 16, 16)) -> intp(1, 0, 36)
iob_intr_1_290:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_290), 16, 16)) -> intp(1, 0, 1)
	.word 0xb5a90820  ! 3703: FMOVLEU	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_156:
	mov	0x2a, %r14
	.word 0xf0f389e0  ! 3704: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_1_273:
	setx	0x3d003b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_291:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_291), 16, 16)) -> intp(1, 0, 20)
T1_asi_reg_wr_157:
	mov	0x16, %r14
	.word 0xf6f38400  ! 3708: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb1a00560  ! 3709: FSQRTq	fsqrt	
T1_asi_reg_rd_146:
	mov	0xf, %r14
	.word 0xfedb8e40  ! 3710: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T1_asi_reg_rd_147:
	mov	0x3c0, %r14
	.word 0xfadb89e0  ! 3711: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xbfab4820  ! 3712: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xbc350000  ! 3714: SUBC_R	orn 	%r20, %r0, %r30
	.word 0xb1a81c20  ! 3716: FMOVRGEZ	dis not found

iob_intr_1_292:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_292), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb3a80c20  ! 3722: FMOVRLZ	dis not found

iob_intr_1_293:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_293), 16, 16)) -> intp(1, 0, 1b)
cpu_intr_1_274:
	setx	0x3f033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a90820  ! 3728: FMOVLEU	fmovs	%fcc1, %f0, %f24
iob_intr_1_294:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_294), 16, 16)) -> intp(1, 0, 1)
	.word 0xb5a00560  ! 3733: FSQRTq	fsqrt	
	.word 0xb5a44920  ! 3735: FMULs	fmuls	%f17, %f0, %f26
cpu_intr_1_275:
	setx	0x3e0122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aa4820  ! 3738: FMOVNE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_276:
	setx	0x3e032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba48840  ! 3749: FADDd	faddd	%f18, %f0, %f60
	.word 0xbda80c20  ! 3753: FMOVRLZ	dis not found

	.word 0xb3520000  ! 3757: RDPR_PIL	<illegal instruction>
	.word 0xb89c8000  ! 3760: XORcc_R	xorcc 	%r18, %r0, %r28
iob_intr_1_295:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_295), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_rd_148:
	mov	0x1b, %r14
	.word 0xfedb8e40  ! 3765: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T1_asi_reg_wr_158:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 3766: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_1_277:
	setx	0x3f0208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda4c8e0  ! 3768: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3aa4820  ! 3772: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xb7a44860  ! 3773: FADDq	dis not found

T1_asi_reg_wr_159:
	mov	0x1, %r14
	.word 0xf0f384a0  ! 3776: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T1_asi_reg_rd_149:
	mov	0x18, %r14
	.word 0xf0db8400  ! 3777: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb3a80420  ! 3779: FMOVRZ	dis not found

cpu_intr_1_278:
	setx	0x3e020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a488a0  ! 3784: FSUBs	fsubs	%f18, %f0, %f27
T1_asi_reg_rd_150:
	mov	0x3c4, %r14
	.word 0xf8db8e80  ! 3785: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb1a00040  ! 3786: FMOVd	fmovd	%f0, %f24
	.word 0xb6a421ac  ! 3787: SUBcc_I	subcc 	%r16, 0x01ac, %r27
	.word 0xb03ce1b6  ! 3789: XNOR_I	xnor 	%r19, 0x01b6, %r24
	.word 0xbe1461ce  ! 3790: OR_I	or 	%r17, 0x01ce, %r31
	.word 0xbba00560  ! 3791: FSQRTq	fsqrt	
	.word 0xb9a489e0  ! 3792: FDIVq	dis not found

iob_intr_1_296:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_296), 16, 16)) -> intp(1, 0, 17)
T1_asi_reg_rd_151:
	mov	0xa, %r14
	.word 0xf0db84a0  ! 3795: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb7a489c0  ! 3798: FDIVd	fdivd	%f18, %f0, %f58
	.word 0xbba00560  ! 3799: FSQRTq	fsqrt	
	.word 0xb5a54960  ! 3800: FMULq	dis not found

cpu_intr_1_279:
	setx	0x3d022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9ab8820  ! 3802: FMOVPOS	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_160:
	mov	0x10, %r14
	.word 0xf0f38400  ! 3803: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xba3ce042  ! 3808: XNOR_I	xnor 	%r19, 0x0042, %r29
iob_intr_1_297:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_297), 16, 16)) -> intp(1, 0, 20)
T1_asi_reg_rd_152:
	mov	0x9, %r14
	.word 0xfcdb84a0  ! 3813: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T1_asi_reg_rd_153:
	mov	0x12, %r14
	.word 0xfadb84a0  ! 3814: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T1_asi_reg_wr_161:
	mov	0x38, %r14
	.word 0xf8f38e40  ! 3815: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_1_298:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_298), 16, 16)) -> intp(1, 0, 9)
iob_intr_1_299:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_299), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_rd_154:
	mov	0x3c3, %r14
	.word 0xf4db8e80  ! 3818: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbf2ca001  ! 3819: SLL_I	sll 	%r18, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa81420  ! 3823: FMOVRNZ	dis not found

iob_intr_1_300:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_300), 16, 16)) -> intp(1, 0, 2c)
T1_asi_reg_rd_155:
	mov	0x3c1, %r14
	.word 0xfadb8400  ! 3826: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb3a54840  ! 3827: FADDd	faddd	%f52, %f0, %f56
	.word 0xb3a00040  ! 3828: FMOVd	fmovd	%f0, %f56
cpu_intr_1_280:
	setx	0x3d0120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_281:
	setx	0x3d0113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba14e157  ! 3837: OR_I	or 	%r19, 0x0157, %r29
	.word 0xb1a80420  ! 3838: FMOVRZ	dis not found

	.word 0xb1aac820  ! 3840: FMOVGE	fmovs	%fcc1, %f0, %f24
cpu_intr_1_282:
	setx	0x3d0331, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_301:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_301), 16, 16)) -> intp(1, 0, 31)
cpu_intr_1_283:
	setx	0x3f0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba58840  ! 3852: FADDd	faddd	%f22, %f0, %f60
	.word 0xb6b4a114  ! 3854: ORNcc_I	orncc 	%r18, 0x0114, %r27
	.word 0xb7aa4820  ! 3855: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb5a58820  ! 3858: FADDs	fadds	%f22, %f0, %f26
cpu_intr_1_284:
	setx	0x3e0113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_302:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_302), 16, 16)) -> intp(1, 0, b)
	.word 0xb9a549c0  ! 3870: FDIVd	fdivd	%f52, %f0, %f28
iob_intr_1_303:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_303), 16, 16)) -> intp(1, 0, 2f)
cpu_intr_1_285:
	setx	0x3e000a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_156:
	mov	0x3c5, %r14
	.word 0xf6db84a0  ! 3874: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xba9c0000  ! 3875: XORcc_R	xorcc 	%r16, %r0, %r29
	.word 0xb5ab8820  ! 3876: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb3ab0820  ! 3878: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xbda81420  ! 3879: FMOVRNZ	dis not found

iob_intr_1_304:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_304), 16, 16)) -> intp(1, 0, 6)
iob_intr_1_305:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_305), 16, 16)) -> intp(1, 0, 31)
	.word 0xbda54940  ! 3887: FMULd	fmuld	%f52, %f0, %f30
T1_asi_reg_wr_162:
	mov	0x3, %r14
	.word 0xf8f38400  ! 3889: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T1_asi_reg_wr_163:
	mov	0x3c4, %r14
	.word 0xf0f38e80  ! 3897: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_1_306:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_306), 16, 16)) -> intp(1, 0, a)
	.word 0xbfa5c9c0  ! 3900: FDIVd	fdivd	%f54, %f0, %f62
	.word 0xbba589e0  ! 3903: FDIVq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbda509e0  ! 3908: FDIVq	dis not found

	.word 0xb60cc000  ! 3911: AND_R	and 	%r19, %r0, %r27
	.word 0xb7a4c960  ! 3915: FMULq	dis not found

cpu_intr_1_286:
	setx	0x3f013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfa00540  ! 3923: FSQRTd	fsqrt	
cpu_intr_1_287:
	setx	0x3d0307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_288:
	setx	0x3d0230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb00d4000  ! 3929: AND_R	and 	%r21, %r0, %r24
cpu_intr_1_289:
	setx	0x3c011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb92d5000  ! 3934: SLLX_R	sllx	%r21, %r0, %r28
iob_intr_1_307:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_307), 16, 16)) -> intp(1, 0, 1f)
cpu_intr_1_290:
	setx	0x3c0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00560  ! 3941: FSQRTq	fsqrt	
iob_intr_1_308:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_308), 16, 16)) -> intp(1, 0, 26)
T1_asi_reg_wr_164:
	mov	0x3c3, %r14
	.word 0xfcf384a0  ! 3947: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_1_291:
	setx	0x3f021c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_165:
	mov	0x3c0, %r14
	.word 0xf2f38e40  ! 3950: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_rd_157:
	mov	0x6, %r14
	.word 0xfcdb8e80  ! 3953: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbf641800  ! 3956: MOVcc_R	<illegal instruction>
	.word 0xb1a00520  ! 3957: FSQRTs	fsqrt	
cpu_intr_1_292:
	setx	0x3f010b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_309:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_309), 16, 16)) -> intp(1, 0, 18)
iob_intr_1_310:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_310), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb1518000  ! 3964: RDPR_PSTATE	<illegal instruction>
	.word 0xb895e1c0  ! 3965: ORcc_I	orcc 	%r23, 0x01c0, %r28
cpu_intr_1_293:
	setx	0x3c0038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4344000  ! 3972: SUBC_R	orn 	%r17, %r0, %r26
cpu_intr_1_294:
	setx	0x3d0332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80420  ! 3976: FMOVRZ	dis not found

	.word 0xbba00540  ! 3979: FSQRTd	fsqrt	
T1_asi_reg_wr_166:
	mov	0x3c2, %r14
	.word 0xfcf38e40  ! 3980: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb3a5c940  ! 3983: FMULd	fmuld	%f54, %f0, %f56
	.word 0xb3a549e0  ! 3987: FDIVq	dis not found

T1_asi_reg_rd_158:
	mov	0x2, %r14
	.word 0xfcdb84a0  ! 3988: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_1_295:
	setx	0x3c012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a50960  ! 3990: FMULq	dis not found

	.word 0xb3a549c0  ! 3992: FDIVd	fdivd	%f52, %f0, %f56
	.word 0xb5a58820  ! 3994: FADDs	fadds	%f22, %f0, %f26
	.word 0xb3aa8820  ! 3996: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb5a90820  ! 3997: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xbfaa8820  ! 4000: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xb3a408a0  ! 4001: FSUBs	fsubs	%f16, %f0, %f25
	.word 0xbda81820  ! 4003: FMOVRGZ	fmovs	%fcc3, %f0, %f30
iob_intr_1_311:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_311), 16, 16)) -> intp(1, 0, 13)
T1_asi_reg_wr_167:
	mov	0x6, %r14
	.word 0xf2f38e80  ! 4005: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbba489c0  ! 4006: FDIVd	fdivd	%f18, %f0, %f60
	.word 0xb4244000  ! 4010: SUB_R	sub 	%r17, %r0, %r26
iob_intr_1_312:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_312), 16, 16)) -> intp(1, 0, 36)
cpu_intr_1_296:
	setx	0x3f0003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a9c820  ! 4014: FMOVVS	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_159:
	mov	0x38, %r14
	.word 0xfedb8e60  ! 4015: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_1_313:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_313), 16, 16)) -> intp(1, 0, 21)
	.word 0xb3a4c8e0  ! 4017: FSUBq	dis not found

cpu_intr_1_297:
	setx	0x3f0222, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_314:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_314), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_315:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_315), 16, 16)) -> intp(1, 0, b)
iob_intr_1_316:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_316), 16, 16)) -> intp(1, 0, f)
cpu_intr_1_298:
	setx	0x3d0309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa48860  ! 4031: FADDq	dis not found

T1_asi_reg_rd_160:
	mov	0x3c5, %r14
	.word 0xfcdb8400  ! 4032: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbfa589a0  ! 4034: FDIVs	fdivs	%f22, %f0, %f31
	.word 0xb9a48840  ! 4037: FADDd	faddd	%f18, %f0, %f28
T1_asi_reg_rd_161:
	mov	0x5, %r14
	.word 0xf0db8e80  ! 4038: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_1_317:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_317), 16, 16)) -> intp(1, 0, c)
iob_intr_1_318:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_318), 16, 16)) -> intp(1, 0, 14)
T1_asi_reg_rd_162:
	mov	0x24, %r14
	.word 0xf6db84a0  ! 4042: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_1_299:
	setx	0x3c021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80c20  ! 4048: FMOVRLZ	dis not found

	.word 0xb5a449a0  ! 4049: FDIVs	fdivs	%f17, %f0, %f26
	.word 0xb1a5c940  ! 4052: FMULd	fmuld	%f54, %f0, %f24
cpu_intr_1_300:
	setx	0x3d0017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a40860  ! 4055: FADDq	dis not found

cpu_intr_1_301:
	setx	0x3f0026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72de001  ! 4058: SLL_I	sll 	%r23, 0x0001, %r27
cpu_intr_1_302:
	setx	0x3f0112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a8c820  ! 4061: FMOVL	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_163:
	mov	0x3c2, %r14
	.word 0xf4db8e60  ! 4064: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb1a5c820  ! 4066: FADDs	fadds	%f23, %f0, %f24
T1_asi_reg_rd_164:
	mov	0x18, %r14
	.word 0xfadb8e40  ! 4068: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb5a488c0  ! 4073: FSUBd	fsubd	%f18, %f0, %f26
	.word 0xb3a81420  ! 4075: FMOVRNZ	dis not found

	.word 0xbfa408a0  ! 4078: FSUBs	fsubs	%f16, %f0, %f31
cpu_intr_1_303:
	setx	0x3c013b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_319:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_319), 16, 16)) -> intp(1, 0, 16)
cpu_intr_1_304:
	setx	0x3c0337, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_305:
	setx	0x3e011e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_320:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_320), 16, 16)) -> intp(1, 0, 34)
	.word 0xb4044000  ! 4094: ADD_R	add 	%r17, %r0, %r26
	.word 0xb3abc820  ! 4096: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb9a40820  ! 4097: FADDs	fadds	%f16, %f0, %f28
	.word 0xb1a4c9a0  ! 4099: FDIVs	fdivs	%f19, %f0, %f24
	.word 0xb5aa8820  ! 4100: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb3a448e0  ! 4101: FSUBq	dis not found

	.word 0xb3a58840  ! 4102: FADDd	faddd	%f22, %f0, %f56
iob_intr_1_321:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_321), 16, 16)) -> intp(1, 0, 8)
iob_intr_1_322:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_322), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_323:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_323), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_306:
	setx	0x3f021b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_324:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_324), 16, 16)) -> intp(1, 0, 2d)
	.word 0xbda98820  ! 4115: FMOVNEG	fmovs	%fcc1, %f0, %f30
cpu_intr_1_307:
	setx	0x3f032c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_308:
	setx	0x3e0222, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_168:
	mov	0x1, %r14
	.word 0xf6f38e40  ! 4119: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_309:
	setx	0x3c032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa588a0  ! 4122: FSUBs	fsubs	%f22, %f0, %f31
iob_intr_1_325:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_325), 16, 16)) -> intp(1, 0, 38)
iob_intr_1_326:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_326), 16, 16)) -> intp(1, 0, 33)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfa4c960  ! 4130: FMULq	dis not found

	.word 0xb550c000  ! 4131: RDPR_TT	<illegal instruction>
T1_asi_reg_rd_165:
	mov	0x24, %r14
	.word 0xf4db8e60  ! 4132: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_1_310:
	setx	0x3f0214, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_327:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_327), 16, 16)) -> intp(1, 0, 18)
iob_intr_1_328:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_328), 16, 16)) -> intp(1, 0, 39)
	.word 0xb3a94820  ! 4142: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xb1a448c0  ! 4143: FSUBd	fsubd	%f48, %f0, %f24
	.word 0xb1a589e0  ! 4145: FDIVq	dis not found

	.word 0xb2958000  ! 4147: ORcc_R	orcc 	%r22, %r0, %r25
iob_intr_1_329:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_329), 16, 16)) -> intp(1, 0, 3a)
	.word 0xbda9c820  ! 4155: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb3a9c820  ! 4156: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb9a509e0  ! 4158: FDIVq	dis not found

	.word 0xb7a80c20  ! 4162: FMOVRLZ	dis not found

	.word 0xbfa80420  ! 4163: FMOVRZ	dis not found

iob_intr_1_330:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_330), 16, 16)) -> intp(1, 0, 21)
	.word 0xb1a88820  ! 4171: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb5a88820  ! 4172: FMOVLE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_169:
	mov	0x8, %r14
	.word 0xfaf38e60  ! 4174: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_1_311:
	setx	0x43010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8795e195  ! 4178: WRPR_TT_I	wrpr	%r23, 0x0195, %tt
	.word 0xb7aa4820  ! 4179: FMOVNE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_166:
	mov	0x2f, %r14
	.word 0xf2db8e40  ! 4180: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbfa94820  ! 4181: FMOVCS	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_170:
	mov	0x3c1, %r14
	.word 0xf4f389e0  ! 4183: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbba98820  ! 4185: FMOVNEG	fmovs	%fcc1, %f0, %f29
iob_intr_1_331:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_331), 16, 16)) -> intp(1, 0, 25)
	.word 0xb4ac8000  ! 4188: ANDNcc_R	andncc 	%r18, %r0, %r26
	.word 0xbfa58940  ! 4189: FMULd	fmuld	%f22, %f0, %f62
cpu_intr_1_312:
	setx	0x400113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a589c0  ! 4192: FDIVd	fdivd	%f22, %f0, %f58
	.word 0xb3a98820  ! 4193: FMOVNEG	fmovs	%fcc1, %f0, %f25
iob_intr_1_332:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_332), 16, 16)) -> intp(1, 0, 2c)
cpu_intr_1_313:
	setx	0x430009, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_314:
	setx	0x42021f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_315:
	setx	0x430203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80c20  ! 4201: FMOVRLZ	dis not found

	.word 0xb6342128  ! 4202: SUBC_I	orn 	%r16, 0x0128, %r27
	.word 0xb5a98820  ! 4204: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb8256126  ! 4206: SUB_I	sub 	%r21, 0x0126, %r28
iob_intr_1_333:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_333), 16, 16)) -> intp(1, 0, 22)
cpu_intr_1_316:
	setx	0x43032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a588c0  ! 4212: FSUBd	fsubd	%f22, %f0, %f56
	.word 0xb7a549c0  ! 4214: FDIVd	fdivd	%f52, %f0, %f58
cpu_intr_1_317:
	setx	0x430331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aa0820  ! 4216: FMOVA	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_167:
	mov	0x3c4, %r14
	.word 0xf8db8e80  ! 4217: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T1_asi_reg_wr_171:
	mov	0x6, %r14
	.word 0xf6f38e40  ! 4227: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbfa408c0  ! 4228: FSUBd	fsubd	%f16, %f0, %f62
cpu_intr_1_318:
	setx	0x410319, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_334:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_334), 16, 16)) -> intp(1, 0, 20)
T1_asi_reg_rd_168:
	mov	0x3c5, %r14
	.word 0xf8db89e0  ! 4232: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xbba00520  ! 4235: FSQRTs	fsqrt	
cpu_intr_1_319:
	setx	0x420321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c840  ! 4238: FADDd	faddd	%f50, %f0, %f62
T1_asi_reg_wr_172:
	mov	0x3c1, %r14
	.word 0xfef389e0  ! 4239: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_wr_173:
	mov	0x13, %r14
	.word 0xf8f38e40  ! 4241: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_320:
	setx	0x400120, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_174:
	mov	0x3c1, %r14
	.word 0xf2f38400  ! 4244: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb9a488a0  ! 4246: FSUBs	fsubs	%f18, %f0, %f28
	.word 0xb1a489c0  ! 4249: FDIVd	fdivd	%f18, %f0, %f24
	.word 0xb7a4c840  ! 4252: FADDd	faddd	%f50, %f0, %f58
	.word 0xb43d4000  ! 4253: XNOR_R	xnor 	%r21, %r0, %r26
	.word 0xb9a509e0  ! 4255: FDIVq	dis not found

iob_intr_1_335:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_335), 16, 16)) -> intp(1, 0, 34)
iob_intr_1_336:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_336), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_wr_175:
	mov	0x18, %r14
	.word 0xf8f38400  ! 4259: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_1_337:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_337), 16, 16)) -> intp(1, 0, 1c)
cpu_intr_1_321:
	setx	0x410111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbac4a0d9  ! 4262: ADDCcc_I	addccc 	%r18, 0x00d9, %r29
T1_asi_reg_rd_169:
	mov	0x30, %r14
	.word 0xfadb89e0  ! 4266: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_1_322:
	setx	0x40023f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_323:
	setx	0x42010b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_324:
	setx	0x40023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8395e193  ! 4274: WRPR_TNPC_I	wrpr	%r23, 0x0193, %tnpc
	.word 0xbda4c8a0  ! 4275: FSUBs	fsubs	%f19, %f0, %f30
iob_intr_1_338:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_338), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_rd_170:
	mov	0x12, %r14
	.word 0xf0db89e0  ! 4277: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_1_339:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_339), 16, 16)) -> intp(1, 0, 16)
	.word 0xb4b40000  ! 4279: SUBCcc_R	orncc 	%r16, %r0, %r26
T1_asi_reg_rd_171:
	mov	0x3c8, %r14
	.word 0xfcdb8e40  ! 4282: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_rd_172:
	mov	0x3c3, %r14
	.word 0xfedb8e40  ! 4284: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_1_340:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_340), 16, 16)) -> intp(1, 0, 25)
T1_asi_reg_rd_173:
	mov	0x12, %r14
	.word 0xf2db89e0  ! 4286: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb17d2401  ! 4288: MOVR_I	movre	%r20, 0x1, %r24
T1_asi_reg_wr_176:
	mov	0x3c1, %r14
	.word 0xf0f38e60  ! 4289: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb3a80c20  ! 4290: FMOVRLZ	dis not found

T1_asi_reg_wr_177:
	mov	0x3c1, %r14
	.word 0xf4f38e80  ! 4291: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T1_asi_reg_rd_174:
	mov	0x11, %r14
	.word 0xf0db8e40  ! 4292: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbd2d6001  ! 4293: SLL_I	sll 	%r21, 0x0001, %r30
	.word 0xbba408a0  ! 4297: FSUBs	fsubs	%f16, %f0, %f29
	.word 0xb1a548c0  ! 4298: FSUBd	fsubd	%f52, %f0, %f24
iob_intr_1_341:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_341), 16, 16)) -> intp(1, 0, f)
	.word 0xbfa449a0  ! 4300: FDIVs	fdivs	%f17, %f0, %f31
	.word 0xb5a508c0  ! 4301: FSUBd	fsubd	%f20, %f0, %f26
T1_asi_reg_wr_178:
	mov	0x3c6, %r14
	.word 0xfef384a0  ! 4302: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T1_asi_reg_rd_175:
	mov	0x1c, %r14
	.word 0xfcdb84a0  ! 4303: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_1_342:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_342), 16, 16)) -> intp(1, 0, 21)
cpu_intr_1_325:
	setx	0x410132, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_326:
	setx	0x30006, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_343:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_343), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb5a98820  ! 4310: FMOVNEG	fmovs	%fcc1, %f0, %f26
iob_intr_1_344:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_344), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_wr_179:
	mov	0x3c8, %r14
	.word 0xfaf38e40  ! 4312: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb3aa0820  ! 4315: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xbf7dc400  ! 4317: MOVR_R	movre	%r23, %r0, %r31
	.word 0xbda40960  ! 4320: FMULq	dis not found

iob_intr_1_345:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_345), 16, 16)) -> intp(1, 0, 39)
	.word 0xbbaa0820  ! 4322: FMOVA	fmovs	%fcc1, %f0, %f29
iob_intr_1_346:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_346), 16, 16)) -> intp(1, 0, 24)
	.word 0xbfa488c0  ! 4329: FSUBd	fsubd	%f18, %f0, %f62
T1_asi_reg_rd_176:
	mov	0x12, %r14
	.word 0xfadb8e40  ! 4331: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_wr_180:
	mov	0x3c8, %r14
	.word 0xf6f38e80  ! 4332: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_1_347:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_347), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb550c000  ! 4338: RDPR_TT	<illegal instruction>
T1_asi_reg_rd_177:
	mov	0x1f, %r14
	.word 0xfadb89e0  ! 4340: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb7ab8820  ! 4341: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xbb3d1000  ! 4342: SRAX_R	srax	%r20, %r0, %r29
cpu_intr_1_327:
	setx	0x40001e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_181:
	mov	0x3c6, %r14
	.word 0xf6f38400  ! 4346: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_1_328:
	setx	0x41012f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_178:
	mov	0x34, %r14
	.word 0xfedb89e0  ! 4348: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0x8995e19f  ! 4350: WRPR_TICK_I	wrpr	%r23, 0x019f, %tick
iob_intr_1_348:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_348), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb09d8000  ! 4359: XORcc_R	xorcc 	%r22, %r0, %r24
	.word 0xbba81c20  ! 4360: FMOVRGEZ	dis not found

cpu_intr_1_329:
	setx	0x420106, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_330:
	setx	0x420231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda5c920  ! 4367: FMULs	fmuls	%f23, %f0, %f30
T1_asi_reg_rd_179:
	mov	0x3c5, %r14
	.word 0xf4db8e40  ! 4371: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_1_349:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_349), 16, 16)) -> intp(1, 0, e)
	.word 0xb1a4c920  ! 4375: FMULs	fmuls	%f19, %f0, %f24
	.word 0xb1a9c820  ! 4377: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xbba80420  ! 4380: FMOVRZ	dis not found

iob_intr_1_350:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_350), 16, 16)) -> intp(1, 0, 22)
iob_intr_1_351:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_351), 16, 16)) -> intp(1, 0, b)
	.word 0xbc84c000  ! 4386: ADDcc_R	addcc 	%r19, %r0, %r30
cpu_intr_1_331:
	setx	0x40032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 4390: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb7a80820  ! 4391: FMOVN	fmovs	%fcc1, %f0, %f27
cpu_intr_1_332:
	setx	0x10108, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_180:
	mov	0x3c6, %r14
	.word 0xf0db8e80  ! 4393: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb9a4c9c0  ! 4398: FDIVd	fdivd	%f50, %f0, %f28
iob_intr_1_352:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_352), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_333:
	setx	0x400009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a58820  ! 4402: FADDs	fadds	%f22, %f0, %f28
	.word 0xb7a4c920  ! 4404: FMULs	fmuls	%f19, %f0, %f27
T1_asi_reg_rd_181:
	mov	0x3c5, %r14
	.word 0xfedb8400  ! 4411: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb7a00520  ! 4412: FSQRTs	fsqrt	
	.word 0xbda00520  ! 4414: FSQRTs	fsqrt	
T1_asi_reg_rd_182:
	mov	0x1f, %r14
	.word 0xf4db8e80  ! 4416: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb5a81c20  ! 4418: FMOVRGEZ	dis not found

T1_asi_reg_rd_183:
	mov	0x31, %r14
	.word 0xfedb8e60  ! 4420: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xbda548a0  ! 4427: FSUBs	fsubs	%f21, %f0, %f30
	.word 0xb605a0d0  ! 4428: ADD_I	add 	%r22, 0x00d0, %r27
T1_asi_reg_rd_184:
	mov	0x3c2, %r14
	.word 0xfadb8e80  ! 4429: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_1_353:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_353), 16, 16)) -> intp(1, 0, 15)
T1_asi_reg_wr_182:
	mov	0x19, %r14
	.word 0xfcf38400  ! 4437: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0x8394a1a0  ! 4438: WRPR_TNPC_I	wrpr	%r18, 0x01a0, %tnpc
	.word 0xb7a449c0  ! 4443: FDIVd	fdivd	%f48, %f0, %f58
T1_asi_reg_rd_185:
	mov	0x14, %r14
	.word 0xf0db8e40  ! 4445: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb9a48820  ! 4446: FADDs	fadds	%f18, %f0, %f28
cpu_intr_1_334:
	setx	0x400318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba88820  ! 4450: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xbbab0820  ! 4452: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0x8f902001  ! 4453: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xbfa80c20  ! 4455: FMOVRLZ	dis not found

	.word 0xb6a46198  ! 4457: SUBcc_I	subcc 	%r17, 0x0198, %r27
	.word 0xbba44820  ! 4459: FADDs	fadds	%f17, %f0, %f29
cpu_intr_1_335:
	setx	0x400023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba40860  ! 4463: FADDq	dis not found

	.word 0xb4840000  ! 4467: ADDcc_R	addcc 	%r16, %r0, %r26
cpu_intr_1_336:
	setx	0x410006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a548e0  ! 4470: FSUBq	dis not found

cpu_intr_1_337:
	setx	0x40032b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_338:
	setx	0x420017, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_183:
	mov	0x3c8, %r14
	.word 0xf6f389e0  ! 4475: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xbfab0820  ! 4478: FMOVGU	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_184:
	mov	0x10, %r14
	.word 0xf4f389e0  ! 4479: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb3a8c820  ! 4480: FMOVL	fmovs	%fcc1, %f0, %f25
cpu_intr_1_339:
	setx	0x430212, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_340:
	setx	0x400007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aa4820  ! 4485: FMOVNE	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_185:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 4486: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_rd_186:
	mov	0x3c3, %r14
	.word 0xfcdb8e40  ! 4487: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_341:
	setx	0x410339, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_354:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_354), 16, 16)) -> intp(1, 0, 2e)
T1_asi_reg_rd_187:
	mov	0x30, %r14
	.word 0xfedb8e80  ! 4491: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T1_asi_reg_wr_186:
	mov	0x22, %r14
	.word 0xf0f38e40  ! 4492: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_1_342:
	setx	0x430136, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_188:
	mov	0x36, %r14
	.word 0xfedb89e0  ! 4495: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_1_355:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_355), 16, 16)) -> intp(1, 0, 2d)
cpu_intr_1_343:
	setx	0x40033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba05a1f9  ! 4502: ADD_I	add 	%r22, 0x01f9, %r29
	.word 0xbda50820  ! 4505: FADDs	fadds	%f20, %f0, %f30
T1_asi_reg_wr_187:
	mov	0x7, %r14
	.word 0xf2f38e40  ! 4506: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_wr_188:
	mov	0x3c5, %r14
	.word 0xf2f38e40  ! 4510: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_1_344:
	setx	0x43021d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_356:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_356), 16, 16)) -> intp(1, 0, 35)
T1_asi_reg_rd_189:
	mov	0x3c5, %r14
	.word 0xfadb8e60  ! 4513: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_1_345:
	setx	0x400105, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_190:
	mov	0x3c6, %r14
	.word 0xf2db84a0  ! 4515: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb6952028  ! 4518: ORcc_I	orcc 	%r20, 0x0028, %r27
iob_intr_1_357:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_357), 16, 16)) -> intp(1, 0, 17)
	.word 0xb5a00560  ! 4520: FSQRTq	fsqrt	
	.word 0xb1a58860  ! 4521: FADDq	dis not found

	.word 0xbfa90820  ! 4522: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb7a84820  ! 4523: FMOVE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_346:
	setx	0x410116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c860  ! 4528: FADDq	dis not found

cpu_intr_1_347:
	setx	0x43031f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_191:
	mov	0x1b, %r14
	.word 0xf0db8e60  ! 4533: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbfa489a0  ! 4539: FDIVs	fdivs	%f18, %f0, %f31
T1_asi_reg_rd_192:
	mov	0x2, %r14
	.word 0xfcdb8e60  ! 4540: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_1_348:
	setx	0x42003f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_349:
	setx	0x410007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba4c960  ! 4545: FMULq	dis not found

	.word 0xb5a00520  ! 4546: FSQRTs	fsqrt	
T1_asi_reg_rd_193:
	mov	0x16, %r14
	.word 0xf4db8e40  ! 4548: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbc8ca1f8  ! 4553: ANDcc_I	andcc 	%r18, 0x01f8, %r30
iob_intr_1_358:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_358), 16, 16)) -> intp(1, 0, 1)
	.word 0xb7aac820  ! 4555: FMOVGE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_189:
	mov	0x31, %r14
	.word 0xf0f38e60  ! 4557: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_1_350:
	setx	0x420005, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_351:
	setx	0x43033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_359:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_359), 16, 16)) -> intp(1, 0, 38)
	.word 0xbfaa0820  ! 4568: FMOVA	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_190:
	mov	0x19, %r14
	.word 0xf0f389e0  ! 4569: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_1_352:
	setx	0x410036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80420  ! 4571: FMOVRZ	dis not found

cpu_intr_1_353:
	setx	0x42022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb614e058  ! 4573: OR_I	or 	%r19, 0x0058, %r27
iob_intr_1_360:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_360), 16, 16)) -> intp(1, 0, 24)
iob_intr_1_361:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_361), 16, 16)) -> intp(1, 0, 31)
iob_intr_1_362:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_362), 16, 16)) -> intp(1, 0, 1)
iob_intr_1_363:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_363), 16, 16)) -> intp(1, 0, 32)
	.word 0xbfab0820  ! 4584: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb9a44940  ! 4585: FMULd	fmuld	%f48, %f0, %f28
cpu_intr_1_354:
	setx	0x42030f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_364:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_364), 16, 16)) -> intp(1, 0, 1c)
cpu_intr_1_355:
	setx	0x400012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a449c0  ! 4589: FDIVd	fdivd	%f48, %f0, %f58
	.word 0xbe340000  ! 4590: ORN_R	orn 	%r16, %r0, %r31
	.word 0xb3a549e0  ! 4593: FDIVq	dis not found

	.word 0xbc1d608e  ! 4594: XOR_I	xor 	%r21, 0x008e, %r30
	.word 0xbba589a0  ! 4595: FDIVs	fdivs	%f22, %f0, %f29
	.word 0xb9aa0820  ! 4597: FMOVA	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_191:
	mov	0x20, %r14
	.word 0xfef38e80  ! 4599: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xba3c60db  ! 4600: XNOR_I	xnor 	%r17, 0x00db, %r29
cpu_intr_1_356:
	setx	0x42022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00560  ! 4606: FSQRTq	fsqrt	
	.word 0xb7a58960  ! 4607: FMULq	dis not found

	.word 0xb5a9c820  ! 4608: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xbfa548e0  ! 4610: FSUBq	dis not found

iob_intr_1_365:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_365), 16, 16)) -> intp(1, 0, 1e)
cpu_intr_1_357:
	setx	0x450324, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_194:
	mov	0x2f, %r14
	.word 0xfedb8e40  ! 4614: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_1_366:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_366), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_wr_192:
	mov	0x1, %r14
	.word 0xfcf389e0  ! 4616: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T1_asi_reg_rd_195:
	mov	0x9, %r14
	.word 0xf0db8e40  ! 4619: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_wr_193:
	mov	0x3c3, %r14
	.word 0xfaf38e80  ! 4620: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T1_asi_reg_rd_196:
	mov	0x2a, %r14
	.word 0xf6db8e40  ! 4621: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb6b5a152  ! 4626: SUBCcc_I	orncc 	%r22, 0x0152, %r27
	.word 0xbda489e0  ! 4627: FDIVq	dis not found

T1_asi_reg_rd_197:
	mov	0x3c8, %r14
	.word 0xf0db8e60  ! 4628: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	lda	[%r22 + %g0] 0xf0, %f2
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_358:
	setx	0x46010a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_367:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_367), 16, 16)) -> intp(1, 0, 37)
iob_intr_1_368:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_368), 16, 16)) -> intp(1, 0, 30)
cpu_intr_1_359:
	setx	0x44001f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_194:
	mov	0x31, %r14
	.word 0xfaf384a0  ! 4641: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_1_369:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_369), 16, 16)) -> intp(1, 0, 29)
	.word 0xb3a80420  ! 4644: FMOVRZ	dis not found

	.word 0xbb2d2001  ! 4645: SLL_I	sll 	%r20, 0x0001, %r29
T1_asi_reg_wr_195:
	mov	0x3c4, %r14
	.word 0xfaf38e60  ! 4649: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbfa548a0  ! 4651: FSUBs	fsubs	%f21, %f0, %f31
T1_asi_reg_rd_198:
	mov	0x6, %r14
	.word 0xf6db8400  ! 4653: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	lda	[%r22 + %g0] 0xf0, %f2
iob_intr_1_370:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_370), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb1a408c0  ! 4662: FSUBd	fsubd	%f16, %f0, %f24
	.word 0xbda88820  ! 4663: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xbb518000  ! 4664: RDPR_PSTATE	<illegal instruction>
	.word 0xb5641800  ! 4670: MOVcc_R	<illegal instruction>
T1_asi_reg_rd_199:
	mov	0x23, %r14
	.word 0xf4db8400  ! 4673: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb1a00040  ! 4677: FMOVd	fmovd	%f0, %f24
	.word 0xbb641800  ! 4678: MOVcc_R	<illegal instruction>
T1_asi_reg_wr_196:
	mov	0x3c3, %r14
	.word 0xf2f384a0  ! 4680: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_1_360:
	setx	0x450323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba4c8e0  ! 4682: FSUBq	dis not found

iob_intr_1_371:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_371), 16, 16)) -> intp(1, 0, e)
	.word 0xb1a00520  ! 4685: FSQRTs	fsqrt	
	.word 0xb7a408a0  ! 4688: FSUBs	fsubs	%f16, %f0, %f27
iob_intr_1_372:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_372), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_wr_197:
	mov	0x3c4, %r14
	.word 0xf2f389e0  ! 4690: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_1_361:
	setx	0x44013b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_198:
	mov	0x22, %r14
	.word 0xfef389e0  ! 4692: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_wr_199:
	mov	0x18, %r14
	.word 0xf4f38e80  ! 4697: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T1_asi_reg_wr_200:
	mov	0x3c3, %r14
	.word 0xf4f38400  ! 4701: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0x83946173  ! 4704: WRPR_TNPC_I	wrpr	%r17, 0x0173, %tnpc
cpu_intr_1_362:
	setx	0x460025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda448a0  ! 4709: FSUBs	fsubs	%f17, %f0, %f30
	.word 0xbfa54840  ! 4710: FADDd	faddd	%f52, %f0, %f62
cpu_intr_1_363:
	setx	0x440134, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_201:
	mov	0x14, %r14
	.word 0xfaf38e40  ! 4726: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_1_373:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_373), 16, 16)) -> intp(1, 0, d)
	.word 0xbda4c820  ! 4734: FADDs	fadds	%f19, %f0, %f30
cpu_intr_1_364:
	setx	0x44011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8395208d  ! 4739: WRPR_TNPC_I	wrpr	%r20, 0x008d, %tnpc
iob_intr_1_374:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_374), 16, 16)) -> intp(1, 0, 9)
	.word 0xb1a90820  ! 4743: FMOVLEU	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_200:
	mov	0x35, %r14
	.word 0xf8db89e0  ! 4744: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_1_375:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_375), 16, 16)) -> intp(1, 0, 5)
T1_asi_reg_wr_202:
	mov	0x3c1, %r14
	.word 0xfef38e60  ! 4746: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb5ab8820  ! 4750: FMOVPOS	fmovs	%fcc1, %f0, %f26
cpu_intr_1_365:
	setx	0x440233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb69dc000  ! 4757: XORcc_R	xorcc 	%r23, %r0, %r27
	.word 0xb1a81c20  ! 4759: FMOVRGEZ	dis not found

	.word 0xb9a5c9a0  ! 4760: FDIVs	fdivs	%f23, %f0, %f28
	.word 0xb7a44860  ! 4761: FADDq	dis not found

T1_asi_reg_wr_203:
	mov	0x3c0, %r14
	.word 0xf8f38e80  ! 4763: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T1_asi_reg_wr_204:
	mov	0x30, %r14
	.word 0xfef38e40  ! 4766: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb3a00520  ! 4767: FSQRTs	fsqrt	
	.word 0xbdabc820  ! 4773: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xb63cc000  ! 4776: XNOR_R	xnor 	%r19, %r0, %r27
	.word 0xb5aac820  ! 4784: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb1a81420  ! 4786: FMOVRNZ	dis not found

iob_intr_1_376:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_376), 16, 16)) -> intp(1, 0, 31)
	.word 0xb7347001  ! 4788: SRLX_I	srlx	%r17, 0x0001, %r27
cpu_intr_1_366:
	setx	0x450334, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_377:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_377), 16, 16)) -> intp(1, 0, 2e)
T1_asi_reg_rd_201:
	mov	0x7, %r14
	.word 0xf0db89e0  ! 4791: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_1_367:
	setx	0x450037, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_205:
	mov	0x3c6, %r14
	.word 0xf4f384a0  ! 4797: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_1_368:
	setx	0x450322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00520  ! 4799: FSQRTs	fsqrt	
	.word 0xb3351000  ! 4802: SRLX_R	srlx	%r20, %r0, %r25
T1_asi_reg_wr_206:
	mov	0x31, %r14
	.word 0xf2f38e60  ! 4803: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T1_asi_reg_rd_202:
	mov	0x30, %r14
	.word 0xfcdb8e40  ! 4810: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	lda	[%r22 + %g0] 0xf0, %f2
T1_asi_reg_wr_207:
	mov	0x3c3, %r14
	.word 0xf6f389e0  ! 4816: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_1_378:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_378), 16, 16)) -> intp(1, 0, 32)
T1_asi_reg_rd_203:
	mov	0x2, %r14
	.word 0xfedb8e40  ! 4822: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T1_asi_reg_wr_208:
	mov	0x2e, %r14
	.word 0xf0f384a0  ! 4823: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_1_379:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_379), 16, 16)) -> intp(1, 0, 38)
	.word 0xb23d8000  ! 4827: XNOR_R	xnor 	%r22, %r0, %r25
T1_asi_reg_wr_209:
	mov	0x22, %r14
	.word 0xfef38400  ! 4829: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_1_380:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_380), 16, 16)) -> intp(1, 0, 3a)
T1_asi_reg_rd_204:
	mov	0x7, %r14
	.word 0xf6db8e80  ! 4835: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbfa508a0  ! 4836: FSUBs	fsubs	%f20, %f0, %f31
	.word 0xb7504000  ! 4837: RDPR_TNPC	<illegal instruction>
iob_intr_1_381:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_381), 16, 16)) -> intp(1, 0, 33)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a80c20  ! 4846: FMOVRLZ	dis not found

T1_asi_reg_rd_205:
	mov	0x3c1, %r14
	.word 0xf4db8e80  ! 4862: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb1a508c0  ! 4864: FSUBd	fsubd	%f20, %f0, %f24
cpu_intr_1_369:
	setx	0x470003, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_206:
	mov	0x3c6, %r14
	.word 0xf8db8400  ! 4868: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T1_asi_reg_rd_207:
	mov	0x3c6, %r14
	.word 0xf2db8e80  ! 4871: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_1_370:
	setx	0x460136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a54940  ! 4873: FMULd	fmuld	%f52, %f0, %f56
	.word 0xb3aa8820  ! 4874: FMOVG	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_208:
	mov	0x3c5, %r14
	.word 0xf0db8e40  ! 4876: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_wr_210:
	mov	0x3c1, %r14
	.word 0xfaf38e80  ! 4878: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_1_371:
	setx	0x47003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaa8820  ! 4888: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb7a589c0  ! 4890: FDIVd	fdivd	%f22, %f0, %f58
iob_intr_1_382:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_382), 16, 16)) -> intp(1, 0, a)
	.word 0xbba5c8c0  ! 4894: FSUBd	fsubd	%f54, %f0, %f60
	.word 0xb9aa8820  ! 4899: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xb6b5e102  ! 4900: SUBCcc_I	orncc 	%r23, 0x0102, %r27
iob_intr_1_383:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_383), 16, 16)) -> intp(1, 0, 2e)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbf3cd000  ! 4906: SRAX_R	srax	%r19, %r0, %r31
iob_intr_1_384:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_384), 16, 16)) -> intp(1, 0, 4)
T1_asi_reg_rd_209:
	mov	0xe, %r14
	.word 0xf0db8e40  ! 4913: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_rd_210:
	mov	0x3c8, %r14
	.word 0xf4db8e80  ! 4915: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_1_372:
	setx	0x47022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2c420ac  ! 4917: ADDCcc_I	addccc 	%r16, 0x00ac, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbba4c820  ! 4923: FADDs	fadds	%f19, %f0, %f29
	.word 0xbba48960  ! 4924: FMULq	dis not found

iob_intr_1_385:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_385), 16, 16)) -> intp(1, 0, 3e)
cpu_intr_1_373:
	setx	0x47011f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_386:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_386), 16, 16)) -> intp(1, 0, 1c)
cpu_intr_1_374:
	setx	0x450116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_387:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_387), 16, 16)) -> intp(1, 0, 26)
T1_asi_reg_wr_211:
	mov	0x21, %r14
	.word 0xf4f38e40  ! 4938: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_388:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_388), 16, 16)) -> intp(1, 0, 9)
cpu_intr_1_375:
	setx	0x450314, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_389:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_389), 16, 16)) -> intp(1, 0, 0)
T1_asi_reg_rd_211:
	mov	0x0, %r14
	.word 0xfcdb8e80  ! 4947: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb12dc000  ! 4950: SLL_R	sll 	%r23, %r0, %r24
iob_intr_1_390:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_390), 16, 16)) -> intp(1, 0, 38)
	.word 0xbdabc820  ! 4955: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xb9aa0820  ! 4957: FMOVA	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_212:
	mov	0x10, %r14
	.word 0xf0f38e80  ! 4958: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb7a58960  ! 4959: FMULq	dis not found

cpu_intr_1_376:
	setx	0x45001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80820  ! 4962: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
iob_intr_1_391:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_391), 16, 16)) -> intp(1, 0, 38)
iob_intr_1_392:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_392), 16, 16)) -> intp(1, 0, 2b)
T1_asi_reg_wr_213:
	mov	0x3c3, %r14
	.word 0xfef38e60  ! 4968: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb5a00560  ! 4969: FSQRTq	fsqrt	
cpu_intr_1_377:
	setx	0x450319, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_214:
	mov	0xc, %r14
	.word 0xfcf38400  ! 4973: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb3a58940  ! 4974: FMULd	fmuld	%f22, %f0, %f56
	.word 0xbba40840  ! 4975: FADDd	faddd	%f16, %f0, %f60
iob_intr_1_393:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_393), 16, 16)) -> intp(1, 0, f)
cpu_intr_1_378:
	setx	0x44020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80420  ! 4986: FMOVRZ	dis not found

iob_intr_1_394:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_394), 16, 16)) -> intp(1, 0, 28)
T1_asi_reg_wr_215:
	mov	0x25, %r14
	.word 0xf6f384a0  ! 4991: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T1_asi_reg_rd_212:
	mov	0xd, %r14
	.word 0xfedb89e0  ! 4993: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb5a9c820  ! 4995: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xbfa88820  ! 4996: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb7a00560  ! 4997: FSQRTq	fsqrt	

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

	.xword	0xe2f79547bd36ac77
	.xword	0x5f2cafd854a7cdf1
	.xword	0x6321910bcca9d09f
	.xword	0xb02ebd321279298b
	.xword	0x9bee5a2e17c09fb8
	.xword	0xa81cc9bef7cccac9
	.xword	0x1e2c7d451b29ca41
	.xword	0xcd564632ac3fb622
	.xword	0x9087a3de9b60096f
	.xword	0x4d82e7bd1421c620
	.xword	0xdf7e16f836b107c9
	.xword	0x0503ca1e68f5627c
	.xword	0xcb4db97ad4d36cee
	.xword	0x78d17c9a77909148
	.xword	0x54245c31e2080f02
	.xword	0x2d3664bfdbcc8f71
	.xword	0xe374e756b1a9c0d5
	.xword	0xdbed5362a67e290d
	.xword	0x99efd8cad5c30898
	.xword	0xf5bc8e00ab42c0e1
	.xword	0x28b857b55ae00f2a
	.xword	0x5d619fa76adbf44c
	.xword	0xa06a85eddef1e665
	.xword	0x2a6b1e77029b6e0c
	.xword	0x7cea430ec8226f82
	.xword	0x53310ab9bfbc118b
	.xword	0xdad5d4d03c2111d9
	.xword	0xb8998fe98ae19345
	.xword	0x7d65135aa9ae760d
	.xword	0x72ab912c1183b7d5
	.xword	0x38a2349d88c2abb7
	.xword	0xf71b991713e65682
	.xword	0x7e65f257ec60b2cd
	.xword	0xf9343241a7b2d082
	.xword	0x6332ded8a6bbb23b
	.xword	0x26649950efcdcb1a
	.xword	0x4c420ac8005bce4c
	.xword	0x4f9006bc42f6be41
	.xword	0x4edc526d1872d126
	.xword	0x7834a43eaaeebecd
	.xword	0x94b28d6f4217329c
	.xword	0x1045aaed387de600
	.xword	0x2a6dad6b72684406
	.xword	0xaf9ab96a4406c83e
	.xword	0x68d123f4e46ab1fe
	.xword	0x3b02d6e72a26cd41
	.xword	0x4b9ec24e9a16509b
	.xword	0xf1574626df263e50
	.xword	0xc4659b7d80976740
	.xword	0xffbf2a5687bce73a
	.xword	0x2fe24574fcadb124
	.xword	0x17a7cf7f87e1e5ff
	.xword	0xd10efef34e7ab1f4
	.xword	0xea7397754b1a3f37
	.xword	0x65db01048e458e09
	.xword	0xefb9b28d5f7ed909
	.xword	0xa23621357a8a0e96
	.xword	0xe980ab69f648b364
	.xword	0x89ab0f2e8417c4be
	.xword	0x311bcf734675d333
	.xword	0xef3de552479d6dce
	.xword	0xc63601acda3785d7
	.xword	0xd9f9665d9dd5a759
	.xword	0x531e229ce4c6da1b
	.xword	0x2ff87c18fdba9472
	.xword	0x0edb60cacd530d66
	.xword	0x1bdc8afb2f2e69b2
	.xword	0xa3ae98d9a171aef6
	.xword	0x614d10f20a75f9bf
	.xword	0x88db52ea0bfd2194
	.xword	0x54c80f2161ac33d8
	.xword	0x17df77114cf48212
	.xword	0x78497ba30f6ac82b
	.xword	0x03d67fc5d6d3bcd3
	.xword	0x9c846aacbf4b0384
	.xword	0xacd96abe273aba4e
	.xword	0xe9fe11450787b2dd
	.xword	0xda45acef4a755a85
	.xword	0x6de01ebcbc05ee50
	.xword	0x6f044e3eee474e92
	.xword	0xcd339f86653fa987
	.xword	0x2c8158e42a364300
	.xword	0x624f3c2e3fa260f4
	.xword	0x66bf5f455d488933
	.xword	0xfdb9c1310a1303fb
	.xword	0x53152f27c182f90e
	.xword	0x093d3ce1fe0b1651
	.xword	0x3d15fe72820a19d9
	.xword	0x083c52d704a87c72
	.xword	0x0dab23a34a6c2443
	.xword	0x08e6c93b0b8a1b9f
	.xword	0xfcf03e1eb19e12fe
	.xword	0x862bfc75d9e41093
	.xword	0x5d92a616fa4912d2
	.xword	0xaeaa6963bb129751
	.xword	0x1f5cad55d7c64c1e
	.xword	0xa97181c80e8aca31
	.xword	0x98210a914c38df0a
	.xword	0xba8ac515709871f8
	.xword	0xd85ec571c3304b34
	.xword	0x5deebb7f3ad4074a
	.xword	0xbb32962c55cb9b5e
	.xword	0x0365c7228b190bb5
	.xword	0x75165ae182795a05
	.xword	0x6df859ce0a7af78f
	.xword	0x653795d3e9f8b18f
	.xword	0x9ff46b8b3fcc4cf4
	.xword	0x40ba12785d2b8931
	.xword	0xecbac928394df57d
	.xword	0x3e41b246e8e4d1de
	.xword	0x5873e3b16b63a894
	.xword	0x8d314dd65df6b771
	.xword	0x0a986945d0fd8117
	.xword	0x10331bc37d600258
	.xword	0x9a485e563d02b96c
	.xword	0x940e94afeaa56d66
	.xword	0xf19cb73082b33bda
	.xword	0xa20b52d4a51cc0b3
	.xword	0xf4e8ed82ad08c7f7
	.xword	0x641f609edac25454
	.xword	0xb4ff1c4241136552
	.xword	0xdba712dabcf01bb9
	.xword	0xe6c178dfa1275390
	.xword	0x6795326b1e10835d
	.xword	0x19d8b6d45bb47cb5
	.xword	0x45ea6a733a169bcd
	.xword	0xfb7c6680b0b32d4b
	.xword	0xae4d8c6c76a6e64f
	.xword	0xffba12023177807f
	.xword	0x73f8f505c6b34144
	.xword	0x93758dd41f615a3e
	.xword	0xd2b2a4f6e9d47455
	.xword	0x8319c3556cd6eade
	.xword	0x4e00ea7bfd4dba95
	.xword	0x61033b9e26ba202f
	.xword	0xbca1f373fcfe4af2
	.xword	0x3cdc03f6ea4fc114
	.xword	0x12d107f5c3b935a6
	.xword	0x223252d7b109adf1
	.xword	0x512a20348a600551
	.xword	0xd21b42035cd636b0
	.xword	0x20f0798075992f8d
	.xword	0x7e717cfb8f4b189b
	.xword	0xf01510255cb48843
	.xword	0x6d5617c599f6527b
	.xword	0xaec04b154b903419
	.xword	0x33dba70985f08023
	.xword	0x3bbed9000a05292e
	.xword	0x8beb2e8c379ac0fb
	.xword	0x72b120c049ebacfb
	.xword	0xdf523bf51aec6b99
	.xword	0xe014957a7c4a42e6
	.xword	0xdd651e441799d687
	.xword	0x2370c56c859c998d
	.xword	0xbff2db910872141b
	.xword	0x923fae1db26bca01
	.xword	0x042b1c4ef06abfc1
	.xword	0x0c738f3d0474eb87
	.xword	0x360582dd3bf18580
	.xword	0x4039c564e87ebdd5
	.xword	0xd50e70a28a793ca8
	.xword	0xe67becd9a78ad357
	.xword	0xa9c1f3ff0c253b2f
	.xword	0xa8d1cd1cd1a1ad0c
	.xword	0x1466799625f27995
	.xword	0xf05c92e82c2c90c6
	.xword	0xa09ce06496e28810
	.xword	0x435124951b3fac90
	.xword	0x88c48cfc12ce4ae4
	.xword	0xe32fe3e193aa320e
	.xword	0x753130367781bb2c
	.xword	0x5a57f5605490b04e
	.xword	0x90a916225f85785d
	.xword	0x8b17adb55139ed64
	.xword	0x44487998df0c9c46
	.xword	0x140752b2eaca231e
	.xword	0x37d29fb05d5bea65
	.xword	0x6c686825bfb2677c
	.xword	0xad658dad49be95ce
	.xword	0x4dc6c1fc43c69b9f
	.xword	0xc1f6f2907cb36696
	.xword	0x623b034e2a13514b
	.xword	0xab3d227ad208c423
	.xword	0x74a8295e2968f3c7
	.xword	0xd5b4361a304372fb
	.xword	0xebcbb201834b6b88
	.xword	0x7b4aa759193ed7a5
	.xword	0x22564f3b4ffc2444
	.xword	0xd8d3ee91578995da
	.xword	0xe77019ade8892abe
	.xword	0x2562a8f1a4a66ea2
	.xword	0xa7dd108fae6ad332
	.xword	0xbc77b73655475252
	.xword	0xd3fc0823577d4ae9
	.xword	0xb8843c5c94465200
	.xword	0x4831c15b7e38b0a6
	.xword	0x290947f0ae01d3b6
	.xword	0x296903776a456793
	.xword	0x1a91bf01a39f14e9
	.xword	0x14578172b68a89fd
	.xword	0x7bece71501af4850
	.xword	0x5f9fac9de1f28085
	.xword	0x1dadcce2d898744a
	.xword	0xd0abd50a8f391ead
	.xword	0x9bd445387a0c90fa
	.xword	0x2903949314c709e3
	.xword	0x9660192eee675d12
	.xword	0x373075c82060d68f
	.xword	0xd8310f7c7a942d78
	.xword	0xd53177b6ab24f6e9
	.xword	0xa1f9c211f97a8f89
	.xword	0xdee1f08705dd5a72
	.xword	0x3db82c6eab102bf0
	.xword	0xdd2886b0fb956f34
	.xword	0xe5b13ab03a9f46b2
	.xword	0x49c16b082d25c565
	.xword	0xc2ae6f70ccec799f
	.xword	0xfd4486ca22c77096
	.xword	0x45169dd7ff460315
	.xword	0x0a32932bce646689
	.xword	0x48e31fe80eddb3b5
	.xword	0x52468491dae0a153
	.xword	0x1b6d2f1fa57ace3a
	.xword	0xf4a10c46578fda7a
	.xword	0x79f0ec9f468e26ec
	.xword	0x1185451736c6dc19
	.xword	0x6ec3196d20677970
	.xword	0xc9475aa0895f1fb5
	.xword	0xa20a648c134fb3bf
	.xword	0x6f6ca6d2ffa29572
	.xword	0xee79bc96dce49ff3
	.xword	0x11db66bcae760d88
	.xword	0x2f1b78b380fbcdaf
	.xword	0x652fbff78cc37527
	.xword	0x82aece32b9c56a0b
	.xword	0x34dcef6c0c714f57
	.xword	0xcd7541edb670ecd1
	.xword	0xbcefc609a07ecb4a
	.xword	0xc16a1eb81a366396
	.xword	0x3a2d5999b493708e
	.xword	0x0b3444eadfd4e87d
	.xword	0xa3c3a2373c854cce
	.xword	0x495c6316ffb52448
	.xword	0x9cf30a725c5eda1d
	.xword	0x37b021b97949d35b
	.xword	0xdfdfc3a3ec643b11
	.xword	0xf6b61fb054a4560f
	.xword	0xfc43f3b7b543d0ce
	.xword	0x74930b7eb3a29071
	.xword	0x33f3e5af1ce7c6c4
	.xword	0x94ca9b22b73981d3
	.xword	0x72dcdb9c107f1039
	.xword	0x281924c52764243d
	.xword	0x66f03b7fa3b5128a
	.xword	0x8227d306684a80e5
	.xword	0xfdbdf891a246b30c
	.align 0x2000
	.data
data_start_1:

	.xword	0x2883216777de2927
	.xword	0x53d5a73802f19b55
	.xword	0x96b884b71df01fb9
	.xword	0x04fb428dee21e9c2
	.xword	0x7eccce599c07d770
	.xword	0x26985e76b3730092
	.xword	0x18dc2778d9c8450e
	.xword	0x1b3c271d67119d76
	.xword	0x20443db41428a066
	.xword	0xa9d5fea657f12422
	.xword	0x81abe57971580aef
	.xword	0x0242b77982b1fe1b
	.xword	0x960447ea25cfd840
	.xword	0xb476263bee1798ce
	.xword	0x999aac7dee4798a6
	.xword	0x1eb4a86cdd794038
	.xword	0x3dd4a9bc712f7b93
	.xword	0xa738c201ab2f397e
	.xword	0xfeeadb1a1e4c6969
	.xword	0xded4909fc2ce7c0b
	.xword	0x7258168115e1d3db
	.xword	0x2aeae1ebd3f35875
	.xword	0x50dc2480dd7e3a02
	.xword	0xc36f2cd08a856f06
	.xword	0xa77c09709e935a55
	.xword	0x520dea12a21a041b
	.xword	0x382623d8772777bf
	.xword	0x3b75149590c638fe
	.xword	0x3e7184f6306101bb
	.xword	0xeb7cd8ab75b9d604
	.xword	0x835220aa91c1e289
	.xword	0xcf61884c8d17936d
	.xword	0x782cf2395d3fa428
	.xword	0x9aca16560d5c3960
	.xword	0xfadb2f525754c99a
	.xword	0x80f804c58ddb616d
	.xword	0xfeba956b9cb53f44
	.xword	0x25b7e0c3b51e76c5
	.xword	0xb06cb09f3e9bb910
	.xword	0xa58ebdb4719738c4
	.xword	0x4844bd68ad175eed
	.xword	0x7fff6c0232e8d006
	.xword	0xa87b94b1c77c68ba
	.xword	0xdc9fe08e0366389c
	.xword	0xe6192e74a93bf40a
	.xword	0xac03764c861a60ee
	.xword	0x3ac1cf86725ca87f
	.xword	0x048bea68fd4596bf
	.xword	0x2d8d0ef37fa69427
	.xword	0x3f8cb56929881db0
	.xword	0xf8858a455003fbc1
	.xword	0x1bcb636d88fea078
	.xword	0x36b14fa9d3100f1f
	.xword	0x038567c4f9047c03
	.xword	0x5da6438c75539d67
	.xword	0x564f4f09150dd82c
	.xword	0x7645f936173d2668
	.xword	0x256c4f0ae83608ec
	.xword	0x07893194224cf1f1
	.xword	0x1b962252681424d0
	.xword	0xf40f97e43cc28fc4
	.xword	0x7bd02f186cd2cca3
	.xword	0x2b2a6f77a5f3dc61
	.xword	0x553df9181df31fdd
	.xword	0x0ceb72452ee9fc3f
	.xword	0xda6984cc70a19740
	.xword	0x1b4ad96657e13766
	.xword	0xb88a6a778896eb2a
	.xword	0xf600dbb58c66e241
	.xword	0xc2c0f1fa0d33158c
	.xword	0x0f6c950da4331930
	.xword	0xd29066d697cdba82
	.xword	0xc5179c8fac5d08d6
	.xword	0xcb29bc651c3f297f
	.xword	0xd4859cf54223e497
	.xword	0x4f7b5b65d3e4349b
	.xword	0xd7511f32eafc4073
	.xword	0x479170fe3bf63bfe
	.xword	0xe8bdc4cbf18cbe36
	.xword	0x2c98c3dcedb914d4
	.xword	0xcdc76c160116aa7d
	.xword	0x1b2bcb359cf4b9a6
	.xword	0x7a517e367a0b61dc
	.xword	0x99ce833b8a5ba5aa
	.xword	0x4d8cfbcadce91150
	.xword	0x1436a718cec615e3
	.xword	0x20fa97a42896621a
	.xword	0x1c943b257d6eb43b
	.xword	0x352ad58a1148767e
	.xword	0x50f728366b5e6caf
	.xword	0x9b941ea57ac0cbfa
	.xword	0xc2b9c14640339983
	.xword	0xd238747c0e78bb9a
	.xword	0x9bdceaa67b7f29db
	.xword	0xc34ad40d3927b045
	.xword	0xdcc43c262665976d
	.xword	0xf1818a3c1673090c
	.xword	0xc1fffa348af4f50b
	.xword	0x80527013206be7bc
	.xword	0xc7798081296b8f66
	.xword	0x38f0466bef5ae268
	.xword	0x7ef2c383b8191d19
	.xword	0x1314653923155e1d
	.xword	0xad1c8ab36d4bff81
	.xword	0xaede152e34a41481
	.xword	0xa57c282856defb50
	.xword	0xff2ba1a61069ed52
	.xword	0xb46965cc60d48fd5
	.xword	0xeb376eed6673259d
	.xword	0x076536b1481f8a06
	.xword	0x1540d190119c54ba
	.xword	0x00600063a995b21d
	.xword	0xff381ac75181800b
	.xword	0x3de3df04f01d462e
	.xword	0x14f7fab2a38aa783
	.xword	0x4c61825b7e8cdb07
	.xword	0xc8525e6f4050a28b
	.xword	0x9dbad01ce6658632
	.xword	0x661d56720a35e845
	.xword	0x9bcb0462f79e7394
	.xword	0x1f2e5f0fa150a599
	.xword	0xc72d059cf0e404a1
	.xword	0xa7a42f78a700e3ef
	.xword	0x58bb1167337ad422
	.xword	0xf5ff61c9c14fb780
	.xword	0x1e1df22c48f3f2ed
	.xword	0x55c7e4ca5cbe38d1
	.xword	0x8188ac200e4a1949
	.xword	0xa9288ed503c247ed
	.xword	0x45be6eb88ebf36e6
	.xword	0x2b0e93f1f178b38d
	.xword	0xbd914c3670e244db
	.xword	0x61a5a48ec6e7c1bc
	.xword	0x159857991b9ad290
	.xword	0x20fc80be08e986fd
	.xword	0x0df761ef6d57753b
	.xword	0x0023a153412fe18b
	.xword	0xd914b5f79ca8402c
	.xword	0xb574c10ef5f1bce0
	.xword	0x63b32e0173526bc2
	.xword	0xe41d4615c179812d
	.xword	0x985317064d8f354c
	.xword	0x67db9fccb4c339ed
	.xword	0x1fc83c44e506fcd3
	.xword	0x904d90521bc611ed
	.xword	0xaa3e8b5423d44c1e
	.xword	0x159c7b3b626b3a8d
	.xword	0xc17f6e1e1f37aab4
	.xword	0x4326cda760485747
	.xword	0x8225a9ec65bdd959
	.xword	0xf5d466e7656a6a8f
	.xword	0xcdcf1cb12a807500
	.xword	0xbba7f5fb976efc35
	.xword	0xdd1865ee26b31a1c
	.xword	0x03d5d64503765432
	.xword	0x0a0c78cfd657c417
	.xword	0x3e27d23bd3d7eddf
	.xword	0xf0172acfb1480610
	.xword	0x997720e42a5bd5ed
	.xword	0xa9c71fef83fc3a84
	.xword	0x3a75d4cc03d17520
	.xword	0xeeb96b898b6ff000
	.xword	0x90f05bc9c8e370c9
	.xword	0x01c74be4de14ddcb
	.xword	0xfdf9a72c56a8ea1b
	.xword	0xaecfc3080cf1f19c
	.xword	0xbb83da289a4660a4
	.xword	0x60fdd047bdf1caac
	.xword	0x6105b944eeec41c2
	.xword	0xfceed258aab5b89c
	.xword	0xc665f220bcd1afe5
	.xword	0xeb0fdf863971f2ab
	.xword	0x068ae1e3b4ac7a15
	.xword	0x277167a5c2209f0e
	.xword	0x2c387fb79484ec1b
	.xword	0xe8e6245e0b11f1ee
	.xword	0x31e9ffd7f47dd612
	.xword	0xb75ff34e2b7bd6b5
	.xword	0xe3cfe33cd70cb714
	.xword	0xb05dbf61da67e1de
	.xword	0xbbc826fc2319ab99
	.xword	0xf77df86e685544d3
	.xword	0xfb83fa18fc9f6cbb
	.xword	0x287d3b705feca99a
	.xword	0x5420f1c984967eb4
	.xword	0x8264f053b65ff66d
	.xword	0x91cbb4c0709c8802
	.xword	0xda33eec0a3a7f801
	.xword	0x5179a5b399c5fed3
	.xword	0x7f4740e1a834cea7
	.xword	0x30cdcfaf5bc75801
	.xword	0x76e9241044b8780a
	.xword	0x49e23ba4abb6adec
	.xword	0x3f4da8da3231caf1
	.xword	0xa5df604bd47409f7
	.xword	0xa01feb101c98e138
	.xword	0x9e27b2f04ec5ebe7
	.xword	0x1c14cb518b314f3d
	.xword	0xd16b029c4fc25b4d
	.xword	0xc0fe03b4180aad3d
	.xword	0xac326b99122c21d8
	.xword	0x4ad7c3927d74f2ca
	.xword	0x2177da7be34d66d5
	.xword	0xf735152c70898ffa
	.xword	0x3d32d5bef2544161
	.xword	0x201fa7f7304f3b59
	.xword	0xe945f781c74f86a4
	.xword	0xa148b181938a6275
	.xword	0xf068c531cedd3e9f
	.xword	0xc09ac0e4a04026e4
	.xword	0xa704a8f2106d78dd
	.xword	0x4c1697b20e1ee1f6
	.xword	0x765bb4923e97f800
	.xword	0x837a01d4fb547582
	.xword	0x62e44f43086ea311
	.xword	0xa47b292b2848084f
	.xword	0x77f8949144f08f75
	.xword	0x9488d755af3e9297
	.xword	0xb943ff90deaabe88
	.xword	0x8c2177e51f25c435
	.xword	0xd49c5623d9f40ea3
	.xword	0x88f64913f3d0255d
	.xword	0xbb48ab0e12032cd7
	.xword	0xd04903b4f0a7ca36
	.xword	0xbdd068296e0888c3
	.xword	0x6a3170f1565b76dc
	.xword	0x0d10f8241fe1b023
	.xword	0x45ad8933f38a5970
	.xword	0x03c70aaf2f4b33ff
	.xword	0x8b670221df3a2838
	.xword	0x55380be74204d726
	.xword	0x79ab2ee326376cde
	.xword	0x75205e456ae9a8db
	.xword	0xc71bf47d06673015
	.xword	0xa6ce3dc56b6d28d6
	.xword	0xb9d31e8a858da3bd
	.xword	0x6cbfa5b1834e2092
	.xword	0xdcd1645540d7a501
	.xword	0xdcee01b63c718dd8
	.xword	0xa108711d9dc0b1db
	.xword	0x3a7d590d9fd0cdc2
	.xword	0xc459c310b7dd2b7b
	.xword	0xc78ebe23569a23b8
	.xword	0xd60dbc129d223da2
	.xword	0x27b4be530f6c4af6
	.xword	0x2fb6ebe16c914c23
	.xword	0x583b8478b546749d
	.xword	0xbdbd259af2c700ac
	.xword	0x8e86fbc17fc69c26
	.xword	0x961d1ac43f42868a
	.xword	0xcad6ee82cde9d48f
	.xword	0x175ac4c527474ba7
	.xword	0x3f22b7fd1b7dc618
	.xword	0xbfe3739874c0dcf9
	.xword	0x621cc389591d8bf3
	.xword	0xd5bafb12cc249fdf
	.align 0x4000
	.data
data_start_2:

	.xword	0x9ef0fa0c80db8b9b
	.xword	0x949c63595604bfc2
	.xword	0x2322de823df80959
	.xword	0x2aa44868f6557a6b
	.xword	0x0ac6d6247b4d5f69
	.xword	0xf9b3bf2ca65f2f3a
	.xword	0x93a3c6b9ea681d53
	.xword	0x6c12c1a067adece7
	.xword	0xaece50597922280a
	.xword	0x504a485685489d0f
	.xword	0xe4c46e870a84beb5
	.xword	0xef493031824fd2b9
	.xword	0x357daca5004351cc
	.xword	0x93285e4872f54640
	.xword	0x3fed3f4efbbb7cfa
	.xword	0x45f6e91172d613bb
	.xword	0x91c963d124039753
	.xword	0x421960535580aeab
	.xword	0x1ef56b49584d0f91
	.xword	0x1a21733da579eef0
	.xword	0x5d2f31cb3cf60a1d
	.xword	0xcb5c98913f1dd004
	.xword	0x160de92bbac6810b
	.xword	0xe9dd6020c2f3d4a8
	.xword	0x4c2a94af40f88431
	.xword	0xe97a7db37f756883
	.xword	0xafe7b5994c701ed4
	.xword	0x12bd46d2d7e82c4e
	.xword	0x35d1b1bbe07b65c3
	.xword	0xd715a7b983d757b3
	.xword	0xa644cf552af1238a
	.xword	0xce085cac5c1774fb
	.xword	0x3e383d40097ff5b3
	.xword	0xd7935a2a1189f2f4
	.xword	0x9d2162421d439b98
	.xword	0x7caeb41f380f518d
	.xword	0x947e706be622ccbf
	.xword	0x039a0a2048fbbba8
	.xword	0x87f5e6d646e20539
	.xword	0x7175739271521a55
	.xword	0x2ecd7fb4fce1c3c6
	.xword	0x67a658138e2df349
	.xword	0xe95a417d478958e9
	.xword	0x018c1d7855397d0f
	.xword	0x3d6ccb44d0083e2d
	.xword	0x2eaf5e4d17400928
	.xword	0xfc51d765847fb09f
	.xword	0xc54d2a9002ffc7ce
	.xword	0x2cc6b8d9989e8f79
	.xword	0xe9402c8637d355c3
	.xword	0xfa768376b4843658
	.xword	0x870c21d4dafaef88
	.xword	0x39903401582fecfe
	.xword	0x34ad119021fba246
	.xword	0xe8679be73bb95e1d
	.xword	0x83de77be86be41f8
	.xword	0xa685fd45fe05720c
	.xword	0xf6c546a205f96cf5
	.xword	0xd50b6eeeb96b143b
	.xword	0x730bbfb471115123
	.xword	0xbe0bc9058e031f0d
	.xword	0x20a2d66c65fd649d
	.xword	0x0c63a01177374a09
	.xword	0xa69a92a240d22985
	.xword	0x95c4451200ba96db
	.xword	0x61c69adbef2fa88b
	.xword	0x3ebe450ce01a250e
	.xword	0xf066ed049cfa92e3
	.xword	0xab010294dde24329
	.xword	0xb015af8548f5fb0b
	.xword	0x678b3384a60b4918
	.xword	0x3e6014ba38228821
	.xword	0xfff948e7d58a3ea9
	.xword	0xe478d25131cdbbc2
	.xword	0x6afbae3b141241da
	.xword	0x2ab6bcbea8d2e66a
	.xword	0xc500bbed54f22e42
	.xword	0xddc4b3a3f72b391d
	.xword	0x42411d6166edf4ba
	.xword	0x43f035d1fcbed603
	.xword	0x961ac1b955efa866
	.xword	0xa44f4ff4ed4b4af8
	.xword	0x8f4ec9d45e5104bc
	.xword	0x99eec6cc75b76b8d
	.xword	0x9f47702a5144b0e2
	.xword	0xe96b1320b8938dae
	.xword	0xb0e4eaf1a7713d25
	.xword	0x04e70aa82cf7ea29
	.xword	0xe337a008b96b6e7a
	.xword	0xd5beaf571bd1fcd7
	.xword	0xda50e3124b0a4e46
	.xword	0x05edf63cb779a379
	.xword	0xb5debd7e94203c71
	.xword	0xfc4f645833677ace
	.xword	0xa29a46db67049fbf
	.xword	0xe6cfaaa4e3395475
	.xword	0x08e494177528aa79
	.xword	0x5124ebab66ab2969
	.xword	0x7998d4777807e4a1
	.xword	0xabeb862f50ecd333
	.xword	0xf230d9304bd0c363
	.xword	0x3b41f383adaf42f3
	.xword	0xb02e45f9cd2d553f
	.xword	0x0667db5b85c7fae2
	.xword	0x0723423b4f391b0e
	.xword	0xd906d8b03aadf5cd
	.xword	0x39d47a98296568cb
	.xword	0xad1bf2cd24ef488e
	.xword	0x7ac1cec1e064be0d
	.xword	0x997e18e602a4da3d
	.xword	0x28f8955f432de808
	.xword	0xebfd2625051d4970
	.xword	0x1157f6df6de9ea8f
	.xword	0x78d17b973e9cde67
	.xword	0xfc3ef29a90cbda6f
	.xword	0x33e4ebc9cc06c5a0
	.xword	0xb57f8e74be7e3280
	.xword	0xda33613fde8ccebe
	.xword	0xbdf0fa14f695c124
	.xword	0xd348cb61c7ccc0e9
	.xword	0xbb2428a820a0d83c
	.xword	0x4f61f574f4a58d2c
	.xword	0xb4e6f6753335e851
	.xword	0x2e2e737c25735549
	.xword	0xc26d92044441addb
	.xword	0x66623d1136fba67e
	.xword	0x8082c86e7cf23ec2
	.xword	0x8f380ad172080f13
	.xword	0x0fd8823c601d9294
	.xword	0xae08474238a0d711
	.xword	0x82cc309d5004072b
	.xword	0x726c515a98706dd2
	.xword	0x52a998a87e2b43fe
	.xword	0x8d77be3471baeb02
	.xword	0xe0b569a2c17ede67
	.xword	0xdbb9b36e927f257e
	.xword	0xcc55123d8096841f
	.xword	0xf30e5eb5aba02a94
	.xword	0x2d8737cda003bc8e
	.xword	0x621b87aabbf4e1b1
	.xword	0x0eab24b4a944b160
	.xword	0x1a88d4ca6f714f7e
	.xword	0xda330b4aaf816129
	.xword	0xa98faee98a6ec1c7
	.xword	0xdab70ebe965e9e0c
	.xword	0x6ffbecc9b00ec35a
	.xword	0x7fef7f4b0246e8d6
	.xword	0x89660f22d7e2dad4
	.xword	0xaed54ae110d76ecd
	.xword	0xfe7cc869cdd5c26c
	.xword	0x966524c20e90d47c
	.xword	0xf5f2120eeae48c6f
	.xword	0xebbd060eeb5f7158
	.xword	0x3209a9853a334ca1
	.xword	0xc6fd80d99876b021
	.xword	0xad9875d72e8131f8
	.xword	0x96f32d2c2f1646a6
	.xword	0xe0519609f1c948b6
	.xword	0x67bc68913016c851
	.xword	0x0b33b8fd979cf007
	.xword	0xe2577947f7775863
	.xword	0x18a0c5e0f16c02b8
	.xword	0x7c30c81c79a09651
	.xword	0xb42c9ca6cdb1ad34
	.xword	0xcf30f38e54381b3a
	.xword	0xcd7971f1377a954b
	.xword	0x9afc155b27a90007
	.xword	0xce4c6bb01147e61f
	.xword	0xc800959abed4e324
	.xword	0xccf100a1fa50401f
	.xword	0x931a3db2b312f2cc
	.xword	0x8ea66171621e216e
	.xword	0xbdd40f4fe8a3353c
	.xword	0x318254072681f822
	.xword	0xbf8f23cfbd5c87fa
	.xword	0x5085f4c8be6e572e
	.xword	0xbeff159197eabeb7
	.xword	0x4f0fe846a381cac1
	.xword	0xf121a386ff79450b
	.xword	0x11eb006f0641acde
	.xword	0x3fef590d8f2eec9d
	.xword	0x3e98d108e0e89d7b
	.xword	0x18f8a2c368bf5afd
	.xword	0xef1fcb96df56eb12
	.xword	0xa45366c5b0bc22b6
	.xword	0xab2db1d894adf04d
	.xword	0xfd0ff638c5133385
	.xword	0x86198d806c278274
	.xword	0x057758199f29af64
	.xword	0xa68430e1ad568c3c
	.xword	0xc1bd2f3d250feb14
	.xword	0x2f6beef4de8e9d9a
	.xword	0xa6b0219b5fc09fda
	.xword	0x99a29fb8204a4f4e
	.xword	0xdc2e9b651b30264f
	.xword	0xd3b9156a98e0c264
	.xword	0x9044be0a0e9dda04
	.xword	0xbbf0da3c002f9cc4
	.xword	0x7ac08a18302462da
	.xword	0xf982b20376d82332
	.xword	0x432942e976972517
	.xword	0x0c2173a5c94dcc54
	.xword	0xcd3c9e8d4cc3f813
	.xword	0xe7dcc1641ae810b3
	.xword	0x60b473bce0042439
	.xword	0x59e9623c262b31f1
	.xword	0x61acc30fe37843cb
	.xword	0xe09e584a1921a973
	.xword	0x80334acd208e9d1f
	.xword	0xeb09ef25afd0f3f4
	.xword	0x35755f0e59d3eb4c
	.xword	0x23a02bd0d88338de
	.xword	0x8804ef241be2f3b5
	.xword	0xa235601d509f8593
	.xword	0xefe1922ce773360e
	.xword	0x48f3988cd7d03c0d
	.xword	0x4b1c6cc3dab6d45e
	.xword	0xb67c96ac0ab3b5b2
	.xword	0x1aebf224c90e01e9
	.xword	0x357785f97e600af5
	.xword	0x2b1b13cfd8ac4862
	.xword	0xa3a1b062b3688bcc
	.xword	0x5621877b339022c3
	.xword	0x86a74654e484e85b
	.xword	0xb837740ba4784734
	.xword	0x0bdb64cd9ebdadc6
	.xword	0xcc7dd596dd97275b
	.xword	0xedacdd602c2ab232
	.xword	0x26e437e30138265e
	.xword	0x6dd0d5f031d26286
	.xword	0x5f88f1abf1e56655
	.xword	0x56c608900668dedd
	.xword	0x7d31a404f3f725a3
	.xword	0x042b1d45d18c1435
	.xword	0x5743a4f91cc4d2e2
	.xword	0xb52a01bddf7f1e28
	.xword	0xc02c1e9ac97ef95f
	.xword	0xd70841f9e89e8d71
	.xword	0x8db0392f77c4b67c
	.xword	0x605bea3a575e6de8
	.xword	0x623f981ac2c233e7
	.xword	0x23785bb38de82285
	.xword	0x5ea545c21e870a9e
	.xword	0xe23130481535e63d
	.xword	0xe8373d170c8c97c1
	.xword	0x5604c8a2cc9da439
	.xword	0x854a9b4730b5822c
	.xword	0x85d4f8c44352e2e0
	.xword	0x61c6434ded693e77
	.xword	0x3b34e2dc4270f4ef
	.xword	0x84e544acba49fb84
	.xword	0xe8130aea8f315cdb
	.xword	0x5e0ca620b3391f4b
	.xword	0x6b0f76754651821b
	.xword	0x8f6e12eb8b16a903
	.xword	0x7c66701711c70fe3
	.align 0x8000
	.data
data_start_3:

	.xword	0x016653b9673dbfdf
	.xword	0x4e6fbdde4cf67660
	.xword	0x4ba4d3383f862de6
	.xword	0x8536913edbbb779a
	.xword	0x41a793cb92dea721
	.xword	0x3755f9741f181128
	.xword	0x450c9c99dab31ca7
	.xword	0x568f54b7052eabfc
	.xword	0xa7551807881f64aa
	.xword	0x6a1b5c898ca280df
	.xword	0x5fb079b931fb182a
	.xword	0xee6b1f7a5f124124
	.xword	0xd5143879abcdfb96
	.xword	0x7a252e43ad1e1d95
	.xword	0x8e9f21bfef011fe0
	.xword	0xb6b35d2780d8c148
	.xword	0x78ac4e8260b448d5
	.xword	0x4bdcd418c28bdf16
	.xword	0xafae91dd0906b530
	.xword	0xfc23b50fc55a2c9e
	.xword	0xda6fff9249065053
	.xword	0xe6ab91cd5c0dfecf
	.xword	0x10951ed43a173dd1
	.xword	0x249447810371fdea
	.xword	0x5fe9492d6b94a0a3
	.xword	0xa948ac67a624a530
	.xword	0xab9618069487a52c
	.xword	0xd514a23926779d90
	.xword	0x3179245e0c1ee3b9
	.xword	0xffc646a7a60d2463
	.xword	0x69c920d01ded5560
	.xword	0x16b4696e8f2deef2
	.xword	0x3d4474eccd7179c9
	.xword	0x4ee624fafcc00db9
	.xword	0x9dfaeb8aa7381fac
	.xword	0xe08da75e6799f10b
	.xword	0x5e105aa845f3443c
	.xword	0xc7a032566fd3fa18
	.xword	0x3830e06f35c8064f
	.xword	0xafc9775dd31ae24d
	.xword	0x6be5b11a32332487
	.xword	0xfd6aea75fc780a42
	.xword	0x469ed630ce52f1eb
	.xword	0x1ad1f1a5063b6834
	.xword	0x3492399f29426118
	.xword	0x4593cc16b900869f
	.xword	0x7f4265a47b4dbf38
	.xword	0x926cd2dff4b21dd5
	.xword	0x381aead5108247c6
	.xword	0x0d960eaa21d5ee65
	.xword	0xbdd6b59fb872f8e0
	.xword	0x392562bd52d123a5
	.xword	0x3ea30e9236485a03
	.xword	0xf434fe15b6b914c7
	.xword	0x5800b902863195db
	.xword	0x96aeb426a3411a5d
	.xword	0xeeb0847e446a87b6
	.xword	0xb422a6878971b190
	.xword	0x5a99e015c9f3c624
	.xword	0x7e027316b6e17b0c
	.xword	0xe863e05a666319d2
	.xword	0x36969e4787163220
	.xword	0xa0a9d411ae550c0a
	.xword	0xad7ecaa932c249eb
	.xword	0x4b8ca9f89ed411ea
	.xword	0x991d78545458f482
	.xword	0xc789a4a8ad1acfdc
	.xword	0x4862bffd16d295f2
	.xword	0xd47f9bb0a015801a
	.xword	0x104660e42ca1a3f6
	.xword	0xcc5964f278d30544
	.xword	0x4992df4d5b547823
	.xword	0xe6c180fcc511d646
	.xword	0xdb426e8b6c4b4587
	.xword	0x9c25294b3e19e055
	.xword	0xda01157aa31cf7e8
	.xword	0x058ed1a6e7e23403
	.xword	0xe49d9f9558cec1e7
	.xword	0x0f9cb83e7812d5b8
	.xword	0x60c5712060c4d483
	.xword	0x5c1c1879c0776194
	.xword	0xec65117361ec72fe
	.xword	0x1a66d0d5759a4fa3
	.xword	0xb6bd7c83ce63e3be
	.xword	0xeb23d98f972bf4fa
	.xword	0x67421975cdce348e
	.xword	0xae7343539b943f80
	.xword	0xe9c2838c51947390
	.xword	0xe6d7146b1250b7ad
	.xword	0x61f87830c9c09114
	.xword	0x7b47b85a4d71582e
	.xword	0x7aa83295ac06f438
	.xword	0x5f0246f2bceffc77
	.xword	0xa89a65b251fee017
	.xword	0x0150da206fd3b510
	.xword	0x35a3e06048ea12c2
	.xword	0x17770f01d3f20d4e
	.xword	0xfca1b74f62fdc4cd
	.xword	0x89a66b5c07b695d2
	.xword	0x0b4ad23715823c86
	.xword	0xd18544e5d7995b7a
	.xword	0x2a5e1b16b26bfc10
	.xword	0x0dce8b843f96bfb8
	.xword	0xd8b8348c3de1d85a
	.xword	0x5a66acf30e99147e
	.xword	0x885b1facc5eea41b
	.xword	0x6f0c807129f55057
	.xword	0xcd4f209dcfc89436
	.xword	0xa531c8bd67ed210d
	.xword	0x1842eea49464838d
	.xword	0x23a30707ba297df7
	.xword	0xfa4a3a8266d548bc
	.xword	0xc828c9a0c47cbb15
	.xword	0x88225f22d7a78062
	.xword	0xf79584201852827d
	.xword	0x594f3d3d525bca39
	.xword	0x763ed3abf07e54c0
	.xword	0x4be9acbebede7849
	.xword	0xb56e4e39c54472c6
	.xword	0x7bcf6aba9d5ccc53
	.xword	0x66666acd21776a30
	.xword	0x3501722ac1ebaf0a
	.xword	0xf4cff9a878d47f8b
	.xword	0xbcfdea3a01d9d53b
	.xword	0xeb85459bfe7d8bdb
	.xword	0xe0fde17c1416a224
	.xword	0xdbf991d0448ef56f
	.xword	0xbd7e05b59aa45ab3
	.xword	0xb54314320e01e676
	.xword	0xe19834109697eac3
	.xword	0xf466a06d3c8db7b6
	.xword	0x953e9a5dbf69b76e
	.xword	0x9632ea86df357e8d
	.xword	0x2cb829dad64001b3
	.xword	0x8a66c3f93207eb0f
	.xword	0x9f77455343dc5d2e
	.xword	0xb7354ec65d83b7d1
	.xword	0x8d099aee2addbfee
	.xword	0x6e42372e124acf52
	.xword	0x1be029f5f30ee142
	.xword	0xc8c9c2dca0803d16
	.xword	0x6931b95ae56082d7
	.xword	0xf4ad1558efc86666
	.xword	0x92052ab563a9da39
	.xword	0x95808539056a06c2
	.xword	0xdeed7ba833988550
	.xword	0x853f714ebc50dc2b
	.xword	0x92dad051de5dd793
	.xword	0x7480e6c20ece5f0e
	.xword	0x8a478515dbe9d250
	.xword	0xb79b584f8a1df53c
	.xword	0xa7026002c5afc693
	.xword	0x3910ddf519fca782
	.xword	0xd5c571a24af187ca
	.xword	0x6ea261153d302ede
	.xword	0x88e5ab862395f8c9
	.xword	0x36ce5e04511c3b09
	.xword	0x437c7ad6ff3492b4
	.xword	0x32f157c3cd8ec5e2
	.xword	0xdd0237cdd8b86d1e
	.xword	0x0c6238a20e615a9e
	.xword	0x13c917a625c14a7f
	.xword	0xa3cb934d75a88414
	.xword	0x2cee94e4f62e1b31
	.xword	0xb602c88400f98846
	.xword	0x9c375f8907910d43
	.xword	0xf5999e1dd37ed2df
	.xword	0xe21b3063b308f384
	.xword	0x15d3d2e152c88302
	.xword	0x61f3883b610eb58c
	.xword	0x1eff77bb1219cf7c
	.xword	0xe75f45bebee7c2ac
	.xword	0x371742d334ac7e0d
	.xword	0x90e6ce41db4159f2
	.xword	0xdebe2bcc2f91df2c
	.xword	0x3128a2a46ff8d20b
	.xword	0xcc235da9ef1961af
	.xword	0x3ee98d734d2b3fec
	.xword	0xc2b717fda08d77bd
	.xword	0xe3eb826c1e78213e
	.xword	0xc2031d88b69af149
	.xword	0x57cb569153759b6b
	.xword	0x8c64a31c6b1a6fd8
	.xword	0x2230745d6fa5ca89
	.xword	0x7f70f4435f66313f
	.xword	0x91aa2ca88baf3547
	.xword	0xba4fe97cd74e664c
	.xword	0x223f9ccf03e091d7
	.xword	0x6f8917086e258202
	.xword	0x274076c7f80985a7
	.xword	0x52e41c07d17eb622
	.xword	0x3a4ebf9b8cb326dc
	.xword	0x553df3e78b3f45e6
	.xword	0x4292c1bc4d51a50b
	.xword	0xa99b8795d3fe55a8
	.xword	0x345856fdcd912794
	.xword	0x2bf9719588843ea6
	.xword	0xcf2ad2f56fcbe591
	.xword	0xf928226dc482bba2
	.xword	0x31985dd8c25e9185
	.xword	0xff2b30d2a3c65665
	.xword	0x86bf65ed4d4b7a44
	.xword	0xb22c359f55beb3a6
	.xword	0x403ac36ed0447ce8
	.xword	0x285e2078835f116b
	.xword	0xd29fbc378019aed9
	.xword	0xadc6861b4bf269d7
	.xword	0x328d2e2115b04284
	.xword	0x05c9be90319a52a9
	.xword	0x18eb5eef74b3f1d5
	.xword	0x2c9f10d62161946c
	.xword	0xf382d524297d7491
	.xword	0x03b450c799d69779
	.xword	0x9795b9c402bafd40
	.xword	0xe8b91e31461022fd
	.xword	0x5e79f48d5bac1094
	.xword	0x43b25b4279bc2515
	.xword	0xc8284cd0b7434281
	.xword	0x5c215da045cc169c
	.xword	0xeb36115b58ce8b88
	.xword	0xbe57f936f0e1b91e
	.xword	0x9deb0572f2b9eb5c
	.xword	0xa0f106cbb64edd5f
	.xword	0x59f5ee037af426a5
	.xword	0x722bda3ae7d41b6d
	.xword	0xf350b5d224d4dc40
	.xword	0xd44e315baad8bd46
	.xword	0x4fa185e2ea104144
	.xword	0x91b0a5e13b55db37
	.xword	0x32276abf2c713a47
	.xword	0xb3aabc359ea008fa
	.xword	0xda67ff370e7d184d
	.xword	0x8ef8063a8c58247d
	.xword	0xa8db3844cf9e80f4
	.xword	0x3d3945d5100bd2fa
	.xword	0x68b9d2da45ff7101
	.xword	0x6dd65f17598b3198
	.xword	0x255759b30170d81c
	.xword	0xeab75be7347bc995
	.xword	0x7079642e492bf50b
	.xword	0x35ef06ec48078b50
	.xword	0xb712c8fd645a763b
	.xword	0xcdd7634ec5050e51
	.xword	0x2d4ea69a372524a3
	.xword	0xb41f05bfbf514a36
	.xword	0xa9354a7eb0dc5cf2
	.xword	0x2e3a9221c14668c8
	.xword	0xc29bacce77a9ba71
	.xword	0x15b1e4208ce5e135
	.xword	0x53e0c1656017c4d7
	.xword	0xe06adb03d3723e54
	.xword	0x51048047bf90fa06
	.xword	0xc60975b360abbd9d
	.xword	0xa33e10534721a4d0
	.xword	0x5e0713a0d6dc4d7a
	.xword	0x15a95087ac7aa2d9
	.align 0x10000
	.data
data_start_4:

	.xword	0xb851c322aa2d9cc5
	.xword	0xaef284b26251d22c
	.xword	0xdf3890099fe4b101
	.xword	0x5da7fb8e1b7106f1
	.xword	0x8d7d362306a255d0
	.xword	0xabbe737319d9c1e4
	.xword	0xa956064a8ad26ff3
	.xword	0x2d555f1c4c93b571
	.xword	0xc1273d9c02945eb4
	.xword	0xfcb4eb3c27151f60
	.xword	0x8ad41fa277e2feac
	.xword	0x74ffb40925ad16cc
	.xword	0xae415c456f8a14c7
	.xword	0x88eac589b3327e4c
	.xword	0xae86c0ac61ae4a54
	.xword	0x8f4a44d9056a26ac
	.xword	0xf6d091d8b9167062
	.xword	0x06e9516a2f77119b
	.xword	0x610f3be45a2ed407
	.xword	0x60bab23ea336f575
	.xword	0x9e9e46eabc9a6469
	.xword	0x8f5db4117518de98
	.xword	0x926fb6a4df33206f
	.xword	0x2936b0422dca8bb2
	.xword	0x03376a91c7acc0a5
	.xword	0xfe71a40437f09c65
	.xword	0xdab8a889cc9ac5f0
	.xword	0xf2978912945f6dd6
	.xword	0xaa61bc3679a7470d
	.xword	0x02678c67aa026207
	.xword	0x2304407535dac5cf
	.xword	0xd2897c228d74c96f
	.xword	0x422992914a1dac2b
	.xword	0xbbf003a7ca2b843b
	.xword	0x5c918e60c0fb0110
	.xword	0x8d32739d085e0df6
	.xword	0xabcc2f6aafdc9554
	.xword	0xc02b428c0d6d7152
	.xword	0x02b526096e0f942c
	.xword	0x735a3e119c292286
	.xword	0xbac5c19a57c127f6
	.xword	0x2644a271bf339293
	.xword	0x6411f33f54e19af8
	.xword	0x96203dcd1ceb0824
	.xword	0x3671792068edb3a2
	.xword	0xe793d91a281513cb
	.xword	0xf540b943651abda4
	.xword	0xe7fae36bed3d7236
	.xword	0xc9c7db261c31c48e
	.xword	0x95729e86d9035099
	.xword	0x235fdc59aad499a4
	.xword	0xac5e9b1779f45b5b
	.xword	0x1673ab3ae831cbed
	.xword	0x36341596c4032fb0
	.xword	0x193ddf6f208c8b64
	.xword	0x81e25a122eb96faf
	.xword	0x01bc6f05c1a713c7
	.xword	0xfa7668aca2391edc
	.xword	0xdec2021a80ac2cf9
	.xword	0xc6bb79649d225b27
	.xword	0x35db2f4c32256d05
	.xword	0x21c5c7653a8b341c
	.xword	0x8065b0e81cc60eba
	.xword	0x3e611504ba0f8409
	.xword	0x07cc683a701fa3c5
	.xword	0x14b5dd2ad85835c3
	.xword	0x6632af1449456464
	.xword	0x242f129ea36441b6
	.xword	0x230c572f89792853
	.xword	0xd380e817eaec1462
	.xword	0xa75ba22fe8171172
	.xword	0xccb99e2bfbe1c0fa
	.xword	0x4a07af3e73a9c928
	.xword	0x9cf8950d44567ddc
	.xword	0x81f0b0e9ab6ee588
	.xword	0x4a3440d04493ed6b
	.xword	0x0d15b82d8c1fc30b
	.xword	0x73dc41fcb2090380
	.xword	0x5b7273c56a0a9843
	.xword	0x9ad67737e347ef8c
	.xword	0x0b7a061cab6e4466
	.xword	0xefed0bf0a6585b2f
	.xword	0x8e2fb8fa0c291602
	.xword	0x83cd6874178ba25a
	.xword	0x8b7ba62b0d8bd2b9
	.xword	0xe3e52609931cbbda
	.xword	0x839f2adc7465ffcd
	.xword	0x7d378cfd5a7037b8
	.xword	0x7bbf38e7becf8310
	.xword	0x7d6356ce64f97f48
	.xword	0x018bb269bc00ece5
	.xword	0x28510d699d1e0aad
	.xword	0x891f18a2f8da33f9
	.xword	0xecdb7f14b6381588
	.xword	0x724413ad144445f7
	.xword	0xc05ca62ede7c19fa
	.xword	0x9731f96cad4b1c53
	.xword	0x1e31dbf7a2ec512d
	.xword	0x6624e99f44cf191b
	.xword	0xdc7b66710a2a5fc0
	.xword	0xef0fdb24e6982dbc
	.xword	0xb3e00d27350d1522
	.xword	0x0e62b3c4232a5e2f
	.xword	0x5fa2c092f0bba7da
	.xword	0x75a7dc353d7269df
	.xword	0xd647a8c799532c6a
	.xword	0x99f1df8db417ce45
	.xword	0xf2207b6f80b885f6
	.xword	0xa75207f93276a4cf
	.xword	0xa0ec8e81fdbd7298
	.xword	0x5b8cb26518c851d7
	.xword	0x9df1f5911e062ae1
	.xword	0xe6bc0e886b6b53ab
	.xword	0xd58ccbbac1fc6b5e
	.xword	0xa502a7f4e89978f5
	.xword	0x53030b4a76667913
	.xword	0xdeed66e240de44ac
	.xword	0xa447608ff8322d40
	.xword	0x4dacead5d0b68589
	.xword	0x9b42ede3a98ae652
	.xword	0x9184d84ac50adc71
	.xword	0x87ab7a366097a956
	.xword	0x7e1bd381a90863b0
	.xword	0x1409df51539a9499
	.xword	0x80a1b92f12ed3654
	.xword	0x92a87f90b9ed0146
	.xword	0x48acdc15c1076ab7
	.xword	0xf8d9fcfb406a854f
	.xword	0x8219a59b0d06c05f
	.xword	0x3f8629b14d902911
	.xword	0xb4c8f69ddd5b2302
	.xword	0x01c9f509691646de
	.xword	0xb5f3818bb6c4abe7
	.xword	0x52d5d0d70be7d5f4
	.xword	0x0299f3ad63a74be5
	.xword	0x1e5bff22bf19c6c7
	.xword	0x3b04a791547c8721
	.xword	0x3ac99542119e3ec2
	.xword	0x580b3577ee5e7971
	.xword	0x89a6a3d19a55d3c6
	.xword	0xf5ab051d2c86baf6
	.xword	0x9a81ff4f6795a0b3
	.xword	0x60f3ca3512e6af34
	.xword	0x3fb892430e2f3bfd
	.xword	0x58a16e8f0b0f1807
	.xword	0xe5f55b3d91024bad
	.xword	0x1f11d20bd0079bff
	.xword	0x7dabb98ce9ee0f56
	.xword	0x650c46d6e9e00cda
	.xword	0x8af29ee0f47c11c0
	.xword	0x84604448053aa2e2
	.xword	0x8b20f4c358a4ffdb
	.xword	0xc3d12334662d7779
	.xword	0xc47fb46ea718544f
	.xword	0x111880a57a17d380
	.xword	0xc6e1e2109036939b
	.xword	0x16b653c20210f0f5
	.xword	0x62daa85566fc8175
	.xword	0x9be87451c4cd6579
	.xword	0x5cde991052f8e00c
	.xword	0x75d48af8c6b21d17
	.xword	0xb30ae3d554ab2748
	.xword	0xb29e8fe247af16f5
	.xword	0x19d65d0bff027a58
	.xword	0x892a4fa7e6c87642
	.xword	0xe3c49841adc3ebfc
	.xword	0x28f2175e4eab694d
	.xword	0x63f19033d34de750
	.xword	0xa52fa51f5c51f4f9
	.xword	0xa82836ca05e39494
	.xword	0x402cea83b29d3cfa
	.xword	0xb522afb36ad0f574
	.xword	0xbf77c2a4c18f6bfb
	.xword	0x67651cc02e60283d
	.xword	0xdd1de5509dce88ea
	.xword	0xc6a89d98c5179b39
	.xword	0x97f57fb78552c5a8
	.xword	0xc9373ff995bf9ad6
	.xword	0x52b666432be22bd7
	.xword	0xe799fac019bf8ef1
	.xword	0xb8d48c53328d9e83
	.xword	0xce539aee31ac95fa
	.xword	0x8f2c306ce59e3d08
	.xword	0x0790686208af37a3
	.xword	0x76ef6940e1db91b2
	.xword	0x87fedcdaf5625902
	.xword	0x3bd3166a7448e956
	.xword	0x0b940edbfd3ae341
	.xword	0x35c61500af0c1d81
	.xword	0xc9bf1287d6512c44
	.xword	0xf10fac10a7a44ddf
	.xword	0xa6507d93e038f5a5
	.xword	0x65eb9df17f3ad933
	.xword	0x22755d51bbde0405
	.xword	0x80334e756dc875bb
	.xword	0x831d8fa9266f855e
	.xword	0xa7ec6c04f3cb9aff
	.xword	0x4e4258af4b85d95d
	.xword	0x087309851a90476c
	.xword	0xc627a91a86e764cb
	.xword	0xe0db23ddcfb3f0c4
	.xword	0x223c50cc499e1ec6
	.xword	0x8d79949cf1b6cdf0
	.xword	0x5c0f03253b1932e0
	.xword	0x6017e522c13b3a7c
	.xword	0x2900129e39142ae8
	.xword	0x64159b6ee540e6d2
	.xword	0x3dc6372ea48c0ee3
	.xword	0x616acad6d925ac4d
	.xword	0xf9198f32ec97c23d
	.xword	0xa6a304a50fbf642f
	.xword	0x9b49545151b3b5c0
	.xword	0xa91505ee1f9b87b1
	.xword	0x7fed319fe55b9536
	.xword	0x91be495498e06816
	.xword	0xe782c3397ef6a5e3
	.xword	0x1f095e19b47d1cb1
	.xword	0x7030efa587a254e4
	.xword	0xec18ea97263c8ea8
	.xword	0x208d13faf3d52ab1
	.xword	0xb38c7f7f7047f670
	.xword	0x735602eef4643120
	.xword	0x9539714bf395ace7
	.xword	0xe92ad64a11d9b56e
	.xword	0xe98ec0ad19a44f81
	.xword	0xfb29a4350ce8a6f5
	.xword	0x1dba824e90eac4fc
	.xword	0x16ad21fb43746005
	.xword	0x87b4d47545dbc6b7
	.xword	0x12d8ebb811717257
	.xword	0xc23aa1e9ceef96a2
	.xword	0xfeff92225150184f
	.xword	0x24f43e6c94a48824
	.xword	0x86e801843c66755c
	.xword	0x523fabc5c780817f
	.xword	0x888a6d51495000b4
	.xword	0x23d0f635639f1128
	.xword	0x86e91e20d2b92282
	.xword	0x23501e1f90cbdf30
	.xword	0x8f2bcb0a3756edb1
	.xword	0x2884b64846769ca8
	.xword	0x43c08d9b90367bf8
	.xword	0x6eef53a344f0b913
	.xword	0x267c188b409d5062
	.xword	0x134681f8126fcf72
	.xword	0xd5ebdfca85d678a1
	.xword	0x9c85e3218691f7fe
	.xword	0x9c815da912f23178
	.xword	0xc7c943c56932c659
	.xword	0xc3690f9ffed670b9
	.xword	0x1833af2a47a860cf
	.xword	0x69169729b7f921d1
	.xword	0x9d53520b41c71d59
	.xword	0x8f793a25a9cba2fa
	.xword	0x0ba295db536c65d5
	.xword	0x3a775795fcb6cbe5
	.align 0x20000
	.data
data_start_5:

	.xword	0x71e54d2e712207d5
	.xword	0xebbbea9ccbcbc313
	.xword	0x3cca83b1cc475ce9
	.xword	0xe3338edf42f59b43
	.xword	0x82f2adf470c75b7b
	.xword	0x9746eda51d29475e
	.xword	0xf2f31c93b626d4e7
	.xword	0xe0dd6982bff4c978
	.xword	0x462f1f89fc2a8959
	.xword	0x92711e57079089b4
	.xword	0xd0bdb84aeefeef9a
	.xword	0x92aa07f56793526b
	.xword	0x077b3121b9326b55
	.xword	0x31129625f7f6c066
	.xword	0xdafb223ae85640d2
	.xword	0x144aae5e5dde8789
	.xword	0x6c3fd35d14f8643f
	.xword	0xea0683508c8a29d7
	.xword	0xb89bf3234c247761
	.xword	0x4dbe806b58f6f885
	.xword	0x681d17d8fefe07ee
	.xword	0x74cbe6451d7742f7
	.xword	0x2ce45027991bdd91
	.xword	0xe9afb1d623eca405
	.xword	0x66d22d2e32734854
	.xword	0x0e05ebb87080e537
	.xword	0xe42811b665e681d6
	.xword	0x686f49d9881ff106
	.xword	0x8642154a27f57ea4
	.xword	0xa8a43fd73820adc5
	.xword	0xf788c87975dadda4
	.xword	0x02eef488a642fdc5
	.xword	0xcbae966db13a84cb
	.xword	0x36b64f36c86b058b
	.xword	0x4c047dfab7d974fe
	.xword	0x75999197847deffe
	.xword	0x7728c5ceb04a1898
	.xword	0x367944510cc45f8c
	.xword	0x306ea1f53b441d17
	.xword	0x54d99876e5f4f4a3
	.xword	0xb4cf6fde97e0f0e6
	.xword	0xe33796248d2585bb
	.xword	0x02f56691a2db3f24
	.xword	0xad584a6ae3f6ce57
	.xword	0x51aa1ab3fde16bc0
	.xword	0x595568174b090448
	.xword	0x4b2a58e93e530d2f
	.xword	0x67ea8d8eb897c06d
	.xword	0x28e52c755b5851ea
	.xword	0x8075a4e3a333d753
	.xword	0x205acfcbddebae68
	.xword	0xc7cce2787eae90c7
	.xword	0xcbe72195ba1ce423
	.xword	0xdf2ba8eb9e64b3e6
	.xword	0xd4ccd260ca656e2a
	.xword	0x952e86a27c9cb926
	.xword	0x891a8f07ec8bf9cc
	.xword	0xd6f4b6ebb4da9855
	.xword	0x025a70b6b9f352c7
	.xword	0x3af32323c4eeb9eb
	.xword	0x09f06ba2e9864484
	.xword	0xdb1fc9ec7e1be848
	.xword	0x9d21a432ebe44cc9
	.xword	0x1a9b193bd59369de
	.xword	0x3a53e40a1bf62e39
	.xword	0x55a3d1f8cd9489fd
	.xword	0xa1b849b693927f1e
	.xword	0x26e7cd9d849a0adf
	.xword	0xa62427cd9fd1fedf
	.xword	0xdcd0ce07dd5c0692
	.xword	0x1e09ee4afc2a8d76
	.xword	0xfcedc9d13fff2539
	.xword	0xde9e8ab19307f72c
	.xword	0xb123757c00c6140c
	.xword	0x8a8bb6aa48ae3d87
	.xword	0xc06d7a80f4d4e590
	.xword	0x7b1e104860f143ff
	.xword	0xd668c0ab8effa2ce
	.xword	0xf0c39b9e5f89a6f4
	.xword	0x73c3ec7f4f79ff45
	.xword	0x9aa639b6fc2d1427
	.xword	0x8b608f52d1125ac2
	.xword	0x241d6be19666f11e
	.xword	0xe1b7ffa2b585a598
	.xword	0xbaf03df7e4ef3521
	.xword	0x586d5445b94cadae
	.xword	0x2ef4086809d28a93
	.xword	0x0db5651118a17f5e
	.xword	0x62d165645a3d7df1
	.xword	0xd35198d4d8314d99
	.xword	0x1aa0218daa304ae3
	.xword	0x710b711806be89a1
	.xword	0x483107f6e431f977
	.xword	0x72122bfcc4c9fabf
	.xword	0x86a08e53302bb2cc
	.xword	0xbdbdcfff1dec378d
	.xword	0x7a142f7b3cf481e3
	.xword	0x0e462998d40ffc46
	.xword	0x3eaf04513b22ef7f
	.xword	0x2fd069a202d7b9ba
	.xword	0x1d992270015bf0e2
	.xword	0x84a13b61ec247b66
	.xword	0xe04e61806f51467e
	.xword	0x66f9acc761cb7aa1
	.xword	0x4a44f7216bece76f
	.xword	0xd0c15d2bc345686a
	.xword	0x7c2757fe8c0baf24
	.xword	0xdadecd8c5806b02d
	.xword	0x15e38c24d44ffade
	.xword	0xb8a4fbdc6bc58905
	.xword	0xb3ccad60503ac4bb
	.xword	0x7123e38c92e7b83f
	.xword	0xf604ceb52d6af65d
	.xword	0xd59bb8570f6f9c42
	.xword	0x5bc8d3fe4d464c9c
	.xword	0x88f5fef383cabe79
	.xword	0xb87539c36dbaa04d
	.xword	0x0bf9ac2079296da5
	.xword	0xdb73d6e151667f95
	.xword	0xe910fbda54b98030
	.xword	0xb0b9a853d17f69be
	.xword	0x348bf1109593a55e
	.xword	0xa9bc30a8d539ced0
	.xword	0xc0218329441adfa2
	.xword	0x832f46f28a97e704
	.xword	0xb62f9249a6af57bd
	.xword	0x17b86698afb0c3d9
	.xword	0x016a11c44a8e187c
	.xword	0x06b4bbeaa5750e0c
	.xword	0x8acdf6716e8bbdbe
	.xword	0x17c6a8bdb016ee59
	.xword	0x64a5339d9886dc10
	.xword	0x9e25fa49c5b510cc
	.xword	0x38f0a75900ab5625
	.xword	0x5d8aaf8d633f4445
	.xword	0xaa8f1b95c53e76f7
	.xword	0x8c7fcf83796e078a
	.xword	0x51ae76ed708e2d58
	.xword	0xf20f15351dbb966e
	.xword	0x8062ed3608e31a09
	.xword	0x7cd3d32df566a580
	.xword	0x998ce819870a4057
	.xword	0x06ba6f7bf3d95cb1
	.xword	0x041d48014efd4a3b
	.xword	0x2873495a87d4e836
	.xword	0x04323022af7727fc
	.xword	0x8313339f13993d77
	.xword	0x8775ff6dadd88939
	.xword	0x0919cd10e68ff592
	.xword	0x3c9f0ff55ea49a0b
	.xword	0x2bb6c17a0abf55b1
	.xword	0xd445c9bea816a706
	.xword	0x741f0abf0f5636e6
	.xword	0x757d66fb56974c79
	.xword	0xf8735e89f3f29fb8
	.xword	0x0c78a84c6fbbf55b
	.xword	0xf4f49bacf05fc783
	.xword	0x7c0bb432df8ce723
	.xword	0x05abf3c79d7049c0
	.xword	0xf43255c45859ace9
	.xword	0xe2fb125d478d704b
	.xword	0x43946c1f6f829ee2
	.xword	0x0fa7fa97b3daacf2
	.xword	0xf3b2a96c58f6fdae
	.xword	0x62b5aac6616c2bf9
	.xword	0x04862764a5a22042
	.xword	0x4b8cb3277ed00dfd
	.xword	0x9862e1ecd03543fa
	.xword	0xf065d6b919ad91d3
	.xword	0x2b8384c6b65af509
	.xword	0x4b6d0d87fd96eaea
	.xword	0xd2e20eb2589523e8
	.xword	0xe911c64225122671
	.xword	0x1e468a07e5b86e42
	.xword	0xd25e609627021ecd
	.xword	0xb978f7e3fc089c11
	.xword	0xefaf92f7b5174360
	.xword	0x6daaf9d814fc1136
	.xword	0xb32fb9fdcf36919f
	.xword	0x2963871b7c737ed8
	.xword	0x2fa4fad54ffe876d
	.xword	0xd5ec68ec0e665d1d
	.xword	0xad3bc11231e87021
	.xword	0xdd1c78fe9b7e0008
	.xword	0x893cab6eb8637201
	.xword	0xdbb406851c49d115
	.xword	0x3d80693624f0e6af
	.xword	0x4c3a025af3764579
	.xword	0xbbdf17f405b50e8b
	.xword	0x26f176cec4a75b13
	.xword	0xe12fabe14aa3787e
	.xword	0xbf2acd4c860bfcb8
	.xword	0xeb841b648425481b
	.xword	0x62358ed0be74befe
	.xword	0x5273ec9d4d00b338
	.xword	0x21311aae7b5e0e61
	.xword	0xc89621d1fb871309
	.xword	0x7202e353db49d398
	.xword	0xcfce26441922630d
	.xword	0x08bfe3672e009cdd
	.xword	0xd345fe822f0229eb
	.xword	0xfc14f3f624342472
	.xword	0x9d7d9a2412431912
	.xword	0x6d00ec45a25d93d1
	.xword	0x10db83d037bea624
	.xword	0x2fafbea8685e2ad3
	.xword	0xa3aded247478da0c
	.xword	0x43611a97bb98501d
	.xword	0x1e2d6b8b71884d02
	.xword	0xb62152388071923a
	.xword	0xeea0cf18670263bb
	.xword	0x99bf72730fe8609e
	.xword	0x75071e3a8c8007ab
	.xword	0xe56cb174f73a820a
	.xword	0x32959a41b4623f42
	.xword	0x1894d0e5f24db6cc
	.xword	0x4a730bf2a557f72a
	.xword	0x389c7bea63bba030
	.xword	0xabcfe22ddcb1045b
	.xword	0xee6f44b57da0fa71
	.xword	0x9c76c6aaea7196d0
	.xword	0x512c6ab06dbe3d22
	.xword	0x5f144ecdd321dd5f
	.xword	0xe2ba833694921e18
	.xword	0xf490e1bc018255b6
	.xword	0x776a9f5294fbf591
	.xword	0xbdc64359f9a966f4
	.xword	0x1364d627cd857033
	.xword	0x1406cdcf749db796
	.xword	0xafed79e662b3a1da
	.xword	0x3d9a4de59cf516de
	.xword	0x04340b809ac5a90a
	.xword	0x15f201e24f14022a
	.xword	0x68f88c84db847348
	.xword	0xef15733f6416576b
	.xword	0xc2660de19c842757
	.xword	0xf09f839b8dcb0393
	.xword	0x12c664494ebf27c6
	.xword	0xc05e80a27a70bf8b
	.xword	0x421e0b3f804fc137
	.xword	0x0d9e882b8fdea087
	.xword	0x9d4e153343036f0a
	.xword	0xde6113a7eb5d4f48
	.xword	0x3548a5aec5cf2e38
	.xword	0xf2f533f79015940f
	.xword	0x8f83e6fbbb216e2b
	.xword	0xfd8e947b4db56e31
	.xword	0xa4e86e76787caf87
	.xword	0xdc30d134653d1f70
	.xword	0x27eab07083e0f301
	.xword	0xbbdcaa84872b5b11
	.xword	0x46576de1b95405c4
	.xword	0x3e752a5a59d2a4cd
	.xword	0x60b71afb7017f2c5
	.xword	0x7437e94deda7ba36
	.xword	0xd056313bbde801c6
	.align 0x40000
	.data
data_start_6:

	.xword	0x9607fea675db3821
	.xword	0xc8b02b3055755e7a
	.xword	0x830b7060e4162699
	.xword	0x4b5cf8c7e66229c4
	.xword	0x188521b6eb7b8d73
	.xword	0x479dfbf2c92a19b7
	.xword	0xc6b8e036fed9b0eb
	.xword	0xa202f1a1834a3526
	.xword	0xf2ff40094003cea3
	.xword	0xa1fba717730620f6
	.xword	0x196fa0d7a0c7ffe3
	.xword	0xcf8be82224f65b8b
	.xword	0x444ec44075857d8e
	.xword	0xa79557ec1a7fe673
	.xword	0x0a7b5ade2bd42561
	.xword	0x8116690ef355ad4f
	.xword	0xc3d360d86e3bf22d
	.xword	0xb5300e9f2fe4dec4
	.xword	0xeebb37121eccec6a
	.xword	0x4b528fe5c05960ae
	.xword	0x6bbcd2d6f1fe9195
	.xword	0x70bc97a9541a2e41
	.xword	0x251bd85e3a9ea759
	.xword	0x3ac15d1c4075f30a
	.xword	0x3ff3cf4fc1b68116
	.xword	0xb63279db475fed27
	.xword	0x1db9198a42043930
	.xword	0x191ef2e0fba6a6b6
	.xword	0x4bc349dd5b103b6a
	.xword	0xb70049d87f03d5d1
	.xword	0x494025beaab93ce3
	.xword	0xdac80b2421547680
	.xword	0xab9fc8588872aef0
	.xword	0x6a305a25d56ea61e
	.xword	0xb522cfd2c3c6eb47
	.xword	0xf3c571bbebfb9425
	.xword	0x039671b35f1fd48b
	.xword	0x3ab50b34f52a4052
	.xword	0x0c50f6257e2f0a7a
	.xword	0xa3025fc6eeb77287
	.xword	0xce47cdf670095f57
	.xword	0x2d0f50ce55e827d3
	.xword	0x7386ba2847660d55
	.xword	0xbe09185a5e451c92
	.xword	0x4a771771d3120695
	.xword	0x2d88d378459b74ee
	.xword	0x1eb201c20e62bb91
	.xword	0x696d25be419a9a11
	.xword	0x12c2f48514ba0962
	.xword	0x16e04d093c654c76
	.xword	0x7469b95b92a101f1
	.xword	0x2444c4c8b47815c7
	.xword	0xebd169d13f693be7
	.xword	0x389ed2a2c5a3288f
	.xword	0xb8f2873e0ab70e8c
	.xword	0xfb31717430dd7515
	.xword	0xa3bb76c244058e27
	.xword	0xb6c1bb65c5e2ccd7
	.xword	0x22db4c4bd394e182
	.xword	0xb6143ccf16ff0ba9
	.xword	0xbda0a238ab551764
	.xword	0x8c1a459a081329f6
	.xword	0x83658dd9d2528ae7
	.xword	0x96d759aafbc740b1
	.xword	0x2b23f7ed89c9a746
	.xword	0xfc2baec8347f7ed6
	.xword	0x7ff5ad5db550edc7
	.xword	0x773a8ea934dc37e5
	.xword	0x9ec00acb89c21d4d
	.xword	0x8c8478aa156c0983
	.xword	0xf69827d4e6ff79c7
	.xword	0x9425b8f80456a157
	.xword	0xc0b6da6bdb45fe6d
	.xword	0x4f71cefb12396989
	.xword	0x64b44791e10a8c85
	.xword	0x57744d6d2cf84655
	.xword	0xb7452a16c30d8902
	.xword	0x140202aa4630578d
	.xword	0xa0c82fc6244cfecd
	.xword	0xa1372b1ffc0e097d
	.xword	0x887cdba658d576cd
	.xword	0xfdc9e7310593e0fe
	.xword	0x38525d17c34d8e91
	.xword	0x36bff2eb3f93c0aa
	.xword	0x4da6dcc9abad68f1
	.xword	0x1bd239b21632148e
	.xword	0xcc9a6bd89c427126
	.xword	0x0d39e87800fd54a9
	.xword	0xd7afa05946415e8c
	.xword	0xebbd0ed1da47f782
	.xword	0x1518691cc89f6179
	.xword	0x5675cb02d9d21fff
	.xword	0x6689455be4e62ba6
	.xword	0xebc59a1ce48266d8
	.xword	0x9f55d797a79f8670
	.xword	0x5e39caa4b33bb142
	.xword	0x39c970a110e43c8d
	.xword	0x420b29e07234c225
	.xword	0xcd249558c1d87b83
	.xword	0x792fbac7fa4566f3
	.xword	0x9074e078df3a7b88
	.xword	0xd51189fe23fb8851
	.xword	0x570ea6c8806889bb
	.xword	0x414cfdb53a1f7975
	.xword	0x86541c7b83d1f632
	.xword	0xc2eb4b56a05ff5f0
	.xword	0x2c4e07a182f466fe
	.xword	0x3e7512db8f43a26e
	.xword	0xec2768d8f660d413
	.xword	0x4ab2bbbdfcc07a77
	.xword	0x30489d4fa309995c
	.xword	0x4f491b7dde501a0d
	.xword	0xe57876390108dd0d
	.xword	0xd5cdc77c304ec9f6
	.xword	0x17e7c6f0e2a58841
	.xword	0xf39fb83d369b1c8a
	.xword	0x7dc95527dcaf9137
	.xword	0x6cd458fda3462fe6
	.xword	0x5465cc299bd68337
	.xword	0x2441452625df01f8
	.xword	0xc084c4a33dc4f9d6
	.xword	0x3c8029a5ec830c9f
	.xword	0x44af4a5548ffc1c5
	.xword	0xdbbee9c61e95a630
	.xword	0x8273221e1b767e56
	.xword	0xb1f1a167c1b82819
	.xword	0xa54b5019d71777e4
	.xword	0x3628bd863af595bd
	.xword	0x61aaeed06b883c11
	.xword	0x8930844c43c39136
	.xword	0x1e19112bd8135424
	.xword	0x9ddc17f894a1d425
	.xword	0x4a722206bf776c5b
	.xword	0xa118f67e2cfc2aa4
	.xword	0xb0938118a7699c7e
	.xword	0x1f9ef0897ade282b
	.xword	0x1dcef567bece2993
	.xword	0x2098a9fad51a4cfc
	.xword	0x83e2b31a3edcfc13
	.xword	0x57d24bc0d0d54b38
	.xword	0xda58824ff6e87b18
	.xword	0x7768c24df843dbb4
	.xword	0x26ac779dbec3af47
	.xword	0xe24b8541d8d29346
	.xword	0x3b4f5ab49baebe5a
	.xword	0xe45702eee032286c
	.xword	0xccf67da8d7e7c5b9
	.xword	0xfd3a2dafdde3d3d3
	.xword	0xa3f36d46d6ef357c
	.xword	0x6420bfb9c467829c
	.xword	0xb6d028cabd4e908a
	.xword	0xd22f16a538c988f9
	.xword	0xe0e5b4e093f71b43
	.xword	0xcf812ded9b2b30b1
	.xword	0x3af5a6954537efad
	.xword	0xdaa7ac1d145e2113
	.xword	0x9d6f600a0bd3fb1e
	.xword	0xc61ad1536e2abdc9
	.xword	0x19f4811812cd32b6
	.xword	0xad8d4ededb72c50e
	.xword	0x0d7ab21cc2f98b51
	.xword	0x3bedd74c0150f9b2
	.xword	0xdac2c556ebb16ad6
	.xword	0x3d954b7b2e3ef4dd
	.xword	0xa9f61c6fababaabb
	.xword	0xceae277036f3e9af
	.xword	0x736ee06854d4788b
	.xword	0x955b9fd6d8d7153b
	.xword	0xcbf0c16f55609fb3
	.xword	0x3e87a5ee63a18ba3
	.xword	0xb1ba4fd08aa08083
	.xword	0x636fde9f33729bfa
	.xword	0x2fbaa3046eccb4a7
	.xword	0x3eb7571248fd04e3
	.xword	0x01af66d155d43a9f
	.xword	0x33d1e049db4e8cd5
	.xword	0x815a7efcb0ee4576
	.xword	0x88f32064c756f14c
	.xword	0x242bee0a16f1fc90
	.xword	0x0b1ba887001123cd
	.xword	0x35e8b1f80cd2ff5b
	.xword	0x77c28d971e4e4ee7
	.xword	0x73443c8b4419b24c
	.xword	0xe0cf93cebb7e19a5
	.xword	0xe975d696194e7d5b
	.xword	0xff4fd84fc0f1b083
	.xword	0xc6f0a6f3b807abd9
	.xword	0x7e0d917b68a44a0c
	.xword	0x4fd832ff5e80d403
	.xword	0xb8e2324dfa5fac59
	.xword	0xf2ddce1b8a6f96bb
	.xword	0x8de014dfd7ff45c8
	.xword	0xaa4b6d50dea23eb3
	.xword	0xdd0703e7e850dbb6
	.xword	0xc2e55915ccc50a8a
	.xword	0x4b2147bca44ff8f9
	.xword	0xa22f90aea42ff42e
	.xword	0x857bcf7e6f6bf5d8
	.xword	0xacff684716ec1b2c
	.xword	0x89526d1287589aa6
	.xword	0xbd682eee88531dd9
	.xword	0x76f7b56111649475
	.xword	0x3d80440da8d658d1
	.xword	0x5a776db0459beecd
	.xword	0x482bd42ffb36fc9a
	.xword	0xdec6c1978fd21194
	.xword	0x4bac716067971a07
	.xword	0xadb8b769943e7223
	.xword	0x90695f258495b798
	.xword	0xbe6eba7b80587a20
	.xword	0x490e514e88daa500
	.xword	0x10d24649e9f0aced
	.xword	0x9f0f7afe66aabbd8
	.xword	0xc8824c5c997b832c
	.xword	0x85b5406859c1df49
	.xword	0xf897a1222bcc83d6
	.xword	0xdd2de7c17f8d100c
	.xword	0xdb3099aa21457757
	.xword	0xb8e019bc0f086494
	.xword	0xa17f5c64f56a4468
	.xword	0xda3978ba2071bb40
	.xword	0x3082bfa2ee0820c5
	.xword	0x4e4a11fb7b7020e1
	.xword	0x560a415d857dea3a
	.xword	0x3a392f0234bd78b0
	.xword	0x1970706f6b6f9011
	.xword	0x40de3b0e32becd8a
	.xword	0x661b97c05e56c0ac
	.xword	0xd83400d9e216ded9
	.xword	0x3166d265dda0520a
	.xword	0x8dc90aee7be32f25
	.xword	0xb798ba1dae70d93f
	.xword	0x619911edf1ffef42
	.xword	0xbca0db4efeda2ea1
	.xword	0xd2e01ebf50c9f0a2
	.xword	0x97c7b1439055dd98
	.xword	0x99936e8a297b4e5a
	.xword	0x0b0f204545ac8f11
	.xword	0x3bc734632a427e75
	.xword	0x16a60b1ecd9b7e8f
	.xword	0x1bcff38611df3989
	.xword	0xb33b22098291c9bd
	.xword	0x4f798de2dccb3edb
	.xword	0x4cccfaba0c8ff9f7
	.xword	0x0f9e11569daf5bcf
	.xword	0xd6af671308a3e20b
	.xword	0xfd33667256bce1c8
	.xword	0x7b2b2d1d3a5887b8
	.xword	0x9c23dd8aeae2fad2
	.xword	0x0c2f4664f0a7c4f7
	.xword	0xa4e9e7a7aa45ad31
	.xword	0x16be024fa973ce9a
	.xword	0x9b0ca344d2b5af96
	.xword	0x9ca37d289abbf7d5
	.xword	0xcafb3bf80d9f1dc2
	.xword	0xc1d57370d3461546
	.align 0x80000
	.data
data_start_7:

	.xword	0xa2fbf9e2a8f78619
	.xword	0x6743fd03750076fa
	.xword	0x0d7e337236093342
	.xword	0x367b8f67ce42023a
	.xword	0x2e94f2f4fd514885
	.xword	0x5bbdf8694377567b
	.xword	0x1e53fd253dbffa93
	.xword	0xf5da3e581959adb1
	.xword	0xa1822b46570ee5c5
	.xword	0x0e9721ed5af8d74f
	.xword	0x1f0e9333ecf9516f
	.xword	0xb4cca8dc78b3c90d
	.xword	0xb3e548c5c3838994
	.xword	0x4dfce02e085a4063
	.xword	0xaddeb96612220471
	.xword	0x46185743f95a7032
	.xword	0x692d232f12818415
	.xword	0xbe41ff542c10b053
	.xword	0x2aeacea133fe0c63
	.xword	0x316f16cca18eab97
	.xword	0x1dc03ff3f93be5b1
	.xword	0x77118c377e044848
	.xword	0x33fee4c5250f668e
	.xword	0xb71c1c31087cee24
	.xword	0x6f0444b382099b55
	.xword	0xe66b6e8d865537ca
	.xword	0x1111604dbb219a87
	.xword	0x9ffa8155cc8edbd1
	.xword	0x43a1b225c683df52
	.xword	0x3ee80bc3faddb6b8
	.xword	0xe27cd89e73808e68
	.xword	0x524338aa06feab6d
	.xword	0x6a9203eb6fb51027
	.xword	0xc93056ed746cc458
	.xword	0x5114c8a6494298e6
	.xword	0x9a300a2547ccdb8c
	.xword	0x9174ca6c67213819
	.xword	0xbd94db2007a6ff12
	.xword	0x6b91dd66e66285ee
	.xword	0x47b971c40d94fac5
	.xword	0xd844185d9e53cf5d
	.xword	0x10194e0d6f2bdb6e
	.xword	0x24da61498bf4d6f7
	.xword	0x9f484b0188c799e3
	.xword	0x8d1aaecf365a4ff1
	.xword	0xeb6b821614af3078
	.xword	0x12cd5303c9e5e2da
	.xword	0x070e242e443ebd5b
	.xword	0xa575b5c4138d0d51
	.xword	0x1eac7c8e0ec27bef
	.xword	0xd3d3818a1102ef03
	.xword	0x4d0dcb66ce8f6f53
	.xword	0xedb524cbd50d9455
	.xword	0x194b9319eb030ad8
	.xword	0x75ba1fa9ef575729
	.xword	0x1fe53fe47984b877
	.xword	0x41dc378c884d2c75
	.xword	0x7181cdd8d40a92f7
	.xword	0x4b2e588c75096729
	.xword	0x63da77767a63aabc
	.xword	0xe6651375b3d007f9
	.xword	0x9e1a2ab95d5620fc
	.xword	0xf90be80d4fd89344
	.xword	0x743c1dea8fbc424d
	.xword	0x1101f9172136eb40
	.xword	0xd69da4b988dcf5a2
	.xword	0x3e9495e108b67c33
	.xword	0xbb932a88fb794c29
	.xword	0xbf8422c05f96e40e
	.xword	0x4c5a10807aef883e
	.xword	0xcf001cf71389f2a8
	.xword	0x1328ed2d8f3f4fb9
	.xword	0x285973c377458a5c
	.xword	0x7720de5b048fd6c0
	.xword	0x731fbddd37d38cdc
	.xword	0x9dd293c4744b88cf
	.xword	0x5b44ba0172762c80
	.xword	0xe9468c076bbac568
	.xword	0xebece38546d7fca1
	.xword	0x4329d3b7ec4ddd67
	.xword	0x3556b68c353cbea4
	.xword	0x55b5f4321f119b38
	.xword	0xbdb80c5ba54acbee
	.xword	0xbf96e1479b141d3d
	.xword	0xfbbae185b16016a7
	.xword	0x12eb053f6e78c46a
	.xword	0x79175e333cb0310c
	.xword	0xb753029db5bcfd1e
	.xword	0xae195d844ba2f284
	.xword	0x7b91c3ad1a07d380
	.xword	0xfd298d73c3be25f8
	.xword	0x90ee8480fafcc5f5
	.xword	0x190f6b9e3f5ed066
	.xword	0x0349ffcadad7a7b0
	.xword	0xc2a160ed95676a08
	.xword	0xc6f57cb337741890
	.xword	0x02fbc891ade76f92
	.xword	0x394db25f5e79ffcc
	.xword	0x8faa7f9d747074be
	.xword	0x2496e46e92858f85
	.xword	0x8b3b9083ad42da36
	.xword	0x25801aeb36c18386
	.xword	0x47950ee6cfc083fd
	.xword	0xd569325e8e190225
	.xword	0x6a0e6060e4ed66e1
	.xword	0xc86300c16a5fdc28
	.xword	0x683f28665133518b
	.xword	0x5fc64167dec8b18b
	.xword	0x917ae9e198627272
	.xword	0x17ee19920702aa8f
	.xword	0xebb1d6564927fbcb
	.xword	0xd601b798445a594d
	.xword	0xe07be9e85559487c
	.xword	0xdd99d3ec576c2185
	.xword	0x67849008ee507bd7
	.xword	0x9b044842f8c35354
	.xword	0x2facd39d1c79b8f7
	.xword	0x6ac81314c9484041
	.xword	0x2a49dd11d027593d
	.xword	0x359fe29d40277288
	.xword	0x560e1a82645e7264
	.xword	0x60bcce1a4fc9e27c
	.xword	0x07969d6a51691fad
	.xword	0xc0a4bfd9ca5268d9
	.xword	0x2059b498c4af0da6
	.xword	0xefe436b36014b7bc
	.xword	0x5fb4db1b1302679d
	.xword	0x976ccfb178f1cc14
	.xword	0x8b4ba33498c53fd0
	.xword	0xfd748d99852d314a
	.xword	0xc31cad3815232f8d
	.xword	0xd72478f22c2cc5fb
	.xword	0xa00ecd651c79f7c0
	.xword	0xbeb98f2b1282719f
	.xword	0x552061f2da03ce6c
	.xword	0xcb62876eaf48f155
	.xword	0x71ac39bbd958e1fd
	.xword	0x83f159406f176b61
	.xword	0xc7fa44b37d7a6807
	.xword	0x3bcd81646781c5a5
	.xword	0xb4a3d7f7d66b79f5
	.xword	0x520a25e88eaf4367
	.xword	0x03c14a9b4825006f
	.xword	0x1c23fd16720d5caa
	.xword	0xebdf008f2c59e009
	.xword	0x35e0b44e6af34000
	.xword	0xbea370d93265b1aa
	.xword	0xe8afafa9396b0e1d
	.xword	0x700a3b378cbb6c24
	.xword	0xe92e1a71df103ca8
	.xword	0x7ee37ea89fe46297
	.xword	0xfe81bde8c4e08ace
	.xword	0xcfb1f32da1ed5c23
	.xword	0x2bfadeb901706322
	.xword	0x1f4cd1ea4ed29322
	.xword	0x3e27fb67d6e16068
	.xword	0xab68c3b6fd67b8ec
	.xword	0x9615286f561a7513
	.xword	0xb68d1fba11ec0b8a
	.xword	0xb38ac83737f9a7bc
	.xword	0xd5e07aa8da5dfb4c
	.xword	0x265e0e2740a473ed
	.xword	0xf7e3b37758f0bdb7
	.xword	0x8de72e863edb58de
	.xword	0x1bbead3bb3a2a5e4
	.xword	0x3980421f9705c1c3
	.xword	0x40e6fe93bc2b106d
	.xword	0x666583c4b255b155
	.xword	0xbb17e29109325afc
	.xword	0xa06366533672c91e
	.xword	0xcebd4e90ffa19c23
	.xword	0x17931cf05f6224ea
	.xword	0xd71fa08e5c12e676
	.xword	0xe610351014ceeaf4
	.xword	0xebdf3ee6af446ed4
	.xword	0xa97f72d00999c4cc
	.xword	0xa68b435f2f9a9ead
	.xword	0xed4cc0f790a95116
	.xword	0x0d08a4186dcca59b
	.xword	0xd42eb5bb30c3abf5
	.xword	0x89bf2781496dc562
	.xword	0x46a2470031a31d25
	.xword	0x09348d7515f7b460
	.xword	0xf56fa31b9239b922
	.xword	0x72834cddebdd8be3
	.xword	0x3f6bd8fd48547e93
	.xword	0xd0bd29bb7d83764a
	.xword	0x5d66d0cb1646494c
	.xword	0x803d7985cbb75ce8
	.xword	0x14c334f07630a4f1
	.xword	0x1f72c4a661959036
	.xword	0x29cc4760429a4e17
	.xword	0xaab157630b580709
	.xword	0x1bc7c86e93c25a11
	.xword	0xde4fe55594f84f4e
	.xword	0xa88a9309225a935a
	.xword	0x7af0f046ee288add
	.xword	0x5bfa0fb386d033b6
	.xword	0x171b73451565e2e9
	.xword	0xe95f50f8394db3e1
	.xword	0x7d1d93b4e55a8d96
	.xword	0xc70ed874368f3596
	.xword	0x20d08d754b33f7bf
	.xword	0x5a887ea0aa4f4b68
	.xword	0x979a900e690ed791
	.xword	0xcc1c3cc039571bf7
	.xword	0x84956dccc890a84b
	.xword	0xaec30713768d16d3
	.xword	0x825921efaa45991e
	.xword	0xc3a12011de141433
	.xword	0x2b1972b2d775db81
	.xword	0x61a87637c8ef43b3
	.xword	0x05b6ece73ed782f0
	.xword	0xc52578c97b3c7e4a
	.xword	0xfbe741ad976726a5
	.xword	0x917720e9ebbf97fe
	.xword	0xc99a25d3547c1ae1
	.xword	0x5814f4f689904bf8
	.xword	0x41b36ea3dec83d07
	.xword	0xe379729e8f42e624
	.xword	0x32349a7dd96b1f49
	.xword	0x8668e5c58de229b9
	.xword	0x1d473021db9bb81c
	.xword	0xc86d08d2b5438bb5
	.xword	0x321604478216ed35
	.xword	0x04e6deea250afcac
	.xword	0x6b4d3e01e81e6914
	.xword	0x6e7706e225d608f2
	.xword	0x287a12da068d1ec7
	.xword	0x2344cf668e5fd1a8
	.xword	0xfd2a6cf071c7a33b
	.xword	0xb4a5e83c0e26191a
	.xword	0x64b8c2b1096d29dc
	.xword	0xf44d5e4ef820e867
	.xword	0x5a97a2c6105bde6f
	.xword	0xa1c549a1fd9080b1
	.xword	0x0d833e6c8d878126
	.xword	0x1f06e421b47cf6f4
	.xword	0x7006d13686bc73ca
	.xword	0xfd5af38c6f49177f
	.xword	0xe405c6374ca05594
	.xword	0xbc4d47643247d4df
	.xword	0xa3ed03e6f8930688
	.xword	0x92aec5f43788ce27
	.xword	0xab4126c70ca78dc6
	.xword	0x4e7baf0894d1d2d8
	.xword	0xde7bc80023cac671
	.xword	0x267faf4ae177da24
	.xword	0x522da88ae296c5c9
	.xword	0x5275f8deb1d8473a
	.xword	0x1ca7d5e361fcf2b8
	.xword	0xa7cec7cad4df7ae3
	.xword	0x5d470a75a546d88c
	.xword	0x239bf165f2770183
	.xword	0x14337d31833e0f11
	.xword	0xf12fff29ad77fb6e



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
