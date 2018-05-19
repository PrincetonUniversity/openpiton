// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hwint_updtate_1_rand_5_s1.s
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
   random seed:	704761105
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

	setx 0x5f189ab151855d3a, %g1, %g0
	setx 0x81fedbf3b5740a82, %g1, %g1
	setx 0xe2e61697834e3724, %g1, %g2
	setx 0x9b882f8e2777e78c, %g1, %g3
	setx 0xc2a04e64e9f740b1, %g1, %g4
	setx 0x9cb6e7ad978b9c46, %g1, %g5
	setx 0xd5c5a485f05fa6c0, %g1, %g6
	setx 0xd407cee0a9af0155, %g1, %g7
	setx 0x1c12a3e55a4143ed, %g1, %r16
	setx 0xbaa7b31c6aa693a1, %g1, %r17
	setx 0xafe4bc0b50606e39, %g1, %r18
	setx 0x0c75bafd47fcd5ee, %g1, %r19
	setx 0x05229b7bee0687a0, %g1, %r20
	setx 0xb6b57ff7e020e6d0, %g1, %r21
	setx 0x3a5c851b076793d8, %g1, %r22
	setx 0xbce9ff28087192b5, %g1, %r23
	setx 0x99516907f0f5c5e8, %g1, %r24
	setx 0x486be8b909257829, %g1, %r25
	setx 0x4cb18ddb5c31ebfb, %g1, %r26
	setx 0x839bf915f32b0f22, %g1, %r27
	setx 0x747718463b9de48d, %g1, %r28
	setx 0x0eb845ff3d9f6413, %g1, %r29
	setx 0xc5149ce064e9f55e, %g1, %r30
	setx 0xda93eec952d6a86b, %g1, %r31
	save
	setx 0xccea705c51eb5893, %g1, %r16
	setx 0x4502b7491e429a27, %g1, %r17
	setx 0x2577bb27342f09ee, %g1, %r18
	setx 0xecdab5cec7aa14b0, %g1, %r19
	setx 0x8d521d465c56e6cb, %g1, %r20
	setx 0x6a4e2154e134a96c, %g1, %r21
	setx 0x1f0bd3d899870f33, %g1, %r22
	setx 0x18481a9eabc58af7, %g1, %r23
	setx 0xd007a83ff2bd3439, %g1, %r24
	setx 0x2d9409a86b9b21c7, %g1, %r25
	setx 0xf28e193d3e0eae42, %g1, %r26
	setx 0x4937ef76030e9651, %g1, %r27
	setx 0xf10d467f477db5fd, %g1, %r28
	setx 0xc892421693467004, %g1, %r29
	setx 0x9c07897b3ddef6ab, %g1, %r30
	setx 0xeb23e40842863880, %g1, %r31
	save
	setx 0x8b103a58fa180b00, %g1, %r16
	setx 0x0bf0557553c659a7, %g1, %r17
	setx 0xf471b19c6787a134, %g1, %r18
	setx 0x7cc3e97d2c915ed7, %g1, %r19
	setx 0xde9a24f3b2a6e6e6, %g1, %r20
	setx 0x355a293f3ee5db0b, %g1, %r21
	setx 0xabf367f452ef862b, %g1, %r22
	setx 0x4a2efbb1977f850d, %g1, %r23
	setx 0xc0f810471d4a8670, %g1, %r24
	setx 0x738c5c8e7141671b, %g1, %r25
	setx 0xbdfddb1907d5f6fc, %g1, %r26
	setx 0xc89a5ef04ce2d750, %g1, %r27
	setx 0xe0a92fcc6877d90a, %g1, %r28
	setx 0x88a379a332e0610e, %g1, %r29
	setx 0xccc2cd4dad611f72, %g1, %r30
	setx 0xad714210ef162291, %g1, %r31
	save
	setx 0xae8d78d894bdfc93, %g1, %r16
	setx 0xc6bef74f11e42893, %g1, %r17
	setx 0x07c2e3a6c8c32ce6, %g1, %r18
	setx 0x0844896b8938da3a, %g1, %r19
	setx 0x41c417ff22e9127d, %g1, %r20
	setx 0xb21a3390e1ebd2c5, %g1, %r21
	setx 0xa66918d6354fca60, %g1, %r22
	setx 0x4a7e2f829e7fb1e0, %g1, %r23
	setx 0xf097a319a40bae38, %g1, %r24
	setx 0x22e5d7cab208e1af, %g1, %r25
	setx 0xbd9075f1d4ab3227, %g1, %r26
	setx 0x33d7a2a290712f06, %g1, %r27
	setx 0x3ab5a511b62fd85d, %g1, %r28
	setx 0xb119c1479e71032e, %g1, %r29
	setx 0x8efd3813496a0c04, %g1, %r30
	setx 0x69bab5ba443337dc, %g1, %r31
	save
	setx 0xcc4206511f380932, %g1, %r16
	setx 0xd64ec26e075c5a45, %g1, %r17
	setx 0x9e2ff2833a320b64, %g1, %r18
	setx 0x461c92b39680d1df, %g1, %r19
	setx 0xb0ff3a4f40608f95, %g1, %r20
	setx 0x94c1ca4f7997d79a, %g1, %r21
	setx 0x9d6b689c2e0ef92a, %g1, %r22
	setx 0xd1ee6509faa9be25, %g1, %r23
	setx 0xc6099b5220e51689, %g1, %r24
	setx 0x5801d5f361d24592, %g1, %r25
	setx 0xde325a26f42d65ea, %g1, %r26
	setx 0x4f18824a4f32a523, %g1, %r27
	setx 0xfc3f93a01acaefb4, %g1, %r28
	setx 0x54073c838ab1af9f, %g1, %r29
	setx 0xbbacadf5e7cdc23c, %g1, %r30
	setx 0xc5299ca4ba906cee, %g1, %r31
	save
	setx 0xca9cc87edaa8c1c1, %g1, %r16
	setx 0xd3c2b593ef4141ec, %g1, %r17
	setx 0xedb1ce2065c44ce0, %g1, %r18
	setx 0xd9a48f2e98cecccc, %g1, %r19
	setx 0x6a9de17f3d8f3221, %g1, %r20
	setx 0x64ad9387385badba, %g1, %r21
	setx 0xad847e226f0070b6, %g1, %r22
	setx 0x19bfdc1c0ac4be61, %g1, %r23
	setx 0x698906507301078d, %g1, %r24
	setx 0x62c8af7886b98c21, %g1, %r25
	setx 0x36e206f2bdfbec25, %g1, %r26
	setx 0x915b1b5ccc79345f, %g1, %r27
	setx 0xb30ee1b517240e0c, %g1, %r28
	setx 0x069afbd3e6138728, %g1, %r29
	setx 0x2cd8476645198e26, %g1, %r30
	setx 0x4dfb5e53df32e716, %g1, %r31
	save
	setx 0xfe912479e9143ad2, %g1, %r16
	setx 0xd2aeebad88117eca, %g1, %r17
	setx 0x449cb99d1167ff76, %g1, %r18
	setx 0x01c4ef7d511510f4, %g1, %r19
	setx 0x2183c0967057e0ef, %g1, %r20
	setx 0x8e07a89f0b2180e0, %g1, %r21
	setx 0x61d0e5d165a8e3a7, %g1, %r22
	setx 0xf9f5c07bcaf0e5b4, %g1, %r23
	setx 0xcc8bbd4b44a5a2ec, %g1, %r24
	setx 0xbf13f3e9cb97836b, %g1, %r25
	setx 0x6daeb9ba76acd667, %g1, %r26
	setx 0x1fecee2cf330a2b9, %g1, %r27
	setx 0x43876898a555530b, %g1, %r28
	setx 0x44d076f11847c4a3, %g1, %r29
	setx 0x16fcf077d56dde86, %g1, %r30
	setx 0x62ab83567c558888, %g1, %r31
	save
	setx 0x4ee3140f7b8c73ed, %g1, %r16
	setx 0x22f7cb44e574beb7, %g1, %r17
	setx 0x8ff6572fdf3467ab, %g1, %r18
	setx 0xd678a52dd5592b34, %g1, %r19
	setx 0xb104b96309315d42, %g1, %r20
	setx 0xa33f75ed23d56a4c, %g1, %r21
	setx 0xb26f2b0fff9215b3, %g1, %r22
	setx 0xac7c26117c0a5efb, %g1, %r23
	setx 0x4ba4fb28f7e7f0c5, %g1, %r24
	setx 0x80d360b3d0748861, %g1, %r25
	setx 0xc0edc2ae3a34d0bd, %g1, %r26
	setx 0x4eec630e377c23ad, %g1, %r27
	setx 0xc3a3b5c151ce4d0e, %g1, %r28
	setx 0x25002931437ae2e2, %g1, %r29
	setx 0x9428f28f6b6c2e0d, %g1, %r30
	setx 0x77ed44673feaee9e, %g1, %r31
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
	mov	0x26, %r14
	.word 0xf4f389e0  ! 2: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T0_asi_reg_wr_1:
	mov	0x19, %r14
	.word 0xfef38e40  ! 3: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_0_0:
	setx	0x1d0128, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_1:
	setx	0x1f022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e54000  ! 15: SAVE_R	save	%r21, %r0, %r25
	.word 0xb1e46108  ! 17: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb5e50000  ! 24: SAVE_R	save	%r20, %r0, %r26
	.word 0xbbe4615d  ! 25: SAVE_I	save	%r17, 0x0001, %r29
cpu_intr_0_2:
	setx	0x1f013d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_3:
	setx	0x1e0139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf643801  ! 31: MOVcc_I	<illegal instruction>
T0_asi_reg_wr_2:
	mov	0x17, %r14
	.word 0xfef38e60  ! 36: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T0_asi_reg_wr_3:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 37: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb1e40000  ! 38: SAVE_R	save	%r16, %r0, %r24
	.word 0xbbe50000  ! 39: SAVE_R	save	%r20, %r0, %r29
	.word 0xbcb5c000  ! 42: SUBCcc_R	orncc 	%r23, %r0, %r30
iob_intr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_0), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbb3c2001  ! 50: SRA_I	sra 	%r16, 0x0001, %r29
iob_intr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_1), 16, 16)) -> intp(0, 0, 20)
	.word 0xbbe44000  ! 53: SAVE_R	save	%r17, %r0, %r29
iob_intr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_2), 16, 16)) -> intp(0, 0, 1c)
iob_intr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_3), 16, 16)) -> intp(0, 0, 31)
	.word 0xb9e58000  ! 58: SAVE_R	save	%r22, %r0, %r28
cpu_intr_0_4:
	setx	0x1c002e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_0:
	mov	0x26, %r14
	.word 0xf6db8e40  ! 60: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb9e5e181  ! 61: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb4144000  ! 63: OR_R	or 	%r17, %r0, %r26
cpu_intr_0_5:
	setx	0x1f032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6c421da  ! 69: ADDCcc_I	addccc 	%r16, 0x01da, %r27
T0_asi_reg_wr_4:
	mov	0x3c2, %r14
	.word 0xf8f38e80  ! 72: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb33d8000  ! 76: SRA_R	sra 	%r22, %r0, %r25
cpu_intr_0_6:
	setx	0x1d0322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_7:
	setx	0x1f0239, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_1:
	mov	0x2e, %r14
	.word 0xf8db8e40  ! 81: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb1e58000  ! 82: SAVE_R	save	%r22, %r0, %r24
	.word 0xb1e5c000  ! 83: SAVE_R	save	%r23, %r0, %r24
	.word 0xbfe4617b  ! 95: SAVE_I	save	%r17, 0x0001, %r31
cpu_intr_0_8:
	setx	0x1f0109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb424e06a  ! 99: SUB_I	sub 	%r19, 0x006a, %r26
cpu_intr_0_9:
	setx	0x1c0225, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_2:
	mov	0x3c8, %r14
	.word 0xfadb8e40  ! 103: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_wr_5:
	mov	0x35, %r14
	.word 0xfaf384a0  ! 105: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T0_asi_reg_rd_3:
	mov	0x3c3, %r14
	.word 0xf0db8e40  ! 106: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbbe58000  ! 110: SAVE_R	save	%r22, %r0, %r29
	.word 0xb9e58000  ! 111: SAVE_R	save	%r22, %r0, %r28
	.word 0xb9e52107  ! 114: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbe0cc000  ! 116: AND_R	and 	%r19, %r0, %r31
	.word 0xbbe5214a  ! 122: SAVE_I	save	%r20, 0x0001, %r29
iob_intr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_4), 16, 16)) -> intp(0, 0, 0)
	.word 0xbde4c000  ! 125: SAVE_R	save	%r19, %r0, %r30
	.word 0xb7e5a164  ! 126: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbac4a014  ! 128: ADDCcc_I	addccc 	%r18, 0x0014, %r29
iob_intr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_5), 16, 16)) -> intp(0, 0, 27)
	.word 0xb3e40000  ! 132: SAVE_R	save	%r16, %r0, %r25
	.word 0xbb643801  ! 133: MOVcc_I	<illegal instruction>
cpu_intr_0_10:
	setx	0x1e0236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a11a  ! 140: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbbe5a0fe  ! 141: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_6), 16, 16)) -> intp(0, 0, 31)
cpu_intr_0_11:
	setx	0x1c0210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a034  ! 145: SAVE_I	save	%r18, 0x0001, %r27
iob_intr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_7), 16, 16)) -> intp(0, 0, 1)
	.word 0xb3e40000  ! 147: SAVE_R	save	%r16, %r0, %r25
	.word 0xb3e4a02a  ! 149: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbbe5202c  ! 150: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_wr_6:
	mov	0xe, %r14
	.word 0xf2f38400  ! 151: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_8), 16, 16)) -> intp(0, 0, 5)
	.word 0xbfe48000  ! 153: SAVE_R	save	%r18, %r0, %r31
iob_intr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_9), 16, 16)) -> intp(0, 0, b)
	.word 0xb1e58000  ! 165: SAVE_R	save	%r22, %r0, %r24
cpu_intr_0_12:
	setx	0x1e012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e561db  ! 168: SAVE_I	save	%r21, 0x0001, %r28
cpu_intr_0_13:
	setx	0x1d020d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_7:
	mov	0x3c3, %r14
	.word 0xf8f38e40  ! 171: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_10), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb5e461d3  ! 179: SAVE_I	save	%r17, 0x0001, %r26
iob_intr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_11), 16, 16)) -> intp(0, 0, 2d)
cpu_intr_0_14:
	setx	0x1c0229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e0d5  ! 187: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbde461dd  ! 189: SAVE_I	save	%r17, 0x0001, %r30
iob_intr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_12), 16, 16)) -> intp(0, 0, 9)
	.word 0xbb3ce001  ! 193: SRA_I	sra 	%r19, 0x0001, %r29
iob_intr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_13), 16, 16)) -> intp(0, 0, 15)
	.word 0xbb35c000  ! 197: SRL_R	srl 	%r23, %r0, %r29
	.word 0xb7e54000  ! 199: SAVE_R	save	%r21, %r0, %r27
cpu_intr_0_15:
	setx	0x1c003c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_14), 16, 16)) -> intp(0, 0, 1)
iob_intr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_15), 16, 16)) -> intp(0, 0, 19)
	.word 0xb5e48000  ! 204: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_16), 16, 16)) -> intp(0, 0, e)
iob_intr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_17), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb085e1ad  ! 209: ADDcc_I	addcc 	%r23, 0x01ad, %r24
	.word 0xb5e4a0ca  ! 210: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbbe42133  ! 211: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_18), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb5e58000  ! 213: SAVE_R	save	%r22, %r0, %r26
	.word 0xbbe54000  ! 216: SAVE_R	save	%r21, %r0, %r29
T0_asi_reg_rd_4:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 220: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_16:
	setx	0x1e0208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a18b  ! 222: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_rd_5:
	mov	0x2e, %r14
	.word 0xf8db84a0  ! 225: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbfe40000  ! 226: SAVE_R	save	%r16, %r0, %r31
	.word 0xbde40000  ! 228: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_19), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbde5e174  ! 232: SAVE_I	save	%r23, 0x0001, %r30
iob_intr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_20), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb3e50000  ! 240: SAVE_R	save	%r20, %r0, %r25
T0_asi_reg_rd_6:
	mov	0x1d, %r14
	.word 0xfcdb8e40  ! 241: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbde50000  ! 243: SAVE_R	save	%r20, %r0, %r30
	.word 0xb20c4000  ! 245: AND_R	and 	%r17, %r0, %r25
	.word 0xbde52123  ! 246: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_wr_8:
	mov	0x10, %r14
	.word 0xfcf38e40  ! 248: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_wr_9:
	mov	0x29, %r14
	.word 0xfaf38e60  ! 250: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_21), 16, 16)) -> intp(0, 0, 37)
T0_asi_reg_wr_10:
	mov	0x8, %r14
	.word 0xfaf38e60  ! 252: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_22), 16, 16)) -> intp(0, 0, 35)
	.word 0xb2bcc000  ! 258: XNORcc_R	xnorcc 	%r19, %r0, %r25
cpu_intr_0_17:
	setx	0x1f0324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e54000  ! 263: SAVE_R	save	%r21, %r0, %r26
	.word 0xb5e58000  ! 265: SAVE_R	save	%r22, %r0, %r26
	.word 0xbfe56139  ! 266: SAVE_I	save	%r21, 0x0001, %r31
cpu_intr_0_18:
	setx	0x1d000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5c000  ! 271: SAVE_R	save	%r23, %r0, %r24
cpu_intr_0_19:
	setx	0x1d003c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_11:
	mov	0x29, %r14
	.word 0xfaf38e40  ! 275: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb7e48000  ! 276: SAVE_R	save	%r18, %r0, %r27
iob_intr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_23), 16, 16)) -> intp(0, 0, 3e)
	.word 0xbde4c000  ! 279: SAVE_R	save	%r19, %r0, %r30
	.word 0xb1e48000  ! 290: SAVE_R	save	%r18, %r0, %r24
iob_intr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_24), 16, 16)) -> intp(0, 0, 38)
	.word 0xba444000  ! 295: ADDC_R	addc 	%r17, %r0, %r29
T0_asi_reg_wr_12:
	mov	0x5, %r14
	.word 0xfcf38e80  ! 299: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb5e5e1b1  ! 305: SAVE_I	save	%r23, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe5e03a  ! 307: SAVE_I	save	%r23, 0x0001, %r29
cpu_intr_0_20:
	setx	0x1d0121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73d6001  ! 315: SRA_I	sra 	%r21, 0x0001, %r27
	.word 0xbbe5e1fb  ! 316: SAVE_I	save	%r23, 0x0001, %r29
cpu_intr_0_21:
	setx	0x1c0234, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_7:
	mov	0xe, %r14
	.word 0xf8db8e40  ! 318: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb17d6401  ! 319: MOVR_I	movre	%r21, 0x1, %r24
	.word 0xb0940000  ! 321: ORcc_R	orcc 	%r16, %r0, %r24
iob_intr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_25), 16, 16)) -> intp(0, 0, 39)
	.word 0xb7e44000  ! 326: SAVE_R	save	%r17, %r0, %r27
	.word 0xb93cb001  ! 327: SRAX_I	srax	%r18, 0x0001, %r28
	.word 0x919520ff  ! 331: WRPR_PIL_I	wrpr	%r20, 0x00ff, %pil
T0_asi_reg_wr_13:
	mov	0x22, %r14
	.word 0xfaf38e80  ! 339: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb214c000  ! 340: OR_R	or 	%r19, %r0, %r25
cpu_intr_0_22:
	setx	0x1001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb335d000  ! 344: SRLX_R	srlx	%r23, %r0, %r25
	.word 0xbfe52169  ! 347: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb4b50000  ! 350: ORNcc_R	orncc 	%r20, %r0, %r26
cpu_intr_0_23:
	setx	0x1d032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5c000  ! 353: SAVE_R	save	%r23, %r0, %r30
	.word 0xb3e44000  ! 354: SAVE_R	save	%r17, %r0, %r25
cpu_intr_0_24:
	setx	0x1f0217, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_26), 16, 16)) -> intp(0, 0, e)
iob_intr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_27), 16, 16)) -> intp(0, 0, 2e)
iob_intr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_28), 16, 16)) -> intp(0, 0, 35)
	.word 0xbfe460ff  ! 370: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xba954000  ! 371: ORcc_R	orcc 	%r21, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_25:
	setx	0x1c000e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_14:
	mov	0x1, %r14
	.word 0xf0f38400  ! 379: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb3e5211c  ! 380: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbfe5a0a5  ! 383: SAVE_I	save	%r22, 0x0001, %r31
T0_asi_reg_wr_15:
	mov	0xf, %r14
	.word 0xf6f384a0  ! 385: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb0c48000  ! 386: ADDCcc_R	addccc 	%r18, %r0, %r24
cpu_intr_0_26:
	setx	0x1c033f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_27:
	setx	0x1e0100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e420ac  ! 394: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_wr_16:
	mov	0x9, %r14
	.word 0xfaf38e40  ! 395: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_0_28:
	setx	0x1f0110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e40000  ! 397: SAVE_R	save	%r16, %r0, %r26
iob_intr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_29), 16, 16)) -> intp(0, 0, 38)
	.word 0xb3e4c000  ! 402: SAVE_R	save	%r19, %r0, %r25
cpu_intr_0_29:
	setx	0x1d0124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde52003  ! 407: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb1e4c000  ! 415: SAVE_R	save	%r19, %r0, %r24
T0_asi_reg_rd_8:
	mov	0x3c4, %r14
	.word 0xf0db8e60  ! 421: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T0_asi_reg_wr_17:
	mov	0x1a, %r14
	.word 0xfaf38e60  ! 422: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb484a0f8  ! 424: ADDcc_I	addcc 	%r18, 0x00f8, %r26
cpu_intr_0_30:
	setx	0x1f0231, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_30), 16, 16)) -> intp(0, 0, 1b)
cpu_intr_0_31:
	setx	0x1e0324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e54000  ! 433: SAVE_R	save	%r21, %r0, %r28
iob_intr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_31), 16, 16)) -> intp(0, 0, 31)
	.word 0xbde5a180  ! 437: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb3e54000  ! 438: SAVE_R	save	%r21, %r0, %r25
	.word 0xbbe5a01a  ! 440: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb1e56199  ! 443: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb1e40000  ! 445: SAVE_R	save	%r16, %r0, %r24
T0_asi_reg_wr_18:
	mov	0x30, %r14
	.word 0xfaf38400  ! 446: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_0_32:
	setx	0x1f0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe44000  ! 451: SAVE_R	save	%r17, %r0, %r31
T0_asi_reg_wr_19:
	mov	0x3c2, %r14
	.word 0xf0f38e80  ! 456: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T0_asi_reg_rd_9:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 457: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_33:
	setx	0x1d0205, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_20:
	mov	0xf, %r14
	.word 0xf2f38e60  ! 460: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_32), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb5e4a010  ! 465: SAVE_I	save	%r18, 0x0001, %r26
iob_intr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_33), 16, 16)) -> intp(0, 0, 36)
cpu_intr_0_34:
	setx	0x1e0304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e54000  ! 468: SAVE_R	save	%r21, %r0, %r28
iob_intr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_34), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb3e4c000  ! 474: SAVE_R	save	%r19, %r0, %r25
iob_intr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_35), 16, 16)) -> intp(0, 0, 4)
cpu_intr_0_35:
	setx	0x210013, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_10:
	mov	0x3c0, %r14
	.word 0xfcdb8e60  ! 482: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_36), 16, 16)) -> intp(0, 0, 26)
	.word 0xb3e561f1  ! 494: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbfe44000  ! 497: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_37), 16, 16)) -> intp(0, 0, 1d)
iob_intr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_38), 16, 16)) -> intp(0, 0, 14)
cpu_intr_0_36:
	setx	0x20003b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_37:
	setx	0x230311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5c000  ! 507: SAVE_R	save	%r23, %r0, %r28
	.word 0xbfe5e1ac  ! 510: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbbe50000  ! 511: SAVE_R	save	%r20, %r0, %r29
	.word 0xbde4e152  ! 514: SAVE_I	save	%r19, 0x0001, %r30
iob_intr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_39), 16, 16)) -> intp(0, 0, 17)
	.word 0xbfe521b9  ! 516: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbbe461ba  ! 517: SAVE_I	save	%r17, 0x0001, %r29
iob_intr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_40), 16, 16)) -> intp(0, 0, 2f)
cpu_intr_0_38:
	setx	0x230012, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_11:
	mov	0x2, %r14
	.word 0xfcdb84a0  ! 525: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T0_asi_reg_wr_21:
	mov	0x7, %r14
	.word 0xfef389e0  ! 526: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbbe5c000  ! 527: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_39:
	setx	0x23011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28ca1ff  ! 530: ANDcc_I	andcc 	%r18, 0x01ff, %r25
	.word 0xbaac8000  ! 531: ANDNcc_R	andncc 	%r18, %r0, %r29
	.word 0xbd2c2001  ! 532: SLL_I	sll 	%r16, 0x0001, %r30
T0_asi_reg_rd_12:
	mov	0x12, %r14
	.word 0xf4db8400  ! 534: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_0_40:
	setx	0x20021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde421a3  ! 537: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb3e4a181  ! 538: SAVE_I	save	%r18, 0x0001, %r25
T0_asi_reg_wr_22:
	mov	0x3c0, %r14
	.word 0xf0f38e60  ! 541: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T0_asi_reg_wr_23:
	mov	0x1, %r14
	.word 0xf4f38e80  ! 542: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_41), 16, 16)) -> intp(0, 0, c)
	.word 0xb1641800  ! 546: MOVcc_R	<illegal instruction>
	.word 0xb5e44000  ! 548: SAVE_R	save	%r17, %r0, %r26
	.word 0xbfe4a1ac  ! 549: SAVE_I	save	%r18, 0x0001, %r31
cpu_intr_0_41:
	setx	0x230123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e521fc  ! 556: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb7e54000  ! 558: SAVE_R	save	%r21, %r0, %r27
	.word 0xbfe58000  ! 560: SAVE_R	save	%r22, %r0, %r31
	.word 0xb3e46028  ! 561: SAVE_I	save	%r17, 0x0001, %r25
cpu_intr_0_42:
	setx	0x10207, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_24:
	mov	0x19, %r14
	.word 0xf0f38e60  ! 563: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_42), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbde4219b  ! 573: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb1e52104  ! 577: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbde4e1e4  ! 585: SAVE_I	save	%r19, 0x0001, %r30
iob_intr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_43), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb9e48000  ! 587: SAVE_R	save	%r18, %r0, %r28
	.word 0xb1e5c000  ! 589: SAVE_R	save	%r23, %r0, %r24
cpu_intr_0_43:
	setx	0x20031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe420b4  ! 598: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_rd_13:
	mov	0x2f, %r14
	.word 0xf0db8e80  ! 599: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_0_44:
	setx	0x23032c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_45:
	setx	0x20033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb33c1000  ! 603: SRAX_R	srax	%r16, %r0, %r25
	.word 0xbbe56046  ! 604: SAVE_I	save	%r21, 0x0001, %r29
iob_intr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_44), 16, 16)) -> intp(0, 0, a)
cpu_intr_0_46:
	setx	0x22002b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_45), 16, 16)) -> intp(0, 0, e)
	.word 0xbde4e045  ! 617: SAVE_I	save	%r19, 0x0001, %r30
iob_intr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_46), 16, 16)) -> intp(0, 0, 19)
cpu_intr_0_47:
	setx	0x20010d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_25:
	mov	0x3c6, %r14
	.word 0xf6f389e0  ! 624: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb7e42096  ! 625: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbfe460a9  ! 626: SAVE_I	save	%r17, 0x0001, %r31
iob_intr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_47), 16, 16)) -> intp(0, 0, 1f)
	.word 0xbd35a001  ! 629: SRL_I	srl 	%r22, 0x0001, %r30
T0_asi_reg_rd_14:
	mov	0x3c3, %r14
	.word 0xf2db84a0  ! 630: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_0_48:
	setx	0x23012c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_26:
	mov	0x1b, %r14
	.word 0xf0f38e60  ! 632: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb9e521f6  ! 633: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb7e54000  ! 640: SAVE_R	save	%r21, %r0, %r27
	.word 0xb3e54000  ! 644: SAVE_R	save	%r21, %r0, %r25
	.word 0xb5e421cc  ! 645: SAVE_I	save	%r16, 0x0001, %r26
cpu_intr_0_49:
	setx	0x230135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb62c2191  ! 647: ANDN_I	andn 	%r16, 0x0191, %r27
	.word 0xb5e44000  ! 650: SAVE_R	save	%r17, %r0, %r26
	.word 0xb3e5e14f  ! 652: SAVE_I	save	%r23, 0x0001, %r25
cpu_intr_0_50:
	setx	0x22012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e40000  ! 655: SAVE_R	save	%r16, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e46059  ! 661: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbfe5619f  ! 662: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb1e5e11d  ! 669: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb5e58000  ! 670: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_wr_27:
	mov	0x3c0, %r14
	.word 0xfef38e60  ! 672: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_48), 16, 16)) -> intp(0, 0, 1)
iob_intr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_49), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_rd_15:
	mov	0x3c0, %r14
	.word 0xfcdb89e0  ! 676: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_0_51:
	setx	0x200214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 679: SAVE_R	save	%r21, %r0, %r31
T0_asi_reg_wr_28:
	mov	0x3c0, %r14
	.word 0xfaf384a0  ! 690: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb7e56062  ! 691: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb5e50000  ! 694: SAVE_R	save	%r20, %r0, %r26
	.word 0xbc8ce18f  ! 695: ANDcc_I	andcc 	%r19, 0x018f, %r30
	.word 0xbbe48000  ! 696: SAVE_R	save	%r18, %r0, %r29
	.word 0xb5e54000  ! 700: SAVE_R	save	%r21, %r0, %r26
	.word 0xbde54000  ! 701: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_52:
	setx	0x230138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e44000  ! 706: SAVE_R	save	%r17, %r0, %r28
	.word 0xbde4a09f  ! 709: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_rd_16:
	mov	0x30, %r14
	.word 0xf2db8400  ! 711: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb1e48000  ! 713: SAVE_R	save	%r18, %r0, %r24
iob_intr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_50), 16, 16)) -> intp(0, 0, 3a)
iob_intr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_51), 16, 16)) -> intp(0, 0, 3e)
iob_intr_0_52:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_52), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_wr_29:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 721: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb68de037  ! 722: ANDcc_I	andcc 	%r23, 0x0037, %r27
	.word 0xb004e133  ! 723: ADD_I	add 	%r19, 0x0133, %r24
	.word 0xb5e421e6  ! 724: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbbe50000  ! 726: SAVE_R	save	%r20, %r0, %r29
	.word 0xbbe48000  ! 727: SAVE_R	save	%r18, %r0, %r29
	.word 0xbbe5a1e0  ! 730: SAVE_I	save	%r22, 0x0001, %r29
cpu_intr_0_53:
	setx	0x220110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e0d7  ! 733: SAVE_I	save	%r23, 0x0001, %r24
cpu_intr_0_54:
	setx	0x220224, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_53:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_53), 16, 16)) -> intp(0, 0, 16)
	.word 0xbfe5203a  ! 738: SAVE_I	save	%r20, 0x0001, %r31
cpu_intr_0_55:
	setx	0x210007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb444c000  ! 741: ADDC_R	addc 	%r19, %r0, %r26
iob_intr_0_54:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_54), 16, 16)) -> intp(0, 0, 13)
iob_intr_0_55:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_55), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb3504000  ! 744: RDPR_TNPC	<illegal instruction>
	.word 0xb7e5e00c  ! 745: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb2b54000  ! 747: ORNcc_R	orncc 	%r21, %r0, %r25
cpu_intr_0_56:
	setx	0x230204, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_57:
	setx	0x200100, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_17:
	mov	0x9, %r14
	.word 0xf8db8400  ! 752: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb7e4e1af  ! 754: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb4c4e030  ! 755: ADDCcc_I	addccc 	%r19, 0x0030, %r26
cpu_intr_0_58:
	setx	0x22031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e0cb  ! 759: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_wr_30:
	mov	0x0, %r14
	.word 0xf4f384a0  ! 765: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T0_asi_reg_wr_31:
	mov	0x6, %r14
	.word 0xfaf38e80  ! 767: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_59:
	setx	0x220016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe48000  ! 776: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_wr_32:
	mov	0x3c6, %r14
	.word 0xfcf38e60  ! 777: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb9e5c000  ! 778: SAVE_R	save	%r23, %r0, %r28
cpu_intr_0_60:
	setx	0x21021d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_18:
	mov	0x3c4, %r14
	.word 0xf8db8e60  ! 782: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb23d618e  ! 784: XNOR_I	xnor 	%r21, 0x018e, %r25
	.word 0xb9e5e152  ! 785: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb0bc20e5  ! 787: XNORcc_I	xnorcc 	%r16, 0x00e5, %r24
cpu_intr_0_61:
	setx	0x21022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5217d  ! 789: SAVE_I	save	%r20, 0x0001, %r26
cpu_intr_0_62:
	setx	0x20010a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_63:
	setx	0x20020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a0ca  ! 797: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_wr_33:
	mov	0x21, %r14
	.word 0xf4f38e60  ! 798: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb1e4e14e  ! 800: SAVE_I	save	%r19, 0x0001, %r24
	.word 0x8f902001  ! 801: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xbf7ca401  ! 806: MOVR_I	movre	%r18, 0x1, %r31
	.word 0xb9e5209b  ! 808: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbbe48000  ! 809: SAVE_R	save	%r18, %r0, %r29
	.word 0xbfe520ae  ! 811: SAVE_I	save	%r20, 0x0001, %r31
cpu_intr_0_64:
	setx	0x22030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9194e058  ! 814: WRPR_PIL_I	wrpr	%r19, 0x0058, %pil
iob_intr_0_56:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_56), 16, 16)) -> intp(0, 0, 36)
cpu_intr_0_65:
	setx	0x20002d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_66:
	setx	0x220328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1643801  ! 820: MOVcc_I	<illegal instruction>
	.word 0xb5e50000  ! 822: SAVE_R	save	%r20, %r0, %r26
iob_intr_0_57:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_57), 16, 16)) -> intp(0, 0, 2f)
cpu_intr_0_67:
	setx	0x210312, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_34:
	mov	0x20, %r14
	.word 0xf4f384a0  ! 827: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_0_68:
	setx	0x230111, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbde48000  ! 835: SAVE_R	save	%r18, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_19:
	mov	0x32, %r14
	.word 0xf0db8e40  ! 840: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_58:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_58), 16, 16)) -> intp(0, 0, 3d)
iob_intr_0_59:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_59), 16, 16)) -> intp(0, 0, 19)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_60:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_60), 16, 16)) -> intp(0, 0, b)
	.word 0xb285c000  ! 845: ADDcc_R	addcc 	%r23, %r0, %r25
cpu_intr_0_69:
	setx	0x200138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb33cd000  ! 852: SRAX_R	srax	%r19, %r0, %r25
T0_asi_reg_rd_20:
	mov	0x2, %r14
	.word 0xfedb8e40  ! 853: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb1e52048  ! 854: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb9e42168  ! 855: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb60ce165  ! 856: AND_I	and 	%r19, 0x0165, %r27
iob_intr_0_61:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_61), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_wr_35:
	mov	0x3c8, %r14
	.word 0xfaf38e60  ! 859: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_0_62:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_62), 16, 16)) -> intp(0, 0, b)
	.word 0xbbe52194  ! 865: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_wr_36:
	mov	0x3c8, %r14
	.word 0xf8f38e40  ! 868: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_70:
	setx	0x210204, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_71:
	setx	0x21012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e50000  ! 873: SAVE_R	save	%r20, %r0, %r26
iob_intr_0_63:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_63), 16, 16)) -> intp(0, 0, 19)
cpu_intr_0_72:
	setx	0x21002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe40000  ! 879: SAVE_R	save	%r16, %r0, %r31
	.word 0xbde5c000  ! 880: SAVE_R	save	%r23, %r0, %r30
	.word 0xb7e44000  ! 881: SAVE_R	save	%r17, %r0, %r27
	.word 0xb12cc000  ! 882: SLL_R	sll 	%r19, %r0, %r24
T0_asi_reg_wr_37:
	mov	0xb, %r14
	.word 0xf8f38e40  ! 883: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_rd_21:
	mov	0x17, %r14
	.word 0xf2db89e0  ! 884: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_0_73:
	setx	0x21023d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_64:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_64), 16, 16)) -> intp(0, 0, 2e)
cpu_intr_0_74:
	setx	0x23011a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_38:
	mov	0x2e, %r14
	.word 0xf0f389e0  ! 900: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb77d4400  ! 901: MOVR_R	movre	%r21, %r0, %r27
iob_intr_0_65:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_65), 16, 16)) -> intp(0, 0, 1)
T0_asi_reg_wr_39:
	mov	0x3c0, %r14
	.word 0xf8f38400  ! 904: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb1e46120  ! 905: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb5e58000  ! 906: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_wr_40:
	mov	0x27, %r14
	.word 0xfef38e60  ! 907: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb6b5e1ec  ! 911: SUBCcc_I	orncc 	%r23, 0x01ec, %r27
iob_intr_0_66:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_66), 16, 16)) -> intp(0, 0, 2b)
T0_asi_reg_wr_41:
	mov	0x18, %r14
	.word 0xf8f38e60  ! 917: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_0_75:
	setx	0x230102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_76:
	setx	0x220125, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_42:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 923: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_rd_22:
	mov	0x27, %r14
	.word 0xf0db84a0  ! 925: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbbe42173  ! 927: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbe444000  ! 928: ADDC_R	addc 	%r17, %r0, %r31
T0_asi_reg_wr_43:
	mov	0x21, %r14
	.word 0xf4f38e40  ! 933: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbfe4a194  ! 936: SAVE_I	save	%r18, 0x0001, %r31
iob_intr_0_67:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_67), 16, 16)) -> intp(0, 0, 32)
	.word 0xbbe460b3  ! 940: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb9e520e9  ! 941: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb9e421e2  ! 942: SAVE_I	save	%r16, 0x0001, %r28
T0_asi_reg_rd_23:
	mov	0x27, %r14
	.word 0xf2db8e40  ! 943: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb0940000  ! 944: ORcc_R	orcc 	%r16, %r0, %r24
T0_asi_reg_rd_24:
	mov	0x1c, %r14
	.word 0xf4db8e60  ! 946: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T0_asi_reg_wr_44:
	mov	0x14, %r14
	.word 0xfcf38e60  ! 947: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_0_68:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_68), 16, 16)) -> intp(0, 0, 32)
iob_intr_0_69:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_69), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_wr_45:
	mov	0x3c4, %r14
	.word 0xf0f38e40  ! 955: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_77:
	setx	0x250223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe44000  ! 957: SAVE_R	save	%r17, %r0, %r29
iob_intr_0_70:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_70), 16, 16)) -> intp(0, 0, c)
	.word 0xb7e40000  ! 960: SAVE_R	save	%r16, %r0, %r27
T0_asi_reg_rd_25:
	mov	0xc, %r14
	.word 0xf4db8e40  ! 962: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbde5a0e2  ! 966: SAVE_I	save	%r22, 0x0001, %r30
iob_intr_0_71:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_71), 16, 16)) -> intp(0, 0, 3)
	.word 0xb9e4612d  ! 974: SAVE_I	save	%r17, 0x0001, %r28
T0_asi_reg_rd_26:
	mov	0x3c1, %r14
	.word 0xf4db8e60  ! 976: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xbfe4217d  ! 979: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbde44000  ! 982: SAVE_R	save	%r17, %r0, %r30
iob_intr_0_72:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_72), 16, 16)) -> intp(0, 0, b)
T0_asi_reg_rd_27:
	mov	0x20, %r14
	.word 0xf0db8e40  ! 995: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_rd_28:
	mov	0x33, %r14
	.word 0xf8db8e40  ! 996: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_78:
	setx	0x250232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb7c6401  ! 998: MOVR_I	movre	%r17, 0x1, %r29
iob_intr_0_73:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_73), 16, 16)) -> intp(0, 0, 2f)
iob_intr_0_74:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_74), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb7e58000  ! 1005: SAVE_R	save	%r22, %r0, %r27
iob_intr_0_75:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_75), 16, 16)) -> intp(0, 0, f)
cpu_intr_0_79:
	setx	0x26011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6140000  ! 1011: OR_R	or 	%r16, %r0, %r27
T0_asi_reg_rd_29:
	mov	0x3c2, %r14
	.word 0xfedb8400  ! 1012: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T0_asi_reg_wr_46:
	mov	0x3c3, %r14
	.word 0xf0f38e80  ! 1016: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_0_80:
	setx	0x260031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde46104  ! 1019: SAVE_I	save	%r17, 0x0001, %r30
iob_intr_0_76:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_76), 16, 16)) -> intp(0, 0, 1b)
cpu_intr_0_81:
	setx	0x240204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e521a8  ! 1030: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb7e56178  ! 1033: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbde5215d  ! 1035: SAVE_I	save	%r20, 0x0001, %r30
iob_intr_0_77:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_77), 16, 16)) -> intp(0, 0, 1d)
iob_intr_0_78:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_78), 16, 16)) -> intp(0, 0, 18)
cpu_intr_0_82:
	setx	0x270212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e44000  ! 1040: SAVE_R	save	%r17, %r0, %r25
	.word 0xb7e46025  ! 1043: SAVE_I	save	%r17, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb32df001  ! 1045: SLLX_I	sllx	%r23, 0x0001, %r25
cpu_intr_0_83:
	setx	0x240231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4c000  ! 1051: SAVE_R	save	%r19, %r0, %r26
	.word 0xb5e50000  ! 1052: SAVE_R	save	%r20, %r0, %r26
iob_intr_0_79:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_79), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb7e4a176  ! 1055: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbbe5c000  ! 1057: SAVE_R	save	%r23, %r0, %r29
iob_intr_0_80:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_80), 16, 16)) -> intp(0, 0, 5)
T0_asi_reg_rd_30:
	mov	0x27, %r14
	.word 0xf0db8e80  ! 1059: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T0_asi_reg_rd_31:
	mov	0xa, %r14
	.word 0xfedb89e0  ! 1060: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb1e5e12a  ! 1061: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_81:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_81), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_wr_47:
	mov	0x5, %r14
	.word 0xfcf38e60  ! 1063: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T0_asi_reg_wr_48:
	mov	0x1f, %r14
	.word 0xf2f38400  ! 1064: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_0_82:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_82), 16, 16)) -> intp(0, 0, b)
	.word 0xb49421ca  ! 1069: ORcc_I	orcc 	%r16, 0x01ca, %r26
	.word 0xb9e4e034  ! 1072: SAVE_I	save	%r19, 0x0001, %r28
iob_intr_0_83:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_83), 16, 16)) -> intp(0, 0, 6)
iob_intr_0_84:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_84), 16, 16)) -> intp(0, 0, 9)
	.word 0xbabc0000  ! 1079: XNORcc_R	xnorcc 	%r16, %r0, %r29
cpu_intr_0_84:
	setx	0x240308, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_49:
	mov	0x20, %r14
	.word 0xf2f389e0  ! 1085: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbc35a09c  ! 1086: ORN_I	orn 	%r22, 0x009c, %r30
iob_intr_0_85:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_85), 16, 16)) -> intp(0, 0, c)
	.word 0xb1e46070  ! 1089: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1e5a13e  ! 1095: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_wr_50:
	mov	0x3c8, %r14
	.word 0xfaf38e40  ! 1098: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbfe5e078  ! 1099: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb1e46030  ! 1100: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb89d4000  ! 1101: XORcc_R	xorcc 	%r21, %r0, %r28
	.word 0xbde44000  ! 1104: SAVE_R	save	%r17, %r0, %r30
cpu_intr_0_85:
	setx	0x25023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a10c  ! 1111: SAVE_I	save	%r22, 0x0001, %r31
cpu_intr_0_86:
	setx	0x26000d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_32:
	mov	0x3c7, %r14
	.word 0xfadb8e40  ! 1116: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_0_86:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_86), 16, 16)) -> intp(0, 0, 1)
cpu_intr_0_87:
	setx	0x250108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe52187  ! 1122: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbfe50000  ! 1123: SAVE_R	save	%r20, %r0, %r31
	.word 0xbfe52087  ! 1125: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_87:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_87), 16, 16)) -> intp(0, 0, 3d)
iob_intr_0_88:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_88), 16, 16)) -> intp(0, 0, d)
T0_asi_reg_rd_33:
	mov	0x20, %r14
	.word 0xfcdb8e60  ! 1131: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb3e54000  ! 1139: SAVE_R	save	%r21, %r0, %r25
cpu_intr_0_88:
	setx	0x250000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e54000  ! 1141: SAVE_R	save	%r21, %r0, %r26
	.word 0xb5e48000  ! 1142: SAVE_R	save	%r18, %r0, %r26
T0_asi_reg_rd_34:
	mov	0x19, %r14
	.word 0xf4db8e80  ! 1145: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_0_89:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_89), 16, 16)) -> intp(0, 0, 33)
	.word 0xb7e58000  ! 1148: SAVE_R	save	%r22, %r0, %r27
iob_intr_0_90:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_90), 16, 16)) -> intp(0, 0, d)
T0_asi_reg_wr_51:
	mov	0x31, %r14
	.word 0xf4f38e60  ! 1152: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb7e5612c  ! 1155: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb5e52129  ! 1157: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb9e5a0a3  ! 1158: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e5e096  ! 1159: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_91:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_91), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb1e58000  ! 1171: SAVE_R	save	%r22, %r0, %r24
	.word 0xbde420ae  ! 1178: SAVE_I	save	%r16, 0x0001, %r30
cpu_intr_0_89:
	setx	0x260112, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_92:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_92), 16, 16)) -> intp(0, 0, 1)
	.word 0xbfe5e183  ! 1182: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3e44000  ! 1183: SAVE_R	save	%r17, %r0, %r25
iob_intr_0_93:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_93), 16, 16)) -> intp(0, 0, 37)
cpu_intr_0_90:
	setx	0x260200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5c000  ! 1187: SAVE_R	save	%r23, %r0, %r25
	.word 0xbbe58000  ! 1188: SAVE_R	save	%r22, %r0, %r29
	.word 0xb3e4e090  ! 1191: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb7e5c000  ! 1193: SAVE_R	save	%r23, %r0, %r27
T0_asi_reg_rd_35:
	mov	0x0, %r14
	.word 0xf4db8e40  ! 1194: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb9e40000  ! 1196: SAVE_R	save	%r16, %r0, %r28
T0_asi_reg_wr_52:
	mov	0x2b, %r14
	.word 0xfef38400  ! 1197: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb7e4c000  ! 1198: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_rd_36:
	mov	0x1e, %r14
	.word 0xfedb8e40  ! 1200: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_wr_53:
	mov	0x38, %r14
	.word 0xfef384a0  ! 1201: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_0_94:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_94), 16, 16)) -> intp(0, 0, 2d)
T0_asi_reg_wr_54:
	mov	0x3c5, %r14
	.word 0xfaf384a0  ! 1206: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T0_asi_reg_rd_37:
	mov	0x2f, %r14
	.word 0xfadb84a0  ! 1207: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb1e4c000  ! 1208: SAVE_R	save	%r19, %r0, %r24
	.word 0xbcb4a1ea  ! 1209: SUBCcc_I	orncc 	%r18, 0x01ea, %r30
T0_asi_reg_wr_55:
	mov	0x18, %r14
	.word 0xf2f38e80  ! 1210: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb3e4e1aa  ! 1213: SAVE_I	save	%r19, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbbe54000  ! 1218: SAVE_R	save	%r21, %r0, %r29
	.word 0xb1e56015  ! 1219: SAVE_I	save	%r21, 0x0001, %r24
cpu_intr_0_91:
	setx	0x250304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e48000  ! 1223: SAVE_R	save	%r18, %r0, %r26
cpu_intr_0_92:
	setx	0x25023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4c44000  ! 1228: ADDCcc_R	addccc 	%r17, %r0, %r26
	.word 0xbfe4a130  ! 1230: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb1e5618d  ! 1232: SAVE_I	save	%r21, 0x0001, %r24
iob_intr_0_95:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_95), 16, 16)) -> intp(0, 0, 13)
cpu_intr_0_93:
	setx	0x240223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a0d6  ! 1238: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xba1d0000  ! 1239: XOR_R	xor 	%r20, %r0, %r29
T0_asi_reg_wr_56:
	mov	0x9, %r14
	.word 0xf0f38e60  ! 1243: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_0_94:
	setx	0x250039, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_96:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_96), 16, 16)) -> intp(0, 0, 37)
cpu_intr_0_95:
	setx	0x24003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe460ea  ! 1249: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbbe5c000  ! 1250: SAVE_R	save	%r23, %r0, %r29
	.word 0xb7e48000  ! 1252: SAVE_R	save	%r18, %r0, %r27
	.word 0xb9e4618b  ! 1254: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbfe46087  ! 1256: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_wr_57:
	mov	0x14, %r14
	.word 0xfef38e40  ! 1257: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbfe50000  ! 1261: SAVE_R	save	%r20, %r0, %r31
iob_intr_0_97:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_97), 16, 16)) -> intp(0, 0, 25)
	.word 0xbbe521ff  ! 1269: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb1e520f8  ! 1270: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb3e521b1  ! 1272: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb1e40000  ! 1275: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_96:
	setx	0x250313, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_98:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_98), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb9e40000  ! 1279: SAVE_R	save	%r16, %r0, %r28
	.word 0xb9e54000  ! 1280: SAVE_R	save	%r21, %r0, %r28
cpu_intr_0_97:
	setx	0x27002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e54000  ! 1283: SAVE_R	save	%r21, %r0, %r28
	.word 0x879420f4  ! 1285: WRPR_TT_I	wrpr	%r16, 0x00f4, %tt
T0_asi_reg_wr_58:
	mov	0x37, %r14
	.word 0xf8f38400  ! 1290: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_0_99:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_99), 16, 16)) -> intp(0, 0, 36)
iob_intr_0_100:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_100), 16, 16)) -> intp(0, 0, 35)
cpu_intr_0_98:
	setx	0x27031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb1e48000  ! 1297: SAVE_R	save	%r18, %r0, %r24
	.word 0xbfe4c000  ! 1300: SAVE_R	save	%r19, %r0, %r31
T0_asi_reg_rd_38:
	mov	0x23, %r14
	.word 0xf8db8e60  ! 1302: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_0_101:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_101), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb1e460de  ! 1310: SAVE_I	save	%r17, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_99:
	setx	0x260116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_102:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_102), 16, 16)) -> intp(0, 0, 13)
	.word 0xb3e46007  ! 1316: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbbe4e091  ! 1317: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb3e48000  ! 1319: SAVE_R	save	%r18, %r0, %r25
	.word 0xbfe40000  ! 1320: SAVE_R	save	%r16, %r0, %r31
	.word 0xb1e50000  ! 1321: SAVE_R	save	%r20, %r0, %r24
T0_asi_reg_wr_59:
	mov	0x1e, %r14
	.word 0xfef389e0  ! 1322: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb5e48000  ! 1327: SAVE_R	save	%r18, %r0, %r26
	.word 0xbfe58000  ! 1328: SAVE_R	save	%r22, %r0, %r31
iob_intr_0_103:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_103), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_100:
	setx	0x240318, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_39:
	mov	0x3c7, %r14
	.word 0xf0db84a0  ! 1333: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_0_101:
	setx	0x25010a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_102:
	setx	0x260226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a099  ! 1339: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_rd_40:
	mov	0x6, %r14
	.word 0xf0db8e80  ! 1340: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb5e54000  ! 1343: SAVE_R	save	%r21, %r0, %r26
iob_intr_0_104:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_104), 16, 16)) -> intp(0, 0, 17)
	.word 0xb3e50000  ! 1348: SAVE_R	save	%r20, %r0, %r25
T0_asi_reg_wr_60:
	mov	0x0, %r14
	.word 0xf2f38e60  ! 1350: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T0_asi_reg_rd_41:
	mov	0x3c4, %r14
	.word 0xfadb84a0  ! 1351: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb7e4a1ea  ! 1354: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbeb44000  ! 1357: SUBCcc_R	orncc 	%r17, %r0, %r31
iob_intr_0_105:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_105), 16, 16)) -> intp(0, 0, 23)
cpu_intr_0_103:
	setx	0x260206, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_106:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_106), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_rd_42:
	mov	0x3c7, %r14
	.word 0xfedb8e80  ! 1366: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_0_104:
	setx	0x260136, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_61:
	mov	0x18, %r14
	.word 0xf6f38400  ! 1372: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T0_asi_reg_rd_43:
	mov	0x30, %r14
	.word 0xf2db84a0  ! 1377: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb7e50000  ! 1378: SAVE_R	save	%r20, %r0, %r27
iob_intr_0_107:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_107), 16, 16)) -> intp(0, 0, 2)
	.word 0xbbe40000  ! 1384: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_wr_62:
	mov	0x3c2, %r14
	.word 0xf6f38e40  ! 1385: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_rd_44:
	mov	0x3c4, %r14
	.word 0xf8db8e80  ! 1386: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb7e4e1e7  ! 1391: SAVE_I	save	%r19, 0x0001, %r27
iob_intr_0_108:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_108), 16, 16)) -> intp(0, 0, 7)
	.word 0xbfe48000  ! 1396: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_rd_45:
	mov	0x31, %r14
	.word 0xf2db8e80  ! 1397: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_0_109:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_109), 16, 16)) -> intp(0, 0, e)
	.word 0xbbe4e076  ! 1400: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_rd_46:
	mov	0xa, %r14
	.word 0xfedb8e40  ! 1401: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb9e5617a  ! 1404: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbde58000  ! 1407: SAVE_R	save	%r22, %r0, %r30
iob_intr_0_110:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_110), 16, 16)) -> intp(0, 0, 12)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_105:
	setx	0x2b0129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_106:
	setx	0x290214, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_47:
	mov	0x10, %r14
	.word 0xf4db8e80  ! 1413: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbde50000  ! 1417: SAVE_R	save	%r20, %r0, %r30
	.word 0xbbe5a139  ! 1419: SAVE_I	save	%r22, 0x0001, %r29
cpu_intr_0_107:
	setx	0x2a0219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb084c000  ! 1423: ADDcc_R	addcc 	%r19, %r0, %r24
	.word 0xb7e5a026  ! 1424: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_108:
	setx	0x290226, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_111:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_111), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb1e5a176  ! 1430: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_rd_48:
	mov	0x7, %r14
	.word 0xfedb8e40  ! 1431: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb9e5a0cf  ! 1432: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3e460c4  ! 1433: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e56038  ! 1434: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbde4216e  ! 1435: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbbe4a172  ! 1441: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbbe5603c  ! 1450: SAVE_I	save	%r21, 0x0001, %r29
cpu_intr_0_109:
	setx	0x29010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a0b2  ! 1455: SAVE_I	save	%r18, 0x0001, %r31
iob_intr_0_112:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_112), 16, 16)) -> intp(0, 0, a)
iob_intr_0_113:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_113), 16, 16)) -> intp(0, 0, a)
T0_asi_reg_wr_63:
	mov	0x16, %r14
	.word 0xf2f38e40  ! 1459: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbbe48000  ! 1460: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_wr_64:
	mov	0x3c3, %r14
	.word 0xf8f38400  ! 1461: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T0_asi_reg_rd_49:
	mov	0x1f, %r14
	.word 0xf4db8e40  ! 1463: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb5e58000  ! 1464: SAVE_R	save	%r22, %r0, %r26
cpu_intr_0_110:
	setx	0x28012a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_111:
	setx	0x290308, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_112:
	setx	0x2b001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4203b  ! 1470: SAVE_I	save	%r16, 0x0001, %r31
cpu_intr_0_113:
	setx	0x290006, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_114:
	setx	0x2b0220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e42014  ! 1473: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb5e44000  ! 1474: SAVE_R	save	%r17, %r0, %r26
	.word 0xb004a173  ! 1475: ADD_I	add 	%r18, 0x0173, %r24
	.word 0xb9e4a0e7  ! 1477: SAVE_I	save	%r18, 0x0001, %r28
iob_intr_0_114:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_114), 16, 16)) -> intp(0, 0, 31)
cpu_intr_0_115:
	setx	0x290021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e44000  ! 1483: SAVE_R	save	%r17, %r0, %r25
	.word 0xb60ce032  ! 1485: AND_I	and 	%r19, 0x0032, %r27
	.word 0xbde5a099  ! 1486: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb5e4e0de  ! 1489: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbde56048  ! 1491: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb5e5c000  ! 1492: SAVE_R	save	%r23, %r0, %r26
	.word 0xb5e4a11d  ! 1502: SAVE_I	save	%r18, 0x0001, %r26
cpu_intr_0_116:
	setx	0x280119, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_115:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_115), 16, 16)) -> intp(0, 0, 2b)
	.word 0xbbe40000  ! 1507: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_wr_65:
	mov	0x8, %r14
	.word 0xf4f389e0  ! 1509: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T0_asi_reg_wr_66:
	mov	0x17, %r14
	.word 0xf4f38e40  ! 1511: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_0_116:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_116), 16, 16)) -> intp(0, 0, 33)
cpu_intr_0_117:
	setx	0x2a0021, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_118:
	setx	0x2a000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_50:
	mov	0x2f, %r14
	.word 0xfcdb8e40  ! 1524: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_119:
	setx	0x280231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe460af  ! 1533: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_rd_51:
	mov	0xd, %r14
	.word 0xfcdb8e60  ! 1535: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_0_120:
	setx	0x2b032b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_67:
	mov	0x25, %r14
	.word 0xfaf384a0  ! 1537: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb3e4e189  ! 1540: SAVE_I	save	%r19, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9e4e04d  ! 1548: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_rd_52:
	mov	0x4, %r14
	.word 0xf8db84a0  ! 1549: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_0_121:
	setx	0x280209, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_122:
	setx	0x2b0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e52152  ! 1554: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbbe5a18a  ! 1556: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_117:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_117), 16, 16)) -> intp(0, 0, 8)
	.word 0xb5643801  ! 1563: MOVcc_I	<illegal instruction>
iob_intr_0_118:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_118), 16, 16)) -> intp(0, 0, 2d)
T0_asi_reg_wr_68:
	mov	0x18, %r14
	.word 0xf0f38e40  ! 1567: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_0_119:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_119), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_rd_53:
	mov	0x3c6, %r14
	.word 0xf2db8e60  ! 1569: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_0_123:
	setx	0x2a0311, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_54:
	mov	0x3c3, %r14
	.word 0xfadb8e40  ! 1571: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_wr_69:
	mov	0x12, %r14
	.word 0xf0f38e60  ! 1572: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_0_124:
	setx	0x2b022c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_120:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_120), 16, 16)) -> intp(0, 0, 22)
	.word 0xb7e46019  ! 1579: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb3e460b3  ! 1580: SAVE_I	save	%r17, 0x0001, %r25
cpu_intr_0_125:
	setx	0x2b0025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e44000  ! 1582: SAVE_R	save	%r17, %r0, %r24
T0_asi_reg_rd_55:
	mov	0x3c8, %r14
	.word 0xfedb84a0  ! 1585: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_0_121:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_121), 16, 16)) -> intp(0, 0, 20)
T0_asi_reg_wr_70:
	mov	0x3c7, %r14
	.word 0xfcf389e0  ! 1595: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T0_asi_reg_rd_56:
	mov	0x31, %r14
	.word 0xf8db8e40  ! 1596: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe561ea  ! 1599: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbfe5c000  ! 1600: SAVE_R	save	%r23, %r0, %r31
cpu_intr_0_126:
	setx	0x2a030f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_122:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_122), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb3e461ee  ! 1603: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbde4205f  ! 1605: SAVE_I	save	%r16, 0x0001, %r30
iob_intr_0_123:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_123), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb5e58000  ! 1610: SAVE_R	save	%r22, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_124:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_124), 16, 16)) -> intp(0, 0, 7)
	.word 0xb5e4c000  ! 1621: SAVE_R	save	%r19, %r0, %r26
	.word 0xb9e4c000  ! 1624: SAVE_R	save	%r19, %r0, %r28
T0_asi_reg_wr_71:
	mov	0x22, %r14
	.word 0xfcf38400  ! 1626: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_0_127:
	setx	0x2b0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4c000  ! 1631: SAVE_R	save	%r19, %r0, %r29
	.word 0xbde4a1d7  ! 1632: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_rd_57:
	mov	0x3, %r14
	.word 0xfadb84a0  ! 1637: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_0_128:
	setx	0x28002a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_72:
	mov	0x3c3, %r14
	.word 0xf8f38e40  ! 1641: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbbe4606a  ! 1643: SAVE_I	save	%r17, 0x0001, %r29
cpu_intr_0_129:
	setx	0x2b0318, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_130:
	setx	0x28021e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_131:
	setx	0x2a033a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_132:
	setx	0x2a030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde40000  ! 1650: SAVE_R	save	%r16, %r0, %r30
	.word 0xbde560dc  ! 1651: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbde44000  ! 1653: SAVE_R	save	%r17, %r0, %r30
	.word 0xbbe44000  ! 1654: SAVE_R	save	%r17, %r0, %r29
cpu_intr_0_133:
	setx	0x2a0236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a02a  ! 1657: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_rd_58:
	mov	0x1c, %r14
	.word 0xf4db84a0  ! 1659: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbbe44000  ! 1660: SAVE_R	save	%r17, %r0, %r29
	.word 0xb7e5a0ed  ! 1661: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_134:
	setx	0x290202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0c4c000  ! 1666: ADDCcc_R	addccc 	%r19, %r0, %r24
T0_asi_reg_wr_73:
	mov	0x3c5, %r14
	.word 0xf0f38400  ! 1667: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_0_125:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_125), 16, 16)) -> intp(0, 0, 7)
cpu_intr_0_135:
	setx	0x2b002e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_59:
	mov	0x25, %r14
	.word 0xf6db8400  ! 1672: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_0_136:
	setx	0x280237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e40000  ! 1676: SAVE_R	save	%r16, %r0, %r26
iob_intr_0_126:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_126), 16, 16)) -> intp(0, 0, 33)
	.word 0xbf50c000  ! 1679: RDPR_TT	<illegal instruction>
T0_asi_reg_rd_60:
	mov	0x2f, %r14
	.word 0xf2db8e40  ! 1680: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_127:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_127), 16, 16)) -> intp(0, 0, 32)
	.word 0xb9e58000  ! 1686: SAVE_R	save	%r22, %r0, %r28
cpu_intr_0_137:
	setx	0x2a0218, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_128:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_128), 16, 16)) -> intp(0, 0, 27)
	.word 0xb1e44000  ! 1692: SAVE_R	save	%r17, %r0, %r24
T0_asi_reg_wr_74:
	mov	0x2e, %r14
	.word 0xf8f389e0  ! 1694: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb1e48000  ! 1697: SAVE_R	save	%r18, %r0, %r24
iob_intr_0_129:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_129), 16, 16)) -> intp(0, 0, 2)
cpu_intr_0_138:
	setx	0x2b0337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e560e5  ! 1703: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbbe56126  ! 1705: SAVE_I	save	%r21, 0x0001, %r29
cpu_intr_0_139:
	setx	0x2a031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8354000  ! 1711: ORN_R	orn 	%r21, %r0, %r28
	.word 0xb5e58000  ! 1718: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_wr_75:
	mov	0x2c, %r14
	.word 0xf6f38e80  ! 1722: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb5e421e9  ! 1724: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbbe42194  ! 1725: SAVE_I	save	%r16, 0x0001, %r29
cpu_intr_0_140:
	setx	0x2b0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb09dc000  ! 1727: XORcc_R	xorcc 	%r23, %r0, %r24
	.word 0xb7e5c000  ! 1728: SAVE_R	save	%r23, %r0, %r27
	.word 0xb3e5a065  ! 1729: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb1e4c000  ! 1734: SAVE_R	save	%r19, %r0, %r24
	.word 0xbbe4a140  ! 1735: SAVE_I	save	%r18, 0x0001, %r29
cpu_intr_0_141:
	setx	0x280134, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_61:
	mov	0x3c3, %r14
	.word 0xfcdb8e40  ! 1741: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_wr_76:
	mov	0x3c0, %r14
	.word 0xf6f38e60  ! 1742: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T0_asi_reg_wr_77:
	mov	0x3c1, %r14
	.word 0xf2f38e40  ! 1743: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb3e44000  ! 1744: SAVE_R	save	%r17, %r0, %r25
	.word 0xb7e4e1cc  ! 1745: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb1e5c000  ! 1746: SAVE_R	save	%r23, %r0, %r24
	.word 0xbbe46109  ! 1747: SAVE_I	save	%r17, 0x0001, %r29
iob_intr_0_130:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_130), 16, 16)) -> intp(0, 0, 33)
	.word 0xbde4a0de  ! 1756: SAVE_I	save	%r18, 0x0001, %r30
iob_intr_0_131:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_131), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbbe50000  ! 1761: SAVE_R	save	%r20, %r0, %r29
	.word 0xbfe48000  ! 1764: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_142:
	setx	0x29033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_132:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_132), 16, 16)) -> intp(0, 0, 5)
cpu_intr_0_143:
	setx	0x2a0003, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_62:
	mov	0x22, %r14
	.word 0xf4db89e0  ! 1775: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_0_133:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_133), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbbe50000  ! 1780: SAVE_R	save	%r20, %r0, %r29
	.word 0xbde58000  ! 1781: SAVE_R	save	%r22, %r0, %r30
T0_asi_reg_wr_78:
	mov	0x3c0, %r14
	.word 0xfef38e40  ! 1784: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb7e461f5  ! 1787: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb93dc000  ! 1788: SRA_R	sra 	%r23, %r0, %r28
	.word 0xb3643801  ! 1798: MOVcc_I	<illegal instruction>
	.word 0xbbe40000  ! 1800: SAVE_R	save	%r16, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe4a089  ! 1805: SAVE_I	save	%r18, 0x0001, %r31
cpu_intr_0_144:
	setx	0x290110, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_134:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_134), 16, 16)) -> intp(0, 0, 27)
	.word 0xb1e40000  ! 1812: SAVE_R	save	%r16, %r0, %r24
	.word 0xb3e461ee  ! 1813: SAVE_I	save	%r17, 0x0001, %r25
cpu_intr_0_145:
	setx	0x290306, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_146:
	setx	0x280225, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_79:
	mov	0xd, %r14
	.word 0xfef38e40  ! 1817: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_rd_63:
	mov	0xc, %r14
	.word 0xfadb8400  ! 1818: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T0_asi_reg_rd_64:
	mov	0xf, %r14
	.word 0xf4db8e40  ! 1823: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_0_147:
	setx	0x280223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 1825: SAVE_R	save	%r23, %r0, %r27
	.word 0xb5e4c000  ! 1826: SAVE_R	save	%r19, %r0, %r26
iob_intr_0_135:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_135), 16, 16)) -> intp(0, 0, 3a)
	.word 0xbe8d209a  ! 1828: ANDcc_I	andcc 	%r20, 0x009a, %r31
cpu_intr_0_148:
	setx	0x29002e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_149:
	setx	0x2b012f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_80:
	mov	0xf, %r14
	.word 0xf2f38e60  ! 1833: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb5e40000  ! 1836: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_rd_65:
	mov	0x1b, %r14
	.word 0xf2db84a0  ! 1837: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T0_asi_reg_wr_81:
	mov	0x3c3, %r14
	.word 0xfef384a0  ! 1839: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T0_asi_reg_rd_66:
	mov	0x6, %r14
	.word 0xfcdb8400  ! 1841: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbb3db001  ! 1845: SRAX_I	srax	%r22, 0x0001, %r29
iob_intr_0_136:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_136), 16, 16)) -> intp(0, 0, 28)
	.word 0xbfe50000  ! 1848: SAVE_R	save	%r20, %r0, %r31
iob_intr_0_137:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_137), 16, 16)) -> intp(0, 0, 3e)
iob_intr_0_138:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_138), 16, 16)) -> intp(0, 0, 34)
	.word 0xb1e54000  ! 1855: SAVE_R	save	%r21, %r0, %r24
	.word 0xbc0dc000  ! 1856: AND_R	and 	%r23, %r0, %r30
	.word 0xb3e5a1bf  ! 1857: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb9e460fb  ! 1861: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb8854000  ! 1862: ADDcc_R	addcc 	%r21, %r0, %r28
	.word 0xb3e4e037  ! 1863: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_139:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_139), 16, 16)) -> intp(0, 0, 1b)
	.word 0xbd2d0000  ! 1866: SLL_R	sll 	%r20, %r0, %r30
T0_asi_reg_wr_82:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 1875: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_0_150:
	setx	0x2e030c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_151:
	setx	0x2d023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e561c4  ! 1879: SAVE_I	save	%r21, 0x0001, %r27
iob_intr_0_140:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_140), 16, 16)) -> intp(0, 0, 17)
iob_intr_0_141:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_141), 16, 16)) -> intp(0, 0, 27)
	.word 0xb1e5605a  ! 1883: SAVE_I	save	%r21, 0x0001, %r24
T0_asi_reg_rd_67:
	mov	0x2, %r14
	.word 0xf2db89e0  ! 1885: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb7e4a1be  ! 1886: SAVE_I	save	%r18, 0x0001, %r27
iob_intr_0_142:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_142), 16, 16)) -> intp(0, 0, 1c)
cpu_intr_0_152:
	setx	0x2c0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a03c  ! 1890: SAVE_I	save	%r18, 0x0001, %r29
T0_asi_reg_rd_68:
	mov	0x13, %r14
	.word 0xfcdb8e40  ! 1891: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_0_143:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_143), 16, 16)) -> intp(0, 0, 36)
iob_intr_0_144:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_144), 16, 16)) -> intp(0, 0, 29)
cpu_intr_0_153:
	setx	0x20107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde56010  ! 1896: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb9e4e19c  ! 1898: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_rd_69:
	mov	0x1e, %r14
	.word 0xf6db84a0  ! 1903: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb5e460db  ! 1906: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb9e4e069  ! 1910: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb1e48000  ! 1911: SAVE_R	save	%r18, %r0, %r24
	.word 0xb0bde16d  ! 1912: XNORcc_I	xnorcc 	%r23, 0x016d, %r24
T0_asi_reg_rd_70:
	mov	0x1a, %r14
	.word 0xf4db8e40  ! 1914: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbfe4a161  ! 1915: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_wr_83:
	mov	0x13, %r14
	.word 0xfef38400  ! 1917: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T0_asi_reg_rd_71:
	mov	0x1, %r14
	.word 0xf6db8e40  ! 1920: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbbe5a0ed  ! 1922: SAVE_I	save	%r22, 0x0001, %r29
T0_asi_reg_wr_84:
	mov	0x3c2, %r14
	.word 0xfcf389e0  ! 1923: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_0_145:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_145), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb5e48000  ! 1928: SAVE_R	save	%r18, %r0, %r26
	.word 0xb7e4e0f2  ! 1933: SAVE_I	save	%r19, 0x0001, %r27
cpu_intr_0_154:
	setx	0x2d002f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_155:
	setx	0x2f000c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_146:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_146), 16, 16)) -> intp(0, 0, 1c)
iob_intr_0_147:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_147), 16, 16)) -> intp(0, 0, 20)
	.word 0xb7e54000  ! 1939: SAVE_R	save	%r21, %r0, %r27
iob_intr_0_148:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_148), 16, 16)) -> intp(0, 0, 15)
cpu_intr_0_156:
	setx	0x2c0019, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_72:
	mov	0x3c0, %r14
	.word 0xfcdb89e0  ! 1948: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T0_asi_reg_wr_85:
	mov	0x13, %r14
	.word 0xf0f38400  ! 1953: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T0_asi_reg_rd_73:
	mov	0x3c6, %r14
	.word 0xf6db8e80  ! 1954: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb1e50000  ! 1958: SAVE_R	save	%r20, %r0, %r24
cpu_intr_0_157:
	setx	0x2f001f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_149:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_149), 16, 16)) -> intp(0, 0, 5)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_rd_74:
	mov	0x26, %r14
	.word 0xf4db8e80  ! 1963: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb1e4612a  ! 1966: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_wr_86:
	mov	0x3c6, %r14
	.word 0xf6f38e80  ! 1968: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb5e54000  ! 1971: SAVE_R	save	%r21, %r0, %r26
	.word 0xb9e44000  ! 1972: SAVE_R	save	%r17, %r0, %r28
cpu_intr_0_158:
	setx	0x2c020b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_159:
	setx	0x2d0108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e50000  ! 1978: SAVE_R	save	%r20, %r0, %r24
iob_intr_0_150:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_150), 16, 16)) -> intp(0, 0, 27)
iob_intr_0_151:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_151), 16, 16)) -> intp(0, 0, 10)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_87:
	mov	0x1c, %r14
	.word 0xf0f38e40  ! 1995: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb6b42103  ! 1996: ORNcc_I	orncc 	%r16, 0x0103, %r27
	.word 0xbde5a073  ! 1998: SAVE_I	save	%r22, 0x0001, %r30
cpu_intr_0_160:
	setx	0x2c0204, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_161:
	setx	0x2e0328, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_88:
	mov	0x2c, %r14
	.word 0xf2f38400  ! 2005: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbc254000  ! 2006: SUB_R	sub 	%r21, %r0, %r30
iob_intr_0_152:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_152), 16, 16)) -> intp(0, 0, 33)
	.word 0xb2b50000  ! 2008: ORNcc_R	orncc 	%r20, %r0, %r25
T0_asi_reg_wr_89:
	mov	0x6, %r14
	.word 0xfaf38e40  ! 2009: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb68ce027  ! 2011: ANDcc_I	andcc 	%r19, 0x0027, %r27
cpu_intr_0_162:
	setx	0x2d012f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_90:
	mov	0x3, %r14
	.word 0xf0f38e60  ! 2014: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb7348000  ! 2017: SRL_R	srl 	%r18, %r0, %r27
iob_intr_0_153:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_153), 16, 16)) -> intp(0, 0, 29)
	.word 0xbbe48000  ! 2025: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_wr_91:
	mov	0xa, %r14
	.word 0xfaf38e80  ! 2027: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb7e48000  ! 2028: SAVE_R	save	%r18, %r0, %r27
T0_asi_reg_rd_75:
	mov	0x14, %r14
	.word 0xf2db84a0  ! 2029: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T0_asi_reg_wr_92:
	mov	0x4, %r14
	.word 0xf4f38e40  ! 2030: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_163:
	setx	0x2e0238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe48000  ! 2033: SAVE_R	save	%r18, %r0, %r31
	.word 0xbc244000  ! 2034: SUB_R	sub 	%r17, %r0, %r30
T0_asi_reg_wr_93:
	mov	0x3c4, %r14
	.word 0xfcf38400  ! 2037: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_0_154:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_154), 16, 16)) -> intp(0, 0, 31)
cpu_intr_0_164:
	setx	0x2f0205, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_94:
	mov	0x1e, %r14
	.word 0xfaf38e60  ! 2044: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_0_155:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_155), 16, 16)) -> intp(0, 0, 11)
	.word 0xb5e44000  ! 2048: SAVE_R	save	%r17, %r0, %r26
	.word 0xbfe5e15a  ! 2050: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbd3d9000  ! 2053: SRAX_R	srax	%r22, %r0, %r30
	.word 0xb7e4a0ca  ! 2054: SAVE_I	save	%r18, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_156:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_156), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb9e52164  ! 2062: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb08dc000  ! 2064: ANDcc_R	andcc 	%r23, %r0, %r24
cpu_intr_0_165:
	setx	0x2e0315, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_166:
	setx	0x2d0135, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_76:
	mov	0x6, %r14
	.word 0xf4db8e60  ! 2067: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xbde48000  ! 2070: SAVE_R	save	%r18, %r0, %r30
	.word 0xb245a022  ! 2071: ADDC_I	addc 	%r22, 0x0022, %r25
iob_intr_0_157:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_157), 16, 16)) -> intp(0, 0, 39)
	.word 0xb635e1fb  ! 2075: ORN_I	orn 	%r23, 0x01fb, %r27
cpu_intr_0_167:
	setx	0x2d020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5c000  ! 2079: SAVE_R	save	%r23, %r0, %r26
cpu_intr_0_168:
	setx	0x2f0117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 2082: SAVE_R	save	%r20, %r0, %r29
cpu_intr_0_169:
	setx	0x2e0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5c000  ! 2084: SAVE_R	save	%r23, %r0, %r28
cpu_intr_0_170:
	setx	0x2e0328, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_77:
	mov	0x12, %r14
	.word 0xfcdb89e0  ! 2086: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_0_158:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_158), 16, 16)) -> intp(0, 0, 23)
T0_asi_reg_wr_95:
	mov	0x2a, %r14
	.word 0xfaf389e0  ! 2089: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_0_159:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_159), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb17de401  ! 2091: MOVR_I	movre	%r23, 0x1, %r24
cpu_intr_0_171:
	setx	0x2f021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde54000  ! 2097: SAVE_R	save	%r21, %r0, %r30
	.word 0xb9e5e15e  ! 2098: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb1e52032  ! 2099: SAVE_I	save	%r20, 0x0001, %r24
cpu_intr_0_172:
	setx	0x2c0028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a104  ! 2103: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_wr_96:
	mov	0x0, %r14
	.word 0xf0f384a0  ! 2105: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb5e46132  ! 2111: SAVE_I	save	%r17, 0x0001, %r26
T0_asi_reg_rd_78:
	mov	0x13, %r14
	.word 0xf4db8e40  ! 2114: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_0_173:
	setx	0x2c0301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4c000  ! 2120: SAVE_R	save	%r19, %r0, %r29
	.word 0xb3e4a077  ! 2122: SAVE_I	save	%r18, 0x0001, %r25
	.word 0x8594205b  ! 2124: WRPR_TSTATE_I	wrpr	%r16, 0x005b, %tstate
iob_intr_0_160:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_160), 16, 16)) -> intp(0, 0, 21)
	.word 0xb4b5c000  ! 2126: SUBCcc_R	orncc 	%r23, %r0, %r26
	.word 0xbde4e1d7  ! 2128: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_rd_79:
	mov	0x2c, %r14
	.word 0xf2db8e40  ! 2129: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbe34e085  ! 2131: ORN_I	orn 	%r19, 0x0085, %r31
	.word 0xbde50000  ! 2133: SAVE_R	save	%r20, %r0, %r30
	.word 0xbc34a1c9  ! 2134: SUBC_I	orn 	%r18, 0x01c9, %r30
iob_intr_0_161:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_161), 16, 16)) -> intp(0, 0, 31)
	.word 0xb2b58000  ! 2139: SUBCcc_R	orncc 	%r22, %r0, %r25
	.word 0xb7e5204e  ! 2141: SAVE_I	save	%r20, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbd358000  ! 2148: SRL_R	srl 	%r22, %r0, %r30
cpu_intr_0_174:
	setx	0x2d0015, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_162:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_162), 16, 16)) -> intp(0, 0, 11)
cpu_intr_0_175:
	setx	0x2f013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_97:
	mov	0x3c3, %r14
	.word 0xfcf38e60  ! 2159: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_0_163:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_163), 16, 16)) -> intp(0, 0, 15)
	.word 0xb3e46092  ! 2164: SAVE_I	save	%r17, 0x0001, %r25
cpu_intr_0_176:
	setx	0x2d0208, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_177:
	setx	0x2d030d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_80:
	mov	0x25, %r14
	.word 0xfcdb8e60  ! 2176: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T0_asi_reg_rd_81:
	mov	0x36, %r14
	.word 0xfadb8400  ! 2177: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T0_asi_reg_rd_82:
	mov	0x2b, %r14
	.word 0xf6db89e0  ! 2178: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_0_178:
	setx	0x2f020e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_164:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_164), 16, 16)) -> intp(0, 0, 28)
cpu_intr_0_179:
	setx	0x2c010c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_98:
	mov	0x3c0, %r14
	.word 0xf6f38400  ! 2188: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_0_180:
	setx	0x2f031f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_181:
	setx	0x2f0137, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfe4c000  ! 2195: SAVE_R	save	%r19, %r0, %r31
	.word 0xb7e4c000  ! 2199: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_rd_83:
	mov	0xa, %r14
	.word 0xfadb84a0  ! 2201: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_165:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_165), 16, 16)) -> intp(0, 0, 1b)
	.word 0xbfe5e166  ! 2207: SAVE_I	save	%r23, 0x0001, %r31
T0_asi_reg_wr_99:
	mov	0x33, %r14
	.word 0xf0f384a0  ! 2209: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T0_asi_reg_rd_84:
	mov	0x2b, %r14
	.word 0xfadb84a0  ! 2212: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_0_166:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_166), 16, 16)) -> intp(0, 0, 18)
	.word 0xbde4e11d  ! 2219: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_rd_85:
	mov	0x2c, %r14
	.word 0xf6db8e60  ! 2222: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T0_asi_reg_wr_100:
	mov	0x16, %r14
	.word 0xf0f38400  ! 2224: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb7e460e6  ! 2225: SAVE_I	save	%r17, 0x0001, %r27
T0_asi_reg_rd_86:
	mov	0x3c3, %r14
	.word 0xf4db8e40  ! 2227: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb7e4c000  ! 2231: SAVE_R	save	%r19, %r0, %r27
	.word 0xb3e561ea  ! 2232: SAVE_I	save	%r21, 0x0001, %r25
iob_intr_0_167:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_167), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_182:
	setx	0x2f0012, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_183:
	setx	0x2f020d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_168:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_168), 16, 16)) -> intp(0, 0, 22)
	.word 0xb1e420fc  ! 2244: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e40000  ! 2246: SAVE_R	save	%r16, %r0, %r25
	.word 0xbfe4c000  ! 2248: SAVE_R	save	%r19, %r0, %r31
T0_asi_reg_wr_101:
	mov	0xc, %r14
	.word 0xfcf38e40  ! 2252: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbde52164  ! 2255: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb8250000  ! 2257: SUB_R	sub 	%r20, %r0, %r28
cpu_intr_0_184:
	setx	0x2d010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe40000  ! 2260: SAVE_R	save	%r16, %r0, %r31
iob_intr_0_169:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_169), 16, 16)) -> intp(0, 0, 25)
iob_intr_0_170:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_170), 16, 16)) -> intp(0, 0, 5)
cpu_intr_0_185:
	setx	0x2c030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a0b5  ! 2275: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_rd_87:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 2276: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbbe5a072  ! 2278: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_171:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_171), 16, 16)) -> intp(0, 0, 30)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_186:
	setx	0x2e0113, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_187:
	setx	0x2d0219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a082  ! 2288: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde5c000  ! 2292: SAVE_R	save	%r23, %r0, %r30
	.word 0xb9e56110  ! 2293: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb2a54000  ! 2295: SUBcc_R	subcc 	%r21, %r0, %r25
	.word 0xb3e4e0cd  ! 2298: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_172:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_172), 16, 16)) -> intp(0, 0, 22)
	.word 0xbe3da0dc  ! 2300: XNOR_I	xnor 	%r22, 0x00dc, %r31
iob_intr_0_173:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_173), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_rd_88:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 2303: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_188:
	setx	0x2f000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5c000  ! 2306: SAVE_R	save	%r23, %r0, %r28
cpu_intr_0_189:
	setx	0x2f001c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_190:
	setx	0x2f0003, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_191:
	setx	0x30021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde46047  ! 2313: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb1e4e1c3  ! 2315: SAVE_I	save	%r19, 0x0001, %r24
iob_intr_0_174:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_174), 16, 16)) -> intp(0, 0, 11)
	.word 0xb844c000  ! 2321: ADDC_R	addc 	%r19, %r0, %r28
	.word 0xb5e54000  ! 2326: SAVE_R	save	%r21, %r0, %r26
	.word 0xb9e44000  ! 2327: SAVE_R	save	%r17, %r0, %r28
	.word 0xb9e4e17d  ! 2329: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbbe4c000  ! 2330: SAVE_R	save	%r19, %r0, %r29
	.word 0xbde4c000  ! 2331: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_wr_102:
	mov	0xc, %r14
	.word 0xf6f38e40  ! 2333: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_192:
	setx	0x30010c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_175:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_175), 16, 16)) -> intp(0, 0, 39)
cpu_intr_0_193:
	setx	0x320012, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_103:
	mov	0x3c0, %r14
	.word 0xfcf389e0  ! 2341: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T0_asi_reg_rd_89:
	mov	0x3c3, %r14
	.word 0xf6db8e80  ! 2342: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb7e40000  ! 2343: SAVE_R	save	%r16, %r0, %r27
	.word 0xbde4a09a  ! 2345: SAVE_I	save	%r18, 0x0001, %r30
cpu_intr_0_194:
	setx	0x330000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe42107  ! 2347: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_rd_90:
	mov	0xc, %r14
	.word 0xf2db8e40  ! 2349: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_176:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_176), 16, 16)) -> intp(0, 0, 17)
	.word 0xb3e5a015  ! 2355: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb7e58000  ! 2356: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_wr_104:
	mov	0x1a, %r14
	.word 0xfaf38e60  ! 2358: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T0_asi_reg_rd_91:
	mov	0x3c6, %r14
	.word 0xf8db84a0  ! 2361: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_0_177:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_177), 16, 16)) -> intp(0, 0, 2e)
T0_asi_reg_rd_92:
	mov	0x19, %r14
	.word 0xf0db89e0  ! 2367: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbbe44000  ! 2368: SAVE_R	save	%r17, %r0, %r29
	.word 0xb3e460a1  ! 2369: SAVE_I	save	%r17, 0x0001, %r25
cpu_intr_0_195:
	setx	0x330221, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_196:
	setx	0x33021c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_105:
	mov	0xb, %r14
	.word 0xf6f38e80  ! 2375: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_0_197:
	setx	0x320310, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_198:
	setx	0x300226, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_106:
	mov	0x34, %r14
	.word 0xfef38e60  ! 2380: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_0_199:
	setx	0x31003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb81c4000  ! 2383: XOR_R	xor 	%r17, %r0, %r28
	.word 0xb1e50000  ! 2384: SAVE_R	save	%r20, %r0, %r24
T0_asi_reg_rd_93:
	mov	0x2d, %r14
	.word 0xfadb8e40  ! 2385: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_rd_94:
	mov	0x15, %r14
	.word 0xf0db8e40  ! 2389: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb5e5e1cf  ! 2391: SAVE_I	save	%r23, 0x0001, %r26
cpu_intr_0_200:
	setx	0x32013c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_178:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_178), 16, 16)) -> intp(0, 0, 1f)
	.word 0xbbe4603c  ! 2394: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbbe4c000  ! 2395: SAVE_R	save	%r19, %r0, %r29
	.word 0xb235c000  ! 2396: ORN_R	orn 	%r23, %r0, %r25
	.word 0xb1e44000  ! 2397: SAVE_R	save	%r17, %r0, %r24
	.word 0xb7e5a144  ! 2400: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb3e4a116  ! 2401: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7348000  ! 2405: SRL_R	srl 	%r18, %r0, %r27
cpu_intr_0_201:
	setx	0x330139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e48000  ! 2409: SAVE_R	save	%r18, %r0, %r25
	.word 0xb9e50000  ! 2411: SAVE_R	save	%r20, %r0, %r28
	.word 0xb7e54000  ! 2412: SAVE_R	save	%r21, %r0, %r27
	.word 0xb5e5c000  ! 2418: SAVE_R	save	%r23, %r0, %r26
	.word 0xb3e5a125  ! 2419: SAVE_I	save	%r22, 0x0001, %r25
iob_intr_0_179:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_179), 16, 16)) -> intp(0, 0, 36)
T0_asi_reg_rd_95:
	mov	0x1, %r14
	.word 0xf2db8400  ! 2423: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb2144000  ! 2426: OR_R	or 	%r17, %r0, %r25
	.word 0xb5e5e1b7  ! 2428: SAVE_I	save	%r23, 0x0001, %r26
cpu_intr_0_202:
	setx	0x330308, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_180:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_180), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_wr_107:
	mov	0x37, %r14
	.word 0xfef38400  ! 2438: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbde48000  ! 2444: SAVE_R	save	%r18, %r0, %r30
iob_intr_0_181:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_181), 16, 16)) -> intp(0, 0, 3b)
T0_asi_reg_wr_108:
	mov	0x4, %r14
	.word 0xf8f384a0  ! 2448: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_0_203:
	setx	0x320308, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_109:
	mov	0x9, %r14
	.word 0xfcf38e40  ! 2453: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_204:
	setx	0x300313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b4a00b  ! 2457: SUBCcc_I	orncc 	%r18, 0x000b, %r28
	.word 0xbde58000  ! 2458: SAVE_R	save	%r22, %r0, %r30
	.word 0xb3e40000  ! 2459: SAVE_R	save	%r16, %r0, %r25
	.word 0xb3e5605c  ! 2461: SAVE_I	save	%r21, 0x0001, %r25
cpu_intr_0_205:
	setx	0x330115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5e1de  ! 2465: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbbe50000  ! 2468: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_182:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_182), 16, 16)) -> intp(0, 0, a)
	.word 0xbbe54000  ! 2471: SAVE_R	save	%r21, %r0, %r29
	.word 0xbc85a0fc  ! 2474: ADDcc_I	addcc 	%r22, 0x00fc, %r30
T0_asi_reg_rd_96:
	mov	0x3c0, %r14
	.word 0xf2db8e60  ! 2475: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb7e44000  ! 2476: SAVE_R	save	%r17, %r0, %r27
cpu_intr_0_206:
	setx	0x300229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e50000  ! 2482: SAVE_R	save	%r20, %r0, %r25
	.word 0xb885c000  ! 2484: ADDcc_R	addcc 	%r23, %r0, %r28
	.word 0xb7e4c000  ! 2487: SAVE_R	save	%r19, %r0, %r27
	.word 0xbbe54000  ! 2488: SAVE_R	save	%r21, %r0, %r29
	.word 0xbde4210a  ! 2490: SAVE_I	save	%r16, 0x0001, %r30
iob_intr_0_183:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_183), 16, 16)) -> intp(0, 0, c)
	.word 0xbf342001  ! 2493: SRL_I	srl 	%r16, 0x0001, %r31
cpu_intr_0_207:
	setx	0x310002, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_208:
	setx	0x320129, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_184:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_184), 16, 16)) -> intp(0, 0, 1e)
iob_intr_0_185:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_185), 16, 16)) -> intp(0, 0, 9)
cpu_intr_0_209:
	setx	0x330039, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_97:
	mov	0x1c, %r14
	.word 0xf8db89e0  ! 2507: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb73de001  ! 2509: SRA_I	sra 	%r23, 0x0001, %r27
	.word 0xba85c000  ! 2512: ADDcc_R	addcc 	%r23, %r0, %r29
cpu_intr_0_210:
	setx	0x320233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde421db  ! 2517: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_rd_98:
	mov	0x3c1, %r14
	.word 0xf0db8e80  ! 2522: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T0_asi_reg_wr_110:
	mov	0x3c7, %r14
	.word 0xf4f38e60  ! 2523: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_0_211:
	setx	0x310128, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_212:
	setx	0x320205, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_213:
	setx	0x300238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e1cc  ! 2531: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb5e50000  ! 2532: SAVE_R	save	%r20, %r0, %r26
cpu_intr_0_214:
	setx	0x310226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_215:
	setx	0x300012, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_99:
	mov	0x3c1, %r14
	.word 0xf0db8e80  ! 2535: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbbe5a0d4  ! 2539: SAVE_I	save	%r22, 0x0001, %r29
cpu_intr_0_216:
	setx	0x32000a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_217:
	setx	0x33031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe42095  ! 2543: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_rd_100:
	mov	0x7, %r14
	.word 0xfadb89e0  ! 2545: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xbde4e0ae  ! 2546: SAVE_I	save	%r19, 0x0001, %r30
cpu_intr_0_218:
	setx	0x32002e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_186:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_186), 16, 16)) -> intp(0, 0, 22)
	.word 0xbfe44000  ! 2558: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_187:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_187), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb9e4a00b  ! 2562: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb22c2093  ! 2565: ANDN_I	andn 	%r16, 0x0093, %r25
	.word 0xb5e40000  ! 2566: SAVE_R	save	%r16, %r0, %r26
iob_intr_0_188:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_188), 16, 16)) -> intp(0, 0, 34)
	.word 0xb5e4c000  ! 2572: SAVE_R	save	%r19, %r0, %r26
	.word 0xb5e50000  ! 2573: SAVE_R	save	%r20, %r0, %r26
cpu_intr_0_219:
	setx	0x300310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e561cc  ! 2578: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb89c2066  ! 2579: XORcc_I	xorcc 	%r16, 0x0066, %r28
	.word 0xb3e48000  ! 2580: SAVE_R	save	%r18, %r0, %r25
	.word 0xb3e44000  ! 2582: SAVE_R	save	%r17, %r0, %r25
T0_asi_reg_rd_101:
	mov	0x32, %r14
	.word 0xf2db89e0  ! 2583: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_0_189:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_189), 16, 16)) -> intp(0, 0, 7)
cpu_intr_0_220:
	setx	0x310100, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_111:
	mov	0x12, %r14
	.word 0xfef38400  ! 2587: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbbe54000  ! 2590: SAVE_R	save	%r21, %r0, %r29
T0_asi_reg_rd_102:
	mov	0x14, %r14
	.word 0xfadb89e0  ! 2592: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb3e5c000  ! 2594: SAVE_R	save	%r23, %r0, %r25
	.word 0xbab56191  ! 2598: SUBCcc_I	orncc 	%r21, 0x0191, %r29
	.word 0xb7e54000  ! 2599: SAVE_R	save	%r21, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbb510000  ! 2603: RDPR_TICK	<illegal instruction>
T0_asi_reg_wr_112:
	mov	0x11, %r14
	.word 0xfaf38e80  ! 2604: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T0_asi_reg_wr_113:
	mov	0x8, %r14
	.word 0xfcf38e40  ! 2608: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_rd_103:
	mov	0x30, %r14
	.word 0xf6db8e40  ! 2610: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb9e46144  ! 2611: SAVE_I	save	%r17, 0x0001, %r28
T0_asi_reg_wr_114:
	mov	0x28, %r14
	.word 0xfaf38e80  ! 2612: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_0_190:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_190), 16, 16)) -> intp(0, 0, 29)
cpu_intr_0_221:
	setx	0x310206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b5219a  ! 2615: ORNcc_I	orncc 	%r20, 0x019a, %r25
cpu_intr_0_222:
	setx	0x31010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 2621: SAVE_R	save	%r20, %r0, %r27
T0_asi_reg_wr_115:
	mov	0x3c8, %r14
	.word 0xfaf38400  ! 2622: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbde5c000  ! 2623: SAVE_R	save	%r23, %r0, %r30
	.word 0xb1e40000  ! 2624: SAVE_R	save	%r16, %r0, %r24
	.word 0xb9643801  ! 2626: MOVcc_I	<illegal instruction>
iob_intr_0_191:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_191), 16, 16)) -> intp(0, 0, 12)
	.word 0xb1e54000  ! 2630: SAVE_R	save	%r21, %r0, %r24
T0_asi_reg_rd_104:
	mov	0x3c6, %r14
	.word 0xf8db8e80  ! 2631: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_0_192:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_192), 16, 16)) -> intp(0, 0, d)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_223:
	setx	0x310026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e46033  ! 2641: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbde54000  ! 2643: SAVE_R	save	%r21, %r0, %r30
	.word 0xb5e54000  ! 2648: SAVE_R	save	%r21, %r0, %r26
cpu_intr_0_224:
	setx	0x310332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5c000  ! 2653: SAVE_R	save	%r23, %r0, %r24
	.word 0xb7e44000  ! 2656: SAVE_R	save	%r17, %r0, %r27
	.word 0xb5e42055  ! 2657: SAVE_I	save	%r16, 0x0001, %r26
cpu_intr_0_225:
	setx	0x31031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_193:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_193), 16, 16)) -> intp(0, 0, 21)
T0_asi_reg_rd_105:
	mov	0x24, %r14
	.word 0xfedb84a0  ! 2661: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_0_226:
	setx	0x310110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe58000  ! 2665: SAVE_R	save	%r22, %r0, %r29
T0_asi_reg_wr_116:
	mov	0x2c, %r14
	.word 0xf8f38400  ! 2667: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbbe50000  ! 2668: SAVE_R	save	%r20, %r0, %r29
	.word 0xbde46153  ! 2669: SAVE_I	save	%r17, 0x0001, %r30
iob_intr_0_194:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_194), 16, 16)) -> intp(0, 0, 17)
iob_intr_0_195:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_195), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_rd_106:
	mov	0x28, %r14
	.word 0xf8db89e0  ! 2674: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_0_227:
	setx	0x330334, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9e520a9  ! 2682: SAVE_I	save	%r20, 0x0001, %r28
T0_asi_reg_rd_107:
	mov	0x26, %r14
	.word 0xf0db89e0  ! 2686: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_0_196:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_196), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbc85203d  ! 2691: ADDcc_I	addcc 	%r20, 0x003d, %r30
	.word 0xbf641800  ! 2693: MOVcc_R	<illegal instruction>
	.word 0xbbe54000  ! 2694: SAVE_R	save	%r21, %r0, %r29
	.word 0xb3e44000  ! 2697: SAVE_R	save	%r17, %r0, %r25
	.word 0xbd355000  ! 2701: SRLX_R	srlx	%r21, %r0, %r30
T0_asi_reg_rd_108:
	mov	0xd, %r14
	.word 0xfedb8e60  ! 2704: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_0_228:
	setx	0x33012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a024  ! 2714: SAVE_I	save	%r22, 0x0001, %r26
iob_intr_0_197:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_197), 16, 16)) -> intp(0, 0, 14)
	.word 0xb7e40000  ! 2718: SAVE_R	save	%r16, %r0, %r27
	.word 0xb9e5c000  ! 2719: SAVE_R	save	%r23, %r0, %r28
	.word 0xbcb4e08d  ! 2721: SUBCcc_I	orncc 	%r19, 0x008d, %r30
cpu_intr_0_229:
	setx	0x300212, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_198:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_198), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb3e50000  ! 2726: SAVE_R	save	%r20, %r0, %r25
cpu_intr_0_230:
	setx	0x30001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4201b  ! 2733: SAVE_I	save	%r16, 0x0001, %r26
T0_asi_reg_wr_117:
	mov	0x34, %r14
	.word 0xf4f38e40  ! 2734: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbbe4c000  ! 2737: SAVE_R	save	%r19, %r0, %r29
T0_asi_reg_wr_118:
	mov	0x3c5, %r14
	.word 0xf6f38e40  ! 2739: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_0_231:
	setx	0x310022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e1de  ! 2744: SAVE_I	save	%r19, 0x0001, %r26
cpu_intr_0_232:
	setx	0x300332, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_199:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_199), 16, 16)) -> intp(0, 0, 1f)
cpu_intr_0_233:
	setx	0x310306, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_119:
	mov	0x3c3, %r14
	.word 0xfaf38e40  ! 2752: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb1e4c000  ! 2753: SAVE_R	save	%r19, %r0, %r24
iob_intr_0_200:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_200), 16, 16)) -> intp(0, 0, 1e)
	.word 0xbde48000  ! 2759: SAVE_R	save	%r18, %r0, %r30
	.word 0xb5e50000  ! 2763: SAVE_R	save	%r20, %r0, %r26
	.word 0xb1e4e0a3  ! 2765: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_wr_120:
	mov	0xa, %r14
	.word 0xf0f38e40  ! 2766: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbde50000  ! 2768: SAVE_R	save	%r20, %r0, %r30
iob_intr_0_201:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_201), 16, 16)) -> intp(0, 0, 1d)
	.word 0xbfe50000  ! 2771: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_234:
	setx	0x310208, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_235:
	setx	0x310234, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_202:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_202), 16, 16)) -> intp(0, 0, b)
iob_intr_0_203:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_203), 16, 16)) -> intp(0, 0, 3a)
cpu_intr_0_236:
	setx	0x30032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe44000  ! 2784: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_rd_109:
	mov	0x14, %r14
	.word 0xf4db8e60  ! 2787: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_0_204:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_204), 16, 16)) -> intp(0, 0, 1e)
iob_intr_0_205:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_205), 16, 16)) -> intp(0, 0, 0)
cpu_intr_0_237:
	setx	0x37031f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_121:
	mov	0x35, %r14
	.word 0xfcf389e0  ! 2796: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb9e54000  ! 2797: SAVE_R	save	%r21, %r0, %r28
cpu_intr_0_238:
	setx	0x340118, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_239:
	setx	0x360202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4c000  ! 2804: SAVE_R	save	%r19, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_206:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_206), 16, 16)) -> intp(0, 0, 4)
iob_intr_0_207:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_207), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbfe58000  ! 2811: SAVE_R	save	%r22, %r0, %r31
	.word 0x919560cc  ! 2816: WRPR_PIL_I	wrpr	%r21, 0x00cc, %pil
iob_intr_0_208:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_208), 16, 16)) -> intp(0, 0, 21)
	.word 0xbf508000  ! 2818: RDPR_TSTATE	<illegal instruction>
	.word 0xb5e5a061  ! 2821: SAVE_I	save	%r22, 0x0001, %r26
cpu_intr_0_240:
	setx	0x34001f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_122:
	mov	0x29, %r14
	.word 0xf8f38e40  ! 2825: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_209:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_209), 16, 16)) -> intp(0, 0, 29)
cpu_intr_0_241:
	setx	0x34000c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_210:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_210), 16, 16)) -> intp(0, 0, 18)
	.word 0xb1e54000  ! 2832: SAVE_R	save	%r21, %r0, %r24
cpu_intr_0_242:
	setx	0x30303, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_211:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_211), 16, 16)) -> intp(0, 0, 34)
	.word 0xb7e4a066  ! 2838: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_wr_123:
	mov	0x26, %r14
	.word 0xf0f38e40  ! 2839: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb9e5c000  ! 2840: SAVE_R	save	%r23, %r0, %r28
T0_asi_reg_wr_124:
	mov	0x12, %r14
	.word 0xfcf38400  ! 2841: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbde521ff  ! 2844: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_wr_125:
	mov	0x2a, %r14
	.word 0xfcf38e80  ! 2845: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T0_asi_reg_wr_126:
	mov	0xf, %r14
	.word 0xf8f384a0  ! 2846: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb3e40000  ! 2849: SAVE_R	save	%r16, %r0, %r25
	.word 0xb9e50000  ! 2853: SAVE_R	save	%r20, %r0, %r28
	.word 0xbfe4c000  ! 2855: SAVE_R	save	%r19, %r0, %r31
	.word 0xb9e4a00f  ! 2856: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_wr_127:
	mov	0x11, %r14
	.word 0xf2f38e80  ! 2857: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_0_212:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_212), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb22ca1d2  ! 2861: ANDN_I	andn 	%r18, 0x01d2, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe5204d  ! 2870: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_213:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_213), 16, 16)) -> intp(0, 0, 3)
	.word 0xb1e5218a  ! 2878: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb9e4612f  ! 2880: SAVE_I	save	%r17, 0x0001, %r28
cpu_intr_0_243:
	setx	0x37003c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_110:
	mov	0x4, %r14
	.word 0xf6db89e0  ! 2885: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xbfe5a12f  ! 2887: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_214:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_214), 16, 16)) -> intp(0, 0, c)
T0_asi_reg_wr_128:
	mov	0x1f, %r14
	.word 0xfef38e40  ! 2891: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_rd_111:
	mov	0x1f, %r14
	.word 0xf0db8e40  ! 2892: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb7e54000  ! 2895: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_rd_112:
	mov	0x2b, %r14
	.word 0xfcdb89e0  ! 2899: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T0_asi_reg_wr_129:
	mov	0x3c3, %r14
	.word 0xf0f38e40  ! 2901: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_244:
	setx	0x360006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb62c20b3  ! 2903: ANDN_I	andn 	%r16, 0x00b3, %r27
	.word 0xb5e4c000  ! 2904: SAVE_R	save	%r19, %r0, %r26
	.word 0xb5e4e089  ! 2905: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_wr_130:
	mov	0x1, %r14
	.word 0xf6f389e0  ! 2907: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb1e54000  ! 2908: SAVE_R	save	%r21, %r0, %r24
cpu_intr_0_245:
	setx	0x37012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e1be  ! 2914: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_wr_131:
	mov	0x37, %r14
	.word 0xf8f38e60  ! 2915: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb9e521a8  ! 2917: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1e5202e  ! 2920: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb1e40000  ! 2922: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_215:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_215), 16, 16)) -> intp(0, 0, 3c)
iob_intr_0_216:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_216), 16, 16)) -> intp(0, 0, 11)
cpu_intr_0_246:
	setx	0x35002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4c000  ! 2930: SAVE_R	save	%r19, %r0, %r28
	.word 0xb3e56044  ! 2933: SAVE_I	save	%r21, 0x0001, %r25
T0_asi_reg_wr_132:
	mov	0x25, %r14
	.word 0xf2f38e60  ! 2935: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_0_247:
	setx	0x370008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e17e  ! 2941: SAVE_I	save	%r19, 0x0001, %r24
cpu_intr_0_248:
	setx	0x35032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2158000  ! 2944: OR_R	or 	%r22, %r0, %r25
iob_intr_0_217:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_217), 16, 16)) -> intp(0, 0, a)
iob_intr_0_218:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_218), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb1e5e065  ! 2950: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb7e40000  ! 2952: SAVE_R	save	%r16, %r0, %r27
	.word 0xb2244000  ! 2955: SUB_R	sub 	%r17, %r0, %r25
	.word 0xb3e5605c  ! 2957: SAVE_I	save	%r21, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e56043  ! 2960: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbde40000  ! 2964: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_219:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_219), 16, 16)) -> intp(0, 0, 3d)
T0_asi_reg_rd_113:
	mov	0x2f, %r14
	.word 0xfcdb8e40  ! 2968: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb1e5e168  ! 2970: SAVE_I	save	%r23, 0x0001, %r24
cpu_intr_0_249:
	setx	0x350001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x87956005  ! 2972: WRPR_TT_I	wrpr	%r21, 0x0005, %tt
cpu_intr_0_250:
	setx	0x360018, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_114:
	mov	0x3c8, %r14
	.word 0xf2db89e0  ! 2974: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_0_220:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_220), 16, 16)) -> intp(0, 0, e)
	.word 0xbd7c8400  ! 2977: MOVR_R	movre	%r18, %r0, %r30
	.word 0xbc142099  ! 2978: OR_I	or 	%r16, 0x0099, %r30
	.word 0xbb518000  ! 2982: RDPR_PSTATE	<illegal instruction>
iob_intr_0_221:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_221), 16, 16)) -> intp(0, 0, 33)
T0_asi_reg_wr_133:
	mov	0x3c4, %r14
	.word 0xf8f38400  ! 2991: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb3e4a0d8  ! 2996: SAVE_I	save	%r18, 0x0001, %r25
iob_intr_0_222:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_222), 16, 16)) -> intp(0, 0, 3f)
	.word 0xbc95c000  ! 2999: ORcc_R	orcc 	%r23, %r0, %r30
	.word 0xb1e4616d  ! 3002: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_rd_115:
	mov	0x18, %r14
	.word 0xf4db8400  ! 3003: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T0_asi_reg_wr_134:
	mov	0x1f, %r14
	.word 0xfcf38e80  ! 3009: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_0_223:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_223), 16, 16)) -> intp(0, 0, 2f)
	.word 0xbfe42124  ! 3013: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbfe54000  ! 3014: SAVE_R	save	%r21, %r0, %r31
	.word 0xb5e46029  ! 3015: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbde4207e  ! 3017: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_wr_135:
	mov	0x36, %r14
	.word 0xfaf389e0  ! 3019: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T0_asi_reg_wr_136:
	mov	0x3c4, %r14
	.word 0xf8f384a0  ! 3025: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_0_251:
	setx	0x360109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb645e187  ! 3033: ADDC_I	addc 	%r23, 0x0187, %r27
T0_asi_reg_wr_137:
	mov	0x16, %r14
	.word 0xfef38e80  ! 3034: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T0_asi_reg_rd_116:
	mov	0x3c8, %r14
	.word 0xf6db8e40  ! 3035: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_224:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_224), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_rd_117:
	mov	0x11, %r14
	.word 0xfedb8e60  ! 3038: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb9e50000  ! 3042: SAVE_R	save	%r20, %r0, %r28
	.word 0xbbe42166  ! 3043: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_225:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_225), 16, 16)) -> intp(0, 0, 1a)
iob_intr_0_226:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_226), 16, 16)) -> intp(0, 0, 2d)
T0_asi_reg_wr_138:
	mov	0xb, %r14
	.word 0xf4f38e60  ! 3047: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xbbe4e1c1  ! 3048: SAVE_I	save	%r19, 0x0001, %r29
	.word 0x8d94e095  ! 3049: WRPR_PSTATE_I	wrpr	%r19, 0x0095, %pstate
cpu_intr_0_252:
	setx	0x340232, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_139:
	mov	0x35, %r14
	.word 0xfcf38e40  ! 3055: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbde4e0a6  ! 3056: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb9e4e00f  ! 3059: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbbe52124  ! 3065: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_rd_118:
	mov	0x1e, %r14
	.word 0xf0db8e40  ! 3066: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb5e58000  ! 3067: SAVE_R	save	%r22, %r0, %r26
	.word 0xb1e5c000  ! 3070: SAVE_R	save	%r23, %r0, %r24
	.word 0xbbe5619f  ! 3071: SAVE_I	save	%r21, 0x0001, %r29
T0_asi_reg_wr_140:
	mov	0x24, %r14
	.word 0xfef38e40  ! 3074: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb9e58000  ! 3075: SAVE_R	save	%r22, %r0, %r28
	.word 0xb7480000  ! 3076: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbbe4c000  ! 3080: SAVE_R	save	%r19, %r0, %r29
iob_intr_0_227:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_227), 16, 16)) -> intp(0, 0, 15)
cpu_intr_0_253:
	setx	0x34003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba3561e5  ! 3088: ORN_I	orn 	%r21, 0x01e5, %r29
cpu_intr_0_254:
	setx	0x36001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e46017  ! 3094: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_255:
	setx	0x370317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaa4e0c0  ! 3096: SUBcc_I	subcc 	%r19, 0x00c0, %r29
T0_asi_reg_rd_119:
	mov	0x3c1, %r14
	.word 0xfadb8400  ! 3098: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_0_256:
	setx	0x35010b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_257:
	setx	0x370208, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_258:
	setx	0x36002c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_259:
	setx	0x360125, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_141:
	mov	0x3c2, %r14
	.word 0xfaf389e0  ! 3106: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_0_228:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_228), 16, 16)) -> intp(0, 0, 2e)
cpu_intr_0_260:
	setx	0x360115, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_229:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_229), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_rd_120:
	mov	0x3c1, %r14
	.word 0xfcdb8e60  ! 3120: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb9e50000  ! 3122: SAVE_R	save	%r20, %r0, %r28
T0_asi_reg_rd_121:
	mov	0x3c7, %r14
	.word 0xfadb89e0  ! 3123: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_0_261:
	setx	0x340100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb09c4000  ! 3128: XORcc_R	xorcc 	%r17, %r0, %r24
T0_asi_reg_rd_122:
	mov	0x28, %r14
	.word 0xfadb84a0  ! 3129: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_0_230:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_230), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbde4a019  ! 3131: SAVE_I	save	%r18, 0x0001, %r30
iob_intr_0_231:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_231), 16, 16)) -> intp(0, 0, 36)
cpu_intr_0_262:
	setx	0x360102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5c000  ! 3136: SAVE_R	save	%r23, %r0, %r24
	.word 0xb9e52063  ! 3140: SAVE_I	save	%r20, 0x0001, %r28
iob_intr_0_232:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_232), 16, 16)) -> intp(0, 0, 14)
cpu_intr_0_263:
	setx	0x350230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e48000  ! 3148: SAVE_R	save	%r18, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e461d8  ! 3154: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb3e421e3  ! 3158: SAVE_I	save	%r16, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_264:
	setx	0x36003a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_123:
	mov	0x3c1, %r14
	.word 0xf8db89e0  ! 3163: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_0_233:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_233), 16, 16)) -> intp(0, 0, 5)
cpu_intr_0_265:
	setx	0x37023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde58000  ! 3167: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_266:
	setx	0x340239, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_267:
	setx	0x34032c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_142:
	mov	0x1, %r14
	.word 0xf8f38400  ! 3181: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_0_268:
	setx	0x350129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_269:
	setx	0x35010c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_234:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_234), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbde5618b  ! 3188: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb9e54000  ! 3191: SAVE_R	save	%r21, %r0, %r28
	.word 0xbd3d0000  ! 3194: SRA_R	sra 	%r20, %r0, %r30
T0_asi_reg_rd_124:
	mov	0x1c, %r14
	.word 0xf0db8e40  ! 3198: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb9e40000  ! 3199: SAVE_R	save	%r16, %r0, %r28
T0_asi_reg_rd_125:
	mov	0x3c6, %r14
	.word 0xfcdb8e40  ! 3200: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbf356001  ! 3201: SRL_I	srl 	%r21, 0x0001, %r31
	.word 0xbde50000  ! 3202: SAVE_R	save	%r20, %r0, %r30
	.word 0xb5e46082  ! 3205: SAVE_I	save	%r17, 0x0001, %r26
iob_intr_0_235:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_235), 16, 16)) -> intp(0, 0, 17)
	.word 0xbfe4e0cf  ! 3210: SAVE_I	save	%r19, 0x0001, %r31
cpu_intr_0_270:
	setx	0x37023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e0b3  ! 3214: SAVE_I	save	%r19, 0x0001, %r27
iob_intr_0_236:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_236), 16, 16)) -> intp(0, 0, 10)
cpu_intr_0_271:
	setx	0x360110, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_237:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_237), 16, 16)) -> intp(0, 0, 36)
	.word 0xb5e58000  ! 3222: SAVE_R	save	%r22, %r0, %r26
cpu_intr_0_272:
	setx	0x340119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_273:
	setx	0x350306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6358000  ! 3226: ORN_R	orn 	%r22, %r0, %r27
	.word 0x8f902000  ! 3227: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xb1e48000  ! 3229: SAVE_R	save	%r18, %r0, %r24
	.word 0xbc8d6151  ! 3230: ANDcc_I	andcc 	%r21, 0x0151, %r30
iob_intr_0_238:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_238), 16, 16)) -> intp(0, 0, 37)
iob_intr_0_239:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_239), 16, 16)) -> intp(0, 0, 1a)
T0_asi_reg_rd_126:
	mov	0x3c5, %r14
	.word 0xf6db89e0  ! 3237: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_0_240:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_240), 16, 16)) -> intp(0, 0, 29)
T0_asi_reg_rd_127:
	mov	0x12, %r14
	.word 0xfcdb8e80  ! 3239: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_0_274:
	setx	0x3a032b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_143:
	mov	0x3c7, %r14
	.word 0xfcf389e0  ! 3241: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T0_asi_reg_rd_128:
	mov	0x3c5, %r14
	.word 0xf4db8e40  ! 3242: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb7e48000  ! 3243: SAVE_R	save	%r18, %r0, %r27
iob_intr_0_241:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_241), 16, 16)) -> intp(0, 0, 2)
cpu_intr_0_275:
	setx	0x3a020d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_129:
	mov	0x3c7, %r14
	.word 0xf4db8400  ! 3248: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xbbe5218d  ! 3250: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbde48000  ! 3251: SAVE_R	save	%r18, %r0, %r30
	.word 0xb7e5a11e  ! 3253: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb5e561b9  ! 3254: SAVE_I	save	%r21, 0x0001, %r26
T0_asi_reg_wr_144:
	mov	0x28, %r14
	.word 0xf8f38e80  ! 3255: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xbbe40000  ! 3256: SAVE_R	save	%r16, %r0, %r29
iob_intr_0_242:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_242), 16, 16)) -> intp(0, 0, 2)
	.word 0xbde48000  ! 3263: SAVE_R	save	%r18, %r0, %r30
iob_intr_0_243:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_243), 16, 16)) -> intp(0, 0, a)
	.word 0xb9e48000  ! 3272: SAVE_R	save	%r18, %r0, %r28
cpu_intr_0_276:
	setx	0x380028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5c000  ! 3274: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_244:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_244), 16, 16)) -> intp(0, 0, 35)
T0_asi_reg_wr_145:
	mov	0x21, %r14
	.word 0xf8f38e40  ! 3276: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_rd_130:
	mov	0x3c8, %r14
	.word 0xf2db84a0  ! 3279: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_0_245:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_245), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_rd_131:
	mov	0x3c5, %r14
	.word 0xf0db84a0  ! 3281: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T0_asi_reg_rd_132:
	mov	0x37, %r14
	.word 0xf8db8e80  ! 3283: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbbe4e150  ! 3284: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_wr_146:
	mov	0x2d, %r14
	.word 0xfaf38e60  ! 3285: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_0_277:
	setx	0x390222, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_246:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_246), 16, 16)) -> intp(0, 0, 39)
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
cpu_intr_0_278:
	setx	0x380119, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_247:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_247), 16, 16)) -> intp(0, 0, 32)
	.word 0xb5e44000  ! 3299: SAVE_R	save	%r17, %r0, %r26
	.word 0xb5e48000  ! 3300: SAVE_R	save	%r18, %r0, %r26
	.word 0xb1e5611a  ! 3301: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb7e5c000  ! 3302: SAVE_R	save	%r23, %r0, %r27
	.word 0xbc35a13c  ! 3304: ORN_I	orn 	%r22, 0x013c, %r30
	.word 0xbde4610a  ! 3305: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe56151  ! 3306: SAVE_I	save	%r21, 0x0001, %r29
iob_intr_0_248:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_248), 16, 16)) -> intp(0, 0, 29)
iob_intr_0_249:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_249), 16, 16)) -> intp(0, 0, 17)
	.word 0xb7e4a066  ! 3311: SAVE_I	save	%r18, 0x0001, %r27
iob_intr_0_250:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_250), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_279:
	setx	0x3a023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 3314: SAVE_R	save	%r21, %r0, %r27
	.word 0xbde48000  ! 3316: SAVE_R	save	%r18, %r0, %r30
	.word 0xb9e40000  ! 3317: SAVE_R	save	%r16, %r0, %r28
cpu_intr_0_280:
	setx	0x390003, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_147:
	mov	0x15, %r14
	.word 0xf8f38400  ! 3323: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_251:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_251), 16, 16)) -> intp(0, 0, 13)
	.word 0xbc14a1d3  ! 3330: OR_I	or 	%r18, 0x01d3, %r30
T0_asi_reg_wr_148:
	mov	0x13, %r14
	.word 0xfcf38400  ! 3332: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb5e50000  ! 3334: SAVE_R	save	%r20, %r0, %r26
cpu_intr_0_281:
	setx	0x3a012e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_282:
	setx	0x390211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2c5e1b7  ! 3339: ADDCcc_I	addccc 	%r23, 0x01b7, %r25
	.word 0xbde54000  ! 3341: SAVE_R	save	%r21, %r0, %r30
	.word 0xbbe561e2  ! 3344: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb3e4c000  ! 3349: SAVE_R	save	%r19, %r0, %r25
cpu_intr_0_283:
	setx	0x380006, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_252:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_252), 16, 16)) -> intp(0, 0, 29)
	.word 0xbde54000  ! 3355: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_253:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_253), 16, 16)) -> intp(0, 0, 3a)
	.word 0xbbe48000  ! 3357: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_wr_149:
	mov	0x1a, %r14
	.word 0xf2f384a0  ! 3359: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbbe48000  ! 3360: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_rd_133:
	mov	0x3c1, %r14
	.word 0xf4db84a0  ! 3362: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_0_254:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_254), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb1e40000  ! 3365: SAVE_R	save	%r16, %r0, %r24
	.word 0xb9e4c000  ! 3369: SAVE_R	save	%r19, %r0, %r28
	.word 0xb9e40000  ! 3371: SAVE_R	save	%r16, %r0, %r28
cpu_intr_0_284:
	setx	0x3b0125, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_134:
	mov	0x14, %r14
	.word 0xfadb8e80  ! 3373: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_0_255:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_255), 16, 16)) -> intp(0, 0, 35)
	.word 0xb8b58000  ! 3375: SUBCcc_R	orncc 	%r22, %r0, %r28
cpu_intr_0_285:
	setx	0x38013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde44000  ! 3381: SAVE_R	save	%r17, %r0, %r30
	.word 0xb69520e2  ! 3382: ORcc_I	orcc 	%r20, 0x00e2, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_286:
	setx	0x39022f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_256:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_256), 16, 16)) -> intp(0, 0, f)
iob_intr_0_257:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_257), 16, 16)) -> intp(0, 0, 9)
	.word 0xbfe5c000  ! 3389: SAVE_R	save	%r23, %r0, %r31
	.word 0xb5e54000  ! 3390: SAVE_R	save	%r21, %r0, %r26
	.word 0xbfe56183  ! 3391: SAVE_I	save	%r21, 0x0001, %r31
iob_intr_0_258:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_258), 16, 16)) -> intp(0, 0, 2e)
cpu_intr_0_287:
	setx	0x2010e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_288:
	setx	0x390214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4a170  ! 3400: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb214a03b  ! 3401: OR_I	or 	%r18, 0x003b, %r25
	.word 0xb3e5c000  ! 3406: SAVE_R	save	%r23, %r0, %r25
cpu_intr_0_289:
	setx	0x3a0137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e421b7  ! 3411: SAVE_I	save	%r16, 0x0001, %r26
T0_asi_reg_rd_135:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 3413: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_wr_150:
	mov	0x3c0, %r14
	.word 0xf4f38e40  ! 3415: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbde5c000  ! 3416: SAVE_R	save	%r23, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_151:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 3418: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbfe54000  ! 3420: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_259:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_259), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_wr_152:
	mov	0x3c4, %r14
	.word 0xfaf384a0  ! 3423: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbbe44000  ! 3424: SAVE_R	save	%r17, %r0, %r29
	.word 0xba140000  ! 3428: OR_R	or 	%r16, %r0, %r29
iob_intr_0_260:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_260), 16, 16)) -> intp(0, 0, 32)
cpu_intr_0_290:
	setx	0x390300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a113  ! 3433: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb3e42169  ! 3434: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde48000  ! 3435: SAVE_R	save	%r18, %r0, %r30
	.word 0xb6ade0f6  ! 3436: ANDNcc_I	andncc 	%r23, 0x00f6, %r27
	.word 0xb9e5e14e  ! 3437: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_wr_153:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 3438: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_wr_154:
	mov	0x26, %r14
	.word 0xfcf38e60  ! 3440: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T0_asi_reg_rd_136:
	mov	0x28, %r14
	.word 0xf6db8e80  ! 3441: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_0_291:
	setx	0x3b0035, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_261:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_261), 16, 16)) -> intp(0, 0, 32)
iob_intr_0_262:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_262), 16, 16)) -> intp(0, 0, b)
	.word 0xb7510000  ! 3452: RDPR_TICK	<illegal instruction>
	.word 0xb7e54000  ! 3453: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_rd_137:
	mov	0x3c0, %r14
	.word 0xfcdb84a0  ! 3456: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb625e118  ! 3459: SUB_I	sub 	%r23, 0x0118, %r27
T0_asi_reg_rd_138:
	mov	0x17, %r14
	.word 0xfadb8e80  ! 3462: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb5e4c000  ! 3472: SAVE_R	save	%r19, %r0, %r26
T0_asi_reg_wr_155:
	mov	0xf, %r14
	.word 0xf0f38400  ! 3482: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T0_asi_reg_rd_139:
	mov	0x20, %r14
	.word 0xf2db8e60  ! 3483: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_292:
	setx	0x390232, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_263:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_263), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbde50000  ! 3489: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_rd_140:
	mov	0x9, %r14
	.word 0xf0db8400  ! 3490: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_0_293:
	setx	0x390323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc34e01a  ! 3495: ORN_I	orn 	%r19, 0x001a, %r30
	.word 0xb3e4a003  ! 3498: SAVE_I	save	%r18, 0x0001, %r25
cpu_intr_0_294:
	setx	0x3a0029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_264:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_264), 16, 16)) -> intp(0, 0, 11)
	.word 0xb01de062  ! 3502: XOR_I	xor 	%r23, 0x0062, %r24
T0_asi_reg_rd_141:
	mov	0xe, %r14
	.word 0xf2db89e0  ! 3505: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb0ada1fb  ! 3507: ANDNcc_I	andncc 	%r22, 0x01fb, %r24
T0_asi_reg_wr_156:
	mov	0x3c2, %r14
	.word 0xfef38e80  ! 3509: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb3e48000  ! 3510: SAVE_R	save	%r18, %r0, %r25
	.word 0xbabd4000  ! 3511: XNORcc_R	xnorcc 	%r21, %r0, %r29
	.word 0xb3e48000  ! 3514: SAVE_R	save	%r18, %r0, %r25
	.word 0xb9e5e103  ! 3518: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_wr_157:
	mov	0xd, %r14
	.word 0xf0f389e0  ! 3521: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb9e5c000  ! 3527: SAVE_R	save	%r23, %r0, %r28
cpu_intr_0_295:
	setx	0x3b001c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_142:
	mov	0x3c0, %r14
	.word 0xf2db8e60  ! 3530: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_0_296:
	setx	0x39012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_143:
	mov	0x3c0, %r14
	.word 0xf8db8e60  ! 3534: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_0_265:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_265), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb32d3001  ! 3540: SLLX_I	sllx	%r20, 0x0001, %r25
T0_asi_reg_rd_144:
	mov	0xb, %r14
	.word 0xf8db8e40  ! 3543: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_297:
	setx	0x380325, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_145:
	mov	0x12, %r14
	.word 0xfedb8400  ! 3550: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_0_266:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_266), 16, 16)) -> intp(0, 0, 13)
cpu_intr_0_298:
	setx	0x380308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8058000  ! 3554: ADD_R	add 	%r22, %r0, %r28
	.word 0xb1e4a09e  ! 3557: SAVE_I	save	%r18, 0x0001, %r24
cpu_intr_0_299:
	setx	0x3a0139, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_267:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_267), 16, 16)) -> intp(0, 0, 27)
	.word 0xb9e54000  ! 3564: SAVE_R	save	%r21, %r0, %r28
	.word 0xb7e40000  ! 3565: SAVE_R	save	%r16, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb0840000  ! 3569: ADDcc_R	addcc 	%r16, %r0, %r24
cpu_intr_0_300:
	setx	0x3b020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4148000  ! 3575: OR_R	or 	%r18, %r0, %r26
	.word 0xbde5a0bc  ! 3577: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb8a521e6  ! 3579: SUBcc_I	subcc 	%r20, 0x01e6, %r28
	.word 0xbfe4e0e9  ! 3580: SAVE_I	save	%r19, 0x0001, %r31
cpu_intr_0_301:
	setx	0x39022a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_302:
	setx	0x38023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4c000  ! 3587: SAVE_R	save	%r19, %r0, %r28
cpu_intr_0_303:
	setx	0x3b031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_268:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_268), 16, 16)) -> intp(0, 0, 10)
iob_intr_0_269:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_269), 16, 16)) -> intp(0, 0, 15)
	.word 0xbde4e0f8  ! 3592: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1e5a0de  ! 3593: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb3e56087  ! 3595: SAVE_I	save	%r21, 0x0001, %r25
iob_intr_0_270:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_270), 16, 16)) -> intp(0, 0, b)
T0_asi_reg_wr_158:
	mov	0x35, %r14
	.word 0xfef38e80  ! 3600: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbf3c9000  ! 3601: SRAX_R	srax	%r18, %r0, %r31
T0_asi_reg_rd_146:
	mov	0x3c8, %r14
	.word 0xf6db8400  ! 3602: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_0_271:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_271), 16, 16)) -> intp(0, 0, 1b)
T0_asi_reg_rd_147:
	mov	0x2, %r14
	.word 0xf8db8400  ! 3606: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb52c7001  ! 3607: SLLX_I	sllx	%r17, 0x0001, %r26
	.word 0xbfe5a0eb  ! 3608: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb5e4609b  ! 3610: SAVE_I	save	%r17, 0x0001, %r26
iob_intr_0_272:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_272), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_wr_159:
	mov	0xa, %r14
	.word 0xf0f38400  ! 3612: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T0_asi_reg_wr_160:
	mov	0x36, %r14
	.word 0xf6f38400  ! 3613: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbbe40000  ! 3614: SAVE_R	save	%r16, %r0, %r29
	.word 0xbbe4e0e4  ! 3615: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb6046072  ! 3616: ADD_I	add 	%r17, 0x0072, %r27
iob_intr_0_273:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_273), 16, 16)) -> intp(0, 0, 2a)
cpu_intr_0_304:
	setx	0x3b0324, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_305:
	setx	0x3b030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e42181  ! 3624: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb4bd0000  ! 3631: XNORcc_R	xnorcc 	%r20, %r0, %r26
T0_asi_reg_wr_161:
	mov	0x2b, %r14
	.word 0xfaf384a0  ! 3632: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_0_306:
	setx	0x39000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e58000  ! 3634: SAVE_R	save	%r22, %r0, %r28
	.word 0xb7e44000  ! 3638: SAVE_R	save	%r17, %r0, %r27
iob_intr_0_274:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_274), 16, 16)) -> intp(0, 0, 1)
	.word 0xbb2cc000  ! 3641: SLL_R	sll 	%r19, %r0, %r29
	.word 0xb3e58000  ! 3642: SAVE_R	save	%r22, %r0, %r25
	.word 0xb9e58000  ! 3643: SAVE_R	save	%r22, %r0, %r28
	.word 0xbaa5c000  ! 3644: SUBcc_R	subcc 	%r23, %r0, %r29
T0_asi_reg_rd_148:
	mov	0x20, %r14
	.word 0xf8db8e40  ! 3645: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_rd_149:
	mov	0x31, %r14
	.word 0xf4db8e80  ! 3646: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_0_275:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_275), 16, 16)) -> intp(0, 0, 4)
iob_intr_0_276:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_276), 16, 16)) -> intp(0, 0, 22)
cpu_intr_0_307:
	setx	0x38000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde54000  ! 3659: SAVE_R	save	%r21, %r0, %r30
	.word 0xba0d8000  ! 3660: AND_R	and 	%r22, %r0, %r29
	.word 0xbbe4e14c  ! 3662: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbde5216c  ! 3663: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb1e48000  ! 3665: SAVE_R	save	%r18, %r0, %r24
	.word 0xbbe521b1  ! 3666: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbfe461c6  ! 3668: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb5e50000  ! 3669: SAVE_R	save	%r20, %r0, %r26
cpu_intr_0_308:
	setx	0x3a0002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe48000  ! 3672: SAVE_R	save	%r18, %r0, %r29
	.word 0xb6bce18c  ! 3679: XNORcc_I	xnorcc 	%r19, 0x018c, %r27
T0_asi_reg_rd_150:
	mov	0x2c, %r14
	.word 0xf0db8e40  ! 3681: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_309:
	setx	0x3b0023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc148000  ! 3685: OR_R	or 	%r18, %r0, %r30
iob_intr_0_277:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_277), 16, 16)) -> intp(0, 0, 18)
	.word 0xbde48000  ! 3690: SAVE_R	save	%r18, %r0, %r30
	.word 0xb3e4e01e  ! 3691: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb7e4c000  ! 3693: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_rd_151:
	mov	0x21, %r14
	.word 0xf0db8e40  ! 3697: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_rd_152:
	mov	0x3c6, %r14
	.word 0xfedb8e40  ! 3698: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb5e5a06f  ! 3700: SAVE_I	save	%r22, 0x0001, %r26
T0_asi_reg_wr_162:
	mov	0x25, %r14
	.word 0xf2f38400  ! 3702: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbbe56016  ! 3703: SAVE_I	save	%r21, 0x0001, %r29
iob_intr_0_278:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_278), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbbe421ef  ! 3708: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7e46071  ! 3710: SAVE_I	save	%r17, 0x0001, %r27
cpu_intr_0_310:
	setx	0x3e0105, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_153:
	mov	0x33, %r14
	.word 0xf2db84a0  ! 3714: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb5e420aa  ! 3717: SAVE_I	save	%r16, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_163:
	mov	0x2a, %r14
	.word 0xf2f38e60  ! 3719: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T0_asi_reg_rd_154:
	mov	0x3c1, %r14
	.word 0xf6db8e40  ! 3721: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbbe48000  ! 3723: SAVE_R	save	%r18, %r0, %r29
	.word 0xb3e40000  ! 3724: SAVE_R	save	%r16, %r0, %r25
	.word 0xb5e4a1ec  ! 3725: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb1e48000  ! 3728: SAVE_R	save	%r18, %r0, %r24
T0_asi_reg_wr_164:
	mov	0x37, %r14
	.word 0xfcf389e0  ! 3729: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T0_asi_reg_wr_165:
	mov	0x3c8, %r14
	.word 0xfef384a0  ! 3730: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb9e4e03c  ! 3731: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb83c0000  ! 3733: XNOR_R	xnor 	%r16, %r0, %r28
cpu_intr_0_311:
	setx	0x3f0029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_279:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_279), 16, 16)) -> intp(0, 0, 2f)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_312:
	setx	0x3e020f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_155:
	mov	0x2, %r14
	.word 0xf2db8e40  ! 3746: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_313:
	setx	0x3d0108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e146  ! 3748: SAVE_I	save	%r19, 0x0001, %r27
cpu_intr_0_314:
	setx	0x3c031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4c000  ! 3754: SAVE_R	save	%r19, %r0, %r24
	.word 0xb7e58000  ! 3756: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_wr_166:
	mov	0x3c5, %r14
	.word 0xfaf38e60  ! 3758: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T0_asi_reg_rd_156:
	mov	0x11, %r14
	.word 0xfadb89e0  ! 3760: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb1e4e060  ! 3764: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb1e56157  ! 3765: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb3e54000  ! 3770: SAVE_R	save	%r21, %r0, %r25
T0_asi_reg_wr_167:
	mov	0x3c5, %r14
	.word 0xf6f38e40  ! 3771: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_0_315:
	setx	0x3e0027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_316:
	setx	0x3d0227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e560ab  ! 3780: SAVE_I	save	%r21, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e50000  ! 3785: SAVE_R	save	%r20, %r0, %r25
	.word 0xbbe54000  ! 3789: SAVE_R	save	%r21, %r0, %r29
	.word 0xbde4e006  ! 3791: SAVE_I	save	%r19, 0x0001, %r30
cpu_intr_0_317:
	setx	0x3e0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe44000  ! 3795: SAVE_R	save	%r17, %r0, %r31
cpu_intr_0_318:
	setx	0x3e0121, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_319:
	setx	0x3e0020, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_280:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_280), 16, 16)) -> intp(0, 0, 23)
	.word 0xb3e58000  ! 3801: SAVE_R	save	%r22, %r0, %r25
	.word 0xb5e58000  ! 3803: SAVE_R	save	%r22, %r0, %r26
	.word 0xbbe460f5  ! 3805: SAVE_I	save	%r17, 0x0001, %r29
cpu_intr_0_320:
	setx	0x3d0031, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_157:
	mov	0x3c8, %r14
	.word 0xfadb8e40  ! 3807: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb3e4204f  ! 3808: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbbe520b8  ! 3809: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbbe4a1b0  ! 3810: SAVE_I	save	%r18, 0x0001, %r29
cpu_intr_0_321:
	setx	0x3c0225, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_281:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_281), 16, 16)) -> intp(0, 0, 9)
	.word 0xb7e44000  ! 3821: SAVE_R	save	%r17, %r0, %r27
	.word 0xb3e4204b  ! 3828: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb9e50000  ! 3829: SAVE_R	save	%r20, %r0, %r28
iob_intr_0_282:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_282), 16, 16)) -> intp(0, 0, 1)
cpu_intr_0_322:
	setx	0x3c031c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_323:
	setx	0x3c0337, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_324:
	setx	0x3c0227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a17a  ! 3840: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1e48000  ! 3841: SAVE_R	save	%r18, %r0, %r24
	.word 0xb3e5619e  ! 3842: SAVE_I	save	%r21, 0x0001, %r25
T0_asi_reg_wr_168:
	mov	0x3c8, %r14
	.word 0xf6f38e40  ! 3846: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_0_283:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_283), 16, 16)) -> intp(0, 0, 31)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_325:
	setx	0x3e0231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde40000  ! 3853: SAVE_R	save	%r16, %r0, %r30
	.word 0xb9e4c000  ! 3856: SAVE_R	save	%r19, %r0, %r28
T0_asi_reg_wr_169:
	mov	0x24, %r14
	.word 0xf4f389e0  ! 3859: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_0_284:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_284), 16, 16)) -> intp(0, 0, 2)
	.word 0xbaa56109  ! 3863: SUBcc_I	subcc 	%r21, 0x0109, %r29
cpu_intr_0_326:
	setx	0x3f0336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb615e1bc  ! 3867: OR_I	or 	%r23, 0x01bc, %r27
	.word 0xbbe5c000  ! 3870: SAVE_R	save	%r23, %r0, %r29
T0_asi_reg_wr_170:
	mov	0x1b, %r14
	.word 0xf8f384a0  ! 3871: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb7e48000  ! 3875: SAVE_R	save	%r18, %r0, %r27
	.word 0xb9e40000  ! 3876: SAVE_R	save	%r16, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_rd_158:
	mov	0x3c3, %r14
	.word 0xfadb8400  ! 3879: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbbe460c8  ! 3880: SAVE_I	save	%r17, 0x0001, %r29
T0_asi_reg_rd_159:
	mov	0x27, %r14
	.word 0xf0db8400  ! 3886: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbbe5208a  ! 3889: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb1e5606b  ! 3890: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbde5c000  ! 3891: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_327:
	setx	0x3f0302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 3896: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_285:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_285), 16, 16)) -> intp(0, 0, 3e)
T0_asi_reg_rd_160:
	mov	0x3c1, %r14
	.word 0xf4db8400  ! 3900: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xbd3d9000  ! 3902: SRAX_R	srax	%r22, %r0, %r30
	.word 0xb5e5c000  ! 3903: SAVE_R	save	%r23, %r0, %r26
	.word 0xb3e4c000  ! 3904: SAVE_R	save	%r19, %r0, %r25
T0_asi_reg_wr_171:
	mov	0x3c7, %r14
	.word 0xf8f384a0  ! 3906: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T0_asi_reg_rd_161:
	mov	0x2d, %r14
	.word 0xf6db8e80  ! 3910: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_0_328:
	setx	0x3f0019, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_329:
	setx	0x3c0334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e54000  ! 3916: SAVE_R	save	%r21, %r0, %r26
	.word 0xbfe4a127  ! 3926: SAVE_I	save	%r18, 0x0001, %r31
cpu_intr_0_330:
	setx	0x3c0224, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_172:
	mov	0x1b, %r14
	.word 0xf0f389e0  ! 3928: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb7e58000  ! 3929: SAVE_R	save	%r22, %r0, %r27
cpu_intr_0_331:
	setx	0x3e002f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_162:
	mov	0x11, %r14
	.word 0xfedb8e40  ! 3935: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb5e54000  ! 3936: SAVE_R	save	%r21, %r0, %r26
cpu_intr_0_332:
	setx	0x3d0034, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_333:
	setx	0x3d000f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_286:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_286), 16, 16)) -> intp(0, 0, b)
cpu_intr_0_334:
	setx	0x3d0016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e043  ! 3946: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb8840000  ! 3947: ADDcc_R	addcc 	%r16, %r0, %r28
T0_asi_reg_rd_163:
	mov	0x22, %r14
	.word 0xfadb8e60  ! 3948: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_0_335:
	setx	0x3f000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e0ec  ! 3951: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb3e44000  ! 3952: SAVE_R	save	%r17, %r0, %r25
cpu_intr_0_336:
	setx	0x3c012e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_287:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_287), 16, 16)) -> intp(0, 0, 37)
iob_intr_0_288:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_288), 16, 16)) -> intp(0, 0, 39)
iob_intr_0_289:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_289), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbf641800  ! 3962: MOVcc_R	<illegal instruction>
	.word 0xbbe4e01d  ! 3963: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_wr_173:
	mov	0x11, %r14
	.word 0xf8f389e0  ! 3968: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb5e5e07b  ! 3969: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb7e5e06f  ! 3970: SAVE_I	save	%r23, 0x0001, %r27
cpu_intr_0_337:
	setx	0x3c0122, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_338:
	setx	0x3d013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e148  ! 3982: SAVE_I	save	%r23, 0x0001, %r26
iob_intr_0_290:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_290), 16, 16)) -> intp(0, 0, 11)
cpu_intr_0_339:
	setx	0x3f0130, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_340:
	setx	0x3f0111, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_341:
	setx	0x3c000a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_291:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_291), 16, 16)) -> intp(0, 0, 31)
T0_asi_reg_rd_164:
	mov	0x38, %r14
	.word 0xf8db8e40  ! 3990: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb43dc000  ! 3991: XNOR_R	xnor 	%r23, %r0, %r26
	.word 0xbbe5a107  ! 3993: SAVE_I	save	%r22, 0x0001, %r29
T0_asi_reg_wr_174:
	mov	0x3c4, %r14
	.word 0xfcf38e80  ! 3994: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T0_asi_reg_wr_175:
	mov	0x3c0, %r14
	.word 0xfcf38400  ! 3997: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T0_asi_reg_rd_165:
	mov	0x1b, %r14
	.word 0xfadb8400  ! 3999: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T0_asi_reg_rd_166:
	mov	0x32, %r14
	.word 0xf0db89e0  ! 4002: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_0_292:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_292), 16, 16)) -> intp(0, 0, 1a)
	.word 0x8f902001  ! 4006: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
iob_intr_0_293:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_293), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb1e40000  ! 4008: SAVE_R	save	%r16, %r0, %r24
	.word 0xbbe40000  ! 4012: SAVE_R	save	%r16, %r0, %r29
cpu_intr_0_342:
	setx	0x3c0032, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_176:
	mov	0x1c, %r14
	.word 0xf6f38400  ! 4016: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_0_343:
	setx	0x3e0124, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_167:
	mov	0x1b, %r14
	.word 0xf2db8e40  ! 4018: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb3e4a085  ! 4027: SAVE_I	save	%r18, 0x0001, %r25
cpu_intr_0_344:
	setx	0x3d0101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e521a6  ! 4032: SAVE_I	save	%r20, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_177:
	mov	0x0, %r14
	.word 0xfef38e80  ! 4034: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbde5c000  ! 4035: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_345:
	setx	0x3f0308, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_178:
	mov	0x30, %r14
	.word 0xf4f389e0  ! 4041: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb9e40000  ! 4042: SAVE_R	save	%r16, %r0, %r28
	.word 0xb3e4608b  ! 4044: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbcaca0ef  ! 4046: ANDNcc_I	andncc 	%r18, 0x00ef, %r30
cpu_intr_0_346:
	setx	0x3e0022, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_294:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_294), 16, 16)) -> intp(0, 0, 26)
	.word 0xb1e54000  ! 4054: SAVE_R	save	%r21, %r0, %r24
	.word 0xb4958000  ! 4056: ORcc_R	orcc 	%r22, %r0, %r26
cpu_intr_0_347:
	setx	0x3e001f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_348:
	setx	0x3f022c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_295:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_295), 16, 16)) -> intp(0, 0, 2)
	.word 0xbfe44000  ! 4072: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_296:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_296), 16, 16)) -> intp(0, 0, 14)
	.word 0xbfe40000  ! 4074: SAVE_R	save	%r16, %r0, %r31
T0_asi_reg_rd_168:
	mov	0x3c1, %r14
	.word 0xfedb8e40  ! 4075: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_0_297:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_297), 16, 16)) -> intp(0, 0, 37)
	.word 0xb5e58000  ! 4079: SAVE_R	save	%r22, %r0, %r26
cpu_intr_0_349:
	setx	0x3d0230, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_350:
	setx	0x3d0019, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_179:
	mov	0x3c6, %r14
	.word 0xfef38e40  ! 4084: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbc9561be  ! 4086: ORcc_I	orcc 	%r21, 0x01be, %r30
	.word 0xb9e48000  ! 4087: SAVE_R	save	%r18, %r0, %r28
cpu_intr_0_351:
	setx	0x3d003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e40000  ! 4095: SAVE_R	save	%r16, %r0, %r26
iob_intr_0_298:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_298), 16, 16)) -> intp(0, 0, 28)
cpu_intr_0_352:
	setx	0x3d0006, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_169:
	mov	0x1b, %r14
	.word 0xf0db8e40  ! 4101: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_299:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_299), 16, 16)) -> intp(0, 0, 2a)
iob_intr_0_300:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_300), 16, 16)) -> intp(0, 0, 17)
	.word 0xb00c21b2  ! 4115: AND_I	and 	%r16, 0x01b2, %r24
	.word 0xbfe5c000  ! 4116: SAVE_R	save	%r23, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb0452124  ! 4118: ADDC_I	addc 	%r20, 0x0124, %r24
cpu_intr_0_353:
	setx	0x3f000e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_354:
	setx	0x3e0223, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_355:
	setx	0x3e002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8848000  ! 4132: ADDcc_R	addcc 	%r18, %r0, %r28
T0_asi_reg_rd_170:
	mov	0x28, %r14
	.word 0xf2db89e0  ! 4137: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb5e44000  ! 4140: SAVE_R	save	%r17, %r0, %r26
	.word 0xb3e520b6  ! 4144: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_rd_171:
	mov	0x3c2, %r14
	.word 0xfedb8e40  ! 4145: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb7e5e129  ! 4149: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb7e560c1  ! 4154: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbfe561fa  ! 4155: SAVE_I	save	%r21, 0x0001, %r31
iob_intr_0_301:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_301), 16, 16)) -> intp(0, 0, 1)
cpu_intr_0_356:
	setx	0x410008, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_180:
	mov	0x2f, %r14
	.word 0xf2f38e40  ! 4160: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_rd_172:
	mov	0xb, %r14
	.word 0xf2db8e80  ! 4161: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_302:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_302), 16, 16)) -> intp(0, 0, 1a)
	.word 0xbfe4604c  ! 4175: SAVE_I	save	%r17, 0x0001, %r31
iob_intr_0_303:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_303), 16, 16)) -> intp(0, 0, 22)
iob_intr_0_304:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_304), 16, 16)) -> intp(0, 0, 1b)
T0_asi_reg_rd_173:
	mov	0x20, %r14
	.word 0xf6db8e60  ! 4180: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_0_305:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_305), 16, 16)) -> intp(0, 0, 4)
cpu_intr_0_357:
	setx	0x42031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e40000  ! 4186: SAVE_R	save	%r16, %r0, %r25
T0_asi_reg_wr_181:
	mov	0x29, %r14
	.word 0xfef38e40  ! 4188: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_0_306:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_306), 16, 16)) -> intp(0, 0, 30)
	.word 0xb1e5e008  ! 4198: SAVE_I	save	%r23, 0x0001, %r24
cpu_intr_0_358:
	setx	0x410210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x839460b4  ! 4202: WRPR_TNPC_I	wrpr	%r17, 0x00b4, %tnpc
cpu_intr_0_359:
	setx	0x430301, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_182:
	mov	0x20, %r14
	.word 0xf0f38e80  ! 4208: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbde54000  ! 4209: SAVE_R	save	%r21, %r0, %r30
	.word 0xb88c0000  ! 4210: ANDcc_R	andcc 	%r16, %r0, %r28
	.word 0xb6b4a06f  ! 4212: ORNcc_I	orncc 	%r18, 0x006f, %r27
cpu_intr_0_360:
	setx	0x420002, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_183:
	mov	0x24, %r14
	.word 0xfaf38e60  ! 4218: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb7e460b2  ! 4219: SAVE_I	save	%r17, 0x0001, %r27
cpu_intr_0_361:
	setx	0x420328, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_184:
	mov	0x2a, %r14
	.word 0xf6f38e80  ! 4222: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_0_307:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_307), 16, 16)) -> intp(0, 0, 39)
	.word 0xbbe48000  ! 4226: SAVE_R	save	%r18, %r0, %r29
	.word 0xbde561f6  ! 4228: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbc340000  ! 4229: ORN_R	orn 	%r16, %r0, %r30
T0_asi_reg_wr_185:
	mov	0x35, %r14
	.word 0xf4f38400  ! 4232: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_0_308:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_308), 16, 16)) -> intp(0, 0, 21)
	.word 0xbc8c0000  ! 4235: ANDcc_R	andcc 	%r16, %r0, %r30
cpu_intr_0_362:
	setx	0x400000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e46062  ! 4241: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb7e4c000  ! 4242: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_wr_186:
	mov	0x3c3, %r14
	.word 0xf2f38e60  ! 4243: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xbfe58000  ! 4244: SAVE_R	save	%r22, %r0, %r31
T0_asi_reg_rd_174:
	mov	0x4, %r14
	.word 0xf4db8e40  ! 4245: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbfe560c8  ! 4251: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb6248000  ! 4252: SUB_R	sub 	%r18, %r0, %r27
iob_intr_0_309:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_309), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_rd_175:
	mov	0x2f, %r14
	.word 0xfcdb8e40  ! 4256: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_363:
	setx	0x430028, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_187:
	mov	0x37, %r14
	.word 0xf8f38e40  ! 4259: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_364:
	setx	0x40002b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_310:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_310), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb3e40000  ! 4266: SAVE_R	save	%r16, %r0, %r25
	.word 0xb7e5a0fb  ! 4267: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_365:
	setx	0x42020a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_311:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_311), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbde5c000  ! 4273: SAVE_R	save	%r23, %r0, %r30
	.word 0xb97d0400  ! 4274: MOVR_R	movre	%r20, %r0, %r28
cpu_intr_0_366:
	setx	0x430134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8158000  ! 4287: OR_R	or 	%r22, %r0, %r28
iob_intr_0_312:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_312), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_wr_188:
	mov	0x2c, %r14
	.word 0xf4f384a0  ! 4289: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_0_367:
	setx	0x40011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb61c8000  ! 4294: XOR_R	xor 	%r18, %r0, %r27
T0_asi_reg_wr_189:
	mov	0x24, %r14
	.word 0xf4f38e40  ! 4295: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_rd_176:
	mov	0x0, %r14
	.word 0xf2db8e40  ! 4296: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0x919560ad  ! 4297: WRPR_PIL_I	wrpr	%r21, 0x00ad, %pil
	.word 0xb484a072  ! 4301: ADDcc_I	addcc 	%r18, 0x0072, %r26
iob_intr_0_313:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_313), 16, 16)) -> intp(0, 0, 33)
	.word 0xb3e50000  ! 4307: SAVE_R	save	%r20, %r0, %r25
	.word 0xbde5e03d  ! 4308: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb7e461a5  ! 4310: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1e56175  ! 4311: SAVE_I	save	%r21, 0x0001, %r24
iob_intr_0_314:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_314), 16, 16)) -> intp(0, 0, 2a)
iob_intr_0_315:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_315), 16, 16)) -> intp(0, 0, 15)
	.word 0xbde48000  ! 4328: SAVE_R	save	%r18, %r0, %r30
	.word 0xb1e5a19b  ! 4329: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_rd_177:
	mov	0x14, %r14
	.word 0xf8db8e80  ! 4330: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb3e5a1e3  ! 4332: SAVE_I	save	%r22, 0x0001, %r25
T0_asi_reg_wr_190:
	mov	0x2, %r14
	.word 0xf4f38e60  ! 4334: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T0_asi_reg_wr_191:
	mov	0x2a, %r14
	.word 0xf6f38e40  ! 4335: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_0_368:
	setx	0x420039, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_316:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_316), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbde4e111  ! 4338: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb9e50000  ! 4339: SAVE_R	save	%r20, %r0, %r28
iob_intr_0_317:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_317), 16, 16)) -> intp(0, 0, 8)
cpu_intr_0_369:
	setx	0x400239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e520b0  ! 4348: SAVE_I	save	%r20, 0x0001, %r26
cpu_intr_0_370:
	setx	0x410330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9194e10d  ! 4351: WRPR_PIL_I	wrpr	%r19, 0x010d, %pil
	.word 0xbf3cd000  ! 4352: SRAX_R	srax	%r19, %r0, %r31
	.word 0xb1e561b7  ! 4353: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbb2ce001  ! 4357: SLL_I	sll 	%r19, 0x0001, %r29
cpu_intr_0_371:
	setx	0x410205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a0da  ! 4361: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb5e58000  ! 4365: SAVE_R	save	%r22, %r0, %r26
	.word 0xbebdc000  ! 4366: XNORcc_R	xnorcc 	%r23, %r0, %r31
	.word 0xb5e4c000  ! 4367: SAVE_R	save	%r19, %r0, %r26
	.word 0xb5e54000  ! 4369: SAVE_R	save	%r21, %r0, %r26
	.word 0xbfe50000  ! 4370: SAVE_R	save	%r20, %r0, %r31
iob_intr_0_318:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_318), 16, 16)) -> intp(0, 0, 2a)
cpu_intr_0_372:
	setx	0x40000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a1d0  ! 4374: SAVE_I	save	%r18, 0x0001, %r25
T0_asi_reg_rd_178:
	mov	0x3c2, %r14
	.word 0xf4db84a0  ! 4375: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb0c44000  ! 4376: ADDCcc_R	addccc 	%r17, %r0, %r24
T0_asi_reg_rd_179:
	mov	0x3c8, %r14
	.word 0xfadb8e80  ! 4382: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T0_asi_reg_rd_180:
	mov	0x8, %r14
	.word 0xf8db8400  ! 4383: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T0_asi_reg_rd_181:
	mov	0x35, %r14
	.word 0xfedb84a0  ! 4384: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T0_asi_reg_wr_192:
	mov	0xe, %r14
	.word 0xfef38e40  ! 4385: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb3e50000  ! 4386: SAVE_R	save	%r20, %r0, %r25
	.word 0xbbe44000  ! 4387: SAVE_R	save	%r17, %r0, %r29
iob_intr_0_319:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_319), 16, 16)) -> intp(0, 0, 31)
	.word 0xb5e5e005  ! 4389: SAVE_I	save	%r23, 0x0001, %r26
cpu_intr_0_373:
	setx	0x42022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe46009  ! 4393: SAVE_I	save	%r17, 0x0001, %r29
T0_asi_reg_rd_182:
	mov	0x1a, %r14
	.word 0xfcdb8e40  ! 4395: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbbe5a15e  ! 4398: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3e40000  ! 4399: SAVE_R	save	%r16, %r0, %r25
	.word 0xbb643801  ! 4401: MOVcc_I	<illegal instruction>
	.word 0xb08d0000  ! 4402: ANDcc_R	andcc 	%r20, %r0, %r24
	.word 0xbfe4a191  ! 4405: SAVE_I	save	%r18, 0x0001, %r31
cpu_intr_0_374:
	setx	0x42032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe44000  ! 4411: SAVE_R	save	%r17, %r0, %r29
	.word 0xbe3da070  ! 4412: XNOR_I	xnor 	%r22, 0x0070, %r31
	.word 0xb435219a  ! 4415: ORN_I	orn 	%r20, 0x019a, %r26
T0_asi_reg_wr_193:
	mov	0x7, %r14
	.word 0xf6f38e40  ! 4418: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_wr_194:
	mov	0x3c5, %r14
	.word 0xfef389e0  ! 4423: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_0_320:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_320), 16, 16)) -> intp(0, 0, 32)
	.word 0xb9e5a1b7  ! 4427: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3e40000  ! 4431: SAVE_R	save	%r16, %r0, %r25
T0_asi_reg_rd_183:
	mov	0x34, %r14
	.word 0xf8db8e80  ! 4432: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_0_375:
	setx	0x430133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 4442: SAVE_R	save	%r20, %r0, %r29
	.word 0xb33db001  ! 4443: SRAX_I	srax	%r22, 0x0001, %r25
cpu_intr_0_376:
	setx	0x430021, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_321:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_321), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_322:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_322), 16, 16)) -> intp(0, 0, 13)
	.word 0xbd643801  ! 4447: MOVcc_I	<illegal instruction>
	.word 0xb1e46075  ! 4449: SAVE_I	save	%r17, 0x0001, %r24
iob_intr_0_323:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_323), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_wr_195:
	mov	0x18, %r14
	.word 0xf4f38e40  ! 4451: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb69c4000  ! 4452: XORcc_R	xorcc 	%r17, %r0, %r27
	.word 0xb9e54000  ! 4453: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_rd_184:
	mov	0x2c, %r14
	.word 0xfedb8e60  ! 4455: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_0_377:
	setx	0x410213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e560b1  ! 4467: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb48c212f  ! 4468: ANDcc_I	andcc 	%r16, 0x012f, %r26
iob_intr_0_324:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_324), 16, 16)) -> intp(0, 0, 27)
	.word 0xb1e44000  ! 4472: SAVE_R	save	%r17, %r0, %r24
T0_asi_reg_rd_185:
	mov	0xa, %r14
	.word 0xfcdb89e0  ! 4474: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb694c000  ! 4476: ORcc_R	orcc 	%r19, %r0, %r27
	.word 0xb5e5e016  ! 4478: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbbe4e08b  ! 4480: SAVE_I	save	%r19, 0x0001, %r29
iob_intr_0_325:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_325), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_378:
	setx	0x43033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_196:
	mov	0x3c7, %r14
	.word 0xf0f38e40  ! 4487: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_379:
	setx	0x400136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde58000  ! 4490: SAVE_R	save	%r22, %r0, %r30
T0_asi_reg_rd_186:
	mov	0x3c1, %r14
	.word 0xfedb8e40  ! 4491: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbde461ad  ! 4494: SAVE_I	save	%r17, 0x0001, %r30
iob_intr_0_326:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_326), 16, 16)) -> intp(0, 0, 19)
T0_asi_reg_rd_187:
	mov	0x25, %r14
	.word 0xf6db8e60  ! 4496: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T0_asi_reg_rd_188:
	mov	0x18, %r14
	.word 0xf0db8e40  ! 4497: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_380:
	setx	0x430109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 4499: SAVE_R	save	%r22, %r0, %r26
	.word 0xb7e4a13a  ! 4501: SAVE_I	save	%r18, 0x0001, %r27
cpu_intr_0_381:
	setx	0x40020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe46004  ! 4505: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xba444000  ! 4508: ADDC_R	addc 	%r17, %r0, %r29
iob_intr_0_327:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_327), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_382:
	setx	0x400224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e161  ! 4515: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbfe50000  ! 4516: SAVE_R	save	%r20, %r0, %r31
iob_intr_0_328:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_328), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbde5c000  ! 4520: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_383:
	setx	0x420225, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_384:
	setx	0x41003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4614d  ! 4526: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3e48000  ! 4529: SAVE_R	save	%r18, %r0, %r25
cpu_intr_0_385:
	setx	0x410024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_386:
	setx	0x420336, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_197:
	mov	0x3c5, %r14
	.word 0xf2f38e40  ! 4535: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb1641800  ! 4536: MOVcc_R	<illegal instruction>
	.word 0xb4bc0000  ! 4537: XNORcc_R	xnorcc 	%r16, %r0, %r26
	.word 0xb83c8000  ! 4541: XNOR_R	xnor 	%r18, %r0, %r28
	.word 0xbfe5210c  ! 4542: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_rd_189:
	mov	0x3c5, %r14
	.word 0xf0db8e80  ! 4546: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_0_387:
	setx	0x41021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e460fd  ! 4548: SAVE_I	save	%r17, 0x0001, %r24
cpu_intr_0_388:
	setx	0x40003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e421ed  ! 4550: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb40ca012  ! 4551: AND_I	and 	%r18, 0x0012, %r26
cpu_intr_0_389:
	setx	0x430111, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_190:
	mov	0x2a, %r14
	.word 0xf0db8e40  ! 4553: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_329:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_329), 16, 16)) -> intp(0, 0, 12)
T0_asi_reg_rd_191:
	mov	0x1e, %r14
	.word 0xf2db84a0  ! 4560: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb3e4c000  ! 4562: SAVE_R	save	%r19, %r0, %r25
	.word 0x8f902000  ! 4569: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xbde5203c  ! 4570: SAVE_I	save	%r20, 0x0001, %r30
cpu_intr_0_390:
	setx	0x430234, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_330:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_330), 16, 16)) -> intp(0, 0, 39)
	.word 0xbfe48000  ! 4573: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_rd_192:
	mov	0x3c2, %r14
	.word 0xf8db8e60  ! 4574: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_0_331:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_331), 16, 16)) -> intp(0, 0, 15)
cpu_intr_0_391:
	setx	0x420221, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_392:
	setx	0x40012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a098  ! 4579: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbebcc000  ! 4580: XNORcc_R	xnorcc 	%r19, %r0, %r31
	.word 0xb0a4a1fb  ! 4581: SUBcc_I	subcc 	%r18, 0x01fb, %r24
iob_intr_0_332:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_332), 16, 16)) -> intp(0, 0, 24)
	.word 0xb7e420dc  ! 4583: SAVE_I	save	%r16, 0x0001, %r27
iob_intr_0_333:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_333), 16, 16)) -> intp(0, 0, 19)
	.word 0x8394215a  ! 4590: WRPR_TNPC_I	wrpr	%r16, 0x015a, %tnpc
	.word 0xb3e40000  ! 4592: SAVE_R	save	%r16, %r0, %r25
iob_intr_0_334:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_334), 16, 16)) -> intp(0, 0, 34)
	.word 0xbfe52140  ! 4594: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb7e5e0f1  ! 4596: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbbe5c000  ! 4597: SAVE_R	save	%r23, %r0, %r29
iob_intr_0_335:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_335), 16, 16)) -> intp(0, 0, d)
	.word 0xbde48000  ! 4611: SAVE_R	save	%r18, %r0, %r30
	.word 0xbde5a0b4  ! 4616: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb1e48000  ! 4620: SAVE_R	save	%r18, %r0, %r24
cpu_intr_0_393:
	setx	0x440317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5610e  ! 4622: SAVE_I	save	%r21, 0x0001, %r29
cpu_intr_0_394:
	setx	0x45002b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_395:
	setx	0x470104, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_396:
	setx	0x44003f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_193:
	mov	0x3c0, %r14
	.word 0xfcdb8e40  ! 4630: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_wr_198:
	mov	0x5, %r14
	.word 0xfaf38400  ! 4631: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbfe4c000  ! 4634: SAVE_R	save	%r19, %r0, %r31
iob_intr_0_336:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_336), 16, 16)) -> intp(0, 0, 10)
cpu_intr_0_397:
	setx	0x470027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4a0d1  ! 4640: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb40ce16d  ! 4641: AND_I	and 	%r19, 0x016d, %r26
iob_intr_0_337:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_337), 16, 16)) -> intp(0, 0, 4)
	.word 0xbf3d7001  ! 4644: SRAX_I	srax	%r21, 0x0001, %r31
cpu_intr_0_398:
	setx	0x460219, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_338:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_338), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb13d7001  ! 4651: SRAX_I	srax	%r21, 0x0001, %r24
iob_intr_0_339:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_339), 16, 16)) -> intp(0, 0, 30)
	.word 0xbfe560b5  ! 4655: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb7e5c000  ! 4656: SAVE_R	save	%r23, %r0, %r27
	.word 0xbb2c6001  ! 4657: SLL_I	sll 	%r17, 0x0001, %r29
	.word 0xbfe5e07d  ! 4663: SAVE_I	save	%r23, 0x0001, %r31
T0_asi_reg_rd_194:
	mov	0x2c, %r14
	.word 0xf2db8e40  ! 4664: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_340:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_340), 16, 16)) -> intp(0, 0, a)
	.word 0xbe35c000  ! 4668: SUBC_R	orn 	%r23, %r0, %r31
	.word 0x87942108  ! 4670: WRPR_TT_I	wrpr	%r16, 0x0108, %tt
	.word 0xb92df001  ! 4671: SLLX_I	sllx	%r23, 0x0001, %r28
iob_intr_0_341:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_341), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_399:
	setx	0x440130, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_342:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_342), 16, 16)) -> intp(0, 0, 32)
	.word 0xb22dc000  ! 4677: ANDN_R	andn 	%r23, %r0, %r25
cpu_intr_0_400:
	setx	0x470311, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_343:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_343), 16, 16)) -> intp(0, 0, 35)
cpu_intr_0_401:
	setx	0x450128, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_344:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_344), 16, 16)) -> intp(0, 0, 11)
	.word 0xb1e460c6  ! 4682: SAVE_I	save	%r17, 0x0001, %r24
cpu_intr_0_402:
	setx	0x44022c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_199:
	mov	0x3c7, %r14
	.word 0xfcf38e80  ! 4687: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbde58000  ! 4688: SAVE_R	save	%r22, %r0, %r30
	.word 0xbf643801  ! 4690: MOVcc_I	<illegal instruction>
	.word 0xbde5c000  ! 4691: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_403:
	setx	0x460037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4340000  ! 4696: SUBC_R	orn 	%r16, %r0, %r26
T0_asi_reg_rd_195:
	mov	0xb, %r14
	.word 0xf8db8e40  ! 4698: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_0_345:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_345), 16, 16)) -> intp(0, 0, 17)
	.word 0xbbe42003  ! 4700: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_rd_196:
	mov	0x18, %r14
	.word 0xf6db84a0  ! 4703: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb9e521a9  ! 4704: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbb3cf001  ! 4707: SRAX_I	srax	%r19, 0x0001, %r29
	.word 0xbde461aa  ! 4711: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb68c0000  ! 4712: ANDcc_R	andcc 	%r16, %r0, %r27
	.word 0xb9e50000  ! 4717: SAVE_R	save	%r20, %r0, %r28
T0_asi_reg_rd_197:
	mov	0x3c4, %r14
	.word 0xfedb8e60  ! 4721: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb1e421e4  ! 4725: SAVE_I	save	%r16, 0x0001, %r24
iob_intr_0_346:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_346), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_wr_200:
	mov	0x6, %r14
	.word 0xf2f384a0  ! 4728: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T0_asi_reg_wr_201:
	mov	0x36, %r14
	.word 0xfaf389e0  ! 4729: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_0_347:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_347), 16, 16)) -> intp(0, 0, a)
cpu_intr_0_404:
	setx	0x47022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b5e1ce  ! 4732: SUBCcc_I	orncc 	%r23, 0x01ce, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe5c000  ! 4734: SAVE_R	save	%r23, %r0, %r29
T0_asi_reg_rd_198:
	mov	0x22, %r14
	.word 0xf4db8e40  ! 4737: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb3e4a12c  ! 4741: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb5e4c000  ! 4742: SAVE_R	save	%r19, %r0, %r26
cpu_intr_0_405:
	setx	0x470028, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_348:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_348), 16, 16)) -> intp(0, 0, 1b)
cpu_intr_0_406:
	setx	0x47002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e50000  ! 4752: SAVE_R	save	%r20, %r0, %r28
	.word 0xb9e5a0ec  ! 4753: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbfe4206e  ! 4755: SAVE_I	save	%r16, 0x0001, %r31
iob_intr_0_349:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_349), 16, 16)) -> intp(0, 0, 29)
	.word 0xbfe56164  ! 4759: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_rd_199:
	mov	0x2, %r14
	.word 0xf0db8e60  ! 4761: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb7e5601b  ! 4762: SAVE_I	save	%r21, 0x0001, %r27
cpu_intr_0_407:
	setx	0x460106, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_202:
	mov	0x3c7, %r14
	.word 0xf0f389e0  ! 4764: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_0_350:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_350), 16, 16)) -> intp(0, 0, 36)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_wr_203:
	mov	0x3c3, %r14
	.word 0xfcf38e40  ! 4772: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_408:
	setx	0x470337, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_351:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_351), 16, 16)) -> intp(0, 0, 23)
iob_intr_0_352:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_352), 16, 16)) -> intp(0, 0, 2e)
	.word 0xbfe4c000  ! 4780: SAVE_R	save	%r19, %r0, %r31
cpu_intr_0_409:
	setx	0x46021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e42134  ! 4782: SAVE_I	save	%r16, 0x0001, %r26
cpu_intr_0_410:
	setx	0x460308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba944000  ! 4785: ORcc_R	orcc 	%r17, %r0, %r29
iob_intr_0_353:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_353), 16, 16)) -> intp(0, 0, 18)
	.word 0xb9e4609a  ! 4788: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_354:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_354), 16, 16)) -> intp(0, 0, 31)
T0_asi_reg_wr_204:
	mov	0x10, %r14
	.word 0xfaf38e40  ! 4792: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_rd_200:
	mov	0x37, %r14
	.word 0xfcdb84a0  ! 4793: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_0_411:
	setx	0x440017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe85a165  ! 4796: ADDcc_I	addcc 	%r22, 0x0165, %r31
	.word 0xba2d4000  ! 4799: ANDN_R	andn 	%r21, %r0, %r29
	.word 0xb9e50000  ! 4802: SAVE_R	save	%r20, %r0, %r28
	.word 0xb1e4a177  ! 4806: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1e4212a  ! 4807: SAVE_I	save	%r16, 0x0001, %r24
cpu_intr_0_412:
	setx	0x460139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5c000  ! 4811: SAVE_R	save	%r23, %r0, %r25
iob_intr_0_355:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_355), 16, 16)) -> intp(0, 0, 34)
	.word 0xb3e56121  ! 4816: SAVE_I	save	%r21, 0x0001, %r25
T0_asi_reg_rd_201:
	mov	0x3c1, %r14
	.word 0xf6db89e0  ! 4817: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T0_asi_reg_rd_202:
	mov	0x3, %r14
	.word 0xfcdb8e40  ! 4819: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_rd_203:
	mov	0x11, %r14
	.word 0xf0db89e0  ! 4821: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T0_asi_reg_rd_204:
	mov	0x21, %r14
	.word 0xf0db8e40  ! 4824: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbbe50000  ! 4825: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_wr_205:
	mov	0x3c0, %r14
	.word 0xfcf384a0  ! 4827: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_0_356:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_356), 16, 16)) -> intp(0, 0, 23)
cpu_intr_0_413:
	setx	0x46020c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_357:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_357), 16, 16)) -> intp(0, 0, 9)
iob_intr_0_358:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_358), 16, 16)) -> intp(0, 0, 16)
	.word 0xb424c000  ! 4836: SUB_R	sub 	%r19, %r0, %r26
	.word 0xbfe5a04a  ! 4838: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbb7d0400  ! 4839: MOVR_R	movre	%r20, %r0, %r29
cpu_intr_0_414:
	setx	0x46020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5c000  ! 4842: SAVE_R	save	%r23, %r0, %r25
cpu_intr_0_415:
	setx	0x460131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5c000  ! 4848: SAVE_R	save	%r23, %r0, %r29
	.word 0xb2b54000  ! 4849: ORNcc_R	orncc 	%r21, %r0, %r25
T0_asi_reg_rd_205:
	mov	0x3c8, %r14
	.word 0xf6db8e40  ! 4851: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbbe58000  ! 4853: SAVE_R	save	%r22, %r0, %r29
	.word 0xbeb44000  ! 4855: SUBCcc_R	orncc 	%r17, %r0, %r31
	.word 0xb1e4a179  ! 4857: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbde56175  ! 4859: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e5c000  ! 4861: SAVE_R	save	%r23, %r0, %r27
cpu_intr_0_416:
	setx	0x46023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 4865: SAVE_R	save	%r23, %r0, %r27
	.word 0xb83d6078  ! 4868: XNOR_I	xnor 	%r21, 0x0078, %r28
	.word 0xb5e4c000  ! 4869: SAVE_R	save	%r19, %r0, %r26
	.word 0xbfe4e1ad  ! 4875: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbfe54000  ! 4876: SAVE_R	save	%r21, %r0, %r31
	.word 0xb1e460ef  ! 4877: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1e44000  ! 4878: SAVE_R	save	%r17, %r0, %r24
	.word 0xb7e40000  ! 4879: SAVE_R	save	%r16, %r0, %r27
T0_asi_reg_rd_206:
	mov	0x3c6, %r14
	.word 0xfadb8e60  ! 4880: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb57c8400  ! 4881: MOVR_R	movre	%r18, %r0, %r26
	.word 0x899520d4  ! 4883: WRPR_TICK_I	wrpr	%r20, 0x00d4, %tick
iob_intr_0_359:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_359), 16, 16)) -> intp(0, 0, 1d)
iob_intr_0_360:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_360), 16, 16)) -> intp(0, 0, 33)
iob_intr_0_361:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_361), 16, 16)) -> intp(0, 0, c)
	.word 0xb2ac0000  ! 4891: ANDNcc_R	andncc 	%r16, %r0, %r25
iob_intr_0_362:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_362), 16, 16)) -> intp(0, 0, 1c)
iob_intr_0_363:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_363), 16, 16)) -> intp(0, 0, 8)
	.word 0xbde561b7  ! 4897: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e5e1eb  ! 4898: SAVE_I	save	%r23, 0x0001, %r27
cpu_intr_0_417:
	setx	0x440016, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_207:
	mov	0x3c6, %r14
	.word 0xf0db8e40  ! 4901: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_rd_208:
	mov	0x3, %r14
	.word 0xf0db89e0  ! 4903: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_0_364:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_364), 16, 16)) -> intp(0, 0, 23)
	.word 0xbbe420cd  ! 4910: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_rd_209:
	mov	0x8, %r14
	.word 0xf8db8400  ! 4911: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_0_365:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_365), 16, 16)) -> intp(0, 0, 39)
	.word 0xb950c000  ! 4915: RDPR_TT	<illegal instruction>
T0_asi_reg_wr_206:
	mov	0x12, %r14
	.word 0xf6f38e40  ! 4917: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb8848000  ! 4918: ADDcc_R	addcc 	%r18, %r0, %r28
	.word 0xbfe5a157  ! 4919: SAVE_I	save	%r22, 0x0001, %r31
	.word 0x8395e1a2  ! 4922: WRPR_TNPC_I	wrpr	%r23, 0x01a2, %tnpc
cpu_intr_0_418:
	setx	0x470035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_419:
	setx	0x460000, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_366:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_366), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_420:
	setx	0x450204, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_210:
	mov	0x1d, %r14
	.word 0xf6db8400  ! 4931: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb5e54000  ! 4934: SAVE_R	save	%r21, %r0, %r26
	.word 0xbfe4c000  ! 4939: SAVE_R	save	%r19, %r0, %r31
	.word 0xb9e4e19e  ! 4942: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb8a5a191  ! 4945: SUBcc_I	subcc 	%r22, 0x0191, %r28
iob_intr_0_367:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_367), 16, 16)) -> intp(0, 0, 37)
iob_intr_0_368:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_368), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_369:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_369), 16, 16)) -> intp(0, 0, 2)
iob_intr_0_370:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_370), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_371:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_371), 16, 16)) -> intp(0, 0, 2c)
cpu_intr_0_421:
	setx	0x470014, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_372:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_372), 16, 16)) -> intp(0, 0, 22)
	.word 0xbe3c4000  ! 4964: XNOR_R	xnor 	%r17, %r0, %r31
cpu_intr_0_422:
	setx	0x450320, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_373:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_373), 16, 16)) -> intp(0, 0, 7)
iob_intr_0_374:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_374), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_423:
	setx	0x460024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e54000  ! 4969: SAVE_R	save	%r21, %r0, %r28
	.word 0xbb2c4000  ! 4971: SLL_R	sll 	%r17, %r0, %r29
	.word 0xbde54000  ! 4972: SAVE_R	save	%r21, %r0, %r30
T0_asi_reg_wr_207:
	mov	0x27, %r14
	.word 0xf4f38e60  ! 4973: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_0_375:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_375), 16, 16)) -> intp(0, 0, 28)
cpu_intr_0_424:
	setx	0x440112, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e58000  ! 4983: SAVE_R	save	%r22, %r0, %r24
	.word 0xbf3cb001  ! 4984: SRAX_I	srax	%r18, 0x0001, %r31
cpu_intr_0_425:
	setx	0x470105, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_208:
	mov	0x1e, %r14
	.word 0xf8f384a0  ! 4987: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb7e5c000  ! 4989: SAVE_R	save	%r23, %r0, %r27
	.word 0xb9e5a012  ! 4992: SAVE_I	save	%r22, 0x0001, %r28
iob_intr_0_376:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_376), 16, 16)) -> intp(0, 0, 8)
	.word 0xb7e4e00a  ! 4994: SAVE_I	save	%r19, 0x0001, %r27
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
	mov	0x11, %r14
	.word 0xfef38e40  ! 2: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_wr_1:
	mov	0x1d, %r14
	.word 0xf4f38e40  ! 3: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf0346121  ! 5: STH_I	sth	%r24, [%r17 + 0x0121]
cpu_intr_3_0:
	setx	0x1c0221, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_1:
	setx	0x1d003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4758000  ! 8: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xfa352161  ! 11: STH_I	sth	%r29, [%r20 + 0x0161]
	.word 0xf2758000  ! 20: STX_R	stx	%r25, [%r22 + %r0]
	.word 0xfcf4a01b  ! 21: STXA_I	stxa	%r30, [%r18 + 0x001b] %asi
cpu_intr_3_2:
	setx	0x1c0339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0250000  ! 27: STW_R	stw	%r24, [%r20 + %r0]
cpu_intr_3_3:
	setx	0x1f003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb48020  ! 29: STHA_R	stha	%r30, [%r18 + %r0] 0x01
	.word 0xfcf46176  ! 30: STXA_I	stxa	%r30, [%r17 + 0x0176] %asi
	.word 0xb9643801  ! 31: MOVcc_I	<illegal instruction>
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_2:
	mov	0x4, %r14
	.word 0xf2f38e60  ! 36: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T3_asi_reg_wr_3:
	mov	0x3c0, %r14
	.word 0xf4f38e40  ! 37: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf6b42038  ! 40: STHA_I	stha	%r27, [%r16 + 0x0038] %asi
	.word 0xf8744000  ! 41: STX_R	stx	%r28, [%r17 + %r0]
	.word 0xb0b40000  ! 42: SUBCcc_R	orncc 	%r16, %r0, %r24
	.word 0xf22c8000  ! 45: STB_R	stb	%r25, [%r18 + %r0]
iob_intr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_0), 16, 16)) -> intp(3, 0, 3c)
	.word 0xbd3ca001  ! 50: SRA_I	sra 	%r18, 0x0001, %r30
iob_intr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_1), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_2), 16, 16)) -> intp(3, 0, 38)
	.word 0xfaa44020  ! 55: STWA_R	stwa	%r29, [%r17 + %r0] 0x01
iob_intr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_3), 16, 16)) -> intp(3, 0, 29)
cpu_intr_3_4:
	setx	0x1d0323, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_0:
	mov	0x2c, %r14
	.word 0xfedb8e80  ! 60: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb215c000  ! 63: OR_R	or 	%r23, %r0, %r25
	.word 0xf4ad8020  ! 64: STBA_R	stba	%r26, [%r22 + %r0] 0x01
	.word 0xf8256062  ! 65: STW_I	stw	%r28, [%r21 + 0x0062]
cpu_intr_3_5:
	setx	0x1f0217, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xbec4e0d3  ! 69: ADDCcc_I	addccc 	%r19, 0x00d3, %r31
	.word 0xf02d8000  ! 71: STB_R	stb	%r24, [%r22 + %r0]
T3_asi_reg_wr_4:
	mov	0x2f, %r14
	.word 0xf2f389e0  ! 72: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb73d0000  ! 76: SRA_R	sra 	%r20, %r0, %r27
cpu_intr_3_6:
	setx	0x1c0215, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_7:
	setx	0x1c0312, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_1:
	mov	0x2f, %r14
	.word 0xf2db8e40  ! 81: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xf6344000  ! 93: STH_R	sth	%r27, [%r17 + %r0]
	.word 0xf0ac4020  ! 94: STBA_R	stba	%r24, [%r17 + %r0] 0x01
cpu_intr_3_8:
	setx	0x1e0317, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xba242103  ! 99: SUB_I	sub 	%r16, 0x0103, %r29
cpu_intr_3_9:
	setx	0x1e000a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_2:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 103: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_wr_5:
	mov	0x11, %r14
	.word 0xf2f38e40  ! 105: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_rd_3:
	mov	0x3c1, %r14
	.word 0xf2db8e40  ! 106: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_HPRIV
	.word 0xb20dc000  ! 116: AND_R	and 	%r23, %r0, %r25
	.word 0xf4b4c020  ! 121: STHA_R	stha	%r26, [%r19 + %r0] 0x01
iob_intr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_4), 16, 16)) -> intp(3, 0, 2)
	.word 0xbcc5e193  ! 128: ADDCcc_I	addccc 	%r23, 0x0193, %r30
iob_intr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_5), 16, 16)) -> intp(3, 0, 35)
	.word 0xbb643801  ! 133: MOVcc_I	<illegal instruction>
	.word 0xfe2461ad  ! 135: STW_I	stw	%r31, [%r17 + 0x01ad]
cpu_intr_3_10:
	setx	0x1c0101, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_6), 16, 16)) -> intp(3, 0, 32)
cpu_intr_3_11:
	setx	0x1f023e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_7), 16, 16)) -> intp(3, 0, 8)
	.word 0xf8a50020  ! 148: STWA_R	stwa	%r28, [%r20 + %r0] 0x01
T3_asi_reg_wr_6:
	mov	0x3c6, %r14
	.word 0xfcf38400  ! 151: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_8), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf62ca07a  ! 154: STB_I	stb	%r27, [%r18 + 0x007a]
	.word 0xf4f5a153  ! 155: STXA_I	stxa	%r26, [%r22 + 0x0153] %asi
	.word 0xf0f5612f  ! 158: STXA_I	stxa	%r24, [%r21 + 0x012f] %asi
	ta	T_CHANGE_HPRIV
	.word 0xf0240000  ! 162: STW_R	stw	%r24, [%r16 + %r0]
iob_intr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_9), 16, 16)) -> intp(3, 0, 14)
	.word 0xf42d8000  ! 164: STB_R	stb	%r26, [%r22 + %r0]
cpu_intr_3_12:
	setx	0x1d0315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf47560b2  ! 169: STX_I	stx	%r26, [%r21 + 0x00b2]
cpu_intr_3_13:
	setx	0x1c0326, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_7:
	mov	0x2d, %r14
	.word 0xf6f38e80  ! 171: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf8a5e0e6  ! 173: STWA_I	stwa	%r28, [%r23 + 0x00e6] %asi
	.word 0xfea4a0bf  ! 175: STWA_I	stwa	%r31, [%r18 + 0x00bf] %asi
iob_intr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_10), 16, 16)) -> intp(3, 0, 1c)
	.word 0xfaa420f6  ! 178: STWA_I	stwa	%r29, [%r16 + 0x00f6] %asi
iob_intr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_11), 16, 16)) -> intp(3, 0, 1e)
cpu_intr_3_14:
	setx	0x1f0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4252172  ! 184: STW_I	stw	%r26, [%r20 + 0x0172]
	ta	T_CHANGE_NONHPRIV
iob_intr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_12), 16, 16)) -> intp(3, 0, 31)
	.word 0xfc35e056  ! 191: STH_I	sth	%r30, [%r23 + 0x0056]
	.word 0xfcade1fe  ! 192: STBA_I	stba	%r30, [%r23 + 0x01fe] %asi
	.word 0xb13c6001  ! 193: SRA_I	sra 	%r17, 0x0001, %r24
iob_intr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_13), 16, 16)) -> intp(3, 0, 1e)
	.word 0xb7344000  ! 197: SRL_R	srl 	%r17, %r0, %r27
	.word 0xf2a42114  ! 198: STWA_I	stwa	%r25, [%r16 + 0x0114] %asi
cpu_intr_3_15:
	setx	0x1d0207, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_14), 16, 16)) -> intp(3, 0, 7)
iob_intr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_15), 16, 16)) -> intp(3, 0, 25)
iob_intr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_16), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf6b421be  ! 207: STHA_I	stha	%r27, [%r16 + 0x01be] %asi
iob_intr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_17), 16, 16)) -> intp(3, 0, 1a)
	.word 0xb485e03c  ! 209: ADDcc_I	addcc 	%r23, 0x003c, %r26
iob_intr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_18), 16, 16)) -> intp(3, 0, 2)
	.word 0xf2b40020  ! 214: STHA_R	stha	%r25, [%r16 + %r0] 0x01
	.word 0xfe2d8000  ! 219: STB_R	stb	%r31, [%r22 + %r0]
T3_asi_reg_rd_4:
	mov	0x3c6, %r14
	.word 0xfcdb89e0  ! 220: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_3_16:
	setx	0x1d0004, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_5:
	mov	0x2c, %r14
	.word 0xfcdb8e40  ! 225: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf6348000  ! 227: STH_R	sth	%r27, [%r18 + %r0]
iob_intr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_19), 16, 16)) -> intp(3, 0, 26)
iob_intr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_20), 16, 16)) -> intp(3, 0, 21)
	.word 0xf2aca169  ! 234: STBA_I	stba	%r25, [%r18 + 0x0169] %asi
	.word 0xf834a140  ! 239: STH_I	sth	%r28, [%r18 + 0x0140]
T3_asi_reg_rd_6:
	mov	0x10, %r14
	.word 0xf8db8e40  ! 241: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb00c4000  ! 245: AND_R	and 	%r17, %r0, %r24
T3_asi_reg_wr_8:
	mov	0x3c1, %r14
	.word 0xf8f38e40  ! 248: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T3_asi_reg_wr_9:
	mov	0x3c4, %r14
	.word 0xf6f38e80  ! 250: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_21), 16, 16)) -> intp(3, 0, c)
T3_asi_reg_wr_10:
	mov	0x10, %r14
	.word 0xfaf384a0  ! 252: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	ta	T_CHANGE_TO_TL1
	setx	data_start_4, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983bd0  ! 254: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd0, %hpstate
iob_intr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_22), 16, 16)) -> intp(3, 0, 12)
	.word 0xfc2da1a2  ! 256: STB_I	stb	%r30, [%r22 + 0x01a2]
	.word 0xbebc4000  ! 258: XNORcc_R	xnorcc 	%r17, %r0, %r31
cpu_intr_3_17:
	setx	0x1e021f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_18:
	setx	0x1d0229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfead4020  ! 270: STBA_R	stba	%r31, [%r21 + %r0] 0x01
	.word 0xfc25a0b6  ! 272: STW_I	stw	%r30, [%r22 + 0x00b6]
cpu_intr_3_19:
	setx	0x1f002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe24a0af  ! 274: STW_I	stw	%r31, [%r18 + 0x00af]
T3_asi_reg_wr_11:
	mov	0xe, %r14
	.word 0xf6f38e40  ! 275: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfca421c3  ! 277: STWA_I	stwa	%r30, [%r16 + 0x01c3] %asi
iob_intr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_23), 16, 16)) -> intp(3, 0, 10)
	.word 0xf6a42170  ! 281: STWA_I	stwa	%r27, [%r16 + 0x0170] %asi
	.word 0xf8f5609d  ! 282: STXA_I	stxa	%r28, [%r21 + 0x009d] %asi
	.word 0xfa24c000  ! 285: STW_R	stw	%r29, [%r19 + %r0]
	.word 0xf8758000  ! 287: STX_R	stx	%r28, [%r22 + %r0]
	ta	T_CHANGE_TO_TL1
	.word 0xf6a5a0ce  ! 293: STWA_I	stwa	%r27, [%r22 + 0x00ce] %asi
iob_intr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_24), 16, 16)) -> intp(3, 0, 6)
	.word 0xb845c000  ! 295: ADDC_R	addc 	%r23, %r0, %r28
	.word 0xfeb50020  ! 297: STHA_R	stha	%r31, [%r20 + %r0] 0x01
T3_asi_reg_wr_12:
	mov	0x2f, %r14
	.word 0xfef38e60  ! 299: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfeb40020  ! 301: STHA_R	stha	%r31, [%r16 + %r0] 0x01
	.word 0xf2a461e0  ! 303: STWA_I	stwa	%r25, [%r17 + 0x01e0] %asi
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_20:
	setx	0x1d0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa35e1bf  ! 313: STH_I	sth	%r29, [%r23 + 0x01bf]
	.word 0xb53d6001  ! 315: SRA_I	sra 	%r21, 0x0001, %r26
cpu_intr_3_21:
	setx	0x1d0007, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_7:
	mov	0x18, %r14
	.word 0xf0db8e40  ! 318: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbb7d2401  ! 319: MOVR_I	movre	%r20, 0x1, %r29
	.word 0xf8f4e0d4  ! 320: STXA_I	stxa	%r28, [%r19 + 0x00d4] %asi
	.word 0xb2950000  ! 321: ORcc_R	orcc 	%r20, %r0, %r25
iob_intr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_25), 16, 16)) -> intp(3, 0, 25)
	.word 0xf4b44020  ! 323: STHA_R	stha	%r26, [%r17 + %r0] 0x01
	.word 0xfeb5e0e8  ! 325: STHA_I	stha	%r31, [%r23 + 0x00e8] %asi
	.word 0xb93cb001  ! 327: SRAX_I	srax	%r18, 0x0001, %r28
	.word 0xf8a4e145  ! 330: STWA_I	stwa	%r28, [%r19 + 0x0145] %asi
	.word 0x919561d4  ! 331: WRPR_PIL_I	wrpr	%r21, 0x01d4, %pil
	.word 0xfa2ca0d8  ! 332: STB_I	stb	%r29, [%r18 + 0x00d8]
	.word 0xf2358000  ! 335: STH_R	sth	%r25, [%r22 + %r0]
	.word 0xf4ad6018  ! 338: STBA_I	stba	%r26, [%r21 + 0x0018] %asi
T3_asi_reg_wr_13:
	mov	0x25, %r14
	.word 0xfef38e80  ! 339: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb2154000  ! 340: OR_R	or 	%r21, %r0, %r25
cpu_intr_3_22:
	setx	0x1d0137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1351000  ! 344: SRLX_R	srlx	%r20, %r0, %r24
	.word 0xf8ac0020  ! 349: STBA_R	stba	%r28, [%r16 + %r0] 0x01
	.word 0xb0b5c000  ! 350: ORNcc_R	orncc 	%r23, %r0, %r24
cpu_intr_3_23:
	setx	0x1d023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe25611d  ! 352: STW_I	stw	%r31, [%r21 + 0x011d]
cpu_intr_3_24:
	setx	0x1f0016, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_26), 16, 16)) -> intp(3, 0, 36)
	.word 0xf6b5200f  ! 358: STHA_I	stha	%r27, [%r20 + 0x000f] %asi
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_TO_TL1
	.word 0xfa2d4000  ! 361: STB_R	stb	%r29, [%r21 + %r0]
	.word 0xf22d0000  ! 366: STB_R	stb	%r25, [%r20 + %r0]
iob_intr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_27), 16, 16)) -> intp(3, 0, 18)
iob_intr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_28), 16, 16)) -> intp(3, 0, f)
	.word 0xbc954000  ! 371: ORcc_R	orcc 	%r21, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfe2d4000  ! 373: STB_R	stb	%r31, [%r21 + %r0]
	.word 0xfaac0020  ! 376: STBA_R	stba	%r29, [%r16 + %r0] 0x01
cpu_intr_3_25:
	setx	0x1c020b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_14:
	mov	0x1a, %r14
	.word 0xf4f38400  ! 379: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T3_asi_reg_wr_15:
	mov	0x5, %r14
	.word 0xfaf389e0  ! 385: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbcc5c000  ! 386: ADDCcc_R	addccc 	%r23, %r0, %r30
cpu_intr_3_26:
	setx	0x1f0237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab52158  ! 389: STHA_I	stha	%r29, [%r20 + 0x0158] %asi
cpu_intr_3_27:
	setx	0x1e0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_16:
	mov	0x3c1, %r14
	.word 0xfaf38e80  ! 395: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_3_28:
	setx	0x1d001d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_29), 16, 16)) -> intp(3, 0, 11)
	.word 0xf8ad0020  ! 403: STBA_R	stba	%r28, [%r20 + %r0] 0x01
cpu_intr_3_29:
	setx	0x1d0211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaf42137  ! 406: STXA_I	stxa	%r29, [%r16 + 0x0137] %asi
	.word 0xfc748000  ! 410: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xf02ce0da  ! 418: STB_I	stb	%r24, [%r19 + 0x00da]
T3_asi_reg_rd_8:
	mov	0x3c8, %r14
	.word 0xfadb8400  ! 421: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T3_asi_reg_wr_17:
	mov	0x3c2, %r14
	.word 0xf6f38400  ! 422: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983cc0  ! 423: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc0, %hpstate
	.word 0xb085a155  ! 424: ADDcc_I	addcc 	%r22, 0x0155, %r24
cpu_intr_3_30:
	setx	0x1c0210, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_30), 16, 16)) -> intp(3, 0, 2f)
	ta	T_CHANGE_TO_TL0
cpu_intr_3_31:
	setx	0x1d0011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfead219c  ! 432: STBA_I	stba	%r31, [%r20 + 0x019c] %asi
iob_intr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_31), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf82c4000  ! 441: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xfc756132  ! 442: STX_I	stx	%r30, [%r21 + 0x0132]
T3_asi_reg_wr_18:
	mov	0x31, %r14
	.word 0xfef38e40  ! 446: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf674e073  ! 447: STX_I	stx	%r27, [%r19 + 0x0073]
cpu_intr_3_32:
	setx	0x1f030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf2a58020  ! 450: STWA_R	stwa	%r25, [%r22 + %r0] 0x01
	.word 0xfcf4e05c  ! 453: STXA_I	stxa	%r30, [%r19 + 0x005c] %asi
T3_asi_reg_wr_19:
	mov	0x10, %r14
	.word 0xfef38e60  ! 456: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T3_asi_reg_rd_9:
	mov	0x24, %r14
	.word 0xf0db8e60  ! 457: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_3_33:
	setx	0x1c030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_20:
	mov	0x9, %r14
	.word 0xfaf38e60  ! 460: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf6ac4020  ! 461: STBA_R	stba	%r27, [%r17 + %r0] 0x01
iob_intr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_32), 16, 16)) -> intp(3, 0, f)
	.word 0xf62de020  ! 463: STB_I	stb	%r27, [%r23 + 0x0020]
	.word 0xfc35c000  ! 464: STH_R	sth	%r30, [%r23 + %r0]
iob_intr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_33), 16, 16)) -> intp(3, 0, 3d)
cpu_intr_3_34:
	setx	0x1e0311, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_34), 16, 16)) -> intp(3, 0, 2a)
iob_intr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_35), 16, 16)) -> intp(3, 0, 38)
cpu_intr_3_35:
	setx	0x23013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaad6117  ! 478: STBA_I	stba	%r29, [%r21 + 0x0117] %asi
	.word 0xf62ca1a4  ! 479: STB_I	stb	%r27, [%r18 + 0x01a4]
T3_asi_reg_rd_10:
	mov	0x2b, %r14
	.word 0xf2db8e60  ! 482: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xfc758000  ! 483: STX_R	stx	%r30, [%r22 + %r0]
	.word 0xf2ad6122  ! 486: STBA_I	stba	%r25, [%r21 + 0x0122] %asi
iob_intr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_36), 16, 16)) -> intp(3, 0, 3c)
iob_intr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_37), 16, 16)) -> intp(3, 0, 1c)
iob_intr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_38), 16, 16)) -> intp(3, 0, 38)
cpu_intr_3_36:
	setx	0x220320, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_37:
	setx	0x220203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc34a0e7  ! 504: STH_I	sth	%r30, [%r18 + 0x00e7]
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983e5a  ! 506: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e5a, %hpstate
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
iob_intr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_39), 16, 16)) -> intp(3, 0, 21)
iob_intr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_40), 16, 16)) -> intp(3, 0, 1f)
	.word 0xfe254000  ! 521: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xf424c000  ! 522: STW_R	stw	%r26, [%r19 + %r0]
cpu_intr_3_38:
	setx	0x22033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a52071  ! 524: STWA_I	stwa	%r27, [%r20 + 0x0071] %asi
T3_asi_reg_rd_11:
	mov	0x3, %r14
	.word 0xf6db8e40  ! 525: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_wr_21:
	mov	0x32, %r14
	.word 0xf4f38e40  ! 526: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_3_39:
	setx	0x23011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8d6084  ! 530: ANDcc_I	andcc 	%r21, 0x0084, %r30
	.word 0xb4ad8000  ! 531: ANDNcc_R	andncc 	%r22, %r0, %r26
	.word 0xb12da001  ! 532: SLL_I	sll 	%r22, 0x0001, %r24
T3_asi_reg_rd_12:
	mov	0x3c2, %r14
	.word 0xfadb8400  ! 534: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_3_40:
	setx	0x230329, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_22:
	mov	0x3c2, %r14
	.word 0xf2f38e40  ! 541: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_wr_23:
	mov	0x1a, %r14
	.word 0xf0f38400  ! 542: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xfca561b6  ! 544: STWA_I	stwa	%r30, [%r21 + 0x01b6] %asi
iob_intr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_41), 16, 16)) -> intp(3, 0, 0)
	.word 0xb1641800  ! 546: MOVcc_R	<illegal instruction>
cpu_intr_3_41:
	setx	0x230016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf434c000  ! 553: STH_R	sth	%r26, [%r19 + %r0]
	.word 0xf875e16d  ! 554: STX_I	stx	%r28, [%r23 + 0x016d]
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983c18  ! 557: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c18, %hpstate
cpu_intr_3_42:
	setx	0x21002e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_24:
	mov	0x1a, %r14
	.word 0xfef38e80  ! 563: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf024e00a  ! 566: STW_I	stw	%r24, [%r19 + 0x000a]
	.word 0xf8a5c020  ! 567: STWA_R	stwa	%r28, [%r23 + %r0] 0x01
iob_intr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_42), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf4ad21c3  ! 570: STBA_I	stba	%r26, [%r20 + 0x01c3] %asi
	.word 0xfe258000  ! 571: STW_R	stw	%r31, [%r22 + %r0]
	.word 0xfead60ae  ! 572: STBA_I	stba	%r31, [%r21 + 0x00ae] %asi
	.word 0xf4748000  ! 574: STX_R	stx	%r26, [%r18 + %r0]
	.word 0xf2248000  ! 579: STW_R	stw	%r25, [%r18 + %r0]
	.word 0xf47421e9  ! 580: STX_I	stx	%r26, [%r16 + 0x01e9]
	.word 0xfcaca05a  ! 581: STBA_I	stba	%r30, [%r18 + 0x005a] %asi
	.word 0xf2a4e0b6  ! 584: STWA_I	stwa	%r25, [%r19 + 0x00b6] %asi
iob_intr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_43), 16, 16)) -> intp(3, 0, 1)
	.word 0xfe7420f8  ! 588: STX_I	stx	%r31, [%r16 + 0x00f8]
	.word 0xf274c000  ! 593: STX_R	stx	%r25, [%r19 + %r0]
	.word 0xf8256090  ! 594: STW_I	stw	%r28, [%r21 + 0x0090]
cpu_intr_3_43:
	setx	0x210139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b50020  ! 597: STHA_R	stha	%r24, [%r20 + %r0] 0x01
T3_asi_reg_rd_13:
	mov	0x3c1, %r14
	.word 0xf0db8e80  ! 599: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_3_44:
	setx	0x230130, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_45:
	setx	0x200217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53d9000  ! 603: SRAX_R	srax	%r22, %r0, %r26
iob_intr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_44), 16, 16)) -> intp(3, 0, 31)
cpu_intr_3_46:
	setx	0x23021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982f9a  ! 613: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f9a, %hpstate
	.word 0xfe24e096  ! 614: STW_I	stw	%r31, [%r19 + 0x0096]
	.word 0xfc34c000  ! 615: STH_R	sth	%r30, [%r19 + %r0]
iob_intr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_45), 16, 16)) -> intp(3, 0, 22)
	.word 0xf475c000  ! 618: STX_R	stx	%r26, [%r23 + %r0]
iob_intr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_46), 16, 16)) -> intp(3, 0, 24)
cpu_intr_3_47:
	setx	0x220326, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_25:
	mov	0x3c7, %r14
	.word 0xf4f38400  ! 624: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_47), 16, 16)) -> intp(3, 0, 37)
	.word 0xb9346001  ! 629: SRL_I	srl 	%r17, 0x0001, %r28
T3_asi_reg_rd_14:
	mov	0x31, %r14
	.word 0xf4db8400  ! 630: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_3_48:
	setx	0x230234, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_26:
	mov	0x2a, %r14
	.word 0xf8f38e40  ! 632: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL0
	.word 0xf834e05a  ! 636: STH_I	sth	%r28, [%r19 + 0x005a]
	.word 0xf874e0b3  ! 637: STX_I	stx	%r28, [%r19 + 0x00b3]
	.word 0xf2248000  ! 641: STW_R	stw	%r25, [%r18 + %r0]
cpu_intr_3_49:
	setx	0x20033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb82de0f1  ! 647: ANDN_I	andn 	%r23, 0x00f1, %r28
	ta	T_CHANGE_TO_TL0
cpu_intr_3_50:
	setx	0x210006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf675613b  ! 656: STX_I	stx	%r27, [%r21 + 0x013b]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf0f56056  ! 663: STXA_I	stxa	%r24, [%r21 + 0x0056] %asi
	.word 0xf62c4000  ! 666: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xf4254000  ! 667: STW_R	stw	%r26, [%r21 + %r0]
	.word 0xf02ca01e  ! 671: STB_I	stb	%r24, [%r18 + 0x001e]
T3_asi_reg_wr_27:
	mov	0x3c0, %r14
	.word 0xf6f38400  ! 672: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_48), 16, 16)) -> intp(3, 0, 33)
	.word 0xf8ac20fc  ! 674: STBA_I	stba	%r28, [%r16 + 0x00fc] %asi
iob_intr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_49), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_rd_15:
	mov	0x25, %r14
	.word 0xfedb8e60  ! 676: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_3_51:
	setx	0x230205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f5217e  ! 680: STXA_I	stxa	%r25, [%r20 + 0x017e] %asi
	.word 0xf0adc020  ! 681: STBA_R	stba	%r24, [%r23 + %r0] 0x01
	.word 0xf4754000  ! 683: STX_R	stx	%r26, [%r21 + %r0]
	.word 0xfcb5217e  ! 684: STHA_I	stha	%r30, [%r20 + 0x017e] %asi
T3_asi_reg_wr_28:
	mov	0x6, %r14
	.word 0xf8f38400  ! 690: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb08de035  ! 695: ANDcc_I	andcc 	%r23, 0x0035, %r24
	.word 0xf0f5e0b0  ! 697: STXA_I	stxa	%r24, [%r23 + 0x00b0] %asi
cpu_intr_3_52:
	setx	0x220037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a48020  ! 705: STWA_R	stwa	%r24, [%r18 + %r0] 0x01
	.word 0xf2348000  ! 708: STH_R	sth	%r25, [%r18 + %r0]
T3_asi_reg_rd_16:
	mov	0x10, %r14
	.word 0xf0db84a0  ! 711: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983d80  ! 712: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d80, %hpstate
iob_intr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_50), 16, 16)) -> intp(3, 0, 2b)
iob_intr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_51), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_52), 16, 16)) -> intp(3, 0, d)
	.word 0xf6a421c1  ! 720: STWA_I	stwa	%r27, [%r16 + 0x01c1] %asi
T3_asi_reg_wr_29:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 721: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xba8da0dd  ! 722: ANDcc_I	andcc 	%r22, 0x00dd, %r29
	.word 0xbc0460df  ! 723: ADD_I	add 	%r17, 0x00df, %r30
	.word 0xf4b4c020  ! 729: STHA_R	stha	%r26, [%r19 + %r0] 0x01
	.word 0xf8a50020  ! 731: STWA_R	stwa	%r28, [%r20 + %r0] 0x01
cpu_intr_3_53:
	setx	0x230231, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_54:
	setx	0x210131, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_53), 16, 16)) -> intp(3, 0, 19)
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982e40  ! 737: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e40, %hpstate
cpu_intr_3_55:
	setx	0x200201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8450000  ! 741: ADDC_R	addc 	%r20, %r0, %r28
iob_intr_3_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_54), 16, 16)) -> intp(3, 0, 26)
iob_intr_3_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_55), 16, 16)) -> intp(3, 0, 8)
	.word 0xbb504000  ! 744: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xfcaca05e  ! 746: STBA_I	stba	%r30, [%r18 + 0x005e] %asi
	.word 0xb8b58000  ! 747: ORNcc_R	orncc 	%r22, %r0, %r28
	.word 0xfc2d0000  ! 748: STB_R	stb	%r30, [%r20 + %r0]
cpu_intr_3_56:
	setx	0x230326, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_57:
	setx	0x23022b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_17:
	mov	0x3c2, %r14
	.word 0xf4db8e40  ! 752: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbcc4a0fa  ! 755: ADDCcc_I	addccc 	%r18, 0x00fa, %r30
cpu_intr_3_58:
	setx	0x23002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ace002  ! 760: STBA_I	stba	%r24, [%r19 + 0x0002] %asi
	.word 0xfa25201c  ! 762: STW_I	stw	%r29, [%r20 + 0x001c]
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_30:
	mov	0x18, %r14
	.word 0xfef38e40  ! 765: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_wr_31:
	mov	0x19, %r14
	.word 0xf2f38e40  ! 767: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfa2ce1b8  ! 768: STB_I	stb	%r29, [%r19 + 0x01b8]
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_59:
	setx	0x220107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc25c000  ! 775: STW_R	stw	%r30, [%r23 + %r0]
T3_asi_reg_wr_32:
	mov	0xa, %r14
	.word 0xfcf38e40  ! 777: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_60:
	setx	0x21002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8348000  ! 781: STH_R	sth	%r28, [%r18 + %r0]
T3_asi_reg_rd_18:
	mov	0x3c8, %r14
	.word 0xfadb84a0  ! 782: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb23de17e  ! 784: XNOR_I	xnor 	%r23, 0x017e, %r25
	.word 0xfef5218b  ! 786: STXA_I	stxa	%r31, [%r20 + 0x018b] %asi
	.word 0xb4bca1e0  ! 787: XNORcc_I	xnorcc 	%r18, 0x01e0, %r26
cpu_intr_3_61:
	setx	0x200325, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_62:
	setx	0x220314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a5e0bf  ! 794: STWA_I	stwa	%r28, [%r23 + 0x00bf] %asi
cpu_intr_3_63:
	setx	0x230106, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_33:
	mov	0x2f, %r14
	.word 0xf2f389e0  ! 798: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0x8f902001  ! 801: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xfa75e168  ! 803: STX_I	stx	%r29, [%r23 + 0x0168]
	.word 0xf6f4a03e  ! 805: STXA_I	stxa	%r27, [%r18 + 0x003e] %asi
	.word 0xbb7d6401  ! 806: MOVR_I	movre	%r21, 0x1, %r29
	.word 0xf0b40020  ! 807: STHA_R	stha	%r24, [%r16 + %r0] 0x01
	.word 0xf02cc000  ! 810: STB_R	stb	%r24, [%r19 + %r0]
	.word 0xf0b4c020  ! 812: STHA_R	stha	%r24, [%r19 + %r0] 0x01
cpu_intr_3_64:
	setx	0x230325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x919461d6  ! 814: WRPR_PIL_I	wrpr	%r17, 0x01d6, %pil
	.word 0xf6a4e02d  ! 815: STWA_I	stwa	%r27, [%r19 + 0x002d] %asi
iob_intr_3_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_56), 16, 16)) -> intp(3, 0, 3)
	.word 0xf22dc000  ! 817: STB_R	stb	%r25, [%r23 + %r0]
cpu_intr_3_65:
	setx	0x21002b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_66:
	setx	0x20023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3643801  ! 820: MOVcc_I	<illegal instruction>
	.word 0xfab4e0bd  ! 821: STHA_I	stha	%r29, [%r19 + 0x00bd] %asi
iob_intr_3_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_57), 16, 16)) -> intp(3, 0, 39)
	.word 0xfaa4e084  ! 825: STWA_I	stwa	%r29, [%r19 + 0x0084] %asi
cpu_intr_3_67:
	setx	0x1031b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_34:
	mov	0x3, %r14
	.word 0xfcf38e40  ! 827: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_68:
	setx	0x220319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b4e137  ! 829: STHA_I	stha	%r28, [%r19 + 0x0137] %asi
	.word 0xf8b4a119  ! 832: STHA_I	stha	%r28, [%r18 + 0x0119] %asi
	.word 0xf4b4c020  ! 833: STHA_R	stha	%r26, [%r19 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf224a1ca  ! 839: STW_I	stw	%r25, [%r18 + 0x01ca]
T3_asi_reg_rd_19:
	mov	0x20, %r14
	.word 0xf6db8e40  ! 840: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_3_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_58), 16, 16)) -> intp(3, 0, 0)
iob_intr_3_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_59), 16, 16)) -> intp(3, 0, 34)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_60), 16, 16)) -> intp(3, 0, 3c)
	.word 0xb0840000  ! 845: ADDcc_R	addcc 	%r16, %r0, %r24
cpu_intr_3_69:
	setx	0x220314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb33cd000  ! 852: SRAX_R	srax	%r19, %r0, %r25
T3_asi_reg_rd_20:
	mov	0x6, %r14
	.word 0xf0db8e40  ! 853: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb00ce161  ! 856: AND_I	and 	%r19, 0x0161, %r24
iob_intr_3_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_61), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_wr_35:
	mov	0x18, %r14
	.word 0xfcf389e0  ! 859: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf4740000  ! 861: STX_R	stx	%r26, [%r16 + %r0]
iob_intr_3_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_62), 16, 16)) -> intp(3, 0, 1f)
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_36:
	mov	0x1c, %r14
	.word 0xf2f38e60  ! 868: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_3_70:
	setx	0x200319, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_71:
	setx	0x220002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf43420e7  ! 872: STH_I	sth	%r26, [%r16 + 0x00e7]
	.word 0xf22c21bc  ! 874: STB_I	stb	%r25, [%r16 + 0x01bc]
iob_intr_3_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_63), 16, 16)) -> intp(3, 0, 2a)
cpu_intr_3_72:
	setx	0x22033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xbd2d8000  ! 882: SLL_R	sll 	%r22, %r0, %r30
T3_asi_reg_wr_37:
	mov	0x24, %r14
	.word 0xf6f384a0  ! 883: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T3_asi_reg_rd_21:
	mov	0x3c2, %r14
	.word 0xf6db84a0  ! 884: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xfef4a012  ! 887: STXA_I	stxa	%r31, [%r18 + 0x0012] %asi
	.word 0xf8344000  ! 888: STH_R	sth	%r28, [%r17 + %r0]
	.word 0xf82c8000  ! 891: STB_R	stb	%r28, [%r18 + %r0]
	ta	T_CHANGE_NONHPRIV
	.word 0xf2354000  ! 894: STH_R	sth	%r25, [%r21 + %r0]
cpu_intr_3_73:
	setx	0x220321, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_64), 16, 16)) -> intp(3, 0, 28)
cpu_intr_3_74:
	setx	0x220035, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982f02  ! 899: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f02, %hpstate
T3_asi_reg_wr_38:
	mov	0x3c0, %r14
	.word 0xf4f389e0  ! 900: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb77c4400  ! 901: MOVR_R	movre	%r17, %r0, %r27
	.word 0xf2b44020  ! 902: STHA_R	stha	%r25, [%r17 + %r0] 0x01
iob_intr_3_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_65), 16, 16)) -> intp(3, 0, 39)
T3_asi_reg_wr_39:
	mov	0x30, %r14
	.word 0xf2f38e40  ! 904: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_wr_40:
	mov	0x3c5, %r14
	.word 0xfaf38e40  ! 907: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf8ad616b  ! 909: STBA_I	stba	%r28, [%r21 + 0x016b] %asi
	.word 0xb6b521b2  ! 911: SUBCcc_I	orncc 	%r20, 0x01b2, %r27
	.word 0xfca4e063  ! 912: STWA_I	stwa	%r30, [%r19 + 0x0063] %asi
	.word 0xf07421ba  ! 914: STX_I	stx	%r24, [%r16 + 0x01ba]
	.word 0xfc248000  ! 915: STW_R	stw	%r30, [%r18 + %r0]
iob_intr_3_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_66), 16, 16)) -> intp(3, 0, 9)
T3_asi_reg_wr_41:
	mov	0x17, %r14
	.word 0xf6f38e80  ! 917: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_3_75:
	setx	0x200300, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_76:
	setx	0x20032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82cc000  ! 921: STB_R	stb	%r28, [%r19 + %r0]
T3_asi_reg_wr_42:
	mov	0x3c0, %r14
	.word 0xfaf384a0  ! 923: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T3_asi_reg_rd_22:
	mov	0x3c4, %r14
	.word 0xf0db8e60  ! 925: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb044c000  ! 928: ADDC_R	addc 	%r19, %r0, %r24
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982f50  ! 930: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f50, %hpstate
	.word 0xfca461b2  ! 932: STWA_I	stwa	%r30, [%r17 + 0x01b2] %asi
T3_asi_reg_wr_43:
	mov	0x37, %r14
	.word 0xf0f38400  ! 933: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982e48  ! 934: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e48, %hpstate
	.word 0xfe2dc000  ! 937: STB_R	stb	%r31, [%r23 + %r0]
iob_intr_3_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_67), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_rd_23:
	mov	0x3c2, %r14
	.word 0xf4db8e60  ! 943: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xbc954000  ! 944: ORcc_R	orcc 	%r21, %r0, %r30
	.word 0xf4f420df  ! 945: STXA_I	stxa	%r26, [%r16 + 0x00df] %asi
T3_asi_reg_rd_24:
	mov	0x1d, %r14
	.word 0xf8db8e60  ! 946: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T3_asi_reg_wr_44:
	mov	0xd, %r14
	.word 0xf6f389e0  ! 947: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_3_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_68), 16, 16)) -> intp(3, 0, e)
	.word 0xfcb5e15c  ! 952: STHA_I	stha	%r30, [%r23 + 0x015c] %asi
	.word 0xfc74c000  ! 953: STX_R	stx	%r30, [%r19 + %r0]
iob_intr_3_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_69), 16, 16)) -> intp(3, 0, 31)
T3_asi_reg_wr_45:
	mov	0x14, %r14
	.word 0xfcf38400  ! 955: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_3_77:
	setx	0x250335, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_70), 16, 16)) -> intp(3, 0, 35)
T3_asi_reg_rd_25:
	mov	0x1f, %r14
	.word 0xfcdb8e40  ! 962: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_71), 16, 16)) -> intp(3, 0, 9)
	.word 0xf834208a  ! 968: STH_I	sth	%r28, [%r16 + 0x008a]
	.word 0xf674e185  ! 972: STX_I	stx	%r27, [%r19 + 0x0185]
T3_asi_reg_rd_26:
	mov	0x12, %r14
	.word 0xfedb84a0  ! 976: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xfab4e05a  ! 977: STHA_I	stha	%r29, [%r19 + 0x005a] %asi
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983852  ! 983: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1852, %hpstate
	.word 0xf8b48020  ! 984: STHA_R	stha	%r28, [%r18 + %r0] 0x01
	.word 0xf2a44020  ! 986: STWA_R	stwa	%r25, [%r17 + %r0] 0x01
	.word 0xfaf56060  ! 987: STXA_I	stxa	%r29, [%r21 + 0x0060] %asi
iob_intr_3_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_72), 16, 16)) -> intp(3, 0, 25)
	.word 0xfa25e189  ! 992: STW_I	stw	%r29, [%r23 + 0x0189]
	.word 0xfcb42159  ! 993: STHA_I	stha	%r30, [%r16 + 0x0159] %asi
T3_asi_reg_rd_27:
	mov	0x3c0, %r14
	.word 0xfedb8e40  ! 995: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_rd_28:
	mov	0x36, %r14
	.word 0xf2db8e40  ! 996: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_3_78:
	setx	0x240314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf7c6401  ! 998: MOVR_I	movre	%r17, 0x1, %r31
	ta	T_CHANGE_TO_TL0
iob_intr_3_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_73), 16, 16)) -> intp(3, 0, 11)
iob_intr_3_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_74), 16, 16)) -> intp(3, 0, 28)
	ta	T_CHANGE_TO_TL0
	.word 0xfab42131  ! 1006: STHA_I	stha	%r29, [%r16 + 0x0131] %asi
iob_intr_3_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_75), 16, 16)) -> intp(3, 0, 32)
cpu_intr_3_79:
	setx	0x24013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2140000  ! 1011: OR_R	or 	%r16, %r0, %r25
T3_asi_reg_rd_29:
	mov	0x3c6, %r14
	.word 0xfedb8e80  ! 1012: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf4b4a157  ! 1014: STHA_I	stha	%r26, [%r18 + 0x0157] %asi
T3_asi_reg_wr_46:
	mov	0x1, %r14
	.word 0xfcf384a0  ! 1016: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_3_80:
	setx	0x270001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe34a12c  ! 1020: STH_I	sth	%r31, [%r18 + 0x012c]
	.word 0xf42de1f7  ! 1021: STB_I	stb	%r26, [%r23 + 0x01f7]
iob_intr_3_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_76), 16, 16)) -> intp(3, 0, 1a)
cpu_intr_3_81:
	setx	0x250236, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf42de154  ! 1029: STB_I	stb	%r26, [%r23 + 0x0154]
	.word 0xfaac8020  ! 1036: STBA_R	stba	%r29, [%r18 + %r0] 0x01
iob_intr_3_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_77), 16, 16)) -> intp(3, 0, 28)
iob_intr_3_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_78), 16, 16)) -> intp(3, 0, 1)
cpu_intr_3_82:
	setx	0x24022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xfef46103  ! 1042: STXA_I	stxa	%r31, [%r17 + 0x0103] %asi
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbd2cf001  ! 1045: SLLX_I	sllx	%r19, 0x0001, %r30
	.word 0xfeb44020  ! 1047: STHA_R	stha	%r31, [%r17 + %r0] 0x01
cpu_intr_3_83:
	setx	0x27030a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_79), 16, 16)) -> intp(3, 0, 2c)
iob_intr_3_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_80), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_rd_30:
	mov	0x38, %r14
	.word 0xfcdb8e40  ! 1059: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_rd_31:
	mov	0x3c3, %r14
	.word 0xf8db84a0  ! 1060: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_3_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_81), 16, 16)) -> intp(3, 0, 3b)
T3_asi_reg_wr_47:
	mov	0x3c1, %r14
	.word 0xf8f38e80  ! 1063: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T3_asi_reg_wr_48:
	mov	0x0, %r14
	.word 0xf0f38e60  ! 1064: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983f12  ! 1066: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f12, %hpstate
iob_intr_3_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_82), 16, 16)) -> intp(3, 0, 2e)
	.word 0xbe952186  ! 1069: ORcc_I	orcc 	%r20, 0x0186, %r31
	.word 0xf2a40020  ! 1073: STWA_R	stwa	%r25, [%r16 + %r0] 0x01
iob_intr_3_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_83), 16, 16)) -> intp(3, 0, 24)
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982b1a  ! 1076: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1a, %hpstate
iob_intr_3_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_84), 16, 16)) -> intp(3, 0, 3a)
	.word 0xbabd0000  ! 1079: XNORcc_R	xnorcc 	%r20, %r0, %r29
	.word 0xf4358000  ! 1080: STH_R	sth	%r26, [%r22 + %r0]
cpu_intr_3_84:
	setx	0x240235, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_49:
	mov	0x3c5, %r14
	.word 0xf2f389e0  ! 1085: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb435e0ae  ! 1086: ORN_I	orn 	%r23, 0x00ae, %r26
iob_intr_3_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_85), 16, 16)) -> intp(3, 0, 25)
	.word 0xf0ad0020  ! 1094: STBA_R	stba	%r24, [%r20 + %r0] 0x01
	.word 0xf6250000  ! 1096: STW_R	stw	%r27, [%r20 + %r0]
	.word 0xf8256103  ! 1097: STW_I	stw	%r28, [%r21 + 0x0103]
T3_asi_reg_wr_50:
	mov	0x26, %r14
	.word 0xfef389e0  ! 1098: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb89d0000  ! 1101: XORcc_R	xorcc 	%r20, %r0, %r28
	ta	T_CHANGE_TO_TL0
	.word 0xfe356045  ! 1106: STH_I	sth	%r31, [%r21 + 0x0045]
	.word 0xf8b58020  ! 1108: STHA_R	stha	%r28, [%r22 + %r0] 0x01
cpu_intr_3_85:
	setx	0x25011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb5c020  ! 1110: STHA_R	stha	%r31, [%r23 + %r0] 0x01
	.word 0xf82561c2  ! 1112: STW_I	stw	%r28, [%r21 + 0x01c2]
cpu_intr_3_86:
	setx	0x27032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b5a191  ! 1115: STHA_I	stha	%r27, [%r22 + 0x0191] %asi
T3_asi_reg_rd_32:
	mov	0x27, %r14
	.word 0xfadb8400  ! 1116: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_3_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_86), 16, 16)) -> intp(3, 0, 36)
cpu_intr_3_87:
	setx	0x260134, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_87), 16, 16)) -> intp(3, 0, 2)
iob_intr_3_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_88), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_rd_33:
	mov	0x34, %r14
	.word 0xf8db89e0  ! 1131: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xfc250000  ! 1138: STW_R	stw	%r30, [%r20 + %r0]
cpu_intr_3_88:
	setx	0x32d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa348000  ! 1144: STH_R	sth	%r29, [%r18 + %r0]
T3_asi_reg_rd_34:
	mov	0x14, %r14
	.word 0xf2db89e0  ! 1145: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_3_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_89), 16, 16)) -> intp(3, 0, 25)
iob_intr_3_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_90), 16, 16)) -> intp(3, 0, 3b)
T3_asi_reg_wr_51:
	mov	0x2e, %r14
	.word 0xf4f38e80  ! 1152: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982f80  ! 1160: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f80, %hpstate
iob_intr_3_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_91), 16, 16)) -> intp(3, 0, 13)
	.word 0xf025c000  ! 1163: STW_R	stw	%r24, [%r23 + %r0]
	.word 0xfca54020  ! 1164: STWA_R	stwa	%r30, [%r21 + %r0] 0x01
	.word 0xf634c000  ! 1165: STH_R	sth	%r27, [%r19 + %r0]
	.word 0xf4342048  ! 1174: STH_I	sth	%r26, [%r16 + 0x0048]
	.word 0xfc75a1c9  ! 1175: STX_I	stx	%r30, [%r22 + 0x01c9]
	.word 0xfe746122  ! 1176: STX_I	stx	%r31, [%r17 + 0x0122]
cpu_intr_3_89:
	setx	0x260028, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_92), 16, 16)) -> intp(3, 0, 3a)
iob_intr_3_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_93), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_90:
	setx	0x270313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea58020  ! 1190: STWA_R	stwa	%r31, [%r22 + %r0] 0x01
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_35:
	mov	0x3c8, %r14
	.word 0xfadb8e40  ! 1194: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_wr_52:
	mov	0x3c6, %r14
	.word 0xf2f38e80  ! 1197: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T3_asi_reg_rd_36:
	mov	0x33, %r14
	.word 0xf6db8e40  ! 1200: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_wr_53:
	mov	0x2b, %r14
	.word 0xf2f38e80  ! 1201: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf02cc000  ! 1202: STB_R	stb	%r24, [%r19 + %r0]
iob_intr_3_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_94), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf624e088  ! 1204: STW_I	stw	%r27, [%r19 + 0x0088]
	.word 0xfaac0020  ! 1205: STBA_R	stba	%r29, [%r16 + %r0] 0x01
T3_asi_reg_wr_54:
	mov	0x3c5, %r14
	.word 0xf8f38e60  ! 1206: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T3_asi_reg_rd_37:
	mov	0x3c2, %r14
	.word 0xf2db8e80  ! 1207: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb6b5e0cd  ! 1209: SUBCcc_I	orncc 	%r23, 0x00cd, %r27
T3_asi_reg_wr_55:
	mov	0x3c0, %r14
	.word 0xfaf38e80  ! 1210: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf82da1ff  ! 1211: STB_I	stb	%r28, [%r22 + 0x01ff]
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfe2d2194  ! 1220: STB_I	stb	%r31, [%r20 + 0x0194]
cpu_intr_3_91:
	setx	0x26021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22d21a9  ! 1225: STB_I	stb	%r25, [%r20 + 0x01a9]
cpu_intr_3_92:
	setx	0x250015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcc54000  ! 1228: ADDCcc_R	addccc 	%r21, %r0, %r30
	.word 0xfaf4603e  ! 1229: STXA_I	stxa	%r29, [%r17 + 0x003e] %asi
iob_intr_3_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_95), 16, 16)) -> intp(3, 0, 28)
cpu_intr_3_93:
	setx	0x26021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb01c0000  ! 1239: XOR_R	xor 	%r16, %r0, %r24
	.word 0xfe2da1b3  ! 1241: STB_I	stb	%r31, [%r22 + 0x01b3]
	.word 0xfa74a10e  ! 1242: STX_I	stx	%r29, [%r18 + 0x010e]
T3_asi_reg_wr_56:
	mov	0x14, %r14
	.word 0xf8f38e40  ! 1243: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982e40  ! 1244: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e40, %hpstate
cpu_intr_3_94:
	setx	0x270125, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_96), 16, 16)) -> intp(3, 0, 3)
cpu_intr_3_95:
	setx	0x27021e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_57:
	mov	0x2c, %r14
	.word 0xfcf38e40  ! 1257: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	ta	T_CHANGE_NONHPRIV
iob_intr_3_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_97), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf82521ff  ! 1268: STW_I	stw	%r28, [%r20 + 0x01ff]
	.word 0xf2740000  ! 1271: STX_R	stx	%r25, [%r16 + %r0]
	.word 0xf82da10e  ! 1273: STB_I	stb	%r28, [%r22 + 0x010e]
	.word 0xf6a42193  ! 1274: STWA_I	stwa	%r27, [%r16 + 0x0193] %asi
cpu_intr_3_96:
	setx	0x250039, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_98), 16, 16)) -> intp(3, 0, 23)
	.word 0xfe350000  ! 1281: STH_R	sth	%r31, [%r20 + %r0]
cpu_intr_3_97:
	setx	0x27033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x87942139  ! 1285: WRPR_TT_I	wrpr	%r16, 0x0139, %tt
	.word 0xf0348000  ! 1286: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xfaa46074  ! 1288: STWA_I	stwa	%r29, [%r17 + 0x0074] %asi
T3_asi_reg_wr_58:
	mov	0x12, %r14
	.word 0xf2f38e60  ! 1290: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_3_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_99), 16, 16)) -> intp(3, 0, e)
iob_intr_3_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_100), 16, 16)) -> intp(3, 0, e)
	.word 0xfe2c0000  ! 1293: STB_R	stb	%r31, [%r16 + %r0]
cpu_intr_3_98:
	setx	0x260015, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_38:
	mov	0x35, %r14
	.word 0xf2db89e0  ! 1302: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xf0ac0020  ! 1305: STBA_R	stba	%r24, [%r16 + %r0] 0x01
	.word 0xf4a48020  ! 1307: STWA_R	stwa	%r26, [%r18 + %r0] 0x01
iob_intr_3_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_101), 16, 16)) -> intp(3, 0, 28)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_99:
	setx	0x250125, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_102), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_wr_59:
	mov	0x22, %r14
	.word 0xf2f384a0  ! 1322: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xfab4c020  ! 1324: STHA_R	stha	%r29, [%r19 + %r0] 0x01
	.word 0xfc24e09d  ! 1325: STW_I	stw	%r30, [%r19 + 0x009d]
	.word 0xf8a58020  ! 1329: STWA_R	stwa	%r28, [%r22 + %r0] 0x01
iob_intr_3_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_103), 16, 16)) -> intp(3, 0, 13)
cpu_intr_3_100:
	setx	0x240122, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_39:
	mov	0x2f, %r14
	.word 0xf2db8400  ! 1333: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_3_101:
	setx	0x260106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b56172  ! 1335: STHA_I	stha	%r26, [%r21 + 0x0172] %asi
cpu_intr_3_102:
	setx	0x27011c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_40:
	mov	0x6, %r14
	.word 0xfedb89e0  ! 1340: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf6748000  ! 1342: STX_R	stx	%r27, [%r18 + %r0]
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983b0a  ! 1344: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b0a, %hpstate
iob_intr_3_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_104), 16, 16)) -> intp(3, 0, 2a)
T3_asi_reg_wr_60:
	mov	0x17, %r14
	.word 0xf0f38e60  ! 1350: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T3_asi_reg_rd_41:
	mov	0x36, %r14
	.word 0xfedb8e60  ! 1351: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xfcb40020  ! 1355: STHA_R	stha	%r30, [%r16 + %r0] 0x01
	.word 0xb6b54000  ! 1357: SUBCcc_R	orncc 	%r21, %r0, %r27
iob_intr_3_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_105), 16, 16)) -> intp(3, 0, 1)
cpu_intr_3_103:
	setx	0x240130, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_106), 16, 16)) -> intp(3, 0, 2d)
T3_asi_reg_rd_42:
	mov	0x35, %r14
	.word 0xf8db8e40  ! 1366: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_104:
	setx	0x260317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca5c020  ! 1368: STWA_R	stwa	%r30, [%r23 + %r0] 0x01
	.word 0xf62c210d  ! 1369: STB_I	stb	%r27, [%r16 + 0x010d]
	.word 0xf424c000  ! 1371: STW_R	stw	%r26, [%r19 + %r0]
T3_asi_reg_wr_61:
	mov	0x2b, %r14
	.word 0xf6f38e80  ! 1372: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xfcb5a19b  ! 1373: STHA_I	stha	%r30, [%r22 + 0x019b] %asi
	.word 0xf4b48020  ! 1376: STHA_R	stha	%r26, [%r18 + %r0] 0x01
T3_asi_reg_rd_43:
	mov	0x2a, %r14
	.word 0xf2db8e40  ! 1377: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_3_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_107), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_wr_62:
	mov	0x3c0, %r14
	.word 0xfaf38400  ! 1385: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T3_asi_reg_rd_44:
	mov	0x2a, %r14
	.word 0xf0db8e60  ! 1386: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xfeb50020  ! 1388: STHA_R	stha	%r31, [%r20 + %r0] 0x01
iob_intr_3_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_108), 16, 16)) -> intp(3, 0, 34)
T3_asi_reg_rd_45:
	mov	0x3c6, %r14
	.word 0xf0db8e40  ! 1397: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_3_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_109), 16, 16)) -> intp(3, 0, 25)
T3_asi_reg_rd_46:
	mov	0x36, %r14
	.word 0xf8db8e40  ! 1401: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfea44020  ! 1402: STWA_R	stwa	%r31, [%r17 + %r0] 0x01
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983bc2  ! 1405: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc2, %hpstate
iob_intr_3_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_110), 16, 16)) -> intp(3, 0, 28)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_105:
	setx	0x2b0116, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_106:
	setx	0x2a032a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_47:
	mov	0x0, %r14
	.word 0xfedb8400  ! 1413: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_3_107:
	setx	0x280216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba844000  ! 1423: ADDcc_R	addcc 	%r17, %r0, %r29
	ta	T_CHANGE_TO_TL0
	.word 0xf224a08a  ! 1426: STW_I	stw	%r25, [%r18 + 0x008a]
cpu_intr_3_108:
	setx	0x290226, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_111), 16, 16)) -> intp(3, 0, 4)
	.word 0xf634a1ce  ! 1429: STH_I	sth	%r27, [%r18 + 0x01ce]
T3_asi_reg_rd_48:
	mov	0x29, %r14
	.word 0xf4db89e0  ! 1431: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf4746029  ! 1439: STX_I	stx	%r26, [%r17 + 0x0029]
	.word 0xfa344000  ! 1442: STH_R	sth	%r29, [%r17 + %r0]
	ta	T_CHANGE_TO_TL1
	.word 0xf875e0b4  ! 1445: STX_I	stx	%r28, [%r23 + 0x00b4]
	.word 0xfa2c8000  ! 1448: STB_R	stb	%r29, [%r18 + %r0]
	.word 0xfea54020  ! 1451: STWA_R	stwa	%r31, [%r21 + %r0] 0x01
cpu_intr_3_109:
	setx	0x29023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983f50  ! 1454: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f50, %hpstate
iob_intr_3_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_112), 16, 16)) -> intp(3, 0, 24)
iob_intr_3_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_113), 16, 16)) -> intp(3, 0, 3)
	.word 0xfe758000  ! 1458: STX_R	stx	%r31, [%r22 + %r0]
T3_asi_reg_wr_63:
	mov	0x29, %r14
	.word 0xf2f38e60  ! 1459: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T3_asi_reg_wr_64:
	mov	0x20, %r14
	.word 0xf2f384a0  ! 1461: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T3_asi_reg_rd_49:
	mov	0x3c7, %r14
	.word 0xfadb8e40  ! 1463: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_3_110:
	setx	0x280027, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_111:
	setx	0x2a0216, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_112:
	setx	0x290229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_113:
	setx	0x2b0319, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_114:
	setx	0x2a0210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb40561a4  ! 1475: ADD_I	add 	%r21, 0x01a4, %r26
	.word 0xf4adc020  ! 1478: STBA_R	stba	%r26, [%r23 + %r0] 0x01
	.word 0xf8b4c020  ! 1479: STHA_R	stha	%r28, [%r19 + %r0] 0x01
iob_intr_3_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_114), 16, 16)) -> intp(3, 0, 3c)
cpu_intr_3_115:
	setx	0x2a032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc34c000  ! 1482: STH_R	sth	%r30, [%r19 + %r0]
	.word 0xb80ce02c  ! 1485: AND_I	and 	%r19, 0x002c, %r28
	.word 0xf434c000  ! 1487: STH_R	sth	%r26, [%r19 + %r0]
	.word 0xf8f560d6  ! 1490: STXA_I	stxa	%r28, [%r21 + 0x00d6] %asi
	.word 0xf62c8000  ! 1494: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xf6b50020  ! 1495: STHA_R	stha	%r27, [%r20 + %r0] 0x01
	.word 0xf4ad0020  ! 1496: STBA_R	stba	%r26, [%r20 + %r0] 0x01
	.word 0xf6b5a1ee  ! 1497: STHA_I	stha	%r27, [%r22 + 0x01ee] %asi
cpu_intr_3_116:
	setx	0x2b0039, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_115), 16, 16)) -> intp(3, 0, 25)
T3_asi_reg_wr_65:
	mov	0x18, %r14
	.word 0xfef389e0  ! 1509: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T3_asi_reg_wr_66:
	mov	0xf, %r14
	.word 0xfcf38e40  ! 1511: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_116), 16, 16)) -> intp(3, 0, 3)
	.word 0xf8a4a0cf  ! 1513: STWA_I	stwa	%r28, [%r18 + 0x00cf] %asi
	.word 0xfe746157  ! 1515: STX_I	stx	%r31, [%r17 + 0x0157]
cpu_intr_3_117:
	setx	0x280333, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_118:
	setx	0x290129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4f5e0c1  ! 1521: STXA_I	stxa	%r26, [%r23 + 0x00c1] %asi
T3_asi_reg_rd_50:
	mov	0x12, %r14
	.word 0xfedb8e40  ! 1524: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_119:
	setx	0x2b0311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a5215e  ! 1530: STWA_I	stwa	%r26, [%r20 + 0x015e] %asi
	.word 0xf2240000  ! 1532: STW_R	stw	%r25, [%r16 + %r0]
T3_asi_reg_rd_51:
	mov	0x12, %r14
	.word 0xfadb89e0  ! 1535: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_3_120:
	setx	0x290101, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_67:
	mov	0x3c7, %r14
	.word 0xf2f38e60  ! 1537: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf0258000  ! 1541: STW_R	stw	%r24, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_52:
	mov	0x3c3, %r14
	.word 0xf4db8400  ! 1549: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xfc2d8000  ! 1551: STB_R	stb	%r30, [%r22 + %r0]
cpu_intr_3_121:
	setx	0x28012e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_122:
	setx	0x280138, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_117), 16, 16)) -> intp(3, 0, 26)
	.word 0xfe2d6077  ! 1562: STB_I	stb	%r31, [%r21 + 0x0077]
	.word 0xbb643801  ! 1563: MOVcc_I	<illegal instruction>
iob_intr_3_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_118), 16, 16)) -> intp(3, 0, 5)
	.word 0xf62c61c4  ! 1566: STB_I	stb	%r27, [%r17 + 0x01c4]
T3_asi_reg_wr_68:
	mov	0x28, %r14
	.word 0xfcf38e40  ! 1567: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_119), 16, 16)) -> intp(3, 0, 4)
T3_asi_reg_rd_53:
	mov	0x3c7, %r14
	.word 0xf0db8400  ! 1569: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_3_123:
	setx	0x290233, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_54:
	mov	0x3c0, %r14
	.word 0xf0db89e0  ! 1571: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T3_asi_reg_wr_69:
	mov	0x2d, %r14
	.word 0xf6f389e0  ! 1572: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_3_124:
	setx	0x2b0231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2d8000  ! 1574: STB_R	stb	%r31, [%r22 + %r0]
	.word 0xf0748000  ! 1577: STX_R	stx	%r24, [%r18 + %r0]
iob_intr_3_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_120), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_125:
	setx	0x280130, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_55:
	mov	0x21, %r14
	.word 0xfcdb89e0  ! 1585: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	ta	T_CHANGE_NONHPRIV
iob_intr_3_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_121), 16, 16)) -> intp(3, 0, 3c)
T3_asi_reg_wr_70:
	mov	0x1e, %r14
	.word 0xf4f38e60  ! 1595: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T3_asi_reg_rd_56:
	mov	0x3c0, %r14
	.word 0xfadb89e0  ! 1596: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2b58020  ! 1598: STHA_R	stha	%r25, [%r22 + %r0] 0x01
cpu_intr_3_126:
	setx	0x2a023e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_122), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_123), 16, 16)) -> intp(3, 0, 14)
	.word 0xf4240000  ! 1613: STW_R	stw	%r26, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_124), 16, 16)) -> intp(3, 0, 10)
	.word 0xf6adc020  ! 1620: STBA_R	stba	%r27, [%r23 + %r0] 0x01
	.word 0xf474e00c  ! 1625: STX_I	stx	%r26, [%r19 + 0x000c]
T3_asi_reg_wr_71:
	mov	0x38, %r14
	.word 0xf8f389e0  ! 1626: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_3_127:
	setx	0x2b0322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82da00d  ! 1630: STB_I	stb	%r28, [%r22 + 0x000d]
	.word 0xf2ac0020  ! 1634: STBA_R	stba	%r25, [%r16 + %r0] 0x01
T3_asi_reg_rd_57:
	mov	0x3c8, %r14
	.word 0xfedb8e80  ! 1637: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_3_128:
	setx	0x280211, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_72:
	mov	0x3c6, %r14
	.word 0xfaf38e80  ! 1641: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_3_129:
	setx	0x2a0312, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_130:
	setx	0x2a011a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_131:
	setx	0x2b0008, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_132:
	setx	0x28010e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_133:
	setx	0x2a0210, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_58:
	mov	0x28, %r14
	.word 0xfcdb8e40  ! 1659: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_3_134:
	setx	0x280039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2c4c000  ! 1666: ADDCcc_R	addccc 	%r19, %r0, %r25
T3_asi_reg_wr_73:
	mov	0x21, %r14
	.word 0xf0f384a0  ! 1667: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_3_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_125), 16, 16)) -> intp(3, 0, 29)
cpu_intr_3_135:
	setx	0x2b0306, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_59:
	mov	0x3c7, %r14
	.word 0xf8db8e60  ! 1672: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	ta	T_CHANGE_HPRIV
cpu_intr_3_136:
	setx	0x290210, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_126), 16, 16)) -> intp(3, 0, 36)
	.word 0xb750c000  ! 1679: RDPR_TT	rdpr	%tt, %r27
T3_asi_reg_rd_60:
	mov	0x3c6, %r14
	.word 0xf8db8e80  ! 1680: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf02d6114  ! 1681: STB_I	stb	%r24, [%r21 + 0x0114]
iob_intr_3_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_127), 16, 16)) -> intp(3, 0, 24)
	.word 0xf0354000  ! 1683: STH_R	sth	%r24, [%r21 + %r0]
	.word 0xfa74c000  ! 1684: STX_R	stx	%r29, [%r19 + %r0]
	.word 0xfeb5a116  ! 1687: STHA_I	stha	%r31, [%r22 + 0x0116] %asi
cpu_intr_3_137:
	setx	0x290012, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_3_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_128), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_wr_74:
	mov	0x2b, %r14
	.word 0xf6f38e40  ! 1694: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_3_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_129), 16, 16)) -> intp(3, 0, 7)
	.word 0xf42560d4  ! 1699: STW_I	stw	%r26, [%r21 + 0x00d4]
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983b10  ! 1701: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b10, %hpstate
cpu_intr_3_138:
	setx	0x290236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2d8000  ! 1704: STB_R	stb	%r31, [%r22 + %r0]
cpu_intr_3_139:
	setx	0x29013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982e90  ! 1710: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e90, %hpstate
	.word 0xbe344000  ! 1711: ORN_R	orn 	%r17, %r0, %r31
	.word 0xf6b4218d  ! 1713: STHA_I	stha	%r27, [%r16 + 0x018d] %asi
	.word 0xf6ad6106  ! 1714: STBA_I	stba	%r27, [%r21 + 0x0106] %asi
	.word 0xf275e1c6  ! 1716: STX_I	stx	%r25, [%r23 + 0x01c6]
	.word 0xf6a58020  ! 1719: STWA_R	stwa	%r27, [%r22 + %r0] 0x01
	.word 0xf4b52004  ! 1720: STHA_I	stha	%r26, [%r20 + 0x0004] %asi
T3_asi_reg_wr_75:
	mov	0x5, %r14
	.word 0xf8f38e60  ! 1722: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf234a14f  ! 1723: STH_I	sth	%r25, [%r18 + 0x014f]
cpu_intr_3_140:
	setx	0x2b0129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc9d4000  ! 1727: XORcc_R	xorcc 	%r21, %r0, %r30
	.word 0xf6a4a107  ! 1730: STWA_I	stwa	%r27, [%r18 + 0x0107] %asi
	.word 0xf424205b  ! 1731: STW_I	stw	%r26, [%r16 + 0x005b]
cpu_intr_3_141:
	setx	0x2b0132, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_61:
	mov	0x3c8, %r14
	.word 0xf8db8e40  ! 1741: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T3_asi_reg_wr_76:
	mov	0x4, %r14
	.word 0xfef384a0  ! 1742: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T3_asi_reg_wr_77:
	mov	0x34, %r14
	.word 0xf2f389e0  ! 1743: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_3_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_130), 16, 16)) -> intp(3, 0, 24)
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983e82  ! 1749: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e82, %hpstate
	.word 0xf0754000  ! 1754: STX_R	stx	%r24, [%r21 + %r0]
	.word 0xfa75c000  ! 1755: STX_R	stx	%r29, [%r23 + %r0]
iob_intr_3_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_131), 16, 16)) -> intp(3, 0, 10)
	.word 0xfaa5a0ef  ! 1765: STWA_I	stwa	%r29, [%r22 + 0x00ef] %asi
cpu_intr_3_142:
	setx	0x290112, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_132), 16, 16)) -> intp(3, 0, 24)
cpu_intr_3_143:
	setx	0x2b0028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42da09f  ! 1773: STB_I	stb	%r26, [%r22 + 0x009f]
T3_asi_reg_rd_62:
	mov	0x5, %r14
	.word 0xf4db8e40  ! 1775: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfc240000  ! 1776: STW_R	stw	%r30, [%r16 + %r0]
iob_intr_3_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_133), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf274c000  ! 1779: STX_R	stx	%r25, [%r19 + %r0]
	.word 0xf225c000  ! 1783: STW_R	stw	%r25, [%r23 + %r0]
T3_asi_reg_wr_78:
	mov	0x4, %r14
	.word 0xfaf38e60  ! 1784: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf624e007  ! 1786: STW_I	stw	%r27, [%r19 + 0x0007]
	.word 0xbb3d8000  ! 1788: SRA_R	sra 	%r22, %r0, %r29
	ta	T_CHANGE_NONHPRIV
	.word 0xfe754000  ! 1797: STX_R	stx	%r31, [%r21 + %r0]
	.word 0xbd643801  ! 1798: MOVcc_I	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf824a17b  ! 1806: STW_I	stw	%r28, [%r18 + 0x017b]
	.word 0xfe2c21e3  ! 1808: STB_I	stb	%r31, [%r16 + 0x01e3]
cpu_intr_3_144:
	setx	0x280214, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_134), 16, 16)) -> intp(3, 0, 13)
cpu_intr_3_145:
	setx	0x2b0022, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_146:
	setx	0x2b0102, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_79:
	mov	0xb, %r14
	.word 0xf0f389e0  ! 1817: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T3_asi_reg_rd_63:
	mov	0x3c0, %r14
	.word 0xfedb8e60  ! 1818: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xfaac609c  ! 1819: STBA_I	stba	%r29, [%r17 + 0x009c] %asi
	.word 0xf274c000  ! 1820: STX_R	stx	%r25, [%r19 + %r0]
T3_asi_reg_rd_64:
	mov	0x38, %r14
	.word 0xfcdb8e40  ! 1823: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_3_147:
	setx	0x2a0128, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_135), 16, 16)) -> intp(3, 0, 6)
	.word 0xbe8d20b2  ! 1828: ANDcc_I	andcc 	%r20, 0x00b2, %r31
cpu_intr_3_148:
	setx	0x2a0212, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_149:
	setx	0x28012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_80:
	mov	0x2f, %r14
	.word 0xfef38e40  ! 1833: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf8b52121  ! 1834: STHA_I	stha	%r28, [%r20 + 0x0121] %asi
T3_asi_reg_rd_65:
	mov	0x3c8, %r14
	.word 0xf8db8400  ! 1837: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T3_asi_reg_wr_81:
	mov	0x26, %r14
	.word 0xfef384a0  ! 1839: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xfca5e172  ! 1840: STWA_I	stwa	%r30, [%r23 + 0x0172] %asi
T3_asi_reg_rd_66:
	mov	0x3c5, %r14
	.word 0xf6db8e60  ! 1841: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xfef5a054  ! 1844: STXA_I	stxa	%r31, [%r22 + 0x0054] %asi
	.word 0xb73c3001  ! 1845: SRAX_I	srax	%r16, 0x0001, %r27
iob_intr_3_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_136), 16, 16)) -> intp(3, 0, 30)
	.word 0xfea5217c  ! 1847: STWA_I	stwa	%r31, [%r20 + 0x017c] %asi
iob_intr_3_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_137), 16, 16)) -> intp(3, 0, a)
iob_intr_3_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_138), 16, 16)) -> intp(3, 0, 14)
	.word 0xf42ce1c1  ! 1852: STB_I	stb	%r26, [%r19 + 0x01c1]
	.word 0xb20d8000  ! 1856: AND_R	and 	%r22, %r0, %r25
	.word 0xf4f461bd  ! 1860: STXA_I	stxa	%r26, [%r17 + 0x01bd] %asi
	.word 0xb484c000  ! 1862: ADDcc_R	addcc 	%r19, %r0, %r26
iob_intr_3_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_139), 16, 16)) -> intp(3, 0, 12)
	.word 0xbd2c8000  ! 1866: SLL_R	sll 	%r18, %r0, %r30
	.word 0xfcb4e1f3  ! 1867: STHA_I	stha	%r30, [%r19 + 0x01f3] %asi
	.word 0xfc24c000  ! 1868: STW_R	stw	%r30, [%r19 + %r0]
	.word 0xfe2cc000  ! 1869: STB_R	stb	%r31, [%r19 + %r0]
	.word 0xf6a5e13a  ! 1871: STWA_I	stwa	%r27, [%r23 + 0x013a] %asi
	.word 0xfaa460f9  ! 1872: STWA_I	stwa	%r29, [%r17 + 0x00f9] %asi
T3_asi_reg_wr_82:
	mov	0x12, %r14
	.word 0xf4f38e40  ! 1875: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_3_150:
	setx	0x2e0134, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_151:
	setx	0x2d002f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_140), 16, 16)) -> intp(3, 0, 29)
iob_intr_3_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_141), 16, 16)) -> intp(3, 0, 11)
	.word 0xfa754000  ! 1882: STX_R	stx	%r29, [%r21 + %r0]
	.word 0xf8b54020  ! 1884: STHA_R	stha	%r28, [%r21 + %r0] 0x01
T3_asi_reg_rd_67:
	mov	0x4, %r14
	.word 0xfcdb8e80  ! 1885: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_3_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_142), 16, 16)) -> intp(3, 0, 10)
cpu_intr_3_152:
	setx	0x2d020b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_68:
	mov	0x20, %r14
	.word 0xf2db8e40  ! 1891: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfc25e006  ! 1892: STW_I	stw	%r30, [%r23 + 0x0006]
iob_intr_3_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_143), 16, 16)) -> intp(3, 0, 29)
iob_intr_3_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_144), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_153:
	setx	0x2c0003, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf0b5c020  ! 1899: STHA_R	stha	%r24, [%r23 + %r0] 0x01
T3_asi_reg_rd_69:
	mov	0x28, %r14
	.word 0xfcdb8e60  ! 1903: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf4750000  ! 1905: STX_R	stx	%r26, [%r20 + %r0]
	.word 0xfcac8020  ! 1907: STBA_R	stba	%r30, [%r18 + %r0] 0x01
	.word 0xf6250000  ! 1909: STW_R	stw	%r27, [%r20 + %r0]
	.word 0xbcbca092  ! 1912: XNORcc_I	xnorcc 	%r18, 0x0092, %r30
	.word 0xf2b5c020  ! 1913: STHA_R	stha	%r25, [%r23 + %r0] 0x01
T3_asi_reg_rd_70:
	mov	0x2, %r14
	.word 0xf0db89e0  ! 1914: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf0ac21d6  ! 1916: STBA_I	stba	%r24, [%r16 + 0x01d6] %asi
T3_asi_reg_wr_83:
	mov	0x27, %r14
	.word 0xf4f38400  ! 1917: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T3_asi_reg_rd_71:
	mov	0xf, %r14
	.word 0xf2db8e80  ! 1920: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf635e0d4  ! 1921: STH_I	sth	%r27, [%r23 + 0x00d4]
T3_asi_reg_wr_84:
	mov	0x36, %r14
	.word 0xf2f38e40  ! 1923: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf8acc020  ! 1924: STBA_R	stba	%r28, [%r19 + %r0] 0x01
	.word 0xfa74c000  ! 1925: STX_R	stx	%r29, [%r19 + %r0]
iob_intr_3_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_145), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf4a50020  ! 1931: STWA_R	stwa	%r26, [%r20 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_154:
	setx	0x2d0018, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_155:
	setx	0x2d0328, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_146), 16, 16)) -> intp(3, 0, 33)
iob_intr_3_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_147), 16, 16)) -> intp(3, 0, 26)
	ta	T_CHANGE_TO_TL0
iob_intr_3_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_148), 16, 16)) -> intp(3, 0, a)
cpu_intr_3_156:
	setx	0x2e013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf434e0cd  ! 1946: STH_I	sth	%r26, [%r19 + 0x00cd]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_72:
	mov	0x3c8, %r14
	.word 0xfcdb8e40  ! 1948: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf8f5a0fd  ! 1949: STXA_I	stxa	%r28, [%r22 + 0x00fd] %asi
	.word 0xf225212f  ! 1952: STW_I	stw	%r25, [%r20 + 0x012f]
T3_asi_reg_wr_85:
	mov	0x29, %r14
	.word 0xf8f389e0  ! 1953: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T3_asi_reg_rd_73:
	mov	0x36, %r14
	.word 0xfedb89e0  ! 1954: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_3_157:
	setx	0x2c0027, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_149), 16, 16)) -> intp(3, 0, 9)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_74:
	mov	0x3c0, %r14
	.word 0xf2db8400  ! 1963: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T3_asi_reg_wr_86:
	mov	0x16, %r14
	.word 0xf2f38e80  ! 1968: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf4ac60ab  ! 1970: STBA_I	stba	%r26, [%r17 + 0x00ab] %asi
	ta	T_CHANGE_TO_TL1
cpu_intr_3_158:
	setx	0x2f020e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_159:
	setx	0x2d0336, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_150), 16, 16)) -> intp(3, 0, 19)
	.word 0xf4758000  ! 1982: STX_R	stx	%r26, [%r22 + %r0]
	ta	T_CHANGE_NONHPRIV
	.word 0xf63561bc  ! 1984: STH_I	sth	%r27, [%r21 + 0x01bc]
iob_intr_3_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_151), 16, 16)) -> intp(3, 0, 31)
	.word 0xfcb4612e  ! 1992: STHA_I	stha	%r30, [%r17 + 0x012e] %asi
	.word 0xf8748000  ! 1993: STX_R	stx	%r28, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_wr_87:
	mov	0x25, %r14
	.word 0xf2f38e40  ! 1995: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb4b521f3  ! 1996: ORNcc_I	orncc 	%r20, 0x01f3, %r26
	.word 0xf474a050  ! 1999: STX_I	stx	%r26, [%r18 + 0x0050]
cpu_intr_3_160:
	setx	0x2f0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf425e1d5  ! 2002: STW_I	stw	%r26, [%r23 + 0x01d5]
cpu_intr_3_161:
	setx	0x2e021b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_88:
	mov	0x3c4, %r14
	.word 0xf0f38400  ! 2005: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb625c000  ! 2006: SUB_R	sub 	%r23, %r0, %r27
iob_intr_3_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_152), 16, 16)) -> intp(3, 0, 27)
	.word 0xb8b4c000  ! 2008: ORNcc_R	orncc 	%r19, %r0, %r28
T3_asi_reg_wr_89:
	mov	0x2a, %r14
	.word 0xf2f38400  ! 2009: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbc8d2139  ! 2011: ANDcc_I	andcc 	%r20, 0x0139, %r30
cpu_intr_3_162:
	setx	0x2c013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_90:
	mov	0x2b, %r14
	.word 0xfef384a0  ! 2014: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982c82  ! 2016: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c82, %hpstate
	.word 0xb3354000  ! 2017: SRL_R	srl 	%r21, %r0, %r25
	.word 0xf2250000  ! 2018: STW_R	stw	%r25, [%r20 + %r0]
iob_intr_3_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_153), 16, 16)) -> intp(3, 0, 1f)
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_91:
	mov	0x16, %r14
	.word 0xf0f38e60  ! 2027: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T3_asi_reg_rd_75:
	mov	0x2c, %r14
	.word 0xf4db8e60  ! 2029: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T3_asi_reg_wr_92:
	mov	0x34, %r14
	.word 0xf2f38e40  ! 2030: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf875c000  ! 2031: STX_R	stx	%r28, [%r23 + %r0]
cpu_intr_3_163:
	setx	0x2d0113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba244000  ! 2034: SUB_R	sub 	%r17, %r0, %r29
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_93:
	mov	0x3c6, %r14
	.word 0xfcf38e40  ! 2037: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982d8a  ! 2038: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8a, %hpstate
iob_intr_3_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_154), 16, 16)) -> intp(3, 0, 24)
	.word 0xf4a5a08f  ! 2041: STWA_I	stwa	%r26, [%r22 + 0x008f] %asi
cpu_intr_3_164:
	setx	0x2c0323, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_94:
	mov	0xd, %r14
	.word 0xf8f38e40  ! 2044: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_3_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_155), 16, 16)) -> intp(3, 0, 29)
	.word 0xfe2d8000  ! 2047: STB_R	stb	%r31, [%r22 + %r0]
	.word 0xfcf5e181  ! 2051: STXA_I	stxa	%r30, [%r23 + 0x0181] %asi
	.word 0xfc25e165  ! 2052: STW_I	stw	%r30, [%r23 + 0x0165]
	.word 0xb93c1000  ! 2053: SRAX_R	srax	%r16, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_156), 16, 16)) -> intp(3, 0, 30)
	.word 0xb48c0000  ! 2064: ANDcc_R	andcc 	%r16, %r0, %r26
cpu_intr_3_165:
	setx	0x2e0133, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_166:
	setx	0x2d0028, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_76:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 2067: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_NONHPRIV
	.word 0xb444616d  ! 2071: ADDC_I	addc 	%r17, 0x016d, %r26
	.word 0xf834e011  ! 2072: STH_I	sth	%r28, [%r19 + 0x0011]
iob_intr_3_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_157), 16, 16)) -> intp(3, 0, 25)
	.word 0xbe34a083  ! 2075: ORN_I	orn 	%r18, 0x0083, %r31
	.word 0xfeb4617f  ! 2076: STHA_I	stha	%r31, [%r17 + 0x017f] %asi
	.word 0xf62da185  ! 2077: STB_I	stb	%r27, [%r22 + 0x0185]
cpu_intr_3_167:
	setx	0x2d000d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_168:
	setx	0x2c001a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_169:
	setx	0x2c0302, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_170:
	setx	0x2f0128, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_77:
	mov	0x3c4, %r14
	.word 0xfedb84a0  ! 2086: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_3_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_158), 16, 16)) -> intp(3, 0, 20)
	.word 0xfaf42121  ! 2088: STXA_I	stxa	%r29, [%r16 + 0x0121] %asi
T3_asi_reg_wr_95:
	mov	0xb, %r14
	.word 0xfaf38e40  ! 2089: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_3_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_159), 16, 16)) -> intp(3, 0, 28)
	.word 0xb37ca401  ! 2091: MOVR_I	movre	%r18, 0x1, %r25
cpu_intr_3_171:
	setx	0x2e011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2344000  ! 2100: STH_R	sth	%r25, [%r17 + %r0]
cpu_intr_3_172:
	setx	0x2d0122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02d20f6  ! 2104: STB_I	stb	%r24, [%r20 + 0x00f6]
T3_asi_reg_wr_96:
	mov	0x25, %r14
	.word 0xf6f38e60  ! 2105: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf0242014  ! 2108: STW_I	stw	%r24, [%r16 + 0x0014]
	.word 0xfe2ca096  ! 2109: STB_I	stb	%r31, [%r18 + 0x0096]
	.word 0xfe750000  ! 2110: STX_R	stx	%r31, [%r20 + %r0]
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_78:
	mov	0x28, %r14
	.word 0xf4db8e40  ! 2114: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf0340000  ! 2115: STH_R	sth	%r24, [%r16 + %r0]
cpu_intr_3_173:
	setx	0x2c033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcf5a007  ! 2123: STXA_I	stxa	%r30, [%r22 + 0x0007] %asi
	.word 0x8594e156  ! 2124: WRPR_TSTATE_I	wrpr	%r19, 0x0156, %tstate
iob_intr_3_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_160), 16, 16)) -> intp(3, 0, 37)
	.word 0xb8b58000  ! 2126: SUBCcc_R	orncc 	%r22, %r0, %r28
T3_asi_reg_rd_79:
	mov	0x3c1, %r14
	.word 0xf8db8e60  ! 2129: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xba3561dd  ! 2131: ORN_I	orn 	%r21, 0x01dd, %r29
	.word 0xba352113  ! 2134: SUBC_I	orn 	%r20, 0x0113, %r29
iob_intr_3_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_161), 16, 16)) -> intp(3, 0, 13)
	.word 0xb0b48000  ! 2139: SUBCcc_R	orncc 	%r18, %r0, %r24
	.word 0xfc248000  ! 2142: STW_R	stw	%r30, [%r18 + %r0]
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982948  ! 2143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0948, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3348000  ! 2148: SRL_R	srl 	%r18, %r0, %r25
	.word 0xfc2de057  ! 2149: STB_I	stb	%r30, [%r23 + 0x0057]
cpu_intr_3_174:
	setx	0x2c0234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42ca0ac  ! 2152: STB_I	stb	%r26, [%r18 + 0x00ac]
	.word 0xf62c0000  ! 2155: STB_R	stb	%r27, [%r16 + %r0]
iob_intr_3_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_162), 16, 16)) -> intp(3, 0, 3)
cpu_intr_3_175:
	setx	0x2c0230, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_97:
	mov	0x3c2, %r14
	.word 0xf2f38e40  ! 2159: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_163), 16, 16)) -> intp(3, 0, 12)
	.word 0xf625a049  ! 2162: STW_I	stw	%r27, [%r22 + 0x0049]
	.word 0xf2ac8020  ! 2163: STBA_R	stba	%r25, [%r18 + %r0] 0x01
	.word 0xf824a085  ! 2165: STW_I	stw	%r28, [%r18 + 0x0085]
cpu_intr_3_176:
	setx	0x2f0215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf024a056  ! 2169: STW_I	stw	%r24, [%r18 + 0x0056]
cpu_intr_3_177:
	setx	0x2022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a40020  ! 2172: STWA_R	stwa	%r28, [%r16 + %r0] 0x01
	.word 0xf6240000  ! 2174: STW_R	stw	%r27, [%r16 + %r0]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_80:
	mov	0xc, %r14
	.word 0xf0db89e0  ! 2176: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T3_asi_reg_rd_81:
	mov	0x2d, %r14
	.word 0xfadb8e40  ! 2177: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_rd_82:
	mov	0x23, %r14
	.word 0xfcdb8e80  ! 2178: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf2ac60da  ! 2180: STBA_I	stba	%r25, [%r17 + 0x00da] %asi
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982bc8  ! 2182: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc8, %hpstate
	.word 0xf2a5a0cb  ! 2184: STWA_I	stwa	%r25, [%r22 + 0x00cb] %asi
cpu_intr_3_178:
	setx	0x2d0229, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_164), 16, 16)) -> intp(3, 0, 2d)
cpu_intr_3_179:
	setx	0x2e0335, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_98:
	mov	0x35, %r14
	.word 0xfcf389e0  ! 2188: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_3_180:
	setx	0x2c0238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ad20ea  ! 2190: STBA_I	stba	%r26, [%r20 + 0x00ea] %asi
cpu_intr_3_181:
	setx	0x2e013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_83:
	mov	0x2a, %r14
	.word 0xfcdb84a0  ! 2201: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
iob_intr_3_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_165), 16, 16)) -> intp(3, 0, 5)
T3_asi_reg_wr_99:
	mov	0xa, %r14
	.word 0xf6f389e0  ! 2209: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xfc7521fe  ! 2210: STX_I	stx	%r30, [%r20 + 0x01fe]
T3_asi_reg_rd_84:
	mov	0x3c7, %r14
	.word 0xfadb8e40  ! 2212: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf0b5e01a  ! 2213: STHA_I	stha	%r24, [%r23 + 0x001a] %asi
iob_intr_3_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_166), 16, 16)) -> intp(3, 0, 20)
	.word 0xf0354000  ! 2218: STH_R	sth	%r24, [%r21 + %r0]
T3_asi_reg_rd_85:
	mov	0x32, %r14
	.word 0xfedb8e40  ! 2222: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	setx	data_start_3, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982d00  ! 2223: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d00, %hpstate
T3_asi_reg_wr_100:
	mov	0x29, %r14
	.word 0xf6f38400  ! 2224: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T3_asi_reg_rd_86:
	mov	0x4, %r14
	.word 0xfcdb89e0  ! 2227: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf8b421a8  ! 2229: STHA_I	stha	%r28, [%r16 + 0x01a8] %asi
iob_intr_3_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_167), 16, 16)) -> intp(3, 0, 2e)
	setx	data_start_1, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983b00  ! 2235: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b00, %hpstate
cpu_intr_3_182:
	setx	0x2e021a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_183:
	setx	0x2c000e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_168), 16, 16)) -> intp(3, 0, 5)
	.word 0xfe74a119  ! 2240: STX_I	stx	%r31, [%r18 + 0x0119]
	.word 0xf8f4a16d  ! 2242: STXA_I	stxa	%r28, [%r18 + 0x016d] %asi
	.word 0xf02d4000  ! 2247: STB_R	stb	%r24, [%r21 + %r0]
T3_asi_reg_wr_101:
	mov	0x9, %r14
	.word 0xf4f38400  ! 2252: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x8198381a  ! 2253: WRHPR_HPSTATE_I	wrhpr	%r0, 0x181a, %hpstate
	.word 0xbe258000  ! 2257: SUB_R	sub 	%r22, %r0, %r31
cpu_intr_3_184:
	setx	0x2f003f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_169), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf02461af  ! 2263: STW_I	stw	%r24, [%r17 + 0x01af]
iob_intr_3_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_170), 16, 16)) -> intp(3, 0, 14)
cpu_intr_3_185:
	setx	0x2d0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a58020  ! 2271: STWA_R	stwa	%r25, [%r22 + %r0] 0x01
	.word 0xf0acc020  ! 2274: STBA_R	stba	%r24, [%r19 + %r0] 0x01
T3_asi_reg_rd_87:
	mov	0x3c0, %r14
	.word 0xfcdb8e40  ! 2276: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_171), 16, 16)) -> intp(3, 0, 3b)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_186:
	setx	0x2c0031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_187:
	setx	0x2c023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982b42  ! 2289: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b42, %hpstate
	.word 0xfe2da128  ! 2291: STB_I	stb	%r31, [%r22 + 0x0128]
	ta	T_CHANGE_NONHPRIV
	.word 0xb0a48000  ! 2295: SUBcc_R	subcc 	%r18, %r0, %r24
iob_intr_3_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_172), 16, 16)) -> intp(3, 0, 1a)
	.word 0xbc3de080  ! 2300: XNOR_I	xnor 	%r23, 0x0080, %r30
iob_intr_3_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_173), 16, 16)) -> intp(3, 0, b)
T3_asi_reg_rd_88:
	mov	0x37, %r14
	.word 0xfcdb8e60  ! 2303: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_3_188:
	setx	0x2e0304, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_189:
	setx	0x2e011e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_190:
	setx	0x2c0128, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_191:
	setx	0x2d0201, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982810  ! 2312: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0810, %hpstate
	.word 0xf024a0ca  ! 2314: STW_I	stw	%r24, [%r18 + 0x00ca]
iob_intr_3_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_174), 16, 16)) -> intp(3, 0, 1)
	.word 0xb0448000  ! 2321: ADDC_R	addc 	%r18, %r0, %r24
T3_asi_reg_wr_102:
	mov	0x11, %r14
	.word 0xf4f38e40  ! 2333: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf424a0c0  ! 2336: STW_I	stw	%r26, [%r18 + 0x00c0]
cpu_intr_3_192:
	setx	0x30012d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_175), 16, 16)) -> intp(3, 0, 5)
cpu_intr_3_193:
	setx	0x330122, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_103:
	mov	0x3c6, %r14
	.word 0xf4f389e0  ! 2341: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T3_asi_reg_rd_89:
	mov	0x33, %r14
	.word 0xfedb8e80  ! 2342: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_3_194:
	setx	0x310000, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982c02  ! 2348: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c02, %hpstate
T3_asi_reg_rd_90:
	mov	0x3c4, %r14
	.word 0xf0db89e0  ! 2349: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_3_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_176), 16, 16)) -> intp(3, 0, 26)
	ta	T_CHANGE_TO_TL0
	.word 0xfeaca05c  ! 2357: STBA_I	stba	%r31, [%r18 + 0x005c] %asi
T3_asi_reg_wr_104:
	mov	0xa, %r14
	.word 0xf6f389e0  ! 2358: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T3_asi_reg_rd_91:
	mov	0x2, %r14
	.word 0xfcdb89e0  ! 2361: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xfe2de114  ! 2362: STB_I	stb	%r31, [%r23 + 0x0114]
	.word 0xf0b4219e  ! 2363: STHA_I	stha	%r24, [%r16 + 0x019e] %asi
iob_intr_3_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_177), 16, 16)) -> intp(3, 0, a)
T3_asi_reg_rd_92:
	mov	0x15, %r14
	.word 0xfedb8e40  ! 2367: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_195:
	setx	0x310112, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_196:
	setx	0x310004, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_105:
	mov	0x11, %r14
	.word 0xf2f384a0  ! 2375: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_3_197:
	setx	0x30012f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_198:
	setx	0x310038, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_106:
	mov	0x4, %r14
	.word 0xfaf38e80  ! 2380: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_3_199:
	setx	0x300321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa421ef  ! 2382: STWA_I	stwa	%r29, [%r16 + 0x01ef] %asi
	.word 0xbc1d8000  ! 2383: XOR_R	xor 	%r22, %r0, %r30
T3_asi_reg_rd_93:
	mov	0x32, %r14
	.word 0xf0db8e60  ! 2385: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	setx	data_start_4, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983d00  ! 2387: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d00, %hpstate
T3_asi_reg_rd_94:
	mov	0x2, %r14
	.word 0xfcdb8e60  ! 2389: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf2ad8020  ! 2390: STBA_R	stba	%r25, [%r22 + %r0] 0x01
cpu_intr_3_200:
	setx	0x330119, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_178), 16, 16)) -> intp(3, 0, 19)
	.word 0xbc340000  ! 2396: ORN_R	orn 	%r16, %r0, %r30
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983c48  ! 2398: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c48, %hpstate
	ta	T_CHANGE_TO_TL1
	.word 0xbb35c000  ! 2405: SRL_R	srl 	%r23, %r0, %r29
	.word 0xfeaca1eb  ! 2406: STBA_I	stba	%r31, [%r18 + 0x01eb] %asi
cpu_intr_3_201:
	setx	0x30023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe25e023  ! 2410: STW_I	stw	%r31, [%r23 + 0x0023]
	.word 0xfef4e1ce  ! 2420: STXA_I	stxa	%r31, [%r19 + 0x01ce] %asi
iob_intr_3_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_179), 16, 16)) -> intp(3, 0, 36)
	.word 0xfab5e0c3  ! 2422: STHA_I	stha	%r29, [%r23 + 0x00c3] %asi
T3_asi_reg_rd_95:
	mov	0x17, %r14
	.word 0xf2db8e60  ! 2423: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb0148000  ! 2426: OR_R	or 	%r18, %r0, %r24
	.word 0xf0ac6015  ! 2430: STBA_I	stba	%r24, [%r17 + 0x0015] %asi
cpu_intr_3_202:
	setx	0x330132, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_180), 16, 16)) -> intp(3, 0, a)
	.word 0xfab4e034  ! 2437: STHA_I	stha	%r29, [%r19 + 0x0034] %asi
T3_asi_reg_wr_107:
	mov	0x17, %r14
	.word 0xf2f38e80  ! 2438: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf4ada0ae  ! 2439: STBA_I	stba	%r26, [%r22 + 0x00ae] %asi
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983eca  ! 2440: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1eca, %hpstate
	.word 0xf034a052  ! 2442: STH_I	sth	%r24, [%r18 + 0x0052]
	.word 0xfa358000  ! 2445: STH_R	sth	%r29, [%r22 + %r0]
iob_intr_3_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_181), 16, 16)) -> intp(3, 0, a)
T3_asi_reg_wr_108:
	mov	0x16, %r14
	.word 0xf8f384a0  ! 2448: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_3_203:
	setx	0x320027, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_109:
	mov	0x1, %r14
	.word 0xfaf38e40  ! 2453: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfaadc020  ! 2454: STBA_R	stba	%r29, [%r23 + %r0] 0x01
	.word 0xf6ade083  ! 2455: STBA_I	stba	%r27, [%r23 + 0x0083] %asi
cpu_intr_3_204:
	setx	0x320218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4b5e12e  ! 2457: SUBCcc_I	orncc 	%r23, 0x012e, %r26
	.word 0xf4ad0020  ! 2462: STBA_R	stba	%r26, [%r20 + %r0] 0x01
cpu_intr_3_205:
	setx	0x330014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfef56164  ! 2467: STXA_I	stxa	%r31, [%r21 + 0x0164] %asi
iob_intr_3_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_182), 16, 16)) -> intp(3, 0, 21)
	.word 0xf4f560f8  ! 2473: STXA_I	stxa	%r26, [%r21 + 0x00f8] %asi
	.word 0xbe85a0ab  ! 2474: ADDcc_I	addcc 	%r22, 0x00ab, %r31
T3_asi_reg_rd_96:
	mov	0x31, %r14
	.word 0xf4db8e80  ! 2475: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xf6b4a0d4  ! 2477: STHA_I	stha	%r27, [%r18 + 0x00d4] %asi
cpu_intr_3_206:
	setx	0x320324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe848000  ! 2484: ADDcc_R	addcc 	%r18, %r0, %r31
	.word 0xf82dc000  ! 2486: STB_R	stb	%r28, [%r23 + %r0]
	.word 0xf2ada1c7  ! 2489: STBA_I	stba	%r25, [%r22 + 0x01c7] %asi
	.word 0xf2ad8020  ! 2491: STBA_R	stba	%r25, [%r22 + %r0] 0x01
iob_intr_3_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_183), 16, 16)) -> intp(3, 0, 39)
	.word 0xb934a001  ! 2493: SRL_I	srl 	%r18, 0x0001, %r28
cpu_intr_3_207:
	setx	0x31021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a4a0f5  ! 2495: STWA_I	stwa	%r26, [%r18 + 0x00f5] %asi
cpu_intr_3_208:
	setx	0x320022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42520af  ! 2497: STW_I	stw	%r26, [%r20 + 0x00af]
	.word 0xf874a006  ! 2499: STX_I	stx	%r28, [%r18 + 0x0006]
iob_intr_3_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_184), 16, 16)) -> intp(3, 0, 16)
iob_intr_3_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_185), 16, 16)) -> intp(3, 0, 4)
cpu_intr_3_209:
	setx	0x310004, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_97:
	mov	0x35, %r14
	.word 0xfedb8400  ! 2507: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbb3d6001  ! 2509: SRA_I	sra 	%r21, 0x0001, %r29
	.word 0xf425e0a7  ! 2511: STW_I	stw	%r26, [%r23 + 0x00a7]
	.word 0xb884c000  ! 2512: ADDcc_R	addcc 	%r19, %r0, %r28
	.word 0xf2750000  ! 2513: STX_R	stx	%r25, [%r20 + %r0]
cpu_intr_3_210:
	setx	0x300120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf825200d  ! 2518: STW_I	stw	%r28, [%r20 + 0x000d]
	.word 0xfeac4020  ! 2520: STBA_R	stba	%r31, [%r17 + %r0] 0x01
T3_asi_reg_rd_98:
	mov	0x26, %r14
	.word 0xfedb8400  ! 2522: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T3_asi_reg_wr_110:
	mov	0x23, %r14
	.word 0xf4f38e60  ! 2523: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_3_211:
	setx	0x310327, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_212:
	setx	0x300232, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_3_213:
	setx	0x300228, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_214:
	setx	0x310308, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_215:
	setx	0x30032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_99:
	mov	0x3c4, %r14
	.word 0xfedb89e0  ! 2535: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_3_216:
	setx	0x33013b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_217:
	setx	0x32022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb40020  ! 2544: STHA_R	stha	%r31, [%r16 + %r0] 0x01
T3_asi_reg_rd_100:
	mov	0x2, %r14
	.word 0xf6db8e40  ! 2545: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_218:
	setx	0x310028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b5e1aa  ! 2550: STHA_I	stha	%r25, [%r23 + 0x01aa] %asi
iob_intr_3_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_186), 16, 16)) -> intp(3, 0, 1)
	.word 0xf8740000  ! 2554: STX_R	stx	%r28, [%r16 + %r0]
	.word 0xf434a1ee  ! 2555: STH_I	sth	%r26, [%r18 + 0x01ee]
	.word 0xf225a1b5  ! 2559: STW_I	stw	%r25, [%r22 + 0x01b5]
iob_intr_3_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_187), 16, 16)) -> intp(3, 0, 2b)
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982900  ! 2564: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0900, %hpstate
	.word 0xb22d21a3  ! 2565: ANDN_I	andn 	%r20, 0x01a3, %r25
iob_intr_3_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_188), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_219:
	setx	0x31013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb29ca028  ! 2579: XORcc_I	xorcc 	%r18, 0x0028, %r25
T3_asi_reg_rd_101:
	mov	0x3, %r14
	.word 0xf0db89e0  ! 2583: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_3_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_189), 16, 16)) -> intp(3, 0, 37)
cpu_intr_3_220:
	setx	0x300210, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_111:
	mov	0x27, %r14
	.word 0xf4f38e40  ! 2587: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	.word 0xf8758000  ! 2591: STX_R	stx	%r28, [%r22 + %r0]
T3_asi_reg_rd_102:
	mov	0x3c8, %r14
	.word 0xf4db8e60  ! 2592: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xfc754000  ! 2593: STX_R	stx	%r30, [%r21 + %r0]
	.word 0xfea44020  ! 2595: STWA_R	stwa	%r31, [%r17 + %r0] 0x01
	.word 0xb0b560ae  ! 2598: SUBCcc_I	orncc 	%r21, 0x00ae, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbf510000  ! 2603: RDPR_TICK	rdpr	%tick, %r31
T3_asi_reg_wr_112:
	mov	0x2e, %r14
	.word 0xfef38e80  ! 2604: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983d9a  ! 2606: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d9a, %hpstate
T3_asi_reg_wr_113:
	mov	0x6, %r14
	.word 0xf0f389e0  ! 2608: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xfaa461db  ! 2609: STWA_I	stwa	%r29, [%r17 + 0x01db] %asi
T3_asi_reg_rd_103:
	mov	0x3c0, %r14
	.word 0xf8db84a0  ! 2610: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T3_asi_reg_wr_114:
	mov	0xc, %r14
	.word 0xf6f38e80  ! 2612: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_3_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_190), 16, 16)) -> intp(3, 0, 2b)
cpu_intr_3_221:
	setx	0x320036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b5a123  ! 2615: ORNcc_I	orncc 	%r22, 0x0123, %r27
	.word 0xf42c0000  ! 2616: STB_R	stb	%r26, [%r16 + %r0]
cpu_intr_3_222:
	setx	0x310202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8252130  ! 2618: STW_I	stw	%r28, [%r20 + 0x0130]
T3_asi_reg_wr_115:
	mov	0x6, %r14
	.word 0xfaf38e40  ! 2622: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb3643801  ! 2626: MOVcc_I	<illegal instruction>
iob_intr_3_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_191), 16, 16)) -> intp(3, 0, e)
	.word 0xfa75c000  ! 2629: STX_R	stx	%r29, [%r23 + %r0]
T3_asi_reg_rd_104:
	mov	0x38, %r14
	.word 0xf0db8e80  ! 2631: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_3_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_192), 16, 16)) -> intp(3, 0, 33)
	.word 0xfe2c0000  ! 2636: STB_R	stb	%r31, [%r16 + %r0]
	.word 0xfc74e177  ! 2637: STX_I	stx	%r30, [%r19 + 0x0177]
	.word 0xfa244000  ! 2638: STW_R	stw	%r29, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_223:
	setx	0x310002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4acc020  ! 2644: STBA_R	stba	%r26, [%r19 + %r0] 0x01
	.word 0xf2a58020  ! 2645: STWA_R	stwa	%r25, [%r22 + %r0] 0x01
cpu_intr_3_224:
	setx	0x32023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0f520ed  ! 2655: STXA_I	stxa	%r24, [%r20 + 0x00ed] %asi
cpu_intr_3_225:
	setx	0x33003f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_193), 16, 16)) -> intp(3, 0, 24)
T3_asi_reg_rd_105:
	mov	0x3c6, %r14
	.word 0xf0db8e60  ! 2661: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xfa2c0000  ! 2662: STB_R	stb	%r29, [%r16 + %r0]
cpu_intr_3_226:
	setx	0x31002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc740000  ! 2664: STX_R	stx	%r30, [%r16 + %r0]
T3_asi_reg_wr_116:
	mov	0xb, %r14
	.word 0xf0f389e0  ! 2667: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xfa2ca00f  ! 2670: STB_I	stb	%r29, [%r18 + 0x000f]
iob_intr_3_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_194), 16, 16)) -> intp(3, 0, 31)
iob_intr_3_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_195), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_rd_106:
	mov	0x3c1, %r14
	.word 0xfcdb84a0  ! 2674: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_3_227:
	setx	0x1f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ade0c3  ! 2678: STBA_I	stba	%r26, [%r23 + 0x00c3] %asi
	.word 0xfca54020  ! 2679: STWA_R	stwa	%r30, [%r21 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf0348000  ! 2683: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xf22d6041  ! 2684: STB_I	stb	%r25, [%r21 + 0x0041]
T3_asi_reg_rd_107:
	mov	0xe, %r14
	.word 0xf2db8e80  ! 2686: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	ta	T_CHANGE_TO_TL1
iob_intr_3_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_196), 16, 16)) -> intp(3, 0, c)
	.word 0xb4846143  ! 2691: ADDcc_I	addcc 	%r17, 0x0143, %r26
	.word 0xf4a4a0c9  ! 2692: STWA_I	stwa	%r26, [%r18 + 0x00c9] %asi
	.word 0xbb641800  ! 2693: MOVcc_R	<illegal instruction>
	.word 0xfa342091  ! 2700: STH_I	sth	%r29, [%r16 + 0x0091]
	.word 0xb134d000  ! 2701: SRLX_R	srlx	%r19, %r0, %r24
	.word 0xf424a008  ! 2702: STW_I	stw	%r26, [%r18 + 0x0008]
T3_asi_reg_rd_108:
	mov	0x2d, %r14
	.word 0xfcdb8e40  ! 2704: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_3_228:
	setx	0x310030, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_197), 16, 16)) -> intp(3, 0, 2b)
	.word 0xb6b5e0a3  ! 2721: SUBCcc_I	orncc 	%r23, 0x00a3, %r27
cpu_intr_3_229:
	setx	0x320201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a58020  ! 2723: STWA_R	stwa	%r27, [%r22 + %r0] 0x01
iob_intr_3_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_198), 16, 16)) -> intp(3, 0, 7)
cpu_intr_3_230:
	setx	0x320232, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_117:
	mov	0x3c0, %r14
	.word 0xf8f389e0  ! 2734: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf8ad0020  ! 2735: STBA_R	stba	%r28, [%r20 + %r0] 0x01
T3_asi_reg_wr_118:
	mov	0x1f, %r14
	.word 0xf6f38e40  ! 2739: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_3_231:
	setx	0x330220, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_232:
	setx	0x31023c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_199), 16, 16)) -> intp(3, 0, 2d)
cpu_intr_3_233:
	setx	0x330319, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_119:
	mov	0x3c3, %r14
	.word 0xfaf384a0  ! 2752: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xfe2cc000  ! 2754: STB_R	stb	%r31, [%r19 + %r0]
iob_intr_3_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_200), 16, 16)) -> intp(3, 0, 19)
	.word 0xf07421c4  ! 2757: STX_I	stx	%r24, [%r16 + 0x01c4]
	.word 0xfa2d216e  ! 2758: STB_I	stb	%r29, [%r20 + 0x016e]
	.word 0xfaac4020  ! 2761: STBA_R	stba	%r29, [%r17 + %r0] 0x01
T3_asi_reg_wr_120:
	mov	0x38, %r14
	.word 0xf0f38e80  ! 2766: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_3_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_201), 16, 16)) -> intp(3, 0, 7)
	.word 0xfe754000  ! 2770: STX_R	stx	%r31, [%r21 + %r0]
cpu_intr_3_234:
	setx	0x300132, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_235:
	setx	0x31002b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_202), 16, 16)) -> intp(3, 0, 3f)
iob_intr_3_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_203), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_236:
	setx	0x320018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf675a1ce  ! 2780: STX_I	stx	%r27, [%r22 + 0x01ce]
	.word 0xfea5215d  ! 2781: STWA_I	stwa	%r31, [%r20 + 0x015d] %asi
T3_asi_reg_rd_109:
	mov	0x3c6, %r14
	.word 0xf2db8e40  ! 2787: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_TO_TL1
iob_intr_3_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_204), 16, 16)) -> intp(3, 0, 31)
	.word 0xf02de012  ! 2791: STB_I	stb	%r24, [%r23 + 0x0012]
iob_intr_3_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_205), 16, 16)) -> intp(3, 0, 5)
cpu_intr_3_237:
	setx	0x370033, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_121:
	mov	0x19, %r14
	.word 0xfef389e0  ! 2796: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xfa248000  ! 2799: STW_R	stw	%r29, [%r18 + %r0]
cpu_intr_3_238:
	setx	0x360201, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_239:
	setx	0x340220, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982ac8  ! 2802: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac8, %hpstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf8acc020  ! 2807: STBA_R	stba	%r28, [%r19 + %r0] 0x01
iob_intr_3_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_206), 16, 16)) -> intp(3, 0, 21)
iob_intr_3_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_207), 16, 16)) -> intp(3, 0, 22)
	.word 0x91946161  ! 2816: WRPR_PIL_I	wrpr	%r17, 0x0161, %pil
iob_intr_3_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_208), 16, 16)) -> intp(3, 0, 18)
	.word 0xb5508000  ! 2818: RDPR_TSTATE	rdpr	%tstate, %r26
cpu_intr_3_240:
	setx	0x360313, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_122:
	mov	0x1a, %r14
	.word 0xf2f384a0  ! 2825: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_209), 16, 16)) -> intp(3, 0, 16)
cpu_intr_3_241:
	setx	0x350113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_210), 16, 16)) -> intp(3, 0, 16)
	.word 0xf2a54020  ! 2831: STWA_R	stwa	%r25, [%r21 + %r0] 0x01
cpu_intr_3_242:
	setx	0x360028, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_211), 16, 16)) -> intp(3, 0, 21)
	.word 0xf6ac6113  ! 2837: STBA_I	stba	%r27, [%r17 + 0x0113] %asi
T3_asi_reg_wr_123:
	mov	0x23, %r14
	.word 0xf2f38e40  ! 2839: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_wr_124:
	mov	0x3, %r14
	.word 0xfaf38e40  ! 2841: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfe242069  ! 2842: STW_I	stw	%r31, [%r16 + 0x0069]
	.word 0xfcace1d1  ! 2843: STBA_I	stba	%r30, [%r19 + 0x01d1] %asi
T3_asi_reg_wr_125:
	mov	0x3c2, %r14
	.word 0xfaf38e60  ! 2845: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T3_asi_reg_wr_126:
	mov	0x34, %r14
	.word 0xf2f38400  ! 2846: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xf22c209d  ! 2850: STB_I	stb	%r25, [%r16 + 0x009d]
	.word 0xfe244000  ! 2851: STW_R	stw	%r31, [%r17 + %r0]
	.word 0xf8b48020  ! 2854: STHA_R	stha	%r28, [%r18 + %r0] 0x01
T3_asi_reg_wr_127:
	mov	0x6, %r14
	.word 0xf4f384a0  ! 2857: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_3_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_212), 16, 16)) -> intp(3, 0, 12)
	.word 0xb42da06b  ! 2861: ANDN_I	andn 	%r22, 0x006b, %r26
	ta	T_CHANGE_TO_TL1
	.word 0xf62cc000  ! 2865: STB_R	stb	%r27, [%r19 + %r0]
	.word 0xf62ca009  ! 2868: STB_I	stb	%r27, [%r18 + 0x0009]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_213), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf625e1a8  ! 2876: STW_I	stw	%r27, [%r23 + 0x01a8]
	.word 0xfcf521b3  ! 2881: STXA_I	stxa	%r30, [%r20 + 0x01b3] %asi
	.word 0xf8f521f5  ! 2882: STXA_I	stxa	%r28, [%r20 + 0x01f5] %asi
	.word 0xf0a44020  ! 2883: STWA_R	stwa	%r24, [%r17 + %r0] 0x01
cpu_intr_3_243:
	setx	0x340104, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_110:
	mov	0x3c1, %r14
	.word 0xf6db84a0  ! 2885: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf0ade061  ! 2886: STBA_I	stba	%r24, [%r23 + 0x0061] %asi
	.word 0xfca4c020  ! 2888: STWA_R	stwa	%r30, [%r19 + %r0] 0x01
iob_intr_3_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_214), 16, 16)) -> intp(3, 0, 2d)
T3_asi_reg_wr_128:
	mov	0xe, %r14
	.word 0xf6f38e60  ! 2891: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T3_asi_reg_rd_111:
	mov	0x11, %r14
	.word 0xf4db8e40  ! 2892: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_rd_112:
	mov	0x3c8, %r14
	.word 0xf4db8e60  ! 2899: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T3_asi_reg_wr_129:
	mov	0x1f, %r14
	.word 0xf6f38e80  ! 2901: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_3_244:
	setx	0x370320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc2de0d2  ! 2903: ANDN_I	andn 	%r23, 0x00d2, %r30
	.word 0xf8a58020  ! 2906: STWA_R	stwa	%r28, [%r22 + %r0] 0x01
T3_asi_reg_wr_130:
	mov	0x3c6, %r14
	.word 0xfcf384a0  ! 2907: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_3_245:
	setx	0x370300, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_131:
	mov	0x3c1, %r14
	.word 0xf4f38400  ! 2915: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf27460ab  ! 2916: STX_I	stx	%r25, [%r17 + 0x00ab]
	.word 0xfeaca0ca  ! 2918: STBA_I	stba	%r31, [%r18 + 0x00ca] %asi
iob_intr_3_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_215), 16, 16)) -> intp(3, 0, 39)
	.word 0xfc25e10a  ! 2926: STW_I	stw	%r30, [%r23 + 0x010a]
iob_intr_3_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_216), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf6acc020  ! 2928: STBA_R	stba	%r27, [%r19 + %r0] 0x01
cpu_intr_3_246:
	setx	0x34012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2740000  ! 2932: STX_R	stx	%r25, [%r16 + %r0]
T3_asi_reg_wr_132:
	mov	0xe, %r14
	.word 0xfcf38e60  ! 2935: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_3_247:
	setx	0x360033, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_248:
	setx	0x350017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0154000  ! 2944: OR_R	or 	%r21, %r0, %r24
iob_intr_3_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_217), 16, 16)) -> intp(3, 0, b)
	.word 0xfa2d20a8  ! 2947: STB_I	stb	%r29, [%r20 + 0x00a8]
iob_intr_3_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_218), 16, 16)) -> intp(3, 0, 7)
	.word 0xfab44020  ! 2953: STHA_R	stha	%r29, [%r17 + %r0] 0x01
	.word 0xfe354000  ! 2954: STH_R	sth	%r31, [%r21 + %r0]
	.word 0xb8244000  ! 2955: SUB_R	sub 	%r17, %r0, %r28
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983c52  ! 2956: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c52, %hpstate
	.word 0xfaad0020  ! 2958: STBA_R	stba	%r29, [%r20 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf8a48020  ! 2961: STWA_R	stwa	%r28, [%r18 + %r0] 0x01
	.word 0xfa340000  ! 2963: STH_R	sth	%r29, [%r16 + %r0]
iob_intr_3_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_219), 16, 16)) -> intp(3, 0, 3)
T3_asi_reg_rd_113:
	mov	0x1, %r14
	.word 0xfedb8e40  ! 2968: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_249:
	setx	0x370225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8795a075  ! 2972: WRPR_TT_I	wrpr	%r22, 0x0075, %tt
cpu_intr_3_250:
	setx	0x340115, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_114:
	mov	0x34, %r14
	.word 0xfedb89e0  ! 2974: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_3_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_220), 16, 16)) -> intp(3, 0, 1d)
	.word 0xb97cc400  ! 2977: MOVR_R	movre	%r19, %r0, %r28
	.word 0xb014a1ae  ! 2978: OR_I	or 	%r18, 0x01ae, %r24
	.word 0xf0242146  ! 2979: STW_I	stw	%r24, [%r16 + 0x0146]
	.word 0xfcb46199  ! 2980: STHA_I	stha	%r30, [%r17 + 0x0199] %asi
	.word 0xfcacc020  ! 2981: STBA_R	stba	%r30, [%r19 + %r0] 0x01
	.word 0xbf518000  ! 2982: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xf8b5a112  ! 2984: STHA_I	stha	%r28, [%r22 + 0x0112] %asi
	.word 0xf435e097  ! 2985: STH_I	sth	%r26, [%r23 + 0x0097]
	.word 0xf0f461ab  ! 2986: STXA_I	stxa	%r24, [%r17 + 0x01ab] %asi
iob_intr_3_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_221), 16, 16)) -> intp(3, 0, 39)
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982d5a  ! 2989: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5a, %hpstate
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_133:
	mov	0x11, %r14
	.word 0xf4f38e60  ! 2991: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	ta	T_CHANGE_NONHPRIV
	.word 0xf4258000  ! 2994: STW_R	stw	%r26, [%r22 + %r0]
iob_intr_3_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_222), 16, 16)) -> intp(3, 0, 16)
	.word 0xb694c000  ! 2999: ORcc_R	orcc 	%r19, %r0, %r27
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982a4a  ! 3001: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4a, %hpstate
T3_asi_reg_rd_115:
	mov	0x3c6, %r14
	.word 0xf0db89e0  ! 3003: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf6ade08e  ! 3004: STBA_I	stba	%r27, [%r23 + 0x008e] %asi
	.word 0xf2adc020  ! 3005: STBA_R	stba	%r25, [%r23 + %r0] 0x01
T3_asi_reg_wr_134:
	mov	0x1b, %r14
	.word 0xf8f38e40  ! 3009: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_3_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_223), 16, 16)) -> intp(3, 0, 25)
T3_asi_reg_wr_135:
	mov	0x17, %r14
	.word 0xf4f389e0  ! 3019: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf835216b  ! 3023: STH_I	sth	%r28, [%r20 + 0x016b]
T3_asi_reg_wr_136:
	mov	0x10, %r14
	.word 0xfef384a0  ! 3025: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf834a006  ! 3027: STH_I	sth	%r28, [%r18 + 0x0006]
	.word 0xf825c000  ! 3029: STW_R	stw	%r28, [%r23 + %r0]
cpu_intr_3_251:
	setx	0x340001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba446071  ! 3033: ADDC_I	addc 	%r17, 0x0071, %r29
T3_asi_reg_wr_137:
	mov	0x36, %r14
	.word 0xf2f384a0  ! 3034: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T3_asi_reg_rd_116:
	mov	0x7, %r14
	.word 0xfadb8400  ! 3035: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_224), 16, 16)) -> intp(3, 0, 2a)
T3_asi_reg_rd_117:
	mov	0x2f, %r14
	.word 0xf8db8e40  ! 3038: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	ta	T_CHANGE_NONHPRIV
	.word 0xfaa5c020  ! 3040: STWA_R	stwa	%r29, [%r23 + %r0] 0x01
	.word 0xf0a50020  ! 3041: STWA_R	stwa	%r24, [%r20 + %r0] 0x01
iob_intr_3_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_225), 16, 16)) -> intp(3, 0, 19)
iob_intr_3_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_226), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_wr_138:
	mov	0x3c7, %r14
	.word 0xf2f38e40  ! 3047: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0x8d946177  ! 3049: WRPR_PSTATE_I	wrpr	%r17, 0x0177, %pstate
cpu_intr_3_252:
	setx	0x36011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02c4000  ! 3052: STB_R	stb	%r24, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_wr_139:
	mov	0x32, %r14
	.word 0xf8f38e80  ! 3055: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xfaf4208c  ! 3057: STXA_I	stxa	%r29, [%r16 + 0x008c] %asi
	.word 0xf43520e7  ! 3060: STH_I	sth	%r26, [%r20 + 0x00e7]
	.word 0xfeb56012  ! 3061: STHA_I	stha	%r31, [%r21 + 0x0012] %asi
T3_asi_reg_rd_118:
	mov	0x18, %r14
	.word 0xf4db8400  ! 3066: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T3_asi_reg_wr_140:
	mov	0x24, %r14
	.word 0xf0f384a0  ! 3074: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb1480000  ! 3076: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
iob_intr_3_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_227), 16, 16)) -> intp(3, 0, 1b)
	.word 0xfe75613e  ! 3083: STX_I	stx	%r31, [%r21 + 0x013e]
cpu_intr_3_253:
	setx	0x37022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaf5206c  ! 3087: STXA_I	stxa	%r29, [%r20 + 0x006c] %asi
	.word 0xb034e1f6  ! 3088: ORN_I	orn 	%r19, 0x01f6, %r24
	.word 0xfe2c205a  ! 3089: STB_I	stb	%r31, [%r16 + 0x005a]
cpu_intr_3_254:
	setx	0x370134, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_255:
	setx	0x370227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8a5e1c5  ! 3096: SUBcc_I	subcc 	%r23, 0x01c5, %r28
T3_asi_reg_rd_119:
	mov	0x23, %r14
	.word 0xfadb84a0  ! 3098: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf6b461d3  ! 3099: STHA_I	stha	%r27, [%r17 + 0x01d3] %asi
cpu_intr_3_256:
	setx	0x350127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc342086  ! 3102: STH_I	sth	%r30, [%r16 + 0x0086]
cpu_intr_3_257:
	setx	0x340237, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_258:
	setx	0x35030c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_259:
	setx	0x360116, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_141:
	mov	0x3c5, %r14
	.word 0xfaf38e40  ! 3106: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_3_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_228), 16, 16)) -> intp(3, 0, 1f)
cpu_intr_3_260:
	setx	0x370210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ad4020  ! 3111: STBA_R	stba	%r27, [%r21 + %r0] 0x01
iob_intr_3_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_229), 16, 16)) -> intp(3, 0, 22)
	.word 0xfa24a094  ! 3114: STW_I	stw	%r29, [%r18 + 0x0094]
	setx	data_start_1, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983f58  ! 3115: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f58, %hpstate
	.word 0xf22521a3  ! 3119: STW_I	stw	%r25, [%r20 + 0x01a3]
T3_asi_reg_rd_120:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 3120: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfe758000  ! 3121: STX_R	stx	%r31, [%r22 + %r0]
T3_asi_reg_rd_121:
	mov	0x0, %r14
	.word 0xfcdb8e60  ! 3123: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xfc250000  ! 3124: STW_R	stw	%r30, [%r20 + %r0]
cpu_intr_3_261:
	setx	0x34031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4f42017  ! 3127: STXA_I	stxa	%r26, [%r16 + 0x0017] %asi
	.word 0xba9dc000  ! 3128: XORcc_R	xorcc 	%r23, %r0, %r29
T3_asi_reg_rd_122:
	mov	0x34, %r14
	.word 0xfedb8e80  ! 3129: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_3_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_230), 16, 16)) -> intp(3, 0, 39)
iob_intr_3_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_231), 16, 16)) -> intp(3, 0, 2f)
	.word 0xfcb42124  ! 3134: STHA_I	stha	%r30, [%r16 + 0x0124] %asi
cpu_intr_3_262:
	setx	0x370204, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf8248000  ! 3139: STW_R	stw	%r28, [%r18 + %r0]
	.word 0xf42c0000  ! 3143: STB_R	stb	%r26, [%r16 + %r0]
iob_intr_3_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_232), 16, 16)) -> intp(3, 0, c)
cpu_intr_3_263:
	setx	0x370329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ac2162  ! 3147: STBA_I	stba	%r24, [%r16 + 0x0162] %asi
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf0ac8020  ! 3155: STBA_R	stba	%r24, [%r18 + %r0] 0x01
	.word 0xfef520a5  ! 3157: STXA_I	stxa	%r31, [%r20 + 0x00a5] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf8740000  ! 3160: STX_R	stx	%r28, [%r16 + %r0]
cpu_intr_3_264:
	setx	0x36013c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_123:
	mov	0x3c2, %r14
	.word 0xfadb8e60  ! 3163: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_3_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_233), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_265:
	setx	0x350016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa240000  ! 3166: STW_R	stw	%r29, [%r16 + %r0]
cpu_intr_3_266:
	setx	0x360118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc75a15f  ! 3173: STX_I	stx	%r30, [%r22 + 0x015f]
cpu_intr_3_267:
	setx	0x370026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb50020  ! 3175: STHA_R	stha	%r31, [%r20 + %r0] 0x01
T3_asi_reg_wr_142:
	mov	0x3c5, %r14
	.word 0xfef38e60  ! 3181: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_3_268:
	setx	0x36033f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_269:
	setx	0x360033, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_234), 16, 16)) -> intp(3, 0, 2f)
	.word 0xfcf4e1a9  ! 3192: STXA_I	stxa	%r30, [%r19 + 0x01a9] %asi
	.word 0xb33c8000  ! 3194: SRA_R	sra 	%r18, %r0, %r25
	.word 0xfcb4a1a0  ! 3195: STHA_I	stha	%r30, [%r18 + 0x01a0] %asi
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_124:
	mov	0x1f, %r14
	.word 0xfedb8e40  ! 3198: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_rd_125:
	mov	0x2c, %r14
	.word 0xf6db8e60  ! 3200: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb334e001  ! 3201: SRL_I	srl 	%r19, 0x0001, %r25
	ta	T_CHANGE_TO_TL1
iob_intr_3_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_235), 16, 16)) -> intp(3, 0, 35)
cpu_intr_3_270:
	setx	0x35020e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_236), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_271:
	setx	0x340024, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_237), 16, 16)) -> intp(3, 0, f)
cpu_intr_3_272:
	setx	0x340039, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_273:
	setx	0x350336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a5a0b1  ! 3225: STWA_I	stwa	%r28, [%r22 + 0x00b1] %asi
	.word 0xb2340000  ! 3226: ORN_R	orn 	%r16, %r0, %r25
	.word 0x8f902001  ! 3227: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xfab5a173  ! 3228: STHA_I	stha	%r29, [%r22 + 0x0173] %asi
	.word 0xb48da1ca  ! 3230: ANDcc_I	andcc 	%r22, 0x01ca, %r26
	.word 0xf42c6151  ! 3231: STB_I	stb	%r26, [%r17 + 0x0151]
iob_intr_3_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_238), 16, 16)) -> intp(3, 0, 3b)
iob_intr_3_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_239), 16, 16)) -> intp(3, 0, 7)
T3_asi_reg_rd_126:
	mov	0xf, %r14
	.word 0xfedb8400  ! 3237: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_3_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_240), 16, 16)) -> intp(3, 0, 35)
T3_asi_reg_rd_127:
	mov	0x2d, %r14
	.word 0xf4db8e40  ! 3239: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_274:
	setx	0x3a022c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_143:
	mov	0x6, %r14
	.word 0xf4f38e60  ! 3241: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T3_asi_reg_rd_128:
	mov	0x11, %r14
	.word 0xf4db8e40  ! 3242: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_241), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf67520ec  ! 3245: STX_I	stx	%r27, [%r20 + 0x00ec]
	.word 0xf4b5c020  ! 3246: STHA_R	stha	%r26, [%r23 + %r0] 0x01
cpu_intr_3_275:
	setx	0x3b0337, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_129:
	mov	0x15, %r14
	.word 0xfadb8e60  ! 3248: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T3_asi_reg_wr_144:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 3255: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf8f5e0dc  ! 3257: STXA_I	stxa	%r28, [%r23 + 0x00dc] %asi
iob_intr_3_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_242), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf8ace0b3  ! 3260: STBA_I	stba	%r28, [%r19 + 0x00b3] %asi
	.word 0xf2f4e0a8  ! 3261: STXA_I	stxa	%r25, [%r19 + 0x00a8] %asi
	ta	T_CHANGE_NONHPRIV
iob_intr_3_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_243), 16, 16)) -> intp(3, 0, b)
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_276:
	setx	0x3a0035, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_244), 16, 16)) -> intp(3, 0, 2)
T3_asi_reg_wr_145:
	mov	0x38, %r14
	.word 0xfcf38e40  ! 3276: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf275c000  ! 3277: STX_R	stx	%r25, [%r23 + %r0]
T3_asi_reg_rd_130:
	mov	0x3c8, %r14
	.word 0xf8db8e40  ! 3279: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_245), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_rd_131:
	mov	0x3c6, %r14
	.word 0xf2db84a0  ! 3281: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf6250000  ! 3282: STW_R	stw	%r27, [%r20 + %r0]
T3_asi_reg_rd_132:
	mov	0x2a, %r14
	.word 0xf8db84a0  ! 3283: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T3_asi_reg_wr_146:
	mov	0x1b, %r14
	.word 0xf4f38400  ! 3285: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_3_277:
	setx	0x3b0317, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_246), 16, 16)) -> intp(3, 0, e)
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
cpu_intr_3_278:
	setx	0x390132, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_247), 16, 16)) -> intp(3, 0, 3b)
	ta	T_CHANGE_NONHPRIV
	.word 0xf2b40020  ! 3298: STHA_R	stha	%r25, [%r16 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
	.word 0xb834208f  ! 3304: ORN_I	orn 	%r16, 0x008f, %r28
iob_intr_3_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_248), 16, 16)) -> intp(3, 0, 3e)
	.word 0xfcace1c4  ! 3309: STBA_I	stba	%r30, [%r19 + 0x01c4] %asi
iob_intr_3_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_249), 16, 16)) -> intp(3, 0, 4)
iob_intr_3_250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_250), 16, 16)) -> intp(3, 0, 1e)
cpu_intr_3_279:
	setx	0x3a0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_3_280:
	setx	0x3b010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_147:
	mov	0x3c0, %r14
	.word 0xf6f384a0  ! 3323: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_251), 16, 16)) -> intp(3, 0, 18)
	.word 0xb01421d1  ! 3330: OR_I	or 	%r16, 0x01d1, %r24
T3_asi_reg_wr_148:
	mov	0x3c1, %r14
	.word 0xfaf389e0  ! 3332: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_3_281:
	setx	0x12f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_282:
	setx	0x3b030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4c4618d  ! 3339: ADDCcc_I	addccc 	%r17, 0x018d, %r26
	.word 0xfab4e10a  ! 3340: STHA_I	stha	%r29, [%r19 + 0x010a] %asi
	.word 0xf275a124  ! 3346: STX_I	stx	%r25, [%r22 + 0x0124]
cpu_intr_3_283:
	setx	0x380029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_252), 16, 16)) -> intp(3, 0, 12)
	.word 0xf8b4a0c0  ! 3354: STHA_I	stha	%r28, [%r18 + 0x00c0] %asi
iob_intr_3_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_253), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_wr_149:
	mov	0x3c8, %r14
	.word 0xfaf38e80  ! 3359: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf8248000  ! 3361: STW_R	stw	%r28, [%r18 + %r0]
T3_asi_reg_rd_133:
	mov	0x3c4, %r14
	.word 0xfcdb84a0  ! 3362: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_3_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_254), 16, 16)) -> intp(3, 0, b)
	.word 0xf62c604d  ! 3370: STB_I	stb	%r27, [%r17 + 0x004d]
cpu_intr_3_284:
	setx	0x3a020b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_134:
	mov	0x31, %r14
	.word 0xf6db8e40  ! 3373: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_3_255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_255), 16, 16)) -> intp(3, 0, 6)
	.word 0xb8b4c000  ! 3375: SUBCcc_R	orncc 	%r19, %r0, %r28
cpu_intr_3_285:
	setx	0x3a0109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2ca085  ! 3380: STB_I	stb	%r31, [%r18 + 0x0085]
	.word 0xb2952056  ! 3382: ORcc_I	orcc 	%r20, 0x0056, %r25
	.word 0xf0254000  ! 3383: STW_R	stw	%r24, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_286:
	setx	0x3a0128, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_256), 16, 16)) -> intp(3, 0, 3b)
iob_intr_3_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_257), 16, 16)) -> intp(3, 0, 2d)
iob_intr_3_258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_258), 16, 16)) -> intp(3, 0, 36)
cpu_intr_3_287:
	setx	0x390019, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_288:
	setx	0x3a022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfe35c000  ! 3399: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xbe15e1ae  ! 3401: OR_I	or 	%r23, 0x01ae, %r31
	.word 0xf2b40020  ! 3402: STHA_R	stha	%r25, [%r16 + %r0] 0x01
	.word 0xf82c20d5  ! 3403: STB_I	stb	%r28, [%r16 + 0x00d5]
cpu_intr_3_289:
	setx	0x390135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf074e1f7  ! 3409: STX_I	stx	%r24, [%r19 + 0x01f7]
T3_asi_reg_rd_135:
	mov	0x22, %r14
	.word 0xfadb8e40  ! 3413: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_150:
	mov	0x2d, %r14
	.word 0xfaf389e0  ! 3415: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_wr_151:
	mov	0x3c2, %r14
	.word 0xf8f389e0  ! 3418: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xfc74c000  ! 3419: STX_R	stx	%r30, [%r19 + %r0]
iob_intr_3_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_259), 16, 16)) -> intp(3, 0, 38)
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982f0a  ! 3422: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0a, %hpstate
T3_asi_reg_wr_152:
	mov	0x1e, %r14
	.word 0xfef384a0  ! 3423: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf6254000  ! 3425: STW_R	stw	%r27, [%r21 + %r0]
	.word 0xba140000  ! 3428: OR_R	or 	%r16, %r0, %r29
iob_intr_3_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_260), 16, 16)) -> intp(3, 0, 38)
	.word 0xfab4e006  ! 3431: STHA_I	stha	%r29, [%r19 + 0x0006] %asi
cpu_intr_3_290:
	setx	0x380318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0ad211b  ! 3436: ANDNcc_I	andncc 	%r20, 0x011b, %r24
T3_asi_reg_wr_153:
	mov	0x1b, %r14
	.word 0xfef389e0  ! 3438: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T3_asi_reg_wr_154:
	mov	0x22, %r14
	.word 0xf8f38400  ! 3440: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T3_asi_reg_rd_136:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 3441: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf4358000  ! 3442: STH_R	sth	%r26, [%r22 + %r0]
	.word 0xfeb48020  ! 3445: STHA_R	stha	%r31, [%r18 + %r0] 0x01
cpu_intr_3_291:
	setx	0x380233, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_261), 16, 16)) -> intp(3, 0, 12)
iob_intr_3_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_262), 16, 16)) -> intp(3, 0, 3b)
	.word 0xb1510000  ! 3452: RDPR_TICK	rdpr	%tick, %r24
T3_asi_reg_rd_137:
	mov	0x18, %r14
	.word 0xfcdb8e80  ! 3456: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb824e1ac  ! 3459: SUB_I	sub 	%r19, 0x01ac, %r28
	.word 0xfeb4e166  ! 3461: STHA_I	stha	%r31, [%r19 + 0x0166] %asi
T3_asi_reg_rd_138:
	mov	0x3c2, %r14
	.word 0xfcdb84a0  ! 3462: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf2b5e0f2  ! 3466: STHA_I	stha	%r25, [%r23 + 0x00f2] %asi
	.word 0xf82d21ac  ! 3467: STB_I	stb	%r28, [%r20 + 0x01ac]
	ta	T_CHANGE_HPRIV
	.word 0xfa258000  ! 3474: STW_R	stw	%r29, [%r22 + %r0]
	.word 0xf425c000  ! 3477: STW_R	stw	%r26, [%r23 + %r0]
	.word 0xfa2d0000  ! 3481: STB_R	stb	%r29, [%r20 + %r0]
T3_asi_reg_wr_155:
	mov	0x3c7, %r14
	.word 0xfcf38e80  ! 3482: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T3_asi_reg_rd_139:
	mov	0x36, %r14
	.word 0xfedb84a0  ! 3483: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_292:
	setx	0x390211, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_263), 16, 16)) -> intp(3, 0, 14)
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_140:
	mov	0x33, %r14
	.word 0xf2db8e60  ! 3490: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_3_293:
	setx	0x3a0326, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983a8a  ! 3494: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a8a, %hpstate
	.word 0xb034213c  ! 3495: ORN_I	orn 	%r16, 0x013c, %r24
	.word 0xfe35601b  ! 3496: STH_I	sth	%r31, [%r21 + 0x001b]
cpu_intr_3_294:
	setx	0x39032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2c200c  ! 3500: STB_I	stb	%r29, [%r16 + 0x000c]
iob_intr_3_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_264), 16, 16)) -> intp(3, 0, 10)
	.word 0xb41d60ef  ! 3502: XOR_I	xor 	%r21, 0x00ef, %r26
	.word 0xfc34e056  ! 3504: STH_I	sth	%r30, [%r19 + 0x0056]
T3_asi_reg_rd_141:
	mov	0x2a, %r14
	.word 0xfcdb89e0  ! 3505: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf0adc020  ! 3506: STBA_R	stba	%r24, [%r23 + %r0] 0x01
	.word 0xbeac610c  ! 3507: ANDNcc_I	andncc 	%r17, 0x010c, %r31
	.word 0xf2748000  ! 3508: STX_R	stx	%r25, [%r18 + %r0]
T3_asi_reg_wr_156:
	mov	0x21, %r14
	.word 0xf0f384a0  ! 3509: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb2bdc000  ! 3511: XNORcc_R	xnorcc 	%r23, %r0, %r25
	ta	T_CHANGE_NONHPRIV
	.word 0xf22c4000  ! 3519: STB_R	stb	%r25, [%r17 + %r0]
T3_asi_reg_wr_157:
	mov	0x1b, %r14
	.word 0xfef38e60  ! 3521: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf835c000  ! 3522: STH_R	sth	%r28, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
cpu_intr_3_295:
	setx	0x38000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_142:
	mov	0x31, %r14
	.word 0xfcdb84a0  ! 3530: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_3_296:
	setx	0x3a021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_143:
	mov	0x6, %r14
	.word 0xf0db84a0  ! 3534: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	ta	T_CHANGE_NONHPRIV
iob_intr_3_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_265), 16, 16)) -> intp(3, 0, c)
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xbd2d7001  ! 3540: SLLX_I	sllx	%r21, 0x0001, %r30
	.word 0xfcb48020  ! 3541: STHA_R	stha	%r30, [%r18 + %r0] 0x01
T3_asi_reg_rd_144:
	mov	0x9, %r14
	.word 0xfcdb8e80  ! 3543: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf234c000  ! 3545: STH_R	sth	%r25, [%r19 + %r0]
	ta	T_CHANGE_TO_TL0
	.word 0xfe346081  ! 3548: STH_I	sth	%r31, [%r17 + 0x0081]
cpu_intr_3_297:
	setx	0x38031a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_145:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 3550: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_3_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_266), 16, 16)) -> intp(3, 0, 0)
cpu_intr_3_298:
	setx	0x390334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa35a00b  ! 3553: STH_I	sth	%r29, [%r22 + 0x000b]
	.word 0xb0048000  ! 3554: ADD_R	add 	%r18, %r0, %r24
	.word 0xfa24c000  ! 3555: STW_R	stw	%r29, [%r19 + %r0]
cpu_intr_3_299:
	setx	0x3a0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe358000  ! 3560: STH_R	sth	%r31, [%r22 + %r0]
iob_intr_3_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_267), 16, 16)) -> intp(3, 0, 12)
	.word 0xfaf520ef  ! 3563: STXA_I	stxa	%r29, [%r20 + 0x00ef] %asi
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb6854000  ! 3569: ADDcc_R	addcc 	%r21, %r0, %r27
cpu_intr_3_300:
	setx	0x380208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf27520e6  ! 3573: STX_I	stx	%r25, [%r20 + 0x00e6]
	.word 0xb2154000  ! 3575: OR_R	or 	%r21, %r0, %r25
	.word 0xfaa58020  ! 3576: STWA_R	stwa	%r29, [%r22 + %r0] 0x01
	.word 0xb6a4e0bd  ! 3579: SUBcc_I	subcc 	%r19, 0x00bd, %r27
	.word 0xf8b48020  ! 3583: STHA_R	stha	%r28, [%r18 + %r0] 0x01
cpu_intr_3_301:
	setx	0x38033c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_302:
	setx	0x390317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b4a18e  ! 3588: STHA_I	stha	%r27, [%r18 + 0x018e] %asi
cpu_intr_3_303:
	setx	0x38032b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_268), 16, 16)) -> intp(3, 0, b)
iob_intr_3_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_269), 16, 16)) -> intp(3, 0, 39)
	.word 0xfab54020  ! 3596: STHA_R	stha	%r29, [%r21 + %r0] 0x01
	.word 0xf6ada0bc  ! 3598: STBA_I	stba	%r27, [%r22 + 0x00bc] %asi
iob_intr_3_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_270), 16, 16)) -> intp(3, 0, 1b)
T3_asi_reg_wr_158:
	mov	0x1c, %r14
	.word 0xf6f38400  ! 3600: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb13d5000  ! 3601: SRAX_R	srax	%r21, %r0, %r24
T3_asi_reg_rd_146:
	mov	0x3c0, %r14
	.word 0xfadb8e40  ! 3602: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_3_271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_271), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_rd_147:
	mov	0x2f, %r14
	.word 0xf0db8e40  ! 3606: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb72d3001  ! 3607: SLLX_I	sllx	%r20, 0x0001, %r27
iob_intr_3_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_272), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_wr_159:
	mov	0x22, %r14
	.word 0xf2f38400  ! 3612: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T3_asi_reg_wr_160:
	mov	0x37, %r14
	.word 0xf6f38e40  ! 3613: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb0046070  ! 3616: ADD_I	add 	%r17, 0x0070, %r24
iob_intr_3_273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_273), 16, 16)) -> intp(3, 0, d)
cpu_intr_3_304:
	setx	0x3a002a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_305:
	setx	0x39000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0244000  ! 3621: STW_R	stw	%r24, [%r17 + %r0]
	.word 0xfa7560ae  ! 3622: STX_I	stx	%r29, [%r21 + 0x00ae]
	.word 0xf4b5603e  ! 3625: STHA_I	stha	%r26, [%r21 + 0x003e] %asi
	.word 0xb6bcc000  ! 3631: XNORcc_R	xnorcc 	%r19, %r0, %r27
T3_asi_reg_wr_161:
	mov	0x3c0, %r14
	.word 0xfaf38400  ! 3632: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_3_306:
	setx	0x3b0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa24e022  ! 3636: STW_I	stw	%r29, [%r19 + 0x0022]
iob_intr_3_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_274), 16, 16)) -> intp(3, 0, 17)
	.word 0xb92d8000  ! 3641: SLL_R	sll 	%r22, %r0, %r28
	.word 0xb4a5c000  ! 3644: SUBcc_R	subcc 	%r23, %r0, %r26
T3_asi_reg_rd_148:
	mov	0x3c2, %r14
	.word 0xf6db8400  ! 3645: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T3_asi_reg_rd_149:
	mov	0x7, %r14
	.word 0xfcdb8400  ! 3646: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf8f46102  ! 3649: STXA_I	stxa	%r28, [%r17 + 0x0102] %asi
iob_intr_3_275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_275), 16, 16)) -> intp(3, 0, 10)
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982d9a  ! 3653: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9a, %hpstate
	.word 0xf8b5c020  ! 3655: STHA_R	stha	%r28, [%r23 + %r0] 0x01
iob_intr_3_276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_276), 16, 16)) -> intp(3, 0, 1)
cpu_intr_3_307:
	setx	0x3a0237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb40c8000  ! 3660: AND_R	and 	%r18, %r0, %r26
	.word 0xf62ce02d  ! 3664: STB_I	stb	%r27, [%r19 + 0x002d]
	.word 0xf0b4a199  ! 3670: STHA_I	stha	%r24, [%r18 + 0x0199] %asi
cpu_intr_3_308:
	setx	0x3b003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf674e1b8  ! 3673: STX_I	stx	%r27, [%r19 + 0x01b8]
	.word 0xfa2ce0de  ! 3674: STB_I	stb	%r29, [%r19 + 0x00de]
	.word 0xfe746134  ! 3678: STX_I	stx	%r31, [%r17 + 0x0134]
	.word 0xbabc2055  ! 3679: XNORcc_I	xnorcc 	%r16, 0x0055, %r29
	.word 0xf42de0bb  ! 3680: STB_I	stb	%r26, [%r23 + 0x00bb]
T3_asi_reg_rd_150:
	mov	0x23, %r14
	.word 0xf4db8e40  ! 3681: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_309:
	setx	0x3a022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4144000  ! 3685: OR_R	or 	%r17, %r0, %r26
	.word 0xfcf521fe  ! 3688: STXA_I	stxa	%r30, [%r20 + 0x01fe] %asi
iob_intr_3_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_277), 16, 16)) -> intp(3, 0, 31)
	.word 0xfe2ca14c  ! 3694: STB_I	stb	%r31, [%r18 + 0x014c]
	.word 0xfcac2152  ! 3695: STBA_I	stba	%r30, [%r16 + 0x0152] %asi
T3_asi_reg_rd_151:
	mov	0x1b, %r14
	.word 0xfedb8e60  ! 3697: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T3_asi_reg_rd_152:
	mov	0x6, %r14
	.word 0xfcdb89e0  ! 3698: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf0b5c020  ! 3701: STHA_R	stha	%r24, [%r23 + %r0] 0x01
T3_asi_reg_wr_162:
	mov	0x18, %r14
	.word 0xf8f384a0  ! 3702: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_3_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_278), 16, 16)) -> intp(3, 0, 2f)
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_310:
	setx	0x3c0011, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_153:
	mov	0x33, %r14
	.word 0xf2db89e0  ! 3714: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xfe2ca0ad  ! 3716: STB_I	stb	%r31, [%r18 + 0x00ad]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_wr_163:
	mov	0x3c8, %r14
	.word 0xf4f389e0  ! 3719: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf024c000  ! 3720: STW_R	stw	%r24, [%r19 + %r0]
T3_asi_reg_rd_154:
	mov	0x1f, %r14
	.word 0xfadb8e40  ! 3721: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf22d0000  ! 3722: STB_R	stb	%r25, [%r20 + %r0]
T3_asi_reg_wr_164:
	mov	0x32, %r14
	.word 0xf0f38e80  ! 3729: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T3_asi_reg_wr_165:
	mov	0x3c5, %r14
	.word 0xfef38e80  ! 3730: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb43c4000  ! 3733: XNOR_R	xnor 	%r17, %r0, %r26
	.word 0xf6a4c020  ! 3734: STWA_R	stwa	%r27, [%r19 + %r0] 0x01
cpu_intr_3_311:
	setx	0x3e0100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ada165  ! 3740: STBA_I	stba	%r24, [%r22 + 0x0165] %asi
iob_intr_3_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_279), 16, 16)) -> intp(3, 0, 16)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_312:
	setx	0x3f0113, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_155:
	mov	0x37, %r14
	.word 0xf4db8e60  ! 3746: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_3_313:
	setx	0x3d0112, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_314:
	setx	0x3e0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2244000  ! 3753: STW_R	stw	%r25, [%r17 + %r0]
T3_asi_reg_wr_166:
	mov	0x8, %r14
	.word 0xfef38e60  ! 3758: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T3_asi_reg_rd_156:
	mov	0x11, %r14
	.word 0xf6db84a0  ! 3760: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf4ac206e  ! 3761: STBA_I	stba	%r26, [%r16 + 0x006e] %asi
	.word 0xfcad21ed  ! 3762: STBA_I	stba	%r30, [%r20 + 0x01ed] %asi
	.word 0xfe2d20b8  ! 3766: STB_I	stb	%r31, [%r20 + 0x00b8]
T3_asi_reg_wr_167:
	mov	0x11, %r14
	.word 0xf8f38e40  ! 3771: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL0
cpu_intr_3_315:
	setx	0x3f0030, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_316:
	setx	0x3f0107, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x8198384a  ! 3784: WRHPR_HPSTATE_I	wrhpr	%r0, 0x184a, %hpstate
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983b90  ! 3788: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b90, %hpstate
	.word 0xf4b5e0bd  ! 3790: STHA_I	stha	%r26, [%r23 + 0x00bd] %asi
cpu_intr_3_317:
	setx	0x3c0225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe758000  ! 3793: STX_R	stx	%r31, [%r22 + %r0]
cpu_intr_3_318:
	setx	0x3d0011, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_319:
	setx	0x3c023d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_280), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_320:
	setx	0x3e0112, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_157:
	mov	0x7, %r14
	.word 0xf2db8400  ! 3807: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_3_321:
	setx	0x3c021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_281), 16, 16)) -> intp(3, 0, 38)
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983a58  ! 3818: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a58, %hpstate
	.word 0xf22d60e4  ! 3819: STB_I	stb	%r25, [%r21 + 0x00e4]
	.word 0xf8754000  ! 3820: STX_R	stx	%r28, [%r21 + %r0]
	.word 0xf0a5a0cd  ! 3822: STWA_I	stwa	%r24, [%r22 + 0x00cd] %asi
	.word 0xfca4614c  ! 3826: STWA_I	stwa	%r30, [%r17 + 0x014c] %asi
	.word 0xfc34a17a  ! 3830: STH_I	sth	%r30, [%r18 + 0x017a]
iob_intr_3_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_282), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_322:
	setx	0x3c031c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_323:
	setx	0x3f022e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_324:
	setx	0x3c0336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf024215b  ! 3839: STW_I	stw	%r24, [%r16 + 0x015b]
	.word 0xf825c000  ! 3843: STW_R	stw	%r28, [%r23 + %r0]
T3_asi_reg_wr_168:
	mov	0x3c5, %r14
	.word 0xf6f38e40  ! 3846: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_3_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_283), 16, 16)) -> intp(3, 0, d)
	.word 0xf875e028  ! 3848: STX_I	stx	%r28, [%r23 + 0x0028]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfea5a065  ! 3850: STWA_I	stwa	%r31, [%r22 + 0x0065] %asi
cpu_intr_3_325:
	setx	0x3c0112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a42033  ! 3852: STWA_I	stwa	%r27, [%r16 + 0x0033] %asi
	.word 0xf22ca185  ! 3854: STB_I	stb	%r25, [%r18 + 0x0185]
T3_asi_reg_wr_169:
	mov	0x3c7, %r14
	.word 0xfaf38e40  ! 3859: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_3_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_284), 16, 16)) -> intp(3, 0, 1d)
	.word 0xfcb44020  ! 3862: STHA_R	stha	%r30, [%r17 + %r0] 0x01
	.word 0xb6a42026  ! 3863: SUBcc_I	subcc 	%r16, 0x0026, %r27
cpu_intr_3_326:
	setx	0x3d0138, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982948  ! 3865: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0948, %hpstate
	.word 0xf0350000  ! 3866: STH_R	sth	%r24, [%r20 + %r0]
	.word 0xb015e1c6  ! 3867: OR_I	or 	%r23, 0x01c6, %r24
	.word 0xfe356086  ! 3868: STH_I	sth	%r31, [%r21 + 0x0086]
	.word 0xfaad6026  ! 3869: STBA_I	stba	%r29, [%r21 + 0x0026] %asi
T3_asi_reg_wr_170:
	mov	0x8, %r14
	.word 0xfcf38400  ! 3871: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xf4ac0020  ! 3874: STBA_R	stba	%r26, [%r16 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_158:
	mov	0x19, %r14
	.word 0xf4db8e60  ! 3879: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	ta	T_CHANGE_NONHPRIV
	.word 0xfe75205e  ! 3882: STX_I	stx	%r31, [%r20 + 0x005e]
	.word 0xf4a46074  ! 3883: STWA_I	stwa	%r26, [%r17 + 0x0074] %asi
	.word 0xfaacc020  ! 3885: STBA_R	stba	%r29, [%r19 + %r0] 0x01
T3_asi_reg_rd_159:
	mov	0x2a, %r14
	.word 0xf8db8e40  ! 3886: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfa2ce1c0  ! 3887: STB_I	stb	%r29, [%r19 + 0x01c0]
cpu_intr_3_327:
	setx	0x3e0200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf274610e  ! 3897: STX_I	stx	%r25, [%r17 + 0x010e]
	.word 0xfaf420a3  ! 3898: STXA_I	stxa	%r29, [%r16 + 0x00a3] %asi
iob_intr_3_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_285), 16, 16)) -> intp(3, 0, 9)
T3_asi_reg_rd_160:
	mov	0x3c2, %r14
	.word 0xf4db8e80  ! 3900: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	ta	T_CHANGE_NONHPRIV
	.word 0xbd3dd000  ! 3902: SRAX_R	srax	%r23, %r0, %r30
T3_asi_reg_wr_171:
	mov	0x1a, %r14
	.word 0xf0f384a0  ! 3906: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T3_asi_reg_rd_161:
	mov	0x11, %r14
	.word 0xf0db8e80  ! 3910: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_3_328:
	setx	0x3e0107, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_329:
	setx	0x3e0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf675e022  ! 3914: STX_I	stx	%r27, [%r23 + 0x0022]
	.word 0xfef5e0b5  ! 3917: STXA_I	stxa	%r31, [%r23 + 0x00b5] %asi
	ta	T_CHANGE_HPRIV
	.word 0xf0b44020  ! 3922: STHA_R	stha	%r24, [%r17 + %r0] 0x01
	.word 0xfc2dc000  ! 3923: STB_R	stb	%r30, [%r23 + %r0]
cpu_intr_3_330:
	setx	0x3f0232, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_172:
	mov	0x13, %r14
	.word 0xf2f38e40  ! 3928: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_3_331:
	setx	0x3d002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8744000  ! 3931: STX_R	stx	%r28, [%r17 + %r0]
T3_asi_reg_rd_162:
	mov	0x2e, %r14
	.word 0xf4db8e60  ! 3935: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_3_332:
	setx	0x3f0231, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_333:
	setx	0x13c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe75618e  ! 3940: STX_I	stx	%r31, [%r21 + 0x018e]
iob_intr_3_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_286), 16, 16)) -> intp(3, 0, f)
cpu_intr_3_334:
	setx	0x3c0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba85c000  ! 3947: ADDcc_R	addcc 	%r23, %r0, %r29
T3_asi_reg_rd_163:
	mov	0x35, %r14
	.word 0xf4db89e0  ! 3948: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_3_335:
	setx	0x3d0134, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_336:
	setx	0x3c0219, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_287), 16, 16)) -> intp(3, 0, 3c)
iob_intr_3_288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_288), 16, 16)) -> intp(3, 0, 1d)
	.word 0xfc34e1d6  ! 3958: STH_I	sth	%r30, [%r19 + 0x01d6]
iob_intr_3_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_289), 16, 16)) -> intp(3, 0, 33)
	.word 0xf03560d7  ! 3961: STH_I	sth	%r24, [%r21 + 0x00d7]
	.word 0xbf641800  ! 3962: MOVcc_R	<illegal instruction>
	.word 0xf8b5613d  ! 3966: STHA_I	stha	%r28, [%r21 + 0x013d] %asi
T3_asi_reg_wr_173:
	mov	0x14, %r14
	.word 0xfef384a0  ! 3968: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_3_337:
	setx	0x3f0224, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982d10  ! 3974: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d10, %hpstate
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_338:
	setx	0x3e012a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_290), 16, 16)) -> intp(3, 0, 2f)
cpu_intr_3_339:
	setx	0x3d0134, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_340:
	setx	0x3f0337, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_341:
	setx	0x3f030d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_291), 16, 16)) -> intp(3, 0, 29)
T3_asi_reg_rd_164:
	mov	0x16, %r14
	.word 0xfcdb8e60  ! 3990: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb83d0000  ! 3991: XNOR_R	xnor 	%r20, %r0, %r28
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983c10  ! 3992: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c10, %hpstate
T3_asi_reg_wr_174:
	mov	0x3c4, %r14
	.word 0xfcf38e80  ! 3994: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xfc2c0000  ! 3995: STB_R	stb	%r30, [%r16 + %r0]
T3_asi_reg_wr_175:
	mov	0x3c8, %r14
	.word 0xf6f38e40  ! 3997: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf8256135  ! 3998: STW_I	stw	%r28, [%r21 + 0x0135]
T3_asi_reg_rd_165:
	mov	0x2c, %r14
	.word 0xf8db8e60  ! 3999: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T3_asi_reg_rd_166:
	mov	0x3c3, %r14
	.word 0xfedb89e0  ! 4002: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_3_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_292), 16, 16)) -> intp(3, 0, 18)
	.word 0x8f902000  ! 4006: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
iob_intr_3_293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_293), 16, 16)) -> intp(3, 0, 12)
	.word 0xfa2ce103  ! 4009: STB_I	stb	%r29, [%r19 + 0x0103]
	.word 0xf435c000  ! 4011: STH_R	sth	%r26, [%r23 + %r0]
	.word 0xf22da12b  ! 4013: STB_I	stb	%r25, [%r22 + 0x012b]
cpu_intr_3_342:
	setx	0x3e0322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe740000  ! 4015: STX_R	stx	%r31, [%r16 + %r0]
T3_asi_reg_wr_176:
	mov	0x37, %r14
	.word 0xf6f38400  ! 4016: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_3_343:
	setx	0x3d010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_167:
	mov	0x32, %r14
	.word 0xfedb8e40  ! 4018: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf6240000  ! 4020: STW_R	stw	%r27, [%r16 + %r0]
cpu_intr_3_344:
	setx	0x3d0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_177:
	mov	0x3c7, %r14
	.word 0xfcf38e40  ! 4034: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf0b5e031  ! 4038: STHA_I	stha	%r24, [%r23 + 0x0031] %asi
cpu_intr_3_345:
	setx	0x3d0018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4244000  ! 4040: STW_R	stw	%r26, [%r17 + %r0]
T3_asi_reg_wr_178:
	mov	0xe, %r14
	.word 0xf8f38e40  ! 4041: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983c52  ! 4043: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c52, %hpstate
	.word 0xb4aca071  ! 4046: ANDNcc_I	andncc 	%r18, 0x0071, %r26
cpu_intr_3_346:
	setx	0x3f003b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_294), 16, 16)) -> intp(3, 0, 7)
	.word 0xf2248000  ! 4049: STW_R	stw	%r25, [%r18 + %r0]
	.word 0xf8ac8020  ! 4050: STBA_R	stba	%r28, [%r18 + %r0] 0x01
	.word 0xf625e07a  ! 4055: STW_I	stw	%r27, [%r23 + 0x007a]
	.word 0xb295c000  ! 4056: ORcc_R	orcc 	%r23, %r0, %r25
cpu_intr_3_347:
	setx	0x3d0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf2b48020  ! 4064: STHA_R	stha	%r25, [%r18 + %r0] 0x01
cpu_intr_3_348:
	setx	0x3e0000, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_295), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf82de08e  ! 4068: STB_I	stb	%r28, [%r23 + 0x008e]
	.word 0xfa25a106  ! 4069: STW_I	stw	%r29, [%r22 + 0x0106]
	.word 0xf2ac4020  ! 4070: STBA_R	stba	%r25, [%r17 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
iob_intr_3_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_296), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_rd_168:
	mov	0x3c0, %r14
	.word 0xf8db8400  ! 4075: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xf6ad6137  ! 4077: STBA_I	stba	%r27, [%r21 + 0x0137] %asi
iob_intr_3_297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_297), 16, 16)) -> intp(3, 0, 14)
cpu_intr_3_349:
	setx	0x3f012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f4a085  ! 4081: STXA_I	stxa	%r25, [%r18 + 0x0085] %asi
cpu_intr_3_350:
	setx	0x3e0018, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_179:
	mov	0x1f, %r14
	.word 0xf2f38400  ! 4084: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb295e184  ! 4086: ORcc_I	orcc 	%r23, 0x0184, %r25
	.word 0xf63560fb  ! 4089: STH_I	sth	%r27, [%r21 + 0x00fb]
	.word 0xf4aca032  ! 4091: STBA_I	stba	%r26, [%r18 + 0x0032] %asi
cpu_intr_3_351:
	setx	0x3e0209, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_298), 16, 16)) -> intp(3, 0, 26)
cpu_intr_3_352:
	setx	0x3d0103, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_169:
	mov	0x8, %r14
	.word 0xf8db8400  ! 4101: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xfe2d21c6  ! 4102: STB_I	stb	%r31, [%r20 + 0x01c6]
iob_intr_3_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_299), 16, 16)) -> intp(3, 0, 9)
	.word 0xfaa44020  ! 4105: STWA_R	stwa	%r29, [%r17 + %r0] 0x01
	.word 0xfe34604b  ! 4106: STH_I	sth	%r31, [%r17 + 0x004b]
iob_intr_3_300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_300), 16, 16)) -> intp(3, 0, 26)
	.word 0xfaadc020  ! 4109: STBA_R	stba	%r29, [%r23 + %r0] 0x01
	.word 0xfca52144  ! 4110: STWA_I	stwa	%r30, [%r20 + 0x0144] %asi
	.word 0xfaad0020  ! 4113: STBA_R	stba	%r29, [%r20 + %r0] 0x01
	.word 0xb20de08f  ! 4115: AND_I	and 	%r23, 0x008f, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb644a1d5  ! 4118: ADDC_I	addc 	%r18, 0x01d5, %r27
	.word 0xf2a4609a  ! 4120: STWA_I	stwa	%r25, [%r17 + 0x009a] %asi
cpu_intr_3_353:
	setx	0x3e0306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b52016  ! 4124: STHA_I	stha	%r24, [%r20 + 0x0016] %asi
cpu_intr_3_354:
	setx	0x3e0327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc740000  ! 4130: STX_R	stx	%r30, [%r16 + %r0]
cpu_intr_3_355:
	setx	0x3f021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8844000  ! 4132: ADDcc_R	addcc 	%r17, %r0, %r28
	.word 0xfe348000  ! 4135: STH_R	sth	%r31, [%r18 + %r0]
	.word 0xfeb48020  ! 4136: STHA_R	stha	%r31, [%r18 + %r0] 0x01
T3_asi_reg_rd_170:
	mov	0x19, %r14
	.word 0xf4db8400  ! 4137: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xfe750000  ! 4138: STX_R	stx	%r31, [%r20 + %r0]
T3_asi_reg_rd_171:
	mov	0x0, %r14
	.word 0xfedb8400  ! 4145: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_3_301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_301), 16, 16)) -> intp(3, 0, 4)
cpu_intr_3_356:
	setx	0x410337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf03520e9  ! 4159: STH_I	sth	%r24, [%r20 + 0x00e9]
T3_asi_reg_wr_180:
	mov	0x7, %r14
	.word 0xf4f38e60  ! 4160: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T3_asi_reg_rd_172:
	mov	0x27, %r14
	.word 0xf2db89e0  ! 4161: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xfca54020  ! 4163: STWA_R	stwa	%r30, [%r21 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_302), 16, 16)) -> intp(3, 0, 16)
	.word 0xf2a4e155  ! 4170: STWA_I	stwa	%r25, [%r19 + 0x0155] %asi
	.word 0xf4a5c020  ! 4173: STWA_R	stwa	%r26, [%r23 + %r0] 0x01
iob_intr_3_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_303), 16, 16)) -> intp(3, 0, 10)
iob_intr_3_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_304), 16, 16)) -> intp(3, 0, 22)
T3_asi_reg_rd_173:
	mov	0x16, %r14
	.word 0xfadb84a0  ! 4180: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_3_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_305), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf4a4213c  ! 4182: STWA_I	stwa	%r26, [%r16 + 0x013c] %asi
	.word 0xf8b4e149  ! 4183: STHA_I	stha	%r28, [%r19 + 0x0149] %asi
cpu_intr_3_357:
	setx	0x410007, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_181:
	mov	0x3c0, %r14
	.word 0xf8f384a0  ! 4188: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_3_306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_306), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf625e058  ! 4192: STW_I	stw	%r27, [%r23 + 0x0058]
cpu_intr_3_358:
	setx	0x420236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8394a1ca  ! 4202: WRPR_TNPC_I	wrpr	%r18, 0x01ca, %tnpc
cpu_intr_3_359:
	setx	0x400216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb5a1dd  ! 4207: STHA_I	stha	%r31, [%r22 + 0x01dd] %asi
T3_asi_reg_wr_182:
	mov	0x24, %r14
	.word 0xfef38e80  ! 4208: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb68d8000  ! 4210: ANDcc_R	andcc 	%r22, %r0, %r27
	.word 0xb6b4609d  ! 4212: ORNcc_I	orncc 	%r17, 0x009d, %r27
cpu_intr_3_360:
	setx	0x43030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf635619d  ! 4216: STH_I	sth	%r27, [%r21 + 0x019d]
T3_asi_reg_wr_183:
	mov	0x3c8, %r14
	.word 0xfaf389e0  ! 4218: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xfe252080  ! 4220: STW_I	stw	%r31, [%r20 + 0x0080]
cpu_intr_3_361:
	setx	0x40033f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_184:
	mov	0x4, %r14
	.word 0xf6f38e40  ! 4222: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_3_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_307), 16, 16)) -> intp(3, 0, 20)
	.word 0xb035c000  ! 4229: ORN_R	orn 	%r23, %r0, %r24
T3_asi_reg_wr_185:
	mov	0xa, %r14
	.word 0xfef389e0  ! 4232: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_3_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_308), 16, 16)) -> intp(3, 0, 3c)
	.word 0xbc8dc000  ! 4235: ANDcc_R	andcc 	%r23, %r0, %r30
cpu_intr_3_362:
	setx	0x420333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc244000  ! 4240: STW_R	stw	%r30, [%r17 + %r0]
T3_asi_reg_wr_186:
	mov	0x20, %r14
	.word 0xf2f38e60  ! 4243: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T3_asi_reg_rd_174:
	mov	0x7, %r14
	.word 0xfcdb8e80  ! 4245: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	ta	T_CHANGE_NONHPRIV
	.word 0xfcb520a3  ! 4247: STHA_I	stha	%r30, [%r20 + 0x00a3] %asi
	.word 0xf6a4c020  ! 4250: STWA_R	stwa	%r27, [%r19 + %r0] 0x01
	.word 0xb8248000  ! 4252: SUB_R	sub 	%r18, %r0, %r28
iob_intr_3_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_309), 16, 16)) -> intp(3, 0, 3e)
T3_asi_reg_rd_175:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 4256: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_3_363:
	setx	0x430213, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_187:
	mov	0xa, %r14
	.word 0xfcf38e40  ! 4259: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfcb44020  ! 4260: STHA_R	stha	%r30, [%r17 + %r0] 0x01
cpu_intr_3_364:
	setx	0x410311, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_310), 16, 16)) -> intp(3, 0, f)
cpu_intr_3_365:
	setx	0x410329, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_311), 16, 16)) -> intp(3, 0, 28)
	.word 0xbf7c4400  ! 4274: MOVR_R	movre	%r17, %r0, %r31
	.word 0xf6358000  ! 4275: STH_R	sth	%r27, [%r22 + %r0]
	.word 0xfaa5a015  ! 4278: STWA_I	stwa	%r29, [%r22 + 0x0015] %asi
	.word 0xf834c000  ! 4280: STH_R	sth	%r28, [%r19 + %r0]
	.word 0xf4a56029  ! 4281: STWA_I	stwa	%r26, [%r21 + 0x0029] %asi
cpu_intr_3_366:
	setx	0x400202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ac4020  ! 4286: STBA_R	stba	%r27, [%r17 + %r0] 0x01
	.word 0xb2148000  ! 4287: OR_R	or 	%r18, %r0, %r25
iob_intr_3_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_312), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_wr_188:
	mov	0x35, %r14
	.word 0xfef38e60  ! 4289: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	ta	T_CHANGE_TO_TL1
cpu_intr_3_367:
	setx	0x410011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb61dc000  ! 4294: XOR_R	xor 	%r23, %r0, %r27
T3_asi_reg_wr_189:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 4295: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T3_asi_reg_rd_176:
	mov	0x15, %r14
	.word 0xfadb8e40  ! 4296: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0x9195a026  ! 4297: WRPR_PIL_I	wrpr	%r22, 0x0026, %pil
	.word 0xfe25a1cd  ! 4298: STW_I	stw	%r31, [%r22 + 0x01cd]
	.word 0xfc2d2088  ! 4299: STB_I	stb	%r30, [%r20 + 0x0088]
	.word 0xba84a097  ! 4301: ADDcc_I	addcc 	%r18, 0x0097, %r29
	.word 0xf6a40020  ! 4302: STWA_R	stwa	%r27, [%r16 + %r0] 0x01
	.word 0xfc748000  ! 4304: STX_R	stx	%r30, [%r18 + %r0]
iob_intr_3_313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_313), 16, 16)) -> intp(3, 0, 11)
	.word 0xf0a461f3  ! 4312: STWA_I	stwa	%r24, [%r17 + 0x01f3] %asi
	.word 0xf835c000  ! 4315: STH_R	sth	%r28, [%r23 + %r0]
iob_intr_3_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_314), 16, 16)) -> intp(3, 0, f)
	.word 0xfeb58020  ! 4320: STHA_R	stha	%r31, [%r22 + %r0] 0x01
iob_intr_3_315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_315), 16, 16)) -> intp(3, 0, 32)
	.word 0xfea5c020  ! 4324: STWA_R	stwa	%r31, [%r23 + %r0] 0x01
	.word 0xf2758000  ! 4325: STX_R	stx	%r25, [%r22 + %r0]
T3_asi_reg_rd_177:
	mov	0xc, %r14
	.word 0xf0db84a0  ! 4330: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xfcf5e064  ! 4333: STXA_I	stxa	%r30, [%r23 + 0x0064] %asi
T3_asi_reg_wr_190:
	mov	0x3c7, %r14
	.word 0xfaf384a0  ! 4334: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T3_asi_reg_wr_191:
	mov	0xa, %r14
	.word 0xfaf384a0  ! 4335: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_3_368:
	setx	0x43000c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_316), 16, 16)) -> intp(3, 0, 22)
iob_intr_3_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_317), 16, 16)) -> intp(3, 0, 3)
	.word 0xfaf5e053  ! 4345: STXA_I	stxa	%r29, [%r23 + 0x0053] %asi
cpu_intr_3_369:
	setx	0x420317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a48020  ! 4347: STWA_R	stwa	%r27, [%r18 + %r0] 0x01
cpu_intr_3_370:
	setx	0x42022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9194606c  ! 4351: WRPR_PIL_I	wrpr	%r17, 0x006c, %pil
	.word 0xbf3d9000  ! 4352: SRAX_R	srax	%r22, %r0, %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xbb2c6001  ! 4357: SLL_I	sll 	%r17, 0x0001, %r29
	.word 0xfaac4020  ! 4358: STBA_R	stba	%r29, [%r17 + %r0] 0x01
cpu_intr_3_371:
	setx	0x420336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0254000  ! 4362: STW_R	stw	%r24, [%r21 + %r0]
	.word 0xfaad0020  ! 4364: STBA_R	stba	%r29, [%r20 + %r0] 0x01
	.word 0xb6bcc000  ! 4366: XNORcc_R	xnorcc 	%r19, %r0, %r27
iob_intr_3_318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_318), 16, 16)) -> intp(3, 0, 36)
cpu_intr_3_372:
	setx	0x420217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab50020  ! 4373: STHA_R	stha	%r29, [%r20 + %r0] 0x01
T3_asi_reg_rd_178:
	mov	0xc, %r14
	.word 0xf6db89e0  ! 4375: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb4c50000  ! 4376: ADDCcc_R	addccc 	%r20, %r0, %r26
	.word 0xf8f4a0ca  ! 4378: STXA_I	stxa	%r28, [%r18 + 0x00ca] %asi
	.word 0xf42d4000  ! 4379: STB_R	stb	%r26, [%r21 + %r0]
	.word 0xfc340000  ! 4380: STH_R	sth	%r30, [%r16 + %r0]
	.word 0xfaa4e0a3  ! 4381: STWA_I	stwa	%r29, [%r19 + 0x00a3] %asi
T3_asi_reg_rd_179:
	mov	0x3c3, %r14
	.word 0xfcdb8e40  ! 4382: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_rd_180:
	mov	0x3c5, %r14
	.word 0xf4db8e40  ! 4383: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_rd_181:
	mov	0x2e, %r14
	.word 0xfcdb8e40  ! 4384: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_wr_192:
	mov	0x38, %r14
	.word 0xf4f38e80  ! 4385: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_3_319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_319), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf2b5202b  ! 4390: STHA_I	stha	%r25, [%r20 + 0x002b] %asi
cpu_intr_3_373:
	setx	0x40010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42dc000  ! 4394: STB_R	stb	%r26, [%r23 + %r0]
T3_asi_reg_rd_182:
	mov	0x2, %r14
	.word 0xf2db8400  ! 4395: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf4252187  ! 4400: STW_I	stw	%r26, [%r20 + 0x0187]
	.word 0xb5643801  ! 4401: MOVcc_I	<illegal instruction>
	.word 0xbe8c0000  ! 4402: ANDcc_R	andcc 	%r16, %r0, %r31
	.word 0xf4b58020  ! 4406: STHA_R	stha	%r26, [%r22 + %r0] 0x01
cpu_intr_3_374:
	setx	0x410321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb03ca0b3  ! 4412: XNOR_I	xnor 	%r18, 0x00b3, %r24
	.word 0xbe34a01d  ! 4415: ORN_I	orn 	%r18, 0x001d, %r31
	.word 0xf0ac6000  ! 4417: STBA_I	stba	%r24, [%r17 + 0x0000] %asi
T3_asi_reg_wr_193:
	mov	0x3c4, %r14
	.word 0xf6f38400  ! 4418: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf2ade1ff  ! 4421: STBA_I	stba	%r25, [%r23 + 0x01ff] %asi
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_194:
	mov	0x25, %r14
	.word 0xfef389e0  ! 4423: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_3_320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_320), 16, 16)) -> intp(3, 0, 0)
	.word 0xfc34e110  ! 4429: STH_I	sth	%r30, [%r19 + 0x0110]
	.word 0xf224e1ae  ! 4430: STW_I	stw	%r25, [%r19 + 0x01ae]
T3_asi_reg_rd_183:
	mov	0xa, %r14
	.word 0xfadb8e60  ! 4432: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xfa240000  ! 4435: STW_R	stw	%r29, [%r16 + %r0]
cpu_intr_3_375:
	setx	0x430136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab4e1ec  ! 4438: STHA_I	stha	%r29, [%r19 + 0x01ec] %asi
	.word 0xfcac0020  ! 4440: STBA_R	stba	%r30, [%r16 + %r0] 0x01
	.word 0xb93cb001  ! 4443: SRAX_I	srax	%r18, 0x0001, %r28
cpu_intr_3_376:
	setx	0x40031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_321), 16, 16)) -> intp(3, 0, 2c)
iob_intr_3_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_322), 16, 16)) -> intp(3, 0, b)
	.word 0xb1643801  ! 4447: MOVcc_I	<illegal instruction>
iob_intr_3_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_323), 16, 16)) -> intp(3, 0, 2f)
T3_asi_reg_wr_195:
	mov	0x38, %r14
	.word 0xf8f38400  ! 4451: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb29c0000  ! 4452: XORcc_R	xorcc 	%r16, %r0, %r25
T3_asi_reg_rd_184:
	mov	0x33, %r14
	.word 0xfedb8e80  ! 4455: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf62dc000  ! 4458: STB_R	stb	%r27, [%r23 + %r0]
cpu_intr_3_377:
	setx	0x430019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2da0d9  ! 4466: STB_I	stb	%r30, [%r22 + 0x00d9]
	.word 0xbc8da121  ! 4468: ANDcc_I	andcc 	%r22, 0x0121, %r30
iob_intr_3_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_324), 16, 16)) -> intp(3, 0, 3)
	.word 0xf67560c8  ! 4473: STX_I	stx	%r27, [%r21 + 0x00c8]
T3_asi_reg_rd_185:
	mov	0x0, %r14
	.word 0xf4db8e60  ! 4474: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb095c000  ! 4476: ORcc_R	orcc 	%r23, %r0, %r24
	.word 0xfa2c204c  ! 4477: STB_I	stb	%r29, [%r16 + 0x004c]
	.word 0xf825603b  ! 4484: STW_I	stw	%r28, [%r21 + 0x003b]
iob_intr_3_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_325), 16, 16)) -> intp(3, 0, 3c)
cpu_intr_3_378:
	setx	0x42012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_196:
	mov	0xd, %r14
	.word 0xfef38e40  ! 4487: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_3_379:
	setx	0x40000e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_186:
	mov	0x27, %r14
	.word 0xf4db89e0  ! 4491: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf8f461dc  ! 4493: STXA_I	stxa	%r28, [%r17 + 0x01dc] %asi
iob_intr_3_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_326), 16, 16)) -> intp(3, 0, 4)
T3_asi_reg_rd_187:
	mov	0xd, %r14
	.word 0xfadb8e80  ! 4496: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T3_asi_reg_rd_188:
	mov	0x35, %r14
	.word 0xf4db8e80  ! 4497: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_3_380:
	setx	0x410005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b40020  ! 4500: STHA_R	stha	%r24, [%r16 + %r0] 0x01
cpu_intr_3_381:
	setx	0x400125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe24c000  ! 4503: STW_R	stw	%r31, [%r19 + %r0]
	.word 0xf82de025  ! 4504: STB_I	stb	%r28, [%r23 + 0x0025]
	.word 0xf6f4604b  ! 4507: STXA_I	stxa	%r27, [%r17 + 0x004b] %asi
	.word 0xbe444000  ! 4508: ADDC_R	addc 	%r17, %r0, %r31
iob_intr_3_327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_327), 16, 16)) -> intp(3, 0, 3f)
cpu_intr_3_382:
	setx	0x40030d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_328), 16, 16)) -> intp(3, 0, 7)
cpu_intr_3_383:
	setx	0x410023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa344000  ! 4523: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xf8b4a1cd  ! 4524: STHA_I	stha	%r28, [%r18 + 0x01cd] %asi
cpu_intr_3_384:
	setx	0x43021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa5e128  ! 4528: STWA_I	stwa	%r29, [%r23 + 0x0128] %asi
cpu_intr_3_385:
	setx	0x420308, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_386:
	setx	0x420301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2740000  ! 4534: STX_R	stx	%r25, [%r16 + %r0]
T3_asi_reg_wr_197:
	mov	0x22, %r14
	.word 0xf2f38400  ! 4535: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb9641800  ! 4536: MOVcc_R	<illegal instruction>
	.word 0xb8bc0000  ! 4537: XNORcc_R	xnorcc 	%r16, %r0, %r28
	.word 0xf4b4e037  ! 4538: STHA_I	stha	%r26, [%r19 + 0x0037] %asi
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983fc0  ! 4540: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc0, %hpstate
	.word 0xb83c4000  ! 4541: XNOR_R	xnor 	%r17, %r0, %r28
	.word 0xfc250000  ! 4543: STW_R	stw	%r30, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0xfa75e011  ! 4545: STX_I	stx	%r29, [%r23 + 0x0011]
T3_asi_reg_rd_189:
	mov	0xc, %r14
	.word 0xfadb8e40  ! 4546: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_3_387:
	setx	0x40031b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_388:
	setx	0x430016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb40de0ad  ! 4551: AND_I	and 	%r23, 0x00ad, %r26
cpu_intr_3_389:
	setx	0x40001f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_190:
	mov	0x2e, %r14
	.word 0xf2db89e0  ! 4553: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_3_329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_329), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf8b460f3  ! 4555: STHA_I	stha	%r28, [%r17 + 0x00f3] %asi
	.word 0xfe24a012  ! 4557: STW_I	stw	%r31, [%r18 + 0x0012]
	.word 0xf2754000  ! 4559: STX_R	stx	%r25, [%r21 + %r0]
T3_asi_reg_rd_191:
	mov	0x1d, %r14
	.word 0xf6db84a0  ! 4560: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xfe74c000  ! 4564: STX_R	stx	%r31, [%r19 + %r0]
	.word 0xf2adc020  ! 4565: STBA_R	stba	%r25, [%r23 + %r0] 0x01
	.word 0xf0b40020  ! 4566: STHA_R	stha	%r24, [%r16 + %r0] 0x01
	.word 0x8f902002  ! 4569: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
cpu_intr_3_390:
	setx	0x41000c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_330), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_rd_192:
	mov	0x3c0, %r14
	.word 0xf4db8e60  ! 4574: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xfa24a13f  ! 4575: STW_I	stw	%r29, [%r18 + 0x013f]
iob_intr_3_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_331), 16, 16)) -> intp(3, 0, 5)
cpu_intr_3_391:
	setx	0x42032e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_392:
	setx	0x400038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8bd8000  ! 4580: XNORcc_R	xnorcc 	%r22, %r0, %r28
	.word 0xb2a46150  ! 4581: SUBcc_I	subcc 	%r17, 0x0150, %r25
iob_intr_3_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_332), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf02421dc  ! 4584: STW_I	stw	%r24, [%r16 + 0x01dc]
	.word 0xfc2c619e  ! 4586: STB_I	stb	%r30, [%r17 + 0x019e]
iob_intr_3_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_333), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf8350000  ! 4589: STH_R	sth	%r28, [%r20 + %r0]
	.word 0x8395e156  ! 4590: WRPR_TNPC_I	wrpr	%r23, 0x0156, %tnpc
iob_intr_3_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_334), 16, 16)) -> intp(3, 0, 7)
	.word 0xfc2da02b  ! 4595: STB_I	stb	%r30, [%r22 + 0x002b]
	.word 0xf4f5e0ad  ! 4599: STXA_I	stxa	%r26, [%r23 + 0x00ad] %asi
iob_intr_3_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_335), 16, 16)) -> intp(3, 0, 2d)
	.word 0xfc25e1fb  ! 4602: STW_I	stw	%r30, [%r23 + 0x01fb]
	.word 0xf675a105  ! 4605: STX_I	stx	%r27, [%r22 + 0x0105]
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982a80  ! 4606: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a80, %hpstate
	.word 0xfc358000  ! 4609: STH_R	sth	%r30, [%r22 + %r0]
	.word 0xf2ada041  ! 4610: STBA_I	stba	%r25, [%r22 + 0x0041] %asi
	.word 0xf6b4a0ef  ! 4617: STHA_I	stha	%r27, [%r18 + 0x00ef] %asi
cpu_intr_3_393:
	setx	0x45031b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_394:
	setx	0x440100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0356074  ! 4624: STH_I	sth	%r24, [%r21 + 0x0074]
cpu_intr_3_395:
	setx	0x450105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a58020  ! 4627: STWA_R	stwa	%r27, [%r22 + %r0] 0x01
cpu_intr_3_396:
	setx	0x450304, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_193:
	mov	0x9, %r14
	.word 0xfcdb8400  ! 4630: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T3_asi_reg_wr_198:
	mov	0x20, %r14
	.word 0xf2f389e0  ! 4631: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf674606c  ! 4633: STX_I	stx	%r27, [%r17 + 0x006c]
iob_intr_3_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_336), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_397:
	setx	0x450037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a4e0fa  ! 4639: STWA_I	stwa	%r24, [%r19 + 0x00fa] %asi
	.word 0xba0c21ba  ! 4641: AND_I	and 	%r16, 0x01ba, %r29
iob_intr_3_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_337), 16, 16)) -> intp(3, 0, 1c)
	.word 0xb53d3001  ! 4644: SRAX_I	srax	%r20, 0x0001, %r26
cpu_intr_3_398:
	setx	0x460331, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_338), 16, 16)) -> intp(3, 0, 29)
	.word 0xb13cf001  ! 4651: SRAX_I	srax	%r19, 0x0001, %r24
	.word 0xf4a4213e  ! 4652: STWA_I	stwa	%r26, [%r16 + 0x013e] %asi
iob_intr_3_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_339), 16, 16)) -> intp(3, 0, 3b)
	.word 0xb72ca001  ! 4657: SLL_I	sll 	%r18, 0x0001, %r27
T3_asi_reg_rd_194:
	mov	0x9, %r14
	.word 0xf6db8e60  ! 4664: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf8b50020  ! 4666: STHA_R	stha	%r28, [%r20 + %r0] 0x01
iob_intr_3_340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_340), 16, 16)) -> intp(3, 0, 27)
	.word 0xb6354000  ! 4668: SUBC_R	orn 	%r21, %r0, %r27
	.word 0xf2a4e001  ! 4669: STWA_I	stwa	%r25, [%r19 + 0x0001] %asi
	.word 0x8795e0fc  ! 4670: WRPR_TT_I	wrpr	%r23, 0x00fc, %tt
	.word 0xb32cb001  ! 4671: SLLX_I	sllx	%r18, 0x0001, %r25
iob_intr_3_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_341), 16, 16)) -> intp(3, 0, 2f)
	.word 0xfca44020  ! 4674: STWA_R	stwa	%r30, [%r17 + %r0] 0x01
cpu_intr_3_399:
	setx	0x45021a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_342), 16, 16)) -> intp(3, 0, a)
	.word 0xb02c0000  ! 4677: ANDN_R	andn 	%r16, %r0, %r24
cpu_intr_3_400:
	setx	0x440229, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_343), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_401:
	setx	0x450032, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_344), 16, 16)) -> intp(3, 0, 32)
	.word 0xf8aca144  ! 4684: STBA_I	stba	%r28, [%r18 + 0x0144] %asi
cpu_intr_3_402:
	setx	0x470200, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982942  ! 4686: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0942, %hpstate
T3_asi_reg_wr_199:
	mov	0x22, %r14
	.word 0xfcf389e0  ! 4687: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xfe744000  ! 4689: STX_R	stx	%r31, [%r17 + %r0]
	.word 0xb5643801  ! 4690: MOVcc_I	<illegal instruction>
cpu_intr_3_403:
	setx	0x450002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a58020  ! 4693: STWA_R	stwa	%r27, [%r22 + %r0] 0x01
	.word 0xfa35e05e  ! 4694: STH_I	sth	%r29, [%r23 + 0x005e]
	.word 0xb834c000  ! 4696: SUBC_R	orn 	%r19, %r0, %r28
T3_asi_reg_rd_195:
	mov	0x2b, %r14
	.word 0xf4db8e40  ! 4698: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_345), 16, 16)) -> intp(3, 0, 23)
T3_asi_reg_rd_196:
	mov	0x1a, %r14
	.word 0xfedb84a0  ! 4703: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbd3c7001  ! 4707: SRAX_I	srax	%r17, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0xbc8d8000  ! 4712: ANDcc_R	andcc 	%r22, %r0, %r30
	.word 0xfcf5e0de  ! 4713: STXA_I	stxa	%r30, [%r23 + 0x00de] %asi
	.word 0xf8a5c020  ! 4715: STWA_R	stwa	%r28, [%r23 + %r0] 0x01
T3_asi_reg_rd_197:
	mov	0x3c1, %r14
	.word 0xf2db84a0  ! 4721: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xfcac4020  ! 4722: STBA_R	stba	%r30, [%r17 + %r0] 0x01
	.word 0xf4b4e179  ! 4724: STHA_I	stha	%r26, [%r19 + 0x0179] %asi
	.word 0xfe750000  ! 4726: STX_R	stx	%r31, [%r20 + %r0]
iob_intr_3_346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_346), 16, 16)) -> intp(3, 0, 3)
T3_asi_reg_wr_200:
	mov	0xb, %r14
	.word 0xf2f38e40  ! 4728: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_wr_201:
	mov	0x28, %r14
	.word 0xfcf38e40  ! 4729: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_347), 16, 16)) -> intp(3, 0, 34)
cpu_intr_3_404:
	setx	0x460102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b5e11e  ! 4732: SUBCcc_I	orncc 	%r23, 0x011e, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_198:
	mov	0x38, %r14
	.word 0xf2db8e60  ! 4737: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf4a5e0ac  ! 4739: STWA_I	stwa	%r26, [%r23 + 0x00ac] %asi
cpu_intr_3_405:
	setx	0x2033d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_348), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf8a561e7  ! 4747: STWA_I	stwa	%r28, [%r21 + 0x01e7] %asi
	.word 0xfa340000  ! 4750: STH_R	sth	%r29, [%r16 + %r0]
cpu_intr_3_406:
	setx	0x450202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4254000  ! 4754: STW_R	stw	%r26, [%r21 + %r0]
iob_intr_3_349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_349), 16, 16)) -> intp(3, 0, 21)
	.word 0xfeb58020  ! 4760: STHA_R	stha	%r31, [%r22 + %r0] 0x01
T3_asi_reg_rd_199:
	mov	0x15, %r14
	.word 0xf6db8e40  ! 4761: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_407:
	setx	0x440018, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_202:
	mov	0x3c5, %r14
	.word 0xfcf38e40  ! 4764: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_350), 16, 16)) -> intp(3, 0, a)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf8a421c4  ! 4769: STWA_I	stwa	%r28, [%r16 + 0x01c4] %asi
	.word 0xf8a420d9  ! 4770: STWA_I	stwa	%r28, [%r16 + 0x00d9] %asi
	.word 0xfeb5e122  ! 4771: STHA_I	stha	%r31, [%r23 + 0x0122] %asi
T3_asi_reg_wr_203:
	mov	0xd, %r14
	.word 0xfaf389e0  ! 4772: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_3_408:
	setx	0x46002c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_351), 16, 16)) -> intp(3, 0, d)
iob_intr_3_352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_352), 16, 16)) -> intp(3, 0, 32)
cpu_intr_3_409:
	setx	0x470101, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_410:
	setx	0x460200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb494c000  ! 4785: ORcc_R	orcc 	%r19, %r0, %r26
iob_intr_3_353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_353), 16, 16)) -> intp(3, 0, 18)
	.word 0xfeb58020  ! 4787: STHA_R	stha	%r31, [%r22 + %r0] 0x01
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983c4a  ! 4789: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c4a, %hpstate
iob_intr_3_354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_354), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_wr_204:
	mov	0x23, %r14
	.word 0xfcf384a0  ! 4792: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T3_asi_reg_rd_200:
	mov	0x3c3, %r14
	.word 0xf2db8e40  ! 4793: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfe240000  ! 4794: STW_R	stw	%r31, [%r16 + %r0]
cpu_intr_3_411:
	setx	0x470205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb684205e  ! 4796: ADDcc_I	addcc 	%r16, 0x005e, %r27
	.word 0xba2c0000  ! 4799: ANDN_R	andn 	%r16, %r0, %r29
	.word 0xfc2d8000  ! 4801: STB_R	stb	%r30, [%r22 + %r0]
	ta	T_CHANGE_TO_TL0
	.word 0xfc348000  ! 4804: STH_R	sth	%r30, [%r18 + %r0]
cpu_intr_3_412:
	setx	0x450327, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_355), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf475a135  ! 4815: STX_I	stx	%r26, [%r22 + 0x0135]
T3_asi_reg_rd_201:
	mov	0x3c1, %r14
	.word 0xf4db8400  ! 4817: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_202:
	mov	0x25, %r14
	.word 0xfcdb8400  ! 4819: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T3_asi_reg_rd_203:
	mov	0x3c8, %r14
	.word 0xf0db8400  ! 4821: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf6ac8020  ! 4823: STBA_R	stba	%r27, [%r18 + %r0] 0x01
T3_asi_reg_rd_204:
	mov	0x2a, %r14
	.word 0xfedb8e60  ! 4824: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T3_asi_reg_wr_205:
	mov	0x6, %r14
	.word 0xfaf389e0  ! 4827: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_3_356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_356), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_413:
	setx	0x44030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b4219e  ! 4831: STHA_I	stha	%r28, [%r16 + 0x019e] %asi
iob_intr_3_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_357), 16, 16)) -> intp(3, 0, a)
iob_intr_3_358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_358), 16, 16)) -> intp(3, 0, 36)
	.word 0xf875212b  ! 4835: STX_I	stx	%r28, [%r20 + 0x012b]
	.word 0xb8254000  ! 4836: SUB_R	sub 	%r21, %r0, %r28
	.word 0xb97d0400  ! 4839: MOVR_R	movre	%r20, %r0, %r28
cpu_intr_3_414:
	setx	0x44001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6348000  ! 4846: STH_R	sth	%r27, [%r18 + %r0]
cpu_intr_3_415:
	setx	0x440003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b58000  ! 4849: ORNcc_R	orncc 	%r22, %r0, %r24
T3_asi_reg_rd_205:
	mov	0x22, %r14
	.word 0xf4db84a0  ! 4851: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	ta	T_CHANGE_NONHPRIV
	.word 0xf424a1fe  ! 4854: STW_I	stw	%r26, [%r18 + 0x01fe]
	.word 0xb2b44000  ! 4855: SUBCcc_R	orncc 	%r17, %r0, %r25
	.word 0xf42d215e  ! 4856: STB_I	stb	%r26, [%r20 + 0x015e]
cpu_intr_3_416:
	setx	0x440304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b5e058  ! 4864: STHA_I	stha	%r25, [%r23 + 0x0058] %asi
	.word 0xfeb4a13e  ! 4866: STHA_I	stha	%r31, [%r18 + 0x013e] %asi
	.word 0xb23ca032  ! 4868: XNOR_I	xnor 	%r18, 0x0032, %r25
	.word 0xf2740000  ! 4870: STX_R	stx	%r25, [%r16 + %r0]
	.word 0xfa746128  ! 4871: STX_I	stx	%r29, [%r17 + 0x0128]
	.word 0xf4a40020  ! 4873: STWA_R	stwa	%r26, [%r16 + %r0] 0x01
T3_asi_reg_rd_206:
	mov	0x25, %r14
	.word 0xfcdb8e60  ! 4880: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb37c4400  ! 4881: MOVR_R	movre	%r17, %r0, %r25
	.word 0x89942094  ! 4883: WRPR_TICK_I	wrpr	%r16, 0x0094, %tick
iob_intr_3_359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_359), 16, 16)) -> intp(3, 0, 3a)
iob_intr_3_360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_360), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf6a5c020  ! 4889: STWA_R	stwa	%r27, [%r23 + %r0] 0x01
iob_intr_3_361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_361), 16, 16)) -> intp(3, 0, 3e)
	.word 0xb8ac4000  ! 4891: ANDNcc_R	andncc 	%r17, %r0, %r28
	.word 0xf2b58020  ! 4892: STHA_R	stha	%r25, [%r22 + %r0] 0x01
iob_intr_3_362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_362), 16, 16)) -> intp(3, 0, 12)
	.word 0xfea4e144  ! 4894: STWA_I	stwa	%r31, [%r19 + 0x0144] %asi
iob_intr_3_363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_363), 16, 16)) -> intp(3, 0, d)
cpu_intr_3_417:
	setx	0x470332, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_207:
	mov	0x12, %r14
	.word 0xf6db84a0  ! 4901: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T3_asi_reg_rd_208:
	mov	0x3c2, %r14
	.word 0xf2db89e0  ! 4903: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xfa74a057  ! 4906: STX_I	stx	%r29, [%r18 + 0x0057]
iob_intr_3_364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_364), 16, 16)) -> intp(3, 0, 3)
T3_asi_reg_rd_209:
	mov	0xa, %r14
	.word 0xf8db8e80  ! 4911: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xfe754000  ! 4912: STX_R	stx	%r31, [%r21 + %r0]
iob_intr_3_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_365), 16, 16)) -> intp(3, 0, 17)
	.word 0xb350c000  ! 4915: RDPR_TT	rdpr	%tt, %r25
	.word 0xfca44020  ! 4916: STWA_R	stwa	%r30, [%r17 + %r0] 0x01
T3_asi_reg_wr_206:
	mov	0x3c4, %r14
	.word 0xf2f38400  ! 4917: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb0848000  ! 4918: ADDcc_R	addcc 	%r18, %r0, %r24
	ta	T_CHANGE_TO_TL1
	.word 0x839421dd  ! 4922: WRPR_TNPC_I	wrpr	%r16, 0x01dd, %tnpc
cpu_intr_3_418:
	setx	0x470021, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_419:
	setx	0x47000b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_366), 16, 16)) -> intp(3, 0, 13)
cpu_intr_3_420:
	setx	0x440117, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_210:
	mov	0x2, %r14
	.word 0xf2db89e0  ! 4931: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xfaace01c  ! 4932: STBA_I	stba	%r29, [%r19 + 0x001c] %asi
	.word 0xf0754000  ! 4943: STX_R	stx	%r24, [%r21 + %r0]
	.word 0xbea5210e  ! 4945: SUBcc_I	subcc 	%r20, 0x010e, %r31
iob_intr_3_367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_367), 16, 16)) -> intp(3, 0, 32)
iob_intr_3_368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_368), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf6a54020  ! 4951: STWA_R	stwa	%r27, [%r21 + %r0] 0x01
iob_intr_3_369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_369), 16, 16)) -> intp(3, 0, 20)
iob_intr_3_370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_370), 16, 16)) -> intp(3, 0, 1c)
	.word 0xfa342159  ! 4954: STH_I	sth	%r29, [%r16 + 0x0159]
iob_intr_3_371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_371), 16, 16)) -> intp(3, 0, 1f)
	.word 0xfe2d0000  ! 4957: STB_R	stb	%r31, [%r20 + %r0]
cpu_intr_3_421:
	setx	0x460225, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_372), 16, 16)) -> intp(3, 0, 8)
	.word 0xf674a066  ! 4963: STX_I	stx	%r27, [%r18 + 0x0066]
	.word 0xbe3d8000  ! 4964: XNOR_R	xnor 	%r22, %r0, %r31
cpu_intr_3_422:
	setx	0x470204, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_373:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_373), 16, 16)) -> intp(3, 0, 39)
iob_intr_3_374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_374), 16, 16)) -> intp(3, 0, 3)
cpu_intr_3_423:
	setx	0x44013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd2c0000  ! 4971: SLL_R	sll 	%r16, %r0, %r30
T3_asi_reg_wr_207:
	mov	0x18, %r14
	.word 0xf4f389e0  ! 4973: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xfef4e094  ! 4975: STXA_I	stxa	%r31, [%r19 + 0x0094] %asi
iob_intr_3_375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_375), 16, 16)) -> intp(3, 0, 0)
cpu_intr_3_424:
	setx	0x440217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8f46071  ! 4980: STXA_I	stxa	%r28, [%r17 + 0x0071] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc2c8000  ! 4982: STB_R	stb	%r30, [%r18 + %r0]
	.word 0xbf3df001  ! 4984: SRAX_I	srax	%r23, 0x0001, %r31
	ta	T_CHANGE_TO_TL1
cpu_intr_3_425:
	setx	0x44030f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_208:
	mov	0x3c5, %r14
	.word 0xf8f38400  ! 4987: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xfa344000  ! 4991: STH_R	sth	%r29, [%r17 + %r0]
iob_intr_3_376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_376), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf0f4e062  ! 4996: STXA_I	stxa	%r24, [%r19 + 0x0062] %asi
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
	mov	0x28, %r14
	.word 0xfcf38e80  ! 2: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T2_asi_reg_wr_1:
	mov	0x30, %r14
	.word 0xfaf38e80  ! 3: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xfa8ca082  ! 4: LDUBA_I	lduba	[%r18, + 0x0082] %asi, %r29
cpu_intr_2_0:
	setx	0x1e022f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_1:
	setx	0x1f0213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf414a064  ! 9: LDUH_I	lduh	[%r18 + 0x0064], %r26
	.word 0xf0c5c020  ! 10: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r24
	.word 0xfc15200c  ! 12: LDUH_I	lduh	[%r20 + 0x000c], %r30
	.word 0xfc452069  ! 13: LDSW_I	ldsw	[%r20 + 0x0069], %r30
	.word 0xfa848020  ! 14: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r29
	.word 0xf8d5e073  ! 22: LDSHA_I	ldsha	[%r23, + 0x0073] %asi, %r28
	.word 0xf45cc000  ! 23: LDX_R	ldx	[%r19 + %r0], %r26
cpu_intr_2_2:
	setx	0x1d0326, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_3:
	setx	0x1e012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb643801  ! 31: MOVcc_I	<illegal instruction>
	.word 0xfc0d0000  ! 33: LDUB_R	ldub	[%r20 + %r0], %r30
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_2:
	mov	0x13, %r14
	.word 0xf8f389e0  ! 36: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T2_asi_reg_wr_3:
	mov	0x27, %r14
	.word 0xf2f38e80  ! 37: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb8b48000  ! 42: SUBCcc_R	orncc 	%r18, %r0, %r28
	.word 0xf4cc8020  ! 44: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r26
	.word 0xfc4d4000  ! 46: LDSB_R	ldsb	[%r21 + %r0], %r30
	.word 0xf6cd2186  ! 47: LDSBA_I	ldsba	[%r20, + 0x0186] %asi, %r27
	.word 0xfe8560a8  ! 48: LDUWA_I	lduwa	[%r21, + 0x00a8] %asi, %r31
iob_intr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_0), 16, 16)) -> intp(2, 0, 1f)
	.word 0xbd3c6001  ! 50: SRA_I	sra 	%r17, 0x0001, %r30
iob_intr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_1), 16, 16)) -> intp(2, 0, 3)
iob_intr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_2), 16, 16)) -> intp(2, 0, 39)
iob_intr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_3), 16, 16)) -> intp(2, 0, a)
	.word 0xfe946152  ! 57: LDUHA_I	lduha	[%r17, + 0x0152] %asi, %r31
cpu_intr_2_4:
	setx	0x1f0024, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_0:
	mov	0x1c, %r14
	.word 0xf8db8e80  ! 60: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb215c000  ! 63: OR_R	or 	%r23, %r0, %r25
cpu_intr_2_5:
	setx	0x1d0218, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf48de08e  ! 68: LDUBA_I	lduba	[%r23, + 0x008e] %asi, %r26
	.word 0xbac460dc  ! 69: ADDCcc_I	addccc 	%r17, 0x00dc, %r29
T2_asi_reg_wr_4:
	mov	0x1f, %r14
	.word 0xfef384a0  ! 72: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb53c8000  ! 76: SRA_R	sra 	%r18, %r0, %r26
cpu_intr_2_6:
	setx	0x1e0229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_7:
	setx	0x1c011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d54020  ! 79: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r25
	.word 0xf245e110  ! 80: LDSW_I	ldsw	[%r23 + 0x0110], %r25
T2_asi_reg_rd_1:
	mov	0x24, %r14
	.word 0xfedb8e60  ! 81: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf415a00f  ! 87: LDUH_I	lduh	[%r22 + 0x000f], %r26
	.word 0xf2cde13c  ! 88: LDSBA_I	ldsba	[%r23, + 0x013c] %asi, %r25
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xf2856004  ! 96: LDUWA_I	lduwa	[%r21, + 0x0004] %asi, %r25
cpu_intr_2_8:
	setx	0x1d021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xb2256016  ! 99: SUB_I	sub 	%r21, 0x0016, %r25
cpu_intr_2_9:
	setx	0x1c022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_2:
	mov	0x3c7, %r14
	.word 0xf6db8e80  ! 103: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf0446010  ! 104: LDSW_I	ldsw	[%r17 + 0x0010], %r24
T2_asi_reg_wr_5:
	mov	0x2c, %r14
	.word 0xf4f38e40  ! 105: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_rd_3:
	mov	0x3c2, %r14
	.word 0xf6db8e60  ! 106: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf244e162  ! 108: LDSW_I	ldsw	[%r19 + 0x0162], %r25
	.word 0xfc5d8000  ! 109: LDX_R	ldx	[%r22 + %r0], %r30
	.word 0xf88d8020  ! 112: LDUBA_R	lduba	[%r22, %r0] 0x01, %r28
	ta	T_CHANGE_HPRIV
	.word 0xb60d0000  ! 116: AND_R	and 	%r20, %r0, %r27
	.word 0xfc5ce12e  ! 117: LDX_I	ldx	[%r19 + 0x012e], %r30
	.word 0xf0158000  ! 118: LDUH_R	lduh	[%r22 + %r0], %r24
	.word 0xfe15a114  ! 120: LDUH_I	lduh	[%r22 + 0x0114], %r31
iob_intr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_4), 16, 16)) -> intp(2, 0, 28)
	.word 0xf044211b  ! 124: LDSW_I	ldsw	[%r16 + 0x011b], %r24
	.word 0xf845e19f  ! 127: LDSW_I	ldsw	[%r23 + 0x019f], %r28
	.word 0xb4c5e0ae  ! 128: ADDCcc_I	addccc 	%r23, 0x00ae, %r26
iob_intr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_5), 16, 16)) -> intp(2, 0, 15)
	.word 0xf88d4020  ! 130: LDUBA_R	lduba	[%r21, %r0] 0x01, %r28
	.word 0xb1643801  ! 133: MOVcc_I	<illegal instruction>
cpu_intr_2_10:
	setx	0x1c011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6cce10e  ! 138: LDSBA_I	ldsba	[%r19, + 0x010e] %asi, %r27
iob_intr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_6), 16, 16)) -> intp(2, 0, 13)
cpu_intr_2_11:
	setx	0x1f0315, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_7), 16, 16)) -> intp(2, 0, e)
T2_asi_reg_wr_6:
	mov	0x3c6, %r14
	.word 0xf6f38e60  ! 151: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_8), 16, 16)) -> intp(2, 0, 24)
	.word 0xf4d5a087  ! 159: LDSHA_I	ldsha	[%r22, + 0x0087] %asi, %r26
	ta	T_CHANGE_HPRIV
	.word 0xf44da03e  ! 161: LDSB_I	ldsb	[%r22 + 0x003e], %r26
iob_intr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_9), 16, 16)) -> intp(2, 0, 29)
cpu_intr_2_12:
	setx	0x1d0139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf054a0e6  ! 167: LDSH_I	ldsh	[%r18 + 0x00e6], %r24
cpu_intr_2_13:
	setx	0x1e030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_7:
	mov	0x2a, %r14
	.word 0xf8f38e40  ! 171: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfc858020  ! 174: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r30
iob_intr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_10), 16, 16)) -> intp(2, 0, 37)
	.word 0xf8958020  ! 177: LDUHA_R	lduha	[%r22, %r0] 0x01, %r28
iob_intr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_11), 16, 16)) -> intp(2, 0, 37)
cpu_intr_2_14:
	setx	0x1e0215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4c4000  ! 182: LDSB_R	ldsb	[%r17 + %r0], %r30
	ta	T_CHANGE_NONHPRIV
	.word 0xf60c8000  ! 188: LDUB_R	ldub	[%r18 + %r0], %r27
iob_intr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_12), 16, 16)) -> intp(2, 0, 37)
	.word 0xb93d2001  ! 193: SRA_I	sra 	%r20, 0x0001, %r28
iob_intr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_13), 16, 16)) -> intp(2, 0, 14)
	.word 0xb5354000  ! 197: SRL_R	srl 	%r21, %r0, %r26
cpu_intr_2_15:
	setx	0x1e010d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_14), 16, 16)) -> intp(2, 0, d)
iob_intr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_15), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf4d420ae  ! 205: LDSHA_I	ldsha	[%r16, + 0x00ae] %asi, %r26
iob_intr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_16), 16, 16)) -> intp(2, 0, e)
iob_intr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_17), 16, 16)) -> intp(2, 0, 23)
	.word 0xbe85a02d  ! 209: ADDcc_I	addcc 	%r22, 0x002d, %r31
iob_intr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_18), 16, 16)) -> intp(2, 0, 16)
	.word 0xfcc4e06f  ! 215: LDSWA_I	ldswa	[%r19, + 0x006f] %asi, %r30
	.word 0xfa4c8000  ! 217: LDSB_R	ldsb	[%r18 + %r0], %r29
	.word 0xf6c461fe  ! 218: LDSWA_I	ldswa	[%r17, + 0x01fe] %asi, %r27
T2_asi_reg_rd_4:
	mov	0x2, %r14
	.word 0xf2db84a0  ! 220: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_2_16:
	setx	0x1f0201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc5de03a  ! 223: LDX_I	ldx	[%r23 + 0x003a], %r30
	.word 0xfc8c0020  ! 224: LDUBA_R	lduba	[%r16, %r0] 0x01, %r30
T2_asi_reg_rd_5:
	mov	0x2, %r14
	.word 0xf2db8e80  ! 225: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xfc0d0000  ! 229: LDUB_R	ldub	[%r20 + %r0], %r30
	.word 0xf48d0020  ! 230: LDUBA_R	lduba	[%r20, %r0] 0x01, %r26
iob_intr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_19), 16, 16)) -> intp(2, 0, f)
iob_intr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_20), 16, 16)) -> intp(2, 0, 25)
	.word 0xfe5d8000  ! 236: LDX_R	ldx	[%r22 + %r0], %r31
	.word 0xf2548000  ! 237: LDSH_R	ldsh	[%r18 + %r0], %r25
	.word 0xf045e1f5  ! 238: LDSW_I	ldsw	[%r23 + 0x01f5], %r24
T2_asi_reg_rd_6:
	mov	0x13, %r14
	.word 0xfadb8e40  ! 241: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf8844020  ! 242: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r28
	.word 0xb40dc000  ! 245: AND_R	and 	%r23, %r0, %r26
T2_asi_reg_wr_8:
	mov	0x2d, %r14
	.word 0xf4f389e0  ! 248: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf40c6157  ! 249: LDUB_I	ldub	[%r17 + 0x0157], %r26
T2_asi_reg_wr_9:
	mov	0x2, %r14
	.word 0xfcf389e0  ! 250: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_21), 16, 16)) -> intp(2, 0, 37)
T2_asi_reg_wr_10:
	mov	0x3c7, %r14
	.word 0xf2f38e80  ! 252: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL1
	setx	data_start_1, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982c50  ! 254: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c50, %hpstate
iob_intr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_22), 16, 16)) -> intp(2, 0, 33)
	.word 0xb2bc4000  ! 258: XNORcc_R	xnorcc 	%r17, %r0, %r25
	.word 0xfec5609f  ! 259: LDSWA_I	ldswa	[%r21, + 0x009f] %asi, %r31
	.word 0xf8944020  ! 260: LDUHA_R	lduha	[%r17, %r0] 0x01, %r28
cpu_intr_2_17:
	setx	0x1c033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5d2071  ! 264: LDX_I	ldx	[%r20 + 0x0071], %r31
cpu_intr_2_18:
	setx	0x1c0131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf844c000  ! 269: LDSW_R	ldsw	[%r19 + %r0], %r28
cpu_intr_2_19:
	setx	0x1e0112, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_11:
	mov	0x27, %r14
	.word 0xf6f38e40  ! 275: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_23), 16, 16)) -> intp(2, 0, 27)
	.word 0xfc458000  ! 283: LDSW_R	ldsw	[%r22 + %r0], %r30
	.word 0xf65d8000  ! 286: LDX_R	ldx	[%r22 + %r0], %r27
	ta	T_CHANGE_TO_TL1
	.word 0xf085e12b  ! 292: LDUWA_I	lduwa	[%r23, + 0x012b] %asi, %r24
iob_intr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_24), 16, 16)) -> intp(2, 0, a)
	.word 0xb844c000  ! 295: ADDC_R	addc 	%r19, %r0, %r28
	.word 0xf05c604f  ! 296: LDX_I	ldx	[%r17 + 0x004f], %r24
	.word 0xf405e0d0  ! 298: LDUW_I	lduw	[%r23 + 0x00d0], %r26
T2_asi_reg_wr_12:
	mov	0x3c5, %r14
	.word 0xf0f38e40  ! 299: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf2c50020  ! 302: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r25
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfac461a4  ! 308: LDSWA_I	ldswa	[%r17, + 0x01a4] %asi, %r29
cpu_intr_2_20:
	setx	0x1c0215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73ce001  ! 315: SRA_I	sra 	%r19, 0x0001, %r27
cpu_intr_2_21:
	setx	0x1d0307, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_7:
	mov	0x23, %r14
	.word 0xfedb8e60  ! 318: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb57c2401  ! 319: MOVR_I	movre	%r16, 0x1, %r26
	.word 0xba954000  ! 321: ORcc_R	orcc 	%r21, %r0, %r29
iob_intr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_25), 16, 16)) -> intp(2, 0, 3a)
	.word 0xb93df001  ! 327: SRAX_I	srax	%r23, 0x0001, %r28
	.word 0x91942001  ! 331: WRPR_PIL_I	wrpr	%r16, 0x0001, %pil
	.word 0xf45c6164  ! 336: LDX_I	ldx	[%r17 + 0x0164], %r26
	.word 0xfcc48020  ! 337: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r30
T2_asi_reg_wr_13:
	mov	0x1, %r14
	.word 0xf8f38e40  ! 339: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb014c000  ! 340: OR_R	or 	%r19, %r0, %r24
	.word 0xfa84c020  ! 341: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r29
	.word 0xfec5c020  ! 342: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r31
cpu_intr_2_22:
	setx	0x1c0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5345000  ! 344: SRLX_R	srlx	%r17, %r0, %r26
	.word 0xb4b4c000  ! 350: ORNcc_R	orncc 	%r19, %r0, %r26
cpu_intr_2_23:
	setx	0x1d001c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_24:
	setx	0x1e0335, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_26), 16, 16)) -> intp(2, 0, 8)
	.word 0xf814219b  ! 357: LDUH_I	lduh	[%r16 + 0x019b], %r28
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_TO_TL1
	.word 0xf014a1fb  ! 364: LDUH_I	lduh	[%r18 + 0x01fb], %r24
	.word 0xfec4a1db  ! 365: LDSWA_I	ldswa	[%r18, + 0x01db] %asi, %r31
iob_intr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_27), 16, 16)) -> intp(2, 0, 37)
	.word 0xfecd6108  ! 368: LDSBA_I	ldsba	[%r21, + 0x0108] %asi, %r31
iob_intr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_28), 16, 16)) -> intp(2, 0, 3a)
	.word 0xb6944000  ! 371: ORcc_R	orcc 	%r17, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf28ca05f  ! 374: LDUBA_I	lduba	[%r18, + 0x005f] %asi, %r25
	.word 0xfa9420f4  ! 377: LDUHA_I	lduha	[%r16, + 0x00f4] %asi, %r29
cpu_intr_2_25:
	setx	0x1c0016, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_14:
	mov	0x7, %r14
	.word 0xfcf389e0  ! 379: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xfe84e171  ! 382: LDUWA_I	lduwa	[%r19, + 0x0171] %asi, %r31
T2_asi_reg_wr_15:
	mov	0x3c7, %r14
	.word 0xf8f38e80  ! 385: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb0c48000  ! 386: ADDCcc_R	addccc 	%r18, %r0, %r24
	.word 0xf4dd20ed  ! 387: LDXA_I	ldxa	[%r20, + 0x00ed] %asi, %r26
cpu_intr_2_26:
	setx	0x1d0308, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_27:
	setx	0x1e0329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64cc000  ! 391: LDSB_R	ldsb	[%r19 + %r0], %r27
	ta	T_CHANGE_HPRIV
	.word 0xf80dc000  ! 393: LDUB_R	ldub	[%r23 + %r0], %r28
T2_asi_reg_wr_16:
	mov	0x3c4, %r14
	.word 0xfaf38e60  ! 395: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_2_28:
	setx	0x1f0022, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_29), 16, 16)) -> intp(2, 0, 38)
cpu_intr_2_29:
	setx	0x1d0307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4c5c020  ! 409: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r26
	.word 0xfc4ce0ad  ! 416: LDSB_I	ldsb	[%r19 + 0x00ad], %r30
	.word 0xfa050000  ! 417: LDUW_R	lduw	[%r20 + %r0], %r29
	.word 0xf404e0ad  ! 419: LDUW_I	lduw	[%r19 + 0x00ad], %r26
T2_asi_reg_rd_8:
	mov	0xa, %r14
	.word 0xf0db8e80  ! 421: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T2_asi_reg_wr_17:
	mov	0x10, %r14
	.word 0xfef38e80  ! 422: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982d10  ! 423: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d10, %hpstate
	.word 0xb8842174  ! 424: ADDcc_I	addcc 	%r16, 0x0174, %r28
cpu_intr_2_30:
	setx	0x1c031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6944020  ! 426: LDUHA_R	lduha	[%r17, %r0] 0x01, %r27
	.word 0xf4d4c020  ! 427: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r26
iob_intr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_30), 16, 16)) -> intp(2, 0, 2f)
	ta	T_CHANGE_TO_TL0
cpu_intr_2_31:
	setx	0x1c013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa840020  ! 431: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r29
	.word 0xf84c212c  ! 434: LDSB_I	ldsb	[%r16 + 0x012c], %r28
	.word 0xf4150000  ! 435: LDUH_R	lduh	[%r20 + %r0], %r26
iob_intr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_31), 16, 16)) -> intp(2, 0, 12)
T2_asi_reg_wr_18:
	mov	0x14, %r14
	.word 0xf0f38e40  ! 446: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_2_32:
	setx	0x1d0026, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf09521cb  ! 454: LDUHA_I	lduha	[%r20, + 0x01cb] %asi, %r24
	.word 0xfe140000  ! 455: LDUH_R	lduh	[%r16 + %r0], %r31
T2_asi_reg_wr_19:
	mov	0x3c4, %r14
	.word 0xfef38400  ! 456: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T2_asi_reg_rd_9:
	mov	0x0, %r14
	.word 0xf6db8400  ! 457: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf40c4000  ! 458: LDUB_R	ldub	[%r17 + %r0], %r26
cpu_intr_2_33:
	setx	0x1c0025, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_20:
	mov	0x4, %r14
	.word 0xfcf38e40  ! 460: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_32), 16, 16)) -> intp(2, 0, 27)
iob_intr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_33), 16, 16)) -> intp(2, 0, 7)
cpu_intr_2_34:
	setx	0x1f0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe54a17a  ! 472: LDSH_I	ldsh	[%r18 + 0x017a], %r31
iob_intr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_34), 16, 16)) -> intp(2, 0, 38)
	.word 0xf48c20e0  ! 475: LDUBA_I	lduba	[%r16, + 0x00e0] %asi, %r26
iob_intr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_35), 16, 16)) -> intp(2, 0, 14)
cpu_intr_2_35:
	setx	0x21012c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_10:
	mov	0x11, %r14
	.word 0xfedb84a0  ! 482: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf285618d  ! 487: LDUWA_I	lduwa	[%r21, + 0x018d] %asi, %r25
iob_intr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_36), 16, 16)) -> intp(2, 0, 0)
	.word 0xf8c561fd  ! 489: LDSWA_I	ldswa	[%r21, + 0x01fd] %asi, %r28
	.word 0xfe8c4020  ! 490: LDUBA_R	lduba	[%r17, %r0] 0x01, %r31
	.word 0xf2cdc020  ! 492: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r25
	.word 0xf8ccc020  ! 495: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r28
iob_intr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_37), 16, 16)) -> intp(2, 0, 2e)
iob_intr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_38), 16, 16)) -> intp(2, 0, 10)
cpu_intr_2_36:
	setx	0x21010a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_37:
	setx	0x220229, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982a4a  ! 506: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4a, %hpstate
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	.word 0xf4154000  ! 513: LDUH_R	lduh	[%r21 + %r0], %r26
iob_intr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_39), 16, 16)) -> intp(2, 0, 20)
	.word 0xfe440000  ! 518: LDSW_R	ldsw	[%r16 + %r0], %r31
iob_intr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_40), 16, 16)) -> intp(2, 0, 3e)
cpu_intr_2_38:
	setx	0x200327, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_11:
	mov	0x3c3, %r14
	.word 0xf6db89e0  ! 525: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T2_asi_reg_wr_21:
	mov	0x16, %r14
	.word 0xf6f384a0  ! 526: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_2_39:
	setx	0x21022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8d20de  ! 530: ANDcc_I	andcc 	%r20, 0x00de, %r30
	.word 0xb8ad8000  ! 531: ANDNcc_R	andncc 	%r22, %r0, %r28
	.word 0xb52ce001  ! 532: SLL_I	sll 	%r19, 0x0001, %r26
T2_asi_reg_rd_12:
	mov	0x5, %r14
	.word 0xf6db84a0  ! 534: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf0c461ff  ! 535: LDSWA_I	ldswa	[%r17, + 0x01ff] %asi, %r24
cpu_intr_2_40:
	setx	0x23021f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_22:
	mov	0x11, %r14
	.word 0xfcf384a0  ! 541: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T2_asi_reg_wr_23:
	mov	0x20, %r14
	.word 0xf8f38e40  ! 542: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_41), 16, 16)) -> intp(2, 0, 29)
	.word 0xbd641800  ! 546: MOVcc_R	<illegal instruction>
	.word 0xfccd2080  ! 547: LDSBA_I	ldsba	[%r20, + 0x0080] %asi, %r30
cpu_intr_2_41:
	setx	0x210029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf68d0020  ! 552: LDUBA_R	lduba	[%r20, %r0] 0x01, %r27
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983ac8  ! 557: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ac8, %hpstate
cpu_intr_2_42:
	setx	0x230027, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_24:
	mov	0x3c3, %r14
	.word 0xf4f384a0  ! 563: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xfacc8020  ! 565: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r29
	.word 0xf65dc000  ! 568: LDX_R	ldx	[%r23 + %r0], %r27
iob_intr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_42), 16, 16)) -> intp(2, 0, 2d)
iob_intr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_43), 16, 16)) -> intp(2, 0, 33)
	.word 0xfc0d2177  ! 590: LDUB_I	ldub	[%r20 + 0x0177], %r30
	.word 0xf0444000  ! 595: LDSW_R	ldsw	[%r17 + %r0], %r24
cpu_intr_2_43:
	setx	0x20000b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_13:
	mov	0x3c4, %r14
	.word 0xf6db8e40  ! 599: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_2_44:
	setx	0x230218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2556004  ! 601: LDSH_I	ldsh	[%r21 + 0x0004], %r25
cpu_intr_2_45:
	setx	0x230107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3dd000  ! 603: SRAX_R	srax	%r23, %r0, %r29
iob_intr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_44), 16, 16)) -> intp(2, 0, 3a)
cpu_intr_2_46:
	setx	0x220019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0052150  ! 607: LDUW_I	lduw	[%r20 + 0x0150], %r24
	.word 0xf44de178  ! 609: LDSB_I	ldsb	[%r23 + 0x0178], %r26
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983c02  ! 613: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c02, %hpstate
iob_intr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_45), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf04461d1  ! 619: LDSW_I	ldsw	[%r17 + 0x01d1], %r24
iob_intr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_46), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf2858020  ! 621: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r25
cpu_intr_2_47:
	setx	0x230110, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_25:
	mov	0x1, %r14
	.word 0xfcf38e80  ! 624: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_47), 16, 16)) -> intp(2, 0, a)
	.word 0xfac50020  ! 628: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r29
	.word 0xb935e001  ! 629: SRL_I	srl 	%r23, 0x0001, %r28
T2_asi_reg_rd_14:
	mov	0xd, %r14
	.word 0xf2db84a0  ! 630: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_2_48:
	setx	0x22021b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_26:
	mov	0x34, %r14
	.word 0xf4f38400  ! 632: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL0
	.word 0xf08d2046  ! 639: LDUBA_I	lduba	[%r20, + 0x0046] %asi, %r24
	.word 0xfc0d4000  ! 642: LDUB_R	ldub	[%r21 + %r0], %r30
	.word 0xf88ca176  ! 643: LDUBA_I	lduba	[%r18, + 0x0176] %asi, %r28
cpu_intr_2_49:
	setx	0x230028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe2ca0d9  ! 647: ANDN_I	andn 	%r18, 0x00d9, %r31
	.word 0xfe5c4000  ! 648: LDX_R	ldx	[%r17 + %r0], %r31
	ta	T_CHANGE_TO_TL0
	.word 0xfcdce005  ! 651: LDXA_I	ldxa	[%r19, + 0x0005] %asi, %r30
cpu_intr_2_50:
	setx	0x230019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf444c000  ! 654: LDSW_R	ldsw	[%r19 + %r0], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf005c000  ! 660: LDUW_R	lduw	[%r23 + %r0], %r24
	.word 0xfcc4207f  ! 664: LDSWA_I	ldswa	[%r16, + 0x007f] %asi, %r30
	.word 0xf6c461ff  ! 665: LDSWA_I	ldswa	[%r17, + 0x01ff] %asi, %r27
	.word 0xfc0de178  ! 668: LDUB_I	ldub	[%r23 + 0x0178], %r30
T2_asi_reg_wr_27:
	mov	0xe, %r14
	.word 0xf8f384a0  ! 672: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_48), 16, 16)) -> intp(2, 0, 32)
iob_intr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_49), 16, 16)) -> intp(2, 0, 3f)
T2_asi_reg_rd_15:
	mov	0x3c1, %r14
	.word 0xf6db8400  ! 676: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf8848020  ! 677: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r28
cpu_intr_2_51:
	setx	0x20032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe458000  ! 685: LDSW_R	ldsw	[%r22 + %r0], %r31
	.word 0xf6948020  ! 687: LDUHA_R	lduha	[%r18, %r0] 0x01, %r27
	.word 0xf2854020  ! 688: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r25
	.word 0xfa9420ad  ! 689: LDUHA_I	lduha	[%r16, + 0x00ad] %asi, %r29
T2_asi_reg_wr_28:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 690: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfccc8020  ! 693: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r30
	.word 0xbc8de143  ! 695: ANDcc_I	andcc 	%r23, 0x0143, %r30
	.word 0xf095a114  ! 698: LDUHA_I	lduha	[%r22, + 0x0114] %asi, %r24
	.word 0xf454a009  ! 702: LDSH_I	ldsh	[%r18 + 0x0009], %r26
cpu_intr_2_52:
	setx	0x230232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60420dc  ! 710: LDUW_I	lduw	[%r16 + 0x00dc], %r27
T2_asi_reg_rd_16:
	mov	0xb, %r14
	.word 0xf8db8e80  ! 711: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983fc2  ! 712: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc2, %hpstate
iob_intr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_50), 16, 16)) -> intp(2, 0, b)
iob_intr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_51), 16, 16)) -> intp(2, 0, 15)
	.word 0xf0846131  ! 717: LDUWA_I	lduwa	[%r17, + 0x0131] %asi, %r24
iob_intr_2_52:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_52), 16, 16)) -> intp(2, 0, 18)
T2_asi_reg_wr_29:
	mov	0x0, %r14
	.word 0xf8f38e60  ! 721: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb48ce0d3  ! 722: ANDcc_I	andcc 	%r19, 0x00d3, %r26
	.word 0xbe0521f2  ! 723: ADD_I	add 	%r20, 0x01f2, %r31
	.word 0xf2cda13e  ! 725: LDSBA_I	ldsba	[%r22, + 0x013e] %asi, %r25
	.word 0xfe4d8000  ! 728: LDSB_R	ldsb	[%r22 + %r0], %r31
cpu_intr_2_53:
	setx	0x220102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_54:
	setx	0x23022e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_53:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_53), 16, 16)) -> intp(2, 0, 3c)
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x8198289a  ! 737: WRHPR_HPSTATE_I	wrhpr	%r0, 0x089a, %hpstate
cpu_intr_2_55:
	setx	0x22031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6440000  ! 741: ADDC_R	addc 	%r16, %r0, %r27
iob_intr_2_54:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_54), 16, 16)) -> intp(2, 0, 1)
iob_intr_2_55:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_55), 16, 16)) -> intp(2, 0, 1c)
	.word 0xb9504000  ! 744: RDPR_TNPC	<illegal instruction>
	.word 0xb4b40000  ! 747: ORNcc_R	orncc 	%r16, %r0, %r26
	.word 0xf08d604d  ! 749: LDUBA_I	lduba	[%r21, + 0x004d] %asi, %r24
cpu_intr_2_56:
	setx	0x210113, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_57:
	setx	0x210109, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_17:
	mov	0x2a, %r14
	.word 0xfadb8400  ! 752: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb2c5a031  ! 755: ADDCcc_I	addccc 	%r22, 0x0031, %r25
cpu_intr_2_58:
	setx	0x230208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0d608b  ! 758: LDUB_I	ldub	[%r21 + 0x008b], %r29
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_30:
	mov	0x26, %r14
	.word 0xf2f38400  ! 765: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T2_asi_reg_wr_31:
	mov	0x21, %r14
	.word 0xf8f38400  ! 767: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL0
	.word 0xfc5d0000  ! 771: LDX_R	ldx	[%r20 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf854605a  ! 773: LDSH_I	ldsh	[%r17 + 0x005a], %r28
cpu_intr_2_59:
	setx	0x200104, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_32:
	mov	0x1b, %r14
	.word 0xf2f38e60  ! 777: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_2_60:
	setx	0x230039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5d8000  ! 780: LDX_R	ldx	[%r22 + %r0], %r31
T2_asi_reg_rd_18:
	mov	0x3c5, %r14
	.word 0xf4db89e0  ! 782: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb43d6170  ! 784: XNOR_I	xnor 	%r21, 0x0170, %r26
	.word 0xb0bda106  ! 787: XNORcc_I	xnorcc 	%r22, 0x0106, %r24
cpu_intr_2_61:
	setx	0x210328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0154000  ! 791: LDUH_R	lduh	[%r21 + %r0], %r24
cpu_intr_2_62:
	setx	0x210020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0d4000  ! 793: LDUB_R	ldub	[%r21 + %r0], %r29
cpu_intr_2_63:
	setx	0x21022d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_33:
	mov	0xf, %r14
	.word 0xf6f38e40  ! 798: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfac4e0b8  ! 799: LDSWA_I	ldswa	[%r19, + 0x00b8] %asi, %r29
	.word 0x8f902000  ! 801: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xf61420aa  ! 804: LDUH_I	lduh	[%r16 + 0x00aa], %r27
	.word 0xbf7d2401  ! 806: MOVR_I	movre	%r20, 0x1, %r31
cpu_intr_2_64:
	setx	0x230118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x91946071  ! 814: WRPR_PIL_I	wrpr	%r17, 0x0071, %pil
iob_intr_2_56:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_56), 16, 16)) -> intp(2, 0, 30)
cpu_intr_2_65:
	setx	0x21012d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_66:
	setx	0x210122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf643801  ! 820: MOVcc_I	<illegal instruction>
iob_intr_2_57:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_57), 16, 16)) -> intp(2, 0, 24)
cpu_intr_2_67:
	setx	0x20022a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_34:
	mov	0x29, %r14
	.word 0xf8f38400  ! 827: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_2_68:
	setx	0x200336, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf6444000  ! 836: LDSW_R	ldsw	[%r17 + %r0], %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_19:
	mov	0x3c0, %r14
	.word 0xf8db8e40  ! 840: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_2_58:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_58), 16, 16)) -> intp(2, 0, 21)
iob_intr_2_59:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_59), 16, 16)) -> intp(2, 0, 2)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_60:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_60), 16, 16)) -> intp(2, 0, 26)
	.word 0xb684c000  ! 845: ADDcc_R	addcc 	%r19, %r0, %r27
cpu_intr_2_69:
	setx	0x210132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0850020  ! 847: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r24
	.word 0xfc8dc020  ! 848: LDUBA_R	lduba	[%r23, %r0] 0x01, %r30
	.word 0xfc95e079  ! 849: LDUHA_I	lduha	[%r23, + 0x0079] %asi, %r30
	.word 0xfe148000  ! 850: LDUH_R	lduh	[%r18 + %r0], %r31
	.word 0xfa958020  ! 851: LDUHA_R	lduha	[%r22, %r0] 0x01, %r29
	.word 0xb73dd000  ! 852: SRAX_R	srax	%r23, %r0, %r27
T2_asi_reg_rd_20:
	mov	0x27, %r14
	.word 0xfadb8e80  ! 853: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb60d60d2  ! 856: AND_I	and 	%r21, 0x00d2, %r27
iob_intr_2_61:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_61), 16, 16)) -> intp(2, 0, 2c)
T2_asi_reg_wr_35:
	mov	0x3c4, %r14
	.word 0xfcf38e60  ! 859: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xfa840020  ! 862: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r29
iob_intr_2_62:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_62), 16, 16)) -> intp(2, 0, 11)
	.word 0xf2152008  ! 866: LDUH_I	lduh	[%r20 + 0x0008], %r25
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_36:
	mov	0x6, %r14
	.word 0xf4f389e0  ! 868: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_2_70:
	setx	0x210219, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_71:
	setx	0x200035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf604a087  ! 875: LDUW_I	lduw	[%r18 + 0x0087], %r27
iob_intr_2_63:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_63), 16, 16)) -> intp(2, 0, 28)
cpu_intr_2_72:
	setx	0x220009, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xb12c8000  ! 882: SLL_R	sll 	%r18, %r0, %r24
T2_asi_reg_wr_37:
	mov	0x30, %r14
	.word 0xf4f384a0  ! 883: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T2_asi_reg_rd_21:
	mov	0x14, %r14
	.word 0xfadb8400  ! 884: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xfad50020  ! 889: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r29
	.word 0xf05c4000  ! 890: LDX_R	ldx	[%r17 + %r0], %r24
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_73:
	setx	0x220114, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_64:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_64), 16, 16)) -> intp(2, 0, 18)
cpu_intr_2_74:
	setx	0x23021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983b40  ! 899: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b40, %hpstate
T2_asi_reg_wr_38:
	mov	0x3c7, %r14
	.word 0xfcf38e60  ! 900: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb77c0400  ! 901: MOVR_R	movre	%r16, %r0, %r27
iob_intr_2_65:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_65), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_wr_39:
	mov	0x12, %r14
	.word 0xf0f38400  ! 904: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T2_asi_reg_wr_40:
	mov	0x10, %r14
	.word 0xfaf384a0  ! 907: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xf285c020  ! 910: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r25
	.word 0xb4b56195  ! 911: SUBCcc_I	orncc 	%r21, 0x0195, %r26
iob_intr_2_66:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_66), 16, 16)) -> intp(2, 0, e)
T2_asi_reg_wr_41:
	mov	0x1c, %r14
	.word 0xf8f38400  ! 917: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xfcc58020  ! 918: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r30
cpu_intr_2_75:
	setx	0x22030d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_76:
	setx	0x23011c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_42:
	mov	0x3c3, %r14
	.word 0xf8f38e40  ! 923: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_rd_22:
	mov	0x14, %r14
	.word 0xf8db8e40  ! 925: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbc440000  ! 928: ADDC_R	addc 	%r16, %r0, %r30
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983c52  ! 930: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c52, %hpstate
	.word 0xf445e133  ! 931: LDSW_I	ldsw	[%r23 + 0x0133], %r26
T2_asi_reg_wr_43:
	mov	0x5, %r14
	.word 0xfaf38e40  ! 933: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982d58  ! 934: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d58, %hpstate
iob_intr_2_67:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_67), 16, 16)) -> intp(2, 0, 2b)
T2_asi_reg_rd_23:
	mov	0x3c1, %r14
	.word 0xf2db8e80  ! 943: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb494c000  ! 944: ORcc_R	orcc 	%r19, %r0, %r26
T2_asi_reg_rd_24:
	mov	0x3c4, %r14
	.word 0xf2db8e40  ! 946: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_wr_44:
	mov	0x3c1, %r14
	.word 0xf0f38e60  ! 947: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_2_68:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_68), 16, 16)) -> intp(2, 0, f)
iob_intr_2_69:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_69), 16, 16)) -> intp(2, 0, 1d)
T2_asi_reg_wr_45:
	mov	0x10, %r14
	.word 0xf8f38400  ! 955: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_2_77:
	setx	0x240324, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_70:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_70), 16, 16)) -> intp(2, 0, 2f)
T2_asi_reg_rd_25:
	mov	0x2b, %r14
	.word 0xfadb8400  ! 962: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf80c615d  ! 963: LDUB_I	ldub	[%r17 + 0x015d], %r28
	.word 0xf4dc207c  ! 964: LDXA_I	ldxa	[%r16, + 0x007c] %asi, %r26
iob_intr_2_71:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_71), 16, 16)) -> intp(2, 0, 6)
	.word 0xf2444000  ! 969: LDSW_R	ldsw	[%r17 + %r0], %r25
	.word 0xfccd61ef  ! 970: LDSBA_I	ldsba	[%r21, + 0x01ef] %asi, %r30
	.word 0xf055a0fc  ! 971: LDSH_I	ldsh	[%r22 + 0x00fc], %r24
	.word 0xfe04e138  ! 975: LDUW_I	lduw	[%r19 + 0x0138], %r31
T2_asi_reg_rd_26:
	mov	0xb, %r14
	.word 0xfadb8e40  ! 976: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf65c4000  ! 978: LDX_R	ldx	[%r17 + %r0], %r27
	.word 0xf205616e  ! 980: LDUW_I	lduw	[%r21 + 0x016e], %r25
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983ac8  ! 983: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ac8, %hpstate
iob_intr_2_72:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_72), 16, 16)) -> intp(2, 0, 1)
	.word 0xf8548000  ! 991: LDSH_R	ldsh	[%r18 + %r0], %r28
T2_asi_reg_rd_27:
	mov	0x3c7, %r14
	.word 0xf4db8e60  ! 995: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T2_asi_reg_rd_28:
	mov	0x3c4, %r14
	.word 0xfcdb89e0  ! 996: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_2_78:
	setx	0x240318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb97d2401  ! 998: MOVR_I	movre	%r20, 0x1, %r28
	ta	T_CHANGE_TO_TL0
iob_intr_2_73:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_73), 16, 16)) -> intp(2, 0, 13)
iob_intr_2_74:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_74), 16, 16)) -> intp(2, 0, 1d)
	ta	T_CHANGE_TO_TL0
	.word 0xf8cde016  ! 1008: LDSBA_I	ldsba	[%r23, + 0x0016] %asi, %r28
iob_intr_2_75:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_75), 16, 16)) -> intp(2, 0, 14)
cpu_intr_2_79:
	setx	0x250309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0144000  ! 1011: OR_R	or 	%r17, %r0, %r24
T2_asi_reg_rd_29:
	mov	0x15, %r14
	.word 0xf0db8e40  ! 1012: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfc554000  ! 1015: LDSH_R	ldsh	[%r21 + %r0], %r30
T2_asi_reg_wr_46:
	mov	0x1e, %r14
	.word 0xf2f38e80  ! 1016: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_2_80:
	setx	0x250039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfed5c020  ! 1018: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r31
	.word 0xfc440000  ! 1022: LDSW_R	ldsw	[%r16 + %r0], %r30
iob_intr_2_76:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_76), 16, 16)) -> intp(2, 0, 0)
	.word 0xf8c4a18d  ! 1024: LDSWA_I	ldswa	[%r18, + 0x018d] %asi, %r28
cpu_intr_2_81:
	setx	0x240309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf015c000  ! 1027: LDUH_R	lduh	[%r23 + %r0], %r24
	ta	T_CHANGE_NONHPRIV
iob_intr_2_77:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_77), 16, 16)) -> intp(2, 0, 32)
iob_intr_2_78:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_78), 16, 16)) -> intp(2, 0, 1e)
cpu_intr_2_82:
	setx	0x25003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb32cb001  ! 1045: SLLX_I	sllx	%r18, 0x0001, %r25
cpu_intr_2_83:
	setx	0x26001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d50020  ! 1050: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r25
iob_intr_2_79:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_79), 16, 16)) -> intp(2, 0, 3b)
	.word 0xf804c000  ! 1056: LDUW_R	lduw	[%r19 + %r0], %r28
iob_intr_2_80:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_80), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_rd_30:
	mov	0x37, %r14
	.word 0xfcdb8e80  ! 1059: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T2_asi_reg_rd_31:
	mov	0x17, %r14
	.word 0xfcdb84a0  ! 1060: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_2_81:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_81), 16, 16)) -> intp(2, 0, 22)
T2_asi_reg_wr_47:
	mov	0x25, %r14
	.word 0xf0f384a0  ! 1063: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T2_asi_reg_wr_48:
	mov	0x18, %r14
	.word 0xf8f389e0  ! 1064: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf8c5604d  ! 1065: LDSWA_I	ldswa	[%r21, + 0x004d] %asi, %r28
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982ad0  ! 1066: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad0, %hpstate
iob_intr_2_82:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_82), 16, 16)) -> intp(2, 0, f)
	.word 0xbe9420f4  ! 1069: ORcc_I	orcc 	%r16, 0x00f4, %r31
	.word 0xfc4cc000  ! 1074: LDSB_R	ldsb	[%r19 + %r0], %r30
iob_intr_2_83:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_83), 16, 16)) -> intp(2, 0, 2d)
	setx	data_start_1, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982e98  ! 1076: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e98, %hpstate
	.word 0xfa5d4000  ! 1077: LDX_R	ldx	[%r21 + %r0], %r29
iob_intr_2_84:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_84), 16, 16)) -> intp(2, 0, 27)
	.word 0xb0bd8000  ! 1079: XNORcc_R	xnorcc 	%r22, %r0, %r24
cpu_intr_2_84:
	setx	0x240226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfccce1ca  ! 1083: LDSBA_I	ldsba	[%r19, + 0x01ca] %asi, %r30
	.word 0xf88d6135  ! 1084: LDUBA_I	lduba	[%r21, + 0x0135] %asi, %r28
T2_asi_reg_wr_49:
	mov	0x3c1, %r14
	.word 0xf0f38e60  ! 1085: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xbe342120  ! 1086: ORN_I	orn 	%r16, 0x0120, %r31
	.word 0xf64c61ba  ! 1087: LDSB_I	ldsb	[%r17 + 0x01ba], %r27
iob_intr_2_85:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_85), 16, 16)) -> intp(2, 0, 31)
	.word 0xfc8dc020  ! 1093: LDUBA_R	lduba	[%r23, %r0] 0x01, %r30
T2_asi_reg_wr_50:
	mov	0xd, %r14
	.word 0xf4f38400  ! 1098: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbc9c4000  ! 1101: XORcc_R	xorcc 	%r17, %r0, %r30
	.word 0xfe8520be  ! 1103: LDUWA_I	lduwa	[%r20, + 0x00be] %asi, %r31
	ta	T_CHANGE_TO_TL0
cpu_intr_2_85:
	setx	0x250219, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_86:
	setx	0x260230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf454c000  ! 1114: LDSH_R	ldsh	[%r19 + %r0], %r26
T2_asi_reg_rd_32:
	mov	0x3c3, %r14
	.word 0xf8db89e0  ! 1116: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_2_86:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_86), 16, 16)) -> intp(2, 0, 32)
cpu_intr_2_87:
	setx	0x260239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5c0000  ! 1124: LDX_R	ldx	[%r16 + %r0], %r29
iob_intr_2_87:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_87), 16, 16)) -> intp(2, 0, 34)
iob_intr_2_88:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_88), 16, 16)) -> intp(2, 0, 14)
	.word 0xf6c48020  ! 1129: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r27
T2_asi_reg_rd_33:
	mov	0x3c3, %r14
	.word 0xfadb89e0  ! 1131: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf64cc000  ! 1132: LDSB_R	ldsb	[%r19 + %r0], %r27
	.word 0xf05c4000  ! 1134: LDX_R	ldx	[%r17 + %r0], %r24
	.word 0xfa544000  ! 1135: LDSH_R	ldsh	[%r17 + %r0], %r29
cpu_intr_2_88:
	setx	0x270129, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_34:
	mov	0x2, %r14
	.word 0xf0db8e80  ! 1145: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_2_89:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_89), 16, 16)) -> intp(2, 0, 28)
	.word 0xfecd8020  ! 1150: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r31
iob_intr_2_90:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_90), 16, 16)) -> intp(2, 0, 8)
T2_asi_reg_wr_51:
	mov	0x2c, %r14
	.word 0xf2f389e0  ! 1152: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982dd0  ! 1160: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd0, %hpstate
	.word 0xf0cd600a  ! 1161: LDSBA_I	ldsba	[%r21, + 0x000a] %asi, %r24
iob_intr_2_91:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_91), 16, 16)) -> intp(2, 0, b)
	.word 0xf28ce157  ! 1167: LDUBA_I	lduba	[%r19, + 0x0157] %asi, %r25
	.word 0xfcc48020  ! 1169: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r30
	.word 0xfadd6144  ! 1170: LDXA_I	ldxa	[%r21, + 0x0144] %asi, %r29
cpu_intr_2_89:
	setx	0x260303, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_92:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_92), 16, 16)) -> intp(2, 0, 1b)
iob_intr_2_93:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_93), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_90:
	setx	0x250236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2950020  ! 1186: LDUHA_R	lduha	[%r20, %r0] 0x01, %r25
	.word 0xf8c54020  ! 1189: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r28
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_35:
	mov	0x4, %r14
	.word 0xf8db8e60  ! 1194: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf485a15b  ! 1195: LDUWA_I	lduwa	[%r22, + 0x015b] %asi, %r26
T2_asi_reg_wr_52:
	mov	0x23, %r14
	.word 0xfaf38e60  ! 1197: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T2_asi_reg_rd_36:
	mov	0x1d, %r14
	.word 0xf4db8400  ! 1200: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T2_asi_reg_wr_53:
	mov	0x3c5, %r14
	.word 0xfaf38e60  ! 1201: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_2_94:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_94), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_wr_54:
	mov	0x15, %r14
	.word 0xf6f38e40  ! 1206: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_rd_37:
	mov	0x31, %r14
	.word 0xf6db84a0  ! 1207: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb4b4607d  ! 1209: SUBCcc_I	orncc 	%r17, 0x007d, %r26
T2_asi_reg_wr_55:
	mov	0x3c6, %r14
	.word 0xfcf384a0  ! 1210: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf685a12f  ! 1212: LDUWA_I	lduwa	[%r22, + 0x012f] %asi, %r27
	.word 0xf605615f  ! 1214: LDUW_I	lduw	[%r21 + 0x015f], %r27
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf05d4000  ! 1217: LDX_R	ldx	[%r21 + %r0], %r24
cpu_intr_2_91:
	setx	0x260235, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_92:
	setx	0x27020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4c58000  ! 1228: ADDCcc_R	addccc 	%r22, %r0, %r26
	.word 0xfc0d615d  ! 1233: LDUB_I	ldub	[%r21 + 0x015d], %r30
iob_intr_2_95:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_95), 16, 16)) -> intp(2, 0, 30)
cpu_intr_2_93:
	setx	0x250017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb01d8000  ! 1239: XOR_R	xor 	%r22, %r0, %r24
	.word 0xf84d4000  ! 1240: LDSB_R	ldsb	[%r21 + %r0], %r28
T2_asi_reg_wr_56:
	mov	0xd, %r14
	.word 0xf0f38400  ! 1243: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982bd0  ! 1244: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd0, %hpstate
cpu_intr_2_94:
	setx	0x27012b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_96:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_96), 16, 16)) -> intp(2, 0, f)
cpu_intr_2_95:
	setx	0x250229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeccc020  ! 1248: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r31
	.word 0xf85d0000  ! 1251: LDX_R	ldx	[%r20 + %r0], %r28
T2_asi_reg_wr_57:
	mov	0x2a, %r14
	.word 0xfaf38e40  ! 1257: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	ta	T_CHANGE_NONHPRIV
	.word 0xfcdca1b2  ! 1260: LDXA_I	ldxa	[%r18, + 0x01b2] %asi, %r30
	.word 0xf80c0000  ! 1262: LDUB_R	ldub	[%r16 + %r0], %r28
	.word 0xfc542055  ! 1263: LDSH_I	ldsh	[%r16 + 0x0055], %r30
	.word 0xf40de047  ! 1265: LDUB_I	ldub	[%r23 + 0x0047], %r26
iob_intr_2_97:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_97), 16, 16)) -> intp(2, 0, 3f)
cpu_intr_2_96:
	setx	0x270235, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_98:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_98), 16, 16)) -> intp(2, 0, 2b)
cpu_intr_2_97:
	setx	0x270017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x87952046  ! 1285: WRPR_TT_I	wrpr	%r20, 0x0046, %tt
	.word 0xfcd4e137  ! 1287: LDSHA_I	ldsha	[%r19, + 0x0137] %asi, %r30
	.word 0xf8d44020  ! 1289: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r28
T2_asi_reg_wr_58:
	mov	0x9, %r14
	.word 0xf6f38e40  ! 1290: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_2_99:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_99), 16, 16)) -> intp(2, 0, 31)
iob_intr_2_100:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_100), 16, 16)) -> intp(2, 0, 8)
cpu_intr_2_98:
	setx	0x260227, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf80da074  ! 1299: LDUB_I	ldub	[%r22 + 0x0074], %r28
T2_asi_reg_rd_38:
	mov	0x1f, %r14
	.word 0xfedb8e40  ! 1302: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfe950020  ! 1303: LDUHA_R	lduha	[%r20, %r0] 0x01, %r31
	.word 0xfcc48020  ! 1304: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r30
	.word 0xfe5ca1af  ! 1308: LDX_I	ldx	[%r18 + 0x01af], %r31
iob_intr_2_101:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_101), 16, 16)) -> intp(2, 0, 24)
	.word 0xfac4606a  ! 1311: LDSWA_I	ldswa	[%r17, + 0x006a] %asi, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf0cce1f9  ! 1313: LDSBA_I	ldsba	[%r19, + 0x01f9] %asi, %r24
cpu_intr_2_99:
	setx	0x26001f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_102:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_102), 16, 16)) -> intp(2, 0, 3)
T2_asi_reg_wr_59:
	mov	0x16, %r14
	.word 0xfaf38e40  ! 1322: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_103:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_103), 16, 16)) -> intp(2, 0, 1)
cpu_intr_2_100:
	setx	0x240315, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_39:
	mov	0x3c1, %r14
	.word 0xf8db8e40  ! 1333: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_2_101:
	setx	0x24031e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_102:
	setx	0x24032b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_40:
	mov	0x3c4, %r14
	.word 0xf8db8e80  ! 1340: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf8c4c020  ! 1341: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r28
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982a5a  ! 1344: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5a, %hpstate
iob_intr_2_104:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_104), 16, 16)) -> intp(2, 0, 15)
	.word 0xfa55c000  ! 1346: LDSH_R	ldsh	[%r23 + %r0], %r29
	.word 0xfc5d4000  ! 1347: LDX_R	ldx	[%r21 + %r0], %r30
T2_asi_reg_wr_60:
	mov	0x4, %r14
	.word 0xf8f38e80  ! 1350: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T2_asi_reg_rd_41:
	mov	0x7, %r14
	.word 0xf4db84a0  ! 1351: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf8156150  ! 1352: LDUH_I	lduh	[%r21 + 0x0150], %r28
	.word 0xf0554000  ! 1356: LDSH_R	ldsh	[%r21 + %r0], %r24
	.word 0xb0b48000  ! 1357: SUBCcc_R	orncc 	%r18, %r0, %r24
	.word 0xf05561a9  ! 1358: LDSH_I	ldsh	[%r21 + 0x01a9], %r24
iob_intr_2_105:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_105), 16, 16)) -> intp(2, 0, 36)
	.word 0xf85dc000  ! 1360: LDX_R	ldx	[%r23 + %r0], %r28
cpu_intr_2_103:
	setx	0x240038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_106:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_106), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf255e1b8  ! 1365: LDSH_I	ldsh	[%r23 + 0x01b8], %r25
T2_asi_reg_rd_42:
	mov	0x13, %r14
	.word 0xfedb8400  ! 1366: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_2_104:
	setx	0x250225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4c50020  ! 1370: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r26
T2_asi_reg_wr_61:
	mov	0x3c7, %r14
	.word 0xf6f38e80  ! 1372: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf2840020  ! 1375: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r25
T2_asi_reg_rd_43:
	mov	0x3c8, %r14
	.word 0xfadb8e40  ! 1377: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfe04e01c  ! 1379: LDUW_I	lduw	[%r19 + 0x001c], %r31
iob_intr_2_107:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_107), 16, 16)) -> intp(2, 0, 16)
	.word 0xf0cce0ed  ! 1381: LDSBA_I	ldsba	[%r19, + 0x00ed] %asi, %r24
	.word 0xfa4d60ee  ! 1382: LDSB_I	ldsb	[%r21 + 0x00ee], %r29
	.word 0xf49420c5  ! 1383: LDUHA_I	lduha	[%r16, + 0x00c5] %asi, %r26
T2_asi_reg_wr_62:
	mov	0x10, %r14
	.word 0xfcf38e60  ! 1385: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T2_asi_reg_rd_44:
	mov	0x3c7, %r14
	.word 0xfadb8e60  ! 1386: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf24c60e6  ! 1387: LDSB_I	ldsb	[%r17 + 0x00e6], %r25
	.word 0xf6456032  ! 1389: LDSW_I	ldsw	[%r21 + 0x0032], %r27
	.word 0xfa8461da  ! 1390: LDUWA_I	lduwa	[%r17, + 0x01da] %asi, %r29
	.word 0xf88de198  ! 1392: LDUBA_I	lduba	[%r23, + 0x0198] %asi, %r28
	.word 0xf0d40020  ! 1393: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r24
iob_intr_2_108:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_108), 16, 16)) -> intp(2, 0, 37)
T2_asi_reg_rd_45:
	mov	0xd, %r14
	.word 0xfadb84a0  ! 1397: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_2_109:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_109), 16, 16)) -> intp(2, 0, 18)
	.word 0xfe4d4000  ! 1399: LDSB_R	ldsb	[%r21 + %r0], %r31
T2_asi_reg_rd_46:
	mov	0x3c4, %r14
	.word 0xfedb84a0  ! 1401: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982b4a  ! 1405: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4a, %hpstate
	.word 0xfc448000  ! 1406: LDSW_R	ldsw	[%r18 + %r0], %r30
iob_intr_2_110:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_110), 16, 16)) -> intp(2, 0, 36)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_105:
	setx	0x290307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_106:
	setx	0x28031f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_47:
	mov	0x27, %r14
	.word 0xfadb84a0  ! 1413: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf4dca0c7  ! 1414: LDXA_I	ldxa	[%r18, + 0x00c7] %asi, %r26
	.word 0xfc544000  ! 1415: LDSH_R	ldsh	[%r17 + %r0], %r30
	.word 0xfa054000  ! 1416: LDUW_R	lduw	[%r21 + %r0], %r29
	.word 0xfc448000  ! 1418: LDSW_R	ldsw	[%r18 + %r0], %r30
cpu_intr_2_107:
	setx	0x280101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4421cc  ! 1421: LDSW_I	ldsw	[%r16 + 0x01cc], %r31
	.word 0xb2854000  ! 1423: ADDcc_R	addcc 	%r21, %r0, %r25
	ta	T_CHANGE_TO_TL0
cpu_intr_2_108:
	setx	0x2a0124, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_111:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_111), 16, 16)) -> intp(2, 0, 12)
T2_asi_reg_rd_48:
	mov	0x8, %r14
	.word 0xfadb84a0  ! 1431: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf88c20d3  ! 1438: LDUBA_I	lduba	[%r16, + 0x00d3] %asi, %r28
	.word 0xfc848020  ! 1440: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r30
	.word 0xf05c607e  ! 1443: LDX_I	ldx	[%r17 + 0x007e], %r24
	ta	T_CHANGE_TO_TL1
	.word 0xfc4c61d2  ! 1449: LDSB_I	ldsb	[%r17 + 0x01d2], %r30
cpu_intr_2_109:
	setx	0x2b001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983dc2  ! 1454: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dc2, %hpstate
iob_intr_2_112:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_112), 16, 16)) -> intp(2, 0, d)
iob_intr_2_113:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_113), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_wr_63:
	mov	0x3c5, %r14
	.word 0xfef389e0  ! 1459: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T2_asi_reg_wr_64:
	mov	0x6, %r14
	.word 0xf4f38e80  ! 1461: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T2_asi_reg_rd_49:
	mov	0x3c8, %r14
	.word 0xf6db8e80  ! 1463: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xfc04a0ca  ! 1465: LDUW_I	lduw	[%r18 + 0x00ca], %r30
	.word 0xf445a053  ! 1466: LDSW_I	ldsw	[%r22 + 0x0053], %r26
cpu_intr_2_110:
	setx	0x290005, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_111:
	setx	0x280209, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_112:
	setx	0x290233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_113:
	setx	0x290317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_114:
	setx	0x290229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba04a08d  ! 1475: ADD_I	add 	%r18, 0x008d, %r29
iob_intr_2_114:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_114), 16, 16)) -> intp(2, 0, 9)
cpu_intr_2_115:
	setx	0x280035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb40d219c  ! 1485: AND_I	and 	%r20, 0x019c, %r26
	.word 0xf2dc6059  ! 1498: LDXA_I	ldxa	[%r17, + 0x0059] %asi, %r25
	.word 0xfac44020  ! 1499: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r29
	.word 0xfa5d4000  ! 1501: LDX_R	ldx	[%r21 + %r0], %r29
	.word 0xfa5dc000  ! 1503: LDX_R	ldx	[%r23 + %r0], %r29
	.word 0xf8954020  ! 1504: LDUHA_R	lduha	[%r21, %r0] 0x01, %r28
cpu_intr_2_116:
	setx	0x2a0123, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_115:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_115), 16, 16)) -> intp(2, 0, 1)
T2_asi_reg_wr_65:
	mov	0x15, %r14
	.word 0xf8f38e40  ! 1509: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfa8c8020  ! 1510: LDUBA_R	lduba	[%r18, %r0] 0x01, %r29
T2_asi_reg_wr_66:
	mov	0x3c2, %r14
	.word 0xf6f38e60  ! 1511: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_2_116:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_116), 16, 16)) -> intp(2, 0, 1b)
	.word 0xfe54e1ce  ! 1516: LDSH_I	ldsh	[%r19 + 0x01ce], %r31
cpu_intr_2_117:
	setx	0x29002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2c5e1f5  ! 1519: LDSWA_I	ldswa	[%r23, + 0x01f5] %asi, %r25
cpu_intr_2_118:
	setx	0x2b013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2540000  ! 1523: LDSH_R	ldsh	[%r16 + %r0], %r25
T2_asi_reg_rd_50:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 1524: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf285a1ca  ! 1525: LDUWA_I	lduwa	[%r22, + 0x01ca] %asi, %r25
	.word 0xfa94e00d  ! 1527: LDUHA_I	lduha	[%r19, + 0x000d] %asi, %r29
cpu_intr_2_119:
	setx	0x29020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4d60c3  ! 1529: LDSB_I	ldsb	[%r21 + 0x00c3], %r29
	.word 0xf40c6032  ! 1531: LDUB_I	ldub	[%r17 + 0x0032], %r26
	.word 0xf0d4e1ba  ! 1534: LDSHA_I	ldsha	[%r19, + 0x01ba] %asi, %r24
T2_asi_reg_rd_51:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 1535: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_2_120:
	setx	0x280238, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_67:
	mov	0x11, %r14
	.word 0xfaf384a0  ! 1537: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xf29461af  ! 1539: LDUHA_I	lduha	[%r17, + 0x01af] %asi, %r25
	.word 0xfe8c8020  ! 1543: LDUBA_R	lduba	[%r18, %r0] 0x01, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf00d603c  ! 1546: LDUB_I	ldub	[%r21 + 0x003c], %r24
T2_asi_reg_rd_52:
	mov	0x3c0, %r14
	.word 0xf2db8400  ! 1549: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xfacd0020  ! 1550: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r29
cpu_intr_2_121:
	setx	0x290311, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_122:
	setx	0x28001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8d203a  ! 1557: LDUBA_I	lduba	[%r20, + 0x003a] %asi, %r29
	.word 0xf8558000  ! 1558: LDSH_R	ldsh	[%r22 + %r0], %r28
	.word 0xfa054000  ! 1559: LDUW_R	lduw	[%r21 + %r0], %r29
iob_intr_2_117:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_117), 16, 16)) -> intp(2, 0, b)
	.word 0xbb643801  ! 1563: MOVcc_I	<illegal instruction>
iob_intr_2_118:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_118), 16, 16)) -> intp(2, 0, 1)
	.word 0xf4944020  ! 1565: LDUHA_R	lduha	[%r17, %r0] 0x01, %r26
T2_asi_reg_wr_68:
	mov	0x18, %r14
	.word 0xfaf389e0  ! 1567: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_2_119:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_119), 16, 16)) -> intp(2, 0, 11)
T2_asi_reg_rd_53:
	mov	0x17, %r14
	.word 0xf2db8e80  ! 1569: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_2_123:
	setx	0x290330, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_54:
	mov	0x1f, %r14
	.word 0xf0db8e40  ! 1571: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T2_asi_reg_wr_69:
	mov	0x8, %r14
	.word 0xf8f38e40  ! 1572: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_2_124:
	setx	0x2a0101, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_120:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_120), 16, 16)) -> intp(2, 0, 2e)
cpu_intr_2_125:
	setx	0x28013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2856076  ! 1583: LDUWA_I	lduwa	[%r21, + 0x0076] %asi, %r25
	.word 0xfa94a150  ! 1584: LDUHA_I	lduha	[%r18, + 0x0150] %asi, %r29
T2_asi_reg_rd_55:
	mov	0x1c, %r14
	.word 0xfadb8e40  ! 1585: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf615c000  ! 1587: LDUH_R	lduh	[%r23 + %r0], %r27
	ta	T_CHANGE_NONHPRIV
iob_intr_2_121:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_121), 16, 16)) -> intp(2, 0, 27)
	.word 0xfa844020  ! 1593: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r29
	.word 0xf085c020  ! 1594: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r24
T2_asi_reg_wr_70:
	mov	0x19, %r14
	.word 0xfef38e40  ! 1595: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_rd_56:
	mov	0x21, %r14
	.word 0xf8db8e80  ! 1596: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_126:
	setx	0x2b0225, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_122:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_122), 16, 16)) -> intp(2, 0, 21)
	.word 0xfc040000  ! 1604: LDUW_R	lduw	[%r16 + %r0], %r30
iob_intr_2_123:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_123), 16, 16)) -> intp(2, 0, 3)
	.word 0xf894a1e7  ! 1608: LDUHA_I	lduha	[%r18, + 0x01e7] %asi, %r28
	.word 0xfacd8020  ! 1611: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r29
	.word 0xfc4d0000  ! 1612: LDSB_R	ldsb	[%r20 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_124:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_124), 16, 16)) -> intp(2, 0, 1b)
	.word 0xfadd2069  ! 1619: LDXA_I	ldxa	[%r20, + 0x0069] %asi, %r29
	.word 0xfe55e184  ! 1622: LDSH_I	ldsh	[%r23 + 0x0184], %r31
	.word 0xf8cc0020  ! 1623: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r28
T2_asi_reg_wr_71:
	mov	0x3c0, %r14
	.word 0xfaf38e40  ! 1626: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_127:
	setx	0x29020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf40421fb  ! 1633: LDUW_I	lduw	[%r16 + 0x01fb], %r26
	.word 0xf20d0000  ! 1635: LDUB_R	ldub	[%r20 + %r0], %r25
	.word 0xf014c000  ! 1636: LDUH_R	lduh	[%r19 + %r0], %r24
T2_asi_reg_rd_57:
	mov	0x3c0, %r14
	.word 0xf6db84a0  ! 1637: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_2_128:
	setx	0x2b033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6cc8020  ! 1639: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r27
	.word 0xf64cc000  ! 1640: LDSB_R	ldsb	[%r19 + %r0], %r27
T2_asi_reg_wr_72:
	mov	0x3c2, %r14
	.word 0xfef38e40  ! 1641: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf645a154  ! 1642: LDSW_I	ldsw	[%r22 + 0x0154], %r27
cpu_intr_2_129:
	setx	0x2b030b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_130:
	setx	0x280224, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_131:
	setx	0x2a0307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_132:
	setx	0x280138, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_133:
	setx	0x2a0338, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_58:
	mov	0x3c8, %r14
	.word 0xf6db8e40  ! 1659: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf0cca0d6  ! 1663: LDSBA_I	ldsba	[%r18, + 0x00d6] %asi, %r24
cpu_intr_2_134:
	setx	0x2a0324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbac54000  ! 1666: ADDCcc_R	addccc 	%r21, %r0, %r29
T2_asi_reg_wr_73:
	mov	0x2e, %r14
	.word 0xfaf38400  ! 1667: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf60da1c0  ! 1668: LDUB_I	ldub	[%r22 + 0x01c0], %r27
iob_intr_2_125:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_125), 16, 16)) -> intp(2, 0, 2e)
cpu_intr_2_135:
	setx	0x29023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfed48020  ! 1671: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r31
T2_asi_reg_rd_59:
	mov	0x2, %r14
	.word 0xf0db84a0  ! 1672: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	ta	T_CHANGE_HPRIV
cpu_intr_2_136:
	setx	0x2b0313, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_126:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_126), 16, 16)) -> intp(2, 0, 23)
	.word 0xbb50c000  ! 1679: RDPR_TT	<illegal instruction>
T2_asi_reg_rd_60:
	mov	0x35, %r14
	.word 0xf6db8e40  ! 1680: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_2_127:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_127), 16, 16)) -> intp(2, 0, 2a)
cpu_intr_2_137:
	setx	0x2a0101, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_2_128:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_128), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf0458000  ! 1693: LDSW_R	ldsw	[%r22 + %r0], %r24
T2_asi_reg_wr_74:
	mov	0x12, %r14
	.word 0xfcf38e80  ! 1694: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xfadda029  ! 1695: LDXA_I	ldxa	[%r22, + 0x0029] %asi, %r29
	.word 0xfe4d6127  ! 1696: LDSB_I	ldsb	[%r21 + 0x0127], %r31
iob_intr_2_129:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_129), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf68c8020  ! 1700: LDUBA_R	lduba	[%r18, %r0] 0x01, %r27
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983a98  ! 1701: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a98, %hpstate
cpu_intr_2_138:
	setx	0x290233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_139:
	setx	0x2b0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4cc4020  ! 1707: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r26
	ta	T_CHANGE_TO_TL1
	.word 0xfc0de18b  ! 1709: LDUB_I	ldub	[%r23 + 0x018b], %r30
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982f12  ! 1710: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f12, %hpstate
	.word 0xbc350000  ! 1711: ORN_R	orn 	%r20, %r0, %r30
	.word 0xfadce19b  ! 1712: LDXA_I	ldxa	[%r19, + 0x019b] %asi, %r29
	.word 0xfc8dc020  ! 1715: LDUBA_R	lduba	[%r23, %r0] 0x01, %r30
	.word 0xf404c000  ! 1717: LDUW_R	lduw	[%r19 + %r0], %r26
	.word 0xf24de0ff  ! 1721: LDSB_I	ldsb	[%r23 + 0x00ff], %r25
T2_asi_reg_wr_75:
	mov	0x18, %r14
	.word 0xf8f384a0  ! 1722: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_2_140:
	setx	0x2b0132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb09dc000  ! 1727: XORcc_R	xorcc 	%r23, %r0, %r24
cpu_intr_2_141:
	setx	0x290324, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_61:
	mov	0x1b, %r14
	.word 0xfadb89e0  ! 1741: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T2_asi_reg_wr_76:
	mov	0x35, %r14
	.word 0xf8f38e80  ! 1742: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T2_asi_reg_wr_77:
	mov	0x1a, %r14
	.word 0xfef38400  ! 1743: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_2_130:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_130), 16, 16)) -> intp(2, 0, 3a)
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983fc2  ! 1749: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc2, %hpstate
	.word 0xf88d21ab  ! 1751: LDUBA_I	lduba	[%r20, + 0x01ab] %asi, %r28
	.word 0xfe8dc020  ! 1752: LDUBA_R	lduba	[%r23, %r0] 0x01, %r31
	.word 0xfc440000  ! 1757: LDSW_R	ldsw	[%r16 + %r0], %r30
	.word 0xf444a1df  ! 1758: LDSW_I	ldsw	[%r18 + 0x01df], %r26
iob_intr_2_131:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_131), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf0c44020  ! 1762: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r24
	.word 0xf4d4e161  ! 1767: LDSHA_I	ldsha	[%r19, + 0x0161] %asi, %r26
	.word 0xf2dda0b7  ! 1768: LDXA_I	ldxa	[%r22, + 0x00b7] %asi, %r25
	.word 0xfc954020  ! 1769: LDUHA_R	lduha	[%r21, %r0] 0x01, %r30
cpu_intr_2_142:
	setx	0x2a0126, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_132:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_132), 16, 16)) -> intp(2, 0, 8)
cpu_intr_2_143:
	setx	0x28000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6cc61fd  ! 1774: LDSBA_I	ldsba	[%r17, + 0x01fd] %asi, %r27
T2_asi_reg_rd_62:
	mov	0xc, %r14
	.word 0xfcdb8e60  ! 1775: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_2_133:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_133), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf8448000  ! 1782: LDSW_R	ldsw	[%r18 + %r0], %r28
T2_asi_reg_wr_78:
	mov	0x3c7, %r14
	.word 0xfaf38e40  ! 1784: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb53dc000  ! 1788: SRA_R	sra 	%r23, %r0, %r26
	.word 0xf654c000  ! 1789: LDSH_R	ldsh	[%r19 + %r0], %r27
	.word 0xf65da186  ! 1793: LDX_I	ldx	[%r22 + 0x0186], %r27
	.word 0xf65c4000  ! 1794: LDX_R	ldx	[%r17 + %r0], %r27
	.word 0xf20c8000  ! 1795: LDUB_R	ldub	[%r18 + %r0], %r25
	ta	T_CHANGE_NONHPRIV
	.word 0xbf643801  ! 1798: MOVcc_I	<illegal instruction>
	.word 0xf2940020  ! 1799: LDUHA_R	lduha	[%r16, %r0] 0x01, %r25
	.word 0xf8846116  ! 1801: LDUWA_I	lduwa	[%r17, + 0x0116] %asi, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf40cc000  ! 1803: LDUB_R	ldub	[%r19 + %r0], %r26
	.word 0xfc858020  ! 1807: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r30
cpu_intr_2_144:
	setx	0x2b0012, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_134:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_134), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_145:
	setx	0x2a0218, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_146:
	setx	0x2b0233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf48dc020  ! 1816: LDUBA_R	lduba	[%r23, %r0] 0x01, %r26
T2_asi_reg_wr_79:
	mov	0x23, %r14
	.word 0xf2f389e0  ! 1817: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T2_asi_reg_rd_63:
	mov	0x10, %r14
	.word 0xfadb8400  ! 1818: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf04c0000  ! 1821: LDSB_R	ldsb	[%r16 + %r0], %r24
T2_asi_reg_rd_64:
	mov	0x1d, %r14
	.word 0xfadb8e40  ! 1823: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_2_147:
	setx	0x2a023b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_135:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_135), 16, 16)) -> intp(2, 0, 36)
	.word 0xba8c61a3  ! 1828: ANDcc_I	andcc 	%r17, 0x01a3, %r29
cpu_intr_2_148:
	setx	0x280329, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_149:
	setx	0x280134, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_80:
	mov	0x3c7, %r14
	.word 0xf0f384a0  ! 1833: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T2_asi_reg_rd_65:
	mov	0x3c6, %r14
	.word 0xf4db8400  ! 1837: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xfcc5209c  ! 1838: LDSWA_I	ldswa	[%r20, + 0x009c] %asi, %r30
T2_asi_reg_wr_81:
	mov	0x17, %r14
	.word 0xf8f38e40  ! 1839: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_rd_66:
	mov	0xb, %r14
	.word 0xf8db8e40  ! 1841: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfa0c6077  ! 1842: LDUB_I	ldub	[%r17 + 0x0077], %r29
	.word 0xb73c7001  ! 1845: SRAX_I	srax	%r17, 0x0001, %r27
iob_intr_2_136:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_136), 16, 16)) -> intp(2, 0, 35)
iob_intr_2_137:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_137), 16, 16)) -> intp(2, 0, 35)
iob_intr_2_138:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_138), 16, 16)) -> intp(2, 0, b)
	.word 0xb00c8000  ! 1856: AND_R	and 	%r18, %r0, %r24
	.word 0xf684c020  ! 1858: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r27
	.word 0xb4848000  ! 1862: ADDcc_R	addcc 	%r18, %r0, %r26
iob_intr_2_139:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_139), 16, 16)) -> intp(2, 0, 28)
	.word 0xb32d8000  ! 1866: SLL_R	sll 	%r22, %r0, %r25
	.word 0xf2046075  ! 1873: LDUW_I	lduw	[%r17 + 0x0075], %r25
	.word 0xf6048000  ! 1874: LDUW_R	lduw	[%r18 + %r0], %r27
T2_asi_reg_wr_82:
	mov	0x14, %r14
	.word 0xf8f38e40  ! 1875: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_2_150:
	setx	0x2d0119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_151:
	setx	0x2d0203, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_140:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_140), 16, 16)) -> intp(2, 0, 1a)
iob_intr_2_141:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_141), 16, 16)) -> intp(2, 0, 9)
T2_asi_reg_rd_67:
	mov	0x1, %r14
	.word 0xfedb8e40  ! 1885: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_2_142:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_142), 16, 16)) -> intp(2, 0, 8)
	.word 0xf8cd0020  ! 1888: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r28
cpu_intr_2_152:
	setx	0x2e0135, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_68:
	mov	0x1c, %r14
	.word 0xf2db84a0  ! 1891: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_2_143:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_143), 16, 16)) -> intp(2, 0, 24)
iob_intr_2_144:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_144), 16, 16)) -> intp(2, 0, 19)
cpu_intr_2_153:
	setx	0x2f0135, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf0c44020  ! 1901: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r24
T2_asi_reg_rd_69:
	mov	0x3c7, %r14
	.word 0xf8db8400  ! 1903: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xf2848020  ! 1904: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r25
	.word 0xbcbda120  ! 1912: XNORcc_I	xnorcc 	%r22, 0x0120, %r30
T2_asi_reg_rd_70:
	mov	0x1d, %r14
	.word 0xf2db8e60  ! 1914: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T2_asi_reg_wr_83:
	mov	0xe, %r14
	.word 0xf2f38e80  ! 1917: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T2_asi_reg_rd_71:
	mov	0x3c7, %r14
	.word 0xfadb84a0  ! 1920: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T2_asi_reg_wr_84:
	mov	0x1c, %r14
	.word 0xf8f38e40  ! 1923: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_145:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_145), 16, 16)) -> intp(2, 0, 5)
	.word 0xf24c20eb  ! 1927: LDSB_I	ldsb	[%r16 + 0x00eb], %r25
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_154:
	setx	0x2d0202, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_155:
	setx	0x2e020a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_146:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_146), 16, 16)) -> intp(2, 0, 1e)
iob_intr_2_147:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_147), 16, 16)) -> intp(2, 0, b)
	ta	T_CHANGE_TO_TL0
	.word 0xfc44e067  ! 1941: LDSW_I	ldsw	[%r19 + 0x0067], %r30
iob_intr_2_148:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_148), 16, 16)) -> intp(2, 0, 1e)
	.word 0xfe8c60bc  ! 1943: LDUBA_I	lduba	[%r17, + 0x00bc] %asi, %r31
	.word 0xfe95e009  ! 1944: LDUHA_I	lduha	[%r23, + 0x0009] %asi, %r31
cpu_intr_2_156:
	setx	0x2d0214, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_72:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 1948: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf4046073  ! 1951: LDUW_I	lduw	[%r17 + 0x0073], %r26
T2_asi_reg_wr_85:
	mov	0x23, %r14
	.word 0xfaf38e40  ! 1953: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_rd_73:
	mov	0x2e, %r14
	.word 0xf2db8400  ! 1954: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_2_157:
	setx	0x2c0021, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_149:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_149), 16, 16)) -> intp(2, 0, 22)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_rd_74:
	mov	0x7, %r14
	.word 0xfcdb89e0  ! 1963: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf48420b5  ! 1964: LDUWA_I	lduwa	[%r16, + 0x00b5] %asi, %r26
T2_asi_reg_wr_86:
	mov	0xe, %r14
	.word 0xf4f38e40  ! 1968: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf04d4000  ! 1969: LDSB_R	ldsb	[%r21 + %r0], %r24
	ta	T_CHANGE_TO_TL1
cpu_intr_2_158:
	setx	0x2e0330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4c5c020  ! 1975: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r26
cpu_intr_2_159:
	setx	0x2e0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf80d60fa  ! 1977: LDUB_I	ldub	[%r21 + 0x00fa], %r28
iob_intr_2_150:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_150), 16, 16)) -> intp(2, 0, b)
	.word 0xf40d8000  ! 1980: LDUB_R	ldub	[%r22 + %r0], %r26
	ta	T_CHANGE_NONHPRIV
iob_intr_2_151:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_151), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf65c8000  ! 1988: LDX_R	ldx	[%r18 + %r0], %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_wr_87:
	mov	0x3c4, %r14
	.word 0xfef38e40  ! 1995: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbab42075  ! 1996: ORNcc_I	orncc 	%r16, 0x0075, %r29
	.word 0xfa44a1e3  ! 1997: LDSW_I	ldsw	[%r18 + 0x01e3], %r29
cpu_intr_2_160:
	setx	0x2e0117, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_161:
	setx	0x2d0111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24d4000  ! 2004: LDSB_R	ldsb	[%r21 + %r0], %r25
T2_asi_reg_wr_88:
	mov	0x34, %r14
	.word 0xfaf389e0  ! 2005: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb625c000  ! 2006: SUB_R	sub 	%r23, %r0, %r27
iob_intr_2_152:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_152), 16, 16)) -> intp(2, 0, d)
	.word 0xbcb50000  ! 2008: ORNcc_R	orncc 	%r20, %r0, %r30
T2_asi_reg_wr_89:
	mov	0x20, %r14
	.word 0xfef384a0  ! 2009: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xbe8ca0df  ! 2011: ANDcc_I	andcc 	%r18, 0x00df, %r31
cpu_intr_2_162:
	setx	0x2f0011, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_90:
	mov	0x19, %r14
	.word 0xfef38e40  ! 2014: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982a02  ! 2016: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a02, %hpstate
	.word 0xbf354000  ! 2017: SRL_R	srl 	%r21, %r0, %r31
iob_intr_2_153:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_153), 16, 16)) -> intp(2, 0, 2c)
	ta	T_CHANGE_TO_TL1
	.word 0xf295c020  ! 2021: LDUHA_R	lduha	[%r23, %r0] 0x01, %r25
	.word 0xfc850020  ! 2022: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r30
	.word 0xf00561a9  ! 2023: LDUW_I	lduw	[%r21 + 0x01a9], %r24
T2_asi_reg_wr_91:
	mov	0x38, %r14
	.word 0xf8f38e80  ! 2027: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T2_asi_reg_rd_75:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 2029: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_wr_92:
	mov	0x19, %r14
	.word 0xf8f38e60  ! 2030: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_2_163:
	setx	0x2f022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb825c000  ! 2034: SUB_R	sub 	%r23, %r0, %r28
	ta	T_CHANGE_TO_TL0
	.word 0xfa4d4000  ! 2036: LDSB_R	ldsb	[%r21 + %r0], %r29
T2_asi_reg_wr_93:
	mov	0x19, %r14
	.word 0xf6f38e40  ! 2037: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983c12  ! 2038: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c12, %hpstate
iob_intr_2_154:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_154), 16, 16)) -> intp(2, 0, a)
	.word 0xf4c50020  ! 2040: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r26
cpu_intr_2_164:
	setx	0x2d001a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_94:
	mov	0x3c0, %r14
	.word 0xfaf389e0  ! 2044: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_2_155:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_155), 16, 16)) -> intp(2, 0, 22)
	.word 0xb53cd000  ! 2053: SRAX_R	srax	%r19, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf8d4c020  ! 2056: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r28
iob_intr_2_156:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_156), 16, 16)) -> intp(2, 0, 31)
	.word 0xfe058000  ! 2061: LDUW_R	lduw	[%r22 + %r0], %r31
	.word 0xb08c8000  ! 2064: ANDcc_R	andcc 	%r18, %r0, %r24
cpu_intr_2_165:
	setx	0x2c0218, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_166:
	setx	0x2e001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_76:
	mov	0x3c3, %r14
	.word 0xfedb8400  ! 2067: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xbc45e197  ! 2071: ADDC_I	addc 	%r23, 0x0197, %r30
iob_intr_2_157:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_157), 16, 16)) -> intp(2, 0, 25)
	.word 0xb234e00d  ! 2075: ORN_I	orn 	%r19, 0x000d, %r25
cpu_intr_2_167:
	setx	0x2d0238, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_168:
	setx	0x2e0037, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_169:
	setx	0x2d032a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_170:
	setx	0x2d0121, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_77:
	mov	0x3c0, %r14
	.word 0xf0db8400  ! 2086: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_2_158:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_158), 16, 16)) -> intp(2, 0, 2f)
T2_asi_reg_wr_95:
	mov	0xa, %r14
	.word 0xfef38e40  ! 2089: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_159:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_159), 16, 16)) -> intp(2, 0, 19)
	.word 0xbb7c2401  ! 2091: MOVR_I	movre	%r16, 0x1, %r29
cpu_intr_2_171:
	setx	0x2e002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc8d4020  ! 2093: LDUBA_R	lduba	[%r21, %r0] 0x01, %r30
	.word 0xf08d0020  ! 2094: LDUBA_R	lduba	[%r20, %r0] 0x01, %r24
	.word 0xf64dc000  ! 2095: LDSB_R	ldsb	[%r23 + %r0], %r27
	.word 0xf2d561e2  ! 2101: LDSHA_I	ldsha	[%r21, + 0x01e2] %asi, %r25
cpu_intr_2_172:
	setx	0x2d030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_96:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 2105: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfc5d2098  ! 2106: LDX_I	ldx	[%r20 + 0x0098], %r30
	.word 0xf20c60aa  ! 2107: LDUB_I	ldub	[%r17 + 0x00aa], %r25
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_78:
	mov	0x2e, %r14
	.word 0xf8db89e0  ! 2114: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_2_173:
	setx	0x2c0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x859461bf  ! 2124: WRPR_TSTATE_I	wrpr	%r17, 0x01bf, %tstate
iob_intr_2_160:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_160), 16, 16)) -> intp(2, 0, 19)
	.word 0xbeb44000  ! 2126: SUBCcc_R	orncc 	%r17, %r0, %r31
	.word 0xf255216a  ! 2127: LDSH_I	ldsh	[%r20 + 0x016a], %r25
T2_asi_reg_rd_79:
	mov	0x1a, %r14
	.word 0xfedb8e60  ! 2129: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb034e0e7  ! 2131: ORN_I	orn 	%r19, 0x00e7, %r24
	.word 0xf60c6163  ! 2132: LDUB_I	ldub	[%r17 + 0x0163], %r27
	.word 0xb634618a  ! 2134: SUBC_I	orn 	%r17, 0x018a, %r27
	.word 0xf484e02a  ! 2135: LDUWA_I	lduwa	[%r19, + 0x002a] %asi, %r26
iob_intr_2_161:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_161), 16, 16)) -> intp(2, 0, e)
	.word 0xb2b4c000  ! 2139: SUBCcc_R	orncc 	%r19, %r0, %r25
	.word 0xfc5d61f4  ! 2140: LDX_I	ldx	[%r21 + 0x01f4], %r30
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983d4a  ! 2143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d4a, %hpstate
	.word 0xfec54020  ! 2144: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r31
	.word 0xf64c0000  ! 2145: LDSB_R	ldsb	[%r16 + %r0], %r27
	.word 0xfa446011  ! 2146: LDSW_I	ldsw	[%r17 + 0x0011], %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb335c000  ! 2148: SRL_R	srl 	%r23, %r0, %r25
cpu_intr_2_174:
	setx	0x2c0010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25c4000  ! 2151: LDX_R	ldx	[%r17 + %r0], %r25
iob_intr_2_162:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_162), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_175:
	setx	0x2e0315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4c56059  ! 2158: LDSWA_I	ldswa	[%r21, + 0x0059] %asi, %r26
T2_asi_reg_wr_97:
	mov	0x5, %r14
	.word 0xfaf38e80  ! 2159: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_2_163:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_163), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf8c4a0aa  ! 2161: LDSWA_I	ldswa	[%r18, + 0x00aa] %asi, %r28
cpu_intr_2_176:
	setx	0x2c000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8d8020  ! 2168: LDUBA_R	lduba	[%r22, %r0] 0x01, %r29
cpu_intr_2_177:
	setx	0x2c001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf404c000  ! 2173: LDUW_R	lduw	[%r19 + %r0], %r26
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_80:
	mov	0x3c8, %r14
	.word 0xfedb8e40  ! 2176: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T2_asi_reg_rd_81:
	mov	0x3c7, %r14
	.word 0xfcdb8e40  ! 2177: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_rd_82:
	mov	0x1e, %r14
	.word 0xf2db8e40  ! 2178: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf4858020  ! 2181: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r26
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982850  ! 2182: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0850, %hpstate
	.word 0xf0c56057  ! 2183: LDSWA_I	ldswa	[%r21, + 0x0057] %asi, %r24
cpu_intr_2_178:
	setx	0x2e0230, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_164:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_164), 16, 16)) -> intp(2, 0, 35)
cpu_intr_2_179:
	setx	0x2f0328, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_98:
	mov	0xf, %r14
	.word 0xf4f38e40  ! 2188: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_180:
	setx	0x2e0114, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_181:
	setx	0x2f022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfedde18e  ! 2196: LDXA_I	ldxa	[%r23, + 0x018e] %asi, %r31
T2_asi_reg_rd_83:
	mov	0x26, %r14
	.word 0xfcdb84a0  ! 2201: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0xf81460cf  ! 2204: LDUH_I	lduh	[%r17 + 0x00cf], %r28
iob_intr_2_165:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_165), 16, 16)) -> intp(2, 0, 8)
	.word 0xf4cd2172  ! 2208: LDSBA_I	ldsba	[%r20, + 0x0172] %asi, %r26
T2_asi_reg_wr_99:
	mov	0x12, %r14
	.word 0xf0f38e60  ! 2209: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T2_asi_reg_rd_84:
	mov	0x3c3, %r14
	.word 0xf0db89e0  ! 2212: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf654a069  ! 2214: LDSH_I	ldsh	[%r18 + 0x0069], %r27
	.word 0xf2940020  ! 2215: LDUHA_R	lduha	[%r16, %r0] 0x01, %r25
iob_intr_2_166:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_166), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_rd_85:
	mov	0x3c1, %r14
	.word 0xf6db89e0  ! 2222: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982f12  ! 2223: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f12, %hpstate
T2_asi_reg_wr_100:
	mov	0x35, %r14
	.word 0xf0f38400  ! 2224: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xfa0c4000  ! 2226: LDUB_R	ldub	[%r17 + %r0], %r29
T2_asi_reg_rd_86:
	mov	0x3c2, %r14
	.word 0xf8db89e0  ! 2227: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf6140000  ! 2228: LDUH_R	lduh	[%r16 + %r0], %r27
iob_intr_2_167:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_167), 16, 16)) -> intp(2, 0, 38)
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983d90  ! 2235: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d90, %hpstate
cpu_intr_2_182:
	setx	0x2e0316, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_183:
	setx	0x2c0216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0948020  ! 2238: LDUHA_R	lduha	[%r18, %r0] 0x01, %r24
iob_intr_2_168:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_168), 16, 16)) -> intp(2, 0, 31)
	.word 0xf2452101  ! 2250: LDSW_I	ldsw	[%r20 + 0x0101], %r25
	.word 0xf8552017  ! 2251: LDSH_I	ldsh	[%r20 + 0x0017], %r28
T2_asi_reg_wr_101:
	mov	0x3c7, %r14
	.word 0xf2f38400  ! 2252: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982808  ! 2253: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0808, %hpstate
	.word 0xfa454000  ! 2256: LDSW_R	ldsw	[%r21 + %r0], %r29
	.word 0xbc25c000  ! 2257: SUB_R	sub 	%r23, %r0, %r30
cpu_intr_2_184:
	setx	0x2f0239, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_169:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_169), 16, 16)) -> intp(2, 0, 37)
iob_intr_2_170:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_170), 16, 16)) -> intp(2, 0, 36)
	.word 0xfc5521ad  ! 2265: LDSH_I	ldsh	[%r20 + 0x01ad], %r30
cpu_intr_2_185:
	setx	0x2e0319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf08461f8  ! 2268: LDUWA_I	lduwa	[%r17, + 0x01f8] %asi, %r24
	.word 0xfe44a01b  ! 2269: LDSW_I	ldsw	[%r18 + 0x001b], %r31
	.word 0xfecc0020  ! 2270: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r31
T2_asi_reg_rd_87:
	mov	0x3c0, %r14
	.word 0xfcdb8400  ! 2276: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_2_171:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_171), 16, 16)) -> intp(2, 0, 6)
	.word 0xf80520af  ! 2281: LDUW_I	lduw	[%r20 + 0x00af], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf0d5c020  ! 2283: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r24
	.word 0xfe5d4000  ! 2285: LDX_R	ldx	[%r21 + %r0], %r31
cpu_intr_2_186:
	setx	0x2e0318, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_187:
	setx	0x2c012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x819828d2  ! 2289: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d2, %hpstate
	ta	T_CHANGE_NONHPRIV
	.word 0xb6a5c000  ! 2295: SUBcc_R	subcc 	%r23, %r0, %r27
iob_intr_2_172:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_172), 16, 16)) -> intp(2, 0, 36)
	.word 0xb43ce041  ! 2300: XNOR_I	xnor 	%r19, 0x0041, %r26
iob_intr_2_173:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_173), 16, 16)) -> intp(2, 0, 27)
T2_asi_reg_rd_88:
	mov	0x1f, %r14
	.word 0xfadb8e40  ! 2303: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfedc211b  ! 2304: LDXA_I	ldxa	[%r16, + 0x011b] %asi, %r31
cpu_intr_2_188:
	setx	0x2c011f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_189:
	setx	0x2d0025, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_190:
	setx	0x2c0202, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_191:
	setx	0x2e023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6c5a06c  ! 2311: LDSWA_I	ldswa	[%r22, + 0x006c] %asi, %r27
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982d82  ! 2312: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d82, %hpstate
	.word 0xfc150000  ! 2316: LDUH_R	lduh	[%r20 + %r0], %r30
	.word 0xf2d58020  ! 2317: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r25
iob_intr_2_174:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_174), 16, 16)) -> intp(2, 0, 32)
	.word 0xf84d8000  ! 2320: LDSB_R	ldsb	[%r22 + %r0], %r28
	.word 0xb2450000  ! 2321: ADDC_R	addc 	%r20, %r0, %r25
	.word 0xf4c52154  ! 2322: LDSWA_I	ldswa	[%r20, + 0x0154] %asi, %r26
T2_asi_reg_wr_102:
	mov	0x33, %r14
	.word 0xfaf38e40  ! 2333: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfc054000  ! 2334: LDUW_R	lduw	[%r21 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_192:
	setx	0x320235, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_175:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_175), 16, 16)) -> intp(2, 0, 8)
cpu_intr_2_193:
	setx	0x31020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf814606d  ! 2340: LDUH_I	lduh	[%r17 + 0x006d], %r28
T2_asi_reg_wr_103:
	mov	0x17, %r14
	.word 0xfcf38e40  ! 2341: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_rd_89:
	mov	0x14, %r14
	.word 0xfadb8e40  ! 2342: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_2_194:
	setx	0x320317, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983dc8  ! 2348: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dc8, %hpstate
T2_asi_reg_rd_90:
	mov	0x3c2, %r14
	.word 0xfedb8e80  ! 2349: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf48d4020  ! 2350: LDUBA_R	lduba	[%r21, %r0] 0x01, %r26
iob_intr_2_176:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_176), 16, 16)) -> intp(2, 0, e)
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_104:
	mov	0x11, %r14
	.word 0xfef384a0  ! 2358: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xfe84c020  ! 2359: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r31
	.word 0xf8d4a130  ! 2360: LDSHA_I	ldsha	[%r18, + 0x0130] %asi, %r28
T2_asi_reg_rd_91:
	mov	0x3c7, %r14
	.word 0xf8db8e80  ! 2361: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf04c0000  ! 2365: LDSB_R	ldsb	[%r16 + %r0], %r24
iob_intr_2_177:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_177), 16, 16)) -> intp(2, 0, 15)
T2_asi_reg_rd_92:
	mov	0x9, %r14
	.word 0xf8db89e0  ! 2367: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_2_195:
	setx	0x320222, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_196:
	setx	0x31023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa15a140  ! 2372: LDUH_I	lduh	[%r22 + 0x0140], %r29
T2_asi_reg_wr_105:
	mov	0xb, %r14
	.word 0xf4f389e0  ! 2375: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_2_197:
	setx	0x320119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8561be  ! 2377: LDUWA_I	lduwa	[%r21, + 0x01be] %asi, %r31
cpu_intr_2_198:
	setx	0x31002a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_106:
	mov	0x6, %r14
	.word 0xf0f38e80  ! 2380: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_2_199:
	setx	0x32032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb21dc000  ! 2383: XOR_R	xor 	%r23, %r0, %r25
T2_asi_reg_rd_93:
	mov	0x2a, %r14
	.word 0xfcdb89e0  ! 2385: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982e98  ! 2387: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e98, %hpstate
	.word 0xfccd6124  ! 2388: LDSBA_I	ldsba	[%r21, + 0x0124] %asi, %r30
T2_asi_reg_rd_94:
	mov	0x12, %r14
	.word 0xfadb89e0  ! 2389: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_2_200:
	setx	0x31021b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_178:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_178), 16, 16)) -> intp(2, 0, 3e)
	.word 0xbc35c000  ! 2396: ORN_R	orn 	%r23, %r0, %r30
	setx	data_start_3, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x8198394a  ! 2398: WRHPR_HPSTATE_I	wrhpr	%r0, 0x194a, %hpstate
	.word 0xf45ce1db  ! 2399: LDX_I	ldx	[%r19 + 0x01db], %r26
	ta	T_CHANGE_TO_TL1
	.word 0xfed4e004  ! 2404: LDSHA_I	ldsha	[%r19, + 0x0004] %asi, %r31
	.word 0xbd354000  ! 2405: SRL_R	srl 	%r21, %r0, %r30
	.word 0xf215e1a9  ! 2407: LDUH_I	lduh	[%r23 + 0x01a9], %r25
cpu_intr_2_201:
	setx	0x30033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25da1a4  ! 2415: LDX_I	ldx	[%r22 + 0x01a4], %r25
iob_intr_2_179:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_179), 16, 16)) -> intp(2, 0, 2f)
T2_asi_reg_rd_95:
	mov	0x3c7, %r14
	.word 0xfadb8e40  ! 2423: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf08d4020  ! 2424: LDUBA_R	lduba	[%r21, %r0] 0x01, %r24
	.word 0xbc158000  ! 2426: OR_R	or 	%r22, %r0, %r30
cpu_intr_2_202:
	setx	0x320135, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_180:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_180), 16, 16)) -> intp(2, 0, 8)
	.word 0xf00461e0  ! 2436: LDUW_I	lduw	[%r17 + 0x01e0], %r24
T2_asi_reg_wr_107:
	mov	0x22, %r14
	.word 0xf4f38e40  ! 2438: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	setx	data_start_1, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982e98  ! 2440: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e98, %hpstate
	.word 0xf2dda168  ! 2441: LDXA_I	ldxa	[%r22, + 0x0168] %asi, %r25
	.word 0xfa044000  ! 2446: LDUW_R	lduw	[%r17 + %r0], %r29
iob_intr_2_181:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_181), 16, 16)) -> intp(2, 0, 1f)
T2_asi_reg_wr_108:
	mov	0x3c2, %r14
	.word 0xfef38400  ! 2448: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_2_203:
	setx	0x33010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8950020  ! 2451: LDUHA_R	lduha	[%r20, %r0] 0x01, %r28
T2_asi_reg_wr_109:
	mov	0x2b, %r14
	.word 0xf4f38400  ! 2453: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_2_204:
	setx	0x330103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4b4a102  ! 2457: SUBCcc_I	orncc 	%r18, 0x0102, %r26
	.word 0xf45de185  ! 2463: LDX_I	ldx	[%r23 + 0x0185], %r26
cpu_intr_2_205:
	setx	0x310129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2140000  ! 2466: LDUH_R	lduh	[%r16 + %r0], %r25
	.word 0xfc54e052  ! 2469: LDSH_I	ldsh	[%r19 + 0x0052], %r30
iob_intr_2_182:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_182), 16, 16)) -> intp(2, 0, 1)
	.word 0xb285e0d8  ! 2474: ADDcc_I	addcc 	%r23, 0x00d8, %r25
T2_asi_reg_rd_96:
	mov	0xc, %r14
	.word 0xfadb8e60  ! 2475: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf885c020  ! 2478: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r28
	.word 0xfa44c000  ! 2479: LDSW_R	ldsw	[%r19 + %r0], %r29
	.word 0xfe854020  ! 2480: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r31
cpu_intr_2_206:
	setx	0x32032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0850000  ! 2484: ADDcc_R	addcc 	%r20, %r0, %r24
iob_intr_2_183:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_183), 16, 16)) -> intp(2, 0, 13)
	.word 0xb734a001  ! 2493: SRL_I	srl 	%r18, 0x0001, %r27
cpu_intr_2_207:
	setx	0x300326, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_208:
	setx	0x33002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4d4000  ! 2498: LDSB_R	ldsb	[%r21 + %r0], %r31
	.word 0xf40c201f  ! 2501: LDUB_I	ldub	[%r16 + 0x001f], %r26
iob_intr_2_184:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_184), 16, 16)) -> intp(2, 0, 14)
iob_intr_2_185:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_185), 16, 16)) -> intp(2, 0, 24)
	.word 0xf45c212b  ! 2504: LDX_I	ldx	[%r16 + 0x012b], %r26
cpu_intr_2_209:
	setx	0x330104, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_97:
	mov	0x24, %r14
	.word 0xf8db8e80  ! 2507: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf64de1ab  ! 2508: LDSB_I	ldsb	[%r23 + 0x01ab], %r27
	.word 0xb73da001  ! 2509: SRA_I	sra 	%r22, 0x0001, %r27
	.word 0xb8858000  ! 2512: ADDcc_R	addcc 	%r22, %r0, %r28
cpu_intr_2_210:
	setx	0x300102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4454000  ! 2515: LDSW_R	ldsw	[%r21 + %r0], %r26
	.word 0xfac4205f  ! 2521: LDSWA_I	ldswa	[%r16, + 0x005f] %asi, %r29
T2_asi_reg_rd_98:
	mov	0x2f, %r14
	.word 0xfadb8400  ! 2522: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T2_asi_reg_wr_110:
	mov	0xc, %r14
	.word 0xf0f38e60  ! 2523: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_2_211:
	setx	0x20314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85c4000  ! 2525: LDX_R	ldx	[%r17 + %r0], %r28
cpu_intr_2_212:
	setx	0x32010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_2_213:
	setx	0x330122, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_214:
	setx	0x300308, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_215:
	setx	0x310136, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_99:
	mov	0x3c0, %r14
	.word 0xf6db89e0  ! 2535: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_2_216:
	setx	0x330332, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_217:
	setx	0x30021d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_100:
	mov	0x3c4, %r14
	.word 0xf8db8e80  ! 2545: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_2_218:
	setx	0x320221, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_186:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_186), 16, 16)) -> intp(2, 0, 12)
	.word 0xf84de121  ! 2557: LDSB_I	ldsb	[%r23 + 0x0121], %r28
iob_intr_2_187:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_187), 16, 16)) -> intp(2, 0, 38)
	.word 0xf8554000  ! 2563: LDSH_R	ldsh	[%r21 + %r0], %r28
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983a50  ! 2564: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a50, %hpstate
	.word 0xbe2d604c  ! 2565: ANDN_I	andn 	%r21, 0x004c, %r31
	.word 0xf08ca04b  ! 2567: LDUBA_I	lduba	[%r18, + 0x004b] %asi, %r24
	.word 0xfcc46149  ! 2569: LDSWA_I	ldswa	[%r17, + 0x0149] %asi, %r30
	.word 0xf04c8000  ! 2570: LDSB_R	ldsb	[%r18 + %r0], %r24
iob_intr_2_188:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_188), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf4140000  ! 2575: LDUH_R	lduh	[%r16 + %r0], %r26
	.word 0xf6cd204c  ! 2576: LDSBA_I	ldsba	[%r20, + 0x004c] %asi, %r27
cpu_intr_2_219:
	setx	0x30001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe9ce11d  ! 2579: XORcc_I	xorcc 	%r19, 0x011d, %r31
T2_asi_reg_rd_101:
	mov	0x3, %r14
	.word 0xfcdb8e60  ! 2583: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_2_189:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_189), 16, 16)) -> intp(2, 0, 1a)
cpu_intr_2_220:
	setx	0x310133, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_111:
	mov	0x3c6, %r14
	.word 0xf0f38e80  ! 2587: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	.word 0xf65c60e5  ! 2589: LDX_I	ldx	[%r17 + 0x00e5], %r27
T2_asi_reg_rd_102:
	mov	0x2a, %r14
	.word 0xf8db8e40  ! 2592: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfa55c000  ! 2596: LDSH_R	ldsh	[%r23 + %r0], %r29
	.word 0xf415e0c1  ! 2597: LDUH_I	lduh	[%r23 + 0x00c1], %r26
	.word 0xb0b5a10a  ! 2598: SUBCcc_I	orncc 	%r22, 0x010a, %r24
	.word 0xf8cc6008  ! 2600: LDSBA_I	ldsba	[%r17, + 0x0008] %asi, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3510000  ! 2603: RDPR_TICK	rdpr	%tick, %r25
T2_asi_reg_wr_112:
	mov	0x2b, %r14
	.word 0xfcf384a0  ! 2604: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfcd4a167  ! 2605: LDSHA_I	ldsha	[%r18, + 0x0167] %asi, %r30
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983998  ! 2606: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1998, %hpstate
	.word 0xfa546080  ! 2607: LDSH_I	ldsh	[%r17 + 0x0080], %r29
T2_asi_reg_wr_113:
	mov	0x1d, %r14
	.word 0xf8f38e60  ! 2608: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T2_asi_reg_rd_103:
	mov	0x3c1, %r14
	.word 0xf8db8e40  ! 2610: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T2_asi_reg_wr_114:
	mov	0x3c1, %r14
	.word 0xfaf38e60  ! 2612: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_2_190:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_190), 16, 16)) -> intp(2, 0, 23)
cpu_intr_2_221:
	setx	0x300038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeb5a149  ! 2615: ORNcc_I	orncc 	%r22, 0x0149, %r31
cpu_intr_2_222:
	setx	0x310008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc1460dd  ! 2619: LDUH_I	lduh	[%r17 + 0x00dd], %r30
T2_asi_reg_wr_115:
	mov	0x18, %r14
	.word 0xf0f38400  ! 2622: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb1643801  ! 2626: MOVcc_I	<illegal instruction>
iob_intr_2_191:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_191), 16, 16)) -> intp(2, 0, 26)
T2_asi_reg_rd_104:
	mov	0x1c, %r14
	.word 0xf4db8e40  ! 2631: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf25da187  ! 2632: LDX_I	ldx	[%r22 + 0x0187], %r25
iob_intr_2_192:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_192), 16, 16)) -> intp(2, 0, 10)
	.word 0xf855e05a  ! 2635: LDSH_I	ldsh	[%r23 + 0x005a], %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_223:
	setx	0x30023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0c5c020  ! 2646: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r24
	.word 0xf844a0d5  ! 2647: LDSW_I	ldsw	[%r18 + 0x00d5], %r28
	.word 0xf60c4000  ! 2649: LDUB_R	ldub	[%r17 + %r0], %r27
	.word 0xf48da03f  ! 2650: LDUBA_I	lduba	[%r22, + 0x003f] %asi, %r26
cpu_intr_2_224:
	setx	0x30021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0948020  ! 2654: LDUHA_R	lduha	[%r18, %r0] 0x01, %r24
	.word 0xf8dd61de  ! 2658: LDXA_I	ldxa	[%r21, + 0x01de] %asi, %r28
cpu_intr_2_225:
	setx	0x310223, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_193:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_193), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_rd_105:
	mov	0x10, %r14
	.word 0xfcdb8e40  ! 2661: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_2_226:
	setx	0x320339, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_116:
	mov	0x30, %r14
	.word 0xf0f389e0  ! 2667: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_2_194:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_194), 16, 16)) -> intp(2, 0, 1e)
iob_intr_2_195:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_195), 16, 16)) -> intp(2, 0, 15)
T2_asi_reg_rd_106:
	mov	0x3c5, %r14
	.word 0xf6db8e40  ! 2674: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfed48020  ! 2675: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r31
cpu_intr_2_227:
	setx	0x310011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa95a08f  ! 2677: LDUHA_I	lduha	[%r22, + 0x008f] %asi, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf005a06a  ! 2685: LDUW_I	lduw	[%r22 + 0x006a], %r24
T2_asi_reg_rd_107:
	mov	0x29, %r14
	.word 0xf0db8e40  ! 2686: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	ta	T_CHANGE_TO_TL1
	.word 0xf6c40020  ! 2688: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r27
iob_intr_2_196:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_196), 16, 16)) -> intp(2, 0, 38)
	.word 0xba85e080  ! 2691: ADDcc_I	addcc 	%r23, 0x0080, %r29
	.word 0xb1641800  ! 2693: MOVcc_R	<illegal instruction>
	.word 0xf2d58020  ! 2698: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r25
	.word 0xbb351000  ! 2701: SRLX_R	srlx	%r20, %r0, %r29
T2_asi_reg_rd_108:
	mov	0x3c8, %r14
	.word 0xf8db8e60  ! 2704: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_2_228:
	setx	0x31032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa44c000  ! 2708: LDSW_R	ldsw	[%r19 + %r0], %r29
	.word 0xf6558000  ! 2709: LDSH_R	ldsh	[%r22 + %r0], %r27
	.word 0xf0cc4020  ! 2713: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r24
	.word 0xf2540000  ! 2715: LDSH_R	ldsh	[%r16 + %r0], %r25
	.word 0xf485a10a  ! 2716: LDUWA_I	lduwa	[%r22, + 0x010a] %asi, %r26
iob_intr_2_197:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_197), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf8cd20ff  ! 2720: LDSBA_I	ldsba	[%r20, + 0x00ff] %asi, %r28
	.word 0xb0b4e001  ! 2721: SUBCcc_I	orncc 	%r19, 0x0001, %r24
cpu_intr_2_229:
	setx	0x330316, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_198:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_198), 16, 16)) -> intp(2, 0, 5)
	.word 0xf2d40020  ! 2727: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r25
cpu_intr_2_230:
	setx	0x31021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0854020  ! 2730: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r24
T2_asi_reg_wr_117:
	mov	0x3c4, %r14
	.word 0xfcf389e0  ! 2734: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xfcc50020  ! 2736: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r30
	.word 0xfe540000  ! 2738: LDSH_R	ldsh	[%r16 + %r0], %r31
T2_asi_reg_wr_118:
	mov	0x3c3, %r14
	.word 0xf2f384a0  ! 2739: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xfcc5a0ad  ! 2740: LDSWA_I	ldswa	[%r22, + 0x00ad] %asi, %r30
cpu_intr_2_231:
	setx	0x30020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfadce1af  ! 2742: LDXA_I	ldxa	[%r19, + 0x01af] %asi, %r29
cpu_intr_2_232:
	setx	0x310331, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_199:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_199), 16, 16)) -> intp(2, 0, 31)
	.word 0xfe55e049  ! 2749: LDSH_I	ldsh	[%r23 + 0x0049], %r31
	.word 0xfad4a02d  ! 2750: LDSHA_I	ldsha	[%r18, + 0x002d] %asi, %r29
cpu_intr_2_233:
	setx	0x320229, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_119:
	mov	0xf, %r14
	.word 0xfaf38e40  ! 2752: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_200:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_200), 16, 16)) -> intp(2, 0, 14)
	.word 0xf08d0020  ! 2764: LDUBA_R	lduba	[%r20, %r0] 0x01, %r24
T2_asi_reg_wr_120:
	mov	0x9, %r14
	.word 0xf2f38400  ! 2766: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_2_201:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_201), 16, 16)) -> intp(2, 0, 19)
cpu_intr_2_234:
	setx	0x310207, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_235:
	setx	0x320309, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_202:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_202), 16, 16)) -> intp(2, 0, 39)
iob_intr_2_203:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_203), 16, 16)) -> intp(2, 0, 1f)
cpu_intr_2_236:
	setx	0x300238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d44020  ! 2782: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r25
	.word 0xfc4c8000  ! 2783: LDSB_R	ldsb	[%r18 + %r0], %r30
T2_asi_reg_rd_109:
	mov	0x3c6, %r14
	.word 0xfcdb8e80  ! 2787: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	ta	T_CHANGE_TO_TL1
iob_intr_2_204:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_204), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf0142168  ! 2792: LDUH_I	lduh	[%r16 + 0x0168], %r24
	.word 0xf04de0cb  ! 2793: LDSB_I	ldsb	[%r23 + 0x00cb], %r24
iob_intr_2_205:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_205), 16, 16)) -> intp(2, 0, 14)
cpu_intr_2_237:
	setx	0x35013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_121:
	mov	0x13, %r14
	.word 0xf4f389e0  ! 2796: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_2_238:
	setx	0x350317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_239:
	setx	0x370221, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983b52  ! 2802: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b52, %hpstate
	.word 0xfc4d8000  ! 2805: LDSB_R	ldsb	[%r22 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_206:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_206), 16, 16)) -> intp(2, 0, 30)
	.word 0xfac5208c  ! 2809: LDSWA_I	ldswa	[%r20, + 0x008c] %asi, %r29
iob_intr_2_207:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_207), 16, 16)) -> intp(2, 0, 6)
	.word 0xf20c4000  ! 2813: LDUB_R	ldub	[%r17 + %r0], %r25
	.word 0xf0d54020  ! 2815: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r24
	.word 0x919460af  ! 2816: WRPR_PIL_I	wrpr	%r17, 0x00af, %pil
iob_intr_2_208:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_208), 16, 16)) -> intp(2, 0, 18)
	.word 0xb5508000  ! 2818: RDPR_TSTATE	<illegal instruction>
	.word 0xf2950020  ! 2819: LDUHA_R	lduha	[%r20, %r0] 0x01, %r25
cpu_intr_2_240:
	setx	0x340120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf28ce0a1  ! 2824: LDUBA_I	lduba	[%r19, + 0x00a1] %asi, %r25
T2_asi_reg_wr_122:
	mov	0x30, %r14
	.word 0xf2f38e60  ! 2825: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_209:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_209), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_241:
	setx	0x370108, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_210:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_210), 16, 16)) -> intp(2, 0, 33)
cpu_intr_2_242:
	setx	0x350232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0854020  ! 2835: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r24
iob_intr_2_211:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_211), 16, 16)) -> intp(2, 0, 3d)
T2_asi_reg_wr_123:
	mov	0x29, %r14
	.word 0xfaf38e40  ! 2839: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_wr_124:
	mov	0x21, %r14
	.word 0xf2f38e60  ! 2841: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T2_asi_reg_wr_125:
	mov	0x30, %r14
	.word 0xf6f38e60  ! 2845: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T2_asi_reg_wr_126:
	mov	0x1e, %r14
	.word 0xf4f389e0  ! 2846: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf04dc000  ! 2848: LDSB_R	ldsb	[%r23 + %r0], %r24
	.word 0xf08da15e  ! 2852: LDUBA_I	lduba	[%r22, + 0x015e] %asi, %r24
T2_asi_reg_wr_127:
	mov	0x20, %r14
	.word 0xf8f38e40  ! 2857: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfc546084  ! 2858: LDSH_I	ldsh	[%r17 + 0x0084], %r30
iob_intr_2_212:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_212), 16, 16)) -> intp(2, 0, 23)
	.word 0xb62c6125  ! 2861: ANDN_I	andn 	%r17, 0x0125, %r27
	ta	T_CHANGE_TO_TL1
	.word 0xf4958020  ! 2863: LDUHA_R	lduha	[%r22, %r0] 0x01, %r26
	.word 0xf2154000  ! 2864: LDUH_R	lduh	[%r21 + %r0], %r25
	.word 0xf44d2165  ! 2866: LDSB_I	ldsb	[%r20 + 0x0165], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc45c000  ! 2873: LDSW_R	ldsw	[%r23 + %r0], %r30
	.word 0xf80cc000  ! 2874: LDUB_R	ldub	[%r19 + %r0], %r28
iob_intr_2_213:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_213), 16, 16)) -> intp(2, 0, 18)
cpu_intr_2_243:
	setx	0x350232, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_110:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 2885: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_2_214:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_214), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_wr_128:
	mov	0x14, %r14
	.word 0xf2f38e40  ! 2891: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T2_asi_reg_rd_111:
	mov	0x3c8, %r14
	.word 0xf6db8e40  ! 2892: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf8cd2047  ! 2893: LDSBA_I	ldsba	[%r20, + 0x0047] %asi, %r28
	.word 0xf655e017  ! 2896: LDSH_I	ldsh	[%r23 + 0x0017], %r27
	.word 0xf8548000  ! 2897: LDSH_R	ldsh	[%r18 + %r0], %r28
	.word 0xf2d52112  ! 2898: LDSHA_I	ldsha	[%r20, + 0x0112] %asi, %r25
T2_asi_reg_rd_112:
	mov	0x38, %r14
	.word 0xf4db8e60  ! 2899: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T2_asi_reg_wr_129:
	mov	0x33, %r14
	.word 0xf0f38e80  ! 2901: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_2_244:
	setx	0x360032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb22ca0c0  ! 2903: ANDN_I	andn 	%r18, 0x00c0, %r25
T2_asi_reg_wr_130:
	mov	0x8, %r14
	.word 0xf6f38e80  ! 2907: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf655e1da  ! 2909: LDSH_I	ldsh	[%r23 + 0x01da], %r27
cpu_intr_2_245:
	setx	0x350330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfacdc020  ! 2911: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r29
	.word 0xf2956078  ! 2913: LDUHA_I	lduha	[%r21, + 0x0078] %asi, %r25
T2_asi_reg_wr_131:
	mov	0x38, %r14
	.word 0xf2f38e40  ! 2915: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_215:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_215), 16, 16)) -> intp(2, 0, 14)
iob_intr_2_216:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_216), 16, 16)) -> intp(2, 0, 2)
cpu_intr_2_246:
	setx	0x350222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4ca016  ! 2931: LDSB_I	ldsb	[%r18 + 0x0016], %r29
T2_asi_reg_wr_132:
	mov	0x10, %r14
	.word 0xf8f38e40  ! 2935: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfe54e1f6  ! 2936: LDSH_I	ldsh	[%r19 + 0x01f6], %r31
	.word 0xf88cc020  ! 2937: LDUBA_R	lduba	[%r19, %r0] 0x01, %r28
cpu_intr_2_247:
	setx	0x340030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6cce019  ! 2939: LDSBA_I	ldsba	[%r19, + 0x0019] %asi, %r27
	.word 0xfc15e0ea  ! 2940: LDUH_I	lduh	[%r23 + 0x00ea], %r30
cpu_intr_2_248:
	setx	0x35023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6158000  ! 2944: OR_R	or 	%r22, %r0, %r27
iob_intr_2_217:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_217), 16, 16)) -> intp(2, 0, 1b)
iob_intr_2_218:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_218), 16, 16)) -> intp(2, 0, 36)
	.word 0xf2050000  ! 2951: LDUW_R	lduw	[%r20 + %r0], %r25
	.word 0xb0248000  ! 2955: SUB_R	sub 	%r18, %r0, %r24
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983918  ! 2956: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1918, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf88d4020  ! 2962: LDUBA_R	lduba	[%r21, %r0] 0x01, %r28
iob_intr_2_219:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_219), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf2c4a0dd  ! 2966: LDSWA_I	ldswa	[%r18, + 0x00dd] %asi, %r25
T2_asi_reg_rd_113:
	mov	0xb, %r14
	.word 0xfcdb8e40  ! 2968: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf89421cc  ! 2969: LDUHA_I	lduha	[%r16, + 0x01cc] %asi, %r28
cpu_intr_2_249:
	setx	0x36021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8795e038  ! 2972: WRPR_TT_I	wrpr	%r23, 0x0038, %tt
cpu_intr_2_250:
	setx	0x340017, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_114:
	mov	0x1c, %r14
	.word 0xfedb8e60  ! 2974: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_2_220:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_220), 16, 16)) -> intp(2, 0, 22)
	.word 0xb17c0400  ! 2977: MOVR_R	movre	%r16, %r0, %r24
	.word 0xbe14e1ff  ! 2978: OR_I	or 	%r19, 0x01ff, %r31
	.word 0xb1518000  ! 2982: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xfcd58020  ! 2983: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r30
iob_intr_2_221:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_221), 16, 16)) -> intp(2, 0, d)
	.word 0xfacd8020  ! 2988: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r29
	setx	data_start_4, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982cd0  ! 2989: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd0, %hpstate
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_133:
	mov	0x35, %r14
	.word 0xfef389e0  ! 2991: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	ta	T_CHANGE_NONHPRIV
	.word 0xf28d6131  ! 2993: LDUBA_I	lduba	[%r21, + 0x0131] %asi, %r25
	.word 0xf2c5e074  ! 2995: LDSWA_I	ldswa	[%r23, + 0x0074] %asi, %r25
iob_intr_2_222:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_222), 16, 16)) -> intp(2, 0, 3e)
	.word 0xb0958000  ! 2999: ORcc_R	orcc 	%r22, %r0, %r24
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983a1a  ! 3001: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a1a, %hpstate
T2_asi_reg_rd_115:
	mov	0x2b, %r14
	.word 0xf0db84a0  ! 3003: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xfc8d209c  ! 3006: LDUBA_I	lduba	[%r20, + 0x009c] %asi, %r30
	.word 0xfac5e076  ! 3008: LDSWA_I	ldswa	[%r23, + 0x0076] %asi, %r29
T2_asi_reg_wr_134:
	mov	0x7, %r14
	.word 0xf2f38400  ! 3009: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_2_223:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_223), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf4cc0020  ! 3012: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r26
T2_asi_reg_wr_135:
	mov	0x2e, %r14
	.word 0xf4f38e80  ! 3019: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf05d6116  ! 3021: LDX_I	ldx	[%r21 + 0x0116], %r24
	.word 0xf0c5c020  ! 3022: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r24
	.word 0xfa956004  ! 3024: LDUHA_I	lduha	[%r21, + 0x0004] %asi, %r29
T2_asi_reg_wr_136:
	mov	0x8, %r14
	.word 0xf4f384a0  ! 3025: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf694c020  ! 3026: LDUHA_R	lduha	[%r19, %r0] 0x01, %r27
	.word 0xf4958020  ! 3031: LDUHA_R	lduha	[%r22, %r0] 0x01, %r26
cpu_intr_2_251:
	setx	0x360207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba45a110  ! 3033: ADDC_I	addc 	%r22, 0x0110, %r29
T2_asi_reg_wr_137:
	mov	0x3c3, %r14
	.word 0xfaf384a0  ! 3034: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T2_asi_reg_rd_116:
	mov	0x3c7, %r14
	.word 0xf0db8e80  ! 3035: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_224:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_224), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_rd_117:
	mov	0x3c7, %r14
	.word 0xfedb8e60  ! 3038: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xfad48020  ! 3044: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r29
iob_intr_2_225:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_225), 16, 16)) -> intp(2, 0, 1c)
iob_intr_2_226:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_226), 16, 16)) -> intp(2, 0, 27)
T2_asi_reg_wr_138:
	mov	0x16, %r14
	.word 0xfef389e0  ! 3047: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0x8d946179  ! 3049: WRPR_PSTATE_I	wrpr	%r17, 0x0179, %pstate
cpu_intr_2_252:
	setx	0x370205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfccc60c5  ! 3053: LDSBA_I	ldsba	[%r17, + 0x00c5] %asi, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_wr_139:
	mov	0x4, %r14
	.word 0xf0f38e40  ! 3055: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfcc48020  ! 3058: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r30
	.word 0xf095603a  ! 3062: LDUHA_I	lduha	[%r21, + 0x003a] %asi, %r24
T2_asi_reg_rd_118:
	mov	0x16, %r14
	.word 0xf8db89e0  ! 3066: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf8cc613d  ! 3068: LDSBA_I	ldsba	[%r17, + 0x013d] %asi, %r28
	.word 0xf454e1fe  ! 3069: LDSH_I	ldsh	[%r19 + 0x01fe], %r26
	.word 0xf8548000  ! 3073: LDSH_R	ldsh	[%r18 + %r0], %r28
T2_asi_reg_wr_140:
	mov	0x3c3, %r14
	.word 0xfaf38e40  ! 3074: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb9480000  ! 3076: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf854e17e  ! 3079: LDSH_I	ldsh	[%r19 + 0x017e], %r28
iob_intr_2_227:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_227), 16, 16)) -> intp(2, 0, 19)
	.word 0xf805a0c0  ! 3084: LDUW_I	lduw	[%r22 + 0x00c0], %r28
cpu_intr_2_253:
	setx	0x350223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf245e167  ! 3086: LDSW_I	ldsw	[%r23 + 0x0167], %r25
	.word 0xb635e04d  ! 3088: ORN_I	orn 	%r23, 0x004d, %r27
cpu_intr_2_254:
	setx	0x370308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6056082  ! 3092: LDUW_I	lduw	[%r21 + 0x0082], %r27
cpu_intr_2_255:
	setx	0x340038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbca5605d  ! 3096: SUBcc_I	subcc 	%r21, 0x005d, %r30
T2_asi_reg_rd_119:
	mov	0x38, %r14
	.word 0xfadb8e40  ! 3098: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_2_256:
	setx	0x340116, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_257:
	setx	0x35002b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_258:
	setx	0x370319, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_259:
	setx	0x36030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_141:
	mov	0xb, %r14
	.word 0xfef38e60  ! 3106: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_2_228:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_228), 16, 16)) -> intp(2, 0, 35)
cpu_intr_2_260:
	setx	0x360213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf20c21ef  ! 3109: LDUB_I	ldub	[%r16 + 0x01ef], %r25
iob_intr_2_229:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_229), 16, 16)) -> intp(2, 0, c)
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982a82  ! 3115: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a82, %hpstate
T2_asi_reg_rd_120:
	mov	0x37, %r14
	.word 0xf2db89e0  ! 3120: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T2_asi_reg_rd_121:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 3123: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_261:
	setx	0x350106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba9d8000  ! 3128: XORcc_R	xorcc 	%r22, %r0, %r29
T2_asi_reg_rd_122:
	mov	0x11, %r14
	.word 0xf8db89e0  ! 3129: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_2_230:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_230), 16, 16)) -> intp(2, 0, 28)
iob_intr_2_231:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_231), 16, 16)) -> intp(2, 0, 2a)
cpu_intr_2_262:
	setx	0x340220, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf0546073  ! 3138: LDSH_I	ldsh	[%r17 + 0x0073], %r24
	.word 0xf0954020  ! 3141: LDUHA_R	lduha	[%r21, %r0] 0x01, %r24
	.word 0xf48d20df  ! 3142: LDUBA_I	lduba	[%r20, + 0x00df] %asi, %r26
	.word 0xfac5e170  ! 3144: LDSWA_I	ldswa	[%r23, + 0x0170] %asi, %r29
iob_intr_2_232:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_232), 16, 16)) -> intp(2, 0, 24)
cpu_intr_2_263:
	setx	0x340123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85c0000  ! 3149: LDX_R	ldx	[%r16 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf25d8000  ! 3152: LDX_R	ldx	[%r22 + %r0], %r25
	.word 0xfec4e1ec  ! 3153: LDSWA_I	ldswa	[%r19, + 0x01ec] %asi, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_264:
	setx	0x350325, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_123:
	mov	0x11, %r14
	.word 0xf8db89e0  ! 3163: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_2_233:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_233), 16, 16)) -> intp(2, 0, 3f)
cpu_intr_2_265:
	setx	0x350122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8d61b6  ! 3169: LDUBA_I	lduba	[%r21, + 0x01b6] %asi, %r29
	.word 0xf80d8000  ! 3170: LDUB_R	ldub	[%r22 + %r0], %r28
cpu_intr_2_266:
	setx	0x34032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_267:
	setx	0x37032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8144000  ! 3177: LDUH_R	lduh	[%r17 + %r0], %r28
	.word 0xf0946046  ! 3180: LDUHA_I	lduha	[%r17, + 0x0046] %asi, %r24
T2_asi_reg_wr_142:
	mov	0x0, %r14
	.word 0xfcf38e40  ! 3181: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfc4521d2  ! 3182: LDSW_I	ldsw	[%r20 + 0x01d2], %r30
	.word 0xf8c5208e  ! 3184: LDSWA_I	ldswa	[%r20, + 0x008e] %asi, %r28
cpu_intr_2_268:
	setx	0x350229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_269:
	setx	0x350303, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_234:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_234), 16, 16)) -> intp(2, 0, 8)
	.word 0xf2c5c020  ! 3190: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r25
	.word 0xbd3c8000  ! 3194: SRA_R	sra 	%r18, %r0, %r30
	ta	T_CHANGE_NONHPRIV
	.word 0xfc954020  ! 3197: LDUHA_R	lduha	[%r21, %r0] 0x01, %r30
T2_asi_reg_rd_124:
	mov	0x3c1, %r14
	.word 0xfcdb8e60  ! 3198: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T2_asi_reg_rd_125:
	mov	0x30, %r14
	.word 0xf8db8e60  ! 3200: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb9346001  ! 3201: SRL_I	srl 	%r17, 0x0001, %r28
	ta	T_CHANGE_TO_TL1
	.word 0xf04d0000  ! 3204: LDSB_R	ldsb	[%r20 + %r0], %r24
iob_intr_2_235:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_235), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_270:
	setx	0x36023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6c40020  ! 3213: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r27
iob_intr_2_236:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_236), 16, 16)) -> intp(2, 0, 26)
cpu_intr_2_271:
	setx	0x201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfac46136  ! 3217: LDSWA_I	ldswa	[%r17, + 0x0136] %asi, %r29
iob_intr_2_237:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_237), 16, 16)) -> intp(2, 0, 23)
	.word 0xfa854020  ! 3219: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r29
	.word 0xf494a022  ! 3221: LDUHA_I	lduha	[%r18, + 0x0022] %asi, %r26
cpu_intr_2_272:
	setx	0x37001e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_273:
	setx	0x370325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb034c000  ! 3226: ORN_R	orn 	%r19, %r0, %r24
	.word 0x8f902001  ! 3227: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xb68d2084  ! 3230: ANDcc_I	andcc 	%r20, 0x0084, %r27
	.word 0xfa158000  ! 3232: LDUH_R	lduh	[%r22 + %r0], %r29
iob_intr_2_238:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_238), 16, 16)) -> intp(2, 0, 5)
iob_intr_2_239:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_239), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_rd_126:
	mov	0x6, %r14
	.word 0xf4db8e60  ! 3237: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_2_240:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_240), 16, 16)) -> intp(2, 0, e)
T2_asi_reg_rd_127:
	mov	0x14, %r14
	.word 0xf2db8400  ! 3239: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_2_274:
	setx	0x38000e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_143:
	mov	0x3c1, %r14
	.word 0xf2f384a0  ! 3241: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T2_asi_reg_rd_128:
	mov	0x3c7, %r14
	.word 0xfadb8400  ! 3242: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_2_241:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_241), 16, 16)) -> intp(2, 0, 14)
cpu_intr_2_275:
	setx	0x3a0103, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_129:
	mov	0x2, %r14
	.word 0xfedb84a0  ! 3248: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T2_asi_reg_wr_144:
	mov	0x12, %r14
	.word 0xf0f38e80  ! 3255: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_2_242:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_242), 16, 16)) -> intp(2, 0, 20)
	ta	T_CHANGE_NONHPRIV
	.word 0xf654212b  ! 3267: LDSH_I	ldsh	[%r16 + 0x012b], %r27
	.word 0xfa540000  ! 3268: LDSH_R	ldsh	[%r16 + %r0], %r29
iob_intr_2_243:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_243), 16, 16)) -> intp(2, 0, 5)
	ta	T_CHANGE_NONHPRIV
	.word 0xf8d5a15e  ! 3271: LDSHA_I	ldsha	[%r22, + 0x015e] %asi, %r28
cpu_intr_2_276:
	setx	0x39010e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_244:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_244), 16, 16)) -> intp(2, 0, 1d)
T2_asi_reg_wr_145:
	mov	0x9, %r14
	.word 0xfcf38e40  ! 3276: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf0954020  ! 3278: LDUHA_R	lduha	[%r21, %r0] 0x01, %r24
T2_asi_reg_rd_130:
	mov	0x26, %r14
	.word 0xf8db8e80  ! 3279: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_2_245:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_245), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_rd_131:
	mov	0x9, %r14
	.word 0xf2db8e40  ! 3281: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T2_asi_reg_rd_132:
	mov	0x3c1, %r14
	.word 0xfcdb8e60  ! 3283: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T2_asi_reg_wr_146:
	mov	0x2d, %r14
	.word 0xfcf389e0  ! 3285: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf2c54020  ! 3286: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r25
cpu_intr_2_277:
	setx	0x3a0019, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_246:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_246), 16, 16)) -> intp(2, 0, d)
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
cpu_intr_2_278:
	setx	0x39020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf28c4020  ! 3293: LDUBA_R	lduba	[%r17, %r0] 0x01, %r25
iob_intr_2_247:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_247), 16, 16)) -> intp(2, 0, 2e)
	.word 0xfe852012  ! 3295: LDUWA_I	lduwa	[%r20, + 0x0012] %asi, %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xf414a122  ! 3297: LDUH_I	lduh	[%r18 + 0x0122], %r26
	ta	T_CHANGE_TO_TL1
	.word 0xba34e1cc  ! 3304: ORN_I	orn 	%r19, 0x01cc, %r29
iob_intr_2_248:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_248), 16, 16)) -> intp(2, 0, 7)
iob_intr_2_249:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_249), 16, 16)) -> intp(2, 0, 38)
iob_intr_2_250:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_250), 16, 16)) -> intp(2, 0, 18)
cpu_intr_2_279:
	setx	0x39013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_2_280:
	setx	0x3a000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfed48020  ! 3319: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r31
	.word 0xfad4e0dd  ! 3320: LDSHA_I	ldsha	[%r19, + 0x00dd] %asi, %r29
T2_asi_reg_wr_147:
	mov	0x3c0, %r14
	.word 0xf6f38400  ! 3323: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_251:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_251), 16, 16)) -> intp(2, 0, 38)
	.word 0xf08dc020  ! 3327: LDUBA_R	lduba	[%r23, %r0] 0x01, %r24
	.word 0xfe0561b2  ! 3329: LDUW_I	lduw	[%r21 + 0x01b2], %r31
	.word 0xbe14607b  ! 3330: OR_I	or 	%r17, 0x007b, %r31
T2_asi_reg_wr_148:
	mov	0x4, %r14
	.word 0xf4f384a0  ! 3332: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf60c6059  ! 3335: LDUB_I	ldub	[%r17 + 0x0059], %r27
cpu_intr_2_281:
	setx	0x38020c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_282:
	setx	0x380326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6c5e013  ! 3339: ADDCcc_I	addccc 	%r23, 0x0013, %r27
	.word 0xf4d42167  ! 3350: LDSHA_I	ldsha	[%r16, + 0x0167] %asi, %r26
cpu_intr_2_283:
	setx	0x38031e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_252:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_252), 16, 16)) -> intp(2, 0, 10)
iob_intr_2_253:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_253), 16, 16)) -> intp(2, 0, 2b)
T2_asi_reg_wr_149:
	mov	0x3c8, %r14
	.word 0xf4f389e0  ! 3359: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T2_asi_reg_rd_133:
	mov	0xa, %r14
	.word 0xfedb8e40  ! 3362: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_2_254:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_254), 16, 16)) -> intp(2, 0, 0)
	.word 0xf0454000  ! 3366: LDSW_R	ldsw	[%r21 + %r0], %r24
	.word 0xfa55a057  ! 3367: LDSH_I	ldsh	[%r22 + 0x0057], %r29
cpu_intr_2_284:
	setx	0x3b002c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_134:
	mov	0x3c1, %r14
	.word 0xfadb8e60  ! 3373: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_2_255:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_255), 16, 16)) -> intp(2, 0, 2)
	.word 0xb6b58000  ! 3375: SUBCcc_R	orncc 	%r22, %r0, %r27
cpu_intr_2_285:
	setx	0x3a012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0956076  ! 3382: ORcc_I	orcc 	%r21, 0x0076, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_286:
	setx	0x3a0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ccc020  ! 3386: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r25
iob_intr_2_256:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_256), 16, 16)) -> intp(2, 0, 15)
iob_intr_2_257:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_257), 16, 16)) -> intp(2, 0, 13)
iob_intr_2_258:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_258), 16, 16)) -> intp(2, 0, 26)
cpu_intr_2_287:
	setx	0x3a0202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf80d0000  ! 3395: LDUB_R	ldub	[%r20 + %r0], %r28
	.word 0xfe4d2180  ! 3396: LDSB_I	ldsb	[%r20 + 0x0180], %r31
cpu_intr_2_288:
	setx	0x39003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xba14e07b  ! 3401: OR_I	or 	%r19, 0x007b, %r29
	.word 0xfa8c2125  ! 3404: LDUBA_I	lduba	[%r16, + 0x0125] %asi, %r29
	.word 0xfe0d4000  ! 3405: LDUB_R	ldub	[%r21 + %r0], %r31
cpu_intr_2_289:
	setx	0x38010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf054a1de  ! 3410: LDSH_I	ldsh	[%r18 + 0x01de], %r24
	.word 0xfac56021  ! 3412: LDSWA_I	ldswa	[%r21, + 0x0021] %asi, %r29
T2_asi_reg_rd_135:
	mov	0x1b, %r14
	.word 0xfedb84a0  ! 3413: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_150:
	mov	0x1c, %r14
	.word 0xfef38400  ! 3415: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_wr_151:
	mov	0x3, %r14
	.word 0xf2f38e80  ! 3418: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_2_259:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_259), 16, 16)) -> intp(2, 0, 3f)
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982d18  ! 3422: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d18, %hpstate
T2_asi_reg_wr_152:
	mov	0x2e, %r14
	.word 0xf0f38400  ! 3423: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xfc440000  ! 3426: LDSW_R	ldsw	[%r16 + %r0], %r30
	.word 0xf80d4000  ! 3427: LDUB_R	ldub	[%r21 + %r0], %r28
	.word 0xba148000  ! 3428: OR_R	or 	%r18, %r0, %r29
iob_intr_2_260:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_260), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_290:
	setx	0x3a030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0ace1b0  ! 3436: ANDNcc_I	andncc 	%r19, 0x01b0, %r24
T2_asi_reg_wr_153:
	mov	0x10, %r14
	.word 0xf8f389e0  ! 3438: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf8c50020  ! 3439: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r28
T2_asi_reg_wr_154:
	mov	0x8, %r14
	.word 0xfef38400  ! 3440: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T2_asi_reg_rd_136:
	mov	0x17, %r14
	.word 0xf4db84a0  ! 3441: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_2_291:
	setx	0x38012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe04a174  ! 3449: LDUW_I	lduw	[%r18 + 0x0174], %r31
iob_intr_2_261:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_261), 16, 16)) -> intp(2, 0, 2e)
iob_intr_2_262:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_262), 16, 16)) -> intp(2, 0, 3a)
	.word 0xb9510000  ! 3452: RDPR_TICK	<illegal instruction>
	.word 0xf2cdc020  ! 3455: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r25
T2_asi_reg_rd_137:
	mov	0x1, %r14
	.word 0xfcdb89e0  ! 3456: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf2d56174  ! 3457: LDSHA_I	ldsha	[%r21, + 0x0174] %asi, %r25
	.word 0xfedc61c7  ! 3458: LDXA_I	ldxa	[%r17, + 0x01c7] %asi, %r31
	.word 0xb225a1fd  ! 3459: SUB_I	sub 	%r22, 0x01fd, %r25
	.word 0xfc8da038  ! 3460: LDUBA_I	lduba	[%r22, + 0x0038] %asi, %r30
T2_asi_reg_rd_138:
	mov	0x34, %r14
	.word 0xfcdb8e40  ! 3462: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf89420f4  ! 3463: LDUHA_I	lduha	[%r16, + 0x00f4] %asi, %r28
	.word 0xf0948020  ! 3464: LDUHA_R	lduha	[%r18, %r0] 0x01, %r24
	.word 0xfa0dc000  ! 3465: LDUB_R	ldub	[%r23 + %r0], %r29
	.word 0xfe0c6092  ! 3468: LDUB_I	ldub	[%r17 + 0x0092], %r31
	.word 0xfa444000  ! 3469: LDSW_R	ldsw	[%r17 + %r0], %r29
	.word 0xf20c0000  ! 3470: LDUB_R	ldub	[%r16 + %r0], %r25
	ta	T_CHANGE_HPRIV
	.word 0xf2cde024  ! 3479: LDSBA_I	ldsba	[%r23, + 0x0024] %asi, %r25
	.word 0xf415e081  ! 3480: LDUH_I	lduh	[%r23 + 0x0081], %r26
T2_asi_reg_wr_155:
	mov	0x3c8, %r14
	.word 0xf0f389e0  ! 3482: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T2_asi_reg_rd_139:
	mov	0x2b, %r14
	.word 0xf2db8e60  ! 3483: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xfa4d4000  ! 3484: LDSB_R	ldsb	[%r21 + %r0], %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_292:
	setx	0x3a0234, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_263:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_263), 16, 16)) -> intp(2, 0, 30)
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_140:
	mov	0x3c4, %r14
	.word 0xfcdb89e0  ! 3490: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xfc05c000  ! 3491: LDUW_R	lduw	[%r23 + %r0], %r30
cpu_intr_2_293:
	setx	0x3b0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983a02  ! 3494: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a02, %hpstate
	.word 0xba34209b  ! 3495: ORN_I	orn 	%r16, 0x009b, %r29
	.word 0xfc4da149  ! 3497: LDSB_I	ldsb	[%r22 + 0x0149], %r30
cpu_intr_2_294:
	setx	0x380010, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_264:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_264), 16, 16)) -> intp(2, 0, 1f)
	.word 0xb21c2010  ! 3502: XOR_I	xor 	%r16, 0x0010, %r25
	.word 0xfc94e039  ! 3503: LDUHA_I	lduha	[%r19, + 0x0039] %asi, %r30
T2_asi_reg_rd_141:
	mov	0x1c, %r14
	.word 0xfadb89e0  ! 3505: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xbcade17e  ! 3507: ANDNcc_I	andncc 	%r23, 0x017e, %r30
T2_asi_reg_wr_156:
	mov	0x1a, %r14
	.word 0xf8f38e40  ! 3509: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb6bd4000  ! 3511: XNORcc_R	xnorcc 	%r21, %r0, %r27
	.word 0xfe448000  ! 3512: LDSW_R	ldsw	[%r18 + %r0], %r31
	.word 0xfcdde1be  ! 3513: LDXA_I	ldxa	[%r23, + 0x01be] %asi, %r30
	.word 0xf0d54020  ! 3515: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r24
	.word 0xfc5d8000  ! 3516: LDX_R	ldx	[%r22 + %r0], %r30
	ta	T_CHANGE_NONHPRIV
	.word 0xfe1461bf  ! 3520: LDUH_I	lduh	[%r17 + 0x01bf], %r31
T2_asi_reg_wr_157:
	mov	0x2c, %r14
	.word 0xfaf38e80  ! 3521: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	.word 0xf2948020  ! 3526: LDUHA_R	lduha	[%r18, %r0] 0x01, %r25
cpu_intr_2_295:
	setx	0x38010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_142:
	mov	0x0, %r14
	.word 0xfcdb8e40  ! 3530: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_2_296:
	setx	0x39013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf84c4000  ! 3532: LDSB_R	ldsb	[%r17 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_143:
	mov	0x31, %r14
	.word 0xfcdb8e80  ! 3534: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	ta	T_CHANGE_NONHPRIV
iob_intr_2_265:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_265), 16, 16)) -> intp(2, 0, 18)
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xb52d3001  ! 3540: SLLX_I	sllx	%r20, 0x0001, %r26
	.word 0xf4058000  ! 3542: LDUW_R	lduw	[%r22 + %r0], %r26
T2_asi_reg_rd_144:
	mov	0x3c6, %r14
	.word 0xf0db8e40  ! 3543: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfe5ca1fb  ! 3546: LDX_I	ldx	[%r18 + 0x01fb], %r31
	ta	T_CHANGE_TO_TL0
cpu_intr_2_297:
	setx	0x390334, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_145:
	mov	0x33, %r14
	.word 0xf0db8e60  ! 3550: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_2_266:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_266), 16, 16)) -> intp(2, 0, f)
cpu_intr_2_298:
	setx	0x390222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba040000  ! 3554: ADD_R	add 	%r16, %r0, %r29
	.word 0xfe8c4020  ! 3558: LDUBA_R	lduba	[%r17, %r0] 0x01, %r31
cpu_intr_2_299:
	setx	0x380128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf085a16a  ! 3561: LDUWA_I	lduwa	[%r22, + 0x016a] %asi, %r24
iob_intr_2_267:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_267), 16, 16)) -> intp(2, 0, 17)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf45cc000  ! 3568: LDX_R	ldx	[%r19 + %r0], %r26
	.word 0xbc850000  ! 3569: ADDcc_R	addcc 	%r20, %r0, %r30
cpu_intr_2_300:
	setx	0x390227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8cd606f  ! 3572: LDSBA_I	ldsba	[%r21, + 0x006f] %asi, %r28
	.word 0xf48c0020  ! 3574: LDUBA_R	lduba	[%r16, %r0] 0x01, %r26
	.word 0xba14c000  ! 3575: OR_R	or 	%r19, %r0, %r29
	.word 0xb2a4a01e  ! 3579: SUBcc_I	subcc 	%r18, 0x001e, %r25
	.word 0xf88c6047  ! 3581: LDUBA_I	lduba	[%r17, + 0x0047] %asi, %r28
	.word 0xf64c8000  ! 3582: LDSB_R	ldsb	[%r18 + %r0], %r27
cpu_intr_2_301:
	setx	0x390224, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_302:
	setx	0x3b002c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_303:
	setx	0x38021a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_268:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_268), 16, 16)) -> intp(2, 0, 18)
iob_intr_2_269:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_269), 16, 16)) -> intp(2, 0, 29)
iob_intr_2_270:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_270), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_wr_158:
	mov	0x4, %r14
	.word 0xf2f38e60  ! 3600: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb33d9000  ! 3601: SRAX_R	srax	%r22, %r0, %r25
T2_asi_reg_rd_146:
	mov	0x21, %r14
	.word 0xfadb8e80  ! 3602: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_2_271:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_271), 16, 16)) -> intp(2, 0, 5)
T2_asi_reg_rd_147:
	mov	0x3c4, %r14
	.word 0xf6db8e40  ! 3606: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb72d3001  ! 3607: SLLX_I	sllx	%r20, 0x0001, %r27
iob_intr_2_272:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_272), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_wr_159:
	mov	0x37, %r14
	.word 0xf0f389e0  ! 3612: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T2_asi_reg_wr_160:
	mov	0x15, %r14
	.word 0xf6f38e40  ! 3613: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb4042139  ! 3616: ADD_I	add 	%r16, 0x0139, %r26
iob_intr_2_273:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_273), 16, 16)) -> intp(2, 0, 33)
cpu_intr_2_304:
	setx	0x3b031e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_305:
	setx	0x390035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0cd6022  ! 3626: LDSBA_I	ldsba	[%r21, + 0x0022] %asi, %r24
	.word 0xf8cc8020  ! 3628: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r28
	.word 0xfa958020  ! 3630: LDUHA_R	lduha	[%r22, %r0] 0x01, %r29
	.word 0xb8bd8000  ! 3631: XNORcc_R	xnorcc 	%r22, %r0, %r28
T2_asi_reg_wr_161:
	mov	0x2f, %r14
	.word 0xfef38e80  ! 3632: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_2_306:
	setx	0x380008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45dc000  ! 3635: LDX_R	ldx	[%r23 + %r0], %r26
	.word 0xf2158000  ! 3637: LDUH_R	lduh	[%r22 + %r0], %r25
iob_intr_2_274:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_274), 16, 16)) -> intp(2, 0, 33)
	.word 0xb92d8000  ! 3641: SLL_R	sll 	%r22, %r0, %r28
	.word 0xbaa5c000  ! 3644: SUBcc_R	subcc 	%r23, %r0, %r29
T2_asi_reg_rd_148:
	mov	0x27, %r14
	.word 0xf8db8e40  ! 3645: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T2_asi_reg_rd_149:
	mov	0x14, %r14
	.word 0xf2db8e80  ! 3646: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf2144000  ! 3648: LDUH_R	lduh	[%r17 + %r0], %r25
	.word 0xf20dc000  ! 3650: LDUB_R	ldub	[%r23 + %r0], %r25
iob_intr_2_275:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_275), 16, 16)) -> intp(2, 0, 15)
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982f02  ! 3653: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f02, %hpstate
	.word 0xf65c8000  ! 3654: LDX_R	ldx	[%r18 + %r0], %r27
	.word 0xf28da15d  ! 3656: LDUBA_I	lduba	[%r22, + 0x015d] %asi, %r25
iob_intr_2_276:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_276), 16, 16)) -> intp(2, 0, 2b)
cpu_intr_2_307:
	setx	0x3a0013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe0c4000  ! 3660: AND_R	and 	%r17, %r0, %r31
	.word 0xfa44613e  ! 3667: LDSW_I	ldsw	[%r17 + 0x013e], %r29
cpu_intr_2_308:
	setx	0x380200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8cde0a2  ! 3677: LDSBA_I	ldsba	[%r23, + 0x00a2] %asi, %r28
	.word 0xbcbc61ec  ! 3679: XNORcc_I	xnorcc 	%r17, 0x01ec, %r30
T2_asi_reg_rd_150:
	mov	0x3c4, %r14
	.word 0xf8db8e60  ! 3681: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_2_309:
	setx	0x3a0121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0154000  ! 3685: OR_R	or 	%r21, %r0, %r24
	.word 0xf40da1e9  ! 3686: LDUB_I	ldub	[%r22 + 0x01e9], %r26
iob_intr_2_277:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_277), 16, 16)) -> intp(2, 0, 33)
	.word 0xfa148000  ! 3692: LDUH_R	lduh	[%r18 + %r0], %r29
T2_asi_reg_rd_151:
	mov	0x0, %r14
	.word 0xf6db8e40  ! 3697: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_rd_152:
	mov	0x33, %r14
	.word 0xf8db8400  ! 3698: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T2_asi_reg_wr_162:
	mov	0x19, %r14
	.word 0xf2f384a0  ! 3702: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xfc4d2088  ! 3704: LDSB_I	ldsb	[%r20 + 0x0088], %r30
iob_intr_2_278:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_278), 16, 16)) -> intp(2, 0, 31)
	.word 0xfe4d6169  ! 3707: LDSB_I	ldsb	[%r21 + 0x0169], %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xfcc561fa  ! 3712: LDSWA_I	ldswa	[%r21, + 0x01fa] %asi, %r30
cpu_intr_2_310:
	setx	0x3f0025, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_153:
	mov	0xc, %r14
	.word 0xf8db8e60  ! 3714: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_wr_163:
	mov	0x16, %r14
	.word 0xf0f38e60  ! 3719: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T2_asi_reg_rd_154:
	mov	0x11, %r14
	.word 0xf4db8400  ! 3721: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf2dce135  ! 3727: LDXA_I	ldxa	[%r19, + 0x0135] %asi, %r25
T2_asi_reg_wr_164:
	mov	0x17, %r14
	.word 0xfcf384a0  ! 3729: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T2_asi_reg_wr_165:
	mov	0x29, %r14
	.word 0xfef38e80  ! 3730: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xfe04a113  ! 3732: LDUW_I	lduw	[%r18 + 0x0113], %r31
	.word 0xb03d0000  ! 3733: XNOR_R	xnor 	%r20, %r0, %r24
	.word 0xf6442011  ! 3737: LDSW_I	ldsw	[%r16 + 0x0011], %r27
	.word 0xf04ce102  ! 3738: LDSB_I	ldsb	[%r19 + 0x0102], %r24
cpu_intr_2_311:
	setx	0x3d001a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_279:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_279), 16, 16)) -> intp(2, 0, 3f)
	.word 0xfc0461d4  ! 3742: LDUW_I	lduw	[%r17 + 0x01d4], %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf044e157  ! 3744: LDSW_I	ldsw	[%r19 + 0x0157], %r24
cpu_intr_2_312:
	setx	0x3d0305, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_155:
	mov	0x3c8, %r14
	.word 0xf8db8e40  ! 3746: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_2_313:
	setx	0x3e0009, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_314:
	setx	0x3f0326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88c8020  ! 3752: LDUBA_R	lduba	[%r18, %r0] 0x01, %r28
	.word 0xfcd561c4  ! 3757: LDSHA_I	ldsha	[%r21, + 0x01c4] %asi, %r30
T2_asi_reg_wr_166:
	mov	0x3c6, %r14
	.word 0xf8f38e40  ! 3758: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfa950020  ! 3759: LDUHA_R	lduha	[%r20, %r0] 0x01, %r29
T2_asi_reg_rd_156:
	mov	0x32, %r14
	.word 0xf2db8e80  ! 3760: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf885c020  ! 3763: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r28
	.word 0xf2544000  ! 3768: LDSH_R	ldsh	[%r17 + %r0], %r25
	.word 0xf0d4c020  ! 3769: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r24
T2_asi_reg_wr_167:
	mov	0x1d, %r14
	.word 0xfcf38e40  ! 3771: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL0
	.word 0xf044e0cc  ! 3773: LDSW_I	ldsw	[%r19 + 0x00cc], %r24
	.word 0xf2852046  ! 3774: LDUWA_I	lduwa	[%r20, + 0x0046] %asi, %r25
	.word 0xf49420d6  ! 3775: LDUHA_I	lduha	[%r16, + 0x00d6] %asi, %r26
cpu_intr_2_315:
	setx	0x3f012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf845a045  ! 3777: LDSW_I	ldsw	[%r22 + 0x0045], %r28
cpu_intr_2_316:
	setx	0x3f0028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88c8020  ! 3779: LDUBA_R	lduba	[%r18, %r0] 0x01, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982f88  ! 3784: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f88, %hpstate
	.word 0xf65c205a  ! 3786: LDX_I	ldx	[%r16 + 0x005a], %r27
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983fc0  ! 3788: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc0, %hpstate
cpu_intr_2_317:
	setx	0x3d0207, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_318:
	setx	0x3e000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_319:
	setx	0x3f020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_280:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_280), 16, 16)) -> intp(2, 0, 23)
	.word 0xf60c8000  ! 3804: LDUB_R	ldub	[%r18 + %r0], %r27
cpu_intr_2_320:
	setx	0x3d0131, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_157:
	mov	0x3c8, %r14
	.word 0xfadb8e40  ! 3807: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_2_321:
	setx	0x3d0238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8548000  ! 3813: LDSH_R	ldsh	[%r18 + %r0], %r28
	.word 0xf045c000  ! 3814: LDSW_R	ldsw	[%r23 + %r0], %r24
iob_intr_2_281:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_281), 16, 16)) -> intp(2, 0, 1b)
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983a1a  ! 3818: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a1a, %hpstate
	.word 0xf80c8000  ! 3823: LDUB_R	ldub	[%r18 + %r0], %r28
iob_intr_2_282:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_282), 16, 16)) -> intp(2, 0, 7)
cpu_intr_2_322:
	setx	0x3c0207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc852132  ! 3833: LDUWA_I	lduwa	[%r20, + 0x0132] %asi, %r30
cpu_intr_2_323:
	setx	0x3e030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0c6136  ! 3835: LDUB_I	ldub	[%r17 + 0x0136], %r31
	.word 0xfa8d8020  ! 3837: LDUBA_R	lduba	[%r22, %r0] 0x01, %r29
cpu_intr_2_324:
	setx	0x3d0029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf214c000  ! 3845: LDUH_R	lduh	[%r19 + %r0], %r25
T2_asi_reg_wr_168:
	mov	0xb, %r14
	.word 0xfaf38400  ! 3846: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_2_283:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_283), 16, 16)) -> intp(2, 0, 4)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_325:
	setx	0x3d0027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfecde1f9  ! 3858: LDSBA_I	ldsba	[%r23, + 0x01f9] %asi, %r31
T2_asi_reg_wr_169:
	mov	0x3c3, %r14
	.word 0xf4f38e40  ! 3859: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_284:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_284), 16, 16)) -> intp(2, 0, 34)
	.word 0xfa85e0a3  ! 3861: LDUWA_I	lduwa	[%r23, + 0x00a3] %asi, %r29
	.word 0xbea5202a  ! 3863: SUBcc_I	subcc 	%r20, 0x002a, %r31
cpu_intr_2_326:
	setx	0x3e023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982c18  ! 3865: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c18, %hpstate
	.word 0xbe15a148  ! 3867: OR_I	or 	%r22, 0x0148, %r31
T2_asi_reg_wr_170:
	mov	0x20, %r14
	.word 0xfaf38e60  ! 3871: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf805a158  ! 3873: LDUW_I	lduw	[%r22 + 0x0158], %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_rd_158:
	mov	0x19, %r14
	.word 0xfcdb8e40  ! 3879: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	ta	T_CHANGE_NONHPRIV
	.word 0xf0d42122  ! 3884: LDSHA_I	ldsha	[%r16, + 0x0122] %asi, %r24
T2_asi_reg_rd_159:
	mov	0x20, %r14
	.word 0xfedb8400  ! 3886: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_2_327:
	setx	0x3f0321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa55a02b  ! 3894: LDSH_I	ldsh	[%r22 + 0x002b], %r29
	.word 0xf85de11d  ! 3895: LDX_I	ldx	[%r23 + 0x011d], %r28
iob_intr_2_285:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_285), 16, 16)) -> intp(2, 0, 3d)
T2_asi_reg_rd_160:
	mov	0xb, %r14
	.word 0xf4db84a0  ! 3900: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	ta	T_CHANGE_NONHPRIV
	.word 0xbb3d5000  ! 3902: SRAX_R	srax	%r21, %r0, %r29
T2_asi_reg_wr_171:
	mov	0xc, %r14
	.word 0xfef38e40  ! 3906: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_rd_161:
	mov	0x3c6, %r14
	.word 0xfadb89e0  ! 3910: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_2_328:
	setx	0x3c0130, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_329:
	setx	0x3e0319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2cce193  ! 3918: LDSBA_I	ldsba	[%r19, + 0x0193] %asi, %r25
	.word 0xfadde109  ! 3919: LDXA_I	ldxa	[%r23, + 0x0109] %asi, %r29
	ta	T_CHANGE_HPRIV
	.word 0xf8cdc020  ! 3924: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r28
cpu_intr_2_330:
	setx	0x3c020a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_172:
	mov	0x3c7, %r14
	.word 0xfaf38e40  ! 3928: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_331:
	setx	0x3e032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8454000  ! 3932: LDSW_R	ldsw	[%r21 + %r0], %r28
T2_asi_reg_rd_162:
	mov	0x3c5, %r14
	.word 0xf2db8e60  ! 3935: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf24c616c  ! 3937: LDSB_I	ldsb	[%r17 + 0x016c], %r25
cpu_intr_2_332:
	setx	0x3c0031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_333:
	setx	0x3e001c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_286:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_286), 16, 16)) -> intp(2, 0, 11)
cpu_intr_2_334:
	setx	0x3c0311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8840000  ! 3947: ADDcc_R	addcc 	%r16, %r0, %r28
T2_asi_reg_rd_163:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 3948: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_2_335:
	setx	0x3f012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf805a129  ! 3950: LDUW_I	lduw	[%r22 + 0x0129], %r28
	.word 0xf814a1d6  ! 3953: LDUH_I	lduh	[%r18 + 0x01d6], %r28
cpu_intr_2_336:
	setx	0x3f0233, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_287:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_287), 16, 16)) -> intp(2, 0, 2d)
iob_intr_2_288:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_288), 16, 16)) -> intp(2, 0, 33)
	.word 0xf4cd4020  ! 3959: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r26
iob_intr_2_289:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_289), 16, 16)) -> intp(2, 0, 0)
	.word 0xbb641800  ! 3962: MOVcc_R	<illegal instruction>
T2_asi_reg_wr_173:
	mov	0xb, %r14
	.word 0xf0f38e80  ! 3968: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_2_337:
	setx	0x3f0223, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x819828d2  ! 3974: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d2, %hpstate
	ta	T_CHANGE_NONHPRIV
	.word 0xfe5d20f5  ! 3977: LDX_I	ldx	[%r20 + 0x00f5], %r31
cpu_intr_2_338:
	setx	0x3c0108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6dce09f  ! 3979: LDXA_I	ldxa	[%r19, + 0x009f] %asi, %r27
iob_intr_2_290:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_290), 16, 16)) -> intp(2, 0, d)
cpu_intr_2_339:
	setx	0x3f0008, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_340:
	setx	0x3e0123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf855e12a  ! 3986: LDSH_I	ldsh	[%r23 + 0x012a], %r28
cpu_intr_2_341:
	setx	0x3d0111, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_291:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_291), 16, 16)) -> intp(2, 0, 3f)
T2_asi_reg_rd_164:
	mov	0x26, %r14
	.word 0xfcdb8e60  ! 3990: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xba3d0000  ! 3991: XNOR_R	xnor 	%r20, %r0, %r29
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982e12  ! 3992: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e12, %hpstate
T2_asi_reg_wr_174:
	mov	0x25, %r14
	.word 0xf8f38e40  ! 3994: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf8052098  ! 3996: LDUW_I	lduw	[%r20 + 0x0098], %r28
T2_asi_reg_wr_175:
	mov	0x3c4, %r14
	.word 0xf8f38e60  ! 3997: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T2_asi_reg_rd_165:
	mov	0x3c5, %r14
	.word 0xf0db8e60  ! 3999: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xfc4c205e  ! 4000: LDSB_I	ldsb	[%r16 + 0x005e], %r30
T2_asi_reg_rd_166:
	mov	0x3c2, %r14
	.word 0xf6db8e40  ! 4002: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_2_292:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_292), 16, 16)) -> intp(2, 0, 1f)
	.word 0x8f902000  ! 4006: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
iob_intr_2_293:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_293), 16, 16)) -> intp(2, 0, 2)
	.word 0xf60da04d  ! 4010: LDUB_I	ldub	[%r22 + 0x004d], %r27
cpu_intr_2_342:
	setx	0x3f0319, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_176:
	mov	0x1c, %r14
	.word 0xfaf389e0  ! 4016: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_2_343:
	setx	0x3c001b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_167:
	mov	0x21, %r14
	.word 0xf6db8400  ! 4018: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf20461e0  ! 4019: LDUW_I	lduw	[%r17 + 0x01e0], %r25
	.word 0xf085a107  ! 4021: LDUWA_I	lduwa	[%r22, + 0x0107] %asi, %r24
	.word 0xfa94a08e  ! 4026: LDUHA_I	lduha	[%r18, + 0x008e] %asi, %r29
	.word 0xfe8d4020  ! 4029: LDUBA_R	lduba	[%r21, %r0] 0x01, %r31
cpu_intr_2_344:
	setx	0x3c0316, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_177:
	mov	0xc, %r14
	.word 0xf8f38e40  ! 4034: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf80ca19a  ! 4037: LDUB_I	ldub	[%r18 + 0x019a], %r28
cpu_intr_2_345:
	setx	0x3f0309, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_178:
	mov	0x12, %r14
	.word 0xf4f38e40  ! 4041: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	setx	data_start_1, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982f10  ! 4043: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f10, %hpstate
	.word 0xb6ad2114  ! 4046: ANDNcc_I	andncc 	%r20, 0x0114, %r27
cpu_intr_2_346:
	setx	0x3c0013, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_294:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_294), 16, 16)) -> intp(2, 0, 7)
	.word 0xf654600b  ! 4052: LDSH_I	ldsh	[%r17 + 0x000b], %r27
	.word 0xb0950000  ! 4056: ORcc_R	orcc 	%r20, %r0, %r24
cpu_intr_2_347:
	setx	0x3f0327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0d2048  ! 4060: LDUB_I	ldub	[%r20 + 0x0048], %r29
	.word 0xf2cd4020  ! 4061: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r25
	ta	T_CHANGE_HPRIV
cpu_intr_2_348:
	setx	0x3f021b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_295:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_295), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf84c4000  ! 4067: LDSB_R	ldsb	[%r17 + %r0], %r28
	ta	T_CHANGE_NONHPRIV
iob_intr_2_296:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_296), 16, 16)) -> intp(2, 0, 18)
T2_asi_reg_rd_168:
	mov	0x26, %r14
	.word 0xf8db8e80  ! 4075: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf6854020  ! 4076: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r27
iob_intr_2_297:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_297), 16, 16)) -> intp(2, 0, a)
cpu_intr_2_349:
	setx	0x3f010d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_350:
	setx	0x3c0224, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_179:
	mov	0x3c7, %r14
	.word 0xfef38400  ! 4084: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb695a15a  ! 4086: ORcc_I	orcc 	%r22, 0x015a, %r27
	.word 0xf0d44020  ! 4088: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r24
	.word 0xfc4d4000  ! 4090: LDSB_R	ldsb	[%r21 + %r0], %r30
cpu_intr_2_351:
	setx	0x3d002f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_298:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_298), 16, 16)) -> intp(2, 0, 8)
cpu_intr_2_352:
	setx	0x3d0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8040000  ! 4100: LDUW_R	lduw	[%r16 + %r0], %r28
T2_asi_reg_rd_169:
	mov	0x21, %r14
	.word 0xf2db8e80  ! 4101: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xfe44a079  ! 4103: LDSW_I	ldsw	[%r18 + 0x0079], %r31
iob_intr_2_299:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_299), 16, 16)) -> intp(2, 0, 3a)
iob_intr_2_300:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_300), 16, 16)) -> intp(2, 0, 30)
	.word 0xb00d6128  ! 4115: AND_I	and 	%r21, 0x0128, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xba44e0d5  ! 4118: ADDC_I	addc 	%r19, 0x00d5, %r29
	.word 0xf4954020  ! 4121: LDUHA_R	lduha	[%r21, %r0] 0x01, %r26
cpu_intr_2_353:
	setx	0x3e002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf814a185  ! 4128: LDUH_I	lduh	[%r18 + 0x0185], %r28
cpu_intr_2_354:
	setx	0x3f0010, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_355:
	setx	0x3c0029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc850000  ! 4132: ADDcc_R	addcc 	%r20, %r0, %r30
	.word 0xfe8c60a7  ! 4134: LDUBA_I	lduba	[%r17, + 0x00a7] %asi, %r31
T2_asi_reg_rd_170:
	mov	0x16, %r14
	.word 0xfadb8e60  ! 4137: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xfa9460d3  ! 4139: LDUHA_I	lduha	[%r17, + 0x00d3] %asi, %r29
	.word 0xfc94c020  ! 4143: LDUHA_R	lduha	[%r19, %r0] 0x01, %r30
T2_asi_reg_rd_171:
	mov	0x21, %r14
	.word 0xf6db8e60  ! 4145: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xfe95a1a4  ! 4146: LDUHA_I	lduha	[%r22, + 0x01a4] %asi, %r31
	.word 0xf40da16d  ! 4152: LDUB_I	ldub	[%r22 + 0x016d], %r26
	.word 0xf60561fe  ! 4153: LDUW_I	lduw	[%r21 + 0x01fe], %r27
iob_intr_2_301:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_301), 16, 16)) -> intp(2, 0, 27)
cpu_intr_2_356:
	setx	0x420119, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_180:
	mov	0x4, %r14
	.word 0xf6f38e40  ! 4160: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_rd_172:
	mov	0x1d, %r14
	.word 0xf6db84a0  ! 4161: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf055c000  ! 4165: LDSH_R	ldsh	[%r23 + %r0], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfad4617c  ! 4168: LDSHA_I	ldsha	[%r17, + 0x017c] %asi, %r29
iob_intr_2_302:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_302), 16, 16)) -> intp(2, 0, 3b)
	.word 0xf0c4c020  ! 4172: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r24
iob_intr_2_303:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_303), 16, 16)) -> intp(2, 0, 12)
iob_intr_2_304:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_304), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_rd_173:
	mov	0x3c6, %r14
	.word 0xf2db8e80  ! 4180: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_2_305:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_305), 16, 16)) -> intp(2, 0, 3)
	.word 0xf285219c  ! 4184: LDUWA_I	lduwa	[%r20, + 0x019c] %asi, %r25
cpu_intr_2_357:
	setx	0x400213, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_181:
	mov	0x3c7, %r14
	.word 0xf2f38e40  ! 4188: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfe8d202b  ! 4189: LDUBA_I	lduba	[%r20, + 0x002b] %asi, %r31
iob_intr_2_306:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_306), 16, 16)) -> intp(2, 0, 37)
	.word 0xf8c54020  ! 4193: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r28
	.word 0xf04c4000  ! 4195: LDSB_R	ldsb	[%r17 + %r0], %r24
	.word 0xf854a1d6  ! 4197: LDSH_I	ldsh	[%r18 + 0x01d6], %r28
cpu_intr_2_358:
	setx	0x420120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcc58020  ! 4201: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r30
	.word 0x8395e0dd  ! 4202: WRPR_TNPC_I	wrpr	%r23, 0x00dd, %tnpc
	.word 0xf4544000  ! 4203: LDSH_R	ldsh	[%r17 + %r0], %r26
cpu_intr_2_359:
	setx	0x410038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8c54020  ! 4206: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r28
T2_asi_reg_wr_182:
	mov	0x3c1, %r14
	.word 0xf2f38e40  ! 4208: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb68d0000  ! 4210: ANDcc_R	andcc 	%r20, %r0, %r27
	.word 0xf4d5a0b3  ! 4211: LDSHA_I	ldsha	[%r22, + 0x00b3] %asi, %r26
	.word 0xb6b5a09d  ! 4212: ORNcc_I	orncc 	%r22, 0x009d, %r27
	.word 0xf05c21a7  ! 4213: LDX_I	ldx	[%r16 + 0x01a7], %r24
cpu_intr_2_360:
	setx	0x40023b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_183:
	mov	0x3c4, %r14
	.word 0xfaf38e80  ! 4218: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_2_361:
	setx	0x410134, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_184:
	mov	0x36, %r14
	.word 0xf0f38e60  ! 4222: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_2_307:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_307), 16, 16)) -> intp(2, 0, 3)
	.word 0xf40dc000  ! 4224: LDUB_R	ldub	[%r23 + %r0], %r26
	.word 0xf85d0000  ! 4225: LDX_R	ldx	[%r20 + %r0], %r28
	.word 0xb2348000  ! 4229: ORN_R	orn 	%r18, %r0, %r25
T2_asi_reg_wr_185:
	mov	0x3c8, %r14
	.word 0xf6f38e60  ! 4232: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_2_308:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_308), 16, 16)) -> intp(2, 0, 5)
	.word 0xb88c8000  ! 4235: ANDcc_R	andcc 	%r18, %r0, %r28
cpu_intr_2_362:
	setx	0x40023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4044000  ! 4239: LDUW_R	lduw	[%r17 + %r0], %r26
T2_asi_reg_wr_186:
	mov	0x1c, %r14
	.word 0xfcf389e0  ! 4243: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T2_asi_reg_rd_174:
	mov	0x3c7, %r14
	.word 0xf4db8e80  ! 4245: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	ta	T_CHANGE_NONHPRIV
	.word 0xf4448000  ! 4249: LDSW_R	ldsw	[%r18 + %r0], %r26
	.word 0xb4248000  ! 4252: SUB_R	sub 	%r18, %r0, %r26
iob_intr_2_309:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_309), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_rd_175:
	mov	0x3c0, %r14
	.word 0xf0db84a0  ! 4256: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_2_363:
	setx	0x43031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_187:
	mov	0x3c1, %r14
	.word 0xf6f389e0  ! 4259: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_2_364:
	setx	0x400212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6cc0020  ! 4263: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r27
	.word 0xf04ca16f  ! 4264: LDSB_I	ldsb	[%r18 + 0x016f], %r24
iob_intr_2_310:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_310), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_365:
	setx	0x41031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc450000  ! 4269: LDSW_R	ldsw	[%r20 + %r0], %r30
iob_intr_2_311:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_311), 16, 16)) -> intp(2, 0, 22)
	.word 0xbd7d4400  ! 4274: MOVR_R	movre	%r21, %r0, %r30
	.word 0xfc14e1d7  ! 4277: LDUH_I	lduh	[%r19 + 0x01d7], %r30
	.word 0xfe05c000  ! 4279: LDUW_R	lduw	[%r23 + %r0], %r31
cpu_intr_2_366:
	setx	0x41020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfedc2158  ! 4283: LDXA_I	ldxa	[%r16, + 0x0158] %asi, %r31
	.word 0xb615c000  ! 4287: OR_R	or 	%r23, %r0, %r27
iob_intr_2_312:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_312), 16, 16)) -> intp(2, 0, 32)
T2_asi_reg_wr_188:
	mov	0x10, %r14
	.word 0xfaf384a0  ! 4289: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xf2d5a115  ! 4290: LDSHA_I	ldsha	[%r22, + 0x0115] %asi, %r25
	ta	T_CHANGE_TO_TL1
cpu_intr_2_367:
	setx	0x420328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb01d4000  ! 4294: XOR_R	xor 	%r21, %r0, %r24
T2_asi_reg_wr_189:
	mov	0x37, %r14
	.word 0xf6f38e60  ! 4295: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T2_asi_reg_rd_176:
	mov	0x13, %r14
	.word 0xfcdb8e40  ! 4296: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0x91946034  ! 4297: WRPR_PIL_I	wrpr	%r17, 0x0034, %pil
	.word 0xb484a0ac  ! 4301: ADDcc_I	addcc 	%r18, 0x00ac, %r26
	.word 0xf084206c  ! 4303: LDUWA_I	lduwa	[%r16, + 0x006c] %asi, %r24
iob_intr_2_313:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_313), 16, 16)) -> intp(2, 0, a)
	.word 0xf4ccc020  ! 4314: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r26
iob_intr_2_314:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_314), 16, 16)) -> intp(2, 0, b)
	.word 0xf68ca1ec  ! 4318: LDUBA_I	lduba	[%r18, + 0x01ec] %asi, %r27
	.word 0xfecda101  ! 4319: LDSBA_I	ldsba	[%r22, + 0x0101] %asi, %r31
iob_intr_2_315:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_315), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf214e152  ! 4323: LDUH_I	lduh	[%r19 + 0x0152], %r25
	.word 0xf8554000  ! 4326: LDSH_R	ldsh	[%r21 + %r0], %r28
	.word 0xfa454000  ! 4327: LDSW_R	ldsw	[%r21 + %r0], %r29
T2_asi_reg_rd_177:
	mov	0x3c1, %r14
	.word 0xfcdb89e0  ! 4330: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T2_asi_reg_wr_190:
	mov	0x33, %r14
	.word 0xf6f38e60  ! 4334: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T2_asi_reg_wr_191:
	mov	0x27, %r14
	.word 0xf2f38e60  ! 4335: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_2_368:
	setx	0x400102, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_316:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_316), 16, 16)) -> intp(2, 0, 32)
	.word 0xf2cc614f  ! 4340: LDSBA_I	ldsba	[%r17, + 0x014f] %asi, %r25
	.word 0xf2dda090  ! 4342: LDXA_I	ldxa	[%r22, + 0x0090] %asi, %r25
	.word 0xf40d6107  ! 4343: LDUB_I	ldub	[%r21 + 0x0107], %r26
iob_intr_2_317:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_317), 16, 16)) -> intp(2, 0, 32)
cpu_intr_2_369:
	setx	0x420136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcc5611e  ! 4349: LDSWA_I	ldswa	[%r21, + 0x011e] %asi, %r30
cpu_intr_2_370:
	setx	0x410220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9195a04f  ! 4351: WRPR_PIL_I	wrpr	%r22, 0x004f, %pil
	.word 0xb73c5000  ! 4352: SRAX_R	srax	%r17, %r0, %r27
	.word 0xfc8dc020  ! 4354: LDUBA_R	lduba	[%r23, %r0] 0x01, %r30
	ta	T_CHANGE_NONHPRIV
	.word 0xf25dc000  ! 4356: LDX_R	ldx	[%r23 + %r0], %r25
	.word 0xb32c6001  ! 4357: SLL_I	sll 	%r17, 0x0001, %r25
cpu_intr_2_371:
	setx	0x420024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0c0000  ! 4363: LDUB_R	ldub	[%r16 + %r0], %r29
	.word 0xb6bcc000  ! 4366: XNORcc_R	xnorcc 	%r19, %r0, %r27
	.word 0xfcdde11c  ! 4368: LDXA_I	ldxa	[%r23, + 0x011c] %asi, %r30
iob_intr_2_318:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_318), 16, 16)) -> intp(2, 0, c)
cpu_intr_2_372:
	setx	0x400227, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_178:
	mov	0x2f, %r14
	.word 0xf4db84a0  ! 4375: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb6c58000  ! 4376: ADDCcc_R	addccc 	%r22, %r0, %r27
T2_asi_reg_rd_179:
	mov	0x13, %r14
	.word 0xf2db8400  ! 4382: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T2_asi_reg_rd_180:
	mov	0x3c4, %r14
	.word 0xf6db8e40  ! 4383: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_rd_181:
	mov	0xb, %r14
	.word 0xfcdb8e40  ! 4384: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_wr_192:
	mov	0x5, %r14
	.word 0xf8f389e0  ! 4385: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_2_319:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_319), 16, 16)) -> intp(2, 0, 23)
cpu_intr_2_373:
	setx	0x420011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04de107  ! 4392: LDSB_I	ldsb	[%r23 + 0x0107], %r24
T2_asi_reg_rd_182:
	mov	0xc, %r14
	.word 0xfedb8400  ! 4395: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xfe4421b3  ! 4396: LDSW_I	ldsw	[%r16 + 0x01b3], %r31
	.word 0xb1643801  ! 4401: MOVcc_I	<illegal instruction>
	.word 0xb48cc000  ! 4402: ANDcc_R	andcc 	%r19, %r0, %r26
	.word 0xf08c8020  ! 4404: LDUBA_R	lduba	[%r18, %r0] 0x01, %r24
cpu_intr_2_374:
	setx	0x40032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0cd616c  ! 4408: LDSBA_I	ldsba	[%r21, + 0x016c] %asi, %r24
	.word 0xb83da1c1  ! 4412: XNOR_I	xnor 	%r22, 0x01c1, %r28
	.word 0xf4c4a021  ! 4413: LDSWA_I	ldswa	[%r18, + 0x0021] %asi, %r26
	.word 0xb6352133  ! 4415: ORN_I	orn 	%r20, 0x0133, %r27
T2_asi_reg_wr_193:
	mov	0x33, %r14
	.word 0xf2f38e40  ! 4418: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf284c020  ! 4419: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r25
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_194:
	mov	0x29, %r14
	.word 0xfaf389e0  ! 4423: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_2_320:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_320), 16, 16)) -> intp(2, 0, 36)
	.word 0xfa444000  ! 4425: LDSW_R	ldsw	[%r17 + %r0], %r29
	.word 0xfe15e087  ! 4426: LDUH_I	lduh	[%r23 + 0x0087], %r31
T2_asi_reg_rd_183:
	mov	0x3c2, %r14
	.word 0xf2db8400  ! 4432: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_2_375:
	setx	0x400104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8848020  ! 4441: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r28
	.word 0xb93df001  ! 4443: SRAX_I	srax	%r23, 0x0001, %r28
cpu_intr_2_376:
	setx	0x41021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_321:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_321), 16, 16)) -> intp(2, 0, 3)
iob_intr_2_322:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_322), 16, 16)) -> intp(2, 0, 27)
	.word 0xb7643801  ! 4447: MOVcc_I	<illegal instruction>
	.word 0xf85d21cd  ! 4448: LDX_I	ldx	[%r20 + 0x01cd], %r28
iob_intr_2_323:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_323), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_wr_195:
	mov	0x21, %r14
	.word 0xf6f389e0  ! 4451: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb89cc000  ! 4452: XORcc_R	xorcc 	%r19, %r0, %r28
T2_asi_reg_rd_184:
	mov	0x0, %r14
	.word 0xf2db84a0  ! 4455: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xfe8cc020  ! 4459: LDUBA_R	lduba	[%r19, %r0] 0x01, %r31
cpu_intr_2_377:
	setx	0x410035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2cda0c6  ! 4463: LDSBA_I	ldsba	[%r22, + 0x00c6] %asi, %r25
	.word 0xf48c61a0  ! 4464: LDUBA_I	lduba	[%r17, + 0x01a0] %asi, %r26
	.word 0xb08de0a6  ! 4468: ANDcc_I	andcc 	%r23, 0x00a6, %r24
iob_intr_2_324:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_324), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_rd_185:
	mov	0x24, %r14
	.word 0xf6db8e40  ! 4474: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf6944020  ! 4475: LDUHA_R	lduha	[%r17, %r0] 0x01, %r27
	.word 0xb4958000  ! 4476: ORcc_R	orcc 	%r22, %r0, %r26
	.word 0xf44ca125  ! 4483: LDSB_I	ldsb	[%r18 + 0x0125], %r26
iob_intr_2_325:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_325), 16, 16)) -> intp(2, 0, 1a)
cpu_intr_2_378:
	setx	0x410230, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_196:
	mov	0x18, %r14
	.word 0xf8f384a0  ! 4487: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf0158000  ! 4488: LDUH_R	lduh	[%r22 + %r0], %r24
cpu_intr_2_379:
	setx	0x41001c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_186:
	mov	0x23, %r14
	.word 0xf0db8400  ! 4491: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_2_326:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_326), 16, 16)) -> intp(2, 0, b)
T2_asi_reg_rd_187:
	mov	0x13, %r14
	.word 0xfcdb8e60  ! 4496: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T2_asi_reg_rd_188:
	mov	0x24, %r14
	.word 0xfcdb8e40  ! 4497: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_2_380:
	setx	0x430133, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_381:
	setx	0x420016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64d0000  ! 4506: LDSB_R	ldsb	[%r20 + %r0], %r27
	.word 0xb0440000  ! 4508: ADDC_R	addc 	%r16, %r0, %r24
iob_intr_2_327:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_327), 16, 16)) -> intp(2, 0, e)
	.word 0xf61520fc  ! 4512: LDUH_I	lduh	[%r20 + 0x00fc], %r27
cpu_intr_2_382:
	setx	0x420302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8458000  ! 4517: LDSW_R	ldsw	[%r22 + %r0], %r28
iob_intr_2_328:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_328), 16, 16)) -> intp(2, 0, 36)
	.word 0xf055c000  ! 4519: LDSH_R	ldsh	[%r23 + %r0], %r24
cpu_intr_2_383:
	setx	0x43023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf00c21ff  ! 4522: LDUB_I	ldub	[%r16 + 0x01ff], %r24
cpu_intr_2_384:
	setx	0x420218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2850020  ! 4527: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r25
cpu_intr_2_385:
	setx	0x400332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6454000  ! 4532: LDSW_R	ldsw	[%r21 + %r0], %r27
cpu_intr_2_386:
	setx	0x43010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_197:
	mov	0x2a, %r14
	.word 0xf6f38400  ! 4535: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbf641800  ! 4536: MOVcc_R	<illegal instruction>
	.word 0xbcbc0000  ! 4537: XNORcc_R	xnorcc 	%r16, %r0, %r30
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983c82  ! 4540: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c82, %hpstate
	.word 0xbe3c8000  ! 4541: XNOR_R	xnor 	%r18, %r0, %r31
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_189:
	mov	0x3c5, %r14
	.word 0xf0db8e80  ! 4546: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_2_387:
	setx	0x420212, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_388:
	setx	0x420005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb60c6095  ! 4551: AND_I	and 	%r17, 0x0095, %r27
cpu_intr_2_389:
	setx	0x400302, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_190:
	mov	0x20, %r14
	.word 0xfcdb8e80  ! 4553: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_2_329:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_329), 16, 16)) -> intp(2, 0, 2d)
	.word 0xfa0dc000  ! 4558: LDUB_R	ldub	[%r23 + %r0], %r29
T2_asi_reg_rd_191:
	mov	0x1d, %r14
	.word 0xf0db8e60  ! 4560: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf6c56036  ! 4561: LDSWA_I	ldswa	[%r21, + 0x0036] %asi, %r27
	.word 0xf6958020  ! 4563: LDUHA_R	lduha	[%r22, %r0] 0x01, %r27
	.word 0xf645e0e1  ! 4568: LDSW_I	ldsw	[%r23 + 0x00e1], %r27
	.word 0x8f902001  ! 4569: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
cpu_intr_2_390:
	setx	0x420106, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_330:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_330), 16, 16)) -> intp(2, 0, 21)
T2_asi_reg_rd_192:
	mov	0x2f, %r14
	.word 0xf0db84a0  ! 4574: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_2_331:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_331), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_391:
	setx	0x400300, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_392:
	setx	0x43032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6bc8000  ! 4580: XNORcc_R	xnorcc 	%r18, %r0, %r27
	.word 0xbea5e190  ! 4581: SUBcc_I	subcc 	%r23, 0x0190, %r31
iob_intr_2_332:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_332), 16, 16)) -> intp(2, 0, 26)
	.word 0xf84d0000  ! 4585: LDSB_R	ldsb	[%r20 + %r0], %r28
iob_intr_2_333:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_333), 16, 16)) -> intp(2, 0, 16)
	.word 0x8394e157  ! 4590: WRPR_TNPC_I	wrpr	%r19, 0x0157, %tnpc
	.word 0xf4040000  ! 4591: LDUW_R	lduw	[%r16 + %r0], %r26
iob_intr_2_334:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_334), 16, 16)) -> intp(2, 0, 1a)
iob_intr_2_335:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_335), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf85c8000  ! 4601: LDX_R	ldx	[%r18 + %r0], %r28
	.word 0xfad5c020  ! 4603: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r29
	setx	data_start_0, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982dc0  ! 4606: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc0, %hpstate
	.word 0xfc4d6030  ! 4608: LDSB_I	ldsb	[%r21 + 0x0030], %r30
	.word 0xfa45a1b8  ! 4612: LDSW_I	ldsw	[%r22 + 0x01b8], %r29
	.word 0xf0cc0020  ! 4613: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r24
	.word 0xfc45e07a  ! 4614: LDSW_I	ldsw	[%r23 + 0x007a], %r30
	.word 0xfc85a190  ! 4615: LDUWA_I	lduwa	[%r22, + 0x0190] %asi, %r30
	.word 0xf2cd0020  ! 4618: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r25
cpu_intr_2_393:
	setx	0x470115, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_394:
	setx	0x450010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf204a063  ! 4625: LDUW_I	lduw	[%r18 + 0x0063], %r25
cpu_intr_2_395:
	setx	0x440219, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_396:
	setx	0x46031a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_193:
	mov	0x3c7, %r14
	.word 0xf2db8400  ! 4630: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T2_asi_reg_wr_198:
	mov	0xb, %r14
	.word 0xfcf384a0  ! 4631: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf0ccc020  ! 4632: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r24
	.word 0xfa45a1f0  ! 4635: LDSW_I	ldsw	[%r22 + 0x01f0], %r29
	.word 0xf4d48020  ! 4636: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r26
iob_intr_2_336:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_336), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_397:
	setx	0x47030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb80de1f0  ! 4641: AND_I	and 	%r23, 0x01f0, %r28
	.word 0xf29561c7  ! 4642: LDUHA_I	lduha	[%r21, + 0x01c7] %asi, %r25
iob_intr_2_337:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_337), 16, 16)) -> intp(2, 0, 1c)
	.word 0xbf3c3001  ! 4644: SRAX_I	srax	%r16, 0x0001, %r31
cpu_intr_2_398:
	setx	0x470317, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_338:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_338), 16, 16)) -> intp(2, 0, 21)
	.word 0xbd3c7001  ! 4651: SRAX_I	srax	%r17, 0x0001, %r30
iob_intr_2_339:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_339), 16, 16)) -> intp(2, 0, 32)
	.word 0xb32da001  ! 4657: SLL_I	sll 	%r22, 0x0001, %r25
	.word 0xf4c521d3  ! 4658: LDSWA_I	ldswa	[%r20, + 0x01d3] %asi, %r26
	.word 0xfc148000  ! 4661: LDUH_R	lduh	[%r18 + %r0], %r30
T2_asi_reg_rd_194:
	mov	0x3c5, %r14
	.word 0xfedb84a0  ! 4664: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_2_340:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_340), 16, 16)) -> intp(2, 0, 1e)
	.word 0xb235c000  ! 4668: SUBC_R	orn 	%r23, %r0, %r25
	.word 0x8795a119  ! 4670: WRPR_TT_I	wrpr	%r22, 0x0119, %tt
	.word 0xb72df001  ! 4671: SLLX_I	sllx	%r23, 0x0001, %r27
	.word 0xf80c4000  ! 4672: LDUB_R	ldub	[%r17 + %r0], %r28
iob_intr_2_341:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_341), 16, 16)) -> intp(2, 0, 35)
cpu_intr_2_399:
	setx	0x47022e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_342:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_342), 16, 16)) -> intp(2, 0, 26)
	.word 0xb82dc000  ! 4677: ANDN_R	andn 	%r23, %r0, %r28
cpu_intr_2_400:
	setx	0x44010c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_343:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_343), 16, 16)) -> intp(2, 0, 3a)
cpu_intr_2_401:
	setx	0x45023a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_344:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_344), 16, 16)) -> intp(2, 0, 1f)
cpu_intr_2_402:
	setx	0x45022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983cc8  ! 4686: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc8, %hpstate
T2_asi_reg_wr_199:
	mov	0x3c5, %r14
	.word 0xf6f389e0  ! 4687: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb1643801  ! 4690: MOVcc_I	<illegal instruction>
cpu_intr_2_403:
	setx	0x460300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04d8000  ! 4695: LDSB_R	ldsb	[%r22 + %r0], %r24
	.word 0xb2344000  ! 4696: SUBC_R	orn 	%r17, %r0, %r25
	.word 0xf4c50020  ! 4697: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r26
T2_asi_reg_rd_195:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 4698: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_2_345:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_345), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_rd_196:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 4703: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb13cf001  ! 4707: SRAX_I	srax	%r19, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0xfe85a1e4  ! 4709: LDUWA_I	lduwa	[%r22, + 0x01e4] %asi, %r31
	.word 0xb48c4000  ! 4712: ANDcc_R	andcc 	%r17, %r0, %r26
	.word 0xfc854020  ! 4714: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r30
	.word 0xf2cde168  ! 4716: LDSBA_I	ldsba	[%r23, + 0x0168] %asi, %r25
	.word 0xf694c020  ! 4718: LDUHA_R	lduha	[%r19, %r0] 0x01, %r27
	.word 0xfcd48020  ! 4720: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r30
T2_asi_reg_rd_197:
	mov	0x1f, %r14
	.word 0xf4db8e60  ! 4721: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xfc94215a  ! 4723: LDUHA_I	lduha	[%r16, + 0x015a] %asi, %r30
iob_intr_2_346:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_346), 16, 16)) -> intp(2, 0, 31)
T2_asi_reg_wr_200:
	mov	0x22, %r14
	.word 0xf0f38e40  ! 4728: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_wr_201:
	mov	0x3c1, %r14
	.word 0xfef384a0  ! 4729: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_2_347:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_347), 16, 16)) -> intp(2, 0, 36)
cpu_intr_2_404:
	setx	0x46012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeb420c8  ! 4732: SUBCcc_I	orncc 	%r16, 0x00c8, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf0458000  ! 4735: LDSW_R	ldsw	[%r22 + %r0], %r24
T2_asi_reg_rd_198:
	mov	0x3c3, %r14
	.word 0xfadb89e0  ! 4737: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf20dc000  ! 4738: LDUB_R	ldub	[%r23 + %r0], %r25
	.word 0xf0542039  ! 4740: LDSH_I	ldsh	[%r16 + 0x0039], %r24
	.word 0xf2448000  ! 4743: LDSW_R	ldsw	[%r18 + %r0], %r25
cpu_intr_2_405:
	setx	0x460030, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_348:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_348), 16, 16)) -> intp(2, 0, 29)
	.word 0xf2044000  ! 4748: LDUW_R	lduw	[%r17 + %r0], %r25
	.word 0xf8cc0020  ! 4749: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r28
cpu_intr_2_406:
	setx	0x470306, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_349:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_349), 16, 16)) -> intp(2, 0, 37)
	.word 0xfe9461b2  ! 4757: LDUHA_I	lduha	[%r17, + 0x01b2] %asi, %r31
T2_asi_reg_rd_199:
	mov	0x21, %r14
	.word 0xf0db8e40  ! 4761: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_407:
	setx	0x470211, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_202:
	mov	0x3c5, %r14
	.word 0xf4f389e0  ! 4764: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_2_350:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_350), 16, 16)) -> intp(2, 0, 36)
	.word 0xf05d0000  ! 4766: LDX_R	ldx	[%r20 + %r0], %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf0144000  ! 4768: LDUH_R	lduh	[%r17 + %r0], %r24
T2_asi_reg_wr_203:
	mov	0x12, %r14
	.word 0xf6f38e40  ! 4772: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_2_408:
	setx	0x45032f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_351:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_351), 16, 16)) -> intp(2, 0, 27)
	.word 0xfc44a041  ! 4776: LDSW_I	ldsw	[%r18 + 0x0041], %r30
	.word 0xfe14203c  ! 4778: LDUH_I	lduh	[%r16 + 0x003c], %r31
iob_intr_2_352:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_352), 16, 16)) -> intp(2, 0, 3a)
cpu_intr_2_409:
	setx	0x45031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8d4e163  ! 4783: LDSHA_I	ldsha	[%r19, + 0x0163] %asi, %r28
cpu_intr_2_410:
	setx	0x440136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8954000  ! 4785: ORcc_R	orcc 	%r21, %r0, %r28
iob_intr_2_353:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_353), 16, 16)) -> intp(2, 0, 1d)
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982e10  ! 4789: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e10, %hpstate
	.word 0xf6ccc020  ! 4790: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r27
iob_intr_2_354:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_354), 16, 16)) -> intp(2, 0, 4)
T2_asi_reg_wr_204:
	mov	0x1e, %r14
	.word 0xfcf389e0  ! 4792: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T2_asi_reg_rd_200:
	mov	0x31, %r14
	.word 0xfcdb8e60  ! 4793: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_2_411:
	setx	0x44032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28421cc  ! 4796: ADDcc_I	addcc 	%r16, 0x01cc, %r25
	.word 0xfc140000  ! 4797: LDUH_R	lduh	[%r16 + %r0], %r30
	.word 0xf4cd4020  ! 4798: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r26
	.word 0xba2cc000  ! 4799: ANDN_R	andn 	%r19, %r0, %r29
	.word 0xf2054000  ! 4800: LDUW_R	lduw	[%r21 + %r0], %r25
	ta	T_CHANGE_TO_TL0
cpu_intr_2_412:
	setx	0x470112, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_355:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_355), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_rd_201:
	mov	0x3c3, %r14
	.word 0xf2db8e80  ! 4817: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_202:
	mov	0x20, %r14
	.word 0xf0db8e40  ! 4819: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfecd8020  ! 4820: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r31
T2_asi_reg_rd_203:
	mov	0x30, %r14
	.word 0xf8db8e40  ! 4821: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T2_asi_reg_rd_204:
	mov	0x3c4, %r14
	.word 0xf4db84a0  ! 4824: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T2_asi_reg_wr_205:
	mov	0x26, %r14
	.word 0xf6f38e80  ! 4827: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_2_356:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_356), 16, 16)) -> intp(2, 0, 3b)
cpu_intr_2_413:
	setx	0x470202, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_357:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_357), 16, 16)) -> intp(2, 0, 31)
iob_intr_2_358:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_358), 16, 16)) -> intp(2, 0, 18)
	.word 0xb6254000  ! 4836: SUB_R	sub 	%r21, %r0, %r27
	.word 0xb37d4400  ! 4839: MOVR_R	movre	%r21, %r0, %r25
	.word 0xfe44a005  ! 4840: LDSW_I	ldsw	[%r18 + 0x0005], %r31
cpu_intr_2_414:
	setx	0x450320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf49521d5  ! 4843: LDUHA_I	lduha	[%r20, + 0x01d5] %asi, %r26
	.word 0xf48d4020  ! 4844: LDUBA_R	lduba	[%r21, %r0] 0x01, %r26
	.word 0xfad50020  ! 4845: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r29
cpu_intr_2_415:
	setx	0x460234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b58000  ! 4849: ORNcc_R	orncc 	%r22, %r0, %r28
T2_asi_reg_rd_205:
	mov	0x3c2, %r14
	.word 0xf6db89e0  ! 4851: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xb8b44000  ! 4855: SUBCcc_R	orncc 	%r17, %r0, %r28
	.word 0xf6dca05c  ! 4858: LDXA_I	ldxa	[%r18, + 0x005c] %asi, %r27
	.word 0xf68de1e5  ! 4860: LDUBA_I	lduba	[%r23, + 0x01e5] %asi, %r27
cpu_intr_2_416:
	setx	0x46001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8c48020  ! 4867: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r28
	.word 0xbc3d6094  ! 4868: XNOR_I	xnor 	%r21, 0x0094, %r30
	.word 0xfc94e15b  ! 4872: LDUHA_I	lduha	[%r19, + 0x015b] %asi, %r30
	.word 0xf68dc020  ! 4874: LDUBA_R	lduba	[%r23, %r0] 0x01, %r27
T2_asi_reg_rd_206:
	mov	0xd, %r14
	.word 0xf2db8400  ! 4880: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xbd7dc400  ! 4881: MOVR_R	movre	%r23, %r0, %r30
	.word 0x89956054  ! 4883: WRPR_TICK_I	wrpr	%r21, 0x0054, %tick
iob_intr_2_359:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_359), 16, 16)) -> intp(2, 0, 25)
iob_intr_2_360:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_360), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf2cce0e4  ! 4887: LDSBA_I	ldsba	[%r19, + 0x00e4] %asi, %r25
	.word 0xf6d58020  ! 4888: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r27
iob_intr_2_361:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_361), 16, 16)) -> intp(2, 0, 14)
	.word 0xbaac4000  ! 4891: ANDNcc_R	andncc 	%r17, %r0, %r29
iob_intr_2_362:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_362), 16, 16)) -> intp(2, 0, 11)
iob_intr_2_363:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_363), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_417:
	setx	0x440009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d521e4  ! 4900: LDSHA_I	ldsha	[%r20, + 0x01e4] %asi, %r25
T2_asi_reg_rd_207:
	mov	0x9, %r14
	.word 0xfadb8e60  ! 4901: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xfa8d4020  ! 4902: LDUBA_R	lduba	[%r21, %r0] 0x01, %r29
T2_asi_reg_rd_208:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 4903: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf6448000  ! 4905: LDSW_R	ldsw	[%r18 + %r0], %r27
	.word 0xf4c44020  ! 4907: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r26
	.word 0xfc546108  ! 4908: LDSH_I	ldsh	[%r17 + 0x0108], %r30
iob_intr_2_364:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_364), 16, 16)) -> intp(2, 0, 2a)
T2_asi_reg_rd_209:
	mov	0x27, %r14
	.word 0xf4db84a0  ! 4911: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_2_365:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_365), 16, 16)) -> intp(2, 0, 9)
	.word 0xb750c000  ! 4915: RDPR_TT	<illegal instruction>
T2_asi_reg_wr_206:
	mov	0x24, %r14
	.word 0xf4f38e80  ! 4917: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb8854000  ! 4918: ADDcc_R	addcc 	%r21, %r0, %r28
	.word 0xfa54e166  ! 4920: LDSH_I	ldsh	[%r19 + 0x0166], %r29
	ta	T_CHANGE_TO_TL1
	.word 0x8395214e  ! 4922: WRPR_TNPC_I	wrpr	%r20, 0x014e, %tnpc
cpu_intr_2_418:
	setx	0x450227, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_419:
	setx	0x450035, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_366:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_366), 16, 16)) -> intp(2, 0, 2c)
cpu_intr_2_420:
	setx	0x460025, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_210:
	mov	0x3c6, %r14
	.word 0xf8db84a0  ! 4931: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf8946175  ! 4936: LDUHA_I	lduha	[%r17, + 0x0175] %asi, %r28
	.word 0xf0d50020  ! 4937: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r24
	.word 0xf8c5c020  ! 4941: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r28
	.word 0xf644a1ef  ! 4944: LDSW_I	ldsw	[%r18 + 0x01ef], %r27
	.word 0xbca5a1bd  ! 4945: SUBcc_I	subcc 	%r22, 0x01bd, %r30
iob_intr_2_367:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_367), 16, 16)) -> intp(2, 0, 5)
iob_intr_2_368:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_368), 16, 16)) -> intp(2, 0, 2d)
iob_intr_2_369:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_369), 16, 16)) -> intp(2, 0, 38)
iob_intr_2_370:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_370), 16, 16)) -> intp(2, 0, 36)
iob_intr_2_371:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_371), 16, 16)) -> intp(2, 0, 35)
	.word 0xfed44020  ! 4958: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r31
	.word 0xf64ca109  ! 4959: LDSB_I	ldsb	[%r18 + 0x0109], %r27
cpu_intr_2_421:
	setx	0x47030e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_372:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_372), 16, 16)) -> intp(2, 0, 5)
	.word 0xba3dc000  ! 4964: XNOR_R	xnor 	%r23, %r0, %r29
cpu_intr_2_422:
	setx	0x44022c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_373:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_373), 16, 16)) -> intp(2, 0, 35)
iob_intr_2_374:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_374), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_423:
	setx	0x45000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf80c215b  ! 4970: LDUB_I	ldub	[%r16 + 0x015b], %r28
	.word 0xb92d0000  ! 4971: SLL_R	sll 	%r20, %r0, %r28
T2_asi_reg_wr_207:
	mov	0x4, %r14
	.word 0xfef384a0  ! 4973: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_2_375:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_375), 16, 16)) -> intp(2, 0, 3d)
cpu_intr_2_424:
	setx	0x440320, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb53cf001  ! 4984: SRAX_I	srax	%r19, 0x0001, %r26
	ta	T_CHANGE_TO_TL1
cpu_intr_2_425:
	setx	0x460014, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_208:
	mov	0x3c8, %r14
	.word 0xf0f38e40  ! 4987: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf85de0b7  ! 4988: LDX_I	ldx	[%r23 + 0x00b7], %r28
iob_intr_2_376:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_376), 16, 16)) -> intp(2, 0, 24)
	.word 0xf405c000  ! 4995: LDUW_R	lduw	[%r23 + %r0], %r26
	.word 0xf60561b6  ! 4997: LDUW_I	lduw	[%r21 + 0x01b6], %r27
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xb1a40840  ! 1: FADDd	faddd	%f16, %f0, %f24
T1_asi_reg_wr_0:
	mov	0x2, %r14
	.word 0xf4f38400  ! 2: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T1_asi_reg_wr_1:
	mov	0x9, %r14
	.word 0xf4f38e40  ! 3: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_0:
	setx	0x1d000c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_1:
	setx	0x1d0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a40860  ! 16: FADDq	dis not found

	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xb5a48940  ! 19: FMULd	fmuld	%f18, %f0, %f26
cpu_intr_1_2:
	setx	0x1d000d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_3:
	setx	0x1f0327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1643801  ! 31: MOVcc_I	<illegal instruction>
	.word 0xb3a58920  ! 32: FMULs	fmuls	%f22, %f0, %f25
	.word 0xbda98820  ! 35: FMOVNEG	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_2:
	mov	0xc, %r14
	.word 0xf6f38e40  ! 36: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_wr_3:
	mov	0x10, %r14
	.word 0xfcf38e80  ! 37: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbab5c000  ! 42: SUBCcc_R	orncc 	%r23, %r0, %r29
	.word 0xb1a8c820  ! 43: FMOVL	fmovs	%fcc1, %f0, %f24
iob_intr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_0), 16, 16)) -> intp(1, 0, 3)
	.word 0xb93d2001  ! 50: SRA_I	sra 	%r20, 0x0001, %r28
iob_intr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_1), 16, 16)) -> intp(1, 0, a)
	.word 0xbba408a0  ! 52: FSUBs	fsubs	%f16, %f0, %f29
iob_intr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_2), 16, 16)) -> intp(1, 0, 22)
iob_intr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_3), 16, 16)) -> intp(1, 0, 34)
cpu_intr_1_4:
	setx	0x1d0318, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_0:
	mov	0x35, %r14
	.word 0xfcdb84a0  ! 60: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbfa40940  ! 62: FMULd	fmuld	%f16, %f0, %f62
	.word 0xbc158000  ! 63: OR_R	or 	%r22, %r0, %r30
cpu_intr_1_5:
	setx	0x1f0315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbec561fe  ! 69: ADDCcc_I	addccc 	%r21, 0x01fe, %r31
	.word 0xb1abc820  ! 70: FMOVVC	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_4:
	mov	0x3c2, %r14
	.word 0xf4f389e0  ! 72: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb3ab0820  ! 73: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xbba80820  ! 74: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xbfa4c9c0  ! 75: FDIVd	fdivd	%f50, %f0, %f62
	.word 0xbb3dc000  ! 76: SRA_R	sra 	%r23, %r0, %r29
cpu_intr_1_6:
	setx	0x1c012e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_7:
	setx	0x1f0221, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_1:
	mov	0x3c4, %r14
	.word 0xf0db8e60  ! 81: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb5a81420  ! 84: FMOVRNZ	dis not found

	.word 0xb5a80420  ! 85: FMOVRZ	dis not found

	.word 0xb9a00020  ! 86: FMOVs	fmovs	%f0, %f28
	.word 0xb3a00520  ! 90: FSQRTs	fsqrt	
	.word 0xbda94820  ! 91: FMOVCS	fmovs	%fcc1, %f0, %f30
cpu_intr_1_8:
	setx	0x1c0016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba2421d5  ! 99: SUB_I	sub 	%r16, 0x01d5, %r29
cpu_intr_1_9:
	setx	0x1f0207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5ab0820  ! 101: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb5a94820  ! 102: FMOVCS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_2:
	mov	0x21, %r14
	.word 0xf6db84a0  ! 103: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T1_asi_reg_wr_5:
	mov	0x34, %r14
	.word 0xf0f389e0  ! 105: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T1_asi_reg_rd_3:
	mov	0x2e, %r14
	.word 0xfadb8e80  ! 106: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb1a00520  ! 107: FSQRTs	fsqrt	
	.word 0xb3a589e0  ! 113: FDIVq	dis not found

	.word 0xb00cc000  ! 116: AND_R	and 	%r19, %r0, %r24
	.word 0xb3a81420  ! 119: FMOVRNZ	dis not found

iob_intr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_4), 16, 16)) -> intp(1, 0, 8)
	.word 0xb8c461c9  ! 128: ADDCcc_I	addccc 	%r17, 0x01c9, %r28
iob_intr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_5), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb7a00560  ! 131: FSQRTq	fsqrt	
	.word 0xb1643801  ! 133: MOVcc_I	<illegal instruction>
	.word 0xbda00540  ! 134: FSQRTd	fsqrt	
cpu_intr_1_10:
	setx	0x1d030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80420  ! 137: FMOVRZ	dis not found

	.word 0xb3a48860  ! 139: FADDq	dis not found

	.word 0xb5a81c20  ! 142: FMOVRGEZ	dis not found

iob_intr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_6), 16, 16)) -> intp(1, 0, d)
cpu_intr_1_11:
	setx	0x1f030d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_7), 16, 16)) -> intp(1, 0, f)
T1_asi_reg_wr_6:
	mov	0x23, %r14
	.word 0xf4f38e60  ! 151: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_8), 16, 16)) -> intp(1, 0, 2b)
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xb7a00560  ! 157: FSQRTq	fsqrt	
iob_intr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_9), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_12:
	setx	0x1e0132, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_13:
	setx	0x1c0205, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_7:
	mov	0x3c8, %r14
	.word 0xfcf389e0  ! 171: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	lda	[%r22 + %g0] 0xf0, %f2
iob_intr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_10), 16, 16)) -> intp(1, 0, c)
iob_intr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_11), 16, 16)) -> intp(1, 0, 1c)
cpu_intr_1_14:
	setx	0x1e0115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80c20  ! 183: FMOVRLZ	dis not found

	.word 0xb1aa8820  ! 185: FMOVG	fmovs	%fcc1, %f0, %f24
iob_intr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_12), 16, 16)) -> intp(1, 0, 29)
	.word 0xb53ce001  ! 193: SRA_I	sra 	%r19, 0x0001, %r26
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xb3a44960  ! 195: FMULq	dis not found

iob_intr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_13), 16, 16)) -> intp(1, 0, 4)
	.word 0xb535c000  ! 197: SRL_R	srl 	%r23, %r0, %r26
	.word 0xbba588c0  ! 200: FSUBd	fsubd	%f22, %f0, %f60
cpu_intr_1_15:
	setx	0x1f0015, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_14), 16, 16)) -> intp(1, 0, 3e)
iob_intr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_15), 16, 16)) -> intp(1, 0, 27)
iob_intr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_16), 16, 16)) -> intp(1, 0, 0)
iob_intr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_17), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb084a0b1  ! 209: ADDcc_I	addcc 	%r18, 0x00b1, %r24
iob_intr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_18), 16, 16)) -> intp(1, 0, 37)
T1_asi_reg_rd_4:
	mov	0x7, %r14
	.word 0xf0db8400  ! 220: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_1_16:
	setx	0x1d003d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_5:
	mov	0x2a, %r14
	.word 0xf2db8e40  ! 225: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_19), 16, 16)) -> intp(1, 0, 1a)
iob_intr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_20), 16, 16)) -> intp(1, 0, 33)
	.word 0xb3a00540  ! 235: FSQRTd	fsqrt	
T1_asi_reg_rd_6:
	mov	0x30, %r14
	.word 0xf4db8e80  ! 241: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb1a488c0  ! 244: FSUBd	fsubd	%f18, %f0, %f24
	.word 0xba0c4000  ! 245: AND_R	and 	%r17, %r0, %r29
	.word 0xb7aac820  ! 247: FMOVGE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_8:
	mov	0x1e, %r14
	.word 0xf0f38e60  ! 248: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T1_asi_reg_wr_9:
	mov	0x0, %r14
	.word 0xf2f38e80  ! 250: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_21), 16, 16)) -> intp(1, 0, 21)
T1_asi_reg_wr_10:
	mov	0x3c5, %r14
	.word 0xf4f38400  ! 252: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_22), 16, 16)) -> intp(1, 0, 1c)
	.word 0xbfaa8820  ! 257: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xbebc8000  ! 258: XNORcc_R	xnorcc 	%r18, %r0, %r31
cpu_intr_1_17:
	setx	0x1f001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a8c820  ! 262: FMOVL	fmovs	%fcc1, %f0, %f25
cpu_intr_1_18:
	setx	0x1f0131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda50820  ! 268: FADDs	fadds	%f20, %f0, %f30
cpu_intr_1_19:
	setx	0x1d0213, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_11:
	mov	0x10, %r14
	.word 0xfcf38400  ! 275: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_23), 16, 16)) -> intp(1, 0, 1f)
	.word 0xbfa00520  ! 280: FSQRTs	fsqrt	
	.word 0xbda00540  ! 284: FSQRTd	fsqrt	
	.word 0xbfa589e0  ! 289: FDIVq	dis not found

	.word 0xb7a48840  ! 291: FADDd	faddd	%f18, %f0, %f58
iob_intr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_24), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb445c000  ! 295: ADDC_R	addc 	%r23, %r0, %r26
T1_asi_reg_wr_12:
	mov	0x3c5, %r14
	.word 0xf2f38e60  ! 299: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb1a589e0  ! 300: FDIVq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a80820  ! 309: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb1a84820  ! 310: FMOVE	fmovs	%fcc1, %f0, %f24
cpu_intr_1_20:
	setx	0x1d0121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80420  ! 312: FMOVRZ	dis not found

	.word 0xb5a40920  ! 314: FMULs	fmuls	%f16, %f0, %f26
	.word 0xb33ca001  ! 315: SRA_I	sra 	%r18, 0x0001, %r25
cpu_intr_1_21:
	setx	0x1d013c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_7:
	mov	0x3c2, %r14
	.word 0xfadb8e40  ! 318: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb37da401  ! 319: MOVR_I	movre	%r22, 0x1, %r25
	.word 0xbc95c000  ! 321: ORcc_R	orcc 	%r23, %r0, %r30
iob_intr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_25), 16, 16)) -> intp(1, 0, 37)
	.word 0xbfab4820  ! 324: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb33db001  ! 327: SRAX_I	srax	%r22, 0x0001, %r25
	.word 0xb7a80420  ! 328: FMOVRZ	dis not found

	.word 0xbda54820  ! 329: FADDs	fadds	%f21, %f0, %f30
	.word 0x91946069  ! 331: WRPR_PIL_I	wrpr	%r17, 0x0069, %pil
	.word 0xb3a54920  ! 333: FMULs	fmuls	%f21, %f0, %f25
	.word 0xb1a4c8a0  ! 334: FSUBs	fsubs	%f19, %f0, %f24
T1_asi_reg_wr_13:
	mov	0x18, %r14
	.word 0xf6f384a0  ! 339: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb415c000  ! 340: OR_R	or 	%r23, %r0, %r26
cpu_intr_1_22:
	setx	0x1f0038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd35d000  ! 344: SRLX_R	srlx	%r23, %r0, %r30
	.word 0xbfa00520  ! 345: FSQRTs	fsqrt	
	.word 0xbda448c0  ! 346: FSUBd	fsubd	%f48, %f0, %f30
	.word 0xb1a80420  ! 348: FMOVRZ	dis not found

	.word 0xb0b5c000  ! 350: ORNcc_R	orncc 	%r23, %r0, %r24
cpu_intr_1_23:
	setx	0x1e0226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_24:
	setx	0x1c0319, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_26), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb3a80420  ! 362: FMOVRZ	dis not found

	.word 0xbda94820  ! 363: FMOVCS	fmovs	%fcc1, %f0, %f30
iob_intr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_27), 16, 16)) -> intp(1, 0, 17)
iob_intr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_28), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb6954000  ! 371: ORcc_R	orcc 	%r21, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3a4c9a0  ! 375: FDIVs	fdivs	%f19, %f0, %f25
cpu_intr_1_25:
	setx	0x1c0135, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_14:
	mov	0x3c2, %r14
	.word 0xf2f389e0  ! 379: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb7a549e0  ! 381: FDIVq	dis not found

	.word 0xb1a00560  ! 384: FSQRTq	fsqrt	
T1_asi_reg_wr_15:
	mov	0x3c4, %r14
	.word 0xf2f38400  ! 385: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb6c50000  ! 386: ADDCcc_R	addccc 	%r20, %r0, %r27
cpu_intr_1_26:
	setx	0x1d0329, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_27:
	setx	0x1d0215, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_16:
	mov	0x12, %r14
	.word 0xf8f38e40  ! 395: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_28:
	setx	0x1f0134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81420  ! 398: FMOVRNZ	dis not found

	.word 0xbfa00540  ! 399: FSQRTd	fsqrt	
	lda	[%r23 + %g0] 0xf0, %f2
iob_intr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_29), 16, 16)) -> intp(1, 0, 32)
cpu_intr_1_29:
	setx	0x1e0304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a98820  ! 405: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xbba80420  ! 408: FMOVRZ	dis not found

	.word 0xbda589e0  ! 411: FDIVq	dis not found

	.word 0xb1aac820  ! 412: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb9a80820  ! 413: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xbfa48960  ! 414: FMULq	dis not found

	.word 0xbdab0820  ! 420: FMOVGU	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_8:
	mov	0x32, %r14
	.word 0xfcdb8400  ! 421: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T1_asi_reg_wr_17:
	mov	0x9, %r14
	.word 0xf8f38e60  ! 422: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xba85602c  ! 424: ADDcc_I	addcc 	%r21, 0x002c, %r29
cpu_intr_1_30:
	setx	0x1d0012, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_30), 16, 16)) -> intp(1, 0, 1a)
cpu_intr_1_31:
	setx	0x1d0135, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_31), 16, 16)) -> intp(1, 0, 38)
	.word 0xb5a00020  ! 439: FMOVs	fmovs	%f0, %f26
	.word 0xb7a5c8e0  ! 444: FSUBq	dis not found

T1_asi_reg_wr_18:
	mov	0x14, %r14
	.word 0xf4f389e0  ! 446: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_1_32:
	setx	0x1c0026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1abc820  ! 452: FMOVVC	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_19:
	mov	0x13, %r14
	.word 0xf0f38e80  ! 456: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T1_asi_reg_rd_9:
	mov	0x38, %r14
	.word 0xfcdb8400  ! 457: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_1_33:
	setx	0x1c021f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_20:
	mov	0x2d, %r14
	.word 0xf0f384a0  ! 460: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_32), 16, 16)) -> intp(1, 0, 30)
iob_intr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_33), 16, 16)) -> intp(1, 0, 22)
cpu_intr_1_34:
	setx	0x1f0134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c920  ! 469: FMULs	fmuls	%f19, %f0, %f31
	.word 0xb5a509a0  ! 470: FDIVs	fdivs	%f20, %f0, %f26
	.word 0xb7a94820  ! 471: FMOVCS	fmovs	%fcc1, %f0, %f27
iob_intr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_34), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_35), 16, 16)) -> intp(1, 0, f)
cpu_intr_1_35:
	setx	0x23013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1ab4820  ! 480: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb7a80420  ! 481: FMOVRZ	dis not found

T1_asi_reg_rd_10:
	mov	0x3c4, %r14
	.word 0xf8db8e80  ! 482: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb7a4c9e0  ! 484: FDIVq	dis not found

	.word 0xb3aa8820  ! 485: FMOVG	fmovs	%fcc1, %f0, %f25
iob_intr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_36), 16, 16)) -> intp(1, 0, 32)
	.word 0xb3a4c8c0  ! 491: FSUBd	fsubd	%f50, %f0, %f56
	.word 0xb7a81820  ! 493: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xbba408a0  ! 496: FSUBs	fsubs	%f16, %f0, %f29
iob_intr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_37), 16, 16)) -> intp(1, 0, 38)
iob_intr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_38), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_36:
	setx	0x210113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa9c820  ! 501: FMOVVS	fmovs	%fcc1, %f0, %f31
cpu_intr_1_37:
	setx	0x210100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa489a0  ! 503: FDIVs	fdivs	%f18, %f0, %f31
	.word 0xbba5c8e0  ! 505: FSUBq	dis not found

	.word 0xbba4c940  ! 508: FMULd	fmuld	%f50, %f0, %f60
iob_intr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_39), 16, 16)) -> intp(1, 0, 38)
	.word 0xb9ab8820  ! 519: FMOVPOS	fmovs	%fcc1, %f0, %f28
iob_intr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_40), 16, 16)) -> intp(1, 0, 23)
cpu_intr_1_38:
	setx	0x220211, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_11:
	mov	0x3c4, %r14
	.word 0xf0db8e60  ! 525: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T1_asi_reg_wr_21:
	mov	0x3c2, %r14
	.word 0xfcf384a0  ! 526: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb3a588e0  ! 528: FSUBq	dis not found

cpu_intr_1_39:
	setx	0x20020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28de0ec  ! 530: ANDcc_I	andcc 	%r23, 0x00ec, %r25
	.word 0xbaac4000  ! 531: ANDNcc_R	andncc 	%r17, %r0, %r29
	.word 0xbb2d2001  ! 532: SLL_I	sll 	%r20, 0x0001, %r29
	.word 0xb1a50820  ! 533: FADDs	fadds	%f20, %f0, %f24
T1_asi_reg_rd_12:
	mov	0x16, %r14
	.word 0xf8db8e80  ! 534: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_1_40:
	setx	0x220110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aa0820  ! 539: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xbba40940  ! 540: FMULd	fmuld	%f16, %f0, %f60
T1_asi_reg_wr_22:
	mov	0xc, %r14
	.word 0xf8f38e80  ! 541: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T1_asi_reg_wr_23:
	mov	0x3c2, %r14
	.word 0xf0f384a0  ! 542: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb5a00540  ! 543: FSQRTd	fsqrt	
iob_intr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_41), 16, 16)) -> intp(1, 0, 17)
	.word 0xb3641800  ! 546: MOVcc_R	<illegal instruction>
	.word 0xbba408a0  ! 550: FSUBs	fsubs	%f16, %f0, %f29
cpu_intr_1_41:
	setx	0x210303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a9c820  ! 555: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb9a00040  ! 559: FMOVd	fmovd	%f0, %f28
cpu_intr_1_42:
	setx	0x210007, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_24:
	mov	0x2a, %r14
	.word 0xfef38e40  ! 563: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbda44860  ! 564: FADDq	dis not found

iob_intr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_42), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb9a488e0  ! 575: FSUBq	dis not found

	.word 0xb3a98820  ! 576: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xb3ab0820  ! 578: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb9a5c9e0  ! 582: FDIVq	dis not found

	.word 0xbda9c820  ! 583: FMOVVS	fmovs	%fcc1, %f0, %f30
iob_intr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_43), 16, 16)) -> intp(1, 0, 3c)
	.word 0xbba80420  ! 591: FMOVRZ	dis not found

	lda	[%r21 + %g0] 0xf0, %f2
cpu_intr_1_43:
	setx	0x220314, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_13:
	mov	0x3, %r14
	.word 0xf8db89e0  ! 599: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_1_44:
	setx	0x23031a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_45:
	setx	0x200334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3d1000  ! 603: SRAX_R	srax	%r20, %r0, %r29
iob_intr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_44), 16, 16)) -> intp(1, 0, f)
cpu_intr_1_46:
	setx	0x20030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00540  ! 608: FSQRTd	fsqrt	
	.word 0xb5a409a0  ! 610: FDIVs	fdivs	%f16, %f0, %f26
	.word 0xb5a44940  ! 611: FMULd	fmuld	%f48, %f0, %f26
	.word 0xb9a90820  ! 612: FMOVLEU	fmovs	%fcc1, %f0, %f28
iob_intr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_45), 16, 16)) -> intp(1, 0, 38)
iob_intr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_46), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_47:
	setx	0x210323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81420  ! 623: FMOVRNZ	dis not found

T1_asi_reg_wr_25:
	mov	0x2, %r14
	.word 0xfef389e0  ! 624: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_47), 16, 16)) -> intp(1, 0, a)
	.word 0xbf346001  ! 629: SRL_I	srl 	%r17, 0x0001, %r31
T1_asi_reg_rd_14:
	mov	0x37, %r14
	.word 0xf8db84a0  ! 630: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_1_48:
	setx	0x21001f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_26:
	mov	0x3c4, %r14
	.word 0xf0f38e80  ! 632: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb3a8c820  ! 635: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb1a81820  ! 638: FMOVRGZ	fmovs	%fcc3, %f0, %f24
cpu_intr_1_49:
	setx	0x210024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc2d20d8  ! 647: ANDN_I	andn 	%r20, 0x00d8, %r30
cpu_intr_1_50:
	setx	0x21012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3aa8820  ! 658: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xb9a44960  ! 659: FMULq	dis not found

T1_asi_reg_wr_27:
	mov	0x3c4, %r14
	.word 0xfcf38e60  ! 672: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_48), 16, 16)) -> intp(1, 0, 1c)
iob_intr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_49), 16, 16)) -> intp(1, 0, 15)
T1_asi_reg_rd_15:
	mov	0x22, %r14
	.word 0xfcdb8400  ! 676: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_1_51:
	setx	0x200014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa9c820  ! 682: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xb9a488c0  ! 686: FSUBd	fsubd	%f18, %f0, %f28
T1_asi_reg_wr_28:
	mov	0x1f, %r14
	.word 0xf0f38e60  ! 690: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb5a00540  ! 692: FSQRTd	fsqrt	
	.word 0xb88d603a  ! 695: ANDcc_I	andcc 	%r21, 0x003a, %r28
	.word 0xb3a00560  ! 699: FSQRTq	fsqrt	
	.word 0xbfaa8820  ! 703: FMOVG	fmovs	%fcc1, %f0, %f31
cpu_intr_1_52:
	setx	0x220122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda548e0  ! 707: FSUBq	dis not found

T1_asi_reg_rd_16:
	mov	0xf, %r14
	.word 0xfadb8e60  ! 711: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb9a50840  ! 714: FADDd	faddd	%f20, %f0, %f28
iob_intr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_50), 16, 16)) -> intp(1, 0, 7)
iob_intr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_51), 16, 16)) -> intp(1, 0, 2)
	.word 0xb3a58960  ! 718: FMULq	dis not found

iob_intr_1_52:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_52), 16, 16)) -> intp(1, 0, 1c)
T1_asi_reg_wr_29:
	mov	0x3c1, %r14
	.word 0xf2f389e0  ! 721: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbc8de100  ! 722: ANDcc_I	andcc 	%r23, 0x0100, %r30
	.word 0xbe0520ac  ! 723: ADD_I	add 	%r20, 0x00ac, %r31
cpu_intr_1_53:
	setx	0x210020, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_54:
	setx	0x20013c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_53:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_53), 16, 16)) -> intp(1, 0, f)
	.word 0xb1a50920  ! 736: FMULs	fmuls	%f20, %f0, %f24
	.word 0xbda84820  ! 739: FMOVE	fmovs	%fcc1, %f0, %f30
cpu_intr_1_55:
	setx	0x20003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb245c000  ! 741: ADDC_R	addc 	%r23, %r0, %r25
iob_intr_1_54:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_54), 16, 16)) -> intp(1, 0, 27)
iob_intr_1_55:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_55), 16, 16)) -> intp(1, 0, 3)
	.word 0xb7504000  ! 744: RDPR_TNPC	<illegal instruction>
	.word 0xb8b40000  ! 747: ORNcc_R	orncc 	%r16, %r0, %r28
cpu_intr_1_56:
	setx	0x220032, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_57:
	setx	0x21001b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_17:
	mov	0x3c3, %r14
	.word 0xf2db89e0  ! 752: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbfa00020  ! 753: FMOVs	fmovs	%f0, %f31
	.word 0xbcc5a063  ! 755: ADDCcc_I	addccc 	%r22, 0x0063, %r30
cpu_intr_1_58:
	setx	0x210320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda588c0  ! 757: FSUBd	fsubd	%f22, %f0, %f30
	.word 0xb9a54920  ! 761: FMULs	fmuls	%f21, %f0, %f28
	.word 0xb3a5c8c0  ! 763: FSUBd	fsubd	%f54, %f0, %f56
T1_asi_reg_wr_30:
	mov	0x2a, %r14
	.word 0xf6f38400  ! 765: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb9a81c20  ! 766: FMOVRGEZ	dis not found

T1_asi_reg_wr_31:
	mov	0x10, %r14
	.word 0xf2f38400  ! 767: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbfa00540  ! 770: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_59:
	setx	0x20022a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_32:
	mov	0x14, %r14
	.word 0xfaf38e60  ! 777: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_1_60:
	setx	0x210028, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_18:
	mov	0x3c3, %r14
	.word 0xf8db8400  ! 782: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbfa408c0  ! 783: FSUBd	fsubd	%f16, %f0, %f62
	.word 0xbc3ca0e5  ! 784: XNOR_I	xnor 	%r18, 0x00e5, %r30
	.word 0xb4bce094  ! 787: XNORcc_I	xnorcc 	%r19, 0x0094, %r26
cpu_intr_1_61:
	setx	0x23013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a81c20  ! 790: FMOVRGEZ	dis not found

cpu_intr_1_62:
	setx	0x21013c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_63:
	setx	0x23013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aa4820  ! 796: FMOVNE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_33:
	mov	0x26, %r14
	.word 0xf2f389e0  ! 798: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0x8f902000  ! 801: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xb9a4c9c0  ! 802: FDIVd	fdivd	%f50, %f0, %f28
	.word 0xbd7de401  ! 806: MOVR_I	movre	%r23, 0x1, %r30
cpu_intr_1_64:
	setx	0x20013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9194a18b  ! 814: WRPR_PIL_I	wrpr	%r18, 0x018b, %pil
iob_intr_1_56:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_56), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_65:
	setx	0x21022e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_66:
	setx	0x21033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3643801  ! 820: MOVcc_I	<illegal instruction>
	.word 0xb3a00540  ! 823: FSQRTd	fsqrt	
iob_intr_1_57:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_57), 16, 16)) -> intp(1, 0, 0)
cpu_intr_1_67:
	setx	0x23020f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_34:
	mov	0x7, %r14
	.word 0xfaf38400  ! 827: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_1_68:
	setx	0x200323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a58820  ! 830: FADDs	fadds	%f22, %f0, %f25
	.word 0xbba94820  ! 831: FMOVCS	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbda40820  ! 838: FADDs	fadds	%f16, %f0, %f30
T1_asi_reg_rd_19:
	mov	0x3c2, %r14
	.word 0xf4db8e60  ! 840: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_1_58:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_58), 16, 16)) -> intp(1, 0, 35)
iob_intr_1_59:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_59), 16, 16)) -> intp(1, 0, 27)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_60:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_60), 16, 16)) -> intp(1, 0, 3)
	.word 0xb2844000  ! 845: ADDcc_R	addcc 	%r17, %r0, %r25
cpu_intr_1_69:
	setx	0x230101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3dd000  ! 852: SRAX_R	srax	%r23, %r0, %r31
T1_asi_reg_rd_20:
	mov	0x1c, %r14
	.word 0xfadb8e80  ! 853: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb00ca059  ! 856: AND_I	and 	%r18, 0x0059, %r24
	.word 0xbba5c860  ! 857: FADDq	dis not found

iob_intr_1_61:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_61), 16, 16)) -> intp(1, 0, 15)
T1_asi_reg_wr_35:
	mov	0x23, %r14
	.word 0xf8f38e40  ! 859: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb1a489a0  ! 860: FDIVs	fdivs	%f18, %f0, %f24
iob_intr_1_62:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_62), 16, 16)) -> intp(1, 0, 8)
	.word 0xbba00020  ! 864: FMOVs	fmovs	%f0, %f29
T1_asi_reg_wr_36:
	mov	0x10, %r14
	.word 0xfcf38e40  ! 868: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_1_70:
	setx	0x230129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_71:
	setx	0x200134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda40940  ! 871: FMULd	fmuld	%f16, %f0, %f30
iob_intr_1_63:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_63), 16, 16)) -> intp(1, 0, 13)
cpu_intr_1_72:
	setx	0x210102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb92cc000  ! 882: SLL_R	sll 	%r19, %r0, %r28
T1_asi_reg_wr_37:
	mov	0x38, %r14
	.word 0xf8f38e40  ! 883: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_rd_21:
	mov	0x17, %r14
	.word 0xfadb8e60  ! 884: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb7a4c820  ! 893: FADDs	fadds	%f19, %f0, %f27
	.word 0xb3a81820  ! 895: FMOVRGZ	fmovs	%fcc3, %f0, %f25
cpu_intr_1_73:
	setx	0x21010e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_64:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_64), 16, 16)) -> intp(1, 0, 1c)
cpu_intr_1_74:
	setx	0x200138, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_38:
	mov	0x1a, %r14
	.word 0xf0f38400  ! 900: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbf7c4400  ! 901: MOVR_R	movre	%r17, %r0, %r31
iob_intr_1_65:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_65), 16, 16)) -> intp(1, 0, f)
T1_asi_reg_wr_39:
	mov	0x16, %r14
	.word 0xf0f384a0  ! 904: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T1_asi_reg_wr_40:
	mov	0x15, %r14
	.word 0xf0f38400  ! 907: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb7a54960  ! 908: FMULq	dis not found

	.word 0xbeb521d5  ! 911: SUBCcc_I	orncc 	%r20, 0x01d5, %r31
	.word 0xb1a00540  ! 913: FSQRTd	fsqrt	
iob_intr_1_66:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_66), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_wr_41:
	mov	0x4, %r14
	.word 0xf8f38e40  ! 917: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_75:
	setx	0x210003, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_76:
	setx	0x220015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1ab0820  ! 922: FMOVGU	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_42:
	mov	0x3c6, %r14
	.word 0xfef38e80  ! 923: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb1a80420  ! 924: FMOVRZ	dis not found

T1_asi_reg_rd_22:
	mov	0x3c3, %r14
	.word 0xfcdb8e80  ! 925: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb1a00560  ! 926: FSQRTq	fsqrt	
	.word 0xb2450000  ! 928: ADDC_R	addc 	%r20, %r0, %r25
	.word 0xbbaa4820  ! 929: FMOVNE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_43:
	mov	0x3c3, %r14
	.word 0xf8f384a0  ! 933: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb1a449e0  ! 935: FDIVq	dis not found

iob_intr_1_67:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_67), 16, 16)) -> intp(1, 0, b)
	.word 0xb9a548a0  ! 939: FSUBs	fsubs	%f21, %f0, %f28
T1_asi_reg_rd_23:
	mov	0x0, %r14
	.word 0xf8db84a0  ! 943: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb4940000  ! 944: ORcc_R	orcc 	%r16, %r0, %r26
T1_asi_reg_rd_24:
	mov	0x19, %r14
	.word 0xf8db8e40  ! 946: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_wr_44:
	mov	0x3c5, %r14
	.word 0xf6f38e40  ! 947: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb5abc820  ! 948: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xbfa548e0  ! 949: FSUBq	dis not found

	.word 0xb1a80c20  ! 950: FMOVRLZ	dis not found

iob_intr_1_68:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_68), 16, 16)) -> intp(1, 0, 2e)
iob_intr_1_69:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_69), 16, 16)) -> intp(1, 0, 0)
T1_asi_reg_wr_45:
	mov	0x3c6, %r14
	.word 0xfcf38e80  ! 955: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_1_77:
	setx	0x250208, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_70:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_70), 16, 16)) -> intp(1, 0, 29)
	.word 0xbba448e0  ! 959: FSUBq	dis not found

	.word 0xb7a00560  ! 961: FSQRTq	fsqrt	
T1_asi_reg_rd_25:
	mov	0x18, %r14
	.word 0xf2db8e40  ! 962: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbda80420  ! 965: FMOVRZ	dis not found

iob_intr_1_71:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_71), 16, 16)) -> intp(1, 0, a)
	.word 0xb9a448e0  ! 973: FSUBq	dis not found

T1_asi_reg_rd_26:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 976: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbfa00020  ! 981: FMOVs	fmovs	%f0, %f31
	.word 0xbfaac820  ! 985: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xbba00560  ! 988: FSQRTq	fsqrt	
	.word 0xbbab4820  ! 989: FMOVCC	fmovs	%fcc1, %f0, %f29
iob_intr_1_72:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_72), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbda408e0  ! 994: FSUBq	dis not found

T1_asi_reg_rd_27:
	mov	0x3c1, %r14
	.word 0xf6db8e80  ! 995: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T1_asi_reg_rd_28:
	mov	0x33, %r14
	.word 0xf4db84a0  ! 996: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_1_78:
	setx	0x270234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb97d2401  ! 998: MOVR_I	movre	%r20, 0x1, %r28
	.word 0xb7a00560  ! 1000: FSQRTq	fsqrt	
iob_intr_1_73:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_73), 16, 16)) -> intp(1, 0, 0)
iob_intr_1_74:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_74), 16, 16)) -> intp(1, 0, 12)
	.word 0xb7a40920  ! 1003: FMULs	fmuls	%f16, %f0, %f27
	.word 0xb7a40920  ! 1007: FMULs	fmuls	%f16, %f0, %f27
iob_intr_1_75:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_75), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_79:
	setx	0x25021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe154000  ! 1011: OR_R	or 	%r21, %r0, %r31
T1_asi_reg_rd_29:
	mov	0x16, %r14
	.word 0xfcdb84a0  ! 1012: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb5a81420  ! 1013: FMOVRNZ	dis not found

T1_asi_reg_wr_46:
	mov	0x3, %r14
	.word 0xfaf389e0  ! 1016: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_1_80:
	setx	0x270306, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_76:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_76), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb7a409a0  ! 1025: FDIVs	fdivs	%f16, %f0, %f27
cpu_intr_1_81:
	setx	0x270312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab8820  ! 1031: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xbda4c8a0  ! 1032: FSUBs	fsubs	%f19, %f0, %f30
	.word 0xb7ab4820  ! 1034: FMOVCC	fmovs	%fcc1, %f0, %f27
iob_intr_1_77:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_77), 16, 16)) -> intp(1, 0, 5)
iob_intr_1_78:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_78), 16, 16)) -> intp(1, 0, 3c)
cpu_intr_1_82:
	setx	0x250129, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb72cb001  ! 1045: SLLX_I	sllx	%r18, 0x0001, %r27
	.word 0xb5a448c0  ! 1046: FSUBd	fsubd	%f48, %f0, %f26
	.word 0xb3abc820  ! 1048: FMOVVC	fmovs	%fcc1, %f0, %f25
cpu_intr_1_83:
	setx	0x260107, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_79:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_79), 16, 16)) -> intp(1, 0, 28)
	.word 0xb1a00020  ! 1054: FMOVs	fmovs	%f0, %f24
iob_intr_1_80:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_80), 16, 16)) -> intp(1, 0, 31)
T1_asi_reg_rd_30:
	mov	0x3c1, %r14
	.word 0xfadb84a0  ! 1059: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T1_asi_reg_rd_31:
	mov	0xe, %r14
	.word 0xfedb84a0  ! 1060: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_1_81:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_81), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_wr_47:
	mov	0x3c6, %r14
	.word 0xfaf38e60  ! 1063: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T1_asi_reg_wr_48:
	mov	0x3c1, %r14
	.word 0xfcf38e40  ! 1064: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb7ab8820  ! 1067: FMOVPOS	fmovs	%fcc1, %f0, %f27
iob_intr_1_82:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_82), 16, 16)) -> intp(1, 0, 33)
	.word 0xb895a196  ! 1069: ORcc_I	orcc 	%r22, 0x0196, %r28
	.word 0xb5a80820  ! 1070: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb3a509c0  ! 1071: FDIVd	fdivd	%f20, %f0, %f56
iob_intr_1_83:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_83), 16, 16)) -> intp(1, 0, 2c)
iob_intr_1_84:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_84), 16, 16)) -> intp(1, 0, 24)
	.word 0xbcbc4000  ! 1079: XNORcc_R	xnorcc 	%r17, %r0, %r30
cpu_intr_1_84:
	setx	0x270229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00540  ! 1082: FSQRTd	fsqrt	
T1_asi_reg_wr_49:
	mov	0x2c, %r14
	.word 0xf6f38e40  ! 1085: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbc352107  ! 1086: ORN_I	orn 	%r20, 0x0107, %r30
iob_intr_1_85:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_85), 16, 16)) -> intp(1, 0, 32)
	.word 0xbda4c9e0  ! 1090: FDIVq	dis not found

	.word 0xbfa44960  ! 1091: FMULq	dis not found

	.word 0xb7a448c0  ! 1092: FSUBd	fsubd	%f48, %f0, %f58
T1_asi_reg_wr_50:
	mov	0x6, %r14
	.word 0xfcf38e80  ! 1098: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbe9c4000  ! 1101: XORcc_R	xorcc 	%r17, %r0, %r31
	.word 0xb5aa0820  ! 1102: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xbba84820  ! 1107: FMOVE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_85:
	setx	0x270022, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_86:
	setx	0x240212, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_32:
	mov	0xd, %r14
	.word 0xfadb84a0  ! 1116: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_1_86:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_86), 16, 16)) -> intp(1, 0, 3c)
cpu_intr_1_87:
	setx	0x270134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda5c920  ! 1119: FMULs	fmuls	%f23, %f0, %f30
	.word 0xbda509e0  ! 1120: FDIVq	dis not found

	.word 0xbfaa0820  ! 1121: FMOVA	fmovs	%fcc1, %f0, %f31
iob_intr_1_87:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_87), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb5a9c820  ! 1127: FMOVVS	fmovs	%fcc1, %f0, %f26
iob_intr_1_88:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_88), 16, 16)) -> intp(1, 0, 15)
	.word 0xb5aa4820  ! 1130: FMOVNE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_33:
	mov	0x3c1, %r14
	.word 0xfcdb8e80  ! 1131: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb5a5c940  ! 1133: FMULd	fmuld	%f54, %f0, %f26
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xbba00040  ! 1137: FMOVd	fmovd	%f0, %f60
cpu_intr_1_88:
	setx	0x270012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80820  ! 1143: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_34:
	mov	0x3c1, %r14
	.word 0xfedb84a0  ! 1145: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_1_89:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_89), 16, 16)) -> intp(1, 0, 27)
	.word 0xbda00520  ! 1147: FSQRTs	fsqrt	
	.word 0xbfa4c940  ! 1149: FMULd	fmuld	%f50, %f0, %f62
iob_intr_1_90:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_90), 16, 16)) -> intp(1, 0, 36)
T1_asi_reg_wr_51:
	mov	0x14, %r14
	.word 0xf8f38e40  ! 1152: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb1a40920  ! 1153: FMULs	fmuls	%f16, %f0, %f24
	.word 0xb1a00020  ! 1154: FMOVs	fmovs	%f0, %f24
	.word 0xb9a88820  ! 1156: FMOVLE	fmovs	%fcc1, %f0, %f28
iob_intr_1_91:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_91), 16, 16)) -> intp(1, 0, 34)
	.word 0xb5abc820  ! 1166: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb1a80c20  ! 1168: FMOVRLZ	dis not found

	.word 0xbfa48920  ! 1172: FMULs	fmuls	%f18, %f0, %f31
	.word 0xbda50820  ! 1173: FADDs	fadds	%f20, %f0, %f30
	.word 0xb5a48940  ! 1177: FMULd	fmuld	%f18, %f0, %f26
	.word 0xbdaa8820  ! 1179: FMOVG	fmovs	%fcc1, %f0, %f30
cpu_intr_1_89:
	setx	0x26020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_92:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_92), 16, 16)) -> intp(1, 0, 21)
iob_intr_1_93:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_93), 16, 16)) -> intp(1, 0, 35)
cpu_intr_1_90:
	setx	0x250315, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_35:
	mov	0x27, %r14
	.word 0xf6db89e0  ! 1194: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T1_asi_reg_wr_52:
	mov	0x16, %r14
	.word 0xf4f389e0  ! 1197: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb7a98820  ! 1199: FMOVNEG	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_36:
	mov	0x35, %r14
	.word 0xfcdb84a0  ! 1200: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T1_asi_reg_wr_53:
	mov	0x3c1, %r14
	.word 0xf8f38e80  ! 1201: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_1_94:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_94), 16, 16)) -> intp(1, 0, e)
T1_asi_reg_wr_54:
	mov	0x22, %r14
	.word 0xf6f38e40  ! 1206: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_rd_37:
	mov	0x3c2, %r14
	.word 0xf6db8e80  ! 1207: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb4b4a196  ! 1209: SUBCcc_I	orncc 	%r18, 0x0196, %r26
T1_asi_reg_wr_55:
	mov	0x3c1, %r14
	.word 0xf0f38e60  ! 1210: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_91:
	setx	0x260119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a5c9c0  ! 1222: FDIVd	fdivd	%f54, %f0, %f56
	.word 0xbfa00560  ! 1224: FSQRTq	fsqrt	
	.word 0xbda80c20  ! 1226: FMOVRLZ	dis not found

cpu_intr_1_92:
	setx	0x240320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcc44000  ! 1228: ADDCcc_R	addccc 	%r17, %r0, %r30
	.word 0xb1a8c820  ! 1231: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xbfa80c20  ! 1234: FMOVRLZ	dis not found

	.word 0xb7a00540  ! 1235: FSQRTd	fsqrt	
iob_intr_1_95:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_95), 16, 16)) -> intp(1, 0, 13)
cpu_intr_1_93:
	setx	0x240307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc1d8000  ! 1239: XOR_R	xor 	%r22, %r0, %r30
T1_asi_reg_wr_56:
	mov	0x3c7, %r14
	.word 0xf0f389e0  ! 1243: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_1_94:
	setx	0x25033b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_96:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_96), 16, 16)) -> intp(1, 0, 2a)
cpu_intr_1_95:
	setx	0x260220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a9c820  ! 1253: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb1a00020  ! 1255: FMOVs	fmovs	%f0, %f24
T1_asi_reg_wr_57:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 1257: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbba80c20  ! 1258: FMOVRLZ	dis not found

	.word 0xb7a80c20  ! 1264: FMOVRLZ	dis not found

iob_intr_1_97:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_97), 16, 16)) -> intp(1, 0, f)
	.word 0xbba408a0  ! 1267: FSUBs	fsubs	%f16, %f0, %f29
	.word 0xb3a81420  ! 1276: FMOVRNZ	dis not found

cpu_intr_1_96:
	setx	0x270130, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_98:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_98), 16, 16)) -> intp(1, 0, 22)
cpu_intr_1_97:
	setx	0x26020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00040  ! 1284: FMOVd	fmovd	%f0, %f26
	.word 0x8794a168  ! 1285: WRPR_TT_I	wrpr	%r18, 0x0168, %tt
T1_asi_reg_wr_58:
	mov	0x30, %r14
	.word 0xf4f38e60  ! 1290: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_1_99:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_99), 16, 16)) -> intp(1, 0, 20)
iob_intr_1_100:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_100), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb3a54860  ! 1294: FADDq	dis not found

cpu_intr_1_98:
	setx	0x270210, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7a00520  ! 1298: FSQRTs	fsqrt	
	.word 0xb5a94820  ! 1301: FMOVCS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_38:
	mov	0x2c, %r14
	.word 0xf6db8400  ! 1302: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbfab4820  ! 1306: FMOVCC	fmovs	%fcc1, %f0, %f31
iob_intr_1_101:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_101), 16, 16)) -> intp(1, 0, 18)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_99:
	setx	0x260320, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_102:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_102), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb5a81820  ! 1318: FMOVRGZ	fmovs	%fcc3, %f0, %f26
T1_asi_reg_wr_59:
	mov	0x3c8, %r14
	.word 0xf2f38e80  ! 1322: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb5a94820  ! 1323: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb1a00520  ! 1326: FSQRTs	fsqrt	
iob_intr_1_103:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_103), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb9a44960  ! 1331: FMULq	dis not found

cpu_intr_1_100:
	setx	0x240019, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_39:
	mov	0xb, %r14
	.word 0xf2db8e60  ! 1333: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_1_101:
	setx	0x250015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c840  ! 1336: FADDd	faddd	%f50, %f0, %f56
cpu_intr_1_102:
	setx	0x240035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a94820  ! 1338: FMOVCS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_40:
	mov	0x13, %r14
	.word 0xf8db8e60  ! 1340: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_1_104:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_104), 16, 16)) -> intp(1, 0, c)
	.word 0xb9ab8820  ! 1349: FMOVPOS	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_60:
	mov	0x3c8, %r14
	.word 0xf6f38e40  ! 1350: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_rd_41:
	mov	0xf, %r14
	.word 0xfcdb89e0  ! 1351: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb7a90820  ! 1353: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xbab50000  ! 1357: SUBCcc_R	orncc 	%r20, %r0, %r29
iob_intr_1_105:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_105), 16, 16)) -> intp(1, 0, f)
cpu_intr_1_103:
	setx	0x25021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda58820  ! 1362: FADDs	fadds	%f22, %f0, %f30
	.word 0xb9a94820  ! 1363: FMOVCS	fmovs	%fcc1, %f0, %f28
iob_intr_1_106:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_106), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_rd_42:
	mov	0x2, %r14
	.word 0xf2db8e40  ! 1366: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_1_104:
	setx	0x260335, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_61:
	mov	0x2b, %r14
	.word 0xfef38e40  ! 1372: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb7a00520  ! 1374: FSQRTs	fsqrt	
T1_asi_reg_rd_43:
	mov	0x3c6, %r14
	.word 0xf4db8e80  ! 1377: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_1_107:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_107), 16, 16)) -> intp(1, 0, 10)
T1_asi_reg_wr_62:
	mov	0x22, %r14
	.word 0xfef38400  ! 1385: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T1_asi_reg_rd_44:
	mov	0x3c2, %r14
	.word 0xf0db84a0  ! 1386: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbda40960  ! 1394: FMULq	dis not found

iob_intr_1_108:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_108), 16, 16)) -> intp(1, 0, 5)
T1_asi_reg_rd_45:
	mov	0x1a, %r14
	.word 0xfadb8e40  ! 1397: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_109:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_109), 16, 16)) -> intp(1, 0, 21)
T1_asi_reg_rd_46:
	mov	0x1a, %r14
	.word 0xf8db8e40  ! 1401: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb1a40960  ! 1403: FMULq	dis not found

iob_intr_1_110:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_110), 16, 16)) -> intp(1, 0, 23)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a84820  ! 1410: FMOVE	fmovs	%fcc1, %f0, %f28
cpu_intr_1_105:
	setx	0x2a0326, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_106:
	setx	0x2a0110, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_47:
	mov	0x3c8, %r14
	.word 0xf6db8e80  ! 1413: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_1_107:
	setx	0x2a0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80820  ! 1422: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb8858000  ! 1423: ADDcc_R	addcc 	%r22, %r0, %r28
cpu_intr_1_108:
	setx	0x2b011f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_111:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_111), 16, 16)) -> intp(1, 0, 26)
T1_asi_reg_rd_48:
	mov	0xe, %r14
	.word 0xfcdb8e60  ! 1431: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbfa5c940  ! 1436: FMULd	fmuld	%f54, %f0, %f62
	.word 0xb1a489c0  ! 1437: FDIVd	fdivd	%f18, %f0, %f24
	.word 0xb3a54860  ! 1446: FADDq	dis not found

	.word 0xb5a4c8c0  ! 1447: FSUBd	fsubd	%f50, %f0, %f26
	.word 0xb3a8c820  ! 1452: FMOVL	fmovs	%fcc1, %f0, %f25
cpu_intr_1_109:
	setx	0x29023e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_112:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_112), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_113:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_113), 16, 16)) -> intp(1, 0, 3)
T1_asi_reg_wr_63:
	mov	0xf, %r14
	.word 0xf8f38400  ! 1459: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T1_asi_reg_wr_64:
	mov	0xb, %r14
	.word 0xfcf38400  ! 1461: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb7a98820  ! 1462: FMOVNEG	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_49:
	mov	0x24, %r14
	.word 0xf8db89e0  ! 1463: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_1_110:
	setx	0x2a0038, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_111:
	setx	0x290018, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_112:
	setx	0x2b033d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_113:
	setx	0x2b0210, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_114:
	setx	0x2b0034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb804a03f  ! 1475: ADD_I	add 	%r18, 0x003f, %r28
	.word 0xbba80820  ! 1476: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
iob_intr_1_114:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_114), 16, 16)) -> intp(1, 0, 38)
cpu_intr_1_115:
	setx	0x28030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a40940  ! 1484: FMULd	fmuld	%f16, %f0, %f58
	.word 0xb00c214f  ! 1485: AND_I	and 	%r16, 0x014f, %r24
	.word 0xb3abc820  ! 1488: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb3a81420  ! 1493: FMOVRNZ	dis not found

	.word 0xb7a409a0  ! 1500: FDIVs	fdivs	%f16, %f0, %f27
cpu_intr_1_116:
	setx	0x2b0014, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_115:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_115), 16, 16)) -> intp(1, 0, 2b)
	.word 0xbfa548e0  ! 1508: FSUBq	dis not found

T1_asi_reg_wr_65:
	mov	0x19, %r14
	.word 0xfcf38e40  ! 1509: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T1_asi_reg_wr_66:
	mov	0x27, %r14
	.word 0xf0f384a0  ! 1511: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_1_116:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_116), 16, 16)) -> intp(1, 0, 28)
	.word 0xb1a449c0  ! 1514: FDIVd	fdivd	%f48, %f0, %f24
cpu_intr_1_117:
	setx	0x280237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a408a0  ! 1518: FSUBs	fsubs	%f16, %f0, %f24
cpu_intr_1_118:
	setx	0x2a0311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba508e0  ! 1522: FSUBq	dis not found

T1_asi_reg_rd_50:
	mov	0x3c1, %r14
	.word 0xf8db8e80  ! 1524: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbda81420  ! 1526: FMOVRNZ	dis not found

cpu_intr_1_119:
	setx	0x290331, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_51:
	mov	0x0, %r14
	.word 0xf8db8e60  ! 1535: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_1_120:
	setx	0x2a0103, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_67:
	mov	0x7, %r14
	.word 0xfaf38e40  ! 1537: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbba5c940  ! 1538: FMULd	fmuld	%f54, %f0, %f60
	.word 0xb1a48820  ! 1542: FADDs	fadds	%f18, %f0, %f24
	.word 0xb1a80c20  ! 1544: FMOVRLZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9a80820  ! 1547: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_52:
	mov	0x4, %r14
	.word 0xf4db84a0  ! 1549: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_1_121:
	setx	0x2b0119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_122:
	setx	0x2a022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00520  ! 1555: FSQRTs	fsqrt	
iob_intr_1_117:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_117), 16, 16)) -> intp(1, 0, 21)
	.word 0xbda4c920  ! 1561: FMULs	fmuls	%f19, %f0, %f30
	.word 0xb7643801  ! 1563: MOVcc_I	<illegal instruction>
iob_intr_1_118:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_118), 16, 16)) -> intp(1, 0, 32)
T1_asi_reg_wr_68:
	mov	0x2d, %r14
	.word 0xfaf384a0  ! 1567: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_1_119:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_119), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_rd_53:
	mov	0x19, %r14
	.word 0xf0db8e60  ! 1569: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_1_123:
	setx	0x29011b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_54:
	mov	0x27, %r14
	.word 0xf4db89e0  ! 1571: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T1_asi_reg_wr_69:
	mov	0x3c3, %r14
	.word 0xfcf38400  ! 1572: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_1_124:
	setx	0x290138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00040  ! 1575: FMOVd	fmovd	%f0, %f30
	.word 0xb5ab8820  ! 1576: FMOVPOS	fmovs	%fcc1, %f0, %f26
iob_intr_1_120:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_120), 16, 16)) -> intp(1, 0, 18)
cpu_intr_1_125:
	setx	0x2a003d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_55:
	mov	0x1, %r14
	.word 0xfedb8e80  ! 1585: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xbba4c9a0  ! 1586: FDIVs	fdivs	%f19, %f0, %f29
	.word 0xbfaac820  ! 1589: FMOVGE	fmovs	%fcc1, %f0, %f31
iob_intr_1_121:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_121), 16, 16)) -> intp(1, 0, 36)
	.word 0xbda80820  ! 1591: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb5a00520  ! 1592: FSQRTs	fsqrt	
T1_asi_reg_wr_70:
	mov	0x2c, %r14
	.word 0xf0f389e0  ! 1595: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T1_asi_reg_rd_56:
	mov	0x3c2, %r14
	.word 0xfedb8e40  ! 1596: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_126:
	setx	0x2b0019, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_122:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_122), 16, 16)) -> intp(1, 0, 38)
iob_intr_1_123:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_123), 16, 16)) -> intp(1, 0, 34)
	.word 0xbfa80420  ! 1607: FMOVRZ	dis not found

	.word 0xb9a80c20  ! 1609: FMOVRLZ	dis not found

	.word 0xb5aa0820  ! 1614: FMOVA	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfa90820  ! 1616: FMOVLEU	fmovs	%fcc1, %f0, %f31
iob_intr_1_124:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_124), 16, 16)) -> intp(1, 0, 3c)
	.word 0xbfa40940  ! 1618: FMULd	fmuld	%f16, %f0, %f62
T1_asi_reg_wr_71:
	mov	0x3c4, %r14
	.word 0xfcf389e0  ! 1626: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb1abc820  ! 1627: FMOVVC	fmovs	%fcc1, %f0, %f24
cpu_intr_1_127:
	setx	0x2a0216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a90820  ! 1629: FMOVLEU	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_57:
	mov	0x3c2, %r14
	.word 0xf0db8400  ! 1637: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_1_128:
	setx	0x2a0114, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_72:
	mov	0x3c3, %r14
	.word 0xfaf389e0  ! 1641: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_1_129:
	setx	0x2b0129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_130:
	setx	0x29012d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_131:
	setx	0x29032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a94820  ! 1647: FMOVCS	fmovs	%fcc1, %f0, %f26
cpu_intr_1_132:
	setx	0x2a0339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba488c0  ! 1649: FSUBd	fsubd	%f18, %f0, %f60
	.word 0xbda40960  ! 1652: FMULq	dis not found

	.word 0xbfa80c20  ! 1655: FMOVRLZ	dis not found

cpu_intr_1_133:
	setx	0x290236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aa4820  ! 1658: FMOVNE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_58:
	mov	0x20, %r14
	.word 0xf6db89e0  ! 1659: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xbba4c9e0  ! 1662: FDIVq	dis not found

cpu_intr_1_134:
	setx	0x2b0207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaa4820  ! 1665: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xb8c54000  ! 1666: ADDCcc_R	addccc 	%r21, %r0, %r28
T1_asi_reg_wr_73:
	mov	0x3c2, %r14
	.word 0xf6f384a0  ! 1667: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_1_125:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_125), 16, 16)) -> intp(1, 0, 1a)
cpu_intr_1_135:
	setx	0x2b0104, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_59:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 1672: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb9a00520  ! 1673: FSQRTs	fsqrt	
cpu_intr_1_136:
	setx	0x2b0314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80c20  ! 1677: FMOVRLZ	dis not found

iob_intr_1_126:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_126), 16, 16)) -> intp(1, 0, 21)
	.word 0xb750c000  ! 1679: RDPR_TT	<illegal instruction>
T1_asi_reg_rd_60:
	mov	0x2c, %r14
	.word 0xf2db8400  ! 1680: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_1_127:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_127), 16, 16)) -> intp(1, 0, 16)
	.word 0xbba81820  ! 1685: FMOVRGZ	fmovs	%fcc3, %f0, %f29
cpu_intr_1_137:
	setx	0x2b013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a4c860  ! 1690: FADDq	dis not found

iob_intr_1_128:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_128), 16, 16)) -> intp(1, 0, 22)
T1_asi_reg_wr_74:
	mov	0x3c1, %r14
	.word 0xf4f389e0  ! 1694: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_1_129:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_129), 16, 16)) -> intp(1, 0, 3b)
cpu_intr_1_138:
	setx	0x2b0002, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_139:
	setx	0x28021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba358000  ! 1711: ORN_R	orn 	%r22, %r0, %r29
T1_asi_reg_wr_75:
	mov	0xc, %r14
	.word 0xf6f384a0  ! 1722: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_1_140:
	setx	0x2b0113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb49c0000  ! 1727: XORcc_R	xorcc 	%r16, %r0, %r26
	.word 0xb3a50820  ! 1732: FADDs	fadds	%f20, %f0, %f25
	.word 0xb5a81820  ! 1733: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb5a80820  ! 1736: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xb9a44820  ! 1737: FADDs	fadds	%f17, %f0, %f28
cpu_intr_1_141:
	setx	0x28032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa81820  ! 1739: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb9ab0820  ! 1740: FMOVGU	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_61:
	mov	0x3c3, %r14
	.word 0xfadb8e60  ! 1741: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T1_asi_reg_wr_76:
	mov	0x1, %r14
	.word 0xf8f38e40  ! 1742: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_wr_77:
	mov	0x17, %r14
	.word 0xf4f38e40  ! 1743: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_130:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_130), 16, 16)) -> intp(1, 0, 2)
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xbda00520  ! 1753: FSQRTs	fsqrt	
iob_intr_1_131:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_131), 16, 16)) -> intp(1, 0, c)
	.word 0xb1a00520  ! 1760: FSQRTs	fsqrt	
	.word 0xb3a408c0  ! 1763: FSUBd	fsubd	%f16, %f0, %f56
	.word 0xb5a80820  ! 1766: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
cpu_intr_1_142:
	setx	0x280337, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_132:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_132), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_143:
	setx	0x290338, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_62:
	mov	0x33, %r14
	.word 0xfadb8e80  ! 1775: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_1_133:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_133), 16, 16)) -> intp(1, 0, 16)
	.word 0xb5a4c940  ! 1778: FMULd	fmuld	%f50, %f0, %f26
T1_asi_reg_wr_78:
	mov	0x35, %r14
	.word 0xfaf38e40  ! 1784: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbba80820  ! 1785: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xb33dc000  ! 1788: SRA_R	sra 	%r23, %r0, %r25
	.word 0xbba00520  ! 1790: FSQRTs	fsqrt	
	.word 0xb5a448e0  ! 1791: FSUBq	dis not found

	.word 0xb3a00520  ! 1792: FSQRTs	fsqrt	
	.word 0xbb643801  ! 1798: MOVcc_I	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa8c820  ! 1804: FMOVL	fmovs	%fcc1, %f0, %f31
cpu_intr_1_144:
	setx	0x29033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_134:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_134), 16, 16)) -> intp(1, 0, 16)
	.word 0xb1a58820  ! 1811: FADDs	fadds	%f22, %f0, %f24
cpu_intr_1_145:
	setx	0x29021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_146:
	setx	0x280329, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_79:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 1817: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_rd_63:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 1818: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb7a448c0  ! 1822: FSUBd	fsubd	%f48, %f0, %f58
T1_asi_reg_rd_64:
	mov	0xd, %r14
	.word 0xfcdb8e40  ! 1823: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_147:
	setx	0x2b000d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_135:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_135), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb88ca175  ! 1828: ANDcc_I	andcc 	%r18, 0x0175, %r28
cpu_intr_1_148:
	setx	0x29001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a54820  ! 1830: FADDs	fadds	%f21, %f0, %f24
	.word 0xb5a488a0  ! 1831: FSUBs	fsubs	%f18, %f0, %f26
cpu_intr_1_149:
	setx	0x2b030d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_80:
	mov	0x23, %r14
	.word 0xfef38e40  ! 1833: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb5a00560  ! 1835: FSQRTq	fsqrt	
T1_asi_reg_rd_65:
	mov	0x3c7, %r14
	.word 0xf6db8400  ! 1837: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T1_asi_reg_wr_81:
	mov	0x3c7, %r14
	.word 0xfef38400  ! 1839: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T1_asi_reg_rd_66:
	mov	0x29, %r14
	.word 0xf8db89e0  ! 1841: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb7a4c9a0  ! 1843: FDIVs	fdivs	%f19, %f0, %f27
	.word 0xb93cb001  ! 1845: SRAX_I	srax	%r18, 0x0001, %r28
iob_intr_1_136:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_136), 16, 16)) -> intp(1, 0, 3a)
iob_intr_1_137:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_137), 16, 16)) -> intp(1, 0, 1b)
iob_intr_1_138:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_138), 16, 16)) -> intp(1, 0, 1a)
	.word 0xbba90820  ! 1851: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb3a00040  ! 1853: FMOVd	fmovd	%f0, %f56
	.word 0xbbabc820  ! 1854: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb20d0000  ! 1856: AND_R	and 	%r20, %r0, %r25
	.word 0xb1a549e0  ! 1859: FDIVq	dis not found

	.word 0xb4848000  ! 1862: ADDcc_R	addcc 	%r18, %r0, %r26
	.word 0xbda00020  ! 1864: FMOVs	fmovs	%f0, %f30
iob_intr_1_139:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_139), 16, 16)) -> intp(1, 0, 9)
	.word 0xb52d0000  ! 1866: SLL_R	sll 	%r20, %r0, %r26
	lda	[%r16 + %g0] 0xf0, %f2
T1_asi_reg_wr_82:
	mov	0x3c7, %r14
	.word 0xf6f384a0  ! 1875: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb7a00560  ! 1876: FSQRTq	fsqrt	
cpu_intr_1_150:
	setx	0x2c0107, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_151:
	setx	0x2e0318, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_140:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_140), 16, 16)) -> intp(1, 0, f)
iob_intr_1_141:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_141), 16, 16)) -> intp(1, 0, 2c)
T1_asi_reg_rd_67:
	mov	0x23, %r14
	.word 0xfadb8e60  ! 1885: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_1_142:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_142), 16, 16)) -> intp(1, 0, 15)
cpu_intr_1_152:
	setx	0x2c013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_68:
	mov	0x3, %r14
	.word 0xf4db84a0  ! 1891: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_1_143:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_143), 16, 16)) -> intp(1, 0, 3d)
iob_intr_1_144:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_144), 16, 16)) -> intp(1, 0, 15)
cpu_intr_1_153:
	setx	0x2c0110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7abc820  ! 1900: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xbbab0820  ! 1902: FMOVGU	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_69:
	mov	0x2a, %r14
	.word 0xf8db8e60  ! 1903: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xbba81420  ! 1908: FMOVRNZ	dis not found

	.word 0xbabde13d  ! 1912: XNORcc_I	xnorcc 	%r23, 0x013d, %r29
T1_asi_reg_rd_70:
	mov	0x3c4, %r14
	.word 0xfedb8400  ! 1914: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T1_asi_reg_wr_83:
	mov	0xf, %r14
	.word 0xf0f384a0  ! 1917: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb1a00040  ! 1918: FMOVd	fmovd	%f0, %f24
	.word 0xb7a408c0  ! 1919: FSUBd	fsubd	%f16, %f0, %f58
T1_asi_reg_rd_71:
	mov	0x3c3, %r14
	.word 0xfcdb8e60  ! 1920: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T1_asi_reg_wr_84:
	mov	0x8, %r14
	.word 0xfef38e80  ! 1923: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_1_145:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_145), 16, 16)) -> intp(1, 0, 9)
	.word 0xbdab8820  ! 1929: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb5a4c860  ! 1930: FADDq	dis not found

	.word 0xbbab0820  ! 1932: FMOVGU	fmovs	%fcc1, %f0, %f29
cpu_intr_1_154:
	setx	0x2d0302, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_155:
	setx	0x2d022f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_146:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_146), 16, 16)) -> intp(1, 0, 12)
iob_intr_1_147:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_147), 16, 16)) -> intp(1, 0, 0)
iob_intr_1_148:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_148), 16, 16)) -> intp(1, 0, 1)
cpu_intr_1_156:
	setx	0x2c0222, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_72:
	mov	0x1a, %r14
	.word 0xfadb8e40  ! 1948: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb3a88820  ! 1950: FMOVLE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_85:
	mov	0xd, %r14
	.word 0xfaf38e40  ! 1953: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_rd_73:
	mov	0x3c8, %r14
	.word 0xf0db89e0  ! 1954: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb9a40840  ! 1955: FADDd	faddd	%f16, %f0, %f28
	.word 0xb5a4c9e0  ! 1956: FDIVq	dis not found

	.word 0xb9a98820  ! 1957: FMOVNEG	fmovs	%fcc1, %f0, %f28
cpu_intr_1_157:
	setx	0x2d010b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_149:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_149), 16, 16)) -> intp(1, 0, 1)
	.word 0xb3a58860  ! 1961: FADDq	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_rd_74:
	mov	0x15, %r14
	.word 0xfadb8e80  ! 1963: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xbfa8c820  ! 1965: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb3a588a0  ! 1967: FSUBs	fsubs	%f22, %f0, %f25
T1_asi_reg_wr_86:
	mov	0x3c3, %r14
	.word 0xfaf389e0  ! 1968: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_1_158:
	setx	0x2f001d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_159:
	setx	0x2d0010, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_150:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_150), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb5a84820  ! 1981: FMOVE	fmovs	%fcc1, %f0, %f26
iob_intr_1_151:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_151), 16, 16)) -> intp(1, 0, 10)
	.word 0xb3a48960  ! 1986: FMULq	dis not found

	.word 0xbfab4820  ! 1987: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb9a5c9a0  ! 1989: FDIVs	fdivs	%f23, %f0, %f28
	.word 0xbfa4c9e0  ! 1990: FDIVq	dis not found

	.word 0xb5a88820  ! 1991: FMOVLE	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_wr_87:
	mov	0x3c3, %r14
	.word 0xf2f38e60  ! 1995: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xbcb46122  ! 1996: ORNcc_I	orncc 	%r17, 0x0122, %r30
cpu_intr_1_160:
	setx	0x2d011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda549e0  ! 2001: FDIVq	dis not found

cpu_intr_1_161:
	setx	0x2e000f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_88:
	mov	0x3c2, %r14
	.word 0xfaf38e60  ! 2005: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb8258000  ! 2006: SUB_R	sub 	%r22, %r0, %r28
iob_intr_1_152:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_152), 16, 16)) -> intp(1, 0, 34)
	.word 0xb4b54000  ! 2008: ORNcc_R	orncc 	%r21, %r0, %r26
T1_asi_reg_wr_89:
	mov	0x3c5, %r14
	.word 0xf0f38400  ! 2009: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb1a81820  ! 2010: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xb48ce082  ! 2011: ANDcc_I	andcc 	%r19, 0x0082, %r26
cpu_intr_1_162:
	setx	0x2f013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_90:
	mov	0xd, %r14
	.word 0xfcf38e40  ! 2014: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb9a00560  ! 2015: FSQRTq	fsqrt	
	.word 0xb1348000  ! 2017: SRL_R	srl 	%r18, %r0, %r24
iob_intr_1_153:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_153), 16, 16)) -> intp(1, 0, 22)
	.word 0xbfa98820  ! 2024: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xbba409c0  ! 2026: FDIVd	fdivd	%f16, %f0, %f60
T1_asi_reg_wr_91:
	mov	0x24, %r14
	.word 0xf8f38e60  ! 2027: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T1_asi_reg_rd_75:
	mov	0x23, %r14
	.word 0xf4db8e80  ! 2029: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T1_asi_reg_wr_92:
	mov	0x1e, %r14
	.word 0xf6f38400  ! 2030: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_1_163:
	setx	0x2c0208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6250000  ! 2034: SUB_R	sub 	%r20, %r0, %r27
T1_asi_reg_wr_93:
	mov	0x1e, %r14
	.word 0xf8f38e60  ! 2037: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_1_154:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_154), 16, 16)) -> intp(1, 0, 18)
cpu_intr_1_164:
	setx	0x2c0324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a549a0  ! 2043: FDIVs	fdivs	%f21, %f0, %f24
T1_asi_reg_wr_94:
	mov	0x1, %r14
	.word 0xf0f38e60  ! 2044: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb9a508c0  ! 2045: FSUBd	fsubd	%f20, %f0, %f28
iob_intr_1_155:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_155), 16, 16)) -> intp(1, 0, 18)
	.word 0xbda00560  ! 2049: FSQRTq	fsqrt	
	.word 0xb13d5000  ! 2053: SRAX_R	srax	%r21, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a44820  ! 2057: FADDs	fadds	%f17, %f0, %f27
	.word 0xb9a00560  ! 2058: FSQRTq	fsqrt	
	.word 0xb9a409a0  ! 2059: FDIVs	fdivs	%f16, %f0, %f28
iob_intr_1_156:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_156), 16, 16)) -> intp(1, 0, 5)
	.word 0xb1a00020  ! 2063: FMOVs	fmovs	%f0, %f24
	.word 0xb28d4000  ! 2064: ANDcc_R	andcc 	%r21, %r0, %r25
cpu_intr_1_165:
	setx	0x2c0301, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_166:
	setx	0x2c0325, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_76:
	mov	0x3c7, %r14
	.word 0xf0db8e40  ! 2067: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb3a00540  ! 2069: FSQRTd	fsqrt	
	.word 0xb444606b  ! 2071: ADDC_I	addc 	%r17, 0x006b, %r26
iob_intr_1_157:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_157), 16, 16)) -> intp(1, 0, 6)
	.word 0xb9aa0820  ! 2074: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xb03421e9  ! 2075: ORN_I	orn 	%r16, 0x01e9, %r24
cpu_intr_1_167:
	setx	0x2e0109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a5c820  ! 2080: FADDs	fadds	%f23, %f0, %f25
cpu_intr_1_168:
	setx	0x2f0220, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_169:
	setx	0x2e0136, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_170:
	setx	0x2d0014, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_77:
	mov	0x3c8, %r14
	.word 0xfcdb89e0  ! 2086: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_1_158:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_158), 16, 16)) -> intp(1, 0, 35)
T1_asi_reg_wr_95:
	mov	0x22, %r14
	.word 0xf8f38e60  ! 2089: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_1_159:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_159), 16, 16)) -> intp(1, 0, 34)
	.word 0xbd7d2401  ! 2091: MOVR_I	movre	%r20, 0x1, %r30
cpu_intr_1_171:
	setx	0x2f0031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba409a0  ! 2096: FDIVs	fdivs	%f16, %f0, %f29
cpu_intr_1_172:
	setx	0x2f0028, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_96:
	mov	0x3c8, %r14
	.word 0xf2f38400  ! 2105: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbba449a0  ! 2112: FDIVs	fdivs	%f17, %f0, %f29
T1_asi_reg_rd_78:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 2114: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_1_173:
	setx	0x2d032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a94820  ! 2117: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb1a48960  ! 2118: FMULq	dis not found

	.word 0xb1a5c940  ! 2119: FMULd	fmuld	%f54, %f0, %f24
	.word 0xb3a448e0  ! 2121: FSUBq	dis not found

	.word 0x859461ad  ! 2124: WRPR_TSTATE_I	wrpr	%r17, 0x01ad, %tstate
iob_intr_1_160:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_160), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb2b40000  ! 2126: SUBCcc_R	orncc 	%r16, %r0, %r25
T1_asi_reg_rd_79:
	mov	0x9, %r14
	.word 0xf8db8e40  ! 2129: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb3a81c20  ! 2130: FMOVRGEZ	dis not found

	.word 0xb635e16f  ! 2131: ORN_I	orn 	%r23, 0x016f, %r27
	.word 0xbe35613a  ! 2134: SUBC_I	orn 	%r21, 0x013a, %r31
	.word 0xb5a8c820  ! 2136: FMOVL	fmovs	%fcc1, %f0, %f26
iob_intr_1_161:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_161), 16, 16)) -> intp(1, 0, 32)
	.word 0xb9a00520  ! 2138: FSQRTs	fsqrt	
	.word 0xbcb4c000  ! 2139: SUBCcc_R	orncc 	%r19, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbd34c000  ! 2148: SRL_R	srl 	%r19, %r0, %r30
cpu_intr_1_174:
	setx	0x2d0322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a44820  ! 2153: FADDs	fadds	%f17, %f0, %f28
	.word 0xb5a9c820  ! 2154: FMOVVS	fmovs	%fcc1, %f0, %f26
iob_intr_1_162:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_162), 16, 16)) -> intp(1, 0, 33)
cpu_intr_1_175:
	setx	0x2e030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_97:
	mov	0x3c3, %r14
	.word 0xfcf38e80  ! 2159: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_1_163:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_163), 16, 16)) -> intp(1, 0, 38)
	.word 0xbba9c820  ! 2166: FMOVVS	fmovs	%fcc1, %f0, %f29
cpu_intr_1_176:
	setx	0x2d0315, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_177:
	setx	0x2c022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80420  ! 2171: FMOVRZ	dis not found

T1_asi_reg_rd_80:
	mov	0x9, %r14
	.word 0xf0db8e60  ! 2176: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T1_asi_reg_rd_81:
	mov	0x38, %r14
	.word 0xf0db8400  ! 2177: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_rd_82:
	mov	0x30, %r14
	.word 0xf6db8e60  ! 2178: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb1a9c820  ! 2179: FMOVVS	fmovs	%fcc1, %f0, %f24
cpu_intr_1_178:
	setx	0x2e0002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_164:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_164), 16, 16)) -> intp(1, 0, 25)
cpu_intr_1_179:
	setx	0x2f0017, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_98:
	mov	0x27, %r14
	.word 0xf0f38e40  ! 2188: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_1_180:
	setx	0x2d0329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda90820  ! 2191: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb5a00520  ! 2192: FSQRTs	fsqrt	
cpu_intr_1_181:
	setx	0x2c011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7aac820  ! 2197: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb3a50940  ! 2198: FMULd	fmuld	%f20, %f0, %f56
	.word 0xbba80420  ! 2200: FMOVRZ	dis not found

T1_asi_reg_rd_83:
	mov	0x20, %r14
	.word 0xfadb8e80  ! 2201: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a00560  ! 2205: FSQRTq	fsqrt	
iob_intr_1_165:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_165), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_wr_99:
	mov	0x26, %r14
	.word 0xfef38e80  ! 2209: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb1ab0820  ! 2211: FMOVGU	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_84:
	mov	0x1, %r14
	.word 0xf2db8400  ! 2212: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_1_166:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_166), 16, 16)) -> intp(1, 0, 29)
	.word 0xbfa449a0  ! 2217: FDIVs	fdivs	%f17, %f0, %f31
	.word 0xbfa98820  ! 2220: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xbfa4c9e0  ! 2221: FDIVq	dis not found

T1_asi_reg_rd_85:
	mov	0x3c4, %r14
	.word 0xfadb8e40  ! 2222: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_wr_100:
	mov	0x3c1, %r14
	.word 0xf4f38e40  ! 2224: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_rd_86:
	mov	0x3c6, %r14
	.word 0xfcdb8e80  ! 2227: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb3a54820  ! 2230: FADDs	fadds	%f21, %f0, %f25
	.word 0xb5a58940  ! 2233: FMULd	fmuld	%f22, %f0, %f26
iob_intr_1_167:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_167), 16, 16)) -> intp(1, 0, b)
cpu_intr_1_182:
	setx	0x2f023b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_183:
	setx	0x2f0338, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_168:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_168), 16, 16)) -> intp(1, 0, 1f)
	.word 0xbfa409e0  ! 2241: FDIVq	dis not found

	.word 0xb7abc820  ! 2243: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb9a5c860  ! 2245: FADDq	dis not found

	.word 0xb1abc820  ! 2249: FMOVVC	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_101:
	mov	0x3c4, %r14
	.word 0xf6f38e80  ! 2252: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	lda	[%r23 + %g0] 0xf0, %f2
	.word 0xb2244000  ! 2257: SUB_R	sub 	%r17, %r0, %r25
cpu_intr_1_184:
	setx	0x2e0202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a409c0  ! 2259: FDIVd	fdivd	%f16, %f0, %f24
iob_intr_1_169:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_169), 16, 16)) -> intp(1, 0, 17)
	.word 0xb3a48920  ! 2262: FMULs	fmuls	%f18, %f0, %f25
iob_intr_1_170:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_170), 16, 16)) -> intp(1, 0, 1)
cpu_intr_1_185:
	setx	0x2c0106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a81420  ! 2267: FMOVRNZ	dis not found

	.word 0xb5a508e0  ! 2272: FSUBq	dis not found

	.word 0xb3a9c820  ! 2273: FMOVVS	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_87:
	mov	0x14, %r14
	.word 0xf6db84a0  ! 2276: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbfaa4820  ! 2277: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb1a00540  ! 2279: FSQRTd	fsqrt	
iob_intr_1_171:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_171), 16, 16)) -> intp(1, 0, 1a)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a00540  ! 2284: FSQRTd	fsqrt	
cpu_intr_1_186:
	setx	0x2c003e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_187:
	setx	0x2f0025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a50840  ! 2290: FADDd	faddd	%f20, %f0, %f24
	.word 0xb2a44000  ! 2295: SUBcc_R	subcc 	%r17, %r0, %r25
	.word 0xb5a81c20  ! 2296: FMOVRGEZ	dis not found

	.word 0xb9a48860  ! 2297: FADDq	dis not found

iob_intr_1_172:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_172), 16, 16)) -> intp(1, 0, 13)
	.word 0xba3ca1fd  ! 2300: XNOR_I	xnor 	%r18, 0x01fd, %r29
iob_intr_1_173:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_173), 16, 16)) -> intp(1, 0, 10)
	.word 0xbbaa0820  ! 2302: FMOVA	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_88:
	mov	0x3c1, %r14
	.word 0xf2db8e80  ! 2303: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_1_188:
	setx	0x2e0215, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_189:
	setx	0x2f033a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_190:
	setx	0x2f0219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba58820  ! 2309: FADDs	fadds	%f22, %f0, %f29
cpu_intr_1_191:
	setx	0x2d0024, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_174:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_174), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb9abc820  ! 2319: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xb6444000  ! 2321: ADDC_R	addc 	%r17, %r0, %r27
	.word 0xb9aac820  ! 2323: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xb9a58920  ! 2324: FMULs	fmuls	%f22, %f0, %f28
	.word 0xbfa94820  ! 2325: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb5ab8820  ! 2328: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb5a8c820  ! 2332: FMOVL	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_102:
	mov	0x3c6, %r14
	.word 0xfaf38e80  ! 2333: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_192:
	setx	0x33023a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_175:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_175), 16, 16)) -> intp(1, 0, 3c)
cpu_intr_1_193:
	setx	0x310029, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_103:
	mov	0x38, %r14
	.word 0xfcf384a0  ! 2341: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T1_asi_reg_rd_89:
	mov	0x0, %r14
	.word 0xfadb8e40  ! 2342: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb1a40960  ! 2344: FMULq	dis not found

cpu_intr_1_194:
	setx	0x33001e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_90:
	mov	0x3c4, %r14
	.word 0xf8db8e80  ! 2349: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xb1a4c860  ! 2352: FADDq	dis not found

iob_intr_1_176:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_176), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_wr_104:
	mov	0x32, %r14
	.word 0xf6f384a0  ! 2358: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T1_asi_reg_rd_91:
	mov	0x22, %r14
	.word 0xfadb8400  ! 2361: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	lda	[%r20 + %g0] 0xf0, %f2
iob_intr_1_177:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_177), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_rd_92:
	mov	0x24, %r14
	.word 0xfadb89e0  ! 2367: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_1_195:
	setx	0x33021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_196:
	setx	0x31021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfab4820  ! 2373: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xbdaa4820  ! 2374: FMOVNE	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_105:
	mov	0x3c4, %r14
	.word 0xf2f38e60  ! 2375: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_1_197:
	setx	0x300320, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_198:
	setx	0x310129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a4c860  ! 2379: FADDq	dis not found

T1_asi_reg_wr_106:
	mov	0x35, %r14
	.word 0xfcf384a0  ! 2380: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_1_199:
	setx	0x320208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe1d0000  ! 2383: XOR_R	xor 	%r20, %r0, %r31
T1_asi_reg_rd_93:
	mov	0x4, %r14
	.word 0xfedb8400  ! 2385: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb5aac820  ! 2386: FMOVGE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_94:
	mov	0x3c8, %r14
	.word 0xf4db8400  ! 2389: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_1_200:
	setx	0x320236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_178:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_178), 16, 16)) -> intp(1, 0, 30)
	.word 0xb4344000  ! 2396: ORN_R	orn 	%r17, %r0, %r26
	.word 0xb5a54840  ! 2402: FADDd	faddd	%f52, %f0, %f26
	.word 0xbf354000  ! 2405: SRL_R	srl 	%r21, %r0, %r31
cpu_intr_1_201:
	setx	0x33033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00020  ! 2413: FMOVs	fmovs	%f0, %f28
	.word 0xb3a58840  ! 2414: FADDd	faddd	%f22, %f0, %f56
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xbda81c20  ! 2417: FMOVRGEZ	dis not found

iob_intr_1_179:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_179), 16, 16)) -> intp(1, 0, 21)
T1_asi_reg_rd_95:
	mov	0x38, %r14
	.word 0xf0db89e0  ! 2423: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb5a00020  ! 2425: FMOVs	fmovs	%f0, %f26
	.word 0xb4158000  ! 2426: OR_R	or 	%r22, %r0, %r26
	.word 0xbfa81820  ! 2427: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb3a4c8c0  ! 2429: FSUBd	fsubd	%f50, %f0, %f56
cpu_intr_1_202:
	setx	0x310310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdabc820  ! 2432: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xbda4c8e0  ! 2433: FSUBq	dis not found

iob_intr_1_180:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_180), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb5a94820  ! 2435: FMOVCS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_107:
	mov	0x16, %r14
	.word 0xfcf389e0  ! 2438: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xbbab4820  ! 2443: FMOVCC	fmovs	%fcc1, %f0, %f29
iob_intr_1_181:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_181), 16, 16)) -> intp(1, 0, 1c)
T1_asi_reg_wr_108:
	mov	0x34, %r14
	.word 0xf6f38e40  ! 2448: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbda50940  ! 2449: FMULd	fmuld	%f20, %f0, %f30
cpu_intr_1_203:
	setx	0x310206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba48960  ! 2452: FMULq	dis not found

T1_asi_reg_wr_109:
	mov	0x23, %r14
	.word 0xf0f389e0  ! 2453: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_1_204:
	setx	0x330234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b4a1af  ! 2457: SUBCcc_I	orncc 	%r18, 0x01af, %r24
	.word 0xbba40920  ! 2460: FMULs	fmuls	%f16, %f0, %f29
cpu_intr_1_205:
	setx	0x330007, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_182:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_182), 16, 16)) -> intp(1, 0, 3a)
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xb8856119  ! 2474: ADDcc_I	addcc 	%r21, 0x0119, %r28
T1_asi_reg_rd_96:
	mov	0x36, %r14
	.word 0xfedb89e0  ! 2475: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_1_206:
	setx	0x32022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a84820  ! 2483: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xba85c000  ! 2484: ADDcc_R	addcc 	%r23, %r0, %r29
	.word 0xb5a4c9e0  ! 2485: FDIVq	dis not found

iob_intr_1_183:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_183), 16, 16)) -> intp(1, 0, 11)
	.word 0xb934e001  ! 2493: SRL_I	srl 	%r19, 0x0001, %r28
cpu_intr_1_207:
	setx	0x30020b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_208:
	setx	0x310234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a40940  ! 2500: FMULd	fmuld	%f16, %f0, %f24
iob_intr_1_184:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_184), 16, 16)) -> intp(1, 0, c)
iob_intr_1_185:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_185), 16, 16)) -> intp(1, 0, 12)
	.word 0xb5a00020  ! 2505: FMOVs	fmovs	%f0, %f26
cpu_intr_1_209:
	setx	0x300318, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_97:
	mov	0x21, %r14
	.word 0xf2db84a0  ! 2507: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb93c2001  ! 2509: SRA_I	sra 	%r16, 0x0001, %r28
	.word 0xb3a549e0  ! 2510: FDIVq	dis not found

	.word 0xb4850000  ! 2512: ADDcc_R	addcc 	%r20, %r0, %r26
cpu_intr_1_210:
	setx	0x330109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda81420  ! 2516: FMOVRNZ	dis not found

	lda	[%r19 + %g0] 0xf0, %f2
T1_asi_reg_rd_98:
	mov	0xd, %r14
	.word 0xf0db8e80  ! 2522: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T1_asi_reg_wr_110:
	mov	0x3c4, %r14
	.word 0xf0f38400  ! 2523: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_1_211:
	setx	0x32000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfab4820  ! 2526: FMOVCC	fmovs	%fcc1, %f0, %f31
cpu_intr_1_212:
	setx	0x330229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a44920  ! 2529: FMULs	fmuls	%f17, %f0, %f27
cpu_intr_1_213:
	setx	0x320134, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_214:
	setx	0x31022b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_215:
	setx	0x320200, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_99:
	mov	0x3c6, %r14
	.word 0xfedb8400  ! 2535: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb1a80820  ! 2536: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xbfa80c20  ! 2537: FMOVRLZ	dis not found

	.word 0xb5a409e0  ! 2538: FDIVq	dis not found

	.word 0xb5a80c20  ! 2540: FMOVRLZ	dis not found

cpu_intr_1_216:
	setx	0x31031a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_217:
	setx	0x300217, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_100:
	mov	0x3c4, %r14
	.word 0xf4db8e60  ! 2545: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb7aac820  ! 2547: FMOVGE	fmovs	%fcc1, %f0, %f27
	lda	[%r19 + %g0] 0xf0, %f2
cpu_intr_1_218:
	setx	0x32033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaac820  ! 2551: FMOVGE	fmovs	%fcc1, %f0, %f30
iob_intr_1_186:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_186), 16, 16)) -> intp(1, 0, 37)
	.word 0xb3a549c0  ! 2553: FDIVd	fdivd	%f52, %f0, %f56
	.word 0xb3a508a0  ! 2556: FSUBs	fsubs	%f20, %f0, %f25
iob_intr_1_187:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_187), 16, 16)) -> intp(1, 0, 31)
	.word 0xb5ab4820  ! 2561: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xba2c61ba  ! 2565: ANDN_I	andn 	%r17, 0x01ba, %r29
	.word 0xb3a00520  ! 2568: FSQRTs	fsqrt	
iob_intr_1_188:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_188), 16, 16)) -> intp(1, 0, 38)
	.word 0xb1a5c820  ! 2574: FADDs	fadds	%f23, %f0, %f24
cpu_intr_1_219:
	setx	0x33013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb49ce1f9  ! 2579: XORcc_I	xorcc 	%r19, 0x01f9, %r26
	.word 0xb1a4c840  ! 2581: FADDd	faddd	%f50, %f0, %f24
T1_asi_reg_rd_101:
	mov	0x3c5, %r14
	.word 0xf6db8e40  ! 2583: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb7a80420  ! 2584: FMOVRZ	dis not found

iob_intr_1_189:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_189), 16, 16)) -> intp(1, 0, e)
cpu_intr_1_220:
	setx	0x33030f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_111:
	mov	0xa, %r14
	.word 0xfaf38e40  ! 2587: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_rd_102:
	mov	0x3c2, %r14
	.word 0xf2db8400  ! 2592: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb8b4e164  ! 2598: SUBCcc_I	orncc 	%r19, 0x0164, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3aac820  ! 2602: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xb3510000  ! 2603: RDPR_TICK	<illegal instruction>
T1_asi_reg_wr_112:
	mov	0x17, %r14
	.word 0xfaf38e40  ! 2604: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_wr_113:
	mov	0x26, %r14
	.word 0xfef38e40  ! 2608: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_rd_103:
	mov	0x3c0, %r14
	.word 0xf4db8e80  ! 2610: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T1_asi_reg_wr_114:
	mov	0xc, %r14
	.word 0xfaf38e80  ! 2612: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_1_190:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_190), 16, 16)) -> intp(1, 0, 11)
cpu_intr_1_221:
	setx	0x33022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b52059  ! 2615: ORNcc_I	orncc 	%r20, 0x0059, %r25
cpu_intr_1_222:
	setx	0x330125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab4820  ! 2620: FMOVCC	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_115:
	mov	0x2d, %r14
	.word 0xfaf38e40  ! 2622: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbda81c20  ! 2625: FMOVRGEZ	dis not found

	.word 0xbd643801  ! 2626: MOVcc_I	<illegal instruction>
	.word 0xb3ab8820  ! 2627: FMOVPOS	fmovs	%fcc1, %f0, %f25
iob_intr_1_191:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_191), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_rd_104:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 2631: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbba58940  ! 2633: FMULd	fmuld	%f22, %f0, %f60
iob_intr_1_192:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_192), 16, 16)) -> intp(1, 0, 12)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_223:
	setx	0x31010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00020  ! 2642: FMOVs	fmovs	%f0, %f25
	.word 0xb3a81820  ! 2651: FMOVRGZ	fmovs	%fcc3, %f0, %f25
cpu_intr_1_224:
	setx	0x320031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_225:
	setx	0x300216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_193:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_193), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_rd_105:
	mov	0x12, %r14
	.word 0xf4db8400  ! 2661: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_1_226:
	setx	0x31010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a409a0  ! 2666: FDIVs	fdivs	%f16, %f0, %f27
T1_asi_reg_wr_116:
	mov	0x3c2, %r14
	.word 0xf4f38e60  ! 2667: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_1_194:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_194), 16, 16)) -> intp(1, 0, 21)
iob_intr_1_195:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_195), 16, 16)) -> intp(1, 0, 37)
	.word 0xbdab4820  ! 2673: FMOVCC	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_106:
	mov	0x33, %r14
	.word 0xf4db8e40  ! 2674: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_1_227:
	setx	0x320106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdabc820  ! 2680: FMOVVC	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_rd_107:
	mov	0x27, %r14
	.word 0xfadb8e40  ! 2686: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_196:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_196), 16, 16)) -> intp(1, 0, 19)
	.word 0xb1ab4820  ! 2690: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb285e0d1  ! 2691: ADDcc_I	addcc 	%r23, 0x00d1, %r25
	.word 0xb5641800  ! 2693: MOVcc_R	<illegal instruction>
	.word 0xb9a549e0  ! 2695: FDIVq	dis not found

	.word 0xb3a54840  ! 2696: FADDd	faddd	%f52, %f0, %f56
	.word 0xb7a408c0  ! 2699: FSUBd	fsubd	%f16, %f0, %f58
	.word 0xb7355000  ! 2701: SRLX_R	srlx	%r21, %r0, %r27
	.word 0xb7a589c0  ! 2703: FDIVd	fdivd	%f22, %f0, %f58
T1_asi_reg_rd_108:
	mov	0x1, %r14
	.word 0xfedb8400  ! 2704: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb9a80420  ! 2705: FMOVRZ	dis not found

cpu_intr_1_228:
	setx	0x330105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba44860  ! 2707: FADDq	dis not found

	.word 0xb1a8c820  ! 2710: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xb7a489c0  ! 2711: FDIVd	fdivd	%f18, %f0, %f58
	.word 0xbda84820  ! 2712: FMOVE	fmovs	%fcc1, %f0, %f30
iob_intr_1_197:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_197), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb2b4a1b7  ! 2721: SUBCcc_I	orncc 	%r18, 0x01b7, %r25
cpu_intr_1_229:
	setx	0x330310, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_198:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_198), 16, 16)) -> intp(1, 0, a)
	.word 0xbfaa4820  ! 2725: FMOVNE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_230:
	setx	0x33023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a5c840  ! 2729: FADDd	faddd	%f54, %f0, %f24
	.word 0xb1aa4820  ! 2731: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xbfa489e0  ! 2732: FDIVq	dis not found

T1_asi_reg_wr_117:
	mov	0x1f, %r14
	.word 0xf8f384a0  ! 2734: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T1_asi_reg_wr_118:
	mov	0x1c, %r14
	.word 0xfef384a0  ! 2739: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_1_231:
	setx	0x320236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a44960  ! 2743: FMULq	dis not found

	.word 0xbfa50960  ! 2745: FMULq	dis not found

cpu_intr_1_232:
	setx	0x31002e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_199:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_199), 16, 16)) -> intp(1, 0, 18)
	.word 0xbfa50840  ! 2748: FADDd	faddd	%f20, %f0, %f62
cpu_intr_1_233:
	setx	0x330335, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_119:
	mov	0xc, %r14
	.word 0xf2f38e60  ! 2752: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_1_200:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_200), 16, 16)) -> intp(1, 0, 26)
	.word 0xb5a00540  ! 2756: FSQRTd	fsqrt	
	.word 0xb5a00520  ! 2760: FSQRTs	fsqrt	
	.word 0xb1a80820  ! 2762: FMOVN	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_120:
	mov	0x4, %r14
	.word 0xfef38e40  ! 2766: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbda44960  ! 2767: FMULq	dis not found

iob_intr_1_201:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_201), 16, 16)) -> intp(1, 0, 16)
cpu_intr_1_234:
	setx	0x33001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa489c0  ! 2773: FDIVd	fdivd	%f18, %f0, %f62
cpu_intr_1_235:
	setx	0x32011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa4820  ! 2775: FMOVNE	fmovs	%fcc1, %f0, %f26
iob_intr_1_202:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_202), 16, 16)) -> intp(1, 0, 30)
iob_intr_1_203:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_203), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb7a80820  ! 2778: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
cpu_intr_1_236:
	setx	0x300024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a40860  ! 2785: FADDq	dis not found

	.word 0xb5a80c20  ! 2786: FMOVRLZ	dis not found

T1_asi_reg_rd_109:
	mov	0x1f, %r14
	.word 0xf0db8e40  ! 2787: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_204:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_204), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb7a54840  ! 2790: FADDd	faddd	%f52, %f0, %f58
iob_intr_1_205:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_205), 16, 16)) -> intp(1, 0, b)
cpu_intr_1_237:
	setx	0x340029, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_121:
	mov	0x11, %r14
	.word 0xf4f38400  ! 2796: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb3a81c20  ! 2798: FMOVRGEZ	dis not found

cpu_intr_1_238:
	setx	0x35012a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_239:
	setx	0x360313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa81420  ! 2803: FMOVRNZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_206:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_206), 16, 16)) -> intp(1, 0, 13)
iob_intr_1_207:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_207), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb7a81820  ! 2812: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xbda00520  ! 2814: FSQRTs	fsqrt	
	.word 0x9194e016  ! 2816: WRPR_PIL_I	wrpr	%r19, 0x0016, %pil
iob_intr_1_208:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_208), 16, 16)) -> intp(1, 0, 35)
	.word 0xbd508000  ! 2818: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a8c820  ! 2820: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xbda80420  ! 2822: FMOVRZ	dis not found

cpu_intr_1_240:
	setx	0x37001c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_122:
	mov	0x3c3, %r14
	.word 0xfcf38e60  ! 2825: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_209:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_209), 16, 16)) -> intp(1, 0, 6)
cpu_intr_1_241:
	setx	0x360036, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_210:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_210), 16, 16)) -> intp(1, 0, 10)
	.word 0xbda00520  ! 2830: FSQRTs	fsqrt	
cpu_intr_1_242:
	setx	0x34010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a58960  ! 2834: FMULq	dis not found

iob_intr_1_211:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_211), 16, 16)) -> intp(1, 0, 33)
T1_asi_reg_wr_123:
	mov	0x1a, %r14
	.word 0xf4f38e40  ! 2839: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_wr_124:
	mov	0x3c6, %r14
	.word 0xfcf38e40  ! 2841: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T1_asi_reg_wr_125:
	mov	0x3c3, %r14
	.word 0xf0f384a0  ! 2845: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T1_asi_reg_wr_126:
	mov	0x32, %r14
	.word 0xfef38e80  ! 2846: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbbab0820  ! 2847: FMOVGU	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_127:
	mov	0x22, %r14
	.word 0xf4f38400  ! 2857: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbdab4820  ! 2859: FMOVCC	fmovs	%fcc1, %f0, %f30
iob_intr_1_212:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_212), 16, 16)) -> intp(1, 0, 32)
	.word 0xb22d6187  ! 2861: ANDN_I	andn 	%r21, 0x0187, %r25
	.word 0xb1abc820  ! 2867: FMOVVC	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1abc820  ! 2871: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xbdabc820  ! 2872: FMOVVC	fmovs	%fcc1, %f0, %f30
iob_intr_1_213:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_213), 16, 16)) -> intp(1, 0, 13)
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xbda00020  ! 2879: FMOVs	fmovs	%f0, %f30
cpu_intr_1_243:
	setx	0x370228, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_110:
	mov	0x3c0, %r14
	.word 0xf6db84a0  ! 2885: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_1_214:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_214), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb9a4c960  ! 2890: FMULq	dis not found

T1_asi_reg_wr_128:
	mov	0x11, %r14
	.word 0xfef38e40  ! 2891: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_rd_111:
	mov	0x3c4, %r14
	.word 0xfedb8e40  ! 2892: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb3a80420  ! 2894: FMOVRZ	dis not found

T1_asi_reg_rd_112:
	mov	0x13, %r14
	.word 0xf2db84a0  ! 2899: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb5a4c840  ! 2900: FADDd	faddd	%f50, %f0, %f26
T1_asi_reg_wr_129:
	mov	0x14, %r14
	.word 0xf4f384a0  ! 2901: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_1_244:
	setx	0x340315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba2d61cc  ! 2903: ANDN_I	andn 	%r21, 0x01cc, %r29
T1_asi_reg_wr_130:
	mov	0xc, %r14
	.word 0xf0f38e40  ! 2907: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_1_245:
	setx	0x37030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00020  ! 2912: FMOVs	fmovs	%f0, %f28
T1_asi_reg_wr_131:
	mov	0x15, %r14
	.word 0xf4f38e80  ! 2915: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbfaa4820  ! 2919: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xbba8c820  ! 2921: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xb3a00520  ! 2923: FSQRTs	fsqrt	
	.word 0xbdabc820  ! 2924: FMOVVC	fmovs	%fcc1, %f0, %f30
iob_intr_1_215:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_215), 16, 16)) -> intp(1, 0, 39)
iob_intr_1_216:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_216), 16, 16)) -> intp(1, 0, 39)
cpu_intr_1_246:
	setx	0x36000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a81c20  ! 2934: FMOVRGEZ	dis not found

T1_asi_reg_wr_132:
	mov	0x17, %r14
	.word 0xf0f38e80  ! 2935: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_1_247:
	setx	0x360109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda58820  ! 2942: FADDs	fadds	%f22, %f0, %f30
cpu_intr_1_248:
	setx	0x340326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4148000  ! 2944: OR_R	or 	%r18, %r0, %r26
	.word 0xb1a00540  ! 2945: FSQRTd	fsqrt	
iob_intr_1_217:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_217), 16, 16)) -> intp(1, 0, 35)
	.word 0xb5a81c20  ! 2948: FMOVRGEZ	dis not found

iob_intr_1_218:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_218), 16, 16)) -> intp(1, 0, 35)
	.word 0xb2244000  ! 2955: SUB_R	sub 	%r17, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_219:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_219), 16, 16)) -> intp(1, 0, 35)
	.word 0xbba80c20  ! 2967: FMOVRLZ	dis not found

T1_asi_reg_rd_113:
	mov	0x3c2, %r14
	.word 0xfcdb89e0  ! 2968: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_1_249:
	setx	0x37001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8795a021  ! 2972: WRPR_TT_I	wrpr	%r22, 0x0021, %tt
cpu_intr_1_250:
	setx	0x340304, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_114:
	mov	0xc, %r14
	.word 0xf6db8e40  ! 2974: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_220:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_220), 16, 16)) -> intp(1, 0, 4)
	.word 0xb7a00560  ! 2976: FSQRTq	fsqrt	
	.word 0xb17d0400  ! 2977: MOVR_R	movre	%r20, %r0, %r24
	.word 0xb41521b4  ! 2978: OR_I	or 	%r20, 0x01b4, %r26
	.word 0xb7518000  ! 2982: RDPR_PSTATE	<illegal instruction>
iob_intr_1_221:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_221), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_wr_133:
	mov	0x30, %r14
	.word 0xfaf38e40  ! 2991: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_1_222:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_222), 16, 16)) -> intp(1, 0, c)
	.word 0xbda548a0  ! 2998: FSUBs	fsubs	%f21, %f0, %f30
	.word 0xbe940000  ! 2999: ORcc_R	orcc 	%r16, %r0, %r31
	.word 0xb1a449a0  ! 3000: FDIVs	fdivs	%f17, %f0, %f24
T1_asi_reg_rd_115:
	mov	0x3c8, %r14
	.word 0xf8db8e80  ! 3003: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbda00520  ! 3007: FSQRTs	fsqrt	
T1_asi_reg_wr_134:
	mov	0x18, %r14
	.word 0xfaf38e40  ! 3009: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb3a48840  ! 3010: FADDd	faddd	%f18, %f0, %f56
iob_intr_1_223:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_223), 16, 16)) -> intp(1, 0, 6)
	.word 0xb3a9c820  ! 3016: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xbda98820  ! 3018: FMOVNEG	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_135:
	mov	0x22, %r14
	.word 0xfef38e60  ! 3019: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb9aac820  ! 3020: FMOVGE	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_136:
	mov	0x3c8, %r14
	.word 0xf8f38e40  ! 3025: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb3a4c920  ! 3028: FMULs	fmuls	%f19, %f0, %f25
	.word 0xb7a5c860  ! 3030: FADDq	dis not found

cpu_intr_1_251:
	setx	0x350114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb64561a2  ! 3033: ADDC_I	addc 	%r21, 0x01a2, %r27
T1_asi_reg_wr_137:
	mov	0x27, %r14
	.word 0xfaf38e80  ! 3034: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T1_asi_reg_rd_116:
	mov	0x3c8, %r14
	.word 0xf0db8400  ! 3035: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_224:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_224), 16, 16)) -> intp(1, 0, e)
T1_asi_reg_rd_117:
	mov	0x12, %r14
	.word 0xf0db8e40  ! 3038: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_225:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_225), 16, 16)) -> intp(1, 0, e)
iob_intr_1_226:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_226), 16, 16)) -> intp(1, 0, 0)
T1_asi_reg_wr_138:
	mov	0x3c4, %r14
	.word 0xf8f389e0  ! 3047: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0x8d9561ed  ! 3049: WRPR_PSTATE_I	wrpr	%r21, 0x01ed, %pstate
	.word 0xb3ab4820  ! 3050: FMOVCC	fmovs	%fcc1, %f0, %f25
cpu_intr_1_252:
	setx	0x350335, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_wr_139:
	mov	0x9, %r14
	.word 0xf2f384a0  ! 3055: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb7abc820  ! 3063: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb1a58920  ! 3064: FMULs	fmuls	%f22, %f0, %f24
T1_asi_reg_rd_118:
	mov	0x1, %r14
	.word 0xfedb84a0  ! 3066: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb9a549a0  ! 3072: FDIVs	fdivs	%f21, %f0, %f28
T1_asi_reg_wr_140:
	mov	0x0, %r14
	.word 0xf8f384a0  ! 3074: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbb480000  ! 3076: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbda94820  ! 3077: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xb7a489a0  ! 3078: FDIVs	fdivs	%f18, %f0, %f27
	.word 0xb7a488a0  ! 3081: FSUBs	fsubs	%f18, %f0, %f27
iob_intr_1_227:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_227), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_253:
	setx	0x360028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb035a156  ! 3088: ORN_I	orn 	%r22, 0x0156, %r24
cpu_intr_1_254:
	setx	0x370213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80420  ! 3091: FMOVRZ	dis not found

	.word 0xbda5c840  ! 3093: FADDd	faddd	%f54, %f0, %f30
cpu_intr_1_255:
	setx	0x340210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8a5a173  ! 3096: SUBcc_I	subcc 	%r22, 0x0173, %r28
	.word 0xb3a81c20  ! 3097: FMOVRGEZ	dis not found

T1_asi_reg_rd_119:
	mov	0x3c4, %r14
	.word 0xf4db8e60  ! 3098: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb5a8c820  ! 3100: FMOVL	fmovs	%fcc1, %f0, %f26
cpu_intr_1_256:
	setx	0x36011e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_257:
	setx	0x370234, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_258:
	setx	0x350111, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_259:
	setx	0x350335, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_141:
	mov	0x3c3, %r14
	.word 0xf2f38400  ! 3106: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_1_228:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_228), 16, 16)) -> intp(1, 0, 38)
cpu_intr_1_260:
	setx	0x37000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a88820  ! 3110: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xbfa90820  ! 3112: FMOVLEU	fmovs	%fcc1, %f0, %f31
iob_intr_1_229:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_229), 16, 16)) -> intp(1, 0, 4)
	.word 0xbfa5c9c0  ! 3116: FDIVd	fdivd	%f54, %f0, %f62
	.word 0xb9a4c820  ! 3117: FADDs	fadds	%f19, %f0, %f28
	.word 0xb3a489e0  ! 3118: FDIVq	dis not found

T1_asi_reg_rd_120:
	mov	0x3c0, %r14
	.word 0xfcdb84a0  ! 3120: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T1_asi_reg_rd_121:
	mov	0x15, %r14
	.word 0xfadb8e40  ! 3123: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbba81c20  ! 3125: FMOVRGEZ	dis not found

cpu_intr_1_261:
	setx	0x340227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb29c0000  ! 3128: XORcc_R	xorcc 	%r16, %r0, %r25
T1_asi_reg_rd_122:
	mov	0x2, %r14
	.word 0xf0db8e40  ! 3129: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_230:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_230), 16, 16)) -> intp(1, 0, 4)
	.word 0xb9ab8820  ! 3132: FMOVPOS	fmovs	%fcc1, %f0, %f28
iob_intr_1_231:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_231), 16, 16)) -> intp(1, 0, e)
cpu_intr_1_262:
	setx	0x35000e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_232:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_232), 16, 16)) -> intp(1, 0, 32)
cpu_intr_1_263:
	setx	0x350002, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa98820  ! 3151: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xbda00560  ! 3156: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_264:
	setx	0x360122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80820  ! 3162: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_123:
	mov	0x11, %r14
	.word 0xfadb84a0  ! 3163: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_1_233:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_233), 16, 16)) -> intp(1, 0, a)
cpu_intr_1_265:
	setx	0x340302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda489e0  ! 3168: FDIVq	dis not found

cpu_intr_1_266:
	setx	0x360028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba88820  ! 3172: FMOVLE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_267:
	setx	0x36021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfabc820  ! 3176: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb7a548e0  ! 3178: FSUBq	dis not found

	.word 0xb5a4c920  ! 3179: FMULs	fmuls	%f19, %f0, %f26
T1_asi_reg_wr_142:
	mov	0x2a, %r14
	.word 0xfef38e40  ! 3181: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb7a408e0  ! 3183: FSUBq	dis not found

cpu_intr_1_268:
	setx	0x35003c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_269:
	setx	0x35023b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_234:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_234), 16, 16)) -> intp(1, 0, 30)
	.word 0xbba80820  ! 3189: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xbbaa4820  ! 3193: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb13c4000  ! 3194: SRA_R	sra 	%r17, %r0, %r24
T1_asi_reg_rd_124:
	mov	0x16, %r14
	.word 0xf6db8e80  ! 3198: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T1_asi_reg_rd_125:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 3200: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb7346001  ! 3201: SRL_I	srl 	%r17, 0x0001, %r27
	.word 0xb7a58860  ! 3206: FADDq	dis not found

	.word 0xb5a81c20  ! 3207: FMOVRGEZ	dis not found

iob_intr_1_235:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_235), 16, 16)) -> intp(1, 0, 25)
	.word 0xb5a9c820  ! 3209: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xbda4c9a0  ! 3211: FDIVs	fdivs	%f19, %f0, %f30
cpu_intr_1_270:
	setx	0x360219, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_236:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_236), 16, 16)) -> intp(1, 0, 38)
cpu_intr_1_271:
	setx	0x34033a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_237:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_237), 16, 16)) -> intp(1, 0, 17)
	.word 0xb1a8c820  ! 3220: FMOVL	fmovs	%fcc1, %f0, %f24
cpu_intr_1_272:
	setx	0x350230, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_273:
	setx	0x37011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc35c000  ! 3226: ORN_R	orn 	%r23, %r0, %r30
	.word 0x8f902001  ! 3227: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xb48c203d  ! 3230: ANDcc_I	andcc 	%r16, 0x003d, %r26
	.word 0xb3a58940  ! 3233: FMULd	fmuld	%f22, %f0, %f56
iob_intr_1_238:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_238), 16, 16)) -> intp(1, 0, 11)
iob_intr_1_239:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_239), 16, 16)) -> intp(1, 0, 1a)
	.word 0xbba5c8c0  ! 3236: FSUBd	fsubd	%f54, %f0, %f60
T1_asi_reg_rd_126:
	mov	0x15, %r14
	.word 0xf8db89e0  ! 3237: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_1_240:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_240), 16, 16)) -> intp(1, 0, 32)
T1_asi_reg_rd_127:
	mov	0x3c1, %r14
	.word 0xf4db8400  ! 3239: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_1_274:
	setx	0x39021a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_143:
	mov	0x11, %r14
	.word 0xf6f38e40  ! 3241: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_rd_128:
	mov	0x23, %r14
	.word 0xfadb89e0  ! 3242: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_1_241:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_241), 16, 16)) -> intp(1, 0, 0)
cpu_intr_1_275:
	setx	0x39020a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_129:
	mov	0x27, %r14
	.word 0xfedb8e40  ! 3248: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbfa58920  ! 3249: FMULs	fmuls	%f22, %f0, %f31
	.word 0xbdaa4820  ! 3252: FMOVNE	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_144:
	mov	0x1b, %r14
	.word 0xfef38e60  ! 3255: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_1_242:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_242), 16, 16)) -> intp(1, 0, c)
	.word 0xb1a81420  ! 3259: FMOVRNZ	dis not found

	.word 0xbfa408e0  ! 3262: FSUBq	dis not found

	.word 0xb5a94820  ! 3265: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xbdaac820  ! 3266: FMOVGE	fmovs	%fcc1, %f0, %f30
iob_intr_1_243:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_243), 16, 16)) -> intp(1, 0, 3f)
cpu_intr_1_276:
	setx	0x39033c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_244:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_244), 16, 16)) -> intp(1, 0, 21)
T1_asi_reg_wr_145:
	mov	0x1c, %r14
	.word 0xf4f38e40  ! 3276: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_rd_130:
	mov	0x2e, %r14
	.word 0xf8db8e60  ! 3279: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_1_245:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_245), 16, 16)) -> intp(1, 0, 33)
T1_asi_reg_rd_131:
	mov	0x2b, %r14
	.word 0xf6db8e40  ! 3281: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T1_asi_reg_rd_132:
	mov	0x3c3, %r14
	.word 0xf2db8e40  ! 3283: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_wr_146:
	mov	0x3c2, %r14
	.word 0xfcf38e80  ! 3285: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_1_277:
	setx	0x3a003a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_246:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_246), 16, 16)) -> intp(1, 0, 14)
	.word 0xbba88820  ! 3289: FMOVLE	fmovs	%fcc1, %f0, %f29
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
cpu_intr_1_278:
	setx	0x3b0008, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_247:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_247), 16, 16)) -> intp(1, 0, 17)
	.word 0xba3560c5  ! 3304: ORN_I	orn 	%r21, 0x00c5, %r29
iob_intr_1_248:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_248), 16, 16)) -> intp(1, 0, 25)
	.word 0xbda90820  ! 3308: FMOVLEU	fmovs	%fcc1, %f0, %f30
iob_intr_1_249:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_249), 16, 16)) -> intp(1, 0, 39)
iob_intr_1_250:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_250), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_279:
	setx	0x3b032d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_280:
	setx	0x3b000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80420  ! 3321: FMOVRZ	dis not found

	.word 0xb5a40920  ! 3322: FMULs	fmuls	%f16, %f0, %f26
T1_asi_reg_wr_147:
	mov	0x1a, %r14
	.word 0xfaf38400  ! 3323: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a508c0  ! 3325: FSUBd	fsubd	%f20, %f0, %f26
iob_intr_1_251:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_251), 16, 16)) -> intp(1, 0, 33)
	.word 0xbba408c0  ! 3328: FSUBd	fsubd	%f16, %f0, %f60
	.word 0xb815205f  ! 3330: OR_I	or 	%r20, 0x005f, %r28
	.word 0xb5a588c0  ! 3331: FSUBd	fsubd	%f22, %f0, %f26
T1_asi_reg_wr_148:
	mov	0x32, %r14
	.word 0xf0f38e60  ! 3332: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb7a90820  ! 3333: FMOVLEU	fmovs	%fcc1, %f0, %f27
cpu_intr_1_281:
	setx	0x38021c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_282:
	setx	0x3b010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba81c20  ! 3338: FMOVRGEZ	dis not found

	.word 0xbac5e1a2  ! 3339: ADDCcc_I	addccc 	%r23, 0x01a2, %r29
	.word 0xb9ab8820  ! 3342: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb7a9c820  ! 3343: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb7a4c9a0  ! 3345: FDIVs	fdivs	%f19, %f0, %f27
	.word 0xb9a00020  ! 3347: FMOVs	fmovs	%f0, %f28
	.word 0xbda48940  ! 3348: FMULd	fmuld	%f18, %f0, %f30
	.word 0xb7a90820  ! 3351: FMOVLEU	fmovs	%fcc1, %f0, %f27
cpu_intr_1_283:
	setx	0x3a002b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_252:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_252), 16, 16)) -> intp(1, 0, 23)
iob_intr_1_253:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_253), 16, 16)) -> intp(1, 0, 37)
	.word 0xb5a448a0  ! 3358: FSUBs	fsubs	%f17, %f0, %f26
T1_asi_reg_wr_149:
	mov	0x25, %r14
	.word 0xf0f38e40  ! 3359: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_rd_133:
	mov	0x33, %r14
	.word 0xf4db8400  ! 3362: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xbba94820  ! 3363: FMOVCS	fmovs	%fcc1, %f0, %f29
iob_intr_1_254:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_254), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbbaa0820  ! 3368: FMOVA	fmovs	%fcc1, %f0, %f29
cpu_intr_1_284:
	setx	0x39003c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_134:
	mov	0x3c7, %r14
	.word 0xf2db89e0  ! 3373: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_1_255:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_255), 16, 16)) -> intp(1, 0, 38)
	.word 0xb8b48000  ! 3375: SUBCcc_R	orncc 	%r18, %r0, %r28
	.word 0xb9a448a0  ! 3376: FSUBs	fsubs	%f17, %f0, %f28
	.word 0xbba5c8a0  ! 3377: FSUBs	fsubs	%f23, %f0, %f29
cpu_intr_1_285:
	setx	0x3a0237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c9a0  ! 3379: FDIVs	fdivs	%f23, %f0, %f27
	.word 0xbe95e0ee  ! 3382: ORcc_I	orcc 	%r23, 0x00ee, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_286:
	setx	0x380037, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_256:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_256), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_257:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_257), 16, 16)) -> intp(1, 0, 17)
iob_intr_1_258:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_258), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbba8c820  ! 3393: FMOVL	fmovs	%fcc1, %f0, %f29
cpu_intr_1_287:
	setx	0x380003, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_288:
	setx	0x3a020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc15e1d6  ! 3401: OR_I	or 	%r23, 0x01d6, %r30
cpu_intr_1_289:
	setx	0x390123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a98820  ! 3408: FMOVNEG	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_135:
	mov	0x3c8, %r14
	.word 0xfedb84a0  ! 3413: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T1_asi_reg_wr_150:
	mov	0x3c0, %r14
	.word 0xfaf38e40  ! 3415: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_wr_151:
	mov	0x4, %r14
	.word 0xf6f38e40  ! 3418: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_259:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_259), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_wr_152:
	mov	0x1b, %r14
	.word 0xfef389e0  ! 3423: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb615c000  ! 3428: OR_R	or 	%r23, %r0, %r27
iob_intr_1_260:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_260), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb1a90820  ! 3430: FMOVLEU	fmovs	%fcc1, %f0, %f24
cpu_intr_1_290:
	setx	0x3b0010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8ac202a  ! 3436: ANDNcc_I	andncc 	%r16, 0x002a, %r28
T1_asi_reg_wr_153:
	mov	0x19, %r14
	.word 0xf2f38e60  ! 3438: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T1_asi_reg_wr_154:
	mov	0x5, %r14
	.word 0xf6f38e80  ! 3440: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T1_asi_reg_rd_136:
	mov	0x3c4, %r14
	.word 0xf4db89e0  ! 3441: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbfa8c820  ! 3443: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb5a80c20  ! 3444: FMOVRLZ	dis not found

	.word 0xb3a00540  ! 3446: FSQRTd	fsqrt	
	.word 0xb3a48860  ! 3447: FADDq	dis not found

cpu_intr_1_291:
	setx	0x3b033b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_261:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_261), 16, 16)) -> intp(1, 0, 2c)
iob_intr_1_262:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_262), 16, 16)) -> intp(1, 0, c)
	.word 0xbf510000  ! 3452: RDPR_TICK	<illegal instruction>
	.word 0xbfa509a0  ! 3454: FDIVs	fdivs	%f20, %f0, %f31
T1_asi_reg_rd_137:
	mov	0x30, %r14
	.word 0xf6db89e0  ! 3456: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xbe24607d  ! 3459: SUB_I	sub 	%r17, 0x007d, %r31
T1_asi_reg_rd_138:
	mov	0x1e, %r14
	.word 0xfcdb8400  ! 3462: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb7a00560  ! 3473: FSQRTq	fsqrt	
	.word 0xb3a9c820  ! 3475: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb3a00040  ! 3476: FMOVd	fmovd	%f0, %f56
	.word 0xbda9c820  ! 3478: FMOVVS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_155:
	mov	0x3c3, %r14
	.word 0xfcf38400  ! 3482: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T1_asi_reg_rd_139:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 3483: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_292:
	setx	0x3b0219, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_263:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_263), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_rd_140:
	mov	0x15, %r14
	.word 0xf4db8e40  ! 3490: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb1a98820  ! 3492: FMOVNEG	fmovs	%fcc1, %f0, %f24
cpu_intr_1_293:
	setx	0x38012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb435e0e1  ! 3495: ORN_I	orn 	%r23, 0x00e1, %r26
cpu_intr_1_294:
	setx	0x3a0331, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_264:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_264), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb41da134  ! 3502: XOR_I	xor 	%r22, 0x0134, %r26
T1_asi_reg_rd_141:
	mov	0x3c6, %r14
	.word 0xf6db8e60  ! 3505: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb0ace150  ! 3507: ANDNcc_I	andncc 	%r19, 0x0150, %r24
T1_asi_reg_wr_156:
	mov	0x3c2, %r14
	.word 0xf8f38e80  ! 3509: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xbabc4000  ! 3511: XNORcc_R	xnorcc 	%r17, %r0, %r29
T1_asi_reg_wr_157:
	mov	0x38, %r14
	.word 0xf0f38e60  ! 3521: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xbdaa0820  ! 3523: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xbfa00520  ! 3525: FSQRTs	fsqrt	
	.word 0xbda81420  ! 3528: FMOVRNZ	dis not found

cpu_intr_1_295:
	setx	0x3a0027, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_142:
	mov	0x3c0, %r14
	.word 0xfcdb8e80  ! 3530: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_1_296:
	setx	0x380339, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_143:
	mov	0x27, %r14
	.word 0xf2db89e0  ! 3534: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb5a8c820  ! 3535: FMOVL	fmovs	%fcc1, %f0, %f26
iob_intr_1_265:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_265), 16, 16)) -> intp(1, 0, 1)
	.word 0xbf2c3001  ! 3540: SLLX_I	sllx	%r16, 0x0001, %r31
T1_asi_reg_rd_144:
	mov	0x1b, %r14
	.word 0xfcdb8e40  ! 3543: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb1a48840  ! 3544: FADDd	faddd	%f18, %f0, %f24
cpu_intr_1_297:
	setx	0x3a0114, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_145:
	mov	0x3c6, %r14
	.word 0xf6db8e60  ! 3550: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_1_266:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_266), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_298:
	setx	0x3b0027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb004c000  ! 3554: ADD_R	add 	%r19, %r0, %r24
	.word 0xb1a50860  ! 3556: FADDq	dis not found

cpu_intr_1_299:
	setx	0x390217, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_267:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_267), 16, 16)) -> intp(1, 0, 4)
	.word 0xb3a00040  ! 3566: FMOVd	fmovd	%f0, %f56
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb6840000  ! 3569: ADDcc_R	addcc 	%r16, %r0, %r27
cpu_intr_1_300:
	setx	0x3b0035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a44820  ! 3571: FADDs	fadds	%f17, %f0, %f26
	.word 0xb215c000  ! 3575: OR_R	or 	%r23, %r0, %r25
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xb0a521e0  ! 3579: SUBcc_I	subcc 	%r20, 0x01e0, %r24
cpu_intr_1_301:
	setx	0x39012d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_302:
	setx	0x3b003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba4c840  ! 3586: FADDd	faddd	%f50, %f0, %f60
cpu_intr_1_303:
	setx	0x3a0118, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_268:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_268), 16, 16)) -> intp(1, 0, 30)
iob_intr_1_269:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_269), 16, 16)) -> intp(1, 0, 36)
	.word 0xb5ab0820  ! 3594: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb3a5c9e0  ! 3597: FDIVq	dis not found

iob_intr_1_270:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_270), 16, 16)) -> intp(1, 0, e)
T1_asi_reg_wr_158:
	mov	0x3c3, %r14
	.word 0xf6f38e40  ! 3600: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb73c9000  ! 3601: SRAX_R	srax	%r18, %r0, %r27
T1_asi_reg_rd_146:
	mov	0x7, %r14
	.word 0xfadb8e40  ! 3602: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_271:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_271), 16, 16)) -> intp(1, 0, 22)
	.word 0xb9a409c0  ! 3604: FDIVd	fdivd	%f16, %f0, %f28
	.word 0xbfa58920  ! 3605: FMULs	fmuls	%f22, %f0, %f31
T1_asi_reg_rd_147:
	mov	0x6, %r14
	.word 0xfedb8e40  ! 3606: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb12cf001  ! 3607: SLLX_I	sllx	%r19, 0x0001, %r24
	.word 0xb9aa8820  ! 3609: FMOVG	fmovs	%fcc1, %f0, %f28
iob_intr_1_272:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_272), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_wr_159:
	mov	0x3c4, %r14
	.word 0xf4f38e60  ! 3612: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T1_asi_reg_wr_160:
	mov	0x3c3, %r14
	.word 0xf0f38e40  ! 3613: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb005614b  ! 3616: ADD_I	add 	%r21, 0x014b, %r24
	.word 0xb3a9c820  ! 3617: FMOVVS	fmovs	%fcc1, %f0, %f25
iob_intr_1_273:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_273), 16, 16)) -> intp(1, 0, 30)
cpu_intr_1_304:
	setx	0x390128, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_305:
	setx	0x3b0027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00020  ! 3623: FMOVs	fmovs	%f0, %f24
	.word 0xb5a8c820  ! 3627: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xb9a4c9c0  ! 3629: FDIVd	fdivd	%f50, %f0, %f28
	.word 0xb0bc0000  ! 3631: XNORcc_R	xnorcc 	%r16, %r0, %r24
T1_asi_reg_wr_161:
	mov	0x3c8, %r14
	.word 0xfaf38e40  ! 3632: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_1_306:
	setx	0x3b0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba5c860  ! 3639: FADDq	dis not found

iob_intr_1_274:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_274), 16, 16)) -> intp(1, 0, 3)
	.word 0xbd2c4000  ! 3641: SLL_R	sll 	%r17, %r0, %r30
	.word 0xb6a50000  ! 3644: SUBcc_R	subcc 	%r20, %r0, %r27
T1_asi_reg_rd_148:
	mov	0x3, %r14
	.word 0xf0db8e80  ! 3645: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T1_asi_reg_rd_149:
	mov	0x1, %r14
	.word 0xfcdb8e60  ! 3646: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	lda	[%r16 + %g0] 0xf0, %f2
iob_intr_1_275:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_275), 16, 16)) -> intp(1, 0, 18)
	.word 0xb1a48940  ! 3652: FMULd	fmuld	%f18, %f0, %f24
iob_intr_1_276:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_276), 16, 16)) -> intp(1, 0, 21)
cpu_intr_1_307:
	setx	0x3b0001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb80d8000  ! 3660: AND_R	and 	%r22, %r0, %r28
	lda	[%r23 + %g0] 0xf0, %f2
cpu_intr_1_308:
	setx	0x3a0023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa81c20  ! 3675: FMOVRGEZ	dis not found

	.word 0xb3a54940  ! 3676: FMULd	fmuld	%f52, %f0, %f56
	.word 0xbabce160  ! 3679: XNORcc_I	xnorcc 	%r19, 0x0160, %r29
T1_asi_reg_rd_150:
	mov	0x1d, %r14
	.word 0xf0db8e60  ! 3681: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	lda	[%r23 + %g0] 0xf0, %f2
	.word 0xb7a408e0  ! 3683: FSUBq	dis not found

cpu_intr_1_309:
	setx	0x390024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc150000  ! 3685: OR_R	or 	%r20, %r0, %r30
	.word 0xb9aa4820  ! 3687: FMOVNE	fmovs	%fcc1, %f0, %f28
iob_intr_1_277:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_277), 16, 16)) -> intp(1, 0, 37)
	.word 0xbfa81420  ! 3696: FMOVRNZ	dis not found

T1_asi_reg_rd_151:
	mov	0x5, %r14
	.word 0xf6db89e0  ! 3697: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T1_asi_reg_rd_152:
	mov	0x29, %r14
	.word 0xf6db8e40  ! 3698: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb7a81820  ! 3699: FMOVRGZ	fmovs	%fcc3, %f0, %f27
T1_asi_reg_wr_162:
	mov	0x12, %r14
	.word 0xf2f38e40  ! 3702: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	lda	[%r23 + %g0] 0xf0, %f2
iob_intr_1_278:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_278), 16, 16)) -> intp(1, 0, f)
	.word 0xbfa5c9e0  ! 3709: FDIVq	dis not found

cpu_intr_1_310:
	setx	0x3d0106, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_153:
	mov	0x15, %r14
	.word 0xfedb8e40  ! 3714: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbfa00040  ! 3715: FMOVd	fmovd	%f0, %f62
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_wr_163:
	mov	0xf, %r14
	.word 0xfcf38e40  ! 3719: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T1_asi_reg_rd_154:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 3721: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbfa4c9c0  ! 3726: FDIVd	fdivd	%f50, %f0, %f62
T1_asi_reg_wr_164:
	mov	0x22, %r14
	.word 0xf2f38400  ! 3729: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T1_asi_reg_wr_165:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 3730: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbe3c4000  ! 3733: XNOR_R	xnor 	%r17, %r0, %r31
	.word 0xb5a44920  ! 3735: FMULs	fmuls	%f17, %f0, %f26
	.word 0xb9a90820  ! 3736: FMOVLEU	fmovs	%fcc1, %f0, %f28
cpu_intr_1_311:
	setx	0x3d013c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_279:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_279), 16, 16)) -> intp(1, 0, 33)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_312:
	setx	0x3e002a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_155:
	mov	0x1c, %r14
	.word 0xf6db89e0  ! 3746: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_1_313:
	setx	0x3e0237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a81820  ! 3749: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb7a549e0  ! 3750: FDIVq	dis not found

cpu_intr_1_314:
	setx	0x3f0129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00040  ! 3755: FMOVd	fmovd	%f0, %f28
T1_asi_reg_wr_166:
	mov	0x1f, %r14
	.word 0xf2f38e40  ! 3758: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_rd_156:
	mov	0x3, %r14
	.word 0xfadb8e60  ! 3760: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbfa589a0  ! 3767: FDIVs	fdivs	%f22, %f0, %f31
T1_asi_reg_wr_167:
	mov	0x37, %r14
	.word 0xfaf38e40  ! 3771: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_1_315:
	setx	0x3c0029, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_316:
	setx	0x3e0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda4c8e0  ! 3781: FSUBq	dis not found

	.word 0xbdab0820  ! 3782: FMOVGU	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbda409e0  ! 3787: FDIVq	dis not found

cpu_intr_1_317:
	setx	0x3e0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a50860  ! 3794: FADDq	dis not found

cpu_intr_1_318:
	setx	0x3e0215, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a50860  ! 3798: FADDq	dis not found

cpu_intr_1_319:
	setx	0x3d0228, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_280:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_280), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb7a449e0  ! 3802: FDIVq	dis not found

cpu_intr_1_320:
	setx	0x3f021c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_157:
	mov	0x29, %r14
	.word 0xfadb8e60  ! 3807: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb9a4c8c0  ! 3811: FSUBd	fsubd	%f50, %f0, %f28
cpu_intr_1_321:
	setx	0x3f0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00560  ! 3815: FSQRTq	fsqrt	
iob_intr_1_281:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_281), 16, 16)) -> intp(1, 0, 16)
	.word 0xbbaa0820  ! 3817: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb3a00020  ! 3824: FMOVs	fmovs	%f0, %f25
	.word 0xb7a5c860  ! 3825: FADDq	dis not found

	lda	[%r18 + %g0] 0xf0, %f2
iob_intr_1_282:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_282), 16, 16)) -> intp(1, 0, 39)
cpu_intr_1_322:
	setx	0x3c0119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_323:
	setx	0x3e0033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda44920  ! 3836: FMULs	fmuls	%f17, %f0, %f30
cpu_intr_1_324:
	setx	0x3f0000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a4c840  ! 3844: FADDd	faddd	%f50, %f0, %f28
T1_asi_reg_wr_168:
	mov	0x3c8, %r14
	.word 0xfaf38e80  ! 3846: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_1_283:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_283), 16, 16)) -> intp(1, 0, 1b)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_325:
	setx	0x3c013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a50920  ! 3855: FMULs	fmuls	%f20, %f0, %f26
	.word 0xb7a508a0  ! 3857: FSUBs	fsubs	%f20, %f0, %f27
T1_asi_reg_wr_169:
	mov	0x38, %r14
	.word 0xf0f38e40  ! 3859: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_1_284:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_284), 16, 16)) -> intp(1, 0, 23)
	.word 0xb2a42105  ! 3863: SUBcc_I	subcc 	%r16, 0x0105, %r25
cpu_intr_1_326:
	setx	0x3c0319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc15212c  ! 3867: OR_I	or 	%r20, 0x012c, %r30
T1_asi_reg_wr_170:
	mov	0x10, %r14
	.word 0xfcf384a0  ! 3871: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb9a5c8e0  ! 3872: FSUBq	dis not found

	.word 0xb3a5c9e0  ! 3877: FDIVq	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_rd_158:
	mov	0x32, %r14
	.word 0xf6db8400  ! 3879: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T1_asi_reg_rd_159:
	mov	0x8, %r14
	.word 0xfedb8e80  ! 3886: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb5a88820  ! 3888: FMOVLE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_327:
	setx	0x3f023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba81420  ! 3893: FMOVRNZ	dis not found

iob_intr_1_285:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_285), 16, 16)) -> intp(1, 0, 1b)
T1_asi_reg_rd_160:
	mov	0x20, %r14
	.word 0xf0db8e40  ! 3900: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb33c1000  ! 3902: SRAX_R	srax	%r16, %r0, %r25
	.word 0xb9a488e0  ! 3905: FSUBq	dis not found

T1_asi_reg_wr_171:
	mov	0xc, %r14
	.word 0xfcf38e40  ! 3906: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb9a9c820  ! 3907: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xbfab4820  ! 3908: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb1a44820  ! 3909: FADDs	fadds	%f17, %f0, %f24
T1_asi_reg_rd_161:
	mov	0x3c0, %r14
	.word 0xf6db8400  ! 3910: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb7a98820  ! 3911: FMOVNEG	fmovs	%fcc1, %f0, %f27
cpu_intr_1_328:
	setx	0x3c013d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_329:
	setx	0x3d0312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba4c860  ! 3915: FADDq	dis not found

	.word 0xb7a00540  ! 3921: FSQRTd	fsqrt	
	.word 0xb3a8c820  ! 3925: FMOVL	fmovs	%fcc1, %f0, %f25
cpu_intr_1_330:
	setx	0x3d012f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_172:
	mov	0x35, %r14
	.word 0xf6f38e40  ! 3928: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_331:
	setx	0x3c021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a8c820  ! 3933: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xb5a54940  ! 3934: FMULd	fmuld	%f52, %f0, %f26
T1_asi_reg_rd_162:
	mov	0x1a, %r14
	.word 0xf4db84a0  ! 3935: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_1_332:
	setx	0x3f033d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_333:
	setx	0x3d0111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a408a0  ! 3941: FSUBs	fsubs	%f16, %f0, %f25
iob_intr_1_286:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_286), 16, 16)) -> intp(1, 0, 26)
	.word 0xbda9c820  ! 3943: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb3a80820  ! 3944: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
cpu_intr_1_334:
	setx	0x3d010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe850000  ! 3947: ADDcc_R	addcc 	%r20, %r0, %r31
T1_asi_reg_rd_163:
	mov	0x2, %r14
	.word 0xfcdb8400  ! 3948: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_1_335:
	setx	0x3f0335, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_336:
	setx	0x3f0232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00540  ! 3955: FSQRTd	fsqrt	
iob_intr_1_287:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_287), 16, 16)) -> intp(1, 0, f)
iob_intr_1_288:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_288), 16, 16)) -> intp(1, 0, 33)
iob_intr_1_289:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_289), 16, 16)) -> intp(1, 0, 11)
	.word 0xb5641800  ! 3962: MOVcc_R	<illegal instruction>
	.word 0xbda88820  ! 3964: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xbba4c9e0  ! 3965: FDIVq	dis not found

	.word 0xbdaa0820  ! 3967: FMOVA	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_173:
	mov	0x3c3, %r14
	.word 0xf6f38e40  ! 3968: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb7a00560  ! 3971: FSQRTq	fsqrt	
cpu_intr_1_337:
	setx	0x3d021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a44840  ! 3973: FADDd	faddd	%f48, %f0, %f28
	.word 0xb3a4c960  ! 3976: FMULq	dis not found

cpu_intr_1_338:
	setx	0x3d0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80420  ! 3980: FMOVRZ	dis not found

	.word 0xbba549c0  ! 3981: FDIVd	fdivd	%f52, %f0, %f60
iob_intr_1_290:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_290), 16, 16)) -> intp(1, 0, 37)
cpu_intr_1_339:
	setx	0x3d0315, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_340:
	setx	0x3f0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a54860  ! 3987: FADDq	dis not found

cpu_intr_1_341:
	setx	0x3d001a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_291:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_291), 16, 16)) -> intp(1, 0, 27)
T1_asi_reg_rd_164:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 3990: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb83c8000  ! 3991: XNOR_R	xnor 	%r18, %r0, %r28
T1_asi_reg_wr_174:
	mov	0x26, %r14
	.word 0xf4f384a0  ! 3994: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T1_asi_reg_wr_175:
	mov	0x6, %r14
	.word 0xfcf38e40  ! 3997: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T1_asi_reg_rd_165:
	mov	0x3c8, %r14
	.word 0xf4db8e40  ! 3999: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbda98820  ! 4001: FMOVNEG	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_166:
	mov	0x2a, %r14
	.word 0xfcdb8e40  ! 4002: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb1a94820  ! 4003: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb3a5c960  ! 4004: FMULq	dis not found

iob_intr_1_292:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_292), 16, 16)) -> intp(1, 0, 23)
	.word 0x8f902002  ! 4006: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
iob_intr_1_293:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_293), 16, 16)) -> intp(1, 0, 13)
cpu_intr_1_342:
	setx	0x3e001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_176:
	mov	0x36, %r14
	.word 0xf2f38400  ! 4016: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_1_343:
	setx	0x3d0132, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_167:
	mov	0x22, %r14
	.word 0xf0db8e80  ! 4018: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb5a588e0  ! 4022: FSUBq	dis not found

	.word 0xb3a00540  ! 4023: FSQRTd	fsqrt	
	.word 0xb3a80c20  ! 4024: FMOVRLZ	dis not found

	.word 0xbda48940  ! 4025: FMULd	fmuld	%f18, %f0, %f30
	.word 0xbfa80c20  ! 4028: FMOVRLZ	dis not found

	.word 0xbfa00540  ! 4030: FSQRTd	fsqrt	
cpu_intr_1_344:
	setx	0x3d0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_177:
	mov	0x37, %r14
	.word 0xfef389e0  ! 4034: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb9a80420  ! 4036: FMOVRZ	dis not found

cpu_intr_1_345:
	setx	0x3d0006, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_178:
	mov	0x3c8, %r14
	.word 0xfaf38e40  ! 4041: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbfa4c940  ! 4045: FMULd	fmuld	%f50, %f0, %f62
	.word 0xbaac218b  ! 4046: ANDNcc_I	andncc 	%r16, 0x018b, %r29
cpu_intr_1_346:
	setx	0x3c0011, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_294:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_294), 16, 16)) -> intp(1, 0, f)
	.word 0xb5a54860  ! 4051: FADDq	dis not found

	.word 0xbba5c9a0  ! 4053: FDIVs	fdivs	%f23, %f0, %f29
	.word 0xb0958000  ! 4056: ORcc_R	orcc 	%r22, %r0, %r24
	lda	[%r19 + %g0] 0xf0, %f2
cpu_intr_1_347:
	setx	0x3d031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda408e0  ! 4059: FSUBq	dis not found

	.word 0xb3a80820  ! 4062: FMOVN	fmovs	%fcc1, %f0, %f25
cpu_intr_1_348:
	setx	0x3e003b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_295:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_295), 16, 16)) -> intp(1, 0, 2d)
iob_intr_1_296:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_296), 16, 16)) -> intp(1, 0, 5)
T1_asi_reg_rd_168:
	mov	0x1d, %r14
	.word 0xf6db89e0  ! 4075: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_1_297:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_297), 16, 16)) -> intp(1, 0, 1e)
cpu_intr_1_349:
	setx	0x3e0028, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_350:
	setx	0x3c0112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba40840  ! 4083: FADDd	faddd	%f16, %f0, %f60
T1_asi_reg_wr_179:
	mov	0x25, %r14
	.word 0xfcf38e80  ! 4084: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb3a4c8a0  ! 4085: FSUBs	fsubs	%f19, %f0, %f25
	.word 0xb4946143  ! 4086: ORcc_I	orcc 	%r17, 0x0143, %r26
	.word 0xb1a54960  ! 4092: FMULq	dis not found

cpu_intr_1_351:
	setx	0x3f022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba448c0  ! 4094: FSUBd	fsubd	%f48, %f0, %f60
iob_intr_1_298:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_298), 16, 16)) -> intp(1, 0, 37)
	.word 0xbda00560  ! 4097: FSQRTq	fsqrt	
	.word 0xbfa4c8a0  ! 4098: FSUBs	fsubs	%f19, %f0, %f31
cpu_intr_1_352:
	setx	0x3c0304, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_169:
	mov	0x15, %r14
	.word 0xf8db8e40  ! 4101: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_1_299:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_299), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbba4c8c0  ! 4107: FSUBd	fsubd	%f50, %f0, %f60
iob_intr_1_300:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_300), 16, 16)) -> intp(1, 0, 2f)
	.word 0xbba90820  ! 4111: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb9a84820  ! 4112: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xbfa8c820  ! 4114: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb60c6055  ! 4115: AND_I	and 	%r17, 0x0055, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb645208c  ! 4118: ADDC_I	addc 	%r20, 0x008c, %r27
	.word 0xbda94820  ! 4119: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xb3ab4820  ! 4122: FMOVCC	fmovs	%fcc1, %f0, %f25
cpu_intr_1_353:
	setx	0x3c001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1ab0820  ! 4125: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xbfa548e0  ! 4126: FSUBq	dis not found

	.word 0xb7ab4820  ! 4127: FMOVCC	fmovs	%fcc1, %f0, %f27
cpu_intr_1_354:
	setx	0x3c0329, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_355:
	setx	0x3d0023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc840000  ! 4132: ADDcc_R	addcc 	%r16, %r0, %r30
	.word 0xb3a94820  ! 4133: FMOVCS	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_170:
	mov	0x3c1, %r14
	.word 0xf6db8e40  ! 4137: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb3a81420  ! 4141: FMOVRNZ	dis not found

	.word 0xb5a4c860  ! 4142: FADDq	dis not found

T1_asi_reg_rd_171:
	mov	0x12, %r14
	.word 0xfadb8e60  ! 4145: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb1aa8820  ! 4147: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb7ab8820  ! 4148: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xbba80820  ! 4150: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb3aa0820  ! 4151: FMOVA	fmovs	%fcc1, %f0, %f25
iob_intr_1_301:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_301), 16, 16)) -> intp(1, 0, 37)
	.word 0xb9a90820  ! 4157: FMOVLEU	fmovs	%fcc1, %f0, %f28
cpu_intr_1_356:
	setx	0x41022d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_180:
	mov	0x20, %r14
	.word 0xf0f38400  ! 4160: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T1_asi_reg_rd_172:
	mov	0x1f, %r14
	.word 0xf4db84a0  ! 4161: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbfa80420  ! 4162: FMOVRZ	dis not found

	.word 0xb9a00540  ! 4164: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a58920  ! 4167: FMULs	fmuls	%f22, %f0, %f26
iob_intr_1_302:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_302), 16, 16)) -> intp(1, 0, 37)
	.word 0xb1a50820  ! 4171: FADDs	fadds	%f20, %f0, %f24
	.word 0xbfa84820  ! 4174: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xbba00020  ! 4176: FMOVs	fmovs	%f0, %f29
iob_intr_1_303:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_303), 16, 16)) -> intp(1, 0, 2d)
iob_intr_1_304:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_304), 16, 16)) -> intp(1, 0, 3)
	.word 0xbda90820  ! 4179: FMOVLEU	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_173:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 4180: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_305:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_305), 16, 16)) -> intp(1, 0, 9)
cpu_intr_1_357:
	setx	0x430016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00520  ! 4187: FSQRTs	fsqrt	
T1_asi_reg_wr_181:
	mov	0x3c4, %r14
	.word 0xfaf384a0  ! 4188: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb5a40840  ! 4190: FADDd	faddd	%f16, %f0, %f26
iob_intr_1_306:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_306), 16, 16)) -> intp(1, 0, f)
	.word 0xb7a00560  ! 4194: FSQRTq	fsqrt	
	.word 0xbfa00020  ! 4196: FMOVs	fmovs	%f0, %f31
cpu_intr_1_358:
	setx	0x43000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba489a0  ! 4200: FDIVs	fdivs	%f18, %f0, %f29
	.word 0x8394e174  ! 4202: WRPR_TNPC_I	wrpr	%r19, 0x0174, %tnpc
cpu_intr_1_359:
	setx	0x400320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80420  ! 4205: FMOVRZ	dis not found

T1_asi_reg_wr_182:
	mov	0x36, %r14
	.word 0xfef38e60  ! 4208: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbe8d8000  ! 4210: ANDcc_R	andcc 	%r22, %r0, %r31
	.word 0xb8b5207a  ! 4212: ORNcc_I	orncc 	%r20, 0x007a, %r28
	.word 0xbdab0820  ! 4214: FMOVGU	fmovs	%fcc1, %f0, %f30
cpu_intr_1_360:
	setx	0x42032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba5c940  ! 4217: FMULd	fmuld	%f54, %f0, %f60
T1_asi_reg_wr_183:
	mov	0x3c8, %r14
	.word 0xfef38400  ! 4218: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_1_361:
	setx	0x420115, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_184:
	mov	0x1c, %r14
	.word 0xf6f389e0  ! 4222: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_1_307:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_307), 16, 16)) -> intp(1, 0, 30)
	.word 0xbfa00540  ! 4227: FSQRTd	fsqrt	
	.word 0xb6358000  ! 4229: ORN_R	orn 	%r22, %r0, %r27
	.word 0xbba81c20  ! 4230: FMOVRGEZ	dis not found

	.word 0xbfa449e0  ! 4231: FDIVq	dis not found

T1_asi_reg_wr_185:
	mov	0x1c, %r14
	.word 0xfaf38e40  ! 4232: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbfa4c8c0  ! 4233: FSUBd	fsubd	%f50, %f0, %f62
iob_intr_1_308:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_308), 16, 16)) -> intp(1, 0, 29)
	.word 0xbe8d4000  ! 4235: ANDcc_R	andcc 	%r21, %r0, %r31
	.word 0xb1a5c860  ! 4236: FADDq	dis not found

cpu_intr_1_362:
	setx	0x400333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00560  ! 4238: FSQRTq	fsqrt	
T1_asi_reg_wr_186:
	mov	0x3c0, %r14
	.word 0xfef389e0  ! 4243: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_rd_174:
	mov	0x2e, %r14
	.word 0xf6db89e0  ! 4245: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb7aac820  ! 4248: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xba248000  ! 4252: SUB_R	sub 	%r18, %r0, %r29
iob_intr_1_309:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_309), 16, 16)) -> intp(1, 0, 5)
	.word 0xb1a4c840  ! 4254: FADDd	faddd	%f50, %f0, %f24
	.word 0xb1a80820  ! 4255: FMOVN	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_175:
	mov	0xf, %r14
	.word 0xfedb8e80  ! 4256: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_1_363:
	setx	0x420108, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_187:
	mov	0x3c8, %r14
	.word 0xfef38e80  ! 4259: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb1a489c0  ! 4261: FDIVd	fdivd	%f18, %f0, %f24
cpu_intr_1_364:
	setx	0x40011f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_310:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_310), 16, 16)) -> intp(1, 0, e)
cpu_intr_1_365:
	setx	0x400008, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r19 + %g0] 0xf0, %f2
iob_intr_1_311:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_311), 16, 16)) -> intp(1, 0, e)
	.word 0xb5a81820  ! 4272: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xbb7d0400  ! 4274: MOVR_R	movre	%r20, %r0, %r29
	.word 0xb9a4c840  ! 4276: FADDd	faddd	%f50, %f0, %f28
cpu_intr_1_366:
	setx	0x400325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda81c20  ! 4284: FMOVRGEZ	dis not found

	.word 0xb7a5c920  ! 4285: FMULs	fmuls	%f23, %f0, %f27
	.word 0xb0140000  ! 4287: OR_R	or 	%r16, %r0, %r24
iob_intr_1_312:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_312), 16, 16)) -> intp(1, 0, 26)
T1_asi_reg_wr_188:
	mov	0x3c2, %r14
	.word 0xf0f38e60  ! 4289: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb9a4c860  ! 4292: FADDq	dis not found

cpu_intr_1_367:
	setx	0x42030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb01cc000  ! 4294: XOR_R	xor 	%r19, %r0, %r24
T1_asi_reg_wr_189:
	mov	0x3c8, %r14
	.word 0xf4f38e80  ! 4295: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T1_asi_reg_rd_176:
	mov	0x2, %r14
	.word 0xf0db84a0  ! 4296: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0x9194a066  ! 4297: WRPR_PIL_I	wrpr	%r18, 0x0066, %pil
	.word 0xbba549c0  ! 4300: FDIVd	fdivd	%f52, %f0, %f60
	.word 0xbe842122  ! 4301: ADDcc_I	addcc 	%r16, 0x0122, %r31
iob_intr_1_313:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_313), 16, 16)) -> intp(1, 0, 21)
	.word 0xb1a409c0  ! 4306: FDIVd	fdivd	%f16, %f0, %f24
	.word 0xb5ab0820  ! 4309: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xbba8c820  ! 4313: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xb7a4c920  ! 4316: FMULs	fmuls	%f19, %f0, %f27
iob_intr_1_314:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_314), 16, 16)) -> intp(1, 0, 24)
	.word 0xb9abc820  ! 4321: FMOVVC	fmovs	%fcc1, %f0, %f28
iob_intr_1_315:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_315), 16, 16)) -> intp(1, 0, 3a)
T1_asi_reg_rd_177:
	mov	0x1d, %r14
	.word 0xf2db8e40  ! 4330: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbba80820  ! 4331: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_190:
	mov	0x2e, %r14
	.word 0xf0f38e60  ! 4334: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T1_asi_reg_wr_191:
	mov	0xa, %r14
	.word 0xf4f38e40  ! 4335: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_368:
	setx	0x40000e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_316:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_316), 16, 16)) -> intp(1, 0, 12)
	.word 0xb3a90820  ! 4341: FMOVLEU	fmovs	%fcc1, %f0, %f25
iob_intr_1_317:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_317), 16, 16)) -> intp(1, 0, f)
cpu_intr_1_369:
	setx	0x42021e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_370:
	setx	0x400220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x91952164  ! 4351: WRPR_PIL_I	wrpr	%r20, 0x0164, %pil
	.word 0xb53c9000  ! 4352: SRAX_R	srax	%r18, %r0, %r26
	.word 0xb52de001  ! 4357: SLL_I	sll 	%r23, 0x0001, %r26
cpu_intr_1_371:
	setx	0x410036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a409e0  ! 4360: FDIVq	dis not found

	.word 0xb6bc0000  ! 4366: XNORcc_R	xnorcc 	%r16, %r0, %r27
iob_intr_1_318:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_318), 16, 16)) -> intp(1, 0, 30)
cpu_intr_1_372:
	setx	0x430218, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_178:
	mov	0x3c2, %r14
	.word 0xfcdb8e80  ! 4375: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb0c48000  ! 4376: ADDCcc_R	addccc 	%r18, %r0, %r24
	.word 0xbda94820  ! 4377: FMOVCS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_179:
	mov	0x36, %r14
	.word 0xfcdb8e60  ! 4382: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T1_asi_reg_rd_180:
	mov	0x3c3, %r14
	.word 0xfadb8e60  ! 4383: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T1_asi_reg_rd_181:
	mov	0x3c8, %r14
	.word 0xf6db8e40  ! 4384: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T1_asi_reg_wr_192:
	mov	0x3c3, %r14
	.word 0xfef38e40  ! 4385: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_319:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_319), 16, 16)) -> intp(1, 0, 3c)
cpu_intr_1_373:
	setx	0x400328, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_182:
	mov	0xe, %r14
	.word 0xfedb8e40  ! 4395: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbda44860  ! 4397: FADDq	dis not found

	.word 0xbd643801  ! 4401: MOVcc_I	<illegal instruction>
	.word 0xbc8c4000  ! 4402: ANDcc_R	andcc 	%r17, %r0, %r30
	.word 0xb1a40820  ! 4403: FADDs	fadds	%f16, %f0, %f24
cpu_intr_1_374:
	setx	0x42011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80820  ! 4409: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb5a4c940  ! 4410: FMULd	fmuld	%f50, %f0, %f26
	.word 0xba3da09b  ! 4412: XNOR_I	xnor 	%r22, 0x009b, %r29
	.word 0xb9a80420  ! 4414: FMOVRZ	dis not found

	.word 0xb4356040  ! 4415: ORN_I	orn 	%r21, 0x0040, %r26
	.word 0xbba449a0  ! 4416: FDIVs	fdivs	%f17, %f0, %f29
T1_asi_reg_wr_193:
	mov	0x3c8, %r14
	.word 0xf0f38e40  ! 4418: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbdab4820  ! 4420: FMOVCC	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_194:
	mov	0x3c5, %r14
	.word 0xf0f38e80  ! 4423: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_1_320:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_320), 16, 16)) -> intp(1, 0, 19)
	.word 0xb9a5c860  ! 4428: FADDq	dis not found

T1_asi_reg_rd_183:
	mov	0x1f, %r14
	.word 0xfedb89e0  ! 4432: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb1aac820  ! 4433: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xbda48840  ! 4434: FADDd	faddd	%f18, %f0, %f30
cpu_intr_1_375:
	setx	0x430312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda548c0  ! 4437: FSUBd	fsubd	%f52, %f0, %f30
	.word 0xb1a80c20  ! 4439: FMOVRLZ	dis not found

	.word 0xbb3d7001  ! 4443: SRAX_I	srax	%r21, 0x0001, %r29
cpu_intr_1_376:
	setx	0x42010e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_321:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_321), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_322:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_322), 16, 16)) -> intp(1, 0, f)
	.word 0xb7643801  ! 4447: MOVcc_I	<illegal instruction>
iob_intr_1_323:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_323), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_wr_195:
	mov	0x3c5, %r14
	.word 0xf2f389e0  ! 4451: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb69d8000  ! 4452: XORcc_R	xorcc 	%r22, %r0, %r27
	.word 0xbbaa0820  ! 4454: FMOVA	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_184:
	mov	0x12, %r14
	.word 0xfcdb8e60  ! 4455: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb5a50860  ! 4456: FADDq	dis not found

	.word 0xb9a88820  ! 4457: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xbfabc820  ! 4460: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xbbaa4820  ! 4461: FMOVNE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_377:
	setx	0x400021, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xbe8d619b  ! 4468: ANDcc_I	andcc 	%r21, 0x019b, %r31
	.word 0xb3a5c820  ! 4469: FADDs	fadds	%f23, %f0, %f25
iob_intr_1_324:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_324), 16, 16)) -> intp(1, 0, 30)
	lda	[%r19 + %g0] 0xf0, %f2
T1_asi_reg_rd_185:
	mov	0x33, %r14
	.word 0xfedb8e40  ! 4474: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb895c000  ! 4476: ORcc_R	orcc 	%r23, %r0, %r28
	.word 0xb9a84820  ! 4479: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb5abc820  ! 4481: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xbda5c860  ! 4482: FADDq	dis not found

iob_intr_1_325:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_325), 16, 16)) -> intp(1, 0, 11)
cpu_intr_1_378:
	setx	0x40032d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_196:
	mov	0x12, %r14
	.word 0xfcf38400  ! 4487: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_1_379:
	setx	0x430236, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_186:
	mov	0x3c3, %r14
	.word 0xf6db8e80  ! 4491: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbba80820  ! 4492: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
iob_intr_1_326:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_326), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_rd_187:
	mov	0xf, %r14
	.word 0xfadb8400  ! 4496: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T1_asi_reg_rd_188:
	mov	0x19, %r14
	.word 0xfedb84a0  ! 4497: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_1_380:
	setx	0x420013, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_381:
	setx	0x410030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe454000  ! 4508: ADDC_R	addc 	%r21, %r0, %r31
iob_intr_1_327:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_327), 16, 16)) -> intp(1, 0, 22)
	.word 0xbba40920  ! 4510: FMULs	fmuls	%f16, %f0, %f29
	.word 0xbfa40820  ! 4511: FADDs	fadds	%f16, %f0, %f31
cpu_intr_1_382:
	setx	0x410202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa8c820  ! 4514: FMOVL	fmovs	%fcc1, %f0, %f31
iob_intr_1_328:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_328), 16, 16)) -> intp(1, 0, 2e)
cpu_intr_1_383:
	setx	0x430301, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_384:
	setx	0x400020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaac820  ! 4530: FMOVGE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_385:
	setx	0x41021e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_386:
	setx	0x430124, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_197:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 4535: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbf641800  ! 4536: MOVcc_R	<illegal instruction>
	.word 0xbabd4000  ! 4537: XNORcc_R	xnorcc 	%r21, %r0, %r29
	.word 0xb3a548c0  ! 4539: FSUBd	fsubd	%f52, %f0, %f56
	.word 0xba3d8000  ! 4541: XNOR_R	xnor 	%r22, %r0, %r29
T1_asi_reg_rd_189:
	mov	0x30, %r14
	.word 0xfcdb8e40  ! 4546: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_387:
	setx	0x43012e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_388:
	setx	0x40022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe0ca03f  ! 4551: AND_I	and 	%r18, 0x003f, %r31
cpu_intr_1_389:
	setx	0x430027, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_190:
	mov	0x1d, %r14
	.word 0xf0db89e0  ! 4553: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_1_329:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_329), 16, 16)) -> intp(1, 0, 22)
	.word 0xbfa00560  ! 4556: FSQRTq	fsqrt	
T1_asi_reg_rd_191:
	mov	0x4, %r14
	.word 0xf2db8e40  ! 4560: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbfa00560  ! 4567: FSQRTq	fsqrt	
	.word 0x8f902000  ! 4569: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
cpu_intr_1_390:
	setx	0x420132, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_330:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_330), 16, 16)) -> intp(1, 0, 23)
T1_asi_reg_rd_192:
	mov	0x22, %r14
	.word 0xf4db89e0  ! 4574: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_1_331:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_331), 16, 16)) -> intp(1, 0, 2e)
cpu_intr_1_391:
	setx	0x400034, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_392:
	setx	0x430115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6bd8000  ! 4580: XNORcc_R	xnorcc 	%r22, %r0, %r27
	.word 0xbaa5e117  ! 4581: SUBcc_I	subcc 	%r23, 0x0117, %r29
iob_intr_1_332:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_332), 16, 16)) -> intp(1, 0, 18)
	.word 0xbba40840  ! 4587: FADDd	faddd	%f16, %f0, %f60
iob_intr_1_333:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_333), 16, 16)) -> intp(1, 0, 16)
	.word 0x8395e047  ! 4590: WRPR_TNPC_I	wrpr	%r23, 0x0047, %tnpc
iob_intr_1_334:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_334), 16, 16)) -> intp(1, 0, c)
	.word 0xb3a00540  ! 4598: FSQRTd	fsqrt	
iob_intr_1_335:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_335), 16, 16)) -> intp(1, 0, 4)
	.word 0xbfa48860  ! 4604: FADDq	dis not found

	.word 0xb5a54940  ! 4607: FMULd	fmuld	%f52, %f0, %f26
	.word 0xbda84820  ! 4619: FMOVE	fmovs	%fcc1, %f0, %f30
cpu_intr_1_393:
	setx	0x46031e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_394:
	setx	0x47011a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_395:
	setx	0x44011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda409c0  ! 4628: FDIVd	fdivd	%f16, %f0, %f30
cpu_intr_1_396:
	setx	0x470033, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_193:
	mov	0x19, %r14
	.word 0xf8db89e0  ! 4630: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T1_asi_reg_wr_198:
	mov	0x1d, %r14
	.word 0xf0f38e60  ! 4631: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_1_336:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_336), 16, 16)) -> intp(1, 0, 1)
cpu_intr_1_397:
	setx	0x460100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb40d6051  ! 4641: AND_I	and 	%r21, 0x0051, %r26
iob_intr_1_337:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_337), 16, 16)) -> intp(1, 0, 2c)
	.word 0xbb3cf001  ! 4644: SRAX_I	srax	%r19, 0x0001, %r29
	.word 0xbfa9c820  ! 4645: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xb5aa8820  ! 4646: FMOVG	fmovs	%fcc1, %f0, %f26
cpu_intr_1_398:
	setx	0x450207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00020  ! 4648: FMOVs	fmovs	%f0, %f29
iob_intr_1_338:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_338), 16, 16)) -> intp(1, 0, 39)
	.word 0xb5a00520  ! 4650: FSQRTs	fsqrt	
	.word 0xbb3c3001  ! 4651: SRAX_I	srax	%r16, 0x0001, %r29
	.word 0xb9a508c0  ! 4653: FSUBd	fsubd	%f20, %f0, %f28
iob_intr_1_339:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_339), 16, 16)) -> intp(1, 0, 37)
	.word 0xbb2c2001  ! 4657: SLL_I	sll 	%r16, 0x0001, %r29
	.word 0xb3a81820  ! 4659: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xbfa48960  ! 4660: FMULq	dis not found

	lda	[%r20 + %g0] 0xf0, %f2
T1_asi_reg_rd_194:
	mov	0x3c7, %r14
	.word 0xfedb84a0  ! 4664: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb5a58920  ! 4665: FMULs	fmuls	%f22, %f0, %f26
iob_intr_1_340:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_340), 16, 16)) -> intp(1, 0, 27)
	.word 0xb4350000  ! 4668: SUBC_R	orn 	%r20, %r0, %r26
	.word 0x8794a1c2  ! 4670: WRPR_TT_I	wrpr	%r18, 0x01c2, %tt
	.word 0xbb2d3001  ! 4671: SLLX_I	sllx	%r20, 0x0001, %r29
iob_intr_1_341:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_341), 16, 16)) -> intp(1, 0, 3c)
cpu_intr_1_399:
	setx	0x47001b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_342:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_342), 16, 16)) -> intp(1, 0, 30)
	.word 0xb22cc000  ! 4677: ANDN_R	andn 	%r19, %r0, %r25
cpu_intr_1_400:
	setx	0x440032, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_343:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_343), 16, 16)) -> intp(1, 0, 0)
cpu_intr_1_401:
	setx	0x46023f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_344:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_344), 16, 16)) -> intp(1, 0, 26)
	.word 0xbda58840  ! 4683: FADDd	faddd	%f22, %f0, %f30
cpu_intr_1_402:
	setx	0x46011a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_199:
	mov	0x5, %r14
	.word 0xf6f389e0  ! 4687: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb9643801  ! 4690: MOVcc_I	<illegal instruction>
cpu_intr_1_403:
	setx	0x470016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc340000  ! 4696: SUBC_R	orn 	%r16, %r0, %r30
T1_asi_reg_rd_195:
	mov	0x30, %r14
	.word 0xfedb8e40  ! 4698: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_1_345:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_345), 16, 16)) -> intp(1, 0, 35)
	.word 0xb7a00040  ! 4701: FMOVd	fmovd	%f0, %f58
	.word 0xb7a40920  ! 4702: FMULs	fmuls	%f16, %f0, %f27
T1_asi_reg_rd_196:
	mov	0x2c, %r14
	.word 0xf0db8400  ! 4703: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbda5c8e0  ! 4705: FSUBq	dis not found

	.word 0xb7a588a0  ! 4706: FSUBs	fsubs	%f22, %f0, %f27
	.word 0xb33c3001  ! 4707: SRAX_I	srax	%r16, 0x0001, %r25
	.word 0xb1ab8820  ! 4710: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb48dc000  ! 4712: ANDcc_R	andcc 	%r23, %r0, %r26
	.word 0xb5a80c20  ! 4719: FMOVRLZ	dis not found

T1_asi_reg_rd_197:
	mov	0x2f, %r14
	.word 0xfedb8400  ! 4721: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_1_346:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_346), 16, 16)) -> intp(1, 0, 8)
T1_asi_reg_wr_200:
	mov	0x2a, %r14
	.word 0xf8f38400  ! 4728: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T1_asi_reg_wr_201:
	mov	0x3c2, %r14
	.word 0xf6f38e40  ! 4729: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_347:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_347), 16, 16)) -> intp(1, 0, 39)
cpu_intr_1_404:
	setx	0x450030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b56061  ! 4732: SUBCcc_I	orncc 	%r21, 0x0061, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a58940  ! 4736: FMULd	fmuld	%f22, %f0, %f24
T1_asi_reg_rd_198:
	mov	0x3c8, %r14
	.word 0xf8db89e0  ! 4737: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb9a54960  ! 4744: FMULq	dis not found

cpu_intr_1_405:
	setx	0x440137, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_348:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_348), 16, 16)) -> intp(1, 0, 21)
cpu_intr_1_406:
	setx	0x440312, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_349:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_349), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbfa84820  ! 4758: FMOVE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_199:
	mov	0x29, %r14
	.word 0xf2db8e80  ! 4761: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_1_407:
	setx	0x46030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_202:
	mov	0x2e, %r14
	.word 0xfef38e60  ! 4764: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_1_350:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_350), 16, 16)) -> intp(1, 0, 30)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_wr_203:
	mov	0xd, %r14
	.word 0xf4f38e40  ! 4772: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbba81420  ! 4773: FMOVRNZ	dis not found

cpu_intr_1_408:
	setx	0x45031a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_351:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_351), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb3a9c820  ! 4777: FMOVVS	fmovs	%fcc1, %f0, %f25
iob_intr_1_352:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_352), 16, 16)) -> intp(1, 0, 23)
cpu_intr_1_409:
	setx	0x450134, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_410:
	setx	0x46001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc954000  ! 4785: ORcc_R	orcc 	%r21, %r0, %r30
iob_intr_1_353:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_353), 16, 16)) -> intp(1, 0, f)
iob_intr_1_354:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_354), 16, 16)) -> intp(1, 0, a)
T1_asi_reg_wr_204:
	mov	0x22, %r14
	.word 0xf0f38400  ! 4792: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T1_asi_reg_rd_200:
	mov	0x3c8, %r14
	.word 0xf0db8400  ! 4793: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_1_411:
	setx	0x450216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc84a1eb  ! 4796: ADDcc_I	addcc 	%r18, 0x01eb, %r30
	.word 0xb02cc000  ! 4799: ANDN_R	andn 	%r19, %r0, %r24
	.word 0xb1a94820  ! 4805: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xbba449e0  ! 4808: FDIVq	dis not found

cpu_intr_1_412:
	setx	0x460332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a88820  ! 4810: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb3a00540  ! 4812: FSQRTd	fsqrt	
	.word 0xb5abc820  ! 4813: FMOVVC	fmovs	%fcc1, %f0, %f26
iob_intr_1_355:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_355), 16, 16)) -> intp(1, 0, 34)
T1_asi_reg_rd_201:
	mov	0x31, %r14
	.word 0xf6db8e60  ! 4817: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T1_asi_reg_rd_202:
	mov	0x22, %r14
	.word 0xfadb8e80  ! 4819: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T1_asi_reg_rd_203:
	mov	0x20, %r14
	.word 0xf6db8400  ! 4821: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb1a508a0  ! 4822: FSUBs	fsubs	%f20, %f0, %f24
T1_asi_reg_rd_204:
	mov	0x11, %r14
	.word 0xfcdb8e80  ! 4824: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb9a00520  ! 4826: FSQRTs	fsqrt	
T1_asi_reg_wr_205:
	mov	0x3c1, %r14
	.word 0xf8f384a0  ! 4827: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb3abc820  ! 4828: FMOVVC	fmovs	%fcc1, %f0, %f25
iob_intr_1_356:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_356), 16, 16)) -> intp(1, 0, 29)
cpu_intr_1_413:
	setx	0x460215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a588e0  ! 4832: FSUBq	dis not found

iob_intr_1_357:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_357), 16, 16)) -> intp(1, 0, 7)
iob_intr_1_358:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_358), 16, 16)) -> intp(1, 0, 3b)
	.word 0xbc254000  ! 4836: SUB_R	sub 	%r21, %r0, %r30
	.word 0xbba00540  ! 4837: FSQRTd	fsqrt	
	.word 0xbf7c4400  ! 4839: MOVR_R	movre	%r17, %r0, %r31
cpu_intr_1_414:
	setx	0x470121, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_415:
	setx	0x47030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b44000  ! 4849: ORNcc_R	orncc 	%r17, %r0, %r28
	.word 0xb1a448c0  ! 4850: FSUBd	fsubd	%f48, %f0, %f24
T1_asi_reg_rd_205:
	mov	0xd, %r14
	.word 0xf8db8e60  ! 4851: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb2b40000  ! 4855: SUBCcc_R	orncc 	%r16, %r0, %r25
cpu_intr_1_416:
	setx	0x44010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfab0820  ! 4863: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb23d60d9  ! 4868: XNOR_I	xnor 	%r21, 0x00d9, %r25
T1_asi_reg_rd_206:
	mov	0x13, %r14
	.word 0xf6db8e80  ! 4880: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb57c8400  ! 4881: MOVR_R	movre	%r18, %r0, %r26
	.word 0xbba00020  ! 4882: FMOVs	fmovs	%f0, %f29
	.word 0x8995a09c  ! 4883: WRPR_TICK_I	wrpr	%r22, 0x009c, %tick
iob_intr_1_359:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_359), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb3a50860  ! 4885: FADDq	dis not found

iob_intr_1_360:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_360), 16, 16)) -> intp(1, 0, 13)
iob_intr_1_361:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_361), 16, 16)) -> intp(1, 0, f)
	.word 0xb2acc000  ! 4891: ANDNcc_R	andncc 	%r19, %r0, %r25
iob_intr_1_362:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_362), 16, 16)) -> intp(1, 0, 24)
	.word 0xb3a9c820  ! 4895: FMOVVS	fmovs	%fcc1, %f0, %f25
iob_intr_1_363:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_363), 16, 16)) -> intp(1, 0, 24)
cpu_intr_1_417:
	setx	0x460314, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_207:
	mov	0x30, %r14
	.word 0xf8db8e40  ! 4901: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_rd_208:
	mov	0x21, %r14
	.word 0xf8db8400  ! 4903: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbba90820  ! 4904: FMOVLEU	fmovs	%fcc1, %f0, %f29
iob_intr_1_364:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_364), 16, 16)) -> intp(1, 0, 28)
T1_asi_reg_rd_209:
	mov	0x3, %r14
	.word 0xf2db89e0  ! 4911: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb1ab8820  ! 4913: FMOVPOS	fmovs	%fcc1, %f0, %f24
iob_intr_1_365:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_365), 16, 16)) -> intp(1, 0, e)
	.word 0xbb50c000  ! 4915: RDPR_TT	<illegal instruction>
T1_asi_reg_wr_206:
	mov	0x8, %r14
	.word 0xfef384a0  ! 4917: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb485c000  ! 4918: ADDcc_R	addcc 	%r23, %r0, %r26
	.word 0x8395608f  ! 4922: WRPR_TNPC_I	wrpr	%r21, 0x008f, %tnpc
	.word 0xb1a00540  ! 4923: FSQRTd	fsqrt	
cpu_intr_1_418:
	setx	0x440108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80c20  ! 4925: FMOVRLZ	dis not found

	.word 0xb5a509e0  ! 4926: FDIVq	dis not found

	.word 0xb3a80420  ! 4927: FMOVRZ	dis not found

cpu_intr_1_419:
	setx	0x46033d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_366:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_366), 16, 16)) -> intp(1, 0, 39)
cpu_intr_1_420:
	setx	0x46033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_210:
	mov	0x1f, %r14
	.word 0xf6db8e80  ! 4931: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbba81420  ! 4933: FMOVRNZ	dis not found

	.word 0xb7a81820  ! 4935: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xb3ab8820  ! 4938: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb9a8c820  ! 4940: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xbca5e17a  ! 4945: SUBcc_I	subcc 	%r23, 0x017a, %r30
	.word 0xb9a48920  ! 4946: FMULs	fmuls	%f18, %f0, %f28
	.word 0xbba94820  ! 4947: FMOVCS	fmovs	%fcc1, %f0, %f29
iob_intr_1_367:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_367), 16, 16)) -> intp(1, 0, 9)
	.word 0xb1a94820  ! 4949: FMOVCS	fmovs	%fcc1, %f0, %f24
iob_intr_1_368:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_368), 16, 16)) -> intp(1, 0, 3d)
iob_intr_1_369:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_369), 16, 16)) -> intp(1, 0, 2)
iob_intr_1_370:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_370), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb3a80820  ! 4955: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
iob_intr_1_371:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_371), 16, 16)) -> intp(1, 0, 31)
	.word 0xb3a509a0  ! 4960: FDIVs	fdivs	%f20, %f0, %f25
cpu_intr_1_421:
	setx	0x44031b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_372:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_372), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb63cc000  ! 4964: XNOR_R	xnor 	%r19, %r0, %r27
cpu_intr_1_422:
	setx	0x460235, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_373:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_373), 16, 16)) -> intp(1, 0, 17)
iob_intr_1_374:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_374), 16, 16)) -> intp(1, 0, 24)
cpu_intr_1_423:
	setx	0x460130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf2cc000  ! 4971: SLL_R	sll 	%r19, %r0, %r31
T1_asi_reg_wr_207:
	mov	0x3c2, %r14
	.word 0xfef389e0  ! 4973: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb3a9c820  ! 4974: FMOVVS	fmovs	%fcc1, %f0, %f25
iob_intr_1_375:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_375), 16, 16)) -> intp(1, 0, 22)
	.word 0xb1a589c0  ! 4977: FDIVd	fdivd	%f22, %f0, %f24
	.word 0xb5a00520  ! 4978: FSQRTs	fsqrt	
cpu_intr_1_424:
	setx	0x460005, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbb3d7001  ! 4984: SRAX_I	srax	%r21, 0x0001, %r29
cpu_intr_1_425:
	setx	0x45002a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_208:
	mov	0x3c5, %r14
	.word 0xf4f384a0  ! 4987: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbda9c820  ! 4990: FMOVVS	fmovs	%fcc1, %f0, %f30
iob_intr_1_376:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_376), 16, 16)) -> intp(1, 0, 23)
	.word 0xb9a549a0  ! 4998: FDIVs	fdivs	%f21, %f0, %f28

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

	.xword	0x026ecf6aa8f664bf
	.xword	0xa1589813c5f25eb6
	.xword	0xfb29cb41b3347593
	.xword	0x82ca309fcfa0a4bd
	.xword	0xa043a6ed9928442d
	.xword	0xe7cb41946717d74a
	.xword	0x20612f5d839110a9
	.xword	0x229c8dd6a7d8b786
	.xword	0x740ca44e9cfaedc6
	.xword	0x1a0d7d0d23e1468d
	.xword	0x5d1b73331549269c
	.xword	0x2f65ea2cab3893be
	.xword	0xa2e04b6d45f955c7
	.xword	0x09d8920ff9d9431e
	.xword	0xf25edbe53ca66009
	.xword	0x56a8e1dfef0f0ec1
	.xword	0xce35dd67a9b9bdbf
	.xword	0x673add0f667175e8
	.xword	0xbe316fb96accdada
	.xword	0xb6be0c74d279f27d
	.xword	0xdff3bec081f96da6
	.xword	0xc8a161933a2839fa
	.xword	0xcad67993024719d2
	.xword	0x4a510dd6aa0bc5ad
	.xword	0x3fceda962a8011f6
	.xword	0x3ac751e38b93c608
	.xword	0xcc375fe34c368627
	.xword	0x6d65344d70b4bd86
	.xword	0x75b112478e5f1009
	.xword	0x538ee41b41953738
	.xword	0xb351edc8f03f2828
	.xword	0x543c5774b4fcf0cf
	.xword	0xe8e143eae9208262
	.xword	0xa0421dd3673af845
	.xword	0x31b8d5430dbdec95
	.xword	0xea1ef113f976f916
	.xword	0xc0a8f7f5d6f073b0
	.xword	0xcbba0edc8867ef56
	.xword	0xaf97a6d8f9a0d12e
	.xword	0x0a77df2029e145b0
	.xword	0xded180b11f7017f8
	.xword	0x6a86b971c793c05d
	.xword	0xa7ea99b67be66459
	.xword	0x24ea13a489a3e403
	.xword	0x3606e1ecf53e290d
	.xword	0xc5ae6875e5666585
	.xword	0xbe9833d5ecdf724c
	.xword	0x84f3e4b1f0840be0
	.xword	0xfe93233e602ca3b6
	.xword	0xe0e5ded1085ab44f
	.xword	0x325c62068892c3b4
	.xword	0xb4ea29c94a3d01cb
	.xword	0xfcf12b059959f56d
	.xword	0x02c4db44faadb893
	.xword	0x1701d1650dd760de
	.xword	0x5c2044ddb0c04935
	.xword	0xe13155197d864d21
	.xword	0xeb819575794a56a9
	.xword	0x394d51d8779160f4
	.xword	0x75e322ded05979a3
	.xword	0x97e26dd430873ca6
	.xword	0xa305c53a570f527e
	.xword	0x4a5b9dffb2e8ac30
	.xword	0xd04acc40ac3aa416
	.xword	0x7b7906688833d68b
	.xword	0x816679cd1f8e50ba
	.xword	0x772b973a354c51d2
	.xword	0x046eb3e53955bd42
	.xword	0x31000a8e079fd584
	.xword	0xa4f160d3576fce84
	.xword	0xf1fd3b0b34e5be6f
	.xword	0x5b0b3d5ff84c77ab
	.xword	0x26c80271c21fd757
	.xword	0xd1c7ac0a3c914073
	.xword	0x6a467bdc0d52f1d0
	.xword	0x150372993b660589
	.xword	0x9925ba292b3fad02
	.xword	0x3074d2465339999b
	.xword	0x4aa9ff3209430da1
	.xword	0xdcaf8d9a67400f91
	.xword	0xce957540516d8e2c
	.xword	0x54e5a98bd095f38d
	.xword	0x6a7223da93c49b32
	.xword	0x0c0c44155b0d53bb
	.xword	0x9c591c1ebe8a0f88
	.xword	0x5a36bb99a56be5bd
	.xword	0x05c0f48bb98d8155
	.xword	0x641f7d1fa25e3825
	.xword	0xddfc34b377f209f7
	.xword	0x8db67a3126dc5460
	.xword	0x4d757c38b63471b8
	.xword	0x3a491ccb45358120
	.xword	0x9caf13cbaee78d68
	.xword	0xdb7265be71d2163a
	.xword	0x7d8ade1c6a665a6d
	.xword	0xff9fa2c03325d3c7
	.xword	0x3ec2b97f5fe19012
	.xword	0x38bffb6752217b77
	.xword	0x56b135ff3192c041
	.xword	0x2ff750a6e9ed653c
	.xword	0x459cf300aa307b14
	.xword	0xd94c7acf5172b12c
	.xword	0x963e91976de47deb
	.xword	0xf7617b2a887cb4f4
	.xword	0x49eee721a2d8d382
	.xword	0x9c2ff1693860e664
	.xword	0xb8999f0149213527
	.xword	0x7e9d4714b929e260
	.xword	0x0f767b409b206160
	.xword	0x17e2a33243c63cc8
	.xword	0x1242cc485359903d
	.xword	0x7b7fb47ba7173401
	.xword	0xe4b82bb2109b49b1
	.xword	0x53775733e8b234d0
	.xword	0x71a200bd7cac63e1
	.xword	0x1c8a4700cdb02469
	.xword	0x1cf90c2513227b47
	.xword	0x65416e541012e855
	.xword	0xd8995f187f1ab626
	.xword	0x0aa52b60bab899e5
	.xword	0x77214aaa369839f8
	.xword	0x2712c3cb4165c5e9
	.xword	0x67f179b6c64a31fb
	.xword	0xcbbfab80af3680f8
	.xword	0x3daa09a360e6f13d
	.xword	0x6116644bf33471ad
	.xword	0x735947cff243587d
	.xword	0x465ccbe2ff49d1e3
	.xword	0x2780aa3d528d1a0f
	.xword	0xb9690279ff6ab616
	.xword	0xd14644348110e0ab
	.xword	0x9da6badba16cca8d
	.xword	0x07ca7bae60037f44
	.xword	0x30162a666025b7d8
	.xword	0x38fbcd78847f75bd
	.xword	0xa7bdbd9a5138b652
	.xword	0x990753b4f98376a8
	.xword	0x8feb73a0d64dcbd0
	.xword	0xd60b556afa0e92d3
	.xword	0xa9e0b0538172a517
	.xword	0x8a805ea3fdb1c117
	.xword	0x1b7853acbc165f09
	.xword	0x31846578d1c44685
	.xword	0x4c112943747c60ea
	.xword	0xd71fb21774bb1ad9
	.xword	0x42494034f4ef4538
	.xword	0xf78105f6dc7520c1
	.xword	0x6834b55feca67c52
	.xword	0xce6e4251e550c616
	.xword	0x26a917d8689ec34e
	.xword	0x42c467565515a74e
	.xword	0xb8caa5f174a5c71a
	.xword	0x9f8f80836f970b53
	.xword	0xb9b69aecac924809
	.xword	0xff067c7b84bc56a6
	.xword	0x23ffd80e9f4c559b
	.xword	0x5bed358b40275241
	.xword	0xb727d82058e2a87a
	.xword	0x0fa03cc804e7610c
	.xword	0x53ca62a5a1e6720d
	.xword	0xf02b7d42465500e1
	.xword	0xe52eb4184e8848c9
	.xword	0x7ed8700fd4ca9caa
	.xword	0xb83c5a3b3e51c185
	.xword	0xc13638c869ba8b2f
	.xword	0xfd1a6c52f43d39f5
	.xword	0x92fc58180ba11f3d
	.xword	0x65308282b05e841b
	.xword	0x7b058a659bead2db
	.xword	0x1cd483ef94aae2ab
	.xword	0x81cfa241cd630e4a
	.xword	0x0f9cbe6a60aed50d
	.xword	0x897935132f6e9d59
	.xword	0x13ac0e0ddbc84e62
	.xword	0x26d99fa1134e638d
	.xword	0x82697d163b40ae1d
	.xword	0x936d683932112cde
	.xword	0x1dbddec2ce3354ce
	.xword	0x8390977cad37914e
	.xword	0xe881df2952c8a828
	.xword	0xb660461ac9ff7ae1
	.xword	0x857e08c1537a6ce2
	.xword	0xef13c7b5ce93ca3e
	.xword	0x0e947a27872f3847
	.xword	0xc88480d8f261bb30
	.xword	0xe481bbfda4a61f1a
	.xword	0x2794c5ea18548b65
	.xword	0x6831290bb9a38968
	.xword	0x49d6f715c4547072
	.xword	0xe8463ee8faa7a71e
	.xword	0x72d2a32a1267083a
	.xword	0x297d34479aed8ab1
	.xword	0x288b13aa44819cfd
	.xword	0x628f204242bf021c
	.xword	0x85ea52f8f5eb57a5
	.xword	0xbf113a0583675ed5
	.xword	0xa5706f9d7cb945a8
	.xword	0x49bdabd3db8ea8ca
	.xword	0xd5a2551a73a9c78e
	.xword	0xad9619db56d9b538
	.xword	0xc286883733a4edf6
	.xword	0x4d594cbd0e19a92e
	.xword	0x49198af247ce44e1
	.xword	0xe43537ce9fa97555
	.xword	0x13ae0f54c652cc1c
	.xword	0x60e64b4fe91a536c
	.xword	0xf20393b3e1bd309d
	.xword	0xb0fb03ad54eb52ec
	.xword	0xc268ed09ef2c93da
	.xword	0xf7360a033c17f43d
	.xword	0x92e21eda105ddb93
	.xword	0x9f5ffe6578959fe5
	.xword	0x2844f4fd02ebc883
	.xword	0x84a568c7838777eb
	.xword	0x44a2f020f6dbe2ef
	.xword	0x0454b1199e8e3fc1
	.xword	0xeb7593029611cec0
	.xword	0xac36a7b365f7dfb3
	.xword	0x1b49b64e78c6b479
	.xword	0x29ab0a7460aada58
	.xword	0xa4bc2be5e7d2c195
	.xword	0xad64286d02ee103e
	.xword	0x28431d7856b58bbf
	.xword	0xcc3c3cd5195f0c77
	.xword	0xa9836a35ff0550fb
	.xword	0xa09fd4f72a17d4c3
	.xword	0xea58b1046e211a0f
	.xword	0x333bf2fb5828c51f
	.xword	0x05f1d9e920419c2d
	.xword	0x2492e9829fa0e072
	.xword	0x2c007450035a0b28
	.xword	0x994766237fe9db4d
	.xword	0xa8ec4088d78262b4
	.xword	0xd62ea926b4a9488f
	.xword	0x0643efe9dce4cea0
	.xword	0x970b7bcdec32c3a8
	.xword	0xf2fa5af9c23f9227
	.xword	0xf4f0c6ebd7c9ad4b
	.xword	0x288a51ce51c822d7
	.xword	0xc9f06f4a4cf8eef2
	.xword	0xba6457cb011b09db
	.xword	0x6da149519ab6c6d0
	.xword	0xb3efc0cbbd959bb5
	.xword	0x2b85ac73bd5abe16
	.xword	0x115fbe6ec10a0c2d
	.xword	0x9da60e9e7ed55c90
	.xword	0x9bed9826d6834f96
	.xword	0x915ea61cdced716e
	.xword	0xbe6a52dcf86c6d00
	.xword	0xea941167dc60d2b5
	.xword	0x0584d4f4b7e3d2d5
	.xword	0xd13c52fb76d799c8
	.xword	0xe8f600fd0ebc9548
	.xword	0xa56949ec33f22e73
	.xword	0xc81b61f944236e14
	.xword	0xf74ade173d927a81
	.align 0x2000
	.data
data_start_1:

	.xword	0x778030d3dba026b7
	.xword	0xb0cd537e49742afc
	.xword	0xd96d7b7ac682bfcc
	.xword	0xc7b61dc9035aba23
	.xword	0x843248e91258b65d
	.xword	0xdd515d3ce99a7caf
	.xword	0xec8c6d07ef04af8b
	.xword	0xa1906fc99cebf0d9
	.xword	0x7c971f79698f7395
	.xword	0x0f7a91f2883a8ddf
	.xword	0x5624ade77fb55fdc
	.xword	0x018b1dbddc54f231
	.xword	0xd3818345508c053a
	.xword	0x7a9c6661f57b1dc0
	.xword	0x6f9e72acf7db0d74
	.xword	0x263b43df9358e112
	.xword	0xf6e6f3abf03c1b3a
	.xword	0x99ea4724dbcd6d08
	.xword	0x15ed4737559a3492
	.xword	0xe31ea55d2745929f
	.xword	0xcfed521f0336d904
	.xword	0x1ac4bfcdde5fadba
	.xword	0xa93878447dec6b63
	.xword	0xdd013386dcade44f
	.xword	0x46f1848080350234
	.xword	0x99ca98068b10a01d
	.xword	0x19219122a91e8eb7
	.xword	0x4adb05c0aea8d328
	.xword	0xa63fa22429198f82
	.xword	0x4167f2666dcf88f0
	.xword	0xa9471afcffed8b2e
	.xword	0x4dc98a7da1feb57d
	.xword	0x0d8d77ea90f0961d
	.xword	0x0dc05dbc2a9dbcf1
	.xword	0xbc6a2631eac1717c
	.xword	0x1e42ccc1eb52f58e
	.xword	0x18bbc35f08ae158d
	.xword	0x5aa3441f6258ba07
	.xword	0x837a3d005b10664d
	.xword	0x30ddcb38b44aa924
	.xword	0xccad3be7f8bc1113
	.xword	0x6bd9386a02d1001d
	.xword	0xb896fb19e6404bc8
	.xword	0x2bac43f19f5bd51f
	.xword	0xd69b6dfc4613c421
	.xword	0x7c1cd9e5f3539be9
	.xword	0x26fe54d2b5f41f20
	.xword	0x752e1775af5bdbdf
	.xword	0xb306779b01abc9d6
	.xword	0x6e4f7dda88c4edf9
	.xword	0x22bc52605de38b04
	.xword	0xce3d7377fa73432b
	.xword	0xeec993f8bab2e0a3
	.xword	0x4c175451c2fb4ce6
	.xword	0x3092c9dc269333d3
	.xword	0x7256fcb9b3360262
	.xword	0x818c37a86ad09299
	.xword	0x1e6b2b37d5e80646
	.xword	0xa5ee6b6f8f156da1
	.xword	0x527b13fc905a69c6
	.xword	0x68f17bf0a6f6e03c
	.xword	0x0c0cd41ea3d78d2f
	.xword	0xb2a78dfc0630dfd1
	.xword	0x0d91eaa9daa2a0fa
	.xword	0xc33e32c03e1daf01
	.xword	0xa9532ff7fdbf7c98
	.xword	0xa3638cf62cebe71c
	.xword	0xc8e0d0e9150ab5a7
	.xword	0xdbf70eef88dd1b9d
	.xword	0x061da1b18e439529
	.xword	0x50523533f9339432
	.xword	0x83bb261a2f45f31e
	.xword	0xb1994e44aadc2f53
	.xword	0x5935ab65cbd01914
	.xword	0xfc9ecfd7b6a43063
	.xword	0x03b8b03f65484e56
	.xword	0x8788b19a70e9d24f
	.xword	0x2384a5a3a9a291f1
	.xword	0x46296af687923a9f
	.xword	0x20fa3b5e7a1ccd71
	.xword	0x7cb6ba9a3e0a315d
	.xword	0xcd17804828239fbf
	.xword	0x840f1aa4cdee93fb
	.xword	0xc95d884663220367
	.xword	0x9591ecad8d8c1a04
	.xword	0x19e4945cf19ca25a
	.xword	0x3a1cd0e325cfaedd
	.xword	0xc3391d0eef81079e
	.xword	0xa9c22c70244221b5
	.xword	0x4edc73410dfd4485
	.xword	0x97741f6588e81fef
	.xword	0xc8e92a064abba3ac
	.xword	0x67ba520fa271b316
	.xword	0x1007d9848c7dd5c6
	.xword	0xc408f6a70564a8c5
	.xword	0x35a9faa98b3a227b
	.xword	0xe5a5bfb9d8dd3b03
	.xword	0x19b5dbb58fa63221
	.xword	0xa18d5baf531b15b0
	.xword	0x16b015948e4a2a6e
	.xword	0x7a9a244452230ebe
	.xword	0x42409405a06fb5e9
	.xword	0x64637f0cb67fcb22
	.xword	0x8853dc5737c6ac29
	.xword	0xfaae4af64345228d
	.xword	0x376207f83dc75ad9
	.xword	0x2ddcf6ffda8860a7
	.xword	0xd59367a6dfa4e061
	.xword	0x9b2ac81cdf331497
	.xword	0x741ece3c67b8960a
	.xword	0xcad1a1a873977688
	.xword	0xdd1bf9fcf470c42e
	.xword	0x33a29c9d245ef7d9
	.xword	0x45009a136f508f33
	.xword	0xf59265687c764109
	.xword	0x9d91cbf1a17f3519
	.xword	0x91dff75a2df5c1cd
	.xword	0xe10016ce74aebe67
	.xword	0xe43bb101127564b5
	.xword	0x8e2ea3f7a4ae1be6
	.xword	0x13c3bd0653a89e2e
	.xword	0x43333302118e6bdc
	.xword	0xcbd77b2ec441bcfd
	.xword	0x5c7e4efea5533b8b
	.xword	0x0359b2bb4376aab8
	.xword	0x7496354fdf6f14f5
	.xword	0x3aec862cc22b5180
	.xword	0xbc7f66f720a76144
	.xword	0xd274ac1e94685f95
	.xword	0x37bd04ffeb67e879
	.xword	0x2e0a5685076a2dbc
	.xword	0x3c97fbb02f74f505
	.xword	0xaf45a1c3013f7d2f
	.xword	0x598d9253cea44951
	.xword	0x71be6dfcab2439b6
	.xword	0x894bc5c4c2076c78
	.xword	0xb7627b68d9444cd2
	.xword	0x75ee69f0945c78f1
	.xword	0x673c4b10152e584d
	.xword	0xdb388a885138867a
	.xword	0x816d1a55427dd55b
	.xword	0x0bc90f0522cda7a6
	.xword	0xff37952db7e36374
	.xword	0x1ba567beaf937186
	.xword	0x5566fd4046fb9768
	.xword	0x9bd40b9233c92434
	.xword	0x84b97a46cf7ab38e
	.xword	0xd72293bf3d084e7c
	.xword	0x6a3720ef415345e9
	.xword	0x1be33d8e609c3f53
	.xword	0x0247c262ea7d8b07
	.xword	0x2d427d746474e771
	.xword	0x1ac2c18fa8be57db
	.xword	0x4194de36165b8a4c
	.xword	0x9cb8765a6f394a22
	.xword	0xb95ac82845d5e3ff
	.xword	0xe89ef290d7ecbf10
	.xword	0xefcfbe29b85f738f
	.xword	0x2570dd002c4c1d23
	.xword	0x240f2af36d53f7ae
	.xword	0xae25406dfe71b505
	.xword	0x633ffd317b19c95f
	.xword	0xc614f61a58fed601
	.xword	0x3b5d7c02436cb7a0
	.xword	0xdd27eca75b2e1fce
	.xword	0x6192f1d5c58f7fb9
	.xword	0xb67a2e4a8cca6d3b
	.xword	0x017c70ea4137e389
	.xword	0xa87a01196649c6b8
	.xword	0x8516988c7d4e9d35
	.xword	0x41544d131c17267d
	.xword	0x8323d29616203fdc
	.xword	0xdf9d0c8fbe26296b
	.xword	0x686815d07ce086c9
	.xword	0xf937aabe8aa3301b
	.xword	0xabf4865d4e707e03
	.xword	0xb9ae5ff671d25b51
	.xword	0xe58f9872e5068ce6
	.xword	0x5fc2055e45fcd935
	.xword	0x0f5d7b6e3dc3c94f
	.xword	0x0a3af49dc0bc715e
	.xword	0x03cc5dce0e900a9f
	.xword	0x9b4ff79dfef793d9
	.xword	0xde85620c91a52493
	.xword	0xf271ccce4006e53d
	.xword	0x47858c6a1cec5b88
	.xword	0xbea736632a49fafd
	.xword	0x194f0f18be66d090
	.xword	0xfbcdbb975c37784e
	.xword	0x14a33353abc720f8
	.xword	0x7c626784300f1d60
	.xword	0xc42008049cf707d5
	.xword	0x9a1b04d7175bd853
	.xword	0x730d424f9317cc53
	.xword	0x19fdf9eafa168191
	.xword	0xbc3a0230a70d00c1
	.xword	0xafec1d039d8450ee
	.xword	0x9d61fa0e61730c7d
	.xword	0xabdb4f76dae3a24f
	.xword	0xec28f97c62d0d720
	.xword	0x9af684592b14b57b
	.xword	0xaffac458385a94d8
	.xword	0x9221fc49a0fd9914
	.xword	0x394193e18c320f64
	.xword	0xd01b3d3e4cfc4c08
	.xword	0xb417dbd28e53a88b
	.xword	0x3e6fd46c9be50ea2
	.xword	0x2a16ac689cca192b
	.xword	0x1bf9e1a91b2d0f7b
	.xword	0x1575fe87d7864f52
	.xword	0x263f15aa0f3fe9c9
	.xword	0x553564228802e508
	.xword	0x6d4dbd144a7bf886
	.xword	0x4138315736c5002b
	.xword	0x0b5ff4fb13b7e77f
	.xword	0x5ea0a2d664b54c20
	.xword	0xc95aa8e40146ae29
	.xword	0xb53151ce89b2b001
	.xword	0x945960d477f540c4
	.xword	0x46ff2a35f1bd3043
	.xword	0xe1b33f9bb4a099e4
	.xword	0xabd46641638c8d9d
	.xword	0xa74e20fc03c1b735
	.xword	0xd50ba9ac84e81486
	.xword	0x53a6e4b8124ddd8e
	.xword	0x5063846a87beaef1
	.xword	0xb2fe412ed3cb3c6d
	.xword	0x0d19c08ad3caee03
	.xword	0xe5decb891887c256
	.xword	0xce044664a8b8ba71
	.xword	0x3377cd06ed5c3d56
	.xword	0xee7c70f48189c77e
	.xword	0x72f06e4ad51a5ca9
	.xword	0x3644c47056ef8739
	.xword	0x17ccaf8fc0282cfd
	.xword	0xe8e18cdf5784d63b
	.xword	0x454090cff9281d7f
	.xword	0x35519b7bb0049d14
	.xword	0x3adb7d28df97a0fb
	.xword	0xd250ade11814440f
	.xword	0x23643285c3a6dfc2
	.xword	0xe3a8822e40ef3a0e
	.xword	0xb1c158eab7ff82bd
	.xword	0xa92127093ef16072
	.xword	0x1c7a574013d37a25
	.xword	0xe760c7557c79fd08
	.xword	0xf23942ed95994ae7
	.xword	0x9ea843b467d37c4b
	.xword	0xc5d41d4181dcf37b
	.xword	0xf93c6b5f17d0ec27
	.xword	0xda2e4b838b8dc646
	.xword	0x183eef743d3092bb
	.xword	0x5034c1cec48912d4
	.xword	0x60515be06a73fb7f
	.xword	0x10d5985c055da4ed
	.xword	0x2aefdacf5be4fc12
	.align 0x4000
	.data
data_start_2:

	.xword	0x2b5c7647fd7a7bb8
	.xword	0x88e11b340ebddcb9
	.xword	0x799df18e56f280c2
	.xword	0xd939733bf79f98a2
	.xword	0x3692f0057fdebfcf
	.xword	0xafd37b86fe5d213b
	.xword	0xc2d671fd9edb2e3f
	.xword	0xd783549b46c80f56
	.xword	0x247abbafdbf74660
	.xword	0x43c6a069ab3c4b2b
	.xword	0x93d5c68bf869ae37
	.xword	0x92508ea4ef7f0052
	.xword	0x3c8292aebb1d0a62
	.xword	0xd76dbba15312e335
	.xword	0xcc8330571aec1f7a
	.xword	0xa6de8697aa0efa79
	.xword	0x580d2029de816058
	.xword	0x9fb133af5cf2c59b
	.xword	0xa9e251f006da72e2
	.xword	0x618f0a9a99e7c446
	.xword	0x1cccb00b9cb3f10e
	.xword	0xb625d3beac68db31
	.xword	0xb55b02c2b53642bd
	.xword	0x3b66acb4863168b0
	.xword	0xb1b5975626772b0d
	.xword	0x39a549e2fcd0fb5d
	.xword	0xea31aefeb8963c1a
	.xword	0x098693f87732a766
	.xword	0x4053474ca525eb34
	.xword	0x86ebbc784aaca0e7
	.xword	0x6c1a18676755e099
	.xword	0x7d387dfbc408de0c
	.xword	0xa6d29f2e873c652b
	.xword	0x8b4c7919099b132a
	.xword	0xcc1f7155f5adc4f1
	.xword	0xa47fa9b844d799fa
	.xword	0x7a254d1de35e9cd4
	.xword	0xef5017fd7c119b56
	.xword	0x8015a8f9091b9de8
	.xword	0x34f36b5e724f9c1a
	.xword	0xee8fa924b5e71cd7
	.xword	0x97b4630e2678dc71
	.xword	0x018b7e2b8a01874f
	.xword	0x0f40cffa70d156cc
	.xword	0xd727ae181358c0b1
	.xword	0x82a6fe57daa2dc3e
	.xword	0x7f931dbd0b453774
	.xword	0xd65ff5f773dcf228
	.xword	0x117f7affe9979663
	.xword	0x343a25e743404d6f
	.xword	0x1dfc38ccf188157c
	.xword	0x6dd01a05dbb54957
	.xword	0x9189df21a564c7b0
	.xword	0x1189be9a440895d3
	.xword	0xd0fc74d7e0bba64e
	.xword	0x83ddd09ac6a9544c
	.xword	0x9a844628ebb07f2b
	.xword	0x49c3f91de701ad3a
	.xword	0xf35e4c12b464bcab
	.xword	0x065306ca7e6ed368
	.xword	0x31a4dec1a0d66c89
	.xword	0x7d77ccea7d5732b3
	.xword	0x4a648b6c158426d6
	.xword	0xea3567c96c13a116
	.xword	0xbbd0489225e0f402
	.xword	0x33fc7565555d3aed
	.xword	0xf1f69af2a92528d7
	.xword	0x42433cb1a65a8365
	.xword	0xcb31fbb02b928f20
	.xword	0x67e90f7679ef82a2
	.xword	0x9950a85437e77e4f
	.xword	0xe23346172fcfa874
	.xword	0xb88231067ae762ea
	.xword	0x8838efedc3aa19e4
	.xword	0x0ce227b1629235d2
	.xword	0x2ec45f2bed69e8bd
	.xword	0x2bb30cff39f7a68c
	.xword	0x1732047ca8852048
	.xword	0x67dd9bf9cd2b8903
	.xword	0x788ffa27cd5d4411
	.xword	0x569a23bf7e198a3b
	.xword	0x716e8e8031a870e3
	.xword	0x31039e874775d9d6
	.xword	0x8c48582d7eaca753
	.xword	0xce6b0910541ffec8
	.xword	0x34a7e27db2bdc90f
	.xword	0xb68ab2e304e44155
	.xword	0x88f274219c548cec
	.xword	0x68314ab62d1aae55
	.xword	0xa46a332f248c1988
	.xword	0x4e994f46f0025734
	.xword	0x031dc74052df5149
	.xword	0xc0e91da9a43ee86f
	.xword	0xd8cb6a72bf4efcf8
	.xword	0x94c0cf63c7ad6411
	.xword	0x56d364daf886c4e9
	.xword	0x393981c5bc27ef52
	.xword	0x3357c68764d65ebd
	.xword	0x2fc53babed875f2e
	.xword	0x42bfaf3049e2bec7
	.xword	0x50a30e09e079c964
	.xword	0x9e0c64b65b234cf2
	.xword	0xe6e64b1face8e3f6
	.xword	0x9b9b9e370c81a070
	.xword	0xd8d7c1c082925dfe
	.xword	0x46e50d517e07fa51
	.xword	0xec82036805044731
	.xword	0x9f8fa7e34f0803db
	.xword	0x9a80d2c4dec8be53
	.xword	0x8556ed722ff761ce
	.xword	0xca1cd39b80047486
	.xword	0x89e99fc39b9e0052
	.xword	0x28cb756f11652e96
	.xword	0x25ffe11d591b1709
	.xword	0xb2a8dce9425c60ad
	.xword	0x8f8ff61c4735d8a0
	.xword	0xb8f11ddb24dc8419
	.xword	0x303fa682d4093643
	.xword	0x3b812dbcebd14d77
	.xword	0x7ae00c08b701c43a
	.xword	0xf3581e73eae33eae
	.xword	0x5bffe85c53d0d559
	.xword	0x690e3f2af77d99cf
	.xword	0x44a79658e6df5318
	.xword	0xe1688fb696fd2808
	.xword	0x426a321f14b994cc
	.xword	0x96ddb977418e75ec
	.xword	0x278f082d78d57267
	.xword	0x4d5d843a68fc8f81
	.xword	0x42f5f7165e26a01c
	.xword	0xd238b9a38a88fd0d
	.xword	0x184f68759e013667
	.xword	0xae2894b261f4db62
	.xword	0xe09caa0f74ed92c9
	.xword	0x2a854ac37c07bffc
	.xword	0x2dcf9e2af0c23fb8
	.xword	0x43b1bd4c30e415b5
	.xword	0x4deb40a208e53148
	.xword	0x11bbdb1614b8740b
	.xword	0x35a3648e8cede6a4
	.xword	0x12e819a5d1bc10d4
	.xword	0xae6f8f209a49cd6a
	.xword	0xd779bede766ae10d
	.xword	0xa424cddcc9131b84
	.xword	0x2396d90c1b957eb1
	.xword	0x38c87ec203bb0a9a
	.xword	0x182db8db6ccdba2a
	.xword	0xeb084a583059473f
	.xword	0x7af1069627fc47b5
	.xword	0x13f4274344becc0d
	.xword	0x7657330d2faa0950
	.xword	0x0b4cd44c7ca825b3
	.xword	0xea1bb33a67f77c92
	.xword	0x5ade1df84d045c49
	.xword	0xb2d99be7cbbe27c7
	.xword	0xf5f4ebe07c49c863
	.xword	0x732390a201d1b3ba
	.xword	0xed4161719d66de9f
	.xword	0xdf418c226e14fbdc
	.xword	0x29969f650ddeb828
	.xword	0x10788090176b373d
	.xword	0xe2e06dfda2b8919a
	.xword	0x651b74093f46377a
	.xword	0x092152bb91f00b1e
	.xword	0xf2036eb8692228ab
	.xword	0x56ff686492389948
	.xword	0x3d1dddbf18055f29
	.xword	0x6adc89c6b15b1cd8
	.xword	0xf28e959093d03fb1
	.xword	0xd0d4a5f78f2bc218
	.xword	0x98ec6b43eff48d3f
	.xword	0xa68b8e2caf35c06b
	.xword	0x007f632e2201afae
	.xword	0x71724912915791c7
	.xword	0xec0803156ed62aa3
	.xword	0xf5156ff93603cc1e
	.xword	0xb368b59e8c4033ff
	.xword	0x1cc0f352427446b7
	.xword	0x85b8167e9ceb9f15
	.xword	0x98d3f1ee6d70fc26
	.xword	0xb64dfef00d6acdf5
	.xword	0x461b8eada935272c
	.xword	0x11808f64beefe798
	.xword	0xb03927c1811ef6e1
	.xword	0xd06429d85894ea97
	.xword	0x2880f9eaf968c906
	.xword	0xfcd042da6c9209cd
	.xword	0xf96593fa1e3b12d8
	.xword	0x0c2fe6a7f4d5a7d6
	.xword	0x788ff63a63a7b26a
	.xword	0xb333c32ce42b05bf
	.xword	0x543d8a8ddd6923dd
	.xword	0xa1e5f424c3b4da64
	.xword	0xf87d76257f6237f6
	.xword	0x07a50fe586f154fd
	.xword	0xc403400c217d3f12
	.xword	0x9b0f8d5c3ee5315b
	.xword	0x6c83a8304ec57886
	.xword	0x82fb3412da071dc9
	.xword	0xe49f20fefea3e3cf
	.xword	0xae520d4f26bc19ff
	.xword	0x74dd8c73a1fe8400
	.xword	0x9920a149faa9aa97
	.xword	0xa3e6c8f47b70a720
	.xword	0xa74a8aa5f36778da
	.xword	0xac8b999d2c002714
	.xword	0xc9488295a5d575af
	.xword	0xcbbda857efb773ea
	.xword	0xee445577c2f15881
	.xword	0xcb57e6d916daa749
	.xword	0xd2a65fe48d1cecd7
	.xword	0xca028b7dd9ff149a
	.xword	0x34ea905161536216
	.xword	0x34049ddfc0fb623f
	.xword	0x6f9b2fb65c3e86ae
	.xword	0xa9ee3bd92732a007
	.xword	0x3d4b5298827b427c
	.xword	0x1c1c4c8ee09f0378
	.xword	0xf787ac84c785ac5e
	.xword	0x61d7aa8031371ba2
	.xword	0x313520e38860b17c
	.xword	0xa8bfb712ab23dd99
	.xword	0x98a2c094270eab4d
	.xword	0x62143dc4cac1fa47
	.xword	0x68653a1d28d26429
	.xword	0xa662a7ed4c87760a
	.xword	0xe3c22aed5abeea3d
	.xword	0xd3c379a0c4ac354b
	.xword	0x0aec4f48f3a10db3
	.xword	0x022a8304e3d4e329
	.xword	0xf816985a5e59c7b0
	.xword	0x2a13031cc0308103
	.xword	0xe368f30ef2e3db19
	.xword	0xa24880ce76e89760
	.xword	0xce001717e382685c
	.xword	0x2f554edb4b2e9383
	.xword	0xb01ba45dacb3fdd6
	.xword	0x94e0b82426ef5bf3
	.xword	0x8d4677484e83a693
	.xword	0x91c8eacf2609e72e
	.xword	0x535e06dd2d1f39a4
	.xword	0x2550f27f07573089
	.xword	0x472cf92a3d8f01ba
	.xword	0x267c72dc25f76ee9
	.xword	0x60155f3674f2a5e0
	.xword	0x8d8825085409e2dc
	.xword	0x2eab59b5e0a82678
	.xword	0xff99c870e7ee3fa6
	.xword	0xe521b0e5d5d5807c
	.xword	0x2d61b357c7ba98fa
	.xword	0xf34b69704e4c1a5c
	.xword	0x2ce545079d12200e
	.xword	0x13004b745bfb3cf5
	.xword	0xd91ae99097eee73f
	.xword	0xc467b9b89defc09a
	.xword	0xe746d1e7e8ed9c2c
	.align 0x8000
	.data
data_start_3:

	.xword	0x655a498989202755
	.xword	0x840ca353affe5100
	.xword	0xb19e9565eef2e2c5
	.xword	0x6543e8554b790c12
	.xword	0x48822bb61b5f56f5
	.xword	0xf8e540c1dd3a7e77
	.xword	0xe8b4c0e1c8742575
	.xword	0x378b22f1a8ba8b8d
	.xword	0xcc66a67e2faa5559
	.xword	0x139ccbb4ca9b44e9
	.xword	0xfa1b0a1b75e3d460
	.xword	0x1a4ecb2fb9223f51
	.xword	0x63b49fad94b1596d
	.xword	0x59be96596b1ca56c
	.xword	0x0b018248ff1c9415
	.xword	0x58dae651aaddd45d
	.xword	0xa8c561c85c1055c5
	.xword	0xe11ebe4e1a2564a4
	.xword	0xece899464113000f
	.xword	0x25e5286fdc029f0e
	.xword	0xf7af0f65600330ff
	.xword	0x4f6f47e357e7cb20
	.xword	0xc622687412c985f5
	.xword	0xdb7701abfd336775
	.xword	0x28bcd397d6ab396c
	.xword	0x6294d27f75a8d4ce
	.xword	0xc6cf8bb601fc70eb
	.xword	0x30b2f0a2c89b8102
	.xword	0x966844af805f0ba5
	.xword	0x48385f8a8ff96741
	.xword	0x3e6f9acb8c8d152d
	.xword	0xbe0754a388d85ee6
	.xword	0x69ab6c06157c18c7
	.xword	0x42441d702340a969
	.xword	0x5ebdba4904f08a73
	.xword	0x25e7231fec683c0f
	.xword	0x2a75b674cf3f12ac
	.xword	0x4fb9aaa60c33d19d
	.xword	0x19e5f269b238a0cd
	.xword	0xaf139b1516bd2b61
	.xword	0x63fbf1810a83a408
	.xword	0x25a9df8393dea5d1
	.xword	0xbf06cbcadb6d89e0
	.xword	0xf5c22dfd60511d95
	.xword	0x4ec9bb556c3731ef
	.xword	0x34d735c59b4b6206
	.xword	0x844fb3f8a8501168
	.xword	0x1f415eaf4f81c6f9
	.xword	0x9a75abd1f16ed355
	.xword	0x7aca1655f4d76004
	.xword	0xc6cb2b2029635e19
	.xword	0xe85f212496e402d4
	.xword	0xc230132ab162a1eb
	.xword	0x8d6b68d54cdc3758
	.xword	0xf83cd9c4f7f7bbcc
	.xword	0x4011181ee114eec7
	.xword	0x28dd4205e29752ac
	.xword	0x6c477c6454f3e41b
	.xword	0xc5b641a2db016188
	.xword	0x31f99d62cdab82da
	.xword	0x653008d5226f09aa
	.xword	0xfd267e82fd3ee3ab
	.xword	0x426037ca86b7dd83
	.xword	0x760a08fe728480b1
	.xword	0x45b3b0b51acdf15d
	.xword	0xcf9ec11af334f37e
	.xword	0x8884ca9666adb982
	.xword	0x2af1d544d5046af5
	.xword	0x2302205fa6409dcd
	.xword	0x87f51445a903ec2f
	.xword	0xf4c7b7c1be7b4e44
	.xword	0xa7f5dc447a311919
	.xword	0xc15dfc30ebc2f186
	.xword	0xde62ce15b1dbed35
	.xword	0x28da898800f410c5
	.xword	0xa45290bf25053154
	.xword	0x96cf77d28aacaa3e
	.xword	0xef9bb94e0be95a75
	.xword	0x9bffbae4cc304e2e
	.xword	0x604ab20c22f26beb
	.xword	0x86e616888a71dfa3
	.xword	0x68abcc63b72d225f
	.xword	0xd013edea4afb5f6d
	.xword	0xd37f8a4a3333fa1d
	.xword	0x1beeee5b7b9e3f30
	.xword	0x75a0e24d2a4c331c
	.xword	0x443fcf902ea8bd91
	.xword	0x9c66be457dde428d
	.xword	0xeff293ade6c6e776
	.xword	0x982e9d6ce82a3e32
	.xword	0x256eca43780f05d5
	.xword	0x1b8e7f35ceb1aded
	.xword	0xee8f614ec999e6b7
	.xword	0x67859bf3e1cc6424
	.xword	0x1be7945885bbfe27
	.xword	0xfe16382205369b10
	.xword	0xb883a09716f06478
	.xword	0x48d768020ac4f5f3
	.xword	0x46e4d16a2be082d5
	.xword	0xf89317bf8042d974
	.xword	0x2838c91c0d65c48e
	.xword	0x77801f58646a729f
	.xword	0x427a37e3da21ac2f
	.xword	0x98da207b7a2deb87
	.xword	0xbf7b575f118d2330
	.xword	0x326148cbd4a8a749
	.xword	0x3bd2129d11001d6b
	.xword	0x1f634efcd2c971ef
	.xword	0x76670334254d81c3
	.xword	0xc20ae5fbb36dfc3e
	.xword	0x55174217c36e7d33
	.xword	0xe451327f72d76bd4
	.xword	0xf3cacfe732d5d1d0
	.xword	0x7e6ba6938c8f4cd7
	.xword	0xd4a4001f56a65d49
	.xword	0x850292f867cd430c
	.xword	0x6c1dc3448d5905e9
	.xword	0x162341f9bd4bac77
	.xword	0x7e1f2d808e75e71b
	.xword	0xa023d6ff43380f28
	.xword	0x49b17eb5ef49902e
	.xword	0x7c3735a5f1e1c89b
	.xword	0x4e68fa48da519e76
	.xword	0x16fac7ee51ae4e29
	.xword	0xccc59fceb90604ba
	.xword	0x0a94ce8dba89028d
	.xword	0x22e3bc001c3cdb75
	.xword	0x56ad20a9fdd4728c
	.xword	0x1360ed05b128f150
	.xword	0x3f6a38503e90a1f1
	.xword	0xd1564559a621b5a9
	.xword	0x0898b4be791bf5fe
	.xword	0xbca475409cceb50f
	.xword	0xde1dca2262d3d6f5
	.xword	0x2cdacfa3370b916c
	.xword	0xe49b43efcb3ed58b
	.xword	0x2d67fca13ec6843e
	.xword	0xcbaee362f02af8c3
	.xword	0xf101bbac903d0df4
	.xword	0x879f377bbb7eead6
	.xword	0x94d4f49db1f43ac6
	.xword	0x94e22744f3d657eb
	.xword	0x22b55d8f40cdcfd7
	.xword	0xcbb4562c4da21b9d
	.xword	0x8460297ef7cd82bc
	.xword	0xecd08a9e44b6eb86
	.xword	0x634202be2e094770
	.xword	0x6fdd0d9b2907246c
	.xword	0x96c3ad2cff6d8608
	.xword	0xf79e456dffe6be7f
	.xword	0xf24d19a35fcde54e
	.xword	0x9b2431b57ae70a6e
	.xword	0x92ea917b370c2b59
	.xword	0x8081d58c8a56a955
	.xword	0x37ba7d62e81a250f
	.xword	0xd3ca9cc91fe0f5af
	.xword	0xf930089319f5dd05
	.xword	0x4d0b1476b14910a7
	.xword	0xfd7472e0e672fe45
	.xword	0x74b37f60ad8bd96f
	.xword	0xa62be7f7e565421d
	.xword	0xa17f82421ebea277
	.xword	0x60749c51dfe2c45c
	.xword	0x879973a1f74e5377
	.xword	0xb51f2812d9ab13b9
	.xword	0x343b26feb48b5e4b
	.xword	0x01810b23feac48c8
	.xword	0x9184f096d6a84043
	.xword	0x6f297a95121048c2
	.xword	0xa89f3f0b8525ea8d
	.xword	0x85085bda59e108ae
	.xword	0x96fdb2ad584df4b8
	.xword	0x422eb6115b2a51f5
	.xword	0x9637fb2ff7b74e45
	.xword	0x1e9f2791b69df815
	.xword	0x355e727871b5deab
	.xword	0x310f448193ba51c9
	.xword	0x8a0264f7c8ebe4e4
	.xword	0x67cc3ab01473759e
	.xword	0xa3b55121a177e7b3
	.xword	0x5bc601080be3e6b7
	.xword	0xf7522ef324bd645f
	.xword	0x53aac4c85afd03f1
	.xword	0x0f78398a6588e4ec
	.xword	0x0f450884c7e810bd
	.xword	0x9e04e2d7eb6926a4
	.xword	0x3a86b0239263d1c3
	.xword	0x89f9ad61f6c0428c
	.xword	0xaba98ee9f42f7f35
	.xword	0x06841f3a427a648a
	.xword	0x6ab9ccfb3ed6ea57
	.xword	0xaa687e0b6da64836
	.xword	0xedae5a53aad901a9
	.xword	0xeceaae202d741026
	.xword	0x68ece404ace288b4
	.xword	0xce7574ac2d863c4b
	.xword	0x78963a380cfbdd09
	.xword	0xde062012d735fb00
	.xword	0x2d41cfa5f237fa56
	.xword	0x62501e3771acc1dc
	.xword	0xec3f09c08ab64256
	.xword	0x0e4847bd6e958bc6
	.xword	0x818719ba63c8c094
	.xword	0x7ef25ef932ce88d5
	.xword	0xd0f94f34acffe857
	.xword	0xd77ca50c8b7878f7
	.xword	0x64c1f732b8973752
	.xword	0x42574104c0cf8745
	.xword	0x34aa3345a9ef1da6
	.xword	0x454fa55ea80c220b
	.xword	0x546e642e176b7231
	.xword	0x6d7984ae5e5f0bac
	.xword	0x5a32facb16b09dfb
	.xword	0x6ddb248c2c147313
	.xword	0xc3e58aafab7c4d67
	.xword	0x6be3ba30b0e5067c
	.xword	0x661dbd299c5b1654
	.xword	0xde4a371c38f36954
	.xword	0xb50f850245c3fadf
	.xword	0xdfc5f2f1fa53b6e3
	.xword	0xaab92f5df62d41ce
	.xword	0x4ed215b057f79fa1
	.xword	0xa7397e2e35e846df
	.xword	0x42b76e5a74593106
	.xword	0x9a2340fc687fde9c
	.xword	0xf2acb1e8dc631266
	.xword	0x8927b370216b517e
	.xword	0xb3be52fc0af01706
	.xword	0xf497820ffd47e59b
	.xword	0x49ab0abf48dfe201
	.xword	0x65d6fb649ea28c87
	.xword	0x4a32ed809644a6ed
	.xword	0xee641c3a27dfdbbc
	.xword	0x29c3aae784bec339
	.xword	0x39a20318dc27c1a1
	.xword	0x5a1c8a1fe4816eac
	.xword	0x4a1aad882ff1d54d
	.xword	0xe4bb16e325f6b92d
	.xword	0x14cebd8c85c203fe
	.xword	0x1fd4a245ad20b479
	.xword	0x086c2d39fc78592d
	.xword	0x8079e692e29fb05a
	.xword	0x3662a7ae6c02a68d
	.xword	0xf1ec68e146f2e3c2
	.xword	0x5af4967cf93cd0cc
	.xword	0xe3df3e67f8039d31
	.xword	0xfd28a298d83ffe29
	.xword	0x824f88d2cebed107
	.xword	0x82fbd1ab93854c13
	.xword	0x43d6399884d0925c
	.xword	0x9c9a44ac7d32e143
	.xword	0x90a390ef9c208e40
	.xword	0xd8059070fe522a2b
	.xword	0x20c225ae3c28bd8b
	.xword	0xbedc09863a34ee27
	.xword	0x16bec96eb8ff0471
	.align 0x10000
	.data
data_start_4:

	.xword	0x45bade515dfee533
	.xword	0x5d436f20db0f6a46
	.xword	0x725a8b8d6a4256a6
	.xword	0xac97092b02364544
	.xword	0x9100ef33eef4c242
	.xword	0x0efeab0a49a1b547
	.xword	0x121cfe910ea50ebe
	.xword	0xcd9fbb90aa2f3483
	.xword	0x49ab54f7679580bf
	.xword	0x0e4b36f924fb9bf6
	.xword	0xe06804c0e06d2d3f
	.xword	0x1eac697a3c2d480c
	.xword	0x861112ba6e54437c
	.xword	0x99ab66c3f7ac7d37
	.xword	0x93a0ca9fe2904605
	.xword	0xd5c77d3713b4b8b8
	.xword	0xb0e46774f55dcb51
	.xword	0x08726ff56d9cec2d
	.xword	0x6f79c65e0ec3db6d
	.xword	0x3f3a5189f4ded946
	.xword	0x04a909a8f868e81e
	.xword	0x9681d5e4e4cb3250
	.xword	0x16b1dfdcc07698a8
	.xword	0x811836135533f49a
	.xword	0x36606dceb8781c64
	.xword	0x6d2c1f3fbd92f80f
	.xword	0x86a21697adf697c3
	.xword	0x46c0fd56ae14a3f1
	.xword	0xc5c6173ed4073c06
	.xword	0x086181d013f375dc
	.xword	0xf8ce88baa7e020b1
	.xword	0x6e5c17c974622ca2
	.xword	0x313f75946c75df7f
	.xword	0x51a4fcb19956f6ce
	.xword	0x518dc09c0e34581f
	.xword	0x384bb2db76373cc6
	.xword	0xaefaf47dca45b44e
	.xword	0xde0b06aa06bce3e4
	.xword	0x96dcc216c3d0838c
	.xword	0xc26bfa9316370c94
	.xword	0x3fb75f255c5f35be
	.xword	0x6fc80e322a62992e
	.xword	0xeafd9f9ed98ba8a4
	.xword	0xa70293fbaba9d4ba
	.xword	0xf6c09f3093ea8a1c
	.xword	0x636a54c99c858666
	.xword	0xfbb05d0a18b185a3
	.xword	0xc800f730e0bb57a6
	.xword	0x9851dbfb7f13777b
	.xword	0x9022bd7a9b6dd782
	.xword	0x19c10a917ce759b6
	.xword	0xc414da76fdacfe39
	.xword	0x891cfa42fa9443ce
	.xword	0xc4732436a7a05ad1
	.xword	0x4fd9e8cfb0cf2081
	.xword	0x3486cd7a4973cb04
	.xword	0x0c316780448fb5bb
	.xword	0xc25ca5fe75670fdd
	.xword	0xf17f671676cfef63
	.xword	0x7cf9d87822e351d8
	.xword	0x69021a6ff4894a15
	.xword	0x78bbc07fb4043959
	.xword	0x0bfb82bf71025d1a
	.xword	0x365e48c774ec8e95
	.xword	0xbf1bcedc26a9c649
	.xword	0x6bd8ab8aee5ff648
	.xword	0x7b1a6d1be949a9b4
	.xword	0x211f4476d8d5c251
	.xword	0xb6713b7d0c77780a
	.xword	0xaba497c1c48ed331
	.xword	0xf4cf101e6c5eaa02
	.xword	0xd86544a55641e42a
	.xword	0x27b955fd5502cbb5
	.xword	0xae74010a2b6b1bd0
	.xword	0x1012b8863226f064
	.xword	0xc6e53081be720607
	.xword	0x593524b263f5aa20
	.xword	0x5139704df13d8ea4
	.xword	0x0df7779ad87ca24c
	.xword	0xe2bf9d5ecfe75a66
	.xword	0xe1bdc70a8da817c5
	.xword	0xc3d4d9b8bf411524
	.xword	0xd77f2d97842a79d9
	.xword	0x221b8f24f3695423
	.xword	0xb221e8d1dd730d46
	.xword	0x1163aa8eaf05021e
	.xword	0x8469189ef5df90d0
	.xword	0x1d72410b0d06569d
	.xword	0x8f58e54d59885ee7
	.xword	0xb0e42a016115361d
	.xword	0xd3f1b8593ba5addf
	.xword	0x70578705e365ec28
	.xword	0xfaf54a05474b6a60
	.xword	0x30b6df8f46b9214a
	.xword	0x9f6bc151c560c5aa
	.xword	0xeca7292f13b2ae78
	.xword	0xa82f974f90170fbc
	.xword	0x05e96e1035069c7f
	.xword	0x196983945e48d3e2
	.xword	0x894ebb3fd536b773
	.xword	0xd188a9d3affdb04e
	.xword	0xb6a60cf7a97370a5
	.xword	0x3989039360a4ebe2
	.xword	0x3d4f951416f3e8e8
	.xword	0x1f3882a81bf436fd
	.xword	0xf6a91818f5cfe75f
	.xword	0x5a52c85e830795ae
	.xword	0x8393c9fc842d9b4c
	.xword	0x73fde57c91cfae10
	.xword	0x9a8053aea5b835a3
	.xword	0x216169eabe87fdbd
	.xword	0x147ee7f96ae6bfc9
	.xword	0x488f03ec96ab9ac5
	.xword	0x4399d17ccf7d0e7c
	.xword	0x5686df465399d32b
	.xword	0x920de75072389511
	.xword	0xc988ad7d3e08eb6a
	.xword	0x4f3e049b32e8ff34
	.xword	0x21d690877a9e2614
	.xword	0x86a9c81a62ed3ac8
	.xword	0xb47ec93f2d17197b
	.xword	0x258546ff7ed4df04
	.xword	0xf71b40a26d30e6a1
	.xword	0xce883a45b53e9279
	.xword	0xfb9c60b89c88838c
	.xword	0xdda95e1d748320db
	.xword	0xa3960c4b6c5202c2
	.xword	0x0df93e4bf6e1b06d
	.xword	0xefb3568cab0b530c
	.xword	0x66909e94253d23b3
	.xword	0xee98c2448a35d38e
	.xword	0x0dc929df17433829
	.xword	0x47004f5b5c0bec97
	.xword	0xd292b61aa1cd8419
	.xword	0x726141b1b286747c
	.xword	0x428f55259b87fdc5
	.xword	0x813807e07d294356
	.xword	0x889f4c5962e4c85b
	.xword	0x275cc827b6ce6912
	.xword	0x57355897100c3da4
	.xword	0x96aa1d0578341260
	.xword	0xd84ec35a285b9de0
	.xword	0x0c36a93b9dc6b0ad
	.xword	0x6277a67f577782c3
	.xword	0x92b56ec388c86cd2
	.xword	0x678dd6ff1c877a62
	.xword	0xcf89a22812f1a31f
	.xword	0xfabf1431b9d31acb
	.xword	0x9862eb99a35bbba9
	.xword	0x267eb35e1511f056
	.xword	0xc0ca02d89dc49a25
	.xword	0x14c2618b2ff2cff7
	.xword	0xe1ab59036785326e
	.xword	0x0564007c1630439c
	.xword	0xb8e93829c89131f1
	.xword	0xd9080ddabdab3976
	.xword	0xba5b63681156e681
	.xword	0x8c113ae42aaa4765
	.xword	0x27281360b3a126b1
	.xword	0xfe919bbab71ef25d
	.xword	0x81db9ee8a0d8c843
	.xword	0xdeb95e7e4331ffc1
	.xword	0x0ee5dfab06fed4a2
	.xword	0x5f8cacaf207e2fee
	.xword	0xb6124420bb83e1fc
	.xword	0x13e3a5a907bd09dc
	.xword	0xda033f6192dccd6f
	.xword	0xbdaffffaf03565bd
	.xword	0x5f277656ccf810a5
	.xword	0x66e7179d4bec2e90
	.xword	0xed2dce781aa640e4
	.xword	0x156983be677916ec
	.xword	0x79bb04311be245bd
	.xword	0xb171d778294a0a09
	.xword	0xe54c8bdb15d56d74
	.xword	0x11d3c32a6daa39f3
	.xword	0x1cc09858e99e2e36
	.xword	0x2dc613c3ee191498
	.xword	0x9f5869cb590f41d2
	.xword	0xc871e5ab6697c128
	.xword	0xf84edc1eecbff405
	.xword	0xbd7c246685f97d91
	.xword	0xba34f6875151f9e6
	.xword	0x1dfb5c721fc23241
	.xword	0x1db3b69b3cd56b0b
	.xword	0x4319063717a24c72
	.xword	0x24fcd699e65397aa
	.xword	0x0f56179e9a9697f5
	.xword	0xea22dd6c8a14e11f
	.xword	0x6d8c7116b10e6008
	.xword	0x7f4cef1b44260028
	.xword	0x1fe27028980f336f
	.xword	0x67cb7371b36420cc
	.xword	0x70090363ae187281
	.xword	0x8d85acb8e83a132c
	.xword	0x150d09899775ec32
	.xword	0x348b9069c947e9b1
	.xword	0x4dd8152a8721f62c
	.xword	0x6bf8a2bc15e3ca0b
	.xword	0xa0d9ee3e078552a8
	.xword	0x5b9e82c611e8631a
	.xword	0xfa5ef57e00166c0a
	.xword	0x5ed3f96852872b48
	.xword	0x4780235a6ab4b3d7
	.xword	0x63cab69301d45285
	.xword	0xf3347440a0999d04
	.xword	0x2565f8f9949f1b48
	.xword	0x090ef13c8b984bd0
	.xword	0x7815b88325ef5aec
	.xword	0x1ec3471d0c260e5c
	.xword	0xf4012f3b543f4c86
	.xword	0xab8bdd11fec46b86
	.xword	0x2a1f71107e22e7bd
	.xword	0x38198ba1d2f647cf
	.xword	0x971312d3221128e9
	.xword	0xc7d6536e4e133c5e
	.xword	0xd701ec4b673dc411
	.xword	0x9130efe7af833a80
	.xword	0x5fab7dfef82a8dea
	.xword	0x0d55c138b9d7ab7a
	.xword	0x38b08ed50bf1821a
	.xword	0xefedec9602013106
	.xword	0x23b28269afc35b98
	.xword	0xd9816d3d20622c0d
	.xword	0xcf584623a7cab584
	.xword	0xeadbb3aa4a10e15c
	.xword	0x8063a1ebcff939a5
	.xword	0x290d5271c60f8eb3
	.xword	0xeefae5bb6e804202
	.xword	0xfe94797fcdad9383
	.xword	0xa607918466c95fe5
	.xword	0x33f278fb652e03b8
	.xword	0x7b0490e1e314dda9
	.xword	0xa8fed8f047b0fb74
	.xword	0x5b1f0dc8ecdc713f
	.xword	0xf67f17ee1e57bf92
	.xword	0x1e7557bf994f4563
	.xword	0xf7b29db4c6210dd4
	.xword	0x631b59fd79ebed53
	.xword	0x3fe9fb22538f9a7d
	.xword	0xa126c8edabc878d3
	.xword	0xf2c1233de452f5b9
	.xword	0xc126789b9926414d
	.xword	0xef8de965b132fedb
	.xword	0x192fca40e9d14de6
	.xword	0x09d28234384dd6ef
	.xword	0x5e692d4764df5f9c
	.xword	0x7bbe8924a5e535ed
	.xword	0xf01a431eed679149
	.xword	0x482169f6b7c2a827
	.xword	0xcfd4d847daf25cd8
	.xword	0x154b780c01a88723
	.xword	0x09ecbca4dda8a716
	.xword	0x9096532e535997b7
	.xword	0xf5d0a3bfb99b401d
	.xword	0x8d882fb0fba41354
	.align 0x20000
	.data
data_start_5:

	.xword	0xb509778faa9e3245
	.xword	0x00f10981984e3d93
	.xword	0xd2a11f633ce140b6
	.xword	0xc07d1114f818e520
	.xword	0x75628470953e00ef
	.xword	0x7ae13356bfdec1c0
	.xword	0x15402175fd72b093
	.xword	0xc36bc455b819a11b
	.xword	0x06f246d3b524d5c2
	.xword	0xb17f0137e82d5336
	.xword	0x3e949d980c056589
	.xword	0x670cd75033e984b0
	.xword	0x6b53c9e3435ac129
	.xword	0xbb01732d738b17dd
	.xword	0xbd26d72b004f2af8
	.xword	0xbb4d4b39e5e92c04
	.xword	0x64e34e2ef3977fb1
	.xword	0xd27cdb8947644de9
	.xword	0xdaaa8a23c607bbb0
	.xword	0x1f740f5baf3a83ca
	.xword	0xcf8d8f0f209f17c1
	.xword	0x13b7131c733b8872
	.xword	0x43c7aa00299bd93c
	.xword	0x1e87a8f4c4be74d4
	.xword	0x8bdd44ae1c596853
	.xword	0x3c9ed3298c62bdab
	.xword	0xe2e841f55ed0635f
	.xword	0x1d143b256c74e039
	.xword	0xa65ecd9bb1d8b1b4
	.xword	0xcba7d96da89b1c2f
	.xword	0xd008511bf1b9197b
	.xword	0xafb6b7e49f6ed999
	.xword	0x3e62e5b381b1c27e
	.xword	0x88c17b51b2f98489
	.xword	0xbda9d4aa39571e5f
	.xword	0xc2eb88b839d6a06d
	.xword	0x3eb61d20926d175f
	.xword	0xf6bfa6fde4d7711a
	.xword	0xb72a114e22d6b71b
	.xword	0xf36b370d5fc6b4d3
	.xword	0x1751694e024764f7
	.xword	0x607e914eee0d3b87
	.xword	0xb1d1712f557155a8
	.xword	0x03facdaf340a3ef6
	.xword	0xdc5b720a8173ebdd
	.xword	0x2b5b040548d49a6a
	.xword	0xc4524499b5826ab6
	.xword	0x566d02e79da2f322
	.xword	0x804d66c504380f62
	.xword	0xd58d75e82da6db1c
	.xword	0x8c8b0c8d9f77905a
	.xword	0x5c0a2f4783f282db
	.xword	0x420e616236966ec4
	.xword	0x5b02c770a635eb30
	.xword	0x4757de6423467d1a
	.xword	0xe57ba285789e008f
	.xword	0x4d77470bfc4e961d
	.xword	0xf5a9109ef1f37aad
	.xword	0x8dd6191dce2c26b7
	.xword	0x41b7664ed14c29b8
	.xword	0xfc70546a58b5afa9
	.xword	0x7f4f325348ab034c
	.xword	0x7ce7cd51ad55b912
	.xword	0x9c023da6d4377606
	.xword	0x78538fd110acbc64
	.xword	0xff45838b6c0bbaec
	.xword	0xa6ebb99b99360713
	.xword	0xe1e58355a5712c0f
	.xword	0xdc61e4c35b064d0b
	.xword	0x9d9783ccf87355ff
	.xword	0xb21407f642d05f1b
	.xword	0x4e5a0be46d834807
	.xword	0x53d528f1da757338
	.xword	0x2a8ed4d653dfd40d
	.xword	0x9cd44f5073871254
	.xword	0x99806908c9a70ea9
	.xword	0x05785b7c17660fdc
	.xword	0x00c2642a4547650d
	.xword	0xa1ebcf2a27865db5
	.xword	0x302d83074c8f26d1
	.xword	0x61c6be5c9ae0d880
	.xword	0xfd41be6af24f175d
	.xword	0x1e23ab80bcc1a0cd
	.xword	0xf8beb13437589544
	.xword	0x82214c479b5f3d97
	.xword	0xf7b9de0d8aebc662
	.xword	0xbcf1da8a7711175a
	.xword	0x1ba8c16b6cc52120
	.xword	0x7e6fb6ae2e5432af
	.xword	0xe18e4be86a7c0c4d
	.xword	0x2e648ee73cfc54a4
	.xword	0x4f0c53aa479b03eb
	.xword	0x5c331dfd57ff60c8
	.xword	0xffdd54079911af33
	.xword	0xc8a4eb511731329e
	.xword	0xd0611098fdd505ae
	.xword	0xcb70a31ffdc0bb80
	.xword	0x330e2f0344319835
	.xword	0x3f354e0fa7fd26e5
	.xword	0xeb0c6a607b8220f0
	.xword	0x28eda6a642476149
	.xword	0xa1abe0e6ae4aa267
	.xword	0x78b3b3bb556e2017
	.xword	0xca29e37f3dfc5e86
	.xword	0x94373f6369e7532a
	.xword	0xd5cce735f05841a3
	.xword	0xd150b43924281b1d
	.xword	0xe3fbf289431e4cce
	.xword	0xe2209214f64062e8
	.xword	0x8b5777499dacfaa6
	.xword	0x293e726658d5c7f7
	.xword	0x27661f9a457b8e7c
	.xword	0xcc2a636cd5fc4fde
	.xword	0xd0a80d3dd742a54b
	.xword	0x167cbec458be5803
	.xword	0x3632c9b6cd12ff7c
	.xword	0x3d778e43a26ff62f
	.xword	0xd00ed637591fa976
	.xword	0xb3f296fa63094e5c
	.xword	0xb0b4651a2c93bac3
	.xword	0x318c7ce3b35bb591
	.xword	0x0dc54d61fb5f6713
	.xword	0x0bbe133fc887b4cb
	.xword	0x6a9e67f4645c6c60
	.xword	0x8d599ea31781e063
	.xword	0x62d94f2edcfbe4e5
	.xword	0xdbc17dc4e26dec0a
	.xword	0x1a5f4bb094eeb589
	.xword	0x0b2653a20fe57243
	.xword	0x89e88222d4dc3fdc
	.xword	0x9e1cef9617a34d6e
	.xword	0x765ff4f1a08e9ad6
	.xword	0x036af77a98ba6020
	.xword	0x30e6222dfdc646a7
	.xword	0x0747cdb325cb30b5
	.xword	0x232ed5d37fad04b1
	.xword	0x3a7e6aab3916bfbe
	.xword	0x3afbf9d4315b8250
	.xword	0xd0be6916ef96309b
	.xword	0xb400f8799e5d7102
	.xword	0xac60b492bc0460cc
	.xword	0x2377634169b446e6
	.xword	0x9c4313b647e94403
	.xword	0x2e3f8e9bf10aa791
	.xword	0xdc3c69dc2aefdb81
	.xword	0xa0ce87625aa1cd87
	.xword	0x7337a93fa3a7311e
	.xword	0x4e04dfec8d716707
	.xword	0x7e946183da59b003
	.xword	0xc73d3a348c6f2358
	.xword	0xc0568f28b9243337
	.xword	0xc6a9c74d31efc7c0
	.xword	0x59c13fbc9643907f
	.xword	0xab3059d59b0d644d
	.xword	0x724165298a3b837f
	.xword	0xcf8572e06aa081fb
	.xword	0xccbf4cba41e3e445
	.xword	0xeca066676ddb42b5
	.xword	0x51f5486f05c141b4
	.xword	0x9b5d5c65d1991fd4
	.xword	0x54a2fae990316d6c
	.xword	0x2345d9b606776f89
	.xword	0x571824faf5439c99
	.xword	0xd0fa8bfae7825bf1
	.xword	0x32f4bf01e7c978aa
	.xword	0xd0acaf52df1ab860
	.xword	0x05a7d68a90af8351
	.xword	0x73d24ca627c76168
	.xword	0x4476c8d2f17531c2
	.xword	0x96febb4c12fb3a3c
	.xword	0x3abfc283867bb1ae
	.xword	0x100cc65fcbb7c02a
	.xword	0x635bbe8186150f3e
	.xword	0x554ea94f36eacc15
	.xword	0xe205416e35a21677
	.xword	0xabcb61ea9756c938
	.xword	0xa856adbabcca31c1
	.xword	0xe63ec26420302b51
	.xword	0x38cfb50e88e1e569
	.xword	0xeed0f4a177a83777
	.xword	0xedcdc37f6c0aba81
	.xword	0x762a1e9e8017f507
	.xword	0x3282e47dfaea820e
	.xword	0xa414c653afbfb469
	.xword	0x176b823fe2bb5474
	.xword	0xd29b40e88b3153ac
	.xword	0xaf89ef4e813510da
	.xword	0x4f55f08ff7a8cf21
	.xword	0xe32b020ad9bab0ff
	.xword	0x41321d3cf0dbfdc4
	.xword	0x052f30dbf8f00c9b
	.xword	0x611f68dd225e16ce
	.xword	0xeb7932ec2750e57b
	.xword	0x264a3ccef0dfbc48
	.xword	0xb555b8ded1f42881
	.xword	0xd9dbda335e64557d
	.xword	0x86a3834cb2554a45
	.xword	0x629ec628854bf085
	.xword	0x03c410fcf8a5d68c
	.xword	0x671677192eb6b321
	.xword	0x1d7110ad9b50286e
	.xword	0xecd1129c556240b4
	.xword	0xc3dae26f78cf5163
	.xword	0xf5c5e520a1b0acb7
	.xword	0x9fbdd06cf66ab094
	.xword	0x058ede5fec366d88
	.xword	0x75ad363014fd4e8b
	.xword	0xd636a85217c2a2e7
	.xword	0x46499b6b11535bc0
	.xword	0x6fb4e1293aa761f6
	.xword	0xf6c493e154fb5806
	.xword	0xaecc5ec5685047c5
	.xword	0xd966e605578b4db2
	.xword	0xe40a4d5b8fc24a97
	.xword	0x7c9e50d22b3e6eb0
	.xword	0x7f0c7ef946a13731
	.xword	0xaa14ccd771b331ed
	.xword	0x95d42c708d3c5525
	.xword	0xcf994476b6311514
	.xword	0x0e527b43073ce2cc
	.xword	0x67d854fc72e84c79
	.xword	0x96db89e43f332a00
	.xword	0x16ace0fafb68b434
	.xword	0xb9e6fc1752ad1922
	.xword	0x5fd045b024ea69f4
	.xword	0x0a50499e9db9f294
	.xword	0xe0cbb171e380fb03
	.xword	0xac948d59f008d701
	.xword	0x59292e1b8762c35a
	.xword	0xc1a3b8df02aaaf17
	.xword	0xff145c936ac9ceaa
	.xword	0xbacf4cd01a94337a
	.xword	0x9ff1379ec79d123c
	.xword	0x116e3bdadf34ced1
	.xword	0x357bf76bb2b62525
	.xword	0xbcdc254deab1f290
	.xword	0xfc51594ff6d3162b
	.xword	0x6a9d6f273d013c64
	.xword	0x9b8aa31f6853185d
	.xword	0xa609a5f36414d0ba
	.xword	0xc239f9ab2cda58c1
	.xword	0x4ba234f163d883ab
	.xword	0x85470d6f05600bed
	.xword	0x1b6260a76c626cd7
	.xword	0xaed306c9f879bad1
	.xword	0xff2be487927f81a8
	.xword	0x5bd5a63eedac37ea
	.xword	0xc453343fe4e13f57
	.xword	0x8a897ee1771be0d2
	.xword	0x429afa079eef3faf
	.xword	0x866ec4ce761303fa
	.xword	0x6fc62c27cf39a53a
	.xword	0x0f5d3f3f9094ec42
	.xword	0x298f707b85d84fe7
	.xword	0xbd901bccd2843aa5
	.xword	0xc5b6ed32994ff17b
	.align 0x40000
	.data
data_start_6:

	.xword	0x444c83265f7b7387
	.xword	0x7aed9928f82b9ea5
	.xword	0x4eaaf07cba61085b
	.xword	0xb7318c851e8309ea
	.xword	0x2af7f3073944efbe
	.xword	0xc8c910c48fc624a4
	.xword	0xbe266ca3525f4464
	.xword	0x6c7986a8b54fa8ea
	.xword	0xc19cf573d6a35b61
	.xword	0xa826979b846c33bc
	.xword	0x64c9f09f67285378
	.xword	0x409f19882e89fe75
	.xword	0xafaf2385280ec01b
	.xword	0x725caa0718b9002a
	.xword	0xee32441dfc9bd02b
	.xword	0x155e05e82ab2e8ce
	.xword	0x812ff96448766af0
	.xword	0xe076fc3c2d2309ae
	.xword	0x3f3c4e3fbc165651
	.xword	0xd1fa98b07398345e
	.xword	0x3b047caedf31563b
	.xword	0xc7bf40c2deb77076
	.xword	0xd97a37b58fd872e6
	.xword	0x7a5f37410b0fcc22
	.xword	0x3f6388a4454eb9f3
	.xword	0xb4d542f8b3d0321c
	.xword	0xa8e97e57a0f7bf94
	.xword	0xc8f390f108d336af
	.xword	0x7c8a11d0250afd65
	.xword	0xeacca8c7b656355d
	.xword	0x0c28669504b211fd
	.xword	0xf00603e08ff65576
	.xword	0x2b91a4698bee38ea
	.xword	0x1382fe0be94cc01b
	.xword	0x18bf747191ab0088
	.xword	0xda0ce2042105c227
	.xword	0xe9790ba21d1d930b
	.xword	0x462aab55c30ad6b3
	.xword	0x2ce396d9523fb26c
	.xword	0xc59c57c4c727acc2
	.xword	0xa334577018402118
	.xword	0xa84721a4c3dd7d09
	.xword	0x1ecb6e6795a819ed
	.xword	0x750dbc720ae29c56
	.xword	0x6bbdfb31806618eb
	.xword	0xfac8d89e20428f72
	.xword	0xda8374cf414e6143
	.xword	0xef0d4d164baae6bc
	.xword	0xb6b9942797b6e1c2
	.xword	0xde9eff756d060bd1
	.xword	0xf88ce35d4f9c696d
	.xword	0x553a02191094421b
	.xword	0x2e3f75924f9ad9f5
	.xword	0x1a347d90e3312d3d
	.xword	0x3d3dda3a1b225be5
	.xword	0x92d6dd62fb8ad5e3
	.xword	0xaf617979a49c459b
	.xword	0x56eb33120a86edd8
	.xword	0x59eeba70ae88cb6b
	.xword	0x8274a6de0e84d185
	.xword	0xce8d88b025e27cc3
	.xword	0xdfb1dde2ff3d65b7
	.xword	0xf8e1775cd570aaa0
	.xword	0x27b79a6acde9c1c7
	.xword	0x691d2e83ee559590
	.xword	0x434cad161882b37c
	.xword	0xaab6ab62a5cc1fd4
	.xword	0x3752ccbc825c0ac1
	.xword	0xaba6a1f7cf86db1f
	.xword	0x36be2ff58b474736
	.xword	0x55b379baa6e5e0b1
	.xword	0xdf0bb72a07ba24b4
	.xword	0x4203e848dc1579f1
	.xword	0xdfb1b849b34f7cde
	.xword	0xff25ff53b4a6b533
	.xword	0xf618f91dd900ae52
	.xword	0xd8f1be6fc4e45d4f
	.xword	0x8beb1f9958e4543d
	.xword	0x610af5ad3fe7d336
	.xword	0x0e2f71ba5cebb49b
	.xword	0x77679d9caf14827a
	.xword	0xdfe88e5e27f4072d
	.xword	0xb52b4f45d5e4f60f
	.xword	0xc9fd836048cdab54
	.xword	0x22bff46507c045c5
	.xword	0xc4e0048d8f7512fa
	.xword	0xc04fe2167809b508
	.xword	0xf0c41cadee591da6
	.xword	0xaafbd269e7a919bf
	.xword	0x7c4717c0516da245
	.xword	0x4618a05794b51a3b
	.xword	0xdb64ea439a958cdb
	.xword	0xf2f3bdde516e9959
	.xword	0x6c6d7a289279f3e3
	.xword	0xe640815c16eb23a0
	.xword	0x682ec7e3ff5b509f
	.xword	0xec9c550252c8d143
	.xword	0x2742806d3e1e4d11
	.xword	0x1824472c79f98280
	.xword	0x807d8ee6f61261f3
	.xword	0xcc4897af384ac4cb
	.xword	0xb604f08d34c20df1
	.xword	0xd9558f3b58dfbb20
	.xword	0xab1b21314f3833ed
	.xword	0xc40ffa8a13f63bac
	.xword	0xe0b85a51010be78c
	.xword	0x76cc9fd172857a3f
	.xword	0x34b5135cb812d9fc
	.xword	0xb89f12181abfbe5f
	.xword	0x835c61ec00bf4a05
	.xword	0xa258272c2888099d
	.xword	0x00b0311d4c1fecd0
	.xword	0x5ed716b33c64d83c
	.xword	0x136628166ce555fe
	.xword	0x25a8bb7dfeb4384d
	.xword	0xe1c7e09b3925f245
	.xword	0xad9dea1907ffd2e8
	.xword	0x5870566a4729a56d
	.xword	0x1ef3b74baa30fd71
	.xword	0x9510a701507c0995
	.xword	0xb73d77ffc8cf38e3
	.xword	0x8acb379a5d75657b
	.xword	0x662c43ff86efbd4b
	.xword	0x31c99348ba4bfb82
	.xword	0xce0b9d362a44f459
	.xword	0xf60ef1d124f0f63d
	.xword	0x1bc6a7ed718981e7
	.xword	0xf3b4f7b169f4d68a
	.xword	0x66fc90e8e4fd4aff
	.xword	0xe81894da3f4b29c2
	.xword	0xf1354319a15c9065
	.xword	0xb73b52f369f9a46a
	.xword	0x18e50976aa9a95ae
	.xword	0xa4ea941f2bfa8a92
	.xword	0xd398bb9621a016b8
	.xword	0x6c50bf955aa3d02c
	.xword	0x515e6dcc5a26ec88
	.xword	0x0ef76bec29fb9be3
	.xword	0xe1f16d5faeb8e7c0
	.xword	0x31a568cb59edf6d4
	.xword	0x28c4d875e7655e92
	.xword	0xb1610efd6ff15758
	.xword	0x7e6393d34809242f
	.xword	0x5f7cebbba80e4c2c
	.xword	0x6c1f0e4066750cdd
	.xword	0x1bc9a9ebaa2c513b
	.xword	0x3cfd3aa090b52f3e
	.xword	0x3e2d0111b955b058
	.xword	0xa013615643988992
	.xword	0x9afbc0a419f9320a
	.xword	0x0db05b137f51e339
	.xword	0xfdc4575c9860e31d
	.xword	0x166b478036cfad2e
	.xword	0x0b51e15fa812495a
	.xword	0xab2cdd72b101ca68
	.xword	0x3ac027737eb0c8cb
	.xword	0xa0fb0498fe2a9494
	.xword	0x7448ac2a642cc4f0
	.xword	0xa1c8f7376c6941c6
	.xword	0xfaa60fb27750cb0c
	.xword	0xcf176effef5deebd
	.xword	0x4eddc06a03289b8a
	.xword	0x76c383c0c1a6d739
	.xword	0xc2d29a609edd880a
	.xword	0x10ccc67599e79c6f
	.xword	0x18eec2dde2183341
	.xword	0xc200c048905252e7
	.xword	0xea34b4c447a9b3fb
	.xword	0x3ece861859368284
	.xword	0xb209e79eebbaf419
	.xword	0x3340e34d89ec4557
	.xword	0xc74f8c5e030ba0c4
	.xword	0x94da3b5997641959
	.xword	0x976abd715473cc20
	.xword	0x191a9c3217e834c9
	.xword	0x78c87eac325607da
	.xword	0xc0fc05ecdceab7b6
	.xword	0x0223cdcf016d1304
	.xword	0xe34cbf9d21d28a39
	.xword	0x6806eaaf1fdcde3a
	.xword	0x7a0466fc266b3b52
	.xword	0xf3b824329ab90772
	.xword	0xe32bc26ca268c1a6
	.xword	0x585cae5371e803de
	.xword	0x955529bfe0d0d453
	.xword	0xb22dda9986635db0
	.xword	0x411bc0eed75a254c
	.xword	0x9bacdcd86343d164
	.xword	0x4a2b074762aa88cc
	.xword	0x65e6f1ddf748bacb
	.xword	0x6a77c37c25086908
	.xword	0x115944645408fd1f
	.xword	0x65e386201ebeb755
	.xword	0x6fbaa1f6d00bdbac
	.xword	0x8042e9768f5668ef
	.xword	0xfe741f5e459e394e
	.xword	0xf078588145edd00a
	.xword	0x1fe67d7d83b3a54d
	.xword	0xc93984223f7402bc
	.xword	0x0cc649548b10309a
	.xword	0x50fd3c56f205f422
	.xword	0x785c015af1f23652
	.xword	0x65a1f6a492b79cb6
	.xword	0xee967e6b3de5ca9c
	.xword	0x23dbdbfb572bb133
	.xword	0x192e58a5b2070543
	.xword	0x85dcf45779d57170
	.xword	0xa482517d8f6fea1d
	.xword	0x5d69181298e71b00
	.xword	0xfe88342ad76b4205
	.xword	0xe83ebdaa3971389b
	.xword	0xb9d6843f756825ea
	.xword	0xceb078ff05ddc081
	.xword	0x11186ffadf70c17b
	.xword	0x729f140c42c7bc69
	.xword	0xde3bc92fb126c154
	.xword	0x347054880f06c05a
	.xword	0x7952e7eeec456a89
	.xword	0xc89367786346a9bf
	.xword	0x617ff8476c0a057d
	.xword	0x69d776a5da72a69d
	.xword	0xb065cac495dfbce2
	.xword	0xdbb4abb2c26f7783
	.xword	0xb2c2dc4e9b1b22d6
	.xword	0x7dec4ba6a6fd0e66
	.xword	0x41dd46739add4244
	.xword	0xec2ad188ef7832ef
	.xword	0x95b037c534ba1236
	.xword	0x9a3fd8900e02d3a3
	.xword	0x715118b7a71c33d6
	.xword	0x396a717b7fb477c7
	.xword	0xca0692754b646a93
	.xword	0xc53d97e0b3f2ce14
	.xword	0x256ead77ca9f18fb
	.xword	0x90550734088ac440
	.xword	0x489bca6e98409bc6
	.xword	0xf55b7c78380aa208
	.xword	0x1bc54a0e3114394e
	.xword	0x6594712413bad13a
	.xword	0x8057bd528d6cd26a
	.xword	0x11f8a1a41f1ccbe7
	.xword	0x35dac405231865b6
	.xword	0xf20b301e0db362b3
	.xword	0x208565a05e56c984
	.xword	0x3b4581b1ff5d6a67
	.xword	0x043de956e5317b00
	.xword	0xb5058711d2a6e7e9
	.xword	0xf77a3fe4d27f0c80
	.xword	0xff4696b7c564b7df
	.xword	0x74b8faef4e91c2e3
	.xword	0xae2a66ace034e5a5
	.xword	0x37196efde3639715
	.xword	0xbfc4f634aab417c6
	.xword	0xb5480afa0353e3fe
	.xword	0xea9c147168a9456d
	.xword	0xd3ec53c67dff7609
	.align 0x80000
	.data
data_start_7:

	.xword	0x9c73823e074b3e98
	.xword	0x3893425aad50afeb
	.xword	0x4418d392b7dee227
	.xword	0x1a7ae046f2bbc910
	.xword	0xd30bfa44eb895c73
	.xword	0xc6a1ce0df9d03629
	.xword	0x37c7c6dd83e8c34e
	.xword	0xce0b5c7df70b273b
	.xword	0x61c75ac816776e05
	.xword	0x639e7bed5dc6c220
	.xword	0x1f136be0f0ca3fb6
	.xword	0x330dbad2e488b2bb
	.xword	0xcf3ebf098601c6cc
	.xword	0x4873477cf5584c66
	.xword	0x223c59f96ebcd3e1
	.xword	0x67e3b56d108d5aa8
	.xword	0x0009404f0e333425
	.xword	0xc8e9c2a44688e24d
	.xword	0x1738b1ee3ee59cf3
	.xword	0xfc6f8ca6f02e83e1
	.xword	0xf5678325d136a21d
	.xword	0x466d36b690ef7ede
	.xword	0x90f208c6e6b4d8fc
	.xword	0x2631fd778759cce8
	.xword	0x51fcc2162112756f
	.xword	0xe7b0869fd0cedd9f
	.xword	0x6021861916db0bd3
	.xword	0x11a4e4e8bd4e595f
	.xword	0xc65db220e50e430e
	.xword	0xc21a9c5f30bc4c6b
	.xword	0xbfae3f5fd41a92c1
	.xword	0xef2abdd07ab3d9dd
	.xword	0x34cbb253f02c246c
	.xword	0xadf19261689c92be
	.xword	0xcbf188728ea275c3
	.xword	0x40aee5d9f2a07bed
	.xword	0x42616b5ffb27dfab
	.xword	0xdf54fc3fb9c01349
	.xword	0xa0a42bf53505c1a7
	.xword	0xf000ee712bf448c5
	.xword	0x7f75c815e0a46f2f
	.xword	0x4defa6fa3e9d0b16
	.xword	0x9d032efbd41d5088
	.xword	0x9731d004d51f2422
	.xword	0x613e4dd1c766ecf0
	.xword	0x89eda8ba54c79805
	.xword	0x3957cc54479e8d78
	.xword	0xcb3051efa663fa04
	.xword	0xd6da7074a72a7f1c
	.xword	0xd3baa3af0746d882
	.xword	0x0f9449e54bef9db8
	.xword	0x0d6e95e98ad54082
	.xword	0x0bfcdac10ae2362b
	.xword	0x3efdf17bbb7237fb
	.xword	0xad9d2b6ded68c0e7
	.xword	0x644e5453e259bc6c
	.xword	0x7590c42cd5c670b2
	.xword	0x793342d89a1491ff
	.xword	0x9e1ae015d908d35f
	.xword	0xaab0ae31858043af
	.xword	0xaba4dd9c497dcf53
	.xword	0xb4f2baa52863029a
	.xword	0xb8f8b23897662fa0
	.xword	0x3141cc8de764267d
	.xword	0x87c02efd78be9381
	.xword	0xae88555b15d46fa5
	.xword	0x8a09b6403d652d3f
	.xword	0x0f983aef06e93f9a
	.xword	0x97325c414b995879
	.xword	0x3153d0efc965eb1f
	.xword	0x35a6cb52db9e93c2
	.xword	0xd2c5a56b65605b99
	.xword	0x8620ad622aa185cc
	.xword	0xe3e6f49beeb3f2e6
	.xword	0xdea078189cb3edd4
	.xword	0xd090d9596516ab53
	.xword	0x1e5863c7e927d6f9
	.xword	0x8e9c6a9e268ffb13
	.xword	0x2d295c5d1c4ba03f
	.xword	0x00a4c4aabc2ec959
	.xword	0xdc92936c17a33736
	.xword	0x41a373d50f74116e
	.xword	0x11be69040c199ea8
	.xword	0x827785c81bd08e28
	.xword	0x1fa880740392e0e5
	.xword	0x696461340e4ff412
	.xword	0x63e1baf8a92fb7d7
	.xword	0x96294860420e5d11
	.xword	0xae28d8bb362d7ece
	.xword	0x641fbe6679d64399
	.xword	0xc8dc72abebf2f926
	.xword	0xde81049e266d1fe2
	.xword	0x24ef04e274aca523
	.xword	0x755bbc0493cdc2a2
	.xword	0xe51aa9b18b43a52c
	.xword	0xf44c740b983fc069
	.xword	0xc8f51a7ba9863569
	.xword	0x28a53ad5a3d0606f
	.xword	0xdcb10b3f93f91751
	.xword	0x7ab1e50670252fab
	.xword	0x55b93e23b081a12f
	.xword	0xb7af4aba4e3b2c76
	.xword	0xacf7176f6907ee27
	.xword	0x886a1b99f93a5e16
	.xword	0x05a855557b6fb31f
	.xword	0x08b4753862681a38
	.xword	0x0b0e50ec236c196b
	.xword	0xabb76b10e25c7739
	.xword	0xa250fb6c6fd5544d
	.xword	0x7b04fb0cb8a695fb
	.xword	0xbf3f066904b2ad67
	.xword	0x7de096c663badb19
	.xword	0xa0fde1f1eec7362b
	.xword	0x2ff0fd1600964323
	.xword	0x660555247e10cedd
	.xword	0x51a026a758197da6
	.xword	0xac5273213d924db3
	.xword	0x6aebb60c52faa671
	.xword	0x7e0ffdabdb9ebadd
	.xword	0xcfb8da7ce5ca26e6
	.xword	0x215d3f07ec7139ad
	.xword	0x13b5236466e81cc7
	.xword	0x4fa477e94905b17e
	.xword	0x1cde1333aae26db1
	.xword	0xf79561f41e29b7b5
	.xword	0x5e7f19cfe54adb04
	.xword	0x5223a413279b3337
	.xword	0x69b1a905537ca4fc
	.xword	0x2eec4a5f6d5965d8
	.xword	0xadb26489bc300168
	.xword	0xb2a5916051f481a1
	.xword	0xe541a60a4c681320
	.xword	0xc5b03b8585433eca
	.xword	0xc0ec77be14a547c5
	.xword	0x4852c158fe46ba79
	.xword	0x5a167739f5fe04e6
	.xword	0xee0e177110526b5e
	.xword	0x2a4af27118570235
	.xword	0xe705ce4960693bb7
	.xword	0x004b118c20985e32
	.xword	0xeba615c61c8c5306
	.xword	0x7fffeb64dd18603e
	.xword	0x52a04842385e62eb
	.xword	0xf5c08576ceb986ee
	.xword	0x8f904b8ddaac8d53
	.xword	0xd7c555742d71343a
	.xword	0xa76348771494c521
	.xword	0xebd36e07dbd6017d
	.xword	0xd83bad4891345f3a
	.xword	0x14e50742c237259c
	.xword	0xbac2213f8334196c
	.xword	0x116a8bffcab2795e
	.xword	0xe270ae4f964dde2e
	.xword	0x6a6726a37f0109b6
	.xword	0x2e6ea66b31c27f3e
	.xword	0xaf1045b87ec6eb77
	.xword	0x4f55bf778de1a9af
	.xword	0x5da3bf92579c4420
	.xword	0x7d2715f7efc065d6
	.xword	0xbc4f9741df0689d3
	.xword	0xffa772583ac0615c
	.xword	0xe187bf0e45b13759
	.xword	0x8f7e0da1f1b9ce16
	.xword	0x888948511c097140
	.xword	0xc0d9f95b15b80594
	.xword	0xc3fc8fb62a092af9
	.xword	0x50234b9eeb3878d5
	.xword	0xb2abe5cfad31c1e5
	.xword	0x6333a867d179e691
	.xword	0xb5de3d2305b96641
	.xword	0xf38fa02a2c99b1aa
	.xword	0x24fe97f64f880988
	.xword	0xba58d467846d6a10
	.xword	0x3024ee1cea6454e0
	.xword	0x6396eb8ec485df8c
	.xword	0x2f7a43312f3fdb08
	.xword	0x8a639a8e0676b3de
	.xword	0x6b46317172ed0a4f
	.xword	0x876e42499f8c9df1
	.xword	0x029a242a60b3412b
	.xword	0xbd9231fdf48ec132
	.xword	0x3f8bfe31b8738630
	.xword	0x4dc84c0608bb15c2
	.xword	0xa2ea4782e66c1783
	.xword	0xb77d36ffcfa16c49
	.xword	0xf8a7833d26ace22d
	.xword	0xcd6b36e5b8e98d29
	.xword	0x5709020b5ace4431
	.xword	0x8084216aac786707
	.xword	0xc2cbc544a4728804
	.xword	0xa85debf716e002f6
	.xword	0xc550abd144de22f1
	.xword	0xb66eb237fe4dedf4
	.xword	0x34ad6e706d7cff9a
	.xword	0x8745e52820c0b6d7
	.xword	0x91ea3b7b762f3677
	.xword	0x7410659415cee5c9
	.xword	0x9c7ca53535be70a6
	.xword	0xbb48b8e7e438faf3
	.xword	0x5ecc7daa2a11b368
	.xword	0x238195b31cdbd172
	.xword	0xe96acc88a84c9330
	.xword	0x2537eb1b3fba9fbc
	.xword	0x753445d044dfc671
	.xword	0xfc8ed4e7fa13a42e
	.xword	0xb3296648607c15d8
	.xword	0xafa4850b6ab46376
	.xword	0xbb29f6b65f945ea9
	.xword	0x71cecbd91a294b2d
	.xword	0x680c60de4eab4cc5
	.xword	0x680f1db2bc5de0ff
	.xword	0xa5f4b007ffa8ac19
	.xword	0x244a2822df23a718
	.xword	0x993d45435d8526e5
	.xword	0x3baa2244074c51f0
	.xword	0x803d85a319caf768
	.xword	0x4d44ecd3b1f2410b
	.xword	0xc5f142f03e06d306
	.xword	0xc41af6171fe25fd5
	.xword	0x9b4b25cb1669a153
	.xword	0x61355eab503e210a
	.xword	0x8a9949ef754f22df
	.xword	0xf4c8dad0fd054c2a
	.xword	0x987f753f2877bc42
	.xword	0x0e3f53a117253654
	.xword	0x7732b1aa03353721
	.xword	0xcc777b3ddfac9eb9
	.xword	0x88bbb4d051b9b4fd
	.xword	0x29ee13b6443cba79
	.xword	0xbae82f325fd444ff
	.xword	0xcdb5383f29803c71
	.xword	0x447c5ebb37274514
	.xword	0x13814bd777785ecc
	.xword	0x8d3adc443e5b5edf
	.xword	0x9e2c0eabb4c9829c
	.xword	0xaf3dcb154f5dd1ad
	.xword	0x2ea402716198e7fd
	.xword	0x714f42cec7dbdd93
	.xword	0x6619d0c13e525003
	.xword	0x7ca9b74df71dc14e
	.xword	0xdfc2150999a03316
	.xword	0x9bd9eac478286a09
	.xword	0x38996d5909fd4b17
	.xword	0xb11123347b8a0f7a
	.xword	0x0b6c76c08e76cfe7
	.xword	0xebe3e699e5d4f919
	.xword	0xc9ecbd72418c1d1d
	.xword	0x7b980dcfd87a681b
	.xword	0x95cd57c68546319d
	.xword	0x02c9bf93169aab3e
	.xword	0xbba0eec0100836f9
	.xword	0x1d9361bb8ad4bf5e
	.xword	0x52a2cac57de3af33
	.xword	0xd857fce4312bed00
	.xword	0x134694788aa61be1
	.xword	0x68489a36f5127298



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
