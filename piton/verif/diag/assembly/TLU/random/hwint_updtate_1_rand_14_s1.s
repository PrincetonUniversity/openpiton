// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hwint_updtate_1_rand_14_s1.s
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
   random seed:	593294677
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

	setx 0xebcd529b25270ade, %g1, %g0
	setx 0x36b2f35ddc16f408, %g1, %g1
	setx 0x0ebc65d3523407c0, %g1, %g2
	setx 0x2063c3aaeb0d408e, %g1, %g3
	setx 0x378f8f6239c9a449, %g1, %g4
	setx 0x77f2f1e7c0b062fc, %g1, %g5
	setx 0x9c095ba913d0e60c, %g1, %g6
	setx 0x60a87870f189ab7f, %g1, %g7
	setx 0xa74211f31cf5ec73, %g1, %r16
	setx 0x01ddcaea0b0422b1, %g1, %r17
	setx 0xdae7aac9aa0c4f95, %g1, %r18
	setx 0x45b911ed2e96a4dc, %g1, %r19
	setx 0x0336bc0b781995fe, %g1, %r20
	setx 0xa9b9f5a109105ab2, %g1, %r21
	setx 0xb5204aa5a848d5b8, %g1, %r22
	setx 0x0c36ab862abf2cbf, %g1, %r23
	setx 0x436254f525677dbe, %g1, %r24
	setx 0x5da4c6ad56949a7b, %g1, %r25
	setx 0x74d0ad4f86b6d17f, %g1, %r26
	setx 0x1b17716dff435274, %g1, %r27
	setx 0xe910d4b69c03f505, %g1, %r28
	setx 0x5477e0579203b667, %g1, %r29
	setx 0x699531ba90804ae6, %g1, %r30
	setx 0xe19e97b94525a5b5, %g1, %r31
	save
	setx 0x2954cb846b93b313, %g1, %r16
	setx 0xac9ba47937953d19, %g1, %r17
	setx 0x9caea01d9ecd3cb2, %g1, %r18
	setx 0xb1e6490e0912a300, %g1, %r19
	setx 0x8c8cf5a21a55edd3, %g1, %r20
	setx 0x7a0f616aa2792be4, %g1, %r21
	setx 0x918add381e316073, %g1, %r22
	setx 0x4edded0469bd46bb, %g1, %r23
	setx 0x079bda19743b0acf, %g1, %r24
	setx 0x0e500174f0ce0f51, %g1, %r25
	setx 0xec51def569e9db00, %g1, %r26
	setx 0x0428ceca43fe162f, %g1, %r27
	setx 0x3bb7e409095b3f31, %g1, %r28
	setx 0x84b7f82457d33cb8, %g1, %r29
	setx 0x4bd6a6372d12340b, %g1, %r30
	setx 0x0028a87ebaafe5aa, %g1, %r31
	save
	setx 0x86ba8632578191b6, %g1, %r16
	setx 0xef75e5ebfcb60f13, %g1, %r17
	setx 0xffeda17a3459e90a, %g1, %r18
	setx 0xbb60336bc8017191, %g1, %r19
	setx 0x6b97ff2bb8e58c70, %g1, %r20
	setx 0xbe14404114a56951, %g1, %r21
	setx 0x50e4f96ad0e40b13, %g1, %r22
	setx 0x6a1a48573579a5ab, %g1, %r23
	setx 0xb3632e150c7c12b6, %g1, %r24
	setx 0xe2dc95cc94d1dc27, %g1, %r25
	setx 0xaa9f004fef33a686, %g1, %r26
	setx 0x82d72d3e56868718, %g1, %r27
	setx 0x8f589cae2e9146d8, %g1, %r28
	setx 0xd270d6f77f744512, %g1, %r29
	setx 0x5fcb0125d3390cae, %g1, %r30
	setx 0x2c07d5c22dab7843, %g1, %r31
	save
	setx 0x275b3672de68fe83, %g1, %r16
	setx 0x9be9822d3d3a8581, %g1, %r17
	setx 0xcb6987040c4b907e, %g1, %r18
	setx 0xa4d79f51796f52f8, %g1, %r19
	setx 0xc518c07739958a45, %g1, %r20
	setx 0xc459a000c7b8d7b3, %g1, %r21
	setx 0xbd985df28230f110, %g1, %r22
	setx 0x7fd211c89f358468, %g1, %r23
	setx 0x64902af332bda4b8, %g1, %r24
	setx 0x339a2aea5c11cf59, %g1, %r25
	setx 0x692d81fd3bfd467f, %g1, %r26
	setx 0x8b22b5ea76a15128, %g1, %r27
	setx 0x3ac3b13b6c14b4dd, %g1, %r28
	setx 0x19852a71ff243c74, %g1, %r29
	setx 0xbd21fcc97c4aca12, %g1, %r30
	setx 0xe3051a1e9dcd9a2e, %g1, %r31
	save
	setx 0x485b0a5b783cb2f4, %g1, %r16
	setx 0xc5ec787c5399eb8d, %g1, %r17
	setx 0xc75456717fce44ce, %g1, %r18
	setx 0x242dcbf54cfa1115, %g1, %r19
	setx 0xa21dc3b7943f61d3, %g1, %r20
	setx 0xab512a7560651ac8, %g1, %r21
	setx 0xa14f08c6a30374aa, %g1, %r22
	setx 0x6b450ac7ec0d1fcf, %g1, %r23
	setx 0x3a3fc8fab08a5611, %g1, %r24
	setx 0x1e7fc38537d88032, %g1, %r25
	setx 0x906f2e981eb6fa28, %g1, %r26
	setx 0x5194ccfc51dc07af, %g1, %r27
	setx 0x0649f272932b97a6, %g1, %r28
	setx 0xde70bffdce925d2f, %g1, %r29
	setx 0x64e1bd49182ff1d4, %g1, %r30
	setx 0x16942562bcae2790, %g1, %r31
	save
	setx 0x2cd353d89137e7ad, %g1, %r16
	setx 0x7a0e8e81404683ce, %g1, %r17
	setx 0x8b8068703b79b8ee, %g1, %r18
	setx 0x85fe006e52bb193c, %g1, %r19
	setx 0xd92942c11072ae77, %g1, %r20
	setx 0x93e4d92d3f0490da, %g1, %r21
	setx 0xe6bd773c1fd44ae8, %g1, %r22
	setx 0xebed29fc949280a9, %g1, %r23
	setx 0xd968b0d49275831d, %g1, %r24
	setx 0x231eb6a6751ba273, %g1, %r25
	setx 0x0a4e6548bbe7b869, %g1, %r26
	setx 0x10830df26ac32c09, %g1, %r27
	setx 0x2103c7bd9d5ffcfa, %g1, %r28
	setx 0x2c9b63d5e4ffc6aa, %g1, %r29
	setx 0x091b6f1af829984e, %g1, %r30
	setx 0xa1ff7d37783b7d34, %g1, %r31
	save
	setx 0x0e6352119a28754a, %g1, %r16
	setx 0xd2bf59d37d56718e, %g1, %r17
	setx 0x02402e6937362106, %g1, %r18
	setx 0x158c69cff58c0baa, %g1, %r19
	setx 0xcd43390081139857, %g1, %r20
	setx 0x289b63251a102432, %g1, %r21
	setx 0x55287a5d3734da71, %g1, %r22
	setx 0x73d783b393778400, %g1, %r23
	setx 0x798ae71f3c2eb354, %g1, %r24
	setx 0x69a79517dee63693, %g1, %r25
	setx 0x6592ca92d0edb3fb, %g1, %r26
	setx 0x67bb8ca06afc63bb, %g1, %r27
	setx 0x0c4ecbf055332115, %g1, %r28
	setx 0x37f50fa51600e2cf, %g1, %r29
	setx 0x8a1d86f95ec6b104, %g1, %r30
	setx 0x7ef876326c7f5238, %g1, %r31
	save
	setx 0x6b7f3a977e7542bd, %g1, %r16
	setx 0x5b28554ed33a2f6b, %g1, %r17
	setx 0xdbfb022522293c1f, %g1, %r18
	setx 0xd06b533f3871a63e, %g1, %r19
	setx 0x705317e77fd62834, %g1, %r20
	setx 0x63eb74eb038af646, %g1, %r21
	setx 0xb45125e3f0913b1d, %g1, %r22
	setx 0x48b011e38402ffa9, %g1, %r23
	setx 0xcb9cb6963daf6125, %g1, %r24
	setx 0xb5edd52d0f7aeae5, %g1, %r25
	setx 0xfff69ba6f36bc649, %g1, %r26
	setx 0x34885a46125d8fa7, %g1, %r27
	setx 0x706846f55240297e, %g1, %r28
	setx 0xa73c9a9975863494, %g1, %r29
	setx 0x7d3b6b7b58ffd9b7, %g1, %r30
	setx 0x98e9872b175f6c4a, %g1, %r31
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
	setx	0x18001b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_1:
	setx	0x180127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4213a  ! 4: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb3e5a134  ! 5: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb7e4c000  ! 6: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_rd_0:
	mov	0x26, %r14
	.word 0xfedb8e60  ! 7: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_0_2:
	setx	0x1c001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_1:
	mov	0x2b, %r14
	.word 0xf2db89e0  ! 9: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_0), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_1), 16, 16)) -> intp(0, 0, 2e)
	.word 0xbbe58000  ! 14: SAVE_R	save	%r22, %r0, %r29
T0_asi_reg_rd_2:
	mov	0x31, %r14
	.word 0xf6db89e0  ! 16: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T0_asi_reg_wr_0:
	mov	0x3c3, %r14
	.word 0xf0f38e40  ! 17: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_3:
	setx	0x1f023a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_4:
	setx	0x1c021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_5:
	setx	0x1c0123, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_1:
	mov	0x22, %r14
	.word 0xfef389e0  ! 24: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T0_asi_reg_wr_2:
	mov	0x9, %r14
	.word 0xf2f38e80  ! 26: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_2), 16, 16)) -> intp(0, 0, 3d)
cpu_intr_0_6:
	setx	0x1c0328, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_3), 16, 16)) -> intp(0, 0, 17)
	.word 0xb33dc000  ! 33: SRA_R	sra 	%r23, %r0, %r25
	.word 0xb3e4215f  ! 35: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbe350000  ! 36: SUBC_R	orn 	%r20, %r0, %r31
	.word 0xb1e4e15f  ! 37: SAVE_I	save	%r19, 0x0001, %r24
cpu_intr_0_7:
	setx	0x1d001d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_8:
	setx	0x1d0125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6bd2022  ! 45: XNORcc_I	xnorcc 	%r20, 0x0022, %r27
	.word 0xbde5a102  ! 47: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_wr_3:
	mov	0x3c7, %r14
	.word 0xf2f38400  ! 49: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_0_9:
	setx	0x1c0309, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_10:
	setx	0x1c0128, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_11:
	setx	0x1f011a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_4), 16, 16)) -> intp(0, 0, 39)
iob_intr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_5), 16, 16)) -> intp(0, 0, 24)
cpu_intr_0_12:
	setx	0x1e0326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd641800  ! 63: MOVcc_R	<illegal instruction>
	.word 0xb1e58000  ! 65: SAVE_R	save	%r22, %r0, %r24
cpu_intr_0_13:
	setx	0x1e0227, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_3:
	mov	0x3c0, %r14
	.word 0xfedb8e40  ! 68: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_0_14:
	setx	0x1d0228, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_15:
	setx	0x1d012f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_6), 16, 16)) -> intp(0, 0, 3a)
cpu_intr_0_16:
	setx	0x1f021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb92c6001  ! 75: SLL_I	sll 	%r17, 0x0001, %r28
	.word 0xba440000  ! 82: ADDC_R	addc 	%r16, %r0, %r29
	.word 0xb1e58000  ! 84: SAVE_R	save	%r22, %r0, %r24
T0_asi_reg_wr_4:
	mov	0x30, %r14
	.word 0xf4f38e40  ! 92: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_wr_5:
	mov	0x3c1, %r14
	.word 0xfcf38e60  ! 93: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T0_asi_reg_rd_4:
	mov	0x3c5, %r14
	.word 0xf6db8e40  ! 94: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xba14a00d  ! 95: OR_I	or 	%r18, 0x000d, %r29
cpu_intr_0_17:
	setx	0x1e0221, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_6:
	mov	0x2, %r14
	.word 0xf0f38e80  ! 105: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9e40000  ! 110: SAVE_R	save	%r16, %r0, %r28
T0_asi_reg_rd_5:
	mov	0x19, %r14
	.word 0xfcdb8400  ! 111: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb73c1000  ! 112: SRAX_R	srax	%r16, %r0, %r27
T0_asi_reg_rd_6:
	mov	0x3c3, %r14
	.word 0xf6db8e40  ! 113: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb3e4207b  ! 115: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb1e4616a  ! 119: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_wr_7:
	mov	0x1e, %r14
	.word 0xf2f38e40  ! 120: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbbe52017  ! 121: SAVE_I	save	%r20, 0x0001, %r29
iob_intr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_7), 16, 16)) -> intp(0, 0, 1d)
cpu_intr_0_18:
	setx	0x1c0028, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_19:
	setx	0x1d023e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_20:
	setx	0x1e0205, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_8), 16, 16)) -> intp(0, 0, 39)
	.word 0xb1e48000  ! 135: SAVE_R	save	%r18, %r0, %r24
	.word 0xb1e5e021  ! 136: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb7e48000  ! 139: SAVE_R	save	%r18, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbde4c000  ! 141: SAVE_R	save	%r19, %r0, %r30
	.word 0xb9e40000  ! 143: SAVE_R	save	%r16, %r0, %r28
T0_asi_reg_wr_8:
	mov	0x3c1, %r14
	.word 0xfef38400  ! 144: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T0_asi_reg_rd_7:
	mov	0x2d, %r14
	.word 0xf6db89e0  ! 145: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb5e56093  ! 146: SAVE_I	save	%r21, 0x0001, %r26
iob_intr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_9), 16, 16)) -> intp(0, 0, 1)
cpu_intr_0_21:
	setx	0x1f0027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf350000  ! 153: SRL_R	srl 	%r20, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e4215c  ! 158: SAVE_I	save	%r16, 0x0001, %r24
iob_intr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_10), 16, 16)) -> intp(0, 0, 23)
	.word 0xb9e54000  ! 161: SAVE_R	save	%r21, %r0, %r28
	.word 0xbde4c000  ! 162: SAVE_R	save	%r19, %r0, %r30
iob_intr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_11), 16, 16)) -> intp(0, 0, c)
	.word 0xbde40000  ! 167: SAVE_R	save	%r16, %r0, %r30
cpu_intr_0_22:
	setx	0x1f023c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_9:
	mov	0x7, %r14
	.word 0xf8f38e60  ! 174: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb3e46101  ! 175: SAVE_I	save	%r17, 0x0001, %r25
cpu_intr_0_23:
	setx	0x1f001c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_24:
	setx	0x1c013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_10:
	mov	0x3c3, %r14
	.word 0xf4f384a0  ! 187: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb9e561b6  ! 188: SAVE_I	save	%r21, 0x0001, %r28
iob_intr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_12), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb1e5a123  ! 192: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb3e4611c  ! 194: SAVE_I	save	%r17, 0x0001, %r25
iob_intr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_13), 16, 16)) -> intp(0, 0, 3)
	.word 0xb5e4a0ad  ! 196: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb7e52070  ! 198: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9e520c5  ! 199: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbde5a10a  ! 200: SAVE_I	save	%r22, 0x0001, %r30
iob_intr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_14), 16, 16)) -> intp(0, 0, 19)
	.word 0xb5e40000  ! 204: SAVE_R	save	%r16, %r0, %r26
	.word 0xb7e4a02f  ! 205: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbbe5c000  ! 207: SAVE_R	save	%r23, %r0, %r29
T0_asi_reg_rd_8:
	mov	0x11, %r14
	.word 0xf2db8e40  ! 208: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_25:
	setx	0x1d003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e40000  ! 211: SAVE_R	save	%r16, %r0, %r25
iob_intr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_15), 16, 16)) -> intp(0, 0, 2)
	.word 0xbeb48000  ! 215: ORNcc_R	orncc 	%r18, %r0, %r31
	.word 0xb3e40000  ! 216: SAVE_R	save	%r16, %r0, %r25
	.word 0xa1902001  ! 217: WRPR_GL_I	wrpr	%r0, 0x0001, %-
T0_asi_reg_wr_11:
	mov	0x34, %r14
	.word 0xfaf384a0  ! 219: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb33c7001  ! 220: SRAX_I	srax	%r17, 0x0001, %r25
	.word 0xbfe54000  ! 221: SAVE_R	save	%r21, %r0, %r31
	.word 0xb9e4a142  ! 222: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbbe44000  ! 228: SAVE_R	save	%r17, %r0, %r29
cpu_intr_0_26:
	setx	0x1e022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_16), 16, 16)) -> intp(0, 0, 22)
T0_asi_reg_rd_9:
	mov	0x35, %r14
	.word 0xf2db8400  ! 234: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_0_27:
	setx	0x1d011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe40000  ! 237: SAVE_R	save	%r16, %r0, %r29
	.word 0xb5e46134  ! 238: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb93cf001  ! 239: SRAX_I	srax	%r19, 0x0001, %r28
T0_asi_reg_rd_10:
	mov	0x3c2, %r14
	.word 0xf8db8e40  ! 241: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_28:
	setx	0x1e031d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_29:
	setx	0x1d0205, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_17), 16, 16)) -> intp(0, 0, 3d)
T0_asi_reg_rd_11:
	mov	0x3c8, %r14
	.word 0xf4db84a0  ! 248: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbfe4c000  ! 251: SAVE_R	save	%r19, %r0, %r31
	.word 0xb3e5a0cc  ! 252: SAVE_I	save	%r22, 0x0001, %r25
T0_asi_reg_rd_12:
	mov	0x3c0, %r14
	.word 0xf6db89e0  ! 253: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb1e44000  ! 254: SAVE_R	save	%r17, %r0, %r24
cpu_intr_0_30:
	setx	0x1d032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8ce06e  ! 258: ANDcc_I	andcc 	%r19, 0x006e, %r30
cpu_intr_0_31:
	setx	0x1f0129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_32:
	setx	0x1e0228, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_13:
	mov	0x2d, %r14
	.word 0xf8db8400  ! 265: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbbe50000  ! 267: SAVE_R	save	%r20, %r0, %r29
	.word 0xb7e54000  ! 268: SAVE_R	save	%r21, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e46194  ! 273: SAVE_I	save	%r17, 0x0001, %r27
iob_intr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_18), 16, 16)) -> intp(0, 0, 18)
T0_asi_reg_wr_12:
	mov	0x4, %r14
	.word 0xfaf38e60  ! 278: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbde48000  ! 282: SAVE_R	save	%r18, %r0, %r30
	.word 0xb3e5a0f5  ! 284: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_33:
	setx	0x1e001d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_34:
	setx	0x1f0205, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_19), 16, 16)) -> intp(0, 0, 22)
	.word 0xb7e50000  ! 299: SAVE_R	save	%r20, %r0, %r27
iob_intr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_20), 16, 16)) -> intp(0, 0, 3a)
	.word 0xbfe42194  ! 301: SAVE_I	save	%r16, 0x0001, %r31
iob_intr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_21), 16, 16)) -> intp(0, 0, 20)
iob_intr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_22), 16, 16)) -> intp(0, 0, 2b)
	.word 0x83952097  ! 313: WRPR_TNPC_I	wrpr	%r20, 0x0097, %tnpc
	.word 0xb5e48000  ! 317: SAVE_R	save	%r18, %r0, %r26
	.word 0xbde44000  ! 322: SAVE_R	save	%r17, %r0, %r30
iob_intr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_23), 16, 16)) -> intp(0, 0, d)
iob_intr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_24), 16, 16)) -> intp(0, 0, b)
cpu_intr_0_35:
	setx	0x1d0010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4c000  ! 326: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_wr_13:
	mov	0x2d, %r14
	.word 0xfef38400  ! 327: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_25), 16, 16)) -> intp(0, 0, 24)
	.word 0xb5e5a097  ! 332: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb9e5c000  ! 333: SAVE_R	save	%r23, %r0, %r28
	.word 0xb40d219a  ! 334: AND_I	and 	%r20, 0x019a, %r26
	.word 0xb7e5a0d2  ! 335: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1e44000  ! 336: SAVE_R	save	%r17, %r0, %r24
T0_asi_reg_rd_14:
	mov	0x3c4, %r14
	.word 0xf6db8e80  ! 339: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb7e56155  ! 342: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb1e40000  ! 343: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_26), 16, 16)) -> intp(0, 0, 3d)
cpu_intr_0_36:
	setx	0x1d0225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe48000  ! 357: SAVE_R	save	%r18, %r0, %r29
	.word 0xbbe52114  ! 366: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_wr_14:
	mov	0x2c, %r14
	.word 0xf8f389e0  ! 367: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_27), 16, 16)) -> intp(0, 0, 6)
	.word 0xbe3c20db  ! 370: XNOR_I	xnor 	%r16, 0x00db, %r31
iob_intr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_28), 16, 16)) -> intp(0, 0, 28)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_37:
	setx	0x1f0003, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_29), 16, 16)) -> intp(0, 0, 37)
cpu_intr_0_38:
	setx	0x1c030e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_39:
	setx	0x1d003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e461c5  ! 381: SAVE_I	save	%r17, 0x0001, %r26
T0_asi_reg_rd_15:
	mov	0x32, %r14
	.word 0xf2db89e0  ! 384: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb3e40000  ! 387: SAVE_R	save	%r16, %r0, %r25
	.word 0xbbe5c000  ! 388: SAVE_R	save	%r23, %r0, %r29
	.word 0xb9e4e0f9  ! 389: SAVE_I	save	%r19, 0x0001, %r28
cpu_intr_0_40:
	setx	0x1d0114, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_41:
	setx	0x1c0125, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_30), 16, 16)) -> intp(0, 0, 15)
	.word 0xb3e54000  ! 398: SAVE_R	save	%r21, %r0, %r25
T0_asi_reg_rd_16:
	mov	0x2, %r14
	.word 0xf4db8e40  ! 400: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb9e5e1eb  ! 401: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb9e420ee  ! 403: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbfe5c000  ! 404: SAVE_R	save	%r23, %r0, %r31
	.word 0xbde58000  ! 406: SAVE_R	save	%r22, %r0, %r30
	.word 0xbde54000  ! 407: SAVE_R	save	%r21, %r0, %r30
	.word 0xb7e4c000  ! 410: SAVE_R	save	%r19, %r0, %r27
iob_intr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_31), 16, 16)) -> intp(0, 0, 1b)
iob_intr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_32), 16, 16)) -> intp(0, 0, 6)
cpu_intr_0_42:
	setx	0x1e000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e09d  ! 419: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbc440000  ! 423: ADDC_R	addc 	%r16, %r0, %r30
	.word 0xb3e4c000  ! 426: SAVE_R	save	%r19, %r0, %r25
iob_intr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_33), 16, 16)) -> intp(0, 0, 3e)
T0_asi_reg_wr_15:
	mov	0x30, %r14
	.word 0xf6f38400  ! 431: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T0_asi_reg_rd_17:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 432: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb5e54000  ! 433: SAVE_R	save	%r21, %r0, %r26
	.word 0xbbe420a4  ! 437: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_34), 16, 16)) -> intp(0, 0, 22)
T0_asi_reg_rd_18:
	mov	0x3c2, %r14
	.word 0xfcdb84a0  ! 442: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb3e5c000  ! 445: SAVE_R	save	%r23, %r0, %r25
	.word 0xb7e5c000  ! 447: SAVE_R	save	%r23, %r0, %r27
	.word 0xb5e50000  ! 449: SAVE_R	save	%r20, %r0, %r26
	.word 0xbde44000  ! 450: SAVE_R	save	%r17, %r0, %r30
	.word 0xb97c0400  ! 452: MOVR_R	movre	%r16, %r0, %r28
	.word 0xb3e5a034  ! 454: SAVE_I	save	%r22, 0x0001, %r25
iob_intr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_35), 16, 16)) -> intp(0, 0, 7)
T0_asi_reg_wr_16:
	mov	0x1e, %r14
	.word 0xfef38400  ! 459: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbf35d000  ! 460: SRLX_R	srlx	%r23, %r0, %r31
iob_intr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_36), 16, 16)) -> intp(0, 0, 11)
	.word 0xbde54000  ! 464: SAVE_R	save	%r21, %r0, %r30
T0_asi_reg_wr_17:
	mov	0x3c8, %r14
	.word 0xfcf38e80  ! 465: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb9e44000  ! 467: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_37), 16, 16)) -> intp(0, 0, 17)
iob_intr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_38), 16, 16)) -> intp(0, 0, 2c)
iob_intr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_39), 16, 16)) -> intp(0, 0, 16)
iob_intr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_40), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_rd_19:
	mov	0x2a, %r14
	.word 0xf8db8e80  ! 478: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T0_asi_reg_wr_18:
	mov	0x22, %r14
	.word 0xf0f384a0  ! 479: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbbe560b0  ! 482: SAVE_I	save	%r21, 0x0001, %r29
iob_intr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_41), 16, 16)) -> intp(0, 0, 2b)
iob_intr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_42), 16, 16)) -> intp(0, 0, 1f)
cpu_intr_0_43:
	setx	0x22030d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_44:
	setx	0x220015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3db001  ! 490: SRAX_I	srax	%r22, 0x0001, %r30
	.word 0xbc24214a  ! 491: SUB_I	sub 	%r16, 0x014a, %r30
iob_intr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_43), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb4444000  ! 498: ADDC_R	addc 	%r17, %r0, %r26
iob_intr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_44), 16, 16)) -> intp(0, 0, d)
T0_asi_reg_rd_20:
	mov	0x2a, %r14
	.word 0xf2db8e60  ! 502: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T0_asi_reg_wr_19:
	mov	0x17, %r14
	.word 0xf2f384a0  ! 503: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_0_45:
	setx	0x230230, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_45), 16, 16)) -> intp(0, 0, 1f)
	.word 0xbb7dc400  ! 513: MOVR_R	movre	%r23, %r0, %r29
	.word 0xb7e40000  ! 517: SAVE_R	save	%r16, %r0, %r27
cpu_intr_0_46:
	setx	0x220103, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_20:
	mov	0x3c5, %r14
	.word 0xf8f38400  ! 525: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_46), 16, 16)) -> intp(0, 0, 1a)
T0_asi_reg_wr_21:
	mov	0xb, %r14
	.word 0xfef38e40  ! 532: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_47), 16, 16)) -> intp(0, 0, 5)
	.word 0xbebc4000  ! 538: XNORcc_R	xnorcc 	%r17, %r0, %r31
	.word 0xb9e48000  ! 540: SAVE_R	save	%r18, %r0, %r28
iob_intr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_48), 16, 16)) -> intp(0, 0, 1d)
iob_intr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_49), 16, 16)) -> intp(0, 0, 15)
	.word 0xbfe561a9  ! 550: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e4c000  ! 552: SAVE_R	save	%r19, %r0, %r26
	.word 0xb9e561ad  ! 555: SAVE_I	save	%r21, 0x0001, %r28
T0_asi_reg_wr_22:
	mov	0x1d, %r14
	.word 0xf6f389e0  ! 563: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_50), 16, 16)) -> intp(0, 0, 1c)
	.word 0xa1902002  ! 568: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e5a13b  ! 573: SAVE_I	save	%r22, 0x0001, %r26
cpu_intr_0_47:
	setx	0x220132, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_21:
	mov	0x3c4, %r14
	.word 0xf8db8e60  ! 576: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb7e40000  ! 577: SAVE_R	save	%r16, %r0, %r27
	.word 0xb5e560e6  ! 579: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5e5c000  ! 580: SAVE_R	save	%r23, %r0, %r26
	.word 0xbbe50000  ! 581: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_51), 16, 16)) -> intp(0, 0, 11)
T0_asi_reg_wr_23:
	mov	0x3c6, %r14
	.word 0xf2f38e80  ! 585: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb3e4e004  ! 586: SAVE_I	save	%r19, 0x0001, %r25
cpu_intr_0_48:
	setx	0x21033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5203d  ! 590: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb9e56090  ! 592: SAVE_I	save	%r21, 0x0001, %r28
iob_intr_0_52:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_52), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb89561ed  ! 594: ORcc_I	orcc 	%r21, 0x01ed, %r28
	.word 0xbbe58000  ! 596: SAVE_R	save	%r22, %r0, %r29
	.word 0xb7e5a16b  ! 599: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb69cc000  ! 600: XORcc_R	xorcc 	%r19, %r0, %r27
T0_asi_reg_rd_22:
	mov	0x3c4, %r14
	.word 0xf2db8e40  ! 601: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T0_asi_reg_rd_23:
	mov	0x1e, %r14
	.word 0xfedb8e80  ! 602: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb1e5e0f2  ! 604: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbbe52195  ! 606: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbe94a1cf  ! 608: ORcc_I	orcc 	%r18, 0x01cf, %r31
	.word 0xb285e1e3  ! 609: ADDcc_I	addcc 	%r23, 0x01e3, %r25
iob_intr_0_53:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_53), 16, 16)) -> intp(0, 0, 20)
cpu_intr_0_49:
	setx	0x200232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e461e5  ! 612: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_rd_24:
	mov	0x3c4, %r14
	.word 0xfadb8e80  ! 614: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T0_asi_reg_rd_25:
	mov	0xc, %r14
	.word 0xf4db84a0  ! 616: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb1e4612d  ! 617: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb0bde1d9  ! 618: XNORcc_I	xnorcc 	%r23, 0x01d9, %r24
T0_asi_reg_wr_24:
	mov	0x13, %r14
	.word 0xfaf389e0  ! 626: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb61ce174  ! 627: XOR_I	xor 	%r19, 0x0174, %r27
	.word 0xbde460aa  ! 628: SAVE_I	save	%r17, 0x0001, %r30
T0_asi_reg_wr_25:
	mov	0x29, %r14
	.word 0xf6f38e40  ! 631: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb7e40000  ! 632: SAVE_R	save	%r16, %r0, %r27
T0_asi_reg_rd_26:
	mov	0x31, %r14
	.word 0xf0db8400  ! 634: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_0_50:
	setx	0x220023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e44000  ! 638: SAVE_R	save	%r17, %r0, %r27
T0_asi_reg_rd_27:
	mov	0x25, %r14
	.word 0xf0db8400  ! 642: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_0_54:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_54), 16, 16)) -> intp(0, 0, 3a)
iob_intr_0_55:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_55), 16, 16)) -> intp(0, 0, 24)
cpu_intr_0_51:
	setx	0x10307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb77d0400  ! 650: MOVR_R	movre	%r20, %r0, %r27
iob_intr_0_56:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_56), 16, 16)) -> intp(0, 0, f)
cpu_intr_0_52:
	setx	0x21013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_26:
	mov	0x3c1, %r14
	.word 0xf4f38e60  ! 657: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_0_57:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_57), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb3e4e063  ! 660: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb9e5c000  ! 663: SAVE_R	save	%r23, %r0, %r28
cpu_intr_0_53:
	setx	0x210204, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_27:
	mov	0x21, %r14
	.word 0xfaf38e80  ! 667: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_0_54:
	setx	0x220333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e56118  ! 672: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbfe40000  ! 673: SAVE_R	save	%r16, %r0, %r31
iob_intr_0_58:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_58), 16, 16)) -> intp(0, 0, 20)
cpu_intr_0_55:
	setx	0x220031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e561ba  ! 682: SAVE_I	save	%r21, 0x0001, %r26
T0_asi_reg_rd_28:
	mov	0x21, %r14
	.word 0xfcdb89e0  ! 687: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T0_asi_reg_wr_28:
	mov	0x32, %r14
	.word 0xf8f38e80  ! 690: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb7e4614e  ! 691: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbbe54000  ! 694: SAVE_R	save	%r21, %r0, %r29
	.word 0xbc1d214e  ! 696: XOR_I	xor 	%r20, 0x014e, %r30
T0_asi_reg_wr_29:
	mov	0x2c, %r14
	.word 0xf0f384a0  ! 699: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_0_59:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_59), 16, 16)) -> intp(0, 0, 33)
T0_asi_reg_wr_30:
	mov	0x3c8, %r14
	.word 0xf4f38e80  ! 704: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_0_56:
	setx	0x230022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a1d4  ! 708: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb7e560e9  ! 710: SAVE_I	save	%r21, 0x0001, %r27
cpu_intr_0_57:
	setx	0x23022f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_60:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_60), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb33cb001  ! 716: SRAX_I	srax	%r18, 0x0001, %r25
	.word 0xb7e46008  ! 717: SAVE_I	save	%r17, 0x0001, %r27
T0_asi_reg_wr_31:
	mov	0x1a, %r14
	.word 0xf4f389e0  ! 719: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T0_asi_reg_wr_32:
	mov	0x17, %r14
	.word 0xf6f38e40  ! 720: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb1e40000  ! 721: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_58:
	setx	0x210024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_59:
	setx	0x210036, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_61:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_61), 16, 16)) -> intp(0, 0, 22)
	.word 0xbc8cc000  ! 727: ANDcc_R	andcc 	%r19, %r0, %r30
	.word 0x8995a02b  ! 733: WRPR_TICK_I	wrpr	%r22, 0x002b, %tick
iob_intr_0_62:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_62), 16, 16)) -> intp(0, 0, 36)
iob_intr_0_63:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_63), 16, 16)) -> intp(0, 0, 30)
	.word 0xbde5e158  ! 743: SAVE_I	save	%r23, 0x0001, %r30
T0_asi_reg_rd_29:
	mov	0xd, %r14
	.word 0xfedb8400  ! 746: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb9e561f8  ! 748: SAVE_I	save	%r21, 0x0001, %r28
T0_asi_reg_wr_33:
	mov	0x1c, %r14
	.word 0xf0f384a0  ! 753: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_0_60:
	setx	0x22002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb641800  ! 757: MOVcc_R	<illegal instruction>
iob_intr_0_64:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_64), 16, 16)) -> intp(0, 0, 15)
T0_asi_reg_rd_30:
	mov	0x3c3, %r14
	.word 0xfadb89e0  ! 761: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb5e48000  ! 764: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_65:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_65), 16, 16)) -> intp(0, 0, 21)
	.word 0xb5e5c000  ! 768: SAVE_R	save	%r23, %r0, %r26
	.word 0xb5e4e067  ! 772: SAVE_I	save	%r19, 0x0001, %r26
cpu_intr_0_61:
	setx	0x210317, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_31:
	mov	0x12, %r14
	.word 0xfadb8e80  ! 775: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_0_62:
	setx	0x200336, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_63:
	setx	0x230304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5c000  ! 782: SAVE_R	save	%r23, %r0, %r28
T0_asi_reg_rd_32:
	mov	0x27, %r14
	.word 0xf2db84a0  ! 786: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T0_asi_reg_rd_33:
	mov	0x3c6, %r14
	.word 0xf8db84a0  ! 787: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb09c0000  ! 789: XORcc_R	xorcc 	%r16, %r0, %r24
	.word 0xbfe58000  ! 793: SAVE_R	save	%r22, %r0, %r31
	.word 0xb3643801  ! 794: MOVcc_I	<illegal instruction>
cpu_intr_0_64:
	setx	0x23000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde54000  ! 796: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_65:
	setx	0x210334, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_34:
	mov	0x1, %r14
	.word 0xf2db8e40  ! 799: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T0_asi_reg_wr_34:
	mov	0x3c3, %r14
	.word 0xf4f38e80  ! 801: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb7e54000  ! 805: SAVE_R	save	%r21, %r0, %r27
cpu_intr_0_66:
	setx	0x200231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5204c  ! 807: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_rd_35:
	mov	0x3c4, %r14
	.word 0xfadb89e0  ! 808: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T0_asi_reg_rd_36:
	mov	0x38, %r14
	.word 0xf8db8e40  ! 809: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_0_66:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_66), 16, 16)) -> intp(0, 0, 39)
cpu_intr_0_67:
	setx	0x220234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4c000  ! 815: SAVE_R	save	%r19, %r0, %r25
cpu_intr_0_68:
	setx	0x230127, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_67:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_67), 16, 16)) -> intp(0, 0, 31)
T0_asi_reg_wr_35:
	mov	0x31, %r14
	.word 0xf2f384a0  ! 822: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_0_68:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_68), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb1e40000  ! 824: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_69:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_69), 16, 16)) -> intp(0, 0, 32)
iob_intr_0_70:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_70), 16, 16)) -> intp(0, 0, 2b)
	.word 0xbfe5a144  ! 832: SAVE_I	save	%r22, 0x0001, %r31
T0_asi_reg_rd_37:
	mov	0x3c8, %r14
	.word 0xf8db8400  ! 833: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_0_69:
	setx	0x20023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e50000  ! 838: SAVE_R	save	%r20, %r0, %r24
T0_asi_reg_rd_38:
	mov	0x3c5, %r14
	.word 0xf2db8400  ! 839: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_0_71:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_71), 16, 16)) -> intp(0, 0, 3)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde4e12b  ! 847: SAVE_I	save	%r19, 0x0001, %r30
iob_intr_0_72:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_72), 16, 16)) -> intp(0, 0, 13)
	.word 0xbbe5212b  ! 850: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbfe520ad  ! 851: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbfe48000  ! 853: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_70:
	setx	0x200223, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_73:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_73), 16, 16)) -> intp(0, 0, a)
T0_asi_reg_wr_36:
	mov	0x32, %r14
	.word 0xf4f384a0  ! 859: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T0_asi_reg_rd_39:
	mov	0xf, %r14
	.word 0xf2db8e40  ! 860: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T0_asi_reg_wr_37:
	mov	0x1e, %r14
	.word 0xf2f38400  ! 861: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb4054000  ! 862: ADD_R	add 	%r21, %r0, %r26
iob_intr_0_74:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_74), 16, 16)) -> intp(0, 0, 4)
	.word 0xbfe54000  ! 868: SAVE_R	save	%r21, %r0, %r31
	.word 0xb9e44000  ! 869: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_wr_38:
	mov	0x34, %r14
	.word 0xf2f38e40  ! 871: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_0_71:
	setx	0x210131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a15b  ! 873: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb72d8000  ! 874: SLL_R	sll 	%r22, %r0, %r27
	.word 0xb3e420ea  ! 876: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_wr_39:
	mov	0x15, %r14
	.word 0xf6f384a0  ! 883: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb5e5610c  ! 886: SAVE_I	save	%r21, 0x0001, %r26
T0_asi_reg_wr_40:
	mov	0x1a, %r14
	.word 0xfef38e80  ! 887: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbbe4a14b  ! 889: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb1e46169  ! 890: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb3e420c7  ! 891: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde46058  ! 892: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb1e52055  ! 894: SAVE_I	save	%r20, 0x0001, %r24
cpu_intr_0_72:
	setx	0x230227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5a10f  ! 900: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_rd_40:
	mov	0x21, %r14
	.word 0xf4db8e40  ! 901: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_75:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_75), 16, 16)) -> intp(0, 0, 23)
	.word 0xb9e42158  ! 904: SAVE_I	save	%r16, 0x0001, %r28
cpu_intr_0_73:
	setx	0x230210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba250000  ! 906: SUB_R	sub 	%r20, %r0, %r29
	.word 0xbfe52126  ! 907: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb1e44000  ! 911: SAVE_R	save	%r17, %r0, %r24
cpu_intr_0_74:
	setx	0x260013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1358000  ! 913: SRL_R	srl 	%r22, %r0, %r24
	.word 0xbb2d4000  ! 918: SLL_R	sll 	%r21, %r0, %r29
	.word 0xbbe4e0a9  ! 921: SAVE_I	save	%r19, 0x0001, %r29
iob_intr_0_76:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_76), 16, 16)) -> intp(0, 0, 35)
	.word 0xb7e58000  ! 927: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_wr_41:
	mov	0x3c1, %r14
	.word 0xfef38400  ! 929: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb3e4e05e  ! 930: SAVE_I	save	%r19, 0x0001, %r25
cpu_intr_0_75:
	setx	0x250134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e48000  ! 942: SAVE_R	save	%r18, %r0, %r27
	.word 0xbde4a0cf  ! 945: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e560be  ! 946: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb69c0000  ! 947: XORcc_R	xorcc 	%r16, %r0, %r27
	.word 0xb9e58000  ! 949: SAVE_R	save	%r22, %r0, %r28
cpu_intr_0_76:
	setx	0x26031b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_42:
	mov	0x24, %r14
	.word 0xf4f38e40  ! 953: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_rd_41:
	mov	0x2c, %r14
	.word 0xf6db8e40  ! 954: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_rd_42:
	mov	0x5, %r14
	.word 0xf8db8e40  ! 960: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbbe4617b  ! 962: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbde40000  ! 964: SAVE_R	save	%r16, %r0, %r30
	.word 0xb6a5609b  ! 965: SUBcc_I	subcc 	%r21, 0x009b, %r27
cpu_intr_0_77:
	setx	0x240211, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_43:
	mov	0xe, %r14
	.word 0xfedb8e60  ! 968: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb7e58000  ! 971: SAVE_R	save	%r22, %r0, %r27
	.word 0xbde42034  ! 972: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbfe48000  ! 973: SAVE_R	save	%r18, %r0, %r31
	.word 0xbbe4a1f8  ! 976: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb2144000  ! 977: OR_R	or 	%r17, %r0, %r25
cpu_intr_0_78:
	setx	0x270104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 981: SAVE_R	save	%r22, %r0, %r26
	.word 0xbb643801  ! 982: MOVcc_I	<illegal instruction>
cpu_intr_0_79:
	setx	0x260315, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_77:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_77), 16, 16)) -> intp(0, 0, 20)
iob_intr_0_78:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_78), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb3e4e18b  ! 988: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_rd_44:
	mov	0x0, %r14
	.word 0xfedb8e60  ! 989: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb5e46146  ! 990: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_80:
	setx	0x27030f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_81:
	setx	0x260325, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_82:
	setx	0x270014, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_79:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_79), 16, 16)) -> intp(0, 0, b)
iob_intr_0_80:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_80), 16, 16)) -> intp(0, 0, 14)
iob_intr_0_81:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_81), 16, 16)) -> intp(0, 0, 1)
	.word 0xbde52189  ! 1003: SAVE_I	save	%r20, 0x0001, %r30
cpu_intr_0_83:
	setx	0x25030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e42000  ! 1005: SAVE_I	save	%r16, 0x0001, %r24
iob_intr_0_82:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_82), 16, 16)) -> intp(0, 0, 38)
	.word 0xb5e4a1c2  ! 1008: SAVE_I	save	%r18, 0x0001, %r26
T0_asi_reg_wr_43:
	mov	0x12, %r14
	.word 0xf4f38e40  ! 1010: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb5e5e101  ! 1012: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_wr_44:
	mov	0x28, %r14
	.word 0xfcf38e60  ! 1014: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb3e5e132  ! 1015: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb3510000  ! 1016: RDPR_TICK	<illegal instruction>
	.word 0xbde50000  ! 1018: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_wr_45:
	mov	0x21, %r14
	.word 0xfaf38e40  ! 1019: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbcadc000  ! 1020: ANDNcc_R	andncc 	%r23, %r0, %r30
	.word 0xb03ce1c8  ! 1023: XNOR_I	xnor 	%r19, 0x01c8, %r24
iob_intr_0_83:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_83), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb3e4c000  ! 1025: SAVE_R	save	%r19, %r0, %r25
cpu_intr_0_84:
	setx	0x260232, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_84:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_84), 16, 16)) -> intp(0, 0, 7)
T0_asi_reg_wr_46:
	mov	0x22, %r14
	.word 0xfef384a0  ! 1028: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb7e461d4  ! 1029: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb3e5a0c3  ! 1032: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_85:
	setx	0x250119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a062  ! 1041: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_86:
	setx	0x260127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe44000  ! 1048: SAVE_R	save	%r17, %r0, %r29
	.word 0xbb2dc000  ! 1049: SLL_R	sll 	%r23, %r0, %r29
	.word 0xbebd8000  ! 1052: XNORcc_R	xnorcc 	%r22, %r0, %r31
	.word 0xbfe50000  ! 1054: SAVE_R	save	%r20, %r0, %r31
	.word 0xbfe4e075  ! 1056: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_85:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_85), 16, 16)) -> intp(0, 0, 27)
iob_intr_0_86:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_86), 16, 16)) -> intp(0, 0, 37)
iob_intr_0_87:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_87), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_wr_47:
	mov	0x4, %r14
	.word 0xf0f38e40  ! 1063: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_87:
	setx	0x270320, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_88:
	setx	0x240039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5c000  ! 1070: SAVE_R	save	%r23, %r0, %r29
	.word 0xb97ca401  ! 1072: MOVR_I	movre	%r18, 0x1, %r28
cpu_intr_0_89:
	setx	0x24020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb23d8000  ! 1076: XNOR_R	xnor 	%r22, %r0, %r25
	.word 0xbde58000  ! 1077: SAVE_R	save	%r22, %r0, %r30
	.word 0xbbe4e0f6  ! 1078: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbfe5c000  ! 1081: SAVE_R	save	%r23, %r0, %r31
	.word 0xb5e44000  ! 1082: SAVE_R	save	%r17, %r0, %r26
	.word 0xb9e44000  ! 1088: SAVE_R	save	%r17, %r0, %r28
cpu_intr_0_90:
	setx	0x250210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e40000  ! 1099: SAVE_R	save	%r16, %r0, %r25
iob_intr_0_88:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_88), 16, 16)) -> intp(0, 0, 3e)
cpu_intr_0_91:
	setx	0x27022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e44000  ! 1107: SAVE_R	save	%r17, %r0, %r24
T0_asi_reg_rd_45:
	mov	0x1f, %r14
	.word 0xfadb8e40  ! 1110: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_92:
	setx	0x250239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe50000  ! 1117: SAVE_R	save	%r20, %r0, %r31
iob_intr_0_89:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_89), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_rd_46:
	mov	0x3c6, %r14
	.word 0xfcdb8e60  ! 1119: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T0_asi_reg_rd_47:
	mov	0x36, %r14
	.word 0xfcdb8e40  ! 1122: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_93:
	setx	0x270013, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_90:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_90), 16, 16)) -> intp(0, 0, 3b)
cpu_intr_0_94:
	setx	0x260109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde40000  ! 1132: SAVE_R	save	%r16, %r0, %r30
	.word 0xb5e4c000  ! 1133: SAVE_R	save	%r19, %r0, %r26
T0_asi_reg_wr_48:
	mov	0x14, %r14
	.word 0xf2f38e80  ! 1134: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_0_91:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_91), 16, 16)) -> intp(0, 0, 36)
	.word 0xb7e44000  ! 1136: SAVE_R	save	%r17, %r0, %r27
	.word 0xbf35e001  ! 1137: SRL_I	srl 	%r23, 0x0001, %r31
T0_asi_reg_rd_48:
	mov	0x38, %r14
	.word 0xf0db8e40  ! 1138: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_95:
	setx	0x270226, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_92:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_92), 16, 16)) -> intp(0, 0, c)
	.word 0xbbe54000  ! 1143: SAVE_R	save	%r21, %r0, %r29
cpu_intr_0_96:
	setx	0x260339, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_93:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_93), 16, 16)) -> intp(0, 0, 37)
	.word 0xbde40000  ! 1148: SAVE_R	save	%r16, %r0, %r30
T0_asi_reg_wr_49:
	mov	0x3, %r14
	.word 0xf2f38e40  ! 1150: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb3e44000  ! 1154: SAVE_R	save	%r17, %r0, %r25
iob_intr_0_94:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_94), 16, 16)) -> intp(0, 0, a)
	.word 0xbde5a16c  ! 1157: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb7e520f9  ! 1162: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbfe56002  ! 1163: SAVE_I	save	%r21, 0x0001, %r31
iob_intr_0_95:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_95), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb9e58000  ! 1165: SAVE_R	save	%r22, %r0, %r28
iob_intr_0_96:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_96), 16, 16)) -> intp(0, 0, 31)
	.word 0xb8240000  ! 1168: SUB_R	sub 	%r16, %r0, %r28
iob_intr_0_97:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_97), 16, 16)) -> intp(0, 0, 3e)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_50:
	mov	0x11, %r14
	.word 0xf0f38e80  ! 1174: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_0_98:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_98), 16, 16)) -> intp(0, 0, 2c)
T0_asi_reg_wr_51:
	mov	0x5, %r14
	.word 0xfcf38e40  ! 1178: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbde52061  ! 1181: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbfe5a0c1  ! 1183: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb1e42108  ! 1184: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e4a10d  ! 1185: SAVE_I	save	%r18, 0x0001, %r27
iob_intr_0_99:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_99), 16, 16)) -> intp(0, 0, a)
T0_asi_reg_wr_52:
	mov	0x4, %r14
	.word 0xf6f38400  ! 1187: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_0_97:
	setx	0x270119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_98:
	setx	0x260229, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_100:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_100), 16, 16)) -> intp(0, 0, 7)
	.word 0xbb354000  ! 1198: SRL_R	srl 	%r21, %r0, %r29
cpu_intr_0_99:
	setx	0x270107, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_101:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_101), 16, 16)) -> intp(0, 0, 31)
	.word 0xb6ad4000  ! 1206: ANDNcc_R	andncc 	%r21, %r0, %r27
	.word 0xb7e50000  ! 1208: SAVE_R	save	%r20, %r0, %r27
	.word 0xb3e40000  ! 1209: SAVE_R	save	%r16, %r0, %r25
	.word 0xb3e54000  ! 1210: SAVE_R	save	%r21, %r0, %r25
cpu_intr_0_100:
	setx	0x250104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe58000  ! 1216: SAVE_R	save	%r22, %r0, %r29
	.word 0xb1e52186  ! 1217: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb3e5619b  ! 1218: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbfe5c000  ! 1219: SAVE_R	save	%r23, %r0, %r31
T0_asi_reg_wr_53:
	mov	0x2e, %r14
	.word 0xf4f38e40  ! 1223: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb3e40000  ! 1227: SAVE_R	save	%r16, %r0, %r25
T0_asi_reg_wr_54:
	mov	0x3c3, %r14
	.word 0xf6f38e40  ! 1228: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_0_102:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_102), 16, 16)) -> intp(0, 0, 12)
T0_asi_reg_rd_49:
	mov	0x18, %r14
	.word 0xfedb84a0  ! 1232: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb9e46140  ! 1234: SAVE_I	save	%r17, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_50:
	mov	0x22, %r14
	.word 0xf8db8e60  ! 1238: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_0_103:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_103), 16, 16)) -> intp(0, 0, 38)
	.word 0xbde5a122  ! 1244: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb9e4e080  ! 1245: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbfe5e110  ! 1251: SAVE_I	save	%r23, 0x0001, %r31
cpu_intr_0_101:
	setx	0x270112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba952114  ! 1255: ORcc_I	orcc 	%r20, 0x0114, %r29
	.word 0xb5e4e0ef  ! 1256: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb88c0000  ! 1258: ANDcc_R	andcc 	%r16, %r0, %r28
iob_intr_0_104:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_104), 16, 16)) -> intp(0, 0, d)
T0_asi_reg_wr_55:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 1264: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb1e5e134  ! 1266: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_wr_56:
	mov	0x19, %r14
	.word 0xfcf38400  ! 1268: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbbe420dc  ! 1269: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbbe58000  ! 1271: SAVE_R	save	%r22, %r0, %r29
	.word 0xb3e50000  ! 1275: SAVE_R	save	%r20, %r0, %r25
	.word 0xb5e48000  ! 1277: SAVE_R	save	%r18, %r0, %r26
cpu_intr_0_102:
	setx	0x260316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e46061  ! 1279: SAVE_I	save	%r17, 0x0001, %r25
cpu_intr_0_103:
	setx	0x240303, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_104:
	setx	0x260114, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_105:
	setx	0x24013d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_106:
	setx	0x240318, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_105:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_105), 16, 16)) -> intp(0, 0, 4)
	.word 0xbde48000  ! 1292: SAVE_R	save	%r18, %r0, %r30
	.word 0xb5e5c000  ! 1300: SAVE_R	save	%r23, %r0, %r26
cpu_intr_0_107:
	setx	0x240024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_108:
	setx	0x27032f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_106:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_106), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_wr_57:
	mov	0x1c, %r14
	.word 0xf8f38e80  ! 1310: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb3e58000  ! 1313: SAVE_R	save	%r22, %r0, %r25
cpu_intr_0_109:
	setx	0x270025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4609d  ! 1323: SAVE_I	save	%r17, 0x0001, %r30
cpu_intr_0_110:
	setx	0x270326, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_51:
	mov	0x21, %r14
	.word 0xf2db8e40  ! 1325: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T0_asi_reg_wr_58:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 1330: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbde5207f  ! 1335: SAVE_I	save	%r20, 0x0001, %r30
iob_intr_0_107:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_107), 16, 16)) -> intp(0, 0, 2b)
T0_asi_reg_rd_52:
	mov	0x6, %r14
	.word 0xfcdb89e0  ! 1338: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb5e54000  ! 1342: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_rd_53:
	mov	0xc, %r14
	.word 0xf2db8e40  ! 1343: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_108:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_108), 16, 16)) -> intp(0, 0, 33)
T0_asi_reg_rd_54:
	mov	0x2e, %r14
	.word 0xfedb89e0  ! 1345: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_0_111:
	setx	0x24013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba1c0000  ! 1348: XOR_R	xor 	%r16, %r0, %r29
iob_intr_0_109:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_109), 16, 16)) -> intp(0, 0, a)
	.word 0xb7e5c000  ! 1350: SAVE_R	save	%r23, %r0, %r27
cpu_intr_0_112:
	setx	0x270218, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_55:
	mov	0x22, %r14
	.word 0xf4db84a0  ! 1352: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_0_110:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_110), 16, 16)) -> intp(0, 0, 0)
cpu_intr_0_113:
	setx	0x24001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe48000  ! 1356: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_rd_56:
	mov	0x3c6, %r14
	.word 0xf0db8e80  ! 1359: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb3e561c7  ! 1362: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbbe52001  ! 1363: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbde4204c  ! 1364: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbde521fa  ! 1365: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_wr_59:
	mov	0x3c8, %r14
	.word 0xf0f38e40  ! 1371: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_rd_57:
	mov	0x11, %r14
	.word 0xf0db8e60  ! 1373: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_111:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_111), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb7e5c000  ! 1378: SAVE_R	save	%r23, %r0, %r27
T0_asi_reg_rd_58:
	mov	0x6, %r14
	.word 0xfedb8400  ! 1380: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T0_asi_reg_wr_60:
	mov	0x25, %r14
	.word 0xf6f384a0  ! 1381: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T0_asi_reg_wr_61:
	mov	0x18, %r14
	.word 0xf2f38e80  ! 1382: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb5e5c000  ! 1383: SAVE_R	save	%r23, %r0, %r26
T0_asi_reg_rd_59:
	mov	0x3c1, %r14
	.word 0xf0db8400  ! 1386: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T0_asi_reg_rd_60:
	mov	0x3c3, %r14
	.word 0xf0db8e80  ! 1389: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_0_112:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_112), 16, 16)) -> intp(0, 0, 3d)
cpu_intr_0_114:
	setx	0x29013d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_115:
	setx	0x280007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a13a  ! 1396: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_rd_61:
	mov	0x30, %r14
	.word 0xf6db8e80  ! 1400: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_0_113:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_113), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_wr_62:
	mov	0x24, %r14
	.word 0xfaf38e40  ! 1402: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb1e48000  ! 1406: SAVE_R	save	%r18, %r0, %r24
	.word 0xb9e48000  ! 1408: SAVE_R	save	%r18, %r0, %r28
	.word 0xbca5a08a  ! 1409: SUBcc_I	subcc 	%r22, 0x008a, %r30
cpu_intr_0_116:
	setx	0x2a0110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6c54000  ! 1411: ADDCcc_R	addccc 	%r21, %r0, %r27
cpu_intr_0_117:
	setx	0x280121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e0f7  ! 1416: SAVE_I	save	%r23, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e5c000  ! 1418: SAVE_R	save	%r23, %r0, %r26
T0_asi_reg_rd_62:
	mov	0x3c7, %r14
	.word 0xf4db8e40  ! 1420: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T0_asi_reg_wr_63:
	mov	0x3c4, %r14
	.word 0xfcf38e40  ! 1422: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_114:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_114), 16, 16)) -> intp(0, 0, 37)
T0_asi_reg_wr_64:
	mov	0xf, %r14
	.word 0xf8f389e0  ! 1428: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb92d6001  ! 1429: SLL_I	sll 	%r21, 0x0001, %r28
	.word 0xbfe54000  ! 1431: SAVE_R	save	%r21, %r0, %r31
	.word 0xbbe42084  ! 1435: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb9e5e0bd  ! 1436: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3e560fa  ! 1437: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbe448000  ! 1439: ADDC_R	addc 	%r18, %r0, %r31
	.word 0xb3e50000  ! 1442: SAVE_R	save	%r20, %r0, %r25
cpu_intr_0_118:
	setx	0x2a0139, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_119:
	setx	0x29010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_65:
	mov	0x2, %r14
	.word 0xf0f38e80  ! 1452: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbfe50000  ! 1453: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_120:
	setx	0x2a0011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe58000  ! 1459: SAVE_R	save	%r22, %r0, %r29
	.word 0xb5e4602d  ! 1463: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x81942153  ! 1464: WRPR_TPC_I	wrpr	%r16, 0x0153, %tpc
	.word 0xb42c61c6  ! 1465: ANDN_I	andn 	%r17, 0x01c6, %r26
T0_asi_reg_rd_63:
	mov	0x34, %r14
	.word 0xf6db8e60  ! 1470: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T0_asi_reg_rd_64:
	mov	0x3c3, %r14
	.word 0xfedb89e0  ! 1472: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T0_asi_reg_wr_66:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 1473: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xba9ce1f5  ! 1474: XORcc_I	xorcc 	%r19, 0x01f5, %r29
cpu_intr_0_121:
	setx	0x29002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e561ad  ! 1481: SAVE_I	save	%r21, 0x0001, %r27
iob_intr_0_115:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_115), 16, 16)) -> intp(0, 0, 3c)
T0_asi_reg_wr_67:
	mov	0x1b, %r14
	.word 0xf8f389e0  ! 1484: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_0_122:
	setx	0x2b011d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_68:
	mov	0x33, %r14
	.word 0xfcf38e80  ! 1486: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T0_asi_reg_wr_69:
	mov	0x21, %r14
	.word 0xfcf38e60  ! 1487: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_0_123:
	setx	0x290329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe52036  ! 1489: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb7e461d2  ! 1491: SAVE_I	save	%r17, 0x0001, %r27
iob_intr_0_116:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_116), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbfe5c000  ! 1498: SAVE_R	save	%r23, %r0, %r31
T0_asi_reg_wr_70:
	mov	0x19, %r14
	.word 0xfef384a0  ! 1500: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_0_117:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_117), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_wr_71:
	mov	0x20, %r14
	.word 0xf6f384a0  ! 1502: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_0_118:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_118), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb7e5a1f0  ! 1509: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb17cc400  ! 1510: MOVR_R	movre	%r19, %r0, %r24
	.word 0xb9e5a01d  ! 1513: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_rd_65:
	mov	0x8, %r14
	.word 0xf4db84a0  ! 1514: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_0_119:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_119), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb5348000  ! 1517: SRL_R	srl 	%r18, %r0, %r26
	.word 0xb9e4e02d  ! 1518: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb1e42183  ! 1520: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbec4618b  ! 1521: ADDCcc_I	addccc 	%r17, 0x018b, %r31
	.word 0xbde52141  ! 1524: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_rd_66:
	mov	0x25, %r14
	.word 0xf0db8e60  ! 1531: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb5e5e0f8  ! 1532: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb7e42028  ! 1537: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb3e421dc  ! 1540: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbc9ca1d7  ! 1542: XORcc_I	xorcc 	%r18, 0x01d7, %r30
	.word 0xb2b54000  ! 1543: SUBCcc_R	orncc 	%r21, %r0, %r25
	.word 0xbbe40000  ! 1549: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_rd_67:
	mov	0x24, %r14
	.word 0xf0db8400  ! 1552: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb1e54000  ! 1553: SAVE_R	save	%r21, %r0, %r24
	.word 0xb7e52027  ! 1555: SAVE_I	save	%r20, 0x0001, %r27
cpu_intr_0_124:
	setx	0x2b002b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_72:
	mov	0x3c0, %r14
	.word 0xfaf38400  ! 1557: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_125:
	setx	0x2b0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0148000  ! 1561: OR_R	or 	%r18, %r0, %r24
T0_asi_reg_rd_68:
	mov	0x2, %r14
	.word 0xf8db8e80  ! 1563: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_0_126:
	setx	0x28021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_127:
	setx	0x290219, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_128:
	setx	0x2b023f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_120:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_120), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_129:
	setx	0x290100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8254000  ! 1578: SUB_R	sub 	%r21, %r0, %r28
	.word 0xb9e44000  ! 1579: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_121:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_121), 16, 16)) -> intp(0, 0, 28)
	.word 0xb7e54000  ! 1589: SAVE_R	save	%r21, %r0, %r27
	.word 0xba358000  ! 1591: SUBC_R	orn 	%r22, %r0, %r29
iob_intr_0_122:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_122), 16, 16)) -> intp(0, 0, 13)
	.word 0xbde4a16c  ! 1595: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5e5a047  ! 1596: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xa1902001  ! 1597: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xb3e54000  ! 1598: SAVE_R	save	%r21, %r0, %r25
	.word 0xbbe5a16c  ! 1600: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_123:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_123), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_rd_69:
	mov	0x18, %r14
	.word 0xfedb8e80  ! 1602: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb7e50000  ! 1608: SAVE_R	save	%r20, %r0, %r27
T0_asi_reg_rd_70:
	mov	0x28, %r14
	.word 0xf2db8e80  ! 1609: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb0344000  ! 1610: SUBC_R	orn 	%r17, %r0, %r24
T0_asi_reg_rd_71:
	mov	0x3c8, %r14
	.word 0xf4db8e40  ! 1613: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbbe46198  ! 1615: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbde5e0d3  ! 1616: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb1e50000  ! 1621: SAVE_R	save	%r20, %r0, %r24
cpu_intr_0_130:
	setx	0x29001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e064  ! 1631: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7e560f5  ! 1632: SAVE_I	save	%r21, 0x0001, %r27
iob_intr_0_124:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_124), 16, 16)) -> intp(0, 0, 22)
T0_asi_reg_wr_73:
	mov	0x3c8, %r14
	.word 0xf8f38e80  ! 1636: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb5e5c000  ! 1637: SAVE_R	save	%r23, %r0, %r26
cpu_intr_0_131:
	setx	0x280127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba0560e5  ! 1642: ADD_I	add 	%r21, 0x00e5, %r29
	.word 0xb1e50000  ! 1643: SAVE_R	save	%r20, %r0, %r24
iob_intr_0_125:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_125), 16, 16)) -> intp(0, 0, 15)
iob_intr_0_126:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_126), 16, 16)) -> intp(0, 0, 17)
	.word 0xbfe56154  ! 1649: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_rd_72:
	mov	0x3c3, %r14
	.word 0xf2db84a0  ! 1650: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb9e46100  ! 1653: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbde5a000  ! 1655: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbbe420e2  ! 1663: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbbe42178  ! 1664: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbde561c3  ! 1665: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb88d21fd  ! 1666: ANDcc_I	andcc 	%r20, 0x01fd, %r28
	.word 0xbeb4611f  ! 1667: SUBCcc_I	orncc 	%r17, 0x011f, %r31
	.word 0xb9e5e091  ! 1668: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e460b3  ! 1669: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb3e5a054  ! 1671: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_132:
	setx	0x280210, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_73:
	mov	0x3, %r14
	.word 0xf4db8e40  ! 1674: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_127:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_127), 16, 16)) -> intp(0, 0, 2d)
T0_asi_reg_rd_74:
	mov	0x17, %r14
	.word 0xf4db8e40  ! 1679: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_128:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_128), 16, 16)) -> intp(0, 0, 24)
	.word 0xb3e5c000  ! 1683: SAVE_R	save	%r23, %r0, %r25
cpu_intr_0_133:
	setx	0x2b0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e52084  ! 1685: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e5c000  ! 1688: SAVE_R	save	%r23, %r0, %r24
cpu_intr_0_134:
	setx	0x29010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4a194  ! 1697: SAVE_I	save	%r18, 0x0001, %r30
iob_intr_0_129:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_129), 16, 16)) -> intp(0, 0, 22)
T0_asi_reg_rd_75:
	mov	0x3c3, %r14
	.word 0xf4db8e60  ! 1703: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_0_130:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_130), 16, 16)) -> intp(0, 0, 24)
iob_intr_0_131:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_131), 16, 16)) -> intp(0, 0, 39)
	.word 0xb01ce07a  ! 1706: XOR_I	xor 	%r19, 0x007a, %r24
iob_intr_0_132:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_132), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_133:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_133), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb3e4a10a  ! 1710: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb9e44000  ! 1711: SAVE_R	save	%r17, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_135:
	setx	0x2a0327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e50000  ! 1718: SAVE_R	save	%r20, %r0, %r25
	.word 0xbfe4a028  ! 1720: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3e4a1ab  ! 1721: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb2044000  ! 1722: ADD_R	add 	%r17, %r0, %r25
	.word 0xb20d6066  ! 1726: AND_I	and 	%r21, 0x0066, %r25
	.word 0xb3e4e156  ! 1727: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_rd_76:
	mov	0x3c1, %r14
	.word 0xf4db8400  ! 1728: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_0_136:
	setx	0x280218, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_77:
	mov	0x32, %r14
	.word 0xf0db89e0  ! 1732: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T0_asi_reg_rd_78:
	mov	0x14, %r14
	.word 0xf0db8e40  ! 1736: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb9e40000  ! 1737: SAVE_R	save	%r16, %r0, %r28
iob_intr_0_134:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_134), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_wr_74:
	mov	0x1b, %r14
	.word 0xf4f384a0  ! 1741: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T0_asi_reg_rd_79:
	mov	0xf, %r14
	.word 0xf0db8e80  ! 1744: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb3e5610b  ! 1745: SAVE_I	save	%r21, 0x0001, %r25
iob_intr_0_135:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_135), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_137:
	setx	0x2a003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe461f9  ! 1753: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb1e4c000  ! 1754: SAVE_R	save	%r19, %r0, %r24
	.word 0xb1e4e0f8  ! 1758: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbfe48000  ! 1763: SAVE_R	save	%r18, %r0, %r31
	.word 0xb9e44000  ! 1765: SAVE_R	save	%r17, %r0, %r28
	.word 0xbfe4c000  ! 1766: SAVE_R	save	%r19, %r0, %r31
	.word 0xbfe421f1  ! 1767: SAVE_I	save	%r16, 0x0001, %r31
iob_intr_0_136:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_136), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_rd_80:
	mov	0x31, %r14
	.word 0xfedb84a0  ! 1771: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_0_138:
	setx	0x2b002f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_139:
	setx	0x280318, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_75:
	mov	0xa, %r14
	.word 0xf0f389e0  ! 1776: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T0_asi_reg_wr_76:
	mov	0x3c5, %r14
	.word 0xf2f38e40  ! 1779: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_wr_77:
	mov	0x24, %r14
	.word 0xfef38e40  ! 1783: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_0_140:
	setx	0x2b021a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_78:
	mov	0x5, %r14
	.word 0xf0f38400  ! 1787: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb5e58000  ! 1788: SAVE_R	save	%r22, %r0, %r26
	.word 0xbf34d000  ! 1789: SRLX_R	srlx	%r19, %r0, %r31
	.word 0xb5e5a02a  ! 1790: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb9e520de  ! 1792: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbde40000  ! 1793: SAVE_R	save	%r16, %r0, %r30
	.word 0xb5e5a161  ! 1794: SAVE_I	save	%r22, 0x0001, %r26
cpu_intr_0_141:
	setx	0x28001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e52129  ! 1797: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbbe54000  ! 1798: SAVE_R	save	%r21, %r0, %r29
T0_asi_reg_wr_79:
	mov	0x2b, %r14
	.word 0xf6f38e60  ! 1801: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_0_137:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_137), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb1e5a159  ! 1805: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_138:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_138), 16, 16)) -> intp(0, 0, 32)
	.word 0xbde48000  ! 1811: SAVE_R	save	%r18, %r0, %r30
	.word 0xb2ad6075  ! 1813: ANDNcc_I	andncc 	%r21, 0x0075, %r25
	.word 0xb5e460c7  ! 1814: SAVE_I	save	%r17, 0x0001, %r26
T0_asi_reg_rd_81:
	mov	0x3c8, %r14
	.word 0xf6db8e40  ! 1815: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_wr_80:
	mov	0xd, %r14
	.word 0xf8f389e0  ! 1816: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb52d1000  ! 1818: SLLX_R	sllx	%r20, %r0, %r26
iob_intr_0_139:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_139), 16, 16)) -> intp(0, 0, 29)
	.word 0xbde420f5  ! 1822: SAVE_I	save	%r16, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e52027  ! 1824: SAVE_I	save	%r20, 0x0001, %r24
T0_asi_reg_wr_81:
	mov	0x16, %r14
	.word 0xf4f38e80  ! 1826: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_0_142:
	setx	0x2f0103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e54000  ! 1831: SAVE_R	save	%r21, %r0, %r24
	.word 0xbfe4e104  ! 1839: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbbe4a1bb  ! 1843: SAVE_I	save	%r18, 0x0001, %r29
cpu_intr_0_143:
	setx	0x2e0217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde54000  ! 1848: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_144:
	setx	0x2c003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3c0000  ! 1850: SRA_R	sra 	%r16, %r0, %r29
	.word 0xbfe48000  ! 1851: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_rd_82:
	mov	0x2e, %r14
	.word 0xf0db89e0  ! 1855: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_0_145:
	setx	0x2e0007, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_146:
	setx	0x2e001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e48000  ! 1859: SAVE_R	save	%r18, %r0, %r26
	.word 0xb7e4a09d  ! 1860: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb7e58000  ! 1863: SAVE_R	save	%r22, %r0, %r27
iob_intr_0_140:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_140), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb5e56002  ! 1868: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe5202e  ! 1871: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_141:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_141), 16, 16)) -> intp(0, 0, 28)
	.word 0xbde5a09a  ! 1874: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbe0d60f4  ! 1877: AND_I	and 	%r21, 0x00f4, %r31
iob_intr_0_142:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_142), 16, 16)) -> intp(0, 0, 2d)
iob_intr_0_143:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_143), 16, 16)) -> intp(0, 0, 21)
T0_asi_reg_wr_82:
	mov	0xd, %r14
	.word 0xfaf38e80  ! 1885: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e54000  ! 1888: SAVE_R	save	%r21, %r0, %r27
cpu_intr_0_147:
	setx	0x2f000e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_83:
	mov	0x2a, %r14
	.word 0xfedb8e40  ! 1891: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb1e54000  ! 1892: SAVE_R	save	%r21, %r0, %r24
	.word 0xbe348000  ! 1893: ORN_R	orn 	%r18, %r0, %r31
T0_asi_reg_wr_83:
	mov	0x1e, %r14
	.word 0xfcf38400  ! 1895: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb9e5a0e7  ! 1896: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbbe4a14f  ! 1897: SAVE_I	save	%r18, 0x0001, %r29
T0_asi_reg_wr_84:
	mov	0x24, %r14
	.word 0xf0f38e60  ! 1898: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xbbe4e1f8  ! 1901: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb1643801  ! 1902: MOVcc_I	<illegal instruction>
iob_intr_0_144:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_144), 16, 16)) -> intp(0, 0, 1)
	.word 0xb1e5e0b1  ! 1909: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb5e5c000  ! 1910: SAVE_R	save	%r23, %r0, %r26
	.word 0xb2a54000  ! 1911: SUBcc_R	subcc 	%r21, %r0, %r25
T0_asi_reg_rd_84:
	mov	0x2d, %r14
	.word 0xfcdb8400  ! 1912: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_0_148:
	setx	0x2e0332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a166  ! 1914: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde4e019  ! 1915: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbfe5c000  ! 1916: SAVE_R	save	%r23, %r0, %r31
cpu_intr_0_149:
	setx	0x2e0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd356001  ! 1919: SRL_I	srl 	%r21, 0x0001, %r30
cpu_intr_0_150:
	setx	0x2e0338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe56086  ! 1922: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb9e40000  ! 1923: SAVE_R	save	%r16, %r0, %r28
cpu_intr_0_151:
	setx	0x2e0132, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_152:
	setx	0x2f0201, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_153:
	setx	0x2e021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a155  ! 1932: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbe844000  ! 1933: ADDcc_R	addcc 	%r17, %r0, %r31
	.word 0xbca4a06d  ! 1934: SUBcc_I	subcc 	%r18, 0x006d, %r30
cpu_intr_0_154:
	setx	0x2e001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe40000  ! 1936: SAVE_R	save	%r16, %r0, %r31
	.word 0xb9e4c000  ! 1937: SAVE_R	save	%r19, %r0, %r28
cpu_intr_0_155:
	setx	0x2f012e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_156:
	setx	0x2d033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4c000  ! 1945: SAVE_R	save	%r19, %r0, %r25
	.word 0xbfe40000  ! 1947: SAVE_R	save	%r16, %r0, %r31
cpu_intr_0_157:
	setx	0x2c0015, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_158:
	setx	0x2d001f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_159:
	setx	0x2d0224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb815214f  ! 1951: OR_I	or 	%r20, 0x014f, %r28
	.word 0xb9e4619c  ! 1952: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb4240000  ! 1955: SUB_R	sub 	%r16, %r0, %r26
	.word 0xbde44000  ! 1956: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_rd_85:
	mov	0xa, %r14
	.word 0xf8db84a0  ! 1959: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_0_145:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_145), 16, 16)) -> intp(0, 0, 33)
cpu_intr_0_160:
	setx	0x2c0000, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_146:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_146), 16, 16)) -> intp(0, 0, 31)
iob_intr_0_147:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_147), 16, 16)) -> intp(0, 0, 2d)
cpu_intr_0_161:
	setx	0x2c003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e42114  ! 1968: SAVE_I	save	%r16, 0x0001, %r26
T0_asi_reg_rd_86:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 1969: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_162:
	setx	0x2d0238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e103  ! 1978: SAVE_I	save	%r19, 0x0001, %r29
iob_intr_0_148:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_148), 16, 16)) -> intp(0, 0, 0)
	.word 0xbebd4000  ! 1981: XNORcc_R	xnorcc 	%r21, %r0, %r31
cpu_intr_0_163:
	setx	0x2c0107, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_149:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_149), 16, 16)) -> intp(0, 0, 3f)
iob_intr_0_150:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_150), 16, 16)) -> intp(0, 0, 34)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe58000  ! 1998: SAVE_R	save	%r22, %r0, %r31
cpu_intr_0_164:
	setx	0x2d021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7354000  ! 2002: SRL_R	srl 	%r21, %r0, %r27
T0_asi_reg_wr_85:
	mov	0x3c1, %r14
	.word 0xfcf389e0  ! 2003: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xbc3dc000  ! 2005: XNOR_R	xnor 	%r23, %r0, %r30
iob_intr_0_151:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_151), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_rd_87:
	mov	0x18, %r14
	.word 0xf8db8e60  ! 2007: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_0_152:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_152), 16, 16)) -> intp(0, 0, 35)
	.word 0xbfe52025  ! 2012: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbbe4c000  ! 2016: SAVE_R	save	%r19, %r0, %r29
cpu_intr_0_165:
	setx	0x2f032e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_153:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_153), 16, 16)) -> intp(0, 0, 27)
	.word 0xb7e46065  ! 2021: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbde4c000  ! 2022: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_wr_86:
	mov	0xe, %r14
	.word 0xf2f38e60  ! 2023: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb9e4a124  ! 2029: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb3e54000  ! 2030: SAVE_R	save	%r21, %r0, %r25
	.word 0xb7e5a052  ! 2031: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb3e5e00b  ! 2032: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xba0c2073  ! 2034: AND_I	and 	%r16, 0x0073, %r29
	.word 0xb5e40000  ! 2035: SAVE_R	save	%r16, %r0, %r26
	.word 0xb7e4c000  ! 2036: SAVE_R	save	%r19, %r0, %r27
	.word 0x8194a175  ! 2039: WRPR_TPC_I	wrpr	%r18, 0x0175, %tpc
	.word 0xbde5c000  ! 2040: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_166:
	setx	0x2c0014, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_167:
	setx	0x2e022f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_154:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_154), 16, 16)) -> intp(0, 0, 16)
iob_intr_0_155:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_155), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb3e52085  ! 2048: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_wr_87:
	mov	0x12, %r14
	.word 0xfaf38e60  ! 2050: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_156:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_156), 16, 16)) -> intp(0, 0, 1c)
cpu_intr_0_168:
	setx	0x2d012d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_169:
	setx	0x2c0209, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_88:
	mov	0x4, %r14
	.word 0xfadb84a0  ! 2057: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb235c000  ! 2058: ORN_R	orn 	%r23, %r0, %r25
	.word 0xb1e58000  ! 2059: SAVE_R	save	%r22, %r0, %r24
T0_asi_reg_rd_89:
	mov	0xb, %r14
	.word 0xf8db8e80  ! 2061: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb9e4a034  ! 2062: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_wr_88:
	mov	0x13, %r14
	.word 0xf4f38400  ! 2065: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T0_asi_reg_wr_89:
	mov	0x17, %r14
	.word 0xfef389e0  ! 2066: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb7e521f6  ! 2068: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb7e56033  ! 2069: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbde5615e  ! 2071: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbbe521f5  ! 2072: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbde4e076  ! 2074: SAVE_I	save	%r19, 0x0001, %r30
iob_intr_0_157:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_157), 16, 16)) -> intp(0, 0, 20)
	.word 0xbd50c000  ! 2077: RDPR_TT	<illegal instruction>
T0_asi_reg_wr_90:
	mov	0x38, %r14
	.word 0xfaf38e40  ! 2078: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_rd_90:
	mov	0x3c7, %r14
	.word 0xfcdb8e60  ! 2080: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T0_asi_reg_wr_91:
	mov	0x5, %r14
	.word 0xfcf389e0  ! 2082: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb5e5617c  ! 2084: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbde5a04d  ! 2088: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb7e50000  ! 2090: SAVE_R	save	%r20, %r0, %r27
	.word 0xbc1520f9  ! 2091: OR_I	or 	%r20, 0x00f9, %r30
	.word 0xb9e40000  ! 2093: SAVE_R	save	%r16, %r0, %r28
cpu_intr_0_170:
	setx	0x2f010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e193  ! 2097: SAVE_I	save	%r19, 0x0001, %r26
iob_intr_0_158:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_158), 16, 16)) -> intp(0, 0, 13)
	.word 0xb5e40000  ! 2113: SAVE_R	save	%r16, %r0, %r26
	.word 0xbbe44000  ! 2114: SAVE_R	save	%r17, %r0, %r29
	.word 0xb151c000  ! 2117: RDPR_TL	rdpr	%tl, %r24
	.word 0xb1e420b8  ! 2119: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb424607b  ! 2121: SUB_I	sub 	%r17, 0x007b, %r26
T0_asi_reg_rd_91:
	mov	0x25, %r14
	.word 0xf0db8e60  ! 2122: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_0_171:
	setx	0x2e031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e066  ! 2128: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_159:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_159), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb3e4c000  ! 2130: SAVE_R	save	%r19, %r0, %r25
T0_asi_reg_rd_92:
	mov	0x2d, %r14
	.word 0xfedb89e0  ! 2131: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_0_160:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_160), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbcc560a5  ! 2136: ADDCcc_I	addccc 	%r21, 0x00a5, %r30
	.word 0xb3e40000  ! 2137: SAVE_R	save	%r16, %r0, %r25
	.word 0xb5e48000  ! 2138: SAVE_R	save	%r18, %r0, %r26
T0_asi_reg_wr_92:
	mov	0x3, %r14
	.word 0xfaf38e40  ! 2139: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb9e40000  ! 2142: SAVE_R	save	%r16, %r0, %r28
	.word 0xbfe5c000  ! 2143: SAVE_R	save	%r23, %r0, %r31
	.word 0xb1e54000  ! 2147: SAVE_R	save	%r21, %r0, %r24
iob_intr_0_161:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_161), 16, 16)) -> intp(0, 0, 16)
	.word 0xbfe42169  ! 2154: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_wr_93:
	mov	0x13, %r14
	.word 0xfef38e60  ! 2155: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb1e46159  ! 2160: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1355000  ! 2162: SRLX_R	srlx	%r21, %r0, %r24
	.word 0xb1e4a134  ! 2163: SAVE_I	save	%r18, 0x0001, %r24
T0_asi_reg_rd_93:
	mov	0x17, %r14
	.word 0xf8db89e0  ! 2165: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T0_asi_reg_rd_94:
	mov	0x3c0, %r14
	.word 0xf6db8e80  ! 2166: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_0_162:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_162), 16, 16)) -> intp(0, 0, 20)
T0_asi_reg_rd_95:
	mov	0x3c1, %r14
	.word 0xfcdb84a0  ! 2169: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbde4a1b5  ! 2171: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xba340000  ! 2172: ORN_R	orn 	%r16, %r0, %r29
cpu_intr_0_172:
	setx	0x2e0316, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_96:
	mov	0x3c4, %r14
	.word 0xf0db8e60  ! 2175: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_0_173:
	setx	0x2c031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_163:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_163), 16, 16)) -> intp(0, 0, 2)
cpu_intr_0_174:
	setx	0x2d0011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e54000  ! 2183: SAVE_R	save	%r21, %r0, %r25
T0_asi_reg_wr_94:
	mov	0xf, %r14
	.word 0xf0f38e60  ! 2185: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb7e560e6  ! 2186: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_rd_97:
	mov	0x24, %r14
	.word 0xfcdb8e40  ! 2187: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_175:
	setx	0x2d000e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_176:
	setx	0x2f0033, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_98:
	mov	0x33, %r14
	.word 0xfadb8e80  ! 2197: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xbc3c4000  ! 2198: XNOR_R	xnor 	%r17, %r0, %r30
cpu_intr_0_177:
	setx	0x2d001b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_95:
	mov	0xe, %r14
	.word 0xf2f384a0  ! 2209: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbfe4a0de  ! 2210: SAVE_I	save	%r18, 0x0001, %r31
cpu_intr_0_178:
	setx	0x2d0237, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_179:
	setx	0x2e0211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb52da001  ! 2213: SLL_I	sll 	%r22, 0x0001, %r26
	.word 0xb7e4e058  ! 2214: SAVE_I	save	%r19, 0x0001, %r27
T0_asi_reg_rd_99:
	mov	0x13, %r14
	.word 0xf8db8e40  ! 2215: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbfe4c000  ! 2216: SAVE_R	save	%r19, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbd3ce001  ! 2222: SRA_I	sra 	%r19, 0x0001, %r30
	.word 0xbde5a003  ! 2223: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_rd_100:
	mov	0x12, %r14
	.word 0xf2db8e40  ! 2225: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T0_asi_reg_rd_101:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 2226: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_180:
	setx	0x2e0302, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_96:
	mov	0x20, %r14
	.word 0xf6f38e60  ! 2237: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb1e5a134  ! 2238: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde58000  ! 2241: SAVE_R	save	%r22, %r0, %r30
T0_asi_reg_wr_97:
	mov	0x32, %r14
	.word 0xf2f38e80  ! 2243: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb6358000  ! 2245: SUBC_R	orn 	%r22, %r0, %r27
T0_asi_reg_wr_98:
	mov	0x35, %r14
	.word 0xfcf38e80  ! 2247: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_0_164:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_164), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_rd_102:
	mov	0x3c5, %r14
	.word 0xf8db89e0  ! 2251: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_0_165:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_165), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbfe5c000  ! 2255: SAVE_R	save	%r23, %r0, %r31
	.word 0xb60da060  ! 2258: AND_I	and 	%r22, 0x0060, %r27
T0_asi_reg_rd_103:
	mov	0x24, %r14
	.word 0xfadb8400  ! 2260: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbfe4e00c  ! 2261: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbbe54000  ! 2262: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_166:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_166), 16, 16)) -> intp(0, 0, 20)
	.word 0xbde40000  ! 2265: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_167:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_167), 16, 16)) -> intp(0, 0, 28)
T0_asi_reg_wr_99:
	mov	0x17, %r14
	.word 0xfef38e40  ! 2270: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbde5c000  ! 2272: SAVE_R	save	%r23, %r0, %r30
T0_asi_reg_rd_104:
	mov	0x3c0, %r14
	.word 0xfadb8e80  ! 2273: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb9e56182  ! 2275: SAVE_I	save	%r21, 0x0001, %r28
iob_intr_0_168:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_168), 16, 16)) -> intp(0, 0, 25)
	.word 0xba45e05e  ! 2280: ADDC_I	addc 	%r23, 0x005e, %r29
	.word 0xbde4e16b  ! 2282: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_wr_100:
	mov	0x3c7, %r14
	.word 0xfcf38e40  ! 2283: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb1e5a096  ! 2286: SAVE_I	save	%r22, 0x0001, %r24
cpu_intr_0_181:
	setx	0x320022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaac614c  ! 2289: ANDNcc_I	andncc 	%r17, 0x014c, %r29
T0_asi_reg_wr_101:
	mov	0x3c8, %r14
	.word 0xfaf38400  ! 2290: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_0_169:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_169), 16, 16)) -> intp(0, 0, b)
	.word 0xb9e421e8  ! 2296: SAVE_I	save	%r16, 0x0001, %r28
iob_intr_0_170:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_170), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_rd_105:
	mov	0x3c5, %r14
	.word 0xf4db89e0  ! 2300: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_0_182:
	setx	0x33032b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_171:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_171), 16, 16)) -> intp(0, 0, 5)
	.word 0xb0b40000  ! 2308: ORNcc_R	orncc 	%r16, %r0, %r24
cpu_intr_0_183:
	setx	0x320115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4208c  ! 2311: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbfe5616d  ! 2314: SAVE_I	save	%r21, 0x0001, %r31
iob_intr_0_172:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_172), 16, 16)) -> intp(0, 0, f)
iob_intr_0_173:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_173), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb5e5e116  ! 2317: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb7e40000  ! 2321: SAVE_R	save	%r16, %r0, %r27
	.word 0xb9e4e126  ! 2323: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb60d6023  ! 2324: AND_I	and 	%r21, 0x0023, %r27
cpu_intr_0_184:
	setx	0x33010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a13f  ! 2329: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb1e560fe  ! 2331: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb7e4e198  ! 2337: SAVE_I	save	%r19, 0x0001, %r27
cpu_intr_0_185:
	setx	0x32032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe56164  ! 2340: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb0c5a09b  ! 2341: ADDCcc_I	addccc 	%r22, 0x009b, %r24
cpu_intr_0_186:
	setx	0x31020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e01e  ! 2345: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb0140000  ! 2347: OR_R	or 	%r16, %r0, %r24
	.word 0xb9e4a099  ! 2348: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb9e4a180  ! 2353: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_rd_106:
	mov	0x29, %r14
	.word 0xfcdb8e40  ! 2355: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_wr_102:
	mov	0x23, %r14
	.word 0xf0f38e60  ! 2358: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_0_187:
	setx	0x330024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_188:
	setx	0x320126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde461e8  ! 2366: SAVE_I	save	%r17, 0x0001, %r30
cpu_intr_0_189:
	setx	0x320019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e48000  ! 2370: SAVE_R	save	%r18, %r0, %r28
	.word 0xa1902001  ! 2375: WRPR_GL_I	wrpr	%r0, 0x0001, %-
iob_intr_0_174:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_174), 16, 16)) -> intp(0, 0, e)
	.word 0xbde460c8  ! 2378: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7e48000  ! 2379: SAVE_R	save	%r18, %r0, %r27
	.word 0xb1e5e1fb  ! 2380: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_175:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_175), 16, 16)) -> intp(0, 0, 31)
	.word 0xb1e54000  ! 2385: SAVE_R	save	%r21, %r0, %r24
cpu_intr_0_190:
	setx	0x31012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e46192  ! 2388: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb1e50000  ! 2389: SAVE_R	save	%r20, %r0, %r24
	.word 0xb88c0000  ! 2391: ANDcc_R	andcc 	%r16, %r0, %r28
T0_asi_reg_wr_103:
	mov	0x24, %r14
	.word 0xf8f384a0  ! 2392: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbde4a15d  ! 2395: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde44000  ! 2396: SAVE_R	save	%r17, %r0, %r30
cpu_intr_0_191:
	setx	0x300025, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_104:
	mov	0x15, %r14
	.word 0xf8f38e80  ! 2400: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T0_asi_reg_wr_105:
	mov	0x17, %r14
	.word 0xfcf38e40  ! 2401: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb7e56072  ! 2403: SAVE_I	save	%r21, 0x0001, %r27
cpu_intr_0_192:
	setx	0x320013, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_106:
	mov	0x28, %r14
	.word 0xf6f38400  ! 2412: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T0_asi_reg_wr_107:
	mov	0x0, %r14
	.word 0xfaf38e40  ! 2413: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_0_193:
	setx	0x33002e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_108:
	mov	0x38, %r14
	.word 0xf8f38e60  ! 2416: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_0_194:
	setx	0x320214, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_107:
	mov	0x27, %r14
	.word 0xf8db8e80  ! 2418: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T0_asi_reg_rd_108:
	mov	0x3c1, %r14
	.word 0xfcdb8e60  ! 2419: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbde5a185  ! 2421: SAVE_I	save	%r22, 0x0001, %r30
iob_intr_0_176:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_176), 16, 16)) -> intp(0, 0, f)
	.word 0xbde4a174  ! 2424: SAVE_I	save	%r18, 0x0001, %r30
cpu_intr_0_195:
	setx	0x300224, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_109:
	mov	0x3c1, %r14
	.word 0xf8db8e60  ! 2429: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb7e40000  ! 2430: SAVE_R	save	%r16, %r0, %r27
iob_intr_0_177:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_177), 16, 16)) -> intp(0, 0, d)
	.word 0xbde4a0ab  ! 2437: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_wr_109:
	mov	0x3c3, %r14
	.word 0xfef384a0  ! 2438: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_0_178:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_178), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb9e5c000  ! 2445: SAVE_R	save	%r23, %r0, %r28
	.word 0xb5e5e110  ! 2446: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb9e560e5  ! 2448: SAVE_I	save	%r21, 0x0001, %r28
T0_asi_reg_wr_110:
	mov	0x16, %r14
	.word 0xf8f38e40  ! 2456: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_196:
	setx	0x32032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 2458: SAVE_R	save	%r16, %r0, %r24
	.word 0xbc358000  ! 2459: ORN_R	orn 	%r22, %r0, %r30
	.word 0xbbe4618f  ! 2460: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe48000  ! 2461: SAVE_R	save	%r18, %r0, %r31
iob_intr_0_179:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_179), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_wr_111:
	mov	0x3c1, %r14
	.word 0xf8f389e0  ! 2466: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_0_197:
	setx	0x330225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe561f1  ! 2468: SAVE_I	save	%r21, 0x0001, %r29
iob_intr_0_180:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_180), 16, 16)) -> intp(0, 0, 30)
	.word 0xbde48000  ! 2470: SAVE_R	save	%r18, %r0, %r30
	.word 0xb7e40000  ! 2471: SAVE_R	save	%r16, %r0, %r27
	.word 0xbfe5a09c  ! 2472: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_181:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_181), 16, 16)) -> intp(0, 0, 26)
	.word 0xb3e58000  ! 2479: SAVE_R	save	%r22, %r0, %r25
iob_intr_0_182:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_182), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb9e58000  ! 2481: SAVE_R	save	%r22, %r0, %r28
cpu_intr_0_198:
	setx	0x310126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 2483: SAVE_R	save	%r16, %r0, %r24
T0_asi_reg_rd_110:
	mov	0x1e, %r14
	.word 0xf0db89e0  ! 2484: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_0_199:
	setx	0x310021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e08d  ! 2487: SAVE_I	save	%r19, 0x0001, %r24
iob_intr_0_183:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_183), 16, 16)) -> intp(0, 0, 8)
	.word 0xb9e420ed  ! 2495: SAVE_I	save	%r16, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9e58000  ! 2497: SAVE_R	save	%r22, %r0, %r28
	.word 0xb3e4a15e  ! 2498: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7e421df  ! 2500: SAVE_I	save	%r16, 0x0001, %r27
iob_intr_0_184:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_184), 16, 16)) -> intp(0, 0, e)
iob_intr_0_185:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_185), 16, 16)) -> intp(0, 0, b)
cpu_intr_0_200:
	setx	0x330322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_201:
	setx	0x33032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e08f  ! 2513: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb2950000  ! 2514: ORcc_R	orcc 	%r20, %r0, %r25
iob_intr_0_186:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_186), 16, 16)) -> intp(0, 0, 36)
	.word 0xb5e46024  ! 2520: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7e5c000  ! 2524: SAVE_R	save	%r23, %r0, %r27
	.word 0xbbe460da  ! 2528: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe48000  ! 2531: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_202:
	setx	0x31001d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_187:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_187), 16, 16)) -> intp(0, 0, 25)
	.word 0xbd7c8400  ! 2540: MOVR_R	movre	%r18, %r0, %r30
T0_asi_reg_wr_112:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 2545: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_wr_113:
	mov	0x21, %r14
	.word 0xf8f389e0  ! 2546: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_0_203:
	setx	0x330035, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_114:
	mov	0x8, %r14
	.word 0xfcf38e60  ! 2548: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T0_asi_reg_wr_115:
	mov	0x31, %r14
	.word 0xf6f384a0  ! 2552: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T0_asi_reg_wr_116:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 2553: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xba14e1cc  ! 2555: OR_I	or 	%r19, 0x01cc, %r29
	.word 0xb5e5c000  ! 2558: SAVE_R	save	%r23, %r0, %r26
	.word 0xbbe520f9  ! 2562: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb9e5609f  ! 2563: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb3e4c000  ! 2564: SAVE_R	save	%r19, %r0, %r25
	.word 0xbd34a001  ! 2569: SRL_I	srl 	%r18, 0x0001, %r30
	.word 0xbfe4c000  ! 2570: SAVE_R	save	%r19, %r0, %r31
iob_intr_0_188:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_188), 16, 16)) -> intp(0, 0, 1a)
iob_intr_0_189:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_189), 16, 16)) -> intp(0, 0, 13)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e58000  ! 2577: SAVE_R	save	%r22, %r0, %r28
cpu_intr_0_204:
	setx	0x300214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4612a  ! 2585: SAVE_I	save	%r17, 0x0001, %r27
iob_intr_0_190:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_190), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbfe40000  ! 2589: SAVE_R	save	%r16, %r0, %r31
	.word 0xbfe5c000  ! 2590: SAVE_R	save	%r23, %r0, %r31
	.word 0xb7e40000  ! 2592: SAVE_R	save	%r16, %r0, %r27
T0_asi_reg_rd_111:
	mov	0x2c, %r14
	.word 0xfadb89e0  ! 2594: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T0_asi_reg_wr_117:
	mov	0x28, %r14
	.word 0xf2f384a0  ! 2595: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_0_191:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_191), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbbe54000  ! 2602: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_192:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_192), 16, 16)) -> intp(0, 0, 8)
	.word 0xb5e4a0ae  ! 2605: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbe9d4000  ! 2606: XORcc_R	xorcc 	%r21, %r0, %r31
T0_asi_reg_rd_112:
	mov	0x1e, %r14
	.word 0xfcdb8e80  ! 2608: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T0_asi_reg_rd_113:
	mov	0x7, %r14
	.word 0xf4db8e40  ! 2609: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb0b40000  ! 2610: SUBCcc_R	orncc 	%r16, %r0, %r24
	.word 0xb3e50000  ! 2614: SAVE_R	save	%r20, %r0, %r25
cpu_intr_0_205:
	setx	0x30023c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_206:
	setx	0x300336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x839560dc  ! 2619: WRPR_TNPC_I	wrpr	%r21, 0x00dc, %tnpc
	.word 0xba8de080  ! 2623: ANDcc_I	andcc 	%r23, 0x0080, %r29
	.word 0xb6348000  ! 2627: ORN_R	orn 	%r18, %r0, %r27
iob_intr_0_193:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_193), 16, 16)) -> intp(0, 0, 7)
iob_intr_0_194:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_194), 16, 16)) -> intp(0, 0, 22)
T0_asi_reg_rd_114:
	mov	0x2c, %r14
	.word 0xf2db8e40  ! 2633: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbebcc000  ! 2634: XNORcc_R	xnorcc 	%r19, %r0, %r31
T0_asi_reg_wr_118:
	mov	0xa, %r14
	.word 0xf4f38e80  ! 2635: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbfe461e9  ! 2636: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbde40000  ! 2637: SAVE_R	save	%r16, %r0, %r30
	.word 0xbe8d218f  ! 2640: ANDcc_I	andcc 	%r20, 0x018f, %r31
	.word 0xb3e48000  ! 2646: SAVE_R	save	%r18, %r0, %r25
	.word 0xbb346001  ! 2648: SRL_I	srl 	%r17, 0x0001, %r29
	.word 0xb1e4a0c3  ! 2649: SAVE_I	save	%r18, 0x0001, %r24
iob_intr_0_195:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_195), 16, 16)) -> intp(0, 0, 4)
	.word 0xb3e54000  ! 2656: SAVE_R	save	%r21, %r0, %r25
T0_asi_reg_wr_119:
	mov	0x3c3, %r14
	.word 0xfef38e60  ! 2657: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb7e4e085  ! 2658: SAVE_I	save	%r19, 0x0001, %r27
iob_intr_0_196:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_196), 16, 16)) -> intp(0, 0, d)
iob_intr_0_197:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_197), 16, 16)) -> intp(0, 0, 21)
	.word 0xbbe50000  ! 2661: SAVE_R	save	%r20, %r0, %r29
	.word 0xbde420d0  ! 2662: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_wr_120:
	mov	0x1e, %r14
	.word 0xf4f38400  ! 2663: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbebd6168  ! 2665: XNORcc_I	xnorcc 	%r21, 0x0168, %r31
T0_asi_reg_wr_121:
	mov	0x24, %r14
	.word 0xfcf38e80  ! 2667: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_0_198:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_198), 16, 16)) -> intp(0, 0, 23)
	.word 0xbfe50000  ! 2671: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_rd_115:
	mov	0x0, %r14
	.word 0xf8db89e0  ! 2672: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb3e46007  ! 2676: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e4c000  ! 2677: SAVE_R	save	%r19, %r0, %r26
iob_intr_0_199:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_199), 16, 16)) -> intp(0, 0, 3e)
iob_intr_0_200:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_200), 16, 16)) -> intp(0, 0, 18)
	.word 0xbfe5c000  ! 2680: SAVE_R	save	%r23, %r0, %r31
	.word 0xb22d60da  ! 2684: ANDN_I	andn 	%r21, 0x00da, %r25
	.word 0xbde50000  ! 2686: SAVE_R	save	%r20, %r0, %r30
	.word 0xbbe5607c  ! 2687: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e44000  ! 2688: SAVE_R	save	%r17, %r0, %r27
	.word 0xb1e4c000  ! 2690: SAVE_R	save	%r19, %r0, %r24
cpu_intr_0_207:
	setx	0x320216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe58000  ! 2697: SAVE_R	save	%r22, %r0, %r31
	.word 0xb3e5a0d8  ! 2698: SAVE_I	save	%r22, 0x0001, %r25
iob_intr_0_201:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_201), 16, 16)) -> intp(0, 0, 36)
cpu_intr_0_208:
	setx	0x320009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e58000  ! 2701: SAVE_R	save	%r22, %r0, %r24
T0_asi_reg_wr_122:
	mov	0x3c0, %r14
	.word 0xf8f389e0  ! 2702: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb7e44000  ! 2703: SAVE_R	save	%r17, %r0, %r27
iob_intr_0_202:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_202), 16, 16)) -> intp(0, 0, 25)
	.word 0xb9e4a03f  ! 2709: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbb355000  ! 2710: SRLX_R	srlx	%r21, %r0, %r29
	.word 0xb3e50000  ! 2711: SAVE_R	save	%r20, %r0, %r25
	.word 0xb3e4e08c  ! 2712: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1e5615e  ! 2713: SAVE_I	save	%r21, 0x0001, %r24
iob_intr_0_203:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_203), 16, 16)) -> intp(0, 0, 32)
	.word 0xb205e158  ! 2720: ADD_I	add 	%r23, 0x0158, %r25
T0_asi_reg_wr_123:
	mov	0x3c1, %r14
	.word 0xf4f389e0  ! 2723: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbde4e1ad  ! 2724: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb9e5e0a2  ! 2725: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbbe421bb  ! 2726: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbe0cc000  ! 2727: AND_R	and 	%r19, %r0, %r31
cpu_intr_0_209:
	setx	0x320314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba2d2051  ! 2729: ANDN_I	andn 	%r20, 0x0051, %r29
	.word 0xbabdc000  ! 2732: XNORcc_R	xnorcc 	%r23, %r0, %r29
T0_asi_reg_wr_124:
	mov	0x0, %r14
	.word 0xfaf384a0  ! 2733: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T0_asi_reg_rd_116:
	mov	0x25, %r14
	.word 0xf0db84a0  ! 2734: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_0_210:
	setx	0x360034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a03e  ! 2739: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb9e42151  ! 2740: SAVE_I	save	%r16, 0x0001, %r28
cpu_intr_0_211:
	setx	0x36031c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_117:
	mov	0x4, %r14
	.word 0xfadb8e40  ! 2743: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb1e4616c  ! 2744: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb3e421ca  ! 2745: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5e5a0b1  ! 2747: SAVE_I	save	%r22, 0x0001, %r26
iob_intr_0_204:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_204), 16, 16)) -> intp(0, 0, c)
	.word 0xb7e54000  ! 2750: SAVE_R	save	%r21, %r0, %r27
	.word 0xb1e5a098  ! 2752: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb1e4609e  ! 2758: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_rd_118:
	mov	0x26, %r14
	.word 0xfadb8e80  ! 2759: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xba958000  ! 2760: ORcc_R	orcc 	%r22, %r0, %r29
	.word 0xbb518000  ! 2765: RDPR_PSTATE	<illegal instruction>
T0_asi_reg_wr_125:
	mov	0x26, %r14
	.word 0xf2f38e80  ! 2767: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_0_212:
	setx	0x360211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde44000  ! 2770: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_wr_126:
	mov	0x3c7, %r14
	.word 0xfcf38e80  ! 2771: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_0_205:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_205), 16, 16)) -> intp(0, 0, 32)
T0_asi_reg_rd_119:
	mov	0x3c0, %r14
	.word 0xf4db84a0  ! 2774: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_0_206:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_206), 16, 16)) -> intp(0, 0, 8)
cpu_intr_0_213:
	setx	0x340138, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_207:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_207), 16, 16)) -> intp(0, 0, 30)
	.word 0xb7e4a1ee  ! 2785: SAVE_I	save	%r18, 0x0001, %r27
cpu_intr_0_214:
	setx	0x37003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb635e11c  ! 2790: SUBC_I	orn 	%r23, 0x011c, %r27
	.word 0xb3e5c000  ! 2792: SAVE_R	save	%r23, %r0, %r25
cpu_intr_0_215:
	setx	0x360015, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_127:
	mov	0xc, %r14
	.word 0xf0f38e60  ! 2796: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xbde56022  ! 2797: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e54000  ! 2798: SAVE_R	save	%r21, %r0, %r27
	.word 0xbbe5e042  ! 2799: SAVE_I	save	%r23, 0x0001, %r29
cpu_intr_0_216:
	setx	0x350218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba05a09e  ! 2807: ADD_I	add 	%r22, 0x009e, %r29
cpu_intr_0_217:
	setx	0x36033b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_208:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_208), 16, 16)) -> intp(0, 0, 26)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e421a5  ! 2815: SAVE_I	save	%r16, 0x0001, %r28
iob_intr_0_209:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_209), 16, 16)) -> intp(0, 0, d)
	.word 0xb03421c0  ! 2820: SUBC_I	orn 	%r16, 0x01c0, %r24
iob_intr_0_210:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_210), 16, 16)) -> intp(0, 0, 37)
	.word 0xbbe40000  ! 2823: SAVE_R	save	%r16, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_128:
	mov	0x3c0, %r14
	.word 0xfaf38e40  ! 2827: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_211:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_211), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbab5a128  ! 2831: SUBCcc_I	orncc 	%r22, 0x0128, %r29
cpu_intr_0_218:
	setx	0x37020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e40000  ! 2839: SAVE_R	save	%r16, %r0, %r25
T0_asi_reg_rd_120:
	mov	0x3c5, %r14
	.word 0xfcdb8e40  ! 2840: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_0_212:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_212), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbde5c000  ! 2848: SAVE_R	save	%r23, %r0, %r30
	.word 0xb9e58000  ! 2850: SAVE_R	save	%r22, %r0, %r28
T0_asi_reg_rd_121:
	mov	0x3c3, %r14
	.word 0xf8db8e60  ! 2851: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb5e4e193  ! 2853: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_wr_129:
	mov	0x33, %r14
	.word 0xfaf384a0  ! 2856: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbfe521af  ! 2857: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_213:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_213), 16, 16)) -> intp(0, 0, 28)
iob_intr_0_214:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_214), 16, 16)) -> intp(0, 0, 2b)
	.word 0x859420bd  ! 2863: WRPR_TSTATE_I	wrpr	%r16, 0x00bd, %tstate
	.word 0xb1e4e1b5  ! 2864: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_rd_122:
	mov	0x6, %r14
	.word 0xf6db89e0  ! 2865: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xbbe5c000  ! 2866: SAVE_R	save	%r23, %r0, %r29
	.word 0xba3460b9  ! 2867: ORN_I	orn 	%r17, 0x00b9, %r29
cpu_intr_0_219:
	setx	0x360020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb643801  ! 2869: MOVcc_I	<illegal instruction>
	.word 0xb9e52150  ! 2871: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb2ade05b  ! 2873: ANDNcc_I	andncc 	%r23, 0x005b, %r25
	.word 0xbbe5210f  ! 2875: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_rd_123:
	mov	0x3c8, %r14
	.word 0xfadb8e40  ! 2878: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb5e44000  ! 2882: SAVE_R	save	%r17, %r0, %r26
	.word 0xbfe4a0b8  ! 2883: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbde4a1b9  ! 2886: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_wr_130:
	mov	0x3c6, %r14
	.word 0xf0f389e0  ! 2887: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_0_220:
	setx	0x36033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e40000  ! 2892: SAVE_R	save	%r16, %r0, %r26
iob_intr_0_215:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_215), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_wr_131:
	mov	0x2f, %r14
	.word 0xf4f38e80  ! 2896: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb7e54000  ! 2897: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_wr_132:
	mov	0x1d, %r14
	.word 0xf4f384a0  ! 2899: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb5e5c000  ! 2900: SAVE_R	save	%r23, %r0, %r26
	.word 0xbbe58000  ! 2901: SAVE_R	save	%r22, %r0, %r29
	.word 0xbbe4608a  ! 2902: SAVE_I	save	%r17, 0x0001, %r29
iob_intr_0_216:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_216), 16, 16)) -> intp(0, 0, 4)
T0_asi_reg_rd_124:
	mov	0x3c2, %r14
	.word 0xf6db8e40  ! 2907: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_0_221:
	setx	0x36031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x81952052  ! 2909: WRPR_TPC_I	wrpr	%r20, 0x0052, %tpc
	.word 0xbbe44000  ! 2910: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_wr_133:
	mov	0x3c3, %r14
	.word 0xfcf38e40  ! 2912: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_rd_125:
	mov	0x4, %r14
	.word 0xfedb8e80  ! 2914: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb9e4209a  ! 2921: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb83c4000  ! 2923: XNOR_R	xnor 	%r17, %r0, %r28
	.word 0xbf2ce001  ! 2924: SLL_I	sll 	%r19, 0x0001, %r31
	.word 0xb72ce001  ! 2925: SLL_I	sll 	%r19, 0x0001, %r27
cpu_intr_0_222:
	setx	0x370031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e50000  ! 2928: SAVE_R	save	%r20, %r0, %r28
	.word 0xbc9cc000  ! 2930: XORcc_R	xorcc 	%r19, %r0, %r30
cpu_intr_0_223:
	setx	0x350118, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_217:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_217), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_wr_134:
	mov	0x3c8, %r14
	.word 0xfef38e60  ! 2939: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_0_224:
	setx	0x37010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e42193  ! 2941: SAVE_I	save	%r16, 0x0001, %r28
cpu_intr_0_225:
	setx	0x37003b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_226:
	setx	0x370226, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_126:
	mov	0x35, %r14
	.word 0xf4db8e80  ! 2946: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb9e5a0da  ! 2949: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbbe40000  ! 2951: SAVE_R	save	%r16, %r0, %r29
iob_intr_0_218:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_218), 16, 16)) -> intp(0, 0, 28)
	.word 0xb9e5a018  ! 2953: SAVE_I	save	%r22, 0x0001, %r28
cpu_intr_0_227:
	setx	0x37013f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_228:
	setx	0x340307, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_127:
	mov	0x11, %r14
	.word 0xfadb8400  ! 2956: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb5e421ec  ! 2957: SAVE_I	save	%r16, 0x0001, %r26
T0_asi_reg_wr_135:
	mov	0x1d, %r14
	.word 0xf2f38400  ! 2958: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_0_219:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_219), 16, 16)) -> intp(0, 0, 13)
T0_asi_reg_rd_128:
	mov	0x1c, %r14
	.word 0xf6db8e40  ! 2961: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbfe5c000  ! 2962: SAVE_R	save	%r23, %r0, %r31
	.word 0xb9e40000  ! 2966: SAVE_R	save	%r16, %r0, %r28
iob_intr_0_220:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_220), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_wr_136:
	mov	0x3c4, %r14
	.word 0xfaf389e0  ! 2969: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T0_asi_reg_wr_137:
	mov	0x6, %r14
	.word 0xf8f384a0  ! 2972: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T0_asi_reg_rd_129:
	mov	0x3c7, %r14
	.word 0xf6db8e80  ! 2973: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_0_221:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_221), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb81d8000  ! 2978: XOR_R	xor 	%r22, %r0, %r28
	.word 0xb1e4e0c4  ! 2980: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_wr_138:
	mov	0x25, %r14
	.word 0xf2f384a0  ! 2982: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T0_asi_reg_wr_139:
	mov	0xd, %r14
	.word 0xf0f38400  ! 2984: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb951c000  ! 2988: RDPR_TL	<illegal instruction>
cpu_intr_0_229:
	setx	0x35000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e50000  ! 2991: SAVE_R	save	%r20, %r0, %r24
	.word 0xb7e46147  ! 2996: SAVE_I	save	%r17, 0x0001, %r27
iob_intr_0_222:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_222), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_rd_130:
	mov	0x9, %r14
	.word 0xf0db8e40  ! 3001: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xba0ca138  ! 3002: AND_I	and 	%r18, 0x0138, %r29
	.word 0xbe0d0000  ! 3005: AND_R	and 	%r20, %r0, %r31
	.word 0xb5e50000  ! 3007: SAVE_R	save	%r20, %r0, %r26
	.word 0xbbe4c000  ! 3008: SAVE_R	save	%r19, %r0, %r29
	.word 0x8594e039  ! 3010: WRPR_TSTATE_I	wrpr	%r19, 0x0039, %tstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbb641800  ! 3016: MOVcc_R	<illegal instruction>
	.word 0xb5e560e3  ! 3019: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe54000  ! 3022: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_223:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_223), 16, 16)) -> intp(0, 0, 12)
	.word 0xbde5a037  ! 3025: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_rd_131:
	mov	0x2b, %r14
	.word 0xf6db8400  ! 3027: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_0_224:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_224), 16, 16)) -> intp(0, 0, 20)
	.word 0xbfe54000  ! 3030: SAVE_R	save	%r21, %r0, %r31
	.word 0xb80d8000  ! 3031: AND_R	and 	%r22, %r0, %r28
	.word 0xb7e4c000  ! 3034: SAVE_R	save	%r19, %r0, %r27
iob_intr_0_225:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_225), 16, 16)) -> intp(0, 0, 31)
	.word 0xb6b50000  ! 3038: ORNcc_R	orncc 	%r20, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_226:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_226), 16, 16)) -> intp(0, 0, 0)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_132:
	mov	0x9, %r14
	.word 0xfadb8e80  ! 3047: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb9480000  ! 3048: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
T0_asi_reg_rd_133:
	mov	0x3c0, %r14
	.word 0xfedb8e40  ! 3049: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_0_230:
	setx	0x36022c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_140:
	mov	0x3c5, %r14
	.word 0xf8f38e80  ! 3053: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xbfe4e078  ! 3054: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb294c000  ! 3058: ORcc_R	orcc 	%r19, %r0, %r25
cpu_intr_0_231:
	setx	0x360328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc2de0f7  ! 3063: ANDN_I	andn 	%r23, 0x00f7, %r30
	.word 0xb1e560a3  ! 3064: SAVE_I	save	%r21, 0x0001, %r24
iob_intr_0_227:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_227), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb5e5a0b7  ! 3073: SAVE_I	save	%r22, 0x0001, %r26
iob_intr_0_228:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_228), 16, 16)) -> intp(0, 0, e)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbbe44000  ! 3077: SAVE_R	save	%r17, %r0, %r29
	.word 0xb5e5c000  ! 3078: SAVE_R	save	%r23, %r0, %r26
cpu_intr_0_232:
	setx	0x360234, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_229:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_229), 16, 16)) -> intp(0, 0, 29)
T0_asi_reg_rd_134:
	mov	0x1a, %r14
	.word 0xfadb8e60  ! 3085: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_0_233:
	setx	0x34010c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_141:
	mov	0x10, %r14
	.word 0xf0f38e60  ! 3088: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb1e561c5  ! 3091: SAVE_I	save	%r21, 0x0001, %r24
T0_asi_reg_rd_135:
	mov	0x30, %r14
	.word 0xfcdb89e0  ! 3093: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb62dc000  ! 3096: ANDN_R	andn 	%r23, %r0, %r27
T0_asi_reg_rd_136:
	mov	0x20, %r14
	.word 0xf8db89e0  ! 3097: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb3e54000  ! 3099: SAVE_R	save	%r21, %r0, %r25
	.word 0xb7e5c000  ! 3102: SAVE_R	save	%r23, %r0, %r27
	.word 0xb1e40000  ! 3103: SAVE_R	save	%r16, %r0, %r24
T0_asi_reg_rd_137:
	mov	0x4, %r14
	.word 0xfadb8e40  ! 3106: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_0_230:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_230), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb1e40000  ! 3109: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_231:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_231), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_rd_138:
	mov	0x19, %r14
	.word 0xfadb8e40  ! 3111: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe54000  ! 3113: SAVE_R	save	%r21, %r0, %r31
	.word 0xbbe5c000  ! 3114: SAVE_R	save	%r23, %r0, %r29
	.word 0xbde58000  ! 3118: SAVE_R	save	%r22, %r0, %r30
	.word 0xbde560d5  ! 3120: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbbe42131  ! 3121: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7e58000  ! 3122: SAVE_R	save	%r22, %r0, %r27
iob_intr_0_232:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_232), 16, 16)) -> intp(0, 0, 15)
cpu_intr_0_234:
	setx	0x34012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5601f  ! 3126: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbde5c000  ! 3130: SAVE_R	save	%r23, %r0, %r30
	.word 0xbfe4c000  ! 3131: SAVE_R	save	%r19, %r0, %r31
cpu_intr_0_235:
	setx	0x36001b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_233:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_233), 16, 16)) -> intp(0, 0, 22)
iob_intr_0_234:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_234), 16, 16)) -> intp(0, 0, 25)
iob_intr_0_235:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_235), 16, 16)) -> intp(0, 0, 1c)
iob_intr_0_236:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_236), 16, 16)) -> intp(0, 0, 18)
	.word 0xb7e4c000  ! 3139: SAVE_R	save	%r19, %r0, %r27
cpu_intr_0_236:
	setx	0x350213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e48000  ! 3148: SAVE_R	save	%r18, %r0, %r25
iob_intr_0_237:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_237), 16, 16)) -> intp(0, 0, 2)
cpu_intr_0_237:
	setx	0x350107, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_238:
	setx	0x36000e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_139:
	mov	0x3c1, %r14
	.word 0xf2db8400  ! 3156: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_0_238:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_238), 16, 16)) -> intp(0, 0, 12)
	.word 0xb7643801  ! 3158: MOVcc_I	<illegal instruction>
	.word 0xb6bc205e  ! 3159: XNORcc_I	xnorcc 	%r16, 0x005e, %r27
	.word 0xb1e5211f  ! 3161: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbbe48000  ! 3163: SAVE_R	save	%r18, %r0, %r29
	.word 0xb1e58000  ! 3164: SAVE_R	save	%r22, %r0, %r24
	.word 0xb52dd000  ! 3165: SLLX_R	sllx	%r23, %r0, %r26
	.word 0xbc8d2010  ! 3168: ANDcc_I	andcc 	%r20, 0x0010, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_142:
	mov	0x12, %r14
	.word 0xfcf384a0  ! 3172: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb1e4c000  ! 3175: SAVE_R	save	%r19, %r0, %r24
	.word 0xbde44000  ! 3176: SAVE_R	save	%r17, %r0, %r30
cpu_intr_0_239:
	setx	0x360319, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_239:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_239), 16, 16)) -> intp(0, 0, 10)
	.word 0xb3e4c000  ! 3183: SAVE_R	save	%r19, %r0, %r25
cpu_intr_0_240:
	setx	0x37012b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_140:
	mov	0x2f, %r14
	.word 0xfcdb8e40  ! 3188: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_241:
	setx	0x34002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a102  ! 3191: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb1e5e052  ! 3192: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x8595e032  ! 3196: WRPR_TSTATE_I	wrpr	%r23, 0x0032, %tstate
	.word 0xbbe4e005  ! 3198: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_wr_143:
	mov	0x24, %r14
	.word 0xfaf38e80  ! 3200: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_0_242:
	setx	0x3a012a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_240:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_240), 16, 16)) -> intp(0, 0, 35)
	.word 0xbc450000  ! 3207: ADDC_R	addc 	%r20, %r0, %r30
	.word 0xbd3d0000  ! 3210: SRA_R	sra 	%r20, %r0, %r30
T0_asi_reg_rd_141:
	mov	0x3c7, %r14
	.word 0xfedb89e0  ! 3211: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_0_241:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_241), 16, 16)) -> intp(0, 0, 14)
	.word 0xb9e4a11b  ! 3222: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb7e5e024  ! 3223: SAVE_I	save	%r23, 0x0001, %r27
iob_intr_0_242:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_242), 16, 16)) -> intp(0, 0, 36)
T0_asi_reg_rd_142:
	mov	0x29, %r14
	.word 0xf4db8400  ! 3231: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb3e5c000  ! 3232: SAVE_R	save	%r23, %r0, %r25
T0_asi_reg_rd_143:
	mov	0x1c, %r14
	.word 0xfedb8e40  ! 3233: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbfe4a16e  ! 3234: SAVE_I	save	%r18, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde4e047  ! 3236: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb3e4c000  ! 3247: SAVE_R	save	%r19, %r0, %r25
	.word 0xb9e5a1ca  ! 3248: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3e5608d  ! 3249: SAVE_I	save	%r21, 0x0001, %r25
T0_asi_reg_rd_144:
	mov	0x4, %r14
	.word 0xf4db8400  ! 3250: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xbb34b001  ! 3253: SRLX_I	srlx	%r18, 0x0001, %r29
T0_asi_reg_rd_145:
	mov	0x5, %r14
	.word 0xf2db8400  ! 3254: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T0_asi_reg_wr_144:
	mov	0x3c0, %r14
	.word 0xf2f38400  ! 3256: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_0_243:
	setx	0x3a0028, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_145:
	mov	0xb, %r14
	.word 0xf8f38e40  ! 3267: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_243:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_243), 16, 16)) -> intp(0, 0, 1b)
	.word 0xbbe58000  ! 3271: SAVE_R	save	%r22, %r0, %r29
iob_intr_0_244:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_244), 16, 16)) -> intp(0, 0, 19)
	.word 0xb32c3001  ! 3275: SLLX_I	sllx	%r16, 0x0001, %r25
	.word 0xbfe5c000  ! 3278: SAVE_R	save	%r23, %r0, %r31
cpu_intr_0_244:
	setx	0x3b011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaa58000  ! 3281: SUBcc_R	subcc 	%r22, %r0, %r29
iob_intr_0_245:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_245), 16, 16)) -> intp(0, 0, 5)
	.word 0xb29c2141  ! 3283: XORcc_I	xorcc 	%r16, 0x0141, %r25
iob_intr_0_246:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_246), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_rd_146:
	mov	0x17, %r14
	.word 0xf8db8e40  ! 3286: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_245:
	setx	0x3a011c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_146:
	mov	0x3c0, %r14
	.word 0xfaf38e40  ! 3291: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb5e4e054  ! 3292: SAVE_I	save	%r19, 0x0001, %r26
iob_intr_0_247:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_247), 16, 16)) -> intp(0, 0, 8)
	.word 0xbde54000  ! 3298: SAVE_R	save	%r21, %r0, %r30
	.word 0xb7e58000  ! 3301: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_wr_147:
	mov	0x17, %r14
	.word 0xf0f38e40  ! 3306: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbfe48000  ! 3310: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_246:
	setx	0x39012a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_247:
	setx	0x380128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5c000  ! 3318: SAVE_R	save	%r23, %r0, %r25
T0_asi_reg_wr_148:
	mov	0x3c4, %r14
	.word 0xfcf38e80  ! 3322: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_0_248:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_248), 16, 16)) -> intp(0, 0, 1)
cpu_intr_0_248:
	setx	0x3a0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e48000  ! 3326: SAVE_R	save	%r18, %r0, %r25
	.word 0xbbe420c4  ! 3327: SAVE_I	save	%r16, 0x0001, %r29
cpu_intr_0_249:
	setx	0x3a033d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_149:
	mov	0x21, %r14
	.word 0xf8f389e0  ! 3329: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb5e58000  ! 3330: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_rd_147:
	mov	0x3c3, %r14
	.word 0xfadb8e80  ! 3332: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_0_249:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_249), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb0a42088  ! 3338: SUBcc_I	subcc 	%r16, 0x0088, %r24
	.word 0xb3500000  ! 3339: RDPR_TPC	<illegal instruction>
T0_asi_reg_wr_150:
	mov	0x12, %r14
	.word 0xfef38e40  ! 3341: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_0_250:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_250), 16, 16)) -> intp(0, 0, 26)
	.word 0xbfe4c000  ! 3345: SAVE_R	save	%r19, %r0, %r31
	.word 0xb5e4a1da  ! 3351: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb1e4a018  ! 3355: SAVE_I	save	%r18, 0x0001, %r24
cpu_intr_0_250:
	setx	0x3b020e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_151:
	mov	0x14, %r14
	.word 0xf2f389e0  ! 3357: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb551c000  ! 3360: RDPR_TL	<illegal instruction>
	.word 0xbd3d1000  ! 3367: SRAX_R	srax	%r20, %r0, %r30
cpu_intr_0_251:
	setx	0x3b0113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1345000  ! 3370: SRLX_R	srlx	%r17, %r0, %r24
T0_asi_reg_rd_148:
	mov	0x28, %r14
	.word 0xfadb8400  ! 3373: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbe84c000  ! 3375: ADDcc_R	addcc 	%r19, %r0, %r31
iob_intr_0_251:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_251), 16, 16)) -> intp(0, 0, b)
T0_asi_reg_wr_152:
	mov	0x1f, %r14
	.word 0xf4f38e40  ! 3380: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb5e40000  ! 3384: SAVE_R	save	%r16, %r0, %r26
	.word 0xbbe5e075  ! 3387: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb3e4e079  ! 3388: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_252:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_252), 16, 16)) -> intp(0, 0, 18)
cpu_intr_0_252:
	setx	0x38002d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_253:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_253), 16, 16)) -> intp(0, 0, 37)
	.word 0xb69c4000  ! 3394: XORcc_R	xorcc 	%r17, %r0, %r27
	.word 0xbbe50000  ! 3395: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_wr_153:
	mov	0x10, %r14
	.word 0xfcf384a0  ! 3397: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb1e54000  ! 3400: SAVE_R	save	%r21, %r0, %r24
T0_asi_reg_rd_149:
	mov	0x13, %r14
	.word 0xfedb8e60  ! 3401: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_0_253:
	setx	0x38030b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_254:
	setx	0x39003a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_154:
	mov	0x2d, %r14
	.word 0xfcf38400  ! 3407: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_0_254:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_254), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbc8ce14f  ! 3409: ANDcc_I	andcc 	%r19, 0x014f, %r30
T0_asi_reg_rd_150:
	mov	0x14, %r14
	.word 0xfcdb8e60  ! 3411: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbaa44000  ! 3416: SUBcc_R	subcc 	%r17, %r0, %r29
	.word 0xb1e56049  ! 3418: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbfe58000  ! 3420: SAVE_R	save	%r22, %r0, %r31
	.word 0xbbe560d2  ! 3421: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb9e4c000  ! 3422: SAVE_R	save	%r19, %r0, %r28
	.word 0xb17de401  ! 3426: MOVR_I	movre	%r23, 0x1, %r24
	.word 0xb9e54000  ! 3427: SAVE_R	save	%r21, %r0, %r28
iob_intr_0_255:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_255), 16, 16)) -> intp(0, 0, 22)
	.word 0xb5e42178  ! 3430: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb9e4e026  ! 3432: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_wr_155:
	mov	0x37, %r14
	.word 0xf4f389e0  ! 3433: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T0_asi_reg_rd_151:
	mov	0x12, %r14
	.word 0xfcdb8e40  ! 3434: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_0_256:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_256), 16, 16)) -> intp(0, 0, 14)
iob_intr_0_257:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_257), 16, 16)) -> intp(0, 0, 21)
	.word 0xb1e56153  ! 3439: SAVE_I	save	%r21, 0x0001, %r24
T0_asi_reg_wr_156:
	mov	0x2f, %r14
	.word 0xf8f38e80  ! 3441: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_0_258:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_258), 16, 16)) -> intp(0, 0, 3c)
iob_intr_0_259:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_259), 16, 16)) -> intp(0, 0, 3d)
iob_intr_0_260:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_260), 16, 16)) -> intp(0, 0, 2b)
cpu_intr_0_255:
	setx	0x390303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e0d8  ! 3459: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xba3da0b4  ! 3462: XNOR_I	xnor 	%r22, 0x00b4, %r29
	.word 0xb1356001  ! 3468: SRL_I	srl 	%r21, 0x0001, %r24
	.word 0x9194a1c6  ! 3469: WRPR_PIL_I	wrpr	%r18, 0x01c6, %pil
	.word 0xb89d203e  ! 3470: XORcc_I	xorcc 	%r20, 0x003e, %r28
cpu_intr_0_256:
	setx	0x3b0112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e52164  ! 3476: SAVE_I	save	%r20, 0x0001, %r24
iob_intr_0_261:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_261), 16, 16)) -> intp(0, 0, 24)
cpu_intr_0_257:
	setx	0x380321, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_262:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_262), 16, 16)) -> intp(0, 0, 2d)
T0_asi_reg_rd_152:
	mov	0x21, %r14
	.word 0xf4db8e40  ! 3488: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_263:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_263), 16, 16)) -> intp(0, 0, 22)
	.word 0xb214e1f7  ! 3492: OR_I	or 	%r19, 0x01f7, %r25
cpu_intr_0_258:
	setx	0x390221, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_157:
	mov	0x12, %r14
	.word 0xfcf38400  ! 3494: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T0_asi_reg_wr_158:
	mov	0x29, %r14
	.word 0xf4f38400  ! 3496: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_0_264:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_264), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb1e5e06d  ! 3500: SAVE_I	save	%r23, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_153:
	mov	0x26, %r14
	.word 0xf4db8400  ! 3502: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb3e4a1af  ! 3503: SAVE_I	save	%r18, 0x0001, %r25
T0_asi_reg_rd_154:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 3508: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbbe5e08c  ! 3511: SAVE_I	save	%r23, 0x0001, %r29
iob_intr_0_265:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_265), 16, 16)) -> intp(0, 0, e)
	.word 0xb3e48000  ! 3515: SAVE_R	save	%r18, %r0, %r25
	.word 0xb5e5a11e  ! 3518: SAVE_I	save	%r22, 0x0001, %r26
cpu_intr_0_259:
	setx	0x39030f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_266:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_266), 16, 16)) -> intp(0, 0, 15)
	.word 0xa1902000  ! 3523: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xbde4e102  ! 3524: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb3e40000  ! 3525: SAVE_R	save	%r16, %r0, %r25
T0_asi_reg_rd_155:
	mov	0x0, %r14
	.word 0xf8db8e80  ! 3531: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbc8da0fd  ! 3533: ANDcc_I	andcc 	%r22, 0x00fd, %r30
	.word 0xb3e40000  ! 3535: SAVE_R	save	%r16, %r0, %r25
	.word 0xbfe54000  ! 3536: SAVE_R	save	%r21, %r0, %r31
	.word 0xbc0521f4  ! 3538: ADD_I	add 	%r20, 0x01f4, %r30
	.word 0xb5e5c000  ! 3539: SAVE_R	save	%r23, %r0, %r26
	.word 0xb7e40000  ! 3543: SAVE_R	save	%r16, %r0, %r27
	.word 0xbcbde1d0  ! 3546: XNORcc_I	xnorcc 	%r23, 0x01d0, %r30
iob_intr_0_267:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_267), 16, 16)) -> intp(0, 0, 9)
	.word 0xb1e5a055  ! 3553: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e50000  ! 3555: SAVE_R	save	%r20, %r0, %r26
T0_asi_reg_wr_159:
	mov	0x20, %r14
	.word 0xf6f38e60  ! 3558: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T0_asi_reg_rd_156:
	mov	0x23, %r14
	.word 0xfcdb8e40  ! 3559: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_260:
	setx	0x380212, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_160:
	mov	0x27, %r14
	.word 0xf0f38e40  ! 3561: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb2450000  ! 3563: ADDC_R	addc 	%r20, %r0, %r25
cpu_intr_0_261:
	setx	0x3a0336, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_268:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_268), 16, 16)) -> intp(0, 0, 18)
	.word 0xb00c4000  ! 3570: AND_R	and 	%r17, %r0, %r24
iob_intr_0_269:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_269), 16, 16)) -> intp(0, 0, c)
T0_asi_reg_wr_161:
	mov	0x2b, %r14
	.word 0xfaf38400  ! 3573: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb1e460be  ! 3575: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_wr_162:
	mov	0x21, %r14
	.word 0xf8f38e40  ! 3580: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb3e54000  ! 3581: SAVE_R	save	%r21, %r0, %r25
T0_asi_reg_wr_163:
	mov	0xc, %r14
	.word 0xf0f38400  ! 3584: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb4ac604c  ! 3587: ANDNcc_I	andncc 	%r17, 0x004c, %r26
iob_intr_0_270:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_270), 16, 16)) -> intp(0, 0, 8)
	.word 0xbde520f7  ! 3591: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbde54000  ! 3593: SAVE_R	save	%r21, %r0, %r30
	.word 0xb234c000  ! 3594: SUBC_R	orn 	%r19, %r0, %r25
	.word 0xb5e5614b  ! 3595: SAVE_I	save	%r21, 0x0001, %r26
iob_intr_0_271:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_271), 16, 16)) -> intp(0, 0, 23)
	.word 0xbf51c000  ! 3598: RDPR_TL	<illegal instruction>
T0_asi_reg_rd_157:
	mov	0x1d, %r14
	.word 0xf8db8400  ! 3599: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb8a4a005  ! 3604: SUBcc_I	subcc 	%r18, 0x0005, %r28
	.word 0xb5e50000  ! 3606: SAVE_R	save	%r20, %r0, %r26
T0_asi_reg_wr_164:
	mov	0x33, %r14
	.word 0xfaf389e0  ! 3607: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb5e5a121  ! 3609: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb5e5c000  ! 3610: SAVE_R	save	%r23, %r0, %r26
	.word 0xb3e421b5  ! 3611: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_wr_165:
	mov	0x7, %r14
	.word 0xf0f38e40  ! 3612: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_0_272:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_272), 16, 16)) -> intp(0, 0, 7)
	.word 0xb1e44000  ! 3615: SAVE_R	save	%r17, %r0, %r24
iob_intr_0_273:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_273), 16, 16)) -> intp(0, 0, 18)
	.word 0xb1e42030  ! 3621: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb335e001  ! 3624: SRL_I	srl 	%r23, 0x0001, %r25
	.word 0xb0142028  ! 3625: OR_I	or 	%r16, 0x0028, %r24
iob_intr_0_274:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_274), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_275:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_275), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb3e58000  ! 3631: SAVE_R	save	%r22, %r0, %r25
iob_intr_0_276:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_276), 16, 16)) -> intp(0, 0, 27)
	.word 0xb5e5207f  ! 3637: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbde54000  ! 3639: SAVE_R	save	%r21, %r0, %r30
	.word 0xbfe421a6  ! 3641: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_wr_166:
	mov	0x30, %r14
	.word 0xf2f38e40  ! 3642: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_277:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_277), 16, 16)) -> intp(0, 0, f)
	.word 0xb7e50000  ! 3650: SAVE_R	save	%r20, %r0, %r27
iob_intr_0_278:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_278), 16, 16)) -> intp(0, 0, 39)
iob_intr_0_279:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_279), 16, 16)) -> intp(0, 0, 8)
cpu_intr_0_262:
	setx	0x3c0001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba8c606b  ! 3665: ANDcc_I	andcc 	%r17, 0x006b, %r29
T0_asi_reg_wr_167:
	mov	0x3, %r14
	.word 0xfef389e0  ! 3666: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_0_280:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_280), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_wr_168:
	mov	0x3c5, %r14
	.word 0xf8f38400  ! 3673: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbbe58000  ! 3674: SAVE_R	save	%r22, %r0, %r29
iob_intr_0_281:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_281), 16, 16)) -> intp(0, 0, e)
	.word 0xb33d5000  ! 3677: SRAX_R	srax	%r21, %r0, %r25
cpu_intr_0_263:
	setx	0x3c022b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_264:
	setx	0x3d023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5540000  ! 3682: RDPR_GL	<illegal instruction>
iob_intr_0_282:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_282), 16, 16)) -> intp(0, 0, 2a)
cpu_intr_0_265:
	setx	0x3e0228, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_266:
	setx	0x3c0120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb21da1b7  ! 3689: XOR_I	xor 	%r22, 0x01b7, %r25
cpu_intr_0_267:
	setx	0x3d0208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 3694: SAVE_R	save	%r16, %r0, %r24
	.word 0xb5e44000  ! 3695: SAVE_R	save	%r17, %r0, %r26
T0_asi_reg_rd_158:
	mov	0x3c6, %r14
	.word 0xfcdb8e40  ! 3696: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbde50000  ! 3698: SAVE_R	save	%r20, %r0, %r30
cpu_intr_0_268:
	setx	0x3c0203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd2dd000  ! 3700: SLLX_R	sllx	%r23, %r0, %r30
T0_asi_reg_rd_159:
	mov	0x3c3, %r14
	.word 0xfedb84a0  ! 3702: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_0_269:
	setx	0x3c0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4609a  ! 3707: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb9e46062  ! 3708: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xba2d6123  ! 3711: ANDN_I	andn 	%r21, 0x0123, %r29
iob_intr_0_283:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_283), 16, 16)) -> intp(0, 0, 12)
	.word 0xbde5c000  ! 3717: SAVE_R	save	%r23, %r0, %r30
	.word 0xbfe5e0dd  ! 3721: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3e5a1e4  ! 3722: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb235a1fa  ! 3726: ORN_I	orn 	%r22, 0x01fa, %r25
	.word 0xb7e521fe  ! 3727: SAVE_I	save	%r20, 0x0001, %r27
iob_intr_0_284:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_284), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_wr_169:
	mov	0x36, %r14
	.word 0xf2f38400  ! 3731: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbfe5e17e  ! 3732: SAVE_I	save	%r23, 0x0001, %r31
T0_asi_reg_rd_160:
	mov	0x6, %r14
	.word 0xfadb84a0  ! 3734: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbbe461b4  ! 3735: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbde54000  ! 3740: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_285:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_285), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_286:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_286), 16, 16)) -> intp(0, 0, 17)
cpu_intr_0_270:
	setx	0x3f0228, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_170:
	mov	0x11, %r14
	.word 0xf2f38e60  ! 3758: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_0_287:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_287), 16, 16)) -> intp(0, 0, 34)
	.word 0xb9e44000  ! 3760: SAVE_R	save	%r17, %r0, %r28
cpu_intr_0_271:
	setx	0x3f0101, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_288:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_288), 16, 16)) -> intp(0, 0, 1f)
iob_intr_0_289:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_289), 16, 16)) -> intp(0, 0, a)
	.word 0xbbe50000  ! 3765: SAVE_R	save	%r20, %r0, %r29
	.word 0xb805a0b6  ! 3766: ADD_I	add 	%r22, 0x00b6, %r28
	.word 0xbde560e7  ! 3767: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbbe460d8  ! 3768: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb7e4e064  ! 3769: SAVE_I	save	%r19, 0x0001, %r27
iob_intr_0_290:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_290), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb5e5e0b1  ! 3773: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xba342047  ! 3774: ORN_I	orn 	%r16, 0x0047, %r29
	.word 0xbfe560f9  ! 3776: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbfe4c000  ! 3777: SAVE_R	save	%r19, %r0, %r31
T0_asi_reg_wr_171:
	mov	0x3c7, %r14
	.word 0xf4f389e0  ! 3778: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb1e54000  ! 3780: SAVE_R	save	%r21, %r0, %r24
iob_intr_0_291:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_291), 16, 16)) -> intp(0, 0, 35)
T0_asi_reg_rd_161:
	mov	0x3c5, %r14
	.word 0xf8db84a0  ! 3782: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_0_292:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_292), 16, 16)) -> intp(0, 0, 32)
	.word 0xbfe4c000  ! 3787: SAVE_R	save	%r19, %r0, %r31
	.word 0xbde4612c  ! 3789: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb62da161  ! 3791: ANDN_I	andn 	%r22, 0x0161, %r27
iob_intr_0_293:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_293), 16, 16)) -> intp(0, 0, b)
iob_intr_0_294:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_294), 16, 16)) -> intp(0, 0, 18)
iob_intr_0_295:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_295), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb3e54000  ! 3798: SAVE_R	save	%r21, %r0, %r25
	.word 0xb7e5219a  ! 3801: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3e58000  ! 3805: SAVE_R	save	%r22, %r0, %r25
T0_asi_reg_wr_172:
	mov	0x31, %r14
	.word 0xfcf38e60  ! 3806: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_0_272:
	setx	0x3f021d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_273:
	setx	0x3f0308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe520b7  ! 3811: SAVE_I	save	%r20, 0x0001, %r31
cpu_intr_0_274:
	setx	0x3c022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e48000  ! 3818: SAVE_R	save	%r18, %r0, %r27
	.word 0xb9e44000  ! 3820: SAVE_R	save	%r17, %r0, %r28
	.word 0xbde54000  ! 3821: SAVE_R	save	%r21, %r0, %r30
T0_asi_reg_wr_173:
	mov	0xa, %r14
	.word 0xf8f38e40  ! 3827: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb52c5000  ! 3829: SLLX_R	sllx	%r17, %r0, %r26
cpu_intr_0_275:
	setx	0x3d032a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_296:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_296), 16, 16)) -> intp(0, 0, 31)
iob_intr_0_297:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_297), 16, 16)) -> intp(0, 0, 19)
	.word 0xb3e5207d  ! 3837: SAVE_I	save	%r20, 0x0001, %r25
cpu_intr_0_276:
	setx	0x3c0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a1b8  ! 3842: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb9518000  ! 3844: RDPR_PSTATE	<illegal instruction>
	.word 0xb3e4a0f3  ! 3845: SAVE_I	save	%r18, 0x0001, %r25
cpu_intr_0_277:
	setx	0x3f000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbac52138  ! 3851: ADDCcc_I	addccc 	%r20, 0x0138, %r29
	.word 0xbde42124  ! 3852: SAVE_I	save	%r16, 0x0001, %r30
cpu_intr_0_278:
	setx	0x3e002e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_298:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_298), 16, 16)) -> intp(0, 0, 36)
	.word 0xbbe561f1  ! 3856: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbfe5a0a0  ! 3860: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_299:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_299), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_rd_162:
	mov	0x12, %r14
	.word 0xf0db89e0  ! 3863: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T0_asi_reg_wr_174:
	mov	0xb, %r14
	.word 0xf8f389e0  ! 3867: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb9e50000  ! 3868: SAVE_R	save	%r20, %r0, %r28
	.word 0xb1e5c000  ! 3869: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_rd_163:
	mov	0x3c3, %r14
	.word 0xf6db8e80  ! 3870: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_0_279:
	setx	0x3c0116, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_164:
	mov	0x21, %r14
	.word 0xfcdb8e80  ! 3872: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T0_asi_reg_wr_175:
	mov	0x3c6, %r14
	.word 0xf8f38e80  ! 3873: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb1e44000  ! 3874: SAVE_R	save	%r17, %r0, %r24
iob_intr_0_300:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_300), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_301:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_301), 16, 16)) -> intp(0, 0, 13)
	.word 0xb7e48000  ! 3882: SAVE_R	save	%r18, %r0, %r27
	.word 0xb7e521e5  ! 3883: SAVE_I	save	%r20, 0x0001, %r27
iob_intr_0_302:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_302), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_wr_176:
	mov	0xf, %r14
	.word 0xfef38e40  ! 3890: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_0_303:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_303), 16, 16)) -> intp(0, 0, 35)
T0_asi_reg_wr_177:
	mov	0x27, %r14
	.word 0xf8f38e80  ! 3893: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb9e46154  ! 3895: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbd35d000  ! 3896: SRLX_R	srlx	%r23, %r0, %r30
cpu_intr_0_280:
	setx	0x107, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_304:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_304), 16, 16)) -> intp(0, 0, d)
	.word 0xbde4a13a  ! 3904: SAVE_I	save	%r18, 0x0001, %r30
iob_intr_0_305:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_305), 16, 16)) -> intp(0, 0, 1)
cpu_intr_0_281:
	setx	0x3d013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5c000  ! 3909: SAVE_R	save	%r23, %r0, %r25
	.word 0xb9e44000  ! 3912: SAVE_R	save	%r17, %r0, %r28
	.word 0xbbe40000  ! 3913: SAVE_R	save	%r16, %r0, %r29
	.word 0xb83561bb  ! 3914: ORN_I	orn 	%r21, 0x01bb, %r28
cpu_intr_0_282:
	setx	0x3c002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e0ac  ! 3918: SAVE_I	save	%r19, 0x0001, %r26
cpu_intr_0_283:
	setx	0x3c0005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e54000  ! 3923: SAVE_R	save	%r21, %r0, %r24
cpu_intr_0_284:
	setx	0x3e023a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_285:
	setx	0x3c0008, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_306:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_306), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_wr_178:
	mov	0x2c, %r14
	.word 0xfef38e80  ! 3936: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb9e58000  ! 3939: SAVE_R	save	%r22, %r0, %r28
	.word 0xbde48000  ! 3940: SAVE_R	save	%r18, %r0, %r30
T0_asi_reg_rd_165:
	mov	0x9, %r14
	.word 0xf0db8e80  ! 3941: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb13df001  ! 3943: SRAX_I	srax	%r23, 0x0001, %r24
cpu_intr_0_286:
	setx	0x3e0011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e003  ! 3949: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_rd_166:
	mov	0x7, %r14
	.word 0xf0db8e40  ! 3950: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_wr_179:
	mov	0x2c, %r14
	.word 0xfcf384a0  ! 3952: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb02ca061  ! 3954: ANDN_I	andn 	%r18, 0x0061, %r24
cpu_intr_0_287:
	setx	0x3d0221, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_307:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_307), 16, 16)) -> intp(0, 0, 3f)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbde4c000  ! 3960: SAVE_R	save	%r19, %r0, %r30
	.word 0xb7e56114  ! 3961: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbf641800  ! 3962: MOVcc_R	<illegal instruction>
	.word 0xb9e5e0cd  ! 3963: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_wr_180:
	mov	0x8, %r14
	.word 0xf6f38e40  ! 3965: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_0_288:
	setx	0x3c023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde56074  ! 3967: SAVE_I	save	%r21, 0x0001, %r30
iob_intr_0_308:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_308), 16, 16)) -> intp(0, 0, 2c)
T0_asi_reg_wr_181:
	mov	0x23, %r14
	.word 0xf4f38e60  ! 3969: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb3e4609f  ! 3970: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe56107  ! 3971: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e48000  ! 3972: SAVE_R	save	%r18, %r0, %r26
	.word 0xb73d2001  ! 3976: SRA_I	sra 	%r20, 0x0001, %r27
iob_intr_0_309:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_309), 16, 16)) -> intp(0, 0, e)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e460f2  ! 3982: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbcace1d2  ! 3984: ANDNcc_I	andncc 	%r19, 0x01d2, %r30
iob_intr_0_310:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_310), 16, 16)) -> intp(0, 0, 25)
	.word 0xb5e5e01f  ! 3988: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb5e44000  ! 3990: SAVE_R	save	%r17, %r0, %r26
cpu_intr_0_289:
	setx	0x3c0314, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_311:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_311), 16, 16)) -> intp(0, 0, 36)
cpu_intr_0_290:
	setx	0x3c0101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e48000  ! 3998: SAVE_R	save	%r18, %r0, %r27
	.word 0xb5e54000  ! 4000: SAVE_R	save	%r21, %r0, %r26
iob_intr_0_312:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_312), 16, 16)) -> intp(0, 0, 37)
T0_asi_reg_rd_167:
	mov	0x3c2, %r14
	.word 0xfcdb8e80  ! 4002: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T0_asi_reg_rd_168:
	mov	0x3c0, %r14
	.word 0xfadb8400  ! 4005: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T0_asi_reg_wr_182:
	mov	0x3c7, %r14
	.word 0xf4f38e80  ! 4007: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T0_asi_reg_wr_183:
	mov	0x30, %r14
	.word 0xf6f38e60  ! 4010: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb5e5a152  ! 4011: SAVE_I	save	%r22, 0x0001, %r26
iob_intr_0_313:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_313), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_wr_184:
	mov	0x21, %r14
	.word 0xfcf38400  ! 4018: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb3e40000  ! 4021: SAVE_R	save	%r16, %r0, %r25
	.word 0xb3e5a0bf  ! 4025: SAVE_I	save	%r22, 0x0001, %r25
iob_intr_0_314:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_314), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_315:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_315), 16, 16)) -> intp(0, 0, 17)
cpu_intr_0_291:
	setx	0x3e033f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_316:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_316), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_wr_185:
	mov	0x3c7, %r14
	.word 0xf8f38e60  ! 4037: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb5e4a0e2  ! 4038: SAVE_I	save	%r18, 0x0001, %r26
cpu_intr_0_292:
	setx	0x3f0224, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_317:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_317), 16, 16)) -> intp(0, 0, 3b)
cpu_intr_0_293:
	setx	0x3c0123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe521f7  ! 4047: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb5e56094  ! 4049: SAVE_I	save	%r21, 0x0001, %r26
iob_intr_0_318:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_318), 16, 16)) -> intp(0, 0, 2)
iob_intr_0_319:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_319), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb5e40000  ! 4053: SAVE_R	save	%r16, %r0, %r26
	.word 0xb5e4619d  ! 4055: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7e5c000  ! 4056: SAVE_R	save	%r23, %r0, %r27
	.word 0xbbe5a186  ! 4061: SAVE_I	save	%r22, 0x0001, %r29
cpu_intr_0_294:
	setx	0x3f003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4a07d  ! 4067: SAVE_I	save	%r18, 0x0001, %r30
iob_intr_0_320:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_320), 16, 16)) -> intp(0, 0, 4)
	.word 0xb7e4e04d  ! 4071: SAVE_I	save	%r19, 0x0001, %r27
iob_intr_0_321:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_321), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb7e54000  ! 4073: SAVE_R	save	%r21, %r0, %r27
	.word 0xb62561e8  ! 4075: SUB_I	sub 	%r21, 0x01e8, %r27
	.word 0xb7e5c000  ! 4080: SAVE_R	save	%r23, %r0, %r27
T0_asi_reg_wr_186:
	mov	0x19, %r14
	.word 0xf4f38e60  ! 4081: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_0_322:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_322), 16, 16)) -> intp(0, 0, 7)
cpu_intr_0_295:
	setx	0x3d0300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e460ef  ! 4090: SAVE_I	save	%r17, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e420fd  ! 4092: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb7e40000  ! 4093: SAVE_R	save	%r16, %r0, %r27
cpu_intr_0_296:
	setx	0x3f022c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_297:
	setx	0x3e023d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_323:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_323), 16, 16)) -> intp(0, 0, 1)
	.word 0xbbe4e132  ! 4102: SAVE_I	save	%r19, 0x0001, %r29
cpu_intr_0_298:
	setx	0x3e0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7643801  ! 4105: MOVcc_I	<illegal instruction>
iob_intr_0_324:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_324), 16, 16)) -> intp(0, 0, 7)
	.word 0xbde48000  ! 4108: SAVE_R	save	%r18, %r0, %r30
T0_asi_reg_rd_169:
	mov	0x3c7, %r14
	.word 0xf0db89e0  ! 4112: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T0_asi_reg_wr_187:
	mov	0xd, %r14
	.word 0xfef38400  ! 4113: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_0_299:
	setx	0x43021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8248000  ! 4115: SUB_R	sub 	%r18, %r0, %r28
	.word 0xb32cf001  ! 4118: SLLX_I	sllx	%r19, 0x0001, %r25
	.word 0xb0350000  ! 4122: ORN_R	orn 	%r20, %r0, %r24
	.word 0xbeb50000  ! 4127: ORNcc_R	orncc 	%r20, %r0, %r31
	.word 0xbc358000  ! 4132: SUBC_R	orn 	%r22, %r0, %r30
cpu_intr_0_300:
	setx	0x420122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4207e  ! 4138: SAVE_I	save	%r16, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe50000  ! 4143: SAVE_R	save	%r20, %r0, %r29
	.word 0xb5e5c000  ! 4144: SAVE_R	save	%r23, %r0, %r26
iob_intr_0_325:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_325), 16, 16)) -> intp(0, 0, 34)
cpu_intr_0_301:
	setx	0x42003d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_326:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_326), 16, 16)) -> intp(0, 0, 37)
	.word 0xb5e5a04c  ! 4154: SAVE_I	save	%r22, 0x0001, %r26
cpu_intr_0_302:
	setx	0x41021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4a54000  ! 4157: SUBcc_R	subcc 	%r21, %r0, %r26
cpu_intr_0_303:
	setx	0x430001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a1a6  ! 4161: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb6140000  ! 4164: OR_R	or 	%r16, %r0, %r27
T0_asi_reg_rd_170:
	mov	0x9, %r14
	.word 0xf4db84a0  ! 4167: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb1e40000  ! 4168: SAVE_R	save	%r16, %r0, %r24
	.word 0xb3e44000  ! 4169: SAVE_R	save	%r17, %r0, %r25
T0_asi_reg_wr_188:
	mov	0x25, %r14
	.word 0xf8f384a0  ! 4170: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb5e44000  ! 4171: SAVE_R	save	%r17, %r0, %r26
cpu_intr_0_304:
	setx	0x420028, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_305:
	setx	0x410121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe560a7  ! 4176: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb5e58000  ! 4179: SAVE_R	save	%r22, %r0, %r26
	.word 0xb7e5a1f5  ! 4186: SAVE_I	save	%r22, 0x0001, %r27
T0_asi_reg_rd_171:
	mov	0x10, %r14
	.word 0xf2db8e40  ! 4187: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbde521c6  ! 4189: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_wr_189:
	mov	0x3c0, %r14
	.word 0xf8f38e40  ! 4190: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_rd_172:
	mov	0x3c1, %r14
	.word 0xf2db8e40  ! 4192: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_327:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_327), 16, 16)) -> intp(0, 0, 2d)
iob_intr_0_328:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_328), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb72d2001  ! 4200: SLL_I	sll 	%r20, 0x0001, %r27
T0_asi_reg_rd_173:
	mov	0x2c, %r14
	.word 0xf2db8400  ! 4202: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_0_306:
	setx	0x410003, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_307:
	setx	0x430005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 4216: SAVE_R	save	%r23, %r0, %r27
cpu_intr_0_308:
	setx	0x410126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb37d2401  ! 4225: MOVR_I	movre	%r20, 0x1, %r25
	.word 0xb5e5a08a  ! 4227: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb3e4e172  ! 4228: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1e44000  ! 4230: SAVE_R	save	%r17, %r0, %r24
iob_intr_0_329:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_329), 16, 16)) -> intp(0, 0, 34)
	.word 0xbde58000  ! 4236: SAVE_R	save	%r22, %r0, %r30
	.word 0xb9e48000  ! 4240: SAVE_R	save	%r18, %r0, %r28
iob_intr_0_330:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_330), 16, 16)) -> intp(0, 0, 34)
	.word 0xb5e4e17a  ! 4244: SAVE_I	save	%r19, 0x0001, %r26
iob_intr_0_331:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_331), 16, 16)) -> intp(0, 0, 25)
	.word 0xbbe5e121  ! 4246: SAVE_I	save	%r23, 0x0001, %r29
cpu_intr_0_309:
	setx	0x400219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e44000  ! 4255: SAVE_R	save	%r17, %r0, %r27
cpu_intr_0_310:
	setx	0x41031a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_332:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_332), 16, 16)) -> intp(0, 0, 3)
T0_asi_reg_rd_174:
	mov	0x3c4, %r14
	.word 0xf2db8e60  ! 4264: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_0_311:
	setx	0x430207, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_312:
	setx	0x42033a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_333:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_333), 16, 16)) -> intp(0, 0, 31)
T0_asi_reg_rd_175:
	mov	0x3c4, %r14
	.word 0xf4db8e40  ! 4269: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_334:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_334), 16, 16)) -> intp(0, 0, 28)
T0_asi_reg_rd_176:
	mov	0x7, %r14
	.word 0xf0db84a0  ! 4275: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb9e50000  ! 4277: SAVE_R	save	%r20, %r0, %r28
iob_intr_0_335:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_335), 16, 16)) -> intp(0, 0, 36)
	.word 0xbbe5212d  ! 4280: SAVE_I	save	%r20, 0x0001, %r29
cpu_intr_0_313:
	setx	0x40011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb41dc000  ! 4284: XOR_R	xor 	%r23, %r0, %r26
cpu_intr_0_314:
	setx	0x410117, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_177:
	mov	0x3c7, %r14
	.word 0xf8db84a0  ! 4286: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb09c4000  ! 4288: XORcc_R	xorcc 	%r17, %r0, %r24
iob_intr_0_336:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_336), 16, 16)) -> intp(0, 0, 33)
	.word 0xb4b421c0  ! 4290: ORNcc_I	orncc 	%r16, 0x01c0, %r26
T0_asi_reg_wr_190:
	mov	0x3c8, %r14
	.word 0xf0f384a0  ! 4292: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_0_337:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_337), 16, 16)) -> intp(0, 0, 39)
iob_intr_0_338:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_338), 16, 16)) -> intp(0, 0, 34)
	.word 0xb32dc000  ! 4302: SLL_R	sll 	%r23, %r0, %r25
T0_asi_reg_rd_178:
	mov	0x28, %r14
	.word 0xf2db8400  ! 4304: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb3e50000  ! 4306: SAVE_R	save	%r20, %r0, %r25
	.word 0xb5e4e13c  ! 4307: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbde4c000  ! 4308: SAVE_R	save	%r19, %r0, %r30
iob_intr_0_339:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_339), 16, 16)) -> intp(0, 0, 8)
iob_intr_0_340:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_340), 16, 16)) -> intp(0, 0, 4)
iob_intr_0_341:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_341), 16, 16)) -> intp(0, 0, 24)
cpu_intr_0_315:
	setx	0x41011e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_316:
	setx	0x43003d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_342:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_342), 16, 16)) -> intp(0, 0, 36)
	.word 0xbfe4200c  ! 4322: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_wr_191:
	mov	0xc, %r14
	.word 0xf4f38400  ! 4324: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbbe46150  ! 4327: SAVE_I	save	%r17, 0x0001, %r29
T0_asi_reg_rd_179:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 4328: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbd2c1000  ! 4334: SLLX_R	sllx	%r16, %r0, %r30
	.word 0xbde4e16e  ! 4336: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_wr_192:
	mov	0x3, %r14
	.word 0xf0f38e40  ! 4337: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_0_343:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_343), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_rd_180:
	mov	0x33, %r14
	.word 0xfedb8e40  ! 4341: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_0_317:
	setx	0x430105, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_318:
	setx	0x410015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb834c000  ! 4344: SUBC_R	orn 	%r19, %r0, %r28
	.word 0xb5e44000  ! 4346: SAVE_R	save	%r17, %r0, %r26
T0_asi_reg_rd_181:
	mov	0x3c1, %r14
	.word 0xf6db8400  ! 4347: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbde48000  ! 4348: SAVE_R	save	%r18, %r0, %r30
iob_intr_0_344:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_344), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb7e50000  ! 4351: SAVE_R	save	%r20, %r0, %r27
	.word 0xb3e48000  ! 4352: SAVE_R	save	%r18, %r0, %r25
	.word 0xb8b44000  ! 4353: SUBCcc_R	orncc 	%r17, %r0, %r28
	.word 0xb3e4210d  ! 4355: SAVE_I	save	%r16, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbbe48000  ! 4357: SAVE_R	save	%r18, %r0, %r29
iob_intr_0_345:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_345), 16, 16)) -> intp(0, 0, 21)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_193:
	mov	0x2, %r14
	.word 0xf4f38e40  ! 4370: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb4948000  ! 4371: ORcc_R	orcc 	%r18, %r0, %r26
T0_asi_reg_wr_194:
	mov	0x27, %r14
	.word 0xf4f38400  ! 4372: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_0_346:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_346), 16, 16)) -> intp(0, 0, 4)
	.word 0xb4b42199  ! 4381: SUBCcc_I	orncc 	%r16, 0x0199, %r26
T0_asi_reg_wr_195:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 4383: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_wr_196:
	mov	0x7, %r14
	.word 0xf2f389e0  ! 4384: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbbe44000  ! 4386: SAVE_R	save	%r17, %r0, %r29
cpu_intr_0_319:
	setx	0x42003e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_182:
	mov	0x3c1, %r14
	.word 0xf8db89e0  ! 4388: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb1e4e00e  ! 4393: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbfe46052  ! 4394: SAVE_I	save	%r17, 0x0001, %r31
iob_intr_0_347:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_347), 16, 16)) -> intp(0, 0, c)
T0_asi_reg_rd_183:
	mov	0x24, %r14
	.word 0xfadb84a0  ! 4398: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_0_348:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_348), 16, 16)) -> intp(0, 0, 35)
	.word 0xb9e44000  ! 4404: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_rd_184:
	mov	0x3c4, %r14
	.word 0xf4db8e80  ! 4406: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T0_asi_reg_rd_185:
	mov	0x20, %r14
	.word 0xfadb8e40  ! 4415: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_0_349:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_349), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb5e4e15f  ! 4418: SAVE_I	save	%r19, 0x0001, %r26
cpu_intr_0_320:
	setx	0x410129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe40000  ! 4421: SAVE_R	save	%r16, %r0, %r31
cpu_intr_0_321:
	setx	0x400130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e50000  ! 4425: SAVE_R	save	%r20, %r0, %r26
	.word 0xb9e54000  ! 4426: SAVE_R	save	%r21, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_350:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_350), 16, 16)) -> intp(0, 0, 19)
	.word 0xbfe420d8  ! 4437: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb12c5000  ! 4440: SLLX_R	sllx	%r17, %r0, %r24
T0_asi_reg_wr_197:
	mov	0xd, %r14
	.word 0xf0f38e40  ! 4441: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb1e48000  ! 4442: SAVE_R	save	%r18, %r0, %r24
	.word 0xba2c0000  ! 4449: ANDN_R	andn 	%r16, %r0, %r29
	.word 0xbb35a001  ! 4452: SRL_I	srl 	%r22, 0x0001, %r29
	.word 0xbde5a127  ! 4453: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_wr_198:
	mov	0x9, %r14
	.word 0xf4f384a0  ! 4454: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbe0c0000  ! 4455: AND_R	and 	%r16, %r0, %r31
iob_intr_0_351:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_351), 16, 16)) -> intp(0, 0, 7)
	.word 0xbfe44000  ! 4460: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_352:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_352), 16, 16)) -> intp(0, 0, 29)
iob_intr_0_353:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_353), 16, 16)) -> intp(0, 0, 19)
iob_intr_0_354:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_354), 16, 16)) -> intp(0, 0, 28)
T0_asi_reg_rd_186:
	mov	0x3c4, %r14
	.word 0xf0db8e60  ! 4466: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_0_355:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_355), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb32d6001  ! 4469: SLL_I	sll 	%r21, 0x0001, %r25
iob_intr_0_356:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_356), 16, 16)) -> intp(0, 0, 6)
iob_intr_0_357:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_357), 16, 16)) -> intp(0, 0, 9)
iob_intr_0_358:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_358), 16, 16)) -> intp(0, 0, 3)
cpu_intr_0_322:
	setx	0x410028, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_199:
	mov	0x29, %r14
	.word 0xfef38400  ! 4478: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_0_359:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_359), 16, 16)) -> intp(0, 0, 0)
cpu_intr_0_323:
	setx	0x42011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e44000  ! 4488: SAVE_R	save	%r17, %r0, %r25
	.word 0xbde58000  ! 4489: SAVE_R	save	%r22, %r0, %r30
iob_intr_0_360:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_360), 16, 16)) -> intp(0, 0, 11)
T0_asi_reg_wr_200:
	mov	0x21, %r14
	.word 0xfcf389e0  ! 4492: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_0_361:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_361), 16, 16)) -> intp(0, 0, 3)
T0_asi_reg_rd_187:
	mov	0x3c7, %r14
	.word 0xf0db89e0  ! 4495: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb9e58000  ! 4497: SAVE_R	save	%r22, %r0, %r28
cpu_intr_0_324:
	setx	0x410300, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_325:
	setx	0x400226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaadc000  ! 4502: ANDNcc_R	andncc 	%r23, %r0, %r29
T0_asi_reg_rd_188:
	mov	0x27, %r14
	.word 0xf2db89e0  ! 4504: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_0_326:
	setx	0x43022e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_327:
	setx	0x430038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_362:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_362), 16, 16)) -> intp(0, 0, 34)
	.word 0xba450000  ! 4516: ADDC_R	addc 	%r20, %r0, %r29
iob_intr_0_363:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_363), 16, 16)) -> intp(0, 0, 29)
T0_asi_reg_rd_189:
	mov	0x9, %r14
	.word 0xfedb8e40  ! 4521: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_0_364:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_364), 16, 16)) -> intp(0, 0, 10)
	.word 0xbfe50000  ! 4525: SAVE_R	save	%r20, %r0, %r31
	.word 0xbde561cd  ! 4526: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbde561d3  ! 4528: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e42154  ! 4529: SAVE_I	save	%r16, 0x0001, %r27
iob_intr_0_365:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_365), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_wr_201:
	mov	0x35, %r14
	.word 0xfcf38e40  ! 4536: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_366:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_366), 16, 16)) -> intp(0, 0, 12)
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
iob_intr_0_367:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_367), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb9e5a091  ! 4545: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e4e0b6  ! 4547: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbfe56015  ! 4550: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_rd_190:
	mov	0xb, %r14
	.word 0xfcdb8400  ! 4552: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_0_368:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_368), 16, 16)) -> intp(0, 0, 29)
iob_intr_0_369:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_369), 16, 16)) -> intp(0, 0, 19)
cpu_intr_0_328:
	setx	0x420237, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_370:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_370), 16, 16)) -> intp(0, 0, b)
cpu_intr_0_329:
	setx	0x410329, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_371:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_371), 16, 16)) -> intp(0, 0, 11)
	.word 0xb5e58000  ! 4566: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_rd_191:
	mov	0xd, %r14
	.word 0xfedb8e40  ! 4567: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_rd_192:
	mov	0x2f, %r14
	.word 0xf4db8e40  ! 4568: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbfe5619a  ! 4569: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_rd_193:
	mov	0x4, %r14
	.word 0xfedb8e40  ! 4571: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb7e520ee  ! 4572: SAVE_I	save	%r20, 0x0001, %r27
iob_intr_0_372:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_372), 16, 16)) -> intp(0, 0, 3e)
cpu_intr_0_330:
	setx	0x44023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e520dd  ! 4579: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb4b4c000  ! 4580: ORNcc_R	orncc 	%r19, %r0, %r26
cpu_intr_0_331:
	setx	0x44013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5a09b  ! 4583: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbe2d607d  ! 4585: ANDN_I	andn 	%r21, 0x007d, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_202:
	mov	0xf, %r14
	.word 0xfef38e60  ! 4591: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb9643801  ! 4595: MOVcc_I	<illegal instruction>
cpu_intr_0_332:
	setx	0x440109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb21ce062  ! 4603: XOR_I	xor 	%r19, 0x0062, %r25
cpu_intr_0_333:
	setx	0x460013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5c000  ! 4606: SAVE_R	save	%r23, %r0, %r26
T0_asi_reg_wr_203:
	mov	0x15, %r14
	.word 0xf6f389e0  ! 4607: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_0_334:
	setx	0x460117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe50000  ! 4613: SAVE_R	save	%r20, %r0, %r31
	.word 0xbd643801  ! 4615: MOVcc_I	<illegal instruction>
	.word 0xb734f001  ! 4616: SRLX_I	srlx	%r19, 0x0001, %r27
	.word 0xbfe4e175  ! 4618: SAVE_I	save	%r19, 0x0001, %r31
cpu_intr_0_335:
	setx	0x470223, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_336:
	setx	0x46032b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_373:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_373), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb9e5214c  ! 4622: SAVE_I	save	%r20, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_337:
	setx	0x460332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a007  ! 4628: SAVE_I	save	%r22, 0x0001, %r29
cpu_intr_0_338:
	setx	0x450204, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_194:
	mov	0x22, %r14
	.word 0xf2db84a0  ! 4630: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e4a1f6  ! 4636: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3e460aa  ! 4638: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb1e58000  ! 4639: SAVE_R	save	%r22, %r0, %r24
	.word 0xb5e44000  ! 4640: SAVE_R	save	%r17, %r0, %r26
	.word 0xb9e4e0e6  ! 4642: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbbe56127  ! 4647: SAVE_I	save	%r21, 0x0001, %r29
iob_intr_0_374:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_374), 16, 16)) -> intp(0, 0, 1e)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe4c000  ! 4655: SAVE_R	save	%r19, %r0, %r31
	.word 0xbfe4a1c0  ! 4658: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbde44000  ! 4660: SAVE_R	save	%r17, %r0, %r30
	.word 0xbbe5c000  ! 4661: SAVE_R	save	%r23, %r0, %r29
iob_intr_0_375:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_375), 16, 16)) -> intp(0, 0, 14)
cpu_intr_0_339:
	setx	0x44033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde58000  ! 4664: SAVE_R	save	%r22, %r0, %r30
	.word 0xb1e5c000  ! 4665: SAVE_R	save	%r23, %r0, %r24
iob_intr_0_376:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_376), 16, 16)) -> intp(0, 0, 15)
T0_asi_reg_rd_195:
	mov	0x3c0, %r14
	.word 0xfadb8e40  ! 4668: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbfe58000  ! 4670: SAVE_R	save	%r22, %r0, %r31
	.word 0xb6b4c000  ! 4675: SUBCcc_R	orncc 	%r19, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_377:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_377), 16, 16)) -> intp(0, 0, 39)
	.word 0xbfe4a1a2  ! 4681: SAVE_I	save	%r18, 0x0001, %r31
cpu_intr_0_340:
	setx	0x47010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe42006  ! 4686: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbfe50000  ! 4687: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_wr_204:
	mov	0x3c4, %r14
	.word 0xf4f38e40  ! 4688: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_0_378:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_378), 16, 16)) -> intp(0, 0, b)
T0_asi_reg_rd_196:
	mov	0x30, %r14
	.word 0xfcdb89e0  ! 4692: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb1e40000  ! 4693: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_341:
	setx	0x440330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe50000  ! 4700: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_342:
	setx	0x470010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcbd4000  ! 4706: XNORcc_R	xnorcc 	%r21, %r0, %r30
	.word 0xb92d9000  ! 4708: SLLX_R	sllx	%r22, %r0, %r28
iob_intr_0_379:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_379), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb1e5e037  ! 4712: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb5e54000  ! 4716: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_wr_205:
	mov	0x33, %r14
	.word 0xfaf38e60  ! 4720: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_0_343:
	setx	0x460136, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_380:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_380), 16, 16)) -> intp(0, 0, 1f)
	.word 0xbde52047  ! 4724: SAVE_I	save	%r20, 0x0001, %r30
cpu_intr_0_344:
	setx	0x460329, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_206:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 4729: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb13cb001  ! 4730: SRAX_I	srax	%r18, 0x0001, %r24
	.word 0xb1e54000  ! 4731: SAVE_R	save	%r21, %r0, %r24
	.word 0xb13d1000  ! 4737: SRAX_R	srax	%r20, %r0, %r24
	.word 0xb9e5c000  ! 4738: SAVE_R	save	%r23, %r0, %r28
	.word 0xb7e4e08c  ! 4739: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde52102  ! 4740: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbde420a1  ! 4741: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_rd_197:
	mov	0x25, %r14
	.word 0xfedb8e60  ! 4742: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb1e58000  ! 4743: SAVE_R	save	%r22, %r0, %r24
iob_intr_0_381:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_381), 16, 16)) -> intp(0, 0, 19)
	.word 0xb5e4a0ba  ! 4745: SAVE_I	save	%r18, 0x0001, %r26
cpu_intr_0_345:
	setx	0x440104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e560b9  ! 4749: SAVE_I	save	%r21, 0x0001, %r28
cpu_intr_0_346:
	setx	0x45031a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_382:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_382), 16, 16)) -> intp(0, 0, 39)
	.word 0xbbe42181  ! 4758: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_383:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_383), 16, 16)) -> intp(0, 0, 1d)
cpu_intr_0_347:
	setx	0x450109, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_198:
	mov	0x32, %r14
	.word 0xfadb8e40  ! 4763: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_348:
	setx	0x450033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e50000  ! 4767: SAVE_R	save	%r20, %r0, %r26
	.word 0xb7e44000  ! 4768: SAVE_R	save	%r17, %r0, %r27
	.word 0xbbe560b5  ! 4769: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb68421a4  ! 4771: ADDcc_I	addcc 	%r16, 0x01a4, %r27
	.word 0xb1e5a01c  ! 4772: SAVE_I	save	%r22, 0x0001, %r24
cpu_intr_0_349:
	setx	0x460130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b52120  ! 4776: ORNcc_I	orncc 	%r20, 0x0120, %r27
iob_intr_0_384:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_384), 16, 16)) -> intp(0, 0, 19)
	.word 0xb1e5a105  ! 4781: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb7e5a0cc  ! 4783: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbfe5c000  ! 4784: SAVE_R	save	%r23, %r0, %r31
	.word 0xb3641800  ! 4785: MOVcc_R	<illegal instruction>
T0_asi_reg_wr_207:
	mov	0x21, %r14
	.word 0xf4f38e80  ! 4786: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_0_385:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_385), 16, 16)) -> intp(0, 0, 19)
cpu_intr_0_350:
	setx	0x470105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e1a7  ! 4794: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_wr_208:
	mov	0x22, %r14
	.word 0xfcf38e60  ! 4796: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T0_asi_reg_rd_199:
	mov	0x3c6, %r14
	.word 0xf4db8e40  ! 4799: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_0_351:
	setx	0x47030b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_352:
	setx	0x45010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_209:
	mov	0x24, %r14
	.word 0xfcf38e80  ! 4806: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb8c50000  ! 4807: ADDCcc_R	addccc 	%r20, %r0, %r28
T0_asi_reg_rd_200:
	mov	0x3c4, %r14
	.word 0xfedb8e80  ! 4809: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_0_353:
	setx	0x470237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e40000  ! 4813: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_wr_210:
	mov	0xb, %r14
	.word 0xf4f38e40  ! 4814: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_354:
	setx	0x44023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8c8000  ! 4818: ANDcc_R	andcc 	%r18, %r0, %r30
	.word 0xbde58000  ! 4819: SAVE_R	save	%r22, %r0, %r30
T0_asi_reg_wr_211:
	mov	0xa, %r14
	.word 0xfcf384a0  ! 4822: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_0_386:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_386), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb9e5c000  ! 4826: SAVE_R	save	%r23, %r0, %r28
	.word 0xb5e48000  ! 4833: SAVE_R	save	%r18, %r0, %r26
	.word 0xb7e4c000  ! 4834: SAVE_R	save	%r19, %r0, %r27
iob_intr_0_387:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_387), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_355:
	setx	0x45011f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_388:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_388), 16, 16)) -> intp(0, 0, 2c)
cpu_intr_0_356:
	setx	0x45031c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_357:
	setx	0x44003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a147  ! 4852: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb7e5a102  ! 4854: SAVE_I	save	%r22, 0x0001, %r27
T0_asi_reg_rd_201:
	mov	0x21, %r14
	.word 0xf0db8e60  ! 4855: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbeb50000  ! 4858: SUBCcc_R	orncc 	%r20, %r0, %r31
	.word 0xb7500000  ! 4861: RDPR_TPC	<illegal instruction>
cpu_intr_0_358:
	setx	0x440329, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_359:
	setx	0x450118, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_202:
	mov	0x3c8, %r14
	.word 0xfcdb8400  ! 4866: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb72cb001  ! 4867: SLLX_I	sllx	%r18, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3359000  ! 4870: SRLX_R	srlx	%r22, %r0, %r25
	.word 0xb9e56015  ! 4872: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbbe50000  ! 4876: SAVE_R	save	%r20, %r0, %r29
	.word 0xb9e4a05b  ! 4878: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb9e58000  ! 4879: SAVE_R	save	%r22, %r0, %r28
T0_asi_reg_wr_212:
	mov	0x17, %r14
	.word 0xf8f38e80  ! 4880: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xbde42138  ! 4881: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbde56086  ! 4882: SAVE_I	save	%r21, 0x0001, %r30
iob_intr_0_389:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_389), 16, 16)) -> intp(0, 0, 25)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_rd_203:
	mov	0x2f, %r14
	.word 0xf2db8e80  ! 4890: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb9e54000  ! 4896: SAVE_R	save	%r21, %r0, %r28
	.word 0xb3e5a08c  ! 4897: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_360:
	setx	0x470318, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_204:
	mov	0x29, %r14
	.word 0xfedb84a0  ! 4902: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb4340000  ! 4903: SUBC_R	orn 	%r16, %r0, %r26
T0_asi_reg_wr_213:
	mov	0x32, %r14
	.word 0xf2f38400  ! 4904: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_361:
	setx	0x470228, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_362:
	setx	0x460207, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_205:
	mov	0x3c8, %r14
	.word 0xfedb8e40  ! 4909: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_0_363:
	setx	0x46010d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_364:
	setx	0x440225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde58000  ! 4915: SAVE_R	save	%r22, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_214:
	mov	0x4, %r14
	.word 0xfef38e80  ! 4917: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_0_365:
	setx	0x460113, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_366:
	setx	0x47022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e54000  ! 4923: SAVE_R	save	%r21, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb83d4000  ! 4926: XNOR_R	xnor 	%r21, %r0, %r28
	.word 0xb3e5613a  ! 4928: SAVE_I	save	%r21, 0x0001, %r25
cpu_intr_0_367:
	setx	0x450103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8c8000  ! 4930: ANDcc_R	andcc 	%r18, %r0, %r30
iob_intr_0_390:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_390), 16, 16)) -> intp(0, 0, 19)
	.word 0xb9e4a0eb  ! 4942: SAVE_I	save	%r18, 0x0001, %r28
cpu_intr_0_368:
	setx	0x470012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e44000  ! 4944: SAVE_R	save	%r17, %r0, %r25
iob_intr_0_391:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_391), 16, 16)) -> intp(0, 0, 3a)
cpu_intr_0_369:
	setx	0x450000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbead6057  ! 4950: ANDNcc_I	andncc 	%r21, 0x0057, %r31
	.word 0xb7e44000  ! 4955: SAVE_R	save	%r17, %r0, %r27
	.word 0xb9e4a10f  ! 4959: SAVE_I	save	%r18, 0x0001, %r28
iob_intr_0_392:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_392), 16, 16)) -> intp(0, 0, 7)
T0_asi_reg_rd_206:
	mov	0x3c2, %r14
	.word 0xfcdb89e0  ! 4965: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb3e58000  ! 4966: SAVE_R	save	%r22, %r0, %r25
T0_asi_reg_rd_207:
	mov	0x2f, %r14
	.word 0xf0db84a0  ! 4968: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_0_370:
	setx	0x450135, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_371:
	setx	0x460010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e00f  ! 4973: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xba0d0000  ! 4975: AND_R	and 	%r20, %r0, %r29
T0_asi_reg_rd_208:
	mov	0x21, %r14
	.word 0xf6db8e60  ! 4978: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T0_asi_reg_rd_209:
	mov	0x3c5, %r14
	.word 0xfcdb8e60  ! 4981: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_0_393:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_393), 16, 16)) -> intp(0, 0, 11)
T0_asi_reg_wr_215:
	mov	0x33, %r14
	.word 0xf0f38e60  ! 4983: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb1e58000  ! 4984: SAVE_R	save	%r22, %r0, %r24
T0_asi_reg_wr_216:
	mov	0x26, %r14
	.word 0xf8f38e80  ! 4985: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb204e1c0  ! 4988: ADD_I	add 	%r19, 0x01c0, %r25
	.word 0xbfe5202e  ! 4992: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_rd_210:
	mov	0x3c4, %r14
	.word 0xf2db8e40  ! 4994: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
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
	setx	0x1a0037, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_1:
	setx	0x190108, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_0:
	mov	0x1, %r14
	.word 0xfcdb8e40  ! 7: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_3_2:
	setx	0x1f020e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_1:
	mov	0x29, %r14
	.word 0xfadb8400  ! 9: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_0), 16, 16)) -> intp(3, 0, 2)
	ta	T_CHANGE_TO_TL1
iob_intr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_1), 16, 16)) -> intp(3, 0, 30)
	.word 0xf8a50020  ! 15: STWA_R	stwa	%r28, [%r20 + %r0] 0x01
T3_asi_reg_rd_2:
	mov	0x3c5, %r14
	.word 0xf6db8e60  ! 16: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T3_asi_reg_wr_0:
	mov	0x1a, %r14
	.word 0xf4f38e40  ! 17: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_3_3:
	setx	0x1d0119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_4:
	setx	0x1d0133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a5c020  ! 20: STWA_R	stwa	%r25, [%r23 + %r0] 0x01
cpu_intr_3_5:
	setx	0x1c031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a5e108  ! 23: STWA_I	stwa	%r25, [%r23 + 0x0108] %asi
T3_asi_reg_wr_1:
	mov	0x29, %r14
	.word 0xfaf38e40  ! 24: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfea5c020  ! 25: STWA_R	stwa	%r31, [%r23 + %r0] 0x01
T3_asi_reg_wr_2:
	mov	0x3c0, %r14
	.word 0xf6f384a0  ! 26: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf82da1e3  ! 27: STB_I	stb	%r28, [%r22 + 0x01e3]
iob_intr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_2), 16, 16)) -> intp(3, 0, 3c)
cpu_intr_3_6:
	setx	0x1d0113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_3), 16, 16)) -> intp(3, 0, a)
	.word 0xb13c8000  ! 33: SRA_R	sra 	%r18, %r0, %r24
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983a40  ! 34: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a40, %hpstate
	.word 0xb8344000  ! 36: SUBC_R	orn 	%r17, %r0, %r28
	.word 0xf2b56108  ! 41: STHA_I	stha	%r25, [%r21 + 0x0108] %asi
cpu_intr_3_7:
	setx	0x1e0032, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_8:
	setx	0x1d001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4bca07e  ! 45: XNORcc_I	xnorcc 	%r18, 0x007e, %r26
T3_asi_reg_wr_3:
	mov	0x5, %r14
	.word 0xfef38e60  ! 49: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_3_9:
	setx	0x1e032a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_10:
	setx	0x1f0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a44020  ! 56: STWA_R	stwa	%r25, [%r17 + %r0] 0x01
cpu_intr_3_11:
	setx	0x1e0036, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_4), 16, 16)) -> intp(3, 0, 1c)
	.word 0xf625c000  ! 60: STW_R	stw	%r27, [%r23 + %r0]
iob_intr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_5), 16, 16)) -> intp(3, 0, 3b)
cpu_intr_3_12:
	setx	0x1d0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9641800  ! 63: MOVcc_R	<illegal instruction>
cpu_intr_3_13:
	setx	0x1f033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf624a02e  ! 67: STW_I	stw	%r27, [%r18 + 0x002e]
T3_asi_reg_rd_3:
	mov	0x5, %r14
	.word 0xf0db8e80  ! 68: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_3_14:
	setx	0x1e021f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_15:
	setx	0x1e001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe25219b  ! 71: STW_I	stw	%r31, [%r20 + 0x019b]
iob_intr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_6), 16, 16)) -> intp(3, 0, 0)
cpu_intr_3_16:
	setx	0x1e0314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb2c2001  ! 75: SLL_I	sll 	%r16, 0x0001, %r29
	.word 0xf02c0000  ! 79: STB_R	stb	%r24, [%r16 + %r0]
	.word 0xb8458000  ! 82: ADDC_R	addc 	%r22, %r0, %r28
	.word 0xf02d8000  ! 83: STB_R	stb	%r24, [%r22 + %r0]
	.word 0xf6b56130  ! 86: STHA_I	stha	%r27, [%r21 + 0x0130] %asi
	.word 0xfe354000  ! 87: STH_R	sth	%r31, [%r21 + %r0]
	.word 0xf8a5a046  ! 88: STWA_I	stwa	%r28, [%r22 + 0x0046] %asi
	.word 0xfaf5e172  ! 89: STXA_I	stxa	%r29, [%r23 + 0x0172] %asi
	.word 0xfcb5a0d3  ! 90: STHA_I	stha	%r30, [%r22 + 0x00d3] %asi
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_4:
	mov	0x24, %r14
	.word 0xfaf38400  ! 92: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T3_asi_reg_wr_5:
	mov	0x32, %r14
	.word 0xf4f384a0  ! 93: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T3_asi_reg_rd_4:
	mov	0x1b, %r14
	.word 0xf6db8e80  ! 94: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xba15e1b8  ! 95: OR_I	or 	%r23, 0x01b8, %r29
	ta	T_CHANGE_TO_TL0
	.word 0xf6744000  ! 99: STX_R	stx	%r27, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
cpu_intr_3_17:
	setx	0x1f0326, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_6:
	mov	0x3c0, %r14
	.word 0xfef389e0  ! 105: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_5:
	mov	0x0, %r14
	.word 0xfadb8e80  ! 111: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb33c1000  ! 112: SRAX_R	srax	%r16, %r0, %r25
T3_asi_reg_rd_6:
	mov	0x26, %r14
	.word 0xf8db8e60  ! 113: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T3_asi_reg_wr_7:
	mov	0xa, %r14
	.word 0xf6f38e40  ! 120: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_7), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_18:
	setx	0x1e0314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a48020  ! 125: STWA_R	stwa	%r27, [%r18 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
cpu_intr_3_19:
	setx	0x1e0202, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_20:
	setx	0x1d033d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_8), 16, 16)) -> intp(3, 0, 2b)
	.word 0xfa2d2110  ! 137: STB_I	stb	%r29, [%r20 + 0x0110]
	.word 0xfca5c020  ! 138: STWA_R	stwa	%r30, [%r23 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_8:
	mov	0x5, %r14
	.word 0xfcf38e60  ! 144: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T3_asi_reg_rd_7:
	mov	0x3c5, %r14
	.word 0xf2db8e40  ! 145: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_9), 16, 16)) -> intp(3, 0, 35)
cpu_intr_3_21:
	setx	0x1f0007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a50020  ! 152: STWA_R	stwa	%r25, [%r20 + %r0] 0x01
	.word 0xb134c000  ! 153: SRL_R	srl 	%r19, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
iob_intr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_10), 16, 16)) -> intp(3, 0, 1)
iob_intr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_11), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf0744000  ! 165: STX_R	stx	%r24, [%r17 + %r0]
	.word 0xf0ad61c6  ! 166: STBA_I	stba	%r24, [%r21 + 0x01c6] %asi
cpu_intr_3_22:
	setx	0x1f0321, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_9:
	mov	0x11, %r14
	.word 0xf4f38e60  ! 174: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf675614f  ! 176: STX_I	stx	%r27, [%r21 + 0x014f]
	ta	T_CHANGE_HPRIV
cpu_intr_3_23:
	setx	0x1f0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a5c020  ! 180: STWA_R	stwa	%r28, [%r23 + %r0] 0x01
	.word 0xf2244000  ! 181: STW_R	stw	%r25, [%r17 + %r0]
cpu_intr_3_24:
	setx	0x1c0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b4c020  ! 183: STHA_R	stha	%r24, [%r19 + %r0] 0x01
	.word 0xfe744000  ! 184: STX_R	stx	%r31, [%r17 + %r0]
T3_asi_reg_wr_10:
	mov	0xd, %r14
	.word 0xf2f38400  ! 187: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_12), 16, 16)) -> intp(3, 0, 1d)
	.word 0xfc358000  ! 193: STH_R	sth	%r30, [%r22 + %r0]
iob_intr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_13), 16, 16)) -> intp(3, 0, 35)
	ta	T_CHANGE_TO_TL1
iob_intr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_14), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf22da1d3  ! 203: STB_I	stb	%r25, [%r22 + 0x01d3]
	.word 0xf62dc000  ! 206: STB_R	stb	%r27, [%r23 + %r0]
T3_asi_reg_rd_8:
	mov	0x4, %r14
	.word 0xfadb8400  ! 208: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_3_25:
	setx	0x1d0218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a5216f  ! 210: STWA_I	stwa	%r28, [%r20 + 0x016f] %asi
iob_intr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_15), 16, 16)) -> intp(3, 0, 7)
	.word 0xbab5c000  ! 215: ORNcc_R	orncc 	%r23, %r0, %r29
	.word 0xa1902001  ! 217: WRPR_GL_I	wrpr	%r0, 0x0001, %-
T3_asi_reg_wr_11:
	mov	0x3c4, %r14
	.word 0xfef38e80  ! 219: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbf3c3001  ! 220: SRAX_I	srax	%r16, 0x0001, %r31
	.word 0xfaade062  ! 223: STBA_I	stba	%r29, [%r23 + 0x0062] %asi
	.word 0xf0ac6084  ! 225: STBA_I	stba	%r24, [%r17 + 0x0084] %asi
	setx	data_start_4, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983f5a  ! 226: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f5a, %hpstate
	.word 0xf0f521ed  ! 227: STXA_I	stxa	%r24, [%r20 + 0x01ed] %asi
cpu_intr_3_26:
	setx	0x1c0238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8f5e18f  ! 231: STXA_I	stxa	%r28, [%r23 + 0x018f] %asi
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_16), 16, 16)) -> intp(3, 0, 0)
T3_asi_reg_rd_9:
	mov	0x13, %r14
	.word 0xf8db8e80  ! 234: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_3_27:
	setx	0x1c0315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3df001  ! 239: SRAX_I	srax	%r23, 0x0001, %r30
T3_asi_reg_rd_10:
	mov	0x2, %r14
	.word 0xfedb8e40  ! 241: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_28:
	setx	0x1f0203, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_29:
	setx	0x1f003b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_17), 16, 16)) -> intp(3, 0, 37)
	.word 0xfea58020  ! 246: STWA_R	stwa	%r31, [%r22 + %r0] 0x01
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_11:
	mov	0x2a, %r14
	.word 0xf6db8400  ! 248: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf82421c2  ! 250: STW_I	stw	%r28, [%r16 + 0x01c2]
T3_asi_reg_rd_12:
	mov	0x3c6, %r14
	.word 0xf6db84a0  ! 253: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	ta	T_CHANGE_TO_TL0
cpu_intr_3_30:
	setx	0x1d0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8ca155  ! 258: ANDcc_I	andcc 	%r18, 0x0155, %r30
cpu_intr_3_31:
	setx	0x1f010a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_32:
	setx	0x1d0310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2ce1cd  ! 264: STB_I	stb	%r31, [%r19 + 0x01cd]
T3_asi_reg_rd_13:
	mov	0x31, %r14
	.word 0xf0db8e60  ! 265: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xfc748000  ! 270: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xf23561fd  ! 271: STH_I	sth	%r25, [%r21 + 0x01fd]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf62d607f  ! 274: STB_I	stb	%r27, [%r21 + 0x007f]
iob_intr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_18), 16, 16)) -> intp(3, 0, 10)
	.word 0xf4f4e122  ! 276: STXA_I	stxa	%r26, [%r19 + 0x0122] %asi
	.word 0xfea5e1df  ! 277: STWA_I	stwa	%r31, [%r23 + 0x01df] %asi
T3_asi_reg_wr_12:
	mov	0x2b, %r14
	.word 0xf6f38e40  ! 278: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf4a5e069  ! 279: STWA_I	stwa	%r26, [%r23 + 0x0069] %asi
	.word 0xf2ad60bf  ! 280: STBA_I	stba	%r25, [%r21 + 0x00bf] %asi
	.word 0xf434c000  ! 283: STH_R	sth	%r26, [%r19 + %r0]
cpu_intr_3_33:
	setx	0x1c0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2d21dd  ! 290: STB_I	stb	%r29, [%r20 + 0x01dd]
cpu_intr_3_34:
	setx	0x1f032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82ce1d3  ! 296: STB_I	stb	%r28, [%r19 + 0x01d3]
	.word 0xf424e067  ! 297: STW_I	stw	%r26, [%r19 + 0x0067]
iob_intr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_19), 16, 16)) -> intp(3, 0, 1e)
iob_intr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_20), 16, 16)) -> intp(3, 0, 35)
iob_intr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_21), 16, 16)) -> intp(3, 0, 26)
	.word 0xfc24e0d5  ! 306: STW_I	stw	%r30, [%r19 + 0x00d5]
iob_intr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_22), 16, 16)) -> intp(3, 0, 37)
	.word 0xf4250000  ! 308: STW_R	stw	%r26, [%r20 + %r0]
	.word 0xfc25c000  ! 309: STW_R	stw	%r30, [%r23 + %r0]
	.word 0xf2ad4020  ! 310: STBA_R	stba	%r25, [%r21 + %r0] 0x01
	.word 0xf0754000  ! 312: STX_R	stx	%r24, [%r21 + %r0]
	.word 0x83952126  ! 313: WRPR_TNPC_I	wrpr	%r20, 0x0126, %tnpc
	.word 0xfaf4601c  ! 316: STXA_I	stxa	%r29, [%r17 + 0x001c] %asi
	ta	T_CHANGE_TO_TL1
iob_intr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_23), 16, 16)) -> intp(3, 0, 32)
iob_intr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_24), 16, 16)) -> intp(3, 0, 3f)
cpu_intr_3_35:
	setx	0x1f033b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_13:
	mov	0x1f, %r14
	.word 0xfaf38e60  ! 327: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf425c000  ! 329: STW_R	stw	%r26, [%r23 + %r0]
iob_intr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_25), 16, 16)) -> intp(3, 0, 32)
	.word 0xbc0c6068  ! 334: AND_I	and 	%r17, 0x0068, %r30
	.word 0xfc758000  ! 337: STX_R	stx	%r30, [%r22 + %r0]
T3_asi_reg_rd_14:
	mov	0x0, %r14
	.word 0xf2db8e40  ! 339: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf6acc020  ! 341: STBA_R	stba	%r27, [%r19 + %r0] 0x01
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982f00  ! 346: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f00, %hpstate
	.word 0xfcb46188  ! 347: STHA_I	stha	%r30, [%r17 + 0x0188] %asi
	.word 0xfe2561e8  ! 348: STW_I	stw	%r31, [%r21 + 0x01e8]
iob_intr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_26), 16, 16)) -> intp(3, 0, 30)
	.word 0xf634e00a  ! 350: STH_I	sth	%r27, [%r19 + 0x000a]
cpu_intr_3_36:
	setx	0x1d0004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca4e055  ! 354: STWA_I	stwa	%r30, [%r19 + 0x0055] %asi
	.word 0xfcf4a024  ! 355: STXA_I	stxa	%r30, [%r18 + 0x0024] %asi
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_14:
	mov	0x2a, %r14
	.word 0xf0f38e40  ! 367: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_27), 16, 16)) -> intp(3, 0, 3d)
	.word 0xb23d600c  ! 370: XNOR_I	xnor 	%r21, 0x000c, %r25
iob_intr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_28), 16, 16)) -> intp(3, 0, 2a)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_37:
	setx	0x1c0105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b4a154  ! 375: STHA_I	stha	%r24, [%r18 + 0x0154] %asi
	ta	T_CHANGE_TO_TL1
iob_intr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_29), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_38:
	setx	0x1d000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2248000  ! 379: STW_R	stw	%r25, [%r18 + %r0]
cpu_intr_3_39:
	setx	0x1d0027, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_15:
	mov	0x8, %r14
	.word 0xf2db8e40  ! 384: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf8746002  ! 385: STX_I	stx	%r28, [%r17 + 0x0002]
	.word 0xfeada039  ! 386: STBA_I	stba	%r31, [%r22 + 0x0039] %asi
cpu_intr_3_40:
	setx	0x1f0205, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_41:
	setx	0x1d0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcf4a0b8  ! 396: STXA_I	stxa	%r30, [%r18 + 0x00b8] %asi
iob_intr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_30), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_rd_16:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 400: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfeb56182  ! 411: STHA_I	stha	%r31, [%r21 + 0x0182] %asi
iob_intr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_31), 16, 16)) -> intp(3, 0, d)
iob_intr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_32), 16, 16)) -> intp(3, 0, a)
	.word 0xfab52034  ! 416: STHA_I	stha	%r29, [%r20 + 0x0034] %asi
	.word 0xfa34c000  ! 417: STH_R	sth	%r29, [%r19 + %r0]
cpu_intr_3_42:
	setx	0x1f0232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02ca0fe  ! 420: STB_I	stb	%r24, [%r18 + 0x00fe]
	.word 0xfa344000  ! 422: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xba45c000  ! 423: ADDC_R	addc 	%r23, %r0, %r29
	.word 0xfc35e0bd  ! 424: STH_I	sth	%r30, [%r23 + 0x00bd]
iob_intr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_33), 16, 16)) -> intp(3, 0, 10)
T3_asi_reg_wr_15:
	mov	0xd, %r14
	.word 0xf2f38e80  ! 431: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T3_asi_reg_rd_17:
	mov	0x21, %r14
	.word 0xf0db89e0  ! 432: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xfea5c020  ! 435: STWA_R	stwa	%r31, [%r23 + %r0] 0x01
iob_intr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_34), 16, 16)) -> intp(3, 0, 36)
T3_asi_reg_rd_18:
	mov	0x37, %r14
	.word 0xf8db8e80  ! 442: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf474c000  ! 443: STX_R	stx	%r26, [%r19 + %r0]
	.word 0xfa354000  ! 444: STH_R	sth	%r29, [%r21 + %r0]
	.word 0xf02c0000  ! 446: STB_R	stb	%r24, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0xf4a5e154  ! 451: STWA_I	stwa	%r26, [%r23 + 0x0154] %asi
	.word 0xb57d8400  ! 452: MOVR_R	movre	%r22, %r0, %r26
iob_intr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_35), 16, 16)) -> intp(3, 0, 1a)
T3_asi_reg_wr_16:
	mov	0x9, %r14
	.word 0xfef38e40  ! 459: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbd359000  ! 460: SRLX_R	srlx	%r22, %r0, %r30
iob_intr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_36), 16, 16)) -> intp(3, 0, 37)
	.word 0xf4b5e18d  ! 462: STHA_I	stha	%r26, [%r23 + 0x018d] %asi
T3_asi_reg_wr_17:
	mov	0x29, %r14
	.word 0xf6f38e80  ! 465: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf2754000  ! 468: STX_R	stx	%r25, [%r21 + %r0]
iob_intr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_37), 16, 16)) -> intp(3, 0, 3d)
iob_intr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_38), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_39), 16, 16)) -> intp(3, 0, 3e)
	.word 0xfaac4020  ! 474: STBA_R	stba	%r29, [%r17 + %r0] 0x01
iob_intr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_40), 16, 16)) -> intp(3, 0, 3e)
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_19:
	mov	0x3c5, %r14
	.word 0xf6db89e0  ! 478: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T3_asi_reg_wr_18:
	mov	0x3c0, %r14
	.word 0xf8f38e80  ! 479: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xfa246022  ! 483: STW_I	stw	%r29, [%r17 + 0x0022]
iob_intr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_41), 16, 16)) -> intp(3, 0, 14)
	.word 0xf62ce02c  ! 485: STB_I	stb	%r27, [%r19 + 0x002c]
iob_intr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_42), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_43:
	setx	0x22022e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_44:
	setx	0x220019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb93c7001  ! 490: SRAX_I	srax	%r17, 0x0001, %r28
	.word 0xb624a0c5  ! 491: SUB_I	sub 	%r18, 0x00c5, %r27
	.word 0xf4a4c020  ! 494: STWA_R	stwa	%r26, [%r19 + %r0] 0x01
iob_intr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_43), 16, 16)) -> intp(3, 0, 18)
	.word 0xbe450000  ! 498: ADDC_R	addc 	%r20, %r0, %r31
	.word 0xf2758000  ! 500: STX_R	stx	%r25, [%r22 + %r0]
iob_intr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_44), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_rd_20:
	mov	0x3c7, %r14
	.word 0xfedb8e40  ! 502: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_wr_19:
	mov	0x1e, %r14
	.word 0xf0f38400  ! 503: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_3_45:
	setx	0x23012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf475c000  ! 508: STX_R	stx	%r26, [%r23 + %r0]
iob_intr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_45), 16, 16)) -> intp(3, 0, 38)
	.word 0xf0258000  ! 512: STW_R	stw	%r24, [%r22 + %r0]
	.word 0xbf7cc400  ! 513: MOVR_R	movre	%r19, %r0, %r31
	.word 0xf8b58020  ! 516: STHA_R	stha	%r28, [%r22 + %r0] 0x01
	ta	T_CHANGE_HPRIV
cpu_intr_3_46:
	setx	0x220027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a461ec  ! 522: STWA_I	stwa	%r26, [%r17 + 0x01ec] %asi
T3_asi_reg_wr_20:
	mov	0x3c0, %r14
	.word 0xfcf38e60  ! 525: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_46), 16, 16)) -> intp(3, 0, 20)
	.word 0xf4350000  ! 529: STH_R	sth	%r26, [%r20 + %r0]
	ta	T_CHANGE_NONHPRIV
	.word 0xfc758000  ! 531: STX_R	stx	%r30, [%r22 + %r0]
T3_asi_reg_wr_21:
	mov	0x8, %r14
	.word 0xf2f38e40  ! 532: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_47), 16, 16)) -> intp(3, 0, e)
	.word 0xf62dc000  ! 536: STB_R	stb	%r27, [%r23 + %r0]
	.word 0xb2bc0000  ! 538: XNORcc_R	xnorcc 	%r16, %r0, %r25
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982802  ! 543: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0802, %hpstate
iob_intr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_48), 16, 16)) -> intp(3, 0, 2f)
	.word 0xfeb50020  ! 545: STHA_R	stha	%r31, [%r20 + %r0] 0x01
	.word 0xfab54020  ! 548: STHA_R	stha	%r29, [%r21 + %r0] 0x01
iob_intr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_49), 16, 16)) -> intp(3, 0, 33)
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983b1a  ! 553: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b1a, %hpstate
	.word 0xfe24e020  ! 558: STW_I	stw	%r31, [%r19 + 0x0020]
T3_asi_reg_wr_22:
	mov	0x2d, %r14
	.word 0xfef389e0  ! 563: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xfc2ce14a  ! 564: STB_I	stb	%r30, [%r19 + 0x014a]
iob_intr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_50), 16, 16)) -> intp(3, 0, 27)
	.word 0xfc74a006  ! 566: STX_I	stx	%r30, [%r18 + 0x0006]
	.word 0xa1902000  ! 568: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_47:
	setx	0x21023a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_21:
	mov	0x20, %r14
	.word 0xf8db8e40  ! 576: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfaa44020  ! 578: STWA_R	stwa	%r29, [%r17 + %r0] 0x01
iob_intr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_51), 16, 16)) -> intp(3, 0, b)
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_23:
	mov	0x33, %r14
	.word 0xf6f384a0  ! 585: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_3_48:
	setx	0x220326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a50020  ! 591: STWA_R	stwa	%r27, [%r20 + %r0] 0x01
iob_intr_3_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_52), 16, 16)) -> intp(3, 0, 3e)
	.word 0xb695a0d2  ! 594: ORcc_I	orcc 	%r22, 0x00d2, %r27
	.word 0xf8f46017  ! 595: STXA_I	stxa	%r28, [%r17 + 0x0017] %asi
	.word 0xbe9cc000  ! 600: XORcc_R	xorcc 	%r19, %r0, %r31
T3_asi_reg_rd_22:
	mov	0xd, %r14
	.word 0xfedb84a0  ! 601: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T3_asi_reg_rd_23:
	mov	0xa, %r14
	.word 0xf2db8400  ! 602: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xbe94e127  ! 608: ORcc_I	orcc 	%r19, 0x0127, %r31
	.word 0xb885e0bf  ! 609: ADDcc_I	addcc 	%r23, 0x00bf, %r28
iob_intr_3_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_53), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_49:
	setx	0x220329, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_24:
	mov	0x0, %r14
	.word 0xf6db8400  ! 614: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T3_asi_reg_rd_25:
	mov	0x1e, %r14
	.word 0xf4db8e40  ! 616: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb0bd2178  ! 618: XNORcc_I	xnorcc 	%r20, 0x0178, %r24
T3_asi_reg_wr_24:
	mov	0x31, %r14
	.word 0xfef38400  ! 626: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb01de1b3  ! 627: XOR_I	xor 	%r23, 0x01b3, %r24
T3_asi_reg_wr_25:
	mov	0xf, %r14
	.word 0xf6f38400  ! 631: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T3_asi_reg_rd_26:
	mov	0x3c2, %r14
	.word 0xf8db8e80  ! 634: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_3_50:
	setx	0x200335, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982a50  ! 640: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a50, %hpstate
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_27:
	mov	0x37, %r14
	.word 0xfcdb8e40  ! 642: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf0a50020  ! 643: STWA_R	stwa	%r24, [%r20 + %r0] 0x01
	.word 0xfeb50020  ! 644: STHA_R	stha	%r31, [%r20 + %r0] 0x01
iob_intr_3_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_54), 16, 16)) -> intp(3, 0, 37)
iob_intr_3_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_55), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_51:
	setx	0x22010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd7d8400  ! 650: MOVR_R	movre	%r22, %r0, %r30
iob_intr_3_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_56), 16, 16)) -> intp(3, 0, 27)
cpu_intr_3_52:
	setx	0x21010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea4a097  ! 656: STWA_I	stwa	%r31, [%r18 + 0x0097] %asi
T3_asi_reg_wr_26:
	mov	0x2c, %r14
	.word 0xfcf389e0  ! 657: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf2ad21d6  ! 658: STBA_I	stba	%r25, [%r20 + 0x01d6] %asi
iob_intr_3_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_57), 16, 16)) -> intp(3, 0, 2a)
cpu_intr_3_53:
	setx	0x20022a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_27:
	mov	0x26, %r14
	.word 0xfcf38e40  ! 667: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_54:
	setx	0x210223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf075201d  ! 670: STX_I	stx	%r24, [%r20 + 0x001d]
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983bd0  ! 675: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd0, %hpstate
	.word 0xf62520c7  ! 676: STW_I	stw	%r27, [%r20 + 0x00c7]
iob_intr_3_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_58), 16, 16)) -> intp(3, 0, 15)
cpu_intr_3_55:
	setx	0x220202, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_28:
	mov	0x3c1, %r14
	.word 0xf8db8e40  ! 687: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T3_asi_reg_wr_28:
	mov	0x1a, %r14
	.word 0xfcf38e80  ! 690: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983942  ! 693: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1942, %hpstate
	.word 0xf2b58020  ! 695: STHA_R	stha	%r25, [%r22 + %r0] 0x01
	.word 0xb61de0cb  ! 696: XOR_I	xor 	%r23, 0x00cb, %r27
T3_asi_reg_wr_29:
	mov	0xd, %r14
	.word 0xf8f38e80  ! 699: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xfcada01b  ! 701: STBA_I	stba	%r30, [%r22 + 0x001b] %asi
iob_intr_3_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_59), 16, 16)) -> intp(3, 0, 2d)
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983dda  ! 703: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dda, %hpstate
T3_asi_reg_wr_30:
	mov	0x3c2, %r14
	.word 0xf4f384a0  ! 704: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_3_56:
	setx	0x20032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfef5a145  ! 706: STXA_I	stxa	%r31, [%r22 + 0x0145] %asi
cpu_intr_3_57:
	setx	0x200136, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_60), 16, 16)) -> intp(3, 0, 3e)
	.word 0xbb3db001  ! 716: SRAX_I	srax	%r22, 0x0001, %r29
	.word 0xfeb5e1d3  ! 718: STHA_I	stha	%r31, [%r23 + 0x01d3] %asi
T3_asi_reg_wr_31:
	mov	0x3c0, %r14
	.word 0xfcf38e60  ! 719: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T3_asi_reg_wr_32:
	mov	0x3c1, %r14
	.word 0xf0f389e0  ! 720: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_3_58:
	setx	0x210215, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_59:
	setx	0x20013f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_61), 16, 16)) -> intp(3, 0, 3a)
	.word 0xbc8c0000  ! 727: ANDcc_R	andcc 	%r16, %r0, %r30
	ta	T_CHANGE_HPRIV
	.word 0x8994a145  ! 733: WRPR_TICK_I	wrpr	%r18, 0x0145, %tick
iob_intr_3_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_62), 16, 16)) -> intp(3, 0, 21)
	.word 0xf0adc020  ! 735: STBA_R	stba	%r24, [%r23 + %r0] 0x01
	.word 0xf6b5e105  ! 737: STHA_I	stha	%r27, [%r23 + 0x0105] %asi
iob_intr_3_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_63), 16, 16)) -> intp(3, 0, 23)
T3_asi_reg_rd_29:
	mov	0xf, %r14
	.word 0xf4db8e40  ! 746: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfcf52131  ! 751: STXA_I	stxa	%r30, [%r20 + 0x0131] %asi
T3_asi_reg_wr_33:
	mov	0x2d, %r14
	.word 0xf4f38e40  ! 753: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfa25e07c  ! 754: STW_I	stw	%r29, [%r23 + 0x007c]
cpu_intr_3_60:
	setx	0x20032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9641800  ! 757: MOVcc_R	<illegal instruction>
iob_intr_3_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_64), 16, 16)) -> intp(3, 0, 35)
	.word 0xfc350000  ! 760: STH_R	sth	%r30, [%r20 + %r0]
T3_asi_reg_rd_30:
	mov	0xd, %r14
	.word 0xf2db84a0  ! 761: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_3_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_65), 16, 16)) -> intp(3, 0, 3)
	.word 0xf825206a  ! 767: STW_I	stw	%r28, [%r20 + 0x006a]
	.word 0xf6acc020  ! 771: STBA_R	stba	%r27, [%r19 + %r0] 0x01
	.word 0xfc7461e2  ! 773: STX_I	stx	%r30, [%r17 + 0x01e2]
cpu_intr_3_61:
	setx	0x20000f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_31:
	mov	0x19, %r14
	.word 0xfedb8e40  ! 775: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_62:
	setx	0x21010d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_63:
	setx	0x220116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfead603c  ! 779: STBA_I	stba	%r31, [%r21 + 0x003c] %asi
T3_asi_reg_rd_32:
	mov	0x7, %r14
	.word 0xf0db8400  ! 786: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T3_asi_reg_rd_33:
	mov	0x2, %r14
	.word 0xf0db8e80  ! 787: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xfe24e12e  ! 788: STW_I	stw	%r31, [%r19 + 0x012e]
	.word 0xb49c4000  ! 789: XORcc_R	xorcc 	%r17, %r0, %r26
	.word 0xfc2c8000  ! 791: STB_R	stb	%r30, [%r18 + %r0]
	.word 0xb1643801  ! 794: MOVcc_I	<illegal instruction>
cpu_intr_3_64:
	setx	0x210203, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_65:
	setx	0x20030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8258000  ! 798: STW_R	stw	%r28, [%r22 + %r0]
T3_asi_reg_rd_34:
	mov	0x34, %r14
	.word 0xf4db8400  ! 799: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T3_asi_reg_wr_34:
	mov	0x3c0, %r14
	.word 0xfcf38e80  ! 801: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf0ad0020  ! 803: STBA_R	stba	%r24, [%r20 + %r0] 0x01
	.word 0xf0250000  ! 804: STW_R	stw	%r24, [%r20 + %r0]
cpu_intr_3_66:
	setx	0x200236, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_35:
	mov	0x3c7, %r14
	.word 0xf6db8e60  ! 808: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T3_asi_reg_rd_36:
	mov	0x0, %r14
	.word 0xfedb84a0  ! 809: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_3_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_66), 16, 16)) -> intp(3, 0, a)
cpu_intr_3_67:
	setx	0x220301, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_68:
	setx	0x210109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_67), 16, 16)) -> intp(3, 0, 37)
	.word 0xf4ad0020  ! 820: STBA_R	stba	%r26, [%r20 + %r0] 0x01
T3_asi_reg_wr_35:
	mov	0x3c5, %r14
	.word 0xf4f38e80  ! 822: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_3_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_68), 16, 16)) -> intp(3, 0, a)
iob_intr_3_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_69), 16, 16)) -> intp(3, 0, 38)
iob_intr_3_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_70), 16, 16)) -> intp(3, 0, 2f)
T3_asi_reg_rd_37:
	mov	0x3c2, %r14
	.word 0xfcdb89e0  ! 833: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xfeadc020  ! 834: STBA_R	stba	%r31, [%r23 + %r0] 0x01
cpu_intr_3_69:
	setx	0x200101, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf0ac60d3  ! 837: STBA_I	stba	%r24, [%r17 + 0x00d3] %asi
T3_asi_reg_rd_38:
	mov	0x23, %r14
	.word 0xf2db8e80  ! 839: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_3_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_71), 16, 16)) -> intp(3, 0, 34)
	.word 0xf8756106  ! 841: STX_I	stx	%r28, [%r21 + 0x0106]
	.word 0xfa2d4000  ! 842: STB_R	stb	%r29, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_72), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf434a0c7  ! 849: STH_I	sth	%r26, [%r18 + 0x00c7]
cpu_intr_3_70:
	setx	0x200331, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_73), 16, 16)) -> intp(3, 0, 29)
	ta	T_CHANGE_HPRIV
	.word 0xf6750000  ! 858: STX_R	stx	%r27, [%r20 + %r0]
T3_asi_reg_wr_36:
	mov	0x3c0, %r14
	.word 0xf8f38e40  ! 859: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T3_asi_reg_rd_39:
	mov	0x2f, %r14
	.word 0xf4db84a0  ! 860: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T3_asi_reg_wr_37:
	mov	0x3c8, %r14
	.word 0xfef384a0  ! 861: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xbc050000  ! 862: ADD_R	add 	%r20, %r0, %r30
	.word 0xfe242119  ! 866: STW_I	stw	%r31, [%r16 + 0x0119]
iob_intr_3_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_74), 16, 16)) -> intp(3, 0, 6)
T3_asi_reg_wr_38:
	mov	0x18, %r14
	.word 0xf8f389e0  ! 871: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_3_71:
	setx	0x20022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72c0000  ! 874: SLL_R	sll 	%r16, %r0, %r27
	.word 0xfe24a16c  ! 877: STW_I	stw	%r31, [%r18 + 0x016c]
	.word 0xf625c000  ! 878: STW_R	stw	%r27, [%r23 + %r0]
	.word 0xfab4c020  ! 879: STHA_R	stha	%r29, [%r19 + %r0] 0x01
	.word 0xfcb5208e  ! 880: STHA_I	stha	%r30, [%r20 + 0x008e] %asi
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_39:
	mov	0xf, %r14
	.word 0xfef38e60  ! 883: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf674c000  ! 885: STX_R	stx	%r27, [%r19 + %r0]
T3_asi_reg_wr_40:
	mov	0x21, %r14
	.word 0xfcf38e60  ! 887: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf4f5215b  ! 888: STXA_I	stxa	%r26, [%r20 + 0x015b] %asi
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_72:
	setx	0x20020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe358000  ! 898: STH_R	sth	%r31, [%r22 + %r0]
	.word 0xf02d8000  ! 899: STB_R	stb	%r24, [%r22 + %r0]
T3_asi_reg_rd_40:
	mov	0x10, %r14
	.word 0xf8db8e80  ! 901: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_3_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_75), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_73:
	setx	0x21012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc244000  ! 906: SUB_R	sub 	%r17, %r0, %r30
cpu_intr_3_74:
	setx	0x240004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf348000  ! 913: SRL_R	srl 	%r18, %r0, %r31
	.word 0xfe346154  ! 914: STH_I	sth	%r31, [%r17 + 0x0154]
	.word 0xb92c0000  ! 918: SLL_R	sll 	%r16, %r0, %r28
	.word 0xf6ada1dc  ! 922: STBA_I	stba	%r27, [%r22 + 0x01dc] %asi
iob_intr_3_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_76), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_wr_41:
	mov	0x3c7, %r14
	.word 0xf4f38400  ! 929: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_3_75:
	setx	0x25002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf87461a2  ! 934: STX_I	stx	%r28, [%r17 + 0x01a2]
	.word 0xf6a52126  ! 936: STWA_I	stwa	%r27, [%r20 + 0x0126] %asi
	.word 0xf0f5e16d  ! 937: STXA_I	stxa	%r24, [%r23 + 0x016d] %asi
	.word 0xfe3520b4  ! 939: STH_I	sth	%r31, [%r20 + 0x00b4]
	.word 0xb29d4000  ! 947: XORcc_R	xorcc 	%r21, %r0, %r25
	ta	T_CHANGE_HPRIV
cpu_intr_3_76:
	setx	0x25022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_42:
	mov	0xd, %r14
	.word 0xfaf38e40  ! 953: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_rd_41:
	mov	0x27, %r14
	.word 0xf4db8e40  ! 954: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf8f5e07e  ! 958: STXA_I	stxa	%r28, [%r23 + 0x007e] %asi
T3_asi_reg_rd_42:
	mov	0x34, %r14
	.word 0xfadb8400  ! 960: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbea5a17e  ! 965: SUBcc_I	subcc 	%r22, 0x017e, %r31
cpu_intr_3_77:
	setx	0x24002e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_43:
	mov	0xe, %r14
	.word 0xfcdb8e60  ! 968: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xfa2dc000  ! 969: STB_R	stb	%r29, [%r23 + %r0]
	.word 0xbe154000  ! 977: OR_R	or 	%r21, %r0, %r31
	ta	T_CHANGE_HPRIV
cpu_intr_3_78:
	setx	0x260320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1643801  ! 982: MOVcc_I	<illegal instruction>
cpu_intr_3_79:
	setx	0x260219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a54020  ! 984: STWA_R	stwa	%r28, [%r21 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
iob_intr_3_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_77), 16, 16)) -> intp(3, 0, 24)
iob_intr_3_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_78), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_rd_44:
	mov	0x3c5, %r14
	.word 0xf4db84a0  ! 989: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf2a54020  ! 991: STWA_R	stwa	%r25, [%r21 + %r0] 0x01
cpu_intr_3_80:
	setx	0x24033e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_81:
	setx	0x26003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62421d1  ! 994: STW_I	stw	%r27, [%r16 + 0x01d1]
cpu_intr_3_82:
	setx	0x270038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_79), 16, 16)) -> intp(3, 0, 2)
	.word 0xf4b50020  ! 997: STHA_R	stha	%r26, [%r20 + %r0] 0x01
iob_intr_3_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_80), 16, 16)) -> intp(3, 0, 38)
iob_intr_3_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_81), 16, 16)) -> intp(3, 0, 2)
cpu_intr_3_83:
	setx	0x260128, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_82), 16, 16)) -> intp(3, 0, 3)
	.word 0xfea40020  ! 1007: STWA_R	stwa	%r31, [%r16 + %r0] 0x01
T3_asi_reg_wr_43:
	mov	0x3c2, %r14
	.word 0xf0f38e60  ! 1010: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xfe758000  ! 1011: STX_R	stx	%r31, [%r22 + %r0]
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_44:
	mov	0xf, %r14
	.word 0xf8f384a0  ! 1014: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb5510000  ! 1016: RDPR_TICK	rdpr	%tick, %r26
	.word 0xf875606d  ! 1017: STX_I	stx	%r28, [%r21 + 0x006d]
T3_asi_reg_wr_45:
	mov	0x4, %r14
	.word 0xfcf38e80  ! 1019: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbaac0000  ! 1020: ANDNcc_R	andncc 	%r16, %r0, %r29
	.word 0xf8ac0020  ! 1022: STBA_R	stba	%r28, [%r16 + %r0] 0x01
	.word 0xbe3d2161  ! 1023: XNOR_I	xnor 	%r20, 0x0161, %r31
iob_intr_3_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_83), 16, 16)) -> intp(3, 0, 3d)
cpu_intr_3_84:
	setx	0x240339, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_84), 16, 16)) -> intp(3, 0, 8)
T3_asi_reg_wr_46:
	mov	0x33, %r14
	.word 0xf8f38e60  ! 1028: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf2a420fe  ! 1030: STWA_I	stwa	%r25, [%r16 + 0x00fe] %asi
	ta	T_CHANGE_TO_TL0
	.word 0xf624a150  ! 1034: STW_I	stw	%r27, [%r18 + 0x0150]
	.word 0xfa24a1c6  ! 1035: STW_I	stw	%r29, [%r18 + 0x01c6]
	.word 0xf2b5e130  ! 1037: STHA_I	stha	%r25, [%r23 + 0x0130] %asi
cpu_intr_3_85:
	setx	0x250118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf034c000  ! 1042: STH_R	sth	%r24, [%r19 + %r0]
	.word 0xfcac0020  ! 1045: STBA_R	stba	%r30, [%r16 + %r0] 0x01
cpu_intr_3_86:
	setx	0x27011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb4c020  ! 1047: STHA_R	stha	%r30, [%r19 + %r0] 0x01
	.word 0xb32cc000  ! 1049: SLL_R	sll 	%r19, %r0, %r25
	.word 0xf02c60ac  ! 1050: STB_I	stb	%r24, [%r17 + 0x00ac]
	.word 0xb4bcc000  ! 1052: XNORcc_R	xnorcc 	%r19, %r0, %r26
iob_intr_3_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_85), 16, 16)) -> intp(3, 0, 4)
	.word 0xf4258000  ! 1059: STW_R	stw	%r26, [%r22 + %r0]
iob_intr_3_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_86), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_87), 16, 16)) -> intp(3, 0, 19)
	.word 0xfa254000  ! 1062: STW_R	stw	%r29, [%r21 + %r0]
T3_asi_reg_wr_47:
	mov	0x3c7, %r14
	.word 0xf6f384a0  ! 1063: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_3_87:
	setx	0x24032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b5c020  ! 1065: STHA_R	stha	%r27, [%r23 + %r0] 0x01
	.word 0xf6adc020  ! 1066: STBA_R	stba	%r27, [%r23 + %r0] 0x01
cpu_intr_3_88:
	setx	0x250304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfef420be  ! 1069: STXA_I	stxa	%r31, [%r16 + 0x00be] %asi
	.word 0xb57ce401  ! 1072: MOVR_I	movre	%r19, 0x1, %r26
	.word 0xfe240000  ! 1073: STW_R	stw	%r31, [%r16 + %r0]
	.word 0xf4756048  ! 1074: STX_I	stx	%r26, [%r21 + 0x0048]
cpu_intr_3_89:
	setx	0x260215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba3cc000  ! 1076: XNOR_R	xnor 	%r19, %r0, %r29
	.word 0xf2740000  ! 1080: STX_R	stx	%r25, [%r16 + %r0]
	.word 0xfeac8020  ! 1083: STBA_R	stba	%r31, [%r18 + %r0] 0x01
	.word 0xfc352098  ! 1090: STH_I	sth	%r30, [%r20 + 0x0098]
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_90:
	setx	0x24033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a4a00c  ! 1094: STWA_I	stwa	%r26, [%r18 + 0x000c] %asi
	.word 0xfeb421dd  ! 1095: STHA_I	stha	%r31, [%r16 + 0x01dd] %asi
	.word 0xf4b54020  ! 1096: STHA_R	stha	%r26, [%r21 + %r0] 0x01
	.word 0xf8252153  ! 1098: STW_I	stw	%r28, [%r20 + 0x0153]
iob_intr_3_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_88), 16, 16)) -> intp(3, 0, 31)
cpu_intr_3_91:
	setx	0x250230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0744000  ! 1103: STX_R	stx	%r24, [%r17 + %r0]
	.word 0xf6a5c020  ! 1106: STWA_R	stwa	%r27, [%r23 + %r0] 0x01
	.word 0xf8a48020  ! 1108: STWA_R	stwa	%r28, [%r18 + %r0] 0x01
T3_asi_reg_rd_45:
	mov	0x19, %r14
	.word 0xfadb8e60  ! 1110: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_3_92:
	setx	0x260128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf83461e9  ! 1113: STH_I	sth	%r28, [%r17 + 0x01e9]
	.word 0xfc2de06c  ! 1115: STB_I	stb	%r30, [%r23 + 0x006c]
iob_intr_3_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_89), 16, 16)) -> intp(3, 0, 1d)
T3_asi_reg_rd_46:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 1119: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf6254000  ! 1120: STW_R	stw	%r27, [%r21 + %r0]
T3_asi_reg_rd_47:
	mov	0x38, %r14
	.word 0xf8db8e80  ! 1122: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_3_93:
	setx	0x26023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa240000  ! 1124: STW_R	stw	%r29, [%r16 + %r0]
iob_intr_3_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_90), 16, 16)) -> intp(3, 0, 17)
cpu_intr_3_94:
	setx	0x250123, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_48:
	mov	0xc, %r14
	.word 0xfaf384a0  ! 1134: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_3_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_91), 16, 16)) -> intp(3, 0, 2e)
	.word 0xbf35e001  ! 1137: SRL_I	srl 	%r23, 0x0001, %r31
T3_asi_reg_rd_48:
	mov	0x3c0, %r14
	.word 0xf2db8e40  ! 1138: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf0f4e107  ! 1139: STXA_I	stxa	%r24, [%r19 + 0x0107] %asi
cpu_intr_3_95:
	setx	0x270002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_92), 16, 16)) -> intp(3, 0, 27)
	.word 0xfeadc020  ! 1142: STBA_R	stba	%r31, [%r23 + %r0] 0x01
cpu_intr_3_96:
	setx	0x27031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_3_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_93), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_wr_49:
	mov	0x3c5, %r14
	.word 0xfef38e40  ! 1150: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf624a1ad  ! 1151: STW_I	stw	%r27, [%r18 + 0x01ad]
	.word 0xfab54020  ! 1152: STHA_R	stha	%r29, [%r21 + %r0] 0x01
	.word 0xf43520b9  ! 1153: STH_I	sth	%r26, [%r20 + 0x00b9]
iob_intr_3_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_94), 16, 16)) -> intp(3, 0, 27)
	.word 0xf074210c  ! 1160: STX_I	stx	%r24, [%r16 + 0x010c]
iob_intr_3_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_95), 16, 16)) -> intp(3, 0, 10)
iob_intr_3_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_96), 16, 16)) -> intp(3, 0, 1)
	.word 0xb8240000  ! 1168: SUB_R	sub 	%r16, %r0, %r28
iob_intr_3_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_97), 16, 16)) -> intp(3, 0, 2a)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_50:
	mov	0x3c3, %r14
	.word 0xf0f38400  ! 1174: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf0356168  ! 1175: STH_I	sth	%r24, [%r21 + 0x0168]
	.word 0xfc24c000  ! 1176: STW_R	stw	%r30, [%r19 + %r0]
iob_intr_3_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_98), 16, 16)) -> intp(3, 0, 19)
T3_asi_reg_wr_51:
	mov	0x2, %r14
	.word 0xf8f384a0  ! 1178: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982dc0  ! 1182: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc0, %hpstate
iob_intr_3_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_99), 16, 16)) -> intp(3, 0, 20)
T3_asi_reg_wr_52:
	mov	0x3c3, %r14
	.word 0xf8f38e40  ! 1187: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_3_97:
	setx	0x25023c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_98:
	setx	0x250309, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfeb5e1cf  ! 1193: STHA_I	stha	%r31, [%r23 + 0x01cf] %asi
	ta	T_CHANGE_TO_TL0
iob_intr_3_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_100), 16, 16)) -> intp(3, 0, 27)
	.word 0xb935c000  ! 1198: SRL_R	srl 	%r23, %r0, %r28
cpu_intr_3_99:
	setx	0x250004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea4c020  ! 1201: STWA_R	stwa	%r31, [%r19 + %r0] 0x01
	.word 0xfc2dc000  ! 1202: STB_R	stb	%r30, [%r23 + %r0]
iob_intr_3_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_101), 16, 16)) -> intp(3, 0, c)
	.word 0xfc348000  ! 1205: STH_R	sth	%r30, [%r18 + %r0]
	.word 0xb8acc000  ! 1206: ANDNcc_R	andncc 	%r19, %r0, %r28
	.word 0xf8a4a1f6  ! 1207: STWA_I	stwa	%r28, [%r18 + 0x01f6] %asi
	ta	T_CHANGE_TO_TL1
cpu_intr_3_100:
	setx	0x240316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02461fd  ! 1222: STW_I	stw	%r24, [%r17 + 0x01fd]
T3_asi_reg_wr_53:
	mov	0x20, %r14
	.word 0xfcf38400  ! 1223: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xfeb5a175  ! 1225: STHA_I	stha	%r31, [%r22 + 0x0175] %asi
T3_asi_reg_wr_54:
	mov	0x3c3, %r14
	.word 0xf6f384a0  ! 1228: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_3_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_102), 16, 16)) -> intp(3, 0, f)
T3_asi_reg_rd_49:
	mov	0x3c3, %r14
	.word 0xfcdb8e40  ! 1232: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf6754000  ! 1233: STX_R	stx	%r27, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4b5c020  ! 1237: STHA_R	stha	%r26, [%r23 + %r0] 0x01
T3_asi_reg_rd_50:
	mov	0x19, %r14
	.word 0xf8db8e60  ! 1238: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_3_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_103), 16, 16)) -> intp(3, 0, 19)
	.word 0xf2ad8020  ! 1246: STBA_R	stba	%r25, [%r22 + %r0] 0x01
	.word 0xfc2ca01e  ! 1249: STB_I	stb	%r30, [%r18 + 0x001e]
	.word 0xfa350000  ! 1250: STH_R	sth	%r29, [%r20 + %r0]
	.word 0xfea4c020  ! 1252: STWA_R	stwa	%r31, [%r19 + %r0] 0x01
cpu_intr_3_101:
	setx	0x270218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba95a0d7  ! 1255: ORcc_I	orcc 	%r22, 0x00d7, %r29
	.word 0xb88cc000  ! 1258: ANDcc_R	andcc 	%r19, %r0, %r28
iob_intr_3_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_104), 16, 16)) -> intp(3, 0, e)
	.word 0xf4748000  ! 1263: STX_R	stx	%r26, [%r18 + %r0]
T3_asi_reg_wr_55:
	mov	0x3c5, %r14
	.word 0xfaf38e40  ! 1264: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_wr_56:
	mov	0x3c0, %r14
	.word 0xfcf38e60  ! 1268: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf2a46049  ! 1273: STWA_I	stwa	%r25, [%r17 + 0x0049] %asi
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_102:
	setx	0x240020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf47520ff  ! 1280: STX_I	stx	%r26, [%r20 + 0x00ff]
cpu_intr_3_103:
	setx	0x25002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ada0f5  ! 1283: STBA_I	stba	%r28, [%r22 + 0x00f5] %asi
cpu_intr_3_104:
	setx	0x240021, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x8198298a  ! 1286: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098a, %hpstate
cpu_intr_3_105:
	setx	0x270223, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982ad8  ! 1288: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad8, %hpstate
cpu_intr_3_106:
	setx	0x26023c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_105), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf6258000  ! 1294: STW_R	stw	%r27, [%r22 + %r0]
	.word 0xfab46043  ! 1296: STHA_I	stha	%r29, [%r17 + 0x0043] %asi
	.word 0xf8ac0020  ! 1298: STBA_R	stba	%r28, [%r16 + %r0] 0x01
cpu_intr_3_107:
	setx	0x25010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea58020  ! 1302: STWA_R	stwa	%r31, [%r22 + %r0] 0x01
cpu_intr_3_108:
	setx	0x270214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea40020  ! 1304: STWA_R	stwa	%r31, [%r16 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
iob_intr_3_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_106), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf8340000  ! 1309: STH_R	sth	%r28, [%r16 + %r0]
T3_asi_reg_wr_57:
	mov	0x1c, %r14
	.word 0xf4f384a0  ! 1310: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf2240000  ! 1311: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xf62520ac  ! 1312: STW_I	stw	%r27, [%r20 + 0x00ac]
cpu_intr_3_109:
	setx	0x260009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe742196  ! 1316: STX_I	stx	%r31, [%r16 + 0x0196]
	.word 0xfea44020  ! 1318: STWA_R	stwa	%r31, [%r17 + %r0] 0x01
	.word 0xfaa4e0ef  ! 1319: STWA_I	stwa	%r29, [%r19 + 0x00ef] %asi
cpu_intr_3_110:
	setx	0x25003b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_51:
	mov	0x31, %r14
	.word 0xfedb8400  ! 1325: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_58:
	mov	0x3c1, %r14
	.word 0xfef38e60  ! 1330: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfe344000  ! 1332: STH_R	sth	%r31, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_107), 16, 16)) -> intp(3, 0, 17)
T3_asi_reg_rd_52:
	mov	0x32, %r14
	.word 0xf2db84a0  ! 1338: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T3_asi_reg_rd_53:
	mov	0x1d, %r14
	.word 0xfedb8e40  ! 1343: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_3_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_108), 16, 16)) -> intp(3, 0, 1f)
T3_asi_reg_rd_54:
	mov	0x27, %r14
	.word 0xf2db89e0  ! 1345: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_3_111:
	setx	0x250334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb81dc000  ! 1348: XOR_R	xor 	%r23, %r0, %r28
iob_intr_3_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_109), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_112:
	setx	0x260131, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_55:
	mov	0x17, %r14
	.word 0xfcdb8400  ! 1352: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_3_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_110), 16, 16)) -> intp(3, 0, 3)
cpu_intr_3_113:
	setx	0x250015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ac0020  ! 1357: STBA_R	stba	%r24, [%r16 + %r0] 0x01
	.word 0xfaf52020  ! 1358: STXA_I	stxa	%r29, [%r20 + 0x0020] %asi
T3_asi_reg_rd_56:
	mov	0x14, %r14
	.word 0xfcdb8e40  ! 1359: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf22d8000  ! 1366: STB_R	stb	%r25, [%r22 + %r0]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_59:
	mov	0x27, %r14
	.word 0xf4f384a0  ! 1371: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T3_asi_reg_rd_57:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 1373: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf2a4219d  ! 1376: STWA_I	stwa	%r25, [%r16 + 0x019d] %asi
iob_intr_3_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_111), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf0b48020  ! 1379: STHA_R	stha	%r24, [%r18 + %r0] 0x01
T3_asi_reg_rd_58:
	mov	0x12, %r14
	.word 0xf8db8e60  ! 1380: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T3_asi_reg_wr_60:
	mov	0x15, %r14
	.word 0xf0f389e0  ! 1381: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T3_asi_reg_wr_61:
	mov	0x35, %r14
	.word 0xfef38e40  ! 1382: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_59:
	mov	0x16, %r14
	.word 0xf6db84a0  ! 1386: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983b82  ! 1387: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b82, %hpstate
T3_asi_reg_rd_60:
	mov	0xc, %r14
	.word 0xfedb8e80  ! 1389: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_3_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_112), 16, 16)) -> intp(3, 0, 2)
cpu_intr_3_114:
	setx	0x2a0111, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_115:
	setx	0x280219, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983848  ! 1399: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1848, %hpstate
T3_asi_reg_rd_61:
	mov	0x20, %r14
	.word 0xfadb8e60  ! 1400: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_3_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_113), 16, 16)) -> intp(3, 0, 19)
T3_asi_reg_wr_62:
	mov	0x3c2, %r14
	.word 0xf4f38e80  ! 1402: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf0f4e133  ! 1403: STXA_I	stxa	%r24, [%r19 + 0x0133] %asi
	.word 0xf8ada188  ! 1405: STBA_I	stba	%r28, [%r22 + 0x0188] %asi
	.word 0xb8a4212a  ! 1409: SUBcc_I	subcc 	%r16, 0x012a, %r28
cpu_intr_3_116:
	setx	0x280026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcc54000  ! 1411: ADDCcc_R	addccc 	%r21, %r0, %r30
	.word 0xf2b4e1a7  ! 1413: STHA_I	stha	%r25, [%r19 + 0x01a7] %asi
	.word 0xf22c8000  ! 1414: STB_R	stb	%r25, [%r18 + %r0]
cpu_intr_3_117:
	setx	0x2a0139, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_62:
	mov	0x2c, %r14
	.word 0xf0db8e40  ! 1420: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_wr_63:
	mov	0x23, %r14
	.word 0xf4f384a0  ! 1422: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf62d6055  ! 1423: STB_I	stb	%r27, [%r21 + 0x0055]
iob_intr_3_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_114), 16, 16)) -> intp(3, 0, 10)
	.word 0xfe350000  ! 1425: STH_R	sth	%r31, [%r20 + %r0]
T3_asi_reg_wr_64:
	mov	0x12, %r14
	.word 0xfaf38e60  ! 1428: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbf2da001  ! 1429: SLL_I	sll 	%r22, 0x0001, %r31
	.word 0xbe444000  ! 1439: ADDC_R	addc 	%r17, %r0, %r31
	.word 0xf82de039  ! 1441: STB_I	stb	%r28, [%r23 + 0x0039]
cpu_intr_3_118:
	setx	0x2a0314, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_119:
	setx	0x290320, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_65:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 1452: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfead6190  ! 1457: STBA_I	stba	%r31, [%r21 + 0x0190] %asi
cpu_intr_3_120:
	setx	0x2b0322, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982b50  ! 1462: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b50, %hpstate
	.word 0x8194e02a  ! 1464: WRPR_TPC_I	wrpr	%r19, 0x002a, %tpc
	.word 0xbe2de1e8  ! 1465: ANDN_I	andn 	%r23, 0x01e8, %r31
	.word 0xf2b4a16f  ! 1466: STHA_I	stha	%r25, [%r18 + 0x016f] %asi
T3_asi_reg_rd_63:
	mov	0xb, %r14
	.word 0xf2db8e40  ! 1470: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T3_asi_reg_rd_64:
	mov	0x10, %r14
	.word 0xfedb8e40  ! 1472: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_wr_66:
	mov	0x3c5, %r14
	.word 0xf8f38400  ! 1473: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb49ca19d  ! 1474: XORcc_I	xorcc 	%r18, 0x019d, %r26
cpu_intr_3_121:
	setx	0x2a0002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ac21d1  ! 1476: STBA_I	stba	%r25, [%r16 + 0x01d1] %asi
	.word 0xf02de17f  ! 1478: STB_I	stb	%r24, [%r23 + 0x017f]
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983e58  ! 1479: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e58, %hpstate
	.word 0xf2a48020  ! 1480: STWA_R	stwa	%r25, [%r18 + %r0] 0x01
iob_intr_3_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_115), 16, 16)) -> intp(3, 0, 1b)
T3_asi_reg_wr_67:
	mov	0x2, %r14
	.word 0xf8f38400  ! 1484: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_3_122:
	setx	0x29002a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_68:
	mov	0x1b, %r14
	.word 0xf2f38e80  ! 1486: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T3_asi_reg_wr_69:
	mov	0x24, %r14
	.word 0xf0f38e60  ! 1487: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_3_123:
	setx	0x290200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf275a0f3  ! 1490: STX_I	stx	%r25, [%r22 + 0x00f3]
	.word 0xf22c8000  ! 1492: STB_R	stb	%r25, [%r18 + %r0]
	.word 0xfe25a12e  ! 1493: STW_I	stw	%r31, [%r22 + 0x012e]
	.word 0xfca52053  ! 1495: STWA_I	stwa	%r30, [%r20 + 0x0053] %asi
iob_intr_3_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_116), 16, 16)) -> intp(3, 0, 12)
	ta	T_CHANGE_TO_TL0
	.word 0xfaad4020  ! 1499: STBA_R	stba	%r29, [%r21 + %r0] 0x01
T3_asi_reg_wr_70:
	mov	0x3c6, %r14
	.word 0xf2f384a0  ! 1500: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_3_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_117), 16, 16)) -> intp(3, 0, 33)
T3_asi_reg_wr_71:
	mov	0x3c3, %r14
	.word 0xfcf38e80  ! 1502: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf6ac202f  ! 1504: STBA_I	stba	%r27, [%r16 + 0x002f] %asi
iob_intr_3_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_118), 16, 16)) -> intp(3, 0, 9)
	.word 0xfc25a177  ! 1507: STW_I	stw	%r30, [%r22 + 0x0177]
	.word 0xbb7d0400  ! 1510: MOVR_R	movre	%r20, %r0, %r29
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_65:
	mov	0x31, %r14
	.word 0xfadb8e40  ! 1514: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_3_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_119), 16, 16)) -> intp(3, 0, 8)
	.word 0xbb35c000  ! 1517: SRL_R	srl 	%r23, %r0, %r29
	.word 0xb0c420e2  ! 1521: ADDCcc_I	addccc 	%r16, 0x00e2, %r24
	.word 0xf235e043  ! 1522: STH_I	sth	%r25, [%r23 + 0x0043]
	.word 0xfeb4c020  ! 1525: STHA_R	stha	%r31, [%r19 + %r0] 0x01
	.word 0xfab4c020  ! 1528: STHA_R	stha	%r29, [%r19 + %r0] 0x01
T3_asi_reg_rd_66:
	mov	0x13, %r14
	.word 0xf0db8e60  ! 1531: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf22c204f  ! 1538: STB_I	stb	%r25, [%r16 + 0x004f]
	.word 0xb69ce091  ! 1542: XORcc_I	xorcc 	%r19, 0x0091, %r27
	.word 0xb2b40000  ! 1543: SUBCcc_R	orncc 	%r16, %r0, %r25
	.word 0xf0a5e1d3  ! 1544: STWA_I	stwa	%r24, [%r23 + 0x01d3] %asi
T3_asi_reg_rd_67:
	mov	0x3c2, %r14
	.word 0xfcdb8400  ! 1552: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_3_124:
	setx	0x2b010d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_72:
	mov	0x2b, %r14
	.word 0xf0f389e0  ! 1557: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_125:
	setx	0x2b033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0148000  ! 1561: OR_R	or 	%r18, %r0, %r24
	.word 0xf8a54020  ! 1562: STWA_R	stwa	%r28, [%r21 + %r0] 0x01
T3_asi_reg_rd_68:
	mov	0x3c8, %r14
	.word 0xf0db8e80  ! 1563: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_3_126:
	setx	0x290120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_127:
	setx	0x290204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa242168  ! 1567: STW_I	stw	%r29, [%r16 + 0x0168]
cpu_intr_3_128:
	setx	0x280333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2da13a  ! 1570: STB_I	stb	%r30, [%r22 + 0x013a]
iob_intr_3_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_120), 16, 16)) -> intp(3, 0, 21)
	ta	T_CHANGE_TO_TL0
cpu_intr_3_129:
	setx	0x280228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc25e13a  ! 1576: STW_I	stw	%r30, [%r23 + 0x013a]
	.word 0xb024c000  ! 1578: SUB_R	sub 	%r19, %r0, %r24
	ta	T_CHANGE_HPRIV
iob_intr_3_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_121), 16, 16)) -> intp(3, 0, f)
	ta	T_CHANGE_TO_TL1
	.word 0xfcac4020  ! 1588: STBA_R	stba	%r30, [%r17 + %r0] 0x01
	.word 0xb835c000  ! 1591: SUBC_R	orn 	%r23, %r0, %r28
iob_intr_3_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_122), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf0748000  ! 1594: STX_R	stx	%r24, [%r18 + %r0]
	.word 0xa1902000  ! 1597: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983e02  ! 1599: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e02, %hpstate
iob_intr_3_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_123), 16, 16)) -> intp(3, 0, 1f)
T3_asi_reg_rd_69:
	mov	0x3c8, %r14
	.word 0xf2db84a0  ! 1602: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xfead20d5  ! 1603: STBA_I	stba	%r31, [%r20 + 0x00d5] %asi
	.word 0xfe2c4000  ! 1607: STB_R	stb	%r31, [%r17 + %r0]
T3_asi_reg_rd_70:
	mov	0x2e, %r14
	.word 0xfedb8400  ! 1609: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbc35c000  ! 1610: SUBC_R	orn 	%r23, %r0, %r30
T3_asi_reg_rd_71:
	mov	0x3c2, %r14
	.word 0xf8db84a0  ! 1613: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xfc356136  ! 1614: STH_I	sth	%r30, [%r21 + 0x0136]
	ta	T_CHANGE_HPRIV
	.word 0xf835613f  ! 1620: STH_I	sth	%r28, [%r21 + 0x013f]
	.word 0xfeb58020  ! 1623: STHA_R	stha	%r31, [%r22 + %r0] 0x01
	.word 0xf4ac60ec  ! 1625: STBA_I	stba	%r26, [%r17 + 0x00ec] %asi
cpu_intr_3_130:
	setx	0x280311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2c21fd  ! 1629: STB_I	stb	%r30, [%r16 + 0x01fd]
	.word 0xfab48020  ! 1630: STHA_R	stha	%r29, [%r18 + %r0] 0x01
	.word 0xf6a54020  ! 1633: STWA_R	stwa	%r27, [%r21 + %r0] 0x01
iob_intr_3_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_124), 16, 16)) -> intp(3, 0, 3c)
T3_asi_reg_wr_73:
	mov	0x16, %r14
	.word 0xf0f38e80  ! 1636: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf274c000  ! 1639: STX_R	stx	%r25, [%r19 + %r0]
cpu_intr_3_131:
	setx	0x29002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba04a130  ! 1642: ADD_I	add 	%r18, 0x0130, %r29
	.word 0xf875c000  ! 1644: STX_R	stx	%r28, [%r23 + %r0]
iob_intr_3_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_125), 16, 16)) -> intp(3, 0, 11)
iob_intr_3_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_126), 16, 16)) -> intp(3, 0, 17)
T3_asi_reg_rd_72:
	mov	0x14, %r14
	.word 0xf2db8e40  ! 1650: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfaf42154  ! 1651: STXA_I	stxa	%r29, [%r16 + 0x0154] %asi
	.word 0xf424c000  ! 1652: STW_R	stw	%r26, [%r19 + %r0]
	.word 0xf0246069  ! 1656: STW_I	stw	%r24, [%r17 + 0x0069]
	.word 0xfe2c6082  ! 1660: STB_I	stb	%r31, [%r17 + 0x0082]
	.word 0xb68ca10f  ! 1666: ANDcc_I	andcc 	%r18, 0x010f, %r27
	.word 0xbab5a03b  ! 1667: SUBCcc_I	orncc 	%r22, 0x003b, %r29
	ta	T_CHANGE_HPRIV
	.word 0xf0f5a048  ! 1672: STXA_I	stxa	%r24, [%r22 + 0x0048] %asi
cpu_intr_3_132:
	setx	0x2b012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_73:
	mov	0x14, %r14
	.word 0xf4db8e40  ! 1674: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf4f520af  ! 1675: STXA_I	stxa	%r26, [%r20 + 0x00af] %asi
iob_intr_3_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_127), 16, 16)) -> intp(3, 0, 4)
T3_asi_reg_rd_74:
	mov	0x3c8, %r14
	.word 0xfadb8e60  ! 1679: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_3_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_128), 16, 16)) -> intp(3, 0, 27)
cpu_intr_3_133:
	setx	0x2b0001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4758000  ! 1687: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xfea56136  ! 1691: STWA_I	stwa	%r31, [%r21 + 0x0136] %asi
cpu_intr_3_134:
	setx	0x2a0312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea4c020  ! 1698: STWA_R	stwa	%r31, [%r19 + %r0] 0x01
	.word 0xf2b40020  ! 1700: STHA_R	stha	%r25, [%r16 + %r0] 0x01
iob_intr_3_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_129), 16, 16)) -> intp(3, 0, 2d)
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_75:
	mov	0xa, %r14
	.word 0xf4db8e40  ! 1703: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_130), 16, 16)) -> intp(3, 0, 2e)
iob_intr_3_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_131), 16, 16)) -> intp(3, 0, 1a)
	.word 0xbc1ca153  ! 1706: XOR_I	xor 	%r18, 0x0153, %r30
iob_intr_3_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_132), 16, 16)) -> intp(3, 0, f)
iob_intr_3_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_133), 16, 16)) -> intp(3, 0, 2e)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_135:
	setx	0x290106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0058000  ! 1722: ADD_R	add 	%r22, %r0, %r24
	.word 0xba0d60bc  ! 1726: AND_I	and 	%r21, 0x00bc, %r29
T3_asi_reg_rd_76:
	mov	0x22, %r14
	.word 0xf0db8e40  ! 1728: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfe750000  ! 1730: STX_R	stx	%r31, [%r20 + %r0]
cpu_intr_3_136:
	setx	0x29013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_77:
	mov	0x23, %r14
	.word 0xf4db8e80  ! 1732: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xfa348000  ! 1733: STH_R	sth	%r29, [%r18 + %r0]
T3_asi_reg_rd_78:
	mov	0x3c6, %r14
	.word 0xfcdb8400  ! 1736: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf8254000  ! 1738: STW_R	stw	%r28, [%r21 + %r0]
	.word 0xf8b42122  ! 1739: STHA_I	stha	%r28, [%r16 + 0x0122] %asi
iob_intr_3_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_134), 16, 16)) -> intp(3, 0, 20)
T3_asi_reg_wr_74:
	mov	0x3c4, %r14
	.word 0xfef384a0  ! 1741: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf2f420b3  ! 1742: STXA_I	stxa	%r25, [%r16 + 0x00b3] %asi
	.word 0xfcad4020  ! 1743: STBA_R	stba	%r30, [%r21 + %r0] 0x01
T3_asi_reg_rd_79:
	mov	0x37, %r14
	.word 0xf8db89e0  ! 1744: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xfcadc020  ! 1746: STBA_R	stba	%r30, [%r23 + %r0] 0x01
	.word 0xf825a0d1  ! 1747: STW_I	stw	%r28, [%r22 + 0x00d1]
iob_intr_3_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_135), 16, 16)) -> intp(3, 0, 9)
cpu_intr_3_137:
	setx	0x2b0019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4758000  ! 1752: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xf4a4615b  ! 1755: STWA_I	stwa	%r26, [%r17 + 0x015b] %asi
	.word 0xf6246026  ! 1757: STW_I	stw	%r27, [%r17 + 0x0026]
	.word 0xfca48020  ! 1760: STWA_R	stwa	%r30, [%r18 + %r0] 0x01
	.word 0xf8a52142  ! 1762: STWA_I	stwa	%r28, [%r20 + 0x0142] %asi
	.word 0xfe24a029  ! 1768: STW_I	stw	%r31, [%r18 + 0x0029]
iob_intr_3_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_136), 16, 16)) -> intp(3, 0, 3d)
T3_asi_reg_rd_80:
	mov	0x2f, %r14
	.word 0xfadb84a0  ! 1771: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_3_138:
	setx	0x2a003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_139:
	setx	0x29002f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_75:
	mov	0x30, %r14
	.word 0xf6f389e0  ! 1776: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_76:
	mov	0x22, %r14
	.word 0xf6f38e80  ! 1779: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf23460e4  ! 1780: STH_I	sth	%r25, [%r17 + 0x00e4]
	.word 0xf02d61c9  ! 1781: STB_I	stb	%r24, [%r21 + 0x01c9]
T3_asi_reg_wr_77:
	mov	0x19, %r14
	.word 0xf0f389e0  ! 1783: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_3_140:
	setx	0x28011f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_78:
	mov	0x3c1, %r14
	.word 0xf8f38e40  ! 1787: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbb351000  ! 1789: SRLX_R	srlx	%r20, %r0, %r29
	.word 0xf6a4611d  ! 1795: STWA_I	stwa	%r27, [%r17 + 0x011d] %asi
cpu_intr_3_141:
	setx	0x28012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2ca13c  ! 1799: STB_I	stb	%r29, [%r18 + 0x013c]
T3_asi_reg_wr_79:
	mov	0x3c1, %r14
	.word 0xf2f38e40  ! 1801: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_137), 16, 16)) -> intp(3, 0, 12)
iob_intr_3_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_138), 16, 16)) -> intp(3, 0, 15)
	.word 0xfef4a113  ! 1808: STXA_I	stxa	%r31, [%r18 + 0x0113] %asi
	.word 0xf0a461a2  ! 1810: STWA_I	stwa	%r24, [%r17 + 0x01a2] %asi
	.word 0xbaace0e2  ! 1813: ANDNcc_I	andncc 	%r19, 0x00e2, %r29
T3_asi_reg_rd_81:
	mov	0x12, %r14
	.word 0xfedb89e0  ! 1815: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T3_asi_reg_wr_80:
	mov	0x3c4, %r14
	.word 0xfef38e80  ! 1816: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb72d5000  ! 1818: SLLX_R	sllx	%r21, %r0, %r27
iob_intr_3_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_139), 16, 16)) -> intp(3, 0, 2b)
	setx	data_start_4, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982a52  ! 1821: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a52, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_81:
	mov	0x21, %r14
	.word 0xf0f38e60  ! 1826: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_3_142:
	setx	0x2d0337, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982c18  ! 1829: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c18, %hpstate
	.word 0xf634c000  ! 1835: STH_R	sth	%r27, [%r19 + %r0]
	.word 0xf82c0000  ! 1836: STB_R	stb	%r28, [%r16 + %r0]
	.word 0xf2ac0020  ! 1845: STBA_R	stba	%r25, [%r16 + %r0] 0x01
cpu_intr_3_143:
	setx	0x2e0316, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_144:
	setx	0x116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3c0000  ! 1850: SRA_R	sra 	%r16, %r0, %r30
	.word 0xfaad0020  ! 1852: STBA_R	stba	%r29, [%r20 + %r0] 0x01
T3_asi_reg_rd_82:
	mov	0x25, %r14
	.word 0xf6db84a0  ! 1855: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_3_145:
	setx	0x2e0002, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_146:
	setx	0x2c0001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0aca15c  ! 1862: STBA_I	stba	%r24, [%r18 + 0x015c] %asi
	.word 0xf82d0000  ! 1865: STB_R	stb	%r28, [%r20 + %r0]
iob_intr_3_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_140), 16, 16)) -> intp(3, 0, 3)
	.word 0xf8aca066  ! 1870: STBA_I	stba	%r28, [%r18 + 0x0066] %asi
iob_intr_3_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_141), 16, 16)) -> intp(3, 0, 36)
	.word 0xb60c61a7  ! 1877: AND_I	and 	%r17, 0x01a7, %r27
	.word 0xf6754000  ! 1878: STX_R	stx	%r27, [%r21 + %r0]
iob_intr_3_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_142), 16, 16)) -> intp(3, 0, 15)
iob_intr_3_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_143), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_wr_82:
	mov	0x3c5, %r14
	.word 0xfcf38e40  ! 1885: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_147:
	setx	0x2c0224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62d4000  ! 1890: STB_R	stb	%r27, [%r21 + %r0]
T3_asi_reg_rd_83:
	mov	0x3c7, %r14
	.word 0xf8db8e60  ! 1891: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb034c000  ! 1893: ORN_R	orn 	%r19, %r0, %r24
T3_asi_reg_wr_83:
	mov	0x11, %r14
	.word 0xf4f38e80  ! 1895: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T3_asi_reg_wr_84:
	mov	0x3c0, %r14
	.word 0xfaf38e60  ! 1898: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xfc2d8000  ! 1900: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xb9643801  ! 1902: MOVcc_I	<illegal instruction>
	.word 0xf2ad6109  ! 1904: STBA_I	stba	%r25, [%r21 + 0x0109] %asi
iob_intr_3_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_144), 16, 16)) -> intp(3, 0, 23)
	.word 0xf8ac8020  ! 1907: STBA_R	stba	%r28, [%r18 + %r0] 0x01
	.word 0xbaa4c000  ! 1911: SUBcc_R	subcc 	%r19, %r0, %r29
T3_asi_reg_rd_84:
	mov	0x35, %r14
	.word 0xf6db89e0  ! 1912: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_3_148:
	setx	0x2c0102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_149:
	setx	0x2d020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb535e001  ! 1919: SRL_I	srl 	%r23, 0x0001, %r26
cpu_intr_3_150:
	setx	0x2e030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_151:
	setx	0x2e0330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe34a106  ! 1925: STH_I	sth	%r31, [%r18 + 0x0106]
cpu_intr_3_152:
	setx	0x2c013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf634a055  ! 1928: STH_I	sth	%r27, [%r18 + 0x0055]
cpu_intr_3_153:
	setx	0x2d0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc850000  ! 1933: ADDcc_R	addcc 	%r20, %r0, %r30
	.word 0xb6a4a0f4  ! 1934: SUBcc_I	subcc 	%r18, 0x00f4, %r27
cpu_intr_3_154:
	setx	0x2d0326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62d8000  ! 1938: STB_R	stb	%r27, [%r22 + %r0]
cpu_intr_3_155:
	setx	0x2c0203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe356068  ! 1941: STH_I	sth	%r31, [%r21 + 0x0068]
cpu_intr_3_156:
	setx	0x2c001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f52043  ! 1944: STXA_I	stxa	%r25, [%r20 + 0x0043] %asi
cpu_intr_3_157:
	setx	0x2c010a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_158:
	setx	0x2f0338, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_159:
	setx	0x2f010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba14e12e  ! 1951: OR_I	or 	%r19, 0x012e, %r29
	ta	T_CHANGE_TO_TL0
	.word 0xbc240000  ! 1955: SUB_R	sub 	%r16, %r0, %r30
T3_asi_reg_rd_85:
	mov	0x17, %r14
	.word 0xfedb8e40  ! 1959: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_3_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_145), 16, 16)) -> intp(3, 0, 1c)
cpu_intr_3_160:
	setx	0x2c0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaf5e14b  ! 1963: STXA_I	stxa	%r29, [%r23 + 0x014b] %asi
iob_intr_3_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_146), 16, 16)) -> intp(3, 0, 16)
iob_intr_3_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_147), 16, 16)) -> intp(3, 0, 35)
cpu_intr_3_161:
	setx	0x2f0332, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_86:
	mov	0x31, %r14
	.word 0xf8db8e40  ! 1969: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfc35a1ea  ! 1970: STH_I	sth	%r30, [%r22 + 0x01ea]
	.word 0xf82de156  ! 1971: STB_I	stb	%r28, [%r23 + 0x0156]
cpu_intr_3_162:
	setx	0x2c0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b5c020  ! 1975: STHA_R	stha	%r25, [%r23 + %r0] 0x01
iob_intr_3_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_148), 16, 16)) -> intp(3, 0, 7)
	.word 0xb4bc0000  ! 1981: XNORcc_R	xnorcc 	%r16, %r0, %r26
	.word 0xf0350000  ! 1983: STH_R	sth	%r24, [%r20 + %r0]
cpu_intr_3_163:
	setx	0x2c013b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_149), 16, 16)) -> intp(3, 0, 2e)
iob_intr_3_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_150), 16, 16)) -> intp(3, 0, 1a)
	.word 0xfe244000  ! 1992: STW_R	stw	%r31, [%r17 + %r0]
	.word 0xfe756166  ! 1995: STX_I	stx	%r31, [%r21 + 0x0166]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf62461dd  ! 1997: STW_I	stw	%r27, [%r17 + 0x01dd]
	.word 0xf475c000  ! 1999: STX_R	stx	%r26, [%r23 + %r0]
cpu_intr_3_164:
	setx	0x2f0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb734c000  ! 2002: SRL_R	srl 	%r19, %r0, %r27
T3_asi_reg_wr_85:
	mov	0x3c0, %r14
	.word 0xfef38e40  ! 2003: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb03d8000  ! 2005: XNOR_R	xnor 	%r22, %r0, %r24
iob_intr_3_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_151), 16, 16)) -> intp(3, 0, 3e)
T3_asi_reg_rd_87:
	mov	0x2e, %r14
	.word 0xf8db8e40  ! 2007: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_152), 16, 16)) -> intp(3, 0, 17)
	ta	T_CHANGE_NONHPRIV
	.word 0xf62cc000  ! 2013: STB_R	stb	%r27, [%r19 + %r0]
	.word 0xfaa4c020  ! 2014: STWA_R	stwa	%r29, [%r19 + %r0] 0x01
	.word 0xf0250000  ! 2015: STW_R	stw	%r24, [%r20 + %r0]
cpu_intr_3_165:
	setx	0x2f003f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_153), 16, 16)) -> intp(3, 0, 15)
T3_asi_reg_wr_86:
	mov	0x17, %r14
	.word 0xfef38e40  ! 2023: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf225e029  ! 2027: STW_I	stw	%r25, [%r23 + 0x0029]
	.word 0xf8ad4020  ! 2028: STBA_R	stba	%r28, [%r21 + %r0] 0x01
	.word 0xb80ce19b  ! 2034: AND_I	and 	%r19, 0x019b, %r28
	.word 0x8194e177  ! 2039: WRPR_TPC_I	wrpr	%r19, 0x0177, %tpc
	.word 0xf6adc020  ! 2041: STBA_R	stba	%r27, [%r23 + %r0] 0x01
cpu_intr_3_166:
	setx	0x2e033a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_167:
	setx	0x2c0007, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_154), 16, 16)) -> intp(3, 0, 8)
iob_intr_3_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_155), 16, 16)) -> intp(3, 0, 11)
	.word 0xf2acc020  ! 2049: STBA_R	stba	%r25, [%r19 + %r0] 0x01
T3_asi_reg_wr_87:
	mov	0x29, %r14
	.word 0xf0f38e40  ! 2050: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_156), 16, 16)) -> intp(3, 0, 34)
cpu_intr_3_168:
	setx	0x2c0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a4e070  ! 2055: STWA_I	stwa	%r24, [%r19 + 0x0070] %asi
cpu_intr_3_169:
	setx	0x2c0001, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_88:
	mov	0x21, %r14
	.word 0xf2db84a0  ! 2057: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xba354000  ! 2058: ORN_R	orn 	%r21, %r0, %r29
	.word 0xf874203b  ! 2060: STX_I	stx	%r28, [%r16 + 0x003b]
T3_asi_reg_rd_89:
	mov	0x2a, %r14
	.word 0xf0db8e80  ! 2061: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T3_asi_reg_wr_88:
	mov	0xc, %r14
	.word 0xf0f389e0  ! 2065: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T3_asi_reg_wr_89:
	mov	0x29, %r14
	.word 0xf2f38e60  ! 2066: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf0ada09b  ! 2067: STBA_I	stba	%r24, [%r22 + 0x009b] %asi
iob_intr_3_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_157), 16, 16)) -> intp(3, 0, d)
	.word 0xb150c000  ! 2077: RDPR_TT	rdpr	%tt, %r24
T3_asi_reg_wr_90:
	mov	0x37, %r14
	.word 0xfcf389e0  ! 2078: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T3_asi_reg_rd_90:
	mov	0x36, %r14
	.word 0xf2db8e60  ! 2080: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T3_asi_reg_wr_91:
	mov	0x2a, %r14
	.word 0xf6f38e40  ! 2082: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf6740000  ! 2085: STX_R	stx	%r27, [%r16 + %r0]
	ta	T_CHANGE_TO_TL1
	.word 0xb415e145  ! 2091: OR_I	or 	%r23, 0x0145, %r26
cpu_intr_3_170:
	setx	0x2d020e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_158), 16, 16)) -> intp(3, 0, 9)
	.word 0xfeb4a04f  ! 2102: STHA_I	stha	%r31, [%r18 + 0x004f] %asi
	.word 0xf02521a1  ! 2105: STW_I	stw	%r24, [%r20 + 0x01a1]
	.word 0xf22420e3  ! 2111: STW_I	stw	%r25, [%r16 + 0x00e3]
	.word 0xfab44020  ! 2112: STHA_R	stha	%r29, [%r17 + %r0] 0x01
	.word 0xf0b5e1b7  ! 2115: STHA_I	stha	%r24, [%r23 + 0x01b7] %asi
	.word 0xfaa4c020  ! 2116: STWA_R	stwa	%r29, [%r19 + %r0] 0x01
	.word 0xb951c000  ! 2117: RDPR_TL	<illegal instruction>
	.word 0xb42560e3  ! 2121: SUB_I	sub 	%r21, 0x00e3, %r26
T3_asi_reg_rd_91:
	mov	0x6, %r14
	.word 0xf8db8400  ! 2122: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_3_171:
	setx	0x2e022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf474a042  ! 2125: STX_I	stx	%r26, [%r18 + 0x0042]
	ta	T_CHANGE_HPRIV
	.word 0xf03520b2  ! 2127: STH_I	sth	%r24, [%r20 + 0x00b2]
iob_intr_3_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_159), 16, 16)) -> intp(3, 0, 2f)
T3_asi_reg_rd_92:
	mov	0x17, %r14
	.word 0xf8db89e0  ! 2131: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf8a5a08d  ! 2133: STWA_I	stwa	%r28, [%r22 + 0x008d] %asi
iob_intr_3_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_160), 16, 16)) -> intp(3, 0, 27)
	.word 0xb8c5e1d9  ! 2136: ADDCcc_I	addccc 	%r23, 0x01d9, %r28
T3_asi_reg_wr_92:
	mov	0x0, %r14
	.word 0xfaf384a0  ! 2139: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xf0756190  ! 2145: STX_I	stx	%r24, [%r21 + 0x0190]
	.word 0xf8a5e0ab  ! 2146: STWA_I	stwa	%r28, [%r23 + 0x00ab] %asi
iob_intr_3_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_161), 16, 16)) -> intp(3, 0, 17)
	ta	T_CHANGE_NONHPRIV
	.word 0xf225c000  ! 2153: STW_R	stw	%r25, [%r23 + %r0]
T3_asi_reg_wr_93:
	mov	0x2b, %r14
	.word 0xf8f389e0  ! 2155: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf2b54020  ! 2156: STHA_R	stha	%r25, [%r21 + %r0] 0x01
	.word 0xfc2d60b2  ! 2158: STB_I	stb	%r30, [%r21 + 0x00b2]
	.word 0xfeadc020  ! 2159: STBA_R	stba	%r31, [%r23 + %r0] 0x01
	.word 0xfc34a07c  ! 2161: STH_I	sth	%r30, [%r18 + 0x007c]
	.word 0xb7355000  ! 2162: SRLX_R	srlx	%r21, %r0, %r27
T3_asi_reg_rd_93:
	mov	0x35, %r14
	.word 0xf0db8e60  ! 2165: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T3_asi_reg_rd_94:
	mov	0x37, %r14
	.word 0xfedb89e0  ! 2166: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_3_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_162), 16, 16)) -> intp(3, 0, 1b)
T3_asi_reg_rd_95:
	mov	0x28, %r14
	.word 0xf8db8e60  ! 2169: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf8b40020  ! 2170: STHA_R	stha	%r28, [%r16 + %r0] 0x01
	.word 0xb434c000  ! 2172: ORN_R	orn 	%r19, %r0, %r26
	.word 0xf2aca188  ! 2173: STBA_I	stba	%r25, [%r18 + 0x0188] %asi
cpu_intr_3_172:
	setx	0x2e022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_96:
	mov	0x3c6, %r14
	.word 0xf2db8e40  ! 2175: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf0750000  ! 2176: STX_R	stx	%r24, [%r20 + %r0]
cpu_intr_3_173:
	setx	0x2e0115, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_163), 16, 16)) -> intp(3, 0, 24)
cpu_intr_3_174:
	setx	0x2f003e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_94:
	mov	0x25, %r14
	.word 0xf0f38400  ! 2185: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T3_asi_reg_rd_97:
	mov	0x23, %r14
	.word 0xfcdb8e80  ! 2187: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_3_175:
	setx	0x2e001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_176:
	setx	0x2d011d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_98:
	mov	0x18, %r14
	.word 0xfcdb89e0  ! 2197: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbc3d0000  ! 2198: XNOR_R	xnor 	%r20, %r0, %r30
cpu_intr_3_177:
	setx	0x2e032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea4206e  ! 2201: STWA_I	stwa	%r31, [%r16 + 0x006e] %asi
	.word 0xf8250000  ! 2202: STW_R	stw	%r28, [%r20 + %r0]
	.word 0xf2a50020  ! 2204: STWA_R	stwa	%r25, [%r20 + %r0] 0x01
	.word 0xf4b58020  ! 2205: STHA_R	stha	%r26, [%r22 + %r0] 0x01
	.word 0xf0a5e0d3  ! 2207: STWA_I	stwa	%r24, [%r23 + 0x00d3] %asi
	.word 0xfead8020  ! 2208: STBA_R	stba	%r31, [%r22 + %r0] 0x01
T3_asi_reg_wr_95:
	mov	0x3c8, %r14
	.word 0xfcf384a0  ! 2209: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_3_178:
	setx	0x2f0105, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_179:
	setx	0x2e0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12ce001  ! 2213: SLL_I	sll 	%r19, 0x0001, %r24
T3_asi_reg_rd_99:
	mov	0x3c3, %r14
	.word 0xf2db8e60  ! 2215: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf824c000  ! 2218: STW_R	stw	%r28, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfaa5e154  ! 2221: STWA_I	stwa	%r29, [%r23 + 0x0154] %asi
	.word 0xb53d2001  ! 2222: SRA_I	sra 	%r20, 0x0001, %r26
	.word 0xfa75c000  ! 2224: STX_R	stx	%r29, [%r23 + %r0]
T3_asi_reg_rd_100:
	mov	0x36, %r14
	.word 0xf4db89e0  ! 2225: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T3_asi_reg_rd_101:
	mov	0x3c6, %r14
	.word 0xfadb89e0  ! 2226: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xfe35606e  ! 2228: STH_I	sth	%r31, [%r21 + 0x006e]
cpu_intr_3_180:
	setx	0x2e0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf4f561b9  ! 2231: STXA_I	stxa	%r26, [%r21 + 0x01b9] %asi
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xfc34c000  ! 2236: STH_R	sth	%r30, [%r19 + %r0]
T3_asi_reg_wr_96:
	mov	0x24, %r14
	.word 0xfef384a0  ! 2237: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf434210a  ! 2239: STH_I	sth	%r26, [%r16 + 0x010a]
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_97:
	mov	0x0, %r14
	.word 0xf0f384a0  ! 2243: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf4240000  ! 2244: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xb434c000  ! 2245: SUBC_R	orn 	%r19, %r0, %r26
	.word 0xf0358000  ! 2246: STH_R	sth	%r24, [%r22 + %r0]
T3_asi_reg_wr_98:
	mov	0x1e, %r14
	.word 0xf0f38e40  ! 2247: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x8198285a  ! 2248: WRHPR_HPSTATE_I	wrhpr	%r0, 0x085a, %hpstate
iob_intr_3_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_164), 16, 16)) -> intp(3, 0, 25)
T3_asi_reg_rd_102:
	mov	0x3c0, %r14
	.word 0xf8db8e60  ! 2251: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	ta	T_CHANGE_HPRIV
iob_intr_3_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_165), 16, 16)) -> intp(3, 0, 15)
	ta	T_CHANGE_HPRIV
	.word 0xfef56004  ! 2257: STXA_I	stxa	%r31, [%r21 + 0x0004] %asi
	.word 0xb60c2137  ! 2258: AND_I	and 	%r16, 0x0137, %r27
	.word 0xfc246062  ! 2259: STW_I	stw	%r30, [%r17 + 0x0062]
T3_asi_reg_rd_103:
	mov	0x1f, %r14
	.word 0xfcdb8e40  ! 2260: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_166), 16, 16)) -> intp(3, 0, 29)
iob_intr_3_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_167), 16, 16)) -> intp(3, 0, 20)
	.word 0xfca4a103  ! 2269: STWA_I	stwa	%r30, [%r18 + 0x0103] %asi
T3_asi_reg_wr_99:
	mov	0x3c6, %r14
	.word 0xfef38400  ! 2270: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T3_asi_reg_rd_104:
	mov	0x15, %r14
	.word 0xf8db8400  ! 2273: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xfa244000  ! 2276: STW_R	stw	%r29, [%r17 + %r0]
iob_intr_3_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_168), 16, 16)) -> intp(3, 0, 35)
	.word 0xb4442171  ! 2280: ADDC_I	addc 	%r16, 0x0171, %r26
T3_asi_reg_wr_100:
	mov	0x2d, %r14
	.word 0xf8f38e40  ! 2283: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_3_181:
	setx	0x330135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeada1ae  ! 2289: ANDNcc_I	andncc 	%r22, 0x01ae, %r31
T3_asi_reg_wr_101:
	mov	0x17, %r14
	.word 0xf0f38400  ! 2290: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf0758000  ! 2291: STX_R	stx	%r24, [%r22 + %r0]
iob_intr_3_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_169), 16, 16)) -> intp(3, 0, 31)
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982d58  ! 2297: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d58, %hpstate
iob_intr_3_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_170), 16, 16)) -> intp(3, 0, 16)
T3_asi_reg_rd_105:
	mov	0x11, %r14
	.word 0xf8db89e0  ! 2300: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_3_182:
	setx	0x30020d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_171), 16, 16)) -> intp(3, 0, f)
	.word 0xb0b54000  ! 2308: ORNcc_R	orncc 	%r21, %r0, %r24
cpu_intr_3_183:
	setx	0x32012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982ad0  ! 2312: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad0, %hpstate
iob_intr_3_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_172), 16, 16)) -> intp(3, 0, 22)
iob_intr_3_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_173), 16, 16)) -> intp(3, 0, 22)
	.word 0xba0ce1ef  ! 2324: AND_I	and 	%r19, 0x01ef, %r29
	.word 0xf8b50020  ! 2325: STHA_R	stha	%r28, [%r20 + %r0] 0x01
	ta	T_CHANGE_HPRIV
cpu_intr_3_184:
	setx	0x33001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983b02  ! 2332: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b02, %hpstate
cpu_intr_3_185:
	setx	0x300308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6c5a052  ! 2341: ADDCcc_I	addccc 	%r22, 0x0052, %r27
	.word 0xf2744000  ! 2343: STX_R	stx	%r25, [%r17 + %r0]
cpu_intr_3_186:
	setx	0x330009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb214c000  ! 2347: OR_R	or 	%r19, %r0, %r25
	.word 0xfeac20f1  ! 2349: STBA_I	stba	%r31, [%r16 + 0x00f1] %asi
T3_asi_reg_rd_106:
	mov	0x2b, %r14
	.word 0xfcdb8400  ! 2355: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T3_asi_reg_wr_102:
	mov	0x3c1, %r14
	.word 0xf2f389e0  ! 2358: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_3_187:
	setx	0x310329, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_188:
	setx	0x330223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a52171  ! 2365: STWA_I	stwa	%r24, [%r20 + 0x0171] %asi
	.word 0xf6758000  ! 2367: STX_R	stx	%r27, [%r22 + %r0]
cpu_intr_3_189:
	setx	0x31033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa34c000  ! 2373: STH_R	sth	%r29, [%r19 + %r0]
	.word 0xa1902002  ! 2375: WRPR_GL_I	wrpr	%r0, 0x0002, %-
iob_intr_3_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_174), 16, 16)) -> intp(3, 0, e)
	.word 0xf2a40020  ! 2381: STWA_R	stwa	%r25, [%r16 + %r0] 0x01
iob_intr_3_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_175), 16, 16)) -> intp(3, 0, 20)
	.word 0xfcb4a060  ! 2384: STHA_I	stha	%r30, [%r18 + 0x0060] %asi
	.word 0xfcb56107  ! 2386: STHA_I	stha	%r30, [%r21 + 0x0107] %asi
cpu_intr_3_190:
	setx	0x320009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb48dc000  ! 2391: ANDcc_R	andcc 	%r23, %r0, %r26
T3_asi_reg_wr_103:
	mov	0x3c2, %r14
	.word 0xfcf38e40  ! 2392: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf2a4e1b6  ! 2393: STWA_I	stwa	%r25, [%r19 + 0x01b6] %asi
	.word 0xfeb44020  ! 2398: STHA_R	stha	%r31, [%r17 + %r0] 0x01
cpu_intr_3_191:
	setx	0x310303, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_104:
	mov	0x16, %r14
	.word 0xf4f38e40  ! 2400: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T3_asi_reg_wr_105:
	mov	0x28, %r14
	.word 0xf8f38e60  ! 2401: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xfcadc020  ! 2404: STBA_R	stba	%r30, [%r23 + %r0] 0x01
	.word 0xfcadc020  ! 2407: STBA_R	stba	%r30, [%r23 + %r0] 0x01
cpu_intr_3_192:
	setx	0x31002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa24618e  ! 2411: STW_I	stw	%r29, [%r17 + 0x018e]
T3_asi_reg_wr_106:
	mov	0x1c, %r14
	.word 0xf2f384a0  ! 2412: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T3_asi_reg_wr_107:
	mov	0x3c5, %r14
	.word 0xf0f38e80  ! 2413: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_3_193:
	setx	0x300307, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_108:
	mov	0x2a, %r14
	.word 0xf6f38400  ! 2416: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_3_194:
	setx	0x310303, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_107:
	mov	0xf, %r14
	.word 0xf6db8e40  ! 2418: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_rd_108:
	mov	0x7, %r14
	.word 0xf6db89e0  ! 2419: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_3_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_176), 16, 16)) -> intp(3, 0, 21)
cpu_intr_3_195:
	setx	0x300227, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_109:
	mov	0x4, %r14
	.word 0xf0db8400  ! 2429: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_3_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_177), 16, 16)) -> intp(3, 0, c)
	.word 0xfe2ce0dc  ! 2436: STB_I	stb	%r31, [%r19 + 0x00dc]
T3_asi_reg_wr_109:
	mov	0x34, %r14
	.word 0xfef38e60  ! 2438: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf435c000  ! 2442: STH_R	sth	%r26, [%r23 + %r0]
	.word 0xf8748000  ! 2443: STX_R	stx	%r28, [%r18 + %r0]
iob_intr_3_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_178), 16, 16)) -> intp(3, 0, 2c)
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983d12  ! 2449: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d12, %hpstate
	.word 0xfc244000  ! 2452: STW_R	stw	%r30, [%r17 + %r0]
	.word 0xf2354000  ! 2453: STH_R	sth	%r25, [%r21 + %r0]
T3_asi_reg_wr_110:
	mov	0x3c1, %r14
	.word 0xfef38e60  ! 2456: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_3_196:
	setx	0x30023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2354000  ! 2459: ORN_R	orn 	%r21, %r0, %r25
iob_intr_3_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_179), 16, 16)) -> intp(3, 0, 19)
	.word 0xf875a0b0  ! 2464: STX_I	stx	%r28, [%r22 + 0x00b0]
T3_asi_reg_wr_111:
	mov	0x38, %r14
	.word 0xfaf38400  ! 2466: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_3_197:
	setx	0x320137, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_180), 16, 16)) -> intp(3, 0, 13)
iob_intr_3_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_181), 16, 16)) -> intp(3, 0, 15)
iob_intr_3_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_182), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_198:
	setx	0x310216, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_110:
	mov	0x32, %r14
	.word 0xf8db8400  ! 2484: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_3_199:
	setx	0x2003f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_183), 16, 16)) -> intp(3, 0, 11)
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983e82  ! 2494: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e82, %hpstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfa34216f  ! 2499: STH_I	sth	%r29, [%r16 + 0x016f]
iob_intr_3_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_184), 16, 16)) -> intp(3, 0, 18)
	.word 0xf034e1d3  ! 2505: STH_I	sth	%r24, [%r19 + 0x01d3]
iob_intr_3_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_185), 16, 16)) -> intp(3, 0, 25)
cpu_intr_3_200:
	setx	0x31000c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_201:
	setx	0x32021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0958000  ! 2514: ORcc_R	orcc 	%r22, %r0, %r24
	ta	T_CHANGE_HPRIV
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982d88  ! 2518: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d88, %hpstate
iob_intr_3_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_186), 16, 16)) -> intp(3, 0, 3d)
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982c10  ! 2523: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c10, %hpstate
	.word 0xf62c61da  ! 2525: STB_I	stb	%r27, [%r17 + 0x01da]
	ta	T_CHANGE_TO_TL0
	.word 0xf02ca0eb  ! 2527: STB_I	stb	%r24, [%r18 + 0x00eb]
cpu_intr_3_202:
	setx	0x330138, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_187), 16, 16)) -> intp(3, 0, 11)
	.word 0xb37c0400  ! 2540: MOVR_R	movre	%r16, %r0, %r25
	.word 0xf42ce13e  ! 2542: STB_I	stb	%r26, [%r19 + 0x013e]
T3_asi_reg_wr_112:
	mov	0x1c, %r14
	.word 0xf6f38e40  ! 2545: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_wr_113:
	mov	0x25, %r14
	.word 0xf4f38400  ! 2546: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_3_203:
	setx	0x3013d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_114:
	mov	0x29, %r14
	.word 0xfef38e60  ! 2548: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf02d8000  ! 2550: STB_R	stb	%r24, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_115:
	mov	0x13, %r14
	.word 0xf6f384a0  ! 2552: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T3_asi_reg_wr_116:
	mov	0x3c3, %r14
	.word 0xf4f38e40  ! 2553: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfe74a050  ! 2554: STX_I	stx	%r31, [%r18 + 0x0050]
	.word 0xb215e0f9  ! 2555: OR_I	or 	%r23, 0x00f9, %r25
	.word 0xfea4e1d4  ! 2556: STWA_I	stwa	%r31, [%r19 + 0x01d4] %asi
	ta	T_CHANGE_TO_TL0
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982902  ! 2561: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0902, %hpstate
	.word 0xb5342001  ! 2569: SRL_I	srl 	%r16, 0x0001, %r26
iob_intr_3_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_188), 16, 16)) -> intp(3, 0, 14)
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982cd8  ! 2573: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd8, %hpstate
iob_intr_3_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_189), 16, 16)) -> intp(3, 0, 15)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_204:
	setx	0x33030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf235212a  ! 2582: STH_I	sth	%r25, [%r20 + 0x012a]
	.word 0xf4a5c020  ! 2583: STWA_R	stwa	%r26, [%r23 + %r0] 0x01
	.word 0xfeb560a8  ! 2584: STHA_I	stha	%r31, [%r21 + 0x00a8] %asi
iob_intr_3_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_190), 16, 16)) -> intp(3, 0, 3d)
	ta	T_CHANGE_TO_TL0
	.word 0xf4f4e02f  ! 2593: STXA_I	stxa	%r26, [%r19 + 0x002f] %asi
T3_asi_reg_rd_111:
	mov	0x26, %r14
	.word 0xf6db89e0  ! 2594: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T3_asi_reg_wr_117:
	mov	0x3c5, %r14
	.word 0xfcf384a0  ! 2595: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfaf52043  ! 2596: STXA_I	stxa	%r29, [%r20 + 0x0043] %asi
	.word 0xf4ad4020  ! 2598: STBA_R	stba	%r26, [%r21 + %r0] 0x01
iob_intr_3_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_191), 16, 16)) -> intp(3, 0, 3e)
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982c42  ! 2601: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c42, %hpstate
	.word 0xfaad8020  ! 2603: STBA_R	stba	%r29, [%r22 + %r0] 0x01
iob_intr_3_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_192), 16, 16)) -> intp(3, 0, 4)
	.word 0xb09d4000  ! 2606: XORcc_R	xorcc 	%r21, %r0, %r24
T3_asi_reg_rd_112:
	mov	0x3c1, %r14
	.word 0xf4db8400  ! 2608: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T3_asi_reg_rd_113:
	mov	0x12, %r14
	.word 0xf4db89e0  ! 2609: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb0b4c000  ! 2610: SUBCcc_R	orncc 	%r19, %r0, %r24
cpu_intr_3_205:
	setx	0x32002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf275a1c0  ! 2616: STX_I	stx	%r25, [%r22 + 0x01c0]
cpu_intr_3_206:
	setx	0x31021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8395e134  ! 2619: WRPR_TNPC_I	wrpr	%r23, 0x0134, %tnpc
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982bc2  ! 2622: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc2, %hpstate
	.word 0xb28da03a  ! 2623: ANDcc_I	andcc 	%r22, 0x003a, %r25
	.word 0xf2a4e175  ! 2626: STWA_I	stwa	%r25, [%r19 + 0x0175] %asi
	.word 0xb434c000  ! 2627: ORN_R	orn 	%r19, %r0, %r26
iob_intr_3_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_193), 16, 16)) -> intp(3, 0, 36)
iob_intr_3_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_194), 16, 16)) -> intp(3, 0, 21)
	setx	data_start_3, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983d4a  ! 2631: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d4a, %hpstate
T3_asi_reg_rd_114:
	mov	0x22, %r14
	.word 0xfedb8e40  ! 2633: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb6bcc000  ! 2634: XNORcc_R	xnorcc 	%r19, %r0, %r27
T3_asi_reg_wr_118:
	mov	0x3c8, %r14
	.word 0xf4f38e40  ! 2635: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf82da024  ! 2638: STB_I	stb	%r28, [%r22 + 0x0024]
	.word 0xb28da109  ! 2640: ANDcc_I	andcc 	%r22, 0x0109, %r25
	.word 0xbf346001  ! 2648: SRL_I	srl 	%r17, 0x0001, %r31
iob_intr_3_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_195), 16, 16)) -> intp(3, 0, 33)
	ta	T_CHANGE_NONHPRIV
	.word 0xf6a44020  ! 2653: STWA_R	stwa	%r27, [%r17 + %r0] 0x01
	.word 0xf2b4a019  ! 2654: STHA_I	stha	%r25, [%r18 + 0x0019] %asi
	.word 0xf435a18e  ! 2655: STH_I	sth	%r26, [%r22 + 0x018e]
T3_asi_reg_wr_119:
	mov	0x0, %r14
	.word 0xf2f38400  ! 2657: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_3_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_196), 16, 16)) -> intp(3, 0, 3d)
iob_intr_3_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_197), 16, 16)) -> intp(3, 0, 4)
T3_asi_reg_wr_120:
	mov	0xb, %r14
	.word 0xf6f38e80  ! 2663: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbcbce051  ! 2665: XNORcc_I	xnorcc 	%r19, 0x0051, %r30
T3_asi_reg_wr_121:
	mov	0x26, %r14
	.word 0xf6f389e0  ! 2667: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_3_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_198), 16, 16)) -> intp(3, 0, 26)
	.word 0xf6adc020  ! 2670: STBA_R	stba	%r27, [%r23 + %r0] 0x01
T3_asi_reg_rd_115:
	mov	0xa, %r14
	.word 0xfedb89e0  ! 2672: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf2f52001  ! 2673: STXA_I	stxa	%r25, [%r20 + 0x0001] %asi
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983ec2  ! 2674: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec2, %hpstate
iob_intr_3_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_199), 16, 16)) -> intp(3, 0, 34)
iob_intr_3_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_200), 16, 16)) -> intp(3, 0, 24)
	.word 0xbc2de116  ! 2684: ANDN_I	andn 	%r23, 0x0116, %r30
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_NONHPRIV
	.word 0xf4254000  ! 2692: STW_R	stw	%r26, [%r21 + %r0]
cpu_intr_3_207:
	setx	0x320324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab58020  ! 2696: STHA_R	stha	%r29, [%r22 + %r0] 0x01
iob_intr_3_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_201), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_208:
	setx	0x310103, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_122:
	mov	0x8, %r14
	.word 0xfaf38e60  ! 2702: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_3_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_202), 16, 16)) -> intp(3, 0, 3a)
	.word 0xb935d000  ! 2710: SRLX_R	srlx	%r23, %r0, %r28
	.word 0xfc75a0ac  ! 2715: STX_I	stx	%r30, [%r22 + 0x00ac]
	.word 0xf0ade1b6  ! 2716: STBA_I	stba	%r24, [%r23 + 0x01b6] %asi
	.word 0xf42ce019  ! 2717: STB_I	stb	%r26, [%r19 + 0x0019]
iob_intr_3_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_203), 16, 16)) -> intp(3, 0, 28)
	.word 0xb405e0eb  ! 2720: ADD_I	add 	%r23, 0x00eb, %r26
	.word 0xfa2ce1a2  ! 2722: STB_I	stb	%r29, [%r19 + 0x01a2]
T3_asi_reg_wr_123:
	mov	0x3c1, %r14
	.word 0xf0f38e40  ! 2723: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb00cc000  ! 2727: AND_R	and 	%r19, %r0, %r24
cpu_intr_3_209:
	setx	0x33022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb42de07e  ! 2729: ANDN_I	andn 	%r23, 0x007e, %r26
	.word 0xb6bdc000  ! 2732: XNORcc_R	xnorcc 	%r23, %r0, %r27
T3_asi_reg_wr_124:
	mov	0x3c2, %r14
	.word 0xf6f384a0  ! 2733: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T3_asi_reg_rd_116:
	mov	0x1c, %r14
	.word 0xfedb84a0  ! 2734: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_3_210:
	setx	0x350317, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982e88  ! 2741: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e88, %hpstate
cpu_intr_3_211:
	setx	0x34020b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_117:
	mov	0x1e, %r14
	.word 0xfedb8e40  ! 2743: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf8b5e120  ! 2746: STHA_I	stha	%r28, [%r23 + 0x0120] %asi
iob_intr_3_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_204), 16, 16)) -> intp(3, 0, 31)
	.word 0xf675e03f  ! 2751: STX_I	stx	%r27, [%r23 + 0x003f]
	.word 0xf8a4a07f  ! 2753: STWA_I	stwa	%r28, [%r18 + 0x007f] %asi
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x819838c2  ! 2757: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18c2, %hpstate
T3_asi_reg_rd_118:
	mov	0x30, %r14
	.word 0xf2db8e80  ! 2759: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbe944000  ! 2760: ORcc_R	orcc 	%r17, %r0, %r31
	.word 0xfa2c8000  ! 2761: STB_R	stb	%r29, [%r18 + %r0]
	.word 0xfe248000  ! 2762: STW_R	stw	%r31, [%r18 + %r0]
	.word 0xb7518000  ! 2765: RDPR_PSTATE	rdpr	%pstate, %r27
T3_asi_reg_wr_125:
	mov	0x6, %r14
	.word 0xf2f384a0  ! 2767: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_3_212:
	setx	0x370210, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_126:
	mov	0x2f, %r14
	.word 0xfef38400  ! 2771: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_3_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_205), 16, 16)) -> intp(3, 0, 1b)
T3_asi_reg_rd_119:
	mov	0x3c0, %r14
	.word 0xfcdb8e80  ! 2774: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_3_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_206), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf4a42053  ! 2776: STWA_I	stwa	%r26, [%r16 + 0x0053] %asi
cpu_intr_3_213:
	setx	0x360230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4358000  ! 2778: STH_R	sth	%r26, [%r22 + %r0]
iob_intr_3_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_207), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf6b44020  ! 2780: STHA_R	stha	%r27, [%r17 + %r0] 0x01
	.word 0xfab4619c  ! 2781: STHA_I	stha	%r29, [%r17 + 0x019c] %asi
	.word 0xfaadc020  ! 2782: STBA_R	stba	%r29, [%r23 + %r0] 0x01
	.word 0xf874a004  ! 2783: STX_I	stx	%r28, [%r18 + 0x0004]
	.word 0xf8b4604e  ! 2784: STHA_I	stha	%r28, [%r17 + 0x004e] %asi
cpu_intr_3_214:
	setx	0x340237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62ce0e1  ! 2787: STB_I	stb	%r27, [%r19 + 0x00e1]
	.word 0xfe75212d  ! 2788: STX_I	stx	%r31, [%r20 + 0x012d]
	.word 0xb634e154  ! 2790: SUBC_I	orn 	%r19, 0x0154, %r27
	.word 0xf0ada083  ! 2791: STBA_I	stba	%r24, [%r22 + 0x0083] %asi
cpu_intr_3_215:
	setx	0x36023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_127:
	mov	0x27, %r14
	.word 0xf4f38e60  ! 2796: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf0258000  ! 2802: STW_R	stw	%r24, [%r22 + %r0]
cpu_intr_3_216:
	setx	0x360023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe34e09e  ! 2804: STH_I	sth	%r31, [%r19 + 0x009e]
	.word 0xb60561f2  ! 2807: ADD_I	add 	%r21, 0x01f2, %r27
cpu_intr_3_217:
	setx	0x36010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf8a40020  ! 2810: STWA_R	stwa	%r28, [%r16 + %r0] 0x01
iob_intr_3_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_208), 16, 16)) -> intp(3, 0, 3)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa7421ef  ! 2816: STX_I	stx	%r29, [%r16 + 0x01ef]
iob_intr_3_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_209), 16, 16)) -> intp(3, 0, 25)
	.word 0xf475a03d  ! 2819: STX_I	stx	%r26, [%r22 + 0x003d]
	.word 0xb03460ce  ! 2820: SUBC_I	orn 	%r17, 0x00ce, %r24
iob_intr_3_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_210), 16, 16)) -> intp(3, 0, 28)
	.word 0xf4ad4020  ! 2824: STBA_R	stba	%r26, [%r21 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_128:
	mov	0x1, %r14
	.word 0xfef389e0  ! 2827: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_3_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_211), 16, 16)) -> intp(3, 0, 7)
	.word 0xfab4219a  ! 2830: STHA_I	stha	%r29, [%r16 + 0x019a] %asi
	.word 0xbcb52138  ! 2831: SUBCcc_I	orncc 	%r20, 0x0138, %r30
	.word 0xf8ace149  ! 2833: STBA_I	stba	%r28, [%r19 + 0x0149] %asi
cpu_intr_3_218:
	setx	0x370332, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_120:
	mov	0x37, %r14
	.word 0xf6db8e40  ! 2840: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_3_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_212), 16, 16)) -> intp(3, 0, 32)
	.word 0xf4350000  ! 2849: STH_R	sth	%r26, [%r20 + %r0]
T3_asi_reg_rd_121:
	mov	0x2c, %r14
	.word 0xfedb8e40  ! 2851: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf0752011  ! 2852: STX_I	stx	%r24, [%r20 + 0x0011]
	.word 0xfaa561c3  ! 2854: STWA_I	stwa	%r29, [%r21 + 0x01c3] %asi
T3_asi_reg_wr_129:
	mov	0x3c6, %r14
	.word 0xf2f389e0  ! 2856: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_3_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_213), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_214), 16, 16)) -> intp(3, 0, e)
	.word 0x8595a109  ! 2863: WRPR_TSTATE_I	wrpr	%r22, 0x0109, %tstate
T3_asi_reg_rd_122:
	mov	0x27, %r14
	.word 0xf6db8400  ! 2865: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbe35e073  ! 2867: ORN_I	orn 	%r23, 0x0073, %r31
cpu_intr_3_219:
	setx	0x37021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf643801  ! 2869: MOVcc_I	<illegal instruction>
	.word 0xb6ac2087  ! 2873: ANDNcc_I	andncc 	%r16, 0x0087, %r27
	.word 0xfef5e065  ! 2876: STXA_I	stxa	%r31, [%r23 + 0x0065] %asi
T3_asi_reg_rd_123:
	mov	0xf, %r14
	.word 0xf6db8e60  ! 2878: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982dc2  ! 2879: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc2, %hpstate
	.word 0xf0b40020  ! 2885: STHA_R	stha	%r24, [%r16 + %r0] 0x01
T3_asi_reg_wr_130:
	mov	0x28, %r14
	.word 0xf2f384a0  ! 2887: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf0b54020  ! 2888: STHA_R	stha	%r24, [%r21 + %r0] 0x01
cpu_intr_3_220:
	setx	0x34000c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_215), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf8b40020  ! 2894: STHA_R	stha	%r28, [%r16 + %r0] 0x01
T3_asi_reg_wr_131:
	mov	0x30, %r14
	.word 0xf0f38e60  ! 2896: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_132:
	mov	0xb, %r14
	.word 0xfaf38400  ! 2899: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_3_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_216), 16, 16)) -> intp(3, 0, 10)
T3_asi_reg_rd_124:
	mov	0x3c3, %r14
	.word 0xf0db8e40  ! 2907: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_3_221:
	setx	0x37002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8195e158  ! 2909: WRPR_TPC_I	wrpr	%r23, 0x0158, %tpc
T3_asi_reg_wr_133:
	mov	0x1, %r14
	.word 0xf4f38e60  ! 2912: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T3_asi_reg_rd_125:
	mov	0x3c7, %r14
	.word 0xfcdb8400  ! 2914: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf8254000  ! 2915: STW_R	stw	%r28, [%r21 + %r0]
	ta	T_CHANGE_NONHPRIV
	.word 0xfcb4213c  ! 2922: STHA_I	stha	%r30, [%r16 + 0x013c] %asi
	.word 0xb03c4000  ! 2923: XNOR_R	xnor 	%r17, %r0, %r24
	.word 0xb52ce001  ! 2924: SLL_I	sll 	%r19, 0x0001, %r26
	.word 0xb32d2001  ! 2925: SLL_I	sll 	%r20, 0x0001, %r25
cpu_intr_3_222:
	setx	0x360206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2240000  ! 2927: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xb89d0000  ! 2930: XORcc_R	xorcc 	%r20, %r0, %r28
cpu_intr_3_223:
	setx	0x370208, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_217), 16, 16)) -> intp(3, 0, c)
	.word 0xf6b52007  ! 2934: STHA_I	stha	%r27, [%r20 + 0x0007] %asi
	.word 0xf82c60e9  ! 2936: STB_I	stb	%r28, [%r17 + 0x00e9]
	.word 0xf0754000  ! 2937: STX_R	stx	%r24, [%r21 + %r0]
T3_asi_reg_wr_134:
	mov	0x1d, %r14
	.word 0xf8f389e0  ! 2939: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_3_224:
	setx	0x34030b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_225:
	setx	0x350316, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_226:
	setx	0x35000f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_126:
	mov	0x23, %r14
	.word 0xfcdb8400  ! 2946: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf0744000  ! 2948: STX_R	stx	%r24, [%r17 + %r0]
iob_intr_3_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_218), 16, 16)) -> intp(3, 0, 16)
cpu_intr_3_227:
	setx	0x37020e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_228:
	setx	0x370209, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_127:
	mov	0x16, %r14
	.word 0xfcdb8e60  ! 2956: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T3_asi_reg_wr_135:
	mov	0x3c8, %r14
	.word 0xf6f38e40  ! 2958: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfcad20a6  ! 2959: STBA_I	stba	%r30, [%r20 + 0x00a6] %asi
iob_intr_3_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_219), 16, 16)) -> intp(3, 0, 30)
T3_asi_reg_rd_128:
	mov	0x33, %r14
	.word 0xf4db8400  ! 2961: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf0a4c020  ! 2964: STWA_R	stwa	%r24, [%r19 + %r0] 0x01
iob_intr_3_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_220), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_wr_136:
	mov	0xd, %r14
	.word 0xfaf38e40  ! 2969: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf4a54020  ! 2971: STWA_R	stwa	%r26, [%r21 + %r0] 0x01
T3_asi_reg_wr_137:
	mov	0x6, %r14
	.word 0xfef389e0  ! 2972: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T3_asi_reg_rd_129:
	mov	0x25, %r14
	.word 0xfcdb8e40  ! 2973: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	ta	T_CHANGE_TO_TL1
iob_intr_3_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_221), 16, 16)) -> intp(3, 0, 3a)
	.word 0xb41c0000  ! 2978: XOR_R	xor 	%r16, %r0, %r26
	.word 0xf4340000  ! 2979: STH_R	sth	%r26, [%r16 + %r0]
T3_asi_reg_wr_138:
	mov	0x3c4, %r14
	.word 0xf4f38e80  ! 2982: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T3_asi_reg_wr_139:
	mov	0x3c2, %r14
	.word 0xf6f384a0  ! 2984: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xfa2d8000  ! 2985: STB_R	stb	%r29, [%r22 + %r0]
	.word 0xbf51c000  ! 2988: RDPR_TL	rdpr	%tl, %r31
cpu_intr_3_229:
	setx	0x360135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf025216f  ! 2992: STW_I	stw	%r24, [%r20 + 0x016f]
	ta	T_CHANGE_NONHPRIV
iob_intr_3_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_222), 16, 16)) -> intp(3, 0, 1f)
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982a10  ! 2998: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a10, %hpstate
	.word 0xfa74c000  ! 2999: STX_R	stx	%r29, [%r19 + %r0]
T3_asi_reg_rd_130:
	mov	0x3c1, %r14
	.word 0xfcdb89e0  ! 3001: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb20ce1a2  ! 3002: AND_I	and 	%r19, 0x01a2, %r25
	ta	T_CHANGE_NONHPRIV
	.word 0xb00c8000  ! 3005: AND_R	and 	%r18, %r0, %r24
	.word 0x8595a18a  ! 3010: WRPR_TSTATE_I	wrpr	%r22, 0x018a, %tstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfab5c020  ! 3014: STHA_R	stha	%r29, [%r23 + %r0] 0x01
	.word 0xf4f5604b  ! 3015: STXA_I	stxa	%r26, [%r21 + 0x004b] %asi
	.word 0xb9641800  ! 3016: MOVcc_R	<illegal instruction>
	.word 0xfc2d20d7  ! 3023: STB_I	stb	%r30, [%r20 + 0x00d7]
iob_intr_3_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_223), 16, 16)) -> intp(3, 0, 1)
T3_asi_reg_rd_131:
	mov	0xc, %r14
	.word 0xfadb8400  ! 3027: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_3_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_224), 16, 16)) -> intp(3, 0, 21)
	.word 0xb80cc000  ! 3031: AND_R	and 	%r19, %r0, %r28
iob_intr_3_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_225), 16, 16)) -> intp(3, 0, 12)
	.word 0xb0b54000  ! 3038: ORNcc_R	orncc 	%r21, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_226), 16, 16)) -> intp(3, 0, a)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf0b5e075  ! 3042: STHA_I	stha	%r24, [%r23 + 0x0075] %asi
	.word 0xfeac214c  ! 3045: STBA_I	stba	%r31, [%r16 + 0x014c] %asi
T3_asi_reg_rd_132:
	mov	0x36, %r14
	.word 0xf2db8e80  ! 3047: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb1480000  ! 3048: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
T3_asi_reg_rd_133:
	mov	0x3c0, %r14
	.word 0xf2db8e80  ! 3049: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf075e0ea  ! 3050: STX_I	stx	%r24, [%r23 + 0x00ea]
cpu_intr_3_230:
	setx	0x37021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982a90  ! 3052: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a90, %hpstate
T3_asi_reg_wr_140:
	mov	0x10, %r14
	.word 0xf6f384a0  ! 3053: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf275e15c  ! 3055: STX_I	stx	%r25, [%r23 + 0x015c]
	.word 0xfa2d21a8  ! 3057: STB_I	stb	%r29, [%r20 + 0x01a8]
	.word 0xba948000  ! 3058: ORcc_R	orcc 	%r18, %r0, %r29
cpu_intr_3_231:
	setx	0x370331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6358000  ! 3062: STH_R	sth	%r27, [%r22 + %r0]
	.word 0xb82ce1eb  ! 3063: ANDN_I	andn 	%r19, 0x01eb, %r28
	.word 0xf2ad8020  ! 3065: STBA_R	stba	%r25, [%r22 + %r0] 0x01
	.word 0xfe75619e  ! 3066: STX_I	stx	%r31, [%r21 + 0x019e]
	.word 0xf8ad8020  ! 3067: STBA_R	stba	%r28, [%r22 + %r0] 0x01
	.word 0xf8752193  ! 3068: STX_I	stx	%r28, [%r20 + 0x0193]
	.word 0xfef4e02b  ! 3069: STXA_I	stxa	%r31, [%r19 + 0x002b] %asi
iob_intr_3_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_227), 16, 16)) -> intp(3, 0, 1f)
iob_intr_3_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_228), 16, 16)) -> intp(3, 0, 8)
	.word 0xfeace149  ! 3075: STBA_I	stba	%r31, [%r19 + 0x0149] %asi
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_TO_TL1
cpu_intr_3_232:
	setx	0x360201, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_3_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_229), 16, 16)) -> intp(3, 0, 35)
T3_asi_reg_rd_134:
	mov	0x1, %r14
	.word 0xfcdb8e40  ! 3085: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf02461c0  ! 3086: STW_I	stw	%r24, [%r17 + 0x01c0]
cpu_intr_3_233:
	setx	0x360321, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_141:
	mov	0x33, %r14
	.word 0xfcf38e80  ! 3088: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T3_asi_reg_rd_135:
	mov	0x29, %r14
	.word 0xf0db8400  ! 3093: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf0b5a0b5  ! 3094: STHA_I	stha	%r24, [%r22 + 0x00b5] %asi
	.word 0xbe2d0000  ! 3096: ANDN_R	andn 	%r20, %r0, %r31
T3_asi_reg_rd_136:
	mov	0x1e, %r14
	.word 0xfadb8e40  ! 3097: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_rd_137:
	mov	0x27, %r14
	.word 0xfadb8e60  ! 3106: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_3_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_230), 16, 16)) -> intp(3, 0, 23)
iob_intr_3_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_231), 16, 16)) -> intp(3, 0, 5)
T3_asi_reg_rd_138:
	mov	0x22, %r14
	.word 0xf2db8e40  ! 3111: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa2cc000  ! 3117: STB_R	stb	%r29, [%r19 + %r0]
iob_intr_3_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_232), 16, 16)) -> intp(3, 0, 3c)
	.word 0xfc2c6099  ! 3124: STB_I	stb	%r30, [%r17 + 0x0099]
cpu_intr_3_234:
	setx	0x350312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ade1ff  ! 3128: STBA_I	stba	%r27, [%r23 + 0x01ff] %asi
cpu_intr_3_235:
	setx	0x34021c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_233), 16, 16)) -> intp(3, 0, 27)
iob_intr_3_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_234), 16, 16)) -> intp(3, 0, 2b)
iob_intr_3_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_235), 16, 16)) -> intp(3, 0, 3)
iob_intr_3_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_236), 16, 16)) -> intp(3, 0, 20)
	.word 0xfea48020  ! 3142: STWA_R	stwa	%r31, [%r18 + %r0] 0x01
	.word 0xf2a5a02f  ! 3143: STWA_I	stwa	%r25, [%r22 + 0x002f] %asi
cpu_intr_3_236:
	setx	0x36022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4250000  ! 3150: STW_R	stw	%r26, [%r20 + %r0]
	.word 0xf42d6014  ! 3152: STB_I	stb	%r26, [%r21 + 0x0014]
iob_intr_3_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_237), 16, 16)) -> intp(3, 0, 34)
cpu_intr_3_237:
	setx	0x360315, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_238:
	setx	0x37012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_139:
	mov	0x38, %r14
	.word 0xfadb8400  ! 3156: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_3_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_238), 16, 16)) -> intp(3, 0, 10)
	.word 0xb5643801  ! 3158: MOVcc_I	<illegal instruction>
	.word 0xb6bd60a5  ! 3159: XNORcc_I	xnorcc 	%r21, 0x00a5, %r27
	.word 0xfc35e1ce  ! 3160: STH_I	sth	%r30, [%r23 + 0x01ce]
	.word 0xb72dd000  ! 3165: SLLX_R	sllx	%r23, %r0, %r27
	.word 0xb88d6181  ! 3168: ANDcc_I	andcc 	%r21, 0x0181, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_wr_142:
	mov	0x2f, %r14
	.word 0xfef384a0  ! 3172: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	ta	T_CHANGE_TO_TL1
	.word 0xf42d20b2  ! 3178: STB_I	stb	%r26, [%r20 + 0x00b2]
cpu_intr_3_239:
	setx	0x370106, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_239), 16, 16)) -> intp(3, 0, 9)
	.word 0xfa25e1df  ! 3184: STW_I	stw	%r29, [%r23 + 0x01df]
cpu_intr_3_240:
	setx	0x340007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62c6010  ! 3187: STB_I	stb	%r27, [%r17 + 0x0010]
T3_asi_reg_rd_140:
	mov	0x3c8, %r14
	.word 0xf8db8e80  ! 3188: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_3_241:
	setx	0x350004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a58020  ! 3193: STWA_R	stwa	%r24, [%r22 + %r0] 0x01
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983b4a  ! 3195: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b4a, %hpstate
	.word 0x8594e1cc  ! 3196: WRPR_TSTATE_I	wrpr	%r19, 0x01cc, %tstate
T3_asi_reg_wr_143:
	mov	0x3c3, %r14
	.word 0xf8f38e60  ! 3200: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982d9a  ! 3201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9a, %hpstate
cpu_intr_3_242:
	setx	0x38001c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_240), 16, 16)) -> intp(3, 0, 28)
	.word 0xbe44c000  ! 3207: ADDC_R	addc 	%r19, %r0, %r31
	.word 0xbb3c0000  ! 3210: SRA_R	sra 	%r16, %r0, %r29
T3_asi_reg_rd_141:
	mov	0xe, %r14
	.word 0xfcdb8e40  ! 3211: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf635609e  ! 3215: STH_I	sth	%r27, [%r21 + 0x009e]
	.word 0xfe2ca1cf  ! 3216: STB_I	stb	%r31, [%r18 + 0x01cf]
iob_intr_3_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_241), 16, 16)) -> intp(3, 0, 1)
	.word 0xfc2dc000  ! 3221: STB_R	stb	%r30, [%r23 + %r0]
	.word 0xfe2ca19a  ! 3224: STB_I	stb	%r31, [%r18 + 0x019a]
	.word 0xf0a42003  ! 3227: STWA_I	stwa	%r24, [%r16 + 0x0003] %asi
iob_intr_3_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_242), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_rd_142:
	mov	0x12, %r14
	.word 0xf8db8e80  ! 3231: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T3_asi_reg_rd_143:
	mov	0x1e, %r14
	.word 0xf2db8e80  ! 3233: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe2c201a  ! 3237: STB_I	stb	%r31, [%r16 + 0x001a]
	.word 0xf62c61b4  ! 3242: STB_I	stb	%r27, [%r17 + 0x01b4]
	ta	T_CHANGE_TO_TL0
	.word 0xf6a54020  ! 3244: STWA_R	stwa	%r27, [%r21 + %r0] 0x01
	.word 0xf22c0000  ! 3245: STB_R	stb	%r25, [%r16 + %r0]
	.word 0xfef5600a  ! 3246: STXA_I	stxa	%r31, [%r21 + 0x000a] %asi
T3_asi_reg_rd_144:
	mov	0x3c0, %r14
	.word 0xf8db8e40  ! 3250: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf435c000  ! 3252: STH_R	sth	%r26, [%r23 + %r0]
	.word 0xb535f001  ! 3253: SRLX_I	srlx	%r23, 0x0001, %r26
T3_asi_reg_rd_145:
	mov	0x26, %r14
	.word 0xfcdb89e0  ! 3254: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf4ac6048  ! 3255: STBA_I	stba	%r26, [%r17 + 0x0048] %asi
T3_asi_reg_wr_144:
	mov	0x3c6, %r14
	.word 0xfaf384a0  ! 3256: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xf675a04a  ! 3260: STX_I	stx	%r27, [%r22 + 0x004a]
	.word 0xfca520e3  ! 3262: STWA_I	stwa	%r30, [%r20 + 0x00e3] %asi
cpu_intr_3_243:
	setx	0x380322, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_145:
	mov	0x3c5, %r14
	.word 0xfaf38e80  ! 3267: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_3_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_243), 16, 16)) -> intp(3, 0, 32)
	ta	T_CHANGE_TO_TL1
iob_intr_3_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_244), 16, 16)) -> intp(3, 0, 20)
	.word 0xbd2c3001  ! 3275: SLLX_I	sllx	%r16, 0x0001, %r30
	ta	T_CHANGE_TO_TL1
	.word 0xfaa58020  ! 3277: STWA_R	stwa	%r29, [%r22 + %r0] 0x01
cpu_intr_3_244:
	setx	0x38002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe348000  ! 3280: STH_R	sth	%r31, [%r18 + %r0]
	.word 0xbea44000  ! 3281: SUBcc_R	subcc 	%r17, %r0, %r31
iob_intr_3_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_245), 16, 16)) -> intp(3, 0, 19)
	.word 0xb69c2142  ! 3283: XORcc_I	xorcc 	%r16, 0x0142, %r27
iob_intr_3_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_246), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_rd_146:
	mov	0x3c2, %r14
	.word 0xf4db8e40  ! 3286: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_245:
	setx	0x3a030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_146:
	mov	0x37, %r14
	.word 0xf4f38400  ! 3291: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL1
iob_intr_3_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_247), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf8348000  ! 3297: STH_R	sth	%r28, [%r18 + %r0]
	.word 0xfe742033  ! 3303: STX_I	stx	%r31, [%r16 + 0x0033]
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_147:
	mov	0x23, %r14
	.word 0xf2f38e60  ! 3306: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf0246143  ! 3308: STW_I	stw	%r24, [%r17 + 0x0143]
	.word 0xfcb5604d  ! 3311: STHA_I	stha	%r30, [%r21 + 0x004d] %asi
	.word 0xf8ac4020  ! 3312: STBA_R	stba	%r28, [%r17 + %r0] 0x01
cpu_intr_3_246:
	setx	0x3a0028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2258000  ! 3314: STW_R	stw	%r25, [%r22 + %r0]
cpu_intr_3_247:
	setx	0x38032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0752070  ! 3317: STX_I	stx	%r24, [%r20 + 0x0070]
	.word 0xf02461a5  ! 3319: STW_I	stw	%r24, [%r17 + 0x01a5]
T3_asi_reg_wr_148:
	mov	0x3c1, %r14
	.word 0xf4f38e60  ! 3322: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_3_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_248), 16, 16)) -> intp(3, 0, 1a)
cpu_intr_3_248:
	setx	0x3a0122, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_249:
	setx	0x3a031a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_149:
	mov	0xc, %r14
	.word 0xf2f384a0  ! 3329: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T3_asi_reg_rd_147:
	mov	0x26, %r14
	.word 0xfadb8e40  ! 3332: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_3_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_249), 16, 16)) -> intp(3, 0, f)
	.word 0xb0a4e132  ! 3338: SUBcc_I	subcc 	%r19, 0x0132, %r24
	.word 0xb7500000  ! 3339: RDPR_TPC	rdpr	%tpc, %r27
T3_asi_reg_wr_150:
	mov	0x11, %r14
	.word 0xf8f38e60  ! 3341: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_3_250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_250), 16, 16)) -> intp(3, 0, 32)
	.word 0xf02ca06a  ! 3348: STB_I	stb	%r24, [%r18 + 0x006a]
	.word 0xf025e0fa  ! 3349: STW_I	stw	%r24, [%r23 + 0x00fa]
	.word 0xf0254000  ! 3350: STW_R	stw	%r24, [%r21 + %r0]
cpu_intr_3_250:
	setx	0x390119, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_151:
	mov	0xa, %r14
	.word 0xf2f38e60  ! 3357: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xfe348000  ! 3359: STH_R	sth	%r31, [%r18 + %r0]
	.word 0xbf51c000  ! 3360: RDPR_TL	rdpr	%tl, %r31
	.word 0xf6a54020  ! 3363: STWA_R	stwa	%r27, [%r21 + %r0] 0x01
	.word 0xb53dd000  ! 3367: SRAX_R	srax	%r23, %r0, %r26
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983dc8  ! 3368: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dc8, %hpstate
cpu_intr_3_251:
	setx	0x380005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb35d000  ! 3370: SRLX_R	srlx	%r23, %r0, %r29
	.word 0xfcf421b1  ! 3371: STXA_I	stxa	%r30, [%r16 + 0x01b1] %asi
T3_asi_reg_rd_148:
	mov	0x29, %r14
	.word 0xfadb8400  ! 3373: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb4840000  ! 3375: ADDcc_R	addcc 	%r16, %r0, %r26
	.word 0xfe34a16e  ! 3376: STH_I	sth	%r31, [%r18 + 0x016e]
iob_intr_3_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_251), 16, 16)) -> intp(3, 0, 22)
T3_asi_reg_wr_152:
	mov	0x15, %r14
	.word 0xfef38e40  ! 3380: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfcb58020  ! 3385: STHA_R	stha	%r30, [%r22 + %r0] 0x01
	.word 0xfe34a1a8  ! 3386: STH_I	sth	%r31, [%r18 + 0x01a8]
iob_intr_3_252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_252), 16, 16)) -> intp(3, 0, 4)
cpu_intr_3_252:
	setx	0x380329, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_253), 16, 16)) -> intp(3, 0, 14)
	.word 0xba9cc000  ! 3394: XORcc_R	xorcc 	%r19, %r0, %r29
T3_asi_reg_wr_153:
	mov	0x2, %r14
	.word 0xf6f384a0  ! 3397: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983a92  ! 3398: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a92, %hpstate
T3_asi_reg_rd_149:
	mov	0x15, %r14
	.word 0xf8db8400  ! 3401: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_3_253:
	setx	0x3a032b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_254:
	setx	0x3a0322, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_154:
	mov	0xb, %r14
	.word 0xf0f38400  ! 3407: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_3_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_254), 16, 16)) -> intp(3, 0, 20)
	.word 0xba8de086  ! 3409: ANDcc_I	andcc 	%r23, 0x0086, %r29
T3_asi_reg_rd_150:
	mov	0x37, %r14
	.word 0xf4db8e40  ! 3411: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbaa50000  ! 3416: SUBcc_R	subcc 	%r20, %r0, %r29
	ta	T_CHANGE_TO_TL1
	.word 0xbd7d2401  ! 3426: MOVR_I	movre	%r20, 0x1, %r30
iob_intr_3_255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_255), 16, 16)) -> intp(3, 0, 11)
	.word 0xf624a122  ! 3431: STW_I	stw	%r27, [%r18 + 0x0122]
T3_asi_reg_wr_155:
	mov	0x37, %r14
	.word 0xf0f38e40  ! 3433: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T3_asi_reg_rd_151:
	mov	0x3c2, %r14
	.word 0xfadb89e0  ! 3434: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_3_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_256), 16, 16)) -> intp(3, 0, e)
iob_intr_3_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_257), 16, 16)) -> intp(3, 0, 12)
	.word 0xfa256052  ! 3440: STW_I	stw	%r29, [%r21 + 0x0052]
T3_asi_reg_wr_156:
	mov	0x25, %r14
	.word 0xf6f38400  ! 3441: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_3_258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_258), 16, 16)) -> intp(3, 0, 1f)
iob_intr_3_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_259), 16, 16)) -> intp(3, 0, 15)
	.word 0xf83520ad  ! 3446: STH_I	sth	%r28, [%r20 + 0x00ad]
	.word 0xf4b5202a  ! 3448: STHA_I	stha	%r26, [%r20 + 0x002a] %asi
	.word 0xf0258000  ! 3450: STW_R	stw	%r24, [%r22 + %r0]
	.word 0xf0f4e08d  ! 3451: STXA_I	stxa	%r24, [%r19 + 0x008d] %asi
iob_intr_3_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_260), 16, 16)) -> intp(3, 0, 1d)
	.word 0xfcf4a03a  ! 3454: STXA_I	stxa	%r30, [%r18 + 0x003a] %asi
	ta	T_CHANGE_HPRIV
cpu_intr_3_255:
	setx	0x38022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b5c020  ! 3461: STHA_R	stha	%r27, [%r23 + %r0] 0x01
	.word 0xbe3d60c1  ! 3462: XNOR_I	xnor 	%r21, 0x00c1, %r31
	.word 0xfe2d2097  ! 3466: STB_I	stb	%r31, [%r20 + 0x0097]
	.word 0xf0ace090  ! 3467: STBA_I	stba	%r24, [%r19 + 0x0090] %asi
	.word 0xbd346001  ! 3468: SRL_I	srl 	%r17, 0x0001, %r30
	.word 0x91952090  ! 3469: WRPR_PIL_I	wrpr	%r20, 0x0090, %pil
	.word 0xb69ca14e  ! 3470: XORcc_I	xorcc 	%r18, 0x014e, %r27
cpu_intr_3_256:
	setx	0x3a0234, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983902  ! 3472: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1902, %hpstate
	.word 0xf6a560a1  ! 3475: STWA_I	stwa	%r27, [%r21 + 0x00a1] %asi
iob_intr_3_261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_261), 16, 16)) -> intp(3, 0, 37)
	.word 0xf8adc020  ! 3481: STBA_R	stba	%r28, [%r23 + %r0] 0x01
cpu_intr_3_257:
	setx	0x390116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a4618d  ! 3483: STWA_I	stwa	%r24, [%r17 + 0x018d] %asi
iob_intr_3_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_262), 16, 16)) -> intp(3, 0, 35)
	.word 0xf2754000  ! 3487: STX_R	stx	%r25, [%r21 + %r0]
T3_asi_reg_rd_152:
	mov	0x19, %r14
	.word 0xfadb89e0  ! 3488: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_3_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_263), 16, 16)) -> intp(3, 0, 3)
	ta	T_CHANGE_NONHPRIV
	.word 0xba14613c  ! 3492: OR_I	or 	%r17, 0x013c, %r29
cpu_intr_3_258:
	setx	0x3b0031, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_157:
	mov	0x3c5, %r14
	.word 0xf4f38e80  ! 3494: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T3_asi_reg_wr_158:
	mov	0x5, %r14
	.word 0xf4f38e80  ! 3496: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_3_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_264), 16, 16)) -> intp(3, 0, 35)
	.word 0xf2354000  ! 3499: STH_R	sth	%r25, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_153:
	mov	0x3c3, %r14
	.word 0xfedb8400  ! 3502: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf4ad8020  ! 3506: STBA_R	stba	%r26, [%r22 + %r0] 0x01
	.word 0xf67561c7  ! 3507: STX_I	stx	%r27, [%r21 + 0x01c7]
T3_asi_reg_rd_154:
	mov	0x4, %r14
	.word 0xf4db8e60  ! 3508: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf2f4e009  ! 3512: STXA_I	stxa	%r25, [%r19 + 0x0009] %asi
iob_intr_3_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_265), 16, 16)) -> intp(3, 0, 16)
cpu_intr_3_259:
	setx	0x38032d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_266), 16, 16)) -> intp(3, 0, 26)
	.word 0xa1902001  ! 3523: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xfab44020  ! 3529: STHA_R	stha	%r29, [%r17 + %r0] 0x01
	.word 0xf22d6098  ! 3530: STB_I	stb	%r25, [%r21 + 0x0098]
T3_asi_reg_rd_155:
	mov	0x3c6, %r14
	.word 0xf0db8e80  ! 3531: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb28d20f9  ! 3533: ANDcc_I	andcc 	%r20, 0x00f9, %r25
	.word 0xf2248000  ! 3534: STW_R	stw	%r25, [%r18 + %r0]
	.word 0xbc05e16d  ! 3538: ADD_I	add 	%r23, 0x016d, %r30
	.word 0xfa244000  ! 3541: STW_R	stw	%r29, [%r17 + %r0]
	.word 0xb6bd61df  ! 3546: XNORcc_I	xnorcc 	%r21, 0x01df, %r27
	.word 0xfaf46121  ! 3547: STXA_I	stxa	%r29, [%r17 + 0x0121] %asi
	.word 0xf8a54020  ! 3549: STWA_R	stwa	%r28, [%r21 + %r0] 0x01
iob_intr_3_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_267), 16, 16)) -> intp(3, 0, 7)
	.word 0xf635601f  ! 3551: STH_I	sth	%r27, [%r21 + 0x001f]
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983fc2  ! 3556: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc2, %hpstate
T3_asi_reg_wr_159:
	mov	0x3c0, %r14
	.word 0xf8f38e40  ! 3558: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T3_asi_reg_rd_156:
	mov	0x3c1, %r14
	.word 0xfedb8e40  ! 3559: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_260:
	setx	0x39031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_160:
	mov	0x26, %r14
	.word 0xf8f384a0  ! 3561: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb2458000  ! 3563: ADDC_R	addc 	%r22, %r0, %r25
cpu_intr_3_261:
	setx	0x380001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a4e0bd  ! 3566: STWA_I	stwa	%r24, [%r19 + 0x00bd] %asi
iob_intr_3_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_268), 16, 16)) -> intp(3, 0, d)
	.word 0xf425c000  ! 3569: STW_R	stw	%r26, [%r23 + %r0]
	.word 0xb00c8000  ! 3570: AND_R	and 	%r18, %r0, %r24
iob_intr_3_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_269), 16, 16)) -> intp(3, 0, 1)
T3_asi_reg_wr_161:
	mov	0x3c2, %r14
	.word 0xf0f38e60  ! 3573: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xf0b5c020  ! 3576: STHA_R	stha	%r24, [%r23 + %r0] 0x01
	.word 0xfaa40020  ! 3577: STWA_R	stwa	%r29, [%r16 + %r0] 0x01
T3_asi_reg_wr_162:
	mov	0x7, %r14
	.word 0xfcf384a0  ! 3580: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfea5e1cc  ! 3582: STWA_I	stwa	%r31, [%r23 + 0x01cc] %asi
	.word 0xf6740000  ! 3583: STX_R	stx	%r27, [%r16 + %r0]
T3_asi_reg_wr_163:
	mov	0x3c1, %r14
	.word 0xf2f38e40  ! 3584: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf6f4a075  ! 3586: STXA_I	stxa	%r27, [%r18 + 0x0075] %asi
	.word 0xb8aca032  ! 3587: ANDNcc_I	andncc 	%r18, 0x0032, %r28
iob_intr_3_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_270), 16, 16)) -> intp(3, 0, 13)
	.word 0xfab50020  ! 3592: STHA_R	stha	%r29, [%r20 + %r0] 0x01
	.word 0xbe34c000  ! 3594: SUBC_R	orn 	%r19, %r0, %r31
iob_intr_3_271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_271), 16, 16)) -> intp(3, 0, 13)
	.word 0xbd51c000  ! 3598: RDPR_TL	rdpr	%tl, %r30
T3_asi_reg_rd_157:
	mov	0x3c3, %r14
	.word 0xf2db8e60  ! 3599: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbea460e9  ! 3604: SUBcc_I	subcc 	%r17, 0x00e9, %r31
	.word 0xf0b44020  ! 3605: STHA_R	stha	%r24, [%r17 + %r0] 0x01
T3_asi_reg_wr_164:
	mov	0x23, %r14
	.word 0xf8f38e60  ! 3607: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T3_asi_reg_wr_165:
	mov	0x25, %r14
	.word 0xfef38e40  ! 3612: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf6b4e1c5  ! 3613: STHA_I	stha	%r27, [%r19 + 0x01c5] %asi
iob_intr_3_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_272), 16, 16)) -> intp(3, 0, 2)
	.word 0xf6b50020  ! 3616: STHA_R	stha	%r27, [%r20 + %r0] 0x01
iob_intr_3_273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_273), 16, 16)) -> intp(3, 0, 20)
	.word 0xb335a001  ! 3624: SRL_I	srl 	%r22, 0x0001, %r25
	.word 0xbe152029  ! 3625: OR_I	or 	%r20, 0x0029, %r31
	.word 0xf0ac8020  ! 3626: STBA_R	stba	%r24, [%r18 + %r0] 0x01
iob_intr_3_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_274), 16, 16)) -> intp(3, 0, 30)
iob_intr_3_275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_275), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf62cc000  ! 3632: STB_R	stb	%r27, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
iob_intr_3_276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_276), 16, 16)) -> intp(3, 0, 21)
	.word 0xf624a079  ! 3640: STW_I	stw	%r27, [%r18 + 0x0079]
T3_asi_reg_wr_166:
	mov	0xe, %r14
	.word 0xf8f38e40  ! 3642: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf2b5e03e  ! 3643: STHA_I	stha	%r25, [%r23 + 0x003e] %asi
	ta	T_CHANGE_TO_TL0
	.word 0xfcb460c5  ! 3645: STHA_I	stha	%r30, [%r17 + 0x00c5] %asi
iob_intr_3_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_277), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf075a086  ! 3649: STX_I	stx	%r24, [%r22 + 0x0086]
	.word 0xf2a4a039  ! 3651: STWA_I	stwa	%r25, [%r18 + 0x0039] %asi
	ta	T_CHANGE_HPRIV
iob_intr_3_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_278), 16, 16)) -> intp(3, 0, 13)
iob_intr_3_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_279), 16, 16)) -> intp(3, 0, 3e)
cpu_intr_3_262:
	setx	0x3f0326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42dc000  ! 3664: STB_R	stb	%r26, [%r23 + %r0]
	.word 0xbc8de14a  ! 3665: ANDcc_I	andcc 	%r23, 0x014a, %r30
T3_asi_reg_wr_167:
	mov	0x3c6, %r14
	.word 0xfcf38400  ! 3666: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xf4b4203e  ! 3669: STHA_I	stha	%r26, [%r16 + 0x003e] %asi
iob_intr_3_280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_280), 16, 16)) -> intp(3, 0, 1f)
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982f48  ! 3671: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f48, %hpstate
	.word 0xfc2d61fa  ! 3672: STB_I	stb	%r30, [%r21 + 0x01fa]
T3_asi_reg_wr_168:
	mov	0x18, %r14
	.word 0xfef389e0  ! 3673: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf4ad8020  ! 3675: STBA_R	stba	%r26, [%r22 + %r0] 0x01
iob_intr_3_281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_281), 16, 16)) -> intp(3, 0, 22)
	.word 0xb33c5000  ! 3677: SRAX_R	srax	%r17, %r0, %r25
cpu_intr_3_263:
	setx	0x3f0114, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_264:
	setx	0x3f0135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd540000  ! 3682: RDPR_GL	rdpr	%-, %r30
iob_intr_3_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_282), 16, 16)) -> intp(3, 0, 27)
	.word 0xf27520fd  ! 3684: STX_I	stx	%r25, [%r20 + 0x00fd]
cpu_intr_3_265:
	setx	0x3f023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a5a0b4  ! 3686: STWA_I	stwa	%r24, [%r22 + 0x00b4] %asi
	.word 0xfcac8020  ! 3687: STBA_R	stba	%r30, [%r18 + %r0] 0x01
cpu_intr_3_266:
	setx	0x3c0316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb61d6051  ! 3689: XOR_I	xor 	%r21, 0x0051, %r27
	.word 0xf0b5604c  ! 3690: STHA_I	stha	%r24, [%r21 + 0x004c] %asi
	.word 0xf2a4c020  ! 3691: STWA_R	stwa	%r25, [%r19 + %r0] 0x01
cpu_intr_3_267:
	setx	0x3e031a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_158:
	mov	0x36, %r14
	.word 0xf0db89e0  ! 3696: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_3_268:
	setx	0x3f031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72c1000  ! 3700: SLLX_R	sllx	%r16, %r0, %r27
T3_asi_reg_rd_159:
	mov	0x3c0, %r14
	.word 0xfadb8e40  ! 3702: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf2b44020  ! 3703: STHA_R	stha	%r25, [%r17 + %r0] 0x01
cpu_intr_3_269:
	setx	0x3e0008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4742115  ! 3705: STX_I	stx	%r26, [%r16 + 0x0115]
	.word 0xf22c6004  ! 3706: STB_I	stb	%r25, [%r17 + 0x0004]
	.word 0xfa74a16e  ! 3709: STX_I	stx	%r29, [%r18 + 0x016e]
	.word 0xb62d202e  ! 3711: ANDN_I	andn 	%r20, 0x002e, %r27
	.word 0xfeb5a120  ! 3712: STHA_I	stha	%r31, [%r22 + 0x0120] %asi
iob_intr_3_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_283), 16, 16)) -> intp(3, 0, 3f)
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982ad8  ! 3714: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad8, %hpstate
	.word 0xf0ac2017  ! 3715: STBA_I	stba	%r24, [%r16 + 0x0017] %asi
	.word 0xfa7560e7  ! 3716: STX_I	stx	%r29, [%r21 + 0x00e7]
	.word 0xf2750000  ! 3718: STX_R	stx	%r25, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0xf0f5e11d  ! 3724: STXA_I	stxa	%r24, [%r23 + 0x011d] %asi
	.word 0xf4758000  ! 3725: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xb034204f  ! 3726: ORN_I	orn 	%r16, 0x004f, %r24
	ta	T_CHANGE_TO_TL0
iob_intr_3_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_284), 16, 16)) -> intp(3, 0, 26)
	.word 0xf23421ac  ! 3730: STH_I	sth	%r25, [%r16 + 0x01ac]
T3_asi_reg_wr_169:
	mov	0x3c4, %r14
	.word 0xfaf384a0  ! 3731: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T3_asi_reg_rd_160:
	mov	0x3c2, %r14
	.word 0xf2db8e80  ! 3734: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf475c000  ! 3736: STX_R	stx	%r26, [%r23 + %r0]
	.word 0xfcf42068  ! 3739: STXA_I	stxa	%r30, [%r16 + 0x0068] %asi
	.word 0xfa2560c3  ! 3742: STW_I	stw	%r29, [%r21 + 0x00c3]
	.word 0xf0aca156  ! 3743: STBA_I	stba	%r24, [%r18 + 0x0156] %asi
	setx	data_start_3, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982f18  ! 3744: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f18, %hpstate
	.word 0xfa75a17c  ! 3747: STX_I	stx	%r29, [%r22 + 0x017c]
iob_intr_3_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_285), 16, 16)) -> intp(3, 0, 3f)
	.word 0xfeaca113  ! 3750: STBA_I	stba	%r31, [%r18 + 0x0113] %asi
iob_intr_3_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_286), 16, 16)) -> intp(3, 0, 34)
cpu_intr_3_270:
	setx	0x3f022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82c0000  ! 3755: STB_R	stb	%r28, [%r16 + %r0]
	.word 0xfcb4e10c  ! 3757: STHA_I	stha	%r30, [%r19 + 0x010c] %asi
T3_asi_reg_wr_170:
	mov	0x14, %r14
	.word 0xfcf38400  ! 3758: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_3_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_287), 16, 16)) -> intp(3, 0, 36)
cpu_intr_3_271:
	setx	0x3c0018, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_288), 16, 16)) -> intp(3, 0, 23)
iob_intr_3_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_289), 16, 16)) -> intp(3, 0, 24)
	.word 0xba05a0b3  ! 3766: ADD_I	add 	%r22, 0x00b3, %r29
	.word 0xfa35e0e6  ! 3770: STH_I	sth	%r29, [%r23 + 0x00e6]
	.word 0xfef461f9  ! 3771: STXA_I	stxa	%r31, [%r17 + 0x01f9] %asi
iob_intr_3_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_290), 16, 16)) -> intp(3, 0, 0)
	.word 0xb834a042  ! 3774: ORN_I	orn 	%r18, 0x0042, %r28
T3_asi_reg_wr_171:
	mov	0x3c3, %r14
	.word 0xf8f389e0  ! 3778: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_3_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_291), 16, 16)) -> intp(3, 0, d)
T3_asi_reg_rd_161:
	mov	0x34, %r14
	.word 0xf8db89e0  ! 3782: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf0354000  ! 3783: STH_R	sth	%r24, [%r21 + %r0]
	.word 0xf824c000  ! 3784: STW_R	stw	%r28, [%r19 + %r0]
iob_intr_3_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_292), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf2ace0af  ! 3790: STBA_I	stba	%r25, [%r19 + 0x00af] %asi
	.word 0xb02d6076  ! 3791: ANDN_I	andn 	%r21, 0x0076, %r24
iob_intr_3_293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_293), 16, 16)) -> intp(3, 0, 4)
iob_intr_3_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_294), 16, 16)) -> intp(3, 0, 15)
iob_intr_3_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_295), 16, 16)) -> intp(3, 0, 14)
	.word 0xf2ad21a6  ! 3802: STBA_I	stba	%r25, [%r20 + 0x01a6] %asi
	.word 0xf8ac0020  ! 3804: STBA_R	stba	%r28, [%r16 + %r0] 0x01
T3_asi_reg_wr_172:
	mov	0x3c2, %r14
	.word 0xf8f38e80  ! 3806: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_3_272:
	setx	0x3c0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_3_273:
	setx	0x3c021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b4e0e4  ! 3810: STHA_I	stha	%r26, [%r19 + 0x00e4] %asi
	.word 0xfab54020  ! 3813: STHA_R	stha	%r29, [%r21 + %r0] 0x01
cpu_intr_3_274:
	setx	0x3c0227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa744000  ! 3816: STX_R	stx	%r29, [%r17 + %r0]
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_173:
	mov	0x3c3, %r14
	.word 0xf2f384a0  ! 3827: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb12d9000  ! 3829: SLLX_R	sllx	%r22, %r0, %r24
cpu_intr_3_275:
	setx	0x3c001f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_296), 16, 16)) -> intp(3, 0, 25)
iob_intr_3_297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_297), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_276:
	setx	0x3c0304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a5c020  ! 3840: STWA_R	stwa	%r24, [%r23 + %r0] 0x01
	.word 0xbd518000  ! 3844: RDPR_PSTATE	rdpr	%pstate, %r30
cpu_intr_3_277:
	setx	0x3d0315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22d6100  ! 3847: STB_I	stb	%r25, [%r21 + 0x0100]
	.word 0xfa2d216c  ! 3850: STB_I	stb	%r29, [%r20 + 0x016c]
	.word 0xb8c56041  ! 3851: ADDCcc_I	addccc 	%r21, 0x0041, %r28
cpu_intr_3_278:
	setx	0x3f033c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_298), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf42dc000  ! 3857: STB_R	stb	%r26, [%r23 + %r0]
	.word 0xf2a46022  ! 3859: STWA_I	stwa	%r25, [%r17 + 0x0022] %asi
iob_intr_3_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_299), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_rd_162:
	mov	0x36, %r14
	.word 0xf4db8e60  ! 3863: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T3_asi_reg_wr_174:
	mov	0x6, %r14
	.word 0xfaf384a0  ! 3867: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T3_asi_reg_rd_163:
	mov	0x2b, %r14
	.word 0xf0db8e60  ! 3870: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_3_279:
	setx	0x3e0125, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_164:
	mov	0x23, %r14
	.word 0xfadb8e60  ! 3872: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T3_asi_reg_wr_175:
	mov	0x12, %r14
	.word 0xf8f389e0  ! 3873: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_3_300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_300), 16, 16)) -> intp(3, 0, 1f)
iob_intr_3_301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_301), 16, 16)) -> intp(3, 0, 19)
iob_intr_3_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_302), 16, 16)) -> intp(3, 0, 6)
	.word 0xf874c000  ! 3887: STX_R	stx	%r28, [%r19 + %r0]
T3_asi_reg_wr_176:
	mov	0x2d, %r14
	.word 0xf2f38400  ! 3890: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_3_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_303), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_wr_177:
	mov	0x3c0, %r14
	.word 0xf6f389e0  ! 3893: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb734d000  ! 3896: SRLX_R	srlx	%r19, %r0, %r27
cpu_intr_3_280:
	setx	0x3e0200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf034e11f  ! 3899: STH_I	sth	%r24, [%r19 + 0x011f]
	ta	T_CHANGE_TO_TL0
iob_intr_3_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_304), 16, 16)) -> intp(3, 0, 3a)
	.word 0xfab44020  ! 3903: STHA_R	stha	%r29, [%r17 + %r0] 0x01
	.word 0xf424607c  ! 3906: STW_I	stw	%r26, [%r17 + 0x007c]
iob_intr_3_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_305), 16, 16)) -> intp(3, 0, 31)
cpu_intr_3_281:
	setx	0x3c0330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0346110  ! 3914: ORN_I	orn 	%r17, 0x0110, %r24
	.word 0xfa25a099  ! 3915: STW_I	stw	%r29, [%r22 + 0x0099]
cpu_intr_3_282:
	setx	0x3d013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xfe2d0000  ! 3920: STB_R	stb	%r31, [%r20 + %r0]
cpu_intr_3_283:
	setx	0x3c0301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a40020  ! 3924: STWA_R	stwa	%r28, [%r16 + %r0] 0x01
	.word 0xfca54020  ! 3925: STWA_R	stwa	%r30, [%r21 + %r0] 0x01
cpu_intr_3_284:
	setx	0x3f0035, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_3_285:
	setx	0x3f0011, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_306), 16, 16)) -> intp(3, 0, 30)
	.word 0xfaad6003  ! 3933: STBA_I	stba	%r29, [%r21 + 0x0003] %asi
	ta	T_CHANGE_TO_TL0
	.word 0xfa34e196  ! 3935: STH_I	sth	%r29, [%r19 + 0x0196]
T3_asi_reg_wr_178:
	mov	0x3c7, %r14
	.word 0xf6f38400  ! 3936: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf4352041  ! 3938: STH_I	sth	%r26, [%r20 + 0x0041]
T3_asi_reg_rd_165:
	mov	0x1f, %r14
	.word 0xf2db8e60  ! 3941: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb13d3001  ! 3943: SRAX_I	srax	%r20, 0x0001, %r24
cpu_intr_3_286:
	setx	0x3e0213, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_166:
	mov	0x31, %r14
	.word 0xf4db8e40  ! 3950: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_wr_179:
	mov	0x22, %r14
	.word 0xfaf38e80  ! 3952: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb02de0b3  ! 3954: ANDN_I	andn 	%r23, 0x00b3, %r24
cpu_intr_3_287:
	setx	0x3f0013, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_307), 16, 16)) -> intp(3, 0, 23)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3641800  ! 3962: MOVcc_R	<illegal instruction>
	.word 0xf0a52029  ! 3964: STWA_I	stwa	%r24, [%r20 + 0x0029] %asi
T3_asi_reg_wr_180:
	mov	0x3, %r14
	.word 0xf8f389e0  ! 3965: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_3_288:
	setx	0x3f0031, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_308), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_wr_181:
	mov	0x33, %r14
	.word 0xfcf384a0  ! 3969: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf2744000  ! 3973: STX_R	stx	%r25, [%r17 + %r0]
	.word 0xf4ac4020  ! 3975: STBA_R	stba	%r26, [%r17 + %r0] 0x01
	.word 0xb33d2001  ! 3976: SRA_I	sra 	%r20, 0x0001, %r25
iob_intr_3_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_309), 16, 16)) -> intp(3, 0, 2a)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2358000  ! 3979: STH_R	sth	%r25, [%r22 + %r0]
	.word 0xb8ade115  ! 3984: ANDNcc_I	andncc 	%r23, 0x0115, %r28
iob_intr_3_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_310), 16, 16)) -> intp(3, 0, 16)
	ta	T_CHANGE_TO_TL1
cpu_intr_3_289:
	setx	0x3d0326, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_311), 16, 16)) -> intp(3, 0, 3e)
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983b80  ! 3993: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b80, %hpstate
cpu_intr_3_290:
	setx	0x3c0205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe258000  ! 3997: STW_R	stw	%r31, [%r22 + %r0]
iob_intr_3_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_312), 16, 16)) -> intp(3, 0, 29)
T3_asi_reg_rd_167:
	mov	0x3c5, %r14
	.word 0xfcdb8e60  ! 4002: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T3_asi_reg_rd_168:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 4005: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf82de049  ! 4006: STB_I	stb	%r28, [%r23 + 0x0049]
T3_asi_reg_wr_182:
	mov	0x3, %r14
	.word 0xf4f38e80  ! 4007: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_183:
	mov	0x22, %r14
	.word 0xf2f38400  ! 4010: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_3_313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_313), 16, 16)) -> intp(3, 0, 2)
	.word 0xf4a5a190  ! 4013: STWA_I	stwa	%r26, [%r22 + 0x0190] %asi
	.word 0xfe2d0000  ! 4014: STB_R	stb	%r31, [%r20 + %r0]
	.word 0xfc346169  ! 4015: STH_I	sth	%r30, [%r17 + 0x0169]
	.word 0xf2340000  ! 4017: STH_R	sth	%r25, [%r16 + %r0]
T3_asi_reg_wr_184:
	mov	0x1e, %r14
	.word 0xfcf38e80  ! 4018: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xfcb5c020  ! 4024: STHA_R	stha	%r30, [%r23 + %r0] 0x01
iob_intr_3_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_314), 16, 16)) -> intp(3, 0, 33)
iob_intr_3_315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_315), 16, 16)) -> intp(3, 0, 6)
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
cpu_intr_3_291:
	setx	0x3c011f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_316), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_wr_185:
	mov	0x10, %r14
	.word 0xfef384a0  ! 4037: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xfe2d20e5  ! 4039: STB_I	stb	%r31, [%r20 + 0x00e5]
	.word 0xfe75e03c  ! 4041: STX_I	stx	%r31, [%r23 + 0x003c]
cpu_intr_3_292:
	setx	0x3d0206, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_317), 16, 16)) -> intp(3, 0, 1f)
cpu_intr_3_293:
	setx	0x3d0134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2c2169  ! 4046: STB_I	stb	%r29, [%r16 + 0x0169]
	.word 0xf8b52025  ! 4048: STHA_I	stha	%r28, [%r20 + 0x0025] %asi
iob_intr_3_318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_318), 16, 16)) -> intp(3, 0, 7)
iob_intr_3_319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_319), 16, 16)) -> intp(3, 0, 13)
	ta	T_CHANGE_HPRIV
	.word 0xfcad61d6  ! 4063: STBA_I	stba	%r30, [%r21 + 0x01d6] %asi
cpu_intr_3_294:
	setx	0x3c0213, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982940  ! 4066: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0940, %hpstate
	.word 0xfca460d4  ! 4068: STWA_I	stwa	%r30, [%r17 + 0x00d4] %asi
	.word 0xf42c8000  ! 4069: STB_R	stb	%r26, [%r18 + %r0]
iob_intr_3_320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_320), 16, 16)) -> intp(3, 0, c)
iob_intr_3_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_321), 16, 16)) -> intp(3, 0, 21)
	.word 0xbc252151  ! 4075: SUB_I	sub 	%r20, 0x0151, %r30
	.word 0xf22c618d  ! 4077: STB_I	stb	%r25, [%r17 + 0x018d]
T3_asi_reg_wr_186:
	mov	0x30, %r14
	.word 0xf6f389e0  ! 4081: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL1
iob_intr_3_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_322), 16, 16)) -> intp(3, 0, 5)
	.word 0xfab40020  ! 4086: STHA_R	stha	%r29, [%r16 + %r0] 0x01
cpu_intr_3_295:
	setx	0x3c002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_296:
	setx	0x3e0109, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_3_297:
	setx	0x3f0219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ad2098  ! 4099: STBA_I	stba	%r27, [%r20 + 0x0098] %asi
iob_intr_3_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_323), 16, 16)) -> intp(3, 0, 2b)
cpu_intr_3_298:
	setx	0x3c0108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a58020  ! 4104: STWA_R	stwa	%r28, [%r22 + %r0] 0x01
	.word 0xb1643801  ! 4105: MOVcc_I	<illegal instruction>
iob_intr_3_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_324), 16, 16)) -> intp(3, 0, 9)
	.word 0xf8a420ed  ! 4109: STWA_I	stwa	%r28, [%r16 + 0x00ed] %asi
T3_asi_reg_rd_169:
	mov	0x5, %r14
	.word 0xf4db8400  ! 4112: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T3_asi_reg_wr_187:
	mov	0x3c4, %r14
	.word 0xfef384a0  ! 4113: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_3_299:
	setx	0x420309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba258000  ! 4115: SUB_R	sub 	%r22, %r0, %r29
	.word 0xfa2ca1d0  ! 4116: STB_I	stb	%r29, [%r18 + 0x01d0]
	.word 0xb72c3001  ! 4118: SLLX_I	sllx	%r16, 0x0001, %r27
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983ec0  ! 4119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec0, %hpstate
	.word 0xfa2da0e9  ! 4120: STB_I	stb	%r29, [%r22 + 0x00e9]
	.word 0xf824606c  ! 4121: STW_I	stw	%r28, [%r17 + 0x006c]
	.word 0xbe344000  ! 4122: ORN_R	orn 	%r17, %r0, %r31
	.word 0xf63561b2  ! 4125: STH_I	sth	%r27, [%r21 + 0x01b2]
	.word 0xb2b44000  ! 4127: ORNcc_R	orncc 	%r17, %r0, %r25
	.word 0xfaf5a092  ! 4129: STXA_I	stxa	%r29, [%r22 + 0x0092] %asi
	.word 0xb835c000  ! 4132: SUBC_R	orn 	%r23, %r0, %r28
	.word 0xfa2c8000  ! 4133: STB_R	stb	%r29, [%r18 + %r0]
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982940  ! 4135: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0940, %hpstate
cpu_intr_3_300:
	setx	0x42002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6258000  ! 4139: STW_R	stw	%r27, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe35e104  ! 4145: STH_I	sth	%r31, [%r23 + 0x0104]
iob_intr_3_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_325), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_301:
	setx	0x41032f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_326), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_302:
	setx	0x400201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf675c000  ! 4156: STX_R	stx	%r27, [%r23 + %r0]
	.word 0xb8a4c000  ! 4157: SUBcc_R	subcc 	%r19, %r0, %r28
	.word 0xf67520c7  ! 4159: STX_I	stx	%r27, [%r20 + 0x00c7]
cpu_intr_3_303:
	setx	0x42030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6150000  ! 4164: OR_R	or 	%r20, %r0, %r27
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x819829c8  ! 4166: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c8, %hpstate
T3_asi_reg_rd_170:
	mov	0x32, %r14
	.word 0xfadb8400  ! 4167: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T3_asi_reg_wr_188:
	mov	0x2d, %r14
	.word 0xfaf38e80  ! 4170: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf0b46109  ! 4172: STHA_I	stha	%r24, [%r17 + 0x0109] %asi
cpu_intr_3_304:
	setx	0x40031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ac20bf  ! 4174: STBA_I	stba	%r24, [%r16 + 0x00bf] %asi
cpu_intr_3_305:
	setx	0x42032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca5e164  ! 4185: STWA_I	stwa	%r30, [%r23 + 0x0164] %asi
T3_asi_reg_rd_171:
	mov	0xa, %r14
	.word 0xfadb8e40  ! 4187: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf6b46144  ! 4188: STHA_I	stha	%r27, [%r17 + 0x0144] %asi
T3_asi_reg_wr_189:
	mov	0x19, %r14
	.word 0xf6f38e80  ! 4190: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T3_asi_reg_rd_172:
	mov	0x3c7, %r14
	.word 0xf0db89e0  ! 4192: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_3_327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_327), 16, 16)) -> intp(3, 0, 0)
	.word 0xfe24e01c  ! 4194: STW_I	stw	%r31, [%r19 + 0x001c]
	ta	T_CHANGE_HPRIV
	.word 0xf4a5201d  ! 4197: STWA_I	stwa	%r26, [%r20 + 0x001d] %asi
iob_intr_3_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_328), 16, 16)) -> intp(3, 0, 6)
	.word 0xb92c6001  ! 4200: SLL_I	sll 	%r17, 0x0001, %r28
	.word 0xfcb5e05c  ! 4201: STHA_I	stha	%r30, [%r23 + 0x005c] %asi
T3_asi_reg_rd_173:
	mov	0x35, %r14
	.word 0xf4db8e40  ! 4202: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfc2da184  ! 4203: STB_I	stb	%r30, [%r22 + 0x0184]
	.word 0xfc250000  ! 4205: STW_R	stw	%r30, [%r20 + %r0]
cpu_intr_3_306:
	setx	0x410337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a5c020  ! 4208: STWA_R	stwa	%r25, [%r23 + %r0] 0x01
	.word 0xfe350000  ! 4209: STH_R	sth	%r31, [%r20 + %r0]
cpu_intr_3_307:
	setx	0x410206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc746188  ! 4215: STX_I	stx	%r30, [%r17 + 0x0188]
	.word 0xfcb5218d  ! 4222: STHA_I	stha	%r30, [%r20 + 0x018d] %asi
cpu_intr_3_308:
	setx	0x40022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xb77da401  ! 4225: MOVR_I	movre	%r22, 0x1, %r27
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983c00  ! 4226: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c00, %hpstate
	.word 0xf635c000  ! 4229: STH_R	sth	%r27, [%r23 + %r0]
	.word 0xfe74e0e8  ! 4231: STX_I	stx	%r31, [%r19 + 0x00e8]
iob_intr_3_329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_329), 16, 16)) -> intp(3, 0, 14)
	.word 0xf424c000  ! 4238: STW_R	stw	%r26, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
iob_intr_3_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_330), 16, 16)) -> intp(3, 0, 10)
iob_intr_3_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_331), 16, 16)) -> intp(3, 0, a)
	.word 0xf2748000  ! 4248: STX_R	stx	%r25, [%r18 + %r0]
	.word 0xfcadc020  ! 4249: STBA_R	stba	%r30, [%r23 + %r0] 0x01
cpu_intr_3_309:
	setx	0x41031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xfaa44020  ! 4258: STWA_R	stwa	%r29, [%r17 + %r0] 0x01
cpu_intr_3_310:
	setx	0x400113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_332), 16, 16)) -> intp(3, 0, 0)
	.word 0xfa250000  ! 4261: STW_R	stw	%r29, [%r20 + %r0]
	.word 0xf034e1fd  ! 4263: STH_I	sth	%r24, [%r19 + 0x01fd]
T3_asi_reg_rd_174:
	mov	0x3c7, %r14
	.word 0xf4db8e40  ! 4264: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_311:
	setx	0x40023d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_312:
	setx	0x400308, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_333), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_rd_175:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 4269: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_3_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_334), 16, 16)) -> intp(3, 0, 11)
	.word 0xf6ad0020  ! 4273: STBA_R	stba	%r27, [%r20 + %r0] 0x01
T3_asi_reg_rd_176:
	mov	0x3, %r14
	.word 0xf0db8400  ! 4275: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf4ad4020  ! 4276: STBA_R	stba	%r26, [%r21 + %r0] 0x01
iob_intr_3_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_335), 16, 16)) -> intp(3, 0, 26)
	.word 0xf02ce098  ! 4279: STB_I	stb	%r24, [%r19 + 0x0098]
	ta	T_CHANGE_HPRIV
cpu_intr_3_313:
	setx	0x400129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb61cc000  ! 4284: XOR_R	xor 	%r19, %r0, %r27
cpu_intr_3_314:
	setx	0x42022b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_177:
	mov	0x26, %r14
	.word 0xfadb89e0  ! 4286: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf0354000  ! 4287: STH_R	sth	%r24, [%r21 + %r0]
	.word 0xbc9cc000  ! 4288: XORcc_R	xorcc 	%r19, %r0, %r30
iob_intr_3_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_336), 16, 16)) -> intp(3, 0, 34)
	.word 0xbcb42035  ! 4290: ORNcc_I	orncc 	%r16, 0x0035, %r30
T3_asi_reg_wr_190:
	mov	0x3c5, %r14
	.word 0xf0f38400  ! 4292: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_3_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_337), 16, 16)) -> intp(3, 0, 1b)
	.word 0xfa748000  ! 4294: STX_R	stx	%r29, [%r18 + %r0]
iob_intr_3_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_338), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf02d0000  ! 4298: STB_R	stb	%r24, [%r20 + %r0]
	.word 0xfe34a012  ! 4300: STH_I	sth	%r31, [%r18 + 0x0012]
	.word 0xb52c8000  ! 4302: SLL_R	sll 	%r18, %r0, %r26
T3_asi_reg_rd_178:
	mov	0x14, %r14
	.word 0xfadb8e60  ! 4304: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_3_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_339), 16, 16)) -> intp(3, 0, 28)
iob_intr_3_340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_340), 16, 16)) -> intp(3, 0, 3b)
iob_intr_3_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_341), 16, 16)) -> intp(3, 0, 13)
cpu_intr_3_315:
	setx	0x420320, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_316:
	setx	0x43021d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_342), 16, 16)) -> intp(3, 0, 38)
	.word 0xfeb56066  ! 4320: STHA_I	stha	%r31, [%r21 + 0x0066] %asi
	.word 0xf4a42182  ! 4321: STWA_I	stwa	%r26, [%r16 + 0x0182] %asi
T3_asi_reg_wr_191:
	mov	0x35, %r14
	.word 0xf6f38e80  ! 4324: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf2f5214a  ! 4325: STXA_I	stxa	%r25, [%r20 + 0x014a] %asi
T3_asi_reg_rd_179:
	mov	0x1c, %r14
	.word 0xfcdb8400  ! 4328: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb12c1000  ! 4334: SLLX_R	sllx	%r16, %r0, %r24
T3_asi_reg_wr_192:
	mov	0xe, %r14
	.word 0xfef38e80  ! 4337: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_3_343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_343), 16, 16)) -> intp(3, 0, 2a)
T3_asi_reg_rd_180:
	mov	0x3c1, %r14
	.word 0xf4db8e60  ! 4341: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_3_317:
	setx	0x40032a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_318:
	setx	0x41022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6354000  ! 4344: SUBC_R	orn 	%r21, %r0, %r27
	.word 0xf034a1b8  ! 4345: STH_I	sth	%r24, [%r18 + 0x01b8]
T3_asi_reg_rd_181:
	mov	0x24, %r14
	.word 0xf2db8400  ! 4347: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf2a5c020  ! 4349: STWA_R	stwa	%r25, [%r23 + %r0] 0x01
iob_intr_3_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_344), 16, 16)) -> intp(3, 0, 19)
	.word 0xb2b50000  ! 4353: SUBCcc_R	orncc 	%r20, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfe2461e5  ! 4358: STW_I	stw	%r31, [%r17 + 0x01e5]
	.word 0xfeb50020  ! 4364: STHA_R	stha	%r31, [%r20 + %r0] 0x01
	.word 0xf02c4000  ! 4366: STB_R	stb	%r24, [%r17 + %r0]
iob_intr_3_345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_345), 16, 16)) -> intp(3, 0, 1b)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_193:
	mov	0x2b, %r14
	.word 0xf6f38e40  ! 4370: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xba940000  ! 4371: ORcc_R	orcc 	%r16, %r0, %r29
T3_asi_reg_wr_194:
	mov	0x3c6, %r14
	.word 0xfaf389e0  ! 4372: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL1
	.word 0xf0ace014  ! 4375: STBA_I	stba	%r24, [%r19 + 0x0014] %asi
iob_intr_3_346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_346), 16, 16)) -> intp(3, 0, 11)
	.word 0xf634603d  ! 4379: STH_I	sth	%r27, [%r17 + 0x003d]
	.word 0xf024e0a2  ! 4380: STW_I	stw	%r24, [%r19 + 0x00a2]
	.word 0xb6b4e15c  ! 4381: SUBCcc_I	orncc 	%r19, 0x015c, %r27
	.word 0xf8344000  ! 4382: STH_R	sth	%r28, [%r17 + %r0]
T3_asi_reg_wr_195:
	mov	0xc, %r14
	.word 0xf6f38e60  ! 4383: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T3_asi_reg_wr_196:
	mov	0x3c7, %r14
	.word 0xf4f38e80  ! 4384: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_3_319:
	setx	0x430222, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_182:
	mov	0x36, %r14
	.word 0xfcdb8400  ! 4388: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf0252032  ! 4389: STW_I	stw	%r24, [%r20 + 0x0032]
iob_intr_3_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_347), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_rd_183:
	mov	0x3, %r14
	.word 0xf0db8e80  ! 4398: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_3_348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_348), 16, 16)) -> intp(3, 0, 22)
	.word 0xf6248000  ! 4405: STW_R	stw	%r27, [%r18 + %r0]
T3_asi_reg_rd_184:
	mov	0x1c, %r14
	.word 0xfedb8e40  ! 4406: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfa2c6085  ! 4407: STB_I	stb	%r29, [%r17 + 0x0085]
	.word 0xf8758000  ! 4408: STX_R	stx	%r28, [%r22 + %r0]
	.word 0xf8f42187  ! 4410: STXA_I	stxa	%r28, [%r16 + 0x0187] %asi
	.word 0xf0ac4020  ! 4413: STBA_R	stba	%r24, [%r17 + %r0] 0x01
T3_asi_reg_rd_185:
	mov	0x38, %r14
	.word 0xf2db8e80  ! 4415: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_3_349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_349), 16, 16)) -> intp(3, 0, 21)
	.word 0xf8248000  ! 4417: STW_R	stw	%r28, [%r18 + %r0]
cpu_intr_3_320:
	setx	0x42030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_321:
	setx	0x43002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_350), 16, 16)) -> intp(3, 0, 37)
	.word 0xfa74610e  ! 4433: STX_I	stx	%r29, [%r17 + 0x010e]
	.word 0xfa2d0000  ! 4438: STB_R	stb	%r29, [%r20 + %r0]
	.word 0xbf2c1000  ! 4440: SLLX_R	sllx	%r16, %r0, %r31
T3_asi_reg_wr_197:
	mov	0x3c7, %r14
	.word 0xfef38e80  ! 4441: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xfa35c000  ! 4443: STH_R	sth	%r29, [%r23 + %r0]
	.word 0xfc3421ce  ! 4445: STH_I	sth	%r30, [%r16 + 0x01ce]
	.word 0xf024c000  ! 4447: STW_R	stw	%r24, [%r19 + %r0]
	.word 0xb02d4000  ! 4449: ANDN_R	andn 	%r21, %r0, %r24
	.word 0xb135e001  ! 4452: SRL_I	srl 	%r23, 0x0001, %r24
T3_asi_reg_wr_198:
	mov	0x22, %r14
	.word 0xfaf38400  ! 4454: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbc0c4000  ! 4455: AND_R	and 	%r17, %r0, %r30
iob_intr_3_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_351), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_352), 16, 16)) -> intp(3, 0, 9)
iob_intr_3_353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_353), 16, 16)) -> intp(3, 0, 11)
iob_intr_3_354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_354), 16, 16)) -> intp(3, 0, c)
	.word 0xf424a060  ! 4465: STW_I	stw	%r26, [%r18 + 0x0060]
T3_asi_reg_rd_186:
	mov	0x3c8, %r14
	.word 0xfadb84a0  ! 4466: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_3_355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_355), 16, 16)) -> intp(3, 0, 2a)
	.word 0xbb2c2001  ! 4469: SLL_I	sll 	%r16, 0x0001, %r29
iob_intr_3_356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_356), 16, 16)) -> intp(3, 0, 3)
iob_intr_3_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_357), 16, 16)) -> intp(3, 0, e)
iob_intr_3_358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_358), 16, 16)) -> intp(3, 0, 4)
cpu_intr_3_322:
	setx	0x430131, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_199:
	mov	0x1f, %r14
	.word 0xf2f389e0  ! 4478: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf42d0000  ! 4479: STB_R	stb	%r26, [%r20 + %r0]
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983e8a  ! 4480: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e8a, %hpstate
iob_intr_3_359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_359), 16, 16)) -> intp(3, 0, 21)
	.word 0xf6ad0020  ! 4484: STBA_R	stba	%r27, [%r20 + %r0] 0x01
cpu_intr_3_323:
	setx	0x410337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ad60c4  ! 4486: STBA_I	stba	%r28, [%r21 + 0x00c4] %asi
	.word 0xf0ace099  ! 4487: STBA_I	stba	%r24, [%r19 + 0x0099] %asi
	.word 0xfc240000  ! 4490: STW_R	stw	%r30, [%r16 + %r0]
iob_intr_3_360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_360), 16, 16)) -> intp(3, 0, 22)
T3_asi_reg_wr_200:
	mov	0x29, %r14
	.word 0xf2f38e60  ! 4492: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
iob_intr_3_361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_361), 16, 16)) -> intp(3, 0, 23)
T3_asi_reg_rd_187:
	mov	0x3c1, %r14
	.word 0xf2db8e60  ! 4495: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf0b48020  ! 4496: STHA_R	stha	%r24, [%r18 + %r0] 0x01
	.word 0xf2a5c020  ! 4498: STWA_R	stwa	%r25, [%r23 + %r0] 0x01
cpu_intr_3_324:
	setx	0x42030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_325:
	setx	0x430005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6acc000  ! 4502: ANDNcc_R	andncc 	%r19, %r0, %r27
	.word 0xf075e1ac  ! 4503: STX_I	stx	%r24, [%r23 + 0x01ac]
T3_asi_reg_rd_188:
	mov	0x17, %r14
	.word 0xf0db8e40  ! 4504: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfe258000  ! 4505: STW_R	stw	%r31, [%r22 + %r0]
cpu_intr_3_326:
	setx	0x420239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf425c000  ! 4510: STW_R	stw	%r26, [%r23 + %r0]
cpu_intr_3_327:
	setx	0x43010a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_362), 16, 16)) -> intp(3, 0, 15)
	.word 0xfc752077  ! 4515: STX_I	stx	%r30, [%r20 + 0x0077]
	.word 0xb2448000  ! 4516: ADDC_R	addc 	%r18, %r0, %r25
	.word 0xf4b5a096  ! 4517: STHA_I	stha	%r26, [%r22 + 0x0096] %asi
iob_intr_3_363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_363), 16, 16)) -> intp(3, 0, 6)
	.word 0xf2244000  ! 4519: STW_R	stw	%r25, [%r17 + %r0]
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982ad2  ! 4520: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad2, %hpstate
T3_asi_reg_rd_189:
	mov	0x2b, %r14
	.word 0xf4db8e80  ! 4521: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xf2358000  ! 4522: STH_R	sth	%r25, [%r22 + %r0]
iob_intr_3_364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_364), 16, 16)) -> intp(3, 0, f)
iob_intr_3_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_365), 16, 16)) -> intp(3, 0, b)
	.word 0xfc248000  ! 4532: STW_R	stw	%r30, [%r18 + %r0]
	.word 0xf62c4000  ! 4535: STB_R	stb	%r27, [%r17 + %r0]
T3_asi_reg_wr_201:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 4536: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfe354000  ! 4537: STH_R	sth	%r31, [%r21 + %r0]
	.word 0xf2b4c020  ! 4538: STHA_R	stha	%r25, [%r19 + %r0] 0x01
iob_intr_3_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_366), 16, 16)) -> intp(3, 0, 2d)
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
iob_intr_3_367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_367), 16, 16)) -> intp(3, 0, 2c)
	.word 0xfcace0ec  ! 4546: STBA_I	stba	%r30, [%r19 + 0x00ec] %asi
T3_asi_reg_rd_190:
	mov	0x3c2, %r14
	.word 0xf2db84a0  ! 4552: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_3_368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_368), 16, 16)) -> intp(3, 0, 28)
iob_intr_3_369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_369), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_328:
	setx	0x430002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_370), 16, 16)) -> intp(3, 0, 27)
cpu_intr_3_329:
	setx	0x400233, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_371), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf074a19f  ! 4562: STX_I	stx	%r24, [%r18 + 0x019f]
	.word 0xf0748000  ! 4564: STX_R	stx	%r24, [%r18 + %r0]
T3_asi_reg_rd_191:
	mov	0x5, %r14
	.word 0xf2db8e80  ! 4567: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T3_asi_reg_rd_192:
	mov	0x24, %r14
	.word 0xf4db84a0  ! 4568: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T3_asi_reg_rd_193:
	mov	0x1a, %r14
	.word 0xf0db8e40  ! 4571: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	ta	T_CHANGE_TO_TL1
iob_intr_3_372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_372), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_330:
	setx	0x460313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb42085  ! 4577: STHA_I	stha	%r30, [%r16 + 0x0085] %asi
	.word 0xfea420de  ! 4578: STWA_I	stwa	%r31, [%r16 + 0x00de] %asi
	.word 0xb0b48000  ! 4580: ORNcc_R	orncc 	%r18, %r0, %r24
cpu_intr_3_331:
	setx	0x45030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba2c2125  ! 4585: ANDN_I	andn 	%r16, 0x0125, %r29
	.word 0xf82d8000  ! 4586: STB_R	stb	%r28, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf8ac8020  ! 4589: STBA_R	stba	%r28, [%r18 + %r0] 0x01
T3_asi_reg_wr_202:
	mov	0x2f, %r14
	.word 0xfcf38e60  ! 4591: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb7643801  ! 4595: MOVcc_I	<illegal instruction>
	.word 0xfc34e10a  ! 4596: STH_I	sth	%r30, [%r19 + 0x010a]
cpu_intr_3_332:
	setx	0x440204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb81d60e8  ! 4603: XOR_I	xor 	%r21, 0x00e8, %r28
cpu_intr_3_333:
	setx	0x450306, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_203:
	mov	0x15, %r14
	.word 0xf2f38e60  ! 4607: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_3_334:
	setx	0x440329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02ca134  ! 4612: STB_I	stb	%r24, [%r18 + 0x0134]
	.word 0xbf643801  ! 4615: MOVcc_I	<illegal instruction>
	.word 0xb1347001  ! 4616: SRLX_I	srlx	%r17, 0x0001, %r24
cpu_intr_3_335:
	setx	0x47033e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_336:
	setx	0x45020a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_373:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_373), 16, 16)) -> intp(3, 0, 36)
	.word 0xf2ad4020  ! 4623: STBA_R	stba	%r25, [%r21 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_TO_TL0
cpu_intr_3_337:
	setx	0x460332, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_338:
	setx	0x440317, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_194:
	mov	0x3c1, %r14
	.word 0xf2db84a0  ! 4630: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf22ca1ce  ! 4631: STB_I	stb	%r25, [%r18 + 0x01ce]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf0a561d9  ! 4641: STWA_I	stwa	%r24, [%r21 + 0x01d9] %asi
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983c1a  ! 4645: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c1a, %hpstate
	.word 0xf6a5a049  ! 4648: STWA_I	stwa	%r27, [%r22 + 0x0049] %asi
	ta	T_CHANGE_TO_TL1
	.word 0xf874e1b0  ! 4650: STX_I	stx	%r28, [%r19 + 0x01b0]
iob_intr_3_374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_374), 16, 16)) -> intp(3, 0, 35)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
iob_intr_3_375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_375), 16, 16)) -> intp(3, 0, 26)
cpu_intr_3_339:
	setx	0x470130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2dc000  ! 4666: STB_R	stb	%r30, [%r23 + %r0]
iob_intr_3_376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_376), 16, 16)) -> intp(3, 0, 2)
T3_asi_reg_rd_195:
	mov	0x22, %r14
	.word 0xf8db84a0  ! 4668: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xfe748000  ! 4671: STX_R	stx	%r31, [%r18 + %r0]
	.word 0xfa2c618d  ! 4673: STB_I	stb	%r29, [%r17 + 0x018d]
	.word 0xb2b4c000  ! 4675: SUBCcc_R	orncc 	%r19, %r0, %r25
	.word 0xf63460b8  ! 4676: STH_I	sth	%r27, [%r17 + 0x00b8]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf234c000  ! 4679: STH_R	sth	%r25, [%r19 + %r0]
iob_intr_3_377:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_377), 16, 16)) -> intp(3, 0, 1b)
	.word 0xfe248000  ! 4683: STW_R	stw	%r31, [%r18 + %r0]
cpu_intr_3_340:
	setx	0x470008, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_204:
	mov	0x1e, %r14
	.word 0xf2f38e40  ! 4688: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfe2de02d  ! 4689: STB_I	stb	%r31, [%r23 + 0x002d]
iob_intr_3_378:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_378), 16, 16)) -> intp(3, 0, 27)
	.word 0xf6b42080  ! 4691: STHA_I	stha	%r27, [%r16 + 0x0080] %asi
T3_asi_reg_rd_196:
	mov	0x34, %r14
	.word 0xf0db8e60  ! 4692: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	ta	T_CHANGE_TO_TL1
cpu_intr_3_341:
	setx	0x47012c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_342:
	setx	0x450017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2bc8000  ! 4706: XNORcc_R	xnorcc 	%r18, %r0, %r25
	.word 0xb12d5000  ! 4708: SLLX_R	sllx	%r21, %r0, %r24
	.word 0xfa748000  ! 4709: STX_R	stx	%r29, [%r18 + %r0]
	.word 0xf2b42132  ! 4710: STHA_I	stha	%r25, [%r16 + 0x0132] %asi
iob_intr_3_379:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_379), 16, 16)) -> intp(3, 0, 1)
	.word 0xf474c000  ! 4714: STX_R	stx	%r26, [%r19 + %r0]
	.word 0xf27560f8  ! 4718: STX_I	stx	%r25, [%r21 + 0x00f8]
T3_asi_reg_wr_205:
	mov	0x3c8, %r14
	.word 0xf2f38e60  ! 4720: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_3_343:
	setx	0x45020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaf461bd  ! 4722: STXA_I	stxa	%r29, [%r17 + 0x01bd] %asi
iob_intr_3_380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_380), 16, 16)) -> intp(3, 0, e)
	.word 0xf0240000  ! 4725: STW_R	stw	%r24, [%r16 + %r0]
cpu_intr_3_344:
	setx	0x1d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ad4020  ! 4727: STBA_R	stba	%r26, [%r21 + %r0] 0x01
T3_asi_reg_wr_206:
	mov	0x3c6, %r14
	.word 0xfef38e60  ! 4729: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb73cb001  ! 4730: SRAX_I	srax	%r18, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0xbf3d9000  ! 4737: SRAX_R	srax	%r22, %r0, %r31
T3_asi_reg_rd_197:
	mov	0x3c6, %r14
	.word 0xf0db8e40  ! 4742: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_3_381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_381), 16, 16)) -> intp(3, 0, d)
cpu_intr_3_345:
	setx	0x47021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42460e6  ! 4750: STW_I	stw	%r26, [%r17 + 0x00e6]
	.word 0xf22ce1b9  ! 4751: STB_I	stb	%r25, [%r19 + 0x01b9]
cpu_intr_3_346:
	setx	0x45000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa24606f  ! 4754: STW_I	stw	%r29, [%r17 + 0x006f]
iob_intr_3_382:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_382), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf2248000  ! 4756: STW_R	stw	%r25, [%r18 + %r0]
iob_intr_3_383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_383), 16, 16)) -> intp(3, 0, 1e)
cpu_intr_3_347:
	setx	0x450312, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983c42  ! 4762: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c42, %hpstate
T3_asi_reg_rd_198:
	mov	0x32, %r14
	.word 0xf6db8e60  ! 4763: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_3_348:
	setx	0x470006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0f56163  ! 4766: STXA_I	stxa	%r24, [%r21 + 0x0163] %asi
	.word 0xb284e175  ! 4771: ADDcc_I	addcc 	%r19, 0x0175, %r25
cpu_intr_3_349:
	setx	0x440120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b421ca  ! 4776: ORNcc_I	orncc 	%r16, 0x01ca, %r27
	.word 0xfcb521b3  ! 4778: STHA_I	stha	%r30, [%r20 + 0x01b3] %asi
iob_intr_3_384:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_384), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf0258000  ! 4782: STW_R	stw	%r24, [%r22 + %r0]
	.word 0xbf641800  ! 4785: MOVcc_R	<illegal instruction>
T3_asi_reg_wr_207:
	mov	0x3c5, %r14
	.word 0xf4f38400  ! 4786: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_3_385:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_385), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_350:
	setx	0x440123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaadc020  ! 4791: STBA_R	stba	%r29, [%r23 + %r0] 0x01
	.word 0xf224e124  ! 4792: STW_I	stw	%r25, [%r19 + 0x0124]
T3_asi_reg_wr_208:
	mov	0xa, %r14
	.word 0xfaf384a0  ! 4796: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xfaa44020  ! 4797: STWA_R	stwa	%r29, [%r17 + %r0] 0x01
	.word 0xfead8020  ! 4798: STBA_R	stba	%r31, [%r22 + %r0] 0x01
T3_asi_reg_rd_199:
	mov	0x0, %r14
	.word 0xf6db8400  ! 4799: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf0b4a16e  ! 4800: STHA_I	stha	%r24, [%r18 + 0x016e] %asi
cpu_intr_3_351:
	setx	0x44023e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_352:
	setx	0x46032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_209:
	mov	0x4, %r14
	.word 0xfcf384a0  ! 4806: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb8c54000  ! 4807: ADDCcc_R	addccc 	%r21, %r0, %r28
T3_asi_reg_rd_200:
	mov	0x38, %r14
	.word 0xf4db84a0  ! 4809: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_3_353:
	setx	0x470130, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_210:
	mov	0x2b, %r14
	.word 0xf4f38e80  ! 4814: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf8ace1c3  ! 4815: STBA_I	stba	%r28, [%r19 + 0x01c3] %asi
cpu_intr_3_354:
	setx	0x440006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb68d8000  ! 4818: ANDcc_R	andcc 	%r22, %r0, %r27
T3_asi_reg_wr_211:
	mov	0x3c4, %r14
	.word 0xf8f38e60  ! 4822: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf62d219c  ! 4823: STB_I	stb	%r27, [%r20 + 0x019c]
	.word 0xf2b44020  ! 4824: STHA_R	stha	%r25, [%r17 + %r0] 0x01
iob_intr_3_386:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_386), 16, 16)) -> intp(3, 0, 3a)
	ta	T_CHANGE_TO_TL0
	.word 0xfa2d2145  ! 4829: STB_I	stb	%r29, [%r20 + 0x0145]
iob_intr_3_387:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_387), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_355:
	setx	0x44030e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_388:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_388), 16, 16)) -> intp(3, 0, 4)
	.word 0xf2a50020  ! 4840: STWA_R	stwa	%r25, [%r20 + %r0] 0x01
	.word 0xf6b460e5  ! 4841: STHA_I	stha	%r27, [%r17 + 0x00e5] %asi
cpu_intr_3_356:
	setx	0x46032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa5c020  ! 4844: STWA_R	stwa	%r29, [%r23 + %r0] 0x01
	.word 0xf8b5e112  ! 4845: STHA_I	stha	%r28, [%r23 + 0x0112] %asi
	.word 0xfa3561a4  ! 4846: STH_I	sth	%r29, [%r21 + 0x01a4]
cpu_intr_3_357:
	setx	0x44020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8258000  ! 4850: STW_R	stw	%r28, [%r22 + %r0]
T3_asi_reg_rd_201:
	mov	0x1a, %r14
	.word 0xf6db8e60  ! 4855: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xfeac0020  ! 4857: STBA_R	stba	%r31, [%r16 + %r0] 0x01
	.word 0xbeb54000  ! 4858: SUBCcc_R	orncc 	%r21, %r0, %r31
	ta	T_CHANGE_TO_TL1
	.word 0xf474e16e  ! 4860: STX_I	stx	%r26, [%r19 + 0x016e]
	.word 0xb5500000  ! 4861: RDPR_TPC	rdpr	%tpc, %r26
cpu_intr_3_358:
	setx	0x470107, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_359:
	setx	0x470124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa75c000  ! 4865: STX_R	stx	%r29, [%r23 + %r0]
T3_asi_reg_rd_202:
	mov	0x2a, %r14
	.word 0xf8db8400  ! 4866: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb32d3001  ! 4867: SLLX_I	sllx	%r20, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbd359000  ! 4870: SRLX_R	srlx	%r22, %r0, %r30
	.word 0xfe244000  ! 4873: STW_R	stw	%r31, [%r17 + %r0]
T3_asi_reg_wr_212:
	mov	0x3c6, %r14
	.word 0xfef384a0  ! 4880: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_3_389:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_389), 16, 16)) -> intp(3, 0, 2e)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfea44020  ! 4888: STWA_R	stwa	%r31, [%r17 + %r0] 0x01
	.word 0xf2744000  ! 4889: STX_R	stx	%r25, [%r17 + %r0]
T3_asi_reg_rd_203:
	mov	0x3c8, %r14
	.word 0xf8db8e80  ! 4890: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x8198298a  ! 4899: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098a, %hpstate
cpu_intr_3_360:
	setx	0x450200, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_204:
	mov	0x10, %r14
	.word 0xf0db8e80  ! 4902: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb8348000  ! 4903: SUBC_R	orn 	%r18, %r0, %r28
T3_asi_reg_wr_213:
	mov	0x3c6, %r14
	.word 0xf4f38400  ! 4904: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_361:
	setx	0x470237, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_362:
	setx	0x460337, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_205:
	mov	0x2e, %r14
	.word 0xf0db8e80  ! 4909: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_363:
	setx	0x44030f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_364:
	setx	0x450319, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_wr_214:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 4917: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_365:
	setx	0x470003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ac8020  ! 4921: STBA_R	stba	%r24, [%r18 + %r0] 0x01
cpu_intr_3_366:
	setx	0x440314, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xb03cc000  ! 4926: XNOR_R	xnor 	%r19, %r0, %r24
	.word 0xf0750000  ! 4927: STX_R	stx	%r24, [%r20 + %r0]
cpu_intr_3_367:
	setx	0x450211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8dc000  ! 4930: ANDcc_R	andcc 	%r23, %r0, %r30
	.word 0xfeac0020  ! 4932: STBA_R	stba	%r31, [%r16 + %r0] 0x01
	.word 0xf2254000  ! 4933: STW_R	stw	%r25, [%r21 + %r0]
iob_intr_3_390:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_390), 16, 16)) -> intp(3, 0, b)
	ta	T_CHANGE_TO_TL1
	.word 0xfe250000  ! 4940: STW_R	stw	%r31, [%r20 + %r0]
	.word 0xf6b46014  ! 4941: STHA_I	stha	%r27, [%r17 + 0x0014] %asi
cpu_intr_3_368:
	setx	0x460111, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_391:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_391), 16, 16)) -> intp(3, 0, 6)
	.word 0xfc2d0000  ! 4946: STB_R	stb	%r30, [%r20 + %r0]
cpu_intr_3_369:
	setx	0x450206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc34e0bd  ! 4949: STH_I	sth	%r30, [%r19 + 0x00bd]
	.word 0xb2ac6086  ! 4950: ANDNcc_I	andncc 	%r17, 0x0086, %r25
	.word 0xf4248000  ! 4952: STW_R	stw	%r26, [%r18 + %r0]
iob_intr_3_392:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_392), 16, 16)) -> intp(3, 0, 18)
	.word 0xf8358000  ! 4963: STH_R	sth	%r28, [%r22 + %r0]
T3_asi_reg_rd_206:
	mov	0x14, %r14
	.word 0xf6db84a0  ! 4965: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xfa2c4000  ! 4967: STB_R	stb	%r29, [%r17 + %r0]
T3_asi_reg_rd_207:
	mov	0x36, %r14
	.word 0xfcdb8e40  ! 4968: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfc74a1bc  ! 4969: STX_I	stx	%r30, [%r18 + 0x01bc]
cpu_intr_3_370:
	setx	0x450102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_371:
	setx	0x460105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb80c8000  ! 4975: AND_R	and 	%r18, %r0, %r28
T3_asi_reg_rd_208:
	mov	0x3c1, %r14
	.word 0xf4db8e60  ! 4978: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf4b56187  ! 4979: STHA_I	stha	%r26, [%r21 + 0x0187] %asi
T3_asi_reg_rd_209:
	mov	0x25, %r14
	.word 0xfedb8e80  ! 4981: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_3_393:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_393), 16, 16)) -> intp(3, 0, 1f)
T3_asi_reg_wr_215:
	mov	0x3c5, %r14
	.word 0xf6f384a0  ! 4983: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T3_asi_reg_wr_216:
	mov	0x13, %r14
	.word 0xfef38e40  ! 4985: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xba04e0f6  ! 4988: ADD_I	add 	%r19, 0x00f6, %r29
	.word 0xf435a039  ! 4989: STH_I	sth	%r26, [%r22 + 0x0039]
	.word 0xfca420c2  ! 4990: STWA_I	stwa	%r30, [%r16 + 0x00c2] %asi
	.word 0xfa754000  ! 4993: STX_R	stx	%r29, [%r21 + %r0]
T3_asi_reg_rd_210:
	mov	0x3c2, %r14
	.word 0xfedb89e0  ! 4994: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
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
	setx	0x19010a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_1:
	setx	0x1a000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4c561ae  ! 3: LDSWA_I	ldswa	[%r21, + 0x01ae] %asi, %r26
T2_asi_reg_rd_0:
	mov	0xc, %r14
	.word 0xf4db89e0  ! 7: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_2_2:
	setx	0x1d022a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_1:
	mov	0x1b, %r14
	.word 0xf6db8e60  ! 9: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_0), 16, 16)) -> intp(2, 0, 2d)
	ta	T_CHANGE_TO_TL1
iob_intr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_1), 16, 16)) -> intp(2, 0, 28)
T2_asi_reg_rd_2:
	mov	0x1b, %r14
	.word 0xfedb8e60  ! 16: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T2_asi_reg_wr_0:
	mov	0xc, %r14
	.word 0xf6f389e0  ! 17: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_2_3:
	setx	0x1f0214, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_4:
	setx	0x1d023f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_5:
	setx	0x1f0338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5c4000  ! 22: LDX_R	ldx	[%r17 + %r0], %r31
T2_asi_reg_wr_1:
	mov	0x3c7, %r14
	.word 0xf4f38e60  ! 24: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T2_asi_reg_wr_2:
	mov	0x3c6, %r14
	.word 0xfef384a0  ! 26: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xfa85a1a6  ! 28: LDUWA_I	lduwa	[%r22, + 0x01a6] %asi, %r29
iob_intr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_2), 16, 16)) -> intp(2, 0, 12)
cpu_intr_2_6:
	setx	0x1f013c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_3), 16, 16)) -> intp(2, 0, 12)
	.word 0xf68c8020  ! 32: LDUBA_R	lduba	[%r18, %r0] 0x01, %r27
	.word 0xbb3c8000  ! 33: SRA_R	sra 	%r18, %r0, %r29
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982e92  ! 34: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e92, %hpstate
	.word 0xb4348000  ! 36: SUBC_R	orn 	%r18, %r0, %r26
	.word 0xf4854020  ! 38: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r26
	.word 0xf2940020  ! 39: LDUHA_R	lduha	[%r16, %r0] 0x01, %r25
cpu_intr_2_7:
	setx	0x1f0039, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_8:
	setx	0x1e0035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0bca000  ! 45: XNORcc_I	xnorcc 	%r18, 0x0000, %r24
	.word 0xf6c460b4  ! 46: LDSWA_I	ldswa	[%r17, + 0x00b4] %asi, %r27
T2_asi_reg_wr_3:
	mov	0x1a, %r14
	.word 0xf4f389e0  ! 49: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf684a085  ! 50: LDUWA_I	lduwa	[%r18, + 0x0085] %asi, %r27
cpu_intr_2_9:
	setx	0x1c0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc8c0020  ! 54: LDUBA_R	lduba	[%r16, %r0] 0x01, %r30
cpu_intr_2_10:
	setx	0x1c0228, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_11:
	setx	0x1d010c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_4), 16, 16)) -> intp(2, 0, 28)
iob_intr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_5), 16, 16)) -> intp(2, 0, 2c)
cpu_intr_2_12:
	setx	0x1e023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5641800  ! 63: MOVcc_R	<illegal instruction>
cpu_intr_2_13:
	setx	0x1c033f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_3:
	mov	0x8, %r14
	.word 0xfcdb8e80  ! 68: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_2_14:
	setx	0x1d0132, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_15:
	setx	0x1f0203, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_6), 16, 16)) -> intp(2, 0, 9)
cpu_intr_2_16:
	setx	0x1d0024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe55e01a  ! 74: LDSH_I	ldsh	[%r23 + 0x001a], %r31
	.word 0xb52ce001  ! 75: SLL_I	sll 	%r19, 0x0001, %r26
	.word 0xf0444000  ! 77: LDSW_R	ldsw	[%r17 + %r0], %r24
	.word 0xf0c561dc  ! 78: LDSWA_I	ldswa	[%r21, + 0x01dc] %asi, %r24
	.word 0xb844c000  ! 82: ADDC_R	addc 	%r19, %r0, %r28
	.word 0xfa15616e  ! 85: LDUH_I	lduh	[%r21 + 0x016e], %r29
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_4:
	mov	0x33, %r14
	.word 0xf0f38e60  ! 92: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T2_asi_reg_wr_5:
	mov	0x3c8, %r14
	.word 0xfaf38e60  ! 93: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T2_asi_reg_rd_4:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 94: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb6142121  ! 95: OR_I	or 	%r16, 0x0121, %r27
	.word 0xfa54e1db  ! 97: LDSH_I	ldsh	[%r19 + 0x01db], %r29
	ta	T_CHANGE_TO_TL0
	.word 0xfccd6016  ! 100: LDSBA_I	ldsba	[%r21, + 0x0016] %asi, %r30
	.word 0xf8dc2094  ! 101: LDXA_I	ldxa	[%r16, + 0x0094] %asi, %r28
	ta	T_CHANGE_HPRIV
cpu_intr_2_17:
	setx	0x1f0220, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_6:
	mov	0x17, %r14
	.word 0xfef38e80  ! 105: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfcdd60dc  ! 108: LDXA_I	ldxa	[%r21, + 0x00dc] %asi, %r30
T2_asi_reg_rd_5:
	mov	0x14, %r14
	.word 0xfedb8e40  ! 111: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb73cd000  ! 112: SRAX_R	srax	%r19, %r0, %r27
T2_asi_reg_rd_6:
	mov	0x11, %r14
	.word 0xfcdb8e40  ! 113: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf695e019  ! 116: LDUHA_I	lduha	[%r23, + 0x0019] %asi, %r27
	.word 0xf4c5a193  ! 117: LDSWA_I	ldswa	[%r22, + 0x0193] %asi, %r26
	.word 0xf4d50020  ! 118: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r26
T2_asi_reg_wr_7:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 120: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_7), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_18:
	setx	0x1c0215, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
cpu_intr_2_19:
	setx	0x329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24460a5  ! 129: LDSW_I	ldsw	[%r17 + 0x00a5], %r25
	.word 0xf205c000  ! 130: LDUW_R	lduw	[%r23 + %r0], %r25
cpu_intr_2_20:
	setx	0x1d0030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4c6128  ! 132: LDSB_I	ldsb	[%r17 + 0x0128], %r29
iob_intr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_8), 16, 16)) -> intp(2, 0, 2e)
	.word 0xfedd20ee  ! 134: LDXA_I	ldxa	[%r20, + 0x00ee] %asi, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_8:
	mov	0x22, %r14
	.word 0xf4f389e0  ! 144: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T2_asi_reg_rd_7:
	mov	0x11, %r14
	.word 0xfcdb8400  ! 145: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_9), 16, 16)) -> intp(2, 0, 36)
	.word 0xfacda1e0  ! 148: LDSBA_I	ldsba	[%r22, + 0x01e0] %asi, %r29
	.word 0xf41520ee  ! 149: LDUH_I	lduh	[%r20 + 0x00ee], %r26
cpu_intr_2_21:
	setx	0x1c0109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd35c000  ! 153: SRL_R	srl 	%r23, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
iob_intr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_10), 16, 16)) -> intp(2, 0, 3b)
iob_intr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_11), 16, 16)) -> intp(2, 0, 26)
	.word 0xf85c8000  ! 170: LDX_R	ldx	[%r18 + %r0], %r28
cpu_intr_2_22:
	setx	0x1c032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8c4020  ! 172: LDUBA_R	lduba	[%r17, %r0] 0x01, %r29
	.word 0xf404608e  ! 173: LDUW_I	lduw	[%r17 + 0x008e], %r26
T2_asi_reg_wr_9:
	mov	0x26, %r14
	.word 0xfcf384a0  ! 174: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
cpu_intr_2_23:
	setx	0x1f0020, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_24:
	setx	0x1f022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45c60c1  ! 186: LDX_I	ldx	[%r17 + 0x00c1], %r26
T2_asi_reg_wr_10:
	mov	0x3c4, %r14
	.word 0xf4f38e40  ! 187: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf2446194  ! 189: LDSW_I	ldsw	[%r17 + 0x0194], %r25
iob_intr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_12), 16, 16)) -> intp(2, 0, 24)
iob_intr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_13), 16, 16)) -> intp(2, 0, 2a)
	.word 0xfa444000  ! 197: LDSW_R	ldsw	[%r17 + %r0], %r29
	ta	T_CHANGE_TO_TL1
iob_intr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_14), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_rd_8:
	mov	0x3c8, %r14
	.word 0xf4db8e40  ! 208: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_2_25:
	setx	0x1c0129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf095a188  ! 212: LDUHA_I	lduha	[%r22, + 0x0188] %asi, %r24
iob_intr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_15), 16, 16)) -> intp(2, 0, f)
	.word 0xb8b5c000  ! 215: ORNcc_R	orncc 	%r23, %r0, %r28
	.word 0xa1902000  ! 217: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xfc0da133  ! 218: LDUB_I	ldub	[%r22 + 0x0133], %r30
T2_asi_reg_wr_11:
	mov	0x3c8, %r14
	.word 0xf4f38e40  ! 219: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb53d3001  ! 220: SRAX_I	srax	%r20, 0x0001, %r26
	setx	data_start_1, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x819828d8  ! 226: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d8, %hpstate
cpu_intr_2_26:
	setx	0x1c0330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc548000  ! 230: LDSH_R	ldsh	[%r18 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_16), 16, 16)) -> intp(2, 0, 22)
T2_asi_reg_rd_9:
	mov	0x1c, %r14
	.word 0xf2db8e40  ! 234: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf605a1b5  ! 235: LDUW_I	lduw	[%r22 + 0x01b5], %r27
cpu_intr_2_27:
	setx	0x1c0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3d7001  ! 239: SRAX_I	srax	%r21, 0x0001, %r31
	.word 0xfad5e16e  ! 240: LDSHA_I	ldsha	[%r23, + 0x016e] %asi, %r29
T2_asi_reg_rd_10:
	mov	0x1f, %r14
	.word 0xf2db8e40  ! 241: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_2_28:
	setx	0x1c003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_29:
	setx	0x1e0107, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_17), 16, 16)) -> intp(2, 0, 3e)
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_11:
	mov	0x20, %r14
	.word 0xf0db89e0  ! 248: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xfa5c217c  ! 249: LDX_I	ldx	[%r16 + 0x017c], %r29
T2_asi_reg_rd_12:
	mov	0x3c5, %r14
	.word 0xf2db89e0  ! 253: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	ta	T_CHANGE_TO_TL0
cpu_intr_2_30:
	setx	0x1c002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8c61c0  ! 258: ANDcc_I	andcc 	%r17, 0x01c0, %r30
cpu_intr_2_31:
	setx	0x1c002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc152055  ! 260: LDUH_I	lduh	[%r20 + 0x0055], %r30
cpu_intr_2_32:
	setx	0x1f0031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24d61b3  ! 262: LDSB_I	ldsb	[%r21 + 0x01b3], %r25
	.word 0xf694206f  ! 263: LDUHA_I	lduha	[%r16, + 0x006f] %asi, %r27
T2_asi_reg_rd_13:
	mov	0x3c2, %r14
	.word 0xf8db89e0  ! 265: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf48da195  ! 266: LDUBA_I	lduba	[%r22, + 0x0195] %asi, %r26
	.word 0xf25de10f  ! 269: LDX_I	ldx	[%r23 + 0x010f], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_18), 16, 16)) -> intp(2, 0, 30)
T2_asi_reg_wr_12:
	mov	0xd, %r14
	.word 0xfaf38400  ! 278: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xfc850020  ! 281: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r30
	.word 0xfc8c0020  ! 285: LDUBA_R	lduba	[%r16, %r0] 0x01, %r30
cpu_intr_2_33:
	setx	0x1d0004, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_34:
	setx	0x1e0026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf415c000  ! 293: LDUH_R	lduh	[%r23 + %r0], %r26
	.word 0xf0dd211f  ! 294: LDXA_I	ldxa	[%r20, + 0x011f] %asi, %r24
	.word 0xf41421b5  ! 295: LDUH_I	lduh	[%r16 + 0x01b5], %r26
iob_intr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_19), 16, 16)) -> intp(2, 0, 18)
iob_intr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_20), 16, 16)) -> intp(2, 0, 3a)
iob_intr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_21), 16, 16)) -> intp(2, 0, 2b)
iob_intr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_22), 16, 16)) -> intp(2, 0, 0)
	.word 0xfa0c608f  ! 311: LDUB_I	ldub	[%r17 + 0x008f], %r29
	.word 0x8395217a  ! 313: WRPR_TNPC_I	wrpr	%r20, 0x017a, %tnpc
	.word 0xfc4421d2  ! 314: LDSW_I	ldsw	[%r16 + 0x01d2], %r30
	.word 0xfc146164  ! 315: LDUH_I	lduh	[%r17 + 0x0164], %r30
	ta	T_CHANGE_TO_TL1
iob_intr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_23), 16, 16)) -> intp(2, 0, 32)
iob_intr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_24), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_35:
	setx	0x1f023b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_13:
	mov	0x3c2, %r14
	.word 0xf6f38e60  ! 327: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_25), 16, 16)) -> intp(2, 0, 1b)
	.word 0xb40ca12a  ! 334: AND_I	and 	%r18, 0x012a, %r26
T2_asi_reg_rd_14:
	mov	0x2d, %r14
	.word 0xfcdb84a0  ! 339: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf0ccc020  ! 344: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r24
	.word 0xf88c4020  ! 345: LDUBA_R	lduba	[%r17, %r0] 0x01, %r28
	setx	data_start_0, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983e8a  ! 346: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e8a, %hpstate
iob_intr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_26), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf0d4e0fc  ! 351: LDSHA_I	ldsha	[%r19, + 0x00fc] %asi, %r24
cpu_intr_2_36:
	setx	0x1e0207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8d0020  ! 353: LDUBA_R	lduba	[%r20, %r0] 0x01, %r29
	.word 0xf68d8020  ! 356: LDUBA_R	lduba	[%r22, %r0] 0x01, %r27
	.word 0xfadd2118  ! 358: LDXA_I	ldxa	[%r20, + 0x0118] %asi, %r29
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_14:
	mov	0x3c7, %r14
	.word 0xfcf384a0  ! 367: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf40c0000  ! 368: LDUB_R	ldub	[%r16 + %r0], %r26
iob_intr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_27), 16, 16)) -> intp(2, 0, 34)
	.word 0xb83de09f  ! 370: XNOR_I	xnor 	%r23, 0x009f, %r28
iob_intr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_28), 16, 16)) -> intp(2, 0, a)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_37:
	setx	0x1f0003, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_29), 16, 16)) -> intp(2, 0, 3d)
cpu_intr_2_38:
	setx	0x1c030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_39:
	setx	0x1d0006, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_15:
	mov	0x3c2, %r14
	.word 0xfadb8e80  ! 384: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf215a091  ! 390: LDUH_I	lduh	[%r22 + 0x0091], %r25
cpu_intr_2_40:
	setx	0x1f0206, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_41:
	setx	0x1d0113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8dc61c2  ! 394: LDXA_I	ldxa	[%r17, + 0x01c2] %asi, %r28
iob_intr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_30), 16, 16)) -> intp(2, 0, 2d)
T2_asi_reg_rd_16:
	mov	0xa, %r14
	.word 0xfcdb8e40  ! 400: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfac52163  ! 408: LDSWA_I	ldswa	[%r20, + 0x0163] %asi, %r29
	.word 0xf4152181  ! 409: LDUH_I	lduh	[%r20 + 0x0181], %r26
	.word 0xf68d8020  ! 412: LDUBA_R	lduba	[%r22, %r0] 0x01, %r27
iob_intr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_31), 16, 16)) -> intp(2, 0, 14)
	.word 0xf20ce108  ! 414: LDUB_I	ldub	[%r19 + 0x0108], %r25
iob_intr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_32), 16, 16)) -> intp(2, 0, 3c)
cpu_intr_2_42:
	setx	0x1f0337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8440000  ! 423: ADDC_R	addc 	%r16, %r0, %r28
iob_intr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_33), 16, 16)) -> intp(2, 0, 12)
	.word 0xfac521f8  ! 430: LDSWA_I	ldswa	[%r20, + 0x01f8] %asi, %r29
T2_asi_reg_wr_15:
	mov	0x15, %r14
	.word 0xf2f38e60  ! 431: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T2_asi_reg_rd_17:
	mov	0x37, %r14
	.word 0xf8db8e40  ! 432: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf0d4c020  ! 434: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r24
	.word 0xfc850020  ! 436: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r30
iob_intr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_34), 16, 16)) -> intp(2, 0, d)
T2_asi_reg_rd_18:
	mov	0x27, %r14
	.word 0xf0db8e40  ! 442: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	ta	T_CHANGE_HPRIV
	.word 0xb17cc400  ! 452: MOVR_R	movre	%r19, %r0, %r24
	.word 0xf25d0000  ! 455: LDX_R	ldx	[%r20 + %r0], %r25
iob_intr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_35), 16, 16)) -> intp(2, 0, 14)
T2_asi_reg_wr_16:
	mov	0x3, %r14
	.word 0xf4f389e0  ! 459: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbb34d000  ! 460: SRLX_R	srlx	%r19, %r0, %r29
iob_intr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_36), 16, 16)) -> intp(2, 0, 24)
	.word 0xfa958020  ! 463: LDUHA_R	lduha	[%r22, %r0] 0x01, %r29
T2_asi_reg_wr_17:
	mov	0x1c, %r14
	.word 0xfcf38e40  ! 465: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfc04e108  ! 466: LDUW_I	lduw	[%r19 + 0x0108], %r30
	.word 0xf4956015  ! 469: LDUHA_I	lduha	[%r21, + 0x0015] %asi, %r26
iob_intr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_37), 16, 16)) -> intp(2, 0, 1c)
iob_intr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_38), 16, 16)) -> intp(2, 0, 39)
iob_intr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_39), 16, 16)) -> intp(2, 0, 2e)
iob_intr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_40), 16, 16)) -> intp(2, 0, 1d)
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_19:
	mov	0xe, %r14
	.word 0xf6db8e40  ! 478: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_wr_18:
	mov	0x25, %r14
	.word 0xf6f389e0  ! 479: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf055e180  ! 481: LDSH_I	ldsh	[%r23 + 0x0180], %r24
iob_intr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_41), 16, 16)) -> intp(2, 0, 1b)
iob_intr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_42), 16, 16)) -> intp(2, 0, 14)
cpu_intr_2_43:
	setx	0x22010b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_44:
	setx	0x220322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb13df001  ! 490: SRAX_I	srax	%r23, 0x0001, %r24
	.word 0xbc25a0b5  ! 491: SUB_I	sub 	%r22, 0x00b5, %r30
	.word 0xfe048000  ! 493: LDUW_R	lduw	[%r18 + %r0], %r31
	.word 0xfc4ca0cb  ! 495: LDSB_I	ldsb	[%r18 + 0x00cb], %r30
iob_intr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_43), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf8c5e16d  ! 497: LDSWA_I	ldswa	[%r23, + 0x016d] %asi, %r28
	.word 0xb6454000  ! 498: ADDC_R	addc 	%r21, %r0, %r27
iob_intr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_44), 16, 16)) -> intp(2, 0, 38)
T2_asi_reg_rd_20:
	mov	0x3c3, %r14
	.word 0xf8db8e80  ! 502: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T2_asi_reg_wr_19:
	mov	0x27, %r14
	.word 0xf2f38e80  ! 503: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf0c5e1db  ! 504: LDSWA_I	ldswa	[%r23, + 0x01db] %asi, %r24
	.word 0xfedce114  ! 505: LDXA_I	ldxa	[%r19, + 0x0114] %asi, %r31
	.word 0xf88dc020  ! 506: LDUBA_R	lduba	[%r23, %r0] 0x01, %r28
cpu_intr_2_45:
	setx	0x22023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8c521b7  ! 509: LDSWA_I	ldswa	[%r20, + 0x01b7] %asi, %r28
	.word 0xfcd42025  ! 510: LDSHA_I	ldsha	[%r16, + 0x0025] %asi, %r30
iob_intr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_45), 16, 16)) -> intp(2, 0, 2)
	.word 0xb97d8400  ! 513: MOVR_R	movre	%r22, %r0, %r28
	.word 0xfe452186  ! 514: LDSW_I	ldsw	[%r20 + 0x0186], %r31
	.word 0xfcc4e1e4  ! 518: LDSWA_I	ldswa	[%r19, + 0x01e4] %asi, %r30
	ta	T_CHANGE_HPRIV
cpu_intr_2_46:
	setx	0x210329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0d4000  ! 523: LDUB_R	ldub	[%r21 + %r0], %r31
	.word 0xfa0dc000  ! 524: LDUB_R	ldub	[%r23 + %r0], %r29
T2_asi_reg_wr_20:
	mov	0x3c8, %r14
	.word 0xf2f38400  ! 525: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_46), 16, 16)) -> intp(2, 0, a)
	.word 0xf6cc8020  ! 527: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r27
	.word 0xf40c0000  ! 528: LDUB_R	ldub	[%r16 + %r0], %r26
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_21:
	mov	0x21, %r14
	.word 0xfcf38e40  ! 532: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf25d0000  ! 533: LDX_R	ldx	[%r20 + %r0], %r25
	.word 0xf2cd20d7  ! 534: LDSBA_I	ldsba	[%r20, + 0x00d7] %asi, %r25
iob_intr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_47), 16, 16)) -> intp(2, 0, 2d)
	.word 0xbabcc000  ! 538: XNORcc_R	xnorcc 	%r19, %r0, %r29
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x819829c0  ! 543: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c0, %hpstate
iob_intr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_48), 16, 16)) -> intp(2, 0, 30)
	.word 0xf08dc020  ! 546: LDUBA_R	lduba	[%r23, %r0] 0x01, %r24
	.word 0xf0c48020  ! 547: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r24
iob_intr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_49), 16, 16)) -> intp(2, 0, 2d)
	setx	data_start_0, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982bda  ! 553: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bda, %hpstate
	.word 0xf08d204e  ! 557: LDUBA_I	lduba	[%r20, + 0x004e] %asi, %r24
	.word 0xf2cda14c  ! 559: LDSBA_I	ldsba	[%r22, + 0x014c] %asi, %r25
	.word 0xf0d46150  ! 562: LDSHA_I	ldsha	[%r17, + 0x0150] %asi, %r24
T2_asi_reg_wr_22:
	mov	0x36, %r14
	.word 0xf8f384a0  ! 563: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_50), 16, 16)) -> intp(2, 0, e)
	.word 0xfa056170  ! 567: LDUW_I	lduw	[%r21 + 0x0170], %r29
	.word 0xa1902001  ! 568: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa0ce16c  ! 570: LDUB_I	ldub	[%r19 + 0x016c], %r29
	.word 0xf40d4000  ! 571: LDUB_R	ldub	[%r21 + %r0], %r26
	.word 0xf68521ee  ! 574: LDUWA_I	lduwa	[%r20, + 0x01ee] %asi, %r27
cpu_intr_2_47:
	setx	0x200118, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_21:
	mov	0x20, %r14
	.word 0xf2db8e60  ! 576: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_51), 16, 16)) -> intp(2, 0, 2e)
	.word 0xfec4201e  ! 583: LDSWA_I	ldswa	[%r16, + 0x001e] %asi, %r31
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_23:
	mov	0xb, %r14
	.word 0xf2f38e60  ! 585: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_2_48:
	setx	0x200210, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_52:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_52), 16, 16)) -> intp(2, 0, 16)
	.word 0xb295600e  ! 594: ORcc_I	orcc 	%r21, 0x000e, %r25
	.word 0xb69d4000  ! 600: XORcc_R	xorcc 	%r21, %r0, %r27
T2_asi_reg_rd_22:
	mov	0x36, %r14
	.word 0xfedb8e60  ! 601: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T2_asi_reg_rd_23:
	mov	0x20, %r14
	.word 0xf6db89e0  ! 602: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xf85cc000  ! 607: LDX_R	ldx	[%r19 + %r0], %r28
	.word 0xb0956148  ! 608: ORcc_I	orcc 	%r21, 0x0148, %r24
	.word 0xb68420ab  ! 609: ADDcc_I	addcc 	%r16, 0x00ab, %r27
iob_intr_2_53:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_53), 16, 16)) -> intp(2, 0, 12)
cpu_intr_2_49:
	setx	0x230334, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_24:
	mov	0x1b, %r14
	.word 0xf4db84a0  ! 614: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xfcc50020  ! 615: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r30
T2_asi_reg_rd_25:
	mov	0x1d, %r14
	.word 0xfcdb8e80  ! 616: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb4bd61a9  ! 618: XNORcc_I	xnorcc 	%r21, 0x01a9, %r26
	.word 0xfa5c0000  ! 620: LDX_R	ldx	[%r16 + %r0], %r29
	.word 0xf88c2186  ! 621: LDUBA_I	lduba	[%r16, + 0x0186] %asi, %r28
	.word 0xf2944020  ! 624: LDUHA_R	lduha	[%r17, %r0] 0x01, %r25
T2_asi_reg_wr_24:
	mov	0x3c4, %r14
	.word 0xf4f389e0  ! 626: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb21d6177  ! 627: XOR_I	xor 	%r21, 0x0177, %r25
	.word 0xf4458000  ! 629: LDSW_R	ldsw	[%r22 + %r0], %r26
T2_asi_reg_wr_25:
	mov	0x9, %r14
	.word 0xf8f38400  ! 631: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf08c4020  ! 633: LDUBA_R	lduba	[%r17, %r0] 0x01, %r24
T2_asi_reg_rd_26:
	mov	0x3c6, %r14
	.word 0xfedb8e60  ! 634: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf8d48020  ! 635: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r28
cpu_intr_2_50:
	setx	0x230239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe856050  ! 637: LDUWA_I	lduwa	[%r21, + 0x0050] %asi, %r31
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983cd0  ! 640: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd0, %hpstate
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_27:
	mov	0x2c, %r14
	.word 0xf8db8e40  ! 642: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_2_54:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_54), 16, 16)) -> intp(2, 0, 11)
iob_intr_2_55:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_55), 16, 16)) -> intp(2, 0, 7)
	.word 0xf0954020  ! 647: LDUHA_R	lduha	[%r21, %r0] 0x01, %r24
cpu_intr_2_51:
	setx	0x230332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60da121  ! 649: LDUB_I	ldub	[%r22 + 0x0121], %r27
	.word 0xb77c8400  ! 650: MOVR_R	movre	%r18, %r0, %r27
iob_intr_2_56:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_56), 16, 16)) -> intp(2, 0, 12)
	.word 0xfa55a078  ! 652: LDSH_I	ldsh	[%r22 + 0x0078], %r29
	.word 0xfa840020  ! 653: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r29
cpu_intr_2_52:
	setx	0x21032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf054e0ee  ! 655: LDSH_I	ldsh	[%r19 + 0x00ee], %r24
T2_asi_reg_wr_26:
	mov	0x3c2, %r14
	.word 0xf2f38400  ! 657: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_2_57:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_57), 16, 16)) -> intp(2, 0, b)
	.word 0xfc954020  ! 664: LDUHA_R	lduha	[%r21, %r0] 0x01, %r30
cpu_intr_2_53:
	setx	0x230120, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_27:
	mov	0x3c1, %r14
	.word 0xf2f38e40  ! 667: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_2_54:
	setx	0x200232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa14a116  ! 669: LDUH_I	lduh	[%r18 + 0x0116], %r29
	.word 0xf28cc020  ! 671: LDUBA_R	lduba	[%r19, %r0] 0x01, %r25
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982fd8  ! 675: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd8, %hpstate
iob_intr_2_58:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_58), 16, 16)) -> intp(2, 0, 9)
cpu_intr_2_55:
	setx	0x22031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8cc020  ! 683: LDUBA_R	lduba	[%r19, %r0] 0x01, %r29
	.word 0xf2156031  ! 684: LDUH_I	lduh	[%r21 + 0x0031], %r25
T2_asi_reg_rd_28:
	mov	0x26, %r14
	.word 0xfedb8e40  ! 687: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf64460a1  ! 688: LDSW_I	ldsw	[%r17 + 0x00a1], %r27
T2_asi_reg_wr_28:
	mov	0x30, %r14
	.word 0xfcf389e0  ! 690: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983cc0  ! 693: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc0, %hpstate
	.word 0xba1d206a  ! 696: XOR_I	xor 	%r20, 0x006a, %r29
	.word 0xfa0c61d7  ! 697: LDUB_I	ldub	[%r17 + 0x01d7], %r29
	.word 0xf0cc4020  ! 698: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r24
T2_asi_reg_wr_29:
	mov	0x22, %r14
	.word 0xf8f38e40  ! 699: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf2d54020  ! 700: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r25
iob_intr_2_59:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_59), 16, 16)) -> intp(2, 0, 1)
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982e48  ! 703: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e48, %hpstate
T2_asi_reg_wr_30:
	mov	0x2a, %r14
	.word 0xf4f38e40  ! 704: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_56:
	setx	0x230237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5c206a  ! 707: LDX_I	ldx	[%r16 + 0x006a], %r29
cpu_intr_2_57:
	setx	0x21021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_60:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_60), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf64d4000  ! 713: LDSB_R	ldsb	[%r21 + %r0], %r27
	.word 0xf4d48020  ! 714: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r26
	.word 0xb53d7001  ! 716: SRAX_I	srax	%r21, 0x0001, %r26
T2_asi_reg_wr_31:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 719: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_wr_32:
	mov	0x3c8, %r14
	.word 0xfef38e80  ! 720: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_2_58:
	setx	0x21000b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_59:
	setx	0x210120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44c4000  ! 725: LDSB_R	ldsb	[%r17 + %r0], %r26
iob_intr_2_61:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_61), 16, 16)) -> intp(2, 0, 37)
	.word 0xb48d0000  ! 727: ANDcc_R	andcc 	%r20, %r0, %r26
	ta	T_CHANGE_HPRIV
	.word 0xf0558000  ! 730: LDSH_R	ldsh	[%r22 + %r0], %r24
	.word 0xfe4dc000  ! 731: LDSB_R	ldsb	[%r23 + %r0], %r31
	.word 0x8994a1a9  ! 733: WRPR_TICK_I	wrpr	%r18, 0x01a9, %tick
iob_intr_2_62:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_62), 16, 16)) -> intp(2, 0, 14)
	.word 0xfa554000  ! 736: LDSH_R	ldsh	[%r21 + %r0], %r29
	.word 0xfe152083  ! 738: LDUH_I	lduh	[%r20 + 0x0083], %r31
	.word 0xf0458000  ! 739: LDSW_R	ldsw	[%r22 + %r0], %r24
	.word 0xf69520a7  ! 740: LDUHA_I	lduha	[%r20, + 0x00a7] %asi, %r27
	.word 0xf8d44020  ! 741: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r28
iob_intr_2_63:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_63), 16, 16)) -> intp(2, 0, d)
	.word 0xfc944020  ! 745: LDUHA_R	lduha	[%r17, %r0] 0x01, %r30
T2_asi_reg_rd_29:
	mov	0x31, %r14
	.word 0xf4db8400  ! 746: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xfa54a192  ! 749: LDSH_I	ldsh	[%r18 + 0x0192], %r29
T2_asi_reg_wr_33:
	mov	0x24, %r14
	.word 0xfaf38e40  ! 753: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_60:
	setx	0x20022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7641800  ! 757: MOVcc_R	<illegal instruction>
iob_intr_2_64:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_64), 16, 16)) -> intp(2, 0, 30)
	.word 0xf6d5c020  ! 759: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r27
T2_asi_reg_rd_30:
	mov	0x32, %r14
	.word 0xfadb8400  ! 761: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xfe940020  ! 763: LDUHA_R	lduha	[%r16, %r0] 0x01, %r31
	.word 0xf44dc000  ! 765: LDSB_R	ldsb	[%r23 + %r0], %r26
iob_intr_2_65:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_65), 16, 16)) -> intp(2, 0, 2f)
	.word 0xfc85e1c9  ! 769: LDUWA_I	lduwa	[%r23, + 0x01c9] %asi, %r30
	.word 0xf05d60b2  ! 770: LDX_I	ldx	[%r21 + 0x00b2], %r24
cpu_intr_2_61:
	setx	0x23030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_31:
	mov	0x12, %r14
	.word 0xfcdb8e60  ! 775: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_2_62:
	setx	0x230109, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_63:
	setx	0x230020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2452113  ! 778: LDSW_I	ldsw	[%r20 + 0x0113], %r25
	.word 0xf4844020  ! 781: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r26
	.word 0xfa9561c0  ! 783: LDUHA_I	lduha	[%r21, + 0x01c0] %asi, %r29
	.word 0xf8cd21cb  ! 784: LDSBA_I	ldsba	[%r20, + 0x01cb] %asi, %r28
	.word 0xf0450000  ! 785: LDSW_R	ldsw	[%r20 + %r0], %r24
T2_asi_reg_rd_32:
	mov	0x7, %r14
	.word 0xf8db8400  ! 786: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T2_asi_reg_rd_33:
	mov	0x1a, %r14
	.word 0xf8db8400  ! 787: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb49d0000  ! 789: XORcc_R	xorcc 	%r20, %r0, %r26
	.word 0xf8050000  ! 790: LDUW_R	lduw	[%r20 + %r0], %r28
	.word 0xb1643801  ! 794: MOVcc_I	<illegal instruction>
cpu_intr_2_64:
	setx	0x220319, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_65:
	setx	0x200126, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_34:
	mov	0x7, %r14
	.word 0xfedb89e0  ! 799: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf854a1b8  ! 800: LDSH_I	ldsh	[%r18 + 0x01b8], %r28
T2_asi_reg_wr_34:
	mov	0x3c3, %r14
	.word 0xf6f384a0  ! 801: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_2_66:
	setx	0x200018, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_35:
	mov	0x3c2, %r14
	.word 0xfcdb89e0  ! 808: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T2_asi_reg_rd_36:
	mov	0x3c0, %r14
	.word 0xf4db8400  ! 809: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_2_66:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_66), 16, 16)) -> intp(2, 0, 34)
	.word 0xf44ca079  ! 811: LDSB_I	ldsb	[%r18 + 0x0079], %r26
cpu_intr_2_67:
	setx	0x21033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf05c20aa  ! 816: LDX_I	ldx	[%r16 + 0x00aa], %r24
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_68:
	setx	0x200008, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_67:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_67), 16, 16)) -> intp(2, 0, 3d)
T2_asi_reg_wr_35:
	mov	0x29, %r14
	.word 0xfaf38e40  ! 822: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_68:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_68), 16, 16)) -> intp(2, 0, 10)
	.word 0xfc0dc000  ! 825: LDUB_R	ldub	[%r23 + %r0], %r30
	.word 0xf654e1b7  ! 826: LDSH_I	ldsh	[%r19 + 0x01b7], %r27
	.word 0xf815200e  ! 827: LDUH_I	lduh	[%r20 + 0x000e], %r28
iob_intr_2_69:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_69), 16, 16)) -> intp(2, 0, 19)
iob_intr_2_70:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_70), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_rd_37:
	mov	0x3c5, %r14
	.word 0xf0db89e0  ! 833: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_2_69:
	setx	0x210010, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_38:
	mov	0x3c3, %r14
	.word 0xf4db8e80  ! 839: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_2_71:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_71), 16, 16)) -> intp(2, 0, 6)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf64d4000  ! 846: LDSB_R	ldsb	[%r21 + %r0], %r27
iob_intr_2_72:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_72), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_70:
	setx	0x230234, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_73:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_73), 16, 16)) -> intp(2, 0, 3f)
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_36:
	mov	0xc, %r14
	.word 0xf6f389e0  ! 859: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T2_asi_reg_rd_39:
	mov	0x31, %r14
	.word 0xfcdb8e40  ! 860: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_wr_37:
	mov	0x24, %r14
	.word 0xfaf38e40  ! 861: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb2058000  ! 862: ADD_R	add 	%r22, %r0, %r25
	.word 0xf64de16b  ! 864: LDSB_I	ldsb	[%r23 + 0x016b], %r27
iob_intr_2_74:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_74), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf44c20d0  ! 870: LDSB_I	ldsb	[%r16 + 0x00d0], %r26
T2_asi_reg_wr_38:
	mov	0x3c3, %r14
	.word 0xf8f389e0  ! 871: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_2_71:
	setx	0x23003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb32c4000  ! 874: SLL_R	sll 	%r17, %r0, %r25
	ta	T_CHANGE_TO_TL1
	.word 0xf4cca0eb  ! 882: LDSBA_I	ldsba	[%r18, + 0x00eb] %asi, %r26
T2_asi_reg_wr_39:
	mov	0x3c5, %r14
	.word 0xf0f38400  ! 883: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf4cde001  ! 884: LDSBA_I	ldsba	[%r23, + 0x0001] %asi, %r26
T2_asi_reg_wr_40:
	mov	0x0, %r14
	.word 0xf2f38400  ! 887: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_72:
	setx	0x230221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec42158  ! 896: LDSWA_I	ldswa	[%r16, + 0x0158] %asi, %r31
	.word 0xfc4c603f  ! 897: LDSB_I	ldsb	[%r17 + 0x003f], %r30
T2_asi_reg_rd_40:
	mov	0x3c4, %r14
	.word 0xf6db8400  ! 901: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_2_75:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_75), 16, 16)) -> intp(2, 0, 3b)
cpu_intr_2_73:
	setx	0x200228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba258000  ! 906: SUB_R	sub 	%r22, %r0, %r29
	.word 0xf0544000  ! 908: LDSH_R	ldsh	[%r17 + %r0], %r24
	.word 0xfa0dc000  ! 910: LDUB_R	ldub	[%r23 + %r0], %r29
cpu_intr_2_74:
	setx	0x250222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb358000  ! 913: SRL_R	srl 	%r22, %r0, %r29
	.word 0xf48c20be  ! 917: LDUBA_I	lduba	[%r16, + 0x00be] %asi, %r26
	.word 0xb32c4000  ! 918: SLL_R	sll 	%r17, %r0, %r25
	.word 0xf68d4020  ! 920: LDUBA_R	lduba	[%r21, %r0] 0x01, %r27
iob_intr_2_76:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_76), 16, 16)) -> intp(2, 0, 34)
	.word 0xfe14a07f  ! 924: LDUH_I	lduh	[%r18 + 0x007f], %r31
	.word 0xfec54020  ! 925: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r31
	.word 0xf64d0000  ! 926: LDSB_R	ldsb	[%r20 + %r0], %r27
	.word 0xfc5c6028  ! 928: LDX_I	ldx	[%r17 + 0x0028], %r30
T2_asi_reg_wr_41:
	mov	0xf, %r14
	.word 0xfaf38e60  ! 929: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_2_75:
	setx	0x270213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6dc6150  ! 933: LDXA_I	ldxa	[%r17, + 0x0150] %asi, %r27
	.word 0xfe95c020  ! 941: LDUHA_R	lduha	[%r23, %r0] 0x01, %r31
	.word 0xf0140000  ! 943: LDUH_R	lduh	[%r16 + %r0], %r24
	.word 0xb29c8000  ! 947: XORcc_R	xorcc 	%r18, %r0, %r25
	ta	T_CHANGE_HPRIV
cpu_intr_2_76:
	setx	0x270135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8944020  ! 952: LDUHA_R	lduha	[%r17, %r0] 0x01, %r28
T2_asi_reg_wr_42:
	mov	0x3c8, %r14
	.word 0xf4f38e80  ! 953: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T2_asi_reg_rd_41:
	mov	0x3c4, %r14
	.word 0xf8db84a0  ! 954: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf0858020  ! 956: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r24
T2_asi_reg_rd_42:
	mov	0x7, %r14
	.word 0xfadb8400  ! 960: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf8952060  ! 963: LDUHA_I	lduha	[%r20, + 0x0060] %asi, %r28
	.word 0xbea42133  ! 965: SUBcc_I	subcc 	%r16, 0x0133, %r31
cpu_intr_2_77:
	setx	0x25022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8dc21b3  ! 967: LDXA_I	ldxa	[%r16, + 0x01b3] %asi, %r28
T2_asi_reg_rd_43:
	mov	0x1b, %r14
	.word 0xfadb8e80  ! 968: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf48c4020  ! 970: LDUBA_R	lduba	[%r17, %r0] 0x01, %r26
	.word 0xf055a17f  ! 974: LDSH_I	ldsh	[%r22 + 0x017f], %r24
	.word 0xbc148000  ! 977: OR_R	or 	%r18, %r0, %r30
	ta	T_CHANGE_HPRIV
	.word 0xf6958020  ! 979: LDUHA_R	lduha	[%r22, %r0] 0x01, %r27
cpu_intr_2_78:
	setx	0x25001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3643801  ! 982: MOVcc_I	<illegal instruction>
cpu_intr_2_79:
	setx	0x260002, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_2_77:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_77), 16, 16)) -> intp(2, 0, 9)
iob_intr_2_78:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_78), 16, 16)) -> intp(2, 0, 3f)
T2_asi_reg_rd_44:
	mov	0x23, %r14
	.word 0xfadb84a0  ! 989: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_2_80:
	setx	0x25001c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_81:
	setx	0x25021e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_82:
	setx	0x25000c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_79:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_79), 16, 16)) -> intp(2, 0, 2a)
	.word 0xfe5c202e  ! 999: LDX_I	ldx	[%r16 + 0x002e], %r31
iob_intr_2_80:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_80), 16, 16)) -> intp(2, 0, 18)
	.word 0xf4544000  ! 1001: LDSH_R	ldsh	[%r17 + %r0], %r26
iob_intr_2_81:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_81), 16, 16)) -> intp(2, 0, 3b)
cpu_intr_2_83:
	setx	0x270207, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_82:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_82), 16, 16)) -> intp(2, 0, 8)
T2_asi_reg_wr_43:
	mov	0x13, %r14
	.word 0xfef384a0  ! 1010: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_44:
	mov	0x1d, %r14
	.word 0xf8f38e40  ! 1014: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbd510000  ! 1016: RDPR_TICK	<illegal instruction>
T2_asi_reg_wr_45:
	mov	0x3c4, %r14
	.word 0xfcf38e40  ! 1019: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb4adc000  ! 1020: ANDNcc_R	andncc 	%r23, %r0, %r26
	.word 0xbc3da01e  ! 1023: XNOR_I	xnor 	%r22, 0x001e, %r30
iob_intr_2_83:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_83), 16, 16)) -> intp(2, 0, 3a)
cpu_intr_2_84:
	setx	0x26022d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_84:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_84), 16, 16)) -> intp(2, 0, 1b)
T2_asi_reg_wr_46:
	mov	0xe, %r14
	.word 0xfaf38e60  ! 1028: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf28cc020  ! 1031: LDUBA_R	lduba	[%r19, %r0] 0x01, %r25
	ta	T_CHANGE_TO_TL0
	.word 0xf64c21a5  ! 1038: LDSB_I	ldsb	[%r16 + 0x01a5], %r27
	.word 0xf8940020  ! 1039: LDUHA_R	lduha	[%r16, %r0] 0x01, %r28
cpu_intr_2_85:
	setx	0x270123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc44c000  ! 1043: LDSW_R	ldsw	[%r19 + %r0], %r30
	.word 0xf885e045  ! 1044: LDUWA_I	lduwa	[%r23, + 0x0045] %asi, %r28
cpu_intr_2_86:
	setx	0x250301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72c0000  ! 1049: SLL_R	sll 	%r16, %r0, %r27
	.word 0xfe14e1da  ! 1051: LDUH_I	lduh	[%r19 + 0x01da], %r31
	.word 0xb8bcc000  ! 1052: XNORcc_R	xnorcc 	%r19, %r0, %r28
	.word 0xf814a0c5  ! 1055: LDUH_I	lduh	[%r18 + 0x00c5], %r28
iob_intr_2_85:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_85), 16, 16)) -> intp(2, 0, 18)
	.word 0xf884a0a4  ! 1058: LDUWA_I	lduwa	[%r18, + 0x00a4] %asi, %r28
iob_intr_2_86:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_86), 16, 16)) -> intp(2, 0, 18)
iob_intr_2_87:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_87), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_wr_47:
	mov	0x3c1, %r14
	.word 0xfcf38e40  ! 1063: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_87:
	setx	0x250033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa9460ed  ! 1067: LDUHA_I	lduha	[%r17, + 0x00ed] %asi, %r29
cpu_intr_2_88:
	setx	0x270033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe540000  ! 1071: LDSH_R	ldsh	[%r16 + %r0], %r31
	.word 0xb57d2401  ! 1072: MOVR_I	movre	%r20, 0x1, %r26
cpu_intr_2_89:
	setx	0x24023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba3c0000  ! 1076: XNOR_R	xnor 	%r16, %r0, %r29
	.word 0xf4d5218c  ! 1079: LDSHA_I	ldsha	[%r20, + 0x018c] %asi, %r26
	.word 0xf0cc0020  ! 1085: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r24
	.word 0xfa544000  ! 1087: LDSH_R	ldsh	[%r17 + %r0], %r29
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_90:
	setx	0x270224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec40020  ! 1093: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r31
	.word 0xf6dc6167  ! 1097: LDXA_I	ldxa	[%r17, + 0x0167] %asi, %r27
iob_intr_2_88:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_88), 16, 16)) -> intp(2, 0, 4)
cpu_intr_2_91:
	setx	0x26020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe146010  ! 1105: LDUH_I	lduh	[%r17 + 0x0010], %r31
	.word 0xfa4de05d  ! 1109: LDSB_I	ldsb	[%r23 + 0x005d], %r29
T2_asi_reg_rd_45:
	mov	0x5, %r14
	.word 0xf0db8400  ! 1110: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_2_92:
	setx	0x240337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8c4c020  ! 1112: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r28
	.word 0xf0142055  ! 1114: LDUH_I	lduh	[%r16 + 0x0055], %r24
iob_intr_2_89:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_89), 16, 16)) -> intp(2, 0, 26)
T2_asi_reg_rd_46:
	mov	0x3c2, %r14
	.word 0xfadb89e0  ! 1119: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xfa144000  ! 1121: LDUH_R	lduh	[%r17 + %r0], %r29
T2_asi_reg_rd_47:
	mov	0x16, %r14
	.word 0xf2db8e80  ! 1122: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_2_93:
	setx	0x260127, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_90:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_90), 16, 16)) -> intp(2, 0, 9)
	.word 0xf6058000  ! 1126: LDUW_R	lduw	[%r22 + %r0], %r27
cpu_intr_2_94:
	setx	0x240237, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_48:
	mov	0x2b, %r14
	.word 0xfaf38e40  ! 1134: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_91:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_91), 16, 16)) -> intp(2, 0, 1b)
	.word 0xbd35a001  ! 1137: SRL_I	srl 	%r22, 0x0001, %r30
T2_asi_reg_rd_48:
	mov	0x3c0, %r14
	.word 0xfcdb8e80  ! 1138: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_2_95:
	setx	0x25032f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_92:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_92), 16, 16)) -> intp(2, 0, 38)
cpu_intr_2_96:
	setx	0x270012, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_2_93:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_93), 16, 16)) -> intp(2, 0, f)
T2_asi_reg_wr_49:
	mov	0x8, %r14
	.word 0xfcf38e80  ! 1150: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_2_94:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_94), 16, 16)) -> intp(2, 0, 30)
iob_intr_2_95:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_95), 16, 16)) -> intp(2, 0, 1)
iob_intr_2_96:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_96), 16, 16)) -> intp(2, 0, 14)
	.word 0xfe5d8000  ! 1167: LDX_R	ldx	[%r22 + %r0], %r31
	.word 0xb4258000  ! 1168: SUB_R	sub 	%r22, %r0, %r26
iob_intr_2_97:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_97), 16, 16)) -> intp(2, 0, 19)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfa8560fe  ! 1172: LDUWA_I	lduwa	[%r21, + 0x00fe] %asi, %r29
	.word 0xf4142065  ! 1173: LDUH_I	lduh	[%r16 + 0x0065], %r26
T2_asi_reg_wr_50:
	mov	0x1c, %r14
	.word 0xf8f38e40  ! 1174: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_98:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_98), 16, 16)) -> intp(2, 0, 6)
T2_asi_reg_wr_51:
	mov	0x15, %r14
	.word 0xf0f389e0  ! 1178: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	setx	data_start_1, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983f4a  ! 1182: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f4a, %hpstate
iob_intr_2_99:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_99), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_wr_52:
	mov	0x21, %r14
	.word 0xf6f389e0  ! 1187: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_2_97:
	setx	0x260104, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_98:
	setx	0x270035, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6554000  ! 1192: LDSH_R	ldsh	[%r21 + %r0], %r27
	.word 0xf4dc611c  ! 1194: LDXA_I	ldxa	[%r17, + 0x011c] %asi, %r26
	ta	T_CHANGE_TO_TL0
iob_intr_2_100:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_100), 16, 16)) -> intp(2, 0, 13)
	.word 0xb5348000  ! 1198: SRL_R	srl 	%r18, %r0, %r26
cpu_intr_2_99:
	setx	0x270321, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_101:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_101), 16, 16)) -> intp(2, 0, 21)
	.word 0xb2ac8000  ! 1206: ANDNcc_R	andncc 	%r18, %r0, %r25
	ta	T_CHANGE_TO_TL1
cpu_intr_2_100:
	setx	0x27021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0152137  ! 1220: LDUH_I	lduh	[%r20 + 0x0137], %r24
T2_asi_reg_wr_53:
	mov	0x3c8, %r14
	.word 0xf0f389e0  ! 1223: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T2_asi_reg_wr_54:
	mov	0x3c5, %r14
	.word 0xfaf38e40  ! 1228: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf6d50020  ! 1229: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r27
iob_intr_2_102:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_102), 16, 16)) -> intp(2, 0, 1a)
	.word 0xfe95a03d  ! 1231: LDUHA_I	lduha	[%r22, + 0x003d] %asi, %r31
T2_asi_reg_rd_49:
	mov	0x11, %r14
	.word 0xf2db84a0  ! 1232: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf6d420d6  ! 1235: LDSHA_I	ldsha	[%r16, + 0x00d6] %asi, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_50:
	mov	0x1, %r14
	.word 0xf8db8400  ! 1238: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_2_103:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_103), 16, 16)) -> intp(2, 0, 29)
	.word 0xf2842036  ! 1242: LDUWA_I	lduwa	[%r16, + 0x0036] %asi, %r25
	.word 0xf84cc000  ! 1243: LDSB_R	ldsb	[%r19 + %r0], %r28
cpu_intr_2_101:
	setx	0x25031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6942147  ! 1255: ORcc_I	orcc 	%r16, 0x0147, %r27
	.word 0xbc8d4000  ! 1258: ANDcc_R	andcc 	%r21, %r0, %r30
	.word 0xf085a1ed  ! 1259: LDUWA_I	lduwa	[%r22, + 0x01ed] %asi, %r24
	.word 0xfac4a1e1  ! 1260: LDSWA_I	ldswa	[%r18, + 0x01e1] %asi, %r29
iob_intr_2_104:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_104), 16, 16)) -> intp(2, 0, 28)
T2_asi_reg_wr_55:
	mov	0x29, %r14
	.word 0xf0f389e0  ! 1264: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xfac40020  ! 1265: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r29
T2_asi_reg_wr_56:
	mov	0x3c6, %r14
	.word 0xfef384a0  ! 1268: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf8458000  ! 1270: LDSW_R	ldsw	[%r22 + %r0], %r28
	.word 0xf694c020  ! 1272: LDUHA_R	lduha	[%r19, %r0] 0x01, %r27
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_102:
	setx	0x25002e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_103:
	setx	0x24002a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_104:
	setx	0x260011, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982c02  ! 1286: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c02, %hpstate
cpu_intr_2_105:
	setx	0x240014, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982cd8  ! 1288: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd8, %hpstate
cpu_intr_2_106:
	setx	0x25013d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_105:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_105), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf855c000  ! 1295: LDSH_R	ldsh	[%r23 + %r0], %r28
	.word 0xf49421d4  ! 1299: LDUHA_I	lduha	[%r16, + 0x01d4] %asi, %r26
cpu_intr_2_107:
	setx	0x240313, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_108:
	setx	0x260130, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfc848020  ! 1306: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r30
	.word 0xfc95609b  ! 1307: LDUHA_I	lduha	[%r21, + 0x009b] %asi, %r30
iob_intr_2_106:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_106), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_wr_57:
	mov	0x29, %r14
	.word 0xf2f384a0  ! 1310: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_2_109:
	setx	0x260339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf68d0020  ! 1317: LDUBA_R	lduba	[%r20, %r0] 0x01, %r27
	.word 0xfcd561ad  ! 1320: LDSHA_I	ldsha	[%r21, + 0x01ad] %asi, %r30
	.word 0xf414e0aa  ! 1322: LDUH_I	lduh	[%r19 + 0x00aa], %r26
cpu_intr_2_110:
	setx	0x270223, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_51:
	mov	0x17, %r14
	.word 0xf0db8400  ! 1325: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	ta	T_CHANGE_TO_TL1
	.word 0xf61520e9  ! 1327: LDUH_I	lduh	[%r20 + 0x00e9], %r27
T2_asi_reg_wr_58:
	mov	0x3c5, %r14
	.word 0xfef38e40  ! 1330: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf25d4000  ! 1331: LDX_R	ldx	[%r21 + %r0], %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_107:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_107), 16, 16)) -> intp(2, 0, 28)
T2_asi_reg_rd_52:
	mov	0x18, %r14
	.word 0xf2db8e80  ! 1338: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T2_asi_reg_rd_53:
	mov	0x24, %r14
	.word 0xfcdb8400  ! 1343: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_2_108:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_108), 16, 16)) -> intp(2, 0, 2)
T2_asi_reg_rd_54:
	mov	0x25, %r14
	.word 0xf6db8e40  ! 1345: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_2_111:
	setx	0x26012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc1d8000  ! 1348: XOR_R	xor 	%r22, %r0, %r30
iob_intr_2_109:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_109), 16, 16)) -> intp(2, 0, 26)
cpu_intr_2_112:
	setx	0x250035, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_55:
	mov	0x3c2, %r14
	.word 0xf2db8e60  ! 1352: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_2_110:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_110), 16, 16)) -> intp(2, 0, 7)
cpu_intr_2_113:
	setx	0x27031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_56:
	mov	0x3c3, %r14
	.word 0xf6db8e40  ! 1359: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfa8ce0ee  ! 1360: LDUBA_I	lduba	[%r19, + 0x00ee] %asi, %r29
	.word 0xf8cdc020  ! 1361: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r28
	ta	T_CHANGE_TO_TL1
	.word 0xf44d61df  ! 1369: LDSB_I	ldsb	[%r21 + 0x01df], %r26
	.word 0xfe4c4000  ! 1370: LDSB_R	ldsb	[%r17 + %r0], %r31
T2_asi_reg_wr_59:
	mov	0x3c8, %r14
	.word 0xf0f38e60  ! 1371: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xfa4c206f  ! 1372: LDSB_I	ldsb	[%r16 + 0x006f], %r29
T2_asi_reg_rd_57:
	mov	0x1c, %r14
	.word 0xfedb8e80  ! 1373: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_111:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_111), 16, 16)) -> intp(2, 0, 3f)
T2_asi_reg_rd_58:
	mov	0x3c3, %r14
	.word 0xfadb8e40  ! 1380: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_wr_60:
	mov	0x3c7, %r14
	.word 0xfaf38400  ! 1381: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T2_asi_reg_wr_61:
	mov	0x3c3, %r14
	.word 0xfcf389e0  ! 1382: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_59:
	mov	0x3c7, %r14
	.word 0xf0db84a0  ! 1386: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983e90  ! 1387: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e90, %hpstate
	.word 0xf2958020  ! 1388: LDUHA_R	lduha	[%r22, %r0] 0x01, %r25
T2_asi_reg_rd_60:
	mov	0x19, %r14
	.word 0xfadb8400  ! 1389: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_2_112:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_112), 16, 16)) -> intp(2, 0, 32)
cpu_intr_2_114:
	setx	0x280023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc5ca054  ! 1393: LDX_I	ldx	[%r18 + 0x0054], %r30
cpu_intr_2_115:
	setx	0x29031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0c5c020  ! 1397: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r24
	.word 0xf2c58020  ! 1398: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r25
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983fda  ! 1399: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fda, %hpstate
T2_asi_reg_rd_61:
	mov	0x3c1, %r14
	.word 0xfcdb8e60  ! 1400: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_2_113:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_113), 16, 16)) -> intp(2, 0, 1)
T2_asi_reg_wr_62:
	mov	0x32, %r14
	.word 0xfcf384a0  ! 1402: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf295c020  ! 1407: LDUHA_R	lduha	[%r23, %r0] 0x01, %r25
	.word 0xbca5a0a2  ! 1409: SUBcc_I	subcc 	%r22, 0x00a2, %r30
cpu_intr_2_116:
	setx	0x280324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbac58000  ! 1411: ADDCcc_R	addccc 	%r22, %r0, %r29
	.word 0xf0158000  ! 1412: LDUH_R	lduh	[%r22 + %r0], %r24
cpu_intr_2_117:
	setx	0x29002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe846048  ! 1419: LDUWA_I	lduwa	[%r17, + 0x0048] %asi, %r31
T2_asi_reg_rd_62:
	mov	0xf, %r14
	.word 0xfadb8e80  ! 1420: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf214e014  ! 1421: LDUH_I	lduh	[%r19 + 0x0014], %r25
T2_asi_reg_wr_63:
	mov	0x3c0, %r14
	.word 0xf6f38400  ! 1422: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_2_114:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_114), 16, 16)) -> intp(2, 0, 3)
	.word 0xfc444000  ! 1426: LDSW_R	ldsw	[%r17 + %r0], %r30
	.word 0xf6cc20e5  ! 1427: LDSBA_I	ldsba	[%r16, + 0x00e5] %asi, %r27
T2_asi_reg_wr_64:
	mov	0x3c2, %r14
	.word 0xf2f38e40  ! 1428: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbb2d2001  ! 1429: SLL_I	sll 	%r20, 0x0001, %r29
	.word 0xf6050000  ! 1430: LDUW_R	lduw	[%r20 + %r0], %r27
	.word 0xfa5dc000  ! 1432: LDX_R	ldx	[%r23 + %r0], %r29
	.word 0xb2454000  ! 1439: ADDC_R	addc 	%r21, %r0, %r25
cpu_intr_2_118:
	setx	0x2a0014, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_119:
	setx	0x2b0024, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0xfa0ca131  ! 1449: LDUB_I	ldub	[%r18 + 0x0131], %r29
T2_asi_reg_wr_65:
	mov	0x2b, %r14
	.word 0xf4f389e0  ! 1452: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf8cc20e9  ! 1456: LDSBA_I	ldsba	[%r16, + 0x00e9] %asi, %r28
cpu_intr_2_120:
	setx	0x2b022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfac4a0c7  ! 1461: LDSWA_I	ldswa	[%r18, + 0x00c7] %asi, %r29
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983f42  ! 1462: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f42, %hpstate
	.word 0x8195612f  ! 1464: WRPR_TPC_I	wrpr	%r21, 0x012f, %tpc
	.word 0xb82c2178  ! 1465: ANDN_I	andn 	%r16, 0x0178, %r28
	.word 0xf25d2009  ! 1469: LDX_I	ldx	[%r20 + 0x0009], %r25
T2_asi_reg_rd_63:
	mov	0x3c4, %r14
	.word 0xf4db8e60  ! 1470: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T2_asi_reg_rd_64:
	mov	0x3c1, %r14
	.word 0xf6db89e0  ! 1472: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T2_asi_reg_wr_66:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 1473: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbe9d206d  ! 1474: XORcc_I	xorcc 	%r20, 0x006d, %r31
cpu_intr_2_121:
	setx	0x2b011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4458000  ! 1477: LDSW_R	ldsw	[%r22 + %r0], %r26
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982802  ! 1479: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0802, %hpstate
iob_intr_2_115:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_115), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_wr_67:
	mov	0x3, %r14
	.word 0xf2f38e40  ! 1484: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_2_122:
	setx	0x280332, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_68:
	mov	0x2c, %r14
	.word 0xfaf389e0  ! 1486: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T2_asi_reg_wr_69:
	mov	0x29, %r14
	.word 0xf2f38e40  ! 1487: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_2_123:
	setx	0x2a010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf494a01a  ! 1494: LDUHA_I	lduha	[%r18, + 0x001a] %asi, %r26
iob_intr_2_116:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_116), 16, 16)) -> intp(2, 0, 1)
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_70:
	mov	0x38, %r14
	.word 0xfcf38e40  ! 1500: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_2_117:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_117), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_wr_71:
	mov	0x2a, %r14
	.word 0xf8f38e60  ! 1502: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_2_118:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_118), 16, 16)) -> intp(2, 0, 6)
	.word 0xf4152166  ! 1508: LDUH_I	lduh	[%r20 + 0x0166], %r26
	.word 0xbd7cc400  ! 1510: MOVR_R	movre	%r19, %r0, %r30
	ta	T_CHANGE_TO_TL1
	.word 0xf40d2042  ! 1512: LDUB_I	ldub	[%r20 + 0x0042], %r26
T2_asi_reg_rd_65:
	mov	0x3c2, %r14
	.word 0xf6db89e0  ! 1514: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_2_119:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_119), 16, 16)) -> intp(2, 0, b)
	.word 0xf495c020  ! 1516: LDUHA_R	lduha	[%r23, %r0] 0x01, %r26
	.word 0xb535c000  ! 1517: SRL_R	srl 	%r23, %r0, %r26
	.word 0xf40ca00e  ! 1519: LDUB_I	ldub	[%r18 + 0x000e], %r26
	.word 0xbec5e026  ! 1521: ADDCcc_I	addccc 	%r23, 0x0026, %r31
	.word 0xfc8da0b8  ! 1530: LDUBA_I	lduba	[%r22, + 0x00b8] %asi, %r30
T2_asi_reg_rd_66:
	mov	0x1a, %r14
	.word 0xf0db8400  ! 1531: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf89560a1  ! 1535: LDUHA_I	lduha	[%r21, + 0x00a1] %asi, %r28
	.word 0xb09d6161  ! 1542: XORcc_I	xorcc 	%r21, 0x0161, %r24
	.word 0xb0b4c000  ! 1543: SUBCcc_R	orncc 	%r19, %r0, %r24
	.word 0xfa95c020  ! 1546: LDUHA_R	lduha	[%r23, %r0] 0x01, %r29
	.word 0xf0442051  ! 1551: LDSW_I	ldsw	[%r16 + 0x0051], %r24
T2_asi_reg_rd_67:
	mov	0x3c3, %r14
	.word 0xf2db8e60  ! 1552: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_2_124:
	setx	0x29030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_72:
	mov	0x2e, %r14
	.word 0xf2f38e80  ! 1557: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_125:
	setx	0x2b011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf48da1f3  ! 1560: LDUBA_I	lduba	[%r22, + 0x01f3] %asi, %r26
	.word 0xbe150000  ! 1561: OR_R	or 	%r20, %r0, %r31
T2_asi_reg_rd_68:
	mov	0x3c5, %r14
	.word 0xfedb84a0  ! 1563: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf8c5a16d  ! 1564: LDSWA_I	ldswa	[%r22, + 0x016d] %asi, %r28
cpu_intr_2_126:
	setx	0x2a033e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_127:
	setx	0x280103, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_128:
	setx	0x2a013a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_120:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_120), 16, 16)) -> intp(2, 0, 2d)
	ta	T_CHANGE_TO_TL0
cpu_intr_2_129:
	setx	0x2b030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6240000  ! 1578: SUB_R	sub 	%r16, %r0, %r27
	.word 0xfc54a159  ! 1580: LDSH_I	ldsh	[%r18 + 0x0159], %r30
	.word 0xfa8c4020  ! 1581: LDUBA_R	lduba	[%r17, %r0] 0x01, %r29
	ta	T_CHANGE_HPRIV
	.word 0xf495e0f6  ! 1583: LDUHA_I	lduha	[%r23, + 0x00f6] %asi, %r26
iob_intr_2_121:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_121), 16, 16)) -> intp(2, 0, 1)
	ta	T_CHANGE_TO_TL1
	.word 0xf88de1fb  ! 1587: LDUBA_I	lduba	[%r23, + 0x01fb] %asi, %r28
	.word 0xfad50020  ! 1590: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r29
	.word 0xb8350000  ! 1591: SUBC_R	orn 	%r20, %r0, %r28
iob_intr_2_122:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_122), 16, 16)) -> intp(2, 0, 19)
	.word 0xa1902002  ! 1597: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983c12  ! 1599: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c12, %hpstate
iob_intr_2_123:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_123), 16, 16)) -> intp(2, 0, 2a)
T2_asi_reg_rd_69:
	mov	0x3c6, %r14
	.word 0xf2db8e40  ! 1602: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf2840020  ! 1604: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r25
T2_asi_reg_rd_70:
	mov	0x1a, %r14
	.word 0xfedb89e0  ! 1609: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb2348000  ! 1610: SUBC_R	orn 	%r18, %r0, %r25
	.word 0xf0d40020  ! 1612: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r24
T2_asi_reg_rd_71:
	mov	0x28, %r14
	.word 0xf0db89e0  ! 1613: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	ta	T_CHANGE_HPRIV
	.word 0xf6c5c020  ! 1624: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r27
cpu_intr_2_130:
	setx	0x2b0214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6158000  ! 1634: LDUH_R	lduh	[%r22 + %r0], %r27
iob_intr_2_124:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_124), 16, 16)) -> intp(2, 0, 3c)
T2_asi_reg_wr_73:
	mov	0x3c1, %r14
	.word 0xfaf38e60  ! 1636: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_2_131:
	setx	0x290227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf28dc020  ! 1641: LDUBA_R	lduba	[%r23, %r0] 0x01, %r25
	.word 0xb605e0b3  ! 1642: ADD_I	add 	%r23, 0x00b3, %r27
	.word 0xf6952109  ! 1645: LDUHA_I	lduha	[%r20, + 0x0109] %asi, %r27
iob_intr_2_125:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_125), 16, 16)) -> intp(2, 0, e)
iob_intr_2_126:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_126), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf845a094  ! 1648: LDSW_I	ldsw	[%r22 + 0x0094], %r28
T2_asi_reg_rd_72:
	mov	0x3c6, %r14
	.word 0xf8db8e60  ! 1650: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf0948020  ! 1654: LDUHA_R	lduha	[%r18, %r0] 0x01, %r24
	.word 0xf0056083  ! 1657: LDUW_I	lduw	[%r21 + 0x0083], %r24
	.word 0xfacca1ad  ! 1658: LDSBA_I	ldsba	[%r18, + 0x01ad] %asi, %r29
	.word 0xf0d44020  ! 1661: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r24
	.word 0xb48d6011  ! 1666: ANDcc_I	andcc 	%r21, 0x0011, %r26
	.word 0xb2b5e0c4  ! 1667: SUBCcc_I	orncc 	%r23, 0x00c4, %r25
	ta	T_CHANGE_HPRIV
cpu_intr_2_132:
	setx	0x28000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_73:
	mov	0x35, %r14
	.word 0xfedb8400  ! 1674: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf85d8000  ! 1676: LDX_R	ldx	[%r22 + %r0], %r28
iob_intr_2_127:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_127), 16, 16)) -> intp(2, 0, 22)
	.word 0xf2c5a178  ! 1678: LDSWA_I	ldswa	[%r22, + 0x0178] %asi, %r25
T2_asi_reg_rd_74:
	mov	0x1c, %r14
	.word 0xf8db8400  ! 1679: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_2_128:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_128), 16, 16)) -> intp(2, 0, f)
cpu_intr_2_133:
	setx	0x2a0135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4cc000  ! 1686: LDSB_R	ldsb	[%r19 + %r0], %r31
	.word 0xf0d5c020  ! 1689: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r24
	.word 0xf6d4c020  ! 1694: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r27
cpu_intr_2_134:
	setx	0x280222, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_129:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_129), 16, 16)) -> intp(2, 0, 6)
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_75:
	mov	0x26, %r14
	.word 0xf8db8400  ! 1703: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_2_130:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_130), 16, 16)) -> intp(2, 0, 4)
iob_intr_2_131:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_131), 16, 16)) -> intp(2, 0, f)
	.word 0xb61d20b6  ! 1706: XOR_I	xor 	%r20, 0x00b6, %r27
	.word 0xf6cc0020  ! 1707: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r27
iob_intr_2_132:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_132), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_133:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_133), 16, 16)) -> intp(2, 0, 3b)
	.word 0xf0c50020  ! 1712: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_135:
	setx	0x2a0105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb005c000  ! 1722: ADD_R	add 	%r23, %r0, %r24
	.word 0xfa548000  ! 1724: LDSH_R	ldsh	[%r18 + %r0], %r29
	.word 0xb60da0e0  ! 1726: AND_I	and 	%r22, 0x00e0, %r27
T2_asi_reg_rd_76:
	mov	0xa, %r14
	.word 0xf6db89e0  ! 1728: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_2_136:
	setx	0x2b0033, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_77:
	mov	0x3c3, %r14
	.word 0xf0db84a0  ! 1732: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T2_asi_reg_rd_78:
	mov	0x6, %r14
	.word 0xf4db8e80  ! 1736: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_2_134:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_134), 16, 16)) -> intp(2, 0, 21)
T2_asi_reg_wr_74:
	mov	0x36, %r14
	.word 0xfcf38400  ! 1741: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T2_asi_reg_rd_79:
	mov	0x30, %r14
	.word 0xfcdb8400  ! 1744: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf2d56001  ! 1748: LDSHA_I	ldsha	[%r21, + 0x0001] %asi, %r25
iob_intr_2_135:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_135), 16, 16)) -> intp(2, 0, 1)
cpu_intr_2_137:
	setx	0x2b0334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf20d611c  ! 1751: LDUB_I	ldub	[%r21 + 0x011c], %r25
	.word 0xfacd0020  ! 1761: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r29
iob_intr_2_136:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_136), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_rd_80:
	mov	0x3c3, %r14
	.word 0xfedb8e60  ! 1771: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_2_138:
	setx	0x290213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6c5a1d5  ! 1774: LDSWA_I	ldswa	[%r22, + 0x01d5] %asi, %r27
cpu_intr_2_139:
	setx	0x280134, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_75:
	mov	0x25, %r14
	.word 0xf6f389e0  ! 1776: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_76:
	mov	0x0, %r14
	.word 0xfcf38e80  ! 1779: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf2dce042  ! 1782: LDXA_I	ldxa	[%r19, + 0x0042] %asi, %r25
T2_asi_reg_wr_77:
	mov	0x29, %r14
	.word 0xf0f38400  ! 1783: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_2_140:
	setx	0x2a0031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf455e06d  ! 1786: LDSH_I	ldsh	[%r23 + 0x006d], %r26
T2_asi_reg_wr_78:
	mov	0x3, %r14
	.word 0xf0f38e60  ! 1787: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb3341000  ! 1789: SRLX_R	srlx	%r16, %r0, %r25
cpu_intr_2_141:
	setx	0x2a0329, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_79:
	mov	0x3c4, %r14
	.word 0xfcf38e40  ! 1801: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_2_137:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_137), 16, 16)) -> intp(2, 0, 3c)
iob_intr_2_138:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_138), 16, 16)) -> intp(2, 0, 1)
	.word 0xf2d5c020  ! 1807: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r25
	.word 0xfccc8020  ! 1809: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r30
	.word 0xf65d8000  ! 1812: LDX_R	ldx	[%r22 + %r0], %r27
	.word 0xb2aca18e  ! 1813: ANDNcc_I	andncc 	%r18, 0x018e, %r25
T2_asi_reg_rd_81:
	mov	0x3c8, %r14
	.word 0xf8db8e40  ! 1815: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T2_asi_reg_wr_80:
	mov	0x3c2, %r14
	.word 0xfef38e60  ! 1816: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf244a12f  ! 1817: LDSW_I	ldsw	[%r18 + 0x012f], %r25
	.word 0xb72dd000  ! 1818: SLLX_R	sllx	%r23, %r0, %r27
iob_intr_2_139:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_139), 16, 16)) -> intp(2, 0, d)
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x819829d2  ! 1821: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d2, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_81:
	mov	0x3c8, %r14
	.word 0xfaf38e80  ! 1826: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_2_142:
	setx	0x2f022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983952  ! 1829: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1952, %hpstate
	.word 0xf2050000  ! 1832: LDUW_R	lduw	[%r20 + %r0], %r25
	.word 0xfa840020  ! 1833: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r29
	.word 0xf4dca12f  ! 1834: LDXA_I	ldxa	[%r18, + 0x012f] %asi, %r26
	.word 0xfed4c020  ! 1837: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r31
cpu_intr_2_143:
	setx	0x2f0239, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_144:
	setx	0x2f0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3c4000  ! 1850: SRA_R	sra 	%r17, %r0, %r31
	.word 0xf68c8020  ! 1853: LDUBA_R	lduba	[%r18, %r0] 0x01, %r27
	.word 0xf4cd4020  ! 1854: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r26
T2_asi_reg_rd_82:
	mov	0x3c7, %r14
	.word 0xf6db8e80  ! 1855: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_2_145:
	setx	0x2c032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfed46103  ! 1857: LDSHA_I	ldsha	[%r17, + 0x0103] %asi, %r31
cpu_intr_2_146:
	setx	0x2d033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf894e1cc  ! 1861: LDUHA_I	lduha	[%r19, + 0x01cc] %asi, %r28
iob_intr_2_140:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_140), 16, 16)) -> intp(2, 0, 2)
	.word 0xf8840020  ! 1867: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r28
	.word 0xfcdda1ed  ! 1869: LDXA_I	ldxa	[%r22, + 0x01ed] %asi, %r30
iob_intr_2_141:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_141), 16, 16)) -> intp(2, 0, 35)
	.word 0xf20cc000  ! 1875: LDUB_R	ldub	[%r19 + %r0], %r25
	.word 0xb80de093  ! 1877: AND_I	and 	%r23, 0x0093, %r28
	.word 0xf614c000  ! 1881: LDUH_R	lduh	[%r19 + %r0], %r27
	.word 0xf2d4a01d  ! 1882: LDSHA_I	ldsha	[%r18, + 0x001d] %asi, %r25
iob_intr_2_142:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_142), 16, 16)) -> intp(2, 0, 2f)
iob_intr_2_143:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_143), 16, 16)) -> intp(2, 0, 6)
T2_asi_reg_wr_82:
	mov	0x33, %r14
	.word 0xfef38e60  ! 1885: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf6544000  ! 1887: LDSH_R	ldsh	[%r17 + %r0], %r27
cpu_intr_2_147:
	setx	0x2f030e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_83:
	mov	0x3c5, %r14
	.word 0xf6db8e40  ! 1891: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb4358000  ! 1893: ORN_R	orn 	%r22, %r0, %r26
	.word 0xf05461a2  ! 1894: LDSH_I	ldsh	[%r17 + 0x01a2], %r24
T2_asi_reg_wr_83:
	mov	0x18, %r14
	.word 0xf4f38e40  ! 1895: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_wr_84:
	mov	0x3c8, %r14
	.word 0xf8f389e0  ! 1898: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb1643801  ! 1902: MOVcc_I	<illegal instruction>
iob_intr_2_144:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_144), 16, 16)) -> intp(2, 0, 22)
	.word 0xfc94a101  ! 1908: LDUHA_I	lduha	[%r18, + 0x0101] %asi, %r30
	.word 0xbea4c000  ! 1911: SUBcc_R	subcc 	%r19, %r0, %r31
T2_asi_reg_rd_84:
	mov	0xc, %r14
	.word 0xf6db89e0  ! 1912: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_2_148:
	setx	0x2c033f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_149:
	setx	0x2c0207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb335e001  ! 1919: SRL_I	srl 	%r23, 0x0001, %r25
cpu_intr_2_150:
	setx	0x2d011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4d5a03a  ! 1921: LDSHA_I	ldsha	[%r22, + 0x003a] %asi, %r26
cpu_intr_2_151:
	setx	0x2f0111, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_152:
	setx	0x2e030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8ce009  ! 1929: LDUBA_I	lduba	[%r19, + 0x0009] %asi, %r31
cpu_intr_2_153:
	setx	0x20127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfac50020  ! 1931: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r29
	.word 0xb8850000  ! 1933: ADDcc_R	addcc 	%r20, %r0, %r28
	.word 0xb4a4a168  ! 1934: SUBcc_I	subcc 	%r18, 0x0168, %r26
cpu_intr_2_154:
	setx	0x2f0238, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_155:
	setx	0x2c013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24c0000  ! 1940: LDSB_R	ldsb	[%r16 + %r0], %r25
cpu_intr_2_156:
	setx	0x2c0214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4c8000  ! 1946: LDSB_R	ldsb	[%r18 + %r0], %r29
cpu_intr_2_157:
	setx	0x2e0229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_158:
	setx	0x1d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_159:
	setx	0x2c0236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4142157  ! 1951: OR_I	or 	%r16, 0x0157, %r26
	ta	T_CHANGE_TO_TL0
	.word 0xb0250000  ! 1955: SUB_R	sub 	%r20, %r0, %r24
	.word 0xf255a0ce  ! 1957: LDSH_I	ldsh	[%r22 + 0x00ce], %r25
	.word 0xf0452020  ! 1958: LDSW_I	ldsw	[%r20 + 0x0020], %r24
T2_asi_reg_rd_85:
	mov	0x3c2, %r14
	.word 0xfedb8e40  ! 1959: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_2_145:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_145), 16, 16)) -> intp(2, 0, 36)
cpu_intr_2_160:
	setx	0x2e012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf29461c3  ! 1962: LDUHA_I	lduha	[%r17, + 0x01c3] %asi, %r25
iob_intr_2_146:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_146), 16, 16)) -> intp(2, 0, 2d)
iob_intr_2_147:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_147), 16, 16)) -> intp(2, 0, 1a)
cpu_intr_2_161:
	setx	0x2c0125, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_86:
	mov	0x16, %r14
	.word 0xf4db8e40  ! 1969: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_2_162:
	setx	0x2e0105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8d2141  ! 1974: LDUBA_I	lduba	[%r20, + 0x0141] %asi, %r31
	.word 0xf29520f3  ! 1977: LDUHA_I	lduha	[%r20, + 0x00f3] %asi, %r25
iob_intr_2_148:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_148), 16, 16)) -> intp(2, 0, 4)
	.word 0xbcbc0000  ! 1981: XNORcc_R	xnorcc 	%r16, %r0, %r30
cpu_intr_2_163:
	setx	0x2d0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf695a189  ! 1987: LDUHA_I	lduha	[%r22, + 0x0189] %asi, %r27
iob_intr_2_149:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_149), 16, 16)) -> intp(2, 0, 18)
iob_intr_2_150:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_150), 16, 16)) -> intp(2, 0, 33)
	.word 0xf6452050  ! 1991: LDSW_I	ldsw	[%r20 + 0x0050], %r27
	.word 0xfec521c1  ! 1993: LDSWA_I	ldswa	[%r20, + 0x01c1] %asi, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_164:
	setx	0x2e012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf35c000  ! 2002: SRL_R	srl 	%r23, %r0, %r31
T2_asi_reg_wr_85:
	mov	0x28, %r14
	.word 0xf2f384a0  ! 2003: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbe3dc000  ! 2005: XNOR_R	xnor 	%r23, %r0, %r31
iob_intr_2_151:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_151), 16, 16)) -> intp(2, 0, 24)
T2_asi_reg_rd_87:
	mov	0x3c3, %r14
	.word 0xf6db8e80  ! 2007: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_2_152:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_152), 16, 16)) -> intp(2, 0, 28)
	ta	T_CHANGE_NONHPRIV
	.word 0xfacd8020  ! 2011: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r29
cpu_intr_2_165:
	setx	0x2d0127, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_153:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_153), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf08c2118  ! 2019: LDUBA_I	lduba	[%r16, + 0x0118] %asi, %r24
T2_asi_reg_wr_86:
	mov	0x9, %r14
	.word 0xf8f389e0  ! 2023: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xfc848020  ! 2024: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r30
	.word 0xf815c000  ! 2026: LDUH_R	lduh	[%r23 + %r0], %r28
	.word 0xb20d2180  ! 2034: AND_I	and 	%r20, 0x0180, %r25
	.word 0xf2940020  ! 2037: LDUHA_R	lduha	[%r16, %r0] 0x01, %r25
	.word 0x8195a115  ! 2039: WRPR_TPC_I	wrpr	%r22, 0x0115, %tpc
cpu_intr_2_166:
	setx	0x2f011d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_167:
	setx	0x2e0315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa94e031  ! 2045: LDUHA_I	lduha	[%r19, + 0x0031] %asi, %r29
iob_intr_2_154:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_154), 16, 16)) -> intp(2, 0, 38)
iob_intr_2_155:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_155), 16, 16)) -> intp(2, 0, 23)
T2_asi_reg_wr_87:
	mov	0x29, %r14
	.word 0xfcf38400  ! 2050: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_156:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_156), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_168:
	setx	0x2d0028, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_169:
	setx	0x2d0108, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_88:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 2057: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbe354000  ! 2058: ORN_R	orn 	%r21, %r0, %r31
T2_asi_reg_rd_89:
	mov	0x3c3, %r14
	.word 0xf8db8e60  ! 2061: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf00520e0  ! 2064: LDUW_I	lduw	[%r20 + 0x00e0], %r24
T2_asi_reg_wr_88:
	mov	0x20, %r14
	.word 0xfcf38400  ! 2065: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T2_asi_reg_wr_89:
	mov	0x6, %r14
	.word 0xfef389e0  ! 2066: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf445c000  ! 2070: LDSW_R	ldsw	[%r23 + %r0], %r26
iob_intr_2_157:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_157), 16, 16)) -> intp(2, 0, 3d)
	.word 0xbf50c000  ! 2077: RDPR_TT	<illegal instruction>
T2_asi_reg_wr_90:
	mov	0x3c1, %r14
	.word 0xf2f389e0  ! 2078: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf4456188  ! 2079: LDSW_I	ldsw	[%r21 + 0x0188], %r26
T2_asi_reg_rd_90:
	mov	0x3c7, %r14
	.word 0xf6db84a0  ! 2080: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T2_asi_reg_wr_91:
	mov	0x30, %r14
	.word 0xf2f38e80  ! 2082: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL1
	.word 0xb0142198  ! 2091: OR_I	or 	%r16, 0x0198, %r24
	.word 0xfa054000  ! 2092: LDUW_R	lduw	[%r21 + %r0], %r29
cpu_intr_2_170:
	setx	0x2f0012, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_158:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_158), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf8c5c020  ! 2106: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r28
	.word 0xfc158000  ! 2109: LDUH_R	lduh	[%r22 + %r0], %r30
	.word 0xf40c4000  ! 2110: LDUB_R	ldub	[%r17 + %r0], %r26
	.word 0xb151c000  ! 2117: RDPR_TL	<illegal instruction>
	.word 0xf414212d  ! 2118: LDUH_I	lduh	[%r16 + 0x012d], %r26
	.word 0xf81521d5  ! 2120: LDUH_I	lduh	[%r20 + 0x01d5], %r28
	.word 0xb625e14f  ! 2121: SUB_I	sub 	%r23, 0x014f, %r27
T2_asi_reg_rd_91:
	mov	0x3c1, %r14
	.word 0xfadb89e0  ! 2122: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_2_171:
	setx	0x2f0033, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_2_159:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_159), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_rd_92:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 2131: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfe84213a  ! 2132: LDUWA_I	lduwa	[%r16, + 0x013a] %asi, %r31
iob_intr_2_160:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_160), 16, 16)) -> intp(2, 0, 3)
	.word 0xf0d4e0c0  ! 2135: LDSHA_I	ldsha	[%r19, + 0x00c0] %asi, %r24
	.word 0xb6c5e0c0  ! 2136: ADDCcc_I	addccc 	%r23, 0x00c0, %r27
T2_asi_reg_wr_92:
	mov	0x2e, %r14
	.word 0xf4f38e60  ! 2139: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf4cce15a  ! 2140: LDSBA_I	ldsba	[%r19, + 0x015a] %asi, %r26
	.word 0xf4cd4020  ! 2144: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r26
	.word 0xfed46052  ! 2148: LDSHA_I	ldsha	[%r17, + 0x0052] %asi, %r31
iob_intr_2_161:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_161), 16, 16)) -> intp(2, 0, c)
	ta	T_CHANGE_NONHPRIV
	.word 0xf05d61e9  ! 2152: LDX_I	ldx	[%r21 + 0x01e9], %r24
T2_asi_reg_wr_93:
	mov	0x3c8, %r14
	.word 0xfcf38e60  ! 2155: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb9345000  ! 2162: SRLX_R	srlx	%r17, %r0, %r28
	.word 0xf20ce091  ! 2164: LDUB_I	ldub	[%r19 + 0x0091], %r25
T2_asi_reg_rd_93:
	mov	0x13, %r14
	.word 0xfcdb8400  ! 2165: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T2_asi_reg_rd_94:
	mov	0x2e, %r14
	.word 0xf0db89e0  ! 2166: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_2_162:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_162), 16, 16)) -> intp(2, 0, 2)
T2_asi_reg_rd_95:
	mov	0x2c, %r14
	.word 0xfcdb8e80  ! 2169: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb8354000  ! 2172: ORN_R	orn 	%r21, %r0, %r28
cpu_intr_2_172:
	setx	0x2c010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_96:
	mov	0x3, %r14
	.word 0xf6db8e40  ! 2175: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_2_173:
	setx	0x2c021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0d4a0b6  ! 2178: LDSHA_I	ldsha	[%r18, + 0x00b6] %asi, %r24
	.word 0xf855a1d5  ! 2179: LDSH_I	ldsh	[%r22 + 0x01d5], %r28
iob_intr_2_163:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_163), 16, 16)) -> intp(2, 0, 0)
	.word 0xf4c5e044  ! 2181: LDSWA_I	ldswa	[%r23, + 0x0044] %asi, %r26
cpu_intr_2_174:
	setx	0x2f0207, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_94:
	mov	0x12, %r14
	.word 0xf2f38e40  ! 2185: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T2_asi_reg_rd_97:
	mov	0x3c8, %r14
	.word 0xf8db8e40  ! 2187: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf88c0020  ! 2188: LDUBA_R	lduba	[%r16, %r0] 0x01, %r28
cpu_intr_2_175:
	setx	0x2f000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa94c020  ! 2190: LDUHA_R	lduha	[%r19, %r0] 0x01, %r29
	.word 0xf6158000  ! 2191: LDUH_R	lduh	[%r22 + %r0], %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xf84d0000  ! 2194: LDSB_R	ldsb	[%r20 + %r0], %r28
cpu_intr_2_176:
	setx	0x2d023a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_98:
	mov	0x33, %r14
	.word 0xfedb8e80  ! 2197: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb43c0000  ! 2198: XNOR_R	xnor 	%r16, %r0, %r26
cpu_intr_2_177:
	setx	0x2e033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf84d214e  ! 2200: LDSB_I	ldsb	[%r20 + 0x014e], %r28
	.word 0xfc45a060  ! 2203: LDSW_I	ldsw	[%r22 + 0x0060], %r30
T2_asi_reg_wr_95:
	mov	0x2a, %r14
	.word 0xfcf384a0  ! 2209: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_2_178:
	setx	0x2e003a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_179:
	setx	0x2f0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf2d2001  ! 2213: SLL_I	sll 	%r20, 0x0001, %r31
T2_asi_reg_rd_99:
	mov	0x11, %r14
	.word 0xfadb8e60  ! 2215: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xfccc4020  ! 2217: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r30
	.word 0xfe5c6078  ! 2219: LDX_I	ldx	[%r17 + 0x0078], %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbd3ce001  ! 2222: SRA_I	sra 	%r19, 0x0001, %r30
T2_asi_reg_rd_100:
	mov	0x3, %r14
	.word 0xfadb8e40  ! 2225: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_rd_101:
	mov	0x3c6, %r14
	.word 0xf2db8e60  ! 2226: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xfc0ca038  ! 2227: LDUB_I	ldub	[%r18 + 0x0038], %r30
cpu_intr_2_180:
	setx	0x2c0117, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xf2c4c020  ! 2235: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r25
T2_asi_reg_wr_96:
	mov	0x20, %r14
	.word 0xfaf38e80  ! 2237: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_97:
	mov	0x24, %r14
	.word 0xf2f38e80  ! 2243: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xba34c000  ! 2245: SUBC_R	orn 	%r19, %r0, %r29
T2_asi_reg_wr_98:
	mov	0x23, %r14
	.word 0xfaf38400  ! 2247: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x819828d2  ! 2248: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d2, %hpstate
iob_intr_2_164:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_164), 16, 16)) -> intp(2, 0, 26)
	.word 0xf654a0c4  ! 2250: LDSH_I	ldsh	[%r18 + 0x00c4], %r27
T2_asi_reg_rd_102:
	mov	0x3c8, %r14
	.word 0xf4db8e40  ! 2251: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_HPRIV
	.word 0xfe45e178  ! 2253: LDSW_I	ldsw	[%r23 + 0x0178], %r31
iob_intr_2_165:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_165), 16, 16)) -> intp(2, 0, b)
	ta	T_CHANGE_HPRIV
	.word 0xbe0d6144  ! 2258: AND_I	and 	%r21, 0x0144, %r31
T2_asi_reg_rd_103:
	mov	0x17, %r14
	.word 0xfcdb8e60  ! 2260: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf4d5e1bc  ! 2263: LDSHA_I	ldsha	[%r23, + 0x01bc] %asi, %r26
iob_intr_2_166:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_166), 16, 16)) -> intp(2, 0, 7)
	.word 0xf24d2079  ! 2266: LDSB_I	ldsb	[%r20 + 0x0079], %r25
iob_intr_2_167:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_167), 16, 16)) -> intp(2, 0, 1)
	.word 0xf2044000  ! 2268: LDUW_R	lduw	[%r17 + %r0], %r25
T2_asi_reg_wr_99:
	mov	0x2, %r14
	.word 0xf8f38400  ! 2270: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T2_asi_reg_rd_104:
	mov	0x7, %r14
	.word 0xf6db84a0  ! 2273: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xfa0da12e  ! 2274: LDUB_I	ldub	[%r22 + 0x012e], %r29
iob_intr_2_168:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_168), 16, 16)) -> intp(2, 0, 19)
	.word 0xf4dd210f  ! 2278: LDXA_I	ldxa	[%r20, + 0x010f] %asi, %r26
	.word 0xfc858020  ! 2279: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r30
	.word 0xb045a1f6  ! 2280: ADDC_I	addc 	%r22, 0x01f6, %r24
	.word 0xf28dc020  ! 2281: LDUBA_R	lduba	[%r23, %r0] 0x01, %r25
T2_asi_reg_wr_100:
	mov	0x30, %r14
	.word 0xfcf384a0  ! 2283: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfc850020  ! 2284: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r30
	.word 0xf2d44020  ! 2285: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r25
	.word 0xf4150000  ! 2287: LDUH_R	lduh	[%r20 + %r0], %r26
cpu_intr_2_181:
	setx	0x33002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaad2049  ! 2289: ANDNcc_I	andncc 	%r20, 0x0049, %r29
T2_asi_reg_wr_101:
	mov	0x3c0, %r14
	.word 0xf4f384a0  ! 2290: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_2_169:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_169), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf6d54020  ! 2295: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r27
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x819829c0  ! 2297: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c0, %hpstate
iob_intr_2_170:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_170), 16, 16)) -> intp(2, 0, 10)
	.word 0xf0d4c020  ! 2299: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r24
T2_asi_reg_rd_105:
	mov	0x3c1, %r14
	.word 0xf2db8e80  ! 2300: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_2_182:
	setx	0x31031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4d4000  ! 2302: LDSB_R	ldsb	[%r21 + %r0], %r31
	.word 0xf4cc0020  ! 2305: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r26
iob_intr_2_171:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_171), 16, 16)) -> intp(2, 0, 22)
	.word 0xfc0d4000  ! 2307: LDUB_R	ldub	[%r21 + %r0], %r30
	.word 0xb4b4c000  ! 2308: ORNcc_R	orncc 	%r19, %r0, %r26
	.word 0xfa8561f1  ! 2309: LDUWA_I	lduwa	[%r21, + 0x01f1] %asi, %r29
cpu_intr_2_183:
	setx	0x330201, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982c5a  ! 2312: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c5a, %hpstate
	.word 0xfa0c8000  ! 2313: LDUB_R	ldub	[%r18 + %r0], %r29
iob_intr_2_172:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_172), 16, 16)) -> intp(2, 0, 2)
iob_intr_2_173:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_173), 16, 16)) -> intp(2, 0, 6)
	.word 0xfc150000  ! 2320: LDUH_R	lduh	[%r20 + %r0], %r30
	.word 0xfccc6175  ! 2322: LDSBA_I	ldsba	[%r17, + 0x0175] %asi, %r30
	.word 0xb40de004  ! 2324: AND_I	and 	%r23, 0x0004, %r26
	ta	T_CHANGE_HPRIV
cpu_intr_2_184:
	setx	0x300034, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983b4a  ! 2332: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b4a, %hpstate
	.word 0xfe558000  ! 2333: LDSH_R	ldsh	[%r22 + %r0], %r31
	.word 0xf00ca0aa  ! 2334: LDUB_I	ldub	[%r18 + 0x00aa], %r24
cpu_intr_2_185:
	setx	0x330307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8d56127  ! 2339: LDSHA_I	ldsha	[%r21, + 0x0127] %asi, %r28
	.word 0xb4c5a07d  ! 2341: ADDCcc_I	addccc 	%r22, 0x007d, %r26
cpu_intr_2_186:
	setx	0x31012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc148000  ! 2347: OR_R	or 	%r18, %r0, %r30
T2_asi_reg_rd_106:
	mov	0x2b, %r14
	.word 0xf8db89e0  ! 2355: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf44da092  ! 2356: LDSB_I	ldsb	[%r22 + 0x0092], %r26
T2_asi_reg_wr_102:
	mov	0x37, %r14
	.word 0xf6f38e40  ! 2358: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_2_187:
	setx	0x320336, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_188:
	setx	0x310104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc54209a  ! 2362: LDSH_I	ldsh	[%r16 + 0x009a], %r30
	.word 0xfc8d8020  ! 2364: LDUBA_R	lduba	[%r22, %r0] 0x01, %r30
cpu_intr_2_189:
	setx	0x30002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xa1902001  ! 2375: WRPR_GL_I	wrpr	%r0, 0x0001, %-
iob_intr_2_174:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_174), 16, 16)) -> intp(2, 0, f)
iob_intr_2_175:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_175), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_190:
	setx	0x330139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf08c61e6  ! 2390: LDUBA_I	lduba	[%r17, + 0x01e6] %asi, %r24
	.word 0xb68cc000  ! 2391: ANDcc_R	andcc 	%r19, %r0, %r27
T2_asi_reg_wr_103:
	mov	0x3c3, %r14
	.word 0xfef38e40  ! 2392: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf445e1cf  ! 2394: LDSW_I	ldsw	[%r23 + 0x01cf], %r26
	.word 0xfc556140  ! 2397: LDSH_I	ldsh	[%r21 + 0x0140], %r30
cpu_intr_2_191:
	setx	0x320222, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_104:
	mov	0x1a, %r14
	.word 0xf0f38e40  ! 2400: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_wr_105:
	mov	0x3c4, %r14
	.word 0xf6f389e0  ! 2401: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf44d8000  ! 2402: LDSB_R	ldsb	[%r22 + %r0], %r26
	.word 0xf00de1ce  ! 2406: LDUB_I	ldub	[%r23 + 0x01ce], %r24
	.word 0xfe044000  ! 2408: LDUW_R	lduw	[%r17 + %r0], %r31
cpu_intr_2_192:
	setx	0x300209, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_106:
	mov	0x2f, %r14
	.word 0xf8f38400  ! 2412: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T2_asi_reg_wr_107:
	mov	0x3c2, %r14
	.word 0xf0f38400  ! 2413: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_2_193:
	setx	0x31010a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_108:
	mov	0x21, %r14
	.word 0xf8f38e40  ! 2416: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_2_194:
	setx	0x30000b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_107:
	mov	0x3c8, %r14
	.word 0xf8db89e0  ! 2418: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T2_asi_reg_rd_108:
	mov	0x3c4, %r14
	.word 0xf8db8e60  ! 2419: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_2_176:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_176), 16, 16)) -> intp(2, 0, a)
cpu_intr_2_195:
	setx	0x300333, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf0d4e03f  ! 2427: LDSHA_I	ldsha	[%r19, + 0x003f] %asi, %r24
	.word 0xf884e181  ! 2428: LDUWA_I	lduwa	[%r19, + 0x0181] %asi, %r28
T2_asi_reg_rd_109:
	mov	0x3c5, %r14
	.word 0xf4db84a0  ! 2429: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf80ce1ec  ! 2432: LDUB_I	ldub	[%r19 + 0x01ec], %r28
	.word 0xf494618c  ! 2433: LDUHA_I	lduha	[%r17, + 0x018c] %asi, %r26
	.word 0xf0442173  ! 2434: LDSW_I	ldsw	[%r16 + 0x0173], %r24
iob_intr_2_177:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_177), 16, 16)) -> intp(2, 0, 8)
T2_asi_reg_wr_109:
	mov	0x15, %r14
	.word 0xfcf38e40  ! 2438: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf0dd21c1  ! 2441: LDXA_I	ldxa	[%r20, + 0x01c1] %asi, %r24
iob_intr_2_178:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_178), 16, 16)) -> intp(2, 0, 2e)
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982b42  ! 2449: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b42, %hpstate
	.word 0xf2456167  ! 2450: LDSW_I	ldsw	[%r21 + 0x0167], %r25
T2_asi_reg_wr_110:
	mov	0x7, %r14
	.word 0xf6f38e40  ! 2456: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_2_196:
	setx	0x320018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc354000  ! 2459: ORN_R	orn 	%r21, %r0, %r30
	.word 0xf094c020  ! 2462: LDUHA_R	lduha	[%r19, %r0] 0x01, %r24
iob_intr_2_179:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_179), 16, 16)) -> intp(2, 0, 1b)
T2_asi_reg_wr_111:
	mov	0x3c0, %r14
	.word 0xf2f38400  ! 2466: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_2_197:
	setx	0x330029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_180:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_180), 16, 16)) -> intp(2, 0, 16)
	.word 0xfc0460f1  ! 2474: LDUW_I	lduw	[%r17 + 0x00f1], %r30
	.word 0xf85ce0d4  ! 2475: LDX_I	ldx	[%r19 + 0x00d4], %r28
iob_intr_2_181:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_181), 16, 16)) -> intp(2, 0, 10)
iob_intr_2_182:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_182), 16, 16)) -> intp(2, 0, 8)
cpu_intr_2_198:
	setx	0x300103, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_110:
	mov	0x4, %r14
	.word 0xfedb89e0  ! 2484: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_2_199:
	setx	0x330128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf00d8000  ! 2488: LDUB_R	ldub	[%r22 + %r0], %r24
	.word 0xf2058000  ! 2489: LDUW_R	lduw	[%r22 + %r0], %r25
iob_intr_2_183:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_183), 16, 16)) -> intp(2, 0, d)
	.word 0xfa0c0000  ! 2492: LDUB_R	ldub	[%r16 + %r0], %r29
	.word 0xfa442028  ! 2493: LDSW_I	ldsw	[%r16 + 0x0028], %r29
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982dd0  ! 2494: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd0, %hpstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_184:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_184), 16, 16)) -> intp(2, 0, e)
	.word 0xfe0d6157  ! 2502: LDUB_I	ldub	[%r21 + 0x0157], %r31
	.word 0xf6ccc020  ! 2503: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r27
	.word 0xf2dca181  ! 2506: LDXA_I	ldxa	[%r18, + 0x0181] %asi, %r25
iob_intr_2_185:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_185), 16, 16)) -> intp(2, 0, 6)
cpu_intr_2_200:
	setx	0x310036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6146123  ! 2509: LDUH_I	lduh	[%r17 + 0x0123], %r27
	.word 0xfc048000  ! 2510: LDUW_R	lduw	[%r18 + %r0], %r30
cpu_intr_2_201:
	setx	0x320226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb095c000  ! 2514: ORcc_R	orcc 	%r23, %r0, %r24
	ta	T_CHANGE_HPRIV
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982c18  ! 2518: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c18, %hpstate
iob_intr_2_186:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_186), 16, 16)) -> intp(2, 0, c)
	.word 0xf60c6185  ! 2521: LDUB_I	ldub	[%r17 + 0x0185], %r27
	.word 0xfc948020  ! 2522: LDUHA_R	lduha	[%r18, %r0] 0x01, %r30
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983a90  ! 2523: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a90, %hpstate
	ta	T_CHANGE_TO_TL0
	.word 0xf2d5e0d8  ! 2529: LDSHA_I	ldsha	[%r23, + 0x00d8] %asi, %r25
	.word 0xfe446009  ! 2533: LDSW_I	ldsw	[%r17 + 0x0009], %r31
	.word 0xfc0d20ea  ! 2534: LDUB_I	ldub	[%r20 + 0x00ea], %r30
cpu_intr_2_202:
	setx	0x320225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6cdc020  ! 2537: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r27
	.word 0xfe458000  ! 2538: LDSW_R	ldsw	[%r22 + %r0], %r31
iob_intr_2_187:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_187), 16, 16)) -> intp(2, 0, 29)
	.word 0xbd7c0400  ! 2540: MOVR_R	movre	%r16, %r0, %r30
	.word 0xf895a034  ! 2544: LDUHA_I	lduha	[%r22, + 0x0034] %asi, %r28
T2_asi_reg_wr_112:
	mov	0x1e, %r14
	.word 0xf4f38e40  ! 2545: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_wr_113:
	mov	0x14, %r14
	.word 0xf2f389e0  ! 2546: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_2_203:
	setx	0x33010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_114:
	mov	0x36, %r14
	.word 0xf6f389e0  ! 2548: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_115:
	mov	0x1a, %r14
	.word 0xfaf38e60  ! 2552: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T2_asi_reg_wr_116:
	mov	0x20, %r14
	.word 0xfaf389e0  ! 2553: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb6146037  ! 2555: OR_I	or 	%r17, 0x0037, %r27
	.word 0xf04d8000  ! 2557: LDSB_R	ldsb	[%r22 + %r0], %r24
	ta	T_CHANGE_TO_TL0
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983cc0  ! 2561: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc0, %hpstate
	.word 0xfc052183  ! 2565: LDUW_I	lduw	[%r20 + 0x0183], %r30
	.word 0xf6452162  ! 2566: LDSW_I	ldsw	[%r20 + 0x0162], %r27
	.word 0xb9352001  ! 2569: SRL_I	srl 	%r20, 0x0001, %r28
iob_intr_2_188:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_188), 16, 16)) -> intp(2, 0, 29)
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983a90  ! 2573: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a90, %hpstate
iob_intr_2_189:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_189), 16, 16)) -> intp(2, 0, 21)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa4d8000  ! 2576: LDSB_R	ldsb	[%r22 + %r0], %r29
cpu_intr_2_204:
	setx	0x31021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_190:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_190), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf88ca0c9  ! 2587: LDUBA_I	lduba	[%r18, + 0x00c9] %asi, %r28
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_111:
	mov	0xe, %r14
	.word 0xf6db8400  ! 2594: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T2_asi_reg_wr_117:
	mov	0x3c3, %r14
	.word 0xf8f384a0  ! 2595: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xfa4ca160  ! 2597: LDSB_I	ldsb	[%r18 + 0x0160], %r29
iob_intr_2_191:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_191), 16, 16)) -> intp(2, 0, 20)
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983ed0  ! 2601: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ed0, %hpstate
iob_intr_2_192:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_192), 16, 16)) -> intp(2, 0, 37)
	.word 0xb09c4000  ! 2606: XORcc_R	xorcc 	%r17, %r0, %r24
T2_asi_reg_rd_112:
	mov	0x3c7, %r14
	.word 0xf0db8e40  ! 2608: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T2_asi_reg_rd_113:
	mov	0x3c3, %r14
	.word 0xf8db8400  ! 2609: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbab40000  ! 2610: SUBCcc_R	orncc 	%r16, %r0, %r29
	.word 0xf6442159  ! 2612: LDSW_I	ldsw	[%r16 + 0x0159], %r27
	.word 0xf4c4c020  ! 2613: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r26
cpu_intr_2_205:
	setx	0x31031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2558000  ! 2617: LDSH_R	ldsh	[%r22 + %r0], %r25
cpu_intr_2_206:
	setx	0x300028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x83946107  ! 2619: WRPR_TNPC_I	wrpr	%r17, 0x0107, %tnpc
	.word 0xf0956005  ! 2620: LDUHA_I	lduha	[%r21, + 0x0005] %asi, %r24
	.word 0xf2cc21d7  ! 2621: LDSBA_I	ldsba	[%r16, + 0x01d7] %asi, %r25
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982c12  ! 2622: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c12, %hpstate
	.word 0xb48da1b8  ! 2623: ANDcc_I	andcc 	%r22, 0x01b8, %r26
	.word 0xbe35c000  ! 2627: ORN_R	orn 	%r23, %r0, %r31
iob_intr_2_193:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_193), 16, 16)) -> intp(2, 0, 33)
iob_intr_2_194:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_194), 16, 16)) -> intp(2, 0, 3c)
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982810  ! 2631: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0810, %hpstate
	.word 0xf4c44020  ! 2632: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r26
T2_asi_reg_rd_114:
	mov	0x1c, %r14
	.word 0xfadb8400  ! 2633: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbebc4000  ! 2634: XNORcc_R	xnorcc 	%r17, %r0, %r31
T2_asi_reg_wr_118:
	mov	0x23, %r14
	.word 0xf4f384a0  ! 2635: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xba8ce01a  ! 2640: ANDcc_I	andcc 	%r19, 0x001a, %r29
	.word 0xfa45a0a3  ! 2641: LDSW_I	ldsw	[%r22 + 0x00a3], %r29
	.word 0xf6444000  ! 2642: LDSW_R	ldsw	[%r17 + %r0], %r27
	.word 0xfa5de0f9  ! 2643: LDX_I	ldx	[%r23 + 0x00f9], %r29
	.word 0xfc4d0000  ! 2644: LDSB_R	ldsb	[%r20 + %r0], %r30
	.word 0xf2d4e078  ! 2645: LDSHA_I	ldsha	[%r19, + 0x0078] %asi, %r25
	.word 0xb3342001  ! 2648: SRL_I	srl 	%r16, 0x0001, %r25
iob_intr_2_195:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_195), 16, 16)) -> intp(2, 0, 23)
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_119:
	mov	0x8, %r14
	.word 0xf0f389e0  ! 2657: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_2_196:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_196), 16, 16)) -> intp(2, 0, 1b)
iob_intr_2_197:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_197), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_wr_120:
	mov	0x2a, %r14
	.word 0xf4f38e40  ! 2663: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf00d2092  ! 2664: LDUB_I	ldub	[%r20 + 0x0092], %r24
	.word 0xb6bd2031  ! 2665: XNORcc_I	xnorcc 	%r20, 0x0031, %r27
T2_asi_reg_wr_121:
	mov	0x3c3, %r14
	.word 0xf0f38e40  ! 2667: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_2_198:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_198), 16, 16)) -> intp(2, 0, d)
T2_asi_reg_rd_115:
	mov	0x34, %r14
	.word 0xfadb8e60  ! 2672: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982f98  ! 2674: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f98, %hpstate
	.word 0xfc85a092  ! 2675: LDUWA_I	lduwa	[%r22, + 0x0092] %asi, %r30
iob_intr_2_199:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_199), 16, 16)) -> intp(2, 0, 19)
iob_intr_2_200:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_200), 16, 16)) -> intp(2, 0, b)
	.word 0xf014c000  ! 2681: LDUH_R	lduh	[%r19 + %r0], %r24
	.word 0xf45420b5  ! 2682: LDSH_I	ldsh	[%r16 + 0x00b5], %r26
	.word 0xbc2c6118  ! 2684: ANDN_I	andn 	%r17, 0x0118, %r30
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_207:
	setx	0x31030c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_201:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_201), 16, 16)) -> intp(2, 0, 21)
cpu_intr_2_208:
	setx	0x30013c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_122:
	mov	0x3c6, %r14
	.word 0xf2f38e60  ! 2702: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf2040000  ! 2704: LDUW_R	lduw	[%r16 + %r0], %r25
iob_intr_2_202:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_202), 16, 16)) -> intp(2, 0, 16)
	.word 0xf2548000  ! 2706: LDSH_R	ldsh	[%r18 + %r0], %r25
	.word 0xf084a006  ! 2708: LDUWA_I	lduwa	[%r18, + 0x0006] %asi, %r24
	.word 0xbf349000  ! 2710: SRLX_R	srlx	%r18, %r0, %r31
	.word 0xf44cc000  ! 2714: LDSB_R	ldsb	[%r19 + %r0], %r26
iob_intr_2_203:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_203), 16, 16)) -> intp(2, 0, 17)
	.word 0xb804209d  ! 2720: ADD_I	add 	%r16, 0x009d, %r28
T2_asi_reg_wr_123:
	mov	0x30, %r14
	.word 0xf0f389e0  ! 2723: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xba0c4000  ! 2727: AND_R	and 	%r17, %r0, %r29
cpu_intr_2_209:
	setx	0x330036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb62d21e8  ! 2729: ANDN_I	andn 	%r20, 0x01e8, %r27
	.word 0xfe05213a  ! 2730: LDUW_I	lduw	[%r20 + 0x013a], %r31
	.word 0xf245c000  ! 2731: LDSW_R	ldsw	[%r23 + %r0], %r25
	.word 0xbabd0000  ! 2732: XNORcc_R	xnorcc 	%r20, %r0, %r29
T2_asi_reg_wr_124:
	mov	0xe, %r14
	.word 0xf6f38e60  ! 2733: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T2_asi_reg_rd_116:
	mov	0x3c2, %r14
	.word 0xf8db89e0  ! 2734: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xfe440000  ! 2736: LDSW_R	ldsw	[%r16 + %r0], %r31
cpu_intr_2_210:
	setx	0x340310, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982e90  ! 2741: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e90, %hpstate
cpu_intr_2_211:
	setx	0x340018, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_117:
	mov	0x12, %r14
	.word 0xf6db8e40  ! 2743: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_2_204:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_204), 16, 16)) -> intp(2, 0, 14)
	.word 0xf08d4020  ! 2749: LDUBA_R	lduba	[%r21, %r0] 0x01, %r24
	.word 0xfa14e05e  ! 2755: LDUH_I	lduh	[%r19 + 0x005e], %r29
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x8198295a  ! 2757: WRHPR_HPSTATE_I	wrhpr	%r0, 0x095a, %hpstate
T2_asi_reg_rd_118:
	mov	0xf, %r14
	.word 0xfcdb8400  ! 2759: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb2948000  ! 2760: ORcc_R	orcc 	%r18, %r0, %r25
	.word 0xbd518000  ! 2765: RDPR_PSTATE	<illegal instruction>
T2_asi_reg_wr_125:
	mov	0x1e, %r14
	.word 0xf0f38e80  ! 2767: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf68da055  ! 2768: LDUBA_I	lduba	[%r22, + 0x0055] %asi, %r27
cpu_intr_2_212:
	setx	0x370033, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_126:
	mov	0x1d, %r14
	.word 0xf2f38e80  ! 2771: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_2_205:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_205), 16, 16)) -> intp(2, 0, 39)
	.word 0xf44c0000  ! 2773: LDSB_R	ldsb	[%r16 + %r0], %r26
T2_asi_reg_rd_119:
	mov	0x24, %r14
	.word 0xf6db8400  ! 2774: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_2_206:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_206), 16, 16)) -> intp(2, 0, 1e)
cpu_intr_2_213:
	setx	0x201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_207:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_207), 16, 16)) -> intp(2, 0, 10)
cpu_intr_2_214:
	setx	0x34003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe34618d  ! 2790: SUBC_I	orn 	%r17, 0x018d, %r31
	.word 0xfe544000  ! 2793: LDSH_R	ldsh	[%r17 + %r0], %r31
cpu_intr_2_215:
	setx	0x36033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_127:
	mov	0x30, %r14
	.word 0xf0f384a0  ! 2796: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xfa5c8000  ! 2800: LDX_R	ldx	[%r18 + %r0], %r29
cpu_intr_2_216:
	setx	0x360137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf244c000  ! 2805: LDSW_R	ldsw	[%r19 + %r0], %r25
	.word 0xbe04e036  ! 2807: ADD_I	add 	%r19, 0x0036, %r31
cpu_intr_2_217:
	setx	0x35011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xfe5da1b7  ! 2811: LDX_I	ldx	[%r22 + 0x01b7], %r31
iob_intr_2_208:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_208), 16, 16)) -> intp(2, 0, 15)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_209:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_209), 16, 16)) -> intp(2, 0, 11)
	.word 0xb235201a  ! 2820: SUBC_I	orn 	%r20, 0x001a, %r25
iob_intr_2_210:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_210), 16, 16)) -> intp(2, 0, 11)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_128:
	mov	0x3c0, %r14
	.word 0xfaf38e40  ! 2827: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfe8ce1df  ! 2828: LDUBA_I	lduba	[%r19, + 0x01df] %asi, %r31
iob_intr_2_211:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_211), 16, 16)) -> intp(2, 0, 7)
	.word 0xb0b5e0e6  ! 2831: SUBCcc_I	orncc 	%r23, 0x00e6, %r24
	.word 0xfec5e12b  ! 2832: LDSWA_I	ldswa	[%r23, + 0x012b] %asi, %r31
cpu_intr_2_218:
	setx	0x360217, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0xfecd8020  ! 2838: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r31
T2_asi_reg_rd_120:
	mov	0x1b, %r14
	.word 0xfcdb8e40  ! 2840: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf4044000  ! 2843: LDUW_R	lduw	[%r17 + %r0], %r26
	.word 0xfa4c8000  ! 2846: LDSB_R	ldsb	[%r18 + %r0], %r29
iob_intr_2_212:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_212), 16, 16)) -> intp(2, 0, 3d)
T2_asi_reg_rd_121:
	mov	0x3c7, %r14
	.word 0xf2db89e0  ! 2851: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T2_asi_reg_wr_129:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 2856: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_213:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_213), 16, 16)) -> intp(2, 0, 6)
iob_intr_2_214:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_214), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf60d618c  ! 2862: LDUB_I	ldub	[%r21 + 0x018c], %r27
	.word 0x8594e11b  ! 2863: WRPR_TSTATE_I	wrpr	%r19, 0x011b, %tstate
T2_asi_reg_rd_122:
	mov	0x3c6, %r14
	.word 0xf8db8400  ! 2865: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb8342127  ! 2867: ORN_I	orn 	%r16, 0x0127, %r28
cpu_intr_2_219:
	setx	0x360226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7643801  ! 2869: MOVcc_I	<illegal instruction>
	.word 0xfc448000  ! 2870: LDSW_R	ldsw	[%r18 + %r0], %r30
	.word 0xbcade0ae  ! 2873: ANDNcc_I	andncc 	%r23, 0x00ae, %r30
	.word 0xf414c000  ! 2874: LDUH_R	lduh	[%r19 + %r0], %r26
T2_asi_reg_rd_123:
	mov	0x25, %r14
	.word 0xf4db89e0  ! 2878: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	setx	data_start_1, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983990  ! 2879: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1990, %hpstate
T2_asi_reg_wr_130:
	mov	0x6, %r14
	.word 0xf4f38e40  ! 2887: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf2d5a1fa  ! 2890: LDSHA_I	ldsha	[%r22, + 0x01fa] %asi, %r25
cpu_intr_2_220:
	setx	0x34002a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_215:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_215), 16, 16)) -> intp(2, 0, 2)
	.word 0xf0552132  ! 2895: LDSH_I	ldsh	[%r20 + 0x0132], %r24
T2_asi_reg_wr_131:
	mov	0x12, %r14
	.word 0xfcf38e60  ! 2896: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_132:
	mov	0x34, %r14
	.word 0xfcf38e40  ! 2899: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_2_216:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_216), 16, 16)) -> intp(2, 0, 5)
	.word 0xf4146079  ! 2904: LDUH_I	lduh	[%r17 + 0x0079], %r26
	.word 0xf2d5e130  ! 2905: LDSHA_I	ldsha	[%r23, + 0x0130] %asi, %r25
T2_asi_reg_rd_124:
	mov	0x2a, %r14
	.word 0xf2db8e40  ! 2907: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_2_221:
	setx	0x36020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x819520a4  ! 2909: WRPR_TPC_I	wrpr	%r20, 0x00a4, %tpc
	.word 0xf2458000  ! 2911: LDSW_R	ldsw	[%r22 + %r0], %r25
T2_asi_reg_wr_133:
	mov	0x3c8, %r14
	.word 0xfcf389e0  ! 2912: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T2_asi_reg_rd_125:
	mov	0x1a, %r14
	.word 0xfadb8e60  ! 2914: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	ta	T_CHANGE_NONHPRIV
	.word 0xfa0da178  ! 2919: LDUB_I	ldub	[%r22 + 0x0178], %r29
	.word 0xfcc40020  ! 2920: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r30
	.word 0xb23d8000  ! 2923: XNOR_R	xnor 	%r22, %r0, %r25
	.word 0xbb2c2001  ! 2924: SLL_I	sll 	%r16, 0x0001, %r29
	.word 0xb52ca001  ! 2925: SLL_I	sll 	%r18, 0x0001, %r26
cpu_intr_2_222:
	setx	0x370300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc9c0000  ! 2930: XORcc_R	xorcc 	%r16, %r0, %r30
cpu_intr_2_223:
	setx	0x340129, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_217:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_217), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf245e03b  ! 2933: LDSW_I	ldsw	[%r23 + 0x003b], %r25
	.word 0xfc4cc000  ! 2935: LDSB_R	ldsb	[%r19 + %r0], %r30
T2_asi_reg_wr_134:
	mov	0x2, %r14
	.word 0xf2f38e80  ! 2939: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_2_224:
	setx	0x360119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_225:
	setx	0x360109, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_226:
	setx	0x34010d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_126:
	mov	0x10, %r14
	.word 0xf6db8e60  ! 2946: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xfed5a0c5  ! 2947: LDSHA_I	ldsha	[%r22, + 0x00c5] %asi, %r31
	.word 0xfa4c20f9  ! 2950: LDSB_I	ldsb	[%r16 + 0x00f9], %r29
iob_intr_2_218:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_218), 16, 16)) -> intp(2, 0, 11)
cpu_intr_2_227:
	setx	0x36011e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_228:
	setx	0x370237, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_127:
	mov	0x3c4, %r14
	.word 0xf0db89e0  ! 2956: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T2_asi_reg_wr_135:
	mov	0xa, %r14
	.word 0xf6f38e80  ! 2958: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_2_219:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_219), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_rd_128:
	mov	0x30, %r14
	.word 0xfedb8e60  ! 2961: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xfc0d4000  ! 2963: LDUB_R	ldub	[%r21 + %r0], %r30
	.word 0xfa5c4000  ! 2967: LDX_R	ldx	[%r17 + %r0], %r29
iob_intr_2_220:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_220), 16, 16)) -> intp(2, 0, 2f)
T2_asi_reg_wr_136:
	mov	0x3c7, %r14
	.word 0xfcf384a0  ! 2969: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfa5d2130  ! 2970: LDX_I	ldx	[%r20 + 0x0130], %r29
T2_asi_reg_wr_137:
	mov	0x3c6, %r14
	.word 0xfcf389e0  ! 2972: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T2_asi_reg_rd_129:
	mov	0x16, %r14
	.word 0xf8db84a0  ! 2973: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	ta	T_CHANGE_TO_TL1
	.word 0xf00c4000  ! 2975: LDUB_R	ldub	[%r17 + %r0], %r24
iob_intr_2_221:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_221), 16, 16)) -> intp(2, 0, f)
	.word 0xb81c4000  ! 2978: XOR_R	xor 	%r17, %r0, %r28
	.word 0xf415c000  ! 2981: LDUH_R	lduh	[%r23 + %r0], %r26
T2_asi_reg_wr_138:
	mov	0x1c, %r14
	.word 0xf8f38e40  ! 2982: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfe05a081  ! 2983: LDUW_I	lduw	[%r22 + 0x0081], %r31
T2_asi_reg_wr_139:
	mov	0x12, %r14
	.word 0xf6f38e40  ! 2984: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfa54a038  ! 2987: LDSH_I	ldsh	[%r18 + 0x0038], %r29
	.word 0xb551c000  ! 2988: RDPR_TL	rdpr	%tl, %r26
cpu_intr_2_229:
	setx	0x34003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
iob_intr_2_222:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_222), 16, 16)) -> intp(2, 0, 11)
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983b1a  ! 2998: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b1a, %hpstate
T2_asi_reg_rd_130:
	mov	0x27, %r14
	.word 0xfcdb8e80  ! 3001: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbe0ca10c  ! 3002: AND_I	and 	%r18, 0x010c, %r31
	.word 0xf64c0000  ! 3003: LDSB_R	ldsb	[%r16 + %r0], %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xba0dc000  ! 3005: AND_R	and 	%r23, %r0, %r29
	.word 0xfa540000  ! 3009: LDSH_R	ldsh	[%r16 + %r0], %r29
	.word 0x8594a060  ! 3010: WRPR_TSTATE_I	wrpr	%r18, 0x0060, %tstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3641800  ! 3016: MOVcc_R	<illegal instruction>
	.word 0xf0058000  ! 3017: LDUW_R	lduw	[%r22 + %r0], %r24
	.word 0xf2d4e103  ! 3018: LDSHA_I	ldsha	[%r19, + 0x0103] %asi, %r25
iob_intr_2_223:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_223), 16, 16)) -> intp(2, 0, 3a)
	.word 0xf014a15a  ! 3026: LDUH_I	lduh	[%r18 + 0x015a], %r24
T2_asi_reg_rd_131:
	mov	0x3c3, %r14
	.word 0xf4db8e40  ! 3027: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_2_224:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_224), 16, 16)) -> intp(2, 0, 29)
	.word 0xba0d8000  ! 3031: AND_R	and 	%r22, %r0, %r29
	.word 0xf4c40020  ! 3035: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r26
iob_intr_2_225:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_225), 16, 16)) -> intp(2, 0, 9)
	.word 0xbcb4c000  ! 3038: ORNcc_R	orncc 	%r19, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_226:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_226), 16, 16)) -> intp(2, 0, 3)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe040000  ! 3044: LDUW_R	lduw	[%r16 + %r0], %r31
	.word 0xf28d60e3  ! 3046: LDUBA_I	lduba	[%r21, + 0x00e3] %asi, %r25
T2_asi_reg_rd_132:
	mov	0x3, %r14
	.word 0xf0db8e40  ! 3047: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbf480000  ! 3048: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
T2_asi_reg_rd_133:
	mov	0x3c7, %r14
	.word 0xf4db8e80  ! 3049: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_2_230:
	setx	0x34020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983ec0  ! 3052: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec0, %hpstate
T2_asi_reg_wr_140:
	mov	0x3c8, %r14
	.word 0xf8f38400  ! 3053: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf00dc000  ! 3056: LDUB_R	ldub	[%r23 + %r0], %r24
	.word 0xbc95c000  ! 3058: ORcc_R	orcc 	%r23, %r0, %r30
cpu_intr_2_231:
	setx	0x37000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb22d6046  ! 3063: ANDN_I	andn 	%r21, 0x0046, %r25
iob_intr_2_227:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_227), 16, 16)) -> intp(2, 0, 2)
	.word 0xf6842108  ! 3072: LDUWA_I	lduwa	[%r16, + 0x0108] %asi, %r27
iob_intr_2_228:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_228), 16, 16)) -> intp(2, 0, 29)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_TO_TL1
	.word 0xf404a07c  ! 3080: LDUW_I	lduw	[%r18 + 0x007c], %r26
cpu_intr_2_232:
	setx	0x360220, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_2_229:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_229), 16, 16)) -> intp(2, 0, d)
T2_asi_reg_rd_134:
	mov	0x1c, %r14
	.word 0xfcdb89e0  ! 3085: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_2_233:
	setx	0x360130, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_141:
	mov	0x3c5, %r14
	.word 0xf2f38e80  ! 3088: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf21521f7  ! 3089: LDUH_I	lduh	[%r20 + 0x01f7], %r25
	.word 0xf2d420d8  ! 3090: LDSHA_I	ldsha	[%r16, + 0x00d8] %asi, %r25
T2_asi_reg_rd_135:
	mov	0x3c8, %r14
	.word 0xf4db8e80  ! 3093: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xfe5c2190  ! 3095: LDX_I	ldx	[%r16 + 0x0190], %r31
	.word 0xb22dc000  ! 3096: ANDN_R	andn 	%r23, %r0, %r25
T2_asi_reg_rd_136:
	mov	0x3c8, %r14
	.word 0xf0db84a0  ! 3097: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf014a132  ! 3100: LDUH_I	lduh	[%r18 + 0x0132], %r24
T2_asi_reg_rd_137:
	mov	0x35, %r14
	.word 0xf2db8400  ! 3106: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_2_230:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_230), 16, 16)) -> intp(2, 0, b)
iob_intr_2_231:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_231), 16, 16)) -> intp(2, 0, 12)
T2_asi_reg_rd_138:
	mov	0x1, %r14
	.word 0xf8db8e80  ! 3111: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_232:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_232), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_234:
	setx	0x350220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04c61ea  ! 3127: LDSB_I	ldsb	[%r17 + 0x01ea], %r24
cpu_intr_2_235:
	setx	0x340122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf285612c  ! 3133: LDUWA_I	lduwa	[%r21, + 0x012c] %asi, %r25
iob_intr_2_233:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_233), 16, 16)) -> intp(2, 0, 8)
iob_intr_2_234:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_234), 16, 16)) -> intp(2, 0, 3a)
iob_intr_2_235:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_235), 16, 16)) -> intp(2, 0, 10)
iob_intr_2_236:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_236), 16, 16)) -> intp(2, 0, 3e)
	.word 0xfc5d61dd  ! 3138: LDX_I	ldx	[%r21 + 0x01dd], %r30
	.word 0xfcd5a063  ! 3140: LDSHA_I	ldsha	[%r22, + 0x0063] %asi, %r30
cpu_intr_2_236:
	setx	0x340110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfad54020  ! 3146: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r29
	.word 0xfc858020  ! 3147: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r30
	.word 0xfe050000  ! 3151: LDUW_R	lduw	[%r20 + %r0], %r31
iob_intr_2_237:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_237), 16, 16)) -> intp(2, 0, 5)
cpu_intr_2_237:
	setx	0x340103, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_238:
	setx	0x350228, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_139:
	mov	0x3c7, %r14
	.word 0xf6db8e80  ! 3156: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_2_238:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_238), 16, 16)) -> intp(2, 0, 3e)
	.word 0xb7643801  ! 3158: MOVcc_I	<illegal instruction>
	.word 0xb0bce150  ! 3159: XNORcc_I	xnorcc 	%r19, 0x0150, %r24
	.word 0xb92c5000  ! 3165: SLLX_R	sllx	%r17, %r0, %r28
	.word 0xf28c2118  ! 3166: LDUBA_I	lduba	[%r16, + 0x0118] %asi, %r25
	.word 0xf0450000  ! 3167: LDSW_R	ldsw	[%r20 + %r0], %r24
	.word 0xb68c604d  ! 3168: ANDcc_I	andcc 	%r17, 0x004d, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_wr_142:
	mov	0x3c2, %r14
	.word 0xf0f38e60  ! 3172: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	ta	T_CHANGE_TO_TL1
	.word 0xfec4c020  ! 3177: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r31
cpu_intr_2_239:
	setx	0x360119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8cc0020  ! 3180: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r28
	.word 0xfe55c000  ! 3181: LDSH_R	ldsh	[%r23 + %r0], %r31
iob_intr_2_239:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_239), 16, 16)) -> intp(2, 0, 28)
	.word 0xfe55c000  ! 3185: LDSH_R	ldsh	[%r23 + %r0], %r31
cpu_intr_2_240:
	setx	0x370325, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_140:
	mov	0x3c5, %r14
	.word 0xfcdb8e80  ! 3188: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_2_241:
	setx	0x340227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf414a1a6  ! 3194: LDUH_I	lduh	[%r18 + 0x01a6], %r26
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983e08  ! 3195: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e08, %hpstate
	.word 0x859420e1  ! 3196: WRPR_TSTATE_I	wrpr	%r16, 0x00e1, %tstate
	.word 0xfc8c8020  ! 3197: LDUBA_R	lduba	[%r18, %r0] 0x01, %r30
T2_asi_reg_wr_143:
	mov	0x3c4, %r14
	.word 0xfaf38e40  ! 3200: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982b0a  ! 3201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0a, %hpstate
cpu_intr_2_242:
	setx	0x390137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0de070  ! 3203: LDUB_I	ldub	[%r23 + 0x0070], %r31
	.word 0xfedda118  ! 3204: LDXA_I	ldxa	[%r22, + 0x0118] %asi, %r31
iob_intr_2_240:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_240), 16, 16)) -> intp(2, 0, 2c)
	.word 0xb0444000  ! 3207: ADDC_R	addc 	%r17, %r0, %r24
	.word 0xfa5c4000  ! 3209: LDX_R	ldx	[%r17 + %r0], %r29
	.word 0xbf3d0000  ! 3210: SRA_R	sra 	%r20, %r0, %r31
T2_asi_reg_rd_141:
	mov	0x27, %r14
	.word 0xf6db8e80  ! 3211: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf00ce13b  ! 3213: LDUB_I	ldub	[%r19 + 0x013b], %r24
	.word 0xf2cc0020  ! 3217: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r25
iob_intr_2_241:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_241), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf685a149  ! 3225: LDUWA_I	lduwa	[%r22, + 0x0149] %asi, %r27
	.word 0xf44ca081  ! 3228: LDSB_I	ldsb	[%r18 + 0x0081], %r26
iob_intr_2_242:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_242), 16, 16)) -> intp(2, 0, b)
T2_asi_reg_rd_142:
	mov	0xe, %r14
	.word 0xf0db8e40  ! 3231: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T2_asi_reg_rd_143:
	mov	0x30, %r14
	.word 0xfedb84a0  ! 3233: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa15c000  ! 3240: LDUH_R	lduh	[%r23 + %r0], %r29
	.word 0xfa15c000  ! 3241: LDUH_R	lduh	[%r23 + %r0], %r29
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_144:
	mov	0xc, %r14
	.word 0xf4db8e60  ! 3250: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xfad461e1  ! 3251: LDSHA_I	ldsha	[%r17, + 0x01e1] %asi, %r29
	.word 0xbf347001  ! 3253: SRLX_I	srlx	%r17, 0x0001, %r31
T2_asi_reg_rd_145:
	mov	0x3c7, %r14
	.word 0xf8db89e0  ! 3254: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T2_asi_reg_wr_144:
	mov	0x2a, %r14
	.word 0xfcf384a0  ! 3256: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfcdce1fe  ! 3258: LDXA_I	ldxa	[%r19, + 0x01fe] %asi, %r30
	.word 0xf6956169  ! 3263: LDUHA_I	lduha	[%r21, + 0x0169] %asi, %r27
cpu_intr_2_243:
	setx	0x3b0017, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_145:
	mov	0x3c5, %r14
	.word 0xf8f38e80  ! 3267: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_2_243:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_243), 16, 16)) -> intp(2, 0, 2b)
	ta	T_CHANGE_TO_TL1
iob_intr_2_244:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_244), 16, 16)) -> intp(2, 0, 2e)
	.word 0xb32d3001  ! 3275: SLLX_I	sllx	%r20, 0x0001, %r25
	ta	T_CHANGE_TO_TL1
cpu_intr_2_244:
	setx	0x3a0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0a54000  ! 3281: SUBcc_R	subcc 	%r21, %r0, %r24
iob_intr_2_245:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_245), 16, 16)) -> intp(2, 0, 19)
	.word 0xb69ce15b  ! 3283: XORcc_I	xorcc 	%r19, 0x015b, %r27
	.word 0xf094c020  ! 3284: LDUHA_R	lduha	[%r19, %r0] 0x01, %r24
iob_intr_2_246:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_246), 16, 16)) -> intp(2, 0, 16)
T2_asi_reg_rd_146:
	mov	0x1d, %r14
	.word 0xfadb89e0  ! 3286: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_2_245:
	setx	0x39030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05c6002  ! 3290: LDX_I	ldx	[%r17 + 0x0002], %r24
T2_asi_reg_wr_146:
	mov	0x3c1, %r14
	.word 0xf6f38e80  ! 3291: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL1
	.word 0xf00d202e  ! 3294: LDUB_I	ldub	[%r20 + 0x002e], %r24
iob_intr_2_247:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_247), 16, 16)) -> intp(2, 0, c)
	.word 0xf8cd207e  ! 3300: LDSBA_I	ldsba	[%r20, + 0x007e] %asi, %r28
	.word 0xf8140000  ! 3304: LDUH_R	lduh	[%r16 + %r0], %r28
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_147:
	mov	0xe, %r14
	.word 0xf8f38400  ! 3306: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_2_246:
	setx	0x3a0028, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_247:
	setx	0x380005, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_148:
	mov	0x3c5, %r14
	.word 0xf8f38e40  ! 3322: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_248:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_248), 16, 16)) -> intp(2, 0, 8)
	.word 0xf48d0020  ! 3324: LDUBA_R	lduba	[%r20, %r0] 0x01, %r26
cpu_intr_2_248:
	setx	0x3b0327, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_249:
	setx	0x39022a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_149:
	mov	0x3c8, %r14
	.word 0xf4f38400  ! 3329: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T2_asi_reg_rd_147:
	mov	0x3c2, %r14
	.word 0xf6db8e40  ! 3332: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_2_249:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_249), 16, 16)) -> intp(2, 0, 25)
	.word 0xf84de192  ! 3335: LDSB_I	ldsb	[%r23 + 0x0192], %r28
	.word 0xfe0d8000  ! 3337: LDUB_R	ldub	[%r22 + %r0], %r31
	.word 0xbea4e092  ! 3338: SUBcc_I	subcc 	%r19, 0x0092, %r31
	.word 0xb7500000  ! 3339: RDPR_TPC	<illegal instruction>
T2_asi_reg_wr_150:
	mov	0x3c4, %r14
	.word 0xf2f384a0  ! 3341: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf8840020  ! 3342: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r28
	.word 0xfe140000  ! 3343: LDUH_R	lduh	[%r16 + %r0], %r31
iob_intr_2_250:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_250), 16, 16)) -> intp(2, 0, 26)
	.word 0xfc5d4000  ! 3346: LDX_R	ldx	[%r21 + %r0], %r30
	.word 0xf2c48020  ! 3347: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r25
	.word 0xfecca163  ! 3352: LDSBA_I	ldsba	[%r18, + 0x0163] %asi, %r31
	.word 0xfccde1a0  ! 3354: LDSBA_I	ldsba	[%r23, + 0x01a0] %asi, %r30
cpu_intr_2_250:
	setx	0x10131, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_151:
	mov	0x37, %r14
	.word 0xfaf389e0  ! 3357: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb151c000  ! 3360: RDPR_TL	rdpr	%tl, %r24
	.word 0xf24d20a8  ! 3361: LDSB_I	ldsb	[%r20 + 0x00a8], %r25
	.word 0xf2c4619d  ! 3364: LDSWA_I	ldswa	[%r17, + 0x019d] %asi, %r25
	.word 0xfe456042  ! 3365: LDSW_I	ldsw	[%r21 + 0x0042], %r31
	.word 0xb33c1000  ! 3367: SRAX_R	srax	%r16, %r0, %r25
	setx	data_start_1, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x819838ca  ! 3368: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18ca, %hpstate
cpu_intr_2_251:
	setx	0x380226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5341000  ! 3370: SRLX_R	srlx	%r16, %r0, %r26
	.word 0xf44d0000  ! 3372: LDSB_R	ldsb	[%r20 + %r0], %r26
T2_asi_reg_rd_148:
	mov	0x1f, %r14
	.word 0xfadb8e40  ! 3373: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb0840000  ! 3375: ADDcc_R	addcc 	%r16, %r0, %r24
iob_intr_2_251:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_251), 16, 16)) -> intp(2, 0, 7)
T2_asi_reg_wr_152:
	mov	0x28, %r14
	.word 0xf6f384a0  ! 3380: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xfec5200b  ! 3381: LDSWA_I	ldswa	[%r20, + 0x000b] %asi, %r31
	.word 0xf2cd8020  ! 3382: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r25
iob_intr_2_252:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_252), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_252:
	setx	0x390312, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_253:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_253), 16, 16)) -> intp(2, 0, 30)
	.word 0xf44d6154  ! 3392: LDSB_I	ldsb	[%r21 + 0x0154], %r26
	.word 0xb89dc000  ! 3394: XORcc_R	xorcc 	%r23, %r0, %r28
	.word 0xf0cc8020  ! 3396: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r24
T2_asi_reg_wr_153:
	mov	0x3c7, %r14
	.word 0xf0f38e60  ! 3397: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983880  ! 3398: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1880, %hpstate
T2_asi_reg_rd_149:
	mov	0xe, %r14
	.word 0xfadb8400  ! 3401: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf85c8000  ! 3402: LDX_R	ldx	[%r18 + %r0], %r28
cpu_intr_2_253:
	setx	0x3a032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2cc6125  ! 3405: LDSBA_I	ldsba	[%r17, + 0x0125] %asi, %r25
cpu_intr_2_254:
	setx	0x3a031d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_154:
	mov	0x3c5, %r14
	.word 0xfaf389e0  ! 3407: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_2_254:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_254), 16, 16)) -> intp(2, 0, 1b)
	.word 0xb68c600c  ! 3409: ANDcc_I	andcc 	%r17, 0x000c, %r27
T2_asi_reg_rd_150:
	mov	0x32, %r14
	.word 0xfcdb8e40  ! 3411: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfe4c4000  ! 3412: LDSB_R	ldsb	[%r17 + %r0], %r31
	.word 0xf8450000  ! 3413: LDSW_R	ldsw	[%r20 + %r0], %r28
	.word 0xf0dc2117  ! 3415: LDXA_I	ldxa	[%r16, + 0x0117] %asi, %r24
	.word 0xbaa5c000  ! 3416: SUBcc_R	subcc 	%r23, %r0, %r29
	.word 0xf8958020  ! 3417: LDUHA_R	lduha	[%r22, %r0] 0x01, %r28
	.word 0xf695a184  ! 3423: LDUHA_I	lduha	[%r22, + 0x0184] %asi, %r27
	ta	T_CHANGE_TO_TL1
	.word 0xbf7da401  ! 3426: MOVR_I	movre	%r22, 0x1, %r31
iob_intr_2_255:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_255), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf6d40020  ! 3429: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r27
T2_asi_reg_wr_155:
	mov	0x1a, %r14
	.word 0xfcf38e40  ! 3433: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_rd_151:
	mov	0x3c3, %r14
	.word 0xfcdb8400  ! 3434: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_2_256:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_256), 16, 16)) -> intp(2, 0, 2e)
iob_intr_2_257:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_257), 16, 16)) -> intp(2, 0, 15)
T2_asi_reg_wr_156:
	mov	0x35, %r14
	.word 0xfcf38e80  ! 3441: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_2_258:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_258), 16, 16)) -> intp(2, 0, 3a)
iob_intr_2_259:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_259), 16, 16)) -> intp(2, 0, 1)
	.word 0xf8c54020  ! 3445: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r28
	.word 0xf8cca1d0  ! 3447: LDSBA_I	ldsba	[%r18, + 0x01d0] %asi, %r28
iob_intr_2_260:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_260), 16, 16)) -> intp(2, 0, 38)
	.word 0xf4954020  ! 3455: LDUHA_R	lduha	[%r21, %r0] 0x01, %r26
	ta	T_CHANGE_HPRIV
cpu_intr_2_255:
	setx	0x3b0026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb03c20bc  ! 3462: XNOR_I	xnor 	%r16, 0x00bc, %r24
	.word 0xfacd4020  ! 3463: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r29
	.word 0xf485c020  ! 3464: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r26
	.word 0xb7342001  ! 3468: SRL_I	srl 	%r16, 0x0001, %r27
	.word 0x919420f1  ! 3469: WRPR_PIL_I	wrpr	%r16, 0x00f1, %pil
	.word 0xbe9c201e  ! 3470: XORcc_I	xorcc 	%r16, 0x001e, %r31
cpu_intr_2_256:
	setx	0x3a0033, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983d8a  ! 3472: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d8a, %hpstate
	.word 0xf00d4000  ! 3473: LDUB_R	ldub	[%r21 + %r0], %r24
	.word 0xfc8cc020  ! 3474: LDUBA_R	lduba	[%r19, %r0] 0x01, %r30
iob_intr_2_261:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_261), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_257:
	setx	0x380314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfad48020  ! 3484: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r29
iob_intr_2_262:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_262), 16, 16)) -> intp(2, 0, 3b)
T2_asi_reg_rd_152:
	mov	0x25, %r14
	.word 0xf2db8400  ! 3488: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_2_263:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_263), 16, 16)) -> intp(2, 0, 38)
	ta	T_CHANGE_NONHPRIV
	.word 0xb414e1aa  ! 3492: OR_I	or 	%r19, 0x01aa, %r26
cpu_intr_2_258:
	setx	0x390101, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_157:
	mov	0x3c4, %r14
	.word 0xfcf38e40  ! 3494: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_wr_158:
	mov	0x25, %r14
	.word 0xf0f384a0  ! 3496: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_2_264:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_264), 16, 16)) -> intp(2, 0, 27)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_153:
	mov	0x2e, %r14
	.word 0xf4db8400  ! 3502: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T2_asi_reg_rd_154:
	mov	0xf, %r14
	.word 0xfcdb8e40  ! 3508: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfc044000  ! 3513: LDUW_R	lduw	[%r17 + %r0], %r30
iob_intr_2_265:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_265), 16, 16)) -> intp(2, 0, a)
	.word 0xf004a1eb  ! 3517: LDUW_I	lduw	[%r18 + 0x01eb], %r24
cpu_intr_2_259:
	setx	0x3a031a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_266:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_266), 16, 16)) -> intp(2, 0, 0)
	.word 0xf05cc000  ! 3522: LDX_R	ldx	[%r19 + %r0], %r24
	.word 0xa1902002  ! 3523: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xf25ce0df  ! 3528: LDX_I	ldx	[%r19 + 0x00df], %r25
T2_asi_reg_rd_155:
	mov	0x4, %r14
	.word 0xf2db84a0  ! 3531: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb88c20b4  ! 3533: ANDcc_I	andcc 	%r16, 0x00b4, %r28
	.word 0xb40560db  ! 3538: ADD_I	add 	%r21, 0x00db, %r26
	.word 0xf844a13a  ! 3540: LDSW_I	ldsw	[%r18 + 0x013a], %r28
	.word 0xfa5de0f2  ! 3544: LDX_I	ldx	[%r23 + 0x00f2], %r29
	.word 0xb8bce14e  ! 3546: XNORcc_I	xnorcc 	%r19, 0x014e, %r28
	.word 0xfa444000  ! 3548: LDSW_R	ldsw	[%r17 + %r0], %r29
iob_intr_2_267:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_267), 16, 16)) -> intp(2, 0, 3d)
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982ac0  ! 3556: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac0, %hpstate
T2_asi_reg_wr_159:
	mov	0x3c7, %r14
	.word 0xfef389e0  ! 3558: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T2_asi_reg_rd_156:
	mov	0x34, %r14
	.word 0xfedb8400  ! 3559: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_2_260:
	setx	0x3b0206, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_160:
	mov	0x3c6, %r14
	.word 0xfef389e0  ! 3561: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbe448000  ! 3563: ADDC_R	addc 	%r18, %r0, %r31
cpu_intr_2_261:
	setx	0x39023e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_268:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_268), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf094e0ee  ! 3568: LDUHA_I	lduha	[%r19, + 0x00ee] %asi, %r24
	.word 0xb40c8000  ! 3570: AND_R	and 	%r18, %r0, %r26
iob_intr_2_269:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_269), 16, 16)) -> intp(2, 0, 20)
T2_asi_reg_wr_161:
	mov	0x28, %r14
	.word 0xf8f389e0  ! 3573: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf6c5a1ad  ! 3574: LDSWA_I	ldswa	[%r22, + 0x01ad] %asi, %r27
	.word 0xfcd4e059  ! 3578: LDSHA_I	ldsha	[%r19, + 0x0059] %asi, %r30
	.word 0xf04d8000  ! 3579: LDSB_R	ldsb	[%r22 + %r0], %r24
T2_asi_reg_wr_162:
	mov	0xc, %r14
	.word 0xfef384a0  ! 3580: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T2_asi_reg_wr_163:
	mov	0x38, %r14
	.word 0xfcf38e60  ! 3584: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb0ad211e  ! 3587: ANDNcc_I	andncc 	%r20, 0x011e, %r24
	.word 0xfa0c61b5  ! 3588: LDUB_I	ldub	[%r17 + 0x01b5], %r29
iob_intr_2_270:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_270), 16, 16)) -> intp(2, 0, 26)
	.word 0xb2354000  ! 3594: SUBC_R	orn 	%r21, %r0, %r25
	.word 0xf45c61f3  ! 3596: LDX_I	ldx	[%r17 + 0x01f3], %r26
iob_intr_2_271:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_271), 16, 16)) -> intp(2, 0, 37)
	.word 0xb151c000  ! 3598: RDPR_TL	<illegal instruction>
T2_asi_reg_rd_157:
	mov	0x29, %r14
	.word 0xf6db84a0  ! 3599: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xfa5d4000  ! 3601: LDX_R	ldx	[%r21 + %r0], %r29
	.word 0xfa5cc000  ! 3603: LDX_R	ldx	[%r19 + %r0], %r29
	.word 0xb8a4608e  ! 3604: SUBcc_I	subcc 	%r17, 0x008e, %r28
T2_asi_reg_wr_164:
	mov	0x3c7, %r14
	.word 0xf6f38e60  ! 3607: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xfed4c020  ! 3608: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r31
T2_asi_reg_wr_165:
	mov	0xc, %r14
	.word 0xf8f389e0  ! 3612: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_2_272:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_272), 16, 16)) -> intp(2, 0, 9)
	.word 0xf415c000  ! 3617: LDUH_R	lduh	[%r23 + %r0], %r26
iob_intr_2_273:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_273), 16, 16)) -> intp(2, 0, 25)
	.word 0xf8d48020  ! 3620: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r28
	.word 0xf614a168  ! 3622: LDUH_I	lduh	[%r18 + 0x0168], %r27
	.word 0xbd34a001  ! 3624: SRL_I	srl 	%r18, 0x0001, %r30
	.word 0xbc14e107  ! 3625: OR_I	or 	%r19, 0x0107, %r30
	.word 0xf04da1be  ! 3627: LDSB_I	ldsb	[%r22 + 0x01be], %r24
iob_intr_2_274:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_274), 16, 16)) -> intp(2, 0, 29)
iob_intr_2_275:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_275), 16, 16)) -> intp(2, 0, 13)
	.word 0xfe45c000  ! 3633: LDSW_R	ldsw	[%r23 + %r0], %r31
	.word 0xf405e199  ! 3634: LDUW_I	lduw	[%r23 + 0x0199], %r26
	ta	T_CHANGE_HPRIV
iob_intr_2_276:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_276), 16, 16)) -> intp(2, 0, 2a)
	.word 0xfc85c020  ! 3638: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r30
T2_asi_reg_wr_166:
	mov	0x3c2, %r14
	.word 0xfcf38e80  ! 3642: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL0
	.word 0xf8cc0020  ! 3646: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r28
iob_intr_2_277:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_277), 16, 16)) -> intp(2, 0, 1f)
	ta	T_CHANGE_HPRIV
	.word 0xfe5d205f  ! 3653: LDX_I	ldx	[%r20 + 0x005f], %r31
	.word 0xf8c521ea  ! 3654: LDSWA_I	ldswa	[%r20, + 0x01ea] %asi, %r28
	.word 0xf40d2126  ! 3656: LDUB_I	ldub	[%r20 + 0x0126], %r26
iob_intr_2_278:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_278), 16, 16)) -> intp(2, 0, 10)
iob_intr_2_279:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_279), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_262:
	setx	0x3f0230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8d615c  ! 3665: ANDcc_I	andcc 	%r21, 0x015c, %r30
T2_asi_reg_wr_167:
	mov	0x3c0, %r14
	.word 0xf8f38e40  ! 3666: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfedca173  ! 3667: LDXA_I	ldxa	[%r18, + 0x0173] %asi, %r31
	.word 0xf205a178  ! 3668: LDUW_I	lduw	[%r22 + 0x0178], %r25
iob_intr_2_280:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_280), 16, 16)) -> intp(2, 0, 12)
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x8198398a  ! 3671: WRHPR_HPSTATE_I	wrhpr	%r0, 0x198a, %hpstate
T2_asi_reg_wr_168:
	mov	0x3c3, %r14
	.word 0xf4f384a0  ! 3673: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_2_281:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_281), 16, 16)) -> intp(2, 0, 19)
	.word 0xbb3d1000  ! 3677: SRAX_R	srax	%r20, %r0, %r29
cpu_intr_2_263:
	setx	0x3e0327, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_264:
	setx	0x3d0103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05c8000  ! 3681: LDX_R	ldx	[%r18 + %r0], %r24
	.word 0xbb540000  ! 3682: RDPR_GL	<illegal instruction>
iob_intr_2_282:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_282), 16, 16)) -> intp(2, 0, 27)
cpu_intr_2_265:
	setx	0x3d0015, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_266:
	setx	0x3e000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb41c60b9  ! 3689: XOR_I	xor 	%r17, 0x00b9, %r26
cpu_intr_2_267:
	setx	0x3f022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60ca17e  ! 3693: LDUB_I	ldub	[%r18 + 0x017e], %r27
T2_asi_reg_rd_158:
	mov	0x3c8, %r14
	.word 0xf4db8400  ! 3696: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xfad4211b  ! 3697: LDSHA_I	ldsha	[%r16, + 0x011b] %asi, %r29
cpu_intr_2_268:
	setx	0x3f003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd2dd000  ! 3700: SLLX_R	sllx	%r23, %r0, %r30
	.word 0xfc5d61a7  ! 3701: LDX_I	ldx	[%r21 + 0x01a7], %r30
T2_asi_reg_rd_159:
	mov	0x16, %r14
	.word 0xfcdb89e0  ! 3702: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_2_269:
	setx	0x3e0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb02ce06f  ! 3711: ANDN_I	andn 	%r19, 0x006f, %r24
iob_intr_2_283:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_283), 16, 16)) -> intp(2, 0, c)
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x819838d0  ! 3714: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18d0, %hpstate
	.word 0xf84c0000  ! 3719: LDSB_R	ldsb	[%r16 + %r0], %r28
	ta	T_CHANGE_HPRIV
	.word 0xbe35a098  ! 3726: ORN_I	orn 	%r22, 0x0098, %r31
	ta	T_CHANGE_TO_TL0
iob_intr_2_284:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_284), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_wr_169:
	mov	0x3c3, %r14
	.word 0xf6f38e60  ! 3731: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xfe4d0000  ! 3733: LDSB_R	ldsb	[%r20 + %r0], %r31
T2_asi_reg_rd_160:
	mov	0x31, %r14
	.word 0xfadb89e0  ! 3734: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983888  ! 3744: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1888, %hpstate
	.word 0xfacc0020  ! 3745: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r29
	.word 0xf494601e  ! 3748: LDUHA_I	lduha	[%r17, + 0x001e] %asi, %r26
iob_intr_2_285:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_285), 16, 16)) -> intp(2, 0, 3e)
iob_intr_2_286:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_286), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf6850020  ! 3753: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r27
cpu_intr_2_270:
	setx	0x3f0324, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_170:
	mov	0x3c7, %r14
	.word 0xfaf38e60  ! 3758: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_2_287:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_287), 16, 16)) -> intp(2, 0, 3b)
cpu_intr_2_271:
	setx	0x3f030c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_288:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_288), 16, 16)) -> intp(2, 0, 3c)
iob_intr_2_289:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_289), 16, 16)) -> intp(2, 0, 39)
	.word 0xf455e1fb  ! 3764: LDSH_I	ldsh	[%r23 + 0x01fb], %r26
	.word 0xb4052175  ! 3766: ADD_I	add 	%r20, 0x0175, %r26
iob_intr_2_290:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_290), 16, 16)) -> intp(2, 0, 2f)
	.word 0xbe3421d9  ! 3774: ORN_I	orn 	%r16, 0x01d9, %r31
	.word 0xfa44e1fd  ! 3775: LDSW_I	ldsw	[%r19 + 0x01fd], %r29
T2_asi_reg_wr_171:
	mov	0x2c, %r14
	.word 0xf8f384a0  ! 3778: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_2_291:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_291), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_rd_161:
	mov	0x21, %r14
	.word 0xf0db8e80  ! 3782: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_2_292:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_292), 16, 16)) -> intp(2, 0, 39)
	.word 0xf08d4020  ! 3788: LDUBA_R	lduba	[%r21, %r0] 0x01, %r24
	.word 0xbe2ca19c  ! 3791: ANDN_I	andn 	%r18, 0x019c, %r31
iob_intr_2_293:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_293), 16, 16)) -> intp(2, 0, 25)
iob_intr_2_294:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_294), 16, 16)) -> intp(2, 0, 13)
	.word 0xf0456064  ! 3795: LDSW_I	ldsw	[%r21 + 0x0064], %r24
iob_intr_2_295:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_295), 16, 16)) -> intp(2, 0, 26)
	.word 0xfe0da1f0  ! 3803: LDUB_I	ldub	[%r22 + 0x01f0], %r31
T2_asi_reg_wr_172:
	mov	0x2e, %r14
	.word 0xfef384a0  ! 3806: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_2_272:
	setx	0x3f032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_2_273:
	setx	0x3d013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6954020  ! 3812: LDUHA_R	lduha	[%r21, %r0] 0x01, %r27
cpu_intr_2_274:
	setx	0x3e020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf2d5a006  ! 3825: LDSHA_I	ldsha	[%r22, + 0x0006] %asi, %r25
T2_asi_reg_wr_173:
	mov	0x9, %r14
	.word 0xfef38e80  ! 3827: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbb2d9000  ! 3829: SLLX_R	sllx	%r22, %r0, %r29
cpu_intr_2_275:
	setx	0x3f0128, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_296:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_296), 16, 16)) -> intp(2, 0, 12)
	.word 0xf015e1a2  ! 3834: LDUH_I	lduh	[%r23 + 0x01a2], %r24
	.word 0xf4458000  ! 3835: LDSW_R	ldsw	[%r22 + %r0], %r26
iob_intr_2_297:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_297), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_276:
	setx	0x3f0233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2158000  ! 3843: LDUH_R	lduh	[%r22 + %r0], %r25
	.word 0xbb518000  ! 3844: RDPR_PSTATE	<illegal instruction>
cpu_intr_2_277:
	setx	0x3e0336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8844020  ! 3848: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r28
	.word 0xf04c8000  ! 3849: LDSB_R	ldsb	[%r18 + %r0], %r24
	.word 0xb4c4215f  ! 3851: ADDCcc_I	addccc 	%r16, 0x015f, %r26
cpu_intr_2_278:
	setx	0x10137, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_298:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_298), 16, 16)) -> intp(2, 0, 21)
	.word 0xf6140000  ! 3855: LDUH_R	lduh	[%r16 + %r0], %r27
iob_intr_2_299:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_299), 16, 16)) -> intp(2, 0, 1f)
T2_asi_reg_rd_162:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 3863: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T2_asi_reg_wr_174:
	mov	0x2f, %r14
	.word 0xf4f389e0  ! 3867: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T2_asi_reg_rd_163:
	mov	0x1e, %r14
	.word 0xf6db8e40  ! 3870: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_2_279:
	setx	0x3f0303, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_164:
	mov	0x32, %r14
	.word 0xf0db8e40  ! 3872: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T2_asi_reg_wr_175:
	mov	0x16, %r14
	.word 0xf8f38400  ! 3873: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xfc5de103  ! 3875: LDX_I	ldx	[%r23 + 0x0103], %r30
iob_intr_2_300:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_300), 16, 16)) -> intp(2, 0, 17)
iob_intr_2_301:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_301), 16, 16)) -> intp(2, 0, e)
	.word 0xfacc0020  ! 3881: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r29
	.word 0xfe840020  ! 3884: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r31
iob_intr_2_302:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_302), 16, 16)) -> intp(2, 0, 13)
	.word 0xfc8de000  ! 3888: LDUBA_I	lduba	[%r23, + 0x0000] %asi, %r30
T2_asi_reg_wr_176:
	mov	0x33, %r14
	.word 0xfef389e0  ! 3890: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_2_303:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_303), 16, 16)) -> intp(2, 0, 38)
	.word 0xf6850020  ! 3892: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r27
T2_asi_reg_wr_177:
	mov	0x27, %r14
	.word 0xfaf38e40  ! 3893: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb1345000  ! 3896: SRLX_R	srlx	%r17, %r0, %r24
cpu_intr_2_280:
	setx	0x3c031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_2_304:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_304), 16, 16)) -> intp(2, 0, 16)
	.word 0xf4154000  ! 3905: LDUH_R	lduh	[%r21 + %r0], %r26
iob_intr_2_305:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_305), 16, 16)) -> intp(2, 0, 1f)
cpu_intr_2_281:
	setx	0x3c0024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc0d8000  ! 3910: LDUB_R	ldub	[%r22 + %r0], %r30
	.word 0xfa4cc000  ! 3911: LDSB_R	ldsb	[%r19 + %r0], %r29
	.word 0xbe342051  ! 3914: ORN_I	orn 	%r16, 0x0051, %r31
cpu_intr_2_282:
	setx	0x3d0201, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf44c21fb  ! 3919: LDSB_I	ldsb	[%r16 + 0x01fb], %r26
cpu_intr_2_283:
	setx	0x3c020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfed5c020  ! 3927: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r31
cpu_intr_2_284:
	setx	0x3e0035, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_2_285:
	setx	0x3c0309, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_306:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_306), 16, 16)) -> intp(2, 0, 3d)
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_178:
	mov	0x5, %r14
	.word 0xf0f38e60  ! 3936: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xf0440000  ! 3937: LDSW_R	ldsw	[%r16 + %r0], %r24
T2_asi_reg_rd_165:
	mov	0x3c8, %r14
	.word 0xf2db8e80  ! 3941: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb13cf001  ! 3943: SRAX_I	srax	%r19, 0x0001, %r24
	.word 0xfe4ce0f7  ! 3944: LDSB_I	ldsb	[%r19 + 0x00f7], %r31
cpu_intr_2_286:
	setx	0x3d0031, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_166:
	mov	0x6, %r14
	.word 0xf0db8400  ! 3950: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T2_asi_reg_wr_179:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 3952: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf40d4000  ! 3953: LDUB_R	ldub	[%r21 + %r0], %r26
	.word 0xbe2ca1a5  ! 3954: ANDN_I	andn 	%r18, 0x01a5, %r31
cpu_intr_2_287:
	setx	0x3e011e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_307:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_307), 16, 16)) -> intp(2, 0, 3)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf45ca140  ! 3959: LDX_I	ldx	[%r18 + 0x0140], %r26
	.word 0xbf641800  ! 3962: MOVcc_R	<illegal instruction>
T2_asi_reg_wr_180:
	mov	0x3c7, %r14
	.word 0xf6f38e60  ! 3965: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_2_288:
	setx	0x3e0300, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_308:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_308), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_wr_181:
	mov	0x2d, %r14
	.word 0xf6f38e60  ! 3969: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb13ce001  ! 3976: SRA_I	sra 	%r19, 0x0001, %r24
iob_intr_2_309:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_309), 16, 16)) -> intp(2, 0, 3)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf815a1a3  ! 3980: LDUH_I	lduh	[%r22 + 0x01a3], %r28
	.word 0xfe5d8000  ! 3981: LDX_R	ldx	[%r22 + %r0], %r31
	.word 0xb2ade19f  ! 3984: ANDNcc_I	andncc 	%r23, 0x019f, %r25
	.word 0xf245c000  ! 3986: LDSW_R	ldsw	[%r23 + %r0], %r25
iob_intr_2_310:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_310), 16, 16)) -> intp(2, 0, 1)
	ta	T_CHANGE_TO_TL1
cpu_intr_2_289:
	setx	0x3d0130, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_311:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_311), 16, 16)) -> intp(2, 0, 4)
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x8198399a  ! 3993: WRHPR_HPSTATE_I	wrhpr	%r0, 0x199a, %hpstate
	.word 0xfac54020  ! 3995: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r29
cpu_intr_2_290:
	setx	0x3f012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25c0000  ! 3999: LDX_R	ldx	[%r16 + %r0], %r25
iob_intr_2_312:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_312), 16, 16)) -> intp(2, 0, 36)
T2_asi_reg_rd_167:
	mov	0x3c0, %r14
	.word 0xfadb89e0  ! 4002: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf4456133  ! 4004: LDSW_I	ldsw	[%r21 + 0x0133], %r26
T2_asi_reg_rd_168:
	mov	0x22, %r14
	.word 0xfadb8e40  ! 4005: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_wr_182:
	mov	0x18, %r14
	.word 0xf2f384a0  ! 4007: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_183:
	mov	0x3c7, %r14
	.word 0xf0f389e0  ! 4010: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_2_313:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_313), 16, 16)) -> intp(2, 0, 31)
T2_asi_reg_wr_184:
	mov	0x0, %r14
	.word 0xf2f38e40  ! 4018: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf6c421bc  ! 4019: LDSWA_I	ldswa	[%r16, + 0x01bc] %asi, %r27
	.word 0xfcc58020  ! 4022: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r30
	.word 0xf8c5e1fe  ! 4023: LDSWA_I	ldswa	[%r23, + 0x01fe] %asi, %r28
	.word 0xfa146057  ! 4026: LDUH_I	lduh	[%r17 + 0x0057], %r29
iob_intr_2_314:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_314), 16, 16)) -> intp(2, 0, 34)
iob_intr_2_315:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_315), 16, 16)) -> intp(2, 0, 3b)
	.word 0xf695c020  ! 4031: LDUHA_R	lduha	[%r23, %r0] 0x01, %r27
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
cpu_intr_2_291:
	setx	0x3d0117, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_316:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_316), 16, 16)) -> intp(2, 0, 18)
T2_asi_reg_wr_185:
	mov	0x27, %r14
	.word 0xfaf384a0  ! 4037: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_2_292:
	setx	0x3e0238, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_317:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_317), 16, 16)) -> intp(2, 0, 24)
cpu_intr_2_293:
	setx	0x3d0300, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_318:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_318), 16, 16)) -> intp(2, 0, 2c)
iob_intr_2_319:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_319), 16, 16)) -> intp(2, 0, 13)
	.word 0xf6958020  ! 4052: LDUHA_R	lduha	[%r22, %r0] 0x01, %r27
	ta	T_CHANGE_HPRIV
	.word 0xfe4d0000  ! 4060: LDSB_R	ldsb	[%r20 + %r0], %r31
cpu_intr_2_294:
	setx	0x3e0005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8cc020  ! 4065: LDUBA_R	lduba	[%r19, %r0] 0x01, %r31
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982f40  ! 4066: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f40, %hpstate
iob_intr_2_320:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_320), 16, 16)) -> intp(2, 0, 21)
iob_intr_2_321:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_321), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf0cd60aa  ! 4074: LDSBA_I	ldsba	[%r21, + 0x00aa] %asi, %r24
	.word 0xb02560c1  ! 4075: SUB_I	sub 	%r21, 0x00c1, %r24
	.word 0xf2cc8020  ! 4076: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r25
	.word 0xfe444000  ! 4078: LDSW_R	ldsw	[%r17 + %r0], %r31
	.word 0xf2c56059  ! 4079: LDSWA_I	ldswa	[%r21, + 0x0059] %asi, %r25
T2_asi_reg_wr_186:
	mov	0x3c4, %r14
	.word 0xfcf384a0  ! 4081: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	ta	T_CHANGE_TO_TL1
iob_intr_2_322:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_322), 16, 16)) -> intp(2, 0, 39)
	.word 0xfccc0020  ! 4085: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r30
	.word 0xf8dc61c2  ! 4087: LDXA_I	ldxa	[%r17, + 0x01c2] %asi, %r28
cpu_intr_2_295:
	setx	0x3e0311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcdda0bf  ! 4089: LDXA_I	ldxa	[%r22, + 0x00bf] %asi, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfad44020  ! 4094: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r29
	.word 0xfc9460f9  ! 4095: LDUHA_I	lduha	[%r17, + 0x00f9] %asi, %r30
cpu_intr_2_296:
	setx	0x3c0321, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_2_297:
	setx	0x3c0029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf84ce14b  ! 4100: LDSB_I	ldsb	[%r19 + 0x014b], %r28
iob_intr_2_323:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_323), 16, 16)) -> intp(2, 0, f)
cpu_intr_2_298:
	setx	0x3c030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1643801  ! 4105: MOVcc_I	<illegal instruction>
iob_intr_2_324:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_324), 16, 16)) -> intp(2, 0, 2b)
	.word 0xfe958020  ! 4111: LDUHA_R	lduha	[%r22, %r0] 0x01, %r31
T2_asi_reg_rd_169:
	mov	0xc, %r14
	.word 0xfcdb8e40  ! 4112: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_wr_187:
	mov	0x33, %r14
	.word 0xfaf389e0  ! 4113: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_2_299:
	setx	0x430327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8254000  ! 4115: SUB_R	sub 	%r21, %r0, %r28
	.word 0xfa94601c  ! 4117: LDUHA_I	lduha	[%r17, + 0x001c] %asi, %r29
	.word 0xb92df001  ! 4118: SLLX_I	sllx	%r23, 0x0001, %r28
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983902  ! 4119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1902, %hpstate
	.word 0xbe34c000  ! 4122: ORN_R	orn 	%r19, %r0, %r31
	.word 0xbab48000  ! 4127: ORNcc_R	orncc 	%r18, %r0, %r29
	.word 0xfa048000  ! 4128: LDUW_R	lduw	[%r18 + %r0], %r29
	.word 0xf64de191  ! 4130: LDSB_I	ldsb	[%r23 + 0x0191], %r27
	.word 0xb2344000  ! 4132: SUBC_R	orn 	%r17, %r0, %r25
	.word 0xfacc6175  ! 4134: LDSBA_I	ldsba	[%r17, + 0x0175] %asi, %r29
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983952  ! 4135: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1952, %hpstate
	.word 0xf605e1db  ! 4136: LDUW_I	lduw	[%r23 + 0x01db], %r27
cpu_intr_2_300:
	setx	0x400205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6d5a11b  ! 4140: LDSHA_I	ldsha	[%r22, + 0x011b] %asi, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_325:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_325), 16, 16)) -> intp(2, 0, 19)
cpu_intr_2_301:
	setx	0x41033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe154000  ! 4149: LDUH_R	lduh	[%r21 + %r0], %r31
	.word 0xf6cd4020  ! 4151: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r27
iob_intr_2_326:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_326), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_302:
	setx	0x400321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4a5c000  ! 4157: SUBcc_R	subcc 	%r23, %r0, %r26
	.word 0xf08c6106  ! 4158: LDUBA_I	lduba	[%r17, + 0x0106] %asi, %r24
cpu_intr_2_303:
	setx	0x420224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5c20b9  ! 4163: LDX_I	ldx	[%r16 + 0x00b9], %r31
	.word 0xbe140000  ! 4164: OR_R	or 	%r16, %r0, %r31
	.word 0xf0450000  ! 4165: LDSW_R	ldsw	[%r20 + %r0], %r24
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982c90  ! 4166: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c90, %hpstate
T2_asi_reg_rd_170:
	mov	0x4, %r14
	.word 0xf4db8e60  ! 4167: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T2_asi_reg_wr_188:
	mov	0x1b, %r14
	.word 0xfaf38e40  ! 4170: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_304:
	setx	0x420300, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_305:
	setx	0x430338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4950020  ! 4180: LDUHA_R	lduha	[%r20, %r0] 0x01, %r26
	.word 0xfc450000  ! 4183: LDSW_R	ldsw	[%r20 + %r0], %r30
	.word 0xfc040000  ! 4184: LDUW_R	lduw	[%r16 + %r0], %r30
T2_asi_reg_rd_171:
	mov	0x3c8, %r14
	.word 0xfadb8e40  ! 4187: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_wr_189:
	mov	0x6, %r14
	.word 0xfaf38e80  ! 4190: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T2_asi_reg_rd_172:
	mov	0x18, %r14
	.word 0xf4db84a0  ! 4192: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_2_327:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_327), 16, 16)) -> intp(2, 0, 26)
	.word 0xf4cde011  ! 4195: LDSBA_I	ldsba	[%r23, + 0x0011] %asi, %r26
	ta	T_CHANGE_HPRIV
iob_intr_2_328:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_328), 16, 16)) -> intp(2, 0, 25)
	.word 0xfe5c60b0  ! 4199: LDX_I	ldx	[%r17 + 0x00b0], %r31
	.word 0xbd2ce001  ! 4200: SLL_I	sll 	%r19, 0x0001, %r30
T2_asi_reg_rd_173:
	mov	0x18, %r14
	.word 0xf4db89e0  ! 4202: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf655c000  ! 4204: LDSH_R	ldsh	[%r23 + %r0], %r27
cpu_intr_2_306:
	setx	0x42003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe956091  ! 4213: LDUHA_I	lduha	[%r21, + 0x0091] %asi, %r31
cpu_intr_2_307:
	setx	0x43011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfacd8020  ! 4220: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r29
	.word 0xf2546189  ! 4221: LDSH_I	ldsh	[%r17 + 0x0189], %r25
cpu_intr_2_308:
	setx	0x420207, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xbb7c6401  ! 4225: MOVR_I	movre	%r17, 0x1, %r29
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983d98  ! 4226: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d98, %hpstate
iob_intr_2_329:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_329), 16, 16)) -> intp(2, 0, 15)
	.word 0xfa15e1a3  ! 4233: LDUH_I	lduh	[%r23 + 0x01a3], %r29
	.word 0xfe4d0000  ! 4235: LDSB_R	ldsb	[%r20 + %r0], %r31
	ta	T_CHANGE_HPRIV
	.word 0xf88de1ae  ! 4241: LDUBA_I	lduba	[%r23, + 0x01ae] %asi, %r28
iob_intr_2_330:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_330), 16, 16)) -> intp(2, 0, 2b)
iob_intr_2_331:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_331), 16, 16)) -> intp(2, 0, 30)
	.word 0xf054e0d4  ! 4247: LDSH_I	ldsh	[%r19 + 0x00d4], %r24
	.word 0xfa144000  ! 4250: LDUH_R	lduh	[%r17 + %r0], %r29
cpu_intr_2_309:
	setx	0x430309, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_310:
	setx	0x43032f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_332:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_332), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_rd_174:
	mov	0x1a, %r14
	.word 0xfcdb89e0  ! 4264: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_2_311:
	setx	0x41023e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_312:
	setx	0x410018, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_333:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_333), 16, 16)) -> intp(2, 0, 1d)
T2_asi_reg_rd_175:
	mov	0x5, %r14
	.word 0xf6db84a0  ! 4269: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf0558000  ! 4270: LDSH_R	ldsh	[%r22 + %r0], %r24
iob_intr_2_334:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_334), 16, 16)) -> intp(2, 0, 19)
T2_asi_reg_rd_176:
	mov	0x35, %r14
	.word 0xfedb84a0  ! 4275: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_2_335:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_335), 16, 16)) -> intp(2, 0, 36)
	ta	T_CHANGE_HPRIV
	.word 0xf45c616c  ! 4282: LDX_I	ldx	[%r17 + 0x016c], %r26
cpu_intr_2_313:
	setx	0x430135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb41cc000  ! 4284: XOR_R	xor 	%r19, %r0, %r26
cpu_intr_2_314:
	setx	0x420010, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_177:
	mov	0x16, %r14
	.word 0xfadb8e40  ! 4286: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xba9cc000  ! 4288: XORcc_R	xorcc 	%r19, %r0, %r29
iob_intr_2_336:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_336), 16, 16)) -> intp(2, 0, 10)
	.word 0xb2b420dd  ! 4290: ORNcc_I	orncc 	%r16, 0x00dd, %r25
T2_asi_reg_wr_190:
	mov	0x15, %r14
	.word 0xfef38e80  ! 4292: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_2_337:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_337), 16, 16)) -> intp(2, 0, 28)
iob_intr_2_338:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_338), 16, 16)) -> intp(2, 0, 30)
	.word 0xf28520fe  ! 4299: LDUWA_I	lduwa	[%r20, + 0x00fe] %asi, %r25
	.word 0xbd2d0000  ! 4302: SLL_R	sll 	%r20, %r0, %r30
T2_asi_reg_rd_178:
	mov	0x2e, %r14
	.word 0xfcdb8e80  ! 4304: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_2_339:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_339), 16, 16)) -> intp(2, 0, 1d)
	.word 0xfa0d61d9  ! 4311: LDUB_I	ldub	[%r21 + 0x01d9], %r29
iob_intr_2_340:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_340), 16, 16)) -> intp(2, 0, 19)
iob_intr_2_341:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_341), 16, 16)) -> intp(2, 0, 2c)
cpu_intr_2_315:
	setx	0x41021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_316:
	setx	0x420207, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_342:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_342), 16, 16)) -> intp(2, 0, 31)
	.word 0xf254c000  ! 4323: LDSH_R	ldsh	[%r19 + %r0], %r25
T2_asi_reg_wr_191:
	mov	0x23, %r14
	.word 0xfef389e0  ! 4324: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T2_asi_reg_rd_179:
	mov	0x3c8, %r14
	.word 0xfedb8e60  ! 4328: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xfa5ce05c  ! 4329: LDX_I	ldx	[%r19 + 0x005c], %r29
	.word 0xf25d61af  ! 4330: LDX_I	ldx	[%r21 + 0x01af], %r25
	.word 0xf8054000  ! 4331: LDUW_R	lduw	[%r21 + %r0], %r28
	.word 0xf0940020  ! 4332: LDUHA_R	lduha	[%r16, %r0] 0x01, %r24
	.word 0xf4d5c020  ! 4333: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r26
	.word 0xb32c1000  ! 4334: SLLX_R	sllx	%r16, %r0, %r25
	.word 0xfc056080  ! 4335: LDUW_I	lduw	[%r21 + 0x0080], %r30
T2_asi_reg_wr_192:
	mov	0x38, %r14
	.word 0xf2f389e0  ! 4337: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_2_343:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_343), 16, 16)) -> intp(2, 0, 23)
T2_asi_reg_rd_180:
	mov	0x2f, %r14
	.word 0xfadb89e0  ! 4341: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_2_317:
	setx	0x420038, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_318:
	setx	0x430217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc344000  ! 4344: SUBC_R	orn 	%r17, %r0, %r30
T2_asi_reg_rd_181:
	mov	0x3c6, %r14
	.word 0xf4db8e40  ! 4347: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_2_344:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_344), 16, 16)) -> intp(2, 0, 36)
	.word 0xb0b58000  ! 4353: SUBCcc_R	orncc 	%r22, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfe8c8020  ! 4359: LDUBA_R	lduba	[%r18, %r0] 0x01, %r31
	.word 0xf84c60a4  ! 4360: LDSB_I	ldsb	[%r17 + 0x00a4], %r28
iob_intr_2_345:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_345), 16, 16)) -> intp(2, 0, 1)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_193:
	mov	0x12, %r14
	.word 0xfcf389e0  ! 4370: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xbe950000  ! 4371: ORcc_R	orcc 	%r20, %r0, %r31
T2_asi_reg_wr_194:
	mov	0x3c8, %r14
	.word 0xfaf389e0  ! 4372: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL1
	.word 0xf2450000  ! 4374: LDSW_R	ldsw	[%r20 + %r0], %r25
iob_intr_2_346:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_346), 16, 16)) -> intp(2, 0, 5)
	.word 0xfacc0020  ! 4377: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r29
	.word 0xf655c000  ! 4378: LDSH_R	ldsh	[%r23 + %r0], %r27
	.word 0xb8b52078  ! 4381: SUBCcc_I	orncc 	%r20, 0x0078, %r28
T2_asi_reg_wr_195:
	mov	0xf, %r14
	.word 0xf2f389e0  ! 4383: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T2_asi_reg_wr_196:
	mov	0x2e, %r14
	.word 0xfaf38e40  ! 4384: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_319:
	setx	0x40021d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_182:
	mov	0x3c1, %r14
	.word 0xf4db84a0  ! 4388: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xfc048000  ! 4391: LDUW_R	lduw	[%r18 + %r0], %r30
iob_intr_2_347:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_347), 16, 16)) -> intp(2, 0, 17)
	.word 0xf60d0000  ! 4396: LDUB_R	ldub	[%r20 + %r0], %r27
T2_asi_reg_rd_183:
	mov	0x6, %r14
	.word 0xf6db8e40  ! 4398: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf2d50020  ! 4400: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r25
iob_intr_2_348:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_348), 16, 16)) -> intp(2, 0, f)
T2_asi_reg_rd_184:
	mov	0x3c1, %r14
	.word 0xf2db8e40  ! 4406: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf24d6181  ! 4411: LDSB_I	ldsb	[%r21 + 0x0181], %r25
T2_asi_reg_rd_185:
	mov	0x18, %r14
	.word 0xf2db8e80  ! 4415: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_2_349:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_349), 16, 16)) -> intp(2, 0, 3b)
cpu_intr_2_320:
	setx	0x430126, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_321:
	setx	0x400004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc14e085  ! 4423: LDUH_I	lduh	[%r19 + 0x0085], %r30
	.word 0xf85c4000  ! 4424: LDX_R	ldx	[%r17 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_350:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_350), 16, 16)) -> intp(2, 0, 1b)
	.word 0xbf2cd000  ! 4440: SLLX_R	sllx	%r19, %r0, %r31
T2_asi_reg_wr_197:
	mov	0x3c4, %r14
	.word 0xf8f38e60  ! 4441: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf284609a  ! 4444: LDUWA_I	lduwa	[%r17, + 0x009a] %asi, %r25
	.word 0xf0450000  ! 4446: LDSW_R	ldsw	[%r20 + %r0], %r24
	.word 0xf4048000  ! 4448: LDUW_R	lduw	[%r18 + %r0], %r26
	.word 0xba2cc000  ! 4449: ANDN_R	andn 	%r19, %r0, %r29
	.word 0xf64cc000  ! 4451: LDSB_R	ldsb	[%r19 + %r0], %r27
	.word 0xbd342001  ! 4452: SRL_I	srl 	%r16, 0x0001, %r30
T2_asi_reg_wr_198:
	mov	0x13, %r14
	.word 0xfaf38e40  ! 4454: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb40d8000  ! 4455: AND_R	and 	%r22, %r0, %r26
iob_intr_2_351:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_351), 16, 16)) -> intp(2, 0, 31)
	.word 0xf6c421d0  ! 4459: LDSWA_I	ldswa	[%r16, + 0x01d0] %asi, %r27
iob_intr_2_352:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_352), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_353:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_353), 16, 16)) -> intp(2, 0, 3e)
iob_intr_2_354:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_354), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_rd_186:
	mov	0x1b, %r14
	.word 0xf6db84a0  ! 4466: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf80d0000  ! 4467: LDUB_R	ldub	[%r20 + %r0], %r28
iob_intr_2_355:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_355), 16, 16)) -> intp(2, 0, 13)
	.word 0xb52de001  ! 4469: SLL_I	sll 	%r23, 0x0001, %r26
iob_intr_2_356:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_356), 16, 16)) -> intp(2, 0, 32)
iob_intr_2_357:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_357), 16, 16)) -> intp(2, 0, b)
iob_intr_2_358:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_358), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_322:
	setx	0x420331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe44a139  ! 4477: LDSW_I	ldsw	[%r18 + 0x0139], %r31
T2_asi_reg_wr_199:
	mov	0x3c8, %r14
	.word 0xfcf384a0  ! 4478: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983a80  ! 4480: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a80, %hpstate
	.word 0xf894c020  ! 4481: LDUHA_R	lduha	[%r19, %r0] 0x01, %r28
iob_intr_2_359:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_359), 16, 16)) -> intp(2, 0, 2e)
cpu_intr_2_323:
	setx	0x410239, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_360:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_360), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_wr_200:
	mov	0x25, %r14
	.word 0xf4f384a0  ! 4492: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
iob_intr_2_361:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_361), 16, 16)) -> intp(2, 0, 2d)
T2_asi_reg_rd_187:
	mov	0x9, %r14
	.word 0xf0db8e40  ! 4495: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_324:
	setx	0x400216, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_325:
	setx	0x430129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4ac0000  ! 4502: ANDNcc_R	andncc 	%r16, %r0, %r26
T2_asi_reg_rd_188:
	mov	0x18, %r14
	.word 0xf2db8e80  ! 4504: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_2_326:
	setx	0x43021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc458000  ! 4507: LDSW_R	ldsw	[%r22 + %r0], %r30
	.word 0xfe844020  ! 4508: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r31
cpu_intr_2_327:
	setx	0x410321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe85c020  ! 4512: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r31
iob_intr_2_362:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_362), 16, 16)) -> intp(2, 0, d)
	.word 0xb4458000  ! 4516: ADDC_R	addc 	%r22, %r0, %r26
iob_intr_2_363:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_363), 16, 16)) -> intp(2, 0, 3f)
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983a98  ! 4520: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a98, %hpstate
T2_asi_reg_rd_189:
	mov	0x3c7, %r14
	.word 0xf8db84a0  ! 4521: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf85d61eb  ! 4523: LDX_I	ldx	[%r21 + 0x01eb], %r28
iob_intr_2_364:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_364), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf284a113  ! 4527: LDUWA_I	lduwa	[%r18, + 0x0113] %asi, %r25
iob_intr_2_365:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_365), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf8056189  ! 4533: LDUW_I	lduw	[%r21 + 0x0189], %r28
	.word 0xf08c6177  ! 4534: LDUBA_I	lduba	[%r17, + 0x0177] %asi, %r24
T2_asi_reg_wr_201:
	mov	0xe, %r14
	.word 0xf4f38400  ! 4536: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_2_366:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_366), 16, 16)) -> intp(2, 0, 7)
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
iob_intr_2_367:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_367), 16, 16)) -> intp(2, 0, c)
	.word 0xf8550000  ! 4543: LDSH_R	ldsh	[%r20 + %r0], %r28
	.word 0xfe0d8000  ! 4544: LDUB_R	ldub	[%r22 + %r0], %r31
	.word 0xf85ce1d5  ! 4548: LDX_I	ldx	[%r19 + 0x01d5], %r28
	.word 0xf6452154  ! 4551: LDSW_I	ldsw	[%r20 + 0x0154], %r27
T2_asi_reg_rd_190:
	mov	0x26, %r14
	.word 0xfadb8e60  ! 4552: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_2_368:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_368), 16, 16)) -> intp(2, 0, 15)
iob_intr_2_369:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_369), 16, 16)) -> intp(2, 0, 3f)
cpu_intr_2_328:
	setx	0x410224, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_370:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_370), 16, 16)) -> intp(2, 0, 13)
cpu_intr_2_329:
	setx	0x420131, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_371:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_371), 16, 16)) -> intp(2, 0, 10)
	.word 0xfa0c21c4  ! 4560: LDUB_I	ldub	[%r16 + 0x01c4], %r29
	.word 0xfac5610c  ! 4561: LDSWA_I	ldswa	[%r21, + 0x010c] %asi, %r29
	.word 0xf45d8000  ! 4563: LDX_R	ldx	[%r22 + %r0], %r26
T2_asi_reg_rd_191:
	mov	0x3c1, %r14
	.word 0xf2db8e80  ! 4567: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T2_asi_reg_rd_192:
	mov	0xe, %r14
	.word 0xf0db84a0  ! 4568: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T2_asi_reg_rd_193:
	mov	0x30, %r14
	.word 0xf6db8e40  ! 4571: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_TO_TL1
iob_intr_2_372:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_372), 16, 16)) -> intp(2, 0, 25)
cpu_intr_2_330:
	setx	0x450302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcb48000  ! 4580: ORNcc_R	orncc 	%r18, %r0, %r30
cpu_intr_2_331:
	setx	0x46031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88da19d  ! 4582: LDUBA_I	lduba	[%r22, + 0x019d] %asi, %r28
	.word 0xbe2de116  ! 4585: ANDN_I	andn 	%r23, 0x0116, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf215c000  ! 4590: LDUH_R	lduh	[%r23 + %r0], %r25
T2_asi_reg_wr_202:
	mov	0x28, %r14
	.word 0xf4f38e40  ! 4591: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf6042144  ! 4592: LDUW_I	lduw	[%r16 + 0x0144], %r27
	.word 0xb7643801  ! 4595: MOVcc_I	<illegal instruction>
	.word 0xf85c0000  ! 4597: LDX_R	ldx	[%r16 + %r0], %r28
cpu_intr_2_332:
	setx	0x460114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8cdc020  ! 4600: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r28
	.word 0xf604609d  ! 4601: LDUW_I	lduw	[%r17 + 0x009d], %r27
	.word 0xb61d21c2  ! 4603: XOR_I	xor 	%r20, 0x01c2, %r27
	.word 0xfe04e0e8  ! 4604: LDUW_I	lduw	[%r19 + 0x00e8], %r31
cpu_intr_2_333:
	setx	0x460238, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_203:
	mov	0x4, %r14
	.word 0xfaf389e0  ! 4607: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_2_334:
	setx	0x45010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa952113  ! 4610: LDUHA_I	lduha	[%r20, + 0x0113] %asi, %r29
	.word 0xb1643801  ! 4615: MOVcc_I	<illegal instruction>
	.word 0xb334f001  ! 4616: SRLX_I	srlx	%r19, 0x0001, %r25
	.word 0xfe55a092  ! 4617: LDSH_I	ldsh	[%r22 + 0x0092], %r31
cpu_intr_2_335:
	setx	0x470138, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_336:
	setx	0x45010f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_373:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_373), 16, 16)) -> intp(2, 0, 1f)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_TO_TL0
cpu_intr_2_337:
	setx	0x470229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_338:
	setx	0x470112, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_194:
	mov	0x22, %r14
	.word 0xfcdb8e60  ! 4630: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf28da138  ! 4633: LDUBA_I	lduba	[%r22, + 0x0138] %asi, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982b4a  ! 4645: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4a, %hpstate
	.word 0xf84cc000  ! 4646: LDSB_R	ldsb	[%r19 + %r0], %r28
	ta	T_CHANGE_TO_TL1
iob_intr_2_374:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_374), 16, 16)) -> intp(2, 0, 21)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
iob_intr_2_375:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_375), 16, 16)) -> intp(2, 0, 1a)
cpu_intr_2_339:
	setx	0x44013c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_376:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_376), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_rd_195:
	mov	0x3c4, %r14
	.word 0xf0db8e60  ! 4668: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf20d0000  ! 4669: LDUB_R	ldub	[%r20 + %r0], %r25
	.word 0xb0b48000  ! 4675: SUBCcc_R	orncc 	%r18, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_377:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_377), 16, 16)) -> intp(2, 0, d)
	.word 0xfc05e1db  ! 4682: LDUW_I	lduw	[%r23 + 0x01db], %r30
cpu_intr_2_340:
	setx	0x44013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_204:
	mov	0x3c3, %r14
	.word 0xfaf384a0  ! 4688: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_2_378:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_378), 16, 16)) -> intp(2, 0, 20)
T2_asi_reg_rd_196:
	mov	0x33, %r14
	.word 0xfcdb8e60  ! 4692: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	ta	T_CHANGE_TO_TL1
	.word 0xf2156056  ! 4695: LDUH_I	lduh	[%r21 + 0x0056], %r25
cpu_intr_2_341:
	setx	0x460128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0542048  ! 4697: LDSH_I	ldsh	[%r16 + 0x0048], %r24
cpu_intr_2_342:
	setx	0x47010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf805c000  ! 4703: LDUW_R	lduw	[%r23 + %r0], %r28
	.word 0xfa8d61c9  ! 4705: LDUBA_I	lduba	[%r21, + 0x01c9] %asi, %r29
	.word 0xbcbd4000  ! 4706: XNORcc_R	xnorcc 	%r21, %r0, %r30
	.word 0xfa9560aa  ! 4707: LDUHA_I	lduha	[%r21, + 0x00aa] %asi, %r29
	.word 0xbd2c5000  ! 4708: SLLX_R	sllx	%r17, %r0, %r30
iob_intr_2_379:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_379), 16, 16)) -> intp(2, 0, 7)
	.word 0xf0048000  ! 4713: LDUW_R	lduw	[%r18 + %r0], %r24
T2_asi_reg_wr_205:
	mov	0x14, %r14
	.word 0xf8f384a0  ! 4720: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_2_343:
	setx	0x460215, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_380:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_380), 16, 16)) -> intp(2, 0, 28)
cpu_intr_2_344:
	setx	0x470028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf80520ab  ! 4728: LDUW_I	lduw	[%r20 + 0x00ab], %r28
T2_asi_reg_wr_206:
	mov	0x1b, %r14
	.word 0xfef38e40  ! 4729: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbd3c3001  ! 4730: SRAX_I	srax	%r16, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0xfa14c000  ! 4734: LDUH_R	lduh	[%r19 + %r0], %r29
	.word 0xfac561da  ! 4736: LDSWA_I	ldswa	[%r21, + 0x01da] %asi, %r29
	.word 0xbb3cd000  ! 4737: SRAX_R	srax	%r19, %r0, %r29
T2_asi_reg_rd_197:
	mov	0x3c6, %r14
	.word 0xfadb84a0  ! 4742: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_2_381:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_381), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_345:
	setx	0x470235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe058000  ! 4747: LDUW_R	lduw	[%r22 + %r0], %r31
	.word 0xf8cca150  ! 4748: LDSBA_I	ldsba	[%r18, + 0x0150] %asi, %r28
cpu_intr_2_346:
	setx	0x440024, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_382:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_382), 16, 16)) -> intp(2, 0, 3a)
iob_intr_2_383:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_383), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_347:
	setx	0x44011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982812  ! 4762: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0812, %hpstate
T2_asi_reg_rd_198:
	mov	0x11, %r14
	.word 0xf2db8400  ! 4763: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_2_348:
	setx	0x44033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2dc60f8  ! 4765: LDXA_I	ldxa	[%r17, + 0x00f8] %asi, %r25
	.word 0xb48560e6  ! 4771: ADDcc_I	addcc 	%r21, 0x00e6, %r26
cpu_intr_2_349:
	setx	0x47033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcb56029  ! 4776: ORNcc_I	orncc 	%r21, 0x0029, %r30
	.word 0xf8cc8020  ! 4779: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r28
iob_intr_2_384:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_384), 16, 16)) -> intp(2, 0, 36)
	.word 0xb9641800  ! 4785: MOVcc_R	<illegal instruction>
T2_asi_reg_wr_207:
	mov	0x1a, %r14
	.word 0xf2f38e40  ! 4786: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_385:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_385), 16, 16)) -> intp(2, 0, 31)
cpu_intr_2_350:
	setx	0x470224, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_208:
	mov	0x5, %r14
	.word 0xfef38e60  ! 4796: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T2_asi_reg_rd_199:
	mov	0x3c3, %r14
	.word 0xf8db8e40  ! 4799: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf4d42082  ! 4801: LDSHA_I	ldsha	[%r16, + 0x0082] %asi, %r26
	.word 0xf2044000  ! 4802: LDUW_R	lduw	[%r17 + %r0], %r25
cpu_intr_2_351:
	setx	0x460107, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_352:
	setx	0x440103, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_209:
	mov	0x2e, %r14
	.word 0xf4f38e40  ! 4806: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb8c5c000  ! 4807: ADDCcc_R	addccc 	%r23, %r0, %r28
T2_asi_reg_rd_200:
	mov	0x7, %r14
	.word 0xfadb8e80  ! 4809: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf6d46096  ! 4811: LDSHA_I	ldsha	[%r17, + 0x0096] %asi, %r27
cpu_intr_2_353:
	setx	0x46001e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_210:
	mov	0x20, %r14
	.word 0xf8f38e40  ! 4814: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_2_354:
	setx	0x460102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb68d0000  ! 4818: ANDcc_R	andcc 	%r20, %r0, %r27
	.word 0xfa5ca0dd  ! 4820: LDX_I	ldx	[%r18 + 0x00dd], %r29
	.word 0xfe844020  ! 4821: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r31
T2_asi_reg_wr_211:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 4822: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_386:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_386), 16, 16)) -> intp(2, 0, 2e)
	ta	T_CHANGE_TO_TL0
	.word 0xf64cc000  ! 4830: LDSB_R	ldsb	[%r19 + %r0], %r27
	.word 0xf8454000  ! 4831: LDSW_R	ldsw	[%r21 + %r0], %r28
	.word 0xf84ca1e7  ! 4832: LDSB_I	ldsb	[%r18 + 0x01e7], %r28
iob_intr_2_387:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_387), 16, 16)) -> intp(2, 0, 1)
cpu_intr_2_355:
	setx	0x46012e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_388:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_388), 16, 16)) -> intp(2, 0, 39)
cpu_intr_2_356:
	setx	0x47003f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_357:
	setx	0x460134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe048000  ! 4849: LDUW_R	lduw	[%r18 + %r0], %r31
	.word 0xf8850020  ! 4851: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r28
T2_asi_reg_rd_201:
	mov	0x34, %r14
	.word 0xfedb8e40  ! 4855: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf2054000  ! 4856: LDUW_R	lduw	[%r21 + %r0], %r25
	.word 0xbab50000  ! 4858: SUBCcc_R	orncc 	%r20, %r0, %r29
	ta	T_CHANGE_TO_TL1
	.word 0xb5500000  ! 4861: RDPR_TPC	<illegal instruction>
	.word 0xf6450000  ! 4862: LDSW_R	ldsw	[%r20 + %r0], %r27
cpu_intr_2_358:
	setx	0x470200, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_359:
	setx	0x440033, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_202:
	mov	0xb, %r14
	.word 0xf6db8e40  ! 4866: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbf2df001  ! 4867: SLLX_I	sllx	%r23, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5359000  ! 4870: SRLX_R	srlx	%r22, %r0, %r26
T2_asi_reg_wr_212:
	mov	0x3c3, %r14
	.word 0xf6f38400  ! 4880: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_2_389:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_389), 16, 16)) -> intp(2, 0, a)
	.word 0xfa84e02f  ! 4884: LDUWA_I	lduwa	[%r19, + 0x002f] %asi, %r29
	.word 0xfc8c8020  ! 4885: LDUBA_R	lduba	[%r18, %r0] 0x01, %r30
	.word 0xf85c4000  ! 4886: LDX_R	ldx	[%r17 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_rd_203:
	mov	0x9, %r14
	.word 0xfadb8400  ! 4890: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf8850020  ! 4891: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r28
	.word 0xfe45202f  ! 4895: LDSW_I	ldsw	[%r20 + 0x002f], %r31
	.word 0xfa158000  ! 4898: LDUH_R	lduh	[%r22 + %r0], %r29
	setx	data_start_4, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983e18  ! 4899: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e18, %hpstate
cpu_intr_2_360:
	setx	0x47001e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_204:
	mov	0x3c8, %r14
	.word 0xf6db8e60  ! 4902: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb835c000  ! 4903: SUBC_R	orn 	%r23, %r0, %r28
T2_asi_reg_wr_213:
	mov	0x1b, %r14
	.word 0xf0f38e40  ! 4904: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_361:
	setx	0x44013c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_362:
	setx	0x45030e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_205:
	mov	0xc, %r14
	.word 0xfadb89e0  ! 4909: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_363:
	setx	0x470213, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_364:
	setx	0x45021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_wr_214:
	mov	0x1, %r14
	.word 0xf4f38e60  ! 4917: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_2_365:
	setx	0x460208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0458000  ! 4919: LDSW_R	ldsw	[%r22 + %r0], %r24
	.word 0xfe95e1bf  ! 4920: LDUHA_I	lduha	[%r23, + 0x01bf] %asi, %r31
cpu_intr_2_366:
	setx	0x470126, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xb23c4000  ! 4926: XNOR_R	xnor 	%r17, %r0, %r25
cpu_intr_2_367:
	setx	0x470231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe8c0000  ! 4930: ANDcc_R	andcc 	%r16, %r0, %r31
	.word 0xf6cc0020  ! 4934: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r27
iob_intr_2_390:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_390), 16, 16)) -> intp(2, 0, 9)
	ta	T_CHANGE_TO_TL1
	.word 0xfc442137  ! 4937: LDSW_I	ldsw	[%r16 + 0x0137], %r30
	.word 0xfcd4e051  ! 4938: LDSHA_I	ldsha	[%r19, + 0x0051] %asi, %r30
cpu_intr_2_368:
	setx	0x460001, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_391:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_391), 16, 16)) -> intp(2, 0, 4)
cpu_intr_2_369:
	setx	0x470307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4942198  ! 4948: LDUHA_I	lduha	[%r16, + 0x0198] %asi, %r26
	.word 0xb0ac61d9  ! 4950: ANDNcc_I	andncc 	%r17, 0x01d9, %r24
	.word 0xf2058000  ! 4954: LDUW_R	lduw	[%r22 + %r0], %r25
	.word 0xf655a19c  ! 4957: LDSH_I	ldsh	[%r22 + 0x019c], %r27
iob_intr_2_392:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_392), 16, 16)) -> intp(2, 0, 34)
	.word 0xfc4da0b7  ! 4961: LDSB_I	ldsb	[%r22 + 0x00b7], %r30
	.word 0xf84c0000  ! 4964: LDSB_R	ldsb	[%r16 + %r0], %r28
T2_asi_reg_rd_206:
	mov	0x2, %r14
	.word 0xf8db8400  ! 4965: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T2_asi_reg_rd_207:
	mov	0x15, %r14
	.word 0xf4db8e40  ! 4968: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_2_370:
	setx	0x450229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_371:
	setx	0x450027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc140000  ! 4974: LDUH_R	lduh	[%r16 + %r0], %r30
	.word 0xb40c4000  ! 4975: AND_R	and 	%r17, %r0, %r26
	.word 0xf894600f  ! 4977: LDUHA_I	lduha	[%r17, + 0x000f] %asi, %r28
T2_asi_reg_rd_208:
	mov	0xe, %r14
	.word 0xf0db8e60  ! 4978: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T2_asi_reg_rd_209:
	mov	0x3c2, %r14
	.word 0xf8db8e80  ! 4981: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_2_393:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_393), 16, 16)) -> intp(2, 0, 15)
T2_asi_reg_wr_215:
	mov	0x5, %r14
	.word 0xf0f38e40  ! 4983: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_wr_216:
	mov	0x29, %r14
	.word 0xf0f38e40  ! 4985: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf88d61ae  ! 4986: LDUBA_I	lduba	[%r21, + 0x01ae] %asi, %r28
	.word 0xb805e02b  ! 4988: ADD_I	add 	%r23, 0x002b, %r28
T2_asi_reg_rd_210:
	mov	0x13, %r14
	.word 0xf4db8e40  ! 4994: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfa8dc020  ! 4995: LDUBA_R	lduba	[%r23, %r0] 0x01, %r29
	.word 0xf2846044  ! 4997: LDUWA_I	lduwa	[%r17, + 0x0044] %asi, %r25
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
cpu_intr_1_0:
	setx	0x1b0224, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_1:
	setx	0x19022f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_0:
	mov	0x2d, %r14
	.word 0xf6db89e0  ! 7: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_1_2:
	setx	0x1f0314, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_1:
	mov	0x1a, %r14
	.word 0xf4db8400  ! 9: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_0), 16, 16)) -> intp(1, 0, 28)
iob_intr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_1), 16, 16)) -> intp(1, 0, 39)
	.word 0xbba88820  ! 13: FMOVLE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_2:
	mov	0xd, %r14
	.word 0xf8db8e80  ! 16: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T1_asi_reg_wr_0:
	mov	0x3c4, %r14
	.word 0xfaf38e80  ! 17: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_1_3:
	setx	0x1e0031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_4:
	setx	0x1f0334, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_5:
	setx	0x1c030d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_1:
	mov	0x1a, %r14
	.word 0xf4f38400  ! 24: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T1_asi_reg_wr_2:
	mov	0xd, %r14
	.word 0xf0f38e60  ! 26: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_2), 16, 16)) -> intp(1, 0, 29)
cpu_intr_1_6:
	setx	0x1e0235, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_3), 16, 16)) -> intp(1, 0, 7)
	.word 0xb13cc000  ! 33: SRA_R	sra 	%r19, %r0, %r24
	.word 0xba348000  ! 36: SUBC_R	orn 	%r18, %r0, %r29
	.word 0xb9a00020  ! 40: FMOVs	fmovs	%f0, %f28
cpu_intr_1_7:
	setx	0x1c021e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_8:
	setx	0x1f0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00540  ! 44: FSQRTd	fsqrt	
	.word 0xbebca175  ! 45: XNORcc_I	xnorcc 	%r18, 0x0175, %r31
	.word 0xbda81c20  ! 48: FMOVRGEZ	dis not found

T1_asi_reg_wr_3:
	mov	0xf, %r14
	.word 0xf0f38e40  ! 49: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb5a98820  ! 51: FMOVNEG	fmovs	%fcc1, %f0, %f26
cpu_intr_1_9:
	setx	0x1f010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00520  ! 53: FSQRTs	fsqrt	
cpu_intr_1_10:
	setx	0x1f0107, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_11:
	setx	0x1e030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa44860  ! 58: FADDq	dis not found

iob_intr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_4), 16, 16)) -> intp(1, 0, 16)
iob_intr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_5), 16, 16)) -> intp(1, 0, a)
cpu_intr_1_12:
	setx	0x1e0231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9641800  ! 63: MOVcc_R	<illegal instruction>
	.word 0xb5a98820  ! 64: FMOVNEG	fmovs	%fcc1, %f0, %f26
cpu_intr_1_13:
	setx	0x1d021d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_3:
	mov	0x1f, %r14
	.word 0xfedb84a0  ! 68: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_1_14:
	setx	0x1c011c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_15:
	setx	0x1c0125, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_6), 16, 16)) -> intp(1, 0, 8)
cpu_intr_1_16:
	setx	0x1f0026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12da001  ! 75: SLL_I	sll 	%r22, 0x0001, %r24
	.word 0xb3a548c0  ! 76: FSUBd	fsubd	%f52, %f0, %f56
	.word 0xbfa548e0  ! 80: FSUBq	dis not found

	.word 0xbba00520  ! 81: FSQRTs	fsqrt	
	.word 0xb645c000  ! 82: ADDC_R	addc 	%r23, %r0, %r27
T1_asi_reg_wr_4:
	mov	0x7, %r14
	.word 0xf4f389e0  ! 92: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T1_asi_reg_wr_5:
	mov	0x17, %r14
	.word 0xf2f38e60  ! 93: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T1_asi_reg_rd_4:
	mov	0x1, %r14
	.word 0xf8db8e40  ! 94: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb214e109  ! 95: OR_I	or 	%r19, 0x0109, %r25
	.word 0xbfaa4820  ! 96: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xbda408a0  ! 102: FSUBs	fsubs	%f16, %f0, %f30
cpu_intr_1_17:
	setx	0x1e0118, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_6:
	mov	0x3c3, %r14
	.word 0xf0f389e0  ! 105: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb5a80420  ! 106: FMOVRZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbba84820  ! 109: FMOVE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_5:
	mov	0x3c3, %r14
	.word 0xf8db8e60  ! 111: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb73d9000  ! 112: SRAX_R	srax	%r22, %r0, %r27
T1_asi_reg_rd_6:
	mov	0x12, %r14
	.word 0xf4db8400  ! 113: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xbba81820  ! 114: FMOVRGZ	fmovs	%fcc3, %f0, %f29
T1_asi_reg_wr_7:
	mov	0x31, %r14
	.word 0xf6f38e40  ! 120: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_7), 16, 16)) -> intp(1, 0, e)
	.word 0xb9a58860  ! 123: FADDq	dis not found

cpu_intr_1_18:
	setx	0x1d0030, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_19:
	setx	0x1f0327, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_20:
	setx	0x1e0324, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_8), 16, 16)) -> intp(1, 0, 3d)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbda589e0  ! 142: FDIVq	dis not found

T1_asi_reg_wr_8:
	mov	0x19, %r14
	.word 0xf4f389e0  ! 144: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T1_asi_reg_rd_7:
	mov	0x29, %r14
	.word 0xf6db8400  ! 145: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_9), 16, 16)) -> intp(1, 0, 3)
	lda	[%r18 + %g0] 0xf0, %f2
cpu_intr_1_21:
	setx	0x1e0113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb344000  ! 153: SRL_R	srl 	%r17, %r0, %r29
	.word 0xbba88820  ! 154: FMOVLE	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbba4c9c0  ! 156: FDIVd	fdivd	%f50, %f0, %f60
	.word 0xbda00540  ! 157: FSQRTd	fsqrt	
iob_intr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_10), 16, 16)) -> intp(1, 0, 31)
iob_intr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_11), 16, 16)) -> intp(1, 0, 0)
	.word 0xbda81c20  ! 164: FMOVRGEZ	dis not found

	.word 0xbba00520  ! 168: FSQRTs	fsqrt	
	.word 0xb1a448c0  ! 169: FSUBd	fsubd	%f48, %f0, %f24
cpu_intr_1_22:
	setx	0x1d0032, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_9:
	mov	0x3c8, %r14
	.word 0xf0f38e80  ! 174: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_1_23:
	setx	0x1d0003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda54840  ! 179: FADDd	faddd	%f52, %f0, %f30
cpu_intr_1_24:
	setx	0x1f0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa90820  ! 185: FMOVLEU	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_10:
	mov	0x19, %r14
	.word 0xf8f38e60  ! 187: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_12), 16, 16)) -> intp(1, 0, 0)
	.word 0xb7a489c0  ! 191: FDIVd	fdivd	%f18, %f0, %f58
iob_intr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_13), 16, 16)) -> intp(1, 0, 38)
iob_intr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_14), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_rd_8:
	mov	0x0, %r14
	.word 0xf0db8e60  ! 208: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_1_25:
	setx	0x1d0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaac820  ! 213: FMOVGE	fmovs	%fcc1, %f0, %f31
iob_intr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_15), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb6b50000  ! 215: ORNcc_R	orncc 	%r20, %r0, %r27
	.word 0xa1902000  ! 217: WRPR_GL_I	wrpr	%r0, 0x0000, %-
T1_asi_reg_wr_11:
	mov	0xa, %r14
	.word 0xfaf384a0  ! 219: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbf3cb001  ! 220: SRAX_I	srax	%r18, 0x0001, %r31
	.word 0xb5a448e0  ! 224: FSUBq	dis not found

cpu_intr_1_26:
	setx	0x1e030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_16), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_rd_9:
	mov	0x3c3, %r14
	.word 0xf6db8e80  ! 234: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_1_27:
	setx	0x1d0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73df001  ! 239: SRAX_I	srax	%r23, 0x0001, %r27
T1_asi_reg_rd_10:
	mov	0x3c0, %r14
	.word 0xf2db8e80  ! 241: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_1_28:
	setx	0x1c010a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_29:
	setx	0x1e002b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_17), 16, 16)) -> intp(1, 0, 1a)
	.word 0xbba44840  ! 245: FADDd	faddd	%f48, %f0, %f60
T1_asi_reg_rd_11:
	mov	0x2d, %r14
	.word 0xf0db8e40  ! 248: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_rd_12:
	mov	0x8, %r14
	.word 0xf4db84a0  ! 253: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbda50820  ! 255: FADDs	fadds	%f20, %f0, %f30
cpu_intr_1_30:
	setx	0x1f002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28de109  ! 258: ANDcc_I	andcc 	%r23, 0x0109, %r25
cpu_intr_1_31:
	setx	0x1f0123, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_32:
	setx	0x1e001b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_13:
	mov	0x3c5, %r14
	.word 0xf4db8e40  ! 265: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_18), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_wr_12:
	mov	0x3c0, %r14
	.word 0xfaf38400  ! 278: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb7a94820  ! 286: FMOVCS	fmovs	%fcc1, %f0, %f27
cpu_intr_1_33:
	setx	0x1f0129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a88820  ! 288: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xbba00560  ! 289: FSQRTq	fsqrt	
cpu_intr_1_34:
	setx	0x1d0106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a40920  ! 292: FMULs	fmuls	%f16, %f0, %f25
iob_intr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_19), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_20), 16, 16)) -> intp(1, 0, 4)
	.word 0xbfa00040  ! 302: FMOVd	fmovd	%f0, %f62
	.word 0xb5a9c820  ! 303: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xbfa48860  ! 304: FADDq	dis not found

iob_intr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_21), 16, 16)) -> intp(1, 0, 29)
iob_intr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_22), 16, 16)) -> intp(1, 0, 29)
	.word 0x8395e1fa  ! 313: WRPR_TNPC_I	wrpr	%r23, 0x01fa, %tnpc
	lda	[%r23 + %g0] 0xf0, %f2
	.word 0xbfab8820  ! 319: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xbba00520  ! 320: FSQRTs	fsqrt	
iob_intr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_23), 16, 16)) -> intp(1, 0, c)
iob_intr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_24), 16, 16)) -> intp(1, 0, d)
cpu_intr_1_35:
	setx	0x1e003b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_13:
	mov	0x16, %r14
	.word 0xf4f384a0  ! 327: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbba588c0  ! 328: FSUBd	fsubd	%f22, %f0, %f60
iob_intr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_25), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbfab0820  ! 331: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb80ce0d3  ! 334: AND_I	and 	%r19, 0x00d3, %r28
	.word 0xb7a00560  ! 338: FSQRTq	fsqrt	
T1_asi_reg_rd_14:
	mov	0x3c3, %r14
	.word 0xf0db8e40  ! 339: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbfa80820  ! 340: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
iob_intr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_26), 16, 16)) -> intp(1, 0, 1f)
cpu_intr_1_36:
	setx	0x1e030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaa8820  ! 359: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb7a00540  ! 360: FSQRTd	fsqrt	
	.word 0xb9a58840  ! 361: FADDd	faddd	%f22, %f0, %f28
	.word 0xbfa448c0  ! 362: FSUBd	fsubd	%f48, %f0, %f62
	.word 0xbfab8820  ! 363: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb7ab0820  ! 364: FMOVGU	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_14:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 367: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_27), 16, 16)) -> intp(1, 0, c)
	.word 0xb43ca0f4  ! 370: XNOR_I	xnor 	%r18, 0x00f4, %r26
	.word 0xb7a448c0  ! 371: FSUBd	fsubd	%f48, %f0, %f58
iob_intr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_28), 16, 16)) -> intp(1, 0, 1d)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_37:
	setx	0x1e0107, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_29), 16, 16)) -> intp(1, 0, 11)
cpu_intr_1_38:
	setx	0x1e0105, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_39:
	setx	0x1e013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a44840  ! 382: FADDd	faddd	%f48, %f0, %f26
	.word 0xbfa81420  ! 383: FMOVRNZ	dis not found

T1_asi_reg_rd_15:
	mov	0x0, %r14
	.word 0xf4db8e60  ! 384: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_1_40:
	setx	0x1d0311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a4c8e0  ! 392: FSUBq	dis not found

cpu_intr_1_41:
	setx	0x1c0308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab8820  ! 395: FMOVPOS	fmovs	%fcc1, %f0, %f29
iob_intr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_30), 16, 16)) -> intp(1, 0, 22)
	.word 0xb3abc820  ! 399: FMOVVC	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_16:
	mov	0xd, %r14
	.word 0xf6db8e60  ! 400: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb7a80c20  ! 402: FMOVRLZ	dis not found

	.word 0xb3aa4820  ! 405: FMOVNE	fmovs	%fcc1, %f0, %f25
iob_intr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_31), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_32), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_42:
	setx	0x1f031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa84820  ! 421: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xba440000  ! 423: ADDC_R	addc 	%r16, %r0, %r29
	.word 0xb3a00020  ! 425: FMOVs	fmovs	%f0, %f25
	.word 0xb3a4c9e0  ! 427: FDIVq	dis not found

iob_intr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_33), 16, 16)) -> intp(1, 0, 24)
	.word 0xb9a80820  ! 429: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_15:
	mov	0xa, %r14
	.word 0xfcf38400  ! 431: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T1_asi_reg_rd_17:
	mov	0x33, %r14
	.word 0xfedb8e80  ! 432: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb5a00020  ! 438: FMOVs	fmovs	%f0, %f26
	.word 0xbda9c820  ! 439: FMOVVS	fmovs	%fcc1, %f0, %f30
iob_intr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_34), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb3aa4820  ! 441: FMOVNE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_18:
	mov	0x31, %r14
	.word 0xf0db8e60  ! 442: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbd7c4400  ! 452: MOVR_R	movre	%r17, %r0, %r30
	.word 0xbfaa0820  ! 453: FMOVA	fmovs	%fcc1, %f0, %f31
iob_intr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_35), 16, 16)) -> intp(1, 0, 11)
	.word 0xbfa8c820  ! 457: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb7a40820  ! 458: FADDs	fadds	%f16, %f0, %f27
T1_asi_reg_wr_16:
	mov	0x3c5, %r14
	.word 0xfef384a0  ! 459: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb5349000  ! 460: SRLX_R	srlx	%r18, %r0, %r26
iob_intr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_36), 16, 16)) -> intp(1, 0, 3f)
T1_asi_reg_wr_17:
	mov	0x30, %r14
	.word 0xf2f384a0  ! 465: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_37), 16, 16)) -> intp(1, 0, 1d)
	.word 0xbfa81c20  ! 471: FMOVRGEZ	dis not found

iob_intr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_38), 16, 16)) -> intp(1, 0, 1)
iob_intr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_39), 16, 16)) -> intp(1, 0, 11)
iob_intr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_40), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb1a449a0  ! 477: FDIVs	fdivs	%f17, %f0, %f24
T1_asi_reg_rd_19:
	mov	0x4, %r14
	.word 0xfedb8e80  ! 478: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T1_asi_reg_wr_18:
	mov	0x3c6, %r14
	.word 0xf4f38e40  ! 479: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbbaa8820  ! 480: FMOVG	fmovs	%fcc1, %f0, %f29
iob_intr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_41), 16, 16)) -> intp(1, 0, 2d)
	.word 0xbba4c9a0  ! 486: FDIVs	fdivs	%f19, %f0, %f29
iob_intr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_42), 16, 16)) -> intp(1, 0, 13)
cpu_intr_1_43:
	setx	0x23010e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_44:
	setx	0x22001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53c7001  ! 490: SRAX_I	srax	%r17, 0x0001, %r26
	.word 0xbc256049  ! 491: SUB_I	sub 	%r21, 0x0049, %r30
	.word 0xb3a40860  ! 492: FADDq	dis not found

iob_intr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_43), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb044c000  ! 498: ADDC_R	addc 	%r19, %r0, %r24
	.word 0xbfa88820  ! 499: FMOVLE	fmovs	%fcc1, %f0, %f31
iob_intr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_44), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_rd_20:
	mov	0x32, %r14
	.word 0xf6db8e40  ! 502: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T1_asi_reg_wr_19:
	mov	0x38, %r14
	.word 0xfcf38e40  ! 503: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_1_45:
	setx	0x210303, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_45), 16, 16)) -> intp(1, 0, 4)
	.word 0xb57dc400  ! 513: MOVR_R	movre	%r23, %r0, %r26
	.word 0xb1a509a0  ! 515: FDIVs	fdivs	%f20, %f0, %f24
	.word 0xbba9c820  ! 519: FMOVVS	fmovs	%fcc1, %f0, %f29
cpu_intr_1_46:
	setx	0x22030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_20:
	mov	0x3c6, %r14
	.word 0xf6f38400  ! 525: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_46), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_wr_21:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 532: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_47), 16, 16)) -> intp(1, 0, 17)
	.word 0xb3a80420  ! 537: FMOVRZ	dis not found

	.word 0xbebd8000  ! 538: XNORcc_R	xnorcc 	%r22, %r0, %r31
	.word 0xbba00040  ! 539: FMOVd	fmovd	%f0, %f60
	.word 0xb5a449e0  ! 541: FDIVq	dis not found

	.word 0xb7a58840  ! 542: FADDd	faddd	%f22, %f0, %f58
iob_intr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_48), 16, 16)) -> intp(1, 0, 11)
iob_intr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_49), 16, 16)) -> intp(1, 0, 3c)
	.word 0xbfa00560  ! 551: FSQRTq	fsqrt	
	.word 0xb7a00040  ! 554: FMOVd	fmovd	%f0, %f58
	.word 0xbbaa8820  ! 556: FMOVG	fmovs	%fcc1, %f0, %f29
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xb9a81820  ! 561: FMOVRGZ	fmovs	%fcc3, %f0, %f28
T1_asi_reg_wr_22:
	mov	0x15, %r14
	.word 0xf0f38e40  ! 563: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_50), 16, 16)) -> intp(1, 0, 2b)
	.word 0xa1902000  ! 568: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbba00560  ! 572: FSQRTq	fsqrt	
cpu_intr_1_47:
	setx	0x210306, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_21:
	mov	0x7, %r14
	.word 0xf2db8e80  ! 576: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_51), 16, 16)) -> intp(1, 0, 32)
T1_asi_reg_wr_23:
	mov	0x1c, %r14
	.word 0xfaf38e60  ! 585: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb9a9c820  ! 587: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xbba50860  ! 588: FADDq	dis not found

cpu_intr_1_48:
	setx	0x200202, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_52:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_52), 16, 16)) -> intp(1, 0, 15)
	.word 0xb295e063  ! 594: ORcc_I	orcc 	%r23, 0x0063, %r25
	.word 0xb5aa0820  ! 597: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb5a00040  ! 598: FMOVd	fmovd	%f0, %f26
	.word 0xbe9c8000  ! 600: XORcc_R	xorcc 	%r18, %r0, %r31
T1_asi_reg_rd_22:
	mov	0x4, %r14
	.word 0xf4db8e40  ! 601: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_rd_23:
	mov	0x2f, %r14
	.word 0xf0db8e60  ! 602: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb9a5c820  ! 603: FADDs	fadds	%f23, %f0, %f28
	.word 0xb7a81420  ! 605: FMOVRNZ	dis not found

	.word 0xbe952126  ! 608: ORcc_I	orcc 	%r20, 0x0126, %r31
	.word 0xba85a1b3  ! 609: ADDcc_I	addcc 	%r22, 0x01b3, %r29
iob_intr_1_53:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_53), 16, 16)) -> intp(1, 0, 16)
cpu_intr_1_49:
	setx	0x200008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa81820  ! 613: FMOVRGZ	fmovs	%fcc3, %f0, %f31
T1_asi_reg_rd_24:
	mov	0x1c, %r14
	.word 0xf6db89e0  ! 614: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T1_asi_reg_rd_25:
	mov	0x6, %r14
	.word 0xfedb8400  ! 616: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb8bd60af  ! 618: XNORcc_I	xnorcc 	%r21, 0x00af, %r28
	.word 0xbda80820  ! 619: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xbda80820  ! 622: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xbba94820  ! 623: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb1a4c9a0  ! 625: FDIVs	fdivs	%f19, %f0, %f24
T1_asi_reg_wr_24:
	mov	0x3c3, %r14
	.word 0xfcf38e80  ! 626: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xba1c609c  ! 627: XOR_I	xor 	%r17, 0x009c, %r29
	.word 0xbda00020  ! 630: FMOVs	fmovs	%f0, %f30
T1_asi_reg_wr_25:
	mov	0x3c0, %r14
	.word 0xfef38e40  ! 631: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_rd_26:
	mov	0x3c5, %r14
	.word 0xf6db8e40  ! 634: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_50:
	setx	0x20021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba50940  ! 639: FMULd	fmuld	%f20, %f0, %f60
T1_asi_reg_rd_27:
	mov	0x3c8, %r14
	.word 0xf0db8e40  ! 642: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_54:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_54), 16, 16)) -> intp(1, 0, 2c)
iob_intr_1_55:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_55), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_51:
	setx	0x21031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb57c0400  ! 650: MOVR_R	movre	%r16, %r0, %r26
iob_intr_1_56:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_56), 16, 16)) -> intp(1, 0, 5)
cpu_intr_1_52:
	setx	0x21031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_26:
	mov	0x24, %r14
	.word 0xfcf38e40  ! 657: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_57:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_57), 16, 16)) -> intp(1, 0, 15)
	.word 0xb7a488a0  ! 661: FSUBs	fsubs	%f18, %f0, %f27
	.word 0xb9a54960  ! 662: FMULq	dis not found

cpu_intr_1_53:
	setx	0x21032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa8c820  ! 666: FMOVL	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_27:
	mov	0x29, %r14
	.word 0xfef38e40  ! 667: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_1_54:
	setx	0x220314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda4c840  ! 674: FADDd	faddd	%f50, %f0, %f30
iob_intr_1_58:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_58), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbda88820  ! 678: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xbda81820  ! 679: FMOVRGZ	fmovs	%fcc3, %f0, %f30
cpu_intr_1_55:
	setx	0x20030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a54840  ! 681: FADDd	faddd	%f52, %f0, %f56
	.word 0xb1a548a0  ! 685: FSUBs	fsubs	%f21, %f0, %f24
	.word 0xb3a448c0  ! 686: FSUBd	fsubd	%f48, %f0, %f56
T1_asi_reg_rd_28:
	mov	0x3c6, %r14
	.word 0xf2db89e0  ! 687: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb5aa4820  ! 689: FMOVNE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_28:
	mov	0x33, %r14
	.word 0xfef389e0  ! 690: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb5a5c840  ! 692: FADDd	faddd	%f54, %f0, %f26
	.word 0xb41da091  ! 696: XOR_I	xor 	%r22, 0x0091, %r26
T1_asi_reg_wr_29:
	mov	0x1, %r14
	.word 0xfef38e80  ! 699: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_1_59:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_59), 16, 16)) -> intp(1, 0, 17)
T1_asi_reg_wr_30:
	mov	0x3c3, %r14
	.word 0xfaf38400  ! 704: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_1_56:
	setx	0x23003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda54820  ! 709: FADDs	fadds	%f21, %f0, %f30
cpu_intr_1_57:
	setx	0x210320, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_60:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_60), 16, 16)) -> intp(1, 0, 20)
	.word 0xb7a00040  ! 715: FMOVd	fmovd	%f0, %f58
	.word 0xbb3df001  ! 716: SRAX_I	srax	%r23, 0x0001, %r29
T1_asi_reg_wr_31:
	mov	0x28, %r14
	.word 0xfaf38e80  ! 719: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T1_asi_reg_wr_32:
	mov	0x1a, %r14
	.word 0xfef38e40  ! 720: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_1_58:
	setx	0x230322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_59:
	setx	0x22011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r17 + %g0] 0xf0, %f2
iob_intr_1_61:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_61), 16, 16)) -> intp(1, 0, 2)
	.word 0xb68d0000  ! 727: ANDcc_R	andcc 	%r20, %r0, %r27
	.word 0xb3aac820  ! 729: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xbfa00520  ! 732: FSQRTs	fsqrt	
	.word 0x8995a0c5  ! 733: WRPR_TICK_I	wrpr	%r22, 0x00c5, %tick
iob_intr_1_62:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_62), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_63:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_63), 16, 16)) -> intp(1, 0, d)
	.word 0xb9a40820  ! 744: FADDs	fadds	%f16, %f0, %f28
T1_asi_reg_rd_29:
	mov	0x3c6, %r14
	.word 0xf4db89e0  ! 746: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb5a80420  ! 747: FMOVRZ	dis not found

	.word 0xbba4c860  ! 750: FADDq	dis not found

	.word 0xb5a449e0  ! 752: FDIVq	dis not found

T1_asi_reg_wr_33:
	mov	0xf, %r14
	.word 0xfaf38e40  ! 753: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_1_60:
	setx	0x200006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80820  ! 756: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb1641800  ! 757: MOVcc_R	<illegal instruction>
iob_intr_1_64:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_64), 16, 16)) -> intp(1, 0, 12)
T1_asi_reg_rd_30:
	mov	0xd, %r14
	.word 0xf8db89e0  ! 761: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb9a4c860  ! 762: FADDq	dis not found

iob_intr_1_65:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_65), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_61:
	setx	0x21010a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_31:
	mov	0x0, %r14
	.word 0xfedb8e60  ! 775: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_1_62:
	setx	0x230305, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_63:
	setx	0x200314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80420  ! 780: FMOVRZ	dis not found

T1_asi_reg_rd_32:
	mov	0x7, %r14
	.word 0xf8db84a0  ! 786: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T1_asi_reg_rd_33:
	mov	0x3c4, %r14
	.word 0xf4db89e0  ! 787: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb29d4000  ! 789: XORcc_R	xorcc 	%r21, %r0, %r25
	.word 0xb1aac820  ! 792: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb7643801  ! 794: MOVcc_I	<illegal instruction>
cpu_intr_1_64:
	setx	0x22001b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_65:
	setx	0x21003c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_34:
	mov	0x1d, %r14
	.word 0xf2db84a0  ! 799: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T1_asi_reg_wr_34:
	mov	0x35, %r14
	.word 0xfaf38e40  ! 801: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbba549c0  ! 802: FDIVd	fdivd	%f52, %f0, %f60
cpu_intr_1_66:
	setx	0x23011c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_35:
	mov	0x3c2, %r14
	.word 0xf2db8400  ! 808: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T1_asi_reg_rd_36:
	mov	0x12, %r14
	.word 0xfcdb89e0  ! 809: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_1_66:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_66), 16, 16)) -> intp(1, 0, 20)
cpu_intr_1_67:
	setx	0x200238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a4c8a0  ! 814: FSUBs	fsubs	%f19, %f0, %f24
cpu_intr_1_68:
	setx	0x210219, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_67:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_67), 16, 16)) -> intp(1, 0, 4)
	.word 0xbda00540  ! 821: FSQRTd	fsqrt	
T1_asi_reg_wr_35:
	mov	0x26, %r14
	.word 0xf6f384a0  ! 822: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_1_68:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_68), 16, 16)) -> intp(1, 0, 18)
iob_intr_1_69:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_69), 16, 16)) -> intp(1, 0, 18)
	lda	[%r17 + %g0] 0xf0, %f2
iob_intr_1_70:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_70), 16, 16)) -> intp(1, 0, c)
	.word 0xbda00540  ! 831: FSQRTd	fsqrt	
T1_asi_reg_rd_37:
	mov	0x24, %r14
	.word 0xfcdb89e0  ! 833: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_1_69:
	setx	0x21021a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_38:
	mov	0xa, %r14
	.word 0xfadb8e40  ! 839: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_71:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_71), 16, 16)) -> intp(1, 0, 19)
	.word 0xbfa488e0  ! 843: FSUBq	dis not found

	.word 0xbda449a0  ! 844: FDIVs	fdivs	%f17, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_72:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_72), 16, 16)) -> intp(1, 0, 17)
	.word 0xbda4c920  ! 852: FMULs	fmuls	%f19, %f0, %f30
	.word 0xb3a00040  ! 854: FMOVd	fmovd	%f0, %f56
cpu_intr_1_70:
	setx	0x230007, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_73:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_73), 16, 16)) -> intp(1, 0, 15)
T1_asi_reg_wr_36:
	mov	0x3c8, %r14
	.word 0xf6f384a0  ! 859: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T1_asi_reg_rd_39:
	mov	0x8, %r14
	.word 0xfedb8e40  ! 860: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T1_asi_reg_wr_37:
	mov	0x37, %r14
	.word 0xfaf38e40  ! 861: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbe040000  ! 862: ADD_R	add 	%r16, %r0, %r31
	.word 0xb5a4c8a0  ! 863: FSUBs	fsubs	%f19, %f0, %f26
	.word 0xb9a00560  ! 865: FSQRTq	fsqrt	
iob_intr_1_74:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_74), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_wr_38:
	mov	0x3c2, %r14
	.word 0xfef38e80  ! 871: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_1_71:
	setx	0x200103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd2c4000  ! 874: SLL_R	sll 	%r17, %r0, %r30
	lda	[%r17 + %g0] 0xf0, %f2
T1_asi_reg_wr_39:
	mov	0x2b, %r14
	.word 0xf6f38e80  ! 883: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T1_asi_reg_wr_40:
	mov	0x37, %r14
	.word 0xf8f38e40  ! 887: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_72:
	setx	0x220333, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_40:
	mov	0x19, %r14
	.word 0xfadb8e60  ! 901: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbba549e0  ! 902: FDIVq	dis not found

iob_intr_1_75:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_75), 16, 16)) -> intp(1, 0, 2e)
cpu_intr_1_73:
	setx	0x210328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8244000  ! 906: SUB_R	sub 	%r17, %r0, %r28
	.word 0xbba4c960  ! 909: FMULq	dis not found

cpu_intr_1_74:
	setx	0x26012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb34c000  ! 913: SRL_R	srl 	%r19, %r0, %r29
	.word 0xb1a48940  ! 915: FMULd	fmuld	%f18, %f0, %f24
	.word 0xb3a449c0  ! 916: FDIVd	fdivd	%f48, %f0, %f56
	.word 0xb92d4000  ! 918: SLL_R	sll 	%r21, %r0, %r28
	.word 0xbfa488a0  ! 919: FSUBs	fsubs	%f18, %f0, %f31
iob_intr_1_76:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_76), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_wr_41:
	mov	0x38, %r14
	.word 0xf4f384a0  ! 929: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_1_75:
	setx	0x26013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a94820  ! 932: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xbfa449c0  ! 935: FDIVd	fdivd	%f48, %f0, %f62
	.word 0xb7a00520  ! 938: FSQRTs	fsqrt	
	.word 0xb7abc820  ! 940: FMOVVC	fmovs	%fcc1, %f0, %f27
	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xba9d4000  ! 947: XORcc_R	xorcc 	%r21, %r0, %r29
	.word 0xb9a80820  ! 950: FMOVN	fmovs	%fcc1, %f0, %f28
cpu_intr_1_76:
	setx	0x270336, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_42:
	mov	0x1d, %r14
	.word 0xfef38e80  ! 953: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T1_asi_reg_rd_41:
	mov	0x21, %r14
	.word 0xf2db84a0  ! 954: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbda9c820  ! 955: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb9a98820  ! 957: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xb5a40860  ! 959: FADDq	dis not found

T1_asi_reg_rd_42:
	mov	0x3c3, %r14
	.word 0xf4db8e40  ! 960: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbba00040  ! 961: FMOVd	fmovd	%f0, %f60
	.word 0xb6a5e015  ! 965: SUBcc_I	subcc 	%r23, 0x0015, %r27
cpu_intr_1_77:
	setx	0x240335, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_43:
	mov	0x2b, %r14
	.word 0xf6db84a0  ! 968: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbba8c820  ! 975: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xb0150000  ! 977: OR_R	or 	%r20, %r0, %r24
cpu_intr_1_78:
	setx	0x260333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf643801  ! 982: MOVcc_I	<illegal instruction>
cpu_intr_1_79:
	setx	0x240334, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_77:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_77), 16, 16)) -> intp(1, 0, 37)
iob_intr_1_78:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_78), 16, 16)) -> intp(1, 0, a)
T1_asi_reg_rd_44:
	mov	0x3c5, %r14
	.word 0xf8db84a0  ! 989: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_1_80:
	setx	0x26033c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_81:
	setx	0x250237, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_82:
	setx	0x270103, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_79:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_79), 16, 16)) -> intp(1, 0, 14)
	.word 0xb9a4c8c0  ! 998: FSUBd	fsubd	%f50, %f0, %f28
iob_intr_1_80:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_80), 16, 16)) -> intp(1, 0, b)
iob_intr_1_81:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_81), 16, 16)) -> intp(1, 0, a)
cpu_intr_1_83:
	setx	0x270309, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_82:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_82), 16, 16)) -> intp(1, 0, 2c)
	.word 0xbfa5c940  ! 1009: FMULd	fmuld	%f54, %f0, %f62
T1_asi_reg_wr_43:
	mov	0x37, %r14
	.word 0xf4f38e80  ! 1010: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T1_asi_reg_wr_44:
	mov	0x29, %r14
	.word 0xf8f38e40  ! 1014: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbd510000  ! 1016: RDPR_TICK	<illegal instruction>
T1_asi_reg_wr_45:
	mov	0x37, %r14
	.word 0xf6f38e60  ! 1019: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb8ac4000  ! 1020: ANDNcc_R	andncc 	%r17, %r0, %r28
	.word 0xb3a00560  ! 1021: FSQRTq	fsqrt	
	.word 0xb63ce142  ! 1023: XNOR_I	xnor 	%r19, 0x0142, %r27
iob_intr_1_83:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_83), 16, 16)) -> intp(1, 0, 2)
cpu_intr_1_84:
	setx	0x260022, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_84:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_84), 16, 16)) -> intp(1, 0, 22)
T1_asi_reg_wr_46:
	mov	0x12, %r14
	.word 0xfaf384a0  ! 1028: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb5a84820  ! 1036: FMOVE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_85:
	setx	0x26010b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_86:
	setx	0x250230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb32cc000  ! 1049: SLL_R	sll 	%r19, %r0, %r25
	.word 0xb2bdc000  ! 1052: XNORcc_R	xnorcc 	%r23, %r0, %r25
	.word 0xbba90820  ! 1053: FMOVLEU	fmovs	%fcc1, %f0, %f29
iob_intr_1_85:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_85), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_86:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_86), 16, 16)) -> intp(1, 0, 4)
iob_intr_1_87:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_87), 16, 16)) -> intp(1, 0, 10)
T1_asi_reg_wr_47:
	mov	0x3c0, %r14
	.word 0xfaf389e0  ! 1063: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_1_87:
	setx	0x270002, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_88:
	setx	0x250323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb17ca401  ! 1072: MOVR_I	movre	%r18, 0x1, %r24
cpu_intr_1_89:
	setx	0x250102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb43d0000  ! 1076: XNOR_R	xnor 	%r20, %r0, %r26
	.word 0xbfabc820  ! 1084: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xbbab4820  ! 1086: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb9a589e0  ! 1089: FDIVq	dis not found

cpu_intr_1_90:
	setx	0x270113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_88:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_88), 16, 16)) -> intp(1, 0, 29)
cpu_intr_1_91:
	setx	0x27033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 1102: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb9a00540  ! 1104: FSQRTd	fsqrt	
T1_asi_reg_rd_45:
	mov	0xa, %r14
	.word 0xfedb8e40  ! 1110: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_1_92:
	setx	0x24002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a81820  ! 1116: FMOVRGZ	fmovs	%fcc3, %f0, %f28
iob_intr_1_89:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_89), 16, 16)) -> intp(1, 0, 13)
T1_asi_reg_rd_46:
	mov	0x30, %r14
	.word 0xf4db8e40  ! 1119: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_rd_47:
	mov	0x10, %r14
	.word 0xfcdb89e0  ! 1122: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_1_93:
	setx	0x240323, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_90:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_90), 16, 16)) -> intp(1, 0, 28)
	.word 0xb3a00540  ! 1127: FSQRTd	fsqrt	
	.word 0xb9a88820  ! 1128: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xb5a84820  ! 1129: FMOVE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_94:
	setx	0x24010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a589c0  ! 1131: FDIVd	fdivd	%f22, %f0, %f58
T1_asi_reg_wr_48:
	mov	0x26, %r14
	.word 0xfaf389e0  ! 1134: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_1_91:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_91), 16, 16)) -> intp(1, 0, 36)
	.word 0xb735a001  ! 1137: SRL_I	srl 	%r22, 0x0001, %r27
T1_asi_reg_rd_48:
	mov	0x3c3, %r14
	.word 0xf2db8e40  ! 1138: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_1_95:
	setx	0x270109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_92:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_92), 16, 16)) -> intp(1, 0, 29)
	.word 0xb1aa8820  ! 1144: FMOVG	fmovs	%fcc1, %f0, %f24
cpu_intr_1_96:
	setx	0x24031a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_93:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_93), 16, 16)) -> intp(1, 0, 23)
	.word 0xbba589a0  ! 1149: FDIVs	fdivs	%f22, %f0, %f29
T1_asi_reg_wr_49:
	mov	0x5, %r14
	.word 0xf4f38e40  ! 1150: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_94:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_94), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb5a80820  ! 1156: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xbfa58920  ! 1158: FMULs	fmuls	%f22, %f0, %f31
	.word 0xbda84820  ! 1159: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xbba409a0  ! 1161: FDIVs	fdivs	%f16, %f0, %f29
iob_intr_1_95:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_95), 16, 16)) -> intp(1, 0, 5)
iob_intr_1_96:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_96), 16, 16)) -> intp(1, 0, 23)
	.word 0xb625c000  ! 1168: SUB_R	sub 	%r23, %r0, %r27
	.word 0xbba54820  ! 1169: FADDs	fadds	%f21, %f0, %f29
iob_intr_1_97:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_97), 16, 16)) -> intp(1, 0, 1f)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_50:
	mov	0x38, %r14
	.word 0xfcf389e0  ! 1174: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_1_98:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_98), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_wr_51:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 1178: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb5a50960  ! 1179: FMULq	dis not found

	.word 0xb3a00040  ! 1180: FMOVd	fmovd	%f0, %f56
iob_intr_1_99:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_99), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_wr_52:
	mov	0x3c3, %r14
	.word 0xf0f38e60  ! 1187: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb3a8c820  ! 1188: FMOVL	fmovs	%fcc1, %f0, %f25
cpu_intr_1_97:
	setx	0x270026, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_98:
	setx	0x260135, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda50840  ! 1195: FADDd	faddd	%f20, %f0, %f30
iob_intr_1_100:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_100), 16, 16)) -> intp(1, 0, 2c)
	.word 0xbd348000  ! 1198: SRL_R	srl 	%r18, %r0, %r30
cpu_intr_1_99:
	setx	0x27011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba408a0  ! 1200: FSUBs	fsubs	%f16, %f0, %f29
iob_intr_1_101:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_101), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbda88820  ! 1204: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb2ad0000  ! 1206: ANDNcc_R	andncc 	%r20, %r0, %r25
cpu_intr_1_100:
	setx	0x250019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a589c0  ! 1213: FDIVd	fdivd	%f22, %f0, %f28
	.word 0xbda40940  ! 1214: FMULd	fmuld	%f16, %f0, %f30
	.word 0xbda4c8a0  ! 1215: FSUBs	fsubs	%f19, %f0, %f30
	.word 0xbbaa4820  ! 1221: FMOVNE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_53:
	mov	0x2d, %r14
	.word 0xf2f38e40  ! 1223: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbfaa4820  ! 1224: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb3a80820  ! 1226: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_54:
	mov	0x17, %r14
	.word 0xfaf38e60  ! 1228: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_1_102:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_102), 16, 16)) -> intp(1, 0, 2c)
T1_asi_reg_rd_49:
	mov	0x27, %r14
	.word 0xfadb8e40  ! 1232: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_50:
	mov	0x3c6, %r14
	.word 0xf6db8400  ! 1238: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb9a40940  ! 1239: FMULd	fmuld	%f16, %f0, %f28
	.word 0xb5a588c0  ! 1240: FSUBd	fsubd	%f22, %f0, %f26
iob_intr_1_103:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_103), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb1a84820  ! 1247: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xbda5c9a0  ! 1248: FDIVs	fdivs	%f23, %f0, %f30
	.word 0xbba80420  ! 1253: FMOVRZ	dis not found

cpu_intr_1_101:
	setx	0x270002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba94a18b  ! 1255: ORcc_I	orcc 	%r18, 0x018b, %r29
	.word 0xb7ab0820  ! 1257: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb08d8000  ! 1258: ANDcc_R	andcc 	%r22, %r0, %r24
iob_intr_1_104:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_104), 16, 16)) -> intp(1, 0, 19)
	.word 0xbfaa0820  ! 1262: FMOVA	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_55:
	mov	0x26, %r14
	.word 0xf0f38400  ! 1264: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbfab8820  ! 1267: FMOVPOS	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_56:
	mov	0x24, %r14
	.word 0xf6f38e40  ! 1268: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbba4c940  ! 1276: FMULd	fmuld	%f50, %f0, %f60
cpu_intr_1_102:
	setx	0x250005, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_103:
	setx	0x260224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda48960  ! 1282: FMULq	dis not found

cpu_intr_1_104:
	setx	0x27023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a50940  ! 1285: FMULd	fmuld	%f20, %f0, %f58
cpu_intr_1_105:
	setx	0x25021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_106:
	setx	0x25001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfabc820  ! 1290: FMOVVC	fmovs	%fcc1, %f0, %f31
iob_intr_1_105:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_105), 16, 16)) -> intp(1, 0, 5)
	.word 0xbfa90820  ! 1293: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb7a00540  ! 1297: FSQRTd	fsqrt	
cpu_intr_1_107:
	setx	0x260118, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_108:
	setx	0x27000b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_106:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_106), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_wr_57:
	mov	0x2d, %r14
	.word 0xfaf38e60  ! 1310: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_1_109:
	setx	0x250023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a488c0  ! 1315: FSUBd	fsubd	%f18, %f0, %f56
	.word 0xb7a00540  ! 1321: FSQRTd	fsqrt	
cpu_intr_1_110:
	setx	0x26030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_51:
	mov	0x3c2, %r14
	.word 0xf2db84a0  ! 1325: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb9a548e0  ! 1328: FSUBq	dis not found

	.word 0xb1a44920  ! 1329: FMULs	fmuls	%f17, %f0, %f24
T1_asi_reg_wr_58:
	mov	0x19, %r14
	.word 0xf8f38e40  ! 1330: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xbba9c820  ! 1336: FMOVVS	fmovs	%fcc1, %f0, %f29
iob_intr_1_107:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_107), 16, 16)) -> intp(1, 0, 28)
T1_asi_reg_rd_52:
	mov	0x2b, %r14
	.word 0xf8db84a0  ! 1338: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb5a40820  ! 1339: FADDs	fadds	%f16, %f0, %f26
	.word 0xb1aac820  ! 1340: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb1a84820  ! 1341: FMOVE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_53:
	mov	0x28, %r14
	.word 0xf4db8e40  ! 1343: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_1_108:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_108), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_rd_54:
	mov	0x2c, %r14
	.word 0xf6db8e60  ! 1345: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbba81420  ! 1346: FMOVRNZ	dis not found

cpu_intr_1_111:
	setx	0x24002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba1c4000  ! 1348: XOR_R	xor 	%r17, %r0, %r29
iob_intr_1_109:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_109), 16, 16)) -> intp(1, 0, 36)
cpu_intr_1_112:
	setx	0x260016, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_55:
	mov	0x29, %r14
	.word 0xf8db8e60  ! 1352: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_1_110:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_110), 16, 16)) -> intp(1, 0, 14)
	.word 0xb5a00020  ! 1354: FMOVs	fmovs	%f0, %f26
cpu_intr_1_113:
	setx	0x260204, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_56:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 1359: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbfa00520  ! 1368: FSQRTs	fsqrt	
T1_asi_reg_wr_59:
	mov	0x19, %r14
	.word 0xf4f38e80  ! 1371: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T1_asi_reg_rd_57:
	mov	0x19, %r14
	.word 0xf4db89e0  ! 1373: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbfa00540  ! 1374: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_111:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_111), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_rd_58:
	mov	0x3c1, %r14
	.word 0xfcdb8e80  ! 1380: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T1_asi_reg_wr_60:
	mov	0x18, %r14
	.word 0xfaf38e40  ! 1381: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_wr_61:
	mov	0x1e, %r14
	.word 0xf2f38e80  ! 1382: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb5aa8820  ! 1385: FMOVG	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_59:
	mov	0xb, %r14
	.word 0xf8db8e40  ! 1386: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_rd_60:
	mov	0x3c8, %r14
	.word 0xf0db8e80  ! 1389: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_1_112:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_112), 16, 16)) -> intp(1, 0, 1a)
cpu_intr_1_114:
	setx	0x2b0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a5c8e0  ! 1392: FSUBq	dis not found

cpu_intr_1_115:
	setx	0x2b012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab8820  ! 1395: FMOVPOS	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_61:
	mov	0x9, %r14
	.word 0xfadb8e80  ! 1400: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_1_113:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_113), 16, 16)) -> intp(1, 0, 29)
T1_asi_reg_wr_62:
	mov	0x31, %r14
	.word 0xfaf389e0  ! 1402: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb1a548a0  ! 1404: FSUBs	fsubs	%f21, %f0, %f24
	.word 0xbaa5602a  ! 1409: SUBcc_I	subcc 	%r21, 0x002a, %r29
cpu_intr_1_116:
	setx	0x280110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbac44000  ! 1411: ADDCcc_R	addccc 	%r17, %r0, %r29
cpu_intr_1_117:
	setx	0x280023, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_62:
	mov	0x3c3, %r14
	.word 0xf2db8e40  ! 1420: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_wr_63:
	mov	0xe, %r14
	.word 0xf2f38e60  ! 1422: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_1_114:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_114), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_wr_64:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 1428: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb12da001  ! 1429: SLL_I	sll 	%r22, 0x0001, %r24
	.word 0xb9a54820  ! 1433: FADDs	fadds	%f21, %f0, %f28
	.word 0xb5a00560  ! 1434: FSQRTq	fsqrt	
	.word 0xb7a00040  ! 1438: FMOVd	fmovd	%f0, %f58
	.word 0xb4444000  ! 1439: ADDC_R	addc 	%r17, %r0, %r26
	.word 0xb1a589c0  ! 1440: FDIVd	fdivd	%f22, %f0, %f24
cpu_intr_1_118:
	setx	0x2b0120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba40860  ! 1444: FADDq	dis not found

cpu_intr_1_119:
	setx	0x280037, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a00020  ! 1447: FMOVs	fmovs	%f0, %f28
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xb3aac820  ! 1451: FMOVGE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_65:
	mov	0x20, %r14
	.word 0xf4f38e40  ! 1452: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbba589a0  ! 1454: FDIVs	fdivs	%f22, %f0, %f29
	.word 0xb1a00040  ! 1455: FMOVd	fmovd	%f0, %f24
cpu_intr_1_120:
	setx	0x2b0331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c820  ! 1460: FADDs	fadds	%f19, %f0, %f31
	.word 0x8194e180  ! 1464: WRPR_TPC_I	wrpr	%r19, 0x0180, %tpc
	.word 0xba2d2199  ! 1465: ANDN_I	andn 	%r20, 0x0199, %r29
	.word 0xbda81c20  ! 1467: FMOVRGEZ	dis not found

	.word 0xbfa84820  ! 1468: FMOVE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_63:
	mov	0x5, %r14
	.word 0xfadb84a0  ! 1470: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb5aa0820  ! 1471: FMOVA	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_64:
	mov	0x25, %r14
	.word 0xf2db8e80  ! 1472: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T1_asi_reg_wr_66:
	mov	0x3c8, %r14
	.word 0xf0f389e0  ! 1473: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb49c605b  ! 1474: XORcc_I	xorcc 	%r17, 0x005b, %r26
cpu_intr_1_121:
	setx	0x2b0130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a81820  ! 1482: FMOVRGZ	fmovs	%fcc3, %f0, %f26
iob_intr_1_115:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_115), 16, 16)) -> intp(1, 0, 7)
T1_asi_reg_wr_67:
	mov	0x4, %r14
	.word 0xfef38e40  ! 1484: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_1_122:
	setx	0x290107, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_68:
	mov	0x16, %r14
	.word 0xf6f38400  ! 1486: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T1_asi_reg_wr_69:
	mov	0x10, %r14
	.word 0xf8f384a0  ! 1487: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_1_123:
	setx	0x2b0223, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_116:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_116), 16, 16)) -> intp(1, 0, 30)
T1_asi_reg_wr_70:
	mov	0x1f, %r14
	.word 0xfcf38e80  ! 1500: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_1_117:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_117), 16, 16)) -> intp(1, 0, 32)
T1_asi_reg_wr_71:
	mov	0x36, %r14
	.word 0xf6f38e40  ! 1502: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb3a00540  ! 1503: FSQRTd	fsqrt	
iob_intr_1_118:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_118), 16, 16)) -> intp(1, 0, 7)
	.word 0xb7a80820  ! 1506: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb37dc400  ! 1510: MOVR_R	movre	%r23, %r0, %r25
T1_asi_reg_rd_65:
	mov	0x3c1, %r14
	.word 0xf0db8400  ! 1514: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_1_119:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_119), 16, 16)) -> intp(1, 0, 18)
	.word 0xb5350000  ! 1517: SRL_R	srl 	%r20, %r0, %r26
	.word 0xb6c4a1d5  ! 1521: ADDCcc_I	addccc 	%r18, 0x01d5, %r27
	.word 0xb5a80820  ! 1523: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xbfa80820  ! 1526: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb9a50940  ! 1527: FMULd	fmuld	%f20, %f0, %f28
	.word 0xbba81820  ! 1529: FMOVRGZ	fmovs	%fcc3, %f0, %f29
T1_asi_reg_rd_66:
	mov	0xf, %r14
	.word 0xf2db8e60  ! 1531: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb7a90820  ! 1533: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb7a9c820  ! 1534: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb3a548e0  ! 1536: FSUBq	dis not found

	.word 0xb5a54860  ! 1539: FADDq	dis not found

	.word 0xbda508c0  ! 1541: FSUBd	fsubd	%f20, %f0, %f30
	.word 0xb49de0e0  ! 1542: XORcc_I	xorcc 	%r23, 0x00e0, %r26
	.word 0xb2b48000  ! 1543: SUBCcc_R	orncc 	%r18, %r0, %r25
	.word 0xb7a4c920  ! 1545: FMULs	fmuls	%f19, %f0, %f27
	.word 0xb7a00560  ! 1547: FSQRTq	fsqrt	
	.word 0xb9a80820  ! 1548: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xbda509c0  ! 1550: FDIVd	fdivd	%f20, %f0, %f30
T1_asi_reg_rd_67:
	mov	0x2b, %r14
	.word 0xf6db89e0  ! 1552: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xbba548e0  ! 1554: FSUBq	dis not found

cpu_intr_1_124:
	setx	0x2a0214, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_72:
	mov	0x24, %r14
	.word 0xf6f38e40  ! 1557: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_125:
	setx	0x29013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2158000  ! 1561: OR_R	or 	%r22, %r0, %r25
T1_asi_reg_rd_68:
	mov	0x29, %r14
	.word 0xfadb89e0  ! 1563: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_1_126:
	setx	0x290322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_127:
	setx	0x290118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda50920  ! 1568: FMULs	fmuls	%f20, %f0, %f30
cpu_intr_1_128:
	setx	0x280101, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_120:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_120), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb9aa4820  ! 1573: FMOVNE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_129:
	setx	0x2a0333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaac820  ! 1575: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb5a94820  ! 1577: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb2250000  ! 1578: SUB_R	sub 	%r20, %r0, %r25
	.word 0xb7a44940  ! 1584: FMULd	fmuld	%f48, %f0, %f58
iob_intr_1_121:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_121), 16, 16)) -> intp(1, 0, 4)
	.word 0xb834c000  ! 1591: SUBC_R	orn 	%r19, %r0, %r28
	.word 0xbbaa0820  ! 1592: FMOVA	fmovs	%fcc1, %f0, %f29
iob_intr_1_122:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_122), 16, 16)) -> intp(1, 0, 2b)
	.word 0xa1902002  ! 1597: WRPR_GL_I	wrpr	%r0, 0x0002, %-
iob_intr_1_123:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_123), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_rd_69:
	mov	0x26, %r14
	.word 0xf0db84a0  ! 1602: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb5a81c20  ! 1605: FMOVRGEZ	dis not found

	.word 0xb5a00040  ! 1606: FMOVd	fmovd	%f0, %f26
T1_asi_reg_rd_70:
	mov	0x14, %r14
	.word 0xf8db8e60  ! 1609: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xbe354000  ! 1610: SUBC_R	orn 	%r21, %r0, %r31
	.word 0xb3a8c820  ! 1611: FMOVL	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_71:
	mov	0xc, %r14
	.word 0xfadb8e40  ! 1613: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb3ab8820  ! 1617: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb5a50920  ! 1618: FMULs	fmuls	%f20, %f0, %f26
	.word 0xbda81c20  ! 1622: FMOVRGEZ	dis not found

	.word 0xb3aa0820  ! 1626: FMOVA	fmovs	%fcc1, %f0, %f25
cpu_intr_1_130:
	setx	0x290220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfab0820  ! 1628: FMOVGU	fmovs	%fcc1, %f0, %f31
iob_intr_1_124:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_124), 16, 16)) -> intp(1, 0, 2c)
T1_asi_reg_wr_73:
	mov	0x1b, %r14
	.word 0xfcf38400  ! 1636: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb3a00540  ! 1638: FSQRTd	fsqrt	
cpu_intr_1_131:
	setx	0x2b0110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba04612e  ! 1642: ADD_I	add 	%r17, 0x012e, %r29
iob_intr_1_125:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_125), 16, 16)) -> intp(1, 0, 9)
iob_intr_1_126:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_126), 16, 16)) -> intp(1, 0, 2e)
T1_asi_reg_rd_72:
	mov	0x1b, %r14
	.word 0xfcdb8e80  ! 1650: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb9a40960  ! 1659: FMULq	dis not found

	.word 0xbda81420  ! 1662: FMOVRNZ	dis not found

	.word 0xb48ce174  ! 1666: ANDcc_I	andcc 	%r19, 0x0174, %r26
	.word 0xbeb4608c  ! 1667: SUBCcc_I	orncc 	%r17, 0x008c, %r31
cpu_intr_1_132:
	setx	0x290323, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_73:
	mov	0x3c7, %r14
	.word 0xfadb8e80  ! 1674: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_1_127:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_127), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_rd_74:
	mov	0x3c5, %r14
	.word 0xfcdb8400  ! 1679: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_1_128:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_128), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb7a94820  ! 1681: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb3aa0820  ! 1682: FMOVA	fmovs	%fcc1, %f0, %f25
cpu_intr_1_133:
	setx	0x280302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a5c9a0  ! 1690: FDIVs	fdivs	%f23, %f0, %f28
	.word 0xb1a549a0  ! 1692: FDIVs	fdivs	%f21, %f0, %f24
	.word 0xb7a50860  ! 1693: FADDq	dis not found

cpu_intr_1_134:
	setx	0x28032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa589e0  ! 1696: FDIVq	dis not found

	.word 0xbda00540  ! 1699: FSQRTd	fsqrt	
iob_intr_1_129:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_129), 16, 16)) -> intp(1, 0, 2b)
T1_asi_reg_rd_75:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 1703: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_130:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_130), 16, 16)) -> intp(1, 0, 8)
iob_intr_1_131:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_131), 16, 16)) -> intp(1, 0, 3a)
	.word 0xba1c614c  ! 1706: XOR_I	xor 	%r17, 0x014c, %r29
iob_intr_1_132:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_132), 16, 16)) -> intp(1, 0, 3e)
iob_intr_1_133:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_133), 16, 16)) -> intp(1, 0, 15)
	.word 0xb7ab8820  ! 1713: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xb5a81c20  ! 1714: FMOVRGEZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_135:
	setx	0x2a001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a5c920  ! 1717: FMULs	fmuls	%f23, %f0, %f26
	.word 0xbda00540  ! 1719: FSQRTd	fsqrt	
	.word 0xb005c000  ! 1722: ADD_R	add 	%r23, %r0, %r24
	.word 0xb3ab8820  ! 1723: FMOVPOS	fmovs	%fcc1, %f0, %f25
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xb20ce08f  ! 1726: AND_I	and 	%r19, 0x008f, %r25
T1_asi_reg_rd_76:
	mov	0x1d, %r14
	.word 0xf8db8e40  ! 1728: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb3a489e0  ! 1729: FDIVq	dis not found

cpu_intr_1_136:
	setx	0x290305, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_77:
	mov	0x3c4, %r14
	.word 0xf4db84a0  ! 1732: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbda81420  ! 1734: FMOVRNZ	dis not found

	.word 0xbba88820  ! 1735: FMOVLE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_78:
	mov	0x8, %r14
	.word 0xf4db89e0  ! 1736: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_1_134:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_134), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_wr_74:
	mov	0x32, %r14
	.word 0xfef389e0  ! 1741: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_rd_79:
	mov	0x30, %r14
	.word 0xfadb8e40  ! 1744: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_135:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_135), 16, 16)) -> intp(1, 0, b)
cpu_intr_1_137:
	setx	0x28022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9ab8820  ! 1756: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb9a00020  ! 1759: FMOVs	fmovs	%f0, %f28
	.word 0xb7a5c8c0  ! 1764: FSUBd	fsubd	%f54, %f0, %f58
	.word 0xbda50960  ! 1769: FMULq	dis not found

iob_intr_1_136:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_136), 16, 16)) -> intp(1, 0, f)
T1_asi_reg_rd_80:
	mov	0x2, %r14
	.word 0xf0db84a0  ! 1771: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_1_138:
	setx	0x2b0217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c8e0  ! 1773: FSUBq	dis not found

cpu_intr_1_139:
	setx	0x2b0035, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_75:
	mov	0x25, %r14
	.word 0xf8f38e40  ! 1776: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb5a88820  ! 1778: FMOVLE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_76:
	mov	0x2b, %r14
	.word 0xfcf384a0  ! 1779: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T1_asi_reg_wr_77:
	mov	0x12, %r14
	.word 0xf0f38400  ! 1783: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb9a00560  ! 1784: FSQRTq	fsqrt	
cpu_intr_1_140:
	setx	0x290312, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_78:
	mov	0x19, %r14
	.word 0xf6f38e40  ! 1787: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbd349000  ! 1789: SRLX_R	srlx	%r18, %r0, %r30
	lda	[%r19 + %g0] 0xf0, %f2
cpu_intr_1_141:
	setx	0x29031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaa8820  ! 1800: FMOVG	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_79:
	mov	0x1b, %r14
	.word 0xf0f384a0  ! 1801: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbfab8820  ! 1802: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb3a00540  ! 1803: FSQRTd	fsqrt	
iob_intr_1_137:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_137), 16, 16)) -> intp(1, 0, 39)
iob_intr_1_138:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_138), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb8ace100  ! 1813: ANDNcc_I	andncc 	%r19, 0x0100, %r28
T1_asi_reg_rd_81:
	mov	0x18, %r14
	.word 0xf6db8e40  ! 1815: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T1_asi_reg_wr_80:
	mov	0x15, %r14
	.word 0xf6f389e0  ! 1816: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb72d5000  ! 1818: SLLX_R	sllx	%r21, %r0, %r27
iob_intr_1_139:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_139), 16, 16)) -> intp(1, 0, 39)
	.word 0xb9aa0820  ! 1820: FMOVA	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9aa0820  ! 1825: FMOVA	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_81:
	mov	0x1e, %r14
	.word 0xf2f38e40  ! 1826: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_1_142:
	setx	0x2c0129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c820  ! 1828: FADDs	fadds	%f23, %f0, %f27
	.word 0xb1a5c9e0  ! 1830: FDIVq	dis not found

	.word 0xb7a50960  ! 1838: FMULq	dis not found

	.word 0xbfa48940  ! 1840: FMULd	fmuld	%f18, %f0, %f62
	.word 0xbfab0820  ! 1841: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb5aa8820  ! 1842: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb1a80820  ! 1844: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
cpu_intr_1_143:
	setx	0x2d0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab0820  ! 1847: FMOVGU	fmovs	%fcc1, %f0, %f29
cpu_intr_1_144:
	setx	0x2f0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3c0000  ! 1850: SRA_R	sra 	%r16, %r0, %r31
T1_asi_reg_rd_82:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 1855: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_1_145:
	setx	0x2d020a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_146:
	setx	0x2f0005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 1864: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
iob_intr_1_140:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_140), 16, 16)) -> intp(1, 0, 31)
	.word 0xbba508e0  ! 1872: FSUBq	dis not found

iob_intr_1_141:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_141), 16, 16)) -> intp(1, 0, 8)
	.word 0xb9a98820  ! 1876: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xb80ce1e3  ! 1877: AND_I	and 	%r19, 0x01e3, %r28
	.word 0xb3a509e0  ! 1879: FDIVq	dis not found

	.word 0xb3a90820  ! 1880: FMOVLEU	fmovs	%fcc1, %f0, %f25
iob_intr_1_142:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_142), 16, 16)) -> intp(1, 0, 1a)
iob_intr_1_143:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_143), 16, 16)) -> intp(1, 0, 17)
T1_asi_reg_wr_82:
	mov	0x14, %r14
	.word 0xfcf389e0  ! 1885: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_147:
	setx	0x2f022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_83:
	mov	0x2a, %r14
	.word 0xfadb8e40  ! 1891: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb4340000  ! 1893: ORN_R	orn 	%r16, %r0, %r26
T1_asi_reg_wr_83:
	mov	0x3c4, %r14
	.word 0xf2f389e0  ! 1895: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T1_asi_reg_wr_84:
	mov	0x3c6, %r14
	.word 0xf8f389e0  ! 1898: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb7a489c0  ! 1899: FDIVd	fdivd	%f18, %f0, %f58
	.word 0xbd643801  ! 1902: MOVcc_I	<illegal instruction>
	.word 0xb9a4c9a0  ! 1903: FDIVs	fdivs	%f19, %f0, %f28
iob_intr_1_144:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_144), 16, 16)) -> intp(1, 0, 39)
	.word 0xb1ab8820  ! 1906: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xbaa40000  ! 1911: SUBcc_R	subcc 	%r16, %r0, %r29
T1_asi_reg_rd_84:
	mov	0xa, %r14
	.word 0xfadb8e40  ! 1912: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_1_148:
	setx	0x2d0120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba589a0  ! 1917: FDIVs	fdivs	%f22, %f0, %f29
cpu_intr_1_149:
	setx	0x2c031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb356001  ! 1919: SRL_I	srl 	%r21, 0x0001, %r29
cpu_intr_1_150:
	setx	0x2d0013, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_151:
	setx	0x2f023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab4820  ! 1926: FMOVCC	fmovs	%fcc1, %f0, %f29
cpu_intr_1_152:
	setx	0x2e013f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_153:
	setx	0x2e013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4850000  ! 1933: ADDcc_R	addcc 	%r20, %r0, %r26
	.word 0xbaa521cf  ! 1934: SUBcc_I	subcc 	%r20, 0x01cf, %r29
cpu_intr_1_154:
	setx	0x2c0011, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_155:
	setx	0x2d020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a40940  ! 1942: FMULd	fmuld	%f16, %f0, %f58
cpu_intr_1_156:
	setx	0x2f032c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_157:
	setx	0x2f0108, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_158:
	setx	0x2e0027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_159:
	setx	0x2d0030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb815a090  ! 1951: OR_I	or 	%r22, 0x0090, %r28
	.word 0xbba80820  ! 1953: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xbe258000  ! 1955: SUB_R	sub 	%r22, %r0, %r31
T1_asi_reg_rd_85:
	mov	0xa, %r14
	.word 0xf0db89e0  ! 1959: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_1_145:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_145), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_160:
	setx	0x2e0331, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_146:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_146), 16, 16)) -> intp(1, 0, 3e)
iob_intr_1_147:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_147), 16, 16)) -> intp(1, 0, 7)
cpu_intr_1_161:
	setx	0x2d0011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a5c840  ! 1967: FADDd	faddd	%f54, %f0, %f26
T1_asi_reg_rd_86:
	mov	0x3c7, %r14
	.word 0xf8db8e80  ! 1969: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_1_162:
	setx	0x2e0306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a549c0  ! 1973: FDIVd	fdivd	%f52, %f0, %f26
	.word 0xb5aa0820  ! 1976: FMOVA	fmovs	%fcc1, %f0, %f26
iob_intr_1_148:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_148), 16, 16)) -> intp(1, 0, 8)
	.word 0xbbaac820  ! 1980: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xb8bcc000  ! 1981: XNORcc_R	xnorcc 	%r19, %r0, %r28
	.word 0xb3a00540  ! 1982: FSQRTd	fsqrt	
cpu_intr_1_163:
	setx	0x2c012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00540  ! 1985: FSQRTd	fsqrt	
	.word 0xb7a5c840  ! 1986: FADDd	faddd	%f54, %f0, %f58
iob_intr_1_149:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_149), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_150:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_150), 16, 16)) -> intp(1, 0, 6)
	.word 0xb5a48960  ! 1990: FMULq	dis not found

	.word 0xb1a00560  ! 1994: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_164:
	setx	0x2d0101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80820  ! 2001: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xb334c000  ! 2002: SRL_R	srl 	%r19, %r0, %r25
T1_asi_reg_wr_85:
	mov	0x3c7, %r14
	.word 0xf0f389e0  ! 2003: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb9a4c960  ! 2004: FMULq	dis not found

	.word 0xb03d8000  ! 2005: XNOR_R	xnor 	%r22, %r0, %r24
iob_intr_1_151:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_151), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_rd_87:
	mov	0x3c7, %r14
	.word 0xfedb8e80  ! 2007: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xbba4c920  ! 2008: FMULs	fmuls	%f19, %f0, %f29
iob_intr_1_152:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_152), 16, 16)) -> intp(1, 0, 31)
cpu_intr_1_165:
	setx	0x2e0230, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_153:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_153), 16, 16)) -> intp(1, 0, 20)
	.word 0xbba9c820  ! 2020: FMOVVS	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_86:
	mov	0x31, %r14
	.word 0xf4f38e40  ! 2023: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb7aac820  ! 2025: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb1a48920  ! 2033: FMULs	fmuls	%f18, %f0, %f24
	.word 0xb00da0c4  ! 2034: AND_I	and 	%r22, 0x00c4, %r24
	.word 0xb7a549a0  ! 2038: FDIVs	fdivs	%f21, %f0, %f27
	.word 0x81952011  ! 2039: WRPR_TPC_I	wrpr	%r20, 0x0011, %tpc
cpu_intr_1_166:
	setx	0x2c031b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_167:
	setx	0x2d0112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00560  ! 2044: FSQRTq	fsqrt	
iob_intr_1_154:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_154), 16, 16)) -> intp(1, 0, 30)
iob_intr_1_155:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_155), 16, 16)) -> intp(1, 0, 3d)
T1_asi_reg_wr_87:
	mov	0x3c4, %r14
	.word 0xfaf38e40  ! 2050: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb7a90820  ! 2051: FMOVLEU	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_156:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_156), 16, 16)) -> intp(1, 0, 2f)
cpu_intr_1_168:
	setx	0x2c0111, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_169:
	setx	0x2d003b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_88:
	mov	0x25, %r14
	.word 0xfcdb8e80  ! 2057: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb4358000  ! 2058: ORN_R	orn 	%r22, %r0, %r26
T1_asi_reg_rd_89:
	mov	0x8, %r14
	.word 0xf4db89e0  ! 2061: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb5a81420  ! 2063: FMOVRNZ	dis not found

T1_asi_reg_wr_88:
	mov	0x11, %r14
	.word 0xfef38e80  ! 2065: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T1_asi_reg_wr_89:
	mov	0x3c8, %r14
	.word 0xfef38e40  ! 2066: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb3a509c0  ! 2073: FDIVd	fdivd	%f20, %f0, %f56
	.word 0xb7a409c0  ! 2075: FDIVd	fdivd	%f16, %f0, %f58
iob_intr_1_157:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_157), 16, 16)) -> intp(1, 0, e)
	.word 0xb150c000  ! 2077: RDPR_TT	<illegal instruction>
T1_asi_reg_wr_90:
	mov	0x24, %r14
	.word 0xfcf38e40  ! 2078: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T1_asi_reg_rd_90:
	mov	0x1, %r14
	.word 0xfcdb89e0  ! 2080: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbfa4c940  ! 2081: FMULd	fmuld	%f50, %f0, %f62
T1_asi_reg_wr_91:
	mov	0x15, %r14
	.word 0xf0f38e40  ! 2082: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb9a98820  ! 2083: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xb7a00020  ! 2087: FMOVs	fmovs	%f0, %f27
	.word 0xb3a81c20  ! 2089: FMOVRGEZ	dis not found

	.word 0xbc14e1a3  ! 2091: OR_I	or 	%r19, 0x01a3, %r30
cpu_intr_1_170:
	setx	0x2c002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00560  ! 2095: FSQRTq	fsqrt	
	.word 0xbda408a0  ! 2096: FSUBs	fsubs	%f16, %f0, %f30
	.word 0xb1a58820  ! 2098: FADDs	fadds	%f22, %f0, %f24
	.word 0xbfa40860  ! 2099: FADDq	dis not found

iob_intr_1_158:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_158), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb9a5c960  ! 2101: FMULq	dis not found

	.word 0xb5a00020  ! 2103: FMOVs	fmovs	%f0, %f26
	.word 0xbfa00560  ! 2104: FSQRTq	fsqrt	
	.word 0xb5aac820  ! 2107: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xbba81c20  ! 2108: FMOVRGEZ	dis not found

	.word 0xb551c000  ! 2117: RDPR_TL	<illegal instruction>
	.word 0xb425a169  ! 2121: SUB_I	sub 	%r22, 0x0169, %r26
T1_asi_reg_rd_91:
	mov	0x3c4, %r14
	.word 0xf4db8e40  ! 2122: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	lda	[%r19 + %g0] 0xf0, %f2
cpu_intr_1_171:
	setx	0x2c033d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_159:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_159), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_rd_92:
	mov	0x3, %r14
	.word 0xfadb8400  ! 2131: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_1_160:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_160), 16, 16)) -> intp(1, 0, 20)
	.word 0xb4c521c1  ! 2136: ADDCcc_I	addccc 	%r20, 0x01c1, %r26
T1_asi_reg_wr_92:
	mov	0x1a, %r14
	.word 0xf6f38e80  ! 2139: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb9a00560  ! 2141: FSQRTq	fsqrt	
iob_intr_1_161:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_161), 16, 16)) -> intp(1, 0, 20)
	.word 0xb7a80c20  ! 2151: FMOVRLZ	dis not found

T1_asi_reg_wr_93:
	mov	0x33, %r14
	.word 0xf6f38e80  ! 2155: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb1a00540  ! 2157: FSQRTd	fsqrt	
	.word 0xb9355000  ! 2162: SRLX_R	srlx	%r21, %r0, %r28
T1_asi_reg_rd_93:
	mov	0xf, %r14
	.word 0xf0db8e40  ! 2165: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_rd_94:
	mov	0x37, %r14
	.word 0xfcdb89e0  ! 2166: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_1_162:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_162), 16, 16)) -> intp(1, 0, 17)
	.word 0xb3a84820  ! 2168: FMOVE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_95:
	mov	0x1d, %r14
	.word 0xfedb8e60  ! 2169: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb2348000  ! 2172: ORN_R	orn 	%r18, %r0, %r25
cpu_intr_1_172:
	setx	0x2c0326, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_96:
	mov	0x3c8, %r14
	.word 0xf2db8e60  ! 2175: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_1_173:
	setx	0x2d0115, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_163:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_163), 16, 16)) -> intp(1, 0, 3b)
cpu_intr_1_174:
	setx	0x2d0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa81c20  ! 2184: FMOVRGEZ	dis not found

T1_asi_reg_wr_94:
	mov	0x3c6, %r14
	.word 0xf8f38e80  ! 2185: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T1_asi_reg_rd_97:
	mov	0x37, %r14
	.word 0xfedb84a0  ! 2187: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_1_175:
	setx	0x2d013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a9c820  ! 2193: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb3ab4820  ! 2195: FMOVCC	fmovs	%fcc1, %f0, %f25
cpu_intr_1_176:
	setx	0x2f0219, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_98:
	mov	0x3c2, %r14
	.word 0xfedb8e60  ! 2197: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb23c0000  ! 2198: XNOR_R	xnor 	%r16, %r0, %r25
cpu_intr_1_177:
	setx	0x2d011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a54940  ! 2206: FMULd	fmuld	%f52, %f0, %f56
T1_asi_reg_wr_95:
	mov	0x3c5, %r14
	.word 0xf4f384a0  ! 2209: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_1_178:
	setx	0x2e0126, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_179:
	setx	0x2e0005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72c2001  ! 2213: SLL_I	sll 	%r16, 0x0001, %r27
T1_asi_reg_rd_99:
	mov	0x8, %r14
	.word 0xfedb89e0  ! 2215: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb53c6001  ! 2222: SRA_I	sra 	%r17, 0x0001, %r26
T1_asi_reg_rd_100:
	mov	0x3c1, %r14
	.word 0xf0db89e0  ! 2225: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T1_asi_reg_rd_101:
	mov	0x8, %r14
	.word 0xf8db84a0  ! 2226: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_1_180:
	setx	0x2f021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r19 + %g0] 0xf0, %f2
T1_asi_reg_wr_96:
	mov	0x30, %r14
	.word 0xfef389e0  ! 2237: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_wr_97:
	mov	0x38, %r14
	.word 0xf6f38e40  ! 2243: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb6344000  ! 2245: SUBC_R	orn 	%r17, %r0, %r27
T1_asi_reg_wr_98:
	mov	0x23, %r14
	.word 0xfcf38e40  ! 2247: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_164:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_164), 16, 16)) -> intp(1, 0, 28)
T1_asi_reg_rd_102:
	mov	0x13, %r14
	.word 0xfedb8e60  ! 2251: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_1_165:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_165), 16, 16)) -> intp(1, 0, 3c)
	.word 0xbc0c61e3  ! 2258: AND_I	and 	%r17, 0x01e3, %r30
T1_asi_reg_rd_103:
	mov	0x3c6, %r14
	.word 0xfadb89e0  ! 2260: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_1_166:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_166), 16, 16)) -> intp(1, 0, e)
iob_intr_1_167:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_167), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_wr_99:
	mov	0x28, %r14
	.word 0xfef389e0  ! 2270: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb5a00520  ! 2271: FSQRTs	fsqrt	
T1_asi_reg_rd_104:
	mov	0x5, %r14
	.word 0xfedb8400  ! 2273: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_1_168:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_168), 16, 16)) -> intp(1, 0, f)
	.word 0xb045611f  ! 2280: ADDC_I	addc 	%r21, 0x011f, %r24
T1_asi_reg_wr_100:
	mov	0x2d, %r14
	.word 0xfef38e40  ! 2283: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_1_181:
	setx	0x320009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcaca04e  ! 2289: ANDNcc_I	andncc 	%r18, 0x004e, %r30
T1_asi_reg_wr_101:
	mov	0x23, %r14
	.word 0xf2f384a0  ! 2290: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbda408a0  ! 2292: FSUBs	fsubs	%f16, %f0, %f30
	.word 0xbba94820  ! 2293: FMOVCS	fmovs	%fcc1, %f0, %f29
iob_intr_1_169:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_169), 16, 16)) -> intp(1, 0, 22)
iob_intr_1_170:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_170), 16, 16)) -> intp(1, 0, 38)
T1_asi_reg_rd_105:
	mov	0xb, %r14
	.word 0xf8db8e40  ! 2300: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_1_182:
	setx	0x31011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a88820  ! 2303: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xbdab8820  ! 2304: FMOVPOS	fmovs	%fcc1, %f0, %f30
iob_intr_1_171:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_171), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb2b4c000  ! 2308: ORNcc_R	orncc 	%r19, %r0, %r25
cpu_intr_1_183:
	setx	0x320100, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_172:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_172), 16, 16)) -> intp(1, 0, 2c)
iob_intr_1_173:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_173), 16, 16)) -> intp(1, 0, 37)
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xbba98820  ! 2319: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xb80de0bb  ! 2324: AND_I	and 	%r23, 0x00bb, %r28
	.word 0xb7a5c840  ! 2326: FADDd	faddd	%f54, %f0, %f58
cpu_intr_1_184:
	setx	0x320231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c960  ! 2330: FMULq	dis not found

	.word 0xb7a509e0  ! 2335: FDIVq	dis not found

	.word 0xb1a54920  ! 2336: FMULs	fmuls	%f21, %f0, %f24
cpu_intr_1_185:
	setx	0x310323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0c5612f  ! 2341: ADDCcc_I	addccc 	%r21, 0x012f, %r24
	.word 0xb3aa4820  ! 2342: FMOVNE	fmovs	%fcc1, %f0, %f25
cpu_intr_1_186:
	setx	0x31021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa81820  ! 2346: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb0140000  ! 2347: OR_R	or 	%r16, %r0, %r24
	.word 0xbdaac820  ! 2350: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xbdabc820  ! 2351: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xbba40840  ! 2352: FADDd	faddd	%f16, %f0, %f60
	.word 0xb3a00540  ! 2354: FSQRTd	fsqrt	
T1_asi_reg_rd_106:
	mov	0x17, %r14
	.word 0xfcdb8400  ! 2355: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb3a8c820  ! 2357: FMOVL	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_102:
	mov	0xe, %r14
	.word 0xf8f38400  ! 2358: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_1_187:
	setx	0x310005, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_188:
	setx	0x330324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba94820  ! 2361: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb9a81c20  ! 2363: FMOVRGEZ	dis not found

cpu_intr_1_189:
	setx	0x30022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aac820  ! 2369: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xbfa5c8e0  ! 2371: FSUBq	dis not found

	.word 0xb7a00540  ! 2372: FSQRTd	fsqrt	
	.word 0xb1ab0820  ! 2374: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xa1902000  ! 2375: WRPR_GL_I	wrpr	%r0, 0x0000, %-
iob_intr_1_174:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_174), 16, 16)) -> intp(1, 0, 20)
	.word 0xbda80c20  ! 2377: FMOVRLZ	dis not found

	.word 0xbda81c20  ! 2382: FMOVRGEZ	dis not found

iob_intr_1_175:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_175), 16, 16)) -> intp(1, 0, 39)
cpu_intr_1_190:
	setx	0x33012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb48c8000  ! 2391: ANDcc_R	andcc 	%r18, %r0, %r26
T1_asi_reg_wr_103:
	mov	0xf, %r14
	.word 0xf6f384a0  ! 2392: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_1_191:
	setx	0x30030f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_104:
	mov	0x2e, %r14
	.word 0xfaf38e60  ! 2400: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T1_asi_reg_wr_105:
	mov	0x2b, %r14
	.word 0xfef389e0  ! 2401: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	lda	[%r17 + %g0] 0xf0, %f2
cpu_intr_1_192:
	setx	0x300211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda88820  ! 2410: FMOVLE	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_106:
	mov	0x3c7, %r14
	.word 0xf0f38e40  ! 2412: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_wr_107:
	mov	0xb, %r14
	.word 0xf8f38400  ! 2413: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_1_193:
	setx	0x300124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda54820  ! 2415: FADDs	fadds	%f21, %f0, %f30
T1_asi_reg_wr_108:
	mov	0x2e, %r14
	.word 0xf6f384a0  ! 2416: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_1_194:
	setx	0x310234, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_107:
	mov	0x38, %r14
	.word 0xfedb8400  ! 2418: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T1_asi_reg_rd_108:
	mov	0x8, %r14
	.word 0xfedb8e60  ! 2419: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xbba00520  ! 2420: FSQRTs	fsqrt	
	.word 0xb7a44860  ! 2422: FADDq	dis not found

iob_intr_1_176:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_176), 16, 16)) -> intp(1, 0, 4)
cpu_intr_1_195:
	setx	0x31012a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_109:
	mov	0x3c5, %r14
	.word 0xf0db8400  ! 2429: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb3a44820  ! 2431: FADDs	fadds	%f17, %f0, %f25
iob_intr_1_177:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_177), 16, 16)) -> intp(1, 0, 2c)
T1_asi_reg_wr_109:
	mov	0x34, %r14
	.word 0xfcf38e80  ! 2438: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb5a00520  ! 2439: FSQRTs	fsqrt	
	.word 0xb3a80820  ! 2440: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
iob_intr_1_178:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_178), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb3a94820  ! 2447: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xbfa8c820  ! 2451: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb1a81420  ! 2454: FMOVRNZ	dis not found

	.word 0xb7a80820  ! 2455: FMOVN	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_110:
	mov	0x16, %r14
	.word 0xf8f38e80  ! 2456: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_1_196:
	setx	0x31001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4344000  ! 2459: ORN_R	orn 	%r17, %r0, %r26
iob_intr_1_179:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_179), 16, 16)) -> intp(1, 0, 29)
	.word 0xbda489e0  ! 2465: FDIVq	dis not found

T1_asi_reg_wr_111:
	mov	0x12, %r14
	.word 0xf4f38e40  ! 2466: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_197:
	setx	0x31011c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_180:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_180), 16, 16)) -> intp(1, 0, 27)
	.word 0xbda4c8c0  ! 2473: FSUBd	fsubd	%f50, %f0, %f30
	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xbba00540  ! 2477: FSQRTd	fsqrt	
iob_intr_1_181:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_181), 16, 16)) -> intp(1, 0, 24)
iob_intr_1_182:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_182), 16, 16)) -> intp(1, 0, 21)
cpu_intr_1_198:
	setx	0x320219, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_110:
	mov	0x18, %r14
	.word 0xf6db84a0  ! 2484: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb1a448c0  ! 2485: FSUBd	fsubd	%f48, %f0, %f24
cpu_intr_1_199:
	setx	0x320337, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_183:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_183), 16, 16)) -> intp(1, 0, 35)
	.word 0xb3a80820  ! 2491: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_184:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_184), 16, 16)) -> intp(1, 0, 34)
	.word 0xbda80820  ! 2504: FMOVN	fmovs	%fcc1, %f0, %f30
iob_intr_1_185:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_185), 16, 16)) -> intp(1, 0, 6)
cpu_intr_1_200:
	setx	0x33011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaac820  ! 2511: FMOVGE	fmovs	%fcc1, %f0, %f30
cpu_intr_1_201:
	setx	0x30022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb894c000  ! 2514: ORcc_R	orcc 	%r19, %r0, %r28
	.word 0xbda5c8c0  ! 2516: FSUBd	fsubd	%f54, %f0, %f30
	.word 0xb5a54840  ! 2517: FADDd	faddd	%f52, %f0, %f26
iob_intr_1_186:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_186), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb5a4c940  ! 2530: FMULd	fmuld	%f50, %f0, %f26
	.word 0xbbab0820  ! 2532: FMOVGU	fmovs	%fcc1, %f0, %f29
cpu_intr_1_202:
	setx	0x310323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80c20  ! 2536: FMOVRLZ	dis not found

iob_intr_1_187:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_187), 16, 16)) -> intp(1, 0, 21)
	.word 0xb57d8400  ! 2540: MOVR_R	movre	%r22, %r0, %r26
	.word 0xb5aa4820  ! 2541: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xbfa48920  ! 2543: FMULs	fmuls	%f18, %f0, %f31
T1_asi_reg_wr_112:
	mov	0x4, %r14
	.word 0xfef38400  ! 2545: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T1_asi_reg_wr_113:
	mov	0x3c8, %r14
	.word 0xf4f38400  ! 2546: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_1_203:
	setx	0x32030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_114:
	mov	0xe, %r14
	.word 0xf8f38e40  ! 2548: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbda5c840  ! 2549: FADDd	faddd	%f54, %f0, %f30
T1_asi_reg_wr_115:
	mov	0x38, %r14
	.word 0xfef389e0  ! 2552: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_wr_116:
	mov	0x2f, %r14
	.word 0xf4f38400  ! 2553: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbc14a032  ! 2555: OR_I	or 	%r18, 0x0032, %r30
	.word 0xb5a80820  ! 2559: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xbfa80820  ! 2567: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb9a80420  ! 2568: FMOVRZ	dis not found

	.word 0xbd346001  ! 2569: SRL_I	srl 	%r17, 0x0001, %r30
iob_intr_1_188:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_188), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb7aac820  ! 2572: FMOVGE	fmovs	%fcc1, %f0, %f27
iob_intr_1_189:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_189), 16, 16)) -> intp(1, 0, 3)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_204:
	setx	0x300023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a8c820  ! 2579: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb3a50960  ! 2580: FMULq	dis not found

	.word 0xb9a5c960  ! 2581: FMULq	dis not found

iob_intr_1_190:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_190), 16, 16)) -> intp(1, 0, 11)
	.word 0xb1ab8820  ! 2588: FMOVPOS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_111:
	mov	0x1e, %r14
	.word 0xf4db8e40  ! 2594: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_wr_117:
	mov	0x3c5, %r14
	.word 0xfef38400  ! 2595: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_1_191:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_191), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb9a00520  ! 2600: FSQRTs	fsqrt	
iob_intr_1_192:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_192), 16, 16)) -> intp(1, 0, e)
	.word 0xbc9c0000  ! 2606: XORcc_R	xorcc 	%r16, %r0, %r30
	.word 0xb1a488a0  ! 2607: FSUBs	fsubs	%f18, %f0, %f24
T1_asi_reg_rd_112:
	mov	0x34, %r14
	.word 0xf4db84a0  ! 2608: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T1_asi_reg_rd_113:
	mov	0x3c3, %r14
	.word 0xfadb84a0  ! 2609: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb4b4c000  ! 2610: SUBCcc_R	orncc 	%r19, %r0, %r26
	.word 0xb9abc820  ! 2611: FMOVVC	fmovs	%fcc1, %f0, %f28
cpu_intr_1_205:
	setx	0x300137, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_206:
	setx	0x310110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x839461b9  ! 2619: WRPR_TNPC_I	wrpr	%r17, 0x01b9, %tnpc
	.word 0xbe8d218d  ! 2623: ANDcc_I	andcc 	%r20, 0x018d, %r31
	.word 0xbba81420  ! 2624: FMOVRNZ	dis not found

	.word 0xb1a81c20  ! 2625: FMOVRGEZ	dis not found

	.word 0xbe358000  ! 2627: ORN_R	orn 	%r22, %r0, %r31
iob_intr_1_193:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_193), 16, 16)) -> intp(1, 0, 3d)
	.word 0xbba98820  ! 2629: FMOVNEG	fmovs	%fcc1, %f0, %f29
iob_intr_1_194:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_194), 16, 16)) -> intp(1, 0, 0)
T1_asi_reg_rd_114:
	mov	0x23, %r14
	.word 0xf2db8e80  ! 2633: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbcbd0000  ! 2634: XNORcc_R	xnorcc 	%r20, %r0, %r30
T1_asi_reg_wr_118:
	mov	0x1d, %r14
	.word 0xf0f38e40  ! 2635: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbfa549e0  ! 2639: FDIVq	dis not found

	.word 0xb08c20a9  ! 2640: ANDcc_I	andcc 	%r16, 0x00a9, %r24
	.word 0xbba48920  ! 2647: FMULs	fmuls	%f18, %f0, %f29
	.word 0xbf356001  ! 2648: SRL_I	srl 	%r21, 0x0001, %r31
	lda	[%r16 + %g0] 0xf0, %f2
iob_intr_1_195:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_195), 16, 16)) -> intp(1, 0, 8)
T1_asi_reg_wr_119:
	mov	0xd, %r14
	.word 0xf8f384a0  ! 2657: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_1_196:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_196), 16, 16)) -> intp(1, 0, 3a)
iob_intr_1_197:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_197), 16, 16)) -> intp(1, 0, 26)
T1_asi_reg_wr_120:
	mov	0x3c0, %r14
	.word 0xf4f384a0  ! 2663: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbebd208f  ! 2665: XNORcc_I	xnorcc 	%r20, 0x008f, %r31
	.word 0xb7a8c820  ! 2666: FMOVL	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_121:
	mov	0xb, %r14
	.word 0xf0f384a0  ! 2667: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_1_198:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_198), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb3a00520  ! 2669: FSQRTs	fsqrt	
T1_asi_reg_rd_115:
	mov	0x2d, %r14
	.word 0xfcdb89e0  ! 2672: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_1_199:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_199), 16, 16)) -> intp(1, 0, 36)
iob_intr_1_200:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_200), 16, 16)) -> intp(1, 0, d)
	.word 0xb1a40840  ! 2683: FADDd	faddd	%f16, %f0, %f24
	.word 0xb62c20f2  ! 2684: ANDN_I	andn 	%r16, 0x00f2, %r27
	.word 0xb9a40860  ! 2689: FADDq	dis not found

	.word 0xbba488c0  ! 2693: FSUBd	fsubd	%f18, %f0, %f60
	.word 0xb1a50860  ! 2694: FADDq	dis not found

cpu_intr_1_207:
	setx	0x300328, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_201:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_201), 16, 16)) -> intp(1, 0, 5)
cpu_intr_1_208:
	setx	0x320110, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_122:
	mov	0xf, %r14
	.word 0xf0f389e0  ! 2702: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_1_202:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_202), 16, 16)) -> intp(1, 0, 9)
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xbf35d000  ! 2710: SRLX_R	srlx	%r23, %r0, %r31
iob_intr_1_203:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_203), 16, 16)) -> intp(1, 0, 16)
	.word 0xbda588c0  ! 2719: FSUBd	fsubd	%f22, %f0, %f30
	.word 0xb005a0b8  ! 2720: ADD_I	add 	%r22, 0x00b8, %r24
	.word 0xbba00040  ! 2721: FMOVd	fmovd	%f0, %f60
T1_asi_reg_wr_123:
	mov	0x2c, %r14
	.word 0xfef38400  ! 2723: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb00c8000  ! 2727: AND_R	and 	%r18, %r0, %r24
cpu_intr_1_209:
	setx	0x33010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba2ca154  ! 2729: ANDN_I	andn 	%r18, 0x0154, %r29
	.word 0xb2bd4000  ! 2732: XNORcc_R	xnorcc 	%r21, %r0, %r25
T1_asi_reg_wr_124:
	mov	0x20, %r14
	.word 0xf4f38e80  ! 2733: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T1_asi_reg_rd_116:
	mov	0x3c8, %r14
	.word 0xf2db8e60  ! 2734: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbba94820  ! 2735: FMOVCS	fmovs	%fcc1, %f0, %f29
cpu_intr_1_210:
	setx	0x360204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a448a0  ! 2738: FSUBs	fsubs	%f17, %f0, %f25
cpu_intr_1_211:
	setx	0x35022a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_117:
	mov	0x7, %r14
	.word 0xf4db8e40  ! 2743: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_1_204:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_204), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb3aa8820  ! 2754: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb1a54940  ! 2756: FMULd	fmuld	%f52, %f0, %f24
T1_asi_reg_rd_118:
	mov	0x7, %r14
	.word 0xf0db8e80  ! 2759: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xba94c000  ! 2760: ORcc_R	orcc 	%r19, %r0, %r29
	.word 0xb7a589c0  ! 2763: FDIVd	fdivd	%f22, %f0, %f58
	.word 0xbda50860  ! 2764: FADDq	dis not found

	.word 0xb7518000  ! 2765: RDPR_PSTATE	<illegal instruction>
	.word 0xbfaa4820  ! 2766: FMOVNE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_125:
	mov	0x16, %r14
	.word 0xf2f389e0  ! 2767: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_1_212:
	setx	0x370236, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_126:
	mov	0x23, %r14
	.word 0xfef389e0  ! 2771: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_1_205:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_205), 16, 16)) -> intp(1, 0, 37)
T1_asi_reg_rd_119:
	mov	0x3c2, %r14
	.word 0xfedb89e0  ! 2774: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_1_206:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_206), 16, 16)) -> intp(1, 0, 3)
cpu_intr_1_213:
	setx	0x350201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_207:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_207), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_214:
	setx	0x340021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9ab4820  ! 2789: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xbc34e088  ! 2790: SUBC_I	orn 	%r19, 0x0088, %r30
cpu_intr_1_215:
	setx	0x360100, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_127:
	mov	0x3c4, %r14
	.word 0xfef38e40  ! 2796: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbba00540  ! 2801: FSQRTd	fsqrt	
cpu_intr_1_216:
	setx	0x340322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab8820  ! 2806: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb40560a6  ! 2807: ADD_I	add 	%r21, 0x00a6, %r26
cpu_intr_1_217:
	setx	0x350124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa48840  ! 2812: FADDd	faddd	%f18, %f0, %f62
iob_intr_1_208:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_208), 16, 16)) -> intp(1, 0, f)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda589a0  ! 2817: FDIVs	fdivs	%f22, %f0, %f30
iob_intr_1_209:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_209), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb23460c6  ! 2820: SUBC_I	orn 	%r17, 0x00c6, %r25
iob_intr_1_210:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_210), 16, 16)) -> intp(1, 0, 17)
	.word 0xb5a80820  ! 2822: FMOVN	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_128:
	mov	0x5, %r14
	.word 0xf8f38e80  ! 2827: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_1_211:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_211), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb0b5a1bb  ! 2831: SUBCcc_I	orncc 	%r22, 0x01bb, %r24
cpu_intr_1_218:
	setx	0x36002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a4c8c0  ! 2835: FSUBd	fsubd	%f50, %f0, %f24
T1_asi_reg_rd_120:
	mov	0x10, %r14
	.word 0xf6db8e40  ! 2840: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb3a00020  ! 2841: FMOVs	fmovs	%f0, %f25
	.word 0xbfa489c0  ! 2842: FDIVd	fdivd	%f18, %f0, %f62
	.word 0xb5a58820  ! 2844: FADDs	fadds	%f22, %f0, %f26
	.word 0xb7a81420  ! 2845: FMOVRNZ	dis not found

iob_intr_1_212:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_212), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_rd_121:
	mov	0x3, %r14
	.word 0xf4db89e0  ! 2851: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb9a9c820  ! 2855: FMOVVS	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_129:
	mov	0x2e, %r14
	.word 0xf0f38e40  ! 2856: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb9a509e0  ! 2858: FDIVq	dis not found

iob_intr_1_213:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_213), 16, 16)) -> intp(1, 0, e)
	.word 0xb5a00520  ! 2860: FSQRTs	fsqrt	
iob_intr_1_214:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_214), 16, 16)) -> intp(1, 0, 1a)
	.word 0x8594e114  ! 2863: WRPR_TSTATE_I	wrpr	%r19, 0x0114, %tstate
T1_asi_reg_rd_122:
	mov	0x3c8, %r14
	.word 0xf4db8e40  ! 2865: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb434a1dd  ! 2867: ORN_I	orn 	%r18, 0x01dd, %r26
cpu_intr_1_219:
	setx	0x370211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5643801  ! 2869: MOVcc_I	<illegal instruction>
	.word 0xb3aac820  ! 2872: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xb8ac2002  ! 2873: ANDNcc_I	andncc 	%r16, 0x0002, %r28
	.word 0xbdabc820  ! 2877: FMOVVC	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_123:
	mov	0x28, %r14
	.word 0xfcdb8e80  ! 2878: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb9a4c820  ! 2880: FADDs	fadds	%f19, %f0, %f28
	.word 0xb1a81420  ! 2881: FMOVRNZ	dis not found

	lda	[%r23 + %g0] 0xf0, %f2
T1_asi_reg_wr_130:
	mov	0x5, %r14
	.word 0xf8f389e0  ! 2887: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb5a98820  ! 2889: FMOVNEG	fmovs	%fcc1, %f0, %f26
cpu_intr_1_220:
	setx	0x370205, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_215:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_215), 16, 16)) -> intp(1, 0, 12)
T1_asi_reg_wr_131:
	mov	0x33, %r14
	.word 0xf4f38e60  ! 2896: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T1_asi_reg_wr_132:
	mov	0x3c1, %r14
	.word 0xf0f38e40  ! 2899: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_1_216:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_216), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb3a5c920  ! 2906: FMULs	fmuls	%f23, %f0, %f25
T1_asi_reg_rd_124:
	mov	0xf, %r14
	.word 0xf2db89e0  ! 2907: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_1_221:
	setx	0x350228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x81956166  ! 2909: WRPR_TPC_I	wrpr	%r21, 0x0166, %tpc
T1_asi_reg_wr_133:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 2912: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb3a5c920  ! 2913: FMULs	fmuls	%f23, %f0, %f25
T1_asi_reg_rd_125:
	mov	0xb, %r14
	.word 0xf2db8e80  ! 2914: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbfa488c0  ! 2916: FSUBd	fsubd	%f18, %f0, %f62
	.word 0xb1a00560  ! 2917: FSQRTq	fsqrt	
	.word 0xba3cc000  ! 2923: XNOR_R	xnor 	%r19, %r0, %r29
	.word 0xb32d2001  ! 2924: SLL_I	sll 	%r20, 0x0001, %r25
	.word 0xbd2c2001  ! 2925: SLL_I	sll 	%r16, 0x0001, %r30
cpu_intr_1_222:
	setx	0x37000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c840  ! 2929: FADDd	faddd	%f50, %f0, %f62
	.word 0xbc9dc000  ! 2930: XORcc_R	xorcc 	%r23, %r0, %r30
cpu_intr_1_223:
	setx	0x36032a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_217:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_217), 16, 16)) -> intp(1, 0, d)
	.word 0xb7a448e0  ! 2938: FSUBq	dis not found

T1_asi_reg_wr_134:
	mov	0x11, %r14
	.word 0xf4f384a0  ! 2939: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_1_224:
	setx	0x350236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00560  ! 2942: FSQRTq	fsqrt	
cpu_intr_1_225:
	setx	0x350329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a81820  ! 2944: FMOVRGZ	fmovs	%fcc3, %f0, %f27
cpu_intr_1_226:
	setx	0x36013c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_126:
	mov	0x3c7, %r14
	.word 0xfedb8e60  ! 2946: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_1_218:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_218), 16, 16)) -> intp(1, 0, 21)
cpu_intr_1_227:
	setx	0x34012e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_228:
	setx	0x370003, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_127:
	mov	0x20, %r14
	.word 0xfcdb8e40  ! 2956: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_wr_135:
	mov	0x3c8, %r14
	.word 0xf2f38e80  ! 2958: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_1_219:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_219), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_rd_128:
	mov	0x3c8, %r14
	.word 0xf8db8400  ! 2961: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbba589c0  ! 2965: FDIVd	fdivd	%f22, %f0, %f60
iob_intr_1_220:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_220), 16, 16)) -> intp(1, 0, 2b)
T1_asi_reg_wr_136:
	mov	0x3c0, %r14
	.word 0xfaf38e40  ! 2969: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_wr_137:
	mov	0x2e, %r14
	.word 0xf6f38400  ! 2972: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T1_asi_reg_rd_129:
	mov	0x29, %r14
	.word 0xfcdb84a0  ! 2973: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_1_221:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_221), 16, 16)) -> intp(1, 0, 25)
	.word 0xb9a44960  ! 2977: FMULq	dis not found

	.word 0xba1dc000  ! 2978: XOR_R	xor 	%r23, %r0, %r29
T1_asi_reg_wr_138:
	mov	0x2a, %r14
	.word 0xf0f38e60  ! 2982: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T1_asi_reg_wr_139:
	mov	0xa, %r14
	.word 0xf6f38e40  ! 2984: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbba4c840  ! 2986: FADDd	faddd	%f50, %f0, %f60
	.word 0xb751c000  ! 2988: RDPR_TL	<illegal instruction>
cpu_intr_1_229:
	setx	0x36033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a589a0  ! 2990: FDIVs	fdivs	%f22, %f0, %f25
	.word 0xb3a588c0  ! 2994: FSUBd	fsubd	%f22, %f0, %f56
	.word 0xbda00520  ! 2995: FSQRTs	fsqrt	
iob_intr_1_222:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_222), 16, 16)) -> intp(1, 0, 37)
	.word 0xbbaa0820  ! 3000: FMOVA	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_130:
	mov	0xc, %r14
	.word 0xfcdb84a0  ! 3001: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbc0ca186  ! 3002: AND_I	and 	%r18, 0x0186, %r30
	.word 0xbe0c0000  ! 3005: AND_R	and 	%r16, %r0, %r31
	.word 0xbda94820  ! 3006: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0x85946056  ! 3010: WRPR_TSTATE_I	wrpr	%r17, 0x0056, %tstate
	.word 0xb3a50820  ! 3011: FADDs	fadds	%f20, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	lda	[%r23 + %g0] 0xf0, %f2
	.word 0xbb641800  ! 3016: MOVcc_R	<illegal instruction>
	.word 0xbfa00520  ! 3020: FSQRTs	fsqrt	
	.word 0xb7a90820  ! 3021: FMOVLEU	fmovs	%fcc1, %f0, %f27
iob_intr_1_223:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_223), 16, 16)) -> intp(1, 0, 31)
T1_asi_reg_rd_131:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 3027: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb7a81c20  ! 3028: FMOVRGEZ	dis not found

iob_intr_1_224:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_224), 16, 16)) -> intp(1, 0, 17)
	.word 0xba0d4000  ! 3031: AND_R	and 	%r21, %r0, %r29
	.word 0xbda44960  ! 3032: FMULq	dis not found

	.word 0xb7a408c0  ! 3033: FSUBd	fsubd	%f16, %f0, %f58
iob_intr_1_225:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_225), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb9a408a0  ! 3037: FSUBs	fsubs	%f16, %f0, %f28
	.word 0xb6b4c000  ! 3038: ORNcc_R	orncc 	%r19, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_226:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_226), 16, 16)) -> intp(1, 0, 31)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbba5c820  ! 3043: FADDs	fadds	%f23, %f0, %f29
T1_asi_reg_rd_132:
	mov	0x3c3, %r14
	.word 0xfedb84a0  ! 3047: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb3480000  ! 3048: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
T1_asi_reg_rd_133:
	mov	0x30, %r14
	.word 0xf0db89e0  ! 3049: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_1_230:
	setx	0x35031a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_140:
	mov	0x2a, %r14
	.word 0xf6f384a0  ! 3053: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb294c000  ! 3058: ORcc_R	orcc 	%r19, %r0, %r25
cpu_intr_1_231:
	setx	0x34023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5ab4820  ! 3060: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xbbab0820  ! 3061: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb02d2095  ! 3063: ANDN_I	andn 	%r20, 0x0095, %r24
iob_intr_1_227:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_227), 16, 16)) -> intp(1, 0, 34)
	lda	[%r16 + %g0] 0xf0, %f2
iob_intr_1_228:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_228), 16, 16)) -> intp(1, 0, 31)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_232:
	setx	0x350339, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_229:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_229), 16, 16)) -> intp(1, 0, 21)
	.word 0xbfa54820  ! 3084: FADDs	fadds	%f21, %f0, %f31
T1_asi_reg_rd_134:
	mov	0x3c3, %r14
	.word 0xfadb89e0  ! 3085: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_1_233:
	setx	0x36000f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_141:
	mov	0x12, %r14
	.word 0xf6f384a0  ! 3088: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb1a508a0  ! 3092: FSUBs	fsubs	%f20, %f0, %f24
T1_asi_reg_rd_135:
	mov	0x8, %r14
	.word 0xf8db8e40  ! 3093: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb62dc000  ! 3096: ANDN_R	andn 	%r23, %r0, %r27
T1_asi_reg_rd_136:
	mov	0x20, %r14
	.word 0xf0db89e0  ! 3097: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb9a00520  ! 3098: FSQRTs	fsqrt	
	.word 0xb1a58960  ! 3101: FMULq	dis not found

	.word 0xbba00520  ! 3104: FSQRTs	fsqrt	
	.word 0xb1a84820  ! 3105: FMOVE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_137:
	mov	0x3c3, %r14
	.word 0xf6db8400  ! 3106: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_1_230:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_230), 16, 16)) -> intp(1, 0, 29)
	.word 0xb7a00520  ! 3108: FSQRTs	fsqrt	
iob_intr_1_231:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_231), 16, 16)) -> intp(1, 0, 26)
T1_asi_reg_rd_138:
	mov	0x25, %r14
	.word 0xf0db84a0  ! 3111: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1aac820  ! 3115: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb5a54840  ! 3116: FADDd	faddd	%f52, %f0, %f26
	.word 0xb7a50820  ! 3119: FADDs	fadds	%f20, %f0, %f27
iob_intr_1_232:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_232), 16, 16)) -> intp(1, 0, 25)
cpu_intr_1_234:
	setx	0x350134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aa4820  ! 3129: FMOVNE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_235:
	setx	0x340101, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_233:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_233), 16, 16)) -> intp(1, 0, 18)
iob_intr_1_234:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_234), 16, 16)) -> intp(1, 0, 12)
iob_intr_1_235:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_235), 16, 16)) -> intp(1, 0, 23)
iob_intr_1_236:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_236), 16, 16)) -> intp(1, 0, 3)
	.word 0xbba9c820  ! 3141: FMOVVS	fmovs	%fcc1, %f0, %f29
cpu_intr_1_236:
	setx	0x370000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00520  ! 3145: FSQRTs	fsqrt	
	.word 0xbba50840  ! 3149: FADDd	faddd	%f20, %f0, %f60
iob_intr_1_237:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_237), 16, 16)) -> intp(1, 0, 2d)
cpu_intr_1_237:
	setx	0x360218, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_238:
	setx	0x370214, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_139:
	mov	0x35, %r14
	.word 0xfadb8400  ! 3156: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_1_238:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_238), 16, 16)) -> intp(1, 0, 39)
	.word 0xb1643801  ! 3158: MOVcc_I	<illegal instruction>
	.word 0xb6bc6149  ! 3159: XNORcc_I	xnorcc 	%r17, 0x0149, %r27
	.word 0xbdab4820  ! 3162: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb92cd000  ! 3165: SLLX_R	sllx	%r19, %r0, %r28
	.word 0xbc8d6082  ! 3168: ANDcc_I	andcc 	%r21, 0x0082, %r30
	.word 0xb1a58940  ! 3169: FMULd	fmuld	%f22, %f0, %f24
	.word 0xb3aac820  ! 3170: FMOVGE	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_wr_142:
	mov	0x12, %r14
	.word 0xf6f38e40  ! 3172: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbfa94820  ! 3173: FMOVCS	fmovs	%fcc1, %f0, %f31
cpu_intr_1_239:
	setx	0x37032c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_239:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_239), 16, 16)) -> intp(1, 0, 7)
cpu_intr_1_240:
	setx	0x350129, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_140:
	mov	0x15, %r14
	.word 0xf4db84a0  ! 3188: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb5a549c0  ! 3189: FDIVd	fdivd	%f52, %f0, %f26
cpu_intr_1_241:
	setx	0x37022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x859560c9  ! 3196: WRPR_TSTATE_I	wrpr	%r21, 0x00c9, %tstate
	.word 0xb3a5c9c0  ! 3199: FDIVd	fdivd	%f54, %f0, %f56
T1_asi_reg_wr_143:
	mov	0x3c0, %r14
	.word 0xfef38e40  ! 3200: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_1_242:
	setx	0x39011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a9c820  ! 3205: FMOVVS	fmovs	%fcc1, %f0, %f25
iob_intr_1_240:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_240), 16, 16)) -> intp(1, 0, 3)
	.word 0xb8448000  ! 3207: ADDC_R	addc 	%r18, %r0, %r28
	.word 0xb5a88820  ! 3208: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xbd3c8000  ! 3210: SRA_R	sra 	%r18, %r0, %r30
T1_asi_reg_rd_141:
	mov	0x16, %r14
	.word 0xf0db84a0  ! 3211: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbba94820  ! 3212: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb1aa0820  ! 3214: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb1a84820  ! 3218: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb1aa0820  ! 3219: FMOVA	fmovs	%fcc1, %f0, %f24
iob_intr_1_241:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_241), 16, 16)) -> intp(1, 0, e)
	.word 0xb3a98820  ! 3226: FMOVNEG	fmovs	%fcc1, %f0, %f25
iob_intr_1_242:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_242), 16, 16)) -> intp(1, 0, d)
	.word 0xbda4c860  ! 3230: FADDq	dis not found

T1_asi_reg_rd_142:
	mov	0x6, %r14
	.word 0xf2db8e60  ! 3231: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T1_asi_reg_rd_143:
	mov	0xc, %r14
	.word 0xfcdb8e60  ! 3233: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbba84820  ! 3238: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb9a00560  ! 3239: FSQRTq	fsqrt	
T1_asi_reg_rd_144:
	mov	0x3c5, %r14
	.word 0xfedb8400  ! 3250: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbf353001  ! 3253: SRLX_I	srlx	%r20, 0x0001, %r31
T1_asi_reg_rd_145:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 3254: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_wr_144:
	mov	0x26, %r14
	.word 0xfcf389e0  ! 3256: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xbfa00520  ! 3257: FSQRTs	fsqrt	
	.word 0xb7a4c9c0  ! 3259: FDIVd	fdivd	%f50, %f0, %f58
	.word 0xb5a00540  ! 3261: FSQRTd	fsqrt	
	.word 0xb3a84820  ! 3264: FMOVE	fmovs	%fcc1, %f0, %f25
cpu_intr_1_243:
	setx	0x3a022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_145:
	mov	0x20, %r14
	.word 0xfef38e40  ! 3267: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_243:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_243), 16, 16)) -> intp(1, 0, 15)
	.word 0xb9a00540  ! 3270: FSQRTd	fsqrt	
iob_intr_1_244:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_244), 16, 16)) -> intp(1, 0, 2f)
	.word 0xbda40940  ! 3273: FMULd	fmuld	%f16, %f0, %f30
	.word 0xb5a448e0  ! 3274: FSUBq	dis not found

	.word 0xbb2d3001  ! 3275: SLLX_I	sllx	%r20, 0x0001, %r29
cpu_intr_1_244:
	setx	0x3a0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8a40000  ! 3281: SUBcc_R	subcc 	%r16, %r0, %r28
iob_intr_1_245:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_245), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb69d20d6  ! 3283: XORcc_I	xorcc 	%r20, 0x00d6, %r27
iob_intr_1_246:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_246), 16, 16)) -> intp(1, 0, 37)
T1_asi_reg_rd_146:
	mov	0x6, %r14
	.word 0xfcdb8e40  ! 3286: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_245:
	setx	0x39011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c820  ! 3288: FADDs	fadds	%f19, %f0, %f27
	.word 0xb9a81420  ! 3289: FMOVRNZ	dis not found

T1_asi_reg_wr_146:
	mov	0x21, %r14
	.word 0xfef38e60  ! 3291: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbba50920  ! 3295: FMULs	fmuls	%f20, %f0, %f29
iob_intr_1_247:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_247), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb1a509a0  ! 3299: FDIVs	fdivs	%f20, %f0, %f24
	.word 0xbfa488e0  ! 3302: FSUBq	dis not found

T1_asi_reg_wr_147:
	mov	0x3c1, %r14
	.word 0xfaf38e80  ! 3306: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbfa88820  ! 3307: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb3a80c20  ! 3309: FMOVRLZ	dis not found

cpu_intr_1_246:
	setx	0x3b0307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda81420  ! 3315: FMOVRNZ	dis not found

cpu_intr_1_247:
	setx	0x380322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa508e0  ! 3320: FSUBq	dis not found

	.word 0xbbaa4820  ! 3321: FMOVNE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_148:
	mov	0x3c2, %r14
	.word 0xf6f38e40  ! 3322: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_248:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_248), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_248:
	setx	0x380213, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_249:
	setx	0x390129, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_149:
	mov	0x4, %r14
	.word 0xf4f38e80  ! 3329: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbbaa0820  ! 3331: FMOVA	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_147:
	mov	0x8, %r14
	.word 0xf2db8e60  ! 3332: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_1_249:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_249), 16, 16)) -> intp(1, 0, b)
	.word 0xbdaa4820  ! 3334: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xb5a549c0  ! 3336: FDIVd	fdivd	%f52, %f0, %f26
	.word 0xb0a5e08d  ! 3338: SUBcc_I	subcc 	%r23, 0x008d, %r24
	.word 0xbb500000  ! 3339: RDPR_TPC	<illegal instruction>
	.word 0xbba00020  ! 3340: FMOVs	fmovs	%f0, %f29
T1_asi_reg_wr_150:
	mov	0x1e, %r14
	.word 0xfef38e60  ! 3341: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_1_250:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_250), 16, 16)) -> intp(1, 0, e)
	.word 0xbfa98820  ! 3353: FMOVNEG	fmovs	%fcc1, %f0, %f31
cpu_intr_1_250:
	setx	0x39000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_151:
	mov	0x38, %r14
	.word 0xfef38e80  ! 3357: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb5a548a0  ! 3358: FSUBs	fsubs	%f21, %f0, %f26
	.word 0xb751c000  ! 3360: RDPR_TL	<illegal instruction>
	.word 0xbba00560  ! 3362: FSQRTq	fsqrt	
	.word 0xb3a48840  ! 3366: FADDd	faddd	%f18, %f0, %f56
	.word 0xb33c1000  ! 3367: SRAX_R	srax	%r16, %r0, %r25
cpu_intr_1_251:
	setx	0x38021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb34d000  ! 3370: SRLX_R	srlx	%r19, %r0, %r29
T1_asi_reg_rd_148:
	mov	0x11, %r14
	.word 0xfcdb8e60  ! 3373: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbdab0820  ! 3374: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb6858000  ! 3375: ADDcc_R	addcc 	%r22, %r0, %r27
	.word 0xb9a48840  ! 3377: FADDd	faddd	%f18, %f0, %f28
iob_intr_1_251:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_251), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb9a8c820  ! 3379: FMOVL	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_152:
	mov	0x31, %r14
	.word 0xf0f38e40  ! 3380: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb3a80c20  ! 3383: FMOVRLZ	dis not found

iob_intr_1_252:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_252), 16, 16)) -> intp(1, 0, 27)
cpu_intr_1_252:
	setx	0x39003b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_253:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_253), 16, 16)) -> intp(1, 0, 9)
	.word 0xb9a80820  ! 3393: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xba9d0000  ! 3394: XORcc_R	xorcc 	%r20, %r0, %r29
T1_asi_reg_wr_153:
	mov	0x3c7, %r14
	.word 0xf0f38e40  ! 3397: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbfa588c0  ! 3399: FSUBd	fsubd	%f22, %f0, %f62
T1_asi_reg_rd_149:
	mov	0x3c4, %r14
	.word 0xfedb89e0  ! 3401: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_1_253:
	setx	0x3a033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa81420  ! 3404: FMOVRNZ	dis not found

cpu_intr_1_254:
	setx	0x380014, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_154:
	mov	0x27, %r14
	.word 0xfcf38e60  ! 3407: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_1_254:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_254), 16, 16)) -> intp(1, 0, 31)
	.word 0xba8ce1fa  ! 3409: ANDcc_I	andcc 	%r19, 0x01fa, %r29
	.word 0xbba88820  ! 3410: FMOVLE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_150:
	mov	0x3c6, %r14
	.word 0xfcdb8e40  ! 3411: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbba5c940  ! 3414: FMULd	fmuld	%f54, %f0, %f60
	.word 0xb8a5c000  ! 3416: SUBcc_R	subcc 	%r23, %r0, %r28
	.word 0xb7a00540  ! 3419: FSQRTd	fsqrt	
	.word 0xbda54960  ! 3424: FMULq	dis not found

	.word 0xb37ca401  ! 3426: MOVR_I	movre	%r18, 0x1, %r25
iob_intr_1_255:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_255), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_wr_155:
	mov	0x19, %r14
	.word 0xf6f38400  ! 3433: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T1_asi_reg_rd_151:
	mov	0x5, %r14
	.word 0xf2db8400  ! 3434: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb9a448a0  ! 3435: FSUBs	fsubs	%f17, %f0, %f28
iob_intr_1_256:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_256), 16, 16)) -> intp(1, 0, 1)
iob_intr_1_257:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_257), 16, 16)) -> intp(1, 0, b)
	.word 0xb7ab8820  ! 3438: FMOVPOS	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_156:
	mov	0xe, %r14
	.word 0xfaf389e0  ! 3441: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_1_258:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_258), 16, 16)) -> intp(1, 0, a)
iob_intr_1_259:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_259), 16, 16)) -> intp(1, 0, 29)
	.word 0xb3a80420  ! 3444: FMOVRZ	dis not found

	.word 0xb9a509a0  ! 3449: FDIVs	fdivs	%f20, %f0, %f28
	.word 0xbdaa8820  ! 3452: FMOVG	fmovs	%fcc1, %f0, %f30
iob_intr_1_260:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_260), 16, 16)) -> intp(1, 0, 21)
	.word 0xbfa408a0  ! 3456: FSUBs	fsubs	%f16, %f0, %f31
cpu_intr_1_255:
	setx	0x3a0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00540  ! 3460: FSQRTd	fsqrt	
	.word 0xb23d61ff  ! 3462: XNOR_I	xnor 	%r21, 0x01ff, %r25
	.word 0xbbaac820  ! 3465: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xb735e001  ! 3468: SRL_I	srl 	%r23, 0x0001, %r27
	.word 0x9194a1a7  ! 3469: WRPR_PIL_I	wrpr	%r18, 0x01a7, %pil
	.word 0xba9da081  ! 3470: XORcc_I	xorcc 	%r22, 0x0081, %r29
cpu_intr_1_256:
	setx	0x3a0003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a5c860  ! 3477: FADDq	dis not found

iob_intr_1_261:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_261), 16, 16)) -> intp(1, 0, 3)
	.word 0xbdaa0820  ! 3479: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb5a549e0  ! 3480: FDIVq	dis not found

cpu_intr_1_257:
	setx	0x3a012c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_262:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_262), 16, 16)) -> intp(1, 0, f)
	.word 0xb5a94820  ! 3486: FMOVCS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_152:
	mov	0x37, %r14
	.word 0xfedb84a0  ! 3488: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb5a00020  ! 3489: FMOVs	fmovs	%f0, %f26
iob_intr_1_263:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_263), 16, 16)) -> intp(1, 0, 21)
	.word 0xb214214b  ! 3492: OR_I	or 	%r16, 0x014b, %r25
cpu_intr_1_258:
	setx	0x3a0222, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_157:
	mov	0x3c8, %r14
	.word 0xfaf38e60  ! 3494: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb1ab4820  ! 3495: FMOVCC	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_158:
	mov	0x17, %r14
	.word 0xfaf38e40  ! 3496: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbbab8820  ! 3497: FMOVPOS	fmovs	%fcc1, %f0, %f29
iob_intr_1_264:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_264), 16, 16)) -> intp(1, 0, 3a)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_153:
	mov	0x3c4, %r14
	.word 0xfadb8e80  ! 3502: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xbfa50920  ! 3504: FMULs	fmuls	%f20, %f0, %f31
	.word 0xb3ab4820  ! 3505: FMOVCC	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_154:
	mov	0x3c2, %r14
	.word 0xfadb8400  ! 3508: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb7a88820  ! 3509: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb1a81820  ! 3510: FMOVRGZ	fmovs	%fcc3, %f0, %f24
iob_intr_1_265:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_265), 16, 16)) -> intp(1, 0, 2d)
	.word 0xbfa4c840  ! 3516: FADDd	faddd	%f50, %f0, %f62
cpu_intr_1_259:
	setx	0x3b0121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaa8820  ! 3520: FMOVG	fmovs	%fcc1, %f0, %f31
iob_intr_1_266:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_266), 16, 16)) -> intp(1, 0, 26)
	.word 0xa1902000  ! 3523: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xbfa00540  ! 3526: FSQRTd	fsqrt	
	.word 0xb3a5c920  ! 3527: FMULs	fmuls	%f23, %f0, %f25
T1_asi_reg_rd_155:
	mov	0x32, %r14
	.word 0xfadb8400  ! 3531: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbfa5c840  ! 3532: FADDd	faddd	%f54, %f0, %f62
	.word 0xba8de088  ! 3533: ANDcc_I	andcc 	%r23, 0x0088, %r29
	.word 0xb7ab8820  ! 3537: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xb404e06f  ! 3538: ADD_I	add 	%r19, 0x006f, %r26
	.word 0xbba508a0  ! 3542: FSUBs	fsubs	%f20, %f0, %f29
	.word 0xbba8c820  ! 3545: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xb2bd61c2  ! 3546: XNORcc_I	xnorcc 	%r21, 0x01c2, %r25
iob_intr_1_267:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_267), 16, 16)) -> intp(1, 0, 26)
	.word 0xb5aa0820  ! 3552: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb7a81c20  ! 3554: FMOVRGEZ	dis not found

	.word 0xb1a9c820  ! 3557: FMOVVS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_159:
	mov	0x1d, %r14
	.word 0xfaf38e40  ! 3558: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_rd_156:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 3559: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_1_260:
	setx	0x38031b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_160:
	mov	0x0, %r14
	.word 0xfef38e60  ! 3561: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb7a80420  ! 3562: FMOVRZ	dis not found

	.word 0xba44c000  ! 3563: ADDC_R	addc 	%r19, %r0, %r29
	.word 0xb3aa0820  ! 3564: FMOVA	fmovs	%fcc1, %f0, %f25
cpu_intr_1_261:
	setx	0x3a0339, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_268:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_268), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb60d4000  ! 3570: AND_R	and 	%r21, %r0, %r27
iob_intr_1_269:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_269), 16, 16)) -> intp(1, 0, 12)
	.word 0xb9a00040  ! 3572: FMOVd	fmovd	%f0, %f28
T1_asi_reg_wr_161:
	mov	0x30, %r14
	.word 0xf0f38400  ! 3573: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T1_asi_reg_wr_162:
	mov	0x1f, %r14
	.word 0xfaf38400  ! 3580: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T1_asi_reg_wr_163:
	mov	0x25, %r14
	.word 0xfef38400  ! 3584: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbda00020  ! 3585: FMOVs	fmovs	%f0, %f30
	.word 0xbaace084  ! 3587: ANDNcc_I	andncc 	%r19, 0x0084, %r29
iob_intr_1_270:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_270), 16, 16)) -> intp(1, 0, 17)
	.word 0xb9ab8820  ! 3590: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb2358000  ! 3594: SUBC_R	orn 	%r22, %r0, %r25
iob_intr_1_271:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_271), 16, 16)) -> intp(1, 0, 29)
	.word 0xb351c000  ! 3598: RDPR_TL	<illegal instruction>
T1_asi_reg_rd_157:
	mov	0x27, %r14
	.word 0xf2db89e0  ! 3599: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbfab0820  ! 3600: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb3a50860  ! 3602: FADDq	dis not found

	.word 0xb6a4a0ad  ! 3604: SUBcc_I	subcc 	%r18, 0x00ad, %r27
T1_asi_reg_wr_164:
	mov	0x37, %r14
	.word 0xf0f38e60  ! 3607: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T1_asi_reg_wr_165:
	mov	0x3c4, %r14
	.word 0xf4f38e60  ! 3612: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_1_272:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_272), 16, 16)) -> intp(1, 0, 1f)
iob_intr_1_273:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_273), 16, 16)) -> intp(1, 0, 2)
	.word 0xb7a44960  ! 3619: FMULq	dis not found

	.word 0xb1a8c820  ! 3623: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xbb35e001  ! 3624: SRL_I	srl 	%r23, 0x0001, %r29
	.word 0xb61421cf  ! 3625: OR_I	or 	%r16, 0x01cf, %r27
	.word 0xb3a48920  ! 3628: FMULs	fmuls	%f18, %f0, %f25
iob_intr_1_274:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_274), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_275:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_275), 16, 16)) -> intp(1, 0, 8)
iob_intr_1_276:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_276), 16, 16)) -> intp(1, 0, 15)
T1_asi_reg_wr_166:
	mov	0x14, %r14
	.word 0xf0f389e0  ! 3642: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_1_277:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_277), 16, 16)) -> intp(1, 0, 25)
	.word 0xb1a40940  ! 3648: FMULd	fmuld	%f16, %f0, %f24
	.word 0xbfa40840  ! 3655: FADDd	faddd	%f16, %f0, %f62
	.word 0xbfa98820  ! 3657: FMOVNEG	fmovs	%fcc1, %f0, %f31
	lda	[%r21 + %g0] 0xf0, %f2
	.word 0xbda54860  ! 3659: FADDq	dis not found

	.word 0xb7a48920  ! 3660: FMULs	fmuls	%f18, %f0, %f27
iob_intr_1_278:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_278), 16, 16)) -> intp(1, 0, 2a)
iob_intr_1_279:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_279), 16, 16)) -> intp(1, 0, 24)
cpu_intr_1_262:
	setx	0x3c012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb88ca141  ! 3665: ANDcc_I	andcc 	%r18, 0x0141, %r28
T1_asi_reg_wr_167:
	mov	0x20, %r14
	.word 0xfef384a0  ! 3666: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_1_280:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_280), 16, 16)) -> intp(1, 0, f)
T1_asi_reg_wr_168:
	mov	0x3c8, %r14
	.word 0xf0f38e40  ! 3673: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_1_281:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_281), 16, 16)) -> intp(1, 0, 12)
	.word 0xbb3d5000  ! 3677: SRAX_R	srax	%r21, %r0, %r29
cpu_intr_1_263:
	setx	0x3f0330, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_264:
	setx	0x3e031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 3680: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xb7540000  ! 3682: RDPR_GL	<illegal instruction>
iob_intr_1_282:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_282), 16, 16)) -> intp(1, 0, 15)
cpu_intr_1_265:
	setx	0x3d0030, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_266:
	setx	0x3c022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba1c21d0  ! 3689: XOR_I	xor 	%r16, 0x01d0, %r29
cpu_intr_1_267:
	setx	0x3d0202, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_158:
	mov	0x3c7, %r14
	.word 0xf2db8e80  ! 3696: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_1_268:
	setx	0x3c032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb2dd000  ! 3700: SLLX_R	sllx	%r23, %r0, %r29
T1_asi_reg_rd_159:
	mov	0x3c6, %r14
	.word 0xfedb8e40  ! 3702: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_1_269:
	setx	0x3e022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa90820  ! 3710: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xbc2da152  ! 3711: ANDN_I	andn 	%r22, 0x0152, %r30
iob_intr_1_283:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_283), 16, 16)) -> intp(1, 0, 25)
	.word 0xbda81820  ! 3720: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xbc34e0c2  ! 3726: ORN_I	orn 	%r19, 0x00c2, %r30
iob_intr_1_284:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_284), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_wr_169:
	mov	0x32, %r14
	.word 0xf4f38e40  ! 3731: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_rd_160:
	mov	0xf, %r14
	.word 0xfcdb84a0  ! 3734: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb5a88820  ! 3737: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xbba488a0  ! 3738: FSUBs	fsubs	%f18, %f0, %f29
	.word 0xbfa00540  ! 3741: FSQRTd	fsqrt	
	.word 0xb3a8c820  ! 3746: FMOVL	fmovs	%fcc1, %f0, %f25
iob_intr_1_285:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_285), 16, 16)) -> intp(1, 0, 3f)
iob_intr_1_286:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_286), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb7a00560  ! 3752: FSQRTq	fsqrt	
cpu_intr_1_270:
	setx	0x3f0137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a81420  ! 3756: FMOVRNZ	dis not found

T1_asi_reg_wr_170:
	mov	0x6, %r14
	.word 0xf0f38400  ! 3758: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_1_287:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_287), 16, 16)) -> intp(1, 0, 2e)
cpu_intr_1_271:
	setx	0x3c0134, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_288:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_288), 16, 16)) -> intp(1, 0, 6)
iob_intr_1_289:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_289), 16, 16)) -> intp(1, 0, a)
	.word 0xba04e1c4  ! 3766: ADD_I	add 	%r19, 0x01c4, %r29
iob_intr_1_290:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_290), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb234e0a8  ! 3774: ORN_I	orn 	%r19, 0x00a8, %r25
T1_asi_reg_wr_171:
	mov	0x17, %r14
	.word 0xfef389e0  ! 3778: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbba4c840  ! 3779: FADDd	faddd	%f50, %f0, %f60
iob_intr_1_291:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_291), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_rd_161:
	mov	0x3c6, %r14
	.word 0xf8db8400  ! 3782: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_1_292:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_292), 16, 16)) -> intp(1, 0, 5)
	.word 0xb9ab4820  ! 3786: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb62c201e  ! 3791: ANDN_I	andn 	%r16, 0x001e, %r27
	.word 0xbba589a0  ! 3792: FDIVs	fdivs	%f22, %f0, %f29
iob_intr_1_293:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_293), 16, 16)) -> intp(1, 0, 13)
iob_intr_1_294:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_294), 16, 16)) -> intp(1, 0, 28)
iob_intr_1_295:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_295), 16, 16)) -> intp(1, 0, 9)
	.word 0xbfa80820  ! 3797: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xbda00520  ! 3799: FSQRTs	fsqrt	
	.word 0xb1a5c840  ! 3800: FADDd	faddd	%f54, %f0, %f24
T1_asi_reg_wr_172:
	mov	0x26, %r14
	.word 0xfcf38e80  ! 3806: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_1_272:
	setx	0x3e0329, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_273:
	setx	0x3e0107, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_274:
	setx	0x3f020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aac820  ! 3815: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb7a8c820  ! 3817: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xbfa549a0  ! 3819: FDIVs	fdivs	%f21, %f0, %f31
	.word 0xbfa94820  ! 3822: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb5a588c0  ! 3824: FSUBd	fsubd	%f22, %f0, %f26
	.word 0xb5a508e0  ! 3826: FSUBq	dis not found

T1_asi_reg_wr_173:
	mov	0x30, %r14
	.word 0xfcf38e40  ! 3827: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb7a00520  ! 3828: FSQRTs	fsqrt	
	.word 0xb32d1000  ! 3829: SLLX_R	sllx	%r20, %r0, %r25
cpu_intr_1_275:
	setx	0x3e0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7abc820  ! 3831: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb3a44820  ! 3832: FADDs	fadds	%f17, %f0, %f25
iob_intr_1_296:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_296), 16, 16)) -> intp(1, 0, 2e)
iob_intr_1_297:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_297), 16, 16)) -> intp(1, 0, d)
	.word 0xb3a81820  ! 3838: FMOVRGZ	fmovs	%fcc3, %f0, %f25
cpu_intr_1_276:
	setx	0x3d0307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00540  ! 3841: FSQRTd	fsqrt	
	.word 0xb9518000  ! 3844: RDPR_PSTATE	<illegal instruction>
cpu_intr_1_277:
	setx	0x3e0104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2c5a076  ! 3851: ADDCcc_I	addccc 	%r22, 0x0076, %r25
cpu_intr_1_278:
	setx	0x3c0027, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_298:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_298), 16, 16)) -> intp(1, 0, e)
	.word 0xb1a94820  ! 3858: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb1a81420  ! 3861: FMOVRNZ	dis not found

iob_intr_1_299:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_299), 16, 16)) -> intp(1, 0, 2c)
T1_asi_reg_rd_162:
	mov	0x6, %r14
	.word 0xf4db8e40  ! 3863: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb7a4c860  ! 3864: FADDq	dis not found

	.word 0xb9a4c8c0  ! 3865: FSUBd	fsubd	%f50, %f0, %f28
	.word 0xb1a98820  ! 3866: FMOVNEG	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_174:
	mov	0x2, %r14
	.word 0xfaf38e40  ! 3867: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_rd_163:
	mov	0x2e, %r14
	.word 0xfcdb8e40  ! 3870: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_279:
	setx	0x3e030d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_164:
	mov	0x5, %r14
	.word 0xf0db8e40  ! 3872: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_wr_175:
	mov	0x8, %r14
	.word 0xf2f38e60  ! 3873: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_1_300:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_300), 16, 16)) -> intp(1, 0, 30)
	.word 0xb5a489e0  ! 3877: FDIVq	dis not found

	.word 0xb5a80820  ! 3878: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
iob_intr_1_301:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_301), 16, 16)) -> intp(1, 0, 4)
	.word 0xbfab0820  ! 3880: FMOVGU	fmovs	%fcc1, %f0, %f31
iob_intr_1_302:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_302), 16, 16)) -> intp(1, 0, 11)
	.word 0xbba81420  ! 3886: FMOVRNZ	dis not found

	.word 0xb5ab0820  ! 3889: FMOVGU	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_176:
	mov	0xf, %r14
	.word 0xf4f38400  ! 3890: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_1_303:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_303), 16, 16)) -> intp(1, 0, 0)
T1_asi_reg_wr_177:
	mov	0x3c5, %r14
	.word 0xf6f384a0  ! 3893: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb5a80c20  ! 3894: FMOVRLZ	dis not found

	.word 0xb9351000  ! 3896: SRLX_R	srlx	%r20, %r0, %r28
	.word 0xb3a00540  ! 3897: FSQRTd	fsqrt	
cpu_intr_1_280:
	setx	0x3c0234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a58860  ! 3900: FADDq	dis not found

iob_intr_1_304:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_304), 16, 16)) -> intp(1, 0, 11)
iob_intr_1_305:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_305), 16, 16)) -> intp(1, 0, 8)
cpu_intr_1_281:
	setx	0x3c021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb435e042  ! 3914: ORN_I	orn 	%r23, 0x0042, %r26
cpu_intr_1_282:
	setx	0x3e0128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab8820  ! 3921: FMOVPOS	fmovs	%fcc1, %f0, %f25
cpu_intr_1_283:
	setx	0x3f0119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdabc820  ! 3926: FMOVVC	fmovs	%fcc1, %f0, %f30
cpu_intr_1_284:
	setx	0x3e0120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_285:
	setx	0x3c0126, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_306:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_306), 16, 16)) -> intp(1, 0, 32)
	.word 0xb7a88820  ! 3932: FMOVLE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_178:
	mov	0x28, %r14
	.word 0xfcf384a0  ! 3936: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T1_asi_reg_rd_165:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 3941: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb3a4c940  ! 3942: FMULd	fmuld	%f50, %f0, %f56
	.word 0xb53cf001  ! 3943: SRAX_I	srax	%r19, 0x0001, %r26
cpu_intr_1_286:
	setx	0x3e0110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a48960  ! 3946: FMULq	dis not found

	.word 0xbba4c8c0  ! 3947: FSUBd	fsubd	%f50, %f0, %f60
	.word 0xbba00520  ! 3948: FSQRTs	fsqrt	
T1_asi_reg_rd_166:
	mov	0x22, %r14
	.word 0xf6db8e80  ! 3950: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbba88820  ! 3951: FMOVLE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_179:
	mov	0x27, %r14
	.word 0xfef389e0  ! 3952: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbe2de0e3  ! 3954: ANDN_I	andn 	%r23, 0x00e3, %r31
cpu_intr_1_287:
	setx	0x3d0304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_307:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_307), 16, 16)) -> intp(1, 0, 1)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7ab4820  ! 3958: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xbb641800  ! 3962: MOVcc_R	<illegal instruction>
T1_asi_reg_wr_180:
	mov	0x3c3, %r14
	.word 0xf0f384a0  ! 3965: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_1_288:
	setx	0x3e031b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_308:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_308), 16, 16)) -> intp(1, 0, 8)
T1_asi_reg_wr_181:
	mov	0x3c3, %r14
	.word 0xfcf38400  ! 3969: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb1a4c8c0  ! 3974: FSUBd	fsubd	%f50, %f0, %f24
	.word 0xb93de001  ! 3976: SRA_I	sra 	%r23, 0x0001, %r28
iob_intr_1_309:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_309), 16, 16)) -> intp(1, 0, 3c)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a58840  ! 3983: FADDd	faddd	%f22, %f0, %f24
	.word 0xbcad6148  ! 3984: ANDNcc_I	andncc 	%r21, 0x0148, %r30
	.word 0xb9a80420  ! 3985: FMOVRZ	dis not found

iob_intr_1_310:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_310), 16, 16)) -> intp(1, 0, 19)
cpu_intr_1_289:
	setx	0x3d000a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_311:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_311), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb5aa4820  ! 3994: FMOVNE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_290:
	setx	0x3e0137, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_312:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_312), 16, 16)) -> intp(1, 0, 30)
T1_asi_reg_rd_167:
	mov	0x3c0, %r14
	.word 0xf8db8e40  ! 4002: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb7a44960  ! 4003: FMULq	dis not found

T1_asi_reg_rd_168:
	mov	0x3c7, %r14
	.word 0xfcdb8e40  ! 4005: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_wr_182:
	mov	0x1f, %r14
	.word 0xf2f38e40  ! 4007: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb9a44820  ! 4009: FADDs	fadds	%f17, %f0, %f28
T1_asi_reg_wr_183:
	mov	0x3c2, %r14
	.word 0xfef389e0  ! 4010: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_1_313:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_313), 16, 16)) -> intp(1, 0, 2c)
	.word 0xbfa588c0  ! 4016: FSUBd	fsubd	%f22, %f0, %f62
T1_asi_reg_wr_184:
	mov	0x15, %r14
	.word 0xf8f38e80  ! 4018: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb3ab0820  ! 4020: FMOVGU	fmovs	%fcc1, %f0, %f25
iob_intr_1_314:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_314), 16, 16)) -> intp(1, 0, 15)
iob_intr_1_315:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_315), 16, 16)) -> intp(1, 0, 11)
	.word 0xb3a00020  ! 4029: FMOVs	fmovs	%f0, %f25
	.word 0xbda80820  ! 4030: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb5a508e0  ! 4034: FSUBq	dis not found

cpu_intr_1_291:
	setx	0x3e0103, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_316:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_316), 16, 16)) -> intp(1, 0, 2c)
T1_asi_reg_wr_185:
	mov	0x8, %r14
	.word 0xf6f38e40  ! 4037: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb1a4c8c0  ! 4040: FSUBd	fsubd	%f50, %f0, %f24
cpu_intr_1_292:
	setx	0x3e020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_317:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_317), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb1a90820  ! 4044: FMOVLEU	fmovs	%fcc1, %f0, %f24
cpu_intr_1_293:
	setx	0x3f0224, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_318:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_318), 16, 16)) -> intp(1, 0, 22)
iob_intr_1_319:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_319), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbfa80820  ! 4054: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb9a80420  ! 4057: FMOVRZ	dis not found

	.word 0xb7a8c820  ! 4058: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xbda8c820  ! 4062: FMOVL	fmovs	%fcc1, %f0, %f30
cpu_intr_1_294:
	setx	0x3d0021, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_320:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_320), 16, 16)) -> intp(1, 0, 34)
iob_intr_1_321:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_321), 16, 16)) -> intp(1, 0, 11)
	.word 0xbc24a0d6  ! 4075: SUB_I	sub 	%r18, 0x00d6, %r30
T1_asi_reg_wr_186:
	mov	0x14, %r14
	.word 0xfcf38e40  ! 4081: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbba54840  ! 4082: FADDd	faddd	%f52, %f0, %f60
iob_intr_1_322:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_322), 16, 16)) -> intp(1, 0, 2)
cpu_intr_1_295:
	setx	0x3e011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_296:
	setx	0x3d0001, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_297:
	setx	0x3e023d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_323:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_323), 16, 16)) -> intp(1, 0, 9)
cpu_intr_1_298:
	setx	0x3e011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb643801  ! 4105: MOVcc_I	<illegal instruction>
	.word 0xb3a98820  ! 4106: FMOVNEG	fmovs	%fcc1, %f0, %f25
iob_intr_1_324:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_324), 16, 16)) -> intp(1, 0, 16)
	.word 0xbfa80820  ! 4110: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_169:
	mov	0x24, %r14
	.word 0xf0db8400  ! 4112: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_wr_187:
	mov	0x11, %r14
	.word 0xf8f38e80  ! 4113: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_1_299:
	setx	0x400126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2248000  ! 4115: SUB_R	sub 	%r18, %r0, %r25
	.word 0xbd2db001  ! 4118: SLLX_I	sllx	%r22, 0x0001, %r30
	.word 0xba350000  ! 4122: ORN_R	orn 	%r20, %r0, %r29
	.word 0xb5abc820  ! 4123: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb3a48840  ! 4124: FADDd	faddd	%f18, %f0, %f56
	.word 0xbfaa0820  ! 4126: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xbeb58000  ! 4127: ORNcc_R	orncc 	%r22, %r0, %r31
	.word 0xbda54840  ! 4131: FADDd	faddd	%f52, %f0, %f30
	.word 0xb0354000  ! 4132: SUBC_R	orn 	%r21, %r0, %r24
cpu_intr_1_300:
	setx	0x42012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80820  ! 4141: FMOVN	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_325:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_325), 16, 16)) -> intp(1, 0, 18)
	.word 0xbfa509c0  ! 4147: FDIVd	fdivd	%f20, %f0, %f62
cpu_intr_1_301:
	setx	0x430233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00560  ! 4150: FSQRTq	fsqrt	
	.word 0xb7a54920  ! 4152: FMULs	fmuls	%f21, %f0, %f27
iob_intr_1_326:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_326), 16, 16)) -> intp(1, 0, 9)
cpu_intr_1_302:
	setx	0x41031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaa5c000  ! 4157: SUBcc_R	subcc 	%r23, %r0, %r29
cpu_intr_1_303:
	setx	0x41013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a40860  ! 4162: FADDq	dis not found

	.word 0xb0150000  ! 4164: OR_R	or 	%r20, %r0, %r24
T1_asi_reg_rd_170:
	mov	0x1c, %r14
	.word 0xf2db8e40  ! 4167: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_wr_188:
	mov	0x32, %r14
	.word 0xf8f38e40  ! 4170: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_304:
	setx	0x430226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_305:
	setx	0x400024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa44860  ! 4177: FADDq	dis not found

	.word 0xb5a81420  ! 4178: FMOVRNZ	dis not found

	.word 0xb7a81420  ! 4181: FMOVRNZ	dis not found

	.word 0xb3a00540  ! 4182: FSQRTd	fsqrt	
T1_asi_reg_rd_171:
	mov	0x3c4, %r14
	.word 0xf6db8e60  ! 4187: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T1_asi_reg_wr_189:
	mov	0x34, %r14
	.word 0xf4f38e60  ! 4190: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb5a4c8e0  ! 4191: FSUBq	dis not found

T1_asi_reg_rd_172:
	mov	0x3c8, %r14
	.word 0xfedb8e40  ! 4192: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_1_327:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_327), 16, 16)) -> intp(1, 0, 23)
iob_intr_1_328:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_328), 16, 16)) -> intp(1, 0, 34)
	.word 0xb92c2001  ! 4200: SLL_I	sll 	%r16, 0x0001, %r28
T1_asi_reg_rd_173:
	mov	0x2f, %r14
	.word 0xfadb8400  ! 4202: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb3ab0820  ! 4206: FMOVGU	fmovs	%fcc1, %f0, %f25
cpu_intr_1_306:
	setx	0x40022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9ab8820  ! 4210: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xbba90820  ! 4211: FMOVLEU	fmovs	%fcc1, %f0, %f29
	lda	[%r17 + %g0] 0xf0, %f2
cpu_intr_1_307:
	setx	0x41022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa449e0  ! 4217: FDIVq	dis not found

	.word 0xb1a5c860  ! 4218: FADDq	dis not found

	.word 0xb5a00520  ! 4219: FSQRTs	fsqrt	
cpu_intr_1_308:
	setx	0x400027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd7c6401  ! 4225: MOVR_I	movre	%r17, 0x1, %r30
iob_intr_1_329:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_329), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb1aa4820  ! 4234: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb3a449c0  ! 4237: FDIVd	fdivd	%f48, %f0, %f56
iob_intr_1_330:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_330), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb7a489e0  ! 4243: FDIVq	dis not found

iob_intr_1_331:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_331), 16, 16)) -> intp(1, 0, 1c)
cpu_intr_1_309:
	setx	0x42033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a50820  ! 4252: FADDs	fadds	%f20, %f0, %f27
	.word 0xb7a81420  ! 4253: FMOVRNZ	dis not found

	.word 0xb1a00560  ! 4254: FSQRTq	fsqrt	
	.word 0xb3a5c920  ! 4257: FMULs	fmuls	%f23, %f0, %f25
cpu_intr_1_310:
	setx	0x420300, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_332:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_332), 16, 16)) -> intp(1, 0, 0)
	.word 0xb3a81c20  ! 4262: FMOVRGEZ	dis not found

T1_asi_reg_rd_174:
	mov	0x34, %r14
	.word 0xf2db8e80  ! 4264: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbba80c20  ! 4265: FMOVRLZ	dis not found

cpu_intr_1_311:
	setx	0x42030f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_312:
	setx	0x43023b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_333:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_333), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_rd_175:
	mov	0x12, %r14
	.word 0xf2db89e0  ! 4269: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_1_334:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_334), 16, 16)) -> intp(1, 0, 3b)
	.word 0xbda48840  ! 4272: FADDd	faddd	%f18, %f0, %f30
	.word 0xbda80c20  ! 4274: FMOVRLZ	dis not found

T1_asi_reg_rd_176:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 4275: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_335:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_335), 16, 16)) -> intp(1, 0, 13)
cpu_intr_1_313:
	setx	0x410128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb21d0000  ! 4284: XOR_R	xor 	%r20, %r0, %r25
cpu_intr_1_314:
	setx	0x43002c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_177:
	mov	0x16, %r14
	.word 0xf6db8400  ! 4286: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbe9d8000  ! 4288: XORcc_R	xorcc 	%r22, %r0, %r31
iob_intr_1_336:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_336), 16, 16)) -> intp(1, 0, 2)
	.word 0xb0b5a019  ! 4290: ORNcc_I	orncc 	%r22, 0x0019, %r24
	.word 0xb9a5c8c0  ! 4291: FSUBd	fsubd	%f54, %f0, %f28
T1_asi_reg_wr_190:
	mov	0xb, %r14
	.word 0xfef38e60  ! 4292: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_1_337:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_337), 16, 16)) -> intp(1, 0, 27)
iob_intr_1_338:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_338), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb7a00520  ! 4296: FSQRTs	fsqrt	
	.word 0xbba94820  ! 4297: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb1a90820  ! 4301: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xbb2d8000  ! 4302: SLL_R	sll 	%r22, %r0, %r29
	lda	[%r23 + %g0] 0xf0, %f2
T1_asi_reg_rd_178:
	mov	0x3c1, %r14
	.word 0xfadb8e60  ! 4304: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbbaa4820  ! 4305: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xbfa589c0  ! 4309: FDIVd	fdivd	%f22, %f0, %f62
iob_intr_1_339:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_339), 16, 16)) -> intp(1, 0, 11)
	.word 0xbba81c20  ! 4312: FMOVRGEZ	dis not found

	.word 0xbfa80820  ! 4313: FMOVN	fmovs	%fcc1, %f0, %f31
iob_intr_1_340:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_340), 16, 16)) -> intp(1, 0, 3f)
iob_intr_1_341:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_341), 16, 16)) -> intp(1, 0, 1f)
cpu_intr_1_315:
	setx	0x40003c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_316:
	setx	0x410000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda48820  ! 4318: FADDs	fadds	%f18, %f0, %f30
iob_intr_1_342:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_342), 16, 16)) -> intp(1, 0, 37)
T1_asi_reg_wr_191:
	mov	0x15, %r14
	.word 0xf2f38e60  ! 4324: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb5a44820  ! 4326: FADDs	fadds	%f17, %f0, %f26
T1_asi_reg_rd_179:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 4328: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbb2d9000  ! 4334: SLLX_R	sllx	%r22, %r0, %r29
T1_asi_reg_wr_192:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 4337: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbda4c9e0  ! 4338: FDIVq	dis not found

iob_intr_1_343:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_343), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbda98820  ! 4340: FMOVNEG	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_180:
	mov	0x1a, %r14
	.word 0xfadb84a0  ! 4341: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_1_317:
	setx	0x430304, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_318:
	setx	0x41031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0344000  ! 4344: SUBC_R	orn 	%r17, %r0, %r24
T1_asi_reg_rd_181:
	mov	0x14, %r14
	.word 0xf8db89e0  ! 4347: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_1_344:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_344), 16, 16)) -> intp(1, 0, c)
	.word 0xb2b4c000  ! 4353: SUBCcc_R	orncc 	%r19, %r0, %r25
	.word 0xbba509c0  ! 4354: FDIVd	fdivd	%f20, %f0, %f60
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7a80420  ! 4361: FMOVRZ	dis not found

	.word 0xb5a489c0  ! 4362: FDIVd	fdivd	%f18, %f0, %f26
	.word 0xb3a58940  ! 4363: FMULd	fmuld	%f22, %f0, %f56
	.word 0xbbabc820  ! 4365: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb9aa4820  ! 4367: FMOVNE	fmovs	%fcc1, %f0, %f28
iob_intr_1_345:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_345), 16, 16)) -> intp(1, 0, 20)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_193:
	mov	0x22, %r14
	.word 0xf8f384a0  ! 4370: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb095c000  ! 4371: ORcc_R	orcc 	%r23, %r0, %r24
T1_asi_reg_wr_194:
	mov	0x21, %r14
	.word 0xf4f38e60  ! 4372: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_1_346:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_346), 16, 16)) -> intp(1, 0, b)
	.word 0xbcb521ad  ! 4381: SUBCcc_I	orncc 	%r20, 0x01ad, %r30
T1_asi_reg_wr_195:
	mov	0x3c5, %r14
	.word 0xfef389e0  ! 4383: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_wr_196:
	mov	0x1c, %r14
	.word 0xfcf384a0  ! 4384: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbba588c0  ! 4385: FSUBd	fsubd	%f22, %f0, %f60
cpu_intr_1_319:
	setx	0x400232, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_182:
	mov	0x1f, %r14
	.word 0xfadb89e0  ! 4388: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb1a44840  ! 4390: FADDd	faddd	%f48, %f0, %f24
	.word 0xbba98820  ! 4392: FMOVNEG	fmovs	%fcc1, %f0, %f29
iob_intr_1_347:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_347), 16, 16)) -> intp(1, 0, 30)
	.word 0xb3a409e0  ! 4397: FDIVq	dis not found

T1_asi_reg_rd_183:
	mov	0x3c3, %r14
	.word 0xf2db8e60  ! 4398: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb3a80820  ! 4399: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb9aa4820  ! 4401: FMOVNE	fmovs	%fcc1, %f0, %f28
iob_intr_1_348:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_348), 16, 16)) -> intp(1, 0, 39)
	.word 0xbda00560  ! 4403: FSQRTq	fsqrt	
T1_asi_reg_rd_184:
	mov	0x38, %r14
	.word 0xfcdb8e40  ! 4406: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb1a449e0  ! 4409: FDIVq	dis not found

	.word 0xbda80c20  ! 4412: FMOVRLZ	dis not found

	.word 0xb3a00520  ! 4414: FSQRTs	fsqrt	
T1_asi_reg_rd_185:
	mov	0x3c1, %r14
	.word 0xf2db8400  ! 4415: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_1_349:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_349), 16, 16)) -> intp(1, 0, 33)
	.word 0xb3a509e0  ! 4419: FDIVq	dis not found

cpu_intr_1_320:
	setx	0x430227, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_321:
	setx	0x42031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a50920  ! 4428: FMULs	fmuls	%f20, %f0, %f26
	.word 0xbbab4820  ! 4429: FMOVCC	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a80c20  ! 4431: FMOVRLZ	dis not found

iob_intr_1_350:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_350), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb7a00540  ! 4434: FSQRTd	fsqrt	
	.word 0xb1abc820  ! 4435: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb7a88820  ! 4436: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb3a4c960  ! 4439: FMULq	dis not found

	.word 0xb32d5000  ! 4440: SLLX_R	sllx	%r21, %r0, %r25
T1_asi_reg_wr_197:
	mov	0x3c1, %r14
	.word 0xfef38400  ! 4441: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb22dc000  ! 4449: ANDN_R	andn 	%r23, %r0, %r25
	.word 0xbbab0820  ! 4450: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb134e001  ! 4452: SRL_I	srl 	%r19, 0x0001, %r24
T1_asi_reg_wr_198:
	mov	0x3c7, %r14
	.word 0xf0f384a0  ! 4454: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb40d8000  ! 4455: AND_R	and 	%r22, %r0, %r26
iob_intr_1_351:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_351), 16, 16)) -> intp(1, 0, 8)
	.word 0xb7a8c820  ! 4457: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xbba98820  ! 4458: FMOVNEG	fmovs	%fcc1, %f0, %f29
iob_intr_1_352:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_352), 16, 16)) -> intp(1, 0, 0)
	.word 0xb5abc820  ! 4462: FMOVVC	fmovs	%fcc1, %f0, %f26
iob_intr_1_353:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_353), 16, 16)) -> intp(1, 0, 22)
iob_intr_1_354:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_354), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_rd_186:
	mov	0x3c2, %r14
	.word 0xfadb8e40  ! 4466: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_355:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_355), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb12d2001  ! 4469: SLL_I	sll 	%r20, 0x0001, %r24
	.word 0xbbab0820  ! 4470: FMOVGU	fmovs	%fcc1, %f0, %f29
iob_intr_1_356:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_356), 16, 16)) -> intp(1, 0, e)
	.word 0xbda90820  ! 4472: FMOVLEU	fmovs	%fcc1, %f0, %f30
iob_intr_1_357:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_357), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_358:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_358), 16, 16)) -> intp(1, 0, 20)
	.word 0xb3a84820  ! 4475: FMOVE	fmovs	%fcc1, %f0, %f25
cpu_intr_1_322:
	setx	0x430132, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_199:
	mov	0x3c3, %r14
	.word 0xf4f38e60  ! 4478: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb5a84820  ! 4482: FMOVE	fmovs	%fcc1, %f0, %f26
iob_intr_1_359:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_359), 16, 16)) -> intp(1, 0, 11)
cpu_intr_1_323:
	setx	0x430102, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_360:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_360), 16, 16)) -> intp(1, 0, 3a)
T1_asi_reg_wr_200:
	mov	0x3c8, %r14
	.word 0xf0f38e40  ! 4492: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_1_361:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_361), 16, 16)) -> intp(1, 0, 29)
T1_asi_reg_rd_187:
	mov	0x25, %r14
	.word 0xf2db8e80  ! 4495: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb7a84820  ! 4499: FMOVE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_324:
	setx	0x420016, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_325:
	setx	0x41013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcad4000  ! 4502: ANDNcc_R	andncc 	%r21, %r0, %r30
T1_asi_reg_rd_188:
	mov	0x9, %r14
	.word 0xfcdb8e80  ! 4504: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_1_326:
	setx	0x410315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a5c820  ! 4509: FADDs	fadds	%f23, %f0, %f24
cpu_intr_1_327:
	setx	0x43021f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_362:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_362), 16, 16)) -> intp(1, 0, 14)
	.word 0xbfa40920  ! 4514: FMULs	fmuls	%f16, %f0, %f31
	.word 0xb245c000  ! 4516: ADDC_R	addc 	%r23, %r0, %r25
iob_intr_1_363:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_363), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_rd_189:
	mov	0x3c3, %r14
	.word 0xf4db8400  ! 4521: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_1_364:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_364), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb9a94820  ! 4530: FMOVCS	fmovs	%fcc1, %f0, %f28
iob_intr_1_365:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_365), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_wr_201:
	mov	0xa, %r14
	.word 0xf8f38e40  ! 4536: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_1_366:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_366), 16, 16)) -> intp(1, 0, 2e)
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
iob_intr_1_367:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_367), 16, 16)) -> intp(1, 0, 16)
	.word 0xb5ab0820  ! 4549: FMOVGU	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_190:
	mov	0x3c0, %r14
	.word 0xf8db84a0  ! 4552: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb1a94820  ! 4553: FMOVCS	fmovs	%fcc1, %f0, %f24
iob_intr_1_368:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_368), 16, 16)) -> intp(1, 0, 22)
iob_intr_1_369:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_369), 16, 16)) -> intp(1, 0, 35)
cpu_intr_1_328:
	setx	0x420321, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_370:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_370), 16, 16)) -> intp(1, 0, 1f)
cpu_intr_1_329:
	setx	0x410100, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_371:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_371), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb7a80c20  ! 4565: FMOVRLZ	dis not found

T1_asi_reg_rd_191:
	mov	0x5, %r14
	.word 0xfcdb8400  ! 4567: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T1_asi_reg_rd_192:
	mov	0x31, %r14
	.word 0xfadb8e40  ! 4568: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb7a80420  ! 4570: FMOVRZ	dis not found

T1_asi_reg_rd_193:
	mov	0x17, %r14
	.word 0xf2db89e0  ! 4571: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbfa88820  ! 4573: FMOVLE	fmovs	%fcc1, %f0, %f31
iob_intr_1_372:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_372), 16, 16)) -> intp(1, 0, 13)
cpu_intr_1_330:
	setx	0x470214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcb5c000  ! 4580: ORNcc_R	orncc 	%r23, %r0, %r30
cpu_intr_1_331:
	setx	0x450305, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r18 + %g0] 0xf0, %f2
	.word 0xb22c61b0  ! 4585: ANDN_I	andn 	%r17, 0x01b0, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7a4c8a0  ! 4588: FSUBs	fsubs	%f19, %f0, %f27
T1_asi_reg_wr_202:
	mov	0x31, %r14
	.word 0xfaf38e80  ! 4591: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbfa589c0  ! 4593: FDIVd	fdivd	%f22, %f0, %f62
	.word 0xbda5c920  ! 4594: FMULs	fmuls	%f23, %f0, %f30
	.word 0xb9643801  ! 4595: MOVcc_I	<illegal instruction>
	.word 0xb5a50820  ! 4598: FADDs	fadds	%f20, %f0, %f26
cpu_intr_1_332:
	setx	0x45031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa5c8c0  ! 4602: FSUBd	fsubd	%f54, %f0, %f62
	.word 0xb41d2063  ! 4603: XOR_I	xor 	%r20, 0x0063, %r26
cpu_intr_1_333:
	setx	0x44010c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_203:
	mov	0xb, %r14
	.word 0xf4f384a0  ! 4607: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_1_334:
	setx	0x450227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7abc820  ! 4609: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb9a8c820  ! 4611: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xb5a00540  ! 4614: FSQRTd	fsqrt	
	.word 0xb1643801  ! 4615: MOVcc_I	<illegal instruction>
	.word 0xb934f001  ! 4616: SRLX_I	srlx	%r19, 0x0001, %r28
cpu_intr_1_335:
	setx	0x30304, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_336:
	setx	0x45020b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_373:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_373), 16, 16)) -> intp(1, 0, 3e)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb1a00040  ! 4625: FMOVd	fmovd	%f0, %f24
cpu_intr_1_337:
	setx	0x46023c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_338:
	setx	0x470039, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_194:
	mov	0x8, %r14
	.word 0xfedb84a0  ! 4630: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb7a4c8a0  ! 4632: FSUBs	fsubs	%f19, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9ab8820  ! 4635: FMOVPOS	fmovs	%fcc1, %f0, %f28
	lda	[%r18 + %g0] 0xf0, %f2
	.word 0xb9aa4820  ! 4643: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xbda54960  ! 4644: FMULq	dis not found

	.word 0xbdab0820  ! 4651: FMOVGU	fmovs	%fcc1, %f0, %f30
iob_intr_1_374:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_374), 16, 16)) -> intp(1, 0, 37)
	.word 0xb7a81c20  ! 4653: FMOVRGEZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a80820  ! 4657: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb7aa4820  ! 4659: FMOVNE	fmovs	%fcc1, %f0, %f27
iob_intr_1_375:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_375), 16, 16)) -> intp(1, 0, 30)
cpu_intr_1_339:
	setx	0x47011c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_376:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_376), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_rd_195:
	mov	0x1b, %r14
	.word 0xf0db8400  ! 4668: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb7a489c0  ! 4672: FDIVd	fdivd	%f18, %f0, %f58
	.word 0xbda54960  ! 4674: FMULq	dis not found

	.word 0xb2b54000  ! 4675: SUBCcc_R	orncc 	%r21, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5a8c820  ! 4678: FMOVL	fmovs	%fcc1, %f0, %f26
iob_intr_1_377:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_377), 16, 16)) -> intp(1, 0, 12)
	.word 0xbda81c20  ! 4684: FMOVRGEZ	dis not found

cpu_intr_1_340:
	setx	0x45031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_204:
	mov	0x3c5, %r14
	.word 0xf4f38e60  ! 4688: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_1_378:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_378), 16, 16)) -> intp(1, 0, 23)
T1_asi_reg_rd_196:
	mov	0x2e, %r14
	.word 0xf2db8400  ! 4692: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_1_341:
	setx	0x440130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa489e0  ! 4698: FDIVq	dis not found

	.word 0xb9a81820  ! 4699: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb3aa4820  ! 4701: FMOVNE	fmovs	%fcc1, %f0, %f25
cpu_intr_1_342:
	setx	0x47001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00560  ! 4704: FSQRTq	fsqrt	
	.word 0xb4bd8000  ! 4706: XNORcc_R	xnorcc 	%r22, %r0, %r26
	.word 0xb92c5000  ! 4708: SLLX_R	sllx	%r17, %r0, %r28
iob_intr_1_379:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_379), 16, 16)) -> intp(1, 0, 2b)
	.word 0xbdab0820  ! 4715: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xbbaa8820  ! 4717: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb1a409e0  ! 4719: FDIVq	dis not found

T1_asi_reg_wr_205:
	mov	0x33, %r14
	.word 0xf2f389e0  ! 4720: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_1_343:
	setx	0x44010f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_380:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_380), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_344:
	setx	0x460338, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_206:
	mov	0x35, %r14
	.word 0xf2f38e80  ! 4729: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbb3d3001  ! 4730: SRAX_I	srax	%r20, 0x0001, %r29
	.word 0xb9aac820  ! 4733: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xb5a80820  ! 4735: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xb93c5000  ! 4737: SRAX_R	srax	%r17, %r0, %r28
T1_asi_reg_rd_197:
	mov	0x25, %r14
	.word 0xf4db8400  ! 4742: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_1_381:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_381), 16, 16)) -> intp(1, 0, 30)
cpu_intr_1_345:
	setx	0x45023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a508e0  ! 4752: FSUBq	dis not found

cpu_intr_1_346:
	setx	0x46012a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_382:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_382), 16, 16)) -> intp(1, 0, 38)
	.word 0xbda548c0  ! 4757: FSUBd	fsubd	%f52, %f0, %f30
iob_intr_1_383:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_383), 16, 16)) -> intp(1, 0, 6)
	.word 0xb5a4c8a0  ! 4760: FSUBs	fsubs	%f19, %f0, %f26
cpu_intr_1_347:
	setx	0x460004, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_198:
	mov	0x3c5, %r14
	.word 0xf2db8400  ! 4763: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_1_348:
	setx	0x450126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00560  ! 4770: FSQRTq	fsqrt	
	.word 0xb084210c  ! 4771: ADDcc_I	addcc 	%r16, 0x010c, %r24
cpu_intr_1_349:
	setx	0x46000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80c20  ! 4774: FMOVRLZ	dis not found

	.word 0xbdab4820  ! 4775: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb4b5e044  ! 4776: ORNcc_I	orncc 	%r23, 0x0044, %r26
	lda	[%r16 + %g0] 0xf0, %f2
iob_intr_1_384:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_384), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb1641800  ! 4785: MOVcc_R	<illegal instruction>
T1_asi_reg_wr_207:
	mov	0x1b, %r14
	.word 0xf0f38400  ! 4786: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_1_385:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_385), 16, 16)) -> intp(1, 0, 10)
	.word 0xb9a9c820  ! 4788: FMOVVS	fmovs	%fcc1, %f0, %f28
cpu_intr_1_350:
	setx	0x44020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a50860  ! 4790: FADDq	dis not found

	.word 0xbba48840  ! 4793: FADDd	faddd	%f18, %f0, %f60
	.word 0xb7a549c0  ! 4795: FDIVd	fdivd	%f52, %f0, %f58
T1_asi_reg_wr_208:
	mov	0x3c1, %r14
	.word 0xf8f38e40  ! 4796: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_rd_199:
	mov	0x1b, %r14
	.word 0xf6db84a0  ! 4799: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb3a50960  ! 4803: FMULq	dis not found

cpu_intr_1_351:
	setx	0x440037, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_352:
	setx	0x45011d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_209:
	mov	0x2a, %r14
	.word 0xf6f389e0  ! 4806: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xbcc54000  ! 4807: ADDCcc_R	addccc 	%r21, %r0, %r30
	.word 0xb5a84820  ! 4808: FMOVE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_200:
	mov	0x1a, %r14
	.word 0xfcdb89e0  ! 4809: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbda5c920  ! 4810: FMULs	fmuls	%f23, %f0, %f30
cpu_intr_1_353:
	setx	0x460334, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_210:
	mov	0x2a, %r14
	.word 0xfaf38e40  ! 4814: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_1_354:
	setx	0x46022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda5c840  ! 4817: FADDd	faddd	%f54, %f0, %f30
	.word 0xbc8c8000  ! 4818: ANDcc_R	andcc 	%r18, %r0, %r30
T1_asi_reg_wr_211:
	mov	0x5, %r14
	.word 0xf0f389e0  ! 4822: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_1_386:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_386), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb9a9c820  ! 4828: FMOVVS	fmovs	%fcc1, %f0, %f28
iob_intr_1_387:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_387), 16, 16)) -> intp(1, 0, 13)
cpu_intr_1_355:
	setx	0x460107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3abc820  ! 4837: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb1a58860  ! 4838: FADDq	dis not found

iob_intr_1_388:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_388), 16, 16)) -> intp(1, 0, 2a)
cpu_intr_1_356:
	setx	0x47013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00520  ! 4843: FSQRTs	fsqrt	
cpu_intr_1_357:
	setx	0x450130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a81c20  ! 4848: FMOVRGEZ	dis not found

	.word 0xb3a48960  ! 4853: FMULq	dis not found

T1_asi_reg_rd_201:
	mov	0x29, %r14
	.word 0xfedb8e40  ! 4855: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb6b58000  ! 4858: SUBCcc_R	orncc 	%r22, %r0, %r27
	.word 0xbf500000  ! 4861: RDPR_TPC	<illegal instruction>
cpu_intr_1_358:
	setx	0x460308, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_359:
	setx	0x460016, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_202:
	mov	0x7, %r14
	.word 0xf8db84a0  ! 4866: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb52db001  ! 4867: SLLX_I	sllx	%r22, 0x0001, %r26
	.word 0xb9a5c920  ! 4868: FMULs	fmuls	%f23, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbb341000  ! 4870: SRLX_R	srlx	%r16, %r0, %r29
	.word 0xb1a40840  ! 4871: FADDd	faddd	%f16, %f0, %f24
	.word 0xb7a40840  ! 4874: FADDd	faddd	%f16, %f0, %f58
	.word 0xb1a5c9c0  ! 4875: FDIVd	fdivd	%f54, %f0, %f24
	.word 0xb1abc820  ! 4877: FMOVVC	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_212:
	mov	0x36, %r14
	.word 0xfcf384a0  ! 4880: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_1_389:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_389), 16, 16)) -> intp(1, 0, c)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_rd_203:
	mov	0x26, %r14
	.word 0xf0db8e80  ! 4890: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb9a88820  ! 4892: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xb7a00540  ! 4893: FSQRTd	fsqrt	
	.word 0xb7a4c940  ! 4894: FMULd	fmuld	%f50, %f0, %f58
cpu_intr_1_360:
	setx	0x450229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a58940  ! 4901: FMULd	fmuld	%f22, %f0, %f26
T1_asi_reg_rd_204:
	mov	0x16, %r14
	.word 0xfedb8e40  ! 4902: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbe34c000  ! 4903: SUBC_R	orn 	%r19, %r0, %r31
T1_asi_reg_wr_213:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 4904: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_361:
	setx	0x44001d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_362:
	setx	0x44003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c8c0  ! 4908: FSUBd	fsubd	%f50, %f0, %f56
T1_asi_reg_rd_205:
	mov	0x3c8, %r14
	.word 0xfedb89e0  ! 4909: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb9a588c0  ! 4910: FSUBd	fsubd	%f22, %f0, %f28
	.word 0xb1a4c940  ! 4912: FMULd	fmuld	%f50, %f0, %f24
cpu_intr_1_363:
	setx	0x45003b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_364:
	setx	0x44022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_wr_214:
	mov	0x18, %r14
	.word 0xfaf38e60  ! 4917: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_1_365:
	setx	0x440229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_366:
	setx	0x46021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xba3d0000  ! 4926: XNOR_R	xnor 	%r20, %r0, %r29
cpu_intr_1_367:
	setx	0x47032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28c8000  ! 4930: ANDcc_R	andcc 	%r18, %r0, %r25
	.word 0xb1a548e0  ! 4931: FSUBq	dis not found

iob_intr_1_390:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_390), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb5a88820  ! 4939: FMOVLE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_368:
	setx	0x470021, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_391:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_391), 16, 16)) -> intp(1, 0, 3f)
cpu_intr_1_369:
	setx	0x450007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaade191  ! 4950: ANDNcc_I	andncc 	%r23, 0x0191, %r29
	.word 0xb1a90820  ! 4951: FMOVLEU	fmovs	%fcc1, %f0, %f24
	lda	[%r18 + %g0] 0xf0, %f2
	.word 0xbfa81820  ! 4956: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb1a548c0  ! 4958: FSUBd	fsubd	%f52, %f0, %f24
iob_intr_1_392:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_392), 16, 16)) -> intp(1, 0, 8)
	.word 0xb5a508c0  ! 4962: FSUBd	fsubd	%f20, %f0, %f26
T1_asi_reg_rd_206:
	mov	0x3c6, %r14
	.word 0xfcdb8e60  ! 4965: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T1_asi_reg_rd_207:
	mov	0x3c2, %r14
	.word 0xfadb84a0  ! 4968: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb7a5c8a0  ! 4970: FSUBs	fsubs	%f23, %f0, %f27
cpu_intr_1_370:
	setx	0x440210, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_371:
	setx	0x470328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb60d4000  ! 4975: AND_R	and 	%r21, %r0, %r27
	.word 0xb5abc820  ! 4976: FMOVVC	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_208:
	mov	0x3c2, %r14
	.word 0xf2db8400  ! 4978: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb1a5c9c0  ! 4980: FDIVd	fdivd	%f54, %f0, %f24
T1_asi_reg_rd_209:
	mov	0x36, %r14
	.word 0xf2db8e60  ! 4981: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_1_393:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_393), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_wr_215:
	mov	0x6, %r14
	.word 0xfef38e80  ! 4983: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T1_asi_reg_wr_216:
	mov	0x1a, %r14
	.word 0xfcf38e40  ! 4985: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbfa00040  ! 4987: FMOVd	fmovd	%f0, %f62
	.word 0xba0520eb  ! 4988: ADD_I	add 	%r20, 0x00eb, %r29
	.word 0xb1a40820  ! 4991: FADDs	fadds	%f16, %f0, %f24
T1_asi_reg_rd_210:
	mov	0x9, %r14
	.word 0xfadb84a0  ! 4994: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb1a509e0  ! 4996: FDIVq	dis not found

	.word 0xb1a48860  ! 4998: FADDq	dis not found


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

	.xword	0xbf3be83c60303521
	.xword	0x53f9e5a2bafc28ae
	.xword	0x9e71572c76117ed7
	.xword	0xb7ca656441887ee5
	.xword	0xe45a323da5b9428c
	.xword	0x5146f9e28893f4f5
	.xword	0xcf7d6011715eb563
	.xword	0x873a481430e248c5
	.xword	0x4f6df43f5e223189
	.xword	0xe860b07e52387afd
	.xword	0xdc6781d3f4fcd07b
	.xword	0x516169daddf49ee0
	.xword	0x124ce77ec844714b
	.xword	0x80d01895bd3cdc3e
	.xword	0x2da405afa1d3ecbd
	.xword	0x92065cc89902b9e7
	.xword	0xadf6963f47f51d74
	.xword	0x85ea7eb73dc82aa6
	.xword	0xa396e155706c4d43
	.xword	0x706ff6baf4cc6849
	.xword	0x7a448da184ae3be5
	.xword	0x21c13596e8896460
	.xword	0x7d157e9555dfb0ce
	.xword	0xe24f1f78b92538e6
	.xword	0xcca5baebe823ca71
	.xword	0x1cedf7f1a77dc5ed
	.xword	0xb2dde0cda6a3d9e6
	.xword	0x81e29b752e21bbf5
	.xword	0xd5fb672b13ac9d95
	.xword	0x58865c250c1b237a
	.xword	0x0709d1f1355cac59
	.xword	0xdc0c36f09ad12eb0
	.xword	0xdeb542717d0d4c98
	.xword	0xd565073a43f2a604
	.xword	0x0a66ccca9334580c
	.xword	0x2c40ea5699c9dc99
	.xword	0xcdc7444a8a6707f2
	.xword	0xd17ecbcc95a49b68
	.xword	0x16bf40ded21879b6
	.xword	0xc1d573ad4e1931e8
	.xword	0x49ca6c1c0a02dd2d
	.xword	0xf5474edc8a9fa572
	.xword	0x6c5ddc58b2a69f86
	.xword	0xae61615bdb408c34
	.xword	0xcf8dba0691ee98b6
	.xword	0x622c1f10a0bdfd92
	.xword	0x03cc91d53aead1ef
	.xword	0xbe21800a0e17ddb7
	.xword	0x0801f691e45a2f71
	.xword	0x2c480eae35f8dddc
	.xword	0x5235bedd8d8377c4
	.xword	0x51abc76b5555ef5e
	.xword	0x6acfd578b1d91748
	.xword	0xe39e45259071e738
	.xword	0x8ec0e8a7abb1bb4c
	.xword	0x9f592cf59f356852
	.xword	0x205cba94559ee048
	.xword	0x1b5c1a71a450204c
	.xword	0x6c764e5cfc65b7dd
	.xword	0x24f44174e953383a
	.xword	0xeec99be828f79bea
	.xword	0x0c510b161c834582
	.xword	0x33920adbc5e57693
	.xword	0x528589434ff696b3
	.xword	0x2acee4c68b0b27ed
	.xword	0xc45917143522b439
	.xword	0xba75528fa10946a0
	.xword	0xa21ec4c067bfdec0
	.xword	0x7a1ad6cc91c50400
	.xword	0xc74edbb317ad8ecc
	.xword	0x1fe480b976831206
	.xword	0x3ff99ae4c7f51995
	.xword	0x283c2a24b38c1453
	.xword	0x282547dee7996d8e
	.xword	0xc498eb2ac4781bb5
	.xword	0xa75c51a3bfda6958
	.xword	0x2783f4a5cebb21fc
	.xword	0x5b8a26a9ca45f273
	.xword	0xe3472c9b59826a9d
	.xword	0x45b1b6781d5b8c95
	.xword	0x8d0e315a7773d53a
	.xword	0x2291c15539bc5ed0
	.xword	0x47f5ca39833521c8
	.xword	0x966778afaf8dd17a
	.xword	0xdffd44d49f7539c2
	.xword	0xd82f420c9a27bca4
	.xword	0x6306e569079af443
	.xword	0x9f79c74c78761c05
	.xword	0x9aaf82079312b3e3
	.xword	0x46ac9aa343fb6758
	.xword	0xfd0b2c5e2a34e4cb
	.xword	0x2244e3bc4c8fbad3
	.xword	0xfb08c2a866c69fcd
	.xword	0xf4547a6c0b18fc19
	.xword	0x8c3dc9719f99a704
	.xword	0xc37da59670982112
	.xword	0x3ae75bde9c085014
	.xword	0x7ed55acd11fcf23f
	.xword	0xa9dbb116c42d40d9
	.xword	0x77dc5db4079e0601
	.xword	0xbe829b45408713b4
	.xword	0x5a1a6e06e257b989
	.xword	0x42352e8d63d208a2
	.xword	0x0ab3443d8b71b58a
	.xword	0xd5cfad2a3a9ce8c1
	.xword	0xb0c1db2e88137b92
	.xword	0xf18578cba1bf032a
	.xword	0xbee6130e02456ff3
	.xword	0x9a14ea58a9317a84
	.xword	0xb3cee0df7e0426be
	.xword	0x30a5ea2f2b09fa21
	.xword	0x2ee7b878d5868d0e
	.xword	0x930c68d2aee10862
	.xword	0x30be41a6087b63ac
	.xword	0x6569b71133ed49ba
	.xword	0x33efe6bc8165ec66
	.xword	0x7e502cc98f1a13d3
	.xword	0xead88911ee41a032
	.xword	0x36ce6bec60505097
	.xword	0x3ee163be6ba3a928
	.xword	0x1907bab178caafc9
	.xword	0x7b7675de3c892903
	.xword	0xbdca28350d746e8d
	.xword	0x6f7915d7baaa11ca
	.xword	0xa686b96ee33bea72
	.xword	0x14fb132803693165
	.xword	0x3de2ceb455700767
	.xword	0x9223179f90b53373
	.xword	0x754a93a4acb7dd43
	.xword	0xa72c5404fa4feeed
	.xword	0x4da8abb3ffbc5746
	.xword	0x5f0d7ab2cd5f6c4e
	.xword	0x8656f3464d1f379c
	.xword	0x01c356677c883764
	.xword	0x4c6dfbfc9a812670
	.xword	0x53f3f25bc1ea4160
	.xword	0xd2b511d5670db6f2
	.xword	0x508a7f0d089de257
	.xword	0x09da783e99cbd2c7
	.xword	0x479d98456bac84ed
	.xword	0x469482b9cd5d4a07
	.xword	0x7f5abef99fab8717
	.xword	0x7bdc7a78ca3e9162
	.xword	0x0d252f5c2279a7b0
	.xword	0xd7368754b1368c37
	.xword	0x0464ad929b706b0b
	.xword	0x7dad8d4fa9b03763
	.xword	0xd34f6b170c5af003
	.xword	0xc4627ac75dbaa7e2
	.xword	0x56db2e759834ef0a
	.xword	0xacc8d5889402260b
	.xword	0xb0915eff6bedcd83
	.xword	0x642eadff0501ee72
	.xword	0x4f56afb683d1b9c3
	.xword	0xfcdd14acd4b1362b
	.xword	0x4bb6493cca37bb6c
	.xword	0xe99eba033be7dda0
	.xword	0xc8f23b5d266b28e7
	.xword	0xff7caabd93f6b720
	.xword	0xc92aae9e1e070805
	.xword	0xa68603b40f318340
	.xword	0x547c72f8289ae2f9
	.xword	0xa6148c98afc66ea5
	.xword	0x668412476cbaa11b
	.xword	0x63546908bbaf6457
	.xword	0x32f4d9d553e769c8
	.xword	0xc7305022850d36f9
	.xword	0x44695693fc550b08
	.xword	0xe358b75d33758e11
	.xword	0x5027bca3a4955c76
	.xword	0x70b84334b1916a10
	.xword	0xa800446c143b4269
	.xword	0x9a4777ef48606f84
	.xword	0x72b3f9cd70c12d2d
	.xword	0x120404fb96378ca7
	.xword	0x6cd8731ae136bfea
	.xword	0x9924eb8362872c5f
	.xword	0x26b2673f15a76061
	.xword	0x97673da88396b1c3
	.xword	0x3a4023d41d395507
	.xword	0x5924e4592419f937
	.xword	0xb7f9a89e52f85fb0
	.xword	0x2c441bfd35f6e0bf
	.xword	0x16602a9ab3abb26b
	.xword	0x8c53eae1ffc4202c
	.xword	0x812b1dedaa2e5c24
	.xword	0x7ed35e4a59977e1e
	.xword	0xcfb2a51a415a1406
	.xword	0x28a4bd40a2730a4c
	.xword	0x6cd507e93d52a80b
	.xword	0xd5d0a4600c91d53d
	.xword	0x04f192cb9078c1bd
	.xword	0x35885ddc2b4f44f4
	.xword	0x875836bfc6f79d8f
	.xword	0xe0b7215e01ac53d3
	.xword	0xa21ed01940b1ebd6
	.xword	0xeed86ca5f4161a8a
	.xword	0x1e00de5c9f8cc626
	.xword	0xac78c40cd5bbf17f
	.xword	0x81d183ec6ba7cd07
	.xword	0xe6af4c3dccdc1cd2
	.xword	0x280ef3c7c0026ec1
	.xword	0xca6d42fd320e95eb
	.xword	0x0157bbffe63184e7
	.xword	0xab6e6dcd4bb46e88
	.xword	0x735e8b9ad5c048c3
	.xword	0x18f5ffa03d67b30b
	.xword	0x4940c939c95995e8
	.xword	0xd5b2ea6688f0158e
	.xword	0xf2b915b6ddc75e94
	.xword	0xe3e34cafc9d89734
	.xword	0x9ad3335f843b9610
	.xword	0x9ddaad4757653dd6
	.xword	0xbfc052b48cceca20
	.xword	0x95d50fc5277ab493
	.xword	0xa3b1046f7545f708
	.xword	0x4647af0a283df321
	.xword	0x18ac4ce7270fd146
	.xword	0x04abd290f6185ec6
	.xword	0x81628d6b7b4276fd
	.xword	0xb79d7cc08d3b1e35
	.xword	0x6b4211959433e220
	.xword	0xc711c2fdf6c8f578
	.xword	0x834c7cae44ed1c6b
	.xword	0x913b12a30ea3e78c
	.xword	0xa7571df97cca5187
	.xword	0xa6c94da1021d2fa2
	.xword	0x84e322dbe1d15683
	.xword	0xe08264bb0dc66b25
	.xword	0xfd02d4d74d5ee905
	.xword	0xc614b10577b5fbce
	.xword	0xbef4bbaca08d9d3d
	.xword	0xc58aacadd83ddd3a
	.xword	0x952dcdf4377fab99
	.xword	0xcb248ed1903a0923
	.xword	0x9071fff756b9f0ba
	.xword	0x97ed3058df345cf8
	.xword	0x606ef5d20ce4bf77
	.xword	0xadbb7777eebf1873
	.xword	0x797860fd00c5771d
	.xword	0x5831ea9b3b349e2b
	.xword	0x3c58f31d5a6c0f43
	.xword	0x9a790ea0db3e3cf0
	.xword	0xbee6d99076fb5e1e
	.xword	0x2c44165845b5cd24
	.xword	0x62b5e2ff14435aee
	.xword	0x5d9737c33a8d0044
	.xword	0x1c9724a1833e66ff
	.xword	0x96ad47a69274531d
	.xword	0xd4a9a8854d1fe441
	.xword	0x6977c50633f3fedf
	.xword	0xa8e8fc5a3932d35f
	.xword	0x8730e3c65369730a
	.xword	0xf7f040092c966ab5
	.xword	0xb5606ddf53c10aaf
	.xword	0x58af7dfae6294dae
	.align 0x2000
	.data
data_start_1:

	.xword	0xaae992a2d724ef34
	.xword	0x981bbe4e972e46ad
	.xword	0x3a4b2a97b413a090
	.xword	0xe06c59daae9810c8
	.xword	0x129eab81d60a79be
	.xword	0xf315910e98ce673e
	.xword	0x8d9f6b535ccb028a
	.xword	0x1cbcaffbcdd95152
	.xword	0xb50f6516b294636f
	.xword	0x123dfe5e94d02876
	.xword	0xd10cfdbd3fb53cec
	.xword	0xfc12f9445c388b55
	.xword	0xae039d21837472e3
	.xword	0x0b81974d0e2cd84d
	.xword	0x34bdc992d2acdd76
	.xword	0xc3ef5b58f4e7ff4c
	.xword	0x6c618d4d37ffa10a
	.xword	0x291b085bd6eb0c67
	.xword	0x65f6cd49f65de41d
	.xword	0x6aeb614f8853d314
	.xword	0xf7b7ec476333b281
	.xword	0x5c0b42eee9d45366
	.xword	0xcd0e1893fbe77f0f
	.xword	0xb253aee972959e5d
	.xword	0x44ec6b7088bad023
	.xword	0x29101770503e2ba3
	.xword	0x58ddf6637940b141
	.xword	0x9eab7864504c335c
	.xword	0x0069d99bdea57eb8
	.xword	0x840fd1e8a0d40c5b
	.xword	0x4ae32b6b959ea3df
	.xword	0x3040e31a94719171
	.xword	0x6ec20c6489f16986
	.xword	0x198b11ee9d82686c
	.xword	0xbe0059c02ad03ab9
	.xword	0xf5545d7df84017e0
	.xword	0x636e65cea821ee2d
	.xword	0x6264843911513f14
	.xword	0xa7523aac07528441
	.xword	0x6180fc1b44540105
	.xword	0x7d73f3795477ce64
	.xword	0x5916518692ef2b58
	.xword	0x95c4c2fa5b728701
	.xword	0x087116c3700f7a4e
	.xword	0xd8313d8b30761107
	.xword	0xc90794df54517de4
	.xword	0x0a5eb61dce03cc55
	.xword	0x077f1de7d7cf1d3c
	.xword	0x12c2cd9ae71b8628
	.xword	0x960aae6b68516f7d
	.xword	0xd60bbb09f54af930
	.xword	0x2304a9fabbd957c7
	.xword	0x4314844b311172e5
	.xword	0xa8d6b124dfe5b65c
	.xword	0x121c7bba2d19b30a
	.xword	0x8272d5197bb13b25
	.xword	0x9b52fc92f9c7d3c4
	.xword	0x019edf92854c3201
	.xword	0x50fe03f607390e12
	.xword	0x06b889af7a03f569
	.xword	0x8eb087b225438b78
	.xword	0x28cf194dae0078b5
	.xword	0x14f5caa8ffaab1a6
	.xword	0x5b3ec5ce2f29c418
	.xword	0xadf5cbd95ff74b32
	.xword	0x3c9725efbf88465d
	.xword	0x092380d9cbc32666
	.xword	0x65561ad6ab9220c5
	.xword	0x87ad9f4a9d41ddca
	.xword	0x4e9416f2bbe31328
	.xword	0xb52105bf9618b3ac
	.xword	0xbf57ee8473f0f20d
	.xword	0xa2a676a75269bab5
	.xword	0x76c09e80155543d7
	.xword	0x4078c0ccdcf24d02
	.xword	0x68afc39e54a4b3dd
	.xword	0xb7c3d9810b16e3c0
	.xword	0xbf5d7fe45a630dd1
	.xword	0x745e5238d9ee8e7c
	.xword	0x9838365fc0a926c7
	.xword	0x7d1f4dfa230f06bb
	.xword	0x10a60d610c94c5ba
	.xword	0xbf7ed7e75f17c1ea
	.xword	0x1bbc760172be8e8a
	.xword	0xcb43df7e4dc495cb
	.xword	0x03313c5697d4c04f
	.xword	0x5aa831227afa2987
	.xword	0xab53eceb9d455631
	.xword	0xc5578898df623d8a
	.xword	0x5f7961de9d94913b
	.xword	0x68fe1707302946e9
	.xword	0x445ec9c14c983400
	.xword	0x9b98d61add7a6a42
	.xword	0x35a2cd342b2726cc
	.xword	0x34c9709a322d68c1
	.xword	0xb7030302f9564375
	.xword	0xe54512975532adc4
	.xword	0x991f086ccf748fa9
	.xword	0x1767dce56a2f9ece
	.xword	0xa2cae6112d51a61e
	.xword	0x899e64eb67b97646
	.xword	0x3e84030361f8b9a4
	.xword	0x916ffd589b2c52cd
	.xword	0xbc4b233a8a6ece7b
	.xword	0x53f9b13ff6770fa5
	.xword	0x798c9cac2e024405
	.xword	0x67350ca7a3df1c74
	.xword	0xd66e4528b4ba1b04
	.xword	0x28eb811f13675433
	.xword	0x32d253b526e6cb0c
	.xword	0xe9a1d54ea742b097
	.xword	0xaa7d4fb41a6d7b80
	.xword	0x4f1ec0c6a0ea5ac5
	.xword	0xde245d4481e7ab30
	.xword	0x9b219f678642a4c5
	.xword	0xca99506fc5aea941
	.xword	0x67b57388c4d4e276
	.xword	0x21dcd93fd52890b2
	.xword	0xb44512f918363fb0
	.xword	0xe48be97cdc5e6cd9
	.xword	0xdd81fcb76c3948fa
	.xword	0xc66391f9eea52d66
	.xword	0x8581b8e7eaeb2ebd
	.xword	0x0026ad3a964db7d6
	.xword	0xc40ff1656776c83a
	.xword	0x14368cd07d96563a
	.xword	0x522887e195068e2d
	.xword	0x9a0866f501a13578
	.xword	0x71c8d40acfd165e3
	.xword	0x9b1c36cdae44a578
	.xword	0x298d1ce1db675c74
	.xword	0xc1b5852bbccb7223
	.xword	0x622182eb1ba9ee10
	.xword	0x92d57dc450457ec1
	.xword	0x8db124376efc4067
	.xword	0xab7a5d11848c773e
	.xword	0x92a91a95e5148dbd
	.xword	0x75b5351f4b11e871
	.xword	0xe73ca723773c4b2a
	.xword	0xa5a631be18551b1c
	.xword	0xd0d4d2c765cbba6b
	.xword	0x6731635bae188b2d
	.xword	0xbb781aa57d7a98a5
	.xword	0x6050af7fb63d4fa2
	.xword	0x80896626e6f0ad69
	.xword	0x41f44926433342f6
	.xword	0x7e0fe0dfadaa5187
	.xword	0xce0616a0582d81ae
	.xword	0x654e3bfebb9adf39
	.xword	0xc2c6f702d50248ee
	.xword	0x3118dc2acdfba7e2
	.xword	0x77f36705c8a39256
	.xword	0xdf8edcafc39ab5fc
	.xword	0x1213c1e7cdbd3114
	.xword	0x60fdee2de3b16945
	.xword	0x460f892f0e365ae8
	.xword	0xf4900a6894facee2
	.xword	0x6d6ccaad1aeed615
	.xword	0xec8b1cbae7fe5121
	.xword	0x829bb82017d8244e
	.xword	0x8c3ab1a19a7561c0
	.xword	0x0ab1befef8a94613
	.xword	0x2dde9a1d78e14272
	.xword	0x630e43e6f89280d2
	.xword	0x9178bd96411d0618
	.xword	0xffe658eecb1fe331
	.xword	0xc45a8035581b14c5
	.xword	0x9d8e1c53b498010c
	.xword	0x4bc6ce4c49b4affe
	.xword	0xf041c76d4470cc58
	.xword	0x338a824311a437af
	.xword	0xa778427b13ee60f8
	.xword	0x9aa92cc3c370bc3e
	.xword	0x68069b7f5a7928ac
	.xword	0x9bd5c6185d614786
	.xword	0x4aa86d7c94bacade
	.xword	0x977ea2c8eda75396
	.xword	0x830794d5e89c3cc9
	.xword	0x4bf3d0ed48069ef6
	.xword	0x5a2f8660160e82b9
	.xword	0x04188ec1f0994ec9
	.xword	0x6df5cc6f2b83a32f
	.xword	0xbc8f100b4ca36e34
	.xword	0x128f349630ef576b
	.xword	0xcf774fd562637bd4
	.xword	0xe619591e1df39245
	.xword	0x3ad45e9f4a59a632
	.xword	0x371db357a1b9967e
	.xword	0x444fda6b5ddb2822
	.xword	0xe2fb222a624c18c6
	.xword	0xbcef6895fb6b7b49
	.xword	0x9f7a27595ca42aab
	.xword	0x2a5226b2f7424bc2
	.xword	0x4e21e8ba525cd604
	.xword	0x7f92ce61a5b7a4d9
	.xword	0x7f947c8746fb1a0f
	.xword	0xcc5b219272410312
	.xword	0x5f5d9a36058fc918
	.xword	0x029fb6195366a007
	.xword	0xbe84e8920fa3f089
	.xword	0x6f6eb2a955fb1287
	.xword	0xc7c695518e66c178
	.xword	0x1eb040ac96bbe9cc
	.xword	0x52b098f6db00f77d
	.xword	0x7a7fa351003c54f5
	.xword	0x7f0705b9a77f0555
	.xword	0x0622b10b94e9292e
	.xword	0x598873f44357a54c
	.xword	0x91e0e00894568cfb
	.xword	0x7b1280f63fed8833
	.xword	0xcc07e91c2ddc632e
	.xword	0xbe81725a43113443
	.xword	0xc73a937aca0a5f9b
	.xword	0x23821ca58d3f09c0
	.xword	0x754889d726472d98
	.xword	0xb69565b6e8dc7e31
	.xword	0xe3b469dc8fce2990
	.xword	0x6c2f7350be0745e5
	.xword	0xd68e6df6dbe4af98
	.xword	0xc6acc589b3182e04
	.xword	0x2a30510a9436b319
	.xword	0x97a903875d241447
	.xword	0xbb3679ffeb8bf4da
	.xword	0x9d0bf50842931eab
	.xword	0xe8cee1e4c00ce4ba
	.xword	0x65f763f9e0afc1da
	.xword	0xc2c8e285b66d8e74
	.xword	0x033816efb3458c28
	.xword	0xb264aa02ee8a0789
	.xword	0xa36da32c8def1be5
	.xword	0x942e2575e0a02d2a
	.xword	0x13e746580065a8f8
	.xword	0xd345596aa484a9da
	.xword	0xd765861f785be76e
	.xword	0xd433ee13284b176f
	.xword	0x1234fdbb185f3a7e
	.xword	0xf7e39ec263e46a0f
	.xword	0xf0e2e784465f4ced
	.xword	0x01c4a78fc735c480
	.xword	0x7a8f9d4a2fec95fb
	.xword	0x975042d474f5e073
	.xword	0x63219027618cfcf6
	.xword	0x957cdf2db09a1833
	.xword	0xfcbee928a0583b2d
	.xword	0x413227a7ac8670eb
	.xword	0x3ca3a3bf3583d528
	.xword	0x39409cba3f87ff9d
	.xword	0x09e13a505958b4bd
	.xword	0x8bdb1f8b05eb87cd
	.xword	0x33bb61b4a60f6271
	.xword	0xd131caa426b304c9
	.xword	0xd97de32e0de3fce2
	.xword	0x57fbe3de3d5a62ff
	.xword	0xd78e19f021af67e6
	.xword	0xdd83001f3e0cb45c
	.xword	0xa06fb60cb0f4216e
	.align 0x4000
	.data
data_start_2:

	.xword	0xc95676cfb940fdee
	.xword	0x77262d6314b19279
	.xword	0x642166c9cb3e0ac5
	.xword	0xd25b7b4c3eeedbd3
	.xword	0x3ed3e93749d38068
	.xword	0x5662ebe6db5b32e8
	.xword	0x4b5d26d0cc66ba7a
	.xword	0x484c88a2615d6081
	.xword	0xef5a7622ceb02bf2
	.xword	0x1f9408d2d8d85cd1
	.xword	0x4c04819c9919c185
	.xword	0x1db4225f15988f1f
	.xword	0x55dbf90f7d136c8a
	.xword	0xcd17f41a14f68938
	.xword	0x26f200181362c5ec
	.xword	0x89d793765b236139
	.xword	0xb67ae74cc9a415f5
	.xword	0x6e29aa5bd38712a5
	.xword	0xe2b39c78e82691bb
	.xword	0x60c45687f681b5a1
	.xword	0x7cd692dbb585ea7a
	.xword	0x80aacdf3c4c6ae17
	.xword	0x91191f0c0c8b6ff5
	.xword	0x59929781c5b04d5c
	.xword	0x90d9e1293178109e
	.xword	0x5252bfe991735d53
	.xword	0xc26d56bc701ce6d1
	.xword	0x2c164012f7304e2c
	.xword	0x6012ea0228831db4
	.xword	0xbd251977f9c7f33d
	.xword	0x300c20743d7a2dc0
	.xword	0xaa8f238c1297ae9c
	.xword	0x121278e705eb2de8
	.xword	0x86201b98512ca3a6
	.xword	0x2e7f4141a4e47be6
	.xword	0xea7d19f7d94576dd
	.xword	0x2de74be4b7325e30
	.xword	0xe9643d74038a0289
	.xword	0x6079183c7f041415
	.xword	0x40abc1fc2543b117
	.xword	0x011a77a0415fc6f1
	.xword	0x4bde8dcd0d428a7a
	.xword	0x48d60d02fec21651
	.xword	0x0c683c516ed4669e
	.xword	0xdb422f09756451ee
	.xword	0x20c68e833c45cc23
	.xword	0x039b418ce4efc3c5
	.xword	0x314be8b121d7fbe0
	.xword	0x3d7efd2f33eeb016
	.xword	0xd4a09f7b9f146e7a
	.xword	0x60ef16666dd6ce50
	.xword	0x6dc598eb9a6cd3ad
	.xword	0x8a916919ea42acb6
	.xword	0xbd2dc78ffd106c3a
	.xword	0xf5838a3f2324e695
	.xword	0x7f1809a636c8416d
	.xword	0xc643be6635c5814d
	.xword	0x6badec2da6388b6a
	.xword	0xbbfcd693b8940dbd
	.xword	0xcd359c98ba8cd4b5
	.xword	0x4a243e0ca2e0ee80
	.xword	0x1f5203f84f907aaf
	.xword	0x0049b9e90384d814
	.xword	0x95434697e369b2b4
	.xword	0x0e0abfd708ae9b6e
	.xword	0x20f6817ce49502c0
	.xword	0xa762bbf6a090fbfd
	.xword	0xd74b0b9bf7dbf425
	.xword	0x4746beec29fd36b4
	.xword	0x9e5b3d32f9f32518
	.xword	0x316acaa4b7d1a93a
	.xword	0x3a80c5b86b662a65
	.xword	0x9fcf1c301b4f58fd
	.xword	0xe51aadc84be6c3cb
	.xword	0x1b7be75e397f387f
	.xword	0x1ebf455135bd7030
	.xword	0x1081958f21693d0b
	.xword	0xa71fa4e04d1b4ba2
	.xword	0x1f5b2d8ea5eab950
	.xword	0x3484dca271247f3e
	.xword	0xdc8cd364fd118965
	.xword	0xa502ddafc8610272
	.xword	0x1657db1c85ef0873
	.xword	0x3c294fe297ea55d6
	.xword	0x669a43d019615377
	.xword	0x28ee43aec2454d53
	.xword	0x1ea55422fcdcfc16
	.xword	0x385ed4902210b211
	.xword	0x05bdea1401aa0625
	.xword	0x16688a830dab0a7b
	.xword	0x2f3c4327a32d2d8c
	.xword	0x5c0a08e03d398b1a
	.xword	0x412372b2963e5ab9
	.xword	0x01b9e8971056b685
	.xword	0xbf16c52b0301ff17
	.xword	0xb7db13a1bc995c74
	.xword	0xc9794f91d4f5b558
	.xword	0xcfe6ba46cda3eac8
	.xword	0x7b78fb56b36f7343
	.xword	0xfd832fe250f2996c
	.xword	0x5571b4a1a6eff6e5
	.xword	0x8df51bdad030fdcb
	.xword	0xadb95d126b3bf0d3
	.xword	0xd014297ee199f23b
	.xword	0x3c1875f0e8945d90
	.xword	0x71b2eef14e7c6baf
	.xword	0x25bd7cc6b858e28b
	.xword	0x205a31f04b58b214
	.xword	0xe9badddee40c637b
	.xword	0xade8f5b2fd770ba2
	.xword	0x44057ae1c3503131
	.xword	0x5f23912c7cc439a7
	.xword	0x408241bc37b287be
	.xword	0xcb437ed54bec701b
	.xword	0xc37759fdd28b68e9
	.xword	0x32ce72818000ab92
	.xword	0x97d6e3eaf54fd56f
	.xword	0xcac3003ab595d407
	.xword	0x70b5a5a74d28c5c4
	.xword	0xcd5cddcde57f9a05
	.xword	0x3974935b563e238d
	.xword	0x6e5a3243b37f8232
	.xword	0x6a79f3eedfd3ffcf
	.xword	0xae66ea6cf4ff2bbe
	.xword	0xa6b5844b725b11c0
	.xword	0xb3d57c61cdcb91b0
	.xword	0x06c0b9f76d880312
	.xword	0xb3ce7c9d62f60bcb
	.xword	0x58b417c9777cb807
	.xword	0x0502ff68c067f39c
	.xword	0xb79230576bc1b1a6
	.xword	0x4181abac945e1d8a
	.xword	0x9b5ae3109adcc214
	.xword	0xc7303149988ac8d3
	.xword	0xc770c8a3f334721a
	.xword	0xcde0972abb3dd94e
	.xword	0x340712e025e23fc6
	.xword	0x18865393bfaa0317
	.xword	0x7fdead6de1fa99c7
	.xword	0xea67257216715d57
	.xword	0xc673d90f6ef14b57
	.xword	0xac5106642566338a
	.xword	0xad77f90b08a53839
	.xword	0x5d047c6d92ff88a8
	.xword	0x55eda7a0927e4c93
	.xword	0x2b2673434f7cc209
	.xword	0xd947f6c5a525e90c
	.xword	0x02f2127986aca107
	.xword	0x2125c1e636cdcdd2
	.xword	0x6807170ad2b17a9e
	.xword	0x8f122f46cd5415f3
	.xword	0x64682cca89130c97
	.xword	0xa3ca7e0f832953af
	.xword	0x6251adb532142c15
	.xword	0xe1cf198e1f0d27f2
	.xword	0x63384fbdb63ce264
	.xword	0x1abca9743c6461c3
	.xword	0x8540da71c6e717df
	.xword	0x96a26f7cd9d4adee
	.xword	0x4553cb7548760f49
	.xword	0xe4b5da818ecd032e
	.xword	0x8c69709e69fcde32
	.xword	0x00df474d30e6c5bf
	.xword	0x34098d2045461e9e
	.xword	0x2061b2846700ff2e
	.xword	0x712bd8a67790c931
	.xword	0xc7acc027302d1f26
	.xword	0x7125bae28a3f8597
	.xword	0xff80ea1da20542d9
	.xword	0x4ec2b152e04acfcf
	.xword	0xe7986011e72f1c0a
	.xword	0xf56973e4aaf97fee
	.xword	0x7076a3606d12700f
	.xword	0x51556c515c507977
	.xword	0x1057b50460b58ce0
	.xword	0x2b872fafb326998e
	.xword	0x4dfc90b6c99deeb1
	.xword	0xafd5c9442eb0a920
	.xword	0x0ca4541fe46c2883
	.xword	0x02f110089a2e9e5c
	.xword	0xb2b6856430730c1b
	.xword	0x16c3c5a6c9339474
	.xword	0xf3d1c63ed4f3e165
	.xword	0xce73740a8d64dee6
	.xword	0x6282caa39510d802
	.xword	0xbdb2f813924dd497
	.xword	0xde6b3c1365467e03
	.xword	0x5e43a594540bc951
	.xword	0xc9e965de3a604fa9
	.xword	0xdcf587b7e0954705
	.xword	0x76f72bcfe3c312cd
	.xword	0x213d61798e23bac3
	.xword	0x02be9d1594e09f8c
	.xword	0x50f9e4e4adc3653b
	.xword	0x7ccd0999b5a010a1
	.xword	0xf2a4eb366bb60d2e
	.xword	0xefd087b91586050e
	.xword	0x22895b154fd41454
	.xword	0x2f53aba0e0d7f22e
	.xword	0xade5fe7ff6770536
	.xword	0x665c21bf878e25a7
	.xword	0xd8e68aaa2ae4c9dd
	.xword	0x936dd71f02f81a8a
	.xword	0x90fdca5da7ca0f5d
	.xword	0x95765c4211192dcb
	.xword	0x48bfe32710f43316
	.xword	0x3199bca3d4fd776a
	.xword	0xd34824a18f98a326
	.xword	0xe5bd3685c52a909b
	.xword	0xaabf0de23dd69ae6
	.xword	0x473574d20ae1b281
	.xword	0xdebb88542d3a1253
	.xword	0x95d142d45226473f
	.xword	0xca32fab3e963b450
	.xword	0xa3990ce8e6a80d27
	.xword	0xeab7d542332dcaf7
	.xword	0x59a6970035cfb21d
	.xword	0xe25bb495e2e830ca
	.xword	0x8127a885f1664814
	.xword	0x6880b6702fbcdd3a
	.xword	0x47732c62b9ac800e
	.xword	0x485a934a305282ec
	.xword	0x41f453a2e256067f
	.xword	0x2b292751aff7535e
	.xword	0xbe864e5bc81e2a77
	.xword	0xc6b38ca045620a36
	.xword	0xcaefd64911da41bf
	.xword	0x55922e1149a47f04
	.xword	0xa54c1d7d5edba91c
	.xword	0x5a5b4e3af4396495
	.xword	0x6314a46087f5ceaf
	.xword	0xd4a469695cb6baf8
	.xword	0xf3b143c73fd1713c
	.xword	0x7b3c21883526269d
	.xword	0x4d041c267a68eea4
	.xword	0xa5d96ffcaa435440
	.xword	0xaeea75f2dc299d83
	.xword	0x4cfa771bbb9c464b
	.xword	0xad4e67ccfa28f381
	.xword	0x1368a9c5b4a01f45
	.xword	0x7e247c5cc67c7e98
	.xword	0xe8c8b4b977947c11
	.xword	0xd2d9ca6b1663a06a
	.xword	0xcc0cc76d36c31c99
	.xword	0xe40c9e94bfdd1370
	.xword	0x25195de1ecb2b2d0
	.xword	0xc779ab7aba8e0156
	.xword	0x98145fa6934760cd
	.xword	0x73a9e8c6f409c0da
	.xword	0x67561f40ccc3161b
	.xword	0x242b9b5a54697840
	.xword	0xf688984deb4563d4
	.xword	0x4bb9e1f8dac08b75
	.xword	0xed2d41c49973c60a
	.xword	0x6ea98b7f4c7d777f
	.xword	0xf7dfd1fab84af44d
	.align 0x8000
	.data
data_start_3:

	.xword	0x914b18a8ec85bf89
	.xword	0xef90a7a33bd10fec
	.xword	0xbdaae571329cb5bc
	.xword	0x1a9fc14637905730
	.xword	0x6082225305e8adb1
	.xword	0xbd379c86ac53851f
	.xword	0x6d4fc2f6f698d72c
	.xword	0xab99bd03eb1703e1
	.xword	0x4c3b49e54dbeeb56
	.xword	0x9fde05d1ea890bd9
	.xword	0x2bd5759496f2a086
	.xword	0x9e1e61154adf27c7
	.xword	0x177b3f9d1efc204f
	.xword	0xa2b48ea22323c166
	.xword	0xd38f5bbbd955a812
	.xword	0x8da208f06eb025b7
	.xword	0xd66c752362097567
	.xword	0x0b1a7855011075d5
	.xword	0x7b7b88f32ae127cc
	.xword	0xcbac320d4b6a4e45
	.xword	0x599596b183992b99
	.xword	0x2fdc6e257412927d
	.xword	0xed1469b0cbe682e6
	.xword	0x1cbaf83c993b16ab
	.xword	0xdd4c5240a0c749cf
	.xword	0x1e8e9e9b3f605c17
	.xword	0x052e4e755969988e
	.xword	0x7290d5be0bbb1252
	.xword	0x32d22c534831cc47
	.xword	0x4cf6c16f0d8f52b0
	.xword	0xd5f48922ddc795b6
	.xword	0xb71b075bd478c6d5
	.xword	0xc9d0dc8fc5afe1d2
	.xword	0x1f9f61c5d2e99167
	.xword	0x2fb34d1132da6648
	.xword	0xfa3b43ab4a96e80f
	.xword	0x90ced69d5681917f
	.xword	0xc618b02e014c9689
	.xword	0x26745a4f844d447d
	.xword	0xcca2a01dc2b72131
	.xword	0x73f34a235ff34d23
	.xword	0x4651f7b78138b095
	.xword	0xcbeabe8467946014
	.xword	0xfd97508788ebfaec
	.xword	0xf0a0ae0364e9e272
	.xword	0xbce5f6b5a62b4a97
	.xword	0x1de02127e9d77208
	.xword	0xb6e587816f26c7fc
	.xword	0x1d32724b0190613e
	.xword	0xfd7abda770901af8
	.xword	0x801f6c10d472b0ff
	.xword	0x64b7e200b4cf0825
	.xword	0x159957d4f76fbb23
	.xword	0xbbe7780d513dab77
	.xword	0xcf6cd4603f9cfe0d
	.xword	0x7b9df0ba22bf4536
	.xword	0xadc784c8b842028c
	.xword	0x94bc7dff428ffcd2
	.xword	0x34ce79d363a1443f
	.xword	0x585fa21bb4db73af
	.xword	0xba201b87ab910caa
	.xword	0x65931143c607fb74
	.xword	0x544bfded157d4ac5
	.xword	0x1ce9041ac5309878
	.xword	0x67007426ac510e2f
	.xword	0x20b35362f30aa561
	.xword	0x347f861bc2b9da29
	.xword	0x834db52289680652
	.xword	0xe578acf04b18a152
	.xword	0xa674e5eb6a6b5e25
	.xword	0xce5ba4bd00feaa7b
	.xword	0xeaaee378d27e2a27
	.xword	0x7bd2a518817200b2
	.xword	0x9a5dcc6b7a463bb3
	.xword	0xc854090ba788b819
	.xword	0x5de167856cbe7e52
	.xword	0x5a8de470c797dfd0
	.xword	0xabf8560615a4d49b
	.xword	0x12fbb2cd23f22f98
	.xword	0x2098100cfc964470
	.xword	0xadc7ab43c0d9ffb7
	.xword	0x07b194995cfc2601
	.xword	0x66070996405b51b1
	.xword	0xebae14332bb163da
	.xword	0xe74e96012d681e06
	.xword	0x5fc6d5377c0bcd33
	.xword	0x796b132644d3a786
	.xword	0x360865f469cd5c10
	.xword	0x4c342225f6aca0de
	.xword	0x1c3f717275293b07
	.xword	0xcd0a5d521d05052c
	.xword	0x5fa6d5227c3661f9
	.xword	0xc2ee61e1fbe8af39
	.xword	0x4a6f369279a3d326
	.xword	0xd57f87fc2394113e
	.xword	0x9578268ce98f3992
	.xword	0x45d92fff10f6549f
	.xword	0xc1ddc15eb3a41e65
	.xword	0x6ac51876fe393661
	.xword	0x4c2267b6032b08d4
	.xword	0xb066bc287488beae
	.xword	0x568dead86e626647
	.xword	0x20afd8df5d554414
	.xword	0x83cc2abd4a916737
	.xword	0x6c35c5872f0cf518
	.xword	0x0a4b27a479d4180b
	.xword	0xf2e068abdfe763db
	.xword	0xb7fd41af1ce801e8
	.xword	0x22e9de1078483798
	.xword	0x55f2fdc8092dc0ad
	.xword	0x34686bb41dc36248
	.xword	0x40470e1bc2064ee9
	.xword	0x77df25b844102f4f
	.xword	0xb5a450650a5ac43a
	.xword	0x92aff7956b850266
	.xword	0xd9981df879dd00e5
	.xword	0x17e593b67d2f6e17
	.xword	0xc1c12994ed3693aa
	.xword	0x363ca7720578c5b3
	.xword	0xd70c25f1783489d2
	.xword	0x6d0a4acba2632871
	.xword	0xbc39f2a852d3ab3e
	.xword	0xd3432689c256eeda
	.xword	0x69903b01ebb8bcf6
	.xword	0x9fcf92b3f24e2d17
	.xword	0x673ed46defd53549
	.xword	0x663a8d38f894198c
	.xword	0x1f2987aed683cfb9
	.xword	0xc2bc9b265cd255c4
	.xword	0x691622f8e1f5ea8e
	.xword	0x38f4ac532dbf5f53
	.xword	0x3a82738c7d7be40b
	.xword	0xf9c5e861a27610f5
	.xword	0x36597d884d696fc0
	.xword	0x9f41c465c3d79ab8
	.xword	0x82fb99ae64010c1b
	.xword	0x1e7d48dce8fa480f
	.xword	0xa1a92ea3494125f5
	.xword	0x9a4eb03b8cc06e20
	.xword	0x6e8d206dc4a43931
	.xword	0xec02f20884c9746b
	.xword	0x0f10c1847458b61d
	.xword	0x504d0296b8b57fe0
	.xword	0x08e8b82be6427391
	.xword	0x30810bc702c0fd08
	.xword	0xd81bd4ed85181e68
	.xword	0xf2a52e36bfca1894
	.xword	0x2b47520945c40b6e
	.xword	0x7e976beeb617d749
	.xword	0x5f31adc9d2119bc3
	.xword	0xf45ec03a44dc507d
	.xword	0xc47ecf6a2b95b8ec
	.xword	0x2365b2a586ee344c
	.xword	0xa8e78562aa81a405
	.xword	0x5901d87b755c8497
	.xword	0x0e49b6aa809967ce
	.xword	0x566b733ad06fb0b8
	.xword	0x0a89f15fc96c1cd8
	.xword	0xd31e8d3704f2dbb3
	.xword	0xee002bd74b4b3093
	.xword	0x0115455aa616a6d8
	.xword	0x71c38c70f3ecd0d5
	.xword	0x97de80445e9b2cee
	.xword	0xbf48004b58a226d6
	.xword	0x1ec740362db1d065
	.xword	0x1b8adb7ae2b1ace6
	.xword	0x236c3cd5b309255d
	.xword	0x7945de41dcd9caca
	.xword	0x72c9acf8abcdcdf7
	.xword	0x9b529a4f1e05891c
	.xword	0xd9cda39c6002a521
	.xword	0xe45745af2a3be711
	.xword	0x30ffb9c02c63b677
	.xword	0x96117fe8ecf1a4a6
	.xword	0xa16661dd1605f3c4
	.xword	0x07e21da33e2ee525
	.xword	0x4ccdbde5c00956cc
	.xword	0xcb873811544690bf
	.xword	0xda98a8d9223259fa
	.xword	0x2bc4f55939acb71b
	.xword	0x25a4c9d59be29080
	.xword	0xb213e26125fa26c6
	.xword	0x802d7c4a67d138f6
	.xword	0x260b130a68c56cd4
	.xword	0xdd897d8882441495
	.xword	0x5beadc0bb4f1d6c9
	.xword	0xfe3cb986eb7f5d1d
	.xword	0xe6c3f13ba292d0a4
	.xword	0x6aa1c42ab2f28d66
	.xword	0x50e9846cbef5148b
	.xword	0x2cd8fd36ec2a3409
	.xword	0x6b8e24600e3ef3f2
	.xword	0xaff569bd2a1fe5f1
	.xword	0x952bd6f17c0f2938
	.xword	0x0f3fa8543c92713a
	.xword	0xc2d3a8263eacf876
	.xword	0x3e91ee84a8c5323a
	.xword	0xf6b296438af7e279
	.xword	0xcbf132b4b329497f
	.xword	0xb8a8ebe25c8728b7
	.xword	0x0b0bd6002e446843
	.xword	0x380d424b50aaf9c5
	.xword	0x60b24ea17e90141e
	.xword	0xc8f63021cdd8d248
	.xword	0x3fa8949591a541a7
	.xword	0x6e60e846410c688e
	.xword	0xdc62da76908b91b0
	.xword	0x4cf978d7cd87c5c6
	.xword	0x3131e7d83ccd42fc
	.xword	0xe00d6cb6534c15c4
	.xword	0x59e14de44c67c288
	.xword	0x4f3e16981d20a834
	.xword	0x227f83991d53f6a9
	.xword	0xdaeeb86eaf315d45
	.xword	0x70e100c259f78e9a
	.xword	0xa16aeb1463e7c023
	.xword	0x0c30c69484b6e67e
	.xword	0x02969cdfc7d8a08e
	.xword	0xb639f90e24f4945b
	.xword	0x0c34bf29c76b9fa7
	.xword	0x1eda62aeef9f0187
	.xword	0x1fe5579752bbea4a
	.xword	0x499772a8f3c914af
	.xword	0xbe29ba47569e6b8a
	.xword	0xe2a62fa859d80cdc
	.xword	0x9edff6b4773bac90
	.xword	0xb3f1921834dc0a55
	.xword	0x2f7ee0c338cc107f
	.xword	0x1a31886fd83fe196
	.xword	0x6261d44c5365e52d
	.xword	0x65126dd5a383bb62
	.xword	0x544d42f62798ffb0
	.xword	0xe9fd996e105748d9
	.xword	0xd12b8470f65a1a3e
	.xword	0x8e4c0f34bdd9a946
	.xword	0x345a1912afb00058
	.xword	0x9afc6a0a5f07bbbe
	.xword	0x9e052a4b80ca0ac5
	.xword	0xbc6ae73dbe68fba2
	.xword	0x54421322fd6cf4a0
	.xword	0xbb9f20ce6472fce1
	.xword	0xd1edeaaed7c7f49b
	.xword	0x3e006494fdf264f0
	.xword	0xedf22b4db91abffd
	.xword	0x08d7446a4ddb79ce
	.xword	0x354a6fd87a8124d9
	.xword	0x6c54a13514f76e9a
	.xword	0xea034cd6a3e032a6
	.xword	0x78a8d60da06ce7a4
	.xword	0xb60bb2166ad8b6ab
	.xword	0x422d15361426b7f4
	.xword	0x5839f2953169f318
	.xword	0x870fe6fab389a3f6
	.xword	0xd5842566cf2e1687
	.xword	0x33906fd9f198a49f
	.xword	0xf9089ab58e0bdb4e
	.align 0x10000
	.data
data_start_4:

	.xword	0xbf85ce69d1bf5f6f
	.xword	0xf07de93f0e6ebd8c
	.xword	0xd1f2ac8e283812b9
	.xword	0x37c60d8ba459614e
	.xword	0x0ecd8f1d6864a837
	.xword	0x4906ef2038e6de3c
	.xword	0x086f56baada5d95f
	.xword	0xb4e3e36a31d98073
	.xword	0x7f540d6b3727303c
	.xword	0xc605beb1ebba49ad
	.xword	0xf2c40680ea11c31f
	.xword	0xc2d652ad7f60370c
	.xword	0x3899492ba04682d1
	.xword	0xa032b7f1a9ff4ebb
	.xword	0xc353da5842996262
	.xword	0x1767f10f4053ff8d
	.xword	0x8be2f285cb08f7f1
	.xword	0x11a95a2a69b1ca55
	.xword	0x33b9efdc9527e774
	.xword	0x7d0865376b79c043
	.xword	0xd237c838b11d43a4
	.xword	0xb4075f8fecaa419c
	.xword	0xb988ef3e773ef7a6
	.xword	0x87470fa2d904dba8
	.xword	0xb09aae9a6b9eb4ee
	.xword	0x5e46287a18a79ae6
	.xword	0xb67bc4c880904a22
	.xword	0x956dd55f1633f8d1
	.xword	0x48d352a4fcffeebd
	.xword	0x3c164c4b26a1176a
	.xword	0xe9cc8c3b91e667e8
	.xword	0x0e48d1fb0f8df66a
	.xword	0x2c460ffa7c8f637a
	.xword	0xd56e578c91803c53
	.xword	0x7a1417b97b029666
	.xword	0x34e3efb04e6dfb9a
	.xword	0x41c31632ae01e79d
	.xword	0x4f93f2c75b82ebf0
	.xword	0x454dd6cf9edbdb11
	.xword	0xf6f61bd13cbb9c19
	.xword	0x55f13613c657ba99
	.xword	0xe2283c560d1cb545
	.xword	0xa1b279facab66dd1
	.xword	0xbf77104929e72419
	.xword	0x01749bc90cc3d4b8
	.xword	0xee5611fe217bb276
	.xword	0x7b3a3fb1356b5897
	.xword	0x312242c4ca0cd459
	.xword	0x9c1c76a441ef1a14
	.xword	0xa787268955d1c8b3
	.xword	0x4fe17ee82901cae8
	.xword	0xec6c738b2d92c8d2
	.xword	0x3892f1dfad55e6f3
	.xword	0x51bafacfe6e98c2d
	.xword	0x47d8fc6691b4ccee
	.xword	0x0099c5852219cc5b
	.xword	0x1ec3699f41f06566
	.xword	0xd96d33b74dbf86d2
	.xword	0xba00e876cdcd0af0
	.xword	0x2b56304db1820ab5
	.xword	0xd06b2d50d3453e5d
	.xword	0xe02db2e3127c3df4
	.xword	0xc66302f347d28f3b
	.xword	0x12eb1c64b0ce5140
	.xword	0x08447d32924e6df0
	.xword	0x0c25d984acdbc82f
	.xword	0x601e5b5c663993ed
	.xword	0x27defdc1288596a5
	.xword	0xe9b1ba9b05f3c3c0
	.xword	0xae228101396893c6
	.xword	0x6240eb074ae3ceff
	.xword	0xc2a3872c98268024
	.xword	0x70849f90e98e9162
	.xword	0xde7569155121ef34
	.xword	0xef603f79e6ef9dd5
	.xword	0xecc121022589e33d
	.xword	0x00efefa9097406f8
	.xword	0x67367157ce4cbac4
	.xword	0x489d60da638365f6
	.xword	0xac9f143a596e183e
	.xword	0x0e2819d695fe7f52
	.xword	0x55b99088b39710c5
	.xword	0xb62fc3de8b7461f9
	.xword	0xd484dbf9261ea22d
	.xword	0x87d132112146215a
	.xword	0x31d002ac9e2bc5c1
	.xword	0x9a51bcbb41640846
	.xword	0xc7c248c87d09a437
	.xword	0xb29d4f337ae06d8d
	.xword	0xded8ac9f97ae0dc4
	.xword	0x0cb3090e8266f00a
	.xword	0x535b35be7876c8b6
	.xword	0x7f7ae5e0f59e26f9
	.xword	0xf0643f54b3e87b88
	.xword	0x7baa4ebdf109ed11
	.xword	0x825c26bdb7396b97
	.xword	0xac252a84c064d731
	.xword	0xac0b9bcba35652d0
	.xword	0x7b386dd9596e845f
	.xword	0xa343f3bdd5038a02
	.xword	0x986d888535dba675
	.xword	0x9bb9f7b3feb1ad72
	.xword	0xbf18b3407585ce46
	.xword	0xcb512ca772ca26ed
	.xword	0x9404579096efe3e9
	.xword	0x2d6548164674afb1
	.xword	0xd6cd3e40efd16af9
	.xword	0x05a7d17625105e86
	.xword	0xa4309ecba86d9271
	.xword	0x990be7e6bd6c7304
	.xword	0x8bffb6f63a9c0636
	.xword	0xb816036bce36fb39
	.xword	0x26dde1af2a74acd7
	.xword	0xe4ec597cdf132c20
	.xword	0x2f4582b974a8b24e
	.xword	0x11f6bf872b103616
	.xword	0x6ed338fb2c38a80c
	.xword	0x99f713bc0e6c5aac
	.xword	0x320dafac709a1646
	.xword	0xc2139a3b5723aa43
	.xword	0xe2044ef840547a3b
	.xword	0xc767b048383a3e96
	.xword	0x3e57d1b67476e155
	.xword	0xa6e7c2b6ea2705b9
	.xword	0xd3449e6d3380534c
	.xword	0xe08ba5941e0c94f9
	.xword	0xe0db3b4b88b100e5
	.xword	0x6cfe481767def5a1
	.xword	0x5e2ae6455f29941e
	.xword	0xee6d0c4408d3b07a
	.xword	0x91d11bffc1678ccb
	.xword	0xeff0c47aeef84389
	.xword	0x5024a62c27e437ee
	.xword	0x705060b782084ba4
	.xword	0xa0ccaaa59a17c716
	.xword	0x0407d69efc4b998a
	.xword	0x52dcd8e0a50663fe
	.xword	0xb552bb5b6daaa7f6
	.xword	0x71d5fc3884fafaf2
	.xword	0xcf3258b3870c5a43
	.xword	0x8fd456efdb8ad207
	.xword	0x41e673b80d3a98c5
	.xword	0x558d24e64fef5707
	.xword	0x7608ad16b34e7a28
	.xword	0x8055ae424648ca41
	.xword	0xbffe57239703d7ec
	.xword	0x1713f8d46b2ab17b
	.xword	0xfec3777a85c79e69
	.xword	0xe47c076e5822ba6d
	.xword	0xd63654c0953caa65
	.xword	0xafc3a5d837afb0e1
	.xword	0x6ade4300f6a3fc57
	.xword	0x4733e4b02b2f3faa
	.xword	0xbcdd4560909e7293
	.xword	0x3fe3773c07e7e466
	.xword	0xc18d3475b6547e99
	.xword	0x8d84006e64a55aeb
	.xword	0x8edc6a03818ae1bf
	.xword	0x4d4c73c16a0e35a0
	.xword	0x6b7c86f08b58fc9b
	.xword	0x43545fcc4e866271
	.xword	0x5c09aafd9c26f269
	.xword	0xd0ddce602a20b119
	.xword	0x975e25398d91269b
	.xword	0xe24e7db7e88aaf74
	.xword	0x24ae263d64b633e1
	.xword	0x74c6e12b44e91ecd
	.xword	0xd56d0026134224f5
	.xword	0x343a5ddaa783212f
	.xword	0x255a600f1cf890f3
	.xword	0x950368d3e777944f
	.xword	0x5ca19cbc20c393ff
	.xword	0x40d54f60206ad02f
	.xword	0xe4d061c7681eaee8
	.xword	0x097b9a57dda8bf34
	.xword	0x47e42ba5b141c28b
	.xword	0xa7366a5d00f86ec6
	.xword	0xc892468b7bb46c6b
	.xword	0xd37239693141dd1f
	.xword	0x1e4925bc1d915817
	.xword	0x70601012ba8eb7d7
	.xword	0xe5172ca15c29681e
	.xword	0x874ad0e59f983344
	.xword	0x9ec7f279492b1efd
	.xword	0xffb857851fc85b43
	.xword	0x35a272e2b4e26c6a
	.xword	0x5c0d19b71028164d
	.xword	0x3cfdb80e9f3ea7f2
	.xword	0x6801011750c4f260
	.xword	0x48c1dcc13a35e167
	.xword	0xd8b09f48f31dca8d
	.xword	0x23b484e814ea1d91
	.xword	0x173f5c382ffd3d5b
	.xword	0x3660ff4659252305
	.xword	0x4d3f5ccd0fc322f0
	.xword	0xece6bf3eb2ca0acc
	.xword	0x7f5524ea8edc0b95
	.xword	0x8a53e9c7706aa07e
	.xword	0x86d757be744b7cf3
	.xword	0x8ce7b79c9b06bfaa
	.xword	0x0091ab916cb2b9f5
	.xword	0x826b090a213d7ac6
	.xword	0xf5853e42655050d4
	.xword	0xd42fd02dd49fa1d5
	.xword	0x19a0348e9ae565c7
	.xword	0x468aeab428bfa56d
	.xword	0xd8b6d67b21f6e512
	.xword	0x805fd3534d6c64f2
	.xword	0xfe7919d933801ecc
	.xword	0xcad89b3d8a05cd87
	.xword	0x2289317740a0a2f8
	.xword	0x8fa24897b233c821
	.xword	0xfe4e21f85356ce65
	.xword	0x5f8bc8b2ff2ea9a9
	.xword	0xe786f3b131c9384b
	.xword	0x5986fe0f816c6651
	.xword	0xb6501eff0311d22a
	.xword	0x3d4830ba62e62704
	.xword	0x8e3dc210eb692769
	.xword	0x366e060c817311b1
	.xword	0x9c4e3a238fc72b76
	.xword	0xf06340d500784e23
	.xword	0xe4d5e9660ece4902
	.xword	0x3382e1052944f00f
	.xword	0xdbfe7a55be7e6e0c
	.xword	0x14eb995632bd2b1a
	.xword	0x23e188ce4dd61a78
	.xword	0xadfd0d5098eb0c30
	.xword	0x2258d9e394493d92
	.xword	0x16a640cfb2b2bfd4
	.xword	0x2dda512f73cdc384
	.xword	0x64077e738c5821f8
	.xword	0x53ef0bb202ae8337
	.xword	0x4f6f9e4cc0891ce6
	.xword	0x256f87431a2d6a5c
	.xword	0x31defcd2e3298d49
	.xword	0xa2639bcaab31bd23
	.xword	0xd926e1ae3c3896fe
	.xword	0x60e564b1cd444b43
	.xword	0xe04829b6cc6e82c0
	.xword	0xca8a3971c7bf8022
	.xword	0xf8433b5905b22389
	.xword	0x78ada8b5aca3688b
	.xword	0x6ea54e2b255ab030
	.xword	0xc76325100d9f3221
	.xword	0xae4782ea09ddc457
	.xword	0xae38a610f9dede36
	.xword	0x8abc41c2f576d332
	.xword	0xd450884c3ef112e8
	.xword	0xe2a269bbd98f9405
	.xword	0xcf61b3280780338e
	.xword	0x9a1d47aac5cfafc6
	.xword	0xb693236526134b66
	.xword	0x6360d51c289144fd
	.xword	0xe21df7d81e3a3b2d
	.xword	0xef50e4e7974a0d28
	.align 0x20000
	.data
data_start_5:

	.xword	0xc2b1f0a2bd102795
	.xword	0x72cfb7a597fc7076
	.xword	0xd578a110b3a37d6f
	.xword	0x44266b12f0a504fa
	.xword	0x1fae8e1582659fd2
	.xword	0x0ea5bb039fb070fd
	.xword	0xe7cf71759e79c5b9
	.xword	0xaa3dd7a7b77ae725
	.xword	0xd3869da6bff5625e
	.xword	0x06261f02fa23b9d3
	.xword	0xba4341d74b38881c
	.xword	0xb904dd0d642128de
	.xword	0xb93dece794d0056c
	.xword	0xdcb2950a7608fb67
	.xword	0xa1b6924629a9dde9
	.xword	0xa48caae87bfba9ae
	.xword	0x8772dba68b52f0cc
	.xword	0x9504b7e93050472c
	.xword	0xa18b2e86a5dcfab8
	.xword	0x33ca7aeb5ad2bf9c
	.xword	0x7b7fa81750373293
	.xword	0x8eab4aa7a093bf38
	.xword	0xe05d07b46e440330
	.xword	0x91be08f0ce0010e2
	.xword	0xe55a637a044885e5
	.xword	0x1a73d81210ccb619
	.xword	0x4fbe0fa43d8c5f23
	.xword	0x4cb36e75908e1167
	.xword	0x3c5761f97d3e7395
	.xword	0x2fc18004c166aa5f
	.xword	0xe372fd64754927a6
	.xword	0x567d2d583fff2396
	.xword	0xd302afdc4e2f2218
	.xword	0x049706968064b8ef
	.xword	0xfc8dc78f402b6f11
	.xword	0x75a4020ef342852c
	.xword	0xa3ddeb275396582a
	.xword	0xb2b3bbfa217cc8ab
	.xword	0x7907ba06f6e1fbd7
	.xword	0xeb020d4815fc8ec7
	.xword	0xd1991bdea334ab21
	.xword	0xa4f9ec240d802201
	.xword	0x259634e651c7e8cc
	.xword	0x9dc42ed643911d0f
	.xword	0xa39861b21d42773d
	.xword	0x9f7570fb1faa8ed8
	.xword	0xc619d0b9a4ce6842
	.xword	0x2b1a65fae883cd8a
	.xword	0x87202ae10075ce27
	.xword	0xf522b7beb028014c
	.xword	0x229899d7a159fcc9
	.xword	0xe3406e09c96d245f
	.xword	0xb218aa34aa1bce8b
	.xword	0x5901aacc21ae1876
	.xword	0x44e503f8a522d8c3
	.xword	0x9c00bb903291ab3f
	.xword	0x28f1a9ccd3721367
	.xword	0x627028e6c3fed627
	.xword	0x934f738fdbad00af
	.xword	0x8182e66261952f36
	.xword	0x269e2b9981e544ec
	.xword	0xccaed6b018681191
	.xword	0x790ce7190f5b797a
	.xword	0x1e640d7397ee04a1
	.xword	0x5c0f2bed22f13463
	.xword	0x961d26717e6d8da6
	.xword	0x01167f173f204668
	.xword	0x26d5f72cbda635a3
	.xword	0xa902f1d68ca76526
	.xword	0x74c6748e17d8f807
	.xword	0x4fab69e5894fefbf
	.xword	0xf424871cd7060572
	.xword	0xfe136a9f5ddba41d
	.xword	0x4d9db0bf2d7649f6
	.xword	0x460c670b225cbfa4
	.xword	0x721c18813d72cd88
	.xword	0xe7c26f89124accf1
	.xword	0xd1ab164ee7d6658e
	.xword	0x7c88d73423a1f5ea
	.xword	0xd1da6f61da99bc6b
	.xword	0xaf31d13a33f48922
	.xword	0xd7afbcecf6a00ef1
	.xword	0x9ca8d8be401eff35
	.xword	0x5d2fcfdda290773b
	.xword	0xc2b1b104109eb307
	.xword	0x9146d45b00714e85
	.xword	0xdaa1b1c1b14474bf
	.xword	0xaa7251a65b65ce46
	.xword	0x4de52bb5f95325f6
	.xword	0xc6c4956411a209a0
	.xword	0xb49a40e875cfd700
	.xword	0xeb70cc8c5e89825c
	.xword	0xd4c5cbe74f472e8c
	.xword	0x50fac8eaa7a54762
	.xword	0x4b33869c5a350c59
	.xword	0x5b018377da4492ee
	.xword	0x8966b2bf44a7aecb
	.xword	0xe5257158be7c4a65
	.xword	0x424b787da19c5e02
	.xword	0x8f357d336db0f999
	.xword	0x38b1441ac7798402
	.xword	0x3d1a9c250f75721c
	.xword	0x83eafb4d84d8ecc1
	.xword	0x1cc971ebf8193013
	.xword	0x0a0b278932501b2e
	.xword	0x05bccb23d4200726
	.xword	0xb28bac37e0b88363
	.xword	0x16d388e7e1ae6380
	.xword	0x50b25a857ff3219c
	.xword	0xd334daa3ef420528
	.xword	0x03d4af3046d50899
	.xword	0xc6d23d7b86bb3faa
	.xword	0xda3469ec9743580f
	.xword	0xaf054084486ac211
	.xword	0xcf6c1e216048b453
	.xword	0xc8a9eb36d8a99d26
	.xword	0xc7239ecf3ed4f1bf
	.xword	0x0827ca1fe6adee2f
	.xword	0x1e48ec198ea4be5b
	.xword	0x4f4425b0253d87b1
	.xword	0x12ad93a7c0015e4e
	.xword	0x4f570e7c2b3a9755
	.xword	0x9747abcf91a8c941
	.xword	0x09da57722d5ac747
	.xword	0x7669443a5f9f4a24
	.xword	0xb5b8aee2cb548a3c
	.xword	0x4320836d3f68d538
	.xword	0xa8bc442ff641fd45
	.xword	0x5ee33bf30484cdf8
	.xword	0xcb09dc17eed18b1a
	.xword	0xa8c12e20c347e9fb
	.xword	0xf9045e1f203a6dc9
	.xword	0x4512ca7ec827b179
	.xword	0xe674a536d85989d9
	.xword	0x11914927d58dce20
	.xword	0x854916b0a4532cfa
	.xword	0x5f30042fe7eeb2b5
	.xword	0xe7767ba2ee803390
	.xword	0xd92cf284d891b95e
	.xword	0x175616b52fae5e4b
	.xword	0x3c5afc4a74c83c48
	.xword	0x8fe75d55d3969f1d
	.xword	0x18f75265805bbb8d
	.xword	0xb341556a70336b68
	.xword	0xd6619f89358f519d
	.xword	0x7997a7e60128ca9e
	.xword	0x99c2e86931924a75
	.xword	0x490eafdcb3950c8f
	.xword	0xfc8228610696d816
	.xword	0xb09ae810a7677052
	.xword	0x11ee164348221cc9
	.xword	0x62cd56d3682337b7
	.xword	0x50eaef7ad0c45913
	.xword	0x41f64d52300a5618
	.xword	0xa0f2144a7d09c503
	.xword	0x4551acc5f7ec9797
	.xword	0x9c5a963b08d705e9
	.xword	0xd46a35fd06aed64d
	.xword	0x25bee560dc3f86b2
	.xword	0x1df3c9d20cdc856a
	.xword	0xd90eed6716971310
	.xword	0xb3e9889ab0dee20e
	.xword	0xf25977c049d1dcca
	.xword	0x6cf9c365938fec86
	.xword	0x8c67977ed3d07f10
	.xword	0x366626242d088c63
	.xword	0xe6c6fc6b2dc65bf3
	.xword	0xc6eef7996459f6c0
	.xword	0xfce6f382f96b763a
	.xword	0x9a4ff2be9d6aa929
	.xword	0xd7e8fe568608992b
	.xword	0x262abfc7508284bb
	.xword	0x9b03ea150cb76a3b
	.xword	0xb99e0b5ae1f27e1b
	.xword	0x7fb7c43e2e808eed
	.xword	0xb820ed36b885d773
	.xword	0x443825d8b70498e2
	.xword	0xf261e27778b78c58
	.xword	0x0e1a71340bb315b0
	.xword	0xfcf0b51dab82d98b
	.xword	0xbc60d120eed426e8
	.xword	0x3d9e07085e999cb8
	.xword	0x65047043057381e9
	.xword	0xd60eb136642f1296
	.xword	0x9b80305538dd9e25
	.xword	0xf9050fa66fb823e7
	.xword	0xf34bc00398ec96fd
	.xword	0xde428061fd75bd6a
	.xword	0xc0c647ed87f143d9
	.xword	0xf43dfa82f9e34458
	.xword	0x22b2324a4b2006aa
	.xword	0x71082aff857b277b
	.xword	0xa267317c1ad7cecd
	.xword	0xeb9f085f4abe4a5e
	.xword	0x37d1662333b5ea47
	.xword	0x82669b9c1f51a6ac
	.xword	0xf33437cdce6d5008
	.xword	0xdd9375c308ee0581
	.xword	0x1b57703ccd1e38ce
	.xword	0xc6e3ea135ff956c2
	.xword	0x2aa68c01dc591f50
	.xword	0xfba7303df2296d1b
	.xword	0xcbb39a228712c84a
	.xword	0x45ff91748e110cf3
	.xword	0xbc4e6ee26abbdd7f
	.xword	0xdeec763186e018b2
	.xword	0x9d2665470b40f27b
	.xword	0x0d57781f74f20de5
	.xword	0xbdd92669389708f1
	.xword	0x46c5592cbb50de21
	.xword	0x6a55d1d6cb9f7bea
	.xword	0x058531f8e057432c
	.xword	0x1d6590c239bf0989
	.xword	0x93b19a1577d8f072
	.xword	0x40d64266484becf6
	.xword	0x8223f415aea93eb6
	.xword	0x7fe47c54113eb151
	.xword	0xa43fc8ca6be79b18
	.xword	0x248faaae368d57ca
	.xword	0xd7b20c0bb46b9d7b
	.xword	0x4d559627a61acd56
	.xword	0x2a5ca885114c36a2
	.xword	0x5e379a147184872f
	.xword	0x383d13894bcf5ac2
	.xword	0x055d1818dfdec1fd
	.xword	0x60b8c5b1d2f31765
	.xword	0xf6bf58ff050a8b86
	.xword	0xc542a8a1f3d78c67
	.xword	0xae7a0c46e0a72d57
	.xword	0x0aa019ac24413e31
	.xword	0xd46fe1a89d93ac81
	.xword	0x29c74b691264f2e7
	.xword	0x4aa29481a93a64f3
	.xword	0xc0f25fa942729726
	.xword	0xf785b2dedc9b4d72
	.xword	0x07594576717734bf
	.xword	0x32d3520153e4938c
	.xword	0xe17ffe44b5204dec
	.xword	0xf0ff6150063b3203
	.xword	0x9ba8c7bef366bafc
	.xword	0xbd7e9271ae02ec9f
	.xword	0xbfaac2e68ec14f3e
	.xword	0x1fa4a886a265ce26
	.xword	0x6bd24206839adebb
	.xword	0xe5807583b13a9698
	.xword	0xf20cc20990c76879
	.xword	0x27005bba03889420
	.xword	0x063f1441c071c350
	.xword	0xaa410e84c1070f24
	.xword	0x4828239a0c1816b2
	.xword	0x2805d998b5921340
	.xword	0xca1383d57b64d6b6
	.xword	0x6d56d43bd66be4ae
	.xword	0xf193f92d1bb893c7
	.xword	0xaadc3cbd066ba4cc
	.xword	0x737c3e88bbc7a89c
	.align 0x40000
	.data
data_start_6:

	.xword	0x4ee3a880b3cdbfcf
	.xword	0xaf8be85ef5cc377d
	.xword	0x3ef23e646cc72f42
	.xword	0xb47302eb25325825
	.xword	0x7fd40b4ec8762d90
	.xword	0xdb46cb43cb3d28aa
	.xword	0x85b6bc0fff094d50
	.xword	0xeefb8c9211d068a5
	.xword	0x62d5103387bba6e9
	.xword	0x161507778283aed1
	.xword	0xbbe9683bd8a681d1
	.xword	0x4da8ef7d4e6c9b3c
	.xword	0x5abae2a170c8e052
	.xword	0x79962f0f616c4a4d
	.xword	0xfd158651929c676f
	.xword	0x5445f853e3f47e28
	.xword	0x99e8b95b66ed2878
	.xword	0x79175d843be3c2a3
	.xword	0xdb6033b8fa8948ed
	.xword	0xe20ada74bb06c903
	.xword	0x21fa427e5b26dc3b
	.xword	0x4d4736bfea514ce6
	.xword	0xc651aa3caf0f4ca9
	.xword	0x3dd87e961531e329
	.xword	0x22021100dfa47cd9
	.xword	0x68094195c76da981
	.xword	0x05ab7d3a34ff052f
	.xword	0xa053470fb2c7968d
	.xword	0x305cfea1e59f29d4
	.xword	0x3c367f2b13a6edb4
	.xword	0xbd9a0ac7a24ca34e
	.xword	0xe338d5cbb78b01c5
	.xword	0x2d15eade90a9a986
	.xword	0xd9c57bf8cb059208
	.xword	0xcbdcc0deb4aa2f2a
	.xword	0x0059871cd4adc688
	.xword	0x7fa286a5a3302755
	.xword	0x1312f811c761d8cb
	.xword	0x749ebb3b9383fcf1
	.xword	0x811f6335979e23e9
	.xword	0x3c9dc6951ae1585c
	.xword	0x4fc53897d7eadd62
	.xword	0xf47977dc7cb5be06
	.xword	0x787cdfc561c4a788
	.xword	0x867348f660ecd94a
	.xword	0xb11a66977906a49b
	.xword	0xc02c623cd74bf864
	.xword	0x95288d137fe21618
	.xword	0xa7741bad7b85d747
	.xword	0x02aac350d8e75fef
	.xword	0x03ce4a86bc0b0b70
	.xword	0x4f88b3c7211743c8
	.xword	0x1b07a5594ba9344b
	.xword	0xe489c76b254f74cf
	.xword	0xd98ea9ece7a0193c
	.xword	0x2f748200bf833166
	.xword	0x1e5229c98640a859
	.xword	0x91331e7402f37daa
	.xword	0x007622ab1fd4b64f
	.xword	0x090fc7e57bee45ee
	.xword	0x12dde64e0b9798e8
	.xword	0xdee3a7b6e03260f3
	.xword	0x66aa1b1f5dab6ad8
	.xword	0x4d6cd8d7ab9d44d4
	.xword	0x80e58dceee91a6be
	.xword	0x6afb8ebc0d20376c
	.xword	0xdc917416094141e4
	.xword	0x98067f6b5775a53b
	.xword	0x4b068353c5df3032
	.xword	0x765ba7c3650c165e
	.xword	0xedc92b8f4bf36ef0
	.xword	0x082065a663338f4f
	.xword	0x5b5c0b78dfab2772
	.xword	0xc6307ddd34e8aed0
	.xword	0xb08b046572889dd1
	.xword	0x35012bdc2bcb3ad5
	.xword	0x0310798860cce0a6
	.xword	0xe5efa4e8bd19bdec
	.xword	0x380105987f419826
	.xword	0x41ece6c2543e7ef8
	.xword	0xda730bf802db6ff0
	.xword	0xfa2e2558b0e47693
	.xword	0x50d87329008bcb1a
	.xword	0x93d46d25f42a947d
	.xword	0xe18315e1e89be062
	.xword	0x89c256458c826160
	.xword	0x68f022a4f35ec29a
	.xword	0x9f7a0e7ab3cdba35
	.xword	0x94e9fd7a9efecf66
	.xword	0x664d26bd9fa889b3
	.xword	0x653bcc12651e17e0
	.xword	0xbaeb1acb131a7058
	.xword	0xc464ad4904ff30ee
	.xword	0x99b4efcf2dc86c1d
	.xword	0xa0ac5feafb57a8f9
	.xword	0xdbf131434c3c606d
	.xword	0xdb4a794cb5345176
	.xword	0x2f14f28b6312ba7d
	.xword	0x0d439524db534702
	.xword	0xc0b9de0cc3e094ff
	.xword	0x297b3cc51a242fb9
	.xword	0xa933ad0329569284
	.xword	0x64c0695e5973aa9e
	.xword	0x14988415e993feed
	.xword	0xc9669d4a78a680c1
	.xword	0x7dea7275f60a6fdd
	.xword	0xf372ebc81f3f5802
	.xword	0x378270a241ae2058
	.xword	0x41d9a7468de02672
	.xword	0x9e7a375dc0a8c56f
	.xword	0xae2b4934fae0ec17
	.xword	0x530890ebf3ebd55e
	.xword	0x20fefd8c29932fb9
	.xword	0x58a07dc05eb1f6ce
	.xword	0x9b30dcccdb9897b2
	.xword	0xfe7f9f64f93b79bb
	.xword	0x6c6a69c5494c638f
	.xword	0x4821e19049ffa428
	.xword	0xf3898eabc90e16fb
	.xword	0xf3175c2c2b6e75f8
	.xword	0xe94655bac98730a4
	.xword	0xab75feee756ba862
	.xword	0x03bcf6c13c9026f2
	.xword	0xf4e29cc8ffc24d48
	.xword	0xcfde55ee8d0d812e
	.xword	0xd1aa2f2baafbf72c
	.xword	0x2d70dcb5c819674a
	.xword	0xbe2ce784b91f2035
	.xword	0x2527a333b12295af
	.xword	0x2b1f7660e60972f2
	.xword	0xacb747923eae63c8
	.xword	0x1e03eacf03aae913
	.xword	0x8efb6fa168190ab9
	.xword	0xea2d32b3a575955b
	.xword	0xa809a97c801e5939
	.xword	0xa6eaa9d6bb98181d
	.xword	0x736154fd83cda0b0
	.xword	0xc516b6c6f8f25a9d
	.xword	0x4ca65845988c720d
	.xword	0x88d46db3d77cd666
	.xword	0x36136af10c8fdc3e
	.xword	0x40095462ccf5c755
	.xword	0x7cc166e8e016f050
	.xword	0xb410960130311f1d
	.xword	0x395ef339047483de
	.xword	0x785efa2145d8a85e
	.xword	0x65e7cda9c8fe4f51
	.xword	0xff9ef9c83804fdd8
	.xword	0xa55a7e46d4526a98
	.xword	0x215b5533a9d21ae0
	.xword	0xfa6d11cc315ccbf4
	.xword	0xc2680dcc8d2d615a
	.xword	0xdeae671e0381d330
	.xword	0xf2a943449a68e3fa
	.xword	0xcb17da1ea8f13fed
	.xword	0x1f6ecab874ce9d69
	.xword	0x6a014faa850e20df
	.xword	0x5c06070d487b7a33
	.xword	0x0fbcaa0a5c2300a9
	.xword	0x4e516bec4b9e8fe0
	.xword	0xd3b0fb2c153fa4bb
	.xword	0xb260ef556f6b4aa4
	.xword	0xc2b1a9f1b3611d71
	.xword	0x1fb63fa88c8c60de
	.xword	0xe3851354786e9e36
	.xword	0x51dff7f416901881
	.xword	0xb07b257057a85947
	.xword	0x6eed44981f1bceef
	.xword	0x1cffc33f16209e79
	.xword	0x22d015513e856542
	.xword	0xdf0b509ef22229a6
	.xword	0x0604168629433599
	.xword	0x9274338ad57cbb5b
	.xword	0x60399258b83f5201
	.xword	0x4bad2f492077a955
	.xword	0x74ef81c1b20b1e8a
	.xword	0x17bcc6244b6847a2
	.xword	0x61957cf75c4d933b
	.xword	0x8f0ade1555acc06e
	.xword	0x2ceb5f382ff8df3e
	.xword	0x6301d96b2ae1750c
	.xword	0x74b0028c74630b4d
	.xword	0x1e0408b0312bf5dc
	.xword	0xac1edeb847602af0
	.xword	0x9d3b0935427ad439
	.xword	0xaf2a9b3933a9f162
	.xword	0x195e66872dd1e050
	.xword	0x1abf9cdc6b6481c4
	.xword	0xc6a2d7a298d44369
	.xword	0xdd3759ebc22d04f8
	.xword	0x4fed056a4234e0b5
	.xword	0x60d759a3739d49f6
	.xword	0xc3254a7af0211c00
	.xword	0xa7e71d42dad25389
	.xword	0xe45d988f849fe43e
	.xword	0xa8ade3106ac0a2d9
	.xword	0x2741d37eb5db6fcf
	.xword	0xfd316717a4632231
	.xword	0x1ee2ba209873b791
	.xword	0xf798035b694e0433
	.xword	0x144dea5863965d73
	.xword	0x01bf8d9aceaf6a29
	.xword	0x65ebfad32d40ab34
	.xword	0xce58f9245502f217
	.xword	0xe4fcc8c928e3dc32
	.xword	0x5678cee26b191b4b
	.xword	0x8b85e7e2ef7fd27f
	.xword	0x2cb7ff752fe85c02
	.xword	0x61a356275b8790eb
	.xword	0x333dbddb8de536b2
	.xword	0xb85b800c721614bf
	.xword	0x7eb0a716f0674182
	.xword	0xcc53d91a4b82d564
	.xword	0xe4e39e33d45b4ad5
	.xword	0x282eeda7d50130ce
	.xword	0x92295f1d845a781b
	.xword	0xd6a18c89903ccb48
	.xword	0x8b5b790dc2832c04
	.xword	0xa2bb5a5dc9207740
	.xword	0xe32116173612771b
	.xword	0x0ad92739a7994539
	.xword	0x975b267defc21f28
	.xword	0xa1ea5339359b0b83
	.xword	0x5673fcdc1bc3b554
	.xword	0x8853e55c3279c8cb
	.xword	0x7563a23ce510f4e8
	.xword	0x56166ebbdd0b3cb6
	.xword	0xe0477ae4c673d122
	.xword	0xe9adabc9cb93e0bc
	.xword	0xa74016d141e9908f
	.xword	0x784eb937fedd8dce
	.xword	0xec357603886a604d
	.xword	0x1060afdf42a0eeae
	.xword	0x7b6d0a515e8eff80
	.xword	0x8a51d9970f79eec2
	.xword	0x09412b314e801b6b
	.xword	0x239c218722bc0fe7
	.xword	0xef6ba66d0af7677a
	.xword	0x4530903d491463cb
	.xword	0xa5b4df1928a48111
	.xword	0x871a8a1ce0157b8a
	.xword	0x418dc6a3e53450fd
	.xword	0x403d90c19dc35ce5
	.xword	0x785fa9213e899a1f
	.xword	0x57ccdafa18f9f04e
	.xword	0x67373f4d8ea9c033
	.xword	0xfb9753a9f4cd9751
	.xword	0xf4cab6686ac8656b
	.xword	0x049bf9d6e91cd2c6
	.xword	0xcb6cb6e9c3e64702
	.xword	0x7197dcc7c83ab3fb
	.xword	0x8edf9e710c19a703
	.xword	0xd5d47d638f645c05
	.xword	0x61277b616cf9dc61
	.xword	0x16321affd10a0541
	.xword	0xcdb53cba57d19b1f
	.align 0x80000
	.data
data_start_7:

	.xword	0x4d64bf5b6a29ff54
	.xword	0xeba6f4ea04126a97
	.xword	0xfdc6628a61932ee2
	.xword	0x407c5c6f63c63bf9
	.xword	0x9144093a2776a84e
	.xword	0xfc4bf436f1cf20b1
	.xword	0x426b15acace5002e
	.xword	0xaa86c07c0963348c
	.xword	0x849f81408c616b79
	.xword	0x7f8da1d2925bc005
	.xword	0x3f505030204684b1
	.xword	0x7418aef70f4841af
	.xword	0x6c933e09ff7595a3
	.xword	0x3de41a401b55de37
	.xword	0x160130c49b11cc86
	.xword	0xa5745fbe1f3be759
	.xword	0xbf85e87a62849b83
	.xword	0x59df8e8e859eb46b
	.xword	0x1cf7047e7a82d42f
	.xword	0x56b2dc98caab93e9
	.xword	0x000be5a389abb048
	.xword	0x8b092c540d281b60
	.xword	0x8b23fb489d82f973
	.xword	0x2aefce486f97342a
	.xword	0x28be0e7ab62ad32a
	.xword	0x0f3ea835fab181af
	.xword	0x32eec22eaf552f9b
	.xword	0x1112a174dce126a4
	.xword	0x70b4ac1dd2da256c
	.xword	0x32d3ed30167accd6
	.xword	0xa04e5dd0f90ca788
	.xword	0xec988057fa33ced9
	.xword	0x00ca1d7cf4271884
	.xword	0x1050f6219babd316
	.xword	0x71d82fba7e750f4b
	.xword	0xf55ab08e20cd5927
	.xword	0x174f96f4b5cba7a1
	.xword	0x9d8ba7a8749a166c
	.xword	0x12a55c8d25e8f307
	.xword	0x17aa01b7df3c353f
	.xword	0x65d42e08a6bd7fef
	.xword	0xc52daa240470aa25
	.xword	0x34ae5263f7e1fb35
	.xword	0x335fefa231dfbb54
	.xword	0xde266c4c1bdefc29
	.xword	0x5362a2e3186f5608
	.xword	0x638ae388cf82ed06
	.xword	0x10ac38a58b47de4b
	.xword	0x86d396cfc548070d
	.xword	0x7895e6941452331a
	.xword	0x4ffe3df08b94c47a
	.xword	0x446e858df3557057
	.xword	0x554b7478a6b12037
	.xword	0xb8bfee701cbbcf7b
	.xword	0x6d117bcdabea3432
	.xword	0xc69be8adb2d37320
	.xword	0xf4bc8e46fb0ac6cd
	.xword	0xa487f643222b5dc5
	.xword	0x3ff10b92add45e67
	.xword	0xb24695f63ac85552
	.xword	0xa7db151fc36fe05e
	.xword	0xa3e090ca02525ac9
	.xword	0x4386e09671faf5e0
	.xword	0xfa6ae021304fe225
	.xword	0x6a0248f3ad2f8574
	.xword	0x95a8bf1e4286bd4c
	.xword	0xd1017a193a1532e9
	.xword	0xf2c531fbbb3509da
	.xword	0xe3f0ce652088cab4
	.xword	0x0ed59c49d9add2b1
	.xword	0x8faabd6e5a130c43
	.xword	0x6a1a704a0510563e
	.xword	0x5b8013d38a812818
	.xword	0xcd6422eb3f1d2520
	.xword	0x278562a755b1cbcd
	.xword	0xcaff7f4ab1e34b26
	.xword	0x24c44902b2973ddf
	.xword	0xddb04da1cf3a3562
	.xword	0x1f2fbc55e8438dbc
	.xword	0x7d68e7227788e0ca
	.xword	0xb3ef2d013414d869
	.xword	0xfad9688da0922d78
	.xword	0x79abeb989a4ea0eb
	.xword	0x029e0a4fab3f46c9
	.xword	0x0eb15dfa1234bbc8
	.xword	0x11bb9a26888e0478
	.xword	0x4c6f043ba057eef1
	.xword	0x2e3d8e6b319c9ffe
	.xword	0x03b80bd36f563a44
	.xword	0x1808e721bc6521ab
	.xword	0x73800f8c78a85d94
	.xword	0xc5020431c1f0960a
	.xword	0x6ba7f5ba9631d3d1
	.xword	0xd993a6970dafa0b5
	.xword	0x403dbf7bd1ff969a
	.xword	0x9efe0cbd4684de68
	.xword	0xd321c71ab55b1d87
	.xword	0x8c27a4feca169365
	.xword	0xe0c5dab2727cceaf
	.xword	0x259429dba0f53af8
	.xword	0x4a312b9bb77168f1
	.xword	0x16bd429d47ee2262
	.xword	0x8ebae5dd97ce8ed3
	.xword	0x76bc2e6bc4a9cb07
	.xword	0x269bcbaddafdffd5
	.xword	0x8be5587c461ceb78
	.xword	0x4e3f517f180da316
	.xword	0xc8d8df277df9e7c5
	.xword	0x619322e4e7aceca3
	.xword	0x327b771cd6793aee
	.xword	0x846fead193e6f73a
	.xword	0xc8ad2fec14c1b117
	.xword	0xf5918041a222d548
	.xword	0x73a3f7e2120be537
	.xword	0xbc5064a8029d5714
	.xword	0xe499ec4435d9e1e5
	.xword	0xff2caa69a274045c
	.xword	0x30189b99e22b1e9c
	.xword	0x86e4201c70a17c4f
	.xword	0x34a72d52cb7ab479
	.xword	0x4f2e985544e19842
	.xword	0xef48f06353da6a0b
	.xword	0xf93f652fcfe63486
	.xword	0x821a2b9f10b58963
	.xword	0xac086ec400f5a3d4
	.xword	0x2116742aee9994ce
	.xword	0x5c7a363df88521f3
	.xword	0x5b4a36b04a94fc5a
	.xword	0x23de55a2fde020a9
	.xword	0x1f844fc6013c8dcd
	.xword	0x7cbb24f917fda346
	.xword	0xa73e46f30e99c20b
	.xword	0x6fdc08e0ec6d7bf1
	.xword	0xf21ecb3610f677ed
	.xword	0x8073bea952627a3b
	.xword	0x35d6f16e85339d62
	.xword	0x259e8424d2eeb22a
	.xword	0x582362e6638b8b6f
	.xword	0xbd4bcaee89950264
	.xword	0xc7001fee8eb2f82d
	.xword	0xe327a95aa1ff783a
	.xword	0x29a107dd3a983834
	.xword	0xde5fb1c42f8054de
	.xword	0xb2eee34c88b7e894
	.xword	0xd995d6f6887537f7
	.xword	0x3fbcb8a27c36f7fe
	.xword	0x434a9a1a6d6e1920
	.xword	0x46077f8f1cbd7d9b
	.xword	0x4d017ed4d9f72979
	.xword	0xda2c8dba9250c36b
	.xword	0x9664c0e566d57027
	.xword	0x446884c14c4053f5
	.xword	0x5ecda7b54aa84714
	.xword	0xc1da114b75b8ce5b
	.xword	0x4cdf011733703a36
	.xword	0xaef3d9dec52179bf
	.xword	0x252cd3d65fc25d2d
	.xword	0x6c0a219e3a7603a0
	.xword	0x357aee6b307ff221
	.xword	0x5a88b155876a4541
	.xword	0x9ec1fffd0fbb45c4
	.xword	0x383abfb65d12cde5
	.xword	0x7992b513d9646921
	.xword	0xf6bae013bb9f8c5f
	.xword	0xd666272137ccc028
	.xword	0x411e8a6a94467e7d
	.xword	0x00d2359232084332
	.xword	0x72a6a3311bc941c2
	.xword	0x0e96e8adf912f3bf
	.xword	0xe78e86d41aee43eb
	.xword	0xa64ca6e884c15311
	.xword	0xb8ec2f394b917da4
	.xword	0x8a8ace767853221a
	.xword	0x027d8f03f055362e
	.xword	0x5f35e40e20f5b5ef
	.xword	0xe068a80196ee7be0
	.xword	0xba5c49690cc1990c
	.xword	0x28fe8f73125e625b
	.xword	0x91b059d0b88af44d
	.xword	0xd4184f0c048dfa68
	.xword	0x6c4d0b5dd7ba0878
	.xword	0x8bdb312b5e7d8093
	.xword	0x164c865ae23cb346
	.xword	0xbbc794ba04070603
	.xword	0xea1679f81f93be68
	.xword	0xcb5d2dfc43c4fedf
	.xword	0x70a3af7d93526015
	.xword	0x7823f4faa87b9e03
	.xword	0xea19bd1b883e2b90
	.xword	0xbd44cadd62317b55
	.xword	0x2097be51429bccda
	.xword	0x31cc37e688db0023
	.xword	0x748e54fef4844d2f
	.xword	0x7c12e9d31f824809
	.xword	0x9b58155184554095
	.xword	0xe7f2632f8b80f0b5
	.xword	0x963307324b1ccea6
	.xword	0x41892919c144c00f
	.xword	0x38e24c27cdccbdbd
	.xword	0x844f34ec5cc8fa91
	.xword	0x6f554eb174c4e40f
	.xword	0x00981a2632dfa6a8
	.xword	0x7dd944bb4cf4539c
	.xword	0x99d0a36b885580c4
	.xword	0xce677f0102f299c9
	.xword	0x4d014672d8e262cc
	.xword	0x48637f92bf689213
	.xword	0x2d988e151cc92c12
	.xword	0x44cf698f2a7fc0d2
	.xword	0x62b952c2dfc9fc29
	.xword	0xc955579745f78ce1
	.xword	0x67fb5929fa0f94d0
	.xword	0xe210e0537c02f6fa
	.xword	0x76faef8b85414d9f
	.xword	0x1dec5b5d1172d174
	.xword	0xf628238bee216c71
	.xword	0xcb4d4ab2ca255875
	.xword	0xcf3db669861900f4
	.xword	0xd3b2525a60d1d269
	.xword	0xb1c4eecb8ca7a5c9
	.xword	0x77280178bf70f55a
	.xword	0xfd0a8f33c59c3261
	.xword	0x877d72e24d586aff
	.xword	0xf3a66515f4f7cb46
	.xword	0x7241c6378a9b1901
	.xword	0x1fb96626eed70f52
	.xword	0x9fbb9441a5eea949
	.xword	0x34ce3cb1de5d9260
	.xword	0x9ec1f0b6f1863fe1
	.xword	0x38019b619597e7cc
	.xword	0x81c096c792c1b279
	.xword	0x4d80c17645087944
	.xword	0x5be5ed78e5316187
	.xword	0xfe08b0c3a7c9a63e
	.xword	0x312792a69c0d1240
	.xword	0x21b56b494b0d1fff
	.xword	0x8d2f0867e346e0f5
	.xword	0xab2ea058b1f10413
	.xword	0x015d5417947a56fa
	.xword	0x34ec397abfd0e740
	.xword	0xf6db492747908be3
	.xword	0x51c9904971631d66
	.xword	0x5164f12aacdba8b8
	.xword	0x3f298e28d236bcd6
	.xword	0x7aeb22c7573cefb7
	.xword	0x65df7975111a24df
	.xword	0x926ebe99ff929b2c
	.xword	0x15f4f99bbcbfc3a2
	.xword	0x092734d1e0d24d86
	.xword	0xdb9498fbd1d68be8
	.xword	0x1ea89391fb56b711
	.xword	0x367628c2e531f4e8
	.xword	0x4f9166c1ff84fc3f
	.xword	0x883575f46af42a72
	.xword	0x8b1bcd4de915b03a
	.xword	0x6a070f9ea91e3b1c



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
