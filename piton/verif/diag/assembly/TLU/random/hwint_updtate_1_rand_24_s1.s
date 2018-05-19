// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hwint_updtate_1_rand_24_s1.s
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
   random seed:	24416990
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

	setx 0x12efa7b922611f9f, %g1, %g0
	setx 0x1d6a1dbb162a2176, %g1, %g1
	setx 0xd41f8a1215146fb7, %g1, %g2
	setx 0x804d6361797c2983, %g1, %g3
	setx 0x5a443faee32224c7, %g1, %g4
	setx 0x1cb938e182d3a835, %g1, %g5
	setx 0x30b587ea068af0bf, %g1, %g6
	setx 0x1d2281ece598e87d, %g1, %g7
	setx 0xe4e72d53b5784861, %g1, %r16
	setx 0xecfbecda9f1a78dd, %g1, %r17
	setx 0x1870161df69970bc, %g1, %r18
	setx 0x0f1347b17ac8d33c, %g1, %r19
	setx 0x2b37f46f7db2f38a, %g1, %r20
	setx 0xc870dc5794ccf716, %g1, %r21
	setx 0xaa6892bb4fdb0598, %g1, %r22
	setx 0xc261742256bee3a6, %g1, %r23
	setx 0xd630eecc3becb5ff, %g1, %r24
	setx 0xc7e12e8292e0ff9c, %g1, %r25
	setx 0x50d47d6ca628cb10, %g1, %r26
	setx 0x6f50c0d3068b8b5d, %g1, %r27
	setx 0x743bb71a5c914833, %g1, %r28
	setx 0x9d3cf9157eaafaec, %g1, %r29
	setx 0xfefd10fc8c74aa68, %g1, %r30
	setx 0xc1c8a76da159b124, %g1, %r31
	save
	setx 0xca8e76be71bde713, %g1, %r16
	setx 0x9f7956d58b20cb01, %g1, %r17
	setx 0x772f7e977e4f80bb, %g1, %r18
	setx 0xb4f15a5eb7ab6d04, %g1, %r19
	setx 0x02b98a297a799435, %g1, %r20
	setx 0xdd8e8bab8bd53c2a, %g1, %r21
	setx 0x4ffa6990969e4863, %g1, %r22
	setx 0x55ad9ab278db0f2c, %g1, %r23
	setx 0xcfad24db04bcf9a0, %g1, %r24
	setx 0xf2b6c2e7c441589f, %g1, %r25
	setx 0xaa30bb9339e50fd4, %g1, %r26
	setx 0x655c9977a626b9b3, %g1, %r27
	setx 0x82b4d0a8ae67641e, %g1, %r28
	setx 0x0456fc54c7a8a385, %g1, %r29
	setx 0xb4244b0ef0791463, %g1, %r30
	setx 0x77113b20a903fe70, %g1, %r31
	save
	setx 0xfbe049957fd906e8, %g1, %r16
	setx 0xaccd14a5a6f17a96, %g1, %r17
	setx 0x975efc253bcae74b, %g1, %r18
	setx 0xc8360ffa746cc3b3, %g1, %r19
	setx 0x0618f801fb5e94be, %g1, %r20
	setx 0x6970ba5ed7f09b6f, %g1, %r21
	setx 0x565819cc89504195, %g1, %r22
	setx 0x18ec08f5c791f93f, %g1, %r23
	setx 0x3ce74904eeddffa4, %g1, %r24
	setx 0xce849e57a3c388d2, %g1, %r25
	setx 0xa2e2fef1d6d36acd, %g1, %r26
	setx 0x935a02fe5ab0f2d2, %g1, %r27
	setx 0x244d7b33c472b367, %g1, %r28
	setx 0xd5f823c443bcc623, %g1, %r29
	setx 0x6849d1db1e654145, %g1, %r30
	setx 0xfa15ed32f3b19d6b, %g1, %r31
	save
	setx 0x0694e45c174d4ee7, %g1, %r16
	setx 0x555988f89f022128, %g1, %r17
	setx 0x562e1ce03a831cf4, %g1, %r18
	setx 0xf09f3a765800f70b, %g1, %r19
	setx 0x01a64e452073df17, %g1, %r20
	setx 0x941e62c4aac2f832, %g1, %r21
	setx 0x64a62dc93b176324, %g1, %r22
	setx 0x33a8be066b932b02, %g1, %r23
	setx 0x81e885d6ad8062d0, %g1, %r24
	setx 0x576179f278607278, %g1, %r25
	setx 0xc9bf83e865bcaa7d, %g1, %r26
	setx 0xa2ad5eb4bab334a5, %g1, %r27
	setx 0x998a026a2c577735, %g1, %r28
	setx 0x158e3ce783ca8a21, %g1, %r29
	setx 0x6f6118ab591b17b2, %g1, %r30
	setx 0x25d88a6f23fca1de, %g1, %r31
	save
	setx 0xd2fe73aa47707ce1, %g1, %r16
	setx 0x064e0ccc41d71d07, %g1, %r17
	setx 0xf30d80d17fe636fd, %g1, %r18
	setx 0x67b3ce21ea29eade, %g1, %r19
	setx 0x800316595cf8b33e, %g1, %r20
	setx 0xe17ec3cb74f2abc0, %g1, %r21
	setx 0xf18d693db003e7b2, %g1, %r22
	setx 0x4872795bb8a2fe8d, %g1, %r23
	setx 0x7553f69cf25d7e1b, %g1, %r24
	setx 0x5f66e35da994498a, %g1, %r25
	setx 0xd3b58221c5a2b99c, %g1, %r26
	setx 0xec96b6b57a7d6842, %g1, %r27
	setx 0x0fedff43777e7887, %g1, %r28
	setx 0x0dadf2e7f5362b43, %g1, %r29
	setx 0xdb2648460ee9bbf2, %g1, %r30
	setx 0x8c40bc1e37e8bea5, %g1, %r31
	save
	setx 0x59de9a93a58118d8, %g1, %r16
	setx 0x46b9a7214b8e826b, %g1, %r17
	setx 0x10bff1bc78109375, %g1, %r18
	setx 0xf248d066dc936be0, %g1, %r19
	setx 0x354f3abec3d74141, %g1, %r20
	setx 0x4b1c9e530dcdafba, %g1, %r21
	setx 0x4220be4fbb522cf9, %g1, %r22
	setx 0x1599e8a499fadea3, %g1, %r23
	setx 0x373822751e6de501, %g1, %r24
	setx 0x7fb6bdd591ebdc63, %g1, %r25
	setx 0x0e3f9b39bd10612a, %g1, %r26
	setx 0x33aa8d6bc441c18f, %g1, %r27
	setx 0xa05674cf24f7a2e2, %g1, %r28
	setx 0x39d00512ca356a07, %g1, %r29
	setx 0xb4085ae7582f3380, %g1, %r30
	setx 0x33a10b58ad1811d0, %g1, %r31
	save
	setx 0xb447bdbffc11e478, %g1, %r16
	setx 0x28591ed9c9941f57, %g1, %r17
	setx 0xa22851841c0743d2, %g1, %r18
	setx 0x532d4e68871779f4, %g1, %r19
	setx 0x602726ceb423e481, %g1, %r20
	setx 0xd6f1f74342f6b5eb, %g1, %r21
	setx 0xbba3ce405a7c3c08, %g1, %r22
	setx 0x4db46ba9b0b75f0b, %g1, %r23
	setx 0x748701a4db11646e, %g1, %r24
	setx 0x1575e6fe36ed16a5, %g1, %r25
	setx 0x55d590f00cdcdf78, %g1, %r26
	setx 0xda7c9df5c61b35e0, %g1, %r27
	setx 0x2695c86699d6aafb, %g1, %r28
	setx 0xb2241bf22e17faca, %g1, %r29
	setx 0xdbd2a315a9c67d10, %g1, %r30
	setx 0x6bd3e56196408784, %g1, %r31
	save
	setx 0x73df2031fa459191, %g1, %r16
	setx 0x09309ed4a23c76f8, %g1, %r17
	setx 0x34ba16ff50656c74, %g1, %r18
	setx 0x4b89ee177e7a29b5, %g1, %r19
	setx 0x56d8a578724be9a4, %g1, %r20
	setx 0xe1fb4aceb6d69531, %g1, %r21
	setx 0x614668287498b554, %g1, %r22
	setx 0xbf4c1f04e9c54821, %g1, %r23
	setx 0x9eb6e1f63227eca5, %g1, %r24
	setx 0x84cef5372598d096, %g1, %r25
	setx 0x4c3eec741a77738c, %g1, %r26
	setx 0xd3ca1a2cfc7bceb9, %g1, %r27
	setx 0xcdef40026f1186fa, %g1, %r28
	setx 0x872f947334b5f375, %g1, %r29
	setx 0x3287328e8f41100e, %g1, %r30
	setx 0xa76fd1f43007b1f5, %g1, %r31
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
iob_intr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_0), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_wr_0:
	mov	0x3c0, %r14
	.word 0xfaf38400  ! 6: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T0_asi_reg_wr_1:
	mov	0x1b, %r14
	.word 0xf6f38e80  ! 9: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T0_asi_reg_rd_0:
	mov	0x3c5, %r14
	.word 0xf0db8e40  ! 10: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbfe54000  ! 12: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_1), 16, 16)) -> intp(0, 0, a)
	.word 0xb3e54000  ! 15: SAVE_R	save	%r21, %r0, %r25
cpu_intr_0_0:
	setx	0x1d000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e44000  ! 17: SAVE_R	save	%r17, %r0, %r25
T0_asi_reg_rd_1:
	mov	0x3c3, %r14
	.word 0xfadb89e0  ! 19: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T0_asi_reg_rd_2:
	mov	0x21, %r14
	.word 0xfedb8e80  ! 20: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T0_asi_reg_rd_3:
	mov	0x1d, %r14
	.word 0xfcdb89e0  ! 21: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T0_asi_reg_rd_4:
	mov	0x3, %r14
	.word 0xfedb8e40  ! 22: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_wr_2:
	mov	0x21, %r14
	.word 0xfef38e60  ! 23: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb5e5216b  ! 24: SAVE_I	save	%r20, 0x0001, %r26
iob_intr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_2), 16, 16)) -> intp(0, 0, 14)
iob_intr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_3), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_4), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_wr_3:
	mov	0x3c7, %r14
	.word 0xfef38e60  ! 37: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb7e58000  ! 39: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_rd_5:
	mov	0x3c8, %r14
	.word 0xf2db8e80  ! 40: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbfe4212d  ! 45: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb3e42042  ! 51: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb7e56175  ! 52: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_wr_4:
	mov	0x3c7, %r14
	.word 0xfcf38e40  ! 53: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_rd_6:
	mov	0x22, %r14
	.word 0xf2db8e80  ! 54: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbbe5616a  ! 56: SAVE_I	save	%r21, 0x0001, %r29
cpu_intr_0_1:
	setx	0x1d0007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe561c6  ! 58: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_rd_7:
	mov	0x3c4, %r14
	.word 0xf2db8e40  ! 59: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb9e58000  ! 63: SAVE_R	save	%r22, %r0, %r28
	.word 0xb6b54000  ! 65: SUBCcc_R	orncc 	%r21, %r0, %r27
T0_asi_reg_wr_5:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 67: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb3e5c000  ! 70: SAVE_R	save	%r23, %r0, %r25
iob_intr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_5), 16, 16)) -> intp(0, 0, 8)
	.word 0xbbe42142  ! 73: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbe04217f  ! 75: ADD_I	add 	%r16, 0x017f, %r31
cpu_intr_0_2:
	setx	0x1e0232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e44000  ! 79: SAVE_R	save	%r17, %r0, %r24
	.word 0xb7e5a0c3  ! 82: SAVE_I	save	%r22, 0x0001, %r27
T0_asi_reg_wr_6:
	mov	0x3c1, %r14
	.word 0xf2f38e40  ! 83: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbde5e10f  ! 85: SAVE_I	save	%r23, 0x0001, %r30
T0_asi_reg_rd_8:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 87: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T0_asi_reg_wr_7:
	mov	0x32, %r14
	.word 0xf4f38e40  ! 89: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb1e520f0  ! 93: SAVE_I	save	%r20, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde54000  ! 99: SAVE_R	save	%r21, %r0, %r30
	.word 0x8794616c  ! 101: WRPR_TT_I	wrpr	%r17, 0x016c, %tt
	.word 0xbcc56026  ! 102: ADDCcc_I	addccc 	%r21, 0x0026, %r30
	.word 0xbfe40000  ! 107: SAVE_R	save	%r16, %r0, %r31
iob_intr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_6), 16, 16)) -> intp(0, 0, 2e)
cpu_intr_0_3:
	setx	0x1e0327, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_9:
	mov	0x33, %r14
	.word 0xf2db8e60  ! 111: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_7), 16, 16)) -> intp(0, 0, 13)
	.word 0xb1e46068  ! 113: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb5e50000  ! 114: SAVE_R	save	%r20, %r0, %r26
iob_intr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_8), 16, 16)) -> intp(0, 0, 12)
iob_intr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_9), 16, 16)) -> intp(0, 0, 1b)
T0_asi_reg_rd_10:
	mov	0x1a, %r14
	.word 0xfedb8e60  ! 119: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_0_4:
	setx	0x1e020f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_11:
	mov	0x3c5, %r14
	.word 0xf0db89e0  ! 123: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T0_asi_reg_wr_8:
	mov	0xe, %r14
	.word 0xf8f38e40  ! 124: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb5e5217c  ! 125: SAVE_I	save	%r20, 0x0001, %r26
iob_intr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_10), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb7e44000  ! 128: SAVE_R	save	%r17, %r0, %r27
T0_asi_reg_wr_9:
	mov	0x11, %r14
	.word 0xfcf38e80  ! 130: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb9e5208f  ! 131: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_5:
	setx	0x1e0323, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_11), 16, 16)) -> intp(0, 0, 31)
iob_intr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_12), 16, 16)) -> intp(0, 0, 18)
	.word 0xbfe44000  ! 142: SAVE_R	save	%r17, %r0, %r31
	.word 0xbc34e171  ! 145: SUBC_I	orn 	%r19, 0x0171, %r30
	.word 0xb634606d  ! 148: SUBC_I	orn 	%r17, 0x006d, %r27
	.word 0xbbe50000  ! 149: SAVE_R	save	%r20, %r0, %r29
	.word 0x8595216b  ! 152: WRPR_TSTATE_I	wrpr	%r20, 0x016b, %tstate
iob_intr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_13), 16, 16)) -> intp(0, 0, a)
	.word 0xbbe5e0e1  ! 155: SAVE_I	save	%r23, 0x0001, %r29
cpu_intr_0_6:
	setx	0x1f011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e54000  ! 157: SAVE_R	save	%r21, %r0, %r28
iob_intr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_14), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_wr_10:
	mov	0x13, %r14
	.word 0xf2f38e40  ! 170: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_wr_11:
	mov	0x3c7, %r14
	.word 0xf6f38e40  ! 171: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_0_7:
	setx	0x1d0311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e52066  ! 176: SAVE_I	save	%r20, 0x0001, %r26
T0_asi_reg_wr_12:
	mov	0x29, %r14
	.word 0xfcf389e0  ! 177: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_0_8:
	setx	0x1e0217, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_9:
	setx	0x1e0132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd346001  ! 181: SRL_I	srl 	%r17, 0x0001, %r30
T0_asi_reg_wr_13:
	mov	0x3c0, %r14
	.word 0xf2f38e40  ! 182: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbbe4e12d  ! 184: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbfe54000  ! 186: SAVE_R	save	%r21, %r0, %r31
	.word 0xb3e5a12f  ! 187: SAVE_I	save	%r22, 0x0001, %r25
iob_intr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_15), 16, 16)) -> intp(0, 0, c)
iob_intr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_16), 16, 16)) -> intp(0, 0, 3b)
iob_intr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_17), 16, 16)) -> intp(0, 0, 3c)
T0_asi_reg_rd_12:
	mov	0x1d, %r14
	.word 0xf6db8e80  ! 192: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbfe56198  ! 193: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_rd_13:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 196: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_rd_14:
	mov	0x3c6, %r14
	.word 0xf4db84a0  ! 200: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T0_asi_reg_rd_15:
	mov	0xc, %r14
	.word 0xf0db8e60  ! 201: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbbe4e074  ! 203: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_rd_16:
	mov	0x10, %r14
	.word 0xf8db84a0  ! 206: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_18), 16, 16)) -> intp(0, 0, 10)
	.word 0xb9e44000  ! 210: SAVE_R	save	%r17, %r0, %r28
	.word 0xb1e5e1e0  ! 211: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_19), 16, 16)) -> intp(0, 0, 35)
T0_asi_reg_rd_17:
	mov	0x3c5, %r14
	.word 0xf2db89e0  ! 214: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb3e4c000  ! 215: SAVE_R	save	%r19, %r0, %r25
iob_intr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_20), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_rd_18:
	mov	0x29, %r14
	.word 0xf8db8e60  ! 220: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb614a148  ! 221: OR_I	or 	%r18, 0x0148, %r27
	.word 0xb3e58000  ! 222: SAVE_R	save	%r22, %r0, %r25
T0_asi_reg_wr_14:
	mov	0x14, %r14
	.word 0xf6f38e60  ! 227: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_0_10:
	setx	0x1c010e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_11:
	setx	0x1e001e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_21), 16, 16)) -> intp(0, 0, 12)
	.word 0xbfe5e127  ! 234: SAVE_I	save	%r23, 0x0001, %r31
T0_asi_reg_wr_15:
	mov	0x3c7, %r14
	.word 0xf6f38e40  ! 235: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb5e50000  ! 238: SAVE_R	save	%r20, %r0, %r26
	.word 0xb9e4c000  ! 241: SAVE_R	save	%r19, %r0, %r28
T0_asi_reg_rd_19:
	mov	0x14, %r14
	.word 0xf8db8e80  ! 244: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_0_12:
	setx	0x1c0332, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_13:
	setx	0x1c0317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a1b8  ! 253: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_rd_20:
	mov	0x18, %r14
	.word 0xfcdb8e80  ! 255: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T0_asi_reg_wr_16:
	mov	0x1f, %r14
	.word 0xf4f38400  ! 261: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_0_14:
	setx	0x1f030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe40000  ! 264: SAVE_R	save	%r16, %r0, %r29
	.word 0xb5e5a0ac  ! 266: SAVE_I	save	%r22, 0x0001, %r26
T0_asi_reg_rd_21:
	mov	0x33, %r14
	.word 0xf0db8e80  ! 267: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb5e4c000  ! 270: SAVE_R	save	%r19, %r0, %r26
iob_intr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_22), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb83d0000  ! 274: XNOR_R	xnor 	%r20, %r0, %r28
	.word 0xbbe4e119  ! 276: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb5e5c000  ! 280: SAVE_R	save	%r23, %r0, %r26
cpu_intr_0_15:
	setx	0x1c013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e521c2  ! 283: SAVE_I	save	%r20, 0x0001, %r28
T0_asi_reg_wr_17:
	mov	0x3c3, %r14
	.word 0xf2f38e60  ! 284: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_23), 16, 16)) -> intp(0, 0, 27)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbbe44000  ! 289: SAVE_R	save	%r17, %r0, %r29
iob_intr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_24), 16, 16)) -> intp(0, 0, 39)
cpu_intr_0_16:
	setx	0x1f0034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e014  ! 293: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_rd_22:
	mov	0xe, %r14
	.word 0xfcdb8e40  ! 297: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_25), 16, 16)) -> intp(0, 0, 15)
	.word 0xbbe58000  ! 301: SAVE_R	save	%r22, %r0, %r29
iob_intr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_26), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb5e40000  ! 304: SAVE_R	save	%r16, %r0, %r26
cpu_intr_0_17:
	setx	0x1d023d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_23:
	mov	0x10, %r14
	.word 0xfadb89e0  ! 307: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_0_18:
	setx	0x1d013b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_27), 16, 16)) -> intp(0, 0, 1b)
cpu_intr_0_19:
	setx	0x1c0321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a1b6  ! 313: SAVE_I	save	%r18, 0x0001, %r24
T0_asi_reg_wr_18:
	mov	0x3c6, %r14
	.word 0xf4f389e0  ! 315: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbfe54000  ! 317: SAVE_R	save	%r21, %r0, %r31
	.word 0xb1e54000  ! 318: SAVE_R	save	%r21, %r0, %r24
	.word 0xb7e4c000  ! 320: SAVE_R	save	%r19, %r0, %r27
iob_intr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_28), 16, 16)) -> intp(0, 0, 23)
	.word 0xb7e4c000  ! 324: SAVE_R	save	%r19, %r0, %r27
iob_intr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_29), 16, 16)) -> intp(0, 0, d)
cpu_intr_0_20:
	setx	0x1f030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5c000  ! 328: SAVE_R	save	%r23, %r0, %r25
cpu_intr_0_21:
	setx	0x1e0123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e44000  ! 331: SAVE_R	save	%r17, %r0, %r25
iob_intr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_30), 16, 16)) -> intp(0, 0, 22)
T0_asi_reg_rd_24:
	mov	0x3c4, %r14
	.word 0xf0db89e0  ! 342: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_31), 16, 16)) -> intp(0, 0, 28)
iob_intr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_32), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_rd_25:
	mov	0xd, %r14
	.word 0xf0db8400  ! 356: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb9e44000  ! 357: SAVE_R	save	%r17, %r0, %r28
	.word 0xb02de167  ! 361: ANDN_I	andn 	%r23, 0x0167, %r24
	.word 0xbbe44000  ! 362: SAVE_R	save	%r17, %r0, %r29
	.word 0xbde40000  ! 364: SAVE_R	save	%r16, %r0, %r30
T0_asi_reg_rd_26:
	mov	0x3c4, %r14
	.word 0xfcdb84a0  ! 369: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb81de09c  ! 370: XOR_I	xor 	%r23, 0x009c, %r28
T0_asi_reg_wr_19:
	mov	0x3c2, %r14
	.word 0xfcf38e80  ! 371: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbde4c000  ! 374: SAVE_R	save	%r19, %r0, %r30
	.word 0xbfe58000  ! 378: SAVE_R	save	%r22, %r0, %r31
	.word 0xb8b54000  ! 379: ORNcc_R	orncc 	%r21, %r0, %r28
	.word 0xb0aca0ee  ! 380: ANDNcc_I	andncc 	%r18, 0x00ee, %r24
	.word 0xb7e54000  ! 381: SAVE_R	save	%r21, %r0, %r27
cpu_intr_0_22:
	setx	0x1f0230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe52172  ! 386: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_rd_27:
	mov	0x3c3, %r14
	.word 0xfedb8e80  ! 387: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_33), 16, 16)) -> intp(0, 0, 3)
	.word 0xb22c20e0  ! 394: ANDN_I	andn 	%r16, 0x00e0, %r25
	.word 0xb5e4e17a  ! 395: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb535b001  ! 396: SRLX_I	srlx	%r22, 0x0001, %r26
iob_intr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_34), 16, 16)) -> intp(0, 0, 2e)
cpu_intr_0_23:
	setx	0x1e0104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe40000  ! 401: SAVE_R	save	%r16, %r0, %r29
iob_intr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_35), 16, 16)) -> intp(0, 0, e)
iob_intr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_36), 16, 16)) -> intp(0, 0, d)
cpu_intr_0_24:
	setx	0x1c0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb2d7001  ! 413: SLLX_I	sllx	%r21, 0x0001, %r29
T0_asi_reg_rd_28:
	mov	0x3c3, %r14
	.word 0xf4db8e40  ! 414: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T0_asi_reg_rd_29:
	mov	0x3c1, %r14
	.word 0xf2db89e0  ! 420: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb9e4a018  ! 424: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_rd_30:
	mov	0x3c6, %r14
	.word 0xfcdb89e0  ! 425: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb7e4c000  ! 426: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_rd_31:
	mov	0x15, %r14
	.word 0xfedb89e0  ! 428: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb7e5a0a9  ! 429: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbbe50000  ! 430: SAVE_R	save	%r20, %r0, %r29
	.word 0xbbe5c000  ! 432: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_25:
	setx	0x1d013f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_26:
	setx	0x1e0300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4bd619b  ! 436: XNORcc_I	xnorcc 	%r21, 0x019b, %r26
iob_intr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_37), 16, 16)) -> intp(0, 0, 2c)
iob_intr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_38), 16, 16)) -> intp(0, 0, 18)
	.word 0xb7e54000  ! 442: SAVE_R	save	%r21, %r0, %r27
	.word 0xb3e5e097  ! 443: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb83c2005  ! 444: XNOR_I	xnor 	%r16, 0x0005, %r28
	.word 0xb3e5e00a  ! 445: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_rd_32:
	mov	0x19, %r14
	.word 0xfcdb8e40  ! 448: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_rd_33:
	mov	0x4, %r14
	.word 0xfcdb84a0  ! 451: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb9e5e134  ! 452: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_rd_34:
	mov	0x3, %r14
	.word 0xf8db84a0  ! 456: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_39), 16, 16)) -> intp(0, 0, 1c)
cpu_intr_0_27:
	setx	0x23012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e460e4  ! 461: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb9e5c000  ! 468: SAVE_R	save	%r23, %r0, %r28
	.word 0xb5e56153  ! 470: SAVE_I	save	%r21, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9e4c000  ! 472: SAVE_R	save	%r19, %r0, %r28
	.word 0xb9e42165  ! 474: SAVE_I	save	%r16, 0x0001, %r28
iob_intr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_40), 16, 16)) -> intp(0, 0, 23)
	.word 0xbbe40000  ! 481: SAVE_R	save	%r16, %r0, %r29
cpu_intr_0_28:
	setx	0x200224, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_20:
	mov	0x2b, %r14
	.word 0xfaf38e60  ! 486: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb22ca0dc  ! 494: ANDN_I	andn 	%r18, 0x00dc, %r25
	.word 0xbfe58000  ! 497: SAVE_R	save	%r22, %r0, %r31
T0_asi_reg_wr_21:
	mov	0x2, %r14
	.word 0xf0f38e40  ! 498: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_41), 16, 16)) -> intp(0, 0, 14)
	.word 0xbfe40000  ! 507: SAVE_R	save	%r16, %r0, %r31
T0_asi_reg_rd_35:
	mov	0x28, %r14
	.word 0xf2db8400  ! 512: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb3e5e167  ! 515: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb1e48000  ! 519: SAVE_R	save	%r18, %r0, %r24
cpu_intr_0_29:
	setx	0x21000d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_22:
	mov	0x9, %r14
	.word 0xf8f38e80  ! 522: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb7e520c3  ! 524: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbde58000  ! 525: SAVE_R	save	%r22, %r0, %r30
	.word 0xbfe4e01e  ! 526: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb294a1dc  ! 528: ORcc_I	orcc 	%r18, 0x01dc, %r25
iob_intr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_42), 16, 16)) -> intp(0, 0, 15)
T0_asi_reg_wr_23:
	mov	0x3c6, %r14
	.word 0xf8f38e60  ! 534: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_43), 16, 16)) -> intp(0, 0, 2f)
cpu_intr_0_30:
	setx	0x230222, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_44), 16, 16)) -> intp(0, 0, 17)
	.word 0xb1e5c000  ! 543: SAVE_R	save	%r23, %r0, %r24
	.word 0xb9e58000  ! 544: SAVE_R	save	%r22, %r0, %r28
	.word 0xb7e54000  ! 545: SAVE_R	save	%r21, %r0, %r27
iob_intr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_45), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb8b58000  ! 547: ORNcc_R	orncc 	%r22, %r0, %r28
cpu_intr_0_31:
	setx	0x22023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe40000  ! 550: SAVE_R	save	%r16, %r0, %r29
iob_intr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_46), 16, 16)) -> intp(0, 0, 2c)
T0_asi_reg_rd_36:
	mov	0x3c1, %r14
	.word 0xfcdb89e0  ! 558: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb3e58000  ! 559: SAVE_R	save	%r22, %r0, %r25
iob_intr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_47), 16, 16)) -> intp(0, 0, 3d)
cpu_intr_0_32:
	setx	0x21032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 564: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_rd_37:
	mov	0x1c, %r14
	.word 0xf2db8e60  ! 567: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb3e56192  ! 569: SAVE_I	save	%r21, 0x0001, %r25
T0_asi_reg_rd_38:
	mov	0x3, %r14
	.word 0xfcdb8e40  ! 570: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_39:
	mov	0x4, %r14
	.word 0xfadb8e40  ! 572: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbde5e1c6  ! 574: SAVE_I	save	%r23, 0x0001, %r30
cpu_intr_0_33:
	setx	0x22001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53dd000  ! 578: SRAX_R	srax	%r23, %r0, %r26
	.word 0xb7e5c000  ! 580: SAVE_R	save	%r23, %r0, %r27
cpu_intr_0_34:
	setx	0x210014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4216c  ! 582: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7e4e016  ! 584: SAVE_I	save	%r19, 0x0001, %r27
T0_asi_reg_wr_24:
	mov	0x23, %r14
	.word 0xf2f38e40  ! 587: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_rd_40:
	mov	0x25, %r14
	.word 0xf6db8e80  ! 588: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T0_asi_reg_wr_25:
	mov	0xa, %r14
	.word 0xf6f389e0  ! 589: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb7e420a1  ! 595: SAVE_I	save	%r16, 0x0001, %r27
T0_asi_reg_rd_41:
	mov	0x3c7, %r14
	.word 0xf4db84a0  ! 596: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T0_asi_reg_rd_42:
	mov	0x16, %r14
	.word 0xf2db84a0  ! 598: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T0_asi_reg_rd_43:
	mov	0x3c4, %r14
	.word 0xf2db8e80  ! 599: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb445e098  ! 600: ADDC_I	addc 	%r23, 0x0098, %r26
T0_asi_reg_wr_26:
	mov	0x10, %r14
	.word 0xf2f38e40  ! 601: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbfe5a030  ! 602: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e40000  ! 605: SAVE_R	save	%r16, %r0, %r28
	.word 0xb7e5211e  ! 609: SAVE_I	save	%r20, 0x0001, %r27
iob_intr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_48), 16, 16)) -> intp(0, 0, 3e)
cpu_intr_0_35:
	setx	0x23021e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_27:
	mov	0x1, %r14
	.word 0xfcf38e40  ! 612: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_49), 16, 16)) -> intp(0, 0, 2e)
T0_asi_reg_wr_28:
	mov	0x3c3, %r14
	.word 0xf4f38e80  ! 622: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb1e5c000  ! 625: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_wr_29:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 627: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_wr_30:
	mov	0x3c0, %r14
	.word 0xfaf38400  ! 629: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbbe58000  ! 630: SAVE_R	save	%r22, %r0, %r29
T0_asi_reg_wr_31:
	mov	0x14, %r14
	.word 0xf2f384a0  ! 631: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb7e5c000  ! 634: SAVE_R	save	%r23, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbde5a117  ! 641: SAVE_I	save	%r22, 0x0001, %r30
cpu_intr_0_36:
	setx	0x23030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_32:
	mov	0x3c6, %r14
	.word 0xf0f38e40  ! 648: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb9e50000  ! 649: SAVE_R	save	%r20, %r0, %r28
	.word 0xb9504000  ! 650: RDPR_TNPC	<illegal instruction>
iob_intr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_50), 16, 16)) -> intp(0, 0, 7)
	.word 0xbbe460d3  ! 654: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe4c000  ! 655: SAVE_R	save	%r19, %r0, %r31
cpu_intr_0_37:
	setx	0x20023e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_51), 16, 16)) -> intp(0, 0, 29)
cpu_intr_0_38:
	setx	0x200328, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_44:
	mov	0x3c5, %r14
	.word 0xfadb84a0  ! 661: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T0_asi_reg_wr_33:
	mov	0x1, %r14
	.word 0xf8f38e40  ! 664: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbe944000  ! 665: ORcc_R	orcc 	%r17, %r0, %r31
iob_intr_0_52:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_52), 16, 16)) -> intp(0, 0, 3c)
iob_intr_0_53:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_53), 16, 16)) -> intp(0, 0, 17)
	.word 0xb53cf001  ! 669: SRAX_I	srax	%r19, 0x0001, %r26
iob_intr_0_54:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_54), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_rd_45:
	mov	0x3c2, %r14
	.word 0xf8db84a0  ! 673: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb3e5e075  ! 674: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb1e54000  ! 676: SAVE_R	save	%r21, %r0, %r24
cpu_intr_0_39:
	setx	0x22010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5c000  ! 681: SAVE_R	save	%r23, %r0, %r31
	.word 0xb9e40000  ! 683: SAVE_R	save	%r16, %r0, %r28
T0_asi_reg_wr_34:
	mov	0x2, %r14
	.word 0xfcf38e80  ! 687: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_0_55:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_55), 16, 16)) -> intp(0, 0, 2e)
cpu_intr_0_40:
	setx	0x200327, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_56:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_56), 16, 16)) -> intp(0, 0, 19)
T0_asi_reg_rd_46:
	mov	0x31, %r14
	.word 0xf0db8e40  ! 691: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbc0c0000  ! 692: AND_R	and 	%r16, %r0, %r30
iob_intr_0_57:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_57), 16, 16)) -> intp(0, 0, 18)
iob_intr_0_58:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_58), 16, 16)) -> intp(0, 0, 4)
cpu_intr_0_41:
	setx	0x200237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e50000  ! 700: SAVE_R	save	%r20, %r0, %r26
	.word 0xba858000  ! 701: ADDcc_R	addcc 	%r22, %r0, %r29
T0_asi_reg_rd_47:
	mov	0x17, %r14
	.word 0xf6db8e60  ! 702: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbe3c8000  ! 704: XNOR_R	xnor 	%r18, %r0, %r31
	.word 0xbde4e06f  ! 705: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbfe4e0fe  ! 706: SAVE_I	save	%r19, 0x0001, %r31
T0_asi_reg_wr_35:
	mov	0x2e, %r14
	.word 0xfaf389e0  ! 707: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T0_asi_reg_wr_36:
	mov	0x3c5, %r14
	.word 0xfaf38e60  ! 708: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_0_42:
	setx	0x21032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53ca001  ! 712: SRA_I	sra 	%r18, 0x0001, %r26
T0_asi_reg_wr_37:
	mov	0x28, %r14
	.word 0xf0f38e40  ! 713: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_43:
	setx	0x22033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e0a5  ! 715: SAVE_I	save	%r19, 0x0001, %r26
cpu_intr_0_44:
	setx	0x200227, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_38:
	mov	0x3c0, %r14
	.word 0xf4f384a0  ! 723: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb1e54000  ! 724: SAVE_R	save	%r21, %r0, %r24
T0_asi_reg_rd_48:
	mov	0x36, %r14
	.word 0xfadb8e80  ! 729: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb32c5000  ! 731: SLLX_R	sllx	%r17, %r0, %r25
T0_asi_reg_wr_39:
	mov	0x35, %r14
	.word 0xf4f384a0  ! 738: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_0_59:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_59), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_rd_49:
	mov	0x3c6, %r14
	.word 0xf8db8e80  ! 741: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb9e40000  ! 743: SAVE_R	save	%r16, %r0, %r28
T0_asi_reg_wr_40:
	mov	0x17, %r14
	.word 0xf8f38e80  ! 748: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb9e5e014  ! 749: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_rd_50:
	mov	0x0, %r14
	.word 0xf2db89e0  ! 750: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_0_60:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_60), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbd3c9000  ! 754: SRAX_R	srax	%r18, %r0, %r30
	.word 0xb9e52132  ! 757: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_45:
	setx	0x21011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe42121  ! 761: SAVE_I	save	%r16, 0x0001, %r31
iob_intr_0_61:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_61), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb7e44000  ! 765: SAVE_R	save	%r17, %r0, %r27
cpu_intr_0_46:
	setx	0x210235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e089  ! 775: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbde40000  ! 776: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_62:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_62), 16, 16)) -> intp(0, 0, 12)
cpu_intr_0_47:
	setx	0x200117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 779: SAVE_R	save	%r23, %r0, %r27
	.word 0xb7e4606f  ! 786: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbc2d2091  ! 788: ANDN_I	andn 	%r20, 0x0091, %r30
T0_asi_reg_wr_41:
	mov	0x3c4, %r14
	.word 0xf8f389e0  ! 789: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T0_asi_reg_wr_42:
	mov	0x3c0, %r14
	.word 0xf0f384a0  ! 792: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_0_63:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_63), 16, 16)) -> intp(0, 0, 11)
iob_intr_0_64:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_64), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_65:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_65), 16, 16)) -> intp(0, 0, 21)
T0_asi_reg_rd_51:
	mov	0xe, %r14
	.word 0xf0db8e40  ! 802: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb7e5a017  ! 803: SAVE_I	save	%r22, 0x0001, %r27
iob_intr_0_66:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_66), 16, 16)) -> intp(0, 0, 27)
T0_asi_reg_wr_43:
	mov	0x3c0, %r14
	.word 0xf4f389e0  ! 806: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_0_67:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_67), 16, 16)) -> intp(0, 0, 29)
T0_asi_reg_rd_52:
	mov	0x1d, %r14
	.word 0xf8db8e40  ! 813: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_rd_53:
	mov	0x3c6, %r14
	.word 0xfedb8e60  ! 817: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb5e4c000  ! 818: SAVE_R	save	%r19, %r0, %r26
cpu_intr_0_48:
	setx	0x200200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e520aa  ! 828: SAVE_I	save	%r20, 0x0001, %r27
T0_asi_reg_rd_54:
	mov	0x35, %r14
	.word 0xfadb8e40  ! 831: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbbe421df  ! 833: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbde50000  ! 834: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_wr_44:
	mov	0x3c8, %r14
	.word 0xfaf38400  ! 835: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb22c6144  ! 836: ANDN_I	andn 	%r17, 0x0144, %r25
T0_asi_reg_wr_45:
	mov	0x4, %r14
	.word 0xfaf38e60  ! 837: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T0_asi_reg_wr_46:
	mov	0x3c1, %r14
	.word 0xf4f38e80  ! 839: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_0_49:
	setx	0x21021e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_50:
	setx	0x210012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12d3001  ! 848: SLLX_I	sllx	%r20, 0x0001, %r24
iob_intr_0_68:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_68), 16, 16)) -> intp(0, 0, 8)
cpu_intr_0_51:
	setx	0x22030e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_52:
	setx	0x230319, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_53:
	setx	0x230123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe50000  ! 861: SAVE_R	save	%r20, %r0, %r31
	.word 0xbde54000  ! 865: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_54:
	setx	0x23033e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_47:
	mov	0x27, %r14
	.word 0xfaf38e60  ! 870: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_0_69:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_69), 16, 16)) -> intp(0, 0, 11)
T0_asi_reg_wr_48:
	mov	0x11, %r14
	.word 0xf8f389e0  ! 874: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb9e4211f  ! 878: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb1e40000  ! 881: SAVE_R	save	%r16, %r0, %r24
	.word 0xb9e4c000  ! 882: SAVE_R	save	%r19, %r0, %r28
iob_intr_0_70:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_70), 16, 16)) -> intp(0, 0, 31)
iob_intr_0_71:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_71), 16, 16)) -> intp(0, 0, 35)
	.word 0xb1e40000  ! 888: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_55:
	setx	0x23022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4c000  ! 892: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_rd_55:
	mov	0x31, %r14
	.word 0xf2db8e60  ! 893: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_0_56:
	setx	0x210012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2044000  ! 897: ADD_R	add 	%r17, %r0, %r25
iob_intr_0_72:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_72), 16, 16)) -> intp(0, 0, 15)
iob_intr_0_73:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_73), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_57:
	setx	0x26011e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_74:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_74), 16, 16)) -> intp(0, 0, b)
T0_asi_reg_rd_56:
	mov	0x21, %r14
	.word 0xfcdb89e0  ! 906: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb3e4a17e  ! 909: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe44000  ! 910: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_75:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_75), 16, 16)) -> intp(0, 0, 36)
T0_asi_reg_wr_49:
	mov	0x17, %r14
	.word 0xfcf38e40  ! 916: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_58:
	setx	0x250019, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_76:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_76), 16, 16)) -> intp(0, 0, 3c)
cpu_intr_0_59:
	setx	0x260201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3dc000  ! 926: SRA_R	sra 	%r23, %r0, %r29
	.word 0xb3e5201f  ! 933: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbde48000  ! 936: SAVE_R	save	%r18, %r0, %r30
	.word 0x8d95e165  ! 937: WRPR_PSTATE_I	wrpr	%r23, 0x0165, %pstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e40000  ! 939: SAVE_R	save	%r16, %r0, %r25
iob_intr_0_77:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_77), 16, 16)) -> intp(0, 0, 16)
T0_asi_reg_rd_57:
	mov	0x31, %r14
	.word 0xf2db8e60  ! 944: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T0_asi_reg_wr_50:
	mov	0x12, %r14
	.word 0xf8f38e60  ! 945: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbde5e073  ! 946: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbfe4a161  ! 948: SAVE_I	save	%r18, 0x0001, %r31
iob_intr_0_78:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_78), 16, 16)) -> intp(0, 0, 2d)
iob_intr_0_79:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_79), 16, 16)) -> intp(0, 0, 36)
	.word 0xb9e40000  ! 953: SAVE_R	save	%r16, %r0, %r28
cpu_intr_0_60:
	setx	0x25021f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_61:
	setx	0x270326, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_58:
	mov	0x11, %r14
	.word 0xf6db8e80  ! 957: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb3e5215c  ! 958: SAVE_I	save	%r20, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e50000  ! 961: SAVE_R	save	%r20, %r0, %r25
	.word 0xb5e58000  ! 964: SAVE_R	save	%r22, %r0, %r26
	.word 0xb7e48000  ! 966: SAVE_R	save	%r18, %r0, %r27
	.word 0xb0bd8000  ! 967: XNORcc_R	xnorcc 	%r22, %r0, %r24
	.word 0xb1e4e19c  ! 968: SAVE_I	save	%r19, 0x0001, %r24
cpu_intr_0_62:
	setx	0x260011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe560a8  ! 971: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xba8de11f  ! 975: ANDcc_I	andcc 	%r23, 0x011f, %r29
	.word 0xbeb5e1ac  ! 978: SUBCcc_I	orncc 	%r23, 0x01ac, %r31
	.word 0xbde560a3  ! 981: SAVE_I	save	%r21, 0x0001, %r30
cpu_intr_0_63:
	setx	0x26021a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_80:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_80), 16, 16)) -> intp(0, 0, 6)
iob_intr_0_81:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_81), 16, 16)) -> intp(0, 0, 3c)
cpu_intr_0_64:
	setx	0x24020d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_65:
	setx	0x250126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4207d  ! 989: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb41c0000  ! 990: XOR_R	xor 	%r16, %r0, %r26
	.word 0xbde5c000  ! 993: SAVE_R	save	%r23, %r0, %r30
	.word 0xb3504000  ! 995: RDPR_TNPC	<illegal instruction>
cpu_intr_0_66:
	setx	0x24022d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_51:
	mov	0xc, %r14
	.word 0xfcf389e0  ! 997: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_0_67:
	setx	0x240032, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_59:
	mov	0xa, %r14
	.word 0xf4db89e0  ! 1002: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbbe5e1de  ! 1003: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb7e520e1  ! 1007: SAVE_I	save	%r20, 0x0001, %r27
cpu_intr_0_68:
	setx	0x270032, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_52:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 1009: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb7e5c000  ! 1012: SAVE_R	save	%r23, %r0, %r27
	.word 0xbfe4e035  ! 1013: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9e52030  ! 1016: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_69:
	setx	0x240327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9348000  ! 1022: SRL_R	srl 	%r18, %r0, %r28
T0_asi_reg_rd_60:
	mov	0x8, %r14
	.word 0xfadb89e0  ! 1025: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0x81942052  ! 1026: WRPR_TPC_I	wrpr	%r16, 0x0052, %tpc
cpu_intr_0_70:
	setx	0x26022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba0de13b  ! 1030: AND_I	and 	%r23, 0x013b, %r29
	.word 0xbfe48000  ! 1032: SAVE_R	save	%r18, %r0, %r31
	.word 0xbbe520dd  ! 1035: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb5e521ad  ! 1037: SAVE_I	save	%r20, 0x0001, %r26
iob_intr_0_82:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_82), 16, 16)) -> intp(0, 0, 19)
cpu_intr_0_71:
	setx	0x26003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_72:
	setx	0x250024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e44000  ! 1045: SAVE_R	save	%r17, %r0, %r25
cpu_intr_0_73:
	setx	0x240336, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_83:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_83), 16, 16)) -> intp(0, 0, 1)
T0_asi_reg_rd_61:
	mov	0xe, %r14
	.word 0xf2db8e80  ! 1049: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T0_asi_reg_rd_62:
	mov	0xd, %r14
	.word 0xfcdb8e40  ! 1052: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_rd_63:
	mov	0x3c8, %r14
	.word 0xf8db84a0  ! 1053: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbfe5c000  ! 1054: SAVE_R	save	%r23, %r0, %r31
	.word 0xb88da001  ! 1058: ANDcc_I	andcc 	%r22, 0x0001, %r28
	.word 0xb9e54000  ! 1064: SAVE_R	save	%r21, %r0, %r28
	.word 0xb62d8000  ! 1065: ANDN_R	andn 	%r22, %r0, %r27
T0_asi_reg_wr_53:
	mov	0x14, %r14
	.word 0xfaf389e0  ! 1073: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_0_74:
	setx	0x260332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e42160  ! 1078: SAVE_I	save	%r16, 0x0001, %r25
iob_intr_0_84:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_84), 16, 16)) -> intp(0, 0, 1d)
cpu_intr_0_75:
	setx	0x250108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e42071  ! 1083: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e44000  ! 1085: SAVE_R	save	%r17, %r0, %r27
T0_asi_reg_rd_64:
	mov	0x1d, %r14
	.word 0xfcdb8e80  ! 1087: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_0_85:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_85), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_rd_65:
	mov	0x22, %r14
	.word 0xfadb84a0  ! 1095: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_0_86:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_86), 16, 16)) -> intp(0, 0, 24)
iob_intr_0_87:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_87), 16, 16)) -> intp(0, 0, 8)
iob_intr_0_88:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_88), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb5e48000  ! 1099: SAVE_R	save	%r18, %r0, %r26
	.word 0xb7e50000  ! 1100: SAVE_R	save	%r20, %r0, %r27
	.word 0xb7e5213a  ! 1102: SAVE_I	save	%r20, 0x0001, %r27
cpu_intr_0_76:
	setx	0x260330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe2cc000  ! 1106: ANDN_R	andn 	%r19, %r0, %r31
	.word 0xbbe50000  ! 1108: SAVE_R	save	%r20, %r0, %r29
	.word 0xbde4c000  ! 1109: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_77:
	setx	0x240220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e50000  ! 1111: SAVE_R	save	%r20, %r0, %r26
cpu_intr_0_78:
	setx	0x250115, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_66:
	mov	0x3c7, %r14
	.word 0xfadb8e80  ! 1117: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_0_89:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_89), 16, 16)) -> intp(0, 0, 2b)
T0_asi_reg_rd_67:
	mov	0x13, %r14
	.word 0xf2db84a0  ! 1119: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb9e52089  ! 1120: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbde4c000  ! 1123: SAVE_R	save	%r19, %r0, %r30
	.word 0xbfe5e006  ! 1124: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbfe5606e  ! 1125: SAVE_I	save	%r21, 0x0001, %r31
iob_intr_0_90:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_90), 16, 16)) -> intp(0, 0, 2)
iob_intr_0_91:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_91), 16, 16)) -> intp(0, 0, e)
	.word 0xb5e5210e  ! 1134: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbe8ce043  ! 1135: ANDcc_I	andcc 	%r19, 0x0043, %r31
cpu_intr_0_79:
	setx	0x260207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a1ee  ! 1141: SAVE_I	save	%r18, 0x0001, %r24
T0_asi_reg_wr_54:
	mov	0xa, %r14
	.word 0xf8f38e40  ! 1143: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_80:
	setx	0x270017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd2d4000  ! 1150: SLL_R	sll 	%r21, %r0, %r30
cpu_intr_0_81:
	setx	0x240027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb80da1da  ! 1156: AND_I	and 	%r22, 0x01da, %r28
	.word 0xba9d2111  ! 1157: XORcc_I	xorcc 	%r20, 0x0111, %r29
T0_asi_reg_rd_68:
	mov	0x35, %r14
	.word 0xf4db8e40  ! 1158: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_0_82:
	setx	0x24020c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_83:
	setx	0x270317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb49ce05e  ! 1162: XORcc_I	xorcc 	%r19, 0x005e, %r26
T0_asi_reg_wr_55:
	mov	0x3c6, %r14
	.word 0xfcf38e80  ! 1164: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_0_92:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_92), 16, 16)) -> intp(0, 0, 31)
iob_intr_0_93:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_93), 16, 16)) -> intp(0, 0, 34)
iob_intr_0_94:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_94), 16, 16)) -> intp(0, 0, 18)
	.word 0xbbe44000  ! 1175: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_wr_56:
	mov	0x2e, %r14
	.word 0xfef384a0  ! 1176: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb28c4000  ! 1179: ANDcc_R	andcc 	%r17, %r0, %r25
cpu_intr_0_84:
	setx	0x270012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a149  ! 1181: SAVE_I	save	%r22, 0x0001, %r29
T0_asi_reg_wr_57:
	mov	0x3c5, %r14
	.word 0xf6f38e40  ! 1184: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_0_85:
	setx	0x260006, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_58:
	mov	0x24, %r14
	.word 0xf6f38e40  ! 1189: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbfe5c000  ! 1190: SAVE_R	save	%r23, %r0, %r31
T0_asi_reg_rd_69:
	mov	0x3c2, %r14
	.word 0xf0db84a0  ! 1191: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb1e48000  ! 1193: SAVE_R	save	%r18, %r0, %r24
T0_asi_reg_wr_59:
	mov	0xa, %r14
	.word 0xf2f389e0  ! 1194: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T0_asi_reg_wr_60:
	mov	0x3c1, %r14
	.word 0xf4f38e80  ! 1197: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T0_asi_reg_rd_70:
	mov	0x6, %r14
	.word 0xf8db8e40  ! 1198: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_86:
	setx	0x24023b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_95:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_95), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbde4c000  ! 1208: SAVE_R	save	%r19, %r0, %r30
	.word 0xb2b5e1dc  ! 1210: ORNcc_I	orncc 	%r23, 0x01dc, %r25
T0_asi_reg_rd_71:
	mov	0x1c, %r14
	.word 0xfedb84a0  ! 1211: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_0_87:
	setx	0x270128, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_88:
	setx	0x24011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e105  ! 1214: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbfe40000  ! 1215: SAVE_R	save	%r16, %r0, %r31
	.word 0xb0156040  ! 1216: OR_I	or 	%r21, 0x0040, %r24
	.word 0xb3357001  ! 1221: SRLX_I	srlx	%r21, 0x0001, %r25
	.word 0xbe35e1c9  ! 1222: ORN_I	orn 	%r23, 0x01c9, %r31
T0_asi_reg_rd_72:
	mov	0x15, %r14
	.word 0xfcdb8e80  ! 1223: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb4958000  ! 1224: ORcc_R	orcc 	%r22, %r0, %r26
cpu_intr_0_89:
	setx	0x26030c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_96:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_96), 16, 16)) -> intp(0, 0, a)
cpu_intr_0_90:
	setx	0x270331, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_97:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_97), 16, 16)) -> intp(0, 0, 1d)
	.word 0xbbe48000  ! 1236: SAVE_R	save	%r18, %r0, %r29
	.word 0xbe942027  ! 1237: ORcc_I	orcc 	%r16, 0x0027, %r31
cpu_intr_0_91:
	setx	0x250301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe560fb  ! 1239: SAVE_I	save	%r21, 0x0001, %r31
cpu_intr_0_92:
	setx	0x240319, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_61:
	mov	0x1e, %r14
	.word 0xf6f38e60  ! 1241: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbde4e1f7  ! 1242: SAVE_I	save	%r19, 0x0001, %r30
iob_intr_0_98:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_98), 16, 16)) -> intp(0, 0, 1e)
iob_intr_0_99:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_99), 16, 16)) -> intp(0, 0, 8)
cpu_intr_0_93:
	setx	0x24023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbabc8000  ! 1249: XNORcc_R	xnorcc 	%r18, %r0, %r29
	.word 0xb7e460e8  ! 1252: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbd3de001  ! 1253: SRA_I	sra 	%r23, 0x0001, %r30
iob_intr_0_100:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_100), 16, 16)) -> intp(0, 0, 17)
	.word 0xb405a02e  ! 1258: ADD_I	add 	%r22, 0x002e, %r26
	.word 0xb5e42119  ! 1264: SAVE_I	save	%r16, 0x0001, %r26
cpu_intr_0_94:
	setx	0x260306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e421f1  ! 1267: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbfe5e11e  ! 1271: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb7e46080  ! 1272: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb9e54000  ! 1273: SAVE_R	save	%r21, %r0, %r28
	.word 0xb9e4e176  ! 1282: SAVE_I	save	%r19, 0x0001, %r28
iob_intr_0_101:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_101), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb5e5e14c  ! 1287: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb7e58000  ! 1288: SAVE_R	save	%r22, %r0, %r27
	.word 0xb5e5e1e1  ! 1289: SAVE_I	save	%r23, 0x0001, %r26
iob_intr_0_102:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_102), 16, 16)) -> intp(0, 0, 11)
	.word 0xbfe5e05e  ! 1296: SAVE_I	save	%r23, 0x0001, %r31
iob_intr_0_103:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_103), 16, 16)) -> intp(0, 0, 19)
	.word 0x8194202a  ! 1301: WRPR_TPC_I	wrpr	%r16, 0x002a, %tpc
iob_intr_0_104:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_104), 16, 16)) -> intp(0, 0, c)
iob_intr_0_105:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_105), 16, 16)) -> intp(0, 0, d)
T0_asi_reg_wr_62:
	mov	0x38, %r14
	.word 0xf4f38e60  ! 1311: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb1e46073  ! 1312: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_rd_73:
	mov	0x3c3, %r14
	.word 0xf4db89e0  ! 1313: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T0_asi_reg_rd_74:
	mov	0x14, %r14
	.word 0xf4db84a0  ! 1314: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T0_asi_reg_rd_75:
	mov	0x3c1, %r14
	.word 0xf8db89e0  ! 1317: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_0_95:
	setx	0x250013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12cf001  ! 1321: SLLX_I	sllx	%r19, 0x0001, %r24
cpu_intr_0_96:
	setx	0x26023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e521d0  ! 1324: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbfe421ed  ! 1328: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb3e48000  ! 1330: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_wr_63:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 1331: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb5e4a1bf  ! 1334: SAVE_I	save	%r18, 0x0001, %r26
iob_intr_0_106:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_106), 16, 16)) -> intp(0, 0, 28)
	.word 0xb9e48000  ! 1337: SAVE_R	save	%r18, %r0, %r28
	.word 0xb1e421c8  ! 1339: SAVE_I	save	%r16, 0x0001, %r24
iob_intr_0_107:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_107), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb9e48000  ! 1342: SAVE_R	save	%r18, %r0, %r28
T0_asi_reg_wr_64:
	mov	0x1a, %r14
	.word 0xf6f384a0  ! 1343: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb3e4c000  ! 1344: SAVE_R	save	%r19, %r0, %r25
	.word 0xb7e421d1  ! 1345: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbde5214d  ! 1349: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb0250000  ! 1351: SUB_R	sub 	%r20, %r0, %r24
	.word 0xbde4a004  ! 1353: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e54000  ! 1354: SAVE_R	save	%r21, %r0, %r25
	.word 0xb2b5e020  ! 1356: SUBCcc_I	orncc 	%r23, 0x0020, %r25
	.word 0xb9e5e038  ! 1361: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3e4a054  ! 1362: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe48000  ! 1363: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_wr_65:
	mov	0x3c2, %r14
	.word 0xfaf38e60  ! 1364: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_0_97:
	setx	0x2a0337, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_76:
	mov	0x26, %r14
	.word 0xfcdb84a0  ! 1370: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb7520000  ! 1371: RDPR_PIL	<illegal instruction>
cpu_intr_0_98:
	setx	0x290133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a06c  ! 1376: SAVE_I	save	%r18, 0x0001, %r25
T0_asi_reg_wr_66:
	mov	0xe, %r14
	.word 0xf0f38e40  ! 1378: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_rd_77:
	mov	0x3c5, %r14
	.word 0xf8db84a0  ! 1386: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_0_108:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_108), 16, 16)) -> intp(0, 0, 35)
	.word 0xb5e48000  ! 1389: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_109:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_109), 16, 16)) -> intp(0, 0, 5)
	.word 0xb28dc000  ! 1392: ANDcc_R	andcc 	%r23, %r0, %r25
T0_asi_reg_wr_67:
	mov	0x1d, %r14
	.word 0xfaf38e40  ! 1393: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbde5e1d6  ! 1395: SAVE_I	save	%r23, 0x0001, %r30
iob_intr_0_110:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_110), 16, 16)) -> intp(0, 0, c)
	.word 0xbbe58000  ! 1399: SAVE_R	save	%r22, %r0, %r29
	.word 0xbfe52169  ! 1400: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9e4c000  ! 1401: SAVE_R	save	%r19, %r0, %r28
iob_intr_0_111:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_111), 16, 16)) -> intp(0, 0, 28)
	.word 0xb3e54000  ! 1403: SAVE_R	save	%r21, %r0, %r25
cpu_intr_0_99:
	setx	0x29013b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_112:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_112), 16, 16)) -> intp(0, 0, 39)
	.word 0xb3e4c000  ! 1409: SAVE_R	save	%r19, %r0, %r25
	.word 0xbc3d2118  ! 1411: XNOR_I	xnor 	%r20, 0x0118, %r30
	.word 0xb7e4c000  ! 1412: SAVE_R	save	%r19, %r0, %r27
	.word 0xbcb461f8  ! 1419: ORNcc_I	orncc 	%r17, 0x01f8, %r30
	.word 0xb43de052  ! 1420: XNOR_I	xnor 	%r23, 0x0052, %r26
	.word 0xb5e54000  ! 1423: SAVE_R	save	%r21, %r0, %r26
iob_intr_0_113:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_113), 16, 16)) -> intp(0, 0, 3d)
cpu_intr_0_100:
	setx	0x2a0219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e40000  ! 1431: SAVE_R	save	%r16, %r0, %r28
	.word 0xb02dc000  ! 1436: ANDN_R	andn 	%r23, %r0, %r24
	.word 0xb3e5e1b8  ! 1437: SAVE_I	save	%r23, 0x0001, %r25
iob_intr_0_114:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_114), 16, 16)) -> intp(0, 0, 8)
iob_intr_0_115:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_115), 16, 16)) -> intp(0, 0, 27)
	.word 0xbde5219a  ! 1441: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_rd_78:
	mov	0x3c3, %r14
	.word 0xfcdb8400  ! 1442: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbfe44000  ! 1444: SAVE_R	save	%r17, %r0, %r31
	.word 0xbde5a1a0  ! 1446: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb57d4400  ! 1448: MOVR_R	movre	%r21, %r0, %r26
	.word 0xb5e5213a  ! 1449: SAVE_I	save	%r20, 0x0001, %r26
iob_intr_0_116:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_116), 16, 16)) -> intp(0, 0, 28)
iob_intr_0_117:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_117), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb3e42187  ! 1459: SAVE_I	save	%r16, 0x0001, %r25
iob_intr_0_118:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_118), 16, 16)) -> intp(0, 0, 6)
cpu_intr_0_101:
	setx	0x280131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba1520cf  ! 1467: OR_I	or 	%r20, 0x00cf, %r29
	.word 0xbfe5a043  ! 1469: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb5e4c000  ! 1470: SAVE_R	save	%r19, %r0, %r26
cpu_intr_0_102:
	setx	0x280111, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_119:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_119), 16, 16)) -> intp(0, 0, 1d)
	.word 0xbf7de401  ! 1477: MOVR_I	movre	%r23, 0x1, %r31
	.word 0xbde54000  ! 1480: SAVE_R	save	%r21, %r0, %r30
	.word 0xb3e58000  ! 1484: SAVE_R	save	%r22, %r0, %r25
iob_intr_0_120:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_120), 16, 16)) -> intp(0, 0, 17)
iob_intr_0_121:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_121), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb3e5e05c  ! 1488: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbfe4c000  ! 1489: SAVE_R	save	%r19, %r0, %r31
T0_asi_reg_wr_68:
	mov	0x22, %r14
	.word 0xf2f38e40  ! 1490: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_0_103:
	setx	0x2a001f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_122:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_122), 16, 16)) -> intp(0, 0, 31)
	.word 0xb3e58000  ! 1499: SAVE_R	save	%r22, %r0, %r25
T0_asi_reg_wr_69:
	mov	0x1b, %r14
	.word 0xfaf38e60  ! 1500: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb7e42130  ! 1502: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbfe420bc  ! 1504: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5e461c6  ! 1507: SAVE_I	save	%r17, 0x0001, %r26
iob_intr_0_123:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_123), 16, 16)) -> intp(0, 0, 13)
T0_asi_reg_wr_70:
	mov	0x1d, %r14
	.word 0xf0f38e40  ! 1511: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_104:
	setx	0x2a0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12d4000  ! 1514: SLL_R	sll 	%r21, %r0, %r24
cpu_intr_0_105:
	setx	0x29031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb49ca0cb  ! 1519: XORcc_I	xorcc 	%r18, 0x00cb, %r26
iob_intr_0_124:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_124), 16, 16)) -> intp(0, 0, 2a)
iob_intr_0_125:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_125), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb8350000  ! 1522: SUBC_R	orn 	%r20, %r0, %r28
T0_asi_reg_wr_71:
	mov	0x38, %r14
	.word 0xf4f38e40  ! 1523: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb5e5a05a  ! 1528: SAVE_I	save	%r22, 0x0001, %r26
T0_asi_reg_wr_72:
	mov	0x14, %r14
	.word 0xf6f38e40  ! 1529: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_0_106:
	setx	0x28013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e44000  ! 1534: SAVE_R	save	%r17, %r0, %r27
cpu_intr_0_107:
	setx	0x280121, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_108:
	setx	0x29002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe50000  ! 1544: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_rd_79:
	mov	0x26, %r14
	.word 0xf8db8e80  ! 1545: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_0_126:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_126), 16, 16)) -> intp(0, 0, 7)
cpu_intr_0_109:
	setx	0x2b0330, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_127:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_127), 16, 16)) -> intp(0, 0, 1)
iob_intr_0_128:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_128), 16, 16)) -> intp(0, 0, 2f)
	.word 0xbfe4c000  ! 1552: SAVE_R	save	%r19, %r0, %r31
T0_asi_reg_rd_80:
	mov	0x9, %r14
	.word 0xf8db8e60  ! 1554: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T0_asi_reg_rd_81:
	mov	0x27, %r14
	.word 0xfedb8400  ! 1557: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbbe420b3  ! 1558: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbde42106  ! 1559: SAVE_I	save	%r16, 0x0001, %r30
cpu_intr_0_110:
	setx	0x28031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_73:
	mov	0x3c2, %r14
	.word 0xfaf38e80  ! 1567: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_0_129:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_129), 16, 16)) -> intp(0, 0, 1b)
iob_intr_0_130:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_130), 16, 16)) -> intp(0, 0, 19)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_74:
	mov	0x1d, %r14
	.word 0xf0f38400  ! 1575: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_0_131:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_131), 16, 16)) -> intp(0, 0, 1d)
cpu_intr_0_111:
	setx	0x2a022f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_132:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_132), 16, 16)) -> intp(0, 0, 14)
	.word 0xb3e52123  ! 1581: SAVE_I	save	%r20, 0x0001, %r25
iob_intr_0_133:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_133), 16, 16)) -> intp(0, 0, 0)
cpu_intr_0_112:
	setx	0x29033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4c000  ! 1585: SAVE_R	save	%r19, %r0, %r27
iob_intr_0_134:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_134), 16, 16)) -> intp(0, 0, 27)
T0_asi_reg_rd_82:
	mov	0x26, %r14
	.word 0xf6db84a0  ! 1589: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb5e4a148  ! 1591: SAVE_I	save	%r18, 0x0001, %r26
iob_intr_0_135:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_135), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbbe44000  ! 1593: SAVE_R	save	%r17, %r0, %r29
cpu_intr_0_113:
	setx	0x29003c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_75:
	mov	0x9, %r14
	.word 0xf4f38e60  ! 1598: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T0_asi_reg_wr_76:
	mov	0x0, %r14
	.word 0xfaf38e60  ! 1599: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_0_136:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_136), 16, 16)) -> intp(0, 0, 31)
iob_intr_0_137:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_137), 16, 16)) -> intp(0, 0, 13)
	.word 0xbde40000  ! 1605: SAVE_R	save	%r16, %r0, %r30
	.word 0xb3e54000  ! 1607: SAVE_R	save	%r21, %r0, %r25
cpu_intr_0_114:
	setx	0x29000b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_83:
	mov	0x1a, %r14
	.word 0xf4db8e40  ! 1609: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T0_asi_reg_wr_77:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 1610: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbde4a0d5  ! 1611: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_wr_78:
	mov	0x3c8, %r14
	.word 0xf2f384a0  ! 1612: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T0_asi_reg_wr_79:
	mov	0x3c5, %r14
	.word 0xf4f38e80  ! 1613: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T0_asi_reg_rd_84:
	mov	0x3c4, %r14
	.word 0xf0db8e80  ! 1614: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_0_138:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_138), 16, 16)) -> intp(0, 0, 8)
	.word 0xbde40000  ! 1631: SAVE_R	save	%r16, %r0, %r30
	.word 0xb1e5a1fe  ! 1635: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e5c000  ! 1636: SAVE_R	save	%r23, %r0, %r26
iob_intr_0_139:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_139), 16, 16)) -> intp(0, 0, 13)
	.word 0xb3e5609b  ! 1642: SAVE_I	save	%r21, 0x0001, %r25
cpu_intr_0_115:
	setx	0x29011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e1b4  ! 1644: SAVE_I	save	%r23, 0x0001, %r25
iob_intr_0_140:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_140), 16, 16)) -> intp(0, 0, 24)
	.word 0xbd51c000  ! 1647: RDPR_TL	<illegal instruction>
	.word 0xbbe521ce  ! 1648: SAVE_I	save	%r20, 0x0001, %r29
iob_intr_0_141:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_141), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_116:
	setx	0x280123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e1e0  ! 1658: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_142:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_142), 16, 16)) -> intp(0, 0, 3a)
cpu_intr_0_117:
	setx	0x290000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_118:
	setx	0x290109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb49de087  ! 1662: XORcc_I	xorcc 	%r23, 0x0087, %r26
	.word 0xbde5c000  ! 1663: SAVE_R	save	%r23, %r0, %r30
T0_asi_reg_rd_85:
	mov	0xc, %r14
	.word 0xf8db8e40  ! 1665: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_0_143:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_143), 16, 16)) -> intp(0, 0, 2)
	.word 0xb7e50000  ! 1668: SAVE_R	save	%r20, %r0, %r27
T0_asi_reg_wr_80:
	mov	0x11, %r14
	.word 0xfef384a0  ! 1669: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_0_144:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_144), 16, 16)) -> intp(0, 0, 15)
	.word 0x8394a1bb  ! 1675: WRPR_TNPC_I	wrpr	%r18, 0x01bb, %tnpc
	.word 0xb5e5202b  ! 1679: SAVE_I	save	%r20, 0x0001, %r26
cpu_intr_0_119:
	setx	0x2b020a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_120:
	setx	0x290321, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_145:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_145), 16, 16)) -> intp(0, 0, 33)
T0_asi_reg_wr_81:
	mov	0x1b, %r14
	.word 0xf6f38e60  ! 1688: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb5e40000  ! 1689: SAVE_R	save	%r16, %r0, %r26
iob_intr_0_146:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_146), 16, 16)) -> intp(0, 0, 28)
	.word 0xb1e4a18e  ! 1692: SAVE_I	save	%r18, 0x0001, %r24
T0_asi_reg_rd_86:
	mov	0xf, %r14
	.word 0xf4db84a0  ! 1693: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbbe52023  ! 1696: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb1e54000  ! 1697: SAVE_R	save	%r21, %r0, %r24
iob_intr_0_147:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_147), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_rd_87:
	mov	0x3c1, %r14
	.word 0xf6db8e80  ! 1699: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_121:
	setx	0x290006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e11e  ! 1704: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_wr_82:
	mov	0x0, %r14
	.word 0xf6f38e40  ! 1706: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_rd_88:
	mov	0xa, %r14
	.word 0xf6db89e0  ! 1707: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T0_asi_reg_wr_83:
	mov	0x1a, %r14
	.word 0xf6f384a0  ! 1709: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xbde50000  ! 1710: SAVE_R	save	%r20, %r0, %r30
iob_intr_0_148:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_148), 16, 16)) -> intp(0, 0, c)
	.word 0xbe0ca1fa  ! 1718: AND_I	and 	%r18, 0x01fa, %r31
	.word 0xbde4e151  ! 1719: SAVE_I	save	%r19, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_89:
	mov	0x3c8, %r14
	.word 0xfedb8e40  ! 1724: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbbe48000  ! 1729: SAVE_R	save	%r18, %r0, %r29
cpu_intr_0_122:
	setx	0x280326, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_149:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_149), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb7e520c9  ! 1732: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb4a50000  ! 1734: SUBcc_R	subcc 	%r20, %r0, %r26
cpu_intr_0_123:
	setx	0x290303, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_150:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_150), 16, 16)) -> intp(0, 0, 35)
iob_intr_0_151:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_151), 16, 16)) -> intp(0, 0, 2d)
T0_asi_reg_rd_90:
	mov	0x3c1, %r14
	.word 0xf2db89e0  ! 1748: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbfe48000  ! 1749: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_rd_91:
	mov	0x15, %r14
	.word 0xf0db8e40  ! 1750: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_rd_92:
	mov	0x3c6, %r14
	.word 0xf0db8e60  ! 1752: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_0_124:
	setx	0x280005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e58000  ! 1757: SAVE_R	save	%r22, %r0, %r25
T0_asi_reg_rd_93:
	mov	0x37, %r14
	.word 0xfcdb8e80  ! 1763: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb5e4a117  ! 1765: SAVE_I	save	%r18, 0x0001, %r26
cpu_intr_0_125:
	setx	0x280211, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_84:
	mov	0x3c8, %r14
	.word 0xf0f384a0  ! 1768: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb7e50000  ! 1771: SAVE_R	save	%r20, %r0, %r27
iob_intr_0_152:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_152), 16, 16)) -> intp(0, 0, 1d)
	.word 0xbde50000  ! 1773: SAVE_R	save	%r20, %r0, %r30
	.word 0xb1e521df  ! 1774: SAVE_I	save	%r20, 0x0001, %r24
T0_asi_reg_rd_94:
	mov	0x2e, %r14
	.word 0xf2db8400  ! 1775: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_0_153:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_153), 16, 16)) -> intp(0, 0, 36)
iob_intr_0_154:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_154), 16, 16)) -> intp(0, 0, 34)
iob_intr_0_155:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_155), 16, 16)) -> intp(0, 0, 29)
	.word 0xb3e4c000  ! 1783: SAVE_R	save	%r19, %r0, %r25
	.word 0xb5e54000  ! 1784: SAVE_R	save	%r21, %r0, %r26
	.word 0xb5e48000  ! 1786: SAVE_R	save	%r18, %r0, %r26
	.word 0xb7e4610f  ! 1788: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1e54000  ! 1789: SAVE_R	save	%r21, %r0, %r24
	.word 0xbfe461d5  ! 1792: SAVE_I	save	%r17, 0x0001, %r31
iob_intr_0_156:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_156), 16, 16)) -> intp(0, 0, 29)
	.word 0xbde5e0ed  ! 1794: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb9e50000  ! 1797: SAVE_R	save	%r20, %r0, %r28
	.word 0xb3e5a0f3  ! 1799: SAVE_I	save	%r22, 0x0001, %r25
cpu_intr_0_126:
	setx	0x2a0303, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_95:
	mov	0x5, %r14
	.word 0xfedb8e40  ! 1801: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbfe4611b  ! 1806: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_wr_85:
	mov	0x18, %r14
	.word 0xf2f38e60  ! 1807: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb5e48000  ! 1808: SAVE_R	save	%r18, %r0, %r26
cpu_intr_0_127:
	setx	0x2f0030, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_128:
	setx	0x2f031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e420b6  ! 1814: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb1e40000  ! 1816: SAVE_R	save	%r16, %r0, %r24
	.word 0xb3e48000  ! 1817: SAVE_R	save	%r18, %r0, %r25
cpu_intr_0_129:
	setx	0x2c0319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5c000  ! 1821: SAVE_R	save	%r23, %r0, %r26
	.word 0xb9e44000  ! 1823: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_wr_86:
	mov	0x3c0, %r14
	.word 0xfcf38e80  ! 1826: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_0_157:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_157), 16, 16)) -> intp(0, 0, c)
cpu_intr_0_130:
	setx	0x2f020f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_87:
	mov	0x3c5, %r14
	.word 0xf2f38e60  ! 1830: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb52ce001  ! 1831: SLL_I	sll 	%r19, 0x0001, %r26
	.word 0xbde4601b  ! 1832: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb9e4c000  ! 1839: SAVE_R	save	%r19, %r0, %r28
cpu_intr_0_131:
	setx	0x2f002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc154000  ! 1842: OR_R	or 	%r21, %r0, %r30
cpu_intr_0_132:
	setx	0x2d001b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_133:
	setx	0x2e0238, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_134:
	setx	0x2d0200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e58000  ! 1847: SAVE_R	save	%r22, %r0, %r24
cpu_intr_0_135:
	setx	0x2f0111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd2d1000  ! 1850: SLLX_R	sllx	%r20, %r0, %r30
T0_asi_reg_rd_96:
	mov	0x19, %r14
	.word 0xfcdb8e80  ! 1859: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbde58000  ! 1860: SAVE_R	save	%r22, %r0, %r30
	.word 0xbfe54000  ! 1861: SAVE_R	save	%r21, %r0, %r31
	.word 0xbbe44000  ! 1862: SAVE_R	save	%r17, %r0, %r29
cpu_intr_0_136:
	setx	0x2c0133, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_158:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_158), 16, 16)) -> intp(0, 0, 37)
T0_asi_reg_rd_97:
	mov	0x10, %r14
	.word 0xf4db84a0  ! 1868: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb5e54000  ! 1870: SAVE_R	save	%r21, %r0, %r26
cpu_intr_0_137:
	setx	0x2f0135, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_88:
	mov	0x9, %r14
	.word 0xf8f38e40  ! 1872: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbbe4c000  ! 1873: SAVE_R	save	%r19, %r0, %r29
T0_asi_reg_rd_98:
	mov	0x1f, %r14
	.word 0xf2db8400  ! 1876: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_0_138:
	setx	0x2d0032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5c000  ! 1884: SAVE_R	save	%r23, %r0, %r25
	.word 0xb3e4a171  ! 1885: SAVE_I	save	%r18, 0x0001, %r25
iob_intr_0_159:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_159), 16, 16)) -> intp(0, 0, 15)
iob_intr_0_160:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_160), 16, 16)) -> intp(0, 0, 14)
	.word 0xb6bd21b1  ! 1890: XNORcc_I	xnorcc 	%r20, 0x01b1, %r27
	.word 0xb9e5e157  ! 1891: SAVE_I	save	%r23, 0x0001, %r28
cpu_intr_0_139:
	setx	0x2f0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 1895: SAVE_R	save	%r21, %r0, %r27
cpu_intr_0_140:
	setx	0x2f0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4a4a1d0  ! 1900: SUBcc_I	subcc 	%r18, 0x01d0, %r26
	.word 0xb7e54000  ! 1901: SAVE_R	save	%r21, %r0, %r27
	.word 0xb405e1a7  ! 1902: ADD_I	add 	%r23, 0x01a7, %r26
T0_asi_reg_wr_89:
	mov	0xe, %r14
	.word 0xf6f384a0  ! 1904: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb9e4212c  ! 1905: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb205e090  ! 1906: ADD_I	add 	%r23, 0x0090, %r25
cpu_intr_0_141:
	setx	0x2f0207, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_90:
	mov	0x3c8, %r14
	.word 0xfaf384a0  ! 1908: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb42ce1d4  ! 1909: ANDN_I	andn 	%r19, 0x01d4, %r26
cpu_intr_0_142:
	setx	0x2e031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e48000  ! 1911: SAVE_R	save	%r18, %r0, %r26
	.word 0xb1e421d0  ! 1914: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb62da0e5  ! 1915: ANDN_I	andn 	%r22, 0x00e5, %r27
	.word 0xb1e4a155  ! 1917: SAVE_I	save	%r18, 0x0001, %r24
T0_asi_reg_wr_91:
	mov	0x33, %r14
	.word 0xf6f384a0  ! 1919: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_0_143:
	setx	0x2f0305, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_99:
	mov	0x6, %r14
	.word 0xfedb8e40  ! 1924: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_0_144:
	setx	0x2f0303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde46036  ! 1929: SAVE_I	save	%r17, 0x0001, %r30
T0_asi_reg_rd_100:
	mov	0x22, %r14
	.word 0xf6db8400  ! 1931: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T0_asi_reg_wr_92:
	mov	0x9, %r14
	.word 0xfef38400  ! 1932: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_0_145:
	setx	0x2e0304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5c000  ! 1935: SAVE_R	save	%r23, %r0, %r29
T0_asi_reg_rd_101:
	mov	0x3c5, %r14
	.word 0xf8db8400  ! 1936: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb3e42198  ! 1937: SAVE_I	save	%r16, 0x0001, %r25
iob_intr_0_161:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_161), 16, 16)) -> intp(0, 0, 9)
iob_intr_0_162:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_162), 16, 16)) -> intp(0, 0, 38)
	.word 0xbbe5c000  ! 1943: SAVE_R	save	%r23, %r0, %r29
T0_asi_reg_rd_102:
	mov	0x3c1, %r14
	.word 0xfcdb8e80  ! 1950: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T0_asi_reg_rd_103:
	mov	0x32, %r14
	.word 0xf8db8e60  ! 1958: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_0_146:
	setx	0x2d013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe40000  ! 1961: SAVE_R	save	%r16, %r0, %r31
	.word 0xb815a03d  ! 1962: OR_I	or 	%r22, 0x003d, %r28
	.word 0xb2054000  ! 1963: ADD_R	add 	%r21, %r0, %r25
	.word 0xb9e40000  ! 1964: SAVE_R	save	%r16, %r0, %r28
	.word 0xbfe58000  ! 1969: SAVE_R	save	%r22, %r0, %r31
cpu_intr_0_147:
	setx	0x2d031f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_148:
	setx	0x2f030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6bd8000  ! 1974: XNORcc_R	xnorcc 	%r22, %r0, %r27
T0_asi_reg_wr_93:
	mov	0x3c8, %r14
	.word 0xf8f384a0  ! 1976: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb9e56110  ! 1980: SAVE_I	save	%r21, 0x0001, %r28
cpu_intr_0_149:
	setx	0x2d0104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e44000  ! 1984: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_rd_104:
	mov	0x22, %r14
	.word 0xf0db84a0  ! 1985: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbde46071  ! 1986: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb6154000  ! 1990: OR_R	or 	%r21, %r0, %r27
	.word 0xb3e58000  ! 1991: SAVE_R	save	%r22, %r0, %r25
	.word 0xb5e5c000  ! 1992: SAVE_R	save	%r23, %r0, %r26
	.word 0xbbe4219c  ! 1995: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb3e50000  ! 1997: SAVE_R	save	%r20, %r0, %r25
iob_intr_0_163:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_163), 16, 16)) -> intp(0, 0, 3b)
T0_asi_reg_rd_105:
	mov	0x2, %r14
	.word 0xfedb8e60  ! 2000: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_0_150:
	setx	0x2d0309, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_106:
	mov	0x2d, %r14
	.word 0xfadb8e60  ! 2004: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T0_asi_reg_wr_94:
	mov	0x3c5, %r14
	.word 0xf4f384a0  ! 2006: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T0_asi_reg_wr_95:
	mov	0x14, %r14
	.word 0xf2f38e60  ! 2008: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xbde44000  ! 2010: SAVE_R	save	%r17, %r0, %r30
	.word 0xb1e520e0  ! 2011: SAVE_I	save	%r20, 0x0001, %r24
T0_asi_reg_wr_96:
	mov	0x1b, %r14
	.word 0xf8f38e40  ! 2012: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_164:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_164), 16, 16)) -> intp(0, 0, 1)
	.word 0xbde48000  ! 2016: SAVE_R	save	%r18, %r0, %r30
	.word 0xb1e5e09b  ! 2017: SAVE_I	save	%r23, 0x0001, %r24
cpu_intr_0_151:
	setx	0x2d012b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_107:
	mov	0x0, %r14
	.word 0xf4db8e80  ! 2020: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_0_165:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_165), 16, 16)) -> intp(0, 0, 13)
	.word 0xb9e58000  ! 2027: SAVE_R	save	%r22, %r0, %r28
	.word 0xb3e5a0ce  ! 2029: SAVE_I	save	%r22, 0x0001, %r25
T0_asi_reg_rd_108:
	mov	0x3c7, %r14
	.word 0xfedb8400  ! 2035: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbde40000  ! 2036: SAVE_R	save	%r16, %r0, %r30
T0_asi_reg_wr_97:
	mov	0x28, %r14
	.word 0xf2f38e40  ! 2038: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbde5c000  ! 2040: SAVE_R	save	%r23, %r0, %r30
	.word 0xb9e5e05d  ! 2042: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbbe44000  ! 2045: SAVE_R	save	%r17, %r0, %r29
cpu_intr_0_152:
	setx	0x2d0034, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_166:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_166), 16, 16)) -> intp(0, 0, 24)
iob_intr_0_167:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_167), 16, 16)) -> intp(0, 0, b)
	.word 0xb5e4c000  ! 2050: SAVE_R	save	%r19, %r0, %r26
cpu_intr_0_153:
	setx	0x2e002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e40000  ! 2053: SAVE_R	save	%r16, %r0, %r25
iob_intr_0_168:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_168), 16, 16)) -> intp(0, 0, 3d)
cpu_intr_0_154:
	setx	0x2e031f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_109:
	mov	0x1e, %r14
	.word 0xfadb89e0  ! 2060: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xbde4a180  ! 2064: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb9e4e0f0  ! 2065: SAVE_I	save	%r19, 0x0001, %r28
iob_intr_0_169:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_169), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_170:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_170), 16, 16)) -> intp(0, 0, 26)
	.word 0xbfe4e198  ! 2069: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_171:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_171), 16, 16)) -> intp(0, 0, 31)
	.word 0xbbe44000  ! 2073: SAVE_R	save	%r17, %r0, %r29
	.word 0xb97c0400  ! 2075: MOVR_R	movre	%r16, %r0, %r28
	.word 0xbde54000  ! 2077: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_172:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_172), 16, 16)) -> intp(0, 0, 3f)
cpu_intr_0_155:
	setx	0x2d0216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e42090  ! 2085: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbde5c000  ! 2088: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_156:
	setx	0x2f0024, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_110:
	mov	0x3c5, %r14
	.word 0xf4db8400  ! 2092: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb7e521a2  ! 2099: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3e58000  ! 2101: SAVE_R	save	%r22, %r0, %r25
	.word 0xb9e5a0e1  ! 2102: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_wr_98:
	mov	0x3c3, %r14
	.word 0xf2f38e80  ! 2104: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbbe461a7  ! 2109: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe4611d  ! 2112: SAVE_I	save	%r17, 0x0001, %r31
iob_intr_0_173:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_173), 16, 16)) -> intp(0, 0, 3)
T0_asi_reg_rd_111:
	mov	0x1b, %r14
	.word 0xfcdb8e40  ! 2125: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_0_174:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_174), 16, 16)) -> intp(0, 0, 1b)
T0_asi_reg_rd_112:
	mov	0x30, %r14
	.word 0xfadb8e60  ! 2131: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_0_157:
	setx	0x2e012b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_113:
	mov	0x2f, %r14
	.word 0xfedb89e0  ! 2133: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb4358000  ! 2134: ORN_R	orn 	%r22, %r0, %r26
cpu_intr_0_158:
	setx	0x2e0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2bd2172  ! 2136: XNORcc_I	xnorcc 	%r20, 0x0172, %r25
	.word 0xbe25c000  ! 2139: SUB_R	sub 	%r23, %r0, %r31
	.word 0xb3e4a14d  ! 2142: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe54000  ! 2144: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_175:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_175), 16, 16)) -> intp(0, 0, 23)
cpu_intr_0_159:
	setx	0x2c0206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe48000  ! 2149: SAVE_R	save	%r18, %r0, %r31
	.word 0xbbe5c000  ! 2152: SAVE_R	save	%r23, %r0, %r29
	.word 0xbbe48000  ! 2155: SAVE_R	save	%r18, %r0, %r29
	.word 0xb9e48000  ! 2156: SAVE_R	save	%r18, %r0, %r28
	.word 0xb72d1000  ! 2157: SLLX_R	sllx	%r20, %r0, %r27
	.word 0xb7e5a074  ! 2161: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb5e5a181  ! 2166: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde58000  ! 2168: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_160:
	setx	0x2f0207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e40000  ! 2172: SAVE_R	save	%r16, %r0, %r27
cpu_intr_0_161:
	setx	0x2d0319, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_176:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_176), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_wr_99:
	mov	0x31, %r14
	.word 0xfef38e40  ! 2178: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_0_162:
	setx	0x2f0020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a1a2  ! 2181: SAVE_I	save	%r22, 0x0001, %r28
iob_intr_0_177:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_177), 16, 16)) -> intp(0, 0, 26)
iob_intr_0_178:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_178), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_rd_114:
	mov	0x2, %r14
	.word 0xf4db8e80  ! 2187: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb3358000  ! 2190: SRL_R	srl 	%r22, %r0, %r25
	.word 0xb1e5e1d6  ! 2191: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb33d1000  ! 2193: SRAX_R	srax	%r20, %r0, %r25
	.word 0xb5e54000  ! 2194: SAVE_R	save	%r21, %r0, %r26
iob_intr_0_179:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_179), 16, 16)) -> intp(0, 0, 39)
	.word 0xb1e4a0f1  ! 2199: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb9e40000  ! 2200: SAVE_R	save	%r16, %r0, %r28
iob_intr_0_180:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_180), 16, 16)) -> intp(0, 0, 2)
iob_intr_0_181:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_181), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_182:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_182), 16, 16)) -> intp(0, 0, 35)
cpu_intr_0_163:
	setx	0x2c010a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_183:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_183), 16, 16)) -> intp(0, 0, 13)
T0_asi_reg_wr_100:
	mov	0x11, %r14
	.word 0xfaf389e0  ! 2210: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_0_184:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_184), 16, 16)) -> intp(0, 0, 3e)
T0_asi_reg_wr_101:
	mov	0x3c8, %r14
	.word 0xf8f38400  ! 2214: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_0_185:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_185), 16, 16)) -> intp(0, 0, 6)
	.word 0xbfe58000  ! 2216: SAVE_R	save	%r22, %r0, %r31
T0_asi_reg_wr_102:
	mov	0x22, %r14
	.word 0xfcf38e60  ! 2217: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb635c000  ! 2220: ORN_R	orn 	%r23, %r0, %r27
	.word 0xb5e4a1ce  ! 2222: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb3e4c000  ! 2226: SAVE_R	save	%r19, %r0, %r25
	.word 0xbb2c1000  ! 2227: SLLX_R	sllx	%r16, %r0, %r29
	.word 0xba344000  ! 2229: ORN_R	orn 	%r17, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_115:
	mov	0x2d, %r14
	.word 0xf0db84a0  ! 2234: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb9e52103  ! 2235: SAVE_I	save	%r20, 0x0001, %r28
T0_asi_reg_rd_116:
	mov	0x3c7, %r14
	.word 0xf2db8e80  ! 2237: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb9e58000  ! 2243: SAVE_R	save	%r22, %r0, %r28
T0_asi_reg_rd_117:
	mov	0x31, %r14
	.word 0xf4db89e0  ! 2254: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T0_asi_reg_rd_118:
	mov	0x0, %r14
	.word 0xf2db8e80  ! 2258: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_0_186:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_186), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_wr_103:
	mov	0x2e, %r14
	.word 0xf6f38e60  ! 2263: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbde4c000  ! 2264: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_rd_119:
	mov	0x29, %r14
	.word 0xf8db8e80  ! 2266: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb1e5a08e  ! 2269: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_187:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_187), 16, 16)) -> intp(0, 0, 3e)
iob_intr_0_188:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_188), 16, 16)) -> intp(0, 0, 31)
	.word 0xbfe58000  ! 2280: SAVE_R	save	%r22, %r0, %r31
	.word 0xbde5c000  ! 2284: SAVE_R	save	%r23, %r0, %r30
	.word 0xb52d6001  ! 2285: SLL_I	sll 	%r21, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbcc40000  ! 2291: ADDCcc_R	addccc 	%r16, %r0, %r30
	.word 0xb9e50000  ! 2294: SAVE_R	save	%r20, %r0, %r28
	.word 0xbde40000  ! 2297: SAVE_R	save	%r16, %r0, %r30
	.word 0xbfe4c000  ! 2299: SAVE_R	save	%r19, %r0, %r31
	.word 0xbb3cf001  ! 2300: SRAX_I	srax	%r19, 0x0001, %r29
T0_asi_reg_wr_104:
	mov	0x3c0, %r14
	.word 0xf2f38e60  ! 2301: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T0_asi_reg_rd_120:
	mov	0x3c0, %r14
	.word 0xf4db84a0  ! 2302: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T0_asi_reg_rd_121:
	mov	0x30, %r14
	.word 0xf0db84a0  ! 2305: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb0bd8000  ! 2308: XNORcc_R	xnorcc 	%r22, %r0, %r24
	.word 0xbde44000  ! 2309: SAVE_R	save	%r17, %r0, %r30
	.word 0xbac44000  ! 2310: ADDCcc_R	addccc 	%r17, %r0, %r29
T0_asi_reg_wr_105:
	mov	0x3c4, %r14
	.word 0xf0f38e40  ! 2311: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_164:
	setx	0x330227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6c5e0ae  ! 2314: ADDCcc_I	addccc 	%r23, 0x00ae, %r27
iob_intr_0_189:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_189), 16, 16)) -> intp(0, 0, c)
	.word 0xba1da044  ! 2325: XOR_I	xor 	%r22, 0x0044, %r29
	.word 0xb9e54000  ! 2326: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_wr_106:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 2327: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbbe5e022  ! 2330: SAVE_I	save	%r23, 0x0001, %r29
iob_intr_0_190:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_190), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb7e48000  ! 2332: SAVE_R	save	%r18, %r0, %r27
	.word 0xb1e5e0d2  ! 2334: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_191:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_191), 16, 16)) -> intp(0, 0, 3f)
cpu_intr_0_165:
	setx	0x32001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4204e  ! 2341: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbbe461c5  ! 2342: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe5e14e  ! 2345: SAVE_I	save	%r23, 0x0001, %r31
iob_intr_0_192:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_192), 16, 16)) -> intp(0, 0, 0)
	.word 0xbeb50000  ! 2347: ORNcc_R	orncc 	%r20, %r0, %r31
	.word 0xbbe5c000  ! 2348: SAVE_R	save	%r23, %r0, %r29
	.word 0xbfe58000  ! 2349: SAVE_R	save	%r22, %r0, %r31
	.word 0xbc1521a5  ! 2351: OR_I	or 	%r20, 0x01a5, %r30
T0_asi_reg_rd_122:
	mov	0x3c5, %r14
	.word 0xf6db8e40  ! 2352: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_wr_107:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 2355: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_wr_108:
	mov	0x3c7, %r14
	.word 0xf6f38e40  ! 2356: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb1e5618b  ! 2361: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbde50000  ! 2362: SAVE_R	save	%r20, %r0, %r30
	.word 0xbbe54000  ! 2363: SAVE_R	save	%r21, %r0, %r29
cpu_intr_0_166:
	setx	0x31020a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_109:
	mov	0x3c6, %r14
	.word 0xfcf389e0  ! 2365: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_0_193:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_193), 16, 16)) -> intp(0, 0, d)
cpu_intr_0_167:
	setx	0x310135, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_110:
	mov	0x3c7, %r14
	.word 0xf4f38e60  ! 2378: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xbbe48000  ! 2379: SAVE_R	save	%r18, %r0, %r29
	.word 0xb5e5c000  ! 2380: SAVE_R	save	%r23, %r0, %r26
cpu_intr_0_168:
	setx	0x33000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e50000  ! 2383: SAVE_R	save	%r20, %r0, %r25
iob_intr_0_194:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_194), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_rd_123:
	mov	0x15, %r14
	.word 0xfadb8e60  ! 2389: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_0_169:
	setx	0x310138, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_170:
	setx	0x33012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e58000  ! 2395: SAVE_R	save	%r22, %r0, %r27
	.word 0xbde48000  ! 2396: SAVE_R	save	%r18, %r0, %r30
T0_asi_reg_wr_111:
	mov	0x1a, %r14
	.word 0xf2f38400  ! 2398: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb1e48000  ! 2399: SAVE_R	save	%r18, %r0, %r24
	.word 0xbbe4a00e  ! 2400: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb234211a  ! 2403: SUBC_I	orn 	%r16, 0x011a, %r25
T0_asi_reg_wr_112:
	mov	0x1e, %r14
	.word 0xfcf38e60  ! 2411: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T0_asi_reg_rd_124:
	mov	0x3c5, %r14
	.word 0xfcdb8e60  ! 2418: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_0_171:
	setx	0x320232, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_195:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_195), 16, 16)) -> intp(0, 0, c)
	.word 0xb5e44000  ! 2433: SAVE_R	save	%r17, %r0, %r26
	.word 0xb1e5c000  ! 2434: SAVE_R	save	%r23, %r0, %r24
	.word 0x8395e152  ! 2436: WRPR_TNPC_I	wrpr	%r23, 0x0152, %tnpc
	.word 0xbbe4c000  ! 2437: SAVE_R	save	%r19, %r0, %r29
T0_asi_reg_rd_125:
	mov	0x18, %r14
	.word 0xfedb8e60  ! 2439: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T0_asi_reg_rd_126:
	mov	0x3c0, %r14
	.word 0xf4db89e0  ! 2440: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbde58000  ! 2442: SAVE_R	save	%r22, %r0, %r30
T0_asi_reg_wr_113:
	mov	0x24, %r14
	.word 0xfef389e0  ! 2443: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb63d2182  ! 2445: XNOR_I	xnor 	%r20, 0x0182, %r27
	.word 0xb3e4c000  ! 2446: SAVE_R	save	%r19, %r0, %r25
	.word 0xb5e4a087  ! 2447: SAVE_I	save	%r18, 0x0001, %r26
iob_intr_0_196:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_196), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_172:
	setx	0x32012a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_173:
	setx	0x33022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde521b8  ! 2454: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbbe46047  ! 2459: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbbe5a0b2  ! 2462: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbbe4a144  ! 2463: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb3e420c6  ! 2465: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbbe4204b  ! 2466: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xba4421c5  ! 2467: ADDC_I	addc 	%r16, 0x01c5, %r29
cpu_intr_0_174:
	setx	0x330228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e50000  ! 2471: SAVE_R	save	%r20, %r0, %r28
iob_intr_0_197:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_197), 16, 16)) -> intp(0, 0, 26)
iob_intr_0_198:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_198), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_wr_114:
	mov	0x26, %r14
	.word 0xf6f384a0  ! 2477: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_0_175:
	setx	0x300117, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_199:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_199), 16, 16)) -> intp(0, 0, 3b)
cpu_intr_0_176:
	setx	0x310103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5c000  ! 2490: SAVE_R	save	%r23, %r0, %r31
	.word 0xbde48000  ! 2492: SAVE_R	save	%r18, %r0, %r30
T0_asi_reg_wr_115:
	mov	0x34, %r14
	.word 0xfcf38e60  ! 2494: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb9e44000  ! 2495: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_wr_116:
	mov	0x25, %r14
	.word 0xf6f384a0  ! 2499: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb3e5a03f  ! 2501: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb3e48000  ! 2502: SAVE_R	save	%r18, %r0, %r25
cpu_intr_0_177:
	setx	0x320322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe40000  ! 2505: SAVE_R	save	%r16, %r0, %r29
	.word 0xb9e42199  ! 2507: SAVE_I	save	%r16, 0x0001, %r28
cpu_intr_0_178:
	setx	0x300136, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_179:
	setx	0x300026, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_200:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_200), 16, 16)) -> intp(0, 0, 8)
	.word 0xbde5607a  ! 2519: SAVE_I	save	%r21, 0x0001, %r30
iob_intr_0_201:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_201), 16, 16)) -> intp(0, 0, 2c)
iob_intr_0_202:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_202), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb5e50000  ! 2523: SAVE_R	save	%r20, %r0, %r26
	.word 0xbfe4e047  ! 2526: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb895e154  ! 2529: ORcc_I	orcc 	%r23, 0x0154, %r28
iob_intr_0_203:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_203), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_wr_117:
	mov	0x4, %r14
	.word 0xf4f38e60  ! 2532: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_0_204:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_204), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbc258000  ! 2534: SUB_R	sub 	%r22, %r0, %r30
iob_intr_0_205:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_205), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb2ac4000  ! 2544: ANDNcc_R	andncc 	%r17, %r0, %r25
cpu_intr_0_180:
	setx	0x310021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e44000  ! 2549: SAVE_R	save	%r17, %r0, %r26
iob_intr_0_206:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_206), 16, 16)) -> intp(0, 0, 4)
iob_intr_0_207:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_207), 16, 16)) -> intp(0, 0, 22)
cpu_intr_0_181:
	setx	0x32030f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_208:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_208), 16, 16)) -> intp(0, 0, 28)
iob_intr_0_209:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_209), 16, 16)) -> intp(0, 0, 27)
T0_asi_reg_wr_118:
	mov	0x18, %r14
	.word 0xf4f38e60  ! 2562: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb6c58000  ! 2567: ADDCcc_R	addccc 	%r22, %r0, %r27
cpu_intr_0_182:
	setx	0x300003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba0c6117  ! 2574: AND_I	and 	%r17, 0x0117, %r29
	.word 0xbbe5a109  ! 2575: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3e48000  ! 2576: SAVE_R	save	%r18, %r0, %r25
cpu_intr_0_183:
	setx	0x32000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb151c000  ! 2578: RDPR_TL	<illegal instruction>
iob_intr_0_210:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_210), 16, 16)) -> intp(0, 0, 19)
iob_intr_0_211:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_211), 16, 16)) -> intp(0, 0, 22)
	.word 0xbfe5a155  ! 2583: SAVE_I	save	%r22, 0x0001, %r31
T0_asi_reg_rd_127:
	mov	0x3c1, %r14
	.word 0xfadb84a0  ! 2584: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_0_212:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_212), 16, 16)) -> intp(0, 0, 3)
	.word 0xbd518000  ! 2589: RDPR_PSTATE	<illegal instruction>
iob_intr_0_213:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_213), 16, 16)) -> intp(0, 0, c)
cpu_intr_0_184:
	setx	0x310235, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_214:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_214), 16, 16)) -> intp(0, 0, 0)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_215:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_215), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_rd_128:
	mov	0x8, %r14
	.word 0xfadb8400  ! 2603: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_0_216:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_216), 16, 16)) -> intp(0, 0, 28)
	.word 0xb73c3001  ! 2608: SRAX_I	srax	%r16, 0x0001, %r27
T0_asi_reg_rd_129:
	mov	0x3c3, %r14
	.word 0xfadb8400  ! 2611: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb9e5c000  ! 2612: SAVE_R	save	%r23, %r0, %r28
T0_asi_reg_rd_130:
	mov	0x3c5, %r14
	.word 0xfadb8e40  ! 2613: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0x8195609f  ! 2617: WRPR_TPC_I	wrpr	%r21, 0x009f, %tpc
iob_intr_0_217:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_217), 16, 16)) -> intp(0, 0, 10)
	.word 0xb7e42086  ! 2620: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb9e421af  ! 2621: SAVE_I	save	%r16, 0x0001, %r28
iob_intr_0_218:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_218), 16, 16)) -> intp(0, 0, 15)
T0_asi_reg_wr_119:
	mov	0x3c3, %r14
	.word 0xfcf38e80  ! 2626: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb1e40000  ! 2627: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_219:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_219), 16, 16)) -> intp(0, 0, 27)
iob_intr_0_220:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_220), 16, 16)) -> intp(0, 0, 29)
	.word 0xb3e560a8  ! 2633: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbc04a091  ! 2634: ADD_I	add 	%r18, 0x0091, %r30
	.word 0xbfe5608b  ! 2635: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbfe560e3  ! 2637: SAVE_I	save	%r21, 0x0001, %r31
iob_intr_0_221:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_221), 16, 16)) -> intp(0, 0, 2d)
iob_intr_0_222:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_222), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_rd_131:
	mov	0x25, %r14
	.word 0xfadb84a0  ! 2654: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb97c4400  ! 2655: MOVR_R	movre	%r17, %r0, %r28
	.word 0xb1e40000  ! 2656: SAVE_R	save	%r16, %r0, %r24
T0_asi_reg_rd_132:
	mov	0x3c4, %r14
	.word 0xf8db8e80  ! 2658: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T0_asi_reg_wr_120:
	mov	0x3c4, %r14
	.word 0xfcf384a0  ! 2659: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb5e52167  ! 2661: SAVE_I	save	%r20, 0x0001, %r26
iob_intr_0_223:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_223), 16, 16)) -> intp(0, 0, 2f)
cpu_intr_0_185:
	setx	0x330312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6844000  ! 2668: ADDcc_R	addcc 	%r17, %r0, %r27
	.word 0xb1e44000  ! 2670: SAVE_R	save	%r17, %r0, %r24
	.word 0xb3e4e063  ! 2671: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_224:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_224), 16, 16)) -> intp(0, 0, 34)
	.word 0xb7e421e0  ! 2674: SAVE_I	save	%r16, 0x0001, %r27
iob_intr_0_225:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_225), 16, 16)) -> intp(0, 0, 19)
	.word 0xb9e5c000  ! 2676: SAVE_R	save	%r23, %r0, %r28
T0_asi_reg_rd_133:
	mov	0x3c4, %r14
	.word 0xf6db8e80  ! 2677: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb5e4a1ea  ! 2678: SAVE_I	save	%r18, 0x0001, %r26
iob_intr_0_226:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_226), 16, 16)) -> intp(0, 0, 3c)
cpu_intr_0_186:
	setx	0x330123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a06f  ! 2683: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_wr_121:
	mov	0x9, %r14
	.word 0xfaf384a0  ! 2684: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb7e5a01e  ! 2685: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbbe521e0  ! 2687: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7e521dd  ! 2689: SAVE_I	save	%r20, 0x0001, %r27
iob_intr_0_227:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_227), 16, 16)) -> intp(0, 0, 1c)
iob_intr_0_228:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_228), 16, 16)) -> intp(0, 0, 26)
cpu_intr_0_187:
	setx	0x310338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe40000  ! 2698: SAVE_R	save	%r16, %r0, %r29
cpu_intr_0_188:
	setx	0x300029, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_229:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_229), 16, 16)) -> intp(0, 0, 5)
	.word 0xb9e40000  ! 2710: SAVE_R	save	%r16, %r0, %r28
	.word 0xbbe5c000  ! 2717: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_189:
	setx	0x31031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e48000  ! 2723: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_230:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_230), 16, 16)) -> intp(0, 0, 14)
iob_intr_0_231:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_231), 16, 16)) -> intp(0, 0, 2c)
T0_asi_reg_wr_122:
	mov	0x3c2, %r14
	.word 0xfef384a0  ! 2732: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_0_190:
	setx	0x34031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a121  ! 2736: SAVE_I	save	%r22, 0x0001, %r29
cpu_intr_0_191:
	setx	0x340028, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_232:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_232), 16, 16)) -> intp(0, 0, 8)
iob_intr_0_233:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_233), 16, 16)) -> intp(0, 0, d)
	.word 0xb3e4e0a5  ! 2742: SAVE_I	save	%r19, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3e50000  ! 2747: SAVE_R	save	%r20, %r0, %r25
	.word 0xbc0420f8  ! 2748: ADD_I	add 	%r16, 0x00f8, %r30
	.word 0xbaa50000  ! 2749: SUBcc_R	subcc 	%r20, %r0, %r29
	.word 0xb7e5e1e0  ! 2752: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb2350000  ! 2754: SUBC_R	orn 	%r20, %r0, %r25
T0_asi_reg_wr_123:
	mov	0x18, %r14
	.word 0xf8f38e40  ! 2755: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_wr_124:
	mov	0xc, %r14
	.word 0xfef38e80  ! 2757: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_0_234:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_234), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbbe50000  ! 2761: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_rd_134:
	mov	0x22, %r14
	.word 0xf0db89e0  ! 2765: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e52198  ! 2769: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbf540000  ! 2771: RDPR_GL	<illegal instruction>
	.word 0xb92d9000  ! 2775: SLLX_R	sllx	%r22, %r0, %r28
T0_asi_reg_rd_135:
	mov	0x3c4, %r14
	.word 0xf2db8e80  ! 2777: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb5e4618d  ! 2778: SAVE_I	save	%r17, 0x0001, %r26
iob_intr_0_235:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_235), 16, 16)) -> intp(0, 0, 8)
iob_intr_0_236:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_236), 16, 16)) -> intp(0, 0, d)
T0_asi_reg_rd_136:
	mov	0x38, %r14
	.word 0xfadb89e0  ! 2790: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T0_asi_reg_rd_137:
	mov	0x3c5, %r14
	.word 0xf6db84a0  ! 2791: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb97dc400  ! 2792: MOVR_R	movre	%r23, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_237:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_237), 16, 16)) -> intp(0, 0, 2b)
	.word 0xa1902000  ! 2797: WRPR_GL_I	wrpr	%r0, 0x0000, %-
T0_asi_reg_rd_138:
	mov	0x2e, %r14
	.word 0xf2db8e60  ! 2798: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T0_asi_reg_rd_139:
	mov	0x1e, %r14
	.word 0xfedb8e40  ! 2799: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_wr_125:
	mov	0x3c7, %r14
	.word 0xf4f38e60  ! 2800: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xbde4e0f9  ! 2802: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbfe58000  ! 2808: SAVE_R	save	%r22, %r0, %r31
	.word 0xb0354000  ! 2810: SUBC_R	orn 	%r21, %r0, %r24
T0_asi_reg_rd_140:
	mov	0x18, %r14
	.word 0xfcdb89e0  ! 2811: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb1e4607c  ! 2812: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_rd_141:
	mov	0x2, %r14
	.word 0xfcdb8e40  ! 2818: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_192:
	setx	0x370026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e58000  ! 2827: SAVE_R	save	%r22, %r0, %r28
cpu_intr_0_193:
	setx	0x360230, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_238:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_238), 16, 16)) -> intp(0, 0, 15)
cpu_intr_0_194:
	setx	0x34032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a001  ! 2834: SAVE_I	save	%r18, 0x0001, %r29
T0_asi_reg_wr_126:
	mov	0x32, %r14
	.word 0xf8f38e40  ! 2835: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_239:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_239), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbde5e18b  ! 2841: SAVE_I	save	%r23, 0x0001, %r30
iob_intr_0_240:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_240), 16, 16)) -> intp(0, 0, 5)
	.word 0xba950000  ! 2844: ORcc_R	orcc 	%r20, %r0, %r29
	.word 0xb3e5e045  ! 2848: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_wr_127:
	mov	0x9, %r14
	.word 0xfaf38e60  ! 2849: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T0_asi_reg_wr_128:
	mov	0x37, %r14
	.word 0xf2f38400  ! 2851: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T0_asi_reg_wr_129:
	mov	0x3c2, %r14
	.word 0xf8f38e60  ! 2852: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbfe44000  ! 2853: SAVE_R	save	%r17, %r0, %r31
	.word 0xbde48000  ! 2854: SAVE_R	save	%r18, %r0, %r30
	.word 0xb9518000  ! 2855: RDPR_PSTATE	<illegal instruction>
	.word 0xbfe50000  ! 2858: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_wr_130:
	mov	0x3c5, %r14
	.word 0xfef38e60  ! 2859: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb5e5a1fc  ! 2860: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb62c20b5  ! 2862: ANDN_I	andn 	%r16, 0x00b5, %r27
	.word 0x83942096  ! 2864: WRPR_TNPC_I	wrpr	%r16, 0x0096, %tnpc
T0_asi_reg_rd_142:
	mov	0x29, %r14
	.word 0xf8db8e40  ! 2865: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_rd_143:
	mov	0x3, %r14
	.word 0xf6db8e40  ! 2866: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbfe4e0b4  ! 2867: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb1e4a16a  ! 2869: SAVE_I	save	%r18, 0x0001, %r24
cpu_intr_0_195:
	setx	0x370034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde50000  ! 2875: SAVE_R	save	%r20, %r0, %r30
	.word 0xbbe4e124  ! 2877: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbbe5e119  ! 2883: SAVE_I	save	%r23, 0x0001, %r29
cpu_intr_0_196:
	setx	0x36021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3348000  ! 2889: SRL_R	srl 	%r18, %r0, %r25
iob_intr_0_241:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_241), 16, 16)) -> intp(0, 0, 10)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_197:
	setx	0x370339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e54000  ! 2897: SAVE_R	save	%r21, %r0, %r24
cpu_intr_0_198:
	setx	0x340101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5c000  ! 2904: SAVE_R	save	%r23, %r0, %r26
iob_intr_0_242:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_242), 16, 16)) -> intp(0, 0, 36)
	.word 0xb1e520ec  ! 2908: SAVE_I	save	%r20, 0x0001, %r24
cpu_intr_0_199:
	setx	0x35001b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_144:
	mov	0x3c4, %r14
	.word 0xf2db8e40  ! 2912: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbfe460ad  ! 2913: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbf2c2001  ! 2914: SLL_I	sll 	%r16, 0x0001, %r31
iob_intr_0_243:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_243), 16, 16)) -> intp(0, 0, 13)
	.word 0xba1d8000  ! 2917: XOR_R	xor 	%r22, %r0, %r29
	.word 0xb7e50000  ! 2918: SAVE_R	save	%r20, %r0, %r27
	.word 0xb3e5c000  ! 2920: SAVE_R	save	%r23, %r0, %r25
	.word 0xb1e48000  ! 2921: SAVE_R	save	%r18, %r0, %r24
iob_intr_0_244:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_244), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb5e5217c  ! 2923: SAVE_I	save	%r20, 0x0001, %r26
iob_intr_0_245:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_245), 16, 16)) -> intp(0, 0, 14)
	.word 0xbfe5c000  ! 2927: SAVE_R	save	%r23, %r0, %r31
	.word 0xb1e520f1  ! 2929: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbde421a3  ! 2930: SAVE_I	save	%r16, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e5e053  ! 2933: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_rd_145:
	mov	0x19, %r14
	.word 0xf2db84a0  ! 2935: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbfe48000  ! 2936: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_wr_131:
	mov	0x25, %r14
	.word 0xf8f384a0  ! 2937: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_0_246:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_246), 16, 16)) -> intp(0, 0, 7)
iob_intr_0_247:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_247), 16, 16)) -> intp(0, 0, 3d)
iob_intr_0_248:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_248), 16, 16)) -> intp(0, 0, 9)
	.word 0x8794a125  ! 2945: WRPR_TT_I	wrpr	%r18, 0x0125, %tt
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde5e0e1  ! 2951: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb7e5a12e  ! 2952: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb0b5603a  ! 2954: SUBCcc_I	orncc 	%r21, 0x003a, %r24
	.word 0xba14c000  ! 2955: OR_R	or 	%r19, %r0, %r29
iob_intr_0_249:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_249), 16, 16)) -> intp(0, 0, 17)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e4a1b4  ! 2964: SAVE_I	save	%r18, 0x0001, %r24
cpu_intr_0_200:
	setx	0x340015, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_250:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_250), 16, 16)) -> intp(0, 0, 12)
cpu_intr_0_201:
	setx	0x360105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e46194  ! 2974: SAVE_I	save	%r17, 0x0001, %r28
cpu_intr_0_202:
	setx	0x37011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4c000  ! 2977: SAVE_R	save	%r19, %r0, %r24
	.word 0xb335a001  ! 2978: SRL_I	srl 	%r22, 0x0001, %r25
cpu_intr_0_203:
	setx	0x35033e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_146:
	mov	0x20, %r14
	.word 0xf6db8e40  ! 2980: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb9e44000  ! 2981: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_251:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_251), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_wr_132:
	mov	0x3c7, %r14
	.word 0xf4f38e80  ! 2986: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbac48000  ! 2992: ADDCcc_R	addccc 	%r18, %r0, %r29
	.word 0xbbe48000  ! 2994: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_wr_133:
	mov	0x24, %r14
	.word 0xf6f384a0  ! 2995: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_0_204:
	setx	0x36011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe40000  ! 2998: SAVE_R	save	%r16, %r0, %r31
iob_intr_0_252:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_252), 16, 16)) -> intp(0, 0, 1b)
T0_asi_reg_rd_147:
	mov	0x19, %r14
	.word 0xf0db84a0  ! 3001: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbde5e1e1  ! 3002: SAVE_I	save	%r23, 0x0001, %r30
cpu_intr_0_205:
	setx	0x35033a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_206:
	setx	0x370216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 3008: SAVE_R	save	%r22, %r0, %r26
iob_intr_0_253:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_253), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_wr_134:
	mov	0x11, %r14
	.word 0xfcf384a0  ! 3011: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb7e48000  ! 3012: SAVE_R	save	%r18, %r0, %r27
	.word 0xb7e4c000  ! 3014: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_wr_135:
	mov	0x3c5, %r14
	.word 0xfef389e0  ! 3016: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb7e58000  ! 3022: SAVE_R	save	%r22, %r0, %r27
	.word 0xb5e42149  ! 3027: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb42c61d7  ! 3028: ANDN_I	andn 	%r17, 0x01d7, %r26
	.word 0xbfe521e6  ! 3029: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_254:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_254), 16, 16)) -> intp(0, 0, 17)
	.word 0xb3e54000  ! 3032: SAVE_R	save	%r21, %r0, %r25
	.word 0xb3e58000  ! 3033: SAVE_R	save	%r22, %r0, %r25
iob_intr_0_255:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_255), 16, 16)) -> intp(0, 0, 6)
	.word 0xb3e50000  ! 3037: SAVE_R	save	%r20, %r0, %r25
	.word 0xb7e420e6  ! 3038: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb2044000  ! 3043: ADD_R	add 	%r17, %r0, %r25
	.word 0xbfe48000  ! 3045: SAVE_R	save	%r18, %r0, %r31
	.word 0xb41ce117  ! 3050: XOR_I	xor 	%r19, 0x0117, %r26
cpu_intr_0_207:
	setx	0x370224, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_256:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_256), 16, 16)) -> intp(0, 0, 20)
	.word 0xb9e5c000  ! 3057: SAVE_R	save	%r23, %r0, %r28
	.word 0xbde560a3  ! 3058: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb3e52148  ! 3060: SAVE_I	save	%r20, 0x0001, %r25
iob_intr_0_257:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_257), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_rd_148:
	mov	0x3c0, %r14
	.word 0xfcdb8e80  ! 3066: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb0a4c000  ! 3067: SUBcc_R	subcc 	%r19, %r0, %r24
T0_asi_reg_wr_136:
	mov	0x3c1, %r14
	.word 0xf4f38e40  ! 3068: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_rd_149:
	mov	0x2d, %r14
	.word 0xfadb8e40  ! 3071: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_rd_150:
	mov	0x3c6, %r14
	.word 0xf2db84a0  ! 3073: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_0_208:
	setx	0x370219, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_137:
	mov	0x3c5, %r14
	.word 0xfcf384a0  ! 3075: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbe3c218f  ! 3077: XNOR_I	xnor 	%r16, 0x018f, %r31
	.word 0xb3e48000  ! 3080: SAVE_R	save	%r18, %r0, %r25
iob_intr_0_258:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_258), 16, 16)) -> intp(0, 0, a)
	.word 0xb61461ff  ! 3083: OR_I	or 	%r17, 0x01ff, %r27
	.word 0xbde58000  ! 3084: SAVE_R	save	%r22, %r0, %r30
T0_asi_reg_wr_138:
	mov	0x3c6, %r14
	.word 0xfaf38400  ! 3085: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_0_259:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_259), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_209:
	setx	0x360112, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_210:
	setx	0x34022f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_260:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_260), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_wr_139:
	mov	0x2a, %r14
	.word 0xf6f38e40  ! 3099: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_wr_140:
	mov	0x31, %r14
	.word 0xf4f38e40  ! 3102: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_0_261:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_261), 16, 16)) -> intp(0, 0, 19)
	.word 0xb1e5a1da  ! 3112: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_wr_141:
	mov	0x30, %r14
	.word 0xf4f38e80  ! 3117: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_0_211:
	setx	0x360033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5c000  ! 3119: SAVE_R	save	%r23, %r0, %r31
	.word 0xbbe4a190  ! 3120: SAVE_I	save	%r18, 0x0001, %r29
cpu_intr_0_212:
	setx	0x370306, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_142:
	mov	0x15, %r14
	.word 0xf4f38e60  ! 3130: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T0_asi_reg_wr_143:
	mov	0x2b, %r14
	.word 0xfef384a0  ! 3131: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T0_asi_reg_wr_144:
	mov	0x3c0, %r14
	.word 0xfcf389e0  ! 3132: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T0_asi_reg_wr_145:
	mov	0x37, %r14
	.word 0xf6f384a0  ! 3138: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T0_asi_reg_wr_146:
	mov	0x33, %r14
	.word 0xfcf38400  ! 3144: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T0_asi_reg_rd_151:
	mov	0x7, %r14
	.word 0xf0db89e0  ! 3147: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbde40000  ! 3150: SAVE_R	save	%r16, %r0, %r30
T0_asi_reg_rd_152:
	mov	0x3c6, %r14
	.word 0xf8db8e80  ! 3152: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_0_262:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_262), 16, 16)) -> intp(0, 0, 15)
	.word 0xbf7dc400  ! 3157: MOVR_R	movre	%r23, %r0, %r31
	.word 0xb4b58000  ! 3158: SUBCcc_R	orncc 	%r22, %r0, %r26
iob_intr_0_263:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_263), 16, 16)) -> intp(0, 0, 27)
T0_asi_reg_wr_147:
	mov	0x16, %r14
	.word 0xfcf384a0  ! 3162: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T0_asi_reg_wr_148:
	mov	0x3c5, %r14
	.word 0xf6f389e0  ! 3166: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb1e4e07e  ! 3168: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbfe48000  ! 3171: SAVE_R	save	%r18, %r0, %r31
	.word 0xb5e40000  ! 3172: SAVE_R	save	%r16, %r0, %r26
	.word 0xb5e4a024  ! 3173: SAVE_I	save	%r18, 0x0001, %r26
T0_asi_reg_wr_149:
	mov	0x1c, %r14
	.word 0xfaf389e0  ! 3176: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_0_213:
	setx	0x360237, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_264:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_264), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb1e420c2  ! 3183: SAVE_I	save	%r16, 0x0001, %r24
iob_intr_0_265:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_265), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbbe40000  ! 3185: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_rd_153:
	mov	0x3c2, %r14
	.word 0xfcdb8e80  ! 3187: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T0_asi_reg_wr_150:
	mov	0x3c1, %r14
	.word 0xf4f384a0  ! 3189: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_0_266:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_266), 16, 16)) -> intp(0, 0, 28)
cpu_intr_0_214:
	setx	0x390220, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_267:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_267), 16, 16)) -> intp(0, 0, 39)
cpu_intr_0_215:
	setx	0x38030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8394a0ac  ! 3199: WRPR_TNPC_I	wrpr	%r18, 0x00ac, %tnpc
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_268:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_268), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb1e50000  ! 3211: SAVE_R	save	%r20, %r0, %r24
cpu_intr_0_216:
	setx	0x3a0215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a1ed  ! 3213: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb8ac8000  ! 3214: ANDNcc_R	andncc 	%r18, %r0, %r28
T0_asi_reg_wr_151:
	mov	0x3c1, %r14
	.word 0xf4f38e40  ! 3216: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb3e48000  ! 3217: SAVE_R	save	%r18, %r0, %r25
cpu_intr_0_217:
	setx	0x380336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e50000  ! 3222: SAVE_R	save	%r20, %r0, %r26
	.word 0xb3e5a108  ! 3223: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb9e44000  ! 3224: SAVE_R	save	%r17, %r0, %r28
	.word 0x9195e0c0  ! 3225: WRPR_PIL_I	wrpr	%r23, 0x00c0, %pil
	.word 0xbfe4a139  ! 3226: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb6b48000  ! 3228: ORNcc_R	orncc 	%r18, %r0, %r27
T0_asi_reg_wr_152:
	mov	0xe, %r14
	.word 0xf0f38e80  ! 3229: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T0_asi_reg_wr_153:
	mov	0x3c0, %r14
	.word 0xfef38e80  ! 3234: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_154:
	mov	0x3c1, %r14
	.word 0xfef384a0  ! 3239: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0x8195a1ff  ! 3240: WRPR_TPC_I	wrpr	%r22, 0x01ff, %tpc
	.word 0xb3e44000  ! 3241: SAVE_R	save	%r17, %r0, %r25
T0_asi_reg_wr_155:
	mov	0x2c, %r14
	.word 0xf4f384a0  ! 3243: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb1e50000  ! 3244: SAVE_R	save	%r20, %r0, %r24
	.word 0xbe8d21d1  ! 3246: ANDcc_I	andcc 	%r20, 0x01d1, %r31
	.word 0xb7e5a1a1  ! 3247: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbde5c000  ! 3249: SAVE_R	save	%r23, %r0, %r30
	.word 0xb1641800  ! 3251: MOVcc_R	<illegal instruction>
	.word 0xb7e4e1e1  ! 3252: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb1e5a1eb  ! 3254: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e48000  ! 3256: SAVE_R	save	%r18, %r0, %r26
T0_asi_reg_wr_156:
	mov	0x4, %r14
	.word 0xf8f38400  ! 3259: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbf354000  ! 3261: SRL_R	srl 	%r21, %r0, %r31
T0_asi_reg_wr_157:
	mov	0x3c4, %r14
	.word 0xf4f38e40  ! 3262: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_wr_158:
	mov	0x2e, %r14
	.word 0xf0f38400  ! 3264: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbcac20b0  ! 3266: ANDNcc_I	andncc 	%r16, 0x00b0, %r30
iob_intr_0_269:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_269), 16, 16)) -> intp(0, 0, 5)
cpu_intr_0_218:
	setx	0x38020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e44000  ! 3270: SAVE_R	save	%r17, %r0, %r24
	.word 0xbbe4602f  ! 3271: SAVE_I	save	%r17, 0x0001, %r29
T0_asi_reg_rd_154:
	mov	0x14, %r14
	.word 0xf4db8400  ! 3277: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_0_270:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_270), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_271:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_271), 16, 16)) -> intp(0, 0, 35)
	.word 0xb7e48000  ! 3284: SAVE_R	save	%r18, %r0, %r27
cpu_intr_0_219:
	setx	0x3b0120, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_272:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_272), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb53d3001  ! 3289: SRAX_I	srax	%r20, 0x0001, %r26
T0_asi_reg_wr_159:
	mov	0x1e, %r14
	.word 0xfcf389e0  ! 3295: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb7e5c000  ! 3298: SAVE_R	save	%r23, %r0, %r27
iob_intr_0_273:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_273), 16, 16)) -> intp(0, 0, 9)
	.word 0xb1e50000  ! 3301: SAVE_R	save	%r20, %r0, %r24
T0_asi_reg_rd_155:
	mov	0x38, %r14
	.word 0xfadb8e60  ! 3304: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_0_274:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_274), 16, 16)) -> intp(0, 0, 25)
	.word 0xb9e421db  ! 3313: SAVE_I	save	%r16, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9e4c000  ! 3318: SAVE_R	save	%r19, %r0, %r28
iob_intr_0_275:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_275), 16, 16)) -> intp(0, 0, 9)
	.word 0xb5e58000  ! 3323: SAVE_R	save	%r22, %r0, %r26
iob_intr_0_276:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_276), 16, 16)) -> intp(0, 0, 13)
T0_asi_reg_wr_160:
	mov	0x32, %r14
	.word 0xfaf38e60  ! 3325: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb4354000  ! 3326: SUBC_R	orn 	%r21, %r0, %r26
iob_intr_0_277:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_277), 16, 16)) -> intp(0, 0, 25)
	.word 0xb1e5212f  ! 3328: SAVE_I	save	%r20, 0x0001, %r24
cpu_intr_0_220:
	setx	0x3b0039, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_221:
	setx	0x380030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb51c000  ! 3334: RDPR_TL	<illegal instruction>
T0_asi_reg_rd_156:
	mov	0x3c2, %r14
	.word 0xf8db8e60  ! 3338: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T0_asi_reg_wr_161:
	mov	0x11, %r14
	.word 0xf6f384a0  ! 3340: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_0_278:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_278), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_rd_157:
	mov	0x38, %r14
	.word 0xf6db8e60  ! 3342: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T0_asi_reg_wr_162:
	mov	0x13, %r14
	.word 0xfcf38e40  ! 3345: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_222:
	setx	0x3a0211, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_223:
	setx	0x38033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4c000  ! 3352: SAVE_R	save	%r19, %r0, %r24
	.word 0xb3e4215a  ! 3354: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbbe48000  ! 3355: SAVE_R	save	%r18, %r0, %r29
	.word 0xbde50000  ! 3358: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_rd_158:
	mov	0x1e, %r14
	.word 0xfcdb8e40  ! 3359: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_224:
	setx	0x39013d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_225:
	setx	0x3b010a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_163:
	mov	0x13, %r14
	.word 0xf8f38400  ! 3369: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbfe50000  ! 3371: SAVE_R	save	%r20, %r0, %r31
	.word 0xbfe52129  ! 3372: SAVE_I	save	%r20, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_279:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_279), 16, 16)) -> intp(0, 0, 6)
	.word 0xb3e4a134  ! 3377: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbbe4c000  ! 3378: SAVE_R	save	%r19, %r0, %r29
	.word 0xbfe4a0ed  ! 3380: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_wr_164:
	mov	0x2d, %r14
	.word 0xf8f38e40  ! 3383: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_rd_159:
	mov	0xa, %r14
	.word 0xfadb8e80  ! 3384: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_0_280:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_280), 16, 16)) -> intp(0, 0, 2e)
cpu_intr_0_226:
	setx	0x3b0020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba9de184  ! 3389: XORcc_I	xorcc 	%r23, 0x0184, %r29
	.word 0xb0b50000  ! 3391: ORNcc_R	orncc 	%r20, %r0, %r24
	.word 0xb5e560a6  ! 3392: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe4212e  ! 3394: SAVE_I	save	%r16, 0x0001, %r31
cpu_intr_0_227:
	setx	0x3b0230, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_160:
	mov	0x37, %r14
	.word 0xf2db8e60  ! 3402: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_0_281:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_281), 16, 16)) -> intp(0, 0, d)
	.word 0x8194a08b  ! 3404: WRPR_TPC_I	wrpr	%r18, 0x008b, %tpc
T0_asi_reg_wr_165:
	mov	0x17, %r14
	.word 0xf2f384a0  ! 3406: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_0_228:
	setx	0x39031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_282:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_282), 16, 16)) -> intp(0, 0, 20)
	.word 0xb5e4e120  ! 3417: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e50000  ! 3418: SAVE_R	save	%r20, %r0, %r27
iob_intr_0_283:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_283), 16, 16)) -> intp(0, 0, 8)
	.word 0xb7e5a161  ! 3421: SAVE_I	save	%r22, 0x0001, %r27
T0_asi_reg_rd_161:
	mov	0x18, %r14
	.word 0xf4db8e80  ! 3424: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_0_229:
	setx	0x3b010e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_284:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_284), 16, 16)) -> intp(0, 0, 28)
	.word 0xbfe420a9  ! 3435: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbfe5e11a  ! 3436: SAVE_I	save	%r23, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe50000  ! 3445: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_230:
	setx	0x39030f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_162:
	mov	0x5, %r14
	.word 0xf2db8e40  ! 3448: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb7e54000  ! 3449: SAVE_R	save	%r21, %r0, %r27
	.word 0xb9e5a01b  ! 3454: SAVE_I	save	%r22, 0x0001, %r28
iob_intr_0_285:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_285), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_rd_163:
	mov	0x34, %r14
	.word 0xf6db8e80  ! 3460: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_0_231:
	setx	0x3b0320, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_166:
	mov	0xa, %r14
	.word 0xfaf38e60  ! 3463: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_0_286:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_286), 16, 16)) -> intp(0, 0, 10)
iob_intr_0_287:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_287), 16, 16)) -> intp(0, 0, 39)
	.word 0xb9e5618c  ! 3468: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbbe4a023  ! 3469: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb5e560c3  ! 3471: SAVE_I	save	%r21, 0x0001, %r26
iob_intr_0_288:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_288), 16, 16)) -> intp(0, 0, 30)
	.word 0xbbe44000  ! 3476: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_rd_164:
	mov	0x9, %r14
	.word 0xf2db8e80  ! 3478: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_0_232:
	setx	0x380005, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_167:
	mov	0x1e, %r14
	.word 0xf0f389e0  ! 3480: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb5e54000  ! 3481: SAVE_R	save	%r21, %r0, %r26
iob_intr_0_289:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_289), 16, 16)) -> intp(0, 0, 11)
iob_intr_0_290:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_290), 16, 16)) -> intp(0, 0, 0)
cpu_intr_0_233:
	setx	0x38022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6a5c000  ! 3498: SUBcc_R	subcc 	%r23, %r0, %r27
	.word 0x8f902002  ! 3499: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xbd2c9000  ! 3500: SLLX_R	sllx	%r18, %r0, %r30
iob_intr_0_291:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_291), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbbe42193  ! 3505: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb015a021  ! 3506: OR_I	or 	%r22, 0x0021, %r24
	.word 0xbf34e001  ! 3508: SRL_I	srl 	%r19, 0x0001, %r31
	.word 0xb015c000  ! 3509: OR_R	or 	%r23, %r0, %r24
	.word 0xb734e001  ! 3512: SRL_I	srl 	%r19, 0x0001, %r27
T0_asi_reg_rd_165:
	mov	0x21, %r14
	.word 0xfedb8400  ! 3517: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_0_234:
	setx	0x38000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5c000  ! 3520: SAVE_R	save	%r23, %r0, %r30
	.word 0xb1e4a03f  ! 3521: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1e5a1d0  ! 3527: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb425c000  ! 3528: SUB_R	sub 	%r23, %r0, %r26
	.word 0xb9e5a11b  ! 3531: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb5e42063  ! 3533: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_292:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_292), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_wr_168:
	mov	0x12, %r14
	.word 0xf0f38e80  ! 3539: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb9643801  ! 3540: MOVcc_I	<illegal instruction>
	.word 0xb035a02b  ! 3544: SUBC_I	orn 	%r22, 0x002b, %r24
T0_asi_reg_wr_169:
	mov	0xb, %r14
	.word 0xf0f38400  ! 3546: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_0_293:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_293), 16, 16)) -> intp(0, 0, 33)
cpu_intr_0_235:
	setx	0x3a0216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 3551: SAVE_R	save	%r21, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e5203d  ! 3554: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb9e4a1b0  ! 3555: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_rd_166:
	mov	0x3c4, %r14
	.word 0xf8db8400  ! 3557: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbde48000  ! 3558: SAVE_R	save	%r18, %r0, %r30
	.word 0xb9e48000  ! 3565: SAVE_R	save	%r18, %r0, %r28
T0_asi_reg_wr_170:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 3567: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_236:
	setx	0x3a001a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_237:
	setx	0x3a020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1350000  ! 3571: SRL_R	srl 	%r20, %r0, %r24
iob_intr_0_294:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_294), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb7e5e1c2  ! 3574: SAVE_I	save	%r23, 0x0001, %r27
cpu_intr_0_238:
	setx	0x3b020c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_295:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_295), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbde4e1f2  ! 3578: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_rd_167:
	mov	0x3c3, %r14
	.word 0xfedb8e40  ! 3579: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbbe4e166  ! 3580: SAVE_I	save	%r19, 0x0001, %r29
iob_intr_0_296:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_296), 16, 16)) -> intp(0, 0, 2)
	.word 0xbde5213e  ! 3587: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb9e54000  ! 3588: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_wr_171:
	mov	0x3c5, %r14
	.word 0xfcf38e40  ! 3589: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_wr_172:
	mov	0x7, %r14
	.word 0xf6f384a0  ! 3592: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb3e44000  ! 3593: SAVE_R	save	%r17, %r0, %r25
	.word 0xb3e48000  ! 3594: SAVE_R	save	%r18, %r0, %r25
	.word 0xb7e54000  ! 3595: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_rd_168:
	mov	0x30, %r14
	.word 0xf2db8e40  ! 3598: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_297:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_297), 16, 16)) -> intp(0, 0, 27)
	.word 0xb5e52013  ! 3602: SAVE_I	save	%r20, 0x0001, %r26
T0_asi_reg_wr_173:
	mov	0x27, %r14
	.word 0xf4f38e40  ! 3606: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb7e4c000  ! 3607: SAVE_R	save	%r19, %r0, %r27
	.word 0xb3e42190  ! 3608: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbbe5c000  ! 3610: SAVE_R	save	%r23, %r0, %r29
	.word 0xb6040000  ! 3616: ADD_R	add 	%r16, %r0, %r27
	.word 0xb9e5c000  ! 3618: SAVE_R	save	%r23, %r0, %r28
	.word 0xb3e4a090  ! 3619: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7e4c000  ! 3622: SAVE_R	save	%r19, %r0, %r27
cpu_intr_0_239:
	setx	0x39021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e50000  ! 3636: SAVE_R	save	%r20, %r0, %r28
T0_asi_reg_wr_174:
	mov	0x35, %r14
	.word 0xf6f38e60  ! 3637: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T0_asi_reg_wr_175:
	mov	0x2f, %r14
	.word 0xf2f384a0  ! 3639: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbde4e1aa  ! 3640: SAVE_I	save	%r19, 0x0001, %r30
iob_intr_0_298:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_298), 16, 16)) -> intp(0, 0, 15)
	.word 0xb9e4c000  ! 3643: SAVE_R	save	%r19, %r0, %r28
	.word 0xb1e4c000  ! 3644: SAVE_R	save	%r19, %r0, %r24
	.word 0xb5e50000  ! 3645: SAVE_R	save	%r20, %r0, %r26
iob_intr_0_299:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_299), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_wr_176:
	mov	0x37, %r14
	.word 0xf8f38e80  ! 3648: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xbb643801  ! 3649: MOVcc_I	<illegal instruction>
	.word 0xb7e4618a  ! 3650: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1e5a02b  ! 3653: SAVE_I	save	%r22, 0x0001, %r24
cpu_intr_0_240:
	setx	0x3c0216, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_241:
	setx	0x3d0205, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_300:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_300), 16, 16)) -> intp(0, 0, 34)
	.word 0xb3e421d0  ! 3660: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_wr_177:
	mov	0x3c4, %r14
	.word 0xf2f389e0  ! 3662: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbc3d4000  ! 3663: XNOR_R	xnor 	%r21, %r0, %r30
	.word 0xb1e48000  ! 3665: SAVE_R	save	%r18, %r0, %r24
cpu_intr_0_242:
	setx	0x3e0024, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_178:
	mov	0x3, %r14
	.word 0xf2f38400  ! 3669: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_0_301:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_301), 16, 16)) -> intp(0, 0, 23)
	.word 0xbbe52127  ! 3673: SAVE_I	save	%r20, 0x0001, %r29
iob_intr_0_302:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_302), 16, 16)) -> intp(0, 0, 25)
	.word 0xb9e40000  ! 3680: SAVE_R	save	%r16, %r0, %r28
	.word 0xb7e40000  ! 3681: SAVE_R	save	%r16, %r0, %r27
	.word 0xbfe4a1a6  ! 3684: SAVE_I	save	%r18, 0x0001, %r31
iob_intr_0_303:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_303), 16, 16)) -> intp(0, 0, 36)
T0_asi_reg_rd_169:
	mov	0x24, %r14
	.word 0xfedb8e60  ! 3695: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_0_243:
	setx	0x3c010e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_170:
	mov	0x21, %r14
	.word 0xf2db8e80  ! 3698: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbbe46122  ! 3700: SAVE_I	save	%r17, 0x0001, %r29
T0_asi_reg_rd_171:
	mov	0x1e, %r14
	.word 0xf6db89e0  ! 3702: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T0_asi_reg_wr_179:
	mov	0x3c5, %r14
	.word 0xf8f38e40  ! 3703: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb3e5a163  ! 3705: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbbe54000  ! 3706: SAVE_R	save	%r21, %r0, %r29
cpu_intr_0_244:
	setx	0x3c0110, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_245:
	setx	0x3c033b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_172:
	mov	0x20, %r14
	.word 0xfadb89e0  ! 3711: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb7e4e067  ! 3712: SAVE_I	save	%r19, 0x0001, %r27
iob_intr_0_304:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_304), 16, 16)) -> intp(0, 0, 12)
cpu_intr_0_246:
	setx	0x3f0104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5c000  ! 3722: SAVE_R	save	%r23, %r0, %r25
iob_intr_0_305:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_305), 16, 16)) -> intp(0, 0, e)
iob_intr_0_306:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_306), 16, 16)) -> intp(0, 0, 3b)
cpu_intr_0_247:
	setx	0x3e011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe50000  ! 3736: SAVE_R	save	%r20, %r0, %r29
	.word 0xbfe5c000  ! 3737: SAVE_R	save	%r23, %r0, %r31
	.word 0xb5e5e15b  ! 3740: SAVE_I	save	%r23, 0x0001, %r26
cpu_intr_0_248:
	setx	0x3f013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3e40000  ! 3748: SAVE_R	save	%r16, %r0, %r25
cpu_intr_0_249:
	setx	0x3e003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba2ce080  ! 3751: ANDN_I	andn 	%r19, 0x0080, %r29
iob_intr_0_307:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_307), 16, 16)) -> intp(0, 0, 1)
	.word 0xbfe54000  ! 3760: SAVE_R	save	%r21, %r0, %r31
	.word 0xb57d4400  ! 3763: MOVR_R	movre	%r21, %r0, %r26
	.word 0xb9e40000  ! 3764: SAVE_R	save	%r16, %r0, %r28
	.word 0xb7e50000  ! 3767: SAVE_R	save	%r20, %r0, %r27
	.word 0xb5e48000  ! 3770: SAVE_R	save	%r18, %r0, %r26
	.word 0xbde461c0  ! 3771: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb9e52094  ! 3774: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb9e48000  ! 3775: SAVE_R	save	%r18, %r0, %r28
	.word 0xb7e42118  ! 3778: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb9e40000  ! 3782: SAVE_R	save	%r16, %r0, %r28
T0_asi_reg_wr_180:
	mov	0x3c5, %r14
	.word 0xf8f38400  ! 3783: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbde54000  ! 3784: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_308:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_308), 16, 16)) -> intp(0, 0, 36)
	.word 0xbbe56090  ! 3787: SAVE_I	save	%r21, 0x0001, %r29
T0_asi_reg_rd_173:
	mov	0x19, %r14
	.word 0xfcdb8400  ! 3788: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_0_309:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_309), 16, 16)) -> intp(0, 0, 31)
cpu_intr_0_250:
	setx	0x3f003a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_251:
	setx	0x3d0128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5612d  ! 3794: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb0348000  ! 3796: SUBC_R	orn 	%r18, %r0, %r24
T0_asi_reg_rd_174:
	mov	0x26, %r14
	.word 0xf8db8e40  ! 3799: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb1e4a1ea  ! 3800: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb69d4000  ! 3802: XORcc_R	xorcc 	%r21, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_181:
	mov	0x20, %r14
	.word 0xfaf38e40  ! 3810: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_0_252:
	setx	0x3c0217, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_310:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_310), 16, 16)) -> intp(0, 0, a)
	.word 0xb7e42163  ! 3821: SAVE_I	save	%r16, 0x0001, %r27
T0_asi_reg_wr_182:
	mov	0x13, %r14
	.word 0xf6f38e40  ! 3822: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbde4e0bf  ! 3825: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb7e5202f  ! 3829: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbfe58000  ! 3831: SAVE_R	save	%r22, %r0, %r31
	.word 0xb3e4a147  ! 3834: SAVE_I	save	%r18, 0x0001, %r25
cpu_intr_0_253:
	setx	0x3e0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e50000  ! 3838: SAVE_R	save	%r20, %r0, %r24
	.word 0xb5e4a022  ! 3842: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb9e4e0b0  ! 3843: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_wr_183:
	mov	0x30, %r14
	.word 0xfef38400  ! 3844: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_0_254:
	setx	0x3c0122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcb5c000  ! 3847: SUBCcc_R	orncc 	%r23, %r0, %r30
	.word 0xb5e40000  ! 3848: SAVE_R	save	%r16, %r0, %r26
	.word 0xb20ce148  ! 3849: AND_I	and 	%r19, 0x0148, %r25
	.word 0xb5e42179  ! 3853: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbbe520ce  ! 3854: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_rd_175:
	mov	0x9, %r14
	.word 0xf4db84a0  ! 3859: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_0_311:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_311), 16, 16)) -> intp(0, 0, 1)
	.word 0xbc848000  ! 3861: ADDcc_R	addcc 	%r18, %r0, %r30
	.word 0xbbe40000  ! 3864: SAVE_R	save	%r16, %r0, %r29
	.word 0xbf51c000  ! 3870: RDPR_TL	<illegal instruction>
	.word 0xb5e5c000  ! 3871: SAVE_R	save	%r23, %r0, %r26
	.word 0xb4ac0000  ! 3874: ANDNcc_R	andncc 	%r16, %r0, %r26
iob_intr_0_312:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_312), 16, 16)) -> intp(0, 0, 25)
	.word 0xbde5c000  ! 3878: SAVE_R	save	%r23, %r0, %r30
	.word 0xb3e50000  ! 3879: SAVE_R	save	%r20, %r0, %r25
	.word 0xb9e48000  ! 3882: SAVE_R	save	%r18, %r0, %r28
	.word 0xb1e40000  ! 3883: SAVE_R	save	%r16, %r0, %r24
	.word 0xbfe4a180  ! 3885: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_wr_184:
	mov	0x21, %r14
	.word 0xfef38e40  ! 3886: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_wr_185:
	mov	0x10, %r14
	.word 0xf4f38e80  ! 3887: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb7e52160  ! 3889: SAVE_I	save	%r20, 0x0001, %r27
T0_asi_reg_rd_176:
	mov	0x6, %r14
	.word 0xfadb84a0  ! 3891: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbde5c000  ! 3893: SAVE_R	save	%r23, %r0, %r30
	.word 0xb1e54000  ! 3894: SAVE_R	save	%r21, %r0, %r24
	.word 0xb1e40000  ! 3895: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_255:
	setx	0x3c0214, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_313:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_313), 16, 16)) -> intp(0, 0, 14)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_314:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_314), 16, 16)) -> intp(0, 0, 19)
	.word 0xb5e5204a  ! 3902: SAVE_I	save	%r20, 0x0001, %r26
T0_asi_reg_rd_177:
	mov	0x35, %r14
	.word 0xf2db89e0  ! 3903: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb7e4a0c4  ! 3906: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_rd_178:
	mov	0x2, %r14
	.word 0xfcdb89e0  ! 3912: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbbe5607c  ! 3913: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e40000  ! 3916: SAVE_R	save	%r16, %r0, %r27
T0_asi_reg_wr_186:
	mov	0x25, %r14
	.word 0xf8f38e60  ! 3919: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_0_256:
	setx	0x3c0126, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_257:
	setx	0x3f0227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e42177  ! 3927: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e4e0cb  ! 3928: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbbe54000  ! 3930: SAVE_R	save	%r21, %r0, %r29
	.word 0xb3e4e1d2  ! 3932: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_315:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_315), 16, 16)) -> intp(0, 0, 1c)
cpu_intr_0_258:
	setx	0x3e0303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe460bc  ! 3938: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb9e4a190  ! 3942: SAVE_I	save	%r18, 0x0001, %r28
iob_intr_0_316:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_316), 16, 16)) -> intp(0, 0, 3d)
cpu_intr_0_259:
	setx	0x3e0107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e58000  ! 3953: SAVE_R	save	%r22, %r0, %r27
cpu_intr_0_260:
	setx	0x3e0314, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_rd_179:
	mov	0x3c3, %r14
	.word 0xfcdb8e40  ! 3960: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_261:
	setx	0x3c0210, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_262:
	setx	0x3e010b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_263:
	setx	0x3e0110, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_180:
	mov	0x3c3, %r14
	.word 0xf0db8e80  ! 3967: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_0_264:
	setx	0x3e011e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_181:
	mov	0x6, %r14
	.word 0xf2db8e40  ! 3971: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb1e40000  ! 3973: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_317:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_317), 16, 16)) -> intp(0, 0, 7)
iob_intr_0_318:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_318), 16, 16)) -> intp(0, 0, 0)
iob_intr_0_319:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_319), 16, 16)) -> intp(0, 0, 7)
iob_intr_0_320:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_320), 16, 16)) -> intp(0, 0, 25)
	.word 0xbbe5e191  ! 3986: SAVE_I	save	%r23, 0x0001, %r29
T0_asi_reg_rd_182:
	mov	0x20, %r14
	.word 0xfedb8e60  ! 3990: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb9e4e11b  ! 3991: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb3e44000  ! 3993: SAVE_R	save	%r17, %r0, %r25
iob_intr_0_321:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_321), 16, 16)) -> intp(0, 0, 32)
T0_asi_reg_rd_183:
	mov	0x3c7, %r14
	.word 0xf4db84a0  ! 3995: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_0_265:
	setx	0x3d0010, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_184:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 3999: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_rd_185:
	mov	0x11, %r14
	.word 0xf8db8e40  ! 4001: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_266:
	setx	0x3d023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e48000  ! 4003: SAVE_R	save	%r18, %r0, %r24
iob_intr_0_322:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_322), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_rd_186:
	mov	0x3c7, %r14
	.word 0xfadb8e40  ! 4005: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbb2d8000  ! 4006: SLL_R	sll 	%r22, %r0, %r29
iob_intr_0_323:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_323), 16, 16)) -> intp(0, 0, 13)
	.word 0xb8258000  ! 4012: SUB_R	sub 	%r22, %r0, %r28
cpu_intr_0_267:
	setx	0x3e012f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_268:
	setx	0x3d0206, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_269:
	setx	0x3d0327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e153  ! 4019: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_wr_187:
	mov	0x3, %r14
	.word 0xf6f384a0  ! 4023: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xbbe4e18e  ! 4027: SAVE_I	save	%r19, 0x0001, %r29
iob_intr_0_324:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_324), 16, 16)) -> intp(0, 0, 31)
	.word 0xb4c42088  ! 4034: ADDCcc_I	addccc 	%r16, 0x0088, %r26
iob_intr_0_325:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_325), 16, 16)) -> intp(0, 0, 31)
cpu_intr_0_270:
	setx	0x3e0338, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_326:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_326), 16, 16)) -> intp(0, 0, 6)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfe56128  ! 4048: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbfe40000  ! 4052: SAVE_R	save	%r16, %r0, %r31
T0_asi_reg_wr_188:
	mov	0x3c1, %r14
	.word 0xf2f384a0  ! 4054: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb7e461d9  ! 4056: SAVE_I	save	%r17, 0x0001, %r27
iob_intr_0_327:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_327), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb7e40000  ! 4064: SAVE_R	save	%r16, %r0, %r27
T0_asi_reg_wr_189:
	mov	0x23, %r14
	.word 0xfcf38e40  ! 4065: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb9e5213d  ! 4066: SAVE_I	save	%r20, 0x0001, %r28
T0_asi_reg_rd_187:
	mov	0x1c, %r14
	.word 0xfedb8e40  ! 4067: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_rd_188:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 4072: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_0_271:
	setx	0x3d001f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_328:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_328), 16, 16)) -> intp(0, 0, 0)
cpu_intr_0_272:
	setx	0x3e021e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_190:
	mov	0x3c6, %r14
	.word 0xf4f38e40  ! 4090: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_wr_191:
	mov	0x3c6, %r14
	.word 0xf6f38400  ! 4091: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbfe5e0c9  ! 4096: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb5e4218d  ! 4097: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_329:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_329), 16, 16)) -> intp(0, 0, 26)
cpu_intr_0_273:
	setx	0x43001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8a4c000  ! 4105: SUBcc_R	subcc 	%r19, %r0, %r28
	.word 0xb3e40000  ! 4107: SAVE_R	save	%r16, %r0, %r25
	.word 0xb7e5c000  ! 4108: SAVE_R	save	%r23, %r0, %r27
	.word 0xb9e5c000  ! 4111: SAVE_R	save	%r23, %r0, %r28
	.word 0xbe2420d1  ! 4113: SUB_I	sub 	%r16, 0x00d1, %r31
T0_asi_reg_rd_189:
	mov	0x15, %r14
	.word 0xf2db89e0  ! 4115: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbfe5607e  ! 4117: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_rd_190:
	mov	0x18, %r14
	.word 0xf2db84a0  ! 4118: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb3e54000  ! 4119: SAVE_R	save	%r21, %r0, %r25
	.word 0xbde520c8  ! 4124: SAVE_I	save	%r20, 0x0001, %r30
iob_intr_0_330:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_330), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbd2c6001  ! 4126: SLL_I	sll 	%r17, 0x0001, %r30
	.word 0xb5e40000  ! 4130: SAVE_R	save	%r16, %r0, %r26
cpu_intr_0_274:
	setx	0x41032a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_192:
	mov	0x33, %r14
	.word 0xfcf384a0  ! 4133: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_0_331:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_331), 16, 16)) -> intp(0, 0, 24)
	.word 0xbc258000  ! 4135: SUB_R	sub 	%r22, %r0, %r30
	.word 0xb7e4e0eb  ! 4138: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbfe5a05a  ! 4141: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_332:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_332), 16, 16)) -> intp(0, 0, 12)
iob_intr_0_333:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_333), 16, 16)) -> intp(0, 0, 22)
T0_asi_reg_rd_191:
	mov	0x2a, %r14
	.word 0xfadb8400  ! 4144: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_0_334:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_334), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb7e50000  ! 4153: SAVE_R	save	%r20, %r0, %r27
cpu_intr_0_275:
	setx	0x43012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e17f  ! 4157: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e4e06e  ! 4164: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbfe4602f  ! 4166: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_wr_193:
	mov	0x31, %r14
	.word 0xfef38e80  ! 4167: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbbe4e05e  ! 4168: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_wr_194:
	mov	0xc, %r14
	.word 0xf6f38e80  ! 4174: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbfe40000  ! 4175: SAVE_R	save	%r16, %r0, %r31
	.word 0xb534c000  ! 4177: SRL_R	srl 	%r19, %r0, %r26
T0_asi_reg_rd_192:
	mov	0x3c2, %r14
	.word 0xf6db8e40  ! 4178: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb9e50000  ! 4180: SAVE_R	save	%r20, %r0, %r28
iob_intr_0_335:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_335), 16, 16)) -> intp(0, 0, 22)
cpu_intr_0_276:
	setx	0x400311, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_336:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_336), 16, 16)) -> intp(0, 0, 16)
iob_intr_0_337:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_337), 16, 16)) -> intp(0, 0, 2f)
	.word 0xbde4a0e4  ! 4189: SAVE_I	save	%r18, 0x0001, %r30
cpu_intr_0_277:
	setx	0x420301, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_338:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_338), 16, 16)) -> intp(0, 0, 8)
	.word 0xbbe5e042  ! 4195: SAVE_I	save	%r23, 0x0001, %r29
T0_asi_reg_wr_195:
	mov	0x35, %r14
	.word 0xf8f38e80  ! 4197: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_0_278:
	setx	0x420039, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_279:
	setx	0x400303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe48000  ! 4200: SAVE_R	save	%r18, %r0, %r29
	.word 0xb1e420e3  ! 4208: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbde4e120  ! 4209: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb9e5c000  ! 4210: SAVE_R	save	%r23, %r0, %r28
T0_asi_reg_rd_193:
	mov	0x3c4, %r14
	.word 0xf0db89e0  ! 4212: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbf3c4000  ! 4214: SRA_R	sra 	%r17, %r0, %r31
cpu_intr_0_280:
	setx	0x42023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e46195  ! 4217: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_wr_196:
	mov	0x3c2, %r14
	.word 0xf2f38400  ! 4222: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbfe5c000  ! 4226: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_339:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_339), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_340:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_340), 16, 16)) -> intp(0, 0, 21)
	.word 0xb1e4a0c7  ! 4229: SAVE_I	save	%r18, 0x0001, %r24
cpu_intr_0_281:
	setx	0x410100, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_282:
	setx	0x40011f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_283:
	setx	0x43000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e40000  ! 4242: SAVE_R	save	%r16, %r0, %r28
	.word 0xb5e40000  ! 4243: SAVE_R	save	%r16, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_284:
	setx	0x420031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe56092  ! 4247: SAVE_I	save	%r21, 0x0001, %r29
iob_intr_0_341:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_341), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_rd_194:
	mov	0x11, %r14
	.word 0xf4db8400  ! 4253: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_0_342:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_342), 16, 16)) -> intp(0, 0, 20)
cpu_intr_0_285:
	setx	0x41013a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_343:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_343), 16, 16)) -> intp(0, 0, 35)
	.word 0xb9e5e0a6  ! 4269: SAVE_I	save	%r23, 0x0001, %r28
	.word 0x8994a192  ! 4276: WRPR_TICK_I	wrpr	%r18, 0x0192, %tick
	.word 0xb7e5a14b  ! 4277: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_286:
	setx	0x410228, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_287:
	setx	0x42002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb534b001  ! 4286: SRLX_I	srlx	%r18, 0x0001, %r26
	.word 0xb9e44000  ! 4288: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_344:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_344), 16, 16)) -> intp(0, 0, 7)
cpu_intr_0_288:
	setx	0x430104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a014  ! 4293: SAVE_I	save	%r18, 0x0001, %r25
iob_intr_0_345:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_345), 16, 16)) -> intp(0, 0, 2)
	.word 0xb225a03f  ! 4296: SUB_I	sub 	%r22, 0x003f, %r25
T0_asi_reg_rd_195:
	mov	0x7, %r14
	.word 0xf6db8e40  ! 4299: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb3e50000  ! 4300: SAVE_R	save	%r20, %r0, %r25
T0_asi_reg_wr_197:
	mov	0x12, %r14
	.word 0xfef38e80  ! 4302: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb1e421c0  ! 4305: SAVE_I	save	%r16, 0x0001, %r24
cpu_intr_0_289:
	setx	0x430237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e48000  ! 4311: SAVE_R	save	%r18, %r0, %r27
	.word 0xbfe4c000  ! 4312: SAVE_R	save	%r19, %r0, %r31
	.word 0xbde5a125  ! 4313: SAVE_I	save	%r22, 0x0001, %r30
cpu_intr_0_290:
	setx	0x410123, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_196:
	mov	0x2c, %r14
	.word 0xf0db8400  ! 4318: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb1e58000  ! 4319: SAVE_R	save	%r22, %r0, %r24
	.word 0xb5e48000  ! 4323: SAVE_R	save	%r18, %r0, %r26
	.word 0xbbe50000  ! 4325: SAVE_R	save	%r20, %r0, %r29
cpu_intr_0_291:
	setx	0x430039, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_198:
	mov	0x36, %r14
	.word 0xf2f38e60  ! 4335: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_0_346:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_346), 16, 16)) -> intp(0, 0, 2d)
cpu_intr_0_292:
	setx	0x42003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e1ef  ! 4340: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e54000  ! 4343: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_rd_197:
	mov	0x1f, %r14
	.word 0xfedb8e40  ! 4345: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_rd_198:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 4347: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb1e40000  ! 4348: SAVE_R	save	%r16, %r0, %r24
	.word 0xbc45a0f5  ! 4354: ADDC_I	addc 	%r22, 0x00f5, %r30
iob_intr_0_347:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_347), 16, 16)) -> intp(0, 0, 33)
iob_intr_0_348:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_348), 16, 16)) -> intp(0, 0, 3)
	.word 0xbcb5c000  ! 4361: SUBCcc_R	orncc 	%r23, %r0, %r30
iob_intr_0_349:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_349), 16, 16)) -> intp(0, 0, 36)
	.word 0xbbe58000  ! 4364: SAVE_R	save	%r22, %r0, %r29
iob_intr_0_350:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_350), 16, 16)) -> intp(0, 0, 26)
cpu_intr_0_293:
	setx	0x42023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e560cf  ! 4372: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbc35e035  ! 4374: SUBC_I	orn 	%r23, 0x0035, %r30
T0_asi_reg_wr_199:
	mov	0x3c4, %r14
	.word 0xf4f38400  ! 4377: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb7e5c000  ! 4379: SAVE_R	save	%r23, %r0, %r27
cpu_intr_0_294:
	setx	0x40002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e1dd  ! 4381: SAVE_I	save	%r19, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_295:
	setx	0x400214, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_199:
	mov	0x38, %r14
	.word 0xfedb8e60  ! 4385: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xbfe56109  ! 4386: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_wr_200:
	mov	0x3c0, %r14
	.word 0xfaf38e40  ! 4388: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbbe5e1fd  ! 4390: SAVE_I	save	%r23, 0x0001, %r29
iob_intr_0_351:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_351), 16, 16)) -> intp(0, 0, 2c)
iob_intr_0_352:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_352), 16, 16)) -> intp(0, 0, 1)
iob_intr_0_353:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_353), 16, 16)) -> intp(0, 0, c)
cpu_intr_0_296:
	setx	0x43010f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_297:
	setx	0x400107, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_200:
	mov	0x3c2, %r14
	.word 0xfedb8400  ! 4402: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_0_298:
	setx	0x40011a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_354:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_354), 16, 16)) -> intp(0, 0, 8)
	.word 0xb1e50000  ! 4406: SAVE_R	save	%r20, %r0, %r24
	.word 0xb7e54000  ! 4410: SAVE_R	save	%r21, %r0, %r27
iob_intr_0_355:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_355), 16, 16)) -> intp(0, 0, 4)
T0_asi_reg_wr_201:
	mov	0x26, %r14
	.word 0xf6f38e40  ! 4413: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb29da00e  ! 4416: XORcc_I	xorcc 	%r22, 0x000e, %r25
	.word 0xbde50000  ! 4417: SAVE_R	save	%r20, %r0, %r30
	.word 0xb5e4c000  ! 4418: SAVE_R	save	%r19, %r0, %r26
	.word 0xbbe5c000  ! 4423: SAVE_R	save	%r23, %r0, %r29
T0_asi_reg_wr_202:
	mov	0x1d, %r14
	.word 0xf4f38e80  ! 4427: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb3e40000  ! 4428: SAVE_R	save	%r16, %r0, %r25
T0_asi_reg_rd_201:
	mov	0x2f, %r14
	.word 0xfedb84a0  ! 4429: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_356:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_356), 16, 16)) -> intp(0, 0, 36)
T0_asi_reg_rd_202:
	mov	0x3c7, %r14
	.word 0xf0db8e60  ! 4432: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_0_299:
	setx	0x410332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4848000  ! 4434: ADDcc_R	addcc 	%r18, %r0, %r26
iob_intr_0_357:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_357), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_wr_203:
	mov	0x16, %r14
	.word 0xf2f384a0  ! 4438: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T0_asi_reg_rd_203:
	mov	0x4, %r14
	.word 0xf0db8e40  ! 4439: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb3e4a0b5  ! 4440: SAVE_I	save	%r18, 0x0001, %r25
iob_intr_0_358:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_358), 16, 16)) -> intp(0, 0, 2b)
cpu_intr_0_300:
	setx	0x410006, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_204:
	mov	0x24, %r14
	.word 0xf2f38e40  ! 4452: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb4b4a132  ! 4454: SUBCcc_I	orncc 	%r18, 0x0132, %r26
	.word 0xbbe44000  ! 4458: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_wr_205:
	mov	0x38, %r14
	.word 0xfef384a0  ! 4459: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb9e54000  ! 4462: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_rd_204:
	mov	0x28, %r14
	.word 0xf4db8400  ! 4463: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T0_asi_reg_wr_206:
	mov	0x13, %r14
	.word 0xf4f38400  ! 4464: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_0_359:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_359), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_wr_207:
	mov	0x24, %r14
	.word 0xfef38e40  ! 4466: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_0_301:
	setx	0x400035, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_360:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_360), 16, 16)) -> intp(0, 0, 25)
T0_asi_reg_wr_208:
	mov	0x22, %r14
	.word 0xf4f38e40  ! 4470: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_wr_209:
	mov	0x3c6, %r14
	.word 0xfef38e40  ! 4473: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb1e52109  ! 4477: SAVE_I	save	%r20, 0x0001, %r24
cpu_intr_0_302:
	setx	0x430015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe50000  ! 4479: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_wr_210:
	mov	0x1a, %r14
	.word 0xf8f38e40  ! 4480: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_361:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_361), 16, 16)) -> intp(0, 0, 3c)
T0_asi_reg_rd_205:
	mov	0x38, %r14
	.word 0xfadb84a0  ! 4485: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_0_303:
	setx	0x400302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde50000  ! 4487: SAVE_R	save	%r20, %r0, %r30
iob_intr_0_362:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_362), 16, 16)) -> intp(0, 0, 38)
	.word 0xb5e421fa  ! 4490: SAVE_I	save	%r16, 0x0001, %r26
cpu_intr_0_304:
	setx	0x43010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e50000  ! 4493: SAVE_R	save	%r20, %r0, %r25
iob_intr_0_363:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_363), 16, 16)) -> intp(0, 0, 7)
	.word 0xb3e40000  ! 4496: SAVE_R	save	%r16, %r0, %r25
T0_asi_reg_wr_211:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 4497: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_rd_206:
	mov	0x25, %r14
	.word 0xfcdb8e40  ! 4499: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb1e561b7  ! 4504: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbde50000  ! 4505: SAVE_R	save	%r20, %r0, %r30
	.word 0xb3e50000  ! 4506: SAVE_R	save	%r20, %r0, %r25
iob_intr_0_364:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_364), 16, 16)) -> intp(0, 0, 16)
T0_asi_reg_rd_207:
	mov	0x3c6, %r14
	.word 0xf0db8e40  ! 4509: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb9e5c000  ! 4511: SAVE_R	save	%r23, %r0, %r28
T0_asi_reg_wr_212:
	mov	0xa, %r14
	.word 0xf0f38e80  ! 4512: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbde4619d  ! 4513: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe4c000  ! 4514: SAVE_R	save	%r19, %r0, %r29
	.word 0xb6452146  ! 4516: ADDC_I	addc 	%r20, 0x0146, %r27
cpu_intr_0_305:
	setx	0x420314, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_365:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_365), 16, 16)) -> intp(0, 0, c)
	.word 0xb7e50000  ! 4520: SAVE_R	save	%r20, %r0, %r27
T0_asi_reg_rd_208:
	mov	0x4, %r14
	.word 0xfedb8e40  ! 4522: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbde56133  ! 4524: SAVE_I	save	%r21, 0x0001, %r30
iob_intr_0_366:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_366), 16, 16)) -> intp(0, 0, c)
	.word 0xbf641800  ! 4533: MOVcc_R	<illegal instruction>
T0_asi_reg_wr_213:
	mov	0x2f, %r14
	.word 0xf8f38e80  ! 4535: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb9e5e1ac  ! 4536: SAVE_I	save	%r23, 0x0001, %r28
cpu_intr_0_306:
	setx	0x3002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4a1e0  ! 4545: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e46000  ! 4547: SAVE_I	save	%r17, 0x0001, %r24
cpu_intr_0_307:
	setx	0x400227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e54000  ! 4550: SAVE_R	save	%r21, %r0, %r28
	.word 0xbc958000  ! 4552: ORcc_R	orcc 	%r22, %r0, %r30
iob_intr_0_367:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_367), 16, 16)) -> intp(0, 0, 7)
	.word 0xb5e561f7  ! 4558: SAVE_I	save	%r21, 0x0001, %r26
cpu_intr_0_308:
	setx	0x43030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_209:
	mov	0x3c0, %r14
	.word 0xf0db8400  ! 4571: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb5e50000  ! 4576: SAVE_R	save	%r20, %r0, %r26
cpu_intr_0_309:
	setx	0x410020, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_214:
	mov	0x2a, %r14
	.word 0xf8f38e40  ! 4579: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_310:
	setx	0x45002a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_311:
	setx	0x450217, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_368:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_368), 16, 16)) -> intp(0, 0, 17)
iob_intr_0_369:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_369), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_rd_210:
	mov	0x3c5, %r14
	.word 0xf0db8e60  ! 4592: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbbe58000  ! 4597: SAVE_R	save	%r22, %r0, %r29
T0_asi_reg_wr_215:
	mov	0x12, %r14
	.word 0xfaf389e0  ! 4598: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbd3c9000  ! 4599: SRAX_R	srax	%r18, %r0, %r30
T0_asi_reg_wr_216:
	mov	0x3c1, %r14
	.word 0xf8f38e60  ! 4604: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbde4e1fb  ! 4605: SAVE_I	save	%r19, 0x0001, %r30
cpu_intr_0_312:
	setx	0x45031c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_370:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_370), 16, 16)) -> intp(0, 0, 25)
	.word 0xbfe48000  ! 4610: SAVE_R	save	%r18, %r0, %r31
	.word 0xb1e56143  ! 4612: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb1e52092  ! 4613: SAVE_I	save	%r20, 0x0001, %r24
iob_intr_0_371:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_371), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb5e54000  ! 4617: SAVE_R	save	%r21, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_372:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_372), 16, 16)) -> intp(0, 0, 3e)
cpu_intr_0_313:
	setx	0x450324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb551c000  ! 4624: RDPR_TL	<illegal instruction>
iob_intr_0_373:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_373), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_rd_211:
	mov	0x29, %r14
	.word 0xfedb8e80  ! 4629: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xbe9de0aa  ! 4630: XORcc_I	xorcc 	%r23, 0x00aa, %r31
T0_asi_reg_rd_212:
	mov	0x26, %r14
	.word 0xf2db8400  ! 4633: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xbbe5c000  ! 4634: SAVE_R	save	%r23, %r0, %r29
	.word 0xb3e44000  ! 4638: SAVE_R	save	%r17, %r0, %r25
	.word 0xbfe40000  ! 4639: SAVE_R	save	%r16, %r0, %r31
	.word 0xbfe4216c  ! 4640: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_rd_213:
	mov	0x3c8, %r14
	.word 0xf8db8e40  ! 4647: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb9e54000  ! 4648: SAVE_R	save	%r21, %r0, %r28
iob_intr_0_374:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_374), 16, 16)) -> intp(0, 0, 38)
	.word 0xbfe44000  ! 4653: SAVE_R	save	%r17, %r0, %r31
cpu_intr_0_314:
	setx	0x45001d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_315:
	setx	0x44033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e54000  ! 4659: SAVE_R	save	%r21, %r0, %r28
	.word 0xbbe44000  ! 4662: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_rd_214:
	mov	0x21, %r14
	.word 0xfedb8e80  ! 4666: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_0_375:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_375), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbbe58000  ! 4668: SAVE_R	save	%r22, %r0, %r29
	.word 0xb5e5c000  ! 4670: SAVE_R	save	%r23, %r0, %r26
	.word 0xb3e58000  ! 4671: SAVE_R	save	%r22, %r0, %r25
	.word 0xbebd2056  ! 4674: XNORcc_I	xnorcc 	%r20, 0x0056, %r31
	.word 0xba358000  ! 4675: SUBC_R	orn 	%r22, %r0, %r29
	.word 0xb9e58000  ! 4676: SAVE_R	save	%r22, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e5c000  ! 4679: SAVE_R	save	%r23, %r0, %r27
	.word 0xb5e50000  ! 4680: SAVE_R	save	%r20, %r0, %r26
T0_asi_reg_wr_217:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 4681: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_wr_218:
	mov	0x2b, %r14
	.word 0xfef38e80  ! 4682: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb9e48000  ! 4683: SAVE_R	save	%r18, %r0, %r28
cpu_intr_0_316:
	setx	0x460027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8042039  ! 4689: ADD_I	add 	%r16, 0x0039, %r28
	.word 0xb68ce02f  ! 4691: ANDcc_I	andcc 	%r19, 0x002f, %r27
	.word 0xbbe40000  ! 4693: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_wr_219:
	mov	0x1a, %r14
	.word 0xfaf38e40  ! 4694: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbbe4e059  ! 4695: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_wr_220:
	mov	0x2f, %r14
	.word 0xfaf384a0  ! 4696: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T0_asi_reg_wr_221:
	mov	0xa, %r14
	.word 0xfaf389e0  ! 4700: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T0_asi_reg_rd_215:
	mov	0x7, %r14
	.word 0xfcdb84a0  ! 4701: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbde56059  ! 4702: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb43d0000  ! 4704: XNOR_R	xnor 	%r20, %r0, %r26
	.word 0xb7e42192  ! 4705: SAVE_I	save	%r16, 0x0001, %r27
iob_intr_0_376:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_376), 16, 16)) -> intp(0, 0, 33)
iob_intr_0_377:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_377), 16, 16)) -> intp(0, 0, 1f)
iob_intr_0_378:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_378), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_wr_222:
	mov	0x3c2, %r14
	.word 0xf2f389e0  ! 4712: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_0_317:
	setx	0x44012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e50000  ! 4716: SAVE_R	save	%r20, %r0, %r24
	.word 0xb21d0000  ! 4718: XOR_R	xor 	%r20, %r0, %r25
cpu_intr_0_318:
	setx	0x460229, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_223:
	mov	0x3c1, %r14
	.word 0xfaf38400  ! 4722: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T0_asi_reg_wr_224:
	mov	0x18, %r14
	.word 0xfaf38e80  ! 4724: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb1e5c000  ! 4725: SAVE_R	save	%r23, %r0, %r24
cpu_intr_0_319:
	setx	0x46000a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_320:
	setx	0x44012f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_379:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_379), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_wr_225:
	mov	0x0, %r14
	.word 0xf0f38e40  ! 4732: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbbe48000  ! 4733: SAVE_R	save	%r18, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbde54000  ! 4735: SAVE_R	save	%r21, %r0, %r30
	.word 0xb7e46058  ! 4737: SAVE_I	save	%r17, 0x0001, %r27
cpu_intr_0_321:
	setx	0x44032b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_380:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_380), 16, 16)) -> intp(0, 0, 2)
	.word 0xb7e5e0eb  ! 4743: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e4e063  ! 4745: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_wr_226:
	mov	0x14, %r14
	.word 0xfef38e40  ! 4746: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb1e54000  ! 4748: SAVE_R	save	%r21, %r0, %r24
iob_intr_0_381:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_381), 16, 16)) -> intp(0, 0, 15)
iob_intr_0_382:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_382), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_rd_216:
	mov	0x32, %r14
	.word 0xf0db8e60  ! 4758: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb32c4000  ! 4760: SLL_R	sll 	%r17, %r0, %r25
	.word 0xb9e5e1ae  ! 4761: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_rd_217:
	mov	0x3c6, %r14
	.word 0xf2db8e40  ! 4762: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbbe4e165  ! 4764: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb9e58000  ! 4766: SAVE_R	save	%r22, %r0, %r28
	.word 0xbfe5a0fa  ! 4767: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_383:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_383), 16, 16)) -> intp(0, 0, 24)
	.word 0xb7e5a17c  ! 4770: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1e4a17e  ! 4772: SAVE_I	save	%r18, 0x0001, %r24
T0_asi_reg_wr_227:
	mov	0x3c6, %r14
	.word 0xf6f38e80  ! 4777: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb7e44000  ! 4778: SAVE_R	save	%r17, %r0, %r27
	.word 0xbd504000  ! 4779: RDPR_TNPC	<illegal instruction>
cpu_intr_0_322:
	setx	0x46032a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_218:
	mov	0x3c2, %r14
	.word 0xf8db8e60  ! 4785: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xbde4c000  ! 4786: SAVE_R	save	%r19, %r0, %r30
	.word 0xb49c8000  ! 4788: XORcc_R	xorcc 	%r18, %r0, %r26
	.word 0xb9e421f7  ! 4789: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb1e5c000  ! 4791: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_wr_228:
	mov	0x2a, %r14
	.word 0xfcf38e80  ! 4792: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_0_323:
	setx	0x46020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb20d2047  ! 4794: AND_I	and 	%r20, 0x0047, %r25
iob_intr_0_384:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_384), 16, 16)) -> intp(0, 0, 9)
	.word 0xb5e48000  ! 4796: SAVE_R	save	%r18, %r0, %r26
T0_asi_reg_rd_219:
	mov	0x1f, %r14
	.word 0xfcdb8e60  ! 4798: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbbe460ce  ! 4802: SAVE_I	save	%r17, 0x0001, %r29
cpu_intr_0_324:
	setx	0x470235, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_220:
	mov	0x3c6, %r14
	.word 0xf8db8400  ! 4805: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb1e4e07c  ! 4807: SAVE_I	save	%r19, 0x0001, %r24
cpu_intr_0_325:
	setx	0x45032a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_229:
	mov	0x3c0, %r14
	.word 0xfaf38e40  ! 4811: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_wr_230:
	mov	0x32, %r14
	.word 0xf2f38e60  ! 4812: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xbde521ac  ! 4818: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb3e461ab  ! 4819: SAVE_I	save	%r17, 0x0001, %r25
T0_asi_reg_wr_231:
	mov	0x8, %r14
	.word 0xf6f38e80  ! 4822: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb7e58000  ! 4824: SAVE_R	save	%r22, %r0, %r27
cpu_intr_0_326:
	setx	0x460339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb2d7001  ! 4826: SLLX_I	sllx	%r21, 0x0001, %r29
	.word 0xb7e4c000  ! 4827: SAVE_R	save	%r19, %r0, %r27
	.word 0xb9e5a13b  ! 4828: SAVE_I	save	%r22, 0x0001, %r28
cpu_intr_0_327:
	setx	0x440315, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_232:
	mov	0x3c1, %r14
	.word 0xf0f38e80  ! 4835: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbfe4c000  ! 4837: SAVE_R	save	%r19, %r0, %r31
	.word 0xbfe44000  ! 4839: SAVE_R	save	%r17, %r0, %r31
cpu_intr_0_328:
	setx	0x470123, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_329:
	setx	0x470028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4a041  ! 4842: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde50000  ! 4844: SAVE_R	save	%r20, %r0, %r30
	.word 0xb3e4e02e  ! 4845: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbc34a15b  ! 4846: SUBC_I	orn 	%r18, 0x015b, %r30
	.word 0xb0b44000  ! 4849: ORNcc_R	orncc 	%r17, %r0, %r24
T0_asi_reg_rd_221:
	mov	0x3c0, %r14
	.word 0xf0db8e40  ! 4850: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb9e54000  ! 4852: SAVE_R	save	%r21, %r0, %r28
	.word 0xb3e4e164  ! 4854: SAVE_I	save	%r19, 0x0001, %r25
cpu_intr_0_330:
	setx	0x45033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e0d5  ! 4859: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbbe4a17a  ! 4860: SAVE_I	save	%r18, 0x0001, %r29
T0_asi_reg_rd_222:
	mov	0x3c6, %r14
	.word 0xf6db8e60  ! 4862: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbaadc000  ! 4864: ANDNcc_R	andncc 	%r23, %r0, %r29
	.word 0xb7e48000  ! 4865: SAVE_R	save	%r18, %r0, %r27
	.word 0xb9e5e129  ! 4867: SAVE_I	save	%r23, 0x0001, %r28
iob_intr_0_385:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_385), 16, 16)) -> intp(0, 0, 8)
	.word 0xb9e460a7  ! 4873: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbde5a03b  ! 4874: SAVE_I	save	%r22, 0x0001, %r30
cpu_intr_0_331:
	setx	0x460309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe58000  ! 4876: SAVE_R	save	%r22, %r0, %r31
	.word 0xbfe5e082  ! 4878: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbde5a065  ! 4880: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb7e520a0  ! 4883: SAVE_I	save	%r20, 0x0001, %r27
iob_intr_0_386:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_386), 16, 16)) -> intp(0, 0, 19)
	.word 0xbbe42135  ! 4888: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb5352001  ! 4889: SRL_I	srl 	%r20, 0x0001, %r26
iob_intr_0_387:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_387), 16, 16)) -> intp(0, 0, 35)
	.word 0xbfe4e17c  ! 4891: SAVE_I	save	%r19, 0x0001, %r31
T0_asi_reg_rd_223:
	mov	0x2c, %r14
	.word 0xf2db8e80  ! 4892: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_0_332:
	setx	0x440239, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_224:
	mov	0x28, %r14
	.word 0xf6db8e40  ! 4895: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_388:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_388), 16, 16)) -> intp(0, 0, 21)
	.word 0xb92d9000  ! 4898: SLLX_R	sllx	%r22, %r0, %r28
	.word 0xbde54000  ! 4899: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_333:
	setx	0x460118, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_233:
	mov	0x15, %r14
	.word 0xf4f384a0  ! 4903: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbfe5a083  ! 4905: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb3e4e18e  ! 4906: SAVE_I	save	%r19, 0x0001, %r25
cpu_intr_0_334:
	setx	0x46011d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_234:
	mov	0x3c3, %r14
	.word 0xfcf38e80  ! 4908: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb7e5c000  ! 4911: SAVE_R	save	%r23, %r0, %r27
T0_asi_reg_wr_235:
	mov	0x27, %r14
	.word 0xfcf384a0  ! 4912: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_0_389:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_389), 16, 16)) -> intp(0, 0, 24)
cpu_intr_0_335:
	setx	0x470124, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_236:
	mov	0x20, %r14
	.word 0xfef38e40  ! 4922: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbfe48000  ! 4924: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_336:
	setx	0x47033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4c000  ! 4927: SAVE_R	save	%r19, %r0, %r27
iob_intr_0_390:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_390), 16, 16)) -> intp(0, 0, 21)
	.word 0xb3e4c000  ! 4930: SAVE_R	save	%r19, %r0, %r25
	.word 0xbde58000  ! 4932: SAVE_R	save	%r22, %r0, %r30
	.word 0xb7e5c000  ! 4935: SAVE_R	save	%r23, %r0, %r27
	.word 0xbf2c2001  ! 4936: SLL_I	sll 	%r16, 0x0001, %r31
T0_asi_reg_wr_237:
	mov	0x16, %r14
	.word 0xf8f38e40  ! 4937: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_391:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_391), 16, 16)) -> intp(0, 0, a)
iob_intr_0_392:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_392), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb5e5e10d  ! 4942: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x8195e007  ! 4943: WRPR_TPC_I	wrpr	%r23, 0x0007, %tpc
cpu_intr_0_337:
	setx	0x440210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe44000  ! 4945: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_393:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_393), 16, 16)) -> intp(0, 0, 24)
	.word 0xbbe5a090  ! 4951: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_394:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_394), 16, 16)) -> intp(0, 0, 8)
cpu_intr_0_338:
	setx	0x460214, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_238:
	mov	0x11, %r14
	.word 0xf4f38400  ! 4958: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb1e58000  ! 4959: SAVE_R	save	%r22, %r0, %r24
cpu_intr_0_339:
	setx	0x47002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb23d218c  ! 4966: XNOR_I	xnor 	%r20, 0x018c, %r25
	.word 0xb1e56149  ! 4967: SAVE_I	save	%r21, 0x0001, %r24
T0_asi_reg_wr_239:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 4968: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_rd_225:
	mov	0x8, %r14
	.word 0xf6db89e0  ! 4970: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_0_395:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_395), 16, 16)) -> intp(0, 0, 2d)
T0_asi_reg_wr_240:
	mov	0x3c7, %r14
	.word 0xf4f389e0  ! 4973: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_0_396:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_396), 16, 16)) -> intp(0, 0, 20)
	.word 0xbc150000  ! 4976: OR_R	or 	%r20, %r0, %r30
	.word 0xbde48000  ! 4977: SAVE_R	save	%r18, %r0, %r30
	.word 0xbde460de  ! 4979: SAVE_I	save	%r17, 0x0001, %r30
iob_intr_0_397:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_397), 16, 16)) -> intp(0, 0, 23)
iob_intr_0_398:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_398), 16, 16)) -> intp(0, 0, 1b)
cpu_intr_0_340:
	setx	0x460210, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_399:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_399), 16, 16)) -> intp(0, 0, 4)
T0_asi_reg_rd_226:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 4991: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_rd_227:
	mov	0x3c1, %r14
	.word 0xf6db8400  ! 4993: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
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
	.word 0xfc354000  ! 1: STH_R	sth	%r30, [%r21 + %r0]
iob_intr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_0), 16, 16)) -> intp(3, 0, 2f)
T3_asi_reg_wr_0:
	mov	0x38, %r14
	.word 0xfaf384a0  ! 6: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xf4f56046  ! 8: STXA_I	stxa	%r26, [%r21 + 0x0046] %asi
T3_asi_reg_wr_1:
	mov	0x3c1, %r14
	.word 0xf2f38400  ! 9: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T3_asi_reg_rd_0:
	mov	0x2b, %r14
	.word 0xfadb8e40  ! 10: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfab5a14f  ! 11: STHA_I	stha	%r29, [%r22 + 0x014f] %asi
	.word 0xfe742081  ! 13: STX_I	stx	%r31, [%r16 + 0x0081]
iob_intr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_1), 16, 16)) -> intp(3, 0, 19)
cpu_intr_3_0:
	setx	0x1d0008, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_1:
	mov	0xe, %r14
	.word 0xfcdb8e60  ! 19: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T3_asi_reg_rd_2:
	mov	0x19, %r14
	.word 0xf4db8400  ! 20: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T3_asi_reg_rd_3:
	mov	0x3c0, %r14
	.word 0xfcdb8e40  ! 21: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_rd_4:
	mov	0x23, %r14
	.word 0xfadb84a0  ! 22: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T3_asi_reg_wr_2:
	mov	0x3c7, %r14
	.word 0xf4f38400  ! 23: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_2), 16, 16)) -> intp(3, 0, 1f)
iob_intr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_3), 16, 16)) -> intp(3, 0, 26)
	.word 0xf6340000  ! 29: STH_R	sth	%r27, [%r16 + %r0]
iob_intr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_4), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_wr_3:
	mov	0x3c8, %r14
	.word 0xf8f38400  ! 37: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T3_asi_reg_rd_5:
	mov	0x30, %r14
	.word 0xf4db8e60  ! 40: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	ta	T_CHANGE_TO_TL1
	.word 0xf8f4a19f  ! 43: STXA_I	stxa	%r28, [%r18 + 0x019f] %asi
	.word 0xf4b42012  ! 44: STHA_I	stha	%r26, [%r16 + 0x0012] %asi
	.word 0xfea5c020  ! 48: STWA_R	stwa	%r31, [%r23 + %r0] 0x01
	.word 0xfaa44020  ! 49: STWA_R	stwa	%r29, [%r17 + %r0] 0x01
T3_asi_reg_wr_4:
	mov	0x2b, %r14
	.word 0xf8f384a0  ! 53: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T3_asi_reg_rd_6:
	mov	0x3c7, %r14
	.word 0xf2db84a0  ! 54: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_3_1:
	setx	0x1d0327, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_7:
	mov	0x3c7, %r14
	.word 0xfadb8e40  ! 59: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfa2c0000  ! 60: STB_R	stb	%r29, [%r16 + %r0]
	.word 0xb4b4c000  ! 65: SUBCcc_R	orncc 	%r19, %r0, %r26
T3_asi_reg_wr_5:
	mov	0xd, %r14
	.word 0xfef38e60  ! 67: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_5), 16, 16)) -> intp(3, 0, 37)
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982b1a  ! 72: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1a, %hpstate
	.word 0xf8740000  ! 74: STX_R	stx	%r28, [%r16 + %r0]
	.word 0xba04202d  ! 75: ADD_I	add 	%r16, 0x002d, %r29
cpu_intr_3_2:
	setx	0x1e012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf075c000  ! 77: STX_R	stx	%r24, [%r23 + %r0]
	.word 0xf2ad202e  ! 78: STBA_I	stba	%r25, [%r20 + 0x002e] %asi
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_6:
	mov	0x14, %r14
	.word 0xfef389e0  ! 83: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T3_asi_reg_rd_8:
	mov	0x3c7, %r14
	.word 0xfcdb84a0  ! 87: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf625c000  ! 88: STW_R	stw	%r27, [%r23 + %r0]
T3_asi_reg_wr_7:
	mov	0x22, %r14
	.word 0xf4f384a0  ! 89: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	ta	T_CHANGE_TO_TL0
	.word 0xfeb40020  ! 91: STHA_R	stha	%r31, [%r16 + %r0] 0x01
	.word 0xf8ace1af  ! 94: STBA_I	stba	%r28, [%r19 + 0x01af] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x879521a9  ! 101: WRPR_TT_I	wrpr	%r20, 0x01a9, %tt
	.word 0xb0c5203e  ! 102: ADDCcc_I	addccc 	%r20, 0x003e, %r24
	.word 0xf22ca142  ! 103: STB_I	stb	%r25, [%r18 + 0x0142]
	.word 0xf035c000  ! 105: STH_R	sth	%r24, [%r23 + %r0]
iob_intr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_6), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_3:
	setx	0x1c0236, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_9:
	mov	0x33, %r14
	.word 0xf6db8e60  ! 111: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_7), 16, 16)) -> intp(3, 0, 7)
iob_intr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_8), 16, 16)) -> intp(3, 0, 2)
iob_intr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_9), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_rd_10:
	mov	0x3c3, %r14
	.word 0xf6db8e60  ! 119: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_3_4:
	setx	0x1f0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa35c000  ! 122: STH_R	sth	%r29, [%r23 + %r0]
T3_asi_reg_rd_11:
	mov	0x3c4, %r14
	.word 0xf4db84a0  ! 123: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T3_asi_reg_wr_8:
	mov	0x6, %r14
	.word 0xfaf389e0  ! 124: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_10), 16, 16)) -> intp(3, 0, 1d)
	.word 0xfeb4a1ea  ! 129: STHA_I	stha	%r31, [%r18 + 0x01ea] %asi
T3_asi_reg_wr_9:
	mov	0x18, %r14
	.word 0xfcf38400  ! 130: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_3_5:
	setx	0x1e0030, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_11), 16, 16)) -> intp(3, 0, 33)
	.word 0xf475e0bd  ! 134: STX_I	stx	%r26, [%r23 + 0x00bd]
	ta	T_CHANGE_TO_TL1
	.word 0xfcada12d  ! 136: STBA_I	stba	%r30, [%r22 + 0x012d] %asi
iob_intr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_12), 16, 16)) -> intp(3, 0, 11)
	.word 0xf6ade063  ! 138: STBA_I	stba	%r27, [%r23 + 0x0063] %asi
	.word 0xfead4020  ! 141: STBA_R	stba	%r31, [%r21 + %r0] 0x01
	.word 0xf835a07b  ! 143: STH_I	sth	%r28, [%r22 + 0x007b]
	.word 0xfe3461ad  ! 144: STH_I	sth	%r31, [%r17 + 0x01ad]
	.word 0xb0356033  ! 145: SUBC_I	orn 	%r21, 0x0033, %r24
	.word 0xf8a50020  ! 146: STWA_R	stwa	%r28, [%r20 + %r0] 0x01
	.word 0xf8254000  ! 147: STW_R	stw	%r28, [%r21 + %r0]
	.word 0xbc35608f  ! 148: SUBC_I	orn 	%r21, 0x008f, %r30
	.word 0x8594e098  ! 152: WRPR_TSTATE_I	wrpr	%r19, 0x0098, %tstate
iob_intr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_13), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_6:
	setx	0x1e0315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc74a1cb  ! 159: STX_I	stx	%r30, [%r18 + 0x01cb]
	.word 0xf2ac2153  ! 164: STBA_I	stba	%r25, [%r16 + 0x0153] %asi
iob_intr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_14), 16, 16)) -> intp(3, 0, 0)
T3_asi_reg_wr_10:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 170: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T3_asi_reg_wr_11:
	mov	0x3c6, %r14
	.word 0xf6f384a0  ! 171: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	ta	T_CHANGE_TO_TL0
	.word 0xf8f421c2  ! 173: STXA_I	stxa	%r28, [%r16 + 0x01c2] %asi
	.word 0xf4350000  ! 174: STH_R	sth	%r26, [%r20 + %r0]
cpu_intr_3_7:
	setx	0x1d0021, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_12:
	mov	0x3c7, %r14
	.word 0xf8f389e0  ! 177: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf2f46197  ! 178: STXA_I	stxa	%r25, [%r17 + 0x0197] %asi
cpu_intr_3_8:
	setx	0x1e003f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_9:
	setx	0x1e0306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf34a001  ! 181: SRL_I	srl 	%r18, 0x0001, %r31
T3_asi_reg_wr_13:
	mov	0x5, %r14
	.word 0xfcf38e80  ! 182: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL1
iob_intr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_15), 16, 16)) -> intp(3, 0, 21)
iob_intr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_16), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_17), 16, 16)) -> intp(3, 0, 13)
T3_asi_reg_rd_12:
	mov	0x3c1, %r14
	.word 0xf0db84a0  ! 192: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T3_asi_reg_rd_13:
	mov	0x3c8, %r14
	.word 0xf2db8e60  ! 196: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_14:
	mov	0x24, %r14
	.word 0xf2db84a0  ! 200: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T3_asi_reg_rd_15:
	mov	0x2, %r14
	.word 0xfcdb89e0  ! 201: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	ta	T_CHANGE_NONHPRIV
	.word 0xfa75a19d  ! 205: STX_I	stx	%r29, [%r22 + 0x019d]
T3_asi_reg_rd_16:
	mov	0x25, %r14
	.word 0xf4db89e0  ! 206: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	ta	T_CHANGE_HPRIV
iob_intr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_18), 16, 16)) -> intp(3, 0, f)
	.word 0xf6740000  ! 209: STX_R	stx	%r27, [%r16 + %r0]
	.word 0xf475c000  ! 212: STX_R	stx	%r26, [%r23 + %r0]
iob_intr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_19), 16, 16)) -> intp(3, 0, 3e)
T3_asi_reg_rd_17:
	mov	0x3c5, %r14
	.word 0xfadb8400  ! 214: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_20), 16, 16)) -> intp(3, 0, 16)
T3_asi_reg_rd_18:
	mov	0x26, %r14
	.word 0xf8db8e40  ! 220: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbe156081  ! 221: OR_I	or 	%r21, 0x0081, %r31
	.word 0xf8b5a046  ! 223: STHA_I	stha	%r28, [%r22 + 0x0046] %asi
	.word 0xf82c8000  ! 225: STB_R	stb	%r28, [%r18 + %r0]
T3_asi_reg_wr_14:
	mov	0xd, %r14
	.word 0xf6f384a0  ! 227: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_3_10:
	setx	0x1d0217, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_11:
	setx	0x1c032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfead2168  ! 230: STBA_I	stba	%r31, [%r20 + 0x0168] %asi
iob_intr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_21), 16, 16)) -> intp(3, 0, 15)
T3_asi_reg_wr_15:
	mov	0x30, %r14
	.word 0xf2f38400  ! 235: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	.word 0xfe35c000  ! 242: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xf6aca11e  ! 243: STBA_I	stba	%r27, [%r18 + 0x011e] %asi
T3_asi_reg_rd_19:
	mov	0x2f, %r14
	.word 0xf0db89e0  ! 244: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_3_12:
	setx	0x1d0103, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_13:
	setx	0x1c0201, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_20:
	mov	0xc, %r14
	.word 0xfcdb8e60  ! 255: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf4adc020  ! 259: STBA_R	stba	%r26, [%r23 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_16:
	mov	0x3c5, %r14
	.word 0xfef38400  ! 261: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_3_14:
	setx	0x1c0334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaad0020  ! 263: STBA_R	stba	%r29, [%r20 + %r0] 0x01
T3_asi_reg_rd_21:
	mov	0x3c6, %r14
	.word 0xfcdb84a0  ! 267: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xfcaca03e  ! 272: STBA_I	stba	%r30, [%r18 + 0x003e] %asi
iob_intr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_22), 16, 16)) -> intp(3, 0, 33)
	.word 0xb23dc000  ! 274: XNOR_R	xnor 	%r23, %r0, %r25
cpu_intr_3_15:
	setx	0x1d0118, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_17:
	mov	0x1d, %r14
	.word 0xf8f389e0  ! 284: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf2754000  ! 285: STX_R	stx	%r25, [%r21 + %r0]
iob_intr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_23), 16, 16)) -> intp(3, 0, 35)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf0a5c020  ! 288: STWA_R	stwa	%r24, [%r23 + %r0] 0x01
iob_intr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_24), 16, 16)) -> intp(3, 0, 4)
cpu_intr_3_16:
	setx	0x1d0019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a5e194  ! 295: STWA_I	stwa	%r28, [%r23 + 0x0194] %asi
T3_asi_reg_rd_22:
	mov	0x0, %r14
	.word 0xf4db8400  ! 297: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_25), 16, 16)) -> intp(3, 0, 27)
	.word 0xf6b421de  ! 300: STHA_I	stha	%r27, [%r16 + 0x01de] %asi
iob_intr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_26), 16, 16)) -> intp(3, 0, 26)
cpu_intr_3_17:
	setx	0x1d0230, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_23:
	mov	0x2f, %r14
	.word 0xf4db84a0  ! 307: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_3_18:
	setx	0x1e0104, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_27), 16, 16)) -> intp(3, 0, 2a)
cpu_intr_3_19:
	setx	0x1d0209, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_18:
	mov	0x3c8, %r14
	.word 0xfef38400  ! 315: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_28), 16, 16)) -> intp(3, 0, 25)
iob_intr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_29), 16, 16)) -> intp(3, 0, c)
cpu_intr_3_20:
	setx	0x1f0335, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_21:
	setx	0x1e0331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca50020  ! 330: STWA_R	stwa	%r30, [%r20 + %r0] 0x01
	.word 0xfa2ce17a  ! 334: STB_I	stb	%r29, [%r19 + 0x017a]
iob_intr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_30), 16, 16)) -> intp(3, 0, 30)
	.word 0xf0740000  ! 340: STX_R	stx	%r24, [%r16 + %r0]
T3_asi_reg_rd_24:
	mov	0x11, %r14
	.word 0xf4db8e60  ! 342: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_31), 16, 16)) -> intp(3, 0, d)
	.word 0xf4a54020  ! 345: STWA_R	stwa	%r26, [%r21 + %r0] 0x01
	.word 0xf834c000  ! 347: STH_R	sth	%r28, [%r19 + %r0]
	.word 0xfca40020  ! 349: STWA_R	stwa	%r30, [%r16 + %r0] 0x01
	.word 0xf0f5e009  ! 353: STXA_I	stxa	%r24, [%r23 + 0x0009] %asi
iob_intr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_32), 16, 16)) -> intp(3, 0, 25)
	.word 0xf6b50020  ! 355: STHA_R	stha	%r27, [%r20 + %r0] 0x01
T3_asi_reg_rd_25:
	mov	0x3c6, %r14
	.word 0xfadb84a0  ! 356: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf6750000  ! 358: STX_R	stx	%r27, [%r20 + %r0]
	.word 0xf22da0ed  ! 359: STB_I	stb	%r25, [%r22 + 0x00ed]
	.word 0xbe2ce125  ! 361: ANDN_I	andn 	%r19, 0x0125, %r31
	.word 0xfcad4020  ! 365: STBA_R	stba	%r30, [%r21 + %r0] 0x01
T3_asi_reg_rd_26:
	mov	0x2d, %r14
	.word 0xfcdb8e40  ! 369: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb81c20a8  ! 370: XOR_I	xor 	%r16, 0x00a8, %r28
T3_asi_reg_wr_19:
	mov	0x22, %r14
	.word 0xf4f389e0  ! 371: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf6ad20d4  ! 372: STBA_I	stba	%r27, [%r20 + 0x00d4] %asi
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x819839c2  ! 373: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19c2, %hpstate
	.word 0xf474c000  ! 375: STX_R	stx	%r26, [%r19 + %r0]
	.word 0xfea4e15e  ! 377: STWA_I	stwa	%r31, [%r19 + 0x015e] %asi
	.word 0xb4b5c000  ! 379: ORNcc_R	orncc 	%r23, %r0, %r26
	.word 0xb0ad2131  ! 380: ANDNcc_I	andncc 	%r20, 0x0131, %r24
cpu_intr_3_22:
	setx	0x1d0207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea50020  ! 385: STWA_R	stwa	%r31, [%r20 + %r0] 0x01
T3_asi_reg_rd_27:
	mov	0x3c7, %r14
	.word 0xfcdb84a0  ! 387: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf6b4e078  ! 388: STHA_I	stha	%r27, [%r19 + 0x0078] %asi
iob_intr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_33), 16, 16)) -> intp(3, 0, 28)
	.word 0xfa2d6000  ! 392: STB_I	stb	%r29, [%r21 + 0x0000]
	.word 0xbe2c217e  ! 394: ANDN_I	andn 	%r16, 0x017e, %r31
	.word 0xb3347001  ! 396: SRLX_I	srlx	%r17, 0x0001, %r25
iob_intr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_34), 16, 16)) -> intp(3, 0, 27)
cpu_intr_3_23:
	setx	0x1e0001, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_35), 16, 16)) -> intp(3, 0, 18)
iob_intr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_36), 16, 16)) -> intp(3, 0, 3e)
cpu_intr_3_24:
	setx	0x1c0131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab40020  ! 407: STHA_R	stha	%r29, [%r16 + %r0] 0x01
	.word 0xbf2cf001  ! 413: SLLX_I	sllx	%r19, 0x0001, %r31
T3_asi_reg_rd_28:
	mov	0x3c6, %r14
	.word 0xfedb8400  ! 414: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xfa34200a  ! 416: STH_I	sth	%r29, [%r16 + 0x000a]
	.word 0xf6b42089  ! 418: STHA_I	stha	%r27, [%r16 + 0x0089] %asi
T3_asi_reg_rd_29:
	mov	0x1a, %r14
	.word 0xf6db8400  ! 420: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf0a4c020  ! 421: STWA_R	stwa	%r24, [%r19 + %r0] 0x01
	.word 0xf6b58020  ! 423: STHA_R	stha	%r27, [%r22 + %r0] 0x01
T3_asi_reg_rd_30:
	mov	0x3c6, %r14
	.word 0xfcdb8e40  ! 425: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf6340000  ! 427: STH_R	sth	%r27, [%r16 + %r0]
T3_asi_reg_rd_31:
	mov	0x1d, %r14
	.word 0xf8db8400  ! 428: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xfaf4605c  ! 433: STXA_I	stxa	%r29, [%r17 + 0x005c] %asi
cpu_intr_3_25:
	setx	0x1e033b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_26:
	setx	0x1c0001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8bd21c0  ! 436: XNORcc_I	xnorcc 	%r20, 0x01c0, %r28
	.word 0xfe250000  ! 437: STW_R	stw	%r31, [%r20 + %r0]
iob_intr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_37), 16, 16)) -> intp(3, 0, 1b)
iob_intr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_38), 16, 16)) -> intp(3, 0, 35)
	.word 0xbc3de0a9  ! 444: XNOR_I	xnor 	%r23, 0x00a9, %r30
T3_asi_reg_rd_32:
	mov	0x3c3, %r14
	.word 0xf8db8e80  ! 448: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xfa2c209d  ! 450: STB_I	stb	%r29, [%r16 + 0x009d]
T3_asi_reg_rd_33:
	mov	0x3c6, %r14
	.word 0xfedb89e0  ! 451: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T3_asi_reg_rd_34:
	mov	0x20, %r14
	.word 0xfadb89e0  ! 456: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_39), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_27:
	setx	0x220018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf635e01d  ! 460: STH_I	sth	%r27, [%r23 + 0x001d]
	.word 0xf22c606f  ! 465: STB_I	stb	%r25, [%r17 + 0x006f]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_40), 16, 16)) -> intp(3, 0, 14)
	.word 0xf42cc000  ! 476: STB_R	stb	%r26, [%r19 + %r0]
	.word 0xf6f56008  ! 478: STXA_I	stxa	%r27, [%r21 + 0x0008] %asi
	.word 0xf4b52000  ! 479: STHA_I	stha	%r26, [%r20 + 0x0000] %asi
cpu_intr_3_28:
	setx	0x220313, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_20:
	mov	0x2, %r14
	.word 0xf6f38e40  ! 486: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983992  ! 490: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1992, %hpstate
	.word 0xfc348000  ! 492: STH_R	sth	%r30, [%r18 + %r0]
	.word 0xb62da126  ! 494: ANDN_I	andn 	%r22, 0x0126, %r27
	.word 0xf0a54020  ! 495: STWA_R	stwa	%r24, [%r21 + %r0] 0x01
	.word 0xfa7521b0  ! 496: STX_I	stx	%r29, [%r20 + 0x01b0]
T3_asi_reg_wr_21:
	mov	0x17, %r14
	.word 0xf0f38e40  ! 498: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf43460cd  ! 499: STH_I	sth	%r26, [%r17 + 0x00cd]
iob_intr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_41), 16, 16)) -> intp(3, 0, 3)
	.word 0xf4b44020  ! 503: STHA_R	stha	%r26, [%r17 + %r0] 0x01
	.word 0xf6f5e1ed  ! 505: STXA_I	stxa	%r27, [%r23 + 0x01ed] %asi
	.word 0xf224a0d4  ! 509: STW_I	stw	%r25, [%r18 + 0x00d4]
	.word 0xf2ad2196  ! 511: STBA_I	stba	%r25, [%r20 + 0x0196] %asi
T3_asi_reg_rd_35:
	mov	0x3c0, %r14
	.word 0xf2db8e60  ! 512: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983e00  ! 514: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e00, %hpstate
	.word 0xf835e1b9  ! 516: STH_I	sth	%r28, [%r23 + 0x01b9]
	.word 0xf2344000  ! 517: STH_R	sth	%r25, [%r17 + %r0]
cpu_intr_3_29:
	setx	0x220135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab58020  ! 521: STHA_R	stha	%r29, [%r22 + %r0] 0x01
T3_asi_reg_wr_22:
	mov	0x2e, %r14
	.word 0xf2f384a0  ! 522: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf42ca0e5  ! 527: STB_I	stb	%r26, [%r18 + 0x00e5]
	.word 0xb695a1e5  ! 528: ORcc_I	orcc 	%r22, 0x01e5, %r27
iob_intr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_42), 16, 16)) -> intp(3, 0, 38)
	.word 0xf0b50020  ! 533: STHA_R	stha	%r24, [%r20 + %r0] 0x01
T3_asi_reg_wr_23:
	mov	0x35, %r14
	.word 0xfaf384a0  ! 534: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xfc2dc000  ! 535: STB_R	stb	%r30, [%r23 + %r0]
iob_intr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_43), 16, 16)) -> intp(3, 0, 18)
cpu_intr_3_30:
	setx	0x220211, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_44), 16, 16)) -> intp(3, 0, e)
iob_intr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_45), 16, 16)) -> intp(3, 0, 14)
	.word 0xb6b58000  ! 547: ORNcc_R	orncc 	%r22, %r0, %r27
cpu_intr_3_31:
	setx	0x210027, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf0b4c020  ! 551: STHA_R	stha	%r24, [%r19 + %r0] 0x01
	.word 0xfaf5a0d8  ! 552: STXA_I	stxa	%r29, [%r22 + 0x00d8] %asi
	.word 0xf4ace19c  ! 554: STBA_I	stba	%r26, [%r19 + 0x019c] %asi
iob_intr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_46), 16, 16)) -> intp(3, 0, 34)
T3_asi_reg_rd_36:
	mov	0xf, %r14
	.word 0xf6db84a0  ! 558: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_47), 16, 16)) -> intp(3, 0, 3e)
	.word 0xfeb58020  ! 561: STHA_R	stha	%r31, [%r22 + %r0] 0x01
cpu_intr_3_32:
	setx	0x210102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22cc000  ! 566: STB_R	stb	%r25, [%r19 + %r0]
T3_asi_reg_rd_37:
	mov	0x2, %r14
	.word 0xf0db8e60  ! 567: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T3_asi_reg_rd_38:
	mov	0x3c5, %r14
	.word 0xfadb8e40  ! 570: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_39:
	mov	0x2e, %r14
	.word 0xf0db8e40  ! 572: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	setx	data_start_0, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x819838ca  ! 573: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18ca, %hpstate
	.word 0xfaa561cf  ! 575: STWA_I	stwa	%r29, [%r21 + 0x01cf] %asi
	ta	T_CHANGE_TO_TL0
cpu_intr_3_33:
	setx	0x200202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb93dd000  ! 578: SRAX_R	srax	%r23, %r0, %r28
	.word 0xf0f520a9  ! 579: STXA_I	stxa	%r24, [%r20 + 0x00a9] %asi
cpu_intr_3_34:
	setx	0x220106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2c4000  ! 586: STB_R	stb	%r30, [%r17 + %r0]
T3_asi_reg_wr_24:
	mov	0x17, %r14
	.word 0xf6f38400  ! 587: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T3_asi_reg_rd_40:
	mov	0x3c3, %r14
	.word 0xf0db89e0  ! 588: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T3_asi_reg_wr_25:
	mov	0x31, %r14
	.word 0xf4f384a0  ! 589: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf82561f9  ! 592: STW_I	stw	%r28, [%r21 + 0x01f9]
T3_asi_reg_rd_41:
	mov	0x3c7, %r14
	.word 0xf0db8e40  ! 596: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_42:
	mov	0x2d, %r14
	.word 0xf2db84a0  ! 598: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T3_asi_reg_rd_43:
	mov	0x2c, %r14
	.word 0xfadb8e40  ! 599: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbe452164  ! 600: ADDC_I	addc 	%r20, 0x0164, %r31
T3_asi_reg_wr_26:
	mov	0x25, %r14
	.word 0xf0f38e60  ! 601: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xf4b5a144  ! 604: STHA_I	stha	%r26, [%r22 + 0x0144] %asi
iob_intr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_48), 16, 16)) -> intp(3, 0, 35)
cpu_intr_3_35:
	setx	0x220014, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_27:
	mov	0x34, %r14
	.word 0xf0f38e40  ! 612: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_49), 16, 16)) -> intp(3, 0, 1)
	.word 0xf02d8000  ! 616: STB_R	stb	%r24, [%r22 + %r0]
	.word 0xfcb5c020  ! 617: STHA_R	stha	%r30, [%r23 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_28:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 622: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf4a56133  ! 623: STWA_I	stwa	%r26, [%r21 + 0x0133] %asi
	.word 0xf6a5c020  ! 624: STWA_R	stwa	%r27, [%r23 + %r0] 0x01
	.word 0xf8348000  ! 626: STH_R	sth	%r28, [%r18 + %r0]
T3_asi_reg_wr_29:
	mov	0x1b, %r14
	.word 0xf2f38e40  ! 627: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_30:
	mov	0x2a, %r14
	.word 0xf8f384a0  ! 629: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T3_asi_reg_wr_31:
	mov	0x34, %r14
	.word 0xf0f38e40  ! 631: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf4a40020  ! 633: STWA_R	stwa	%r26, [%r16 + %r0] 0x01
	.word 0xf824e08e  ! 637: STW_I	stw	%r28, [%r19 + 0x008e]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_36:
	setx	0x20010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcad60b5  ! 647: STBA_I	stba	%r30, [%r21 + 0x00b5] %asi
T3_asi_reg_wr_32:
	mov	0x3c6, %r14
	.word 0xfcf384a0  ! 648: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb1504000  ! 650: RDPR_TNPC	rdpr	%tnpc, %r24
iob_intr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_50), 16, 16)) -> intp(3, 0, 11)
cpu_intr_3_37:
	setx	0x200030, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_51), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_38:
	setx	0x200231, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_44:
	mov	0x3c1, %r14
	.word 0xfadb84a0  ! 661: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T3_asi_reg_wr_33:
	mov	0x2e, %r14
	.word 0xf4f38e40  ! 664: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb2948000  ! 665: ORcc_R	orcc 	%r18, %r0, %r25
iob_intr_3_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_52), 16, 16)) -> intp(3, 0, 5)
iob_intr_3_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_53), 16, 16)) -> intp(3, 0, 1)
	.word 0xb33d7001  ! 669: SRAX_I	srax	%r21, 0x0001, %r25
iob_intr_3_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_54), 16, 16)) -> intp(3, 0, d)
	.word 0xf875e154  ! 672: STX_I	stx	%r28, [%r23 + 0x0154]
T3_asi_reg_rd_45:
	mov	0x11, %r14
	.word 0xf4db8e80  ! 673: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982b40  ! 675: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b40, %hpstate
cpu_intr_3_39:
	setx	0x220205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa5a0cf  ! 682: STWA_I	stwa	%r29, [%r22 + 0x00cf] %asi
T3_asi_reg_wr_34:
	mov	0x29, %r14
	.word 0xf2f38e60  ! 687: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_3_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_55), 16, 16)) -> intp(3, 0, 3d)
cpu_intr_3_40:
	setx	0x220232, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_56), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_rd_46:
	mov	0x38, %r14
	.word 0xfedb84a0  ! 691: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xba0c8000  ! 692: AND_R	and 	%r18, %r0, %r29
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982c90  ! 693: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c90, %hpstate
iob_intr_3_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_57), 16, 16)) -> intp(3, 0, 22)
iob_intr_3_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_58), 16, 16)) -> intp(3, 0, 3)
cpu_intr_3_41:
	setx	0x21002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe74e12a  ! 699: STX_I	stx	%r31, [%r19 + 0x012a]
	.word 0xbe858000  ! 701: ADDcc_R	addcc 	%r22, %r0, %r31
T3_asi_reg_rd_47:
	mov	0x12, %r14
	.word 0xf2db8e60  ! 702: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb23cc000  ! 704: XNOR_R	xnor 	%r19, %r0, %r25
T3_asi_reg_wr_35:
	mov	0x3c0, %r14
	.word 0xfef384a0  ! 707: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T3_asi_reg_wr_36:
	mov	0x3c7, %r14
	.word 0xfcf38e40  ! 708: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_42:
	setx	0x230224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3da001  ! 712: SRA_I	sra 	%r22, 0x0001, %r29
T3_asi_reg_wr_37:
	mov	0x10, %r14
	.word 0xf4f38e40  ! 713: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_3_43:
	setx	0x220300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6348000  ! 716: STH_R	sth	%r27, [%r18 + %r0]
cpu_intr_3_44:
	setx	0x200216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf675601c  ! 718: STX_I	stx	%r27, [%r21 + 0x001c]
	.word 0xf835e1f0  ! 720: STH_I	sth	%r28, [%r23 + 0x01f0]
T3_asi_reg_wr_38:
	mov	0x2e, %r14
	.word 0xf8f38e40  ! 723: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	.word 0xf8342152  ! 726: STH_I	sth	%r28, [%r16 + 0x0152]
	.word 0xf6b5c020  ! 727: STHA_R	stha	%r27, [%r23 + %r0] 0x01
T3_asi_reg_rd_48:
	mov	0x3c3, %r14
	.word 0xf0db84a0  ! 729: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb72d5000  ! 731: SLLX_R	sllx	%r21, %r0, %r27
	.word 0xfab4a011  ! 732: STHA_I	stha	%r29, [%r18 + 0x0011] %asi
	.word 0xf4b48020  ! 733: STHA_R	stha	%r26, [%r18 + %r0] 0x01
	.word 0xfa2d4000  ! 735: STB_R	stb	%r29, [%r21 + %r0]
	.word 0xf8242007  ! 737: STW_I	stw	%r28, [%r16 + 0x0007]
T3_asi_reg_wr_39:
	mov	0x33, %r14
	.word 0xf8f389e0  ! 738: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_3_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_59), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_rd_49:
	mov	0x3c3, %r14
	.word 0xfedb8400  ! 741: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xfcad4020  ! 744: STBA_R	stba	%r30, [%r21 + %r0] 0x01
T3_asi_reg_wr_40:
	mov	0x3c5, %r14
	.word 0xf6f38e80  ! 748: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T3_asi_reg_rd_50:
	mov	0x18, %r14
	.word 0xf6db84a0  ! 750: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_3_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_60), 16, 16)) -> intp(3, 0, 2f)
	.word 0xbb3d5000  ! 754: SRAX_R	srax	%r21, %r0, %r29
	.word 0xf02ce03e  ! 755: STB_I	stb	%r24, [%r19 + 0x003e]
	.word 0xf4a58020  ! 758: STWA_R	stwa	%r26, [%r22 + %r0] 0x01
cpu_intr_3_45:
	setx	0x230233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0240000  ! 760: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xfa2ce1ed  ! 762: STB_I	stb	%r29, [%r19 + 0x01ed]
	.word 0xf6b50020  ! 763: STHA_R	stha	%r27, [%r20 + %r0] 0x01
iob_intr_3_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_61), 16, 16)) -> intp(3, 0, 24)
	.word 0xf8b54020  ! 768: STHA_R	stha	%r28, [%r21 + %r0] 0x01
cpu_intr_3_46:
	setx	0x200010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea58020  ! 771: STWA_R	stwa	%r31, [%r22 + %r0] 0x01
	.word 0xfc242099  ! 774: STW_I	stw	%r30, [%r16 + 0x0099]
iob_intr_3_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_62), 16, 16)) -> intp(3, 0, a)
cpu_intr_3_47:
	setx	0x22020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfc75a121  ! 785: STX_I	stx	%r30, [%r22 + 0x0121]
	.word 0xfab46032  ! 787: STHA_I	stha	%r29, [%r17 + 0x0032] %asi
	.word 0xb42d605c  ! 788: ANDN_I	andn 	%r21, 0x005c, %r26
T3_asi_reg_wr_41:
	mov	0x3c7, %r14
	.word 0xfef389e0  ! 789: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T3_asi_reg_wr_42:
	mov	0x9, %r14
	.word 0xf4f38e60  ! 792: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf6f4a0b7  ! 795: STXA_I	stxa	%r27, [%r18 + 0x00b7] %asi
iob_intr_3_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_63), 16, 16)) -> intp(3, 0, 6)
iob_intr_3_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_64), 16, 16)) -> intp(3, 0, 1f)
iob_intr_3_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_65), 16, 16)) -> intp(3, 0, 9)
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982a1a  ! 800: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1a, %hpstate
	.word 0xfaac2167  ! 801: STBA_I	stba	%r29, [%r16 + 0x0167] %asi
T3_asi_reg_rd_51:
	mov	0x23, %r14
	.word 0xf6db89e0  ! 802: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_3_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_66), 16, 16)) -> intp(3, 0, 18)
T3_asi_reg_wr_43:
	mov	0x35, %r14
	.word 0xf8f389e0  ! 806: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_3_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_67), 16, 16)) -> intp(3, 0, 35)
	.word 0xfea54020  ! 808: STWA_R	stwa	%r31, [%r21 + %r0] 0x01
	.word 0xfa24e07d  ! 809: STW_I	stw	%r29, [%r19 + 0x007d]
T3_asi_reg_rd_52:
	mov	0x18, %r14
	.word 0xfadb8400  ! 813: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xfe35e082  ! 814: STH_I	sth	%r31, [%r23 + 0x0082]
T3_asi_reg_rd_53:
	mov	0x30, %r14
	.word 0xf6db84a0  ! 817: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xfa74603a  ! 820: STX_I	stx	%r29, [%r17 + 0x003a]
	.word 0xf4a4c020  ! 822: STWA_R	stwa	%r26, [%r19 + %r0] 0x01
	.word 0xf4348000  ! 826: STH_R	sth	%r26, [%r18 + %r0]
cpu_intr_3_48:
	setx	0x210213, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982d42  ! 830: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d42, %hpstate
T3_asi_reg_rd_54:
	mov	0x3c4, %r14
	.word 0xfadb8e80  ! 831: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T3_asi_reg_wr_44:
	mov	0x3c6, %r14
	.word 0xfaf384a0  ! 835: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb82d20f6  ! 836: ANDN_I	andn 	%r20, 0x00f6, %r28
T3_asi_reg_wr_45:
	mov	0xa, %r14
	.word 0xf0f384a0  ! 837: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T3_asi_reg_wr_46:
	mov	0x3c7, %r14
	.word 0xf8f384a0  ! 839: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_3_49:
	setx	0x230314, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_3_50:
	setx	0x20033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6352191  ! 845: STH_I	sth	%r27, [%r20 + 0x0191]
	.word 0xf8ad6023  ! 846: STBA_I	stba	%r28, [%r21 + 0x0023] %asi
	.word 0xb92d7001  ! 848: SLLX_I	sllx	%r21, 0x0001, %r28
iob_intr_3_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_68), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf0ac21f5  ! 850: STBA_I	stba	%r24, [%r16 + 0x01f5] %asi
	.word 0xf2ad0020  ! 854: STBA_R	stba	%r25, [%r20 + %r0] 0x01
cpu_intr_3_51:
	setx	0x210220, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_52:
	setx	0x200302, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
cpu_intr_3_53:
	setx	0x230212, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_54:
	setx	0x200238, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_47:
	mov	0xb, %r14
	.word 0xf0f38e60  ! 870: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xf625205a  ! 871: STW_I	stw	%r27, [%r20 + 0x005a]
iob_intr_3_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_69), 16, 16)) -> intp(3, 0, 3d)
T3_asi_reg_wr_48:
	mov	0x3c8, %r14
	.word 0xfcf389e0  ! 874: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_3_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_70), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf0ade0b0  ! 885: STBA_I	stba	%r24, [%r23 + 0x00b0] %asi
	.word 0xf8f560d5  ! 886: STXA_I	stxa	%r28, [%r21 + 0x00d5] %asi
iob_intr_3_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_71), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_55:
	setx	0x200215, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_55:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 893: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	ta	T_CHANGE_TO_TL1
cpu_intr_3_56:
	setx	0x220113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4040000  ! 897: ADD_R	add 	%r16, %r0, %r26
iob_intr_3_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_72), 16, 16)) -> intp(3, 0, 15)
iob_intr_3_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_73), 16, 16)) -> intp(3, 0, d)
cpu_intr_3_57:
	setx	0x260330, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_74), 16, 16)) -> intp(3, 0, 22)
T3_asi_reg_rd_56:
	mov	0x13, %r14
	.word 0xf4db89e0  ! 906: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf2758000  ! 908: STX_R	stx	%r25, [%r22 + %r0]
	.word 0xf4b58020  ! 913: STHA_R	stha	%r26, [%r22 + %r0] 0x01
iob_intr_3_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_75), 16, 16)) -> intp(3, 0, 8)
T3_asi_reg_wr_49:
	mov	0x38, %r14
	.word 0xf4f384a0  ! 916: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_3_58:
	setx	0x270036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcf4e124  ! 918: STXA_I	stxa	%r30, [%r19 + 0x0124] %asi
	ta	T_CHANGE_TO_TL0
iob_intr_3_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_76), 16, 16)) -> intp(3, 0, 23)
cpu_intr_3_59:
	setx	0x27011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53dc000  ! 926: SRA_R	sra 	%r23, %r0, %r26
	.word 0xf2f4216d  ! 927: STXA_I	stxa	%r25, [%r16 + 0x016d] %asi
	.word 0xf4a48020  ! 929: STWA_R	stwa	%r26, [%r18 + %r0] 0x01
	.word 0xf0acc020  ! 930: STBA_R	stba	%r24, [%r19 + %r0] 0x01
	.word 0xfc2de19d  ! 931: STB_I	stb	%r30, [%r23 + 0x019d]
	.word 0xf8b4e009  ! 932: STHA_I	stha	%r28, [%r19 + 0x0009] %asi
	.word 0xfef5a1a2  ! 935: STXA_I	stxa	%r31, [%r22 + 0x01a2] %asi
	.word 0x8d9520fd  ! 937: WRPR_PSTATE_I	wrpr	%r20, 0x00fd, %pstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf82d8000  ! 940: STB_R	stb	%r28, [%r22 + %r0]
iob_intr_3_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_77), 16, 16)) -> intp(3, 0, 19)
	.word 0xf475e04e  ! 942: STX_I	stx	%r26, [%r23 + 0x004e]
T3_asi_reg_rd_57:
	mov	0xb, %r14
	.word 0xf8db8400  ! 944: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T3_asi_reg_wr_50:
	mov	0xc, %r14
	.word 0xf2f38400  ! 945: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_3_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_78), 16, 16)) -> intp(3, 0, c)
iob_intr_3_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_79), 16, 16)) -> intp(3, 0, 3f)
cpu_intr_3_60:
	setx	0x250322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_61:
	setx	0x27031b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_58:
	mov	0x32, %r14
	.word 0xf2db8e80  ! 957: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf675e1c3  ! 962: STX_I	stx	%r27, [%r23 + 0x01c3]
	.word 0xb0bd8000  ! 967: XNORcc_R	xnorcc 	%r22, %r0, %r24
	.word 0xfa244000  ! 969: STW_R	stw	%r29, [%r17 + %r0]
cpu_intr_3_62:
	setx	0x260018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba8ca096  ! 975: ANDcc_I	andcc 	%r18, 0x0096, %r29
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983d5a  ! 977: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d5a, %hpstate
	.word 0xbab4209e  ! 978: SUBCcc_I	orncc 	%r16, 0x009e, %r29
cpu_intr_3_63:
	setx	0x240113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_80), 16, 16)) -> intp(3, 0, 14)
iob_intr_3_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_81), 16, 16)) -> intp(3, 0, 5)
cpu_intr_3_64:
	setx	0x260118, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x8198381a  ! 986: WRHPR_HPSTATE_I	wrhpr	%r0, 0x181a, %hpstate
cpu_intr_3_65:
	setx	0x250236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc1d8000  ! 990: XOR_R	xor 	%r22, %r0, %r30
	.word 0xf8258000  ! 992: STW_R	stw	%r28, [%r22 + %r0]
	.word 0xfa2cc000  ! 994: STB_R	stb	%r29, [%r19 + %r0]
	.word 0xb9504000  ! 995: RDPR_TNPC	rdpr	%tnpc, %r28
cpu_intr_3_66:
	setx	0x25010d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_51:
	mov	0x3c8, %r14
	.word 0xf6f384a0  ! 997: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xfaac613e  ! 998: STBA_I	stba	%r29, [%r17 + 0x013e] %asi
cpu_intr_3_67:
	setx	0x240225, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_59:
	mov	0x15, %r14
	.word 0xf2db89e0  ! 1002: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xfa2ca1e5  ! 1004: STB_I	stb	%r29, [%r18 + 0x01e5]
	.word 0xf22d0000  ! 1006: STB_R	stb	%r25, [%r20 + %r0]
cpu_intr_3_68:
	setx	0x26003f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_52:
	mov	0x2f, %r14
	.word 0xf4f38e80  ! 1009: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982a8a  ! 1010: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8a, %hpstate
	.word 0xf4ad8020  ! 1015: STBA_R	stba	%r26, [%r22 + %r0] 0x01
	.word 0xfe242064  ! 1017: STW_I	stw	%r31, [%r16 + 0x0064]
	.word 0xfe2421c3  ! 1018: STW_I	stw	%r31, [%r16 + 0x01c3]
	.word 0xfaa56092  ! 1019: STWA_I	stwa	%r29, [%r21 + 0x0092] %asi
cpu_intr_3_69:
	setx	0x24002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2244000  ! 1021: STW_R	stw	%r25, [%r17 + %r0]
	.word 0xbf358000  ! 1022: SRL_R	srl 	%r22, %r0, %r31
T3_asi_reg_rd_60:
	mov	0xb, %r14
	.word 0xf8db8e60  ! 1025: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0x8194e140  ! 1026: WRPR_TPC_I	wrpr	%r19, 0x0140, %tpc
cpu_intr_3_70:
	setx	0x240130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa34e112  ! 1029: STH_I	sth	%r29, [%r19 + 0x0112]
	.word 0xba0d2044  ! 1030: AND_I	and 	%r20, 0x0044, %r29
	.word 0xf0a48020  ! 1034: STWA_R	stwa	%r24, [%r18 + %r0] 0x01
	.word 0xf6b5e003  ! 1036: STHA_I	stha	%r27, [%r23 + 0x0003] %asi
	.word 0xf034e0c7  ! 1038: STH_I	sth	%r24, [%r19 + 0x00c7]
iob_intr_3_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_82), 16, 16)) -> intp(3, 0, 29)
	.word 0xfe34a0df  ! 1041: STH_I	sth	%r31, [%r18 + 0x00df]
cpu_intr_3_71:
	setx	0x260039, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_72:
	setx	0x25002c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_73:
	setx	0x260106, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_83), 16, 16)) -> intp(3, 0, 3a)
T3_asi_reg_rd_61:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 1049: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_rd_62:
	mov	0x12, %r14
	.word 0xf0db8e40  ! 1052: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_rd_63:
	mov	0x2e, %r14
	.word 0xf0db8e80  ! 1053: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xfe2d21ad  ! 1057: STB_I	stb	%r31, [%r20 + 0x01ad]
	.word 0xbe8ce1a7  ! 1058: ANDcc_I	andcc 	%r19, 0x01a7, %r31
	ta	T_CHANGE_TO_TL0
	.word 0xf42d4000  ! 1060: STB_R	stb	%r26, [%r21 + %r0]
	ta	T_CHANGE_TO_TL0
	.word 0xf0750000  ! 1062: STX_R	stx	%r24, [%r20 + %r0]
	.word 0xf0b4e151  ! 1063: STHA_I	stha	%r24, [%r19 + 0x0151] %asi
	.word 0xb82d8000  ! 1065: ANDN_R	andn 	%r22, %r0, %r28
	.word 0xf234a1fc  ! 1067: STH_I	sth	%r25, [%r18 + 0x01fc]
	.word 0xfe7421ff  ! 1072: STX_I	stx	%r31, [%r16 + 0x01ff]
T3_asi_reg_wr_53:
	mov	0x0, %r14
	.word 0xf2f38e40  ! 1073: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfaa40020  ! 1074: STWA_R	stwa	%r29, [%r16 + %r0] 0x01
	.word 0xf0f4a0c6  ! 1076: STXA_I	stxa	%r24, [%r18 + 0x00c6] %asi
cpu_intr_3_74:
	setx	0x25020b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_84), 16, 16)) -> intp(3, 0, 15)
	.word 0xfead8020  ! 1081: STBA_R	stba	%r31, [%r22 + %r0] 0x01
cpu_intr_3_75:
	setx	0x240215, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_64:
	mov	0x2b, %r14
	.word 0xf6db8e80  ! 1087: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_3_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_85), 16, 16)) -> intp(3, 0, b)
	.word 0xf0a40020  ! 1090: STWA_R	stwa	%r24, [%r16 + %r0] 0x01
	.word 0xf0a5e156  ! 1091: STWA_I	stwa	%r24, [%r23 + 0x0156] %asi
	.word 0xfea4213d  ! 1093: STWA_I	stwa	%r31, [%r16 + 0x013d] %asi
	.word 0xfa352084  ! 1094: STH_I	sth	%r29, [%r20 + 0x0084]
T3_asi_reg_rd_65:
	mov	0x16, %r14
	.word 0xf0db8e40  ! 1095: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_3_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_86), 16, 16)) -> intp(3, 0, 24)
iob_intr_3_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_87), 16, 16)) -> intp(3, 0, a)
iob_intr_3_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_88), 16, 16)) -> intp(3, 0, 31)
	.word 0xf8b48020  ! 1103: STHA_R	stha	%r28, [%r18 + %r0] 0x01
cpu_intr_3_76:
	setx	0x24003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb02d8000  ! 1106: ANDN_R	andn 	%r22, %r0, %r24
cpu_intr_3_77:
	setx	0x24022a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_78:
	setx	0x270222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc740000  ! 1113: STX_R	stx	%r30, [%r16 + %r0]
	.word 0xf6f4a0a9  ! 1114: STXA_I	stxa	%r27, [%r18 + 0x00a9] %asi
	.word 0xf6aca17a  ! 1116: STBA_I	stba	%r27, [%r18 + 0x017a] %asi
T3_asi_reg_rd_66:
	mov	0x10, %r14
	.word 0xfedb8400  ! 1117: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_3_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_89), 16, 16)) -> intp(3, 0, 32)
T3_asi_reg_rd_67:
	mov	0x15, %r14
	.word 0xf4db89e0  ! 1119: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf0f4a04b  ! 1122: STXA_I	stxa	%r24, [%r18 + 0x004b] %asi
iob_intr_3_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_90), 16, 16)) -> intp(3, 0, 39)
	.word 0xfe756190  ! 1130: STX_I	stx	%r31, [%r21 + 0x0190]
iob_intr_3_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_91), 16, 16)) -> intp(3, 0, 3b)
	.word 0xb48d61bd  ! 1135: ANDcc_I	andcc 	%r21, 0x01bd, %r26
cpu_intr_3_79:
	setx	0x270313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0254000  ! 1142: STW_R	stw	%r24, [%r21 + %r0]
T3_asi_reg_wr_54:
	mov	0xf, %r14
	.word 0xfaf38e40  ! 1143: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf2a48020  ! 1144: STWA_R	stwa	%r25, [%r18 + %r0] 0x01
	.word 0xf6a50020  ! 1147: STWA_R	stwa	%r27, [%r20 + %r0] 0x01
cpu_intr_3_80:
	setx	0x270037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12d0000  ! 1150: SLL_R	sll 	%r20, %r0, %r24
	.word 0xfcad8020  ! 1152: STBA_R	stba	%r30, [%r22 + %r0] 0x01
	.word 0xf0a40020  ! 1154: STWA_R	stwa	%r24, [%r16 + %r0] 0x01
cpu_intr_3_81:
	setx	0x250123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb60ce170  ! 1156: AND_I	and 	%r19, 0x0170, %r27
	.word 0xb49d21bc  ! 1157: XORcc_I	xorcc 	%r20, 0x01bc, %r26
T3_asi_reg_rd_68:
	mov	0xd, %r14
	.word 0xf2db8400  ! 1158: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_3_82:
	setx	0x240026, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_83:
	setx	0x20209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe9d6032  ! 1162: XORcc_I	xorcc 	%r21, 0x0032, %r31
T3_asi_reg_wr_55:
	mov	0x15, %r14
	.word 0xf8f38e80  ! 1164: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xfc25618b  ! 1166: STW_I	stw	%r30, [%r21 + 0x018b]
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	.word 0xf274e18b  ! 1170: STX_I	stx	%r25, [%r19 + 0x018b]
iob_intr_3_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_92), 16, 16)) -> intp(3, 0, 21)
iob_intr_3_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_93), 16, 16)) -> intp(3, 0, 3b)
iob_intr_3_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_94), 16, 16)) -> intp(3, 0, 35)
T3_asi_reg_wr_56:
	mov	0x16, %r14
	.word 0xf0f38e40  ! 1176: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb88c4000  ! 1179: ANDcc_R	andcc 	%r17, %r0, %r28
cpu_intr_3_84:
	setx	0x270034, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_57:
	mov	0x3c8, %r14
	.word 0xf6f38e60  ! 1184: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_3_85:
	setx	0x240030, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_58:
	mov	0x11, %r14
	.word 0xf8f38e80  ! 1189: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T3_asi_reg_rd_69:
	mov	0x34, %r14
	.word 0xf4db84a0  ! 1191: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf4350000  ! 1192: STH_R	sth	%r26, [%r20 + %r0]
T3_asi_reg_wr_59:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 1194: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983f98  ! 1196: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f98, %hpstate
T3_asi_reg_wr_60:
	mov	0x22, %r14
	.word 0xfcf38e80  ! 1197: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T3_asi_reg_rd_70:
	mov	0x3c7, %r14
	.word 0xfcdb8400  ! 1198: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf4ad0020  ! 1200: STBA_R	stba	%r26, [%r20 + %r0] 0x01
	.word 0xf2a4a049  ! 1201: STWA_I	stwa	%r25, [%r18 + 0x0049] %asi
cpu_intr_3_86:
	setx	0x24031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f4a0c9  ! 1206: STXA_I	stxa	%r25, [%r18 + 0x00c9] %asi
iob_intr_3_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_95), 16, 16)) -> intp(3, 0, 2f)
	.word 0xfc752033  ! 1209: STX_I	stx	%r30, [%r20 + 0x0033]
	.word 0xb2b561d9  ! 1210: ORNcc_I	orncc 	%r21, 0x01d9, %r25
T3_asi_reg_rd_71:
	mov	0x3c1, %r14
	.word 0xf6db8e40  ! 1211: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_87:
	setx	0x260020, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_88:
	setx	0x26033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe156078  ! 1216: OR_I	or 	%r21, 0x0078, %r31
	.word 0xfe2c600b  ! 1217: STB_I	stb	%r31, [%r17 + 0x000b]
	.word 0xbb347001  ! 1221: SRLX_I	srlx	%r17, 0x0001, %r29
	.word 0xb6352176  ! 1222: ORN_I	orn 	%r20, 0x0176, %r27
T3_asi_reg_rd_72:
	mov	0x37, %r14
	.word 0xf0db84a0  ! 1223: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb4958000  ! 1224: ORcc_R	orcc 	%r22, %r0, %r26
	.word 0xfc7461af  ! 1225: STX_I	stx	%r30, [%r17 + 0x01af]
cpu_intr_3_89:
	setx	0x270209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0240000  ! 1227: STW_R	stw	%r24, [%r16 + %r0]
iob_intr_3_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_96), 16, 16)) -> intp(3, 0, 33)
cpu_intr_3_90:
	setx	0x260304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_97), 16, 16)) -> intp(3, 0, 1d)
	.word 0xfe750000  ! 1233: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xfc756070  ! 1235: STX_I	stx	%r30, [%r21 + 0x0070]
	.word 0xbe94e1e1  ! 1237: ORcc_I	orcc 	%r19, 0x01e1, %r31
cpu_intr_3_91:
	setx	0x26033e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_92:
	setx	0x240000, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_61:
	mov	0x2b, %r14
	.word 0xf8f384a0  ! 1241: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_3_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_98), 16, 16)) -> intp(3, 0, 39)
iob_intr_3_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_99), 16, 16)) -> intp(3, 0, 0)
cpu_intr_3_93:
	setx	0x26013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc754000  ! 1248: STX_R	stx	%r30, [%r21 + %r0]
	.word 0xbebdc000  ! 1249: XNORcc_R	xnorcc 	%r23, %r0, %r31
	.word 0xfa24212f  ! 1250: STW_I	stw	%r29, [%r16 + 0x012f]
	.word 0xfa25e06f  ! 1251: STW_I	stw	%r29, [%r23 + 0x006f]
	.word 0xbb3de001  ! 1253: SRA_I	sra 	%r23, 0x0001, %r29
	.word 0xfa350000  ! 1254: STH_R	sth	%r29, [%r20 + %r0]
	.word 0xfa242063  ! 1255: STW_I	stw	%r29, [%r16 + 0x0063]
iob_intr_3_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_100), 16, 16)) -> intp(3, 0, 37)
	.word 0xb605e0ac  ! 1258: ADD_I	add 	%r23, 0x00ac, %r27
	.word 0xfc75201d  ! 1259: STX_I	stx	%r30, [%r20 + 0x001d]
	.word 0xfc254000  ! 1261: STW_R	stw	%r30, [%r21 + %r0]
	.word 0xf6344000  ! 1262: STH_R	sth	%r27, [%r17 + %r0]
	.word 0xf8b4a135  ! 1265: STHA_I	stha	%r28, [%r18 + 0x0135] %asi
cpu_intr_3_94:
	setx	0x27023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf275e0ea  ! 1269: STX_I	stx	%r25, [%r23 + 0x00ea]
	.word 0xf435c000  ! 1277: STH_R	sth	%r26, [%r23 + %r0]
	.word 0xfab4a0d9  ! 1279: STHA_I	stha	%r29, [%r18 + 0x00d9] %asi
	ta	T_CHANGE_TO_TL0
iob_intr_3_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_101), 16, 16)) -> intp(3, 0, 26)
	.word 0xf4f5e17b  ! 1286: STXA_I	stxa	%r26, [%r23 + 0x017b] %asi
	.word 0xfea46169  ! 1290: STWA_I	stwa	%r31, [%r17 + 0x0169] %asi
	.word 0xf8b46114  ! 1292: STHA_I	stha	%r28, [%r17 + 0x0114] %asi
iob_intr_3_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_102), 16, 16)) -> intp(3, 0, 27)
	.word 0xfeadc020  ! 1295: STBA_R	stba	%r31, [%r23 + %r0] 0x01
iob_intr_3_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_103), 16, 16)) -> intp(3, 0, f)
	.word 0xfa742149  ! 1299: STX_I	stx	%r29, [%r16 + 0x0149]
	.word 0x819521f6  ! 1301: WRPR_TPC_I	wrpr	%r20, 0x01f6, %tpc
iob_intr_3_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_104), 16, 16)) -> intp(3, 0, 16)
	ta	T_CHANGE_HPRIV
iob_intr_3_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_105), 16, 16)) -> intp(3, 0, c)
	.word 0xf2ad8020  ! 1308: STBA_R	stba	%r25, [%r22 + %r0] 0x01
T3_asi_reg_wr_62:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 1311: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_rd_73:
	mov	0xa, %r14
	.word 0xfadb8e60  ! 1313: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T3_asi_reg_rd_74:
	mov	0x1, %r14
	.word 0xf0db8e40  ! 1314: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf4ac8020  ! 1315: STBA_R	stba	%r26, [%r18 + %r0] 0x01
T3_asi_reg_rd_75:
	mov	0x3c7, %r14
	.word 0xf6db8e40  ! 1317: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf8b44020  ! 1318: STHA_R	stha	%r28, [%r17 + %r0] 0x01
cpu_intr_3_95:
	setx	0x26002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb2d7001  ! 1321: SLLX_I	sllx	%r21, 0x0001, %r29
cpu_intr_3_96:
	setx	0x27032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xfa754000  ! 1329: STX_R	stx	%r29, [%r21 + %r0]
T3_asi_reg_wr_63:
	mov	0x28, %r14
	.word 0xf2f384a0  ! 1331: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf634e071  ! 1332: STH_I	sth	%r27, [%r19 + 0x0071]
iob_intr_3_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_106), 16, 16)) -> intp(3, 0, 21)
iob_intr_3_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_107), 16, 16)) -> intp(3, 0, 0)
T3_asi_reg_wr_64:
	mov	0x8, %r14
	.word 0xf8f38e60  ! 1343: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb8240000  ! 1351: SUB_R	sub 	%r16, %r0, %r28
	.word 0xbcb56013  ! 1356: SUBCcc_I	orncc 	%r21, 0x0013, %r30
	.word 0xf6246094  ! 1357: STW_I	stw	%r27, [%r17 + 0x0094]
	.word 0xf425e1f9  ! 1360: STW_I	stw	%r26, [%r23 + 0x01f9]
T3_asi_reg_wr_65:
	mov	0xc, %r14
	.word 0xf0f38e60  ! 1364: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_3_97:
	setx	0x280319, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf2a48020  ! 1368: STWA_R	stwa	%r25, [%r18 + %r0] 0x01
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983b08  ! 1369: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b08, %hpstate
T3_asi_reg_rd_76:
	mov	0x2b, %r14
	.word 0xf0db8e80  ! 1370: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb3520000  ! 1371: RDPR_PIL	rdpr	%pil, %r25
cpu_intr_3_98:
	setx	0x280228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a54020  ! 1373: STWA_R	stwa	%r25, [%r21 + %r0] 0x01
T3_asi_reg_wr_66:
	mov	0x37, %r14
	.word 0xf0f389e0  ! 1378: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xfcac2161  ! 1384: STBA_I	stba	%r30, [%r16 + 0x0161] %asi
T3_asi_reg_rd_77:
	mov	0x28, %r14
	.word 0xfedb8400  ! 1386: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf02d0000  ! 1387: STB_R	stb	%r24, [%r20 + %r0]
iob_intr_3_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_108), 16, 16)) -> intp(3, 0, 11)
iob_intr_3_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_109), 16, 16)) -> intp(3, 0, 3b)
	.word 0xb28c4000  ! 1392: ANDcc_R	andcc 	%r17, %r0, %r25
T3_asi_reg_wr_67:
	mov	0x36, %r14
	.word 0xf0f38e80  ! 1393: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_3_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_110), 16, 16)) -> intp(3, 0, f)
iob_intr_3_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_111), 16, 16)) -> intp(3, 0, 18)
cpu_intr_3_99:
	setx	0x280325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf074c000  ! 1405: STX_R	stx	%r24, [%r19 + %r0]
	setx	data_start_1, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982d88  ! 1406: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d88, %hpstate
iob_intr_3_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_112), 16, 16)) -> intp(3, 0, 1)
	.word 0xfe758000  ! 1410: STX_R	stx	%r31, [%r22 + %r0]
	.word 0xb03de183  ! 1411: XNOR_I	xnor 	%r23, 0x0183, %r24
	.word 0xf8f5e132  ! 1413: STXA_I	stxa	%r28, [%r23 + 0x0132] %asi
	.word 0xf4a42154  ! 1414: STWA_I	stwa	%r26, [%r16 + 0x0154] %asi
	.word 0xf675a1e7  ! 1415: STX_I	stx	%r27, [%r22 + 0x01e7]
	.word 0xfeaca10d  ! 1417: STBA_I	stba	%r31, [%r18 + 0x010d] %asi
	.word 0xfc250000  ! 1418: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xb0b4e057  ! 1419: ORNcc_I	orncc 	%r19, 0x0057, %r24
	.word 0xb43c2030  ! 1420: XNOR_I	xnor 	%r16, 0x0030, %r26
	.word 0xf0f5a0b0  ! 1422: STXA_I	stxa	%r24, [%r22 + 0x00b0] %asi
iob_intr_3_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_113), 16, 16)) -> intp(3, 0, 15)
cpu_intr_3_100:
	setx	0x28011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ac0020  ! 1432: STBA_R	stba	%r27, [%r16 + %r0] 0x01
	.word 0xfaa4e15c  ! 1434: STWA_I	stwa	%r29, [%r19 + 0x015c] %asi
	.word 0xbc2c0000  ! 1436: ANDN_R	andn 	%r16, %r0, %r30
iob_intr_3_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_114), 16, 16)) -> intp(3, 0, 16)
iob_intr_3_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_115), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_rd_78:
	mov	0x3c5, %r14
	.word 0xf6db8e40  ! 1442: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb37d8400  ! 1448: MOVR_R	movre	%r22, %r0, %r25
iob_intr_3_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_116), 16, 16)) -> intp(3, 0, 2b)
iob_intr_3_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_117), 16, 16)) -> intp(3, 0, 15)
	.word 0xf2b58020  ! 1455: STHA_R	stha	%r25, [%r22 + %r0] 0x01
	.word 0xfef5e111  ! 1457: STXA_I	stxa	%r31, [%r23 + 0x0111] %asi
	.word 0xf2a50020  ! 1458: STWA_R	stwa	%r25, [%r20 + %r0] 0x01
	.word 0xfe74a00a  ! 1462: STX_I	stx	%r31, [%r18 + 0x000a]
iob_intr_3_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_118), 16, 16)) -> intp(3, 0, 3b)
cpu_intr_3_101:
	setx	0x28003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb214a1a1  ! 1467: OR_I	or 	%r18, 0x01a1, %r25
	.word 0xf874e024  ! 1468: STX_I	stx	%r28, [%r19 + 0x0024]
cpu_intr_3_102:
	setx	0x2b0208, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_119), 16, 16)) -> intp(3, 0, 15)
	setx	data_start_1, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983e52  ! 1476: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e52, %hpstate
	.word 0xbd7d2401  ! 1477: MOVR_I	movre	%r20, 0x1, %r30
	.word 0xf2adc020  ! 1478: STBA_R	stba	%r25, [%r23 + %r0] 0x01
	.word 0xf434e188  ! 1481: STH_I	sth	%r26, [%r19 + 0x0188]
	.word 0xfaa5e13b  ! 1483: STWA_I	stwa	%r29, [%r23 + 0x013b] %asi
iob_intr_3_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_120), 16, 16)) -> intp(3, 0, 1)
iob_intr_3_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_121), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_wr_68:
	mov	0x15, %r14
	.word 0xfcf38400  ! 1490: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xf4a5e1e4  ! 1491: STWA_I	stwa	%r26, [%r23 + 0x01e4] %asi
cpu_intr_3_103:
	setx	0x2b0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_3_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_122), 16, 16)) -> intp(3, 0, 26)
	.word 0xf4aca0c6  ! 1498: STBA_I	stba	%r26, [%r18 + 0x00c6] %asi
T3_asi_reg_wr_69:
	mov	0x22, %r14
	.word 0xfaf389e0  ! 1500: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xfa350000  ! 1501: STH_R	sth	%r29, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0xf87461e0  ! 1509: STX_I	stx	%r28, [%r17 + 0x01e0]
iob_intr_3_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_123), 16, 16)) -> intp(3, 0, d)
T3_asi_reg_wr_70:
	mov	0x2, %r14
	.word 0xf0f38400  ! 1511: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_3_104:
	setx	0x29000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xb72c8000  ! 1514: SLL_R	sll 	%r18, %r0, %r27
cpu_intr_3_105:
	setx	0x2b032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb69da127  ! 1519: XORcc_I	xorcc 	%r22, 0x0127, %r27
iob_intr_3_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_124), 16, 16)) -> intp(3, 0, 29)
iob_intr_3_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_125), 16, 16)) -> intp(3, 0, b)
	.word 0xbe348000  ! 1522: SUBC_R	orn 	%r18, %r0, %r31
T3_asi_reg_wr_71:
	mov	0x3c3, %r14
	.word 0xfaf38e40  ! 1523: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfaf4601a  ! 1525: STXA_I	stxa	%r29, [%r17 + 0x001a] %asi
T3_asi_reg_wr_72:
	mov	0x21, %r14
	.word 0xfcf38e40  ! 1529: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_106:
	setx	0x2b023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8252120  ! 1532: STW_I	stw	%r28, [%r20 + 0x0120]
	.word 0xf6f4a068  ! 1533: STXA_I	stxa	%r27, [%r18 + 0x0068] %asi
	.word 0xfa2d4000  ! 1537: STB_R	stb	%r29, [%r21 + %r0]
	.word 0xf0740000  ! 1540: STX_R	stx	%r24, [%r16 + %r0]
cpu_intr_3_107:
	setx	0x290312, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_108:
	setx	0x2a022d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_79:
	mov	0x4, %r14
	.word 0xfadb8e40  ! 1545: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_3_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_126), 16, 16)) -> intp(3, 0, 3d)
cpu_intr_3_109:
	setx	0x2b0113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_127), 16, 16)) -> intp(3, 0, 21)
iob_intr_3_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_128), 16, 16)) -> intp(3, 0, 2)
	.word 0xfaad8020  ! 1553: STBA_R	stba	%r29, [%r22 + %r0] 0x01
T3_asi_reg_rd_80:
	mov	0x13, %r14
	.word 0xfadb84a0  ! 1554: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_81:
	mov	0x3c7, %r14
	.word 0xfadb8e80  ! 1557: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xfca4602f  ! 1561: STWA_I	stwa	%r30, [%r17 + 0x002f] %asi
cpu_intr_3_110:
	setx	0x2b0034, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_73:
	mov	0x22, %r14
	.word 0xf4f38400  ! 1567: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_3_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_129), 16, 16)) -> intp(3, 0, 2c)
iob_intr_3_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_130), 16, 16)) -> intp(3, 0, 17)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_74:
	mov	0x11, %r14
	.word 0xfaf38e40  ! 1575: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_3_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_131), 16, 16)) -> intp(3, 0, 32)
cpu_intr_3_111:
	setx	0x2b0339, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_132), 16, 16)) -> intp(3, 0, 31)
iob_intr_3_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_133), 16, 16)) -> intp(3, 0, 39)
cpu_intr_3_112:
	setx	0x29013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf274c000  ! 1587: STX_R	stx	%r25, [%r19 + %r0]
iob_intr_3_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_134), 16, 16)) -> intp(3, 0, 2d)
T3_asi_reg_rd_82:
	mov	0x31, %r14
	.word 0xf4db84a0  ! 1589: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_3_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_135), 16, 16)) -> intp(3, 0, 18)
cpu_intr_3_113:
	setx	0x28011b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_75:
	mov	0x6, %r14
	.word 0xf2f38e60  ! 1598: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T3_asi_reg_wr_76:
	mov	0x25, %r14
	.word 0xf8f38e40  ! 1599: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_3_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_136), 16, 16)) -> intp(3, 0, 26)
iob_intr_3_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_137), 16, 16)) -> intp(3, 0, 28)
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
cpu_intr_3_114:
	setx	0x29023c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_83:
	mov	0x3c3, %r14
	.word 0xf6db8e60  ! 1609: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T3_asi_reg_wr_77:
	mov	0x17, %r14
	.word 0xf2f384a0  ! 1610: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T3_asi_reg_wr_78:
	mov	0xe, %r14
	.word 0xfef38e80  ! 1612: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T3_asi_reg_wr_79:
	mov	0x30, %r14
	.word 0xfef389e0  ! 1613: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T3_asi_reg_rd_84:
	mov	0x3c8, %r14
	.word 0xf6db84a0  ! 1614: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf2354000  ! 1618: STH_R	sth	%r25, [%r21 + %r0]
	ta	T_CHANGE_TO_TL0
	.word 0xf274205b  ! 1624: STX_I	stx	%r25, [%r16 + 0x005b]
	.word 0xf025e1ed  ! 1628: STW_I	stw	%r24, [%r23 + 0x01ed]
iob_intr_3_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_138), 16, 16)) -> intp(3, 0, 38)
	ta	T_CHANGE_NONHPRIV
	.word 0xf874c000  ! 1639: STX_R	stx	%r28, [%r19 + %r0]
iob_intr_3_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_139), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf474c000  ! 1641: STX_R	stx	%r26, [%r19 + %r0]
cpu_intr_3_115:
	setx	0x2a031c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_140), 16, 16)) -> intp(3, 0, 17)
	.word 0xb351c000  ! 1647: RDPR_TL	rdpr	%tl, %r25
	.word 0xfca44020  ! 1652: STWA_R	stwa	%r30, [%r17 + %r0] 0x01
iob_intr_3_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_141), 16, 16)) -> intp(3, 0, 3e)
	.word 0xfc2d2046  ! 1654: STB_I	stb	%r30, [%r20 + 0x0046]
cpu_intr_3_116:
	setx	0x2a0115, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_142), 16, 16)) -> intp(3, 0, 1)
cpu_intr_3_117:
	setx	0x280326, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_118:
	setx	0x2b012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb89da008  ! 1662: XORcc_I	xorcc 	%r22, 0x0008, %r28
	.word 0xf2f5e02d  ! 1664: STXA_I	stxa	%r25, [%r23 + 0x002d] %asi
T3_asi_reg_rd_85:
	mov	0x28, %r14
	.word 0xf8db89e0  ! 1665: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_3_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_143), 16, 16)) -> intp(3, 0, 5)
T3_asi_reg_wr_80:
	mov	0x8, %r14
	.word 0xfaf384a0  ! 1669: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_3_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_144), 16, 16)) -> intp(3, 0, 21)
	.word 0xf8ace16b  ! 1672: STBA_I	stba	%r28, [%r19 + 0x016b] %asi
	.word 0xfc24c000  ! 1673: STW_R	stw	%r30, [%r19 + %r0]
	.word 0x83952110  ! 1675: WRPR_TNPC_I	wrpr	%r20, 0x0110, %tnpc
	.word 0xf4ace1f1  ! 1677: STBA_I	stba	%r26, [%r19 + 0x01f1] %asi
	.word 0xfab54020  ! 1678: STHA_R	stha	%r29, [%r21 + %r0] 0x01
	.word 0xf8a5611c  ! 1680: STWA_I	stwa	%r28, [%r21 + 0x011c] %asi
cpu_intr_3_119:
	setx	0x2a0223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf274a0ef  ! 1682: STX_I	stx	%r25, [%r18 + 0x00ef]
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982842  ! 1683: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0842, %hpstate
cpu_intr_3_120:
	setx	0x2a003a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_145), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_wr_81:
	mov	0xf, %r14
	.word 0xfcf38e40  ! 1688: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfaad20e9  ! 1690: STBA_I	stba	%r29, [%r20 + 0x00e9] %asi
iob_intr_3_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_146), 16, 16)) -> intp(3, 0, b)
T3_asi_reg_rd_86:
	mov	0xa, %r14
	.word 0xfcdb84a0  ! 1693: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_3_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_147), 16, 16)) -> intp(3, 0, 1)
T3_asi_reg_rd_87:
	mov	0x8, %r14
	.word 0xf6db89e0  ! 1699: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_121:
	setx	0x2a0133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ade0fc  ! 1705: STBA_I	stba	%r26, [%r23 + 0x00fc] %asi
T3_asi_reg_wr_82:
	mov	0x33, %r14
	.word 0xfcf389e0  ! 1706: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T3_asi_reg_rd_88:
	mov	0x2a, %r14
	.word 0xf4db8e60  ! 1707: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T3_asi_reg_wr_83:
	mov	0x23, %r14
	.word 0xf6f38400  ! 1709: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xfc2d4000  ! 1714: STB_R	stb	%r30, [%r21 + %r0]
iob_intr_3_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_148), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf075c000  ! 1717: STX_R	stx	%r24, [%r23 + %r0]
	.word 0xb60c6074  ! 1718: AND_I	and 	%r17, 0x0074, %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xfeb520f1  ! 1722: STHA_I	stha	%r31, [%r20 + 0x00f1] %asi
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_89:
	mov	0x1, %r14
	.word 0xf4db89e0  ! 1724: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	ta	T_CHANGE_TO_TL1
	.word 0xfe750000  ! 1728: STX_R	stx	%r31, [%r20 + %r0]
cpu_intr_3_122:
	setx	0x2a030a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_149), 16, 16)) -> intp(3, 0, e)
	.word 0xb4a40000  ! 1734: SUBcc_R	subcc 	%r16, %r0, %r26
cpu_intr_3_123:
	setx	0x2b0219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe24c000  ! 1737: STW_R	stw	%r31, [%r19 + %r0]
	.word 0xfe75c000  ! 1740: STX_R	stx	%r31, [%r23 + %r0]
	.word 0xf8f4a1b2  ! 1741: STXA_I	stxa	%r28, [%r18 + 0x01b2] %asi
iob_intr_3_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_150), 16, 16)) -> intp(3, 0, 10)
	.word 0xf62c4000  ! 1745: STB_R	stb	%r27, [%r17 + %r0]
iob_intr_3_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_151), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_rd_90:
	mov	0x3c6, %r14
	.word 0xfcdb8e60  ! 1748: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T3_asi_reg_rd_91:
	mov	0x7, %r14
	.word 0xf2db84a0  ! 1750: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_92:
	mov	0x16, %r14
	.word 0xf2db89e0  ! 1752: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xf4ade10a  ! 1753: STBA_I	stba	%r26, [%r23 + 0x010a] %asi
cpu_intr_3_124:
	setx	0x29030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b5a1fe  ! 1756: STHA_I	stha	%r25, [%r22 + 0x01fe] %asi
	.word 0xf0a5e1e2  ! 1759: STWA_I	stwa	%r24, [%r23 + 0x01e2] %asi
T3_asi_reg_rd_93:
	mov	0x3c3, %r14
	.word 0xfadb8e60  ! 1763: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_3_125:
	setx	0x2a0108, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_84:
	mov	0x3c7, %r14
	.word 0xfcf38e60  ! 1768: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xfe7560f5  ! 1770: STX_I	stx	%r31, [%r21 + 0x00f5]
iob_intr_3_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_152), 16, 16)) -> intp(3, 0, 8)
T3_asi_reg_rd_94:
	mov	0xa, %r14
	.word 0xf8db8e80  ! 1775: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_3_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_153), 16, 16)) -> intp(3, 0, 2a)
iob_intr_3_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_154), 16, 16)) -> intp(3, 0, 8)
iob_intr_3_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_155), 16, 16)) -> intp(3, 0, 3)
iob_intr_3_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_156), 16, 16)) -> intp(3, 0, 11)
cpu_intr_3_126:
	setx	0x2b0319, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_95:
	mov	0x3c3, %r14
	.word 0xf0db8e60  ! 1801: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf825c000  ! 1803: STW_R	stw	%r28, [%r23 + %r0]
	.word 0xf2350000  ! 1805: STH_R	sth	%r25, [%r20 + %r0]
T3_asi_reg_wr_85:
	mov	0x6, %r14
	.word 0xf6f38e40  ! 1807: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_127:
	setx	0x2e0201, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_128:
	setx	0x2d0126, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_129:
	setx	0x2c0105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82d6023  ! 1819: STB_I	stb	%r28, [%r21 + 0x0023]
	.word 0xf8b5a01a  ! 1822: STHA_I	stha	%r28, [%r22 + 0x001a] %asi
	.word 0xfca46122  ! 1825: STWA_I	stwa	%r30, [%r17 + 0x0122] %asi
T3_asi_reg_wr_86:
	mov	0x23, %r14
	.word 0xf0f38e40  ! 1826: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_157), 16, 16)) -> intp(3, 0, 35)
cpu_intr_3_130:
	setx	0x2e023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf624a0c6  ! 1829: STW_I	stw	%r27, [%r18 + 0x00c6]
T3_asi_reg_wr_87:
	mov	0x4, %r14
	.word 0xfaf38e40  ! 1830: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb32ca001  ! 1831: SLL_I	sll 	%r18, 0x0001, %r25
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_131:
	setx	0x2f0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8140000  ! 1842: OR_R	or 	%r16, %r0, %r28
cpu_intr_3_132:
	setx	0x2c011d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_133:
	setx	0x2c0130, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_134:
	setx	0x2f0037, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_135:
	setx	0x2e0103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12cd000  ! 1850: SLLX_R	sllx	%r19, %r0, %r24
	.word 0xf8240000  ! 1851: STW_R	stw	%r28, [%r16 + %r0]
	.word 0xfeade146  ! 1853: STBA_I	stba	%r31, [%r23 + 0x0146] %asi
	ta	T_CHANGE_TO_TL1
	.word 0xf8358000  ! 1855: STH_R	sth	%r28, [%r22 + %r0]
T3_asi_reg_rd_96:
	mov	0x3c8, %r14
	.word 0xfadb8e60  ! 1859: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf22ca047  ! 1863: STB_I	stb	%r25, [%r18 + 0x0047]
cpu_intr_3_136:
	setx	0x2c0124, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_158), 16, 16)) -> intp(3, 0, 5)
T3_asi_reg_rd_97:
	mov	0x2b, %r14
	.word 0xfedb84a0  ! 1868: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983fc8  ! 1869: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc8, %hpstate
cpu_intr_3_137:
	setx	0x2d0231, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_88:
	mov	0x1a, %r14
	.word 0xfaf38e60  ! 1872: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xfe246174  ! 1874: STW_I	stw	%r31, [%r17 + 0x0174]
T3_asi_reg_rd_98:
	mov	0x3c7, %r14
	.word 0xfcdb89e0  ! 1876: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf8242178  ! 1879: STW_I	stw	%r28, [%r16 + 0x0178]
cpu_intr_3_138:
	setx	0x2d012a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_159), 16, 16)) -> intp(3, 0, 26)
	ta	T_CHANGE_NONHPRIV
iob_intr_3_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_160), 16, 16)) -> intp(3, 0, 3b)
	.word 0xb4bde152  ! 1890: XNORcc_I	xnorcc 	%r23, 0x0152, %r26
cpu_intr_3_139:
	setx	0x2d0127, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_140:
	setx	0x2f0202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6f52032  ! 1898: STXA_I	stxa	%r27, [%r20 + 0x0032] %asi
	.word 0xf824604d  ! 1899: STW_I	stw	%r28, [%r17 + 0x004d]
	.word 0xb6a4e029  ! 1900: SUBcc_I	subcc 	%r19, 0x0029, %r27
	.word 0xb6042022  ! 1902: ADD_I	add 	%r16, 0x0022, %r27
T3_asi_reg_wr_89:
	mov	0x24, %r14
	.word 0xfaf38400  ! 1904: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb60421b9  ! 1906: ADD_I	add 	%r16, 0x01b9, %r27
cpu_intr_3_141:
	setx	0x2e0225, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_90:
	mov	0x1b, %r14
	.word 0xfef38e80  ! 1908: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbe2ce150  ! 1909: ANDN_I	andn 	%r19, 0x0150, %r31
cpu_intr_3_142:
	setx	0x2f0101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0258000  ! 1912: STW_R	stw	%r24, [%r22 + %r0]
	.word 0xfc346098  ! 1913: STH_I	sth	%r30, [%r17 + 0x0098]
	.word 0xbe2ca024  ! 1915: ANDN_I	andn 	%r18, 0x0024, %r31
T3_asi_reg_wr_91:
	mov	0x9, %r14
	.word 0xf2f38e40  ! 1919: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf47421ad  ! 1922: STX_I	stx	%r26, [%r16 + 0x01ad]
cpu_intr_3_143:
	setx	0x2d012e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_99:
	mov	0x3c8, %r14
	.word 0xfedb8400  ! 1924: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_3_144:
	setx	0x2d0330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a4a131  ! 1930: STWA_I	stwa	%r24, [%r18 + 0x0131] %asi
T3_asi_reg_rd_100:
	mov	0x3c8, %r14
	.word 0xf6db8400  ! 1931: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T3_asi_reg_wr_92:
	mov	0x3c5, %r14
	.word 0xfaf389e0  ! 1932: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf675e133  ! 1933: STX_I	stx	%r27, [%r23 + 0x0133]
cpu_intr_3_145:
	setx	0x2d0127, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_101:
	mov	0x2, %r14
	.word 0xf4db8e40  ! 1936: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_161), 16, 16)) -> intp(3, 0, 30)
	.word 0xfa35e030  ! 1940: STH_I	sth	%r29, [%r23 + 0x0030]
iob_intr_3_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_162), 16, 16)) -> intp(3, 0, a)
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982d02  ! 1944: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d02, %hpstate
	.word 0xfc35c000  ! 1948: STH_R	sth	%r30, [%r23 + %r0]
T3_asi_reg_rd_102:
	mov	0x3c8, %r14
	.word 0xf0db8e60  ! 1950: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	ta	T_CHANGE_TO_TL0
	.word 0xf2346042  ! 1952: STH_I	sth	%r25, [%r17 + 0x0042]
	.word 0xf624c000  ! 1957: STW_R	stw	%r27, [%r19 + %r0]
T3_asi_reg_rd_103:
	mov	0x28, %r14
	.word 0xf4db89e0  ! 1958: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_3_146:
	setx	0x2e0110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc14e052  ! 1962: OR_I	or 	%r19, 0x0052, %r30
	.word 0xb8040000  ! 1963: ADD_R	add 	%r16, %r0, %r28
	.word 0xf4b56116  ! 1965: STHA_I	stha	%r26, [%r21 + 0x0116] %asi
cpu_intr_3_147:
	setx	0x2d0032, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x819839d8  ! 1972: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19d8, %hpstate
cpu_intr_3_148:
	setx	0x2d0210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4bd0000  ! 1974: XNORcc_R	xnorcc 	%r20, %r0, %r26
T3_asi_reg_wr_93:
	mov	0x3c2, %r14
	.word 0xf8f384a0  ! 1976: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf2342044  ! 1977: STH_I	sth	%r25, [%r16 + 0x0044]
	.word 0xf4ac203d  ! 1979: STBA_I	stba	%r26, [%r16 + 0x003d] %asi
cpu_intr_3_149:
	setx	0x2e021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb40020  ! 1982: STHA_R	stha	%r31, [%r16 + %r0] 0x01
	.word 0xfc24e0dc  ! 1983: STW_I	stw	%r30, [%r19 + 0x00dc]
T3_asi_reg_rd_104:
	mov	0x3c6, %r14
	.word 0xf0db8e80  ! 1985: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb8150000  ! 1990: OR_R	or 	%r20, %r0, %r28
iob_intr_3_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_163), 16, 16)) -> intp(3, 0, 3d)
T3_asi_reg_rd_105:
	mov	0xd, %r14
	.word 0xf2db8e40  ! 2000: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_HPRIV
cpu_intr_3_150:
	setx	0x2c023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_106:
	mov	0x3c1, %r14
	.word 0xf2db8e80  ! 2004: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T3_asi_reg_wr_94:
	mov	0x24, %r14
	.word 0xfef38e40  ! 2006: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_wr_95:
	mov	0x2e, %r14
	.word 0xfaf38e40  ! 2008: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982f1a  ! 2009: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f1a, %hpstate
T3_asi_reg_wr_96:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 2012: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_164), 16, 16)) -> intp(3, 0, a)
cpu_intr_3_151:
	setx	0x2f030f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_107:
	mov	0x25, %r14
	.word 0xfedb8400  ! 2020: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_3_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_165), 16, 16)) -> intp(3, 0, 31)
	.word 0xf6254000  ! 2022: STW_R	stw	%r27, [%r21 + %r0]
	.word 0xf425e16c  ! 2025: STW_I	stw	%r26, [%r23 + 0x016c]
	.word 0xf2b4a128  ! 2028: STHA_I	stha	%r25, [%r18 + 0x0128] %asi
	.word 0xf234211d  ! 2030: STH_I	sth	%r25, [%r16 + 0x011d]
	.word 0xf235e1b6  ! 2032: STH_I	sth	%r25, [%r23 + 0x01b6]
T3_asi_reg_rd_108:
	mov	0x35, %r14
	.word 0xf0db89e0  ! 2035: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf6350000  ! 2037: STH_R	sth	%r27, [%r20 + %r0]
T3_asi_reg_wr_97:
	mov	0x38, %r14
	.word 0xf6f384a0  ! 2038: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xfe7521d1  ! 2041: STX_I	stx	%r31, [%r20 + 0x01d1]
cpu_intr_3_152:
	setx	0x2e0126, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_166), 16, 16)) -> intp(3, 0, 16)
iob_intr_3_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_167), 16, 16)) -> intp(3, 0, a)
cpu_intr_3_153:
	setx	0x2c0105, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_168), 16, 16)) -> intp(3, 0, b)
cpu_intr_3_154:
	setx	0x2f0033, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_109:
	mov	0x5, %r14
	.word 0xf0db8e80  ! 2060: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xfe758000  ! 2061: STX_R	stx	%r31, [%r22 + %r0]
	ta	T_CHANGE_TO_TL1
iob_intr_3_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_169), 16, 16)) -> intp(3, 0, 3c)
	ta	T_CHANGE_HPRIV
iob_intr_3_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_170), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_171), 16, 16)) -> intp(3, 0, 3d)
	.word 0xb97dc400  ! 2075: MOVR_R	movre	%r23, %r0, %r28
iob_intr_3_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_172), 16, 16)) -> intp(3, 0, 13)
cpu_intr_3_155:
	setx	0x2f0224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2560ce  ! 2083: STW_I	stw	%r30, [%r21 + 0x00ce]
	ta	T_CHANGE_TO_TL0
	.word 0xf6a4c020  ! 2087: STWA_R	stwa	%r27, [%r19 + %r0] 0x01
cpu_intr_3_156:
	setx	0x2d031a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_110:
	mov	0x10, %r14
	.word 0xf2db8400  ! 2092: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xfe75216e  ! 2097: STX_I	stx	%r31, [%r20 + 0x016e]
T3_asi_reg_wr_98:
	mov	0x3c4, %r14
	.word 0xf6f38e80  ! 2104: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xfaace1c7  ! 2107: STBA_I	stba	%r29, [%r19 + 0x01c7] %asi
	.word 0xf0ac4020  ! 2108: STBA_R	stba	%r24, [%r17 + %r0] 0x01
	.word 0xf825a10b  ! 2113: STW_I	stw	%r28, [%r22 + 0x010b]
	.word 0xf634a15e  ! 2114: STH_I	sth	%r27, [%r18 + 0x015e]
	.word 0xf8248000  ! 2115: STW_R	stw	%r28, [%r18 + %r0]
	.word 0xf2ad8020  ! 2117: STBA_R	stba	%r25, [%r22 + %r0] 0x01
	.word 0xf8748000  ! 2119: STX_R	stx	%r28, [%r18 + %r0]
iob_intr_3_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_173), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf42ce165  ! 2121: STB_I	stb	%r26, [%r19 + 0x0165]
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_111:
	mov	0x10, %r14
	.word 0xf8db8e80  ! 2125: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_3_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_174), 16, 16)) -> intp(3, 0, 1c)
	.word 0xf62c8000  ! 2129: STB_R	stb	%r27, [%r18 + %r0]
T3_asi_reg_rd_112:
	mov	0x3c5, %r14
	.word 0xf8db8400  ! 2131: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_3_157:
	setx	0x2c0030, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_113:
	mov	0x3c8, %r14
	.word 0xf6db89e0  ! 2133: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb6354000  ! 2134: ORN_R	orn 	%r21, %r0, %r27
cpu_intr_3_158:
	setx	0x2d023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2bd2082  ! 2136: XNORcc_I	xnorcc 	%r20, 0x0082, %r25
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982b58  ! 2138: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b58, %hpstate
	.word 0xb825c000  ! 2139: SUB_R	sub 	%r23, %r0, %r28
	ta	T_CHANGE_HPRIV
	.word 0xf8748000  ! 2141: STX_R	stx	%r28, [%r18 + %r0]
iob_intr_3_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_175), 16, 16)) -> intp(3, 0, 1d)
cpu_intr_3_159:
	setx	0x2d0205, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL0
	.word 0xbb2c5000  ! 2157: SLLX_R	sllx	%r17, %r0, %r29
	.word 0xf2758000  ! 2162: STX_R	stx	%r25, [%r22 + %r0]
	.word 0xf8ac4020  ! 2164: STBA_R	stba	%r28, [%r17 + %r0] 0x01
cpu_intr_3_160:
	setx	0x2d0319, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_161:
	setx	0x2f021b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_176), 16, 16)) -> intp(3, 0, 1)
T3_asi_reg_wr_99:
	mov	0x10, %r14
	.word 0xfef389e0  ! 2178: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_3_162:
	setx	0x2e0123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa244000  ! 2182: STW_R	stw	%r29, [%r17 + %r0]
iob_intr_3_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_177), 16, 16)) -> intp(3, 0, e)
iob_intr_3_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_178), 16, 16)) -> intp(3, 0, 1f)
	.word 0xfe740000  ! 2186: STX_R	stx	%r31, [%r16 + %r0]
T3_asi_reg_rd_114:
	mov	0x3c1, %r14
	.word 0xfcdb89e0  ! 2187: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb7344000  ! 2190: SRL_R	srl 	%r17, %r0, %r27
	.word 0xfc34e066  ! 2192: STH_I	sth	%r30, [%r19 + 0x0066]
	.word 0xbb3dd000  ! 2193: SRAX_R	srax	%r23, %r0, %r29
iob_intr_3_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_179), 16, 16)) -> intp(3, 0, 33)
iob_intr_3_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_180), 16, 16)) -> intp(3, 0, 29)
iob_intr_3_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_181), 16, 16)) -> intp(3, 0, 28)
iob_intr_3_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_182), 16, 16)) -> intp(3, 0, 29)
cpu_intr_3_163:
	setx	0x2e011a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_183), 16, 16)) -> intp(3, 0, 3)
T3_asi_reg_wr_100:
	mov	0x2d, %r14
	.word 0xfaf38e60  ! 2210: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xfea4e17f  ! 2211: STWA_I	stwa	%r31, [%r19 + 0x017f] %asi
iob_intr_3_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_184), 16, 16)) -> intp(3, 0, 5)
T3_asi_reg_wr_101:
	mov	0x3c5, %r14
	.word 0xf8f38e40  ! 2214: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_3_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_185), 16, 16)) -> intp(3, 0, c)
T3_asi_reg_wr_102:
	mov	0x1a, %r14
	.word 0xf0f38e60  ! 2217: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb2354000  ! 2220: ORN_R	orn 	%r21, %r0, %r25
	.word 0xf075c000  ! 2221: STX_R	stx	%r24, [%r23 + %r0]
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983e98  ! 2223: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e98, %hpstate
	.word 0xf025e04a  ! 2225: STW_I	stw	%r24, [%r23 + 0x004a]
	.word 0xbf2c9000  ! 2227: SLLX_R	sllx	%r18, %r0, %r31
	.word 0xf8f5619b  ! 2228: STXA_I	stxa	%r28, [%r21 + 0x019b] %asi
	.word 0xb6348000  ! 2229: ORN_R	orn 	%r18, %r0, %r27
	.word 0xf4b4607b  ! 2230: STHA_I	stha	%r26, [%r17 + 0x007b] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_115:
	mov	0x8, %r14
	.word 0xf6db8e60  ! 2234: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T3_asi_reg_rd_116:
	mov	0x29, %r14
	.word 0xf8db84a0  ! 2237: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf0a5c020  ! 2238: STWA_R	stwa	%r24, [%r23 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
	.word 0xf6352083  ! 2251: STH_I	sth	%r27, [%r20 + 0x0083]
	.word 0xf4350000  ! 2252: STH_R	sth	%r26, [%r20 + %r0]
T3_asi_reg_rd_117:
	mov	0x3c0, %r14
	.word 0xfcdb84a0  ! 2254: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T3_asi_reg_rd_118:
	mov	0x9, %r14
	.word 0xf0db8e80  ! 2258: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_3_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_186), 16, 16)) -> intp(3, 0, 1)
	.word 0xf2ad4020  ! 2262: STBA_R	stba	%r25, [%r21 + %r0] 0x01
T3_asi_reg_wr_103:
	mov	0x37, %r14
	.word 0xf2f384a0  ! 2263: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T3_asi_reg_rd_119:
	mov	0x24, %r14
	.word 0xf6db84a0  ! 2266: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_3_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_187), 16, 16)) -> intp(3, 0, 14)
iob_intr_3_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_188), 16, 16)) -> intp(3, 0, 20)
	.word 0xf8f4e123  ! 2274: STXA_I	stxa	%r28, [%r19 + 0x0123] %asi
	.word 0xfab5e0fa  ! 2276: STHA_I	stha	%r29, [%r23 + 0x00fa] %asi
	.word 0xf4b58020  ! 2277: STHA_R	stha	%r26, [%r22 + %r0] 0x01
	.word 0xf874e1f0  ! 2278: STX_I	stx	%r28, [%r19 + 0x01f0]
	ta	T_CHANGE_TO_TL1
	.word 0xb72d2001  ! 2285: SLL_I	sll 	%r20, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbcc4c000  ! 2291: ADDCcc_R	addccc 	%r19, %r0, %r30
	.word 0xfaf4a07b  ! 2292: STXA_I	stxa	%r29, [%r18 + 0x007b] %asi
	.word 0xfa2460f6  ! 2293: STW_I	stw	%r29, [%r17 + 0x00f6]
	.word 0xf0750000  ! 2298: STX_R	stx	%r24, [%r20 + %r0]
	.word 0xb73df001  ! 2300: SRAX_I	srax	%r23, 0x0001, %r27
T3_asi_reg_wr_104:
	mov	0x1d, %r14
	.word 0xf6f38e40  ! 2301: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_rd_120:
	mov	0xe, %r14
	.word 0xfedb8e40  ! 2302: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_rd_121:
	mov	0x20, %r14
	.word 0xf2db8e80  ! 2305: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb8bc0000  ! 2308: XNORcc_R	xnorcc 	%r16, %r0, %r28
	.word 0xb4c5c000  ! 2310: ADDCcc_R	addccc 	%r23, %r0, %r26
T3_asi_reg_wr_105:
	mov	0x3c0, %r14
	.word 0xf8f384a0  ! 2311: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_3_164:
	setx	0x330114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6c461e7  ! 2314: ADDCcc_I	addccc 	%r17, 0x01e7, %r27
	.word 0xf474201b  ! 2316: STX_I	stx	%r26, [%r16 + 0x001b]
	.word 0xfaf460cf  ! 2318: STXA_I	stxa	%r29, [%r17 + 0x00cf] %asi
	.word 0xfcb4a17a  ! 2320: STHA_I	stha	%r30, [%r18 + 0x017a] %asi
	.word 0xf6744000  ! 2321: STX_R	stx	%r27, [%r17 + %r0]
iob_intr_3_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_189), 16, 16)) -> intp(3, 0, c)
	.word 0xbe1da168  ! 2325: XOR_I	xor 	%r22, 0x0168, %r31
T3_asi_reg_wr_106:
	mov	0x30, %r14
	.word 0xf4f38400  ! 2327: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_3_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_190), 16, 16)) -> intp(3, 0, 7)
	.word 0xfab4a05d  ! 2335: STHA_I	stha	%r29, [%r18 + 0x005d] %asi
	ta	T_CHANGE_NONHPRIV
iob_intr_3_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_191), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_165:
	setx	0x300034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0252053  ! 2344: STW_I	stw	%r24, [%r20 + 0x0053]
iob_intr_3_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_192), 16, 16)) -> intp(3, 0, 14)
	.word 0xb4b48000  ! 2347: ORNcc_R	orncc 	%r18, %r0, %r26
	.word 0xb214e132  ! 2351: OR_I	or 	%r19, 0x0132, %r25
T3_asi_reg_rd_122:
	mov	0x36, %r14
	.word 0xf2db84a0  ! 2352: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T3_asi_reg_wr_107:
	mov	0x3c4, %r14
	.word 0xf0f38e80  ! 2355: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T3_asi_reg_wr_108:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 2356: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfea4a10a  ! 2358: STWA_I	stwa	%r31, [%r18 + 0x010a] %asi
	.word 0xf6ac0020  ! 2359: STBA_R	stba	%r27, [%r16 + %r0] 0x01
	.word 0xf4ac20b9  ! 2360: STBA_I	stba	%r26, [%r16 + 0x00b9] %asi
cpu_intr_3_166:
	setx	0x33000d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_109:
	mov	0x1e, %r14
	.word 0xfaf38400  ! 2365: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf22d612b  ! 2366: STB_I	stb	%r25, [%r21 + 0x012b]
	.word 0xf224a1dd  ! 2367: STW_I	stw	%r25, [%r18 + 0x01dd]
iob_intr_3_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_193), 16, 16)) -> intp(3, 0, 24)
	.word 0xf4a46177  ! 2371: STWA_I	stwa	%r26, [%r17 + 0x0177] %asi
	.word 0xfef4a157  ! 2372: STXA_I	stxa	%r31, [%r18 + 0x0157] %asi
	ta	T_CHANGE_HPRIV
	.word 0xf02d2068  ! 2375: STB_I	stb	%r24, [%r20 + 0x0068]
cpu_intr_3_167:
	setx	0x310025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2520c3  ! 2377: STW_I	stw	%r30, [%r20 + 0x00c3]
T3_asi_reg_wr_110:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 2378: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfe35c000  ! 2381: STH_R	sth	%r31, [%r23 + %r0]
cpu_intr_3_168:
	setx	0x310005, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_194), 16, 16)) -> intp(3, 0, f)
	.word 0xfcb40020  ! 2388: STHA_R	stha	%r30, [%r16 + %r0] 0x01
T3_asi_reg_rd_123:
	mov	0x3c4, %r14
	.word 0xf6db84a0  ! 2389: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_3_169:
	setx	0x320036, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_170:
	setx	0x31013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b5a0cf  ! 2392: STHA_I	stha	%r26, [%r22 + 0x00cf] %asi
	.word 0xf0a520f9  ! 2394: STWA_I	stwa	%r24, [%r20 + 0x00f9] %asi
	.word 0xfe252003  ! 2397: STW_I	stw	%r31, [%r20 + 0x0003]
T3_asi_reg_wr_111:
	mov	0x2d, %r14
	.word 0xf6f384a0  ! 2398: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf674213b  ! 2402: STX_I	stx	%r27, [%r16 + 0x013b]
	.word 0xb834217a  ! 2403: SUBC_I	orn 	%r16, 0x017a, %r28
	.word 0xf224211a  ! 2404: STW_I	stw	%r25, [%r16 + 0x011a]
	.word 0xfe74602f  ! 2405: STX_I	stx	%r31, [%r17 + 0x002f]
	.word 0xf0f4a0ec  ! 2406: STXA_I	stxa	%r24, [%r18 + 0x00ec] %asi
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_112:
	mov	0x2c, %r14
	.word 0xf4f384a0  ! 2411: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf435e08a  ! 2413: STH_I	sth	%r26, [%r23 + 0x008a]
	.word 0xf0a42150  ! 2414: STWA_I	stwa	%r24, [%r16 + 0x0150] %asi
	.word 0xfaada150  ! 2415: STBA_I	stba	%r29, [%r22 + 0x0150] %asi
	.word 0xfead4020  ! 2417: STBA_R	stba	%r31, [%r21 + %r0] 0x01
T3_asi_reg_rd_124:
	mov	0x1a, %r14
	.word 0xfadb8e60  ! 2418: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xfe2c60f1  ! 2421: STB_I	stb	%r31, [%r17 + 0x00f1]
cpu_intr_3_171:
	setx	0x33030e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_195), 16, 16)) -> intp(3, 0, 1)
	.word 0xf22de14a  ! 2426: STB_I	stb	%r25, [%r23 + 0x014a]
	.word 0xf2744000  ! 2427: STX_R	stx	%r25, [%r17 + %r0]
	ta	T_CHANGE_TO_TL0
	.word 0x8395a0bb  ! 2436: WRPR_TNPC_I	wrpr	%r22, 0x00bb, %tnpc
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_125:
	mov	0x0, %r14
	.word 0xf2db89e0  ! 2439: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T3_asi_reg_rd_126:
	mov	0x3c3, %r14
	.word 0xf8db89e0  ! 2440: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf0358000  ! 2441: STH_R	sth	%r24, [%r22 + %r0]
T3_asi_reg_wr_113:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 2443: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb23ce08f  ! 2445: XNOR_I	xnor 	%r19, 0x008f, %r25
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982cd0  ! 2448: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd0, %hpstate
iob_intr_3_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_196), 16, 16)) -> intp(3, 0, 1e)
	ta	T_CHANGE_TO_TL1
cpu_intr_3_172:
	setx	0x300012, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_173:
	setx	0x34, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xbc4420b1  ! 2467: ADDC_I	addc 	%r16, 0x00b1, %r30
cpu_intr_3_174:
	setx	0x300116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b50020  ! 2469: STHA_R	stha	%r27, [%r20 + %r0] 0x01
iob_intr_3_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_197), 16, 16)) -> intp(3, 0, 14)
	.word 0xf0a5c020  ! 2475: STWA_R	stwa	%r24, [%r23 + %r0] 0x01
iob_intr_3_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_198), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_wr_114:
	mov	0xf, %r14
	.word 0xf2f38e60  ! 2477: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf23560f9  ! 2478: STH_I	sth	%r25, [%r21 + 0x00f9]
cpu_intr_3_175:
	setx	0x32002b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_199), 16, 16)) -> intp(3, 0, 3a)
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x8198285a  ! 2482: WRHPR_HPSTATE_I	wrhpr	%r0, 0x085a, %hpstate
cpu_intr_3_176:
	setx	0x320022, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf6b4a150  ! 2493: STHA_I	stha	%r27, [%r18 + 0x0150] %asi
T3_asi_reg_wr_115:
	mov	0x3c4, %r14
	.word 0xf4f389e0  ! 2494: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T3_asi_reg_wr_116:
	mov	0x36, %r14
	.word 0xf0f38e40  ! 2499: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf6348000  ! 2500: STH_R	sth	%r27, [%r18 + %r0]
cpu_intr_3_177:
	setx	0x30030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa25a15b  ! 2506: STW_I	stw	%r29, [%r22 + 0x015b]
	.word 0xf63560ad  ! 2508: STH_I	sth	%r27, [%r21 + 0x00ad]
cpu_intr_3_178:
	setx	0x320231, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_179:
	setx	0x320232, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_200), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf6354000  ! 2513: STH_R	sth	%r27, [%r21 + %r0]
	.word 0xfcb58020  ! 2517: STHA_R	stha	%r30, [%r22 + %r0] 0x01
	.word 0xfeaca03e  ! 2520: STBA_I	stba	%r31, [%r18 + 0x003e] %asi
iob_intr_3_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_201), 16, 16)) -> intp(3, 0, 2e)
iob_intr_3_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_202), 16, 16)) -> intp(3, 0, 39)
	ta	T_CHANGE_TO_TL1
	.word 0xf675610b  ! 2528: STX_I	stx	%r27, [%r21 + 0x010b]
	.word 0xbc952070  ! 2529: ORcc_I	orcc 	%r20, 0x0070, %r30
iob_intr_3_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_203), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_wr_117:
	mov	0x1a, %r14
	.word 0xfef38e40  ! 2532: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_3_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_204), 16, 16)) -> intp(3, 0, 4)
	.word 0xb8258000  ! 2534: SUB_R	sub 	%r22, %r0, %r28
iob_intr_3_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_205), 16, 16)) -> intp(3, 0, 2)
	ta	T_CHANGE_TO_TL1
	.word 0xfca46002  ! 2538: STWA_I	stwa	%r30, [%r17 + 0x0002] %asi
	.word 0xfc2d2067  ! 2541: STB_I	stb	%r30, [%r20 + 0x0067]
	.word 0xb0ac8000  ! 2544: ANDNcc_R	andncc 	%r18, %r0, %r24
cpu_intr_3_180:
	setx	0x330037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc25e174  ! 2548: STW_I	stw	%r30, [%r23 + 0x0174]
iob_intr_3_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_206), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf625a046  ! 2552: STW_I	stw	%r27, [%r22 + 0x0046]
	.word 0xfaadc020  ! 2553: STBA_R	stba	%r29, [%r23 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
iob_intr_3_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_207), 16, 16)) -> intp(3, 0, 29)
cpu_intr_3_181:
	setx	0x31011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0340000  ! 2558: STH_R	sth	%r24, [%r16 + %r0]
iob_intr_3_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_208), 16, 16)) -> intp(3, 0, 1b)
iob_intr_3_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_209), 16, 16)) -> intp(3, 0, 15)
T3_asi_reg_wr_118:
	mov	0x3c3, %r14
	.word 0xf4f38e80  ! 2562: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb2c44000  ! 2567: ADDCcc_R	addccc 	%r17, %r0, %r25
cpu_intr_3_182:
	setx	0x33022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a48020  ! 2572: STWA_R	stwa	%r27, [%r18 + %r0] 0x01
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982950  ! 2573: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0950, %hpstate
	.word 0xb20d21cc  ! 2574: AND_I	and 	%r20, 0x01cc, %r25
cpu_intr_3_183:
	setx	0x300013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb51c000  ! 2578: RDPR_TL	rdpr	%tl, %r29
iob_intr_3_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_210), 16, 16)) -> intp(3, 0, 3)
iob_intr_3_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_211), 16, 16)) -> intp(3, 0, 1a)
T3_asi_reg_rd_127:
	mov	0x2a, %r14
	.word 0xfcdb84a0  ! 2584: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_3_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_212), 16, 16)) -> intp(3, 0, 3)
	.word 0xf035a08e  ! 2588: STH_I	sth	%r24, [%r22 + 0x008e]
	.word 0xb1518000  ! 2589: RDPR_PSTATE	<illegal instruction>
iob_intr_3_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_213), 16, 16)) -> intp(3, 0, 28)
	.word 0xfa240000  ! 2592: STW_R	stw	%r29, [%r16 + %r0]
cpu_intr_3_184:
	setx	0x33032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2dc000  ! 2595: STB_R	stb	%r29, [%r23 + %r0]
	.word 0xf425c000  ! 2596: STW_R	stw	%r26, [%r23 + %r0]
iob_intr_3_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_214), 16, 16)) -> intp(3, 0, 2)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_215), 16, 16)) -> intp(3, 0, 23)
T3_asi_reg_rd_128:
	mov	0x3c6, %r14
	.word 0xf2db8400  ! 2603: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_3_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_216), 16, 16)) -> intp(3, 0, 1b)
	.word 0xfea44020  ! 2607: STWA_R	stwa	%r31, [%r17 + %r0] 0x01
	.word 0xbb3df001  ! 2608: SRAX_I	srax	%r23, 0x0001, %r29
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_129:
	mov	0x3c0, %r14
	.word 0xfedb8400  ! 2611: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T3_asi_reg_rd_130:
	mov	0x3c1, %r14
	.word 0xf2db8e80  ! 2613: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xfe2c0000  ! 2614: STB_R	stb	%r31, [%r16 + %r0]
	.word 0x8194a1da  ! 2617: WRPR_TPC_I	wrpr	%r18, 0x01da, %tpc
iob_intr_3_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_217), 16, 16)) -> intp(3, 0, 33)
	ta	T_CHANGE_NONHPRIV
iob_intr_3_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_218), 16, 16)) -> intp(3, 0, 18)
T3_asi_reg_wr_119:
	mov	0xf, %r14
	.word 0xf8f38e80  ! 2626: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_3_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_219), 16, 16)) -> intp(3, 0, 37)
iob_intr_3_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_220), 16, 16)) -> intp(3, 0, 38)
	.word 0xf0a4c020  ! 2631: STWA_R	stwa	%r24, [%r19 + %r0] 0x01
	.word 0xfa752042  ! 2632: STX_I	stx	%r29, [%r20 + 0x0042]
	.word 0xb005a168  ! 2634: ADD_I	add 	%r22, 0x0168, %r24
iob_intr_3_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_221), 16, 16)) -> intp(3, 0, 19)
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983858  ! 2644: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1858, %hpstate
	ta	T_CHANGE_TO_TL0
iob_intr_3_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_222), 16, 16)) -> intp(3, 0, 33)
	.word 0xfcf4a084  ! 2653: STXA_I	stxa	%r30, [%r18 + 0x0084] %asi
T3_asi_reg_rd_131:
	mov	0x3c1, %r14
	.word 0xf4db8400  ! 2654: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb17c4400  ! 2655: MOVR_R	movre	%r17, %r0, %r24
	.word 0xf8acc020  ! 2657: STBA_R	stba	%r28, [%r19 + %r0] 0x01
T3_asi_reg_rd_132:
	mov	0x2c, %r14
	.word 0xfcdb8e40  ! 2658: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_wr_120:
	mov	0x33, %r14
	.word 0xf8f38e40  ! 2659: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfab48020  ! 2662: STHA_R	stha	%r29, [%r18 + %r0] 0x01
iob_intr_3_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_223), 16, 16)) -> intp(3, 0, 30)
	.word 0xf2356008  ! 2665: STH_I	sth	%r25, [%r21 + 0x0008]
cpu_intr_3_185:
	setx	0x310213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc848000  ! 2668: ADDcc_R	addcc 	%r18, %r0, %r30
	.word 0xf0a5e066  ! 2672: STWA_I	stwa	%r24, [%r23 + 0x0066] %asi
iob_intr_3_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_224), 16, 16)) -> intp(3, 0, 3)
iob_intr_3_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_225), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_rd_133:
	mov	0x3c0, %r14
	.word 0xfedb84a0  ! 2677: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_3_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_226), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf42c20c5  ! 2680: STB_I	stb	%r26, [%r16 + 0x00c5]
cpu_intr_3_186:
	setx	0x330003, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_121:
	mov	0x3c6, %r14
	.word 0xf8f38e40  ! 2684: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf82de161  ! 2686: STB_I	stb	%r28, [%r23 + 0x0161]
	ta	T_CHANGE_HPRIV
	.word 0xf4a4c020  ! 2690: STWA_R	stwa	%r26, [%r19 + %r0] 0x01
iob_intr_3_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_227), 16, 16)) -> intp(3, 0, 31)
	.word 0xfead4020  ! 2692: STBA_R	stba	%r31, [%r21 + %r0] 0x01
iob_intr_3_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_228), 16, 16)) -> intp(3, 0, 2c)
cpu_intr_3_187:
	setx	0x330101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0f4a086  ! 2701: STXA_I	stxa	%r24, [%r18 + 0x0086] %asi
cpu_intr_3_188:
	setx	0x310305, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_229), 16, 16)) -> intp(3, 0, 27)
	ta	T_CHANGE_NONHPRIV
	.word 0xf6b44020  ! 2712: STHA_R	stha	%r27, [%r17 + %r0] 0x01
	.word 0xfab4e108  ! 2713: STHA_I	stha	%r29, [%r19 + 0x0108] %asi
cpu_intr_3_189:
	setx	0x320022, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_230), 16, 16)) -> intp(3, 0, 27)
	.word 0xfe2d8000  ! 2726: STB_R	stb	%r31, [%r22 + %r0]
	.word 0xfaf5e1a3  ! 2727: STXA_I	stxa	%r29, [%r23 + 0x01a3] %asi
iob_intr_3_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_231), 16, 16)) -> intp(3, 0, 30)
	.word 0xfe2de10c  ! 2731: STB_I	stb	%r31, [%r23 + 0x010c]
T3_asi_reg_wr_122:
	mov	0x3c5, %r14
	.word 0xfef38e60  ! 2732: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_3_190:
	setx	0x36022f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_191:
	setx	0x340001, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_232), 16, 16)) -> intp(3, 0, 38)
iob_intr_3_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_233), 16, 16)) -> intp(3, 0, 2c)
	.word 0xfe3561e8  ! 2743: STH_I	sth	%r31, [%r21 + 0x01e8]
	.word 0xfaacc020  ! 2744: STBA_R	stba	%r29, [%r19 + %r0] 0x01
	.word 0xf234a175  ! 2745: STH_I	sth	%r25, [%r18 + 0x0175]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb20420ca  ! 2748: ADD_I	add 	%r16, 0x00ca, %r25
	.word 0xb2a54000  ! 2749: SUBcc_R	subcc 	%r21, %r0, %r25
	.word 0xbe350000  ! 2754: SUBC_R	orn 	%r20, %r0, %r31
T3_asi_reg_wr_123:
	mov	0x1f, %r14
	.word 0xfef38e40  ! 2755: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_wr_124:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 2757: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf8258000  ! 2758: STW_R	stw	%r28, [%r22 + %r0]
iob_intr_3_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_234), 16, 16)) -> intp(3, 0, d)
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_134:
	mov	0x37, %r14
	.word 0xf4db8e40  ! 2765: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbb540000  ! 2771: RDPR_GL	rdpr	%-, %r29
	.word 0xb32c9000  ! 2775: SLLX_R	sllx	%r18, %r0, %r25
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_135:
	mov	0x3c6, %r14
	.word 0xf4db89e0  ! 2777: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xfaad60be  ! 2779: STBA_I	stba	%r29, [%r21 + 0x00be] %asi
	.word 0xf635217d  ! 2783: STH_I	sth	%r27, [%r20 + 0x017d]
	.word 0xf2a50020  ! 2784: STWA_R	stwa	%r25, [%r20 + %r0] 0x01
iob_intr_3_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_235), 16, 16)) -> intp(3, 0, c)
	.word 0xf87420df  ! 2786: STX_I	stx	%r28, [%r16 + 0x00df]
	.word 0xfaace1e7  ! 2788: STBA_I	stba	%r29, [%r19 + 0x01e7] %asi
iob_intr_3_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_236), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_rd_136:
	mov	0x2a, %r14
	.word 0xf0db8e40  ! 2790: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_rd_137:
	mov	0x19, %r14
	.word 0xf6db8400  ! 2791: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbb7d0400  ! 2792: MOVR_R	movre	%r20, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_237), 16, 16)) -> intp(3, 0, 8)
	.word 0xf0b40020  ! 2796: STHA_R	stha	%r24, [%r16 + %r0] 0x01
	.word 0xa1902001  ! 2797: WRPR_GL_I	wrpr	%r0, 0x0001, %-
T3_asi_reg_rd_138:
	mov	0x20, %r14
	.word 0xf0db89e0  ! 2798: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T3_asi_reg_rd_139:
	mov	0xf, %r14
	.word 0xfadb89e0  ! 2799: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T3_asi_reg_wr_125:
	mov	0x30, %r14
	.word 0xf8f38e60  ! 2800: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf435613f  ! 2804: STH_I	sth	%r26, [%r21 + 0x013f]
	.word 0xf0ace0c2  ! 2806: STBA_I	stba	%r24, [%r19 + 0x00c2] %asi
	.word 0xf0348000  ! 2809: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xbc344000  ! 2810: SUBC_R	orn 	%r17, %r0, %r30
T3_asi_reg_rd_140:
	mov	0x17, %r14
	.word 0xf4db8e40  ! 2811: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfaade1c3  ! 2813: STBA_I	stba	%r29, [%r23 + 0x01c3] %asi
	.word 0xfa2de08b  ! 2814: STB_I	stb	%r29, [%r23 + 0x008b]
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983942  ! 2815: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1942, %hpstate
T3_asi_reg_rd_141:
	mov	0x16, %r14
	.word 0xf0db8e80  ! 2818: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	ta	T_CHANGE_TO_TL1
cpu_intr_3_192:
	setx	0x350320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b5e05a  ! 2823: STHA_I	stha	%r27, [%r23 + 0x005a] %asi
	.word 0xf4ade12f  ! 2826: STBA_I	stba	%r26, [%r23 + 0x012f] %asi
cpu_intr_3_193:
	setx	0x360031, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_238), 16, 16)) -> intp(3, 0, 2f)
cpu_intr_3_194:
	setx	0x36000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0748000  ! 2832: STX_R	stx	%r24, [%r18 + %r0]
T3_asi_reg_wr_126:
	mov	0x4, %r14
	.word 0xf8f38e40  ! 2835: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_3_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_239), 16, 16)) -> intp(3, 0, 29)
	.word 0xfc2c61e6  ! 2842: STB_I	stb	%r30, [%r17 + 0x01e6]
iob_intr_3_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_240), 16, 16)) -> intp(3, 0, 8)
	.word 0xb2950000  ! 2844: ORcc_R	orcc 	%r20, %r0, %r25
	.word 0xf6b4c020  ! 2845: STHA_R	stha	%r27, [%r19 + %r0] 0x01
	.word 0xfe344000  ! 2846: STH_R	sth	%r31, [%r17 + %r0]
	.word 0xf2b5e060  ! 2847: STHA_I	stha	%r25, [%r23 + 0x0060] %asi
T3_asi_reg_wr_127:
	mov	0x5, %r14
	.word 0xf6f384a0  ! 2849: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T3_asi_reg_wr_128:
	mov	0x6, %r14
	.word 0xf0f384a0  ! 2851: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T3_asi_reg_wr_129:
	mov	0x3c2, %r14
	.word 0xf8f38e80  ! 2852: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb5518000  ! 2855: RDPR_PSTATE	rdpr	%pstate, %r26
T3_asi_reg_wr_130:
	mov	0x2d, %r14
	.word 0xfcf389e0  ! 2859: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xfc75a097  ! 2861: STX_I	stx	%r30, [%r22 + 0x0097]
	.word 0xb42ca073  ! 2862: ANDN_I	andn 	%r18, 0x0073, %r26
	.word 0x8394e0f0  ! 2864: WRPR_TNPC_I	wrpr	%r19, 0x00f0, %tnpc
T3_asi_reg_rd_142:
	mov	0xa, %r14
	.word 0xf2db89e0  ! 2865: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T3_asi_reg_rd_143:
	mov	0x13, %r14
	.word 0xf2db89e0  ! 2866: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xf475e04d  ! 2871: STX_I	stx	%r26, [%r23 + 0x004d]
cpu_intr_3_195:
	setx	0x37010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xfe2c8000  ! 2884: STB_R	stb	%r31, [%r18 + %r0]
	ta	T_CHANGE_TO_TL1
cpu_intr_3_196:
	setx	0x34011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf34c000  ! 2889: SRL_R	srl 	%r19, %r0, %r31
	.word 0xfe740000  ! 2890: STX_R	stx	%r31, [%r16 + %r0]
iob_intr_3_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_241), 16, 16)) -> intp(3, 0, 38)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
cpu_intr_3_197:
	setx	0x370119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_198:
	setx	0x350220, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_242), 16, 16)) -> intp(3, 0, 38)
cpu_intr_3_199:
	setx	0x37030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_144:
	mov	0x3c6, %r14
	.word 0xf2db84a0  ! 2912: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbb2d2001  ! 2914: SLL_I	sll 	%r20, 0x0001, %r29
iob_intr_3_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_243), 16, 16)) -> intp(3, 0, 15)
	.word 0xb21c8000  ! 2917: XOR_R	xor 	%r18, %r0, %r25
iob_intr_3_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_244), 16, 16)) -> intp(3, 0, 6)
	.word 0xf6ad0020  ! 2924: STBA_R	stba	%r27, [%r20 + %r0] 0x01
iob_intr_3_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_245), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf4348000  ! 2926: STH_R	sth	%r26, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_145:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 2935: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T3_asi_reg_wr_131:
	mov	0x3c3, %r14
	.word 0xf8f38e40  ! 2937: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_3_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_246), 16, 16)) -> intp(3, 0, 25)
iob_intr_3_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_247), 16, 16)) -> intp(3, 0, 2)
iob_intr_3_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_248), 16, 16)) -> intp(3, 0, 1b)
	.word 0xfaf4e019  ! 2943: STXA_I	stxa	%r29, [%r19 + 0x0019] %asi
	.word 0xf0a54020  ! 2944: STWA_R	stwa	%r24, [%r21 + %r0] 0x01
	.word 0x8795a055  ! 2945: WRPR_TT_I	wrpr	%r22, 0x0055, %tt
	.word 0xfcb5c020  ! 2947: STHA_R	stha	%r30, [%r23 + %r0] 0x01
	.word 0xfeb58020  ! 2948: STHA_R	stha	%r31, [%r22 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbab5e0f9  ! 2954: SUBCcc_I	orncc 	%r23, 0x00f9, %r29
	.word 0xbe148000  ! 2955: OR_R	or 	%r18, %r0, %r31
iob_intr_3_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_249), 16, 16)) -> intp(3, 0, 9)
	.word 0xf4b48020  ! 2962: STHA_R	stha	%r26, [%r18 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_200:
	setx	0x340118, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_250), 16, 16)) -> intp(3, 0, 14)
	.word 0xf6a44020  ! 2967: STWA_R	stwa	%r27, [%r17 + %r0] 0x01
cpu_intr_3_201:
	setx	0x360200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ad2002  ! 2971: STBA_I	stba	%r28, [%r20 + 0x0002] %asi
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983cd8  ! 2972: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd8, %hpstate
	.word 0xf0ad61c2  ! 2973: STBA_I	stba	%r24, [%r21 + 0x01c2] %asi
cpu_intr_3_202:
	setx	0x340320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb134a001  ! 2978: SRL_I	srl 	%r18, 0x0001, %r24
cpu_intr_3_203:
	setx	0x36031f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_146:
	mov	0x3c5, %r14
	.word 0xfedb84a0  ! 2980: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xfe2d8000  ! 2982: STB_R	stb	%r31, [%r22 + %r0]
iob_intr_3_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_251), 16, 16)) -> intp(3, 0, 21)
T3_asi_reg_wr_132:
	mov	0x1c, %r14
	.word 0xfaf38e80  ! 2986: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf6a52036  ! 2989: STWA_I	stwa	%r27, [%r20 + 0x0036] %asi
	.word 0xf0b4a1bb  ! 2990: STHA_I	stha	%r24, [%r18 + 0x01bb] %asi
	.word 0xbec48000  ! 2992: ADDCcc_R	addccc 	%r18, %r0, %r31
T3_asi_reg_wr_133:
	mov	0x31, %r14
	.word 0xf2f38e40  ! 2995: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_3_204:
	setx	0x35013d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_252), 16, 16)) -> intp(3, 0, 31)
T3_asi_reg_rd_147:
	mov	0x3c0, %r14
	.word 0xf2db84a0  ! 3001: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_3_205:
	setx	0x34001c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_206:
	setx	0x360027, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_253), 16, 16)) -> intp(3, 0, 8)
T3_asi_reg_wr_134:
	mov	0x3c5, %r14
	.word 0xf2f38e40  ! 3011: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	.word 0xf67421eb  ! 3015: STX_I	stx	%r27, [%r16 + 0x01eb]
T3_asi_reg_wr_135:
	mov	0x31, %r14
	.word 0xfef38e80  ! 3016: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xfc348000  ! 3018: STH_R	sth	%r30, [%r18 + %r0]
	.word 0xf0aca1bb  ! 3020: STBA_I	stba	%r24, [%r18 + 0x01bb] %asi
	ta	T_CHANGE_TO_TL0
	.word 0xf674c000  ! 3024: STX_R	stx	%r27, [%r19 + %r0]
	.word 0xb62ca099  ! 3028: ANDN_I	andn 	%r18, 0x0099, %r27
iob_intr_3_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_254), 16, 16)) -> intp(3, 0, 31)
	ta	T_CHANGE_NONHPRIV
iob_intr_3_255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_255), 16, 16)) -> intp(3, 0, 31)
	.word 0xfa340000  ! 3036: STH_R	sth	%r29, [%r16 + %r0]
	.word 0xfcb52137  ! 3042: STHA_I	stha	%r30, [%r20 + 0x0137] %asi
	.word 0xb204c000  ! 3043: ADD_R	add 	%r19, %r0, %r25
	.word 0xf2258000  ! 3044: STW_R	stw	%r25, [%r22 + %r0]
	.word 0xf8b5c020  ! 3046: STHA_R	stha	%r28, [%r23 + %r0] 0x01
	.word 0xb21d20c9  ! 3050: XOR_I	xor 	%r20, 0x00c9, %r25
cpu_intr_3_207:
	setx	0x350015, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x8198388a  ! 3053: WRHPR_HPSTATE_I	wrhpr	%r0, 0x188a, %hpstate
iob_intr_3_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_256), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf0250000  ! 3055: STW_R	stw	%r24, [%r20 + %r0]
	.word 0xf024c000  ! 3056: STW_R	stw	%r24, [%r19 + %r0]
	.word 0xf674e071  ! 3059: STX_I	stx	%r27, [%r19 + 0x0071]
	.word 0xf82c4000  ! 3061: STB_R	stb	%r28, [%r17 + %r0]
iob_intr_3_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_257), 16, 16)) -> intp(3, 0, 34)
	.word 0xfab52130  ! 3064: STHA_I	stha	%r29, [%r20 + 0x0130] %asi
T3_asi_reg_rd_148:
	mov	0x21, %r14
	.word 0xf2db8e60  ! 3066: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb2a54000  ! 3067: SUBcc_R	subcc 	%r21, %r0, %r25
T3_asi_reg_wr_136:
	mov	0x29, %r14
	.word 0xfcf38e40  ! 3068: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfe340000  ! 3070: STH_R	sth	%r31, [%r16 + %r0]
T3_asi_reg_rd_149:
	mov	0x2e, %r14
	.word 0xf6db8e80  ! 3071: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf2352144  ! 3072: STH_I	sth	%r25, [%r20 + 0x0144]
T3_asi_reg_rd_150:
	mov	0x33, %r14
	.word 0xfedb8400  ! 3073: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_3_208:
	setx	0x360012, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_137:
	mov	0x7, %r14
	.word 0xf8f384a0  ! 3075: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb23de067  ! 3077: XNOR_I	xnor 	%r23, 0x0067, %r25
	.word 0xfef561eb  ! 3081: STXA_I	stxa	%r31, [%r21 + 0x01eb] %asi
iob_intr_3_258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_258), 16, 16)) -> intp(3, 0, 3)
	.word 0xb415e0e8  ! 3083: OR_I	or 	%r23, 0x00e8, %r26
T3_asi_reg_wr_138:
	mov	0x30, %r14
	.word 0xfcf38e40  ! 3085: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_259), 16, 16)) -> intp(3, 0, 37)
	.word 0xf0adc020  ! 3090: STBA_R	stba	%r24, [%r23 + %r0] 0x01
cpu_intr_3_209:
	setx	0x37023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa56056  ! 3093: STWA_I	stwa	%r29, [%r21 + 0x0056] %asi
	.word 0xf0b58020  ! 3095: STHA_R	stha	%r24, [%r22 + %r0] 0x01
cpu_intr_3_210:
	setx	0x37002c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_260), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_wr_139:
	mov	0x12, %r14
	.word 0xfaf389e0  ! 3099: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf4240000  ! 3101: STW_R	stw	%r26, [%r16 + %r0]
T3_asi_reg_wr_140:
	mov	0x2, %r14
	.word 0xf8f384a0  ! 3102: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf02521a8  ! 3103: STW_I	stw	%r24, [%r20 + 0x01a8]
	.word 0xfaa5a0e8  ! 3104: STWA_I	stwa	%r29, [%r22 + 0x00e8] %asi
iob_intr_3_261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_261), 16, 16)) -> intp(3, 0, 1)
	.word 0xf074c000  ! 3115: STX_R	stx	%r24, [%r19 + %r0]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_141:
	mov	0x3c2, %r14
	.word 0xfef384a0  ! 3117: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_3_211:
	setx	0x350320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa42021  ! 3121: STWA_I	stwa	%r29, [%r16 + 0x0021] %asi
cpu_intr_3_212:
	setx	0x35030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4346121  ! 3129: STH_I	sth	%r26, [%r17 + 0x0121]
T3_asi_reg_wr_142:
	mov	0x9, %r14
	.word 0xf8f38400  ! 3130: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T3_asi_reg_wr_143:
	mov	0x6, %r14
	.word 0xf6f38400  ! 3131: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T3_asi_reg_wr_144:
	mov	0x2, %r14
	.word 0xf2f38e40  ! 3132: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfe2d6148  ! 3136: STB_I	stb	%r31, [%r21 + 0x0148]
T3_asi_reg_wr_145:
	mov	0x1c, %r14
	.word 0xfef38e60  ! 3138: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfc35e152  ! 3139: STH_I	sth	%r30, [%r23 + 0x0152]
	.word 0xf8a5c020  ! 3140: STWA_R	stwa	%r28, [%r23 + %r0] 0x01
	.word 0xfc2d4000  ! 3141: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xfeb56092  ! 3143: STHA_I	stha	%r31, [%r21 + 0x0092] %asi
T3_asi_reg_wr_146:
	mov	0x1d, %r14
	.word 0xfef38400  ! 3144: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf0358000  ! 3145: STH_R	sth	%r24, [%r22 + %r0]
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983e40  ! 3146: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e40, %hpstate
T3_asi_reg_rd_151:
	mov	0x3c4, %r14
	.word 0xf0db8400  ! 3147: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf8b4c020  ! 3148: STHA_R	stha	%r28, [%r19 + %r0] 0x01
T3_asi_reg_rd_152:
	mov	0x26, %r14
	.word 0xf6db8400  ! 3152: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf0b461c2  ! 3153: STHA_I	stha	%r24, [%r17 + 0x01c2] %asi
	.word 0xf0a48020  ! 3154: STWA_R	stwa	%r24, [%r18 + %r0] 0x01
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983e10  ! 3155: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e10, %hpstate
iob_intr_3_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_262), 16, 16)) -> intp(3, 0, d)
	.word 0xbf7dc400  ! 3157: MOVR_R	movre	%r23, %r0, %r31
	.word 0xbab40000  ! 3158: SUBCcc_R	orncc 	%r16, %r0, %r29
	.word 0xf6b4e080  ! 3159: STHA_I	stha	%r27, [%r19 + 0x0080] %asi
iob_intr_3_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_263), 16, 16)) -> intp(3, 0, 1)
	.word 0xf4346106  ! 3161: STH_I	sth	%r26, [%r17 + 0x0106]
T3_asi_reg_wr_147:
	mov	0x3c6, %r14
	.word 0xf2f38e60  ! 3162: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf2f4605d  ! 3163: STXA_I	stxa	%r25, [%r17 + 0x005d] %asi
	.word 0xf0ad8020  ! 3164: STBA_R	stba	%r24, [%r22 + %r0] 0x01
T3_asi_reg_wr_148:
	mov	0x2a, %r14
	.word 0xfcf389e0  ! 3166: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	ta	T_CHANGE_NONHPRIV
	.word 0xf4b4c020  ! 3175: STHA_R	stha	%r26, [%r19 + %r0] 0x01
T3_asi_reg_wr_149:
	mov	0x23, %r14
	.word 0xf4f38e80  ! 3176: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xfaa5a0b6  ! 3177: STWA_I	stwa	%r29, [%r22 + 0x00b6] %asi
	.word 0xf874c000  ! 3178: STX_R	stx	%r28, [%r19 + %r0]
cpu_intr_3_213:
	setx	0x370015, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_264), 16, 16)) -> intp(3, 0, 3a)
	.word 0xfe34a0db  ! 3182: STH_I	sth	%r31, [%r18 + 0x00db]
iob_intr_3_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_265), 16, 16)) -> intp(3, 0, a)
T3_asi_reg_rd_153:
	mov	0xb, %r14
	.word 0xfcdb89e0  ! 3187: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xfa25c000  ! 3188: STW_R	stw	%r29, [%r23 + %r0]
T3_asi_reg_wr_150:
	mov	0x15, %r14
	.word 0xf8f38e80  ! 3189: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_3_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_266), 16, 16)) -> intp(3, 0, 36)
cpu_intr_3_214:
	setx	0x36032f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_267), 16, 16)) -> intp(3, 0, 2a)
cpu_intr_3_215:
	setx	0x3b0137, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8395e15f  ! 3199: WRPR_TNPC_I	wrpr	%r23, 0x015f, %tnpc
	.word 0xfe758000  ! 3205: STX_R	stx	%r31, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_268), 16, 16)) -> intp(3, 0, 2b)
cpu_intr_3_216:
	setx	0x3a0236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4acc000  ! 3214: ANDNcc_R	andncc 	%r19, %r0, %r26
T3_asi_reg_wr_151:
	mov	0x1e, %r14
	.word 0xf0f38e80  ! 3216: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xfc34207f  ! 3218: STH_I	sth	%r30, [%r16 + 0x007f]
	ta	T_CHANGE_HPRIV
cpu_intr_3_217:
	setx	0x3b031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x919420ba  ! 3225: WRPR_PIL_I	wrpr	%r16, 0x00ba, %pil
	.word 0xb0b40000  ! 3228: ORNcc_R	orncc 	%r16, %r0, %r24
T3_asi_reg_wr_152:
	mov	0x3c4, %r14
	.word 0xf6f38e80  ! 3229: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xfcf4a118  ! 3233: STXA_I	stxa	%r30, [%r18 + 0x0118] %asi
T3_asi_reg_wr_153:
	mov	0x3c3, %r14
	.word 0xf4f389e0  ! 3234: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf2740000  ! 3235: STX_R	stx	%r25, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf2746161  ! 3238: STX_I	stx	%r25, [%r17 + 0x0161]
T3_asi_reg_wr_154:
	mov	0x14, %r14
	.word 0xfcf38e60  ! 3239: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0x8195218a  ! 3240: WRPR_TPC_I	wrpr	%r20, 0x018a, %tpc
T3_asi_reg_wr_155:
	mov	0x30, %r14
	.word 0xf2f38e40  ! 3243: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfaa54020  ! 3245: STWA_R	stwa	%r29, [%r21 + %r0] 0x01
	.word 0xba8da167  ! 3246: ANDcc_I	andcc 	%r22, 0x0167, %r29
	.word 0xf0f5e1f2  ! 3248: STXA_I	stxa	%r24, [%r23 + 0x01f2] %asi
	.word 0xfe75a154  ! 3250: STX_I	stx	%r31, [%r22 + 0x0154]
	.word 0xb5641800  ! 3251: MOVcc_R	<illegal instruction>
	.word 0xf22dc000  ! 3255: STB_R	stb	%r25, [%r23 + %r0]
T3_asi_reg_wr_156:
	mov	0x3c0, %r14
	.word 0xf4f38e80  ! 3259: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb9354000  ! 3261: SRL_R	srl 	%r21, %r0, %r28
T3_asi_reg_wr_157:
	mov	0x3c4, %r14
	.word 0xfef389e0  ! 3262: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T3_asi_reg_wr_158:
	mov	0x1c, %r14
	.word 0xfaf389e0  ! 3264: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL1
	.word 0xb4ad6141  ! 3266: ANDNcc_I	andncc 	%r21, 0x0141, %r26
iob_intr_3_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_269), 16, 16)) -> intp(3, 0, 1f)
cpu_intr_3_218:
	setx	0x3a021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf2f4e1f2  ! 3273: STXA_I	stxa	%r25, [%r19 + 0x01f2] %asi
	.word 0xf4358000  ! 3275: STH_R	sth	%r26, [%r22 + %r0]
T3_asi_reg_rd_154:
	mov	0x37, %r14
	.word 0xf0db84a0  ! 3277: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_3_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_270), 16, 16)) -> intp(3, 0, 22)
iob_intr_3_271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_271), 16, 16)) -> intp(3, 0, 24)
	.word 0xfcf56068  ! 3282: STXA_I	stxa	%r30, [%r21 + 0x0068] %asi
	.word 0xf4244000  ! 3283: STW_R	stw	%r26, [%r17 + %r0]
cpu_intr_3_219:
	setx	0x39021b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_272), 16, 16)) -> intp(3, 0, 10)
	.word 0xbb3cf001  ! 3289: SRAX_I	srax	%r19, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	.word 0xf4acc020  ! 3293: STBA_R	stba	%r26, [%r19 + %r0] 0x01
T3_asi_reg_wr_159:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 3295: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf6ac4020  ! 3297: STBA_R	stba	%r27, [%r17 + %r0] 0x01
iob_intr_3_273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_273), 16, 16)) -> intp(3, 0, 4)
	.word 0xfe74a150  ! 3300: STX_I	stx	%r31, [%r18 + 0x0150]
T3_asi_reg_rd_155:
	mov	0x21, %r14
	.word 0xfadb8400  ! 3304: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	ta	T_CHANGE_HPRIV
iob_intr_3_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_274), 16, 16)) -> intp(3, 0, 21)
	.word 0xf8f4e0d7  ! 3316: STXA_I	stxa	%r28, [%r19 + 0x00d7] %asi
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_275), 16, 16)) -> intp(3, 0, 7)
	.word 0xf4b46143  ! 3322: STHA_I	stha	%r26, [%r17 + 0x0143] %asi
iob_intr_3_276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_276), 16, 16)) -> intp(3, 0, b)
T3_asi_reg_wr_160:
	mov	0x3c1, %r14
	.word 0xfcf38e80  ! 3325: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbe34c000  ! 3326: SUBC_R	orn 	%r19, %r0, %r31
iob_intr_3_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_277), 16, 16)) -> intp(3, 0, 3e)
cpu_intr_3_220:
	setx	0x3a030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_221:
	setx	0x3a023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf51c000  ! 3334: RDPR_TL	rdpr	%tl, %r31
	.word 0xfe7521cb  ! 3337: STX_I	stx	%r31, [%r20 + 0x01cb]
T3_asi_reg_rd_156:
	mov	0x1a, %r14
	.word 0xf2db8e80  ! 3338: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T3_asi_reg_wr_161:
	mov	0x3c4, %r14
	.word 0xfcf38e40  ! 3340: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_278), 16, 16)) -> intp(3, 0, 6)
T3_asi_reg_rd_157:
	mov	0x10, %r14
	.word 0xfedb8e40  ! 3342: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfc2dc000  ! 3343: STB_R	stb	%r30, [%r23 + %r0]
T3_asi_reg_wr_162:
	mov	0x3c7, %r14
	.word 0xfaf38400  ! 3345: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_3_222:
	setx	0x3b0231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ada11c  ! 3348: STBA_I	stba	%r26, [%r22 + 0x011c] %asi
cpu_intr_3_223:
	setx	0x39032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f56132  ! 3356: STXA_I	stxa	%r25, [%r21 + 0x0132] %asi
T3_asi_reg_rd_158:
	mov	0x4, %r14
	.word 0xf4db84a0  ! 3359: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xfa75e18c  ! 3361: STX_I	stx	%r29, [%r23 + 0x018c]
cpu_intr_3_224:
	setx	0x3b0335, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf035c000  ! 3367: STH_R	sth	%r24, [%r23 + %r0]
cpu_intr_3_225:
	setx	0x3a031f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_163:
	mov	0x1f, %r14
	.word 0xfcf389e0  ! 3369: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf475c000  ! 3370: STX_R	stx	%r26, [%r23 + %r0]
	.word 0xf67461b7  ! 3373: STX_I	stx	%r27, [%r17 + 0x01b7]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_279), 16, 16)) -> intp(3, 0, 3a)
	ta	T_CHANGE_TO_TL1
	.word 0xf22cc000  ! 3381: STB_R	stb	%r25, [%r19 + %r0]
T3_asi_reg_wr_164:
	mov	0x36, %r14
	.word 0xf2f38e60  ! 3383: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T3_asi_reg_rd_159:
	mov	0x3c7, %r14
	.word 0xfadb89e0  ! 3384: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf874a1c3  ! 3385: STX_I	stx	%r28, [%r18 + 0x01c3]
iob_intr_3_280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_280), 16, 16)) -> intp(3, 0, 34)
	.word 0xfea5c020  ! 3387: STWA_R	stwa	%r31, [%r23 + %r0] 0x01
cpu_intr_3_226:
	setx	0x380031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb49ce046  ! 3389: XORcc_I	xorcc 	%r19, 0x0046, %r26
	.word 0xb4b5c000  ! 3391: ORNcc_R	orncc 	%r23, %r0, %r26
	.word 0xf42ce1f8  ! 3393: STB_I	stb	%r26, [%r19 + 0x01f8]
	.word 0xf6a54020  ! 3395: STWA_R	stwa	%r27, [%r21 + %r0] 0x01
	.word 0xf6748000  ! 3396: STX_R	stx	%r27, [%r18 + %r0]
	.word 0xf8ac4020  ! 3399: STBA_R	stba	%r28, [%r17 + %r0] 0x01
cpu_intr_3_227:
	setx	0x39002c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_160:
	mov	0x3c4, %r14
	.word 0xf8db89e0  ! 3402: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_3_281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_281), 16, 16)) -> intp(3, 0, 6)
	.word 0x8194a070  ! 3404: WRPR_TPC_I	wrpr	%r18, 0x0070, %tpc
T3_asi_reg_wr_165:
	mov	0x3c4, %r14
	.word 0xf0f38e40  ! 3406: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_228:
	setx	0x390031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4adc020  ! 3409: STBA_R	stba	%r26, [%r23 + %r0] 0x01
iob_intr_3_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_282), 16, 16)) -> intp(3, 0, 9)
	.word 0xf0750000  ! 3413: STX_R	stx	%r24, [%r20 + %r0]
	ta	T_CHANGE_TO_TL0
iob_intr_3_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_283), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf4f4e14f  ! 3423: STXA_I	stxa	%r26, [%r19 + 0x014f] %asi
T3_asi_reg_rd_161:
	mov	0x3c3, %r14
	.word 0xfedb8400  ! 3424: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_3_229:
	setx	0x380329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b4c020  ! 3430: STHA_R	stha	%r24, [%r19 + %r0] 0x01
iob_intr_3_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_284), 16, 16)) -> intp(3, 0, 6)
	.word 0xfa348000  ! 3432: STH_R	sth	%r29, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0xf6244000  ! 3434: STW_R	stw	%r27, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf234c000  ! 3440: STH_R	sth	%r25, [%r19 + %r0]
	.word 0xf4ad619e  ! 3442: STBA_I	stba	%r26, [%r21 + 0x019e] %asi
cpu_intr_3_230:
	setx	0x380321, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_162:
	mov	0x1b, %r14
	.word 0xfadb8e60  ! 3448: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xfcac6062  ! 3450: STBA_I	stba	%r30, [%r17 + 0x0062] %asi
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982aca  ! 3452: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0aca, %hpstate
	.word 0xf62da0e6  ! 3453: STB_I	stb	%r27, [%r22 + 0x00e6]
iob_intr_3_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_285), 16, 16)) -> intp(3, 0, 37)
	.word 0xf6350000  ! 3457: STH_R	sth	%r27, [%r20 + %r0]
T3_asi_reg_rd_163:
	mov	0x4, %r14
	.word 0xf2db8e40  ! 3460: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_3_231:
	setx	0x3b020d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_166:
	mov	0x14, %r14
	.word 0xfcf38e40  ! 3463: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf4ad4020  ! 3464: STBA_R	stba	%r26, [%r21 + %r0] 0x01
iob_intr_3_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_286), 16, 16)) -> intp(3, 0, 39)
iob_intr_3_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_287), 16, 16)) -> intp(3, 0, 31)
iob_intr_3_288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_288), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf4ad4020  ! 3477: STBA_R	stba	%r26, [%r21 + %r0] 0x01
T3_asi_reg_rd_164:
	mov	0x1a, %r14
	.word 0xfedb8400  ! 3478: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_3_232:
	setx	0x3b032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_167:
	mov	0x2e, %r14
	.word 0xfcf38e80  ! 3480: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_3_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_289), 16, 16)) -> intp(3, 0, a)
	.word 0xfaa58020  ! 3485: STWA_R	stwa	%r29, [%r22 + %r0] 0x01
iob_intr_3_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_290), 16, 16)) -> intp(3, 0, 2)
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982850  ! 3489: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0850, %hpstate
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983ad8  ! 3490: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ad8, %hpstate
	ta	T_CHANGE_NONHPRIV
	.word 0xf2f56047  ! 3493: STXA_I	stxa	%r25, [%r21 + 0x0047] %asi
	.word 0xfc240000  ! 3494: STW_R	stw	%r30, [%r16 + %r0]
cpu_intr_3_233:
	setx	0x3a0315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6a54000  ! 3498: SUBcc_R	subcc 	%r21, %r0, %r27
	.word 0x8f902002  ! 3499: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xb32dd000  ! 3500: SLLX_R	sllx	%r23, %r0, %r25
iob_intr_3_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_291), 16, 16)) -> intp(3, 0, 4)
	.word 0xf02da040  ! 3504: STB_I	stb	%r24, [%r22 + 0x0040]
	.word 0xb814e1e1  ! 3506: OR_I	or 	%r19, 0x01e1, %r28
	.word 0xbd35e001  ! 3508: SRL_I	srl 	%r23, 0x0001, %r30
	.word 0xb8158000  ! 3509: OR_R	or 	%r22, %r0, %r28
	.word 0xbb35e001  ! 3512: SRL_I	srl 	%r23, 0x0001, %r29
	.word 0xf8f4a085  ! 3513: STXA_I	stxa	%r28, [%r18 + 0x0085] %asi
	.word 0xf4744000  ! 3515: STX_R	stx	%r26, [%r17 + %r0]
	.word 0xfe2cc000  ! 3516: STB_R	stb	%r31, [%r19 + %r0]
T3_asi_reg_rd_165:
	mov	0x21, %r14
	.word 0xf0db89e0  ! 3517: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_3_234:
	setx	0x380304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf475c000  ! 3526: STX_R	stx	%r26, [%r23 + %r0]
	.word 0xb6248000  ! 3528: SUB_R	sub 	%r18, %r0, %r27
	.word 0xf8ace040  ! 3529: STBA_I	stba	%r28, [%r19 + 0x0040] %asi
	.word 0xfaac4020  ! 3534: STBA_R	stba	%r29, [%r17 + %r0] 0x01
	.word 0xfc34c000  ! 3535: STH_R	sth	%r30, [%r19 + %r0]
iob_intr_3_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_292), 16, 16)) -> intp(3, 0, 25)
	.word 0xf2344000  ! 3537: STH_R	sth	%r25, [%r17 + %r0]
T3_asi_reg_wr_168:
	mov	0x23, %r14
	.word 0xfef38e40  ! 3539: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb3643801  ! 3540: MOVcc_I	<illegal instruction>
	.word 0xb2342040  ! 3544: SUBC_I	orn 	%r16, 0x0040, %r25
T3_asi_reg_wr_169:
	mov	0x3c8, %r14
	.word 0xfcf38e60  ! 3546: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_3_293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_293), 16, 16)) -> intp(3, 0, 1d)
cpu_intr_3_235:
	setx	0x3a030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa34c000  ! 3550: STH_R	sth	%r29, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfcf421dd  ! 3556: STXA_I	stxa	%r30, [%r16 + 0x01dd] %asi
T3_asi_reg_rd_166:
	mov	0x2f, %r14
	.word 0xf8db8e80  ! 3557: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf2a54020  ! 3560: STWA_R	stwa	%r25, [%r21 + %r0] 0x01
	.word 0xf0ac4020  ! 3566: STBA_R	stba	%r24, [%r17 + %r0] 0x01
T3_asi_reg_wr_170:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 3567: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_3_236:
	setx	0x3b0133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2c21ac  ! 3569: STB_I	stb	%r30, [%r16 + 0x01ac]
cpu_intr_3_237:
	setx	0x39012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb358000  ! 3571: SRL_R	srl 	%r22, %r0, %r29
iob_intr_3_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_294), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_238:
	setx	0x3b020a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_295), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_rd_167:
	mov	0x1b, %r14
	.word 0xf6db8e60  ! 3579: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982912  ! 3581: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0912, %hpstate
iob_intr_3_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_296), 16, 16)) -> intp(3, 0, 37)
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_171:
	mov	0xe, %r14
	.word 0xfaf38e60  ! 3589: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T3_asi_reg_wr_172:
	mov	0xd, %r14
	.word 0xf2f38e80  ! 3592: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf675a00f  ! 3596: STX_I	stx	%r27, [%r22 + 0x000f]
T3_asi_reg_rd_168:
	mov	0x1d, %r14
	.word 0xfcdb8e40  ! 3598: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf0a520dd  ! 3600: STWA_I	stwa	%r24, [%r20 + 0x00dd] %asi
iob_intr_3_297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_297), 16, 16)) -> intp(3, 0, 34)
	.word 0xf4750000  ! 3604: STX_R	stx	%r26, [%r20 + %r0]
	.word 0xf875c000  ! 3605: STX_R	stx	%r28, [%r23 + %r0]
T3_asi_reg_wr_173:
	mov	0x3c5, %r14
	.word 0xf4f38e60  ! 3606: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf2b40020  ! 3612: STHA_R	stha	%r25, [%r16 + %r0] 0x01
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983e42  ! 3613: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e42, %hpstate
	.word 0xf674616e  ! 3615: STX_I	stx	%r27, [%r17 + 0x016e]
	.word 0xb8050000  ! 3616: ADD_R	add 	%r20, %r0, %r28
	.word 0xfe2ca078  ! 3624: STB_I	stb	%r31, [%r18 + 0x0078]
	.word 0xf4752080  ! 3626: STX_I	stx	%r26, [%r20 + 0x0080]
	.word 0xfe35600f  ! 3628: STH_I	sth	%r31, [%r21 + 0x000f]
	.word 0xf4340000  ! 3630: STH_R	sth	%r26, [%r16 + %r0]
cpu_intr_3_239:
	setx	0x3a013b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_174:
	mov	0x2b, %r14
	.word 0xfcf389e0  ! 3637: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T3_asi_reg_wr_175:
	mov	0x3c8, %r14
	.word 0xfcf38e80  ! 3639: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf6b5a0a9  ! 3641: STHA_I	stha	%r27, [%r22 + 0x00a9] %asi
iob_intr_3_298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_298), 16, 16)) -> intp(3, 0, 3d)
iob_intr_3_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_299), 16, 16)) -> intp(3, 0, 26)
	.word 0xfcac21d3  ! 3647: STBA_I	stba	%r30, [%r16 + 0x01d3] %asi
T3_asi_reg_wr_176:
	mov	0x2a, %r14
	.word 0xf6f38e40  ! 3648: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbf643801  ! 3649: MOVcc_I	<illegal instruction>
cpu_intr_3_240:
	setx	0x3f033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8354000  ! 3655: STH_R	sth	%r28, [%r21 + %r0]
cpu_intr_3_241:
	setx	0x3c0315, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_300), 16, 16)) -> intp(3, 0, 8)
T3_asi_reg_wr_177:
	mov	0x1d, %r14
	.word 0xfaf389e0  ! 3662: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb23c8000  ! 3663: XNOR_R	xnor 	%r18, %r0, %r25
	.word 0xf4758000  ! 3666: STX_R	stx	%r26, [%r22 + %r0]
cpu_intr_3_242:
	setx	0x3c0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf074e16d  ! 3668: STX_I	stx	%r24, [%r19 + 0x016d]
T3_asi_reg_wr_178:
	mov	0x1a, %r14
	.word 0xfef38e40  ! 3669: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_3_301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_301), 16, 16)) -> intp(3, 0, 29)
	.word 0xfcac0020  ! 3671: STBA_R	stba	%r30, [%r16 + %r0] 0x01
	.word 0xf8a48020  ! 3674: STWA_R	stwa	%r28, [%r18 + %r0] 0x01
iob_intr_3_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_302), 16, 16)) -> intp(3, 0, 17)
	.word 0xf4a40020  ! 3679: STWA_R	stwa	%r26, [%r16 + %r0] 0x01
	.word 0xf03560ce  ! 3688: STH_I	sth	%r24, [%r21 + 0x00ce]
	.word 0xfc2da019  ! 3690: STB_I	stb	%r30, [%r22 + 0x0019]
	.word 0xf2752174  ! 3693: STX_I	stx	%r25, [%r20 + 0x0174]
iob_intr_3_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_303), 16, 16)) -> intp(3, 0, f)
T3_asi_reg_rd_169:
	mov	0x9, %r14
	.word 0xf8db8e60  ! 3695: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_3_243:
	setx	0x3f0200, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_170:
	mov	0x2c, %r14
	.word 0xfcdb8e40  ! 3698: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf22cc000  ! 3699: STB_R	stb	%r25, [%r19 + %r0]
	.word 0xfca460f5  ! 3701: STWA_I	stwa	%r30, [%r17 + 0x00f5] %asi
T3_asi_reg_rd_171:
	mov	0x3c7, %r14
	.word 0xfedb89e0  ! 3702: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T3_asi_reg_wr_179:
	mov	0x3, %r14
	.word 0xfef38e40  ! 3703: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf2748000  ! 3704: STX_R	stx	%r25, [%r18 + %r0]
	.word 0xfe35a06e  ! 3707: STH_I	sth	%r31, [%r22 + 0x006e]
cpu_intr_3_244:
	setx	0x3e0026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca40020  ! 3709: STWA_R	stwa	%r30, [%r16 + %r0] 0x01
cpu_intr_3_245:
	setx	0x3f0311, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_172:
	mov	0x18, %r14
	.word 0xf4db8400  ! 3711: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	ta	T_CHANGE_HPRIV
iob_intr_3_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_304), 16, 16)) -> intp(3, 0, 2a)
cpu_intr_3_246:
	setx	0x3d0229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa250000  ! 3720: STW_R	stw	%r29, [%r20 + %r0]
iob_intr_3_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_305), 16, 16)) -> intp(3, 0, 0)
	.word 0xfaa48020  ! 3725: STWA_R	stwa	%r29, [%r18 + %r0] 0x01
	.word 0xfe356038  ! 3726: STH_I	sth	%r31, [%r21 + 0x0038]
	ta	T_CHANGE_TO_TL0
iob_intr_3_306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_306), 16, 16)) -> intp(3, 0, 25)
cpu_intr_3_247:
	setx	0x3e0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf275a0b0  ! 3732: STX_I	stx	%r25, [%r22 + 0x00b0]
	.word 0xf62c204a  ! 3734: STB_I	stb	%r27, [%r16 + 0x004a]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf4f520ed  ! 3741: STXA_I	stxa	%r26, [%r20 + 0x00ed] %asi
cpu_intr_3_248:
	setx	0x3d0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ada149  ! 3744: STBA_I	stba	%r26, [%r22 + 0x0149] %asi
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfaa48020  ! 3747: STWA_R	stwa	%r29, [%r18 + %r0] 0x01
cpu_intr_3_249:
	setx	0x3c011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc2ce079  ! 3751: ANDN_I	andn 	%r19, 0x0079, %r30
iob_intr_3_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_307), 16, 16)) -> intp(3, 0, 14)
	.word 0xf0258000  ! 3754: STW_R	stw	%r24, [%r22 + %r0]
	.word 0xf8aca143  ! 3761: STBA_I	stba	%r28, [%r18 + 0x0143] %asi
	.word 0xbf7c4400  ! 3763: MOVR_R	movre	%r17, %r0, %r31
	.word 0xfe34e007  ! 3773: STH_I	sth	%r31, [%r19 + 0x0007]
T3_asi_reg_wr_180:
	mov	0x31, %r14
	.word 0xf8f38e80  ! 3783: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_3_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_308), 16, 16)) -> intp(3, 0, 2f)
T3_asi_reg_rd_173:
	mov	0x3c2, %r14
	.word 0xfcdb8400  ! 3788: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf4254000  ! 3789: STW_R	stw	%r26, [%r21 + %r0]
iob_intr_3_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_309), 16, 16)) -> intp(3, 0, 2)
cpu_intr_3_250:
	setx	0x3e023d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_251:
	setx	0x3e030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b48020  ! 3795: STHA_R	stha	%r24, [%r18 + %r0] 0x01
	.word 0xb8348000  ! 3796: SUBC_R	orn 	%r18, %r0, %r28
	.word 0xfc2461b1  ! 3798: STW_I	stw	%r30, [%r17 + 0x01b1]
T3_asi_reg_rd_174:
	mov	0x32, %r14
	.word 0xf6db89e0  ! 3799: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb69dc000  ! 3802: XORcc_R	xorcc 	%r23, %r0, %r27
	.word 0xfe3560a0  ! 3804: STH_I	sth	%r31, [%r21 + 0x00a0]
	.word 0xfa748000  ! 3806: STX_R	stx	%r29, [%r18 + %r0]
	.word 0xf62d0000  ! 3807: STB_R	stb	%r27, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_181:
	mov	0x3c5, %r14
	.word 0xfcf38400  ! 3810: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x819828ca  ! 3811: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08ca, %hpstate
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
cpu_intr_3_252:
	setx	0x3e032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8740000  ! 3819: STX_R	stx	%r28, [%r16 + %r0]
iob_intr_3_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_310), 16, 16)) -> intp(3, 0, 1d)
T3_asi_reg_wr_182:
	mov	0x2c, %r14
	.word 0xfaf38e60  ! 3822: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xfcb48020  ! 3824: STHA_R	stha	%r30, [%r18 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	.word 0xf0b5c020  ! 3833: STHA_R	stha	%r24, [%r23 + %r0] 0x01
	.word 0xf6ac4020  ! 3835: STBA_R	stba	%r27, [%r17 + %r0] 0x01
cpu_intr_3_253:
	setx	0x3d0311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b5e0e5  ! 3840: STHA_I	stha	%r24, [%r23 + 0x00e5] %asi
	.word 0xf02da083  ! 3841: STB_I	stb	%r24, [%r22 + 0x0083]
T3_asi_reg_wr_183:
	mov	0x3c3, %r14
	.word 0xf0f38e60  ! 3844: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_3_254:
	setx	0x3f0027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc74e07a  ! 3846: STX_I	stx	%r30, [%r19 + 0x007a]
	.word 0xb6b5c000  ! 3847: SUBCcc_R	orncc 	%r23, %r0, %r27
	.word 0xb80d6187  ! 3849: AND_I	and 	%r21, 0x0187, %r28
	.word 0xf875206a  ! 3850: STX_I	stx	%r28, [%r20 + 0x006a]
	.word 0xf0b48020  ! 3851: STHA_R	stha	%r24, [%r18 + %r0] 0x01
	.word 0xf6b50020  ! 3852: STHA_R	stha	%r27, [%r20 + %r0] 0x01
	.word 0xf8b54020  ! 3856: STHA_R	stha	%r28, [%r21 + %r0] 0x01
	.word 0xf2744000  ! 3857: STX_R	stx	%r25, [%r17 + %r0]
	.word 0xfaa4c020  ! 3858: STWA_R	stwa	%r29, [%r19 + %r0] 0x01
T3_asi_reg_rd_175:
	mov	0x3c3, %r14
	.word 0xfcdb89e0  ! 3859: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_3_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_311), 16, 16)) -> intp(3, 0, d)
	.word 0xb8840000  ! 3861: ADDcc_R	addcc 	%r16, %r0, %r28
	.word 0xf834a0c2  ! 3865: STH_I	sth	%r28, [%r18 + 0x00c2]
	.word 0xbb51c000  ! 3870: RDPR_TL	rdpr	%tl, %r29
	ta	T_CHANGE_NONHPRIV
	.word 0xb4ad4000  ! 3874: ANDNcc_R	andncc 	%r21, %r0, %r26
iob_intr_3_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_312), 16, 16)) -> intp(3, 0, 22)
	.word 0xf0744000  ! 3877: STX_R	stx	%r24, [%r17 + %r0]
T3_asi_reg_wr_184:
	mov	0x1f, %r14
	.word 0xfcf38e40  ! 3886: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T3_asi_reg_wr_185:
	mov	0xd, %r14
	.word 0xfef38e80  ! 3887: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T3_asi_reg_rd_176:
	mov	0x23, %r14
	.word 0xf4db8e40  ! 3891: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_255:
	setx	0x3f0139, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_313), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf075e08f  ! 3899: STX_I	stx	%r24, [%r23 + 0x008f]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_314), 16, 16)) -> intp(3, 0, 0)
T3_asi_reg_rd_177:
	mov	0x26, %r14
	.word 0xf6db8400  ! 3903: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf2b5a1c4  ! 3905: STHA_I	stha	%r25, [%r22 + 0x01c4] %asi
	.word 0xfe248000  ! 3910: STW_R	stw	%r31, [%r18 + %r0]
T3_asi_reg_rd_178:
	mov	0x18, %r14
	.word 0xf6db8e80  ! 3912: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
	.word 0xf62d8000  ! 3918: STB_R	stb	%r27, [%r22 + %r0]
T3_asi_reg_wr_186:
	mov	0x1f, %r14
	.word 0xfcf38e60  ! 3919: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_3_256:
	setx	0x3f0123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4f56070  ! 3922: STXA_I	stxa	%r26, [%r21 + 0x0070] %asi
cpu_intr_3_257:
	setx	0x3f023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f42089  ! 3925: STXA_I	stxa	%r25, [%r16 + 0x0089] %asi
	.word 0xf6a44020  ! 3931: STWA_R	stwa	%r27, [%r17 + %r0] 0x01
iob_intr_3_315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_315), 16, 16)) -> intp(3, 0, d)
cpu_intr_3_258:
	setx	0x3c032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_3_316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_316), 16, 16)) -> intp(3, 0, 2c)
	.word 0xfa2561be  ! 3944: STW_I	stw	%r29, [%r21 + 0x01be]
	.word 0xf62c0000  ! 3946: STB_R	stb	%r27, [%r16 + %r0]
cpu_intr_3_259:
	setx	0x3c0207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf424c000  ! 3948: STW_R	stw	%r26, [%r19 + %r0]
	.word 0xfa756080  ! 3949: STX_I	stx	%r29, [%r21 + 0x0080]
	ta	T_CHANGE_TO_TL0
cpu_intr_3_260:
	setx	0x3f0325, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_179:
	mov	0xa, %r14
	.word 0xf8db84a0  ! 3960: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_3_261:
	setx	0x3e013e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_262:
	setx	0x3f0109, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_263:
	setx	0x3e0114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa5e0e9  ! 3965: STWA_I	stwa	%r29, [%r23 + 0x00e9] %asi
	.word 0xf4740000  ! 3966: STX_R	stx	%r26, [%r16 + %r0]
T3_asi_reg_rd_180:
	mov	0x22, %r14
	.word 0xfcdb8e60  ! 3967: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf675a166  ! 3969: STX_I	stx	%r27, [%r22 + 0x0166]
cpu_intr_3_264:
	setx	0x3d0127, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_181:
	mov	0x23, %r14
	.word 0xfcdb8e80  ! 3971: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xfca5a190  ! 3975: STWA_I	stwa	%r30, [%r22 + 0x0190] %asi
iob_intr_3_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_317), 16, 16)) -> intp(3, 0, 1c)
iob_intr_3_318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_318), 16, 16)) -> intp(3, 0, 37)
	.word 0xfaad4020  ! 3982: STBA_R	stba	%r29, [%r21 + %r0] 0x01
	.word 0xfaada039  ! 3983: STBA_I	stba	%r29, [%r22 + 0x0039] %asi
iob_intr_3_319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_319), 16, 16)) -> intp(3, 0, 7)
iob_intr_3_320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_320), 16, 16)) -> intp(3, 0, 3d)
	.word 0xfca40020  ! 3988: STWA_R	stwa	%r30, [%r16 + %r0] 0x01
T3_asi_reg_rd_182:
	mov	0x35, %r14
	.word 0xf8db89e0  ! 3990: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_3_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_321), 16, 16)) -> intp(3, 0, 31)
T3_asi_reg_rd_183:
	mov	0x18, %r14
	.word 0xf2db8e40  ! 3995: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_3_265:
	setx	0x3e0203, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_184:
	mov	0x2a, %r14
	.word 0xfedb8e40  ! 3999: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf6750000  ! 4000: STX_R	stx	%r27, [%r20 + %r0]
T3_asi_reg_rd_185:
	mov	0x3, %r14
	.word 0xfadb8e40  ! 4001: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_3_266:
	setx	0x3c0023, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_322), 16, 16)) -> intp(3, 0, 13)
T3_asi_reg_rd_186:
	mov	0x6, %r14
	.word 0xfcdb8e60  ! 4005: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbd2d4000  ! 4006: SLL_R	sll 	%r21, %r0, %r30
	ta	T_CHANGE_TO_TL1
	.word 0xfa34c000  ! 4009: STH_R	sth	%r29, [%r19 + %r0]
iob_intr_3_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_323), 16, 16)) -> intp(3, 0, 34)
	.word 0xbe258000  ! 4012: SUB_R	sub 	%r22, %r0, %r31
	.word 0xfcaca1ef  ! 4013: STBA_I	stba	%r30, [%r18 + 0x01ef] %asi
cpu_intr_3_267:
	setx	0x3c021d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_268:
	setx	0x3f023e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_269:
	setx	0x3f0202, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_187:
	mov	0x2f, %r14
	.word 0xf2f38e40  ! 4023: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x8198394a  ! 4028: WRHPR_HPSTATE_I	wrhpr	%r0, 0x194a, %hpstate
	.word 0xf6f4e13a  ! 4029: STXA_I	stxa	%r27, [%r19 + 0x013a] %asi
iob_intr_3_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_324), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf8f4615d  ! 4032: STXA_I	stxa	%r28, [%r17 + 0x015d] %asi
	.word 0xbac5207d  ! 4034: ADDCcc_I	addccc 	%r20, 0x007d, %r29
	.word 0xf0f5e0a5  ! 4035: STXA_I	stxa	%r24, [%r23 + 0x00a5] %asi
	.word 0xfe2ca028  ! 4036: STB_I	stb	%r31, [%r18 + 0x0028]
iob_intr_3_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_325), 16, 16)) -> intp(3, 0, 0)
	.word 0xf0ade0ea  ! 4039: STBA_I	stba	%r24, [%r23 + 0x00ea] %asi
cpu_intr_3_270:
	setx	0x3f0021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a5c020  ! 4045: STWA_R	stwa	%r28, [%r23 + %r0] 0x01
iob_intr_3_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_326), 16, 16)) -> intp(3, 0, c)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfea42000  ! 4053: STWA_I	stwa	%r31, [%r16 + 0x0000] %asi
T3_asi_reg_wr_188:
	mov	0x9, %r14
	.word 0xfaf38400  ! 4054: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_3_327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_327), 16, 16)) -> intp(3, 0, 25)
T3_asi_reg_wr_189:
	mov	0x3c2, %r14
	.word 0xf2f38e80  ! 4065: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T3_asi_reg_rd_187:
	mov	0x21, %r14
	.word 0xfadb8e40  ! 4067: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_188:
	mov	0x34, %r14
	.word 0xfedb84a0  ! 4072: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_3_271:
	setx	0x3f033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6adc020  ! 4079: STBA_R	stba	%r27, [%r23 + %r0] 0x01
iob_intr_3_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_328), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf0a40020  ! 4082: STWA_R	stwa	%r24, [%r16 + %r0] 0x01
cpu_intr_3_272:
	setx	0x3d0017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a42008  ! 4084: STWA_I	stwa	%r26, [%r16 + 0x0008] %asi
	.word 0xf67521ef  ! 4088: STX_I	stx	%r27, [%r20 + 0x01ef]
T3_asi_reg_wr_190:
	mov	0x3c3, %r14
	.word 0xf8f38400  ! 4090: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T3_asi_reg_wr_191:
	mov	0xb, %r14
	.word 0xf2f38e40  ! 4091: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf22da13a  ! 4092: STB_I	stb	%r25, [%r22 + 0x013a]
	.word 0xf22ce1f0  ! 4094: STB_I	stb	%r25, [%r19 + 0x01f0]
iob_intr_3_329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_329), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_273:
	setx	0x42032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xbca58000  ! 4105: SUBcc_R	subcc 	%r22, %r0, %r30
	.word 0xba246111  ! 4113: SUB_I	sub 	%r17, 0x0111, %r29
T3_asi_reg_rd_189:
	mov	0x3c7, %r14
	.word 0xfadb8e80  ! 4115: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xfa2c205e  ! 4116: STB_I	stb	%r29, [%r16 + 0x005e]
T3_asi_reg_rd_190:
	mov	0x2, %r14
	.word 0xf8db8e80  ! 4118: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_3_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_330), 16, 16)) -> intp(3, 0, 1b)
	.word 0xb52ce001  ! 4126: SLL_I	sll 	%r19, 0x0001, %r26
	.word 0xf2a4a13f  ! 4128: STWA_I	stwa	%r25, [%r18 + 0x013f] %asi
	.word 0xfe2c0000  ! 4129: STB_R	stb	%r31, [%r16 + %r0]
cpu_intr_3_274:
	setx	0x40003b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_192:
	mov	0x10, %r14
	.word 0xf4f38e60  ! 4133: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_3_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_331), 16, 16)) -> intp(3, 0, 2f)
	.word 0xbe248000  ! 4135: SUB_R	sub 	%r18, %r0, %r31
	ta	T_CHANGE_TO_TL1
	.word 0xfe2ca151  ! 4139: STB_I	stb	%r31, [%r18 + 0x0151]
iob_intr_3_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_332), 16, 16)) -> intp(3, 0, 24)
iob_intr_3_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_333), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_rd_191:
	mov	0x24, %r14
	.word 0xfcdb84a0  ! 4144: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf2742002  ! 4145: STX_I	stx	%r25, [%r16 + 0x0002]
	.word 0xfeb5c020  ! 4146: STHA_R	stha	%r31, [%r23 + %r0] 0x01
iob_intr_3_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_334), 16, 16)) -> intp(3, 0, 1)
	.word 0xf635a08e  ! 4152: STH_I	sth	%r27, [%r22 + 0x008e]
cpu_intr_3_275:
	setx	0x430010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe74e19a  ! 4156: STX_I	stx	%r31, [%r19 + 0x019a]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_193:
	mov	0x38, %r14
	.word 0xfcf38e40  ! 4167: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfca4e1b5  ! 4170: STWA_I	stwa	%r30, [%r19 + 0x01b5] %asi
	.word 0xfe2ca0b8  ! 4173: STB_I	stb	%r31, [%r18 + 0x00b8]
T3_asi_reg_wr_194:
	mov	0x28, %r14
	.word 0xf0f38400  ! 4174: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb3350000  ! 4177: SRL_R	srl 	%r20, %r0, %r25
T3_asi_reg_rd_192:
	mov	0x3c3, %r14
	.word 0xf8db8e60  ! 4178: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_3_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_335), 16, 16)) -> intp(3, 0, 17)
cpu_intr_3_276:
	setx	0x40032a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_336), 16, 16)) -> intp(3, 0, 35)
	.word 0xfc758000  ! 4185: STX_R	stx	%r30, [%r22 + %r0]
iob_intr_3_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_337), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_277:
	setx	0x400327, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_338), 16, 16)) -> intp(3, 0, 21)
T3_asi_reg_wr_195:
	mov	0x3c8, %r14
	.word 0xfef38400  ! 4197: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_3_278:
	setx	0x420111, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_279:
	setx	0x410210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab4e045  ! 4201: STHA_I	stha	%r29, [%r19 + 0x0045] %asi
	ta	T_CHANGE_NONHPRIV
	.word 0xfa256108  ! 4207: STW_I	stw	%r29, [%r21 + 0x0108]
T3_asi_reg_rd_193:
	mov	0x3c3, %r14
	.word 0xf2db84a0  ! 4212: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf2a4618f  ! 4213: STWA_I	stwa	%r25, [%r17 + 0x018f] %asi
	.word 0xb53c8000  ! 4214: SRA_R	sra 	%r18, %r0, %r26
cpu_intr_3_280:
	setx	0x430209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0758000  ! 4218: STX_R	stx	%r24, [%r22 + %r0]
	.word 0xfeb4e013  ! 4221: STHA_I	stha	%r31, [%r19 + 0x0013] %asi
T3_asi_reg_wr_196:
	mov	0x19, %r14
	.word 0xf2f38e40  ! 4222: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf8b4212e  ! 4225: STHA_I	stha	%r28, [%r16 + 0x012e] %asi
iob_intr_3_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_339), 16, 16)) -> intp(3, 0, b)
iob_intr_3_340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_340), 16, 16)) -> intp(3, 0, 1)
cpu_intr_3_281:
	setx	0x410212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4352188  ! 4232: STH_I	sth	%r26, [%r20 + 0x0188]
	ta	T_CHANGE_TO_TL1
cpu_intr_3_282:
	setx	0x42001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe7521a6  ! 4237: STX_I	stx	%r31, [%r20 + 0x01a6]
	.word 0xf0b5a0e5  ! 4238: STHA_I	stha	%r24, [%r22 + 0x00e5] %asi
cpu_intr_3_283:
	setx	0x41030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2ca139  ! 4240: STB_I	stb	%r30, [%r18 + 0x0139]
	.word 0xfcb40020  ! 4241: STHA_R	stha	%r30, [%r16 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_284:
	setx	0x40002f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_341), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_rd_194:
	mov	0x17, %r14
	.word 0xfcdb8e40  ! 4253: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983a80  ! 4254: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a80, %hpstate
	.word 0xf225c000  ! 4255: STW_R	stw	%r25, [%r23 + %r0]
iob_intr_3_342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_342), 16, 16)) -> intp(3, 0, 3)
	ta	T_CHANGE_TO_TL0
	.word 0xf02c0000  ! 4259: STB_R	stb	%r24, [%r16 + %r0]
	.word 0xfcb5c020  ! 4260: STHA_R	stha	%r30, [%r23 + %r0] 0x01
cpu_intr_3_285:
	setx	0x420214, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_343), 16, 16)) -> intp(3, 0, 1a)
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983e08  ! 4265: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e08, %hpstate
	ta	T_CHANGE_NONHPRIV
	.word 0xfaa58020  ! 4267: STWA_R	stwa	%r29, [%r22 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
	.word 0xf6254000  ! 4275: STW_R	stw	%r27, [%r21 + %r0]
	.word 0x89946026  ! 4276: WRPR_TICK_I	wrpr	%r17, 0x0026, %tick
cpu_intr_3_286:
	setx	0x420221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab4c020  ! 4279: STHA_R	stha	%r29, [%r19 + %r0] 0x01
	.word 0xfca5c020  ! 4282: STWA_R	stwa	%r30, [%r23 + %r0] 0x01
cpu_intr_3_287:
	setx	0x410000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb535b001  ! 4286: SRLX_I	srlx	%r22, 0x0001, %r26
iob_intr_3_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_344), 16, 16)) -> intp(3, 0, d)
cpu_intr_3_288:
	setx	0x430004, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_345), 16, 16)) -> intp(3, 0, 37)
	.word 0xb825209a  ! 4296: SUB_I	sub 	%r20, 0x009a, %r28
T3_asi_reg_rd_195:
	mov	0x3c5, %r14
	.word 0xf6db84a0  ! 4299: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_197:
	mov	0x32, %r14
	.word 0xf6f38e80  ! 4302: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf8252122  ! 4303: STW_I	stw	%r28, [%r20 + 0x0122]
	.word 0xf2a48020  ! 4307: STWA_R	stwa	%r25, [%r18 + %r0] 0x01
cpu_intr_3_289:
	setx	0x430330, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf22de09d  ! 4310: STB_I	stb	%r25, [%r23 + 0x009d]
	.word 0xf2350000  ! 4314: STH_R	sth	%r25, [%r20 + %r0]
cpu_intr_3_290:
	setx	0x400000, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_196:
	mov	0x11, %r14
	.word 0xfadb84a0  ! 4318: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf8f52026  ! 4320: STXA_I	stxa	%r28, [%r20 + 0x0026] %asi
	.word 0xfe2c2060  ! 4322: STB_I	stb	%r31, [%r16 + 0x0060]
	.word 0xf8b561a6  ! 4326: STHA_I	stha	%r28, [%r21 + 0x01a6] %asi
cpu_intr_3_291:
	setx	0x420305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ace1ec  ! 4328: STBA_I	stba	%r26, [%r19 + 0x01ec] %asi
	.word 0xfc74c000  ! 4330: STX_R	stx	%r30, [%r19 + %r0]
	.word 0xfca4c020  ! 4331: STWA_R	stwa	%r30, [%r19 + %r0] 0x01
	.word 0xfc2d20e8  ! 4332: STB_I	stb	%r30, [%r20 + 0x00e8]
T3_asi_reg_wr_198:
	mov	0x3c5, %r14
	.word 0xf8f38e80  ! 4335: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_3_346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_346), 16, 16)) -> intp(3, 0, f)
	.word 0xf6b5c020  ! 4337: STHA_R	stha	%r27, [%r23 + %r0] 0x01
cpu_intr_3_292:
	setx	0x410333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfef421c8  ! 4341: STXA_I	stxa	%r31, [%r16 + 0x01c8] %asi
	.word 0xfca4c020  ! 4344: STWA_R	stwa	%r30, [%r19 + %r0] 0x01
T3_asi_reg_rd_197:
	mov	0x1c, %r14
	.word 0xfadb8e60  ! 4345: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xfeace177  ! 4346: STBA_I	stba	%r31, [%r19 + 0x0177] %asi
T3_asi_reg_rd_198:
	mov	0xe, %r14
	.word 0xf2db8e40  ! 4347: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf8a561bf  ! 4350: STWA_I	stwa	%r28, [%r21 + 0x01bf] %asi
	.word 0xfcf5e1d8  ! 4351: STXA_I	stxa	%r30, [%r23 + 0x01d8] %asi
	ta	T_CHANGE_TO_TL1
	.word 0xbe44a0d5  ! 4354: ADDC_I	addc 	%r18, 0x00d5, %r31
iob_intr_3_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_347), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf2356039  ! 4357: STH_I	sth	%r25, [%r21 + 0x0039]
iob_intr_3_348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_348), 16, 16)) -> intp(3, 0, 30)
	.word 0xfea4c020  ! 4360: STWA_R	stwa	%r31, [%r19 + %r0] 0x01
	.word 0xbab54000  ! 4361: SUBCcc_R	orncc 	%r21, %r0, %r29
iob_intr_3_349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_349), 16, 16)) -> intp(3, 0, 20)
	.word 0xfe2cc000  ! 4363: STB_R	stb	%r31, [%r19 + %r0]
	.word 0xf2ad20bf  ! 4367: STBA_I	stba	%r25, [%r20 + 0x00bf] %asi
iob_intr_3_350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_350), 16, 16)) -> intp(3, 0, 4)
cpu_intr_3_293:
	setx	0x42022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf675e13f  ! 4373: STX_I	stx	%r27, [%r23 + 0x013f]
	.word 0xb0356158  ! 4374: SUBC_I	orn 	%r21, 0x0158, %r24
T3_asi_reg_wr_199:
	mov	0x37, %r14
	.word 0xfef38e60  ! 4377: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_3_294:
	setx	0x400330, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_295:
	setx	0x40012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa248000  ! 4384: STW_R	stw	%r29, [%r18 + %r0]
T3_asi_reg_rd_199:
	mov	0x11, %r14
	.word 0xf8db8e40  ! 4385: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf6754000  ! 4387: STX_R	stx	%r27, [%r21 + %r0]
T3_asi_reg_wr_200:
	mov	0x24, %r14
	.word 0xf0f38e40  ! 4388: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf2350000  ! 4389: STH_R	sth	%r25, [%r20 + %r0]
	.word 0xf0a520d4  ! 4391: STWA_I	stwa	%r24, [%r20 + 0x00d4] %asi
iob_intr_3_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_351), 16, 16)) -> intp(3, 0, 27)
iob_intr_3_352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_352), 16, 16)) -> intp(3, 0, 22)
	.word 0xf02ce11c  ! 4395: STB_I	stb	%r24, [%r19 + 0x011c]
iob_intr_3_353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_353), 16, 16)) -> intp(3, 0, f)
cpu_intr_3_296:
	setx	0x43030d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_297:
	setx	0x400202, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_200:
	mov	0x33, %r14
	.word 0xf8db8e60  ! 4402: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_3_298:
	setx	0x41033a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_354), 16, 16)) -> intp(3, 0, 3f)
	ta	T_CHANGE_TO_TL0
	.word 0xfe24e062  ! 4407: STW_I	stw	%r31, [%r19 + 0x0062]
	.word 0xf0342054  ! 4408: STH_I	sth	%r24, [%r16 + 0x0054]
	.word 0xf2a5e172  ! 4409: STWA_I	stwa	%r25, [%r23 + 0x0172] %asi
iob_intr_3_355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_355), 16, 16)) -> intp(3, 0, 19)
	.word 0xfa2c2014  ! 4412: STB_I	stb	%r29, [%r16 + 0x0014]
T3_asi_reg_wr_201:
	mov	0xb, %r14
	.word 0xfef38e80  ! 4413: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf27420a6  ! 4415: STX_I	stx	%r25, [%r16 + 0x00a6]
	.word 0xbe9ce024  ! 4416: XORcc_I	xorcc 	%r19, 0x0024, %r31
	.word 0xf8348000  ! 4420: STH_R	sth	%r28, [%r18 + %r0]
	.word 0xf2b4e1d2  ! 4425: STHA_I	stha	%r25, [%r19 + 0x01d2] %asi
	.word 0xfea46055  ! 4426: STWA_I	stwa	%r31, [%r17 + 0x0055] %asi
T3_asi_reg_wr_202:
	mov	0x1f, %r14
	.word 0xf2f389e0  ! 4427: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T3_asi_reg_rd_201:
	mov	0x28, %r14
	.word 0xf0db8400  ! 4429: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_356), 16, 16)) -> intp(3, 0, 2a)
T3_asi_reg_rd_202:
	mov	0x6, %r14
	.word 0xfadb84a0  ! 4432: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_3_299:
	setx	0x42013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0854000  ! 4434: ADDcc_R	addcc 	%r21, %r0, %r24
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982f82  ! 4435: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f82, %hpstate
iob_intr_3_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_357), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_wr_203:
	mov	0x19, %r14
	.word 0xf8f389e0  ! 4438: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T3_asi_reg_rd_203:
	mov	0x30, %r14
	.word 0xf8db8e40  ! 4439: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf0ad4020  ! 4441: STBA_R	stba	%r24, [%r21 + %r0] 0x01
iob_intr_3_358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_358), 16, 16)) -> intp(3, 0, 32)
	.word 0xfeaca0a3  ! 4446: STBA_I	stba	%r31, [%r18 + 0x00a3] %asi
cpu_intr_3_300:
	setx	0x42010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02c6146  ! 4448: STB_I	stb	%r24, [%r17 + 0x0146]
	.word 0xf4f4204f  ! 4449: STXA_I	stxa	%r26, [%r16 + 0x004f] %asi
	.word 0xf22de0f1  ! 4451: STB_I	stb	%r25, [%r23 + 0x00f1]
T3_asi_reg_wr_204:
	mov	0x38, %r14
	.word 0xf2f38e40  ! 4452: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb6b5610a  ! 4454: SUBCcc_I	orncc 	%r21, 0x010a, %r27
	.word 0xf4acc020  ! 4456: STBA_R	stba	%r26, [%r19 + %r0] 0x01
T3_asi_reg_wr_205:
	mov	0x3c1, %r14
	.word 0xfcf38400  ! 4459: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T3_asi_reg_rd_204:
	mov	0x1, %r14
	.word 0xfadb84a0  ! 4463: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T3_asi_reg_wr_206:
	mov	0x2, %r14
	.word 0xf0f384a0  ! 4464: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_3_359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_359), 16, 16)) -> intp(3, 0, 21)
T3_asi_reg_wr_207:
	mov	0x3c3, %r14
	.word 0xf0f384a0  ! 4466: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_3_301:
	setx	0x410322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf825a0a4  ! 4468: STW_I	stw	%r28, [%r22 + 0x00a4]
iob_intr_3_360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_360), 16, 16)) -> intp(3, 0, 17)
T3_asi_reg_wr_208:
	mov	0x11, %r14
	.word 0xf4f38e40  ! 4470: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T3_asi_reg_wr_209:
	mov	0x3c6, %r14
	.word 0xf6f384a0  ! 4473: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_3_302:
	setx	0x410315, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_210:
	mov	0x30, %r14
	.word 0xf4f38e40  ! 4480: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_3_361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_361), 16, 16)) -> intp(3, 0, 15)
T3_asi_reg_rd_205:
	mov	0x1b, %r14
	.word 0xf4db8400  ! 4485: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_3_303:
	setx	0x400330, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_362), 16, 16)) -> intp(3, 0, c)
cpu_intr_3_304:
	setx	0x40022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca5e003  ! 4494: STWA_I	stwa	%r30, [%r23 + 0x0003] %asi
iob_intr_3_363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_363), 16, 16)) -> intp(3, 0, 1a)
T3_asi_reg_wr_211:
	mov	0x16, %r14
	.word 0xf6f389e0  ! 4497: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf624e039  ! 4498: STW_I	stw	%r27, [%r19 + 0x0039]
T3_asi_reg_rd_206:
	mov	0x3c3, %r14
	.word 0xfedb8400  ! 4499: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983d0a  ! 4501: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d0a, %hpstate
	.word 0xf8f5e1e4  ! 4503: STXA_I	stxa	%r28, [%r23 + 0x01e4] %asi
iob_intr_3_364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_364), 16, 16)) -> intp(3, 0, 0)
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983fc2  ! 4508: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc2, %hpstate
T3_asi_reg_rd_207:
	mov	0x12, %r14
	.word 0xfedb84a0  ! 4509: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T3_asi_reg_wr_212:
	mov	0x10, %r14
	.word 0xf4f38e80  ! 4512: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xfab5612a  ! 4515: STHA_I	stha	%r29, [%r21 + 0x012a] %asi
	.word 0xba4420e8  ! 4516: ADDC_I	addc 	%r16, 0x00e8, %r29
	.word 0xf074c000  ! 4517: STX_R	stx	%r24, [%r19 + %r0]
cpu_intr_3_305:
	setx	0x410116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_365), 16, 16)) -> intp(3, 0, 3e)
	.word 0xfaf5217e  ! 4521: STXA_I	stxa	%r29, [%r20 + 0x017e] %asi
T3_asi_reg_rd_208:
	mov	0x3c4, %r14
	.word 0xf2db84a0  ! 4522: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xfca46176  ! 4526: STWA_I	stwa	%r30, [%r17 + 0x0176] %asi
iob_intr_3_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_366), 16, 16)) -> intp(3, 0, b)
	ta	T_CHANGE_TO_TL1
	.word 0xb1641800  ! 4533: MOVcc_R	<illegal instruction>
T3_asi_reg_wr_213:
	mov	0x11, %r14
	.word 0xfaf384a0  ! 4535: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_306:
	setx	0x41013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a48020  ! 4539: STWA_R	stwa	%r26, [%r18 + %r0] 0x01
	.word 0xf0240000  ! 4540: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xf8b54020  ! 4543: STHA_R	stha	%r28, [%r21 + %r0] 0x01
	.word 0xfca5c020  ! 4544: STWA_R	stwa	%r30, [%r23 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
cpu_intr_3_307:
	setx	0x40022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ac8020  ! 4551: STBA_R	stba	%r26, [%r18 + %r0] 0x01
	.word 0xb4944000  ! 4552: ORcc_R	orcc 	%r17, %r0, %r26
iob_intr_3_367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_367), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf42d2193  ! 4559: STB_I	stb	%r26, [%r20 + 0x0193]
	.word 0xfa25c000  ! 4566: STW_R	stw	%r29, [%r23 + %r0]
cpu_intr_3_308:
	setx	0x41033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b48020  ! 4569: STHA_R	stha	%r28, [%r18 + %r0] 0x01
	.word 0xfab5a069  ! 4570: STHA_I	stha	%r29, [%r22 + 0x0069] %asi
T3_asi_reg_rd_209:
	mov	0x31, %r14
	.word 0xf6db84a0  ! 4571: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	ta	T_CHANGE_TO_TL1
	.word 0xf8a421c2  ! 4573: STWA_I	stwa	%r28, [%r16 + 0x01c2] %asi
	.word 0xf22c2081  ! 4574: STB_I	stb	%r25, [%r16 + 0x0081]
	.word 0xfc25e0b5  ! 4577: STW_I	stw	%r30, [%r23 + 0x00b5]
cpu_intr_3_309:
	setx	0x410220, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_214:
	mov	0x0, %r14
	.word 0xf4f38e60  ! 4579: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_3_310:
	setx	0x440033, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_3_311:
	setx	0x45020d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_368), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf8a58020  ! 4587: STWA_R	stwa	%r28, [%r22 + %r0] 0x01
iob_intr_3_369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_369), 16, 16)) -> intp(3, 0, 7)
	.word 0xf835e15f  ! 4590: STH_I	sth	%r28, [%r23 + 0x015f]
	.word 0xf4b5c020  ! 4591: STHA_R	stha	%r26, [%r23 + %r0] 0x01
T3_asi_reg_rd_210:
	mov	0x3c6, %r14
	.word 0xfedb8e60  ! 4592: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T3_asi_reg_wr_215:
	mov	0x3c3, %r14
	.word 0xfef384a0  ! 4598: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb93d9000  ! 4599: SRAX_R	srax	%r22, %r0, %r28
	.word 0xf42c60a6  ! 4601: STB_I	stb	%r26, [%r17 + 0x00a6]
	.word 0xf6358000  ! 4602: STH_R	sth	%r27, [%r22 + %r0]
T3_asi_reg_wr_216:
	mov	0x3, %r14
	.word 0xf4f38e60  ! 4604: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_3_312:
	setx	0x46032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa74e069  ! 4608: STX_I	stx	%r29, [%r19 + 0x0069]
iob_intr_3_370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_370), 16, 16)) -> intp(3, 0, 2b)
	.word 0xfe246028  ! 4614: STW_I	stw	%r31, [%r17 + 0x0028]
iob_intr_3_371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_371), 16, 16)) -> intp(3, 0, c)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_372), 16, 16)) -> intp(3, 0, 25)
cpu_intr_3_313:
	setx	0x45010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb51c000  ! 4624: RDPR_TL	rdpr	%tl, %r29
iob_intr_3_373:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_373), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_rd_211:
	mov	0x3c7, %r14
	.word 0xf0db89e0  ! 4629: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb29ca055  ! 4630: XORcc_I	xorcc 	%r18, 0x0055, %r25
	.word 0xf824c000  ! 4632: STW_R	stw	%r28, [%r19 + %r0]
T3_asi_reg_rd_212:
	mov	0xc, %r14
	.word 0xfcdb8e40  ! 4633: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf675a0ef  ! 4635: STX_I	stx	%r27, [%r22 + 0x00ef]
	ta	T_CHANGE_TO_TL0
	.word 0xf0348000  ! 4642: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xf475602a  ! 4644: STX_I	stx	%r26, [%r21 + 0x002a]
	.word 0xfcb4c020  ! 4645: STHA_R	stha	%r30, [%r19 + %r0] 0x01
	.word 0xf635c000  ! 4646: STH_R	sth	%r27, [%r23 + %r0]
T3_asi_reg_rd_213:
	mov	0x38, %r14
	.word 0xf0db89e0  ! 4647: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_3_374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_374), 16, 16)) -> intp(3, 0, 35)
	.word 0xfa758000  ! 4652: STX_R	stx	%r29, [%r22 + %r0]
	.word 0xf22c4000  ! 4654: STB_R	stb	%r25, [%r17 + %r0]
cpu_intr_3_314:
	setx	0x440338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcace1af  ! 4656: STBA_I	stba	%r30, [%r19 + 0x01af] %asi
cpu_intr_3_315:
	setx	0x44022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b4a062  ! 4661: STHA_I	stha	%r25, [%r18 + 0x0062] %asi
	.word 0xf0b54020  ! 4664: STHA_R	stha	%r24, [%r21 + %r0] 0x01
T3_asi_reg_rd_214:
	mov	0x35, %r14
	.word 0xfedb8e80  ! 4666: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_3_375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_375), 16, 16)) -> intp(3, 0, f)
	.word 0xfca520a4  ! 4672: STWA_I	stwa	%r30, [%r20 + 0x00a4] %asi
	.word 0xb8bda0a5  ! 4674: XNORcc_I	xnorcc 	%r22, 0x00a5, %r28
	.word 0xbe344000  ! 4675: SUBC_R	orn 	%r17, %r0, %r31
	.word 0xf0a52046  ! 4677: STWA_I	stwa	%r24, [%r20 + 0x0046] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_217:
	mov	0x3c2, %r14
	.word 0xfef384a0  ! 4681: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T3_asi_reg_wr_218:
	mov	0xb, %r14
	.word 0xfaf38400  ! 4682: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf42c60a5  ! 4684: STB_I	stb	%r26, [%r17 + 0x00a5]
cpu_intr_3_316:
	setx	0x440323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8f5a17c  ! 4687: STXA_I	stxa	%r28, [%r22 + 0x017c] %asi
	.word 0xfaad8020  ! 4688: STBA_R	stba	%r29, [%r22 + %r0] 0x01
	.word 0xb4056171  ! 4689: ADD_I	add 	%r21, 0x0171, %r26
	.word 0xb88c617a  ! 4691: ANDcc_I	andcc 	%r17, 0x017a, %r28
T3_asi_reg_wr_219:
	mov	0x3, %r14
	.word 0xf2f38e40  ! 4694: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_wr_220:
	mov	0x9, %r14
	.word 0xfef38e60  ! 4696: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfc24e071  ! 4697: STW_I	stw	%r30, [%r19 + 0x0071]
	.word 0xfa350000  ! 4699: STH_R	sth	%r29, [%r20 + %r0]
T3_asi_reg_wr_221:
	mov	0xf, %r14
	.word 0xfcf38e40  ! 4700: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T3_asi_reg_rd_215:
	mov	0x3c3, %r14
	.word 0xf0db8e60  ! 4701: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xfc744000  ! 4703: STX_R	stx	%r30, [%r17 + %r0]
	.word 0xb23d4000  ! 4704: XNOR_R	xnor 	%r21, %r0, %r25
	ta	T_CHANGE_TO_TL0
iob_intr_3_376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_376), 16, 16)) -> intp(3, 0, 12)
iob_intr_3_377:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_377), 16, 16)) -> intp(3, 0, 10)
iob_intr_3_378:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_378), 16, 16)) -> intp(3, 0, 11)
	.word 0xf42c4000  ! 4711: STB_R	stb	%r26, [%r17 + %r0]
T3_asi_reg_wr_222:
	mov	0x3c0, %r14
	.word 0xf0f389e0  ! 4712: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_3_317:
	setx	0x470002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb81cc000  ! 4718: XOR_R	xor 	%r19, %r0, %r28
cpu_intr_3_318:
	setx	0x440035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82c61ab  ! 4720: STB_I	stb	%r28, [%r17 + 0x01ab]
	.word 0xf8b5c020  ! 4721: STHA_R	stha	%r28, [%r23 + %r0] 0x01
T3_asi_reg_wr_223:
	mov	0x2a, %r14
	.word 0xf4f38400  ! 4722: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xfeada017  ! 4723: STBA_I	stba	%r31, [%r22 + 0x0017] %asi
T3_asi_reg_wr_224:
	mov	0x33, %r14
	.word 0xf2f38e80  ! 4724: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_3_319:
	setx	0x470127, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_320:
	setx	0x460219, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_379:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_379), 16, 16)) -> intp(3, 0, 7)
T3_asi_reg_wr_225:
	mov	0x3c2, %r14
	.word 0xf8f38400  ! 4732: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf42421a5  ! 4738: STW_I	stw	%r26, [%r16 + 0x01a5]
cpu_intr_3_321:
	setx	0x460002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a52150  ! 4740: STWA_I	stwa	%r26, [%r20 + 0x0150] %asi
iob_intr_3_380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_380), 16, 16)) -> intp(3, 0, 29)
	.word 0xf8a5a1f8  ! 4744: STWA_I	stwa	%r28, [%r22 + 0x01f8] %asi
T3_asi_reg_wr_226:
	mov	0x1a, %r14
	.word 0xfaf389e0  ! 4746: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xfcf5a183  ! 4747: STXA_I	stxa	%r30, [%r22 + 0x0183] %asi
	.word 0xfe358000  ! 4749: STH_R	sth	%r31, [%r22 + %r0]
iob_intr_3_381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_381), 16, 16)) -> intp(3, 0, 8)
iob_intr_3_382:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_382), 16, 16)) -> intp(3, 0, 14)
	.word 0xf4a54020  ! 4755: STWA_R	stwa	%r26, [%r21 + %r0] 0x01
T3_asi_reg_rd_216:
	mov	0x1f, %r14
	.word 0xf2db84a0  ! 4758: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb92c4000  ! 4760: SLL_R	sll 	%r17, %r0, %r28
T3_asi_reg_rd_217:
	mov	0x3c4, %r14
	.word 0xfedb89e0  ! 4762: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xfa2c8000  ! 4765: STB_R	stb	%r29, [%r18 + %r0]
iob_intr_3_383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_383), 16, 16)) -> intp(3, 0, 30)
	.word 0xf22d21db  ! 4771: STB_I	stb	%r25, [%r20 + 0x01db]
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_227:
	mov	0x25, %r14
	.word 0xfcf38e60  ! 4777: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbd504000  ! 4779: RDPR_TNPC	<illegal instruction>
	.word 0xf07560f2  ! 4780: STX_I	stx	%r24, [%r21 + 0x00f2]
cpu_intr_3_322:
	setx	0x460118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2752072  ! 4783: STX_I	stx	%r25, [%r20 + 0x0072]
	.word 0xfaa44020  ! 4784: STWA_R	stwa	%r29, [%r17 + %r0] 0x01
T3_asi_reg_rd_218:
	mov	0x5, %r14
	.word 0xfcdb8400  ! 4785: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf474a098  ! 4787: STX_I	stx	%r26, [%r18 + 0x0098]
	.word 0xbe9d4000  ! 4788: XORcc_R	xorcc 	%r21, %r0, %r31
T3_asi_reg_wr_228:
	mov	0x28, %r14
	.word 0xfcf38e40  ! 4792: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_323:
	setx	0x440312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb00c6095  ! 4794: AND_I	and 	%r17, 0x0095, %r24
iob_intr_3_384:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_384), 16, 16)) -> intp(3, 0, 2a)
T3_asi_reg_rd_219:
	mov	0x29, %r14
	.word 0xf4db89e0  ! 4798: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xfab50020  ! 4799: STHA_R	stha	%r29, [%r20 + %r0] 0x01
	.word 0xfcb4210e  ! 4801: STHA_I	stha	%r30, [%r16 + 0x010e] %asi
	.word 0xfea520bb  ! 4803: STWA_I	stwa	%r31, [%r20 + 0x00bb] %asi
cpu_intr_3_324:
	setx	0x470304, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_220:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 4805: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfc248000  ! 4806: STW_R	stw	%r30, [%r18 + %r0]
cpu_intr_3_325:
	setx	0x47012c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_229:
	mov	0xe, %r14
	.word 0xfcf389e0  ! 4811: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T3_asi_reg_wr_230:
	mov	0x5, %r14
	.word 0xf0f38e60  ! 4812: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xf2750000  ! 4814: STX_R	stx	%r25, [%r20 + %r0]
	.word 0xf0356120  ! 4815: STH_I	sth	%r24, [%r21 + 0x0120]
	.word 0xf8aca1db  ! 4816: STBA_I	stba	%r28, [%r18 + 0x01db] %asi
	.word 0xf035c000  ! 4820: STH_R	sth	%r24, [%r23 + %r0]
T3_asi_reg_wr_231:
	mov	0x3c1, %r14
	.word 0xfaf389e0  ! 4822: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_3_326:
	setx	0x460005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf2d7001  ! 4826: SLLX_I	sllx	%r21, 0x0001, %r31
	.word 0xf0b5c020  ! 4831: STHA_R	stha	%r24, [%r23 + %r0] 0x01
cpu_intr_3_327:
	setx	0x45021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02ca09f  ! 4833: STB_I	stb	%r24, [%r18 + 0x009f]
T3_asi_reg_wr_232:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 4835: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_3_328:
	setx	0x470312, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_329:
	setx	0x44000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2ce14f  ! 4843: STB_I	stb	%r30, [%r19 + 0x014f]
	.word 0xb6346094  ! 4846: SUBC_I	orn 	%r17, 0x0094, %r27
	.word 0xb4b54000  ! 4849: ORNcc_R	orncc 	%r21, %r0, %r26
T3_asi_reg_rd_221:
	mov	0x1, %r14
	.word 0xf8db8e40  ! 4850: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfa35c000  ! 4851: STH_R	sth	%r29, [%r23 + %r0]
cpu_intr_3_330:
	setx	0x44002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a42002  ! 4857: STWA_I	stwa	%r27, [%r16 + 0x0002] %asi
	.word 0xf2758000  ! 4858: STX_R	stx	%r25, [%r22 + %r0]
T3_asi_reg_rd_222:
	mov	0xc, %r14
	.word 0xf2db8e40  ! 4862: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb0ac8000  ! 4864: ANDNcc_R	andncc 	%r18, %r0, %r24
	.word 0xfca5a187  ! 4866: STWA_I	stwa	%r30, [%r22 + 0x0187] %asi
iob_intr_3_385:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_385), 16, 16)) -> intp(3, 0, 30)
cpu_intr_3_331:
	setx	0x460121, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_386:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_386), 16, 16)) -> intp(3, 0, 32)
	.word 0xf2b5e1e6  ! 4886: STHA_I	stha	%r25, [%r23 + 0x01e6] %asi
	.word 0xb334e001  ! 4889: SRL_I	srl 	%r19, 0x0001, %r25
iob_intr_3_387:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_387), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_rd_223:
	mov	0x2, %r14
	.word 0xf4db89e0  ! 4892: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_3_332:
	setx	0x450013, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_224:
	mov	0x1a, %r14
	.word 0xfadb8e60  ! 4895: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xfc2d20a2  ! 4896: STB_I	stb	%r30, [%r20 + 0x00a2]
iob_intr_3_388:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_388), 16, 16)) -> intp(3, 0, 5)
	.word 0xbf2d1000  ! 4898: SLLX_R	sllx	%r20, %r0, %r31
	ta	T_CHANGE_TO_TL0
cpu_intr_3_333:
	setx	0x470315, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_233:
	mov	0x34, %r14
	.word 0xf0f384a0  ! 4903: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_3_334:
	setx	0x460310, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_234:
	mov	0x16, %r14
	.word 0xf6f38e60  ! 4908: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T3_asi_reg_wr_235:
	mov	0x15, %r14
	.word 0xf4f38400  ! 4912: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xfea4a0ae  ! 4913: STWA_I	stwa	%r31, [%r18 + 0x00ae] %asi
iob_intr_3_389:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_389), 16, 16)) -> intp(3, 0, e)
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_335:
	setx	0x440030, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfeb5a00a  ! 4921: STHA_I	stha	%r31, [%r22 + 0x000a] %asi
T3_asi_reg_wr_236:
	mov	0xb, %r14
	.word 0xf6f38e80  ! 4922: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf0a56072  ! 4923: STWA_I	stwa	%r24, [%r21 + 0x0072] %asi
cpu_intr_3_336:
	setx	0x470226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaac8020  ! 4926: STBA_R	stba	%r29, [%r18 + %r0] 0x01
iob_intr_3_390:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_390), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf82c0000  ! 4933: STB_R	stb	%r28, [%r16 + %r0]
	.word 0xb12ce001  ! 4936: SLL_I	sll 	%r19, 0x0001, %r24
T3_asi_reg_wr_237:
	mov	0x12, %r14
	.word 0xf8f389e0  ! 4937: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983d88  ! 4938: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d88, %hpstate
iob_intr_3_391:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_391), 16, 16)) -> intp(3, 0, e)
	ta	T_CHANGE_HPRIV
iob_intr_3_392:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_392), 16, 16)) -> intp(3, 0, 3d)
	.word 0x819460d8  ! 4943: WRPR_TPC_I	wrpr	%r17, 0x00d8, %tpc
cpu_intr_3_337:
	setx	0x440004, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_393:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_393), 16, 16)) -> intp(3, 0, 4)
	.word 0xf2f5209c  ! 4948: STXA_I	stxa	%r25, [%r20 + 0x009c] %asi
	.word 0xf6ac8020  ! 4949: STBA_R	stba	%r27, [%r18 + %r0] 0x01
iob_intr_3_394:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_394), 16, 16)) -> intp(3, 0, d)
	.word 0xfaa4c020  ! 4955: STWA_R	stwa	%r29, [%r19 + %r0] 0x01
cpu_intr_3_338:
	setx	0x450204, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_238:
	mov	0x3c8, %r14
	.word 0xf4f38e40  ! 4958: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf6244000  ! 4960: STW_R	stw	%r27, [%r17 + %r0]
	.word 0xfc7560d1  ! 4961: STX_I	stx	%r30, [%r21 + 0x00d1]
cpu_intr_3_339:
	setx	0x44013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
	.word 0xba3de0bb  ! 4966: XNOR_I	xnor 	%r23, 0x00bb, %r29
T3_asi_reg_wr_239:
	mov	0x10, %r14
	.word 0xf0f389e0  ! 4968: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T3_asi_reg_rd_225:
	mov	0x38, %r14
	.word 0xf2db8e40  ! 4970: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_3_395:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_395), 16, 16)) -> intp(3, 0, 0)
T3_asi_reg_wr_240:
	mov	0x3, %r14
	.word 0xfaf38e80  ! 4973: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_3_396:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_396), 16, 16)) -> intp(3, 0, e)
	ta	T_CHANGE_NONHPRIV
	.word 0xb4144000  ! 4976: OR_R	or 	%r17, %r0, %r26
	.word 0xfab4618e  ! 4978: STHA_I	stha	%r29, [%r17 + 0x018e] %asi
	.word 0xf42cc000  ! 4980: STB_R	stb	%r26, [%r19 + %r0]
iob_intr_3_397:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_397), 16, 16)) -> intp(3, 0, f)
iob_intr_3_398:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_398), 16, 16)) -> intp(3, 0, 2b)
cpu_intr_3_340:
	setx	0x450119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa744000  ! 4984: STX_R	stx	%r29, [%r17 + %r0]
iob_intr_3_399:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_399), 16, 16)) -> intp(3, 0, 23)
	.word 0xf2ace11f  ! 4988: STBA_I	stba	%r25, [%r19 + 0x011f] %asi
T3_asi_reg_rd_226:
	mov	0x25, %r14
	.word 0xfadb89e0  ! 4991: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T3_asi_reg_rd_227:
	mov	0xe, %r14
	.word 0xfedb89e0  ! 4993: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
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
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_0), 16, 16)) -> intp(2, 0, 3a)
	.word 0xf04c4000  ! 3: LDSB_R	ldsb	[%r17 + %r0], %r24
	.word 0xf4854020  ! 4: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r26
	.word 0xfa44e049  ! 5: LDSW_I	ldsw	[%r19 + 0x0049], %r29
T2_asi_reg_wr_0:
	mov	0x35, %r14
	.word 0xf0f389e0  ! 6: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T2_asi_reg_wr_1:
	mov	0x1c, %r14
	.word 0xf4f38e40  ! 9: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_rd_0:
	mov	0x3c6, %r14
	.word 0xf8db84a0  ! 10: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_1), 16, 16)) -> intp(2, 0, 3a)
cpu_intr_2_0:
	setx	0x1f021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa950020  ! 18: LDUHA_R	lduha	[%r20, %r0] 0x01, %r29
T2_asi_reg_rd_1:
	mov	0x29, %r14
	.word 0xfedb8e80  ! 19: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T2_asi_reg_rd_2:
	mov	0xd, %r14
	.word 0xf4db84a0  ! 20: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T2_asi_reg_rd_3:
	mov	0x2a, %r14
	.word 0xf4db8e40  ! 21: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_rd_4:
	mov	0x19, %r14
	.word 0xf4db8e60  ! 22: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T2_asi_reg_wr_2:
	mov	0xa, %r14
	.word 0xf0f384a0  ! 23: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xfa140000  ! 25: LDUH_R	lduh	[%r16 + %r0], %r29
iob_intr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_2), 16, 16)) -> intp(2, 0, d)
	.word 0xf0442103  ! 27: LDSW_I	ldsw	[%r16 + 0x0103], %r24
iob_intr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_3), 16, 16)) -> intp(2, 0, 11)
	.word 0xfc0c4000  ! 30: LDUB_R	ldub	[%r17 + %r0], %r30
	.word 0xf6044000  ! 31: LDUW_R	lduw	[%r17 + %r0], %r27
	.word 0xf095609e  ! 33: LDUHA_I	lduha	[%r21, + 0x009e] %asi, %r24
iob_intr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_4), 16, 16)) -> intp(2, 0, f)
	.word 0xf615e140  ! 35: LDUH_I	lduh	[%r23 + 0x0140], %r27
T2_asi_reg_wr_3:
	mov	0x16, %r14
	.word 0xf6f384a0  ! 37: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T2_asi_reg_rd_5:
	mov	0x27, %r14
	.word 0xf8db8e40  ! 40: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf8c52180  ! 41: LDSWA_I	ldswa	[%r20, + 0x0180] %asi, %r28
	ta	T_CHANGE_TO_TL1
	.word 0xf8c4c020  ! 46: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r28
T2_asi_reg_wr_4:
	mov	0x13, %r14
	.word 0xf6f38e40  ! 53: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_rd_6:
	mov	0x16, %r14
	.word 0xf8db8e40  ! 54: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf29521c1  ! 55: LDUHA_I	lduha	[%r20, + 0x01c1] %asi, %r25
cpu_intr_2_1:
	setx	0x1e0208, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_7:
	mov	0x19, %r14
	.word 0xf8db8e80  ! 59: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf0cde14a  ! 61: LDSBA_I	ldsba	[%r23, + 0x014a] %asi, %r24
	.word 0xf0d4a04f  ! 62: LDSHA_I	ldsha	[%r18, + 0x004f] %asi, %r24
	.word 0xfc85e107  ! 64: LDUWA_I	lduwa	[%r23, + 0x0107] %asi, %r30
	.word 0xb6b44000  ! 65: SUBCcc_R	orncc 	%r17, %r0, %r27
	.word 0xfacc61ce  ! 66: LDSBA_I	ldsba	[%r17, + 0x01ce] %asi, %r29
T2_asi_reg_wr_5:
	mov	0x3c1, %r14
	.word 0xfcf38e60  ! 67: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf0cd6101  ! 68: LDSBA_I	ldsba	[%r21, + 0x0101] %asi, %r24
iob_intr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_5), 16, 16)) -> intp(2, 0, 1b)
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982d8a  ! 72: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8a, %hpstate
	.word 0xb405a140  ! 75: ADD_I	add 	%r22, 0x0140, %r26
cpu_intr_2_2:
	setx	0x1e0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8c4e0a6  ! 80: LDSWA_I	ldswa	[%r19, + 0x00a6] %asi, %r28
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_6:
	mov	0x34, %r14
	.word 0xf2f384a0  ! 83: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf414e1cd  ! 84: LDUH_I	lduh	[%r19 + 0x01cd], %r26
T2_asi_reg_rd_8:
	mov	0x2a, %r14
	.word 0xf0db89e0  ! 87: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T2_asi_reg_wr_7:
	mov	0x3c1, %r14
	.word 0xf2f38e60  ! 89: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	ta	T_CHANGE_TO_TL0
	.word 0xfacc610a  ! 92: LDSBA_I	ldsba	[%r17, + 0x010a] %asi, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf04c0000  ! 97: LDSB_R	ldsb	[%r16 + %r0], %r24
	.word 0xfc958020  ! 100: LDUHA_R	lduha	[%r22, %r0] 0x01, %r30
	.word 0x8794a1c4  ! 101: WRPR_TT_I	wrpr	%r18, 0x01c4, %tt
	.word 0xb6c4e186  ! 102: ADDCcc_I	addccc 	%r19, 0x0186, %r27
	.word 0xfccd0020  ! 104: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r30
iob_intr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_6), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf25560a5  ! 109: LDSH_I	ldsh	[%r21 + 0x00a5], %r25
cpu_intr_2_3:
	setx	0x1d0137, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_9:
	mov	0x27, %r14
	.word 0xf0db84a0  ! 111: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_7), 16, 16)) -> intp(2, 0, 39)
iob_intr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_8), 16, 16)) -> intp(2, 0, 2e)
iob_intr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_9), 16, 16)) -> intp(2, 0, 31)
	.word 0xfe55212e  ! 117: LDSH_I	ldsh	[%r20 + 0x012e], %r31
T2_asi_reg_rd_10:
	mov	0x3c0, %r14
	.word 0xfedb8e80  ! 119: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_2_4:
	setx	0x1f0328, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_11:
	mov	0x3c4, %r14
	.word 0xf0db8e60  ! 123: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T2_asi_reg_wr_8:
	mov	0x4, %r14
	.word 0xfcf384a0  ! 124: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfedce05c  ! 126: LDXA_I	ldxa	[%r19, + 0x005c] %asi, %r31
iob_intr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_10), 16, 16)) -> intp(2, 0, 24)
T2_asi_reg_wr_9:
	mov	0x37, %r14
	.word 0xf4f38e40  ! 130: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_5:
	setx	0x1f000c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_11), 16, 16)) -> intp(2, 0, 1d)
	ta	T_CHANGE_TO_TL1
iob_intr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_12), 16, 16)) -> intp(2, 0, 27)
	.word 0xbc352013  ! 145: SUBC_I	orn 	%r20, 0x0013, %r30
	.word 0xb034e06a  ! 148: SUBC_I	orn 	%r19, 0x006a, %r24
	.word 0xfc5c2041  ! 151: LDX_I	ldx	[%r16 + 0x0041], %r30
	.word 0x8594e186  ! 152: WRPR_TSTATE_I	wrpr	%r19, 0x0186, %tstate
	.word 0xf08d0020  ! 153: LDUBA_R	lduba	[%r20, %r0] 0x01, %r24
iob_intr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_13), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_6:
	setx	0x1e0100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8cc2169  ! 158: LDSBA_I	ldsba	[%r16, + 0x0169] %asi, %r28
	.word 0xf0c520b5  ! 162: LDSWA_I	ldswa	[%r20, + 0x00b5] %asi, %r24
	.word 0xfe15214b  ! 166: LDUH_I	lduh	[%r20 + 0x014b], %r31
	.word 0xf2d40020  ! 167: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r25
iob_intr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_14), 16, 16)) -> intp(2, 0, 22)
T2_asi_reg_wr_10:
	mov	0x8, %r14
	.word 0xf0f38e40  ! 170: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_wr_11:
	mov	0xf, %r14
	.word 0xf4f384a0  ! 171: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	ta	T_CHANGE_TO_TL0
cpu_intr_2_7:
	setx	0x1e0239, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_12:
	mov	0x10, %r14
	.word 0xf0f384a0  ! 177: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_2_8:
	setx	0x1c0238, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_9:
	setx	0x1f0200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb134a001  ! 181: SRL_I	srl 	%r18, 0x0001, %r24
T2_asi_reg_wr_13:
	mov	0x22, %r14
	.word 0xfef38e60  ! 182: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	ta	T_CHANGE_TO_TL1
iob_intr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_15), 16, 16)) -> intp(2, 0, 37)
iob_intr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_16), 16, 16)) -> intp(2, 0, f)
iob_intr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_17), 16, 16)) -> intp(2, 0, 37)
T2_asi_reg_rd_12:
	mov	0x31, %r14
	.word 0xfcdb8e80  ! 192: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xfccc4020  ! 194: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r30
T2_asi_reg_rd_13:
	mov	0x2e, %r14
	.word 0xfadb84a0  ! 196: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf095a011  ! 197: LDUHA_I	lduha	[%r22, + 0x0011] %asi, %r24
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_14:
	mov	0x3c1, %r14
	.word 0xfedb8400  ! 200: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T2_asi_reg_rd_15:
	mov	0x21, %r14
	.word 0xf8db89e0  ! 201: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_16:
	mov	0xd, %r14
	.word 0xf2db89e0  ! 206: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	ta	T_CHANGE_HPRIV
iob_intr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_18), 16, 16)) -> intp(2, 0, 28)
iob_intr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_19), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_rd_17:
	mov	0x34, %r14
	.word 0xf8db8e40  ! 214: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfed4a012  ! 216: LDSHA_I	ldsha	[%r18, + 0x0012] %asi, %r31
	.word 0xf0cd4020  ! 217: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r24
iob_intr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_20), 16, 16)) -> intp(2, 0, 16)
T2_asi_reg_rd_18:
	mov	0x1e, %r14
	.word 0xfadb8e60  ! 220: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb014a028  ! 221: OR_I	or 	%r18, 0x0028, %r24
	.word 0xf005e0af  ! 226: LDUW_I	lduw	[%r23 + 0x00af], %r24
T2_asi_reg_wr_14:
	mov	0x9, %r14
	.word 0xfef389e0  ! 227: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_2_10:
	setx	0x1f011e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_11:
	setx	0x1e0001, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_21), 16, 16)) -> intp(2, 0, 0)
	.word 0xf4cc21ba  ! 232: LDSBA_I	ldsba	[%r16, + 0x01ba] %asi, %r26
	.word 0xf6c42182  ! 233: LDSWA_I	ldswa	[%r16, + 0x0182] %asi, %r27
T2_asi_reg_wr_15:
	mov	0x3c3, %r14
	.word 0xf4f38400  ! 235: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	.word 0xf65c4000  ! 237: LDX_R	ldx	[%r17 + %r0], %r27
	.word 0xf0050000  ! 240: LDUW_R	lduw	[%r20 + %r0], %r24
T2_asi_reg_rd_19:
	mov	0x3c8, %r14
	.word 0xf6db8e60  ! 244: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xfadc2022  ! 247: LDXA_I	ldxa	[%r16, + 0x0022] %asi, %r29
	.word 0xf68ca1bb  ! 248: LDUBA_I	lduba	[%r18, + 0x01bb] %asi, %r27
	.word 0xf8cd4020  ! 249: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r28
cpu_intr_2_12:
	setx	0x1d0009, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_13:
	setx	0x1c020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa04a1cf  ! 252: LDUW_I	lduw	[%r18 + 0x01cf], %r29
	.word 0xf0ccc020  ! 254: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r24
T2_asi_reg_rd_20:
	mov	0x17, %r14
	.word 0xfedb8400  ! 255: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf05dc000  ! 256: LDX_R	ldx	[%r23 + %r0], %r24
	.word 0xf005c000  ! 257: LDUW_R	lduw	[%r23 + %r0], %r24
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_16:
	mov	0x2d, %r14
	.word 0xf2f38e60  ! 261: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_2_14:
	setx	0x1f020a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_21:
	mov	0x9, %r14
	.word 0xf4db8e80  ! 267: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xfed5c020  ! 268: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r31
	.word 0xf6d54020  ! 269: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r27
	.word 0xf4d5214b  ! 271: LDSHA_I	ldsha	[%r20, + 0x014b] %asi, %r26
iob_intr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_22), 16, 16)) -> intp(2, 0, 3b)
	.word 0xb63c4000  ! 274: XNOR_R	xnor 	%r17, %r0, %r27
	.word 0xfccce0d5  ! 277: LDSBA_I	ldsba	[%r19, + 0x00d5] %asi, %r30
	.word 0xf2444000  ! 278: LDSW_R	ldsw	[%r17 + %r0], %r25
	.word 0xf0d44020  ! 281: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r24
cpu_intr_2_15:
	setx	0x1d0115, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_17:
	mov	0x33, %r14
	.word 0xfcf389e0  ! 284: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_23), 16, 16)) -> intp(2, 0, a)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_24), 16, 16)) -> intp(2, 0, d)
cpu_intr_2_16:
	setx	0x1e0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf605c000  ! 294: LDUW_R	lduw	[%r23 + %r0], %r27
T2_asi_reg_rd_22:
	mov	0x3c6, %r14
	.word 0xfedb84a0  ! 297: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_25), 16, 16)) -> intp(2, 0, 31)
	.word 0xf6c5a0d5  ! 299: LDSWA_I	ldswa	[%r22, + 0x00d5] %asi, %r27
	.word 0xf4d50020  ! 302: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r26
iob_intr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_26), 16, 16)) -> intp(2, 0, 7)
cpu_intr_2_17:
	setx	0x1c022a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_23:
	mov	0x33, %r14
	.word 0xf2db8e80  ! 307: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_2_18:
	setx	0x1c0215, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_27), 16, 16)) -> intp(2, 0, 1)
	.word 0xf0c44020  ! 311: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r24
cpu_intr_2_19:
	setx	0x1c0024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4dce151  ! 314: LDXA_I	ldxa	[%r19, + 0x0151] %asi, %r26
T2_asi_reg_wr_18:
	mov	0x23, %r14
	.word 0xf2f38e80  ! 315: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf08d21f9  ! 319: LDUBA_I	lduba	[%r20, + 0x01f9] %asi, %r24
iob_intr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_28), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf84c0000  ! 322: LDSB_R	ldsb	[%r16 + %r0], %r28
iob_intr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_29), 16, 16)) -> intp(2, 0, 1a)
cpu_intr_2_20:
	setx	0x1d0307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_21:
	setx	0x1e0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d5e156  ! 332: LDSHA_I	ldsha	[%r23, + 0x0156] %asi, %r25
iob_intr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_30), 16, 16)) -> intp(2, 0, 6)
	.word 0xfa55a070  ! 339: LDSH_I	ldsh	[%r22 + 0x0070], %r29
T2_asi_reg_rd_24:
	mov	0x32, %r14
	.word 0xfedb8e40  ! 342: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_31), 16, 16)) -> intp(2, 0, 22)
	.word 0xfa540000  ! 346: LDSH_R	ldsh	[%r16 + %r0], %r29
	.word 0xfe0d8000  ! 350: LDUB_R	ldub	[%r22 + %r0], %r31
	.word 0xf6c460a4  ! 351: LDSWA_I	ldswa	[%r17, + 0x00a4] %asi, %r27
	.word 0xf08d8020  ! 352: LDUBA_R	lduba	[%r22, %r0] 0x01, %r24
iob_intr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_32), 16, 16)) -> intp(2, 0, e)
T2_asi_reg_rd_25:
	mov	0x14, %r14
	.word 0xf4db8e40  ! 356: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfe0de1e1  ! 360: LDUB_I	ldub	[%r23 + 0x01e1], %r31
	.word 0xb02da1f3  ! 361: ANDN_I	andn 	%r22, 0x01f3, %r24
	.word 0xf614a176  ! 363: LDUH_I	lduh	[%r18 + 0x0176], %r27
	.word 0xf8152000  ! 366: LDUH_I	lduh	[%r20 + 0x0000], %r28
	.word 0xfcc4c020  ! 367: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r30
T2_asi_reg_rd_26:
	mov	0x1a, %r14
	.word 0xfadb89e0  ! 369: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb61ca062  ! 370: XOR_I	xor 	%r18, 0x0062, %r27
T2_asi_reg_wr_19:
	mov	0x26, %r14
	.word 0xfef38e40  ! 371: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983d8a  ! 373: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d8a, %hpstate
	.word 0xf445c000  ! 376: LDSW_R	ldsw	[%r23 + %r0], %r26
	.word 0xbab58000  ! 379: ORNcc_R	orncc 	%r22, %r0, %r29
	.word 0xbeade04e  ! 380: ANDNcc_I	andncc 	%r23, 0x004e, %r31
	.word 0xf604c000  ! 382: LDUW_R	lduw	[%r19 + %r0], %r27
	.word 0xf094e1e8  ! 383: LDUHA_I	lduha	[%r19, + 0x01e8] %asi, %r24
cpu_intr_2_22:
	setx	0x1f012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_27:
	mov	0x3c7, %r14
	.word 0xf6db8e40  ! 387: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_33), 16, 16)) -> intp(2, 0, 12)
	.word 0xb22d61ce  ! 394: ANDN_I	andn 	%r21, 0x01ce, %r25
	.word 0xbf347001  ! 396: SRLX_I	srlx	%r17, 0x0001, %r31
iob_intr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_34), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf2d5e1a1  ! 399: LDSHA_I	ldsha	[%r23, + 0x01a1] %asi, %r25
cpu_intr_2_23:
	setx	0x1e001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0c60ef  ! 402: LDUB_I	ldub	[%r17 + 0x00ef], %r29
iob_intr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_35), 16, 16)) -> intp(2, 0, 4)
	.word 0xfc4d8000  ! 404: LDSB_R	ldsb	[%r22 + %r0], %r30
iob_intr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_36), 16, 16)) -> intp(2, 0, 3f)
cpu_intr_2_24:
	setx	0x1c0032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0cc0020  ! 408: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r24
	.word 0xf45d0000  ! 411: LDX_R	ldx	[%r20 + %r0], %r26
	.word 0xf0d5e114  ! 412: LDSHA_I	ldsha	[%r23, + 0x0114] %asi, %r24
	.word 0xb72d3001  ! 413: SLLX_I	sllx	%r20, 0x0001, %r27
T2_asi_reg_rd_28:
	mov	0x6, %r14
	.word 0xfedb8400  ! 414: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xfa0c0000  ! 415: LDUB_R	ldub	[%r16 + %r0], %r29
	.word 0xf044c000  ! 417: LDSW_R	ldsw	[%r19 + %r0], %r24
T2_asi_reg_rd_29:
	mov	0xa, %r14
	.word 0xf0db8400  ! 420: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T2_asi_reg_rd_30:
	mov	0x24, %r14
	.word 0xf0db8e80  ! 425: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T2_asi_reg_rd_31:
	mov	0x3c5, %r14
	.word 0xf2db8e60  ! 428: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xfadd613f  ! 431: LDXA_I	ldxa	[%r21, + 0x013f] %asi, %r29
cpu_intr_2_25:
	setx	0x1c0003, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_26:
	setx	0x1c021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2bc616c  ! 436: XNORcc_I	xnorcc 	%r17, 0x016c, %r25
iob_intr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_37), 16, 16)) -> intp(2, 0, f)
iob_intr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_38), 16, 16)) -> intp(2, 0, 3)
	.word 0xf48521d0  ! 440: LDUWA_I	lduwa	[%r20, + 0x01d0] %asi, %r26
	.word 0xf845e10a  ! 441: LDSW_I	ldsw	[%r23 + 0x010a], %r28
	.word 0xbc3d21c7  ! 444: XNOR_I	xnor 	%r20, 0x01c7, %r30
	.word 0xf4cce0da  ! 446: LDSBA_I	ldsba	[%r19, + 0x00da] %asi, %r26
	.word 0xfc5c4000  ! 447: LDX_R	ldx	[%r17 + %r0], %r30
T2_asi_reg_rd_32:
	mov	0x12, %r14
	.word 0xf8db8400  ! 448: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xf004a086  ! 449: LDUW_I	lduw	[%r18 + 0x0086], %r24
T2_asi_reg_rd_33:
	mov	0x11, %r14
	.word 0xfcdb8400  ! 451: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xfc15c000  ! 453: LDUH_R	lduh	[%r23 + %r0], %r30
	.word 0xf65c8000  ! 454: LDX_R	ldx	[%r18 + %r0], %r27
T2_asi_reg_rd_34:
	mov	0x1c, %r14
	.word 0xf6db8e40  ! 456: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_39), 16, 16)) -> intp(2, 0, 6)
cpu_intr_2_27:
	setx	0x21023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0c421df  ! 463: LDSWA_I	ldswa	[%r16, + 0x01df] %asi, %r24
	.word 0xfc8c614f  ! 464: LDUBA_I	lduba	[%r17, + 0x014f] %asi, %r30
	.word 0xfc5d4000  ! 467: LDX_R	ldx	[%r21 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_40), 16, 16)) -> intp(2, 0, 0)
cpu_intr_2_28:
	setx	0x230129, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_20:
	mov	0x3c3, %r14
	.word 0xf4f38e40  ! 486: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf004a05d  ! 487: LDUW_I	lduw	[%r18 + 0x005d], %r24
	.word 0xf20dc000  ! 489: LDUB_R	ldub	[%r23 + %r0], %r25
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983cc0  ! 490: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc0, %hpstate
	.word 0xfad5207b  ! 493: LDSHA_I	ldsha	[%r20, + 0x007b] %asi, %r29
	.word 0xb82d20c1  ! 494: ANDN_I	andn 	%r20, 0x00c1, %r28
T2_asi_reg_wr_21:
	mov	0x19, %r14
	.word 0xf0f38400  ! 498: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_41), 16, 16)) -> intp(2, 0, 38)
	.word 0xf8046006  ! 504: LDUW_I	lduw	[%r17 + 0x0006], %r28
	.word 0xf6dd617e  ! 510: LDXA_I	ldxa	[%r21, + 0x017e] %asi, %r27
T2_asi_reg_rd_35:
	mov	0x17, %r14
	.word 0xfedb8400  ! 512: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982880  ! 514: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0880, %hpstate
cpu_intr_2_29:
	setx	0x210108, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_22:
	mov	0x38, %r14
	.word 0xfaf38e80  ! 522: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf28c60c8  ! 523: LDUBA_I	lduba	[%r17, + 0x00c8] %asi, %r25
	.word 0xb094e0da  ! 528: ORcc_I	orcc 	%r19, 0x00da, %r24
iob_intr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_42), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_wr_23:
	mov	0xe, %r14
	.word 0xfaf38e80  ! 534: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xfe8d0020  ! 536: LDUBA_R	lduba	[%r20, %r0] 0x01, %r31
iob_intr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_43), 16, 16)) -> intp(2, 0, 1f)
cpu_intr_2_30:
	setx	0x22022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4dc000  ! 539: LDSB_R	ldsb	[%r23 + %r0], %r30
iob_intr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_44), 16, 16)) -> intp(2, 0, 9)
	.word 0xfad5e05e  ! 542: LDSHA_I	ldsha	[%r23, + 0x005e] %asi, %r29
iob_intr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_45), 16, 16)) -> intp(2, 0, 2e)
	.word 0xbeb5c000  ! 547: ORNcc_R	orncc 	%r23, %r0, %r31
cpu_intr_2_31:
	setx	0x200301, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf8c4c020  ! 555: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r28
iob_intr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_46), 16, 16)) -> intp(2, 0, 2)
T2_asi_reg_rd_36:
	mov	0x3c5, %r14
	.word 0xfcdb89e0  ! 558: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_47), 16, 16)) -> intp(2, 0, 12)
cpu_intr_2_32:
	setx	0x20030d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_37:
	mov	0x3c8, %r14
	.word 0xf2db89e0  ! 567: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xf0dc20cd  ! 568: LDXA_I	ldxa	[%r16, + 0x00cd] %asi, %r24
T2_asi_reg_rd_38:
	mov	0x3c6, %r14
	.word 0xf2db8e60  ! 570: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_39:
	mov	0x0, %r14
	.word 0xf2db84a0  ! 572: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982ed8  ! 573: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed8, %hpstate
	ta	T_CHANGE_TO_TL0
cpu_intr_2_33:
	setx	0x220320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3c1000  ! 578: SRAX_R	srax	%r16, %r0, %r30
cpu_intr_2_34:
	setx	0x23012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2548000  ! 583: LDSH_R	ldsh	[%r18 + %r0], %r25
T2_asi_reg_wr_24:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 587: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_rd_40:
	mov	0x6, %r14
	.word 0xfadb89e0  ! 588: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T2_asi_reg_wr_25:
	mov	0x2c, %r14
	.word 0xf4f38e40  ! 589: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfe05a101  ! 593: LDUW_I	lduw	[%r22 + 0x0101], %r31
T2_asi_reg_rd_41:
	mov	0x38, %r14
	.word 0xfcdb8e40  ! 596: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_42:
	mov	0x3c1, %r14
	.word 0xf0db84a0  ! 598: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T2_asi_reg_rd_43:
	mov	0x2c, %r14
	.word 0xf2db8400  ! 599: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb445e167  ! 600: ADDC_I	addc 	%r23, 0x0167, %r26
T2_asi_reg_wr_26:
	mov	0x21, %r14
	.word 0xf0f38e80  ! 601: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf645e105  ! 603: LDSW_I	ldsw	[%r23 + 0x0105], %r27
	.word 0xfcdc6110  ! 606: LDXA_I	ldxa	[%r17, + 0x0110] %asi, %r30
	.word 0xfc8561d2  ! 607: LDUWA_I	lduwa	[%r21, + 0x01d2] %asi, %r30
iob_intr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_48), 16, 16)) -> intp(2, 0, 2b)
cpu_intr_2_35:
	setx	0x210324, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_27:
	mov	0x38, %r14
	.word 0xf2f38e40  ! 612: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf0946045  ! 613: LDUHA_I	lduha	[%r17, + 0x0045] %asi, %r24
iob_intr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_49), 16, 16)) -> intp(2, 0, 9)
	ta	T_CHANGE_TO_TL1
	.word 0xf25c60ef  ! 619: LDX_I	ldx	[%r17 + 0x00ef], %r25
	.word 0xfa5c61c4  ! 621: LDX_I	ldx	[%r17 + 0x01c4], %r29
T2_asi_reg_wr_28:
	mov	0x17, %r14
	.word 0xf8f389e0  ! 622: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T2_asi_reg_wr_29:
	mov	0x3c7, %r14
	.word 0xfef38400  ! 627: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_30:
	mov	0x25, %r14
	.word 0xfcf384a0  ! 629: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T2_asi_reg_wr_31:
	mov	0x24, %r14
	.word 0xf8f389e0  ! 631: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf00c8000  ! 635: LDUB_R	ldub	[%r18 + %r0], %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfa95e0e0  ! 640: LDUHA_I	lduha	[%r23, + 0x00e0] %asi, %r29
cpu_intr_2_36:
	setx	0x210236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2dce18c  ! 645: LDXA_I	ldxa	[%r19, + 0x018c] %asi, %r25
T2_asi_reg_wr_32:
	mov	0x3c8, %r14
	.word 0xfaf38400  ! 648: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbb504000  ! 650: RDPR_TNPC	<illegal instruction>
iob_intr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_50), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf00da09e  ! 653: LDUB_I	ldub	[%r22 + 0x009e], %r24
cpu_intr_2_37:
	setx	0x230107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf454e041  ! 657: LDSH_I	ldsh	[%r19 + 0x0041], %r26
iob_intr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_51), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_38:
	setx	0x230131, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_44:
	mov	0x12, %r14
	.word 0xf4db89e0  ! 661: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xfe94603a  ! 662: LDUHA_I	lduha	[%r17, + 0x003a] %asi, %r31
	.word 0xfa854020  ! 663: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r29
T2_asi_reg_wr_33:
	mov	0x3c5, %r14
	.word 0xfcf38e40  ! 664: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xba950000  ! 665: ORcc_R	orcc 	%r20, %r0, %r29
iob_intr_2_52:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_52), 16, 16)) -> intp(2, 0, 3d)
iob_intr_2_53:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_53), 16, 16)) -> intp(2, 0, 32)
	.word 0xfadda1e6  ! 668: LDXA_I	ldxa	[%r22, + 0x01e6] %asi, %r29
	.word 0xb93df001  ! 669: SRAX_I	srax	%r23, 0x0001, %r28
iob_intr_2_54:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_54), 16, 16)) -> intp(2, 0, 35)
	.word 0xf68c4020  ! 671: LDUBA_R	lduba	[%r17, %r0] 0x01, %r27
T2_asi_reg_rd_45:
	mov	0x10, %r14
	.word 0xfcdb84a0  ! 673: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982f50  ! 675: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f50, %hpstate
	.word 0xf44c0000  ! 679: LDSB_R	ldsb	[%r16 + %r0], %r26
cpu_intr_2_39:
	setx	0x20020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4c0000  ! 684: LDSB_R	ldsb	[%r16 + %r0], %r29
	.word 0xfc546129  ! 686: LDSH_I	ldsh	[%r17 + 0x0129], %r30
T2_asi_reg_wr_34:
	mov	0x17, %r14
	.word 0xf6f389e0  ! 687: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_2_55:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_55), 16, 16)) -> intp(2, 0, 28)
cpu_intr_2_40:
	setx	0x23013e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_56:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_56), 16, 16)) -> intp(2, 0, 3b)
T2_asi_reg_rd_46:
	mov	0x27, %r14
	.word 0xfedb89e0  ! 691: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb20d0000  ! 692: AND_R	and 	%r20, %r0, %r25
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x8198384a  ! 693: WRHPR_HPSTATE_I	wrhpr	%r0, 0x184a, %hpstate
iob_intr_2_57:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_57), 16, 16)) -> intp(2, 0, 6)
iob_intr_2_58:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_58), 16, 16)) -> intp(2, 0, 1f)
cpu_intr_2_41:
	setx	0x230338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4850000  ! 701: ADDcc_R	addcc 	%r20, %r0, %r26
T2_asi_reg_rd_47:
	mov	0x2d, %r14
	.word 0xf2db8e80  ! 702: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xfa440000  ! 703: LDSW_R	ldsw	[%r16 + %r0], %r29
	.word 0xb63c0000  ! 704: XNOR_R	xnor 	%r16, %r0, %r27
T2_asi_reg_wr_35:
	mov	0x1a, %r14
	.word 0xf8f38400  ! 707: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T2_asi_reg_wr_36:
	mov	0x3c5, %r14
	.word 0xf4f38400  ! 708: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf015a1a9  ! 709: LDUH_I	lduh	[%r22 + 0x01a9], %r24
cpu_intr_2_42:
	setx	0x22033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb93de001  ! 712: SRA_I	sra 	%r23, 0x0001, %r28
T2_asi_reg_wr_37:
	mov	0x3c8, %r14
	.word 0xfcf384a0  ! 713: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_2_43:
	setx	0x22003e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_44:
	setx	0x20023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85da0f3  ! 719: LDX_I	ldx	[%r22 + 0x00f3], %r28
	.word 0xfe048000  ! 721: LDUW_R	lduw	[%r18 + %r0], %r31
T2_asi_reg_wr_38:
	mov	0x25, %r14
	.word 0xf6f38e40  ! 723: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	.word 0xfa8d0020  ! 728: LDUBA_R	lduba	[%r20, %r0] 0x01, %r29
T2_asi_reg_rd_48:
	mov	0x1, %r14
	.word 0xf2db8e40  ! 729: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb92c5000  ! 731: SLLX_R	sllx	%r17, %r0, %r28
T2_asi_reg_wr_39:
	mov	0x1b, %r14
	.word 0xfef38e80  ! 738: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_2_59:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_59), 16, 16)) -> intp(2, 0, 34)
T2_asi_reg_rd_49:
	mov	0x2f, %r14
	.word 0xfcdb89e0  ! 741: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf4cce056  ! 745: LDSBA_I	ldsba	[%r19, + 0x0056] %asi, %r26
	.word 0xf6058000  ! 746: LDUW_R	lduw	[%r22 + %r0], %r27
T2_asi_reg_wr_40:
	mov	0x1e, %r14
	.word 0xfaf38e40  ! 748: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_rd_50:
	mov	0x3c2, %r14
	.word 0xfadb8e80  ! 750: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_2_60:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_60), 16, 16)) -> intp(2, 0, 24)
	.word 0xb93d9000  ! 754: SRAX_R	srax	%r22, %r0, %r28
cpu_intr_2_45:
	setx	0x20011e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_61:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_61), 16, 16)) -> intp(2, 0, 6)
	.word 0xf6d52033  ! 766: LDSHA_I	ldsha	[%r20, + 0x0033] %asi, %r27
	.word 0xf8cc8020  ! 767: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r28
cpu_intr_2_46:
	setx	0x21023e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_62:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_62), 16, 16)) -> intp(2, 0, f)
cpu_intr_2_47:
	setx	0x230025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfedca045  ! 780: LDXA_I	ldxa	[%r18, + 0x0045] %asi, %r31
	ta	T_CHANGE_TO_TL1
	.word 0xfa948020  ! 784: LDUHA_R	lduha	[%r18, %r0] 0x01, %r29
	.word 0xb22ca1f6  ! 788: ANDN_I	andn 	%r18, 0x01f6, %r25
T2_asi_reg_wr_41:
	mov	0xc, %r14
	.word 0xf0f389e0  ! 789: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xfe942110  ! 790: LDUHA_I	lduha	[%r16, + 0x0110] %asi, %r31
T2_asi_reg_wr_42:
	mov	0x32, %r14
	.word 0xfcf38e40  ! 792: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfadd21d7  ! 793: LDXA_I	ldxa	[%r20, + 0x01d7] %asi, %r29
	.word 0xf8d4c020  ! 794: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r28
iob_intr_2_63:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_63), 16, 16)) -> intp(2, 0, 11)
iob_intr_2_64:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_64), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_65:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_65), 16, 16)) -> intp(2, 0, 22)
	setx	data_start_1, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982ed8  ! 800: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed8, %hpstate
T2_asi_reg_rd_51:
	mov	0x23, %r14
	.word 0xf2db8400  ! 802: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_2_66:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_66), 16, 16)) -> intp(2, 0, 2b)
T2_asi_reg_wr_43:
	mov	0x38, %r14
	.word 0xf2f38e40  ! 806: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_67:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_67), 16, 16)) -> intp(2, 0, 15)
T2_asi_reg_rd_52:
	mov	0x35, %r14
	.word 0xf4db8e40  ! 813: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_rd_53:
	mov	0x3c1, %r14
	.word 0xf6db89e0  ! 817: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xf2540000  ! 821: LDSH_R	ldsh	[%r16 + %r0], %r25
	.word 0xf05ce198  ! 823: LDX_I	ldx	[%r19 + 0x0198], %r24
	.word 0xfad50020  ! 825: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r29
cpu_intr_2_48:
	setx	0x220314, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982c40  ! 830: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c40, %hpstate
T2_asi_reg_rd_54:
	mov	0x13, %r14
	.word 0xfedb8400  ! 831: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T2_asi_reg_wr_44:
	mov	0x3, %r14
	.word 0xf0f38e60  ! 835: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb42d20b7  ! 836: ANDN_I	andn 	%r20, 0x00b7, %r26
T2_asi_reg_wr_45:
	mov	0x1d, %r14
	.word 0xf8f38e40  ! 837: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_wr_46:
	mov	0x3c0, %r14
	.word 0xfaf38e80  ! 839: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_2_49:
	setx	0x22010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_2_50:
	setx	0x21011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb2c3001  ! 848: SLLX_I	sllx	%r16, 0x0001, %r29
iob_intr_2_68:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_68), 16, 16)) -> intp(2, 0, 24)
	.word 0xf68d6140  ! 856: LDUBA_I	lduba	[%r21, + 0x0140] %asi, %r27
cpu_intr_2_51:
	setx	0x220026, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_52:
	setx	0x220114, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
cpu_intr_2_53:
	setx	0x200121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6cc6100  ! 864: LDSBA_I	ldsba	[%r17, + 0x0100] %asi, %r27
cpu_intr_2_54:
	setx	0x21023d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_47:
	mov	0x18, %r14
	.word 0xf0f384a0  ! 870: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_2_69:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_69), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf20c21b4  ! 873: LDUB_I	ldub	[%r16 + 0x01b4], %r25
T2_asi_reg_wr_48:
	mov	0x1c, %r14
	.word 0xf4f38e80  ! 874: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf85d8000  ! 877: LDX_R	ldx	[%r22 + %r0], %r28
	.word 0xfacc213a  ! 879: LDSBA_I	ldsba	[%r16, + 0x013a] %asi, %r29
iob_intr_2_70:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_70), 16, 16)) -> intp(2, 0, 1f)
iob_intr_2_71:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_71), 16, 16)) -> intp(2, 0, 24)
cpu_intr_2_55:
	setx	0x200217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8cd8020  ! 891: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r28
T2_asi_reg_rd_55:
	mov	0x3c6, %r14
	.word 0xf2db84a0  ! 893: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf0142057  ! 894: LDUH_I	lduh	[%r16 + 0x0057], %r24
	ta	T_CHANGE_TO_TL1
cpu_intr_2_56:
	setx	0x210111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe05c000  ! 897: ADD_R	add 	%r23, %r0, %r31
	.word 0xfa140000  ! 899: LDUH_R	lduh	[%r16 + %r0], %r29
	.word 0xfa4d0000  ! 900: LDSB_R	ldsb	[%r20 + %r0], %r29
iob_intr_2_72:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_72), 16, 16)) -> intp(2, 0, 3a)
iob_intr_2_73:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_73), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_57:
	setx	0x25012f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_74:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_74), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_rd_56:
	mov	0x1f, %r14
	.word 0xf2db89e0  ! 906: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xfa444000  ! 911: LDSW_R	ldsw	[%r17 + %r0], %r29
iob_intr_2_75:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_75), 16, 16)) -> intp(2, 0, 3c)
T2_asi_reg_wr_49:
	mov	0x14, %r14
	.word 0xf4f389e0  ! 916: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_2_58:
	setx	0x25033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_2_76:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_76), 16, 16)) -> intp(2, 0, 3a)
cpu_intr_2_59:
	setx	0x27012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf695e176  ! 923: LDUHA_I	lduha	[%r23, + 0x0176] %asi, %r27
	.word 0xb93d4000  ! 926: SRA_R	sra 	%r21, %r0, %r28
	.word 0xfc0c200c  ! 934: LDUB_I	ldub	[%r16 + 0x000c], %r30
	.word 0x8d9461e7  ! 937: WRPR_PSTATE_I	wrpr	%r17, 0x01e7, %pstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_77:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_77), 16, 16)) -> intp(2, 0, 22)
T2_asi_reg_rd_57:
	mov	0x2e, %r14
	.word 0xf8db8e40  ! 944: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T2_asi_reg_wr_50:
	mov	0xd, %r14
	.word 0xfcf38e40  ! 945: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf44de1cd  ! 950: LDSB_I	ldsb	[%r23 + 0x01cd], %r26
iob_intr_2_78:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_78), 16, 16)) -> intp(2, 0, 3c)
iob_intr_2_79:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_79), 16, 16)) -> intp(2, 0, 23)
cpu_intr_2_60:
	setx	0x270225, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_61:
	setx	0x240127, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_58:
	mov	0x14, %r14
	.word 0xfcdb8e60  ! 957: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf48d0020  ! 963: LDUBA_R	lduba	[%r20, %r0] 0x01, %r26
	.word 0xfacd8020  ! 965: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r29
	.word 0xb8bdc000  ! 967: XNORcc_R	xnorcc 	%r23, %r0, %r28
cpu_intr_2_62:
	setx	0x250103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4544000  ! 973: LDSH_R	ldsh	[%r17 + %r0], %r26
	.word 0xb28da1a7  ! 975: ANDcc_I	andcc 	%r22, 0x01a7, %r25
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982810  ! 977: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0810, %hpstate
	.word 0xb4b4e103  ! 978: SUBCcc_I	orncc 	%r19, 0x0103, %r26
cpu_intr_2_63:
	setx	0x27010b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_80:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_80), 16, 16)) -> intp(2, 0, 34)
iob_intr_2_81:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_81), 16, 16)) -> intp(2, 0, 7)
cpu_intr_2_64:
	setx	0x240126, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982f1a  ! 986: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f1a, %hpstate
cpu_intr_2_65:
	setx	0x250238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb21c4000  ! 990: XOR_R	xor 	%r17, %r0, %r25
	.word 0xf81521c6  ! 991: LDUH_I	lduh	[%r20 + 0x01c6], %r28
	.word 0xb3504000  ! 995: RDPR_TNPC	<illegal instruction>
cpu_intr_2_66:
	setx	0x270222, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_51:
	mov	0x18, %r14
	.word 0xfef38e60  ! 997: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_2_67:
	setx	0x26001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa44e0b3  ! 1000: LDSW_I	ldsw	[%r19 + 0x00b3], %r29
T2_asi_reg_rd_59:
	mov	0x3c6, %r14
	.word 0xfcdb84a0  ! 1002: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_2_68:
	setx	0x260334, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_52:
	mov	0x30, %r14
	.word 0xf2f38400  ! 1009: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982e40  ! 1010: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e40, %hpstate
	.word 0xf25cc000  ! 1011: LDX_R	ldx	[%r19 + %r0], %r25
cpu_intr_2_69:
	setx	0x240310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb934c000  ! 1022: SRL_R	srl 	%r19, %r0, %r28
	.word 0xfa452012  ! 1024: LDSW_I	ldsw	[%r20 + 0x0012], %r29
T2_asi_reg_rd_60:
	mov	0x10, %r14
	.word 0xf0db84a0  ! 1025: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0x8194a1f7  ! 1026: WRPR_TPC_I	wrpr	%r18, 0x01f7, %tpc
cpu_intr_2_70:
	setx	0x10003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba0d61be  ! 1030: AND_I	and 	%r21, 0x01be, %r29
	.word 0xfe5d8000  ! 1031: LDX_R	ldx	[%r22 + %r0], %r31
	.word 0xf48dc020  ! 1039: LDUBA_R	lduba	[%r23, %r0] 0x01, %r26
iob_intr_2_82:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_82), 16, 16)) -> intp(2, 0, 26)
cpu_intr_2_71:
	setx	0x27030c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_72:
	setx	0x260138, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_73:
	setx	0x25000d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_83:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_83), 16, 16)) -> intp(2, 0, 1b)
T2_asi_reg_rd_61:
	mov	0x19, %r14
	.word 0xfcdb8e40  ! 1049: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfe0c8000  ! 1050: LDUB_R	ldub	[%r18 + %r0], %r31
T2_asi_reg_rd_62:
	mov	0x3c1, %r14
	.word 0xf2db8e40  ! 1052: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_rd_63:
	mov	0x37, %r14
	.word 0xf6db8e80  ! 1053: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf2dc61a7  ! 1056: LDXA_I	ldxa	[%r17, + 0x01a7] %asi, %r25
	.word 0xba8d61cb  ! 1058: ANDcc_I	andcc 	%r21, 0x01cb, %r29
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_TO_TL0
	.word 0xb42d8000  ! 1065: ANDN_R	andn 	%r22, %r0, %r26
	.word 0xf25c60e7  ! 1066: LDX_I	ldx	[%r17 + 0x00e7], %r25
	.word 0xf494a011  ! 1068: LDUHA_I	lduha	[%r18, + 0x0011] %asi, %r26
	.word 0xfe450000  ! 1071: LDSW_R	ldsw	[%r20 + %r0], %r31
T2_asi_reg_wr_53:
	mov	0x2e, %r14
	.word 0xf2f38e60  ! 1073: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf85d0000  ! 1075: LDX_R	ldx	[%r20 + %r0], %r28
cpu_intr_2_74:
	setx	0x250106, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_84:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_84), 16, 16)) -> intp(2, 0, 3f)
cpu_intr_2_75:
	setx	0x250016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2c4c020  ! 1084: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r25
	.word 0xf0cc8020  ! 1086: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r24
T2_asi_reg_rd_64:
	mov	0x3c7, %r14
	.word 0xfcdb8e40  ! 1087: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_2_85:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_85), 16, 16)) -> intp(2, 0, 26)
	.word 0xf245602c  ! 1092: LDSW_I	ldsw	[%r21 + 0x002c], %r25
T2_asi_reg_rd_65:
	mov	0xe, %r14
	.word 0xfcdb8e60  ! 1095: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_2_86:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_86), 16, 16)) -> intp(2, 0, 15)
iob_intr_2_87:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_87), 16, 16)) -> intp(2, 0, 5)
iob_intr_2_88:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_88), 16, 16)) -> intp(2, 0, 31)
	.word 0xfec4e054  ! 1101: LDSWA_I	ldswa	[%r19, + 0x0054] %asi, %r31
cpu_intr_2_76:
	setx	0x24001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc2dc000  ! 1106: ANDN_R	andn 	%r23, %r0, %r30
	.word 0xf6842068  ! 1107: LDUWA_I	lduwa	[%r16, + 0x0068] %asi, %r27
cpu_intr_2_77:
	setx	0x26013e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_78:
	setx	0x260325, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_66:
	mov	0x1f, %r14
	.word 0xf4db8e60  ! 1117: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_2_89:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_89), 16, 16)) -> intp(2, 0, 37)
T2_asi_reg_rd_67:
	mov	0x36, %r14
	.word 0xf4db84a0  ! 1119: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_2_90:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_90), 16, 16)) -> intp(2, 0, 10)
	.word 0xf0c44020  ! 1129: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r24
	.word 0xf40c6116  ! 1131: LDUB_I	ldub	[%r17 + 0x0116], %r26
iob_intr_2_91:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_91), 16, 16)) -> intp(2, 0, 31)
	.word 0xb88de09b  ! 1135: ANDcc_I	andcc 	%r23, 0x009b, %r28
cpu_intr_2_79:
	setx	0x24030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_54:
	mov	0xf, %r14
	.word 0xf8f384a0  ! 1143: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf8cdc020  ! 1145: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r28
	.word 0xfe8da0b6  ! 1146: LDUBA_I	lduba	[%r22, + 0x00b6] %asi, %r31
	.word 0xf00da168  ! 1148: LDUB_I	ldub	[%r22 + 0x0168], %r24
cpu_intr_2_80:
	setx	0x24012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf2c0000  ! 1150: SLL_R	sll 	%r16, %r0, %r31
	.word 0xfecdc020  ! 1151: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r31
cpu_intr_2_81:
	setx	0x240225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb80d210a  ! 1156: AND_I	and 	%r20, 0x010a, %r28
	.word 0xb49d6082  ! 1157: XORcc_I	xorcc 	%r21, 0x0082, %r26
T2_asi_reg_rd_68:
	mov	0x8, %r14
	.word 0xf8db8400  ! 1158: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_2_82:
	setx	0x250211, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_83:
	setx	0x250237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb89ca065  ! 1162: XORcc_I	xorcc 	%r18, 0x0065, %r28
T2_asi_reg_wr_55:
	mov	0x30, %r14
	.word 0xf2f38e80  ! 1164: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
iob_intr_2_92:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_92), 16, 16)) -> intp(2, 0, 16)
iob_intr_2_93:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_93), 16, 16)) -> intp(2, 0, 7)
iob_intr_2_94:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_94), 16, 16)) -> intp(2, 0, 23)
T2_asi_reg_wr_56:
	mov	0xe, %r14
	.word 0xf6f38e80  ! 1176: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf2ccc020  ! 1177: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r25
	.word 0xf00d60f2  ! 1178: LDUB_I	ldub	[%r21 + 0x00f2], %r24
	.word 0xba8cc000  ! 1179: ANDcc_R	andcc 	%r19, %r0, %r29
cpu_intr_2_84:
	setx	0x270326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc04a1cd  ! 1183: LDUW_I	lduw	[%r18 + 0x01cd], %r30
T2_asi_reg_wr_57:
	mov	0x16, %r14
	.word 0xf6f389e0  ! 1184: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xfa142196  ! 1185: LDUH_I	lduh	[%r16 + 0x0196], %r29
cpu_intr_2_85:
	setx	0x270104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5de17e  ! 1187: LDX_I	ldx	[%r23 + 0x017e], %r31
T2_asi_reg_wr_58:
	mov	0xf, %r14
	.word 0xf2f38e40  ! 1189: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T2_asi_reg_rd_69:
	mov	0x3c5, %r14
	.word 0xfadb84a0  ! 1191: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T2_asi_reg_wr_59:
	mov	0x2e, %r14
	.word 0xf8f38400  ! 1194: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xfe8d4020  ! 1195: LDUBA_R	lduba	[%r21, %r0] 0x01, %r31
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983bca  ! 1196: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bca, %hpstate
T2_asi_reg_wr_60:
	mov	0x34, %r14
	.word 0xf4f38e40  ! 1197: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_rd_70:
	mov	0x1e, %r14
	.word 0xfedb8e40  ! 1198: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_2_86:
	setx	0x270201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf004e178  ! 1204: LDUW_I	lduw	[%r19 + 0x0178], %r24
	.word 0xf85d8000  ! 1205: LDX_R	ldx	[%r22 + %r0], %r28
iob_intr_2_95:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_95), 16, 16)) -> intp(2, 0, a)
	.word 0xbab42139  ! 1210: ORNcc_I	orncc 	%r16, 0x0139, %r29
T2_asi_reg_rd_71:
	mov	0x1b, %r14
	.word 0xf8db8e40  ! 1211: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_2_87:
	setx	0x270234, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_88:
	setx	0x270011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb61420aa  ! 1216: OR_I	or 	%r16, 0x00aa, %r27
	.word 0xfc94a05e  ! 1220: LDUHA_I	lduha	[%r18, + 0x005e] %asi, %r30
	.word 0xb135b001  ! 1221: SRLX_I	srlx	%r22, 0x0001, %r24
	.word 0xb234605b  ! 1222: ORN_I	orn 	%r17, 0x005b, %r25
T2_asi_reg_rd_72:
	mov	0x3, %r14
	.word 0xf2db8e40  ! 1223: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbe95c000  ! 1224: ORcc_R	orcc 	%r23, %r0, %r31
cpu_intr_2_89:
	setx	0x25032f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_96:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_96), 16, 16)) -> intp(2, 0, 27)
	.word 0xf45c60ac  ! 1229: LDX_I	ldx	[%r17 + 0x00ac], %r26
cpu_intr_2_90:
	setx	0x27002c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_97:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_97), 16, 16)) -> intp(2, 0, 25)
	.word 0xfc0521e5  ! 1234: LDUW_I	lduw	[%r20 + 0x01e5], %r30
	.word 0xb094a187  ! 1237: ORcc_I	orcc 	%r18, 0x0187, %r24
cpu_intr_2_91:
	setx	0x27030e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_92:
	setx	0x25030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_61:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 1241: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_98:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_98), 16, 16)) -> intp(2, 0, 1)
	.word 0xf4148000  ! 1245: LDUH_R	lduh	[%r18 + %r0], %r26
iob_intr_2_99:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_99), 16, 16)) -> intp(2, 0, 23)
cpu_intr_2_93:
	setx	0x260200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8bc4000  ! 1249: XNORcc_R	xnorcc 	%r17, %r0, %r28
	.word 0xbd3c2001  ! 1253: SRA_I	sra 	%r16, 0x0001, %r30
iob_intr_2_100:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_100), 16, 16)) -> intp(2, 0, 23)
	.word 0xfed4e0cb  ! 1257: LDSHA_I	ldsha	[%r19, + 0x00cb] %asi, %r31
	.word 0xb605e085  ! 1258: ADD_I	add 	%r23, 0x0085, %r27
	.word 0xfc456135  ! 1263: LDSW_I	ldsw	[%r21 + 0x0135], %r30
cpu_intr_2_94:
	setx	0x240219, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_2_101:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_101), 16, 16)) -> intp(2, 0, 22)
	.word 0xf415c000  ! 1285: LDUH_R	lduh	[%r23 + %r0], %r26
	.word 0xf65521c5  ! 1291: LDSH_I	ldsh	[%r20 + 0x01c5], %r27
iob_intr_2_102:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_102), 16, 16)) -> intp(2, 0, 2)
iob_intr_2_103:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_103), 16, 16)) -> intp(2, 0, 3b)
	.word 0xfc44a128  ! 1298: LDSW_I	ldsw	[%r18 + 0x0128], %r30
	.word 0xfa55c000  ! 1300: LDSH_R	ldsh	[%r23 + %r0], %r29
	.word 0x8195218d  ! 1301: WRPR_TPC_I	wrpr	%r20, 0x018d, %tpc
iob_intr_2_104:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_104), 16, 16)) -> intp(2, 0, b)
	.word 0xf08de1a3  ! 1303: LDUBA_I	lduba	[%r23, + 0x01a3] %asi, %r24
	ta	T_CHANGE_HPRIV
iob_intr_2_105:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_105), 16, 16)) -> intp(2, 0, 36)
	.word 0xfc4d2179  ! 1309: LDSB_I	ldsb	[%r20 + 0x0179], %r30
T2_asi_reg_wr_62:
	mov	0x7, %r14
	.word 0xf0f389e0  ! 1311: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T2_asi_reg_rd_73:
	mov	0x3c1, %r14
	.word 0xf2db89e0  ! 1313: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T2_asi_reg_rd_74:
	mov	0x18, %r14
	.word 0xf8db84a0  ! 1314: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf28de047  ! 1316: LDUBA_I	lduba	[%r23, + 0x0047] %asi, %r25
T2_asi_reg_rd_75:
	mov	0x6, %r14
	.word 0xf4db84a0  ! 1317: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_2_95:
	setx	0x240034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb2cf001  ! 1321: SLLX_I	sllx	%r19, 0x0001, %r29
cpu_intr_2_96:
	setx	0x260330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe858020  ! 1323: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xf4c40020  ! 1327: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r26
T2_asi_reg_wr_63:
	mov	0x28, %r14
	.word 0xfef38e40  ! 1331: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_106:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_106), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf0d5a183  ! 1338: LDSHA_I	ldsha	[%r22, + 0x0183] %asi, %r24
iob_intr_2_107:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_107), 16, 16)) -> intp(2, 0, 2c)
	.word 0xfe958020  ! 1341: LDUHA_R	lduha	[%r22, %r0] 0x01, %r31
T2_asi_reg_wr_64:
	mov	0x17, %r14
	.word 0xf8f38e80  ! 1343: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf0558000  ! 1350: LDSH_R	ldsh	[%r22 + %r0], %r24
	.word 0xb6244000  ! 1351: SUB_R	sub 	%r17, %r0, %r27
	.word 0xb6b42180  ! 1356: SUBCcc_I	orncc 	%r16, 0x0180, %r27
	.word 0xf8944020  ! 1358: LDUHA_R	lduha	[%r17, %r0] 0x01, %r28
T2_asi_reg_wr_65:
	mov	0x3c6, %r14
	.word 0xfcf38e40  ! 1364: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_97:
	setx	0x2b0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983cc8  ! 1369: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc8, %hpstate
T2_asi_reg_rd_76:
	mov	0x2d, %r14
	.word 0xf0db8e40  ! 1370: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb1520000  ! 1371: RDPR_PIL	<illegal instruction>
cpu_intr_2_98:
	setx	0x2b0306, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_66:
	mov	0x27, %r14
	.word 0xf2f38400  ! 1378: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xfa5dc000  ! 1379: LDX_R	ldx	[%r23 + %r0], %r29
	.word 0xf654c000  ! 1383: LDSH_R	ldsh	[%r19 + %r0], %r27
	.word 0xfa8da176  ! 1385: LDUBA_I	lduba	[%r22, + 0x0176] %asi, %r29
T2_asi_reg_rd_77:
	mov	0x3c0, %r14
	.word 0xfadb89e0  ! 1386: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_2_108:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_108), 16, 16)) -> intp(2, 0, 1c)
iob_intr_2_109:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_109), 16, 16)) -> intp(2, 0, e)
	.word 0xbc8cc000  ! 1392: ANDcc_R	andcc 	%r19, %r0, %r30
T2_asi_reg_wr_67:
	mov	0x9, %r14
	.word 0xf8f38400  ! 1393: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xfc55e022  ! 1394: LDSH_I	ldsh	[%r23 + 0x0022], %r30
	.word 0xf8950020  ! 1396: LDUHA_R	lduha	[%r20, %r0] 0x01, %r28
	.word 0xf44d607e  ! 1397: LDSB_I	ldsb	[%r21 + 0x007e], %r26
iob_intr_2_110:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_110), 16, 16)) -> intp(2, 0, 19)
iob_intr_2_111:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_111), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_99:
	setx	0x29000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982f42  ! 1406: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f42, %hpstate
iob_intr_2_112:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_112), 16, 16)) -> intp(2, 0, 31)
	.word 0xf6d520bd  ! 1408: LDSHA_I	ldsha	[%r20, + 0x00bd] %asi, %r27
	.word 0xb43ce1e6  ! 1411: XNOR_I	xnor 	%r19, 0x01e6, %r26
	.word 0xb8b4a1f3  ! 1419: ORNcc_I	orncc 	%r18, 0x01f3, %r28
	.word 0xb63de195  ! 1420: XNOR_I	xnor 	%r23, 0x0195, %r27
iob_intr_2_113:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_113), 16, 16)) -> intp(2, 0, 3)
	.word 0xfc14a1a2  ! 1426: LDUH_I	lduh	[%r18 + 0x01a2], %r30
	.word 0xf65d0000  ! 1427: LDX_R	ldx	[%r20 + %r0], %r27
	.word 0xfc140000  ! 1428: LDUH_R	lduh	[%r16 + %r0], %r30
cpu_intr_2_100:
	setx	0x2a0001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0c5e1ea  ! 1430: LDSWA_I	ldswa	[%r23, + 0x01ea] %asi, %r24
	.word 0xf6dde088  ! 1433: LDXA_I	ldxa	[%r23, + 0x0088] %asi, %r27
	.word 0xf055203f  ! 1435: LDSH_I	ldsh	[%r20 + 0x003f], %r24
	.word 0xbe2cc000  ! 1436: ANDN_R	andn 	%r19, %r0, %r31
	.word 0xfc948020  ! 1438: LDUHA_R	lduha	[%r18, %r0] 0x01, %r30
iob_intr_2_114:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_114), 16, 16)) -> intp(2, 0, 2a)
iob_intr_2_115:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_115), 16, 16)) -> intp(2, 0, b)
T2_asi_reg_rd_78:
	mov	0x3c5, %r14
	.word 0xf4db8e80  ! 1442: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb57cc400  ! 1448: MOVR_R	movre	%r19, %r0, %r26
iob_intr_2_116:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_116), 16, 16)) -> intp(2, 0, 0)
	.word 0xf2cca185  ! 1452: LDSBA_I	ldsba	[%r18, + 0x0185] %asi, %r25
	.word 0xfc5561d0  ! 1453: LDSH_I	ldsh	[%r21 + 0x01d0], %r30
iob_intr_2_117:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_117), 16, 16)) -> intp(2, 0, 0)
iob_intr_2_118:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_118), 16, 16)) -> intp(2, 0, 16)
cpu_intr_2_101:
	setx	0x2b0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65d0000  ! 1465: LDX_R	ldx	[%r20 + %r0], %r27
	.word 0xb415e0d8  ! 1467: OR_I	or 	%r23, 0x00d8, %r26
cpu_intr_2_102:
	setx	0x2b0111, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_119:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_119), 16, 16)) -> intp(2, 0, 30)
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983b00  ! 1476: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b00, %hpstate
	.word 0xb77d2401  ! 1477: MOVR_I	movre	%r20, 0x1, %r27
	.word 0xfc844020  ! 1482: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r30
	.word 0xf64c60bd  ! 1485: LDSB_I	ldsb	[%r17 + 0x00bd], %r27
iob_intr_2_120:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_120), 16, 16)) -> intp(2, 0, 25)
iob_intr_2_121:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_121), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_wr_68:
	mov	0xb, %r14
	.word 0xf6f38400  ! 1490: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf8d5a0c3  ! 1493: LDSHA_I	ldsha	[%r22, + 0x00c3] %asi, %r28
cpu_intr_2_103:
	setx	0x2b000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_2_122:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_122), 16, 16)) -> intp(2, 0, 21)
T2_asi_reg_wr_69:
	mov	0x3c3, %r14
	.word 0xf4f38e40  ! 1500: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfacda1cf  ! 1503: LDSBA_I	ldsba	[%r22, + 0x01cf] %asi, %r29
	ta	T_CHANGE_HPRIV
iob_intr_2_123:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_123), 16, 16)) -> intp(2, 0, 3)
T2_asi_reg_wr_70:
	mov	0x2a, %r14
	.word 0xfaf38e40  ! 1511: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_104:
	setx	0x2b003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xbd2d0000  ! 1514: SLL_R	sll 	%r20, %r0, %r30
	.word 0xf29460a3  ! 1515: LDUHA_I	lduha	[%r17, + 0x00a3] %asi, %r25
cpu_intr_2_105:
	setx	0x2a0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb49c60ca  ! 1519: XORcc_I	xorcc 	%r17, 0x00ca, %r26
iob_intr_2_124:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_124), 16, 16)) -> intp(2, 0, 8)
iob_intr_2_125:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_125), 16, 16)) -> intp(2, 0, 37)
	.word 0xb0344000  ! 1522: SUBC_R	orn 	%r17, %r0, %r24
T2_asi_reg_wr_71:
	mov	0x2e, %r14
	.word 0xf6f389e0  ! 1523: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xfa8d8020  ! 1524: LDUBA_R	lduba	[%r22, %r0] 0x01, %r29
T2_asi_reg_wr_72:
	mov	0x3c6, %r14
	.word 0xf6f384a0  ! 1529: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_2_106:
	setx	0x2b0107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf29420d5  ! 1531: LDUHA_I	lduha	[%r16, + 0x00d5] %asi, %r25
	.word 0xf8950020  ! 1536: LDUHA_R	lduha	[%r20, %r0] 0x01, %r28
	.word 0xf4d521f0  ! 1538: LDSHA_I	ldsha	[%r20, + 0x01f0] %asi, %r26
cpu_intr_2_107:
	setx	0x2b022b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_108:
	setx	0x280023, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_79:
	mov	0x3c1, %r14
	.word 0xf8db8e80  ! 1545: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_2_126:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_126), 16, 16)) -> intp(2, 0, b)
	.word 0xf8c5e0a0  ! 1547: LDSWA_I	ldswa	[%r23, + 0x00a0] %asi, %r28
cpu_intr_2_109:
	setx	0x2b032b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_127:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_127), 16, 16)) -> intp(2, 0, 5)
iob_intr_2_128:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_128), 16, 16)) -> intp(2, 0, 13)
	.word 0xfe5cc000  ! 1551: LDX_R	ldx	[%r19 + %r0], %r31
T2_asi_reg_rd_80:
	mov	0x7, %r14
	.word 0xfcdb84a0  ! 1554: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_81:
	mov	0x3c5, %r14
	.word 0xf2db8400  ! 1557: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf40de1e2  ! 1560: LDUB_I	ldub	[%r23 + 0x01e2], %r26
cpu_intr_2_110:
	setx	0x29021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6552145  ! 1563: LDSH_I	ldsh	[%r20 + 0x0145], %r27
	ta	T_CHANGE_TO_TL1
	.word 0xf2c461ae  ! 1565: LDSWA_I	ldswa	[%r17, + 0x01ae] %asi, %r25
T2_asi_reg_wr_73:
	mov	0x31, %r14
	.word 0xf2f38e60  ! 1567: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_2_129:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_129), 16, 16)) -> intp(2, 0, c)
	.word 0xf40461ab  ! 1570: LDUW_I	lduw	[%r17 + 0x01ab], %r26
	.word 0xf05c60a4  ! 1572: LDX_I	ldx	[%r17 + 0x00a4], %r24
iob_intr_2_130:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_130), 16, 16)) -> intp(2, 0, 4)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_74:
	mov	0x2d, %r14
	.word 0xf0f38e80  ! 1575: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_2_131:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_131), 16, 16)) -> intp(2, 0, 39)
	.word 0xf4dd616c  ! 1577: LDXA_I	ldxa	[%r21, + 0x016c] %asi, %r26
cpu_intr_2_111:
	setx	0x2a0034, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_132:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_132), 16, 16)) -> intp(2, 0, d)
iob_intr_2_133:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_133), 16, 16)) -> intp(2, 0, 0)
	.word 0xfa95a1f7  ! 1583: LDUHA_I	lduha	[%r22, + 0x01f7] %asi, %r29
cpu_intr_2_112:
	setx	0x280302, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_134:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_134), 16, 16)) -> intp(2, 0, 3f)
T2_asi_reg_rd_82:
	mov	0x3c3, %r14
	.word 0xfadb8e80  ! 1589: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_2_135:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_135), 16, 16)) -> intp(2, 0, d)
	.word 0xf09420ba  ! 1595: LDUHA_I	lduha	[%r16, + 0x00ba] %asi, %r24
cpu_intr_2_113:
	setx	0x28023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_75:
	mov	0x3c5, %r14
	.word 0xf2f38e40  ! 1598: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T2_asi_reg_wr_76:
	mov	0x15, %r14
	.word 0xfcf38e60  ! 1599: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_2_136:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_136), 16, 16)) -> intp(2, 0, 1c)
iob_intr_2_137:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_137), 16, 16)) -> intp(2, 0, 13)
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
cpu_intr_2_114:
	setx	0x2a0016, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_83:
	mov	0x2c, %r14
	.word 0xfadb84a0  ! 1609: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T2_asi_reg_wr_77:
	mov	0x0, %r14
	.word 0xfcf38e60  ! 1610: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T2_asi_reg_wr_78:
	mov	0x9, %r14
	.word 0xf4f38e40  ! 1612: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_wr_79:
	mov	0x26, %r14
	.word 0xfaf389e0  ! 1613: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T2_asi_reg_rd_84:
	mov	0x10, %r14
	.word 0xf6db8400  ! 1614: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xfc8c0020  ! 1616: LDUBA_R	lduba	[%r16, %r0] 0x01, %r30
	.word 0xf88461b1  ! 1620: LDUWA_I	lduwa	[%r17, + 0x01b1] %asi, %r28
	ta	T_CHANGE_TO_TL0
	.word 0xf215c000  ! 1623: LDUH_R	lduh	[%r23 + %r0], %r25
	.word 0xf255e1ea  ! 1626: LDSH_I	ldsh	[%r23 + 0x01ea], %r25
	.word 0xfa158000  ! 1627: LDUH_R	lduh	[%r22 + %r0], %r29
iob_intr_2_138:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_138), 16, 16)) -> intp(2, 0, 25)
	ta	T_CHANGE_NONHPRIV
iob_intr_2_139:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_139), 16, 16)) -> intp(2, 0, 26)
cpu_intr_2_115:
	setx	0x29031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_140:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_140), 16, 16)) -> intp(2, 0, e)
	.word 0xbf51c000  ! 1647: RDPR_TL	<illegal instruction>
	.word 0xfc54e090  ! 1649: LDSH_I	ldsh	[%r19 + 0x0090], %r30
	.word 0xfcd48020  ! 1650: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r30
iob_intr_2_141:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_141), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_116:
	setx	0x290310, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_142:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_142), 16, 16)) -> intp(2, 0, 2f)
cpu_intr_2_117:
	setx	0x2a0237, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_118:
	setx	0x290023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc9d6182  ! 1662: XORcc_I	xorcc 	%r21, 0x0182, %r30
T2_asi_reg_rd_85:
	mov	0x3c7, %r14
	.word 0xfedb8e80  ! 1665: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_2_143:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_143), 16, 16)) -> intp(2, 0, 19)
	.word 0xf20d0000  ! 1667: LDUB_R	ldub	[%r20 + %r0], %r25
T2_asi_reg_wr_80:
	mov	0x29, %r14
	.word 0xf8f389e0  ! 1669: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_2_144:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_144), 16, 16)) -> intp(2, 0, 1b)
	.word 0xfe84e017  ! 1674: LDUWA_I	lduwa	[%r19, + 0x0017] %asi, %r31
	.word 0x83952160  ! 1675: WRPR_TNPC_I	wrpr	%r20, 0x0160, %tnpc
	.word 0xfc04a10e  ! 1676: LDUW_I	lduw	[%r18 + 0x010e], %r30
cpu_intr_2_119:
	setx	0x2b032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x8198394a  ! 1683: WRHPR_HPSTATE_I	wrhpr	%r0, 0x194a, %hpstate
	.word 0xf88ce179  ! 1684: LDUBA_I	lduba	[%r19, + 0x0179] %asi, %r28
cpu_intr_2_120:
	setx	0x2a0301, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_145:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_145), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_wr_81:
	mov	0x4, %r14
	.word 0xf6f38e80  ! 1688: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_2_146:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_146), 16, 16)) -> intp(2, 0, 2f)
T2_asi_reg_rd_86:
	mov	0x3c0, %r14
	.word 0xfadb8e40  ! 1693: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf45d8000  ! 1695: LDX_R	ldx	[%r22 + %r0], %r26
iob_intr_2_147:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_147), 16, 16)) -> intp(2, 0, d)
T2_asi_reg_rd_87:
	mov	0x16, %r14
	.word 0xf4db8e60  ! 1699: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_121:
	setx	0x2b0032, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_82:
	mov	0x1b, %r14
	.word 0xf8f389e0  ! 1706: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T2_asi_reg_rd_88:
	mov	0x5, %r14
	.word 0xfedb8e40  ! 1707: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfed46044  ! 1708: LDSHA_I	ldsha	[%r17, + 0x0044] %asi, %r31
T2_asi_reg_wr_83:
	mov	0x3c1, %r14
	.word 0xfaf38e80  ! 1709: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf00ce0d4  ! 1713: LDUB_I	ldub	[%r19 + 0x00d4], %r24
iob_intr_2_148:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_148), 16, 16)) -> intp(2, 0, 15)
	.word 0xb20d218d  ! 1718: AND_I	and 	%r20, 0x018d, %r25
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_89:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 1724: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf2540000  ! 1725: LDSH_R	ldsh	[%r16 + %r0], %r25
	ta	T_CHANGE_TO_TL1
cpu_intr_2_122:
	setx	0x280239, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_149:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_149), 16, 16)) -> intp(2, 0, 29)
	.word 0xf4cd215e  ! 1733: LDSBA_I	ldsba	[%r20, + 0x015e] %asi, %r26
	.word 0xbaa54000  ! 1734: SUBcc_R	subcc 	%r21, %r0, %r29
	.word 0xfa0dc000  ! 1735: LDUB_R	ldub	[%r23 + %r0], %r29
cpu_intr_2_123:
	setx	0x280332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6154000  ! 1738: LDUH_R	lduh	[%r21 + %r0], %r27
	.word 0xf485213f  ! 1739: LDUWA_I	lduwa	[%r20, + 0x013f] %asi, %r26
iob_intr_2_150:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_150), 16, 16)) -> intp(2, 0, 3a)
	.word 0xfe4dc000  ! 1744: LDSB_R	ldsb	[%r23 + %r0], %r31
iob_intr_2_151:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_151), 16, 16)) -> intp(2, 0, 4)
T2_asi_reg_rd_90:
	mov	0x9, %r14
	.word 0xf0db8e80  ! 1748: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T2_asi_reg_rd_91:
	mov	0x4, %r14
	.word 0xf4db8e40  ! 1750: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_92:
	mov	0x25, %r14
	.word 0xfadb84a0  ! 1752: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_2_124:
	setx	0x2a0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4150000  ! 1761: LDUH_R	lduh	[%r20 + %r0], %r26
T2_asi_reg_rd_93:
	mov	0xa, %r14
	.word 0xfedb8e40  ! 1763: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf65d60f9  ! 1764: LDX_I	ldx	[%r21 + 0x00f9], %r27
cpu_intr_2_125:
	setx	0x2a0106, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_84:
	mov	0x20, %r14
	.word 0xf6f38e40  ! 1768: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_2_152:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_152), 16, 16)) -> intp(2, 0, 18)
T2_asi_reg_rd_94:
	mov	0x15, %r14
	.word 0xfcdb8e60  ! 1775: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf68ce1e1  ! 1776: LDUBA_I	lduba	[%r19, + 0x01e1] %asi, %r27
iob_intr_2_153:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_153), 16, 16)) -> intp(2, 0, 2c)
iob_intr_2_154:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_154), 16, 16)) -> intp(2, 0, 27)
iob_intr_2_155:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_155), 16, 16)) -> intp(2, 0, 7)
	.word 0xf085e10c  ! 1782: LDUWA_I	lduwa	[%r23, + 0x010c] %asi, %r24
	.word 0xf09521c7  ! 1790: LDUHA_I	lduha	[%r20, + 0x01c7] %asi, %r24
	.word 0xf28d0020  ! 1791: LDUBA_R	lduba	[%r20, %r0] 0x01, %r25
iob_intr_2_156:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_156), 16, 16)) -> intp(2, 0, 24)
	.word 0xf6cce10c  ! 1796: LDSBA_I	ldsba	[%r19, + 0x010c] %asi, %r27
cpu_intr_2_126:
	setx	0x2a013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_95:
	mov	0x3c8, %r14
	.word 0xf6db8e40  ! 1801: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfe15e166  ! 1804: LDUH_I	lduh	[%r23 + 0x0166], %r31
T2_asi_reg_wr_85:
	mov	0x20, %r14
	.word 0xf8f38e80  ! 1807: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_2_127:
	setx	0x2f023c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_128:
	setx	0x2d0020, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_129:
	setx	0x2c0016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8c2072  ! 1824: LDUBA_I	lduba	[%r16, + 0x0072] %asi, %r31
T2_asi_reg_wr_86:
	mov	0x2d, %r14
	.word 0xfcf38e80  ! 1826: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_2_157:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_157), 16, 16)) -> intp(2, 0, 2)
cpu_intr_2_130:
	setx	0x2e0007, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_87:
	mov	0x3c5, %r14
	.word 0xfaf38e40  ! 1830: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb32ca001  ! 1831: SLL_I	sll 	%r18, 0x0001, %r25
	.word 0xfe04c000  ! 1833: LDUW_R	lduw	[%r19 + %r0], %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xfc94c020  ! 1838: LDUHA_R	lduha	[%r19, %r0] 0x01, %r30
	.word 0xf0558000  ! 1840: LDSH_R	ldsh	[%r22 + %r0], %r24
cpu_intr_2_131:
	setx	0x2c000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba144000  ! 1842: OR_R	or 	%r17, %r0, %r29
cpu_intr_2_132:
	setx	0x2e0209, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_133:
	setx	0x2c012a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_134:
	setx	0x2f011c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_135:
	setx	0x2f0106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd2d9000  ! 1850: SLLX_R	sllx	%r22, %r0, %r30
	.word 0xf68de15b  ! 1852: LDUBA_I	lduba	[%r23, + 0x015b] %asi, %r27
	ta	T_CHANGE_TO_TL1
	.word 0xfadca05e  ! 1856: LDXA_I	ldxa	[%r18, + 0x005e] %asi, %r29
	.word 0xf2d4e046  ! 1857: LDSHA_I	ldsha	[%r19, + 0x0046] %asi, %r25
	.word 0xf0d54020  ! 1858: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r24
T2_asi_reg_rd_96:
	mov	0xd, %r14
	.word 0xf2db89e0  ! 1859: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_2_136:
	setx	0x2c0219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4c0000  ! 1866: LDSB_R	ldsb	[%r16 + %r0], %r29
iob_intr_2_158:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_158), 16, 16)) -> intp(2, 0, 22)
T2_asi_reg_rd_97:
	mov	0x28, %r14
	.word 0xfedb89e0  ! 1868: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982e82  ! 1869: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e82, %hpstate
cpu_intr_2_137:
	setx	0x2c010e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_88:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 1872: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfe144000  ! 1875: LDUH_R	lduh	[%r17 + %r0], %r31
T2_asi_reg_rd_98:
	mov	0x1c, %r14
	.word 0xfcdb8e40  ! 1876: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf4cd8020  ! 1877: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r26
	.word 0xf494a07c  ! 1878: LDUHA_I	lduha	[%r18, + 0x007c] %asi, %r26
cpu_intr_2_138:
	setx	0x2f031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe544000  ! 1883: LDSH_R	ldsh	[%r17 + %r0], %r31
iob_intr_2_159:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_159), 16, 16)) -> intp(2, 0, 1d)
	ta	T_CHANGE_NONHPRIV
iob_intr_2_160:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_160), 16, 16)) -> intp(2, 0, 37)
	.word 0xb8bce0ac  ! 1890: XNORcc_I	xnorcc 	%r19, 0x00ac, %r28
cpu_intr_2_139:
	setx	0x2c020e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_140:
	setx	0x2d022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfecd8020  ! 1897: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r31
	.word 0xb0a4219f  ! 1900: SUBcc_I	subcc 	%r16, 0x019f, %r24
	.word 0xb60461af  ! 1902: ADD_I	add 	%r17, 0x01af, %r27
	.word 0xf8956138  ! 1903: LDUHA_I	lduha	[%r21, + 0x0138] %asi, %r28
T2_asi_reg_wr_89:
	mov	0x1d, %r14
	.word 0xf8f38e40  ! 1904: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xba05a187  ! 1906: ADD_I	add 	%r22, 0x0187, %r29
cpu_intr_2_141:
	setx	0x2e0137, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_90:
	mov	0x35, %r14
	.word 0xf8f38e40  ! 1908: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb22c2056  ! 1909: ANDN_I	andn 	%r16, 0x0056, %r25
cpu_intr_2_142:
	setx	0x2c0124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe2ce08c  ! 1915: ANDN_I	andn 	%r19, 0x008c, %r31
	.word 0xf8dd60cd  ! 1916: LDXA_I	ldxa	[%r21, + 0x00cd] %asi, %r28
	.word 0xf80c8000  ! 1918: LDUB_R	ldub	[%r18 + %r0], %r28
T2_asi_reg_wr_91:
	mov	0x21, %r14
	.word 0xf4f38e40  ! 1919: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfcd40020  ! 1921: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r30
cpu_intr_2_143:
	setx	0x10328, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_99:
	mov	0x1d, %r14
	.word 0xfadb8e80  ! 1924: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_2_144:
	setx	0x2d0334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2dd6131  ! 1927: LDXA_I	ldxa	[%r21, + 0x0131] %asi, %r25
	.word 0xf64c60bc  ! 1928: LDSB_I	ldsb	[%r17 + 0x00bc], %r27
T2_asi_reg_rd_100:
	mov	0x10, %r14
	.word 0xf6db8e60  ! 1931: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T2_asi_reg_wr_92:
	mov	0x5, %r14
	.word 0xf8f38e60  ! 1932: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_2_145:
	setx	0x216, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_101:
	mov	0x3c2, %r14
	.word 0xf4db89e0  ! 1936: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_2_161:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_161), 16, 16)) -> intp(2, 0, 2a)
iob_intr_2_162:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_162), 16, 16)) -> intp(2, 0, 16)
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982f52  ! 1944: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f52, %hpstate
	.word 0xf84c0000  ! 1947: LDSB_R	ldsb	[%r16 + %r0], %r28
T2_asi_reg_rd_102:
	mov	0x3c3, %r14
	.word 0xf2db8e80  ! 1950: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	ta	T_CHANGE_TO_TL0
	.word 0xf844e031  ! 1953: LDSW_I	ldsw	[%r19 + 0x0031], %r28
	.word 0xf01521a2  ! 1954: LDUH_I	lduh	[%r20 + 0x01a2], %r24
T2_asi_reg_rd_103:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 1958: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_2_146:
	setx	0x2e002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0056013  ! 1960: LDUW_I	lduw	[%r21 + 0x0013], %r24
	.word 0xb01460ea  ! 1962: OR_I	or 	%r17, 0x00ea, %r24
	.word 0xbc044000  ! 1963: ADD_R	add 	%r17, %r0, %r30
	.word 0xf68de166  ! 1966: LDUBA_I	lduba	[%r23, + 0x0166] %asi, %r27
cpu_intr_2_147:
	setx	0x2f0325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe042101  ! 1971: LDUW_I	lduw	[%r16 + 0x0101], %r31
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982cda  ! 1972: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cda, %hpstate
cpu_intr_2_148:
	setx	0x2d031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6bd8000  ! 1974: XNORcc_R	xnorcc 	%r22, %r0, %r27
T2_asi_reg_wr_93:
	mov	0x3c2, %r14
	.word 0xf2f38e80  ! 1976: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_2_149:
	setx	0x2f020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_104:
	mov	0x36, %r14
	.word 0xf6db8e40  ! 1985: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfa54a0d7  ! 1987: LDSH_I	ldsh	[%r18 + 0x00d7], %r29
	.word 0xfc14e12b  ! 1988: LDUH_I	lduh	[%r19 + 0x012b], %r30
	.word 0xfe4dc000  ! 1989: LDSB_R	ldsb	[%r23 + %r0], %r31
	.word 0xb4144000  ! 1990: OR_R	or 	%r17, %r0, %r26
	.word 0xfcd58020  ! 1998: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r30
iob_intr_2_163:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_163), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_rd_105:
	mov	0x3c2, %r14
	.word 0xf6db89e0  ! 2000: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	ta	T_CHANGE_HPRIV
cpu_intr_2_150:
	setx	0x2c031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_106:
	mov	0x19, %r14
	.word 0xf6db8400  ! 2004: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf0c40020  ! 2005: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r24
T2_asi_reg_wr_94:
	mov	0x3c1, %r14
	.word 0xfaf384a0  ! 2006: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xf2154000  ! 2007: LDUH_R	lduh	[%r21 + %r0], %r25
T2_asi_reg_wr_95:
	mov	0x6, %r14
	.word 0xfef38400  ! 2008: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983e40  ! 2009: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e40, %hpstate
T2_asi_reg_wr_96:
	mov	0x3c3, %r14
	.word 0xf0f38400  ! 2012: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf655c000  ! 2013: LDSH_R	ldsh	[%r23 + %r0], %r27
iob_intr_2_164:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_164), 16, 16)) -> intp(2, 0, 3a)
cpu_intr_2_151:
	setx	0x2d032e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_107:
	mov	0x11, %r14
	.word 0xf6db8e60  ! 2020: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_2_165:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_165), 16, 16)) -> intp(2, 0, d)
	.word 0xfec520fe  ! 2023: LDSWA_I	ldswa	[%r20, + 0x00fe] %asi, %r31
	.word 0xf6c4a192  ! 2026: LDSWA_I	ldswa	[%r18, + 0x0192] %asi, %r27
T2_asi_reg_rd_108:
	mov	0x5, %r14
	.word 0xfcdb89e0  ! 2035: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T2_asi_reg_wr_97:
	mov	0xe, %r14
	.word 0xfcf38e60  ! 2038: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_2_152:
	setx	0x2d0323, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_166:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_166), 16, 16)) -> intp(2, 0, 3b)
iob_intr_2_167:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_167), 16, 16)) -> intp(2, 0, 1f)
cpu_intr_2_153:
	setx	0x2d0213, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_168:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_168), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf245c000  ! 2057: LDSW_R	ldsw	[%r23 + %r0], %r25
cpu_intr_2_154:
	setx	0x2d010c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_109:
	mov	0x28, %r14
	.word 0xf2db8e40  ! 2060: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_TO_TL1
iob_intr_2_169:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_169), 16, 16)) -> intp(2, 0, d)
	ta	T_CHANGE_HPRIV
iob_intr_2_170:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_170), 16, 16)) -> intp(2, 0, 38)
iob_intr_2_171:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_171), 16, 16)) -> intp(2, 0, 28)
	.word 0xf8146145  ! 2072: LDUH_I	lduh	[%r17 + 0x0145], %r28
	.word 0xf054c000  ! 2074: LDSH_R	ldsh	[%r19 + %r0], %r24
	.word 0xbf7dc400  ! 2075: MOVR_R	movre	%r23, %r0, %r31
	.word 0xf6cc2012  ! 2078: LDSBA_I	ldsba	[%r16, + 0x0012] %asi, %r27
	.word 0xfa5cc000  ! 2079: LDX_R	ldx	[%r19 + %r0], %r29
iob_intr_2_172:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_172), 16, 16)) -> intp(2, 0, 3b)
cpu_intr_2_155:
	setx	0x2d003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4cd2016  ! 2082: LDSBA_I	ldsba	[%r20, + 0x0016] %asi, %r26
	ta	T_CHANGE_TO_TL0
	.word 0xfa8c6123  ! 2086: LDUBA_I	lduba	[%r17, + 0x0123] %asi, %r29
cpu_intr_2_156:
	setx	0x2f010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf805c000  ! 2091: LDUW_R	lduw	[%r23 + %r0], %r28
T2_asi_reg_rd_110:
	mov	0x0, %r14
	.word 0xf0db8e40  ! 2092: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfc052097  ! 2095: LDUW_I	lduw	[%r20 + 0x0097], %r30
	.word 0xfadde052  ! 2096: LDXA_I	ldxa	[%r23, + 0x0052] %asi, %r29
	.word 0xfa044000  ! 2098: LDUW_R	lduw	[%r17 + %r0], %r29
	.word 0xfe0421bb  ! 2103: LDUW_I	lduw	[%r16 + 0x01bb], %r31
T2_asi_reg_wr_98:
	mov	0x5, %r14
	.word 0xf0f389e0  ! 2104: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf805e0a0  ! 2106: LDUW_I	lduw	[%r23 + 0x00a0], %r28
	.word 0xf0dda131  ! 2111: LDXA_I	ldxa	[%r22, + 0x0131] %asi, %r24
iob_intr_2_173:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_173), 16, 16)) -> intp(2, 0, 3e)
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_111:
	mov	0x17, %r14
	.word 0xfcdb8e40  ! 2125: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_2_174:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_174), 16, 16)) -> intp(2, 0, 35)
	.word 0xfe04a0b1  ! 2130: LDUW_I	lduw	[%r18 + 0x00b1], %r31
T2_asi_reg_rd_112:
	mov	0x8, %r14
	.word 0xf4db8e40  ! 2131: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_2_157:
	setx	0x2f031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_113:
	mov	0x3c3, %r14
	.word 0xfcdb8e40  ! 2133: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb6340000  ! 2134: ORN_R	orn 	%r16, %r0, %r27
cpu_intr_2_158:
	setx	0x2d0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbebd607e  ! 2136: XNORcc_I	xnorcc 	%r21, 0x007e, %r31
	.word 0xfc0521ff  ! 2137: LDUW_I	lduw	[%r20 + 0x01ff], %r30
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982f98  ! 2138: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f98, %hpstate
	.word 0xb8250000  ! 2139: SUB_R	sub 	%r20, %r0, %r28
	ta	T_CHANGE_HPRIV
	.word 0xfc14e04a  ! 2143: LDUH_I	lduh	[%r19 + 0x004a], %r30
	.word 0xf08c0020  ! 2146: LDUBA_R	lduba	[%r16, %r0] 0x01, %r24
iob_intr_2_175:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_175), 16, 16)) -> intp(2, 0, 33)
cpu_intr_2_159:
	setx	0x2c0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL0
	.word 0xf6cd2195  ! 2154: LDSBA_I	ldsba	[%r20, + 0x0195] %asi, %r27
	.word 0xb72d1000  ! 2157: SLLX_R	sllx	%r20, %r0, %r27
	.word 0xf215c000  ! 2158: LDUH_R	lduh	[%r23 + %r0], %r25
	.word 0xf0148000  ! 2159: LDUH_R	lduh	[%r18 + %r0], %r24
	.word 0xf40ca186  ! 2160: LDUB_I	ldub	[%r18 + 0x0186], %r26
	.word 0xf2c50020  ! 2167: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r25
cpu_intr_2_160:
	setx	0x2f0139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa448000  ! 2170: LDSW_R	ldsw	[%r18 + %r0], %r29
	.word 0xf094a074  ! 2171: LDUHA_I	lduha	[%r18, + 0x0074] %asi, %r24
cpu_intr_2_161:
	setx	0x2e0013, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_176:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_176), 16, 16)) -> intp(2, 0, d)
	.word 0xf65c4000  ! 2176: LDX_R	ldx	[%r17 + %r0], %r27
	.word 0xfc844020  ! 2177: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r30
T2_asi_reg_wr_99:
	mov	0x18, %r14
	.word 0xf2f38e40  ! 2178: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_2_162:
	setx	0x2f022d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_177:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_177), 16, 16)) -> intp(2, 0, 14)
iob_intr_2_178:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_178), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_rd_114:
	mov	0xe, %r14
	.word 0xfedb8e80  ! 2187: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xfc4dc000  ! 2189: LDSB_R	ldsb	[%r23 + %r0], %r30
	.word 0xb935c000  ! 2190: SRL_R	srl 	%r23, %r0, %r28
	.word 0xb33dd000  ! 2193: SRAX_R	srax	%r23, %r0, %r25
	.word 0xf6d56131  ! 2195: LDSHA_I	ldsha	[%r21, + 0x0131] %asi, %r27
	.word 0xf05d6118  ! 2196: LDX_I	ldx	[%r21 + 0x0118], %r24
	.word 0xf8040000  ! 2197: LDUW_R	lduw	[%r16 + %r0], %r28
iob_intr_2_179:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_179), 16, 16)) -> intp(2, 0, 21)
iob_intr_2_180:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_180), 16, 16)) -> intp(2, 0, 5)
	.word 0xf60c206e  ! 2204: LDUB_I	ldub	[%r16 + 0x006e], %r27
iob_intr_2_181:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_181), 16, 16)) -> intp(2, 0, 3e)
iob_intr_2_182:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_182), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_163:
	setx	0x2c0337, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_183:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_183), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_wr_100:
	mov	0x3c5, %r14
	.word 0xfaf38e40  ! 2210: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_184:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_184), 16, 16)) -> intp(2, 0, 33)
	.word 0xf2dc2116  ! 2213: LDXA_I	ldxa	[%r16, + 0x0116] %asi, %r25
T2_asi_reg_wr_101:
	mov	0x35, %r14
	.word 0xfaf38400  ! 2214: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_2_185:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_185), 16, 16)) -> intp(2, 0, b)
T2_asi_reg_wr_102:
	mov	0x28, %r14
	.word 0xf0f38400  ! 2217: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbe354000  ! 2220: ORN_R	orn 	%r21, %r0, %r31
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982898  ! 2223: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0898, %hpstate
	.word 0xfcc50020  ! 2224: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r30
	.word 0xbb2d1000  ! 2227: SLLX_R	sllx	%r20, %r0, %r29
	.word 0xb434c000  ! 2229: ORN_R	orn 	%r19, %r0, %r26
	.word 0xf084c020  ! 2232: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_115:
	mov	0x26, %r14
	.word 0xf4db8e40  ! 2234: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf255c000  ! 2236: LDSH_R	ldsh	[%r23 + %r0], %r25
T2_asi_reg_rd_116:
	mov	0x26, %r14
	.word 0xfadb89e0  ! 2237: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf4c561f6  ! 2239: LDSWA_I	ldswa	[%r21, + 0x01f6] %asi, %r26
	.word 0xf404618f  ! 2241: LDUW_I	lduw	[%r17 + 0x018f], %r26
	.word 0xf0dd20ae  ! 2244: LDXA_I	ldxa	[%r20, + 0x00ae] %asi, %r24
	.word 0xfecc6007  ! 2249: LDSBA_I	ldsba	[%r17, + 0x0007] %asi, %r31
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_117:
	mov	0x3c5, %r14
	.word 0xf4db8e60  ! 2254: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf815a0cf  ! 2255: LDUH_I	lduh	[%r22 + 0x00cf], %r28
	.word 0xfad4e19b  ! 2256: LDSHA_I	ldsha	[%r19, + 0x019b] %asi, %r29
	.word 0xf2442184  ! 2257: LDSW_I	ldsw	[%r16 + 0x0184], %r25
T2_asi_reg_rd_118:
	mov	0x22, %r14
	.word 0xf8db84a0  ! 2258: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_2_186:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_186), 16, 16)) -> intp(2, 0, 5)
T2_asi_reg_wr_103:
	mov	0x35, %r14
	.word 0xf0f38e40  ! 2263: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_rd_119:
	mov	0xb, %r14
	.word 0xf4db8e40  ! 2266: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfc8d8020  ! 2267: LDUBA_R	lduba	[%r22, %r0] 0x01, %r30
iob_intr_2_187:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_187), 16, 16)) -> intp(2, 0, 0)
iob_intr_2_188:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_188), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf6dde10e  ! 2275: LDXA_I	ldxa	[%r23, + 0x010e] %asi, %r27
	ta	T_CHANGE_TO_TL1
	.word 0xfc4de1b3  ! 2282: LDSB_I	ldsb	[%r23 + 0x01b3], %r30
	.word 0xb72c2001  ! 2285: SLL_I	sll 	%r16, 0x0001, %r27
	.word 0xf894219c  ! 2286: LDUHA_I	lduha	[%r16, + 0x019c] %asi, %r28
	.word 0xf20d8000  ! 2287: LDUB_R	ldub	[%r22 + %r0], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2154000  ! 2289: LDUH_R	lduh	[%r21 + %r0], %r25
	.word 0xbec40000  ! 2291: ADDCcc_R	addccc 	%r16, %r0, %r31
	.word 0xfe0cc000  ! 2296: LDUB_R	ldub	[%r19 + %r0], %r31
	.word 0xb13cf001  ! 2300: SRAX_I	srax	%r19, 0x0001, %r24
T2_asi_reg_wr_104:
	mov	0x32, %r14
	.word 0xf0f38e80  ! 2301: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T2_asi_reg_rd_120:
	mov	0x3c5, %r14
	.word 0xf6db8e40  ! 2302: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf64d21e0  ! 2303: LDSB_I	ldsb	[%r20 + 0x01e0], %r27
	.word 0xf84c0000  ! 2304: LDSB_R	ldsb	[%r16 + %r0], %r28
T2_asi_reg_rd_121:
	mov	0x36, %r14
	.word 0xfcdb84a0  ! 2305: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xfa05c000  ! 2307: LDUW_R	lduw	[%r23 + %r0], %r29
	.word 0xb4bd4000  ! 2308: XNORcc_R	xnorcc 	%r21, %r0, %r26
	.word 0xbcc4c000  ! 2310: ADDCcc_R	addccc 	%r19, %r0, %r30
T2_asi_reg_wr_105:
	mov	0x8, %r14
	.word 0xf4f38e40  ! 2311: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_164:
	setx	0x30033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcc5a088  ! 2314: ADDCcc_I	addccc 	%r22, 0x0088, %r30
	.word 0xf0d5a1e0  ! 2315: LDSHA_I	ldsha	[%r22, + 0x01e0] %asi, %r24
iob_intr_2_189:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_189), 16, 16)) -> intp(2, 0, 2c)
	.word 0xb01de0fb  ! 2325: XOR_I	xor 	%r23, 0x00fb, %r24
T2_asi_reg_wr_106:
	mov	0x21, %r14
	.word 0xf4f38e80  ! 2327: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf0544000  ! 2329: LDSH_R	ldsh	[%r17 + %r0], %r24
iob_intr_2_190:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_190), 16, 16)) -> intp(2, 0, 19)
	ta	T_CHANGE_NONHPRIV
iob_intr_2_191:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_191), 16, 16)) -> intp(2, 0, 3d)
cpu_intr_2_165:
	setx	0x32020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc55c000  ! 2343: LDSH_R	ldsh	[%r23 + %r0], %r30
iob_intr_2_192:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_192), 16, 16)) -> intp(2, 0, 3d)
	.word 0xb6b50000  ! 2347: ORNcc_R	orncc 	%r20, %r0, %r27
	.word 0xba14a137  ! 2351: OR_I	or 	%r18, 0x0137, %r29
T2_asi_reg_rd_122:
	mov	0x3c8, %r14
	.word 0xfedb89e0  ! 2352: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xfc4460f5  ! 2353: LDSW_I	ldsw	[%r17 + 0x00f5], %r30
	.word 0xfcd4615a  ! 2354: LDSHA_I	ldsha	[%r17, + 0x015a] %asi, %r30
T2_asi_reg_wr_107:
	mov	0x2, %r14
	.word 0xfef38e40  ! 2355: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_wr_108:
	mov	0x6, %r14
	.word 0xf2f38e60  ! 2356: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xfc054000  ! 2357: LDUW_R	lduw	[%r21 + %r0], %r30
cpu_intr_2_166:
	setx	0x300103, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_109:
	mov	0x6, %r14
	.word 0xf6f38e80  ! 2365: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf4944020  ! 2368: LDUHA_R	lduha	[%r17, %r0] 0x01, %r26
iob_intr_2_193:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_193), 16, 16)) -> intp(2, 0, 14)
	ta	T_CHANGE_HPRIV
	.word 0xfccd0020  ! 2374: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r30
cpu_intr_2_167:
	setx	0x330219, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_110:
	mov	0x16, %r14
	.word 0xf8f38e80  ! 2378: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_2_168:
	setx	0x300332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6940020  ! 2386: LDUHA_R	lduha	[%r16, %r0] 0x01, %r27
iob_intr_2_194:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_194), 16, 16)) -> intp(2, 0, 28)
T2_asi_reg_rd_123:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 2389: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_2_169:
	setx	0x300318, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_170:
	setx	0x31012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa148000  ! 2393: LDUH_R	lduh	[%r18 + %r0], %r29
T2_asi_reg_wr_111:
	mov	0x1e, %r14
	.word 0xfcf38e60  ! 2398: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xfa044000  ! 2401: LDUW_R	lduw	[%r17 + %r0], %r29
	.word 0xb034a0ca  ! 2403: SUBC_I	orn 	%r18, 0x00ca, %r24
	.word 0xf2cde176  ! 2407: LDSBA_I	ldsba	[%r23, + 0x0176] %asi, %r25
	.word 0xfe94a08b  ! 2408: LDUHA_I	lduha	[%r18, + 0x008b] %asi, %r31
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_112:
	mov	0x38, %r14
	.word 0xfcf38e60  ! 2411: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T2_asi_reg_rd_124:
	mov	0x1e, %r14
	.word 0xfadb8400  ! 2418: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf294a013  ! 2419: LDUHA_I	lduha	[%r18, + 0x0013] %asi, %r25
cpu_intr_2_171:
	setx	0x300002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_195:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_195), 16, 16)) -> intp(2, 0, 27)
	.word 0xf0d44020  ! 2428: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r24
	.word 0xf255a0fa  ! 2429: LDSH_I	ldsh	[%r22 + 0x00fa], %r25
	ta	T_CHANGE_TO_TL0
	.word 0xf494c020  ! 2431: LDUHA_R	lduha	[%r19, %r0] 0x01, %r26
	.word 0xfe442076  ! 2435: LDSW_I	ldsw	[%r16 + 0x0076], %r31
	.word 0x839421b2  ! 2436: WRPR_TNPC_I	wrpr	%r16, 0x01b2, %tnpc
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_125:
	mov	0x29, %r14
	.word 0xf4db89e0  ! 2439: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T2_asi_reg_rd_126:
	mov	0x10, %r14
	.word 0xfedb84a0  ! 2440: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T2_asi_reg_wr_113:
	mov	0x12, %r14
	.word 0xf6f38e40  ! 2443: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xba3c6079  ! 2445: XNOR_I	xnor 	%r17, 0x0079, %r29
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983a40  ! 2448: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a40, %hpstate
iob_intr_2_196:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_196), 16, 16)) -> intp(2, 0, 4)
	ta	T_CHANGE_TO_TL1
cpu_intr_2_172:
	setx	0x330017, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_173:
	setx	0x330325, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xfa14c000  ! 2458: LDUH_R	lduh	[%r19 + %r0], %r29
	.word 0xfe0ce0ef  ! 2464: LDUB_I	ldub	[%r19 + 0x00ef], %r31
	.word 0xb644e1b0  ! 2467: ADDC_I	addc 	%r19, 0x01b0, %r27
cpu_intr_2_174:
	setx	0x320239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfed58020  ! 2470: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r31
iob_intr_2_197:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_197), 16, 16)) -> intp(2, 0, e)
iob_intr_2_198:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_198), 16, 16)) -> intp(2, 0, 3c)
T2_asi_reg_wr_114:
	mov	0x38, %r14
	.word 0xf0f38e60  ! 2477: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_2_175:
	setx	0x320135, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_199:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_199), 16, 16)) -> intp(2, 0, b)
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982c12  ! 2482: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c12, %hpstate
	.word 0xfe84e0a4  ! 2485: LDUWA_I	lduwa	[%r19, + 0x00a4] %asi, %r31
cpu_intr_2_176:
	setx	0x32030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf84de007  ! 2491: LDSB_I	ldsb	[%r23 + 0x0007], %r28
T2_asi_reg_wr_115:
	mov	0x9, %r14
	.word 0xfcf384a0  ! 2494: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfcc44020  ! 2498: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r30
T2_asi_reg_wr_116:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 2499: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_2_177:
	setx	0x33000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8842183  ! 2509: LDUWA_I	lduwa	[%r16, + 0x0183] %asi, %r28
cpu_intr_2_178:
	setx	0x320120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_179:
	setx	0x310011, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_200:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_200), 16, 16)) -> intp(2, 0, 15)
	.word 0xf48d8020  ! 2514: LDUBA_R	lduba	[%r22, %r0] 0x01, %r26
	.word 0xf605a0bb  ! 2515: LDUW_I	lduw	[%r22 + 0x00bb], %r27
iob_intr_2_201:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_201), 16, 16)) -> intp(2, 0, 6)
iob_intr_2_202:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_202), 16, 16)) -> intp(2, 0, 1a)
	.word 0xfa45a156  ! 2525: LDSW_I	ldsw	[%r22 + 0x0156], %r29
	ta	T_CHANGE_TO_TL1
	.word 0xb894211b  ! 2529: ORcc_I	orcc 	%r16, 0x011b, %r28
iob_intr_2_203:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_203), 16, 16)) -> intp(2, 0, 32)
T2_asi_reg_wr_117:
	mov	0x16, %r14
	.word 0xf4f384a0  ! 2532: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_2_204:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_204), 16, 16)) -> intp(2, 0, 24)
	.word 0xbe244000  ! 2534: SUB_R	sub 	%r17, %r0, %r31
iob_intr_2_205:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_205), 16, 16)) -> intp(2, 0, 19)
	ta	T_CHANGE_TO_TL1
	.word 0xf0854020  ! 2543: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r24
	.word 0xb4ad8000  ! 2544: ANDNcc_R	andncc 	%r22, %r0, %r26
cpu_intr_2_180:
	setx	0x310207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ccc020  ! 2546: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r27
iob_intr_2_206:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_206), 16, 16)) -> intp(2, 0, 33)
	.word 0xf20d4000  ! 2551: LDUB_R	ldub	[%r21 + %r0], %r25
	ta	T_CHANGE_TO_TL1
	.word 0xf415c000  ! 2555: LDUH_R	lduh	[%r23 + %r0], %r26
iob_intr_2_207:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_207), 16, 16)) -> intp(2, 0, 10)
cpu_intr_2_181:
	setx	0x31023a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_208:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_208), 16, 16)) -> intp(2, 0, 31)
	.word 0xf85c0000  ! 2560: LDX_R	ldx	[%r16 + %r0], %r28
iob_intr_2_209:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_209), 16, 16)) -> intp(2, 0, 27)
T2_asi_reg_wr_118:
	mov	0x24, %r14
	.word 0xfcf38e60  ! 2562: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf44de1e2  ! 2563: LDSB_I	ldsb	[%r23 + 0x01e2], %r26
	.word 0xf0540000  ! 2565: LDSH_R	ldsh	[%r16 + %r0], %r24
	.word 0xf845c000  ! 2566: LDSW_R	ldsw	[%r23 + %r0], %r28
	.word 0xbec48000  ! 2567: ADDCcc_R	addccc 	%r18, %r0, %r31
cpu_intr_2_182:
	setx	0x330120, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982a1a  ! 2573: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1a, %hpstate
	.word 0xb00c6159  ! 2574: AND_I	and 	%r17, 0x0159, %r24
cpu_intr_2_183:
	setx	0x31012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb551c000  ! 2578: RDPR_TL	<illegal instruction>
	.word 0xf88561ef  ! 2579: LDUWA_I	lduwa	[%r21, + 0x01ef] %asi, %r28
iob_intr_2_210:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_210), 16, 16)) -> intp(2, 0, b)
iob_intr_2_211:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_211), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_rd_127:
	mov	0x34, %r14
	.word 0xf2db8e80  ! 2584: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf05520b6  ! 2585: LDSH_I	ldsh	[%r20 + 0x00b6], %r24
	.word 0xfa5dc000  ! 2586: LDX_R	ldx	[%r23 + %r0], %r29
iob_intr_2_212:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_212), 16, 16)) -> intp(2, 0, 9)
	.word 0xb5518000  ! 2589: RDPR_PSTATE	<illegal instruction>
iob_intr_2_213:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_213), 16, 16)) -> intp(2, 0, 37)
cpu_intr_2_184:
	setx	0x300300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf405e079  ! 2594: LDUW_I	lduw	[%r23 + 0x0079], %r26
iob_intr_2_214:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_214), 16, 16)) -> intp(2, 0, 22)
	.word 0xfc44c000  ! 2598: LDSW_R	ldsw	[%r19 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf24ce159  ! 2600: LDSB_I	ldsb	[%r19 + 0x0159], %r25
iob_intr_2_215:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_215), 16, 16)) -> intp(2, 0, 39)
	.word 0xfac50020  ! 2602: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r29
T2_asi_reg_rd_128:
	mov	0x3c4, %r14
	.word 0xfcdb89e0  ! 2603: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_2_216:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_216), 16, 16)) -> intp(2, 0, c)
	.word 0xb73db001  ! 2608: SRAX_I	srax	%r22, 0x0001, %r27
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_129:
	mov	0x29, %r14
	.word 0xf6db8400  ! 2611: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T2_asi_reg_rd_130:
	mov	0x5, %r14
	.word 0xfadb89e0  ! 2613: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xfe55e18c  ! 2615: LDSH_I	ldsh	[%r23 + 0x018c], %r31
	.word 0x8194a003  ! 2617: WRPR_TPC_I	wrpr	%r18, 0x0003, %tpc
iob_intr_2_217:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_217), 16, 16)) -> intp(2, 0, 3f)
	ta	T_CHANGE_NONHPRIV
iob_intr_2_218:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_218), 16, 16)) -> intp(2, 0, 1f)
	.word 0xfe442145  ! 2625: LDSW_I	ldsw	[%r16 + 0x0145], %r31
T2_asi_reg_wr_119:
	mov	0x3c3, %r14
	.word 0xf8f38e80  ! 2626: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_2_219:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_219), 16, 16)) -> intp(2, 0, 15)
iob_intr_2_220:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_220), 16, 16)) -> intp(2, 0, 9)
	.word 0xb60560cf  ! 2634: ADD_I	add 	%r21, 0x00cf, %r27
	.word 0xf8dce1b0  ! 2636: LDXA_I	ldxa	[%r19, + 0x01b0] %asi, %r28
	.word 0xf4c50020  ! 2638: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r26
	.word 0xf80d601a  ! 2640: LDUB_I	ldub	[%r21 + 0x001a], %r28
iob_intr_2_221:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_221), 16, 16)) -> intp(2, 0, 39)
	.word 0xf84c4000  ! 2643: LDSB_R	ldsb	[%r17 + %r0], %r28
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x8198398a  ! 2644: WRHPR_HPSTATE_I	wrhpr	%r0, 0x198a, %hpstate
	.word 0xf44d21ce  ! 2648: LDSB_I	ldsb	[%r20 + 0x01ce], %r26
	.word 0xf84c4000  ! 2649: LDSB_R	ldsb	[%r17 + %r0], %r28
	ta	T_CHANGE_TO_TL0
iob_intr_2_222:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_222), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_rd_131:
	mov	0x2d, %r14
	.word 0xf6db8e40  ! 2654: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb37c0400  ! 2655: MOVR_R	movre	%r16, %r0, %r25
T2_asi_reg_rd_132:
	mov	0x2a, %r14
	.word 0xf2db89e0  ! 2658: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T2_asi_reg_wr_120:
	mov	0x1c, %r14
	.word 0xf6f38400  ! 2659: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_2_223:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_223), 16, 16)) -> intp(2, 0, 25)
cpu_intr_2_185:
	setx	0x31002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc0de0e4  ! 2667: LDUB_I	ldub	[%r23 + 0x00e4], %r30
	.word 0xb084c000  ! 2668: ADDcc_R	addcc 	%r19, %r0, %r24
	.word 0xfc8c4020  ! 2669: LDUBA_R	lduba	[%r17, %r0] 0x01, %r30
iob_intr_2_224:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_224), 16, 16)) -> intp(2, 0, 1e)
iob_intr_2_225:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_225), 16, 16)) -> intp(2, 0, f)
T2_asi_reg_rd_133:
	mov	0x14, %r14
	.word 0xf4db89e0  ! 2677: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_2_226:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_226), 16, 16)) -> intp(2, 0, b)
	.word 0xf695a13f  ! 2681: LDUHA_I	lduha	[%r22, + 0x013f] %asi, %r27
cpu_intr_2_186:
	setx	0x30033e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_121:
	mov	0x3c4, %r14
	.word 0xf2f384a0  ! 2684: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
iob_intr_2_227:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_227), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf05c0000  ! 2693: LDX_R	ldx	[%r16 + %r0], %r24
	.word 0xfc95e16e  ! 2694: LDUHA_I	lduha	[%r23, + 0x016e] %asi, %r30
iob_intr_2_228:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_228), 16, 16)) -> intp(2, 0, 39)
cpu_intr_2_187:
	setx	0x320018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8458000  ! 2697: LDSW_R	ldsw	[%r22 + %r0], %r28
	.word 0xfa45c000  ! 2702: LDSW_R	ldsw	[%r23 + %r0], %r29
	.word 0xfc058000  ! 2703: LDUW_R	lduw	[%r22 + %r0], %r30
	.word 0xf4dc6176  ! 2704: LDXA_I	ldxa	[%r17, + 0x0176] %asi, %r26
cpu_intr_2_188:
	setx	0x33030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_229:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_229), 16, 16)) -> intp(2, 0, 8)
	ta	T_CHANGE_NONHPRIV
	.word 0xf80d20b6  ! 2715: LDUB_I	ldub	[%r20 + 0x00b6], %r28
	.word 0xf40ce0cd  ! 2716: LDUB_I	ldub	[%r19 + 0x00cd], %r26
	.word 0xf60d0000  ! 2719: LDUB_R	ldub	[%r20 + %r0], %r27
cpu_intr_2_189:
	setx	0x300332, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_230:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_230), 16, 16)) -> intp(2, 0, 4)
	.word 0xf08c61e2  ! 2725: LDUBA_I	lduba	[%r17, + 0x01e2] %asi, %r24
iob_intr_2_231:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_231), 16, 16)) -> intp(2, 0, 3d)
T2_asi_reg_wr_122:
	mov	0x3c6, %r14
	.word 0xf8f38e80  ! 2732: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf40c0000  ! 2733: LDUB_R	ldub	[%r16 + %r0], %r26
cpu_intr_2_190:
	setx	0x360022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf005212e  ! 2735: LDUW_I	lduw	[%r20 + 0x012e], %r24
cpu_intr_2_191:
	setx	0x370229, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_232:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_232), 16, 16)) -> intp(2, 0, 4)
iob_intr_2_233:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_233), 16, 16)) -> intp(2, 0, 20)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb004a14e  ! 2748: ADD_I	add 	%r18, 0x014e, %r24
	.word 0xb0a54000  ! 2749: SUBcc_R	subcc 	%r21, %r0, %r24
	.word 0xf85d0000  ! 2751: LDX_R	ldx	[%r20 + %r0], %r28
	.word 0xf8050000  ! 2753: LDUW_R	lduw	[%r20 + %r0], %r28
	.word 0xba350000  ! 2754: SUBC_R	orn 	%r20, %r0, %r29
T2_asi_reg_wr_123:
	mov	0x3c6, %r14
	.word 0xf2f38e80  ! 2755: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xfa952168  ! 2756: LDUHA_I	lduha	[%r20, + 0x0168] %asi, %r29
T2_asi_reg_wr_124:
	mov	0x34, %r14
	.word 0xf6f38e60  ! 2757: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_2_234:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_234), 16, 16)) -> intp(2, 0, 36)
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_134:
	mov	0xd, %r14
	.word 0xf0db8400  ! 2765: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf645a1ba  ! 2766: LDSW_I	ldsw	[%r22 + 0x01ba], %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7540000  ! 2771: RDPR_GL	<illegal instruction>
	.word 0xf0d54020  ! 2772: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r24
	.word 0xf6c4c020  ! 2774: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r27
	.word 0xb72c9000  ! 2775: SLLX_R	sllx	%r18, %r0, %r27
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_135:
	mov	0x1d, %r14
	.word 0xf2db8400  ! 2777: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_2_235:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_235), 16, 16)) -> intp(2, 0, 5)
	.word 0xf4158000  ! 2787: LDUH_R	lduh	[%r22 + %r0], %r26
iob_intr_2_236:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_236), 16, 16)) -> intp(2, 0, 31)
T2_asi_reg_rd_136:
	mov	0x3c0, %r14
	.word 0xfadb8e80  ! 2790: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T2_asi_reg_rd_137:
	mov	0x3c8, %r14
	.word 0xfcdb8e40  ! 2791: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb37d8400  ! 2792: MOVR_R	movre	%r22, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_237:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_237), 16, 16)) -> intp(2, 0, 11)
	.word 0xa1902000  ! 2797: WRPR_GL_I	wrpr	%r0, 0x0000, %-
T2_asi_reg_rd_138:
	mov	0x33, %r14
	.word 0xf2db8e40  ! 2798: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_rd_139:
	mov	0x18, %r14
	.word 0xf4db8e80  ! 2799: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T2_asi_reg_wr_125:
	mov	0x3c6, %r14
	.word 0xfaf38e80  ! 2800: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf65de1a7  ! 2803: LDX_I	ldx	[%r23 + 0x01a7], %r27
	.word 0xf85c8000  ! 2807: LDX_R	ldx	[%r18 + %r0], %r28
	.word 0xb6358000  ! 2810: SUBC_R	orn 	%r22, %r0, %r27
T2_asi_reg_rd_140:
	mov	0xe, %r14
	.word 0xf6db8e60  ! 2811: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982e82  ! 2815: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e82, %hpstate
	.word 0xf45c2187  ! 2817: LDX_I	ldx	[%r16 + 0x0187], %r26
T2_asi_reg_rd_141:
	mov	0x33, %r14
	.word 0xfadb8e40  ! 2818: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_TO_TL1
cpu_intr_2_192:
	setx	0x370027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_193:
	setx	0x340123, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_238:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_238), 16, 16)) -> intp(2, 0, 27)
cpu_intr_2_194:
	setx	0x370130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4158000  ! 2833: LDUH_R	lduh	[%r22 + %r0], %r26
T2_asi_reg_wr_126:
	mov	0x3c8, %r14
	.word 0xfef38400  ! 2835: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xfcd44020  ! 2836: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r30
iob_intr_2_239:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_239), 16, 16)) -> intp(2, 0, 9)
	.word 0xfa95e0d2  ! 2839: LDUHA_I	lduha	[%r23, + 0x00d2] %asi, %r29
	.word 0xfc04a1b5  ! 2840: LDUW_I	lduw	[%r18 + 0x01b5], %r30
iob_intr_2_240:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_240), 16, 16)) -> intp(2, 0, 35)
	.word 0xb4950000  ! 2844: ORcc_R	orcc 	%r20, %r0, %r26
T2_asi_reg_wr_127:
	mov	0x3c6, %r14
	.word 0xf0f38400  ! 2849: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xfa544000  ! 2850: LDSH_R	ldsh	[%r17 + %r0], %r29
T2_asi_reg_wr_128:
	mov	0x2a, %r14
	.word 0xf6f38e60  ! 2851: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T2_asi_reg_wr_129:
	mov	0x3c4, %r14
	.word 0xf4f384a0  ! 2852: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb9518000  ! 2855: RDPR_PSTATE	<illegal instruction>
	.word 0xf204e17d  ! 2856: LDUW_I	lduw	[%r19 + 0x017d], %r25
T2_asi_reg_wr_130:
	mov	0x2f, %r14
	.word 0xf2f38e80  ! 2859: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb02ce0a6  ! 2862: ANDN_I	andn 	%r19, 0x00a6, %r24
	.word 0xf454c000  ! 2863: LDSH_R	ldsh	[%r19 + %r0], %r26
	.word 0x8394a096  ! 2864: WRPR_TNPC_I	wrpr	%r18, 0x0096, %tnpc
T2_asi_reg_rd_142:
	mov	0x0, %r14
	.word 0xf6db8e40  ! 2865: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_rd_143:
	mov	0x3c6, %r14
	.word 0xfedb89e0  ! 2866: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf6148000  ! 2870: LDUH_R	lduh	[%r18 + %r0], %r27
cpu_intr_2_195:
	setx	0x360306, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf6d56053  ! 2878: LDSHA_I	ldsha	[%r21, + 0x0053] %asi, %r27
	.word 0xfa04c000  ! 2879: LDUW_R	lduw	[%r19 + %r0], %r29
	ta	T_CHANGE_TO_TL1
	.word 0xfe4560d7  ! 2886: LDSW_I	ldsw	[%r21 + 0x00d7], %r31
	.word 0xf28d8020  ! 2887: LDUBA_R	lduba	[%r22, %r0] 0x01, %r25
cpu_intr_2_196:
	setx	0x36022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9348000  ! 2889: SRL_R	srl 	%r18, %r0, %r28
iob_intr_2_241:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_241), 16, 16)) -> intp(2, 0, f)
	.word 0xfe8d2018  ! 2892: LDUBA_I	lduba	[%r20, + 0x0018] %asi, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf845c000  ! 2894: LDSW_R	ldsw	[%r23 + %r0], %r28
	ta	T_CHANGE_TO_TL0
cpu_intr_2_197:
	setx	0x340219, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_198:
	setx	0x35001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf08dc020  ! 2900: LDUBA_R	lduba	[%r23, %r0] 0x01, %r24
	.word 0xf4454000  ! 2903: LDSW_R	ldsw	[%r21 + %r0], %r26
iob_intr_2_242:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_242), 16, 16)) -> intp(2, 0, 26)
	.word 0xf4d5203f  ! 2906: LDSHA_I	ldsha	[%r20, + 0x003f] %asi, %r26
cpu_intr_2_199:
	setx	0x340120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0c4207e  ! 2911: LDSWA_I	ldswa	[%r16, + 0x007e] %asi, %r24
T2_asi_reg_rd_144:
	mov	0x8, %r14
	.word 0xf4db84a0  ! 2912: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbd2d6001  ! 2914: SLL_I	sll 	%r21, 0x0001, %r30
iob_intr_2_243:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_243), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf4d5a05c  ! 2916: LDSHA_I	ldsha	[%r22, + 0x005c] %asi, %r26
	.word 0xb21d4000  ! 2917: XOR_R	xor 	%r21, %r0, %r25
iob_intr_2_244:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_244), 16, 16)) -> intp(2, 0, 1a)
iob_intr_2_245:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_245), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf2848020  ! 2928: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf0950020  ! 2934: LDUHA_R	lduha	[%r20, %r0] 0x01, %r24
T2_asi_reg_rd_145:
	mov	0x2b, %r14
	.word 0xf8db89e0  ! 2935: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T2_asi_reg_wr_131:
	mov	0x3c7, %r14
	.word 0xf2f38e80  ! 2937: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf44dc000  ! 2938: LDSB_R	ldsb	[%r23 + %r0], %r26
iob_intr_2_246:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_246), 16, 16)) -> intp(2, 0, 1e)
iob_intr_2_247:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_247), 16, 16)) -> intp(2, 0, 2)
iob_intr_2_248:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_248), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf45521c3  ! 2942: LDSH_I	ldsh	[%r20 + 0x01c3], %r26
	.word 0x879461f7  ! 2945: WRPR_TT_I	wrpr	%r17, 0x01f7, %tt
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf8c40020  ! 2953: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r28
	.word 0xbeb56032  ! 2954: SUBCcc_I	orncc 	%r21, 0x0032, %r31
	.word 0xbe15c000  ! 2955: OR_R	or 	%r23, %r0, %r31
	.word 0xfa04a096  ! 2956: LDUW_I	lduw	[%r18 + 0x0096], %r29
iob_intr_2_249:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_249), 16, 16)) -> intp(2, 0, e)
	.word 0xfc15602a  ! 2958: LDUH_I	lduh	[%r21 + 0x002a], %r30
	.word 0xf8042011  ! 2959: LDUW_I	lduw	[%r16 + 0x0011], %r28
	.word 0xf215c000  ! 2961: LDUH_R	lduh	[%r23 + %r0], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_200:
	setx	0x370103, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_250:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_250), 16, 16)) -> intp(2, 0, 18)
	.word 0xf6940020  ! 2968: LDUHA_R	lduha	[%r16, %r0] 0x01, %r27
cpu_intr_2_201:
	setx	0x360129, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983e5a  ! 2972: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e5a, %hpstate
cpu_intr_2_202:
	setx	0x35030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb535e001  ! 2978: SRL_I	srl 	%r23, 0x0001, %r26
cpu_intr_2_203:
	setx	0x36032e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_146:
	mov	0x3c3, %r14
	.word 0xfedb8e60  ! 2980: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf4154000  ! 2983: LDUH_R	lduh	[%r21 + %r0], %r26
iob_intr_2_251:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_251), 16, 16)) -> intp(2, 0, 24)
T2_asi_reg_wr_132:
	mov	0xa, %r14
	.word 0xf4f389e0  ! 2986: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbcc54000  ! 2992: ADDCcc_R	addccc 	%r21, %r0, %r30
	.word 0xfe8de1d2  ! 2993: LDUBA_I	lduba	[%r23, + 0x01d2] %asi, %r31
T2_asi_reg_wr_133:
	mov	0x3c6, %r14
	.word 0xf4f38e40  ! 2995: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf8958020  ! 2996: LDUHA_R	lduha	[%r22, %r0] 0x01, %r28
cpu_intr_2_204:
	setx	0x360101, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_252:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_252), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_rd_147:
	mov	0x3c0, %r14
	.word 0xfadb89e0  ! 3001: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_2_205:
	setx	0x350313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec58020  ! 3004: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r31
cpu_intr_2_206:
	setx	0x34012d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_253:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_253), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_wr_134:
	mov	0x2e, %r14
	.word 0xfef38e60  ! 3011: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_135:
	mov	0x18, %r14
	.word 0xf4f389e0  ! 3016: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL0
	.word 0xb42d2085  ! 3028: ANDN_I	andn 	%r20, 0x0085, %r26
	.word 0xf21521b0  ! 3030: LDUH_I	lduh	[%r20 + 0x01b0], %r25
iob_intr_2_254:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_254), 16, 16)) -> intp(2, 0, 4)
	ta	T_CHANGE_NONHPRIV
iob_intr_2_255:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_255), 16, 16)) -> intp(2, 0, 3f)
	.word 0xfa15e1de  ! 3039: LDUH_I	lduh	[%r23 + 0x01de], %r29
	.word 0xf4554000  ! 3040: LDSH_R	ldsh	[%r21 + %r0], %r26
	.word 0xb205c000  ! 3043: ADD_R	add 	%r23, %r0, %r25
	.word 0xfa0d205f  ! 3048: LDUB_I	ldub	[%r20 + 0x005f], %r29
	.word 0xb41d60c6  ! 3050: XOR_I	xor 	%r21, 0x00c6, %r26
cpu_intr_2_207:
	setx	0x350034, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982f80  ! 3053: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f80, %hpstate
iob_intr_2_256:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_256), 16, 16)) -> intp(2, 0, f)
iob_intr_2_257:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_257), 16, 16)) -> intp(2, 0, 14)
T2_asi_reg_rd_148:
	mov	0x36, %r14
	.word 0xf8db8e40  ! 3066: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbea58000  ! 3067: SUBcc_R	subcc 	%r22, %r0, %r31
T2_asi_reg_wr_136:
	mov	0x1f, %r14
	.word 0xfef389e0  ! 3068: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T2_asi_reg_rd_149:
	mov	0x3c6, %r14
	.word 0xfcdb89e0  ! 3071: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T2_asi_reg_rd_150:
	mov	0x3c7, %r14
	.word 0xf6db8e60  ! 3073: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_2_208:
	setx	0x37030f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_137:
	mov	0x3c6, %r14
	.word 0xf8f38400  ! 3075: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xfcdde1e3  ! 3076: LDXA_I	ldxa	[%r23, + 0x01e3] %asi, %r30
	.word 0xb43de155  ! 3077: XNOR_I	xnor 	%r23, 0x0155, %r26
	.word 0xf45cc000  ! 3078: LDX_R	ldx	[%r19 + %r0], %r26
	.word 0xf4d4e109  ! 3079: LDSHA_I	ldsha	[%r19, + 0x0109] %asi, %r26
iob_intr_2_258:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_258), 16, 16)) -> intp(2, 0, 2d)
	.word 0xbc146129  ! 3083: OR_I	or 	%r17, 0x0129, %r30
T2_asi_reg_wr_138:
	mov	0x18, %r14
	.word 0xf6f389e0  ! 3085: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_2_259:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_259), 16, 16)) -> intp(2, 0, 12)
	.word 0xfc5de19b  ! 3088: LDX_I	ldx	[%r23 + 0x019b], %r30
	.word 0xfc454000  ! 3089: LDSW_R	ldsw	[%r21 + %r0], %r30
cpu_intr_2_209:
	setx	0x37011d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_210:
	setx	0x36031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_260:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_260), 16, 16)) -> intp(2, 0, 1)
	.word 0xf40d8000  ! 3098: LDUB_R	ldub	[%r22 + %r0], %r26
T2_asi_reg_wr_139:
	mov	0x6, %r14
	.word 0xfcf384a0  ! 3099: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf2444000  ! 3100: LDSW_R	ldsw	[%r17 + %r0], %r25
T2_asi_reg_wr_140:
	mov	0x36, %r14
	.word 0xf6f38400  ! 3102: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xfc4c4000  ! 3106: LDSB_R	ldsb	[%r17 + %r0], %r30
iob_intr_2_261:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_261), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf6d4617e  ! 3110: LDSHA_I	ldsha	[%r17, + 0x017e] %asi, %r27
	.word 0xfc55e084  ! 3113: LDSH_I	ldsh	[%r23 + 0x0084], %r30
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_141:
	mov	0x1, %r14
	.word 0xf4f38e40  ! 3117: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_211:
	setx	0x370216, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_212:
	setx	0x350113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf00d8000  ! 3123: LDUB_R	ldub	[%r22 + %r0], %r24
	.word 0xfc8c8020  ! 3124: LDUBA_R	lduba	[%r18, %r0] 0x01, %r30
	.word 0xf25c21b7  ! 3126: LDX_I	ldx	[%r16 + 0x01b7], %r25
T2_asi_reg_wr_142:
	mov	0x3c1, %r14
	.word 0xf4f38e40  ! 3130: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_wr_143:
	mov	0x16, %r14
	.word 0xf8f38e40  ! 3131: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_wr_144:
	mov	0x2e, %r14
	.word 0xf8f38e60  ! 3132: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf804e0fa  ! 3133: LDUW_I	lduw	[%r19 + 0x00fa], %r28
T2_asi_reg_wr_145:
	mov	0x27, %r14
	.word 0xf0f38e40  ! 3138: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_wr_146:
	mov	0x1d, %r14
	.word 0xf2f384a0  ! 3144: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982dda  ! 3146: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dda, %hpstate
T2_asi_reg_rd_151:
	mov	0x24, %r14
	.word 0xf4db8e60  ! 3147: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xfcc4c020  ! 3151: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r30
T2_asi_reg_rd_152:
	mov	0x37, %r14
	.word 0xfcdb8e40  ! 3152: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982b42  ! 3155: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b42, %hpstate
iob_intr_2_262:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_262), 16, 16)) -> intp(2, 0, 20)
	.word 0xb37cc400  ! 3157: MOVR_R	movre	%r19, %r0, %r25
	.word 0xb8b50000  ! 3158: SUBCcc_R	orncc 	%r20, %r0, %r28
iob_intr_2_263:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_263), 16, 16)) -> intp(2, 0, b)
T2_asi_reg_wr_147:
	mov	0x9, %r14
	.word 0xf6f38e80  ! 3162: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xfc8c2126  ! 3165: LDUBA_I	lduba	[%r16, + 0x0126] %asi, %r30
T2_asi_reg_wr_148:
	mov	0x15, %r14
	.word 0xf2f38e60  ! 3166: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf6846153  ! 3169: LDUWA_I	lduwa	[%r17, + 0x0153] %asi, %r27
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_149:
	mov	0x1, %r14
	.word 0xf8f384a0  ! 3176: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf8cc0020  ! 3179: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r28
cpu_intr_2_213:
	setx	0x350023, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_264:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_264), 16, 16)) -> intp(2, 0, 3c)
iob_intr_2_265:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_265), 16, 16)) -> intp(2, 0, 1d)
T2_asi_reg_rd_153:
	mov	0x3c0, %r14
	.word 0xfadb8e40  ! 3187: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_wr_150:
	mov	0x1b, %r14
	.word 0xf2f38e40  ! 3189: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_266:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_266), 16, 16)) -> intp(2, 0, 36)
cpu_intr_2_214:
	setx	0x2e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_267:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_267), 16, 16)) -> intp(2, 0, f)
	.word 0xf6154000  ! 3193: LDUH_R	lduh	[%r21 + %r0], %r27
	.word 0xf8c521f9  ! 3194: LDSWA_I	ldswa	[%r20, + 0x01f9] %asi, %r28
	.word 0xf60c0000  ! 3195: LDUB_R	ldub	[%r16 + %r0], %r27
cpu_intr_2_215:
	setx	0x3b002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8395e08e  ! 3199: WRPR_TNPC_I	wrpr	%r23, 0x008e, %tnpc
	.word 0xfc8521a9  ! 3201: LDUWA_I	lduwa	[%r20, + 0x01a9] %asi, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_268:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_268), 16, 16)) -> intp(2, 0, 7)
	.word 0xf0558000  ! 3208: LDSH_R	ldsh	[%r22 + %r0], %r24
	.word 0xfe8d60c7  ! 3210: LDUBA_I	lduba	[%r21, + 0x00c7] %asi, %r31
cpu_intr_2_216:
	setx	0x39000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2ac8000  ! 3214: ANDNcc_R	andncc 	%r18, %r0, %r25
T2_asi_reg_wr_151:
	mov	0xd, %r14
	.word 0xf0f38e40  ! 3216: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	.word 0xf6dde121  ! 3220: LDXA_I	ldxa	[%r23, + 0x0121] %asi, %r27
cpu_intr_2_217:
	setx	0x39032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9194e012  ! 3225: WRPR_PIL_I	wrpr	%r19, 0x0012, %pil
	.word 0xb8b44000  ! 3228: ORNcc_R	orncc 	%r17, %r0, %r28
T2_asi_reg_wr_152:
	mov	0x23, %r14
	.word 0xfcf38e40  ! 3229: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf2550000  ! 3232: LDSH_R	ldsh	[%r20 + %r0], %r25
T2_asi_reg_wr_153:
	mov	0x26, %r14
	.word 0xfef384a0  ! 3234: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_wr_154:
	mov	0xc, %r14
	.word 0xfcf389e0  ! 3239: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0x819560d0  ! 3240: WRPR_TPC_I	wrpr	%r21, 0x00d0, %tpc
	.word 0xfec46039  ! 3242: LDSWA_I	ldswa	[%r17, + 0x0039] %asi, %r31
T2_asi_reg_wr_155:
	mov	0x1a, %r14
	.word 0xf0f38e40  ! 3243: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb48ca186  ! 3246: ANDcc_I	andcc 	%r18, 0x0186, %r26
	.word 0xb7641800  ! 3251: MOVcc_R	<illegal instruction>
	.word 0xfc850020  ! 3257: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r30
T2_asi_reg_wr_156:
	mov	0x2d, %r14
	.word 0xf6f38e40  ! 3259: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf604215c  ! 3260: LDUW_I	lduw	[%r16 + 0x015c], %r27
	.word 0xbd344000  ! 3261: SRL_R	srl 	%r17, %r0, %r30
T2_asi_reg_wr_157:
	mov	0x23, %r14
	.word 0xf2f384a0  ! 3262: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf2550000  ! 3263: LDSH_R	ldsh	[%r20 + %r0], %r25
T2_asi_reg_wr_158:
	mov	0x3c5, %r14
	.word 0xfcf38e40  ! 3264: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
	.word 0xb6ace155  ! 3266: ANDNcc_I	andncc 	%r19, 0x0155, %r27
iob_intr_2_269:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_269), 16, 16)) -> intp(2, 0, 2e)
cpu_intr_2_218:
	setx	0x390219, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_154:
	mov	0x29, %r14
	.word 0xf4db84a0  ! 3277: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf0052134  ! 3278: LDUW_I	lduw	[%r20 + 0x0134], %r24
	.word 0xf24c8000  ! 3279: LDSB_R	ldsb	[%r18 + %r0], %r25
iob_intr_2_270:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_270), 16, 16)) -> intp(2, 0, 8)
iob_intr_2_271:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_271), 16, 16)) -> intp(2, 0, d)
cpu_intr_2_219:
	setx	0x3a0221, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_272:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_272), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf84d4000  ! 3288: LDSB_R	ldsb	[%r21 + %r0], %r28
	.word 0xbd3cf001  ! 3289: SRAX_I	srax	%r19, 0x0001, %r30
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_159:
	mov	0x1e, %r14
	.word 0xfcf38400  ! 3295: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_2_273:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_273), 16, 16)) -> intp(2, 0, 27)
T2_asi_reg_rd_155:
	mov	0x24, %r14
	.word 0xfadb89e0  ! 3304: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xfc0ca158  ! 3305: LDUB_I	ldub	[%r18 + 0x0158], %r30
	ta	T_CHANGE_HPRIV
	.word 0xf60cc000  ! 3309: LDUB_R	ldub	[%r19 + %r0], %r27
	.word 0xfe95c020  ! 3310: LDUHA_R	lduha	[%r23, %r0] 0x01, %r31
iob_intr_2_274:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_274), 16, 16)) -> intp(2, 0, 1b)
	.word 0xfc0c61dc  ! 3314: LDUB_I	ldub	[%r17 + 0x01dc], %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_275:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_275), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf615607f  ! 3320: LDUH_I	lduh	[%r21 + 0x007f], %r27
iob_intr_2_276:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_276), 16, 16)) -> intp(2, 0, 1d)
T2_asi_reg_wr_160:
	mov	0x17, %r14
	.word 0xfef384a0  ! 3325: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb0354000  ! 3326: SUBC_R	orn 	%r21, %r0, %r24
iob_intr_2_277:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_277), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_220:
	setx	0x3a013e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_221:
	setx	0x380209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2140000  ! 3332: LDUH_R	lduh	[%r16 + %r0], %r25
	.word 0xb151c000  ! 3334: RDPR_TL	rdpr	%tl, %r24
T2_asi_reg_rd_156:
	mov	0x3c7, %r14
	.word 0xfcdb8e40  ! 3338: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf804a1ec  ! 3339: LDUW_I	lduw	[%r18 + 0x01ec], %r28
T2_asi_reg_wr_161:
	mov	0x2f, %r14
	.word 0xfcf38e40  ! 3340: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_2_278:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_278), 16, 16)) -> intp(2, 0, 1b)
T2_asi_reg_rd_157:
	mov	0x3c0, %r14
	.word 0xf0db89e0  ! 3342: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T2_asi_reg_wr_162:
	mov	0x3c4, %r14
	.word 0xfef38e60  ! 3345: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf0d420ed  ! 3346: LDSHA_I	ldsha	[%r16, + 0x00ed] %asi, %r24
cpu_intr_2_222:
	setx	0x38033f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_223:
	setx	0x3b0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf644215b  ! 3351: LDSW_I	ldsw	[%r16 + 0x015b], %r27
T2_asi_reg_rd_158:
	mov	0x3c4, %r14
	.word 0xfedb84a0  ! 3359: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf0c50020  ! 3360: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r24
cpu_intr_2_224:
	setx	0x3a022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_2_225:
	setx	0x390313, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_163:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 3369: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfcd50020  ! 3375: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r30
iob_intr_2_279:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_279), 16, 16)) -> intp(2, 0, 8)
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_164:
	mov	0x3c5, %r14
	.word 0xfcf384a0  ! 3383: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T2_asi_reg_rd_159:
	mov	0x3c7, %r14
	.word 0xfedb84a0  ! 3384: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_2_280:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_280), 16, 16)) -> intp(2, 0, 38)
cpu_intr_2_226:
	setx	0x390116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb09c60b2  ! 3389: XORcc_I	xorcc 	%r17, 0x00b2, %r24
	.word 0xb6b40000  ! 3391: ORNcc_R	orncc 	%r16, %r0, %r27
cpu_intr_2_227:
	setx	0x390235, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_160:
	mov	0x8, %r14
	.word 0xf2db8e40  ! 3402: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_2_281:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_281), 16, 16)) -> intp(2, 0, a)
	.word 0x8195a0d7  ! 3404: WRPR_TPC_I	wrpr	%r22, 0x00d7, %tpc
	.word 0xfed44020  ! 3405: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r31
T2_asi_reg_wr_165:
	mov	0x3c5, %r14
	.word 0xf0f389e0  ! 3406: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_2_228:
	setx	0x390125, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_282:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_282), 16, 16)) -> intp(2, 0, 25)
	.word 0xf24d6157  ! 3414: LDSB_I	ldsb	[%r21 + 0x0157], %r25
	.word 0xfc5dc000  ! 3415: LDX_R	ldx	[%r23 + %r0], %r30
	ta	T_CHANGE_TO_TL0
iob_intr_2_283:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_283), 16, 16)) -> intp(2, 0, 13)
	.word 0xfc14e119  ! 3422: LDUH_I	lduh	[%r19 + 0x0119], %r30
T2_asi_reg_rd_161:
	mov	0x3c7, %r14
	.word 0xfcdb8e60  ! 3424: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf24dc000  ! 3425: LDSB_R	ldsb	[%r23 + %r0], %r25
	.word 0xfc54210d  ! 3426: LDSH_I	ldsh	[%r16 + 0x010d], %r30
	.word 0xfe0d212a  ! 3428: LDUB_I	ldub	[%r20 + 0x012a], %r31
cpu_intr_2_229:
	setx	0x38030c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_284:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_284), 16, 16)) -> intp(2, 0, 16)
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf85560c6  ! 3443: LDSH_I	ldsh	[%r21 + 0x00c6], %r28
cpu_intr_2_230:
	setx	0x390001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa848020  ! 3447: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r29
T2_asi_reg_rd_162:
	mov	0x3c1, %r14
	.word 0xf6db84a0  ! 3448: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xfacd2068  ! 3451: LDSBA_I	ldsba	[%r20, + 0x0068] %asi, %r29
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982fc8  ! 3452: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc8, %hpstate
iob_intr_2_285:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_285), 16, 16)) -> intp(2, 0, 38)
T2_asi_reg_rd_163:
	mov	0x1d, %r14
	.word 0xf0db84a0  ! 3460: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_2_231:
	setx	0x390217, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_166:
	mov	0x20, %r14
	.word 0xf8f38e60  ! 3463: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_2_286:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_286), 16, 16)) -> intp(2, 0, 26)
iob_intr_2_287:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_287), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf6dc2134  ! 3470: LDXA_I	ldxa	[%r16, + 0x0134] %asi, %r27
	.word 0xfe054000  ! 3472: LDUW_R	lduw	[%r21 + %r0], %r31
	.word 0xf015c000  ! 3473: LDUH_R	lduh	[%r23 + %r0], %r24
iob_intr_2_288:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_288), 16, 16)) -> intp(2, 0, 13)
T2_asi_reg_rd_164:
	mov	0x26, %r14
	.word 0xf2db84a0  ! 3478: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_2_232:
	setx	0x3b020b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_167:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 3480: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf8158000  ! 3482: LDUH_R	lduh	[%r22 + %r0], %r28
	.word 0xf0154000  ! 3483: LDUH_R	lduh	[%r21 + %r0], %r24
iob_intr_2_289:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_289), 16, 16)) -> intp(2, 0, 33)
iob_intr_2_290:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_290), 16, 16)) -> intp(2, 0, a)
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982d1a  ! 3489: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d1a, %hpstate
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983810  ! 3490: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1810, %hpstate
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_233:
	setx	0x3b0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2a4c000  ! 3498: SUBcc_R	subcc 	%r19, %r0, %r25
	.word 0x8f902001  ! 3499: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xbb2c5000  ! 3500: SLLX_R	sllx	%r17, %r0, %r29
iob_intr_2_291:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_291), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf80dc000  ! 3503: LDUB_R	ldub	[%r23 + %r0], %r28
	.word 0xbe15619a  ! 3506: OR_I	or 	%r21, 0x019a, %r31
	.word 0xfacc217f  ! 3507: LDSBA_I	ldsba	[%r16, + 0x017f] %asi, %r29
	.word 0xbb34a001  ! 3508: SRL_I	srl 	%r18, 0x0001, %r29
	.word 0xb6158000  ! 3509: OR_R	or 	%r22, %r0, %r27
	.word 0xfa950020  ! 3510: LDUHA_R	lduha	[%r20, %r0] 0x01, %r29
	.word 0xbd34a001  ! 3512: SRL_I	srl 	%r18, 0x0001, %r30
T2_asi_reg_rd_165:
	mov	0x3c2, %r14
	.word 0xfedb8e80  ! 3517: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_2_234:
	setx	0x3a0132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf01420b1  ! 3519: LDUH_I	lduh	[%r16 + 0x00b1], %r24
	.word 0xfccc4020  ! 3522: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r30
	.word 0xf254c000  ! 3523: LDSH_R	ldsh	[%r19 + %r0], %r25
	.word 0xfe4c0000  ! 3525: LDSB_R	ldsb	[%r16 + %r0], %r31
	.word 0xb824c000  ! 3528: SUB_R	sub 	%r19, %r0, %r28
iob_intr_2_292:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_292), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_wr_168:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 3539: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb9643801  ! 3540: MOVcc_I	<illegal instruction>
	.word 0xfa54a17d  ! 3541: LDSH_I	ldsh	[%r18 + 0x017d], %r29
	.word 0xf68d0020  ! 3543: LDUBA_R	lduba	[%r20, %r0] 0x01, %r27
	.word 0xb434a0a5  ! 3544: SUBC_I	orn 	%r18, 0x00a5, %r26
T2_asi_reg_wr_169:
	mov	0x31, %r14
	.word 0xf4f38400  ! 3546: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_2_293:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_293), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_235:
	setx	0x39011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc44a059  ! 3549: LDSW_I	ldsw	[%r18 + 0x0059], %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_166:
	mov	0x19, %r14
	.word 0xfcdb84a0  ! 3557: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf20c0000  ! 3559: LDUB_R	ldub	[%r16 + %r0], %r25
	.word 0xf4ccc020  ! 3562: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r26
	.word 0xf495208f  ! 3563: LDUHA_I	lduha	[%r20, + 0x008f] %asi, %r26
	.word 0xf28ce1e7  ! 3564: LDUBA_I	lduba	[%r19, + 0x01e7] %asi, %r25
T2_asi_reg_wr_170:
	mov	0x4, %r14
	.word 0xf6f38e80  ! 3567: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_2_236:
	setx	0x390226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_237:
	setx	0x3a031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3340000  ! 3571: SRL_R	srl 	%r16, %r0, %r25
iob_intr_2_294:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_294), 16, 16)) -> intp(2, 0, 21)
cpu_intr_2_238:
	setx	0x38011c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_295:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_295), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_rd_167:
	mov	0x26, %r14
	.word 0xfedb8e80  ! 3579: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982e10  ! 3581: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e10, %hpstate
iob_intr_2_296:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_296), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf8844020  ! 3584: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r28
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_171:
	mov	0x3, %r14
	.word 0xf0f384a0  ! 3589: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf64c8000  ! 3591: LDSB_R	ldsb	[%r18 + %r0], %r27
T2_asi_reg_wr_172:
	mov	0x3c8, %r14
	.word 0xfef38e40  ! 3592: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_rd_168:
	mov	0x3c1, %r14
	.word 0xf8db8e40  ! 3598: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_2_297:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_297), 16, 16)) -> intp(2, 0, e)
T2_asi_reg_wr_173:
	mov	0x2f, %r14
	.word 0xf6f38e40  ! 3606: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf405c000  ! 3611: LDUW_R	lduw	[%r23 + %r0], %r26
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x8198394a  ! 3613: WRHPR_HPSTATE_I	wrhpr	%r0, 0x194a, %hpstate
	.word 0xbe044000  ! 3616: ADD_R	add 	%r17, %r0, %r31
	.word 0xfa84a1ab  ! 3617: LDUWA_I	lduwa	[%r18, + 0x01ab] %asi, %r29
	.word 0xf494216f  ! 3623: LDUHA_I	lduha	[%r16, + 0x016f] %asi, %r26
	.word 0xfacca02a  ! 3625: LDSBA_I	ldsba	[%r18, + 0x002a] %asi, %r29
cpu_intr_2_239:
	setx	0x38003a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_174:
	mov	0x16, %r14
	.word 0xfef38400  ! 3637: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T2_asi_reg_wr_175:
	mov	0xd, %r14
	.word 0xf4f38e80  ! 3639: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_2_298:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_298), 16, 16)) -> intp(2, 0, 10)
iob_intr_2_299:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_299), 16, 16)) -> intp(2, 0, 3d)
T2_asi_reg_wr_176:
	mov	0xf, %r14
	.word 0xf2f38400  ! 3648: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbd643801  ! 3649: MOVcc_I	<illegal instruction>
	.word 0xf845a034  ! 3651: LDSW_I	ldsw	[%r22 + 0x0034], %r28
	.word 0xf28d8020  ! 3652: LDUBA_R	lduba	[%r22, %r0] 0x01, %r25
cpu_intr_2_240:
	setx	0x3d0138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45d0000  ! 3656: LDX_R	ldx	[%r20 + %r0], %r26
	.word 0xfc5c0000  ! 3657: LDX_R	ldx	[%r16 + %r0], %r30
cpu_intr_2_241:
	setx	0x3c020b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_300:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_300), 16, 16)) -> intp(2, 0, 3a)
T2_asi_reg_wr_177:
	mov	0x4, %r14
	.word 0xf4f389e0  ! 3662: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb23dc000  ! 3663: XNOR_R	xnor 	%r23, %r0, %r25
	.word 0xfa442015  ! 3664: LDSW_I	ldsw	[%r16 + 0x0015], %r29
cpu_intr_2_242:
	setx	0x3e0118, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_178:
	mov	0x3c4, %r14
	.word 0xf8f389e0  ! 3669: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_2_301:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_301), 16, 16)) -> intp(2, 0, 19)
	.word 0xfc0cc000  ! 3675: LDUB_R	ldub	[%r19 + %r0], %r30
iob_intr_2_302:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_302), 16, 16)) -> intp(2, 0, 31)
	.word 0xf8454000  ! 3678: LDSW_R	ldsw	[%r21 + %r0], %r28
	.word 0xfe5da1da  ! 3687: LDX_I	ldx	[%r22 + 0x01da], %r31
iob_intr_2_303:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_303), 16, 16)) -> intp(2, 0, 3a)
T2_asi_reg_rd_169:
	mov	0x2f, %r14
	.word 0xf6db8400  ! 3695: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_2_243:
	setx	0x3f0032, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_170:
	mov	0x4, %r14
	.word 0xfadb8e40  ! 3698: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_rd_171:
	mov	0x35, %r14
	.word 0xf0db8400  ! 3702: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T2_asi_reg_wr_179:
	mov	0x2d, %r14
	.word 0xf8f389e0  ! 3703: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_2_244:
	setx	0x3e0330, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_245:
	setx	0x3e0310, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_172:
	mov	0x22, %r14
	.word 0xfedb8e40  ! 3711: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	ta	T_CHANGE_HPRIV
iob_intr_2_304:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_304), 16, 16)) -> intp(2, 0, f)
	.word 0xf0d48020  ! 3715: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r24
	.word 0xfad44020  ! 3716: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r29
	.word 0xfa148000  ! 3717: LDUH_R	lduh	[%r18 + %r0], %r29
cpu_intr_2_246:
	setx	0x3c0105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05d6057  ! 3721: LDX_I	ldx	[%r21 + 0x0057], %r24
iob_intr_2_305:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_305), 16, 16)) -> intp(2, 0, 22)
	.word 0xfc4c8000  ! 3727: LDSB_R	ldsb	[%r18 + %r0], %r30
	ta	T_CHANGE_TO_TL0
iob_intr_2_306:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_306), 16, 16)) -> intp(2, 0, 8)
cpu_intr_2_247:
	setx	0x3d0207, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf6c460b0  ! 3738: LDSWA_I	ldswa	[%r17, + 0x00b0] %asi, %r27
	.word 0xfe8da07f  ! 3739: LDUBA_I	lduba	[%r22, + 0x007f] %asi, %r31
cpu_intr_2_248:
	setx	0x3d0332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2dc208b  ! 3745: LDXA_I	ldxa	[%r16, + 0x008b] %asi, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf48c4020  ! 3749: LDUBA_R	lduba	[%r17, %r0] 0x01, %r26
cpu_intr_2_249:
	setx	0x3d0338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba2da02e  ! 3751: ANDN_I	andn 	%r22, 0x002e, %r29
iob_intr_2_307:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_307), 16, 16)) -> intp(2, 0, 10)
	.word 0xf2c42061  ! 3753: LDSWA_I	ldswa	[%r16, + 0x0061] %asi, %r25
	.word 0xfe55c000  ! 3757: LDSH_R	ldsh	[%r23 + %r0], %r31
	.word 0xf4942079  ! 3762: LDUHA_I	lduha	[%r16, + 0x0079] %asi, %r26
	.word 0xbb7d8400  ! 3763: MOVR_R	movre	%r22, %r0, %r29
	.word 0xf0cc0020  ! 3772: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r24
	.word 0xfe1560a5  ! 3781: LDUH_I	lduh	[%r21 + 0x00a5], %r31
T2_asi_reg_wr_180:
	mov	0x22, %r14
	.word 0xf2f384a0  ! 3783: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_2_308:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_308), 16, 16)) -> intp(2, 0, 11)
	.word 0xf2452103  ! 3786: LDSW_I	ldsw	[%r20 + 0x0103], %r25
T2_asi_reg_rd_173:
	mov	0x2e, %r14
	.word 0xf8db8e80  ! 3788: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_2_309:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_309), 16, 16)) -> intp(2, 0, a)
cpu_intr_2_250:
	setx	0x3d0137, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_251:
	setx	0x3e010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe348000  ! 3796: SUBC_R	orn 	%r18, %r0, %r31
T2_asi_reg_rd_174:
	mov	0x3c6, %r14
	.word 0xf8db8e80  ! 3799: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb49c4000  ! 3802: XORcc_R	xorcc 	%r17, %r0, %r26
	.word 0xfe5cc000  ! 3805: LDX_R	ldx	[%r19 + %r0], %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_181:
	mov	0x6, %r14
	.word 0xf0f38e40  ! 3810: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982a52  ! 3811: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a52, %hpstate
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0xfad520c9  ! 3816: LDSHA_I	ldsha	[%r20, + 0x00c9] %asi, %r29
cpu_intr_2_252:
	setx	0x3c002a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_310:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_310), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_wr_182:
	mov	0x3c4, %r14
	.word 0xfcf38400  ! 3822: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xf2c5a0d3  ! 3823: LDSWA_I	ldswa	[%r22, + 0x00d3] %asi, %r25
	ta	T_CHANGE_HPRIV
	.word 0xf08c8020  ! 3832: LDUBA_R	lduba	[%r18, %r0] 0x01, %r24
cpu_intr_2_253:
	setx	0x3e0209, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_183:
	mov	0xd, %r14
	.word 0xfaf38e80  ! 3844: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_2_254:
	setx	0x3e0023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b40000  ! 3847: SUBCcc_R	orncc 	%r16, %r0, %r24
	.word 0xbc0c212d  ! 3849: AND_I	and 	%r16, 0x012d, %r30
T2_asi_reg_rd_175:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 3859: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_2_311:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_311), 16, 16)) -> intp(2, 0, 8)
	.word 0xb884c000  ! 3861: ADDcc_R	addcc 	%r19, %r0, %r28
	.word 0xfa958020  ! 3862: LDUHA_R	lduha	[%r22, %r0] 0x01, %r29
	.word 0xf24cc000  ! 3863: LDSB_R	ldsb	[%r19 + %r0], %r25
	.word 0xf0d58020  ! 3869: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r24
	.word 0xb151c000  ! 3870: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_NONHPRIV
	.word 0xbcad0000  ! 3874: ANDNcc_R	andncc 	%r20, %r0, %r30
iob_intr_2_312:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_312), 16, 16)) -> intp(2, 0, 25)
	.word 0xfc548000  ! 3876: LDSH_R	ldsh	[%r18 + %r0], %r30
	.word 0xf815e0ae  ! 3880: LDUH_I	lduh	[%r23 + 0x00ae], %r28
T2_asi_reg_wr_184:
	mov	0x31, %r14
	.word 0xfef384a0  ! 3886: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T2_asi_reg_wr_185:
	mov	0x26, %r14
	.word 0xf2f38e40  ! 3887: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf84c0000  ! 3890: LDSB_R	ldsb	[%r16 + %r0], %r28
T2_asi_reg_rd_176:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 3891: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_2_255:
	setx	0x3d0337, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_313:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_313), 16, 16)) -> intp(2, 0, 3c)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_314:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_314), 16, 16)) -> intp(2, 0, 0)
T2_asi_reg_rd_177:
	mov	0xd, %r14
	.word 0xfadb8400  ! 3903: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf85c4000  ! 3904: LDX_R	ldx	[%r17 + %r0], %r28
	.word 0xfc5ca1ab  ! 3907: LDX_I	ldx	[%r18 + 0x01ab], %r30
	.word 0xfe4cc000  ! 3909: LDSB_R	ldsb	[%r19 + %r0], %r31
	.word 0xfc942199  ! 3911: LDUHA_I	lduha	[%r16, + 0x0199] %asi, %r30
T2_asi_reg_rd_178:
	mov	0x3c1, %r14
	.word 0xf6db8400  ! 3912: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_186:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 3919: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_2_256:
	setx	0x3e0002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf615e0b2  ! 3921: LDUH_I	lduh	[%r23 + 0x00b2], %r27
cpu_intr_2_257:
	setx	0x3c001e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_315:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_315), 16, 16)) -> intp(2, 0, 1e)
cpu_intr_2_258:
	setx	0x3e0032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8856081  ! 3935: LDUWA_I	lduwa	[%r21, + 0x0081] %asi, %r28
	ta	T_CHANGE_TO_TL0
	.word 0xf0c44020  ! 3939: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r24
	.word 0xf6cd8020  ! 3940: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r27
	.word 0xf605e114  ! 3941: LDUW_I	lduw	[%r23 + 0x0114], %r27
iob_intr_2_316:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_316), 16, 16)) -> intp(2, 0, 37)
cpu_intr_2_259:
	setx	0x3d0216, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf2954020  ! 3954: LDUHA_R	lduha	[%r21, %r0] 0x01, %r25
	.word 0xfad52054  ! 3955: LDSHA_I	ldsha	[%r20, + 0x0054] %asi, %r29
cpu_intr_2_260:
	setx	0x3d0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf645e0bd  ! 3957: LDSW_I	ldsw	[%r23 + 0x00bd], %r27
	.word 0xfc8d0020  ! 3958: LDUBA_R	lduba	[%r20, %r0] 0x01, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_rd_179:
	mov	0x4, %r14
	.word 0xf6db89e0  ! 3960: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_2_261:
	setx	0x3f0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc5d2061  ! 3962: LDX_I	ldx	[%r20 + 0x0061], %r30
cpu_intr_2_262:
	setx	0x3d0124, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_263:
	setx	0x3c0339, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_180:
	mov	0x3c3, %r14
	.word 0xf4db8e40  ! 3967: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_2_264:
	setx	0x3c0119, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_181:
	mov	0xb, %r14
	.word 0xf2db8e60  ! 3971: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf8d40020  ! 3972: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r28
	.word 0xf6d4c020  ! 3976: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r27
iob_intr_2_317:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_317), 16, 16)) -> intp(2, 0, 1c)
iob_intr_2_318:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_318), 16, 16)) -> intp(2, 0, 29)
	.word 0xf0d44020  ! 3981: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r24
iob_intr_2_319:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_319), 16, 16)) -> intp(2, 0, 24)
iob_intr_2_320:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_320), 16, 16)) -> intp(2, 0, 4)
T2_asi_reg_rd_182:
	mov	0x2d, %r14
	.word 0xf8db8e40  ! 3990: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_2_321:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_321), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_rd_183:
	mov	0x3c7, %r14
	.word 0xf0db8e40  ! 3995: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf6dc60d7  ! 3996: LDXA_I	ldxa	[%r17, + 0x00d7] %asi, %r27
cpu_intr_2_265:
	setx	0x3c033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_184:
	mov	0x3c5, %r14
	.word 0xf8db8400  ! 3999: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T2_asi_reg_rd_185:
	mov	0x30, %r14
	.word 0xfcdb84a0  ! 4001: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_2_266:
	setx	0x3c003c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_322:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_322), 16, 16)) -> intp(2, 0, 3b)
T2_asi_reg_rd_186:
	mov	0x2c, %r14
	.word 0xf8db8e40  ! 4005: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb32c8000  ! 4006: SLL_R	sll 	%r18, %r0, %r25
	ta	T_CHANGE_TO_TL1
	.word 0xf6dd2018  ! 4008: LDXA_I	ldxa	[%r20, + 0x0018] %asi, %r27
iob_intr_2_323:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_323), 16, 16)) -> intp(2, 0, b)
	.word 0xf4d520f5  ! 4011: LDSHA_I	ldsha	[%r20, + 0x00f5] %asi, %r26
	.word 0xba240000  ! 4012: SUB_R	sub 	%r16, %r0, %r29
cpu_intr_2_267:
	setx	0x3c020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0948020  ! 4016: LDUHA_R	lduha	[%r18, %r0] 0x01, %r24
cpu_intr_2_268:
	setx	0x3c0135, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_269:
	setx	0x3e0339, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_187:
	mov	0x3, %r14
	.word 0xf4f38e40  ! 4023: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfa44616f  ! 4024: LDSW_I	ldsw	[%r17 + 0x016f], %r29
	.word 0xf04ca1ca  ! 4025: LDSB_I	ldsb	[%r18 + 0x01ca], %r24
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x8198299a  ! 4028: WRHPR_HPSTATE_I	wrhpr	%r0, 0x099a, %hpstate
	.word 0xf6c44020  ! 4030: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r27
iob_intr_2_324:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_324), 16, 16)) -> intp(2, 0, 10)
	.word 0xb2c52012  ! 4034: ADDCcc_I	addccc 	%r20, 0x0012, %r25
iob_intr_2_325:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_325), 16, 16)) -> intp(2, 0, 34)
cpu_intr_2_270:
	setx	0x3e0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf68de074  ! 4042: LDUBA_I	lduba	[%r23, + 0x0074] %asi, %r27
	.word 0xf2cc2001  ! 4043: LDSBA_I	ldsba	[%r16, + 0x0001] %asi, %r25
	.word 0xf245211a  ! 4044: LDSW_I	ldsw	[%r20 + 0x011a], %r25
iob_intr_2_326:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_326), 16, 16)) -> intp(2, 0, d)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfc954020  ! 4049: LDUHA_R	lduha	[%r21, %r0] 0x01, %r30
	.word 0xfa4c4000  ! 4050: LDSB_R	ldsb	[%r17 + %r0], %r29
T2_asi_reg_wr_188:
	mov	0x3c7, %r14
	.word 0xfcf38e40  ! 4054: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf85ca1a1  ! 4057: LDX_I	ldx	[%r18 + 0x01a1], %r28
	.word 0xfc056063  ! 4060: LDUW_I	lduw	[%r21 + 0x0063], %r30
iob_intr_2_327:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_327), 16, 16)) -> intp(2, 0, 9)
	.word 0xfe14a159  ! 4062: LDUH_I	lduh	[%r18 + 0x0159], %r31
	.word 0xf0dce0fc  ! 4063: LDXA_I	ldxa	[%r19, + 0x00fc] %asi, %r24
T2_asi_reg_wr_189:
	mov	0x8, %r14
	.word 0xfef389e0  ! 4065: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T2_asi_reg_rd_187:
	mov	0x3c8, %r14
	.word 0xfcdb8e60  ! 4067: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf60ca1c9  ! 4068: LDUB_I	ldub	[%r18 + 0x01c9], %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfe554000  ! 4071: LDSH_R	ldsh	[%r21 + %r0], %r31
T2_asi_reg_rd_188:
	mov	0x29, %r14
	.word 0xf0db8e60  ! 4072: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_2_271:
	setx	0x3d0033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf094a01b  ! 4078: LDUHA_I	lduha	[%r18, + 0x001b] %asi, %r24
iob_intr_2_328:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_328), 16, 16)) -> intp(2, 0, 2d)
cpu_intr_2_272:
	setx	0x3c0336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf894c020  ! 4087: LDUHA_R	lduha	[%r19, %r0] 0x01, %r28
	.word 0xf4044000  ! 4089: LDUW_R	lduw	[%r17 + %r0], %r26
T2_asi_reg_wr_190:
	mov	0x2d, %r14
	.word 0xf0f38e80  ! 4090: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T2_asi_reg_wr_191:
	mov	0x35, %r14
	.word 0xfef38e80  ! 4091: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xfc0de1e2  ! 4093: LDUB_I	ldub	[%r23 + 0x01e2], %r30
	.word 0xf4d4c020  ! 4099: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r26
iob_intr_2_329:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_329), 16, 16)) -> intp(2, 0, 3a)
cpu_intr_2_273:
	setx	0x400037, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xbca40000  ! 4105: SUBcc_R	subcc 	%r16, %r0, %r30
	.word 0xfcd44020  ! 4106: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r30
	.word 0xf654a1f4  ! 4110: LDSH_I	ldsh	[%r18 + 0x01f4], %r27
	.word 0xfa154000  ! 4112: LDUH_R	lduh	[%r21 + %r0], %r29
	.word 0xb025e058  ! 4113: SUB_I	sub 	%r23, 0x0058, %r24
T2_asi_reg_rd_189:
	mov	0x14, %r14
	.word 0xfcdb89e0  ! 4115: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T2_asi_reg_rd_190:
	mov	0x1b, %r14
	.word 0xf0db89e0  ! 4118: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf00ca0f7  ! 4120: LDUB_I	ldub	[%r18 + 0x00f7], %r24
	.word 0xf2952111  ! 4121: LDUHA_I	lduha	[%r20, + 0x0111] %asi, %r25
	.word 0xfe0c4000  ! 4122: LDUB_R	ldub	[%r17 + %r0], %r31
	.word 0xfed40020  ! 4123: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r31
iob_intr_2_330:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_330), 16, 16)) -> intp(2, 0, 2)
	.word 0xb12ca001  ! 4126: SLL_I	sll 	%r18, 0x0001, %r24
cpu_intr_2_274:
	setx	0x40032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6848020  ! 4132: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r27
T2_asi_reg_wr_192:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 4133: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_2_331:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_331), 16, 16)) -> intp(2, 0, 21)
	.word 0xb6244000  ! 4135: SUB_R	sub 	%r17, %r0, %r27
	.word 0xf2854020  ! 4136: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r25
	ta	T_CHANGE_TO_TL1
iob_intr_2_332:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_332), 16, 16)) -> intp(2, 0, 1e)
iob_intr_2_333:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_333), 16, 16)) -> intp(2, 0, 31)
T2_asi_reg_rd_191:
	mov	0x24, %r14
	.word 0xf4db8400  ! 4144: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf6954020  ! 4148: LDUHA_R	lduha	[%r21, %r0] 0x01, %r27
	.word 0xf25c8000  ! 4150: LDX_R	ldx	[%r18 + %r0], %r25
iob_intr_2_334:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_334), 16, 16)) -> intp(2, 0, c)
cpu_intr_2_275:
	setx	0x410108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6958020  ! 4158: LDUHA_R	lduha	[%r22, %r0] 0x01, %r27
	.word 0xf6c420ad  ! 4160: LDSWA_I	ldswa	[%r16, + 0x00ad] %asi, %r27
	.word 0xf2cd2043  ! 4161: LDSBA_I	ldsba	[%r20, + 0x0043] %asi, %r25
	ta	T_CHANGE_TO_TL1
	.word 0xf48c2173  ! 4165: LDUBA_I	lduba	[%r16, + 0x0173] %asi, %r26
T2_asi_reg_wr_193:
	mov	0x28, %r14
	.word 0xfcf38e40  ! 4167: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf085e1a6  ! 4169: LDUWA_I	lduwa	[%r23, + 0x01a6] %asi, %r24
T2_asi_reg_wr_194:
	mov	0x37, %r14
	.word 0xf2f38e60  ! 4174: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf254e189  ! 4176: LDSH_I	ldsh	[%r19 + 0x0189], %r25
	.word 0xb9350000  ! 4177: SRL_R	srl 	%r20, %r0, %r28
T2_asi_reg_rd_192:
	mov	0x29, %r14
	.word 0xf6db84a0  ! 4178: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf0152051  ! 4179: LDUH_I	lduh	[%r20 + 0x0051], %r24
iob_intr_2_335:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_335), 16, 16)) -> intp(2, 0, 33)
cpu_intr_2_276:
	setx	0x41002a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_336:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_336), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_337:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_337), 16, 16)) -> intp(2, 0, 21)
	.word 0xfad4c020  ! 4188: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r29
cpu_intr_2_277:
	setx	0x430132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfacc0020  ! 4192: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r29
	.word 0xfad42132  ! 4193: LDSHA_I	ldsha	[%r16, + 0x0132] %asi, %r29
iob_intr_2_338:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_338), 16, 16)) -> intp(2, 0, 2)
	.word 0xfad4e054  ! 4196: LDSHA_I	ldsha	[%r19, + 0x0054] %asi, %r29
T2_asi_reg_wr_195:
	mov	0x1e, %r14
	.word 0xf4f384a0  ! 4197: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_2_278:
	setx	0x41012b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_279:
	setx	0x400209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6140000  ! 4203: LDUH_R	lduh	[%r16 + %r0], %r27
	.word 0xf05c0000  ! 4204: LDX_R	ldx	[%r16 + %r0], %r24
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_193:
	mov	0x27, %r14
	.word 0xf8db8400  ! 4212: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbb3c8000  ! 4214: SRA_R	sra 	%r18, %r0, %r29
cpu_intr_2_280:
	setx	0x410110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa05a02f  ! 4219: LDUW_I	lduw	[%r22 + 0x002f], %r29
	.word 0xf0d5607c  ! 4220: LDSHA_I	ldsha	[%r21, + 0x007c] %asi, %r24
T2_asi_reg_wr_196:
	mov	0x31, %r14
	.word 0xfaf38e60  ! 4222: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf40c205d  ! 4224: LDUB_I	ldub	[%r16 + 0x005d], %r26
iob_intr_2_339:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_339), 16, 16)) -> intp(2, 0, 13)
iob_intr_2_340:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_340), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_281:
	setx	0x410037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf08561bd  ! 4231: LDUWA_I	lduwa	[%r21, + 0x01bd] %asi, %r24
	ta	T_CHANGE_TO_TL1
cpu_intr_2_282:
	setx	0x420111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6550000  ! 4235: LDSH_R	ldsh	[%r20 + %r0], %r27
	.word 0xf2154000  ! 4236: LDUH_R	lduh	[%r21 + %r0], %r25
cpu_intr_2_283:
	setx	0x410336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4d0000  ! 4244: LDSB_R	ldsb	[%r20 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_284:
	setx	0x420221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf28c4020  ! 4248: LDUBA_R	lduba	[%r17, %r0] 0x01, %r25
iob_intr_2_341:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_341), 16, 16)) -> intp(2, 0, 31)
	.word 0xfcd421fe  ! 4250: LDSHA_I	ldsha	[%r16, + 0x01fe] %asi, %r30
	.word 0xfc5da122  ! 4251: LDX_I	ldx	[%r22 + 0x0122], %r30
	.word 0xfad4210a  ! 4252: LDSHA_I	ldsha	[%r16, + 0x010a] %asi, %r29
T2_asi_reg_rd_194:
	mov	0x3c4, %r14
	.word 0xfadb8e40  ! 4253: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982c40  ! 4254: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c40, %hpstate
iob_intr_2_342:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_342), 16, 16)) -> intp(2, 0, 1e)
	ta	T_CHANGE_TO_TL0
cpu_intr_2_285:
	setx	0x43000c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_343:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_343), 16, 16)) -> intp(2, 0, b)
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983c8a  ! 4265: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c8a, %hpstate
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
	.word 0x89952151  ! 4276: WRPR_TICK_I	wrpr	%r20, 0x0151, %tick
cpu_intr_2_286:
	setx	0x43000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65d6128  ! 4280: LDX_I	ldx	[%r21 + 0x0128], %r27
	.word 0xfe158000  ! 4283: LDUH_R	lduh	[%r22 + %r0], %r31
cpu_intr_2_287:
	setx	0x42032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7343001  ! 4286: SRLX_I	srlx	%r16, 0x0001, %r27
iob_intr_2_344:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_344), 16, 16)) -> intp(2, 0, 9)
cpu_intr_2_288:
	setx	0x41003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf895e169  ! 4294: LDUHA_I	lduha	[%r23, + 0x0169] %asi, %r28
iob_intr_2_345:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_345), 16, 16)) -> intp(2, 0, 3f)
	.word 0xb825618f  ! 4296: SUB_I	sub 	%r21, 0x018f, %r28
	.word 0xfedc204b  ! 4297: LDXA_I	ldxa	[%r16, + 0x004b] %asi, %r31
T2_asi_reg_rd_195:
	mov	0x3c0, %r14
	.word 0xf0db8e40  ! 4299: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_197:
	mov	0x19, %r14
	.word 0xf8f38e60  ! 4302: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf0548000  ! 4304: LDSH_R	ldsh	[%r18 + %r0], %r24
cpu_intr_2_289:
	setx	0x410200, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf8d4617a  ! 4316: LDSHA_I	ldsha	[%r17, + 0x017a] %asi, %r28
cpu_intr_2_290:
	setx	0x40000f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_196:
	mov	0x3c3, %r14
	.word 0xf2db84a0  ! 4318: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xfadce013  ! 4321: LDXA_I	ldxa	[%r19, + 0x0013] %asi, %r29
	.word 0xf28c8020  ! 4324: LDUBA_R	lduba	[%r18, %r0] 0x01, %r25
cpu_intr_2_291:
	setx	0x430120, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_198:
	mov	0x23, %r14
	.word 0xf0f38400  ! 4335: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_2_346:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_346), 16, 16)) -> intp(2, 0, 30)
	.word 0xf05c4000  ! 4338: LDX_R	ldx	[%r17 + %r0], %r24
cpu_intr_2_292:
	setx	0x410028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa85a1e4  ! 4342: LDUWA_I	lduwa	[%r22, + 0x01e4] %asi, %r29
T2_asi_reg_rd_197:
	mov	0x3c2, %r14
	.word 0xf6db8e60  ! 4345: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T2_asi_reg_rd_198:
	mov	0x3c2, %r14
	.word 0xf8db8e60  ! 4347: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	ta	T_CHANGE_TO_TL1
	.word 0xbc4560d7  ! 4354: ADDC_I	addc 	%r21, 0x00d7, %r30
iob_intr_2_347:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_347), 16, 16)) -> intp(2, 0, f)
	.word 0xfc45c000  ! 4356: LDSW_R	ldsw	[%r23 + %r0], %r30
iob_intr_2_348:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_348), 16, 16)) -> intp(2, 0, a)
	.word 0xb2b58000  ! 4361: SUBCcc_R	orncc 	%r22, %r0, %r25
iob_intr_2_349:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_349), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf08d2148  ! 4366: LDUBA_I	lduba	[%r20, + 0x0148] %asi, %r24
iob_intr_2_350:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_350), 16, 16)) -> intp(2, 0, 1)
cpu_intr_2_293:
	setx	0x400033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb234a032  ! 4374: SUBC_I	orn 	%r18, 0x0032, %r25
	.word 0xf04dc000  ! 4376: LDSB_R	ldsb	[%r23 + %r0], %r24
T2_asi_reg_wr_199:
	mov	0x2, %r14
	.word 0xf4f38e40  ! 4377: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf24c8000  ! 4378: LDSB_R	ldsb	[%r18 + %r0], %r25
cpu_intr_2_294:
	setx	0x410011, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_295:
	setx	0x430136, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_199:
	mov	0x3c4, %r14
	.word 0xfcdb8400  ! 4385: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T2_asi_reg_wr_200:
	mov	0x3c3, %r14
	.word 0xf4f38e40  ! 4388: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_351:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_351), 16, 16)) -> intp(2, 0, 24)
iob_intr_2_352:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_352), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf80d8000  ! 4396: LDUB_R	ldub	[%r22 + %r0], %r28
	.word 0xf44ce14b  ! 4397: LDSB_I	ldsb	[%r19 + 0x014b], %r26
iob_intr_2_353:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_353), 16, 16)) -> intp(2, 0, 9)
cpu_intr_2_296:
	setx	0x42002d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_297:
	setx	0x430313, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_200:
	mov	0x24, %r14
	.word 0xfedb89e0  ! 4402: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_2_298:
	setx	0x42022f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_354:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_354), 16, 16)) -> intp(2, 0, a)
	ta	T_CHANGE_TO_TL0
iob_intr_2_355:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_355), 16, 16)) -> intp(2, 0, e)
T2_asi_reg_wr_201:
	mov	0x3c6, %r14
	.word 0xf6f38e40  ! 4413: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb89d61b8  ! 4416: XORcc_I	xorcc 	%r21, 0x01b8, %r28
T2_asi_reg_wr_202:
	mov	0x34, %r14
	.word 0xf0f38e40  ! 4427: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_rd_201:
	mov	0x21, %r14
	.word 0xfcdb8400  ! 4429: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_356:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_356), 16, 16)) -> intp(2, 0, e)
T2_asi_reg_rd_202:
	mov	0x1b, %r14
	.word 0xf8db89e0  ! 4432: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_2_299:
	setx	0x40011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8850000  ! 4434: ADDcc_R	addcc 	%r20, %r0, %r28
	setx	data_start_1, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982b98  ! 4435: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b98, %hpstate
iob_intr_2_357:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_357), 16, 16)) -> intp(2, 0, 7)
T2_asi_reg_wr_203:
	mov	0x3c6, %r14
	.word 0xf6f389e0  ! 4438: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T2_asi_reg_rd_203:
	mov	0x38, %r14
	.word 0xfadb84a0  ! 4439: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf484a19b  ! 4442: LDUWA_I	lduwa	[%r18, + 0x019b] %asi, %r26
	.word 0xfcdca19f  ! 4444: LDXA_I	ldxa	[%r18, + 0x019f] %asi, %r30
iob_intr_2_358:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_358), 16, 16)) -> intp(2, 0, 1f)
cpu_intr_2_300:
	setx	0x410104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf444e068  ! 4450: LDSW_I	ldsw	[%r19 + 0x0068], %r26
T2_asi_reg_wr_204:
	mov	0x3c6, %r14
	.word 0xf8f38e60  ! 4452: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbcb460a3  ! 4454: SUBCcc_I	orncc 	%r17, 0x00a3, %r30
	.word 0xf084c020  ! 4455: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r24
T2_asi_reg_wr_205:
	mov	0x13, %r14
	.word 0xf0f38e40  ! 4459: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfadd21ef  ! 4460: LDXA_I	ldxa	[%r20, + 0x01ef] %asi, %r29
	.word 0xfc844020  ! 4461: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r30
T2_asi_reg_rd_204:
	mov	0x37, %r14
	.word 0xf0db89e0  ! 4463: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T2_asi_reg_wr_206:
	mov	0x28, %r14
	.word 0xfaf38e60  ! 4464: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_2_359:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_359), 16, 16)) -> intp(2, 0, d)
T2_asi_reg_wr_207:
	mov	0x32, %r14
	.word 0xfef389e0  ! 4466: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_2_301:
	setx	0x400226, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_360:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_360), 16, 16)) -> intp(2, 0, 2)
T2_asi_reg_wr_208:
	mov	0x3, %r14
	.word 0xf2f38400  ! 4470: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T2_asi_reg_wr_209:
	mov	0x3c4, %r14
	.word 0xfcf384a0  ! 4473: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfa8c0020  ! 4474: LDUBA_R	lduba	[%r16, %r0] 0x01, %r29
	.word 0xf25cc000  ! 4475: LDX_R	ldx	[%r19 + %r0], %r25
	.word 0xf04d0000  ! 4476: LDSB_R	ldsb	[%r20 + %r0], %r24
cpu_intr_2_302:
	setx	0x410133, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_210:
	mov	0x9, %r14
	.word 0xf8f38e80  ! 4480: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xfa4c8000  ! 4481: LDSB_R	ldsb	[%r18 + %r0], %r29
iob_intr_2_361:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_361), 16, 16)) -> intp(2, 0, 27)
T2_asi_reg_rd_205:
	mov	0x3c4, %r14
	.word 0xf2db8e40  ! 4485: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_2_303:
	setx	0x410328, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_362:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_362), 16, 16)) -> intp(2, 0, 3d)
cpu_intr_2_304:
	setx	0x400323, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_363:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_363), 16, 16)) -> intp(2, 0, b)
T2_asi_reg_wr_211:
	mov	0x2d, %r14
	.word 0xf0f389e0  ! 4497: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T2_asi_reg_rd_206:
	mov	0x31, %r14
	.word 0xf6db8400  ! 4499: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983bd0  ! 4501: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd0, %hpstate
	.word 0xf8858020  ! 4502: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r28
iob_intr_2_364:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_364), 16, 16)) -> intp(2, 0, 37)
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982d82  ! 4508: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d82, %hpstate
T2_asi_reg_rd_207:
	mov	0x33, %r14
	.word 0xf4db84a0  ! 4509: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T2_asi_reg_wr_212:
	mov	0x2e, %r14
	.word 0xfcf38e40  ! 4512: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb445a087  ! 4516: ADDC_I	addc 	%r22, 0x0087, %r26
cpu_intr_2_305:
	setx	0x40032f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_365:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_365), 16, 16)) -> intp(2, 0, 6)
T2_asi_reg_rd_208:
	mov	0x4, %r14
	.word 0xf4db8400  ! 4522: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xfaccc020  ! 4525: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r29
	.word 0xf4d40020  ! 4528: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r26
iob_intr_2_366:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_366), 16, 16)) -> intp(2, 0, 1e)
	ta	T_CHANGE_TO_TL1
	.word 0xbf641800  ! 4533: MOVcc_R	<illegal instruction>
T2_asi_reg_wr_213:
	mov	0x2e, %r14
	.word 0xf4f384a0  ! 4535: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_306:
	setx	0x41011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
cpu_intr_2_307:
	setx	0x400226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8c40020  ! 4549: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r28
	.word 0xbe940000  ! 4552: ORcc_R	orcc 	%r16, %r0, %r31
	.word 0xf40dc000  ! 4553: LDUB_R	ldub	[%r23 + %r0], %r26
	.word 0xf6cdc020  ! 4555: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r27
iob_intr_2_367:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_367), 16, 16)) -> intp(2, 0, 1)
	.word 0xf8c42092  ! 4557: LDSWA_I	ldswa	[%r16, + 0x0092] %asi, %r28
	.word 0xf6cde104  ! 4560: LDSBA_I	ldsba	[%r23, + 0x0104] %asi, %r27
	.word 0xf005218f  ! 4561: LDUW_I	lduw	[%r20 + 0x018f], %r24
	.word 0xfa052180  ! 4563: LDUW_I	lduw	[%r20 + 0x0180], %r29
	.word 0xf65c0000  ! 4565: LDX_R	ldx	[%r16 + %r0], %r27
	.word 0xf4d58020  ! 4567: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r26
cpu_intr_2_308:
	setx	0x420202, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_209:
	mov	0x7, %r14
	.word 0xf8db89e0  ! 4571: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	ta	T_CHANGE_TO_TL1
	.word 0xfa14e0f2  ! 4575: LDUH_I	lduh	[%r19 + 0x00f2], %r29
cpu_intr_2_309:
	setx	0x42020b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_214:
	mov	0x2d, %r14
	.word 0xfaf38e60  ! 4579: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_2_310:
	setx	0x44010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfecc8020  ! 4581: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r31
	.word 0xf0cd4020  ! 4582: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r24
	.word 0xf48da087  ! 4583: LDUBA_I	lduba	[%r22, + 0x0087] %asi, %r26
	ta	T_CHANGE_TO_TL1
cpu_intr_2_311:
	setx	0x45033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_368:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_368), 16, 16)) -> intp(2, 0, 11)
iob_intr_2_369:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_369), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_rd_210:
	mov	0x1f, %r14
	.word 0xf6db8e40  ! 4592: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf6056025  ! 4593: LDUW_I	lduw	[%r21 + 0x0025], %r27
	.word 0xf214c000  ! 4594: LDUH_R	lduh	[%r19 + %r0], %r25
	.word 0xf8950020  ! 4595: LDUHA_R	lduha	[%r20, %r0] 0x01, %r28
T2_asi_reg_wr_215:
	mov	0x10, %r14
	.word 0xf0f38400  ! 4598: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb33d1000  ! 4599: SRAX_R	srax	%r20, %r0, %r25
T2_asi_reg_wr_216:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 4604: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfa054000  ! 4606: LDUW_R	lduw	[%r21 + %r0], %r29
cpu_intr_2_312:
	setx	0x440224, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_370:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_370), 16, 16)) -> intp(2, 0, 26)
	.word 0xf055e106  ! 4611: LDSH_I	ldsh	[%r23 + 0x0106], %r24
iob_intr_2_371:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_371), 16, 16)) -> intp(2, 0, 16)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2d5a07a  ! 4620: LDSHA_I	ldsha	[%r22, + 0x007a] %asi, %r25
iob_intr_2_372:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_372), 16, 16)) -> intp(2, 0, 2a)
cpu_intr_2_313:
	setx	0x450122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd51c000  ! 4624: RDPR_TL	<illegal instruction>
iob_intr_2_373:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_373), 16, 16)) -> intp(2, 0, 2f)
T2_asi_reg_rd_211:
	mov	0x9, %r14
	.word 0xf4db8e40  ! 4629: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb69ce030  ! 4630: XORcc_I	xorcc 	%r19, 0x0030, %r27
T2_asi_reg_rd_212:
	mov	0x3c8, %r14
	.word 0xf2db84a0  ! 4633: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	ta	T_CHANGE_TO_TL0
	.word 0xf48c8020  ! 4643: LDUBA_R	lduba	[%r18, %r0] 0x01, %r26
T2_asi_reg_rd_213:
	mov	0x3c6, %r14
	.word 0xf2db8e60  ! 4647: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xfadca0e3  ! 4649: LDXA_I	ldxa	[%r18, + 0x00e3] %asi, %r29
iob_intr_2_374:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_374), 16, 16)) -> intp(2, 0, 6)
cpu_intr_2_314:
	setx	0x470322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_315:
	setx	0x440239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc45e124  ! 4658: LDSW_I	ldsw	[%r23 + 0x0124], %r30
	.word 0xfe94209b  ! 4665: LDUHA_I	lduha	[%r16, + 0x009b] %asi, %r31
T2_asi_reg_rd_214:
	mov	0x37, %r14
	.word 0xfcdb8e80  ! 4666: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_2_375:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_375), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf20461de  ! 4669: LDUW_I	lduw	[%r17 + 0x01de], %r25
	.word 0xf2dde084  ! 4673: LDXA_I	ldxa	[%r23, + 0x0084] %asi, %r25
	.word 0xbcbda1ac  ! 4674: XNORcc_I	xnorcc 	%r22, 0x01ac, %r30
	.word 0xb034c000  ! 4675: SUBC_R	orn 	%r19, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_217:
	mov	0x24, %r14
	.word 0xf8f38e80  ! 4681: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T2_asi_reg_wr_218:
	mov	0x17, %r14
	.word 0xf6f38e40  ! 4682: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_2_316:
	setx	0x470326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb204212f  ! 4689: ADD_I	add 	%r16, 0x012f, %r25
	.word 0xf6cd4020  ! 4690: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r27
	.word 0xba8d21ce  ! 4691: ANDcc_I	andcc 	%r20, 0x01ce, %r29
T2_asi_reg_wr_219:
	mov	0x3, %r14
	.word 0xfef384a0  ! 4694: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T2_asi_reg_wr_220:
	mov	0x3c8, %r14
	.word 0xfef389e0  ! 4696: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf08421d9  ! 4698: LDUWA_I	lduwa	[%r16, + 0x01d9] %asi, %r24
T2_asi_reg_wr_221:
	mov	0x30, %r14
	.word 0xfef389e0  ! 4700: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T2_asi_reg_rd_215:
	mov	0x12, %r14
	.word 0xf0db89e0  ! 4701: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb83cc000  ! 4704: XNOR_R	xnor 	%r19, %r0, %r28
	ta	T_CHANGE_TO_TL0
iob_intr_2_376:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_376), 16, 16)) -> intp(2, 0, 2b)
iob_intr_2_377:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_377), 16, 16)) -> intp(2, 0, 2e)
iob_intr_2_378:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_378), 16, 16)) -> intp(2, 0, 3a)
	.word 0xfec56082  ! 4710: LDSWA_I	ldswa	[%r21, + 0x0082] %asi, %r31
T2_asi_reg_wr_222:
	mov	0x2c, %r14
	.word 0xfaf38e40  ! 4712: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf0d56167  ! 4713: LDSHA_I	ldsha	[%r21, + 0x0167] %asi, %r24
cpu_intr_2_317:
	setx	0x47022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2c42010  ! 4717: LDSWA_I	ldswa	[%r16, + 0x0010] %asi, %r25
	.word 0xb41dc000  ! 4718: XOR_R	xor 	%r23, %r0, %r26
cpu_intr_2_318:
	setx	0x450037, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_223:
	mov	0x3c6, %r14
	.word 0xfef389e0  ! 4722: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T2_asi_reg_wr_224:
	mov	0x19, %r14
	.word 0xfaf38e40  ! 4724: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_319:
	setx	0x470125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8d8020  ! 4727: LDUBA_R	lduba	[%r22, %r0] 0x01, %r31
cpu_intr_2_320:
	setx	0x47021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa040000  ! 4730: LDUW_R	lduw	[%r16 + %r0], %r29
iob_intr_2_379:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_379), 16, 16)) -> intp(2, 0, 16)
T2_asi_reg_wr_225:
	mov	0x3c7, %r14
	.word 0xf4f384a0  ! 4732: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_321:
	setx	0x450200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa84a141  ! 4741: LDUWA_I	lduwa	[%r18, + 0x0141] %asi, %r29
iob_intr_2_380:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_380), 16, 16)) -> intp(2, 0, 3f)
T2_asi_reg_wr_226:
	mov	0x34, %r14
	.word 0xfaf38e80  ! 4746: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xfa4da016  ! 4750: LDSB_I	ldsb	[%r22 + 0x0016], %r29
iob_intr_2_381:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_381), 16, 16)) -> intp(2, 0, 20)
iob_intr_2_382:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_382), 16, 16)) -> intp(2, 0, 38)
	.word 0xfe15a0b2  ! 4756: LDUH_I	lduh	[%r22 + 0x00b2], %r31
	.word 0xf805c000  ! 4757: LDUW_R	lduw	[%r23 + %r0], %r28
T2_asi_reg_rd_216:
	mov	0x3c7, %r14
	.word 0xf8db84a0  ! 4758: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb72cc000  ! 4760: SLL_R	sll 	%r19, %r0, %r27
T2_asi_reg_rd_217:
	mov	0x2a, %r14
	.word 0xfadb8e80  ! 4762: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_2_383:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_383), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf6c5e067  ! 4773: LDSWA_I	ldswa	[%r23, + 0x0067] %asi, %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xf2058000  ! 4776: LDUW_R	lduw	[%r22 + %r0], %r25
T2_asi_reg_wr_227:
	mov	0x3c3, %r14
	.word 0xfaf38e40  ! 4777: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb7504000  ! 4779: RDPR_TNPC	<illegal instruction>
	.word 0xf28c8020  ! 4781: LDUBA_R	lduba	[%r18, %r0] 0x01, %r25
cpu_intr_2_322:
	setx	0x44022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_218:
	mov	0x1c, %r14
	.word 0xf0db8e60  ! 4785: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xba9dc000  ! 4788: XORcc_R	xorcc 	%r23, %r0, %r29
T2_asi_reg_wr_228:
	mov	0x0, %r14
	.word 0xf6f384a0  ! 4792: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_2_323:
	setx	0x470102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe0ce000  ! 4794: AND_I	and 	%r19, 0x0000, %r31
iob_intr_2_384:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_384), 16, 16)) -> intp(2, 0, 19)
	.word 0xf41521e8  ! 4797: LDUH_I	lduh	[%r20 + 0x01e8], %r26
T2_asi_reg_rd_219:
	mov	0x3c5, %r14
	.word 0xf4db84a0  ! 4798: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_2_324:
	setx	0x440028, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_220:
	mov	0x3c0, %r14
	.word 0xf0db8400  ! 4805: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf444c000  ! 4808: LDSW_R	ldsw	[%r19 + %r0], %r26
cpu_intr_2_325:
	setx	0x470122, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_229:
	mov	0x3c7, %r14
	.word 0xfaf384a0  ! 4811: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T2_asi_reg_wr_230:
	mov	0x3c7, %r14
	.word 0xfcf38400  ! 4812: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xf4544000  ! 4817: LDSH_R	ldsh	[%r17 + %r0], %r26
	.word 0xf8cdc020  ! 4821: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r28
T2_asi_reg_wr_231:
	mov	0x3, %r14
	.word 0xf2f384a0  ! 4822: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_2_326:
	setx	0x450338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72d3001  ! 4826: SLLX_I	sllx	%r20, 0x0001, %r27
	.word 0xfc14c000  ! 4829: LDUH_R	lduh	[%r19 + %r0], %r30
	.word 0xfe054000  ! 4830: LDUW_R	lduw	[%r21 + %r0], %r31
cpu_intr_2_327:
	setx	0x460213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc442028  ! 4834: LDSW_I	ldsw	[%r16 + 0x0028], %r30
T2_asi_reg_wr_232:
	mov	0x1e, %r14
	.word 0xf4f38e40  ! 4835: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_328:
	setx	0x470226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_329:
	setx	0x470219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb635a1fb  ! 4846: SUBC_I	orn 	%r22, 0x01fb, %r27
	.word 0xf20d613e  ! 4847: LDUB_I	ldub	[%r21 + 0x013e], %r25
	.word 0xf85d0000  ! 4848: LDX_R	ldx	[%r20 + %r0], %r28
	.word 0xb0b48000  ! 4849: ORNcc_R	orncc 	%r18, %r0, %r24
T2_asi_reg_rd_221:
	mov	0x3c3, %r14
	.word 0xfedb8e40  ! 4850: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf8858020  ! 4855: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r28
cpu_intr_2_330:
	setx	0x470021, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_222:
	mov	0x3c7, %r14
	.word 0xf6db89e0  ! 4862: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb2ac0000  ! 4864: ANDNcc_R	andncc 	%r16, %r0, %r25
	.word 0xf00c207c  ! 4868: LDUB_I	ldub	[%r16 + 0x007c], %r24
	.word 0xfc8d60ac  ! 4871: LDUBA_I	lduba	[%r21, + 0x00ac] %asi, %r30
iob_intr_2_385:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_385), 16, 16)) -> intp(2, 0, 12)
cpu_intr_2_331:
	setx	0x450007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf005c000  ! 4877: LDUW_R	lduw	[%r23 + %r0], %r24
	.word 0xf0c4c020  ! 4879: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r24
	.word 0xfadce11a  ! 4882: LDXA_I	ldxa	[%r19, + 0x011a] %asi, %r29
iob_intr_2_386:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_386), 16, 16)) -> intp(2, 0, 2b)
	.word 0xbb35e001  ! 4889: SRL_I	srl 	%r23, 0x0001, %r29
iob_intr_2_387:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_387), 16, 16)) -> intp(2, 0, 8)
T2_asi_reg_rd_223:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 4892: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfe0c8000  ! 4893: LDUB_R	ldub	[%r18 + %r0], %r31
cpu_intr_2_332:
	setx	0x46001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_224:
	mov	0x13, %r14
	.word 0xf0db84a0  ! 4895: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_2_388:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_388), 16, 16)) -> intp(2, 0, 3a)
	.word 0xb12c5000  ! 4898: SLLX_R	sllx	%r17, %r0, %r24
	ta	T_CHANGE_TO_TL0
cpu_intr_2_333:
	setx	0x460027, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_233:
	mov	0x1f, %r14
	.word 0xf2f38e80  ! 4903: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_2_334:
	setx	0x440002, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_234:
	mov	0x0, %r14
	.word 0xf6f38e40  ! 4908: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfadc60b2  ! 4909: LDXA_I	ldxa	[%r17, + 0x00b2] %asi, %r29
T2_asi_reg_wr_235:
	mov	0x3c1, %r14
	.word 0xf2f38400  ! 4912: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_2_389:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_389), 16, 16)) -> intp(2, 0, 19)
	.word 0xf0444000  ! 4915: LDSW_R	ldsw	[%r17 + %r0], %r24
	.word 0xf85c20f1  ! 4916: LDX_I	ldx	[%r16 + 0x00f1], %r28
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_335:
	setx	0x44012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_wr_236:
	mov	0x3c2, %r14
	.word 0xf0f38400  ! 4922: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_2_336:
	setx	0x460030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4c40020  ! 4928: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r26
iob_intr_2_390:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_390), 16, 16)) -> intp(2, 0, 28)
	.word 0xfa8d0020  ! 4931: LDUBA_R	lduba	[%r20, %r0] 0x01, %r29
	.word 0xbb2da001  ! 4936: SLL_I	sll 	%r22, 0x0001, %r29
T2_asi_reg_wr_237:
	mov	0x25, %r14
	.word 0xf0f38e40  ! 4937: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982e02  ! 4938: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e02, %hpstate
iob_intr_2_391:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_391), 16, 16)) -> intp(2, 0, 12)
	ta	T_CHANGE_HPRIV
iob_intr_2_392:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_392), 16, 16)) -> intp(2, 0, 37)
	.word 0x8195e0c4  ! 4943: WRPR_TPC_I	wrpr	%r23, 0x00c4, %tpc
cpu_intr_2_337:
	setx	0x460111, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_393:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_393), 16, 16)) -> intp(2, 0, 2f)
iob_intr_2_394:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_394), 16, 16)) -> intp(2, 0, 3a)
cpu_intr_2_338:
	setx	0x460228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8144000  ! 4957: LDUH_R	lduh	[%r17 + %r0], %r28
T2_asi_reg_wr_238:
	mov	0x0, %r14
	.word 0xfcf389e0  ! 4958: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_2_339:
	setx	0x440219, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
	.word 0xb43d60f0  ! 4966: XNOR_I	xnor 	%r21, 0x00f0, %r26
T2_asi_reg_wr_239:
	mov	0x3c6, %r14
	.word 0xfaf384a0  ! 4968: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xf64c208d  ! 4969: LDSB_I	ldsb	[%r16 + 0x008d], %r27
T2_asi_reg_rd_225:
	mov	0x1b, %r14
	.word 0xf0db8e60  ! 4970: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xfe8d8020  ! 4971: LDUBA_R	lduba	[%r22, %r0] 0x01, %r31
iob_intr_2_395:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_395), 16, 16)) -> intp(2, 0, 3d)
T2_asi_reg_wr_240:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 4973: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_2_396:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_396), 16, 16)) -> intp(2, 0, 2d)
	ta	T_CHANGE_NONHPRIV
	.word 0xb614c000  ! 4976: OR_R	or 	%r19, %r0, %r27
iob_intr_2_397:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_397), 16, 16)) -> intp(2, 0, 15)
iob_intr_2_398:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_398), 16, 16)) -> intp(2, 0, 1c)
cpu_intr_2_340:
	setx	0x440237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6cda0a2  ! 4985: LDSBA_I	ldsba	[%r22, + 0x00a2] %asi, %r27
iob_intr_2_399:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_399), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf6152080  ! 4987: LDUH_I	lduh	[%r20 + 0x0080], %r27
	.word 0xfe850020  ! 4990: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r31
T2_asi_reg_rd_226:
	mov	0x3c1, %r14
	.word 0xf4db8e60  ! 4991: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T2_asi_reg_rd_227:
	mov	0x3c4, %r14
	.word 0xf6db8e80  ! 4993: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf655a086  ! 4994: LDSH_I	ldsh	[%r22 + 0x0086], %r27
	.word 0xfe0ce1ea  ! 4996: LDUB_I	ldub	[%r19 + 0x01ea], %r31
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
iob_intr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_0), 16, 16)) -> intp(1, 0, 8)
T1_asi_reg_wr_0:
	mov	0x3c8, %r14
	.word 0xf2f389e0  ! 6: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbfa84820  ! 7: FMOVE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_1:
	mov	0xc, %r14
	.word 0xfaf38e80  ! 9: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T1_asi_reg_rd_0:
	mov	0x35, %r14
	.word 0xf0db8400  ! 10: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_1), 16, 16)) -> intp(1, 0, 1b)
cpu_intr_1_0:
	setx	0x1c0018, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_1:
	mov	0x3c0, %r14
	.word 0xfcdb8e40  ! 19: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_rd_2:
	mov	0x31, %r14
	.word 0xf4db8400  ! 20: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T1_asi_reg_rd_3:
	mov	0x1e, %r14
	.word 0xfedb89e0  ! 21: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T1_asi_reg_rd_4:
	mov	0x2b, %r14
	.word 0xf6db8e40  ! 22: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T1_asi_reg_wr_2:
	mov	0x3c4, %r14
	.word 0xf6f384a0  ! 23: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_2), 16, 16)) -> intp(1, 0, a)
iob_intr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_3), 16, 16)) -> intp(1, 0, 32)
	.word 0xb3a549c0  ! 32: FDIVd	fdivd	%f52, %f0, %f56
iob_intr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_4), 16, 16)) -> intp(1, 0, 1)
	lda	[%r21 + %g0] 0xf0, %f2
T1_asi_reg_wr_3:
	mov	0x30, %r14
	.word 0xfef38400  ! 37: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb9aa4820  ! 38: FMOVNE	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_5:
	mov	0x25, %r14
	.word 0xf2db84a0  ! 40: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbba81420  ! 47: FMOVRNZ	dis not found

	.word 0xbba5c820  ! 50: FADDs	fadds	%f23, %f0, %f29
T1_asi_reg_wr_4:
	mov	0x38, %r14
	.word 0xfcf38400  ! 53: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T1_asi_reg_rd_6:
	mov	0x1c, %r14
	.word 0xf8db89e0  ! 54: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_1_1:
	setx	0x1e0312, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_7:
	mov	0x2, %r14
	.word 0xf8db89e0  ! 59: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xbeb5c000  ! 65: SUBCcc_R	orncc 	%r23, %r0, %r31
T1_asi_reg_wr_5:
	mov	0x3, %r14
	.word 0xf0f38400  ! 67: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb3a81c20  ! 69: FMOVRGEZ	dis not found

iob_intr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_5), 16, 16)) -> intp(1, 0, 29)
	.word 0xbc04207c  ! 75: ADD_I	add 	%r16, 0x007c, %r30
cpu_intr_1_2:
	setx	0x1c0009, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_6:
	mov	0x20, %r14
	.word 0xfcf38e80  ! 83: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb7a4c9c0  ! 86: FDIVd	fdivd	%f50, %f0, %f58
T1_asi_reg_rd_8:
	mov	0x3c2, %r14
	.word 0xf4db8e60  ! 87: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T1_asi_reg_wr_7:
	mov	0x3c3, %r14
	.word 0xfaf389e0  ! 89: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda4c8c0  ! 96: FSUBd	fsubd	%f50, %f0, %f30
	.word 0xbfa54860  ! 98: FADDq	dis not found

	.word 0x879461f5  ! 101: WRPR_TT_I	wrpr	%r17, 0x01f5, %tt
	.word 0xb2c4a188  ! 102: ADDCcc_I	addccc 	%r18, 0x0188, %r25
	.word 0xb3a00520  ! 106: FSQRTs	fsqrt	
iob_intr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_6), 16, 16)) -> intp(1, 0, 3d)
cpu_intr_1_3:
	setx	0x1f0305, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_9:
	mov	0x35, %r14
	.word 0xf4db84a0  ! 111: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_7), 16, 16)) -> intp(1, 0, 12)
iob_intr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_8), 16, 16)) -> intp(1, 0, 12)
iob_intr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_9), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb7ab4820  ! 118: FMOVCC	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_10:
	mov	0xc, %r14
	.word 0xf0db8e80  ! 119: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_1_4:
	setx	0x1d011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c820  ! 121: FADDs	fadds	%f19, %f0, %f27
T1_asi_reg_rd_11:
	mov	0x26, %r14
	.word 0xfcdb8e80  ! 123: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T1_asi_reg_wr_8:
	mov	0xa, %r14
	.word 0xf4f38e80  ! 124: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_10), 16, 16)) -> intp(1, 0, a)
T1_asi_reg_wr_9:
	mov	0x2, %r14
	.word 0xf2f38e60  ! 130: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_1_5:
	setx	0x1e0125, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_11), 16, 16)) -> intp(1, 0, 22)
iob_intr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_12), 16, 16)) -> intp(1, 0, 15)
	.word 0xb1a48860  ! 139: FADDq	dis not found

	.word 0xbda9c820  ! 140: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb235a117  ! 145: SUBC_I	orn 	%r22, 0x0117, %r25
	.word 0xb034e132  ! 148: SUBC_I	orn 	%r19, 0x0132, %r24
	.word 0xb9a588a0  ! 150: FSUBs	fsubs	%f22, %f0, %f28
	.word 0x85942189  ! 152: WRPR_TSTATE_I	wrpr	%r16, 0x0189, %tstate
iob_intr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_13), 16, 16)) -> intp(1, 0, 4)
cpu_intr_1_6:
	setx	0x1f0233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba489c0  ! 160: FDIVd	fdivd	%f18, %f0, %f60
	.word 0xb7aac820  ! 161: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb9a00520  ! 163: FSQRTs	fsqrt	
	.word 0xb1a81820  ! 165: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xb5a80c20  ! 168: FMOVRLZ	dis not found

iob_intr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_14), 16, 16)) -> intp(1, 0, 25)
T1_asi_reg_wr_10:
	mov	0x3c4, %r14
	.word 0xfaf38e80  ! 170: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T1_asi_reg_wr_11:
	mov	0x32, %r14
	.word 0xf8f38e60  ! 171: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_1_7:
	setx	0x1e020d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_12:
	mov	0x15, %r14
	.word 0xf2f38e40  ! 177: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_1_8:
	setx	0x1e023a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_9:
	setx	0x1f0319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb135a001  ! 181: SRL_I	srl 	%r22, 0x0001, %r24
T1_asi_reg_wr_13:
	mov	0x28, %r14
	.word 0xf0f38e40  ! 182: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb7a5c9e0  ! 185: FDIVq	dis not found

iob_intr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_15), 16, 16)) -> intp(1, 0, e)
iob_intr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_16), 16, 16)) -> intp(1, 0, 7)
	.word 0xb9aac820  ! 190: FMOVGE	fmovs	%fcc1, %f0, %f28
iob_intr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_17), 16, 16)) -> intp(1, 0, 12)
T1_asi_reg_rd_12:
	mov	0x3c1, %r14
	.word 0xf4db8e60  ! 192: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb7a40920  ! 195: FMULs	fmuls	%f16, %f0, %f27
T1_asi_reg_rd_13:
	mov	0x6, %r14
	.word 0xfadb8e40  ! 196: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbda00520  ! 198: FSQRTs	fsqrt	
T1_asi_reg_rd_14:
	mov	0xf, %r14
	.word 0xf0db8e40  ! 200: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_rd_15:
	mov	0x23, %r14
	.word 0xfcdb8400  ! 201: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb1a58940  ! 202: FMULd	fmuld	%f22, %f0, %f24
T1_asi_reg_rd_16:
	mov	0x30, %r14
	.word 0xfedb8400  ! 206: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_18), 16, 16)) -> intp(1, 0, 35)
iob_intr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_19), 16, 16)) -> intp(1, 0, 12)
T1_asi_reg_rd_17:
	mov	0x33, %r14
	.word 0xfadb89e0  ! 214: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_20), 16, 16)) -> intp(1, 0, 14)
	.word 0xb1a80820  ! 219: FMOVN	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_18:
	mov	0x30, %r14
	.word 0xfedb8e40  ! 220: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb4142095  ! 221: OR_I	or 	%r16, 0x0095, %r26
	.word 0xb9a88820  ! 224: FMOVLE	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_14:
	mov	0x1e, %r14
	.word 0xf8f38400  ! 227: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_1_10:
	setx	0x1c010e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_11:
	setx	0x1f0023, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_21), 16, 16)) -> intp(1, 0, 15)
T1_asi_reg_wr_15:
	mov	0x15, %r14
	.word 0xf4f38e40  ! 235: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb5a4c9a0  ! 239: FDIVs	fdivs	%f19, %f0, %f26
T1_asi_reg_rd_19:
	mov	0x32, %r14
	.word 0xf6db84a0  ! 244: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb3a488a0  ! 245: FSUBs	fsubs	%f18, %f0, %f25
	.word 0xb9a80420  ! 246: FMOVRZ	dis not found

cpu_intr_1_12:
	setx	0x1e0330, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_13:
	setx	0x1d0111, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_20:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 255: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbfab4820  ! 258: FMOVCC	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_16:
	mov	0x7, %r14
	.word 0xfef384a0  ! 261: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_1_14:
	setx	0x1d0211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a408c0  ! 265: FSUBd	fsubd	%f16, %f0, %f56
T1_asi_reg_rd_21:
	mov	0x28, %r14
	.word 0xfcdb8400  ! 267: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_22), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb03d0000  ! 274: XNOR_R	xnor 	%r20, %r0, %r24
	.word 0xb1a4c8c0  ! 275: FSUBd	fsubd	%f50, %f0, %f24
	.word 0xb3a81420  ! 279: FMOVRNZ	dis not found

cpu_intr_1_15:
	setx	0x1e0219, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_17:
	mov	0x1a, %r14
	.word 0xf4f38e40  ! 284: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_23), 16, 16)) -> intp(1, 0, 26)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_24), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_16:
	setx	0x1e0205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a88820  ! 292: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb9a81420  ! 296: FMOVRNZ	dis not found

T1_asi_reg_rd_22:
	mov	0x36, %r14
	.word 0xf8db8e60  ! 297: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_25), 16, 16)) -> intp(1, 0, 3d)
iob_intr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_26), 16, 16)) -> intp(1, 0, 24)
	.word 0xbba50840  ! 305: FADDd	faddd	%f20, %f0, %f60
cpu_intr_1_17:
	setx	0x1e0133, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_23:
	mov	0xf, %r14
	.word 0xfcdb84a0  ! 307: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb9a00520  ! 308: FSQRTs	fsqrt	
cpu_intr_1_18:
	setx	0x1f013b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_27), 16, 16)) -> intp(1, 0, 2f)
cpu_intr_1_19:
	setx	0x1d0220, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_18:
	mov	0x3c5, %r14
	.word 0xf6f38e40  ! 315: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbba80820  ! 316: FMOVN	fmovs	%fcc1, %f0, %f29
iob_intr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_28), 16, 16)) -> intp(1, 0, 7)
	.word 0xb3a50940  ! 323: FMULd	fmuld	%f20, %f0, %f56
iob_intr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_29), 16, 16)) -> intp(1, 0, 2f)
	.word 0xbfa00040  ! 326: FMOVd	fmovd	%f0, %f62
cpu_intr_1_20:
	setx	0x1f001a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_21:
	setx	0x1d0205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a90820  ! 333: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xb9a589a0  ! 335: FDIVs	fdivs	%f22, %f0, %f28
iob_intr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_30), 16, 16)) -> intp(1, 0, f)
	.word 0xb3a508a0  ! 337: FSUBs	fsubs	%f20, %f0, %f25
	.word 0xb7a81420  ! 338: FMOVRNZ	dis not found

	.word 0xb1a5c820  ! 341: FADDs	fadds	%f23, %f0, %f24
T1_asi_reg_rd_24:
	mov	0x3c6, %r14
	.word 0xfadb8e60  ! 342: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_31), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb1ab8820  ! 344: FMOVPOS	fmovs	%fcc1, %f0, %f24
	lda	[%r21 + %g0] 0xf0, %f2
iob_intr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_32), 16, 16)) -> intp(1, 0, 8)
T1_asi_reg_rd_25:
	mov	0x17, %r14
	.word 0xf0db84a0  ! 356: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb62ce0f8  ! 361: ANDN_I	andn 	%r19, 0x00f8, %r27
	lda	[%r21 + %g0] 0xf0, %f2
T1_asi_reg_rd_26:
	mov	0x3c5, %r14
	.word 0xf0db8e80  ! 369: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbe1c215d  ! 370: XOR_I	xor 	%r16, 0x015d, %r31
T1_asi_reg_wr_19:
	mov	0x23, %r14
	.word 0xf6f38e60  ! 371: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbab54000  ! 379: ORNcc_R	orncc 	%r21, %r0, %r29
	.word 0xb4ace1e7  ! 380: ANDNcc_I	andncc 	%r19, 0x01e7, %r26
cpu_intr_1_22:
	setx	0x1e0235, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_27:
	mov	0xc, %r14
	.word 0xfadb8400  ! 387: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb3abc820  ! 389: FMOVVC	fmovs	%fcc1, %f0, %f25
iob_intr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_33), 16, 16)) -> intp(1, 0, 26)
	.word 0xb9ab0820  ! 391: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xb1ab0820  ! 393: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb82de17c  ! 394: ANDN_I	andn 	%r23, 0x017c, %r28
	.word 0xb334f001  ! 396: SRLX_I	srlx	%r19, 0x0001, %r25
	.word 0xb5a5c820  ! 397: FADDs	fadds	%f23, %f0, %f26
iob_intr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_34), 16, 16)) -> intp(1, 0, 17)
cpu_intr_1_23:
	setx	0x1c0018, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_35), 16, 16)) -> intp(1, 0, 7)
iob_intr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_36), 16, 16)) -> intp(1, 0, 25)
cpu_intr_1_24:
	setx	0x1d0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3aa0820  ! 409: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb3a88820  ! 410: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb72c7001  ! 413: SLLX_I	sllx	%r17, 0x0001, %r27
T1_asi_reg_rd_28:
	mov	0x31, %r14
	.word 0xf8db8e40  ! 414: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb9a54920  ! 419: FMULs	fmuls	%f21, %f0, %f28
T1_asi_reg_rd_29:
	mov	0x23, %r14
	.word 0xfedb8e40  ! 420: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb7a408c0  ! 422: FSUBd	fsubd	%f16, %f0, %f58
T1_asi_reg_rd_30:
	mov	0xd, %r14
	.word 0xf0db8e80  ! 425: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T1_asi_reg_rd_31:
	mov	0x23, %r14
	.word 0xf4db84a0  ! 428: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_1_25:
	setx	0x1e033c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_26:
	setx	0x1d0034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcbda0c5  ! 436: XNORcc_I	xnorcc 	%r22, 0x00c5, %r30
iob_intr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_37), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_38), 16, 16)) -> intp(1, 0, 9)
	.word 0xbc3d60f4  ! 444: XNOR_I	xnor 	%r21, 0x00f4, %r30
T1_asi_reg_rd_32:
	mov	0x1d, %r14
	.word 0xf8db84a0  ! 448: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T1_asi_reg_rd_33:
	mov	0x35, %r14
	.word 0xf8db89e0  ! 451: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb7a00520  ! 455: FSQRTs	fsqrt	
T1_asi_reg_rd_34:
	mov	0x32, %r14
	.word 0xfadb84a0  ! 456: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbfa00540  ! 457: FSQRTd	fsqrt	
iob_intr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_39), 16, 16)) -> intp(1, 0, 3a)
cpu_intr_1_27:
	setx	0x20000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80c20  ! 462: FMOVRLZ	dis not found

	.word 0xb5aa4820  ! 466: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xbba50820  ! 469: FADDs	fadds	%f20, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9a5c9a0  ! 473: FDIVs	fdivs	%f23, %f0, %f28
iob_intr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_40), 16, 16)) -> intp(1, 0, 32)
	.word 0xbdab0820  ! 477: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb1ab8820  ! 480: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb1a80c20  ! 482: FMOVRLZ	dis not found

cpu_intr_1_28:
	setx	0x210023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaa8820  ! 484: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xbda8c820  ! 485: FMOVL	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_20:
	mov	0x1f, %r14
	.word 0xf4f389e0  ! 486: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb7a80c20  ! 488: FMOVRLZ	dis not found

	.word 0xb3a90820  ! 491: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xbc2da163  ! 494: ANDN_I	andn 	%r22, 0x0163, %r30
T1_asi_reg_wr_21:
	mov	0x1f, %r14
	.word 0xf6f38400  ! 498: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_41), 16, 16)) -> intp(1, 0, 17)
	.word 0xb7a50840  ! 501: FADDd	faddd	%f20, %f0, %f58
	.word 0xbba448a0  ! 502: FSUBs	fsubs	%f17, %f0, %f29
	.word 0xb5ab0820  ! 506: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb5a80820  ! 508: FMOVN	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_35:
	mov	0x33, %r14
	.word 0xf8db8e60  ! 512: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb7a4c9c0  ! 513: FDIVd	fdivd	%f50, %f0, %f58
	.word 0xb5a80c20  ! 518: FMOVRLZ	dis not found

cpu_intr_1_29:
	setx	0x210329, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_22:
	mov	0x30, %r14
	.word 0xfef384a0  ! 522: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb495e022  ! 528: ORcc_I	orcc 	%r23, 0x0022, %r26
	.word 0xbba94820  ! 529: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb9a409a0  ! 530: FDIVs	fdivs	%f16, %f0, %f28
iob_intr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_42), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb5a54920  ! 532: FMULs	fmuls	%f21, %f0, %f26
T1_asi_reg_wr_23:
	mov	0x33, %r14
	.word 0xf6f38e60  ! 534: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_43), 16, 16)) -> intp(1, 0, 19)
cpu_intr_1_30:
	setx	0x210309, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_44), 16, 16)) -> intp(1, 0, 22)
	.word 0xbda98820  ! 541: FMOVNEG	fmovs	%fcc1, %f0, %f30
iob_intr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_45), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb0b48000  ! 547: ORNcc_R	orncc 	%r18, %r0, %r24
cpu_intr_1_31:
	setx	0x22031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a00520  ! 553: FSQRTs	fsqrt	
	.word 0xb1a9c820  ! 556: FMOVVS	fmovs	%fcc1, %f0, %f24
iob_intr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_46), 16, 16)) -> intp(1, 0, 1f)
T1_asi_reg_rd_36:
	mov	0x3c1, %r14
	.word 0xf4db8400  ! 558: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_47), 16, 16)) -> intp(1, 0, 26)
cpu_intr_1_32:
	setx	0x200300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80c20  ! 563: FMOVRLZ	dis not found

	.word 0xbba589c0  ! 565: FDIVd	fdivd	%f22, %f0, %f60
T1_asi_reg_rd_37:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 567: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_rd_38:
	mov	0x38, %r14
	.word 0xf2db8400  ! 570: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_39:
	mov	0x5, %r14
	.word 0xf2db84a0  ! 572: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_1_33:
	setx	0x23030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb13d5000  ! 578: SRAX_R	srax	%r21, %r0, %r24
cpu_intr_1_34:
	setx	0x200326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda48840  ! 585: FADDd	faddd	%f18, %f0, %f30
T1_asi_reg_wr_24:
	mov	0x1e, %r14
	.word 0xf6f389e0  ! 587: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T1_asi_reg_rd_40:
	mov	0x7, %r14
	.word 0xfadb8e80  ! 588: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T1_asi_reg_wr_25:
	mov	0x3c7, %r14
	.word 0xf6f38e80  ! 589: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbbaa8820  ! 590: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb3a509e0  ! 591: FDIVq	dis not found

	.word 0xbba4c860  ! 594: FADDq	dis not found

T1_asi_reg_rd_41:
	mov	0x24, %r14
	.word 0xf8db8e40  ! 596: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_rd_42:
	mov	0x4, %r14
	.word 0xf4db84a0  ! 598: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T1_asi_reg_rd_43:
	mov	0x3c7, %r14
	.word 0xfedb8e60  ! 599: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb0442107  ! 600: ADDC_I	addc 	%r16, 0x0107, %r24
T1_asi_reg_wr_26:
	mov	0x2e, %r14
	.word 0xfaf389e0  ! 601: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb9a489e0  ! 608: FDIVq	dis not found

iob_intr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_48), 16, 16)) -> intp(1, 0, 1a)
cpu_intr_1_35:
	setx	0x210017, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_27:
	mov	0x3c6, %r14
	.word 0xfaf389e0  ! 612: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbba98820  ! 614: FMOVNEG	fmovs	%fcc1, %f0, %f29
iob_intr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_49), 16, 16)) -> intp(1, 0, 15)
	.word 0xb9a81c20  ! 620: FMOVRGEZ	dis not found

T1_asi_reg_wr_28:
	mov	0x2e, %r14
	.word 0xf4f38e40  ! 622: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_wr_29:
	mov	0x4, %r14
	.word 0xf4f38e40  ! 627: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_wr_30:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 629: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_wr_31:
	mov	0x2e, %r14
	.word 0xfaf384a0  ! 631: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbda00040  ! 632: FMOVd	fmovd	%f0, %f30
	.word 0xbfab8820  ! 636: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb7a4c960  ! 638: FMULq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a80420  ! 642: FMOVRZ	dis not found

cpu_intr_1_36:
	setx	0x230101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfabc820  ! 644: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb9a80820  ! 646: FMOVN	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_32:
	mov	0x5, %r14
	.word 0xf8f38e80  ! 648: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb9504000  ! 650: RDPR_TNPC	<illegal instruction>
	.word 0xb3a81420  ! 651: FMOVRNZ	dis not found

iob_intr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_50), 16, 16)) -> intp(1, 0, 6)
cpu_intr_1_37:
	setx	0x230113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_51), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_38:
	setx	0x200227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a98820  ! 660: FMOVNEG	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_44:
	mov	0x2b, %r14
	.word 0xf2db8e40  ! 661: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_wr_33:
	mov	0xa, %r14
	.word 0xf6f38e40  ! 664: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb895c000  ! 665: ORcc_R	orcc 	%r23, %r0, %r28
iob_intr_1_52:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_52), 16, 16)) -> intp(1, 0, 3c)
iob_intr_1_53:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_53), 16, 16)) -> intp(1, 0, 27)
	.word 0xb33c3001  ! 669: SRAX_I	srax	%r16, 0x0001, %r25
iob_intr_1_54:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_54), 16, 16)) -> intp(1, 0, 3)
T1_asi_reg_rd_45:
	mov	0x3c4, %r14
	.word 0xf4db89e0  ! 673: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb9a98820  ! 677: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xbdabc820  ! 678: FMOVVC	fmovs	%fcc1, %f0, %f30
cpu_intr_1_39:
	setx	0x220207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80820  ! 685: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_34:
	mov	0x24, %r14
	.word 0xf4f38e40  ! 687: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_55:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_55), 16, 16)) -> intp(1, 0, 39)
cpu_intr_1_40:
	setx	0x210131, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_56:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_56), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_rd_46:
	mov	0x0, %r14
	.word 0xf4db8e40  ! 691: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb20c8000  ! 692: AND_R	and 	%r18, %r0, %r25
	.word 0xbfa9c820  ! 694: FMOVVS	fmovs	%fcc1, %f0, %f31
iob_intr_1_57:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_57), 16, 16)) -> intp(1, 0, 2d)
iob_intr_1_58:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_58), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_41:
	setx	0x23033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaa8820  ! 698: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xbc848000  ! 701: ADDcc_R	addcc 	%r18, %r0, %r30
T1_asi_reg_rd_47:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 702: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbc3c0000  ! 704: XNOR_R	xnor 	%r16, %r0, %r30
T1_asi_reg_wr_35:
	mov	0x2b, %r14
	.word 0xfef389e0  ! 707: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_wr_36:
	mov	0x29, %r14
	.word 0xf8f38e80  ! 708: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb9a8c820  ! 710: FMOVL	fmovs	%fcc1, %f0, %f28
cpu_intr_1_42:
	setx	0x230309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb93c6001  ! 712: SRA_I	sra 	%r17, 0x0001, %r28
T1_asi_reg_wr_37:
	mov	0x0, %r14
	.word 0xf8f384a0  ! 713: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_1_43:
	setx	0x20031a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_44:
	setx	0x22011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r21 + %g0] 0xf0, %f2
T1_asi_reg_wr_38:
	mov	0x2a, %r14
	.word 0xfef384a0  ! 723: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T1_asi_reg_rd_48:
	mov	0x0, %r14
	.word 0xfedb8e40  ! 729: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	lda	[%r21 + %g0] 0xf0, %f2
	.word 0xbf2d9000  ! 731: SLLX_R	sllx	%r22, %r0, %r31
	.word 0xb1a549e0  ! 734: FDIVq	dis not found

	.word 0xb3a80c20  ! 736: FMOVRLZ	dis not found

T1_asi_reg_wr_39:
	mov	0x1f, %r14
	.word 0xf0f38e80  ! 738: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_1_59:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_59), 16, 16)) -> intp(1, 0, f)
	.word 0xb3a94820  ! 740: FMOVCS	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_49:
	mov	0x3c4, %r14
	.word 0xfcdb8e80  ! 741: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbda588c0  ! 742: FSUBd	fsubd	%f22, %f0, %f30
	.word 0xbfa54820  ! 747: FADDs	fadds	%f21, %f0, %f31
T1_asi_reg_wr_40:
	mov	0x10, %r14
	.word 0xf4f38e40  ! 748: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_rd_50:
	mov	0x4, %r14
	.word 0xfadb8e80  ! 750: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb1a00020  ! 751: FMOVs	fmovs	%f0, %f24
iob_intr_1_60:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_60), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb7a58940  ! 753: FMULd	fmuld	%f22, %f0, %f58
	.word 0xbd3c1000  ! 754: SRAX_R	srax	%r16, %r0, %r30
	.word 0xb1a80820  ! 756: FMOVN	fmovs	%fcc1, %f0, %f24
cpu_intr_1_45:
	setx	0x220310, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_61:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_61), 16, 16)) -> intp(1, 0, 1)
	.word 0xb1a80420  ! 769: FMOVRZ	dis not found

cpu_intr_1_46:
	setx	0x23033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a84820  ! 772: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb5a588a0  ! 773: FSUBs	fsubs	%f22, %f0, %f26
iob_intr_1_62:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_62), 16, 16)) -> intp(1, 0, 35)
cpu_intr_1_47:
	setx	0x220336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a84820  ! 781: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb9a588e0  ! 783: FSUBq	dis not found

	.word 0xb82d6152  ! 788: ANDN_I	andn 	%r21, 0x0152, %r28
T1_asi_reg_wr_41:
	mov	0x3c0, %r14
	.word 0xf8f38400  ! 789: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbda508c0  ! 791: FSUBd	fsubd	%f20, %f0, %f30
T1_asi_reg_wr_42:
	mov	0x3c0, %r14
	.word 0xfcf389e0  ! 792: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb1a80820  ! 796: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
iob_intr_1_63:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_63), 16, 16)) -> intp(1, 0, 3)
iob_intr_1_64:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_64), 16, 16)) -> intp(1, 0, 2c)
iob_intr_1_65:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_65), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_rd_51:
	mov	0x1f, %r14
	.word 0xf0db8e40  ! 802: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_66:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_66), 16, 16)) -> intp(1, 0, 24)
	.word 0xb9a00560  ! 805: FSQRTq	fsqrt	
T1_asi_reg_wr_43:
	mov	0x3c2, %r14
	.word 0xf8f389e0  ! 806: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_1_67:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_67), 16, 16)) -> intp(1, 0, 28)
	.word 0xbba508a0  ! 810: FSUBs	fsubs	%f20, %f0, %f29
	.word 0xb7a44860  ! 811: FADDq	dis not found

	.word 0xb9a409c0  ! 812: FDIVd	fdivd	%f16, %f0, %f28
T1_asi_reg_rd_52:
	mov	0x14, %r14
	.word 0xf2db8e60  ! 813: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbdaac820  ! 815: FMOVGE	fmovs	%fcc1, %f0, %f30
	lda	[%r19 + %g0] 0xf0, %f2
T1_asi_reg_rd_53:
	mov	0x3c1, %r14
	.word 0xfedb8e40  ! 817: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb5a4c920  ! 819: FMULs	fmuls	%f19, %f0, %f26
	.word 0xb5a00020  ! 824: FMOVs	fmovs	%f0, %f26
cpu_intr_1_48:
	setx	0x22031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a488a0  ! 829: FSUBs	fsubs	%f18, %f0, %f25
T1_asi_reg_rd_54:
	mov	0x1e, %r14
	.word 0xf2db89e0  ! 831: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbdab4820  ! 832: FMOVCC	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_44:
	mov	0x3c7, %r14
	.word 0xf8f38400  ! 835: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb62ca1c4  ! 836: ANDN_I	andn 	%r18, 0x01c4, %r27
T1_asi_reg_wr_45:
	mov	0x33, %r14
	.word 0xf2f38e40  ! 837: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbfa48920  ! 838: FMULs	fmuls	%f18, %f0, %f31
T1_asi_reg_wr_46:
	mov	0x18, %r14
	.word 0xf6f38e80  ! 839: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb9a90820  ! 840: FMOVLEU	fmovs	%fcc1, %f0, %f28
cpu_intr_1_49:
	setx	0x200114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab8820  ! 843: FMOVPOS	fmovs	%fcc1, %f0, %f29
cpu_intr_1_50:
	setx	0x230127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda409a0  ! 847: FDIVs	fdivs	%f16, %f0, %f30
	.word 0xb72c3001  ! 848: SLLX_I	sllx	%r16, 0x0001, %r27
iob_intr_1_68:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_68), 16, 16)) -> intp(1, 0, 1c)
	.word 0xbdaa4820  ! 851: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xbba88820  ! 852: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb9a408a0  ! 853: FSUBs	fsubs	%f16, %f0, %f28
	.word 0xb3a488c0  ! 855: FSUBd	fsubd	%f18, %f0, %f56
cpu_intr_1_51:
	setx	0x220328, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_52:
	setx	0x21002e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_53:
	setx	0x22030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a548e0  ! 862: FSUBq	dis not found

	.word 0xb5a48840  ! 863: FADDd	faddd	%f18, %f0, %f26
	.word 0xb5a549a0  ! 866: FDIVs	fdivs	%f21, %f0, %f26
	.word 0xb9a00520  ! 867: FSQRTs	fsqrt	
cpu_intr_1_54:
	setx	0x210302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a409e0  ! 869: FDIVq	dis not found

T1_asi_reg_wr_47:
	mov	0x3c8, %r14
	.word 0xfcf38400  ! 870: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_1_69:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_69), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_wr_48:
	mov	0x3c0, %r14
	.word 0xfef38e40  ! 874: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb7a50840  ! 875: FADDd	faddd	%f20, %f0, %f58
	.word 0xb9a81c20  ! 876: FMOVRGEZ	dis not found

	.word 0xb7abc820  ! 880: FMOVVC	fmovs	%fcc1, %f0, %f27
iob_intr_1_70:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_70), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbda589a0  ! 884: FDIVs	fdivs	%f22, %f0, %f30
iob_intr_1_71:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_71), 16, 16)) -> intp(1, 0, 2a)
	.word 0xbba58820  ! 889: FADDs	fadds	%f22, %f0, %f29
cpu_intr_1_55:
	setx	0x20022b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_55:
	mov	0x11, %r14
	.word 0xfcdb8e60  ! 893: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_1_56:
	setx	0x200107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb405c000  ! 897: ADD_R	add 	%r23, %r0, %r26
	.word 0xb3ab0820  ! 898: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xbfa00520  ! 901: FSQRTs	fsqrt	
iob_intr_1_72:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_72), 16, 16)) -> intp(1, 0, 0)
iob_intr_1_73:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_73), 16, 16)) -> intp(1, 0, 15)
cpu_intr_1_57:
	setx	0x250028, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_74:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_74), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_rd_56:
	mov	0x34, %r14
	.word 0xfcdb8e40  ! 906: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbba00560  ! 907: FSQRTq	fsqrt	
	.word 0xb1ab8820  ! 912: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xbda4c9a0  ! 914: FDIVs	fdivs	%f19, %f0, %f30
iob_intr_1_75:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_75), 16, 16)) -> intp(1, 0, 2b)
T1_asi_reg_wr_49:
	mov	0x3c2, %r14
	.word 0xfaf38400  ! 916: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_1_58:
	setx	0x270132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00520  ! 919: FSQRTs	fsqrt	
iob_intr_1_76:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_76), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_59:
	setx	0x260339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a508c0  ! 924: FSUBd	fsubd	%f20, %f0, %f28
	.word 0xb9ab4820  ! 925: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb53c4000  ! 926: SRA_R	sra 	%r17, %r0, %r26
	.word 0xb9a80820  ! 928: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0x8d94a047  ! 937: WRPR_PSTATE_I	wrpr	%r18, 0x0047, %pstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_77:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_77), 16, 16)) -> intp(1, 0, 12)
	.word 0xbda4c960  ! 943: FMULq	dis not found

T1_asi_reg_rd_57:
	mov	0x2d, %r14
	.word 0xfedb84a0  ! 944: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T1_asi_reg_wr_50:
	mov	0x3c8, %r14
	.word 0xfaf38400  ! 945: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb3a80420  ! 947: FMOVRZ	dis not found

	.word 0xb7a549e0  ! 949: FDIVq	dis not found

iob_intr_1_78:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_78), 16, 16)) -> intp(1, 0, 2b)
iob_intr_1_79:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_79), 16, 16)) -> intp(1, 0, 7)
	.word 0xbda5c9c0  ! 954: FDIVd	fdivd	%f54, %f0, %f30
cpu_intr_1_60:
	setx	0x24013c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_61:
	setx	0x250236, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_58:
	mov	0x3c2, %r14
	.word 0xf2db89e0  ! 957: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a489c0  ! 960: FDIVd	fdivd	%f18, %f0, %f28
	.word 0xb8bcc000  ! 967: XNORcc_R	xnorcc 	%r19, %r0, %r28
cpu_intr_1_62:
	setx	0x250333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda81820  ! 972: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	lda	[%r18 + %g0] 0xf0, %f2
	.word 0xb68d20c1  ! 975: ANDcc_I	andcc 	%r20, 0x00c1, %r27
	.word 0xbdab4820  ! 976: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xbcb42023  ! 978: SUBCcc_I	orncc 	%r16, 0x0023, %r30
	.word 0xb3aa4820  ! 979: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xb9a588c0  ! 980: FSUBd	fsubd	%f22, %f0, %f28
cpu_intr_1_63:
	setx	0x24010a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_80:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_80), 16, 16)) -> intp(1, 0, 9)
iob_intr_1_81:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_81), 16, 16)) -> intp(1, 0, 1)
cpu_intr_1_64:
	setx	0x26000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a548a0  ! 987: FSUBs	fsubs	%f21, %f0, %f27
cpu_intr_1_65:
	setx	0x27002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb81cc000  ! 990: XOR_R	xor 	%r19, %r0, %r28
	.word 0xbf504000  ! 995: RDPR_TNPC	<illegal instruction>
cpu_intr_1_66:
	setx	0x240031, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_51:
	mov	0x3c8, %r14
	.word 0xf2f38400  ! 997: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_1_67:
	setx	0x25031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80820  ! 1001: FMOVN	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_59:
	mov	0x3c2, %r14
	.word 0xf2db84a0  ! 1002: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbfa81420  ! 1005: FMOVRNZ	dis not found

cpu_intr_1_68:
	setx	0x250022, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_52:
	mov	0x19, %r14
	.word 0xf8f389e0  ! 1009: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb3a50960  ! 1014: FMULq	dis not found

cpu_intr_1_69:
	setx	0x270018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9354000  ! 1022: SRL_R	srl 	%r21, %r0, %r28
	.word 0xb3a80820  ! 1023: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_60:
	mov	0x35, %r14
	.word 0xf2db8e40  ! 1025: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0x81946101  ! 1026: WRPR_TPC_I	wrpr	%r17, 0x0101, %tpc
cpu_intr_1_70:
	setx	0x240230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda509a0  ! 1028: FDIVs	fdivs	%f20, %f0, %f30
	.word 0xba0da113  ! 1030: AND_I	and 	%r22, 0x0113, %r29
	.word 0xbbab4820  ! 1033: FMOVCC	fmovs	%fcc1, %f0, %f29
iob_intr_1_82:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_82), 16, 16)) -> intp(1, 0, 1e)
	.word 0xbda489a0  ! 1042: FDIVs	fdivs	%f18, %f0, %f30
cpu_intr_1_71:
	setx	0x25000a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_72:
	setx	0x26020a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_73:
	setx	0x270111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a5c840  ! 1047: FADDd	faddd	%f54, %f0, %f24
iob_intr_1_83:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_83), 16, 16)) -> intp(1, 0, 7)
T1_asi_reg_rd_61:
	mov	0xc, %r14
	.word 0xfedb84a0  ! 1049: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb5abc820  ! 1051: FMOVVC	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_62:
	mov	0x0, %r14
	.word 0xf0db89e0  ! 1052: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T1_asi_reg_rd_63:
	mov	0x22, %r14
	.word 0xf2db84a0  ! 1053: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb5a40940  ! 1055: FMULd	fmuld	%f16, %f0, %f26
	.word 0xbc8d21c1  ! 1058: ANDcc_I	andcc 	%r20, 0x01c1, %r30
	.word 0xb62d4000  ! 1065: ANDN_R	andn 	%r21, %r0, %r27
	.word 0xb1a94820  ! 1069: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb3a40940  ! 1070: FMULd	fmuld	%f16, %f0, %f56
T1_asi_reg_wr_53:
	mov	0x1a, %r14
	.word 0xfcf38e60  ! 1073: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_1_74:
	setx	0x260321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80420  ! 1079: FMOVRZ	dis not found

iob_intr_1_84:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_84), 16, 16)) -> intp(1, 0, 37)
cpu_intr_1_75:
	setx	0x240209, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_64:
	mov	0x24, %r14
	.word 0xf8db89e0  ! 1087: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_1_85:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_85), 16, 16)) -> intp(1, 0, 20)
	.word 0xb5a58820  ! 1089: FADDs	fadds	%f22, %f0, %f26
T1_asi_reg_rd_65:
	mov	0x3c1, %r14
	.word 0xf2db89e0  ! 1095: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_1_86:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_86), 16, 16)) -> intp(1, 0, 6)
iob_intr_1_87:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_87), 16, 16)) -> intp(1, 0, 11)
iob_intr_1_88:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_88), 16, 16)) -> intp(1, 0, 2c)
cpu_intr_1_76:
	setx	0x25011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a90820  ! 1105: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xb82d0000  ! 1106: ANDN_R	andn 	%r20, %r0, %r28
cpu_intr_1_77:
	setx	0x240133, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_78:
	setx	0x260326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a48860  ! 1115: FADDq	dis not found

T1_asi_reg_rd_66:
	mov	0x3c8, %r14
	.word 0xfadb89e0  ! 1117: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_1_89:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_89), 16, 16)) -> intp(1, 0, 1f)
T1_asi_reg_rd_67:
	mov	0x3c2, %r14
	.word 0xf4db8e60  ! 1119: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb1abc820  ! 1121: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xbfa81c20  ! 1126: FMOVRGEZ	dis not found

iob_intr_1_90:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_90), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb3a9c820  ! 1128: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb9a80c20  ! 1132: FMOVRLZ	dis not found

iob_intr_1_91:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_91), 16, 16)) -> intp(1, 0, 3c)
	.word 0xba8ce143  ! 1135: ANDcc_I	andcc 	%r19, 0x0143, %r29
	.word 0xb5ab4820  ! 1136: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb5aa4820  ! 1137: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xbdabc820  ! 1138: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xbda00040  ! 1139: FMOVd	fmovd	%f0, %f30
cpu_intr_1_79:
	setx	0x250201, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_54:
	mov	0x19, %r14
	.word 0xf2f38e60  ! 1143: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_1_80:
	setx	0x25021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb32c4000  ! 1150: SLL_R	sll 	%r17, %r0, %r25
	.word 0xb7a44960  ! 1153: FMULq	dis not found

cpu_intr_1_81:
	setx	0x250313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb40c2190  ! 1156: AND_I	and 	%r16, 0x0190, %r26
	.word 0xb09da072  ! 1157: XORcc_I	xorcc 	%r22, 0x0072, %r24
T1_asi_reg_rd_68:
	mov	0x26, %r14
	.word 0xf6db8e40  ! 1158: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb1a449a0  ! 1159: FDIVs	fdivs	%f17, %f0, %f24
cpu_intr_1_82:
	setx	0x270137, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_83:
	setx	0x270232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb09c6151  ! 1162: XORcc_I	xorcc 	%r17, 0x0151, %r24
	.word 0xbba54840  ! 1163: FADDd	faddd	%f52, %f0, %f60
T1_asi_reg_wr_55:
	mov	0x3c0, %r14
	.word 0xf8f38400  ! 1164: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb9a9c820  ! 1165: FMOVVS	fmovs	%fcc1, %f0, %f28
	lda	[%r18 + %g0] 0xf0, %f2
iob_intr_1_92:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_92), 16, 16)) -> intp(1, 0, 24)
	.word 0xb9a589c0  ! 1172: FDIVd	fdivd	%f22, %f0, %f28
iob_intr_1_93:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_93), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_94:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_94), 16, 16)) -> intp(1, 0, 3)
T1_asi_reg_wr_56:
	mov	0x33, %r14
	.word 0xf8f38e80  ! 1176: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb08d4000  ! 1179: ANDcc_R	andcc 	%r21, %r0, %r24
cpu_intr_1_84:
	setx	0x260031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a4c9c0  ! 1182: FDIVd	fdivd	%f50, %f0, %f28
T1_asi_reg_wr_57:
	mov	0x1b, %r14
	.word 0xfef389e0  ! 1184: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_1_85:
	setx	0x270309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80420  ! 1188: FMOVRZ	dis not found

T1_asi_reg_wr_58:
	mov	0x3c3, %r14
	.word 0xfef389e0  ! 1189: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_rd_69:
	mov	0x3c8, %r14
	.word 0xfcdb8e60  ! 1191: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T1_asi_reg_wr_59:
	mov	0x29, %r14
	.word 0xf8f38e60  ! 1194: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T1_asi_reg_wr_60:
	mov	0x3c7, %r14
	.word 0xfaf38e60  ! 1197: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T1_asi_reg_rd_70:
	mov	0x12, %r14
	.word 0xf6db8400  ! 1198: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbda98820  ! 1199: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb9a58860  ! 1202: FADDq	dis not found

cpu_intr_1_86:
	setx	0x25011d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_95:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_95), 16, 16)) -> intp(1, 0, 21)
	.word 0xb6b42176  ! 1210: ORNcc_I	orncc 	%r16, 0x0176, %r27
T1_asi_reg_rd_71:
	mov	0x3c6, %r14
	.word 0xf4db8e80  ! 1211: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_1_87:
	setx	0x260025, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_88:
	setx	0x240126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb41520c6  ! 1216: OR_I	or 	%r20, 0x00c6, %r26
	.word 0xb7a00540  ! 1218: FSQRTd	fsqrt	
	.word 0xb5a58840  ! 1219: FADDd	faddd	%f22, %f0, %f26
	.word 0xbf353001  ! 1221: SRLX_I	srlx	%r20, 0x0001, %r31
	.word 0xba3520e7  ! 1222: ORN_I	orn 	%r20, 0x00e7, %r29
T1_asi_reg_rd_72:
	mov	0x3c1, %r14
	.word 0xf8db8e80  ! 1223: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xba958000  ! 1224: ORcc_R	orcc 	%r22, %r0, %r29
cpu_intr_1_89:
	setx	0x25010b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_96:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_96), 16, 16)) -> intp(1, 0, f)
cpu_intr_1_90:
	setx	0x26031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_97:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_97), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb9a589c0  ! 1232: FDIVd	fdivd	%f22, %f0, %f28
	.word 0xb095e105  ! 1237: ORcc_I	orcc 	%r23, 0x0105, %r24
cpu_intr_1_91:
	setx	0x26002d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_92:
	setx	0x260311, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_61:
	mov	0x1d, %r14
	.word 0xf6f389e0  ! 1241: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb5a489a0  ! 1243: FDIVs	fdivs	%f18, %f0, %f26
iob_intr_1_98:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_98), 16, 16)) -> intp(1, 0, 15)
iob_intr_1_99:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_99), 16, 16)) -> intp(1, 0, 6)
cpu_intr_1_93:
	setx	0x26022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8bd8000  ! 1249: XNORcc_R	xnorcc 	%r22, %r0, %r28
	.word 0xbb3ce001  ! 1253: SRA_I	sra 	%r19, 0x0001, %r29
iob_intr_1_100:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_100), 16, 16)) -> intp(1, 0, 0)
	.word 0xb8056003  ! 1258: ADD_I	add 	%r21, 0x0003, %r28
	.word 0xb7aa0820  ! 1260: FMOVA	fmovs	%fcc1, %f0, %f27
cpu_intr_1_94:
	setx	0x26010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00560  ! 1268: FSQRTq	fsqrt	
	.word 0xbfa00520  ! 1270: FSQRTs	fsqrt	
	.word 0xbba00540  ! 1274: FSQRTd	fsqrt	
	.word 0xb7a4c940  ! 1275: FMULd	fmuld	%f50, %f0, %f58
	.word 0xb3ab4820  ! 1276: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xbba80820  ! 1278: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xb3a00540  ! 1281: FSQRTd	fsqrt	
iob_intr_1_101:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_101), 16, 16)) -> intp(1, 0, 31)
	.word 0xb1a509a0  ! 1284: FDIVs	fdivs	%f20, %f0, %f24
	.word 0xb1a5c9a0  ! 1293: FDIVs	fdivs	%f23, %f0, %f24
iob_intr_1_102:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_102), 16, 16)) -> intp(1, 0, b)
iob_intr_1_103:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_103), 16, 16)) -> intp(1, 0, 38)
	.word 0x8195a1ce  ! 1301: WRPR_TPC_I	wrpr	%r22, 0x01ce, %tpc
iob_intr_1_104:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_104), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb5a449a0  ! 1305: FDIVs	fdivs	%f17, %f0, %f26
iob_intr_1_105:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_105), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb9a8c820  ! 1307: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xbfab8820  ! 1310: FMOVPOS	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_62:
	mov	0x2a, %r14
	.word 0xf2f38e40  ! 1311: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_rd_73:
	mov	0x20, %r14
	.word 0xfedb89e0  ! 1313: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T1_asi_reg_rd_74:
	mov	0x3c0, %r14
	.word 0xf4db89e0  ! 1314: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T1_asi_reg_rd_75:
	mov	0x19, %r14
	.word 0xf0db8e40  ! 1317: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_1_95:
	setx	0x260304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a81c20  ! 1320: FMOVRGEZ	dis not found

	.word 0xbd2c3001  ! 1321: SLLX_I	sllx	%r16, 0x0001, %r30
cpu_intr_1_96:
	setx	0x27001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaa4820  ! 1326: FMOVNE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_63:
	mov	0x3c3, %r14
	.word 0xf2f38e80  ! 1331: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbba80420  ! 1333: FMOVRZ	dis not found

	.word 0xbda40920  ! 1335: FMULs	fmuls	%f16, %f0, %f30
iob_intr_1_106:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_106), 16, 16)) -> intp(1, 0, 2b)
iob_intr_1_107:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_107), 16, 16)) -> intp(1, 0, 3f)
T1_asi_reg_wr_64:
	mov	0x20, %r14
	.word 0xf6f38e80  ! 1343: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb3a00040  ! 1346: FMOVd	fmovd	%f0, %f56
	.word 0xb1a5c860  ! 1347: FADDq	dis not found

	.word 0xb3a4c9e0  ! 1348: FDIVq	dis not found

	.word 0xb6248000  ! 1351: SUB_R	sub 	%r18, %r0, %r27
	.word 0xbba80c20  ! 1352: FMOVRLZ	dis not found

	.word 0xbda54940  ! 1355: FMULd	fmuld	%f52, %f0, %f30
	.word 0xbcb521b2  ! 1356: SUBCcc_I	orncc 	%r20, 0x01b2, %r30
	.word 0xb7a80820  ! 1359: FMOVN	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_65:
	mov	0x3c2, %r14
	.word 0xf6f38e60  ! 1364: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_1_97:
	setx	0x28032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a88820  ! 1366: FMOVLE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_76:
	mov	0x3c0, %r14
	.word 0xf4db8e80  ! 1370: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbb520000  ! 1371: RDPR_PIL	<illegal instruction>
cpu_intr_1_98:
	setx	0x2a0114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba408a0  ! 1374: FSUBs	fsubs	%f16, %f0, %f29
	.word 0xb9a5c8e0  ! 1375: FSUBq	dis not found

	.word 0xb7a00040  ! 1377: FMOVd	fmovd	%f0, %f58
T1_asi_reg_wr_66:
	mov	0x3c7, %r14
	.word 0xfcf38400  ! 1378: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb5a00520  ! 1380: FSQRTs	fsqrt	
	.word 0xb5a80c20  ! 1381: FMOVRLZ	dis not found

	.word 0xbdaa0820  ! 1382: FMOVA	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_77:
	mov	0xb, %r14
	.word 0xfcdb84a0  ! 1386: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_1_108:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_108), 16, 16)) -> intp(1, 0, 15)
iob_intr_1_109:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_109), 16, 16)) -> intp(1, 0, 18)
	.word 0xb3a88820  ! 1391: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb48cc000  ! 1392: ANDcc_R	andcc 	%r19, %r0, %r26
T1_asi_reg_wr_67:
	mov	0x1c, %r14
	.word 0xf0f389e0  ! 1393: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_1_110:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_110), 16, 16)) -> intp(1, 0, 25)
iob_intr_1_111:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_111), 16, 16)) -> intp(1, 0, d)
cpu_intr_1_99:
	setx	0x2a012d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_112:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_112), 16, 16)) -> intp(1, 0, f)
	.word 0xb23ca104  ! 1411: XNOR_I	xnor 	%r18, 0x0104, %r25
	.word 0xb7aa8820  ! 1416: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb0b4e02c  ! 1419: ORNcc_I	orncc 	%r19, 0x002c, %r24
	.word 0xb63d603b  ! 1420: XNOR_I	xnor 	%r21, 0x003b, %r27
	.word 0xbda54960  ! 1421: FMULq	dis not found

iob_intr_1_113:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_113), 16, 16)) -> intp(1, 0, 1)
	.word 0xb9a5c960  ! 1425: FMULq	dis not found

cpu_intr_1_100:
	setx	0x290218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba2dc000  ! 1436: ANDN_R	andn 	%r23, %r0, %r29
iob_intr_1_114:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_114), 16, 16)) -> intp(1, 0, 1f)
iob_intr_1_115:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_115), 16, 16)) -> intp(1, 0, 17)
T1_asi_reg_rd_78:
	mov	0xc, %r14
	.word 0xfcdb8e60  ! 1442: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbda80420  ! 1443: FMOVRZ	dis not found

	.word 0xb5a00520  ! 1445: FSQRTs	fsqrt	
	.word 0xb1a48840  ! 1447: FADDd	faddd	%f18, %f0, %f24
	.word 0xb77dc400  ! 1448: MOVR_R	movre	%r23, %r0, %r27
	.word 0xbfa81c20  ! 1450: FMOVRGEZ	dis not found

iob_intr_1_116:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_116), 16, 16)) -> intp(1, 0, 17)
iob_intr_1_117:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_117), 16, 16)) -> intp(1, 0, 34)
	.word 0xbfa80820  ! 1456: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb3a48940  ! 1460: FMULd	fmuld	%f18, %f0, %f56
	lda	[%r21 + %g0] 0xf0, %f2
iob_intr_1_118:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_118), 16, 16)) -> intp(1, 0, 2e)
cpu_intr_1_101:
	setx	0x2a0015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aac820  ! 1466: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb214a16a  ! 1467: OR_I	or 	%r18, 0x016a, %r25
	.word 0xb7a588c0  ! 1471: FSUBd	fsubd	%f22, %f0, %f58
cpu_intr_1_102:
	setx	0x280330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a50920  ! 1473: FMULs	fmuls	%f20, %f0, %f28
	.word 0xb1a408c0  ! 1474: FSUBd	fsubd	%f16, %f0, %f24
iob_intr_1_119:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_119), 16, 16)) -> intp(1, 0, 10)
	.word 0xb37ce401  ! 1477: MOVR_I	movre	%r19, 0x1, %r25
	.word 0xbba81820  ! 1479: FMOVRGZ	fmovs	%fcc3, %f0, %f29
iob_intr_1_120:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_120), 16, 16)) -> intp(1, 0, 16)
iob_intr_1_121:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_121), 16, 16)) -> intp(1, 0, 34)
T1_asi_reg_wr_68:
	mov	0x1f, %r14
	.word 0xfaf38e40  ! 1490: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbfa54860  ! 1492: FADDq	dis not found

	.word 0xb3a4c820  ! 1494: FADDs	fadds	%f19, %f0, %f25
cpu_intr_1_103:
	setx	0x2b0218, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_122:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_122), 16, 16)) -> intp(1, 0, a)
T1_asi_reg_wr_69:
	mov	0x3c4, %r14
	.word 0xfcf38e80  ! 1500: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbda00020  ! 1505: FMOVs	fmovs	%f0, %f30
	.word 0xb1a00020  ! 1508: FMOVs	fmovs	%f0, %f24
iob_intr_1_123:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_123), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_wr_70:
	mov	0x3c6, %r14
	.word 0xfaf38e80  ! 1511: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_1_104:
	setx	0x2b0103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12d8000  ! 1514: SLL_R	sll 	%r22, %r0, %r24
	.word 0xb9a44840  ! 1516: FADDd	faddd	%f48, %f0, %f28
	.word 0xbda00020  ! 1517: FMOVs	fmovs	%f0, %f30
cpu_intr_1_105:
	setx	0x28001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe9c212f  ! 1519: XORcc_I	xorcc 	%r16, 0x012f, %r31
iob_intr_1_124:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_124), 16, 16)) -> intp(1, 0, 0)
iob_intr_1_125:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_125), 16, 16)) -> intp(1, 0, 27)
	.word 0xb8358000  ! 1522: SUBC_R	orn 	%r22, %r0, %r28
T1_asi_reg_wr_71:
	mov	0x3c2, %r14
	.word 0xf6f38e80  ! 1523: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb7a4c820  ! 1526: FADDs	fadds	%f19, %f0, %f27
	.word 0xb9a5c860  ! 1527: FADDq	dis not found

T1_asi_reg_wr_72:
	mov	0x25, %r14
	.word 0xf4f389e0  ! 1529: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_1_106:
	setx	0x2a0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9ab0820  ! 1535: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xb7ab0820  ! 1539: FMOVGU	fmovs	%fcc1, %f0, %f27
cpu_intr_1_107:
	setx	0x280231, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_108:
	setx	0x280213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80c20  ! 1543: FMOVRLZ	dis not found

T1_asi_reg_rd_79:
	mov	0xe, %r14
	.word 0xfadb8e40  ! 1545: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_126:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_126), 16, 16)) -> intp(1, 0, 16)
cpu_intr_1_109:
	setx	0x28003c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_127:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_127), 16, 16)) -> intp(1, 0, 0)
iob_intr_1_128:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_128), 16, 16)) -> intp(1, 0, f)
T1_asi_reg_rd_80:
	mov	0x2b, %r14
	.word 0xf2db8e80  ! 1554: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb3a4c8e0  ! 1556: FSUBq	dis not found

T1_asi_reg_rd_81:
	mov	0x2f, %r14
	.word 0xfcdb89e0  ! 1557: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_1_110:
	setx	0x2b0130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00540  ! 1566: FSQRTd	fsqrt	
T1_asi_reg_wr_73:
	mov	0x1c, %r14
	.word 0xf6f38e40  ! 1567: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_129:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_129), 16, 16)) -> intp(1, 0, 31)
	.word 0xb7a80c20  ! 1569: FMOVRLZ	dis not found

	.word 0xb3a50860  ! 1571: FADDq	dis not found

iob_intr_1_130:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_130), 16, 16)) -> intp(1, 0, 1b)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_74:
	mov	0xa, %r14
	.word 0xf8f38e60  ! 1575: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_1_131:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_131), 16, 16)) -> intp(1, 0, 0)
cpu_intr_1_111:
	setx	0x280131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a9c820  ! 1579: FMOVVS	fmovs	%fcc1, %f0, %f25
iob_intr_1_132:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_132), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_133:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_133), 16, 16)) -> intp(1, 0, 3)
cpu_intr_1_112:
	setx	0x2a0130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a8c820  ! 1586: FMOVL	fmovs	%fcc1, %f0, %f28
iob_intr_1_134:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_134), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_rd_82:
	mov	0x2e, %r14
	.word 0xf0db8e40  ! 1589: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb5abc820  ! 1590: FMOVVC	fmovs	%fcc1, %f0, %f26
iob_intr_1_135:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_135), 16, 16)) -> intp(1, 0, 7)
	.word 0xb1a00560  ! 1594: FSQRTq	fsqrt	
	.word 0xb5a54940  ! 1596: FMULd	fmuld	%f52, %f0, %f26
cpu_intr_1_113:
	setx	0x29011a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_75:
	mov	0x2e, %r14
	.word 0xfcf384a0  ! 1598: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T1_asi_reg_wr_76:
	mov	0x1e, %r14
	.word 0xfcf389e0  ! 1599: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_1_136:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_136), 16, 16)) -> intp(1, 0, 34)
	.word 0xb7a00560  ! 1601: FSQRTq	fsqrt	
	.word 0xbda94820  ! 1602: FMOVCS	fmovs	%fcc1, %f0, %f30
iob_intr_1_137:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_137), 16, 16)) -> intp(1, 0, 35)
cpu_intr_1_114:
	setx	0x2b0127, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_83:
	mov	0x1, %r14
	.word 0xfadb89e0  ! 1609: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T1_asi_reg_wr_77:
	mov	0x2e, %r14
	.word 0xf6f38e60  ! 1610: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T1_asi_reg_wr_78:
	mov	0x32, %r14
	.word 0xf0f38e80  ! 1612: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T1_asi_reg_wr_79:
	mov	0x3c7, %r14
	.word 0xfcf38e60  ! 1613: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T1_asi_reg_rd_84:
	mov	0x36, %r14
	.word 0xf8db8e80  ! 1614: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb9a5c8e0  ! 1615: FSUBq	dis not found

	.word 0xb9a40840  ! 1617: FADDd	faddd	%f16, %f0, %f28
	.word 0xb1a80820  ! 1619: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb5ab4820  ! 1621: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xbfa548e0  ! 1625: FSUBq	dis not found

iob_intr_1_138:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_138), 16, 16)) -> intp(1, 0, d)
	.word 0xb1a8c820  ! 1632: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xbda508a0  ! 1633: FSUBs	fsubs	%f20, %f0, %f30
	.word 0xbfa54860  ! 1634: FADDq	dis not found

	.word 0xbba9c820  ! 1637: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xbda488a0  ! 1638: FSUBs	fsubs	%f18, %f0, %f30
iob_intr_1_139:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_139), 16, 16)) -> intp(1, 0, 2)
cpu_intr_1_115:
	setx	0x280334, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_140:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_140), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb1a90820  ! 1646: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xbf51c000  ! 1647: RDPR_TL	<illegal instruction>
	.word 0xb5a81820  ! 1651: FMOVRGZ	fmovs	%fcc3, %f0, %f26
iob_intr_1_141:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_141), 16, 16)) -> intp(1, 0, 3c)
cpu_intr_1_116:
	setx	0x28023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a58920  ! 1656: FMULs	fmuls	%f22, %f0, %f27
	.word 0xb9aa4820  ! 1657: FMOVNE	fmovs	%fcc1, %f0, %f28
iob_intr_1_142:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_142), 16, 16)) -> intp(1, 0, 2d)
cpu_intr_1_117:
	setx	0x29000b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_118:
	setx	0x2b0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb29d21a1  ! 1662: XORcc_I	xorcc 	%r20, 0x01a1, %r25
T1_asi_reg_rd_85:
	mov	0x4, %r14
	.word 0xfadb84a0  ! 1665: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_1_143:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_143), 16, 16)) -> intp(1, 0, 17)
T1_asi_reg_wr_80:
	mov	0x3c6, %r14
	.word 0xf0f38e80  ! 1669: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb1aac820  ! 1670: FMOVGE	fmovs	%fcc1, %f0, %f24
iob_intr_1_144:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_144), 16, 16)) -> intp(1, 0, 3a)
	.word 0x8394a0dd  ! 1675: WRPR_TNPC_I	wrpr	%r18, 0x00dd, %tnpc
cpu_intr_1_119:
	setx	0x2b0201, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_120:
	setx	0x280215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81c20  ! 1686: FMOVRGEZ	dis not found

iob_intr_1_145:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_145), 16, 16)) -> intp(1, 0, 28)
T1_asi_reg_wr_81:
	mov	0x10, %r14
	.word 0xf2f389e0  ! 1688: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_1_146:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_146), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_rd_86:
	mov	0x25, %r14
	.word 0xf4db8e40  ! 1693: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	lda	[%r21 + %g0] 0xf0, %f2
iob_intr_1_147:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_147), 16, 16)) -> intp(1, 0, 31)
T1_asi_reg_rd_87:
	mov	0x1a, %r14
	.word 0xf6db8e40  ! 1699: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a409c0  ! 1701: FDIVd	fdivd	%f16, %f0, %f24
cpu_intr_1_121:
	setx	0x280325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a9c820  ! 1703: FMOVVS	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_82:
	mov	0x37, %r14
	.word 0xfef38e40  ! 1706: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_rd_88:
	mov	0x12, %r14
	.word 0xf8db8e80  ! 1707: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T1_asi_reg_wr_83:
	mov	0x34, %r14
	.word 0xf2f389e0  ! 1709: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb3a58920  ! 1711: FMULs	fmuls	%f22, %f0, %f25
	.word 0xbba9c820  ! 1712: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb5a44940  ! 1715: FMULd	fmuld	%f48, %f0, %f26
iob_intr_1_148:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_148), 16, 16)) -> intp(1, 0, 35)
	.word 0xb40de180  ! 1718: AND_I	and 	%r23, 0x0180, %r26
	.word 0xbdaa0820  ! 1721: FMOVA	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_89:
	mov	0x27, %r14
	.word 0xfcdb89e0  ! 1724: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb1aa8820  ! 1727: FMOVG	fmovs	%fcc1, %f0, %f24
cpu_intr_1_122:
	setx	0x2b003a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_149:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_149), 16, 16)) -> intp(1, 0, 8)
	.word 0xb8a4c000  ! 1734: SUBcc_R	subcc 	%r19, %r0, %r28
cpu_intr_1_123:
	setx	0x2b022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa449e0  ! 1742: FDIVq	dis not found

iob_intr_1_150:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_150), 16, 16)) -> intp(1, 0, 14)
	.word 0xbda81c20  ! 1746: FMOVRGEZ	dis not found

iob_intr_1_151:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_151), 16, 16)) -> intp(1, 0, 2b)
T1_asi_reg_rd_90:
	mov	0x21, %r14
	.word 0xf8db8e80  ! 1748: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T1_asi_reg_rd_91:
	mov	0x34, %r14
	.word 0xfedb8e60  ! 1750: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T1_asi_reg_rd_92:
	mov	0x2c, %r14
	.word 0xf6db8e40  ! 1752: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb7a4c820  ! 1754: FADDs	fadds	%f19, %f0, %f27
cpu_intr_1_124:
	setx	0x2b0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba588c0  ! 1758: FSUBd	fsubd	%f22, %f0, %f60
	.word 0xb1a449c0  ! 1760: FDIVd	fdivd	%f48, %f0, %f24
	.word 0xbda5c9c0  ! 1762: FDIVd	fdivd	%f54, %f0, %f30
T1_asi_reg_rd_93:
	mov	0x33, %r14
	.word 0xf6db8e40  ! 1763: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_125:
	setx	0x28030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00540  ! 1767: FSQRTd	fsqrt	
T1_asi_reg_wr_84:
	mov	0x33, %r14
	.word 0xfef389e0  ! 1768: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb9abc820  ! 1769: FMOVVC	fmovs	%fcc1, %f0, %f28
iob_intr_1_152:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_152), 16, 16)) -> intp(1, 0, 34)
T1_asi_reg_rd_94:
	mov	0x1e, %r14
	.word 0xfadb8400  ! 1775: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbba00520  ! 1777: FSQRTs	fsqrt	
iob_intr_1_153:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_153), 16, 16)) -> intp(1, 0, a)
iob_intr_1_154:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_154), 16, 16)) -> intp(1, 0, 37)
	.word 0xb5a409c0  ! 1780: FDIVd	fdivd	%f16, %f0, %f26
iob_intr_1_155:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_155), 16, 16)) -> intp(1, 0, 10)
	.word 0xb1a00520  ! 1785: FSQRTs	fsqrt	
	.word 0xb1a80820  ! 1787: FMOVN	fmovs	%fcc1, %f0, %f24
iob_intr_1_156:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_156), 16, 16)) -> intp(1, 0, c)
	.word 0xbfaac820  ! 1795: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb9a00560  ! 1798: FSQRTq	fsqrt	
cpu_intr_1_126:
	setx	0x2a030e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_95:
	mov	0x27, %r14
	.word 0xfadb8400  ! 1801: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbda94820  ! 1802: FMOVCS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_85:
	mov	0x11, %r14
	.word 0xfcf38e80  ! 1807: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb3a50940  ! 1809: FMULd	fmuld	%f20, %f0, %f56
cpu_intr_1_127:
	setx	0x2e012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00520  ! 1811: FSQRTs	fsqrt	
	.word 0xbfa00520  ! 1812: FSQRTs	fsqrt	
cpu_intr_1_128:
	setx	0x2e0013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00560  ! 1815: FSQRTq	fsqrt	
cpu_intr_1_129:
	setx	0x2c0133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00520  ! 1820: FSQRTs	fsqrt	
T1_asi_reg_wr_86:
	mov	0x28, %r14
	.word 0xf4f38e40  ! 1826: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_157:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_157), 16, 16)) -> intp(1, 0, 1f)
cpu_intr_1_130:
	setx	0x2e0236, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_87:
	mov	0xc, %r14
	.word 0xf4f38e80  ! 1830: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb52ce001  ! 1831: SLL_I	sll 	%r19, 0x0001, %r26
	.word 0xbfa81420  ! 1835: FMOVRNZ	dis not found

	.word 0xbfa44920  ! 1836: FMULs	fmuls	%f17, %f0, %f31
	.word 0xb7a00040  ! 1837: FMOVd	fmovd	%f0, %f58
cpu_intr_1_131:
	setx	0x2f0019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4150000  ! 1842: OR_R	or 	%r20, %r0, %r26
cpu_intr_1_132:
	setx	0x2e0133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba448c0  ! 1844: FSUBd	fsubd	%f48, %f0, %f60
cpu_intr_1_133:
	setx	0x2c003a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_134:
	setx	0x2c0216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda509c0  ! 1848: FDIVd	fdivd	%f20, %f0, %f30
cpu_intr_1_135:
	setx	0x2f0312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72d1000  ! 1850: SLLX_R	sllx	%r20, %r0, %r27
T1_asi_reg_rd_96:
	mov	0x38, %r14
	.word 0xf2db8e40  ! 1859: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb9a88820  ! 1864: FMOVLE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_136:
	setx	0x2c0333, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_158:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_158), 16, 16)) -> intp(1, 0, 32)
T1_asi_reg_rd_97:
	mov	0x17, %r14
	.word 0xf4db8e40  ! 1868: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_1_137:
	setx	0x2e0118, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_88:
	mov	0x6, %r14
	.word 0xfcf389e0  ! 1872: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T1_asi_reg_rd_98:
	mov	0x10, %r14
	.word 0xfedb8e80  ! 1876: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_1_138:
	setx	0x2e0111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80c20  ! 1881: FMOVRLZ	dis not found

	.word 0xbda48820  ! 1882: FADDs	fadds	%f18, %f0, %f30
	.word 0xb9a508e0  ! 1886: FSUBq	dis not found

iob_intr_1_159:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_159), 16, 16)) -> intp(1, 0, 3d)
iob_intr_1_160:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_160), 16, 16)) -> intp(1, 0, 16)
	.word 0xb8bc60be  ! 1890: XNORcc_I	xnorcc 	%r17, 0x00be, %r28
	.word 0xb9ab0820  ! 1892: FMOVGU	fmovs	%fcc1, %f0, %f28
cpu_intr_1_139:
	setx	0x2d0030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00540  ! 1894: FSQRTd	fsqrt	
cpu_intr_1_140:
	setx	0x2f022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbca46064  ! 1900: SUBcc_I	subcc 	%r17, 0x0064, %r30
	.word 0xb605a1fa  ! 1902: ADD_I	add 	%r22, 0x01fa, %r27
T1_asi_reg_wr_89:
	mov	0x2c, %r14
	.word 0xf6f38400  ! 1904: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb60461be  ! 1906: ADD_I	add 	%r17, 0x01be, %r27
cpu_intr_1_141:
	setx	0x2c0037, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_90:
	mov	0x1c, %r14
	.word 0xf4f389e0  ! 1908: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb22ce175  ! 1909: ANDN_I	andn 	%r19, 0x0175, %r25
cpu_intr_1_142:
	setx	0x2d0004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb02ce024  ! 1915: ANDN_I	andn 	%r19, 0x0024, %r24
T1_asi_reg_wr_91:
	mov	0x3c1, %r14
	.word 0xf2f38e40  ! 1919: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb3a84820  ! 1920: FMOVE	fmovs	%fcc1, %f0, %f25
cpu_intr_1_143:
	setx	0x2e020e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_99:
	mov	0x7, %r14
	.word 0xf8db8400  ! 1924: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbda9c820  ! 1925: FMOVVS	fmovs	%fcc1, %f0, %f30
cpu_intr_1_144:
	setx	0x2e023a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_100:
	mov	0x10, %r14
	.word 0xfcdb8e80  ! 1931: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T1_asi_reg_wr_92:
	mov	0x3c8, %r14
	.word 0xf4f38e40  ! 1932: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_145:
	setx	0x2f021e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_101:
	mov	0x3c8, %r14
	.word 0xfcdb8400  ! 1936: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbfaa8820  ! 1938: FMOVG	fmovs	%fcc1, %f0, %f31
iob_intr_1_161:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_161), 16, 16)) -> intp(1, 0, 1)
	.word 0xb1a44820  ! 1941: FADDs	fadds	%f17, %f0, %f24
iob_intr_1_162:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_162), 16, 16)) -> intp(1, 0, b)
	.word 0xb1ab0820  ! 1945: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb9a88820  ! 1946: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xbba88820  ! 1949: FMOVLE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_102:
	mov	0x30, %r14
	.word 0xf8db89e0  ! 1950: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb1a81c20  ! 1955: FMOVRGEZ	dis not found

	.word 0xb3a80820  ! 1956: FMOVN	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_103:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 1958: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_1_146:
	setx	0x2f0020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba15200f  ! 1962: OR_I	or 	%r20, 0x000f, %r29
	.word 0xb6044000  ! 1963: ADD_R	add 	%r17, %r0, %r27
	lda	[%r23 + %g0] 0xf0, %f2
	.word 0xbfa00040  ! 1968: FMOVd	fmovd	%f0, %f62
cpu_intr_1_147:
	setx	0x2e021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_148:
	setx	0x2c0322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcbc0000  ! 1974: XNORcc_R	xnorcc 	%r16, %r0, %r30
	.word 0xb9a00040  ! 1975: FMOVd	fmovd	%f0, %f28
T1_asi_reg_wr_93:
	mov	0x3c6, %r14
	.word 0xf2f38400  ! 1976: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbba4c820  ! 1978: FADDs	fadds	%f19, %f0, %f29
cpu_intr_1_149:
	setx	0x2d0201, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_104:
	mov	0x18, %r14
	.word 0xfadb8400  ! 1985: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb2148000  ! 1990: OR_R	or 	%r18, %r0, %r25
	.word 0xbba00540  ! 1993: FSQRTd	fsqrt	
	.word 0xbfa588e0  ! 1994: FSUBq	dis not found

	.word 0xbdab4820  ! 1996: FMOVCC	fmovs	%fcc1, %f0, %f30
iob_intr_1_163:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_163), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_rd_105:
	mov	0x8, %r14
	.word 0xf2db8e80  ! 2000: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb1ab4820  ! 2002: FMOVCC	fmovs	%fcc1, %f0, %f24
cpu_intr_1_150:
	setx	0x2e0230, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_106:
	mov	0x2d, %r14
	.word 0xf4db8e80  ! 2004: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T1_asi_reg_wr_94:
	mov	0x5, %r14
	.word 0xfef38e40  ! 2006: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_wr_95:
	mov	0x3c3, %r14
	.word 0xfef38e40  ! 2008: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_wr_96:
	mov	0x26, %r14
	.word 0xf0f384a0  ! 2012: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb3a80820  ! 2014: FMOVN	fmovs	%fcc1, %f0, %f25
iob_intr_1_164:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_164), 16, 16)) -> intp(1, 0, 33)
	.word 0xb7a44860  ! 2018: FADDq	dis not found

cpu_intr_1_151:
	setx	0x2e0137, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_107:
	mov	0x19, %r14
	.word 0xf0db89e0  ! 2020: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_1_165:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_165), 16, 16)) -> intp(1, 0, 8)
	.word 0xb3a81820  ! 2024: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb9a40820  ! 2031: FADDs	fadds	%f16, %f0, %f28
	.word 0xb3a40820  ! 2033: FADDs	fadds	%f16, %f0, %f25
	.word 0xb1a5c840  ! 2034: FADDd	faddd	%f54, %f0, %f24
T1_asi_reg_rd_108:
	mov	0x23, %r14
	.word 0xfcdb89e0  ! 2035: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T1_asi_reg_wr_97:
	mov	0x24, %r14
	.word 0xf4f389e0  ! 2038: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb1ab8820  ! 2039: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb9aa8820  ! 2043: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xb1aa0820  ! 2044: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb5a00040  ! 2046: FMOVd	fmovd	%f0, %f26
cpu_intr_1_152:
	setx	0x2c0311, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_166:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_166), 16, 16)) -> intp(1, 0, 23)
iob_intr_1_167:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_167), 16, 16)) -> intp(1, 0, b)
	.word 0xb9a00540  ! 2051: FSQRTd	fsqrt	
cpu_intr_1_153:
	setx	0x2f0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xb3a54820  ! 2055: FADDs	fadds	%f21, %f0, %f25
iob_intr_1_168:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_168), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb7a4c920  ! 2058: FMULs	fmuls	%f19, %f0, %f27
cpu_intr_1_154:
	setx	0x2f0327, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_109:
	mov	0x11, %r14
	.word 0xf4db8e80  ! 2060: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb9a588a0  ! 2062: FSUBs	fsubs	%f22, %f0, %f28
iob_intr_1_169:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_169), 16, 16)) -> intp(1, 0, 2d)
iob_intr_1_170:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_170), 16, 16)) -> intp(1, 0, 39)
	.word 0xb3abc820  ! 2070: FMOVVC	fmovs	%fcc1, %f0, %f25
iob_intr_1_171:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_171), 16, 16)) -> intp(1, 0, 1c)
	.word 0xbb7c4400  ! 2075: MOVR_R	movre	%r17, %r0, %r29
	.word 0xbfa80820  ! 2076: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
iob_intr_1_172:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_172), 16, 16)) -> intp(1, 0, 1a)
cpu_intr_1_155:
	setx	0x2f0330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a98820  ! 2089: FMOVNEG	fmovs	%fcc1, %f0, %f28
cpu_intr_1_156:
	setx	0x2d0014, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_110:
	mov	0x3c8, %r14
	.word 0xf8db89e0  ! 2092: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb3a81c20  ! 2093: FMOVRGEZ	dis not found

	.word 0xb3a508c0  ! 2094: FSUBd	fsubd	%f20, %f0, %f56
	.word 0xb5a489c0  ! 2100: FDIVd	fdivd	%f18, %f0, %f26
T1_asi_reg_wr_98:
	mov	0x2c, %r14
	.word 0xf6f38e40  ! 2104: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb5ab0820  ! 2105: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb1a449a0  ! 2110: FDIVs	fdivs	%f17, %f0, %f24
	.word 0xb3a00040  ! 2116: FMOVd	fmovd	%f0, %f56
	.word 0xb1a54940  ! 2118: FMULd	fmuld	%f52, %f0, %f24
iob_intr_1_173:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_173), 16, 16)) -> intp(1, 0, 1d)
	.word 0xbba40820  ! 2123: FADDs	fadds	%f16, %f0, %f29
	.word 0xb9a4c8c0  ! 2124: FSUBd	fsubd	%f50, %f0, %f28
T1_asi_reg_rd_111:
	mov	0x15, %r14
	.word 0xfadb8e40  ! 2125: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb9aa4820  ! 2126: FMOVNE	fmovs	%fcc1, %f0, %f28
iob_intr_1_174:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_174), 16, 16)) -> intp(1, 0, 22)
	.word 0xb1a48920  ! 2128: FMULs	fmuls	%f18, %f0, %f24
T1_asi_reg_rd_112:
	mov	0x3c3, %r14
	.word 0xf0db84a0  ! 2131: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_1_157:
	setx	0x2d0022, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_113:
	mov	0x6, %r14
	.word 0xfedb8e40  ! 2133: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb435c000  ! 2134: ORN_R	orn 	%r23, %r0, %r26
cpu_intr_1_158:
	setx	0x2d0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0bd21d3  ! 2136: XNORcc_I	xnorcc 	%r20, 0x01d3, %r24
	.word 0xb0240000  ! 2139: SUB_R	sub 	%r16, %r0, %r24
	.word 0xb3a81c20  ! 2145: FMOVRGEZ	dis not found

iob_intr_1_175:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_175), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_159:
	setx	0x2c033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba548c0  ! 2150: FSUBd	fsubd	%f52, %f0, %f60
	.word 0xbb2dd000  ! 2157: SLLX_R	sllx	%r23, %r0, %r29
	.word 0xb9aac820  ! 2163: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xb7a80420  ! 2165: FMOVRZ	dis not found

cpu_intr_1_160:
	setx	0x2f0324, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_161:
	setx	0x2c0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80c20  ! 2174: FMOVRLZ	dis not found

iob_intr_1_176:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_176), 16, 16)) -> intp(1, 0, 25)
T1_asi_reg_wr_99:
	mov	0x20, %r14
	.word 0xf6f38e40  ! 2178: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_162:
	setx	0x2c0227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00040  ! 2180: FMOVd	fmovd	%f0, %f62
iob_intr_1_177:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_177), 16, 16)) -> intp(1, 0, 37)
	.word 0xbda409a0  ! 2184: FDIVs	fdivs	%f16, %f0, %f30
iob_intr_1_178:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_178), 16, 16)) -> intp(1, 0, a)
T1_asi_reg_rd_114:
	mov	0x14, %r14
	.word 0xf8db89e0  ! 2187: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xbd354000  ! 2190: SRL_R	srl 	%r21, %r0, %r30
	.word 0xb13d9000  ! 2193: SRAX_R	srax	%r22, %r0, %r24
iob_intr_1_179:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_179), 16, 16)) -> intp(1, 0, e)
	.word 0xbba408e0  ! 2201: FSUBq	dis not found

	.word 0xb1a88820  ! 2202: FMOVLE	fmovs	%fcc1, %f0, %f24
iob_intr_1_180:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_180), 16, 16)) -> intp(1, 0, 18)
	.word 0xb3a48860  ! 2205: FADDq	dis not found

iob_intr_1_181:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_181), 16, 16)) -> intp(1, 0, 4)
iob_intr_1_182:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_182), 16, 16)) -> intp(1, 0, 32)
cpu_intr_1_163:
	setx	0x2f0115, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_183:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_183), 16, 16)) -> intp(1, 0, 1d)
T1_asi_reg_wr_100:
	mov	0x12, %r14
	.word 0xfaf384a0  ! 2210: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_1_184:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_184), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_wr_101:
	mov	0x5, %r14
	.word 0xfef38e40  ! 2214: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_185:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_185), 16, 16)) -> intp(1, 0, 3a)
T1_asi_reg_wr_102:
	mov	0x30, %r14
	.word 0xf2f38e40  ! 2217: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb7a94820  ! 2218: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xbdaac820  ! 2219: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb634c000  ! 2220: ORN_R	orn 	%r19, %r0, %r27
	.word 0xb12cd000  ! 2227: SLLX_R	sllx	%r19, %r0, %r24
	.word 0xb434c000  ! 2229: ORN_R	orn 	%r19, %r0, %r26
	.word 0xb7a00020  ! 2231: FMOVs	fmovs	%f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_115:
	mov	0x25, %r14
	.word 0xfedb89e0  ! 2234: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T1_asi_reg_rd_116:
	mov	0x30, %r14
	.word 0xf2db8e40  ! 2237: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb1ab8820  ! 2240: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb5a8c820  ! 2242: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xbba58840  ! 2245: FADDd	faddd	%f22, %f0, %f60
	.word 0xb1a81c20  ! 2246: FMOVRGEZ	dis not found

	.word 0xb7a84820  ! 2247: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb3a90820  ! 2248: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xbda88820  ! 2253: FMOVLE	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_117:
	mov	0x26, %r14
	.word 0xf8db8e40  ! 2254: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_rd_118:
	mov	0x5, %r14
	.word 0xfadb8e60  ! 2258: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_1_186:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_186), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb9a00560  ! 2260: FSQRTq	fsqrt	
	.word 0xbba00560  ! 2261: FSQRTq	fsqrt	
T1_asi_reg_wr_103:
	mov	0x1b, %r14
	.word 0xf6f38e80  ! 2263: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb5a80420  ! 2265: FMOVRZ	dis not found

T1_asi_reg_rd_119:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 2266: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb7a00520  ! 2268: FSQRTs	fsqrt	
iob_intr_1_187:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_187), 16, 16)) -> intp(1, 0, 15)
	.word 0xbba80420  ! 2271: FMOVRZ	dis not found

iob_intr_1_188:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_188), 16, 16)) -> intp(1, 0, 13)
	.word 0xbda81c20  ! 2273: FMOVRGEZ	dis not found

	.word 0xbda4c9e0  ! 2281: FDIVq	dis not found

	.word 0xb7ab8820  ! 2283: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xb72da001  ! 2285: SLL_I	sll 	%r22, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a81c20  ! 2290: FMOVRGEZ	dis not found

	.word 0xb0c5c000  ! 2291: ADDCcc_R	addccc 	%r23, %r0, %r24
	.word 0xb5ab0820  ! 2295: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb73cb001  ! 2300: SRAX_I	srax	%r18, 0x0001, %r27
T1_asi_reg_wr_104:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 2301: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_rd_120:
	mov	0x28, %r14
	.word 0xfedb8e60  ! 2302: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T1_asi_reg_rd_121:
	mov	0x3c4, %r14
	.word 0xf4db8e40  ! 2305: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xb4bd4000  ! 2308: XNORcc_R	xnorcc 	%r21, %r0, %r26
	.word 0xbec4c000  ! 2310: ADDCcc_R	addccc 	%r19, %r0, %r31
T1_asi_reg_wr_105:
	mov	0x6, %r14
	.word 0xf2f38e40  ! 2311: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb5aac820  ! 2312: FMOVGE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_164:
	setx	0x300106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8c420e4  ! 2314: ADDCcc_I	addccc 	%r16, 0x00e4, %r28
	.word 0xb5a00540  ! 2317: FSQRTd	fsqrt	
	.word 0xb3a48820  ! 2319: FADDs	fadds	%f18, %f0, %f25
	.word 0xb7a81820  ! 2322: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xbfa00560  ! 2323: FSQRTq	fsqrt	
iob_intr_1_189:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_189), 16, 16)) -> intp(1, 0, 20)
	.word 0xb01da026  ! 2325: XOR_I	xor 	%r22, 0x0026, %r24
T1_asi_reg_wr_106:
	mov	0x3c4, %r14
	.word 0xf8f38400  ! 2327: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb9a5c840  ! 2328: FADDd	faddd	%f54, %f0, %f28
iob_intr_1_190:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_190), 16, 16)) -> intp(1, 0, a)
	.word 0xb7a44940  ! 2333: FMULd	fmuld	%f48, %f0, %f58
	.word 0xb1a00560  ! 2336: FSQRTq	fsqrt	
	.word 0xbfa588e0  ! 2337: FSUBq	dis not found

iob_intr_1_191:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_191), 16, 16)) -> intp(1, 0, 18)
cpu_intr_1_165:
	setx	0x330331, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_192:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_192), 16, 16)) -> intp(1, 0, 25)
	.word 0xb8b4c000  ! 2347: ORNcc_R	orncc 	%r19, %r0, %r28
	.word 0xb3a409e0  ! 2350: FDIVq	dis not found

	.word 0xb614e109  ! 2351: OR_I	or 	%r19, 0x0109, %r27
T1_asi_reg_rd_122:
	mov	0x3c8, %r14
	.word 0xf8db8e60  ! 2352: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T1_asi_reg_wr_107:
	mov	0x3c5, %r14
	.word 0xfcf38e40  ! 2355: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T1_asi_reg_wr_108:
	mov	0x3c4, %r14
	.word 0xf8f389e0  ! 2356: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_1_166:
	setx	0x300223, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_109:
	mov	0x24, %r14
	.word 0xf0f38e40  ! 2365: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbdab0820  ! 2369: FMOVGU	fmovs	%fcc1, %f0, %f30
iob_intr_1_193:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_193), 16, 16)) -> intp(1, 0, a)
cpu_intr_1_167:
	setx	0x30003a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_110:
	mov	0x1e, %r14
	.word 0xfaf38e40  ! 2378: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_1_168:
	setx	0x310201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c9c0  ! 2384: FDIVd	fdivd	%f54, %f0, %f58
	.word 0xb1a00520  ! 2385: FSQRTs	fsqrt	
iob_intr_1_194:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_194), 16, 16)) -> intp(1, 0, 28)
T1_asi_reg_rd_123:
	mov	0xe, %r14
	.word 0xf4db8e80  ! 2389: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_1_169:
	setx	0x300137, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_170:
	setx	0x32032b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_111:
	mov	0x1a, %r14
	.word 0xfcf38e60  ! 2398: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb834e003  ! 2403: SUBC_I	orn 	%r19, 0x0003, %r28
	.word 0xbba00520  ! 2409: FSQRTs	fsqrt	
T1_asi_reg_wr_112:
	mov	0x15, %r14
	.word 0xf4f384a0  ! 2411: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb1a509a0  ! 2412: FDIVs	fdivs	%f20, %f0, %f24
	.word 0xb5a94820  ! 2416: FMOVCS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_124:
	mov	0x11, %r14
	.word 0xf8db8e40  ! 2418: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbbab0820  ! 2420: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb7a5c9e0  ! 2422: FDIVq	dis not found

cpu_intr_1_171:
	setx	0x300006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab8820  ! 2424: FMOVPOS	fmovs	%fcc1, %f0, %f25
iob_intr_1_195:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_195), 16, 16)) -> intp(1, 0, e)
	.word 0xbda00560  ! 2432: FSQRTq	fsqrt	
	.word 0x8395e074  ! 2436: WRPR_TNPC_I	wrpr	%r23, 0x0074, %tnpc
T1_asi_reg_rd_125:
	mov	0x20, %r14
	.word 0xfedb8e60  ! 2439: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T1_asi_reg_rd_126:
	mov	0x3c6, %r14
	.word 0xfedb8e60  ! 2440: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T1_asi_reg_wr_113:
	mov	0x6, %r14
	.word 0xf2f38e80  ! 2443: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb1a48960  ! 2444: FMULq	dis not found

	.word 0xb43c60f7  ! 2445: XNOR_I	xnor 	%r17, 0x00f7, %r26
iob_intr_1_196:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_196), 16, 16)) -> intp(1, 0, 3a)
	.word 0xbba94820  ! 2450: FMOVCS	fmovs	%fcc1, %f0, %f29
cpu_intr_1_172:
	setx	0x330338, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_173:
	setx	0x310228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a589a0  ! 2455: FDIVs	fdivs	%f22, %f0, %f26
	.word 0xb3a88820  ! 2456: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb3a00540  ! 2460: FSQRTd	fsqrt	
	.word 0xb7aa0820  ! 2461: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb045a118  ! 2467: ADDC_I	addc 	%r22, 0x0118, %r24
cpu_intr_1_174:
	setx	0x30012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a9c820  ! 2472: FMOVVS	fmovs	%fcc1, %f0, %f25
iob_intr_1_197:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_197), 16, 16)) -> intp(1, 0, 18)
	.word 0xb1ab4820  ! 2474: FMOVCC	fmovs	%fcc1, %f0, %f24
iob_intr_1_198:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_198), 16, 16)) -> intp(1, 0, 3f)
T1_asi_reg_wr_114:
	mov	0x24, %r14
	.word 0xf6f38400  ! 2477: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_1_175:
	setx	0x330104, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_199:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_199), 16, 16)) -> intp(1, 0, 32)
	.word 0xb5a00560  ! 2481: FSQRTq	fsqrt	
	.word 0xb3a50940  ! 2483: FMULd	fmuld	%f20, %f0, %f56
	.word 0xb3a48960  ! 2484: FMULq	dis not found

cpu_intr_1_176:
	setx	0x30023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba81420  ! 2488: FMOVRNZ	dis not found

	.word 0xb7ab0820  ! 2489: FMOVGU	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_115:
	mov	0x3c1, %r14
	.word 0xf2f38e40  ! 2494: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb1a509e0  ! 2496: FDIVq	dis not found

	.word 0xb1a80c20  ! 2497: FMOVRLZ	dis not found

T1_asi_reg_wr_116:
	mov	0x1, %r14
	.word 0xf0f389e0  ! 2499: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_1_177:
	setx	0x310305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a4c8e0  ! 2504: FSUBq	dis not found

cpu_intr_1_178:
	setx	0x300128, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_179:
	setx	0x300336, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_200:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_200), 16, 16)) -> intp(1, 0, 9)
	.word 0xb7a50840  ! 2516: FADDd	faddd	%f20, %f0, %f58
	lda	[%r22 + %g0] 0xf0, %f2
iob_intr_1_201:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_201), 16, 16)) -> intp(1, 0, 17)
iob_intr_1_202:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_202), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb5a80820  ! 2524: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xba95607b  ! 2529: ORcc_I	orcc 	%r21, 0x007b, %r29
	.word 0xb9a50860  ! 2530: FADDq	dis not found

iob_intr_1_203:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_203), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_wr_117:
	mov	0x16, %r14
	.word 0xf8f38e40  ! 2532: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_1_204:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_204), 16, 16)) -> intp(1, 0, 21)
	.word 0xba25c000  ! 2534: SUB_R	sub 	%r23, %r0, %r29
	.word 0xb1aa4820  ! 2535: FMOVNE	fmovs	%fcc1, %f0, %f24
iob_intr_1_205:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_205), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb3a54820  ! 2539: FADDs	fadds	%f21, %f0, %f25
	.word 0xb7a549c0  ! 2540: FDIVd	fdivd	%f52, %f0, %f58
	.word 0xb1aa0820  ! 2542: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb6ac8000  ! 2544: ANDNcc_R	andncc 	%r18, %r0, %r27
cpu_intr_1_180:
	setx	0x31011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00540  ! 2547: FSQRTd	fsqrt	
iob_intr_1_206:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_206), 16, 16)) -> intp(1, 0, 24)
iob_intr_1_207:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_207), 16, 16)) -> intp(1, 0, 1c)
cpu_intr_1_181:
	setx	0x310318, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_208:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_208), 16, 16)) -> intp(1, 0, 15)
iob_intr_1_209:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_209), 16, 16)) -> intp(1, 0, 1f)
T1_asi_reg_wr_118:
	mov	0x1b, %r14
	.word 0xfcf38400  ! 2562: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb3a508e0  ! 2564: FSUBq	dis not found

	.word 0xb6c44000  ! 2567: ADDCcc_R	addccc 	%r17, %r0, %r27
	.word 0xbfa00520  ! 2568: FSQRTs	fsqrt	
	.word 0xb7a84820  ! 2569: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xbba00020  ! 2570: FMOVs	fmovs	%f0, %f29
cpu_intr_1_182:
	setx	0x300115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc0c6052  ! 2574: AND_I	and 	%r17, 0x0052, %r30
cpu_intr_1_183:
	setx	0x300219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb351c000  ! 2578: RDPR_TL	<illegal instruction>
iob_intr_1_210:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_210), 16, 16)) -> intp(1, 0, 10)
	.word 0xb1ab8820  ! 2581: FMOVPOS	fmovs	%fcc1, %f0, %f24
iob_intr_1_211:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_211), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_rd_127:
	mov	0x3c6, %r14
	.word 0xf2db84a0  ! 2584: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_1_212:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_212), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbb518000  ! 2589: RDPR_PSTATE	<illegal instruction>
	.word 0xb9a48860  ! 2590: FADDq	dis not found

iob_intr_1_213:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_213), 16, 16)) -> intp(1, 0, 23)
cpu_intr_1_184:
	setx	0x330007, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_214:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_214), 16, 16)) -> intp(1, 0, 3)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_215:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_215), 16, 16)) -> intp(1, 0, 17)
T1_asi_reg_rd_128:
	mov	0x13, %r14
	.word 0xfedb84a0  ! 2603: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_1_216:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_216), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb5a5c9a0  ! 2605: FDIVs	fdivs	%f23, %f0, %f26
	.word 0xb3a5c920  ! 2606: FMULs	fmuls	%f23, %f0, %f25
	.word 0xbd3d3001  ! 2608: SRAX_I	srax	%r20, 0x0001, %r30
	.word 0xb5aa0820  ! 2609: FMOVA	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_129:
	mov	0x1d, %r14
	.word 0xfcdb8400  ! 2611: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T1_asi_reg_rd_130:
	mov	0x10, %r14
	.word 0xfcdb8e60  ! 2613: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb7a80420  ! 2616: FMOVRZ	dis not found

	.word 0x81952111  ! 2617: WRPR_TPC_I	wrpr	%r20, 0x0111, %tpc
iob_intr_1_217:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_217), 16, 16)) -> intp(1, 0, 1c)
	.word 0xbfa548c0  ! 2619: FSUBd	fsubd	%f52, %f0, %f62
iob_intr_1_218:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_218), 16, 16)) -> intp(1, 0, 3)
	.word 0xbba00520  ! 2624: FSQRTs	fsqrt	
T1_asi_reg_wr_119:
	mov	0x3c2, %r14
	.word 0xf6f38400  ! 2626: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	lda	[%r19 + %g0] 0xf0, %f2
iob_intr_1_219:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_219), 16, 16)) -> intp(1, 0, 21)
iob_intr_1_220:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_220), 16, 16)) -> intp(1, 0, e)
	.word 0xbc0461a8  ! 2634: ADD_I	add 	%r17, 0x01a8, %r30
	.word 0xb5a90820  ! 2639: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xb1a81c20  ! 2641: FMOVRGEZ	dis not found

iob_intr_1_221:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_221), 16, 16)) -> intp(1, 0, 14)
	.word 0xb5a5c8c0  ! 2645: FSUBd	fsubd	%f54, %f0, %f26
	.word 0xb7a00040  ! 2646: FMOVd	fmovd	%f0, %f58
	.word 0xbfa9c820  ! 2647: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xbba81c20  ! 2651: FMOVRGEZ	dis not found

iob_intr_1_222:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_222), 16, 16)) -> intp(1, 0, 33)
T1_asi_reg_rd_131:
	mov	0x3c5, %r14
	.word 0xf8db8e60  ! 2654: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xbb7cc400  ! 2655: MOVR_R	movre	%r19, %r0, %r29
T1_asi_reg_rd_132:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 2658: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_wr_120:
	mov	0x12, %r14
	.word 0xf8f38e40  ! 2659: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbba90820  ! 2660: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb3a44940  ! 2663: FMULd	fmuld	%f48, %f0, %f56
iob_intr_1_223:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_223), 16, 16)) -> intp(1, 0, c)
cpu_intr_1_185:
	setx	0x30022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6844000  ! 2668: ADDcc_R	addcc 	%r17, %r0, %r27
iob_intr_1_224:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_224), 16, 16)) -> intp(1, 0, 12)
iob_intr_1_225:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_225), 16, 16)) -> intp(1, 0, 20)
T1_asi_reg_rd_133:
	mov	0x11, %r14
	.word 0xf8db8e40  ! 2677: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_1_226:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_226), 16, 16)) -> intp(1, 0, 31)
cpu_intr_1_186:
	setx	0x3000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_121:
	mov	0x3c7, %r14
	.word 0xf4f38e80  ! 2684: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_1_227:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_227), 16, 16)) -> intp(1, 0, 22)
iob_intr_1_228:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_228), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_187:
	setx	0x330129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba90820  ! 2699: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb7a509c0  ! 2700: FDIVd	fdivd	%f20, %f0, %f58
	.word 0xbfa00540  ! 2705: FSQRTd	fsqrt	
cpu_intr_1_188:
	setx	0x310323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00020  ! 2707: FMOVs	fmovs	%f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_229:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_229), 16, 16)) -> intp(1, 0, 37)
	.word 0xb7aa8820  ! 2714: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb9a81420  ! 2718: FMOVRNZ	dis not found

	.word 0xbba40820  ! 2720: FADDs	fadds	%f16, %f0, %f29
	.word 0xb9aa0820  ! 2721: FMOVA	fmovs	%fcc1, %f0, %f28
cpu_intr_1_189:
	setx	0x30001a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_230:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_230), 16, 16)) -> intp(1, 0, 7)
	.word 0xb3a449c0  ! 2728: FDIVd	fdivd	%f48, %f0, %f56
iob_intr_1_231:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_231), 16, 16)) -> intp(1, 0, 12)
	.word 0xb3ab4820  ! 2730: FMOVCC	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_122:
	mov	0xf, %r14
	.word 0xf0f38e80  ! 2732: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_1_190:
	setx	0x360221, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_191:
	setx	0x370004, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_232:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_232), 16, 16)) -> intp(1, 0, 9)
iob_intr_1_233:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_233), 16, 16)) -> intp(1, 0, 8)
	.word 0xbfaa4820  ! 2740: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb3a80820  ! 2741: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb60520e3  ! 2748: ADD_I	add 	%r20, 0x00e3, %r27
	.word 0xb2a44000  ! 2749: SUBcc_R	subcc 	%r17, %r0, %r25
	.word 0xbba548c0  ! 2750: FSUBd	fsubd	%f52, %f0, %f60
	.word 0xbc358000  ! 2754: SUBC_R	orn 	%r22, %r0, %r30
T1_asi_reg_wr_123:
	mov	0x0, %r14
	.word 0xf0f38e40  ! 2755: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_wr_124:
	mov	0x32, %r14
	.word 0xfcf384a0  ! 2757: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_1_234:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_234), 16, 16)) -> intp(1, 0, 3c)
	.word 0xbda00020  ! 2760: FMOVs	fmovs	%f0, %f30
	.word 0xb9a48920  ! 2762: FMULs	fmuls	%f18, %f0, %f28
	.word 0xbda54960  ! 2764: FMULq	dis not found

T1_asi_reg_rd_134:
	mov	0x17, %r14
	.word 0xf0db8e40  ! 2765: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbda4c9c0  ! 2768: FDIVd	fdivd	%f50, %f0, %f30
	.word 0xb1a50940  ! 2770: FMULd	fmuld	%f20, %f0, %f24
	.word 0xbf540000  ! 2771: RDPR_GL	<illegal instruction>
	.word 0xbda588c0  ! 2773: FSUBd	fsubd	%f22, %f0, %f30
	.word 0xbb2dd000  ! 2775: SLLX_R	sllx	%r23, %r0, %r29
T1_asi_reg_rd_135:
	mov	0x3c5, %r14
	.word 0xf2db8400  ! 2777: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xbfa40940  ! 2780: FMULd	fmuld	%f16, %f0, %f62
	.word 0xb7a589a0  ! 2781: FDIVs	fdivs	%f22, %f0, %f27
	.word 0xb5a81420  ! 2782: FMOVRNZ	dis not found

iob_intr_1_235:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_235), 16, 16)) -> intp(1, 0, 1b)
iob_intr_1_236:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_236), 16, 16)) -> intp(1, 0, 18)
T1_asi_reg_rd_136:
	mov	0x19, %r14
	.word 0xfcdb84a0  ! 2790: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T1_asi_reg_rd_137:
	mov	0x3c6, %r14
	.word 0xf0db8e80  ! 2791: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb57c8400  ! 2792: MOVR_R	movre	%r18, %r0, %r26
	.word 0xbdab8820  ! 2793: FMOVPOS	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_237:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_237), 16, 16)) -> intp(1, 0, 1c)
	.word 0xa1902002  ! 2797: WRPR_GL_I	wrpr	%r0, 0x0002, %-
T1_asi_reg_rd_138:
	mov	0x16, %r14
	.word 0xf0db8e40  ! 2798: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_rd_139:
	mov	0x3c8, %r14
	.word 0xfadb8e80  ! 2799: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T1_asi_reg_wr_125:
	mov	0x38, %r14
	.word 0xf2f38e40  ! 2800: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbdabc820  ! 2801: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xb7a00520  ! 2805: FSQRTs	fsqrt	
	.word 0xb8340000  ! 2810: SUBC_R	orn 	%r16, %r0, %r28
T1_asi_reg_rd_140:
	mov	0x3c7, %r14
	.word 0xf4db84a0  ! 2811: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb1ab8820  ! 2816: FMOVPOS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_141:
	mov	0x3c3, %r14
	.word 0xf4db8e40  ! 2818: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_1_192:
	setx	0x36021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80820  ! 2821: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb3a54920  ! 2822: FMULs	fmuls	%f21, %f0, %f25
	.word 0xbbaac820  ! 2824: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xb5a80c20  ! 2825: FMOVRLZ	dis not found

cpu_intr_1_193:
	setx	0x37013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80420  ! 2829: FMOVRZ	dis not found

iob_intr_1_238:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_238), 16, 16)) -> intp(1, 0, e)
cpu_intr_1_194:
	setx	0x36011f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_126:
	mov	0x15, %r14
	.word 0xfaf38400  ! 2835: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_1_239:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_239), 16, 16)) -> intp(1, 0, 16)
	.word 0xb1a81c20  ! 2838: FMOVRGEZ	dis not found

iob_intr_1_240:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_240), 16, 16)) -> intp(1, 0, 26)
	.word 0xb4944000  ! 2844: ORcc_R	orcc 	%r17, %r0, %r26
T1_asi_reg_wr_127:
	mov	0x3c3, %r14
	.word 0xf4f384a0  ! 2849: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T1_asi_reg_wr_128:
	mov	0x3c4, %r14
	.word 0xf4f38e40  ! 2851: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_wr_129:
	mov	0x16, %r14
	.word 0xfaf38e80  ! 2852: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbf518000  ! 2855: RDPR_PSTATE	<illegal instruction>
	.word 0xb5a94820  ! 2857: FMOVCS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_130:
	mov	0x12, %r14
	.word 0xf6f38e40  ! 2859: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb22d21eb  ! 2862: ANDN_I	andn 	%r20, 0x01eb, %r25
	.word 0x8395a1ab  ! 2864: WRPR_TNPC_I	wrpr	%r22, 0x01ab, %tnpc
T1_asi_reg_rd_142:
	mov	0x3c2, %r14
	.word 0xfedb8e60  ! 2865: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T1_asi_reg_rd_143:
	mov	0x18, %r14
	.word 0xfedb8e40  ! 2866: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb5a5c860  ! 2868: FADDq	dis not found

	.word 0xb1a54840  ! 2872: FADDd	faddd	%f52, %f0, %f24
cpu_intr_1_195:
	setx	0x36013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a488c0  ! 2874: FSUBd	fsubd	%f18, %f0, %f26
	.word 0xb1ab4820  ! 2880: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xbfa40940  ! 2881: FMULd	fmuld	%f16, %f0, %f62
	.word 0xbda80420  ! 2882: FMOVRZ	dis not found

cpu_intr_1_196:
	setx	0x34021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb340000  ! 2889: SRL_R	srl 	%r16, %r0, %r29
iob_intr_1_241:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_241), 16, 16)) -> intp(1, 0, 14)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_197:
	setx	0x340222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c920  ! 2898: FMULs	fmuls	%f23, %f0, %f27
cpu_intr_1_198:
	setx	0x340104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda8c820  ! 2901: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb7a00520  ! 2902: FSQRTs	fsqrt	
iob_intr_1_242:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_242), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb5ab4820  ! 2907: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xbfa48960  ! 2909: FMULq	dis not found

cpu_intr_1_199:
	setx	0x34011d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_144:
	mov	0x3c8, %r14
	.word 0xfadb8e80  ! 2912: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xbd2c2001  ! 2914: SLL_I	sll 	%r16, 0x0001, %r30
iob_intr_1_243:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_243), 16, 16)) -> intp(1, 0, 34)
	.word 0xb61d0000  ! 2917: XOR_R	xor 	%r20, %r0, %r27
	.word 0xb3a00560  ! 2919: FSQRTq	fsqrt	
iob_intr_1_244:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_244), 16, 16)) -> intp(1, 0, 15)
iob_intr_1_245:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_245), 16, 16)) -> intp(1, 0, 36)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a00020  ! 2932: FMOVs	fmovs	%f0, %f25
T1_asi_reg_rd_145:
	mov	0x1b, %r14
	.word 0xf0db8400  ! 2935: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_wr_131:
	mov	0x6, %r14
	.word 0xf2f38e60  ! 2937: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_1_246:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_246), 16, 16)) -> intp(1, 0, 6)
iob_intr_1_247:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_247), 16, 16)) -> intp(1, 0, 23)
iob_intr_1_248:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_248), 16, 16)) -> intp(1, 0, 11)
	.word 0x87942178  ! 2945: WRPR_TT_I	wrpr	%r16, 0x0178, %tt
	.word 0xb7aac820  ! 2946: FMOVGE	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a00520  ! 2950: FSQRTs	fsqrt	
	.word 0xb0b5215d  ! 2954: SUBCcc_I	orncc 	%r20, 0x015d, %r24
	.word 0xbc154000  ! 2955: OR_R	or 	%r21, %r0, %r30
iob_intr_1_249:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_249), 16, 16)) -> intp(1, 0, 3d)
	.word 0xbba549a0  ! 2960: FDIVs	fdivs	%f21, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_200:
	setx	0x37021c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_250:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_250), 16, 16)) -> intp(1, 0, 0)
cpu_intr_1_201:
	setx	0x37022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5ab8820  ! 2970: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb3aa8820  ! 2975: FMOVG	fmovs	%fcc1, %f0, %f25
cpu_intr_1_202:
	setx	0x340123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd342001  ! 2978: SRL_I	srl 	%r16, 0x0001, %r30
cpu_intr_1_203:
	setx	0x360024, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_146:
	mov	0x1d, %r14
	.word 0xf8db8e40  ! 2980: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_1_251:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_251), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb5ab4820  ! 2985: FMOVCC	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_132:
	mov	0x17, %r14
	.word 0xf8f38e60  ! 2986: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbfa489a0  ! 2987: FDIVs	fdivs	%f18, %f0, %f31
	.word 0xb7a58920  ! 2988: FMULs	fmuls	%f22, %f0, %f27
	.word 0xb9a8c820  ! 2991: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xb0c40000  ! 2992: ADDCcc_R	addccc 	%r16, %r0, %r24
T1_asi_reg_wr_133:
	mov	0xd, %r14
	.word 0xf8f38e40  ! 2995: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_204:
	setx	0x34030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a8c820  ! 2999: FMOVL	fmovs	%fcc1, %f0, %f28
iob_intr_1_252:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_252), 16, 16)) -> intp(1, 0, 2c)
T1_asi_reg_rd_147:
	mov	0x2, %r14
	.word 0xf2db8400  ! 3001: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_1_205:
	setx	0x350008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a81420  ! 3005: FMOVRNZ	dis not found

cpu_intr_1_206:
	setx	0x35011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 3007: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb9a448a0  ! 3009: FSUBs	fsubs	%f17, %f0, %f28
iob_intr_1_253:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_253), 16, 16)) -> intp(1, 0, 36)
T1_asi_reg_wr_134:
	mov	0x11, %r14
	.word 0xf0f38e60  ! 3011: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T1_asi_reg_wr_135:
	mov	0x3c5, %r14
	.word 0xfaf38e80  ! 3016: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbda90820  ! 3017: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xbda80c20  ! 3019: FMOVRLZ	dis not found

	.word 0xbbab0820  ! 3021: FMOVGU	fmovs	%fcc1, %f0, %f29
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xb9a00560  ! 3026: FSQRTq	fsqrt	
	.word 0xb62da157  ! 3028: ANDN_I	andn 	%r22, 0x0157, %r27
iob_intr_1_254:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_254), 16, 16)) -> intp(1, 0, 36)
iob_intr_1_255:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_255), 16, 16)) -> intp(1, 0, 8)
	.word 0xb1a589a0  ! 3041: FDIVs	fdivs	%f22, %f0, %f24
	.word 0xbc050000  ! 3043: ADD_R	add 	%r20, %r0, %r30
	.word 0xb9a448a0  ! 3047: FSUBs	fsubs	%f17, %f0, %f28
	.word 0xb1a509e0  ! 3049: FDIVq	dis not found

	.word 0xb21c60b3  ! 3050: XOR_I	xor 	%r17, 0x00b3, %r25
	.word 0xb1a4c960  ! 3051: FMULq	dis not found

cpu_intr_1_207:
	setx	0x370300, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_256:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_256), 16, 16)) -> intp(1, 0, 34)
	.word 0xb9a58960  ! 3062: FMULq	dis not found

iob_intr_1_257:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_257), 16, 16)) -> intp(1, 0, 36)
	.word 0xb9a00020  ! 3065: FMOVs	fmovs	%f0, %f28
T1_asi_reg_rd_148:
	mov	0xa, %r14
	.word 0xf8db8400  ! 3066: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb6a44000  ! 3067: SUBcc_R	subcc 	%r17, %r0, %r27
T1_asi_reg_wr_136:
	mov	0x2a, %r14
	.word 0xf8f389e0  ! 3068: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb7aa8820  ! 3069: FMOVG	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_149:
	mov	0x3c8, %r14
	.word 0xf2db8e80  ! 3071: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T1_asi_reg_rd_150:
	mov	0x3c5, %r14
	.word 0xf6db8e80  ! 3073: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_1_208:
	setx	0x360328, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_137:
	mov	0x13, %r14
	.word 0xfaf38e40  ! 3075: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb23da0c0  ! 3077: XNOR_I	xnor 	%r22, 0x00c0, %r25
iob_intr_1_258:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_258), 16, 16)) -> intp(1, 0, 16)
	.word 0xb214a146  ! 3083: OR_I	or 	%r18, 0x0146, %r25
T1_asi_reg_wr_138:
	mov	0x17, %r14
	.word 0xf8f389e0  ! 3085: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_1_259:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_259), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb9a48860  ! 3087: FADDq	dis not found

	.word 0xbba40840  ! 3091: FADDd	faddd	%f16, %f0, %f60
cpu_intr_1_209:
	setx	0x340027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a98820  ! 3094: FMOVNEG	fmovs	%fcc1, %f0, %f24
cpu_intr_1_210:
	setx	0x360005, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_260:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_260), 16, 16)) -> intp(1, 0, 10)
T1_asi_reg_wr_139:
	mov	0x36, %r14
	.word 0xf6f38e40  ! 3099: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_wr_140:
	mov	0x19, %r14
	.word 0xfef38e80  ! 3102: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbda54860  ! 3105: FADDq	dis not found

iob_intr_1_261:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_261), 16, 16)) -> intp(1, 0, 23)
	.word 0xb5a88820  ! 3108: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb9a5c9c0  ! 3109: FDIVd	fdivd	%f54, %f0, %f28
	.word 0xbba488e0  ! 3111: FSUBq	dis not found

	.word 0xb7a00560  ! 3114: FSQRTq	fsqrt	
T1_asi_reg_wr_141:
	mov	0x20, %r14
	.word 0xfcf38400  ! 3117: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_1_211:
	setx	0x350034, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_212:
	setx	0x35020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00540  ! 3125: FSQRTd	fsqrt	
	.word 0xb5a98820  ! 3127: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb5a81c20  ! 3128: FMOVRGEZ	dis not found

T1_asi_reg_wr_142:
	mov	0x1e, %r14
	.word 0xfef389e0  ! 3130: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_wr_143:
	mov	0x1c, %r14
	.word 0xf8f38e40  ! 3131: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_wr_144:
	mov	0x3c3, %r14
	.word 0xf4f389e0  ! 3132: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbfa44920  ! 3134: FMULs	fmuls	%f17, %f0, %f31
	.word 0xb3a00520  ! 3135: FSQRTs	fsqrt	
	.word 0xb1a48820  ! 3137: FADDs	fadds	%f18, %f0, %f24
T1_asi_reg_wr_145:
	mov	0x9, %r14
	.word 0xfcf38e80  ! 3138: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb9a50860  ! 3142: FADDq	dis not found

T1_asi_reg_wr_146:
	mov	0xf, %r14
	.word 0xf8f38400  ! 3144: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T1_asi_reg_rd_151:
	mov	0x3c0, %r14
	.word 0xf6db8400  ! 3147: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbba4c8c0  ! 3149: FSUBd	fsubd	%f50, %f0, %f60
T1_asi_reg_rd_152:
	mov	0x2a, %r14
	.word 0xf6db8e80  ! 3152: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_1_262:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_262), 16, 16)) -> intp(1, 0, 2b)
	.word 0xbb7cc400  ! 3157: MOVR_R	movre	%r19, %r0, %r29
	.word 0xb6b58000  ! 3158: SUBCcc_R	orncc 	%r22, %r0, %r27
iob_intr_1_263:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_263), 16, 16)) -> intp(1, 0, 33)
T1_asi_reg_wr_147:
	mov	0xd, %r14
	.word 0xfef38e40  ! 3162: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_wr_148:
	mov	0x9, %r14
	.word 0xfaf38400  ! 3166: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbba81c20  ! 3167: FMOVRGEZ	dis not found

	.word 0xb1a94820  ! 3174: FMOVCS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_149:
	mov	0x30, %r14
	.word 0xf0f389e0  ! 3176: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_1_213:
	setx	0x36021a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_264:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_264), 16, 16)) -> intp(1, 0, 2a)
iob_intr_1_265:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_265), 16, 16)) -> intp(1, 0, 31)
	lda	[%r23 + %g0] 0xf0, %f2
T1_asi_reg_rd_153:
	mov	0xb, %r14
	.word 0xf2db8400  ! 3187: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T1_asi_reg_wr_150:
	mov	0x3c4, %r14
	.word 0xf0f38e60  ! 3189: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_1_266:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_266), 16, 16)) -> intp(1, 0, 20)
cpu_intr_1_214:
	setx	0x3a0229, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_267:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_267), 16, 16)) -> intp(1, 0, 2a)
cpu_intr_1_215:
	setx	0x3a0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 3197: FMOVN	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x83942026  ! 3199: WRPR_TNPC_I	wrpr	%r16, 0x0026, %tnpc
	.word 0xb7a40860  ! 3200: FADDq	dis not found

	.word 0xb3a80c20  ! 3202: FMOVRLZ	dis not found

	.word 0xb7a4c9e0  ! 3203: FDIVq	dis not found

	.word 0xb9a00540  ! 3204: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_268:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_268), 16, 16)) -> intp(1, 0, 26)
	.word 0xbfa90820  ! 3209: FMOVLEU	fmovs	%fcc1, %f0, %f31
cpu_intr_1_216:
	setx	0x39000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4ac0000  ! 3214: ANDNcc_R	andncc 	%r16, %r0, %r26
	.word 0xb1ab4820  ! 3215: FMOVCC	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_151:
	mov	0x1b, %r14
	.word 0xf4f38e40  ! 3216: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_217:
	setx	0x3a001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9194a0eb  ! 3225: WRPR_PIL_I	wrpr	%r18, 0x00eb, %pil
	.word 0xb7a409c0  ! 3227: FDIVd	fdivd	%f16, %f0, %f58
	.word 0xb8b40000  ! 3228: ORNcc_R	orncc 	%r16, %r0, %r28
T1_asi_reg_wr_152:
	mov	0xd, %r14
	.word 0xfaf38e40  ! 3229: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbba8c820  ! 3230: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xb3a80420  ! 3231: FMOVRZ	dis not found

T1_asi_reg_wr_153:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 3234: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb9a508c0  ! 3236: FSUBd	fsubd	%f20, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_wr_154:
	mov	0x18, %r14
	.word 0xf8f38e40  ! 3239: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0x8194a10e  ! 3240: WRPR_TPC_I	wrpr	%r18, 0x010e, %tpc
T1_asi_reg_wr_155:
	mov	0x32, %r14
	.word 0xf8f38e40  ! 3243: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbc8ce14e  ! 3246: ANDcc_I	andcc 	%r19, 0x014e, %r30
	.word 0xbf641800  ! 3251: MOVcc_R	<illegal instruction>
	.word 0xb7a90820  ! 3253: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xbba5c960  ! 3258: FMULq	dis not found

T1_asi_reg_wr_156:
	mov	0x2, %r14
	.word 0xfaf38e60  ! 3259: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb9358000  ! 3261: SRL_R	srl 	%r22, %r0, %r28
T1_asi_reg_wr_157:
	mov	0x3c3, %r14
	.word 0xfef38e60  ! 3262: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T1_asi_reg_wr_158:
	mov	0x3c8, %r14
	.word 0xf0f38e60  ! 3264: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb2ade0b1  ! 3266: ANDNcc_I	andncc 	%r23, 0x00b1, %r25
iob_intr_1_269:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_269), 16, 16)) -> intp(1, 0, 32)
	lda	[%r23 + %g0] 0xf0, %f2
cpu_intr_1_218:
	setx	0x3b0200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5ab8820  ! 3274: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb5a40960  ! 3276: FMULq	dis not found

T1_asi_reg_rd_154:
	mov	0xf, %r14
	.word 0xf0db8400  ! 3277: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_1_270:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_270), 16, 16)) -> intp(1, 0, 34)
iob_intr_1_271:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_271), 16, 16)) -> intp(1, 0, 1b)
	lda	[%r23 + %g0] 0xf0, %f2
cpu_intr_1_219:
	setx	0x3022b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_272:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_272), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb93db001  ! 3289: SRAX_I	srax	%r22, 0x0001, %r28
	.word 0xbba589c0  ! 3290: FDIVd	fdivd	%f22, %f0, %f60
	.word 0xbfa90820  ! 3291: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb7a4c9c0  ! 3294: FDIVd	fdivd	%f50, %f0, %f58
T1_asi_reg_wr_159:
	mov	0x3c6, %r14
	.word 0xf6f38400  ! 3295: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb7aa8820  ! 3296: FMOVG	fmovs	%fcc1, %f0, %f27
iob_intr_1_273:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_273), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb9a4c8a0  ! 3302: FSUBs	fsubs	%f19, %f0, %f28
	.word 0xb3aac820  ! 3303: FMOVGE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_155:
	mov	0x3c0, %r14
	.word 0xf8db8e40  ! 3304: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb1a88820  ! 3306: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb3aa8820  ! 3307: FMOVG	fmovs	%fcc1, %f0, %f25
iob_intr_1_274:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_274), 16, 16)) -> intp(1, 0, 38)
	.word 0xbfa50920  ! 3312: FMULs	fmuls	%f20, %f0, %f31
	.word 0xbba00560  ! 3315: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_275:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_275), 16, 16)) -> intp(1, 0, 32)
	.word 0xbba4c860  ! 3321: FADDq	dis not found

iob_intr_1_276:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_276), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_wr_160:
	mov	0x21, %r14
	.word 0xf2f38e40  ! 3325: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb8358000  ! 3326: SUBC_R	orn 	%r22, %r0, %r28
iob_intr_1_277:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_277), 16, 16)) -> intp(1, 0, b)
cpu_intr_1_220:
	setx	0x3a0038, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_221:
	setx	0x39032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba58860  ! 3331: FADDq	dis not found

	lda	[%r23 + %g0] 0xf0, %f2
	.word 0xb151c000  ! 3334: RDPR_TL	<illegal instruction>
	.word 0xb3abc820  ! 3335: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb1a4c840  ! 3336: FADDd	faddd	%f50, %f0, %f24
T1_asi_reg_rd_156:
	mov	0x6, %r14
	.word 0xf4db8e80  ! 3338: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T1_asi_reg_wr_161:
	mov	0x13, %r14
	.word 0xfef38e60  ! 3340: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_1_278:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_278), 16, 16)) -> intp(1, 0, 8)
T1_asi_reg_rd_157:
	mov	0x3c8, %r14
	.word 0xf8db84a0  ! 3342: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb9a80820  ! 3344: FMOVN	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_162:
	mov	0x1a, %r14
	.word 0xf8f38e80  ! 3345: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_1_222:
	setx	0x3a000d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_223:
	setx	0x3b0229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7ab0820  ! 3350: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xbda5c960  ! 3353: FMULq	dis not found

	.word 0xb5a8c820  ! 3357: FMOVL	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_158:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 3359: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb1a81820  ! 3362: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xb5aa4820  ! 3363: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb3a40840  ! 3364: FADDd	faddd	%f16, %f0, %f56
cpu_intr_1_224:
	setx	0x3a0008, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_225:
	setx	0x3a031d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_163:
	mov	0x3c8, %r14
	.word 0xf2f38400  ! 3369: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_279:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_279), 16, 16)) -> intp(1, 0, e)
	.word 0xb3aac820  ! 3382: FMOVGE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_164:
	mov	0x3c5, %r14
	.word 0xf8f38e40  ! 3383: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_rd_159:
	mov	0x23, %r14
	.word 0xfadb84a0  ! 3384: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_1_280:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_280), 16, 16)) -> intp(1, 0, 2a)
cpu_intr_1_226:
	setx	0x3b0230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb29da159  ! 3389: XORcc_I	xorcc 	%r22, 0x0159, %r25
	.word 0xb1a94820  ! 3390: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb2b48000  ! 3391: ORNcc_R	orncc 	%r18, %r0, %r25
	.word 0xbbab8820  ! 3397: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xbda80820  ! 3398: FMOVN	fmovs	%fcc1, %f0, %f30
cpu_intr_1_227:
	setx	0x38012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa90820  ! 3401: FMOVLEU	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_160:
	mov	0x4, %r14
	.word 0xf0db84a0  ! 3402: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_1_281:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_281), 16, 16)) -> intp(1, 0, 34)
	.word 0x81952020  ! 3404: WRPR_TPC_I	wrpr	%r20, 0x0020, %tpc
T1_asi_reg_wr_165:
	mov	0x38, %r14
	.word 0xfef38e40  ! 3406: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_1_228:
	setx	0x3b0300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a98820  ! 3408: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb3a00520  ! 3410: FSQRTs	fsqrt	
	.word 0xbba58820  ! 3411: FADDs	fadds	%f22, %f0, %f29
iob_intr_1_282:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_282), 16, 16)) -> intp(1, 0, 37)
	lda	[%r23 + %g0] 0xf0, %f2
iob_intr_1_283:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_283), 16, 16)) -> intp(1, 0, 15)
T1_asi_reg_rd_161:
	mov	0x15, %r14
	.word 0xf0db8e40  ! 3424: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbba00560  ! 3427: FSQRTq	fsqrt	
cpu_intr_1_229:
	setx	0x390029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_284:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_284), 16, 16)) -> intp(1, 0, 2c)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a488e0  ! 3438: FSUBq	dis not found

	.word 0xbfa98820  ! 3439: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb3a00520  ! 3441: FSQRTs	fsqrt	
	.word 0xbda489e0  ! 3444: FDIVq	dis not found

cpu_intr_1_230:
	setx	0x3a0223, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_162:
	mov	0x36, %r14
	.word 0xf4db8e60  ! 3448: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_1_285:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_285), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb5ab8820  ! 3456: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xbba54840  ! 3458: FADDd	faddd	%f52, %f0, %f60
	.word 0xb5a44920  ! 3459: FMULs	fmuls	%f17, %f0, %f26
T1_asi_reg_rd_163:
	mov	0x1d, %r14
	.word 0xf6db84a0  ! 3460: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_1_231:
	setx	0x3b012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a81c20  ! 3462: FMOVRGEZ	dis not found

T1_asi_reg_wr_166:
	mov	0x3c5, %r14
	.word 0xf4f38e80  ! 3463: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_1_286:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_286), 16, 16)) -> intp(1, 0, 34)
iob_intr_1_287:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_287), 16, 16)) -> intp(1, 0, 13)
	.word 0xb1a00520  ! 3467: FSQRTs	fsqrt	
	.word 0xb3a8c820  ! 3474: FMOVL	fmovs	%fcc1, %f0, %f25
iob_intr_1_288:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_288), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_rd_164:
	mov	0x17, %r14
	.word 0xfcdb8e40  ! 3478: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_232:
	setx	0x3b0111, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_167:
	mov	0x17, %r14
	.word 0xf0f389e0  ! 3480: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_1_289:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_289), 16, 16)) -> intp(1, 0, 25)
	.word 0xbba00040  ! 3486: FMOVd	fmovd	%f0, %f60
iob_intr_1_290:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_290), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb7a5c860  ! 3488: FADDq	dis not found

	.word 0xb7a00040  ! 3491: FMOVd	fmovd	%f0, %f58
	.word 0xb9a50940  ! 3495: FMULd	fmuld	%f20, %f0, %f28
cpu_intr_1_233:
	setx	0x3b032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xbaa48000  ! 3498: SUBcc_R	subcc 	%r18, %r0, %r29
	.word 0x8f902000  ! 3499: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xb32d5000  ! 3500: SLLX_R	sllx	%r21, %r0, %r25
iob_intr_1_291:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_291), 16, 16)) -> intp(1, 0, 2d)
	.word 0xbda80c20  ! 3502: FMOVRLZ	dis not found

	.word 0xb6152154  ! 3506: OR_I	or 	%r20, 0x0154, %r27
	.word 0xbf356001  ! 3508: SRL_I	srl 	%r21, 0x0001, %r31
	.word 0xb215c000  ! 3509: OR_R	or 	%r23, %r0, %r25
	.word 0xb3a81c20  ! 3511: FMOVRGEZ	dis not found

	.word 0xbf35e001  ! 3512: SRL_I	srl 	%r23, 0x0001, %r31
	.word 0xbfa50960  ! 3514: FMULq	dis not found

T1_asi_reg_rd_165:
	mov	0x7, %r14
	.word 0xf2db8e40  ! 3517: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_1_234:
	setx	0x390006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a448c0  ! 3524: FSUBd	fsubd	%f48, %f0, %f58
	.word 0xb0250000  ! 3528: SUB_R	sub 	%r20, %r0, %r24
	.word 0xb5a50820  ! 3530: FADDs	fadds	%f20, %f0, %f26
	.word 0xbda44960  ! 3532: FMULq	dis not found

iob_intr_1_292:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_292), 16, 16)) -> intp(1, 0, 33)
	.word 0xbfabc820  ! 3538: FMOVVC	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_168:
	mov	0x1, %r14
	.word 0xfcf38e40  ! 3539: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbd643801  ! 3540: MOVcc_I	<illegal instruction>
	.word 0xb1aa0820  ! 3542: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb234a183  ! 3544: SUBC_I	orn 	%r18, 0x0183, %r25
	.word 0xb3a9c820  ! 3545: FMOVVS	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_169:
	mov	0x4, %r14
	.word 0xf2f38e80  ! 3546: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_1_293:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_293), 16, 16)) -> intp(1, 0, 22)
cpu_intr_1_235:
	setx	0x3a030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab8820  ! 3552: FMOVPOS	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_166:
	mov	0x1b, %r14
	.word 0xf4db8400  ! 3557: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb5aa0820  ! 3561: FMOVA	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_170:
	mov	0x21, %r14
	.word 0xf4f38e80  ! 3567: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_1_236:
	setx	0x3a0105, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_237:
	setx	0x3b0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd350000  ! 3571: SRL_R	srl 	%r20, %r0, %r30
iob_intr_1_294:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_294), 16, 16)) -> intp(1, 0, 27)
	.word 0xb7a44920  ! 3573: FMULs	fmuls	%f17, %f0, %f27
cpu_intr_1_238:
	setx	0x38013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa44820  ! 3576: FADDs	fadds	%f17, %f0, %f31
iob_intr_1_295:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_295), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_rd_167:
	mov	0x28, %r14
	.word 0xf2db8e40  ! 3579: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_296:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_296), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb7a81420  ! 3583: FMOVRNZ	dis not found

	.word 0xb9a5c9a0  ! 3585: FDIVs	fdivs	%f23, %f0, %f28
T1_asi_reg_wr_171:
	mov	0x3c3, %r14
	.word 0xf6f389e0  ! 3589: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xbfa80820  ! 3590: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_172:
	mov	0x3c7, %r14
	.word 0xfaf38400  ! 3592: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb3aa4820  ! 3597: FMOVNE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_168:
	mov	0x0, %r14
	.word 0xf0db8e60  ! 3598: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb3a80420  ! 3599: FMOVRZ	dis not found

iob_intr_1_297:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_297), 16, 16)) -> intp(1, 0, 24)
	.word 0xb5a00020  ! 3603: FMOVs	fmovs	%f0, %f26
T1_asi_reg_wr_173:
	mov	0x3, %r14
	.word 0xf8f38400  ! 3606: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbda4c8e0  ! 3609: FSUBq	dis not found

	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xbe05c000  ! 3616: ADD_R	add 	%r23, %r0, %r31
	.word 0xbda549e0  ! 3620: FDIVq	dis not found

	.word 0xb1a80820  ! 3621: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb1a90820  ! 3627: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xb9a00020  ! 3629: FMOVs	fmovs	%f0, %f28
	.word 0xbba00520  ! 3631: FSQRTs	fsqrt	
	.word 0xb7a88820  ! 3632: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb1a58920  ! 3633: FMULs	fmuls	%f22, %f0, %f24
	.word 0xbfa00560  ! 3634: FSQRTq	fsqrt	
cpu_intr_1_239:
	setx	0x39003f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_174:
	mov	0x3c6, %r14
	.word 0xf0f38e40  ! 3637: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb7a548a0  ! 3638: FSUBs	fsubs	%f21, %f0, %f27
T1_asi_reg_wr_175:
	mov	0x1a, %r14
	.word 0xf2f38e60  ! 3639: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_1_298:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_298), 16, 16)) -> intp(1, 0, 8)
iob_intr_1_299:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_299), 16, 16)) -> intp(1, 0, 25)
T1_asi_reg_wr_176:
	mov	0x3c4, %r14
	.word 0xf2f38400  ! 3648: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb3643801  ! 3649: MOVcc_I	<illegal instruction>
cpu_intr_1_240:
	setx	0x3d021f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_241:
	setx	0x3f0037, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_300:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_300), 16, 16)) -> intp(1, 0, 11)
	.word 0xb3aa4820  ! 3661: FMOVNE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_177:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 3662: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb23d8000  ! 3663: XNOR_R	xnor 	%r22, %r0, %r25
cpu_intr_1_242:
	setx	0x3e001a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_178:
	mov	0x34, %r14
	.word 0xfef38e40  ! 3669: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_301:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_301), 16, 16)) -> intp(1, 0, 31)
	.word 0xbda509c0  ! 3672: FDIVd	fdivd	%f20, %f0, %f30
	.word 0xb3a00560  ! 3676: FSQRTq	fsqrt	
iob_intr_1_302:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_302), 16, 16)) -> intp(1, 0, 4)
	.word 0xb3a4c9e0  ! 3682: FDIVq	dis not found

	.word 0xb7a81c20  ! 3683: FMOVRGEZ	dis not found

	.word 0xb3a84820  ! 3685: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xbfa4c8e0  ! 3686: FSUBq	dis not found

	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xb3a88820  ! 3691: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xbda589a0  ! 3692: FDIVs	fdivs	%f22, %f0, %f30
iob_intr_1_303:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_303), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_rd_169:
	mov	0x9, %r14
	.word 0xf6db8400  ! 3695: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb9a54940  ! 3696: FMULd	fmuld	%f52, %f0, %f28
cpu_intr_1_243:
	setx	0x3f0108, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_170:
	mov	0xb, %r14
	.word 0xfedb89e0  ! 3698: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T1_asi_reg_rd_171:
	mov	0x3c7, %r14
	.word 0xfedb8e60  ! 3702: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T1_asi_reg_wr_179:
	mov	0x3c8, %r14
	.word 0xfaf38e40  ! 3703: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_1_244:
	setx	0x3c0238, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_245:
	setx	0x30032, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_172:
	mov	0xb, %r14
	.word 0xfedb84a0  ! 3711: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_1_304:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_304), 16, 16)) -> intp(1, 0, 2d)
cpu_intr_1_246:
	setx	0x3e033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00540  ! 3719: FSQRTd	fsqrt	
	.word 0xb3a00520  ! 3723: FSQRTs	fsqrt	
iob_intr_1_305:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_305), 16, 16)) -> intp(1, 0, 37)
	.word 0xb1a90820  ! 3728: FMOVLEU	fmovs	%fcc1, %f0, %f24
iob_intr_1_306:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_306), 16, 16)) -> intp(1, 0, 11)
cpu_intr_1_247:
	setx	0x3e030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba488c0  ! 3733: FSUBd	fsubd	%f18, %f0, %f60
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_248:
	setx	0x3d0120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a90820  ! 3743: FMOVLEU	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_249:
	setx	0x3d0032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb62ce052  ! 3751: ANDN_I	andn 	%r19, 0x0052, %r27
iob_intr_1_307:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_307), 16, 16)) -> intp(1, 0, b)
	.word 0xb7a48840  ! 3755: FADDd	faddd	%f18, %f0, %f58
	.word 0xbda549c0  ! 3756: FDIVd	fdivd	%f52, %f0, %f30
	.word 0xb3a488a0  ! 3758: FSUBs	fsubs	%f18, %f0, %f25
	.word 0xbba40840  ! 3759: FADDd	faddd	%f16, %f0, %f60
	.word 0xb17dc400  ! 3763: MOVR_R	movre	%r23, %r0, %r24
	.word 0xbba9c820  ! 3765: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb9a98820  ! 3766: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xbba88820  ! 3768: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xbba00540  ! 3769: FSQRTd	fsqrt	
	.word 0xb5a80820  ! 3776: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb7ab4820  ! 3777: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb5aa0820  ! 3779: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb1ab0820  ! 3780: FMOVGU	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_180:
	mov	0x10, %r14
	.word 0xfaf38e40  ! 3783: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_1_308:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_308), 16, 16)) -> intp(1, 0, 21)
T1_asi_reg_rd_173:
	mov	0x30, %r14
	.word 0xf4db8e60  ! 3788: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xbba80420  ! 3790: FMOVRZ	dis not found

iob_intr_1_309:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_309), 16, 16)) -> intp(1, 0, 3b)
cpu_intr_1_250:
	setx	0x3e022d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_251:
	setx	0x3d0038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0344000  ! 3796: SUBC_R	orn 	%r17, %r0, %r24
	.word 0xb1a98820  ! 3797: FMOVNEG	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_174:
	mov	0x5, %r14
	.word 0xf4db89e0  ! 3799: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb5a488a0  ! 3801: FSUBs	fsubs	%f18, %f0, %f26
	.word 0xbe9c4000  ! 3802: XORcc_R	xorcc 	%r17, %r0, %r31
	.word 0xb3a80c20  ! 3803: FMOVRLZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbaa8820  ! 3809: FMOVG	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_181:
	mov	0x3c2, %r14
	.word 0xfcf38e40  ! 3810: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb9a00520  ! 3814: FSQRTs	fsqrt	
cpu_intr_1_252:
	setx	0x3d003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9ab0820  ! 3818: FMOVGU	fmovs	%fcc1, %f0, %f28
iob_intr_1_310:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_310), 16, 16)) -> intp(1, 0, 3a)
T1_asi_reg_wr_182:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 3822: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbfa8c820  ! 3826: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb7a50960  ! 3827: FMULq	dis not found

	.word 0xb5a508a0  ! 3828: FSUBs	fsubs	%f20, %f0, %f26
	.word 0xb9a98820  ! 3836: FMOVNEG	fmovs	%fcc1, %f0, %f28
cpu_intr_1_253:
	setx	0x3e0034, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r23 + %g0] 0xf0, %f2
T1_asi_reg_wr_183:
	mov	0x2e, %r14
	.word 0xf2f38e40  ! 3844: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_1_254:
	setx	0x3d0236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b44000  ! 3847: SUBCcc_R	orncc 	%r17, %r0, %r27
	.word 0xb40d201e  ! 3849: AND_I	and 	%r20, 0x001e, %r26
	.word 0xbfa90820  ! 3855: FMOVLEU	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_175:
	mov	0x3c6, %r14
	.word 0xf0db84a0  ! 3859: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_1_311:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_311), 16, 16)) -> intp(1, 0, 25)
	.word 0xb8840000  ! 3861: ADDcc_R	addcc 	%r16, %r0, %r28
	.word 0xbba448a0  ! 3866: FSUBs	fsubs	%f17, %f0, %f29
	.word 0xb7a00560  ! 3867: FSQRTq	fsqrt	
	.word 0xb7abc820  ! 3868: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb351c000  ! 3870: RDPR_TL	<illegal instruction>
	.word 0xb7a80820  ! 3872: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb0ac8000  ! 3874: ANDNcc_R	andncc 	%r18, %r0, %r24
iob_intr_1_312:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_312), 16, 16)) -> intp(1, 0, 3c)
	.word 0xbdaa8820  ! 3881: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xbfa408e0  ! 3884: FSUBq	dis not found

T1_asi_reg_wr_184:
	mov	0x3c6, %r14
	.word 0xfcf389e0  ! 3886: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T1_asi_reg_wr_185:
	mov	0x1f, %r14
	.word 0xfef389e0  ! 3887: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbfa4c8a0  ! 3888: FSUBs	fsubs	%f19, %f0, %f31
T1_asi_reg_rd_176:
	mov	0x26, %r14
	.word 0xfcdb8e80  ! 3891: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb5a84820  ! 3892: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xbba48940  ! 3896: FMULd	fmuld	%f18, %f0, %f60
cpu_intr_1_255:
	setx	0x3d022c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_313:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_313), 16, 16)) -> intp(1, 0, 11)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_314:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_314), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_rd_177:
	mov	0x36, %r14
	.word 0xfadb8400  ! 3903: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb5a4c940  ! 3908: FMULd	fmuld	%f50, %f0, %f26
T1_asi_reg_rd_178:
	mov	0x1b, %r14
	.word 0xfedb8e80  ! 3912: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xbba50820  ! 3915: FADDs	fadds	%f20, %f0, %f29
T1_asi_reg_wr_186:
	mov	0x3, %r14
	.word 0xf2f389e0  ! 3919: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_1_256:
	setx	0x3c030c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_257:
	setx	0x3c023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab4820  ! 3924: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xbda00040  ! 3926: FMOVd	fmovd	%f0, %f30
	.word 0xbba4c8c0  ! 3929: FSUBd	fsubd	%f50, %f0, %f60
iob_intr_1_315:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_315), 16, 16)) -> intp(1, 0, 1b)
cpu_intr_1_258:
	setx	0x3e031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c9a0  ! 3936: FDIVs	fdivs	%f19, %f0, %f27
iob_intr_1_316:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_316), 16, 16)) -> intp(1, 0, 16)
	.word 0xb9aac820  ! 3945: FMOVGE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_259:
	setx	0x3f0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3aa8820  ! 3950: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xbda81c20  ! 3951: FMOVRGEZ	dis not found

cpu_intr_1_260:
	setx	0x3d0309, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_rd_179:
	mov	0x3c8, %r14
	.word 0xf2db8400  ! 3960: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_1_261:
	setx	0x3c0331, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_262:
	setx	0x3d0036, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_263:
	setx	0x3f0204, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_180:
	mov	0x3c8, %r14
	.word 0xfadb84a0  ! 3967: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb1a40960  ! 3968: FMULq	dis not found

cpu_intr_1_264:
	setx	0x3c0007, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_181:
	mov	0x28, %r14
	.word 0xfadb8e40  ! 3971: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb5a589e0  ! 3974: FDIVq	dis not found

iob_intr_1_317:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_317), 16, 16)) -> intp(1, 0, 15)
	.word 0xb3a98820  ! 3978: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xbba00020  ! 3979: FMOVs	fmovs	%f0, %f29
iob_intr_1_318:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_318), 16, 16)) -> intp(1, 0, 0)
iob_intr_1_319:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_319), 16, 16)) -> intp(1, 0, 6)
iob_intr_1_320:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_320), 16, 16)) -> intp(1, 0, 22)
	.word 0xb9a81c20  ! 3987: FMOVRGEZ	dis not found

	.word 0xbdab8820  ! 3989: FMOVPOS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_182:
	mov	0x5, %r14
	.word 0xfcdb8e60  ! 3990: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	lda	[%r23 + %g0] 0xf0, %f2
iob_intr_1_321:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_321), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_rd_183:
	mov	0x21, %r14
	.word 0xf4db8e60  ! 3995: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_1_265:
	setx	0x3f020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaa0820  ! 3998: FMOVA	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_184:
	mov	0xb, %r14
	.word 0xfcdb8e40  ! 3999: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_rd_185:
	mov	0x3c2, %r14
	.word 0xfcdb8400  ! 4001: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_1_266:
	setx	0x3d001a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_322:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_322), 16, 16)) -> intp(1, 0, 15)
T1_asi_reg_rd_186:
	mov	0x3c6, %r14
	.word 0xfcdb8e40  ! 4005: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb72dc000  ! 4006: SLL_R	sll 	%r23, %r0, %r27
iob_intr_1_323:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_323), 16, 16)) -> intp(1, 0, 22)
	.word 0xb025c000  ! 4012: SUB_R	sub 	%r23, %r0, %r24
cpu_intr_1_267:
	setx	0x3d0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa98820  ! 4015: FMOVNEG	fmovs	%fcc1, %f0, %f31
cpu_intr_1_268:
	setx	0x3f0002, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_269:
	setx	0x3e0026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80c20  ! 4020: FMOVRLZ	dis not found

	.word 0xb1ab4820  ! 4022: FMOVCC	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_187:
	mov	0x3c0, %r14
	.word 0xfaf38e40  ! 4023: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb5a80c20  ! 4026: FMOVRLZ	dis not found

iob_intr_1_324:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_324), 16, 16)) -> intp(1, 0, 23)
	.word 0xb1a549c0  ! 4033: FDIVd	fdivd	%f52, %f0, %f24
	.word 0xb4c5e181  ! 4034: ADDCcc_I	addccc 	%r23, 0x0181, %r26
iob_intr_1_325:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_325), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbfa48820  ! 4038: FADDs	fadds	%f18, %f0, %f31
	.word 0xb1aa4820  ! 4040: FMOVNE	fmovs	%fcc1, %f0, %f24
cpu_intr_1_270:
	setx	0x3d0309, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_326:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_326), 16, 16)) -> intp(1, 0, 10)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5a98820  ! 4051: FMOVNEG	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_188:
	mov	0x30, %r14
	.word 0xfcf384a0  ! 4054: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb9a9c820  ! 4055: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xbba44840  ! 4058: FADDd	faddd	%f48, %f0, %f60
	.word 0xbda40860  ! 4059: FADDq	dis not found

iob_intr_1_327:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_327), 16, 16)) -> intp(1, 0, 14)
T1_asi_reg_wr_189:
	mov	0x3c8, %r14
	.word 0xf4f38e60  ! 4065: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T1_asi_reg_rd_187:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 4067: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb5a84820  ! 4069: FMOVE	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_rd_188:
	mov	0x3c4, %r14
	.word 0xfedb8e40  ! 4072: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_1_271:
	setx	0x3f0237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba488c0  ! 4074: FSUBd	fsubd	%f18, %f0, %f60
	.word 0xb3a00040  ! 4075: FMOVd	fmovd	%f0, %f56
	.word 0xbba00520  ! 4076: FSQRTs	fsqrt	
	.word 0xbba81820  ! 4077: FMOVRGZ	fmovs	%fcc3, %f0, %f29
iob_intr_1_328:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_328), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb1a80420  ! 4081: FMOVRZ	dis not found

cpu_intr_1_272:
	setx	0x3f013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a58920  ! 4085: FMULs	fmuls	%f22, %f0, %f27
	.word 0xbfa48940  ! 4086: FMULd	fmuld	%f18, %f0, %f62
T1_asi_reg_wr_190:
	mov	0x3c1, %r14
	.word 0xfaf38e80  ! 4090: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T1_asi_reg_wr_191:
	mov	0x33, %r14
	.word 0xf0f38400  ! 4091: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb9a5c8e0  ! 4095: FSUBq	dis not found

	.word 0xbba508c0  ! 4098: FSUBd	fsubd	%f20, %f0, %f60
iob_intr_1_329:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_329), 16, 16)) -> intp(1, 0, d)
	.word 0xb3aa0820  ! 4101: FMOVA	fmovs	%fcc1, %f0, %f25
cpu_intr_1_273:
	setx	0x410217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aa4820  ! 4103: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb8a44000  ! 4105: SUBcc_R	subcc 	%r17, %r0, %r28
	.word 0xb1a90820  ! 4109: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xbc24216d  ! 4113: SUB_I	sub 	%r16, 0x016d, %r30
	.word 0xb7a84820  ! 4114: FMOVE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_189:
	mov	0x3c8, %r14
	.word 0xfcdb8e60  ! 4115: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T1_asi_reg_rd_190:
	mov	0xa, %r14
	.word 0xfedb8e40  ! 4118: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_1_330:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_330), 16, 16)) -> intp(1, 0, 1f)
	.word 0xbb2ca001  ! 4126: SLL_I	sll 	%r18, 0x0001, %r29
	.word 0xb9a509a0  ! 4127: FDIVs	fdivs	%f20, %f0, %f28
cpu_intr_1_274:
	setx	0x410012, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_192:
	mov	0x19, %r14
	.word 0xf4f384a0  ! 4133: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_1_331:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_331), 16, 16)) -> intp(1, 0, 32)
	.word 0xbc250000  ! 4135: SUB_R	sub 	%r20, %r0, %r30
	.word 0xb5aa8820  ! 4140: FMOVG	fmovs	%fcc1, %f0, %f26
iob_intr_1_332:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_332), 16, 16)) -> intp(1, 0, e)
iob_intr_1_333:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_333), 16, 16)) -> intp(1, 0, 3a)
T1_asi_reg_rd_191:
	mov	0xc, %r14
	.word 0xf6db8e40  ! 4144: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbfa4c9c0  ! 4147: FDIVd	fdivd	%f50, %f0, %f62
	.word 0xb9ab0820  ! 4149: FMOVGU	fmovs	%fcc1, %f0, %f28
iob_intr_1_334:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_334), 16, 16)) -> intp(1, 0, 5)
	.word 0xbfaa8820  ! 4154: FMOVG	fmovs	%fcc1, %f0, %f31
cpu_intr_1_275:
	setx	0x42003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a4c8c0  ! 4159: FSUBd	fsubd	%f50, %f0, %f28
	lda	[%r21 + %g0] 0xf0, %f2
T1_asi_reg_wr_193:
	mov	0x3c1, %r14
	.word 0xf6f389e0  ! 4167: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb5a90820  ! 4171: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xb9a408e0  ! 4172: FSUBq	dis not found

T1_asi_reg_wr_194:
	mov	0x2f, %r14
	.word 0xf8f38400  ! 4174: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbf354000  ! 4177: SRL_R	srl 	%r21, %r0, %r31
T1_asi_reg_rd_192:
	mov	0x18, %r14
	.word 0xf0db8e40  ! 4178: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_335:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_335), 16, 16)) -> intp(1, 0, 3c)
cpu_intr_1_276:
	setx	0x40030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a50940  ! 4183: FMULd	fmuld	%f20, %f0, %f56
iob_intr_1_336:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_336), 16, 16)) -> intp(1, 0, 10)
iob_intr_1_337:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_337), 16, 16)) -> intp(1, 0, 1f)
	.word 0xbba50920  ! 4187: FMULs	fmuls	%f20, %f0, %f29
cpu_intr_1_277:
	setx	0x40011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80420  ! 4191: FMOVRZ	dis not found

iob_intr_1_338:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_338), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_wr_195:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 4197: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_1_278:
	setx	0x400217, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_279:
	setx	0x42030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda549c0  ! 4202: FDIVd	fdivd	%f52, %f0, %f30
	.word 0xb7a54940  ! 4205: FMULd	fmuld	%f52, %f0, %f58
	.word 0xb9aa8820  ! 4211: FMOVG	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_193:
	mov	0x3c8, %r14
	.word 0xfcdb84a0  ! 4212: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb53d8000  ! 4214: SRA_R	sra 	%r22, %r0, %r26
	.word 0xb1a8c820  ! 4215: FMOVL	fmovs	%fcc1, %f0, %f24
cpu_intr_1_280:
	setx	0x400028, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_196:
	mov	0x30, %r14
	.word 0xf2f38e40  ! 4222: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb7a80820  ! 4223: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
iob_intr_1_339:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_339), 16, 16)) -> intp(1, 0, 1b)
iob_intr_1_340:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_340), 16, 16)) -> intp(1, 0, 2e)
cpu_intr_1_281:
	setx	0x400025, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_282:
	setx	0x430203, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_283:
	setx	0x420218, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_284:
	setx	0x41032a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_341:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_341), 16, 16)) -> intp(1, 0, 17)
T1_asi_reg_rd_194:
	mov	0x35, %r14
	.word 0xfcdb89e0  ! 4253: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbbaa4820  ! 4256: FMOVNE	fmovs	%fcc1, %f0, %f29
iob_intr_1_342:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_342), 16, 16)) -> intp(1, 0, 39)
	.word 0xbba98820  ! 4261: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xb3a589e0  ! 4262: FDIVq	dis not found

cpu_intr_1_285:
	setx	0x420315, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_343:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_343), 16, 16)) -> intp(1, 0, 8)
	.word 0xb9a00040  ! 4268: FMOVd	fmovd	%f0, %f28
	.word 0xbfa50840  ! 4270: FADDd	faddd	%f20, %f0, %f62
	.word 0xbda48940  ! 4271: FMULd	fmuld	%f18, %f0, %f30
	.word 0xb7a00520  ! 4272: FSQRTs	fsqrt	
	.word 0xb9a50860  ! 4273: FADDq	dis not found

	.word 0x89956107  ! 4276: WRPR_TICK_I	wrpr	%r21, 0x0107, %tick
cpu_intr_1_286:
	setx	0x420038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa0820  ! 4281: FMOVA	fmovs	%fcc1, %f0, %f26
cpu_intr_1_287:
	setx	0x410300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80820  ! 4285: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xb334f001  ! 4286: SRLX_I	srlx	%r19, 0x0001, %r25
	.word 0xbda449e0  ! 4287: FDIVq	dis not found

	.word 0xbba54860  ! 4289: FADDq	dis not found

iob_intr_1_344:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_344), 16, 16)) -> intp(1, 0, 19)
	.word 0xb9a58860  ! 4291: FADDq	dis not found

cpu_intr_1_288:
	setx	0x43003e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_345:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_345), 16, 16)) -> intp(1, 0, 19)
	.word 0xb82460e5  ! 4296: SUB_I	sub 	%r17, 0x00e5, %r28
	.word 0xb1a84820  ! 4298: FMOVE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_195:
	mov	0x8, %r14
	.word 0xf0db8400  ! 4299: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_wr_197:
	mov	0x9, %r14
	.word 0xf8f38400  ! 4302: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	lda	[%r20 + %g0] 0xf0, %f2
cpu_intr_1_289:
	setx	0x42002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a408e0  ! 4315: FSUBq	dis not found

cpu_intr_1_290:
	setx	0x43033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_196:
	mov	0x2d, %r14
	.word 0xf0db89e0  ! 4318: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_1_291:
	setx	0x410202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80c20  ! 4329: FMOVRLZ	dis not found

	.word 0xbda54820  ! 4333: FADDs	fadds	%f21, %f0, %f30
	.word 0xbba90820  ! 4334: FMOVLEU	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_198:
	mov	0x3c6, %r14
	.word 0xfef38e40  ! 4335: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_346:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_346), 16, 16)) -> intp(1, 0, 16)
cpu_intr_1_292:
	setx	0x42023e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_197:
	mov	0x3c4, %r14
	.word 0xfadb89e0  ! 4345: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T1_asi_reg_rd_198:
	mov	0x3c5, %r14
	.word 0xf6db8e80  ! 4347: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb7a00020  ! 4349: FMOVs	fmovs	%f0, %f27
	.word 0xb7a5c840  ! 4353: FADDd	faddd	%f54, %f0, %f58
	.word 0xb6452103  ! 4354: ADDC_I	addc 	%r20, 0x0103, %r27
iob_intr_1_347:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_347), 16, 16)) -> intp(1, 0, 2b)
iob_intr_1_348:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_348), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb5a98820  ! 4359: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb2b58000  ! 4361: SUBCcc_R	orncc 	%r22, %r0, %r25
iob_intr_1_349:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_349), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb3a54860  ! 4365: FADDq	dis not found

	.word 0xb5ab0820  ! 4368: FMOVGU	fmovs	%fcc1, %f0, %f26
iob_intr_1_350:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_350), 16, 16)) -> intp(1, 0, 23)
	.word 0xbfa80820  ! 4370: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
cpu_intr_1_293:
	setx	0x43033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2342032  ! 4374: SUBC_I	orn 	%r16, 0x0032, %r25
	.word 0xb7a00040  ! 4375: FMOVd	fmovd	%f0, %f58
T1_asi_reg_wr_199:
	mov	0x3c3, %r14
	.word 0xf2f384a0  ! 4377: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_1_294:
	setx	0x420022, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_295:
	setx	0x400331, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_199:
	mov	0x20, %r14
	.word 0xfcdb8400  ! 4385: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T1_asi_reg_wr_200:
	mov	0x32, %r14
	.word 0xfaf38e80  ! 4388: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_1_351:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_351), 16, 16)) -> intp(1, 0, 3a)
iob_intr_1_352:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_352), 16, 16)) -> intp(1, 0, 14)
	.word 0xb3a448c0  ! 4394: FSUBd	fsubd	%f48, %f0, %f56
iob_intr_1_353:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_353), 16, 16)) -> intp(1, 0, 35)
cpu_intr_1_296:
	setx	0x42031c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_297:
	setx	0x400220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda5c9c0  ! 4401: FDIVd	fdivd	%f54, %f0, %f30
T1_asi_reg_rd_200:
	mov	0x24, %r14
	.word 0xf0db8e60  ! 4402: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_1_298:
	setx	0x420004, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_354:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_354), 16, 16)) -> intp(1, 0, 38)
iob_intr_1_355:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_355), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_wr_201:
	mov	0x5, %r14
	.word 0xf6f38400  ! 4413: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb5a80820  ! 4414: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xb49c60cc  ! 4416: XORcc_I	xorcc 	%r17, 0x00cc, %r26
	.word 0xb1a408a0  ! 4419: FSUBs	fsubs	%f16, %f0, %f24
	.word 0xb1a4c940  ! 4421: FMULd	fmuld	%f50, %f0, %f24
	.word 0xb5a98820  ! 4422: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xbfa80420  ! 4424: FMOVRZ	dis not found

T1_asi_reg_wr_202:
	mov	0x10, %r14
	.word 0xfaf38400  ! 4427: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T1_asi_reg_rd_201:
	mov	0x3c7, %r14
	.word 0xf0db89e0  ! 4429: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_356:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_356), 16, 16)) -> intp(1, 0, 1f)
T1_asi_reg_rd_202:
	mov	0x8, %r14
	.word 0xf6db8e40  ! 4432: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_299:
	setx	0x42012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba850000  ! 4434: ADDcc_R	addcc 	%r20, %r0, %r29
iob_intr_1_357:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_357), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb3a80c20  ! 4437: FMOVRLZ	dis not found

T1_asi_reg_wr_203:
	mov	0x3c2, %r14
	.word 0xfef38e40  ! 4438: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_rd_203:
	mov	0x19, %r14
	.word 0xf6db8e80  ! 4439: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbda44920  ! 4443: FMULs	fmuls	%f17, %f0, %f30
iob_intr_1_358:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_358), 16, 16)) -> intp(1, 0, 3)
cpu_intr_1_300:
	setx	0x400111, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_204:
	mov	0x3c8, %r14
	.word 0xfef38e40  ! 4452: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb3a81c20  ! 4453: FMOVRGEZ	dis not found

	.word 0xb8b5608f  ! 4454: SUBCcc_I	orncc 	%r21, 0x008f, %r28
	.word 0xb3a408a0  ! 4457: FSUBs	fsubs	%f16, %f0, %f25
T1_asi_reg_wr_205:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 4459: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_rd_204:
	mov	0x3c3, %r14
	.word 0xfcdb8400  ! 4463: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T1_asi_reg_wr_206:
	mov	0x15, %r14
	.word 0xfcf38e40  ! 4464: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_359:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_359), 16, 16)) -> intp(1, 0, 7)
T1_asi_reg_wr_207:
	mov	0x3c7, %r14
	.word 0xfef38e80  ! 4466: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_1_301:
	setx	0x420109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_360:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_360), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_wr_208:
	mov	0x33, %r14
	.word 0xfaf38e60  ! 4470: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb3a5c8e0  ! 4471: FSUBq	dis not found

	.word 0xb9a94820  ! 4472: FMOVCS	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_209:
	mov	0x32, %r14
	.word 0xfef38e80  ! 4473: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_1_302:
	setx	0x430304, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_210:
	mov	0x3c8, %r14
	.word 0xf0f38e80  ! 4480: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbda488a0  ! 4482: FSUBs	fsubs	%f18, %f0, %f30
	.word 0xb3a88820  ! 4483: FMOVLE	fmovs	%fcc1, %f0, %f25
iob_intr_1_361:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_361), 16, 16)) -> intp(1, 0, 2e)
T1_asi_reg_rd_205:
	mov	0x16, %r14
	.word 0xf2db8400  ! 4485: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_1_303:
	setx	0x430239, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_362:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_362), 16, 16)) -> intp(1, 0, 1)
	.word 0xb9aa0820  ! 4489: FMOVA	fmovs	%fcc1, %f0, %f28
cpu_intr_1_304:
	setx	0x43000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda508c0  ! 4492: FSUBd	fsubd	%f20, %f0, %f30
iob_intr_1_363:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_363), 16, 16)) -> intp(1, 0, 31)
T1_asi_reg_wr_211:
	mov	0x17, %r14
	.word 0xf0f384a0  ! 4497: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T1_asi_reg_rd_206:
	mov	0x28, %r14
	.word 0xfedb8400  ! 4499: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb7a408a0  ! 4500: FSUBs	fsubs	%f16, %f0, %f27
iob_intr_1_364:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_364), 16, 16)) -> intp(1, 0, 34)
T1_asi_reg_rd_207:
	mov	0x3c1, %r14
	.word 0xf2db8e80  ! 4509: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbfa00020  ! 4510: FMOVs	fmovs	%f0, %f31
T1_asi_reg_wr_212:
	mov	0x3, %r14
	.word 0xf2f38e40  ! 4512: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbe45e0ac  ! 4516: ADDC_I	addc 	%r23, 0x00ac, %r31
cpu_intr_1_305:
	setx	0x41012c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_365:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_365), 16, 16)) -> intp(1, 0, 35)
T1_asi_reg_rd_208:
	mov	0x3c6, %r14
	.word 0xf6db8e60  ! 4522: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb1a508a0  ! 4523: FSUBs	fsubs	%f20, %f0, %f24
	.word 0xb5a80820  ! 4527: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
iob_intr_1_366:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_366), 16, 16)) -> intp(1, 0, 28)
	.word 0xb7a409a0  ! 4530: FDIVs	fdivs	%f16, %f0, %f27
	.word 0xb3a48940  ! 4532: FMULd	fmuld	%f18, %f0, %f56
	.word 0xbb641800  ! 4533: MOVcc_R	<illegal instruction>
	.word 0xbda00040  ! 4534: FMOVd	fmovd	%f0, %f30
T1_asi_reg_wr_213:
	mov	0x28, %r14
	.word 0xf0f38e60  ! 4535: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_1_306:
	setx	0x400334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a81420  ! 4541: FMOVRNZ	dis not found

	.word 0xbfa98820  ! 4542: FMOVNEG	fmovs	%fcc1, %f0, %f31
cpu_intr_1_307:
	setx	0x430039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8940000  ! 4552: ORcc_R	orcc 	%r16, %r0, %r28
	.word 0xb1a00040  ! 4554: FMOVd	fmovd	%f0, %f24
iob_intr_1_367:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_367), 16, 16)) -> intp(1, 0, f)
	.word 0xbfa00520  ! 4562: FSQRTs	fsqrt	
	.word 0xbda00520  ! 4564: FSQRTs	fsqrt	
cpu_intr_1_308:
	setx	0x42030e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_209:
	mov	0x9, %r14
	.word 0xfcdb84a0  ! 4571: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_1_309:
	setx	0x40032f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_214:
	mov	0x3c2, %r14
	.word 0xf4f389e0  ! 4579: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_1_310:
	setx	0x46001e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_311:
	setx	0x45012d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_368:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_368), 16, 16)) -> intp(1, 0, 2e)
iob_intr_1_369:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_369), 16, 16)) -> intp(1, 0, 19)
	.word 0xbba80820  ! 4589: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_210:
	mov	0x10, %r14
	.word 0xf2db8400  ! 4592: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb1a00020  ! 4596: FMOVs	fmovs	%f0, %f24
T1_asi_reg_wr_215:
	mov	0x20, %r14
	.word 0xfaf38400  ! 4598: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb13dd000  ! 4599: SRAX_R	srax	%r23, %r0, %r24
	.word 0xb5a98820  ! 4600: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb3a00560  ! 4603: FSQRTq	fsqrt	
T1_asi_reg_wr_216:
	mov	0x26, %r14
	.word 0xf2f389e0  ! 4604: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_1_312:
	setx	0x44003f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_370:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_370), 16, 16)) -> intp(1, 0, 2d)
iob_intr_1_371:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_371), 16, 16)) -> intp(1, 0, 2e)
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xb9a9c820  ! 4618: FMOVVS	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_372:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_372), 16, 16)) -> intp(1, 0, 15)
	.word 0xb1a54920  ! 4622: FMULs	fmuls	%f21, %f0, %f24
cpu_intr_1_313:
	setx	0x440126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb151c000  ! 4624: RDPR_TL	<illegal instruction>
	.word 0xbfa00540  ! 4625: FSQRTd	fsqrt	
	.word 0xbba5c8c0  ! 4626: FSUBd	fsubd	%f54, %f0, %f60
iob_intr_1_373:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_373), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb7a5c840  ! 4628: FADDd	faddd	%f54, %f0, %f58
T1_asi_reg_rd_211:
	mov	0x1b, %r14
	.word 0xfcdb8e60  ! 4629: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb29d21ce  ! 4630: XORcc_I	xorcc 	%r20, 0x01ce, %r25
	.word 0xb3a00020  ! 4631: FMOVs	fmovs	%f0, %f25
T1_asi_reg_rd_212:
	mov	0x3c0, %r14
	.word 0xfadb8e40  ! 4633: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb3a48920  ! 4637: FMULs	fmuls	%f18, %f0, %f25
	.word 0xb9a48860  ! 4641: FADDq	dis not found

T1_asi_reg_rd_213:
	mov	0x14, %r14
	.word 0xf0db8e40  ! 4647: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_374:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_374), 16, 16)) -> intp(1, 0, e)
	.word 0xbda80820  ! 4651: FMOVN	fmovs	%fcc1, %f0, %f30
cpu_intr_1_314:
	setx	0x47032b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_315:
	setx	0x46001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1abc820  ! 4660: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xbda509a0  ! 4663: FDIVs	fdivs	%f20, %f0, %f30
T1_asi_reg_rd_214:
	mov	0x3c6, %r14
	.word 0xf0db84a0  ! 4666: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_1_375:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_375), 16, 16)) -> intp(1, 0, 9)
	.word 0xb2bca024  ! 4674: XNORcc_I	xnorcc 	%r18, 0x0024, %r25
	.word 0xbe344000  ! 4675: SUBC_R	orn 	%r17, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_217:
	mov	0x1c, %r14
	.word 0xf2f38400  ! 4681: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T1_asi_reg_wr_218:
	mov	0x32, %r14
	.word 0xfef38400  ! 4682: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbfa00020  ! 4685: FMOVs	fmovs	%f0, %f31
cpu_intr_1_316:
	setx	0x47030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb40521b1  ! 4689: ADD_I	add 	%r20, 0x01b1, %r26
	.word 0xb08de0dd  ! 4691: ANDcc_I	andcc 	%r23, 0x00dd, %r24
	.word 0xb5aa8820  ! 4692: FMOVG	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_219:
	mov	0x32, %r14
	.word 0xf4f38e80  ! 4694: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T1_asi_reg_wr_220:
	mov	0x22, %r14
	.word 0xf2f389e0  ! 4696: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T1_asi_reg_wr_221:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 4700: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_rd_215:
	mov	0x6, %r14
	.word 0xf0db8e40  ! 4701: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbc3d4000  ! 4704: XNOR_R	xnor 	%r21, %r0, %r30
iob_intr_1_376:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_376), 16, 16)) -> intp(1, 0, d)
iob_intr_1_377:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_377), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_378:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_378), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_wr_222:
	mov	0x3c4, %r14
	.word 0xfef38e40  ! 4712: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbda00540  ! 4714: FSQRTd	fsqrt	
cpu_intr_1_317:
	setx	0x440000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba1cc000  ! 4718: XOR_R	xor 	%r19, %r0, %r29
cpu_intr_1_318:
	setx	0x460113, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_223:
	mov	0x10, %r14
	.word 0xf4f384a0  ! 4722: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T1_asi_reg_wr_224:
	mov	0x16, %r14
	.word 0xf6f38e40  ! 4724: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_319:
	setx	0x450034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a54840  ! 4728: FADDd	faddd	%f52, %f0, %f24
cpu_intr_1_320:
	setx	0x470333, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_379:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_379), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_wr_225:
	mov	0x26, %r14
	.word 0xfcf38e60  ! 4732: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbbaa0820  ! 4736: FMOVA	fmovs	%fcc1, %f0, %f29
cpu_intr_1_321:
	setx	0x450232, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_380:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_380), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_wr_226:
	mov	0x2b, %r14
	.word 0xf0f389e0  ! 4746: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbba40920  ! 4751: FMULs	fmuls	%f16, %f0, %f29
iob_intr_1_381:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_381), 16, 16)) -> intp(1, 0, 16)
	.word 0xb5a58920  ! 4753: FMULs	fmuls	%f22, %f0, %f26
iob_intr_1_382:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_382), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_rd_216:
	mov	0x30, %r14
	.word 0xf0db8e40  ! 4758: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xb12c4000  ! 4760: SLL_R	sll 	%r17, %r0, %r24
T1_asi_reg_rd_217:
	mov	0x3c0, %r14
	.word 0xfcdb8e60  ! 4762: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb9a88820  ! 4763: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xbfa90820  ! 4768: FMOVLEU	fmovs	%fcc1, %f0, %f31
iob_intr_1_383:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_383), 16, 16)) -> intp(1, 0, c)
	.word 0xbfaac820  ! 4775: FMOVGE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_227:
	mov	0x3c8, %r14
	.word 0xf2f38e80  ! 4777: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbd504000  ! 4779: RDPR_TNPC	<illegal instruction>
cpu_intr_1_322:
	setx	0x44012a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_218:
	mov	0x22, %r14
	.word 0xf6db8e80  ! 4785: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb49d8000  ! 4788: XORcc_R	xorcc 	%r22, %r0, %r26
	.word 0xb1a81820  ! 4790: FMOVRGZ	fmovs	%fcc3, %f0, %f24
T1_asi_reg_wr_228:
	mov	0x2b, %r14
	.word 0xfef38e60  ! 4792: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_1_323:
	setx	0x45021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb00ca149  ! 4794: AND_I	and 	%r18, 0x0149, %r24
iob_intr_1_384:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_384), 16, 16)) -> intp(1, 0, 27)
T1_asi_reg_rd_219:
	mov	0x3c7, %r14
	.word 0xfedb89e0  ! 4798: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb7a00540  ! 4800: FSQRTd	fsqrt	
cpu_intr_1_324:
	setx	0x440322, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_220:
	mov	0x27, %r14
	.word 0xf0db8e40  ! 4805: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_1_325:
	setx	0x470214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a88820  ! 4810: FMOVLE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_229:
	mov	0x3c5, %r14
	.word 0xfef389e0  ! 4811: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_wr_230:
	mov	0x23, %r14
	.word 0xfef38e80  ! 4812: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbda80c20  ! 4813: FMOVRLZ	dis not found

T1_asi_reg_wr_231:
	mov	0x27, %r14
	.word 0xfcf38e60  ! 4822: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbfa90820  ! 4823: FMOVLEU	fmovs	%fcc1, %f0, %f31
cpu_intr_1_326:
	setx	0x460039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb52c7001  ! 4826: SLLX_I	sllx	%r17, 0x0001, %r26
cpu_intr_1_327:
	setx	0x46013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_232:
	mov	0x3c2, %r14
	.word 0xfaf38e60  ! 4835: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbba50860  ! 4836: FADDq	dis not found

	.word 0xb7a5c940  ! 4838: FMULd	fmuld	%f54, %f0, %f58
cpu_intr_1_328:
	setx	0x440203, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_329:
	setx	0x440031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb635e1d2  ! 4846: SUBC_I	orn 	%r23, 0x01d2, %r27
	.word 0xb8b48000  ! 4849: ORNcc_R	orncc 	%r18, %r0, %r28
T1_asi_reg_rd_221:
	mov	0x3c0, %r14
	.word 0xf0db8e60  ! 4850: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb7a81820  ! 4853: FMOVRGZ	fmovs	%fcc3, %f0, %f27
cpu_intr_1_330:
	setx	0x470138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a58960  ! 4861: FMULq	dis not found

T1_asi_reg_rd_222:
	mov	0x19, %r14
	.word 0xf0db8e40  ! 4862: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbda81820  ! 4863: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xbcacc000  ! 4864: ANDNcc_R	andncc 	%r19, %r0, %r30
	.word 0xb5a5c8e0  ! 4869: FSUBq	dis not found

	.word 0xb9a50920  ! 4870: FMULs	fmuls	%f20, %f0, %f28
iob_intr_1_385:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_385), 16, 16)) -> intp(1, 0, 1a)
cpu_intr_1_331:
	setx	0x460030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa58820  ! 4881: FADDs	fadds	%f22, %f0, %f31
iob_intr_1_386:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_386), 16, 16)) -> intp(1, 0, 11)
	.word 0xb5ab8820  ! 4885: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xbba84820  ! 4887: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb335a001  ! 4889: SRL_I	srl 	%r22, 0x0001, %r25
iob_intr_1_387:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_387), 16, 16)) -> intp(1, 0, e)
T1_asi_reg_rd_223:
	mov	0x31, %r14
	.word 0xfcdb8e80  ! 4892: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_1_332:
	setx	0x47030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_224:
	mov	0x3c7, %r14
	.word 0xfedb8e80  ! 4895: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_1_388:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_388), 16, 16)) -> intp(1, 0, 1)
	.word 0xbd2c1000  ! 4898: SLLX_R	sllx	%r16, %r0, %r30
	.word 0xb9a84820  ! 4901: FMOVE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_333:
	setx	0x470202, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_233:
	mov	0x6, %r14
	.word 0xfcf38e40  ! 4903: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbfa8c820  ! 4904: FMOVL	fmovs	%fcc1, %f0, %f31
cpu_intr_1_334:
	setx	0x440334, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_234:
	mov	0x28, %r14
	.word 0xf4f38e80  ! 4908: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbba48920  ! 4910: FMULs	fmuls	%f18, %f0, %f29
T1_asi_reg_wr_235:
	mov	0x11, %r14
	.word 0xf2f38e60  ! 4912: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_1_389:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_389), 16, 16)) -> intp(1, 0, 1c)
cpu_intr_1_335:
	setx	0x450015, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7ab4820  ! 4920: FMOVCC	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_236:
	mov	0x34, %r14
	.word 0xfaf384a0  ! 4922: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_1_336:
	setx	0x440208, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_390:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_390), 16, 16)) -> intp(1, 0, 27)
	.word 0xb3a80820  ! 4934: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xbf2ce001  ! 4936: SLL_I	sll 	%r19, 0x0001, %r31
T1_asi_reg_wr_237:
	mov	0x3c0, %r14
	.word 0xf2f38e60  ! 4937: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_1_391:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_391), 16, 16)) -> intp(1, 0, 33)
iob_intr_1_392:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_392), 16, 16)) -> intp(1, 0, 14)
	.word 0x819521ef  ! 4943: WRPR_TPC_I	wrpr	%r20, 0x01ef, %tpc
cpu_intr_1_337:
	setx	0x470317, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_393:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_393), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb5a50820  ! 4947: FADDs	fadds	%f20, %f0, %f26
	.word 0xb1a44920  ! 4950: FMULs	fmuls	%f17, %f0, %f24
iob_intr_1_394:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_394), 16, 16)) -> intp(1, 0, 32)
	.word 0xb9a90820  ! 4953: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xbfaac820  ! 4954: FMOVGE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_338:
	setx	0x440307, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_238:
	mov	0x1c, %r14
	.word 0xf6f38400  ! 4958: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_1_339:
	setx	0x44031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbfaa8820  ! 4964: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xb43d219f  ! 4966: XNOR_I	xnor 	%r20, 0x019f, %r26
T1_asi_reg_wr_239:
	mov	0x1b, %r14
	.word 0xf0f38e60  ! 4968: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T1_asi_reg_rd_225:
	mov	0x35, %r14
	.word 0xf2db84a0  ! 4970: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_1_395:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_395), 16, 16)) -> intp(1, 0, 31)
T1_asi_reg_wr_240:
	mov	0x1a, %r14
	.word 0xf6f384a0  ! 4973: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_1_396:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_396), 16, 16)) -> intp(1, 0, d)
	.word 0xbe158000  ! 4976: OR_R	or 	%r22, %r0, %r31
iob_intr_1_397:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_397), 16, 16)) -> intp(1, 0, 1)
iob_intr_1_398:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_398), 16, 16)) -> intp(1, 0, 2a)
cpu_intr_1_340:
	setx	0x470131, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_399:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_399), 16, 16)) -> intp(1, 0, 1f)
	.word 0xbfa44960  ! 4989: FMULq	dis not found

T1_asi_reg_rd_226:
	mov	0x1d, %r14
	.word 0xf0db8e80  ! 4991: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb3a44920  ! 4992: FMULs	fmuls	%f17, %f0, %f25
T1_asi_reg_rd_227:
	mov	0x1f, %r14
	.word 0xf6db8e40  ! 4993: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb5a409e0  ! 4995: FDIVq	dis not found

	.word 0xb5a00560  ! 4997: FSQRTq	fsqrt	
	.word 0xb5a88820  ! 4998: FMOVLE	fmovs	%fcc1, %f0, %f26

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

	.xword	0xe207791d0aefc59d
	.xword	0xfc4304f475056eb0
	.xword	0x2922b438dcd0f039
	.xword	0x001b1dc0258de782
	.xword	0xdc9cd01f944a2387
	.xword	0xb7df2fcd3f938e33
	.xword	0x5669369e32e8d0ca
	.xword	0x10f8633372441ead
	.xword	0x12158c61ca0a32a2
	.xword	0xe83a183f3a04bcf7
	.xword	0xedba3de2d8bf6bb1
	.xword	0xfcf8e763825288a1
	.xword	0x8fc60c2dadf31bd0
	.xword	0x08f524e76db72149
	.xword	0xaba3f54b3dbd82a9
	.xword	0xe9c7d536d7b24afd
	.xword	0x7e1acf4693a676fc
	.xword	0xa9026ebb69982d89
	.xword	0x17b5a19814c8a754
	.xword	0x80c5ff9396eb1dd6
	.xword	0x31279e3953711946
	.xword	0x0dcf8d8c96a5a756
	.xword	0x73c8769953d82b02
	.xword	0x96ffde512641f7d7
	.xword	0x51c5475347e231b1
	.xword	0xae4db56f5ba6aeb2
	.xword	0x93d6a763f410323d
	.xword	0x132c29c71139f388
	.xword	0xbd03594a83b687dd
	.xword	0x00e03bd7a183c1d0
	.xword	0x6f4ab048c057701b
	.xword	0xd0e3b9d7c19e4298
	.xword	0x0248f4facb19026a
	.xword	0xa3937bc8a0a3ebcb
	.xword	0x9a36988a73a1c2bb
	.xword	0x63c3c0d4bee79f23
	.xword	0x2c7844220f7e6119
	.xword	0x3f5764ef1bda395c
	.xword	0x0a295d5b242af7f2
	.xword	0x0919ca9fd7c8c2eb
	.xword	0x5a3790422531af06
	.xword	0x8b07f9ba273ce236
	.xword	0xd8f3942afd5bd301
	.xword	0x861f2950de50a472
	.xword	0xfff1f2dd834a0382
	.xword	0xb642a3fd44dfeaf6
	.xword	0x89119596bc86da9e
	.xword	0xe6a25a5bb14d655d
	.xword	0xf88aad812af620f8
	.xword	0xaa9468b9e24a645a
	.xword	0xb2a1aef52a06c423
	.xword	0xc5d5a54c2cca5b74
	.xword	0x0050ceb1a370b52f
	.xword	0x4837625ca16d51f0
	.xword	0xb4b0c33e23cf5a92
	.xword	0x162be79d78eb7260
	.xword	0xd95308c861e49769
	.xword	0xf953abb12c62bd0d
	.xword	0x1c1fdb2134f36d76
	.xword	0x782caac467539f71
	.xword	0xac54fc51f8269e10
	.xword	0x1e91ac1b367440b6
	.xword	0x5e2ef4da120a24de
	.xword	0x2e1167494d71fac0
	.xword	0x023bdb0e57e8c235
	.xword	0x7944894dde8fe445
	.xword	0x8754a6aa761fc15d
	.xword	0x716a2d19255ee858
	.xword	0xf8f3a2b8a5fc3bd7
	.xword	0x75b64c0c6fad025e
	.xword	0x38431e8f09754d4a
	.xword	0x93a6f42255965125
	.xword	0x265a4c3aff0f51fe
	.xword	0xcdbade89108102fb
	.xword	0x8a881d2812e2709d
	.xword	0x3ac41032f3a04118
	.xword	0xe5a3baf6c359cc54
	.xword	0x46a07cf0eec21924
	.xword	0x3c5d49cfe85c4634
	.xword	0xdf98a5c0d4624c9a
	.xword	0x0e033f128c6511ae
	.xword	0x550d7f449d1376dd
	.xword	0x7c3e5d38926ce1e9
	.xword	0xdd949e1cbbeaaccc
	.xword	0x38a90ad28474b891
	.xword	0x87109b41f720230e
	.xword	0xb2b027eb0ade03fe
	.xword	0xbedf8a47d22d703b
	.xword	0xe09c5b5738d36bb4
	.xword	0xfeaa2506624a27e1
	.xword	0x1956a25ed8d9ae4b
	.xword	0x8fdec6efe70c3fc0
	.xword	0x56ced9628c748632
	.xword	0xfc47aa2dad4ac7e0
	.xword	0xbd310003df2944ad
	.xword	0x3360c801ec1c8246
	.xword	0xb8fb8db07844c1c9
	.xword	0xbab74ba585af3882
	.xword	0x554305720dc1fb9b
	.xword	0x87ff3e276387c25b
	.xword	0xd1fa25b5fb6e5ede
	.xword	0x768694d572d29bf7
	.xword	0x45ceb50129cfe79d
	.xword	0x6d1dd9a6c66d3eec
	.xword	0xb71223192d28acae
	.xword	0x83a3649aa932194d
	.xword	0x82d8859b7d32d817
	.xword	0x397d82fc32d914c6
	.xword	0xeb6eb64812b9a63a
	.xword	0xaece08600fc2215c
	.xword	0xa724fb934d8df313
	.xword	0xf9cd1fe3c21ac54d
	.xword	0x37c4d9d700aca46b
	.xword	0xbacf41a596d3ce46
	.xword	0x678c186f653980d3
	.xword	0x21d1100813177d8d
	.xword	0xdfa3c15135c01f0c
	.xword	0xcfb3cef1b51fc197
	.xword	0x4bf3cce2887fb969
	.xword	0x4576de20c59f491c
	.xword	0x8b866fe78e95a08e
	.xword	0x2ff87f94ac916a37
	.xword	0xa0efcafc635c208f
	.xword	0x92a4e560cb216a3e
	.xword	0x8a4e67551b7388e0
	.xword	0x77cceefd0a5e30ff
	.xword	0xf86f48fded4d6fbe
	.xword	0x76d6267d64947dcc
	.xword	0x1ec1a5f134c5fb36
	.xword	0x59ed62c7df944f32
	.xword	0x849a151c10365e8c
	.xword	0x0d3d7e625857deea
	.xword	0x5039ad456ae59329
	.xword	0xaf89ff81e2497c7e
	.xword	0xcd7cdcbb04201bbc
	.xword	0x46d2a0f0842a5bbf
	.xword	0x24c182754282f0b6
	.xword	0xd6b4df0bc997bcc1
	.xword	0xd893b1b0ac998be3
	.xword	0x3dff293811ea8cfc
	.xword	0x65cc1ee3fae7e279
	.xword	0xc841923fa77d324b
	.xword	0xf6e8262aef37dc65
	.xword	0xce957e74d1466c77
	.xword	0xf8e385a32cfd1153
	.xword	0x7fd847b5f9284ae5
	.xword	0x0da844786f7eefe5
	.xword	0x07ae4df120b138a5
	.xword	0xe1c54265e8810bb9
	.xword	0xe21029e4a30e3d12
	.xword	0xaefd74d403b8251f
	.xword	0x33927fb3d3756a65
	.xword	0xca430589802237de
	.xword	0x7932321e84101cfc
	.xword	0x9a74b45934259e30
	.xword	0x0fcb4d428dbf816d
	.xword	0x0ba3e21c2e2d21c4
	.xword	0xb5be11e7adc5d6bc
	.xword	0x448c9c48e30e7ee8
	.xword	0x94c37e610a8bf926
	.xword	0xd9e81b066e1b934d
	.xword	0xb6d449a8cf743f1e
	.xword	0xc5a3c2d49c315b2d
	.xword	0x87afcd9879e4e370
	.xword	0x60ab89e580a345f9
	.xword	0x71b6246b1592bd23
	.xword	0xb6f12e8dd47368fe
	.xword	0xa7b5ef0c0d3322d1
	.xword	0x95cf1bd07bead49f
	.xword	0x1b405e00b809e07f
	.xword	0xc24c5736f6844159
	.xword	0xd4f917142c52bf18
	.xword	0xb2215f77eb44860f
	.xword	0x65fc1a9cd1b34213
	.xword	0xadf3710a39cd7604
	.xword	0xda048aaa039457fc
	.xword	0xb334aee7c8fccf8f
	.xword	0x087606b95d0f7b21
	.xword	0xf17d7efdc70fd3e2
	.xword	0x455deb11bb42c7e4
	.xword	0xe503e82856b28e51
	.xword	0x6b41e524ebdf4e9b
	.xword	0x231d4c0e16e4e7c5
	.xword	0xbe49d3f14ac4e9b3
	.xword	0xbd0bd5963208385f
	.xword	0xe26445aa2484fd31
	.xword	0xb6189e27432e802b
	.xword	0x0820de9e6b70bfb5
	.xword	0x59c7aa39b601dc78
	.xword	0xcfef1979aaaf2faa
	.xword	0x36f78474c87033b1
	.xword	0x500a4210681204bd
	.xword	0x8b08f0d78ba32bb2
	.xword	0x21504544945a3745
	.xword	0x09ba07d5e0383415
	.xword	0x997e86e124eb83aa
	.xword	0xef2ff148d7e16fb6
	.xword	0x8a447a5fa02f8f6c
	.xword	0x3ccc03fd07a32c90
	.xword	0x14ff34b59af2cd82
	.xword	0xeadec29dfe0df033
	.xword	0x6b99121553cdfe56
	.xword	0x78f0037d14912267
	.xword	0x62a17b6319dd5a1c
	.xword	0x6f7fa6c8a0305674
	.xword	0x5ee537520c4380f2
	.xword	0x33c1d12acfa7902f
	.xword	0x5811f0d38f54ee90
	.xword	0xd6a35dd2b8781c10
	.xword	0x807740ecc797a337
	.xword	0xab8af13be4308de6
	.xword	0x0d4cde1a3efbbc27
	.xword	0x649513a221261771
	.xword	0xc8e9838c659d174f
	.xword	0xf93b6b269f0d94bf
	.xword	0x7d58a87eed90405e
	.xword	0xda7633b8a3010165
	.xword	0x92a3064463f9c61c
	.xword	0x802d75bd5dde0c3d
	.xword	0x587c0e98353991e9
	.xword	0x578457850990abc0
	.xword	0xe0bbb3076d340187
	.xword	0xd93b7d54f681080d
	.xword	0x9c6e392b7d2dc236
	.xword	0xe0bfba559aafe5dd
	.xword	0x8bdfbbc6dc199df4
	.xword	0x00af0b8ccb535ea9
	.xword	0x02341c04293a8658
	.xword	0x1c9dc25df9ce1005
	.xword	0xd30e1c2298f4af20
	.xword	0xf082b6a8aaf67317
	.xword	0xc6c7a6ef1db280a1
	.xword	0x2a39f09661d1e890
	.xword	0x8d5b0bd79f3f606e
	.xword	0x111285ec10eb748f
	.xword	0xfe2d5a8694f32509
	.xword	0x51f0dab659ea9fc1
	.xword	0x2657ac0ded956cf2
	.xword	0x6ae47497d90abe97
	.xword	0x6f4367e1b56442c2
	.xword	0x9adf85716b4b4095
	.xword	0x37f15db131b42429
	.xword	0x781ae5c2efed1e73
	.xword	0xcb2f264abcbb4908
	.xword	0x9769c64d67f3c3fb
	.xword	0x7455abe62dad68d9
	.xword	0x6676eabc8e45086e
	.xword	0xd98977e0946acaf5
	.xword	0x911ca01dec54f13b
	.xword	0x7927118a0d1c9b24
	.xword	0x352d35a52cb86e62
	.xword	0x2219230fc1d0b3c7
	.xword	0xf4c9bf715b52c637
	.xword	0xb9edc5ca0859727c
	.xword	0xd67ad5fce691c20c
	.xword	0x31f909738eb38c1e
	.align 0x2000
	.data
data_start_1:

	.xword	0x4ce613d1e13f140a
	.xword	0x03be3bbfd90f6ccd
	.xword	0x07bb75523790ef26
	.xword	0xef98099d653d9c72
	.xword	0xd2219c83efd66b68
	.xword	0xd420ec1f9a9ff07f
	.xword	0x76ca5e551378afc3
	.xword	0x2c3dedc5104a271f
	.xword	0xeb668c4ae977a85c
	.xword	0x99119e87aa8a821c
	.xword	0x61dd64434d5b446b
	.xword	0x6536fc9b42d7a03d
	.xword	0x299c99f35874ae2d
	.xword	0x41cc96513a88bb8a
	.xword	0x896c47c8935eaa2a
	.xword	0xecc12957108a3e71
	.xword	0x9167d4003fd6884f
	.xword	0x9dda81f14ee432dc
	.xword	0x6ab655f3366f2291
	.xword	0x4ae9aa464c37e2c0
	.xword	0x20c49bbef0201d97
	.xword	0x70e39ecd28bb5121
	.xword	0x5e01825ffeb325a8
	.xword	0x3ac5b99d28959198
	.xword	0x0884d96bb9e7599d
	.xword	0x16732ebd55b8ca0c
	.xword	0xc1f3940268537ec8
	.xword	0xa8a17d1727844650
	.xword	0xe8ed1acfe49577eb
	.xword	0x5cf94e96c06620ca
	.xword	0x5d9742e411b2424e
	.xword	0xcc6b98fad24f4a2d
	.xword	0x179da7b69fff7740
	.xword	0x39e9a2a25b591b56
	.xword	0x3b9e5fb511a44a30
	.xword	0xa23c41bc5c393848
	.xword	0x4ec940bae73fa1c8
	.xword	0xcd1d507ffa226319
	.xword	0xa579abe47db862e2
	.xword	0x32142521c446d19f
	.xword	0xb6d7e777fd1cf72d
	.xword	0x6994391ff321d47c
	.xword	0x50d6963c967896f0
	.xword	0xd92884c32efe2ec9
	.xword	0x16c9d7030d8eae85
	.xword	0x0c9e11a6ee847660
	.xword	0x2688ba7bb1a90616
	.xword	0xc81d3fda7bac13f4
	.xword	0x20abeb6d5ed3acc5
	.xword	0x467ab15499e5fe21
	.xword	0xb12dcdb641421db8
	.xword	0x1a36d955ac182b56
	.xword	0x372363620713e64d
	.xword	0x68cd73e9146b4e9f
	.xword	0x353a1120ee853892
	.xword	0x5324982240c97422
	.xword	0x49814a0bec3ce94a
	.xword	0x2d892305da8ef235
	.xword	0x394468ff14baa43b
	.xword	0x2dfe87059c0fb5d1
	.xword	0xb32683660bfa2d15
	.xword	0x698e71612dc4f702
	.xword	0x60370f7de531c60f
	.xword	0x9c3408b49646c1d4
	.xword	0xfff6e6cc8bb7737f
	.xword	0xb2e7966de3e58e4f
	.xword	0x27f0cf6312fe4623
	.xword	0xdb407d7695a9bbcb
	.xword	0x93955cabb6aac53d
	.xword	0x6f184cd14252e5e2
	.xword	0x0d3b5f7e370358f1
	.xword	0xfcacbfd990653219
	.xword	0x47adbe899c6dbfa6
	.xword	0xec340081c95de059
	.xword	0x60a2094b1fee803b
	.xword	0xb9fb2aec0c4efad1
	.xword	0x3b8cb38a43de3d0e
	.xword	0xb08f0b45f4625300
	.xword	0x993998e8ee2541de
	.xword	0xf8bf284509653347
	.xword	0x4c3c5770a1ccf95f
	.xword	0xf72c12f70d471c29
	.xword	0x8d5398b10e48db81
	.xword	0x6e1e083b0e8bcfbc
	.xword	0x95f0db1b667b59e0
	.xword	0xae9394fed38c3c37
	.xword	0xaafc2d0ca4b40ee0
	.xword	0x08926fd6e9315040
	.xword	0x7743dced0eaa2dd3
	.xword	0x03acebaa42e7cbb8
	.xword	0x9f950d189eb59513
	.xword	0xd076f5ce6eef5818
	.xword	0x719ce874e3e9f942
	.xword	0x6d0992996370e39b
	.xword	0x00f91d50183eb07c
	.xword	0x055d7c155363279a
	.xword	0x72138322a5d71e1c
	.xword	0xb0f84917a83ec14e
	.xword	0xb92fc702c18b87d2
	.xword	0xe45110a3bb7a0111
	.xword	0xdf761cb306ccc688
	.xword	0xa32dedaa75bcee35
	.xword	0x8c974899007f6662
	.xword	0x3e329e18fd849a65
	.xword	0x8e9080b82e8f4a8b
	.xword	0xbe386f2a70e1b3a6
	.xword	0x886238d17dc62d4b
	.xword	0x825adec15987098f
	.xword	0x4645ad828d2d2021
	.xword	0x07b1181ff263fa33
	.xword	0x9aea319049e6e8bc
	.xword	0xced4d006127b257d
	.xword	0x724bf3b333c24690
	.xword	0x39760ef967cc76b3
	.xword	0x302cdac3e30b8b7c
	.xword	0x80545884816ab9ba
	.xword	0x005a92386bbddfb7
	.xword	0x93b40a8025cff6d5
	.xword	0x8c9012ee96b3445e
	.xword	0xd92eca349093b2e7
	.xword	0xd9b6363ee79a2986
	.xword	0xe1b3af303c0c4a29
	.xword	0x94bb0b062c819839
	.xword	0xa5ef9c2cf80a684b
	.xword	0xea99069dfb53b72e
	.xword	0x1891c39b92d58ee5
	.xword	0x605330ad28aed95a
	.xword	0x4507bfaf167a0a22
	.xword	0xeead98d6b3a6a6a9
	.xword	0xe30cf174ed9b7b05
	.xword	0xb8125f11029eb1b4
	.xword	0x4bf4d7b37229e464
	.xword	0xe0df866ce4c6e33a
	.xword	0x7042aae5dd9e9d39
	.xword	0x9909b02c7dd53d55
	.xword	0xff0ec53ebfdab0f2
	.xword	0x8d1b0887ebb71d79
	.xword	0x41d8d8c7f6cb0acb
	.xword	0x7d9a49749aae9be3
	.xword	0x852425a6077103b7
	.xword	0x928f25912662c3b5
	.xword	0x7bd558b27654f3a5
	.xword	0xd5858a767a28be6f
	.xword	0x3ab462a6a147eff7
	.xword	0x5dedf2adf5336d8f
	.xword	0x1c7d8572eb4dba24
	.xword	0xd52179dbc454aae4
	.xword	0x7d64632491d8af18
	.xword	0x9ac7817b088ab6a9
	.xword	0xe6baf9c8297895c0
	.xword	0x7436c80256874654
	.xword	0x7f936b97d7db71b1
	.xword	0xa312895dbc79503e
	.xword	0xbaa6028447d5cdbb
	.xword	0xb0f7ce4f79afb911
	.xword	0xce568fcad57829e0
	.xword	0xdbd6b6b003a7c24c
	.xword	0xeda74aee4eee8e77
	.xword	0x7f79ae1e360fa948
	.xword	0xd1ddff19acd8c562
	.xword	0x92166cf184106028
	.xword	0x402461c3fb4cbac4
	.xword	0x46f0abd7358fd2aa
	.xword	0xb7bee4a97349d07d
	.xword	0x6748cd1a66bc2e8f
	.xword	0x9fcdbcf06e47877a
	.xword	0xb886062b26ec917c
	.xword	0x78e6efcf54ac65f2
	.xword	0x7c3c00b4983869dd
	.xword	0xc360c20008efccf2
	.xword	0x993598ce78394cb5
	.xword	0xdd91229b18ada221
	.xword	0xb5e247a0809c85e7
	.xword	0x4bc78afa2396d6eb
	.xword	0xa5b1fba242f2de34
	.xword	0x72072207727ae3c0
	.xword	0x3667e4c72d440109
	.xword	0x31ad5b619ca756fb
	.xword	0x6f64ac4c145f9d94
	.xword	0x6372510aee8a8644
	.xword	0xe5a66410224e1f60
	.xword	0x5f29cd58e30cefe8
	.xword	0xbd0534fceb2e608b
	.xword	0xf0bc4b8c8690586c
	.xword	0x9dbae3048bf1f6da
	.xword	0x3b319fbbb44afbea
	.xword	0x24dda4123fd81d43
	.xword	0xba00393c581faac5
	.xword	0x2d4731fd29eb3785
	.xword	0xed9432945458536a
	.xword	0x75f9b88c48826bc5
	.xword	0x759663ba4da80279
	.xword	0xd2bef35a87992964
	.xword	0xa80d6cd6038e80c5
	.xword	0x28821886068e51b9
	.xword	0x12e075776791c72d
	.xword	0xe62f52ef091ee7f8
	.xword	0x1ab55399918e5906
	.xword	0x4917732bba66f64b
	.xword	0x4df5ab6e602405c6
	.xword	0x3855f2646276abde
	.xword	0x08f50efba8ee519a
	.xword	0x499d4ad4911f5937
	.xword	0x102a0fac387ba3a4
	.xword	0x258099e782049b84
	.xword	0x26f206595e2495f1
	.xword	0x7067e51eaf58cb8f
	.xword	0x95bd06a575c5c316
	.xword	0xac72a5bfaa3ddb5b
	.xword	0xf5ab29c48c9fcfcc
	.xword	0xa21c823f43205bee
	.xword	0xadac95092cc0a753
	.xword	0x4fdeba662db03ec0
	.xword	0x74a0f3776253d8a2
	.xword	0x4a0487afc8996328
	.xword	0xe26dfa9f1bd5baea
	.xword	0xa8fa67583cdd7822
	.xword	0x47b46eeb7fcffea0
	.xword	0x16db07a6d4c0cfbb
	.xword	0x9905359ace203baf
	.xword	0x7145616fb31dc126
	.xword	0x467cbb68049b74e6
	.xword	0x1ec311cad1613ce5
	.xword	0x256fe1696884a3d9
	.xword	0x969ac8e0896759a9
	.xword	0x170f86fbc288a90f
	.xword	0xc946d4d3c7b54336
	.xword	0xd0f9265dcc67c187
	.xword	0xaa339d86c8caeebf
	.xword	0x8f61ce218a85b578
	.xword	0x37a35557f8bc1892
	.xword	0xd925c0547f8cc006
	.xword	0xd7738e633b7c0633
	.xword	0x1b7cbbaa5fec5d38
	.xword	0xab93a500430a98ff
	.xword	0xde4488d645a96320
	.xword	0xb1568998da1faeb3
	.xword	0x9b40e7b654df915a
	.xword	0x18a6e8636c771f89
	.xword	0xa45d2bb893913531
	.xword	0xa69f7c1abb8672d6
	.xword	0x3318181a9d6933c2
	.xword	0x1b87d7ed41c1990c
	.xword	0x99e1acbef4ef0218
	.xword	0x1f56d384643578d2
	.xword	0x96e45f9521045983
	.xword	0x88a6d9cdb8b94f52
	.xword	0xb1c844bda6d8fbed
	.xword	0x3dc1561ea13ec3a5
	.xword	0xdd09490cfc0a6961
	.xword	0xfe8517f65ff395ee
	.xword	0xd09ef3b1a7f78e65
	.xword	0x626042f0eac8ed7e
	.xword	0xd3a487b4e6db0a12
	.xword	0x59b285f91ce2ace7
	.xword	0x8f508ee649cbe7ff
	.align 0x4000
	.data
data_start_2:

	.xword	0x3225eae1c6001dbf
	.xword	0xba89e551149cd0a8
	.xword	0xe6d34a19e35789de
	.xword	0x1b4eb1feb1b4fa7b
	.xword	0x3a386357fd2369c8
	.xword	0x0498334fc8512e60
	.xword	0xd6528cd4afc87d10
	.xword	0x9147715187ba739e
	.xword	0x14b5a3ef81054e9f
	.xword	0xc44cd631624d1025
	.xword	0xc0780f9cdab0882b
	.xword	0x7312d8dc7a018c1f
	.xword	0xf8f94ef9f090f00c
	.xword	0xa2164d12a2f86db7
	.xword	0xeef573502c10bd14
	.xword	0x98ddebc4eab06b25
	.xword	0x29e1f52cc00ad337
	.xword	0xef30801c26b6934a
	.xword	0xc42355ea34c1322d
	.xword	0xe1b4eb74adca2425
	.xword	0x7b408fd685b3277c
	.xword	0xf4667f6706d58a66
	.xword	0x18b7c55e94e870de
	.xword	0xd7c3cbccc448a632
	.xword	0x8da5eadace310e7a
	.xword	0x911103c1ba314bb1
	.xword	0xf39312815f4bf757
	.xword	0x4f86967c79b2698b
	.xword	0xa8ce643a1ce36e95
	.xword	0xd0c8f843419c0383
	.xword	0xd582a401176a8f8d
	.xword	0x87776f2098f1191a
	.xword	0xff4ce22230f77249
	.xword	0x13e3c940b964c785
	.xword	0xee72b47035fd8aca
	.xword	0xbf73dfc8c6cc4cf8
	.xword	0xb10c000528b68585
	.xword	0x4a6fe1410af0b09e
	.xword	0x688532c49f3788a3
	.xword	0x3a80554351841811
	.xword	0x8fc2080668ff437f
	.xword	0x441accb513751995
	.xword	0xe5d48396bcd6801c
	.xword	0x43d99baf60066482
	.xword	0xff93593b73390c34
	.xword	0x089a3f44691e8fa4
	.xword	0xcade2d9d866070bb
	.xword	0x9e6fa87a22696fc6
	.xword	0x367db2b52533cf4d
	.xword	0xbdd4ac527a0531be
	.xword	0xb0692d56969e9313
	.xword	0x3d339e27165e2cd0
	.xword	0x6eeebe7aaf8db42d
	.xword	0xb2872d41f2e2d677
	.xword	0xd202e78250cfce93
	.xword	0xf25a1f0628410747
	.xword	0xea959b0882dae1a3
	.xword	0xbb4d3fe3b4a43d7c
	.xword	0xb3022393eea8f322
	.xword	0xdca6ed0aee2c620e
	.xword	0x9503faf0b0a68f01
	.xword	0x9b1699f5f23050e6
	.xword	0x2daaeab407d89673
	.xword	0xeafe87e538b19dfd
	.xword	0xd9d43dfe65e8f457
	.xword	0xf014e419b3bd6eeb
	.xword	0x2f48ea5abf98f44f
	.xword	0xbbd17b30f28a177f
	.xword	0xd6dcf80a8dbd5996
	.xword	0xef90a998d71d76ef
	.xword	0x89ca8f4e25c4fc3c
	.xword	0xfd6cd62b837196fc
	.xword	0x46129a1062a881a8
	.xword	0xa2155fd8a5e6572e
	.xword	0x44c1686cce40efe5
	.xword	0x5112b1981eeddc1c
	.xword	0xc018d67675d1242a
	.xword	0x29b5447363b046d3
	.xword	0x147a2bacc634712d
	.xword	0xd05638fe5037ea68
	.xword	0x8cc6427877a2e6eb
	.xword	0x49707ed3078d3d1b
	.xword	0x379f77e4a05fddee
	.xword	0x81dad1ab24a6c608
	.xword	0xfc9691e6bda40414
	.xword	0xdff26111022288fb
	.xword	0xc4ebe9fa50810fc9
	.xword	0x0a0b467ad1f919a5
	.xword	0xf7636f2fc267efe7
	.xword	0xe87a4e609ac3f19a
	.xword	0xa41667f0ca30abda
	.xword	0xe2f71daae97bd74e
	.xword	0xd2b5cdf8aa402325
	.xword	0x50b9417df58ba6cb
	.xword	0x17370bef0da31352
	.xword	0x4f63b268cec8b6c0
	.xword	0xd6ba947d51391042
	.xword	0x6b97a33b09041133
	.xword	0x96189f33098778dd
	.xword	0xd856f88945bef155
	.xword	0xbdbb6154d21f3216
	.xword	0x0d72fcb871f7a667
	.xword	0x889450305fe32ea0
	.xword	0xd1f88c9b469ff68b
	.xword	0xec99c0214dd249ec
	.xword	0xc9ffd30cc96be0a7
	.xword	0xc4b833230c4b097c
	.xword	0x6bd5d27a9e78a1b3
	.xword	0x47a70459d9420ff9
	.xword	0x04217880099d90c7
	.xword	0x0bfe7e423aa7235c
	.xword	0xe29785f43e5736c6
	.xword	0x4eceb16ac89a5cae
	.xword	0xf6ff291a79d60d38
	.xword	0x4dd3aeb6d4aa39cf
	.xword	0x5cb6bdc5cf3ef5a1
	.xword	0x7f3985762aaa54d7
	.xword	0x639976bf7c71476f
	.xword	0x7e54f75b86ff8c5f
	.xword	0x3ca00c4ede7e8873
	.xword	0x6ef7a0783edfd2d2
	.xword	0x979f2424ddeb5c79
	.xword	0xcee8d9592915f54f
	.xword	0x253a2623bc1c0295
	.xword	0xcbd6949bfd8797d2
	.xword	0xfad5fd48825c4956
	.xword	0x70d8464daa80b20a
	.xword	0x0496a7a5a3b993ad
	.xword	0xbede01f212a40208
	.xword	0x152824382ad83213
	.xword	0x8531533c33d62d12
	.xword	0x7529b2efc1f02221
	.xword	0x3980d56dfa0e6fb6
	.xword	0x443d50509cae5218
	.xword	0xe04d41867bf0f5ad
	.xword	0x814e77700d10b243
	.xword	0x2f3f7eda915aa473
	.xword	0x06a48b7276cc67e2
	.xword	0xdca19296092f1e04
	.xword	0xab5e5c635c25f040
	.xword	0x2f6c74450c782496
	.xword	0x66739c454d29d05d
	.xword	0x85ab18e81a11a253
	.xword	0x8a881d3463ffbd4d
	.xword	0x3d699e5e65ec7ece
	.xword	0x79d5bb04b18453e9
	.xword	0x1b8fc4b5c6947b24
	.xword	0x44676ccbd240e783
	.xword	0x30db92475bcde52b
	.xword	0xc1ca461fc502afe8
	.xword	0x725741996faca8de
	.xword	0xe0a24d6c12e1bd4f
	.xword	0x54b289cb185c920d
	.xword	0xbfef8642239a056c
	.xword	0x52b0215dedbe4fa0
	.xword	0x54f26ee6225e1ab4
	.xword	0xd8506da85aad9f98
	.xword	0x73feee29aa09f061
	.xword	0xc1cd3d18d009635a
	.xword	0xf3cf3f54b75b9465
	.xword	0x742e0b14d1b85483
	.xword	0xf2fe9f6c978fe17b
	.xword	0xbe12ce548aa8604e
	.xword	0xa19f12170433121b
	.xword	0x6308ee194a8eeb34
	.xword	0xbc6dcbae4958d0db
	.xword	0xc9cfa58ad2b9ea48
	.xword	0xced4afb42bf6d924
	.xword	0x02f8de5eb50562ed
	.xword	0x395a79120eb495fd
	.xword	0xa52c80bb5aa9f11d
	.xword	0xbfad5eab961ede9f
	.xword	0x306a9a152f11095b
	.xword	0x367626d5a2ab337c
	.xword	0x269ac8e6bac58a60
	.xword	0xe25ddb8f96e29cc9
	.xword	0x8edf8b154c84a20c
	.xword	0x1106ae4f5f230259
	.xword	0xbc86e47a5519dc7d
	.xword	0xf6e6b71fccefad54
	.xword	0xfe044b161dc3b376
	.xword	0x5ad56bdde7a1da3b
	.xword	0x728dc2fa7f8c5f87
	.xword	0xe9dec6972fb9f80f
	.xword	0x736905544769d2da
	.xword	0x78031a38de7d4302
	.xword	0x81be10f256e73679
	.xword	0xfaeea1b3f6a2db5c
	.xword	0xee016bdba60e4ffc
	.xword	0xc79bd6ccbefe5f02
	.xword	0xf27148bcb8b939dd
	.xword	0xd954a28a7d89e7da
	.xword	0xc19b24cfc780af94
	.xword	0xbcb72b330b7d8646
	.xword	0x9afe379779fccd7d
	.xword	0x1b031f56d7f9b2d2
	.xword	0x1cb59f107df06adf
	.xword	0x2d25a82c619402bb
	.xword	0x0dca89daac7bd92b
	.xword	0x57087828b84f8687
	.xword	0xdba7f3b1d4ec6e78
	.xword	0x9a6457ab8027d68d
	.xword	0xc01e6c1d1fec2a75
	.xword	0x334abad752319597
	.xword	0x805544565ff63865
	.xword	0x06b7facf77cc4273
	.xword	0x10b2a524561623ad
	.xword	0xd35ce0139d326958
	.xword	0x4ababb5dcd91161b
	.xword	0x278a651fd5280c52
	.xword	0xf9dedc5df8f75bbe
	.xword	0xf49bb810391b6b2e
	.xword	0x8e8085d1f07eb2ab
	.xword	0xb2ae0757f553b68e
	.xword	0x1444623dafc504b3
	.xword	0x7401930e632710b8
	.xword	0xe1393f0e4183699e
	.xword	0xec3ece820436c901
	.xword	0x3bac8b460c5875c5
	.xword	0x31e297fadcd9a06e
	.xword	0x06b315eb192bf0fb
	.xword	0xfcbe6d3c1d11d875
	.xword	0xd384bf10cad2329a
	.xword	0x7a00f4a6054e987c
	.xword	0x0b2d1d15457962a7
	.xword	0x4496f2a9258e2a5c
	.xword	0xa265c5e484210787
	.xword	0x8ab570907ba7e72b
	.xword	0x65ee7372db354814
	.xword	0xce27c6f2b5f95156
	.xword	0x674a4c94ef766057
	.xword	0x63fe247b8fa9eee5
	.xword	0x80196b22af7144b4
	.xword	0x5dd4bfb2a1ddec2d
	.xword	0xe8d0db4efe0b5817
	.xword	0x9a9826d5f59d05f5
	.xword	0x50dd23cc71f9fc08
	.xword	0x22ece5b5489f4681
	.xword	0xf8d825e01b1fe082
	.xword	0x6ac2cc9dac272cd5
	.xword	0x544abac7f4bc1ec4
	.xword	0xc64010e95029ac43
	.xword	0x9f95536ff0c4d453
	.xword	0x26035fc177c9f902
	.xword	0x95bb8aa5ee5067ad
	.xword	0x8788c29d44eb4593
	.xword	0x190f787784c1bea2
	.xword	0x6790f7ecdac72304
	.xword	0x8d0b5cb1cdc4f2a0
	.xword	0x5069b91b446d8395
	.xword	0x5c6818ae1d297f08
	.xword	0xbafddb2dd1dec694
	.xword	0xa49721188d28c19d
	.xword	0x68d9afd73e84be07
	.xword	0xd2b05fbb35eed4de
	.xword	0x912eaf5b73a767cd
	.align 0x8000
	.data
data_start_3:

	.xword	0x3a2d5465cc8fc675
	.xword	0x1acda1d3ddddde75
	.xword	0xca7ee6c24fa45002
	.xword	0x1d9c4e1a9e325522
	.xword	0x3296da4fff0dd6dc
	.xword	0x18e931e258042663
	.xword	0x9c77bf76c2f1e1bf
	.xword	0xc9524da79cf4a603
	.xword	0x7158b3666f32ffd9
	.xword	0xb7d31cb8f3de5d46
	.xword	0x608a1add2853dc7b
	.xword	0x1752223e247943bb
	.xword	0xb3d1b11b1e5e8682
	.xword	0xa20193fffa8cc969
	.xword	0x1e5172daefcb4cc9
	.xword	0x864ac35f771ee213
	.xword	0x47ccf5ed11fac7b3
	.xword	0xd5b3a07e9eedf587
	.xword	0xfbefaeb878e5b45b
	.xword	0x1d44ead32b549e1d
	.xword	0xef0f9d59d540ec8c
	.xword	0xf463e9acd21d9b37
	.xword	0x3d2ddf1042e2a1f6
	.xword	0xb1f6972d5ba1cfaf
	.xword	0x2d91f98042a5cc32
	.xword	0xeed0cd9319129c92
	.xword	0xeba37ec27a92d7f4
	.xword	0x19218012207762d2
	.xword	0x1c0c479bd44ebe56
	.xword	0x46b5e8ce1f283489
	.xword	0xffa7e7f329d9a0e0
	.xword	0x26fca8d1903dd0c4
	.xword	0xf4322fe9d361b823
	.xword	0xd855c58b26e37b5e
	.xword	0x7a9557e0bf03ce79
	.xword	0x5c50d97a3025feb2
	.xword	0xf1ec455793091000
	.xword	0xfc289997ff9dfd04
	.xword	0xbf8d102c1039e7c7
	.xword	0x4ac26a5ececc30a8
	.xword	0xa6c05913c062443b
	.xword	0x66641c2e3c64faac
	.xword	0x925542a0bb7b7a54
	.xword	0xa68175257ab3c7d7
	.xword	0xd53c02344652dceb
	.xword	0x5f7d9e5460f4faed
	.xword	0xd809ef3295fbd368
	.xword	0x242bfd6a66c7e7b9
	.xword	0x3273d8b6b80abf54
	.xword	0x18ff696724d1e7cf
	.xword	0x3e4ad0b99b3c431c
	.xword	0xfff400a5ae7a3396
	.xword	0x40516e5ae4cf0b1e
	.xword	0x07c690442ad9ffb5
	.xword	0x0c85689b1bbb75ed
	.xword	0x4314a05ef93a8be8
	.xword	0xd3c5dc04d087d538
	.xword	0x429bb29d79448dc4
	.xword	0x6c4e404ab65414dd
	.xword	0x363fb706e7a137f0
	.xword	0x0f85f9c429982097
	.xword	0x6433524b80921b6a
	.xword	0xbe4f0ab437e493a7
	.xword	0xc76df68e7f942c2c
	.xword	0xa0c01fef8a83ef61
	.xword	0x765b4e5f387b7594
	.xword	0x85469becc8390ab0
	.xword	0x1fbba152d80af253
	.xword	0x3f923aa13f29e8e3
	.xword	0x39cc99164b4c44d1
	.xword	0xa15dfc7a0136a040
	.xword	0x3fbd00af3315af66
	.xword	0xbde89f8a36077352
	.xword	0x66e3c5d30acbebe2
	.xword	0xe25b33556a30f846
	.xword	0x368b52dcfd361957
	.xword	0xab5f1cc26dfa2be1
	.xword	0xe19b683247b7fe56
	.xword	0x5256d89872b624f1
	.xword	0x9b9149d70b22725d
	.xword	0x810ba9cd7d5f0357
	.xword	0x37c76b5bc3295cd9
	.xword	0x3638ee9ebb632c82
	.xword	0x6273c697c5b3b1a2
	.xword	0xb8e3cd94ee672e46
	.xword	0xd06d60f681f954b8
	.xword	0x3fa95cd77431cac1
	.xword	0x48b42ab97e893d5e
	.xword	0x32e481659bd3368e
	.xword	0xaa55fda9a21d69c2
	.xword	0xfb22f6815ac43778
	.xword	0x94180d941c88dd70
	.xword	0x34d267a488d034e9
	.xword	0x63b50f34a33d7812
	.xword	0x361fb1c62f840d07
	.xword	0x6efec92767be51bb
	.xword	0x0e2e21e6060a97d8
	.xword	0xe08a0cab9534cde6
	.xword	0xd7e9e2c798a769eb
	.xword	0x959b7ee33782870e
	.xword	0x80f390b1e0d5bf8b
	.xword	0xe9919d8a4c19f96f
	.xword	0x35dbd4e4c94a2ff7
	.xword	0x091aa7c1456fb94b
	.xword	0xa737b835f1250c5e
	.xword	0x23da8d6795e14e10
	.xword	0xd059045d4ac5174f
	.xword	0x6bdfa666fe6d675c
	.xword	0x08858445a9815f15
	.xword	0xa02042c2297419ea
	.xword	0x55fafd935deb194a
	.xword	0x78c73b114cebdb3d
	.xword	0x6f0bc2c8774bec43
	.xword	0x7b6414d9b91bb994
	.xword	0xe22b111cf835a9a6
	.xword	0x1b9234998b0e61da
	.xword	0xc3839d32863ae576
	.xword	0x98a12a5e7892b6be
	.xword	0xe4a494942fcc0c6c
	.xword	0xa3953dabbc8f7922
	.xword	0xe6a4072f2307bd9e
	.xword	0x4026a773c8305016
	.xword	0xb08649c9fc606b78
	.xword	0xfb826023f576e4a6
	.xword	0xf8a380de23cd0df6
	.xword	0xc1fa90a707e36ffa
	.xword	0xe84b141ef781e941
	.xword	0x0abdc027c1344d18
	.xword	0xccd8aac266ecb5d3
	.xword	0xd990d270288b22ce
	.xword	0xf978bde3feaa6138
	.xword	0xc3b89bfa4b2a4858
	.xword	0x3ebf9fd09776a518
	.xword	0x359c9a7497a13bd5
	.xword	0xf90be71afbc46d12
	.xword	0x646562844c5aad25
	.xword	0xd840dd6bbaac1118
	.xword	0x8da1605fd6a07d99
	.xword	0xc467b4853e8b4285
	.xword	0x028460f70e49ed84
	.xword	0xcba03cd2064f27d5
	.xword	0x994f81ef6dc0a31e
	.xword	0x8b24268495ac7ec8
	.xword	0xad769c247ad5c4f7
	.xword	0x68959875aeafb992
	.xword	0x6ae3baada9af444c
	.xword	0xd70b686854df17e1
	.xword	0x4d7675a960fe5347
	.xword	0x5520ea673215dc70
	.xword	0x3b45c14d2771104a
	.xword	0xee4c413c3c36e9b3
	.xword	0xc985f5a25ac90a1d
	.xword	0xf9cb512fcf6956db
	.xword	0x612ab89f64a92b3d
	.xword	0x107f51215efba5ea
	.xword	0x4cc0aa3914ea0c6f
	.xword	0x4e262deca77be45f
	.xword	0x8595664c3e6a9ead
	.xword	0x3634d83965daaebf
	.xword	0xbba24dd7d9be09b2
	.xword	0x29548fffc785a65d
	.xword	0x8d5f0fb1371fbdf9
	.xword	0x47d8daf2a8e259bd
	.xword	0x3e95e39a0ab62cbc
	.xword	0x3044a7dc4ea6507b
	.xword	0x1b11b57fdd11549b
	.xword	0xfde913bfac3f4559
	.xword	0x7fa1817c9fe44f83
	.xword	0xe8055ce69072bb20
	.xword	0x6f317dbe72cc0c89
	.xword	0xa19a7fe15666f73b
	.xword	0x2c5d3c782e461d8c
	.xword	0x7075c9b1c66ac051
	.xword	0xf20893e1e51bfb41
	.xword	0x9397067a4348f72c
	.xword	0xc2bcc67e12901cef
	.xword	0xfb6c32140ba1affa
	.xword	0x235c2d8e9d12a2d4
	.xword	0x745c8343979a4e83
	.xword	0x4e58a77d03e1d67e
	.xword	0x63fdc7d80ee5a9fc
	.xword	0xf3a1d864c0342adc
	.xword	0xfe9b6f2f7b20c8ea
	.xword	0x464d2bf43e4b5f83
	.xword	0x3def87515c35148c
	.xword	0x0b5203cb872e6de4
	.xword	0x97dd0f8ff97527a1
	.xword	0xd357b62e63b411d2
	.xword	0x045353aea54d6dc2
	.xword	0x81306a04bd4b5f4c
	.xword	0xa02628b9d2bc5dff
	.xword	0x48355d96b20b9b9c
	.xword	0x27ef1b528b9be059
	.xword	0xab944fee2a81de71
	.xword	0x42162e412d59d21d
	.xword	0x1fb48eee288ef744
	.xword	0x48567aa11114abb4
	.xword	0x37e4ce40ff3afd3b
	.xword	0x34d286fd3cf78adf
	.xword	0xb00ea6753af1b65b
	.xword	0xb862ab86265a0395
	.xword	0x7d735ce669c9d95a
	.xword	0x488ef2538b53bb17
	.xword	0x06ac2c84227cafee
	.xword	0xb50b712f0d1ebe35
	.xword	0x9716eaa5f0098b75
	.xword	0x19fa3c48bdb9db50
	.xword	0x64bcfd929ee0e516
	.xword	0x16d2dc9c390055bc
	.xword	0x449d7303f0e35822
	.xword	0x6506e016286cde19
	.xword	0xe185d8a6cc12e280
	.xword	0xd185e70ae5174208
	.xword	0x6665bca4405a02a4
	.xword	0xc571c4b58366b99c
	.xword	0xb2629219974578dd
	.xword	0x7ecfc67cdb807ed1
	.xword	0x162ca88f0906f214
	.xword	0xa08061e314f9e1a7
	.xword	0x4413f6c8de674960
	.xword	0x47e618674a7c4b63
	.xword	0x306e6f77357d65dc
	.xword	0xbb254eb98f540c03
	.xword	0x5265a6fd13d6e3bb
	.xword	0x698b423ed36e965d
	.xword	0x2ce9b80df3ca278c
	.xword	0x5308f885e9a2d2f5
	.xword	0x2f79dabb868fee82
	.xword	0xa9318ecc7b1dba8f
	.xword	0x8c67e6d29ebd2e06
	.xword	0x004f6cf70f4f67d7
	.xword	0x30a481a66e30287e
	.xword	0x9b5f251fe990c366
	.xword	0x15522be810a014ef
	.xword	0x5dc9de2570e0860c
	.xword	0x82a5b26f6cfc9c22
	.xword	0x8865f056b1cf8cab
	.xword	0x5f3b317a744ee907
	.xword	0xf4bcb6540df56868
	.xword	0x5361248261a98c68
	.xword	0x69f704b788b07621
	.xword	0x438fd866a93e032e
	.xword	0x76ae9c3d74e8b806
	.xword	0x3ae74246bacc0fd7
	.xword	0x6d0389e651770c53
	.xword	0xd35f2d078791baad
	.xword	0x1ea30a758055948a
	.xword	0x26e2f57d3fafe353
	.xword	0xbabc6d46dfc1094b
	.xword	0xf97e8adf162a46b1
	.xword	0x2d016cf39ebb209e
	.xword	0xa794b2b16b3133dc
	.xword	0x419d24f5de1e5e03
	.xword	0x55b114256aff8456
	.xword	0xf86b28ce2d9761d2
	.xword	0xde37842383a26848
	.align 0x10000
	.data
data_start_4:

	.xword	0xb4e987939ab413ac
	.xword	0xeac04f1925246b79
	.xword	0xcde551ed711b4d80
	.xword	0x9dbe14ecc9595006
	.xword	0x8efc365852afcd56
	.xword	0xe1b64c30d0e8cacb
	.xword	0xa377e4d9bb01f76d
	.xword	0x4af5232be143edf9
	.xword	0x3f539c7f4738b1e9
	.xword	0xcec331427df3d999
	.xword	0xbc45aa28ea1d3654
	.xword	0xc33af4240cad5bcb
	.xword	0xe302dd22f3452da0
	.xword	0xb7588bad57f60c37
	.xword	0xd5d4a05542913dff
	.xword	0xe62ce914b98f0940
	.xword	0x663e515b8c2ac9d5
	.xword	0xc7d897e56064d773
	.xword	0x404328fb0173cbe2
	.xword	0x3a51b8991cbf106d
	.xword	0xbb6d386fd8378302
	.xword	0xd80468f684c04d09
	.xword	0xcd7b6ea250e569ba
	.xword	0x523d0aa0ddca7c20
	.xword	0x5552aec19d182aa5
	.xword	0x3d5ced311765a4a1
	.xword	0x225048275571286c
	.xword	0xa1ddfe815404e553
	.xword	0x94239ddb6f929225
	.xword	0x57b700331ad5908f
	.xword	0x24607c5966a28fd1
	.xword	0x12b3d2f37cc7817a
	.xword	0x8adf0304eb972e93
	.xword	0xb539759eeeef4fab
	.xword	0xc83954d8c4a59719
	.xword	0xad175b0838c980d5
	.xword	0xc30923acb931c9f1
	.xword	0xc64c9b732c932017
	.xword	0x8f2fb7f6a6ea6a21
	.xword	0x876de23a301c1390
	.xword	0xe0e8281a08dc875e
	.xword	0xf352e367ce93f77d
	.xword	0x857414d4304bf7b4
	.xword	0x6529af9aeb352b6c
	.xword	0x2785a60afa235dc0
	.xword	0xbb55d6657f8441a4
	.xword	0xae7f371fa8dff89f
	.xword	0x38913e0be9c76776
	.xword	0xc2b520c0c01696a4
	.xword	0xe350f646f1c74024
	.xword	0xffd5f475a04985d0
	.xword	0x90f74fbd1202cc2d
	.xword	0x2521420ee16ac0d7
	.xword	0xb8969f66fab71ec7
	.xword	0x8c9ec0e1c449b311
	.xword	0x898b9afb6e2519ef
	.xword	0xcd8ea7b6e86fd337
	.xword	0x95a7a0cb8e256f72
	.xword	0x5820e805e041bad6
	.xword	0xb04a81b4a3d5deb8
	.xword	0xc3ebd98cf931b342
	.xword	0x5a1394d77ad740a2
	.xword	0x1cb98f5e030ac9e7
	.xword	0x30fbbe25dfa2ec98
	.xword	0xc1962f002f62e134
	.xword	0xbe3bc71c8ef0ffa7
	.xword	0x54941aea3e4089f2
	.xword	0x20962241f60a07b7
	.xword	0x339578d510638282
	.xword	0xb3d6f01a4c067972
	.xword	0x7886d07e776f33ce
	.xword	0xda806f6fbdafc6a4
	.xword	0xcb540ac083396eef
	.xword	0x5823f309b856d77f
	.xword	0xd398757c06060d0e
	.xword	0x3fbe3b283da6dbfb
	.xword	0x59ab6443f4bddbbb
	.xword	0x230280b247f96dae
	.xword	0x9e22d4662e665829
	.xword	0xeebd8f6cc93b179e
	.xword	0x936144d863ed4688
	.xword	0x00a45c291d2a10ab
	.xword	0xbd8c83e024a6bc51
	.xword	0x9673949858a4774f
	.xword	0x93f79398298bd29b
	.xword	0x54bc6d8ade49f447
	.xword	0x92329475b557393b
	.xword	0x460341f798145a14
	.xword	0xa9a2434b8a64dfe9
	.xword	0xb8f79e6253db7a2b
	.xword	0xb13e1dcbcdafb736
	.xword	0xe970665aa616a989
	.xword	0xe649524cc25793e0
	.xword	0xcc261b545f9465ad
	.xword	0x23545492e86c71c0
	.xword	0x7f52850a0632d052
	.xword	0x8fe2bbc35555c95b
	.xword	0x08ac0171afb38af2
	.xword	0xd2bed3dcd32d173b
	.xword	0x6633f41c67843009
	.xword	0x9700f2901d859650
	.xword	0x4a9d23c6b265a514
	.xword	0x23daf6c4b2d057a9
	.xword	0x6a226bfff2e65b7f
	.xword	0x73410694f53c6789
	.xword	0x0ec8bdc4be94b54b
	.xword	0x2b079ba1ca96dc4d
	.xword	0xa00343e6a794e3dd
	.xword	0x3b2eae11737ef5fe
	.xword	0x7f86aaebc72eb1fa
	.xword	0x96c6a919d762599a
	.xword	0x73f937874db956a6
	.xword	0xd4d52419699174df
	.xword	0xd78fd35eb3d2521a
	.xword	0x53c8f28b19038aee
	.xword	0xbd7602c816bccdf4
	.xword	0x05baf938b3fb4f68
	.xword	0x284f9516df6aacaf
	.xword	0x458cd023c71cf3ab
	.xword	0xaa2b975f0ad5bf25
	.xword	0x482eaca4419ae3bc
	.xword	0x88f431cd2f22d53f
	.xword	0xb1fac3b7df1ffd3b
	.xword	0x72666773c41c46cb
	.xword	0x6dd98a09561dc160
	.xword	0x37f9fbb2042a5b54
	.xword	0x204edb29ffc2e16f
	.xword	0xedbadd0081b68535
	.xword	0x326d7e5f5a9cf830
	.xword	0x70bde47b4b63e747
	.xword	0x7f499111f4ace25b
	.xword	0xaeebc4bbf7e2fa00
	.xword	0x0dd3097203ee9396
	.xword	0xbd753f20f662f714
	.xword	0x34ceed7421ea591c
	.xword	0xce2ca652329f633e
	.xword	0x86e1a9149a0995e9
	.xword	0xeb9e1224f262b57d
	.xword	0x8284d1de02794c09
	.xword	0x95118ab68e1e8e85
	.xword	0x05fbc7d6590bf623
	.xword	0xc64e42eba8beb798
	.xword	0xede92e2780fe62a1
	.xword	0x7e3627c843f83d2a
	.xword	0xefa2a58b0423bce7
	.xword	0x84baf53b8da77660
	.xword	0x0e1a167eac9b4db9
	.xword	0x7f8bc7f3bddfb094
	.xword	0xfffafae2d74b1027
	.xword	0x2e1cbb44419c6b54
	.xword	0x0fe17f3ee1c0c9b3
	.xword	0xd7566a9ac80568dc
	.xword	0xe15f74e0ce0b8192
	.xword	0x67dd642a33255c91
	.xword	0xbc676adde90ac177
	.xword	0x075f4eb252894c34
	.xword	0xc8b613ef4d5b3037
	.xword	0xe8258faf8d961cca
	.xword	0x2d6200760cc5149c
	.xword	0x2eb80f37e3f3cbbe
	.xword	0xc180b41eefa46629
	.xword	0x6772312959d5f25b
	.xword	0x216f9f405dbfce0e
	.xword	0x51ca95243e9cd754
	.xword	0x5452bf9b85389f85
	.xword	0x2d52540688d929b8
	.xword	0x00cdd11524acbc86
	.xword	0x01850e65b7b6beb9
	.xword	0x8ed4f770361636d3
	.xword	0xf69e47a294e66d4b
	.xword	0x73477664a475b166
	.xword	0x6667adb4342eb77d
	.xword	0xd593878aa6b9823e
	.xword	0xf36f7506c0add888
	.xword	0x32cb2e85ce6a06d4
	.xword	0xcb5908ea493806a4
	.xword	0xc342ada5b08fd14e
	.xword	0x4f74932868fee303
	.xword	0x22ecbf576ab3d116
	.xword	0xb5a072c07663ca73
	.xword	0x9f86b7f545885b45
	.xword	0x9169e4ff9d6c1908
	.xword	0x2a6a87531cfebe7d
	.xword	0x7d1f8bec54d09e18
	.xword	0x9117c16eb980aaf1
	.xword	0x8cf220345e59e8dd
	.xword	0xb011e69d6d651419
	.xword	0x3b04f2eb7cb28358
	.xword	0x9146840fceff4bf2
	.xword	0x3567f5295d708272
	.xword	0xcf1f147d0f754f5f
	.xword	0x0493db229fd77ba3
	.xword	0x247042799688d7f4
	.xword	0xe89a4e3bebd5ae33
	.xword	0x528e4de810ef1a52
	.xword	0x841e40f9b5b749e7
	.xword	0xea6c54727b8a3bff
	.xword	0x4a6a606f584aae4b
	.xword	0x1589627a8320a112
	.xword	0x8cb421b147512380
	.xword	0x237d3c65240fc6db
	.xword	0xd54d0d117382feba
	.xword	0xc37f50905a892cac
	.xword	0x549eabeb8a9e3985
	.xword	0xa5119b89cb89a6cf
	.xword	0x57a0af09b945b710
	.xword	0x43309af6715361d0
	.xword	0x5c198c1ffce5e6bc
	.xword	0x4cf61086e201cc6a
	.xword	0xb34712d92ebf8ece
	.xword	0x4e3f1da39aec84bf
	.xword	0x004f4c83ee1d11ef
	.xword	0xa8fb8339ced7cd21
	.xword	0xf03ccf1c9d655057
	.xword	0x2ee437e35ab57b6c
	.xword	0x3c2f8945c5b54ee7
	.xword	0xa45c7afbce8b567d
	.xword	0x4d180bd2e03b3e39
	.xword	0x0fc4aeea008d18a0
	.xword	0x88807e27e3c483dd
	.xword	0x48cb2550b172ae19
	.xword	0xa8a572aeace669f3
	.xword	0x40665c1f0de1998f
	.xword	0x2a817a71df46a3be
	.xword	0x315e9ec3fa47f00a
	.xword	0xea89a9c2cb4ddd61
	.xword	0x2a62e740ad742512
	.xword	0x94647af7d9237da4
	.xword	0x3d81d9a767c076fa
	.xword	0xf4de6c5842d82405
	.xword	0x65bb4a158517dc3d
	.xword	0x7a4b2bcbf7148642
	.xword	0x6e4a65580255980c
	.xword	0x2bb8896e6ad4b067
	.xword	0xd6131cdc25dc2579
	.xword	0x17238a4a6ff282e4
	.xword	0xb3e06780924e9ee8
	.xword	0xa3c46f7aac46bb39
	.xword	0x3af0604085cd4ab8
	.xword	0xad7bd55dc3a9bc41
	.xword	0xfaa90254acfc2abb
	.xword	0xcc5365ee58413892
	.xword	0xea1a56f34622b097
	.xword	0x789a0c2a6d89e40b
	.xword	0x9429f85aa4aadcfc
	.xword	0x7f466587e95a55e6
	.xword	0x7f0ea3a3d19aa0ca
	.xword	0x1a80048545a8f9ce
	.xword	0xc4461486cb08bf6a
	.xword	0xa8637a47c05c9831
	.xword	0xe7bcae071c148cd9
	.xword	0xdea9e16e07f33174
	.xword	0xd039b4d0c3861cbf
	.xword	0x7a981dda6cc35d31
	.xword	0x9e5587039f6b936b
	.xword	0xdf47feef3f94961e
	.align 0x20000
	.data
data_start_5:

	.xword	0x2f7e2b68454fd4ef
	.xword	0xe10b639cadd7c853
	.xword	0x972864166ca1899b
	.xword	0x789fea20144e1936
	.xword	0xc1f59b95861a38b6
	.xword	0x6db287e97b16d3d9
	.xword	0x3dba3a971207bd1c
	.xword	0xd1cc5f4e821240c5
	.xword	0x432f7cefcd88a3f3
	.xword	0x4d379cbf764b2aec
	.xword	0xc1801236b666983e
	.xword	0xde61730a7194819e
	.xword	0xaec6de41741e8657
	.xword	0xa28fdc39c20c3527
	.xword	0x517724449fcb1674
	.xword	0x03dd769a48bdb219
	.xword	0x907a4ef8b34b51f0
	.xword	0x2944d66e47138763
	.xword	0x6428a124baec8467
	.xword	0xf96963e67f80a743
	.xword	0xad0d3a0d57d57b32
	.xword	0x33879b0f85d24280
	.xword	0x4387e662e6303515
	.xword	0x5cd7787266f86202
	.xword	0x1f96de8f53996d44
	.xword	0x2f07b3ead55a3755
	.xword	0xd60301580138520a
	.xword	0xd0d512829df15802
	.xword	0x607b450f08d42a37
	.xword	0x9aa3c44b0f71652f
	.xword	0x8588759fa4c92fc0
	.xword	0x36dae3a8aa9d5399
	.xword	0x52a862a9e0aff5a2
	.xword	0x0290b21e26b66659
	.xword	0x95d14e1db2e98c95
	.xword	0x271a9b5d4b26981f
	.xword	0xa2b753a23baeab33
	.xword	0x4d95efc8a939a981
	.xword	0xf8d95a76fe527ebf
	.xword	0x06665570bdf0742a
	.xword	0x753d23f39577459f
	.xword	0x47f31cd08a8002e5
	.xword	0x5bf29885f53f7ae3
	.xword	0x4a1a963faf45af3f
	.xword	0x41db34e615f01cf1
	.xword	0x0cbe62eea0e14f48
	.xword	0x5fce19e3bab08789
	.xword	0x1f359d90e09c9b3c
	.xword	0xe5a1f3eddabf7682
	.xword	0x956ad9f5d1db310e
	.xword	0xf0ec0f4d8e6eabf8
	.xword	0x7a4bccfce6dd7bea
	.xword	0x4eecef5dde7125e8
	.xword	0x9d65a405ee0fe047
	.xword	0xe7f874bf9e21bffb
	.xword	0x7a8f61a7cc09d6d5
	.xword	0x6c2534a8c051e2ba
	.xword	0xbf10b480bc48ca23
	.xword	0xdc610c302670ff7f
	.xword	0x24a91d5ef0aea815
	.xword	0x59803baa0be42bcc
	.xword	0x7038a34521e4c3b7
	.xword	0xffee97f5ce419f67
	.xword	0x3bfc4d2bfad5dc5c
	.xword	0x50889ac14fdf99f6
	.xword	0x3be01711d15279b1
	.xword	0x310d7751832d00d9
	.xword	0x1b1640a9d235df9d
	.xword	0xa84ea137775d2844
	.xword	0x093f8e6d954a3769
	.xword	0x0ed322a31b62bf98
	.xword	0x4dc007f59a21d9c4
	.xword	0x6c2facb1ba6f8bc8
	.xword	0x2fb3926fd80d70ae
	.xword	0xa3eb90229d8873d5
	.xword	0x0edc6b9796de347c
	.xword	0x67cbe612845ac703
	.xword	0x7ed7f48ab585d9b5
	.xword	0xe79774c82b9ed857
	.xword	0x6d8a73986247c924
	.xword	0x29fb854d29c05b67
	.xword	0xb6a8e120eade29ca
	.xword	0xef03de5b069083cf
	.xword	0x0a23c372139222f1
	.xword	0x767dcb880da277fa
	.xword	0xae5acb58bfb449b4
	.xword	0xfc408d85521b2d46
	.xword	0x3b39d53bed65c111
	.xword	0x882240ab15fc5a93
	.xword	0x68600a80fb724814
	.xword	0x2a17431761e9f714
	.xword	0x65a72ce7f8f69655
	.xword	0xd4c7a9948917aed8
	.xword	0x2051dbd33fb20f98
	.xword	0xa7f45276d7d50cc7
	.xword	0x96c118f1285d190f
	.xword	0xa728b1f24268cfe5
	.xword	0x4d67db0872401d4a
	.xword	0x7e2a5bff1180f94b
	.xword	0x37cd89e3a6a8bd60
	.xword	0xb3c6fab9dc6002b2
	.xword	0xaee78aa84f160fc9
	.xword	0xa1c136c7a9753027
	.xword	0xe9106327dfadd316
	.xword	0xdc0fd1e04885b37c
	.xword	0x8d54eedd381115bf
	.xword	0xd4cf55614b6678e0
	.xword	0x7ed116996ef106b9
	.xword	0x56747f26e5efa2d9
	.xword	0x4b47741b8e9631ba
	.xword	0xcb60847ce6dee4eb
	.xword	0x5e5fe7594bd7dcce
	.xword	0x1cf26622c9c6136a
	.xword	0x017c3bd4ba0ca527
	.xword	0x83156b6d9fb8ecc0
	.xword	0xb79f76c56d67a5b6
	.xword	0xd2c6e7714bd5ae2b
	.xword	0xdedb3bf7f4180770
	.xword	0x5dc61fae9693eab8
	.xword	0xbf724299a68314cb
	.xword	0xfd45633513786783
	.xword	0x58eda6ec8b16da96
	.xword	0x728244989ccb4358
	.xword	0xf1870439135058b7
	.xword	0x41c0b3bd33870f62
	.xword	0x1f351a49178c5dd0
	.xword	0xf3d5578c2ec14475
	.xword	0x5c3460c9ebbe8360
	.xword	0xd86e5a47cef60685
	.xword	0x23b9223402758e9c
	.xword	0xe9f6494d7c685113
	.xword	0xb69ee4d7f9716ea4
	.xword	0xd7d6df5b65ec06c7
	.xword	0x6ff9ec0f8c0384fd
	.xword	0xbe411ec01d5572fc
	.xword	0x9c86a9614e3aeff4
	.xword	0xd23ddb8302ec0b3a
	.xword	0x430a73499a69943d
	.xword	0xe44b1756a13c4c44
	.xword	0xa72c95393286ded5
	.xword	0xbb903971e9839915
	.xword	0x5c4dff1eb9c8e366
	.xword	0x610b20b8180e9e12
	.xword	0xcafc5692568f9b82
	.xword	0x84b7c9711aa6866a
	.xword	0xb1973ccc6ad9d0be
	.xword	0xfdf277c430d1da50
	.xword	0x5f17e27022a6c68d
	.xword	0x2c14df4de745df8d
	.xword	0xf607d06d069827c3
	.xword	0xe79e69eb4bb1a011
	.xword	0xdeb22977f1af26b9
	.xword	0xfc27b35111258f3a
	.xword	0x52feac806fbf103f
	.xword	0x7f9bcbd97a970fc4
	.xword	0xb15ef51eafe31313
	.xword	0xccb54835dc438936
	.xword	0xcb46ad54b68faa31
	.xword	0x7296f9239af9b981
	.xword	0xb8947bb48a540eda
	.xword	0x035d2e066d5db2ed
	.xword	0xcd7818436ffb1b65
	.xword	0x30fbcec577f7b6a3
	.xword	0xa0bfda0131c2c49f
	.xword	0x03e1f6c92d0520f0
	.xword	0x65c219f9cfad8a21
	.xword	0x85d7bea4016974c3
	.xword	0x8cfc0d3c8f11550c
	.xword	0xd47a8a506f22689a
	.xword	0x9da9cfdbd88a8204
	.xword	0x67f9c3ae14d32be9
	.xword	0xb4922e9f0ad56b89
	.xword	0xf6d86308f9a100a5
	.xword	0x8f1bd4f64744d294
	.xword	0x90d0f375b6a96c41
	.xword	0x5484fe24f89a8df8
	.xword	0xe95756ad072f6989
	.xword	0x2e4d6423fe5348ec
	.xword	0x46bc25dd961027bc
	.xword	0x82ab017870afe027
	.xword	0x6c3f187ae669c284
	.xword	0x187507081bda2c0e
	.xword	0x5e6974d635cdbf85
	.xword	0x15275cf6d5500c84
	.xword	0xeacda1d64cf5c2fe
	.xword	0xd03c53f517db96e4
	.xword	0x7f4439eb44413726
	.xword	0xbda4e8664df4ed85
	.xword	0x14a1afae378e17f8
	.xword	0xb9bac139081e60a4
	.xword	0xa4bbeb070b498f67
	.xword	0x5838f11155e3b2d1
	.xword	0x2c09de833e3cea1c
	.xword	0x8153cb91c24a4058
	.xword	0x66f832e354190757
	.xword	0x0e022470c5f4ed6d
	.xword	0x309706c01b528306
	.xword	0xee12657c477fb542
	.xword	0x7b81e807368415db
	.xword	0x7a01d8340cd02b01
	.xword	0x412da563b49e6b87
	.xword	0xe2b9db4c5bb5f3eb
	.xword	0x96c817fbf274a474
	.xword	0xc29b7915f7f29233
	.xword	0x04f5604240daa718
	.xword	0xd649a98c124540ff
	.xword	0xdd8252836ed0cf77
	.xword	0xc747038dba3d922e
	.xword	0x8aca7dc4812dd7e9
	.xword	0xf1e10b531dc4e021
	.xword	0x888dcad6a41b4447
	.xword	0x46547761e75f273c
	.xword	0x6853b36d61beb24c
	.xword	0x0d1b3fcb4af9f7c7
	.xword	0x9ed8f3a8c9c22e3d
	.xword	0x0c553fd3240eabc8
	.xword	0x80ce168eca6cbeb8
	.xword	0xc3e114f03ce87887
	.xword	0x72270e2b1b5c9d99
	.xword	0xd85971c40d4fd800
	.xword	0xd0bebdcd3389e437
	.xword	0xfe93e9ec308f1451
	.xword	0x91cbe25ed35ac00d
	.xword	0x4d4ff1ecd15285f8
	.xword	0x69d92219ff24c7d1
	.xword	0x92a8ed72e4b61b18
	.xword	0xdf5f6084bfcb5e75
	.xword	0x02d468b6f31547b4
	.xword	0xd0b232383c69f6b9
	.xword	0x73bdb7529bfd7823
	.xword	0x222ab9ae5719b230
	.xword	0x1dfb66a68f074a82
	.xword	0x3a4ef69fb74926f7
	.xword	0xd8634df5ba319e61
	.xword	0xfd112322f4851bcb
	.xword	0x20007778fd322563
	.xword	0x5b44805c34015ae4
	.xword	0x3c0ee8d4af56484b
	.xword	0xe7aace4af4ab8179
	.xword	0xe845f2a652735a33
	.xword	0xea3d74480596efd4
	.xword	0xd51a04451e3937c7
	.xword	0x87d44dbda50bef36
	.xword	0x4534f7dfc4cbbcc1
	.xword	0x961c9d65414302ef
	.xword	0xc06ee854161b9271
	.xword	0x9d426d5ce3930ec8
	.xword	0x1078933aaf54e54c
	.xword	0xc99643c91c510528
	.xword	0x752b67d1e655f3cc
	.xword	0x2a2dea5c6d77b251
	.xword	0xa5a00abc875a896a
	.xword	0x019f4984297cad07
	.xword	0xd4ff2dd56f86a393
	.xword	0xb42ce0b4dc71b3f3
	.xword	0xc60cca73309d599d
	.align 0x40000
	.data
data_start_6:

	.xword	0x889dab8f18d78c49
	.xword	0x62024dcb7577e9c2
	.xword	0x4d06a858b7ae4e11
	.xword	0x56bcc545aca2daaf
	.xword	0x836605fe03b5368d
	.xword	0x3485bbd8a27165fe
	.xword	0x9029735ab1fa3f77
	.xword	0xf2343409d34b24ba
	.xword	0x04ac26ba6be29813
	.xword	0x5110b129bf26aa24
	.xword	0xed9930fe37f12d5f
	.xword	0xf3c6fad4de4f9f26
	.xword	0x5fed1a9172ae9795
	.xword	0xee209cd8e93bfd0a
	.xword	0xc32c1d55f306fbc4
	.xword	0x483d3f1b31a2ecab
	.xword	0xd573430f3f874828
	.xword	0x9c6fb3bf8af081e2
	.xword	0xc5a69a8222e36fc4
	.xword	0x3ddf651cc8529eac
	.xword	0xf84161d4d09a97a9
	.xword	0x8ebf5af40cefe531
	.xword	0x9ba4e545c28b6ca5
	.xword	0xa442cafdd97721ac
	.xword	0x5305f36de7640617
	.xword	0xe892f13d2adf1db7
	.xword	0x65142cb22dccc826
	.xword	0x6c5c4fe53786c2ff
	.xword	0x6544982f15c5a632
	.xword	0xaeb6fabaf049042d
	.xword	0x9d48a3fb5be8d3c9
	.xword	0x886ac201bf4411bc
	.xword	0xe369ad1b489fa904
	.xword	0xd2fc6e2b1688396d
	.xword	0x0625001f28aab3a4
	.xword	0x989d3c357ffd4e49
	.xword	0x194dcf76f967277b
	.xword	0x8e9499f098c0a1ca
	.xword	0x9c1116a652526d35
	.xword	0xd17edbee47c2df10
	.xword	0xecf5e33b375224f6
	.xword	0xe61918452870500d
	.xword	0x97a8e248f36ce7c2
	.xword	0x1adc197a053f6f63
	.xword	0x8b98ba8d6094bae9
	.xword	0xc392c8934f6fea8b
	.xword	0x2628a452d03928b4
	.xword	0x55de5dc982cc9fcb
	.xword	0xb6444250670b93f1
	.xword	0x68556e8284519235
	.xword	0xfe42908a6b1fe5d8
	.xword	0xd8c0dc0a6116f9a3
	.xword	0xcc576e06b7cf08ab
	.xword	0x52651f344a6e71ba
	.xword	0x365d9db941292670
	.xword	0x2edcbdb765cc50a1
	.xword	0x74e7f1ca77d08369
	.xword	0xb0fc6fc8a49b3efc
	.xword	0xe6f1b2c1a45f83ff
	.xword	0x1ae7471235ea416c
	.xword	0x33bb523a74c3ae9c
	.xword	0x1aaf6da0bcacfe4b
	.xword	0x9f95ef38863f6ee7
	.xword	0x2c37b8c9a2308edf
	.xword	0x7d75eea666f2a16f
	.xword	0x97f3cb59ccab690e
	.xword	0x230033dc25ca11fd
	.xword	0xf6ce2bd51d75829b
	.xword	0x197f0d6d28f47d59
	.xword	0xf0d838fe25633a91
	.xword	0x0e28caf9a35fcc6d
	.xword	0xf43b88b74cfc231b
	.xword	0x3267f86d7a3c5886
	.xword	0x3f0819596aa8a97b
	.xword	0xf24e275e836764e1
	.xword	0x3e5806ca46a2e43b
	.xword	0x5d3ec43355a2a4d6
	.xword	0x2cd49203b2cfe790
	.xword	0x1476791612844bf4
	.xword	0x5a98d3e41bd7579c
	.xword	0xef86a5562cff8087
	.xword	0x0e634d2d350c3bb0
	.xword	0x4314f97c3cc95538
	.xword	0xbc8ea471129f3de7
	.xword	0x1e9147c602e4fdb2
	.xword	0x21582ca767b959a6
	.xword	0xb19a6f1ed2000a85
	.xword	0x424dfce585301008
	.xword	0x0ba8efb09fe2dba8
	.xword	0xe645fc45fb0a81d4
	.xword	0xdf4b193f572fa064
	.xword	0xa35f0582f4a4d15c
	.xword	0x528cd5c40bf1f755
	.xword	0xa02b6a895fdd0c85
	.xword	0x8ed64165953df8e7
	.xword	0xc454ba9272a7e9ed
	.xword	0xa76420399cc05565
	.xword	0xc3a378c00c31e0af
	.xword	0x34df6c81b04399aa
	.xword	0xd4d466a9b90496e9
	.xword	0x04a5f0ef0e89cedb
	.xword	0x5919b6a6c6f40729
	.xword	0x8a9da16c3a15cf5c
	.xword	0x0bc47df8aa5b6b57
	.xword	0x7f980891e8f67603
	.xword	0xcfca9f346a9cc06b
	.xword	0x004fdd60ec04659c
	.xword	0xc21f5572ecf30061
	.xword	0x4c746d8b44bc6c31
	.xword	0xe95d5bc547cb64ba
	.xword	0xf4cef836f70042dd
	.xword	0x55af8a6011027e80
	.xword	0x62d1ae8b5932f7fd
	.xword	0xd3646aa4e6af46e5
	.xword	0x52e2ad27259077da
	.xword	0xb7fa5915dd720468
	.xword	0xae8f13162cb270ab
	.xword	0x2845c11e3a2c5a43
	.xword	0x3322da9811fedbb5
	.xword	0x439b6f6c3a9ded9d
	.xword	0x5b82f125562238b2
	.xword	0xf28160cf4b9810c0
	.xword	0xc5eab8789f8333f3
	.xword	0xc7ca9082268f4a5e
	.xword	0x419270beff0613a0
	.xword	0x802438f8c39ce560
	.xword	0x9f5b1943de9991b0
	.xword	0x4289aba88a035060
	.xword	0x5749e40a44524e7f
	.xword	0x176a682c1045145d
	.xword	0x8a015e493150dd9b
	.xword	0x4b8b01be26bcd069
	.xword	0x98aea42ff8f0dee5
	.xword	0x0aaf14eb7e8ad762
	.xword	0x7999988a195f08ce
	.xword	0x324998590a00e76a
	.xword	0xd23452176e30d736
	.xword	0xe66cceab68cb50d7
	.xword	0x5f0ff3cb536216b2
	.xword	0xdaa6082e89fff6c5
	.xword	0x3eac91243dbc4c06
	.xword	0x0769a9b529519841
	.xword	0xf3c360768cad98e8
	.xword	0x602410fc9e668e39
	.xword	0x690c6f0ddc4ca7d6
	.xword	0x52df4c0b06efe696
	.xword	0x3e224f6e77821c30
	.xword	0xe53435841d18397e
	.xword	0x10f6a837b7d10a63
	.xword	0x0827a9c39931165b
	.xword	0xfb4e72bb1625f50e
	.xword	0xbcb3c2512e57de28
	.xword	0xdbf67623abddeb54
	.xword	0xb35f91dcecbb070d
	.xword	0x62cab3372f0a137d
	.xword	0x3c55f59d84fadfea
	.xword	0x6d7c38ecef1ec0e4
	.xword	0x9f30d9e0351da1a0
	.xword	0xfddced9f576907a0
	.xword	0x46c487eb678820de
	.xword	0x7cf17dc6a7a52ebd
	.xword	0xb04b7e69acb826db
	.xword	0x062d6b8d90f5c0c3
	.xword	0xc2720deaaca047bd
	.xword	0x7d56cc405e4a312b
	.xword	0x0ff9e0fe9d8ec022
	.xword	0x932475768dc9c179
	.xword	0x23cbfc0f41e50038
	.xword	0xbd2bf3dc80084640
	.xword	0x08f88f6a4e1f83bc
	.xword	0x6f319f7dd3638a99
	.xword	0x5434f84784018746
	.xword	0xd5520f11ee510a75
	.xword	0xf9d9447df2db3856
	.xword	0xb696e277f916ef06
	.xword	0x469a733b3e503f80
	.xword	0xe8eef390450ff5f4
	.xword	0x698ae51606b7a063
	.xword	0x9224ba134f4b0422
	.xword	0x403714773778414d
	.xword	0x28ff9d69d0aa19fa
	.xword	0x5c62faf8493231bb
	.xword	0xd304e929ee477d15
	.xword	0x072a0dd81cc41bc0
	.xword	0xba9aa0bd3cff733b
	.xword	0x8dafbe575cca700f
	.xword	0xd817d8d968ab8b9a
	.xword	0x064b9845541424c9
	.xword	0x5965143e5414efb7
	.xword	0x948cf478321945d4
	.xword	0x1c5587634f52c68c
	.xword	0x713496d77d6e378a
	.xword	0xfc128fc7f38f7743
	.xword	0x1508eeb712519885
	.xword	0x28251fe0cc8aaa34
	.xword	0x4a31d3f8f09840dc
	.xword	0x31d39d8340b9a60a
	.xword	0x6c1d620fba1a8d80
	.xword	0x54e11e321ee2dcce
	.xword	0xa32329de670f3fb1
	.xword	0xe1f21d9ed07e98c6
	.xword	0xee68f2897e1b3f8a
	.xword	0x0f7febee94e8036e
	.xword	0x8cacbd4e6bff1992
	.xword	0x2e5f8f38d91b22bb
	.xword	0x363b57c34f0bc345
	.xword	0x794d6c1dcf308343
	.xword	0x7a1ab958a897d930
	.xword	0xdf304b4346a4f6f3
	.xword	0x341a826cf8fb9d97
	.xword	0xa714833bc10e6bfc
	.xword	0xa52565fbeaa62cbe
	.xword	0x2c7c0378375d2bdf
	.xword	0xc33a997162916648
	.xword	0x9eb7149b03b9b160
	.xword	0x0a1ffded5472ebf5
	.xword	0x514646e1daa176ed
	.xword	0x7dea2fc8ef0647b9
	.xword	0x7abf0f3ce0a781ad
	.xword	0x23ebba7d05bbc94e
	.xword	0xb387053f7617d715
	.xword	0xa7cc4167517e4e74
	.xword	0x2db108f34149fc14
	.xword	0x321af54692588f7e
	.xword	0x4f42fb4bf587d8ed
	.xword	0x4121039522a08c99
	.xword	0xf705dbbae2903f35
	.xword	0x2dcd7316f5360eeb
	.xword	0xab9ccb63e0f1eb65
	.xword	0x4775ac596ed39d92
	.xword	0x85dc2b9aeaf1b2e9
	.xword	0x4005dbeadc4e2ad0
	.xword	0x39378394d44cc1ec
	.xword	0x413c284933274a5a
	.xword	0xdf365a03c2ad2d30
	.xword	0xc4fada44f0da02e8
	.xword	0x7987291625cb5ac4
	.xword	0x6f5c3e833ca9583d
	.xword	0x4c3621175f9b1175
	.xword	0x90027ae0bb38a4ab
	.xword	0xf67a335a80076771
	.xword	0xb424f5839c74bd62
	.xword	0x08bd833cc9ba3100
	.xword	0xf59ef81a6678d9ca
	.xword	0x4809fd3b5be41cef
	.xword	0x4d14cf6883992667
	.xword	0x6557a5edc2fa3c03
	.xword	0x1c90a43ec03a1375
	.xword	0x68141d6fa1fbb00f
	.xword	0x04ae4bac3e10ced2
	.xword	0x73fea61cba679c81
	.xword	0x884b514d9adca2d1
	.xword	0x2178c1b381c9b27f
	.xword	0x4d700fee641018e7
	.xword	0x44533bc6cd182ad3
	.xword	0x30ea35a5a5e6a4b1
	.align 0x80000
	.data
data_start_7:

	.xword	0xd8c0d3df3b0c7037
	.xword	0xe3d92e9220ead827
	.xword	0xa93593a71fad0c02
	.xword	0xb6f281a636933c4c
	.xword	0x492278f0c1b8ce35
	.xword	0x6659e9e7d97199e0
	.xword	0xf69c9eb6b4ce063c
	.xword	0xf86542534c138b49
	.xword	0x406c0b1e622b48f6
	.xword	0x34aab355939e8d10
	.xword	0x60d95d8e605230ec
	.xword	0x9c08ecab077a6dfa
	.xword	0x8f8f664a69bd3996
	.xword	0x22b1556113a342fc
	.xword	0x414f2f403e3fc75b
	.xword	0x7cb66beeef42a3c4
	.xword	0x667fecc42415a386
	.xword	0x627f001b64c4de2c
	.xword	0x64af1a2fe8c68d7e
	.xword	0xf624c4dffc370369
	.xword	0x52a62d6e48201bad
	.xword	0x11315104d8ed3fe7
	.xword	0xd734cac1937f8d54
	.xword	0x48bd5233ee72b7e5
	.xword	0x042640c3e7222276
	.xword	0xa7e35f49dee83176
	.xword	0x00e0d832b7ee09dd
	.xword	0x7595cd52ccd2ea03
	.xword	0x11069a7b05479406
	.xword	0x6250f60ee3bddbef
	.xword	0xf45010441e5b8ee9
	.xword	0x616e24c125987479
	.xword	0xac627ab1921015a3
	.xword	0x508129892601becc
	.xword	0x4f651de3b0ba5671
	.xword	0x7f8915289e613fac
	.xword	0x26e82281ab54947e
	.xword	0xfa6e71e8b7760d38
	.xword	0x1afb6d416b8dacfc
	.xword	0x1a0459e30024f42b
	.xword	0x714cc36eadce1e46
	.xword	0xac2081ae7b66f7aa
	.xword	0xa1eeacdf5f60cbf0
	.xword	0xa4af6d8c4ffc8289
	.xword	0x827bbebd37f6b700
	.xword	0x8e3401df76b84ba8
	.xword	0x11f73e14659fbabf
	.xword	0x2a1a00f3587f7235
	.xword	0xba3b9a43711e8c5d
	.xword	0x6776b6b0c029dc75
	.xword	0x18c32880f17d0666
	.xword	0x7107ba1bc3ef7ee7
	.xword	0x97ef65f04950ac3e
	.xword	0xd6f873d64235d94f
	.xword	0xa13de36b2cfbd52d
	.xword	0xf1ec4d16926ae4f8
	.xword	0xfd97a36c66265cb0
	.xword	0x0f8ea37eae081e2f
	.xword	0x651c4e34cd32cbbb
	.xword	0x72ac64336db09ed5
	.xword	0x9300e3735b6a581f
	.xword	0xe041239d81141356
	.xword	0x319f4bfce6909b4d
	.xword	0x3c37f13ed361a118
	.xword	0xfe11e65adef5c87b
	.xword	0xf406aeaa496f1bdf
	.xword	0x2e2b13f7cd0885bf
	.xword	0x76dd563678b202ff
	.xword	0x5dd85ebbd0313d0a
	.xword	0xf351bdffec8d5574
	.xword	0x8281aaa42a47cd37
	.xword	0x8e6a2b35290dba61
	.xword	0x541b6615d477a0d1
	.xword	0x7aaab6afaa9b5a82
	.xword	0xf7d8dfb70e4a070f
	.xword	0x1a8b69e79381f202
	.xword	0x16586e9c86225f2a
	.xword	0xb2d4edb1074d2f29
	.xword	0xeb68ca4d6db22913
	.xword	0x0da45f3219e78ffe
	.xword	0x35ccc42ddd0dc6a3
	.xword	0x5410d592ea8369b9
	.xword	0x4176c5cae342e1d5
	.xword	0xd4677dfc9cb3f7af
	.xword	0xc5cc4660fa169f43
	.xword	0xc1da0ba5390aad7d
	.xword	0x6fdd622cee1245f7
	.xword	0xf40f42fa6c25e779
	.xword	0x279f5c594e39dace
	.xword	0x8819a6f76fee3770
	.xword	0xf88763ffa8a86857
	.xword	0x68703ac042cf07bc
	.xword	0x8db2ee9efebcc445
	.xword	0x0c2b2d74500aee1e
	.xword	0x116c98c0c73ef0b2
	.xword	0x41a565e60d77c24b
	.xword	0xa6c67c357713ba86
	.xword	0x6072f1ad12603292
	.xword	0xf9f25af6f1d417df
	.xword	0x5dd5203c882b536f
	.xword	0x4cad8dca327496fa
	.xword	0x7e748c682f5763cc
	.xword	0x076be02d3a52d16b
	.xword	0x3b354803ca1cd9db
	.xword	0x2984eda6478878c6
	.xword	0xd330ab0bf67f1ee9
	.xword	0xd9125781de3e83a1
	.xword	0xdd8fdee24940472f
	.xword	0xca3b46e62389e885
	.xword	0x208d4192827df9e5
	.xword	0x1b5a20758c8980c9
	.xword	0x8ff1e3f0154e199a
	.xword	0xc1c8ccf451c4522c
	.xword	0x08cdfc53a7b1cd6c
	.xword	0xda2b7c38a1cde40a
	.xword	0x7b5d5867adb11c47
	.xword	0x0a6955de79f11ffc
	.xword	0x3f2dd2acc4af4fd2
	.xword	0x05579eab773284eb
	.xword	0x17927d5f5b04be32
	.xword	0xe62c62bcec4792f1
	.xword	0x171bec0489df7c81
	.xword	0x630bd7c7aa27417a
	.xword	0xd67277e425fd6581
	.xword	0x04f411cd3af5d5c4
	.xword	0x5af90e7e81d46032
	.xword	0xd49975502d7725a6
	.xword	0xd7e31b66af01f244
	.xword	0x4ebdff05bb34102b
	.xword	0x350a33cdb16af3ba
	.xword	0x849f1061f30ec518
	.xword	0xf79785b8749abb1d
	.xword	0x621e55bd648d00a0
	.xword	0xbeb0d9c46d310691
	.xword	0xbb6a34fb8d2f2553
	.xword	0xce4e5409ee329381
	.xword	0x9202c6c1f25dd2fc
	.xword	0xe3e585fab07f8792
	.xword	0xb97a5809b6441264
	.xword	0xa671505e6569f106
	.xword	0xb6d0ad3444edf9aa
	.xword	0x39dc874454249790
	.xword	0x30e4a37dc1ea1518
	.xword	0xd9c095d8db14cbf7
	.xword	0x961870e35af15575
	.xword	0xf63b0ab14e9d9994
	.xword	0x794d3d3c7234e5a0
	.xword	0x782661ca6cc71915
	.xword	0x1792db088905d3f5
	.xword	0x6c1e4547f8fbc161
	.xword	0xb6672ec566561122
	.xword	0xe019ec7baf0f0a77
	.xword	0xb7da9e595e3e75ae
	.xword	0xb43e43c738a31c8a
	.xword	0x0d0102980256865b
	.xword	0x734a5db08ae281a4
	.xword	0x9b62b1c6ca098de2
	.xword	0xbfa4f6bae34053ff
	.xword	0x6225cab84d17ffa3
	.xword	0xafbc50e304847c84
	.xword	0x6ce1a2be5327e05d
	.xword	0x0b57eaf80605ac1a
	.xword	0xcf150a95096b07f3
	.xword	0xafaa4c893a462ec9
	.xword	0x03d5686c4605c5b6
	.xword	0xf3988437ab6f1a5e
	.xword	0xb71cf452c48e2892
	.xword	0x24875aff92a63dc1
	.xword	0x1cda3555ececa443
	.xword	0x3dd4d06b924d4387
	.xword	0x49fa51bb4f35bd9a
	.xword	0xe838629efb67ae2a
	.xword	0x5e7bb9ad45bfcd9c
	.xword	0x33aa690c61ab1505
	.xword	0x24b8695b827b236e
	.xword	0x95a26c837c24570c
	.xword	0x2d813e54aec427db
	.xword	0xbce5d10799d0f9f4
	.xword	0x2e3918f74ab80176
	.xword	0xf29f93a0142f13b7
	.xword	0x87dfb9e8438672e2
	.xword	0xdd422cc6307dcee9
	.xword	0x6ff81f31897470cd
	.xword	0x348e49a0ed753796
	.xword	0x047aa7a86afd3825
	.xword	0x975c630e1e0ac3d7
	.xword	0x0137d93f91054ffc
	.xword	0xc073ac0d18aec81c
	.xword	0x1100672fba9fd561
	.xword	0xf244445edef7c7c9
	.xword	0xf7a2bfe83c14ba06
	.xword	0x2be819e6e5fcecb9
	.xword	0x5a909df3b20af4a8
	.xword	0xba49fe5a908ba6e3
	.xword	0x7a6dd9b158d425d3
	.xword	0x1d5a8475d31465a8
	.xword	0xae0b8b207a8e9fec
	.xword	0xbb4639a93ad7511e
	.xword	0x765493976d4c1992
	.xword	0x6729022172222eee
	.xword	0x80d28dc26192f927
	.xword	0xc43d605ee031250c
	.xword	0xb07c19a91a9aa012
	.xword	0x1728890fa01ed894
	.xword	0xfd47a6326931dafa
	.xword	0x2c65b26fccfb22bb
	.xword	0xb9fa27a45cbae4c8
	.xword	0x3a1e0d1e24ef7e51
	.xword	0x971847f6e70d965e
	.xword	0x9ff2d35ab4daa527
	.xword	0xffc451b44e74252c
	.xword	0x155c0ea10a440147
	.xword	0x4d0dc4f175b32b0e
	.xword	0x8cd287cf2118c19b
	.xword	0xdad097987acaa1fe
	.xword	0x8e8f4838ad3a63d3
	.xword	0x4f53a02ed472e627
	.xword	0xfcc328c3384e7bf1
	.xword	0x3f8147b629c6e4b0
	.xword	0x3121e1a57df7fca6
	.xword	0xe0e50a9cb6513d84
	.xword	0xa325ed52770837b6
	.xword	0x801a0b373ffcdcbc
	.xword	0x5bb8d68d59c1b507
	.xword	0xd3e1ee949a67ae94
	.xword	0x791cba266eca6a30
	.xword	0xa28fd2d698253b5a
	.xword	0x19a47d15374bcff2
	.xword	0x2cb848434fe44ca6
	.xword	0x3251a543109fda4b
	.xword	0x123f82153eaf3488
	.xword	0x32685deb34be4c94
	.xword	0x8c68457aec02ed7d
	.xword	0xc49772cd3769261a
	.xword	0x851027727f852516
	.xword	0xe17f0b289435e332
	.xword	0xb53caa46d9a1e01e
	.xword	0x8a3ebe677874578f
	.xword	0xf5bae349a1861fba
	.xword	0x5324cc71de621e50
	.xword	0x9c8f3730e2b235ed
	.xword	0x81d8b0a78ae23517
	.xword	0xc9f2f28a7a4ea392
	.xword	0x1a03a805787e076f
	.xword	0xd6aa41230f5ce463
	.xword	0x16931ba746bf5f6b
	.xword	0x9eab590148c70984
	.xword	0xffca8dc0e5261c7e
	.xword	0x1855d1bca16f07e0
	.xword	0xf4d1f693b68da294
	.xword	0xbbf938919f47fc58
	.xword	0x323f34aaef43272a
	.xword	0x8f9603e471e6b099
	.xword	0xdef0a8bed50613dd
	.xword	0xd732a188778cb049
	.xword	0x65bb9e626a4ec008



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
