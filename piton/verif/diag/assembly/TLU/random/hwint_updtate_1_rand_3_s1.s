// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hwint_updtate_1_rand_3_s1.s
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
   random seed:	771843597
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

	setx 0x025319c717f387d6, %g1, %g0
	setx 0x37432769ac1d7f5c, %g1, %g1
	setx 0x557bf09b5b3e28c8, %g1, %g2
	setx 0x18b477b2a4dede2a, %g1, %g3
	setx 0x388a6bc6725e7e19, %g1, %g4
	setx 0xd3d0f653d9701a30, %g1, %g5
	setx 0xa12b6da15d4236d4, %g1, %g6
	setx 0x19d90a90810dbb8b, %g1, %g7
	setx 0x68c91e77788d8167, %g1, %r16
	setx 0x1d9d5eaece35d411, %g1, %r17
	setx 0x8a7c3bad5ccdab9d, %g1, %r18
	setx 0xaeb368cd98f65460, %g1, %r19
	setx 0x1a0ab76b31920c82, %g1, %r20
	setx 0xa6b984ad98be3bee, %g1, %r21
	setx 0x571b0eb17b081f78, %g1, %r22
	setx 0x5acdb82a087cfd2b, %g1, %r23
	setx 0x6bf6627923e98af2, %g1, %r24
	setx 0x66c88905f59b68b7, %g1, %r25
	setx 0x0c87a0a76575e137, %g1, %r26
	setx 0x3283aebd07bc57b0, %g1, %r27
	setx 0xecc1d956d2a78295, %g1, %r28
	setx 0xed08238799ce339f, %g1, %r29
	setx 0x9c8d7f469b626f16, %g1, %r30
	setx 0x8d648219c531a561, %g1, %r31
	save
	setx 0x06084df4b0adac13, %g1, %r16
	setx 0x67d25d99d849f655, %g1, %r17
	setx 0xf45fefd1a7ea7bca, %g1, %r18
	setx 0x82d7928eae6f1760, %g1, %r19
	setx 0x81d3332a1e7580e3, %g1, %r20
	setx 0xe88f4cfeb3cfc174, %g1, %r21
	setx 0x2e45ab78d075d1f3, %g1, %r22
	setx 0xfc7a2c38203563f3, %g1, %r23
	setx 0x5a4c188580c96fc3, %g1, %r24
	setx 0x445a7b9cd180345d, %g1, %r25
	setx 0x4404e9c57018b464, %g1, %r26
	setx 0x206e45e266be3d13, %g1, %r27
	setx 0x7eaf58f5aebb8e89, %g1, %r28
	setx 0x84eefc28d31f6090, %g1, %r29
	setx 0xad9fca7ff84270cb, %g1, %r30
	setx 0x9f446532bcbe9ff6, %g1, %r31
	save
	setx 0x7d21289e0a0af3aa, %g1, %r16
	setx 0xb1952f1f859e66bb, %g1, %r17
	setx 0xfd62155e2b28507e, %g1, %r18
	setx 0x8981f42fcf364c3d, %g1, %r19
	setx 0x473ef3bbe0fcedbc, %g1, %r20
	setx 0x881f837d821b27c5, %g1, %r21
	setx 0xe4a86d3ee168dac3, %g1, %r22
	setx 0x5260b9cb84ad4bcf, %g1, %r23
	setx 0x7c99e7190521e7ca, %g1, %r24
	setx 0x5dd44f50da8d164f, %g1, %r25
	setx 0xf166cd0346bd1032, %g1, %r26
	setx 0x854f89e2ce09e0e8, %g1, %r27
	setx 0x9687e1cac225e69c, %g1, %r28
	setx 0x2cd569af5ad74e6a, %g1, %r29
	setx 0xccaa78759d4a7c16, %g1, %r30
	setx 0x0a19977e93e78d3f, %g1, %r31
	save
	setx 0x9ca3261ed383c1e3, %g1, %r16
	setx 0x4a15681175f99005, %g1, %r17
	setx 0xd3a3bca8db28a4ee, %g1, %r18
	setx 0x46e40005b6029c9c, %g1, %r19
	setx 0xcfb9b1e7ba796995, %g1, %r20
	setx 0xfe5faa6011f9ea37, %g1, %r21
	setx 0x0692537a9d1a9fb0, %g1, %r22
	setx 0x02fdcd1ca6d965d8, %g1, %r23
	setx 0x8427f55f30225c38, %g1, %r24
	setx 0x96b742aa5b5764c5, %g1, %r25
	setx 0xa037b94591f3060f, %g1, %r26
	setx 0xfd1476fa728bae84, %g1, %r27
	setx 0xe20f620703cf1c5d, %g1, %r28
	setx 0x40ccf13de57e5608, %g1, %r29
	setx 0x8916079d4f57a0d6, %g1, %r30
	setx 0x7907a296ac93dfea, %g1, %r31
	save
	setx 0x41a34e67111e6b10, %g1, %r16
	setx 0xe65623c091d330bd, %g1, %r17
	setx 0x853986f5b98592fa, %g1, %r18
	setx 0xb376f4915aaa3e89, %g1, %r19
	setx 0xaacabc87a1a53d77, %g1, %r20
	setx 0xdd70250924d2ef8c, %g1, %r21
	setx 0xc6c32cb2f0f55d2a, %g1, %r22
	setx 0x5be89e2b66c8ef9b, %g1, %r23
	setx 0xb61795cabe9a2c61, %g1, %r24
	setx 0xee562701bd2d47f2, %g1, %r25
	setx 0x779ed59425b4c50c, %g1, %r26
	setx 0xe21de3f8769f8877, %g1, %r27
	setx 0x3874cc6e23659ce2, %g1, %r28
	setx 0x5218ca290de443cf, %g1, %r29
	setx 0x8447e221d3a05084, %g1, %r30
	setx 0x0f81880637cf1eac, %g1, %r31
	save
	setx 0xb0ee88e4b52e0135, %g1, %r16
	setx 0x91333f05b8264c2a, %g1, %r17
	setx 0x029053107ab57492, %g1, %r18
	setx 0xd41945eead60b19c, %g1, %r19
	setx 0x6b250cbd4e9d712b, %g1, %r20
	setx 0xaf5e58015e08741a, %g1, %r21
	setx 0x3d406b289ffcd6a4, %g1, %r22
	setx 0x39c122bc78d69d39, %g1, %r23
	setx 0x9018b6ac6fe6317d, %g1, %r24
	setx 0x4e684fea74aac96f, %g1, %r25
	setx 0x4da533bc470615a1, %g1, %r26
	setx 0x50a6f5a6fa6720b5, %g1, %r27
	setx 0xf952270d5b9433fe, %g1, %r28
	setx 0x7d1422b1ce448506, %g1, %r29
	setx 0x1217a0f23e20bc9e, %g1, %r30
	setx 0x272ddf2fe375ca98, %g1, %r31
	save
	setx 0x8c813e418bc666da, %g1, %r16
	setx 0xb19d8727f2642cc6, %g1, %r17
	setx 0x6a5c11919bf29526, %g1, %r18
	setx 0x0a64770b4b933d7e, %g1, %r19
	setx 0xedb2d30cb79fa7e7, %g1, %r20
	setx 0x0dd761f9750bb8ae, %g1, %r21
	setx 0xa6737325b2db37fd, %g1, %r22
	setx 0x3c94910305756ee8, %g1, %r23
	setx 0x15bd8f7722605b24, %g1, %r24
	setx 0x13054a9bf5b8d143, %g1, %r25
	setx 0xc0e038a2bd81fe93, %g1, %r26
	setx 0x7ab569183dd17c57, %g1, %r27
	setx 0x974e4820028b7221, %g1, %r28
	setx 0xeea0557d16ab2bf7, %g1, %r29
	setx 0x04323d551f763fa8, %g1, %r30
	setx 0x68dea7baf4772858, %g1, %r31
	save
	setx 0x1ccbe10762d1e05d, %g1, %r16
	setx 0x5b25c8da81ec04c3, %g1, %r17
	setx 0xc34ab2b9fd9b0777, %g1, %r18
	setx 0xef6a7afb22461f8a, %g1, %r19
	setx 0x84df4f9f3873fe30, %g1, %r20
	setx 0x2a6e7f4f860a6a12, %g1, %r21
	setx 0x5b652c7b7e5cf129, %g1, %r22
	setx 0x5dcdbcbf97c4c52d, %g1, %r23
	setx 0x8cc8acda0bec9565, %g1, %r24
	setx 0xea7500d90b00023d, %g1, %r25
	setx 0xa145a016e2340b51, %g1, %r26
	setx 0xf398c2f635395313, %g1, %r27
	setx 0x77ceed4d23c26c1e, %g1, %r28
	setx 0xa85b8dc9d65cec10, %g1, %r29
	setx 0xe9e38ae39af49e23, %g1, %r30
	setx 0x74f097e303cab372, %g1, %r31
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
	setx	0x180027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe40000  ! 2: SAVE_R	save	%r16, %r0, %r31
T0_asi_reg_wr_0:
	mov	0x34, %r14
	.word 0xfef38400  ! 4: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb9e460b6  ! 5: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_0), 16, 16)) -> intp(0, 0, 2d)
iob_intr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_1), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_2), 16, 16)) -> intp(0, 0, 34)
cpu_intr_0_1:
	setx	0x1f033e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_2:
	setx	0x1c0333, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_3:
	setx	0x1d0110, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_3), 16, 16)) -> intp(0, 0, 3c)
cpu_intr_0_4:
	setx	0x1f0200, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_5:
	setx	0x1c020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0852101  ! 24: ADDcc_I	addcc 	%r20, 0x0101, %r24
	.word 0xb3e40000  ! 31: SAVE_R	save	%r16, %r0, %r25
	.word 0xbe85c000  ! 32: ADDcc_R	addcc 	%r23, %r0, %r31
	.word 0xb9e4c000  ! 36: SAVE_R	save	%r19, %r0, %r28
T0_asi_reg_rd_0:
	mov	0x3c7, %r14
	.word 0xf2db8e60  ! 37: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb9e40000  ! 39: SAVE_R	save	%r16, %r0, %r28
cpu_intr_0_6:
	setx	0x1f0334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e01d  ! 42: SAVE_I	save	%r19, 0x0001, %r24
cpu_intr_0_7:
	setx	0x1c013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_1:
	mov	0x9, %r14
	.word 0xf6f38e40  ! 48: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_0_8:
	setx	0x1d032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe561ab  ! 53: SAVE_I	save	%r21, 0x0001, %r31
cpu_intr_0_9:
	setx	0x1d013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde48000  ! 55: SAVE_R	save	%r18, %r0, %r30
	.word 0xb3e5e0ce  ! 57: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbf480000  ! 58: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
cpu_intr_0_10:
	setx	0x1f0218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4c000  ! 62: SAVE_R	save	%r19, %r0, %r27
	.word 0xb3e44000  ! 64: SAVE_R	save	%r17, %r0, %r25
cpu_intr_0_11:
	setx	0x1c0106, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_2:
	mov	0x21, %r14
	.word 0xfef38400  ! 72: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb93d9000  ! 74: SRAX_R	srax	%r22, %r0, %r28
cpu_intr_0_12:
	setx	0x1c022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb60d6104  ! 76: AND_I	and 	%r21, 0x0104, %r27
	.word 0xb5e54000  ! 79: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_rd_1:
	mov	0x3c6, %r14
	.word 0xf4db8e40  ! 84: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T0_asi_reg_rd_2:
	mov	0x3c5, %r14
	.word 0xfcdb84a0  ! 85: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb804c000  ! 86: ADD_R	add 	%r19, %r0, %r28
	.word 0xb7e4a14b  ! 88: SAVE_I	save	%r18, 0x0001, %r27
cpu_intr_0_13:
	setx	0x1f031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e18b  ! 92: SAVE_I	save	%r19, 0x0001, %r24
cpu_intr_0_14:
	setx	0x1e010d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_4), 16, 16)) -> intp(0, 0, 1b)
iob_intr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_5), 16, 16)) -> intp(0, 0, 19)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_3:
	mov	0x3c7, %r14
	.word 0xfef38e60  ! 105: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb5e5a0a2  ! 106: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbbe4c000  ! 107: SAVE_R	save	%r19, %r0, %r29
cpu_intr_0_15:
	setx	0x1e022d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_6), 16, 16)) -> intp(0, 0, 28)
T0_asi_reg_rd_3:
	mov	0x3c1, %r14
	.word 0xfedb8400  ! 120: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_7), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_wr_4:
	mov	0x3, %r14
	.word 0xf0f38e40  ! 127: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_8), 16, 16)) -> intp(0, 0, 14)
iob_intr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_9), 16, 16)) -> intp(0, 0, 3)
	.word 0xb5e48000  ! 141: SAVE_R	save	%r18, %r0, %r26
T0_asi_reg_rd_4:
	mov	0x10, %r14
	.word 0xf8db89e0  ! 142: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb604c000  ! 147: ADD_R	add 	%r19, %r0, %r27
T0_asi_reg_rd_5:
	mov	0x8, %r14
	.word 0xfedb8400  ! 150: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde5c000  ! 154: SAVE_R	save	%r23, %r0, %r30
iob_intr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_10), 16, 16)) -> intp(0, 0, 2f)
iob_intr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_11), 16, 16)) -> intp(0, 0, 1f)
cpu_intr_0_16:
	setx	0x1c0223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e19e  ! 162: SAVE_I	save	%r19, 0x0001, %r29
iob_intr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_12), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_rd_6:
	mov	0x3c1, %r14
	.word 0xfedb89e0  ! 171: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb3e4202f  ! 172: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde44000  ! 176: SAVE_R	save	%r17, %r0, %r30
	.word 0xb43c4000  ! 177: XNOR_R	xnor 	%r17, %r0, %r26
	.word 0xb7e58000  ! 182: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_rd_7:
	mov	0xe, %r14
	.word 0xf0db84a0  ! 185: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb7e40000  ! 186: SAVE_R	save	%r16, %r0, %r27
	.word 0xbde4e171  ! 188: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbde40000  ! 192: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_13), 16, 16)) -> intp(0, 0, b)
	.word 0x9194a0b8  ! 197: WRPR_PIL_I	wrpr	%r18, 0x00b8, %pil
cpu_intr_0_17:
	setx	0x1e000b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_18:
	setx	0x1d0215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5c000  ! 207: SAVE_R	save	%r23, %r0, %r26
T0_asi_reg_wr_5:
	mov	0x33, %r14
	.word 0xfcf38e40  ! 208: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb7e44000  ! 209: SAVE_R	save	%r17, %r0, %r27
	.word 0xb9e4215e  ! 210: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbfe54000  ! 213: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_14), 16, 16)) -> intp(0, 0, d)
iob_intr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_15), 16, 16)) -> intp(0, 0, 26)
	.word 0xb1e4a1cb  ! 219: SAVE_I	save	%r18, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3e58000  ! 221: SAVE_R	save	%r22, %r0, %r25
	.word 0xbbe50000  ! 226: SAVE_R	save	%r20, %r0, %r29
	.word 0xbfe42017  ! 227: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb1e5c000  ! 230: SAVE_R	save	%r23, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e40000  ! 232: SAVE_R	save	%r16, %r0, %r26
	.word 0xb6b48000  ! 238: SUBCcc_R	orncc 	%r18, %r0, %r27
T0_asi_reg_wr_6:
	mov	0xe, %r14
	.word 0xf6f38e40  ! 240: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb1e4c000  ! 241: SAVE_R	save	%r19, %r0, %r24
iob_intr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_16), 16, 16)) -> intp(0, 0, 8)
cpu_intr_0_19:
	setx	0x1c0333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e40000  ! 251: SAVE_R	save	%r16, %r0, %r27
	.word 0xbfe421f6  ! 254: SAVE_I	save	%r16, 0x0001, %r31
iob_intr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_17), 16, 16)) -> intp(0, 0, 13)
cpu_intr_0_20:
	setx	0x1e0031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5c000  ! 257: SAVE_R	save	%r23, %r0, %r29
iob_intr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_18), 16, 16)) -> intp(0, 0, 17)
	.word 0xb5e56122  ! 261: SAVE_I	save	%r21, 0x0001, %r26
iob_intr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_19), 16, 16)) -> intp(0, 0, 22)
	.word 0xb5e5a0bb  ! 268: SAVE_I	save	%r22, 0x0001, %r26
iob_intr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_20), 16, 16)) -> intp(0, 0, 1c)
cpu_intr_0_21:
	setx	0x1d0105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5617c  ! 273: SAVE_I	save	%r21, 0x0001, %r30
iob_intr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_21), 16, 16)) -> intp(0, 0, 0)
	.word 0xb9e5603a  ! 276: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb5e48000  ! 278: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_22), 16, 16)) -> intp(0, 0, 31)
	.word 0xbbe46077  ! 285: SAVE_I	save	%r17, 0x0001, %r29
T0_asi_reg_wr_7:
	mov	0x3c3, %r14
	.word 0xf4f38e80  ! 289: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T0_asi_reg_wr_8:
	mov	0x3c1, %r14
	.word 0xf8f38e80  ! 290: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_23), 16, 16)) -> intp(0, 0, 19)
	.word 0xbfe54000  ! 292: SAVE_R	save	%r21, %r0, %r31
	.word 0xbfe42104  ! 295: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbbe48000  ! 302: SAVE_R	save	%r18, %r0, %r29
cpu_intr_0_22:
	setx	0x1e0038, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_23:
	setx	0x1e0106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4606b  ! 307: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb7e50000  ! 309: SAVE_R	save	%r20, %r0, %r27
T0_asi_reg_wr_9:
	mov	0x1, %r14
	.word 0xfaf38e40  ! 310: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbc058000  ! 311: ADD_R	add 	%r22, %r0, %r30
cpu_intr_0_24:
	setx	0x1c001b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_8:
	mov	0x3c1, %r14
	.word 0xf6db8e80  ! 315: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_24), 16, 16)) -> intp(0, 0, 4)
T0_asi_reg_wr_10:
	mov	0x24, %r14
	.word 0xf4f38e40  ! 318: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb3e4a0c0  ! 319: SAVE_I	save	%r18, 0x0001, %r25
iob_intr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_25), 16, 16)) -> intp(0, 0, c)
iob_intr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_26), 16, 16)) -> intp(0, 0, 34)
	.word 0xbfe44000  ! 323: SAVE_R	save	%r17, %r0, %r31
T0_asi_reg_wr_11:
	mov	0x2d, %r14
	.word 0xfef38e40  ! 325: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_rd_9:
	mov	0xb, %r14
	.word 0xfedb8400  ! 327: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T0_asi_reg_wr_12:
	mov	0x3c6, %r14
	.word 0xfcf38e60  ! 328: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T0_asi_reg_rd_10:
	mov	0x23, %r14
	.word 0xf8db8e60  ! 329: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb0c5c000  ! 333: ADDCcc_R	addccc 	%r23, %r0, %r24
T0_asi_reg_wr_13:
	mov	0x10, %r14
	.word 0xfef38e60  ! 334: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T0_asi_reg_wr_14:
	mov	0x27, %r14
	.word 0xfcf38e60  ! 336: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_0_25:
	setx	0x1d0101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e520f5  ! 343: SAVE_I	save	%r20, 0x0001, %r28
T0_asi_reg_wr_15:
	mov	0x2, %r14
	.word 0xf6f389e0  ! 346: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb9346001  ! 349: SRL_I	srl 	%r17, 0x0001, %r28
iob_intr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_27), 16, 16)) -> intp(0, 0, 0)
	.word 0xb9e5a1ee  ! 352: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xba1dc000  ! 353: XOR_R	xor 	%r23, %r0, %r29
iob_intr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_28), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_wr_16:
	mov	0x14, %r14
	.word 0xfaf38e40  ! 355: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbfe48000  ! 356: SAVE_R	save	%r18, %r0, %r31
	.word 0xbde4e1a2  ! 360: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb9e420be  ! 363: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbbe44000  ! 365: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_wr_17:
	mov	0x1f, %r14
	.word 0xf0f38e40  ! 368: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_rd_11:
	mov	0x36, %r14
	.word 0xfedb8e80  ! 371: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_29), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbd504000  ! 374: RDPR_TNPC	<illegal instruction>
	.word 0xbde5e03a  ! 376: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb9e56052  ! 377: SAVE_I	save	%r21, 0x0001, %r28
T0_asi_reg_rd_12:
	mov	0xb, %r14
	.word 0xfadb84a0  ! 379: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbde5a0b8  ! 382: SAVE_I	save	%r22, 0x0001, %r30
iob_intr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_30), 16, 16)) -> intp(0, 0, 22)
T0_asi_reg_rd_13:
	mov	0x3c3, %r14
	.word 0xfadb8400  ! 389: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb3e48000  ! 392: SAVE_R	save	%r18, %r0, %r25
cpu_intr_0_26:
	setx	0x1e0104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe54000  ! 399: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_31), 16, 16)) -> intp(0, 0, 12)
	.word 0xb9e5e1fc  ! 406: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbfe44000  ! 407: SAVE_R	save	%r17, %r0, %r31
	.word 0xb1e5e1d8  ! 408: SAVE_I	save	%r23, 0x0001, %r24
cpu_intr_0_27:
	setx	0x1f013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde58000  ! 411: SAVE_R	save	%r22, %r0, %r30
T0_asi_reg_wr_18:
	mov	0x27, %r14
	.word 0xf8f38e40  ! 412: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbde40000  ! 413: SAVE_R	save	%r16, %r0, %r30
T0_asi_reg_wr_19:
	mov	0x3c7, %r14
	.word 0xf4f38e60  ! 414: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xbfe4a164  ! 415: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_rd_14:
	mov	0x2f, %r14
	.word 0xf4db8e80  ! 416: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbde420f2  ! 420: SAVE_I	save	%r16, 0x0001, %r30
cpu_intr_0_28:
	setx	0x1c0300, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_29:
	setx	0x1d0100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 426: SAVE_R	save	%r22, %r0, %r26
	.word 0xbb35e001  ! 432: SRL_I	srl 	%r23, 0x0001, %r29
iob_intr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_32), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb3e5a1bf  ! 435: SAVE_I	save	%r22, 0x0001, %r25
iob_intr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_33), 16, 16)) -> intp(0, 0, 5)
	.word 0xbd35f001  ! 440: SRLX_I	srlx	%r23, 0x0001, %r30
	.word 0xb1e44000  ! 443: SAVE_R	save	%r17, %r0, %r24
iob_intr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_34), 16, 16)) -> intp(0, 0, 7)
	.word 0xb5e48000  ! 447: SAVE_R	save	%r18, %r0, %r26
	.word 0xb7e44000  ! 449: SAVE_R	save	%r17, %r0, %r27
iob_intr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_35), 16, 16)) -> intp(0, 0, e)
	.word 0xba24c000  ! 452: SUB_R	sub 	%r19, %r0, %r29
T0_asi_reg_rd_15:
	mov	0x3c0, %r14
	.word 0xfedb8e60  ! 453: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_0_30:
	setx	0x1d020b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_20:
	mov	0x3c2, %r14
	.word 0xfaf38e80  ! 456: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb5e5a138  ! 458: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb3e5606b  ! 459: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbfe40000  ! 460: SAVE_R	save	%r16, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe44000  ! 464: SAVE_R	save	%r17, %r0, %r31
	.word 0xb9e4e03e  ! 465: SAVE_I	save	%r19, 0x0001, %r28
cpu_intr_0_31:
	setx	0x1f0331, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_21:
	mov	0x15, %r14
	.word 0xfaf38e80  ! 469: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_36), 16, 16)) -> intp(0, 0, 39)
	.word 0xb5e54000  ! 472: SAVE_R	save	%r21, %r0, %r26
cpu_intr_0_32:
	setx	0x1e0316, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_37), 16, 16)) -> intp(0, 0, 12)
	.word 0xb72ce001  ! 476: SLL_I	sll 	%r19, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_38), 16, 16)) -> intp(0, 0, 1d)
cpu_intr_0_33:
	setx	0x230103, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_34:
	setx	0x210035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5e072  ! 485: SAVE_I	save	%r23, 0x0001, %r30
iob_intr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_39), 16, 16)) -> intp(0, 0, 39)
	.word 0xb3e5a17b  ! 488: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbf7cc400  ! 489: MOVR_R	movre	%r19, %r0, %r31
T0_asi_reg_rd_16:
	mov	0x16, %r14
	.word 0xfedb8400  ! 497: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb5e4e08f  ! 498: SAVE_I	save	%r19, 0x0001, %r26
iob_intr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_40), 16, 16)) -> intp(0, 0, 10)
	.word 0xbd510000  ! 503: RDPR_TICK	<illegal instruction>
T0_asi_reg_rd_17:
	mov	0x1f, %r14
	.word 0xfedb8e40  ! 505: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb5e5e1fb  ! 506: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbbe4e091  ! 507: SAVE_I	save	%r19, 0x0001, %r29
iob_intr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_41), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_rd_18:
	mov	0x7, %r14
	.word 0xfcdb8e40  ! 509: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_wr_22:
	mov	0x3c1, %r14
	.word 0xf8f38e40  ! 512: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbbe56003  ! 514: SAVE_I	save	%r21, 0x0001, %r29
T0_asi_reg_rd_19:
	mov	0x1f, %r14
	.word 0xfedb8e80  ! 518: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T0_asi_reg_rd_20:
	mov	0x15, %r14
	.word 0xfedb8e80  ! 524: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xbfe4c000  ! 527: SAVE_R	save	%r19, %r0, %r31
T0_asi_reg_wr_23:
	mov	0x3c7, %r14
	.word 0xf6f38e80  ! 528: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbfe48000  ! 529: SAVE_R	save	%r18, %r0, %r31
	.word 0xb3e5a0ca  ! 531: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb8c4c000  ! 532: ADDCcc_R	addccc 	%r19, %r0, %r28
	.word 0xb5e54000  ! 534: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_wr_24:
	mov	0x23, %r14
	.word 0xf8f384a0  ! 536: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T0_asi_reg_wr_25:
	mov	0x27, %r14
	.word 0xf0f389e0  ! 537: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_0_35:
	setx	0x200013, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_42), 16, 16)) -> intp(0, 0, 13)
	.word 0xbde5c000  ! 540: SAVE_R	save	%r23, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e5e1d2  ! 543: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbbe5e136  ! 546: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb5e420c6  ! 548: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb1e44000  ! 549: SAVE_R	save	%r17, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_21:
	mov	0x2a, %r14
	.word 0xf4db8e80  ! 551: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb9e56114  ! 552: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb1e54000  ! 553: SAVE_R	save	%r21, %r0, %r24
	.word 0xb1e54000  ! 554: SAVE_R	save	%r21, %r0, %r24
cpu_intr_0_36:
	setx	0x200012, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_43), 16, 16)) -> intp(0, 0, 18)
	.word 0xbfe4a08a  ! 560: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_rd_22:
	mov	0x37, %r14
	.word 0xfedb84a0  ! 562: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_44), 16, 16)) -> intp(0, 0, 3d)
cpu_intr_0_37:
	setx	0x220103, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_26:
	mov	0x3c6, %r14
	.word 0xfcf38e80  ! 567: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0x8994e1c2  ! 568: WRPR_TICK_I	wrpr	%r19, 0x01c2, %tick
	.word 0xb5351000  ! 569: SRLX_R	srlx	%r20, %r0, %r26
T0_asi_reg_wr_27:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 570: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbfe52049  ! 572: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbde5a0ac  ! 573: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb7e54000  ! 576: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_rd_23:
	mov	0x3c4, %r14
	.word 0xfedb8e60  ! 579: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_45), 16, 16)) -> intp(0, 0, 1f)
	.word 0xbde5e0aa  ! 582: SAVE_I	save	%r23, 0x0001, %r30
iob_intr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_46), 16, 16)) -> intp(0, 0, 3a)
iob_intr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_47), 16, 16)) -> intp(0, 0, 29)
	.word 0xb7e46008  ! 585: SAVE_I	save	%r17, 0x0001, %r27
iob_intr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_48), 16, 16)) -> intp(0, 0, c)
	.word 0xb92d6001  ! 588: SLL_I	sll 	%r21, 0x0001, %r28
	.word 0xba8c8000  ! 589: ANDcc_R	andcc 	%r18, %r0, %r29
	.word 0xbfe5c000  ! 590: SAVE_R	save	%r23, %r0, %r31
cpu_intr_0_38:
	setx	0x210230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e54000  ! 593: SAVE_R	save	%r21, %r0, %r26
cpu_intr_0_39:
	setx	0x21000c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_40:
	setx	0x23023b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_49), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb4258000  ! 607: SUB_R	sub 	%r22, %r0, %r26
	.word 0xb21ca08b  ! 614: XOR_I	xor 	%r18, 0x008b, %r25
T0_asi_reg_wr_28:
	mov	0x23, %r14
	.word 0xf6f38e40  ! 616: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbfe4a0a0  ! 622: SAVE_I	save	%r18, 0x0001, %r31
cpu_intr_0_41:
	setx	0x200313, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_50), 16, 16)) -> intp(0, 0, 3a)
	.word 0xbfe54000  ! 629: SAVE_R	save	%r21, %r0, %r31
cpu_intr_0_42:
	setx	0x200138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe58000  ! 632: SAVE_R	save	%r22, %r0, %r29
cpu_intr_0_43:
	setx	0x230302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e44000  ! 635: SAVE_R	save	%r17, %r0, %r24
	.word 0xb5e56080  ! 640: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe5217a  ! 641: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_51), 16, 16)) -> intp(0, 0, c)
cpu_intr_0_44:
	setx	0x230129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_45:
	setx	0x22001e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_29:
	mov	0xb, %r14
	.word 0xf0f38e80  ! 650: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0x91942064  ! 651: WRPR_PIL_I	wrpr	%r16, 0x0064, %pil
	.word 0xb3e44000  ! 653: SAVE_R	save	%r17, %r0, %r25
cpu_intr_0_46:
	setx	0x220335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb234c000  ! 664: ORN_R	orn 	%r19, %r0, %r25
	.word 0xb3e5e047  ! 665: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_rd_24:
	mov	0x1e, %r14
	.word 0xfedb8400  ! 667: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb7e461dd  ! 669: SAVE_I	save	%r17, 0x0001, %r27
cpu_intr_0_47:
	setx	0x230236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba3d613b  ! 673: XNOR_I	xnor 	%r21, 0x013b, %r29
iob_intr_0_52:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_52), 16, 16)) -> intp(0, 0, 26)
cpu_intr_0_48:
	setx	0x21002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4c000  ! 679: SAVE_R	save	%r19, %r0, %r27
	.word 0xb9e54000  ! 688: SAVE_R	save	%r21, %r0, %r28
cpu_intr_0_49:
	setx	0x20003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5c000  ! 693: SAVE_R	save	%r23, %r0, %r31
	.word 0xb245c000  ! 695: ADDC_R	addc 	%r23, %r0, %r25
	.word 0xbe148000  ! 697: OR_R	or 	%r18, %r0, %r31
cpu_intr_0_50:
	setx	0x210106, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_53:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_53), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb7e50000  ! 701: SAVE_R	save	%r20, %r0, %r27
	.word 0xbde5c000  ! 702: SAVE_R	save	%r23, %r0, %r30
T0_asi_reg_wr_30:
	mov	0x16, %r14
	.word 0xfef38e40  ! 704: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_wr_31:
	mov	0x18, %r14
	.word 0xf4f38400  ! 707: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xba85a0a5  ! 710: ADDcc_I	addcc 	%r22, 0x00a5, %r29
iob_intr_0_54:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_54), 16, 16)) -> intp(0, 0, 11)
iob_intr_0_55:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_55), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb3e4a0bb  ! 717: SAVE_I	save	%r18, 0x0001, %r25
cpu_intr_0_51:
	setx	0x210114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcbcc000  ! 722: XNORcc_R	xnorcc 	%r19, %r0, %r30
	.word 0xbfe50000  ! 726: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_rd_25:
	mov	0x31, %r14
	.word 0xfedb8400  ! 727: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbfe5a1e6  ! 728: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbfe5a1d2  ! 737: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb334c000  ! 738: SRL_R	srl 	%r19, %r0, %r25
iob_intr_0_56:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_56), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb6b4c000  ! 743: ORNcc_R	orncc 	%r19, %r0, %r27
	.word 0xb7510000  ! 745: RDPR_TICK	<illegal instruction>
	.word 0xb29da0fd  ! 748: XORcc_I	xorcc 	%r22, 0x00fd, %r25
T0_asi_reg_rd_26:
	mov	0x0, %r14
	.word 0xf2db8e40  ! 754: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_52:
	setx	0x200228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e1dc  ! 758: SAVE_I	save	%r23, 0x0001, %r27
iob_intr_0_57:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_57), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_wr_32:
	mov	0x21, %r14
	.word 0xf6f389e0  ! 763: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_0_58:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_58), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_wr_33:
	mov	0x11, %r14
	.word 0xf0f38400  ! 766: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbfe4200b  ! 767: SAVE_I	save	%r16, 0x0001, %r31
cpu_intr_0_53:
	setx	0x20000d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_54:
	setx	0x220023, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_55:
	setx	0x230010, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_59:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_59), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_wr_34:
	mov	0x3c0, %r14
	.word 0xfef38e40  ! 782: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb7520000  ! 784: RDPR_PIL	<illegal instruction>
T0_asi_reg_wr_35:
	mov	0x24, %r14
	.word 0xf2f38e80  ! 785: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb9e4e16c  ! 786: SAVE_I	save	%r19, 0x0001, %r28
iob_intr_0_60:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_60), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_wr_36:
	mov	0x37, %r14
	.word 0xf2f38e60  ! 789: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T0_asi_reg_wr_37:
	mov	0x3c2, %r14
	.word 0xf8f384a0  ! 790: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb1e5c000  ! 792: SAVE_R	save	%r23, %r0, %r24
	.word 0xb3e5c000  ! 793: SAVE_R	save	%r23, %r0, %r25
iob_intr_0_61:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_61), 16, 16)) -> intp(0, 0, 37)
	.word 0xb9e42158  ! 798: SAVE_I	save	%r16, 0x0001, %r28
cpu_intr_0_56:
	setx	0x23030d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_62:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_62), 16, 16)) -> intp(0, 0, f)
iob_intr_0_63:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_63), 16, 16)) -> intp(0, 0, 16)
	.word 0xb7e54000  ! 804: SAVE_R	save	%r21, %r0, %r27
	.word 0xb9e4c000  ! 807: SAVE_R	save	%r19, %r0, %r28
	.word 0xbd7d8400  ! 808: MOVR_R	movre	%r22, %r0, %r30
	.word 0xbbe40000  ! 809: SAVE_R	save	%r16, %r0, %r29
	.word 0xbbe4e08c  ! 812: SAVE_I	save	%r19, 0x0001, %r29
iob_intr_0_64:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_64), 16, 16)) -> intp(0, 0, 14)
	.word 0xb9e4c000  ! 816: SAVE_R	save	%r19, %r0, %r28
iob_intr_0_65:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_65), 16, 16)) -> intp(0, 0, 34)
	.word 0xb1e5200a  ! 819: SAVE_I	save	%r20, 0x0001, %r24
iob_intr_0_66:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_66), 16, 16)) -> intp(0, 0, 2e)
	.word 0xbf7d8400  ! 828: MOVR_R	movre	%r22, %r0, %r31
T0_asi_reg_rd_27:
	mov	0x1f, %r14
	.word 0xf6db84a0  ! 834: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb02da08d  ! 836: ANDN_I	andn 	%r22, 0x008d, %r24
cpu_intr_0_57:
	setx	0x23030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_28:
	mov	0x3, %r14
	.word 0xf0db8e60  ! 844: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_0_67:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_67), 16, 16)) -> intp(0, 0, 13)
	.word 0xbde4a12a  ! 847: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde5c000  ! 848: SAVE_R	save	%r23, %r0, %r30
	.word 0xb9e58000  ! 851: SAVE_R	save	%r22, %r0, %r28
T0_asi_reg_wr_38:
	mov	0x27, %r14
	.word 0xfcf38e40  ! 852: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_rd_29:
	mov	0x1c, %r14
	.word 0xfcdb84a0  ! 854: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb7e5e05d  ! 859: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_wr_39:
	mov	0x15, %r14
	.word 0xf8f389e0  ! 861: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_0_68:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_68), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_wr_40:
	mov	0x3c2, %r14
	.word 0xfcf389e0  ! 864: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T0_asi_reg_wr_41:
	mov	0xc, %r14
	.word 0xfcf384a0  ! 867: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb9e561bc  ! 872: SAVE_I	save	%r21, 0x0001, %r28
cpu_intr_0_58:
	setx	0x220120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_59:
	setx	0x220339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 879: SAVE_R	save	%r21, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e4e1e2  ! 883: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbfe42151  ! 886: SAVE_I	save	%r16, 0x0001, %r31
iob_intr_0_69:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_69), 16, 16)) -> intp(0, 0, 15)
	.word 0xb3e44000  ! 888: SAVE_R	save	%r17, %r0, %r25
	.word 0xb9e4615c  ! 889: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbde460d7  ! 891: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbd508000  ! 892: RDPR_TSTATE	<illegal instruction>
cpu_intr_0_60:
	setx	0x220329, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_70:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_70), 16, 16)) -> intp(0, 0, 26)
	.word 0xb5e4a0dc  ! 902: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbbe50000  ! 906: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_rd_30:
	mov	0x12, %r14
	.word 0xf4db8400  ! 907: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_0_71:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_71), 16, 16)) -> intp(0, 0, 10)
	.word 0xbde56195  ! 911: SAVE_I	save	%r21, 0x0001, %r30
cpu_intr_0_61:
	setx	0x230124, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_62:
	setx	0x220208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe521d7  ! 918: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_wr_42:
	mov	0x37, %r14
	.word 0xfaf384a0  ! 920: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xba940000  ! 924: ORcc_R	orcc 	%r16, %r0, %r29
	.word 0xb9e58000  ! 929: SAVE_R	save	%r22, %r0, %r28
T0_asi_reg_wr_43:
	mov	0x2d, %r14
	.word 0xfcf38e40  ! 931: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbde4c000  ! 936: SAVE_R	save	%r19, %r0, %r30
	.word 0xbde4c000  ! 937: SAVE_R	save	%r19, %r0, %r30
	.word 0xb3e40000  ! 938: SAVE_R	save	%r16, %r0, %r25
T0_asi_reg_wr_44:
	mov	0x16, %r14
	.word 0xfcf38e40  ! 942: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbc0d0000  ! 943: AND_R	and 	%r20, %r0, %r30
cpu_intr_0_63:
	setx	0x260033, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_64:
	setx	0x24012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e54000  ! 948: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_rd_31:
	mov	0x26, %r14
	.word 0xf2db89e0  ! 949: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb3e54000  ! 950: SAVE_R	save	%r21, %r0, %r25
	.word 0xbbe46197  ! 953: SAVE_I	save	%r17, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_65:
	setx	0x240214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5c000  ! 956: SAVE_R	save	%r23, %r0, %r25
	.word 0xb7e5e149  ! 957: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb9e54000  ! 961: SAVE_R	save	%r21, %r0, %r28
	.word 0xb9e58000  ! 964: SAVE_R	save	%r22, %r0, %r28
	.word 0xb6340000  ! 965: ORN_R	orn 	%r16, %r0, %r27
	.word 0xb084e0b0  ! 967: ADDcc_I	addcc 	%r19, 0x00b0, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe52184  ! 975: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb0350000  ! 976: ORN_R	orn 	%r20, %r0, %r24
cpu_intr_0_66:
	setx	0x260300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e0da  ! 979: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbfe521aa  ! 980: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbd356001  ! 981: SRL_I	srl 	%r21, 0x0001, %r30
	.word 0xbbe461d1  ! 982: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb3e520fd  ! 991: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbbe5c000  ! 992: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_67:
	setx	0x250219, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_32:
	mov	0x17, %r14
	.word 0xf8db8e40  ! 996: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_wr_45:
	mov	0x2, %r14
	.word 0xf0f384a0  ! 997: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbde461d1  ! 998: SAVE_I	save	%r17, 0x0001, %r30
iob_intr_0_72:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_72), 16, 16)) -> intp(0, 0, 39)
	.word 0xb9e50000  ! 1002: SAVE_R	save	%r20, %r0, %r28
cpu_intr_0_68:
	setx	0x260218, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_69:
	setx	0x270120, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_46:
	mov	0x34, %r14
	.word 0xf8f38e60  ! 1007: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_0_70:
	setx	0x250115, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_33:
	mov	0x3c8, %r14
	.word 0xf8db8e60  ! 1011: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xbbe54000  ! 1012: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_73:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_73), 16, 16)) -> intp(0, 0, 1b)
iob_intr_0_74:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_74), 16, 16)) -> intp(0, 0, 27)
	.word 0xbbe5c000  ! 1019: SAVE_R	save	%r23, %r0, %r29
	.word 0xbac52024  ! 1023: ADDCcc_I	addccc 	%r20, 0x0024, %r29
	.word 0xb1e50000  ! 1024: SAVE_R	save	%r20, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e5a169  ! 1027: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbbe4618e  ! 1028: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xba3560e3  ! 1029: ORN_I	orn 	%r21, 0x00e3, %r29
	.word 0xb9e44000  ! 1030: SAVE_R	save	%r17, %r0, %r28
cpu_intr_0_71:
	setx	0x260036, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_34:
	mov	0x2e, %r14
	.word 0xf8db84a0  ! 1032: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbbe520c4  ! 1033: SAVE_I	save	%r20, 0x0001, %r29
iob_intr_0_75:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_75), 16, 16)) -> intp(0, 0, 1f)
	.word 0xbbe50000  ! 1044: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_rd_35:
	mov	0x3c4, %r14
	.word 0xfedb8e40  ! 1048: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb485c000  ! 1049: ADDcc_R	addcc 	%r23, %r0, %r26
T0_asi_reg_rd_36:
	mov	0x32, %r14
	.word 0xfcdb8e60  ! 1050: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_0_76:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_76), 16, 16)) -> intp(0, 0, 36)
cpu_intr_0_72:
	setx	0x25030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e161  ! 1059: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbcb5e149  ! 1060: ORNcc_I	orncc 	%r23, 0x0149, %r30
cpu_intr_0_73:
	setx	0x24022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e0c8  ! 1062: SAVE_I	save	%r23, 0x0001, %r28
iob_intr_0_77:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_77), 16, 16)) -> intp(0, 0, 18)
	.word 0xb88c21e4  ! 1066: ANDcc_I	andcc 	%r16, 0x01e4, %r28
cpu_intr_0_74:
	setx	0x24012a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_75:
	setx	0x240010, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_47:
	mov	0x3c4, %r14
	.word 0xf4f389e0  ! 1069: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_0_78:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_78), 16, 16)) -> intp(0, 0, 14)
	.word 0xb5e56109  ! 1072: SAVE_I	save	%r21, 0x0001, %r26
iob_intr_0_79:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_79), 16, 16)) -> intp(0, 0, b)
	.word 0xbfe58000  ! 1074: SAVE_R	save	%r22, %r0, %r31
iob_intr_0_80:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_80), 16, 16)) -> intp(0, 0, 21)
	.word 0xbfe4a075  ! 1087: SAVE_I	save	%r18, 0x0001, %r31
cpu_intr_0_76:
	setx	0x260021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe42041  ! 1093: SAVE_I	save	%r16, 0x0001, %r31
cpu_intr_0_77:
	setx	0x25033a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_78:
	setx	0x260235, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_48:
	mov	0x2, %r14
	.word 0xf2f389e0  ! 1113: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbbe4214e  ! 1114: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_81:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_81), 16, 16)) -> intp(0, 0, 30)
cpu_intr_0_79:
	setx	0x25012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb89cc000  ! 1120: XORcc_R	xorcc 	%r19, %r0, %r28
iob_intr_0_82:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_82), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_83:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_83), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_84:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_84), 16, 16)) -> intp(0, 0, 31)
	.word 0xb7359000  ! 1126: SRLX_R	srlx	%r22, %r0, %r27
cpu_intr_0_80:
	setx	0x270000, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_85:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_85), 16, 16)) -> intp(0, 0, 8)
cpu_intr_0_81:
	setx	0x240126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a081  ! 1135: SAVE_I	save	%r18, 0x0001, %r27
iob_intr_0_86:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_86), 16, 16)) -> intp(0, 0, 15)
T0_asi_reg_wr_49:
	mov	0x23, %r14
	.word 0xfaf38e40  ! 1140: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_0_82:
	setx	0x260114, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_83:
	setx	0x240231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe52150  ! 1148: SAVE_I	save	%r20, 0x0001, %r29
cpu_intr_0_84:
	setx	0x26013b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_37:
	mov	0xa, %r14
	.word 0xf8db8e60  ! 1157: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb7e421c5  ! 1159: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbbe56140  ! 1160: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbde52088  ! 1164: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbbe48000  ! 1165: SAVE_R	save	%r18, %r0, %r29
iob_intr_0_87:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_87), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_88:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_88), 16, 16)) -> intp(0, 0, 26)
	.word 0xb9e44000  ! 1172: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_wr_50:
	mov	0x1f, %r14
	.word 0xf4f38e40  ! 1173: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbbe50000  ! 1175: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_89:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_89), 16, 16)) -> intp(0, 0, 2e)
	.word 0xbde54000  ! 1183: SAVE_R	save	%r21, %r0, %r30
	.word 0xb33da001  ! 1184: SRA_I	sra 	%r22, 0x0001, %r25
iob_intr_0_90:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_90), 16, 16)) -> intp(0, 0, 3a)
cpu_intr_0_85:
	setx	0x270124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3480000  ! 1188: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb214a12d  ! 1193: OR_I	or 	%r18, 0x012d, %r25
	.word 0xbe358000  ! 1194: ORN_R	orn 	%r22, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e5c000  ! 1196: SAVE_R	save	%r23, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e5601f  ! 1202: SAVE_I	save	%r21, 0x0001, %r25
iob_intr_0_91:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_91), 16, 16)) -> intp(0, 0, 22)
iob_intr_0_92:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_92), 16, 16)) -> intp(0, 0, 14)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_86:
	setx	0x270024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 1210: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_93:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_93), 16, 16)) -> intp(0, 0, 36)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbb2da001  ! 1216: SLL_I	sll 	%r22, 0x0001, %r29
T0_asi_reg_rd_38:
	mov	0x3c6, %r14
	.word 0xf6db8e80  ! 1217: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb7e5e15c  ! 1218: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xba8ca0ca  ! 1221: ANDcc_I	andcc 	%r18, 0x00ca, %r29
	.word 0xb3356001  ! 1222: SRL_I	srl 	%r21, 0x0001, %r25
T0_asi_reg_wr_51:
	mov	0x3c3, %r14
	.word 0xf6f389e0  ! 1228: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb3e5c000  ! 1232: SAVE_R	save	%r23, %r0, %r25
	.word 0xb7e44000  ! 1233: SAVE_R	save	%r17, %r0, %r27
	.word 0xbfe50000  ! 1234: SAVE_R	save	%r20, %r0, %r31
	.word 0xbfe40000  ! 1236: SAVE_R	save	%r16, %r0, %r31
iob_intr_0_94:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_94), 16, 16)) -> intp(0, 0, 7)
	.word 0xbbe46110  ! 1240: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbab4a043  ! 1243: ORNcc_I	orncc 	%r18, 0x0043, %r29
	.word 0xb3e58000  ! 1246: SAVE_R	save	%r22, %r0, %r25
cpu_intr_0_87:
	setx	0x25031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_39:
	mov	0x14, %r14
	.word 0xf4db8e40  ! 1253: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_0_88:
	setx	0x250037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4c000  ! 1255: SAVE_R	save	%r19, %r0, %r31
	.word 0xb1e46179  ! 1256: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb7e521bf  ! 1257: SAVE_I	save	%r20, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_40:
	mov	0x11, %r14
	.word 0xf8db84a0  ! 1261: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_0_95:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_95), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_rd_41:
	mov	0x3c0, %r14
	.word 0xfedb8e40  ! 1263: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbbe54000  ! 1265: SAVE_R	save	%r21, %r0, %r29
	.word 0xbc0cc000  ! 1267: AND_R	and 	%r19, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_42:
	mov	0x25, %r14
	.word 0xf6db8e40  ! 1269: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_96:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_96), 16, 16)) -> intp(0, 0, 26)
iob_intr_0_97:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_97), 16, 16)) -> intp(0, 0, 20)
	.word 0xb9e42189  ! 1272: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbfe46067  ! 1273: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbbe4a07a  ! 1274: SAVE_I	save	%r18, 0x0001, %r29
cpu_intr_0_89:
	setx	0x25013d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_52:
	mov	0x3c6, %r14
	.word 0xfaf384a0  ! 1276: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbfe420b6  ! 1278: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_rd_43:
	mov	0xa, %r14
	.word 0xfedb8400  ! 1279: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T0_asi_reg_rd_44:
	mov	0x2, %r14
	.word 0xfcdb89e0  ! 1281: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb1e5603b  ! 1283: SAVE_I	save	%r21, 0x0001, %r24
iob_intr_0_98:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_98), 16, 16)) -> intp(0, 0, 14)
	.word 0xb9e4a16a  ! 1286: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_rd_45:
	mov	0x3c3, %r14
	.word 0xfadb84a0  ! 1288: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T0_asi_reg_rd_46:
	mov	0x2b, %r14
	.word 0xf6db84a0  ! 1292: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T0_asi_reg_wr_53:
	mov	0x14, %r14
	.word 0xfef389e0  ! 1293: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T0_asi_reg_rd_47:
	mov	0x1e, %r14
	.word 0xf4db84a0  ! 1298: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb3e5219e  ! 1299: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_wr_54:
	mov	0x4, %r14
	.word 0xfcf38e40  ! 1300: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_wr_55:
	mov	0x3c1, %r14
	.word 0xf4f38e40  ! 1301: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_90:
	setx	0x27023f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_91:
	setx	0x260321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba1ce136  ! 1305: XOR_I	xor 	%r19, 0x0136, %r29
	.word 0xbfe460bd  ! 1309: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb3e5c000  ! 1310: SAVE_R	save	%r23, %r0, %r25
	.word 0xbc8c0000  ! 1313: ANDcc_R	andcc 	%r16, %r0, %r30
iob_intr_0_99:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_99), 16, 16)) -> intp(0, 0, 7)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_56:
	mov	0x2, %r14
	.word 0xfcf38e60  ! 1317: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_0_100:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_100), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb3e44000  ! 1324: SAVE_R	save	%r17, %r0, %r25
T0_asi_reg_wr_57:
	mov	0x2b, %r14
	.word 0xf4f389e0  ! 1325: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb7e4e1f9  ! 1326: SAVE_I	save	%r19, 0x0001, %r27
iob_intr_0_101:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_101), 16, 16)) -> intp(0, 0, 3d)
iob_intr_0_102:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_102), 16, 16)) -> intp(0, 0, 33)
	.word 0xbde5c000  ! 1330: SAVE_R	save	%r23, %r0, %r30
	.word 0xb3e40000  ! 1331: SAVE_R	save	%r16, %r0, %r25
	.word 0xbde4a07e  ! 1332: SAVE_I	save	%r18, 0x0001, %r30
cpu_intr_0_92:
	setx	0x260307, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_48:
	mov	0x21, %r14
	.word 0xf6db84a0  ! 1334: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbfe50000  ! 1336: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_93:
	setx	0x270325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a07d  ! 1341: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_103:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_103), 16, 16)) -> intp(0, 0, 13)
iob_intr_0_104:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_104), 16, 16)) -> intp(0, 0, 4)
	.word 0xbde5a0f3  ! 1350: SAVE_I	save	%r22, 0x0001, %r30
cpu_intr_0_94:
	setx	0x270327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e48000  ! 1352: SAVE_R	save	%r18, %r0, %r25
cpu_intr_0_95:
	setx	0x240218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde50000  ! 1356: SAVE_R	save	%r20, %r0, %r30
	.word 0xb3e4e0bf  ! 1359: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1e50000  ! 1362: SAVE_R	save	%r20, %r0, %r24
	.word 0xbde54000  ! 1363: SAVE_R	save	%r21, %r0, %r30
T0_asi_reg_rd_49:
	mov	0x2f, %r14
	.word 0xf6db8e40  ! 1364: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_105:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_105), 16, 16)) -> intp(0, 0, 3d)
T0_asi_reg_wr_58:
	mov	0x34, %r14
	.word 0xfef38e80  ! 1366: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T0_asi_reg_wr_59:
	mov	0x0, %r14
	.word 0xf0f38e80  ! 1369: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb1e520d7  ! 1370: SAVE_I	save	%r20, 0x0001, %r24
T0_asi_reg_wr_60:
	mov	0xd, %r14
	.word 0xf8f38e80  ! 1371: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb1e4a12e  ! 1372: SAVE_I	save	%r18, 0x0001, %r24
T0_asi_reg_rd_50:
	mov	0x2a, %r14
	.word 0xfedb8400  ! 1377: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb7e560b4  ! 1379: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbde42040  ! 1382: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_wr_61:
	mov	0x3c2, %r14
	.word 0xfaf384a0  ! 1383: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_0_106:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_106), 16, 16)) -> intp(0, 0, a)
	.word 0xb1e46092  ! 1386: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb3e46159  ! 1387: SAVE_I	save	%r17, 0x0001, %r25
cpu_intr_0_96:
	setx	0x27023a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_62:
	mov	0xf, %r14
	.word 0xfaf384a0  ! 1390: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T0_asi_reg_rd_51:
	mov	0x7, %r14
	.word 0xfedb8e40  ! 1392: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb1e50000  ! 1393: SAVE_R	save	%r20, %r0, %r24
	.word 0xb4ad4000  ! 1394: ANDNcc_R	andncc 	%r21, %r0, %r26
cpu_intr_0_97:
	setx	0x290331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e48000  ! 1396: SAVE_R	save	%r18, %r0, %r25
	.word 0xb5e4e01e  ! 1398: SAVE_I	save	%r19, 0x0001, %r26
cpu_intr_0_98:
	setx	0x2a032a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_107:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_107), 16, 16)) -> intp(0, 0, 11)
iob_intr_0_108:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_108), 16, 16)) -> intp(0, 0, 1d)
cpu_intr_0_99:
	setx	0x2b003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe520e4  ! 1408: SAVE_I	save	%r20, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_109:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_109), 16, 16)) -> intp(0, 0, 35)
	.word 0xb1e5a176  ! 1418: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_rd_52:
	mov	0x3c1, %r14
	.word 0xf6db8400  ! 1419: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_63:
	mov	0x3c7, %r14
	.word 0xfaf38e40  ! 1428: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_0_100:
	setx	0x280326, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_53:
	mov	0x1, %r14
	.word 0xfcdb89e0  ! 1432: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T0_asi_reg_wr_64:
	mov	0xe, %r14
	.word 0xf0f38e40  ! 1437: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_wr_65:
	mov	0x3c0, %r14
	.word 0xf2f38e40  ! 1438: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_110:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_110), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_rd_54:
	mov	0x3c6, %r14
	.word 0xf2db8e80  ! 1445: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_0_101:
	setx	0x29012a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_66:
	mov	0x3c4, %r14
	.word 0xfef384a0  ! 1448: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_0_111:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_111), 16, 16)) -> intp(0, 0, 27)
	.word 0xb37d0400  ! 1451: MOVR_R	movre	%r20, %r0, %r25
	.word 0xb1e48000  ! 1453: SAVE_R	save	%r18, %r0, %r24
	.word 0xb7e54000  ! 1454: SAVE_R	save	%r21, %r0, %r27
iob_intr_0_112:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_112), 16, 16)) -> intp(0, 0, 23)
T0_asi_reg_wr_67:
	mov	0x24, %r14
	.word 0xf4f384a0  ! 1457: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbde44000  ! 1459: SAVE_R	save	%r17, %r0, %r30
	.word 0xb634e0ad  ! 1462: ORN_I	orn 	%r19, 0x00ad, %r27
cpu_intr_0_102:
	setx	0x2b0233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_103:
	setx	0x2b0125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e40000  ! 1468: SAVE_R	save	%r16, %r0, %r26
cpu_intr_0_104:
	setx	0x2b0035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde52169  ! 1471: SAVE_I	save	%r20, 0x0001, %r30
cpu_intr_0_105:
	setx	0x290312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e045  ! 1473: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e460b4  ! 1474: SAVE_I	save	%r17, 0x0001, %r25
T0_asi_reg_rd_55:
	mov	0x3c8, %r14
	.word 0xf4db89e0  ! 1475: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbbe521ca  ! 1476: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_wr_68:
	mov	0x32, %r14
	.word 0xf6f38e80  ! 1481: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbde4c000  ! 1482: SAVE_R	save	%r19, %r0, %r30
	.word 0xb9e4a06e  ! 1483: SAVE_I	save	%r18, 0x0001, %r28
cpu_intr_0_106:
	setx	0x280313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e44000  ! 1490: SAVE_R	save	%r17, %r0, %r25
	.word 0xb3e54000  ! 1492: SAVE_R	save	%r21, %r0, %r25
T0_asi_reg_rd_56:
	mov	0x3c1, %r14
	.word 0xf4db89e0  ! 1497: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T0_asi_reg_wr_69:
	mov	0x2e, %r14
	.word 0xf0f38e40  ! 1498: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xba2da103  ! 1499: ANDN_I	andn 	%r22, 0x0103, %r29
	.word 0xb3e44000  ! 1503: SAVE_R	save	%r17, %r0, %r25
	.word 0xb5e5c000  ! 1507: SAVE_R	save	%r23, %r0, %r26
cpu_intr_0_107:
	setx	0x28023b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_113:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_113), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_wr_70:
	mov	0x3, %r14
	.word 0xf2f38e80  ! 1518: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_0_108:
	setx	0x280213, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_57:
	mov	0x36, %r14
	.word 0xf6db8e80  ! 1521: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb5e48000  ! 1525: SAVE_R	save	%r18, %r0, %r26
	.word 0xbfe5c000  ! 1528: SAVE_R	save	%r23, %r0, %r31
	.word 0xb3e44000  ! 1529: SAVE_R	save	%r17, %r0, %r25
cpu_intr_0_109:
	setx	0x290233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e52019  ! 1533: SAVE_I	save	%r20, 0x0001, %r25
iob_intr_0_114:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_114), 16, 16)) -> intp(0, 0, 26)
iob_intr_0_115:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_115), 16, 16)) -> intp(0, 0, 38)
	.word 0xbbe56034  ! 1537: SAVE_I	save	%r21, 0x0001, %r29
iob_intr_0_116:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_116), 16, 16)) -> intp(0, 0, 23)
cpu_intr_0_110:
	setx	0x2a0223, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_71:
	mov	0x3c6, %r14
	.word 0xf2f38e80  ! 1542: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T0_asi_reg_wr_72:
	mov	0x34, %r14
	.word 0xf6f38400  ! 1543: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb9e4608e  ! 1546: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_117:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_117), 16, 16)) -> intp(0, 0, 35)
	.word 0xb3e521b2  ! 1549: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbfe48000  ! 1551: SAVE_R	save	%r18, %r0, %r31
	.word 0xbbe40000  ! 1553: SAVE_R	save	%r16, %r0, %r29
	.word 0xb9e50000  ! 1556: SAVE_R	save	%r20, %r0, %r28
cpu_intr_0_111:
	setx	0x2b0134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 1558: SAVE_R	save	%r20, %r0, %r29
	.word 0xbbe54000  ! 1559: SAVE_R	save	%r21, %r0, %r29
	.word 0xb7e4e16f  ! 1563: SAVE_I	save	%r19, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_118:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_118), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_wr_73:
	mov	0x3c6, %r14
	.word 0xf2f38e60  ! 1566: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xbde4e017  ! 1568: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_wr_74:
	mov	0x3c5, %r14
	.word 0xf4f38e60  ! 1569: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T0_asi_reg_wr_75:
	mov	0x33, %r14
	.word 0xf0f38400  ! 1570: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_0_119:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_119), 16, 16)) -> intp(0, 0, 39)
cpu_intr_0_112:
	setx	0x2b011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e50000  ! 1576: SAVE_R	save	%r20, %r0, %r25
	.word 0xbfe4606e  ! 1579: SAVE_I	save	%r17, 0x0001, %r31
cpu_intr_0_113:
	setx	0x2b0201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e50000  ! 1581: SAVE_R	save	%r20, %r0, %r24
	.word 0xbfe4a010  ! 1582: SAVE_I	save	%r18, 0x0001, %r31
iob_intr_0_120:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_120), 16, 16)) -> intp(0, 0, 3)
iob_intr_0_121:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_121), 16, 16)) -> intp(0, 0, 3)
	.word 0xb5e58000  ! 1588: SAVE_R	save	%r22, %r0, %r26
cpu_intr_0_114:
	setx	0x280008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8dc000  ! 1592: ANDcc_R	andcc 	%r23, %r0, %r30
	.word 0xb4b5e0e2  ! 1598: ORNcc_I	orncc 	%r23, 0x00e2, %r26
	.word 0xb9e4a1e9  ! 1599: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_rd_58:
	mov	0x14, %r14
	.word 0xfadb8400  ! 1601: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb9e5605b  ! 1602: SAVE_I	save	%r21, 0x0001, %r28
iob_intr_0_122:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_122), 16, 16)) -> intp(0, 0, 26)
iob_intr_0_123:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_123), 16, 16)) -> intp(0, 0, 2b)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5341000  ! 1609: SRLX_R	srlx	%r16, %r0, %r26
	.word 0xb9e5a186  ! 1610: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_rd_59:
	mov	0x14, %r14
	.word 0xf0db8e80  ! 1611: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_0_115:
	setx	0x290234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6242095  ! 1617: SUB_I	sub 	%r16, 0x0095, %r27
T0_asi_reg_wr_76:
	mov	0x2, %r14
	.word 0xfcf38400  ! 1619: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbb508000  ! 1620: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e460f9  ! 1623: SAVE_I	save	%r17, 0x0001, %r27
T0_asi_reg_rd_60:
	mov	0x38, %r14
	.word 0xf4db8e40  ! 1625: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb53c2001  ! 1631: SRA_I	sra 	%r16, 0x0001, %r26
T0_asi_reg_rd_61:
	mov	0x3c8, %r14
	.word 0xf8db8e40  ! 1634: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbde44000  ! 1638: SAVE_R	save	%r17, %r0, %r30
	.word 0xb435e1b5  ! 1640: ORN_I	orn 	%r23, 0x01b5, %r26
T0_asi_reg_rd_62:
	mov	0x3, %r14
	.word 0xfcdb8e60  ! 1643: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb3e44000  ! 1645: SAVE_R	save	%r17, %r0, %r25
	.word 0xbbe58000  ! 1647: SAVE_R	save	%r22, %r0, %r29
	.word 0xb1e4c000  ! 1650: SAVE_R	save	%r19, %r0, %r24
iob_intr_0_124:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_124), 16, 16)) -> intp(0, 0, 37)
	.word 0xb1e50000  ! 1654: SAVE_R	save	%r20, %r0, %r24
	.word 0xb1e4c000  ! 1655: SAVE_R	save	%r19, %r0, %r24
iob_intr_0_125:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_125), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_rd_63:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 1659: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_116:
	setx	0x28013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e50000  ! 1661: SAVE_R	save	%r20, %r0, %r24
	.word 0xb3e4a177  ! 1662: SAVE_I	save	%r18, 0x0001, %r25
cpu_intr_0_117:
	setx	0x2a003c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_118:
	setx	0x290021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4c000  ! 1672: SAVE_R	save	%r19, %r0, %r30
iob_intr_0_126:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_126), 16, 16)) -> intp(0, 0, 39)
iob_intr_0_127:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_127), 16, 16)) -> intp(0, 0, d)
T0_asi_reg_rd_64:
	mov	0x18, %r14
	.word 0xfedb89e0  ! 1684: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_0_128:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_128), 16, 16)) -> intp(0, 0, 21)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_129:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_129), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_wr_77:
	mov	0x7, %r14
	.word 0xf2f38400  ! 1691: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb5e4e031  ! 1692: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbd7c6401  ! 1693: MOVR_I	movre	%r17, 0x1, %r30
iob_intr_0_130:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_130), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb1e4c000  ! 1697: SAVE_R	save	%r19, %r0, %r24
T0_asi_reg_wr_78:
	mov	0x23, %r14
	.word 0xfaf389e0  ! 1698: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb2244000  ! 1699: SUB_R	sub 	%r17, %r0, %r25
cpu_intr_0_119:
	setx	0x280223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6bd8000  ! 1705: XNORcc_R	xnorcc 	%r22, %r0, %r27
	.word 0x8d94a0a8  ! 1706: WRPR_PSTATE_I	wrpr	%r18, 0x00a8, %pstate
iob_intr_0_131:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_131), 16, 16)) -> intp(0, 0, 33)
iob_intr_0_132:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_132), 16, 16)) -> intp(0, 0, 37)
T0_asi_reg_wr_79:
	mov	0x2e, %r14
	.word 0xfef38400  ! 1714: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_0_120:
	setx	0x29033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e58000  ! 1718: SAVE_R	save	%r22, %r0, %r28
	.word 0xbfe50000  ! 1721: SAVE_R	save	%r20, %r0, %r31
	.word 0xbfe48000  ! 1722: SAVE_R	save	%r18, %r0, %r31
	.word 0xb1e4c000  ! 1725: SAVE_R	save	%r19, %r0, %r24
iob_intr_0_133:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_133), 16, 16)) -> intp(0, 0, 23)
	.word 0xb5e521d3  ! 1730: SAVE_I	save	%r20, 0x0001, %r26
iob_intr_0_134:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_134), 16, 16)) -> intp(0, 0, 19)
	.word 0xb3e5a0cf  ! 1736: SAVE_I	save	%r22, 0x0001, %r25
T0_asi_reg_rd_65:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 1740: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_0_121:
	setx	0x290317, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_135:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_135), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb5e58000  ! 1753: SAVE_R	save	%r22, %r0, %r26
	.word 0xb1e4c000  ! 1754: SAVE_R	save	%r19, %r0, %r24
	.word 0xb9e44000  ! 1756: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_rd_66:
	mov	0x4, %r14
	.word 0xfcdb8e40  ! 1757: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb5e44000  ! 1758: SAVE_R	save	%r17, %r0, %r26
	.word 0xb1e4c000  ! 1759: SAVE_R	save	%r19, %r0, %r24
iob_intr_0_136:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_136), 16, 16)) -> intp(0, 0, 8)
	.word 0xbebc8000  ! 1764: XNORcc_R	xnorcc 	%r18, %r0, %r31
	.word 0xb9e50000  ! 1766: SAVE_R	save	%r20, %r0, %r28
	.word 0xb9e52013  ! 1767: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbfe4a15e  ! 1769: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb9e50000  ! 1772: SAVE_R	save	%r20, %r0, %r28
	.word 0xbcb48000  ! 1773: SUBCcc_R	orncc 	%r18, %r0, %r30
iob_intr_0_137:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_137), 16, 16)) -> intp(0, 0, d)
	.word 0xbf643801  ! 1776: MOVcc_I	<illegal instruction>
	.word 0xb7e46037  ! 1777: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb3e4c000  ! 1779: SAVE_R	save	%r19, %r0, %r25
iob_intr_0_138:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_138), 16, 16)) -> intp(0, 0, 38)
	.word 0xbbe4c000  ! 1783: SAVE_R	save	%r19, %r0, %r29
cpu_intr_0_122:
	setx	0x280227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 1790: SAVE_R	save	%r20, %r0, %r27
cpu_intr_0_123:
	setx	0x2a021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e44000  ! 1795: SAVE_R	save	%r17, %r0, %r28
	.word 0xb9e58000  ! 1800: SAVE_R	save	%r22, %r0, %r28
	.word 0x8195a10a  ! 1801: WRPR_TPC_I	wrpr	%r22, 0x010a, %tpc
	.word 0xbfe5c000  ! 1802: SAVE_R	save	%r23, %r0, %r31
cpu_intr_0_124:
	setx	0x2002d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_67:
	mov	0x1c, %r14
	.word 0xf2db89e0  ! 1805: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb7e4a183  ! 1808: SAVE_I	save	%r18, 0x0001, %r27
iob_intr_0_139:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_139), 16, 16)) -> intp(0, 0, 0)
iob_intr_0_140:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_140), 16, 16)) -> intp(0, 0, d)
	.word 0xbbe48000  ! 1814: SAVE_R	save	%r18, %r0, %r29
	.word 0xb1e54000  ! 1820: SAVE_R	save	%r21, %r0, %r24
T0_asi_reg_wr_80:
	mov	0x1c, %r14
	.word 0xfaf389e0  ! 1822: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_0_125:
	setx	0x290219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e0ea  ! 1827: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_wr_81:
	mov	0x32, %r14
	.word 0xf4f38e40  ! 1832: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb1e5e099  ! 1835: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_rd_68:
	mov	0x24, %r14
	.word 0xf8db8e60  ! 1839: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_0_141:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_141), 16, 16)) -> intp(0, 0, 20)
	.word 0xb815e0f7  ! 1842: OR_I	or 	%r23, 0x00f7, %r28
	.word 0xb3e4a164  ! 1845: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb834c000  ! 1847: SUBC_R	orn 	%r19, %r0, %r28
T0_asi_reg_wr_82:
	mov	0xa, %r14
	.word 0xf0f384a0  ! 1848: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_0_126:
	setx	0x290035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_127:
	setx	0x28013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e42005  ! 1855: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde44000  ! 1859: SAVE_R	save	%r17, %r0, %r30
iob_intr_0_142:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_142), 16, 16)) -> intp(0, 0, c)
	.word 0xb2b40000  ! 1862: SUBCcc_R	orncc 	%r16, %r0, %r25
	.word 0xb9e58000  ! 1864: SAVE_R	save	%r22, %r0, %r28
	.word 0xb014a150  ! 1867: OR_I	or 	%r18, 0x0150, %r24
iob_intr_0_143:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_143), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_rd_69:
	mov	0x22, %r14
	.word 0xfedb8400  ! 1872: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T0_asi_reg_wr_83:
	mov	0x1e, %r14
	.word 0xf4f38e40  ! 1873: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbfe4c000  ! 1882: SAVE_R	save	%r19, %r0, %r31
	.word 0xb6140000  ! 1888: OR_R	or 	%r16, %r0, %r27
cpu_intr_0_128:
	setx	0x2d030d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_129:
	setx	0x2c033b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_130:
	setx	0x2e0203, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_70:
	mov	0x9, %r14
	.word 0xf6db8e60  ! 1895: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_0_131:
	setx	0x2d0208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e58000  ! 1906: SAVE_R	save	%r22, %r0, %r25
	.word 0xbbe420b0  ! 1908: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbf508000  ! 1909: RDPR_TSTATE	<illegal instruction>
	.word 0xb5e40000  ! 1910: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_wr_84:
	mov	0x38, %r14
	.word 0xfcf384a0  ! 1912: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_0_132:
	setx	0x2c0200, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_133:
	setx	0x2e0224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde44000  ! 1926: SAVE_R	save	%r17, %r0, %r30
cpu_intr_0_134:
	setx	0x2c0314, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_135:
	setx	0x2d0325, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_71:
	mov	0x3c0, %r14
	.word 0xf6db8400  ! 1931: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb5e40000  ! 1935: SAVE_R	save	%r16, %r0, %r26
cpu_intr_0_136:
	setx	0x2e031b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_137:
	setx	0x2d0000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a138  ! 1939: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb13cc000  ! 1940: SRA_R	sra 	%r19, %r0, %r24
cpu_intr_0_138:
	setx	0x2d0005, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_139:
	setx	0x2d003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4616a  ! 1945: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb3e4a064  ! 1946: SAVE_I	save	%r18, 0x0001, %r25
iob_intr_0_144:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_144), 16, 16)) -> intp(0, 0, 17)
	.word 0xbfe58000  ! 1953: SAVE_R	save	%r22, %r0, %r31
T0_asi_reg_rd_72:
	mov	0x1f, %r14
	.word 0xfadb8e40  ! 1957: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbbe5c000  ! 1959: SAVE_R	save	%r23, %r0, %r29
iob_intr_0_145:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_145), 16, 16)) -> intp(0, 0, 2e)
T0_asi_reg_rd_73:
	mov	0x3c0, %r14
	.word 0xf6db84a0  ! 1962: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbfe4618a  ! 1963: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb97c8400  ! 1965: MOVR_R	movre	%r18, %r0, %r28
	.word 0xb3e58000  ! 1969: SAVE_R	save	%r22, %r0, %r25
iob_intr_0_146:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_146), 16, 16)) -> intp(0, 0, 0)
	.word 0xbd7c0400  ! 1975: MOVR_R	movre	%r16, %r0, %r30
T0_asi_reg_wr_85:
	mov	0x3c7, %r14
	.word 0xfcf38400  ! 1976: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb3e54000  ! 1980: SAVE_R	save	%r21, %r0, %r25
iob_intr_0_147:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_147), 16, 16)) -> intp(0, 0, 4)
	.word 0xbbe5c000  ! 1983: SAVE_R	save	%r23, %r0, %r29
iob_intr_0_148:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_148), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_rd_74:
	mov	0x36, %r14
	.word 0xfedb8e40  ! 1986: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbb3d8000  ! 1987: SRA_R	sra 	%r22, %r0, %r29
	.word 0xb93d0000  ! 1988: SRA_R	sra 	%r20, %r0, %r28
cpu_intr_0_140:
	setx	0x2e0215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe40000  ! 1993: SAVE_R	save	%r16, %r0, %r29
iob_intr_0_149:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_149), 16, 16)) -> intp(0, 0, 17)
cpu_intr_0_141:
	setx	0x2c010d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_75:
	mov	0x3c3, %r14
	.word 0xfadb8e40  ! 2005: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_142:
	setx	0x2c0021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb004a15f  ! 2007: ADD_I	add 	%r18, 0x015f, %r24
iob_intr_0_150:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_150), 16, 16)) -> intp(0, 0, 2d)
cpu_intr_0_143:
	setx	0x2f0302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e50000  ! 2010: SAVE_R	save	%r20, %r0, %r28
	.word 0xb7e4a1c9  ! 2012: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_rd_76:
	mov	0x28, %r14
	.word 0xfedb8e80  ! 2013: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb3e5a00a  ! 2014: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_144:
	setx	0x2f0031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_145:
	setx	0x2c0326, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_146:
	setx	0x2f030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_147:
	setx	0x2e0317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e42054  ! 2022: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7e5a105  ! 2023: SAVE_I	save	%r22, 0x0001, %r27
iob_intr_0_151:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_151), 16, 16)) -> intp(0, 0, 3a)
cpu_intr_0_148:
	setx	0x2d0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe40000  ! 2027: SAVE_R	save	%r16, %r0, %r31
cpu_intr_0_149:
	setx	0x2e003b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_150:
	setx	0x2f0119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba3dc000  ! 2031: XNOR_R	xnor 	%r23, %r0, %r29
cpu_intr_0_151:
	setx	0x2c030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a1b9  ! 2033: SAVE_I	save	%r22, 0x0001, %r28
cpu_intr_0_152:
	setx	0x2e0228, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_153:
	setx	0x2f0333, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_86:
	mov	0x3c7, %r14
	.word 0xf0f38e40  ! 2040: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb5e4a19c  ! 2041: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbde4c000  ! 2043: SAVE_R	save	%r19, %r0, %r30
	.word 0xb3e50000  ! 2051: SAVE_R	save	%r20, %r0, %r25
	.word 0xb4158000  ! 2053: OR_R	or 	%r22, %r0, %r26
	.word 0xb1e54000  ! 2060: SAVE_R	save	%r21, %r0, %r24
T0_asi_reg_rd_77:
	mov	0x11, %r14
	.word 0xf4db89e0  ! 2065: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T0_asi_reg_wr_87:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 2066: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_rd_78:
	mov	0x3c5, %r14
	.word 0xf4db89e0  ! 2068: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbbe56045  ! 2070: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb3e4e0cc  ! 2073: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb12cb001  ! 2077: SLLX_I	sllx	%r18, 0x0001, %r24
	.word 0x9194e0f2  ! 2079: WRPR_PIL_I	wrpr	%r19, 0x00f2, %pil
	.word 0xb9e40000  ! 2080: SAVE_R	save	%r16, %r0, %r28
	.word 0xbde50000  ! 2081: SAVE_R	save	%r20, %r0, %r30
cpu_intr_0_154:
	setx	0x2f0210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 2089: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_152:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_152), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_wr_88:
	mov	0x3c6, %r14
	.word 0xfaf389e0  ! 2091: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_0_155:
	setx	0x2f022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb20d0000  ! 2093: AND_R	and 	%r20, %r0, %r25
T0_asi_reg_rd_79:
	mov	0x21, %r14
	.word 0xfadb89e0  ! 2095: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb3e46078  ! 2096: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb9e4e0bc  ! 2097: SAVE_I	save	%r19, 0x0001, %r28
iob_intr_0_153:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_153), 16, 16)) -> intp(0, 0, 17)
	.word 0xb3e4e09b  ! 2099: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb434c000  ! 2100: SUBC_R	orn 	%r19, %r0, %r26
cpu_intr_0_156:
	setx	0x2d0025, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_157:
	setx	0x2d0233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e169  ! 2108: SAVE_I	save	%r19, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_158:
	setx	0x2c032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e42151  ! 2114: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbfe52046  ! 2116: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb1e4612b  ! 2117: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb3e42122  ! 2118: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_wr_89:
	mov	0x1, %r14
	.word 0xf6f389e0  ! 2119: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T0_asi_reg_wr_90:
	mov	0x3c0, %r14
	.word 0xf2f389e0  ! 2122: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e560aa  ! 2126: SAVE_I	save	%r21, 0x0001, %r27
iob_intr_0_154:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_154), 16, 16)) -> intp(0, 0, 6)
	.word 0xb7518000  ! 2131: RDPR_PSTATE	<illegal instruction>
T0_asi_reg_rd_80:
	mov	0x14, %r14
	.word 0xfedb8e40  ! 2132: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb7e54000  ! 2133: SAVE_R	save	%r21, %r0, %r27
cpu_intr_0_159:
	setx	0x2d023f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_160:
	setx	0x2f0210, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_155:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_155), 16, 16)) -> intp(0, 0, d)
cpu_intr_0_161:
	setx	0x2f012c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_156:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_156), 16, 16)) -> intp(0, 0, 19)
	.word 0xb32da001  ! 2144: SLL_I	sll 	%r22, 0x0001, %r25
	.word 0xb5e58000  ! 2145: SAVE_R	save	%r22, %r0, %r26
cpu_intr_0_162:
	setx	0x2f0233, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_91:
	mov	0x8, %r14
	.word 0xf0f389e0  ! 2148: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbbe4e0a7  ! 2149: SAVE_I	save	%r19, 0x0001, %r29
cpu_intr_0_163:
	setx	0x20031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 2154: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_164:
	setx	0x2e023a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_81:
	mov	0x3c8, %r14
	.word 0xfedb8e60  ! 2159: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xbbe461e9  ! 2162: SAVE_I	save	%r17, 0x0001, %r29
cpu_intr_0_165:
	setx	0x2c021a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_157:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_157), 16, 16)) -> intp(0, 0, 1b)
cpu_intr_0_166:
	setx	0x2d0335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4c000  ! 2168: SAVE_R	save	%r19, %r0, %r25
iob_intr_0_158:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_158), 16, 16)) -> intp(0, 0, 38)
	.word 0xb9e5c000  ! 2172: SAVE_R	save	%r23, %r0, %r28
	.word 0xbde5e065  ! 2173: SAVE_I	save	%r23, 0x0001, %r30
cpu_intr_0_167:
	setx	0x2c020e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_82:
	mov	0xb, %r14
	.word 0xf0db84a0  ! 2176: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb93da001  ! 2177: SRA_I	sra 	%r22, 0x0001, %r28
T0_asi_reg_rd_83:
	mov	0xe, %r14
	.word 0xf8db8e60  ! 2179: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xa1902002  ! 2180: WRPR_GL_I	wrpr	%r0, 0x0002, %-
T0_asi_reg_wr_92:
	mov	0x3c5, %r14
	.word 0xfcf389e0  ! 2181: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T0_asi_reg_wr_93:
	mov	0x25, %r14
	.word 0xfcf38e40  ! 2182: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_168:
	setx	0x2d0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e1ca  ! 2190: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb3e5a14b  ! 2196: SAVE_I	save	%r22, 0x0001, %r25
T0_asi_reg_rd_84:
	mov	0x5, %r14
	.word 0xf0db84a0  ! 2197: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_0_169:
	setx	0x2e0216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde52038  ! 2200: SAVE_I	save	%r20, 0x0001, %r30
cpu_intr_0_170:
	setx	0x2d0218, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_159:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_159), 16, 16)) -> intp(0, 0, 20)
iob_intr_0_160:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_160), 16, 16)) -> intp(0, 0, 6)
	.word 0xbfe4c000  ! 2208: SAVE_R	save	%r19, %r0, %r31
	.word 0xbfe5606b  ! 2210: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb9e44000  ! 2211: SAVE_R	save	%r17, %r0, %r28
	.word 0xbde54000  ! 2212: SAVE_R	save	%r21, %r0, %r30
	.word 0xb09460c0  ! 2213: ORcc_I	orcc 	%r17, 0x00c0, %r24
cpu_intr_0_171:
	setx	0x2e0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e145  ! 2217: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3e5e0bd  ! 2219: SAVE_I	save	%r23, 0x0001, %r25
cpu_intr_0_172:
	setx	0x2c0321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e44000  ! 2222: SAVE_R	save	%r17, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e58000  ! 2225: SAVE_R	save	%r22, %r0, %r26
iob_intr_0_161:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_161), 16, 16)) -> intp(0, 0, 18)
	.word 0xb5e4212c  ! 2232: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb24421ab  ! 2235: ADDC_I	addc 	%r16, 0x01ab, %r25
cpu_intr_0_173:
	setx	0x2d0119, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_94:
	mov	0x21, %r14
	.word 0xfaf38e40  ! 2239: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb7e5a0fb  ! 2241: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb89de13c  ! 2242: XORcc_I	xorcc 	%r23, 0x013c, %r28
	.word 0xbde46167  ! 2243: SAVE_I	save	%r17, 0x0001, %r30
T0_asi_reg_rd_85:
	mov	0x15, %r14
	.word 0xf4db8e40  ! 2245: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb3e46005  ! 2246: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3e54000  ! 2247: SAVE_R	save	%r21, %r0, %r25
T0_asi_reg_wr_95:
	mov	0x9, %r14
	.word 0xf4f389e0  ! 2249: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_174:
	setx	0x2f0338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe58000  ! 2253: SAVE_R	save	%r22, %r0, %r31
	.word 0xb434e14b  ! 2256: ORN_I	orn 	%r19, 0x014b, %r26
	.word 0xbfe4c000  ! 2261: SAVE_R	save	%r19, %r0, %r31
cpu_intr_0_175:
	setx	0x2e0018, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_162:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_162), 16, 16)) -> intp(0, 0, 1d)
T0_asi_reg_wr_96:
	mov	0x3c1, %r14
	.word 0xf4f38e60  ! 2266: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb1e4e03d  ! 2268: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb3e4c000  ! 2272: SAVE_R	save	%r19, %r0, %r25
	.word 0xbe14c000  ! 2273: OR_R	or 	%r19, %r0, %r31
cpu_intr_0_176:
	setx	0x2e0106, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_177:
	setx	0x2e031b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_163:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_163), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb7e54000  ! 2280: SAVE_R	save	%r21, %r0, %r27
iob_intr_0_164:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_164), 16, 16)) -> intp(0, 0, 2)
	.word 0xbeb4a11d  ! 2286: ORNcc_I	orncc 	%r18, 0x011d, %r31
T0_asi_reg_wr_97:
	mov	0xc, %r14
	.word 0xf8f38e40  ! 2287: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_rd_86:
	mov	0x3c1, %r14
	.word 0xfadb8400  ! 2289: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_0_178:
	setx	0x2e021b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_165:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_165), 16, 16)) -> intp(0, 0, 1a)
iob_intr_0_166:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_166), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_wr_98:
	mov	0x24, %r14
	.word 0xf8f389e0  ! 2299: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbfe5204f  ! 2301: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_167:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_167), 16, 16)) -> intp(0, 0, 6)
	.word 0xb7e5604c  ! 2305: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb1e4c000  ! 2307: SAVE_R	save	%r19, %r0, %r24
	.word 0xbc1ca08a  ! 2308: XOR_I	xor 	%r18, 0x008a, %r30
	.word 0xba2de1c0  ! 2309: ANDN_I	andn 	%r23, 0x01c0, %r29
cpu_intr_0_179:
	setx	0x330309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5c000  ! 2314: SAVE_R	save	%r23, %r0, %r29
	.word 0xb2a521b4  ! 2319: SUBcc_I	subcc 	%r20, 0x01b4, %r25
	.word 0xb535a001  ! 2322: SRL_I	srl 	%r22, 0x0001, %r26
T0_asi_reg_rd_87:
	mov	0x3c1, %r14
	.word 0xf8db8e40  ! 2327: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_180:
	setx	0x30023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e48000  ! 2329: SAVE_R	save	%r18, %r0, %r25
	.word 0xb1e420eb  ! 2331: SAVE_I	save	%r16, 0x0001, %r24
T0_asi_reg_wr_99:
	mov	0x3c4, %r14
	.word 0xf6f384a0  ! 2333: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_0_181:
	setx	0x300101, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_100:
	mov	0x3c7, %r14
	.word 0xfef389e0  ! 2336: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_0_168:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_168), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb8144000  ! 2341: OR_R	or 	%r17, %r0, %r28
	.word 0xbfe54000  ! 2349: SAVE_R	save	%r21, %r0, %r31
cpu_intr_0_182:
	setx	0x30013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 2353: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_169:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_169), 16, 16)) -> intp(0, 0, 5)
	.word 0xbfe4e16c  ! 2355: SAVE_I	save	%r19, 0x0001, %r31
cpu_intr_0_183:
	setx	0x32033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe54000  ! 2358: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_170:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_170), 16, 16)) -> intp(0, 0, 37)
iob_intr_0_171:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_171), 16, 16)) -> intp(0, 0, c)
	.word 0xb7e58000  ! 2362: SAVE_R	save	%r22, %r0, %r27
	.word 0xb350c000  ! 2363: RDPR_TT	<illegal instruction>
	.word 0xb5e44000  ! 2366: SAVE_R	save	%r17, %r0, %r26
T0_asi_reg_rd_88:
	mov	0x35, %r14
	.word 0xf2db84a0  ! 2368: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb7e40000  ! 2370: SAVE_R	save	%r16, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_89:
	mov	0x3c2, %r14
	.word 0xf8db84a0  ! 2376: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbbe5a1e5  ! 2377: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_172:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_172), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_wr_101:
	mov	0x18, %r14
	.word 0xfef384a0  ! 2380: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb7480000  ! 2385: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
T0_asi_reg_rd_90:
	mov	0x1b, %r14
	.word 0xf2db8e60  ! 2387: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T0_asi_reg_rd_91:
	mov	0x3c4, %r14
	.word 0xf4db8e80  ! 2388: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T0_asi_reg_rd_92:
	mov	0x3c5, %r14
	.word 0xf2db8e80  ! 2393: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb9e5212e  ! 2395: SAVE_I	save	%r20, 0x0001, %r28
T0_asi_reg_wr_102:
	mov	0x28, %r14
	.word 0xf0f38e40  ! 2403: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e460ee  ! 2405: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb63c4000  ! 2407: XNOR_R	xnor 	%r17, %r0, %r27
	.word 0xbfe44000  ! 2409: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_173:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_173), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_wr_103:
	mov	0x3c7, %r14
	.word 0xfef38400  ! 2411: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_0_174:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_174), 16, 16)) -> intp(0, 0, 27)
	.word 0xb1e421e8  ! 2416: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e5c000  ! 2418: SAVE_R	save	%r23, %r0, %r25
	.word 0xb3e4e18a  ! 2421: SAVE_I	save	%r19, 0x0001, %r25
cpu_intr_0_184:
	setx	0x30012d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_185:
	setx	0x330119, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_93:
	mov	0x1e, %r14
	.word 0xf2db89e0  ! 2427: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_0_175:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_175), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb3e42066  ! 2429: SAVE_I	save	%r16, 0x0001, %r25
iob_intr_0_176:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_176), 16, 16)) -> intp(0, 0, 35)
T0_asi_reg_wr_104:
	mov	0x17, %r14
	.word 0xf4f38e60  ! 2433: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_0_186:
	setx	0x33000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e521f6  ! 2439: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_wr_105:
	mov	0x3c0, %r14
	.word 0xf4f38e40  ! 2444: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_187:
	setx	0x33031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 2446: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_177:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_177), 16, 16)) -> intp(0, 0, 3f)
	.word 0xbfe4214b  ! 2449: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbd51c000  ! 2452: RDPR_TL	<illegal instruction>
	.word 0xb7e50000  ! 2457: SAVE_R	save	%r20, %r0, %r27
cpu_intr_0_188:
	setx	0x30002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde561d6  ! 2460: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbfe56194  ! 2461: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_rd_94:
	mov	0x21, %r14
	.word 0xf8db8e40  ! 2462: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_0_178:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_178), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_rd_95:
	mov	0x19, %r14
	.word 0xfcdb8400  ! 2465: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbbe4a106  ! 2468: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb1e58000  ! 2469: SAVE_R	save	%r22, %r0, %r24
iob_intr_0_179:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_179), 16, 16)) -> intp(0, 0, 9)
	.word 0xb1e44000  ! 2472: SAVE_R	save	%r17, %r0, %r24
	.word 0xb7e5a0b3  ! 2473: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb3e5e086  ! 2475: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb3e5c000  ! 2480: SAVE_R	save	%r23, %r0, %r25
	.word 0xbab5213e  ! 2481: SUBCcc_I	orncc 	%r20, 0x013e, %r29
	.word 0xbbe48000  ! 2484: SAVE_R	save	%r18, %r0, %r29
	.word 0xb5e5c000  ! 2486: SAVE_R	save	%r23, %r0, %r26
	.word 0xbde4e10d  ! 2488: SAVE_I	save	%r19, 0x0001, %r30
cpu_intr_0_189:
	setx	0x320001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e56186  ! 2497: SAVE_I	save	%r21, 0x0001, %r28
cpu_intr_0_190:
	setx	0x31000a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_191:
	setx	0x320104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e42045  ! 2503: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7e42147  ! 2504: SAVE_I	save	%r16, 0x0001, %r27
T0_asi_reg_wr_106:
	mov	0x3c1, %r14
	.word 0xfcf38e60  ! 2517: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_0_192:
	setx	0x310100, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_96:
	mov	0x2e, %r14
	.word 0xfadb8e40  ! 2520: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb7e520ea  ! 2523: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3504000  ! 2526: RDPR_TNPC	<illegal instruction>
	.word 0xb3e48000  ! 2527: SAVE_R	save	%r18, %r0, %r25
	.word 0xb7e50000  ! 2528: SAVE_R	save	%r20, %r0, %r27
	.word 0xb9e5e189  ! 2531: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbfe5c000  ! 2535: SAVE_R	save	%r23, %r0, %r31
	.word 0xb7e40000  ! 2537: SAVE_R	save	%r16, %r0, %r27
	.word 0xb7e40000  ! 2538: SAVE_R	save	%r16, %r0, %r27
T0_asi_reg_rd_97:
	mov	0x35, %r14
	.word 0xf2db8e40  ! 2540: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_193:
	setx	0x310315, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_194:
	setx	0x300212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb2c8000  ! 2545: SLL_R	sll 	%r18, %r0, %r29
cpu_intr_0_195:
	setx	0x320217, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_107:
	mov	0x9, %r14
	.word 0xf6f38e60  ! 2548: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_0_196:
	setx	0x310108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbabdc000  ! 2550: XNORcc_R	xnorcc 	%r23, %r0, %r29
	.word 0xb9e4e162  ! 2554: SAVE_I	save	%r19, 0x0001, %r28
cpu_intr_0_197:
	setx	0x310330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5217a  ! 2561: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb1e56156  ! 2562: SAVE_I	save	%r21, 0x0001, %r24
cpu_intr_0_198:
	setx	0x300218, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_199:
	setx	0x300207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a0db  ! 2568: SAVE_I	save	%r18, 0x0001, %r27
cpu_intr_0_200:
	setx	0x300208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e46196  ! 2573: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7e58000  ! 2575: SAVE_R	save	%r22, %r0, %r27
	.word 0xb5e54000  ! 2577: SAVE_R	save	%r21, %r0, %r26
	.word 0xbbe40000  ! 2580: SAVE_R	save	%r16, %r0, %r29
iob_intr_0_180:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_180), 16, 16)) -> intp(0, 0, 1d)
iob_intr_0_181:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_181), 16, 16)) -> intp(0, 0, 1f)
iob_intr_0_182:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_182), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_183:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_183), 16, 16)) -> intp(0, 0, 9)
	.word 0xb5e58000  ! 2594: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_wr_108:
	mov	0x16, %r14
	.word 0xf6f38e40  ! 2595: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_wr_109:
	mov	0xa, %r14
	.word 0xf4f38400  ! 2597: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_0_184:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_184), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_rd_98:
	mov	0x3c8, %r14
	.word 0xfedb8e40  ! 2599: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb1e5a14b  ! 2600: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbfe5a029  ! 2605: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb3e42113  ! 2611: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbbe50000  ! 2612: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_185:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_185), 16, 16)) -> intp(0, 0, 23)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e48000  ! 2615: SAVE_R	save	%r18, %r0, %r26
T0_asi_reg_rd_99:
	mov	0xb, %r14
	.word 0xf8db8e40  ! 2618: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb9e52155  ! 2623: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_201:
	setx	0x330212, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_186:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_186), 16, 16)) -> intp(0, 0, 21)
cpu_intr_0_202:
	setx	0x30002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 2634: SAVE_R	save	%r16, %r0, %r24
	.word 0xbbe58000  ! 2635: SAVE_R	save	%r22, %r0, %r29
	.word 0xbbe58000  ! 2637: SAVE_R	save	%r22, %r0, %r29
iob_intr_0_187:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_187), 16, 16)) -> intp(0, 0, 1d)
iob_intr_0_188:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_188), 16, 16)) -> intp(0, 0, 17)
cpu_intr_0_203:
	setx	0x330231, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_189:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_189), 16, 16)) -> intp(0, 0, 5)
	.word 0xbde58000  ! 2646: SAVE_R	save	%r22, %r0, %r30
	.word 0xbde5e11f  ! 2647: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbbe5c000  ! 2649: SAVE_R	save	%r23, %r0, %r29
T0_asi_reg_rd_100:
	mov	0x36, %r14
	.word 0xfedb8400  ! 2651: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_0_204:
	setx	0x300135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd7dc400  ! 2655: MOVR_R	movre	%r23, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_205:
	setx	0x330336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 2669: SAVE_R	save	%r21, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_190:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_190), 16, 16)) -> intp(0, 0, 12)
T0_asi_reg_rd_101:
	mov	0x3c1, %r14
	.word 0xfcdb8e60  ! 2673: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb4bde117  ! 2676: XNORcc_I	xnorcc 	%r23, 0x0117, %r26
	.word 0xb0042191  ! 2680: ADD_I	add 	%r16, 0x0191, %r24
	.word 0xbbe420c1  ! 2685: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_191:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_191), 16, 16)) -> intp(0, 0, 33)
iob_intr_0_192:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_192), 16, 16)) -> intp(0, 0, 2)
	.word 0xbbe44000  ! 2689: SAVE_R	save	%r17, %r0, %r29
	.word 0xb1e46080  ! 2690: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbde54000  ! 2691: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_206:
	setx	0x330129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e40000  ! 2696: SAVE_R	save	%r16, %r0, %r26
	.word 0xb2048000  ! 2700: ADD_R	add 	%r18, %r0, %r25
	.word 0xb2c5a13c  ! 2708: ADDCcc_I	addccc 	%r22, 0x013c, %r25
	.word 0xb7e40000  ! 2709: SAVE_R	save	%r16, %r0, %r27
	.word 0xbbe5c000  ! 2710: SAVE_R	save	%r23, %r0, %r29
	.word 0x9194208a  ! 2712: WRPR_PIL_I	wrpr	%r16, 0x008a, %pil
	.word 0xb7e44000  ! 2713: SAVE_R	save	%r17, %r0, %r27
cpu_intr_0_207:
	setx	0x320220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4c000  ! 2719: SAVE_R	save	%r19, %r0, %r28
cpu_intr_0_208:
	setx	0x330038, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_209:
	setx	0x300102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e029  ! 2724: SAVE_I	save	%r19, 0x0001, %r30
cpu_intr_0_210:
	setx	0x320024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a0c5  ! 2727: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde5c000  ! 2734: SAVE_R	save	%r23, %r0, %r30
iob_intr_0_193:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_193), 16, 16)) -> intp(0, 0, 1d)
	.word 0xbbe5c000  ! 2737: SAVE_R	save	%r23, %r0, %r29
	.word 0xb33dc000  ! 2739: SRA_R	sra 	%r23, %r0, %r25
	.word 0xb9e40000  ! 2740: SAVE_R	save	%r16, %r0, %r28
iob_intr_0_194:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_194), 16, 16)) -> intp(0, 0, 16)
iob_intr_0_195:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_195), 16, 16)) -> intp(0, 0, 28)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb1e40000  ! 2755: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_211:
	setx	0x32033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde40000  ! 2759: SAVE_R	save	%r16, %r0, %r30
cpu_intr_0_212:
	setx	0x31022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 2764: SAVE_R	save	%r23, %r0, %r27
iob_intr_0_196:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_196), 16, 16)) -> intp(0, 0, 23)
	.word 0xbbe4c000  ! 2767: SAVE_R	save	%r19, %r0, %r29
cpu_intr_0_213:
	setx	0x330030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e52163  ! 2771: SAVE_I	save	%r20, 0x0001, %r25
cpu_intr_0_214:
	setx	0x330327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe54000  ! 2774: SAVE_R	save	%r21, %r0, %r29
cpu_intr_0_215:
	setx	0x320034, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_216:
	setx	0x330202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e48000  ! 2779: SAVE_R	save	%r18, %r0, %r25
	.word 0xb1e56192  ! 2783: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbbe48000  ! 2787: SAVE_R	save	%r18, %r0, %r29
	.word 0xb3e5a0ff  ! 2788: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbc05e03b  ! 2790: ADD_I	add 	%r23, 0x003b, %r30
	.word 0xbde4e1ce  ! 2792: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_wr_110:
	mov	0x38, %r14
	.word 0xf8f38e40  ! 2793: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_rd_102:
	mov	0x5, %r14
	.word 0xf6db8400  ! 2794: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T0_asi_reg_wr_111:
	mov	0x17, %r14
	.word 0xfcf38e80  ! 2798: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb0158000  ! 2799: OR_R	or 	%r22, %r0, %r24
cpu_intr_0_217:
	setx	0x32030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e54000  ! 2811: SAVE_R	save	%r21, %r0, %r25
iob_intr_0_197:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_197), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_198:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_198), 16, 16)) -> intp(0, 0, 33)
	.word 0xb1e50000  ! 2819: SAVE_R	save	%r20, %r0, %r24
	.word 0xb9e4a03c  ! 2822: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_rd_103:
	mov	0x2f, %r14
	.word 0xf6db84a0  ! 2825: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb9e40000  ! 2829: SAVE_R	save	%r16, %r0, %r28
iob_intr_0_199:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_199), 16, 16)) -> intp(0, 0, 21)
	.word 0xb1e40000  ! 2834: SAVE_R	save	%r16, %r0, %r24
	.word 0xb7e5c000  ! 2836: SAVE_R	save	%r23, %r0, %r27
	.word 0xb4358000  ! 2837: ORN_R	orn 	%r22, %r0, %r26
T0_asi_reg_rd_104:
	mov	0x3c7, %r14
	.word 0xf0db8e40  ! 2838: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_200:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_200), 16, 16)) -> intp(0, 0, 20)
	.word 0xb1e48000  ! 2843: SAVE_R	save	%r18, %r0, %r24
	.word 0xbde4e150  ! 2846: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_wr_112:
	mov	0x20, %r14
	.word 0xf2f38e40  ! 2849: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_0_218:
	setx	0x34010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_105:
	mov	0x3c7, %r14
	.word 0xf4db8e40  ! 2856: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb5e42146  ! 2857: SAVE_I	save	%r16, 0x0001, %r26
cpu_intr_0_219:
	setx	0x360108, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_220:
	setx	0x340122, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_201:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_201), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb1e44000  ! 2868: SAVE_R	save	%r17, %r0, %r24
iob_intr_0_202:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_202), 16, 16)) -> intp(0, 0, 2)
	.word 0xbfe58000  ! 2872: SAVE_R	save	%r22, %r0, %r31
	.word 0xbfe54000  ! 2875: SAVE_R	save	%r21, %r0, %r31
T0_asi_reg_wr_113:
	mov	0x36, %r14
	.word 0xfcf389e0  ! 2876: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb5e50000  ! 2877: SAVE_R	save	%r20, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_203:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_203), 16, 16)) -> intp(0, 0, 39)
	.word 0xb6bd0000  ! 2886: XNORcc_R	xnorcc 	%r20, %r0, %r27
	.word 0xb1e4602d  ! 2891: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_wr_114:
	mov	0x3c2, %r14
	.word 0xf8f384a0  ! 2895: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_0_221:
	setx	0x36013a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_204:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_204), 16, 16)) -> intp(0, 0, c)
cpu_intr_0_222:
	setx	0x34033c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_115:
	mov	0xd, %r14
	.word 0xf0f38400  ! 2900: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_0_223:
	setx	0x360002, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_106:
	mov	0x3c6, %r14
	.word 0xfedb8e40  ! 2903: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_rd_107:
	mov	0x3c5, %r14
	.word 0xfadb8e40  ! 2904: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_wr_116:
	mov	0x36, %r14
	.word 0xf6f38e80  ! 2906: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T0_asi_reg_wr_117:
	mov	0x1d, %r14
	.word 0xfaf38e40  ! 2912: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_205:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_205), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb1e5a05b  ! 2915: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_206:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_206), 16, 16)) -> intp(0, 0, 37)
	.word 0xbfe4219e  ! 2917: SAVE_I	save	%r16, 0x0001, %r31
cpu_intr_0_224:
	setx	0x340335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4c000  ! 2923: SAVE_R	save	%r19, %r0, %r31
	.word 0xb5e50000  ! 2924: SAVE_R	save	%r20, %r0, %r26
	.word 0xb3e52162  ! 2925: SAVE_I	save	%r20, 0x0001, %r25
iob_intr_0_207:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_207), 16, 16)) -> intp(0, 0, 3d)
T0_asi_reg_rd_108:
	mov	0x2, %r14
	.word 0xf0db8e40  ! 2931: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbfe5c000  ! 2932: SAVE_R	save	%r23, %r0, %r31
cpu_intr_0_225:
	setx	0x370208, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_118:
	mov	0x2e, %r14
	.word 0xf8f38e40  ! 2937: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_rd_109:
	mov	0x25, %r14
	.word 0xfedb8e80  ! 2939: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb9e5610e  ! 2940: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbde46171  ! 2942: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7e5a009  ! 2944: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbbe46040  ! 2947: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb3e48000  ! 2948: SAVE_R	save	%r18, %r0, %r25
	.word 0xbde54000  ! 2956: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_226:
	setx	0x340036, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_227:
	setx	0x360215, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_208:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_208), 16, 16)) -> intp(0, 0, 10)
	.word 0xb3e44000  ! 2960: SAVE_R	save	%r17, %r0, %r25
T0_asi_reg_rd_110:
	mov	0x36, %r14
	.word 0xf8db8e40  ! 2961: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbde4e0d6  ! 2962: SAVE_I	save	%r19, 0x0001, %r30
iob_intr_0_209:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_209), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_rd_111:
	mov	0x8, %r14
	.word 0xf2db8e40  ! 2965: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_210:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_210), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_rd_112:
	mov	0x8, %r14
	.word 0xfcdb89e0  ! 2967: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T0_asi_reg_wr_119:
	mov	0x1a, %r14
	.word 0xf2f38400  ! 2969: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbfe521b6  ! 2970: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_211:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_211), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb9e40000  ! 2972: SAVE_R	save	%r16, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_113:
	mov	0x3c8, %r14
	.word 0xfcdb89e0  ! 2976: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbfe4e15c  ! 2977: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb1e561be  ! 2979: SAVE_I	save	%r21, 0x0001, %r24
cpu_intr_0_228:
	setx	0x340208, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_114:
	mov	0x6, %r14
	.word 0xfadb84a0  ! 2982: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbde40000  ! 2983: SAVE_R	save	%r16, %r0, %r30
	.word 0xb5e4e12e  ! 2984: SAVE_I	save	%r19, 0x0001, %r26
iob_intr_0_212:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_212), 16, 16)) -> intp(0, 0, 27)
	.word 0x8f902001  ! 2986: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xb3e420c9  ! 2988: SAVE_I	save	%r16, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_213:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_213), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb9e5e08a  ! 2994: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_wr_120:
	mov	0x3c5, %r14
	.word 0xfaf38e40  ! 3000: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_0_229:
	setx	0x370021, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_115:
	mov	0x25, %r14
	.word 0xf2db84a0  ! 3003: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_0_214:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_214), 16, 16)) -> intp(0, 0, 0)
	.word 0xb2a52113  ! 3007: SUBcc_I	subcc 	%r20, 0x0113, %r25
	.word 0xbde5e0eb  ! 3008: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb1e4602e  ! 3009: SAVE_I	save	%r17, 0x0001, %r24
cpu_intr_0_230:
	setx	0x350012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e1ad  ! 3015: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb7e50000  ! 3017: SAVE_R	save	%r20, %r0, %r27
iob_intr_0_215:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_215), 16, 16)) -> intp(0, 0, 2)
iob_intr_0_216:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_216), 16, 16)) -> intp(0, 0, 6)
cpu_intr_0_231:
	setx	0x340336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe52139  ! 3024: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_rd_116:
	mov	0x21, %r14
	.word 0xf4db8e40  ! 3029: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T0_asi_reg_rd_117:
	mov	0x17, %r14
	.word 0xf4db84a0  ! 3032: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_0_217:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_217), 16, 16)) -> intp(0, 0, 2b)
	.word 0xbeac20b1  ! 3038: ANDNcc_I	andncc 	%r16, 0x00b1, %r31
cpu_intr_0_232:
	setx	0x360209, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_121:
	mov	0x36, %r14
	.word 0xf2f38e40  ! 3041: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0x91956073  ! 3044: WRPR_PIL_I	wrpr	%r21, 0x0073, %pil
	.word 0xb3e5e1e8  ! 3048: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5641800  ! 3051: MOVcc_R	<illegal instruction>
iob_intr_0_218:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_218), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbbe54000  ! 3053: SAVE_R	save	%r21, %r0, %r29
cpu_intr_0_233:
	setx	0x37033d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_234:
	setx	0x34001c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_118:
	mov	0xa, %r14
	.word 0xf8db8e60  ! 3058: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb5e5607c  ! 3059: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe5e00a  ! 3062: SAVE_I	save	%r23, 0x0001, %r31
iob_intr_0_219:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_219), 16, 16)) -> intp(0, 0, 23)
iob_intr_0_220:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_220), 16, 16)) -> intp(0, 0, 29)
iob_intr_0_221:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_221), 16, 16)) -> intp(0, 0, 27)
iob_intr_0_222:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_222), 16, 16)) -> intp(0, 0, 9)
iob_intr_0_223:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_223), 16, 16)) -> intp(0, 0, f)
T0_asi_reg_rd_119:
	mov	0x6, %r14
	.word 0xfcdb8400  ! 3070: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_0_224:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_224), 16, 16)) -> intp(0, 0, 23)
T0_asi_reg_rd_120:
	mov	0x12, %r14
	.word 0xfcdb8400  ! 3073: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb224c000  ! 3076: SUB_R	sub 	%r19, %r0, %r25
cpu_intr_0_235:
	setx	0x370019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 3078: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_236:
	setx	0x35001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaa54000  ! 3081: SUBcc_R	subcc 	%r21, %r0, %r29
iob_intr_0_225:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_225), 16, 16)) -> intp(0, 0, 26)
cpu_intr_0_237:
	setx	0x350035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_238:
	setx	0x360011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe40000  ! 3089: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_rd_121:
	mov	0x1c, %r14
	.word 0xf8db84a0  ! 3092: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_0_239:
	setx	0x37020b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_240:
	setx	0x340334, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_226:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_226), 16, 16)) -> intp(0, 0, 29)
	.word 0xb3e52135  ! 3098: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb3e5a049  ! 3099: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb9e420b2  ! 3100: SAVE_I	save	%r16, 0x0001, %r28
cpu_intr_0_241:
	setx	0x340238, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_122:
	mov	0x3c5, %r14
	.word 0xf4db8e80  ! 3104: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T0_asi_reg_rd_123:
	mov	0x3c8, %r14
	.word 0xfcdb8e40  ! 3111: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb44420a3  ! 3113: ADDC_I	addc 	%r16, 0x00a3, %r26
	.word 0xba954000  ! 3114: ORcc_R	orcc 	%r21, %r0, %r29
iob_intr_0_227:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_227), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb1518000  ! 3123: RDPR_PSTATE	<illegal instruction>
iob_intr_0_228:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_228), 16, 16)) -> intp(0, 0, 37)
T0_asi_reg_rd_124:
	mov	0x21, %r14
	.word 0xfcdb89e0  ! 3127: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_0_229:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_229), 16, 16)) -> intp(0, 0, 3a)
	.word 0xbde5c000  ! 3134: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_242:
	setx	0x36012f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_230:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_230), 16, 16)) -> intp(0, 0, 1b)
T0_asi_reg_rd_125:
	mov	0x37, %r14
	.word 0xf8db89e0  ! 3137: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb9e421a9  ! 3138: SAVE_I	save	%r16, 0x0001, %r28
T0_asi_reg_wr_122:
	mov	0x2d, %r14
	.word 0xfcf38e60  ! 3141: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbbe5e1a2  ! 3146: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb1e40000  ! 3147: SAVE_R	save	%r16, %r0, %r24
T0_asi_reg_wr_123:
	mov	0x26, %r14
	.word 0xf4f38e40  ! 3157: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_wr_124:
	mov	0xd, %r14
	.word 0xfef38e80  ! 3159: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbde4203c  ! 3160: SAVE_I	save	%r16, 0x0001, %r30
cpu_intr_0_243:
	setx	0x350106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc1da145  ! 3162: XOR_I	xor 	%r22, 0x0145, %r30
	.word 0xb7e4e1d9  ! 3164: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde4618c  ! 3169: SAVE_I	save	%r17, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9e5e187  ! 3172: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_rd_126:
	mov	0x2e, %r14
	.word 0xf2db8e40  ! 3173: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbde561f2  ! 3178: SAVE_I	save	%r21, 0x0001, %r30
	.word 0x879560ec  ! 3180: WRPR_TT_I	wrpr	%r21, 0x00ec, %tt
iob_intr_0_231:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_231), 16, 16)) -> intp(0, 0, 12)
	.word 0xbbe5c000  ! 3183: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_244:
	setx	0x350322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_245:
	setx	0x37020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5c000  ! 3188: SAVE_R	save	%r23, %r0, %r24
cpu_intr_0_246:
	setx	0x350337, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_247:
	setx	0x360234, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_248:
	setx	0x34001d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_232:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_232), 16, 16)) -> intp(0, 0, 32)
	.word 0xbebca069  ! 3198: XNORcc_I	xnorcc 	%r18, 0x0069, %r31
iob_intr_0_233:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_233), 16, 16)) -> intp(0, 0, 2b)
iob_intr_0_234:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_234), 16, 16)) -> intp(0, 0, 30)
	.word 0xb60521eb  ! 3202: ADD_I	add 	%r20, 0x01eb, %r27
iob_intr_0_235:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_235), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb5e40000  ! 3210: SAVE_R	save	%r16, %r0, %r26
cpu_intr_0_249:
	setx	0x370325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe44000  ! 3214: SAVE_R	save	%r17, %r0, %r31
	.word 0xbbe4a0d1  ! 3217: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x839520dd  ! 3218: WRPR_TNPC_I	wrpr	%r20, 0x00dd, %tnpc
T0_asi_reg_rd_127:
	mov	0x2e, %r14
	.word 0xf0db8400  ! 3220: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb7e560c1  ! 3222: SAVE_I	save	%r21, 0x0001, %r27
iob_intr_0_236:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_236), 16, 16)) -> intp(0, 0, 12)
	.word 0xb5e5a188  ! 3224: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbcad20df  ! 3229: ANDNcc_I	andncc 	%r20, 0x00df, %r30
cpu_intr_0_250:
	setx	0x340311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe54000  ! 3232: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_237:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_237), 16, 16)) -> intp(0, 0, 1)
cpu_intr_0_251:
	setx	0x370111, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_128:
	mov	0x3c5, %r14
	.word 0xfcdb84a0  ! 3239: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_0_238:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_238), 16, 16)) -> intp(0, 0, 5)
T0_asi_reg_rd_129:
	mov	0x22, %r14
	.word 0xf2db84a0  ! 3244: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb7e44000  ! 3245: SAVE_R	save	%r17, %r0, %r27
cpu_intr_0_252:
	setx	0x34023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e0de  ! 3251: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5643801  ! 3256: MOVcc_I	<illegal instruction>
	.word 0xbbe520f0  ! 3257: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb5e5e088  ! 3259: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb7e54000  ! 3263: SAVE_R	save	%r21, %r0, %r27
iob_intr_0_239:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_239), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb3e52159  ! 3266: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb7e54000  ! 3268: SAVE_R	save	%r21, %r0, %r27
iob_intr_0_240:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_240), 16, 16)) -> intp(0, 0, 1f)
iob_intr_0_241:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_241), 16, 16)) -> intp(0, 0, 9)
	.word 0xb5e56119  ! 3276: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5e4e12a  ! 3283: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_wr_125:
	mov	0x3c2, %r14
	.word 0xf0f389e0  ! 3286: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb9e5a17a  ! 3288: SAVE_I	save	%r22, 0x0001, %r28
cpu_intr_0_253:
	setx	0x390119, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_126:
	mov	0x3c8, %r14
	.word 0xf6f384a0  ! 3291: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_0_242:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_242), 16, 16)) -> intp(0, 0, 3b)
cpu_intr_0_254:
	setx	0x380028, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_255:
	setx	0x380120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a05e  ! 3299: SAVE_I	save	%r22, 0x0001, %r26
T0_asi_reg_rd_130:
	mov	0x1d, %r14
	.word 0xf6db8e40  ! 3300: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb3e48000  ! 3301: SAVE_R	save	%r18, %r0, %r25
iob_intr_0_243:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_243), 16, 16)) -> intp(0, 0, 25)
T0_asi_reg_rd_131:
	mov	0x35, %r14
	.word 0xfadb8e40  ! 3304: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_rd_132:
	mov	0x3c8, %r14
	.word 0xfadb89e0  ! 3306: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_0_256:
	setx	0x38000a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_244:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_244), 16, 16)) -> intp(0, 0, 14)
cpu_intr_0_257:
	setx	0x3b001b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_258:
	setx	0x390213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbca5a084  ! 3318: SUBcc_I	subcc 	%r22, 0x0084, %r30
cpu_intr_0_259:
	setx	0x3a012c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_260:
	setx	0x390205, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_261:
	setx	0x380004, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_262:
	setx	0x380007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e561e6  ! 3325: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe44000  ! 3328: SAVE_R	save	%r17, %r0, %r31
	.word 0xbde44000  ! 3330: SAVE_R	save	%r17, %r0, %r30
	.word 0xb9e40000  ! 3331: SAVE_R	save	%r16, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_127:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 3338: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_263:
	setx	0x3b0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 3343: SAVE_R	save	%r23, %r0, %r27
	.word 0xbde50000  ! 3346: SAVE_R	save	%r20, %r0, %r30
cpu_intr_0_264:
	setx	0x390103, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_128:
	mov	0x3c7, %r14
	.word 0xfcf38e60  ! 3351: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb3e42119  ! 3352: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbfe58000  ! 3354: SAVE_R	save	%r22, %r0, %r31
T0_asi_reg_rd_133:
	mov	0x22, %r14
	.word 0xfadb8e80  ! 3356: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xbbe46157  ! 3360: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb1e5214a  ! 3365: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbc2d4000  ! 3366: ANDN_R	andn 	%r21, %r0, %r30
iob_intr_0_245:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_245), 16, 16)) -> intp(0, 0, 18)
cpu_intr_0_265:
	setx	0x39033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e145  ! 3369: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbde40000  ! 3371: SAVE_R	save	%r16, %r0, %r30
	.word 0xb7e58000  ! 3374: SAVE_R	save	%r22, %r0, %r27
iob_intr_0_246:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_246), 16, 16)) -> intp(0, 0, 35)
cpu_intr_0_266:
	setx	0x38013e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_267:
	setx	0x38020e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_268:
	setx	0x3a0028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8c4c000  ! 3380: ADDCcc_R	addccc 	%r19, %r0, %r28
iob_intr_0_247:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_247), 16, 16)) -> intp(0, 0, 10)
	.word 0xbcc5e12a  ! 3383: ADDCcc_I	addccc 	%r23, 0x012a, %r30
cpu_intr_0_269:
	setx	0x38011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4c000  ! 3387: SAVE_R	save	%r19, %r0, %r31
	.word 0xbeb5a096  ! 3388: ORNcc_I	orncc 	%r22, 0x0096, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe54000  ! 3393: SAVE_R	save	%r21, %r0, %r31
	.word 0xb234a098  ! 3395: ORN_I	orn 	%r18, 0x0098, %r25
	.word 0xb7e58000  ! 3396: SAVE_R	save	%r22, %r0, %r27
	.word 0xb604a0a2  ! 3398: ADD_I	add 	%r18, 0x00a2, %r27
iob_intr_0_248:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_248), 16, 16)) -> intp(0, 0, 0)
cpu_intr_0_270:
	setx	0x3a003a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_134:
	mov	0x3c6, %r14
	.word 0xfcdb8e40  ! 3406: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbfe5a0bf  ! 3408: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_249:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_249), 16, 16)) -> intp(0, 0, 31)
	.word 0xbfe4c000  ! 3410: SAVE_R	save	%r19, %r0, %r31
	.word 0xb1e40000  ! 3411: SAVE_R	save	%r16, %r0, %r24
	.word 0xb7e4218c  ! 3413: SAVE_I	save	%r16, 0x0001, %r27
cpu_intr_0_271:
	setx	0x390219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5216c  ! 3415: SAVE_I	save	%r20, 0x0001, %r27
cpu_intr_0_272:
	setx	0x3a010c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_135:
	mov	0x24, %r14
	.word 0xf4db8e40  ! 3419: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T0_asi_reg_rd_136:
	mov	0x22, %r14
	.word 0xf4db8e40  ! 3420: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_250:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_250), 16, 16)) -> intp(0, 0, 33)
T0_asi_reg_rd_137:
	mov	0x1e, %r14
	.word 0xfcdb8e60  ! 3424: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_0_251:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_251), 16, 16)) -> intp(0, 0, 18)
T0_asi_reg_rd_138:
	mov	0x32, %r14
	.word 0xf2db8e60  ! 3428: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb1e52002  ! 3429: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb3e48000  ! 3430: SAVE_R	save	%r18, %r0, %r25
	.word 0xb92de001  ! 3432: SLL_I	sll 	%r23, 0x0001, %r28
T0_asi_reg_wr_129:
	mov	0x24, %r14
	.word 0xf6f384a0  ! 3433: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T0_asi_reg_wr_130:
	mov	0x23, %r14
	.word 0xf6f38e40  ! 3434: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_wr_131:
	mov	0x27, %r14
	.word 0xfaf389e0  ! 3435: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbde5e02d  ! 3437: SAVE_I	save	%r23, 0x0001, %r30
T0_asi_reg_rd_139:
	mov	0x3c0, %r14
	.word 0xf8db84a0  ! 3438: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T0_asi_reg_rd_140:
	mov	0x3c6, %r14
	.word 0xfcdb89e0  ! 3441: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbde4a104  ! 3442: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_wr_132:
	mov	0x14, %r14
	.word 0xfaf38400  ! 3443: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb9e44000  ! 3444: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_252:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_252), 16, 16)) -> intp(0, 0, 11)
	.word 0xb1e52051  ! 3449: SAVE_I	save	%r20, 0x0001, %r24
cpu_intr_0_273:
	setx	0x3b012f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_133:
	mov	0x13, %r14
	.word 0xfcf38e40  ! 3452: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_wr_134:
	mov	0x15, %r14
	.word 0xf2f38400  ! 3454: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb9e52115  ! 3455: SAVE_I	save	%r20, 0x0001, %r28
T0_asi_reg_wr_135:
	mov	0x3c5, %r14
	.word 0xfcf38e40  ! 3460: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb1e4618b  ! 3464: SAVE_I	save	%r17, 0x0001, %r24
iob_intr_0_253:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_253), 16, 16)) -> intp(0, 0, c)
cpu_intr_0_274:
	setx	0x38011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b5201b  ! 3470: ORNcc_I	orncc 	%r20, 0x001b, %r25
	.word 0xb1e5a131  ! 3473: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_rd_141:
	mov	0x27, %r14
	.word 0xf4db8400  ! 3474: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xbe3d611d  ! 3476: XNOR_I	xnor 	%r21, 0x011d, %r31
T0_asi_reg_rd_142:
	mov	0x23, %r14
	.word 0xf6db89e0  ! 3479: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_0_275:
	setx	0x3a0307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a0ad  ! 3481: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_254:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_254), 16, 16)) -> intp(0, 0, 13)
	.word 0x8795a1da  ! 3490: WRPR_TT_I	wrpr	%r22, 0x01da, %tt
	.word 0xb1e40000  ! 3492: SAVE_R	save	%r16, %r0, %r24
	.word 0xbde4e0a9  ! 3493: SAVE_I	save	%r19, 0x0001, %r30
iob_intr_0_255:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_255), 16, 16)) -> intp(0, 0, 2b)
	.word 0xbbe5c000  ! 3496: SAVE_R	save	%r23, %r0, %r29
	.word 0x8395a00f  ! 3500: WRPR_TNPC_I	wrpr	%r22, 0x000f, %tnpc
	.word 0xb5e50000  ! 3504: SAVE_R	save	%r20, %r0, %r26
	.word 0xb1e56067  ! 3505: SAVE_I	save	%r21, 0x0001, %r24
T0_asi_reg_wr_136:
	mov	0x6, %r14
	.word 0xf0f38e60  ! 3506: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xbbe5e1cd  ! 3510: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb7e5a14f  ! 3513: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9e48000  ! 3514: SAVE_R	save	%r18, %r0, %r28
	.word 0xb9e5a055  ! 3515: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb03d0000  ! 3516: XNOR_R	xnor 	%r20, %r0, %r24
cpu_intr_0_276:
	setx	0x3a023e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_137:
	mov	0xb, %r14
	.word 0xf6f389e0  ! 3520: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb9342001  ! 3522: SRL_I	srl 	%r16, 0x0001, %r28
T0_asi_reg_rd_143:
	mov	0x1f, %r14
	.word 0xf2db8e40  ! 3523: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T0_asi_reg_wr_138:
	mov	0xa, %r14
	.word 0xf2f38400  ! 3525: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T0_asi_reg_rd_144:
	mov	0x3c8, %r14
	.word 0xf8db8e60  ! 3526: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T0_asi_reg_wr_139:
	mov	0x1, %r14
	.word 0xfcf38400  ! 3529: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb5e4c000  ! 3532: SAVE_R	save	%r19, %r0, %r26
cpu_intr_0_277:
	setx	0x3b0216, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_140:
	mov	0x33, %r14
	.word 0xf4f38e40  ! 3535: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_0_256:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_256), 16, 16)) -> intp(0, 0, 3c)
iob_intr_0_257:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_257), 16, 16)) -> intp(0, 0, 17)
	.word 0xbbe54000  ! 3548: SAVE_R	save	%r21, %r0, %r29
	.word 0xb7e4a153  ! 3550: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_wr_141:
	mov	0x3c8, %r14
	.word 0xf2f38e60  ! 3557: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb3e52044  ! 3560: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbe45c000  ! 3563: ADDC_R	addc 	%r23, %r0, %r31
	.word 0xb3e5601f  ! 3564: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb5e44000  ! 3567: SAVE_R	save	%r17, %r0, %r26
cpu_intr_0_278:
	setx	0x390134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e460c3  ! 3571: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7e58000  ! 3573: SAVE_R	save	%r22, %r0, %r27
iob_intr_0_258:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_258), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_wr_142:
	mov	0x9, %r14
	.word 0xfef389e0  ! 3578: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_0_279:
	setx	0x390301, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_280:
	setx	0x3b0026, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_281:
	setx	0x3a0123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a10f  ! 3585: SAVE_I	save	%r18, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde58000  ! 3593: SAVE_R	save	%r22, %r0, %r30
	.word 0xb12c7001  ! 3594: SLLX_I	sllx	%r17, 0x0001, %r24
T0_asi_reg_rd_145:
	mov	0xc, %r14
	.word 0xf6db8400  ! 3597: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T0_asi_reg_wr_143:
	mov	0x3c6, %r14
	.word 0xf8f38e40  ! 3600: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb5e5c000  ! 3602: SAVE_R	save	%r23, %r0, %r26
cpu_intr_0_282:
	setx	0x3b0211, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_283:
	setx	0x3a0032, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_146:
	mov	0x1f, %r14
	.word 0xfadb8e60  ! 3608: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb7e56039  ! 3609: SAVE_I	save	%r21, 0x0001, %r27
iob_intr_0_259:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_259), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb5e420a7  ! 3611: SAVE_I	save	%r16, 0x0001, %r26
T0_asi_reg_rd_147:
	mov	0x2b, %r14
	.word 0xf8db8400  ! 3612: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbde5a0a9  ! 3614: SAVE_I	save	%r22, 0x0001, %r30
cpu_intr_0_284:
	setx	0x390330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e40000  ! 3616: SAVE_R	save	%r16, %r0, %r26
	.word 0xbde56031  ! 3618: SAVE_I	save	%r21, 0x0001, %r30
T0_asi_reg_rd_148:
	mov	0x35, %r14
	.word 0xfadb89e0  ! 3620: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb1e421d0  ! 3625: SAVE_I	save	%r16, 0x0001, %r24
cpu_intr_0_285:
	setx	0x390335, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_144:
	mov	0x3c1, %r14
	.word 0xf8f38400  ! 3629: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb7e4a09d  ! 3630: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb2ace1e0  ! 3631: ANDNcc_I	andncc 	%r19, 0x01e0, %r25
	.word 0xbde48000  ! 3632: SAVE_R	save	%r18, %r0, %r30
iob_intr_0_260:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_260), 16, 16)) -> intp(0, 0, 37)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_rd_149:
	mov	0x6, %r14
	.word 0xfedb8e60  ! 3636: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_0_286:
	setx	0x390234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe520fe  ! 3639: SAVE_I	save	%r20, 0x0001, %r31
cpu_intr_0_287:
	setx	0x38000d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_288:
	setx	0x3a0235, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_150:
	mov	0x2c, %r14
	.word 0xfcdb8e60  ! 3645: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb7e50000  ! 3647: SAVE_R	save	%r20, %r0, %r27
T0_asi_reg_rd_151:
	mov	0x3c6, %r14
	.word 0xf2db84a0  ! 3649: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb3e5200e  ! 3652: SAVE_I	save	%r20, 0x0001, %r25
cpu_intr_0_289:
	setx	0x39001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb00ce029  ! 3656: AND_I	and 	%r19, 0x0029, %r24
T0_asi_reg_wr_145:
	mov	0x3c5, %r14
	.word 0xf2f389e0  ! 3661: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T0_asi_reg_wr_146:
	mov	0x13, %r14
	.word 0xf8f384a0  ! 3669: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbbe42192  ! 3672: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbbe560a9  ! 3674: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb9e4209e  ! 3675: SAVE_I	save	%r16, 0x0001, %r28
T0_asi_reg_wr_147:
	mov	0x1b, %r14
	.word 0xfaf38e40  ! 3676: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_0_290:
	setx	0x3b0338, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_148:
	mov	0x3, %r14
	.word 0xf6f384a0  ! 3679: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_0_261:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_261), 16, 16)) -> intp(0, 0, 6)
	.word 0xbbe421e6  ! 3681: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb3e58000  ! 3684: SAVE_R	save	%r22, %r0, %r25
iob_intr_0_262:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_262), 16, 16)) -> intp(0, 0, 13)
	.word 0xb7e4a139  ! 3686: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_wr_149:
	mov	0x20, %r14
	.word 0xf4f389e0  ! 3689: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_152:
	mov	0x2c, %r14
	.word 0xf2db8400  ! 3696: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_0_263:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_263), 16, 16)) -> intp(0, 0, 12)
T0_asi_reg_rd_153:
	mov	0x37, %r14
	.word 0xfcdb8e60  ! 3701: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb5e54000  ! 3702: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_wr_150:
	mov	0x27, %r14
	.word 0xfef38e40  ! 3703: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbde5a1c9  ! 3705: SAVE_I	save	%r22, 0x0001, %r30
iob_intr_0_264:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_264), 16, 16)) -> intp(0, 0, 29)
T0_asi_reg_rd_154:
	mov	0x6, %r14
	.word 0xfcdb84a0  ! 3712: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbbe520ef  ! 3713: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb5e58000  ! 3718: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_wr_151:
	mov	0x19, %r14
	.word 0xfef38400  ! 3720: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T0_asi_reg_rd_155:
	mov	0x3c2, %r14
	.word 0xfedb8e60  ! 3722: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_0_265:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_265), 16, 16)) -> intp(0, 0, 29)
	.word 0xb9e50000  ! 3729: SAVE_R	save	%r20, %r0, %r28
	.word 0xb53d3001  ! 3732: SRAX_I	srax	%r20, 0x0001, %r26
cpu_intr_0_291:
	setx	0x3c0117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde48000  ! 3735: SAVE_R	save	%r18, %r0, %r30
cpu_intr_0_292:
	setx	0x3e0101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e520f2  ! 3741: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb5e4a173  ! 3742: SAVE_I	save	%r18, 0x0001, %r26
iob_intr_0_266:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_266), 16, 16)) -> intp(0, 0, 35)
	.word 0xb5e4c000  ! 3744: SAVE_R	save	%r19, %r0, %r26
cpu_intr_0_293:
	setx	0x3e020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5c000  ! 3748: SAVE_R	save	%r23, %r0, %r25
	.word 0xb7e4219a  ! 3749: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb82561a4  ! 3751: SUB_I	sub 	%r21, 0x01a4, %r28
	.word 0xb09c209c  ! 3752: XORcc_I	xorcc 	%r16, 0x009c, %r24
T0_asi_reg_rd_156:
	mov	0x3c1, %r14
	.word 0xfcdb89e0  ! 3753: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb3e48000  ! 3754: SAVE_R	save	%r18, %r0, %r25
	.word 0xb7e50000  ! 3755: SAVE_R	save	%r20, %r0, %r27
cpu_intr_0_294:
	setx	0x3c002f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_152:
	mov	0x2d, %r14
	.word 0xf8f38400  ! 3757: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_0_267:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_267), 16, 16)) -> intp(0, 0, 26)
iob_intr_0_268:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_268), 16, 16)) -> intp(0, 0, 15)
	.word 0xbde4a014  ! 3764: SAVE_I	save	%r18, 0x0001, %r30
iob_intr_0_269:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_269), 16, 16)) -> intp(0, 0, 4)
	.word 0xb495c000  ! 3767: ORcc_R	orcc 	%r23, %r0, %r26
	.word 0xb72d8000  ! 3768: SLL_R	sll 	%r22, %r0, %r27
cpu_intr_0_295:
	setx	0x3c0324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8f902000  ! 3771: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xb7e521ce  ! 3775: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e54000  ! 3778: SAVE_R	save	%r21, %r0, %r24
	.word 0xb3e56111  ! 3780: SAVE_I	save	%r21, 0x0001, %r25
cpu_intr_0_296:
	setx	0x3d0130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6ac4000  ! 3784: ANDNcc_R	andncc 	%r17, %r0, %r27
T0_asi_reg_rd_157:
	mov	0x2f, %r14
	.word 0xf0db8e40  ! 3785: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_270:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_270), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb9e5613c  ! 3787: SAVE_I	save	%r21, 0x0001, %r28
iob_intr_0_271:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_271), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbbe5c000  ! 3790: SAVE_R	save	%r23, %r0, %r29
	.word 0xbfe48000  ! 3791: SAVE_R	save	%r18, %r0, %r31
	.word 0xbe85e00d  ! 3793: ADDcc_I	addcc 	%r23, 0x000d, %r31
T0_asi_reg_rd_158:
	mov	0x20, %r14
	.word 0xf6db8e40  ! 3794: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb8b52047  ! 3799: ORNcc_I	orncc 	%r20, 0x0047, %r28
iob_intr_0_272:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_272), 16, 16)) -> intp(0, 0, c)
	.word 0xb3e54000  ! 3802: SAVE_R	save	%r21, %r0, %r25
cpu_intr_0_297:
	setx	0x3e0105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4602a  ! 3805: SAVE_I	save	%r17, 0x0001, %r24
cpu_intr_0_298:
	setx	0x3c013a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_299:
	setx	0x3f0218, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_159:
	mov	0x10, %r14
	.word 0xfadb8400  ! 3810: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T0_asi_reg_rd_160:
	mov	0xa, %r14
	.word 0xfedb8e80  ! 3811: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_0_273:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_273), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb7e5600d  ! 3814: SAVE_I	save	%r21, 0x0001, %r27
cpu_intr_0_300:
	setx	0x3f0301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e0b0  ! 3819: SAVE_I	save	%r23, 0x0001, %r25
iob_intr_0_274:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_274), 16, 16)) -> intp(0, 0, 31)
	.word 0xb9e560cc  ! 3821: SAVE_I	save	%r21, 0x0001, %r28
T0_asi_reg_wr_153:
	mov	0x27, %r14
	.word 0xf0f38400  ! 3822: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xba454000  ! 3823: ADDC_R	addc 	%r21, %r0, %r29
	.word 0xb3e48000  ! 3825: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_rd_161:
	mov	0x3c8, %r14
	.word 0xfadb8e40  ! 3826: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbbe4c000  ! 3827: SAVE_R	save	%r19, %r0, %r29
	.word 0xbfe48000  ! 3828: SAVE_R	save	%r18, %r0, %r31
	.word 0xb235c000  ! 3833: SUBC_R	orn 	%r23, %r0, %r25
	.word 0xb9e50000  ! 3834: SAVE_R	save	%r20, %r0, %r28
T0_asi_reg_rd_162:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 3835: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_301:
	setx	0x3f0100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e108  ! 3838: SAVE_I	save	%r23, 0x0001, %r27
iob_intr_0_275:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_275), 16, 16)) -> intp(0, 0, d)
	.word 0xb9e5c000  ! 3842: SAVE_R	save	%r23, %r0, %r28
T0_asi_reg_rd_163:
	mov	0x3c0, %r14
	.word 0xf2db8e60  ! 3844: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_0_302:
	setx	0x3e031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_276:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_276), 16, 16)) -> intp(0, 0, 17)
	.word 0xb7e4c000  ! 3854: SAVE_R	save	%r19, %r0, %r27
iob_intr_0_277:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_277), 16, 16)) -> intp(0, 0, f)
T0_asi_reg_wr_154:
	mov	0x3, %r14
	.word 0xf0f389e0  ! 3857: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb3e42182  ! 3862: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbbe560d7  ! 3864: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb13de001  ! 3866: SRA_I	sra 	%r23, 0x0001, %r24
	.word 0xb7e4c000  ! 3867: SAVE_R	save	%r19, %r0, %r27
	.word 0xb1e4e06e  ! 3869: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb9e40000  ! 3870: SAVE_R	save	%r16, %r0, %r28
	.word 0xbf353001  ! 3871: SRLX_I	srlx	%r20, 0x0001, %r31
T0_asi_reg_rd_164:
	mov	0x35, %r14
	.word 0xf8db89e0  ! 3874: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb3e5e175  ! 3879: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb3e40000  ! 3880: SAVE_R	save	%r16, %r0, %r25
iob_intr_0_278:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_278), 16, 16)) -> intp(0, 0, 18)
T0_asi_reg_wr_155:
	mov	0x3c1, %r14
	.word 0xfaf38e80  ! 3884: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T0_asi_reg_wr_156:
	mov	0x3c5, %r14
	.word 0xf8f38400  ! 3885: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T0_asi_reg_rd_165:
	mov	0x10, %r14
	.word 0xfadb8e60  ! 3888: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_0_303:
	setx	0x3d002e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_157:
	mov	0x17, %r14
	.word 0xf2f38e60  ! 3896: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_0_304:
	setx	0x3e020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba9da1b6  ! 3903: XORcc_I	xorcc 	%r22, 0x01b6, %r29
	.word 0xb5e48000  ! 3904: SAVE_R	save	%r18, %r0, %r26
T0_asi_reg_wr_158:
	mov	0x26, %r14
	.word 0xf0f389e0  ! 3906: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_0_279:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_279), 16, 16)) -> intp(0, 0, 2a)
iob_intr_0_280:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_280), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb0a48000  ! 3915: SUBcc_R	subcc 	%r18, %r0, %r24
	.word 0xb9e561f1  ! 3917: SAVE_I	save	%r21, 0x0001, %r28
cpu_intr_0_305:
	setx	0x3f0213, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_159:
	mov	0x3c7, %r14
	.word 0xfaf389e0  ! 3920: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb13df001  ! 3921: SRAX_I	srax	%r23, 0x0001, %r24
	.word 0xb7e58000  ! 3924: SAVE_R	save	%r22, %r0, %r27
	.word 0xb8148000  ! 3925: OR_R	or 	%r18, %r0, %r28
cpu_intr_0_306:
	setx	0x3e031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e421e6  ! 3929: SAVE_I	save	%r16, 0x0001, %r27
iob_intr_0_281:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_281), 16, 16)) -> intp(0, 0, e)
	.word 0xb6a4c000  ! 3933: SUBcc_R	subcc 	%r19, %r0, %r27
T0_asi_reg_rd_166:
	mov	0x3c2, %r14
	.word 0xf4db8400  ! 3935: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T0_asi_reg_wr_160:
	mov	0x26, %r14
	.word 0xfcf389e0  ! 3938: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_0_282:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_282), 16, 16)) -> intp(0, 0, 35)
	.word 0xbd7d4400  ! 3941: MOVR_R	movre	%r21, %r0, %r30
cpu_intr_0_307:
	setx	0x3c030d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_308:
	setx	0x3e023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e18a  ! 3944: SAVE_I	save	%r23, 0x0001, %r26
cpu_intr_0_309:
	setx	0x3d011c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_283:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_283), 16, 16)) -> intp(0, 0, 29)
T0_asi_reg_rd_167:
	mov	0xe, %r14
	.word 0xfadb8e60  ! 3951: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb3e40000  ! 3952: SAVE_R	save	%r16, %r0, %r25
cpu_intr_0_310:
	setx	0x3f0317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e067  ! 3956: SAVE_I	save	%r19, 0x0001, %r26
iob_intr_0_284:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_284), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb3e4c000  ! 3959: SAVE_R	save	%r19, %r0, %r25
iob_intr_0_285:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_285), 16, 16)) -> intp(0, 0, 22)
	.word 0xb3e4e0d4  ! 3961: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_286:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_286), 16, 16)) -> intp(0, 0, 9)
cpu_intr_0_311:
	setx	0x3e0000, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_168:
	mov	0x2b, %r14
	.word 0xf4db8e40  ! 3968: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_287:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_287), 16, 16)) -> intp(0, 0, 31)
	.word 0xb3e54000  ! 3971: SAVE_R	save	%r21, %r0, %r25
	.word 0xb3e54000  ! 3973: SAVE_R	save	%r21, %r0, %r25
T0_asi_reg_wr_161:
	mov	0x3c5, %r14
	.word 0xf4f384a0  ! 3976: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb7e5c000  ! 3977: SAVE_R	save	%r23, %r0, %r27
T0_asi_reg_wr_162:
	mov	0x3c4, %r14
	.word 0xf8f38e80  ! 3981: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_0_312:
	setx	0x3f0011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e03c  ! 3986: SAVE_I	save	%r19, 0x0001, %r31
cpu_intr_0_313:
	setx	0x3f010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e124  ! 3988: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb9e50000  ! 3989: SAVE_R	save	%r20, %r0, %r28
iob_intr_0_288:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_288), 16, 16)) -> intp(0, 0, 28)
T0_asi_reg_wr_163:
	mov	0x8, %r14
	.word 0xfaf38e40  ! 3992: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_289:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_289), 16, 16)) -> intp(0, 0, 3)
	.word 0xb9e5e04c  ! 3994: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb1641800  ! 3996: MOVcc_R	<illegal instruction>
T0_asi_reg_rd_169:
	mov	0x36, %r14
	.word 0xf2db84a0  ! 3997: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_314:
	setx	0x3e032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc454000  ! 4004: ADDC_R	addc 	%r21, %r0, %r30
	.word 0xb3e5c000  ! 4007: SAVE_R	save	%r23, %r0, %r25
iob_intr_0_290:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_290), 16, 16)) -> intp(0, 0, 2b)
cpu_intr_0_315:
	setx	0x3c0101, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_316:
	setx	0x3d0015, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_317:
	setx	0x3d0334, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_164:
	mov	0x20, %r14
	.word 0xfcf38e40  ! 4020: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_318:
	setx	0x3c022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e085  ! 4023: SAVE_I	save	%r19, 0x0001, %r30
iob_intr_0_291:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_291), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_292:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_292), 16, 16)) -> intp(0, 0, 22)
	.word 0xb9e4e19a  ! 4033: SAVE_I	save	%r19, 0x0001, %r28
cpu_intr_0_319:
	setx	0x3c0232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcb50000  ! 4037: ORNcc_R	orncc 	%r20, %r0, %r30
T0_asi_reg_wr_165:
	mov	0x1f, %r14
	.word 0xf8f384a0  ! 4038: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb3e4205b  ! 4041: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb9e46003  ! 4044: SAVE_I	save	%r17, 0x0001, %r28
cpu_intr_0_320:
	setx	0x3f010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e16c  ! 4047: SAVE_I	save	%r23, 0x0001, %r28
cpu_intr_0_321:
	setx	0x3c0035, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e5e01e  ! 4052: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbde5610f  ! 4053: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbfe520f5  ! 4054: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_293:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_293), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbfe50000  ! 4057: SAVE_R	save	%r20, %r0, %r31
	.word 0xb3e40000  ! 4058: SAVE_R	save	%r16, %r0, %r25
	.word 0xbfe50000  ! 4062: SAVE_R	save	%r20, %r0, %r31
	.word 0xb5e58000  ! 4064: SAVE_R	save	%r22, %r0, %r26
iob_intr_0_294:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_294), 16, 16)) -> intp(0, 0, 2a)
cpu_intr_0_322:
	setx	0x3c0130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e42091  ! 4073: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb5e44000  ! 4074: SAVE_R	save	%r17, %r0, %r26
	.word 0xb9e5c000  ! 4075: SAVE_R	save	%r23, %r0, %r28
cpu_intr_0_323:
	setx	0x3e002a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_166:
	mov	0x2a, %r14
	.word 0xf2f38e40  ! 4079: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_0_324:
	setx	0x3f0331, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_167:
	mov	0x25, %r14
	.word 0xfcf384a0  ! 4084: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbfe4601a  ! 4085: SAVE_I	save	%r17, 0x0001, %r31
iob_intr_0_295:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_295), 16, 16)) -> intp(0, 0, 23)
	.word 0xbde5e06a  ! 4090: SAVE_I	save	%r23, 0x0001, %r30
T0_asi_reg_wr_168:
	mov	0x2a, %r14
	.word 0xfaf38e60  ! 4095: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_0_296:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_296), 16, 16)) -> intp(0, 0, 22)
cpu_intr_0_325:
	setx	0x3f0239, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_297:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_297), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_rd_170:
	mov	0x3c0, %r14
	.word 0xf2db8e60  ! 4100: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb83dc000  ! 4105: XNOR_R	xnor 	%r23, %r0, %r28
T0_asi_reg_wr_169:
	mov	0x3c3, %r14
	.word 0xfaf38e40  ! 4108: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_rd_171:
	mov	0x34, %r14
	.word 0xf6db8e40  ! 4114: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbde521b4  ! 4116: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb135d000  ! 4122: SRLX_R	srlx	%r23, %r0, %r24
iob_intr_0_298:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_298), 16, 16)) -> intp(0, 0, 9)
	.word 0xb844a1d6  ! 4129: ADDC_I	addc 	%r18, 0x01d6, %r28
	.word 0xb1e50000  ! 4133: SAVE_R	save	%r20, %r0, %r24
T0_asi_reg_wr_170:
	mov	0x11, %r14
	.word 0xf0f38e40  ! 4134: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_rd_172:
	mov	0x3c7, %r14
	.word 0xf2db89e0  ! 4136: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_0_299:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_299), 16, 16)) -> intp(0, 0, d)
	.word 0xbbe40000  ! 4141: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_rd_173:
	mov	0x17, %r14
	.word 0xf0db89e0  ! 4142: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T0_asi_reg_wr_171:
	mov	0x18, %r14
	.word 0xf6f384a0  ! 4145: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xbcb40000  ! 4151: ORNcc_R	orncc 	%r16, %r0, %r30
T0_asi_reg_wr_172:
	mov	0x3c4, %r14
	.word 0xfef38e40  ! 4153: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_rd_174:
	mov	0x3c3, %r14
	.word 0xf2db8e40  ! 4154: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb4c40000  ! 4156: ADDCcc_R	addccc 	%r16, %r0, %r26
T0_asi_reg_rd_175:
	mov	0x4, %r14
	.word 0xfedb8e60  ! 4159: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb9e56146  ! 4160: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb1e4e011  ! 4164: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_wr_173:
	mov	0x1a, %r14
	.word 0xf0f384a0  ! 4165: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbbe42167  ! 4166: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb3348000  ! 4167: SRL_R	srl 	%r18, %r0, %r25
iob_intr_0_300:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_300), 16, 16)) -> intp(0, 0, 3)
cpu_intr_0_326:
	setx	0x420021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4c000  ! 4172: SAVE_R	save	%r19, %r0, %r31
	.word 0xb7e5a1bb  ! 4176: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbfe4a182  ! 4177: SAVE_I	save	%r18, 0x0001, %r31
iob_intr_0_301:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_301), 16, 16)) -> intp(0, 0, 2)
cpu_intr_0_327:
	setx	0x420105, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_176:
	mov	0x3c3, %r14
	.word 0xf6db8e40  ! 4180: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbfe5a14d  ! 4182: SAVE_I	save	%r22, 0x0001, %r31
T0_asi_reg_wr_174:
	mov	0x3, %r14
	.word 0xf6f38400  ! 4183: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e54000  ! 4186: SAVE_R	save	%r21, %r0, %r28
cpu_intr_0_328:
	setx	0x410323, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_302:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_302), 16, 16)) -> intp(0, 0, 3f)
	.word 0xbde58000  ! 4191: SAVE_R	save	%r22, %r0, %r30
	.word 0xbbe4a082  ! 4196: SAVE_I	save	%r18, 0x0001, %r29
cpu_intr_0_329:
	setx	0x420204, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_175:
	mov	0x12, %r14
	.word 0xf2f38e40  ! 4199: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_303:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_303), 16, 16)) -> intp(0, 0, 3c)
cpu_intr_0_330:
	setx	0x410338, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_177:
	mov	0x24, %r14
	.word 0xf8db8e60  ! 4202: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xbbe4e0de  ! 4205: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_rd_178:
	mov	0x35, %r14
	.word 0xfcdb8e60  ! 4212: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb43d4000  ! 4213: XNOR_R	xnor 	%r21, %r0, %r26
	.word 0xb7e46149  ! 4215: SAVE_I	save	%r17, 0x0001, %r27
T0_asi_reg_wr_176:
	mov	0x24, %r14
	.word 0xf2f38400  ! 4218: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbfe5c000  ! 4220: SAVE_R	save	%r23, %r0, %r31
T0_asi_reg_wr_177:
	mov	0x3c1, %r14
	.word 0xf8f384a0  ! 4223: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb2c44000  ! 4230: ADDCcc_R	addccc 	%r17, %r0, %r25
iob_intr_0_304:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_304), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb1e4c000  ! 4233: SAVE_R	save	%r19, %r0, %r24
T0_asi_reg_wr_178:
	mov	0x3c5, %r14
	.word 0xf0f38e80  ! 4235: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb9e44000  ! 4236: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_rd_179:
	mov	0x20, %r14
	.word 0xf8db8e80  ! 4247: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbfe4e0ce  ! 4248: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbb2c2001  ! 4253: SLL_I	sll 	%r16, 0x0001, %r29
	.word 0xb4b4c000  ! 4259: SUBCcc_R	orncc 	%r19, %r0, %r26
iob_intr_0_305:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_305), 16, 16)) -> intp(0, 0, 31)
	.word 0xbbe5a00f  ! 4262: SAVE_I	save	%r22, 0x0001, %r29
cpu_intr_0_331:
	setx	0x42000a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_180:
	mov	0x3c8, %r14
	.word 0xf4db8e60  ! 4267: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_0_306:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_306), 16, 16)) -> intp(0, 0, 19)
	.word 0xb3e48000  ! 4269: SAVE_R	save	%r18, %r0, %r25
	.word 0xbde46096  ! 4270: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb9e54000  ! 4271: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_rd_181:
	mov	0xc, %r14
	.word 0xf8db8400  ! 4272: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb3e5a15b  ! 4273: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_332:
	setx	0x430115, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_307:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_307), 16, 16)) -> intp(0, 0, 24)
iob_intr_0_308:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_308), 16, 16)) -> intp(0, 0, 16)
T0_asi_reg_wr_179:
	mov	0x14, %r14
	.word 0xf8f38e40  ! 4279: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_309:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_309), 16, 16)) -> intp(0, 0, 28)
	.word 0xbfe520e0  ! 4281: SAVE_I	save	%r20, 0x0001, %r31
cpu_intr_0_333:
	setx	0x400022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e46147  ! 4285: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb5e54000  ! 4286: SAVE_R	save	%r21, %r0, %r26
iob_intr_0_310:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_310), 16, 16)) -> intp(0, 0, 19)
	.word 0xb9e460cb  ! 4288: SAVE_I	save	%r17, 0x0001, %r28
cpu_intr_0_334:
	setx	0x430231, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_182:
	mov	0xf, %r14
	.word 0xf2db8400  ! 4294: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xbde521dd  ! 4296: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb2858000  ! 4298: ADDcc_R	addcc 	%r22, %r0, %r25
cpu_intr_0_335:
	setx	0x400003, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_311:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_311), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_rd_183:
	mov	0x13, %r14
	.word 0xf4db89e0  ! 4303: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb8b40000  ! 4305: SUBCcc_R	orncc 	%r16, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde4a0af  ! 4312: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_rd_184:
	mov	0x2f, %r14
	.word 0xf0db8e60  ! 4314: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb7e5a0ba  ! 4317: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9e40000  ! 4319: SAVE_R	save	%r16, %r0, %r28
	.word 0xbfe461e2  ! 4320: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb9e58000  ! 4324: SAVE_R	save	%r22, %r0, %r28
	.word 0xbfe40000  ! 4326: SAVE_R	save	%r16, %r0, %r31
	.word 0xbe44e17c  ! 4327: ADDC_I	addc 	%r19, 0x017c, %r31
T0_asi_reg_wr_180:
	mov	0x3c1, %r14
	.word 0xf0f38400  ! 4332: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbbe50000  ! 4334: SAVE_R	save	%r20, %r0, %r29
cpu_intr_0_336:
	setx	0x42030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb82dc000  ! 4337: ANDN_R	andn 	%r23, %r0, %r28
T0_asi_reg_wr_181:
	mov	0x28, %r14
	.word 0xf8f389e0  ! 4338: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T0_asi_reg_wr_182:
	mov	0x3c6, %r14
	.word 0xfcf38e60  ! 4339: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_0_312:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_312), 16, 16)) -> intp(0, 0, 15)
iob_intr_0_313:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_313), 16, 16)) -> intp(0, 0, 4)
iob_intr_0_314:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_314), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb9e54000  ! 4345: SAVE_R	save	%r21, %r0, %r28
cpu_intr_0_337:
	setx	0x410318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4c000  ! 4347: SAVE_R	save	%r19, %r0, %r24
iob_intr_0_315:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_315), 16, 16)) -> intp(0, 0, e)
cpu_intr_0_338:
	setx	0x420009, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_316:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_316), 16, 16)) -> intp(0, 0, 0)
	.word 0xb1e561f7  ! 4356: SAVE_I	save	%r21, 0x0001, %r24
cpu_intr_0_339:
	setx	0x400314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a181  ! 4361: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb5e44000  ! 4367: SAVE_R	save	%r17, %r0, %r26
iob_intr_0_317:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_317), 16, 16)) -> intp(0, 0, 38)
	.word 0xb53de001  ! 4369: SRA_I	sra 	%r23, 0x0001, %r26
	.word 0xbfe4c000  ! 4372: SAVE_R	save	%r19, %r0, %r31
iob_intr_0_318:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_318), 16, 16)) -> intp(0, 0, 1)
	.word 0xb5e4e077  ! 4374: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e52174  ! 4375: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e48000  ! 4376: SAVE_R	save	%r18, %r0, %r24
cpu_intr_0_340:
	setx	0x400124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb335f001  ! 4381: SRLX_I	srlx	%r23, 0x0001, %r25
	.word 0xbbe5a17b  ! 4382: SAVE_I	save	%r22, 0x0001, %r29
T0_asi_reg_wr_183:
	mov	0x24, %r14
	.word 0xf2f384a0  ! 4383: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_0_319:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_319), 16, 16)) -> intp(0, 0, 3b)
T0_asi_reg_rd_185:
	mov	0x8, %r14
	.word 0xf4db8400  ! 4386: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xbde4c000  ! 4390: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_341:
	setx	0x41022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e090  ! 4395: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb5e5a0d5  ! 4396: SAVE_I	save	%r22, 0x0001, %r26
T0_asi_reg_wr_184:
	mov	0x2, %r14
	.word 0xf8f38e80  ! 4397: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb9e42173  ! 4398: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9e44000  ! 4399: SAVE_R	save	%r17, %r0, %r28
	.word 0xb32cd000  ! 4400: SLLX_R	sllx	%r19, %r0, %r25
	.word 0xbde5e158  ! 4402: SAVE_I	save	%r23, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_320:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_320), 16, 16)) -> intp(0, 0, 20)
	.word 0xbbe5200e  ! 4410: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb0ad8000  ! 4412: ANDNcc_R	andncc 	%r22, %r0, %r24
T0_asi_reg_rd_186:
	mov	0x3c4, %r14
	.word 0xfcdb89e0  ! 4413: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T0_asi_reg_rd_187:
	mov	0x1a, %r14
	.word 0xfcdb89e0  ! 4414: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_0_342:
	setx	0x430133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e44000  ! 4417: SAVE_R	save	%r17, %r0, %r27
	.word 0xb7e44000  ! 4419: SAVE_R	save	%r17, %r0, %r27
cpu_intr_0_343:
	setx	0x430202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb52de001  ! 4426: SLL_I	sll 	%r23, 0x0001, %r26
T0_asi_reg_wr_185:
	mov	0x3c0, %r14
	.word 0xf6f38e60  ! 4429: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_344:
	setx	0x400324, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_345:
	setx	0x43013f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_346:
	setx	0x400209, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_347:
	setx	0x17, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e54000  ! 4444: SAVE_R	save	%r21, %r0, %r26
iob_intr_0_321:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_321), 16, 16)) -> intp(0, 0, 9)
cpu_intr_0_348:
	setx	0x420130, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_188:
	mov	0xb, %r14
	.word 0xf2db8e60  ! 4448: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_0_322:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_322), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb3e5e159  ! 4451: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbfe44000  ! 4452: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_323:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_323), 16, 16)) -> intp(0, 0, 9)
	.word 0xbbe5c000  ! 4454: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_349:
	setx	0x400100, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_324:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_324), 16, 16)) -> intp(0, 0, 39)
	.word 0xb205601d  ! 4458: ADD_I	add 	%r21, 0x001d, %r25
T0_asi_reg_rd_189:
	mov	0x1, %r14
	.word 0xf8db8e40  ! 4463: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbbe54000  ! 4468: SAVE_R	save	%r21, %r0, %r29
cpu_intr_0_350:
	setx	0x43030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e181  ! 4470: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbbe54000  ! 4471: SAVE_R	save	%r21, %r0, %r29
	.word 0xb3e4e15e  ! 4472: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_325:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_325), 16, 16)) -> intp(0, 0, c)
T0_asi_reg_rd_190:
	mov	0x1c, %r14
	.word 0xf0db8400  ! 4479: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_0_326:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_326), 16, 16)) -> intp(0, 0, 36)
	.word 0xbde5e180  ! 4483: SAVE_I	save	%r23, 0x0001, %r30
T0_asi_reg_rd_191:
	mov	0x3c1, %r14
	.word 0xfedb8400  ! 4486: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb3e520d8  ! 4487: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_wr_186:
	mov	0xd, %r14
	.word 0xf8f38e60  ! 4488: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb5e40000  ! 4493: SAVE_R	save	%r16, %r0, %r26
cpu_intr_0_351:
	setx	0x410238, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_192:
	mov	0x3c8, %r14
	.word 0xf0db89e0  ! 4498: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb1e40000  ! 4500: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_327:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_327), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbfe5a0d3  ! 4503: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_328:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_328), 16, 16)) -> intp(0, 0, 26)
	.word 0xb3e5a1de  ! 4506: SAVE_I	save	%r22, 0x0001, %r25
T0_asi_reg_wr_187:
	mov	0x3c6, %r14
	.word 0xf0f384a0  ! 4509: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_0_352:
	setx	0x410110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde56031  ! 4511: SAVE_I	save	%r21, 0x0001, %r30
T0_asi_reg_rd_193:
	mov	0x20, %r14
	.word 0xf2db8400  ! 4512: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T0_asi_reg_rd_194:
	mov	0x1b, %r14
	.word 0xf0db8e40  ! 4513: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_329:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_329), 16, 16)) -> intp(0, 0, 31)
cpu_intr_0_353:
	setx	0x410331, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_330:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_330), 16, 16)) -> intp(0, 0, 13)
T0_asi_reg_wr_188:
	mov	0x2c, %r14
	.word 0xfef38e80  ! 4517: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T0_asi_reg_rd_195:
	mov	0x3c8, %r14
	.word 0xf8db8e80  ! 4520: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_0_331:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_331), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb5e5e069  ! 4522: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb7e5a164  ! 4524: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb88c4000  ! 4526: ANDcc_R	andcc 	%r17, %r0, %r28
	.word 0xbfe42025  ! 4527: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5e48000  ! 4528: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_332:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_332), 16, 16)) -> intp(0, 0, b)
	.word 0xbbe50000  ! 4530: SAVE_R	save	%r20, %r0, %r29
	.word 0xb5e44000  ! 4531: SAVE_R	save	%r17, %r0, %r26
	.word 0xbf641800  ! 4532: MOVcc_R	<illegal instruction>
cpu_intr_0_354:
	setx	0x42020e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_355:
	setx	0x430101, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_196:
	mov	0x0, %r14
	.word 0xf4db84a0  ! 4539: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_0_356:
	setx	0x43033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde561ff  ! 4544: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb9e5c000  ! 4546: SAVE_R	save	%r23, %r0, %r28
	.word 0xb5e48000  ! 4547: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_333:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_333), 16, 16)) -> intp(0, 0, 18)
T0_asi_reg_rd_197:
	mov	0x22, %r14
	.word 0xfedb8e40  ! 4550: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_0_357:
	setx	0x420125, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_358:
	setx	0x42030e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_359:
	setx	0x420230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf508000  ! 4561: RDPR_TSTATE	<illegal instruction>
cpu_intr_0_360:
	setx	0x410020, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_334:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_334), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_wr_189:
	mov	0x13, %r14
	.word 0xfef38400  ! 4567: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T0_asi_reg_rd_198:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 4568: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_0_335:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_335), 16, 16)) -> intp(0, 0, 33)
	.word 0xbde44000  ! 4572: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_wr_190:
	mov	0x36, %r14
	.word 0xf2f38400  ! 4578: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe5c000  ! 4583: SAVE_R	save	%r23, %r0, %r31
T0_asi_reg_rd_199:
	mov	0x3c8, %r14
	.word 0xfadb8400  ! 4585: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_0_336:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_336), 16, 16)) -> intp(0, 0, 7)
T0_asi_reg_wr_191:
	mov	0x2a, %r14
	.word 0xf2f38400  ! 4588: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb9e40000  ! 4590: SAVE_R	save	%r16, %r0, %r28
cpu_intr_0_361:
	setx	0x40010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e44000  ! 4593: SAVE_R	save	%r17, %r0, %r28
	.word 0xb1e58000  ! 4594: SAVE_R	save	%r22, %r0, %r24
	.word 0xb3e44000  ! 4595: SAVE_R	save	%r17, %r0, %r25
T0_asi_reg_wr_192:
	mov	0x1e, %r14
	.word 0xf4f38e40  ! 4598: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb1540000  ! 4600: RDPR_GL	<illegal instruction>
iob_intr_0_337:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_337), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb7e5205d  ! 4607: SAVE_I	save	%r20, 0x0001, %r27
cpu_intr_0_362:
	setx	0x430106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe54000  ! 4609: SAVE_R	save	%r21, %r0, %r29
	.word 0xb03d214a  ! 4611: XNOR_I	xnor 	%r20, 0x014a, %r24
T0_asi_reg_wr_193:
	mov	0x18, %r14
	.word 0xfef384a0  ! 4619: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_0_363:
	setx	0x47012f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_338:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_338), 16, 16)) -> intp(0, 0, 3)
cpu_intr_0_364:
	setx	0x47000f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_339:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_339), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_wr_194:
	mov	0x9, %r14
	.word 0xfcf38400  ! 4625: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb5e4c000  ! 4626: SAVE_R	save	%r19, %r0, %r26
T0_asi_reg_rd_200:
	mov	0x1f, %r14
	.word 0xfadb8e60  ! 4627: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_0_340:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_340), 16, 16)) -> intp(0, 0, 13)
iob_intr_0_341:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_341), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb02d0000  ! 4636: ANDN_R	andn 	%r20, %r0, %r24
iob_intr_0_342:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_342), 16, 16)) -> intp(0, 0, d)
iob_intr_0_343:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_343), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbd2c2001  ! 4639: SLL_I	sll 	%r16, 0x0001, %r30
	.word 0x8394219f  ! 4640: WRPR_TNPC_I	wrpr	%r16, 0x019f, %tnpc
	.word 0xb2a5e158  ! 4642: SUBcc_I	subcc 	%r23, 0x0158, %r25
cpu_intr_0_365:
	setx	0x460214, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_195:
	mov	0x2c, %r14
	.word 0xfaf38e80  ! 4645: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T0_asi_reg_rd_201:
	mov	0xf, %r14
	.word 0xf8db84a0  ! 4646: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb5e4c000  ! 4647: SAVE_R	save	%r19, %r0, %r26
	.word 0xbb3c5000  ! 4649: SRAX_R	srax	%r17, %r0, %r29
	.word 0xbfe52104  ! 4654: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb5e4e1b1  ! 4655: SAVE_I	save	%r19, 0x0001, %r26
iob_intr_0_344:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_344), 16, 16)) -> intp(0, 0, 2)
	.word 0xbd7c2401  ! 4660: MOVR_I	movre	%r16, 0x1, %r30
iob_intr_0_345:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_345), 16, 16)) -> intp(0, 0, 13)
T0_asi_reg_rd_202:
	mov	0x27, %r14
	.word 0xf4db89e0  ! 4662: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbfe40000  ! 4665: SAVE_R	save	%r16, %r0, %r31
iob_intr_0_346:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_346), 16, 16)) -> intp(0, 0, f)
T0_asi_reg_wr_196:
	mov	0xb, %r14
	.word 0xf2f38e80  ! 4674: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T0_asi_reg_wr_197:
	mov	0x10, %r14
	.word 0xf0f38e40  ! 4676: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb1e5c000  ! 4678: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_wr_198:
	mov	0x3c8, %r14
	.word 0xf6f38e60  ! 4687: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T0_asi_reg_rd_203:
	mov	0x2b, %r14
	.word 0xf0db84a0  ! 4689: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbfe5e02d  ! 4691: SAVE_I	save	%r23, 0x0001, %r31
iob_intr_0_347:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_347), 16, 16)) -> intp(0, 0, b)
	.word 0x8595a05f  ! 4694: WRPR_TSTATE_I	wrpr	%r22, 0x005f, %tstate
cpu_intr_0_366:
	setx	0x45012c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_204:
	mov	0x3c0, %r14
	.word 0xf0db8e60  ! 4696: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_0_367:
	setx	0x470133, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_199:
	mov	0x3c0, %r14
	.word 0xf6f384a0  ! 4698: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb80ce17f  ! 4699: AND_I	and 	%r19, 0x017f, %r28
T0_asi_reg_rd_205:
	mov	0x5, %r14
	.word 0xfedb89e0  ! 4703: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb1e4c000  ! 4704: SAVE_R	save	%r19, %r0, %r24
	.word 0xb5e460ac  ! 4708: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_368:
	setx	0x460330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e120  ! 4711: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_wr_200:
	mov	0x3c2, %r14
	.word 0xf4f384a0  ! 4714: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbbe5c000  ! 4715: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_369:
	setx	0x470207, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_201:
	mov	0x3c2, %r14
	.word 0xfef389e0  ! 4718: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_0_370:
	setx	0x440039, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_371:
	setx	0x470136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4616b  ! 4723: SAVE_I	save	%r17, 0x0001, %r25
iob_intr_0_348:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_348), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb2354000  ! 4728: ORN_R	orn 	%r21, %r0, %r25
T0_asi_reg_rd_206:
	mov	0x3c4, %r14
	.word 0xfadb8e80  ! 4730: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T0_asi_reg_rd_207:
	mov	0x36, %r14
	.word 0xfadb8e60  ! 4732: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb1e5c000  ! 4738: SAVE_R	save	%r23, %r0, %r24
	.word 0xbde5c000  ! 4742: SAVE_R	save	%r23, %r0, %r30
	.word 0xbde46083  ! 4750: SAVE_I	save	%r17, 0x0001, %r30
T0_asi_reg_wr_202:
	mov	0xd, %r14
	.word 0xfaf38e80  ! 4751: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T0_asi_reg_rd_208:
	mov	0xd, %r14
	.word 0xfcdb8e40  ! 4752: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbde5c000  ! 4754: SAVE_R	save	%r23, %r0, %r30
T0_asi_reg_wr_203:
	mov	0x0, %r14
	.word 0xfef38e40  ! 4755: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_wr_204:
	mov	0x26, %r14
	.word 0xfef38e60  ! 4756: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_0_372:
	setx	0x450122, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_209:
	mov	0x1, %r14
	.word 0xf2db8400  ! 4758: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb9e5a11a  ! 4763: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_wr_205:
	mov	0x3c4, %r14
	.word 0xfaf389e0  ! 4764: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_0_349:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_349), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_rd_210:
	mov	0x8, %r14
	.word 0xfcdb89e0  ! 4768: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_0_373:
	setx	0x45031d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_374:
	setx	0x440130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e42137  ! 4774: SAVE_I	save	%r16, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_206:
	mov	0x1f, %r14
	.word 0xfef389e0  ! 4781: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_0_375:
	setx	0x45023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde50000  ! 4784: SAVE_R	save	%r20, %r0, %r30
	.word 0xb9e4e171  ! 4786: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb3e50000  ! 4787: SAVE_R	save	%r20, %r0, %r25
T0_asi_reg_rd_211:
	mov	0x7, %r14
	.word 0xf0db8e40  ! 4790: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_rd_212:
	mov	0x6, %r14
	.word 0xf6db8400  ! 4791: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_0_376:
	setx	0x460126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e421fb  ! 4796: SAVE_I	save	%r16, 0x0001, %r26
T0_asi_reg_wr_207:
	mov	0x1e, %r14
	.word 0xfcf38e80  ! 4797: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T0_asi_reg_rd_213:
	mov	0x2b, %r14
	.word 0xf0db8e60  ! 4798: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbc3c8000  ! 4799: XNOR_R	xnor 	%r18, %r0, %r30
iob_intr_0_350:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_350), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb1e5e010  ! 4803: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_351:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_351), 16, 16)) -> intp(0, 0, 4)
	.word 0xb004a031  ! 4808: ADD_I	add 	%r18, 0x0031, %r24
iob_intr_0_352:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_352), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_wr_208:
	mov	0x22, %r14
	.word 0xfaf38e80  ! 4812: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbde4a0f0  ! 4813: SAVE_I	save	%r18, 0x0001, %r30
iob_intr_0_353:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_353), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb084606c  ! 4817: ADDcc_I	addcc 	%r17, 0x006c, %r24
T0_asi_reg_wr_209:
	mov	0x1, %r14
	.word 0xf0f38e40  ! 4818: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_0_354:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_354), 16, 16)) -> intp(0, 0, 12)
	.word 0xbbe54000  ! 4824: SAVE_R	save	%r21, %r0, %r29
T0_asi_reg_wr_210:
	mov	0x3c2, %r14
	.word 0xf4f38e40  ! 4828: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_rd_214:
	mov	0x23, %r14
	.word 0xfedb8e80  ! 4829: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_0_355:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_355), 16, 16)) -> intp(0, 0, 30)
cpu_intr_0_377:
	setx	0x460020, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_356:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_356), 16, 16)) -> intp(0, 0, 27)
	.word 0xb5e4e1d6  ! 4841: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb3e5c000  ! 4842: SAVE_R	save	%r23, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe520e3  ! 4845: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbde5e1e6  ! 4847: SAVE_I	save	%r23, 0x0001, %r30
cpu_intr_0_378:
	setx	0x46023f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_357:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_357), 16, 16)) -> intp(0, 0, d)
	.word 0xbf50c000  ! 4854: RDPR_TT	<illegal instruction>
cpu_intr_0_379:
	setx	0x46013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b4c000  ! 4858: SUBCcc_R	orncc 	%r19, %r0, %r28
iob_intr_0_358:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_358), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbde54000  ! 4861: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_359:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_359), 16, 16)) -> intp(0, 0, 32)
T0_asi_reg_wr_211:
	mov	0x3c2, %r14
	.word 0xf0f38e60  ! 4864: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T0_asi_reg_wr_212:
	mov	0x8, %r14
	.word 0xf6f38e40  ! 4866: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_wr_213:
	mov	0x16, %r14
	.word 0xf2f38e40  ! 4867: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_360:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_360), 16, 16)) -> intp(0, 0, 9)
iob_intr_0_361:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_361), 16, 16)) -> intp(0, 0, 3b)
cpu_intr_0_380:
	setx	0x450231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e54000  ! 4875: SAVE_R	save	%r21, %r0, %r25
cpu_intr_0_381:
	setx	0x440035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5c000  ! 4878: SAVE_R	save	%r23, %r0, %r24
	.word 0xb7e46188  ! 4879: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb5e4a014  ! 4884: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbfe48000  ! 4885: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_382:
	setx	0x440024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde42144  ! 4888: SAVE_I	save	%r16, 0x0001, %r30
cpu_intr_0_383:
	setx	0x47022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde40000  ! 4891: SAVE_R	save	%r16, %r0, %r30
	.word 0xb7e5c000  ! 4893: SAVE_R	save	%r23, %r0, %r27
	.word 0xb9e421d1  ! 4894: SAVE_I	save	%r16, 0x0001, %r28
iob_intr_0_362:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_362), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_rd_215:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 4897: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbfe4e161  ! 4903: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_363:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_363), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbfe48000  ! 4909: SAVE_R	save	%r18, %r0, %r31
	.word 0xb3e5a14b  ! 4910: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbbe40000  ! 4911: SAVE_R	save	%r16, %r0, %r29
	.word 0xb6850000  ! 4914: ADDcc_R	addcc 	%r20, %r0, %r27
	.word 0xb3e54000  ! 4915: SAVE_R	save	%r21, %r0, %r25
	.word 0xba1d8000  ! 4917: XOR_R	xor 	%r22, %r0, %r29
	.word 0xb7e5e101  ! 4918: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb3e58000  ! 4920: SAVE_R	save	%r22, %r0, %r25
T0_asi_reg_rd_216:
	mov	0x33, %r14
	.word 0xf6db89e0  ! 4921: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb5e4c000  ! 4923: SAVE_R	save	%r19, %r0, %r26
cpu_intr_0_384:
	setx	0x46002b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_364:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_364), 16, 16)) -> intp(0, 0, c)
	.word 0xbe95e145  ! 4928: ORcc_I	orcc 	%r23, 0x0145, %r31
cpu_intr_0_385:
	setx	0x44023c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_214:
	mov	0x37, %r14
	.word 0xfef38e40  ! 4930: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb1e58000  ! 4931: SAVE_R	save	%r22, %r0, %r24
	.word 0xb7e5c000  ! 4934: SAVE_R	save	%r23, %r0, %r27
cpu_intr_0_386:
	setx	0x450233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e14c  ! 4944: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3e4201b  ! 4946: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbbe4e106  ! 4949: SAVE_I	save	%r19, 0x0001, %r29
cpu_intr_0_387:
	setx	0x45011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e48000  ! 4955: SAVE_R	save	%r18, %r0, %r27
iob_intr_0_365:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_365), 16, 16)) -> intp(0, 0, 3a)
cpu_intr_0_388:
	setx	0x44020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1358000  ! 4959: SRL_R	srl 	%r22, %r0, %r24
cpu_intr_0_389:
	setx	0x450202, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_390:
	setx	0x440010, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_217:
	mov	0x15, %r14
	.word 0xf8db84a0  ! 4966: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_0_391:
	setx	0x470337, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_366:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_366), 16, 16)) -> intp(0, 0, 3)
T0_asi_reg_rd_218:
	mov	0x3c2, %r14
	.word 0xf8db89e0  ! 4976: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xbc9461d2  ! 4977: ORcc_I	orcc 	%r17, 0x01d2, %r30
	.word 0xb3e52054  ! 4978: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbfe4217e  ! 4980: SAVE_I	save	%r16, 0x0001, %r31
cpu_intr_0_392:
	setx	0x460222, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_367:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_367), 16, 16)) -> intp(0, 0, 29)
	.word 0xb4ada078  ! 4987: ANDNcc_I	andncc 	%r22, 0x0078, %r26
	.word 0xb895c000  ! 4988: ORcc_R	orcc 	%r23, %r0, %r28
T0_asi_reg_wr_215:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 4989: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbbe5a0ae  ! 4991: SAVE_I	save	%r22, 0x0001, %r29
T0_asi_reg_rd_219:
	mov	0x22, %r14
	.word 0xf2db8e80  ! 4996: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T0_asi_reg_rd_220:
	mov	0x27, %r14
	.word 0xf4db84a0  ! 4997: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T0_asi_reg_wr_216:
	mov	0x21, %r14
	.word 0xf8f38e40  ! 4998: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
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
	setx	0x1a000b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_0:
	mov	0x6, %r14
	.word 0xfcf38e40  ! 4: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
iob_intr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_0), 16, 16)) -> intp(3, 0, 36)
iob_intr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_1), 16, 16)) -> intp(3, 0, 21)
iob_intr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_2), 16, 16)) -> intp(3, 0, 27)
	.word 0xfc35a052  ! 12: STH_I	sth	%r30, [%r22 + 0x0052]
cpu_intr_3_1:
	setx	0x1d010c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_2:
	setx	0x1c023e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_3:
	setx	0x1d0019, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_3), 16, 16)) -> intp(3, 0, 31)
cpu_intr_3_4:
	setx	0x1f0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2d2027  ! 21: STB_I	stb	%r30, [%r20 + 0x0027]
cpu_intr_3_5:
	setx	0x1f022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb08421a3  ! 24: ADDcc_I	addcc 	%r16, 0x01a3, %r24
	.word 0xf2744000  ! 25: STX_R	stx	%r25, [%r17 + %r0]
	.word 0xbe844000  ! 32: ADDcc_R	addcc 	%r17, %r0, %r31
	.word 0xfa2c20df  ! 35: STB_I	stb	%r29, [%r16 + 0x00df]
T3_asi_reg_rd_0:
	mov	0x3c6, %r14
	.word 0xf0db8400  ! 37: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf8f561f9  ! 38: STXA_I	stxa	%r28, [%r21 + 0x01f9] %asi
cpu_intr_3_6:
	setx	0x1f022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2744000  ! 44: STX_R	stx	%r25, [%r17 + %r0]
cpu_intr_3_7:
	setx	0x1f0005, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_1:
	mov	0x19, %r14
	.word 0xfaf38e80  ! 48: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_3_8:
	setx	0x1f0009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc250000  ! 51: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xfea50020  ! 52: STWA_R	stwa	%r31, [%r20 + %r0] 0x01
cpu_intr_3_9:
	setx	0x1f0339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb480000  ! 58: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xfe25e1bf  ! 60: STW_I	stw	%r31, [%r23 + 0x01bf]
cpu_intr_3_10:
	setx	0x1f0234, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_11:
	setx	0x1c003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe358000  ! 70: STH_R	sth	%r31, [%r22 + %r0]
T3_asi_reg_wr_2:
	mov	0x22, %r14
	.word 0xf8f38e80  ! 72: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xbf3d9000  ! 74: SRAX_R	srax	%r22, %r0, %r31
cpu_intr_3_12:
	setx	0x1c011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc0d21f9  ! 76: AND_I	and 	%r20, 0x01f9, %r30
	.word 0xfaaca10f  ! 78: STBA_I	stba	%r29, [%r18 + 0x010f] %asi
	.word 0xf22c4000  ! 80: STB_R	stb	%r25, [%r17 + %r0]
	.word 0xfab48020  ! 83: STHA_R	stha	%r29, [%r18 + %r0] 0x01
T3_asi_reg_rd_1:
	mov	0x31, %r14
	.word 0xfcdb89e0  ! 84: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T3_asi_reg_rd_2:
	mov	0xb, %r14
	.word 0xfadb8e40  ! 85: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbe05c000  ! 86: ADD_R	add 	%r23, %r0, %r31
	.word 0xf82c21ac  ! 90: STB_I	stb	%r28, [%r16 + 0x01ac]
cpu_intr_3_13:
	setx	0x1d0309, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_14:
	setx	0x1d0024, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_4), 16, 16)) -> intp(3, 0, 16)
iob_intr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_5), 16, 16)) -> intp(3, 0, 17)
	.word 0xf675a1f5  ! 97: STX_I	stx	%r27, [%r22 + 0x01f5]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983d40  ! 101: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d40, %hpstate
	.word 0xf275608e  ! 102: STX_I	stx	%r25, [%r21 + 0x008e]
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_3:
	mov	0x3c8, %r14
	.word 0xf0f38e40  ! 105: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_15:
	setx	0x1f0326, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_6), 16, 16)) -> intp(3, 0, 1e)
	.word 0xfe2c0000  ! 112: STB_R	stb	%r31, [%r16 + %r0]
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983d90  ! 114: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d90, %hpstate
	.word 0xf82520fa  ! 116: STW_I	stw	%r28, [%r20 + 0x00fa]
	.word 0xf62d0000  ! 118: STB_R	stb	%r27, [%r20 + %r0]
	.word 0xfa348000  ! 119: STH_R	sth	%r29, [%r18 + %r0]
T3_asi_reg_rd_3:
	mov	0x3c8, %r14
	.word 0xf0db8400  ! 120: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_7), 16, 16)) -> intp(3, 0, 3)
	.word 0xfca44020  ! 125: STWA_R	stwa	%r30, [%r17 + %r0] 0x01
T3_asi_reg_wr_4:
	mov	0x6, %r14
	.word 0xfcf38e40  ! 127: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfea4e1fa  ! 131: STWA_I	stwa	%r31, [%r19 + 0x01fa] %asi
	.word 0xf034c000  ! 134: STH_R	sth	%r24, [%r19 + %r0]
	.word 0xf875a0ba  ! 135: STX_I	stx	%r28, [%r22 + 0x00ba]
iob_intr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_8), 16, 16)) -> intp(3, 0, 27)
iob_intr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_9), 16, 16)) -> intp(3, 0, 21)
T3_asi_reg_rd_4:
	mov	0x3c5, %r14
	.word 0xfcdb8e40  ! 142: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfc74e166  ! 145: STX_I	stx	%r30, [%r19 + 0x0166]
	.word 0xb6040000  ! 147: ADD_R	add 	%r16, %r0, %r27
T3_asi_reg_rd_5:
	mov	0x26, %r14
	.word 0xfcdb89e0  ! 150: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf2b48020  ! 151: STHA_R	stha	%r25, [%r18 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_10), 16, 16)) -> intp(3, 0, 28)
iob_intr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_11), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_16:
	setx	0x1d010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca5e185  ! 160: STWA_I	stwa	%r30, [%r23 + 0x0185] %asi
	.word 0xf4a5605f  ! 163: STWA_I	stwa	%r26, [%r21 + 0x005f] %asi
	.word 0xf8f4a1c8  ! 165: STXA_I	stxa	%r28, [%r18 + 0x01c8] %asi
iob_intr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_12), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf62d0000  ! 169: STB_R	stb	%r27, [%r20 + %r0]
T3_asi_reg_rd_6:
	mov	0x3c1, %r14
	.word 0xfedb89e0  ! 171: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	ta	T_CHANGE_TO_TL1
	.word 0xb23d8000  ! 177: XNOR_R	xnor 	%r22, %r0, %r25
	.word 0xf2a44020  ! 178: STWA_R	stwa	%r25, [%r17 + %r0] 0x01
	.word 0xf4b461f1  ! 179: STHA_I	stha	%r26, [%r17 + 0x01f1] %asi
	.word 0xf824604b  ! 181: STW_I	stw	%r28, [%r17 + 0x004b]
T3_asi_reg_rd_7:
	mov	0x1f, %r14
	.word 0xfadb8e60  ! 185: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xfa75a02a  ! 187: STX_I	stx	%r29, [%r22 + 0x002a]
	.word 0xfe24e053  ! 190: STW_I	stw	%r31, [%r19 + 0x0053]
iob_intr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_13), 16, 16)) -> intp(3, 0, c)
	.word 0xf2240000  ! 195: STW_R	stw	%r25, [%r16 + %r0]
	.word 0x9195615d  ! 197: WRPR_PIL_I	wrpr	%r21, 0x015d, %pil
cpu_intr_3_17:
	setx	0x1c0038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2356188  ! 201: STH_I	sth	%r25, [%r21 + 0x0188]
cpu_intr_3_18:
	setx	0x1e0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_5:
	mov	0x37, %r14
	.word 0xf2f38e40  ! 208: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_14), 16, 16)) -> intp(3, 0, 39)
iob_intr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_15), 16, 16)) -> intp(3, 0, 28)
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf4ad8020  ! 222: STBA_R	stba	%r26, [%r22 + %r0] 0x01
	.word 0xf22561a8  ! 223: STW_I	stw	%r25, [%r21 + 0x01a8]
	.word 0xf4a46192  ! 228: STWA_I	stwa	%r26, [%r17 + 0x0192] %asi
	.word 0xf4354000  ! 229: STH_R	sth	%r26, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf8a4c020  ! 235: STWA_R	stwa	%r28, [%r19 + %r0] 0x01
	.word 0xb2b48000  ! 238: SUBCcc_R	orncc 	%r18, %r0, %r25
T3_asi_reg_wr_6:
	mov	0x3c8, %r14
	.word 0xf2f38e80  ! 240: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_16), 16, 16)) -> intp(3, 0, 32)
cpu_intr_3_19:
	setx	0x1f0327, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf024e1fe  ! 249: STW_I	stw	%r24, [%r19 + 0x01fe]
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x8198284a  ! 250: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084a, %hpstate
	.word 0xfe250000  ! 253: STW_R	stw	%r31, [%r20 + %r0]
iob_intr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_17), 16, 16)) -> intp(3, 0, 18)
cpu_intr_3_20:
	setx	0x1c011e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_18), 16, 16)) -> intp(3, 0, 30)
	.word 0xf62c8000  ! 259: STB_R	stb	%r27, [%r18 + %r0]
iob_intr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_19), 16, 16)) -> intp(3, 0, 8)
	ta	T_CHANGE_TO_TL1
	.word 0xfeb4a058  ! 266: STHA_I	stha	%r31, [%r18 + 0x0058] %asi
iob_intr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_20), 16, 16)) -> intp(3, 0, 3c)
cpu_intr_3_21:
	setx	0x1e0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc240000  ! 272: STW_R	stw	%r30, [%r16 + %r0]
iob_intr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_21), 16, 16)) -> intp(3, 0, f)
iob_intr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_22), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf4adc020  ! 282: STBA_R	stba	%r26, [%r23 + %r0] 0x01
	.word 0xfe2c8000  ! 286: STB_R	stb	%r31, [%r18 + %r0]
	.word 0xf2b4c020  ! 288: STHA_R	stha	%r25, [%r19 + %r0] 0x01
T3_asi_reg_wr_7:
	mov	0x37, %r14
	.word 0xf6f38e60  ! 289: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T3_asi_reg_wr_8:
	mov	0x16, %r14
	.word 0xf0f38e40  ! 290: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_23), 16, 16)) -> intp(3, 0, 4)
	.word 0xf2246179  ! 293: STW_I	stw	%r25, [%r17 + 0x0179]
	.word 0xf8a5a06e  ! 294: STWA_I	stwa	%r28, [%r22 + 0x006e] %asi
	ta	T_CHANGE_TO_TL0
	.word 0xf6b48020  ! 301: STHA_R	stha	%r27, [%r18 + %r0] 0x01
	.word 0xf62d4000  ! 303: STB_R	stb	%r27, [%r21 + %r0]
	.word 0xf8a44020  ! 304: STWA_R	stwa	%r28, [%r17 + %r0] 0x01
cpu_intr_3_22:
	setx	0x1f032c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_23:
	setx	0x1c0202, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_9:
	mov	0x30, %r14
	.word 0xfaf38e40  ! 310: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbc044000  ! 311: ADD_R	add 	%r17, %r0, %r30
cpu_intr_3_24:
	setx	0x1d0034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a5c020  ! 313: STWA_R	stwa	%r28, [%r23 + %r0] 0x01
T3_asi_reg_rd_8:
	mov	0xc, %r14
	.word 0xfedb8e80  ! 315: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_24), 16, 16)) -> intp(3, 0, 34)
T3_asi_reg_wr_10:
	mov	0x3c1, %r14
	.word 0xf4f389e0  ! 318: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_25), 16, 16)) -> intp(3, 0, 22)
iob_intr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_26), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_wr_11:
	mov	0x3c3, %r14
	.word 0xfef38e80  ! 325: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T3_asi_reg_rd_9:
	mov	0x38, %r14
	.word 0xf8db8400  ! 327: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T3_asi_reg_wr_12:
	mov	0x7, %r14
	.word 0xf0f38e60  ! 328: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T3_asi_reg_rd_10:
	mov	0x3c7, %r14
	.word 0xf8db8e80  ! 329: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	ta	T_CHANGE_HPRIV
	.word 0xf8f4218a  ! 332: STXA_I	stxa	%r28, [%r16 + 0x018a] %asi
	.word 0xb8c40000  ! 333: ADDCcc_R	addccc 	%r16, %r0, %r28
T3_asi_reg_wr_13:
	mov	0x3c5, %r14
	.word 0xfcf38e60  ! 334: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T3_asi_reg_wr_14:
	mov	0x3c8, %r14
	.word 0xf8f38e40  ! 336: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_3_25:
	setx	0x1d0035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc250000  ! 341: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xf2750000  ! 342: STX_R	stx	%r25, [%r20 + %r0]
	.word 0xfa2da12f  ! 345: STB_I	stb	%r29, [%r22 + 0x012f]
T3_asi_reg_wr_15:
	mov	0x1a, %r14
	.word 0xf2f38e60  ! 346: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xbd352001  ! 349: SRL_I	srl 	%r20, 0x0001, %r30
iob_intr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_27), 16, 16)) -> intp(3, 0, e)
	.word 0xb81dc000  ! 353: XOR_R	xor 	%r23, %r0, %r28
iob_intr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_28), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_wr_16:
	mov	0x13, %r14
	.word 0xfef38e40  ! 355: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf4b4216f  ! 361: STHA_I	stha	%r26, [%r16 + 0x016f] %asi
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_17:
	mov	0x3, %r14
	.word 0xfcf38e40  ! 368: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfa34e0ff  ! 370: STH_I	sth	%r29, [%r19 + 0x00ff]
T3_asi_reg_rd_11:
	mov	0x2a, %r14
	.word 0xfadb8e80  ! 371: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_29), 16, 16)) -> intp(3, 0, 20)
	.word 0xbd504000  ! 374: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xf6a5a03c  ! 375: STWA_I	stwa	%r27, [%r22 + 0x003c] %asi
T3_asi_reg_rd_12:
	mov	0xf, %r14
	.word 0xf2db84a0  ! 379: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xfe356018  ! 386: STH_I	sth	%r31, [%r21 + 0x0018]
iob_intr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_30), 16, 16)) -> intp(3, 0, 3c)
T3_asi_reg_rd_13:
	mov	0x3c5, %r14
	.word 0xf4db8e80  ! 389: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_3_26:
	setx	0x1f031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc748000  ! 396: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xf4f5a123  ! 398: STXA_I	stxa	%r26, [%r22 + 0x0123] %asi
	ta	T_CHANGE_TO_TL1
iob_intr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_31), 16, 16)) -> intp(3, 0, 19)
	.word 0xf235e173  ! 403: STH_I	sth	%r25, [%r23 + 0x0173]
cpu_intr_3_27:
	setx	0x1d0020, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_18:
	mov	0x25, %r14
	.word 0xf8f389e0  ! 412: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T3_asi_reg_wr_19:
	mov	0x3c1, %r14
	.word 0xf6f38e60  ! 414: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T3_asi_reg_rd_14:
	mov	0x19, %r14
	.word 0xf8db8e40  ! 416: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf4f52138  ! 419: STXA_I	stxa	%r26, [%r20 + 0x0138] %asi
cpu_intr_3_28:
	setx	0x1d012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2240000  ! 422: STW_R	stw	%r25, [%r16 + %r0]
cpu_intr_3_29:
	setx	0x1e0005, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xfe744000  ! 431: STX_R	stx	%r31, [%r17 + %r0]
	.word 0xbb356001  ! 432: SRL_I	srl 	%r21, 0x0001, %r29
	.word 0xf0352191  ! 433: STH_I	sth	%r24, [%r20 + 0x0191]
iob_intr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_32), 16, 16)) -> intp(3, 0, 2f)
iob_intr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_33), 16, 16)) -> intp(3, 0, 15)
	.word 0xf8a4a1a0  ! 439: STWA_I	stwa	%r28, [%r18 + 0x01a0] %asi
	.word 0xbd347001  ! 440: SRLX_I	srlx	%r17, 0x0001, %r30
iob_intr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_34), 16, 16)) -> intp(3, 0, 2f)
iob_intr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_35), 16, 16)) -> intp(3, 0, 37)
	.word 0xbc258000  ! 452: SUB_R	sub 	%r22, %r0, %r30
T3_asi_reg_rd_15:
	mov	0x3c7, %r14
	.word 0xf8db89e0  ! 453: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_3_30:
	setx	0x1d0021, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_20:
	mov	0x3c8, %r14
	.word 0xf8f38e60  ! 456: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xfe25a15b  ! 457: STW_I	stw	%r31, [%r22 + 0x015b]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_31:
	setx	0x1e002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b48020  ! 468: STHA_R	stha	%r26, [%r18 + %r0] 0x01
T3_asi_reg_wr_21:
	mov	0x35, %r14
	.word 0xfaf384a0  ! 469: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_36), 16, 16)) -> intp(3, 0, 2f)
cpu_intr_3_32:
	setx	0x1d021a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_37), 16, 16)) -> intp(3, 0, 11)
	.word 0xb12da001  ! 476: SLL_I	sll 	%r22, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_38), 16, 16)) -> intp(3, 0, 12)
	.word 0xf024e0cd  ! 480: STW_I	stw	%r24, [%r19 + 0x00cd]
cpu_intr_3_33:
	setx	0x220037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea4c020  ! 483: STWA_R	stwa	%r31, [%r19 + %r0] 0x01
cpu_intr_3_34:
	setx	0x200038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_39), 16, 16)) -> intp(3, 0, 12)
	.word 0xb97d0400  ! 489: MOVR_R	movre	%r20, %r0, %r28
	.word 0xf8ac0020  ! 491: STBA_R	stba	%r28, [%r16 + %r0] 0x01
	.word 0xfea5c020  ! 493: STWA_R	stwa	%r31, [%r23 + %r0] 0x01
T3_asi_reg_rd_16:
	mov	0x13, %r14
	.word 0xf6db8e80  ! 497: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_40), 16, 16)) -> intp(3, 0, 14)
	.word 0xbf510000  ! 503: RDPR_TICK	rdpr	%tick, %r31
	.word 0xfcad4020  ! 504: STBA_R	stba	%r30, [%r21 + %r0] 0x01
T3_asi_reg_rd_17:
	mov	0xf, %r14
	.word 0xf6db8e60  ! 505: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_41), 16, 16)) -> intp(3, 0, 9)
T3_asi_reg_rd_18:
	mov	0x3c4, %r14
	.word 0xf6db8e60  ! 509: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T3_asi_reg_wr_22:
	mov	0x3c7, %r14
	.word 0xf6f38e60  ! 512: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xfc25a0d9  ! 515: STW_I	stw	%r30, [%r22 + 0x00d9]
	.word 0xf62c21ea  ! 516: STB_I	stb	%r27, [%r16 + 0x01ea]
T3_asi_reg_rd_19:
	mov	0x22, %r14
	.word 0xf0db84a0  ! 518: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf8f5a199  ! 520: STXA_I	stxa	%r28, [%r22 + 0x0199] %asi
T3_asi_reg_rd_20:
	mov	0x27, %r14
	.word 0xfedb89e0  ! 524: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	setx	data_start_4, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983e4a  ! 525: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e4a, %hpstate
T3_asi_reg_wr_23:
	mov	0x25, %r14
	.word 0xfaf38400  ! 528: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xfcb5a151  ! 530: STHA_I	stha	%r30, [%r22 + 0x0151] %asi
	.word 0xbcc50000  ! 532: ADDCcc_R	addccc 	%r20, %r0, %r30
T3_asi_reg_wr_24:
	mov	0x0, %r14
	.word 0xf8f38400  ! 536: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T3_asi_reg_wr_25:
	mov	0xf, %r14
	.word 0xfef38e40  ! 537: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_3_35:
	setx	0x230326, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_42), 16, 16)) -> intp(3, 0, 28)
	.word 0xfaadc020  ! 541: STBA_R	stba	%r29, [%r23 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982c92  ! 544: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c92, %hpstate
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_21:
	mov	0xe, %r14
	.word 0xfedb8e40  ! 551: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_36:
	setx	0x21001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82c605d  ! 557: STB_I	stb	%r28, [%r17 + 0x005d]
iob_intr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_43), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_rd_22:
	mov	0x3c1, %r14
	.word 0xfedb8e40  ! 562: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_44), 16, 16)) -> intp(3, 0, 5)
cpu_intr_3_37:
	setx	0x220013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8aca147  ! 565: STBA_I	stba	%r28, [%r18 + 0x0147] %asi
	.word 0xf0ad612f  ! 566: STBA_I	stba	%r24, [%r21 + 0x012f] %asi
T3_asi_reg_wr_26:
	mov	0x3c3, %r14
	.word 0xfef38e40  ! 567: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0x8994e19a  ! 568: WRPR_TICK_I	wrpr	%r19, 0x019a, %tick
	.word 0xb1351000  ! 569: SRLX_R	srlx	%r20, %r0, %r24
T3_asi_reg_wr_27:
	mov	0x3c3, %r14
	.word 0xf4f38400  ! 570: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T3_asi_reg_rd_23:
	mov	0x8, %r14
	.word 0xf0db8e40  ! 579: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982bd8  ! 580: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd8, %hpstate
iob_intr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_45), 16, 16)) -> intp(3, 0, 3c)
iob_intr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_46), 16, 16)) -> intp(3, 0, 39)
iob_intr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_47), 16, 16)) -> intp(3, 0, 13)
iob_intr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_48), 16, 16)) -> intp(3, 0, b)
	.word 0xb32c6001  ! 588: SLL_I	sll 	%r17, 0x0001, %r25
	.word 0xbc8c0000  ! 589: ANDcc_R	andcc 	%r16, %r0, %r30
cpu_intr_3_38:
	setx	0x220202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6240000  ! 594: STW_R	stw	%r27, [%r16 + %r0]
cpu_intr_3_39:
	setx	0x230106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab5a1c1  ! 599: STHA_I	stha	%r29, [%r22 + 0x01c1] %asi
cpu_intr_3_40:
	setx	0x210221, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_49), 16, 16)) -> intp(3, 0, 37)
	.word 0xf42420f3  ! 605: STW_I	stw	%r26, [%r16 + 0x00f3]
	.word 0xb6258000  ! 607: SUB_R	sub 	%r22, %r0, %r27
	.word 0xfaf4a1ab  ! 609: STXA_I	stxa	%r29, [%r18 + 0x01ab] %asi
	.word 0xf275a099  ! 611: STX_I	stx	%r25, [%r22 + 0x0099]
	.word 0xbc1de171  ! 614: XOR_I	xor 	%r23, 0x0171, %r30
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982f98  ! 615: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f98, %hpstate
T3_asi_reg_wr_28:
	mov	0x3c7, %r14
	.word 0xf0f38e40  ! 616: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_41:
	setx	0x230112, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf675c000  ! 625: STX_R	stx	%r27, [%r23 + %r0]
	.word 0xf2a56120  ! 626: STWA_I	stwa	%r25, [%r21 + 0x0120] %asi
	.word 0xf02d4000  ! 627: STB_R	stb	%r24, [%r21 + %r0]
iob_intr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_50), 16, 16)) -> intp(3, 0, a)
cpu_intr_3_42:
	setx	0x210201, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_43:
	setx	0x22020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0254000  ! 639: STW_R	stw	%r24, [%r21 + %r0]
iob_intr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_51), 16, 16)) -> intp(3, 0, 14)
cpu_intr_3_44:
	setx	0x200133, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983dda  ! 647: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dda, %hpstate
cpu_intr_3_45:
	setx	0x20002b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_29:
	mov	0x16, %r14
	.word 0xfcf38e40  ! 650: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0x91942038  ! 651: WRPR_PIL_I	wrpr	%r16, 0x0038, %pil
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_TO_TL1
	.word 0xfa35c000  ! 662: STH_R	sth	%r29, [%r23 + %r0]
cpu_intr_3_46:
	setx	0x210127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8354000  ! 664: ORN_R	orn 	%r21, %r0, %r28
T3_asi_reg_rd_24:
	mov	0x3c0, %r14
	.word 0xfedb8e60  ! 667: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_3_47:
	setx	0x23030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc3c211e  ! 673: XNOR_I	xnor 	%r16, 0x011e, %r30
iob_intr_3_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_52), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf2240000  ! 676: STW_R	stw	%r25, [%r16 + %r0]
	ta	T_CHANGE_TO_TL1
cpu_intr_3_48:
	setx	0x230225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22cc000  ! 683: STB_R	stb	%r25, [%r19 + %r0]
	.word 0xfc348000  ! 684: STH_R	sth	%r30, [%r18 + %r0]
	ta	T_CHANGE_NONHPRIV
	.word 0xf6b48020  ! 686: STHA_R	stha	%r27, [%r18 + %r0] 0x01
cpu_intr_3_49:
	setx	0x220204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2340000  ! 691: STH_R	sth	%r25, [%r16 + %r0]
	.word 0xf22c0000  ! 694: STB_R	stb	%r25, [%r16 + %r0]
	.word 0xb0440000  ! 695: ADDC_R	addc 	%r16, %r0, %r24
	.word 0xb414c000  ! 697: OR_R	or 	%r19, %r0, %r26
cpu_intr_3_50:
	setx	0x220116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_53), 16, 16)) -> intp(3, 0, 24)
	.word 0xf025c000  ! 703: STW_R	stw	%r24, [%r23 + %r0]
T3_asi_reg_wr_30:
	mov	0x6, %r14
	.word 0xf6f38e60  ! 704: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T3_asi_reg_wr_31:
	mov	0x3c5, %r14
	.word 0xf2f38400  ! 707: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb084a187  ! 710: ADDcc_I	addcc 	%r18, 0x0187, %r24
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983c10  ! 711: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c10, %hpstate
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983c12  ! 712: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c12, %hpstate
iob_intr_3_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_54), 16, 16)) -> intp(3, 0, 21)
iob_intr_3_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_55), 16, 16)) -> intp(3, 0, 2)
	.word 0xf62cc000  ! 716: STB_R	stb	%r27, [%r19 + %r0]
	.word 0xfc2c61c4  ! 718: STB_I	stb	%r30, [%r17 + 0x01c4]
cpu_intr_3_51:
	setx	0x200100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62d20f8  ! 720: STB_I	stb	%r27, [%r20 + 0x00f8]
	.word 0xbabc4000  ! 722: XNORcc_R	xnorcc 	%r17, %r0, %r29
	.word 0xfab4201a  ! 723: STHA_I	stha	%r29, [%r16 + 0x001a] %asi
	.word 0xfaada0d5  ! 724: STBA_I	stba	%r29, [%r22 + 0x00d5] %asi
T3_asi_reg_rd_25:
	mov	0xe, %r14
	.word 0xf4db8e40  ! 727: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	setx	data_start_4, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983bc0  ! 729: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc0, %hpstate
	.word 0xfef521f2  ! 731: STXA_I	stxa	%r31, [%r20 + 0x01f2] %asi
	.word 0xf0ac4020  ! 732: STBA_R	stba	%r24, [%r17 + %r0] 0x01
	.word 0xf624c000  ! 734: STW_R	stw	%r27, [%r19 + %r0]
	.word 0xf0a54020  ! 735: STWA_R	stwa	%r24, [%r21 + %r0] 0x01
	.word 0xfc2c0000  ! 736: STB_R	stb	%r30, [%r16 + %r0]
	.word 0xb934c000  ! 738: SRL_R	srl 	%r19, %r0, %r28
	.word 0xfa34a12f  ! 740: STH_I	sth	%r29, [%r18 + 0x012f]
iob_intr_3_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_56), 16, 16)) -> intp(3, 0, e)
	.word 0xbcb5c000  ! 743: ORNcc_R	orncc 	%r23, %r0, %r30
	.word 0xf8b4e1da  ! 744: STHA_I	stha	%r28, [%r19 + 0x01da] %asi
	.word 0xb7510000  ! 745: RDPR_TICK	rdpr	%tick, %r27
	.word 0xfc754000  ! 747: STX_R	stx	%r30, [%r21 + %r0]
	.word 0xbc9c2126  ! 748: XORcc_I	xorcc 	%r16, 0x0126, %r30
T3_asi_reg_rd_26:
	mov	0x32, %r14
	.word 0xf4db8e40  ! 754: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_52:
	setx	0x22031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8350000  ! 756: STH_R	sth	%r28, [%r20 + %r0]
iob_intr_3_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_57), 16, 16)) -> intp(3, 0, 1b)
T3_asi_reg_wr_32:
	mov	0xf, %r14
	.word 0xfef384a0  ! 763: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_3_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_58), 16, 16)) -> intp(3, 0, 1a)
T3_asi_reg_wr_33:
	mov	0x9, %r14
	.word 0xf8f384a0  ! 766: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_3_53:
	setx	0x20032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa254000  ! 769: STW_R	stw	%r29, [%r21 + %r0]
cpu_intr_3_54:
	setx	0x220022, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa758000  ! 774: STX_R	stx	%r29, [%r22 + %r0]
cpu_intr_3_55:
	setx	0x200037, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_59), 16, 16)) -> intp(3, 0, 35)
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_34:
	mov	0x11, %r14
	.word 0xfcf38e40  ! 782: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf0b4e0d4  ! 783: STHA_I	stha	%r24, [%r19 + 0x00d4] %asi
	.word 0xb3520000  ! 784: RDPR_PIL	rdpr	%pil, %r25
T3_asi_reg_wr_35:
	mov	0x23, %r14
	.word 0xfef38e40  ! 785: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_3_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_60), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_wr_36:
	mov	0x3c8, %r14
	.word 0xf6f384a0  ! 789: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T3_asi_reg_wr_37:
	mov	0x34, %r14
	.word 0xf0f389e0  ! 790: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf824c000  ! 796: STW_R	stw	%r28, [%r19 + %r0]
iob_intr_3_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_61), 16, 16)) -> intp(3, 0, 34)
cpu_intr_3_56:
	setx	0x22001d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_62), 16, 16)) -> intp(3, 0, 3f)
iob_intr_3_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_63), 16, 16)) -> intp(3, 0, 25)
	.word 0xfaadc020  ! 803: STBA_R	stba	%r29, [%r23 + %r0] 0x01
	.word 0xbd7c8400  ! 808: MOVR_R	movre	%r18, %r0, %r30
	.word 0xf4a4c020  ! 810: STWA_R	stwa	%r26, [%r19 + %r0] 0x01
	.word 0xf6b54020  ! 811: STHA_R	stha	%r27, [%r21 + %r0] 0x01
iob_intr_3_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_64), 16, 16)) -> intp(3, 0, 3d)
iob_intr_3_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_65), 16, 16)) -> intp(3, 0, 10)
	.word 0xf4242013  ! 818: STW_I	stw	%r26, [%r16 + 0x0013]
	.word 0xfab46122  ! 822: STHA_I	stha	%r29, [%r17 + 0x0122] %asi
	.word 0xf42c60e8  ! 823: STB_I	stb	%r26, [%r17 + 0x00e8]
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983a8a  ! 825: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a8a, %hpstate
iob_intr_3_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_66), 16, 16)) -> intp(3, 0, 1e)
	.word 0xb37c0400  ! 828: MOVR_R	movre	%r16, %r0, %r25
	.word 0xfef46115  ! 830: STXA_I	stxa	%r31, [%r17 + 0x0115] %asi
T3_asi_reg_rd_27:
	mov	0x24, %r14
	.word 0xfadb8e40  ! 834: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb82de0f1  ! 836: ANDN_I	andn 	%r23, 0x00f1, %r28
	.word 0xfe748000  ! 838: STX_R	stx	%r31, [%r18 + %r0]
	.word 0xfef5e13c  ! 839: STXA_I	stxa	%r31, [%r23 + 0x013c] %asi
	.word 0xf2b5e01f  ! 840: STHA_I	stha	%r25, [%r23 + 0x001f] %asi
cpu_intr_3_57:
	setx	0x220320, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_28:
	mov	0x3c7, %r14
	.word 0xf4db84a0  ! 844: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_3_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_67), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_wr_38:
	mov	0xb, %r14
	.word 0xfef38e60  ! 852: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T3_asi_reg_rd_29:
	mov	0x11, %r14
	.word 0xf4db84a0  ! 854: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xfeb5e0e1  ! 855: STHA_I	stha	%r31, [%r23 + 0x00e1] %asi
	.word 0xf4b58020  ! 856: STHA_R	stha	%r26, [%r22 + %r0] 0x01
	.word 0xfa25c000  ! 857: STW_R	stw	%r29, [%r23 + %r0]
T3_asi_reg_wr_39:
	mov	0x3c0, %r14
	.word 0xf2f38e40  ! 861: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_68), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_wr_40:
	mov	0x22, %r14
	.word 0xfcf38e60  ! 864: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xfa254000  ! 865: STW_R	stw	%r29, [%r21 + %r0]
T3_asi_reg_wr_41:
	mov	0x2c, %r14
	.word 0xfef38400  ! 867: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xfab4e173  ! 870: STHA_I	stha	%r29, [%r19 + 0x0173] %asi
	.word 0xfaa54020  ! 871: STWA_R	stwa	%r29, [%r21 + %r0] 0x01
cpu_intr_3_58:
	setx	0x220217, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_59:
	setx	0x23012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4f460cc  ! 877: STXA_I	stxa	%r26, [%r17 + 0x00cc] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf0250000  ! 884: STW_R	stw	%r24, [%r20 + %r0]
	.word 0xf4356063  ! 885: STH_I	sth	%r26, [%r21 + 0x0063]
iob_intr_3_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_69), 16, 16)) -> intp(3, 0, 39)
	.word 0xb9508000  ! 892: RDPR_TSTATE	rdpr	%tstate, %r28
cpu_intr_3_60:
	setx	0x220038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0f560bf  ! 894: STXA_I	stxa	%r24, [%r21 + 0x00bf] %asi
	ta	T_CHANGE_NONHPRIV
iob_intr_3_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_70), 16, 16)) -> intp(3, 0, 8)
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983888  ! 901: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1888, %hpstate
	.word 0xf075e0be  ! 905: STX_I	stx	%r24, [%r23 + 0x00be]
T3_asi_reg_rd_30:
	mov	0x3c1, %r14
	.word 0xf4db8e80  ! 907: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	ta	T_CHANGE_TO_TL1
	.word 0xf6b5a0e4  ! 909: STHA_I	stha	%r27, [%r22 + 0x00e4] %asi
iob_intr_3_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_71), 16, 16)) -> intp(3, 0, 30)
cpu_intr_3_61:
	setx	0x22002b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_62:
	setx	0x200137, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_42:
	mov	0x34, %r14
	.word 0xf2f38e80  ! 920: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xba948000  ! 924: ORcc_R	orcc 	%r18, %r0, %r29
	ta	T_CHANGE_TO_TL0
	.word 0xf2b44020  ! 927: STHA_R	stha	%r25, [%r17 + %r0] 0x01
T3_asi_reg_wr_43:
	mov	0x1e, %r14
	.word 0xf8f38400  ! 931: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	.word 0xf8258000  ! 935: STW_R	stw	%r28, [%r22 + %r0]
	.word 0xfeb5c020  ! 939: STHA_R	stha	%r31, [%r23 + %r0] 0x01
T3_asi_reg_wr_44:
	mov	0x3c4, %r14
	.word 0xf4f38e40  ! 942: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb00cc000  ! 943: AND_R	and 	%r19, %r0, %r24
	.word 0xf42dc000  ! 944: STB_R	stb	%r26, [%r23 + %r0]
cpu_intr_3_63:
	setx	0x250307, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983f4a  ! 946: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f4a, %hpstate
cpu_intr_3_64:
	setx	0x270024, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_31:
	mov	0x0, %r14
	.word 0xf4db8e40  ! 949: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_65:
	setx	0x240024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfead0020  ! 958: STBA_R	stba	%r31, [%r20 + %r0] 0x01
	.word 0xb0358000  ! 965: ORN_R	orn 	%r22, %r0, %r24
	.word 0xb684a135  ! 967: ADDcc_I	addcc 	%r18, 0x0135, %r27
	.word 0xfe25616b  ! 968: STW_I	stw	%r31, [%r21 + 0x016b]
	.word 0xfc25c000  ! 970: STW_R	stw	%r30, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf4b44020  ! 973: STHA_R	stha	%r26, [%r17 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb0344000  ! 976: ORN_R	orn 	%r17, %r0, %r24
	ta	T_CHANGE_TO_TL0
cpu_intr_3_66:
	setx	0x25023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9352001  ! 981: SRL_I	srl 	%r20, 0x0001, %r28
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982e1a  ! 983: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e1a, %hpstate
	.word 0xf625610e  ! 990: STW_I	stw	%r27, [%r21 + 0x010e]
	.word 0xf43520dc  ! 994: STH_I	sth	%r26, [%r20 + 0x00dc]
cpu_intr_3_67:
	setx	0x27000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_32:
	mov	0x24, %r14
	.word 0xf0db8e40  ! 996: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_wr_45:
	mov	0x9, %r14
	.word 0xf4f38e60  ! 997: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xfeac0020  ! 999: STBA_R	stba	%r31, [%r16 + %r0] 0x01
iob_intr_3_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_72), 16, 16)) -> intp(3, 0, 35)
	.word 0xf275e0f5  ! 1001: STX_I	stx	%r25, [%r23 + 0x00f5]
cpu_intr_3_68:
	setx	0x250201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeac8020  ! 1005: STBA_R	stba	%r31, [%r18 + %r0] 0x01
cpu_intr_3_69:
	setx	0x27000e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_46:
	mov	0x12, %r14
	.word 0xfef38e40  ! 1007: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf02c4000  ! 1008: STB_R	stb	%r24, [%r17 + %r0]
cpu_intr_3_70:
	setx	0x27013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_33:
	mov	0x1c, %r14
	.word 0xf4db8e40  ! 1011: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf6240000  ! 1013: STW_R	stw	%r27, [%r16 + %r0]
	.word 0xf0ace133  ! 1014: STBA_I	stba	%r24, [%r19 + 0x0133] %asi
iob_intr_3_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_73), 16, 16)) -> intp(3, 0, 1d)
	.word 0xf2a58020  ! 1016: STWA_R	stwa	%r25, [%r22 + %r0] 0x01
	.word 0xf475a036  ! 1017: STX_I	stx	%r26, [%r22 + 0x0036]
iob_intr_3_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_74), 16, 16)) -> intp(3, 0, 1a)
	.word 0xfca5206d  ! 1020: STWA_I	stwa	%r30, [%r20 + 0x006d] %asi
	.word 0xf2f42077  ! 1022: STXA_I	stxa	%r25, [%r16 + 0x0077] %asi
	.word 0xbec52158  ! 1023: ADDCcc_I	addccc 	%r20, 0x0158, %r31
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbc346088  ! 1029: ORN_I	orn 	%r17, 0x0088, %r30
cpu_intr_3_71:
	setx	0x270015, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_34:
	mov	0x30, %r14
	.word 0xf6db8e40  ! 1032: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf425a077  ! 1034: STW_I	stw	%r26, [%r22 + 0x0077]
iob_intr_3_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_75), 16, 16)) -> intp(3, 0, f)
	.word 0xf0f5e009  ! 1045: STXA_I	stxa	%r24, [%r23 + 0x0009] %asi
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_35:
	mov	0x3c5, %r14
	.word 0xfcdb8e80  ! 1048: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb6854000  ! 1049: ADDcc_R	addcc 	%r21, %r0, %r27
T3_asi_reg_rd_36:
	mov	0x13, %r14
	.word 0xf6db8e60  ! 1050: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_3_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_76), 16, 16)) -> intp(3, 0, 1e)
cpu_intr_3_72:
	setx	0x270227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22c21c1  ! 1056: STB_I	stb	%r25, [%r16 + 0x01c1]
	.word 0xfa75c000  ! 1057: STX_R	stx	%r29, [%r23 + %r0]
	.word 0xbab5a011  ! 1060: ORNcc_I	orncc 	%r22, 0x0011, %r29
cpu_intr_3_73:
	setx	0x25032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8248000  ! 1064: STW_R	stw	%r28, [%r18 + %r0]
iob_intr_3_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_77), 16, 16)) -> intp(3, 0, b)
	.word 0xb08da08b  ! 1066: ANDcc_I	andcc 	%r22, 0x008b, %r24
cpu_intr_3_74:
	setx	0x270015, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_75:
	setx	0x25033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_47:
	mov	0x3c6, %r14
	.word 0xfef38e80  ! 1069: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf0b50020  ! 1070: STHA_R	stha	%r24, [%r20 + %r0] 0x01
iob_intr_3_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_78), 16, 16)) -> intp(3, 0, b)
iob_intr_3_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_79), 16, 16)) -> intp(3, 0, 33)
iob_intr_3_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_80), 16, 16)) -> intp(3, 0, e)
	.word 0xf6a4a0cc  ! 1077: STWA_I	stwa	%r27, [%r18 + 0x00cc] %asi
	.word 0xf6b42176  ! 1078: STHA_I	stha	%r27, [%r16 + 0x0176] %asi
	.word 0xf6ace03c  ! 1079: STBA_I	stba	%r27, [%r19 + 0x003c] %asi
	.word 0xfea56181  ! 1081: STWA_I	stwa	%r31, [%r21 + 0x0181] %asi
	.word 0xfe35a0c4  ! 1083: STH_I	sth	%r31, [%r22 + 0x00c4]
	.word 0xf8f5a1e7  ! 1088: STXA_I	stxa	%r28, [%r22 + 0x01e7] %asi
	.word 0xfc35e023  ! 1090: STH_I	sth	%r30, [%r23 + 0x0023]
cpu_intr_3_76:
	setx	0x250110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ad6182  ! 1094: STBA_I	stba	%r25, [%r21 + 0x0182] %asi
cpu_intr_3_77:
	setx	0x270137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa24c000  ! 1097: STW_R	stw	%r29, [%r19 + %r0]
	.word 0xfe75208b  ! 1107: STX_I	stx	%r31, [%r20 + 0x008b]
cpu_intr_3_78:
	setx	0x25022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2ca14d  ! 1110: STB_I	stb	%r29, [%r18 + 0x014d]
T3_asi_reg_wr_48:
	mov	0x1f, %r14
	.word 0xfaf38e40  ! 1113: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf82c8000  ! 1115: STB_R	stb	%r28, [%r18 + %r0]
iob_intr_3_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_81), 16, 16)) -> intp(3, 0, 1)
	.word 0xfea48020  ! 1117: STWA_R	stwa	%r31, [%r18 + %r0] 0x01
cpu_intr_3_79:
	setx	0x270227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb89c0000  ! 1120: XORcc_R	xorcc 	%r16, %r0, %r28
iob_intr_3_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_82), 16, 16)) -> intp(3, 0, 3b)
iob_intr_3_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_83), 16, 16)) -> intp(3, 0, 23)
iob_intr_3_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_84), 16, 16)) -> intp(3, 0, 25)
	.word 0xbd355000  ! 1126: SRLX_R	srlx	%r21, %r0, %r30
	.word 0xf0240000  ! 1128: STW_R	stw	%r24, [%r16 + %r0]
cpu_intr_3_80:
	setx	0x27031c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_85), 16, 16)) -> intp(3, 0, e)
cpu_intr_3_81:
	setx	0x25023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xfa352141  ! 1134: STH_I	sth	%r29, [%r20 + 0x0141]
iob_intr_3_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_86), 16, 16)) -> intp(3, 0, 8)
	.word 0xf074e185  ! 1138: STX_I	stx	%r24, [%r19 + 0x0185]
T3_asi_reg_wr_49:
	mov	0x2a, %r14
	.word 0xfef389e0  ! 1140: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL0
cpu_intr_3_82:
	setx	0x25000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a4a1e1  ! 1145: STWA_I	stwa	%r26, [%r18 + 0x01e1] %asi
cpu_intr_3_83:
	setx	0x270029, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_84:
	setx	0x25021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982998  ! 1151: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0998, %hpstate
	.word 0xf8ace100  ! 1154: STBA_I	stba	%r28, [%r19 + 0x0100] %asi
	.word 0xfa744000  ! 1155: STX_R	stx	%r29, [%r17 + %r0]
T3_asi_reg_rd_37:
	mov	0x13, %r14
	.word 0xfadb8400  ! 1157: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf0b420a2  ! 1162: STHA_I	stha	%r24, [%r16 + 0x00a2] %asi
	.word 0xfe2da03d  ! 1166: STB_I	stb	%r31, [%r22 + 0x003d]
iob_intr_3_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_87), 16, 16)) -> intp(3, 0, f)
	.word 0xfc25612d  ! 1170: STW_I	stw	%r30, [%r21 + 0x012d]
iob_intr_3_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_88), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_wr_50:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 1173: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf0f5e1bb  ! 1174: STXA_I	stxa	%r24, [%r23 + 0x01bb] %asi
	.word 0xf8244000  ! 1177: STW_R	stw	%r28, [%r17 + %r0]
	ta	T_CHANGE_TO_TL1
iob_intr_3_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_89), 16, 16)) -> intp(3, 0, 27)
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982d58  ! 1181: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d58, %hpstate
	.word 0xb13da001  ! 1184: SRA_I	sra 	%r22, 0x0001, %r24
iob_intr_3_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_90), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_85:
	setx	0x24031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb480000  ! 1188: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983d80  ! 1189: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d80, %hpstate
	.word 0xfa2ca0cc  ! 1191: STB_I	stb	%r29, [%r18 + 0x00cc]
	.word 0xbe14a125  ! 1193: OR_I	or 	%r18, 0x0125, %r31
	.word 0xb0358000  ! 1194: ORN_R	orn 	%r22, %r0, %r24
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
	.word 0xf82d60b4  ! 1199: STB_I	stb	%r28, [%r21 + 0x00b4]
	.word 0xf0b421c9  ! 1203: STHA_I	stha	%r24, [%r16 + 0x01c9] %asi
iob_intr_3_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_91), 16, 16)) -> intp(3, 0, 1d)
iob_intr_3_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_92), 16, 16)) -> intp(3, 0, 1d)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf825a1a4  ! 1208: STW_I	stw	%r28, [%r22 + 0x01a4]
cpu_intr_3_86:
	setx	0x24020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe34a023  ! 1212: STH_I	sth	%r31, [%r18 + 0x0023]
iob_intr_3_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_93), 16, 16)) -> intp(3, 0, 31)
	.word 0xfab4e169  ! 1214: STHA_I	stha	%r29, [%r19 + 0x0169] %asi
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb12de001  ! 1216: SLL_I	sll 	%r23, 0x0001, %r24
T3_asi_reg_rd_38:
	mov	0xc, %r14
	.word 0xfcdb8400  ! 1217: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xfca48020  ! 1220: STWA_R	stwa	%r30, [%r18 + %r0] 0x01
	.word 0xb08da1ea  ! 1221: ANDcc_I	andcc 	%r22, 0x01ea, %r24
	.word 0xbd352001  ! 1222: SRL_I	srl 	%r20, 0x0001, %r30
	.word 0xfcb46128  ! 1227: STHA_I	stha	%r30, [%r17 + 0x0128] %asi
T3_asi_reg_wr_51:
	mov	0x1c, %r14
	.word 0xf8f38400  ! 1228: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf4b50020  ! 1235: STHA_R	stha	%r26, [%r20 + %r0] 0x01
	.word 0xf6744000  ! 1237: STX_R	stx	%r27, [%r17 + %r0]
iob_intr_3_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_94), 16, 16)) -> intp(3, 0, 39)
	.word 0xf2b5c020  ! 1241: STHA_R	stha	%r25, [%r23 + %r0] 0x01
	.word 0xb8b5a0bb  ! 1243: ORNcc_I	orncc 	%r22, 0x00bb, %r28
	.word 0xf4a54020  ! 1244: STWA_R	stwa	%r26, [%r21 + %r0] 0x01
cpu_intr_3_87:
	setx	0x250214, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_39:
	mov	0x11, %r14
	.word 0xfcdb8400  ! 1253: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_3_88:
	setx	0x270121, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_40:
	mov	0x28, %r14
	.word 0xfedb8e40  ! 1261: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_3_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_95), 16, 16)) -> intp(3, 0, 35)
T3_asi_reg_rd_41:
	mov	0x5, %r14
	.word 0xf2db89e0  ! 1263: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	ta	T_CHANGE_TO_TL0
	.word 0xb40c8000  ! 1267: AND_R	and 	%r18, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_42:
	mov	0x3c5, %r14
	.word 0xfedb8e80  ! 1269: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_3_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_96), 16, 16)) -> intp(3, 0, 25)
iob_intr_3_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_97), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_89:
	setx	0x24003e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_52:
	mov	0x3c3, %r14
	.word 0xfaf389e0  ! 1276: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_43:
	mov	0x3c6, %r14
	.word 0xfadb8e60  ! 1279: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T3_asi_reg_rd_44:
	mov	0x1b, %r14
	.word 0xf0db8e40  ! 1281: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_3_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_98), 16, 16)) -> intp(3, 0, 34)
T3_asi_reg_rd_45:
	mov	0x1f, %r14
	.word 0xf2db89e0  ! 1288: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	ta	T_CHANGE_TO_TL1
	.word 0xf4a44020  ! 1290: STWA_R	stwa	%r26, [%r17 + %r0] 0x01
T3_asi_reg_rd_46:
	mov	0x3c4, %r14
	.word 0xf6db89e0  ! 1292: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T3_asi_reg_wr_53:
	mov	0xc, %r14
	.word 0xfcf384a0  ! 1293: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfeac8020  ! 1295: STBA_R	stba	%r31, [%r18 + %r0] 0x01
	.word 0xf024a074  ! 1297: STW_I	stw	%r24, [%r18 + 0x0074]
T3_asi_reg_rd_47:
	mov	0x22, %r14
	.word 0xfedb89e0  ! 1298: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T3_asi_reg_wr_54:
	mov	0x14, %r14
	.word 0xf8f384a0  ! 1300: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T3_asi_reg_wr_55:
	mov	0x15, %r14
	.word 0xf2f38e80  ! 1301: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_3_90:
	setx	0x260227, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_91:
	setx	0x260220, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983810  ! 1304: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1810, %hpstate
	.word 0xb81da1c4  ! 1305: XOR_I	xor 	%r22, 0x01c4, %r28
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982802  ! 1306: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0802, %hpstate
	.word 0xba8c4000  ! 1313: ANDcc_R	andcc 	%r17, %r0, %r29
iob_intr_3_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_99), 16, 16)) -> intp(3, 0, 3e)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_56:
	mov	0x3c1, %r14
	.word 0xf8f38e40  ! 1317: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_3_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_100), 16, 16)) -> intp(3, 0, 6)
	.word 0xf6a421d0  ! 1323: STWA_I	stwa	%r27, [%r16 + 0x01d0] %asi
T3_asi_reg_wr_57:
	mov	0x3c0, %r14
	.word 0xfef38e60  ! 1325: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_3_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_101), 16, 16)) -> intp(3, 0, 3f)
iob_intr_3_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_102), 16, 16)) -> intp(3, 0, 17)
cpu_intr_3_92:
	setx	0x260027, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_48:
	mov	0x2f, %r14
	.word 0xf0db84a0  ! 1334: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf2242124  ! 1339: STW_I	stw	%r25, [%r16 + 0x0124]
cpu_intr_3_93:
	setx	0x260131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82c2108  ! 1342: STB_I	stb	%r28, [%r16 + 0x0108]
iob_intr_3_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_103), 16, 16)) -> intp(3, 0, 19)
iob_intr_3_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_104), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_94:
	setx	0x240032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ac0020  ! 1353: STBA_R	stba	%r27, [%r16 + %r0] 0x01
cpu_intr_3_95:
	setx	0x24020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcf4a04f  ! 1360: STXA_I	stxa	%r30, [%r18 + 0x004f] %asi
T3_asi_reg_rd_49:
	mov	0x13, %r14
	.word 0xfedb8e40  ! 1364: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_3_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_105), 16, 16)) -> intp(3, 0, 21)
T3_asi_reg_wr_58:
	mov	0x3c1, %r14
	.word 0xf8f384a0  ! 1366: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T3_asi_reg_wr_59:
	mov	0x29, %r14
	.word 0xfaf384a0  ! 1369: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T3_asi_reg_wr_60:
	mov	0x1b, %r14
	.word 0xf0f38e80  ! 1371: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T3_asi_reg_rd_50:
	mov	0x1b, %r14
	.word 0xfcdb8e40  ! 1377: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_wr_61:
	mov	0x3c6, %r14
	.word 0xfef38e80  ! 1383: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_3_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_106), 16, 16)) -> intp(3, 0, 3d)
cpu_intr_3_96:
	setx	0x270002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6744000  ! 1389: STX_R	stx	%r27, [%r17 + %r0]
T3_asi_reg_wr_62:
	mov	0x18, %r14
	.word 0xf6f38e80  ! 1390: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xfc2d21e5  ! 1391: STB_I	stb	%r30, [%r20 + 0x01e5]
T3_asi_reg_rd_51:
	mov	0x33, %r14
	.word 0xf6db8400  ! 1392: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb0ad4000  ! 1394: ANDNcc_R	andncc 	%r21, %r0, %r24
cpu_intr_3_97:
	setx	0x28020a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_98:
	setx	0x280103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea4c020  ! 1401: STWA_R	stwa	%r31, [%r19 + %r0] 0x01
iob_intr_3_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_107), 16, 16)) -> intp(3, 0, 2)
iob_intr_3_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_108), 16, 16)) -> intp(3, 0, 35)
cpu_intr_3_99:
	setx	0x2b0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf224e085  ! 1409: STW_I	stw	%r25, [%r19 + 0x0085]
	.word 0xf8ad606f  ! 1410: STBA_I	stba	%r28, [%r21 + 0x006f] %asi
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_109), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf4748000  ! 1417: STX_R	stx	%r26, [%r18 + %r0]
T3_asi_reg_rd_52:
	mov	0x1f, %r14
	.word 0xf4db8e40  ! 1419: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_TO_TL0
	.word 0xfaade134  ! 1422: STBA_I	stba	%r29, [%r23 + 0x0134] %asi
	.word 0xfaade0ff  ! 1423: STBA_I	stba	%r29, [%r23 + 0x00ff] %asi
	.word 0xf4a5a082  ! 1424: STWA_I	stwa	%r26, [%r22 + 0x0082] %asi
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_63:
	mov	0x1c, %r14
	.word 0xfcf38e80  ! 1428: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_3_100:
	setx	0x29000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_53:
	mov	0x28, %r14
	.word 0xfadb8e40  ! 1432: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfe2ca0c0  ! 1436: STB_I	stb	%r31, [%r18 + 0x00c0]
T3_asi_reg_wr_64:
	mov	0x3c6, %r14
	.word 0xfef38e40  ! 1437: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_wr_65:
	mov	0x31, %r14
	.word 0xf0f38400  ! 1438: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf0240000  ! 1440: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xf2354000  ! 1441: STH_R	sth	%r25, [%r21 + %r0]
iob_intr_3_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_110), 16, 16)) -> intp(3, 0, 9)
T3_asi_reg_rd_54:
	mov	0x5, %r14
	.word 0xf6db8e40  ! 1445: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_101:
	setx	0x29021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb44020  ! 1447: STHA_R	stha	%r31, [%r17 + %r0] 0x01
T3_asi_reg_wr_66:
	mov	0x3c3, %r14
	.word 0xf2f389e0  ! 1448: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_3_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_111), 16, 16)) -> intp(3, 0, 9)
	.word 0xb77cc400  ! 1451: MOVR_R	movre	%r19, %r0, %r27
iob_intr_3_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_112), 16, 16)) -> intp(3, 0, 1f)
T3_asi_reg_wr_67:
	mov	0x1, %r14
	.word 0xf6f384a0  ! 1457: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xbc35a069  ! 1462: ORN_I	orn 	%r22, 0x0069, %r30
cpu_intr_3_102:
	setx	0x29021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_103:
	setx	0x28011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a54020  ! 1467: STWA_R	stwa	%r27, [%r21 + %r0] 0x01
	.word 0xf8b4c020  ! 1469: STHA_R	stha	%r28, [%r19 + %r0] 0x01
cpu_intr_3_104:
	setx	0x290104, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_105:
	setx	0x28023d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_55:
	mov	0x30, %r14
	.word 0xf4db84a0  ! 1475: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xfa2ca1ff  ! 1479: STB_I	stb	%r29, [%r18 + 0x01ff]
T3_asi_reg_wr_68:
	mov	0x1, %r14
	.word 0xfaf38e40  ! 1481: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf2752189  ! 1485: STX_I	stx	%r25, [%r20 + 0x0189]
cpu_intr_3_106:
	setx	0x2a001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf835e02e  ! 1491: STH_I	sth	%r28, [%r23 + 0x002e]
	.word 0xfc24200a  ! 1494: STW_I	stw	%r30, [%r16 + 0x000a]
	.word 0xf8ade076  ! 1495: STBA_I	stba	%r28, [%r23 + 0x0076] %asi
T3_asi_reg_rd_56:
	mov	0xc, %r14
	.word 0xf0db8400  ! 1497: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T3_asi_reg_wr_69:
	mov	0x1c, %r14
	.word 0xfcf38e80  ! 1498: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xba2de0cc  ! 1499: ANDN_I	andn 	%r23, 0x00cc, %r29
	.word 0xf8758000  ! 1501: STX_R	stx	%r28, [%r22 + %r0]
	.word 0xfe2c0000  ! 1505: STB_R	stb	%r31, [%r16 + %r0]
	.word 0xf825a004  ! 1508: STW_I	stw	%r28, [%r22 + 0x0004]
cpu_intr_3_107:
	setx	0x2a0007, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_113), 16, 16)) -> intp(3, 0, 15)
	.word 0xfa24e02f  ! 1513: STW_I	stw	%r29, [%r19 + 0x002f]
	.word 0xf0256120  ! 1514: STW_I	stw	%r24, [%r21 + 0x0120]
	.word 0xfeade181  ! 1517: STBA_I	stba	%r31, [%r23 + 0x0181] %asi
T3_asi_reg_wr_70:
	mov	0x2d, %r14
	.word 0xf6f38e60  ! 1518: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_3_108:
	setx	0x28023b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_57:
	mov	0x28, %r14
	.word 0xf2db8e80  ! 1521: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_109:
	setx	0x280235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b44020  ! 1531: STHA_R	stha	%r24, [%r17 + %r0] 0x01
iob_intr_3_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_114), 16, 16)) -> intp(3, 0, 26)
iob_intr_3_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_115), 16, 16)) -> intp(3, 0, 22)
	.word 0xfca5a1fa  ! 1538: STWA_I	stwa	%r30, [%r22 + 0x01fa] %asi
	ta	T_CHANGE_TO_TL0
iob_intr_3_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_116), 16, 16)) -> intp(3, 0, 33)
cpu_intr_3_110:
	setx	0x2a0307, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_71:
	mov	0x8, %r14
	.word 0xf8f389e0  ! 1542: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T3_asi_reg_wr_72:
	mov	0x38, %r14
	.word 0xf8f389e0  ! 1543: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_3_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_117), 16, 16)) -> intp(3, 0, 4)
	ta	T_CHANGE_TO_TL0
	.word 0xfcad61cf  ! 1550: STBA_I	stba	%r30, [%r21 + 0x01cf] %asi
	.word 0xf0240000  ! 1552: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xf6b4e09c  ! 1555: STHA_I	stha	%r27, [%r19 + 0x009c] %asi
cpu_intr_3_111:
	setx	0x2a031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_118), 16, 16)) -> intp(3, 0, b)
T3_asi_reg_wr_73:
	mov	0x27, %r14
	.word 0xf4f38e60  ! 1566: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T3_asi_reg_wr_74:
	mov	0x3c2, %r14
	.word 0xf2f38e60  ! 1569: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T3_asi_reg_wr_75:
	mov	0xf, %r14
	.word 0xf8f389e0  ! 1570: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_3_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_119), 16, 16)) -> intp(3, 0, 11)
cpu_intr_3_112:
	setx	0x2a000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a46095  ! 1573: STWA_I	stwa	%r24, [%r17 + 0x0095] %asi
	.word 0xf62c8000  ! 1577: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xf2a5e036  ! 1578: STWA_I	stwa	%r25, [%r23 + 0x0036] %asi
cpu_intr_3_113:
	setx	0x2a011a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_120), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_121), 16, 16)) -> intp(3, 0, f)
	ta	T_CHANGE_TO_TL0
cpu_intr_3_114:
	setx	0x2b0211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe8d0000  ! 1592: ANDcc_R	andcc 	%r20, %r0, %r31
	.word 0xf6b5e0dd  ! 1594: STHA_I	stha	%r27, [%r23 + 0x00dd] %asi
	.word 0xb4b4e1e9  ! 1598: ORNcc_I	orncc 	%r19, 0x01e9, %r26
	.word 0xfa744000  ! 1600: STX_R	stx	%r29, [%r17 + %r0]
T3_asi_reg_rd_58:
	mov	0x2a, %r14
	.word 0xf8db8e40  ! 1601: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_122), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf82cc000  ! 1605: STB_R	stb	%r28, [%r19 + %r0]
iob_intr_3_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_123), 16, 16)) -> intp(3, 0, 3b)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbd359000  ! 1609: SRLX_R	srlx	%r22, %r0, %r30
T3_asi_reg_rd_59:
	mov	0x2a, %r14
	.word 0xf2db84a0  ! 1611: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf434c000  ! 1612: STH_R	sth	%r26, [%r19 + %r0]
cpu_intr_3_115:
	setx	0x280129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb424a0ac  ! 1617: SUB_I	sub 	%r18, 0x00ac, %r26
T3_asi_reg_wr_76:
	mov	0x33, %r14
	.word 0xf4f38e60  ! 1619: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb1508000  ! 1620: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xf6350000  ! 1622: STH_R	sth	%r27, [%r20 + %r0]
	.word 0xf4b54020  ! 1624: STHA_R	stha	%r26, [%r21 + %r0] 0x01
T3_asi_reg_rd_60:
	mov	0x29, %r14
	.word 0xf6db8e80  ! 1625: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf8a58020  ! 1626: STWA_R	stwa	%r28, [%r22 + %r0] 0x01
	.word 0xf0250000  ! 1627: STW_R	stw	%r24, [%r20 + %r0]
	.word 0xbd3d2001  ! 1631: SRA_I	sra 	%r20, 0x0001, %r30
	.word 0xf2ac213f  ! 1633: STBA_I	stba	%r25, [%r16 + 0x013f] %asi
T3_asi_reg_rd_61:
	mov	0x18, %r14
	.word 0xfedb84a0  ! 1634: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xba3520ad  ! 1640: ORN_I	orn 	%r20, 0x00ad, %r29
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982802  ! 1642: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0802, %hpstate
T3_asi_reg_rd_62:
	mov	0x29, %r14
	.word 0xf8db8e60  ! 1643: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf025a16b  ! 1648: STW_I	stw	%r24, [%r22 + 0x016b]
iob_intr_3_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_124), 16, 16)) -> intp(3, 0, 5)
	ta	T_CHANGE_TO_TL0
	.word 0xf8b50020  ! 1657: STHA_R	stha	%r28, [%r20 + %r0] 0x01
iob_intr_3_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_125), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_rd_63:
	mov	0x3c7, %r14
	.word 0xfadb8e80  ! 1659: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_3_116:
	setx	0x2a030e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_117:
	setx	0x2b0111, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_118:
	setx	0x29002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983812  ! 1666: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1812, %hpstate
	.word 0xf275a04e  ! 1667: STX_I	stx	%r25, [%r22 + 0x004e]
	.word 0xfaac8020  ! 1670: STBA_R	stba	%r29, [%r18 + %r0] 0x01
	.word 0xf4b42007  ! 1675: STHA_I	stha	%r26, [%r16 + 0x0007] %asi
	.word 0xf6f5e158  ! 1676: STXA_I	stxa	%r27, [%r23 + 0x0158] %asi
	.word 0xfe2de15d  ! 1680: STB_I	stb	%r31, [%r23 + 0x015d]
iob_intr_3_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_126), 16, 16)) -> intp(3, 0, 15)
iob_intr_3_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_127), 16, 16)) -> intp(3, 0, 10)
T3_asi_reg_rd_64:
	mov	0x11, %r14
	.word 0xf0db84a0  ! 1684: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_3_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_128), 16, 16)) -> intp(3, 0, 29)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_129), 16, 16)) -> intp(3, 0, 18)
	.word 0xf8f56174  ! 1690: STXA_I	stxa	%r28, [%r21 + 0x0174] %asi
T3_asi_reg_wr_77:
	mov	0x30, %r14
	.word 0xf0f38e40  ! 1691: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb57d6401  ! 1693: MOVR_I	movre	%r21, 0x1, %r26
iob_intr_3_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_130), 16, 16)) -> intp(3, 0, 19)
T3_asi_reg_wr_78:
	mov	0x3c1, %r14
	.word 0xfaf389e0  ! 1698: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb0244000  ! 1699: SUB_R	sub 	%r17, %r0, %r24
	.word 0xfe348000  ! 1701: STH_R	sth	%r31, [%r18 + %r0]
	.word 0xf2758000  ! 1702: STX_R	stx	%r25, [%r22 + %r0]
cpu_intr_3_119:
	setx	0x2a0306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe3461f5  ! 1704: STH_I	sth	%r31, [%r17 + 0x01f5]
	.word 0xb0bc4000  ! 1705: XNORcc_R	xnorcc 	%r17, %r0, %r24
	.word 0x8d9421ef  ! 1706: WRPR_PSTATE_I	wrpr	%r16, 0x01ef, %pstate
iob_intr_3_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_131), 16, 16)) -> intp(3, 0, 32)
iob_intr_3_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_132), 16, 16)) -> intp(3, 0, 3a)
T3_asi_reg_wr_79:
	mov	0xc, %r14
	.word 0xfcf38e60  ! 1714: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_3_120:
	setx	0x29011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ac4020  ! 1716: STBA_R	stba	%r26, [%r17 + %r0] 0x01
	.word 0xf42de1b0  ! 1717: STB_I	stb	%r26, [%r23 + 0x01b0]
iob_intr_3_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_133), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf6a560c1  ! 1732: STWA_I	stwa	%r27, [%r21 + 0x00c1] %asi
iob_intr_3_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_134), 16, 16)) -> intp(3, 0, 30)
	.word 0xf6a44020  ! 1739: STWA_R	stwa	%r27, [%r17 + %r0] 0x01
T3_asi_reg_rd_65:
	mov	0x2c, %r14
	.word 0xf8db8e40  ! 1740: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf4ada167  ! 1741: STBA_I	stba	%r26, [%r22 + 0x0167] %asi
	.word 0xf2a58020  ! 1742: STWA_R	stwa	%r25, [%r22 + %r0] 0x01
cpu_intr_3_121:
	setx	0x28012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf234205d  ! 1747: STH_I	sth	%r25, [%r16 + 0x005d]
	.word 0xf0ad0020  ! 1750: STBA_R	stba	%r24, [%r20 + %r0] 0x01
	ta	T_CHANGE_HPRIV
iob_intr_3_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_135), 16, 16)) -> intp(3, 0, 3a)
T3_asi_reg_rd_66:
	mov	0x0, %r14
	.word 0xf0db8e60  ! 1757: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_3_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_136), 16, 16)) -> intp(3, 0, 2a)
	.word 0xb2bd8000  ! 1764: XNORcc_R	xnorcc 	%r22, %r0, %r25
	.word 0xb0b44000  ! 1773: SUBCcc_R	orncc 	%r17, %r0, %r24
iob_intr_3_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_137), 16, 16)) -> intp(3, 0, 17)
	.word 0xb5643801  ! 1776: MOVcc_I	<illegal instruction>
	.word 0xf6a5e1ba  ! 1778: STWA_I	stwa	%r27, [%r23 + 0x01ba] %asi
iob_intr_3_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_138), 16, 16)) -> intp(3, 0, 18)
cpu_intr_3_122:
	setx	0x290018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6f521f2  ! 1786: STXA_I	stxa	%r27, [%r20 + 0x01f2] %asi
cpu_intr_3_123:
	setx	0x2b0026, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0x819421d3  ! 1801: WRPR_TPC_I	wrpr	%r16, 0x01d3, %tpc
cpu_intr_3_124:
	setx	0x290011, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_67:
	mov	0x3, %r14
	.word 0xf8db8e40  ! 1805: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983c02  ! 1807: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c02, %hpstate
	ta	T_CHANGE_TO_TL0
iob_intr_3_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_139), 16, 16)) -> intp(3, 0, 23)
iob_intr_3_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_140), 16, 16)) -> intp(3, 0, d)
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_80:
	mov	0x3c0, %r14
	.word 0xf4f384a0  ! 1822: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xfa2c4000  ! 1823: STB_R	stb	%r29, [%r17 + %r0]
cpu_intr_3_125:
	setx	0x290307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b54020  ! 1828: STHA_R	stha	%r26, [%r21 + %r0] 0x01
T3_asi_reg_wr_81:
	mov	0x10, %r14
	.word 0xfaf389e0  ! 1832: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf0b4c020  ! 1837: STHA_R	stha	%r24, [%r19 + %r0] 0x01
T3_asi_reg_rd_68:
	mov	0x27, %r14
	.word 0xf4db8400  ! 1839: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_3_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_141), 16, 16)) -> intp(3, 0, 2)
	.word 0xb4152190  ! 1842: OR_I	or 	%r20, 0x0190, %r26
	.word 0xf4248000  ! 1846: STW_R	stw	%r26, [%r18 + %r0]
	.word 0xb4348000  ! 1847: SUBC_R	orn 	%r18, %r0, %r26
T3_asi_reg_wr_82:
	mov	0x3c1, %r14
	.word 0xf6f38e60  ! 1848: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_3_126:
	setx	0x2b0105, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_127:
	setx	0x2b0316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf675c000  ! 1853: STX_R	stx	%r27, [%r23 + %r0]
	.word 0xf675200e  ! 1857: STX_I	stx	%r27, [%r20 + 0x000e]
	.word 0xf434a07f  ! 1858: STH_I	sth	%r26, [%r18 + 0x007f]
iob_intr_3_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_142), 16, 16)) -> intp(3, 0, 34)
	.word 0xbcb54000  ! 1862: SUBCcc_R	orncc 	%r21, %r0, %r30
	.word 0xf4750000  ! 1865: STX_R	stx	%r26, [%r20 + %r0]
	.word 0xbc14a079  ! 1867: OR_I	or 	%r18, 0x0079, %r30
	.word 0xf22c0000  ! 1869: STB_R	stb	%r25, [%r16 + %r0]
	.word 0xf2a420d9  ! 1870: STWA_I	stwa	%r25, [%r16 + 0x00d9] %asi
iob_intr_3_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_143), 16, 16)) -> intp(3, 0, 34)
T3_asi_reg_rd_69:
	mov	0x29, %r14
	.word 0xfadb8400  ! 1872: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T3_asi_reg_wr_83:
	mov	0x20, %r14
	.word 0xfcf38400  ! 1873: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xfcade000  ! 1874: STBA_I	stba	%r30, [%r23 + 0x0000] %asi
	.word 0xf625e035  ! 1876: STW_I	stw	%r27, [%r23 + 0x0035]
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL0
	.word 0xfe756096  ! 1879: STX_I	stx	%r31, [%r21 + 0x0096]
	.word 0xf8a4a048  ! 1884: STWA_I	stwa	%r28, [%r18 + 0x0048] %asi
	.word 0xb4144000  ! 1888: OR_R	or 	%r17, %r0, %r26
cpu_intr_3_128:
	setx	0x2e001f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_129:
	setx	0x2c032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_130:
	setx	0x2c013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_70:
	mov	0xc, %r14
	.word 0xf8db84a0  ! 1895: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	setx	data_start_1, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982a48  ! 1897: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a48, %hpstate
cpu_intr_3_131:
	setx	0x2f0302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe340000  ! 1907: STH_R	sth	%r31, [%r16 + %r0]
	.word 0xb7508000  ! 1909: RDPR_TSTATE	rdpr	%tstate, %r27
T3_asi_reg_wr_84:
	mov	0xf, %r14
	.word 0xf4f38e60  ! 1912: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_3_132:
	setx	0x2c032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4248000  ! 1914: STW_R	stw	%r26, [%r18 + %r0]
	ta	T_CHANGE_TO_TL1
	.word 0xf22421a2  ! 1918: STW_I	stw	%r25, [%r16 + 0x01a2]
	.word 0xfa35a14f  ! 1919: STH_I	sth	%r29, [%r22 + 0x014f]
cpu_intr_3_133:
	setx	0x2c0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ade19e  ! 1925: STBA_I	stba	%r24, [%r23 + 0x019e] %asi
cpu_intr_3_134:
	setx	0x2003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_3_135:
	setx	0x2f030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_71:
	mov	0xd, %r14
	.word 0xf6db8e40  ! 1931: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf835c000  ! 1933: STH_R	sth	%r28, [%r23 + %r0]
	ta	T_CHANGE_TO_TL1
cpu_intr_3_136:
	setx	0x2d031e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_137:
	setx	0x2f021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53d8000  ! 1940: SRA_R	sra 	%r22, %r0, %r26
cpu_intr_3_138:
	setx	0x2d0116, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_139:
	setx	0x2e0311, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_144), 16, 16)) -> intp(3, 0, 5)
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
	.word 0xf4f461eb  ! 1956: STXA_I	stxa	%r26, [%r17 + 0x01eb] %asi
T3_asi_reg_rd_72:
	mov	0x17, %r14
	.word 0xf4db8e40  ! 1957: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_145), 16, 16)) -> intp(3, 0, 19)
T3_asi_reg_rd_73:
	mov	0x3c3, %r14
	.word 0xfcdb8e80  ! 1962: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbf7dc400  ! 1965: MOVR_R	movre	%r23, %r0, %r31
	.word 0xfe248000  ! 1967: STW_R	stw	%r31, [%r18 + %r0]
iob_intr_3_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_146), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf6b4e0be  ! 1972: STHA_I	stha	%r27, [%r19 + 0x00be] %asi
	.word 0xbf7c0400  ! 1975: MOVR_R	movre	%r16, %r0, %r31
T3_asi_reg_wr_85:
	mov	0x14, %r14
	.word 0xf0f389e0  ! 1976: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_3_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_147), 16, 16)) -> intp(3, 0, 29)
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982f9a  ! 1984: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f9a, %hpstate
iob_intr_3_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_148), 16, 16)) -> intp(3, 0, 9)
T3_asi_reg_rd_74:
	mov	0x3, %r14
	.word 0xf0db8e60  ! 1986: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb53cc000  ! 1987: SRA_R	sra 	%r19, %r0, %r26
	.word 0xb33d0000  ! 1988: SRA_R	sra 	%r20, %r0, %r25
	.word 0xf8f4e15a  ! 1989: STXA_I	stxa	%r28, [%r19 + 0x015a] %asi
cpu_intr_3_140:
	setx	0x2d0330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2c8000  ! 1991: STB_R	stb	%r31, [%r18 + %r0]
	.word 0xf4758000  ! 1992: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xf42c8000  ! 1994: STB_R	stb	%r26, [%r18 + %r0]
	.word 0xf4a46138  ! 1995: STWA_I	stwa	%r26, [%r17 + 0x0138] %asi
	.word 0xf6f4a09b  ! 1996: STXA_I	stxa	%r27, [%r18 + 0x009b] %asi
iob_intr_3_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_149), 16, 16)) -> intp(3, 0, c)
cpu_intr_3_141:
	setx	0x2f012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4348000  ! 2002: STH_R	sth	%r26, [%r18 + %r0]
	.word 0xf8b5c020  ! 2004: STHA_R	stha	%r28, [%r23 + %r0] 0x01
T3_asi_reg_rd_75:
	mov	0x2, %r14
	.word 0xf0db8e60  ! 2005: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_3_142:
	setx	0x2f020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe05e03d  ! 2007: ADD_I	add 	%r23, 0x003d, %r31
iob_intr_3_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_150), 16, 16)) -> intp(3, 0, 25)
cpu_intr_3_143:
	setx	0x2f033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_76:
	mov	0x3c6, %r14
	.word 0xf0db84a0  ! 2013: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_3_144:
	setx	0x2d0117, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_145:
	setx	0x2f010c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_146:
	setx	0x2f0005, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_147:
	setx	0x2c0038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_151), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_148:
	setx	0x2d010a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_149:
	setx	0x2d0204, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_150:
	setx	0x2c010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb43d4000  ! 2031: XNOR_R	xnor 	%r21, %r0, %r26
cpu_intr_3_151:
	setx	0x2d022b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_152:
	setx	0x2e0205, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_153:
	setx	0x2c0027, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_86:
	mov	0x2c, %r14
	.word 0xf8f38400  ! 2040: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf2246110  ! 2044: STW_I	stw	%r25, [%r17 + 0x0110]
	.word 0xfc744000  ! 2045: STX_R	stx	%r30, [%r17 + %r0]
	.word 0xfc2d0000  ! 2047: STB_R	stb	%r30, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0xf0a5c020  ! 2049: STWA_R	stwa	%r24, [%r23 + %r0] 0x01
	.word 0xb8140000  ! 2053: OR_R	or 	%r16, %r0, %r28
	.word 0xf834609b  ! 2054: STH_I	sth	%r28, [%r17 + 0x009b]
	.word 0xfc748000  ! 2055: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xfca4a1ad  ! 2063: STWA_I	stwa	%r30, [%r18 + 0x01ad] %asi
T3_asi_reg_rd_77:
	mov	0x36, %r14
	.word 0xfedb8e40  ! 2065: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_wr_87:
	mov	0x10, %r14
	.word 0xf6f389e0  ! 2066: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T3_asi_reg_rd_78:
	mov	0x3c1, %r14
	.word 0xf4db8e80  ! 2068: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x8198384a  ! 2076: WRHPR_HPSTATE_I	wrhpr	%r0, 0x184a, %hpstate
	.word 0xbb2df001  ! 2077: SLLX_I	sllx	%r23, 0x0001, %r29
	.word 0xf8b58020  ! 2078: STHA_R	stha	%r28, [%r22 + %r0] 0x01
	.word 0x9195e18d  ! 2079: WRPR_PIL_I	wrpr	%r23, 0x018d, %pil
cpu_intr_3_154:
	setx	0x2e0025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa5c020  ! 2084: STWA_R	stwa	%r29, [%r23 + %r0] 0x01
	.word 0xf0f4e06d  ! 2086: STXA_I	stxa	%r24, [%r19 + 0x006d] %asi
iob_intr_3_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_152), 16, 16)) -> intp(3, 0, 11)
T3_asi_reg_wr_88:
	mov	0x3c4, %r14
	.word 0xf4f38e60  ! 2091: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_3_155:
	setx	0x2d0213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc0cc000  ! 2093: AND_R	and 	%r19, %r0, %r30
	.word 0xf02c0000  ! 2094: STB_R	stb	%r24, [%r16 + %r0]
T3_asi_reg_rd_79:
	mov	0x16, %r14
	.word 0xfcdb8e40  ! 2095: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_153), 16, 16)) -> intp(3, 0, 3f)
	.word 0xb4348000  ! 2100: SUBC_R	orn 	%r18, %r0, %r26
	ta	T_CHANGE_TO_TL0
	.word 0xf6aca116  ! 2103: STBA_I	stba	%r27, [%r18 + 0x0116] %asi
cpu_intr_3_156:
	setx	0x2d0009, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_157:
	setx	0x2c0326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf024a02c  ! 2107: STW_I	stw	%r24, [%r18 + 0x002c]
	.word 0xf625c000  ! 2109: STW_R	stw	%r27, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_158:
	setx	0x2c0112, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xfa2cc000  ! 2113: STB_R	stb	%r29, [%r19 + %r0]
T3_asi_reg_wr_89:
	mov	0x38, %r14
	.word 0xf4f38400  ! 2119: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf024c000  ! 2120: STW_R	stw	%r24, [%r19 + %r0]
T3_asi_reg_wr_90:
	mov	0x3c7, %r14
	.word 0xfcf38e60  ! 2122: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2a5a0ba  ! 2124: STWA_I	stwa	%r25, [%r22 + 0x00ba] %asi
iob_intr_3_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_154), 16, 16)) -> intp(3, 0, 30)
	.word 0xb7518000  ! 2131: RDPR_PSTATE	rdpr	%pstate, %r27
T3_asi_reg_rd_80:
	mov	0xf, %r14
	.word 0xf6db8e40  ! 2132: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_159:
	setx	0x2c0302, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_160:
	setx	0x2f021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa5209c  ! 2136: STWA_I	stwa	%r29, [%r20 + 0x009c] %asi
iob_intr_3_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_155), 16, 16)) -> intp(3, 0, 10)
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982e8a  ! 2138: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8a, %hpstate
cpu_intr_3_161:
	setx	0x2c021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ad2054  ! 2141: STBA_I	stba	%r27, [%r20 + 0x0054] %asi
iob_intr_3_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_156), 16, 16)) -> intp(3, 0, 6)
	.word 0xb72c6001  ! 2144: SLL_I	sll 	%r17, 0x0001, %r27
	.word 0xf0250000  ! 2146: STW_R	stw	%r24, [%r20 + %r0]
cpu_intr_3_162:
	setx	0x2c010d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_91:
	mov	0x3c3, %r14
	.word 0xfcf38e60  ! 2148: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf8adc020  ! 2150: STBA_R	stba	%r28, [%r23 + %r0] 0x01
cpu_intr_3_163:
	setx	0x2f0105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f421d5  ! 2153: STXA_I	stxa	%r25, [%r16 + 0x01d5] %asi
	ta	T_CHANGE_HPRIV
cpu_intr_3_164:
	setx	0x2e0031, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_81:
	mov	0x37, %r14
	.word 0xfedb84a0  ! 2159: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xfcb4215b  ! 2160: STHA_I	stha	%r30, [%r16 + 0x015b] %asi
	.word 0xfcb521d9  ! 2161: STHA_I	stha	%r30, [%r20 + 0x01d9] %asi
cpu_intr_3_165:
	setx	0x2f031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_157), 16, 16)) -> intp(3, 0, 17)
cpu_intr_3_166:
	setx	0x2c031a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_158), 16, 16)) -> intp(3, 0, 28)
cpu_intr_3_167:
	setx	0x2f0219, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_82:
	mov	0x29, %r14
	.word 0xf8db8e80  ! 2176: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb93d2001  ! 2177: SRA_I	sra 	%r20, 0x0001, %r28
	.word 0xfe758000  ! 2178: STX_R	stx	%r31, [%r22 + %r0]
T3_asi_reg_rd_83:
	mov	0x3c2, %r14
	.word 0xf8db8400  ! 2179: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xa1902000  ! 2180: WRPR_GL_I	wrpr	%r0, 0x0000, %-
T3_asi_reg_wr_92:
	mov	0x3c6, %r14
	.word 0xfaf38e60  ! 2181: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T3_asi_reg_wr_93:
	mov	0x3c8, %r14
	.word 0xf8f389e0  ! 2182: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xfc2de083  ! 2185: STB_I	stb	%r30, [%r23 + 0x0083]
	.word 0xf4758000  ! 2187: STX_R	stx	%r26, [%r22 + %r0]
cpu_intr_3_168:
	setx	0x2f0003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ad4020  ! 2189: STBA_R	stba	%r28, [%r21 + %r0] 0x01
	.word 0xf6b4215b  ! 2191: STHA_I	stha	%r27, [%r16 + 0x015b] %asi
	.word 0xfcb5c020  ! 2192: STHA_R	stha	%r30, [%r23 + %r0] 0x01
	.word 0xf435e021  ! 2195: STH_I	sth	%r26, [%r23 + 0x0021]
T3_asi_reg_rd_84:
	mov	0x14, %r14
	.word 0xfcdb84a0  ! 2197: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_3_169:
	setx	0x2d023f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_170:
	setx	0x2d0227, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_159), 16, 16)) -> intp(3, 0, 21)
iob_intr_3_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_160), 16, 16)) -> intp(3, 0, c)
	.word 0xfeb4a01f  ! 2205: STHA_I	stha	%r31, [%r18 + 0x001f] %asi
	.word 0xf0b461c5  ! 2206: STHA_I	stha	%r24, [%r17 + 0x01c5] %asi
	.word 0xfcb56163  ! 2207: STHA_I	stha	%r30, [%r21 + 0x0163] %asi
	.word 0xf8a52101  ! 2209: STWA_I	stwa	%r28, [%r20 + 0x0101] %asi
	.word 0xba94e10d  ! 2213: ORcc_I	orcc 	%r19, 0x010d, %r29
cpu_intr_3_171:
	setx	0x2f003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982f52  ! 2216: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f52, %hpstate
cpu_intr_3_172:
	setx	0x2c0110, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
	.word 0xf42d8000  ! 2228: STB_R	stb	%r26, [%r22 + %r0]
iob_intr_3_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_161), 16, 16)) -> intp(3, 0, 35)
	.word 0xfe750000  ! 2230: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xf0b40020  ! 2233: STHA_R	stha	%r24, [%r16 + %r0] 0x01
	.word 0xf4b58020  ! 2234: STHA_R	stha	%r26, [%r22 + %r0] 0x01
	.word 0xbc44a0cc  ! 2235: ADDC_I	addc 	%r18, 0x00cc, %r30
cpu_intr_3_173:
	setx	0x2e023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_94:
	mov	0x3c4, %r14
	.word 0xf2f389e0  ! 2239: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xfcf5e174  ! 2240: STXA_I	stxa	%r30, [%r23 + 0x0174] %asi
	.word 0xb29ce186  ! 2242: XORcc_I	xorcc 	%r19, 0x0186, %r25
	.word 0xfa2d4000  ! 2244: STB_R	stb	%r29, [%r21 + %r0]
T3_asi_reg_rd_85:
	mov	0x34, %r14
	.word 0xf0db8e80  ! 2245: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T3_asi_reg_wr_95:
	mov	0x1d, %r14
	.word 0xf6f38e80  ! 2249: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf02c60e3  ! 2251: STB_I	stb	%r24, [%r17 + 0x00e3]
cpu_intr_3_174:
	setx	0x2c0317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0752134  ! 2254: STX_I	stx	%r24, [%r20 + 0x0134]
	.word 0xfab4e07f  ! 2255: STHA_I	stha	%r29, [%r19 + 0x007f] %asi
	.word 0xb4346106  ! 2256: ORN_I	orn 	%r17, 0x0106, %r26
	.word 0xfe348000  ! 2257: STH_R	sth	%r31, [%r18 + %r0]
	.word 0xf07460b1  ! 2259: STX_I	stx	%r24, [%r17 + 0x00b1]
	.word 0xf6a48020  ! 2260: STWA_R	stwa	%r27, [%r18 + %r0] 0x01
cpu_intr_3_175:
	setx	0x2c032d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_162), 16, 16)) -> intp(3, 0, 6)
	.word 0xf6344000  ! 2265: STH_R	sth	%r27, [%r17 + %r0]
T3_asi_reg_wr_96:
	mov	0x3c6, %r14
	.word 0xf6f38400  ! 2266: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbc158000  ! 2273: OR_R	or 	%r22, %r0, %r30
cpu_intr_3_176:
	setx	0x2f0314, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_177:
	setx	0x2f0103, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_163), 16, 16)) -> intp(3, 0, 15)
	.word 0xfc2c60e3  ! 2281: STB_I	stb	%r30, [%r17 + 0x00e3]
iob_intr_3_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_164), 16, 16)) -> intp(3, 0, 34)
	.word 0xfa354000  ! 2285: STH_R	sth	%r29, [%r21 + %r0]
	.word 0xb2b46128  ! 2286: ORNcc_I	orncc 	%r17, 0x0128, %r25
T3_asi_reg_wr_97:
	mov	0x4, %r14
	.word 0xfaf389e0  ! 2287: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf4f42185  ! 2288: STXA_I	stxa	%r26, [%r16 + 0x0185] %asi
T3_asi_reg_rd_86:
	mov	0x3c7, %r14
	.word 0xf0db8e80  ! 2289: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_3_178:
	setx	0x2f013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaad4020  ! 2292: STBA_R	stba	%r29, [%r21 + %r0] 0x01
	.word 0xfca5a05c  ! 2293: STWA_I	stwa	%r30, [%r22 + 0x005c] %asi
iob_intr_3_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_165), 16, 16)) -> intp(3, 0, d)
iob_intr_3_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_166), 16, 16)) -> intp(3, 0, c)
	.word 0xfc2d8000  ! 2298: STB_R	stb	%r30, [%r22 + %r0]
T3_asi_reg_wr_98:
	mov	0xb, %r14
	.word 0xf6f38e40  ! 2299: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	.word 0xf825a14e  ! 2302: STW_I	stw	%r28, [%r22 + 0x014e]
iob_intr_3_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_167), 16, 16)) -> intp(3, 0, 1b)
	.word 0xfa2c8000  ! 2304: STB_R	stb	%r29, [%r18 + %r0]
	.word 0xb61d20ec  ! 2308: XOR_I	xor 	%r20, 0x00ec, %r27
	.word 0xb62da0b9  ! 2309: ANDN_I	andn 	%r22, 0x00b9, %r27
cpu_intr_3_179:
	setx	0x300015, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xb0a5e174  ! 2319: SUBcc_I	subcc 	%r23, 0x0174, %r24
	.word 0xf6ad4020  ! 2320: STBA_R	stba	%r27, [%r21 + %r0] 0x01
	.word 0xb7352001  ! 2322: SRL_I	srl 	%r20, 0x0001, %r27
	.word 0xf42da16a  ! 2323: STB_I	stb	%r26, [%r22 + 0x016a]
	.word 0xfc752192  ! 2324: STX_I	stx	%r30, [%r20 + 0x0192]
	.word 0xfa244000  ! 2325: STW_R	stw	%r29, [%r17 + %r0]
T3_asi_reg_rd_87:
	mov	0x8, %r14
	.word 0xfedb8e60  ! 2327: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_3_180:
	setx	0x32023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ad607d  ! 2330: STBA_I	stba	%r26, [%r21 + 0x007d] %asi
T3_asi_reg_wr_99:
	mov	0x3c6, %r14
	.word 0xf0f384a0  ! 2333: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_3_181:
	setx	0x320214, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_100:
	mov	0x3c1, %r14
	.word 0xf6f389e0  ! 2336: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_3_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_168), 16, 16)) -> intp(3, 0, a)
	.word 0xf62d8000  ! 2339: STB_R	stb	%r27, [%r22 + %r0]
	.word 0xb415c000  ! 2341: OR_R	or 	%r23, %r0, %r26
	.word 0xf8a56180  ! 2345: STWA_I	stwa	%r28, [%r21 + 0x0180] %asi
cpu_intr_3_182:
	setx	0x320012, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_169), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_183:
	setx	0x310209, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_170), 16, 16)) -> intp(3, 0, 11)
iob_intr_3_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_171), 16, 16)) -> intp(3, 0, 38)
	.word 0xbb50c000  ! 2363: RDPR_TT	rdpr	%tt, %r29
	.word 0xf2b4a047  ! 2364: STHA_I	stha	%r25, [%r18 + 0x0047] %asi
T3_asi_reg_rd_88:
	mov	0x21, %r14
	.word 0xf0db8e80  ! 2368: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xfc244000  ! 2369: STW_R	stw	%r30, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf0adc020  ! 2372: STBA_R	stba	%r24, [%r23 + %r0] 0x01
T3_asi_reg_rd_89:
	mov	0x3c3, %r14
	.word 0xf8db84a0  ! 2376: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_3_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_172), 16, 16)) -> intp(3, 0, 13)
T3_asi_reg_wr_101:
	mov	0x27, %r14
	.word 0xf2f384a0  ! 2380: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb9480000  ! 2385: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
T3_asi_reg_rd_90:
	mov	0x23, %r14
	.word 0xf2db8e40  ! 2387: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T3_asi_reg_rd_91:
	mov	0x3c0, %r14
	.word 0xf4db89e0  ! 2388: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf8f5a1a4  ! 2391: STXA_I	stxa	%r28, [%r22 + 0x01a4] %asi
T3_asi_reg_rd_92:
	mov	0xa, %r14
	.word 0xfcdb8e40  ! 2393: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfea460b8  ! 2399: STWA_I	stwa	%r31, [%r17 + 0x00b8] %asi
	.word 0xfeb50020  ! 2400: STHA_R	stha	%r31, [%r20 + %r0] 0x01
T3_asi_reg_wr_102:
	mov	0x1b, %r14
	.word 0xf8f38e40  ! 2403: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc748000  ! 2406: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xb43c8000  ! 2407: XNOR_R	xnor 	%r18, %r0, %r26
	ta	T_CHANGE_TO_TL0
iob_intr_3_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_173), 16, 16)) -> intp(3, 0, 0)
T3_asi_reg_wr_103:
	mov	0x3c8, %r14
	.word 0xfcf38e60  ! 2411: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf035a17f  ! 2412: STH_I	sth	%r24, [%r22 + 0x017f]
iob_intr_3_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_174), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf0248000  ! 2419: STW_R	stw	%r24, [%r18 + %r0]
	.word 0xfcb58020  ! 2420: STHA_R	stha	%r30, [%r22 + %r0] 0x01
cpu_intr_3_184:
	setx	0x330330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a4a171  ! 2423: STWA_I	stwa	%r26, [%r18 + 0x0171] %asi
cpu_intr_3_185:
	setx	0x310130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcad20e7  ! 2426: STBA_I	stba	%r30, [%r20 + 0x00e7] %asi
T3_asi_reg_rd_93:
	mov	0x1b, %r14
	.word 0xf4db8e40  ! 2427: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_175), 16, 16)) -> intp(3, 0, 21)
iob_intr_3_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_176), 16, 16)) -> intp(3, 0, 2a)
T3_asi_reg_wr_104:
	mov	0x11, %r14
	.word 0xf2f38e40  ! 2433: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_3_186:
	setx	0x310311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc34205e  ! 2442: STH_I	sth	%r30, [%r16 + 0x005e]
	.word 0xf0756141  ! 2443: STX_I	stx	%r24, [%r21 + 0x0141]
T3_asi_reg_wr_105:
	mov	0x3c8, %r14
	.word 0xf6f384a0  ! 2444: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_3_187:
	setx	0x310304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_177), 16, 16)) -> intp(3, 0, 1b)
	.word 0xfeb5a09c  ! 2448: STHA_I	stha	%r31, [%r22 + 0x009c] %asi
	.word 0xf62d2108  ! 2451: STB_I	stb	%r27, [%r20 + 0x0108]
	.word 0xbd51c000  ! 2452: RDPR_TL	<illegal instruction>
	.word 0xf47461cf  ! 2453: STX_I	stx	%r26, [%r17 + 0x01cf]
	.word 0xfead0020  ! 2454: STBA_R	stba	%r31, [%r20 + %r0] 0x01
cpu_intr_3_188:
	setx	0x33030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_94:
	mov	0x14, %r14
	.word 0xfcdb8e80  ! 2462: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_3_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_178), 16, 16)) -> intp(3, 0, 30)
T3_asi_reg_rd_95:
	mov	0x3c6, %r14
	.word 0xf0db8e40  ! 2465: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983b52  ! 2466: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b52, %hpstate
iob_intr_3_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_179), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf4a48020  ! 2471: STWA_R	stwa	%r26, [%r18 + %r0] 0x01
	.word 0xfc2ce02c  ! 2477: STB_I	stb	%r30, [%r19 + 0x002c]
	.word 0xbcb5e03e  ! 2481: SUBCcc_I	orncc 	%r23, 0x003e, %r30
	ta	T_CHANGE_HPRIV
	.word 0xfea40020  ! 2487: STWA_R	stwa	%r31, [%r16 + %r0] 0x01
	.word 0xf4246150  ! 2490: STW_I	stw	%r26, [%r17 + 0x0150]
cpu_intr_3_189:
	setx	0x330035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeade103  ! 2495: STBA_I	stba	%r31, [%r23 + 0x0103] %asi
	.word 0xfcb52074  ! 2496: STHA_I	stha	%r30, [%r20 + 0x0074] %asi
cpu_intr_3_190:
	setx	0x300213, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_191:
	setx	0x32003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a58020  ! 2502: STWA_R	stwa	%r27, [%r22 + %r0] 0x01
	.word 0xfef420fc  ! 2505: STXA_I	stxa	%r31, [%r16 + 0x00fc] %asi
	ta	T_CHANGE_NONHPRIV
	.word 0xf2a40020  ! 2510: STWA_R	stwa	%r25, [%r16 + %r0] 0x01
	.word 0xfab4c020  ! 2511: STHA_R	stha	%r29, [%r19 + %r0] 0x01
	.word 0xf0344000  ! 2513: STH_R	sth	%r24, [%r17 + %r0]
	.word 0xf8250000  ! 2514: STW_R	stw	%r28, [%r20 + %r0]
	.word 0xfcf4e0a9  ! 2515: STXA_I	stxa	%r30, [%r19 + 0x00a9] %asi
	.word 0xfc35615d  ! 2516: STH_I	sth	%r30, [%r21 + 0x015d]
T3_asi_reg_wr_106:
	mov	0x12, %r14
	.word 0xf4f389e0  ! 2517: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_3_192:
	setx	0x310005, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_96:
	mov	0x3c1, %r14
	.word 0xf8db8e40  ! 2520: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf8f5202f  ! 2521: STXA_I	stxa	%r28, [%r20 + 0x002f] %asi
	.word 0xb9504000  ! 2526: RDPR_TNPC	rdpr	%tnpc, %r28
T3_asi_reg_rd_97:
	mov	0x3c8, %r14
	.word 0xfedb8e60  ! 2540: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_3_193:
	setx	0x330225, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_194:
	setx	0x300004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd2c8000  ! 2545: SLL_R	sll 	%r18, %r0, %r30
cpu_intr_3_195:
	setx	0x330229, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_107:
	mov	0x4, %r14
	.word 0xf8f38e60  ! 2548: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_3_196:
	setx	0x32010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8bc0000  ! 2550: XNORcc_R	xnorcc 	%r16, %r0, %r28
	.word 0xfeac0020  ! 2553: STBA_R	stba	%r31, [%r16 + %r0] 0x01
	.word 0xf6b54020  ! 2556: STHA_R	stha	%r27, [%r21 + %r0] 0x01
cpu_intr_3_197:
	setx	0x320119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a521e3  ! 2563: STWA_I	stwa	%r25, [%r20 + 0x01e3] %asi
	ta	T_CHANGE_TO_TL1
cpu_intr_3_198:
	setx	0x310013, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_199:
	setx	0x330205, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_200:
	setx	0x32021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf274e0ee  ! 2576: STX_I	stx	%r25, [%r19 + 0x00ee]
	.word 0xf8a44020  ! 2584: STWA_R	stwa	%r28, [%r17 + %r0] 0x01
iob_intr_3_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_180), 16, 16)) -> intp(3, 0, 3e)
	.word 0xfa34a1eb  ! 2587: STH_I	sth	%r29, [%r18 + 0x01eb]
	.word 0xf82d6065  ! 2588: STB_I	stb	%r28, [%r21 + 0x0065]
iob_intr_3_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_181), 16, 16)) -> intp(3, 0, 14)
iob_intr_3_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_182), 16, 16)) -> intp(3, 0, 36)
	.word 0xf4aca100  ! 2592: STBA_I	stba	%r26, [%r18 + 0x0100] %asi
iob_intr_3_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_183), 16, 16)) -> intp(3, 0, 7)
T3_asi_reg_wr_108:
	mov	0xe, %r14
	.word 0xf2f38e60  ! 2595: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf02c4000  ! 2596: STB_R	stb	%r24, [%r17 + %r0]
T3_asi_reg_wr_109:
	mov	0x15, %r14
	.word 0xf4f389e0  ! 2597: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_3_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_184), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_rd_98:
	mov	0x3c0, %r14
	.word 0xf6db84a0  ! 2599: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf0750000  ! 2601: STX_R	stx	%r24, [%r20 + %r0]
	ta	T_CHANGE_TO_TL1
	.word 0xf62c2101  ! 2604: STB_I	stb	%r27, [%r16 + 0x0101]
	.word 0xfc358000  ! 2607: STH_R	sth	%r30, [%r22 + %r0]
	.word 0xfe240000  ! 2608: STW_R	stw	%r31, [%r16 + %r0]
	.word 0xfc346032  ! 2610: STH_I	sth	%r30, [%r17 + 0x0032]
iob_intr_3_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_185), 16, 16)) -> intp(3, 0, 29)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_99:
	mov	0x8, %r14
	.word 0xf8db8e80  ! 2618: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xfeb5e10a  ! 2620: STHA_I	stha	%r31, [%r23 + 0x010a] %asi
	.word 0xf6a58020  ! 2624: STWA_R	stwa	%r27, [%r22 + %r0] 0x01
	.word 0xfe2d60ef  ! 2625: STB_I	stb	%r31, [%r21 + 0x00ef]
	.word 0xfea58020  ! 2626: STWA_R	stwa	%r31, [%r22 + %r0] 0x01
cpu_intr_3_201:
	setx	0x310123, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983cca  ! 2629: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cca, %hpstate
iob_intr_3_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_186), 16, 16)) -> intp(3, 0, 1d)
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_202:
	setx	0x330333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc74211c  ! 2638: STX_I	stx	%r30, [%r16 + 0x011c]
iob_intr_3_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_187), 16, 16)) -> intp(3, 0, 5)
iob_intr_3_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_188), 16, 16)) -> intp(3, 0, 11)
	.word 0xfaa5c020  ! 2642: STWA_R	stwa	%r29, [%r23 + %r0] 0x01
cpu_intr_3_203:
	setx	0x320306, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_189), 16, 16)) -> intp(3, 0, 1e)
	ta	T_CHANGE_TO_TL1
	.word 0xf4ac8020  ! 2650: STBA_R	stba	%r26, [%r18 + %r0] 0x01
T3_asi_reg_rd_100:
	mov	0x1b, %r14
	.word 0xfcdb8e40  ! 2651: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf0a460f7  ! 2653: STWA_I	stwa	%r24, [%r17 + 0x00f7] %asi
cpu_intr_3_204:
	setx	0x330337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb37d8400  ! 2655: MOVR_R	movre	%r22, %r0, %r25
	.word 0xfea40020  ! 2656: STWA_R	stwa	%r31, [%r16 + %r0] 0x01
	.word 0xf4ac8020  ! 2657: STBA_R	stba	%r26, [%r18 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_205:
	setx	0x310106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0240000  ! 2662: STW_R	stw	%r24, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0xf02560b6  ! 2665: STW_I	stw	%r24, [%r21 + 0x00b6]
	.word 0xf2ac0020  ! 2667: STBA_R	stba	%r25, [%r16 + %r0] 0x01
	.word 0xfca4c020  ! 2668: STWA_R	stwa	%r30, [%r19 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf0f4617f  ! 2671: STXA_I	stxa	%r24, [%r17 + 0x017f] %asi
iob_intr_3_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_190), 16, 16)) -> intp(3, 0, 6)
T3_asi_reg_rd_101:
	mov	0x25, %r14
	.word 0xfadb84a0  ! 2673: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbabce092  ! 2676: XNORcc_I	xnorcc 	%r19, 0x0092, %r29
	ta	T_CHANGE_NONHPRIV
	.word 0xfab48020  ! 2679: STHA_R	stha	%r29, [%r18 + %r0] 0x01
	.word 0xb8046099  ! 2680: ADD_I	add 	%r17, 0x0099, %r28
	.word 0xf2a461a9  ! 2684: STWA_I	stwa	%r25, [%r17 + 0x01a9] %asi
iob_intr_3_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_191), 16, 16)) -> intp(3, 0, 19)
iob_intr_3_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_192), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_206:
	setx	0x31001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4f5e101  ! 2697: STXA_I	stxa	%r26, [%r23 + 0x0101] %asi
	.word 0xf22c21db  ! 2699: STB_I	stb	%r25, [%r16 + 0x01db]
	.word 0xbe050000  ! 2700: ADD_R	add 	%r20, %r0, %r31
	ta	T_CHANGE_HPRIV
	.word 0xfa24c000  ! 2703: STW_R	stw	%r29, [%r19 + %r0]
	.word 0xf6254000  ! 2707: STW_R	stw	%r27, [%r21 + %r0]
	.word 0xbac42055  ! 2708: ADDCcc_I	addccc 	%r16, 0x0055, %r29
	.word 0x919561f6  ! 2712: WRPR_PIL_I	wrpr	%r21, 0x01f6, %pil
	.word 0xfaa46071  ! 2715: STWA_I	stwa	%r29, [%r17 + 0x0071] %asi
cpu_intr_3_207:
	setx	0x300205, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982b92  ! 2717: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b92, %hpstate
cpu_intr_3_208:
	setx	0x32011a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_209:
	setx	0x30030e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_210:
	setx	0x320309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf074a0aa  ! 2729: STX_I	stx	%r24, [%r18 + 0x00aa]
	.word 0xf875e191  ! 2731: STX_I	stx	%r28, [%r23 + 0x0191]
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982e48  ! 2733: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e48, %hpstate
iob_intr_3_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_193), 16, 16)) -> intp(3, 0, 13)
	.word 0xb93c8000  ! 2739: SRA_R	sra 	%r18, %r0, %r28
	ta	T_CHANGE_TO_TL0
	.word 0xfaac2021  ! 2742: STBA_I	stba	%r29, [%r16 + 0x0021] %asi
iob_intr_3_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_194), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_195), 16, 16)) -> intp(3, 0, 18)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf2ad4020  ! 2756: STBA_R	stba	%r25, [%r21 + %r0] 0x01
cpu_intr_3_211:
	setx	0x32001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02c218e  ! 2758: STB_I	stb	%r24, [%r16 + 0x018e]
	.word 0xfcac8020  ! 2760: STBA_R	stba	%r30, [%r18 + %r0] 0x01
cpu_intr_3_212:
	setx	0x310107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaaca162  ! 2763: STBA_I	stba	%r29, [%r18 + 0x0162] %asi
	.word 0xf2a40020  ! 2765: STWA_R	stwa	%r25, [%r16 + %r0] 0x01
iob_intr_3_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_196), 16, 16)) -> intp(3, 0, 0)
	.word 0xf8a4601f  ! 2768: STWA_I	stwa	%r28, [%r17 + 0x001f] %asi
cpu_intr_3_213:
	setx	0x33003c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_214:
	setx	0x320129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_215:
	setx	0x33021f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_216:
	setx	0x300020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaade073  ! 2777: STBA_I	stba	%r29, [%r23 + 0x0073] %asi
	.word 0xf82cc000  ! 2778: STB_R	stb	%r28, [%r19 + %r0]
	.word 0xf6ada1d1  ! 2780: STBA_I	stba	%r27, [%r22 + 0x01d1] %asi
	.word 0xfe2c0000  ! 2782: STB_R	stb	%r31, [%r16 + %r0]
	ta	T_CHANGE_TO_TL1
	.word 0xf0ad8020  ! 2789: STBA_R	stba	%r24, [%r22 + %r0] 0x01
	.word 0xb405e1c0  ! 2790: ADD_I	add 	%r23, 0x01c0, %r26
T3_asi_reg_wr_110:
	mov	0x4, %r14
	.word 0xf2f38400  ! 2793: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T3_asi_reg_rd_102:
	mov	0x3c4, %r14
	.word 0xfedb89e0  ! 2794: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T3_asi_reg_wr_111:
	mov	0x3c6, %r14
	.word 0xf8f38e40  ! 2798: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb2140000  ! 2799: OR_R	or 	%r16, %r0, %r25
	.word 0xfaa46035  ! 2800: STWA_I	stwa	%r29, [%r17 + 0x0035] %asi
	.word 0xfc240000  ! 2803: STW_R	stw	%r30, [%r16 + %r0]
cpu_intr_3_217:
	setx	0x32002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf02561cb  ! 2808: STW_I	stw	%r24, [%r21 + 0x01cb]
	.word 0xfa750000  ! 2810: STX_R	stx	%r29, [%r20 + %r0]
iob_intr_3_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_197), 16, 16)) -> intp(3, 0, c)
iob_intr_3_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_198), 16, 16)) -> intp(3, 0, 19)
	.word 0xf07560cc  ! 2814: STX_I	stx	%r24, [%r21 + 0x00cc]
	.word 0xfcac0020  ! 2818: STBA_R	stba	%r30, [%r16 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
	.word 0xf6f5e03f  ! 2824: STXA_I	stxa	%r27, [%r23 + 0x003f] %asi
T3_asi_reg_rd_103:
	mov	0x13, %r14
	.word 0xfcdb84a0  ! 2825: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xfc25c000  ! 2826: STW_R	stw	%r30, [%r23 + %r0]
	.word 0xf8b40020  ! 2828: STHA_R	stha	%r28, [%r16 + %r0] 0x01
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x8198289a  ! 2831: WRHPR_HPSTATE_I	wrhpr	%r0, 0x089a, %hpstate
iob_intr_3_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_199), 16, 16)) -> intp(3, 0, 5)
	.word 0xb8358000  ! 2837: ORN_R	orn 	%r22, %r0, %r28
T3_asi_reg_rd_104:
	mov	0x3c1, %r14
	.word 0xfadb84a0  ! 2838: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xfc75a008  ! 2839: STX_I	stx	%r30, [%r22 + 0x0008]
iob_intr_3_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_200), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf234e123  ! 2845: STH_I	sth	%r25, [%r19 + 0x0123]
T3_asi_reg_wr_112:
	mov	0x6, %r14
	.word 0xf0f38e40  ! 2849: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x819829da  ! 2852: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09da, %hpstate
	.word 0xf63461c1  ! 2853: STH_I	sth	%r27, [%r17 + 0x01c1]
cpu_intr_3_218:
	setx	0x370028, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_105:
	mov	0x15, %r14
	.word 0xfadb8400  ! 2856: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_3_219:
	setx	0x370212, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_220:
	setx	0x340109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_201), 16, 16)) -> intp(3, 0, 25)
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983a92  ! 2866: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a92, %hpstate
	.word 0xfaf4e19f  ! 2867: STXA_I	stxa	%r29, [%r19 + 0x019f] %asi
iob_intr_3_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_202), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf4350000  ! 2874: STH_R	sth	%r26, [%r20 + %r0]
T3_asi_reg_wr_113:
	mov	0xf, %r14
	.word 0xf4f389e0  ! 2876: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982d10  ! 2883: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d10, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_203), 16, 16)) -> intp(3, 0, 37)
	.word 0xbabdc000  ! 2886: XNORcc_R	xnorcc 	%r23, %r0, %r29
	.word 0xf2adc020  ! 2890: STBA_R	stba	%r25, [%r23 + %r0] 0x01
	.word 0xfcac21f9  ! 2892: STBA_I	stba	%r30, [%r16 + 0x01f9] %asi
	.word 0xf4354000  ! 2894: STH_R	sth	%r26, [%r21 + %r0]
T3_asi_reg_wr_114:
	mov	0x4, %r14
	.word 0xfcf38e80  ! 2895: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_3_221:
	setx	0x350325, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_204), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_222:
	setx	0x370000, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_115:
	mov	0x8, %r14
	.word 0xfaf38400  ! 2900: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_3_223:
	setx	0x370105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaada1b1  ! 2902: STBA_I	stba	%r29, [%r22 + 0x01b1] %asi
T3_asi_reg_rd_106:
	mov	0xd, %r14
	.word 0xf8db89e0  ! 2903: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T3_asi_reg_rd_107:
	mov	0x24, %r14
	.word 0xf4db8e40  ! 2904: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfaf5a0e7  ! 2905: STXA_I	stxa	%r29, [%r22 + 0x00e7] %asi
T3_asi_reg_wr_116:
	mov	0x3c4, %r14
	.word 0xfcf38e80  ! 2906: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T3_asi_reg_wr_117:
	mov	0x3c6, %r14
	.word 0xfef38e80  ! 2912: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_3_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_205), 16, 16)) -> intp(3, 0, 2c)
iob_intr_3_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_206), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_224:
	setx	0x340220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ad20a6  ! 2922: STBA_I	stba	%r26, [%r20 + 0x00a6] %asi
iob_intr_3_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_207), 16, 16)) -> intp(3, 0, e)
	.word 0xfa2c4000  ! 2928: STB_R	stb	%r29, [%r17 + %r0]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_108:
	mov	0x3c0, %r14
	.word 0xfedb8e80  ! 2931: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_3_225:
	setx	0x340113, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_118:
	mov	0x3c3, %r14
	.word 0xfcf38400  ! 2937: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xf8244000  ! 2938: STW_R	stw	%r28, [%r17 + %r0]
T3_asi_reg_rd_109:
	mov	0x33, %r14
	.word 0xfedb89e0  ! 2939: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf4750000  ! 2949: STX_R	stx	%r26, [%r20 + %r0]
	ta	T_CHANGE_TO_TL0
cpu_intr_3_226:
	setx	0x350233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_227:
	setx	0x35023c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_208), 16, 16)) -> intp(3, 0, 31)
T3_asi_reg_rd_110:
	mov	0x2a, %r14
	.word 0xfcdb8e40  ! 2961: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf8b5e155  ! 2963: STHA_I	stha	%r28, [%r23 + 0x0155] %asi
iob_intr_3_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_209), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_rd_111:
	mov	0x2f, %r14
	.word 0xf8db89e0  ! 2965: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_3_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_210), 16, 16)) -> intp(3, 0, 18)
T3_asi_reg_rd_112:
	mov	0x3c0, %r14
	.word 0xfadb8e60  ! 2967: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf2244000  ! 2968: STW_R	stw	%r25, [%r17 + %r0]
T3_asi_reg_wr_119:
	mov	0xd, %r14
	.word 0xfaf389e0  ! 2969: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_3_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_211), 16, 16)) -> intp(3, 0, 19)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf6754000  ! 2975: STX_R	stx	%r27, [%r21 + %r0]
T3_asi_reg_rd_113:
	mov	0x2, %r14
	.word 0xf2db8e40  ! 2976: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf6254000  ! 2978: STW_R	stw	%r27, [%r21 + %r0]
	.word 0xf4248000  ! 2980: STW_R	stw	%r26, [%r18 + %r0]
cpu_intr_3_228:
	setx	0x350218, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_114:
	mov	0x2b, %r14
	.word 0xfedb8400  ! 2982: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_3_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_212), 16, 16)) -> intp(3, 0, 3a)
	.word 0x8f902002  ! 2986: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xfc35e065  ! 2987: STH_I	sth	%r30, [%r23 + 0x0065]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_213), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf82460c5  ! 2995: STW_I	stw	%r28, [%r17 + 0x00c5]
	.word 0xf2744000  ! 2997: STX_R	stx	%r25, [%r17 + %r0]
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983812  ! 2998: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1812, %hpstate
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_120:
	mov	0x3c8, %r14
	.word 0xf0f384a0  ! 3000: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_3_229:
	setx	0x360327, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_115:
	mov	0xd, %r14
	.word 0xfadb8e80  ! 3003: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_3_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_214), 16, 16)) -> intp(3, 0, 12)
	.word 0xb6a5e03d  ! 3007: SUBcc_I	subcc 	%r23, 0x003d, %r27
	.word 0xf2758000  ! 3010: STX_R	stx	%r25, [%r22 + %r0]
	.word 0xfe2420a6  ! 3012: STW_I	stw	%r31, [%r16 + 0x00a6]
	.word 0xfa25a0d1  ! 3013: STW_I	stw	%r29, [%r22 + 0x00d1]
cpu_intr_3_230:
	setx	0x35021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf025a145  ! 3016: STW_I	stw	%r24, [%r22 + 0x0145]
iob_intr_3_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_215), 16, 16)) -> intp(3, 0, 36)
iob_intr_3_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_216), 16, 16)) -> intp(3, 0, 22)
	.word 0xf8a4a039  ! 3022: STWA_I	stwa	%r28, [%r18 + 0x0039] %asi
cpu_intr_3_231:
	setx	0x35001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_116:
	mov	0x23, %r14
	.word 0xf2db8e40  ! 3029: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T3_asi_reg_rd_117:
	mov	0x3c7, %r14
	.word 0xf6db84a0  ! 3032: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf8244000  ! 3034: STW_R	stw	%r28, [%r17 + %r0]
iob_intr_3_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_217), 16, 16)) -> intp(3, 0, 2)
	.word 0xb2ace101  ! 3038: ANDNcc_I	andncc 	%r19, 0x0101, %r25
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_232:
	setx	0x350211, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_121:
	mov	0x34, %r14
	.word 0xfaf38400  ! 3041: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf2252108  ! 3042: STW_I	stw	%r25, [%r20 + 0x0108]
	.word 0xf6f460ad  ! 3043: STXA_I	stxa	%r27, [%r17 + 0x00ad] %asi
	.word 0x919461ff  ! 3044: WRPR_PIL_I	wrpr	%r17, 0x01ff, %pil
	.word 0xf6f5a083  ! 3045: STXA_I	stxa	%r27, [%r22 + 0x0083] %asi
	.word 0xf0258000  ! 3046: STW_R	stw	%r24, [%r22 + %r0]
	.word 0xb7641800  ! 3051: MOVcc_R	<illegal instruction>
iob_intr_3_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_218), 16, 16)) -> intp(3, 0, 2c)
cpu_intr_3_233:
	setx	0x360328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa48020  ! 3056: STWA_R	stwa	%r29, [%r18 + %r0] 0x01
cpu_intr_3_234:
	setx	0x350305, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_118:
	mov	0x3, %r14
	.word 0xf4db84a0  ! 3058: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xfc352171  ! 3060: STH_I	sth	%r30, [%r20 + 0x0171]
	.word 0xf82d6120  ! 3061: STB_I	stb	%r28, [%r21 + 0x0120]
iob_intr_3_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_219), 16, 16)) -> intp(3, 0, a)
iob_intr_3_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_220), 16, 16)) -> intp(3, 0, 24)
iob_intr_3_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_221), 16, 16)) -> intp(3, 0, 3b)
iob_intr_3_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_222), 16, 16)) -> intp(3, 0, 2c)
iob_intr_3_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_223), 16, 16)) -> intp(3, 0, 19)
T3_asi_reg_rd_119:
	mov	0x37, %r14
	.word 0xf2db8400  ! 3070: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_3_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_224), 16, 16)) -> intp(3, 0, 3d)
T3_asi_reg_rd_120:
	mov	0xc, %r14
	.word 0xf4db8e40  ! 3073: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb6244000  ! 3076: SUB_R	sub 	%r17, %r0, %r27
cpu_intr_3_235:
	setx	0x370132, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_236:
	setx	0x360313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaa4c000  ! 3081: SUBcc_R	subcc 	%r19, %r0, %r29
	.word 0xfa25c000  ! 3085: STW_R	stw	%r29, [%r23 + %r0]
iob_intr_3_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_225), 16, 16)) -> intp(3, 0, 35)
cpu_intr_3_237:
	setx	0x360231, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_238:
	setx	0x370323, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_121:
	mov	0x3c0, %r14
	.word 0xfedb8e60  ! 3092: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_3_239:
	setx	0x370302, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_240:
	setx	0x350004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62c0000  ! 3096: STB_R	stb	%r27, [%r16 + %r0]
iob_intr_3_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_226), 16, 16)) -> intp(3, 0, 21)
	.word 0xfe752030  ! 3102: STX_I	stx	%r31, [%r20 + 0x0030]
cpu_intr_3_241:
	setx	0x340112, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_122:
	mov	0x24, %r14
	.word 0xf6db8400  ! 3104: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	ta	T_CHANGE_TO_TL1
	.word 0xf8a5615e  ! 3109: STWA_I	stwa	%r28, [%r21 + 0x015e] %asi
	.word 0xfaad6187  ! 3110: STBA_I	stba	%r29, [%r21 + 0x0187] %asi
T3_asi_reg_rd_123:
	mov	0x3c5, %r14
	.word 0xf2db8e40  ! 3111: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb244e125  ! 3113: ADDC_I	addc 	%r19, 0x0125, %r25
	.word 0xb8958000  ! 3114: ORcc_R	orcc 	%r22, %r0, %r28
	.word 0xf0ac616c  ! 3116: STBA_I	stba	%r24, [%r17 + 0x016c] %asi
	.word 0xfca48020  ! 3118: STWA_R	stwa	%r30, [%r18 + %r0] 0x01
	.word 0xf27520ee  ! 3119: STX_I	stx	%r25, [%r20 + 0x00ee]
	.word 0xfa75c000  ! 3120: STX_R	stx	%r29, [%r23 + %r0]
iob_intr_3_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_227), 16, 16)) -> intp(3, 0, 8)
	.word 0xbd518000  ! 3123: RDPR_PSTATE	rdpr	%pstate, %r30
iob_intr_3_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_228), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_rd_124:
	mov	0x17, %r14
	.word 0xf4db8e40  ! 3127: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf6756173  ! 3128: STX_I	stx	%r27, [%r21 + 0x0173]
	ta	T_CHANGE_TO_TL0
iob_intr_3_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_229), 16, 16)) -> intp(3, 0, 28)
cpu_intr_3_242:
	setx	0x350007, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_230), 16, 16)) -> intp(3, 0, 6)
T3_asi_reg_rd_125:
	mov	0x3c8, %r14
	.word 0xf6db89e0  ! 3137: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T3_asi_reg_wr_122:
	mov	0x17, %r14
	.word 0xf2f384a0  ! 3141: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xfea4c020  ! 3154: STWA_R	stwa	%r31, [%r19 + %r0] 0x01
T3_asi_reg_wr_123:
	mov	0x38, %r14
	.word 0xfef38400  ! 3157: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_124:
	mov	0x3c0, %r14
	.word 0xf0f38e40  ! 3159: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_243:
	setx	0x350206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc1d613a  ! 3162: XOR_I	xor 	%r21, 0x013a, %r30
	.word 0xf62d0000  ! 3163: STB_R	stb	%r27, [%r20 + %r0]
	.word 0xfe34a063  ! 3165: STH_I	sth	%r31, [%r18 + 0x0063]
	.word 0xfcad0020  ! 3166: STBA_R	stba	%r30, [%r20 + %r0] 0x01
	.word 0xf8b5c020  ! 3168: STHA_R	stha	%r28, [%r23 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfeb4e0e2  ! 3171: STHA_I	stha	%r31, [%r19 + 0x00e2] %asi
T3_asi_reg_rd_126:
	mov	0xd, %r14
	.word 0xf2db8e80  ! 3173: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf2f42180  ! 3177: STXA_I	stxa	%r25, [%r16 + 0x0180] %asi
	.word 0x8795e1d9  ! 3180: WRPR_TT_I	wrpr	%r23, 0x01d9, %tt
iob_intr_3_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_231), 16, 16)) -> intp(3, 0, 29)
cpu_intr_3_244:
	setx	0x35010e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_245:
	setx	0x360214, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_246:
	setx	0x360108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf87561be  ! 3192: STX_I	stx	%r28, [%r21 + 0x01be]
cpu_intr_3_247:
	setx	0x37032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfef5a013  ! 3194: STXA_I	stxa	%r31, [%r22 + 0x0013] %asi
cpu_intr_3_248:
	setx	0x34000e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_232), 16, 16)) -> intp(3, 0, 2b)
	.word 0xb4bc617c  ! 3198: XNORcc_I	xnorcc 	%r17, 0x017c, %r26
iob_intr_3_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_233), 16, 16)) -> intp(3, 0, 3f)
iob_intr_3_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_234), 16, 16)) -> intp(3, 0, 7)
	.word 0xbc05a00c  ! 3202: ADD_I	add 	%r22, 0x000c, %r30
	.word 0xf62d20f0  ! 3204: STB_I	stb	%r27, [%r20 + 0x00f0]
	ta	T_CHANGE_TO_TL0
iob_intr_3_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_235), 16, 16)) -> intp(3, 0, 2e)
	ta	T_CHANGE_NONHPRIV
	.word 0xf6b48020  ! 3211: STHA_R	stha	%r27, [%r18 + %r0] 0x01
cpu_intr_3_249:
	setx	0x350203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b5c020  ! 3215: STHA_R	stha	%r24, [%r23 + %r0] 0x01
	.word 0xfe74200e  ! 3216: STX_I	stx	%r31, [%r16 + 0x000e]
	.word 0x83942024  ! 3218: WRPR_TNPC_I	wrpr	%r16, 0x0024, %tnpc
T3_asi_reg_rd_127:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 3220: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_236), 16, 16)) -> intp(3, 0, 1f)
	.word 0xfc7560c8  ! 3226: STX_I	stx	%r30, [%r21 + 0x00c8]
	.word 0xb8ace009  ! 3229: ANDNcc_I	andncc 	%r19, 0x0009, %r28
cpu_intr_3_250:
	setx	0x360129, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_237), 16, 16)) -> intp(3, 0, f)
cpu_intr_3_251:
	setx	0x370338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a520c4  ! 3237: STWA_I	stwa	%r25, [%r20 + 0x00c4] %asi
T3_asi_reg_rd_128:
	mov	0x3, %r14
	.word 0xfadb84a0  ! 3239: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983fc0  ! 3240: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc0, %hpstate
	.word 0xfcb54020  ! 3242: STHA_R	stha	%r30, [%r21 + %r0] 0x01
iob_intr_3_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_238), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_rd_129:
	mov	0x15, %r14
	.word 0xfedb8e60  ! 3244: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf825a0b9  ! 3246: STW_I	stw	%r28, [%r22 + 0x00b9]
	.word 0xf6f5a142  ! 3248: STXA_I	stxa	%r27, [%r22 + 0x0142] %asi
cpu_intr_3_252:
	setx	0x350224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2c4000  ! 3254: STB_R	stb	%r30, [%r17 + %r0]
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983c88  ! 3255: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c88, %hpstate
	.word 0xbd643801  ! 3256: MOVcc_I	<illegal instruction>
	.word 0xfaa4e095  ! 3261: STWA_I	stwa	%r29, [%r19 + 0x0095] %asi
iob_intr_3_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_239), 16, 16)) -> intp(3, 0, 32)
	.word 0xf4a58020  ! 3269: STWA_R	stwa	%r26, [%r22 + %r0] 0x01
	.word 0xf8b5607a  ! 3270: STHA_I	stha	%r28, [%r21 + 0x007a] %asi
iob_intr_3_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_240), 16, 16)) -> intp(3, 0, 3)
	.word 0xf6f5a00f  ! 3273: STXA_I	stxa	%r27, [%r22 + 0x000f] %asi
iob_intr_3_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_241), 16, 16)) -> intp(3, 0, 28)
	.word 0xf024c000  ! 3277: STW_R	stw	%r24, [%r19 + %r0]
	.word 0xf6f5219b  ! 3278: STXA_I	stxa	%r27, [%r20 + 0x019b] %asi
	.word 0xf0f56170  ! 3279: STXA_I	stxa	%r24, [%r21 + 0x0170] %asi
	.word 0xf6240000  ! 3284: STW_R	stw	%r27, [%r16 + %r0]
	.word 0xfea58020  ! 3285: STWA_R	stwa	%r31, [%r22 + %r0] 0x01
T3_asi_reg_wr_125:
	mov	0x1, %r14
	.word 0xf4f384a0  ! 3286: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_3_253:
	setx	0x390104, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_126:
	mov	0x3c5, %r14
	.word 0xfcf38e60  ! 3291: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_3_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_242), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_254:
	setx	0x380235, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_255:
	setx	0x380214, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_130:
	mov	0x3c6, %r14
	.word 0xfedb8e80  ! 3300: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_3_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_243), 16, 16)) -> intp(3, 0, 24)
T3_asi_reg_rd_131:
	mov	0x26, %r14
	.word 0xfadb89e0  ! 3304: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T3_asi_reg_rd_132:
	mov	0x1a, %r14
	.word 0xf2db8e80  ! 3306: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_3_256:
	setx	0x390311, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_244), 16, 16)) -> intp(3, 0, 7)
cpu_intr_3_257:
	setx	0x3b0009, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_258:
	setx	0x38020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a4207f  ! 3317: STWA_I	stwa	%r24, [%r16 + 0x007f] %asi
	.word 0xb8a4e1b5  ! 3318: SUBcc_I	subcc 	%r19, 0x01b5, %r28
cpu_intr_3_259:
	setx	0x3a023d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_260:
	setx	0x3a031e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_261:
	setx	0x3a0128, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_262:
	setx	0x3b0020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4740000  ! 3329: STX_R	stx	%r26, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_wr_127:
	mov	0x3c2, %r14
	.word 0xfaf384a0  ! 3338: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_3_263:
	setx	0x3a0038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0250000  ! 3342: STW_R	stw	%r24, [%r20 + %r0]
	.word 0xf874609c  ! 3345: STX_I	stx	%r28, [%r17 + 0x009c]
cpu_intr_3_264:
	setx	0x3a021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4344000  ! 3348: STH_R	sth	%r26, [%r17 + %r0]
	.word 0xf0ad0020  ! 3350: STBA_R	stba	%r24, [%r20 + %r0] 0x01
T3_asi_reg_wr_128:
	mov	0x2, %r14
	.word 0xf6f384a0  ! 3351: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf8246084  ! 3353: STW_I	stw	%r28, [%r17 + 0x0084]
	.word 0xfeb5a0b2  ! 3355: STHA_I	stha	%r31, [%r22 + 0x00b2] %asi
T3_asi_reg_rd_133:
	mov	0x37, %r14
	.word 0xf2db89e0  ! 3356: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xf82c4000  ! 3361: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xf8ade02f  ! 3362: STBA_I	stba	%r28, [%r23 + 0x002f] %asi
	.word 0xb82d8000  ! 3366: ANDN_R	andn 	%r22, %r0, %r28
iob_intr_3_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_245), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_265:
	setx	0x3b0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaace0dc  ! 3370: STBA_I	stba	%r29, [%r19 + 0x00dc] %asi
iob_intr_3_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_246), 16, 16)) -> intp(3, 0, 35)
cpu_intr_3_266:
	setx	0x3a0335, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_267:
	setx	0x3b0008, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_268:
	setx	0x390220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2c5c000  ! 3380: ADDCcc_R	addccc 	%r23, %r0, %r25
	.word 0xf625a063  ! 3381: STW_I	stw	%r27, [%r22 + 0x0063]
iob_intr_3_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_247), 16, 16)) -> intp(3, 0, 1)
	.word 0xb8c4e149  ! 3383: ADDCcc_I	addccc 	%r19, 0x0149, %r28
cpu_intr_3_269:
	setx	0x380007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b561be  ! 3388: ORNcc_I	orncc 	%r21, 0x01be, %r27
	.word 0xfe35c000  ! 3389: STH_R	sth	%r31, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xb2346198  ! 3395: ORN_I	orn 	%r17, 0x0198, %r25
	.word 0xb204e01d  ! 3398: ADD_I	add 	%r19, 0x001d, %r25
iob_intr_3_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_248), 16, 16)) -> intp(3, 0, 0)
cpu_intr_3_270:
	setx	0x3a0000, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_134:
	mov	0x3c2, %r14
	.word 0xf6db8400  ! 3406: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_3_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_249), 16, 16)) -> intp(3, 0, c)
cpu_intr_3_271:
	setx	0x380015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b48020  ! 3416: STHA_R	stha	%r27, [%r18 + %r0] 0x01
cpu_intr_3_272:
	setx	0x3b023c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_135:
	mov	0x3c1, %r14
	.word 0xfadb8e60  ! 3419: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T3_asi_reg_rd_136:
	mov	0x2d, %r14
	.word 0xf4db8400  ! 3420: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xfea4c020  ! 3421: STWA_R	stwa	%r31, [%r19 + %r0] 0x01
iob_intr_3_250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_250), 16, 16)) -> intp(3, 0, 22)
	.word 0xf4aca162  ! 3423: STBA_I	stba	%r26, [%r18 + 0x0162] %asi
T3_asi_reg_rd_137:
	mov	0x27, %r14
	.word 0xfcdb84a0  ! 3424: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_3_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_251), 16, 16)) -> intp(3, 0, 15)
T3_asi_reg_rd_138:
	mov	0xb, %r14
	.word 0xf0db89e0  ! 3428: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf835a0dc  ! 3431: STH_I	sth	%r28, [%r22 + 0x00dc]
	.word 0xb72d6001  ! 3432: SLL_I	sll 	%r21, 0x0001, %r27
T3_asi_reg_wr_129:
	mov	0x1, %r14
	.word 0xfaf389e0  ! 3433: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T3_asi_reg_wr_130:
	mov	0xc, %r14
	.word 0xf2f38400  ! 3434: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T3_asi_reg_wr_131:
	mov	0x3c8, %r14
	.word 0xf4f389e0  ! 3435: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T3_asi_reg_rd_139:
	mov	0x3c8, %r14
	.word 0xf8db8400  ! 3438: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xfeacc020  ! 3439: STBA_R	stba	%r31, [%r19 + %r0] 0x01
T3_asi_reg_rd_140:
	mov	0x32, %r14
	.word 0xf8db84a0  ! 3441: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T3_asi_reg_wr_132:
	mov	0x3c4, %r14
	.word 0xf0f38400  ! 3443: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_3_252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_252), 16, 16)) -> intp(3, 0, 7)
	.word 0xf8f5e071  ! 3448: STXA_I	stxa	%r28, [%r23 + 0x0071] %asi
cpu_intr_3_273:
	setx	0x3b0307, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_133:
	mov	0x1b, %r14
	.word 0xfaf38e40  ! 3452: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_wr_134:
	mov	0x3c4, %r14
	.word 0xf0f38e80  ! 3454: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xfc2c60e0  ! 3457: STB_I	stb	%r30, [%r17 + 0x00e0]
T3_asi_reg_wr_135:
	mov	0x30, %r14
	.word 0xf6f38e60  ! 3460: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf235e112  ! 3461: STH_I	sth	%r25, [%r23 + 0x0112]
iob_intr_3_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_253), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_274:
	setx	0x39021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbab5e026  ! 3470: ORNcc_I	orncc 	%r23, 0x0026, %r29
	.word 0xf6b56196  ! 3471: STHA_I	stha	%r27, [%r21 + 0x0196] %asi
T3_asi_reg_rd_141:
	mov	0x21, %r14
	.word 0xfedb84a0  ! 3474: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf4240000  ! 3475: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xb23da05c  ! 3476: XNOR_I	xnor 	%r22, 0x005c, %r25
	.word 0xfaad213d  ! 3477: STBA_I	stba	%r29, [%r20 + 0x013d] %asi
T3_asi_reg_rd_142:
	mov	0x3c6, %r14
	.word 0xf2db8e60  ! 3479: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_3_275:
	setx	0x380029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_254), 16, 16)) -> intp(3, 0, 7)
	.word 0xf434e16b  ! 3487: STH_I	sth	%r26, [%r19 + 0x016b]
	ta	T_CHANGE_HPRIV
	.word 0xf275217a  ! 3489: STX_I	stx	%r25, [%r20 + 0x017a]
	.word 0x8795a174  ! 3490: WRPR_TT_I	wrpr	%r22, 0x0174, %tt
iob_intr_3_255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_255), 16, 16)) -> intp(3, 0, b)
	.word 0xf675c000  ! 3497: STX_R	stx	%r27, [%r23 + %r0]
	.word 0x8395613a  ! 3500: WRPR_TNPC_I	wrpr	%r21, 0x013a, %tnpc
	.word 0xf0254000  ! 3502: STW_R	stw	%r24, [%r21 + %r0]
T3_asi_reg_wr_136:
	mov	0x26, %r14
	.word 0xfcf38e80  ! 3506: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf2b5a02b  ! 3507: STHA_I	stha	%r25, [%r22 + 0x002b] %asi
	.word 0xf02d4000  ! 3508: STB_R	stb	%r24, [%r21 + %r0]
	.word 0xfeb44020  ! 3512: STHA_R	stha	%r31, [%r17 + %r0] 0x01
	.word 0xbe3c4000  ! 3516: XNOR_R	xnor 	%r17, %r0, %r31
cpu_intr_3_276:
	setx	0x380231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcac0020  ! 3518: STBA_R	stba	%r30, [%r16 + %r0] 0x01
T3_asi_reg_wr_137:
	mov	0xf, %r14
	.word 0xf0f38e40  ! 3520: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb935e001  ! 3522: SRL_I	srl 	%r23, 0x0001, %r28
T3_asi_reg_rd_143:
	mov	0x3c6, %r14
	.word 0xf8db8e60  ! 3523: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T3_asi_reg_wr_138:
	mov	0x33, %r14
	.word 0xf2f389e0  ! 3525: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T3_asi_reg_rd_144:
	mov	0x3c2, %r14
	.word 0xf4db8e80  ! 3526: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xfe2d0000  ! 3527: STB_R	stb	%r31, [%r20 + %r0]
T3_asi_reg_wr_139:
	mov	0x1, %r14
	.word 0xf8f38e40  ! 3529: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf4758000  ! 3533: STX_R	stx	%r26, [%r22 + %r0]
cpu_intr_3_277:
	setx	0x3a0301, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_140:
	mov	0x3c7, %r14
	.word 0xfaf38400  ! 3535: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xfe244000  ! 3537: STW_R	stw	%r31, [%r17 + %r0]
	ta	T_CHANGE_TO_TL0
iob_intr_3_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_256), 16, 16)) -> intp(3, 0, 36)
iob_intr_3_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_257), 16, 16)) -> intp(3, 0, 1d)
	.word 0xf225208b  ! 3545: STW_I	stw	%r25, [%r20 + 0x008b]
T3_asi_reg_wr_141:
	mov	0x9, %r14
	.word 0xfcf38e60  ! 3557: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb045c000  ! 3563: ADDC_R	addc 	%r23, %r0, %r24
	.word 0xfa2d2173  ! 3566: STB_I	stb	%r29, [%r20 + 0x0173]
	.word 0xf6a4a1ce  ! 3568: STWA_I	stwa	%r27, [%r18 + 0x01ce] %asi
	.word 0xf625219d  ! 3569: STW_I	stw	%r27, [%r20 + 0x019d]
cpu_intr_3_278:
	setx	0x3b0031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab4e1d0  ! 3572: STHA_I	stha	%r29, [%r19 + 0x01d0] %asi
iob_intr_3_258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_258), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_wr_142:
	mov	0x9, %r14
	.word 0xfcf38400  ! 3578: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_3_279:
	setx	0x380212, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_280:
	setx	0x3a0234, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_281:
	setx	0x3a0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf47520cf  ! 3587: STX_I	stx	%r26, [%r20 + 0x00cf]
	.word 0xf0ac609f  ! 3588: STBA_I	stba	%r24, [%r17 + 0x009f] %asi
	.word 0xbf2db001  ! 3594: SLLX_I	sllx	%r22, 0x0001, %r31
	.word 0xf074a1a8  ! 3596: STX_I	stx	%r24, [%r18 + 0x01a8]
T3_asi_reg_rd_145:
	mov	0x2c, %r14
	.word 0xfadb89e0  ! 3597: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T3_asi_reg_wr_143:
	mov	0x3c6, %r14
	.word 0xfaf38e60  ! 3600: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xfeb42186  ! 3601: STHA_I	stha	%r31, [%r16 + 0x0186] %asi
cpu_intr_3_282:
	setx	0x39031a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_283:
	setx	0x3a0332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b44020  ! 3606: STHA_R	stha	%r28, [%r17 + %r0] 0x01
T3_asi_reg_rd_146:
	mov	0x8, %r14
	.word 0xf2db8400  ! 3608: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_3_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_259), 16, 16)) -> intp(3, 0, a)
T3_asi_reg_rd_147:
	mov	0x2e, %r14
	.word 0xf6db84a0  ! 3612: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_3_284:
	setx	0x3b0000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf875a1c5  ! 3617: STX_I	stx	%r28, [%r22 + 0x01c5]
	.word 0xf2f460a5  ! 3619: STXA_I	stxa	%r25, [%r17 + 0x00a5] %asi
T3_asi_reg_rd_148:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 3620: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf835e198  ! 3622: STH_I	sth	%r28, [%r23 + 0x0198]
	.word 0xf6b44020  ! 3623: STHA_R	stha	%r27, [%r17 + %r0] 0x01
	.word 0xf2244000  ! 3626: STW_R	stw	%r25, [%r17 + %r0]
cpu_intr_3_285:
	setx	0x3a0239, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_144:
	mov	0x8, %r14
	.word 0xfef38e80  ! 3629: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb0ace149  ! 3631: ANDNcc_I	andncc 	%r19, 0x0149, %r24
	.word 0xfe2cc000  ! 3633: STB_R	stb	%r31, [%r19 + %r0]
iob_intr_3_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_260), 16, 16)) -> intp(3, 0, 34)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_149:
	mov	0x1e, %r14
	.word 0xfadb84a0  ! 3636: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_3_286:
	setx	0x39020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0f4a0da  ! 3638: STXA_I	stxa	%r24, [%r18 + 0x00da] %asi
cpu_intr_3_287:
	setx	0x38023d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_288:
	setx	0x3a0015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf434c000  ! 3644: STH_R	sth	%r26, [%r19 + %r0]
T3_asi_reg_rd_150:
	mov	0x20, %r14
	.word 0xfadb8e60  ! 3645: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T3_asi_reg_rd_151:
	mov	0x3c2, %r14
	.word 0xf4db8e80  ! 3649: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xf02c0000  ! 3650: STB_R	stb	%r24, [%r16 + %r0]
cpu_intr_3_289:
	setx	0x3a0107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb60c20e5  ! 3656: AND_I	and 	%r16, 0x00e5, %r27
T3_asi_reg_wr_145:
	mov	0x3c1, %r14
	.word 0xf8f384a0  ! 3661: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf275e1b1  ! 3662: STX_I	stx	%r25, [%r23 + 0x01b1]
	.word 0xf0ade1af  ! 3665: STBA_I	stba	%r24, [%r23 + 0x01af] %asi
	.word 0xf0240000  ! 3666: STW_R	stw	%r24, [%r16 + %r0]
T3_asi_reg_wr_146:
	mov	0x3c6, %r14
	.word 0xf8f38e40  ! 3669: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfe2cc000  ! 3670: STB_R	stb	%r31, [%r19 + %r0]
T3_asi_reg_wr_147:
	mov	0x11, %r14
	.word 0xfaf38400  ! 3676: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_3_290:
	setx	0x3a000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_148:
	mov	0x22, %r14
	.word 0xfaf389e0  ! 3679: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_3_261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_261), 16, 16)) -> intp(3, 0, b)
	.word 0xfe356070  ! 3682: STH_I	sth	%r31, [%r21 + 0x0070]
	.word 0xf8b5c020  ! 3683: STHA_R	stha	%r28, [%r23 + %r0] 0x01
iob_intr_3_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_262), 16, 16)) -> intp(3, 0, 26)
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_149:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 3689: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfe2c8000  ! 3692: STB_R	stb	%r31, [%r18 + %r0]
	.word 0xf23560ad  ! 3693: STH_I	sth	%r25, [%r21 + 0x00ad]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_152:
	mov	0x10, %r14
	.word 0xf0db8e40  ! 3696: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfaa58020  ! 3699: STWA_R	stwa	%r29, [%r22 + %r0] 0x01
iob_intr_3_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_263), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_rd_153:
	mov	0x3c4, %r14
	.word 0xf4db8e40  ! 3701: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_wr_150:
	mov	0x7, %r14
	.word 0xf6f38e40  ! 3703: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfab40020  ! 3706: STHA_R	stha	%r29, [%r16 + %r0] 0x01
iob_intr_3_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_264), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_rd_154:
	mov	0x1c, %r14
	.word 0xf0db8e60  ! 3712: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf62c0000  ! 3714: STB_R	stb	%r27, [%r16 + %r0]
	.word 0xfeac4020  ! 3717: STBA_R	stba	%r31, [%r17 + %r0] 0x01
T3_asi_reg_wr_151:
	mov	0x1d, %r14
	.word 0xf0f384a0  ! 3720: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T3_asi_reg_rd_155:
	mov	0x3c3, %r14
	.word 0xf0db8e40  ! 3722: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf2f5e1f5  ! 3723: STXA_I	stxa	%r25, [%r23 + 0x01f5] %asi
	.word 0xf62c4000  ! 3724: STB_R	stb	%r27, [%r17 + %r0]
iob_intr_3_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_265), 16, 16)) -> intp(3, 0, 10)
	.word 0xf4350000  ! 3728: STH_R	sth	%r26, [%r20 + %r0]
	.word 0xbb3d3001  ! 3732: SRAX_I	srax	%r20, 0x0001, %r29
cpu_intr_3_291:
	setx	0x3d0216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02da1ce  ! 3736: STB_I	stb	%r24, [%r22 + 0x01ce]
cpu_intr_3_292:
	setx	0x3e0113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_266), 16, 16)) -> intp(3, 0, 30)
cpu_intr_3_293:
	setx	0x3f013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b5c020  ! 3750: STHA_R	stha	%r24, [%r23 + %r0] 0x01
	.word 0xb024a1e9  ! 3751: SUB_I	sub 	%r18, 0x01e9, %r24
	.word 0xb49ce1e2  ! 3752: XORcc_I	xorcc 	%r19, 0x01e2, %r26
T3_asi_reg_rd_156:
	mov	0x36, %r14
	.word 0xf8db84a0  ! 3753: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_3_294:
	setx	0x3e030e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_152:
	mov	0x35, %r14
	.word 0xfcf389e0  ! 3757: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_3_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_267), 16, 16)) -> intp(3, 0, 0)
	.word 0xf8aca0fc  ! 3760: STBA_I	stba	%r28, [%r18 + 0x00fc] %asi
iob_intr_3_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_268), 16, 16)) -> intp(3, 0, 19)
	.word 0xf2adc020  ! 3762: STBA_R	stba	%r25, [%r23 + %r0] 0x01
iob_intr_3_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_269), 16, 16)) -> intp(3, 0, 17)
	.word 0xb2948000  ! 3767: ORcc_R	orcc 	%r18, %r0, %r25
	.word 0xb32c8000  ! 3768: SLL_R	sll 	%r18, %r0, %r25
cpu_intr_3_295:
	setx	0x3e0309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8f902002  ! 3771: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xfe35609c  ! 3772: STH_I	sth	%r31, [%r21 + 0x009c]
	.word 0xf4356008  ! 3776: STH_I	sth	%r26, [%r21 + 0x0008]
cpu_intr_3_296:
	setx	0x3f0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc3560e2  ! 3783: STH_I	sth	%r30, [%r21 + 0x00e2]
	.word 0xb2ad4000  ! 3784: ANDNcc_R	andncc 	%r21, %r0, %r25
T3_asi_reg_rd_157:
	mov	0x18, %r14
	.word 0xf8db8e80  ! 3785: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_3_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_270), 16, 16)) -> intp(3, 0, 10)
	.word 0xf43421a5  ! 3788: STH_I	sth	%r26, [%r16 + 0x01a5]
iob_intr_3_271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_271), 16, 16)) -> intp(3, 0, 14)
	.word 0xbc85a02b  ! 3793: ADDcc_I	addcc 	%r22, 0x002b, %r30
T3_asi_reg_rd_158:
	mov	0x3c1, %r14
	.word 0xfedb8400  ! 3794: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf2b5c020  ! 3796: STHA_R	stha	%r25, [%r23 + %r0] 0x01
	.word 0xfa354000  ! 3797: STH_R	sth	%r29, [%r21 + %r0]
	.word 0xb4b421b4  ! 3799: ORNcc_I	orncc 	%r16, 0x01b4, %r26
	.word 0xf8acc020  ! 3800: STBA_R	stba	%r28, [%r19 + %r0] 0x01
iob_intr_3_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_272), 16, 16)) -> intp(3, 0, f)
cpu_intr_3_297:
	setx	0x3f0316, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_298:
	setx	0x3d001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8354000  ! 3808: STH_R	sth	%r28, [%r21 + %r0]
cpu_intr_3_299:
	setx	0x3e0022, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_159:
	mov	0x35, %r14
	.word 0xf0db89e0  ! 3810: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T3_asi_reg_rd_160:
	mov	0x3c5, %r14
	.word 0xf2db8e40  ! 3811: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf42dc000  ! 3812: STB_R	stb	%r26, [%r23 + %r0]
iob_intr_3_273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_273), 16, 16)) -> intp(3, 0, 34)
	.word 0xf6a5e0e8  ! 3816: STWA_I	stwa	%r27, [%r23 + 0x00e8] %asi
cpu_intr_3_300:
	setx	0x3e0030, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_274), 16, 16)) -> intp(3, 0, 19)
T3_asi_reg_wr_153:
	mov	0x1d, %r14
	.word 0xf0f38e40  ! 3822: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb6448000  ! 3823: ADDC_R	addc 	%r18, %r0, %r27
T3_asi_reg_rd_161:
	mov	0x36, %r14
	.word 0xf0db8e80  ! 3826: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xf2aca097  ! 3832: STBA_I	stba	%r25, [%r18 + 0x0097] %asi
	.word 0xb4340000  ! 3833: SUBC_R	orn 	%r16, %r0, %r26
T3_asi_reg_rd_162:
	mov	0x2c, %r14
	.word 0xf0db84a0  ! 3835: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf0a5e1a2  ! 3836: STWA_I	stwa	%r24, [%r23 + 0x01a2] %asi
cpu_intr_3_301:
	setx	0x3d0311, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_275), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf834a0a1  ! 3841: STH_I	sth	%r28, [%r18 + 0x00a1]
T3_asi_reg_rd_163:
	mov	0x7, %r14
	.word 0xfedb8e80  ! 3844: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf634c000  ! 3845: STH_R	sth	%r27, [%r19 + %r0]
cpu_intr_3_302:
	setx	0x3c001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_3_276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_276), 16, 16)) -> intp(3, 0, 28)
	.word 0xf4b40020  ! 3850: STHA_R	stha	%r26, [%r16 + %r0] 0x01
	.word 0xf825c000  ! 3852: STW_R	stw	%r28, [%r23 + %r0]
	.word 0xfef5e00f  ! 3855: STXA_I	stxa	%r31, [%r23 + 0x000f] %asi
iob_intr_3_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_277), 16, 16)) -> intp(3, 0, 23)
T3_asi_reg_wr_154:
	mov	0x1e, %r14
	.word 0xfaf38e60  ! 3857: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf274c000  ! 3859: STX_R	stx	%r25, [%r19 + %r0]
	.word 0xbb3ce001  ! 3866: SRA_I	sra 	%r19, 0x0001, %r29
	.word 0xfa25e1bb  ! 3868: STW_I	stw	%r29, [%r23 + 0x01bb]
	.word 0xbf34b001  ! 3871: SRLX_I	srlx	%r18, 0x0001, %r31
	.word 0xf62ce178  ! 3872: STB_I	stb	%r27, [%r19 + 0x0178]
T3_asi_reg_rd_164:
	mov	0x1f, %r14
	.word 0xfcdb8e40  ! 3874: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfe344000  ! 3882: STH_R	sth	%r31, [%r17 + %r0]
iob_intr_3_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_278), 16, 16)) -> intp(3, 0, 4)
T3_asi_reg_wr_155:
	mov	0x1e, %r14
	.word 0xfaf38e40  ! 3884: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_wr_156:
	mov	0x3c4, %r14
	.word 0xfaf384a0  ! 3885: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xfaac4020  ! 3886: STBA_R	stba	%r29, [%r17 + %r0] 0x01
	.word 0xf635605a  ! 3887: STH_I	sth	%r27, [%r21 + 0x005a]
T3_asi_reg_rd_165:
	mov	0x3c5, %r14
	.word 0xf2db8e60  ! 3888: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xfeac8020  ! 3890: STBA_R	stba	%r31, [%r18 + %r0] 0x01
	.word 0xf4754000  ! 3891: STX_R	stx	%r26, [%r21 + %r0]
cpu_intr_3_303:
	setx	0x3e003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0f46114  ! 3893: STXA_I	stxa	%r24, [%r17 + 0x0114] %asi
	.word 0xf0258000  ! 3895: STW_R	stw	%r24, [%r22 + %r0]
T3_asi_reg_wr_157:
	mov	0x3c0, %r14
	.word 0xf2f38e80  ! 3896: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_3_304:
	setx	0x3d011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa250000  ! 3900: STW_R	stw	%r29, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0xb49d21fc  ! 3903: XORcc_I	xorcc 	%r20, 0x01fc, %r26
	.word 0xfea56198  ! 3905: STWA_I	stwa	%r31, [%r21 + 0x0198] %asi
T3_asi_reg_wr_158:
	mov	0x3c0, %r14
	.word 0xfaf38400  ! 3906: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_3_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_279), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf6f421c6  ! 3909: STXA_I	stxa	%r27, [%r16 + 0x01c6] %asi
	.word 0xf6ad8020  ! 3910: STBA_R	stba	%r27, [%r22 + %r0] 0x01
iob_intr_3_280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_280), 16, 16)) -> intp(3, 0, 35)
	.word 0xbaa44000  ! 3915: SUBcc_R	subcc 	%r17, %r0, %r29
cpu_intr_3_305:
	setx	0x3c003b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_159:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 3920: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb13db001  ! 3921: SRAX_I	srax	%r22, 0x0001, %r24
	.word 0xb8148000  ! 3925: OR_R	or 	%r18, %r0, %r28
cpu_intr_3_306:
	setx	0x3f0234, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
iob_intr_3_281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_281), 16, 16)) -> intp(3, 0, 27)
	.word 0xb6a54000  ! 3933: SUBcc_R	subcc 	%r21, %r0, %r27
T3_asi_reg_rd_166:
	mov	0x33, %r14
	.word 0xf8db89e0  ! 3935: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T3_asi_reg_wr_160:
	mov	0x3c7, %r14
	.word 0xfcf38400  ! 3938: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_3_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_282), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf6f4e0b3  ! 3940: STXA_I	stxa	%r27, [%r19 + 0x00b3] %asi
	.word 0xb37dc400  ! 3941: MOVR_R	movre	%r23, %r0, %r25
cpu_intr_3_307:
	setx	0x3e0236, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_308:
	setx	0x3c0204, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_309:
	setx	0x3e0138, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_283), 16, 16)) -> intp(3, 0, 25)
T3_asi_reg_rd_167:
	mov	0x16, %r14
	.word 0xfcdb89e0  ! 3951: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_3_310:
	setx	0x3f0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe758000  ! 3955: STX_R	stx	%r31, [%r22 + %r0]
	.word 0xfca58020  ! 3957: STWA_R	stwa	%r30, [%r22 + %r0] 0x01
iob_intr_3_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_284), 16, 16)) -> intp(3, 0, 9)
iob_intr_3_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_285), 16, 16)) -> intp(3, 0, 24)
iob_intr_3_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_286), 16, 16)) -> intp(3, 0, 33)
cpu_intr_3_311:
	setx	0x3d0103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a54020  ! 3964: STWA_R	stwa	%r24, [%r21 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_168:
	mov	0x3c7, %r14
	.word 0xf0db89e0  ! 3968: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf424c000  ! 3969: STW_R	stw	%r26, [%r19 + %r0]
iob_intr_3_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_287), 16, 16)) -> intp(3, 0, 1)
	.word 0xf8b58020  ! 3972: STHA_R	stha	%r28, [%r22 + %r0] 0x01
T3_asi_reg_wr_161:
	mov	0x16, %r14
	.word 0xf8f38e40  ! 3976: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfab44020  ! 3979: STHA_R	stha	%r29, [%r17 + %r0] 0x01
T3_asi_reg_wr_162:
	mov	0x3c7, %r14
	.word 0xfef38e60  ! 3981: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_3_312:
	setx	0x3e0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf434e09b  ! 3985: STH_I	sth	%r26, [%r19 + 0x009b]
cpu_intr_3_313:
	setx	0x3f0118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b420ca  ! 3990: STHA_I	stha	%r26, [%r16 + 0x00ca] %asi
iob_intr_3_288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_288), 16, 16)) -> intp(3, 0, 3)
T3_asi_reg_wr_163:
	mov	0x3c0, %r14
	.word 0xfcf38e80  ! 3992: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_3_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_289), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf42420b7  ! 3995: STW_I	stw	%r26, [%r16 + 0x00b7]
	.word 0xbd641800  ! 3996: MOVcc_R	<illegal instruction>
T3_asi_reg_rd_169:
	mov	0x3c1, %r14
	.word 0xfadb8400  ! 3997: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2acc020  ! 4000: STBA_R	stba	%r25, [%r19 + %r0] 0x01
cpu_intr_3_314:
	setx	0x3f032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ade1ff  ! 4003: STBA_I	stba	%r24, [%r23 + 0x01ff] %asi
	.word 0xb6440000  ! 4004: ADDC_R	addc 	%r16, %r0, %r27
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983a80  ! 4005: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a80, %hpstate
iob_intr_3_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_290), 16, 16)) -> intp(3, 0, 24)
	.word 0xfe256146  ! 4013: STW_I	stw	%r31, [%r21 + 0x0146]
cpu_intr_3_315:
	setx	0x3c0322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ad4020  ! 4015: STBA_R	stba	%r28, [%r21 + %r0] 0x01
cpu_intr_3_316:
	setx	0x3d032b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_317:
	setx	0x3d0103, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_164:
	mov	0xf, %r14
	.word 0xf2f389e0  ! 4020: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_3_318:
	setx	0x3c023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02c8000  ! 4022: STB_R	stb	%r24, [%r18 + %r0]
	.word 0xf2acc020  ! 4024: STBA_R	stba	%r25, [%r19 + %r0] 0x01
iob_intr_3_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_291), 16, 16)) -> intp(3, 0, 30)
	ta	T_CHANGE_NONHPRIV
iob_intr_3_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_292), 16, 16)) -> intp(3, 0, 15)
	.word 0xf0a4c020  ! 4032: STWA_R	stwa	%r24, [%r19 + %r0] 0x01
cpu_intr_3_319:
	setx	0x3f012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b44000  ! 4037: ORNcc_R	orncc 	%r17, %r0, %r27
T3_asi_reg_wr_165:
	mov	0x34, %r14
	.word 0xfaf38e80  ! 4038: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xfcb4c020  ! 4043: STHA_R	stha	%r30, [%r19 + %r0] 0x01
cpu_intr_3_320:
	setx	0x3e0215, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_321:
	setx	0x3e013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfc24e1e1  ! 4050: STW_I	stw	%r30, [%r19 + 0x01e1]
iob_intr_3_293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_293), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf6b40020  ! 4056: STHA_R	stha	%r27, [%r16 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
iob_intr_3_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_294), 16, 16)) -> intp(3, 0, 36)
	.word 0xf2a4e0c4  ! 4066: STWA_I	stwa	%r25, [%r19 + 0x00c4] %asi
	.word 0xf2b42021  ! 4067: STHA_I	stha	%r25, [%r16 + 0x0021] %asi
cpu_intr_3_322:
	setx	0x3e001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b520e0  ! 4071: STHA_I	stha	%r27, [%r20 + 0x00e0] %asi
	.word 0xfc752128  ! 4076: STX_I	stx	%r30, [%r20 + 0x0128]
cpu_intr_3_323:
	setx	0x3d0132, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_166:
	mov	0x20, %r14
	.word 0xfaf389e0  ! 4079: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_3_324:
	setx	0x3c0132, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_167:
	mov	0x12, %r14
	.word 0xf0f38e40  ! 4084: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_295), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf8758000  ! 4092: STX_R	stx	%r28, [%r22 + %r0]
	.word 0xf0b48020  ! 4093: STHA_R	stha	%r24, [%r18 + %r0] 0x01
	.word 0xf275e10c  ! 4094: STX_I	stx	%r25, [%r23 + 0x010c]
T3_asi_reg_wr_168:
	mov	0x35, %r14
	.word 0xf0f38e60  ! 4095: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xfe2dc000  ! 4096: STB_R	stb	%r31, [%r23 + %r0]
iob_intr_3_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_296), 16, 16)) -> intp(3, 0, b)
cpu_intr_3_325:
	setx	0x3c0038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_297), 16, 16)) -> intp(3, 0, 17)
T3_asi_reg_rd_170:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 4100: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfe752148  ! 4101: STX_I	stx	%r31, [%r20 + 0x0148]
	.word 0xf6a4a00f  ! 4104: STWA_I	stwa	%r27, [%r18 + 0x000f] %asi
	.word 0xbe3c4000  ! 4105: XNOR_R	xnor 	%r17, %r0, %r31
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_169:
	mov	0x10, %r14
	.word 0xf6f38e80  ! 4108: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf0b521ec  ! 4113: STHA_I	stha	%r24, [%r20 + 0x01ec] %asi
T3_asi_reg_rd_171:
	mov	0x17, %r14
	.word 0xf0db8e40  ! 4114: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfaf4e000  ! 4117: STXA_I	stxa	%r29, [%r19 + 0x0000] %asi
	.word 0xbf355000  ! 4122: SRLX_R	srlx	%r21, %r0, %r31
	ta	T_CHANGE_TO_TL0
	.word 0xfc25601b  ! 4124: STW_I	stw	%r30, [%r21 + 0x001b]
iob_intr_3_298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_298), 16, 16)) -> intp(3, 0, 21)
	.word 0xfaa40020  ! 4128: STWA_R	stwa	%r29, [%r16 + %r0] 0x01
	.word 0xba45a04d  ! 4129: ADDC_I	addc 	%r22, 0x004d, %r29
	.word 0xf2b4e1d9  ! 4131: STHA_I	stha	%r25, [%r19 + 0x01d9] %asi
	.word 0xfa254000  ! 4132: STW_R	stw	%r29, [%r21 + %r0]
T3_asi_reg_wr_170:
	mov	0x22, %r14
	.word 0xf6f38e40  ! 4134: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982ed8  ! 4135: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed8, %hpstate
T3_asi_reg_rd_172:
	mov	0x1, %r14
	.word 0xf2db89e0  ! 4136: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_3_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_299), 16, 16)) -> intp(3, 0, 15)
T3_asi_reg_rd_173:
	mov	0x3c2, %r14
	.word 0xf6db8e60  ! 4142: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf0ada044  ! 4144: STBA_I	stba	%r24, [%r22 + 0x0044] %asi
T3_asi_reg_wr_171:
	mov	0x9, %r14
	.word 0xf0f38e80  ! 4145: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL1
	.word 0xf8adc020  ! 4147: STBA_R	stba	%r28, [%r23 + %r0] 0x01
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x819838d0  ! 4148: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18d0, %hpstate
	.word 0xbcb4c000  ! 4151: ORNcc_R	orncc 	%r19, %r0, %r30
T3_asi_reg_wr_172:
	mov	0x23, %r14
	.word 0xf8f384a0  ! 4153: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T3_asi_reg_rd_174:
	mov	0xe, %r14
	.word 0xf0db8e80  ! 4154: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb4c5c000  ! 4156: ADDCcc_R	addccc 	%r23, %r0, %r26
	.word 0xf42c4000  ! 4158: STB_R	stb	%r26, [%r17 + %r0]
T3_asi_reg_rd_175:
	mov	0x2a, %r14
	.word 0xf8db8400  ! 4159: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_173:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 4165: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbb340000  ! 4167: SRL_R	srl 	%r16, %r0, %r29
iob_intr_3_300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_300), 16, 16)) -> intp(3, 0, 37)
cpu_intr_3_326:
	setx	0x42032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcac4020  ! 4175: STBA_R	stba	%r30, [%r17 + %r0] 0x01
iob_intr_3_301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_301), 16, 16)) -> intp(3, 0, 1c)
cpu_intr_3_327:
	setx	0x40013d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_176:
	mov	0x3c0, %r14
	.word 0xf2db8e80  ! 4180: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf43520c5  ! 4181: STH_I	sth	%r26, [%r20 + 0x00c5]
T3_asi_reg_wr_174:
	mov	0x24, %r14
	.word 0xf8f38e40  ! 4183: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf02da058  ! 4187: STB_I	stb	%r24, [%r22 + 0x0058]
cpu_intr_3_328:
	setx	0x430325, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_302), 16, 16)) -> intp(3, 0, 10)
	.word 0xf6342166  ! 4193: STH_I	sth	%r27, [%r16 + 0x0166]
cpu_intr_3_329:
	setx	0x420002, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_175:
	mov	0x3, %r14
	.word 0xf0f38e40  ! 4199: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_303), 16, 16)) -> intp(3, 0, 19)
cpu_intr_3_330:
	setx	0x420015, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_177:
	mov	0x3c3, %r14
	.word 0xf8db8e40  ! 4202: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	ta	T_CHANGE_TO_TL1
	.word 0xfeac0020  ! 4206: STBA_R	stba	%r31, [%r16 + %r0] 0x01
	.word 0xf2b4e1e8  ! 4208: STHA_I	stha	%r25, [%r19 + 0x01e8] %asi
T3_asi_reg_rd_178:
	mov	0x9, %r14
	.word 0xf8db8400  ! 4212: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb43d8000  ! 4213: XNOR_R	xnor 	%r22, %r0, %r26
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_176:
	mov	0x3c2, %r14
	.word 0xf4f38e40  ! 4218: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T3_asi_reg_wr_177:
	mov	0x1, %r14
	.word 0xfef38e80  ! 4223: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf8b42179  ! 4227: STHA_I	stha	%r28, [%r16 + 0x0179] %asi
	.word 0xfaad8020  ! 4228: STBA_R	stba	%r29, [%r22 + %r0] 0x01
	.word 0xfc754000  ! 4229: STX_R	stx	%r30, [%r21 + %r0]
	.word 0xb8c50000  ! 4230: ADDCcc_R	addccc 	%r20, %r0, %r28
iob_intr_3_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_304), 16, 16)) -> intp(3, 0, 15)
	.word 0xf274c000  ! 4234: STX_R	stx	%r25, [%r19 + %r0]
T3_asi_reg_wr_178:
	mov	0x1a, %r14
	.word 0xf6f38e80  ! 4235: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf2a4a133  ! 4237: STWA_I	stwa	%r25, [%r18 + 0x0133] %asi
	.word 0xf2744000  ! 4238: STX_R	stx	%r25, [%r17 + %r0]
	.word 0xfc248000  ! 4241: STW_R	stw	%r30, [%r18 + %r0]
T3_asi_reg_rd_179:
	mov	0x25, %r14
	.word 0xf0db8e60  ! 4247: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf82c61bc  ! 4249: STB_I	stb	%r28, [%r17 + 0x01bc]
	.word 0xf6a5c020  ! 4250: STWA_R	stwa	%r27, [%r23 + %r0] 0x01
	.word 0xb52d2001  ! 4253: SLL_I	sll 	%r20, 0x0001, %r26
	.word 0xfc7560fe  ! 4254: STX_I	stx	%r30, [%r21 + 0x00fe]
	ta	T_CHANGE_TO_TL0
	.word 0xb2b44000  ! 4259: SUBCcc_R	orncc 	%r17, %r0, %r25
iob_intr_3_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_305), 16, 16)) -> intp(3, 0, 7)
cpu_intr_3_331:
	setx	0x430027, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_180:
	mov	0x9, %r14
	.word 0xf8db84a0  ! 4267: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_3_306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_306), 16, 16)) -> intp(3, 0, 6)
T3_asi_reg_rd_181:
	mov	0x33, %r14
	.word 0xf8db8e40  ! 4272: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_332:
	setx	0x400308, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_307), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_308), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_wr_179:
	mov	0x20, %r14
	.word 0xf8f384a0  ! 4279: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_3_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_309), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_333:
	setx	0x410323, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_3_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_310), 16, 16)) -> intp(3, 0, 1)
	.word 0xfe35e172  ! 4289: STH_I	sth	%r31, [%r23 + 0x0172]
	.word 0xfe2ce000  ! 4290: STB_I	stb	%r31, [%r19 + 0x0000]
cpu_intr_3_334:
	setx	0x410331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe75a16a  ! 4293: STX_I	stx	%r31, [%r22 + 0x016a]
T3_asi_reg_rd_182:
	mov	0x3c3, %r14
	.word 0xf6db8e60  ! 4294: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xfa75c000  ! 4295: STX_R	stx	%r29, [%r23 + %r0]
	.word 0xb2850000  ! 4298: ADDcc_R	addcc 	%r20, %r0, %r25
cpu_intr_3_335:
	setx	0x410305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf635201d  ! 4301: STH_I	sth	%r27, [%r20 + 0x001d]
iob_intr_3_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_311), 16, 16)) -> intp(3, 0, d)
T3_asi_reg_rd_183:
	mov	0x3c2, %r14
	.word 0xfadb84a0  ! 4303: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb2b58000  ! 4305: SUBCcc_R	orncc 	%r22, %r0, %r25
	.word 0xfa256010  ! 4309: STW_I	stw	%r29, [%r21 + 0x0010]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_184:
	mov	0x3c4, %r14
	.word 0xf4db8e60  ! 4314: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf034c000  ! 4321: STH_R	sth	%r24, [%r19 + %r0]
	.word 0xf4a42199  ! 4322: STWA_I	stwa	%r26, [%r16 + 0x0199] %asi
	.word 0xfcb4c020  ! 4323: STHA_R	stha	%r30, [%r19 + %r0] 0x01
	.word 0xb0456063  ! 4327: ADDC_I	addc 	%r21, 0x0063, %r24
	.word 0xfef4e1f8  ! 4328: STXA_I	stxa	%r31, [%r19 + 0x01f8] %asi
	.word 0xf42d6056  ! 4329: STB_I	stb	%r26, [%r21 + 0x0056]
	.word 0xfcb48020  ! 4331: STHA_R	stha	%r30, [%r18 + %r0] 0x01
T3_asi_reg_wr_180:
	mov	0x37, %r14
	.word 0xf0f389e0  ! 4332: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xfaace0a4  ! 4333: STBA_I	stba	%r29, [%r19 + 0x00a4] %asi
cpu_intr_3_336:
	setx	0x420020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb42c8000  ! 4337: ANDN_R	andn 	%r18, %r0, %r26
T3_asi_reg_wr_181:
	mov	0x3c5, %r14
	.word 0xf6f389e0  ! 4338: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T3_asi_reg_wr_182:
	mov	0x3c5, %r14
	.word 0xf0f38e60  ! 4339: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_3_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_312), 16, 16)) -> intp(3, 0, 31)
	.word 0xfca46017  ! 4342: STWA_I	stwa	%r30, [%r17 + 0x0017] %asi
iob_intr_3_313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_313), 16, 16)) -> intp(3, 0, 16)
iob_intr_3_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_314), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_337:
	setx	0x41030c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_315), 16, 16)) -> intp(3, 0, 1e)
cpu_intr_3_338:
	setx	0x400130, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_316), 16, 16)) -> intp(3, 0, 17)
	.word 0xf42c8000  ! 4354: STB_R	stb	%r26, [%r18 + %r0]
	.word 0xf6352041  ! 4355: STH_I	sth	%r27, [%r20 + 0x0041]
cpu_intr_3_339:
	setx	0x430205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcac8020  ! 4362: STBA_R	stba	%r30, [%r18 + %r0] 0x01
	.word 0xf4256087  ! 4363: STW_I	stw	%r26, [%r21 + 0x0087]
	.word 0xf0244000  ! 4364: STW_R	stw	%r24, [%r17 + %r0]
	.word 0xf6ad4020  ! 4365: STBA_R	stba	%r27, [%r21 + %r0] 0x01
	.word 0xfe2dc000  ! 4366: STB_R	stb	%r31, [%r23 + %r0]
iob_intr_3_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_317), 16, 16)) -> intp(3, 0, 13)
	.word 0xbb3ca001  ! 4369: SRA_I	sra 	%r18, 0x0001, %r29
iob_intr_3_318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_318), 16, 16)) -> intp(3, 0, 32)
	.word 0xf4ad0020  ! 4377: STBA_R	stba	%r26, [%r20 + %r0] 0x01
cpu_intr_3_340:
	setx	0x410013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb734b001  ! 4381: SRLX_I	srlx	%r18, 0x0001, %r27
T3_asi_reg_wr_183:
	mov	0x27, %r14
	.word 0xfcf38e60  ! 4383: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_3_319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_319), 16, 16)) -> intp(3, 0, 2d)
T3_asi_reg_rd_185:
	mov	0xc, %r14
	.word 0xf8db89e0  ! 4386: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf224c000  ! 4388: STW_R	stw	%r25, [%r19 + %r0]
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x819838d0  ! 4391: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18d0, %hpstate
cpu_intr_3_341:
	setx	0x40011e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_184:
	mov	0x2b, %r14
	.word 0xfcf389e0  ! 4397: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb52c9000  ! 4400: SLLX_R	sllx	%r18, %r0, %r26
	ta	T_CHANGE_NONHPRIV
	.word 0xfcadc020  ! 4403: STBA_R	stba	%r30, [%r23 + %r0] 0x01
	.word 0xf2348000  ! 4405: STH_R	sth	%r25, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6a4e129  ! 4407: STWA_I	stwa	%r27, [%r19 + 0x0129] %asi
iob_intr_3_320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_320), 16, 16)) -> intp(3, 0, 34)
	.word 0xb6ad0000  ! 4412: ANDNcc_R	andncc 	%r20, %r0, %r27
T3_asi_reg_rd_186:
	mov	0x0, %r14
	.word 0xfadb84a0  ! 4413: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T3_asi_reg_rd_187:
	mov	0x21, %r14
	.word 0xf0db8e80  ! 4414: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_3_342:
	setx	0x43002f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_343:
	setx	0x400019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8750000  ! 4425: STX_R	stx	%r28, [%r20 + %r0]
	.word 0xbd2d2001  ! 4426: SLL_I	sll 	%r20, 0x0001, %r30
T3_asi_reg_wr_185:
	mov	0xd, %r14
	.word 0xfef38400  ! 4429: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf62dc000  ! 4433: STB_R	stb	%r27, [%r23 + %r0]
cpu_intr_3_344:
	setx	0x420024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_345:
	setx	0x41011a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_346:
	setx	0x430312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62d8000  ! 4438: STB_R	stb	%r27, [%r22 + %r0]
	.word 0xf42d0000  ! 4440: STB_R	stb	%r26, [%r20 + %r0]
cpu_intr_3_347:
	setx	0x420006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a5a11d  ! 4443: STWA_I	stwa	%r27, [%r22 + 0x011d] %asi
iob_intr_3_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_321), 16, 16)) -> intp(3, 0, 16)
cpu_intr_3_348:
	setx	0x420233, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_188:
	mov	0x23, %r14
	.word 0xf4db8e60  ! 4448: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_3_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_322), 16, 16)) -> intp(3, 0, 14)
iob_intr_3_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_323), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_349:
	setx	0x430137, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_324), 16, 16)) -> intp(3, 0, 32)
	.word 0xb2042137  ! 4458: ADD_I	add 	%r16, 0x0137, %r25
	ta	T_CHANGE_TO_TL1
	.word 0xfcb421cb  ! 4462: STHA_I	stha	%r30, [%r16 + 0x01cb] %asi
T3_asi_reg_rd_189:
	mov	0xb, %r14
	.word 0xfedb84a0  ! 4463: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xfe350000  ! 4466: STH_R	sth	%r31, [%r20 + %r0]
cpu_intr_3_350:
	setx	0x420305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc342112  ! 4473: STH_I	sth	%r30, [%r16 + 0x0112]
	.word 0xf4ace0ac  ! 4475: STBA_I	stba	%r26, [%r19 + 0x00ac] %asi
	.word 0xf2ad20b5  ! 4477: STBA_I	stba	%r25, [%r20 + 0x00b5] %asi
iob_intr_3_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_325), 16, 16)) -> intp(3, 0, 3d)
T3_asi_reg_rd_190:
	mov	0x34, %r14
	.word 0xfadb8e60  ! 4479: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_3_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_326), 16, 16)) -> intp(3, 0, 0)
	.word 0xf234e098  ! 4485: STH_I	sth	%r25, [%r19 + 0x0098]
T3_asi_reg_rd_191:
	mov	0x3c6, %r14
	.word 0xf4db84a0  ! 4486: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T3_asi_reg_wr_186:
	mov	0x3c6, %r14
	.word 0xfaf38e80  ! 4488: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL1
	.word 0xfaad4020  ! 4495: STBA_R	stba	%r29, [%r21 + %r0] 0x01
cpu_intr_3_351:
	setx	0x420112, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_192:
	mov	0x3c0, %r14
	.word 0xf2db8e60  ! 4498: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_3_327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_327), 16, 16)) -> intp(3, 0, 1e)
iob_intr_3_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_328), 16, 16)) -> intp(3, 0, 26)
	.word 0xfeb48020  ! 4507: STHA_R	stha	%r31, [%r18 + %r0] 0x01
T3_asi_reg_wr_187:
	mov	0x20, %r14
	.word 0xf2f38e60  ! 4509: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_3_352:
	setx	0x43020b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_193:
	mov	0x3c8, %r14
	.word 0xf0db8e40  ! 4512: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_rd_194:
	mov	0x11, %r14
	.word 0xfcdb8e60  ! 4513: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_3_329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_329), 16, 16)) -> intp(3, 0, 1e)
cpu_intr_3_353:
	setx	0x400337, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_330), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_wr_188:
	mov	0xe, %r14
	.word 0xf8f38e40  ! 4517: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T3_asi_reg_rd_195:
	mov	0x3c0, %r14
	.word 0xf6db8e80  ! 4520: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_3_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_331), 16, 16)) -> intp(3, 0, 9)
	.word 0xfa35a096  ! 4525: STH_I	sth	%r29, [%r22 + 0x0096]
	.word 0xba8c8000  ! 4526: ANDcc_R	andcc 	%r18, %r0, %r29
iob_intr_3_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_332), 16, 16)) -> intp(3, 0, 0)
	.word 0xb1641800  ! 4532: MOVcc_R	<illegal instruction>
cpu_intr_3_354:
	setx	0x400130, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_355:
	setx	0x430210, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_196:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 4539: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_356:
	setx	0x400124, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_3_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_333), 16, 16)) -> intp(3, 0, 33)
T3_asi_reg_rd_197:
	mov	0xd, %r14
	.word 0xf0db84a0  ! 4550: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xfe2d6007  ! 4551: STB_I	stb	%r31, [%r21 + 0x0007]
	.word 0xf0ac6080  ! 4552: STBA_I	stba	%r24, [%r17 + 0x0080] %asi
cpu_intr_3_357:
	setx	0x41022c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_358:
	setx	0x420233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_359:
	setx	0x420312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf435c000  ! 4558: STH_R	sth	%r26, [%r23 + %r0]
	.word 0xbd508000  ! 4561: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xf8752029  ! 4562: STX_I	stx	%r28, [%r20 + 0x0029]
cpu_intr_3_360:
	setx	0x400107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf07421de  ! 4564: STX_I	stx	%r24, [%r16 + 0x01de]
	.word 0xf8ac200c  ! 4565: STBA_I	stba	%r28, [%r16 + 0x000c] %asi
iob_intr_3_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_334), 16, 16)) -> intp(3, 0, 33)
T3_asi_reg_wr_189:
	mov	0x3c5, %r14
	.word 0xfaf38e40  ! 4567: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_rd_198:
	mov	0x31, %r14
	.word 0xfadb8e40  ! 4568: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfcb42147  ! 4569: STHA_I	stha	%r30, [%r16 + 0x0147] %asi
iob_intr_3_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_335), 16, 16)) -> intp(3, 0, d)
	.word 0xf0b5c020  ! 4574: STHA_R	stha	%r24, [%r23 + %r0] 0x01
T3_asi_reg_wr_190:
	mov	0xc, %r14
	.word 0xf6f389e0  ! 4578: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_199:
	mov	0x24, %r14
	.word 0xf4db84a0  ! 4585: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf4350000  ! 4586: STH_R	sth	%r26, [%r20 + %r0]
iob_intr_3_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_336), 16, 16)) -> intp(3, 0, 2d)
T3_asi_reg_wr_191:
	mov	0x26, %r14
	.word 0xf8f384a0  ! 4588: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xfe74a025  ! 4589: STX_I	stx	%r31, [%r18 + 0x0025]
cpu_intr_3_361:
	setx	0x400333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ac610f  ! 4596: STBA_I	stba	%r28, [%r17 + 0x010f] %asi
T3_asi_reg_wr_192:
	mov	0x3c5, %r14
	.word 0xf8f389e0  ! 4598: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	.word 0xbf540000  ! 4600: RDPR_GL	rdpr	%-, %r31
	.word 0xf2a4c020  ! 4601: STWA_R	stwa	%r25, [%r19 + %r0] 0x01
iob_intr_3_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_337), 16, 16)) -> intp(3, 0, 39)
	.word 0xf4358000  ! 4603: STH_R	sth	%r26, [%r22 + %r0]
	.word 0xfc75c000  ! 4606: STX_R	stx	%r30, [%r23 + %r0]
cpu_intr_3_362:
	setx	0x420216, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xbe3ce04e  ! 4611: XNOR_I	xnor 	%r19, 0x004e, %r31
	.word 0xfeb5616c  ! 4613: STHA_I	stha	%r31, [%r21 + 0x016c] %asi
	.word 0xf434e0b9  ! 4614: STH_I	sth	%r26, [%r19 + 0x00b9]
	.word 0xf0344000  ! 4615: STH_R	sth	%r24, [%r17 + %r0]
	.word 0xf6ac0020  ! 4618: STBA_R	stba	%r27, [%r16 + %r0] 0x01
T3_asi_reg_wr_193:
	mov	0x0, %r14
	.word 0xf6f38e60  ! 4619: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_3_363:
	setx	0x47011c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_338), 16, 16)) -> intp(3, 0, 14)
cpu_intr_3_364:
	setx	0x47001d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_339), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_wr_194:
	mov	0xc, %r14
	.word 0xf0f38e40  ! 4625: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T3_asi_reg_rd_200:
	mov	0x9, %r14
	.word 0xfadb8e40  ! 4627: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_HPRIV
iob_intr_3_340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_340), 16, 16)) -> intp(3, 0, d)
	ta	T_CHANGE_TO_TL0
iob_intr_3_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_341), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf4b5e10f  ! 4635: STHA_I	stha	%r26, [%r23 + 0x010f] %asi
	.word 0xb02c8000  ! 4636: ANDN_R	andn 	%r18, %r0, %r24
iob_intr_3_342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_342), 16, 16)) -> intp(3, 0, 3d)
iob_intr_3_343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_343), 16, 16)) -> intp(3, 0, 15)
	.word 0xb32ca001  ! 4639: SLL_I	sll 	%r18, 0x0001, %r25
	.word 0x8394615c  ! 4640: WRPR_TNPC_I	wrpr	%r17, 0x015c, %tnpc
	.word 0xbaa4205a  ! 4642: SUBcc_I	subcc 	%r16, 0x005a, %r29
	.word 0xfead20cf  ! 4643: STBA_I	stba	%r31, [%r20 + 0x00cf] %asi
cpu_intr_3_365:
	setx	0x440010, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_195:
	mov	0x15, %r14
	.word 0xf2f38e40  ! 4645: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_rd_201:
	mov	0x4, %r14
	.word 0xf2db8e60  ! 4646: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xfaac617f  ! 4648: STBA_I	stba	%r29, [%r17 + 0x017f] %asi
	.word 0xb73cd000  ! 4649: SRAX_R	srax	%r19, %r0, %r27
	.word 0xf2a58020  ! 4650: STWA_R	stwa	%r25, [%r22 + %r0] 0x01
	.word 0xfeb5619d  ! 4652: STHA_I	stha	%r31, [%r21 + 0x019d] %asi
iob_intr_3_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_344), 16, 16)) -> intp(3, 0, 18)
	.word 0xb97d2401  ! 4660: MOVR_I	movre	%r20, 0x1, %r28
iob_intr_3_345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_345), 16, 16)) -> intp(3, 0, 7)
T3_asi_reg_rd_202:
	mov	0xf, %r14
	.word 0xf2db89e0  ! 4662: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xf2250000  ! 4664: STW_R	stw	%r25, [%r20 + %r0]
	.word 0xf6ac60a4  ! 4668: STBA_I	stba	%r27, [%r17 + 0x00a4] %asi
iob_intr_3_346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_346), 16, 16)) -> intp(3, 0, 32)
	.word 0xf4346101  ! 4673: STH_I	sth	%r26, [%r17 + 0x0101]
T3_asi_reg_wr_196:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 4674: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf0a4c020  ! 4675: STWA_R	stwa	%r24, [%r19 + %r0] 0x01
T3_asi_reg_wr_197:
	mov	0x2a, %r14
	.word 0xf8f38e40  ! 4676: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf0350000  ! 4679: STH_R	sth	%r24, [%r20 + %r0]
	.word 0xfcad6087  ! 4680: STBA_I	stba	%r30, [%r21 + 0x0087] %asi
T3_asi_reg_wr_198:
	mov	0x3c7, %r14
	.word 0xf6f38e40  ! 4687: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_rd_203:
	mov	0xc, %r14
	.word 0xf8db8e80  ! 4689: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf8b54020  ! 4690: STHA_R	stha	%r28, [%r21 + %r0] 0x01
iob_intr_3_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_347), 16, 16)) -> intp(3, 0, 25)
	.word 0x8594e174  ! 4694: WRPR_TSTATE_I	wrpr	%r19, 0x0174, %tstate
cpu_intr_3_366:
	setx	0x47003c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_204:
	mov	0x3c3, %r14
	.word 0xf8db8400  ! 4696: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_3_367:
	setx	0x440234, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_199:
	mov	0x1f, %r14
	.word 0xf4f384a0  ! 4698: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbe0ca020  ! 4699: AND_I	and 	%r18, 0x0020, %r31
T3_asi_reg_rd_205:
	mov	0xb, %r14
	.word 0xf4db8e60  ! 4703: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf6f5a0cc  ! 4706: STXA_I	stxa	%r27, [%r22 + 0x00cc] %asi
cpu_intr_3_368:
	setx	0x47030e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_200:
	mov	0x35, %r14
	.word 0xf2f38400  ! 4714: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_3_369:
	setx	0x440202, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_201:
	mov	0x2a, %r14
	.word 0xf6f38e80  ! 4718: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xfe3520d4  ! 4719: STH_I	sth	%r31, [%r20 + 0x00d4]
cpu_intr_3_370:
	setx	0x440236, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_371:
	setx	0x45003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b4618f  ! 4725: STHA_I	stha	%r26, [%r17 + 0x018f] %asi
iob_intr_3_348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_348), 16, 16)) -> intp(3, 0, 38)
	.word 0xb8358000  ! 4728: ORN_R	orn 	%r22, %r0, %r28
T3_asi_reg_rd_206:
	mov	0xc, %r14
	.word 0xf8db8e40  ! 4730: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T3_asi_reg_rd_207:
	mov	0x26, %r14
	.word 0xf4db8400  ! 4732: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf0f5a151  ! 4733: STXA_I	stxa	%r24, [%r22 + 0x0151] %asi
	.word 0xf8b48020  ! 4734: STHA_R	stha	%r28, [%r18 + %r0] 0x01
	.word 0xfe750000  ! 4735: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xf875a03c  ! 4739: STX_I	stx	%r28, [%r22 + 0x003c]
	.word 0xfeb4604d  ! 4740: STHA_I	stha	%r31, [%r17 + 0x004d] %asi
	.word 0xf62460b5  ! 4741: STW_I	stw	%r27, [%r17 + 0x00b5]
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983c92  ! 4743: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c92, %hpstate
	.word 0xf824c000  ! 4745: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xf674e05e  ! 4747: STX_I	stx	%r27, [%r19 + 0x005e]
T3_asi_reg_wr_202:
	mov	0x20, %r14
	.word 0xfaf38e80  ! 4751: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T3_asi_reg_rd_208:
	mov	0x17, %r14
	.word 0xf0db8e40  ! 4752: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf2b5e132  ! 4753: STHA_I	stha	%r25, [%r23 + 0x0132] %asi
T3_asi_reg_wr_203:
	mov	0x2b, %r14
	.word 0xfcf384a0  ! 4755: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T3_asi_reg_wr_204:
	mov	0x2, %r14
	.word 0xfaf384a0  ! 4756: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_3_372:
	setx	0x46020d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_209:
	mov	0xd, %r14
	.word 0xfadb8e60  ! 4758: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T3_asi_reg_wr_205:
	mov	0xf, %r14
	.word 0xf4f384a0  ! 4764: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_3_349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_349), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_rd_210:
	mov	0xa, %r14
	.word 0xf8db8e80  ! 4768: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf8746105  ! 4769: STX_I	stx	%r28, [%r17 + 0x0105]
cpu_intr_3_373:
	setx	0x46032c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_374:
	setx	0x45003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2cc000  ! 4775: STB_R	stb	%r31, [%r19 + %r0]
	.word 0xf4f42010  ! 4776: STXA_I	stxa	%r26, [%r16 + 0x0010] %asi
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf8ade0e2  ! 4780: STBA_I	stba	%r28, [%r23 + 0x00e2] %asi
T3_asi_reg_wr_206:
	mov	0x3c0, %r14
	.word 0xf4f384a0  ! 4781: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xfaf4a1f6  ! 4782: STXA_I	stxa	%r29, [%r18 + 0x01f6] %asi
cpu_intr_3_375:
	setx	0x450033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf874c000  ! 4785: STX_R	stx	%r28, [%r19 + %r0]
	.word 0xfaa44020  ! 4788: STWA_R	stwa	%r29, [%r17 + %r0] 0x01
	.word 0xfaad8020  ! 4789: STBA_R	stba	%r29, [%r22 + %r0] 0x01
T3_asi_reg_rd_211:
	mov	0x2a, %r14
	.word 0xfcdb89e0  ! 4790: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T3_asi_reg_rd_212:
	mov	0x35, %r14
	.word 0xfcdb8400  ! 4791: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xfa248000  ! 4792: STW_R	stw	%r29, [%r18 + %r0]
cpu_intr_3_376:
	setx	0x450335, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_207:
	mov	0x2e, %r14
	.word 0xf4f38e60  ! 4797: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T3_asi_reg_rd_213:
	mov	0x24, %r14
	.word 0xf4db8e40  ! 4798: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbe3d8000  ! 4799: XNOR_R	xnor 	%r22, %r0, %r31
iob_intr_3_350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_350), 16, 16)) -> intp(3, 0, 2a)
	.word 0xfab4608a  ! 4804: STHA_I	stha	%r29, [%r17 + 0x008a] %asi
iob_intr_3_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_351), 16, 16)) -> intp(3, 0, 4)
	.word 0xb805a1ce  ! 4808: ADD_I	add 	%r22, 0x01ce, %r28
iob_intr_3_352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_352), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_wr_208:
	mov	0x2d, %r14
	.word 0xf2f38400  ! 4812: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_3_353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_353), 16, 16)) -> intp(3, 0, 23)
	.word 0xb68560bf  ! 4817: ADDcc_I	addcc 	%r21, 0x00bf, %r27
T3_asi_reg_wr_209:
	mov	0x9, %r14
	.word 0xfaf38e40  ! 4818: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_3_354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_354), 16, 16)) -> intp(3, 0, 29)
	.word 0xfe2d0000  ! 4823: STB_R	stb	%r31, [%r20 + %r0]
	.word 0xfa356019  ! 4827: STH_I	sth	%r29, [%r21 + 0x0019]
T3_asi_reg_wr_210:
	mov	0x1c, %r14
	.word 0xfcf38e80  ! 4828: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T3_asi_reg_rd_214:
	mov	0x3c8, %r14
	.word 0xfcdb8e80  ! 4829: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf2a50020  ! 4830: STWA_R	stwa	%r25, [%r20 + %r0] 0x01
	.word 0xfca5208f  ! 4833: STWA_I	stwa	%r30, [%r20 + 0x008f] %asi
iob_intr_3_355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_355), 16, 16)) -> intp(3, 0, 9)
cpu_intr_3_377:
	setx	0x450336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b561b3  ! 4836: STHA_I	stha	%r26, [%r21 + 0x01b3] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_356), 16, 16)) -> intp(3, 0, 15)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf674e0a1  ! 4848: STX_I	stx	%r27, [%r19 + 0x00a1]
	.word 0xf6b56174  ! 4849: STHA_I	stha	%r27, [%r21 + 0x0174] %asi
cpu_intr_3_378:
	setx	0x450228, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_357), 16, 16)) -> intp(3, 0, e)
	.word 0xbb50c000  ! 4854: RDPR_TT	rdpr	%tt, %r29
	.word 0xf234e14f  ! 4856: STH_I	sth	%r25, [%r19 + 0x014f]
cpu_intr_3_379:
	setx	0x47033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b5c000  ! 4858: SUBCcc_R	orncc 	%r23, %r0, %r25
iob_intr_3_358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_358), 16, 16)) -> intp(3, 0, 36)
iob_intr_3_359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_359), 16, 16)) -> intp(3, 0, f)
	.word 0xfe25e004  ! 4863: STW_I	stw	%r31, [%r23 + 0x0004]
T3_asi_reg_wr_211:
	mov	0x9, %r14
	.word 0xf4f38e40  ! 4864: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf2b4a019  ! 4865: STHA_I	stha	%r25, [%r18 + 0x0019] %asi
T3_asi_reg_wr_212:
	mov	0x36, %r14
	.word 0xfaf38e60  ! 4866: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T3_asi_reg_wr_213:
	mov	0x2, %r14
	.word 0xf0f38400  ! 4867: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_3_360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_360), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_361), 16, 16)) -> intp(3, 0, 3f)
cpu_intr_3_380:
	setx	0x450138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf074a0e7  ! 4873: STX_I	stx	%r24, [%r18 + 0x00e7]
cpu_intr_3_381:
	setx	0x44033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02d4000  ! 4886: STB_R	stb	%r24, [%r21 + %r0]
cpu_intr_3_382:
	setx	0x460004, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_383:
	setx	0x470119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaac6005  ! 4890: STBA_I	stba	%r29, [%r17 + 0x0005] %asi
iob_intr_3_362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_362), 16, 16)) -> intp(3, 0, 9)
T3_asi_reg_rd_215:
	mov	0x6, %r14
	.word 0xf6db8400  ! 4897: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf2352014  ! 4898: STH_I	sth	%r25, [%r20 + 0x0014]
	.word 0xf234c000  ! 4900: STH_R	sth	%r25, [%r19 + %r0]
	.word 0xf67521fa  ! 4902: STX_I	stx	%r27, [%r20 + 0x01fa]
iob_intr_3_363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_363), 16, 16)) -> intp(3, 0, 1a)
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982f80  ! 4906: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f80, %hpstate
	.word 0xf0ad0020  ! 4912: STBA_R	stba	%r24, [%r20 + %r0] 0x01
	.word 0xbe850000  ! 4914: ADDcc_R	addcc 	%r20, %r0, %r31
	.word 0xbc1d4000  ! 4917: XOR_R	xor 	%r21, %r0, %r30
T3_asi_reg_rd_216:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 4921: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_3_384:
	setx	0x44011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe356121  ! 4925: STH_I	sth	%r31, [%r21 + 0x0121]
iob_intr_3_364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_364), 16, 16)) -> intp(3, 0, 1c)
	.word 0xbc95608e  ! 4928: ORcc_I	orcc 	%r21, 0x008e, %r30
cpu_intr_3_385:
	setx	0x450118, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_214:
	mov	0x11, %r14
	.word 0xf0f38e60  ! 4930: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	ta	T_CHANGE_TO_TL1
	.word 0xf6b5c020  ! 4933: STHA_R	stha	%r27, [%r23 + %r0] 0x01
	.word 0xf6f56195  ! 4937: STXA_I	stxa	%r27, [%r21 + 0x0195] %asi
cpu_intr_3_386:
	setx	0x450328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc746110  ! 4939: STX_I	stx	%r30, [%r17 + 0x0110]
	ta	T_CHANGE_NONHPRIV
	.word 0xfe752085  ! 4945: STX_I	stx	%r31, [%r20 + 0x0085]
	ta	T_CHANGE_NONHPRIV
	.word 0xf42d4000  ! 4948: STB_R	stb	%r26, [%r21 + %r0]
	.word 0xfc246186  ! 4951: STW_I	stw	%r30, [%r17 + 0x0186]
cpu_intr_3_387:
	setx	0x470032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcad2198  ! 4954: STBA_I	stba	%r30, [%r20 + 0x0198] %asi
iob_intr_3_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_365), 16, 16)) -> intp(3, 0, 3f)
cpu_intr_3_388:
	setx	0x440300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2d8000  ! 4958: STB_R	stb	%r31, [%r22 + %r0]
	.word 0xb1350000  ! 4959: SRL_R	srl 	%r20, %r0, %r24
cpu_intr_3_389:
	setx	0x47003f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_390:
	setx	0x460011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc24a154  ! 4964: STW_I	stw	%r30, [%r18 + 0x0154]
T3_asi_reg_rd_217:
	mov	0x3c7, %r14
	.word 0xfadb89e0  ! 4966: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf6a52047  ! 4969: STWA_I	stwa	%r27, [%r20 + 0x0047] %asi
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_391:
	setx	0x47033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_366), 16, 16)) -> intp(3, 0, 8)
T3_asi_reg_rd_218:
	mov	0x19, %r14
	.word 0xf0db8e60  ! 4976: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xba94e0cf  ! 4977: ORcc_I	orcc 	%r19, 0x00cf, %r29
	.word 0xf62d0000  ! 4982: STB_R	stb	%r27, [%r20 + %r0]
cpu_intr_3_392:
	setx	0x44033f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_367), 16, 16)) -> intp(3, 0, 3f)
	.word 0xbcaca079  ! 4987: ANDNcc_I	andncc 	%r18, 0x0079, %r30
	.word 0xb8948000  ! 4988: ORcc_R	orcc 	%r18, %r0, %r28
T3_asi_reg_wr_215:
	mov	0x1a, %r14
	.word 0xfef38e60  ! 4989: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf6246010  ! 4993: STW_I	stw	%r27, [%r17 + 0x0010]
T3_asi_reg_rd_219:
	mov	0x13, %r14
	.word 0xf4db89e0  ! 4996: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T3_asi_reg_rd_220:
	mov	0x28, %r14
	.word 0xfadb89e0  ! 4997: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T3_asi_reg_wr_216:
	mov	0x37, %r14
	.word 0xf2f38e40  ! 4998: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
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
	setx	0x19011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4d8000  ! 3: LDSB_R	ldsb	[%r22 + %r0], %r31
T2_asi_reg_wr_0:
	mov	0x16, %r14
	.word 0xfcf38e40  ! 4: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
iob_intr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_0), 16, 16)) -> intp(2, 0, 2)
iob_intr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_1), 16, 16)) -> intp(2, 0, 1e)
iob_intr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_2), 16, 16)) -> intp(2, 0, 30)
	.word 0xf48da019  ! 11: LDUBA_I	lduba	[%r22, + 0x0019] %asi, %r26
cpu_intr_2_1:
	setx	0x1d0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8cd0020  ! 14: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r28
	.word 0xfa0c8000  ! 15: LDUB_R	ldub	[%r18 + %r0], %r29
cpu_intr_2_2:
	setx	0x1d011e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_3:
	setx	0x1e0230, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_3), 16, 16)) -> intp(2, 0, d)
cpu_intr_2_4:
	setx	0x1c0139, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_5:
	setx	0x1f011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4144000  ! 23: LDUH_R	lduh	[%r17 + %r0], %r26
	.word 0xb085a00f  ! 24: ADDcc_I	addcc 	%r22, 0x000f, %r24
	.word 0xf654c000  ! 26: LDSH_R	ldsh	[%r19 + %r0], %r27
	.word 0xf28560be  ! 28: LDUWA_I	lduwa	[%r21, + 0x00be] %asi, %r25
	.word 0xb6848000  ! 32: ADDcc_R	addcc 	%r18, %r0, %r27
	.word 0xfe54a1ab  ! 33: LDSH_I	ldsh	[%r18 + 0x01ab], %r31
	.word 0xf2c5c020  ! 34: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r25
T2_asi_reg_rd_0:
	mov	0x1f, %r14
	.word 0xfcdb8400  ! 37: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_2_6:
	setx	0x1d0002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6cc0020  ! 43: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r27
cpu_intr_2_7:
	setx	0x1e0101, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_1:
	mov	0x3c7, %r14
	.word 0xfaf38e60  ! 48: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_2_8:
	setx	0x1d011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf615c000  ! 50: LDUH_R	lduh	[%r23 + %r0], %r27
cpu_intr_2_9:
	setx	0x1c010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf40c4000  ! 56: LDUB_R	ldub	[%r17 + %r0], %r26
	.word 0xb9480000  ! 58: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
cpu_intr_2_10:
	setx	0x1c0105, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_11:
	setx	0x1e0137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf454a12c  ! 67: LDSH_I	ldsh	[%r18 + 0x012c], %r26
	.word 0xf4c48020  ! 69: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r26
T2_asi_reg_wr_2:
	mov	0x26, %r14
	.word 0xfcf38e60  ! 72: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbd3d5000  ! 74: SRAX_R	srax	%r21, %r0, %r30
cpu_intr_2_12:
	setx	0x1e0236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb20c60ae  ! 76: AND_I	and 	%r17, 0x00ae, %r25
T2_asi_reg_rd_1:
	mov	0x19, %r14
	.word 0xf8db8e60  ! 84: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T2_asi_reg_rd_2:
	mov	0x15, %r14
	.word 0xf0db8e80  ! 85: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb2058000  ! 86: ADD_R	add 	%r22, %r0, %r25
	.word 0xf41420dd  ! 89: LDUH_I	lduh	[%r16 + 0x00dd], %r26
cpu_intr_2_13:
	setx	0x1d001a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_14:
	setx	0x1f0110, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_4), 16, 16)) -> intp(2, 0, 14)
iob_intr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_5), 16, 16)) -> intp(2, 0, 1e)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf445214a  ! 100: LDSW_I	ldsw	[%r20 + 0x014a], %r26
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982ad0  ! 101: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad0, %hpstate
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_3:
	mov	0x3c3, %r14
	.word 0xf6f38e60  ! 105: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_2_15:
	setx	0x1c033a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_6), 16, 16)) -> intp(2, 0, 2d)
	.word 0xfe150000  ! 111: LDUH_R	lduh	[%r20 + %r0], %r31
	.word 0xf45560c5  ! 113: LDSH_I	ldsh	[%r21 + 0x00c5], %r26
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982a4a  ! 114: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4a, %hpstate
	.word 0xf0cc0020  ! 117: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r24
T2_asi_reg_rd_3:
	mov	0x3c1, %r14
	.word 0xfcdb84a0  ! 120: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf85c8000  ! 121: LDX_R	ldx	[%r18 + %r0], %r28
iob_intr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_7), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf4050000  ! 126: LDUW_R	lduw	[%r20 + %r0], %r26
T2_asi_reg_wr_4:
	mov	0x15, %r14
	.word 0xfcf384a0  ! 127: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf2dd61fb  ! 128: LDXA_I	ldxa	[%r21, + 0x01fb] %asi, %r25
	.word 0xf685c020  ! 129: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r27
	.word 0xfed40020  ! 132: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r31
	.word 0xfecd4020  ! 133: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r31
	.word 0xfe8ca13a  ! 136: LDUBA_I	lduba	[%r18, + 0x013a] %asi, %r31
	.word 0xfecd4020  ! 137: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r31
iob_intr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_8), 16, 16)) -> intp(2, 0, 1)
iob_intr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_9), 16, 16)) -> intp(2, 0, 3)
	.word 0xf685c020  ! 140: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r27
T2_asi_reg_rd_4:
	mov	0x21, %r14
	.word 0xfadb8e40  ! 142: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf81521f3  ! 143: LDUH_I	lduh	[%r20 + 0x01f3], %r28
	.word 0xf415c000  ! 144: LDUH_R	lduh	[%r23 + %r0], %r26
	.word 0xb4048000  ! 147: ADD_R	add 	%r18, %r0, %r26
T2_asi_reg_rd_5:
	mov	0x2, %r14
	.word 0xf8db8e40  ! 150: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_10), 16, 16)) -> intp(2, 0, 3e)
	.word 0xfed4e121  ! 157: LDSHA_I	ldsha	[%r19, + 0x0121] %asi, %r31
iob_intr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_11), 16, 16)) -> intp(2, 0, 23)
cpu_intr_2_16:
	setx	0x1e0133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8561ee  ! 164: LDUWA_I	lduwa	[%r21, + 0x01ee] %asi, %r31
	.word 0xf8dd2090  ! 166: LDXA_I	ldxa	[%r20, + 0x0090] %asi, %r28
iob_intr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_12), 16, 16)) -> intp(2, 0, 1c)
	.word 0xfc8da18c  ! 168: LDUBA_I	lduba	[%r22, + 0x018c] %asi, %r30
	.word 0xfa952189  ! 170: LDUHA_I	lduha	[%r20, + 0x0189] %asi, %r29
T2_asi_reg_rd_6:
	mov	0x3c4, %r14
	.word 0xf4db8e40  ! 171: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_TO_TL1
	.word 0xf4c48020  ! 175: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r26
	.word 0xb63c4000  ! 177: XNOR_R	xnor 	%r17, %r0, %r27
	.word 0xf85521e0  ! 180: LDSH_I	ldsh	[%r20 + 0x01e0], %r28
	.word 0xf244e171  ! 184: LDSW_I	ldsw	[%r19 + 0x0171], %r25
T2_asi_reg_rd_7:
	mov	0x13, %r14
	.word 0xf0db8e60  ! 185: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xfa156039  ! 189: LDUH_I	lduh	[%r21 + 0x0039], %r29
iob_intr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_13), 16, 16)) -> intp(2, 0, 22)
	.word 0x919520f5  ! 197: WRPR_PIL_I	wrpr	%r20, 0x00f5, %pil
	.word 0xf85d616f  ! 199: LDX_I	ldx	[%r21 + 0x016f], %r28
cpu_intr_2_17:
	setx	0x1e032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_18:
	setx	0x1f0338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05ce1d4  ! 204: LDX_I	ldx	[%r19 + 0x01d4], %r24
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_5:
	mov	0x5, %r14
	.word 0xfef38e80  ! 208: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf485e13d  ! 212: LDUWA_I	lduwa	[%r23, + 0x013d] %asi, %r26
iob_intr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_14), 16, 16)) -> intp(2, 0, 31)
iob_intr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_15), 16, 16)) -> intp(2, 0, 1e)
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfe4d0000  ! 224: LDSB_R	ldsb	[%r20 + %r0], %r31
	.word 0xf65d4000  ! 225: LDX_R	ldx	[%r21 + %r0], %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf045e0da  ! 233: LDSW_I	ldsw	[%r23 + 0x00da], %r24
	.word 0xfa144000  ! 234: LDUH_R	lduh	[%r17 + %r0], %r29
	.word 0xb0b40000  ! 238: SUBCcc_R	orncc 	%r16, %r0, %r24
T2_asi_reg_wr_6:
	mov	0x5, %r14
	.word 0xf6f38400  ! 240: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf0d50020  ! 242: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r24
iob_intr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_16), 16, 16)) -> intp(2, 0, 29)
cpu_intr_2_19:
	setx	0x1c0016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4cd8020  ! 245: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r26
	.word 0xf0d561cb  ! 247: LDSHA_I	ldsha	[%r21, + 0x01cb] %asi, %r24
	ta	T_CHANGE_NONHPRIV
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982f00  ! 250: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f00, %hpstate
iob_intr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_17), 16, 16)) -> intp(2, 0, 32)
cpu_intr_2_20:
	setx	0x1c002e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_18), 16, 16)) -> intp(2, 0, 17)
	.word 0xf08d6128  ! 260: LDUBA_I	lduba	[%r21, + 0x0128] %asi, %r24
	.word 0xf64ca064  ! 263: LDSB_I	ldsb	[%r18 + 0x0064], %r27
iob_intr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_19), 16, 16)) -> intp(2, 0, 12)
	ta	T_CHANGE_TO_TL1
iob_intr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_20), 16, 16)) -> intp(2, 0, 1e)
cpu_intr_2_21:
	setx	0x1e010c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_21), 16, 16)) -> intp(2, 0, 22)
	.word 0xf25d2134  ! 279: LDX_I	ldx	[%r20 + 0x0134], %r25
iob_intr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_22), 16, 16)) -> intp(2, 0, 3d)
	.word 0xfacdc020  ! 281: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r29
	.word 0xfa0521a4  ! 283: LDUW_I	lduw	[%r20 + 0x01a4], %r29
	.word 0xfc9461b7  ! 284: LDUHA_I	lduha	[%r17, + 0x01b7] %asi, %r30
	.word 0xf204a019  ! 287: LDUW_I	lduw	[%r18 + 0x0019], %r25
T2_asi_reg_wr_7:
	mov	0x30, %r14
	.word 0xfef389e0  ! 289: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T2_asi_reg_wr_8:
	mov	0x3, %r14
	.word 0xf2f38400  ! 290: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_23), 16, 16)) -> intp(2, 0, 38)
	.word 0xfa8c0020  ! 296: LDUBA_R	lduba	[%r16, %r0] 0x01, %r29
	ta	T_CHANGE_TO_TL0
	.word 0xf285a07c  ! 300: LDUWA_I	lduwa	[%r22, + 0x007c] %asi, %r25
cpu_intr_2_22:
	setx	0x1c022d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_23:
	setx	0x10107, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_9:
	mov	0x2f, %r14
	.word 0xfcf38e40  ! 310: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb605c000  ! 311: ADD_R	add 	%r23, %r0, %r27
cpu_intr_2_24:
	setx	0x1e0039, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_8:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 315: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_24), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_wr_10:
	mov	0x16, %r14
	.word 0xf2f38400  ! 318: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_25), 16, 16)) -> intp(2, 0, 27)
iob_intr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_26), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_wr_11:
	mov	0x3c7, %r14
	.word 0xfcf38e60  ! 325: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T2_asi_reg_rd_9:
	mov	0x3c0, %r14
	.word 0xfedb8e60  ! 327: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T2_asi_reg_wr_12:
	mov	0x3c3, %r14
	.word 0xfcf38e60  ! 328: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T2_asi_reg_rd_10:
	mov	0x3c2, %r14
	.word 0xf8db8e60  ! 329: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	ta	T_CHANGE_HPRIV
	.word 0xb8c5c000  ! 333: ADDCcc_R	addccc 	%r23, %r0, %r28
T2_asi_reg_wr_13:
	mov	0x3c2, %r14
	.word 0xfaf384a0  ! 334: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T2_asi_reg_wr_14:
	mov	0x17, %r14
	.word 0xfaf38e80  ! 336: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xfa0d605b  ! 337: LDUB_I	ldub	[%r21 + 0x005b], %r29
	.word 0xf0d5219a  ! 339: LDSHA_I	ldsha	[%r20, + 0x019a] %asi, %r24
cpu_intr_2_25:
	setx	0x1f0211, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_15:
	mov	0x3c3, %r14
	.word 0xfaf38400  ! 346: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbb35e001  ! 349: SRL_I	srl 	%r23, 0x0001, %r29
iob_intr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_27), 16, 16)) -> intp(2, 0, 25)
	.word 0xbc1d0000  ! 353: XOR_R	xor 	%r20, %r0, %r30
iob_intr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_28), 16, 16)) -> intp(2, 0, 3)
T2_asi_reg_wr_16:
	mov	0x34, %r14
	.word 0xf8f38400  ! 355: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL1
	.word 0xf4cce06c  ! 364: LDSBA_I	ldsba	[%r19, + 0x006c] %asi, %r26
	.word 0xf6154000  ! 366: LDUH_R	lduh	[%r21 + %r0], %r27
T2_asi_reg_wr_17:
	mov	0x1e, %r14
	.word 0xf0f38e80  ! 368: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf8d5613f  ! 369: LDSHA_I	ldsha	[%r21, + 0x013f] %asi, %r28
T2_asi_reg_rd_11:
	mov	0x6, %r14
	.word 0xfadb89e0  ! 371: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xfcd40020  ! 372: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r30
iob_intr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_29), 16, 16)) -> intp(2, 0, 9)
	.word 0xb9504000  ! 374: RDPR_TNPC	<illegal instruction>
T2_asi_reg_rd_12:
	mov	0x3c0, %r14
	.word 0xf2db84a0  ! 379: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf004a034  ! 380: LDUW_I	lduw	[%r18 + 0x0034], %r24
	.word 0xf4054000  ! 381: LDUW_R	lduw	[%r21 + %r0], %r26
	.word 0xf28ca0e2  ! 383: LDUBA_I	lduba	[%r18, + 0x00e2] %asi, %r25
	.word 0xf285e0a2  ! 387: LDUWA_I	lduwa	[%r23, + 0x00a2] %asi, %r25
iob_intr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_30), 16, 16)) -> intp(2, 0, b)
T2_asi_reg_rd_13:
	mov	0x10, %r14
	.word 0xf4db8e40  ! 389: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf48c0020  ! 390: LDUBA_R	lduba	[%r16, %r0] 0x01, %r26
	.word 0xf60d4000  ! 393: LDUB_R	ldub	[%r21 + %r0], %r27
	.word 0xfc4c4000  ! 394: LDSB_R	ldsb	[%r17 + %r0], %r30
cpu_intr_2_26:
	setx	0x1f0316, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_31), 16, 16)) -> intp(2, 0, 3f)
	.word 0xfacce0a4  ! 409: LDSBA_I	ldsba	[%r19, + 0x00a4] %asi, %r29
cpu_intr_2_27:
	setx	0x1d0020, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_18:
	mov	0x19, %r14
	.word 0xfef38e40  ! 412: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_wr_19:
	mov	0x3c3, %r14
	.word 0xfcf38e60  ! 414: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T2_asi_reg_rd_14:
	mov	0x1e, %r14
	.word 0xf6db89e0  ! 416: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xf8dd2053  ! 418: LDXA_I	ldxa	[%r20, + 0x0053] %asi, %r28
cpu_intr_2_28:
	setx	0x1d021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_29:
	setx	0x1f0201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc042115  ! 424: LDUW_I	lduw	[%r16 + 0x0115], %r30
	ta	T_CHANGE_NONHPRIV
	.word 0xfe450000  ! 427: LDSW_R	ldsw	[%r20 + %r0], %r31
	.word 0xfac44020  ! 428: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r29
	.word 0xf44c2153  ! 430: LDSB_I	ldsb	[%r16 + 0x0153], %r26
	.word 0xbf346001  ! 432: SRL_I	srl 	%r17, 0x0001, %r31
iob_intr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_32), 16, 16)) -> intp(2, 0, 1d)
iob_intr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_33), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf855c000  ! 437: LDSH_R	ldsh	[%r23 + %r0], %r28
	.word 0xfa0c212d  ! 438: LDUB_I	ldub	[%r16 + 0x012d], %r29
	.word 0xbf353001  ! 440: SRLX_I	srlx	%r20, 0x0001, %r31
	.word 0xf00ce174  ! 442: LDUB_I	ldub	[%r19 + 0x0174], %r24
iob_intr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_34), 16, 16)) -> intp(2, 0, 11)
	.word 0xf85c4000  ! 446: LDX_R	ldx	[%r17 + %r0], %r28
iob_intr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_35), 16, 16)) -> intp(2, 0, 34)
	.word 0xbc240000  ! 452: SUB_R	sub 	%r16, %r0, %r30
T2_asi_reg_rd_15:
	mov	0x2, %r14
	.word 0xf6db8e40  ! 453: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_2_30:
	setx	0x1d0036, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_20:
	mov	0x9, %r14
	.word 0xfaf38400  ! 456: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf444a061  ! 461: LDSW_I	ldsw	[%r18 + 0x0061], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2158000  ! 463: LDUH_R	lduh	[%r22 + %r0], %r25
cpu_intr_2_31:
	setx	0x1d013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf854a103  ! 467: LDSH_I	ldsh	[%r18 + 0x0103], %r28
T2_asi_reg_wr_21:
	mov	0x24, %r14
	.word 0xf2f38e40  ! 469: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_36), 16, 16)) -> intp(2, 0, a)
cpu_intr_2_32:
	setx	0x1d0109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44da1a2  ! 474: LDSB_I	ldsb	[%r22 + 0x01a2], %r26
iob_intr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_37), 16, 16)) -> intp(2, 0, 2c)
	.word 0xb12ca001  ! 476: SLL_I	sll 	%r18, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_38), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_33:
	setx	0x230329, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_34:
	setx	0x22023a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_39), 16, 16)) -> intp(2, 0, 2)
	.word 0xb77c8400  ! 489: MOVR_R	movre	%r18, %r0, %r27
	.word 0xfe8c8020  ! 492: LDUBA_R	lduba	[%r18, %r0] 0x01, %r31
	.word 0xf88da056  ! 494: LDUBA_I	lduba	[%r22, + 0x0056] %asi, %r28
T2_asi_reg_rd_16:
	mov	0x18, %r14
	.word 0xfadb8e80  ! 497: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xfc944020  ! 499: LDUHA_R	lduha	[%r17, %r0] 0x01, %r30
	.word 0xfe4d4000  ! 500: LDSB_R	ldsb	[%r21 + %r0], %r31
iob_intr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_40), 16, 16)) -> intp(2, 0, 3c)
	.word 0xb5510000  ! 503: RDPR_TICK	rdpr	%tick, %r26
T2_asi_reg_rd_17:
	mov	0x0, %r14
	.word 0xf8db8e40  ! 505: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_41), 16, 16)) -> intp(2, 0, f)
T2_asi_reg_rd_18:
	mov	0x38, %r14
	.word 0xf0db8e80  ! 509: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xf6858020  ! 511: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r27
T2_asi_reg_wr_22:
	mov	0x24, %r14
	.word 0xf2f389e0  ! 512: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf20d8000  ! 513: LDUB_R	ldub	[%r22 + %r0], %r25
	.word 0xf25de106  ! 517: LDX_I	ldx	[%r23 + 0x0106], %r25
T2_asi_reg_rd_19:
	mov	0x16, %r14
	.word 0xfcdb8e80  ! 518: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xfcd4a08c  ! 519: LDSHA_I	ldsha	[%r18, + 0x008c] %asi, %r30
	.word 0xf28d2124  ! 522: LDUBA_I	lduba	[%r20, + 0x0124] %asi, %r25
	.word 0xfe4d21ca  ! 523: LDSB_I	ldsb	[%r20 + 0x01ca], %r31
T2_asi_reg_rd_20:
	mov	0x3c6, %r14
	.word 0xf6db89e0  ! 524: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983d40  ! 525: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d40, %hpstate
T2_asi_reg_wr_23:
	mov	0x3c1, %r14
	.word 0xf0f389e0  ! 528: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbcc5c000  ! 532: ADDCcc_R	addccc 	%r23, %r0, %r30
T2_asi_reg_wr_24:
	mov	0x3c2, %r14
	.word 0xf0f389e0  ! 536: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T2_asi_reg_wr_25:
	mov	0x3c6, %r14
	.word 0xf6f38e40  ! 537: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_2_35:
	setx	0x200135, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_42), 16, 16)) -> intp(2, 0, 3d)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982800  ! 544: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0800, %hpstate
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_21:
	mov	0x19, %r14
	.word 0xf2db84a0  ! 551: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_2_36:
	setx	0x210006, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_43), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_rd_22:
	mov	0x21, %r14
	.word 0xfcdb89e0  ! 562: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_44), 16, 16)) -> intp(2, 0, 21)
cpu_intr_2_37:
	setx	0x21032f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_26:
	mov	0x3c0, %r14
	.word 0xf8f38400  ! 567: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0x899461d3  ! 568: WRPR_TICK_I	wrpr	%r17, 0x01d3, %tick
	.word 0xbf341000  ! 569: SRLX_R	srlx	%r16, %r0, %r31
T2_asi_reg_wr_27:
	mov	0x30, %r14
	.word 0xf8f38e40  ! 570: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf2cde1fb  ! 575: LDSBA_I	ldsba	[%r23, + 0x01fb] %asi, %r25
	.word 0xfc0de09d  ! 577: LDUB_I	ldub	[%r23 + 0x009d], %r30
	.word 0xf24da140  ! 578: LDSB_I	ldsb	[%r22 + 0x0140], %r25
T2_asi_reg_rd_23:
	mov	0x3c4, %r14
	.word 0xf2db8400  ! 579: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982982  ! 580: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0982, %hpstate
iob_intr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_45), 16, 16)) -> intp(2, 0, 15)
iob_intr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_46), 16, 16)) -> intp(2, 0, 1b)
iob_intr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_47), 16, 16)) -> intp(2, 0, 24)
iob_intr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_48), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf205600a  ! 587: LDUW_I	lduw	[%r21 + 0x000a], %r25
	.word 0xb52d2001  ! 588: SLL_I	sll 	%r20, 0x0001, %r26
	.word 0xba8d4000  ! 589: ANDcc_R	andcc 	%r21, %r0, %r29
cpu_intr_2_38:
	setx	0x200213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25c21ab  ! 592: LDX_I	ldx	[%r16 + 0x01ab], %r25
	.word 0xf81461a8  ! 596: LDUH_I	lduh	[%r17 + 0x01a8], %r28
cpu_intr_2_39:
	setx	0x200021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe040000  ! 600: LDUW_R	lduw	[%r16 + %r0], %r31
cpu_intr_2_40:
	setx	0x230135, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_49), 16, 16)) -> intp(2, 0, 14)
	.word 0xb6240000  ! 607: SUB_R	sub 	%r16, %r0, %r27
	.word 0xb21c211f  ! 614: XOR_I	xor 	%r16, 0x011f, %r25
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982858  ! 615: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0858, %hpstate
T2_asi_reg_wr_28:
	mov	0x2d, %r14
	.word 0xfaf38e60  ! 616: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf415c000  ! 619: LDUH_R	lduh	[%r23 + %r0], %r26
	.word 0xf2452046  ! 621: LDSW_I	ldsw	[%r20 + 0x0046], %r25
cpu_intr_2_41:
	setx	0x210135, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_50), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_42:
	setx	0x22032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4d4000  ! 631: LDSB_R	ldsb	[%r21 + %r0], %r29
cpu_intr_2_43:
	setx	0x20023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf005c000  ! 637: LDUW_R	lduw	[%r23 + %r0], %r24
	.word 0xf29560f9  ! 638: LDUHA_I	lduha	[%r21, + 0x00f9] %asi, %r25
iob_intr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_51), 16, 16)) -> intp(2, 0, 18)
cpu_intr_2_44:
	setx	0x210039, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x819829c2  ! 647: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c2, %hpstate
cpu_intr_2_45:
	setx	0x220104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8058000  ! 649: LDUW_R	lduw	[%r22 + %r0], %r28
T2_asi_reg_wr_29:
	mov	0x6, %r14
	.word 0xf2f38e40  ! 650: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0x91942106  ! 651: WRPR_PIL_I	wrpr	%r16, 0x0106, %pil
	.word 0xf48da0e7  ! 652: LDUBA_I	lduba	[%r22, + 0x00e7] %asi, %r26
	.word 0xf2958020  ! 656: LDUHA_R	lduha	[%r22, %r0] 0x01, %r25
	.word 0xf0854020  ! 658: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r24
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_TO_TL1
cpu_intr_2_46:
	setx	0x210130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe348000  ! 664: ORN_R	orn 	%r18, %r0, %r31
T2_asi_reg_rd_24:
	mov	0xb, %r14
	.word 0xf4db84a0  ! 667: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf24d4000  ! 668: LDSB_R	ldsb	[%r21 + %r0], %r25
	.word 0xf2446072  ! 670: LDSW_I	ldsw	[%r17 + 0x0072], %r25
	.word 0xf6840020  ! 671: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r27
cpu_intr_2_47:
	setx	0x210028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc3de10e  ! 673: XNOR_I	xnor 	%r23, 0x010e, %r30
	.word 0xf6d5a188  ! 674: LDSHA_I	ldsha	[%r22, + 0x0188] %asi, %r27
iob_intr_2_52:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_52), 16, 16)) -> intp(2, 0, 2)
	ta	T_CHANGE_TO_TL1
cpu_intr_2_48:
	setx	0x23012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc44c000  ! 680: LDSW_R	ldsw	[%r19 + %r0], %r30
	.word 0xfc5c4000  ! 682: LDX_R	ldx	[%r17 + %r0], %r30
	ta	T_CHANGE_NONHPRIV
	.word 0xf2c52129  ! 687: LDSWA_I	ldswa	[%r20, + 0x0129] %asi, %r25
cpu_intr_2_49:
	setx	0x200202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf605e0e3  ! 690: LDUW_I	lduw	[%r23 + 0x00e3], %r27
	.word 0xb4444000  ! 695: ADDC_R	addc 	%r17, %r0, %r26
	.word 0xbc14c000  ! 697: OR_R	or 	%r19, %r0, %r30
cpu_intr_2_50:
	setx	0x22001a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_53:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_53), 16, 16)) -> intp(2, 0, 12)
T2_asi_reg_wr_30:
	mov	0x5, %r14
	.word 0xf0f38e80  ! 704: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf4858020  ! 705: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r26
T2_asi_reg_wr_31:
	mov	0x3c1, %r14
	.word 0xfaf38e80  ! 707: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb085e003  ! 710: ADDcc_I	addcc 	%r23, 0x0003, %r24
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982a02  ! 711: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a02, %hpstate
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982bca  ! 712: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bca, %hpstate
iob_intr_2_54:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_54), 16, 16)) -> intp(2, 0, 33)
iob_intr_2_55:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_55), 16, 16)) -> intp(2, 0, 38)
cpu_intr_2_51:
	setx	0x23023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa45a14b  ! 721: LDSW_I	ldsw	[%r22 + 0x014b], %r29
	.word 0xbcbcc000  ! 722: XNORcc_R	xnorcc 	%r19, %r0, %r30
T2_asi_reg_rd_25:
	mov	0x3c3, %r14
	.word 0xf6db8e40  ! 727: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983848  ! 729: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1848, %hpstate
	.word 0xb534c000  ! 738: SRL_R	srl 	%r19, %r0, %r26
	.word 0xf8cce084  ! 739: LDSBA_I	ldsba	[%r19, + 0x0084] %asi, %r28
iob_intr_2_56:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_56), 16, 16)) -> intp(2, 0, 1a)
	.word 0xbcb48000  ! 743: ORNcc_R	orncc 	%r18, %r0, %r30
	.word 0xb3510000  ! 745: RDPR_TICK	<illegal instruction>
	.word 0xb49c608c  ! 748: XORcc_I	xorcc 	%r17, 0x008c, %r26
	.word 0xfe5c6182  ! 749: LDX_I	ldx	[%r17 + 0x0182], %r31
T2_asi_reg_rd_26:
	mov	0x3c2, %r14
	.word 0xfadb8e80  ! 754: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_2_52:
	setx	0x220134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec5a00d  ! 759: LDSWA_I	ldswa	[%r22, + 0x000d] %asi, %r31
iob_intr_2_57:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_57), 16, 16)) -> intp(2, 0, 15)
T2_asi_reg_wr_32:
	mov	0x3c3, %r14
	.word 0xfaf38400  ! 763: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_2_58:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_58), 16, 16)) -> intp(2, 0, 3a)
T2_asi_reg_wr_33:
	mov	0x22, %r14
	.word 0xf2f38e40  ! 766: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_2_53:
	setx	0x22021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2c4607e  ! 771: LDSWA_I	ldswa	[%r17, + 0x007e] %asi, %r25
cpu_intr_2_54:
	setx	0x230238, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_55:
	setx	0x200008, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_59:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_59), 16, 16)) -> intp(2, 0, 23)
	.word 0xf0c5e01f  ! 778: LDSWA_I	ldswa	[%r23, + 0x001f] %asi, %r24
	ta	T_CHANGE_TO_TL0
	.word 0xfe15c000  ! 780: LDUH_R	lduh	[%r23 + %r0], %r31
T2_asi_reg_wr_34:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 782: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbb520000  ! 784: RDPR_PIL	<illegal instruction>
T2_asi_reg_wr_35:
	mov	0x3c4, %r14
	.word 0xf8f38e80  ! 785: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf8d4a04f  ! 787: LDSHA_I	ldsha	[%r18, + 0x004f] %asi, %r28
iob_intr_2_60:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_60), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_wr_36:
	mov	0x3c5, %r14
	.word 0xf4f38400  ! 789: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T2_asi_reg_wr_37:
	mov	0x16, %r14
	.word 0xf4f38e40  ! 790: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfad54020  ! 795: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r29
iob_intr_2_61:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_61), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_56:
	setx	0x20011e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_62:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_62), 16, 16)) -> intp(2, 0, 21)
iob_intr_2_63:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_63), 16, 16)) -> intp(2, 0, 8)
	.word 0xbf7c0400  ! 808: MOVR_R	movre	%r16, %r0, %r31
iob_intr_2_64:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_64), 16, 16)) -> intp(2, 0, 2f)
iob_intr_2_65:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_65), 16, 16)) -> intp(2, 0, 30)
	.word 0xfc854020  ! 821: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r30
	.word 0xf255a083  ! 824: LDSH_I	ldsh	[%r22 + 0x0083], %r25
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983bd0  ! 825: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd0, %hpstate
iob_intr_2_66:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_66), 16, 16)) -> intp(2, 0, 6)
	.word 0xbf7c8400  ! 828: MOVR_R	movre	%r18, %r0, %r31
T2_asi_reg_rd_27:
	mov	0x2f, %r14
	.word 0xfcdb84a0  ! 834: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf8142156  ! 835: LDUH_I	lduh	[%r16 + 0x0156], %r28
	.word 0xb42d218d  ! 836: ANDN_I	andn 	%r20, 0x018d, %r26
	.word 0xfc5d8000  ! 842: LDX_R	ldx	[%r22 + %r0], %r30
cpu_intr_2_57:
	setx	0x21002b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_28:
	mov	0x3c8, %r14
	.word 0xf8db8e40  ! 844: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf6c4c020  ! 845: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r27
iob_intr_2_67:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_67), 16, 16)) -> intp(2, 0, 20)
	.word 0xf25da1f9  ! 849: LDX_I	ldx	[%r22 + 0x01f9], %r25
T2_asi_reg_wr_38:
	mov	0x3c7, %r14
	.word 0xf8f38e60  ! 852: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T2_asi_reg_rd_29:
	mov	0x3c7, %r14
	.word 0xf4db89e0  ! 854: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T2_asi_reg_wr_39:
	mov	0x1f, %r14
	.word 0xfcf38400  ! 861: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_2_68:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_68), 16, 16)) -> intp(2, 0, 25)
	.word 0xf0cd20da  ! 863: LDSBA_I	ldsba	[%r20, + 0x00da] %asi, %r24
T2_asi_reg_wr_40:
	mov	0x2a, %r14
	.word 0xf0f38e40  ! 864: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf6148000  ! 866: LDUH_R	lduh	[%r18 + %r0], %r27
T2_asi_reg_wr_41:
	mov	0x3c8, %r14
	.word 0xf4f38e40  ! 867: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf8c50020  ! 868: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r28
cpu_intr_2_58:
	setx	0x210307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_59:
	setx	0x20001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6854020  ! 878: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_69:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_69), 16, 16)) -> intp(2, 0, c)
	.word 0xfa156140  ! 890: LDUH_I	lduh	[%r21 + 0x0140], %r29
	.word 0xb9508000  ! 892: RDPR_TSTATE	<illegal instruction>
cpu_intr_2_60:
	setx	0x210104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc050000  ! 895: LDUW_R	lduw	[%r20 + %r0], %r30
	.word 0xfe5c0000  ! 896: LDX_R	ldx	[%r16 + %r0], %r31
	.word 0xf45560c2  ! 897: LDSH_I	ldsh	[%r21 + 0x00c2], %r26
	ta	T_CHANGE_NONHPRIV
iob_intr_2_70:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_70), 16, 16)) -> intp(2, 0, 19)
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982d58  ! 901: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d58, %hpstate
	.word 0xfa140000  ! 904: LDUH_R	lduh	[%r16 + %r0], %r29
T2_asi_reg_rd_30:
	mov	0x5, %r14
	.word 0xf8db89e0  ! 907: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	ta	T_CHANGE_TO_TL1
iob_intr_2_71:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_71), 16, 16)) -> intp(2, 0, 1)
cpu_intr_2_61:
	setx	0x230228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65ca192  ! 913: LDX_I	ldx	[%r18 + 0x0192], %r27
cpu_intr_2_62:
	setx	0x220013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4448000  ! 916: LDSW_R	ldsw	[%r18 + %r0], %r26
	.word 0xf65c8000  ! 917: LDX_R	ldx	[%r18 + %r0], %r27
	.word 0xf08dc020  ! 919: LDUBA_R	lduba	[%r23, %r0] 0x01, %r24
T2_asi_reg_wr_42:
	mov	0x12, %r14
	.word 0xfef38e40  ! 920: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfc040000  ! 921: LDUW_R	lduw	[%r16 + %r0], %r30
	.word 0xf40c4000  ! 922: LDUB_R	ldub	[%r17 + %r0], %r26
	.word 0xb0954000  ! 924: ORcc_R	orcc 	%r21, %r0, %r24
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_43:
	mov	0x3c7, %r14
	.word 0xfef384a0  ! 931: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	.word 0xfa04e147  ! 940: LDUW_I	lduw	[%r19 + 0x0147], %r29
	.word 0xfacc2185  ! 941: LDSBA_I	ldsba	[%r16, + 0x0185] %asi, %r29
T2_asi_reg_wr_44:
	mov	0x1b, %r14
	.word 0xfef384a0  ! 942: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xba0c4000  ! 943: AND_R	and 	%r17, %r0, %r29
cpu_intr_2_63:
	setx	0x240234, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982f42  ! 946: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f42, %hpstate
cpu_intr_2_64:
	setx	0x27032c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_31:
	mov	0x3c8, %r14
	.word 0xf6db8400  ! 949: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xfe44c000  ! 952: LDSW_R	ldsw	[%r19 + %r0], %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_65:
	setx	0x27032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2cda162  ! 959: LDSBA_I	ldsba	[%r22, + 0x0162] %asi, %r25
	.word 0xfc5da0da  ! 960: LDX_I	ldx	[%r22 + 0x00da], %r30
	.word 0xbe354000  ! 965: ORN_R	orn 	%r21, %r0, %r31
	.word 0xb085e1bb  ! 967: ADDcc_I	addcc 	%r23, 0x01bb, %r24
	.word 0xf4d40020  ! 969: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r26
	.word 0xfcc56154  ! 971: LDSWA_I	ldswa	[%r21, + 0x0154] %asi, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbe358000  ! 976: ORN_R	orn 	%r22, %r0, %r31
	ta	T_CHANGE_TO_TL0
cpu_intr_2_66:
	setx	0x26012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb735a001  ! 981: SRL_I	srl 	%r22, 0x0001, %r27
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982f92  ! 983: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f92, %hpstate
	.word 0xfa8dc020  ! 984: LDUBA_R	lduba	[%r23, %r0] 0x01, %r29
	.word 0xfe0520db  ! 987: LDUW_I	lduw	[%r20 + 0x00db], %r31
	.word 0xfa8da0b1  ! 988: LDUBA_I	lduba	[%r22, + 0x00b1] %asi, %r29
	.word 0xfc0560f1  ! 993: LDUW_I	lduw	[%r21 + 0x00f1], %r30
cpu_intr_2_67:
	setx	0x25020e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_32:
	mov	0x1b, %r14
	.word 0xfadb8e80  ! 996: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T2_asi_reg_wr_45:
	mov	0x3c7, %r14
	.word 0xfef389e0  ! 997: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_2_72:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_72), 16, 16)) -> intp(2, 0, 27)
	.word 0xf6d52135  ! 1003: LDSHA_I	ldsha	[%r20, + 0x0135] %asi, %r27
cpu_intr_2_68:
	setx	0x260037, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_69:
	setx	0x250008, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_46:
	mov	0x3c2, %r14
	.word 0xf4f38e80  ! 1007: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_2_70:
	setx	0x25033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_33:
	mov	0x15, %r14
	.word 0xfedb8e40  ! 1011: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_2_73:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_73), 16, 16)) -> intp(2, 0, f)
iob_intr_2_74:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_74), 16, 16)) -> intp(2, 0, 14)
	.word 0xf6146133  ! 1021: LDUH_I	lduh	[%r17 + 0x0133], %r27
	.word 0xb0c461c9  ! 1023: ADDCcc_I	addccc 	%r17, 0x01c9, %r24
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbc35a070  ! 1029: ORN_I	orn 	%r22, 0x0070, %r30
cpu_intr_2_71:
	setx	0x27032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_34:
	mov	0x3c4, %r14
	.word 0xfedb8e60  ! 1032: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf85ce159  ! 1035: LDX_I	ldx	[%r19 + 0x0159], %r28
	.word 0xfc946173  ! 1037: LDUHA_I	lduha	[%r17, + 0x0173] %asi, %r30
	.word 0xf8cc21b0  ! 1039: LDSBA_I	ldsba	[%r16, + 0x01b0] %asi, %r28
iob_intr_2_75:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_75), 16, 16)) -> intp(2, 0, 3c)
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_35:
	mov	0x3c8, %r14
	.word 0xf2db8e80  ! 1048: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb2840000  ! 1049: ADDcc_R	addcc 	%r16, %r0, %r25
T2_asi_reg_rd_36:
	mov	0x36, %r14
	.word 0xf8db8e40  ! 1050: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf00420ad  ! 1051: LDUW_I	lduw	[%r16 + 0x00ad], %r24
	.word 0xf00c8000  ! 1052: LDUB_R	ldub	[%r18 + %r0], %r24
	.word 0xf0c58020  ! 1053: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r24
iob_intr_2_76:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_76), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_72:
	setx	0x308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfed4c020  ! 1058: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r31
	.word 0xbeb420cf  ! 1060: ORNcc_I	orncc 	%r16, 0x00cf, %r31
cpu_intr_2_73:
	setx	0x27011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe15c000  ! 1063: LDUH_R	lduh	[%r23 + %r0], %r31
iob_intr_2_77:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_77), 16, 16)) -> intp(2, 0, 14)
	.word 0xb08c20bb  ! 1066: ANDcc_I	andcc 	%r16, 0x00bb, %r24
cpu_intr_2_74:
	setx	0x240039, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_75:
	setx	0x270128, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_47:
	mov	0x9, %r14
	.word 0xfaf38e80  ! 1069: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_2_78:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_78), 16, 16)) -> intp(2, 0, 19)
iob_intr_2_79:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_79), 16, 16)) -> intp(2, 0, 22)
	.word 0xf0cd21a0  ! 1075: LDSBA_I	ldsba	[%r20, + 0x01a0] %asi, %r24
iob_intr_2_80:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_80), 16, 16)) -> intp(2, 0, 27)
	.word 0xfc8c8020  ! 1084: LDUBA_R	lduba	[%r18, %r0] 0x01, %r30
	.word 0xf28ce19c  ! 1085: LDUBA_I	lduba	[%r19, + 0x019c] %asi, %r25
	.word 0xf444a185  ! 1089: LDSW_I	ldsw	[%r18 + 0x0185], %r26
cpu_intr_2_76:
	setx	0x26003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa94a167  ! 1092: LDUHA_I	lduha	[%r18, + 0x0167] %asi, %r29
	.word 0xf654e1d5  ! 1095: LDSH_I	ldsh	[%r19 + 0x01d5], %r27
cpu_intr_2_77:
	setx	0x26001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf494a042  ! 1098: LDUHA_I	lduha	[%r18, + 0x0042] %asi, %r26
	.word 0xf0c5a139  ! 1099: LDSWA_I	ldswa	[%r22, + 0x0139] %asi, %r24
	.word 0xf00da17c  ! 1100: LDUB_I	ldub	[%r22 + 0x017c], %r24
	.word 0xf2540000  ! 1101: LDSH_R	ldsh	[%r16 + %r0], %r25
	.word 0xfac4c020  ! 1103: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r29
	.word 0xf6558000  ! 1105: LDSH_R	ldsh	[%r22 + %r0], %r27
	.word 0xf6558000  ! 1106: LDSH_R	ldsh	[%r22 + %r0], %r27
cpu_intr_2_78:
	setx	0x260320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0c40020  ! 1109: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r24
T2_asi_reg_wr_48:
	mov	0x3c2, %r14
	.word 0xf6f384a0  ! 1113: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_2_81:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_81), 16, 16)) -> intp(2, 0, 3c)
cpu_intr_2_79:
	setx	0x250203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4058000  ! 1119: LDUW_R	lduw	[%r22 + %r0], %r26
	.word 0xb69c8000  ! 1120: XORcc_R	xorcc 	%r18, %r0, %r27
iob_intr_2_82:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_82), 16, 16)) -> intp(2, 0, 20)
	.word 0xfa5cc000  ! 1123: LDX_R	ldx	[%r19 + %r0], %r29
iob_intr_2_83:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_83), 16, 16)) -> intp(2, 0, 35)
iob_intr_2_84:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_84), 16, 16)) -> intp(2, 0, 9)
	.word 0xb7351000  ! 1126: SRLX_R	srlx	%r20, %r0, %r27
	.word 0xfc94e05a  ! 1127: LDUHA_I	lduha	[%r19, + 0x005a] %asi, %r30
cpu_intr_2_80:
	setx	0x270329, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_85:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_85), 16, 16)) -> intp(2, 0, 18)
cpu_intr_2_81:
	setx	0x270029, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_2_86:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_86), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_wr_49:
	mov	0xf, %r14
	.word 0xf2f38e40  ! 1140: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf6840020  ! 1141: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r27
	ta	T_CHANGE_TO_TL0
	.word 0xf08c60d8  ! 1143: LDUBA_I	lduba	[%r17, + 0x00d8] %asi, %r24
cpu_intr_2_82:
	setx	0x25020a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_83:
	setx	0x250219, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_84:
	setx	0x26020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983c52  ! 1151: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c52, %hpstate
	.word 0xf605e175  ! 1152: LDUW_I	lduw	[%r23 + 0x0175], %r27
T2_asi_reg_rd_37:
	mov	0x9, %r14
	.word 0xfedb89e0  ! 1157: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf85c6191  ! 1158: LDX_I	ldx	[%r17 + 0x0191], %r28
	.word 0xf4456044  ! 1167: LDSW_I	ldsw	[%r21 + 0x0044], %r26
iob_intr_2_87:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_87), 16, 16)) -> intp(2, 0, 39)
iob_intr_2_88:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_88), 16, 16)) -> intp(2, 0, 3)
T2_asi_reg_wr_50:
	mov	0xb, %r14
	.word 0xf2f384a0  ! 1173: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	ta	T_CHANGE_TO_TL1
	.word 0xf8cdc020  ! 1179: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r28
iob_intr_2_89:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_89), 16, 16)) -> intp(2, 0, 3f)
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983c08  ! 1181: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c08, %hpstate
	.word 0xb73d2001  ! 1184: SRA_I	sra 	%r20, 0x0001, %r27
iob_intr_2_90:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_90), 16, 16)) -> intp(2, 0, 2f)
cpu_intr_2_85:
	setx	0x250104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb480000  ! 1188: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x819828c8  ! 1189: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c8, %hpstate
	.word 0xba15e1bd  ! 1193: OR_I	or 	%r23, 0x01bd, %r29
	.word 0xb4340000  ! 1194: ORN_R	orn 	%r16, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf8d46073  ! 1197: LDSHA_I	ldsha	[%r17, + 0x0073] %asi, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_91:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_91), 16, 16)) -> intp(2, 0, 1c)
iob_intr_2_92:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_92), 16, 16)) -> intp(2, 0, 5)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_86:
	setx	0x27031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0144000  ! 1211: LDUH_R	lduh	[%r17 + %r0], %r24
iob_intr_2_93:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_93), 16, 16)) -> intp(2, 0, 21)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb72c6001  ! 1216: SLL_I	sll 	%r17, 0x0001, %r27
T2_asi_reg_rd_38:
	mov	0x31, %r14
	.word 0xfedb8e40  ! 1217: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf4540000  ! 1219: LDSH_R	ldsh	[%r16 + %r0], %r26
	.word 0xb48c6139  ! 1221: ANDcc_I	andcc 	%r17, 0x0139, %r26
	.word 0xb534e001  ! 1222: SRL_I	srl 	%r19, 0x0001, %r26
	.word 0xfecda096  ! 1224: LDSBA_I	ldsba	[%r22, + 0x0096] %asi, %r31
	.word 0xf8c4c020  ! 1225: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r28
	.word 0xfa844020  ! 1226: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r29
T2_asi_reg_wr_51:
	mov	0x21, %r14
	.word 0xf2f384a0  ! 1228: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xfe5c0000  ! 1229: LDX_R	ldx	[%r16 + %r0], %r31
	.word 0xf6cd0020  ! 1230: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r27
iob_intr_2_94:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_94), 16, 16)) -> intp(2, 0, 1a)
	.word 0xb8b4200c  ! 1243: ORNcc_I	orncc 	%r16, 0x000c, %r28
	.word 0xfe150000  ! 1247: LDUH_R	lduh	[%r20 + %r0], %r31
cpu_intr_2_87:
	setx	0x260131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d4c020  ! 1252: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r25
T2_asi_reg_rd_39:
	mov	0x3c5, %r14
	.word 0xf2db8e60  ! 1253: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_2_88:
	setx	0x27023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_40:
	mov	0xc, %r14
	.word 0xf4db89e0  ! 1261: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_2_95:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_95), 16, 16)) -> intp(2, 0, e)
T2_asi_reg_rd_41:
	mov	0x3c5, %r14
	.word 0xf0db89e0  ! 1263: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	ta	T_CHANGE_TO_TL0
	.word 0xf645e109  ! 1266: LDSW_I	ldsw	[%r23 + 0x0109], %r27
	.word 0xbe0d0000  ! 1267: AND_R	and 	%r20, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_42:
	mov	0x2f, %r14
	.word 0xf4db84a0  ! 1269: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_2_96:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_96), 16, 16)) -> intp(2, 0, 3)
iob_intr_2_97:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_97), 16, 16)) -> intp(2, 0, 5)
cpu_intr_2_89:
	setx	0x26012c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_52:
	mov	0x3c8, %r14
	.word 0xf8f389e0  ! 1276: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_43:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 1279: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T2_asi_reg_rd_44:
	mov	0x4, %r14
	.word 0xf6db8e80  ! 1281: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_2_98:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_98), 16, 16)) -> intp(2, 0, 3a)
T2_asi_reg_rd_45:
	mov	0x15, %r14
	.word 0xf0db8e40  ! 1288: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_46:
	mov	0x2f, %r14
	.word 0xf6db8400  ! 1292: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T2_asi_reg_wr_53:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 1293: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf815208a  ! 1294: LDUH_I	lduh	[%r20 + 0x008a], %r28
	.word 0xf8c5c020  ! 1296: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r28
T2_asi_reg_rd_47:
	mov	0x8, %r14
	.word 0xf6db8e40  ! 1298: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_wr_54:
	mov	0x3c2, %r14
	.word 0xfcf38400  ! 1300: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T2_asi_reg_wr_55:
	mov	0x14, %r14
	.word 0xfaf38e40  ! 1301: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_90:
	setx	0x270238, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_91:
	setx	0x260118, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983888  ! 1304: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1888, %hpstate
	.word 0xb41d2065  ! 1305: XOR_I	xor 	%r20, 0x0065, %r26
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982c4a  ! 1306: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4a, %hpstate
	.word 0xf8dce1c5  ! 1312: LDXA_I	ldxa	[%r19, + 0x01c5] %asi, %r28
	.word 0xb28c4000  ! 1313: ANDcc_R	andcc 	%r17, %r0, %r25
iob_intr_2_99:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_99), 16, 16)) -> intp(2, 0, 23)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_56:
	mov	0x3c1, %r14
	.word 0xf2f384a0  ! 1317: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xfa4d0000  ! 1320: LDSB_R	ldsb	[%r20 + %r0], %r29
	.word 0xfc846086  ! 1321: LDUWA_I	lduwa	[%r17, + 0x0086] %asi, %r30
iob_intr_2_100:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_100), 16, 16)) -> intp(2, 0, 12)
T2_asi_reg_wr_57:
	mov	0x3c0, %r14
	.word 0xfcf38400  ! 1325: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_2_101:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_101), 16, 16)) -> intp(2, 0, 3e)
iob_intr_2_102:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_102), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_92:
	setx	0x270325, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_48:
	mov	0x20, %r14
	.word 0xf8db8e80  ! 1334: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xfec40020  ! 1335: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r31
	.word 0xfccd2052  ! 1337: LDSBA_I	ldsba	[%r20, + 0x0052] %asi, %r30
	.word 0xf24c21c3  ! 1338: LDSB_I	ldsb	[%r16 + 0x01c3], %r25
cpu_intr_2_93:
	setx	0x27031b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_103:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_103), 16, 16)) -> intp(2, 0, 4)
iob_intr_2_104:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_104), 16, 16)) -> intp(2, 0, 21)
	.word 0xf8958020  ! 1346: LDUHA_R	lduha	[%r22, %r0] 0x01, %r28
cpu_intr_2_94:
	setx	0x250104, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_95:
	setx	0x240303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf08560a1  ! 1357: LDUWA_I	lduwa	[%r21, + 0x00a1] %asi, %r24
	.word 0xf605a15a  ! 1361: LDUW_I	lduw	[%r22 + 0x015a], %r27
T2_asi_reg_rd_49:
	mov	0x1a, %r14
	.word 0xf2db84a0  ! 1364: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_2_105:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_105), 16, 16)) -> intp(2, 0, 32)
T2_asi_reg_wr_58:
	mov	0xf, %r14
	.word 0xf2f38e40  ! 1366: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T2_asi_reg_wr_59:
	mov	0x16, %r14
	.word 0xf0f38e40  ! 1369: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_wr_60:
	mov	0x1c, %r14
	.word 0xf4f389e0  ! 1371: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf48dc020  ! 1373: LDUBA_R	lduba	[%r23, %r0] 0x01, %r26
	.word 0xf6d4a1af  ! 1374: LDSHA_I	ldsha	[%r18, + 0x01af] %asi, %r27
	.word 0xf885a10b  ! 1375: LDUWA_I	lduwa	[%r22, + 0x010b] %asi, %r28
	.word 0xf84c4000  ! 1376: LDSB_R	ldsb	[%r17 + %r0], %r28
T2_asi_reg_rd_50:
	mov	0x1a, %r14
	.word 0xfcdb8e40  ! 1377: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfe8c4020  ! 1378: LDUBA_R	lduba	[%r17, %r0] 0x01, %r31
	.word 0xfc950020  ! 1381: LDUHA_R	lduha	[%r20, %r0] 0x01, %r30
T2_asi_reg_wr_61:
	mov	0x3c7, %r14
	.word 0xf0f384a0  ! 1383: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_2_106:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_106), 16, 16)) -> intp(2, 0, 21)
cpu_intr_2_96:
	setx	0x24013b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_62:
	mov	0x3c7, %r14
	.word 0xf2f389e0  ! 1390: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T2_asi_reg_rd_51:
	mov	0x1d, %r14
	.word 0xf4db8e80  ! 1392: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb6ad8000  ! 1394: ANDNcc_R	andncc 	%r22, %r0, %r27
cpu_intr_2_97:
	setx	0x2b0115, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_98:
	setx	0x2b0216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa448000  ! 1402: LDSW_R	ldsw	[%r18 + %r0], %r29
iob_intr_2_107:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_107), 16, 16)) -> intp(2, 0, 23)
iob_intr_2_108:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_108), 16, 16)) -> intp(2, 0, 28)
cpu_intr_2_99:
	setx	0x2a0337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65da17f  ! 1407: LDX_I	ldx	[%r22 + 0x017f], %r27
	.word 0xf814c000  ! 1411: LDUH_R	lduh	[%r19 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfe4da18d  ! 1414: LDSB_I	ldsb	[%r22 + 0x018d], %r31
	.word 0xf45d8000  ! 1415: LDX_R	ldx	[%r22 + %r0], %r26
iob_intr_2_109:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_109), 16, 16)) -> intp(2, 0, 22)
T2_asi_reg_rd_52:
	mov	0x3c3, %r14
	.word 0xf2db8e40  ! 1419: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_63:
	mov	0x3c6, %r14
	.word 0xf8f38400  ! 1428: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_2_100:
	setx	0x290309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa854020  ! 1430: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r29
	.word 0xf8cd0020  ! 1431: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r28
T2_asi_reg_rd_53:
	mov	0x7, %r14
	.word 0xf8db8e80  ! 1432: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T2_asi_reg_wr_64:
	mov	0x3c0, %r14
	.word 0xf0f38e60  ! 1437: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T2_asi_reg_wr_65:
	mov	0x3c1, %r14
	.word 0xf4f38400  ! 1438: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf8148000  ! 1439: LDUH_R	lduh	[%r18 + %r0], %r28
iob_intr_2_110:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_110), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_rd_54:
	mov	0x15, %r14
	.word 0xf6db89e0  ! 1445: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_2_101:
	setx	0x2b0138, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_66:
	mov	0x3c2, %r14
	.word 0xf2f38e80  ! 1448: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_2_111:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_111), 16, 16)) -> intp(2, 0, 7)
	.word 0xbf7cc400  ! 1451: MOVR_R	movre	%r19, %r0, %r31
iob_intr_2_112:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_112), 16, 16)) -> intp(2, 0, 6)
T2_asi_reg_wr_67:
	mov	0x26, %r14
	.word 0xfef384a0  ! 1457: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf0cc0020  ! 1458: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r24
	.word 0xfac40020  ! 1461: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r29
	.word 0xb834610a  ! 1462: ORN_I	orn 	%r17, 0x010a, %r28
cpu_intr_2_102:
	setx	0x280024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60c4000  ! 1465: LDUB_R	ldub	[%r17 + %r0], %r27
cpu_intr_2_103:
	setx	0x2a0239, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_104:
	setx	0x29032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_105:
	setx	0x2a0109, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_55:
	mov	0x3c2, %r14
	.word 0xf6db8e80  ! 1475: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xfed5e1bc  ! 1477: LDSHA_I	ldsha	[%r23, + 0x01bc] %asi, %r31
	.word 0xf8dd6080  ! 1478: LDXA_I	ldxa	[%r21, + 0x0080] %asi, %r28
T2_asi_reg_wr_68:
	mov	0x1c, %r14
	.word 0xf0f38e80  ! 1481: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_2_106:
	setx	0x28031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa042082  ! 1489: LDUW_I	lduw	[%r16 + 0x0082], %r29
T2_asi_reg_rd_56:
	mov	0x2a, %r14
	.word 0xf2db84a0  ! 1497: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T2_asi_reg_wr_69:
	mov	0x31, %r14
	.word 0xf8f38e40  ! 1498: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb22c6034  ! 1499: ANDN_I	andn 	%r17, 0x0034, %r25
	.word 0xf644e067  ! 1502: LDSW_I	ldsw	[%r19 + 0x0067], %r27
	.word 0xf095e008  ! 1504: LDUHA_I	lduha	[%r23, + 0x0008] %asi, %r24
cpu_intr_2_107:
	setx	0x29032a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_113:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_113), 16, 16)) -> intp(2, 0, 1)
	.word 0xf6554000  ! 1511: LDSH_R	ldsh	[%r21 + %r0], %r27
	.word 0xfc448000  ! 1512: LDSW_R	ldsw	[%r18 + %r0], %r30
	.word 0xfadde198  ! 1515: LDXA_I	ldxa	[%r23, + 0x0198] %asi, %r29
T2_asi_reg_wr_70:
	mov	0x2e, %r14
	.word 0xf6f38400  ! 1518: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_2_108:
	setx	0x28013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_57:
	mov	0x1e, %r14
	.word 0xfedb8e80  ! 1521: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf0044000  ! 1523: LDUW_R	lduw	[%r17 + %r0], %r24
	ta	T_CHANGE_NONHPRIV
	.word 0xf04ce075  ! 1526: LDSB_I	ldsb	[%r19 + 0x0075], %r24
cpu_intr_2_109:
	setx	0x2b0201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2842043  ! 1532: LDUWA_I	lduwa	[%r16, + 0x0043] %asi, %r25
	.word 0xfc4de12c  ! 1534: LDSB_I	ldsb	[%r23 + 0x012c], %r30
iob_intr_2_114:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_114), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_115:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_115), 16, 16)) -> intp(2, 0, 1b)
	ta	T_CHANGE_TO_TL0
iob_intr_2_116:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_116), 16, 16)) -> intp(2, 0, 37)
cpu_intr_2_110:
	setx	0x290323, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_71:
	mov	0x6, %r14
	.word 0xfcf38e40  ! 1542: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_wr_72:
	mov	0xa, %r14
	.word 0xf4f38e60  ! 1543: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xfa0cc000  ! 1544: LDUB_R	ldub	[%r19 + %r0], %r29
	.word 0xfac4e03d  ! 1545: LDSWA_I	ldswa	[%r19, + 0x003d] %asi, %r29
iob_intr_2_117:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_117), 16, 16)) -> intp(2, 0, 19)
	ta	T_CHANGE_TO_TL0
	.word 0xf8cde100  ! 1554: LDSBA_I	ldsba	[%r23, + 0x0100] %asi, %r28
cpu_intr_2_111:
	setx	0x2b0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe44c000  ! 1561: LDSW_R	ldsw	[%r19 + %r0], %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_118:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_118), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_wr_73:
	mov	0x3c8, %r14
	.word 0xf4f38e40  ! 1566: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf05dc000  ! 1567: LDX_R	ldx	[%r23 + %r0], %r24
T2_asi_reg_wr_74:
	mov	0xe, %r14
	.word 0xf6f384a0  ! 1569: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T2_asi_reg_wr_75:
	mov	0x1e, %r14
	.word 0xf6f38400  ! 1570: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_2_119:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_119), 16, 16)) -> intp(2, 0, 32)
cpu_intr_2_112:
	setx	0x28002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2c52097  ! 1574: LDSWA_I	ldswa	[%r20, + 0x0097] %asi, %r25
	.word 0xf804a1c1  ! 1575: LDUW_I	lduw	[%r18 + 0x01c1], %r28
cpu_intr_2_113:
	setx	0x280317, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_120:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_120), 16, 16)) -> intp(2, 0, 27)
	.word 0xf64cc000  ! 1584: LDSB_R	ldsb	[%r19 + %r0], %r27
	.word 0xfe4c8000  ! 1586: LDSB_R	ldsb	[%r18 + %r0], %r31
iob_intr_2_121:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_121), 16, 16)) -> intp(2, 0, 7)
	ta	T_CHANGE_TO_TL0
cpu_intr_2_114:
	setx	0x28022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28cc000  ! 1592: ANDcc_R	andcc 	%r19, %r0, %r25
	.word 0xf0cc4020  ! 1595: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r24
	.word 0xfacde120  ! 1597: LDSBA_I	ldsba	[%r23, + 0x0120] %asi, %r29
	.word 0xbcb5a1e2  ! 1598: ORNcc_I	orncc 	%r22, 0x01e2, %r30
T2_asi_reg_rd_58:
	mov	0x8, %r14
	.word 0xf2db84a0  ! 1601: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xfe854020  ! 1603: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r31
iob_intr_2_122:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_122), 16, 16)) -> intp(2, 0, 3d)
iob_intr_2_123:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_123), 16, 16)) -> intp(2, 0, 1f)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbb355000  ! 1609: SRLX_R	srlx	%r21, %r0, %r29
T2_asi_reg_rd_59:
	mov	0x14, %r14
	.word 0xf0db8e80  ! 1611: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_2_115:
	setx	0x2a000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcd42166  ! 1615: LDSHA_I	ldsha	[%r16, + 0x0166] %asi, %r30
	.word 0xb024213e  ! 1617: SUB_I	sub 	%r16, 0x013e, %r24
	.word 0xfc14e179  ! 1618: LDUH_I	lduh	[%r19 + 0x0179], %r30
T2_asi_reg_wr_76:
	mov	0x27, %r14
	.word 0xf6f38400  ! 1619: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbb508000  ! 1620: RDPR_TSTATE	<illegal instruction>
T2_asi_reg_rd_60:
	mov	0x3c8, %r14
	.word 0xf2db8e80  ! 1625: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf0058000  ! 1629: LDUW_R	lduw	[%r22 + %r0], %r24
	.word 0xbd3ca001  ! 1631: SRA_I	sra 	%r18, 0x0001, %r30
T2_asi_reg_rd_61:
	mov	0x16, %r14
	.word 0xf6db8400  ! 1634: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf64461d8  ! 1636: LDSW_I	ldsw	[%r17 + 0x01d8], %r27
	.word 0xf8452010  ! 1637: LDSW_I	ldsw	[%r20 + 0x0010], %r28
	.word 0xb035e028  ! 1640: ORN_I	orn 	%r23, 0x0028, %r24
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983ada  ! 1642: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ada, %hpstate
T2_asi_reg_rd_62:
	mov	0x34, %r14
	.word 0xf4db8400  ! 1643: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf0c42124  ! 1649: LDSWA_I	ldswa	[%r16, + 0x0124] %asi, %r24
iob_intr_2_124:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_124), 16, 16)) -> intp(2, 0, 2a)
	ta	T_CHANGE_TO_TL0
iob_intr_2_125:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_125), 16, 16)) -> intp(2, 0, 3b)
T2_asi_reg_rd_63:
	mov	0xa, %r14
	.word 0xf8db8e40  ! 1659: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_2_116:
	setx	0x2b002b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_117:
	setx	0x2b0021, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_118:
	setx	0x2a0108, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983a00  ! 1666: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a00, %hpstate
	.word 0xf00d6048  ! 1673: LDUB_I	ldub	[%r21 + 0x0048], %r24
	.word 0xf2c58020  ! 1677: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r25
	.word 0xfc058000  ! 1678: LDUW_R	lduw	[%r22 + %r0], %r30
	.word 0xf0cd0020  ! 1679: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r24
iob_intr_2_126:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_126), 16, 16)) -> intp(2, 0, 11)
iob_intr_2_127:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_127), 16, 16)) -> intp(2, 0, 16)
	.word 0xfccde163  ! 1683: LDSBA_I	ldsba	[%r23, + 0x0163] %asi, %r30
T2_asi_reg_rd_64:
	mov	0x1c, %r14
	.word 0xf6db8e80  ! 1684: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_2_128:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_128), 16, 16)) -> intp(2, 0, 17)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_129:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_129), 16, 16)) -> intp(2, 0, 28)
T2_asi_reg_wr_77:
	mov	0x3c6, %r14
	.word 0xfcf38e40  ! 1691: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb57da401  ! 1693: MOVR_I	movre	%r22, 0x1, %r26
iob_intr_2_130:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_130), 16, 16)) -> intp(2, 0, 11)
T2_asi_reg_wr_78:
	mov	0x32, %r14
	.word 0xfaf389e0  ! 1698: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbe258000  ! 1699: SUB_R	sub 	%r22, %r0, %r31
	.word 0xfa0421b2  ! 1700: LDUW_I	lduw	[%r16 + 0x01b2], %r29
cpu_intr_2_119:
	setx	0x2b010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcbcc000  ! 1705: XNORcc_R	xnorcc 	%r19, %r0, %r30
	.word 0x8d94a177  ! 1706: WRPR_PSTATE_I	wrpr	%r18, 0x0177, %pstate
	.word 0xf0150000  ! 1707: LDUH_R	lduh	[%r20 + %r0], %r24
iob_intr_2_131:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_131), 16, 16)) -> intp(2, 0, 2c)
iob_intr_2_132:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_132), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf6156114  ! 1713: LDUH_I	lduh	[%r21 + 0x0114], %r27
T2_asi_reg_wr_79:
	mov	0x2c, %r14
	.word 0xf4f389e0  ! 1714: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_2_120:
	setx	0x2b000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa040000  ! 1719: LDUW_R	lduw	[%r16 + %r0], %r29
	.word 0xfe548000  ! 1720: LDSH_R	ldsh	[%r18 + %r0], %r31
iob_intr_2_133:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_133), 16, 16)) -> intp(2, 0, 19)
	.word 0xf005611e  ! 1729: LDUW_I	lduw	[%r21 + 0x011e], %r24
	.word 0xf6d5c020  ! 1733: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r27
iob_intr_2_134:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_134), 16, 16)) -> intp(2, 0, 16)
	.word 0xfed5c020  ! 1735: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r31
	.word 0xf0c4c020  ! 1737: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r24
T2_asi_reg_rd_65:
	mov	0x3c2, %r14
	.word 0xfedb8e40  ! 1740: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_2_121:
	setx	0x2b001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_2_135:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_135), 16, 16)) -> intp(2, 0, 2d)
T2_asi_reg_rd_66:
	mov	0x21, %r14
	.word 0xfcdb8e80  ! 1757: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf60de123  ! 1762: LDUB_I	ldub	[%r23 + 0x0123], %r27
iob_intr_2_136:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_136), 16, 16)) -> intp(2, 0, 20)
	.word 0xb0bc0000  ! 1764: XNORcc_R	xnorcc 	%r16, %r0, %r24
	.word 0xf6d5c020  ! 1771: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r27
	.word 0xb8b50000  ! 1773: SUBCcc_R	orncc 	%r20, %r0, %r28
iob_intr_2_137:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_137), 16, 16)) -> intp(2, 0, 14)
	.word 0xf654e002  ! 1775: LDSH_I	ldsh	[%r19 + 0x0002], %r27
	.word 0xbb643801  ! 1776: MOVcc_I	<illegal instruction>
iob_intr_2_138:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_138), 16, 16)) -> intp(2, 0, 22)
	.word 0xf8846026  ! 1781: LDUWA_I	lduwa	[%r17, + 0x0026] %asi, %r28
	.word 0xfc0c8000  ! 1784: LDUB_R	ldub	[%r18 + %r0], %r30
cpu_intr_2_122:
	setx	0x2a0335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6946036  ! 1788: LDUHA_I	lduha	[%r17, + 0x0036] %asi, %r27
cpu_intr_2_123:
	setx	0x28003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05d0000  ! 1792: LDX_R	ldx	[%r20 + %r0], %r24
	.word 0xf48dc020  ! 1794: LDUBA_R	lduba	[%r23, %r0] 0x01, %r26
	.word 0xfecd4020  ! 1796: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r31
	ta	T_CHANGE_TO_TL0
	.word 0x81946041  ! 1801: WRPR_TPC_I	wrpr	%r17, 0x0041, %tpc
cpu_intr_2_124:
	setx	0x2a0001, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_67:
	mov	0x27, %r14
	.word 0xf8db8e40  ! 1805: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfe54c000  ! 1806: LDSH_R	ldsh	[%r19 + %r0], %r31
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983b98  ! 1807: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b98, %hpstate
	.word 0xfc4d4000  ! 1809: LDSB_R	ldsb	[%r21 + %r0], %r30
	ta	T_CHANGE_TO_TL0
iob_intr_2_139:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_139), 16, 16)) -> intp(2, 0, 32)
iob_intr_2_140:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_140), 16, 16)) -> intp(2, 0, 26)
	.word 0xfcdc21cf  ! 1813: LDXA_I	ldxa	[%r16, + 0x01cf] %asi, %r30
	.word 0xf285e03f  ! 1816: LDUWA_I	lduwa	[%r23, + 0x003f] %asi, %r25
	.word 0xf65c600b  ! 1817: LDX_I	ldx	[%r17 + 0x000b], %r27
	ta	T_CHANGE_TO_TL1
	.word 0xf60c8000  ! 1819: LDUB_R	ldub	[%r18 + %r0], %r27
T2_asi_reg_wr_80:
	mov	0x4, %r14
	.word 0xf8f38400  ! 1822: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf8d4a119  ! 1825: LDSHA_I	ldsha	[%r18, + 0x0119] %asi, %r28
cpu_intr_2_125:
	setx	0x2a0310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45c201b  ! 1829: LDX_I	ldx	[%r16 + 0x001b], %r26
	.word 0xfe05a095  ! 1830: LDUW_I	lduw	[%r22 + 0x0095], %r31
T2_asi_reg_wr_81:
	mov	0x36, %r14
	.word 0xf6f38e40  ! 1832: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf8950020  ! 1836: LDUHA_R	lduha	[%r20, %r0] 0x01, %r28
T2_asi_reg_rd_68:
	mov	0xa, %r14
	.word 0xfedb8e40  ! 1839: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf0044000  ! 1840: LDUW_R	lduw	[%r17 + %r0], %r24
iob_intr_2_141:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_141), 16, 16)) -> intp(2, 0, 11)
	.word 0xb8146037  ! 1842: OR_I	or 	%r17, 0x0037, %r28
	.word 0xf25c6014  ! 1843: LDX_I	ldx	[%r17 + 0x0014], %r25
	.word 0xf89561a7  ! 1844: LDUHA_I	lduha	[%r21, + 0x01a7] %asi, %r28
	.word 0xbe354000  ! 1847: SUBC_R	orn 	%r21, %r0, %r31
T2_asi_reg_wr_82:
	mov	0x37, %r14
	.word 0xf8f389e0  ! 1848: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_2_126:
	setx	0x2b0134, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_127:
	setx	0x2a021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf00c6184  ! 1856: LDUB_I	ldub	[%r17 + 0x0184], %r24
iob_intr_2_142:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_142), 16, 16)) -> intp(2, 0, 36)
	.word 0xfccca0a5  ! 1861: LDSBA_I	ldsba	[%r18, + 0x00a5] %asi, %r30
	.word 0xb2b48000  ! 1862: SUBCcc_R	orncc 	%r18, %r0, %r25
	.word 0xf68da066  ! 1863: LDUBA_I	lduba	[%r22, + 0x0066] %asi, %r27
	.word 0xf005614a  ! 1866: LDUW_I	lduw	[%r21 + 0x014a], %r24
	.word 0xbe14a142  ! 1867: OR_I	or 	%r18, 0x0142, %r31
	.word 0xfc456023  ! 1868: LDSW_I	ldsw	[%r21 + 0x0023], %r30
iob_intr_2_143:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_143), 16, 16)) -> intp(2, 0, 2a)
T2_asi_reg_rd_69:
	mov	0x20, %r14
	.word 0xf2db8e40  ! 1872: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_wr_83:
	mov	0x3c6, %r14
	.word 0xf0f38e40  ! 1873: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf0044000  ! 1875: LDUW_R	lduw	[%r17 + %r0], %r24
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL0
	.word 0xfe0561b3  ! 1886: LDUW_I	lduw	[%r21 + 0x01b3], %r31
	.word 0xb6150000  ! 1888: OR_R	or 	%r20, %r0, %r27
cpu_intr_2_128:
	setx	0x2c002d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_129:
	setx	0x2c0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65ca014  ! 1892: LDX_I	ldx	[%r18 + 0x0014], %r27
cpu_intr_2_130:
	setx	0x2c010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_70:
	mov	0x3c8, %r14
	.word 0xf0db8e40  ! 1895: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfecd4020  ! 1896: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r31
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983982  ! 1897: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1982, %hpstate
	.word 0xfc0cc000  ! 1902: LDUB_R	ldub	[%r19 + %r0], %r30
cpu_intr_2_131:
	setx	0x2d0115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9508000  ! 1909: RDPR_TSTATE	<illegal instruction>
T2_asi_reg_wr_84:
	mov	0xd, %r14
	.word 0xf6f38e60  ! 1912: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_2_132:
	setx	0x2c0315, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf2450000  ! 1920: LDSW_R	ldsw	[%r20 + %r0], %r25
	.word 0xfed5a084  ! 1921: LDSHA_I	ldsha	[%r22, + 0x0084] %asi, %r31
	.word 0xf054e080  ! 1922: LDSH_I	ldsh	[%r19 + 0x0080], %r24
cpu_intr_2_133:
	setx	0x2e003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf815e0bf  ! 1924: LDUH_I	lduh	[%r23 + 0x00bf], %r28
cpu_intr_2_134:
	setx	0x2c0000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4c615c  ! 1928: LDSB_I	ldsb	[%r17 + 0x015c], %r31
	ta	T_CHANGE_TO_TL1
cpu_intr_2_135:
	setx	0x2d0035, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_71:
	mov	0x15, %r14
	.word 0xf8db8400  ! 1931: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xf4d5c020  ! 1932: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r26
	ta	T_CHANGE_TO_TL1
	.word 0xf64ca003  ! 1936: LDSB_I	ldsb	[%r18 + 0x0003], %r27
cpu_intr_2_136:
	setx	0x2e0324, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_137:
	setx	0x2f0112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73d8000  ! 1940: SRA_R	sra 	%r22, %r0, %r27
cpu_intr_2_138:
	setx	0x2f0101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcc50020  ! 1942: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r30
	.word 0xfed58020  ! 1943: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r31
cpu_intr_2_139:
	setx	0x2e023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4cc6171  ! 1947: LDSBA_I	ldsba	[%r17, + 0x0171] %asi, %r26
iob_intr_2_144:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_144), 16, 16)) -> intp(2, 0, 1)
	ta	T_CHANGE_NONHPRIV
	.word 0xfc8c0020  ! 1954: LDUBA_R	lduba	[%r16, %r0] 0x01, %r30
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_72:
	mov	0x3, %r14
	.word 0xf0db8e60  ! 1957: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_2_145:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_145), 16, 16)) -> intp(2, 0, 0)
T2_asi_reg_rd_73:
	mov	0x3, %r14
	.word 0xf4db84a0  ! 1962: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb17d0400  ! 1965: MOVR_R	movre	%r20, %r0, %r24
	.word 0xf65da040  ! 1970: LDX_I	ldx	[%r22 + 0x0040], %r27
iob_intr_2_146:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_146), 16, 16)) -> intp(2, 0, 2a)
	.word 0xb77d4400  ! 1975: MOVR_R	movre	%r21, %r0, %r27
T2_asi_reg_wr_85:
	mov	0x38, %r14
	.word 0xf4f38e60  ! 1976: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf2c5a023  ! 1977: LDSWA_I	ldswa	[%r22, + 0x0023] %asi, %r25
iob_intr_2_147:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_147), 16, 16)) -> intp(2, 0, 20)
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983812  ! 1984: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1812, %hpstate
iob_intr_2_148:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_148), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_rd_74:
	mov	0x3c0, %r14
	.word 0xfcdb8400  ! 1986: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb73d4000  ! 1987: SRA_R	sra 	%r21, %r0, %r27
	.word 0xb73c4000  ! 1988: SRA_R	sra 	%r17, %r0, %r27
cpu_intr_2_140:
	setx	0x2c0113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_149:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_149), 16, 16)) -> intp(2, 0, 4)
	.word 0xf6156153  ! 1999: LDUH_I	lduh	[%r21 + 0x0153], %r27
cpu_intr_2_141:
	setx	0x2e0129, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_75:
	mov	0x15, %r14
	.word 0xfadb8e80  ! 2005: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_2_142:
	setx	0x2e0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb404e075  ! 2007: ADD_I	add 	%r19, 0x0075, %r26
iob_intr_2_150:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_150), 16, 16)) -> intp(2, 0, 2e)
cpu_intr_2_143:
	setx	0x2c0324, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_76:
	mov	0x1d, %r14
	.word 0xf0db8e40  ! 2013: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_144:
	setx	0x2e0005, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_145:
	setx	0x2f0210, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_146:
	setx	0x2d0317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf254a1e0  ! 2020: LDSH_I	ldsh	[%r18 + 0x01e0], %r25
cpu_intr_2_147:
	setx	0x2d031a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_151:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_151), 16, 16)) -> intp(2, 0, 22)
cpu_intr_2_148:
	setx	0x2c012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0054000  ! 2026: LDUW_R	lduw	[%r21 + %r0], %r24
cpu_intr_2_149:
	setx	0x2d022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf844a02c  ! 2029: LDSW_I	ldsw	[%r18 + 0x002c], %r28
cpu_intr_2_150:
	setx	0x2c0000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb23cc000  ! 2031: XNOR_R	xnor 	%r19, %r0, %r25
cpu_intr_2_151:
	setx	0x2f0101, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_152:
	setx	0x2e0329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe952106  ! 2035: LDUHA_I	lduha	[%r20, + 0x0106] %asi, %r31
	.word 0xf41460c9  ! 2036: LDUH_I	lduh	[%r17 + 0x00c9], %r26
	.word 0xf8956139  ! 2038: LDUHA_I	lduha	[%r21, + 0x0139] %asi, %r28
cpu_intr_2_153:
	setx	0x2f003d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_86:
	mov	0x35, %r14
	.word 0xf0f389e0  ! 2040: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf805e0b7  ! 2042: LDUW_I	lduw	[%r23 + 0x00b7], %r28
	ta	T_CHANGE_HPRIV
	.word 0xf04d8000  ! 2050: LDSB_R	ldsb	[%r22 + %r0], %r24
	.word 0xb6158000  ! 2053: OR_R	or 	%r22, %r0, %r27
	.word 0xf055a1f5  ! 2057: LDSH_I	ldsh	[%r22 + 0x01f5], %r24
	.word 0xfa550000  ! 2059: LDSH_R	ldsh	[%r20 + %r0], %r29
	.word 0xf485e19d  ! 2062: LDUWA_I	lduwa	[%r23, + 0x019d] %asi, %r26
T2_asi_reg_rd_77:
	mov	0x20, %r14
	.word 0xfadb8e40  ! 2065: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_wr_87:
	mov	0x1d, %r14
	.word 0xfaf389e0  ! 2066: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf2c40020  ! 2067: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r25
T2_asi_reg_rd_78:
	mov	0x3c0, %r14
	.word 0xf4db8e60  ! 2068: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf6dd2127  ! 2072: LDXA_I	ldxa	[%r20, + 0x0127] %asi, %r27
	.word 0xf88c4020  ! 2075: LDUBA_R	lduba	[%r17, %r0] 0x01, %r28
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982f42  ! 2076: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f42, %hpstate
	.word 0xbb2cb001  ! 2077: SLLX_I	sllx	%r18, 0x0001, %r29
	.word 0x91942123  ! 2079: WRPR_PIL_I	wrpr	%r16, 0x0123, %pil
cpu_intr_2_154:
	setx	0x2e032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf294c020  ! 2083: LDUHA_R	lduha	[%r19, %r0] 0x01, %r25
	.word 0xf095c020  ! 2085: LDUHA_R	lduha	[%r23, %r0] 0x01, %r24
iob_intr_2_152:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_152), 16, 16)) -> intp(2, 0, 23)
T2_asi_reg_wr_88:
	mov	0x24, %r14
	.word 0xf0f38e80  ! 2091: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_2_155:
	setx	0x2d0007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba0d0000  ! 2093: AND_R	and 	%r20, %r0, %r29
T2_asi_reg_rd_79:
	mov	0x9, %r14
	.word 0xf8db8e60  ! 2095: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_2_153:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_153), 16, 16)) -> intp(2, 0, 3d)
	.word 0xb6354000  ! 2100: SUBC_R	orn 	%r21, %r0, %r27
	ta	T_CHANGE_TO_TL0
	.word 0xfc0c4000  ! 2102: LDUB_R	ldub	[%r17 + %r0], %r30
	.word 0xfac54020  ! 2104: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r29
cpu_intr_2_156:
	setx	0x2e0031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_157:
	setx	0x2c013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_158:
	setx	0x2f0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_89:
	mov	0x2c, %r14
	.word 0xf6f38400  ! 2119: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xfed4a102  ! 2121: LDSHA_I	ldsha	[%r18, + 0x0102] %asi, %r31
T2_asi_reg_wr_90:
	mov	0x16, %r14
	.word 0xf4f38400  ! 2122: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf00c20bd  ! 2125: LDUB_I	ldub	[%r16 + 0x00bd], %r24
	.word 0xfc04a0cd  ! 2127: LDUW_I	lduw	[%r18 + 0x00cd], %r30
	.word 0xf48d4020  ! 2128: LDUBA_R	lduba	[%r21, %r0] 0x01, %r26
	.word 0xf814a03c  ! 2129: LDUH_I	lduh	[%r18 + 0x003c], %r28
iob_intr_2_154:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_154), 16, 16)) -> intp(2, 0, e)
	.word 0xb9518000  ! 2131: RDPR_PSTATE	<illegal instruction>
T2_asi_reg_rd_80:
	mov	0x33, %r14
	.word 0xf0db84a0  ! 2132: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_2_159:
	setx	0x2c033e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_160:
	setx	0x2d000b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_155:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_155), 16, 16)) -> intp(2, 0, 3e)
	setx	data_start_4, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982fc0  ! 2138: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc0, %hpstate
cpu_intr_2_161:
	setx	0x2f0211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6d5c020  ! 2140: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r27
iob_intr_2_156:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_156), 16, 16)) -> intp(2, 0, 37)
	.word 0xb92ca001  ! 2144: SLL_I	sll 	%r18, 0x0001, %r28
cpu_intr_2_162:
	setx	0x2e022a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_91:
	mov	0xc, %r14
	.word 0xf4f38400  ! 2148: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_2_163:
	setx	0x2d0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe558000  ! 2152: LDSH_R	ldsh	[%r22 + %r0], %r31
	ta	T_CHANGE_HPRIV
cpu_intr_2_164:
	setx	0x2e0028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6d54020  ! 2158: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r27
T2_asi_reg_rd_81:
	mov	0x3c5, %r14
	.word 0xf4db8e80  ! 2159: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xf0440000  ! 2163: LDSW_R	ldsw	[%r16 + %r0], %r24
cpu_intr_2_165:
	setx	0x2d010b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_157:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_157), 16, 16)) -> intp(2, 0, 3d)
cpu_intr_2_166:
	setx	0x2e0025, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_158:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_158), 16, 16)) -> intp(2, 0, 31)
	.word 0xf4948020  ! 2171: LDUHA_R	lduha	[%r18, %r0] 0x01, %r26
cpu_intr_2_167:
	setx	0x30021, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_82:
	mov	0x6, %r14
	.word 0xfcdb84a0  ! 2176: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbb3c2001  ! 2177: SRA_I	sra 	%r16, 0x0001, %r29
T2_asi_reg_rd_83:
	mov	0x3c7, %r14
	.word 0xf4db8400  ! 2179: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xa1902000  ! 2180: WRPR_GL_I	wrpr	%r0, 0x0000, %-
T2_asi_reg_wr_92:
	mov	0x3c1, %r14
	.word 0xfcf38e40  ! 2181: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_wr_93:
	mov	0x36, %r14
	.word 0xf8f389e0  ! 2182: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_2_168:
	setx	0x2d0133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64da1e2  ! 2194: LDSB_I	ldsb	[%r22 + 0x01e2], %r27
T2_asi_reg_rd_84:
	mov	0x1, %r14
	.word 0xf2db8e40  ! 2197: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf254a15a  ! 2198: LDSH_I	ldsh	[%r18 + 0x015a], %r25
cpu_intr_2_169:
	setx	0x2d0118, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_170:
	setx	0x2d0207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0dda0c0  ! 2202: LDXA_I	ldxa	[%r22, + 0x00c0] %asi, %r24
iob_intr_2_159:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_159), 16, 16)) -> intp(2, 0, 1b)
iob_intr_2_160:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_160), 16, 16)) -> intp(2, 0, 21)
	.word 0xb694a11c  ! 2213: ORcc_I	orcc 	%r18, 0x011c, %r27
cpu_intr_2_171:
	setx	0x2e0202, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983bc8  ! 2216: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc8, %hpstate
	.word 0xf8cd6006  ! 2218: LDSBA_I	ldsba	[%r21, + 0x0006] %asi, %r28
cpu_intr_2_172:
	setx	0x2d0300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0d5a149  ! 2223: LDSHA_I	ldsha	[%r22, + 0x0149] %asi, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
iob_intr_2_161:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_161), 16, 16)) -> intp(2, 0, 4)
	.word 0xf2c520f4  ! 2231: LDSWA_I	ldswa	[%r20, + 0x00f4] %asi, %r25
	.word 0xba456006  ! 2235: ADDC_I	addc 	%r21, 0x0006, %r29
cpu_intr_2_173:
	setx	0x2d023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcd58020  ! 2238: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r30
T2_asi_reg_wr_94:
	mov	0x2f, %r14
	.word 0xfaf38e60  ! 2239: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb29ce06a  ! 2242: XORcc_I	xorcc 	%r19, 0x006a, %r25
T2_asi_reg_rd_85:
	mov	0x34, %r14
	.word 0xfcdb8e60  ! 2245: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T2_asi_reg_wr_95:
	mov	0x26, %r14
	.word 0xf8f38e60  ! 2249: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_174:
	setx	0x2e0231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe35e0ed  ! 2256: ORN_I	orn 	%r23, 0x00ed, %r31
	.word 0xf45c0000  ! 2258: LDX_R	ldx	[%r16 + %r0], %r26
cpu_intr_2_175:
	setx	0x2f0311, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_162:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_162), 16, 16)) -> intp(2, 0, 22)
	.word 0xf445a05d  ! 2264: LDSW_I	ldsw	[%r22 + 0x005d], %r26
T2_asi_reg_wr_96:
	mov	0x3c1, %r14
	.word 0xf6f389e0  ! 2266: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xfe8c8020  ! 2267: LDUBA_R	lduba	[%r18, %r0] 0x01, %r31
	.word 0xf4554000  ! 2269: LDSH_R	ldsh	[%r21 + %r0], %r26
	.word 0xf44ca032  ! 2270: LDSB_I	ldsb	[%r18 + 0x0032], %r26
	.word 0xf84c8000  ! 2271: LDSB_R	ldsb	[%r18 + %r0], %r28
	.word 0xba154000  ! 2273: OR_R	or 	%r21, %r0, %r29
	.word 0xfe454000  ! 2274: LDSW_R	ldsw	[%r21 + %r0], %r31
cpu_intr_2_176:
	setx	0x2c031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc0d8000  ! 2276: LDUB_R	ldub	[%r22 + %r0], %r30
cpu_intr_2_177:
	setx	0x2f003b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_163:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_163), 16, 16)) -> intp(2, 0, b)
iob_intr_2_164:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_164), 16, 16)) -> intp(2, 0, e)
	.word 0xfc958020  ! 2284: LDUHA_R	lduha	[%r22, %r0] 0x01, %r30
	.word 0xb2b56012  ! 2286: ORNcc_I	orncc 	%r21, 0x0012, %r25
T2_asi_reg_wr_97:
	mov	0x3c0, %r14
	.word 0xf4f38e40  ! 2287: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_rd_86:
	mov	0x2f, %r14
	.word 0xfcdb8e40  ! 2289: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_2_178:
	setx	0x2d010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8c4e0b1  ! 2291: LDSWA_I	ldswa	[%r19, + 0x00b1] %asi, %r28
iob_intr_2_165:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_165), 16, 16)) -> intp(2, 0, c)
iob_intr_2_166:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_166), 16, 16)) -> intp(2, 0, 32)
	.word 0xfa048000  ! 2296: LDUW_R	lduw	[%r18 + %r0], %r29
	.word 0xf285c020  ! 2297: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r25
T2_asi_reg_wr_98:
	mov	0x22, %r14
	.word 0xf8f38400  ! 2299: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
iob_intr_2_167:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_167), 16, 16)) -> intp(2, 0, 1e)
	.word 0xba1c207d  ! 2308: XOR_I	xor 	%r16, 0x007d, %r29
	.word 0xba2c6123  ! 2309: ANDN_I	andn 	%r17, 0x0123, %r29
cpu_intr_2_179:
	setx	0x310317, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xfe544000  ! 2317: LDSH_R	ldsh	[%r17 + %r0], %r31
	.word 0xb2a4a0b8  ! 2319: SUBcc_I	subcc 	%r18, 0x00b8, %r25
	.word 0xb335e001  ! 2322: SRL_I	srl 	%r23, 0x0001, %r25
T2_asi_reg_rd_87:
	mov	0x35, %r14
	.word 0xf6db8e80  ! 2327: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_2_180:
	setx	0x320117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65c4000  ! 2332: LDX_R	ldx	[%r17 + %r0], %r27
T2_asi_reg_wr_99:
	mov	0x7, %r14
	.word 0xfcf38e40  ! 2333: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf64c608d  ! 2334: LDSB_I	ldsb	[%r17 + 0x008d], %r27
cpu_intr_2_181:
	setx	0x330006, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_100:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 2336: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf2050000  ! 2337: LDUW_R	lduw	[%r20 + %r0], %r25
iob_intr_2_168:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_168), 16, 16)) -> intp(2, 0, 37)
	.word 0xb4150000  ! 2341: OR_R	or 	%r20, %r0, %r26
	.word 0xfe948020  ! 2342: LDUHA_R	lduha	[%r18, %r0] 0x01, %r31
	.word 0xf215c000  ! 2343: LDUH_R	lduh	[%r23 + %r0], %r25
	.word 0xfecd2120  ! 2344: LDSBA_I	ldsba	[%r20, + 0x0120] %asi, %r31
	.word 0xf6d4607e  ! 2346: LDSHA_I	ldsha	[%r17, + 0x007e] %asi, %r27
	.word 0xf80d20ef  ! 2350: LDUB_I	ldub	[%r20 + 0x00ef], %r28
cpu_intr_2_182:
	setx	0x310116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc45a0f6  ! 2352: LDSW_I	ldsw	[%r22 + 0x00f6], %r30
iob_intr_2_169:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_169), 16, 16)) -> intp(2, 0, 3e)
cpu_intr_2_183:
	setx	0x330334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6cc0020  ! 2359: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r27
iob_intr_2_170:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_170), 16, 16)) -> intp(2, 0, b)
iob_intr_2_171:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_171), 16, 16)) -> intp(2, 0, 6)
	.word 0xb350c000  ! 2363: RDPR_TT	<illegal instruction>
T2_asi_reg_rd_88:
	mov	0x13, %r14
	.word 0xf0db8e40  ! 2368: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe8c4020  ! 2373: LDUBA_R	lduba	[%r17, %r0] 0x01, %r31
	.word 0xf6456063  ! 2374: LDSW_I	ldsw	[%r21 + 0x0063], %r27
T2_asi_reg_rd_89:
	mov	0x3c0, %r14
	.word 0xfcdb8e40  ! 2376: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_2_172:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_172), 16, 16)) -> intp(2, 0, 8)
	.word 0xfc0521d3  ! 2379: LDUW_I	lduw	[%r20 + 0x01d3], %r30
T2_asi_reg_wr_101:
	mov	0x24, %r14
	.word 0xfcf38e40  ! 2380: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfe4d4000  ! 2382: LDSB_R	ldsb	[%r21 + %r0], %r31
	.word 0xb5480000  ! 2385: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf8156040  ! 2386: LDUH_I	lduh	[%r21 + 0x0040], %r28
T2_asi_reg_rd_90:
	mov	0x3c5, %r14
	.word 0xfcdb8400  ! 2387: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T2_asi_reg_rd_91:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 2388: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfad4a1e9  ! 2390: LDSHA_I	ldsha	[%r18, + 0x01e9] %asi, %r29
	.word 0xfcccc020  ! 2392: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r30
T2_asi_reg_rd_92:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 2393: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfcc5e1a2  ! 2394: LDSWA_I	ldswa	[%r23, + 0x01a2] %asi, %r30
	.word 0xf45dc000  ! 2397: LDX_R	ldx	[%r23 + %r0], %r26
	.word 0xf645c000  ! 2398: LDSW_R	ldsw	[%r23 + %r0], %r27
	.word 0xf2950020  ! 2401: LDUHA_R	lduha	[%r20, %r0] 0x01, %r25
	.word 0xfa15616f  ! 2402: LDUH_I	lduh	[%r21 + 0x016f], %r29
T2_asi_reg_wr_102:
	mov	0x3c8, %r14
	.word 0xfcf38400  ! 2403: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbc3c0000  ! 2407: XNOR_R	xnor 	%r16, %r0, %r30
	ta	T_CHANGE_TO_TL0
iob_intr_2_173:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_173), 16, 16)) -> intp(2, 0, 1)
T2_asi_reg_wr_103:
	mov	0x29, %r14
	.word 0xf4f38e60  ! 2411: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf2cd0020  ! 2413: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r25
iob_intr_2_174:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_174), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf6454000  ! 2415: LDSW_R	ldsw	[%r21 + %r0], %r27
cpu_intr_2_184:
	setx	0x330333, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_185:
	setx	0x300211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5c4000  ! 2425: LDX_R	ldx	[%r17 + %r0], %r29
T2_asi_reg_rd_93:
	mov	0x3c3, %r14
	.word 0xf6db8e60  ! 2427: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_2_175:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_175), 16, 16)) -> intp(2, 0, 2b)
iob_intr_2_176:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_176), 16, 16)) -> intp(2, 0, 2c)
T2_asi_reg_wr_104:
	mov	0x23, %r14
	.word 0xfaf38e80  ! 2433: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf4148000  ! 2434: LDUH_R	lduh	[%r18 + %r0], %r26
	.word 0xfe8560a0  ! 2435: LDUWA_I	lduwa	[%r21, + 0x00a0] %asi, %r31
	.word 0xf2c54020  ! 2436: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r25
cpu_intr_2_186:
	setx	0x30011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4d4a062  ! 2440: LDSHA_I	ldsha	[%r18, + 0x0062] %asi, %r26
	.word 0xf2dd6099  ! 2441: LDXA_I	ldxa	[%r21, + 0x0099] %asi, %r25
T2_asi_reg_wr_105:
	mov	0xb, %r14
	.word 0xf0f38e60  ! 2444: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_2_187:
	setx	0x33001a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_177:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_177), 16, 16)) -> intp(2, 0, 17)
	.word 0xb151c000  ! 2452: RDPR_TL	<illegal instruction>
cpu_intr_2_188:
	setx	0x32003e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_94:
	mov	0x11, %r14
	.word 0xfcdb8e80  ! 2462: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf4048000  ! 2463: LDUW_R	lduw	[%r18 + %r0], %r26
iob_intr_2_178:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_178), 16, 16)) -> intp(2, 0, 8)
T2_asi_reg_rd_95:
	mov	0x3c3, %r14
	.word 0xf6db8e60  ! 2465: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982a98  ! 2466: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a98, %hpstate
iob_intr_2_179:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_179), 16, 16)) -> intp(2, 0, 28)
	.word 0xf8944020  ! 2474: LDUHA_R	lduha	[%r17, %r0] 0x01, %r28
	.word 0xf8548000  ! 2478: LDSH_R	ldsh	[%r18 + %r0], %r28
	.word 0xf214618e  ! 2479: LDUH_I	lduh	[%r17 + 0x018e], %r25
	.word 0xbab4a11c  ! 2481: SUBCcc_I	orncc 	%r18, 0x011c, %r29
	ta	T_CHANGE_HPRIV
	.word 0xfc8d4020  ! 2492: LDUBA_R	lduba	[%r21, %r0] 0x01, %r30
cpu_intr_2_189:
	setx	0x320231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf615c000  ! 2494: LDUH_R	lduh	[%r23 + %r0], %r27
cpu_intr_2_190:
	setx	0x300335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfecc200a  ! 2499: LDSBA_I	ldsba	[%r16, + 0x000a] %asi, %r31
cpu_intr_2_191:
	setx	0x320219, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf8d5c020  ! 2508: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r28
	.word 0xfc4c605a  ! 2509: LDSB_I	ldsb	[%r17 + 0x005a], %r30
T2_asi_reg_wr_106:
	mov	0x3c4, %r14
	.word 0xf4f389e0  ! 2517: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_2_192:
	setx	0x31020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa842087  ! 2519: LDUWA_I	lduwa	[%r16, + 0x0087] %asi, %r29
T2_asi_reg_rd_96:
	mov	0x2c, %r14
	.word 0xfadb8400  ! 2520: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf0552195  ! 2522: LDSH_I	ldsh	[%r20 + 0x0195], %r24
	.word 0xf2144000  ! 2524: LDUH_R	lduh	[%r17 + %r0], %r25
	.word 0xbf504000  ! 2526: RDPR_TNPC	<illegal instruction>
	.word 0xf254c000  ! 2530: LDSH_R	ldsh	[%r19 + %r0], %r25
	.word 0xfe9421f4  ! 2534: LDUHA_I	lduha	[%r16, + 0x01f4] %asi, %r31
	.word 0xf294e01d  ! 2536: LDUHA_I	lduha	[%r19, + 0x001d] %asi, %r25
T2_asi_reg_rd_97:
	mov	0x3c8, %r14
	.word 0xf2db89e0  ! 2540: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_2_193:
	setx	0x31021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64d0000  ! 2542: LDSB_R	ldsb	[%r20 + %r0], %r27
cpu_intr_2_194:
	setx	0x31023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb52d0000  ! 2545: SLL_R	sll 	%r20, %r0, %r26
cpu_intr_2_195:
	setx	0x30032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45ca048  ! 2547: LDX_I	ldx	[%r18 + 0x0048], %r26
T2_asi_reg_wr_107:
	mov	0x3c6, %r14
	.word 0xfcf38e40  ! 2548: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_196:
	setx	0x300302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6bc8000  ! 2550: XNORcc_R	xnorcc 	%r18, %r0, %r27
	.word 0xfa45a05b  ! 2551: LDSW_I	ldsw	[%r22 + 0x005b], %r29
	.word 0xf6cc0020  ! 2552: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r27
cpu_intr_2_197:
	setx	0x31030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_2_198:
	setx	0x310308, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_199:
	setx	0x310318, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_200:
	setx	0x30020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0858020  ! 2571: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r24
	.word 0xf845211c  ! 2572: LDSW_I	ldsw	[%r20 + 0x011c], %r28
	.word 0xf28d61f8  ! 2574: LDUBA_I	lduba	[%r21, + 0x01f8] %asi, %r25
	.word 0xf80d0000  ! 2581: LDUB_R	ldub	[%r20 + %r0], %r28
	.word 0xf614a060  ! 2583: LDUH_I	lduh	[%r18 + 0x0060], %r27
iob_intr_2_180:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_180), 16, 16)) -> intp(2, 0, 3b)
iob_intr_2_181:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_181), 16, 16)) -> intp(2, 0, 2f)
iob_intr_2_182:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_182), 16, 16)) -> intp(2, 0, c)
iob_intr_2_183:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_183), 16, 16)) -> intp(2, 0, 34)
T2_asi_reg_wr_108:
	mov	0x28, %r14
	.word 0xfef38400  ! 2595: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T2_asi_reg_wr_109:
	mov	0xa, %r14
	.word 0xf6f38e60  ! 2597: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_2_184:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_184), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_rd_98:
	mov	0x3c7, %r14
	.word 0xfadb8e60  ! 2599: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	ta	T_CHANGE_TO_TL1
	.word 0xfa544000  ! 2609: LDSH_R	ldsh	[%r17 + %r0], %r29
iob_intr_2_185:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_185), 16, 16)) -> intp(2, 0, 10)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_99:
	mov	0x1c, %r14
	.word 0xf6db8e40  ! 2618: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfa8561f8  ! 2621: LDUWA_I	lduwa	[%r21, + 0x01f8] %asi, %r29
cpu_intr_2_201:
	setx	0x330131, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982b92  ! 2629: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b92, %hpstate
iob_intr_2_186:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_186), 16, 16)) -> intp(2, 0, 3f)
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_202:
	setx	0x32001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf00c0000  ! 2633: LDUB_R	ldub	[%r16 + %r0], %r24
	.word 0xfa5d6040  ! 2636: LDX_I	ldx	[%r21 + 0x0040], %r29
iob_intr_2_187:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_187), 16, 16)) -> intp(2, 0, 2d)
	.word 0xfa0c0000  ! 2640: LDUB_R	ldub	[%r16 + %r0], %r29
iob_intr_2_188:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_188), 16, 16)) -> intp(2, 0, 3a)
cpu_intr_2_203:
	setx	0x33003a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_189:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_189), 16, 16)) -> intp(2, 0, 30)
	.word 0xf845a09f  ! 2645: LDSW_I	ldsw	[%r22 + 0x009f], %r28
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_100:
	mov	0x31, %r14
	.word 0xfadb8e80  ! 2651: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xfc5c2168  ! 2652: LDX_I	ldx	[%r16 + 0x0168], %r30
cpu_intr_2_204:
	setx	0x300337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb77d0400  ! 2655: MOVR_R	movre	%r20, %r0, %r27
	.word 0xf40de179  ! 2659: LDUB_I	ldub	[%r23 + 0x0179], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_205:
	setx	0x310313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4c421ad  ! 2663: LDSWA_I	ldswa	[%r16, + 0x01ad] %asi, %r26
	ta	T_CHANGE_HPRIV
	.word 0xf28c4020  ! 2666: LDUBA_R	lduba	[%r17, %r0] 0x01, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_190:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_190), 16, 16)) -> intp(2, 0, 15)
T2_asi_reg_rd_101:
	mov	0x3c7, %r14
	.word 0xfedb8e60  ! 2673: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf40dc000  ! 2675: LDUB_R	ldub	[%r23 + %r0], %r26
	.word 0xbebde1ad  ! 2676: XNORcc_I	xnorcc 	%r23, 0x01ad, %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xb204a136  ! 2680: ADD_I	add 	%r18, 0x0136, %r25
	.word 0xfec5c020  ! 2681: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r31
	.word 0xfacdc020  ! 2683: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r29
	.word 0xfa15e173  ! 2686: LDUH_I	lduh	[%r23 + 0x0173], %r29
iob_intr_2_191:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_191), 16, 16)) -> intp(2, 0, 21)
iob_intr_2_192:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_192), 16, 16)) -> intp(2, 0, 22)
	.word 0xf255c000  ! 2692: LDSH_R	ldsh	[%r23 + %r0], %r25
	.word 0xfedc218e  ! 2693: LDXA_I	ldxa	[%r16, + 0x018e] %asi, %r31
cpu_intr_2_206:
	setx	0x300234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6056016  ! 2695: LDUW_I	lduw	[%r21 + 0x0016], %r27
	.word 0xfc14607a  ! 2698: LDUH_I	lduh	[%r17 + 0x007a], %r30
	.word 0xbc048000  ! 2700: ADD_R	add 	%r18, %r0, %r30
	ta	T_CHANGE_HPRIV
	.word 0xfa44a07f  ! 2704: LDSW_I	ldsw	[%r18 + 0x007f], %r29
	.word 0xfa84a01b  ! 2705: LDUWA_I	lduwa	[%r18, + 0x001b] %asi, %r29
	.word 0xf68da1ab  ! 2706: LDUBA_I	lduba	[%r22, + 0x01ab] %asi, %r27
	.word 0xb6c5213a  ! 2708: ADDCcc_I	addccc 	%r20, 0x013a, %r27
	.word 0x9194e1a0  ! 2712: WRPR_PIL_I	wrpr	%r19, 0x01a0, %pil
cpu_intr_2_207:
	setx	0x330215, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x819828c8  ! 2717: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c8, %hpstate
	.word 0xfe0d8000  ! 2720: LDUB_R	ldub	[%r22 + %r0], %r31
	.word 0xf85de164  ! 2721: LDX_I	ldx	[%r23 + 0x0164], %r28
cpu_intr_2_208:
	setx	0x320025, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_209:
	setx	0x31032d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_210:
	setx	0x300012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0540000  ! 2728: LDSH_R	ldsh	[%r16 + %r0], %r24
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982bda  ! 2733: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bda, %hpstate
iob_intr_2_193:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_193), 16, 16)) -> intp(2, 0, 10)
	.word 0xf61521ad  ! 2738: LDUH_I	lduh	[%r20 + 0x01ad], %r27
	.word 0xb33dc000  ! 2739: SRA_R	sra 	%r23, %r0, %r25
	ta	T_CHANGE_TO_TL0
	.word 0xf85cc000  ! 2743: LDX_R	ldx	[%r19 + %r0], %r28
	.word 0xf214c000  ! 2744: LDUH_R	lduh	[%r19 + %r0], %r25
iob_intr_2_194:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_194), 16, 16)) -> intp(2, 0, 38)
	.word 0xf615e192  ! 2746: LDUH_I	lduh	[%r23 + 0x0192], %r27
iob_intr_2_195:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_195), 16, 16)) -> intp(2, 0, 2b)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfecc8020  ! 2749: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r31
	.word 0xfe154000  ! 2750: LDUH_R	lduh	[%r21 + %r0], %r31
	.word 0xf28c203f  ! 2752: LDUBA_I	lduba	[%r16, + 0x003f] %asi, %r25
	.word 0xfac520a5  ! 2753: LDSWA_I	ldswa	[%r20, + 0x00a5] %asi, %r29
cpu_intr_2_211:
	setx	0x33010d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_212:
	setx	0x320132, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_196:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_196), 16, 16)) -> intp(2, 0, 36)
cpu_intr_2_213:
	setx	0x300210, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_214:
	setx	0x320229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_215:
	setx	0x330130, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_216:
	setx	0x33013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xba046107  ! 2790: ADD_I	add 	%r17, 0x0107, %r29
	.word 0xf48c2133  ! 2791: LDUBA_I	lduba	[%r16, + 0x0133] %asi, %r26
T2_asi_reg_wr_110:
	mov	0x3c0, %r14
	.word 0xfef38e40  ! 2793: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_rd_102:
	mov	0x12, %r14
	.word 0xf0db84a0  ! 2794: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf0c5c020  ! 2795: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r24
T2_asi_reg_wr_111:
	mov	0x3c2, %r14
	.word 0xfaf38e80  ! 2798: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbc14c000  ! 2799: OR_R	or 	%r19, %r0, %r30
	.word 0xfcdda18b  ! 2801: LDXA_I	ldxa	[%r22, + 0x018b] %asi, %r30
	.word 0xf205a0aa  ! 2802: LDUW_I	lduw	[%r22 + 0x00aa], %r25
cpu_intr_2_217:
	setx	0x310017, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf45c21ce  ! 2807: LDX_I	ldx	[%r16 + 0x01ce], %r26
	.word 0xf0840020  ! 2809: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r24
iob_intr_2_197:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_197), 16, 16)) -> intp(2, 0, 2c)
iob_intr_2_198:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_198), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf454c000  ! 2816: LDSH_R	ldsh	[%r19 + %r0], %r26
	ta	T_CHANGE_TO_TL1
	.word 0xf4846060  ! 2823: LDUWA_I	lduwa	[%r17, + 0x0060] %asi, %r26
T2_asi_reg_rd_103:
	mov	0x34, %r14
	.word 0xf2db8e40  ! 2825: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf44cc000  ! 2827: LDSB_R	ldsb	[%r19 + %r0], %r26
	.word 0xf40d4000  ! 2830: LDUB_R	ldub	[%r21 + %r0], %r26
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982d9a  ! 2831: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9a, %hpstate
iob_intr_2_199:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_199), 16, 16)) -> intp(2, 0, 6)
	.word 0xfe8da10b  ! 2835: LDUBA_I	lduba	[%r22, + 0x010b] %asi, %r31
	.word 0xbe34c000  ! 2837: ORN_R	orn 	%r19, %r0, %r31
T2_asi_reg_rd_104:
	mov	0x3c1, %r14
	.word 0xfadb84a0  ! 2838: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_2_200:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_200), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf4c50020  ! 2847: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r26
T2_asi_reg_wr_112:
	mov	0x1b, %r14
	.word 0xfcf38400  ! 2849: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983dc0  ! 2852: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dc0, %hpstate
	.word 0xfac5c020  ! 2854: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r29
cpu_intr_2_218:
	setx	0x34013d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_105:
	mov	0x32, %r14
	.word 0xf2db8e80  ! 2856: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_2_219:
	setx	0x35031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf28dc020  ! 2859: LDUBA_R	lduba	[%r23, %r0] 0x01, %r25
cpu_intr_2_220:
	setx	0x340006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf815c000  ! 2861: LDUH_R	lduh	[%r23 + %r0], %r28
iob_intr_2_201:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_201), 16, 16)) -> intp(2, 0, 18)
	.word 0xf8048000  ! 2863: LDUW_R	lduw	[%r18 + %r0], %r28
	.word 0xf0850020  ! 2864: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r24
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x8198388a  ! 2866: WRHPR_HPSTATE_I	wrhpr	%r0, 0x188a, %hpstate
	.word 0xf4d5e043  ! 2870: LDSHA_I	ldsha	[%r23, + 0x0043] %asi, %r26
iob_intr_2_202:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_202), 16, 16)) -> intp(2, 0, 2a)
T2_asi_reg_wr_113:
	mov	0x29, %r14
	.word 0xf2f389e0  ! 2876: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xfa8d20f8  ! 2878: LDUBA_I	lduba	[%r20, + 0x00f8] %asi, %r29
	.word 0xfe144000  ! 2880: LDUH_R	lduh	[%r17 + %r0], %r31
	.word 0xfc150000  ! 2881: LDUH_R	lduh	[%r20 + %r0], %r30
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983d10  ! 2883: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d10, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_203:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_203), 16, 16)) -> intp(2, 0, 32)
	.word 0xbebd4000  ! 2886: XNORcc_R	xnorcc 	%r21, %r0, %r31
	.word 0xf0d5e193  ! 2888: LDSHA_I	ldsha	[%r23, + 0x0193] %asi, %r24
	.word 0xfadce078  ! 2893: LDXA_I	ldxa	[%r19, + 0x0078] %asi, %r29
T2_asi_reg_wr_114:
	mov	0x3c7, %r14
	.word 0xf2f38e40  ! 2895: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_2_221:
	setx	0x360317, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_204:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_204), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_222:
	setx	0x37033e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_115:
	mov	0x18, %r14
	.word 0xf0f38e80  ! 2900: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_2_223:
	setx	0x360002, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_106:
	mov	0x1c, %r14
	.word 0xfcdb8400  ! 2903: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T2_asi_reg_rd_107:
	mov	0x33, %r14
	.word 0xf6db8e60  ! 2904: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T2_asi_reg_wr_116:
	mov	0x19, %r14
	.word 0xf6f38e80  ! 2906: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf6cc61c0  ! 2908: LDSBA_I	ldsba	[%r17, + 0x01c0] %asi, %r27
	.word 0xf8140000  ! 2909: LDUH_R	lduh	[%r16 + %r0], %r28
T2_asi_reg_wr_117:
	mov	0x21, %r14
	.word 0xfcf389e0  ! 2912: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_2_205:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_205), 16, 16)) -> intp(2, 0, 1b)
iob_intr_2_206:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_206), 16, 16)) -> intp(2, 0, 36)
	.word 0xf2cdc020  ! 2918: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r25
cpu_intr_2_224:
	setx	0x340028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4c8000  ! 2920: LDSB_R	ldsb	[%r18 + %r0], %r31
iob_intr_2_207:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_207), 16, 16)) -> intp(2, 0, 1c)
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_108:
	mov	0x31, %r14
	.word 0xf6db8e60  ! 2931: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_2_225:
	setx	0x360104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60461ee  ! 2935: LDUW_I	lduw	[%r17 + 0x01ee], %r27
	.word 0xfe45c000  ! 2936: LDSW_R	ldsw	[%r23 + %r0], %r31
T2_asi_reg_wr_118:
	mov	0x28, %r14
	.word 0xfcf38e40  ! 2937: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_rd_109:
	mov	0x23, %r14
	.word 0xfadb8e40  ! 2939: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf8c4e10d  ! 2941: LDSWA_I	ldswa	[%r19, + 0x010d] %asi, %r28
	.word 0xf045a027  ! 2952: LDSW_I	ldsw	[%r22 + 0x0027], %r24
	ta	T_CHANGE_TO_TL0
cpu_intr_2_226:
	setx	0x350204, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_227:
	setx	0x350314, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_208:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_208), 16, 16)) -> intp(2, 0, f)
T2_asi_reg_rd_110:
	mov	0x3c3, %r14
	.word 0xfadb89e0  ! 2961: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_2_209:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_209), 16, 16)) -> intp(2, 0, 34)
T2_asi_reg_rd_111:
	mov	0x28, %r14
	.word 0xf0db8e80  ! 2965: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_2_210:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_210), 16, 16)) -> intp(2, 0, 2b)
T2_asi_reg_rd_112:
	mov	0x30, %r14
	.word 0xf2db8e80  ! 2967: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T2_asi_reg_wr_119:
	mov	0x10, %r14
	.word 0xfaf38e60  ! 2969: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_2_211:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_211), 16, 16)) -> intp(2, 0, 21)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_113:
	mov	0x1f, %r14
	.word 0xf8db8e80  ! 2976: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_2_228:
	setx	0x360104, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_114:
	mov	0x8, %r14
	.word 0xfadb8e40  ! 2982: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_2_212:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_212), 16, 16)) -> intp(2, 0, 32)
	.word 0x8f902000  ! 2986: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xf405e0ce  ! 2990: LDUW_I	lduw	[%r23 + 0x00ce], %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_213:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_213), 16, 16)) -> intp(2, 0, 11)
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982bca  ! 2998: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bca, %hpstate
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_120:
	mov	0x3c7, %r14
	.word 0xf0f384a0  ! 3000: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_2_229:
	setx	0x35033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64421e2  ! 3002: LDSW_I	ldsw	[%r16 + 0x01e2], %r27
T2_asi_reg_rd_115:
	mov	0x3c4, %r14
	.word 0xfadb84a0  ! 3003: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_2_214:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_214), 16, 16)) -> intp(2, 0, 3b)
	.word 0xb6a52066  ! 3007: SUBcc_I	subcc 	%r20, 0x0066, %r27
cpu_intr_2_230:
	setx	0x34002d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_215:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_215), 16, 16)) -> intp(2, 0, 1a)
iob_intr_2_216:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_216), 16, 16)) -> intp(2, 0, 2)
cpu_intr_2_231:
	setx	0x37020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_116:
	mov	0x34, %r14
	.word 0xf8db8e60  ! 3029: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xfe044000  ! 3031: LDUW_R	lduw	[%r17 + %r0], %r31
T2_asi_reg_rd_117:
	mov	0x2f, %r14
	.word 0xf8db8e60  ! 3032: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf8d54020  ! 3035: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r28
iob_intr_2_217:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_217), 16, 16)) -> intp(2, 0, 3b)
	.word 0xf0958020  ! 3037: LDUHA_R	lduha	[%r22, %r0] 0x01, %r24
	.word 0xb2ada1b7  ! 3038: ANDNcc_I	andncc 	%r22, 0x01b7, %r25
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_232:
	setx	0x36012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_121:
	mov	0x8, %r14
	.word 0xf2f389e0  ! 3041: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0x9195e046  ! 3044: WRPR_PIL_I	wrpr	%r23, 0x0046, %pil
	.word 0xfcd58020  ! 3049: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r30
	.word 0xb1641800  ! 3051: MOVcc_R	<illegal instruction>
iob_intr_2_218:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_218), 16, 16)) -> intp(2, 0, 29)
cpu_intr_2_233:
	setx	0x360200, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_234:
	setx	0x340304, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_118:
	mov	0x28, %r14
	.word 0xf4db8e80  ! 3058: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_2_219:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_219), 16, 16)) -> intp(2, 0, 5)
iob_intr_2_220:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_220), 16, 16)) -> intp(2, 0, 5)
iob_intr_2_221:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_221), 16, 16)) -> intp(2, 0, 39)
iob_intr_2_222:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_222), 16, 16)) -> intp(2, 0, 21)
	.word 0xf804a1c0  ! 3067: LDUW_I	lduw	[%r18 + 0x01c0], %r28
iob_intr_2_223:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_223), 16, 16)) -> intp(2, 0, 11)
T2_asi_reg_rd_119:
	mov	0x18, %r14
	.word 0xf8db8e80  ! 3070: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_2_224:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_224), 16, 16)) -> intp(2, 0, 34)
T2_asi_reg_rd_120:
	mov	0x1d, %r14
	.word 0xfedb8e80  ! 3073: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xfac4215c  ! 3074: LDSWA_I	ldswa	[%r16, + 0x015c] %asi, %r29
	.word 0xb025c000  ! 3076: SUB_R	sub 	%r23, %r0, %r24
cpu_intr_2_235:
	setx	0x360039, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_236:
	setx	0x360312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6a50000  ! 3081: SUBcc_R	subcc 	%r20, %r0, %r27
	.word 0xf24cc000  ! 3083: LDSB_R	ldsb	[%r19 + %r0], %r25
iob_intr_2_225:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_225), 16, 16)) -> intp(2, 0, 27)
cpu_intr_2_237:
	setx	0x360328, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_238:
	setx	0x35031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4c61f6  ! 3090: LDSB_I	ldsb	[%r17 + 0x01f6], %r31
T2_asi_reg_rd_121:
	mov	0x3c0, %r14
	.word 0xfadb84a0  ! 3092: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_2_239:
	setx	0x36031b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_240:
	setx	0x370203, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_226:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_226), 16, 16)) -> intp(2, 0, 39)
	.word 0xf44c0000  ! 3101: LDSB_R	ldsb	[%r16 + %r0], %r26
cpu_intr_2_241:
	setx	0x370010, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_122:
	mov	0x3c1, %r14
	.word 0xf8db8e40  ! 3104: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf245e0f0  ! 3106: LDSW_I	ldsw	[%r23 + 0x00f0], %r25
	ta	T_CHANGE_TO_TL1
	.word 0xfe14c000  ! 3108: LDUH_R	lduh	[%r19 + %r0], %r31
T2_asi_reg_rd_123:
	mov	0x1f, %r14
	.word 0xf4db89e0  ! 3111: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf24d613b  ! 3112: LDSB_I	ldsb	[%r21 + 0x013b], %r25
	.word 0xb445217b  ! 3113: ADDC_I	addc 	%r20, 0x017b, %r26
	.word 0xbe94c000  ! 3114: ORcc_R	orcc 	%r19, %r0, %r31
	.word 0xf6ccc020  ! 3115: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r27
	.word 0xf84461fd  ! 3121: LDSW_I	ldsw	[%r17 + 0x01fd], %r28
iob_intr_2_227:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_227), 16, 16)) -> intp(2, 0, 7)
	.word 0xb9518000  ! 3123: RDPR_PSTATE	<illegal instruction>
iob_intr_2_228:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_228), 16, 16)) -> intp(2, 0, 2b)
	.word 0xfa8dc020  ! 3125: LDUBA_R	lduba	[%r23, %r0] 0x01, %r29
	.word 0xfa54c000  ! 3126: LDSH_R	ldsh	[%r19 + %r0], %r29
T2_asi_reg_rd_124:
	mov	0x15, %r14
	.word 0xfadb89e0  ! 3127: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	ta	T_CHANGE_TO_TL0
	.word 0xf6d44020  ! 3130: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r27
iob_intr_2_229:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_229), 16, 16)) -> intp(2, 0, c)
	.word 0xfcd40020  ! 3132: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r30
cpu_intr_2_242:
	setx	0x340008, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_230:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_230), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_rd_125:
	mov	0x3c1, %r14
	.word 0xf8db8e60  ! 3137: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xfc844020  ! 3139: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r30
	.word 0xf8c420af  ! 3140: LDSWA_I	ldswa	[%r16, + 0x00af] %asi, %r28
T2_asi_reg_wr_122:
	mov	0x3c8, %r14
	.word 0xfef384a0  ! 3141: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xfcc4a1aa  ! 3142: LDSWA_I	ldswa	[%r18, + 0x01aa] %asi, %r30
	.word 0xf6140000  ! 3145: LDUH_R	lduh	[%r16 + %r0], %r27
	.word 0xf0842073  ! 3148: LDUWA_I	lduwa	[%r16, + 0x0073] %asi, %r24
	.word 0xfad42061  ! 3153: LDSHA_I	ldsha	[%r16, + 0x0061] %asi, %r29
	.word 0xf45d2125  ! 3155: LDX_I	ldx	[%r20 + 0x0125], %r26
T2_asi_reg_wr_123:
	mov	0xb, %r14
	.word 0xf0f38e80  ! 3157: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_124:
	mov	0x14, %r14
	.word 0xf4f38400  ! 3159: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_2_243:
	setx	0x34022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe1ca1c7  ! 3162: XOR_I	xor 	%r18, 0x01c7, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_rd_126:
	mov	0x3c3, %r14
	.word 0xfadb8e80  ! 3173: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf8040000  ! 3175: LDUW_R	lduw	[%r16 + %r0], %r28
	.word 0xfec48020  ! 3176: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r31
	.word 0x8794a0fb  ! 3180: WRPR_TT_I	wrpr	%r18, 0x00fb, %tt
	.word 0xfcd561e0  ! 3181: LDSHA_I	ldsha	[%r21, + 0x01e0] %asi, %r30
iob_intr_2_231:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_231), 16, 16)) -> intp(2, 0, 2c)
cpu_intr_2_244:
	setx	0x37021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa94c020  ! 3185: LDUHA_R	lduha	[%r19, %r0] 0x01, %r29
cpu_intr_2_245:
	setx	0x34021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf605a08c  ! 3189: LDUW_I	lduw	[%r22 + 0x008c], %r27
cpu_intr_2_246:
	setx	0x340125, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_247:
	setx	0x37002c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_248:
	setx	0x370105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4c4a12f  ! 3196: LDSWA_I	ldswa	[%r18, + 0x012f] %asi, %r26
iob_intr_2_232:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_232), 16, 16)) -> intp(2, 0, 13)
	.word 0xb4bda01c  ! 3198: XNORcc_I	xnorcc 	%r22, 0x001c, %r26
iob_intr_2_233:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_233), 16, 16)) -> intp(2, 0, 3a)
iob_intr_2_234:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_234), 16, 16)) -> intp(2, 0, 26)
	.word 0xb604218f  ! 3202: ADD_I	add 	%r16, 0x018f, %r27
	ta	T_CHANGE_TO_TL0
iob_intr_2_235:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_235), 16, 16)) -> intp(2, 0, 18)
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_249:
	setx	0x360328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x839561f1  ! 3218: WRPR_TNPC_I	wrpr	%r21, 0x01f1, %tnpc
T2_asi_reg_rd_127:
	mov	0x27, %r14
	.word 0xf2db89e0  ! 3220: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xf0840020  ! 3221: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r24
iob_intr_2_236:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_236), 16, 16)) -> intp(2, 0, 3e)
	.word 0xb6ade155  ! 3229: ANDNcc_I	andncc 	%r23, 0x0155, %r27
cpu_intr_2_250:
	setx	0x360116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_237:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_237), 16, 16)) -> intp(2, 0, 2f)
	.word 0xfa54c000  ! 3235: LDSH_R	ldsh	[%r19 + %r0], %r29
cpu_intr_2_251:
	setx	0x370102, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_128:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 3239: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983dc0  ! 3240: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dc0, %hpstate
iob_intr_2_238:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_238), 16, 16)) -> intp(2, 0, 1b)
T2_asi_reg_rd_129:
	mov	0xe, %r14
	.word 0xf4db8e60  ! 3244: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xfc95e16e  ! 3249: LDUHA_I	lduha	[%r23, + 0x016e] %asi, %r30
cpu_intr_2_252:
	setx	0x350222, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983ad8  ! 3255: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ad8, %hpstate
	.word 0xb3643801  ! 3256: MOVcc_I	<illegal instruction>
	.word 0xfed4c020  ! 3260: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r31
	.word 0xfac521dd  ! 3262: LDSWA_I	ldswa	[%r20, + 0x01dd] %asi, %r29
	.word 0xf0cda143  ! 3264: LDSBA_I	ldsba	[%r22, + 0x0143] %asi, %r24
iob_intr_2_239:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_239), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_240:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_240), 16, 16)) -> intp(2, 0, b)
	.word 0xf24c0000  ! 3274: LDSB_R	ldsb	[%r16 + %r0], %r25
iob_intr_2_241:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_241), 16, 16)) -> intp(2, 0, 36)
	.word 0xfe85c020  ! 3280: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r31
T2_asi_reg_wr_125:
	mov	0x3c4, %r14
	.word 0xf0f38e40  ! 3286: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf2cc6149  ! 3287: LDSBA_I	ldsba	[%r17, + 0x0149] %asi, %r25
cpu_intr_2_253:
	setx	0x3b013d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_126:
	mov	0x2a, %r14
	.word 0xfcf38400  ! 3291: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_2_242:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_242), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_254:
	setx	0x380133, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_255:
	setx	0x3a022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8552195  ! 3297: LDSH_I	ldsh	[%r20 + 0x0195], %r28
	.word 0xfc456039  ! 3298: LDSW_I	ldsw	[%r21 + 0x0039], %r30
T2_asi_reg_rd_130:
	mov	0x3c1, %r14
	.word 0xf0db8400  ! 3300: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_2_243:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_243), 16, 16)) -> intp(2, 0, 3c)
T2_asi_reg_rd_131:
	mov	0x34, %r14
	.word 0xfadb8e80  ! 3304: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf694c020  ! 3305: LDUHA_R	lduha	[%r19, %r0] 0x01, %r27
T2_asi_reg_rd_132:
	mov	0x3c5, %r14
	.word 0xf4db8e40  ! 3306: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_2_256:
	setx	0x3b0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2844020  ! 3308: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r25
	.word 0xf44d21aa  ! 3311: LDSB_I	ldsb	[%r20 + 0x01aa], %r26
iob_intr_2_244:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_244), 16, 16)) -> intp(2, 0, 1)
cpu_intr_2_257:
	setx	0x3b0100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24ce1d5  ! 3315: LDSB_I	ldsb	[%r19 + 0x01d5], %r25
cpu_intr_2_258:
	setx	0x390002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbea5e0c9  ! 3318: SUBcc_I	subcc 	%r23, 0x00c9, %r31
cpu_intr_2_259:
	setx	0x38033c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_260:
	setx	0x380029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6c5a075  ! 3322: LDSWA_I	ldswa	[%r22, + 0x0075] %asi, %r27
cpu_intr_2_261:
	setx	0x3b023f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_262:
	setx	0x380317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf205e1ff  ! 3326: LDUW_I	lduw	[%r23 + 0x01ff], %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf8c5a1b3  ! 3335: LDSWA_I	ldswa	[%r22, + 0x01b3] %asi, %r28
	.word 0xf2d5a1f8  ! 3336: LDSHA_I	ldsha	[%r22, + 0x01f8] %asi, %r25
	.word 0xfccc612a  ! 3337: LDSBA_I	ldsba	[%r17, + 0x012a] %asi, %r30
T2_asi_reg_wr_127:
	mov	0x36, %r14
	.word 0xf6f38e40  ! 3338: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf6d44020  ! 3339: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r27
cpu_intr_2_263:
	setx	0x380338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88cc020  ! 3344: LDUBA_R	lduba	[%r19, %r0] 0x01, %r28
cpu_intr_2_264:
	setx	0x3a0020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc84a13c  ! 3349: LDUWA_I	lduwa	[%r18, + 0x013c] %asi, %r30
T2_asi_reg_wr_128:
	mov	0x35, %r14
	.word 0xf8f38e40  ! 3351: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_rd_133:
	mov	0xf, %r14
	.word 0xfedb8e80  ! 3356: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf2cd4020  ! 3358: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r25
	.word 0xbc2d8000  ! 3366: ANDN_R	andn 	%r22, %r0, %r30
iob_intr_2_245:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_245), 16, 16)) -> intp(2, 0, 24)
cpu_intr_2_265:
	setx	0x3b0139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfed44020  ! 3372: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r31
	.word 0xfa5d0000  ! 3373: LDX_R	ldx	[%r20 + %r0], %r29
iob_intr_2_246:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_246), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf0d4c020  ! 3376: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r24
cpu_intr_2_266:
	setx	0x3a003f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_267:
	setx	0x3a0200, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_268:
	setx	0x3a0317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4c5c000  ! 3380: ADDCcc_R	addccc 	%r23, %r0, %r26
iob_intr_2_247:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_247), 16, 16)) -> intp(2, 0, 22)
	.word 0xb0c46184  ! 3383: ADDCcc_I	addccc 	%r17, 0x0184, %r24
	.word 0xfa440000  ! 3385: LDSW_R	ldsw	[%r16 + %r0], %r29
cpu_intr_2_269:
	setx	0x3b010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4b5613c  ! 3388: ORNcc_I	orncc 	%r21, 0x013c, %r26
	.word 0xf245c000  ! 3390: LDSW_R	ldsw	[%r23 + %r0], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc8c0020  ! 3392: LDUBA_R	lduba	[%r16, %r0] 0x01, %r30
	ta	T_CHANGE_TO_TL1
	.word 0xbc34e042  ! 3395: ORN_I	orn 	%r19, 0x0042, %r30
	.word 0xba04e1bb  ! 3398: ADD_I	add 	%r19, 0x01bb, %r29
iob_intr_2_248:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_248), 16, 16)) -> intp(2, 0, 3b)
cpu_intr_2_270:
	setx	0x3b0317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05ce192  ! 3401: LDX_I	ldx	[%r19 + 0x0192], %r24
	.word 0xf2c44020  ! 3403: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r25
	.word 0xfe958020  ! 3405: LDUHA_R	lduha	[%r22, %r0] 0x01, %r31
T2_asi_reg_rd_134:
	mov	0x26, %r14
	.word 0xf8db8400  ! 3406: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_2_249:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_249), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_271:
	setx	0x390339, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_272:
	setx	0x3b023c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_135:
	mov	0x3c0, %r14
	.word 0xf2db8400  ! 3419: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T2_asi_reg_rd_136:
	mov	0xc, %r14
	.word 0xf4db89e0  ! 3420: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_2_250:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_250), 16, 16)) -> intp(2, 0, b)
T2_asi_reg_rd_137:
	mov	0x24, %r14
	.word 0xf0db8e80  ! 3424: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_2_251:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_251), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_rd_138:
	mov	0x15, %r14
	.word 0xf4db8e80  ! 3428: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb52c2001  ! 3432: SLL_I	sll 	%r16, 0x0001, %r26
T2_asi_reg_wr_129:
	mov	0x3c7, %r14
	.word 0xfaf38400  ! 3433: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T2_asi_reg_wr_130:
	mov	0x3c7, %r14
	.word 0xfcf38e80  ! 3434: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T2_asi_reg_wr_131:
	mov	0x3c6, %r14
	.word 0xf6f384a0  ! 3435: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf4554000  ! 3436: LDSH_R	ldsh	[%r21 + %r0], %r26
T2_asi_reg_rd_139:
	mov	0xe, %r14
	.word 0xf4db8400  ! 3438: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T2_asi_reg_rd_140:
	mov	0x3c7, %r14
	.word 0xf6db89e0  ! 3441: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T2_asi_reg_wr_132:
	mov	0x21, %r14
	.word 0xfaf384a0  ! 3443: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xf614e193  ! 3445: LDUH_I	lduh	[%r19 + 0x0193], %r27
iob_intr_2_252:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_252), 16, 16)) -> intp(2, 0, 2)
	.word 0xfe95e0b6  ! 3447: LDUHA_I	lduha	[%r23, + 0x00b6] %asi, %r31
cpu_intr_2_273:
	setx	0x3b0202, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_133:
	mov	0x31, %r14
	.word 0xfaf38e60  ! 3452: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf24dc000  ! 3453: LDSB_R	ldsb	[%r23 + %r0], %r25
T2_asi_reg_wr_134:
	mov	0x34, %r14
	.word 0xfef38e40  ! 3454: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf0d52169  ! 3459: LDSHA_I	ldsha	[%r20, + 0x0169] %asi, %r24
T2_asi_reg_wr_135:
	mov	0xa, %r14
	.word 0xfaf38e60  ! 3460: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf00ce056  ! 3463: LDUB_I	ldub	[%r19 + 0x0056], %r24
	.word 0xfec5c020  ! 3465: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r31
iob_intr_2_253:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_253), 16, 16)) -> intp(2, 0, 2d)
cpu_intr_2_274:
	setx	0x3b023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfccd8020  ! 3469: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r30
	.word 0xb2b5e056  ! 3470: ORNcc_I	orncc 	%r23, 0x0056, %r25
T2_asi_reg_rd_141:
	mov	0x3c5, %r14
	.word 0xfedb84a0  ! 3474: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb23c6064  ! 3476: XNOR_I	xnor 	%r17, 0x0064, %r25
T2_asi_reg_rd_142:
	mov	0x3, %r14
	.word 0xf2db84a0  ! 3479: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_2_275:
	setx	0x390123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8544000  ! 3482: LDSH_R	ldsh	[%r17 + %r0], %r28
	.word 0xfec54020  ! 3484: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r31
iob_intr_2_254:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_254), 16, 16)) -> intp(2, 0, 18)
	ta	T_CHANGE_HPRIV
	.word 0x879421c2  ! 3490: WRPR_TT_I	wrpr	%r16, 0x01c2, %tt
	.word 0xfec54020  ! 3494: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r31
iob_intr_2_255:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_255), 16, 16)) -> intp(2, 0, 15)
	.word 0xf0d40020  ! 3499: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r24
	.word 0x8395e1e5  ! 3500: WRPR_TNPC_I	wrpr	%r23, 0x01e5, %tnpc
	.word 0xf88c4020  ! 3501: LDUBA_R	lduba	[%r17, %r0] 0x01, %r28
T2_asi_reg_wr_136:
	mov	0x4, %r14
	.word 0xfef38e40  ! 3506: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb23c8000  ! 3516: XNOR_R	xnor 	%r18, %r0, %r25
cpu_intr_2_276:
	setx	0x380228, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_137:
	mov	0x3c6, %r14
	.word 0xfcf38e80  ! 3520: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb934e001  ! 3522: SRL_I	srl 	%r19, 0x0001, %r28
T2_asi_reg_rd_143:
	mov	0x2e, %r14
	.word 0xf6db89e0  ! 3523: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T2_asi_reg_wr_138:
	mov	0x3c6, %r14
	.word 0xf2f38e80  ! 3525: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T2_asi_reg_rd_144:
	mov	0x2d, %r14
	.word 0xf2db8e40  ! 3526: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_wr_139:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 3529: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfc8d6133  ! 3531: LDUBA_I	lduba	[%r21, + 0x0133] %asi, %r30
cpu_intr_2_277:
	setx	0x380234, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_140:
	mov	0x3c1, %r14
	.word 0xf2f389e0  ! 3535: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf48ca1c8  ! 3538: LDUBA_I	lduba	[%r18, + 0x01c8] %asi, %r26
	.word 0xfa45a0c1  ! 3539: LDSW_I	ldsw	[%r22 + 0x00c1], %r29
	.word 0xfe9460c8  ! 3540: LDUHA_I	lduha	[%r17, + 0x00c8] %asi, %r31
	.word 0xfc15215f  ! 3541: LDUH_I	lduh	[%r20 + 0x015f], %r30
	ta	T_CHANGE_TO_TL0
iob_intr_2_256:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_256), 16, 16)) -> intp(2, 0, 1c)
iob_intr_2_257:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_257), 16, 16)) -> intp(2, 0, 0)
	.word 0xf805c000  ! 3547: LDUW_R	lduw	[%r23 + %r0], %r28
	.word 0xf2d50020  ! 3553: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r25
T2_asi_reg_wr_141:
	mov	0x2e, %r14
	.word 0xfef38e40  ! 3557: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfa4d0000  ! 3559: LDSB_R	ldsb	[%r20 + %r0], %r29
	.word 0xf4d40020  ! 3561: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r26
	.word 0xbe444000  ! 3563: ADDC_R	addc 	%r17, %r0, %r31
cpu_intr_2_278:
	setx	0x3b033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfecc8020  ! 3574: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r31
iob_intr_2_258:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_258), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_wr_142:
	mov	0x3c4, %r14
	.word 0xfef389e0  ! 3578: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_2_279:
	setx	0x39020b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_280:
	setx	0x3b0302, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_281:
	setx	0x3a0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04d612b  ! 3584: LDSB_I	ldsb	[%r21 + 0x012b], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb72d3001  ! 3594: SLLX_I	sllx	%r20, 0x0001, %r27
	.word 0xf60521be  ! 3595: LDUW_I	lduw	[%r20 + 0x01be], %r27
T2_asi_reg_rd_145:
	mov	0x3c0, %r14
	.word 0xf0db8e80  ! 3597: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xfe844020  ! 3599: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r31
T2_asi_reg_wr_143:
	mov	0x14, %r14
	.word 0xf8f389e0  ! 3600: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_2_282:
	setx	0x390217, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_283:
	setx	0x3b012c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_146:
	mov	0xa, %r14
	.word 0xf0db8e40  ! 3608: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_2_259:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_259), 16, 16)) -> intp(2, 0, e)
T2_asi_reg_rd_147:
	mov	0x3c7, %r14
	.word 0xf8db8e80  ! 3612: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_2_284:
	setx	0x39032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_148:
	mov	0xb, %r14
	.word 0xf2db8400  ! 3620: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf89561c9  ! 3621: LDUHA_I	lduha	[%r21, + 0x01c9] %asi, %r28
cpu_intr_2_285:
	setx	0x390208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe95a15b  ! 3628: LDUHA_I	lduha	[%r22, + 0x015b] %asi, %r31
T2_asi_reg_wr_144:
	mov	0x0, %r14
	.word 0xfaf38400  ! 3629: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbeaca0fc  ! 3631: ANDNcc_I	andncc 	%r18, 0x00fc, %r31
iob_intr_2_260:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_260), 16, 16)) -> intp(2, 0, 24)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_rd_149:
	mov	0x2b, %r14
	.word 0xfcdb8400  ! 3636: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_2_286:
	setx	0x3a0330, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_287:
	setx	0x390319, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_288:
	setx	0x390230, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_150:
	mov	0xa, %r14
	.word 0xf2db84a0  ! 3645: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf8848020  ! 3646: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r28
T2_asi_reg_rd_151:
	mov	0x3c7, %r14
	.word 0xf8db8400  ! 3649: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_2_289:
	setx	0x3a0000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc044000  ! 3655: LDUW_R	lduw	[%r17 + %r0], %r30
	.word 0xbc0ca053  ! 3656: AND_I	and 	%r18, 0x0053, %r30
	.word 0xfa0cc000  ! 3657: LDUB_R	ldub	[%r19 + %r0], %r29
	.word 0xf24520ab  ! 3659: LDSW_I	ldsw	[%r20 + 0x00ab], %r25
	.word 0xfac4e1f3  ! 3660: LDSWA_I	ldswa	[%r19, + 0x01f3] %asi, %r29
T2_asi_reg_wr_145:
	mov	0x3c3, %r14
	.word 0xf4f38400  ! 3661: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xfc852083  ! 3663: LDUWA_I	lduwa	[%r20, + 0x0083] %asi, %r30
	.word 0xfe144000  ! 3664: LDUH_R	lduh	[%r17 + %r0], %r31
T2_asi_reg_wr_146:
	mov	0x3c0, %r14
	.word 0xf0f38400  ! 3669: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T2_asi_reg_wr_147:
	mov	0x29, %r14
	.word 0xfcf38e40  ! 3676: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_290:
	setx	0x3a0128, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_148:
	mov	0x33, %r14
	.word 0xfef38400  ! 3679: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_2_261:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_261), 16, 16)) -> intp(2, 0, 10)
iob_intr_2_262:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_262), 16, 16)) -> intp(2, 0, 18)
	ta	T_CHANGE_NONHPRIV
	.word 0xfecc8020  ! 3688: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r31
T2_asi_reg_wr_149:
	mov	0x32, %r14
	.word 0xfef38e80  ! 3689: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xfe840020  ! 3690: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf0550000  ! 3695: LDSH_R	ldsh	[%r20 + %r0], %r24
T2_asi_reg_rd_152:
	mov	0x33, %r14
	.word 0xf2db84a0  ! 3696: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf20421ae  ! 3698: LDUW_I	lduw	[%r16 + 0x01ae], %r25
iob_intr_2_263:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_263), 16, 16)) -> intp(2, 0, 26)
T2_asi_reg_rd_153:
	mov	0x10, %r14
	.word 0xfedb8400  ! 3701: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T2_asi_reg_wr_150:
	mov	0x3, %r14
	.word 0xfcf38400  ! 3703: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xf4156046  ! 3707: LDUH_I	lduh	[%r21 + 0x0046], %r26
	.word 0xfc4ce075  ! 3708: LDSB_I	ldsb	[%r19 + 0x0075], %r30
iob_intr_2_264:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_264), 16, 16)) -> intp(2, 0, 1)
	.word 0xf2454000  ! 3711: LDSW_R	ldsw	[%r21 + %r0], %r25
T2_asi_reg_rd_154:
	mov	0x10, %r14
	.word 0xfcdb8e40  ! 3712: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfcd40020  ! 3715: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r30
	.word 0xfad58020  ! 3716: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r29
	.word 0xf4d44020  ! 3719: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r26
T2_asi_reg_wr_151:
	mov	0x3c2, %r14
	.word 0xfef38400  ! 3720: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T2_asi_reg_rd_155:
	mov	0x4, %r14
	.word 0xfadb89e0  ! 3722: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf0c46188  ! 3726: LDSWA_I	ldswa	[%r17, + 0x0188] %asi, %r24
iob_intr_2_265:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_265), 16, 16)) -> intp(2, 0, 8)
	.word 0xf88ce193  ! 3731: LDUBA_I	lduba	[%r19, + 0x0193] %asi, %r28
	.word 0xb73c3001  ! 3732: SRAX_I	srax	%r16, 0x0001, %r27
cpu_intr_2_291:
	setx	0x3003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf604c000  ! 3734: LDUW_R	lduw	[%r19 + %r0], %r27
	.word 0xf4dda185  ! 3737: LDXA_I	ldxa	[%r22, + 0x0185] %asi, %r26
cpu_intr_2_292:
	setx	0x3c0338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0d52005  ! 3740: LDSHA_I	ldsha	[%r20, + 0x0005] %asi, %r24
iob_intr_2_266:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_266), 16, 16)) -> intp(2, 0, 2a)
cpu_intr_2_293:
	setx	0x3e0131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc5521b5  ! 3747: LDSH_I	ldsh	[%r20 + 0x01b5], %r30
	.word 0xb824612a  ! 3751: SUB_I	sub 	%r17, 0x012a, %r28
	.word 0xb09c6050  ! 3752: XORcc_I	xorcc 	%r17, 0x0050, %r24
T2_asi_reg_rd_156:
	mov	0x38, %r14
	.word 0xfcdb89e0  ! 3753: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_2_294:
	setx	0x3e0016, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_152:
	mov	0x3c2, %r14
	.word 0xf4f38e80  ! 3757: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf255c000  ! 3758: LDSH_R	ldsh	[%r23 + %r0], %r25
iob_intr_2_267:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_267), 16, 16)) -> intp(2, 0, 1b)
iob_intr_2_268:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_268), 16, 16)) -> intp(2, 0, 5)
	.word 0xfe8dc020  ! 3763: LDUBA_R	lduba	[%r23, %r0] 0x01, %r31
iob_intr_2_269:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_269), 16, 16)) -> intp(2, 0, 38)
	.word 0xb0954000  ! 3767: ORcc_R	orcc 	%r21, %r0, %r24
	.word 0xb12cc000  ! 3768: SLL_R	sll 	%r19, %r0, %r24
	.word 0xf2840020  ! 3769: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r25
cpu_intr_2_295:
	setx	0x3e0230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8f902001  ! 3771: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xf8cd0020  ! 3774: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r28
	.word 0xf0c520ce  ! 3777: LDSWA_I	ldswa	[%r20, + 0x00ce] %asi, %r24
cpu_intr_2_296:
	setx	0x3c020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc14e1c0  ! 3782: LDUH_I	lduh	[%r19 + 0x01c0], %r30
	.word 0xbcad0000  ! 3784: ANDNcc_R	andncc 	%r20, %r0, %r30
T2_asi_reg_rd_157:
	mov	0x3c2, %r14
	.word 0xf4db8e60  ! 3785: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_2_270:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_270), 16, 16)) -> intp(2, 0, 36)
iob_intr_2_271:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_271), 16, 16)) -> intp(2, 0, 15)
	.word 0xfa84e069  ! 3792: LDUWA_I	lduwa	[%r19, + 0x0069] %asi, %r29
	.word 0xbc84607c  ! 3793: ADDcc_I	addcc 	%r17, 0x007c, %r30
T2_asi_reg_rd_158:
	mov	0x21, %r14
	.word 0xf2db84a0  ! 3794: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf255e1a8  ! 3795: LDSH_I	ldsh	[%r23 + 0x01a8], %r25
	.word 0xb2b56176  ! 3799: ORNcc_I	orncc 	%r21, 0x0176, %r25
iob_intr_2_272:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_272), 16, 16)) -> intp(2, 0, 33)
cpu_intr_2_297:
	setx	0x3f010f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_298:
	setx	0x3e0138, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_299:
	setx	0x3d0322, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_159:
	mov	0x6, %r14
	.word 0xf4db8e40  ! 3810: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_rd_160:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 3811: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_2_273:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_273), 16, 16)) -> intp(2, 0, b)
	.word 0xf085c020  ! 3815: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r24
cpu_intr_2_300:
	setx	0x3f010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf84dc000  ! 3818: LDSB_R	ldsb	[%r23 + %r0], %r28
iob_intr_2_274:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_274), 16, 16)) -> intp(2, 0, 19)
T2_asi_reg_wr_153:
	mov	0x34, %r14
	.word 0xf4f38400  ! 3822: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb844c000  ! 3823: ADDC_R	addc 	%r19, %r0, %r28
T2_asi_reg_rd_161:
	mov	0x2c, %r14
	.word 0xfcdb8e40  ! 3826: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf6044000  ! 3829: LDUW_R	lduw	[%r17 + %r0], %r27
	.word 0xf0dde09c  ! 3831: LDXA_I	ldxa	[%r23, + 0x009c] %asi, %r24
	.word 0xb4348000  ! 3833: SUBC_R	orn 	%r18, %r0, %r26
T2_asi_reg_rd_162:
	mov	0x36, %r14
	.word 0xf8db89e0  ! 3835: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_2_301:
	setx	0x3d023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44d4000  ! 3839: LDSB_R	ldsb	[%r21 + %r0], %r26
iob_intr_2_275:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_275), 16, 16)) -> intp(2, 0, 1b)
T2_asi_reg_rd_163:
	mov	0x3c6, %r14
	.word 0xf2db89e0  ! 3844: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_2_302:
	setx	0x3f0110, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_2_276:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_276), 16, 16)) -> intp(2, 0, 1d)
	.word 0xfa85c020  ! 3849: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r29
iob_intr_2_277:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_277), 16, 16)) -> intp(2, 0, 18)
T2_asi_reg_wr_154:
	mov	0x3c6, %r14
	.word 0xf8f38e40  ! 3857: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfe052089  ! 3858: LDUW_I	lduw	[%r20 + 0x0089], %r31
	.word 0xfcc50020  ! 3860: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r30
	.word 0xfa85c020  ! 3863: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r29
	.word 0xbb3d6001  ! 3866: SRA_I	sra 	%r21, 0x0001, %r29
	.word 0xb1343001  ! 3871: SRLX_I	srlx	%r16, 0x0001, %r24
T2_asi_reg_rd_164:
	mov	0x16, %r14
	.word 0xfcdb8e60  ! 3874: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf6d5a03e  ! 3875: LDSHA_I	ldsha	[%r22, + 0x003e] %asi, %r27
	.word 0xfad44020  ! 3877: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r29
	.word 0xf65cc000  ! 3878: LDX_R	ldx	[%r19 + %r0], %r27
iob_intr_2_278:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_278), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_wr_155:
	mov	0x3c1, %r14
	.word 0xf0f389e0  ! 3884: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T2_asi_reg_wr_156:
	mov	0x3c4, %r14
	.word 0xf0f38e40  ! 3885: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_rd_165:
	mov	0x24, %r14
	.word 0xf0db89e0  ! 3888: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf2c5c020  ! 3889: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r25
cpu_intr_2_303:
	setx	0x3f010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf885c020  ! 3894: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r28
T2_asi_reg_wr_157:
	mov	0x3c5, %r14
	.word 0xf0f384a0  ! 3896: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_2_304:
	setx	0x3e0030, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xbe9ce17a  ! 3903: XORcc_I	xorcc 	%r19, 0x017a, %r31
T2_asi_reg_wr_158:
	mov	0x21, %r14
	.word 0xf8f38400  ! 3906: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_2_279:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_279), 16, 16)) -> intp(2, 0, 0)
	.word 0xf0cc6003  ! 3911: LDSBA_I	ldsba	[%r17, + 0x0003] %asi, %r24
	.word 0xf80cc000  ! 3912: LDUB_R	ldub	[%r19 + %r0], %r28
iob_intr_2_280:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_280), 16, 16)) -> intp(2, 0, 12)
	.word 0xf284c020  ! 3914: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r25
	.word 0xb6a44000  ! 3915: SUBcc_R	subcc 	%r17, %r0, %r27
	.word 0xf404e099  ! 3916: LDUW_I	lduw	[%r19 + 0x0099], %r26
cpu_intr_2_305:
	setx	0x3e0028, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_159:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 3920: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb53df001  ! 3921: SRAX_I	srax	%r23, 0x0001, %r26
	.word 0xf0d5213a  ! 3923: LDSHA_I	ldsha	[%r20, + 0x013a] %asi, %r24
	.word 0xbc14c000  ! 3925: OR_R	or 	%r19, %r0, %r30
cpu_intr_2_306:
	setx	0x3f0024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4158000  ! 3928: LDUH_R	lduh	[%r22 + %r0], %r26
	ta	T_CHANGE_NONHPRIV
iob_intr_2_281:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_281), 16, 16)) -> intp(2, 0, 2a)
	.word 0xbaa40000  ! 3933: SUBcc_R	subcc 	%r16, %r0, %r29
	.word 0xf0542144  ! 3934: LDSH_I	ldsh	[%r16 + 0x0144], %r24
T2_asi_reg_rd_166:
	mov	0x7, %r14
	.word 0xf2db84a0  ! 3935: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xfad4c020  ! 3937: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r29
T2_asi_reg_wr_160:
	mov	0x1e, %r14
	.word 0xf2f38e60  ! 3938: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_2_282:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_282), 16, 16)) -> intp(2, 0, 12)
	.word 0xb77c8400  ! 3941: MOVR_R	movre	%r18, %r0, %r27
cpu_intr_2_307:
	setx	0x3d0133, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_308:
	setx	0x3e0109, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_309:
	setx	0x3f0030, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_283:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_283), 16, 16)) -> intp(2, 0, 15)
	.word 0xf84d60d5  ! 3947: LDSB_I	ldsb	[%r21 + 0x00d5], %r28
T2_asi_reg_rd_167:
	mov	0x0, %r14
	.word 0xfedb8e60  ! 3951: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf0d5a190  ! 3953: LDSHA_I	ldsha	[%r22, + 0x0190] %asi, %r24
cpu_intr_2_310:
	setx	0x3e030f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_284:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_284), 16, 16)) -> intp(2, 0, 1)
iob_intr_2_285:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_285), 16, 16)) -> intp(2, 0, 21)
iob_intr_2_286:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_286), 16, 16)) -> intp(2, 0, 31)
cpu_intr_2_311:
	setx	0x3f0111, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_168:
	mov	0x3c4, %r14
	.word 0xf8db8e80  ! 3968: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_2_287:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_287), 16, 16)) -> intp(2, 0, 2d)
T2_asi_reg_wr_161:
	mov	0x36, %r14
	.word 0xf0f38e40  ! 3976: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_wr_162:
	mov	0x17, %r14
	.word 0xfcf384a0  ! 3981: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfc44e1a0  ! 3983: LDSW_I	ldsw	[%r19 + 0x01a0], %r30
cpu_intr_2_312:
	setx	0x3f0317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_313:
	setx	0x2000b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_288:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_288), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_wr_163:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 3992: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_289:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_289), 16, 16)) -> intp(2, 0, 2d)
	.word 0xb5641800  ! 3996: MOVcc_R	<illegal instruction>
T2_asi_reg_rd_169:
	mov	0x3c8, %r14
	.word 0xf8db89e0  ! 3997: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
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
cpu_intr_2_314:
	setx	0x3e013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba44c000  ! 4004: ADDC_R	addc 	%r19, %r0, %r29
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983c0a  ! 4005: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c0a, %hpstate
	.word 0xf64d0000  ! 4006: LDSB_R	ldsb	[%r20 + %r0], %r27
	.word 0xf2546147  ! 4008: LDSH_I	ldsh	[%r17 + 0x0147], %r25
iob_intr_2_290:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_290), 16, 16)) -> intp(2, 0, 3e)
cpu_intr_2_315:
	setx	0x3c0122, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_316:
	setx	0x3c0234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf485a14f  ! 4018: LDUWA_I	lduwa	[%r22, + 0x014f] %asi, %r26
cpu_intr_2_317:
	setx	0x3e011e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_164:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 4020: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_318:
	setx	0x3f0122, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_291:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_291), 16, 16)) -> intp(2, 0, 2a)
	ta	T_CHANGE_NONHPRIV
	.word 0xf6dd20fb  ! 4028: LDXA_I	ldxa	[%r20, + 0x00fb] %asi, %r27
iob_intr_2_292:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_292), 16, 16)) -> intp(2, 0, 10)
cpu_intr_2_319:
	setx	0x3d0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b44000  ! 4037: ORNcc_R	orncc 	%r17, %r0, %r28
T2_asi_reg_wr_165:
	mov	0x13, %r14
	.word 0xf6f38400  ! 4038: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf2944020  ! 4045: LDUHA_R	lduha	[%r17, %r0] 0x01, %r25
cpu_intr_2_320:
	setx	0x3e013a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_321:
	setx	0x3d0131, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_293:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_293), 16, 16)) -> intp(2, 0, 6)
	.word 0xf2048000  ! 4059: LDUW_R	lduw	[%r18 + %r0], %r25
	ta	T_CHANGE_TO_TL0
iob_intr_2_294:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_294), 16, 16)) -> intp(2, 0, 8)
cpu_intr_2_322:
	setx	0x3c0201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6058000  ! 4070: LDUW_R	lduw	[%r22 + %r0], %r27
cpu_intr_2_323:
	setx	0x3d000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf68d4020  ! 4078: LDUBA_R	lduba	[%r21, %r0] 0x01, %r27
T2_asi_reg_wr_166:
	mov	0x1, %r14
	.word 0xf8f38e80  ! 4079: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_2_324:
	setx	0x3f0231, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_167:
	mov	0x1a, %r14
	.word 0xf0f384a0  ! 4084: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf8848020  ! 4087: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r28
iob_intr_2_295:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_295), 16, 16)) -> intp(2, 0, 20)
T2_asi_reg_wr_168:
	mov	0x3c7, %r14
	.word 0xf8f38400  ! 4095: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_2_296:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_296), 16, 16)) -> intp(2, 0, 10)
cpu_intr_2_325:
	setx	0x3d0233, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_297:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_297), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_rd_170:
	mov	0x3c2, %r14
	.word 0xf4db8400  ! 4100: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf2d40020  ! 4102: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r25
	.word 0xfc45a032  ! 4103: LDSW_I	ldsw	[%r22 + 0x0032], %r30
	.word 0xb23d0000  ! 4105: XNOR_R	xnor 	%r20, %r0, %r25
	ta	T_CHANGE_TO_TL0
	.word 0xfe554000  ! 4107: LDSH_R	ldsh	[%r21 + %r0], %r31
T2_asi_reg_wr_169:
	mov	0x22, %r14
	.word 0xf4f38e40  ! 4108: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfe15204f  ! 4112: LDUH_I	lduh	[%r20 + 0x004f], %r31
T2_asi_reg_rd_171:
	mov	0x16, %r14
	.word 0xf2db8e40  ! 4114: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf494c020  ! 4115: LDUHA_R	lduha	[%r19, %r0] 0x01, %r26
	.word 0xf4d50020  ! 4119: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r26
	.word 0xfc5da0bd  ! 4120: LDX_I	ldx	[%r22 + 0x00bd], %r30
	.word 0xf40d8000  ! 4121: LDUB_R	ldub	[%r22 + %r0], %r26
	.word 0xb5345000  ! 4122: SRLX_R	srlx	%r17, %r0, %r26
	ta	T_CHANGE_TO_TL0
	.word 0xf68ca0c0  ! 4125: LDUBA_I	lduba	[%r18, + 0x00c0] %asi, %r27
iob_intr_2_298:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_298), 16, 16)) -> intp(2, 0, 1e)
	.word 0xb045e071  ! 4129: ADDC_I	addc 	%r23, 0x0071, %r24
T2_asi_reg_wr_170:
	mov	0x0, %r14
	.word 0xf4f384a0  ! 4134: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983898  ! 4135: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1898, %hpstate
T2_asi_reg_rd_172:
	mov	0x3c5, %r14
	.word 0xf0db8400  ! 4136: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xfc84218f  ! 4138: LDUWA_I	lduwa	[%r16, + 0x018f] %asi, %r30
iob_intr_2_299:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_299), 16, 16)) -> intp(2, 0, 11)
T2_asi_reg_rd_173:
	mov	0x3c5, %r14
	.word 0xf8db8e80  ! 4142: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T2_asi_reg_wr_171:
	mov	0x1f, %r14
	.word 0xfef38400  ! 4145: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL1
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983b1a  ! 4148: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b1a, %hpstate
	.word 0xf0942148  ! 4149: LDUHA_I	lduha	[%r16, + 0x0148] %asi, %r24
	.word 0xb6b44000  ! 4151: ORNcc_R	orncc 	%r17, %r0, %r27
	.word 0xfa454000  ! 4152: LDSW_R	ldsw	[%r21 + %r0], %r29
T2_asi_reg_wr_172:
	mov	0x37, %r14
	.word 0xfef38e80  ! 4153: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T2_asi_reg_rd_174:
	mov	0x3c0, %r14
	.word 0xf8db8e40  ! 4154: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf0444000  ! 4155: LDSW_R	ldsw	[%r17 + %r0], %r24
	.word 0xb8c4c000  ! 4156: ADDCcc_R	addccc 	%r19, %r0, %r28
T2_asi_reg_rd_175:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 4159: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_TO_TL0
	.word 0xfe454000  ! 4163: LDSW_R	ldsw	[%r21 + %r0], %r31
T2_asi_reg_wr_173:
	mov	0x2f, %r14
	.word 0xf4f38e80  ! 4165: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb1354000  ! 4167: SRL_R	srl 	%r21, %r0, %r24
	.word 0xfe5ce076  ! 4168: LDX_I	ldx	[%r19 + 0x0076], %r31
iob_intr_2_300:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_300), 16, 16)) -> intp(2, 0, e)
	.word 0xfc14a0f4  ! 4170: LDUH_I	lduh	[%r18 + 0x00f4], %r30
cpu_intr_2_326:
	setx	0x430006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc050000  ! 4174: LDUW_R	lduw	[%r20 + %r0], %r30
iob_intr_2_301:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_301), 16, 16)) -> intp(2, 0, 1f)
cpu_intr_2_327:
	setx	0x400119, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_176:
	mov	0x3c3, %r14
	.word 0xf0db8e80  ! 4180: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T2_asi_reg_wr_174:
	mov	0x12, %r14
	.word 0xf4f38400  ! 4183: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_328:
	setx	0x41013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8540000  ! 4189: LDSH_R	ldsh	[%r16 + %r0], %r28
iob_intr_2_302:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_302), 16, 16)) -> intp(2, 0, 17)
	.word 0xf0158000  ! 4197: LDUH_R	lduh	[%r22 + %r0], %r24
cpu_intr_2_329:
	setx	0x400225, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_175:
	mov	0x19, %r14
	.word 0xfcf389e0  ! 4199: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_2_303:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_303), 16, 16)) -> intp(2, 0, 29)
cpu_intr_2_330:
	setx	0x42033d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_177:
	mov	0x3c0, %r14
	.word 0xf2db8e40  ! 4202: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_TO_TL1
	.word 0xfc0ce18c  ! 4209: LDUB_I	ldub	[%r19 + 0x018c], %r30
	.word 0xf08cc020  ! 4211: LDUBA_R	lduba	[%r19, %r0] 0x01, %r24
T2_asi_reg_rd_178:
	mov	0x1b, %r14
	.word 0xfadb8e40  ! 4212: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb83d0000  ! 4213: XNOR_R	xnor 	%r20, %r0, %r28
	.word 0xfe15e056  ! 4214: LDUH_I	lduh	[%r23 + 0x0056], %r31
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_176:
	mov	0x3c6, %r14
	.word 0xfcf38e60  ! 4218: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf6944020  ! 4219: LDUHA_R	lduha	[%r17, %r0] 0x01, %r27
T2_asi_reg_wr_177:
	mov	0x3, %r14
	.word 0xf8f38e40  ! 4223: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb6c4c000  ! 4230: ADDCcc_R	addccc 	%r19, %r0, %r27
iob_intr_2_304:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_304), 16, 16)) -> intp(2, 0, 1d)
T2_asi_reg_wr_178:
	mov	0x3c6, %r14
	.word 0xf4f38e60  ! 4235: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf8cde154  ! 4246: LDSBA_I	ldsba	[%r23, + 0x0154] %asi, %r28
T2_asi_reg_rd_179:
	mov	0x29, %r14
	.word 0xf4db8e80  ! 4247: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb52d2001  ! 4253: SLL_I	sll 	%r20, 0x0001, %r26
	.word 0xfed4201c  ! 4255: LDSHA_I	ldsha	[%r16, + 0x001c] %asi, %r31
	ta	T_CHANGE_TO_TL0
	.word 0xb8b54000  ! 4259: SUBCcc_R	orncc 	%r21, %r0, %r28
iob_intr_2_305:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_305), 16, 16)) -> intp(2, 0, 1e)
cpu_intr_2_331:
	setx	0x430315, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_180:
	mov	0x3c5, %r14
	.word 0xf6db89e0  ! 4267: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_2_306:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_306), 16, 16)) -> intp(2, 0, 7)
T2_asi_reg_rd_181:
	mov	0x2, %r14
	.word 0xf2db8e40  ! 4272: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_2_332:
	setx	0x42002e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_307:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_307), 16, 16)) -> intp(2, 0, 32)
iob_intr_2_308:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_308), 16, 16)) -> intp(2, 0, 16)
	.word 0xfc5d4000  ! 4278: LDX_R	ldx	[%r21 + %r0], %r30
T2_asi_reg_wr_179:
	mov	0x3c4, %r14
	.word 0xfef38e40  ! 4279: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_309:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_309), 16, 16)) -> intp(2, 0, 4)
cpu_intr_2_333:
	setx	0x400125, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_2_310:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_310), 16, 16)) -> intp(2, 0, 27)
cpu_intr_2_334:
	setx	0x420015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4ca081  ! 4292: LDSB_I	ldsb	[%r18 + 0x0081], %r29
T2_asi_reg_rd_182:
	mov	0x3c5, %r14
	.word 0xfadb8e40  ! 4294: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfec4c020  ! 4297: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r31
	.word 0xba848000  ! 4298: ADDcc_R	addcc 	%r18, %r0, %r29
cpu_intr_2_335:
	setx	0x41032a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_311:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_311), 16, 16)) -> intp(2, 0, 8)
T2_asi_reg_rd_183:
	mov	0x12, %r14
	.word 0xf4db84a0  ! 4303: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf0d5e045  ! 4304: LDSHA_I	ldsha	[%r23, + 0x0045] %asi, %r24
	.word 0xbab58000  ! 4305: SUBCcc_R	orncc 	%r22, %r0, %r29
	.word 0xfad46186  ! 4307: LDSHA_I	ldsha	[%r17, + 0x0186] %asi, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4048000  ! 4311: LDUW_R	lduw	[%r18 + %r0], %r26
T2_asi_reg_rd_184:
	mov	0x13, %r14
	.word 0xf2db8400  ! 4314: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xfe956156  ! 4318: LDUHA_I	lduha	[%r21, + 0x0156] %asi, %r31
	.word 0xfa4d20f9  ! 4325: LDSB_I	ldsb	[%r20 + 0x00f9], %r29
	.word 0xba45219c  ! 4327: ADDC_I	addc 	%r20, 0x019c, %r29
	.word 0xf805a02b  ! 4330: LDUW_I	lduw	[%r22 + 0x002b], %r28
T2_asi_reg_wr_180:
	mov	0x1a, %r14
	.word 0xfef38e80  ! 4332: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_2_336:
	setx	0x400328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6cdc020  ! 4336: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r27
	.word 0xb02c0000  ! 4337: ANDN_R	andn 	%r16, %r0, %r24
T2_asi_reg_wr_181:
	mov	0x3c6, %r14
	.word 0xfef38e80  ! 4338: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T2_asi_reg_wr_182:
	mov	0x3c7, %r14
	.word 0xf6f38e80  ! 4339: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf0cc4020  ! 4340: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r24
iob_intr_2_312:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_312), 16, 16)) -> intp(2, 0, 8)
iob_intr_2_313:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_313), 16, 16)) -> intp(2, 0, 2)
iob_intr_2_314:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_314), 16, 16)) -> intp(2, 0, 3b)
cpu_intr_2_337:
	setx	0x410007, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_315:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_315), 16, 16)) -> intp(2, 0, 25)
	.word 0xf8cce059  ! 4349: LDSBA_I	ldsba	[%r19, + 0x0059] %asi, %r28
	.word 0xf2d4c020  ! 4350: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r25
	.word 0xf005e067  ! 4351: LDUW_I	lduw	[%r23 + 0x0067], %r24
cpu_intr_2_338:
	setx	0x400328, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_316:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_316), 16, 16)) -> intp(2, 0, 19)
	.word 0xf85c2183  ! 4358: LDX_I	ldx	[%r16 + 0x0183], %r28
	.word 0xfa1460d2  ! 4359: LDUH_I	lduh	[%r17 + 0x00d2], %r29
cpu_intr_2_339:
	setx	0x400038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_317:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_317), 16, 16)) -> intp(2, 0, 21)
	.word 0xb53ce001  ! 4369: SRA_I	sra 	%r19, 0x0001, %r26
	.word 0xfc140000  ! 4370: LDUH_R	lduh	[%r16 + %r0], %r30
iob_intr_2_318:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_318), 16, 16)) -> intp(2, 0, 27)
	.word 0xf294e11e  ! 4378: LDUHA_I	lduha	[%r19, + 0x011e] %asi, %r25
cpu_intr_2_340:
	setx	0x430032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb343001  ! 4381: SRLX_I	srlx	%r16, 0x0001, %r29
T2_asi_reg_wr_183:
	mov	0x21, %r14
	.word 0xf8f38400  ! 4383: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_2_319:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_319), 16, 16)) -> intp(2, 0, 25)
	.word 0xf65ca130  ! 4385: LDX_I	ldx	[%r18 + 0x0130], %r27
T2_asi_reg_rd_185:
	mov	0x3c6, %r14
	.word 0xf0db8e60  ! 4386: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xfe150000  ! 4387: LDUH_R	lduh	[%r20 + %r0], %r31
	.word 0xf25d0000  ! 4389: LDX_R	ldx	[%r20 + %r0], %r25
	setx	data_start_0, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982900  ! 4391: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0900, %hpstate
	.word 0xfe0c0000  ! 4392: LDUB_R	ldub	[%r16 + %r0], %r31
cpu_intr_2_341:
	setx	0x430022, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_184:
	mov	0x3c3, %r14
	.word 0xfaf38e40  ! 4397: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb12d1000  ! 4400: SLLX_R	sllx	%r20, %r0, %r24
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc55209e  ! 4408: LDSH_I	ldsh	[%r20 + 0x009e], %r30
iob_intr_2_320:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_320), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf08d21f7  ! 4411: LDUBA_I	lduba	[%r20, + 0x01f7] %asi, %r24
	.word 0xb4ac4000  ! 4412: ANDNcc_R	andncc 	%r17, %r0, %r26
T2_asi_reg_rd_186:
	mov	0x19, %r14
	.word 0xf8db8e80  ! 4413: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T2_asi_reg_rd_187:
	mov	0x35, %r14
	.word 0xfcdb8e40  ! 4414: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_2_342:
	setx	0x420306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45c0000  ! 4421: LDX_R	ldx	[%r16 + %r0], %r26
cpu_intr_2_343:
	setx	0x400123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf28461e5  ! 4424: LDUWA_I	lduwa	[%r17, + 0x01e5] %asi, %r25
	.word 0xb12de001  ! 4426: SLL_I	sll 	%r23, 0x0001, %r24
T2_asi_reg_wr_185:
	mov	0x23, %r14
	.word 0xfaf389e0  ! 4429: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf88da1b2  ! 4432: LDUBA_I	lduba	[%r22, + 0x01b2] %asi, %r28
	.word 0xf815e07e  ! 4434: LDUH_I	lduh	[%r23 + 0x007e], %r28
cpu_intr_2_344:
	setx	0x410336, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_345:
	setx	0x43003b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_346:
	setx	0x420221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8d61a8  ! 4441: LDUBA_I	lduba	[%r21, + 0x01a8] %asi, %r31
cpu_intr_2_347:
	setx	0x41030e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_321:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_321), 16, 16)) -> intp(2, 0, 34)
	.word 0xf24ce18a  ! 4446: LDSB_I	ldsb	[%r19 + 0x018a], %r25
cpu_intr_2_348:
	setx	0x420122, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_188:
	mov	0x3c8, %r14
	.word 0xfcdb89e0  ! 4448: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_2_322:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_322), 16, 16)) -> intp(2, 0, 7)
iob_intr_2_323:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_323), 16, 16)) -> intp(2, 0, 4)
cpu_intr_2_349:
	setx	0x420126, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_324:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_324), 16, 16)) -> intp(2, 0, 27)
	.word 0xb8046145  ! 4458: ADD_I	add 	%r17, 0x0145, %r28
	.word 0xfc4460be  ! 4459: LDSW_I	ldsw	[%r17 + 0x00be], %r30
	.word 0xf644c000  ! 4460: LDSW_R	ldsw	[%r19 + %r0], %r27
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_189:
	mov	0x21, %r14
	.word 0xf6db8e40  ! 4463: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf45d211d  ! 4464: LDX_I	ldx	[%r20 + 0x011d], %r26
cpu_intr_2_350:
	setx	0x430327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf80d8000  ! 4474: LDUB_R	ldub	[%r22 + %r0], %r28
	.word 0xf8040000  ! 4476: LDUW_R	lduw	[%r16 + %r0], %r28
iob_intr_2_325:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_325), 16, 16)) -> intp(2, 0, 1d)
T2_asi_reg_rd_190:
	mov	0x13, %r14
	.word 0xf2db8e60  ! 4479: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf404a143  ! 4480: LDUW_I	lduw	[%r18 + 0x0143], %r26
iob_intr_2_326:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_326), 16, 16)) -> intp(2, 0, 6)
T2_asi_reg_rd_191:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 4486: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_wr_186:
	mov	0x2b, %r14
	.word 0xf8f38e40  ! 4488: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf0540000  ! 4491: LDSH_R	ldsh	[%r16 + %r0], %r24
	.word 0xf4d5a112  ! 4492: LDSHA_I	ldsha	[%r22, + 0x0112] %asi, %r26
	ta	T_CHANGE_TO_TL1
cpu_intr_2_351:
	setx	0x42033b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_192:
	mov	0x2e, %r14
	.word 0xfadb84a0  ! 4498: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_2_327:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_327), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf2158000  ! 4502: LDUH_R	lduh	[%r22 + %r0], %r25
iob_intr_2_328:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_328), 16, 16)) -> intp(2, 0, 1d)
T2_asi_reg_wr_187:
	mov	0x3c0, %r14
	.word 0xf0f38e80  ! 4509: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_2_352:
	setx	0x400026, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_193:
	mov	0x17, %r14
	.word 0xf8db8e40  ! 4512: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T2_asi_reg_rd_194:
	mov	0x2f, %r14
	.word 0xfadb8e40  ! 4513: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_2_329:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_329), 16, 16)) -> intp(2, 0, 1e)
cpu_intr_2_353:
	setx	0x43011c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_330:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_330), 16, 16)) -> intp(2, 0, 16)
T2_asi_reg_wr_188:
	mov	0x3c5, %r14
	.word 0xf8f384a0  ! 4517: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xfa55c000  ! 4518: LDSH_R	ldsh	[%r23 + %r0], %r29
	.word 0xfc0de17e  ! 4519: LDUB_I	ldub	[%r23 + 0x017e], %r30
T2_asi_reg_rd_195:
	mov	0x16, %r14
	.word 0xfadb8e40  ! 4520: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_2_331:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_331), 16, 16)) -> intp(2, 0, 39)
	.word 0xb28c8000  ! 4526: ANDcc_R	andcc 	%r18, %r0, %r25
iob_intr_2_332:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_332), 16, 16)) -> intp(2, 0, 2)
	.word 0xb5641800  ! 4532: MOVcc_R	<illegal instruction>
cpu_intr_2_354:
	setx	0x42021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc5ca15f  ! 4534: LDX_I	ldx	[%r18 + 0x015f], %r30
cpu_intr_2_355:
	setx	0x400133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25d0000  ! 4536: LDX_R	ldx	[%r20 + %r0], %r25
T2_asi_reg_rd_196:
	mov	0x3c1, %r14
	.word 0xfedb8400  ! 4539: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xfcdc60a7  ! 4540: LDXA_I	ldxa	[%r17, + 0x00a7] %asi, %r30
cpu_intr_2_356:
	setx	0x400310, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_2_333:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_333), 16, 16)) -> intp(2, 0, 22)
T2_asi_reg_rd_197:
	mov	0x3c2, %r14
	.word 0xf6db8e60  ! 4550: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf8d560fa  ! 4553: LDSHA_I	ldsha	[%r21, + 0x00fa] %asi, %r28
cpu_intr_2_357:
	setx	0x400322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_358:
	setx	0x420222, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_359:
	setx	0x430235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd508000  ! 4561: RDPR_TSTATE	<illegal instruction>
cpu_intr_2_360:
	setx	0x41011e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_334:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_334), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_wr_189:
	mov	0x1d, %r14
	.word 0xfaf384a0  ! 4567: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T2_asi_reg_rd_198:
	mov	0x3, %r14
	.word 0xf8db8e60  ! 4568: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_2_335:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_335), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf80520ff  ! 4571: LDUW_I	lduw	[%r20 + 0x00ff], %r28
	.word 0xfad50020  ! 4573: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r29
T2_asi_reg_wr_190:
	mov	0x33, %r14
	.word 0xf8f38e80  ! 4578: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_199:
	mov	0x19, %r14
	.word 0xf6db84a0  ! 4585: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_2_336:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_336), 16, 16)) -> intp(2, 0, 38)
T2_asi_reg_wr_191:
	mov	0xb, %r14
	.word 0xf2f38e60  ! 4588: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xfe8d2022  ! 4591: LDUBA_I	lduba	[%r20, + 0x0022] %asi, %r31
cpu_intr_2_361:
	setx	0x420117, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_192:
	mov	0x4, %r14
	.word 0xf4f38e60  ! 4598: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	.word 0xb9540000  ! 4600: RDPR_GL	rdpr	%-, %r28
iob_intr_2_337:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_337), 16, 16)) -> intp(2, 0, 17)
	.word 0xf2c520be  ! 4604: LDSWA_I	ldswa	[%r20, + 0x00be] %asi, %r25
cpu_intr_2_362:
	setx	0x410038, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xb23ce04e  ! 4611: XNOR_I	xnor 	%r19, 0x004e, %r25
	.word 0xfe4d0000  ! 4612: LDSB_R	ldsb	[%r20 + %r0], %r31
	.word 0xf88da0e8  ! 4616: LDUBA_I	lduba	[%r22, + 0x00e8] %asi, %r28
	.word 0xfe050000  ! 4617: LDUW_R	lduw	[%r20 + %r0], %r31
T2_asi_reg_wr_193:
	mov	0x3c8, %r14
	.word 0xf6f38e60  ! 4619: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_2_363:
	setx	0x440038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_338:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_338), 16, 16)) -> intp(2, 0, 28)
cpu_intr_2_364:
	setx	0x460029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfac44020  ! 4623: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r29
iob_intr_2_339:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_339), 16, 16)) -> intp(2, 0, 28)
T2_asi_reg_wr_194:
	mov	0x3c7, %r14
	.word 0xf8f38e60  ! 4625: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T2_asi_reg_rd_200:
	mov	0x25, %r14
	.word 0xf8db89e0  ! 4627: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	ta	T_CHANGE_HPRIV
	.word 0xf4c5c020  ! 4630: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r26
	.word 0xfe454000  ! 4631: LDSW_R	ldsw	[%r21 + %r0], %r31
iob_intr_2_340:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_340), 16, 16)) -> intp(2, 0, 33)
	ta	T_CHANGE_TO_TL0
iob_intr_2_341:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_341), 16, 16)) -> intp(2, 0, 6)
	.word 0xb22d0000  ! 4636: ANDN_R	andn 	%r20, %r0, %r25
iob_intr_2_342:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_342), 16, 16)) -> intp(2, 0, a)
iob_intr_2_343:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_343), 16, 16)) -> intp(2, 0, 1b)
	.word 0xb32c2001  ! 4639: SLL_I	sll 	%r16, 0x0001, %r25
	.word 0x8395a0ee  ! 4640: WRPR_TNPC_I	wrpr	%r22, 0x00ee, %tnpc
	.word 0xf20560d4  ! 4641: LDUW_I	lduw	[%r21 + 0x00d4], %r25
	.word 0xb8a5a174  ! 4642: SUBcc_I	subcc 	%r22, 0x0174, %r28
cpu_intr_2_365:
	setx	0x460209, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_195:
	mov	0x34, %r14
	.word 0xf2f389e0  ! 4645: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T2_asi_reg_rd_201:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 4646: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb73c1000  ! 4649: SRAX_R	srax	%r16, %r0, %r27
	.word 0xf2554000  ! 4651: LDSH_R	ldsh	[%r21 + %r0], %r25
	.word 0xfa8c8020  ! 4653: LDUBA_R	lduba	[%r18, %r0] 0x01, %r29
iob_intr_2_344:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_344), 16, 16)) -> intp(2, 0, 1a)
	.word 0xfec5c020  ! 4659: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r31
	.word 0xbb7da401  ! 4660: MOVR_I	movre	%r22, 0x1, %r29
iob_intr_2_345:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_345), 16, 16)) -> intp(2, 0, 37)
T2_asi_reg_rd_202:
	mov	0x3c3, %r14
	.word 0xf8db8e60  ! 4662: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_2_346:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_346), 16, 16)) -> intp(2, 0, 4)
	.word 0xf8948020  ! 4670: LDUHA_R	lduha	[%r18, %r0] 0x01, %r28
T2_asi_reg_wr_196:
	mov	0x23, %r14
	.word 0xf0f384a0  ! 4674: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T2_asi_reg_wr_197:
	mov	0x3c5, %r14
	.word 0xf0f38e40  ! 4676: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfa8ca0ac  ! 4682: LDUBA_I	lduba	[%r18, + 0x00ac] %asi, %r29
	.word 0xf25d6132  ! 4686: LDX_I	ldx	[%r21 + 0x0132], %r25
T2_asi_reg_wr_198:
	mov	0x3c7, %r14
	.word 0xf4f38e60  ! 4687: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T2_asi_reg_rd_203:
	mov	0x3c3, %r14
	.word 0xf4db8400  ! 4689: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_2_347:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_347), 16, 16)) -> intp(2, 0, 29)
	.word 0x8595a06a  ! 4694: WRPR_TSTATE_I	wrpr	%r22, 0x006a, %tstate
cpu_intr_2_366:
	setx	0x470035, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_204:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 4696: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_2_367:
	setx	0x460314, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_199:
	mov	0xa, %r14
	.word 0xfef38e80  ! 4698: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xba0d6173  ! 4699: AND_I	and 	%r21, 0x0173, %r29
	.word 0xfa948020  ! 4701: LDUHA_R	lduha	[%r18, %r0] 0x01, %r29
T2_asi_reg_rd_205:
	mov	0x37, %r14
	.word 0xf6db8400  ! 4703: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_2_368:
	setx	0x450021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4d40020  ! 4710: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r26
	.word 0xfa45e02c  ! 4712: LDSW_I	ldsw	[%r23 + 0x002c], %r29
	.word 0xf24c605c  ! 4713: LDSB_I	ldsb	[%r17 + 0x005c], %r25
T2_asi_reg_wr_200:
	mov	0x8, %r14
	.word 0xf0f384a0  ! 4714: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xfc15a198  ! 4716: LDUH_I	lduh	[%r22 + 0x0198], %r30
cpu_intr_2_369:
	setx	0x450313, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_201:
	mov	0x20, %r14
	.word 0xf6f38e60  ! 4718: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_2_370:
	setx	0x47032b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_371:
	setx	0x470108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44ce103  ! 4724: LDSB_I	ldsb	[%r19 + 0x0103], %r26
iob_intr_2_348:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_348), 16, 16)) -> intp(2, 0, f)
	.word 0xb8348000  ! 4728: ORN_R	orn 	%r18, %r0, %r28
T2_asi_reg_rd_206:
	mov	0x1d, %r14
	.word 0xf4db8e80  ! 4730: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xf0048000  ! 4731: LDUW_R	lduw	[%r18 + %r0], %r24
T2_asi_reg_rd_207:
	mov	0x0, %r14
	.word 0xfadb8e40  ! 4732: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982f0a  ! 4743: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0a, %hpstate
	.word 0xfa85e0eb  ! 4748: LDUWA_I	lduwa	[%r23, + 0x00eb] %asi, %r29
T2_asi_reg_wr_202:
	mov	0x8, %r14
	.word 0xfcf38e80  ! 4751: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T2_asi_reg_rd_208:
	mov	0x37, %r14
	.word 0xfcdb8e40  ! 4752: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_wr_203:
	mov	0x35, %r14
	.word 0xfcf38e40  ! 4755: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_wr_204:
	mov	0x3c8, %r14
	.word 0xf4f389e0  ! 4756: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_2_372:
	setx	0x450211, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_209:
	mov	0x3c3, %r14
	.word 0xf6db8400  ! 4758: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xfa55a06c  ! 4761: LDSH_I	ldsh	[%r22 + 0x006c], %r29
T2_asi_reg_wr_205:
	mov	0x3c5, %r14
	.word 0xfcf38400  ! 4764: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xf24c8000  ! 4765: LDSB_R	ldsb	[%r18 + %r0], %r25
iob_intr_2_349:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_349), 16, 16)) -> intp(2, 0, 34)
T2_asi_reg_rd_210:
	mov	0x2, %r14
	.word 0xf0db8e40  ! 4768: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_373:
	setx	0x440313, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_374:
	setx	0x440334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec4a0b5  ! 4773: LDSWA_I	ldswa	[%r18, + 0x00b5] %asi, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf65c8000  ! 4779: LDX_R	ldx	[%r18 + %r0], %r27
T2_asi_reg_wr_206:
	mov	0x12, %r14
	.word 0xf2f38e60  ! 4781: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_2_375:
	setx	0x46012f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_211:
	mov	0x34, %r14
	.word 0xf6db89e0  ! 4790: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T2_asi_reg_rd_212:
	mov	0x37, %r14
	.word 0xfcdb8400  ! 4791: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf65c20e6  ! 4793: LDX_I	ldx	[%r16 + 0x00e6], %r27
cpu_intr_2_376:
	setx	0x47030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_207:
	mov	0x3c3, %r14
	.word 0xf2f38e80  ! 4797: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T2_asi_reg_rd_213:
	mov	0x2, %r14
	.word 0xf4db8e80  ! 4798: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb23c4000  ! 4799: XNOR_R	xnor 	%r17, %r0, %r25
iob_intr_2_350:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_350), 16, 16)) -> intp(2, 0, 3f)
	.word 0xfc15e1fd  ! 4801: LDUH_I	lduh	[%r23 + 0x01fd], %r30
	.word 0xf8450000  ! 4802: LDSW_R	ldsw	[%r20 + %r0], %r28
iob_intr_2_351:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_351), 16, 16)) -> intp(2, 0, 3d)
	.word 0xfa8520a1  ! 4806: LDUWA_I	lduwa	[%r20, + 0x00a1] %asi, %r29
	.word 0xb0042137  ! 4808: ADD_I	add 	%r16, 0x0137, %r24
iob_intr_2_352:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_352), 16, 16)) -> intp(2, 0, 7)
	.word 0xfa454000  ! 4810: LDSW_R	ldsw	[%r21 + %r0], %r29
	.word 0xf815e1e2  ! 4811: LDUH_I	lduh	[%r23 + 0x01e2], %r28
T2_asi_reg_wr_208:
	mov	0x21, %r14
	.word 0xf6f38400  ! 4812: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_2_353:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_353), 16, 16)) -> intp(2, 0, 1a)
	.word 0xb2846054  ! 4817: ADDcc_I	addcc 	%r17, 0x0054, %r25
T2_asi_reg_wr_209:
	mov	0x25, %r14
	.word 0xf4f38e80  ! 4818: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xfad44020  ! 4820: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r29
iob_intr_2_354:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_354), 16, 16)) -> intp(2, 0, 1f)
	.word 0xfecca112  ! 4825: LDSBA_I	ldsba	[%r18, + 0x0112] %asi, %r31
T2_asi_reg_wr_210:
	mov	0x18, %r14
	.word 0xf2f38400  ! 4828: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T2_asi_reg_rd_214:
	mov	0x2d, %r14
	.word 0xf2db8e40  ! 4829: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf84ce088  ! 4832: LDSB_I	ldsb	[%r19 + 0x0088], %r28
iob_intr_2_355:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_355), 16, 16)) -> intp(2, 0, d)
cpu_intr_2_377:
	setx	0x46002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_356:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_356), 16, 16)) -> intp(2, 0, 26)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_378:
	setx	0x45033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_357:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_357), 16, 16)) -> intp(2, 0, 14)
	.word 0xb150c000  ! 4854: RDPR_TT	<illegal instruction>
	.word 0xfcd50020  ! 4855: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r30
cpu_intr_2_379:
	setx	0x47012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b50000  ! 4858: SUBCcc_R	orncc 	%r20, %r0, %r28
iob_intr_2_358:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_358), 16, 16)) -> intp(2, 0, 3a)
	.word 0xfe8d8020  ! 4860: LDUBA_R	lduba	[%r22, %r0] 0x01, %r31
iob_intr_2_359:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_359), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_wr_211:
	mov	0xe, %r14
	.word 0xf0f389e0  ! 4864: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T2_asi_reg_wr_212:
	mov	0x3c2, %r14
	.word 0xfaf389e0  ! 4866: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T2_asi_reg_wr_213:
	mov	0xe, %r14
	.word 0xfef384a0  ! 4867: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_2_360:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_360), 16, 16)) -> intp(2, 0, 28)
iob_intr_2_361:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_361), 16, 16)) -> intp(2, 0, d)
cpu_intr_2_380:
	setx	0x45021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf28c6043  ! 4874: LDUBA_I	lduba	[%r17, + 0x0043] %asi, %r25
	.word 0xf64d60ff  ! 4876: LDSB_I	ldsb	[%r21 + 0x00ff], %r27
cpu_intr_2_381:
	setx	0x47022e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_382:
	setx	0x47001b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_383:
	setx	0x450205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0cde065  ! 4895: LDSBA_I	ldsba	[%r23, + 0x0065] %asi, %r24
iob_intr_2_362:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_362), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_rd_215:
	mov	0x2a, %r14
	.word 0xfadb8e40  ! 4897: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfcc4a0f6  ! 4899: LDSWA_I	ldswa	[%r18, + 0x00f6] %asi, %r30
	.word 0xf205e12f  ! 4901: LDUW_I	lduw	[%r23 + 0x012f], %r25
iob_intr_2_363:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_363), 16, 16)) -> intp(2, 0, 6)
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982f48  ! 4906: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f48, %hpstate
	.word 0xf29521fe  ! 4907: LDUHA_I	lduha	[%r20, + 0x01fe] %asi, %r25
	.word 0xba854000  ! 4914: ADDcc_R	addcc 	%r21, %r0, %r29
	.word 0xb01c0000  ! 4917: XOR_R	xor 	%r16, %r0, %r24
T2_asi_reg_rd_216:
	mov	0x27, %r14
	.word 0xf6db8e80  ! 4921: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf2cc20cf  ! 4922: LDSBA_I	ldsba	[%r16, + 0x00cf] %asi, %r25
cpu_intr_2_384:
	setx	0x44021a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_364:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_364), 16, 16)) -> intp(2, 0, 2a)
	.word 0xb2956026  ! 4928: ORcc_I	orcc 	%r21, 0x0026, %r25
cpu_intr_2_385:
	setx	0x45011f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_214:
	mov	0x2, %r14
	.word 0xf8f38e40  ! 4930: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
	.word 0xf80c6073  ! 4936: LDUB_I	ldub	[%r17 + 0x0073], %r28
cpu_intr_2_386:
	setx	0x45022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04ca0a7  ! 4940: LDSB_I	ldsb	[%r18 + 0x00a7], %r24
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
	.word 0xf68d0020  ! 4950: LDUBA_R	lduba	[%r20, %r0] 0x01, %r27
cpu_intr_2_387:
	setx	0x440231, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_365:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_365), 16, 16)) -> intp(2, 0, a)
cpu_intr_2_388:
	setx	0x460000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf350000  ! 4959: SRL_R	srl 	%r20, %r0, %r31
cpu_intr_2_389:
	setx	0x45002b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_390:
	setx	0x47032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6d4a04d  ! 4965: LDSHA_I	ldsha	[%r18, + 0x004d] %asi, %r27
T2_asi_reg_rd_217:
	mov	0x3, %r14
	.word 0xf2db89e0  ! 4966: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_391:
	setx	0x47032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf48521a5  ! 4974: LDUWA_I	lduwa	[%r20, + 0x01a5] %asi, %r26
iob_intr_2_366:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_366), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_rd_218:
	mov	0x23, %r14
	.word 0xf6db8e80  ! 4976: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbe94a00d  ! 4977: ORcc_I	orcc 	%r18, 0x000d, %r31
	.word 0xf2c4e176  ! 4983: LDSWA_I	ldswa	[%r19, + 0x0176] %asi, %r25
	.word 0xfe14c000  ! 4984: LDUH_R	lduh	[%r19 + %r0], %r31
cpu_intr_2_392:
	setx	0x46001c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_367:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_367), 16, 16)) -> intp(2, 0, 20)
	.word 0xb4ad6115  ! 4987: ANDNcc_I	andncc 	%r21, 0x0115, %r26
	.word 0xbe950000  ! 4988: ORcc_R	orcc 	%r20, %r0, %r31
T2_asi_reg_wr_215:
	mov	0x22, %r14
	.word 0xf6f38400  ! 4989: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xfc94c020  ! 4995: LDUHA_R	lduha	[%r19, %r0] 0x01, %r30
T2_asi_reg_rd_219:
	mov	0x30, %r14
	.word 0xf2db89e0  ! 4996: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T2_asi_reg_rd_220:
	mov	0x2b, %r14
	.word 0xf4db89e0  ! 4997: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T2_asi_reg_wr_216:
	mov	0x20, %r14
	.word 0xf6f384a0  ! 4998: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
cpu_intr_1_0:
	setx	0x1b0230, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_0:
	mov	0x3c8, %r14
	.word 0xfcf38400  ! 4: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbfa9c820  ! 7: FMOVVS	fmovs	%fcc1, %f0, %f31
iob_intr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_0), 16, 16)) -> intp(1, 0, f)
iob_intr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_1), 16, 16)) -> intp(1, 0, 1f)
iob_intr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_2), 16, 16)) -> intp(1, 0, 3)
cpu_intr_1_1:
	setx	0x1c0339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a58960  ! 16: FMULq	dis not found

cpu_intr_1_2:
	setx	0x1f0033, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_3:
	setx	0x1f0026, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_3), 16, 16)) -> intp(1, 0, 24)
cpu_intr_1_4:
	setx	0x1d0128, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_5:
	setx	0x1d0210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb08420a1  ! 24: ADDcc_I	addcc 	%r16, 0x00a1, %r24
	.word 0xb5a80820  ! 27: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb1a54820  ! 29: FADDs	fadds	%f21, %f0, %f24
	.word 0xb5a48840  ! 30: FADDd	faddd	%f18, %f0, %f26
	.word 0xb8850000  ! 32: ADDcc_R	addcc 	%r20, %r0, %r28
T1_asi_reg_rd_0:
	mov	0x3c1, %r14
	.word 0xfedb8e80  ! 37: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_1_6:
	setx	0x1e022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xb3aac820  ! 45: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xb1a00520  ! 46: FSQRTs	fsqrt	
cpu_intr_1_7:
	setx	0x1d023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_1:
	mov	0x3c0, %r14
	.word 0xf2f389e0  ! 48: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_1_8:
	setx	0x1d003b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_9:
	setx	0x1c0238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9480000  ! 58: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb5a58860  ! 59: FADDq	dis not found

cpu_intr_1_10:
	setx	0x1c0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab0820  ! 63: FMOVGU	fmovs	%fcc1, %f0, %f30
cpu_intr_1_11:
	setx	0x1c0031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a81820  ! 66: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb7a98820  ! 68: FMOVNEG	fmovs	%fcc1, %f0, %f27
	lda	[%r20 + %g0] 0xf0, %f2
T1_asi_reg_wr_2:
	mov	0x23, %r14
	.word 0xf6f38e40  ! 72: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbfa80820  ! 73: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb73d9000  ! 74: SRAX_R	srax	%r22, %r0, %r27
cpu_intr_1_12:
	setx	0x1c0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb80d2043  ! 76: AND_I	and 	%r20, 0x0043, %r28
	.word 0xb1aa8820  ! 77: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb1a00040  ! 81: FMOVd	fmovd	%f0, %f24
	.word 0xb7a40960  ! 82: FMULq	dis not found

T1_asi_reg_rd_1:
	mov	0x6, %r14
	.word 0xfedb89e0  ! 84: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T1_asi_reg_rd_2:
	mov	0x28, %r14
	.word 0xf6db84a0  ! 85: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb6050000  ! 86: ADD_R	add 	%r20, %r0, %r27
	.word 0xbda90820  ! 87: FMOVLEU	fmovs	%fcc1, %f0, %f30
cpu_intr_1_13:
	setx	0x1e001f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_14:
	setx	0x1e001c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_4), 16, 16)) -> intp(1, 0, a)
	.word 0xb1ab8820  ! 95: FMOVPOS	fmovs	%fcc1, %f0, %f24
iob_intr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_5), 16, 16)) -> intp(1, 0, 35)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a00020  ! 99: FMOVs	fmovs	%f0, %f26
	.word 0xb9a8c820  ! 103: FMOVL	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_3:
	mov	0x3c0, %r14
	.word 0xf8f38e60  ! 105: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_1_15:
	setx	0x1d0116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_6), 16, 16)) -> intp(1, 0, 19)
	.word 0xb1a84820  ! 110: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xbdaa8820  ! 115: FMOVG	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_3:
	mov	0x3c7, %r14
	.word 0xfcdb8e60  ! 120: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbba40820  ! 122: FADDs	fadds	%f16, %f0, %f29
iob_intr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_7), 16, 16)) -> intp(1, 0, c)
	.word 0xb3aac820  ! 124: FMOVGE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_4:
	mov	0x3c5, %r14
	.word 0xfcf389e0  ! 127: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xbfa00560  ! 130: FSQRTq	fsqrt	
iob_intr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_8), 16, 16)) -> intp(1, 0, 1e)
iob_intr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_9), 16, 16)) -> intp(1, 0, 7)
T1_asi_reg_rd_4:
	mov	0x3c4, %r14
	.word 0xf6db8e80  ! 142: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbba4c8c0  ! 146: FSUBd	fsubd	%f50, %f0, %f60
	.word 0xb0040000  ! 147: ADD_R	add 	%r16, %r0, %r24
	.word 0xbdaa8820  ! 148: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb9a509e0  ! 149: FDIVq	dis not found

T1_asi_reg_rd_5:
	mov	0x3, %r14
	.word 0xf4db8e80  ! 150: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbbaa0820  ! 152: FMOVA	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a80c20  ! 155: FMOVRLZ	dis not found

iob_intr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_10), 16, 16)) -> intp(1, 0, 5)
iob_intr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_11), 16, 16)) -> intp(1, 0, 20)
cpu_intr_1_16:
	setx	0x1c0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a488c0  ! 161: FSUBd	fsubd	%f18, %f0, %f56
iob_intr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_12), 16, 16)) -> intp(1, 0, 28)
T1_asi_reg_rd_6:
	mov	0x2a, %r14
	.word 0xf6db8e40  ! 171: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb5a508c0  ! 173: FSUBd	fsubd	%f20, %f0, %f26
	.word 0xba3d4000  ! 177: XNOR_R	xnor 	%r21, %r0, %r29
	.word 0xb3a488a0  ! 183: FSUBs	fsubs	%f18, %f0, %f25
T1_asi_reg_rd_7:
	mov	0x5, %r14
	.word 0xf8db89e0  ! 185: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb5a80820  ! 191: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
iob_intr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_13), 16, 16)) -> intp(1, 0, 15)
	.word 0xbda81820  ! 194: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb3a50920  ! 196: FMULs	fmuls	%f20, %f0, %f25
	.word 0x9195e075  ! 197: WRPR_PIL_I	wrpr	%r23, 0x0075, %pil
	.word 0xb3a54920  ! 198: FMULs	fmuls	%f21, %f0, %f25
cpu_intr_1_17:
	setx	0x1f033e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_18:
	setx	0x1d012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a488c0  ! 203: FSUBd	fsubd	%f18, %f0, %f28
	lda	[%r23 + %g0] 0xf0, %f2
T1_asi_reg_wr_5:
	mov	0x26, %r14
	.word 0xf0f38e40  ! 208: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb7abc820  ! 211: FMOVVC	fmovs	%fcc1, %f0, %f27
iob_intr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_14), 16, 16)) -> intp(1, 0, 39)
iob_intr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_15), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb5a449e0  ! 218: FDIVq	dis not found

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
	.word 0xb9a508a0  ! 236: FSUBs	fsubs	%f20, %f0, %f28
	.word 0xbda88820  ! 237: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xbeb4c000  ! 238: SUBCcc_R	orncc 	%r19, %r0, %r31
	.word 0xb1a54940  ! 239: FMULd	fmuld	%f52, %f0, %f24
T1_asi_reg_wr_6:
	mov	0xa, %r14
	.word 0xf2f384a0  ! 240: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_16), 16, 16)) -> intp(1, 0, 3)
cpu_intr_1_19:
	setx	0x1e0123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80420  ! 246: FMOVRZ	dis not found

	.word 0xb1a488c0  ! 252: FSUBd	fsubd	%f18, %f0, %f24
iob_intr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_17), 16, 16)) -> intp(1, 0, 2)
cpu_intr_1_20:
	setx	0x1d0029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_18), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb9a00540  ! 262: FSQRTd	fsqrt	
iob_intr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_19), 16, 16)) -> intp(1, 0, 9)
	.word 0xb9a508e0  ! 267: FSUBq	dis not found

	.word 0xbba00520  ! 269: FSQRTs	fsqrt	
iob_intr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_20), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_21:
	setx	0x1f0204, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_21), 16, 16)) -> intp(1, 0, 23)
	.word 0xb3a8c820  ! 275: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xbda54940  ! 277: FMULd	fmuld	%f52, %f0, %f30
iob_intr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_22), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_wr_7:
	mov	0x3c4, %r14
	.word 0xf0f38e40  ! 289: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_wr_8:
	mov	0x3c7, %r14
	.word 0xf6f38e40  ! 290: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_23), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbba588e0  ! 298: FSUBq	dis not found

	.word 0xb9a84820  ! 299: FMOVE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_22:
	setx	0x1f0310, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_23:
	setx	0x1d031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00560  ! 308: FSQRTq	fsqrt	
T1_asi_reg_wr_9:
	mov	0x3c3, %r14
	.word 0xfcf38e40  ! 310: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb4054000  ! 311: ADD_R	add 	%r21, %r0, %r26
cpu_intr_1_24:
	setx	0x1c010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c8c0  ! 314: FSUBd	fsubd	%f50, %f0, %f58
T1_asi_reg_rd_8:
	mov	0x2f, %r14
	.word 0xfcdb8e40  ! 315: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_24), 16, 16)) -> intp(1, 0, 6)
	.word 0xb5a54840  ! 317: FADDd	faddd	%f52, %f0, %f26
T1_asi_reg_wr_10:
	mov	0x3c1, %r14
	.word 0xf4f389e0  ! 318: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbfa98820  ! 320: FMOVNEG	fmovs	%fcc1, %f0, %f31
iob_intr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_25), 16, 16)) -> intp(1, 0, 1f)
iob_intr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_26), 16, 16)) -> intp(1, 0, 11)
	.word 0xb1aa0820  ! 324: FMOVA	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_11:
	mov	0x17, %r14
	.word 0xf2f384a0  ! 325: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb7a81820  ! 326: FMOVRGZ	fmovs	%fcc3, %f0, %f27
T1_asi_reg_rd_9:
	mov	0x37, %r14
	.word 0xf6db84a0  ! 327: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T1_asi_reg_wr_12:
	mov	0x1f, %r14
	.word 0xf8f38e40  ! 328: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_rd_10:
	mov	0x15, %r14
	.word 0xf4db84a0  ! 329: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb3a00520  ! 330: FSQRTs	fsqrt	
	.word 0xb2c5c000  ! 333: ADDCcc_R	addccc 	%r23, %r0, %r25
T1_asi_reg_wr_13:
	mov	0x3c5, %r14
	.word 0xf0f38e40  ! 334: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbba5c9c0  ! 335: FDIVd	fdivd	%f54, %f0, %f60
T1_asi_reg_wr_14:
	mov	0x24, %r14
	.word 0xfef384a0  ! 336: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb3a48940  ! 338: FMULd	fmuld	%f18, %f0, %f56
cpu_intr_1_25:
	setx	0x1e0331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7ab8820  ! 344: FMOVPOS	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_15:
	mov	0x2b, %r14
	.word 0xfef38e60  ! 346: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbba50940  ! 347: FMULd	fmuld	%f20, %f0, %f60
	.word 0xb7a94820  ! 348: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb134a001  ! 349: SRL_I	srl 	%r18, 0x0001, %r24
iob_intr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_27), 16, 16)) -> intp(1, 0, 6)
	.word 0xbba84820  ! 351: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb01c4000  ! 353: XOR_R	xor 	%r17, %r0, %r24
iob_intr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_28), 16, 16)) -> intp(1, 0, 17)
T1_asi_reg_wr_16:
	mov	0x9, %r14
	.word 0xfaf38e80  ! 355: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb9a5c9e0  ! 357: FDIVq	dis not found

	.word 0xbfa44820  ! 358: FADDs	fadds	%f17, %f0, %f31
	.word 0xb9a48860  ! 359: FADDq	dis not found

	.word 0xbfa54960  ! 367: FMULq	dis not found

T1_asi_reg_wr_17:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 368: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_rd_11:
	mov	0x1e, %r14
	.word 0xf4db8e60  ! 371: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_29), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb7504000  ! 374: RDPR_TNPC	<illegal instruction>
	.word 0xbba81c20  ! 378: FMOVRGEZ	dis not found

T1_asi_reg_rd_12:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 379: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xb9a509e0  ! 385: FDIVq	dis not found

iob_intr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_30), 16, 16)) -> intp(1, 0, 31)
T1_asi_reg_rd_13:
	mov	0x3c0, %r14
	.word 0xf4db8e60  ! 389: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xbfa40840  ! 391: FADDd	faddd	%f16, %f0, %f62
cpu_intr_1_26:
	setx	0x1d0114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c9a0  ! 397: FDIVs	fdivs	%f19, %f0, %f27
	.word 0xb3a9c820  ! 400: FMOVVS	fmovs	%fcc1, %f0, %f25
iob_intr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_31), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb9a80420  ! 404: FMOVRZ	dis not found

	.word 0xb7a80420  ! 405: FMOVRZ	dis not found

cpu_intr_1_27:
	setx	0x1e0224, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_18:
	mov	0x1d, %r14
	.word 0xf2f38e40  ! 412: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_wr_19:
	mov	0x3c5, %r14
	.word 0xf4f384a0  ! 414: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T1_asi_reg_rd_14:
	mov	0x1a, %r14
	.word 0xfadb84a0  ! 416: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbba588a0  ! 417: FSUBs	fsubs	%f22, %f0, %f29
cpu_intr_1_28:
	setx	0x1c0208, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_29:
	setx	0x1f0326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a90820  ! 429: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xb734e001  ! 432: SRL_I	srl 	%r19, 0x0001, %r27
iob_intr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_32), 16, 16)) -> intp(1, 0, 27)
iob_intr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_33), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb934f001  ! 440: SRLX_I	srlx	%r19, 0x0001, %r28
	.word 0xb9a00540  ! 441: FSQRTd	fsqrt	
	.word 0xbba5c940  ! 444: FMULd	fmuld	%f54, %f0, %f60
iob_intr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_34), 16, 16)) -> intp(1, 0, 29)
	.word 0xb5a81820  ! 448: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb7a90820  ! 450: FMOVLEU	fmovs	%fcc1, %f0, %f27
iob_intr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_35), 16, 16)) -> intp(1, 0, 30)
	.word 0xb6248000  ! 452: SUB_R	sub 	%r18, %r0, %r27
T1_asi_reg_rd_15:
	mov	0x3c8, %r14
	.word 0xf4db84a0  ! 453: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_1_30:
	setx	0x1e011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r16 + %g0] 0xf0, %f2
T1_asi_reg_wr_20:
	mov	0x16, %r14
	.word 0xfef38e80  ! 456: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_31:
	setx	0x1e0013, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_21:
	mov	0x3c4, %r14
	.word 0xf6f38e80  ! 469: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_36), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb3a8c820  ! 471: FMOVL	fmovs	%fcc1, %f0, %f25
cpu_intr_1_32:
	setx	0x1d0205, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_37), 16, 16)) -> intp(1, 0, 18)
	.word 0xb92da001  ! 476: SLL_I	sll 	%r22, 0x0001, %r28
	.word 0xb1a4c8a0  ! 477: FSUBs	fsubs	%f19, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_38), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb9a4c9a0  ! 481: FDIVs	fdivs	%f19, %f0, %f28
cpu_intr_1_33:
	setx	0x210237, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_34:
	setx	0x22012b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_39), 16, 16)) -> intp(1, 0, 38)
	.word 0xb3a81420  ! 487: FMOVRNZ	dis not found

	.word 0xb57d8400  ! 489: MOVR_R	movre	%r22, %r0, %r26
	.word 0xb1a00560  ! 490: FSQRTq	fsqrt	
	.word 0xb1a00020  ! 495: FMOVs	fmovs	%f0, %f24
	.word 0xb1ab4820  ! 496: FMOVCC	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_16:
	mov	0x7, %r14
	.word 0xf8db8e40  ! 497: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb5a5c9a0  ! 501: FDIVs	fdivs	%f23, %f0, %f26
iob_intr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_40), 16, 16)) -> intp(1, 0, 3d)
	.word 0xbb510000  ! 503: RDPR_TICK	<illegal instruction>
T1_asi_reg_rd_17:
	mov	0x26, %r14
	.word 0xf0db8e40  ! 505: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_41), 16, 16)) -> intp(1, 0, 33)
T1_asi_reg_rd_18:
	mov	0x1, %r14
	.word 0xf0db8e80  ! 509: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb9a488c0  ! 510: FSUBd	fsubd	%f18, %f0, %f28
T1_asi_reg_wr_22:
	mov	0x30, %r14
	.word 0xf0f384a0  ! 512: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T1_asi_reg_rd_19:
	mov	0xa, %r14
	.word 0xf2db84a0  ! 518: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbfa4c840  ! 521: FADDd	faddd	%f50, %f0, %f62
T1_asi_reg_rd_20:
	mov	0x10, %r14
	.word 0xf0db8400  ! 524: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbfab4820  ! 526: FMOVCC	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_23:
	mov	0x19, %r14
	.word 0xfcf38400  ! 528: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbec48000  ! 532: ADDCcc_R	addccc 	%r18, %r0, %r31
	.word 0xb1aac820  ! 533: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb1a84820  ! 535: FMOVE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_24:
	mov	0x2b, %r14
	.word 0xf4f389e0  ! 536: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T1_asi_reg_wr_25:
	mov	0x3c8, %r14
	.word 0xf8f38e80  ! 537: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_1_35:
	setx	0x220009, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_42), 16, 16)) -> intp(1, 0, 0)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a409a0  ! 547: FDIVs	fdivs	%f16, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_21:
	mov	0x2c, %r14
	.word 0xf6db8e60  ! 551: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_1_36:
	setx	0x200033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a508a0  ! 556: FSUBs	fsubs	%f20, %f0, %f26
iob_intr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_43), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb3a50960  ! 559: FMULq	dis not found

	.word 0xb5a94820  ! 561: FMOVCS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_22:
	mov	0x1e, %r14
	.word 0xf4db8e40  ! 562: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_44), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_37:
	setx	0x22003f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_26:
	mov	0x3c2, %r14
	.word 0xf0f38400  ! 567: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0x89946138  ! 568: WRPR_TICK_I	wrpr	%r17, 0x0138, %tick
	.word 0xbb349000  ! 569: SRLX_R	srlx	%r18, %r0, %r29
T1_asi_reg_wr_27:
	mov	0x8, %r14
	.word 0xf4f384a0  ! 570: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbfa44820  ! 571: FADDs	fadds	%f17, %f0, %f31
	.word 0xbda94820  ! 574: FMOVCS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_23:
	mov	0x3c0, %r14
	.word 0xf0db89e0  ! 579: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_45), 16, 16)) -> intp(1, 0, 25)
iob_intr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_46), 16, 16)) -> intp(1, 0, c)
iob_intr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_47), 16, 16)) -> intp(1, 0, 3c)
iob_intr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_48), 16, 16)) -> intp(1, 0, 30)
	.word 0xb32c6001  ! 588: SLL_I	sll 	%r17, 0x0001, %r25
	.word 0xba8d0000  ! 589: ANDcc_R	andcc 	%r20, %r0, %r29
cpu_intr_1_38:
	setx	0x20002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a94820  ! 595: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb3a00540  ! 597: FSQRTd	fsqrt	
cpu_intr_1_39:
	setx	0x210107, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_40:
	setx	0x20020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c8c0  ! 602: FSUBd	fsubd	%f50, %f0, %f58
iob_intr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_49), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb1aa0820  ! 604: FMOVA	fmovs	%fcc1, %f0, %f24
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xba25c000  ! 607: SUB_R	sub 	%r23, %r0, %r29
	.word 0xb1a488e0  ! 608: FSUBq	dis not found

	.word 0xb7a588e0  ! 610: FSUBq	dis not found

	.word 0xb9a94820  ! 612: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xb9a80c20  ! 613: FMOVRLZ	dis not found

	.word 0xba1ce043  ! 614: XOR_I	xor 	%r19, 0x0043, %r29
T1_asi_reg_wr_28:
	mov	0x32, %r14
	.word 0xf0f38e80  ! 616: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb1a58940  ! 617: FMULd	fmuld	%f22, %f0, %f24
	.word 0xb3a00520  ! 618: FSQRTs	fsqrt	
	.word 0xbba8c820  ! 620: FMOVL	fmovs	%fcc1, %f0, %f29
cpu_intr_1_41:
	setx	0x230028, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_50), 16, 16)) -> intp(1, 0, 20)
cpu_intr_1_42:
	setx	0x200209, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_43:
	setx	0x220013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a48820  ! 634: FADDs	fadds	%f18, %f0, %f26
	.word 0xb7a58960  ! 636: FMULq	dis not found

	.word 0xbfaa0820  ! 642: FMOVA	fmovs	%fcc1, %f0, %f31
iob_intr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_51), 16, 16)) -> intp(1, 0, 3f)
cpu_intr_1_44:
	setx	0x220307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba88820  ! 645: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xbba40960  ! 646: FMULq	dis not found

cpu_intr_1_45:
	setx	0x230039, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_29:
	mov	0x22, %r14
	.word 0xf0f38e40  ! 650: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0x9194e0f6  ! 651: WRPR_PIL_I	wrpr	%r19, 0x00f6, %pil
	.word 0xbba408a0  ! 654: FSUBs	fsubs	%f16, %f0, %f29
	.word 0xb5a00540  ! 655: FSQRTd	fsqrt	
	.word 0xb9a54920  ! 657: FMULs	fmuls	%f21, %f0, %f28
	.word 0xb5a509e0  ! 659: FDIVq	dis not found

cpu_intr_1_46:
	setx	0x220209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4340000  ! 664: ORN_R	orn 	%r16, %r0, %r26
	.word 0xbda84820  ! 666: FMOVE	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_24:
	mov	0x3c4, %r14
	.word 0xf4db8400  ! 667: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_1_47:
	setx	0x230330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe3da070  ! 673: XNOR_I	xnor 	%r22, 0x0070, %r31
iob_intr_1_52:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_52), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_48:
	setx	0x23020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa88820  ! 681: FMOVLE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_49:
	setx	0x21032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a84820  ! 692: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb844c000  ! 695: ADDC_R	addc 	%r19, %r0, %r28
	.word 0xb7aa8820  ! 696: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xbc158000  ! 697: OR_R	or 	%r22, %r0, %r30
cpu_intr_1_50:
	setx	0x210039, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_53:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_53), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb1a94820  ! 700: FMOVCS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_30:
	mov	0x0, %r14
	.word 0xf2f38e60  ! 704: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xbda80820  ! 706: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_31:
	mov	0x0, %r14
	.word 0xf8f384a0  ! 707: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb1a5c960  ! 708: FMULq	dis not found

	.word 0xbda90820  ! 709: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb085a030  ! 710: ADDcc_I	addcc 	%r22, 0x0030, %r24
iob_intr_1_54:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_54), 16, 16)) -> intp(1, 0, 7)
	.word 0xb5a488c0  ! 714: FSUBd	fsubd	%f18, %f0, %f26
iob_intr_1_55:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_55), 16, 16)) -> intp(1, 0, 13)
cpu_intr_1_51:
	setx	0x220125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8bdc000  ! 722: XNORcc_R	xnorcc 	%r23, %r0, %r28
	.word 0xbdabc820  ! 725: FMOVVC	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_25:
	mov	0x3, %r14
	.word 0xfedb8e40  ! 727: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb1a88820  ! 730: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb7a58840  ! 733: FADDd	faddd	%f22, %f0, %f58
	.word 0xb5354000  ! 738: SRL_R	srl 	%r21, %r0, %r26
	.word 0xb1a588c0  ! 741: FSUBd	fsubd	%f22, %f0, %f24
iob_intr_1_56:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_56), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb4b5c000  ! 743: ORNcc_R	orncc 	%r23, %r0, %r26
	.word 0xb1510000  ! 745: RDPR_TICK	<illegal instruction>
	.word 0xbbaac820  ! 746: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xbc9da0ce  ! 748: XORcc_I	xorcc 	%r22, 0x00ce, %r30
	.word 0xb1a81420  ! 750: FMOVRNZ	dis not found

	.word 0xb7a81c20  ! 751: FMOVRGEZ	dis not found

	.word 0xb7a00520  ! 752: FSQRTs	fsqrt	
	.word 0xbfa00560  ! 753: FSQRTq	fsqrt	
T1_asi_reg_rd_26:
	mov	0xd, %r14
	.word 0xfcdb84a0  ! 754: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_1_52:
	setx	0x20002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa50920  ! 757: FMULs	fmuls	%f20, %f0, %f31
	.word 0xb1a9c820  ! 760: FMOVVS	fmovs	%fcc1, %f0, %f24
iob_intr_1_57:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_57), 16, 16)) -> intp(1, 0, 0)
	.word 0xb5a80820  ! 762: FMOVN	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_32:
	mov	0x2b, %r14
	.word 0xf2f384a0  ! 763: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_1_58:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_58), 16, 16)) -> intp(1, 0, 6)
	.word 0xbba489e0  ! 765: FDIVq	dis not found

T1_asi_reg_wr_33:
	mov	0x3c4, %r14
	.word 0xfef38e40  ! 766: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_1_53:
	setx	0x220135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfab0820  ! 770: FMOVGU	fmovs	%fcc1, %f0, %f31
cpu_intr_1_54:
	setx	0x220218, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_55:
	setx	0x210136, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_59:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_59), 16, 16)) -> intp(1, 0, 12)
	.word 0xb5a9c820  ! 777: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xbfab0820  ! 781: FMOVGU	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_34:
	mov	0x3c3, %r14
	.word 0xf8f38400  ! 782: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb7520000  ! 784: RDPR_PIL	<illegal instruction>
T1_asi_reg_wr_35:
	mov	0x5, %r14
	.word 0xf0f38400  ! 785: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_1_60:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_60), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_wr_36:
	mov	0x26, %r14
	.word 0xfaf38e60  ! 789: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T1_asi_reg_wr_37:
	mov	0x3c1, %r14
	.word 0xfcf38e40  ! 790: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb1aac820  ! 791: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xbba00560  ! 794: FSQRTq	fsqrt	
iob_intr_1_61:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_61), 16, 16)) -> intp(1, 0, 39)
cpu_intr_1_56:
	setx	0x21000d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_62:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_62), 16, 16)) -> intp(1, 0, 39)
	.word 0xbda81c20  ! 801: FMOVRGEZ	dis not found

iob_intr_1_63:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_63), 16, 16)) -> intp(1, 0, 16)
	.word 0xb1a84820  ! 805: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb7a9c820  ! 806: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb77dc400  ! 808: MOVR_R	movre	%r23, %r0, %r27
iob_intr_1_64:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_64), 16, 16)) -> intp(1, 0, 39)
	.word 0xbba00540  ! 814: FSQRTd	fsqrt	
	.word 0xbba44860  ! 815: FADDq	dis not found

iob_intr_1_65:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_65), 16, 16)) -> intp(1, 0, 2a)
	.word 0xbba8c820  ! 820: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xb9a00020  ! 826: FMOVs	fmovs	%f0, %f28
iob_intr_1_66:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_66), 16, 16)) -> intp(1, 0, 22)
	.word 0xbf7d8400  ! 828: MOVR_R	movre	%r22, %r0, %r31
	.word 0xb5a40920  ! 829: FMULs	fmuls	%f16, %f0, %f26
	.word 0xbba589a0  ! 831: FDIVs	fdivs	%f22, %f0, %f29
	.word 0xbba94820  ! 832: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb5a5c8c0  ! 833: FSUBd	fsubd	%f54, %f0, %f26
T1_asi_reg_rd_27:
	mov	0xf, %r14
	.word 0xfedb8e60  ! 834: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xbe2de035  ! 836: ANDN_I	andn 	%r23, 0x0035, %r31
	.word 0xb9a409e0  ! 837: FDIVq	dis not found

	.word 0xb1a449a0  ! 841: FDIVs	fdivs	%f17, %f0, %f24
cpu_intr_1_57:
	setx	0x23022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_28:
	mov	0x16, %r14
	.word 0xf6db8e60  ! 844: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_1_67:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_67), 16, 16)) -> intp(1, 0, c)
	.word 0xb7a489e0  ! 850: FDIVq	dis not found

T1_asi_reg_wr_38:
	mov	0x38, %r14
	.word 0xf2f389e0  ! 852: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb3a409a0  ! 853: FDIVs	fdivs	%f16, %f0, %f25
T1_asi_reg_rd_29:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 854: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbba80420  ! 858: FMOVRZ	dis not found

	.word 0xbda00040  ! 860: FMOVd	fmovd	%f0, %f30
T1_asi_reg_wr_39:
	mov	0x33, %r14
	.word 0xfaf38e60  ! 861: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_1_68:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_68), 16, 16)) -> intp(1, 0, 37)
T1_asi_reg_wr_40:
	mov	0x17, %r14
	.word 0xf0f38e40  ! 864: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_wr_41:
	mov	0x4, %r14
	.word 0xfef38e40  ! 867: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbfa48860  ! 869: FADDq	dis not found

cpu_intr_1_58:
	setx	0x22010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda4c940  ! 874: FMULd	fmuld	%f50, %f0, %f30
cpu_intr_1_59:
	setx	0x230312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab8820  ! 876: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xbda489c0  ! 880: FDIVd	fdivd	%f18, %f0, %f30
	.word 0xb7a40920  ! 881: FMULs	fmuls	%f16, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_69:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_69), 16, 16)) -> intp(1, 0, 24)
	.word 0xb9508000  ! 892: RDPR_TSTATE	<illegal instruction>
cpu_intr_1_60:
	setx	0x220005, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_70:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_70), 16, 16)) -> intp(1, 0, e)
	.word 0xb7a00520  ! 900: FSQRTs	fsqrt	
	.word 0xb7a4c8c0  ! 903: FSUBd	fsubd	%f50, %f0, %f58
T1_asi_reg_rd_30:
	mov	0x3c6, %r14
	.word 0xfedb89e0  ! 907: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_1_71:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_71), 16, 16)) -> intp(1, 0, 26)
cpu_intr_1_61:
	setx	0x230328, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_62:
	setx	0x23032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba48940  ! 915: FMULd	fmuld	%f18, %f0, %f60
T1_asi_reg_wr_42:
	mov	0x29, %r14
	.word 0xf0f38e60  ! 920: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb1aac820  ! 923: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb4944000  ! 924: ORcc_R	orcc 	%r17, %r0, %r26
	lda	[%r23 + %g0] 0xf0, %f2
	.word 0xbda80420  ! 928: FMOVRZ	dis not found

	.word 0xb5a4c960  ! 930: FMULq	dis not found

T1_asi_reg_wr_43:
	mov	0x20, %r14
	.word 0xfaf38e80  ! 931: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbda98820  ! 933: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xbfa5c9e0  ! 934: FDIVq	dis not found

T1_asi_reg_wr_44:
	mov	0xc, %r14
	.word 0xfcf384a0  ! 942: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb20c4000  ! 943: AND_R	and 	%r17, %r0, %r25
cpu_intr_1_63:
	setx	0x270030, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_64:
	setx	0x26030d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_31:
	mov	0x1c, %r14
	.word 0xfadb8e60  ! 949: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbba00540  ! 951: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_65:
	setx	0x270335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a50860  ! 962: FADDq	dis not found

	.word 0xb7a00020  ! 963: FMOVs	fmovs	%f0, %f27
	.word 0xb6358000  ! 965: ORN_R	orn 	%r22, %r0, %r27
	.word 0xb1a84820  ! 966: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb484e1ba  ! 967: ADDcc_I	addcc 	%r19, 0x01ba, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb6358000  ! 976: ORN_R	orn 	%r22, %r0, %r27
cpu_intr_1_66:
	setx	0x25012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf35e001  ! 981: SRL_I	srl 	%r23, 0x0001, %r31
	.word 0xbfa81c20  ! 985: FMOVRGEZ	dis not found

	.word 0xb5a588a0  ! 986: FSUBs	fsubs	%f22, %f0, %f26
	.word 0xbfab0820  ! 989: FMOVGU	fmovs	%fcc1, %f0, %f31
cpu_intr_1_67:
	setx	0x25003f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_32:
	mov	0x9, %r14
	.word 0xfedb89e0  ! 996: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T1_asi_reg_wr_45:
	mov	0x3c1, %r14
	.word 0xf2f38e80  ! 997: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_1_72:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_72), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_68:
	setx	0x250102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_69:
	setx	0x24010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_46:
	mov	0x11, %r14
	.word 0xf2f384a0  ! 1007: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbba44820  ! 1009: FADDs	fadds	%f17, %f0, %f29
cpu_intr_1_70:
	setx	0x25031b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_33:
	mov	0x2b, %r14
	.word 0xf0db8e40  ! 1011: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_73:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_73), 16, 16)) -> intp(1, 0, 36)
iob_intr_1_74:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_74), 16, 16)) -> intp(1, 0, 3b)
	.word 0xbcc5207e  ! 1023: ADDCcc_I	addccc 	%r20, 0x007e, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb835a140  ! 1029: ORN_I	orn 	%r22, 0x0140, %r28
cpu_intr_1_71:
	setx	0x25000f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_34:
	mov	0x38, %r14
	.word 0xfcdb8400  ! 1032: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbda81420  ! 1036: FMOVRNZ	dis not found

	.word 0xb1a00040  ! 1038: FMOVd	fmovd	%f0, %f24
	.word 0xb5a00040  ! 1040: FMOVd	fmovd	%f0, %f26
	.word 0xb3a80820  ! 1041: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
iob_intr_1_75:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_75), 16, 16)) -> intp(1, 0, 31)
	.word 0xb1a84820  ! 1043: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xbfa98820  ! 1047: FMOVNEG	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_35:
	mov	0x3c6, %r14
	.word 0xfcdb8400  ! 1048: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbc844000  ! 1049: ADDcc_R	addcc 	%r17, %r0, %r30
T1_asi_reg_rd_36:
	mov	0x3c6, %r14
	.word 0xfadb8400  ! 1050: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_1_76:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_76), 16, 16)) -> intp(1, 0, 22)
cpu_intr_1_72:
	setx	0x270024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeb5e066  ! 1060: ORNcc_I	orncc 	%r23, 0x0066, %r31
cpu_intr_1_73:
	setx	0x26022c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_77:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_77), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb68c210d  ! 1066: ANDcc_I	andcc 	%r16, 0x010d, %r27
cpu_intr_1_74:
	setx	0x270233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_75:
	setx	0x24010c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_47:
	mov	0x2d, %r14
	.word 0xf2f384a0  ! 1069: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_1_78:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_78), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_79:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_79), 16, 16)) -> intp(1, 0, 29)
iob_intr_1_80:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_80), 16, 16)) -> intp(1, 0, 1)
	.word 0xb3a5c9c0  ! 1080: FDIVd	fdivd	%f54, %f0, %f56
	.word 0xb1a8c820  ! 1082: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xb3aac820  ! 1086: FMOVGE	fmovs	%fcc1, %f0, %f25
cpu_intr_1_76:
	setx	0x250233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_77:
	setx	0x27023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80420  ! 1102: FMOVRZ	dis not found

	.word 0xbbab4820  ! 1104: FMOVCC	fmovs	%fcc1, %f0, %f29
cpu_intr_1_78:
	setx	0x27023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a48860  ! 1111: FADDq	dis not found

	lda	[%r20 + %g0] 0xf0, %f2
T1_asi_reg_wr_48:
	mov	0x2f, %r14
	.word 0xf0f384a0  ! 1113: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_1_81:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_81), 16, 16)) -> intp(1, 0, 3a)
cpu_intr_1_79:
	setx	0x25033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc9c0000  ! 1120: XORcc_R	xorcc 	%r16, %r0, %r30
iob_intr_1_82:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_82), 16, 16)) -> intp(1, 0, 23)
	.word 0xbda88820  ! 1122: FMOVLE	fmovs	%fcc1, %f0, %f30
iob_intr_1_83:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_83), 16, 16)) -> intp(1, 0, 5)
iob_intr_1_84:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_84), 16, 16)) -> intp(1, 0, 17)
	.word 0xb134d000  ! 1126: SRLX_R	srlx	%r19, %r0, %r24
cpu_intr_1_80:
	setx	0x250339, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_85:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_85), 16, 16)) -> intp(1, 0, 2c)
cpu_intr_1_81:
	setx	0x240206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda81420  ! 1132: FMOVRNZ	dis not found

	.word 0xb1a48920  ! 1136: FMULs	fmuls	%f18, %f0, %f24
iob_intr_1_86:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_86), 16, 16)) -> intp(1, 0, 31)
	.word 0xb9a00540  ! 1139: FSQRTd	fsqrt	
T1_asi_reg_wr_49:
	mov	0x3c4, %r14
	.word 0xfaf38e40  ! 1140: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_1_82:
	setx	0x240122, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_83:
	setx	0x240111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00540  ! 1147: FSQRTd	fsqrt	
cpu_intr_1_84:
	setx	0x250022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a40860  ! 1150: FADDq	dis not found

	.word 0xb5aac820  ! 1153: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb7a44820  ! 1156: FADDs	fadds	%f17, %f0, %f27
T1_asi_reg_rd_37:
	mov	0x3c4, %r14
	.word 0xf8db89e0  ! 1157: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xbdabc820  ! 1161: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xbbab4820  ! 1163: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb9a4c9a0  ! 1168: FDIVs	fdivs	%f19, %f0, %f28
iob_intr_1_87:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_87), 16, 16)) -> intp(1, 0, 1)
iob_intr_1_88:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_88), 16, 16)) -> intp(1, 0, 8)
T1_asi_reg_wr_50:
	mov	0x21, %r14
	.word 0xfcf384a0  ! 1173: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbfa408c0  ! 1176: FSUBd	fsubd	%f16, %f0, %f62
iob_intr_1_89:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_89), 16, 16)) -> intp(1, 0, 3)
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xbf3d6001  ! 1184: SRA_I	sra 	%r21, 0x0001, %r31
	.word 0xbfab0820  ! 1185: FMOVGU	fmovs	%fcc1, %f0, %f31
iob_intr_1_90:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_90), 16, 16)) -> intp(1, 0, e)
cpu_intr_1_85:
	setx	0x27013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7480000  ! 1188: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb3a94820  ! 1190: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xb7a5c860  ! 1192: FADDq	dis not found

	.word 0xb214a0be  ! 1193: OR_I	or 	%r18, 0x00be, %r25
	.word 0xb4354000  ! 1194: ORN_R	orn 	%r21, %r0, %r26
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
	.word 0xb9a81420  ! 1200: FMOVRNZ	dis not found

	.word 0xb5a588a0  ! 1201: FSUBs	fsubs	%f22, %f0, %f26
iob_intr_1_91:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_91), 16, 16)) -> intp(1, 0, 17)
iob_intr_1_92:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_92), 16, 16)) -> intp(1, 0, 3d)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a00520  ! 1207: FSQRTs	fsqrt	
cpu_intr_1_86:
	setx	0x260002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_93:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_93), 16, 16)) -> intp(1, 0, 18)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb12d6001  ! 1216: SLL_I	sll 	%r21, 0x0001, %r24
T1_asi_reg_rd_38:
	mov	0x27, %r14
	.word 0xf2db8e60  ! 1217: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbc8ca0fa  ! 1221: ANDcc_I	andcc 	%r18, 0x00fa, %r30
	.word 0xbf34a001  ! 1222: SRL_I	srl 	%r18, 0x0001, %r31
	.word 0xb9a489e0  ! 1223: FDIVq	dis not found

T1_asi_reg_wr_51:
	mov	0x3c6, %r14
	.word 0xf2f38400  ! 1228: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb7a54940  ! 1231: FMULd	fmuld	%f52, %f0, %f58
iob_intr_1_94:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_94), 16, 16)) -> intp(1, 0, 13)
	.word 0xbda549a0  ! 1239: FDIVs	fdivs	%f21, %f0, %f30
	.word 0xb3a9c820  ! 1242: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xbab5203f  ! 1243: ORNcc_I	orncc 	%r20, 0x003f, %r29
	.word 0xbfa44840  ! 1245: FADDd	faddd	%f48, %f0, %f62
cpu_intr_1_87:
	setx	0x250324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa58960  ! 1249: FMULq	dis not found

	.word 0xb1a4c9a0  ! 1250: FDIVs	fdivs	%f19, %f0, %f24
	.word 0xbda44960  ! 1251: FMULq	dis not found

T1_asi_reg_rd_39:
	mov	0x34, %r14
	.word 0xf4db84a0  ! 1253: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_1_88:
	setx	0x25010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a508e0  ! 1258: FSUBq	dis not found

	.word 0xb7a54920  ! 1259: FMULs	fmuls	%f21, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_40:
	mov	0x0, %r14
	.word 0xf4db8400  ! 1261: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_1_95:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_95), 16, 16)) -> intp(1, 0, 10)
T1_asi_reg_rd_41:
	mov	0x2d, %r14
	.word 0xf6db84a0  ! 1263: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbc0dc000  ! 1267: AND_R	and 	%r23, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_42:
	mov	0x3c1, %r14
	.word 0xf0db84a0  ! 1269: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_1_96:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_96), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_97:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_97), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_89:
	setx	0x250218, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_52:
	mov	0x2c, %r14
	.word 0xfef384a0  ! 1276: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T1_asi_reg_rd_43:
	mov	0x3c0, %r14
	.word 0xf6db8e60  ! 1279: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbba80820  ! 1280: FMOVN	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_44:
	mov	0x4, %r14
	.word 0xf6db8e60  ! 1281: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb5a80420  ! 1282: FMOVRZ	dis not found

	.word 0xb1a5c9e0  ! 1284: FDIVq	dis not found

iob_intr_1_98:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_98), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb9a50840  ! 1287: FADDd	faddd	%f20, %f0, %f28
T1_asi_reg_rd_45:
	mov	0x4, %r14
	.word 0xf4db89e0  ! 1288: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb1a549e0  ! 1291: FDIVq	dis not found

T1_asi_reg_rd_46:
	mov	0x3c5, %r14
	.word 0xf8db8e60  ! 1292: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T1_asi_reg_wr_53:
	mov	0xf, %r14
	.word 0xf8f38e60  ! 1293: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T1_asi_reg_rd_47:
	mov	0x6, %r14
	.word 0xf6db8e60  ! 1298: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T1_asi_reg_wr_54:
	mov	0x3c3, %r14
	.word 0xf6f389e0  ! 1300: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T1_asi_reg_wr_55:
	mov	0x27, %r14
	.word 0xfef384a0  ! 1301: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_1_90:
	setx	0x26013c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_91:
	setx	0x260215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe1ce1d7  ! 1305: XOR_I	xor 	%r19, 0x01d7, %r31
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xbda448c0  ! 1308: FSUBd	fsubd	%f48, %f0, %f30
	.word 0xb3a588c0  ! 1311: FSUBd	fsubd	%f22, %f0, %f56
	.word 0xbc8c0000  ! 1313: ANDcc_R	andcc 	%r16, %r0, %r30
iob_intr_1_99:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_99), 16, 16)) -> intp(1, 0, a)
	.word 0xbbaa8820  ! 1315: FMOVG	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_56:
	mov	0x3c1, %r14
	.word 0xfef389e0  ! 1317: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbda88820  ! 1318: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb5a449c0  ! 1319: FDIVd	fdivd	%f48, %f0, %f26
iob_intr_1_100:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_100), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_wr_57:
	mov	0x36, %r14
	.word 0xfaf38e60  ! 1325: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_1_101:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_101), 16, 16)) -> intp(1, 0, 34)
	.word 0xb1a80c20  ! 1328: FMOVRLZ	dis not found

iob_intr_1_102:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_102), 16, 16)) -> intp(1, 0, 2)
cpu_intr_1_92:
	setx	0x26032a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_48:
	mov	0x21, %r14
	.word 0xfedb84a0  ! 1334: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_1_93:
	setx	0x27010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80420  ! 1343: FMOVRZ	dis not found

iob_intr_1_103:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_103), 16, 16)) -> intp(1, 0, 3c)
iob_intr_1_104:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_104), 16, 16)) -> intp(1, 0, 32)
	.word 0xb1a00020  ! 1347: FMOVs	fmovs	%f0, %f24
	.word 0xb9aa8820  ! 1348: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xb3a9c820  ! 1349: FMOVVS	fmovs	%fcc1, %f0, %f25
cpu_intr_1_94:
	setx	0x270126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a508e0  ! 1354: FSUBq	dis not found

cpu_intr_1_95:
	setx	0x250107, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r19 + %g0] 0xf0, %f2
T1_asi_reg_rd_49:
	mov	0x10, %r14
	.word 0xfadb84a0  ! 1364: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_1_105:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_105), 16, 16)) -> intp(1, 0, 26)
T1_asi_reg_wr_58:
	mov	0xb, %r14
	.word 0xf4f38e40  ! 1366: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb5a54960  ! 1367: FMULq	dis not found

	.word 0xbda81c20  ! 1368: FMOVRGEZ	dis not found

T1_asi_reg_wr_59:
	mov	0x32, %r14
	.word 0xf0f38e40  ! 1369: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_wr_60:
	mov	0x4, %r14
	.word 0xf2f38e80  ! 1371: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T1_asi_reg_rd_50:
	mov	0x30, %r14
	.word 0xf2db8e80  ! 1377: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbda449a0  ! 1380: FDIVs	fdivs	%f17, %f0, %f30
T1_asi_reg_wr_61:
	mov	0x9, %r14
	.word 0xf0f389e0  ! 1383: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb1a48940  ! 1384: FMULd	fmuld	%f18, %f0, %f24
iob_intr_1_106:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_106), 16, 16)) -> intp(1, 0, 4)
cpu_intr_1_96:
	setx	0x270215, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_62:
	mov	0x24, %r14
	.word 0xf2f384a0  ! 1390: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T1_asi_reg_rd_51:
	mov	0xb, %r14
	.word 0xf8db8e40  ! 1392: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbcac8000  ! 1394: ANDNcc_R	andncc 	%r18, %r0, %r30
cpu_intr_1_97:
	setx	0x2b0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00560  ! 1397: FSQRTq	fsqrt	
cpu_intr_1_98:
	setx	0x2b0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81420  ! 1400: FMOVRNZ	dis not found

iob_intr_1_107:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_107), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_108:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_108), 16, 16)) -> intp(1, 0, 31)
cpu_intr_1_99:
	setx	0x2a013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a9c820  ! 1406: FMOVVS	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9a589c0  ! 1413: FDIVd	fdivd	%f22, %f0, %f28
iob_intr_1_109:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_109), 16, 16)) -> intp(1, 0, 9)
T1_asi_reg_rd_52:
	mov	0x31, %r14
	.word 0xf6db8e60  ! 1419: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbba00540  ! 1421: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a588a0  ! 1426: FSUBs	fsubs	%f22, %f0, %f25
	.word 0xb7ab0820  ! 1427: FMOVGU	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_63:
	mov	0x28, %r14
	.word 0xfef38e60  ! 1428: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_1_100:
	setx	0x2a021c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_53:
	mov	0x18, %r14
	.word 0xfedb89e0  ! 1432: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbfa80820  ! 1433: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xbfa80820  ! 1434: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xbbaa0820  ! 1435: FMOVA	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_64:
	mov	0x3c5, %r14
	.word 0xfaf38e80  ! 1437: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T1_asi_reg_wr_65:
	mov	0x30, %r14
	.word 0xf6f38400  ! 1438: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbba00560  ! 1442: FSQRTq	fsqrt	
	.word 0xbbaa0820  ! 1443: FMOVA	fmovs	%fcc1, %f0, %f29
iob_intr_1_110:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_110), 16, 16)) -> intp(1, 0, 23)
T1_asi_reg_rd_54:
	mov	0x7, %r14
	.word 0xf8db8e40  ! 1445: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_1_101:
	setx	0x2a0216, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_66:
	mov	0x34, %r14
	.word 0xf8f38e60  ! 1448: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb5a44920  ! 1449: FMULs	fmuls	%f17, %f0, %f26
iob_intr_1_111:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_111), 16, 16)) -> intp(1, 0, 1)
	.word 0xbb7c4400  ! 1451: MOVR_R	movre	%r17, %r0, %r29
	.word 0xbfaa0820  ! 1452: FMOVA	fmovs	%fcc1, %f0, %f31
iob_intr_1_112:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_112), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb5ab4820  ! 1456: FMOVCC	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_67:
	mov	0xf, %r14
	.word 0xf4f384a0  ! 1457: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb9ab4820  ! 1460: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb235e07b  ! 1462: ORN_I	orn 	%r23, 0x007b, %r25
	.word 0xb7ab0820  ! 1463: FMOVGU	fmovs	%fcc1, %f0, %f27
cpu_intr_1_102:
	setx	0x28021c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_103:
	setx	0x28031a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_104:
	setx	0x2a003a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_105:
	setx	0x280339, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_55:
	mov	0x37, %r14
	.word 0xf4db8e60  ! 1475: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb1a58860  ! 1480: FADDq	dis not found

T1_asi_reg_wr_68:
	mov	0x3c8, %r14
	.word 0xfcf38e80  ! 1481: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb1a80820  ! 1484: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb1a58840  ! 1486: FADDd	faddd	%f22, %f0, %f24
cpu_intr_1_106:
	setx	0x290319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a588a0  ! 1488: FSUBs	fsubs	%f22, %f0, %f25
	.word 0xb5a00520  ! 1493: FSQRTs	fsqrt	
	.word 0xb5a00560  ! 1496: FSQRTq	fsqrt	
T1_asi_reg_rd_56:
	mov	0x30, %r14
	.word 0xfadb84a0  ! 1497: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T1_asi_reg_wr_69:
	mov	0x33, %r14
	.word 0xfef38e80  ! 1498: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbc2c61f5  ! 1499: ANDN_I	andn 	%r17, 0x01f5, %r30
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xb9a489a0  ! 1506: FDIVs	fdivs	%f18, %f0, %f28
cpu_intr_1_107:
	setx	0x2a0029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_113:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_113), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb3a4c8e0  ! 1516: FSUBq	dis not found

T1_asi_reg_wr_70:
	mov	0x14, %r14
	.word 0xfaf384a0  ! 1518: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb1ab4820  ! 1519: FMOVCC	fmovs	%fcc1, %f0, %f24
cpu_intr_1_108:
	setx	0x2b011b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_57:
	mov	0x12, %r14
	.word 0xfcdb8e60  ! 1521: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb9a54920  ! 1522: FMULs	fmuls	%f21, %f0, %f28
	.word 0xbfa448e0  ! 1527: FSUBq	dis not found

cpu_intr_1_109:
	setx	0x290239, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_114:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_114), 16, 16)) -> intp(1, 0, 0)
iob_intr_1_115:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_115), 16, 16)) -> intp(1, 0, 3c)
iob_intr_1_116:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_116), 16, 16)) -> intp(1, 0, 23)
cpu_intr_1_110:
	setx	0x2b0021, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_71:
	mov	0x31, %r14
	.word 0xf2f384a0  ! 1542: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T1_asi_reg_wr_72:
	mov	0x29, %r14
	.word 0xf0f384a0  ! 1543: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_1_117:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_117), 16, 16)) -> intp(1, 0, 26)
cpu_intr_1_111:
	setx	0x280100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a548c0  ! 1560: FSUBd	fsubd	%f52, %f0, %f26
	.word 0xb7a4c920  ! 1562: FMULs	fmuls	%f19, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_118:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_118), 16, 16)) -> intp(1, 0, 11)
T1_asi_reg_wr_73:
	mov	0x3c8, %r14
	.word 0xf8f38400  ! 1566: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T1_asi_reg_wr_74:
	mov	0x3c4, %r14
	.word 0xfaf389e0  ! 1569: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T1_asi_reg_wr_75:
	mov	0x6, %r14
	.word 0xfef38e80  ! 1570: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_1_119:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_119), 16, 16)) -> intp(1, 0, 26)
cpu_intr_1_112:
	setx	0x2a0225, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_113:
	setx	0x29011c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_120:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_120), 16, 16)) -> intp(1, 0, 36)
	.word 0xb1a00020  ! 1585: FMOVs	fmovs	%f0, %f24
iob_intr_1_121:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_121), 16, 16)) -> intp(1, 0, 17)
cpu_intr_1_114:
	setx	0x280011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aa4820  ! 1591: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xbc8c0000  ! 1592: ANDcc_R	andcc 	%r16, %r0, %r30
	.word 0xb5aa8820  ! 1593: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xbbabc820  ! 1596: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb0b520b7  ! 1598: ORNcc_I	orncc 	%r20, 0x00b7, %r24
T1_asi_reg_rd_58:
	mov	0x25, %r14
	.word 0xfcdb89e0  ! 1601: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_1_122:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_122), 16, 16)) -> intp(1, 0, 3a)
iob_intr_1_123:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_123), 16, 16)) -> intp(1, 0, 0)
	.word 0xb9a40860  ! 1607: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb334d000  ! 1609: SRLX_R	srlx	%r19, %r0, %r25
T1_asi_reg_rd_59:
	mov	0x3c1, %r14
	.word 0xf8db84a0  ! 1611: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	lda	[%r19 + %g0] 0xf0, %f2
cpu_intr_1_115:
	setx	0x280137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa50860  ! 1616: FADDq	dis not found

	.word 0xb424607e  ! 1617: SUB_I	sub 	%r17, 0x007e, %r26
T1_asi_reg_wr_76:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 1619: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbb508000  ! 1620: RDPR_TSTATE	<illegal instruction>
	.word 0xbfa8c820  ! 1621: FMOVL	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_60:
	mov	0x3c3, %r14
	.word 0xf0db89e0  ! 1625: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb9aa0820  ! 1628: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xbba44860  ! 1630: FADDq	dis not found

	.word 0xbf3d2001  ! 1631: SRA_I	sra 	%r20, 0x0001, %r31
	.word 0xbdaa0820  ! 1632: FMOVA	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_61:
	mov	0x1c, %r14
	.word 0xf8db8e60  ! 1634: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb9a58940  ! 1635: FMULd	fmuld	%f22, %f0, %f28
	.word 0xb1a548a0  ! 1639: FSUBs	fsubs	%f21, %f0, %f24
	.word 0xb435e12c  ! 1640: ORN_I	orn 	%r23, 0x012c, %r26
	.word 0xbbaa8820  ! 1641: FMOVG	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_62:
	mov	0xf, %r14
	.word 0xfadb8e80  ! 1643: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xbbaa4820  ! 1644: FMOVNE	fmovs	%fcc1, %f0, %f29
	lda	[%r23 + %g0] 0xf0, %f2
iob_intr_1_124:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_124), 16, 16)) -> intp(1, 0, 31)
	.word 0xb9abc820  ! 1652: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xb7a81420  ! 1656: FMOVRNZ	dis not found

iob_intr_1_125:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_125), 16, 16)) -> intp(1, 0, 18)
T1_asi_reg_rd_63:
	mov	0x29, %r14
	.word 0xfedb8e80  ! 1659: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_1_116:
	setx	0x280029, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_117:
	setx	0x2a032e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_118:
	setx	0x2b0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba84820  ! 1665: FMOVE	fmovs	%fcc1, %f0, %f29
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xbda00040  ! 1669: FMOVd	fmovd	%f0, %f30
	.word 0xb5a80820  ! 1671: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xb3a5c9a0  ! 1674: FDIVs	fdivs	%f23, %f0, %f25
iob_intr_1_126:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_126), 16, 16)) -> intp(1, 0, 1)
iob_intr_1_127:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_127), 16, 16)) -> intp(1, 0, 22)
T1_asi_reg_rd_64:
	mov	0x36, %r14
	.word 0xf6db8e80  ! 1684: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbfa448c0  ! 1685: FSUBd	fsubd	%f48, %f0, %f62
	.word 0xb1a5c9c0  ! 1686: FDIVd	fdivd	%f54, %f0, %f24
iob_intr_1_128:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_128), 16, 16)) -> intp(1, 0, 1b)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_129:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_129), 16, 16)) -> intp(1, 0, 26)
T1_asi_reg_wr_77:
	mov	0x3c0, %r14
	.word 0xf2f384a0  ! 1691: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb37da401  ! 1693: MOVR_I	movre	%r22, 0x1, %r25
iob_intr_1_130:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_130), 16, 16)) -> intp(1, 0, 21)
	.word 0xbda588c0  ! 1695: FSUBd	fsubd	%f22, %f0, %f30
	.word 0xbda80c20  ! 1696: FMOVRLZ	dis not found

T1_asi_reg_wr_78:
	mov	0x6, %r14
	.word 0xf8f384a0  ! 1698: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb0254000  ! 1699: SUB_R	sub 	%r21, %r0, %r24
cpu_intr_1_119:
	setx	0x2a0122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8bc4000  ! 1705: XNORcc_R	xnorcc 	%r17, %r0, %r28
	.word 0x8d95a1b3  ! 1706: WRPR_PSTATE_I	wrpr	%r22, 0x01b3, %pstate
iob_intr_1_131:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_131), 16, 16)) -> intp(1, 0, 3c)
iob_intr_1_132:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_132), 16, 16)) -> intp(1, 0, 2d)
	.word 0xbfa8c820  ! 1710: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xbba00040  ! 1711: FMOVd	fmovd	%f0, %f60
	.word 0xb3a9c820  ! 1712: FMOVVS	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_79:
	mov	0x3c8, %r14
	.word 0xf0f38e40  ! 1714: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_1_120:
	setx	0x2a0231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba54820  ! 1723: FADDs	fadds	%f21, %f0, %f29
	.word 0xbba81820  ! 1724: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb7a549c0  ! 1726: FDIVd	fdivd	%f52, %f0, %f58
iob_intr_1_133:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_133), 16, 16)) -> intp(1, 0, 12)
	.word 0xb3ab4820  ! 1728: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb3abc820  ! 1731: FMOVVC	fmovs	%fcc1, %f0, %f25
iob_intr_1_134:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_134), 16, 16)) -> intp(1, 0, 25)
	.word 0xb5a58960  ! 1738: FMULq	dis not found

T1_asi_reg_rd_65:
	mov	0xb, %r14
	.word 0xf0db84a0  ! 1740: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_1_121:
	setx	0x2a0330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda4c960  ! 1744: FMULq	dis not found

	.word 0xb1abc820  ! 1745: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb9a9c820  ! 1746: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xbfa84820  ! 1748: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xb5a81c20  ! 1749: FMOVRGEZ	dis not found

iob_intr_1_135:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_135), 16, 16)) -> intp(1, 0, 3)
	.word 0xbfa588e0  ! 1755: FSUBq	dis not found

T1_asi_reg_rd_66:
	mov	0x3c3, %r14
	.word 0xf8db8e80  ! 1757: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbbaac820  ! 1760: FMOVGE	fmovs	%fcc1, %f0, %f29
	lda	[%r20 + %g0] 0xf0, %f2
iob_intr_1_136:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_136), 16, 16)) -> intp(1, 0, f)
	.word 0xbcbc8000  ! 1764: XNORcc_R	xnorcc 	%r18, %r0, %r30
	.word 0xb9a81420  ! 1765: FMOVRNZ	dis not found

	.word 0xbdaac820  ! 1768: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb3a90820  ! 1770: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xbcb5c000  ! 1773: SUBCcc_R	orncc 	%r23, %r0, %r30
iob_intr_1_137:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_137), 16, 16)) -> intp(1, 0, 0)
	.word 0xb9643801  ! 1776: MOVcc_I	<illegal instruction>
iob_intr_1_138:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_138), 16, 16)) -> intp(1, 0, 34)
	.word 0xb1aac820  ! 1782: FMOVGE	fmovs	%fcc1, %f0, %f24
cpu_intr_1_122:
	setx	0x2a000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a81c20  ! 1787: FMOVRGEZ	dis not found

	.word 0xb9a408c0  ! 1789: FSUBd	fsubd	%f16, %f0, %f28
cpu_intr_1_123:
	setx	0x29002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a589a0  ! 1793: FDIVs	fdivs	%f22, %f0, %f28
	.word 0xb7a40840  ! 1797: FADDd	faddd	%f16, %f0, %f58
	.word 0xb5a84820  ! 1798: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0x8194a194  ! 1801: WRPR_TPC_I	wrpr	%r18, 0x0194, %tpc
	.word 0xb3a81420  ! 1803: FMOVRNZ	dis not found

cpu_intr_1_124:
	setx	0x290122, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_67:
	mov	0x7, %r14
	.word 0xfcdb8e40  ! 1805: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_139:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_139), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_140:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_140), 16, 16)) -> intp(1, 0, 30)
	.word 0xb5a54920  ! 1815: FMULs	fmuls	%f21, %f0, %f26
	.word 0xbda489c0  ! 1821: FDIVd	fdivd	%f18, %f0, %f30
T1_asi_reg_wr_80:
	mov	0x31, %r14
	.word 0xfef389e0  ! 1822: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	lda	[%r21 + %g0] 0xf0, %f2
cpu_intr_1_125:
	setx	0x2a0118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a5c8a0  ! 1831: FSUBs	fsubs	%f23, %f0, %f25
T1_asi_reg_wr_81:
	mov	0xa, %r14
	.word 0xfef38400  ! 1832: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb9a80420  ! 1833: FMOVRZ	dis not found

	.word 0xbfa4c8e0  ! 1834: FSUBq	dis not found

	.word 0xbfab4820  ! 1838: FMOVCC	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_68:
	mov	0x3c8, %r14
	.word 0xf8db8e40  ! 1839: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_1_141:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_141), 16, 16)) -> intp(1, 0, 1)
	.word 0xb815e05b  ! 1842: OR_I	or 	%r23, 0x005b, %r28
	.word 0xb6344000  ! 1847: SUBC_R	orn 	%r17, %r0, %r27
T1_asi_reg_wr_82:
	mov	0x26, %r14
	.word 0xf8f38e60  ! 1848: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_1_126:
	setx	0x290137, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_127:
	setx	0x280012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a48940  ! 1851: FMULd	fmuld	%f18, %f0, %f58
	.word 0xb9a588a0  ! 1852: FSUBs	fsubs	%f22, %f0, %f28
	.word 0xbdab4820  ! 1854: FMOVCC	fmovs	%fcc1, %f0, %f30
iob_intr_1_142:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_142), 16, 16)) -> intp(1, 0, 8)
	.word 0xbcb54000  ! 1862: SUBCcc_R	orncc 	%r21, %r0, %r30
	.word 0xb214e033  ! 1867: OR_I	or 	%r19, 0x0033, %r25
iob_intr_1_143:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_143), 16, 16)) -> intp(1, 0, 35)
T1_asi_reg_rd_69:
	mov	0x22, %r14
	.word 0xf0db8e40  ! 1872: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_wr_83:
	mov	0xb, %r14
	.word 0xf0f38e40  ! 1873: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb3a40940  ! 1880: FMULd	fmuld	%f16, %f0, %f56
	.word 0xb1a548a0  ! 1881: FSUBs	fsubs	%f21, %f0, %f24
	.word 0xbda00040  ! 1883: FMOVd	fmovd	%f0, %f30
	.word 0xbfa80420  ! 1885: FMOVRZ	dis not found

	.word 0xb1a80820  ! 1887: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb2140000  ! 1888: OR_R	or 	%r16, %r0, %r25
cpu_intr_1_128:
	setx	0x2f0232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80420  ! 1890: FMOVRZ	dis not found

cpu_intr_1_129:
	setx	0x2e0114, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_130:
	setx	0x2c020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c8c0  ! 1894: FSUBd	fsubd	%f50, %f0, %f56
T1_asi_reg_rd_70:
	mov	0x1b, %r14
	.word 0xf0db8400  ! 1895: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb3a48840  ! 1898: FADDd	faddd	%f18, %f0, %f56
	.word 0xbbab4820  ! 1899: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xbfa40940  ! 1900: FMULd	fmuld	%f16, %f0, %f62
	.word 0xb3a84820  ! 1901: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xbda548a0  ! 1903: FSUBs	fsubs	%f21, %f0, %f30
cpu_intr_1_131:
	setx	0x2f0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a44860  ! 1905: FADDq	dis not found

	.word 0xbb508000  ! 1909: RDPR_TSTATE	<illegal instruction>
	.word 0xbfab4820  ! 1911: FMOVCC	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_84:
	mov	0x32, %r14
	.word 0xfef38e80  ! 1912: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_1_132:
	setx	0x2e012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00560  ! 1916: FSQRTq	fsqrt	
	.word 0xb3a94820  ! 1917: FMOVCS	fmovs	%fcc1, %f0, %f25
cpu_intr_1_133:
	setx	0x2c023d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_134:
	setx	0x2e0018, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_135:
	setx	0x2d022c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_71:
	mov	0x1c, %r14
	.word 0xf4db8e80  ! 1931: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_1_136:
	setx	0x2e011b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_137:
	setx	0x2d0334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73d8000  ! 1940: SRA_R	sra 	%r22, %r0, %r27
cpu_intr_1_138:
	setx	0x2e012b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_139:
	setx	0x2d012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba88820  ! 1948: FMOVLE	fmovs	%fcc1, %f0, %f29
iob_intr_1_144:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_144), 16, 16)) -> intp(1, 0, 16)
	.word 0xb5a80420  ! 1950: FMOVRZ	dis not found

	.word 0xbba81820  ! 1951: FMOVRGZ	fmovs	%fcc3, %f0, %f29
T1_asi_reg_rd_72:
	mov	0xa, %r14
	.word 0xf8db8400  ! 1957: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb1a50820  ! 1958: FADDs	fadds	%f20, %f0, %f24
	.word 0xb9aa8820  ! 1960: FMOVG	fmovs	%fcc1, %f0, %f28
iob_intr_1_145:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_145), 16, 16)) -> intp(1, 0, 1b)
T1_asi_reg_rd_73:
	mov	0x13, %r14
	.word 0xf2db8e40  ! 1962: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbfab4820  ! 1964: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xbb7c0400  ! 1965: MOVR_R	movre	%r16, %r0, %r29
	.word 0xbba00020  ! 1966: FMOVs	fmovs	%f0, %f29
	.word 0xbfa00520  ! 1968: FSQRTs	fsqrt	
iob_intr_1_146:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_146), 16, 16)) -> intp(1, 0, 19)
	.word 0xb7aa4820  ! 1973: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xbba8c820  ! 1974: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xb57d8400  ! 1975: MOVR_R	movre	%r22, %r0, %r26
T1_asi_reg_wr_85:
	mov	0x3c5, %r14
	.word 0xf2f389e0  ! 1976: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb1a589e0  ! 1978: FDIVq	dis not found

	.word 0xb5a548a0  ! 1979: FSUBs	fsubs	%f21, %f0, %f26
	.word 0xb3aac820  ! 1981: FMOVGE	fmovs	%fcc1, %f0, %f25
iob_intr_1_147:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_147), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_148:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_148), 16, 16)) -> intp(1, 0, a)
T1_asi_reg_rd_74:
	mov	0x2, %r14
	.word 0xf4db8e40  ! 1986: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbb3c4000  ! 1987: SRA_R	sra 	%r17, %r0, %r29
	.word 0xb53d4000  ! 1988: SRA_R	sra 	%r21, %r0, %r26
cpu_intr_1_140:
	setx	0x2d0321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a84820  ! 1997: FMOVE	fmovs	%fcc1, %f0, %f26
iob_intr_1_149:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_149), 16, 16)) -> intp(1, 0, 10)
	.word 0xbba5c920  ! 2000: FMULs	fmuls	%f23, %f0, %f29
cpu_intr_1_141:
	setx	0x2e0028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a48840  ! 2003: FADDd	faddd	%f18, %f0, %f28
T1_asi_reg_rd_75:
	mov	0x3c8, %r14
	.word 0xf4db89e0  ! 2005: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_1_142:
	setx	0x2f0134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2046076  ! 2007: ADD_I	add 	%r17, 0x0076, %r25
iob_intr_1_150:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_150), 16, 16)) -> intp(1, 0, 3d)
cpu_intr_1_143:
	setx	0x2f0236, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_76:
	mov	0x3c6, %r14
	.word 0xf6db8e60  ! 2013: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_1_144:
	setx	0x2f0033, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_145:
	setx	0x2d013f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_146:
	setx	0x2d0234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81820  ! 2018: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xbda00520  ! 2019: FSQRTs	fsqrt	
cpu_intr_1_147:
	setx	0x2c0303, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_151:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_151), 16, 16)) -> intp(1, 0, 11)
cpu_intr_1_148:
	setx	0x2c0012, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_149:
	setx	0x2f0210, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_150:
	setx	0x2d010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb63c8000  ! 2031: XNOR_R	xnor 	%r18, %r0, %r27
cpu_intr_1_151:
	setx	0x2e0335, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_152:
	setx	0x30130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a50820  ! 2037: FADDs	fadds	%f20, %f0, %f28
cpu_intr_1_153:
	setx	0x2c0033, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_86:
	mov	0x19, %r14
	.word 0xfcf38e60  ! 2040: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbfa58860  ! 2046: FADDq	dis not found

	.word 0xbfa5c9e0  ! 2052: FDIVq	dis not found

	.word 0xbe144000  ! 2053: OR_R	or 	%r17, %r0, %r31
	.word 0xb9a80420  ! 2056: FMOVRZ	dis not found

	.word 0xb9a84820  ! 2058: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb1a58920  ! 2061: FMULs	fmuls	%f22, %f0, %f24
	.word 0xbfa00560  ! 2064: FSQRTq	fsqrt	
T1_asi_reg_rd_77:
	mov	0x3c6, %r14
	.word 0xfadb8400  ! 2065: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T1_asi_reg_wr_87:
	mov	0x3c5, %r14
	.word 0xfcf38e40  ! 2066: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T1_asi_reg_rd_78:
	mov	0x29, %r14
	.word 0xfcdb84a0  ! 2068: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb9a00560  ! 2069: FSQRTq	fsqrt	
	.word 0xb7a40820  ! 2071: FADDs	fadds	%f16, %f0, %f27
	.word 0xb9a88820  ! 2074: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xbb2df001  ! 2077: SLLX_I	sllx	%r23, 0x0001, %r29
	.word 0x9195a106  ! 2079: WRPR_PIL_I	wrpr	%r22, 0x0106, %pil
cpu_intr_1_154:
	setx	0x100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00520  ! 2087: FSQRTs	fsqrt	
	.word 0xbda00520  ! 2088: FSQRTs	fsqrt	
iob_intr_1_152:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_152), 16, 16)) -> intp(1, 0, 25)
T1_asi_reg_wr_88:
	mov	0x31, %r14
	.word 0xfaf384a0  ! 2091: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_1_155:
	setx	0x2e020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb20c4000  ! 2093: AND_R	and 	%r17, %r0, %r25
T1_asi_reg_rd_79:
	mov	0x29, %r14
	.word 0xf6db8400  ! 2095: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_1_153:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_153), 16, 16)) -> intp(1, 0, 35)
	.word 0xb8354000  ! 2100: SUBC_R	orn 	%r21, %r0, %r28
cpu_intr_1_156:
	setx	0x2d0239, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_157:
	setx	0x2d0238, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_158:
	setx	0x2e032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80820  ! 2115: FMOVN	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_89:
	mov	0x1e, %r14
	.word 0xf6f384a0  ! 2119: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T1_asi_reg_wr_90:
	mov	0x2a, %r14
	.word 0xf8f38e40  ! 2122: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_154:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_154), 16, 16)) -> intp(1, 0, 36)
	.word 0xb3518000  ! 2131: RDPR_PSTATE	<illegal instruction>
T1_asi_reg_rd_80:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 2132: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_1_159:
	setx	0x2f0308, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_160:
	setx	0x2f0028, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_155:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_155), 16, 16)) -> intp(1, 0, 13)
cpu_intr_1_161:
	setx	0x2e0307, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_156:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_156), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb9a00540  ! 2143: FSQRTd	fsqrt	
	.word 0xbf2d2001  ! 2144: SLL_I	sll 	%r20, 0x0001, %r31
cpu_intr_1_162:
	setx	0x2e0319, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_91:
	mov	0x3c3, %r14
	.word 0xf0f384a0  ! 2148: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_1_163:
	setx	0x2f032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7abc820  ! 2155: FMOVVC	fmovs	%fcc1, %f0, %f27
cpu_intr_1_164:
	setx	0x2c0023, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_81:
	mov	0xb, %r14
	.word 0xf4db8e40  ! 2159: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbba00020  ! 2164: FMOVs	fmovs	%f0, %f29
cpu_intr_1_165:
	setx	0x2d0332, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_157:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_157), 16, 16)) -> intp(1, 0, 3e)
cpu_intr_1_166:
	setx	0x2f033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00540  ! 2169: FSQRTd	fsqrt	
iob_intr_1_158:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_158), 16, 16)) -> intp(1, 0, 1d)
	.word 0xbfa40820  ! 2174: FADDs	fadds	%f16, %f0, %f31
cpu_intr_1_167:
	setx	0x2c0034, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_82:
	mov	0x2e, %r14
	.word 0xfedb84a0  ! 2176: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbb3c2001  ! 2177: SRA_I	sra 	%r16, 0x0001, %r29
T1_asi_reg_rd_83:
	mov	0x2c, %r14
	.word 0xf4db89e0  ! 2179: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xa1902002  ! 2180: WRPR_GL_I	wrpr	%r0, 0x0002, %-
T1_asi_reg_wr_92:
	mov	0x3c4, %r14
	.word 0xfaf38400  ! 2181: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T1_asi_reg_wr_93:
	mov	0x3c2, %r14
	.word 0xf4f384a0  ! 2182: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb9a4c820  ! 2183: FADDs	fadds	%f19, %f0, %f28
	.word 0xbda48840  ! 2184: FADDd	faddd	%f18, %f0, %f30
	.word 0xb3ab8820  ! 2186: FMOVPOS	fmovs	%fcc1, %f0, %f25
cpu_intr_1_168:
	setx	0x2d001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa8820  ! 2193: FMOVG	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_84:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 2197: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_169:
	setx	0x2e003a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_170:
	setx	0x2d0030, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_159:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_159), 16, 16)) -> intp(1, 0, 32)
iob_intr_1_160:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_160), 16, 16)) -> intp(1, 0, 3)
	.word 0xb694e044  ! 2213: ORcc_I	orcc 	%r19, 0x0044, %r27
cpu_intr_1_171:
	setx	0x2e000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a409a0  ! 2215: FDIVs	fdivs	%f16, %f0, %f26
	.word 0xb1a44840  ! 2220: FADDd	faddd	%f48, %f0, %f24
cpu_intr_1_172:
	setx	0x2d0302, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda94820  ! 2226: FMOVCS	fmovs	%fcc1, %f0, %f30
iob_intr_1_161:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_161), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb845e0be  ! 2235: ADDC_I	addc 	%r23, 0x00be, %r28
	.word 0xbfab0820  ! 2236: FMOVGU	fmovs	%fcc1, %f0, %f31
cpu_intr_1_173:
	setx	0x2c0209, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_94:
	mov	0x2b, %r14
	.word 0xf4f38e80  ! 2239: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb49d21c0  ! 2242: XORcc_I	xorcc 	%r20, 0x01c0, %r26
T1_asi_reg_rd_85:
	mov	0x3c3, %r14
	.word 0xfcdb89e0  ! 2245: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb3a80820  ! 2248: FMOVN	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_95:
	mov	0x10, %r14
	.word 0xf0f384a0  ! 2249: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_174:
	setx	0x2f0115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2342080  ! 2256: ORN_I	orn 	%r16, 0x0080, %r25
cpu_intr_1_175:
	setx	0x2c012f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_162:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_162), 16, 16)) -> intp(1, 0, 2e)
T1_asi_reg_wr_96:
	mov	0x35, %r14
	.word 0xfcf384a0  ! 2266: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbc15c000  ! 2273: OR_R	or 	%r23, %r0, %r30
cpu_intr_1_176:
	setx	0x2e022c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_177:
	setx	0x2d013e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_163:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_163), 16, 16)) -> intp(1, 0, 23)
	.word 0xbba589c0  ! 2279: FDIVd	fdivd	%f22, %f0, %f60
iob_intr_1_164:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_164), 16, 16)) -> intp(1, 0, 19)
	.word 0xb3a00020  ! 2283: FMOVs	fmovs	%f0, %f25
	.word 0xbcb4a14b  ! 2286: ORNcc_I	orncc 	%r18, 0x014b, %r30
T1_asi_reg_wr_97:
	mov	0x15, %r14
	.word 0xfef38e80  ! 2287: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T1_asi_reg_rd_86:
	mov	0x5, %r14
	.word 0xfadb84a0  ! 2289: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_1_178:
	setx	0x2f012a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_165:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_165), 16, 16)) -> intp(1, 0, 1e)
iob_intr_1_166:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_166), 16, 16)) -> intp(1, 0, 1f)
T1_asi_reg_wr_98:
	mov	0x3c5, %r14
	.word 0xfef38e40  ! 2299: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_167:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_167), 16, 16)) -> intp(1, 0, 28)
	.word 0xb1a448c0  ! 2306: FSUBd	fsubd	%f48, %f0, %f24
	.word 0xbc1d20c7  ! 2308: XOR_I	xor 	%r20, 0x00c7, %r30
	.word 0xbe2ca199  ! 2309: ANDN_I	andn 	%r18, 0x0199, %r31
	.word 0xbfaac820  ! 2310: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb9a509a0  ! 2311: FDIVs	fdivs	%f20, %f0, %f28
	.word 0xb9ab4820  ! 2312: FMOVCC	fmovs	%fcc1, %f0, %f28
cpu_intr_1_179:
	setx	0x330014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda548a0  ! 2316: FSUBs	fsubs	%f21, %f0, %f30
	.word 0xb3ab8820  ! 2318: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb6a4e01a  ! 2319: SUBcc_I	subcc 	%r19, 0x001a, %r27
	.word 0xbba84820  ! 2321: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb5356001  ! 2322: SRL_I	srl 	%r21, 0x0001, %r26
	.word 0xb7a81820  ! 2326: FMOVRGZ	fmovs	%fcc3, %f0, %f27
T1_asi_reg_rd_87:
	mov	0x20, %r14
	.word 0xf2db8e40  ! 2327: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_1_180:
	setx	0x310138, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_99:
	mov	0x36, %r14
	.word 0xf4f38e40  ! 2333: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_181:
	setx	0x31000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_100:
	mov	0x3c1, %r14
	.word 0xfcf38e40  ! 2336: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_168:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_168), 16, 16)) -> intp(1, 0, 8)
	.word 0xb3a40960  ! 2340: FMULq	dis not found

	.word 0xb4144000  ! 2341: OR_R	or 	%r17, %r0, %r26
	.word 0xbfa409a0  ! 2347: FDIVs	fdivs	%f16, %f0, %f31
	.word 0xb7a90820  ! 2348: FMOVLEU	fmovs	%fcc1, %f0, %f27
cpu_intr_1_182:
	setx	0x300204, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_169:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_169), 16, 16)) -> intp(1, 0, 1b)
cpu_intr_1_183:
	setx	0x330125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80820  ! 2357: FMOVN	fmovs	%fcc1, %f0, %f24
iob_intr_1_170:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_170), 16, 16)) -> intp(1, 0, 2)
iob_intr_1_171:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_171), 16, 16)) -> intp(1, 0, 15)
	.word 0xbf50c000  ! 2363: RDPR_TT	<illegal instruction>
	.word 0xbba509c0  ! 2365: FDIVd	fdivd	%f20, %f0, %f60
	lda	[%r22 + %g0] 0xf0, %f2
T1_asi_reg_rd_88:
	mov	0x8, %r14
	.word 0xfadb8400  ! 2368: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a54940  ! 2375: FMULd	fmuld	%f52, %f0, %f26
T1_asi_reg_rd_89:
	mov	0x2a, %r14
	.word 0xf0db84a0  ! 2376: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_1_172:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_172), 16, 16)) -> intp(1, 0, a)
T1_asi_reg_wr_101:
	mov	0x3c2, %r14
	.word 0xfef38e80  ! 2380: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb7a81820  ! 2381: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xb1ab4820  ! 2383: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb7a81c20  ! 2384: FMOVRGEZ	dis not found

	.word 0xb5480000  ! 2385: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
T1_asi_reg_rd_90:
	mov	0x3c8, %r14
	.word 0xfadb84a0  ! 2387: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T1_asi_reg_rd_91:
	mov	0x3c2, %r14
	.word 0xf4db8e40  ! 2388: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb1a80820  ! 2389: FMOVN	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_92:
	mov	0x14, %r14
	.word 0xf2db8e80  ! 2393: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb1a54840  ! 2396: FADDd	faddd	%f52, %f0, %f24
T1_asi_reg_wr_102:
	mov	0x3c6, %r14
	.word 0xfef38e40  ! 2403: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb43c0000  ! 2407: XNOR_R	xnor 	%r16, %r0, %r26
iob_intr_1_173:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_173), 16, 16)) -> intp(1, 0, 8)
T1_asi_reg_wr_103:
	mov	0x3c7, %r14
	.word 0xf8f384a0  ! 2411: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_1_174:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_174), 16, 16)) -> intp(1, 0, 27)
	.word 0xb7a5c9c0  ! 2417: FDIVd	fdivd	%f54, %f0, %f58
cpu_intr_1_184:
	setx	0x330038, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_185:
	setx	0x33011c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_93:
	mov	0x30, %r14
	.word 0xfedb89e0  ! 2427: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_1_175:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_175), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb9a81420  ! 2430: FMOVRNZ	dis not found

iob_intr_1_176:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_176), 16, 16)) -> intp(1, 0, 5)
	.word 0xb5a4c8a0  ! 2432: FSUBs	fsubs	%f19, %f0, %f26
T1_asi_reg_wr_104:
	mov	0x3c6, %r14
	.word 0xf2f38e60  ! 2433: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_1_186:
	setx	0x310134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c860  ! 2438: FADDq	dis not found

T1_asi_reg_wr_105:
	mov	0x3c0, %r14
	.word 0xf4f38e40  ! 2444: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_187:
	setx	0x310028, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_177:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_177), 16, 16)) -> intp(1, 0, 22)
	.word 0xbba80820  ! 2450: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb951c000  ! 2452: RDPR_TL	<illegal instruction>
	.word 0xbba5c8c0  ! 2455: FSUBd	fsubd	%f54, %f0, %f60
	.word 0xbda5c840  ! 2456: FADDd	faddd	%f54, %f0, %f30
	.word 0xb9a90820  ! 2458: FMOVLEU	fmovs	%fcc1, %f0, %f28
cpu_intr_1_188:
	setx	0x330313, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_94:
	mov	0x3c6, %r14
	.word 0xf0db8e40  ! 2462: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_178:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_178), 16, 16)) -> intp(1, 0, 17)
T1_asi_reg_rd_95:
	mov	0x3c4, %r14
	.word 0xf2db8e40  ! 2465: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbfa94820  ! 2467: FMOVCS	fmovs	%fcc1, %f0, %f31
iob_intr_1_179:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_179), 16, 16)) -> intp(1, 0, 34)
	.word 0xbfa00520  ! 2476: FSQRTs	fsqrt	
	.word 0xb4b4a0be  ! 2481: SUBCcc_I	orncc 	%r18, 0x00be, %r26
	.word 0xb9a44820  ! 2482: FADDs	fadds	%f17, %f0, %f28
	.word 0xbba58820  ! 2483: FADDs	fadds	%f22, %f0, %f29
	.word 0xbdab4820  ! 2489: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xbba9c820  ! 2491: FMOVVS	fmovs	%fcc1, %f0, %f29
cpu_intr_1_189:
	setx	0x320331, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_190:
	setx	0x32010a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_191:
	setx	0x32033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba81c20  ! 2501: FMOVRGEZ	dis not found

	.word 0xb7abc820  ! 2507: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb3a5c920  ! 2512: FMULs	fmuls	%f23, %f0, %f25
T1_asi_reg_wr_106:
	mov	0x8, %r14
	.word 0xf2f38400  ! 2517: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_1_192:
	setx	0x30003c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_96:
	mov	0x30, %r14
	.word 0xf6db89e0  ! 2520: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb1a80c20  ! 2525: FMOVRLZ	dis not found

	.word 0xbb504000  ! 2526: RDPR_TNPC	<illegal instruction>
	.word 0xb7a8c820  ! 2529: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xbba549a0  ! 2532: FDIVs	fdivs	%f21, %f0, %f29
	.word 0xb3a44960  ! 2533: FMULq	dis not found

	.word 0xb3a00540  ! 2539: FSQRTd	fsqrt	
T1_asi_reg_rd_97:
	mov	0x25, %r14
	.word 0xfedb8e40  ! 2540: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_1_193:
	setx	0x310316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a44860  ! 2543: FADDq	dis not found

cpu_intr_1_194:
	setx	0x30301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12c8000  ! 2545: SLL_R	sll 	%r18, %r0, %r24
cpu_intr_1_195:
	setx	0x300327, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_107:
	mov	0xe, %r14
	.word 0xfcf389e0  ! 2548: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_1_196:
	setx	0x310334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0bc0000  ! 2550: XNORcc_R	xnorcc 	%r16, %r0, %r24
	.word 0xb1ab0820  ! 2555: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb7a40840  ! 2557: FADDd	faddd	%f16, %f0, %f58
	.word 0xb1a81820  ! 2558: FMOVRGZ	fmovs	%fcc3, %f0, %f24
cpu_intr_1_197:
	setx	0x310002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9abc820  ! 2560: FMOVVC	fmovs	%fcc1, %f0, %f28
cpu_intr_1_198:
	setx	0x320135, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_199:
	setx	0x320034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00520  ! 2567: FSQRTs	fsqrt	
	.word 0xbda50920  ! 2569: FMULs	fmuls	%f20, %f0, %f30
cpu_intr_1_200:
	setx	0x31013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a8c820  ! 2578: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xbfa588a0  ! 2579: FSUBs	fsubs	%f22, %f0, %f31
	.word 0xbba80420  ! 2582: FMOVRZ	dis not found

iob_intr_1_180:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_180), 16, 16)) -> intp(1, 0, 30)
	.word 0xb7a549e0  ! 2586: FDIVq	dis not found

iob_intr_1_181:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_181), 16, 16)) -> intp(1, 0, 37)
	.word 0xbfa548e0  ! 2590: FSUBq	dis not found

iob_intr_1_182:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_182), 16, 16)) -> intp(1, 0, 2d)
iob_intr_1_183:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_183), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_wr_108:
	mov	0xb, %r14
	.word 0xf0f384a0  ! 2595: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T1_asi_reg_wr_109:
	mov	0x3c6, %r14
	.word 0xf0f38e60  ! 2597: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_1_184:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_184), 16, 16)) -> intp(1, 0, 29)
T1_asi_reg_rd_98:
	mov	0x1b, %r14
	.word 0xf0db8e40  ! 2599: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb3a50960  ! 2602: FMULq	dis not found

	.word 0xbbab4820  ! 2606: FMOVCC	fmovs	%fcc1, %f0, %f29
iob_intr_1_185:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_185), 16, 16)) -> intp(1, 0, 3)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbdab4820  ! 2617: FMOVCC	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_99:
	mov	0x26, %r14
	.word 0xf2db8e60  ! 2618: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb7a44940  ! 2619: FMULd	fmuld	%f48, %f0, %f58
	.word 0xb1a80820  ! 2622: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb9a81820  ! 2627: FMOVRGZ	fmovs	%fcc3, %f0, %f28
cpu_intr_1_201:
	setx	0x33022b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_186:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_186), 16, 16)) -> intp(1, 0, 11)
cpu_intr_1_202:
	setx	0x31003e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_187:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_187), 16, 16)) -> intp(1, 0, 30)
iob_intr_1_188:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_188), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_203:
	setx	0x320237, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_189:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_189), 16, 16)) -> intp(1, 0, 7)
T1_asi_reg_rd_100:
	mov	0x16, %r14
	.word 0xfedb8e40  ! 2651: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_1_204:
	setx	0x330200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb97c8400  ! 2655: MOVR_R	movre	%r18, %r0, %r28
	.word 0xb3a48920  ! 2658: FMULs	fmuls	%f18, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_205:
	setx	0x330032, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_190:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_190), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_rd_101:
	mov	0x18, %r14
	.word 0xfedb8e40  ! 2673: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb7a40820  ! 2674: FADDs	fadds	%f16, %f0, %f27
	.word 0xb8bc2011  ! 2676: XNORcc_I	xnorcc 	%r16, 0x0011, %r28
	.word 0xbda48860  ! 2678: FADDq	dis not found

	.word 0xba04a144  ! 2680: ADD_I	add 	%r18, 0x0144, %r29
	.word 0xbdab4820  ! 2682: FMOVCC	fmovs	%fcc1, %f0, %f30
iob_intr_1_191:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_191), 16, 16)) -> intp(1, 0, 2e)
iob_intr_1_192:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_192), 16, 16)) -> intp(1, 0, 22)
cpu_intr_1_206:
	setx	0x310208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8040000  ! 2700: ADD_R	add 	%r16, %r0, %r28
	.word 0xb9a5c860  ! 2701: FADDq	dis not found

	.word 0xbac5a06d  ! 2708: ADDCcc_I	addccc 	%r22, 0x006d, %r29
	.word 0xb7a9c820  ! 2711: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0x9194e04e  ! 2712: WRPR_PIL_I	wrpr	%r19, 0x004e, %pil
	.word 0xb5a84820  ! 2714: FMOVE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_207:
	setx	0x320120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00560  ! 2718: FSQRTq	fsqrt	
cpu_intr_1_208:
	setx	0x320111, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_209:
	setx	0x32012a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_210:
	setx	0x31000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00560  ! 2726: FSQRTq	fsqrt	
	.word 0xbbabc820  ! 2730: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb5a00520  ! 2732: FSQRTs	fsqrt	
	.word 0xb9abc820  ! 2735: FMOVVC	fmovs	%fcc1, %f0, %f28
iob_intr_1_193:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_193), 16, 16)) -> intp(1, 0, d)
	.word 0xb73dc000  ! 2739: SRA_R	sra 	%r23, %r0, %r27
iob_intr_1_194:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_194), 16, 16)) -> intp(1, 0, f)
iob_intr_1_195:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_195), 16, 16)) -> intp(1, 0, 26)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbba90820  ! 2751: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb9a81420  ! 2754: FMOVRNZ	dis not found

cpu_intr_1_211:
	setx	0x33002c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_212:
	setx	0x30033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a508c0  ! 2762: FSUBd	fsubd	%f20, %f0, %f28
iob_intr_1_196:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_196), 16, 16)) -> intp(1, 0, 21)
cpu_intr_1_213:
	setx	0x31032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a448e0  ! 2770: FSUBq	dis not found

cpu_intr_1_214:
	setx	0x310019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a409e0  ! 2773: FDIVq	dis not found

cpu_intr_1_215:
	setx	0x300239, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_216:
	setx	0x300301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaa4820  ! 2781: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xbba509c0  ! 2784: FDIVd	fdivd	%f20, %f0, %f60
	.word 0xbfa98820  ! 2786: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xbe0521cb  ! 2790: ADD_I	add 	%r20, 0x01cb, %r31
T1_asi_reg_wr_110:
	mov	0x19, %r14
	.word 0xfaf38e40  ! 2793: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_rd_102:
	mov	0x22, %r14
	.word 0xf2db89e0  ! 2794: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb3a588a0  ! 2796: FSUBs	fsubs	%f22, %f0, %f25
	.word 0xb9a81820  ! 2797: FMOVRGZ	fmovs	%fcc3, %f0, %f28
T1_asi_reg_wr_111:
	mov	0x3c0, %r14
	.word 0xf0f389e0  ! 2798: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xba148000  ! 2799: OR_R	or 	%r18, %r0, %r29
cpu_intr_1_217:
	setx	0x300115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaa0820  ! 2805: FMOVA	fmovs	%fcc1, %f0, %f31
iob_intr_1_197:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_197), 16, 16)) -> intp(1, 0, 32)
iob_intr_1_198:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_198), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbfa54840  ! 2815: FADDd	faddd	%f52, %f0, %f62
	lda	[%r23 + %g0] 0xf0, %f2
	.word 0xb7aa8820  ! 2820: FMOVG	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_103:
	mov	0x2d, %r14
	.word 0xfedb8e80  ! 2825: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb7a4c820  ! 2832: FADDs	fadds	%f19, %f0, %f27
iob_intr_1_199:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_199), 16, 16)) -> intp(1, 0, 25)
	.word 0xb8358000  ! 2837: ORN_R	orn 	%r22, %r0, %r28
T1_asi_reg_rd_104:
	mov	0xd, %r14
	.word 0xfcdb84a0  ! 2838: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb3a409c0  ! 2840: FDIVd	fdivd	%f16, %f0, %f56
iob_intr_1_200:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_200), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbba488c0  ! 2842: FSUBd	fsubd	%f18, %f0, %f60
	.word 0xb1a5c8a0  ! 2844: FSUBs	fsubs	%f23, %f0, %f24
	.word 0xb5a488a0  ! 2848: FSUBs	fsubs	%f18, %f0, %f26
T1_asi_reg_wr_112:
	mov	0x3c0, %r14
	.word 0xf0f38e40  ! 2849: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb7a90820  ! 2850: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb7a00560  ! 2851: FSQRTq	fsqrt	
cpu_intr_1_218:
	setx	0x350336, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_105:
	mov	0x37, %r14
	.word 0xfcdb84a0  ! 2856: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_1_219:
	setx	0x340326, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_220:
	setx	0x34033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_201:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_201), 16, 16)) -> intp(1, 0, 18)
	.word 0xbba4c860  ! 2865: FADDq	dis not found

	.word 0xb1a8c820  ! 2869: FMOVL	fmovs	%fcc1, %f0, %f24
iob_intr_1_202:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_202), 16, 16)) -> intp(1, 0, 38)
	.word 0xb7a48960  ! 2873: FMULq	dis not found

T1_asi_reg_wr_113:
	mov	0x20, %r14
	.word 0xf8f389e0  ! 2876: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb5a88820  ! 2879: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb5a449c0  ! 2882: FDIVd	fdivd	%f48, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_203:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_203), 16, 16)) -> intp(1, 0, e)
	.word 0xb4bc4000  ! 2886: XNORcc_R	xnorcc 	%r17, %r0, %r26
	.word 0xb7a00540  ! 2887: FSQRTd	fsqrt	
	.word 0xbdaa4820  ! 2889: FMOVNE	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_114:
	mov	0x2f, %r14
	.word 0xfcf38e40  ! 2895: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_1_221:
	setx	0x37011e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_204:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_204), 16, 16)) -> intp(1, 0, 33)
	.word 0xb5a00520  ! 2898: FSQRTs	fsqrt	
cpu_intr_1_222:
	setx	0x370225, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_115:
	mov	0x3c7, %r14
	.word 0xf6f384a0  ! 2900: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_1_223:
	setx	0x360118, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_106:
	mov	0xc, %r14
	.word 0xfcdb8e60  ! 2903: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T1_asi_reg_rd_107:
	mov	0x38, %r14
	.word 0xf8db8e40  ! 2904: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_wr_116:
	mov	0x2d, %r14
	.word 0xf6f38400  ! 2906: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb9a589a0  ! 2907: FDIVs	fdivs	%f22, %f0, %f28
	.word 0xbfa80c20  ! 2910: FMOVRLZ	dis not found

	.word 0xb7aac820  ! 2911: FMOVGE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_117:
	mov	0x2e, %r14
	.word 0xf4f384a0  ! 2912: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb3a88820  ! 2913: FMOVLE	fmovs	%fcc1, %f0, %f25
iob_intr_1_205:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_205), 16, 16)) -> intp(1, 0, 2c)
iob_intr_1_206:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_206), 16, 16)) -> intp(1, 0, 19)
cpu_intr_1_224:
	setx	0x34000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaac820  ! 2921: FMOVGE	fmovs	%fcc1, %f0, %f29
iob_intr_1_207:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_207), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb5a80820  ! 2927: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xb3a80420  ! 2929: FMOVRZ	dis not found

T1_asi_reg_rd_108:
	mov	0x32, %r14
	.word 0xf6db8e40  ! 2931: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbfa80820  ! 2933: FMOVN	fmovs	%fcc1, %f0, %f31
cpu_intr_1_225:
	setx	0x36023a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_118:
	mov	0x16, %r14
	.word 0xf6f38e40  ! 2937: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_rd_109:
	mov	0x24, %r14
	.word 0xf2db89e0  ! 2939: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb3a509c0  ! 2943: FDIVd	fdivd	%f20, %f0, %f56
	.word 0xb9a549a0  ! 2945: FDIVs	fdivs	%f21, %f0, %f28
	.word 0xb9ab4820  ! 2946: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb7a90820  ! 2950: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb9a409c0  ! 2951: FDIVd	fdivd	%f16, %f0, %f28
	.word 0xbba80820  ! 2954: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xbfa81c20  ! 2955: FMOVRGEZ	dis not found

cpu_intr_1_226:
	setx	0x36013c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_227:
	setx	0x370331, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_208:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_208), 16, 16)) -> intp(1, 0, c)
T1_asi_reg_rd_110:
	mov	0x3c7, %r14
	.word 0xfedb8e60  ! 2961: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_1_209:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_209), 16, 16)) -> intp(1, 0, 13)
T1_asi_reg_rd_111:
	mov	0xf, %r14
	.word 0xfcdb8e40  ! 2965: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_210:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_210), 16, 16)) -> intp(1, 0, 30)
T1_asi_reg_rd_112:
	mov	0x37, %r14
	.word 0xf4db8e60  ! 2967: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T1_asi_reg_wr_119:
	mov	0xa, %r14
	.word 0xf0f384a0  ! 2969: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_1_211:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_211), 16, 16)) -> intp(1, 0, 28)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7ab4820  ! 2974: FMOVCC	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_113:
	mov	0x1d, %r14
	.word 0xf4db8e40  ! 2976: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_1_228:
	setx	0x370211, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_114:
	mov	0x1f, %r14
	.word 0xfcdb8e40  ! 2982: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_212:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_212), 16, 16)) -> intp(1, 0, 17)
	.word 0x8f902000  ! 2986: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xb9a8c820  ! 2989: FMOVL	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a81c20  ! 2992: FMOVRGEZ	dis not found

iob_intr_1_213:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_213), 16, 16)) -> intp(1, 0, f)
	.word 0xb7ab4820  ! 2996: FMOVCC	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_120:
	mov	0x3c3, %r14
	.word 0xf6f38e40  ! 3000: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_229:
	setx	0x340021, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_115:
	mov	0x27, %r14
	.word 0xf4db89e0  ! 3003: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb1ab8820  ! 3004: FMOVPOS	fmovs	%fcc1, %f0, %f24
iob_intr_1_214:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_214), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb7abc820  ! 3006: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb4a42062  ! 3007: SUBcc_I	subcc 	%r16, 0x0062, %r26
	.word 0xb9a5c860  ! 3011: FADDq	dis not found

cpu_intr_1_230:
	setx	0x37002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00560  ! 3018: FSQRTq	fsqrt	
iob_intr_1_215:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_215), 16, 16)) -> intp(1, 0, 4)
iob_intr_1_216:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_216), 16, 16)) -> intp(1, 0, 8)
	.word 0xb5a50820  ! 3021: FADDs	fadds	%f20, %f0, %f26
cpu_intr_1_231:
	setx	0x34030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a588a0  ! 3026: FSUBs	fsubs	%f22, %f0, %f25
	.word 0xbba4c9e0  ! 3028: FDIVq	dis not found

T1_asi_reg_rd_116:
	mov	0x1c, %r14
	.word 0xfedb89e0  ! 3029: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb5a488c0  ! 3030: FSUBd	fsubd	%f18, %f0, %f26
T1_asi_reg_rd_117:
	mov	0x1c, %r14
	.word 0xfadb8e40  ! 3032: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbda90820  ! 3033: FMOVLEU	fmovs	%fcc1, %f0, %f30
iob_intr_1_217:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_217), 16, 16)) -> intp(1, 0, 21)
	.word 0xb8ada11d  ! 3038: ANDNcc_I	andncc 	%r22, 0x011d, %r28
cpu_intr_1_232:
	setx	0x34033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_121:
	mov	0x3, %r14
	.word 0xfcf38400  ! 3041: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0x9194a1b0  ! 3044: WRPR_PIL_I	wrpr	%r18, 0x01b0, %pil
	.word 0xb7a4c940  ! 3047: FMULd	fmuld	%f50, %f0, %f58
	.word 0xbba81820  ! 3050: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xbf641800  ! 3051: MOVcc_R	<illegal instruction>
iob_intr_1_218:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_218), 16, 16)) -> intp(1, 0, 30)
cpu_intr_1_233:
	setx	0x370201, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r16 + %g0] 0xf0, %f2
cpu_intr_1_234:
	setx	0x350133, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_118:
	mov	0x3c8, %r14
	.word 0xfedb8e80  ! 3058: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_1_219:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_219), 16, 16)) -> intp(1, 0, 0)
iob_intr_1_220:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_220), 16, 16)) -> intp(1, 0, 3c)
iob_intr_1_221:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_221), 16, 16)) -> intp(1, 0, 3f)
iob_intr_1_222:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_222), 16, 16)) -> intp(1, 0, 29)
iob_intr_1_223:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_223), 16, 16)) -> intp(1, 0, 19)
	.word 0xbfa80820  ! 3069: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_119:
	mov	0xd, %r14
	.word 0xf4db8400  ! 3070: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_1_224:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_224), 16, 16)) -> intp(1, 0, 5)
	.word 0xbba81820  ! 3072: FMOVRGZ	fmovs	%fcc3, %f0, %f29
T1_asi_reg_rd_120:
	mov	0x24, %r14
	.word 0xf4db8e40  ! 3073: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbfa88820  ! 3075: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb0240000  ! 3076: SUB_R	sub 	%r16, %r0, %r24
cpu_intr_1_235:
	setx	0x370001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a5c8a0  ! 3079: FSUBs	fsubs	%f23, %f0, %f26
cpu_intr_1_236:
	setx	0x370324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbea44000  ! 3081: SUBcc_R	subcc 	%r17, %r0, %r31
	.word 0xbba44840  ! 3082: FADDd	faddd	%f48, %f0, %f60
	.word 0xb1a80820  ! 3084: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
iob_intr_1_225:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_225), 16, 16)) -> intp(1, 0, 2c)
cpu_intr_1_237:
	setx	0x36012d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_238:
	setx	0x360108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c8c0  ! 3091: FSUBd	fsubd	%f50, %f0, %f62
T1_asi_reg_rd_121:
	mov	0x3, %r14
	.word 0xfcdb8400  ! 3092: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbbaa0820  ! 3093: FMOVA	fmovs	%fcc1, %f0, %f29
cpu_intr_1_239:
	setx	0x340311, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_240:
	setx	0x370106, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_226:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_226), 16, 16)) -> intp(1, 0, 5)
cpu_intr_1_241:
	setx	0x36023c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_122:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 3104: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbda94820  ! 3105: FMOVCS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_123:
	mov	0x16, %r14
	.word 0xf6db8e40  ! 3111: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbc4460d3  ! 3113: ADDC_I	addc 	%r17, 0x00d3, %r30
	.word 0xbc944000  ! 3114: ORcc_R	orcc 	%r17, %r0, %r30
	lda	[%r16 + %g0] 0xf0, %f2
iob_intr_1_227:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_227), 16, 16)) -> intp(1, 0, 3d)
	.word 0xbf518000  ! 3123: RDPR_PSTATE	<illegal instruction>
iob_intr_1_228:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_228), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_rd_124:
	mov	0x21, %r14
	.word 0xfadb8e80  ! 3127: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_1_229:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_229), 16, 16)) -> intp(1, 0, 0)
	.word 0xbfaa8820  ! 3133: FMOVG	fmovs	%fcc1, %f0, %f31
cpu_intr_1_242:
	setx	0x360131, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_230:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_230), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_rd_125:
	mov	0x0, %r14
	.word 0xf2db84a0  ! 3137: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T1_asi_reg_wr_122:
	mov	0x3c7, %r14
	.word 0xfaf38e60  ! 3141: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb7a549e0  ! 3143: FDIVq	dis not found

	.word 0xb9ab4820  ! 3144: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xbba58920  ! 3149: FMULs	fmuls	%f22, %f0, %f29
	.word 0xb9a00520  ! 3150: FSQRTs	fsqrt	
	.word 0xb7a00520  ! 3151: FSQRTs	fsqrt	
	.word 0xbdaa8820  ! 3152: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb5a88820  ! 3156: FMOVLE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_123:
	mov	0x3c0, %r14
	.word 0xf6f38e80  ! 3157: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T1_asi_reg_wr_124:
	mov	0x3, %r14
	.word 0xf8f38e40  ! 3159: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_243:
	setx	0x350324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb61d61b1  ! 3162: XOR_I	xor 	%r21, 0x01b1, %r27
	.word 0xbda44840  ! 3167: FADDd	faddd	%f48, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_rd_126:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 3173: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb1a9c820  ! 3174: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb5a80c20  ! 3179: FMOVRLZ	dis not found

	.word 0x879560b5  ! 3180: WRPR_TT_I	wrpr	%r21, 0x00b5, %tt
iob_intr_1_231:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_231), 16, 16)) -> intp(1, 0, 4)
cpu_intr_1_244:
	setx	0x340230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a94820  ! 3186: FMOVCS	fmovs	%fcc1, %f0, %f24
cpu_intr_1_245:
	setx	0x370037, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_246:
	setx	0x36030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00540  ! 3191: FSQRTd	fsqrt	
cpu_intr_1_247:
	setx	0x34032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_248:
	setx	0x37021b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_232:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_232), 16, 16)) -> intp(1, 0, 21)
	.word 0xbcbda16f  ! 3198: XNORcc_I	xnorcc 	%r22, 0x016f, %r30
	.word 0xb5a80820  ! 3199: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
iob_intr_1_233:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_233), 16, 16)) -> intp(1, 0, 2f)
iob_intr_1_234:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_234), 16, 16)) -> intp(1, 0, 18)
	.word 0xb405a121  ! 3202: ADD_I	add 	%r22, 0x0121, %r26
	.word 0xbda90820  ! 3203: FMOVLEU	fmovs	%fcc1, %f0, %f30
iob_intr_1_235:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_235), 16, 16)) -> intp(1, 0, 2)
	.word 0xbba81420  ! 3208: FMOVRNZ	dis not found

	.word 0xb5a90820  ! 3209: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xb5a5c9e0  ! 3212: FDIVq	dis not found

cpu_intr_1_249:
	setx	0x35001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x839461c8  ! 3218: WRPR_TNPC_I	wrpr	%r17, 0x01c8, %tnpc
	.word 0xb1a5c960  ! 3219: FMULq	dis not found

T1_asi_reg_rd_127:
	mov	0x2, %r14
	.word 0xf0db8e40  ! 3220: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_236:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_236), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb9abc820  ! 3225: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xb3a80820  ! 3227: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb1a5c840  ! 3228: FADDd	faddd	%f54, %f0, %f24
	.word 0xb2aca001  ! 3229: ANDNcc_I	andncc 	%r18, 0x0001, %r25
cpu_intr_1_250:
	setx	0x340024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a488e0  ! 3231: FSUBq	dis not found

	.word 0xbda54960  ! 3233: FMULq	dis not found

iob_intr_1_237:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_237), 16, 16)) -> intp(1, 0, a)
cpu_intr_1_251:
	setx	0x35033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda48940  ! 3238: FMULd	fmuld	%f18, %f0, %f30
T1_asi_reg_rd_128:
	mov	0x29, %r14
	.word 0xfedb8e80  ! 3239: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb5aa8820  ! 3241: FMOVG	fmovs	%fcc1, %f0, %f26
iob_intr_1_238:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_238), 16, 16)) -> intp(1, 0, 1c)
T1_asi_reg_rd_129:
	mov	0x3c2, %r14
	.word 0xf0db8e60  ! 3244: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb1a48920  ! 3247: FMULs	fmuls	%f18, %f0, %f24
cpu_intr_1_252:
	setx	0x37003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba81820  ! 3252: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb7a00540  ! 3253: FSQRTd	fsqrt	
	.word 0xbb643801  ! 3256: MOVcc_I	<illegal instruction>
	.word 0xb9a80c20  ! 3258: FMOVRLZ	dis not found

iob_intr_1_239:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_239), 16, 16)) -> intp(1, 0, 3)
	.word 0xbda00560  ! 3267: FSQRTq	fsqrt	
	.word 0xb1a408a0  ! 3271: FSUBs	fsubs	%f16, %f0, %f24
iob_intr_1_240:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_240), 16, 16)) -> intp(1, 0, b)
iob_intr_1_241:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_241), 16, 16)) -> intp(1, 0, 3a)
	.word 0xbda00520  ! 3281: FSQRTs	fsqrt	
	.word 0xbda54820  ! 3282: FADDs	fadds	%f21, %f0, %f30
T1_asi_reg_wr_125:
	mov	0x29, %r14
	.word 0xf8f389e0  ! 3286: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbbaa8820  ! 3289: FMOVG	fmovs	%fcc1, %f0, %f29
cpu_intr_1_253:
	setx	0x390020, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_126:
	mov	0x3c8, %r14
	.word 0xf8f38e40  ! 3291: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_1_242:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_242), 16, 16)) -> intp(1, 0, 20)
	.word 0xbdaac820  ! 3293: FMOVGE	fmovs	%fcc1, %f0, %f30
cpu_intr_1_254:
	setx	0x380128, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_255:
	setx	0x390008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a4c9e0  ! 3296: FDIVq	dis not found

T1_asi_reg_rd_130:
	mov	0x0, %r14
	.word 0xf0db8e80  ! 3300: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_1_243:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_243), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb7aa4820  ! 3303: FMOVNE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_131:
	mov	0xc, %r14
	.word 0xf2db8e40  ! 3304: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_rd_132:
	mov	0x3c1, %r14
	.word 0xf6db8400  ! 3306: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_1_256:
	setx	0x380108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80820  ! 3309: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xbba90820  ! 3310: FMOVLEU	fmovs	%fcc1, %f0, %f29
iob_intr_1_244:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_244), 16, 16)) -> intp(1, 0, 2f)
	.word 0xbfa00020  ! 3313: FMOVs	fmovs	%f0, %f31
cpu_intr_1_257:
	setx	0x380316, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_258:
	setx	0x2011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbca46145  ! 3318: SUBcc_I	subcc 	%r17, 0x0145, %r30
cpu_intr_1_259:
	setx	0x38022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00020  ! 3320: FMOVs	fmovs	%f0, %f25
cpu_intr_1_260:
	setx	0x39010c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_261:
	setx	0x38003e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_262:
	setx	0x38030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r23 + %g0] 0xf0, %f2
	.word 0xb1aa8820  ! 3332: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb1a80c20  ! 3333: FMOVRLZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_wr_127:
	mov	0x36, %r14
	.word 0xfaf38400  ! 3338: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbbaac820  ! 3340: FMOVGE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_263:
	setx	0x380027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_264:
	setx	0x38032b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_128:
	mov	0xa, %r14
	.word 0xf2f389e0  ! 3351: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T1_asi_reg_rd_133:
	mov	0x25, %r14
	.word 0xf8db8e40  ! 3356: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb7a00540  ! 3357: FSQRTd	fsqrt	
	.word 0xb5abc820  ! 3359: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xbfa88820  ! 3363: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb9a00540  ! 3364: FSQRTd	fsqrt	
	.word 0xb82d4000  ! 3366: ANDN_R	andn 	%r21, %r0, %r28
iob_intr_1_245:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_245), 16, 16)) -> intp(1, 0, f)
cpu_intr_1_265:
	setx	0x390039, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_246:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_246), 16, 16)) -> intp(1, 0, 31)
cpu_intr_1_266:
	setx	0x3b031d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_267:
	setx	0x38022b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_268:
	setx	0x38003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4c5c000  ! 3380: ADDCcc_R	addccc 	%r23, %r0, %r26
iob_intr_1_247:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_247), 16, 16)) -> intp(1, 0, 13)
	.word 0xbec4a0bf  ! 3383: ADDCcc_I	addccc 	%r18, 0x00bf, %r31
	lda	[%r23 + %g0] 0xf0, %f2
cpu_intr_1_269:
	setx	0x3b030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4b46002  ! 3388: ORNcc_I	orncc 	%r17, 0x0002, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xba35608f  ! 3395: ORN_I	orn 	%r21, 0x008f, %r29
	.word 0xb7a00560  ! 3397: FSQRTq	fsqrt	
	.word 0xbe0520be  ! 3398: ADD_I	add 	%r20, 0x00be, %r31
iob_intr_1_248:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_248), 16, 16)) -> intp(1, 0, 2)
cpu_intr_1_270:
	setx	0x380325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aac820  ! 3402: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb1abc820  ! 3404: FMOVVC	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_134:
	mov	0x10, %r14
	.word 0xf2db8e40  ! 3406: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb5a58920  ! 3407: FMULs	fmuls	%f22, %f0, %f26
iob_intr_1_249:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_249), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb1a489c0  ! 3412: FDIVd	fdivd	%f18, %f0, %f24
cpu_intr_1_271:
	setx	0x3b0331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a84820  ! 3417: FMOVE	fmovs	%fcc1, %f0, %f24
cpu_intr_1_272:
	setx	0x3a0013, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_135:
	mov	0x5, %r14
	.word 0xf6db8e80  ! 3419: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T1_asi_reg_rd_136:
	mov	0x17, %r14
	.word 0xfedb8e60  ! 3420: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_1_250:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_250), 16, 16)) -> intp(1, 0, 27)
T1_asi_reg_rd_137:
	mov	0x35, %r14
	.word 0xf2db8e40  ! 3424: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbfa40940  ! 3425: FMULd	fmuld	%f16, %f0, %f62
iob_intr_1_251:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_251), 16, 16)) -> intp(1, 0, 14)
	.word 0xbba00540  ! 3427: FSQRTd	fsqrt	
T1_asi_reg_rd_138:
	mov	0x3c3, %r14
	.word 0xf0db8e60  ! 3428: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb52da001  ! 3432: SLL_I	sll 	%r22, 0x0001, %r26
T1_asi_reg_wr_129:
	mov	0x12, %r14
	.word 0xf4f38e60  ! 3433: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T1_asi_reg_wr_130:
	mov	0x25, %r14
	.word 0xf6f38e80  ! 3434: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T1_asi_reg_wr_131:
	mov	0xb, %r14
	.word 0xf8f389e0  ! 3435: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T1_asi_reg_rd_139:
	mov	0x3c0, %r14
	.word 0xfcdb8e60  ! 3438: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbfa549a0  ! 3440: FDIVs	fdivs	%f21, %f0, %f31
T1_asi_reg_rd_140:
	mov	0x3c6, %r14
	.word 0xfadb8e80  ! 3441: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T1_asi_reg_wr_132:
	mov	0x2d, %r14
	.word 0xfcf38e40  ! 3443: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_252:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_252), 16, 16)) -> intp(1, 0, b)
	.word 0xbfa00520  ! 3450: FSQRTs	fsqrt	
cpu_intr_1_273:
	setx	0x380206, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_133:
	mov	0x2e, %r14
	.word 0xfaf38e60  ! 3452: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T1_asi_reg_wr_134:
	mov	0x9, %r14
	.word 0xf8f384a0  ! 3454: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbba5c820  ! 3456: FADDs	fadds	%f23, %f0, %f29
	.word 0xb5a81420  ! 3458: FMOVRNZ	dis not found

T1_asi_reg_wr_135:
	mov	0x17, %r14
	.word 0xf6f38e40  ! 3460: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb1a84820  ! 3462: FMOVE	fmovs	%fcc1, %f0, %f24
iob_intr_1_253:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_253), 16, 16)) -> intp(1, 0, 3d)
cpu_intr_1_274:
	setx	0x3a010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbabc820  ! 3468: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb4b5a02f  ! 3470: ORNcc_I	orncc 	%r22, 0x002f, %r26
	.word 0xb3a81420  ! 3472: FMOVRNZ	dis not found

T1_asi_reg_rd_141:
	mov	0x29, %r14
	.word 0xf8db8e40  ! 3474: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb83ce146  ! 3476: XNOR_I	xnor 	%r19, 0x0146, %r28
	.word 0xbda00040  ! 3478: FMOVd	fmovd	%f0, %f30
T1_asi_reg_rd_142:
	mov	0x3c3, %r14
	.word 0xfedb8e40  ! 3479: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_1_275:
	setx	0x3a0031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba9c820  ! 3483: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb9a58920  ! 3485: FMULs	fmuls	%f22, %f0, %f28
iob_intr_1_254:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_254), 16, 16)) -> intp(1, 0, 2)
	.word 0x8795e033  ! 3490: WRPR_TT_I	wrpr	%r23, 0x0033, %tt
	.word 0xbda4c960  ! 3491: FMULq	dis not found

iob_intr_1_255:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_255), 16, 16)) -> intp(1, 0, 35)
	.word 0xbda58840  ! 3498: FADDd	faddd	%f22, %f0, %f30
	.word 0x8394e03c  ! 3500: WRPR_TNPC_I	wrpr	%r19, 0x003c, %tnpc
	.word 0xbbabc820  ! 3503: FMOVVC	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_136:
	mov	0x3c5, %r14
	.word 0xfef38e60  ! 3506: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbbaa8820  ! 3509: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb5a48840  ! 3511: FADDd	faddd	%f18, %f0, %f26
	.word 0xb23dc000  ! 3516: XNOR_R	xnor 	%r23, %r0, %r25
cpu_intr_1_276:
	setx	0x380014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba90820  ! 3519: FMOVLEU	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_137:
	mov	0x2f, %r14
	.word 0xf2f384a0  ! 3520: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb7abc820  ! 3521: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xbf34e001  ! 3522: SRL_I	srl 	%r19, 0x0001, %r31
T1_asi_reg_rd_143:
	mov	0x3c3, %r14
	.word 0xf6db8e60  ! 3523: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbda44820  ! 3524: FADDs	fadds	%f17, %f0, %f30
T1_asi_reg_wr_138:
	mov	0x15, %r14
	.word 0xf2f384a0  ! 3525: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T1_asi_reg_rd_144:
	mov	0x33, %r14
	.word 0xf8db8e40  ! 3526: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb5a44860  ! 3528: FADDq	dis not found

T1_asi_reg_wr_139:
	mov	0x3c6, %r14
	.word 0xfcf38e80  ! 3529: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbda508a0  ! 3530: FSUBs	fsubs	%f20, %f0, %f30
cpu_intr_1_277:
	setx	0x380302, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_140:
	mov	0x25, %r14
	.word 0xfaf38e40  ! 3535: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb7a00040  ! 3536: FMOVd	fmovd	%f0, %f58
iob_intr_1_256:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_256), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_257:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_257), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb5a409e0  ! 3546: FDIVq	dis not found

	.word 0xb7a548a0  ! 3549: FSUBs	fsubs	%f21, %f0, %f27
	.word 0xb3a54920  ! 3551: FMULs	fmuls	%f21, %f0, %f25
	.word 0xb7a80820  ! 3552: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xb1a98820  ! 3554: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb7aa4820  ! 3555: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb9ab4820  ! 3556: FMOVCC	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_141:
	mov	0x3c1, %r14
	.word 0xf6f389e0  ! 3557: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb1ab8820  ! 3558: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb7a98820  ! 3562: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xbe45c000  ! 3563: ADDC_R	addc 	%r23, %r0, %r31
	.word 0xbdaac820  ! 3565: FMOVGE	fmovs	%fcc1, %f0, %f30
cpu_intr_1_278:
	setx	0x3a0001, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_258:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_258), 16, 16)) -> intp(1, 0, 31)
	.word 0xbda88820  ! 3576: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xbfa80420  ! 3577: FMOVRZ	dis not found

T1_asi_reg_wr_142:
	mov	0x2, %r14
	.word 0xfef389e0  ! 3578: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_1_279:
	setx	0x3b011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80820  ! 3580: FMOVN	fmovs	%fcc1, %f0, %f27
cpu_intr_1_280:
	setx	0x3b0008, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_281:
	setx	0x3a031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa81820  ! 3583: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbba8c820  ! 3589: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xbba80820  ! 3590: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xb9ab4820  ! 3591: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xbfa40920  ! 3592: FMULs	fmuls	%f16, %f0, %f31
	.word 0xb32df001  ! 3594: SLLX_I	sllx	%r23, 0x0001, %r25
T1_asi_reg_rd_145:
	mov	0x1d, %r14
	.word 0xfedb8e80  ! 3597: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb3a00520  ! 3598: FSQRTs	fsqrt	
T1_asi_reg_wr_143:
	mov	0x3c1, %r14
	.word 0xf2f384a0  ! 3600: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbba94820  ! 3603: FMOVCS	fmovs	%fcc1, %f0, %f29
cpu_intr_1_282:
	setx	0x39023c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_283:
	setx	0x3b020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa81c20  ! 3607: FMOVRGEZ	dis not found

T1_asi_reg_rd_146:
	mov	0x3c8, %r14
	.word 0xf0db8e40  ! 3608: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_259:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_259), 16, 16)) -> intp(1, 0, a)
T1_asi_reg_rd_147:
	mov	0x3c2, %r14
	.word 0xf6db84a0  ! 3612: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb3a00020  ! 3613: FMOVs	fmovs	%f0, %f25
cpu_intr_1_284:
	setx	0x390230, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_148:
	mov	0x1d, %r14
	.word 0xfedb89e0  ! 3620: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb7a588a0  ! 3624: FSUBs	fsubs	%f22, %f0, %f27
cpu_intr_1_285:
	setx	0x3a0315, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_144:
	mov	0x7, %r14
	.word 0xf6f38e40  ! 3629: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbaad2073  ! 3631: ANDNcc_I	andncc 	%r20, 0x0073, %r29
iob_intr_1_260:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_260), 16, 16)) -> intp(1, 0, 3d)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_rd_149:
	mov	0x5, %r14
	.word 0xf0db8e80  ! 3636: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_1_286:
	setx	0x39033e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_287:
	setx	0x3a0009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa90820  ! 3641: FMOVLEU	fmovs	%fcc1, %f0, %f31
cpu_intr_1_288:
	setx	0x3b0217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00520  ! 3643: FSQRTs	fsqrt	
T1_asi_reg_rd_150:
	mov	0x36, %r14
	.word 0xfedb84a0  ! 3645: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbdab4820  ! 3648: FMOVCC	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_151:
	mov	0x19, %r14
	.word 0xf4db84a0  ! 3649: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb9a48940  ! 3651: FMULd	fmuld	%f18, %f0, %f28
cpu_intr_1_289:
	setx	0x39032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81420  ! 3654: FMOVRNZ	dis not found

	.word 0xb20c607f  ! 3656: AND_I	and 	%r17, 0x007f, %r25
	.word 0xb1a549c0  ! 3658: FDIVd	fdivd	%f52, %f0, %f24
T1_asi_reg_wr_145:
	mov	0x1, %r14
	.word 0xf2f38400  ! 3661: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbba00540  ! 3667: FSQRTd	fsqrt	
	.word 0xbba98820  ! 3668: FMOVNEG	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_146:
	mov	0x4, %r14
	.word 0xf2f384a0  ! 3669: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb1a58920  ! 3671: FMULs	fmuls	%f22, %f0, %f24
	.word 0xbda80c20  ! 3673: FMOVRLZ	dis not found

T1_asi_reg_wr_147:
	mov	0x33, %r14
	.word 0xf2f38e40  ! 3676: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_1_290:
	setx	0x390114, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_148:
	mov	0x2f, %r14
	.word 0xf6f38e60  ! 3679: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_1_261:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_261), 16, 16)) -> intp(1, 0, 24)
iob_intr_1_262:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_262), 16, 16)) -> intp(1, 0, 35)
T1_asi_reg_wr_149:
	mov	0x17, %r14
	.word 0xfcf384a0  ! 3689: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb3ab8820  ! 3691: FMOVPOS	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_152:
	mov	0x3c0, %r14
	.word 0xfadb84a0  ! 3696: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb5a50820  ! 3697: FADDs	fadds	%f20, %f0, %f26
iob_intr_1_263:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_263), 16, 16)) -> intp(1, 0, 1e)
T1_asi_reg_rd_153:
	mov	0xc, %r14
	.word 0xf2db8e40  ! 3701: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_wr_150:
	mov	0x3c6, %r14
	.word 0xf6f38400  ! 3703: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbbab0820  ! 3704: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb5a4c8c0  ! 3709: FSUBd	fsubd	%f50, %f0, %f26
iob_intr_1_264:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_264), 16, 16)) -> intp(1, 0, 1c)
T1_asi_reg_rd_154:
	mov	0x31, %r14
	.word 0xfedb8e60  ! 3712: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T1_asi_reg_wr_151:
	mov	0x38, %r14
	.word 0xf0f38400  ! 3720: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbba81820  ! 3721: FMOVRGZ	fmovs	%fcc3, %f0, %f29
T1_asi_reg_rd_155:
	mov	0x11, %r14
	.word 0xfadb8e80  ! 3722: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xbfab4820  ! 3725: FMOVCC	fmovs	%fcc1, %f0, %f31
iob_intr_1_265:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_265), 16, 16)) -> intp(1, 0, 12)
	.word 0xb1a589e0  ! 3730: FDIVq	dis not found

	.word 0xb13cf001  ! 3732: SRAX_I	srax	%r19, 0x0001, %r24
cpu_intr_1_291:
	setx	0x3e0033, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_292:
	setx	0x3f011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a84820  ! 3739: FMOVE	fmovs	%fcc1, %f0, %f24
iob_intr_1_266:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_266), 16, 16)) -> intp(1, 0, 2)
	.word 0xbfa81820  ! 3745: FMOVRGZ	fmovs	%fcc3, %f0, %f31
cpu_intr_1_293:
	setx	0x3e001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc25a1e9  ! 3751: SUB_I	sub 	%r22, 0x01e9, %r30
	.word 0xb89ce1af  ! 3752: XORcc_I	xorcc 	%r19, 0x01af, %r28
T1_asi_reg_rd_156:
	mov	0x9, %r14
	.word 0xf8db8e80  ! 3753: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_1_294:
	setx	0x3d032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_152:
	mov	0x3c8, %r14
	.word 0xf2f38400  ! 3757: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_1_267:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_267), 16, 16)) -> intp(1, 0, 34)
iob_intr_1_268:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_268), 16, 16)) -> intp(1, 0, f)
iob_intr_1_269:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_269), 16, 16)) -> intp(1, 0, 1)
	.word 0xb9a81420  ! 3766: FMOVRNZ	dis not found

	.word 0xb4948000  ! 3767: ORcc_R	orcc 	%r18, %r0, %r26
	.word 0xb52d0000  ! 3768: SLL_R	sll 	%r20, %r0, %r26
cpu_intr_1_295:
	setx	0x3f0021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8f902001  ! 3771: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xb3a81c20  ! 3773: FMOVRGEZ	dis not found

	.word 0xbfa549a0  ! 3779: FDIVs	fdivs	%f21, %f0, %f31
cpu_intr_1_296:
	setx	0x3e0223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0acc000  ! 3784: ANDNcc_R	andncc 	%r19, %r0, %r24
T1_asi_reg_rd_157:
	mov	0x36, %r14
	.word 0xfcdb8400  ! 3785: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_1_270:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_270), 16, 16)) -> intp(1, 0, 18)
iob_intr_1_271:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_271), 16, 16)) -> intp(1, 0, 27)
	.word 0xb884e088  ! 3793: ADDcc_I	addcc 	%r19, 0x0088, %r28
T1_asi_reg_rd_158:
	mov	0x3c3, %r14
	.word 0xfedb8400  ! 3794: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbba58920  ! 3798: FMULs	fmuls	%f22, %f0, %f29
	.word 0xb4b42027  ! 3799: ORNcc_I	orncc 	%r16, 0x0027, %r26
iob_intr_1_272:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_272), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb3a549a0  ! 3803: FDIVs	fdivs	%f21, %f0, %f25
cpu_intr_1_297:
	setx	0x3c0215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa81c20  ! 3806: FMOVRGEZ	dis not found

cpu_intr_1_298:
	setx	0x3c0124, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_299:
	setx	0x3e0326, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_159:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 3810: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_rd_160:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 3811: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_1_273:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_273), 16, 16)) -> intp(1, 0, f)
cpu_intr_1_300:
	setx	0x3f011e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_274:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_274), 16, 16)) -> intp(1, 0, 18)
T1_asi_reg_wr_153:
	mov	0x0, %r14
	.word 0xf0f38e80  ! 3822: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb4450000  ! 3823: ADDC_R	addc 	%r20, %r0, %r26
	.word 0xb3ab0820  ! 3824: FMOVGU	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_161:
	mov	0x11, %r14
	.word 0xfcdb89e0  ! 3826: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb9ab4820  ! 3830: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xbe344000  ! 3833: SUBC_R	orn 	%r17, %r0, %r31
T1_asi_reg_rd_162:
	mov	0x2d, %r14
	.word 0xf0db8400  ! 3835: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_1_301:
	setx	0x3e0307, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_275:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_275), 16, 16)) -> intp(1, 0, 31)
	.word 0xb1a81420  ! 3843: FMOVRNZ	dis not found

T1_asi_reg_rd_163:
	mov	0x32, %r14
	.word 0xfcdb8400  ! 3844: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_1_302:
	setx	0x3c003d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_276:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_276), 16, 16)) -> intp(1, 0, 4)
	.word 0xbbabc820  ! 3851: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xbba4c860  ! 3853: FADDq	dis not found

iob_intr_1_277:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_277), 16, 16)) -> intp(1, 0, 35)
T1_asi_reg_wr_154:
	mov	0x3c5, %r14
	.word 0xfef38e60  ! 3857: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb7ab4820  ! 3861: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb1a5c9c0  ! 3865: FDIVd	fdivd	%f54, %f0, %f24
	.word 0xbb3da001  ! 3866: SRA_I	sra 	%r22, 0x0001, %r29
	.word 0xb7343001  ! 3871: SRLX_I	srlx	%r16, 0x0001, %r27
	.word 0xb1a508e0  ! 3873: FSUBq	dis not found

T1_asi_reg_rd_164:
	mov	0x8, %r14
	.word 0xfadb89e0  ! 3874: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb7aac820  ! 3876: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xbfa58820  ! 3881: FADDs	fadds	%f22, %f0, %f31
iob_intr_1_278:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_278), 16, 16)) -> intp(1, 0, 34)
T1_asi_reg_wr_155:
	mov	0x29, %r14
	.word 0xfaf38e60  ! 3884: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T1_asi_reg_wr_156:
	mov	0x3c1, %r14
	.word 0xfef38400  ! 3885: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T1_asi_reg_rd_165:
	mov	0x1b, %r14
	.word 0xfadb8400  ! 3888: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_1_303:
	setx	0x3c013d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_157:
	mov	0x1a, %r14
	.word 0xf6f38e60  ! 3896: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbfa54820  ! 3897: FADDs	fadds	%f21, %f0, %f31
	.word 0xb5a80820  ! 3898: FMOVN	fmovs	%fcc1, %f0, %f26
cpu_intr_1_304:
	setx	0x3d0135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a4c8c0  ! 3902: FSUBd	fsubd	%f50, %f0, %f26
	.word 0xb69c6032  ! 3903: XORcc_I	xorcc 	%r17, 0x0032, %r27
T1_asi_reg_wr_158:
	mov	0x35, %r14
	.word 0xf4f38e40  ! 3906: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_279:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_279), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb9a90820  ! 3908: FMOVLEU	fmovs	%fcc1, %f0, %f28
iob_intr_1_280:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_280), 16, 16)) -> intp(1, 0, 26)
	.word 0xbca4c000  ! 3915: SUBcc_R	subcc 	%r19, %r0, %r30
	.word 0xbba4c9c0  ! 3918: FDIVd	fdivd	%f50, %f0, %f60
cpu_intr_1_305:
	setx	0x3d0004, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_159:
	mov	0x7, %r14
	.word 0xf4f384a0  ! 3920: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb33c3001  ! 3921: SRAX_I	srax	%r16, 0x0001, %r25
	.word 0xbba84820  ! 3922: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xbc144000  ! 3925: OR_R	or 	%r17, %r0, %r30
cpu_intr_1_306:
	setx	0x3f0308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a589a0  ! 3927: FDIVs	fdivs	%f22, %f0, %f24
	.word 0xbfa5c8a0  ! 3930: FSUBs	fsubs	%f23, %f0, %f31
iob_intr_1_281:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_281), 16, 16)) -> intp(1, 0, 12)
	.word 0xb6a5c000  ! 3933: SUBcc_R	subcc 	%r23, %r0, %r27
T1_asi_reg_rd_166:
	mov	0x3c7, %r14
	.word 0xf8db8e80  ! 3935: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbba4c920  ! 3936: FMULs	fmuls	%f19, %f0, %f29
T1_asi_reg_wr_160:
	mov	0x2a, %r14
	.word 0xfaf384a0  ! 3938: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_1_282:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_282), 16, 16)) -> intp(1, 0, 5)
	.word 0xb57dc400  ! 3941: MOVR_R	movre	%r23, %r0, %r26
cpu_intr_1_307:
	setx	0x3d0230, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_308:
	setx	0x3d010f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_309:
	setx	0x3d0317, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_283:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_283), 16, 16)) -> intp(1, 0, 9)
	.word 0xb5a588c0  ! 3948: FSUBd	fsubd	%f22, %f0, %f26
	lda	[%r23 + %g0] 0xf0, %f2
	.word 0xb9aa4820  ! 3950: FMOVNE	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_167:
	mov	0x12, %r14
	.word 0xf0db8e80  ! 3951: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_1_310:
	setx	0x3f032c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_284:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_284), 16, 16)) -> intp(1, 0, 5)
iob_intr_1_285:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_285), 16, 16)) -> intp(1, 0, 13)
iob_intr_1_286:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_286), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_311:
	setx	0x3e0011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a4c840  ! 3965: FADDd	faddd	%f50, %f0, %f24
	.word 0xb5a00520  ! 3966: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_168:
	mov	0x2d, %r14
	.word 0xf8db89e0  ! 3968: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_1_287:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_287), 16, 16)) -> intp(1, 0, 14)
	.word 0xbfa509a0  ! 3974: FDIVs	fdivs	%f20, %f0, %f31
	.word 0xb3a80c20  ! 3975: FMOVRLZ	dis not found

T1_asi_reg_wr_161:
	mov	0x3c8, %r14
	.word 0xf2f389e0  ! 3976: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb3a90820  ! 3978: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xb1ab8820  ! 3980: FMOVPOS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_162:
	mov	0x3c4, %r14
	.word 0xf4f38400  ! 3981: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb5a508a0  ! 3982: FSUBs	fsubs	%f20, %f0, %f26
cpu_intr_1_312:
	setx	0x3d002b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_313:
	setx	0x3f000a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_288:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_288), 16, 16)) -> intp(1, 0, 17)
T1_asi_reg_wr_163:
	mov	0x2c, %r14
	.word 0xfaf38e60  ! 3992: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_1_289:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_289), 16, 16)) -> intp(1, 0, 30)
	.word 0xb5641800  ! 3996: MOVcc_R	<illegal instruction>
T1_asi_reg_rd_169:
	mov	0x3c5, %r14
	.word 0xfedb8e80  ! 3997: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_314:
	setx	0x3e031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba549e0  ! 4002: FDIVq	dis not found

	.word 0xba450000  ! 4004: ADDC_R	addc 	%r20, %r0, %r29
	.word 0xbba8c820  ! 4009: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xbba448e0  ! 4010: FSUBq	dis not found

iob_intr_1_290:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_290), 16, 16)) -> intp(1, 0, 7)
	.word 0xb3a5c9e0  ! 4012: FDIVq	dis not found

cpu_intr_1_315:
	setx	0x3f0322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a44840  ! 4016: FADDd	faddd	%f48, %f0, %f56
cpu_intr_1_316:
	setx	0x3e0015, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_317:
	setx	0x3d0310, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_164:
	mov	0x3c1, %r14
	.word 0xf6f384a0  ! 4020: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_1_318:
	setx	0x3e012e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_291:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_291), 16, 16)) -> intp(1, 0, 17)
	.word 0xb3a80820  ! 4026: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xbba5c920  ! 4029: FMULs	fmuls	%f23, %f0, %f29
	.word 0xb9a00540  ! 4030: FSQRTd	fsqrt	
iob_intr_1_292:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_292), 16, 16)) -> intp(1, 0, 9)
cpu_intr_1_319:
	setx	0x3c0332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab8820  ! 4035: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb9a81420  ! 4036: FMOVRNZ	dis not found

	.word 0xbcb54000  ! 4037: ORNcc_R	orncc 	%r21, %r0, %r30
T1_asi_reg_wr_165:
	mov	0x2a, %r14
	.word 0xf6f38e40  ! 4038: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb7a00540  ! 4039: FSQRTd	fsqrt	
	.word 0xbba8c820  ! 4040: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xbfa48920  ! 4042: FMULs	fmuls	%f18, %f0, %f31
cpu_intr_1_320:
	setx	0x3d010a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_321:
	setx	0x3f0019, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbba4c9a0  ! 4051: FDIVs	fdivs	%f19, %f0, %f29
iob_intr_1_293:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_293), 16, 16)) -> intp(1, 0, 25)
	.word 0xbba81c20  ! 4060: FMOVRGEZ	dis not found

	.word 0xb7a48860  ! 4063: FADDq	dis not found

iob_intr_1_294:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_294), 16, 16)) -> intp(1, 0, d)
	.word 0xb7ab0820  ! 4068: FMOVGU	fmovs	%fcc1, %f0, %f27
cpu_intr_1_322:
	setx	0x3f020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa5c820  ! 4072: FADDs	fadds	%f23, %f0, %f31
cpu_intr_1_323:
	setx	0x3d0329, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_166:
	mov	0x17, %r14
	.word 0xf2f38e40  ! 4079: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_1_324:
	setx	0x3c022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a88820  ! 4081: FMOVLE	fmovs	%fcc1, %f0, %f26
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xb9a81c20  ! 4083: FMOVRGEZ	dis not found

T1_asi_reg_wr_167:
	mov	0xa, %r14
	.word 0xf8f38400  ! 4084: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbba548a0  ! 4086: FSUBs	fsubs	%f21, %f0, %f29
iob_intr_1_295:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_295), 16, 16)) -> intp(1, 0, 7)
	.word 0xb1a81420  ! 4089: FMOVRNZ	dis not found

	.word 0xb9a5c8a0  ! 4091: FSUBs	fsubs	%f23, %f0, %f28
T1_asi_reg_wr_168:
	mov	0x11, %r14
	.word 0xf6f38e40  ! 4095: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_296:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_296), 16, 16)) -> intp(1, 0, 15)
cpu_intr_1_325:
	setx	0x3f0228, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_297:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_297), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_rd_170:
	mov	0x9, %r14
	.word 0xf6db8e60  ! 4100: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xba3d0000  ! 4105: XNOR_R	xnor 	%r20, %r0, %r29
T1_asi_reg_wr_169:
	mov	0x3c1, %r14
	.word 0xf0f389e0  ! 4108: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb5a449c0  ! 4109: FDIVd	fdivd	%f48, %f0, %f26
	.word 0xb1a80820  ! 4110: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xbda88820  ! 4111: FMOVLE	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_171:
	mov	0x7, %r14
	.word 0xf6db8e80  ! 4114: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb7a588c0  ! 4118: FSUBd	fsubd	%f22, %f0, %f58
	.word 0xb1359000  ! 4122: SRLX_R	srlx	%r22, %r0, %r24
	.word 0xb1a80820  ! 4126: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
iob_intr_1_298:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_298), 16, 16)) -> intp(1, 0, 29)
	.word 0xb0452047  ! 4129: ADDC_I	addc 	%r20, 0x0047, %r24
	.word 0xb5a488e0  ! 4130: FSUBq	dis not found

T1_asi_reg_wr_170:
	mov	0x1a, %r14
	.word 0xf8f389e0  ! 4134: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T1_asi_reg_rd_172:
	mov	0x2d, %r14
	.word 0xf0db8e40  ! 4136: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb1a81420  ! 4137: FMOVRNZ	dis not found

iob_intr_1_299:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_299), 16, 16)) -> intp(1, 0, 20)
	.word 0xb7a4c820  ! 4140: FADDs	fadds	%f19, %f0, %f27
T1_asi_reg_rd_173:
	mov	0x14, %r14
	.word 0xf4db8e60  ! 4142: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb3ab8820  ! 4143: FMOVPOS	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_171:
	mov	0x12, %r14
	.word 0xf8f384a0  ! 4145: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb7ab8820  ! 4150: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xb2b4c000  ! 4151: ORNcc_R	orncc 	%r19, %r0, %r25
T1_asi_reg_wr_172:
	mov	0x29, %r14
	.word 0xfaf384a0  ! 4153: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T1_asi_reg_rd_174:
	mov	0x1e, %r14
	.word 0xfcdb8400  ! 4154: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb2c5c000  ! 4156: ADDCcc_R	addccc 	%r23, %r0, %r25
	.word 0xb3a549c0  ! 4157: FDIVd	fdivd	%f52, %f0, %f56
T1_asi_reg_rd_175:
	mov	0x1c, %r14
	.word 0xf0db84a0  ! 4159: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbfa00560  ! 4162: FSQRTq	fsqrt	
T1_asi_reg_wr_173:
	mov	0x21, %r14
	.word 0xfaf38e40  ! 4165: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbd358000  ! 4167: SRL_R	srl 	%r22, %r0, %r30
iob_intr_1_300:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_300), 16, 16)) -> intp(1, 0, 7)
cpu_intr_1_326:
	setx	0x430001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a508c0  ! 4173: FSUBd	fsubd	%f20, %f0, %f56
iob_intr_1_301:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_301), 16, 16)) -> intp(1, 0, 32)
cpu_intr_1_327:
	setx	0x420029, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_176:
	mov	0x36, %r14
	.word 0xf8db89e0  ! 4180: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T1_asi_reg_wr_174:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 4183: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	lda	[%r17 + %g0] 0xf0, %f2
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_328:
	setx	0x43023f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_302:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_302), 16, 16)) -> intp(1, 0, 32)
	.word 0xb5a00540  ! 4192: FSQRTd	fsqrt	
	.word 0xbdab8820  ! 4194: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xbba44820  ! 4195: FADDs	fadds	%f17, %f0, %f29
cpu_intr_1_329:
	setx	0x430235, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_175:
	mov	0x3c6, %r14
	.word 0xfef384a0  ! 4199: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_1_303:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_303), 16, 16)) -> intp(1, 0, 2f)
cpu_intr_1_330:
	setx	0x41031b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_177:
	mov	0x3c7, %r14
	.word 0xfcdb8e60  ! 4202: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb5a00520  ! 4203: FSQRTs	fsqrt	
	.word 0xbbaac820  ! 4207: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xbfa548c0  ! 4210: FSUBd	fsubd	%f52, %f0, %f62
T1_asi_reg_rd_178:
	mov	0x38, %r14
	.word 0xfadb8e40  ! 4212: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb63d0000  ! 4213: XNOR_R	xnor 	%r20, %r0, %r27
T1_asi_reg_wr_176:
	mov	0x1d, %r14
	.word 0xf6f38e40  ! 4218: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbfa00520  ! 4221: FSQRTs	fsqrt	
	.word 0xbfa00020  ! 4222: FMOVs	fmovs	%f0, %f31
T1_asi_reg_wr_177:
	mov	0x21, %r14
	.word 0xf2f38e40  ! 4223: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbda4c840  ! 4224: FADDd	faddd	%f50, %f0, %f30
	.word 0xb7aa0820  ! 4225: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb3a81c20  ! 4226: FMOVRGEZ	dis not found

	.word 0xb2c44000  ! 4230: ADDCcc_R	addccc 	%r17, %r0, %r25
	.word 0xb1a4c9c0  ! 4231: FDIVd	fdivd	%f50, %f0, %f24
iob_intr_1_304:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_304), 16, 16)) -> intp(1, 0, 27)
T1_asi_reg_wr_178:
	mov	0x3c8, %r14
	.word 0xf2f384a0  ! 4235: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb9a488c0  ! 4239: FSUBd	fsubd	%f18, %f0, %f28
	.word 0xbda8c820  ! 4240: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xbfa80820  ! 4242: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb1a81c20  ! 4243: FMOVRGEZ	dis not found

	.word 0xbda408a0  ! 4244: FSUBs	fsubs	%f16, %f0, %f30
	.word 0xb9a80820  ! 4245: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_179:
	mov	0xb, %r14
	.word 0xfadb84a0  ! 4247: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbfa40840  ! 4251: FADDd	faddd	%f16, %f0, %f62
	.word 0xb1a80820  ! 4252: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb32ce001  ! 4253: SLL_I	sll 	%r19, 0x0001, %r25
	.word 0xb5a58860  ! 4256: FADDq	dis not found

	.word 0xb1a408c0  ! 4258: FSUBd	fsubd	%f16, %f0, %f24
	.word 0xbab58000  ! 4259: SUBCcc_R	orncc 	%r22, %r0, %r29
	.word 0xbba00560  ! 4260: FSQRTq	fsqrt	
iob_intr_1_305:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_305), 16, 16)) -> intp(1, 0, 1)
	.word 0xbba48960  ! 4263: FMULq	dis not found

	.word 0xb5a4c820  ! 4264: FADDs	fadds	%f19, %f0, %f26
	.word 0xbba00560  ! 4265: FSQRTq	fsqrt	
cpu_intr_1_331:
	setx	0x410108, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_180:
	mov	0x1, %r14
	.word 0xfadb8e40  ! 4267: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_306:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_306), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_rd_181:
	mov	0x2a, %r14
	.word 0xf4db8e60  ! 4272: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_1_332:
	setx	0x420107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaa8820  ! 4275: FMOVG	fmovs	%fcc1, %f0, %f31
iob_intr_1_307:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_307), 16, 16)) -> intp(1, 0, 21)
iob_intr_1_308:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_308), 16, 16)) -> intp(1, 0, 1d)
T1_asi_reg_wr_179:
	mov	0x3c5, %r14
	.word 0xf4f38400  ! 4279: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_1_309:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_309), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_333:
	setx	0x41001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a508c0  ! 4283: FSUBd	fsubd	%f20, %f0, %f26
iob_intr_1_310:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_310), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_334:
	setx	0x43030d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_182:
	mov	0x2e, %r14
	.word 0xfedb84a0  ! 4294: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb085c000  ! 4298: ADDcc_R	addcc 	%r23, %r0, %r24
	.word 0xb1a94820  ! 4299: FMOVCS	fmovs	%fcc1, %f0, %f24
cpu_intr_1_335:
	setx	0x410112, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_311:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_311), 16, 16)) -> intp(1, 0, 11)
T1_asi_reg_rd_183:
	mov	0x3c6, %r14
	.word 0xf2db84a0  ! 4303: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbcb40000  ! 4305: SUBCcc_R	orncc 	%r16, %r0, %r30
	.word 0xbba00040  ! 4306: FMOVd	fmovd	%f0, %f60
	.word 0xb9aa4820  ! 4308: FMOVNE	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a48860  ! 4313: FADDq	dis not found

T1_asi_reg_rd_184:
	mov	0x27, %r14
	.word 0xfcdb8e40  ! 4314: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb1a548a0  ! 4315: FSUBs	fsubs	%f21, %f0, %f24
	.word 0xb7ab8820  ! 4316: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xba45a1a2  ! 4327: ADDC_I	addc 	%r22, 0x01a2, %r29
T1_asi_reg_wr_180:
	mov	0x3c3, %r14
	.word 0xf4f38e40  ! 4332: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_336:
	setx	0x40033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb82d0000  ! 4337: ANDN_R	andn 	%r20, %r0, %r28
T1_asi_reg_wr_181:
	mov	0x3c0, %r14
	.word 0xfcf384a0  ! 4338: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T1_asi_reg_wr_182:
	mov	0xa, %r14
	.word 0xfaf38400  ! 4339: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_1_312:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_312), 16, 16)) -> intp(1, 0, d)
iob_intr_1_313:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_313), 16, 16)) -> intp(1, 0, 13)
iob_intr_1_314:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_314), 16, 16)) -> intp(1, 0, 5)
cpu_intr_1_337:
	setx	0x430105, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_315:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_315), 16, 16)) -> intp(1, 0, 15)
cpu_intr_1_338:
	setx	0x420014, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_316:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_316), 16, 16)) -> intp(1, 0, 14)
	.word 0xb9ab8820  ! 4357: FMOVPOS	fmovs	%fcc1, %f0, %f28
cpu_intr_1_339:
	setx	0x410331, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_317:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_317), 16, 16)) -> intp(1, 0, 4)
	.word 0xb33d2001  ! 4369: SRA_I	sra 	%r20, 0x0001, %r25
	.word 0xb1a5c9a0  ! 4371: FDIVs	fdivs	%f23, %f0, %f24
iob_intr_1_318:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_318), 16, 16)) -> intp(1, 0, d)
cpu_intr_1_340:
	setx	0x41002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c8c0  ! 4380: FSUBd	fsubd	%f50, %f0, %f62
	.word 0xbb353001  ! 4381: SRLX_I	srlx	%r20, 0x0001, %r29
T1_asi_reg_wr_183:
	mov	0x3c1, %r14
	.word 0xf8f38e80  ! 4383: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_1_319:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_319), 16, 16)) -> intp(1, 0, 18)
T1_asi_reg_rd_185:
	mov	0x24, %r14
	.word 0xfadb8e60  ! 4386: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb5aa0820  ! 4393: FMOVA	fmovs	%fcc1, %f0, %f26
cpu_intr_1_341:
	setx	0x40023e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_184:
	mov	0xd, %r14
	.word 0xfcf38e60  ! 4397: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb12d1000  ! 4400: SLLX_R	sllx	%r20, %r0, %r24
	.word 0xb3a48860  ! 4404: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_320:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_320), 16, 16)) -> intp(1, 0, 13)
	.word 0xb4ad8000  ! 4412: ANDNcc_R	andncc 	%r22, %r0, %r26
T1_asi_reg_rd_186:
	mov	0x3c1, %r14
	.word 0xfcdb8400  ! 4413: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T1_asi_reg_rd_187:
	mov	0xd, %r14
	.word 0xfedb8e40  ! 4414: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	lda	[%r20 + %g0] 0xf0, %f2
cpu_intr_1_342:
	setx	0x40003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda449e0  ! 4418: FDIVq	dis not found

	.word 0xbda00520  ! 4420: FSQRTs	fsqrt	
	.word 0xb9aa8820  ! 4422: FMOVG	fmovs	%fcc1, %f0, %f28
cpu_intr_1_343:
	setx	0x42013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb92de001  ! 4426: SLL_I	sll 	%r23, 0x0001, %r28
	.word 0xbfa4c8c0  ! 4427: FSUBd	fsubd	%f50, %f0, %f62
	.word 0xbda589e0  ! 4428: FDIVq	dis not found

T1_asi_reg_wr_185:
	mov	0x1e, %r14
	.word 0xf2f389e0  ! 4429: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbfa48940  ! 4430: FMULd	fmuld	%f18, %f0, %f62
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_344:
	setx	0x410214, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_345:
	setx	0x40002a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_346:
	setx	0x410235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a88820  ! 4439: FMOVLE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_347:
	setx	0x410222, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_321:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_321), 16, 16)) -> intp(1, 0, 23)
cpu_intr_1_348:
	setx	0x400138, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_188:
	mov	0x2b, %r14
	.word 0xf2db89e0  ! 4448: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_1_322:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_322), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb9a58960  ! 4450: FMULq	dis not found

iob_intr_1_323:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_323), 16, 16)) -> intp(1, 0, 31)
cpu_intr_1_349:
	setx	0x420338, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_324:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_324), 16, 16)) -> intp(1, 0, 21)
	.word 0xbda81820  ! 4457: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xbe04a0c4  ! 4458: ADD_I	add 	%r18, 0x00c4, %r31
T1_asi_reg_rd_189:
	mov	0x34, %r14
	.word 0xfedb8e80  ! 4463: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb7a00560  ! 4465: FSQRTq	fsqrt	
	.word 0xbdaa0820  ! 4467: FMOVA	fmovs	%fcc1, %f0, %f30
cpu_intr_1_350:
	setx	0x410023, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_325:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_325), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_rd_190:
	mov	0x3c2, %r14
	.word 0xf0db8e80  ! 4479: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb1a58860  ! 4481: FADDq	dis not found

iob_intr_1_326:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_326), 16, 16)) -> intp(1, 0, 32)
	.word 0xb3a00540  ! 4484: FSQRTd	fsqrt	
T1_asi_reg_rd_191:
	mov	0x37, %r14
	.word 0xf6db89e0  ! 4486: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T1_asi_reg_wr_186:
	mov	0x6, %r14
	.word 0xf2f38e40  ! 4488: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb7a98820  ! 4489: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xbda88820  ! 4490: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xbda508c0  ! 4496: FSUBd	fsubd	%f20, %f0, %f30
cpu_intr_1_351:
	setx	0x42000a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_192:
	mov	0x0, %r14
	.word 0xfedb89e0  ! 4498: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbba4c860  ! 4499: FADDq	dis not found

iob_intr_1_327:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_327), 16, 16)) -> intp(1, 0, 23)
iob_intr_1_328:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_328), 16, 16)) -> intp(1, 0, f)
	.word 0xb3a80c20  ! 4505: FMOVRLZ	dis not found

	.word 0xb3a5c8e0  ! 4508: FSUBq	dis not found

T1_asi_reg_wr_187:
	mov	0x33, %r14
	.word 0xfef389e0  ! 4509: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_1_352:
	setx	0x400110, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_193:
	mov	0x3c1, %r14
	.word 0xfadb8e80  ! 4512: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T1_asi_reg_rd_194:
	mov	0x3c3, %r14
	.word 0xf4db8400  ! 4513: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_1_329:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_329), 16, 16)) -> intp(1, 0, 18)
cpu_intr_1_353:
	setx	0x400102, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_330:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_330), 16, 16)) -> intp(1, 0, c)
T1_asi_reg_wr_188:
	mov	0x3c3, %r14
	.word 0xf8f38e80  ! 4517: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T1_asi_reg_rd_195:
	mov	0x3c3, %r14
	.word 0xf0db89e0  ! 4520: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_1_331:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_331), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb3ab8820  ! 4523: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb48d0000  ! 4526: ANDcc_R	andcc 	%r20, %r0, %r26
iob_intr_1_332:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_332), 16, 16)) -> intp(1, 0, 21)
	.word 0xb3641800  ! 4532: MOVcc_R	<illegal instruction>
cpu_intr_1_354:
	setx	0x420336, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_355:
	setx	0x420122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a48860  ! 4537: FADDq	dis not found

	.word 0xb3a88820  ! 4538: FMOVLE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_196:
	mov	0x3c8, %r14
	.word 0xf2db89e0  ! 4539: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb1a4c8a0  ! 4541: FSUBs	fsubs	%f19, %f0, %f24
	.word 0xbba00540  ! 4542: FSQRTd	fsqrt	
cpu_intr_1_356:
	setx	0x420229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda5c8e0  ! 4545: FSUBq	dis not found

iob_intr_1_333:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_333), 16, 16)) -> intp(1, 0, 13)
T1_asi_reg_rd_197:
	mov	0x3c7, %r14
	.word 0xfcdb8e60  ! 4550: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_1_357:
	setx	0x40012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa4820  ! 4555: FMOVNE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_358:
	setx	0x43022b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_359:
	setx	0x41012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a5c960  ! 4559: FMULq	dis not found

	.word 0xb9aa8820  ! 4560: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xb3508000  ! 4561: RDPR_TSTATE	<illegal instruction>
cpu_intr_1_360:
	setx	0x400000, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_334:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_334), 16, 16)) -> intp(1, 0, f)
T1_asi_reg_wr_189:
	mov	0x25, %r14
	.word 0xf0f38e60  ! 4567: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T1_asi_reg_rd_198:
	mov	0x3c3, %r14
	.word 0xfcdb8e80  ! 4568: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_1_335:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_335), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb9a44860  ! 4575: FADDq	dis not found

	.word 0xb3a81420  ! 4576: FMOVRNZ	dis not found

	.word 0xbda4c820  ! 4577: FADDs	fadds	%f19, %f0, %f30
T1_asi_reg_wr_190:
	mov	0x38, %r14
	.word 0xfcf38e80  ! 4578: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb1a44920  ! 4579: FMULs	fmuls	%f17, %f0, %f24
	.word 0xb5a00020  ! 4580: FMOVs	fmovs	%f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a40840  ! 4582: FADDd	faddd	%f16, %f0, %f26
T1_asi_reg_rd_199:
	mov	0x2, %r14
	.word 0xf2db8e80  ! 4585: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_1_336:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_336), 16, 16)) -> intp(1, 0, 13)
T1_asi_reg_wr_191:
	mov	0x22, %r14
	.word 0xf6f38e60  ! 4588: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_1_361:
	setx	0x20306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a508e0  ! 4597: FSUBq	dis not found

T1_asi_reg_wr_192:
	mov	0x18, %r14
	.word 0xf0f384a0  ! 4598: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbd540000  ! 4600: RDPR_GL	<illegal instruction>
iob_intr_1_337:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_337), 16, 16)) -> intp(1, 0, 20)
	.word 0xbba5c8c0  ! 4605: FSUBd	fsubd	%f54, %f0, %f60
cpu_intr_1_362:
	setx	0x400138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb03da188  ! 4611: XNOR_I	xnor 	%r22, 0x0188, %r24
T1_asi_reg_wr_193:
	mov	0x34, %r14
	.word 0xfaf384a0  ! 4619: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_1_363:
	setx	0x460031, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_338:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_338), 16, 16)) -> intp(1, 0, b)
cpu_intr_1_364:
	setx	0x450038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_339:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_339), 16, 16)) -> intp(1, 0, 5)
T1_asi_reg_wr_194:
	mov	0x35, %r14
	.word 0xfef38e60  ! 4625: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T1_asi_reg_rd_200:
	mov	0x36, %r14
	.word 0xf2db8400  ! 4627: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb7a00560  ! 4628: FSQRTq	fsqrt	
iob_intr_1_340:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_340), 16, 16)) -> intp(1, 0, d)
iob_intr_1_341:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_341), 16, 16)) -> intp(1, 0, 3)
	.word 0xbe2c0000  ! 4636: ANDN_R	andn 	%r16, %r0, %r31
iob_intr_1_342:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_342), 16, 16)) -> intp(1, 0, 3d)
iob_intr_1_343:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_343), 16, 16)) -> intp(1, 0, 19)
	.word 0xbd2ce001  ! 4639: SLL_I	sll 	%r19, 0x0001, %r30
	.word 0x8395a080  ! 4640: WRPR_TNPC_I	wrpr	%r22, 0x0080, %tnpc
	.word 0xb8a4e181  ! 4642: SUBcc_I	subcc 	%r19, 0x0181, %r28
cpu_intr_1_365:
	setx	0x460115, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_195:
	mov	0x3c4, %r14
	.word 0xfcf38e80  ! 4645: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T1_asi_reg_rd_201:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 4646: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb33d5000  ! 4649: SRAX_R	srax	%r21, %r0, %r25
iob_intr_1_344:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_344), 16, 16)) -> intp(1, 0, f)
	.word 0xbfa98820  ! 4657: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xbfa80820  ! 4658: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb57d2401  ! 4660: MOVR_I	movre	%r20, 0x1, %r26
iob_intr_1_345:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_345), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_rd_202:
	mov	0x19, %r14
	.word 0xf0db8e40  ! 4662: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbfa44940  ! 4663: FMULd	fmuld	%f48, %f0, %f62
	.word 0xbba80820  ! 4666: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb1a44840  ! 4667: FADDd	faddd	%f48, %f0, %f24
iob_intr_1_346:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_346), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb9a00520  ! 4671: FSQRTs	fsqrt	
	.word 0xb9a5c8e0  ! 4672: FSUBq	dis not found

T1_asi_reg_wr_196:
	mov	0x3c2, %r14
	.word 0xf8f38e80  ! 4674: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T1_asi_reg_wr_197:
	mov	0x30, %r14
	.word 0xf4f38400  ! 4676: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb7a88820  ! 4677: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xbfa508c0  ! 4681: FSUBd	fsubd	%f20, %f0, %f62
	.word 0xb3a8c820  ! 4683: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xbdaa0820  ! 4684: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb9aa0820  ! 4685: FMOVA	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_198:
	mov	0x36, %r14
	.word 0xfef38400  ! 4687: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbba5c920  ! 4688: FMULs	fmuls	%f23, %f0, %f29
T1_asi_reg_rd_203:
	mov	0x13, %r14
	.word 0xfadb8e40  ! 4689: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb9aac820  ! 4692: FMOVGE	fmovs	%fcc1, %f0, %f28
iob_intr_1_347:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_347), 16, 16)) -> intp(1, 0, 22)
	.word 0x8594a065  ! 4694: WRPR_TSTATE_I	wrpr	%r18, 0x0065, %tstate
cpu_intr_1_366:
	setx	0x470119, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_204:
	mov	0x18, %r14
	.word 0xfcdb8e80  ! 4696: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_1_367:
	setx	0x470216, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_199:
	mov	0x36, %r14
	.word 0xfcf38e40  ! 4698: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb80c61db  ! 4699: AND_I	and 	%r17, 0x01db, %r28
	.word 0xb5a80820  ! 4700: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb3a00540  ! 4702: FSQRTd	fsqrt	
T1_asi_reg_rd_205:
	mov	0x3c4, %r14
	.word 0xfedb8e80  ! 4703: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb5a90820  ! 4705: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xb1a9c820  ! 4707: FMOVVS	fmovs	%fcc1, %f0, %f24
cpu_intr_1_368:
	setx	0x44023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_200:
	mov	0x15, %r14
	.word 0xf8f38e80  ! 4714: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_1_369:
	setx	0x440233, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_201:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 4718: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_1_370:
	setx	0x45011f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_371:
	setx	0x44020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a81820  ! 4722: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb1a80820  ! 4726: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
iob_intr_1_348:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_348), 16, 16)) -> intp(1, 0, 20)
	.word 0xb6348000  ! 4728: ORN_R	orn 	%r18, %r0, %r27
	.word 0xb3a5c940  ! 4729: FMULd	fmuld	%f54, %f0, %f56
T1_asi_reg_rd_206:
	mov	0x3c0, %r14
	.word 0xf0db8e60  ! 4730: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T1_asi_reg_rd_207:
	mov	0x3c3, %r14
	.word 0xf4db8400  ! 4732: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb5a548a0  ! 4736: FSUBs	fsubs	%f21, %f0, %f26
	.word 0xbda408c0  ! 4737: FSUBd	fsubd	%f16, %f0, %f30
	.word 0xb7a81420  ! 4744: FMOVRNZ	dis not found

	.word 0xb5aa0820  ! 4746: FMOVA	fmovs	%fcc1, %f0, %f26
	lda	[%r22 + %g0] 0xf0, %f2
T1_asi_reg_wr_202:
	mov	0x1a, %r14
	.word 0xfaf38e60  ! 4751: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T1_asi_reg_rd_208:
	mov	0x32, %r14
	.word 0xf6db8e80  ! 4752: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T1_asi_reg_wr_203:
	mov	0x3c5, %r14
	.word 0xfef38e40  ! 4755: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_wr_204:
	mov	0x1d, %r14
	.word 0xf8f389e0  ! 4756: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_1_372:
	setx	0x440105, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_209:
	mov	0x3c2, %r14
	.word 0xf8db8400  ! 4758: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb3a80820  ! 4759: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xbfa9c820  ! 4760: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xb5aa0820  ! 4762: FMOVA	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_205:
	mov	0x1b, %r14
	.word 0xf2f38e80  ! 4764: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_1_349:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_349), 16, 16)) -> intp(1, 0, 10)
	.word 0xb1a81c20  ! 4767: FMOVRGEZ	dis not found

T1_asi_reg_rd_210:
	mov	0x30, %r14
	.word 0xf6db8400  ! 4768: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb5a80c20  ! 4770: FMOVRLZ	dis not found

cpu_intr_1_373:
	setx	0x470222, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_374:
	setx	0x450014, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7a48860  ! 4778: FADDq	dis not found

T1_asi_reg_wr_206:
	mov	0x4, %r14
	.word 0xf8f389e0  ! 4781: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_1_375:
	setx	0x470209, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_211:
	mov	0x3c7, %r14
	.word 0xfadb8e40  ! 4790: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_rd_212:
	mov	0x19, %r14
	.word 0xf2db84a0  ! 4791: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	lda	[%r22 + %g0] 0xf0, %f2
cpu_intr_1_376:
	setx	0x440028, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_207:
	mov	0x3c1, %r14
	.word 0xfaf38e40  ! 4797: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_rd_213:
	mov	0x3c8, %r14
	.word 0xfcdb89e0  ! 4798: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb83c4000  ! 4799: XNOR_R	xnor 	%r17, %r0, %r28
iob_intr_1_350:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_350), 16, 16)) -> intp(1, 0, 3d)
iob_intr_1_351:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_351), 16, 16)) -> intp(1, 0, 16)
	.word 0xb3a00040  ! 4807: FMOVd	fmovd	%f0, %f56
	.word 0xbe04a056  ! 4808: ADD_I	add 	%r18, 0x0056, %r31
iob_intr_1_352:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_352), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_wr_208:
	mov	0x38, %r14
	.word 0xfcf38400  ! 4812: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_1_353:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_353), 16, 16)) -> intp(1, 0, 26)
	.word 0xbfa4c8e0  ! 4815: FSUBq	dis not found

	.word 0xb5a408e0  ! 4816: FSUBq	dis not found

	.word 0xba85a09c  ! 4817: ADDcc_I	addcc 	%r22, 0x009c, %r29
T1_asi_reg_wr_209:
	mov	0x37, %r14
	.word 0xf8f38400  ! 4818: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbfa50960  ! 4819: FMULq	dis not found

iob_intr_1_354:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_354), 16, 16)) -> intp(1, 0, 8)
	.word 0xb3a5c8c0  ! 4822: FSUBd	fsubd	%f54, %f0, %f56
	.word 0xb9a80820  ! 4826: FMOVN	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_210:
	mov	0x6, %r14
	.word 0xfaf384a0  ! 4828: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T1_asi_reg_rd_214:
	mov	0x18, %r14
	.word 0xf6db8e40  ! 4829: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb3aa8820  ! 4831: FMOVG	fmovs	%fcc1, %f0, %f25
iob_intr_1_355:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_355), 16, 16)) -> intp(1, 0, 23)
cpu_intr_1_377:
	setx	0x44030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00560  ! 4837: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_356:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_356), 16, 16)) -> intp(1, 0, 2a)
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xbda588c0  ! 4843: FSUBd	fsubd	%f22, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda54940  ! 4846: FMULd	fmuld	%f52, %f0, %f30
cpu_intr_1_378:
	setx	0x46033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c8c0  ! 4851: FSUBd	fsubd	%f50, %f0, %f58
iob_intr_1_357:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_357), 16, 16)) -> intp(1, 0, 16)
	.word 0xb9aa8820  ! 4853: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xb750c000  ! 4854: RDPR_TT	<illegal instruction>
cpu_intr_1_379:
	setx	0x460102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcb58000  ! 4858: SUBCcc_R	orncc 	%r22, %r0, %r30
iob_intr_1_358:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_358), 16, 16)) -> intp(1, 0, b)
iob_intr_1_359:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_359), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_wr_211:
	mov	0xc, %r14
	.word 0xf0f38e80  ! 4864: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T1_asi_reg_wr_212:
	mov	0x3c1, %r14
	.word 0xfcf38e40  ! 4866: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T1_asi_reg_wr_213:
	mov	0x3c8, %r14
	.word 0xf8f384a0  ! 4867: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_1_360:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_360), 16, 16)) -> intp(1, 0, 1a)
iob_intr_1_361:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_361), 16, 16)) -> intp(1, 0, 11)
	.word 0xbfa81c20  ! 4870: FMOVRGEZ	dis not found

cpu_intr_1_380:
	setx	0x460211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba50960  ! 4872: FMULq	dis not found

cpu_intr_1_381:
	setx	0x470034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9ab0820  ! 4880: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xb9a00020  ! 4881: FMOVs	fmovs	%f0, %f28
	.word 0xbfab8820  ! 4882: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb1a80c20  ! 4883: FMOVRLZ	dis not found

cpu_intr_1_382:
	setx	0x470023, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_383:
	setx	0x440036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80820  ! 4892: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
iob_intr_1_362:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_362), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_rd_215:
	mov	0xe, %r14
	.word 0xfedb89e0  ! 4897: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb9a4c820  ! 4904: FADDs	fadds	%f19, %f0, %f28
iob_intr_1_363:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_363), 16, 16)) -> intp(1, 0, 2b)
	.word 0xbdab8820  ! 4908: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb7a00020  ! 4913: FMOVs	fmovs	%f0, %f27
	.word 0xb4850000  ! 4914: ADDcc_R	addcc 	%r20, %r0, %r26
	.word 0xb7a54840  ! 4916: FADDd	faddd	%f52, %f0, %f58
	.word 0xb61c0000  ! 4917: XOR_R	xor 	%r16, %r0, %r27
	.word 0xb7a8c820  ! 4919: FMOVL	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_216:
	mov	0xc, %r14
	.word 0xf6db8e40  ! 4921: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_384:
	setx	0x440210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80c20  ! 4926: FMOVRLZ	dis not found

iob_intr_1_364:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_364), 16, 16)) -> intp(1, 0, 33)
	.word 0xb894601c  ! 4928: ORcc_I	orcc 	%r17, 0x001c, %r28
cpu_intr_1_385:
	setx	0x460232, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_214:
	mov	0x2e, %r14
	.word 0xfcf38e60  ! 4930: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbdabc820  ! 4935: FMOVVC	fmovs	%fcc1, %f0, %f30
cpu_intr_1_386:
	setx	0x47032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a81820  ! 4942: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xbba5c8c0  ! 4943: FSUBd	fsubd	%f54, %f0, %f60
	.word 0xb3a00560  ! 4952: FSQRTq	fsqrt	
cpu_intr_1_387:
	setx	0x44033c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_365:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_365), 16, 16)) -> intp(1, 0, 34)
cpu_intr_1_388:
	setx	0x45030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5354000  ! 4959: SRL_R	srl 	%r21, %r0, %r26
cpu_intr_1_389:
	setx	0x470227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a58940  ! 4961: FMULd	fmuld	%f22, %f0, %f58
cpu_intr_1_390:
	setx	0x460211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba4c9c0  ! 4963: FDIVd	fdivd	%f50, %f0, %f60
T1_asi_reg_rd_217:
	mov	0x3c7, %r14
	.word 0xf0db8e80  ! 4966: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbda80820  ! 4967: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xb7a00540  ! 4968: FSQRTd	fsqrt	
cpu_intr_1_391:
	setx	0x460328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81420  ! 4972: FMOVRNZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_366:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_366), 16, 16)) -> intp(1, 0, 2c)
T1_asi_reg_rd_218:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 4976: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbc95a0aa  ! 4977: ORcc_I	orcc 	%r22, 0x00aa, %r30
	.word 0xbfa408a0  ! 4979: FSUBs	fsubs	%f16, %f0, %f31
	.word 0xb7ab8820  ! 4981: FMOVPOS	fmovs	%fcc1, %f0, %f27
cpu_intr_1_392:
	setx	0x45033d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_367:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_367), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbead61c7  ! 4987: ANDNcc_I	andncc 	%r21, 0x01c7, %r31
	.word 0xb494c000  ! 4988: ORcc_R	orcc 	%r19, %r0, %r26
T1_asi_reg_wr_215:
	mov	0x33, %r14
	.word 0xf6f389e0  ! 4989: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb7a58840  ! 4990: FADDd	faddd	%f22, %f0, %f58
	.word 0xb1abc820  ! 4992: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xbda00560  ! 4994: FSQRTq	fsqrt	
T1_asi_reg_rd_219:
	mov	0x28, %r14
	.word 0xf8db8e40  ! 4996: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_rd_220:
	mov	0x7, %r14
	.word 0xfadb8e40  ! 4997: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_wr_216:
	mov	0x23, %r14
	.word 0xfcf38400  ! 4998: STXA_R	stxa	%r30, [%r14 + %r0] 0x20

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

	.xword	0x99301ff8d32256fd
	.xword	0x011912cfcd8f23ab
	.xword	0xfcdf009b5396ad06
	.xword	0x1904db37b78d6d34
	.xword	0xfc5348083ab682ac
	.xword	0xa765ed9372ea7744
	.xword	0x8be679ea442f7f86
	.xword	0x0bfe0d44edc82655
	.xword	0x35555239705a7ca5
	.xword	0x76ad9f120be964cb
	.xword	0x63399eb5d23e3f1a
	.xword	0xf9586c2837347f16
	.xword	0x1591d01670344928
	.xword	0x184c62b860089178
	.xword	0x5eea3d5f89543254
	.xword	0x665779fc4f4e978d
	.xword	0xc7ef2cde4493f2b4
	.xword	0x367366e6a2b59d24
	.xword	0x22b9db02e66be866
	.xword	0x5adc8625959e56ff
	.xword	0x118fc2d95144d4bd
	.xword	0x2736f8c31487dc0a
	.xword	0xbbc2aeda20eb2f32
	.xword	0x94b2ad1fd1e4703f
	.xword	0x456d5f5ef53ec651
	.xword	0xd5eec9b28d3b0f63
	.xword	0xa605832f82bd02db
	.xword	0x0bcc36ddb24758a1
	.xword	0xd7fc104b06146f7c
	.xword	0xf6dff66b859efa94
	.xword	0xa536ba186e875ed0
	.xword	0x0aa4303b8bca7546
	.xword	0xaaf4dab22387e0d8
	.xword	0xc7773b198f2bbd40
	.xword	0x9387fee35bbfcd1f
	.xword	0xeba007fd3015426b
	.xword	0x0fce65fecab56578
	.xword	0x597b6626f9fc45f5
	.xword	0xf57eb7cb287bb2a8
	.xword	0xcf0069c35bd5c7e9
	.xword	0x311bd257bea69a16
	.xword	0x63030195788d516f
	.xword	0x35dfb5352fd43013
	.xword	0x2326161b4bfa6a5c
	.xword	0x2f95d4bea3cdab6c
	.xword	0x1215837bafd5143b
	.xword	0xf71375669b6b4acf
	.xword	0xf6724eb5ddf735d2
	.xword	0xf077ab044714ab43
	.xword	0x327ee6d24efe1d68
	.xword	0x9a7b04db04f4a1cf
	.xword	0x7cb8c56c8adb4288
	.xword	0xf3a3d8291774dfc5
	.xword	0x0f05bf30135fedf6
	.xword	0x3dc2e16f794bad77
	.xword	0xd74074f0c4331901
	.xword	0x29720148f2d98b90
	.xword	0x5e067504a28e1195
	.xword	0x443a77b98e77c076
	.xword	0xb5905bee3f24a44e
	.xword	0x9593d54d8faa93e0
	.xword	0x58f46b7cd7cfb928
	.xword	0xc83e42048627945d
	.xword	0x2b2f66357cd8c4a4
	.xword	0x72f9a19d27d0a841
	.xword	0x0b3a80c45987797e
	.xword	0x7502bcc3019b5dc1
	.xword	0x4fb63f1941d9be40
	.xword	0xe2406c3f653e709e
	.xword	0xaa7a3a56cfe41972
	.xword	0x047d2f0f1fc9de9d
	.xword	0x9b6d9db2ea8a5f1e
	.xword	0x3fbc02021f107337
	.xword	0x28ae212eb7b2c02c
	.xword	0xf863b1bd036b92fc
	.xword	0xe4b13ee808848a34
	.xword	0xca9271c51192dead
	.xword	0x0f54c2ab17a80d08
	.xword	0x56b552c1aa9bd158
	.xword	0xa1d1bb541e572533
	.xword	0x9195eddefdbc87c2
	.xword	0xf73ebd81912db0df
	.xword	0x6775216424f32538
	.xword	0x7222d31d2a7ce157
	.xword	0x868610c762051e8a
	.xword	0x8a249c259a4b72d3
	.xword	0xee8e29503fc45a14
	.xword	0x4a48cf5aefdb6ccb
	.xword	0xc3d2643aa9b8cda5
	.xword	0x7e528ce30cbe9630
	.xword	0xb2f1bb300b0328de
	.xword	0x4798e20c092ede02
	.xword	0xe76e06029908baa8
	.xword	0x25fe684518c646c9
	.xword	0xf2e3c83be06dca89
	.xword	0x2e7077db3e3bc64a
	.xword	0xabed688945c08bf1
	.xword	0xca33fd4eefe03b41
	.xword	0xa4d1c6a12cdd2a5a
	.xword	0x246601b85f9eb9f3
	.xword	0xe4e8c6d0981415dd
	.xword	0xa9001238520c61fa
	.xword	0x9c75647ee7e3e898
	.xword	0xe7c5569006777e19
	.xword	0xf21de53f4a5c96c0
	.xword	0xea5a9ba35dee9ae3
	.xword	0x4e33c75d77c31a2d
	.xword	0x22c718a0a9e52b44
	.xword	0x0ca53bae4df332a7
	.xword	0xd90f0c5f3c330f28
	.xword	0x9581bdc43dc795c3
	.xword	0x6c71ed63366e836c
	.xword	0x5da1a19b62d1912f
	.xword	0x5d2a518550526042
	.xword	0x6d3dee109ece0589
	.xword	0xfe5004d787473909
	.xword	0x210e15de29fdfefa
	.xword	0xf401a0185c505808
	.xword	0x290cc61822d52444
	.xword	0xe6e6bff8998f069c
	.xword	0x34e3702ab5026d06
	.xword	0xa1368deedeb10d26
	.xword	0x88a06cf9a2490687
	.xword	0x6d935d28d6690cf7
	.xword	0xe68294d570ff86b6
	.xword	0x85b7b2200b680d1e
	.xword	0x439bf55a15945980
	.xword	0x3fb7b58a58494cac
	.xword	0x5d9989373c82b41a
	.xword	0x23995e156ebf532d
	.xword	0xbeab9249d6a23037
	.xword	0x1850c8cf2cbc9c11
	.xword	0x48a40c71599419b3
	.xword	0xb8f0a61da53c767b
	.xword	0xbe1d02c60c763019
	.xword	0xfd8f5c011323ec0e
	.xword	0xdd6ba4ee25ef5339
	.xword	0x0478ec646974824c
	.xword	0xe0bc013b6f7b6314
	.xword	0x4347e5a550993af5
	.xword	0x08522292002836fa
	.xword	0xf8ffc24e9dbcbc88
	.xword	0x7846b24d6e006f65
	.xword	0x03b6f98ec8e2159d
	.xword	0xa1345ae44b9d6f07
	.xword	0x60bd363c873f6380
	.xword	0x56e1241012b4811b
	.xword	0x13b0589e90abeef7
	.xword	0x524ea8362c732a22
	.xword	0xf65b7e933b9a7c49
	.xword	0xde36187daef6e2c5
	.xword	0xcafee66494383462
	.xword	0x1d7542ef92e3fd0a
	.xword	0xda40d33df8952ab1
	.xword	0xd9995112edbe825e
	.xword	0x8bb632dad7b0fb3d
	.xword	0x97cbc18c2d39f065
	.xword	0x4c295f1da09fad7b
	.xword	0x953dfa370dcd85ad
	.xword	0xc8635caeaaf53b50
	.xword	0x57ba26bdcd303707
	.xword	0x10216d1c6e020f4a
	.xword	0x22742a435b80a441
	.xword	0xf9e61977741a84f0
	.xword	0xa0ab9599415f819c
	.xword	0x9ec7bdfe3ce0a93b
	.xword	0x18be1ebc06efcaff
	.xword	0x7d10ea75b8116239
	.xword	0xdd9d0111e4378b37
	.xword	0x7cb86cf72979b8cb
	.xword	0xc8c66ca2fcc02085
	.xword	0x411903c57ca9031d
	.xword	0x05cc04fa6e963187
	.xword	0xe54e6fd8b239e399
	.xword	0x9a51386130d7e3b4
	.xword	0x6accc3be701c5e1b
	.xword	0x70a1a917441f2947
	.xword	0x989ec48e20499801
	.xword	0xa8b7d4aab111b68e
	.xword	0xec6709157503c9c6
	.xword	0x713705ea55e40eae
	.xword	0x37117f502aefcf6b
	.xword	0xfaf6e970edc24291
	.xword	0xdef17eb0b587aa91
	.xword	0xf8f36cadbbf8d568
	.xword	0x8d609e34ae087f08
	.xword	0xcbc310acd38a02d5
	.xword	0xa555e2e8f9a6ac02
	.xword	0x619681bf46a8a332
	.xword	0xec3b06edf758a827
	.xword	0x842589676b0ed0be
	.xword	0x549b1742bd06f649
	.xword	0xb931a2c44f3bf9c3
	.xword	0x1dca4a04a64cf6e0
	.xword	0x02fd0361eb8910e8
	.xword	0x69146f4768d17857
	.xword	0xc9bb4869e4ac3b0c
	.xword	0x263b92b9dca65d54
	.xword	0x29c55b3dcd95d0f9
	.xword	0xc25597ec7eca7bbc
	.xword	0xb3d9ae0ad1e525e0
	.xword	0x089e217df23a4b9b
	.xword	0xe96b447dd90640dc
	.xword	0x120f13a10a6357c3
	.xword	0x7f7ec65e8262830f
	.xword	0xd8be1e4566705e45
	.xword	0xcf29a2db962f6866
	.xword	0xef7b01e0ca88d660
	.xword	0x8199259174f453b9
	.xword	0xf385dc2dc539f4f7
	.xword	0x087d8b0b020be024
	.xword	0xfb4e0af12ba07ace
	.xword	0x284c1e86fb4b3ee5
	.xword	0x94cf1085af119aff
	.xword	0x0d4ec4301d7b20bc
	.xword	0xaf70a6d73eca3932
	.xword	0xd36e3fd625e55964
	.xword	0x8012ac3fb77affce
	.xword	0x597070c730891af1
	.xword	0x7b3d339d16f2529e
	.xword	0x826985664883814c
	.xword	0xd327fd76fc3273a6
	.xword	0x2e4aa48b155cb2f6
	.xword	0x45fbce90bbbf01d0
	.xword	0x6cae6b422d89bcab
	.xword	0x762824d8a244ac3c
	.xword	0xa48f0fe46ee62fd2
	.xword	0x6aab448da3d1d978
	.xword	0x3eef90952eb368ee
	.xword	0x95917f63d04f7da5
	.xword	0x12c29d3fcbe34a65
	.xword	0xfcda528f75727212
	.xword	0x39215df7e23d5144
	.xword	0x8dd997ce27f3db33
	.xword	0x4fe36eef5b74bc87
	.xword	0x22860667ac9ec607
	.xword	0xbd06edccd27cbc0c
	.xword	0x677d4bac779c2697
	.xword	0xfd9e56d3d6e86acd
	.xword	0xf5f99aca6aecc517
	.xword	0x69c6a19dd95d8411
	.xword	0xc4efcdec6771a1df
	.xword	0x37e4a3a3f25f3056
	.xword	0x3fdfd083944c3750
	.xword	0xefddc269284abf42
	.xword	0x7d036f8428a3b984
	.xword	0x255bfeee1ac704a1
	.xword	0x71916694669e7334
	.xword	0x2c571fae846573f7
	.xword	0x844952a896b0fc74
	.xword	0x05c2a03903a2b5be
	.xword	0xfd5f84229a4ca87b
	.xword	0x6ebad6a0240b0b6a
	.xword	0xfbe52a2171532c15
	.xword	0xdbf99460d4e9f9ed
	.xword	0xdd3d68871c11fad2
	.align 0x2000
	.data
data_start_1:

	.xword	0x4fb08954e03f0fb5
	.xword	0xfb549aa01613b5e4
	.xword	0x5109f228e00d50f9
	.xword	0xb118d67a2e71a1a1
	.xword	0x98d726b4e28ae16f
	.xword	0x157043c4ef472e93
	.xword	0x19bec3a404699160
	.xword	0x8abe84b13e078879
	.xword	0x15556d74a91ac034
	.xword	0xf8c00ff970a3b420
	.xword	0xba84f540a73df4b3
	.xword	0x0a1625e418e447ea
	.xword	0x8c84b9a96ac690ae
	.xword	0x17864a4972b60db0
	.xword	0xcc8930840520843f
	.xword	0x003f4664edb916e4
	.xword	0x880b69feb61c4854
	.xword	0x039f3bf0060ecbbc
	.xword	0xd316be9151e5ce4e
	.xword	0x31a3e04775317958
	.xword	0x0ad09136c611294b
	.xword	0xcaa7138c707c3489
	.xword	0x1453a6d0549249be
	.xword	0x9c4a1bc006a6401d
	.xword	0xf85c69fe4ca647d4
	.xword	0xec50af00f728995c
	.xword	0x6f83e73c7c9ed5c8
	.xword	0x576667bc8c1db363
	.xword	0x5ba47743b234631f
	.xword	0xdd6d998fc6203287
	.xword	0xca205ca1512e998a
	.xword	0x3303ea2097325d53
	.xword	0xe763335e32b2561a
	.xword	0x78be65d2b12109fb
	.xword	0xe5caf9d03081b119
	.xword	0xac15f2fe9748bd93
	.xword	0x412da0a173845df1
	.xword	0x6b51ade3c932ade1
	.xword	0x9f1dee50ba0a0195
	.xword	0x14d18aff0178befd
	.xword	0x8ce383de07f1a52b
	.xword	0x87f42cbd74c54fe6
	.xword	0x0c7528097def42a0
	.xword	0xfe754adc4a763a4d
	.xword	0xfe0d470b397c650e
	.xword	0x9fe0da7d74f7d98e
	.xword	0x5128e8597e462f9f
	.xword	0x76b6fd335e3164be
	.xword	0x2acc3680c8cc2fbc
	.xword	0x6c555b3b6507fd30
	.xword	0xde04ec91596c6da3
	.xword	0x7959e9ddd220d464
	.xword	0x5a0773d13d8437da
	.xword	0x924a8af59dd8c69a
	.xword	0xdafa1841f23cae64
	.xword	0x8fc1891c26f80899
	.xword	0x1cd880dc9c03b905
	.xword	0xd2056c0b56911c3b
	.xword	0x8ecedb597b964a3b
	.xword	0x3cde18d4ce788f91
	.xword	0x3f3878c9b9353be6
	.xword	0xb31ee61e69ace2e8
	.xword	0x5595003277b992a3
	.xword	0xef08d1d949d71114
	.xword	0x910676cc65067550
	.xword	0x937bea1057ca833c
	.xword	0x12f38a7f4929833e
	.xword	0xcaf39d9c926b4658
	.xword	0xfbdefff0f6a8f390
	.xword	0xfd98ad0f1c1ff18c
	.xword	0x319c95185c8bf197
	.xword	0xb3ea4f148b9fcb50
	.xword	0x2d2edcb06813d481
	.xword	0x66dc49c159d6b819
	.xword	0x6791a36d5df3eece
	.xword	0xb2e7cd0e7636df7c
	.xword	0x12e54723657ecd36
	.xword	0xbe2f053b758706fa
	.xword	0x27f902a4ae26ff9b
	.xword	0x02d9de3b722cded5
	.xword	0xbd2c5fb6767eadf5
	.xword	0x6335c264aec772fa
	.xword	0xbcf2abfcd18a0388
	.xword	0x31e88e590eac333a
	.xword	0x6df7b3ccf3a3f01e
	.xword	0x7f52f87216d127a0
	.xword	0x8e6a8945bf6a3280
	.xword	0x94b1c6a8178300d5
	.xword	0x9feeb3d1526ac422
	.xword	0xa6ced801abcf5989
	.xword	0x7fabde4ff43945a4
	.xword	0x4acfc067b77158cf
	.xword	0xdda863557f7dfa4e
	.xword	0xca060924204579df
	.xword	0xf600553e559da18e
	.xword	0x98d65c1a1297ddee
	.xword	0xc2dafbe7e62288c5
	.xword	0xe9aba4977e4c1da7
	.xword	0xe3d70648d30d8a54
	.xword	0x0eb271483fad887b
	.xword	0xc07c65532f8fbb43
	.xword	0xca0e72693c8e78d1
	.xword	0x9c3baa6127f6e49a
	.xword	0x7640cec616025721
	.xword	0x098071f13849d746
	.xword	0xe19af4acee1a8711
	.xword	0x483abb957f29edec
	.xword	0x8fdb0a999a8ec743
	.xword	0xd11de6ef7e8f1315
	.xword	0xd717c3bcafd5b449
	.xword	0x8d462339cb8e2b75
	.xword	0x57130e1676ad3983
	.xword	0xaf4f61860305d539
	.xword	0x9925f2c1ab9c3c29
	.xword	0xfb0e58f216618da4
	.xword	0x3076af381ef99715
	.xword	0x2b40f64d204dbf96
	.xword	0x4eeb6296a5d38c82
	.xword	0xe50a0ae68228ec1e
	.xword	0x93243916896a7d76
	.xword	0x8eb6c13996ec2a48
	.xword	0x4dfa3aea9ed6d7ee
	.xword	0x53cc12477fd1aa35
	.xword	0x9a042e1b95cea128
	.xword	0xfa2645a559bd5cac
	.xword	0x613fe79ee1d75130
	.xword	0xa0801d3e2465d567
	.xword	0x3f1edb02210f7c52
	.xword	0x7a9e38967c83bd28
	.xword	0xcfbf113792ca8209
	.xword	0x290b8e7da005ee6e
	.xword	0x3f4d79f21e3a0c65
	.xword	0x0dfc27d37ebfff7e
	.xword	0xd12278ef67b88b3d
	.xword	0x2832ba6ce8acbcef
	.xword	0xc259b86c485d0d7c
	.xword	0x22a4cac0df17eb01
	.xword	0xefb5b4ebe6a17b7f
	.xword	0x1731303917800175
	.xword	0xf18b1dfa9309c2e4
	.xword	0xaf2d19e04def88cd
	.xword	0xb2c44ac52262f030
	.xword	0xaafc208dfda93abc
	.xword	0xe88c7a2b1e080294
	.xword	0x7e9f754903ce8ad6
	.xword	0xfc62621f5be3f77b
	.xword	0x5f6553420813b833
	.xword	0x6211e827015e5152
	.xword	0x18fbd76ddab3c6c8
	.xword	0x580d4078bb057a9f
	.xword	0xfe4c85b9782ad704
	.xword	0xb22ea0fced033578
	.xword	0x9fc7cda41cf024bb
	.xword	0x4a09314fb5b896c1
	.xword	0xdb33eac6e515cb6c
	.xword	0x5cd226dfa44ded5c
	.xword	0xe7d0b20fffac6476
	.xword	0x16457c422ee8868e
	.xword	0x235f2f66d8469623
	.xword	0x3d02f03190b90fe1
	.xword	0xab36405a306ec40d
	.xword	0xddbeda7efdf61477
	.xword	0xcceb26fa36caa630
	.xword	0x4aa85483567fe6aa
	.xword	0x0e6bbd751d833de9
	.xword	0xa896cbf824cc4649
	.xword	0x77c37ad1e38128af
	.xword	0x1ebb1e2aea8f9464
	.xword	0x3c49ed90f38ee52c
	.xword	0x3e0dee413cb944d9
	.xword	0x0678b76c571926bc
	.xword	0x4ad6b41a3e23cea3
	.xword	0x7585fbab1a037f0b
	.xword	0x416940051a0e0c42
	.xword	0xda815ffc9d5d66e0
	.xword	0xcd18a85b130115f8
	.xword	0x742059519f1aeb04
	.xword	0x16e10cd6281cc60d
	.xword	0xc16a2e9e4504fe86
	.xword	0x3c858fd037ea0fd6
	.xword	0xf4be0f185f828849
	.xword	0x050deb1e145403be
	.xword	0xceef4686f8bce43c
	.xword	0x4677a215b7aeec09
	.xword	0xce50611187e110aa
	.xword	0x34cdc029bd5836fd
	.xword	0x97c92f69663aff3d
	.xword	0x741809771d4722de
	.xword	0x9d10b92b983e5f46
	.xword	0xa3198c6fd72de55f
	.xword	0x9f1893a75e1e7612
	.xword	0x6dfef7ea8fc93d6c
	.xword	0xcedd20c2273eefaf
	.xword	0x8afe8b431f2e2e37
	.xword	0xcc8dc464f1e9ebfc
	.xword	0x5422de48cd5f7b3a
	.xword	0x987e4c0a0b9ec562
	.xword	0xe55d8611b0fb1939
	.xword	0x669fd559ff2f7d58
	.xword	0x18374461c7b18ba9
	.xword	0x3531d8ab2878c475
	.xword	0x5d0f5e5f161aad2c
	.xword	0xe56fee230a22dbae
	.xword	0x77331d7fd67c7325
	.xword	0xe536da58d91239e6
	.xword	0x4bdcd0cd0d10858d
	.xword	0x7ae5c1d620a66deb
	.xword	0x368e77ae62cf1522
	.xword	0xb59db1bcb3efed24
	.xword	0x5ef79aa4ffc8abe0
	.xword	0xeba2bcf8c5ddd403
	.xword	0x3448fcfc897c56dc
	.xword	0x8f4ee89e477c326c
	.xword	0xb51cdc70ed6dce97
	.xword	0xc89828de2820cd7a
	.xword	0x26e142d30232c1b6
	.xword	0x21b1f1ee858fa1eb
	.xword	0xacc6aa3dda3ceb68
	.xword	0x65bff06b6902d757
	.xword	0xbba4e4c72a310fd9
	.xword	0xb7bf0482c068831d
	.xword	0x5860f4876f6f31c2
	.xword	0x7a31703dbbe292e1
	.xword	0xd215079851c62e21
	.xword	0x9b88081d438933b9
	.xword	0x445aa895781f6940
	.xword	0x0d9371341a079754
	.xword	0xafe1b1e17264a018
	.xword	0xe0359efca1ae68c6
	.xword	0xa2f86b8b23c2ef3b
	.xword	0xacb78e0732b521bb
	.xword	0x56e536dac2cc3e17
	.xword	0xbb5e426ee2a2ac5d
	.xword	0x4fe43a1f48c94d34
	.xword	0xb6721aaa8b80a6cf
	.xword	0x0ac62a57f7cde82b
	.xword	0x24b5047190373e56
	.xword	0x380b08ac68b311a4
	.xword	0xfa8bb7851cd5e7b4
	.xword	0x07de4304931450c7
	.xword	0x37e4e07ec409f555
	.xword	0x82905488c7ecb945
	.xword	0x1f3a60e3810397ca
	.xword	0x7230390e1c94bee8
	.xword	0x1b345be35b7c675c
	.xword	0xfe60983c28a8a6cc
	.xword	0x1691759204beb7cb
	.xword	0xde28c8dfaf6acd68
	.xword	0xfd97f08b1203f419
	.xword	0x65c43f18f05657e6
	.xword	0x7fe4958d0aec636f
	.xword	0xb81e41fdbd6ed541
	.xword	0xc6af6c74ac18513b
	.xword	0xe8dfa26bd3c58598
	.xword	0x9240ece17f924f7c
	.xword	0xd285a54ba53b24f3
	.align 0x4000
	.data
data_start_2:

	.xword	0x563745ee8a01c12d
	.xword	0x64b5bf3c2c7a0957
	.xword	0xf3a6971a261a7aee
	.xword	0xbb1a75327bef9b2f
	.xword	0x193204d0497cd52f
	.xword	0xac3e72bbb28bef8c
	.xword	0x03e10a13f4ddcfec
	.xword	0xf3eded6777b01f15
	.xword	0xf073bbe7f53e3612
	.xword	0x0141aef81d69ca6d
	.xword	0x5642a9ef217d0f46
	.xword	0x0137bc1520f54eb9
	.xword	0xe7d7633c34547811
	.xword	0xd3f7e634cd913c5a
	.xword	0xf1e3efa14a3ff5e2
	.xword	0x65dfe878f08b7edc
	.xword	0xb7332b1167758745
	.xword	0x2584392350959ddc
	.xword	0x86f9a0b156984f2b
	.xword	0x044101b1f5181fb8
	.xword	0x5a6f76948d499abb
	.xword	0x825a6dbff211291a
	.xword	0xe266678939bdf86d
	.xword	0x3cffaeaddb1e7505
	.xword	0xe8fa4eef061d62f0
	.xword	0x4e06a6ea0fcac0a0
	.xword	0xe3f2d0f57fda79f8
	.xword	0xa484eb7572ad7fd9
	.xword	0x1748db394c3e6157
	.xword	0x5ea041c8a495075d
	.xword	0x3fa3081c36ca031f
	.xword	0x535fd209bfa458f5
	.xword	0x89457751a5c8582e
	.xword	0xcbf21a6204abcd38
	.xword	0xf941b97c53e640d1
	.xword	0xd5f5f2f51f137712
	.xword	0x89e0f76727efb16e
	.xword	0x13678c19cb3edb83
	.xword	0xfd7ce5fc3041490b
	.xword	0xdefd7d2a6cedf903
	.xword	0x93d74790fa648280
	.xword	0xdf38aaf862fe1f0d
	.xword	0x862988aca1305087
	.xword	0x186e51f2e9bc6bea
	.xword	0xfc6e90f0fa3b9c4f
	.xword	0x4670974f80e23448
	.xword	0x45d9ab1273f04b17
	.xword	0x271f3289be8a9b10
	.xword	0x8e0bf0208df378fd
	.xword	0x95c2d1296561fa89
	.xword	0x0b0ebae1f1de0b46
	.xword	0x2d781ae6ba71b9c3
	.xword	0xa02eca5ca8d845e1
	.xword	0xc9e7ba35400c91cd
	.xword	0xe66abf28ff923bd7
	.xword	0xc7cdc5a859ddc667
	.xword	0x1e72a207dd75ca87
	.xword	0xe0b8c1cef458f161
	.xword	0x63a9189e85e6f618
	.xword	0x920bc4c6fe4e998d
	.xword	0x87df652434e8349c
	.xword	0x72878881887adff5
	.xword	0xe32dc960ea08026b
	.xword	0x9dffdc3ea7de62dc
	.xword	0xe9ff4fe4d9d9d22e
	.xword	0x7701af7565e11ba3
	.xword	0x1ca4600eefe47b05
	.xword	0x1da2feed7e7db9f3
	.xword	0x9bf88622f6b20ddd
	.xword	0x9d9b54e047c97e44
	.xword	0xd803079b71a49150
	.xword	0x472b2977c9282cd8
	.xword	0x1ab7dc19d28d7583
	.xword	0x15accb259d6b1ccf
	.xword	0x8b503b81e0459b39
	.xword	0x603ec7ed298dcc6e
	.xword	0x6b614f61212a2129
	.xword	0x1f28779f9cb3b5c6
	.xword	0xb79e9e353dd52926
	.xword	0x072a2bb790de0836
	.xword	0x0078e022a02af3f1
	.xword	0x8732fbfdb91e540b
	.xword	0x579dd3cf813027be
	.xword	0xf211dfd3ac2cc89a
	.xword	0xcc6fe267cb6cc312
	.xword	0xb6dc82db83019873
	.xword	0x190b186f3df2702e
	.xword	0x1971af9ae5b0b87d
	.xword	0x2745d012ac6476b6
	.xword	0x1c3ba9a9a71b5987
	.xword	0xa57b4957da2df7e3
	.xword	0xbe67c0b3881e0382
	.xword	0x19ad5da0f3caea0a
	.xword	0xe543739c9bb4d421
	.xword	0x4bd1c2053fa2bfe4
	.xword	0x0f77a5a88d8a93f5
	.xword	0xbbdb8a087a0bb209
	.xword	0x914a26589919820a
	.xword	0x72eb848f4168e188
	.xword	0x45c300009456cb69
	.xword	0x9bad79dcfddc2703
	.xword	0x4d7aaf905c140c6d
	.xword	0xdeb6b7d6551873af
	.xword	0x9ecc245069ea96b7
	.xword	0x3d7d26d48f1c97d6
	.xword	0xf90d8430e6d2171b
	.xword	0xa7725531ca07bf79
	.xword	0x6e1a94dd304c57ec
	.xword	0xf1c642ea4a7466bc
	.xword	0x6d05ccf632a1bb1f
	.xword	0x5e5d23501589d828
	.xword	0x55df92ca6ba2915f
	.xword	0x144e21227aff8fc0
	.xword	0x9d4ac1fb0cc2b417
	.xword	0x9e0f8295ffd57602
	.xword	0x1921f4f9705226bc
	.xword	0x7bcc26adbdb0d66e
	.xword	0x73c35eb99d8c845c
	.xword	0xde514e1e1a8749cd
	.xword	0xe3bacbb8b713b152
	.xword	0x1013deba9de99a95
	.xword	0xed756cb38e99344c
	.xword	0x4afcfd20617856a7
	.xword	0x2acc8b64885e156d
	.xword	0x720882c56649ed82
	.xword	0x5bb7dfc3f492dffe
	.xword	0xde11c3541aad1f33
	.xword	0xd975eff0206682c7
	.xword	0x0ee67ea5507fb8d7
	.xword	0x53051828b81aeaa9
	.xword	0x9637375e1218f363
	.xword	0x130bf306589c79ea
	.xword	0xdfc1b211f99f6f27
	.xword	0x069cdd896432ce91
	.xword	0xfccf5bf5c7b631f6
	.xword	0xc0810cb7b91af823
	.xword	0x094239ef048bfd98
	.xword	0x99f48d8aadb60672
	.xword	0x766444fb80e32dc1
	.xword	0xc4a2e035ff646a92
	.xword	0x7edc5ae77bedb77e
	.xword	0xd928e1eec76acef6
	.xword	0x91bbf4140ba409d7
	.xword	0x2c69ecd562e8dcf6
	.xword	0x39b134abc3b7db95
	.xword	0xe7d81396cf36cc7c
	.xword	0xb78a5b73881a5dae
	.xword	0xc67ca8afa2e928fd
	.xword	0x3eb08a395018b0b3
	.xword	0x0967f88ae0f0f431
	.xword	0x22530b8caa8301f2
	.xword	0xc7d109bd1b62f2de
	.xword	0x4fa0815dc5ac397a
	.xword	0xbd5b7cf5c7f0d69b
	.xword	0x87465e01cf0f4a08
	.xword	0x5a2a5b49e9064593
	.xword	0xb995d0f49b6b4640
	.xword	0x36b8a25c5527ae54
	.xword	0x7025222602b27a6e
	.xword	0x2f674d1dbb223139
	.xword	0x03445f9821d97f08
	.xword	0x16290c93d62d7650
	.xword	0xa4a9c6a69e2ff8eb
	.xword	0xdbf577676c5ab8ae
	.xword	0x36cb0cc32d398379
	.xword	0xf14daa1fe2faf733
	.xword	0x01da1d3cd6d8d841
	.xword	0x98312e4411fd7e96
	.xword	0xdbfa61eacb2f179a
	.xword	0x6fbb85e315c42a06
	.xword	0x43fe7115e90e7273
	.xword	0x60b148b034b2c8e4
	.xword	0xe47a0baf7c25ef66
	.xword	0xf208c10a83416cfb
	.xword	0xe73733a60f0fe225
	.xword	0xde6a05adef1373aa
	.xword	0x066bf2120960d6c8
	.xword	0x83f0b9e03ad73aa2
	.xword	0xb376a394818c7f6a
	.xword	0x4993432e5b214cff
	.xword	0x3f06e89bdf0dabc4
	.xword	0x8c1444386bd3a331
	.xword	0xb8aa314c873f86a1
	.xword	0xc5e20d57e53c9f07
	.xword	0x69ca1b3472f78857
	.xword	0x4898c95a51060534
	.xword	0xb884b2b9c7317d92
	.xword	0x08b06543f3752b7f
	.xword	0x9ac34d742a857750
	.xword	0x9e165c7f2c9ac983
	.xword	0x9899f1cea9581348
	.xword	0x4e984b14abc6fcdb
	.xword	0x38beac0f5b347a55
	.xword	0xfc0fa9eca83d4f7e
	.xword	0x64d027aefb877cb4
	.xword	0xd4dfa91a088a7b2e
	.xword	0x679e113fc545ed98
	.xword	0x0a91faa5e470b703
	.xword	0x420e4b79c8d55e7f
	.xword	0x20ab3637b1dcfb44
	.xword	0x69ee22c878559793
	.xword	0x00f47916acc09aa9
	.xword	0xba21732a98d9a560
	.xword	0xf275476cd7455c1f
	.xword	0x579fd5952a4d8301
	.xword	0x6b4b375ea8d1f7ff
	.xword	0x877ab395d127987a
	.xword	0x00e7e6548cd1f7a1
	.xword	0xd042fd1e5ead8a1c
	.xword	0x88e0268f7fafc4b9
	.xword	0x6055b8e3901aea7d
	.xword	0x72efaa8ff13e588e
	.xword	0xba5ade2c19bc194d
	.xword	0xcdef0f476c76d29d
	.xword	0x17195afbda022ff7
	.xword	0x50a3773b206373f7
	.xword	0x6044d9a3e0bf32ec
	.xword	0x102286f2c86d7f97
	.xword	0x983f0aa6326236fd
	.xword	0xf47f2193e81a033d
	.xword	0x4dc9166248b4d64f
	.xword	0xc8a95d80d94950e7
	.xword	0x951b689c179aab6e
	.xword	0x98a910c618c046a3
	.xword	0x8fe923597dce27b3
	.xword	0xb567cfcc7732a771
	.xword	0xba9a0d6770cf441f
	.xword	0x37c4ec7bba7b7bf6
	.xword	0xf86a9706fba10786
	.xword	0xf3b4aac8d3854147
	.xword	0x7d9c9e18077a93c4
	.xword	0x84a58c2884e87446
	.xword	0xee759bf972a0c92e
	.xword	0xf5ff337a9e1bc36e
	.xword	0x6ab0fe5591205fc5
	.xword	0xea0b781144a91f1f
	.xword	0x5fd8726276c16083
	.xword	0xdd9018556b6b93e9
	.xword	0xba0f1077e0368d63
	.xword	0xe0de41e3ab2a1680
	.xword	0x8577d66c7b082d95
	.xword	0xce5256c003a62c1e
	.xword	0xa8e196447bb7a788
	.xword	0xefc97ba858100af5
	.xword	0x429a7f6216c6fa22
	.xword	0x50aef0f92a88f731
	.xword	0x28cfe5fb2ef7415e
	.xword	0xc737631160e61946
	.xword	0x7a281a03cd101d82
	.xword	0x497bd869ab017a15
	.xword	0x42d3155cbc4ae437
	.xword	0xd0cd7d74b65e1e3c
	.xword	0x113b44d282734d1d
	.xword	0xa809dc2833e35d97
	.xword	0x9b71d2155c58b5e3
	.xword	0x316e7433b7a6a93f
	.align 0x8000
	.data
data_start_3:

	.xword	0x2a74a77cb824e43b
	.xword	0xde27bcb3c9bb8d88
	.xword	0x5fd9356e270ef0dc
	.xword	0x1350c09195b37b9c
	.xword	0x35a31f51367a91e9
	.xword	0xc469691f3327d1f1
	.xword	0x51dd0b4cfd31bac4
	.xword	0xbde5262ea0395d91
	.xword	0x09cb5252a5faf0d3
	.xword	0xa1e3370badc24a33
	.xword	0x1825a847df5f139a
	.xword	0x4a9e58aadc0df431
	.xword	0xe6242b2c33751f0a
	.xword	0xd673bf0da0ac3d1f
	.xword	0xc7b154622f57811f
	.xword	0xaa85fea6ada83f0f
	.xword	0x5d20beac11dcef42
	.xword	0x951a9a23a1f61479
	.xword	0x458c791235d58855
	.xword	0x370559afea6d446e
	.xword	0xc3a653ee5d44f7b2
	.xword	0xb5d634187a8a20e9
	.xword	0xc9055be892740a83
	.xword	0xfc0b901f3ede4302
	.xword	0x2cf9d0b1aafd87d2
	.xword	0x421275e3df6a2155
	.xword	0x1342ae3fd9ff7eda
	.xword	0x11a29820d6d08ce9
	.xword	0x62626fdfcb4af6c9
	.xword	0x813321abb83669dc
	.xword	0xdbc67baf48d95c2a
	.xword	0x284f098eb6b45c59
	.xword	0xadea15413068fd0d
	.xword	0xdb8fd7a2697a3b4b
	.xword	0xf8ffc636b2206104
	.xword	0xb1a9906fccc58460
	.xword	0x317d9a2fc230e5fa
	.xword	0x60db3f1041ce4c34
	.xword	0x8604b031739e7ef6
	.xword	0x3c1e20b4c22bb446
	.xword	0x9c6eaa59b8137edd
	.xword	0x111ebfbffac361fb
	.xword	0xc7d47800b53bdbaa
	.xword	0xf7a3f81af78027a0
	.xword	0x5f6d54986e20fd54
	.xword	0x36c0fe01d678be82
	.xword	0x50550dfcc0806b21
	.xword	0x9be24dc998b638c2
	.xword	0x7710cf9f88b94f9f
	.xword	0xaef38dae1aad107b
	.xword	0xd432f66dc3633308
	.xword	0xa04a3491d0c4d830
	.xword	0xa50fd87d70be6729
	.xword	0xc65406076e12d685
	.xword	0x08eba9f97c879753
	.xword	0x97827db2ac45193a
	.xword	0xe9da1ab664514c6c
	.xword	0x3964dcc3bf8cefa1
	.xword	0x468136b6bf1dddf4
	.xword	0xe539664b3746baf2
	.xword	0x6dcc1494da95781f
	.xword	0xb385aa2b9fe0ebdb
	.xword	0xcf968de9d2827f6b
	.xword	0x53fe3c5d25ce916e
	.xword	0x3e6343e55e22c6c0
	.xword	0xad463569a58b06b7
	.xword	0x822e2da5950b262a
	.xword	0xbe4f8bcd0112d1e4
	.xword	0x82c5941183139bcf
	.xword	0xd9f671ea08a6fa71
	.xword	0x9a289d14e12c25f0
	.xword	0x505167096c4bb3cb
	.xword	0x2764c571295a214b
	.xword	0x439e01ed078277f6
	.xword	0xf1f6d4bf93aa8048
	.xword	0x224be4ef3f7ef877
	.xword	0xad018dbf9af43988
	.xword	0x12d01649884f0bbc
	.xword	0x44f97a7601a05cce
	.xword	0xa4138399f1e9a18a
	.xword	0x96ee949c935f3348
	.xword	0x6d041b113eedd44b
	.xword	0x706395dcf27d6f50
	.xword	0x5c7e2195714771df
	.xword	0x83ddcbe24782a803
	.xword	0x3ce1a0cb50f5bf29
	.xword	0x14bca7c162935dcc
	.xword	0x86af1b59e5b8e41f
	.xword	0x81364182b9c7355a
	.xword	0x9e2ffc43fe38ad70
	.xword	0x4336d8edde47653e
	.xword	0x34a704b174526902
	.xword	0xf4f055468da05776
	.xword	0xb8f7c9dfa44a96cc
	.xword	0x0cb77d42dc0454ff
	.xword	0xc2d54acbf84a3b07
	.xword	0x4bdab771f3e0f262
	.xword	0xaefb935ac751d440
	.xword	0x6e3bedae16fdf16e
	.xword	0x1043cb179fbe3c54
	.xword	0xc428aa03e340ec57
	.xword	0xdb35ba1ebdf96654
	.xword	0x750388fd2f47e693
	.xword	0x4c6c31ebc28c7e63
	.xword	0x229a9de969f3c3e7
	.xword	0x8ebea66c2403623c
	.xword	0xf8df2a6849f6d411
	.xword	0xbcb7d14cf3e2d489
	.xword	0x6578af1c166b6a39
	.xword	0xf9e91fe4f967cac4
	.xword	0x8d0941b86e4c61c6
	.xword	0x6514afda4c2b6c5e
	.xword	0xc5b6a13bcd524ea3
	.xword	0x15d02a06efe9635c
	.xword	0xe06e906bb7795acc
	.xword	0xd1459c238f751d3b
	.xword	0x89a4eaec3a1007d4
	.xword	0xacd485053c1ba5d9
	.xword	0xfda6e963a35c5c67
	.xword	0x2afe4f668c783224
	.xword	0x19188bc0fb4f75c4
	.xword	0xcc22a6b659969000
	.xword	0xc79f9c337b0891f8
	.xword	0xec73177736d863dc
	.xword	0xb3530f52e04c06a1
	.xword	0xdd97c6579c73eeb6
	.xword	0x4bd780a9f83243ad
	.xword	0xc1e7d74745e3bb8d
	.xword	0x197b58f75fe29cd7
	.xword	0x4321ca74b9971298
	.xword	0x3018c707b9125475
	.xword	0x38fbd5d17357a79f
	.xword	0xd7a9f4811fa67a97
	.xword	0x6006110ea973ac42
	.xword	0xb25f6602a18429b3
	.xword	0x0a5a24c198818dcd
	.xword	0x0a0a1ff67d671c3f
	.xword	0xa0d62cfeafac27c3
	.xword	0xf9015df6b6ece9c6
	.xword	0x2d7a4a7ab96e68fa
	.xword	0xf51aa97aa27d8b85
	.xword	0x4e80e4903dac1793
	.xword	0xf7ebe0ada548dbf0
	.xword	0xc378e31acd551e08
	.xword	0xd91732974f16ed8c
	.xword	0xb31af315b3f04f99
	.xword	0x0f6a480e5ce2d0ab
	.xword	0xc40cb93217102fbb
	.xword	0x039010bfb8d265fc
	.xword	0x21ea7f012819280e
	.xword	0x38fbf7179512b60f
	.xword	0xdca44e8ff4d9ef18
	.xword	0x5aee03a667894abe
	.xword	0x24f2b1e2b1a5ce8c
	.xword	0x148b8f5eacd2439c
	.xword	0x3ff9f8f67d2a0c7c
	.xword	0xa2a14020e8684154
	.xword	0xed3e86fe8facd62e
	.xword	0xbcba43854f2171dd
	.xword	0xf70643224133875b
	.xword	0xc0838c78f3bafeac
	.xword	0xcbc43ecdcbf0fc46
	.xword	0xfe281c9117a28dba
	.xword	0x3b08847d20b577ec
	.xword	0x0aaaa46effb7a2fb
	.xword	0x758a6c391f4efdf8
	.xword	0xbdb0b72f89ebefd6
	.xword	0x1152a90237467724
	.xword	0x4c7a69a61eb6c38e
	.xword	0x4ca5cbdfc18b0b82
	.xword	0x9b7ef1810fff68a0
	.xword	0x914b25992e7045cc
	.xword	0x4d657035406286fb
	.xword	0x00b55397c5a47c47
	.xword	0x069ad15499dd23b4
	.xword	0xce14243ce003083a
	.xword	0x83e7c86b0e8522e3
	.xword	0xeeeb8db3a43ae8c7
	.xword	0x9e2225b8061a1cdd
	.xword	0x345b905f422371fd
	.xword	0xd2e72e66ab305e62
	.xword	0x167bcaf89ac8f476
	.xword	0xad2b61804b42cc56
	.xword	0x03f9d8cf694f6b65
	.xword	0x0c30c801cc20fbfa
	.xword	0xc90266bd40298ebe
	.xword	0x9dc4bce0e7fe2712
	.xword	0x70c6f852c6909784
	.xword	0x46a78413bd01d66d
	.xword	0x08b2684d83f1872e
	.xword	0x91ba778eb17efc0c
	.xword	0x42f8baaf3c26d27a
	.xword	0x69e6dafb17b59f8a
	.xword	0xc4d4206b083c59e9
	.xword	0x68323ae7efc83f60
	.xword	0x5187a6b8b6433204
	.xword	0x5381241b37a3ec95
	.xword	0x04766fbf3ca2e245
	.xword	0x3cb27e4ba0c4820d
	.xword	0xfa545b1085ce34b6
	.xword	0x20e3b6644f39582a
	.xword	0x6c7929fd92894557
	.xword	0x834c65cec8fb9a61
	.xword	0x72940eebbfa925cf
	.xword	0x41811f24a1720043
	.xword	0xd54ddce344b59b02
	.xword	0xaea0d0660c39635c
	.xword	0x6d831ac468724f8b
	.xword	0xfdb6d6bf1a7258c9
	.xword	0x8c36bb8cbc5c1e9b
	.xword	0x5f6880fe34023165
	.xword	0x7eb3f829b1062251
	.xword	0xae57a0c9c192d79c
	.xword	0xdfb9ac41e61fb147
	.xword	0xa453d9b42bf27764
	.xword	0xc44c6cce2cd3311c
	.xword	0x0b3a3ac793ab16b9
	.xword	0x16859a1845eb51fb
	.xword	0x576589a0bf79731a
	.xword	0x6be0df83bb4d88d4
	.xword	0x6ce1a5fffca0c707
	.xword	0xb650062bbc6e7271
	.xword	0xe0068c646a4ee09a
	.xword	0x1cb7afcae514e027
	.xword	0x466d0f3d56d1c450
	.xword	0x8b5aa6b09d3139cb
	.xword	0x85245ce6818ab1a1
	.xword	0xe204fb3176ee7e28
	.xword	0x92c5d1cb20e4b6cf
	.xword	0xa49c1cecce94cc79
	.xword	0xe3f70032ad386df5
	.xword	0x1c9020a0bff0e732
	.xword	0x7c723c5a2bc99316
	.xword	0x14b6260f9d7c3ea6
	.xword	0x38d796790b233dd6
	.xword	0xadba7c316d24f437
	.xword	0xf096e3dc2ebb5dfd
	.xword	0x7e244710056e484a
	.xword	0x62e229cf6483b479
	.xword	0xcaa32a9d73763ea4
	.xword	0x4a4230aa18b811c5
	.xword	0x4fa5b6b1c7025864
	.xword	0x05528f7132a8b941
	.xword	0x664ab0170937fecd
	.xword	0x47718ea8c7dda7ee
	.xword	0x729b743846f5fd4d
	.xword	0x05f60e9ace60d0f8
	.xword	0x7a5bfb6cea1ceb6c
	.xword	0xd8dfb9652ae8bc6e
	.xword	0xa56e6513702c4887
	.xword	0x1ce5be7e3b4db98e
	.xword	0xb284b4902cdd2445
	.xword	0x5eb8394296fcc2aa
	.xword	0xeccb8e5479b375cd
	.xword	0x1d335eee899b0430
	.xword	0x55f55e3a9b3887ac
	.align 0x10000
	.data
data_start_4:

	.xword	0xede4bb52902b3a65
	.xword	0x3574a4079b04d3d4
	.xword	0x24fe84a24b6f2b8f
	.xword	0xca5522cac1e5cca6
	.xword	0xf0cc12ac9abb7d50
	.xword	0x16ed965c6e1282ef
	.xword	0xc36429281bbb8be0
	.xword	0x81fcf2bb8d9a4b34
	.xword	0xcafd8fdbb07a6d1e
	.xword	0xf43c8d1dc6d13b0a
	.xword	0x30aa63fc5bb55b46
	.xword	0x830157b22f2a0a9b
	.xword	0x99bb63faf03d328f
	.xword	0x23763ea0750d100f
	.xword	0x9e09f8bd22fbd7bc
	.xword	0x54cca1e6e5fba6b2
	.xword	0x076785a1ff8b0faf
	.xword	0x17e57fb18f7073f7
	.xword	0x83db423a28b43669
	.xword	0x495cf9094c577695
	.xword	0xf21838b6e9efe764
	.xword	0xf0a9d7dc7f418f79
	.xword	0x27271b613abe42ee
	.xword	0x28bd9a3a3f42e459
	.xword	0x3254cf745a5403bd
	.xword	0x10f5546fc44ef2d4
	.xword	0x545ec0828322a0eb
	.xword	0x264a46022974b72f
	.xword	0x82a2e6f5e72ae9fe
	.xword	0xb615ecfb0418c1a3
	.xword	0x97651c1ee65e7771
	.xword	0xfe117f815b488682
	.xword	0x003044e20a6405d7
	.xword	0x6b90d7bb06b333e7
	.xword	0x3b5e9d5645d3f9fd
	.xword	0x7287699922084709
	.xword	0x1d3bd6765fcfdfae
	.xword	0x2eb419ece332cabe
	.xword	0xbf250365a50b1ef8
	.xword	0x532ee49d07850550
	.xword	0x209dddaee0758c83
	.xword	0x3792db0ae769be2c
	.xword	0xa4d0fc2d5d5b30a2
	.xword	0x3f6e97648e7b59d8
	.xword	0xfd3680c303f25655
	.xword	0x201149c66b28f3c5
	.xword	0xc33980c0d4fb3cdc
	.xword	0x47308f8af77a9626
	.xword	0x0d6c8584a0d46b1a
	.xword	0x1e77abd0a94434fa
	.xword	0x3a2baa6516bdc21d
	.xword	0xd189db704505d257
	.xword	0x3e0650f70c1913d8
	.xword	0xefd2ce8311008ca1
	.xword	0x79da47d93dc474fd
	.xword	0x0f031418eaba6129
	.xword	0x996c36d2167d4bbe
	.xword	0xe8e3f8b27a67e538
	.xword	0x3f183d1c19fb71a9
	.xword	0x4c7dfdcb7e4e6f67
	.xword	0x31e258e8636014b4
	.xword	0x22b3658d89677c3e
	.xword	0xc9e96849b4c55108
	.xword	0x685969a05a1bdc1a
	.xword	0xdf4408c9d0f98693
	.xword	0x241d9eb3caa27214
	.xword	0x776fa8785e8951f9
	.xword	0xc17b8a2eda0c86a4
	.xword	0xda0b68eebb6571b1
	.xword	0x5013a39218cf4e73
	.xword	0x8e685d443902a119
	.xword	0x1affbf36cb152408
	.xword	0x3386bbfc00ef7d75
	.xword	0xcac16aa5b72de07e
	.xword	0xebea6cf3e19196d2
	.xword	0xd8afdc385e4a4c52
	.xword	0x8872f134bf2cd3ec
	.xword	0x7ffab5d6446c723a
	.xword	0x4065024de37a0511
	.xword	0xe1e64dde0dacb9c8
	.xword	0x7c1e6e11e87d6da0
	.xword	0x8c2af31ef89ad393
	.xword	0x3105457f48300e96
	.xword	0x6ad4ecb060dab22c
	.xword	0xa71df816b2f7fde7
	.xword	0xad988b308b5d3999
	.xword	0xb6efd3678c257c1a
	.xword	0xc53ba0b826d57f8f
	.xword	0x12111e5e9c842e3e
	.xword	0x1a266d0b9822b17e
	.xword	0x5e604727aed2bddf
	.xword	0x2cb7b0c0404ac745
	.xword	0x9b7215bca9f7683d
	.xword	0x3dbc52b39fe13578
	.xword	0xe8b869b09013561d
	.xword	0xfab25daddc1a4ed5
	.xword	0xad3a12109b5a29c6
	.xword	0x369bfd585af8458b
	.xword	0xfebd6da8c81eaa44
	.xword	0xb529e26f47130a7b
	.xword	0x49564e05f16f42f9
	.xword	0x4fc96add92c1e6ef
	.xword	0x373f4238180b3ec9
	.xword	0x9a4d1344edbbd679
	.xword	0x96a095ba841bfc31
	.xword	0x7216a61beea7ab04
	.xword	0xee539cc0bf8a5dc0
	.xword	0x0fa0f8ee0fe57be0
	.xword	0xf03479f647b62f0b
	.xword	0x472b6935077d487d
	.xword	0xaf147d922dcb866e
	.xword	0x2ec7ecd03e923917
	.xword	0xfb0e26acef5841cf
	.xword	0x5d636cb68d94cbaa
	.xword	0x74e66f0d668d8433
	.xword	0xd44d98a60f7c00fb
	.xword	0x2c9524f086f594d9
	.xword	0x545e55ce547158e5
	.xword	0x9be2ec381f935e93
	.xword	0xfc249cc3eb6ae74d
	.xword	0x72f5a390c3740f3a
	.xword	0x065ed15ddf341e37
	.xword	0x22fde9a65a078d21
	.xword	0x45fc375cad3c6c37
	.xword	0xf039e62645413ff3
	.xword	0x2f74555e8ee47cb8
	.xword	0x923f53793c3ee5ab
	.xword	0x738c879e72eac40b
	.xword	0x0944cd410a9ee04d
	.xword	0x0f1d7237a44ad77f
	.xword	0x371802ad7f470741
	.xword	0xe15b5996dd2d4297
	.xword	0x5fd4f02d0f35e92f
	.xword	0xfb085c21cb4d1580
	.xword	0x8af0d4e310f6bd84
	.xword	0xe2ac1fb25f3f6134
	.xword	0x24ab4241fa79eb6d
	.xword	0x399801b0471ff290
	.xword	0xfbc0dab1a0ad5d12
	.xword	0x2dc3f841d31ccd90
	.xword	0x7dfe94c2b0411bb7
	.xword	0x023eecbab4294c7b
	.xword	0xb1b2954f1f5e8217
	.xword	0x241713f8652f4f53
	.xword	0x62f219003632e583
	.xword	0x5288b895a70d143d
	.xword	0x15d0521a1ec85a32
	.xword	0x3b7403103c7d0c1a
	.xword	0xe879f0b30f7e6782
	.xword	0xe1c1eb706190b4cf
	.xword	0xe384bd2262f34aba
	.xword	0x183b4bdf752233d0
	.xword	0x5322cc801832eb9f
	.xword	0x143308dfe32749d5
	.xword	0x4cf4a7e171715d28
	.xword	0x60802ea47f5d7b70
	.xword	0x6568da96cf21c66f
	.xword	0x376e1336c11561c3
	.xword	0xf9b7b3f4c01d1719
	.xword	0x1ed061015d914ce0
	.xword	0x68ce6e93d805b502
	.xword	0xb2c66c9764062745
	.xword	0xd6e454088ac5370c
	.xword	0xb9a145587e38be87
	.xword	0x5340830d5203fe35
	.xword	0x382734263dcb7f5a
	.xword	0x1e4a9eb4e5914847
	.xword	0xbeae7e6a4f02335d
	.xword	0x435be349cc74b67b
	.xword	0x2f4c0c1dd1b8cf02
	.xword	0xb5d434a1253e2910
	.xword	0xa8fdae61a8396851
	.xword	0x4599aca7b726022e
	.xword	0x0513bed6654d7172
	.xword	0x0b8e55efbb44946e
	.xword	0x206f53213c903ee9
	.xword	0x91d3d2c79de5425e
	.xword	0xae60d1fc800eb374
	.xword	0x06fac2bf9699141c
	.xword	0x1cdb11d3dc8dd66b
	.xword	0xb431ab1ab449154e
	.xword	0x4a3487c4e3023f9a
	.xword	0x308d2716907b083e
	.xword	0x3b79a3a768b71d88
	.xword	0xa5b073300d87534c
	.xword	0xaf4667d7ad1c4243
	.xword	0x1804f6517f66d3e5
	.xword	0xb7f0465bb1d11ccb
	.xword	0xf13a2619b7da7754
	.xword	0x41383514aacd66a3
	.xword	0x95562fd79cd936e3
	.xword	0xa3c646cbf88362d8
	.xword	0x4503ce527dc9d24c
	.xword	0xb6bb7d8d79791f44
	.xword	0x73fa54eb7cc17fdb
	.xword	0x2385e76d7910a790
	.xword	0xc8fa7f9c89518579
	.xword	0x3ae4b48b6c50c2d5
	.xword	0x5c3261b577d90f48
	.xword	0xbb7bdad9282a1cae
	.xword	0x1815c256e301ada0
	.xword	0x04c2584b0956105a
	.xword	0x4466420eecde2941
	.xword	0xf067a73d34745a33
	.xword	0x1a696e3ef167bd00
	.xword	0xa00d8b60a3e29785
	.xword	0xa35670380af73565
	.xword	0x2b58ff20bb717067
	.xword	0xeb4538752741f079
	.xword	0x98f312ac53b4db9c
	.xword	0x60336f1838356916
	.xword	0x0accf5cccf8ca8de
	.xword	0xbfda42823f0ae4b8
	.xword	0x692e30ff9c5e8843
	.xword	0xe1e23e8ef43afb74
	.xword	0x3fa332e0a600294d
	.xword	0xd88b5032617e8740
	.xword	0x10868014267bca81
	.xword	0x5335ef8bea91c4da
	.xword	0xc38e7cbb4eadfde4
	.xword	0x0e7b35983c91b12b
	.xword	0x2efc5238baaa95f3
	.xword	0xf0a3ace9b69d833d
	.xword	0x6577d7bd07a7655c
	.xword	0xc20c15103a2ccdc8
	.xword	0x9497b1af95278ca6
	.xword	0x8e80e6d4535caf33
	.xword	0xd1a5b9767ec102e7
	.xword	0x2bcccfc9b4c346d5
	.xword	0x028d21e14d684706
	.xword	0xe9f414f9f46982c9
	.xword	0x8e6255f3cef1a68a
	.xword	0x6853a07953aa0edd
	.xword	0x2beff3a90a3f72ea
	.xword	0xcdf5476ea6a283c2
	.xword	0xc196c79f8fec9291
	.xword	0xd7434d36019ffcaa
	.xword	0x83947cbf486ba58b
	.xword	0xe0864181e0ead912
	.xword	0x892cc401d22e4e6e
	.xword	0x06e988a5b0d206f7
	.xword	0xbe8913e305f4fb9b
	.xword	0x41f490ad68063057
	.xword	0x108af4636cf34fd6
	.xword	0x497b9906c1befdc8
	.xword	0xf8cf09abe65eb070
	.xword	0x701b991a41e0246f
	.xword	0xba4e907be95f8ab6
	.xword	0x01de711dd78a2726
	.xword	0xa47f1bb409aeeb51
	.xword	0x5621eb41245acec9
	.xword	0x994ec8d5f09bdba8
	.xword	0x16dd9f30a2b1e663
	.xword	0x284c2e3333d5e9f0
	.xword	0x5cbdcfc51550c0e3
	.xword	0xa773d4709a3d7f80
	.align 0x20000
	.data
data_start_5:

	.xword	0x3c7d835964281128
	.xword	0xa3e8da91b1644861
	.xword	0xb189260477112137
	.xword	0x98a2841b3fe39465
	.xword	0x9011e92329876e51
	.xword	0xcbff9ba361401dc5
	.xword	0x12efc7a2055b9e89
	.xword	0x038a528089b9213d
	.xword	0xd384719bf737b4cd
	.xword	0x622be2c31b23933e
	.xword	0xbf660a3400c42cde
	.xword	0x420c03499571e3ac
	.xword	0xab3d45bc918f65d7
	.xword	0x1bb1b87413773e9a
	.xword	0x706d6a06767ed46b
	.xword	0x9229dd8625b4496a
	.xword	0x2deea361c104ca54
	.xword	0x7a88313c2fef3976
	.xword	0xe782df26c9ed1ee4
	.xword	0x0c8d6c82d17e17f1
	.xword	0x99529206422fc80d
	.xword	0xe2b403d6d35567bc
	.xword	0x735d01bf43380cd6
	.xword	0x3faa706596dff8b4
	.xword	0xf910c852de48773f
	.xword	0xcd34323027eae580
	.xword	0x76a37d254ff80c92
	.xword	0xc2aad85437e6ef7c
	.xword	0xa452790e31bef19f
	.xword	0x8e0df00921ec4ddd
	.xword	0xf45b94a523cc457d
	.xword	0x367af10ec5838b69
	.xword	0x5081a7ca9e22107e
	.xword	0x89f10d38e2ef16a2
	.xword	0x9ec333b500c5313f
	.xword	0x7022d31d4c8fd824
	.xword	0xd3f9557b4a457daa
	.xword	0xefbc86a1866ba87c
	.xword	0xb5760f86efe27428
	.xword	0x2cc7bea07cccdcc1
	.xword	0x5c8ac06a49c1054a
	.xword	0xd006397b711720e2
	.xword	0xa680233e6d15b344
	.xword	0x6f8fb925dc935474
	.xword	0xbe8be5d5bdcfdc73
	.xword	0xb509adca67f8253a
	.xword	0x6924fd1c93edf3b1
	.xword	0xb9a785ec300a346e
	.xword	0x3eb9e37002867a03
	.xword	0x3c6153e5b73b6590
	.xword	0x57d32eb0e2bb9677
	.xword	0x8fde42b3a5a12120
	.xword	0xbd868343c6a60b0c
	.xword	0xb4e3c7afe2e1dd50
	.xword	0x944769242a6ec63b
	.xword	0x9a12fbd379737373
	.xword	0x2fa48ea843d8572c
	.xword	0xe96744af3f1d6d09
	.xword	0x253c1506b57002b2
	.xword	0xf6eb40baeccc89ba
	.xword	0x6546703f975b3208
	.xword	0xa6b9ff14557cb980
	.xword	0xcdac7716208f9b16
	.xword	0xb7a0d60d08a42a12
	.xword	0xf2179b7ba84ea717
	.xword	0xc677c3e6cfebf95d
	.xword	0xcf9df7eaff27d462
	.xword	0x0fa58054e56d4f3e
	.xword	0x3ead96bf7019ef16
	.xword	0xee8831e48371cb2c
	.xword	0x6519fa0cb592e955
	.xword	0xbac76c5eb06a53e6
	.xword	0xc2a4a599fa496a74
	.xword	0x10b1a10729d98d85
	.xword	0xd1d9d9c198fa387e
	.xword	0x953c3c367c080565
	.xword	0x67f0287eb51c916a
	.xword	0xcf1f4c2f1fbc8212
	.xword	0x100ec8f2054abab5
	.xword	0xde8a36037d14141e
	.xword	0xbda677e8f689310e
	.xword	0xae6af3af2a173e6d
	.xword	0x151c44d577687355
	.xword	0x19493afc43a15e2d
	.xword	0x75bf12b8b3a7fd47
	.xword	0x778c0506bee882d2
	.xword	0xcee4548caf8b8687
	.xword	0x4407572e7e78a645
	.xword	0xbb0066503c0686bc
	.xword	0xf50654e7c257a4c6
	.xword	0x0e5689efbd361bbe
	.xword	0x232db50f03f6f177
	.xword	0x83feec7d1b47be99
	.xword	0xc43cb029b74103dc
	.xword	0xe6b9230db0cc20d5
	.xword	0x88bdd199dbbbf6db
	.xword	0xf7e5124abf123e7d
	.xword	0xf75eb7774f3d685c
	.xword	0xe4b5aa9476959fdf
	.xword	0x04dcf5751b475bb5
	.xword	0xe077e6f709919f7e
	.xword	0x59d3660005980048
	.xword	0x094db0e35fc7ebbb
	.xword	0x917877548a8dd278
	.xword	0x36c9ac1b733f9657
	.xword	0xf9869cb2bd9b7a02
	.xword	0x3fd2876c0e9944be
	.xword	0xc73be34f73c5044e
	.xword	0x29e745b7c39cb4ea
	.xword	0x6aad96895fc169b0
	.xword	0xa81579c9696e2807
	.xword	0x681eff3f091d47cc
	.xword	0xed280188e1e3200f
	.xword	0xed3923f92a570927
	.xword	0x660f048533eb07c7
	.xword	0x8bd8059d09fc0dc6
	.xword	0xa54ff9fead923c94
	.xword	0x3c4725c64c0df0a5
	.xword	0x15df4676e163c3a0
	.xword	0x80812140e5d3b52a
	.xword	0xa835f3e5b9f92067
	.xword	0x690533daf9701e93
	.xword	0x5a4e965b82648851
	.xword	0x5dafbdd729b0793f
	.xword	0x2b04e9ef0cfa4a62
	.xword	0x834318a5d3faa432
	.xword	0xe237ad1a3df58f89
	.xword	0x44df82f36412fa59
	.xword	0x241856383fec3052
	.xword	0xf2a7d02633af2efd
	.xword	0x295529a3ca4e098c
	.xword	0xaaa7de045de3b4e0
	.xword	0xba00e8fb3ad30405
	.xword	0xd083736ff15e930c
	.xword	0xe8d499897f010f37
	.xword	0xb34192600c55952b
	.xword	0x2a477095666e8c47
	.xword	0x192f6b7af419226a
	.xword	0x84451284c558ba11
	.xword	0x01e9c89a9c70aec7
	.xword	0xb5548a7006ace057
	.xword	0x2f76b35ffd1ae29a
	.xword	0xf13b7b5d72d6be19
	.xword	0x4da8bed89df9e4ec
	.xword	0x85dc48b38b94369b
	.xword	0x3f468ad88523b86f
	.xword	0x3d6eca16e6a146c0
	.xword	0x67918b8cdd5a3faa
	.xword	0xcca5e29025cee060
	.xword	0x45e60e8c10b0f664
	.xword	0xc2b828251979bfa5
	.xword	0x833bd372ddf73f6b
	.xword	0x839a7b6bed970cd9
	.xword	0x780c5091e56c7f6b
	.xword	0x8b62a8f70d59a8bc
	.xword	0x060470716bdbc380
	.xword	0x6aec91170aa64ee1
	.xword	0xedc644bf494fdff5
	.xword	0x1055beb62a822222
	.xword	0xe8057303cfbfe855
	.xword	0x338391423dd4046b
	.xword	0xa69c59afe3eac872
	.xword	0x9cbe9dc50f71230e
	.xword	0xb4d1a6b60eb04822
	.xword	0x5ae82a4ed0a54ee4
	.xword	0x0527cfa160c9efd6
	.xword	0xe4c0a4c9c155f44d
	.xword	0xbb77e9a6857e32e1
	.xword	0x3515809c1919facc
	.xword	0x0fcc45aed2ce4573
	.xword	0x725f4696aa460ef0
	.xword	0xb6bb792a0548da43
	.xword	0xdc5da2a887f6809b
	.xword	0x539cce3567818cc6
	.xword	0x40f9011f18a56896
	.xword	0x11c2e24b0b3c0d7c
	.xword	0xad403da61d49cd04
	.xword	0xad635fa5715c2945
	.xword	0xeb2384c6068c1801
	.xword	0x50a69d7b768e9a74
	.xword	0x6e433952cc37c55f
	.xword	0x1e47305150c89875
	.xword	0x0ced5a07fbad189d
	.xword	0x31556ff9d198a885
	.xword	0x2563d54e81380233
	.xword	0x268ccd78c1538240
	.xword	0x22bc2ebdee595e77
	.xword	0x1f9b640fadd1653c
	.xword	0x3cc20182bc96bbee
	.xword	0xb128be3c58ca0adc
	.xword	0xb99c5113a8cd315a
	.xword	0x59c9b98c404219c7
	.xword	0x4af896a35802165a
	.xword	0x95d64d8984e44bc6
	.xword	0x7f8d13d750f74c2f
	.xword	0xdb2efa6d0dd827c3
	.xword	0x90d5a9df923c11cc
	.xword	0xd600b2f3b31e66f5
	.xword	0xed2c5ae149b30607
	.xword	0x33d4f93b242bc7f7
	.xword	0x83e64ee82c42f484
	.xword	0x18066e1ca2591718
	.xword	0x720eb151569edb73
	.xword	0x2f3a04d3fca402c8
	.xword	0x9c653404bad4351c
	.xword	0xa866a7b04a428a0a
	.xword	0xeb0e881caa0f7072
	.xword	0x581093102e3b2979
	.xword	0x8319d42c1943e7d0
	.xword	0xde651d63d61cb1e3
	.xword	0x50352eeb61855a9f
	.xword	0x0bcb7f44b460c525
	.xword	0xcbc88132bd209208
	.xword	0x3ae440707c836c9b
	.xword	0x505076643c725c1a
	.xword	0x46e22954cd436464
	.xword	0x23e9b57f0a6ded43
	.xword	0x362b004a1c5b6f49
	.xword	0x4274dd42b049c6f2
	.xword	0xe369a23efc85e984
	.xword	0x1313b97785fae8a3
	.xword	0xc7be2068809d4adc
	.xword	0xa79b3cda8c980ed7
	.xword	0x48980cda9d61d4cb
	.xword	0x2f5bdd3fbaa70a94
	.xword	0x1feec039ec411696
	.xword	0x014451c211d097a2
	.xword	0xa0e8e0e62fcf8652
	.xword	0x2a68aa6e689bd853
	.xword	0x1db4c77f40457e50
	.xword	0x1887e96e59349202
	.xword	0xa40fbda997618c7a
	.xword	0x20313920bdd190ec
	.xword	0x231e19f45a28e028
	.xword	0xb7a2b16ab9d19bc8
	.xword	0x00c7cdf179a23b58
	.xword	0x21f9adbd639d621c
	.xword	0x9777c7edbd0ad024
	.xword	0x4ca907de144f044d
	.xword	0xbc7e48e0770572a6
	.xword	0x9924f334ac1146e3
	.xword	0x36b0a86d33676151
	.xword	0x7e5b445eb663bfa0
	.xword	0x9ba642d40047bde8
	.xword	0x76c853735140d1ad
	.xword	0x7566de266d377074
	.xword	0xcccc86580bd999e1
	.xword	0x746029aa3d60a567
	.xword	0xc7393bbc65da786d
	.xword	0x5c2d01b97ac7547f
	.xword	0x5e8ec5276e698b76
	.xword	0x1a0b7cf8ad2f1f26
	.xword	0x6689851625f98713
	.xword	0x35f6b2b91cbe25b7
	.xword	0xefe89f2c93562ba4
	.xword	0xb31c13ab9fdff96c
	.align 0x40000
	.data
data_start_6:

	.xword	0xbc3981f90c7bf2d7
	.xword	0xc7fe9a7c1f454a57
	.xword	0x5402efaa912cd611
	.xword	0x89f7a0d55b3673a9
	.xword	0x04186c069c7918ff
	.xword	0x928c1239f633512d
	.xword	0x71b822630c9181dc
	.xword	0x57827ba1c499f3b6
	.xword	0x2b3087935668b821
	.xword	0x236e923459210919
	.xword	0xa36b4816196fca29
	.xword	0x5112df25d3659f7d
	.xword	0x6257a18622e611a6
	.xword	0xbda877e9b709b183
	.xword	0xaa1a1d0ad9ccfc2e
	.xword	0xd7efaa38784992af
	.xword	0x8f5b394f5a0ab93d
	.xword	0x12d43aa83aee1ea4
	.xword	0x6594fc110e093d44
	.xword	0x5a11d2616f3c9544
	.xword	0x8a8b2c22fc4f8776
	.xword	0x974f5f6f633692bd
	.xword	0xfc130f3546adf802
	.xword	0x241c660c65e7f57e
	.xword	0xec1c53e3e909cf03
	.xword	0xfc5a391188b3f582
	.xword	0xdb69c3aed76b453c
	.xword	0x5930a4c0a2da9395
	.xword	0xa3189f3d8e847806
	.xword	0x9533a368351ca482
	.xword	0x6a938d6ae4ee2f21
	.xword	0x0a4de7431e2439a6
	.xword	0xaf227e3c0a165d38
	.xword	0x8f5406cf95c4241f
	.xword	0xa7800119f18fd857
	.xword	0x431815cb9745ec31
	.xword	0xeef0d2c18d7e8f59
	.xword	0xa2fefead0fa2b007
	.xword	0x83c658fbf7c31c67
	.xword	0xf3c7a3334903a354
	.xword	0x3370b3162a206f4a
	.xword	0x72ed7a05963a86f5
	.xword	0xb30fb7ffc846ab2f
	.xword	0x950a5207122e1f47
	.xword	0x25fb3057c4767a12
	.xword	0xbd34b0c5c7a9ac38
	.xword	0x43d51af5769d1294
	.xword	0x1b40779fc656ddcf
	.xword	0x90e0919b71b77ead
	.xword	0x552d4e2b9cef210e
	.xword	0xf0151425a7db8d4d
	.xword	0x00b63032c6b4dfd5
	.xword	0xf8964e12c5beb20e
	.xword	0xd96b49eba461b97a
	.xword	0x1833b6646f8651c0
	.xword	0xa56e9e0d8a218d0b
	.xword	0x244419e0c225b04f
	.xword	0x05f9885760f8b56f
	.xword	0xf26938e6c112d9c7
	.xword	0x2c59ea31d64975fa
	.xword	0x93fa861d09581528
	.xword	0x088214627fd69dc7
	.xword	0x35f6cf91a16a644a
	.xword	0x01d03b0effce161e
	.xword	0x2549c4887ee25b12
	.xword	0xd667f6e0205fb4bd
	.xword	0x0251624707ef6d3a
	.xword	0xab028ff6aab08189
	.xword	0x681690ee5d824781
	.xword	0x97471102a44e8931
	.xword	0x4d9fe156a5daa0d3
	.xword	0xde2ad0a734c92a64
	.xword	0x98294147cc212e9e
	.xword	0xc43f68937422b7d8
	.xword	0x2837f6155744e4f2
	.xword	0x99da59fa7003d8a8
	.xword	0x79c6cd275847d307
	.xword	0xe3990e7cc631e960
	.xword	0xa20d7836fae8798e
	.xword	0xc3979227667e1d15
	.xword	0x16aa8786ec071d60
	.xword	0xe9b93fdb7555ca50
	.xword	0x98c23e74d0ac93e3
	.xword	0x19f2b9948947c222
	.xword	0xb5c166cbe0732895
	.xword	0xaafd12c8c2d4f3a4
	.xword	0xf287401472a8a26e
	.xword	0x093af20b8a5364c5
	.xword	0xa503826f7beb52f3
	.xword	0xf5a00b8ac8ed06dd
	.xword	0xcae5f51704ebf2b7
	.xword	0xbade6c285e171892
	.xword	0x4324f86236df6102
	.xword	0x9a5578405d4f3923
	.xword	0xf90c5690f3608e39
	.xword	0x1e626cc468eb4b73
	.xword	0xb0ac9533f6ad781a
	.xword	0xa74fff7580e3eaba
	.xword	0x955fa03f38c9ed10
	.xword	0xff6276f4a25854f2
	.xword	0x9d4c86b00464d3e5
	.xword	0xf77e5f003708747e
	.xword	0x1106a97641d860cf
	.xword	0x8397b676b169d1e3
	.xword	0x9e08dac2d45294df
	.xword	0xa85c6b1d38dbeedc
	.xword	0xd2c491200915b7f8
	.xword	0xa726ecb3fa9c97e6
	.xword	0x1771e5f436c99376
	.xword	0x5be92a10375a8540
	.xword	0xedada933f503e4d9
	.xword	0x5e51239f56973a99
	.xword	0x61a1f32c46118604
	.xword	0x1651d6100157675c
	.xword	0x2b0e3c98b4dc3558
	.xword	0x25295a56c739a01c
	.xword	0x558a66e9458cb8a2
	.xword	0x60a1379612814e37
	.xword	0xd724003fffcd0b3a
	.xword	0xa1fbf99452d44b9f
	.xword	0x2a79c7175ea19d36
	.xword	0x96cfe292c9ce6e4e
	.xword	0xea324da71ad964b0
	.xword	0x1e1e5bfe3e8e3b72
	.xword	0x7cb870c5ae72a14c
	.xword	0x6f8c6596249fb186
	.xword	0xa8b5caf701c6eb0e
	.xword	0xa292870e9f0136ba
	.xword	0x7c42710781e78e7f
	.xword	0xcf87dbbd0f27365d
	.xword	0x4cb5a45737fbf2de
	.xword	0xc9a96b8aef8b00a1
	.xword	0x19334289205b7e16
	.xword	0x08b1eed023d5b6cf
	.xword	0xe563b5bbfc035b6d
	.xword	0xc0e8a8329dbe52b0
	.xword	0xb1b74577deca9f6c
	.xword	0xab6c10d81634f6f8
	.xword	0x26f8841b30986f18
	.xword	0x79385e169ef4f310
	.xword	0xbce7e1f66486582e
	.xword	0xb38c30214f4c31b7
	.xword	0x8077a8107dcc95f6
	.xword	0x072636f53c728485
	.xword	0xdc9ecd0b7875f8a0
	.xword	0xb40352466efdfc99
	.xword	0xbc1949a20d5b218f
	.xword	0xb0dc480390373465
	.xword	0xb70eef2fc09984dd
	.xword	0x9a277a19f373e35b
	.xword	0xd96d9d5df3ea454c
	.xword	0x369d2477a1ec06e2
	.xword	0xf7d56b3ca1e2d9f6
	.xword	0x0ddbad755483b201
	.xword	0xd5b66b442b053568
	.xword	0xad863278db127d07
	.xword	0x5630b57b01df6167
	.xword	0x6ad982290d3641af
	.xword	0x8ea9424810f5adcd
	.xword	0x176c24b1f218e4bd
	.xword	0x56e708befabbe666
	.xword	0xb11c05336b9aabd0
	.xword	0x1c4659948a182669
	.xword	0x256791920af56f76
	.xword	0x3b862a102f40d914
	.xword	0x0c13cce0119e0f7e
	.xword	0xc38142f69ab68c25
	.xword	0xe325cd0c0c18bdac
	.xword	0x1d62e5c2794ae343
	.xword	0xef55750cfa3de309
	.xword	0x7a9441358763f3f2
	.xword	0x6517e6208f675b59
	.xword	0x29125b0126cf83bc
	.xword	0x9ccbafc9abe8da4c
	.xword	0x6c5dc4527f535510
	.xword	0x5f3ef651c62bf0df
	.xword	0x3fc3e318c5ca1a42
	.xword	0x326b12d9ca1a0a94
	.xword	0x4dedeef87a1056cf
	.xword	0x8d0a3fdb10a4035b
	.xword	0x340d2582a1fc66a8
	.xword	0xc1e084c0a4cd82e1
	.xword	0x74e9958f364785c7
	.xword	0x1cc7cbb488dad822
	.xword	0xfc70a49bc0d97321
	.xword	0x9169e8f629c11fc9
	.xword	0xa00d6cd32014a293
	.xword	0x8bdd16080931cac1
	.xword	0x6e8dd447b35309ab
	.xword	0x925d2a12df5272a3
	.xword	0x2e5b198761f4323f
	.xword	0x189344a3a439ef41
	.xword	0x0432241c3b3c3937
	.xword	0x38e6e52f219e5398
	.xword	0xe3972945dff86eaf
	.xword	0x1afe7e80a28a0704
	.xword	0xbf58d9e72dbd7410
	.xword	0x58656f452fc8b971
	.xword	0xcacdb05290072be2
	.xword	0x35839ce98a464def
	.xword	0xc95d2ab00cbcd32b
	.xword	0x2630737522a7b015
	.xword	0x0385cb597c069fac
	.xword	0xa879f709f1e3ce0b
	.xword	0xc4208bca1a3b59b4
	.xword	0xff9c452b1ab7b163
	.xword	0x1fe327cd2b22e8ea
	.xword	0x9ea9a50c50e205ae
	.xword	0x7c16e285a3753712
	.xword	0x04c6e4050a742809
	.xword	0xfff70d048788044b
	.xword	0x4d6027831ed9662b
	.xword	0x4736532e47056563
	.xword	0xaad8e80326c533c4
	.xword	0x3e2e0f5ffa02164f
	.xword	0x62adcf9ac6386282
	.xword	0xdbe5024d7bc7cf7a
	.xword	0x3d2be26bf466ebbf
	.xword	0xd17a8a7e32daa568
	.xword	0x03dfed0747f376ab
	.xword	0xfcdcda892e491baa
	.xword	0x1ad512b2887fbd80
	.xword	0x899092bbe9039021
	.xword	0x507859e4d31516fe
	.xword	0x1da0eb1440f11059
	.xword	0x4d6916c89d28149d
	.xword	0x052af065733c4f32
	.xword	0xe5cd473f846c9551
	.xword	0x78f18776309037a6
	.xword	0x753fa5d0cf9a2b15
	.xword	0x3f4123f795d15a50
	.xword	0x7525a925c92cca1d
	.xword	0x5737acf42e77c8d0
	.xword	0x8a637d0b20cc9db7
	.xword	0xc8b2381ce4f0ce0f
	.xword	0x4949f2b86cba50c2
	.xword	0xb0b8aa0e603f7686
	.xword	0x3146e78c9d4f7f3a
	.xword	0x4377edd5c66217b5
	.xword	0xc30707cde8ccaecf
	.xword	0x7b5756594fb14c35
	.xword	0xd816a534fe1da3b0
	.xword	0x5f88676412c33c46
	.xword	0xb0d1277bd0799a17
	.xword	0xe644d992288c16f2
	.xword	0x4fa318e80b141264
	.xword	0xd25de8650ad34fad
	.xword	0xf0f26806f3d35556
	.xword	0xe80a4c6d4c550788
	.xword	0x0822ae2344909a47
	.xword	0x9e7ebeace544b2c5
	.xword	0xd4eb0609c6e98fe6
	.xword	0x23f89d1238cfd786
	.xword	0xdb951c64e10bfd22
	.xword	0xe7a5c85ec744674b
	.xword	0x10e8a67e4a11b201
	.align 0x80000
	.data
data_start_7:

	.xword	0xb7a4999f54e3fe2e
	.xword	0x8184c0620fd43632
	.xword	0x5a5bb9970284b5c2
	.xword	0x8aaf1c20bd8dd99c
	.xword	0x9efeb6ee4983412f
	.xword	0x25095d4d7152c318
	.xword	0x94d947e06d6e3979
	.xword	0xf664015e95672a20
	.xword	0x61095c2efc0f2ed4
	.xword	0x22cc0bab2a491f0f
	.xword	0xfa6dfe798cafad3e
	.xword	0x5b5a4e2983f59839
	.xword	0xf6360b04c0a5220e
	.xword	0x8864b0c0a3de911f
	.xword	0x8f08952700b78045
	.xword	0x9c61c35565ed7375
	.xword	0x034fe1d6351e1d8a
	.xword	0x00737e27b50ae542
	.xword	0x15e96aa4be1d68b7
	.xword	0xa7de3c7f3c9fd5ec
	.xword	0x453998948e30ac1b
	.xword	0x5c75d821cedf7aef
	.xword	0xc4a326fa1b700524
	.xword	0x64d4018137ee8bd9
	.xword	0x2fef188d339b3aff
	.xword	0xdca57719a6503820
	.xword	0xd8f982fc12ab0483
	.xword	0xf3d5b343b81d9431
	.xword	0x02a2270eb167dac5
	.xword	0x54ef8297b96158f6
	.xword	0xe532fa4ceccec584
	.xword	0x28b70c6ac6a517ea
	.xword	0xf2fc62043af14441
	.xword	0x4029a8b6a75138bb
	.xword	0xe51f4df9bb08a497
	.xword	0xb07816e2a26b9bcd
	.xword	0x41e599050c272510
	.xword	0xd0e1682facf9930a
	.xword	0x2fc4baee0f34fbf4
	.xword	0xb5860b0c4cad2ac2
	.xword	0x264e490841e34e61
	.xword	0xe182125e03c74fde
	.xword	0x4b0c5012fedcc1c5
	.xword	0x6279c805bee4dd90
	.xword	0x890af6c1d630a2f2
	.xword	0xfb4aacd7efedf34e
	.xword	0x118ec5b2b5733bdf
	.xword	0x78ab0851ff468ee3
	.xword	0xa5896246e591f145
	.xword	0x27ce94b34e9100a4
	.xword	0xac8f8bdcf2fc619d
	.xword	0xe88b4bf741473fc8
	.xword	0x0c7a26f875667e61
	.xword	0xe872b230ca1ee65b
	.xword	0x8770e0e408f83ab1
	.xword	0x1fcfb7b4d6d98186
	.xword	0x544075564f7c47e4
	.xword	0xe5dc0b3a11d4f6d8
	.xword	0xf0dae51e3eeeef51
	.xword	0xc34781e7d2e03c51
	.xword	0x1fbace9049371a2d
	.xword	0xe2629b7285218d42
	.xword	0x572db8b56645d506
	.xword	0x9027110768061029
	.xword	0x0833e4772eba147c
	.xword	0x0ff79e82e444dc48
	.xword	0x660146ebe8f169a2
	.xword	0x78b9bd4df185b099
	.xword	0xd51c835b350721de
	.xword	0x63c24d15b2775d5e
	.xword	0xe5dff5f276dddcc6
	.xword	0xae3200dc54017d1f
	.xword	0x7327613eef768ddd
	.xword	0x3ffdf8b482967322
	.xword	0x0be2dc0d52097305
	.xword	0x6d7b1a45c2539ec4
	.xword	0x00bb167507d8710e
	.xword	0x79c6085f9b13b12c
	.xword	0x5e06e25809e8d5d9
	.xword	0xf1c484ca4eee542f
	.xword	0x64330f944ac31201
	.xword	0x70f40d4c85d14755
	.xword	0xd10a39b124369820
	.xword	0x0aac1482ad98277c
	.xword	0x09935e7dcd90031e
	.xword	0x7ecfea3cbdfcc3f8
	.xword	0x3ca8281bc90b13b3
	.xword	0x1517fd9c4fa5152a
	.xword	0x20b6ea68b12b6e73
	.xword	0x12258d42721b9693
	.xword	0x91a67d5976bb0b82
	.xword	0x12838cb4a483b333
	.xword	0xec5860de54d49087
	.xword	0x26eb39e31814458b
	.xword	0x8dec8e7c3538f585
	.xword	0x04f55300f03d54b1
	.xword	0x16c77fbff8721c6f
	.xword	0xf13df057bb48cf25
	.xword	0xabc413e652898a27
	.xword	0xac1ee65bfc16456b
	.xword	0xde51a8cd7acdffdc
	.xword	0x845c6fc0e30bc75c
	.xword	0x7792cb5b291a2e5c
	.xword	0x09a6356a56155fae
	.xword	0x7f0f21499e934c1b
	.xword	0x48d69cd46e3b52a4
	.xword	0xa7fa53db09b89fd2
	.xword	0x0704c84dde76588c
	.xword	0x39609ad68699e261
	.xword	0x7aa1060b43edf01a
	.xword	0xb4f202e6f760535b
	.xword	0x1af88fd6b8e172d5
	.xword	0xf184c834e0a2c9bb
	.xword	0x20f5e36cfa1cf2b7
	.xword	0xf9888d75966f4afb
	.xword	0x0679cf1bf90661b6
	.xword	0x5acef82e8c9506c4
	.xword	0x03308e46a5fa29ba
	.xword	0x0ef68ec5881e4578
	.xword	0x3aba4e2993dd3bd1
	.xword	0x03bb639349f2fee9
	.xword	0xdc391c79c2823093
	.xword	0xa3396b9d60973ab9
	.xword	0xe25f0746ba8d8b41
	.xword	0xd10c42265e2db157
	.xword	0x779880998c8e68bc
	.xword	0xcfc890ded9cc6ca9
	.xword	0xaa0f48c56d877af2
	.xword	0x20277cbd4f41a3fb
	.xword	0xb7daab40ce73324c
	.xword	0xd3fb53933251d6e3
	.xword	0x64a48ff3276600d9
	.xword	0x0c5793bf9e3fcc50
	.xword	0xc92ac9256ec9e8fa
	.xword	0x5df326ff2640c7df
	.xword	0xcf87364a35457a61
	.xword	0x86cc6880809d477f
	.xword	0xda6ea907458c4124
	.xword	0x2b5653e1fb8b1c88
	.xword	0xf0ad4a46d8a065a9
	.xword	0x02a9a8c1bb77e9ec
	.xword	0x163c15dcc7291647
	.xword	0xf9633123a2818c1d
	.xword	0xd04b0886b0867efa
	.xword	0xd2bd4bbf4441c64e
	.xword	0xb2bf43a192e13553
	.xword	0xc850654e413e45af
	.xword	0xb5aa0f6fd4928dc6
	.xword	0x3409863d0ddacae4
	.xword	0x770a017c6b35a932
	.xword	0xb382169e0479b0e3
	.xword	0x19e5ab832e2fb747
	.xword	0xcc038899f1465453
	.xword	0x06143b9c74750937
	.xword	0xe7554d1972b0a76e
	.xword	0xc3bfd9bd71b0adf8
	.xword	0xd7a53dd70252991d
	.xword	0x2cafc0736635b4a9
	.xword	0x0b639920ff5e078c
	.xword	0xb6d57d8ab1abcb88
	.xword	0x89428fabc58f1a74
	.xword	0x283e9edf92c964a4
	.xword	0x39ca42af4bd6f726
	.xword	0x04c5ff45c1475d4c
	.xword	0x52e55525c179a808
	.xword	0x5b79ce15a0df0751
	.xword	0xda5489bc0ac73cd1
	.xword	0x707a3ca95a7cc1d9
	.xword	0xff907522a4bc1dd1
	.xword	0x9be1d474d6aa0804
	.xword	0x1a185ad20e54f86e
	.xword	0xf3730bd178905b6a
	.xword	0x473584c55ca9eeed
	.xword	0x3d4b64a31a2719b6
	.xword	0xe667a02a5438b30b
	.xword	0x0064233a86eb7605
	.xword	0x66b0589d4c578223
	.xword	0x4937291436e66b6a
	.xword	0xec41c6b84ef2c0eb
	.xword	0xd83c2a3433bd3ae0
	.xword	0x3f8097ac2d61c8f3
	.xword	0x31569d77c09d8890
	.xword	0xda2f414d3eb76f58
	.xword	0x3e4575b8b7d46cc5
	.xword	0x1c203b989f4e32ab
	.xword	0x47c73a116ba12c62
	.xword	0x30ea1116b3f32a41
	.xword	0x2ad5afc89260b7d2
	.xword	0xeee06aad9933e131
	.xword	0x06be9526b1d26838
	.xword	0x59d39f02a84e75ae
	.xword	0xd52f686f2742660a
	.xword	0x75409a51415d5df1
	.xword	0x71080469a759e9fc
	.xword	0xdd72f7a62fe1604f
	.xword	0x7aafbfb3a5d49dac
	.xword	0x9f94fc8a04e608bc
	.xword	0xfd5ea3ccfece3348
	.xword	0x2abe7680e6e2235c
	.xword	0x4678e4b57932b339
	.xword	0x958222e140acbe30
	.xword	0xe3379daf84d30f43
	.xword	0xb010aeb94eaf5108
	.xword	0xf7eec3054c941c1e
	.xword	0x943aad2879844cfa
	.xword	0x46ab366dd8f33d6d
	.xword	0x0bc0a737f641fbd0
	.xword	0x0403393778557992
	.xword	0xbdbd11a66ed2ff2b
	.xword	0x3b594ab61a11fb11
	.xword	0x133f57521bcc8078
	.xword	0x415b2349d89cddcb
	.xword	0x8595d1a4a204eb9c
	.xword	0x3101da4c5d94a2be
	.xword	0xe6a1c733d0715cff
	.xword	0x33533d9069f27f99
	.xword	0xc00b6f5ab7b7e0a3
	.xword	0x5a5d5a34bb513f30
	.xword	0x84861efbdcbbc3da
	.xword	0xb6ff81fbe7a3e129
	.xword	0x5a5d435984e48ef2
	.xword	0x37128ae54c1c8d15
	.xword	0x6d84223681b797b7
	.xword	0x642826d9c831c0d5
	.xword	0xb16ae91a533942a2
	.xword	0x77d706f0b234104c
	.xword	0x22f4be19d3d9c1e1
	.xword	0x53f9607acd1280a1
	.xword	0x4cd25b4986492f71
	.xword	0x3e3c38491a8b8099
	.xword	0x2dec36bb87af899c
	.xword	0xdf143328144eae12
	.xword	0x1b3d7e61c25e8ad3
	.xword	0xb608773d3c063870
	.xword	0x6c1504be1936a748
	.xword	0x531c7ee6e1f9dae2
	.xword	0x2f8592bf0b1e864c
	.xword	0xfa164e224c4ac146
	.xword	0x7497f7d3647b0158
	.xword	0x29c074daabe509fa
	.xword	0x690ace2fd3ffb0e9
	.xword	0xcebcaface53a63ba
	.xword	0xcab21be43cb4b6b8
	.xword	0x4453d4dd8a92e7c8
	.xword	0xd24fcff2e6ee6511
	.xword	0x109443d1e6b90a0d
	.xword	0xdb3e25c0ab61fe74
	.xword	0xd2d506c2851ce9c0
	.xword	0xe579d664cfe012fc
	.xword	0xa9fcd2023f5acbec
	.xword	0xe911d6b878fd1d7c
	.xword	0xad1c027fcc2abe7b
	.xword	0xa8ef2374005f90fd
	.xword	0x184911d892398256
	.xword	0x5c342bcb6917c5fa
	.xword	0x71dca6aca21708ea



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
