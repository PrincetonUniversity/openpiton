// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hwint_updtate_1_rand_12_s1.s
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
   random seed:	588197354
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

	setx 0x646053975d8f164b, %g1, %g0
	setx 0x714fd6198a3eaac8, %g1, %g1
	setx 0x84e4ba06f8cb4f6b, %g1, %g2
	setx 0x4c3cba15abc801a9, %g1, %g3
	setx 0xafa3adc86056744f, %g1, %g4
	setx 0xeeb7522f33988e17, %g1, %g5
	setx 0x18b22236bdf67923, %g1, %g6
	setx 0x1b0a223c3f669f5b, %g1, %g7
	setx 0x0cfc5b3d03365fd3, %g1, %r16
	setx 0x5a6f8404b0d3e2cd, %g1, %r17
	setx 0xa98fe1370cfa20d0, %g1, %r18
	setx 0x5bea7b61c8af44e6, %g1, %r19
	setx 0x9d4b585f1b1d5f24, %g1, %r20
	setx 0x56df601564b97b1c, %g1, %r21
	setx 0x74f47c39b9b0ca38, %g1, %r22
	setx 0xda24a85c8279f0e4, %g1, %r23
	setx 0x42e9eed653117a01, %g1, %r24
	setx 0x69ea2bfe2b9de492, %g1, %r25
	setx 0x0b553b684c83ba9c, %g1, %r26
	setx 0x0140f45be0fafa93, %g1, %r27
	setx 0xb80ad74a2922171b, %g1, %r28
	setx 0x89dc941d5a485008, %g1, %r29
	setx 0xa786962a9fc18900, %g1, %r30
	setx 0x051eb59d41eb73c2, %g1, %r31
	save
	setx 0x035f74b68fabb293, %g1, %r16
	setx 0xe92953e54bafaf57, %g1, %r17
	setx 0x249692392a369ec7, %g1, %r18
	setx 0xedf0669ed69fac54, %g1, %r19
	setx 0x1e83551d635042ad, %g1, %r20
	setx 0x6e9a892d4f20eb32, %g1, %r21
	setx 0x8506abf0be679ba3, %g1, %r22
	setx 0x8b726b84c58f9018, %g1, %r23
	setx 0xead8030986effbe2, %g1, %r24
	setx 0x3d5034ab73cc9cdd, %g1, %r25
	setx 0xd83b62fbceb0196e, %g1, %r26
	setx 0x3131ac93705c682d, %g1, %r27
	setx 0x0a69dd0665e530fa, %g1, %r28
	setx 0x89094f7e57af6021, %g1, %r29
	setx 0xdc1c9e8269abf643, %g1, %r30
	setx 0x40c71d02191db72e, %g1, %r31
	save
	setx 0x75728bc39310fd2a, %g1, %r16
	setx 0x83806ae7ac89f1fa, %g1, %r17
	setx 0x3e08827f4ac9eead, %g1, %r18
	setx 0x768377c48d6d1321, %g1, %r19
	setx 0x66c71f69550c171c, %g1, %r20
	setx 0x296edd444a2ec6c1, %g1, %r21
	setx 0x01a127aeecf1b4ed, %g1, %r22
	setx 0x400dc7477010cc39, %g1, %r23
	setx 0x5b30c22ec9b8d3f6, %g1, %r24
	setx 0x4fd4f9f11d7015f6, %g1, %r25
	setx 0x36a6a4d38baa2a6b, %g1, %r26
	setx 0xf914ac288c20226a, %g1, %r27
	setx 0xe5728ab985fc4c91, %g1, %r28
	setx 0x9282b8a07cb1220f, %g1, %r29
	setx 0x07ade683d102c979, %g1, %r30
	setx 0x0cae1f48be94dea1, %g1, %r31
	save
	setx 0x062139ea7d5c1a77, %g1, %r16
	setx 0x2c891632c8295192, %g1, %r17
	setx 0xe8d92c5ad6d4949c, %g1, %r18
	setx 0x675f0d28444a8525, %g1, %r19
	setx 0x05beaf2d23b6002f, %g1, %r20
	setx 0x891e27348d1e435c, %g1, %r21
	setx 0x523dec9d38131414, %g1, %r22
	setx 0xfef78dd82326bfda, %g1, %r23
	setx 0xe77baea448748410, %g1, %r24
	setx 0xb7bec092ad5a3176, %g1, %r25
	setx 0xc40bbccc185dbb45, %g1, %r26
	setx 0x12c567ec274916eb, %g1, %r27
	setx 0x1c1e3808b59da275, %g1, %r28
	setx 0x0c626405199a0853, %g1, %r29
	setx 0x1be344cd726ab3fc, %g1, %r30
	setx 0xf7d0da1b2a56dcd4, %g1, %r31
	save
	setx 0x394799688ab3c707, %g1, %r16
	setx 0x6e99f0f6c440705f, %g1, %r17
	setx 0x590fe2bb59f6155b, %g1, %r18
	setx 0xa4816b8728b04320, %g1, %r19
	setx 0x69b9657122763018, %g1, %r20
	setx 0xf8319dfd9ad8590a, %g1, %r21
	setx 0x67aecefb7955f632, %g1, %r22
	setx 0xe07853f53fa5046b, %g1, %r23
	setx 0x88b22dd4cb567f53, %g1, %r24
	setx 0xb3cac0339fdfdcaa, %g1, %r25
	setx 0xf4819b7709afb1f6, %g1, %r26
	setx 0x7737c6abad53a3a6, %g1, %r27
	setx 0xc0b205d9b85306dd, %g1, %r28
	setx 0xa72d5bf5425ecf73, %g1, %r29
	setx 0xcf528742cc6e72ba, %g1, %r30
	setx 0x16371778059ba26b, %g1, %r31
	save
	setx 0xe04fd2c14595cd1c, %g1, %r16
	setx 0x05b7ff4b4243b691, %g1, %r17
	setx 0xeb9db80c4823a67f, %g1, %r18
	setx 0x15b10f26bf797130, %g1, %r19
	setx 0x2655d6c4778a8123, %g1, %r20
	setx 0x5b8a3dc55251cb9a, %g1, %r21
	setx 0x9bac3e3db9b08e0f, %g1, %r22
	setx 0x5767ac44f847041b, %g1, %r23
	setx 0x542b54e112d80fb1, %g1, %r24
	setx 0xa001ae5faa7938d9, %g1, %r25
	setx 0x2bfb931b56d00596, %g1, %r26
	setx 0xadd1670da7bc1e0d, %g1, %r27
	setx 0xc8cab9a740cb958c, %g1, %r28
	setx 0xcf2a9938f189d7ad, %g1, %r29
	setx 0x0931faa3341cf7d8, %g1, %r30
	setx 0xc270bf047ab1f7ea, %g1, %r31
	save
	setx 0xe4cf37479de8bc60, %g1, %r16
	setx 0x6d045c8b1794fb23, %g1, %r17
	setx 0xad45c7e8aa102c82, %g1, %r18
	setx 0x582c83dec38c6056, %g1, %r19
	setx 0xd7e8c28cd235e279, %g1, %r20
	setx 0xc1d8a6f5ef417141, %g1, %r21
	setx 0x53896fa4be5992c6, %g1, %r22
	setx 0x2459d5914027594f, %g1, %r23
	setx 0x5c6ab98040d6adc6, %g1, %r24
	setx 0x3dd5c788bea79f5d, %g1, %r25
	setx 0x89d108389fba7674, %g1, %r26
	setx 0x6d242f51dcea0406, %g1, %r27
	setx 0xcd09dd2ea32db5f9, %g1, %r28
	setx 0x032026ae2ca1510e, %g1, %r29
	setx 0x9c9fd97b20e9a1ca, %g1, %r30
	setx 0x80408df511569e94, %g1, %r31
	save
	setx 0x0d83bb097b4e5c41, %g1, %r16
	setx 0x7d06c712bd39c834, %g1, %r17
	setx 0xb3fb48810ced4d50, %g1, %r18
	setx 0x6a0d906d15cc19f3, %g1, %r19
	setx 0xb3b38604c106ec5a, %g1, %r20
	setx 0x272b81285cf001bf, %g1, %r21
	setx 0x50b40ce49bdeea72, %g1, %r22
	setx 0xde928b1a8f598b4b, %g1, %r23
	setx 0xe0ca96c0ff8b7f05, %g1, %r24
	setx 0x70b0802505ba8762, %g1, %r25
	setx 0x92f7c05c6a443df0, %g1, %r26
	setx 0x3e972954956a4227, %g1, %r27
	setx 0x365f825e78e9ad2a, %g1, %r28
	setx 0xbe2f53eb3036e52b, %g1, %r29
	setx 0xd838ba72445db08c, %g1, %r30
	setx 0x78dd454002136079, %g1, %r31
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
	.word 0xb3e4c000  ! 3: SAVE_R	save	%r19, %r0, %r25
cpu_intr_0_0:
	setx	0x18031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e16d  ! 10: SAVE_I	save	%r23, 0x0001, %r31
iob_intr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_0), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_1:
	setx	0x1d0009, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_0:
	mov	0x17, %r14
	.word 0xfcf38e40  ! 15: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_1), 16, 16)) -> intp(0, 0, 37)
T0_asi_reg_rd_0:
	mov	0x2f, %r14
	.word 0xf4db8e80  ! 17: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T0_asi_reg_wr_1:
	mov	0x2d, %r14
	.word 0xf4f384a0  ! 18: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_2), 16, 16)) -> intp(0, 0, 4)
	.word 0xbbe48000  ! 21: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_wr_2:
	mov	0x12, %r14
	.word 0xf4f38e40  ! 26: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_wr_3:
	mov	0x3c7, %r14
	.word 0xfaf38e40  ! 27: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_0_2:
	setx	0x1c0035, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_3), 16, 16)) -> intp(0, 0, 7)
	.word 0xbbe4a103  ! 32: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb7e4608a  ! 33: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbfe50000  ! 34: SAVE_R	save	%r20, %r0, %r31
	.word 0xbde46176  ! 36: SAVE_I	save	%r17, 0x0001, %r30
iob_intr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_4), 16, 16)) -> intp(0, 0, a)
cpu_intr_0_3:
	setx	0x1e0317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe48000  ! 41: SAVE_R	save	%r18, %r0, %r29
	.word 0xb5e5a09a  ! 42: SAVE_I	save	%r22, 0x0001, %r26
iob_intr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_5), 16, 16)) -> intp(0, 0, 33)
	.word 0xbd354000  ! 44: SRL_R	srl 	%r21, %r0, %r30
	.word 0xb9e54000  ! 45: SAVE_R	save	%r21, %r0, %r28
	.word 0xbfe54000  ! 46: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_6), 16, 16)) -> intp(0, 0, 34)
	.word 0xb7e4e050  ! 52: SAVE_I	save	%r19, 0x0001, %r27
	.word 0x8d956089  ! 53: WRPR_PSTATE_I	wrpr	%r21, 0x0089, %pstate
iob_intr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_7), 16, 16)) -> intp(0, 0, 32)
iob_intr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_8), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_4:
	setx	0x1c0022, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_5:
	setx	0x1c0010, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_9), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_rd_1:
	mov	0x3c8, %r14
	.word 0xfcdb8e40  ! 72: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb9e520f5  ! 73: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb0a40000  ! 74: SUBcc_R	subcc 	%r16, %r0, %r24
	.word 0xb1e5a1f0  ! 76: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_rd_2:
	mov	0x3c2, %r14
	.word 0xfadb8e40  ! 80: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb29de12c  ! 81: XORcc_I	xorcc 	%r23, 0x012c, %r25
cpu_intr_0_6:
	setx	0x1d0119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba8d21cd  ! 84: ANDcc_I	andcc 	%r20, 0x01cd, %r29
	.word 0xbbe58000  ! 86: SAVE_R	save	%r22, %r0, %r29
iob_intr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_10), 16, 16)) -> intp(0, 0, a)
T0_asi_reg_wr_4:
	mov	0x21, %r14
	.word 0xf2f38e80  ! 92: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbbe4609a  ! 93: SAVE_I	save	%r17, 0x0001, %r29
iob_intr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_11), 16, 16)) -> intp(0, 0, 23)
	.word 0xb7e5c000  ! 96: SAVE_R	save	%r23, %r0, %r27
iob_intr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_12), 16, 16)) -> intp(0, 0, 36)
cpu_intr_0_7:
	setx	0x1c0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc14c000  ! 106: OR_R	or 	%r19, %r0, %r30
	.word 0xbde48000  ! 108: SAVE_R	save	%r18, %r0, %r30
	.word 0xb1e4e0c4  ! 110: SAVE_I	save	%r19, 0x0001, %r24
cpu_intr_0_8:
	setx	0x1c021c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_9:
	setx	0x1d0024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_10:
	setx	0x1e012c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_11:
	setx	0x1e0238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e421aa  ! 119: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb4150000  ! 121: OR_R	or 	%r20, %r0, %r26
	.word 0xbfe5a00e  ! 122: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_13), 16, 16)) -> intp(0, 0, 2e)
cpu_intr_0_12:
	setx	0x1f013d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_14), 16, 16)) -> intp(0, 0, 4)
	.word 0xbde52019  ! 128: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb4956195  ! 130: ORcc_I	orcc 	%r21, 0x0195, %r26
	.word 0xbfe58000  ! 132: SAVE_R	save	%r22, %r0, %r31
T0_asi_reg_wr_5:
	mov	0x6, %r14
	.word 0xfef38400  ! 134: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb3e48000  ! 135: SAVE_R	save	%r18, %r0, %r25
	.word 0xb7e5a02d  ! 139: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb7e4c000  ! 143: SAVE_R	save	%r19, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb8c5e070  ! 149: ADDCcc_I	addccc 	%r23, 0x0070, %r28
cpu_intr_0_13:
	setx	0x1c010b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_15), 16, 16)) -> intp(0, 0, 31)
T0_asi_reg_wr_6:
	mov	0x3c7, %r14
	.word 0xf2f38e80  ! 158: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_16), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb1e5a0f6  ! 162: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_rd_3:
	mov	0x13, %r14
	.word 0xf4db8e40  ! 163: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_17), 16, 16)) -> intp(0, 0, 1d)
	.word 0xbfe52116  ! 176: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb5e44000  ! 177: SAVE_R	save	%r17, %r0, %r26
cpu_intr_0_14:
	setx	0x1c0009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe42177  ! 190: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_wr_7:
	mov	0xc, %r14
	.word 0xf6f384a0  ! 194: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_18), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb13db001  ! 197: SRAX_I	srax	%r22, 0x0001, %r24
cpu_intr_0_15:
	setx	0x1d0125, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_16:
	setx	0x1e031b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_17:
	setx	0x1e0203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe54000  ! 207: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_19), 16, 16)) -> intp(0, 0, 27)
	.word 0xb1e4e11b  ! 212: SAVE_I	save	%r19, 0x0001, %r24
iob_intr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_20), 16, 16)) -> intp(0, 0, 33)
	.word 0xb9e40000  ! 215: SAVE_R	save	%r16, %r0, %r28
cpu_intr_0_18:
	setx	0x1c001a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_19:
	setx	0x1c0128, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_21), 16, 16)) -> intp(0, 0, 36)
	.word 0xbde58000  ! 219: SAVE_R	save	%r22, %r0, %r30
iob_intr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_22), 16, 16)) -> intp(0, 0, 6)
	.word 0xb3e4e1b4  ! 221: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbfe4c000  ! 222: SAVE_R	save	%r19, %r0, %r31
	.word 0xb8ac8000  ! 225: ANDNcc_R	andncc 	%r18, %r0, %r28
T0_asi_reg_wr_8:
	mov	0x37, %r14
	.word 0xf2f384a0  ! 227: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb5e4a11d  ! 228: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbe344000  ! 230: SUBC_R	orn 	%r17, %r0, %r31
cpu_intr_0_20:
	setx	0x1e0332, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_4:
	mov	0x3c7, %r14
	.word 0xf8db8e80  ! 233: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_23), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb28561d1  ! 236: ADDcc_I	addcc 	%r21, 0x01d1, %r25
T0_asi_reg_wr_9:
	mov	0x33, %r14
	.word 0xfcf38400  ! 237: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_0_21:
	setx	0x1e0133, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_24), 16, 16)) -> intp(0, 0, 22)
	.word 0xb9e460ca  ! 241: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_25), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_26), 16, 16)) -> intp(0, 0, 32)
T0_asi_reg_rd_5:
	mov	0x3c7, %r14
	.word 0xf6db8e40  ! 257: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb3e4a029  ! 259: SAVE_I	save	%r18, 0x0001, %r25
cpu_intr_0_22:
	setx	0x1f0111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5c000  ! 262: SAVE_R	save	%r23, %r0, %r24
	.word 0xbde58000  ! 263: SAVE_R	save	%r22, %r0, %r30
	.word 0xb1e4e0c6  ! 264: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_wr_10:
	mov	0x13, %r14
	.word 0xfaf38400  ! 266: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbfe4203b  ! 267: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5e5e1fc  ! 273: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_rd_6:
	mov	0x3c0, %r14
	.word 0xfedb8e40  ! 275: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_27), 16, 16)) -> intp(0, 0, 3d)
iob_intr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_28), 16, 16)) -> intp(0, 0, 22)
T0_asi_reg_wr_11:
	mov	0x33, %r14
	.word 0xf6f389e0  ! 282: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xbde58000  ! 283: SAVE_R	save	%r22, %r0, %r30
	.word 0xbbe420c2  ! 285: SAVE_I	save	%r16, 0x0001, %r29
cpu_intr_0_23:
	setx	0x1e022a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_29), 16, 16)) -> intp(0, 0, 11)
	.word 0xbfe5610b  ! 288: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbbe4a069  ! 290: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbbe4c000  ! 298: SAVE_R	save	%r19, %r0, %r29
	.word 0xbbe5607d  ! 306: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb3e40000  ! 307: SAVE_R	save	%r16, %r0, %r25
	.word 0xb9e5a187  ! 308: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_wr_12:
	mov	0x3c7, %r14
	.word 0xf0f38e40  ! 309: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_wr_13:
	mov	0x3c4, %r14
	.word 0xf4f38e40  ! 312: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_wr_14:
	mov	0x3c3, %r14
	.word 0xf6f38e40  ! 315: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb1e40000  ! 318: SAVE_R	save	%r16, %r0, %r24
	.word 0xb1e44000  ! 319: SAVE_R	save	%r17, %r0, %r24
	.word 0xbfe4e1a9  ! 321: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9e4e1c2  ! 322: SAVE_I	save	%r19, 0x0001, %r28
iob_intr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_30), 16, 16)) -> intp(0, 0, 23)
	.word 0xb7e4613c  ! 331: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbfe5e1b7  ! 332: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbbe40000  ! 336: SAVE_R	save	%r16, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe50000  ! 340: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_31), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbfe5c000  ! 348: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_32), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_rd_7:
	mov	0x29, %r14
	.word 0xfcdb8e60  ! 351: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb9e5a18f  ! 355: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbfe420b0  ! 357: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbbe4c000  ! 358: SAVE_R	save	%r19, %r0, %r29
	.word 0xbbe5c000  ! 359: SAVE_R	save	%r23, %r0, %r29
	.word 0xb9e5217e  ! 361: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb9e52024  ! 364: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb7e44000  ! 365: SAVE_R	save	%r17, %r0, %r27
cpu_intr_0_24:
	setx	0x1c001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a0b1  ! 374: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3e58000  ! 379: SAVE_R	save	%r22, %r0, %r25
iob_intr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_33), 16, 16)) -> intp(0, 0, 5)
T0_asi_reg_rd_8:
	mov	0x3c0, %r14
	.word 0xfadb89e0  ! 382: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_34), 16, 16)) -> intp(0, 0, 12)
	.word 0xbca4a108  ! 385: SUBcc_I	subcc 	%r18, 0x0108, %r30
T0_asi_reg_rd_9:
	mov	0x3c3, %r14
	.word 0xf8db8e40  ! 386: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb3e44000  ! 387: SAVE_R	save	%r17, %r0, %r25
	.word 0xbde4204b  ! 393: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb014e0e4  ! 395: OR_I	or 	%r19, 0x00e4, %r24
iob_intr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_35), 16, 16)) -> intp(0, 0, 27)
T0_asi_reg_wr_15:
	mov	0x3c7, %r14
	.word 0xf6f38e80  ! 407: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T0_asi_reg_rd_10:
	mov	0x12, %r14
	.word 0xfedb8400  ! 410: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_36), 16, 16)) -> intp(0, 0, 2e)
T0_asi_reg_rd_11:
	mov	0x2c, %r14
	.word 0xf0db89e0  ! 413: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_0_25:
	setx	0x1f0106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0440000  ! 417: ADDC_R	addc 	%r16, %r0, %r24
cpu_intr_0_26:
	setx	0x1c002e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_37), 16, 16)) -> intp(0, 0, 0)
cpu_intr_0_27:
	setx	0x1c020b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_28:
	setx	0x1e0218, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_38), 16, 16)) -> intp(0, 0, 17)
cpu_intr_0_29:
	setx	0x1e020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4207c  ! 434: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_rd_12:
	mov	0x3c3, %r14
	.word 0xf4db8e80  ! 435: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbbe4e1a4  ! 436: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb8c4e087  ! 438: ADDCcc_I	addccc 	%r19, 0x0087, %r28
cpu_intr_0_30:
	setx	0x1d0219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6346078  ! 443: ORN_I	orn 	%r17, 0x0078, %r27
T0_asi_reg_rd_13:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 444: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb9e5a18f  ! 446: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbfe5a178  ! 449: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_39), 16, 16)) -> intp(0, 0, 1)
cpu_intr_0_31:
	setx	0x1c011c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_16:
	mov	0x3c1, %r14
	.word 0xf8f38e40  ! 456: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb7351000  ! 461: SRLX_R	srlx	%r20, %r0, %r27
cpu_intr_0_32:
	setx	0x1d023a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_33:
	setx	0x1f0032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xa1902001  ! 464: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xb7e54000  ! 465: SAVE_R	save	%r21, %r0, %r27
iob_intr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_40), 16, 16)) -> intp(0, 0, 2f)
T0_asi_reg_wr_17:
	mov	0x28, %r14
	.word 0xf4f38e60  ! 469: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb3e5e13c  ! 470: SAVE_I	save	%r23, 0x0001, %r25
cpu_intr_0_34:
	setx	0x1e0133, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_14:
	mov	0x3c8, %r14
	.word 0xf8db8e60  ! 475: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb7e461d3  ! 476: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb3e461c5  ! 479: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3e48000  ! 481: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_rd_15:
	mov	0x29, %r14
	.word 0xf6db84a0  ! 483: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb5e4e001  ! 485: SAVE_I	save	%r19, 0x0001, %r26
cpu_intr_0_35:
	setx	0x220119, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_18:
	mov	0x3c4, %r14
	.word 0xfcf384a0  ! 489: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_0_36:
	setx	0x200305, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_37:
	setx	0x220321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e50000  ! 498: SAVE_R	save	%r20, %r0, %r25
	.word 0xbaa4c000  ! 501: SUBcc_R	subcc 	%r19, %r0, %r29
cpu_intr_0_38:
	setx	0x200030, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_41), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_rd_16:
	mov	0x25, %r14
	.word 0xf8db8e60  ! 510: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_42), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb3e520e3  ! 513: SAVE_I	save	%r20, 0x0001, %r25
iob_intr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_43), 16, 16)) -> intp(0, 0, 8)
	.word 0xb1e4c000  ! 526: SAVE_R	save	%r19, %r0, %r24
	.word 0xb1e5e0a5  ! 527: SAVE_I	save	%r23, 0x0001, %r24
cpu_intr_0_39:
	setx	0x220300, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_44), 16, 16)) -> intp(0, 0, 29)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb80d0000  ! 532: AND_R	and 	%r20, %r0, %r28
	.word 0xbbe40000  ! 533: SAVE_R	save	%r16, %r0, %r29
	.word 0xb1e4c000  ! 534: SAVE_R	save	%r19, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_45), 16, 16)) -> intp(0, 0, 14)
cpu_intr_0_40:
	setx	0x23023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5c000  ! 540: SAVE_R	save	%r23, %r0, %r30
T0_asi_reg_rd_17:
	mov	0x2c, %r14
	.word 0xf2db8e60  ! 542: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_0_41:
	setx	0x220007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e420a1  ! 547: SAVE_I	save	%r16, 0x0001, %r28
iob_intr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_46), 16, 16)) -> intp(0, 0, 31)
	.word 0xb9e5a046  ! 559: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3e5605d  ! 560: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb3e40000  ! 561: SAVE_R	save	%r16, %r0, %r25
T0_asi_reg_rd_18:
	mov	0x1d, %r14
	.word 0xfadb8e40  ! 563: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb1e4e024  ! 564: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb1e44000  ! 568: SAVE_R	save	%r17, %r0, %r24
	.word 0xb7e4e0e2  ! 570: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb9e58000  ! 573: SAVE_R	save	%r22, %r0, %r28
iob_intr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_47), 16, 16)) -> intp(0, 0, 38)
T0_asi_reg_rd_19:
	mov	0x19, %r14
	.word 0xfadb8400  ! 575: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_0_42:
	setx	0x20002c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_20:
	mov	0x38, %r14
	.word 0xfadb8e40  ! 580: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbfe5a165  ! 581: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb0444000  ! 583: ADDC_R	addc 	%r17, %r0, %r24
T0_asi_reg_wr_19:
	mov	0x3c0, %r14
	.word 0xfaf38400  ! 584: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbde5a1dd  ! 586: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_wr_20:
	mov	0x7, %r14
	.word 0xf6f38e60  ! 588: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb5e48000  ! 591: SAVE_R	save	%r18, %r0, %r26
	.word 0xbe8da021  ! 592: ANDcc_I	andcc 	%r22, 0x0021, %r31
	.word 0xb9e46093  ! 593: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbe1d4000  ! 594: XOR_R	xor 	%r21, %r0, %r31
	.word 0xbfe50000  ! 596: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_43:
	setx	0x230027, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_21:
	mov	0x10, %r14
	.word 0xf0db8e80  ! 598: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T0_asi_reg_wr_21:
	mov	0x36, %r14
	.word 0xfaf38e60  ! 603: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_48), 16, 16)) -> intp(0, 0, 3e)
T0_asi_reg_wr_22:
	mov	0x3c7, %r14
	.word 0xf4f389e0  ! 609: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbbe50000  ! 610: SAVE_R	save	%r20, %r0, %r29
	.word 0xb7e420a8  ! 611: SAVE_I	save	%r16, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe50000  ! 615: SAVE_R	save	%r20, %r0, %r29
	.word 0xb3e48000  ! 620: SAVE_R	save	%r18, %r0, %r25
cpu_intr_0_44:
	setx	0x220238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a0a7  ! 626: SAVE_I	save	%r22, 0x0001, %r31
T0_asi_reg_wr_23:
	mov	0x24, %r14
	.word 0xfef38e80  ! 628: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_0_45:
	setx	0x22022d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_46:
	setx	0x23000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a1e5  ! 631: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e5e17d  ! 634: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_wr_24:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 638: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_wr_25:
	mov	0x15, %r14
	.word 0xf4f38400  ! 643: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_49), 16, 16)) -> intp(0, 0, 28)
	.word 0xb3e58000  ! 645: SAVE_R	save	%r22, %r0, %r25
	.word 0xb645a134  ! 646: ADDC_I	addc 	%r22, 0x0134, %r27
cpu_intr_0_47:
	setx	0x22003a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_26:
	mov	0x3c0, %r14
	.word 0xf2f38e60  ! 650: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T0_asi_reg_wr_27:
	mov	0x34, %r14
	.word 0xfef38e40  ! 652: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_rd_22:
	mov	0x3c4, %r14
	.word 0xf4db8e40  ! 654: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T0_asi_reg_wr_28:
	mov	0x33, %r14
	.word 0xf0f38e60  ! 655: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_50), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb9e4c000  ! 658: SAVE_R	save	%r19, %r0, %r28
	.word 0xbe254000  ! 659: SUB_R	sub 	%r21, %r0, %r31
iob_intr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_51), 16, 16)) -> intp(0, 0, 20)
cpu_intr_0_48:
	setx	0x230005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb02d60da  ! 662: ANDN_I	andn 	%r21, 0x00da, %r24
	.word 0xbbe4a0ae  ! 663: SAVE_I	save	%r18, 0x0001, %r29
T0_asi_reg_rd_23:
	mov	0x3c2, %r14
	.word 0xf6db8e40  ! 664: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbde44000  ! 666: SAVE_R	save	%r17, %r0, %r30
	.word 0xb684217a  ! 671: ADDcc_I	addcc 	%r16, 0x017a, %r27
iob_intr_0_52:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_52), 16, 16)) -> intp(0, 0, 16)
	.word 0xb7e5a083  ! 673: SAVE_I	save	%r22, 0x0001, %r27
iob_intr_0_53:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_53), 16, 16)) -> intp(0, 0, 12)
cpu_intr_0_49:
	setx	0x22030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_50:
	setx	0x200214, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_54:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_54), 16, 16)) -> intp(0, 0, 20)
	.word 0xb9e421f3  ! 682: SAVE_I	save	%r16, 0x0001, %r28
cpu_intr_0_51:
	setx	0x210213, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_55:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_55), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb5643801  ! 688: MOVcc_I	<illegal instruction>
	.word 0xb9e5a034  ! 689: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_rd_24:
	mov	0x1a, %r14
	.word 0xf8db8e80  ! 691: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T0_asi_reg_wr_29:
	mov	0x3c0, %r14
	.word 0xfaf38e40  ! 692: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_56:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_56), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_wr_30:
	mov	0x17, %r14
	.word 0xf8f384a0  ! 696: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_0_57:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_57), 16, 16)) -> intp(0, 0, d)
cpu_intr_0_52:
	setx	0x23031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3db001  ! 703: SRAX_I	srax	%r22, 0x0001, %r29
cpu_intr_0_53:
	setx	0x220237, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_25:
	mov	0x3c5, %r14
	.word 0xfcdb8e40  ! 707: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_54:
	setx	0x220301, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_58:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_58), 16, 16)) -> intp(0, 0, 34)
iob_intr_0_59:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_59), 16, 16)) -> intp(0, 0, 10)
	.word 0xbfe5a0e3  ! 718: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_60:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_60), 16, 16)) -> intp(0, 0, 34)
cpu_intr_0_55:
	setx	0x210201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5a08b  ! 724: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_wr_31:
	mov	0x19, %r14
	.word 0xf0f38e40  ! 726: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb9e4c000  ! 727: SAVE_R	save	%r19, %r0, %r28
	.word 0xbfe5a1e8  ! 728: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe44000  ! 731: SAVE_R	save	%r17, %r0, %r29
iob_intr_0_61:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_61), 16, 16)) -> intp(0, 0, d)
iob_intr_0_62:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_62), 16, 16)) -> intp(0, 0, 25)
	.word 0xb68c8000  ! 735: ANDcc_R	andcc 	%r18, %r0, %r27
	.word 0xb0bd0000  ! 736: XNORcc_R	xnorcc 	%r20, %r0, %r24
T0_asi_reg_wr_32:
	mov	0x8, %r14
	.word 0xf8f389e0  ! 737: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_0_63:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_63), 16, 16)) -> intp(0, 0, 3b)
cpu_intr_0_56:
	setx	0x21022a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_57:
	setx	0x200120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe44000  ! 744: SAVE_R	save	%r17, %r0, %r29
	.word 0xbbe4c000  ! 746: SAVE_R	save	%r19, %r0, %r29
	.word 0x8f902001  ! 747: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
iob_intr_0_64:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_64), 16, 16)) -> intp(0, 0, 27)
	.word 0xbfe54000  ! 753: SAVE_R	save	%r21, %r0, %r31
	.word 0xb7e40000  ! 756: SAVE_R	save	%r16, %r0, %r27
	.word 0xbde48000  ! 759: SAVE_R	save	%r18, %r0, %r30
cpu_intr_0_58:
	setx	0x23023e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_33:
	mov	0x37, %r14
	.word 0xf8f38e40  ! 763: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_59:
	setx	0x22031d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_34:
	mov	0x3c2, %r14
	.word 0xf2f38e80  ! 766: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_0_60:
	setx	0x220207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a0ad  ! 770: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb23da15c  ! 772: XNOR_I	xnor 	%r22, 0x015c, %r25
T0_asi_reg_rd_26:
	mov	0x35, %r14
	.word 0xf6db8e60  ! 774: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_0_65:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_65), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb9e58000  ! 779: SAVE_R	save	%r22, %r0, %r28
cpu_intr_0_61:
	setx	0x220329, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_35:
	mov	0x25, %r14
	.word 0xfcf38e40  ! 784: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbbe54000  ! 791: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_66:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_66), 16, 16)) -> intp(0, 0, 6)
cpu_intr_0_62:
	setx	0x21003a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_67:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_67), 16, 16)) -> intp(0, 0, 3d)
cpu_intr_0_63:
	setx	0x23013d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_27:
	mov	0x3c6, %r14
	.word 0xf6db8400  ! 799: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T0_asi_reg_wr_36:
	mov	0x0, %r14
	.word 0xf4f38e80  ! 800: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb625a10e  ! 804: SUB_I	sub 	%r22, 0x010e, %r27
cpu_intr_0_64:
	setx	0x23020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_37:
	mov	0x2d, %r14
	.word 0xf6f38e40  ! 808: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_wr_38:
	mov	0x3c3, %r14
	.word 0xfaf38e80  ! 810: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbfe44000  ! 811: SAVE_R	save	%r17, %r0, %r31
T0_asi_reg_wr_39:
	mov	0x35, %r14
	.word 0xfaf38e40  ! 812: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_0_65:
	setx	0x200333, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_40:
	mov	0x2f, %r14
	.word 0xfef38400  ! 815: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_0_68:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_68), 16, 16)) -> intp(0, 0, 24)
	.word 0xb7e4e020  ! 819: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb3e4a023  ! 820: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb5e48000  ! 826: SAVE_R	save	%r18, %r0, %r26
T0_asi_reg_wr_41:
	mov	0x2, %r14
	.word 0xf4f38e60  ! 827: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xbfe5e07f  ! 831: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3e54000  ! 833: SAVE_R	save	%r21, %r0, %r25
T0_asi_reg_wr_42:
	mov	0x3c7, %r14
	.word 0xfef38400  ! 835: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_0_66:
	setx	0x23020e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_69:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_69), 16, 16)) -> intp(0, 0, 2a)
cpu_intr_0_67:
	setx	0x220038, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_43:
	mov	0x3c4, %r14
	.word 0xfcf38400  ! 840: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T0_asi_reg_wr_44:
	mov	0x3c4, %r14
	.word 0xfcf38e60  ! 843: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb3e4a1e8  ! 844: SAVE_I	save	%r18, 0x0001, %r25
T0_asi_reg_wr_45:
	mov	0x3c6, %r14
	.word 0xf8f38e40  ! 849: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbbe58000  ! 850: SAVE_R	save	%r22, %r0, %r29
	.word 0xbde46197  ! 852: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb5e560c4  ! 854: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbbe54000  ! 859: SAVE_R	save	%r21, %r0, %r29
	.word 0xb5e4c000  ! 860: SAVE_R	save	%r19, %r0, %r26
	.word 0xb434a0e4  ! 861: SUBC_I	orn 	%r18, 0x00e4, %r26
cpu_intr_0_68:
	setx	0x200130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e10f  ! 864: SAVE_I	save	%r23, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3e4e123  ! 867: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1e4c000  ! 871: SAVE_R	save	%r19, %r0, %r24
cpu_intr_0_69:
	setx	0x200306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1643801  ! 878: MOVcc_I	<illegal instruction>
cpu_intr_0_70:
	setx	0x230217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe48000  ! 880: SAVE_R	save	%r18, %r0, %r31
cpu_intr_0_71:
	setx	0x230003, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_72:
	setx	0x230226, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_70:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_70), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_71:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_71), 16, 16)) -> intp(0, 0, 1)
	.word 0xbb641800  ! 892: MOVcc_R	<illegal instruction>
T0_asi_reg_wr_46:
	mov	0xf, %r14
	.word 0xfcf38400  ! 893: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_0_73:
	setx	0x210107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e48000  ! 895: SAVE_R	save	%r18, %r0, %r28
T0_asi_reg_wr_47:
	mov	0x3c4, %r14
	.word 0xf8f38e80  ! 896: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T0_asi_reg_rd_28:
	mov	0x0, %r14
	.word 0xfcdb8e80  ! 899: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb3e4a17e  ! 900: SAVE_I	save	%r18, 0x0001, %r25
cpu_intr_0_74:
	setx	0x200329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1354000  ! 903: SRL_R	srl 	%r21, %r0, %r24
	.word 0xb7e44000  ! 906: SAVE_R	save	%r17, %r0, %r27
	.word 0xb1e561a9  ! 910: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e58000  ! 913: SAVE_R	save	%r22, %r0, %r28
	.word 0xbebd4000  ! 915: XNORcc_R	xnorcc 	%r21, %r0, %r31
iob_intr_0_72:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_72), 16, 16)) -> intp(0, 0, 29)
T0_asi_reg_wr_48:
	mov	0x6, %r14
	.word 0xfef38e60  ! 920: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb5e40000  ! 923: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_wr_49:
	mov	0x5, %r14
	.word 0xf0f38400  ! 926: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb1e4e1b0  ! 927: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbde5a064  ! 928: SAVE_I	save	%r22, 0x0001, %r30
cpu_intr_0_75:
	setx	0x240220, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_73:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_73), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb9e44000  ! 934: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_rd_29:
	mov	0x35, %r14
	.word 0xf0db8e40  ! 936: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_76:
	setx	0x24001a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_74:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_74), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_rd_30:
	mov	0x5, %r14
	.word 0xf2db89e0  ! 939: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_0_75:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_75), 16, 16)) -> intp(0, 0, 32)
	.word 0xb1e40000  ! 946: SAVE_R	save	%r16, %r0, %r24
	.word 0xb8b50000  ! 947: ORNcc_R	orncc 	%r20, %r0, %r28
T0_asi_reg_rd_31:
	mov	0x2f, %r14
	.word 0xf0db8400  ! 949: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbfe5a086  ! 950: SAVE_I	save	%r22, 0x0001, %r31
T0_asi_reg_wr_50:
	mov	0x1b, %r14
	.word 0xf8f384a0  ! 953: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb7e4e05c  ! 954: SAVE_I	save	%r19, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbde46103  ! 956: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe44000  ! 960: SAVE_R	save	%r17, %r0, %r29
cpu_intr_0_77:
	setx	0x24032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb52d5000  ! 964: SLLX_R	sllx	%r21, %r0, %r26
iob_intr_0_76:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_76), 16, 16)) -> intp(0, 0, b)
T0_asi_reg_wr_51:
	mov	0x18, %r14
	.word 0xf4f389e0  ! 970: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T0_asi_reg_wr_52:
	mov	0x23, %r14
	.word 0xfcf38e80  ! 976: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbc9ce0c3  ! 977: XORcc_I	xorcc 	%r19, 0x00c3, %r30
cpu_intr_0_78:
	setx	0x270328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde54000  ! 979: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_77:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_77), 16, 16)) -> intp(0, 0, 25)
	.word 0xbfe5c000  ! 982: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_78:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_78), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbfe42024  ! 989: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5e54000  ! 991: SAVE_R	save	%r21, %r0, %r26
	.word 0xbf3c7001  ! 993: SRAX_I	srax	%r17, 0x0001, %r31
	.word 0xb1e58000  ! 995: SAVE_R	save	%r22, %r0, %r24
iob_intr_0_79:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_79), 16, 16)) -> intp(0, 0, 7)
iob_intr_0_80:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_80), 16, 16)) -> intp(0, 0, 2f)
iob_intr_0_81:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_81), 16, 16)) -> intp(0, 0, 31)
iob_intr_0_82:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_82), 16, 16)) -> intp(0, 0, 9)
	.word 0xbde5a08f  ! 1003: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbfe5c000  ! 1008: SAVE_R	save	%r23, %r0, %r31
T0_asi_reg_rd_32:
	mov	0x28, %r14
	.word 0xf2db89e0  ! 1009: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb9e44000  ! 1013: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_83:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_83), 16, 16)) -> intp(0, 0, 36)
	.word 0xb41521b8  ! 1018: OR_I	or 	%r20, 0x01b8, %r26
	.word 0xbc15211e  ! 1019: OR_I	or 	%r20, 0x011e, %r30
iob_intr_0_84:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_84), 16, 16)) -> intp(0, 0, 29)
cpu_intr_0_79:
	setx	0x270004, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_33:
	mov	0x3c2, %r14
	.word 0xf0db8e80  ! 1028: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_0_80:
	setx	0x270210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a15a  ! 1031: SAVE_I	save	%r22, 0x0001, %r27
iob_intr_0_85:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_85), 16, 16)) -> intp(0, 0, 12)
cpu_intr_0_81:
	setx	0x260336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb834213b  ! 1038: SUBC_I	orn 	%r16, 0x013b, %r28
	.word 0xb1e58000  ! 1041: SAVE_R	save	%r22, %r0, %r24
	.word 0xb5e560dd  ! 1043: SAVE_I	save	%r21, 0x0001, %r26
cpu_intr_0_82:
	setx	0x250110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a096  ! 1047: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9e4c000  ! 1048: SAVE_R	save	%r19, %r0, %r28
	.word 0xb1e50000  ! 1051: SAVE_R	save	%r20, %r0, %r24
	.word 0xb6356016  ! 1054: ORN_I	orn 	%r21, 0x0016, %r27
	.word 0xb7e5e039  ! 1057: SAVE_I	save	%r23, 0x0001, %r27
iob_intr_0_86:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_86), 16, 16)) -> intp(0, 0, 38)
	.word 0xb5e5e0aa  ! 1062: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb7e5e1aa  ! 1063: SAVE_I	save	%r23, 0x0001, %r27
iob_intr_0_87:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_87), 16, 16)) -> intp(0, 0, 13)
	.word 0xb5e5e092  ! 1066: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb3e4c000  ! 1069: SAVE_R	save	%r19, %r0, %r25
T0_asi_reg_wr_53:
	mov	0xa, %r14
	.word 0xf4f38e40  ! 1070: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb5e48000  ! 1071: SAVE_R	save	%r18, %r0, %r26
T0_asi_reg_wr_54:
	mov	0x20, %r14
	.word 0xf8f38e80  ! 1072: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_0_88:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_88), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb5e4a1e8  ! 1075: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb3e48000  ! 1076: SAVE_R	save	%r18, %r0, %r25
cpu_intr_0_83:
	setx	0x25001c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_89:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_89), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb9e4e0f7  ! 1079: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_wr_55:
	mov	0xa, %r14
	.word 0xf0f38e40  ! 1083: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbb343001  ! 1084: SRLX_I	srlx	%r16, 0x0001, %r29
T0_asi_reg_rd_34:
	mov	0x19, %r14
	.word 0xf4db89e0  ! 1087: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T0_asi_reg_wr_56:
	mov	0x24, %r14
	.word 0xfaf389e0  ! 1089: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_0_90:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_90), 16, 16)) -> intp(0, 0, 1d)
	.word 0xbfe48000  ! 1092: SAVE_R	save	%r18, %r0, %r31
	.word 0xb4040000  ! 1094: ADD_R	add 	%r16, %r0, %r26
cpu_intr_0_84:
	setx	0x20318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e48000  ! 1103: SAVE_R	save	%r18, %r0, %r28
T0_asi_reg_rd_35:
	mov	0x32, %r14
	.word 0xfedb8e40  ! 1104: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_0_91:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_91), 16, 16)) -> intp(0, 0, 4)
iob_intr_0_92:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_92), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb7e44000  ! 1109: SAVE_R	save	%r17, %r0, %r27
	.word 0xb1e44000  ! 1111: SAVE_R	save	%r17, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e44000  ! 1113: SAVE_R	save	%r17, %r0, %r28
	.word 0xb7e44000  ! 1114: SAVE_R	save	%r17, %r0, %r27
T0_asi_reg_wr_57:
	mov	0x3c4, %r14
	.word 0xf2f38e80  ! 1119: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_0_85:
	setx	0x260202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e48000  ! 1125: SAVE_R	save	%r18, %r0, %r28
iob_intr_0_93:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_93), 16, 16)) -> intp(0, 0, 14)
iob_intr_0_94:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_94), 16, 16)) -> intp(0, 0, a)
	.word 0xb7e56164  ! 1129: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_wr_58:
	mov	0x3c2, %r14
	.word 0xfcf38e40  ! 1132: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb21c0000  ! 1133: XOR_R	xor 	%r16, %r0, %r25
	.word 0xb62d4000  ! 1135: ANDN_R	andn 	%r21, %r0, %r27
	.word 0xbfe561c0  ! 1138: SAVE_I	save	%r21, 0x0001, %r31
cpu_intr_0_86:
	setx	0x260314, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_87:
	setx	0x26023c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_88:
	setx	0x25013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_36:
	mov	0x2e, %r14
	.word 0xfedb8400  ! 1145: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb9e5a148  ! 1146: SAVE_I	save	%r22, 0x0001, %r28
iob_intr_0_95:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_95), 16, 16)) -> intp(0, 0, 30)
	.word 0xb1e50000  ! 1151: SAVE_R	save	%r20, %r0, %r24
cpu_intr_0_89:
	setx	0x270132, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_90:
	setx	0x27012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 1156: SAVE_R	save	%r22, %r0, %r26
	.word 0xb6254000  ! 1158: SUB_R	sub 	%r21, %r0, %r27
iob_intr_0_96:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_96), 16, 16)) -> intp(0, 0, 14)
	.word 0xbbe5e137  ! 1160: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb1e40000  ! 1164: SAVE_R	save	%r16, %r0, %r24
	.word 0xbde560b7  ! 1165: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb9e421bd  ! 1166: SAVE_I	save	%r16, 0x0001, %r28
iob_intr_0_97:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_97), 16, 16)) -> intp(0, 0, 2d)
iob_intr_0_98:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_98), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_wr_59:
	mov	0x3c1, %r14
	.word 0xf8f38e40  ! 1169: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_rd_37:
	mov	0x2c, %r14
	.word 0xf0db89e0  ! 1172: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbbe44000  ! 1174: SAVE_R	save	%r17, %r0, %r29
	.word 0xbde40000  ! 1176: SAVE_R	save	%r16, %r0, %r30
	.word 0xb8ad8000  ! 1177: ANDNcc_R	andncc 	%r22, %r0, %r28
T0_asi_reg_wr_60:
	mov	0x1e, %r14
	.word 0xf0f38e40  ! 1178: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_rd_38:
	mov	0x35, %r14
	.word 0xf6db8e80  ! 1181: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb7e58000  ! 1183: SAVE_R	save	%r22, %r0, %r27
	.word 0xb7e40000  ! 1184: SAVE_R	save	%r16, %r0, %r27
iob_intr_0_99:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_99), 16, 16)) -> intp(0, 0, 3)
	.word 0xb2b4e194  ! 1189: SUBCcc_I	orncc 	%r19, 0x0194, %r25
iob_intr_0_100:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_100), 16, 16)) -> intp(0, 0, 0)
iob_intr_0_101:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_101), 16, 16)) -> intp(0, 0, 21)
	.word 0xb9e44000  ! 1195: SAVE_R	save	%r17, %r0, %r28
	.word 0xb1e54000  ! 1196: SAVE_R	save	%r21, %r0, %r24
cpu_intr_0_91:
	setx	0x25023e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_92:
	setx	0x27030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde44000  ! 1199: SAVE_R	save	%r17, %r0, %r30
cpu_intr_0_93:
	setx	0x270128, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_39:
	mov	0x24, %r14
	.word 0xfadb8400  ! 1201: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb7e52161  ! 1202: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb5e40000  ! 1204: SAVE_R	save	%r16, %r0, %r26
	.word 0xbb7c2401  ! 1206: MOVR_I	movre	%r16, 0x1, %r29
cpu_intr_0_94:
	setx	0x250205, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_95:
	setx	0x250304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5a063  ! 1210: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb1e5e02d  ! 1211: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb1348000  ! 1213: SRL_R	srl 	%r18, %r0, %r24
cpu_intr_0_96:
	setx	0x26022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a131  ! 1216: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbfe5208a  ! 1217: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_102:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_102), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbfe4a18f  ! 1221: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbbe58000  ! 1223: SAVE_R	save	%r22, %r0, %r29
cpu_intr_0_97:
	setx	0x250206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde42070  ! 1226: SAVE_I	save	%r16, 0x0001, %r30
cpu_intr_0_98:
	setx	0x26023f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_103:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_103), 16, 16)) -> intp(0, 0, 15)
cpu_intr_0_99:
	setx	0x240110, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_104:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_104), 16, 16)) -> intp(0, 0, 2b)
cpu_intr_0_100:
	setx	0x240321, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_40:
	mov	0x3c8, %r14
	.word 0xfadb8e40  ! 1235: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb5e5210a  ! 1239: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb694e1d9  ! 1240: ORcc_I	orcc 	%r19, 0x01d9, %r27
	.word 0xbfe40000  ! 1241: SAVE_R	save	%r16, %r0, %r31
iob_intr_0_105:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_105), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb7e561fe  ! 1247: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbde50000  ! 1253: SAVE_R	save	%r20, %r0, %r30
cpu_intr_0_101:
	setx	0x24013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4c000  ! 1261: SAVE_R	save	%r19, %r0, %r25
T0_asi_reg_wr_61:
	mov	0x2c, %r14
	.word 0xf2f38e40  ! 1264: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbde40000  ! 1266: SAVE_R	save	%r16, %r0, %r30
	.word 0xbfe4e061  ! 1269: SAVE_I	save	%r19, 0x0001, %r31
T0_asi_reg_wr_62:
	mov	0x22, %r14
	.word 0xf8f38400  ! 1270: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_0_102:
	setx	0x250119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6ad21bf  ! 1275: ANDNcc_I	andncc 	%r20, 0x01bf, %r27
T0_asi_reg_rd_41:
	mov	0x27, %r14
	.word 0xf2db8e40  ! 1278: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xba1d0000  ! 1280: XOR_R	xor 	%r20, %r0, %r29
	.word 0xb5e520be  ! 1281: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbde54000  ! 1282: SAVE_R	save	%r21, %r0, %r30
	.word 0xbde561d9  ! 1287: SAVE_I	save	%r21, 0x0001, %r30
cpu_intr_0_103:
	setx	0x270134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e46093  ! 1294: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb9e5a1ff  ! 1295: SAVE_I	save	%r22, 0x0001, %r28
iob_intr_0_106:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_106), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb5e52129  ! 1298: SAVE_I	save	%r20, 0x0001, %r26
iob_intr_0_107:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_107), 16, 16)) -> intp(0, 0, 32)
	.word 0xbfe50000  ! 1302: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_104:
	setx	0x260124, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_108:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_108), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb9e54000  ! 1315: SAVE_R	save	%r21, %r0, %r28
	.word 0xb7e461be  ! 1316: SAVE_I	save	%r17, 0x0001, %r27
T0_asi_reg_rd_42:
	mov	0x30, %r14
	.word 0xfadb8e80  ! 1317: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb9e4e06d  ! 1320: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb80c6171  ! 1325: AND_I	and 	%r17, 0x0171, %r28
cpu_intr_0_105:
	setx	0x27031a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_43:
	mov	0x3c1, %r14
	.word 0xfcdb8e60  ! 1327: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb9e44000  ! 1330: SAVE_R	save	%r17, %r0, %r28
	.word 0xbfe5c000  ! 1332: SAVE_R	save	%r23, %r0, %r31
T0_asi_reg_rd_44:
	mov	0x3c0, %r14
	.word 0xfedb8e80  ! 1333: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T0_asi_reg_wr_63:
	mov	0x3c6, %r14
	.word 0xfcf389e0  ! 1337: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_0_106:
	setx	0x270237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde50000  ! 1342: SAVE_R	save	%r20, %r0, %r30
iob_intr_0_109:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_109), 16, 16)) -> intp(0, 0, 27)
	.word 0xbde50000  ! 1349: SAVE_R	save	%r20, %r0, %r30
	.word 0xbde50000  ! 1350: SAVE_R	save	%r20, %r0, %r30
iob_intr_0_110:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_110), 16, 16)) -> intp(0, 0, a)
cpu_intr_0_107:
	setx	0x24023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e58000  ! 1354: SAVE_R	save	%r22, %r0, %r24
	.word 0xb1e4c000  ! 1356: SAVE_R	save	%r19, %r0, %r24
cpu_intr_0_108:
	setx	0x260322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_109:
	setx	0x26032c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_64:
	mov	0x31, %r14
	.word 0xf2f38e40  ! 1361: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb9e420fe  ! 1362: SAVE_I	save	%r16, 0x0001, %r28
iob_intr_0_111:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_111), 16, 16)) -> intp(0, 0, 28)
	.word 0xbf3ce001  ! 1364: SRA_I	sra 	%r19, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_45:
	mov	0x3c1, %r14
	.word 0xfedb84a0  ! 1367: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T0_asi_reg_wr_65:
	mov	0x24, %r14
	.word 0xf6f38400  ! 1370: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_0_110:
	setx	0x270116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a13a  ! 1376: SAVE_I	save	%r22, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_46:
	mov	0x3c1, %r14
	.word 0xfadb89e0  ! 1383: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_66:
	mov	0xe, %r14
	.word 0xf2f38400  ! 1386: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_0_111:
	setx	0x240203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe8c0000  ! 1388: ANDcc_R	andcc 	%r16, %r0, %r31
T0_asi_reg_rd_47:
	mov	0x11, %r14
	.word 0xfedb84a0  ! 1389: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_0_112:
	setx	0x27033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5c000  ! 1391: SAVE_R	save	%r23, %r0, %r31
	.word 0xb2950000  ! 1393: ORcc_R	orcc 	%r20, %r0, %r25
cpu_intr_0_113:
	setx	0x26030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe460a8  ! 1401: SAVE_I	save	%r17, 0x0001, %r29
T0_asi_reg_rd_48:
	mov	0x29, %r14
	.word 0xfedb8400  ! 1402: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbfe421c7  ! 1403: SAVE_I	save	%r16, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_112:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_112), 16, 16)) -> intp(0, 0, 5)
T0_asi_reg_rd_49:
	mov	0x3c8, %r14
	.word 0xfcdb8400  ! 1409: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_0_113:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_113), 16, 16)) -> intp(0, 0, 3)
	.word 0xb5e56159  ! 1415: SAVE_I	save	%r21, 0x0001, %r26
T0_asi_reg_rd_50:
	mov	0x18, %r14
	.word 0xf6db8e40  ! 1416: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbbe5c000  ! 1418: SAVE_R	save	%r23, %r0, %r29
	.word 0xb9e56037  ! 1422: SAVE_I	save	%r21, 0x0001, %r28
cpu_intr_0_114:
	setx	0x2b0206, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_114:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_114), 16, 16)) -> intp(0, 0, f)
	.word 0xbbe58000  ! 1430: SAVE_R	save	%r22, %r0, %r29
	.word 0xb1e560db  ! 1431: SAVE_I	save	%r21, 0x0001, %r24
iob_intr_0_115:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_115), 16, 16)) -> intp(0, 0, 1)
T0_asi_reg_rd_51:
	mov	0x1, %r14
	.word 0xfcdb84a0  ! 1437: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_0_116:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_116), 16, 16)) -> intp(0, 0, 28)
cpu_intr_0_115:
	setx	0x290119, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_117:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_117), 16, 16)) -> intp(0, 0, 5)
	.word 0xb3e56020  ! 1445: SAVE_I	save	%r21, 0x0001, %r25
T0_asi_reg_wr_67:
	mov	0x3c8, %r14
	.word 0xf2f38400  ! 1446: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_116:
	setx	0x2b030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e54000  ! 1449: SAVE_R	save	%r21, %r0, %r24
	.word 0xb3500000  ! 1454: RDPR_TPC	<illegal instruction>
	.word 0xbbe421cb  ! 1458: SAVE_I	save	%r16, 0x0001, %r29
cpu_intr_0_117:
	setx	0x28031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53db001  ! 1461: SRAX_I	srax	%r22, 0x0001, %r26
cpu_intr_0_118:
	setx	0x290118, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_52:
	mov	0x31, %r14
	.word 0xf6db8e40  ! 1467: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_0_119:
	setx	0x2b0119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd518000  ! 1470: RDPR_PSTATE	<illegal instruction>
	.word 0xbfe58000  ! 1473: SAVE_R	save	%r22, %r0, %r31
	.word 0xb5e5c000  ! 1477: SAVE_R	save	%r23, %r0, %r26
iob_intr_0_118:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_118), 16, 16)) -> intp(0, 0, 32)
T0_asi_reg_rd_53:
	mov	0x3c1, %r14
	.word 0xf6db8400  ! 1482: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_0_119:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_119), 16, 16)) -> intp(0, 0, 3c)
cpu_intr_0_120:
	setx	0x2a0129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e44000  ! 1492: SAVE_R	save	%r17, %r0, %r27
T0_asi_reg_rd_54:
	mov	0x3c2, %r14
	.word 0xfadb8e80  ! 1493: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb735f001  ! 1494: SRLX_I	srlx	%r23, 0x0001, %r27
	.word 0xbde46143  ! 1495: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe4a153  ! 1496: SAVE_I	save	%r18, 0x0001, %r29
cpu_intr_0_121:
	setx	0x2a011a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_120:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_120), 16, 16)) -> intp(0, 0, 3c)
iob_intr_0_121:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_121), 16, 16)) -> intp(0, 0, 25)
	.word 0xb9e52138  ! 1504: SAVE_I	save	%r20, 0x0001, %r28
iob_intr_0_122:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_122), 16, 16)) -> intp(0, 0, 3b)
cpu_intr_0_122:
	setx	0x2b0132, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_68:
	mov	0x1e, %r14
	.word 0xf6f38e60  ! 1511: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_0_123:
	setx	0x2b0205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8a5c000  ! 1513: SUBcc_R	subcc 	%r23, %r0, %r28
	.word 0xbfe58000  ! 1514: SAVE_R	save	%r22, %r0, %r31
cpu_intr_0_124:
	setx	0x2b0226, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_69:
	mov	0x30, %r14
	.word 0xfef38e40  ! 1518: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbbe58000  ! 1521: SAVE_R	save	%r22, %r0, %r29
	.word 0xbfe4c000  ! 1523: SAVE_R	save	%r19, %r0, %r31
	.word 0xb3e54000  ! 1524: SAVE_R	save	%r21, %r0, %r25
	.word 0xbfe40000  ! 1525: SAVE_R	save	%r16, %r0, %r31
T0_asi_reg_wr_70:
	mov	0x2, %r14
	.word 0xfef38e40  ! 1526: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_rd_55:
	mov	0x7, %r14
	.word 0xf4db8e80  ! 1527: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T0_asi_reg_rd_56:
	mov	0x1f, %r14
	.word 0xfedb89e0  ! 1531: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_0_125:
	setx	0x2b0138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e0b7  ! 1534: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_rd_57:
	mov	0x3c3, %r14
	.word 0xf4db8400  ! 1535: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_0_123:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_123), 16, 16)) -> intp(0, 0, 2c)
iob_intr_0_124:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_124), 16, 16)) -> intp(0, 0, 3)
T0_asi_reg_wr_71:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 1543: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbde50000  ! 1545: SAVE_R	save	%r20, %r0, %r30
	.word 0xb5e40000  ! 1547: SAVE_R	save	%r16, %r0, %r26
cpu_intr_0_126:
	setx	0x28023c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_58:
	mov	0x3c3, %r14
	.word 0xfedb89e0  ! 1554: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_0_127:
	setx	0x290017, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_125:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_125), 16, 16)) -> intp(0, 0, 7)
T0_asi_reg_wr_72:
	mov	0x3c0, %r14
	.word 0xf8f38e80  ! 1562: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb9e50000  ! 1564: SAVE_R	save	%r20, %r0, %r28
cpu_intr_0_128:
	setx	0x290327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe40000  ! 1566: SAVE_R	save	%r16, %r0, %r31
T0_asi_reg_wr_73:
	mov	0x20, %r14
	.word 0xf4f38e60  ! 1567: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb5e4c000  ! 1572: SAVE_R	save	%r19, %r0, %r26
	.word 0xb72c4000  ! 1574: SLL_R	sll 	%r17, %r0, %r27
iob_intr_0_126:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_126), 16, 16)) -> intp(0, 0, 30)
	.word 0xbde54000  ! 1578: SAVE_R	save	%r21, %r0, %r30
	.word 0xb5e5a06c  ! 1579: SAVE_I	save	%r22, 0x0001, %r26
iob_intr_0_127:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_127), 16, 16)) -> intp(0, 0, 1)
	.word 0xb89da119  ! 1584: XORcc_I	xorcc 	%r22, 0x0119, %r28
	.word 0xb7e4c000  ! 1585: SAVE_R	save	%r19, %r0, %r27
	.word 0xb7e4c000  ! 1586: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_wr_74:
	mov	0x3c4, %r14
	.word 0xfaf38400  ! 1589: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T0_asi_reg_wr_75:
	mov	0x3c1, %r14
	.word 0xf4f38e40  ! 1590: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_wr_76:
	mov	0x3c8, %r14
	.word 0xfaf389e0  ! 1591: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb7e48000  ! 1592: SAVE_R	save	%r18, %r0, %r27
	.word 0xbeacc000  ! 1593: ANDNcc_R	andncc 	%r19, %r0, %r31
	.word 0xb0bd8000  ! 1597: XNORcc_R	xnorcc 	%r22, %r0, %r24
	.word 0xbbe48000  ! 1599: SAVE_R	save	%r18, %r0, %r29
cpu_intr_0_129:
	setx	0x290222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe34a033  ! 1604: SUBC_I	orn 	%r18, 0x0033, %r31
	.word 0xb3e521c8  ! 1605: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbabd20c9  ! 1606: XNORcc_I	xnorcc 	%r20, 0x00c9, %r29
	.word 0xbde520a1  ! 1607: SAVE_I	save	%r20, 0x0001, %r30
iob_intr_0_128:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_128), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_rd_59:
	mov	0xe, %r14
	.word 0xf0db89e0  ! 1610: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb5e46095  ! 1611: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_130:
	setx	0x2a0225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba1560ab  ! 1618: OR_I	or 	%r21, 0x00ab, %r29
iob_intr_0_129:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_129), 16, 16)) -> intp(0, 0, 12)
iob_intr_0_130:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_130), 16, 16)) -> intp(0, 0, 11)
	.word 0xb3e4a1b2  ! 1626: SAVE_I	save	%r18, 0x0001, %r25
T0_asi_reg_wr_77:
	mov	0x3c3, %r14
	.word 0xf2f389e0  ! 1627: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_0_131:
	setx	0x290331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e126  ! 1633: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb3e420d3  ! 1637: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_wr_78:
	mov	0x3c6, %r14
	.word 0xf2f384a0  ! 1639: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_0_131:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_131), 16, 16)) -> intp(0, 0, 32)
	.word 0xb9e48000  ! 1644: SAVE_R	save	%r18, %r0, %r28
cpu_intr_0_132:
	setx	0x2a0319, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_79:
	mov	0x3c2, %r14
	.word 0xfcf38400  ! 1647: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_0_132:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_132), 16, 16)) -> intp(0, 0, 26)
	.word 0xb7e461eb  ! 1649: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1e4e0e7  ! 1650: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_wr_80:
	mov	0x8, %r14
	.word 0xf0f38e40  ! 1651: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_133:
	setx	0x2b0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb63c4000  ! 1656: XNOR_R	xnor 	%r17, %r0, %r27
	.word 0xb3e5c000  ! 1661: SAVE_R	save	%r23, %r0, %r25
	.word 0xb7e5e1ef  ! 1663: SAVE_I	save	%r23, 0x0001, %r27
iob_intr_0_133:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_133), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb3e420d9  ! 1671: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5e4c000  ! 1672: SAVE_R	save	%r19, %r0, %r26
	.word 0xbfe40000  ! 1673: SAVE_R	save	%r16, %r0, %r31
T0_asi_reg_rd_60:
	mov	0x3c7, %r14
	.word 0xf6db89e0  ! 1675: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb4b561e4  ! 1676: ORNcc_I	orncc 	%r21, 0x01e4, %r26
T0_asi_reg_wr_81:
	mov	0x3c7, %r14
	.word 0xf6f38e40  ! 1678: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_0_134:
	setx	0x290107, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_134:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_134), 16, 16)) -> intp(0, 0, 4)
	.word 0xb3e5e18a  ! 1685: SAVE_I	save	%r23, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_135:
	setx	0x280306, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_136:
	setx	0x280216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_135:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_135), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb7e5e00d  ! 1696: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_rd_61:
	mov	0x2c, %r14
	.word 0xf4db8e80  ! 1697: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_0_137:
	setx	0x2a001e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_136:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_136), 16, 16)) -> intp(0, 0, 23)
iob_intr_0_137:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_137), 16, 16)) -> intp(0, 0, 0)
iob_intr_0_138:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_138), 16, 16)) -> intp(0, 0, 3a)
cpu_intr_0_138:
	setx	0x2b0114, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_139:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_139), 16, 16)) -> intp(0, 0, 18)
iob_intr_0_140:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_140), 16, 16)) -> intp(0, 0, 1)
	.word 0xb1e56197  ! 1714: SAVE_I	save	%r21, 0x0001, %r24
cpu_intr_0_139:
	setx	0x2b0308, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_141:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_141), 16, 16)) -> intp(0, 0, 22)
	.word 0xbbe5e0ca  ! 1719: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb9e54000  ! 1720: SAVE_R	save	%r21, %r0, %r28
	.word 0xbde5a0bc  ! 1721: SAVE_I	save	%r22, 0x0001, %r30
cpu_intr_0_140:
	setx	0x2b010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 1736: SAVE_R	save	%r20, %r0, %r27
	.word 0xba9de126  ! 1738: XORcc_I	xorcc 	%r23, 0x0126, %r29
cpu_intr_0_141:
	setx	0x2a032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e520c3  ! 1741: SAVE_I	save	%r20, 0x0001, %r27
cpu_intr_0_142:
	setx	0x2b002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4604e  ! 1743: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbfe4a1f2  ! 1746: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_rd_62:
	mov	0x25, %r14
	.word 0xfcdb8e40  ! 1747: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_143:
	setx	0x28023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb97dc400  ! 1751: MOVR_R	movre	%r23, %r0, %r28
cpu_intr_0_144:
	setx	0x280238, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_82:
	mov	0x33, %r14
	.word 0xfaf38e60  ! 1755: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T0_asi_reg_rd_63:
	mov	0x1b, %r14
	.word 0xf8db8e40  ! 1756: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb60521ef  ! 1758: ADD_I	add 	%r20, 0x01ef, %r27
	.word 0xb1e44000  ! 1759: SAVE_R	save	%r17, %r0, %r24
	.word 0xbde58000  ! 1761: SAVE_R	save	%r22, %r0, %r30
iob_intr_0_142:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_142), 16, 16)) -> intp(0, 0, 3f)
iob_intr_0_143:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_143), 16, 16)) -> intp(0, 0, 2c)
T0_asi_reg_wr_83:
	mov	0x3c5, %r14
	.word 0xf2f38e40  ! 1768: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_144:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_144), 16, 16)) -> intp(0, 0, 15)
	.word 0xb3e4e118  ! 1773: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1e521eb  ! 1777: SAVE_I	save	%r20, 0x0001, %r24
iob_intr_0_145:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_145), 16, 16)) -> intp(0, 0, 28)
	.word 0xb3e5613c  ! 1780: SAVE_I	save	%r21, 0x0001, %r25
iob_intr_0_146:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_146), 16, 16)) -> intp(0, 0, 14)
iob_intr_0_147:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_147), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_rd_64:
	mov	0x3c0, %r14
	.word 0xf6db8e60  ! 1784: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbfe4c000  ! 1786: SAVE_R	save	%r19, %r0, %r31
	.word 0xb9e42060  ! 1787: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb83c60f7  ! 1791: XNOR_I	xnor 	%r17, 0x00f7, %r28
	.word 0xb7e52036  ! 1794: SAVE_I	save	%r20, 0x0001, %r27
T0_asi_reg_rd_65:
	mov	0x3c7, %r14
	.word 0xfedb8e80  ! 1795: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb1e50000  ! 1798: SAVE_R	save	%r20, %r0, %r24
	.word 0xbde40000  ! 1800: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_148:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_148), 16, 16)) -> intp(0, 0, 31)
iob_intr_0_149:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_149), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_150:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_150), 16, 16)) -> intp(0, 0, 36)
	.word 0xb7e4214d  ! 1806: SAVE_I	save	%r16, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_66:
	mov	0x2e, %r14
	.word 0xf6db89e0  ! 1808: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xbbe5c000  ! 1809: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_145:
	setx	0x280109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_151:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_151), 16, 16)) -> intp(0, 0, c)
	.word 0xb3e52071  ! 1816: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_rd_67:
	mov	0x3c1, %r14
	.word 0xf2db8e60  ! 1821: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T0_asi_reg_rd_68:
	mov	0x2f, %r14
	.word 0xfadb84a0  ! 1822: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb845613c  ! 1823: ADDC_I	addc 	%r21, 0x013c, %r28
T0_asi_reg_wr_84:
	mov	0x3, %r14
	.word 0xf6f38e40  ! 1825: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_wr_85:
	mov	0x3c7, %r14
	.word 0xfcf38e60  ! 1826: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb1e5c000  ! 1827: SAVE_R	save	%r23, %r0, %r24
	.word 0xb1e48000  ! 1828: SAVE_R	save	%r18, %r0, %r24
T0_asi_reg_wr_86:
	mov	0x4, %r14
	.word 0xfaf38e60  ! 1829: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T0_asi_reg_wr_87:
	mov	0x1, %r14
	.word 0xfcf389e0  ! 1830: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_0_152:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_152), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_rd_69:
	mov	0x3c7, %r14
	.word 0xf0db8e40  ! 1832: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_146:
	setx	0x2a0015, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_147:
	setx	0x2a010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4c000  ! 1840: SAVE_R	save	%r19, %r0, %r25
	.word 0xb7e5600a  ! 1845: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbde4a03e  ! 1846: SAVE_I	save	%r18, 0x0001, %r30
cpu_intr_0_148:
	setx	0x28002e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_88:
	mov	0x3, %r14
	.word 0xf2f384a0  ! 1850: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T0_asi_reg_rd_70:
	mov	0x3, %r14
	.word 0xf0db8e40  ! 1851: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_149:
	setx	0x2e0032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a029  ! 1856: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7e5e16a  ! 1858: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb7e44000  ! 1859: SAVE_R	save	%r17, %r0, %r27
iob_intr_0_153:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_153), 16, 16)) -> intp(0, 0, 34)
cpu_intr_0_150:
	setx	0x2e0003, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_151:
	setx	0x2f033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4610b  ! 1864: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb8b46167  ! 1865: ORNcc_I	orncc 	%r17, 0x0167, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_152:
	setx	0x2e0124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5e17f  ! 1869: SAVE_I	save	%r23, 0x0001, %r30
T0_asi_reg_rd_71:
	mov	0x15, %r14
	.word 0xfadb8e40  ! 1871: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_153:
	setx	0x2d032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe50000  ! 1874: SAVE_R	save	%r20, %r0, %r31
	.word 0xb9e50000  ! 1875: SAVE_R	save	%r20, %r0, %r28
	.word 0xb3e5607f  ! 1877: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb5e44000  ! 1881: SAVE_R	save	%r17, %r0, %r26
iob_intr_0_154:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_154), 16, 16)) -> intp(0, 0, 3e)
T0_asi_reg_wr_89:
	mov	0x3c2, %r14
	.word 0xfef38400  ! 1885: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb81ce0d0  ! 1886: XOR_I	xor 	%r19, 0x00d0, %r28
cpu_intr_0_154:
	setx	0x2c0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe9421a2  ! 1889: ORcc_I	orcc 	%r16, 0x01a2, %r31
T0_asi_reg_wr_90:
	mov	0x3c4, %r14
	.word 0xfaf38e40  ! 1890: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_0_155:
	setx	0x2d0307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e58000  ! 1893: SAVE_R	save	%r22, %r0, %r25
	.word 0xb7510000  ! 1895: RDPR_TICK	<illegal instruction>
	.word 0xb7e4e08a  ! 1897: SAVE_I	save	%r19, 0x0001, %r27
iob_intr_0_155:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_155), 16, 16)) -> intp(0, 0, 3d)
iob_intr_0_156:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_156), 16, 16)) -> intp(0, 0, 35)
	.word 0xbe3d8000  ! 1904: XNOR_R	xnor 	%r22, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_72:
	mov	0x22, %r14
	.word 0xf2db8e80  ! 1906: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbfe54000  ! 1907: SAVE_R	save	%r21, %r0, %r31
	.word 0xb33d9000  ! 1910: SRAX_R	srax	%r22, %r0, %r25
cpu_intr_0_156:
	setx	0x2d0308, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_157:
	setx	0x2c0021, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_157:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_157), 16, 16)) -> intp(0, 0, 1a)
T0_asi_reg_wr_91:
	mov	0x3c7, %r14
	.word 0xfcf38e60  ! 1919: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb5e4a052  ! 1923: SAVE_I	save	%r18, 0x0001, %r26
T0_asi_reg_rd_73:
	mov	0x33, %r14
	.word 0xf0db89e0  ! 1924: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T0_asi_reg_rd_74:
	mov	0x27, %r14
	.word 0xf8db8e60  ! 1927: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb83cc000  ! 1929: XNOR_R	xnor 	%r19, %r0, %r28
T0_asi_reg_rd_75:
	mov	0x3c5, %r14
	.word 0xfadb8e40  ! 1930: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_wr_92:
	mov	0x3c8, %r14
	.word 0xf0f38e60  ! 1931: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb9e4a1e3  ! 1932: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_wr_93:
	mov	0x3c5, %r14
	.word 0xf8f38e80  ! 1933: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb1e4c000  ! 1934: SAVE_R	save	%r19, %r0, %r24
	.word 0xbbe4a197  ! 1935: SAVE_I	save	%r18, 0x0001, %r29
iob_intr_0_158:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_158), 16, 16)) -> intp(0, 0, 8)
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
iob_intr_0_159:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_159), 16, 16)) -> intp(0, 0, 10)
	.word 0xbfe4202e  ! 1945: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_wr_94:
	mov	0x1e, %r14
	.word 0xfaf38e60  ! 1948: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_0_160:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_160), 16, 16)) -> intp(0, 0, 31)
	.word 0xb1e4c000  ! 1953: SAVE_R	save	%r19, %r0, %r24
T0_asi_reg_wr_95:
	mov	0x3c5, %r14
	.word 0xfaf389e0  ! 1962: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb1e58000  ! 1967: SAVE_R	save	%r22, %r0, %r24
cpu_intr_0_158:
	setx	0x2f031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e126  ! 1969: SAVE_I	save	%r19, 0x0001, %r24
cpu_intr_0_159:
	setx	0x2f003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe521dd  ! 1972: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb33d3001  ! 1973: SRAX_I	srax	%r20, 0x0001, %r25
	.word 0xbfe5c000  ! 1974: SAVE_R	save	%r23, %r0, %r31
	.word 0xb7e44000  ! 1975: SAVE_R	save	%r17, %r0, %r27
	.word 0xba2c0000  ! 1978: ANDN_R	andn 	%r16, %r0, %r29
T0_asi_reg_rd_76:
	mov	0x6, %r14
	.word 0xf0db89e0  ! 1981: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb7e561ef  ! 1982: SAVE_I	save	%r21, 0x0001, %r27
cpu_intr_0_160:
	setx	0x2e0137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e44000  ! 1984: SAVE_R	save	%r17, %r0, %r24
T0_asi_reg_rd_77:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 1985: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_0_161:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_161), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb7e4611d  ! 1989: SAVE_I	save	%r17, 0x0001, %r27
cpu_intr_0_161:
	setx	0x2f0322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_162:
	setx	0x2c001a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_163:
	setx	0x2d020f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_96:
	mov	0x3c1, %r14
	.word 0xfaf38e80  ! 1995: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xba3da160  ! 1996: XNOR_I	xnor 	%r22, 0x0160, %r29
	.word 0xb5e5e094  ! 1998: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb7e58000  ! 1999: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_rd_78:
	mov	0x28, %r14
	.word 0xf8db84a0  ! 2000: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T0_asi_reg_wr_97:
	mov	0x1b, %r14
	.word 0xfcf38400  ! 2002: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbde4a1e0  ! 2005: SAVE_I	save	%r18, 0x0001, %r30
iob_intr_0_162:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_162), 16, 16)) -> intp(0, 0, 2b)
	.word 0xbbe50000  ! 2008: SAVE_R	save	%r20, %r0, %r29
cpu_intr_0_164:
	setx	0x2d0207, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_165:
	setx	0x2f0135, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_98:
	mov	0x3c6, %r14
	.word 0xf0f389e0  ! 2012: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_0_163:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_163), 16, 16)) -> intp(0, 0, 3e)
	.word 0xbbe4a0ea  ! 2016: SAVE_I	save	%r18, 0x0001, %r29
cpu_intr_0_166:
	setx	0x2c0204, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_164:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_164), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_rd_79:
	mov	0x3c3, %r14
	.word 0xf6db8e60  ! 2022: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb3e58000  ! 2023: SAVE_R	save	%r22, %r0, %r25
	.word 0xb1348000  ! 2024: SRL_R	srl 	%r18, %r0, %r24
	.word 0xb3e5a156  ! 2025: SAVE_I	save	%r22, 0x0001, %r25
T0_asi_reg_rd_80:
	mov	0xc, %r14
	.word 0xfedb8e40  ! 2029: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbbe4e03f  ! 2032: SAVE_I	save	%r19, 0x0001, %r29
cpu_intr_0_167:
	setx	0x2c0012, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_81:
	mov	0x3c2, %r14
	.word 0xf0db8e80  ! 2037: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xba3d4000  ! 2038: XNOR_R	xnor 	%r21, %r0, %r29
	.word 0xb7e4c000  ! 2039: SAVE_R	save	%r19, %r0, %r27
	.word 0xbfe58000  ! 2040: SAVE_R	save	%r22, %r0, %r31
T0_asi_reg_rd_82:
	mov	0x37, %r14
	.word 0xf6db8400  ! 2041: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T0_asi_reg_rd_83:
	mov	0x1, %r14
	.word 0xfedb8e40  ! 2044: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_0_168:
	setx	0x2d0013, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_99:
	mov	0x1c, %r14
	.word 0xfef384a0  ! 2047: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T0_asi_reg_rd_84:
	mov	0x38, %r14
	.word 0xfcdb8e60  ! 2051: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_0_169:
	setx	0x2d012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e46105  ! 2053: SAVE_I	save	%r17, 0x0001, %r24
iob_intr_0_165:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_165), 16, 16)) -> intp(0, 0, 8)
	.word 0xb5e4c000  ! 2062: SAVE_R	save	%r19, %r0, %r26
iob_intr_0_166:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_166), 16, 16)) -> intp(0, 0, 32)
	.word 0xb7e5e089  ! 2067: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_wr_100:
	mov	0x8, %r14
	.word 0xfaf389e0  ! 2069: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T0_asi_reg_wr_101:
	mov	0x20, %r14
	.word 0xfef38e40  ! 2070: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_0_167:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_167), 16, 16)) -> intp(0, 0, 11)
cpu_intr_0_170:
	setx	0x2d0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a0d4  ! 2076: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1e460db  ! 2078: SAVE_I	save	%r17, 0x0001, %r24
cpu_intr_0_171:
	setx	0x2e011c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_85:
	mov	0x18, %r14
	.word 0xf8db84a0  ! 2087: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_0_172:
	setx	0x2e000c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_173:
	setx	0x2c0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e50000  ! 2094: SAVE_R	save	%r20, %r0, %r24
	.word 0xb3e461dc  ! 2095: SAVE_I	save	%r17, 0x0001, %r25
iob_intr_0_168:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_168), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb5e44000  ! 2100: SAVE_R	save	%r17, %r0, %r26
T0_asi_reg_wr_102:
	mov	0x16, %r14
	.word 0xf6f38e80  ! 2103: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbde44000  ! 2105: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_rd_86:
	mov	0xa, %r14
	.word 0xf4db8400  ! 2107: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xbfe46170  ! 2108: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb3e50000  ! 2110: SAVE_R	save	%r20, %r0, %r25
cpu_intr_0_174:
	setx	0x2f0105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 2115: SAVE_R	save	%r23, %r0, %r27
	.word 0x8195e1d6  ! 2117: WRPR_TPC_I	wrpr	%r23, 0x01d6, %tpc
iob_intr_0_169:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_169), 16, 16)) -> intp(0, 0, 2b)
T0_asi_reg_wr_103:
	mov	0x3, %r14
	.word 0xfaf38e40  ! 2121: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbbe58000  ! 2122: SAVE_R	save	%r22, %r0, %r29
T0_asi_reg_wr_104:
	mov	0x38, %r14
	.word 0xfaf389e0  ! 2126: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbde48000  ! 2128: SAVE_R	save	%r18, %r0, %r30
	.word 0xbfe58000  ! 2131: SAVE_R	save	%r22, %r0, %r31
cpu_intr_0_175:
	setx	0x2c020d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_105:
	mov	0x3c2, %r14
	.word 0xfef38e40  ! 2137: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_0_170:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_170), 16, 16)) -> intp(0, 0, 14)
	.word 0xb5e5c000  ! 2140: SAVE_R	save	%r23, %r0, %r26
	.word 0xbc9c20cd  ! 2142: XORcc_I	xorcc 	%r16, 0x00cd, %r30
	.word 0xbbe42199  ! 2147: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7e58000  ! 2148: SAVE_R	save	%r22, %r0, %r27
	.word 0xb42d8000  ! 2152: ANDN_R	andn 	%r22, %r0, %r26
iob_intr_0_171:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_171), 16, 16)) -> intp(0, 0, 3f)
cpu_intr_0_176:
	setx	0x2e003e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_106:
	mov	0x2c, %r14
	.word 0xf0f38e80  ! 2156: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb5e421c9  ! 2160: SAVE_I	save	%r16, 0x0001, %r26
T0_asi_reg_rd_87:
	mov	0x32, %r14
	.word 0xfcdb8e40  ! 2161: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_0_172:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_172), 16, 16)) -> intp(0, 0, 12)
	.word 0xb5e5c000  ! 2165: SAVE_R	save	%r23, %r0, %r26
	.word 0xb5e48000  ! 2166: SAVE_R	save	%r18, %r0, %r26
	.word 0xbde50000  ! 2167: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_wr_107:
	mov	0xc, %r14
	.word 0xfef38e60  ! 2171: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_0_173:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_173), 16, 16)) -> intp(0, 0, 1)
	.word 0xbd2d5000  ! 2177: SLLX_R	sllx	%r21, %r0, %r30
	.word 0xbfe5c000  ! 2180: SAVE_R	save	%r23, %r0, %r31
T0_asi_reg_wr_108:
	mov	0x3c6, %r14
	.word 0xfcf38e80  ! 2181: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T0_asi_reg_rd_88:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 2182: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_177:
	setx	0x2c013b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_178:
	setx	0x2c031c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_174:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_174), 16, 16)) -> intp(0, 0, 37)
iob_intr_0_175:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_175), 16, 16)) -> intp(0, 0, 2f)
cpu_intr_0_179:
	setx	0x2d0238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde461d4  ! 2192: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe5a046  ! 2193: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5504000  ! 2195: RDPR_TNPC	<illegal instruction>
	.word 0xb7e5607f  ! 2197: SAVE_I	save	%r21, 0x0001, %r27
cpu_intr_0_180:
	setx	0x2d0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e50000  ! 2203: SAVE_R	save	%r20, %r0, %r25
	.word 0xbde56060  ! 2204: SAVE_I	save	%r21, 0x0001, %r30
T0_asi_reg_wr_109:
	mov	0x12, %r14
	.word 0xfaf38e40  ! 2206: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_rd_89:
	mov	0x6, %r14
	.word 0xf2db84a0  ! 2208: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_0_176:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_176), 16, 16)) -> intp(0, 0, 4)
	.word 0xb5e44000  ! 2217: SAVE_R	save	%r17, %r0, %r26
	.word 0xb32da001  ! 2219: SLL_I	sll 	%r22, 0x0001, %r25
T0_asi_reg_wr_110:
	mov	0x2, %r14
	.word 0xf2f38e80  ! 2220: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_0_177:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_177), 16, 16)) -> intp(0, 0, 22)
T0_asi_reg_wr_111:
	mov	0x1a, %r14
	.word 0xfaf389e0  ! 2224: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbfe5a0e4  ! 2226: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbfe48000  ! 2227: SAVE_R	save	%r18, %r0, %r31
	.word 0xb3e54000  ! 2228: SAVE_R	save	%r21, %r0, %r25
	.word 0xb7e5e103  ! 2231: SAVE_I	save	%r23, 0x0001, %r27
iob_intr_0_178:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_178), 16, 16)) -> intp(0, 0, 2e)
T0_asi_reg_wr_112:
	mov	0x21, %r14
	.word 0xfcf38e40  ! 2234: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb7e46075  ! 2235: SAVE_I	save	%r17, 0x0001, %r27
T0_asi_reg_wr_113:
	mov	0x3c7, %r14
	.word 0xf2f38e40  ! 2238: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_0_181:
	setx	0x2e0226, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_179:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_179), 16, 16)) -> intp(0, 0, 23)
T0_asi_reg_rd_90:
	mov	0x1f, %r14
	.word 0xfadb8e40  ! 2246: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb81cc000  ! 2249: XOR_R	xor 	%r19, %r0, %r28
cpu_intr_0_182:
	setx	0x2e031d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_180:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_180), 16, 16)) -> intp(0, 0, 1e)
cpu_intr_0_183:
	setx	0x2d002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe50000  ! 2261: SAVE_R	save	%r20, %r0, %r31
	.word 0xb815a1bf  ! 2262: OR_I	or 	%r22, 0x01bf, %r28
iob_intr_0_181:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_181), 16, 16)) -> intp(0, 0, 19)
	.word 0xb3e5c000  ! 2266: SAVE_R	save	%r23, %r0, %r25
iob_intr_0_182:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_182), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb9e54000  ! 2270: SAVE_R	save	%r21, %r0, %r28
iob_intr_0_183:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_183), 16, 16)) -> intp(0, 0, e)
	.word 0xb9e4c000  ! 2273: SAVE_R	save	%r19, %r0, %r28
	.word 0xbde5c000  ! 2278: SAVE_R	save	%r23, %r0, %r30
T0_asi_reg_rd_91:
	mov	0xb, %r14
	.word 0xfadb84a0  ! 2280: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_0_184:
	setx	0x2e0112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5617f  ! 2289: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbfe520fc  ! 2294: SAVE_I	save	%r20, 0x0001, %r31
cpu_intr_0_185:
	setx	0x2c0139, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_184:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_184), 16, 16)) -> intp(0, 0, 35)
cpu_intr_0_186:
	setx	0x2c0006, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_185:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_185), 16, 16)) -> intp(0, 0, 36)
iob_intr_0_186:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_186), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_wr_114:
	mov	0x3c7, %r14
	.word 0xf4f389e0  ! 2301: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_0_187:
	setx	0x330127, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_187:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_187), 16, 16)) -> intp(0, 0, 1d)
T0_asi_reg_rd_92:
	mov	0x3c3, %r14
	.word 0xfcdb8e40  ! 2308: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb0b5e0c2  ! 2309: SUBCcc_I	orncc 	%r23, 0x00c2, %r24
iob_intr_0_188:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_188), 16, 16)) -> intp(0, 0, 28)
cpu_intr_0_188:
	setx	0x330110, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_189:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_189), 16, 16)) -> intp(0, 0, 5)
T0_asi_reg_wr_115:
	mov	0x1d, %r14
	.word 0xfaf38e40  ! 2314: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_wr_116:
	mov	0x2f, %r14
	.word 0xfcf38e40  ! 2315: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_190:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_190), 16, 16)) -> intp(0, 0, 28)
iob_intr_0_191:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_191), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb9e44000  ! 2322: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_wr_117:
	mov	0x3c2, %r14
	.word 0xfcf389e0  ! 2323: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_192:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_192), 16, 16)) -> intp(0, 0, 2)
	.word 0xb3e40000  ! 2328: SAVE_R	save	%r16, %r0, %r25
	.word 0xb3e48000  ! 2332: SAVE_R	save	%r18, %r0, %r25
iob_intr_0_193:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_193), 16, 16)) -> intp(0, 0, 3)
	.word 0xb1641800  ! 2339: MOVcc_R	<illegal instruction>
iob_intr_0_194:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_194), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbc440000  ! 2343: ADDC_R	addc 	%r16, %r0, %r30
	.word 0xbde54000  ! 2344: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_189:
	setx	0x320201, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_190:
	setx	0x330229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5c000  ! 2352: SAVE_R	save	%r23, %r0, %r24
	.word 0xb3e4a10d  ! 2353: SAVE_I	save	%r18, 0x0001, %r25
iob_intr_0_195:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_195), 16, 16)) -> intp(0, 0, 5)
	.word 0xb9e521d2  ! 2358: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3e4e085  ! 2359: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_196:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_196), 16, 16)) -> intp(0, 0, e)
iob_intr_0_197:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_197), 16, 16)) -> intp(0, 0, 15)
	.word 0xbfe46159  ! 2369: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_wr_118:
	mov	0x2d, %r14
	.word 0xf8f38e40  ! 2370: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbbe4c000  ! 2371: SAVE_R	save	%r19, %r0, %r29
	.word 0xb5e40000  ! 2372: SAVE_R	save	%r16, %r0, %r26
iob_intr_0_198:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_198), 16, 16)) -> intp(0, 0, 2e)
T0_asi_reg_wr_119:
	mov	0x33, %r14
	.word 0xfaf384a0  ! 2374: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbeb460ee  ! 2376: SUBCcc_I	orncc 	%r17, 0x00ee, %r31
cpu_intr_0_191:
	setx	0x320024, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_120:
	mov	0x3c1, %r14
	.word 0xfcf389e0  ! 2378: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0x91942044  ! 2380: WRPR_PIL_I	wrpr	%r16, 0x0044, %pil
	.word 0xb5e5a0e3  ! 2381: SAVE_I	save	%r22, 0x0001, %r26
cpu_intr_0_192:
	setx	0x33031d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_93:
	mov	0x21, %r14
	.word 0xf0db89e0  ! 2386: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb6bdc000  ! 2387: XNORcc_R	xnorcc 	%r23, %r0, %r27
	.word 0xb7e4e149  ! 2388: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbbe44000  ! 2391: SAVE_R	save	%r17, %r0, %r29
T0_asi_reg_wr_121:
	mov	0x3c6, %r14
	.word 0xf4f38e40  ! 2392: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_rd_94:
	mov	0x10, %r14
	.word 0xfedb8e60  ! 2393: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_0_199:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_199), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_rd_95:
	mov	0x26, %r14
	.word 0xf8db8400  ! 2398: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb3e42108  ! 2399: SAVE_I	save	%r16, 0x0001, %r25
cpu_intr_0_193:
	setx	0x33001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a1ed  ! 2403: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbe958000  ! 2404: ORcc_R	orcc 	%r22, %r0, %r31
	.word 0xb9e40000  ! 2406: SAVE_R	save	%r16, %r0, %r28
	.word 0xbf641800  ! 2408: MOVcc_R	<illegal instruction>
	.word 0xb5e4e181  ! 2409: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb2352110  ! 2410: SUBC_I	orn 	%r20, 0x0110, %r25
iob_intr_0_200:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_200), 16, 16)) -> intp(0, 0, 36)
iob_intr_0_201:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_201), 16, 16)) -> intp(0, 0, a)
iob_intr_0_202:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_202), 16, 16)) -> intp(0, 0, 3d)
iob_intr_0_203:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_203), 16, 16)) -> intp(0, 0, 30)
	.word 0xbde56143  ! 2425: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb97de401  ! 2427: MOVR_I	movre	%r23, 0x1, %r28
iob_intr_0_204:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_204), 16, 16)) -> intp(0, 0, c)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_122:
	mov	0x1d, %r14
	.word 0xf0f38e60  ! 2435: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb7e4a01b  ! 2437: SAVE_I	save	%r18, 0x0001, %r27
iob_intr_0_205:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_205), 16, 16)) -> intp(0, 0, 22)
	.word 0xb7e48000  ! 2439: SAVE_R	save	%r18, %r0, %r27
T0_asi_reg_rd_96:
	mov	0x3c7, %r14
	.word 0xf8db89e0  ! 2440: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T0_asi_reg_wr_123:
	mov	0x3c4, %r14
	.word 0xf6f384a0  ! 2441: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_0_194:
	setx	0x31011c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_206:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_206), 16, 16)) -> intp(0, 0, 1c)
cpu_intr_0_195:
	setx	0x330326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e420c1  ! 2451: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb5e5614b  ! 2454: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb48da0f7  ! 2457: ANDcc_I	andcc 	%r22, 0x00f7, %r26
T0_asi_reg_rd_97:
	mov	0x3c3, %r14
	.word 0xf0db8e80  ! 2458: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_0_196:
	setx	0x310106, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_197:
	setx	0x31022d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_98:
	mov	0x15, %r14
	.word 0xfcdb89e0  ! 2464: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T0_asi_reg_wr_124:
	mov	0x3c1, %r14
	.word 0xfcf38400  ! 2466: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_0_198:
	setx	0x300130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b4a19e  ! 2473: ORNcc_I	orncc 	%r18, 0x019e, %r28
	.word 0xb22d8000  ! 2475: ANDN_R	andn 	%r22, %r0, %r25
	.word 0xbfe48000  ! 2476: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_wr_125:
	mov	0x2f, %r14
	.word 0xf6f38400  ! 2477: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_0_207:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_207), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb9e40000  ! 2480: SAVE_R	save	%r16, %r0, %r28
cpu_intr_0_199:
	setx	0x310215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde46087  ! 2490: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbde5a026  ! 2493: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_wr_126:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 2494: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_wr_127:
	mov	0x12, %r14
	.word 0xf2f384a0  ! 2500: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbde54000  ! 2501: SAVE_R	save	%r21, %r0, %r30
	.word 0xb7e44000  ! 2504: SAVE_R	save	%r17, %r0, %r27
cpu_intr_0_200:
	setx	0x330204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4a5c000  ! 2507: SUBcc_R	subcc 	%r23, %r0, %r26
	.word 0xb9e48000  ! 2508: SAVE_R	save	%r18, %r0, %r28
	.word 0xb1e4e115  ! 2510: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_rd_99:
	mov	0x3c8, %r14
	.word 0xfcdb8e60  ! 2513: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb88ce1bc  ! 2517: ANDcc_I	andcc 	%r19, 0x01bc, %r28
	.word 0xb9e5a07a  ! 2518: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb23521a7  ! 2519: SUBC_I	orn 	%r20, 0x01a7, %r25
cpu_intr_0_201:
	setx	0x3002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 2523: SAVE_R	save	%r22, %r0, %r26
cpu_intr_0_202:
	setx	0x320200, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_208:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_208), 16, 16)) -> intp(0, 0, e)
iob_intr_0_209:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_209), 16, 16)) -> intp(0, 0, 1)
T0_asi_reg_wr_128:
	mov	0x20, %r14
	.word 0xf6f38e40  ! 2529: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_rd_100:
	mov	0x2, %r14
	.word 0xfedb8e60  ! 2532: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb3e40000  ! 2534: SAVE_R	save	%r16, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_210:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_210), 16, 16)) -> intp(0, 0, 2d)
iob_intr_0_211:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_211), 16, 16)) -> intp(0, 0, 29)
T0_asi_reg_rd_101:
	mov	0x38, %r14
	.word 0xf0db89e0  ! 2542: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T0_asi_reg_rd_102:
	mov	0x2d, %r14
	.word 0xf0db84a0  ! 2544: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_0_203:
	setx	0x320218, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_212:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_212), 16, 16)) -> intp(0, 0, 19)
	.word 0xb7e46107  ! 2547: SAVE_I	save	%r17, 0x0001, %r27
T0_asi_reg_rd_103:
	mov	0x8, %r14
	.word 0xfadb8e60  ! 2549: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T0_asi_reg_wr_129:
	mov	0x3c2, %r14
	.word 0xfef38e80  ! 2552: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_0_204:
	setx	0x330110, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_205:
	setx	0x300009, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_213:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_213), 16, 16)) -> intp(0, 0, b)
iob_intr_0_214:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_214), 16, 16)) -> intp(0, 0, 3e)
iob_intr_0_215:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_215), 16, 16)) -> intp(0, 0, 33)
	.word 0xb1e5e1b2  ! 2564: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_216:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_216), 16, 16)) -> intp(0, 0, 1)
	.word 0xb3e44000  ! 2572: SAVE_R	save	%r17, %r0, %r25
iob_intr_0_217:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_217), 16, 16)) -> intp(0, 0, 2f)
	.word 0xbde54000  ! 2577: SAVE_R	save	%r21, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_218:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_218), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb5e44000  ! 2582: SAVE_R	save	%r17, %r0, %r26
	.word 0xb3e44000  ! 2585: SAVE_R	save	%r17, %r0, %r25
	.word 0xb7e50000  ! 2586: SAVE_R	save	%r20, %r0, %r27
iob_intr_0_219:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_219), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb5e42148  ! 2589: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb9e54000  ! 2590: SAVE_R	save	%r21, %r0, %r28
	.word 0xb7e58000  ! 2591: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_rd_104:
	mov	0x1f, %r14
	.word 0xf0db8e40  ! 2592: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_206:
	setx	0x330037, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_207:
	setx	0x30012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e56026  ! 2596: SAVE_I	save	%r21, 0x0001, %r28
T0_asi_reg_wr_130:
	mov	0x26, %r14
	.word 0xfef38e40  ! 2597: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_0_208:
	setx	0x320303, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_220:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_220), 16, 16)) -> intp(0, 0, 24)
cpu_intr_0_209:
	setx	0x330128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4c48000  ! 2604: ADDCcc_R	addccc 	%r18, %r0, %r26
	.word 0xb7e40000  ! 2605: SAVE_R	save	%r16, %r0, %r27
T0_asi_reg_rd_105:
	mov	0x27, %r14
	.word 0xf0db84a0  ! 2606: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbde44000  ! 2608: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_wr_131:
	mov	0x3c7, %r14
	.word 0xf0f38e40  ! 2609: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_0_221:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_221), 16, 16)) -> intp(0, 0, 10)
iob_intr_0_222:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_222), 16, 16)) -> intp(0, 0, 36)
	.word 0xb9e54000  ! 2616: SAVE_R	save	%r21, %r0, %r28
	.word 0xb9e4e1d8  ! 2620: SAVE_I	save	%r19, 0x0001, %r28
iob_intr_0_223:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_223), 16, 16)) -> intp(0, 0, 31)
cpu_intr_0_210:
	setx	0x320022, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_132:
	mov	0x21, %r14
	.word 0xfef38e40  ! 2634: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbde58000  ! 2637: SAVE_R	save	%r22, %r0, %r30
	.word 0xb5e48000  ! 2642: SAVE_R	save	%r18, %r0, %r26
	.word 0xbfe50000  ! 2644: SAVE_R	save	%r20, %r0, %r31
iob_intr_0_224:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_224), 16, 16)) -> intp(0, 0, 11)
	.word 0xb7e48000  ! 2649: SAVE_R	save	%r18, %r0, %r27
iob_intr_0_225:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_225), 16, 16)) -> intp(0, 0, 36)
	.word 0xb1e4a199  ! 2651: SAVE_I	save	%r18, 0x0001, %r24
cpu_intr_0_211:
	setx	0x330322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5e038  ! 2656: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb7e44000  ! 2658: SAVE_R	save	%r17, %r0, %r27
	.word 0xbde560ad  ! 2659: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e52191  ! 2661: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e44000  ! 2664: SAVE_R	save	%r17, %r0, %r24
	.word 0xb9e4a0b0  ! 2665: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb5e58000  ! 2666: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_rd_106:
	mov	0x1f, %r14
	.word 0xf6db84a0  ! 2667: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb7e4e1e3  ! 2669: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbf3cf001  ! 2671: SRAX_I	srax	%r19, 0x0001, %r31
T0_asi_reg_wr_133:
	mov	0x13, %r14
	.word 0xf4f38e60  ! 2672: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_0_226:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_226), 16, 16)) -> intp(0, 0, 28)
iob_intr_0_227:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_227), 16, 16)) -> intp(0, 0, 34)
iob_intr_0_228:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_228), 16, 16)) -> intp(0, 0, 15)
	.word 0xb5e4c000  ! 2678: SAVE_R	save	%r19, %r0, %r26
T0_asi_reg_wr_134:
	mov	0x3c7, %r14
	.word 0xfaf389e0  ! 2681: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_0_212:
	setx	0x320119, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_229:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_229), 16, 16)) -> intp(0, 0, 1b)
iob_intr_0_230:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_230), 16, 16)) -> intp(0, 0, 9)
	.word 0xb83c0000  ! 2686: XNOR_R	xnor 	%r16, %r0, %r28
	.word 0xbfe5c000  ! 2687: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_231:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_231), 16, 16)) -> intp(0, 0, 8)
cpu_intr_0_213:
	setx	0x33001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb83c2064  ! 2692: XNOR_I	xnor 	%r16, 0x0064, %r28
iob_intr_0_232:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_232), 16, 16)) -> intp(0, 0, 25)
	.word 0xb1e5a0eb  ! 2695: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde46199  ! 2700: SAVE_I	save	%r17, 0x0001, %r30
iob_intr_0_233:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_233), 16, 16)) -> intp(0, 0, 3)
	.word 0xb3e50000  ! 2704: SAVE_R	save	%r20, %r0, %r25
	.word 0xb3e4e061  ! 2706: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_rd_107:
	mov	0x3c3, %r14
	.word 0xfcdb8e80  ! 2707: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb5e44000  ! 2708: SAVE_R	save	%r17, %r0, %r26
T0_asi_reg_wr_135:
	mov	0x1a, %r14
	.word 0xf0f38e80  ! 2709: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb3e42033  ! 2711: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_wr_136:
	mov	0x31, %r14
	.word 0xfaf38e40  ! 2712: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_rd_108:
	mov	0x3c3, %r14
	.word 0xfedb8e40  ! 2714: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_0_234:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_234), 16, 16)) -> intp(0, 0, 17)
	.word 0xbfe4a054  ! 2716: SAVE_I	save	%r18, 0x0001, %r31
iob_intr_0_235:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_235), 16, 16)) -> intp(0, 0, 23)
cpu_intr_0_214:
	setx	0x320203, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_109:
	mov	0x1a, %r14
	.word 0xf0db8e40  ! 2724: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_215:
	setx	0x30030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8c5e112  ! 2728: ADDCcc_I	addccc 	%r23, 0x0112, %r28
cpu_intr_0_216:
	setx	0x310318, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_110:
	mov	0x3c3, %r14
	.word 0xf4db8e80  ! 2730: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb9e5a0d2  ! 2734: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbfe48000  ! 2735: SAVE_R	save	%r18, %r0, %r31
	.word 0xb23ca083  ! 2736: XNOR_I	xnor 	%r18, 0x0083, %r25
cpu_intr_0_217:
	setx	0x310231, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_111:
	mov	0x36, %r14
	.word 0xf6db8e60  ! 2738: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T0_asi_reg_rd_112:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 2739: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_wr_137:
	mov	0xd, %r14
	.word 0xfcf38e40  ! 2740: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb9e5a07f  ! 2742: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb6bc217e  ! 2743: XNORcc_I	xnorcc 	%r16, 0x017e, %r27
cpu_intr_0_218:
	setx	0x330319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba8d4000  ! 2746: ANDcc_R	andcc 	%r21, %r0, %r29
	.word 0xbfe48000  ! 2749: SAVE_R	save	%r18, %r0, %r31
iob_intr_0_236:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_236), 16, 16)) -> intp(0, 0, 7)
	.word 0xbde4e0cc  ! 2753: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1e44000  ! 2756: SAVE_R	save	%r17, %r0, %r24
cpu_intr_0_219:
	setx	0x32002c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_220:
	setx	0x310303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e56177  ! 2760: SAVE_I	save	%r21, 0x0001, %r24
cpu_intr_0_221:
	setx	0x30020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e50000  ! 2762: SAVE_R	save	%r20, %r0, %r24
T0_asi_reg_rd_113:
	mov	0x35, %r14
	.word 0xf4db84a0  ! 2764: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_0_222:
	setx	0x30012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb08c8000  ! 2766: ANDcc_R	andcc 	%r18, %r0, %r24
	.word 0xbfe54000  ! 2769: SAVE_R	save	%r21, %r0, %r31
cpu_intr_0_223:
	setx	0x370225, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_237:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_237), 16, 16)) -> intp(0, 0, e)
iob_intr_0_238:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_238), 16, 16)) -> intp(0, 0, d)
	.word 0xb9e58000  ! 2774: SAVE_R	save	%r22, %r0, %r28
T0_asi_reg_wr_138:
	mov	0x3, %r14
	.word 0xfef38e40  ! 2775: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb7e460e6  ! 2777: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbde5c000  ! 2779: SAVE_R	save	%r23, %r0, %r30
iob_intr_0_239:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_239), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbbe4c000  ! 2781: SAVE_R	save	%r19, %r0, %r29
cpu_intr_0_224:
	setx	0x36003a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_139:
	mov	0x25, %r14
	.word 0xf6f38e60  ! 2783: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T0_asi_reg_wr_140:
	mov	0x14, %r14
	.word 0xf6f38400  ! 2786: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbbe520f7  ! 2791: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbbe5e162  ! 2793: SAVE_I	save	%r23, 0x0001, %r29
iob_intr_0_240:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_240), 16, 16)) -> intp(0, 0, 33)
	.word 0xbfe5e0b9  ! 2797: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbbe58000  ! 2798: SAVE_R	save	%r22, %r0, %r29
T0_asi_reg_rd_114:
	mov	0x3c1, %r14
	.word 0xf2db8400  ! 2804: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_0_225:
	setx	0x1011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5a147  ! 2806: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_wr_141:
	mov	0x10, %r14
	.word 0xf2f38e80  ! 2809: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb4350000  ! 2810: ORN_R	orn 	%r20, %r0, %r26
	.word 0xb7e58000  ! 2812: SAVE_R	save	%r22, %r0, %r27
	.word 0xb3e50000  ! 2822: SAVE_R	save	%r20, %r0, %r25
	.word 0xbfe56096  ! 2823: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb4140000  ! 2824: OR_R	or 	%r16, %r0, %r26
iob_intr_0_241:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_241), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_242:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_242), 16, 16)) -> intp(0, 0, 28)
cpu_intr_0_226:
	setx	0x350126, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_227:
	setx	0x36021a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_142:
	mov	0x30, %r14
	.word 0xf0f389e0  ! 2836: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_0_243:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_243), 16, 16)) -> intp(0, 0, a)
	.word 0xb1342001  ! 2842: SRL_I	srl 	%r16, 0x0001, %r24
T0_asi_reg_rd_115:
	mov	0x28, %r14
	.word 0xf4db84a0  ! 2844: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_0_228:
	setx	0x370017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e46148  ! 2848: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_244:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_244), 16, 16)) -> intp(0, 0, c)
T0_asi_reg_wr_143:
	mov	0x31, %r14
	.word 0xfcf38e40  ! 2850: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb3e4c000  ! 2853: SAVE_R	save	%r19, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e5a0f4  ! 2856: SAVE_I	save	%r22, 0x0001, %r26
iob_intr_0_245:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_245), 16, 16)) -> intp(0, 0, 2b)
T0_asi_reg_wr_144:
	mov	0x2e, %r14
	.word 0xf4f38e40  ! 2862: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbbe56013  ! 2863: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb434e102  ! 2864: ORN_I	orn 	%r19, 0x0102, %r26
	.word 0xbde54000  ! 2871: SAVE_R	save	%r21, %r0, %r30
	.word 0xb7e4e058  ! 2875: SAVE_I	save	%r19, 0x0001, %r27
cpu_intr_0_229:
	setx	0x370100, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_145:
	mov	0x1c, %r14
	.word 0xf8f38400  ! 2886: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_0_246:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_246), 16, 16)) -> intp(0, 0, 7)
	.word 0xb5e560de  ! 2888: SAVE_I	save	%r21, 0x0001, %r26
iob_intr_0_247:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_247), 16, 16)) -> intp(0, 0, 32)
	.word 0xb80420f3  ! 2894: ADD_I	add 	%r16, 0x00f3, %r28
	.word 0xbbe54000  ! 2895: SAVE_R	save	%r21, %r0, %r29
	.word 0xb3e44000  ! 2897: SAVE_R	save	%r17, %r0, %r25
T0_asi_reg_wr_146:
	mov	0xa, %r14
	.word 0xf2f38e60  ! 2901: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T0_asi_reg_rd_116:
	mov	0x24, %r14
	.word 0xfadb8400  ! 2907: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_0_248:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_248), 16, 16)) -> intp(0, 0, 35)
T0_asi_reg_rd_117:
	mov	0x3c7, %r14
	.word 0xfadb84a0  ! 2910: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbfe40000  ! 2911: SAVE_R	save	%r16, %r0, %r31
	.word 0xb7504000  ! 2912: RDPR_TNPC	<illegal instruction>
cpu_intr_0_230:
	setx	0x360111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e461f0  ! 2917: SAVE_I	save	%r17, 0x0001, %r27
T0_asi_reg_wr_147:
	mov	0x34, %r14
	.word 0xf4f38e80  ! 2919: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbfe44000  ! 2920: SAVE_R	save	%r17, %r0, %r31
T0_asi_reg_wr_148:
	mov	0x8, %r14
	.word 0xf4f38e40  ! 2925: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb6242195  ! 2926: SUB_I	sub 	%r16, 0x0195, %r27
	.word 0xbfe5208a  ! 2928: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9e50000  ! 2929: SAVE_R	save	%r20, %r0, %r28
iob_intr_0_249:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_249), 16, 16)) -> intp(0, 0, 4)
	.word 0xb60c0000  ! 2932: AND_R	and 	%r16, %r0, %r27
T0_asi_reg_wr_149:
	mov	0x3c1, %r14
	.word 0xf8f38400  ! 2933: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb3e54000  ! 2935: SAVE_R	save	%r21, %r0, %r25
	.word 0xb7e44000  ! 2936: SAVE_R	save	%r17, %r0, %r27
	.word 0xbfe42093  ! 2938: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbde5a05d  ! 2939: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb1e4a006  ! 2940: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb5e56112  ! 2943: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbeb4e166  ! 2944: ORNcc_I	orncc 	%r19, 0x0166, %r31
iob_intr_0_250:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_250), 16, 16)) -> intp(0, 0, 15)
	.word 0xb1e5a05b  ! 2946: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_wr_150:
	mov	0x7, %r14
	.word 0xf6f38e40  ! 2947: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_wr_151:
	mov	0x3c1, %r14
	.word 0xfcf38e40  ! 2948: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb9e54000  ! 2949: SAVE_R	save	%r21, %r0, %r28
	.word 0xb1e4e06a  ! 2950: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_rd_118:
	mov	0x34, %r14
	.word 0xf0db8e80  ! 2951: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_0_251:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_251), 16, 16)) -> intp(0, 0, 1d)
T0_asi_reg_rd_119:
	mov	0x20, %r14
	.word 0xf8db8e80  ! 2954: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T0_asi_reg_rd_120:
	mov	0x19, %r14
	.word 0xf2db89e0  ! 2955: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_0_231:
	setx	0x360026, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_232:
	setx	0x340205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e50000  ! 2961: SAVE_R	save	%r20, %r0, %r27
iob_intr_0_252:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_252), 16, 16)) -> intp(0, 0, 1a)
T0_asi_reg_wr_152:
	mov	0x1c, %r14
	.word 0xf8f38e40  ! 2966: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_233:
	setx	0x340033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e48000  ! 2969: SAVE_R	save	%r18, %r0, %r25
cpu_intr_0_234:
	setx	0x34011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e50000  ! 2974: SAVE_R	save	%r20, %r0, %r28
	.word 0xb22c8000  ! 2978: ANDN_R	andn 	%r18, %r0, %r25
	.word 0xbe348000  ! 2983: SUBC_R	orn 	%r18, %r0, %r31
	.word 0xb434a14d  ! 2985: ORN_I	orn 	%r18, 0x014d, %r26
	.word 0xb20c8000  ! 2986: AND_R	and 	%r18, %r0, %r25
	.word 0xbbe4e00a  ! 2987: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb7e52130  ! 2988: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3e48000  ! 2991: SAVE_R	save	%r18, %r0, %r25
	.word 0xb2344000  ! 2992: ORN_R	orn 	%r17, %r0, %r25
	.word 0xb7e46166  ! 2995: SAVE_I	save	%r17, 0x0001, %r27
cpu_intr_0_235:
	setx	0x360202, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_121:
	mov	0x38, %r14
	.word 0xf2db8e80  ! 2998: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_0_253:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_253), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_wr_153:
	mov	0x1e, %r14
	.word 0xf4f38e80  ! 3002: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb7e5e1b6  ! 3004: SAVE_I	save	%r23, 0x0001, %r27
iob_intr_0_254:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_254), 16, 16)) -> intp(0, 0, 11)
T0_asi_reg_rd_122:
	mov	0x3c6, %r14
	.word 0xf6db89e0  ! 3012: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xbde460b2  ! 3013: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbfe50000  ! 3014: SAVE_R	save	%r20, %r0, %r31
	.word 0xb3e42034  ! 3015: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_rd_123:
	mov	0x35, %r14
	.word 0xfedb8e60  ! 3016: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb7e56084  ! 3017: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_rd_124:
	mov	0x3c7, %r14
	.word 0xf4db8e40  ! 3018: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbbe5e00f  ! 3021: SAVE_I	save	%r23, 0x0001, %r29
cpu_intr_0_236:
	setx	0x34002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaa52001  ! 3024: SUBcc_I	subcc 	%r20, 0x0001, %r29
	.word 0x8395210d  ! 3025: WRPR_TNPC_I	wrpr	%r20, 0x010d, %tnpc
	.word 0xb1e4e1a4  ! 3026: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7643801  ! 3027: MOVcc_I	<illegal instruction>
iob_intr_0_255:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_255), 16, 16)) -> intp(0, 0, 7)
	.word 0xbc344000  ! 3032: SUBC_R	orn 	%r17, %r0, %r30
iob_intr_0_256:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_256), 16, 16)) -> intp(0, 0, 30)
	.word 0xb3e48000  ! 3037: SAVE_R	save	%r18, %r0, %r25
	.word 0xb1e44000  ! 3038: SAVE_R	save	%r17, %r0, %r24
iob_intr_0_257:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_257), 16, 16)) -> intp(0, 0, 6)
	.word 0xbfe4c000  ! 3042: SAVE_R	save	%r19, %r0, %r31
cpu_intr_0_237:
	setx	0x34000c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_238:
	setx	0x35000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a1e5  ! 3049: SAVE_I	save	%r22, 0x0001, %r25
	.word 0x8194e06f  ! 3050: WRPR_TPC_I	wrpr	%r19, 0x006f, %tpc
cpu_intr_0_239:
	setx	0x340136, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_258:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_258), 16, 16)) -> intp(0, 0, 39)
iob_intr_0_259:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_259), 16, 16)) -> intp(0, 0, 23)
	.word 0xb7e48000  ! 3058: SAVE_R	save	%r18, %r0, %r27
cpu_intr_0_240:
	setx	0x340124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb285e17a  ! 3064: ADDcc_I	addcc 	%r23, 0x017a, %r25
cpu_intr_0_241:
	setx	0x350332, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_154:
	mov	0x38, %r14
	.word 0xf6f38e40  ! 3069: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_wr_155:
	mov	0x32, %r14
	.word 0xf8f38e80  ! 3070: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T0_asi_reg_wr_156:
	mov	0x3c7, %r14
	.word 0xf0f384a0  ! 3071: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_0_260:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_260), 16, 16)) -> intp(0, 0, 16)
iob_intr_0_261:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_261), 16, 16)) -> intp(0, 0, 19)
cpu_intr_0_242:
	setx	0x360217, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_262:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_262), 16, 16)) -> intp(0, 0, 6)
	.word 0xb7e58000  ! 3079: SAVE_R	save	%r22, %r0, %r27
	.word 0xbfe521f0  ! 3082: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb5e4e0e3  ! 3084: SAVE_I	save	%r19, 0x0001, %r26
cpu_intr_0_243:
	setx	0x360222, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_157:
	mov	0x8, %r14
	.word 0xf4f38400  ! 3088: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb7e4a00b  ! 3089: SAVE_I	save	%r18, 0x0001, %r27
iob_intr_0_263:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_263), 16, 16)) -> intp(0, 0, 27)
	.word 0xb77c8400  ! 3092: MOVR_R	movre	%r18, %r0, %r27
cpu_intr_0_244:
	setx	0x360231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e58000  ! 3094: SAVE_R	save	%r22, %r0, %r25
T0_asi_reg_rd_125:
	mov	0x2e, %r14
	.word 0xf4db8e40  ! 3095: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_264:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_264), 16, 16)) -> intp(0, 0, 2)
iob_intr_0_265:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_265), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_rd_126:
	mov	0x1a, %r14
	.word 0xf2db8e40  ! 3098: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T0_asi_reg_wr_158:
	mov	0x10, %r14
	.word 0xfaf389e0  ! 3099: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_0_245:
	setx	0x37002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a095  ! 3102: SAVE_I	save	%r18, 0x0001, %r27
cpu_intr_0_246:
	setx	0x370302, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_159:
	mov	0x3c6, %r14
	.word 0xfef38e40  ! 3109: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_0_266:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_266), 16, 16)) -> intp(0, 0, 2e)
	.word 0xbde50000  ! 3113: SAVE_R	save	%r20, %r0, %r30
	.word 0xbfe58000  ! 3114: SAVE_R	save	%r22, %r0, %r31
T0_asi_reg_wr_160:
	mov	0xd, %r14
	.word 0xfcf38e80  ! 3115: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_0_267:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_267), 16, 16)) -> intp(0, 0, 3)
	.word 0xb1e48000  ! 3123: SAVE_R	save	%r18, %r0, %r24
	.word 0xbbe44000  ! 3125: SAVE_R	save	%r17, %r0, %r29
	.word 0xbde561f9  ! 3127: SAVE_I	save	%r21, 0x0001, %r30
T0_asi_reg_rd_127:
	mov	0x19, %r14
	.word 0xf8db84a0  ! 3130: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_0_268:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_268), 16, 16)) -> intp(0, 0, e)
	.word 0xbde5a045  ! 3133: SAVE_I	save	%r22, 0x0001, %r30
iob_intr_0_269:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_269), 16, 16)) -> intp(0, 0, 22)
	.word 0xbbe50000  ! 3142: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_rd_128:
	mov	0x3c3, %r14
	.word 0xf8db8e40  ! 3145: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbbe40000  ! 3146: SAVE_R	save	%r16, %r0, %r29
iob_intr_0_270:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_270), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_wr_161:
	mov	0x3c3, %r14
	.word 0xf4f38e40  ! 3148: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb3e46089  ! 3150: SAVE_I	save	%r17, 0x0001, %r25
iob_intr_0_271:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_271), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbde461fa  ! 3153: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7e5616a  ! 3156: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbbe5c000  ! 3158: SAVE_R	save	%r23, %r0, %r29
T0_asi_reg_wr_162:
	mov	0x35, %r14
	.word 0xf4f389e0  ! 3161: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb1e48000  ! 3167: SAVE_R	save	%r18, %r0, %r24
T0_asi_reg_rd_129:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 3171: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb9e5a13d  ! 3179: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e5a1b7  ! 3181: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb9e46170  ! 3182: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbbe54000  ! 3190: SAVE_R	save	%r21, %r0, %r29
	.word 0xbbe5a1c1  ! 3197: SAVE_I	save	%r22, 0x0001, %r29
T0_asi_reg_rd_130:
	mov	0x3c6, %r14
	.word 0xf6db8e60  ! 3198: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbe8d0000  ! 3200: ANDcc_R	andcc 	%r20, %r0, %r31
	.word 0xb44460d4  ! 3201: ADDC_I	addc 	%r17, 0x00d4, %r26
iob_intr_0_272:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_272), 16, 16)) -> intp(0, 0, 27)
cpu_intr_0_247:
	setx	0x3a0102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_248:
	setx	0x390202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4c000  ! 3217: SAVE_R	save	%r19, %r0, %r24
	.word 0xb7e5a1b7  ! 3219: SAVE_I	save	%r22, 0x0001, %r27
iob_intr_0_273:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_273), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_wr_163:
	mov	0x1, %r14
	.word 0xf6f38e40  ! 3224: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0x919421e9  ! 3225: WRPR_PIL_I	wrpr	%r16, 0x01e9, %pil
	.word 0xbfe5a02b  ! 3228: SAVE_I	save	%r22, 0x0001, %r31
T0_asi_reg_rd_131:
	mov	0x1e, %r14
	.word 0xfcdb8e40  ! 3231: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_wr_164:
	mov	0x3c6, %r14
	.word 0xf8f38400  ! 3233: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T0_asi_reg_rd_132:
	mov	0x6, %r14
	.word 0xfcdb8e60  ! 3239: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T0_asi_reg_wr_165:
	mov	0x34, %r14
	.word 0xfaf38e60  ! 3241: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_0_274:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_274), 16, 16)) -> intp(0, 0, c)
	.word 0xbde4c000  ! 3246: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_wr_166:
	mov	0xf, %r14
	.word 0xfcf38e40  ! 3247: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_275:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_275), 16, 16)) -> intp(0, 0, 36)
cpu_intr_0_249:
	setx	0x390018, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_276:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_276), 16, 16)) -> intp(0, 0, 1b)
	.word 0xbbe4c000  ! 3258: SAVE_R	save	%r19, %r0, %r29
	.word 0x8d956193  ! 3260: WRPR_PSTATE_I	wrpr	%r21, 0x0193, %pstate
iob_intr_0_277:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_277), 16, 16)) -> intp(0, 0, 2e)
	.word 0xbbe5a114  ! 3263: SAVE_I	save	%r22, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_133:
	mov	0x2e, %r14
	.word 0xfedb8e60  ! 3265: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_0_278:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_278), 16, 16)) -> intp(0, 0, 39)
	.word 0xbde5c000  ! 3269: SAVE_R	save	%r23, %r0, %r30
	.word 0xb7e58000  ! 3270: SAVE_R	save	%r22, %r0, %r27
	.word 0xb3e48000  ! 3272: SAVE_R	save	%r18, %r0, %r25
	.word 0xb8b58000  ! 3275: SUBCcc_R	orncc 	%r22, %r0, %r28
	.word 0xb7e58000  ! 3276: SAVE_R	save	%r22, %r0, %r27
	.word 0xb9e5605c  ! 3277: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbbe4607b  ! 3279: SAVE_I	save	%r17, 0x0001, %r29
T0_asi_reg_wr_167:
	mov	0x3c1, %r14
	.word 0xfef384a0  ! 3282: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_0_250:
	setx	0x3b0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe48000  ! 3289: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_rd_134:
	mov	0x3c0, %r14
	.word 0xfadb8e40  ! 3290: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_251:
	setx	0x3a0026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe44000  ! 3293: SAVE_R	save	%r17, %r0, %r29
	.word 0xbde561da  ! 3295: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb0b4e01e  ! 3299: ORNcc_I	orncc 	%r19, 0x001e, %r24
	.word 0xb4ad4000  ! 3300: ANDNcc_R	andncc 	%r21, %r0, %r26
T0_asi_reg_wr_168:
	mov	0x1d, %r14
	.word 0xfef38e80  ! 3303: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbde5e168  ! 3304: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb1e5a1ff  ! 3306: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_rd_135:
	mov	0x2b, %r14
	.word 0xf2db84a0  ! 3307: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_0_252:
	setx	0x390323, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_169:
	mov	0x4, %r14
	.word 0xfaf38e60  ! 3309: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_0_253:
	setx	0x38003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a006  ! 3316: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_wr_170:
	mov	0xe, %r14
	.word 0xfef38400  ! 3318: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb1e4a1a2  ! 3321: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbfe5c000  ! 3322: SAVE_R	save	%r23, %r0, %r31
cpu_intr_0_254:
	setx	0x3b0138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e48000  ! 3330: SAVE_R	save	%r18, %r0, %r28
T0_asi_reg_wr_171:
	mov	0xd, %r14
	.word 0xf0f38e80  ! 3334: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbead4000  ! 3336: ANDNcc_R	andncc 	%r21, %r0, %r31
iob_intr_0_279:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_279), 16, 16)) -> intp(0, 0, 5)
	.word 0xb02c0000  ! 3346: ANDN_R	andn 	%r16, %r0, %r24
cpu_intr_0_255:
	setx	0x3b0307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_256:
	setx	0x390207, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_280:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_280), 16, 16)) -> intp(0, 0, 3)
iob_intr_0_281:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_281), 16, 16)) -> intp(0, 0, 28)
	.word 0xbac461e8  ! 3353: ADDCcc_I	addccc 	%r17, 0x01e8, %r29
iob_intr_0_282:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_282), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb4b56079  ! 3358: SUBCcc_I	orncc 	%r21, 0x0079, %r26
	.word 0xb9e5c000  ! 3359: SAVE_R	save	%r23, %r0, %r28
T0_asi_reg_rd_136:
	mov	0x3c3, %r14
	.word 0xfadb8400  ! 3363: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb3e4a1e3  ! 3367: SAVE_I	save	%r18, 0x0001, %r25
T0_asi_reg_rd_137:
	mov	0x13, %r14
	.word 0xf4db8e60  ! 3368: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb5e521cc  ! 3369: SAVE_I	save	%r20, 0x0001, %r26
iob_intr_0_283:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_283), 16, 16)) -> intp(0, 0, 27)
	.word 0xb5e50000  ! 3376: SAVE_R	save	%r20, %r0, %r26
cpu_intr_0_257:
	setx	0x380316, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_138:
	mov	0x3c5, %r14
	.word 0xf8db8e60  ! 3381: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T0_asi_reg_wr_172:
	mov	0x17, %r14
	.word 0xf0f38e80  ! 3382: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbe0c4000  ! 3383: AND_R	and 	%r17, %r0, %r31
	.word 0xb5e4c000  ! 3387: SAVE_R	save	%r19, %r0, %r26
	.word 0xbfe4e1b1  ! 3388: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbde54000  ! 3392: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_258:
	setx	0x380138, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_259:
	setx	0x3a0226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_260:
	setx	0x3a013f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_284:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_284), 16, 16)) -> intp(0, 0, e)
cpu_intr_0_261:
	setx	0x3a0129, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_285:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_285), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb5e4e05f  ! 3408: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb73da001  ! 3409: SRA_I	sra 	%r22, 0x0001, %r27
	.word 0xb01c0000  ! 3411: XOR_R	xor 	%r16, %r0, %r24
	.word 0xb29c8000  ! 3414: XORcc_R	xorcc 	%r18, %r0, %r25
T0_asi_reg_rd_139:
	mov	0x8, %r14
	.word 0xfcdb8400  ! 3420: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_0_262:
	setx	0x3b0002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a0f7  ! 3425: SAVE_I	save	%r22, 0x0001, %r26
cpu_intr_0_263:
	setx	0x3b002c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_173:
	mov	0x3, %r14
	.word 0xfaf38e80  ! 3427: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T0_asi_reg_rd_140:
	mov	0x3c2, %r14
	.word 0xf4db84a0  ! 3428: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb7e4c000  ! 3429: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_rd_141:
	mov	0x34, %r14
	.word 0xf2db89e0  ! 3430: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb1510000  ! 3441: RDPR_TICK	<illegal instruction>
T0_asi_reg_wr_174:
	mov	0xb, %r14
	.word 0xfaf38e60  ! 3443: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbde5c000  ! 3444: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_264:
	setx	0x380310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e177  ! 3453: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb014c000  ! 3454: OR_R	or 	%r19, %r0, %r24
	.word 0xbfe521c9  ! 3455: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_rd_142:
	mov	0x3, %r14
	.word 0xfadb8400  ! 3456: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_0_286:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_286), 16, 16)) -> intp(0, 0, 16)
iob_intr_0_287:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_287), 16, 16)) -> intp(0, 0, 30)
cpu_intr_0_265:
	setx	0x3a0000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e0b6  ! 3464: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde50000  ! 3465: SAVE_R	save	%r20, %r0, %r30
	.word 0xb3e44000  ! 3469: SAVE_R	save	%r17, %r0, %r25
cpu_intr_0_266:
	setx	0x390011, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_267:
	setx	0x3b010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e198  ! 3475: SAVE_I	save	%r19, 0x0001, %r28
cpu_intr_0_268:
	setx	0x39021a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_143:
	mov	0x3c8, %r14
	.word 0xf4db8e40  ! 3477: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb7e54000  ! 3480: SAVE_R	save	%r21, %r0, %r27
	.word 0xbde56102  ! 3482: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e5a075  ! 3484: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1e4a0a5  ! 3485: SAVE_I	save	%r18, 0x0001, %r24
cpu_intr_0_269:
	setx	0x38010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 3490: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_288:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_288), 16, 16)) -> intp(0, 0, 36)
iob_intr_0_289:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_289), 16, 16)) -> intp(0, 0, 34)
	.word 0xb0348000  ! 3494: ORN_R	orn 	%r18, %r0, %r24
T0_asi_reg_rd_144:
	mov	0x25, %r14
	.word 0xf6db8e60  ! 3495: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T0_asi_reg_rd_145:
	mov	0x3c0, %r14
	.word 0xfedb8e40  ! 3499: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_wr_175:
	mov	0x3c8, %r14
	.word 0xf2f389e0  ! 3500: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb9e46015  ! 3502: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbde58000  ! 3503: SAVE_R	save	%r22, %r0, %r30
	.word 0xb7e58000  ! 3505: SAVE_R	save	%r22, %r0, %r27
	.word 0xb9e54000  ! 3507: SAVE_R	save	%r21, %r0, %r28
	.word 0xb9e4c000  ! 3510: SAVE_R	save	%r19, %r0, %r28
	.word 0xb1e4c000  ! 3511: SAVE_R	save	%r19, %r0, %r24
	.word 0xb1e52145  ! 3513: SAVE_I	save	%r20, 0x0001, %r24
cpu_intr_0_270:
	setx	0x3a023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e460f8  ! 3522: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbbe52040  ! 3523: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbfe5c000  ! 3524: SAVE_R	save	%r23, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_290:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_290), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbc25a0a8  ! 3529: SUB_I	sub 	%r22, 0x00a8, %r30
cpu_intr_0_271:
	setx	0x3a0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e44000  ! 3532: SAVE_R	save	%r17, %r0, %r27
	.word 0xbbe58000  ! 3534: SAVE_R	save	%r22, %r0, %r29
iob_intr_0_291:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_291), 16, 16)) -> intp(0, 0, 19)
iob_intr_0_292:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_292), 16, 16)) -> intp(0, 0, 1a)
T0_asi_reg_rd_146:
	mov	0x1, %r14
	.word 0xf8db8e40  ! 3543: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_272:
	setx	0x390235, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_147:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 3546: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_293:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_293), 16, 16)) -> intp(0, 0, 2)
	.word 0xb73d2001  ! 3549: SRA_I	sra 	%r20, 0x0001, %r27
	.word 0xb9e54000  ! 3550: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_wr_176:
	mov	0x1, %r14
	.word 0xf4f38e40  ! 3551: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbde5c000  ! 3553: SAVE_R	save	%r23, %r0, %r30
T0_asi_reg_wr_177:
	mov	0x1b, %r14
	.word 0xf2f38e60  ! 3555: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T0_asi_reg_rd_148:
	mov	0x3c8, %r14
	.word 0xf8db8400  ! 3557: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T0_asi_reg_wr_178:
	mov	0x3c5, %r14
	.word 0xf6f38e80  ! 3558: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb9e48000  ! 3559: SAVE_R	save	%r18, %r0, %r28
cpu_intr_0_273:
	setx	0x390121, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_274:
	setx	0x38013c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_275:
	setx	0x39013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e48000  ! 3566: SAVE_R	save	%r18, %r0, %r25
cpu_intr_0_276:
	setx	0x390017, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_179:
	mov	0x27, %r14
	.word 0xf4f38e40  ! 3569: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb1e461b3  ! 3571: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_wr_180:
	mov	0x6, %r14
	.word 0xfef384a0  ! 3572: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_0_294:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_294), 16, 16)) -> intp(0, 0, 4)
cpu_intr_0_277:
	setx	0x380022, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e5c000  ! 3580: SAVE_R	save	%r23, %r0, %r24
cpu_intr_0_278:
	setx	0x3a031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5c000  ! 3583: SAVE_R	save	%r23, %r0, %r28
	.word 0xb5e58000  ! 3584: SAVE_R	save	%r22, %r0, %r26
	.word 0xb9e5218b  ! 3593: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1e50000  ! 3594: SAVE_R	save	%r20, %r0, %r24
	.word 0xbbe50000  ! 3595: SAVE_R	save	%r20, %r0, %r29
	.word 0xb02d8000  ! 3597: ANDN_R	andn 	%r22, %r0, %r24
cpu_intr_0_279:
	setx	0x390308, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_295:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_295), 16, 16)) -> intp(0, 0, 22)
iob_intr_0_296:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_296), 16, 16)) -> intp(0, 0, 1e)
iob_intr_0_297:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_297), 16, 16)) -> intp(0, 0, 15)
cpu_intr_0_280:
	setx	0x380027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe58000  ! 3618: SAVE_R	save	%r22, %r0, %r29
cpu_intr_0_281:
	setx	0x3a0102, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_298:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_298), 16, 16)) -> intp(0, 0, 38)
	.word 0xbde44000  ! 3624: SAVE_R	save	%r17, %r0, %r30
	.word 0xbfe5a077  ! 3626: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb1e560d3  ! 3627: SAVE_I	save	%r21, 0x0001, %r24
cpu_intr_0_282:
	setx	0x3b0030, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_181:
	mov	0x15, %r14
	.word 0xf0f38e40  ! 3632: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbfe48000  ! 3633: SAVE_R	save	%r18, %r0, %r31
	.word 0xb82c8000  ! 3635: ANDN_R	andn 	%r18, %r0, %r28
	.word 0xb2042196  ! 3638: ADD_I	add 	%r16, 0x0196, %r25
	.word 0xb7e40000  ! 3639: SAVE_R	save	%r16, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e40000  ! 3642: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_299:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_299), 16, 16)) -> intp(0, 0, 37)
	.word 0xb89d2144  ! 3646: XORcc_I	xorcc 	%r20, 0x0144, %r28
iob_intr_0_300:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_300), 16, 16)) -> intp(0, 0, 15)
	.word 0xb7e5a139  ! 3650: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9e4c000  ! 3651: SAVE_R	save	%r19, %r0, %r28
cpu_intr_0_283:
	setx	0x38021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb41ca15b  ! 3654: XOR_I	xor 	%r18, 0x015b, %r26
	.word 0xb9e421aa  ! 3655: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbde4a002  ! 3657: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5e40000  ! 3659: SAVE_R	save	%r16, %r0, %r26
	.word 0xbde5a06f  ! 3660: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbde5a1c8  ! 3661: SAVE_I	save	%r22, 0x0001, %r30
cpu_intr_0_284:
	setx	0x3b010a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_301:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_301), 16, 16)) -> intp(0, 0, 31)
	.word 0xbfe56150  ! 3665: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbbe460c3  ! 3666: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb9e54000  ! 3668: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_rd_149:
	mov	0xd, %r14
	.word 0xf4db89e0  ! 3675: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_0_285:
	setx	0x3e030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_182:
	mov	0x10, %r14
	.word 0xf4f384a0  ! 3679: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb1e44000  ! 3684: SAVE_R	save	%r17, %r0, %r24
iob_intr_0_302:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_302), 16, 16)) -> intp(0, 0, 0)
cpu_intr_0_286:
	setx	0x3f0239, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_287:
	setx	0x3c021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_303:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_303), 16, 16)) -> intp(0, 0, 13)
cpu_intr_0_288:
	setx	0x3c0234, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_304:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_304), 16, 16)) -> intp(0, 0, 2b)
iob_intr_0_305:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_305), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_rd_150:
	mov	0xf, %r14
	.word 0xf0db89e0  ! 3696: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbbe48000  ! 3697: SAVE_R	save	%r18, %r0, %r29
iob_intr_0_306:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_306), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_wr_183:
	mov	0x8, %r14
	.word 0xfcf38e60  ! 3704: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbbe50000  ! 3706: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_307:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_307), 16, 16)) -> intp(0, 0, 25)
	.word 0xb5643801  ! 3709: MOVcc_I	<illegal instruction>
T0_asi_reg_rd_151:
	mov	0x3c7, %r14
	.word 0xfedb84a0  ! 3710: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_0_289:
	setx	0x3c002e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_308:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_308), 16, 16)) -> intp(0, 0, 6)
	.word 0xb9643801  ! 3715: MOVcc_I	<illegal instruction>
iob_intr_0_309:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_309), 16, 16)) -> intp(0, 0, 35)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbbe5e171  ! 3720: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb3e4c000  ! 3721: SAVE_R	save	%r19, %r0, %r25
	.word 0xb3e460b5  ! 3725: SAVE_I	save	%r17, 0x0001, %r25
iob_intr_0_310:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_310), 16, 16)) -> intp(0, 0, 11)
	.word 0xbebde0ac  ! 3731: XNORcc_I	xnorcc 	%r23, 0x00ac, %r31
	.word 0xbbe4c000  ! 3732: SAVE_R	save	%r19, %r0, %r29
iob_intr_0_311:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_311), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb1e58000  ! 3742: SAVE_R	save	%r22, %r0, %r24
iob_intr_0_312:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_312), 16, 16)) -> intp(0, 0, 3b)
iob_intr_0_313:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_313), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_rd_152:
	mov	0x17, %r14
	.word 0xf6db8400  ! 3755: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbde48000  ! 3757: SAVE_R	save	%r18, %r0, %r30
iob_intr_0_314:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_314), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb7e42144  ! 3760: SAVE_I	save	%r16, 0x0001, %r27
T0_asi_reg_wr_184:
	mov	0x24, %r14
	.word 0xf2f38e40  ! 3763: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb0b4e0d7  ! 3766: ORNcc_I	orncc 	%r19, 0x00d7, %r24
iob_intr_0_315:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_315), 16, 16)) -> intp(0, 0, 12)
cpu_intr_0_290:
	setx	0x3c033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5c000  ! 3774: SAVE_R	save	%r23, %r0, %r26
cpu_intr_0_291:
	setx	0x3d0310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e56172  ! 3778: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbfe50000  ! 3781: SAVE_R	save	%r20, %r0, %r31
iob_intr_0_316:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_316), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb5e44000  ! 3783: SAVE_R	save	%r17, %r0, %r26
T0_asi_reg_wr_185:
	mov	0x16, %r14
	.word 0xfef384a0  ! 3792: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb9e5e09e  ! 3794: SAVE_I	save	%r23, 0x0001, %r28
iob_intr_0_317:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_317), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb1504000  ! 3797: RDPR_TNPC	<illegal instruction>
iob_intr_0_318:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_318), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb1e58000  ! 3799: SAVE_R	save	%r22, %r0, %r24
	.word 0xb48d6136  ! 3800: ANDcc_I	andcc 	%r21, 0x0136, %r26
T0_asi_reg_rd_153:
	mov	0x3c3, %r14
	.word 0xfadb8400  ! 3801: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_0_292:
	setx	0x3d0128, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_293:
	setx	0x3d0108, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_319:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_319), 16, 16)) -> intp(0, 0, 32)
T0_asi_reg_rd_154:
	mov	0x3c6, %r14
	.word 0xfcdb8e40  ! 3806: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbf50c000  ! 3807: RDPR_TT	<illegal instruction>
	.word 0xbbe56122  ! 3808: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbde4a0d6  ! 3810: SAVE_I	save	%r18, 0x0001, %r30
cpu_intr_0_294:
	setx	0x3d001a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_320:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_320), 16, 16)) -> intp(0, 0, 14)
cpu_intr_0_295:
	setx	0x3c023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4c000  ! 3825: SAVE_R	save	%r19, %r0, %r24
	.word 0xb6bc20eb  ! 3828: XNORcc_I	xnorcc 	%r16, 0x00eb, %r27
T0_asi_reg_rd_155:
	mov	0x2e, %r14
	.word 0xfadb8e60  ! 3830: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T0_asi_reg_wr_186:
	mov	0xd, %r14
	.word 0xf8f389e0  ! 3832: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbfe54000  ! 3834: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_321:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_321), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_wr_187:
	mov	0x38, %r14
	.word 0xf6f384a0  ! 3837: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T0_asi_reg_wr_188:
	mov	0x3c6, %r14
	.word 0xfef38e60  ! 3840: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_0_322:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_322), 16, 16)) -> intp(0, 0, 33)
	.word 0xbfe48000  ! 3842: SAVE_R	save	%r18, %r0, %r31
iob_intr_0_323:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_323), 16, 16)) -> intp(0, 0, 24)
	.word 0xb77c0400  ! 3848: MOVR_R	movre	%r16, %r0, %r27
T0_asi_reg_rd_156:
	mov	0x23, %r14
	.word 0xf6db8400  ! 3856: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbfe50000  ! 3857: SAVE_R	save	%r20, %r0, %r31
	.word 0xbfe40000  ! 3862: SAVE_R	save	%r16, %r0, %r31
	.word 0xb0344000  ! 3867: ORN_R	orn 	%r17, %r0, %r24
cpu_intr_0_296:
	setx	0x3f0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4a54000  ! 3869: SUBcc_R	subcc 	%r21, %r0, %r26
iob_intr_0_324:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_324), 16, 16)) -> intp(0, 0, 37)
	.word 0xb3e5e019  ! 3876: SAVE_I	save	%r23, 0x0001, %r25
iob_intr_0_325:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_325), 16, 16)) -> intp(0, 0, 32)
cpu_intr_0_297:
	setx	0x3d010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a083  ! 3880: SAVE_I	save	%r18, 0x0001, %r24
cpu_intr_0_298:
	setx	0x3f002f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_189:
	mov	0x34, %r14
	.word 0xfaf389e0  ! 3882: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_0_326:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_326), 16, 16)) -> intp(0, 0, 1)
	.word 0xb9e40000  ! 3886: SAVE_R	save	%r16, %r0, %r28
	.word 0x89952165  ! 3891: WRPR_TICK_I	wrpr	%r20, 0x0165, %tick
T0_asi_reg_wr_190:
	mov	0x3c2, %r14
	.word 0xf4f38400  ! 3896: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T0_asi_reg_wr_191:
	mov	0x31, %r14
	.word 0xfcf38e80  ! 3897: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T0_asi_reg_rd_157:
	mov	0x21, %r14
	.word 0xf6db8e40  ! 3901: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_0_299:
	setx	0x3f013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a1ca  ! 3905: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_rd_158:
	mov	0x37, %r14
	.word 0xfedb8e40  ! 3906: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbde4c000  ! 3907: SAVE_R	save	%r19, %r0, %r30
	.word 0xba458000  ! 3909: ADDC_R	addc 	%r22, %r0, %r29
iob_intr_0_327:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_327), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_rd_159:
	mov	0x14, %r14
	.word 0xf0db89e0  ! 3912: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T0_asi_reg_rd_160:
	mov	0x34, %r14
	.word 0xfadb8e60  ! 3914: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbbe5e0d6  ! 3915: SAVE_I	save	%r23, 0x0001, %r29
iob_intr_0_328:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_328), 16, 16)) -> intp(0, 0, 7)
	.word 0xb9e5a09e  ! 3919: SAVE_I	save	%r22, 0x0001, %r28
iob_intr_0_329:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_329), 16, 16)) -> intp(0, 0, 35)
iob_intr_0_330:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_330), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_wr_192:
	mov	0x3c0, %r14
	.word 0xf8f38400  ! 3924: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T0_asi_reg_rd_161:
	mov	0x1e, %r14
	.word 0xf6db8e80  ! 3925: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T0_asi_reg_wr_193:
	mov	0x29, %r14
	.word 0xf0f384a0  ! 3928: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb9e58000  ! 3930: SAVE_R	save	%r22, %r0, %r28
cpu_intr_0_300:
	setx	0x3e0301, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_194:
	mov	0x3c0, %r14
	.word 0xf4f38400  ! 3938: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb52d2001  ! 3940: SLL_I	sll 	%r20, 0x0001, %r26
T0_asi_reg_wr_195:
	mov	0x3c1, %r14
	.word 0xf8f384a0  ! 3942: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb3e4a037  ! 3943: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe44000  ! 3947: SAVE_R	save	%r17, %r0, %r31
T0_asi_reg_wr_196:
	mov	0x30, %r14
	.word 0xfaf38e80  ! 3952: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb5643801  ! 3953: MOVcc_I	<illegal instruction>
T0_asi_reg_rd_162:
	mov	0x3c3, %r14
	.word 0xf8db8e80  ! 3954: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb0b5a0e7  ! 3957: ORNcc_I	orncc 	%r22, 0x00e7, %r24
	.word 0xb3e42180  ! 3959: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_wr_197:
	mov	0x3c0, %r14
	.word 0xf6f389e0  ! 3960: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xbfe40000  ! 3967: SAVE_R	save	%r16, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_331:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_331), 16, 16)) -> intp(0, 0, 13)
	.word 0xb13cd000  ! 3973: SRAX_R	srax	%r19, %r0, %r24
	.word 0xbfe4214e  ! 3974: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb7e5a0de  ! 3975: SAVE_I	save	%r22, 0x0001, %r27
T0_asi_reg_rd_163:
	mov	0x3c6, %r14
	.word 0xf2db8400  ! 3976: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb1e44000  ! 3978: SAVE_R	save	%r17, %r0, %r24
cpu_intr_0_301:
	setx	0x3f0210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4c000  ! 3983: SAVE_R	save	%r19, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_302:
	setx	0x3d032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a0d9  ! 3992: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb9e54000  ! 3993: SAVE_R	save	%r21, %r0, %r28
	.word 0xb814a035  ! 3995: OR_I	or 	%r18, 0x0035, %r28
iob_intr_0_332:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_332), 16, 16)) -> intp(0, 0, d)
	.word 0xb5e5a072  ! 4003: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbfe46179  ! 4005: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_wr_198:
	mov	0x3c7, %r14
	.word 0xfcf384a0  ! 4007: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb7e58000  ! 4008: SAVE_R	save	%r22, %r0, %r27
	.word 0xb3e58000  ! 4015: SAVE_R	save	%r22, %r0, %r25
T0_asi_reg_rd_164:
	mov	0x4, %r14
	.word 0xfedb8e40  ! 4017: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_wr_199:
	mov	0x28, %r14
	.word 0xf8f384a0  ! 4018: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T0_asi_reg_wr_200:
	mov	0x3c4, %r14
	.word 0xf6f389e0  ! 4021: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb7e40000  ! 4022: SAVE_R	save	%r16, %r0, %r27
	.word 0xbfe5a140  ! 4023: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbfe5c000  ! 4024: SAVE_R	save	%r23, %r0, %r31
T0_asi_reg_rd_165:
	mov	0x3c7, %r14
	.word 0xf4db8e40  ! 4026: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_0_303:
	setx	0x3c0337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e48000  ! 4032: SAVE_R	save	%r18, %r0, %r24
	.word 0xb405210e  ! 4033: ADD_I	add 	%r20, 0x010e, %r26
	.word 0xbbe48000  ! 4035: SAVE_R	save	%r18, %r0, %r29
	.word 0xb5e50000  ! 4037: SAVE_R	save	%r20, %r0, %r26
cpu_intr_0_304:
	setx	0x3c0333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e52165  ! 4042: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb9e521ea  ! 4043: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_305:
	setx	0x3e033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcb461a3  ! 4050: SUBCcc_I	orncc 	%r17, 0x01a3, %r30
T0_asi_reg_wr_201:
	mov	0x3c8, %r14
	.word 0xfcf384a0  ! 4052: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb3e4e0e5  ! 4054: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb9e4c000  ! 4057: SAVE_R	save	%r19, %r0, %r28
	.word 0xb0c521fd  ! 4059: ADDCcc_I	addccc 	%r20, 0x01fd, %r24
cpu_intr_0_306:
	setx	0x3c000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc2560c3  ! 4061: SUB_I	sub 	%r21, 0x00c3, %r30
	.word 0xb7e5e199  ! 4062: SAVE_I	save	%r23, 0x0001, %r27
cpu_intr_0_307:
	setx	0x3e0105, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_308:
	setx	0x3d030e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_309:
	setx	0x3d023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb63c207a  ! 4069: XNOR_I	xnor 	%r16, 0x007a, %r27
	.word 0xb9e48000  ! 4070: SAVE_R	save	%r18, %r0, %r28
iob_intr_0_333:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_333), 16, 16)) -> intp(0, 0, b)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_310:
	setx	0x3e010b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_334:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_334), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb1e5e14d  ! 4079: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_rd_166:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 4081: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb63de1d1  ! 4082: XNOR_I	xnor 	%r23, 0x01d1, %r27
T0_asi_reg_rd_167:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 4085: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb5e5215b  ! 4086: SAVE_I	save	%r20, 0x0001, %r26
cpu_intr_0_311:
	setx	0x3e0034, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_168:
	mov	0x34, %r14
	.word 0xfadb8e40  ! 4089: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_0_335:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_335), 16, 16)) -> intp(0, 0, 27)
cpu_intr_0_312:
	setx	0x3f0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a10b  ! 4096: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e4c000  ! 4098: SAVE_R	save	%r19, %r0, %r24
	.word 0xbbe4a1ab  ! 4099: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb2a54000  ! 4101: SUBcc_R	subcc 	%r21, %r0, %r25
	.word 0x899421e0  ! 4103: WRPR_TICK_I	wrpr	%r16, 0x01e0, %tick
cpu_intr_0_313:
	setx	0x3c032f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_169:
	mov	0x8, %r14
	.word 0xf2db89e0  ! 4106: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb8942074  ! 4112: ORcc_I	orcc 	%r16, 0x0074, %r28
	.word 0xbde44000  ! 4116: SAVE_R	save	%r17, %r0, %r30
iob_intr_0_336:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_336), 16, 16)) -> intp(0, 0, 26)
	.word 0xb3e5c000  ! 4119: SAVE_R	save	%r23, %r0, %r25
	.word 0xbfe4e181  ! 4120: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb7e54000  ! 4121: SAVE_R	save	%r21, %r0, %r27
cpu_intr_0_314:
	setx	0x41023d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_315:
	setx	0x400201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e15c  ! 4129: SAVE_I	save	%r19, 0x0001, %r31
cpu_intr_0_316:
	setx	0x420109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_337:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_337), 16, 16)) -> intp(0, 0, 11)
cpu_intr_0_317:
	setx	0x410139, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e561e0  ! 4143: SAVE_I	save	%r21, 0x0001, %r28
cpu_intr_0_318:
	setx	0x400307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e0e6  ! 4145: SAVE_I	save	%r23, 0x0001, %r26
cpu_intr_0_319:
	setx	0x410216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e44000  ! 4154: SAVE_R	save	%r17, %r0, %r24
	.word 0xbebda0e3  ! 4155: XNORcc_I	xnorcc 	%r22, 0x00e3, %r31
cpu_intr_0_320:
	setx	0x420202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 4159: SAVE_R	save	%r23, %r0, %r27
T0_asi_reg_wr_202:
	mov	0x26, %r14
	.word 0xf2f384a0  ! 4160: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb6350000  ! 4161: SUBC_R	orn 	%r20, %r0, %r27
iob_intr_0_338:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_338), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_rd_170:
	mov	0xb, %r14
	.word 0xfcdb8e60  ! 4165: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb3e5a1d8  ! 4167: SAVE_I	save	%r22, 0x0001, %r25
T0_asi_reg_wr_203:
	mov	0x3c5, %r14
	.word 0xfaf384a0  ! 4169: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_0_321:
	setx	0x43020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde40000  ! 4174: SAVE_R	save	%r16, %r0, %r30
iob_intr_0_339:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_339), 16, 16)) -> intp(0, 0, 12)
	.word 0xb5e5e145  ! 4178: SAVE_I	save	%r23, 0x0001, %r26
iob_intr_0_340:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_340), 16, 16)) -> intp(0, 0, 5)
T0_asi_reg_rd_171:
	mov	0x36, %r14
	.word 0xfadb84a0  ! 4180: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_0_341:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_341), 16, 16)) -> intp(0, 0, 34)
	.word 0xb2c461dd  ! 4183: ADDCcc_I	addccc 	%r17, 0x01dd, %r25
	.word 0xb7e5e0fe  ! 4187: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb68d0000  ! 4194: ANDcc_R	andcc 	%r20, %r0, %r27
	.word 0xbbe54000  ! 4195: SAVE_R	save	%r21, %r0, %r29
	.word 0xb7e5c000  ! 4198: SAVE_R	save	%r23, %r0, %r27
T0_asi_reg_rd_172:
	mov	0x34, %r14
	.word 0xf6db8400  ! 4200: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_0_322:
	setx	0x400327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a090  ! 4204: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbb357001  ! 4205: SRLX_I	srlx	%r21, 0x0001, %r29
T0_asi_reg_wr_204:
	mov	0x3c7, %r14
	.word 0xfcf384a0  ! 4206: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb9e5609e  ! 4207: SAVE_I	save	%r21, 0x0001, %r28
cpu_intr_0_323:
	setx	0x40012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6046127  ! 4209: ADD_I	add 	%r17, 0x0127, %r27
iob_intr_0_342:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_342), 16, 16)) -> intp(0, 0, 8)
cpu_intr_0_324:
	setx	0x420017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe48000  ! 4213: SAVE_R	save	%r18, %r0, %r29
	.word 0xb7e40000  ! 4214: SAVE_R	save	%r16, %r0, %r27
	.word 0xbde5a078  ! 4216: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_rd_173:
	mov	0x11, %r14
	.word 0xfcdb8e40  ! 4219: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbbe4a022  ! 4220: SAVE_I	save	%r18, 0x0001, %r29
T0_asi_reg_wr_205:
	mov	0x3c8, %r14
	.word 0xf8f384a0  ! 4221: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_0_325:
	setx	0x420330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4c000  ! 4225: SAVE_R	save	%r19, %r0, %r26
	.word 0xb1e54000  ! 4226: SAVE_R	save	%r21, %r0, %r24
	.word 0xb2c4e186  ! 4227: ADDCcc_I	addccc 	%r19, 0x0186, %r25
T0_asi_reg_wr_206:
	mov	0x20, %r14
	.word 0xf0f384a0  ! 4229: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xba3d0000  ! 4230: XNOR_R	xnor 	%r20, %r0, %r29
T0_asi_reg_wr_207:
	mov	0x23, %r14
	.word 0xf4f384a0  ! 4233: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_0_343:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_343), 16, 16)) -> intp(0, 0, 27)
iob_intr_0_344:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_344), 16, 16)) -> intp(0, 0, 3b)
iob_intr_0_345:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_345), 16, 16)) -> intp(0, 0, 34)
	.word 0xb7e46099  ! 4237: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb7e461b6  ! 4238: SAVE_I	save	%r17, 0x0001, %r27
T0_asi_reg_rd_174:
	mov	0x3c6, %r14
	.word 0xfcdb8e40  ! 4239: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb7e4e14e  ! 4240: SAVE_I	save	%r19, 0x0001, %r27
T0_asi_reg_wr_208:
	mov	0x3c7, %r14
	.word 0xf2f389e0  ! 4241: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb5e4e059  ! 4250: SAVE_I	save	%r19, 0x0001, %r26
cpu_intr_0_326:
	setx	0x400030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb295215c  ! 4252: ORcc_I	orcc 	%r20, 0x015c, %r25
	.word 0xb42cc000  ! 4253: ANDN_R	andn 	%r19, %r0, %r26
	.word 0xb8c5a01c  ! 4254: ADDCcc_I	addccc 	%r22, 0x001c, %r28
T0_asi_reg_rd_175:
	mov	0x38, %r14
	.word 0xf0db89e0  ! 4258: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb1e54000  ! 4262: SAVE_R	save	%r21, %r0, %r24
	.word 0xb5e50000  ! 4263: SAVE_R	save	%r20, %r0, %r26
	.word 0xb5e461c1  ! 4264: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb5e48000  ! 4272: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_346:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_346), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbc158000  ! 4275: OR_R	or 	%r22, %r0, %r30
	.word 0xb83460cc  ! 4278: ORN_I	orn 	%r17, 0x00cc, %r28
T0_asi_reg_rd_176:
	mov	0x19, %r14
	.word 0xf0db84a0  ! 4281: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_0_347:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_347), 16, 16)) -> intp(0, 0, 39)
cpu_intr_0_327:
	setx	0x420033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a13a  ! 4288: SAVE_I	save	%r18, 0x0001, %r29
T0_asi_reg_rd_177:
	mov	0x1c, %r14
	.word 0xf0db8e80  ! 4290: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbde54000  ! 4292: SAVE_R	save	%r21, %r0, %r30
	.word 0xb7e4602a  ! 4293: SAVE_I	save	%r17, 0x0001, %r27
T0_asi_reg_wr_209:
	mov	0x17, %r14
	.word 0xf6f384a0  ! 4296: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_0_328:
	setx	0x430322, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_348:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_348), 16, 16)) -> intp(0, 0, 10)
iob_intr_0_349:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_349), 16, 16)) -> intp(0, 0, e)
cpu_intr_0_329:
	setx	0x42020e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_210:
	mov	0x4, %r14
	.word 0xf2f38e60  ! 4303: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_0_350:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_350), 16, 16)) -> intp(0, 0, c)
	.word 0xb7e5617b  ! 4306: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb5e5e18d  ! 4307: SAVE_I	save	%r23, 0x0001, %r26
iob_intr_0_351:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_351), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_352:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_352), 16, 16)) -> intp(0, 0, c)
T0_asi_reg_wr_211:
	mov	0x3c5, %r14
	.word 0xf8f389e0  ! 4314: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbde4e059  ! 4319: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_wr_212:
	mov	0x3c6, %r14
	.word 0xf4f38e40  ! 4323: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbbe5c000  ! 4325: SAVE_R	save	%r23, %r0, %r29
	.word 0xb3e50000  ! 4327: SAVE_R	save	%r20, %r0, %r25
iob_intr_0_353:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_353), 16, 16)) -> intp(0, 0, 8)
	.word 0xb1e4e10d  ! 4332: SAVE_I	save	%r19, 0x0001, %r24
iob_intr_0_354:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_354), 16, 16)) -> intp(0, 0, 21)
T0_asi_reg_wr_213:
	mov	0x27, %r14
	.word 0xfcf38e80  ! 4336: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb20de101  ! 4337: AND_I	and 	%r23, 0x0101, %r25
T0_asi_reg_wr_214:
	mov	0x10, %r14
	.word 0xfef38400  ! 4338: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_0_355:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_355), 16, 16)) -> intp(0, 0, 32)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3518000  ! 4344: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e5612c  ! 4345: SAVE_I	save	%r21, 0x0001, %r26
cpu_intr_0_330:
	setx	0x40032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_331:
	setx	0x43021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e40000  ! 4348: SAVE_R	save	%r16, %r0, %r26
	.word 0xbbe5e0bb  ! 4349: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb3e5e09f  ! 4350: SAVE_I	save	%r23, 0x0001, %r25
iob_intr_0_356:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_356), 16, 16)) -> intp(0, 0, 6)
	.word 0xb5e4e0bc  ! 4355: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbbe5e0b4  ! 4356: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb9e48000  ! 4359: SAVE_R	save	%r18, %r0, %r28
	.word 0x8195204c  ! 4361: WRPR_TPC_I	wrpr	%r20, 0x004c, %tpc
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_215:
	mov	0x2a, %r14
	.word 0xfef384a0  ! 4366: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_0_332:
	setx	0x420323, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_357:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_357), 16, 16)) -> intp(0, 0, 12)
cpu_intr_0_333:
	setx	0x410000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe34c000  ! 4371: SUBC_R	orn 	%r19, %r0, %r31
	.word 0xb9e48000  ! 4372: SAVE_R	save	%r18, %r0, %r28
T0_asi_reg_rd_178:
	mov	0x12, %r14
	.word 0xf4db8e80  ! 4374: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb9e5c000  ! 4375: SAVE_R	save	%r23, %r0, %r28
T0_asi_reg_rd_179:
	mov	0x3c8, %r14
	.word 0xfadb84a0  ! 4379: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb7e44000  ! 4380: SAVE_R	save	%r17, %r0, %r27
cpu_intr_0_334:
	setx	0x400123, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_180:
	mov	0x35, %r14
	.word 0xf8db89e0  ! 4386: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb1643801  ! 4391: MOVcc_I	<illegal instruction>
iob_intr_0_358:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_358), 16, 16)) -> intp(0, 0, 1d)
	.word 0x8d95211d  ! 4395: WRPR_PSTATE_I	wrpr	%r20, 0x011d, %pstate
iob_intr_0_359:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_359), 16, 16)) -> intp(0, 0, 34)
	.word 0xb7345000  ! 4400: SRLX_R	srlx	%r17, %r0, %r27
	.word 0xbde4e114  ! 4401: SAVE_I	save	%r19, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_360:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_360), 16, 16)) -> intp(0, 0, 4)
cpu_intr_0_335:
	setx	0x43011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe56096  ! 4407: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e56153  ! 4409: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_wr_216:
	mov	0x3, %r14
	.word 0xf0f38e80  ! 4411: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbbe4a05f  ! 4415: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb80c2021  ! 4418: AND_I	and 	%r16, 0x0021, %r28
T0_asi_reg_wr_217:
	mov	0x3c6, %r14
	.word 0xfaf38e60  ! 4422: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbde5600c  ! 4423: SAVE_I	save	%r21, 0x0001, %r30
iob_intr_0_361:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_361), 16, 16)) -> intp(0, 0, 9)
	.word 0xb9e48000  ! 4428: SAVE_R	save	%r18, %r0, %r28
	.word 0xbb3d1000  ! 4429: SRAX_R	srax	%r20, %r0, %r29
	.word 0xb844606a  ! 4433: ADDC_I	addc 	%r17, 0x006a, %r28
	.word 0xb8a42189  ! 4435: SUBcc_I	subcc 	%r16, 0x0189, %r28
	.word 0xb9e461be  ! 4436: SAVE_I	save	%r17, 0x0001, %r28
T0_asi_reg_rd_181:
	mov	0x23, %r14
	.word 0xf4db84a0  ! 4438: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbde560f0  ! 4440: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb9e54000  ! 4441: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_rd_182:
	mov	0xb, %r14
	.word 0xfcdb89e0  ! 4445: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb1e48000  ! 4446: SAVE_R	save	%r18, %r0, %r24
T0_asi_reg_wr_218:
	mov	0x27, %r14
	.word 0xf0f389e0  ! 4451: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_0_362:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_362), 16, 16)) -> intp(0, 0, 3)
cpu_intr_0_336:
	setx	0x400206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9504000  ! 4457: RDPR_TNPC	<illegal instruction>
cpu_intr_0_337:
	setx	0x420302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e50000  ! 4462: SAVE_R	save	%r20, %r0, %r28
cpu_intr_0_338:
	setx	0x420126, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_219:
	mov	0x14, %r14
	.word 0xf4f384a0  ! 4464: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_0_339:
	setx	0x430025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e079  ! 4467: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb3e54000  ! 4469: SAVE_R	save	%r21, %r0, %r25
iob_intr_0_363:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_363), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb1e5a0c4  ! 4473: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde4e0c5  ! 4474: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_rd_183:
	mov	0x3c0, %r14
	.word 0xf0db8e80  ! 4475: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T0_asi_reg_wr_220:
	mov	0x2e, %r14
	.word 0xf8f38e60  ! 4476: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb9e40000  ! 4479: SAVE_R	save	%r16, %r0, %r28
	.word 0xb08c20f4  ! 4480: ANDcc_I	andcc 	%r16, 0x00f4, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_364:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_364), 16, 16)) -> intp(0, 0, 0)
cpu_intr_0_340:
	setx	0x420217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5c000  ! 4488: SAVE_R	save	%r23, %r0, %r25
	.word 0xb1e42049  ! 4489: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbfe48000  ! 4496: SAVE_R	save	%r18, %r0, %r31
	.word 0xb3510000  ! 4498: RDPR_TICK	<illegal instruction>
	.word 0xbfe561b2  ! 4501: SAVE_I	save	%r21, 0x0001, %r31
iob_intr_0_365:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_365), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_rd_184:
	mov	0x3c8, %r14
	.word 0xfadb8e80  ! 4505: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb7e420bd  ! 4506: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbfe4a11c  ! 4510: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_wr_221:
	mov	0x3c4, %r14
	.word 0xf4f38e40  ! 4514: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb4054000  ! 4519: ADD_R	add 	%r21, %r0, %r26
iob_intr_0_366:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_366), 16, 16)) -> intp(0, 0, 0)
	.word 0xb1e4e158  ! 4525: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e42150  ! 4526: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb9e54000  ! 4529: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_wr_222:
	mov	0xe, %r14
	.word 0xfcf38400  ! 4531: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbd51c000  ! 4532: RDPR_TL	<illegal instruction>
iob_intr_0_367:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_367), 16, 16)) -> intp(0, 0, 21)
cpu_intr_0_341:
	setx	0x410114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e04b  ! 4537: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_wr_223:
	mov	0x2, %r14
	.word 0xf8f38e40  ! 4540: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb1e44000  ! 4542: SAVE_R	save	%r17, %r0, %r24
T0_asi_reg_rd_185:
	mov	0x3c6, %r14
	.word 0xfcdb8e40  ! 4544: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_wr_224:
	mov	0x29, %r14
	.word 0xf2f38e40  ! 4545: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_368:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_368), 16, 16)) -> intp(0, 0, 33)
cpu_intr_0_342:
	setx	0x41020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_343:
	setx	0x41003a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_344:
	setx	0x420334, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_225:
	mov	0x12, %r14
	.word 0xf4f38e40  ! 4559: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb1e4c000  ! 4561: SAVE_R	save	%r19, %r0, %r24
iob_intr_0_369:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_369), 16, 16)) -> intp(0, 0, e)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbcbd200d  ! 4567: XNORcc_I	xnorcc 	%r20, 0x000d, %r30
T0_asi_reg_wr_226:
	mov	0x19, %r14
	.word 0xf8f384a0  ! 4568: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb1e48000  ! 4570: SAVE_R	save	%r18, %r0, %r24
	.word 0xb20d4000  ! 4574: AND_R	and 	%r21, %r0, %r25
iob_intr_0_370:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_370), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb2c4c000  ! 4577: ADDCcc_R	addccc 	%r19, %r0, %r25
iob_intr_0_371:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_371), 16, 16)) -> intp(0, 0, 16)
	.word 0xb92c9000  ! 4581: SLLX_R	sllx	%r18, %r0, %r28
	.word 0xb5508000  ! 4582: RDPR_TSTATE	<illegal instruction>
cpu_intr_0_345:
	setx	0x450015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4219a  ! 4584: SAVE_I	save	%r16, 0x0001, %r26
T0_asi_reg_wr_227:
	mov	0x11, %r14
	.word 0xf6f389e0  ! 4585: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_0_346:
	setx	0x470331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb484e15f  ! 4587: ADDcc_I	addcc 	%r19, 0x015f, %r26
T0_asi_reg_rd_186:
	mov	0x3c3, %r14
	.word 0xf4db89e0  ! 4593: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb23560de  ! 4594: SUBC_I	orn 	%r21, 0x00de, %r25
	.word 0xb09c2189  ! 4596: XORcc_I	xorcc 	%r16, 0x0189, %r24
iob_intr_0_372:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_372), 16, 16)) -> intp(0, 0, 5)
	.word 0xb3e5c000  ! 4601: SAVE_R	save	%r23, %r0, %r25
T0_asi_reg_wr_228:
	mov	0x22, %r14
	.word 0xfcf38e60  ! 4603: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb5e520cd  ! 4604: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb1504000  ! 4605: RDPR_TNPC	<illegal instruction>
T0_asi_reg_rd_187:
	mov	0x27, %r14
	.word 0xf4db8e40  ! 4607: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_0_347:
	setx	0x470033, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_229:
	mov	0xf, %r14
	.word 0xf4f389e0  ! 4612: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb3e5e1b5  ! 4613: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb9e58000  ! 4614: SAVE_R	save	%r22, %r0, %r28
	.word 0xb2248000  ! 4616: SUB_R	sub 	%r18, %r0, %r25
	.word 0xb73d2001  ! 4622: SRA_I	sra 	%r20, 0x0001, %r27
	.word 0xb1e58000  ! 4623: SAVE_R	save	%r22, %r0, %r24
	.word 0xb3e44000  ! 4624: SAVE_R	save	%r17, %r0, %r25
iob_intr_0_373:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_373), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb73db001  ! 4629: SRAX_I	srax	%r22, 0x0001, %r27
T0_asi_reg_wr_230:
	mov	0x25, %r14
	.word 0xf2f38e60  ! 4630: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T0_asi_reg_rd_188:
	mov	0x3c8, %r14
	.word 0xf8db84a0  ! 4631: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T0_asi_reg_rd_189:
	mov	0x1f, %r14
	.word 0xfedb84a0  ! 4636: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T0_asi_reg_wr_231:
	mov	0x3c4, %r14
	.word 0xf4f38e40  ! 4637: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb0152130  ! 4639: OR_I	or 	%r20, 0x0130, %r24
iob_intr_0_374:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_374), 16, 16)) -> intp(0, 0, 39)
	.word 0xb9e421ff  ! 4643: SAVE_I	save	%r16, 0x0001, %r28
cpu_intr_0_348:
	setx	0x440332, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_349:
	setx	0x44012f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_375:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_375), 16, 16)) -> intp(0, 0, 11)
cpu_intr_0_350:
	setx	0x47013c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_376:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_376), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_rd_190:
	mov	0x10, %r14
	.word 0xfadb8e60  ! 4654: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_0_351:
	setx	0x440302, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_352:
	setx	0x450134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba1d6035  ! 4659: XOR_I	xor 	%r21, 0x0035, %r29
	.word 0xb9e54000  ! 4660: SAVE_R	save	%r21, %r0, %r28
iob_intr_0_377:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_377), 16, 16)) -> intp(0, 0, 29)
	.word 0xb33cc000  ! 4662: SRA_R	sra 	%r19, %r0, %r25
iob_intr_0_378:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_378), 16, 16)) -> intp(0, 0, 23)
	.word 0xb7504000  ! 4664: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_353:
	setx	0x450217, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_191:
	mov	0x8, %r14
	.word 0xfedb84a0  ! 4673: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbead0000  ! 4674: ANDNcc_R	andncc 	%r20, %r0, %r31
iob_intr_0_379:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_379), 16, 16)) -> intp(0, 0, 1f)
iob_intr_0_380:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_380), 16, 16)) -> intp(0, 0, 3a)
	.word 0xbb3c3001  ! 4678: SRAX_I	srax	%r16, 0x0001, %r29
T0_asi_reg_wr_232:
	mov	0x13, %r14
	.word 0xf4f384a0  ! 4680: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T0_asi_reg_rd_192:
	mov	0x22, %r14
	.word 0xfadb8400  ! 4684: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_0_354:
	setx	0x440021, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e54000  ! 4692: SAVE_R	save	%r21, %r0, %r26
	.word 0xb43c0000  ! 4693: XNOR_R	xnor 	%r16, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfe58000  ! 4696: SAVE_R	save	%r22, %r0, %r31
cpu_intr_0_355:
	setx	0x470325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc944000  ! 4698: ORcc_R	orcc 	%r17, %r0, %r30
T0_asi_reg_rd_193:
	mov	0x3c5, %r14
	.word 0xf0db8e60  ! 4703: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb7e54000  ! 4704: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_rd_194:
	mov	0x1e, %r14
	.word 0xf2db8e40  ! 4706: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T0_asi_reg_wr_233:
	mov	0x25, %r14
	.word 0xf8f38e40  ! 4707: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb3e5a109  ! 4713: SAVE_I	save	%r22, 0x0001, %r25
iob_intr_0_381:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_381), 16, 16)) -> intp(0, 0, 38)
	.word 0xbfe52092  ! 4715: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_382:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_382), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbbe50000  ! 4717: SAVE_R	save	%r20, %r0, %r29
	.word 0xbde5e1fa  ! 4719: SAVE_I	save	%r23, 0x0001, %r30
iob_intr_0_383:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_383), 16, 16)) -> intp(0, 0, a)
iob_intr_0_384:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_384), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_385:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_385), 16, 16)) -> intp(0, 0, 29)
	.word 0xbbe46138  ! 4727: SAVE_I	save	%r17, 0x0001, %r29
T0_asi_reg_rd_195:
	mov	0x3c3, %r14
	.word 0xfcdb8e40  ! 4730: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb214e1c1  ! 4731: OR_I	or 	%r19, 0x01c1, %r25
cpu_intr_0_356:
	setx	0x470138, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_357:
	setx	0x46033d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_386:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_386), 16, 16)) -> intp(0, 0, 37)
T0_asi_reg_wr_234:
	mov	0x3c2, %r14
	.word 0xf6f389e0  ! 4737: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb7e42028  ! 4738: SAVE_I	save	%r16, 0x0001, %r27
T0_asi_reg_rd_196:
	mov	0x3c4, %r14
	.word 0xfadb8e40  ! 4740: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_wr_235:
	mov	0x33, %r14
	.word 0xfef389e0  ! 4741: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb5e5c000  ! 4743: SAVE_R	save	%r23, %r0, %r26
	.word 0xbbe4e1b1  ! 4744: SAVE_I	save	%r19, 0x0001, %r29
iob_intr_0_387:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_387), 16, 16)) -> intp(0, 0, a)
T0_asi_reg_rd_197:
	mov	0x0, %r14
	.word 0xf0db8e40  ! 4747: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_388:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_388), 16, 16)) -> intp(0, 0, 9)
	.word 0xbbe48000  ! 4749: SAVE_R	save	%r18, %r0, %r29
	.word 0xb1e5215e  ! 4750: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb3e48000  ! 4751: SAVE_R	save	%r18, %r0, %r25
	.word 0xb1e44000  ! 4752: SAVE_R	save	%r17, %r0, %r24
	.word 0xb5e50000  ! 4755: SAVE_R	save	%r20, %r0, %r26
iob_intr_0_389:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_389), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb8c40000  ! 4761: ADDCcc_R	addccc 	%r16, %r0, %r28
cpu_intr_0_358:
	setx	0x47002f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_390:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_390), 16, 16)) -> intp(0, 0, 26)
iob_intr_0_391:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_391), 16, 16)) -> intp(0, 0, 26)
	.word 0xbfe5201c  ! 4766: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb3e42061  ! 4767: SAVE_I	save	%r16, 0x0001, %r25
iob_intr_0_392:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_392), 16, 16)) -> intp(0, 0, 31)
T0_asi_reg_wr_236:
	mov	0x3c6, %r14
	.word 0xf8f38e60  ! 4771: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb3e44000  ! 4774: SAVE_R	save	%r17, %r0, %r25
	.word 0xbb3c5000  ! 4779: SRAX_R	srax	%r17, %r0, %r29
	.word 0xbfe50000  ! 4783: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_359:
	setx	0x470332, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_237:
	mov	0x1e, %r14
	.word 0xf0f38e40  ! 4789: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_0_393:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_393), 16, 16)) -> intp(0, 0, 18)
	.word 0xbfe5c000  ! 4794: SAVE_R	save	%r23, %r0, %r31
cpu_intr_0_360:
	setx	0x470323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5c000  ! 4799: SAVE_R	save	%r23, %r0, %r25
cpu_intr_0_361:
	setx	0x21f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e56097  ! 4804: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb5e4c000  ! 4805: SAVE_R	save	%r19, %r0, %r26
	.word 0xbde48000  ! 4806: SAVE_R	save	%r18, %r0, %r30
cpu_intr_0_362:
	setx	0x44013c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_363:
	setx	0x450322, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_238:
	mov	0x3c5, %r14
	.word 0xfcf38e40  ! 4815: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_364:
	setx	0x450005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e48000  ! 4818: SAVE_R	save	%r18, %r0, %r25
cpu_intr_0_365:
	setx	0x450030, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_394:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_394), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_366:
	setx	0x450121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e48000  ! 4832: SAVE_R	save	%r18, %r0, %r26
cpu_intr_0_367:
	setx	0x44021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5c000  ! 4834: SAVE_R	save	%r23, %r0, %r26
	.word 0xb3e50000  ! 4842: SAVE_R	save	%r20, %r0, %r25
cpu_intr_0_368:
	setx	0x47000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5c000  ! 4844: SAVE_R	save	%r23, %r0, %r26
cpu_intr_0_369:
	setx	0x47032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a18f  ! 4848: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e4a0e4  ! 4849: SAVE_I	save	%r18, 0x0001, %r24
T0_asi_reg_wr_239:
	mov	0x4, %r14
	.word 0xf2f38e80  ! 4851: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb1e5a029  ! 4852: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e50000  ! 4853: SAVE_R	save	%r20, %r0, %r26
cpu_intr_0_370:
	setx	0x470331, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_395:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_395), 16, 16)) -> intp(0, 0, 3)
	.word 0xb5e560c6  ! 4859: SAVE_I	save	%r21, 0x0001, %r26
cpu_intr_0_371:
	setx	0x450315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e40000  ! 4864: SAVE_R	save	%r16, %r0, %r25
	.word 0xb92d8000  ! 4866: SLL_R	sll 	%r22, %r0, %r28
	.word 0xbde5e043  ! 4867: SAVE_I	save	%r23, 0x0001, %r30
T0_asi_reg_rd_198:
	mov	0x3c0, %r14
	.word 0xfcdb8400  ! 4869: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T0_asi_reg_rd_199:
	mov	0x14, %r14
	.word 0xfedb8e40  ! 4871: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_0_396:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_396), 16, 16)) -> intp(0, 0, 7)
	.word 0xb93c7001  ! 4874: SRAX_I	srax	%r17, 0x0001, %r28
iob_intr_0_397:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_397), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_rd_200:
	mov	0x3c2, %r14
	.word 0xf2db89e0  ! 4877: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_0_398:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_398), 16, 16)) -> intp(0, 0, 32)
	.word 0xb9e4a1d9  ! 4883: SAVE_I	save	%r18, 0x0001, %r28
iob_intr_0_399:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_399), 16, 16)) -> intp(0, 0, 2c)
cpu_intr_0_372:
	setx	0x46012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a093  ! 4888: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbbe421c3  ! 4889: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_400:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_400), 16, 16)) -> intp(0, 0, 32)
T0_asi_reg_wr_240:
	mov	0x18, %r14
	.word 0xf2f389e0  ! 4892: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb3e50000  ! 4894: SAVE_R	save	%r20, %r0, %r25
	.word 0xb1e4e1ab  ! 4896: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_rd_201:
	mov	0x3c3, %r14
	.word 0xfadb84a0  ! 4897: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb605c000  ! 4900: ADD_R	add 	%r23, %r0, %r27
iob_intr_0_401:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_401), 16, 16)) -> intp(0, 0, e)
	.word 0xb5e4a162  ! 4906: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbde5c000  ! 4907: SAVE_R	save	%r23, %r0, %r30
	.word 0xb3e5e0b5  ! 4910: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb1e56177  ! 4915: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb4c50000  ! 4916: ADDCcc_R	addccc 	%r20, %r0, %r26
T0_asi_reg_wr_241:
	mov	0x28, %r14
	.word 0xfef384a0  ! 4917: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xbf3c8000  ! 4921: SRA_R	sra 	%r18, %r0, %r31
	.word 0xb5343001  ! 4925: SRLX_I	srlx	%r16, 0x0001, %r26
iob_intr_0_402:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_402), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_wr_242:
	mov	0x9, %r14
	.word 0xf2f38e60  ! 4927: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_0_403:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_403), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb3e4c000  ! 4930: SAVE_R	save	%r19, %r0, %r25
T0_asi_reg_rd_202:
	mov	0x35, %r14
	.word 0xf2db8e40  ! 4932: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_373:
	setx	0x44012f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_203:
	mov	0x4, %r14
	.word 0xfadb89e0  ! 4937: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_0_404:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_404), 16, 16)) -> intp(0, 0, 7)
	.word 0xb9e46037  ! 4946: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb1e40000  ! 4947: SAVE_R	save	%r16, %r0, %r24
	.word 0xbb641800  ! 4950: MOVcc_R	<illegal instruction>
	.word 0xb9e54000  ! 4951: SAVE_R	save	%r21, %r0, %r28
cpu_intr_0_374:
	setx	0x450101, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_204:
	mov	0x14, %r14
	.word 0xf4db8e80  ! 4955: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T0_asi_reg_rd_205:
	mov	0xd, %r14
	.word 0xf8db89e0  ! 4956: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T0_asi_reg_rd_206:
	mov	0x25, %r14
	.word 0xfedb84a0  ! 4957: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb1e5e17a  ! 4960: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbde560d9  ! 4961: SAVE_I	save	%r21, 0x0001, %r30
iob_intr_0_405:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_405), 16, 16)) -> intp(0, 0, 35)
	.word 0xbde52159  ! 4970: SAVE_I	save	%r20, 0x0001, %r30
iob_intr_0_406:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_406), 16, 16)) -> intp(0, 0, 4)
	.word 0xb1e4e07c  ! 4972: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb9e4a1ba  ! 4974: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb5e4e15b  ! 4975: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_rd_207:
	mov	0x3c4, %r14
	.word 0xf2db8400  ! 4978: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb3e4a000  ! 4980: SAVE_I	save	%r18, 0x0001, %r25
iob_intr_0_407:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_407), 16, 16)) -> intp(0, 0, 22)
	.word 0xbde58000  ! 4985: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_375:
	setx	0x440328, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_376:
	setx	0x46030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe58000  ! 4998: SAVE_R	save	%r22, %r0, %r29
iob_intr_0_408:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_408), 16, 16)) -> intp(0, 0, 29)
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
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982e8a  ! 2: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8a, %hpstate
cpu_intr_3_0:
	setx	0x1b020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982eda  ! 9: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0eda, %hpstate
iob_intr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_0), 16, 16)) -> intp(3, 0, 1)
cpu_intr_3_1:
	setx	0x1c0220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8746033  ! 14: STX_I	stx	%r28, [%r17 + 0x0033]
T3_asi_reg_wr_0:
	mov	0x24, %r14
	.word 0xfef389e0  ! 15: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_1), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_rd_0:
	mov	0x15, %r14
	.word 0xfadb8e80  ! 17: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T3_asi_reg_wr_1:
	mov	0x28, %r14
	.word 0xfef38e80  ! 18: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xfab4e15c  ! 19: STHA_I	stha	%r29, [%r19 + 0x015c] %asi
iob_intr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_2), 16, 16)) -> intp(3, 0, 28)
	.word 0xf6344000  ! 23: STH_R	sth	%r27, [%r17 + %r0]
T3_asi_reg_wr_2:
	mov	0x3c3, %r14
	.word 0xfef38e80  ! 26: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T3_asi_reg_wr_3:
	mov	0x37, %r14
	.word 0xfef389e0  ! 27: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_3_2:
	setx	0x1d0133, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_3), 16, 16)) -> intp(3, 0, e)
	ta	T_CHANGE_TO_TL1
	.word 0xfca44020  ! 35: STWA_R	stwa	%r30, [%r17 + %r0] 0x01
iob_intr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_4), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_3:
	setx	0x1c021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa348000  ! 40: STH_R	sth	%r29, [%r18 + %r0]
iob_intr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_5), 16, 16)) -> intp(3, 0, f)
	.word 0xbb34c000  ! 44: SRL_R	srl 	%r19, %r0, %r29
	.word 0xf6a4e189  ! 49: STWA_I	stwa	%r27, [%r19 + 0x0189] %asi
iob_intr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_6), 16, 16)) -> intp(3, 0, 25)
	.word 0xf6b44020  ! 51: STHA_R	stha	%r27, [%r17 + %r0] 0x01
	.word 0x8d95a0ec  ! 53: WRPR_PSTATE_I	wrpr	%r22, 0x00ec, %pstate
	.word 0xfc350000  ! 54: STH_R	sth	%r30, [%r20 + %r0]
iob_intr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_7), 16, 16)) -> intp(3, 0, 32)
	.word 0xfcace0dc  ! 56: STBA_I	stba	%r30, [%r19 + 0x00dc] %asi
iob_intr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_8), 16, 16)) -> intp(3, 0, c)
cpu_intr_3_4:
	setx	0x1f013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2348000  ! 64: STH_R	sth	%r25, [%r18 + %r0]
	.word 0xfca4c020  ! 65: STWA_R	stwa	%r30, [%r19 + %r0] 0x01
cpu_intr_3_5:
	setx	0x1d0317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc74e1a9  ! 70: STX_I	stx	%r30, [%r19 + 0x01a9]
iob_intr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_9), 16, 16)) -> intp(3, 0, 1)
T3_asi_reg_rd_1:
	mov	0x2f, %r14
	.word 0xf2db8e40  ! 72: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbca54000  ! 74: SUBcc_R	subcc 	%r21, %r0, %r30
	.word 0xfc25c000  ! 75: STW_R	stw	%r30, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0xf2744000  ! 78: STX_R	stx	%r25, [%r17 + %r0]
T3_asi_reg_rd_2:
	mov	0x3c0, %r14
	.word 0xf2db8e40  ! 80: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb09d6190  ! 81: XORcc_I	xorcc 	%r21, 0x0190, %r24
	.word 0xf234a01d  ! 82: STH_I	sth	%r25, [%r18 + 0x001d]
cpu_intr_3_6:
	setx	0x1e0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb68de0a9  ! 84: ANDcc_I	andcc 	%r23, 0x00a9, %r27
	.word 0xfc24e09d  ! 88: STW_I	stw	%r30, [%r19 + 0x009d]
iob_intr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_10), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf22c21b6  ! 90: STB_I	stb	%r25, [%r16 + 0x01b6]
T3_asi_reg_wr_4:
	mov	0x3, %r14
	.word 0xf0f38e80  ! 92: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_11), 16, 16)) -> intp(3, 0, 28)
iob_intr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_12), 16, 16)) -> intp(3, 0, 19)
	.word 0xf8ada101  ! 99: STBA_I	stba	%r28, [%r22 + 0x0101] %asi
	.word 0xf2b4603b  ! 101: STHA_I	stha	%r25, [%r17 + 0x003b] %asi
	.word 0xf6f56035  ! 103: STXA_I	stxa	%r27, [%r21 + 0x0035] %asi
cpu_intr_3_7:
	setx	0x1c033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba154000  ! 106: OR_R	or 	%r21, %r0, %r29
	.word 0xf82c6155  ! 109: STB_I	stb	%r28, [%r17 + 0x0155]
cpu_intr_3_8:
	setx	0x1e000c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_9:
	setx	0x1f0224, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_10:
	setx	0x1f0214, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_11:
	setx	0x1e0101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4150000  ! 121: OR_R	or 	%r20, %r0, %r26
iob_intr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_13), 16, 16)) -> intp(3, 0, 7)
cpu_intr_3_12:
	setx	0x1d0112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2d20c8  ! 125: STB_I	stb	%r29, [%r20 + 0x00c8]
iob_intr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_14), 16, 16)) -> intp(3, 0, 8)
	.word 0xbc9461a3  ! 130: ORcc_I	orcc 	%r17, 0x01a3, %r30
	.word 0xf8344000  ! 133: STH_R	sth	%r28, [%r17 + %r0]
T3_asi_reg_wr_5:
	mov	0x24, %r14
	.word 0xf0f38e40  ! 134: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL0
	.word 0xf2758000  ! 145: STX_R	stx	%r25, [%r22 + %r0]
	.word 0xfeb50020  ! 146: STHA_R	stha	%r31, [%r20 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb2c4e1b1  ! 149: ADDCcc_I	addccc 	%r19, 0x01b1, %r25
cpu_intr_3_13:
	setx	0x1c0138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82c600c  ! 151: STB_I	stb	%r28, [%r17 + 0x000c]
iob_intr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_15), 16, 16)) -> intp(3, 0, 31)
	.word 0xf074c000  ! 155: STX_R	stx	%r24, [%r19 + %r0]
T3_asi_reg_wr_6:
	mov	0x3c7, %r14
	.word 0xf6f384a0  ! 158: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xfa2d607e  ! 159: STB_I	stb	%r29, [%r21 + 0x007e]
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x819829c2  ! 160: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c2, %hpstate
iob_intr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_16), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_rd_3:
	mov	0x38, %r14
	.word 0xfadb8400  ! 163: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xfeada1eb  ! 164: STBA_I	stba	%r31, [%r22 + 0x01eb] %asi
	.word 0xf02521cf  ! 167: STW_I	stw	%r24, [%r20 + 0x01cf]
	.word 0xfaa58020  ! 168: STWA_R	stwa	%r29, [%r22 + %r0] 0x01
iob_intr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_17), 16, 16)) -> intp(3, 0, 37)
	.word 0xf675c000  ! 173: STX_R	stx	%r27, [%r23 + %r0]
	.word 0xf875e0f0  ! 174: STX_I	stx	%r28, [%r23 + 0x00f0]
	.word 0xf4a50020  ! 175: STWA_R	stwa	%r26, [%r20 + %r0] 0x01
	.word 0xf875a190  ! 180: STX_I	stx	%r28, [%r22 + 0x0190]
	.word 0xf0354000  ! 181: STH_R	sth	%r24, [%r21 + %r0]
	.word 0xf8a521d3  ! 182: STWA_I	stwa	%r28, [%r20 + 0x01d3] %asi
cpu_intr_3_14:
	setx	0x1d0317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2744000  ! 185: STX_R	stx	%r25, [%r17 + %r0]
	.word 0xfef4a132  ! 186: STXA_I	stxa	%r31, [%r18 + 0x0132] %asi
	.word 0xf675a05b  ! 187: STX_I	stx	%r27, [%r22 + 0x005b]
	.word 0xf4a520fd  ! 189: STWA_I	stwa	%r26, [%r20 + 0x00fd] %asi
	.word 0xf0a46066  ! 191: STWA_I	stwa	%r24, [%r17 + 0x0066] %asi
T3_asi_reg_wr_7:
	mov	0x3c7, %r14
	.word 0xf2f389e0  ! 194: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf2b54020  ! 195: STHA_R	stha	%r25, [%r21 + %r0] 0x01
iob_intr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_18), 16, 16)) -> intp(3, 0, 26)
	.word 0xbb3c3001  ! 197: SRAX_I	srax	%r16, 0x0001, %r29
cpu_intr_3_15:
	setx	0x1f0124, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_16:
	setx	0x1c0309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa344000  ! 201: STH_R	sth	%r29, [%r17 + %r0]
cpu_intr_3_17:
	setx	0x1e0315, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_19), 16, 16)) -> intp(3, 0, 12)
	.word 0xf4f4e1f7  ! 211: STXA_I	stxa	%r26, [%r19 + 0x01f7] %asi
iob_intr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_20), 16, 16)) -> intp(3, 0, 27)
	ta	T_CHANGE_TO_TL0
cpu_intr_3_18:
	setx	0x1c0337, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_19:
	setx	0x1f031c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_21), 16, 16)) -> intp(3, 0, 2c)
iob_intr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_22), 16, 16)) -> intp(3, 0, 22)
	.word 0xb2acc000  ! 225: ANDNcc_R	andncc 	%r19, %r0, %r25
T3_asi_reg_wr_8:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 227: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbe35c000  ! 230: SUBC_R	orn 	%r23, %r0, %r31
cpu_intr_3_20:
	setx	0x1f0133, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_4:
	mov	0x3c0, %r14
	.word 0xfadb89e0  ! 233: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_23), 16, 16)) -> intp(3, 0, 17)
	.word 0xb08461b8  ! 236: ADDcc_I	addcc 	%r17, 0x01b8, %r24
T3_asi_reg_wr_9:
	mov	0x2f, %r14
	.word 0xfef389e0  ! 237: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_3_21:
	setx	0x1c0031, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_24), 16, 16)) -> intp(3, 0, 18)
iob_intr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_25), 16, 16)) -> intp(3, 0, 1f)
	.word 0xfeb5a105  ! 243: STHA_I	stha	%r31, [%r22 + 0x0105] %asi
	.word 0xf8a4a0de  ! 244: STWA_I	stwa	%r28, [%r18 + 0x00de] %asi
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
	.word 0xf2252036  ! 249: STW_I	stw	%r25, [%r20 + 0x0036]
	ta	T_CHANGE_TO_TL1
iob_intr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_26), 16, 16)) -> intp(3, 0, 20)
T3_asi_reg_rd_5:
	mov	0xa, %r14
	.word 0xf6db8e80  ! 257: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_3_22:
	setx	0x1c0025, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_10:
	mov	0x9, %r14
	.word 0xfcf389e0  ! 266: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf4ade174  ! 268: STBA_I	stba	%r26, [%r23 + 0x0174] %asi
	.word 0xf2350000  ! 271: STH_R	sth	%r25, [%r20 + %r0]
T3_asi_reg_rd_6:
	mov	0x9, %r14
	.word 0xfedb8e80  ! 275: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf2ace129  ! 277: STBA_I	stba	%r25, [%r19 + 0x0129] %asi
iob_intr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_27), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_28), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf8a44020  ! 281: STWA_R	stwa	%r28, [%r17 + %r0] 0x01
T3_asi_reg_wr_11:
	mov	0x17, %r14
	.word 0xfcf38400  ! 282: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_3_23:
	setx	0x10334, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_29), 16, 16)) -> intp(3, 0, 1b)
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983818  ! 292: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1818, %hpstate
	.word 0xf6254000  ! 293: STW_R	stw	%r27, [%r21 + %r0]
	.word 0xfc254000  ! 299: STW_R	stw	%r30, [%r21 + %r0]
	.word 0xfaa50020  ! 300: STWA_R	stwa	%r29, [%r20 + %r0] 0x01
	.word 0xf67460b5  ! 301: STX_I	stx	%r27, [%r17 + 0x00b5]
T3_asi_reg_wr_12:
	mov	0x3c8, %r14
	.word 0xf4f38e60  ! 309: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xfeb44020  ! 311: STHA_R	stha	%r31, [%r17 + %r0] 0x01
T3_asi_reg_wr_13:
	mov	0x20, %r14
	.word 0xfef38400  ! 312: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T3_asi_reg_wr_14:
	mov	0x1f, %r14
	.word 0xf4f38e40  ! 315: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
iob_intr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_30), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf8ada057  ! 330: STBA_I	stba	%r28, [%r22 + 0x0057] %asi
	ta	T_CHANGE_TO_TL1
	.word 0xf2ad0020  ! 334: STBA_R	stba	%r25, [%r20 + %r0] 0x01
	.word 0xf6740000  ! 335: STX_R	stx	%r27, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf42dc000  ! 343: STB_R	stb	%r26, [%r23 + %r0]
iob_intr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_31), 16, 16)) -> intp(3, 0, 35)
	.word 0xf824e030  ! 347: STW_I	stw	%r28, [%r19 + 0x0030]
iob_intr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_32), 16, 16)) -> intp(3, 0, 25)
T3_asi_reg_rd_7:
	mov	0x7, %r14
	.word 0xfedb8400  ! 351: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xfeace07f  ! 356: STBA_I	stba	%r31, [%r19 + 0x007f] %asi
	.word 0xf0244000  ! 369: STW_R	stw	%r24, [%r17 + %r0]
	.word 0xf62c8000  ! 370: STB_R	stb	%r27, [%r18 + %r0]
cpu_intr_3_24:
	setx	0x1e0333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcacc020  ! 373: STBA_R	stba	%r30, [%r19 + %r0] 0x01
	.word 0xf034a021  ! 375: STH_I	sth	%r24, [%r18 + 0x0021]
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983908  ! 378: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1908, %hpstate
	.word 0xfca42073  ! 380: STWA_I	stwa	%r30, [%r16 + 0x0073] %asi
iob_intr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_33), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_rd_8:
	mov	0xe, %r14
	.word 0xf6db8e40  ! 382: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_34), 16, 16)) -> intp(3, 0, c)
	.word 0xb8a4616a  ! 385: SUBcc_I	subcc 	%r17, 0x016a, %r28
T3_asi_reg_rd_9:
	mov	0x23, %r14
	.word 0xf6db8e80  ! 386: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf4a4e1a0  ! 389: STWA_I	stwa	%r26, [%r19 + 0x01a0] %asi
	ta	T_CHANGE_TO_TL0
	.word 0xf4750000  ! 392: STX_R	stx	%r26, [%r20 + %r0]
	.word 0xba14e043  ! 395: OR_I	or 	%r19, 0x0043, %r29
	.word 0xf2b5e1c4  ! 397: STHA_I	stha	%r25, [%r23 + 0x01c4] %asi
	.word 0xf834e0f4  ! 398: STH_I	sth	%r28, [%r19 + 0x00f4]
iob_intr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_35), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf6f5a193  ! 406: STXA_I	stxa	%r27, [%r22 + 0x0193] %asi
T3_asi_reg_wr_15:
	mov	0x28, %r14
	.word 0xf4f38400  ! 407: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf62c60a0  ! 408: STB_I	stb	%r27, [%r17 + 0x00a0]
T3_asi_reg_rd_10:
	mov	0x15, %r14
	.word 0xf8db8400  ! 410: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_36), 16, 16)) -> intp(3, 0, 33)
T3_asi_reg_rd_11:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 413: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_3_25:
	setx	0x1e0214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb644c000  ! 417: ADDC_R	addc 	%r19, %r0, %r27
cpu_intr_3_26:
	setx	0x1d023d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_37), 16, 16)) -> intp(3, 0, 24)
	.word 0xf8ad2047  ! 422: STBA_I	stba	%r28, [%r20 + 0x0047] %asi
cpu_intr_3_27:
	setx	0x1f011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2248000  ! 425: STW_R	stw	%r25, [%r18 + %r0]
cpu_intr_3_28:
	setx	0x1f0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a5a120  ! 427: STWA_I	stwa	%r28, [%r22 + 0x0120] %asi
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_38), 16, 16)) -> intp(3, 0, 28)
cpu_intr_3_29:
	setx	0x1c0236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc750000  ! 433: STX_R	stx	%r30, [%r20 + %r0]
T3_asi_reg_rd_12:
	mov	0x3c7, %r14
	.word 0xfadb8e80  ! 435: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xbec5607e  ! 438: ADDCcc_I	addccc 	%r21, 0x007e, %r31
cpu_intr_3_30:
	setx	0x1e0026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe25601b  ! 440: STW_I	stw	%r31, [%r21 + 0x001b]
	.word 0xf4a5e0d1  ! 441: STWA_I	stwa	%r26, [%r23 + 0x00d1] %asi
	.word 0xb8356141  ! 443: ORN_I	orn 	%r21, 0x0141, %r28
T3_asi_reg_rd_13:
	mov	0x21, %r14
	.word 0xf2db8400  ! 444: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf4ad0020  ! 445: STBA_R	stba	%r26, [%r20 + %r0] 0x01
	.word 0xf034a1a4  ! 447: STH_I	sth	%r24, [%r18 + 0x01a4]
iob_intr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_39), 16, 16)) -> intp(3, 0, 2)
	.word 0xf6352021  ! 451: STH_I	sth	%r27, [%r20 + 0x0021]
	.word 0xfaa4c020  ! 452: STWA_R	stwa	%r29, [%r19 + %r0] 0x01
cpu_intr_3_31:
	setx	0x135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ac0020  ! 454: STBA_R	stba	%r26, [%r16 + %r0] 0x01
T3_asi_reg_wr_16:
	mov	0x3c7, %r14
	.word 0xf2f38e40  ! 456: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfa2d2196  ! 457: STB_I	stb	%r29, [%r20 + 0x0196]
	.word 0xf825e10e  ! 458: STW_I	stw	%r28, [%r23 + 0x010e]
	.word 0xb3341000  ! 461: SRLX_R	srlx	%r16, %r0, %r25
cpu_intr_3_32:
	setx	0x1d002c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_33:
	setx	0x1e013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xa1902002  ! 464: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	ta	T_CHANGE_TO_TL1
iob_intr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_40), 16, 16)) -> intp(3, 0, 5)
T3_asi_reg_wr_17:
	mov	0x20, %r14
	.word 0xfcf38400  ! 469: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_3_34:
	setx	0x1d0015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6346022  ! 473: STH_I	sth	%r27, [%r17 + 0x0022]
T3_asi_reg_rd_14:
	mov	0x23, %r14
	.word 0xfedb8e60  ! 475: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T3_asi_reg_rd_15:
	mov	0x21, %r14
	.word 0xf8db84a0  ! 483: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	ta	T_CHANGE_HPRIV
cpu_intr_3_35:
	setx	0x210006, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_18:
	mov	0x35, %r14
	.word 0xfef38e40  ! 489: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_3_36:
	setx	0x200019, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_37:
	setx	0x230233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfef5206c  ! 492: STXA_I	stxa	%r31, [%r20 + 0x006c] %asi
	.word 0xf4b460c4  ! 497: STHA_I	stha	%r26, [%r17 + 0x00c4] %asi
	.word 0xb2a48000  ! 501: SUBcc_R	subcc 	%r18, %r0, %r25
	.word 0xf4b4e04e  ! 502: STHA_I	stha	%r26, [%r19 + 0x004e] %asi
cpu_intr_3_38:
	setx	0x200127, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_41), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf4a4a082  ! 507: STWA_I	stwa	%r26, [%r18 + 0x0082] %asi
	.word 0xf4b58020  ! 508: STHA_R	stha	%r26, [%r22 + %r0] 0x01
T3_asi_reg_rd_16:
	mov	0x13, %r14
	.word 0xf2db89e0  ! 510: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_42), 16, 16)) -> intp(3, 0, 21)
	.word 0xf874e1bd  ! 512: STX_I	stx	%r28, [%r19 + 0x01bd]
	.word 0xf2f5e0da  ! 518: STXA_I	stxa	%r25, [%r23 + 0x00da] %asi
	ta	T_CHANGE_HPRIV
iob_intr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_43), 16, 16)) -> intp(3, 0, 2)
	.word 0xfa24e01c  ! 524: STW_I	stw	%r29, [%r19 + 0x001c]
	.word 0xf8b4a0a5  ! 525: STHA_I	stha	%r28, [%r18 + 0x00a5] %asi
cpu_intr_3_39:
	setx	0x220233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a44020  ! 529: STWA_R	stwa	%r27, [%r17 + %r0] 0x01
iob_intr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_44), 16, 16)) -> intp(3, 0, d)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb60c8000  ! 532: AND_R	and 	%r18, %r0, %r27
	.word 0xfc2d0000  ! 535: STB_R	stb	%r30, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_45), 16, 16)) -> intp(3, 0, 15)
cpu_intr_3_40:
	setx	0x23020b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_17:
	mov	0x22, %r14
	.word 0xf4db89e0  ! 542: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf0744000  ! 544: STX_R	stx	%r24, [%r17 + %r0]
cpu_intr_3_41:
	setx	0x22003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcf4a0f0  ! 548: STXA_I	stxa	%r30, [%r18 + 0x00f0] %asi
iob_intr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_46), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf274e166  ! 555: STX_I	stx	%r25, [%r19 + 0x0166]
	.word 0xfea4c020  ! 562: STWA_R	stwa	%r31, [%r19 + %r0] 0x01
T3_asi_reg_rd_18:
	mov	0x3c7, %r14
	.word 0xf4db8e40  ! 563: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfa24c000  ! 572: STW_R	stw	%r29, [%r19 + %r0]
iob_intr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_47), 16, 16)) -> intp(3, 0, 35)
T3_asi_reg_rd_19:
	mov	0x3c0, %r14
	.word 0xfcdb8e60  ! 575: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_3_42:
	setx	0x21003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf675e1eb  ! 579: STX_I	stx	%r27, [%r23 + 0x01eb]
T3_asi_reg_rd_20:
	mov	0x30, %r14
	.word 0xf2db8e40  ! 580: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf274c000  ! 582: STX_R	stx	%r25, [%r19 + %r0]
	.word 0xb4440000  ! 583: ADDC_R	addc 	%r16, %r0, %r26
T3_asi_reg_wr_19:
	mov	0x31, %r14
	.word 0xfaf389e0  ! 584: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T3_asi_reg_wr_20:
	mov	0x13, %r14
	.word 0xfef389e0  ! 588: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf4a5a194  ! 589: STWA_I	stwa	%r26, [%r22 + 0x0194] %asi
	.word 0xb88d6155  ! 592: ANDcc_I	andcc 	%r21, 0x0155, %r28
	.word 0xbc1d0000  ! 594: XOR_R	xor 	%r20, %r0, %r30
cpu_intr_3_43:
	setx	0x20012e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_21:
	mov	0x30, %r14
	.word 0xf8db8e80  ! 598: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xfa248000  ! 599: STW_R	stw	%r29, [%r18 + %r0]
	.word 0xf8b5c020  ! 602: STHA_R	stha	%r28, [%r23 + %r0] 0x01
T3_asi_reg_wr_21:
	mov	0x2e, %r14
	.word 0xf6f389e0  ! 603: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf0250000  ! 605: STW_R	stw	%r24, [%r20 + %r0]
iob_intr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_48), 16, 16)) -> intp(3, 0, 21)
T3_asi_reg_wr_22:
	mov	0x27, %r14
	.word 0xf4f38e60  ! 609: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf475e1e5  ! 616: STX_I	stx	%r26, [%r23 + 0x01e5]
	.word 0xf0f4a0b9  ! 618: STXA_I	stxa	%r24, [%r18 + 0x00b9] %asi
	.word 0xfe750000  ! 619: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xfeb50020  ! 622: STHA_R	stha	%r31, [%r20 + %r0] 0x01
cpu_intr_3_44:
	setx	0x22003b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_23:
	mov	0x3c0, %r14
	.word 0xfef38e40  ! 628: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_3_45:
	setx	0x210239, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_46:
	setx	0x22023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_24:
	mov	0x3, %r14
	.word 0xf8f38400  ! 638: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T3_asi_reg_wr_25:
	mov	0x32, %r14
	.word 0xf4f38400  ! 643: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_49), 16, 16)) -> intp(3, 0, 5)
	.word 0xba45217c  ! 646: ADDC_I	addc 	%r20, 0x017c, %r29
cpu_intr_3_47:
	setx	0x220229, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_26:
	mov	0xf, %r14
	.word 0xfcf38e60  ! 650: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T3_asi_reg_wr_27:
	mov	0x26, %r14
	.word 0xf4f389e0  ! 652: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xfa35e002  ! 653: STH_I	sth	%r29, [%r23 + 0x0002]
T3_asi_reg_rd_22:
	mov	0x3c6, %r14
	.word 0xfedb8e60  ! 654: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T3_asi_reg_wr_28:
	mov	0x5, %r14
	.word 0xf4f38e60  ! 655: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_50), 16, 16)) -> intp(3, 0, 14)
	.word 0xb8244000  ! 659: SUB_R	sub 	%r17, %r0, %r28
iob_intr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_51), 16, 16)) -> intp(3, 0, 1d)
cpu_intr_3_48:
	setx	0x20001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb22d21f5  ! 662: ANDN_I	andn 	%r20, 0x01f5, %r25
T3_asi_reg_rd_23:
	mov	0x31, %r14
	.word 0xfadb8e40  ! 664: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb88560ae  ! 671: ADDcc_I	addcc 	%r21, 0x00ae, %r28
iob_intr_3_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_52), 16, 16)) -> intp(3, 0, 3e)
iob_intr_3_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_53), 16, 16)) -> intp(3, 0, 23)
cpu_intr_3_49:
	setx	0x23020e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_50:
	setx	0x220110, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_54), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf4752061  ! 680: STX_I	stx	%r26, [%r20 + 0x0061]
	.word 0xf8ad4020  ! 684: STBA_R	stba	%r28, [%r21 + %r0] 0x01
cpu_intr_3_51:
	setx	0x200001, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_55), 16, 16)) -> intp(3, 0, 1a)
	.word 0xb1643801  ! 688: MOVcc_I	<illegal instruction>
	.word 0xf674e088  ! 690: STX_I	stx	%r27, [%r19 + 0x0088]
T3_asi_reg_rd_24:
	mov	0x17, %r14
	.word 0xf8db8e40  ! 691: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T3_asi_reg_wr_29:
	mov	0x3c2, %r14
	.word 0xfef38e40  ! 692: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_3_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_56), 16, 16)) -> intp(3, 0, 7)
T3_asi_reg_wr_30:
	mov	0x28, %r14
	.word 0xf8f38e40  ! 696: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfe2c61c8  ! 697: STB_I	stb	%r31, [%r17 + 0x01c8]
iob_intr_3_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_57), 16, 16)) -> intp(3, 0, 30)
	.word 0xf0f52075  ! 700: STXA_I	stxa	%r24, [%r20 + 0x0075] %asi
cpu_intr_3_52:
	setx	0x20032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53c7001  ! 703: SRAX_I	srax	%r17, 0x0001, %r26
cpu_intr_3_53:
	setx	0x220027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82d60cb  ! 706: STB_I	stb	%r28, [%r21 + 0x00cb]
T3_asi_reg_rd_25:
	mov	0x12, %r14
	.word 0xfadb8400  ! 707: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_3_54:
	setx	0x20020a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_58), 16, 16)) -> intp(3, 0, 19)
iob_intr_3_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_59), 16, 16)) -> intp(3, 0, 11)
	.word 0xfcf4e010  ! 717: STXA_I	stxa	%r30, [%r19 + 0x0010] %asi
iob_intr_3_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_60), 16, 16)) -> intp(3, 0, 3c)
cpu_intr_3_55:
	setx	0x23020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8748000  ! 721: STX_R	stx	%r28, [%r18 + %r0]
	.word 0xf8748000  ! 723: STX_R	stx	%r28, [%r18 + %r0]
T3_asi_reg_wr_31:
	mov	0x3c5, %r14
	.word 0xf6f38e40  ! 726: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfea40020  ! 730: STWA_R	stwa	%r31, [%r16 + %r0] 0x01
iob_intr_3_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_61), 16, 16)) -> intp(3, 0, 23)
iob_intr_3_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_62), 16, 16)) -> intp(3, 0, 3f)
	.word 0xb68cc000  ! 735: ANDcc_R	andcc 	%r19, %r0, %r27
	.word 0xbebd0000  ! 736: XNORcc_R	xnorcc 	%r20, %r0, %r31
T3_asi_reg_wr_32:
	mov	0x3c5, %r14
	.word 0xf0f38e40  ! 737: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	ta	T_CHANGE_NONHPRIV
iob_intr_3_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_63), 16, 16)) -> intp(3, 0, 26)
cpu_intr_3_56:
	setx	0x220035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_57:
	setx	0x23032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8f902002  ! 747: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xfe744000  ! 748: STX_R	stx	%r31, [%r17 + %r0]
iob_intr_3_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_64), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf0254000  ! 754: STW_R	stw	%r24, [%r21 + %r0]
	.word 0xfa25c000  ! 755: STW_R	stw	%r29, [%r23 + %r0]
cpu_intr_3_58:
	setx	0x20010e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_33:
	mov	0x26, %r14
	.word 0xf2f38e60  ! 763: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_3_59:
	setx	0x23030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_34:
	mov	0x3c1, %r14
	.word 0xfcf38e40  ! 766: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_60:
	setx	0x220134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe3d613b  ! 772: XNOR_I	xnor 	%r21, 0x013b, %r31
	.word 0xfe74207b  ! 773: STX_I	stx	%r31, [%r16 + 0x007b]
T3_asi_reg_rd_26:
	mov	0x3c2, %r14
	.word 0xf4db8e80  ! 774: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_3_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_65), 16, 16)) -> intp(3, 0, 4)
	.word 0xf8ad61fc  ! 780: STBA_I	stba	%r28, [%r21 + 0x01fc] %asi
cpu_intr_3_61:
	setx	0x210228, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_35:
	mov	0x3c4, %r14
	.word 0xfaf389e0  ! 784: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xfa354000  ! 785: STH_R	sth	%r29, [%r21 + %r0]
	.word 0xf835e140  ! 787: STH_I	sth	%r28, [%r23 + 0x0140]
	.word 0xfca5c020  ! 788: STWA_R	stwa	%r30, [%r23 + %r0] 0x01
	.word 0xfc342033  ! 792: STH_I	sth	%r30, [%r16 + 0x0033]
iob_intr_3_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_66), 16, 16)) -> intp(3, 0, 2a)
cpu_intr_3_62:
	setx	0x20003b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_67), 16, 16)) -> intp(3, 0, 39)
cpu_intr_3_63:
	setx	0x220328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf274a065  ! 798: STX_I	stx	%r25, [%r18 + 0x0065]
T3_asi_reg_rd_27:
	mov	0x3c7, %r14
	.word 0xf6db8e40  ! 799: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_wr_36:
	mov	0x2f, %r14
	.word 0xfcf38400  ! 800: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb624616b  ! 804: SUB_I	sub 	%r17, 0x016b, %r27
cpu_intr_3_64:
	setx	0x21021a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_37:
	mov	0x15, %r14
	.word 0xf0f389e0  ! 808: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T3_asi_reg_wr_38:
	mov	0x15, %r14
	.word 0xfaf38400  ! 810: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T3_asi_reg_wr_39:
	mov	0x3c8, %r14
	.word 0xfaf38e80  ! 812: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_3_65:
	setx	0x220121, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_40:
	mov	0x0, %r14
	.word 0xfef38400  ! 815: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xfeb5c020  ! 816: STHA_R	stha	%r31, [%r23 + %r0] 0x01
iob_intr_3_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_68), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf2b40020  ! 818: STHA_R	stha	%r25, [%r16 + %r0] 0x01
	.word 0xfa2560de  ! 821: STW_I	stw	%r29, [%r21 + 0x00de]
	.word 0xf62c61df  ! 824: STB_I	stb	%r27, [%r17 + 0x01df]
	.word 0xfe35a145  ! 825: STH_I	sth	%r31, [%r22 + 0x0145]
T3_asi_reg_wr_41:
	mov	0x13, %r14
	.word 0xf0f38e40  ! 827: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf0758000  ! 832: STX_R	stx	%r24, [%r22 + %r0]
	.word 0xfca50020  ! 834: STWA_R	stwa	%r30, [%r20 + %r0] 0x01
T3_asi_reg_wr_42:
	mov	0x34, %r14
	.word 0xf0f384a0  ! 835: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_3_66:
	setx	0x230328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62d0000  ! 837: STB_R	stb	%r27, [%r20 + %r0]
iob_intr_3_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_69), 16, 16)) -> intp(3, 0, 11)
cpu_intr_3_67:
	setx	0x22011a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_43:
	mov	0x3c2, %r14
	.word 0xfaf38e80  ! 840: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T3_asi_reg_wr_44:
	mov	0x2d, %r14
	.word 0xfaf38e60  ! 843: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_TO_TL0
	.word 0xfa25c000  ! 848: STW_R	stw	%r29, [%r23 + %r0]
T3_asi_reg_wr_45:
	mov	0x3c2, %r14
	.word 0xfcf38e40  ! 849: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf674e136  ! 851: STX_I	stx	%r27, [%r19 + 0x0136]
	.word 0xf275a154  ! 857: STX_I	stx	%r25, [%r22 + 0x0154]
	.word 0xbc34e0b5  ! 861: SUBC_I	orn 	%r19, 0x00b5, %r30
cpu_intr_3_68:
	setx	0x230118, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983ed0  ! 869: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ed0, %hpstate
	.word 0xfca44020  ! 872: STWA_R	stwa	%r30, [%r17 + %r0] 0x01
	.word 0xfeade128  ! 873: STBA_I	stba	%r31, [%r23 + 0x0128] %asi
	.word 0xf2354000  ! 874: STH_R	sth	%r25, [%r21 + %r0]
	ta	T_CHANGE_TO_TL1
	.word 0xf834218b  ! 876: STH_I	sth	%r28, [%r16 + 0x018b]
cpu_intr_3_69:
	setx	0x210217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd643801  ! 878: MOVcc_I	<illegal instruction>
cpu_intr_3_70:
	setx	0x21023e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_71:
	setx	0x23011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
cpu_intr_3_72:
	setx	0x220035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a4e181  ! 885: STWA_I	stwa	%r27, [%r19 + 0x0181] %asi
iob_intr_3_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_70), 16, 16)) -> intp(3, 0, 16)
iob_intr_3_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_71), 16, 16)) -> intp(3, 0, d)
	.word 0xf2748000  ! 888: STX_R	stx	%r25, [%r18 + %r0]
	.word 0xbf641800  ! 892: MOVcc_R	<illegal instruction>
T3_asi_reg_wr_46:
	mov	0xe, %r14
	.word 0xf2f38e40  ! 893: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_3_73:
	setx	0x22021e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_47:
	mov	0x29, %r14
	.word 0xf4f38e40  ! 896: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T3_asi_reg_rd_28:
	mov	0x38, %r14
	.word 0xf4db84a0  ! 899: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_3_74:
	setx	0x200100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2d61e5  ! 902: STB_I	stb	%r30, [%r21 + 0x01e5]
	.word 0xbf340000  ! 903: SRL_R	srl 	%r16, %r0, %r31
	ta	T_CHANGE_TO_TL1
	.word 0xf0344000  ! 908: STH_R	sth	%r24, [%r17 + %r0]
	.word 0xf8750000  ! 911: STX_R	stx	%r28, [%r20 + %r0]
	.word 0xfeada1c2  ! 912: STBA_I	stba	%r31, [%r22 + 0x01c2] %asi
	.word 0xfc358000  ! 914: STH_R	sth	%r30, [%r22 + %r0]
	.word 0xb4bd8000  ! 915: XNORcc_R	xnorcc 	%r22, %r0, %r26
	.word 0xf22521ca  ! 917: STW_I	stw	%r25, [%r20 + 0x01ca]
	.word 0xf0348000  ! 918: STH_R	sth	%r24, [%r18 + %r0]
iob_intr_3_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_72), 16, 16)) -> intp(3, 0, 2a)
T3_asi_reg_wr_48:
	mov	0x37, %r14
	.word 0xf0f38e40  ! 920: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T3_asi_reg_wr_49:
	mov	0x34, %r14
	.word 0xf2f389e0  ! 926: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_3_75:
	setx	0x24033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_73), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_rd_29:
	mov	0x3c3, %r14
	.word 0xfadb8e80  ! 936: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_3_76:
	setx	0x26003d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_74), 16, 16)) -> intp(3, 0, 3b)
T3_asi_reg_rd_30:
	mov	0xd, %r14
	.word 0xf4db89e0  ! 939: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983b90  ! 941: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b90, %hpstate
	.word 0xf82c20b1  ! 944: STB_I	stb	%r28, [%r16 + 0x00b1]
iob_intr_3_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_75), 16, 16)) -> intp(3, 0, 1d)
	.word 0xb6b48000  ! 947: ORNcc_R	orncc 	%r18, %r0, %r27
T3_asi_reg_rd_31:
	mov	0xf, %r14
	.word 0xfcdb84a0  ! 949: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf82ca098  ! 951: STB_I	stb	%r28, [%r18 + 0x0098]
	.word 0xf675218d  ! 952: STX_I	stx	%r27, [%r20 + 0x018d]
T3_asi_reg_wr_50:
	mov	0x1f, %r14
	.word 0xf2f384a0  ! 953: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
	.word 0xf6254000  ! 958: STW_R	stw	%r27, [%r21 + %r0]
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982918  ! 961: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0918, %hpstate
	.word 0xf2a4a0e5  ! 962: STWA_I	stwa	%r25, [%r18 + 0x00e5] %asi
cpu_intr_3_77:
	setx	0x26013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72dd000  ! 964: SLLX_R	sllx	%r23, %r0, %r27
iob_intr_3_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_76), 16, 16)) -> intp(3, 0, 28)
	.word 0xf834a15b  ! 966: STH_I	sth	%r28, [%r18 + 0x015b]
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983f48  ! 968: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f48, %hpstate
T3_asi_reg_wr_51:
	mov	0x3c3, %r14
	.word 0xf4f38e80  ! 970: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982ac2  ! 971: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac2, %hpstate
	.word 0xf62c0000  ! 975: STB_R	stb	%r27, [%r16 + %r0]
T3_asi_reg_wr_52:
	mov	0x2a, %r14
	.word 0xf2f38e40  ! 976: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbc9ce143  ! 977: XORcc_I	xorcc 	%r19, 0x0143, %r30
cpu_intr_3_78:
	setx	0x250012, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_77), 16, 16)) -> intp(3, 0, 22)
iob_intr_3_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_78), 16, 16)) -> intp(3, 0, 3a)
	ta	T_CHANGE_NONHPRIV
	.word 0xb93df001  ! 993: SRAX_I	srax	%r23, 0x0001, %r28
	.word 0xfeb5c020  ! 996: STHA_R	stha	%r31, [%r23 + %r0] 0x01
iob_intr_3_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_79), 16, 16)) -> intp(3, 0, 17)
	.word 0xfcade146  ! 999: STBA_I	stba	%r30, [%r23 + 0x0146] %asi
iob_intr_3_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_80), 16, 16)) -> intp(3, 0, 2)
iob_intr_3_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_81), 16, 16)) -> intp(3, 0, 3)
iob_intr_3_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_82), 16, 16)) -> intp(3, 0, 21)
T3_asi_reg_rd_32:
	mov	0x7, %r14
	.word 0xf0db8400  ! 1009: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf6b460b9  ! 1010: STHA_I	stha	%r27, [%r17 + 0x00b9] %asi
	.word 0xf8b50020  ! 1011: STHA_R	stha	%r28, [%r20 + %r0] 0x01
iob_intr_3_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_83), 16, 16)) -> intp(3, 0, 2)
	.word 0xba14a1d3  ! 1018: OR_I	or 	%r18, 0x01d3, %r29
	.word 0xb214e1d0  ! 1019: OR_I	or 	%r19, 0x01d0, %r25
iob_intr_3_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_84), 16, 16)) -> intp(3, 0, 23)
	.word 0xf0744000  ! 1023: STX_R	stx	%r24, [%r17 + %r0]
	.word 0xf2254000  ! 1024: STW_R	stw	%r25, [%r21 + %r0]
cpu_intr_3_79:
	setx	0x24032b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_33:
	mov	0x9, %r14
	.word 0xfcdb8e80  ! 1028: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_3_80:
	setx	0x27023f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_85), 16, 16)) -> intp(3, 0, b)
cpu_intr_3_81:
	setx	0x27021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe35213c  ! 1038: SUBC_I	orn 	%r20, 0x013c, %r31
	.word 0xf8b40020  ! 1042: STHA_R	stha	%r28, [%r16 + %r0] 0x01
cpu_intr_3_82:
	setx	0x270306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2d2142  ! 1050: STB_I	stb	%r29, [%r20 + 0x0142]
	.word 0xfa250000  ! 1052: STW_R	stw	%r29, [%r20 + %r0]
	.word 0xbe35a063  ! 1054: ORN_I	orn 	%r22, 0x0063, %r31
	ta	T_CHANGE_HPRIV
	.word 0xf0a5c020  ! 1059: STWA_R	stwa	%r24, [%r23 + %r0] 0x01
iob_intr_3_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_86), 16, 16)) -> intp(3, 0, 6)
iob_intr_3_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_87), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_wr_53:
	mov	0xa, %r14
	.word 0xf4f38e40  ! 1070: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T3_asi_reg_wr_54:
	mov	0x3, %r14
	.word 0xf6f38e40  ! 1072: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_3_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_88), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf8ad4020  ! 1074: STBA_R	stba	%r28, [%r21 + %r0] 0x01
cpu_intr_3_83:
	setx	0x240227, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_89), 16, 16)) -> intp(3, 0, 9)
	.word 0xfe250000  ! 1081: STW_R	stw	%r31, [%r20 + %r0]
T3_asi_reg_wr_55:
	mov	0x3c6, %r14
	.word 0xf6f38e40  ! 1083: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb5343001  ! 1084: SRLX_I	srlx	%r16, 0x0001, %r26
T3_asi_reg_rd_34:
	mov	0xe, %r14
	.word 0xf6db8e80  ! 1087: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T3_asi_reg_wr_56:
	mov	0x3c2, %r14
	.word 0xf4f384a0  ! 1089: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_3_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_90), 16, 16)) -> intp(3, 0, 21)
	.word 0xb4048000  ! 1094: ADD_R	add 	%r18, %r0, %r26
cpu_intr_3_84:
	setx	0x250325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca5c020  ! 1097: STWA_R	stwa	%r30, [%r23 + %r0] 0x01
	.word 0xf6342020  ! 1101: STH_I	sth	%r27, [%r16 + 0x0020]
T3_asi_reg_rd_35:
	mov	0x16, %r14
	.word 0xf4db8e80  ! 1104: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_3_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_91), 16, 16)) -> intp(3, 0, 3c)
iob_intr_3_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_92), 16, 16)) -> intp(3, 0, 3b)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe244000  ! 1116: STW_R	stw	%r31, [%r17 + %r0]
	.word 0xfaaca07b  ! 1118: STBA_I	stba	%r29, [%r18 + 0x007b] %asi
T3_asi_reg_wr_57:
	mov	0x3c6, %r14
	.word 0xfcf389e0  ! 1119: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf4a4a1ae  ! 1120: STWA_I	stwa	%r26, [%r18 + 0x01ae] %asi
cpu_intr_3_85:
	setx	0x25013c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_93), 16, 16)) -> intp(3, 0, 17)
iob_intr_3_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_94), 16, 16)) -> intp(3, 0, 39)
	.word 0xfaa4603c  ! 1130: STWA_I	stwa	%r29, [%r17 + 0x003c] %asi
T3_asi_reg_wr_58:
	mov	0x10, %r14
	.word 0xf4f38e80  ! 1132: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xba1dc000  ! 1133: XOR_R	xor 	%r23, %r0, %r29
	.word 0xf025e184  ! 1134: STW_I	stw	%r24, [%r23 + 0x0184]
	.word 0xbe2dc000  ! 1135: ANDN_R	andn 	%r23, %r0, %r31
cpu_intr_3_86:
	setx	0x27021d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_87:
	setx	0x270117, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_88:
	setx	0x250236, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_36:
	mov	0x6, %r14
	.word 0xf4db8e40  ! 1145: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf8b48020  ! 1147: STHA_R	stha	%r28, [%r18 + %r0] 0x01
iob_intr_3_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_95), 16, 16)) -> intp(3, 0, 18)
cpu_intr_3_89:
	setx	0x25020c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_90:
	setx	0x270339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc258000  ! 1158: SUB_R	sub 	%r22, %r0, %r30
iob_intr_3_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_96), 16, 16)) -> intp(3, 0, 19)
	.word 0xf6344000  ! 1162: STH_R	sth	%r27, [%r17 + %r0]
iob_intr_3_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_97), 16, 16)) -> intp(3, 0, 16)
iob_intr_3_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_98), 16, 16)) -> intp(3, 0, f)
T3_asi_reg_wr_59:
	mov	0x3c4, %r14
	.word 0xfef38e80  ! 1169: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf82de060  ! 1170: STB_I	stb	%r28, [%r23 + 0x0060]
	.word 0xf62d6073  ! 1171: STB_I	stb	%r27, [%r21 + 0x0073]
T3_asi_reg_rd_37:
	mov	0x31, %r14
	.word 0xfadb8e40  ! 1172: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf8b58020  ! 1173: STHA_R	stha	%r28, [%r22 + %r0] 0x01
	.word 0xf2b5a11e  ! 1175: STHA_I	stha	%r25, [%r22 + 0x011e] %asi
	.word 0xb4acc000  ! 1177: ANDNcc_R	andncc 	%r19, %r0, %r26
T3_asi_reg_wr_60:
	mov	0x37, %r14
	.word 0xf2f384a0  ! 1178: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xfef5e193  ! 1180: STXA_I	stxa	%r31, [%r23 + 0x0193] %asi
T3_asi_reg_rd_38:
	mov	0x1f, %r14
	.word 0xf8db8e60  ! 1181: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_3_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_99), 16, 16)) -> intp(3, 0, 32)
	.word 0xb8b5e05b  ! 1189: SUBCcc_I	orncc 	%r23, 0x005b, %r28
	.word 0xf4356068  ! 1191: STH_I	sth	%r26, [%r21 + 0x0068]
iob_intr_3_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_100), 16, 16)) -> intp(3, 0, 36)
iob_intr_3_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_101), 16, 16)) -> intp(3, 0, 23)
cpu_intr_3_91:
	setx	0x240332, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_92:
	setx	0x27033b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_93:
	setx	0x250006, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_39:
	mov	0x34, %r14
	.word 0xf2db84a0  ! 1201: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb37c6401  ! 1206: MOVR_I	movre	%r17, 0x1, %r25
cpu_intr_3_94:
	setx	0x240103, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_95:
	setx	0x26011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3344000  ! 1213: SRL_R	srl 	%r17, %r0, %r25
cpu_intr_3_96:
	setx	0x260319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2358000  ! 1218: STH_R	sth	%r25, [%r22 + %r0]
iob_intr_3_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_102), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf82d8000  ! 1222: STB_R	stb	%r28, [%r22 + %r0]
cpu_intr_3_97:
	setx	0x26033f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_98:
	setx	0x240224, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_103), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_99:
	setx	0x260111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a54020  ! 1232: STWA_R	stwa	%r25, [%r21 + %r0] 0x01
iob_intr_3_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_104), 16, 16)) -> intp(3, 0, 23)
cpu_intr_3_100:
	setx	0x260326, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_40:
	mov	0x11, %r14
	.word 0xfedb89e0  ! 1235: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xb294a045  ! 1240: ORcc_I	orcc 	%r18, 0x0045, %r25
iob_intr_3_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_105), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf6b4c020  ! 1245: STHA_R	stha	%r27, [%r19 + %r0] 0x01
cpu_intr_3_101:
	setx	0x250014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf675c000  ! 1256: STX_R	stx	%r27, [%r23 + %r0]
	.word 0xf4240000  ! 1258: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xf42cc000  ! 1260: STB_R	stb	%r26, [%r19 + %r0]
T3_asi_reg_wr_61:
	mov	0x3c5, %r14
	.word 0xf8f389e0  ! 1264: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf4f42024  ! 1267: STXA_I	stxa	%r26, [%r16 + 0x0024] %asi
T3_asi_reg_wr_62:
	mov	0x16, %r14
	.word 0xfef389e0  ! 1270: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf6b48020  ! 1271: STHA_R	stha	%r27, [%r18 + %r0] 0x01
cpu_intr_3_102:
	setx	0x270214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8ad2017  ! 1275: ANDNcc_I	andncc 	%r20, 0x0017, %r28
	.word 0xfc3520ce  ! 1277: STH_I	sth	%r30, [%r20 + 0x00ce]
T3_asi_reg_rd_41:
	mov	0x38, %r14
	.word 0xf4db84a0  ! 1278: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb41d4000  ! 1280: XOR_R	xor 	%r21, %r0, %r26
	.word 0xf6a56004  ! 1283: STWA_I	stwa	%r27, [%r21 + 0x0004] %asi
	.word 0xfaaca027  ! 1285: STBA_I	stba	%r29, [%r18 + 0x0027] %asi
cpu_intr_3_103:
	setx	0x24001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_3_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_106), 16, 16)) -> intp(3, 0, 13)
iob_intr_3_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_107), 16, 16)) -> intp(3, 0, 28)
	.word 0xf22cc000  ! 1300: STB_R	stb	%r25, [%r19 + %r0]
	.word 0xf0a46059  ! 1304: STWA_I	stwa	%r24, [%r17 + 0x0059] %asi
	.word 0xf4258000  ! 1306: STW_R	stw	%r26, [%r22 + %r0]
cpu_intr_3_104:
	setx	0x24000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42d8000  ! 1311: STB_R	stb	%r26, [%r22 + %r0]
iob_intr_3_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_108), 16, 16)) -> intp(3, 0, 18)
T3_asi_reg_rd_42:
	mov	0x22, %r14
	.word 0xf6db8e80  ! 1317: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xfea421a2  ! 1318: STWA_I	stwa	%r31, [%r16 + 0x01a2] %asi
	.word 0xf0b5c020  ! 1321: STHA_R	stha	%r24, [%r23 + %r0] 0x01
	.word 0xfca44020  ! 1324: STWA_R	stwa	%r30, [%r17 + %r0] 0x01
	.word 0xba0da110  ! 1325: AND_I	and 	%r22, 0x0110, %r29
cpu_intr_3_105:
	setx	0x25000a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_43:
	mov	0x2, %r14
	.word 0xfcdb8e40  ! 1327: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf025a0fc  ! 1331: STW_I	stw	%r24, [%r22 + 0x00fc]
T3_asi_reg_rd_44:
	mov	0x16, %r14
	.word 0xf0db8e40  ! 1333: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfe248000  ! 1335: STW_R	stw	%r31, [%r18 + %r0]
	.word 0xfa2c6035  ! 1336: STB_I	stb	%r29, [%r17 + 0x0035]
T3_asi_reg_wr_63:
	mov	0x33, %r14
	.word 0xf6f38e60  ! 1337: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_3_106:
	setx	0x270027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6758000  ! 1339: STX_R	stx	%r27, [%r22 + %r0]
	.word 0xf634e1f4  ! 1340: STH_I	sth	%r27, [%r19 + 0x01f4]
	.word 0xf03520a1  ! 1341: STH_I	sth	%r24, [%r20 + 0x00a1]
iob_intr_3_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_109), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_110), 16, 16)) -> intp(3, 0, 27)
cpu_intr_3_107:
	setx	0x270019, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_108:
	setx	0x24032e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_109:
	setx	0x240312, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_64:
	mov	0x3c0, %r14
	.word 0xfcf384a0  ! 1361: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_3_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_111), 16, 16)) -> intp(3, 0, 35)
	.word 0xbf3ca001  ! 1364: SRA_I	sra 	%r18, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6f52008  ! 1366: STXA_I	stxa	%r27, [%r20 + 0x0008] %asi
T3_asi_reg_rd_45:
	mov	0x35, %r14
	.word 0xf6db84a0  ! 1367: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xfe35201f  ! 1369: STH_I	sth	%r31, [%r20 + 0x001f]
T3_asi_reg_wr_65:
	mov	0x19, %r14
	.word 0xf4f38e40  ! 1370: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_3_110:
	setx	0x260315, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xfc2c0000  ! 1377: STB_R	stb	%r30, [%r16 + %r0]
	.word 0xfa344000  ! 1378: STH_R	sth	%r29, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_46:
	mov	0x3c8, %r14
	.word 0xf4db8400  ! 1383: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf6b460e8  ! 1384: STHA_I	stha	%r27, [%r17 + 0x00e8] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_66:
	mov	0x3c4, %r14
	.word 0xfaf38e40  ! 1386: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_3_111:
	setx	0x24023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb68d0000  ! 1388: ANDcc_R	andcc 	%r20, %r0, %r27
T3_asi_reg_rd_47:
	mov	0x17, %r14
	.word 0xfedb84a0  ! 1389: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_3_112:
	setx	0x270209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6948000  ! 1393: ORcc_R	orcc 	%r18, %r0, %r27
cpu_intr_3_113:
	setx	0x240013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf635e0b6  ! 1396: STH_I	sth	%r27, [%r23 + 0x00b6]
	.word 0xfea40020  ! 1397: STWA_R	stwa	%r31, [%r16 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_48:
	mov	0x3c0, %r14
	.word 0xf4db84a0  ! 1402: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf6ac0020  ! 1404: STBA_R	stba	%r27, [%r16 + %r0] 0x01
	.word 0xf675c000  ! 1405: STX_R	stx	%r27, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_112), 16, 16)) -> intp(3, 0, 1)
T3_asi_reg_rd_49:
	mov	0x1c, %r14
	.word 0xf0db8e60  ! 1409: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xfc344000  ! 1410: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xf8a5a1e1  ! 1411: STWA_I	stwa	%r28, [%r22 + 0x01e1] %asi
iob_intr_3_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_113), 16, 16)) -> intp(3, 0, 24)
	.word 0xf4b520bc  ! 1413: STHA_I	stha	%r26, [%r20 + 0x00bc] %asi
	.word 0xf0b5e0c6  ! 1414: STHA_I	stha	%r24, [%r23 + 0x00c6] %asi
T3_asi_reg_rd_50:
	mov	0x2f, %r14
	.word 0xfedb8e40  ! 1416: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf2754000  ! 1419: STX_R	stx	%r25, [%r21 + %r0]
	ta	T_CHANGE_TO_TL0
	.word 0xfeb52138  ! 1424: STHA_I	stha	%r31, [%r20 + 0x0138] %asi
cpu_intr_3_114:
	setx	0x290104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa5c020  ! 1426: STWA_R	stwa	%r29, [%r23 + %r0] 0x01
iob_intr_3_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_114), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf62c0000  ! 1428: STB_R	stb	%r27, [%r16 + %r0]
	.word 0xfcf4a05c  ! 1429: STXA_I	stxa	%r30, [%r18 + 0x005c] %asi
	.word 0xf6a4e140  ! 1434: STWA_I	stwa	%r27, [%r19 + 0x0140] %asi
iob_intr_3_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_115), 16, 16)) -> intp(3, 0, 7)
	.word 0xf0758000  ! 1436: STX_R	stx	%r24, [%r22 + %r0]
T3_asi_reg_rd_51:
	mov	0x3c1, %r14
	.word 0xfadb8e80  ! 1437: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_3_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_116), 16, 16)) -> intp(3, 0, 14)
cpu_intr_3_115:
	setx	0x2a0333, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_117), 16, 16)) -> intp(3, 0, 9)
	.word 0xf8ade1fd  ! 1442: STBA_I	stba	%r28, [%r23 + 0x01fd] %asi
T3_asi_reg_wr_67:
	mov	0x24, %r14
	.word 0xf6f38e40  ! 1446: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_116:
	setx	0x280031, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xfab58020  ! 1453: STHA_R	stha	%r29, [%r22 + %r0] 0x01
	.word 0xb3500000  ! 1454: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xf8358000  ! 1456: STH_R	sth	%r28, [%r22 + %r0]
	.word 0xf2248000  ! 1457: STW_R	stw	%r25, [%r18 + %r0]
cpu_intr_3_117:
	setx	0x28011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb93d7001  ! 1461: SRAX_I	srax	%r21, 0x0001, %r28
	.word 0xfa2ce0a7  ! 1463: STB_I	stb	%r29, [%r19 + 0x00a7]
cpu_intr_3_118:
	setx	0x29031a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_52:
	mov	0x22, %r14
	.word 0xf4db8400  ! 1467: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf02d6173  ! 1468: STB_I	stb	%r24, [%r21 + 0x0173]
cpu_intr_3_119:
	setx	0x2b0114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7518000  ! 1470: RDPR_PSTATE	<illegal instruction>
iob_intr_3_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_118), 16, 16)) -> intp(3, 0, 33)
	.word 0xf2adc020  ! 1480: STBA_R	stba	%r25, [%r23 + %r0] 0x01
T3_asi_reg_rd_53:
	mov	0xf, %r14
	.word 0xf6db84a0  ! 1482: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_3_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_119), 16, 16)) -> intp(3, 0, 28)
cpu_intr_3_120:
	setx	0x290217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4748000  ! 1487: STX_R	stx	%r26, [%r18 + %r0]
	ta	T_CHANGE_TO_TL0
	.word 0xf6a5a182  ! 1490: STWA_I	stwa	%r27, [%r22 + 0x0182] %asi
T3_asi_reg_rd_54:
	mov	0xa, %r14
	.word 0xf6db89e0  ! 1493: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb7347001  ! 1494: SRLX_I	srlx	%r17, 0x0001, %r27
	ta	T_CHANGE_HPRIV
cpu_intr_3_121:
	setx	0x2b0121, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_3_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_120), 16, 16)) -> intp(3, 0, 1d)
iob_intr_3_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_121), 16, 16)) -> intp(3, 0, 38)
iob_intr_3_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_122), 16, 16)) -> intp(3, 0, 35)
cpu_intr_3_122:
	setx	0x2a0332, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_68:
	mov	0x3c3, %r14
	.word 0xf6f389e0  ! 1511: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_3_123:
	setx	0x28030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8a58000  ! 1513: SUBcc_R	subcc 	%r22, %r0, %r28
cpu_intr_3_124:
	setx	0x280015, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_69:
	mov	0x3c7, %r14
	.word 0xf8f384a0  ! 1518: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf4344000  ! 1519: STH_R	sth	%r26, [%r17 + %r0]
	.word 0xfaa521b7  ! 1522: STWA_I	stwa	%r29, [%r20 + 0x01b7] %asi
T3_asi_reg_wr_70:
	mov	0x3c1, %r14
	.word 0xfef38400  ! 1526: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T3_asi_reg_rd_55:
	mov	0x2f, %r14
	.word 0xf2db89e0  ! 1527: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xfe2dc000  ! 1528: STB_R	stb	%r31, [%r23 + %r0]
T3_asi_reg_rd_56:
	mov	0x21, %r14
	.word 0xf6db8400  ! 1531: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_3_125:
	setx	0x2a0014, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_57:
	mov	0x3c6, %r14
	.word 0xf4db8400  ! 1535: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_3_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_123), 16, 16)) -> intp(3, 0, 35)
	.word 0xf034e10a  ! 1537: STH_I	sth	%r24, [%r19 + 0x010a]
iob_intr_3_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_124), 16, 16)) -> intp(3, 0, 19)
	.word 0xfaad8020  ! 1539: STBA_R	stba	%r29, [%r22 + %r0] 0x01
	.word 0xfaa5a06f  ! 1541: STWA_I	stwa	%r29, [%r22 + 0x006f] %asi
T3_asi_reg_wr_71:
	mov	0x3c2, %r14
	.word 0xf8f38e60  ! 1543: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf8ad0020  ! 1544: STBA_R	stba	%r28, [%r20 + %r0] 0x01
	.word 0xf224c000  ! 1546: STW_R	stw	%r25, [%r19 + %r0]
	.word 0xf8b44020  ! 1548: STHA_R	stha	%r28, [%r17 + %r0] 0x01
cpu_intr_3_126:
	setx	0x2a0331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b4e1b8  ! 1550: STHA_I	stha	%r25, [%r19 + 0x01b8] %asi
	.word 0xfc354000  ! 1552: STH_R	sth	%r30, [%r21 + %r0]
	.word 0xfca54020  ! 1553: STWA_R	stwa	%r30, [%r21 + %r0] 0x01
T3_asi_reg_rd_58:
	mov	0x5, %r14
	.word 0xf8db89e0  ! 1554: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_3_127:
	setx	0x2b0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb4e14e  ! 1556: STHA_I	stha	%r31, [%r19 + 0x014e] %asi
	.word 0xfab54020  ! 1558: STHA_R	stha	%r29, [%r21 + %r0] 0x01
iob_intr_3_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_125), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf8740000  ! 1561: STX_R	stx	%r28, [%r16 + %r0]
T3_asi_reg_wr_72:
	mov	0x23, %r14
	.word 0xf4f38400  ! 1562: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf835e1cd  ! 1563: STH_I	sth	%r28, [%r23 + 0x01cd]
cpu_intr_3_128:
	setx	0x290109, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_73:
	mov	0x3c2, %r14
	.word 0xf2f38e40  ! 1567: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
	.word 0xf275e0cc  ! 1573: STX_I	stx	%r25, [%r23 + 0x00cc]
	.word 0xbd2d8000  ! 1574: SLL_R	sll 	%r22, %r0, %r30
iob_intr_3_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_126), 16, 16)) -> intp(3, 0, e)
iob_intr_3_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_127), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf0b5c020  ! 1583: STHA_R	stha	%r24, [%r23 + %r0] 0x01
	.word 0xbe9d6113  ! 1584: XORcc_I	xorcc 	%r21, 0x0113, %r31
	.word 0xfcada0d0  ! 1587: STBA_I	stba	%r30, [%r22 + 0x00d0] %asi
	.word 0xf62c618c  ! 1588: STB_I	stb	%r27, [%r17 + 0x018c]
T3_asi_reg_wr_74:
	mov	0x33, %r14
	.word 0xfaf384a0  ! 1589: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T3_asi_reg_wr_75:
	mov	0x26, %r14
	.word 0xf0f38e40  ! 1590: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T3_asi_reg_wr_76:
	mov	0x19, %r14
	.word 0xfaf384a0  ! 1591: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbaad0000  ! 1593: ANDNcc_R	andncc 	%r20, %r0, %r29
	.word 0xf274206b  ! 1595: STX_I	stx	%r25, [%r16 + 0x006b]
	.word 0xbabd0000  ! 1597: XNORcc_R	xnorcc 	%r20, %r0, %r29
cpu_intr_3_129:
	setx	0x280214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb234e00c  ! 1604: SUBC_I	orn 	%r19, 0x000c, %r25
	.word 0xb2bda080  ! 1606: XNORcc_I	xnorcc 	%r22, 0x0080, %r25
iob_intr_3_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_128), 16, 16)) -> intp(3, 0, 2c)
	.word 0xfca54020  ! 1609: STWA_R	stwa	%r30, [%r21 + %r0] 0x01
T3_asi_reg_rd_59:
	mov	0x26, %r14
	.word 0xf0db8e40  ! 1610: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	ta	T_CHANGE_NONHPRIV
	.word 0xf0a5c020  ! 1614: STWA_R	stwa	%r24, [%r23 + %r0] 0x01
	.word 0xf4f5e0be  ! 1616: STXA_I	stxa	%r26, [%r23 + 0x00be] %asi
cpu_intr_3_130:
	setx	0x2b010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe14205a  ! 1618: OR_I	or 	%r16, 0x005a, %r31
iob_intr_3_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_129), 16, 16)) -> intp(3, 0, b)
	.word 0xf835c000  ! 1621: STH_R	sth	%r28, [%r23 + %r0]
	ta	T_CHANGE_TO_TL0
	.word 0xf2254000  ! 1624: STW_R	stw	%r25, [%r21 + %r0]
iob_intr_3_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_130), 16, 16)) -> intp(3, 0, 2d)
T3_asi_reg_wr_77:
	mov	0x3c0, %r14
	.word 0xf2f38e60  ! 1627: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xfc34e15c  ! 1628: STH_I	sth	%r30, [%r19 + 0x015c]
	ta	T_CHANGE_TO_TL0
cpu_intr_3_131:
	setx	0x290337, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x819829ca  ! 1634: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09ca, %hpstate
	.word 0xfeb52135  ! 1635: STHA_I	stha	%r31, [%r20 + 0x0135] %asi
T3_asi_reg_wr_78:
	mov	0x1b, %r14
	.word 0xf6f389e0  ! 1639: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_3_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_131), 16, 16)) -> intp(3, 0, 27)
	.word 0xfcace1dd  ! 1641: STBA_I	stba	%r30, [%r19 + 0x01dd] %asi
	.word 0xf22460c2  ! 1643: STW_I	stw	%r25, [%r17 + 0x00c2]
cpu_intr_3_132:
	setx	0x2a0005, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_79:
	mov	0x20, %r14
	.word 0xf6f389e0  ! 1647: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_3_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_132), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_wr_80:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 1651: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_3_133:
	setx	0x290300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb83cc000  ! 1656: XNOR_R	xnor 	%r19, %r0, %r28
	.word 0xf2a5c020  ! 1657: STWA_R	stwa	%r25, [%r23 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
	.word 0xf4a4600a  ! 1659: STWA_I	stwa	%r26, [%r17 + 0x000a] %asi
	.word 0xfc250000  ! 1664: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xfef4a095  ! 1668: STXA_I	stxa	%r31, [%r18 + 0x0095] %asi
iob_intr_3_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_133), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_rd_60:
	mov	0x2, %r14
	.word 0xf0db8400  ! 1675: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbab5207c  ! 1676: ORNcc_I	orncc 	%r20, 0x007c, %r29
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_81:
	mov	0x1f, %r14
	.word 0xfcf38400  ! 1678: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xfc25e087  ! 1679: STW_I	stw	%r30, [%r23 + 0x0087]
	.word 0xfaa56049  ! 1680: STWA_I	stwa	%r29, [%r21 + 0x0049] %asi
cpu_intr_3_134:
	setx	0x290331, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_134), 16, 16)) -> intp(3, 0, 3d)
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983f00  ! 1684: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f00, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4344000  ! 1688: STH_R	sth	%r26, [%r17 + %r0]
cpu_intr_3_135:
	setx	0x2a003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca521f0  ! 1691: STWA_I	stwa	%r30, [%r20 + 0x01f0] %asi
cpu_intr_3_136:
	setx	0x29011e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_135), 16, 16)) -> intp(3, 0, 8)
T3_asi_reg_rd_61:
	mov	0x34, %r14
	.word 0xf8db8400  ! 1697: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xfaa4c020  ! 1698: STWA_R	stwa	%r29, [%r19 + %r0] 0x01
cpu_intr_3_137:
	setx	0x280029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_136), 16, 16)) -> intp(3, 0, 27)
iob_intr_3_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_137), 16, 16)) -> intp(3, 0, 29)
	.word 0xf6340000  ! 1702: STH_R	sth	%r27, [%r16 + %r0]
iob_intr_3_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_138), 16, 16)) -> intp(3, 0, 3a)
cpu_intr_3_138:
	setx	0x290213, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_139), 16, 16)) -> intp(3, 0, 3a)
	.word 0xfa2c612d  ! 1712: STB_I	stb	%r29, [%r17 + 0x012d]
iob_intr_3_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_140), 16, 16)) -> intp(3, 0, 3e)
cpu_intr_3_139:
	setx	0x290111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea4a098  ! 1716: STWA_I	stwa	%r31, [%r18 + 0x0098] %asi
iob_intr_3_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_141), 16, 16)) -> intp(3, 0, 9)
	ta	T_CHANGE_NONHPRIV
	.word 0xf235a1ee  ! 1724: STH_I	sth	%r25, [%r22 + 0x01ee]
	.word 0xf02c21ff  ! 1726: STB_I	stb	%r24, [%r16 + 0x01ff]
	.word 0xf4b50020  ! 1727: STHA_R	stha	%r26, [%r20 + %r0] 0x01
cpu_intr_3_140:
	setx	0x2b013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ad8020  ! 1729: STBA_R	stba	%r27, [%r22 + %r0] 0x01
	.word 0xfe744000  ! 1733: STX_R	stx	%r31, [%r17 + %r0]
	.word 0xf82ce14a  ! 1737: STB_I	stb	%r28, [%r19 + 0x014a]
	.word 0xba9c2045  ! 1738: XORcc_I	xorcc 	%r16, 0x0045, %r29
cpu_intr_3_141:
	setx	0x290337, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983e00  ! 1740: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e00, %hpstate
cpu_intr_3_142:
	setx	0x2a0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_62:
	mov	0xf, %r14
	.word 0xfcdb84a0  ! 1747: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_3_143:
	setx	0x280016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb37dc400  ! 1751: MOVR_R	movre	%r23, %r0, %r25
	.word 0xf4b48020  ! 1753: STHA_R	stha	%r26, [%r18 + %r0] 0x01
cpu_intr_3_144:
	setx	0x2b0230, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_82:
	mov	0x3c1, %r14
	.word 0xf6f389e0  ! 1755: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T3_asi_reg_rd_63:
	mov	0x30, %r14
	.word 0xfedb8e60  ! 1756: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb805a1b9  ! 1758: ADD_I	add 	%r22, 0x01b9, %r28
iob_intr_3_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_142), 16, 16)) -> intp(3, 0, 27)
	.word 0xfc2da033  ! 1763: STB_I	stb	%r30, [%r22 + 0x0033]
iob_intr_3_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_143), 16, 16)) -> intp(3, 0, 1d)
T3_asi_reg_wr_83:
	mov	0xe, %r14
	.word 0xf8f38e40  ! 1768: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_3_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_144), 16, 16)) -> intp(3, 0, 22)
	.word 0xfc74a1e7  ! 1772: STX_I	stx	%r30, [%r18 + 0x01e7]
	.word 0xf2a44020  ! 1774: STWA_R	stwa	%r25, [%r17 + %r0] 0x01
	.word 0xf22dc000  ! 1776: STB_R	stb	%r25, [%r23 + %r0]
	ta	T_CHANGE_NONHPRIV
iob_intr_3_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_145), 16, 16)) -> intp(3, 0, 1e)
iob_intr_3_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_146), 16, 16)) -> intp(3, 0, 30)
iob_intr_3_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_147), 16, 16)) -> intp(3, 0, 2a)
T3_asi_reg_rd_64:
	mov	0x32, %r14
	.word 0xf4db89e0  ! 1784: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xfc2c60d8  ! 1785: STB_I	stb	%r30, [%r17 + 0x00d8]
	.word 0xf6f5e1f7  ! 1789: STXA_I	stxa	%r27, [%r23 + 0x01f7] %asi
	.word 0xb03c6127  ! 1791: XNOR_I	xnor 	%r17, 0x0127, %r24
	ta	T_CHANGE_TO_TL0
	.word 0xf0b5212e  ! 1793: STHA_I	stha	%r24, [%r20 + 0x012e] %asi
T3_asi_reg_rd_65:
	mov	0x2c, %r14
	.word 0xf0db8e60  ! 1795: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf43561f4  ! 1797: STH_I	sth	%r26, [%r21 + 0x01f4]
	.word 0xf82c601a  ! 1799: STB_I	stb	%r28, [%r17 + 0x001a]
iob_intr_3_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_148), 16, 16)) -> intp(3, 0, 2e)
iob_intr_3_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_149), 16, 16)) -> intp(3, 0, 6)
iob_intr_3_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_150), 16, 16)) -> intp(3, 0, 24)
	.word 0xfaa4a1f0  ! 1804: STWA_I	stwa	%r29, [%r18 + 0x01f0] %asi
	.word 0xf22de109  ! 1805: STB_I	stb	%r25, [%r23 + 0x0109]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_66:
	mov	0x16, %r14
	.word 0xfcdb84a0  ! 1808: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_3_145:
	setx	0x28031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ac0020  ! 1812: STBA_R	stba	%r27, [%r16 + %r0] 0x01
iob_intr_3_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_151), 16, 16)) -> intp(3, 0, 34)
	ta	T_CHANGE_HPRIV
	.word 0xf275a1eb  ! 1818: STX_I	stx	%r25, [%r22 + 0x01eb]
	.word 0xf4b4e0be  ! 1819: STHA_I	stha	%r26, [%r19 + 0x00be] %asi
	.word 0xf2f5e11e  ! 1820: STXA_I	stxa	%r25, [%r23 + 0x011e] %asi
T3_asi_reg_rd_67:
	mov	0x3c1, %r14
	.word 0xf8db8e40  ! 1821: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T3_asi_reg_rd_68:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 1822: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb444603d  ! 1823: ADDC_I	addc 	%r17, 0x003d, %r26
T3_asi_reg_wr_84:
	mov	0x3, %r14
	.word 0xfaf389e0  ! 1825: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T3_asi_reg_wr_85:
	mov	0x3c7, %r14
	.word 0xf2f38e60  ! 1826: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T3_asi_reg_wr_86:
	mov	0x3c0, %r14
	.word 0xfef38e40  ! 1829: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_wr_87:
	mov	0x3c5, %r14
	.word 0xf8f389e0  ! 1830: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_3_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_152), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_rd_69:
	mov	0xf, %r14
	.word 0xf2db84a0  ! 1832: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_3_146:
	setx	0x290015, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf0ada0ee  ! 1837: STBA_I	stba	%r24, [%r22 + 0x00ee] %asi
cpu_intr_3_147:
	setx	0x2b031c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_148:
	setx	0x2b0312, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_88:
	mov	0x7, %r14
	.word 0xf2f38400  ! 1850: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T3_asi_reg_rd_70:
	mov	0x3c7, %r14
	.word 0xfcdb89e0  ! 1851: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_3_149:
	setx	0x2c0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02d6011  ! 1854: STB_I	stb	%r24, [%r21 + 0x0011]
	.word 0xf024602f  ! 1855: STW_I	stw	%r24, [%r17 + 0x002f]
	ta	T_CHANGE_TO_TL0
	.word 0xf875c000  ! 1860: STX_R	stx	%r28, [%r23 + %r0]
iob_intr_3_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_153), 16, 16)) -> intp(3, 0, 3)
cpu_intr_3_150:
	setx	0x2e0108, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_151:
	setx	0x2d0202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b5e158  ! 1865: ORNcc_I	orncc 	%r23, 0x0158, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_152:
	setx	0x2d032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_71:
	mov	0x7, %r14
	.word 0xfcdb8e60  ! 1871: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xfaace184  ! 1872: STBA_I	stba	%r29, [%r19 + 0x0184] %asi
cpu_intr_3_153:
	setx	0x2d0026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa34e1e2  ! 1878: STH_I	sth	%r29, [%r19 + 0x01e2]
	.word 0xf62c4000  ! 1879: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xf2a4610b  ! 1882: STWA_I	stwa	%r25, [%r17 + 0x010b] %asi
iob_intr_3_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_154), 16, 16)) -> intp(3, 0, 1)
T3_asi_reg_wr_89:
	mov	0x4, %r14
	.word 0xfaf38400  ! 1885: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb21d605a  ! 1886: XOR_I	xor 	%r21, 0x005a, %r25
cpu_intr_3_154:
	setx	0x2d020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf825a068  ! 1888: STW_I	stw	%r28, [%r22 + 0x0068]
	.word 0xbe9461d8  ! 1889: ORcc_I	orcc 	%r17, 0x01d8, %r31
T3_asi_reg_wr_90:
	mov	0x29, %r14
	.word 0xfcf38e40  ! 1890: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_155:
	setx	0x2e0013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf874c000  ! 1892: STX_R	stx	%r28, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0xb5510000  ! 1895: RDPR_TICK	rdpr	%tick, %r26
iob_intr_3_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_155), 16, 16)) -> intp(3, 0, 1)
	.word 0xf0a5c020  ! 1899: STWA_R	stwa	%r24, [%r23 + %r0] 0x01
	.word 0xfaad21fb  ! 1900: STBA_I	stba	%r29, [%r20 + 0x01fb] %asi
iob_intr_3_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_156), 16, 16)) -> intp(3, 0, 22)
	.word 0xbe3d4000  ! 1904: XNOR_R	xnor 	%r21, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_72:
	mov	0x3c6, %r14
	.word 0xf2db8e40  ! 1906: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_NONHPRIV
	.word 0xf2adc020  ! 1909: STBA_R	stba	%r25, [%r23 + %r0] 0x01
	.word 0xb73c1000  ! 1910: SRAX_R	srax	%r16, %r0, %r27
	.word 0xfea54020  ! 1911: STWA_R	stwa	%r31, [%r21 + %r0] 0x01
cpu_intr_3_156:
	setx	0x2c0024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22d8000  ! 1914: STB_R	stb	%r25, [%r22 + %r0]
	.word 0xf0758000  ! 1915: STX_R	stx	%r24, [%r22 + %r0]
	.word 0xf0356034  ! 1916: STH_I	sth	%r24, [%r21 + 0x0034]
cpu_intr_3_157:
	setx	0x2f020e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_157), 16, 16)) -> intp(3, 0, 22)
T3_asi_reg_wr_91:
	mov	0x3c1, %r14
	.word 0xf8f38e60  ! 1919: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xfeb52009  ! 1920: STHA_I	stha	%r31, [%r20 + 0x0009] %asi
	.word 0xfeb4e1cc  ! 1922: STHA_I	stha	%r31, [%r19 + 0x01cc] %asi
T3_asi_reg_rd_73:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 1924: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf4ad20b8  ! 1925: STBA_I	stba	%r26, [%r20 + 0x00b8] %asi
T3_asi_reg_rd_74:
	mov	0x22, %r14
	.word 0xfedb84a0  ! 1927: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb03d0000  ! 1929: XNOR_R	xnor 	%r20, %r0, %r24
T3_asi_reg_rd_75:
	mov	0x3c8, %r14
	.word 0xf4db8400  ! 1930: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T3_asi_reg_wr_92:
	mov	0x20, %r14
	.word 0xf4f38e40  ! 1931: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T3_asi_reg_wr_93:
	mov	0x12, %r14
	.word 0xfaf38e40  ! 1933: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_3_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_158), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf0ac4020  ! 1937: STBA_R	stba	%r24, [%r17 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_159), 16, 16)) -> intp(3, 0, a)
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_94:
	mov	0x5, %r14
	.word 0xf0f38e60  ! 1948: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_3_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_160), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf4b5c020  ! 1954: STHA_R	stha	%r26, [%r23 + %r0] 0x01
	.word 0xfaf5a0b0  ! 1957: STXA_I	stxa	%r29, [%r22 + 0x00b0] %asi
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983912  ! 1958: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1912, %hpstate
	.word 0xfe346137  ! 1959: STH_I	sth	%r31, [%r17 + 0x0137]
	.word 0xf0f4a122  ! 1960: STXA_I	stxa	%r24, [%r18 + 0x0122] %asi
T3_asi_reg_wr_95:
	mov	0xa, %r14
	.word 0xf0f38e80  ! 1962: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf07421aa  ! 1964: STX_I	stx	%r24, [%r16 + 0x01aa]
	.word 0xf424618b  ! 1965: STW_I	stw	%r26, [%r17 + 0x018b]
	.word 0xf8a5c020  ! 1966: STWA_R	stwa	%r28, [%r23 + %r0] 0x01
cpu_intr_3_158:
	setx	0x2f0213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2c8000  ! 1970: STB_R	stb	%r29, [%r18 + %r0]
cpu_intr_3_159:
	setx	0x2c0015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3db001  ! 1973: SRAX_I	srax	%r22, 0x0001, %r29
	.word 0xba2dc000  ! 1978: ANDN_R	andn 	%r23, %r0, %r29
	.word 0xfeb421dd  ! 1979: STHA_I	stha	%r31, [%r16 + 0x01dd] %asi
	.word 0xf435a02e  ! 1980: STH_I	sth	%r26, [%r22 + 0x002e]
T3_asi_reg_rd_76:
	mov	0x22, %r14
	.word 0xf8db84a0  ! 1981: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_3_160:
	setx	0x2e011e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_77:
	mov	0x3c3, %r14
	.word 0xfadb8e40  ! 1985: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfa2d20cd  ! 1986: STB_I	stb	%r29, [%r20 + 0x00cd]
iob_intr_3_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_161), 16, 16)) -> intp(3, 0, 32)
cpu_intr_3_161:
	setx	0x2c012f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_162:
	setx	0x2c0030, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_163:
	setx	0x2c0209, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_96:
	mov	0x3c6, %r14
	.word 0xfcf38e60  ! 1995: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbc3d619f  ! 1996: XNOR_I	xnor 	%r21, 0x019f, %r30
T3_asi_reg_rd_78:
	mov	0x3c4, %r14
	.word 0xfcdb8e80  ! 2000: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T3_asi_reg_wr_97:
	mov	0x26, %r14
	.word 0xf8f384a0  ! 2002: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xfc74a054  ! 2003: STX_I	stx	%r30, [%r18 + 0x0054]
iob_intr_3_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_162), 16, 16)) -> intp(3, 0, 6)
	ta	T_CHANGE_TO_TL1
	.word 0xfe3461b5  ! 2009: STH_I	sth	%r31, [%r17 + 0x01b5]
cpu_intr_3_164:
	setx	0x2f0001, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_165:
	setx	0x2e0029, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_98:
	mov	0x2, %r14
	.word 0xfaf38400  ! 2012: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_3_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_163), 16, 16)) -> intp(3, 0, 3c)
cpu_intr_3_166:
	setx	0x2d0325, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_164), 16, 16)) -> intp(3, 0, 0)
	.word 0xf4b48020  ! 2021: STHA_R	stha	%r26, [%r18 + %r0] 0x01
T3_asi_reg_rd_79:
	mov	0x15, %r14
	.word 0xfcdb8e80  ! 2022: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb3344000  ! 2024: SRL_R	srl 	%r17, %r0, %r25
	.word 0xfeb5c020  ! 2027: STHA_R	stha	%r31, [%r23 + %r0] 0x01
T3_asi_reg_rd_80:
	mov	0x34, %r14
	.word 0xf4db8e40  ! 2029: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf0a460f5  ! 2030: STWA_I	stwa	%r24, [%r17 + 0x00f5] %asi
	.word 0xfc34a1ea  ! 2031: STH_I	sth	%r30, [%r18 + 0x01ea]
cpu_intr_3_167:
	setx	0x2e021b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_81:
	mov	0x38, %r14
	.word 0xf6db8e40  ! 2037: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xba3cc000  ! 2038: XNOR_R	xnor 	%r19, %r0, %r29
T3_asi_reg_rd_82:
	mov	0x2a, %r14
	.word 0xf4db84a0  ! 2041: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T3_asi_reg_rd_83:
	mov	0x22, %r14
	.word 0xf0db89e0  ! 2044: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_3_168:
	setx	0x2e0026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a4c020  ! 2046: STWA_R	stwa	%r27, [%r19 + %r0] 0x01
T3_asi_reg_wr_99:
	mov	0x3c6, %r14
	.word 0xfaf384a0  ! 2047: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xfa74204a  ! 2048: STX_I	stx	%r29, [%r16 + 0x004a]
	.word 0xf0248000  ! 2050: STW_R	stw	%r24, [%r18 + %r0]
T3_asi_reg_rd_84:
	mov	0x19, %r14
	.word 0xfadb8400  ! 2051: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_3_169:
	setx	0x2d0114, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_165), 16, 16)) -> intp(3, 0, 2a)
	ta	T_CHANGE_HPRIV
	.word 0xf02ce033  ! 2056: STB_I	stb	%r24, [%r19 + 0x0033]
	.word 0xf6b4c020  ! 2058: STHA_R	stha	%r27, [%r19 + %r0] 0x01
	.word 0xf2ad0020  ! 2061: STBA_R	stba	%r25, [%r20 + %r0] 0x01
	.word 0xf2f5e131  ! 2064: STXA_I	stxa	%r25, [%r23 + 0x0131] %asi
	.word 0xf82c8000  ! 2065: STB_R	stb	%r28, [%r18 + %r0]
iob_intr_3_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_166), 16, 16)) -> intp(3, 0, 2d)
T3_asi_reg_wr_100:
	mov	0x37, %r14
	.word 0xf2f38e60  ! 2069: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T3_asi_reg_wr_101:
	mov	0x14, %r14
	.word 0xf6f389e0  ! 2070: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_3_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_167), 16, 16)) -> intp(3, 0, 17)
	.word 0xf0b50020  ! 2073: STHA_R	stha	%r24, [%r20 + %r0] 0x01
cpu_intr_3_170:
	setx	0x2e0005, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_171:
	setx	0x2e0219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2d0000  ! 2081: STB_R	stb	%r31, [%r20 + %r0]
	.word 0xf2f4e1e7  ! 2082: STXA_I	stxa	%r25, [%r19 + 0x01e7] %asi
	.word 0xf07520af  ! 2083: STX_I	stx	%r24, [%r20 + 0x00af]
	.word 0xfaf5200b  ! 2085: STXA_I	stxa	%r29, [%r20 + 0x000b] %asi
	.word 0xf8a4c020  ! 2086: STWA_R	stwa	%r28, [%r19 + %r0] 0x01
T3_asi_reg_rd_85:
	mov	0x19, %r14
	.word 0xfedb8e80  ! 2087: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_3_172:
	setx	0x2e011b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_173:
	setx	0x2c0134, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x8198394a  ! 2092: WRHPR_HPSTATE_I	wrhpr	%r0, 0x194a, %hpstate
	.word 0xf2754000  ! 2093: STX_R	stx	%r25, [%r21 + %r0]
iob_intr_3_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_168), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_wr_102:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 2103: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983f08  ! 2104: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f08, %hpstate
T3_asi_reg_rd_86:
	mov	0x3c2, %r14
	.word 0xf8db8400  ! 2107: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xfc2c0000  ! 2109: STB_R	stb	%r30, [%r16 + %r0]
	.word 0xf024c000  ! 2111: STW_R	stw	%r24, [%r19 + %r0]
cpu_intr_3_174:
	setx	0x2e0015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8195a167  ! 2117: WRPR_TPC_I	wrpr	%r22, 0x0167, %tpc
iob_intr_3_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_169), 16, 16)) -> intp(3, 0, 1)
T3_asi_reg_wr_103:
	mov	0x1b, %r14
	.word 0xf8f38e60  ! 2121: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf6f420f9  ! 2123: STXA_I	stxa	%r27, [%r16 + 0x00f9] %asi
	.word 0xfcf4a110  ! 2125: STXA_I	stxa	%r30, [%r18 + 0x0110] %asi
T3_asi_reg_wr_104:
	mov	0x31, %r14
	.word 0xfef384a0  ! 2126: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf62dc000  ! 2127: STB_R	stb	%r27, [%r23 + %r0]
cpu_intr_3_175:
	setx	0x2d0122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf025216d  ! 2135: STW_I	stw	%r24, [%r20 + 0x016d]
T3_asi_reg_wr_105:
	mov	0x0, %r14
	.word 0xfaf384a0  ! 2137: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_3_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_170), 16, 16)) -> intp(3, 0, 21)
	.word 0xb09c2065  ! 2142: XORcc_I	xorcc 	%r16, 0x0065, %r24
	.word 0xfa354000  ! 2146: STH_R	sth	%r29, [%r21 + %r0]
	.word 0xf6a5c020  ! 2150: STWA_R	stwa	%r27, [%r23 + %r0] 0x01
	.word 0xfab4c020  ! 2151: STHA_R	stha	%r29, [%r19 + %r0] 0x01
	.word 0xb62c0000  ! 2152: ANDN_R	andn 	%r16, %r0, %r27
iob_intr_3_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_171), 16, 16)) -> intp(3, 0, 31)
cpu_intr_3_176:
	setx	0x2f0121, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_106:
	mov	0x2f, %r14
	.word 0xf6f38400  ! 2156: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf2b5a1bf  ! 2157: STHA_I	stha	%r25, [%r22 + 0x01bf] %asi
	.word 0xfca5a0ac  ! 2159: STWA_I	stwa	%r30, [%r22 + 0x00ac] %asi
T3_asi_reg_rd_87:
	mov	0x15, %r14
	.word 0xfcdb8e40  ! 2161: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_172), 16, 16)) -> intp(3, 0, 1d)
	.word 0xf6a50020  ! 2163: STWA_R	stwa	%r27, [%r20 + %r0] 0x01
T3_asi_reg_wr_107:
	mov	0x3c2, %r14
	.word 0xf2f38e60  ! 2171: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_3_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_173), 16, 16)) -> intp(3, 0, a)
	.word 0xf0b40020  ! 2174: STHA_R	stha	%r24, [%r16 + %r0] 0x01
	.word 0xb52d1000  ! 2177: SLLX_R	sllx	%r20, %r0, %r26
	.word 0xf22560b2  ! 2178: STW_I	stw	%r25, [%r21 + 0x00b2]
	.word 0xf4b54020  ! 2179: STHA_R	stha	%r26, [%r21 + %r0] 0x01
T3_asi_reg_wr_108:
	mov	0x3, %r14
	.word 0xf6f38e40  ! 2181: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_rd_88:
	mov	0x1f, %r14
	.word 0xfcdb8e40  ! 2182: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	ta	T_CHANGE_TO_TL1
cpu_intr_3_177:
	setx	0x2f001e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_178:
	setx	0x3013d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_174), 16, 16)) -> intp(3, 0, 13)
iob_intr_3_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_175), 16, 16)) -> intp(3, 0, 34)
cpu_intr_3_179:
	setx	0x2d000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3504000  ! 2195: RDPR_TNPC	rdpr	%tnpc, %r25
cpu_intr_3_180:
	setx	0x2d0024, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xfab4e131  ! 2202: STHA_I	stha	%r29, [%r19 + 0x0131] %asi
T3_asi_reg_wr_109:
	mov	0x3c4, %r14
	.word 0xf0f389e0  ! 2206: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf4a52074  ! 2207: STWA_I	stwa	%r26, [%r20 + 0x0074] %asi
T3_asi_reg_rd_89:
	mov	0x3, %r14
	.word 0xf6db89e0  ! 2208: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xf0ada107  ! 2209: STBA_I	stba	%r24, [%r22 + 0x0107] %asi
	.word 0xfc744000  ! 2212: STX_R	stx	%r30, [%r17 + %r0]
iob_intr_3_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_176), 16, 16)) -> intp(3, 0, 9)
	.word 0xf8a4e02e  ! 2216: STWA_I	stwa	%r28, [%r19 + 0x002e] %asi
	.word 0xb72d6001  ! 2219: SLL_I	sll 	%r21, 0x0001, %r27
T3_asi_reg_wr_110:
	mov	0x23, %r14
	.word 0xf4f38e80  ! 2220: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_3_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_177), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_wr_111:
	mov	0x25, %r14
	.word 0xfaf38e40  ! 2224: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfa24a093  ! 2229: STW_I	stw	%r29, [%r18 + 0x0093]
iob_intr_3_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_178), 16, 16)) -> intp(3, 0, 3e)
T3_asi_reg_wr_112:
	mov	0x17, %r14
	.word 0xf8f38e40  ! 2234: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf075c000  ! 2236: STX_R	stx	%r24, [%r23 + %r0]
	.word 0xfc24613d  ! 2237: STW_I	stw	%r30, [%r17 + 0x013d]
T3_asi_reg_wr_113:
	mov	0x10, %r14
	.word 0xfef38e60  ! 2238: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_3_181:
	setx	0x2e001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4b5e03a  ! 2242: STHA_I	stha	%r26, [%r23 + 0x003a] %asi
iob_intr_3_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_179), 16, 16)) -> intp(3, 0, 26)
	.word 0xf8b4c020  ! 2244: STHA_R	stha	%r28, [%r19 + %r0] 0x01
T3_asi_reg_rd_90:
	mov	0x2b, %r14
	.word 0xf6db8e40  ! 2246: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xb81dc000  ! 2249: XOR_R	xor 	%r23, %r0, %r28
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x819828da  ! 2250: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08da, %hpstate
	.word 0xfea42147  ! 2251: STWA_I	stwa	%r31, [%r16 + 0x0147] %asi
	.word 0xf4746054  ! 2252: STX_I	stx	%r26, [%r17 + 0x0054]
	.word 0xf0f4e1f7  ! 2256: STXA_I	stxa	%r24, [%r19 + 0x01f7] %asi
cpu_intr_3_182:
	setx	0x2c031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
iob_intr_3_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_180), 16, 16)) -> intp(3, 0, 32)
cpu_intr_3_183:
	setx	0x2f020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe15e00d  ! 2262: OR_I	or 	%r23, 0x000d, %r31
iob_intr_3_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_181), 16, 16)) -> intp(3, 0, 21)
	.word 0xfaa48020  ! 2267: STWA_R	stwa	%r29, [%r18 + %r0] 0x01
	.word 0xfc35c000  ! 2268: STH_R	sth	%r30, [%r23 + %r0]
iob_intr_3_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_182), 16, 16)) -> intp(3, 0, 34)
iob_intr_3_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_183), 16, 16)) -> intp(3, 0, 16)
	.word 0xf6aca0f5  ! 2277: STBA_I	stba	%r27, [%r18 + 0x00f5] %asi
	.word 0xf0f5e04a  ! 2279: STXA_I	stxa	%r24, [%r23 + 0x004a] %asi
T3_asi_reg_rd_91:
	mov	0x3c4, %r14
	.word 0xf8db8e40  ! 2280: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_184:
	setx	0x2d023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8240000  ! 2285: STW_R	stw	%r28, [%r16 + %r0]
	.word 0xf6f5e181  ! 2286: STXA_I	stxa	%r27, [%r23 + 0x0181] %asi
	ta	T_CHANGE_HPRIV
	.word 0xfef5a16d  ! 2291: STXA_I	stxa	%r31, [%r22 + 0x016d] %asi
	.word 0xfaad4020  ! 2293: STBA_R	stba	%r29, [%r21 + %r0] 0x01
cpu_intr_3_185:
	setx	0x2c0137, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_184), 16, 16)) -> intp(3, 0, 1f)
cpu_intr_3_186:
	setx	0x2f011f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_185), 16, 16)) -> intp(3, 0, 20)
iob_intr_3_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_186), 16, 16)) -> intp(3, 0, 22)
T3_asi_reg_wr_114:
	mov	0xc, %r14
	.word 0xf6f389e0  ! 2301: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf2340000  ! 2303: STH_R	sth	%r25, [%r16 + %r0]
	.word 0xf2ac60aa  ! 2304: STBA_I	stba	%r25, [%r17 + 0x00aa] %asi
cpu_intr_3_187:
	setx	0x300332, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_187), 16, 16)) -> intp(3, 0, 1a)
T3_asi_reg_rd_92:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 2308: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb8b5a12d  ! 2309: SUBCcc_I	orncc 	%r22, 0x012d, %r28
iob_intr_3_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_188), 16, 16)) -> intp(3, 0, 35)
	.word 0xf27560d6  ! 2311: STX_I	stx	%r25, [%r21 + 0x00d6]
cpu_intr_3_188:
	setx	0x330230, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_189), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_wr_115:
	mov	0x3c2, %r14
	.word 0xf0f38e60  ! 2314: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T3_asi_reg_wr_116:
	mov	0x3c3, %r14
	.word 0xfcf384a0  ! 2315: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_3_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_190), 16, 16)) -> intp(3, 0, 21)
iob_intr_3_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_191), 16, 16)) -> intp(3, 0, 13)
	.word 0xfa2ca0aa  ! 2321: STB_I	stb	%r29, [%r18 + 0x00aa]
T3_asi_reg_wr_117:
	mov	0x9, %r14
	.word 0xfaf38e80  ! 2323: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_192), 16, 16)) -> intp(3, 0, 6)
	.word 0xfc256036  ! 2326: STW_I	stw	%r30, [%r21 + 0x0036]
iob_intr_3_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_193), 16, 16)) -> intp(3, 0, a)
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983bd8  ! 2337: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd8, %hpstate
	.word 0xf6f4e0a9  ! 2338: STXA_I	stxa	%r27, [%r19 + 0x00a9] %asi
	.word 0xb5641800  ! 2339: MOVcc_R	<illegal instruction>
iob_intr_3_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_194), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf6b48020  ! 2342: STHA_R	stha	%r27, [%r18 + %r0] 0x01
	.word 0xba440000  ! 2343: ADDC_R	addc 	%r16, %r0, %r29
cpu_intr_3_189:
	setx	0x310323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf674c000  ! 2349: STX_R	stx	%r27, [%r19 + %r0]
cpu_intr_3_190:
	setx	0x310230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ace1b4  ! 2354: STBA_I	stba	%r28, [%r19 + 0x01b4] %asi
iob_intr_3_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_195), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf6b5213b  ! 2363: STHA_I	stha	%r27, [%r20 + 0x013b] %asi
	.word 0xf42d60f8  ! 2364: STB_I	stb	%r26, [%r21 + 0x00f8]
iob_intr_3_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_196), 16, 16)) -> intp(3, 0, 3)
iob_intr_3_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_197), 16, 16)) -> intp(3, 0, 2)
T3_asi_reg_wr_118:
	mov	0x2e, %r14
	.word 0xf4f384a0  ! 2370: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_3_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_198), 16, 16)) -> intp(3, 0, 4)
T3_asi_reg_wr_119:
	mov	0x3c5, %r14
	.word 0xfcf38e60  ! 2374: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbeb4a1ab  ! 2376: SUBCcc_I	orncc 	%r18, 0x01ab, %r31
cpu_intr_3_191:
	setx	0x320039, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_120:
	mov	0x5, %r14
	.word 0xf8f38e80  ! 2378: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xfe358000  ! 2379: STH_R	sth	%r31, [%r22 + %r0]
	.word 0x9194e09e  ! 2380: WRPR_PIL_I	wrpr	%r19, 0x009e, %pil
cpu_intr_3_192:
	setx	0x300117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe3560b8  ! 2384: STH_I	sth	%r31, [%r21 + 0x00b8]
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_93:
	mov	0x30, %r14
	.word 0xf6db8400  ! 2386: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbcbc0000  ! 2387: XNORcc_R	xnorcc 	%r16, %r0, %r30
	.word 0xf825c000  ! 2390: STW_R	stw	%r28, [%r23 + %r0]
T3_asi_reg_wr_121:
	mov	0x3c3, %r14
	.word 0xfaf38400  ! 2392: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T3_asi_reg_rd_94:
	mov	0x10, %r14
	.word 0xfadb8e40  ! 2393: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf8254000  ! 2394: STW_R	stw	%r28, [%r21 + %r0]
iob_intr_3_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_199), 16, 16)) -> intp(3, 0, 2)
T3_asi_reg_rd_95:
	mov	0x7, %r14
	.word 0xfedb8400  ! 2398: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xfc75a1d3  ! 2400: STX_I	stx	%r30, [%r22 + 0x01d3]
cpu_intr_3_193:
	setx	0x300136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb094c000  ! 2404: ORcc_R	orcc 	%r19, %r0, %r24
	ta	T_CHANGE_TO_TL0
	.word 0xb1641800  ! 2408: MOVcc_R	<illegal instruction>
	.word 0xb635a0a6  ! 2410: SUBC_I	orn 	%r22, 0x00a6, %r27
	.word 0xfea4c020  ! 2413: STWA_R	stwa	%r31, [%r19 + %r0] 0x01
iob_intr_3_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_200), 16, 16)) -> intp(3, 0, d)
iob_intr_3_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_201), 16, 16)) -> intp(3, 0, 30)
	.word 0xf8f5a1c5  ! 2418: STXA_I	stxa	%r28, [%r22 + 0x01c5] %asi
iob_intr_3_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_202), 16, 16)) -> intp(3, 0, b)
	.word 0xf2a5201e  ! 2421: STWA_I	stwa	%r25, [%r20 + 0x001e] %asi
iob_intr_3_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_203), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf4b5e100  ! 2423: STHA_I	stha	%r26, [%r23 + 0x0100] %asi
	.word 0xb17ce401  ! 2427: MOVR_I	movre	%r19, 0x1, %r24
	.word 0xf0358000  ! 2429: STH_R	sth	%r24, [%r22 + %r0]
	.word 0xf8b5c020  ! 2430: STHA_R	stha	%r28, [%r23 + %r0] 0x01
iob_intr_3_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_204), 16, 16)) -> intp(3, 0, 2)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6b5c020  ! 2434: STHA_R	stha	%r27, [%r23 + %r0] 0x01
T3_asi_reg_wr_122:
	mov	0x7, %r14
	.word 0xf4f38400  ! 2435: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf035e054  ! 2436: STH_I	sth	%r24, [%r23 + 0x0054]
iob_intr_3_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_205), 16, 16)) -> intp(3, 0, a)
T3_asi_reg_rd_96:
	mov	0x20, %r14
	.word 0xfcdb84a0  ! 2440: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T3_asi_reg_wr_123:
	mov	0x10, %r14
	.word 0xf8f389e0  ! 2441: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_3_194:
	setx	0x300108, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_206), 16, 16)) -> intp(3, 0, 13)
	.word 0xf0358000  ! 2444: STH_R	sth	%r24, [%r22 + %r0]
	.word 0xf8a421b9  ! 2445: STWA_I	stwa	%r28, [%r16 + 0x01b9] %asi
cpu_intr_3_195:
	setx	0x310305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2460f7  ! 2449: STW_I	stw	%r30, [%r17 + 0x00f7]
	ta	T_CHANGE_NONHPRIV
	.word 0xf4ad8020  ! 2455: STBA_R	stba	%r26, [%r22 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
	.word 0xbe8c20f2  ! 2457: ANDcc_I	andcc 	%r16, 0x00f2, %r31
T3_asi_reg_rd_97:
	mov	0x20, %r14
	.word 0xfadb8e80  ! 2458: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_3_196:
	setx	0x320006, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_197:
	setx	0x300027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42d8000  ! 2463: STB_R	stb	%r26, [%r22 + %r0]
T3_asi_reg_rd_98:
	mov	0x10, %r14
	.word 0xfadb8e80  ! 2464: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf4a58020  ! 2465: STWA_R	stwa	%r26, [%r22 + %r0] 0x01
T3_asi_reg_wr_124:
	mov	0x3c6, %r14
	.word 0xf0f38e40  ! 2466: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf02dc000  ! 2467: STB_R	stb	%r24, [%r23 + %r0]
cpu_intr_3_198:
	setx	0x31022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcb42110  ! 2473: ORNcc_I	orncc 	%r16, 0x0110, %r30
	.word 0xb42c0000  ! 2475: ANDN_R	andn 	%r16, %r0, %r26
T3_asi_reg_wr_125:
	mov	0x3c6, %r14
	.word 0xf6f389e0  ! 2477: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_3_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_207), 16, 16)) -> intp(3, 0, 1c)
	ta	T_CHANGE_TO_TL0
cpu_intr_3_199:
	setx	0x300030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc34c000  ! 2483: STH_R	sth	%r30, [%r19 + %r0]
	ta	T_CHANGE_NONHPRIV
	.word 0xfc34c000  ! 2487: STH_R	sth	%r30, [%r19 + %r0]
	.word 0xfa34a0f9  ! 2488: STH_I	sth	%r29, [%r18 + 0x00f9]
	ta	T_CHANGE_TO_TL1
	.word 0xf2758000  ! 2492: STX_R	stx	%r25, [%r22 + %r0]
T3_asi_reg_wr_126:
	mov	0x1e, %r14
	.word 0xfaf38e40  ! 2494: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_127:
	mov	0x38, %r14
	.word 0xf0f38e40  ! 2500: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf6ac2086  ! 2502: STBA_I	stba	%r27, [%r16 + 0x0086] %asi
	.word 0xf825e0be  ! 2503: STW_I	stw	%r28, [%r23 + 0x00be]
cpu_intr_3_200:
	setx	0x310019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8a44000  ! 2507: SUBcc_R	subcc 	%r17, %r0, %r28
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983b10  ! 2509: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b10, %hpstate
T3_asi_reg_rd_99:
	mov	0x23, %r14
	.word 0xf6db84a0  ! 2513: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbc8de1f8  ! 2517: ANDcc_I	andcc 	%r23, 0x01f8, %r30
	.word 0xba34603d  ! 2519: SUBC_I	orn 	%r17, 0x003d, %r29
	.word 0xf6ac616f  ! 2520: STBA_I	stba	%r27, [%r17 + 0x016f] %asi
cpu_intr_3_201:
	setx	0x320328, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_202:
	setx	0x330133, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_208), 16, 16)) -> intp(3, 0, a)
iob_intr_3_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_209), 16, 16)) -> intp(3, 0, 33)
	.word 0xf8a40020  ! 2528: STWA_R	stwa	%r28, [%r16 + %r0] 0x01
T3_asi_reg_wr_128:
	mov	0x6, %r14
	.word 0xf8f389e0  ! 2529: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T3_asi_reg_rd_100:
	mov	0x3c0, %r14
	.word 0xfcdb8e80  ! 2532: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	ta	T_CHANGE_TO_TL0
	.word 0xf6f5e149  ! 2535: STXA_I	stxa	%r27, [%r23 + 0x0149] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_210), 16, 16)) -> intp(3, 0, 37)
iob_intr_3_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_211), 16, 16)) -> intp(3, 0, 32)
	.word 0xf8a44020  ! 2541: STWA_R	stwa	%r28, [%r17 + %r0] 0x01
T3_asi_reg_rd_101:
	mov	0xc, %r14
	.word 0xfadb8e80  ! 2542: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_102:
	mov	0x2a, %r14
	.word 0xf4db8e40  ! 2544: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_203:
	setx	0x320003, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_212), 16, 16)) -> intp(3, 0, a)
	.word 0xf0adc020  ! 2548: STBA_R	stba	%r24, [%r23 + %r0] 0x01
T3_asi_reg_rd_103:
	mov	0x28, %r14
	.word 0xf6db8e80  ! 2549: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T3_asi_reg_wr_129:
	mov	0x3c6, %r14
	.word 0xf6f38400  ! 2552: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf8ad8020  ! 2553: STBA_R	stba	%r28, [%r22 + %r0] 0x01
	.word 0xf0f4a1d4  ! 2554: STXA_I	stxa	%r24, [%r18 + 0x01d4] %asi
cpu_intr_3_204:
	setx	0x300022, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_205:
	setx	0x320107, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_213), 16, 16)) -> intp(3, 0, 1c)
iob_intr_3_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_214), 16, 16)) -> intp(3, 0, 1c)
	.word 0xfe758000  ! 2559: STX_R	stx	%r31, [%r22 + %r0]
iob_intr_3_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_215), 16, 16)) -> intp(3, 0, 37)
iob_intr_3_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_216), 16, 16)) -> intp(3, 0, 3e)
	ta	T_CHANGE_HPRIV
iob_intr_3_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_217), 16, 16)) -> intp(3, 0, 6)
	.word 0xf8b54020  ! 2574: STHA_R	stha	%r28, [%r21 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_218), 16, 16)) -> intp(3, 0, b)
	.word 0xf4ad8020  ! 2581: STBA_R	stba	%r26, [%r22 + %r0] 0x01
	.word 0xf82de1dd  ! 2583: STB_I	stb	%r28, [%r23 + 0x01dd]
	.word 0xf8f461ee  ! 2584: STXA_I	stxa	%r28, [%r17 + 0x01ee] %asi
iob_intr_3_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_219), 16, 16)) -> intp(3, 0, 3a)
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983b8a  ! 2588: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b8a, %hpstate
T3_asi_reg_rd_104:
	mov	0x34, %r14
	.word 0xf0db89e0  ! 2592: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_3_206:
	setx	0x330131, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_207:
	setx	0x330015, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_130:
	mov	0x8, %r14
	.word 0xfaf38e80  ! 2597: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_3_208:
	setx	0x32003d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_220), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_209:
	setx	0x33030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2c8000  ! 2601: STB_R	stb	%r31, [%r18 + %r0]
	.word 0xbec44000  ! 2604: ADDCcc_R	addccc 	%r17, %r0, %r31
T3_asi_reg_rd_105:
	mov	0x8, %r14
	.word 0xf4db8e40  ! 2606: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_wr_131:
	mov	0x7, %r14
	.word 0xf0f38e40  ! 2609: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_221), 16, 16)) -> intp(3, 0, 33)
	.word 0xf0acc020  ! 2613: STBA_R	stba	%r24, [%r19 + %r0] 0x01
iob_intr_3_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_222), 16, 16)) -> intp(3, 0, 35)
	.word 0xfa34e1cc  ! 2619: STH_I	sth	%r29, [%r19 + 0x01cc]
iob_intr_3_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_223), 16, 16)) -> intp(3, 0, 3d)
	.word 0xfe754000  ! 2623: STX_R	stx	%r31, [%r21 + %r0]
cpu_intr_3_210:
	setx	0x300228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf634c000  ! 2625: STH_R	sth	%r27, [%r19 + %r0]
	.word 0xf6256012  ! 2626: STW_I	stw	%r27, [%r21 + 0x0012]
	.word 0xf4ac4020  ! 2627: STBA_R	stba	%r26, [%r17 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	.word 0xfc744000  ! 2629: STX_R	stx	%r30, [%r17 + %r0]
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_132:
	mov	0x3c2, %r14
	.word 0xfef38e40  ! 2634: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	.word 0xf2a5e157  ! 2639: STWA_I	stwa	%r25, [%r23 + 0x0157] %asi
	.word 0xfe35c000  ! 2640: STH_R	sth	%r31, [%r23 + %r0]
	.word 0xf8a50020  ! 2641: STWA_R	stwa	%r28, [%r20 + %r0] 0x01
iob_intr_3_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_224), 16, 16)) -> intp(3, 0, 3a)
	.word 0xfab58020  ! 2646: STHA_R	stha	%r29, [%r22 + %r0] 0x01
iob_intr_3_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_225), 16, 16)) -> intp(3, 0, 1c)
cpu_intr_3_211:
	setx	0x31000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf434c000  ! 2657: STH_R	sth	%r26, [%r19 + %r0]
	.word 0xf8b48020  ! 2660: STHA_R	stha	%r28, [%r18 + %r0] 0x01
T3_asi_reg_rd_106:
	mov	0xf, %r14
	.word 0xfcdb8400  ! 2667: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf6a5613a  ! 2670: STWA_I	stwa	%r27, [%r21 + 0x013a] %asi
	.word 0xbd3d3001  ! 2671: SRAX_I	srax	%r20, 0x0001, %r30
T3_asi_reg_wr_133:
	mov	0x3c6, %r14
	.word 0xfef38e40  ! 2672: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_3_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_226), 16, 16)) -> intp(3, 0, 28)
iob_intr_3_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_227), 16, 16)) -> intp(3, 0, 14)
iob_intr_3_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_228), 16, 16)) -> intp(3, 0, 6)
T3_asi_reg_wr_134:
	mov	0x3c5, %r14
	.word 0xf0f389e0  ! 2681: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_3_212:
	setx	0x320319, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_229), 16, 16)) -> intp(3, 0, 31)
iob_intr_3_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_230), 16, 16)) -> intp(3, 0, 3e)
	.word 0xb03c0000  ! 2686: XNOR_R	xnor 	%r16, %r0, %r24
iob_intr_3_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_231), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_213:
	setx	0x320012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe3de10e  ! 2692: XNOR_I	xnor 	%r23, 0x010e, %r31
iob_intr_3_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_232), 16, 16)) -> intp(3, 0, a)
	.word 0xf224604c  ! 2696: STW_I	stw	%r25, [%r17 + 0x004c]
iob_intr_3_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_233), 16, 16)) -> intp(3, 0, 19)
	.word 0xf22c4000  ! 2702: STB_R	stb	%r25, [%r17 + %r0]
	ta	T_CHANGE_TO_TL0
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983fc2  ! 2705: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc2, %hpstate
T3_asi_reg_rd_107:
	mov	0x38, %r14
	.word 0xfcdb8e80  ! 2707: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T3_asi_reg_wr_135:
	mov	0xb, %r14
	.word 0xf0f38e40  ! 2709: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T3_asi_reg_wr_136:
	mov	0x15, %r14
	.word 0xf4f389e0  ! 2712: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T3_asi_reg_rd_108:
	mov	0x6, %r14
	.word 0xf0db8e80  ! 2714: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_3_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_234), 16, 16)) -> intp(3, 0, 2c)
iob_intr_3_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_235), 16, 16)) -> intp(3, 0, 31)
	.word 0xfa240000  ! 2721: STW_R	stw	%r29, [%r16 + %r0]
cpu_intr_3_214:
	setx	0x32033c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_109:
	mov	0x3c4, %r14
	.word 0xfedb8400  ! 2724: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_3_215:
	setx	0x30020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4c5a0e4  ! 2728: ADDCcc_I	addccc 	%r22, 0x00e4, %r26
cpu_intr_3_216:
	setx	0x320133, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_110:
	mov	0x3, %r14
	.word 0xf0db8e40  ! 2730: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf2258000  ! 2731: STW_R	stw	%r25, [%r22 + %r0]
	.word 0xbe3d6000  ! 2736: XNOR_I	xnor 	%r21, 0x0000, %r31
cpu_intr_3_217:
	setx	0x300309, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_111:
	mov	0x20, %r14
	.word 0xf8db84a0  ! 2738: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T3_asi_reg_rd_112:
	mov	0x31, %r14
	.word 0xfcdb8e40  ! 2739: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_wr_137:
	mov	0x2d, %r14
	.word 0xf4f38e60  ! 2740: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xbabca04f  ! 2743: XNORcc_I	xnorcc 	%r18, 0x004f, %r29
cpu_intr_3_218:
	setx	0x300108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba8dc000  ! 2746: ANDcc_R	andcc 	%r23, %r0, %r29
iob_intr_3_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_236), 16, 16)) -> intp(3, 0, 2c)
cpu_intr_3_219:
	setx	0x33031a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_220:
	setx	0x31023c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_221:
	setx	0x330108, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_113:
	mov	0x30, %r14
	.word 0xfedb8e80  ! 2764: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_3_222:
	setx	0x33030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba8c0000  ! 2766: ANDcc_R	andcc 	%r16, %r0, %r29
	.word 0xf2344000  ! 2767: STH_R	sth	%r25, [%r17 + %r0]
	.word 0xf6b40020  ! 2770: STHA_R	stha	%r27, [%r16 + %r0] 0x01
cpu_intr_3_223:
	setx	0x36023d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_237), 16, 16)) -> intp(3, 0, 4)
iob_intr_3_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_238), 16, 16)) -> intp(3, 0, 2d)
T3_asi_reg_wr_138:
	mov	0x10, %r14
	.word 0xf6f38e40  ! 2775: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_3_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_239), 16, 16)) -> intp(3, 0, 5)
cpu_intr_3_224:
	setx	0x340131, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_139:
	mov	0x21, %r14
	.word 0xf4f384a0  ! 2783: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xfe24a14f  ! 2784: STW_I	stw	%r31, [%r18 + 0x014f]
T3_asi_reg_wr_140:
	mov	0x30, %r14
	.word 0xf2f38e40  ! 2786: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	ta	T_CHANGE_NONHPRIV
	.word 0xf275e15c  ! 2790: STX_I	stx	%r25, [%r23 + 0x015c]
iob_intr_3_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_240), 16, 16)) -> intp(3, 0, 6)
	ta	T_CHANGE_HPRIV
	.word 0xfca4a0e7  ! 2800: STWA_I	stwa	%r30, [%r18 + 0x00e7] %asi
	.word 0xfaf420d9  ! 2803: STXA_I	stxa	%r29, [%r16 + 0x00d9] %asi
T3_asi_reg_rd_114:
	mov	0x3c8, %r14
	.word 0xf2db8e80  ! 2804: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_3_225:
	setx	0x340232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a4e143  ! 2808: STWA_I	stwa	%r28, [%r19 + 0x0143] %asi
T3_asi_reg_wr_141:
	mov	0x3c5, %r14
	.word 0xf6f384a0  ! 2809: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xba348000  ! 2810: ORN_R	orn 	%r18, %r0, %r29
	.word 0xfe3461cc  ! 2813: STH_I	sth	%r31, [%r17 + 0x01cc]
	.word 0xf67460a6  ! 2818: STX_I	stx	%r27, [%r17 + 0x00a6]
	.word 0xfcb54020  ! 2820: STHA_R	stha	%r30, [%r21 + %r0] 0x01
	.word 0xb8150000  ! 2824: OR_R	or 	%r20, %r0, %r28
	.word 0xf0754000  ! 2825: STX_R	stx	%r24, [%r21 + %r0]
	.word 0xf475c000  ! 2826: STX_R	stx	%r26, [%r23 + %r0]
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982a50  ! 2827: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a50, %hpstate
iob_intr_3_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_241), 16, 16)) -> intp(3, 0, 30)
iob_intr_3_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_242), 16, 16)) -> intp(3, 0, 1d)
cpu_intr_3_226:
	setx	0x350324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc3421cd  ! 2833: STH_I	sth	%r30, [%r16 + 0x01cd]
cpu_intr_3_227:
	setx	0x350239, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_142:
	mov	0xa, %r14
	.word 0xf8f389e0  ! 2836: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf8a461b2  ! 2837: STWA_I	stwa	%r28, [%r17 + 0x01b2] %asi
	.word 0xf6b4e057  ! 2839: STHA_I	stha	%r27, [%r19 + 0x0057] %asi
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x819839ca  ! 2840: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19ca, %hpstate
iob_intr_3_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_243), 16, 16)) -> intp(3, 0, 2f)
	.word 0xb734e001  ! 2842: SRL_I	srl 	%r19, 0x0001, %r27
	.word 0xfcf4e021  ! 2843: STXA_I	stxa	%r30, [%r19 + 0x0021] %asi
T3_asi_reg_rd_115:
	mov	0x3c7, %r14
	.word 0xfedb8e80  ! 2844: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf224a1a0  ! 2845: STW_I	stw	%r25, [%r18 + 0x01a0]
cpu_intr_3_228:
	setx	0x350119, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_244), 16, 16)) -> intp(3, 0, b)
T3_asi_reg_wr_143:
	mov	0x35, %r14
	.word 0xfef38e40  ! 2850: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfea58020  ! 2851: STWA_R	stwa	%r31, [%r22 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf625e1af  ! 2855: STW_I	stw	%r27, [%r23 + 0x01af]
iob_intr_3_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_245), 16, 16)) -> intp(3, 0, f)
	.word 0xf6a50020  ! 2859: STWA_R	stwa	%r27, [%r20 + %r0] 0x01
T3_asi_reg_wr_144:
	mov	0x37, %r14
	.word 0xfaf38e40  ! 2862: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbe352030  ! 2864: ORN_I	orn 	%r20, 0x0030, %r31
	.word 0xf8750000  ! 2865: STX_R	stx	%r28, [%r20 + %r0]
	ta	T_CHANGE_TO_TL0
	.word 0xf2b52130  ! 2870: STHA_I	stha	%r25, [%r20 + 0x0130] %asi
	.word 0xfa2d8000  ! 2872: STB_R	stb	%r29, [%r22 + %r0]
	.word 0xfe240000  ! 2873: STW_R	stw	%r31, [%r16 + %r0]
	.word 0xfe340000  ! 2876: STH_R	sth	%r31, [%r16 + %r0]
	.word 0xf4adc020  ! 2879: STBA_R	stba	%r26, [%r23 + %r0] 0x01
cpu_intr_3_229:
	setx	0x37011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a50020  ! 2882: STWA_R	stwa	%r27, [%r20 + %r0] 0x01
T3_asi_reg_wr_145:
	mov	0x3c5, %r14
	.word 0xf4f38e60  ! 2886: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_3_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_246), 16, 16)) -> intp(3, 0, 38)
	.word 0xf2ad4020  ! 2889: STBA_R	stba	%r25, [%r21 + %r0] 0x01
iob_intr_3_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_247), 16, 16)) -> intp(3, 0, 37)
	.word 0xbe05e090  ! 2894: ADD_I	add 	%r23, 0x0090, %r31
	.word 0xfcac4020  ! 2896: STBA_R	stba	%r30, [%r17 + %r0] 0x01
	.word 0xf2354000  ! 2899: STH_R	sth	%r25, [%r21 + %r0]
	.word 0xf824a122  ! 2900: STW_I	stw	%r28, [%r18 + 0x0122]
T3_asi_reg_wr_146:
	mov	0xf, %r14
	.word 0xf2f38e60  ! 2901: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf0a5e0ba  ! 2902: STWA_I	stwa	%r24, [%r23 + 0x00ba] %asi
	.word 0xf22c8000  ! 2903: STB_R	stb	%r25, [%r18 + %r0]
	.word 0xf834a043  ! 2906: STH_I	sth	%r28, [%r18 + 0x0043]
T3_asi_reg_rd_116:
	mov	0x37, %r14
	.word 0xf0db84a0  ! 2907: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_3_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_248), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf2b5c020  ! 2909: STHA_R	stha	%r25, [%r23 + %r0] 0x01
T3_asi_reg_rd_117:
	mov	0x13, %r14
	.word 0xfadb89e0  ! 2910: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb3504000  ! 2912: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xf0a54020  ! 2914: STWA_R	stwa	%r24, [%r21 + %r0] 0x01
cpu_intr_3_230:
	setx	0x340032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf024c000  ! 2918: STW_R	stw	%r24, [%r19 + %r0]
T3_asi_reg_wr_147:
	mov	0x2f, %r14
	.word 0xf2f38e60  ! 2919: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf8b4e1f8  ! 2921: STHA_I	stha	%r28, [%r19 + 0x01f8] %asi
	.word 0xf0f5e1fe  ! 2923: STXA_I	stxa	%r24, [%r23 + 0x01fe] %asi
	.word 0xf0240000  ! 2924: STW_R	stw	%r24, [%r16 + %r0]
T3_asi_reg_wr_148:
	mov	0x20, %r14
	.word 0xfef38400  ! 2925: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbc256079  ! 2926: SUB_I	sub 	%r21, 0x0079, %r30
	.word 0xfaac614a  ! 2927: STBA_I	stba	%r29, [%r17 + 0x014a] %asi
iob_intr_3_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_249), 16, 16)) -> intp(3, 0, 14)
	.word 0xbc0d0000  ! 2932: AND_R	and 	%r20, %r0, %r30
T3_asi_reg_wr_149:
	mov	0x3c4, %r14
	.word 0xf6f38e80  ! 2933: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf4b52119  ! 2934: STHA_I	stha	%r26, [%r20 + 0x0119] %asi
	.word 0xf0b461c6  ! 2937: STHA_I	stha	%r24, [%r17 + 0x01c6] %asi
	.word 0xb4b56184  ! 2944: ORNcc_I	orncc 	%r21, 0x0184, %r26
iob_intr_3_250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_250), 16, 16)) -> intp(3, 0, 7)
T3_asi_reg_wr_150:
	mov	0x1e, %r14
	.word 0xfcf38e40  ! 2947: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T3_asi_reg_wr_151:
	mov	0x3c6, %r14
	.word 0xfef384a0  ! 2948: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T3_asi_reg_rd_118:
	mov	0x2d, %r14
	.word 0xf6db8e40  ! 2951: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_TO_TL0
iob_intr_3_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_251), 16, 16)) -> intp(3, 0, 25)
T3_asi_reg_rd_119:
	mov	0x3c3, %r14
	.word 0xfadb8e80  ! 2954: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T3_asi_reg_rd_120:
	mov	0x7, %r14
	.word 0xf8db89e0  ! 2955: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_3_231:
	setx	0x360315, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_232:
	setx	0x370322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ada180  ! 2963: STBA_I	stba	%r24, [%r22 + 0x0180] %asi
iob_intr_3_252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_252), 16, 16)) -> intp(3, 0, 5)
	.word 0xf6346013  ! 2965: STH_I	sth	%r27, [%r17 + 0x0013]
T3_asi_reg_wr_152:
	mov	0x3c1, %r14
	.word 0xfaf389e0  ! 2966: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_3_233:
	setx	0x350330, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
cpu_intr_3_234:
	setx	0x340231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b42083  ! 2975: STHA_I	stha	%r25, [%r16 + 0x0083] %asi
	ta	T_CHANGE_HPRIV
	.word 0xb22d4000  ! 2978: ANDN_R	andn 	%r21, %r0, %r25
	ta	T_CHANGE_TO_TL0
	.word 0xf22c2122  ! 2982: STB_I	stb	%r25, [%r16 + 0x0122]
	.word 0xb235c000  ! 2983: SUBC_R	orn 	%r23, %r0, %r25
	.word 0xb835618e  ! 2985: ORN_I	orn 	%r21, 0x018e, %r28
	.word 0xb00d0000  ! 2986: AND_R	and 	%r20, %r0, %r24
	ta	T_CHANGE_TO_TL0
	.word 0xbe35c000  ! 2992: ORN_R	orn 	%r23, %r0, %r31
	.word 0xfe3560a3  ! 2994: STH_I	sth	%r31, [%r21 + 0x00a3]
cpu_intr_3_235:
	setx	0x340017, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_121:
	mov	0x32, %r14
	.word 0xf4db8e60  ! 2998: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xfa7420aa  ! 2999: STX_I	stx	%r29, [%r16 + 0x00aa]
iob_intr_3_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_253), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_wr_153:
	mov	0x23, %r14
	.word 0xf0f38400  ! 3002: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf2b40020  ! 3007: STHA_R	stha	%r25, [%r16 + %r0] 0x01
	.word 0xfe2d0000  ! 3008: STB_R	stb	%r31, [%r20 + %r0]
iob_intr_3_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_254), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_rd_122:
	mov	0x3c6, %r14
	.word 0xfedb8e80  ! 3012: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T3_asi_reg_rd_123:
	mov	0x26, %r14
	.word 0xf8db89e0  ! 3016: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T3_asi_reg_rd_124:
	mov	0x21, %r14
	.word 0xf6db8e40  ! 3018: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_236:
	setx	0x360339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4758000  ! 3023: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xbaa5e012  ! 3024: SUBcc_I	subcc 	%r23, 0x0012, %r29
	.word 0x8395a1c5  ! 3025: WRPR_TNPC_I	wrpr	%r22, 0x01c5, %tnpc
	.word 0xb9643801  ! 3027: MOVcc_I	<illegal instruction>
iob_intr_3_255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_255), 16, 16)) -> intp(3, 0, 27)
	.word 0xfe744000  ! 3031: STX_R	stx	%r31, [%r17 + %r0]
	.word 0xb8350000  ! 3032: SUBC_R	orn 	%r20, %r0, %r28
iob_intr_3_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_256), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf034a1c7  ! 3035: STH_I	sth	%r24, [%r18 + 0x01c7]
iob_intr_3_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_257), 16, 16)) -> intp(3, 0, 7)
cpu_intr_3_237:
	setx	0x36003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_238:
	setx	0x34001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf22de1cb  ! 3048: STB_I	stb	%r25, [%r23 + 0x01cb]
	.word 0x81952183  ! 3050: WRPR_TPC_I	wrpr	%r20, 0x0183, %tpc
	.word 0xf6a54020  ! 3051: STWA_R	stwa	%r27, [%r21 + %r0] 0x01
cpu_intr_3_239:
	setx	0x370123, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_258), 16, 16)) -> intp(3, 0, 18)
	.word 0xf4744000  ! 3056: STX_R	stx	%r26, [%r17 + %r0]
iob_intr_3_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_259), 16, 16)) -> intp(3, 0, 35)
cpu_intr_3_240:
	setx	0x350139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe35e1e4  ! 3063: STH_I	sth	%r31, [%r23 + 0x01e4]
	.word 0xba85a11a  ! 3064: ADDcc_I	addcc 	%r22, 0x011a, %r29
cpu_intr_3_241:
	setx	0x37012e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_154:
	mov	0x32, %r14
	.word 0xfcf384a0  ! 3069: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T3_asi_reg_wr_155:
	mov	0x3c5, %r14
	.word 0xf4f389e0  ! 3070: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T3_asi_reg_wr_156:
	mov	0x3c5, %r14
	.word 0xfcf38e40  ! 3071: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_260), 16, 16)) -> intp(3, 0, 5)
	ta	T_CHANGE_TO_TL0
	.word 0xf2740000  ! 3074: STX_R	stx	%r25, [%r16 + %r0]
iob_intr_3_261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_261), 16, 16)) -> intp(3, 0, 2a)
cpu_intr_3_242:
	setx	0x370122, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_262), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf0b48020  ! 3081: STHA_R	stha	%r24, [%r18 + %r0] 0x01
	.word 0xf6740000  ! 3083: STX_R	stx	%r27, [%r16 + %r0]
cpu_intr_3_243:
	setx	0x37012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ac4020  ! 3087: STBA_R	stba	%r28, [%r17 + %r0] 0x01
T3_asi_reg_wr_157:
	mov	0x3c2, %r14
	.word 0xf0f38e60  ! 3088: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_3_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_263), 16, 16)) -> intp(3, 0, 4)
	.word 0xfeb44020  ! 3091: STHA_R	stha	%r31, [%r17 + %r0] 0x01
	.word 0xbb7d4400  ! 3092: MOVR_R	movre	%r21, %r0, %r29
cpu_intr_3_244:
	setx	0x350039, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_125:
	mov	0x38, %r14
	.word 0xf2db8e80  ! 3095: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_3_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_264), 16, 16)) -> intp(3, 0, 39)
iob_intr_3_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_265), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_rd_126:
	mov	0x2, %r14
	.word 0xf2db8e40  ! 3098: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T3_asi_reg_wr_158:
	mov	0x3c6, %r14
	.word 0xf8f384a0  ! 3099: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf635c000  ! 3100: STH_R	sth	%r27, [%r23 + %r0]
cpu_intr_3_245:
	setx	0x370009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf035e1e5  ! 3103: STH_I	sth	%r24, [%r23 + 0x01e5]
cpu_intr_3_246:
	setx	0x340139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf234214f  ! 3105: STH_I	sth	%r25, [%r16 + 0x014f]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_159:
	mov	0x25, %r14
	.word 0xfcf384a0  ! 3109: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_3_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_266), 16, 16)) -> intp(3, 0, 15)
T3_asi_reg_wr_160:
	mov	0x10, %r14
	.word 0xf2f38e40  ! 3115: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_3_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_267), 16, 16)) -> intp(3, 0, 1b)
	.word 0xfe2561bd  ! 3120: STW_I	stw	%r31, [%r21 + 0x01bd]
	.word 0xf87520b6  ! 3121: STX_I	stx	%r28, [%r20 + 0x00b6]
	.word 0xf674a0d8  ! 3129: STX_I	stx	%r27, [%r18 + 0x00d8]
T3_asi_reg_rd_127:
	mov	0x32, %r14
	.word 0xf8db89e0  ! 3130: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_3_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_268), 16, 16)) -> intp(3, 0, 17)
	.word 0xfcf5607e  ! 3134: STXA_I	stxa	%r30, [%r21 + 0x007e] %asi
	.word 0xfc25e044  ! 3135: STW_I	stw	%r30, [%r23 + 0x0044]
	.word 0xf42ce1ed  ! 3136: STB_I	stb	%r26, [%r19 + 0x01ed]
	.word 0xf235616b  ! 3138: STH_I	sth	%r25, [%r21 + 0x016b]
iob_intr_3_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_269), 16, 16)) -> intp(3, 0, 1)
	.word 0xfe350000  ! 3144: STH_R	sth	%r31, [%r20 + %r0]
T3_asi_reg_rd_128:
	mov	0x16, %r14
	.word 0xf4db84a0  ! 3145: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_3_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_270), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_wr_161:
	mov	0x17, %r14
	.word 0xf6f389e0  ! 3148: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_3_271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_271), 16, 16)) -> intp(3, 0, 2f)
	.word 0xfa25e06a  ! 3159: STW_I	stw	%r29, [%r23 + 0x006a]
T3_asi_reg_wr_162:
	mov	0x19, %r14
	.word 0xfef389e0  ! 3161: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf224c000  ! 3166: STW_R	stw	%r25, [%r19 + %r0]
	.word 0xf0b5c020  ! 3169: STHA_R	stha	%r24, [%r23 + %r0] 0x01
T3_asi_reg_rd_129:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 3171: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfeb5c020  ! 3178: STHA_R	stha	%r31, [%r23 + %r0] 0x01
	.word 0xfe2cc000  ! 3183: STB_R	stb	%r31, [%r19 + %r0]
	.word 0xfc3561c2  ! 3185: STH_I	sth	%r30, [%r21 + 0x01c2]
	.word 0xfc2ca11e  ! 3191: STB_I	stb	%r30, [%r18 + 0x011e]
	.word 0xf2a52130  ! 3192: STWA_I	stwa	%r25, [%r20 + 0x0130] %asi
	.word 0xfa2ca1fe  ! 3194: STB_I	stb	%r29, [%r18 + 0x01fe]
	.word 0xf2244000  ! 3195: STW_R	stw	%r25, [%r17 + %r0]
T3_asi_reg_rd_130:
	mov	0x3c8, %r14
	.word 0xf2db84a0  ! 3198: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb28d0000  ! 3200: ANDcc_R	andcc 	%r20, %r0, %r25
	.word 0xb044e1a1  ! 3201: ADDC_I	addc 	%r19, 0x01a1, %r24
	.word 0xfa252007  ! 3202: STW_I	stw	%r29, [%r20 + 0x0007]
	.word 0xfc74c000  ! 3204: STX_R	stx	%r30, [%r19 + %r0]
	.word 0xf02d4000  ! 3207: STB_R	stb	%r24, [%r21 + %r0]
iob_intr_3_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_272), 16, 16)) -> intp(3, 0, 13)
cpu_intr_3_247:
	setx	0x39031e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_248:
	setx	0x3b0233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8f460ab  ! 3212: STXA_I	stxa	%r28, [%r17 + 0x00ab] %asi
	.word 0xf834a1c1  ! 3215: STH_I	sth	%r28, [%r18 + 0x01c1]
	.word 0xf234613b  ! 3218: STH_I	sth	%r25, [%r17 + 0x013b]
	.word 0xf034c000  ! 3220: STH_R	sth	%r24, [%r19 + %r0]
iob_intr_3_273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_273), 16, 16)) -> intp(3, 0, 10)
T3_asi_reg_wr_163:
	mov	0xb, %r14
	.word 0xfef389e0  ! 3224: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0x91952081  ! 3225: WRPR_PIL_I	wrpr	%r20, 0x0081, %pil
T3_asi_reg_rd_131:
	mov	0x3c0, %r14
	.word 0xf0db8e40  ! 3231: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_wr_164:
	mov	0x36, %r14
	.word 0xf4f38e60  ! 3233: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xfa2420a4  ! 3234: STW_I	stw	%r29, [%r16 + 0x00a4]
T3_asi_reg_rd_132:
	mov	0x33, %r14
	.word 0xf0db89e0  ! 3239: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T3_asi_reg_wr_165:
	mov	0x27, %r14
	.word 0xfcf38e40  ! 3241: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf224215d  ! 3244: STW_I	stw	%r25, [%r16 + 0x015d]
iob_intr_3_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_274), 16, 16)) -> intp(3, 0, 2)
T3_asi_reg_wr_166:
	mov	0x3c4, %r14
	.word 0xf6f384a0  ! 3247: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_3_275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_275), 16, 16)) -> intp(3, 0, 7)
cpu_intr_3_249:
	setx	0x38000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab58020  ! 3254: STHA_R	stha	%r29, [%r22 + %r0] 0x01
	.word 0xf02c8000  ! 3255: STB_R	stb	%r24, [%r18 + %r0]
iob_intr_3_276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_276), 16, 16)) -> intp(3, 0, 0)
	.word 0xf4a46125  ! 3257: STWA_I	stwa	%r26, [%r17 + 0x0125] %asi
	.word 0x8d94615d  ! 3260: WRPR_PSTATE_I	wrpr	%r17, 0x015d, %pstate
iob_intr_3_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_277), 16, 16)) -> intp(3, 0, 9)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_133:
	mov	0x3c7, %r14
	.word 0xf4db8e60  ! 3265: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_3_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_278), 16, 16)) -> intp(3, 0, 3c)
	.word 0xfcf46164  ! 3273: STXA_I	stxa	%r30, [%r17 + 0x0164] %asi
	.word 0xfe350000  ! 3274: STH_R	sth	%r31, [%r20 + %r0]
	.word 0xb4b58000  ! 3275: SUBCcc_R	orncc 	%r22, %r0, %r26
T3_asi_reg_wr_167:
	mov	0x4, %r14
	.word 0xf4f389e0  ! 3282: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf0746013  ! 3283: STX_I	stx	%r24, [%r17 + 0x0013]
	.word 0xf824218f  ! 3285: STW_I	stw	%r28, [%r16 + 0x018f]
	.word 0xfc24c000  ! 3286: STW_R	stw	%r30, [%r19 + %r0]
cpu_intr_3_250:
	setx	0x380034, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_134:
	mov	0x27, %r14
	.word 0xf2db89e0  ! 3290: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_251:
	setx	0x3a0121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc7561ac  ! 3296: STX_I	stx	%r30, [%r21 + 0x01ac]
	.word 0xf2a40020  ! 3298: STWA_R	stwa	%r25, [%r16 + %r0] 0x01
	.word 0xb0b42064  ! 3299: ORNcc_I	orncc 	%r16, 0x0064, %r24
	.word 0xbcac0000  ! 3300: ANDNcc_R	andncc 	%r16, %r0, %r30
T3_asi_reg_wr_168:
	mov	0x3c3, %r14
	.word 0xfef38e40  ! 3303: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_rd_135:
	mov	0x33, %r14
	.word 0xf4db84a0  ! 3307: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_3_252:
	setx	0x39001e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_169:
	mov	0x3c7, %r14
	.word 0xf4f384a0  ! 3309: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_3_253:
	setx	0x3b003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf02ca09e  ! 3313: STB_I	stb	%r24, [%r18 + 0x009e]
T3_asi_reg_wr_170:
	mov	0x14, %r14
	.word 0xf0f38e60  ! 3318: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xf8a50020  ! 3319: STWA_R	stwa	%r28, [%r20 + %r0] 0x01
	.word 0xf4b46115  ! 3320: STHA_I	stha	%r26, [%r17 + 0x0115] %asi
cpu_intr_3_254:
	setx	0x39002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeac0020  ! 3327: STBA_R	stba	%r31, [%r16 + %r0] 0x01
	.word 0xf4ac0020  ! 3329: STBA_R	stba	%r26, [%r16 + %r0] 0x01
	.word 0xf4b5c020  ! 3333: STHA_R	stha	%r26, [%r23 + %r0] 0x01
T3_asi_reg_wr_171:
	mov	0x15, %r14
	.word 0xfef38e40  ! 3334: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfcac4020  ! 3335: STBA_R	stba	%r30, [%r17 + %r0] 0x01
	.word 0xbaadc000  ! 3336: ANDNcc_R	andncc 	%r23, %r0, %r29
	.word 0xfa75c000  ! 3341: STX_R	stx	%r29, [%r23 + %r0]
iob_intr_3_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_279), 16, 16)) -> intp(3, 0, 2f)
	.word 0xfea58020  ! 3344: STWA_R	stwa	%r31, [%r22 + %r0] 0x01
	.word 0xfe2de079  ! 3345: STB_I	stb	%r31, [%r23 + 0x0079]
	.word 0xb02d4000  ! 3346: ANDN_R	andn 	%r21, %r0, %r24
cpu_intr_3_255:
	setx	0x3a0338, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_256:
	setx	0x380320, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_280), 16, 16)) -> intp(3, 0, 38)
iob_intr_3_281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_281), 16, 16)) -> intp(3, 0, 39)
	.word 0xbcc42176  ! 3353: ADDCcc_I	addccc 	%r16, 0x0176, %r30
	.word 0xfcf461ad  ! 3354: STXA_I	stxa	%r30, [%r17 + 0x01ad] %asi
	.word 0xf02cc000  ! 3355: STB_R	stb	%r24, [%r19 + %r0]
iob_intr_3_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_282), 16, 16)) -> intp(3, 0, 2c)
	.word 0xb6b5a120  ! 3358: SUBCcc_I	orncc 	%r22, 0x0120, %r27
	.word 0xfa34c000  ! 3360: STH_R	sth	%r29, [%r19 + %r0]
T3_asi_reg_rd_136:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 3363: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfcb5e00f  ! 3365: STHA_I	stha	%r30, [%r23 + 0x000f] %asi
T3_asi_reg_rd_137:
	mov	0xa, %r14
	.word 0xf6db8e80  ! 3368: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_3_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_283), 16, 16)) -> intp(3, 0, 34)
cpu_intr_3_257:
	setx	0x390326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a54020  ! 3378: STWA_R	stwa	%r25, [%r21 + %r0] 0x01
T3_asi_reg_rd_138:
	mov	0x3c0, %r14
	.word 0xf2db8e40  ! 3381: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T3_asi_reg_wr_172:
	mov	0x3c7, %r14
	.word 0xf6f38e60  ! 3382: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xba0cc000  ! 3383: AND_R	and 	%r19, %r0, %r29
	.word 0xf0b5e15e  ! 3386: STHA_I	stha	%r24, [%r23 + 0x015e] %asi
	.word 0xf2b521ed  ! 3389: STHA_I	stha	%r25, [%r20 + 0x01ed] %asi
	.word 0xf2350000  ! 3393: STH_R	sth	%r25, [%r20 + %r0]
cpu_intr_3_258:
	setx	0x380118, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_259:
	setx	0x39031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf235a1aa  ! 3401: STH_I	sth	%r25, [%r22 + 0x01aa]
cpu_intr_3_260:
	setx	0x39020a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_284), 16, 16)) -> intp(3, 0, 6)
cpu_intr_3_261:
	setx	0x3b033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_285), 16, 16)) -> intp(3, 0, 7)
	.word 0xb13ca001  ! 3409: SRA_I	sra 	%r18, 0x0001, %r24
	.word 0xbc1d4000  ! 3411: XOR_R	xor 	%r21, %r0, %r30
	.word 0xbe9c8000  ! 3414: XORcc_R	xorcc 	%r18, %r0, %r31
	.word 0xfca5e0c3  ! 3415: STWA_I	stwa	%r30, [%r23 + 0x00c3] %asi
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983cc0  ! 3416: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc0, %hpstate
	.word 0xf6a561cb  ! 3417: STWA_I	stwa	%r27, [%r21 + 0x01cb] %asi
	.word 0xfe2c4000  ! 3418: STB_R	stb	%r31, [%r17 + %r0]
T3_asi_reg_rd_139:
	mov	0x3c0, %r14
	.word 0xfcdb8e80  ! 3420: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_3_262:
	setx	0x3b0302, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_263:
	setx	0x380233, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_173:
	mov	0x3c6, %r14
	.word 0xf2f38e80  ! 3427: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T3_asi_reg_rd_140:
	mov	0x3c0, %r14
	.word 0xf4db8e80  ! 3428: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T3_asi_reg_rd_141:
	mov	0x32, %r14
	.word 0xf6db8e40  ! 3430: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf235c000  ! 3431: STH_R	sth	%r25, [%r23 + %r0]
	.word 0xf4b521a8  ! 3435: STHA_I	stha	%r26, [%r20 + 0x01a8] %asi
	.word 0xfeb54020  ! 3436: STHA_R	stha	%r31, [%r21 + %r0] 0x01
	.word 0xf474a0c1  ! 3437: STX_I	stx	%r26, [%r18 + 0x00c1]
	.word 0xb3510000  ! 3441: RDPR_TICK	rdpr	%tick, %r25
T3_asi_reg_wr_174:
	mov	0x3c0, %r14
	.word 0xf4f38e40  ! 3443: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_3_264:
	setx	0x3b0218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62c8000  ! 3449: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xb414c000  ! 3454: OR_R	or 	%r19, %r0, %r26
T3_asi_reg_rd_142:
	mov	0x27, %r14
	.word 0xfadb8400  ! 3456: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_3_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_286), 16, 16)) -> intp(3, 0, 29)
	.word 0xf6a5c020  ! 3459: STWA_R	stwa	%r27, [%r23 + %r0] 0x01
iob_intr_3_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_287), 16, 16)) -> intp(3, 0, 15)
cpu_intr_3_265:
	setx	0x3b011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ac8020  ! 3466: STBA_R	stba	%r25, [%r18 + %r0] 0x01
	.word 0xf2a461e8  ! 3470: STWA_I	stwa	%r25, [%r17 + 0x01e8] %asi
cpu_intr_3_266:
	setx	0x380123, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_267:
	setx	0x204, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_268:
	setx	0x3a0238, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_143:
	mov	0x11, %r14
	.word 0xf2db84a0  ! 3477: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_3_269:
	setx	0x3a0235, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_288), 16, 16)) -> intp(3, 0, 26)
iob_intr_3_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_289), 16, 16)) -> intp(3, 0, 30)
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982d4a  ! 3493: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4a, %hpstate
	.word 0xb234c000  ! 3494: ORN_R	orn 	%r19, %r0, %r25
T3_asi_reg_rd_144:
	mov	0x3c0, %r14
	.word 0xfcdb8e80  ! 3495: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xfc35e0fb  ! 3496: STH_I	sth	%r30, [%r23 + 0x00fb]
	.word 0xfa24e033  ! 3497: STW_I	stw	%r29, [%r19 + 0x0033]
T3_asi_reg_rd_145:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 3499: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_wr_175:
	mov	0xa, %r14
	.word 0xf8f38e40  ! 3500: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf42d60c2  ! 3501: STB_I	stb	%r26, [%r21 + 0x00c2]
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982e4a  ! 3506: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e4a, %hpstate
	.word 0xf22d8000  ! 3514: STB_R	stb	%r25, [%r22 + %r0]
	.word 0xf4256166  ! 3516: STW_I	stw	%r26, [%r21 + 0x0166]
cpu_intr_3_270:
	setx	0x38013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ad2045  ! 3519: STBA_I	stba	%r27, [%r20 + 0x0045] %asi
	.word 0xfe24217b  ! 3521: STW_I	stw	%r31, [%r16 + 0x017b]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf62d219b  ! 3527: STB_I	stb	%r27, [%r20 + 0x019b]
iob_intr_3_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_290), 16, 16)) -> intp(3, 0, 5)
	.word 0xba25209e  ! 3529: SUB_I	sub 	%r20, 0x009e, %r29
cpu_intr_3_271:
	setx	0x390038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_291), 16, 16)) -> intp(3, 0, 34)
iob_intr_3_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_292), 16, 16)) -> intp(3, 0, 17)
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_146:
	mov	0x6, %r14
	.word 0xfedb8e40  ! 3543: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_272:
	setx	0x380121, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_147:
	mov	0x38, %r14
	.word 0xfadb8e80  ! 3546: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_3_293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_293), 16, 16)) -> intp(3, 0, 31)
	.word 0xb93c6001  ! 3549: SRA_I	sra 	%r17, 0x0001, %r28
T3_asi_reg_wr_176:
	mov	0x1d, %r14
	.word 0xfaf38e60  ! 3551: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf8b5c020  ! 3554: STHA_R	stha	%r28, [%r23 + %r0] 0x01
T3_asi_reg_wr_177:
	mov	0xe, %r14
	.word 0xf8f38e60  ! 3555: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xfc2de0c2  ! 3556: STB_I	stb	%r30, [%r23 + 0x00c2]
T3_asi_reg_rd_148:
	mov	0x3c0, %r14
	.word 0xfadb84a0  ! 3557: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T3_asi_reg_wr_178:
	mov	0x11, %r14
	.word 0xfcf38400  ! 3558: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_3_273:
	setx	0x380305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ade119  ! 3562: STBA_I	stba	%r26, [%r23 + 0x0119] %asi
cpu_intr_3_274:
	setx	0x380018, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_275:
	setx	0x39021f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_276:
	setx	0x3a022d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_179:
	mov	0xc, %r14
	.word 0xfcf389e0  ! 3569: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T3_asi_reg_wr_180:
	mov	0x18, %r14
	.word 0xf6f38400  ! 3572: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_3_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_294), 16, 16)) -> intp(3, 0, 20)
cpu_intr_3_277:
	setx	0x380034, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6b44020  ! 3579: STHA_R	stha	%r27, [%r17 + %r0] 0x01
cpu_intr_3_278:
	setx	0x3b002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62d0000  ! 3596: STB_R	stb	%r27, [%r20 + %r0]
	.word 0xbe2dc000  ! 3597: ANDN_R	andn 	%r23, %r0, %r31
	.word 0xfaf4e09b  ! 3599: STXA_I	stxa	%r29, [%r19 + 0x009b] %asi
	.word 0xfe3520cb  ! 3600: STH_I	sth	%r31, [%r20 + 0x00cb]
cpu_intr_3_279:
	setx	0x39033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcadc020  ! 3604: STBA_R	stba	%r30, [%r23 + %r0] 0x01
	.word 0xf0ac4020  ! 3606: STBA_R	stba	%r24, [%r17 + %r0] 0x01
	.word 0xf034e1aa  ! 3607: STH_I	sth	%r24, [%r19 + 0x01aa]
	.word 0xf02dc000  ! 3608: STB_R	stb	%r24, [%r23 + %r0]
	.word 0xf6a5a04b  ! 3612: STWA_I	stwa	%r27, [%r22 + 0x004b] %asi
	.word 0xfa2de1e4  ! 3613: STB_I	stb	%r29, [%r23 + 0x01e4]
iob_intr_3_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_295), 16, 16)) -> intp(3, 0, 14)
iob_intr_3_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_296), 16, 16)) -> intp(3, 0, 2f)
iob_intr_3_297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_297), 16, 16)) -> intp(3, 0, 1e)
cpu_intr_3_280:
	setx	0x39013a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_281:
	setx	0x3b0306, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_298), 16, 16)) -> intp(3, 0, 17)
	.word 0xf22c6194  ! 3623: STB_I	stb	%r25, [%r17 + 0x0194]
	ta	T_CHANGE_TO_TL0
cpu_intr_3_282:
	setx	0x3a013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_181:
	mov	0x3c8, %r14
	.word 0xf4f38400  ! 3632: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	ta	T_CHANGE_TO_TL0
	.word 0xb62d0000  ! 3635: ANDN_R	andn 	%r20, %r0, %r27
	.word 0xba05e0c4  ! 3638: ADD_I	add 	%r23, 0x00c4, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_299), 16, 16)) -> intp(3, 0, 3c)
	.word 0xbc9da03b  ! 3646: XORcc_I	xorcc 	%r22, 0x003b, %r30
iob_intr_3_300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_300), 16, 16)) -> intp(3, 0, 17)
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983e5a  ! 3649: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e5a, %hpstate
cpu_intr_3_283:
	setx	0x380208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe1ca12b  ! 3654: XOR_I	xor 	%r18, 0x012b, %r31
	.word 0xfe2d6089  ! 3658: STB_I	stb	%r31, [%r21 + 0x0089]
	.word 0xfaad8020  ! 3662: STBA_R	stba	%r29, [%r22 + %r0] 0x01
cpu_intr_3_284:
	setx	0x390018, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_301), 16, 16)) -> intp(3, 0, 13)
	ta	T_CHANGE_TO_TL0
	.word 0xfcb54020  ! 3670: STHA_R	stha	%r30, [%r21 + %r0] 0x01
T3_asi_reg_rd_149:
	mov	0x3c4, %r14
	.word 0xf6db8e60  ! 3675: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf074e0f0  ! 3676: STX_I	stx	%r24, [%r19 + 0x00f0]
cpu_intr_3_285:
	setx	0x3c0303, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_182:
	mov	0x17, %r14
	.word 0xf8f38e40  ! 3679: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfaa4218c  ! 3682: STWA_I	stwa	%r29, [%r16 + 0x018c] %asi
	.word 0xf6f42127  ! 3683: STXA_I	stxa	%r27, [%r16 + 0x0127] %asi
iob_intr_3_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_302), 16, 16)) -> intp(3, 0, e)
cpu_intr_3_286:
	setx	0x3c0338, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_287:
	setx	0x3f0337, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_303), 16, 16)) -> intp(3, 0, 12)
cpu_intr_3_288:
	setx	0x3c0234, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_304), 16, 16)) -> intp(3, 0, e)
iob_intr_3_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_305), 16, 16)) -> intp(3, 0, 3e)
T3_asi_reg_rd_150:
	mov	0xf, %r14
	.word 0xf0db89e0  ! 3696: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf0b5c020  ! 3700: STHA_R	stha	%r24, [%r23 + %r0] 0x01
iob_intr_3_306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_306), 16, 16)) -> intp(3, 0, d)
	.word 0xf82c2185  ! 3702: STB_I	stb	%r28, [%r16 + 0x0185]
T3_asi_reg_wr_183:
	mov	0x0, %r14
	.word 0xf6f38e60  ! 3704: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf2ac0020  ! 3707: STBA_R	stba	%r25, [%r16 + %r0] 0x01
iob_intr_3_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_307), 16, 16)) -> intp(3, 0, 35)
	.word 0xb9643801  ! 3709: MOVcc_I	<illegal instruction>
T3_asi_reg_rd_151:
	mov	0x1b, %r14
	.word 0xf2db8e80  ! 3710: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_3_289:
	setx	0x3d0315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb48020  ! 3712: STHA_R	stha	%r30, [%r18 + %r0] 0x01
iob_intr_3_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_308), 16, 16)) -> intp(3, 0, 6)
	.word 0xfeb40020  ! 3714: STHA_R	stha	%r31, [%r16 + %r0] 0x01
	.word 0xb5643801  ! 3715: MOVcc_I	<illegal instruction>
iob_intr_3_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_309), 16, 16)) -> intp(3, 0, 39)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfa7560bf  ! 3722: STX_I	stx	%r29, [%r21 + 0x00bf]
	.word 0xf2a5c020  ! 3727: STWA_R	stwa	%r25, [%r23 + %r0] 0x01
iob_intr_3_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_310), 16, 16)) -> intp(3, 0, 27)
	.word 0xb2bde0f2  ! 3731: XNORcc_I	xnorcc 	%r23, 0x00f2, %r25
	.word 0xfca50020  ! 3733: STWA_R	stwa	%r30, [%r20 + %r0] 0x01
	.word 0xf8f5a0ff  ! 3735: STXA_I	stxa	%r28, [%r22 + 0x00ff] %asi
iob_intr_3_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_311), 16, 16)) -> intp(3, 0, 39)
	.word 0xf42ca00e  ! 3743: STB_I	stb	%r26, [%r18 + 0x000e]
iob_intr_3_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_312), 16, 16)) -> intp(3, 0, 37)
	.word 0xf8b5e0bb  ! 3751: STHA_I	stha	%r28, [%r23 + 0x00bb] %asi
iob_intr_3_313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_313), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_rd_152:
	mov	0x3c3, %r14
	.word 0xf2db89e0  ! 3755: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_3_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_314), 16, 16)) -> intp(3, 0, 12)
	.word 0xfe240000  ! 3761: STW_R	stw	%r31, [%r16 + %r0]
T3_asi_reg_wr_184:
	mov	0x3c3, %r14
	.word 0xf0f389e0  ! 3763: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbab4a17a  ! 3766: ORNcc_I	orncc 	%r18, 0x017a, %r29
iob_intr_3_315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_315), 16, 16)) -> intp(3, 0, 34)
cpu_intr_3_290:
	setx	0x3c002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a44020  ! 3769: STWA_R	stwa	%r27, [%r17 + %r0] 0x01
	.word 0xf83460db  ! 3770: STH_I	sth	%r28, [%r17 + 0x00db]
cpu_intr_3_291:
	setx	0x3d0206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2cc000  ! 3779: STB_R	stb	%r30, [%r19 + %r0]
	.word 0xf234e086  ! 3780: STH_I	sth	%r25, [%r19 + 0x0086]
iob_intr_3_316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_316), 16, 16)) -> intp(3, 0, 1)
	.word 0xf024e1f5  ! 3784: STW_I	stw	%r24, [%r19 + 0x01f5]
	.word 0xfa75c000  ! 3785: STX_R	stx	%r29, [%r23 + %r0]
	.word 0xf274e018  ! 3790: STX_I	stx	%r25, [%r19 + 0x0018]
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_185:
	mov	0x3c2, %r14
	.word 0xf8f389e0  ! 3792: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf0b40020  ! 3793: STHA_R	stha	%r24, [%r16 + %r0] 0x01
iob_intr_3_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_317), 16, 16)) -> intp(3, 0, 9)
	.word 0xbd504000  ! 3797: RDPR_TNPC	rdpr	%tnpc, %r30
iob_intr_3_318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_318), 16, 16)) -> intp(3, 0, f)
	.word 0xb28ce167  ! 3800: ANDcc_I	andcc 	%r19, 0x0167, %r25
T3_asi_reg_rd_153:
	mov	0x0, %r14
	.word 0xfcdb89e0  ! 3801: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_3_292:
	setx	0x3d0337, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_293:
	setx	0x3d030c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_319), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_rd_154:
	mov	0x2f, %r14
	.word 0xf2db84a0  ! 3806: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb950c000  ! 3807: RDPR_TT	rdpr	%tt, %r28
	.word 0xf87561bd  ! 3811: STX_I	stx	%r28, [%r21 + 0x01bd]
cpu_intr_3_294:
	setx	0x3d0210, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_320), 16, 16)) -> intp(3, 0, 3c)
	.word 0xfaa48020  ! 3815: STWA_R	stwa	%r29, [%r18 + %r0] 0x01
	.word 0xfeb4e016  ! 3818: STHA_I	stha	%r31, [%r19 + 0x0016] %asi
cpu_intr_3_295:
	setx	0x3e0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983898  ! 3822: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1898, %hpstate
	ta	T_CHANGE_TO_TL0
	.word 0xfea4a125  ! 3827: STWA_I	stwa	%r31, [%r18 + 0x0125] %asi
	.word 0xbabd6015  ! 3828: XNORcc_I	xnorcc 	%r21, 0x0015, %r29
	.word 0xfcac61f3  ! 3829: STBA_I	stba	%r30, [%r17 + 0x01f3] %asi
T3_asi_reg_rd_155:
	mov	0x25, %r14
	.word 0xf0db8e40  ! 3830: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_wr_186:
	mov	0x3c3, %r14
	.word 0xfaf38e80  ! 3832: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xfc344000  ! 3835: STH_R	sth	%r30, [%r17 + %r0]
iob_intr_3_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_321), 16, 16)) -> intp(3, 0, 3c)
T3_asi_reg_wr_187:
	mov	0x27, %r14
	.word 0xf8f389e0  ! 3837: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T3_asi_reg_wr_188:
	mov	0x12, %r14
	.word 0xfcf389e0  ! 3840: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_3_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_322), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf4a5600f  ! 3843: STWA_I	stwa	%r26, [%r21 + 0x000f] %asi
	.word 0xf274c000  ! 3844: STX_R	stx	%r25, [%r19 + %r0]
iob_intr_3_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_323), 16, 16)) -> intp(3, 0, 1f)
	.word 0xb77c4400  ! 3848: MOVR_R	movre	%r17, %r0, %r27
T3_asi_reg_rd_156:
	mov	0x1d, %r14
	.word 0xfcdb8e40  ! 3856: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf62561c6  ! 3859: STW_I	stw	%r27, [%r21 + 0x01c6]
	.word 0xf6ad2130  ! 3865: STBA_I	stba	%r27, [%r20 + 0x0130] %asi
	.word 0xba34c000  ! 3867: ORN_R	orn 	%r19, %r0, %r29
cpu_intr_3_296:
	setx	0x3e0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2a48000  ! 3869: SUBcc_R	subcc 	%r18, %r0, %r25
iob_intr_3_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_324), 16, 16)) -> intp(3, 0, 21)
	.word 0xf2b52116  ! 3871: STHA_I	stha	%r25, [%r20 + 0x0116] %asi
	.word 0xfca5a071  ! 3872: STWA_I	stwa	%r30, [%r22 + 0x0071] %asi
iob_intr_3_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_325), 16, 16)) -> intp(3, 0, 3f)
	.word 0xfe74e010  ! 3878: STX_I	stx	%r31, [%r19 + 0x0010]
cpu_intr_3_297:
	setx	0x3f030d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_298:
	setx	0x3d0203, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_189:
	mov	0x35, %r14
	.word 0xfcf389e0  ! 3882: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_3_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_326), 16, 16)) -> intp(3, 0, 11)
	.word 0xfa2da0f8  ! 3887: STB_I	stb	%r29, [%r22 + 0x00f8]
	ta	T_CHANGE_NONHPRIV
	.word 0x8994a02e  ! 3891: WRPR_TICK_I	wrpr	%r18, 0x002e, %tick
T3_asi_reg_wr_190:
	mov	0x3c4, %r14
	.word 0xfcf38e40  ! 3896: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T3_asi_reg_wr_191:
	mov	0x3c6, %r14
	.word 0xfcf38e80  ! 3897: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf274c000  ! 3900: STX_R	stx	%r25, [%r19 + %r0]
T3_asi_reg_rd_157:
	mov	0x2b, %r14
	.word 0xfedb8e60  ! 3901: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_3_299:
	setx	0x3e0112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6f561cd  ! 3904: STXA_I	stxa	%r27, [%r21 + 0x01cd] %asi
T3_asi_reg_rd_158:
	mov	0x35, %r14
	.word 0xfadb8e40  ! 3906: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf6a56184  ! 3908: STWA_I	stwa	%r27, [%r21 + 0x0184] %asi
	.word 0xbe454000  ! 3909: ADDC_R	addc 	%r21, %r0, %r31
iob_intr_3_327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_327), 16, 16)) -> intp(3, 0, 31)
T3_asi_reg_rd_159:
	mov	0x31, %r14
	.word 0xf0db8e40  ! 3912: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_160:
	mov	0x1e, %r14
	.word 0xf0db8400  ! 3914: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_3_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_328), 16, 16)) -> intp(3, 0, 16)
	.word 0xf4a4219e  ! 3917: STWA_I	stwa	%r26, [%r16 + 0x019e] %asi
	ta	T_CHANGE_TO_TL1
iob_intr_3_329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_329), 16, 16)) -> intp(3, 0, 31)
iob_intr_3_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_330), 16, 16)) -> intp(3, 0, 34)
T3_asi_reg_wr_192:
	mov	0x3c1, %r14
	.word 0xf4f38e40  ! 3924: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T3_asi_reg_rd_161:
	mov	0x3c7, %r14
	.word 0xfedb8e80  ! 3925: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T3_asi_reg_wr_193:
	mov	0x3c7, %r14
	.word 0xfaf384a0  ! 3928: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xf2344000  ! 3929: STH_R	sth	%r25, [%r17 + %r0]
cpu_intr_3_300:
	setx	0x3e0216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfca50020  ! 3936: STWA_R	stwa	%r30, [%r20 + %r0] 0x01
T3_asi_reg_wr_194:
	mov	0x13, %r14
	.word 0xf4f384a0  ! 3938: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb32de001  ! 3940: SLL_I	sll 	%r23, 0x0001, %r25
T3_asi_reg_wr_195:
	mov	0x1d, %r14
	.word 0xfef38e80  ! 3942: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xfcb58020  ! 3945: STHA_R	stha	%r30, [%r22 + %r0] 0x01
	.word 0xf2b421d2  ! 3948: STHA_I	stha	%r25, [%r16 + 0x01d2] %asi
	.word 0xf475c000  ! 3950: STX_R	stx	%r26, [%r23 + %r0]
T3_asi_reg_wr_196:
	mov	0x3c5, %r14
	.word 0xf6f389e0  ! 3952: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb7643801  ! 3953: MOVcc_I	<illegal instruction>
T3_asi_reg_rd_162:
	mov	0xf, %r14
	.word 0xfadb84a0  ! 3954: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf4a50020  ! 3955: STWA_R	stwa	%r26, [%r20 + %r0] 0x01
	.word 0xbab5a007  ! 3957: ORNcc_I	orncc 	%r22, 0x0007, %r29
	.word 0xf62dc000  ! 3958: STB_R	stb	%r27, [%r23 + %r0]
T3_asi_reg_wr_197:
	mov	0x1, %r14
	.word 0xf6f38e40  ! 3960: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_331), 16, 16)) -> intp(3, 0, 17)
	.word 0xf6f420bd  ! 3972: STXA_I	stxa	%r27, [%r16 + 0x00bd] %asi
	.word 0xb73c1000  ! 3973: SRAX_R	srax	%r16, %r0, %r27
T3_asi_reg_rd_163:
	mov	0x29, %r14
	.word 0xfedb8e40  ! 3976: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_301:
	setx	0x3f013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a4a1d5  ! 3985: STWA_I	stwa	%r24, [%r18 + 0x01d5] %asi
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_302:
	setx	0x3c0119, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xb814e1b3  ! 3995: OR_I	or 	%r19, 0x01b3, %r28
	.word 0xf4ad4020  ! 3997: STBA_R	stba	%r26, [%r21 + %r0] 0x01
	.word 0xf0ac4020  ! 4000: STBA_R	stba	%r24, [%r17 + %r0] 0x01
iob_intr_3_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_332), 16, 16)) -> intp(3, 0, c)
	.word 0xf4f5206c  ! 4006: STXA_I	stxa	%r26, [%r20 + 0x006c] %asi
T3_asi_reg_wr_198:
	mov	0x11, %r14
	.word 0xf0f38e60  ! 4007: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xfe356182  ! 4013: STH_I	sth	%r31, [%r21 + 0x0182]
T3_asi_reg_rd_164:
	mov	0x10, %r14
	.word 0xfadb89e0  ! 4017: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T3_asi_reg_wr_199:
	mov	0x6, %r14
	.word 0xf6f384a0  ! 4018: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T3_asi_reg_wr_200:
	mov	0x4, %r14
	.word 0xf0f389e0  ! 4021: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T3_asi_reg_rd_165:
	mov	0x13, %r14
	.word 0xf8db8e40  ! 4026: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_303:
	setx	0x3c0308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0246110  ! 4030: STW_I	stw	%r24, [%r17 + 0x0110]
	.word 0xb0042008  ! 4033: ADD_I	add 	%r16, 0x0008, %r24
	.word 0xf8b48020  ! 4034: STHA_R	stha	%r28, [%r18 + %r0] 0x01
	.word 0xf6b50020  ! 4038: STHA_R	stha	%r27, [%r20 + %r0] 0x01
cpu_intr_3_304:
	setx	0x3f003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ac2097  ! 4045: STBA_I	stba	%r27, [%r16 + 0x0097] %asi
cpu_intr_3_305:
	setx	0x3d0314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcb5215c  ! 4050: SUBCcc_I	orncc 	%r20, 0x015c, %r30
T3_asi_reg_wr_201:
	mov	0x3c6, %r14
	.word 0xfef38400  ! 4052: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983c82  ! 4055: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c82, %hpstate
	.word 0xb2c4e014  ! 4059: ADDCcc_I	addccc 	%r19, 0x0014, %r25
cpu_intr_3_306:
	setx	0x3c0008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb625e0e9  ! 4061: SUB_I	sub 	%r23, 0x00e9, %r27
	.word 0xf0f560ea  ! 4064: STXA_I	stxa	%r24, [%r21 + 0x00ea] %asi
cpu_intr_3_307:
	setx	0x3d0031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_308:
	setx	0x3e0200, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_309:
	setx	0x3c0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb63ca015  ! 4069: XNOR_I	xnor 	%r18, 0x0015, %r27
	.word 0xf4acc020  ! 4071: STBA_R	stba	%r26, [%r19 + %r0] 0x01
iob_intr_3_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_333), 16, 16)) -> intp(3, 0, 24)
	.word 0xf22d206d  ! 4073: STB_I	stb	%r25, [%r20 + 0x006d]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_310:
	setx	0x3e0013, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_334), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_rd_166:
	mov	0x3c1, %r14
	.word 0xf2db8e40  ! 4081: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbc3de0ff  ! 4082: XNOR_I	xnor 	%r23, 0x00ff, %r30
T3_asi_reg_rd_167:
	mov	0x26, %r14
	.word 0xf0db84a0  ! 4085: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_3_311:
	setx	0x3f0131, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_168:
	mov	0x3c8, %r14
	.word 0xf4db84a0  ! 4089: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf8ada0f0  ! 4092: STBA_I	stba	%r28, [%r22 + 0x00f0] %asi
iob_intr_3_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_335), 16, 16)) -> intp(3, 0, 1e)
cpu_intr_3_312:
	setx	0x3d0013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbca44000  ! 4101: SUBcc_R	subcc 	%r17, %r0, %r30
	.word 0x8995a1a0  ! 4103: WRPR_TICK_I	wrpr	%r22, 0x01a0, %tick
cpu_intr_3_313:
	setx	0x3d0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2c61af  ! 4105: STB_I	stb	%r30, [%r17 + 0x01af]
T3_asi_reg_rd_169:
	mov	0x5, %r14
	.word 0xf4db8e40  ! 4106: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf6acc020  ! 4110: STBA_R	stba	%r27, [%r19 + %r0] 0x01
	.word 0xb294e109  ! 4112: ORcc_I	orcc 	%r19, 0x0109, %r25
	ta	T_CHANGE_HPRIV
	.word 0xfc74218b  ! 4117: STX_I	stx	%r30, [%r16 + 0x018b]
iob_intr_3_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_336), 16, 16)) -> intp(3, 0, 21)
	.word 0xf62c8000  ! 4123: STB_R	stb	%r27, [%r18 + %r0]
cpu_intr_3_314:
	setx	0x400001, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_315:
	setx	0x41031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa344000  ! 4127: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xf2b5e0a1  ! 4128: STHA_I	stha	%r25, [%r23 + 0x00a1] %asi
	.word 0xf435201e  ! 4130: STH_I	sth	%r26, [%r20 + 0x001e]
cpu_intr_3_316:
	setx	0x40031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2740000  ! 4132: STX_R	stx	%r25, [%r16 + %r0]
iob_intr_3_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_337), 16, 16)) -> intp(3, 0, 1c)
cpu_intr_3_317:
	setx	0x420201, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_318:
	setx	0x410322, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
cpu_intr_3_319:
	setx	0x40033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ada076  ! 4153: STBA_I	stba	%r24, [%r22 + 0x0076] %asi
	.word 0xb8bce0bc  ! 4155: XNORcc_I	xnorcc 	%r19, 0x00bc, %r28
	.word 0xfc2c4000  ! 4156: STB_R	stb	%r30, [%r17 + %r0]
	.word 0xf8a48020  ! 4157: STWA_R	stwa	%r28, [%r18 + %r0] 0x01
cpu_intr_3_320:
	setx	0x410014, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_202:
	mov	0x2b, %r14
	.word 0xf0f38e40  ! 4160: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb435c000  ! 4161: SUBC_R	orn 	%r23, %r0, %r26
iob_intr_3_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_338), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_rd_170:
	mov	0x2d, %r14
	.word 0xf0db8e40  ! 4165: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_wr_203:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 4169: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_3_321:
	setx	0x430003, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_339), 16, 16)) -> intp(3, 0, a)
	.word 0xfaac0020  ! 4177: STBA_R	stba	%r29, [%r16 + %r0] 0x01
iob_intr_3_340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_340), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_rd_171:
	mov	0x23, %r14
	.word 0xfadb8e80  ! 4180: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_3_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_341), 16, 16)) -> intp(3, 0, 3e)
	.word 0xbec5e02c  ! 4183: ADDCcc_I	addccc 	%r23, 0x002c, %r31
	.word 0xfe340000  ! 4184: STH_R	sth	%r31, [%r16 + %r0]
	.word 0xf82d4000  ! 4188: STB_R	stb	%r28, [%r21 + %r0]
	ta	T_CHANGE_TO_TL0
	.word 0xf8250000  ! 4190: STW_R	stw	%r28, [%r20 + %r0]
	ta	T_CHANGE_TO_TL1
	.word 0xbe8c4000  ! 4194: ANDcc_R	andcc 	%r17, %r0, %r31
T3_asi_reg_rd_172:
	mov	0x2c, %r14
	.word 0xfcdb8e80  ! 4200: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_3_322:
	setx	0x410104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb357001  ! 4205: SRLX_I	srlx	%r21, 0x0001, %r29
T3_asi_reg_wr_204:
	mov	0x27, %r14
	.word 0xfcf38e80  ! 4206: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_3_323:
	setx	0x41031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba05a128  ! 4209: ADD_I	add 	%r22, 0x0128, %r29
	.word 0xf2a421df  ! 4210: STWA_I	stwa	%r25, [%r16 + 0x01df] %asi
iob_intr_3_342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_342), 16, 16)) -> intp(3, 0, 11)
cpu_intr_3_324:
	setx	0x40032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8248000  ! 4215: STW_R	stw	%r28, [%r18 + %r0]
	.word 0xfcac8020  ! 4217: STBA_R	stba	%r30, [%r18 + %r0] 0x01
T3_asi_reg_rd_173:
	mov	0x32, %r14
	.word 0xf0db8e60  ! 4219: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T3_asi_reg_wr_205:
	mov	0x27, %r14
	.word 0xf0f38e40  ! 4221: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_325:
	setx	0x410131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbac46157  ! 4227: ADDCcc_I	addccc 	%r17, 0x0157, %r29
T3_asi_reg_wr_206:
	mov	0x10, %r14
	.word 0xfef389e0  ! 4229: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbe3d8000  ! 4230: XNOR_R	xnor 	%r22, %r0, %r31
T3_asi_reg_wr_207:
	mov	0x37, %r14
	.word 0xfef38400  ! 4233: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_3_343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_343), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_344), 16, 16)) -> intp(3, 0, 37)
iob_intr_3_345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_345), 16, 16)) -> intp(3, 0, d)
T3_asi_reg_rd_174:
	mov	0x28, %r14
	.word 0xfedb8e40  ! 4239: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_wr_208:
	mov	0xd, %r14
	.word 0xf8f38e40  ! 4241: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfcaca074  ! 4245: STBA_I	stba	%r30, [%r18 + 0x0074] %asi
	.word 0xf2b4e116  ! 4247: STHA_I	stha	%r25, [%r19 + 0x0116] %asi
	.word 0xf2ac21ba  ! 4248: STBA_I	stba	%r25, [%r16 + 0x01ba] %asi
	.word 0xfab50020  ! 4249: STHA_R	stha	%r29, [%r20 + %r0] 0x01
cpu_intr_3_326:
	setx	0x410138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb69460c8  ! 4252: ORcc_I	orcc 	%r17, 0x00c8, %r27
	.word 0xb22d0000  ! 4253: ANDN_R	andn 	%r20, %r0, %r25
	.word 0xb0c4e07d  ! 4254: ADDCcc_I	addccc 	%r19, 0x007d, %r24
	.word 0xfc2d0000  ! 4255: STB_R	stb	%r30, [%r20 + %r0]
T3_asi_reg_rd_175:
	mov	0x3c0, %r14
	.word 0xfedb8400  ! 4258: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf2242188  ! 4259: STW_I	stw	%r25, [%r16 + 0x0188]
	.word 0xf4b4e060  ! 4265: STHA_I	stha	%r26, [%r19 + 0x0060] %asi
	.word 0xf6ac8020  ! 4267: STBA_R	stba	%r27, [%r18 + %r0] 0x01
iob_intr_3_346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_346), 16, 16)) -> intp(3, 0, f)
	.word 0xb415c000  ! 4275: OR_R	or 	%r23, %r0, %r26
	ta	T_CHANGE_NONHPRIV
	.word 0xb234a1ed  ! 4278: ORN_I	orn 	%r18, 0x01ed, %r25
	.word 0xfe254000  ! 4279: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xf8f52096  ! 4280: STXA_I	stxa	%r28, [%r20 + 0x0096] %asi
T3_asi_reg_rd_176:
	mov	0xf, %r14
	.word 0xfedb8e40  ! 4281: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_3_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_347), 16, 16)) -> intp(3, 0, 33)
	.word 0xfa340000  ! 4285: STH_R	sth	%r29, [%r16 + %r0]
cpu_intr_3_327:
	setx	0x430205, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_177:
	mov	0x3c5, %r14
	.word 0xf8db8e80  ! 4290: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T3_asi_reg_wr_209:
	mov	0x14, %r14
	.word 0xfef38e40  ! 4296: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_3_328:
	setx	0x420231, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_348), 16, 16)) -> intp(3, 0, 1f)
iob_intr_3_349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_349), 16, 16)) -> intp(3, 0, f)
cpu_intr_3_329:
	setx	0x41003f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_210:
	mov	0x1, %r14
	.word 0xf0f38e40  ! 4303: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf0b40020  ! 4304: STHA_R	stha	%r24, [%r16 + %r0] 0x01
iob_intr_3_350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_350), 16, 16)) -> intp(3, 0, 3c)
iob_intr_3_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_351), 16, 16)) -> intp(3, 0, 39)
iob_intr_3_352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_352), 16, 16)) -> intp(3, 0, 34)
	.word 0xf0b58020  ! 4313: STHA_R	stha	%r24, [%r22 + %r0] 0x01
T3_asi_reg_wr_211:
	mov	0x3c8, %r14
	.word 0xf0f38e40  ! 4314: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfa240000  ! 4318: STW_R	stw	%r29, [%r16 + %r0]
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982f4a  ! 4320: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4a, %hpstate
	.word 0xf8a4c020  ! 4321: STWA_R	stwa	%r28, [%r19 + %r0] 0x01
T3_asi_reg_wr_212:
	mov	0x3c2, %r14
	.word 0xf0f38e60  ! 4323: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xf42de19f  ! 4324: STB_I	stb	%r26, [%r23 + 0x019f]
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982c90  ! 4329: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c90, %hpstate
	.word 0xf22d618c  ! 4330: STB_I	stb	%r25, [%r21 + 0x018c]
iob_intr_3_353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_353), 16, 16)) -> intp(3, 0, 29)
	ta	T_CHANGE_HPRIV
iob_intr_3_354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_354), 16, 16)) -> intp(3, 0, f)
T3_asi_reg_wr_213:
	mov	0x3c2, %r14
	.word 0xf0f38400  ! 4336: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb80ca119  ! 4337: AND_I	and 	%r18, 0x0119, %r28
T3_asi_reg_wr_214:
	mov	0x3c2, %r14
	.word 0xf6f38e60  ! 4338: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_3_355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_355), 16, 16)) -> intp(3, 0, 1)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9518000  ! 4344: RDPR_PSTATE	rdpr	%pstate, %r28
cpu_intr_3_330:
	setx	0x42012b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_331:
	setx	0x400325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62d4000  ! 4351: STB_R	stb	%r27, [%r21 + %r0]
	ta	T_CHANGE_TO_TL0
iob_intr_3_356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_356), 16, 16)) -> intp(3, 0, 2e)
	.word 0x8194a078  ! 4361: WRPR_TPC_I	wrpr	%r18, 0x0078, %tpc
	.word 0xf224e0f5  ! 4362: STW_I	stw	%r25, [%r19 + 0x00f5]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_215:
	mov	0x2b, %r14
	.word 0xfaf384a0  ! 4366: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982a42  ! 4367: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a42, %hpstate
cpu_intr_3_332:
	setx	0x410324, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_357), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_333:
	setx	0x43030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba344000  ! 4371: SUBC_R	orn 	%r17, %r0, %r29
	.word 0xfc75603d  ! 4373: STX_I	stx	%r30, [%r21 + 0x003d]
T3_asi_reg_rd_178:
	mov	0x17, %r14
	.word 0xf4db8e60  ! 4374: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T3_asi_reg_rd_179:
	mov	0xf, %r14
	.word 0xf8db8e40  ! 4379: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_334:
	setx	0x42031f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_180:
	mov	0x6, %r14
	.word 0xfadb8e40  ! 4386: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb7643801  ! 4391: MOVcc_I	<illegal instruction>
iob_intr_3_358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_358), 16, 16)) -> intp(3, 0, 3)
	.word 0x8d95a019  ! 4395: WRPR_PSTATE_I	wrpr	%r22, 0x0019, %pstate
iob_intr_3_359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_359), 16, 16)) -> intp(3, 0, 22)
	.word 0xb5345000  ! 4400: SRLX_R	srlx	%r17, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_360), 16, 16)) -> intp(3, 0, e)
	.word 0xfc74e198  ! 4404: STX_I	stx	%r30, [%r19 + 0x0198]
cpu_intr_3_335:
	setx	0x410302, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_216:
	mov	0x35, %r14
	.word 0xfef389e0  ! 4411: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xfeac0020  ! 4412: STBA_R	stba	%r31, [%r16 + %r0] 0x01
	.word 0xfa34218a  ! 4416: STH_I	sth	%r29, [%r16 + 0x018a]
	.word 0xbe0ca1b1  ! 4418: AND_I	and 	%r18, 0x01b1, %r31
	.word 0xfa24a103  ! 4421: STW_I	stw	%r29, [%r18 + 0x0103]
T3_asi_reg_wr_217:
	mov	0xd, %r14
	.word 0xf4f389e0  ! 4422: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_3_361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_361), 16, 16)) -> intp(3, 0, 39)
	.word 0xf2a56060  ! 4425: STWA_I	stwa	%r25, [%r21 + 0x0060] %asi
	.word 0xb13dd000  ! 4429: SRAX_R	srax	%r23, %r0, %r24
	.word 0xf22520a7  ! 4431: STW_I	stw	%r25, [%r20 + 0x00a7]
	.word 0xbc45a1ac  ! 4433: ADDC_I	addc 	%r22, 0x01ac, %r30
	.word 0xf2740000  ! 4434: STX_R	stx	%r25, [%r16 + %r0]
	.word 0xb2a5a0e0  ! 4435: SUBcc_I	subcc 	%r22, 0x00e0, %r25
T3_asi_reg_rd_181:
	mov	0x3, %r14
	.word 0xf2db89e0  ! 4438: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xf075a1a9  ! 4439: STX_I	stx	%r24, [%r22 + 0x01a9]
	.word 0xf034a13b  ! 4442: STH_I	sth	%r24, [%r18 + 0x013b]
	ta	T_CHANGE_TO_TL1
	.word 0xf62c2062  ! 4444: STB_I	stb	%r27, [%r16 + 0x0062]
T3_asi_reg_rd_182:
	mov	0x3c5, %r14
	.word 0xfadb89e0  ! 4445: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T3_asi_reg_wr_218:
	mov	0x3c5, %r14
	.word 0xf8f384a0  ! 4451: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_3_362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_362), 16, 16)) -> intp(3, 0, 2)
cpu_intr_3_336:
	setx	0x430016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82c20b0  ! 4455: STB_I	stb	%r28, [%r16 + 0x00b0]
	.word 0xb3504000  ! 4457: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xf2ac60d5  ! 4458: STBA_I	stba	%r25, [%r17 + 0x00d5] %asi
cpu_intr_3_337:
	setx	0x410237, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_3_338:
	setx	0x420310, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_219:
	mov	0x7, %r14
	.word 0xfef389e0  ! 4464: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_3_339:
	setx	0x410202, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_363), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_rd_183:
	mov	0x16, %r14
	.word 0xf6db8e40  ! 4475: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_wr_220:
	mov	0x26, %r14
	.word 0xf4f38e60  ! 4476: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb48de0a9  ! 4480: ANDcc_I	andcc 	%r23, 0x00a9, %r26
	.word 0xf82dc000  ! 4481: STB_R	stb	%r28, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf275e0af  ! 4485: STX_I	stx	%r25, [%r23 + 0x00af]
iob_intr_3_364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_364), 16, 16)) -> intp(3, 0, 1f)
cpu_intr_3_340:
	setx	0x420233, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf8344000  ! 4491: STH_R	sth	%r28, [%r17 + %r0]
	.word 0xf2a58020  ! 4493: STWA_R	stwa	%r25, [%r22 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
	.word 0xbb510000  ! 4498: RDPR_TICK	rdpr	%tick, %r29
iob_intr_3_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_365), 16, 16)) -> intp(3, 0, 23)
	.word 0xf8358000  ! 4504: STH_R	sth	%r28, [%r22 + %r0]
T3_asi_reg_rd_184:
	mov	0x29, %r14
	.word 0xfadb8e80  ! 4505: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xfca5c020  ! 4511: STWA_R	stwa	%r30, [%r23 + %r0] 0x01
	.word 0xf6a48020  ! 4512: STWA_R	stwa	%r27, [%r18 + %r0] 0x01
	.word 0xf4ad4020  ! 4513: STBA_R	stba	%r26, [%r21 + %r0] 0x01
T3_asi_reg_wr_221:
	mov	0x13, %r14
	.word 0xf8f38e40  ! 4514: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfaf5a1c2  ! 4515: STXA_I	stxa	%r29, [%r22 + 0x01c2] %asi
	.word 0xfe250000  ! 4516: STW_R	stw	%r31, [%r20 + %r0]
	.word 0xfa2dc000  ! 4517: STB_R	stb	%r29, [%r23 + %r0]
	.word 0xf0b58020  ! 4518: STHA_R	stha	%r24, [%r22 + %r0] 0x01
	.word 0xbe054000  ! 4519: ADD_R	add 	%r21, %r0, %r31
iob_intr_3_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_366), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf22c0000  ! 4523: STB_R	stb	%r25, [%r16 + %r0]
	.word 0xf8f42088  ! 4528: STXA_I	stxa	%r28, [%r16 + 0x0088] %asi
T3_asi_reg_wr_222:
	mov	0x3c2, %r14
	.word 0xfaf38e60  ! 4531: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbf51c000  ! 4532: RDPR_TL	<illegal instruction>
iob_intr_3_367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_367), 16, 16)) -> intp(3, 0, 1d)
cpu_intr_3_341:
	setx	0x430116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4750000  ! 4538: STX_R	stx	%r26, [%r20 + %r0]
T3_asi_reg_wr_223:
	mov	0x16, %r14
	.word 0xf8f38e40  ! 4540: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfab54020  ! 4543: STHA_R	stha	%r29, [%r21 + %r0] 0x01
T3_asi_reg_rd_185:
	mov	0x3c1, %r14
	.word 0xfcdb8400  ! 4544: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T3_asi_reg_wr_224:
	mov	0x3c3, %r14
	.word 0xf6f38e80  ! 4545: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_3_368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_368), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_342:
	setx	0x430324, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_343:
	setx	0x43021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb5a0e6  ! 4551: STHA_I	stha	%r31, [%r22 + 0x00e6] %asi
	.word 0xf8ad8020  ! 4554: STBA_R	stba	%r28, [%r22 + %r0] 0x01
cpu_intr_3_344:
	setx	0x410011, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_225:
	mov	0x2c, %r14
	.word 0xf8f38400  ! 4559: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_3_369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_369), 16, 16)) -> intp(3, 0, 24)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb0bc60fc  ! 4567: XNORcc_I	xnorcc 	%r17, 0x00fc, %r24
T3_asi_reg_wr_226:
	mov	0x3c3, %r14
	.word 0xfef384a0  ! 4568: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf425c000  ! 4569: STW_R	stw	%r26, [%r23 + %r0]
	.word 0xfe2461d7  ! 4573: STW_I	stw	%r31, [%r17 + 0x01d7]
	.word 0xb20d4000  ! 4574: AND_R	and 	%r21, %r0, %r25
iob_intr_3_370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_370), 16, 16)) -> intp(3, 0, 12)
	.word 0xb2c48000  ! 4577: ADDCcc_R	addccc 	%r18, %r0, %r25
iob_intr_3_371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_371), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf02ce027  ! 4580: STB_I	stb	%r24, [%r19 + 0x0027]
	.word 0xbd2d9000  ! 4581: SLLX_R	sllx	%r22, %r0, %r30
	.word 0xb3508000  ! 4582: RDPR_TSTATE	rdpr	%tstate, %r25
cpu_intr_3_345:
	setx	0x440235, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_227:
	mov	0x35, %r14
	.word 0xf2f389e0  ! 4585: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_3_346:
	setx	0x10, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe84e16f  ! 4587: ADDcc_I	addcc 	%r19, 0x016f, %r31
	.word 0xf6a5a185  ! 4591: STWA_I	stwa	%r27, [%r22 + 0x0185] %asi
T3_asi_reg_rd_186:
	mov	0x11, %r14
	.word 0xf8db8e60  ! 4593: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb434e16e  ! 4594: SUBC_I	orn 	%r19, 0x016e, %r26
	.word 0xf8aca0e6  ! 4595: STBA_I	stba	%r28, [%r18 + 0x00e6] %asi
	.word 0xb09c20f5  ! 4596: XORcc_I	xorcc 	%r16, 0x00f5, %r24
	.word 0xf2f560d0  ! 4597: STXA_I	stxa	%r25, [%r21 + 0x00d0] %asi
iob_intr_3_372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_372), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_wr_228:
	mov	0x3c5, %r14
	.word 0xf0f38e40  ! 4603: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbb504000  ! 4605: RDPR_TNPC	<illegal instruction>
T3_asi_reg_rd_187:
	mov	0x18, %r14
	.word 0xfadb8e80  ! 4607: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_3_347:
	setx	0x440004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0f560c7  ! 4611: STXA_I	stxa	%r24, [%r21 + 0x00c7] %asi
T3_asi_reg_wr_229:
	mov	0x22, %r14
	.word 0xf2f389e0  ! 4612: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb0244000  ! 4616: SUB_R	sub 	%r17, %r0, %r24
	.word 0xf2f4a138  ! 4617: STXA_I	stxa	%r25, [%r18 + 0x0138] %asi
	ta	T_CHANGE_HPRIV
	.word 0xf62d0000  ! 4621: STB_R	stb	%r27, [%r20 + %r0]
	.word 0xbd3ca001  ! 4622: SRA_I	sra 	%r18, 0x0001, %r30
iob_intr_3_373:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_373), 16, 16)) -> intp(3, 0, 26)
	.word 0xb53c3001  ! 4629: SRAX_I	srax	%r16, 0x0001, %r26
T3_asi_reg_wr_230:
	mov	0x19, %r14
	.word 0xfcf384a0  ! 4630: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T3_asi_reg_rd_188:
	mov	0x6, %r14
	.word 0xf2db84a0  ! 4631: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf6358000  ! 4632: STH_R	sth	%r27, [%r22 + %r0]
	.word 0xf4ad61f1  ! 4633: STBA_I	stba	%r26, [%r21 + 0x01f1] %asi
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983a52  ! 4634: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a52, %hpstate
	.word 0xf6a5a089  ! 4635: STWA_I	stwa	%r27, [%r22 + 0x0089] %asi
T3_asi_reg_rd_189:
	mov	0xd, %r14
	.word 0xf6db8e60  ! 4636: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T3_asi_reg_wr_231:
	mov	0x37, %r14
	.word 0xf8f384a0  ! 4637: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb014610d  ! 4639: OR_I	or 	%r17, 0x010d, %r24
iob_intr_3_374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_374), 16, 16)) -> intp(3, 0, 3e)
cpu_intr_3_348:
	setx	0x460104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa754000  ! 4646: STX_R	stx	%r29, [%r21 + %r0]
	.word 0xfab50020  ! 4647: STHA_R	stha	%r29, [%r20 + %r0] 0x01
cpu_intr_3_349:
	setx	0x46012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_3_375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_375), 16, 16)) -> intp(3, 0, 9)
cpu_intr_3_350:
	setx	0x47002a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_376), 16, 16)) -> intp(3, 0, 36)
T3_asi_reg_rd_190:
	mov	0x2, %r14
	.word 0xf4db89e0  ! 4654: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_3_351:
	setx	0x460319, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_352:
	setx	0x450101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb61de08b  ! 4659: XOR_I	xor 	%r23, 0x008b, %r27
iob_intr_3_377:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_377), 16, 16)) -> intp(3, 0, 33)
	.word 0xb93c4000  ! 4662: SRA_R	sra 	%r17, %r0, %r28
iob_intr_3_378:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_378), 16, 16)) -> intp(3, 0, 36)
	.word 0xb5504000  ! 4664: RDPR_TNPC	rdpr	%tnpc, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf8756082  ! 4666: STX_I	stx	%r28, [%r21 + 0x0082]
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982bd0  ! 4667: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd0, %hpstate
cpu_intr_3_353:
	setx	0x470117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf67421fe  ! 4670: STX_I	stx	%r27, [%r16 + 0x01fe]
T3_asi_reg_rd_191:
	mov	0x2d, %r14
	.word 0xfcdb8e80  ! 4673: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbcac0000  ! 4674: ANDNcc_R	andncc 	%r16, %r0, %r30
iob_intr_3_379:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_379), 16, 16)) -> intp(3, 0, e)
iob_intr_3_380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_380), 16, 16)) -> intp(3, 0, 17)
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983b98  ! 4677: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b98, %hpstate
	.word 0xb73c3001  ! 4678: SRAX_I	srax	%r16, 0x0001, %r27
T3_asi_reg_wr_232:
	mov	0x8, %r14
	.word 0xf8f38e80  ! 4680: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf835a0c3  ! 4681: STH_I	sth	%r28, [%r22 + 0x00c3]
T3_asi_reg_rd_192:
	mov	0x3c6, %r14
	.word 0xf0db8e80  ! 4684: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xfe754000  ! 4685: STX_R	stx	%r31, [%r21 + %r0]
cpu_intr_3_354:
	setx	0x450119, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982cd0  ! 4688: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd0, %hpstate
	.word 0xfcf5e080  ! 4691: STXA_I	stxa	%r30, [%r23 + 0x0080] %asi
	.word 0xb83c0000  ! 4693: XNOR_R	xnor 	%r16, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_355:
	setx	0x47021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba944000  ! 4698: ORcc_R	orcc 	%r17, %r0, %r29
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_193:
	mov	0x2e, %r14
	.word 0xf2db84a0  ! 4703: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T3_asi_reg_rd_194:
	mov	0x3c4, %r14
	.word 0xfedb8e40  ! 4706: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_wr_233:
	mov	0x3c3, %r14
	.word 0xf4f38e40  ! 4707: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
iob_intr_3_381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_381), 16, 16)) -> intp(3, 0, 3c)
iob_intr_3_382:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_382), 16, 16)) -> intp(3, 0, 24)
	.word 0xf8f4e150  ! 4718: STXA_I	stxa	%r28, [%r19 + 0x0150] %asi
iob_intr_3_383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_383), 16, 16)) -> intp(3, 0, 37)
	ta	T_CHANGE_NONHPRIV
iob_intr_3_384:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_384), 16, 16)) -> intp(3, 0, 23)
	.word 0xf6f5a1a6  ! 4725: STXA_I	stxa	%r27, [%r22 + 0x01a6] %asi
iob_intr_3_385:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_385), 16, 16)) -> intp(3, 0, 31)
	.word 0xf8a5a16c  ! 4729: STWA_I	stwa	%r28, [%r22 + 0x016c] %asi
T3_asi_reg_rd_195:
	mov	0x12, %r14
	.word 0xf2db8e40  ! 4730: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbe14a16d  ! 4731: OR_I	or 	%r18, 0x016d, %r31
	.word 0xfaf5612f  ! 4733: STXA_I	stxa	%r29, [%r21 + 0x012f] %asi
cpu_intr_3_356:
	setx	0x440032, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_357:
	setx	0x460304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_386:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_386), 16, 16)) -> intp(3, 0, 32)
T3_asi_reg_wr_234:
	mov	0x3c1, %r14
	.word 0xfef384a0  ! 4737: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T3_asi_reg_rd_196:
	mov	0xa, %r14
	.word 0xf0db8400  ! 4740: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T3_asi_reg_wr_235:
	mov	0x15, %r14
	.word 0xf2f38e40  ! 4741: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf6a58020  ! 4742: STWA_R	stwa	%r27, [%r22 + %r0] 0x01
iob_intr_3_387:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_387), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_rd_197:
	mov	0x3c2, %r14
	.word 0xf8db8e60  ! 4747: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_3_388:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_388), 16, 16)) -> intp(3, 0, 0)
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x8198391a  ! 4753: WRHPR_HPSTATE_I	wrhpr	%r0, 0x191a, %hpstate
	.word 0xfea56051  ! 4754: STWA_I	stwa	%r31, [%r21 + 0x0051] %asi
	.word 0xfa2c8000  ! 4757: STB_R	stb	%r29, [%r18 + %r0]
iob_intr_3_389:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_389), 16, 16)) -> intp(3, 0, 12)
	.word 0xbec54000  ! 4761: ADDCcc_R	addccc 	%r21, %r0, %r31
cpu_intr_3_358:
	setx	0x460216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6adc020  ! 4763: STBA_R	stba	%r27, [%r23 + %r0] 0x01
iob_intr_3_390:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_390), 16, 16)) -> intp(3, 0, 3a)
iob_intr_3_391:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_391), 16, 16)) -> intp(3, 0, 12)
	.word 0xfeb4e1f0  ! 4768: STHA_I	stha	%r31, [%r19 + 0x01f0] %asi
iob_intr_3_392:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_392), 16, 16)) -> intp(3, 0, 15)
T3_asi_reg_wr_236:
	mov	0x3c2, %r14
	.word 0xf6f38400  ! 4771: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf6a44020  ! 4773: STWA_R	stwa	%r27, [%r17 + %r0] 0x01
	.word 0xfe2cc000  ! 4778: STB_R	stb	%r31, [%r19 + %r0]
	.word 0xbf3c1000  ! 4779: SRAX_R	srax	%r16, %r0, %r31
	.word 0xfea58020  ! 4780: STWA_R	stwa	%r31, [%r22 + %r0] 0x01
	.word 0xfef560e1  ! 4784: STXA_I	stxa	%r31, [%r21 + 0x00e1] %asi
cpu_intr_3_359:
	setx	0x470102, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_237:
	mov	0x19, %r14
	.word 0xf0f38e60  ! 4789: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xf0246170  ! 4792: STW_I	stw	%r24, [%r17 + 0x0170]
iob_intr_3_393:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_393), 16, 16)) -> intp(3, 0, 1d)
	.word 0xfc75c000  ! 4797: STX_R	stx	%r30, [%r23 + %r0]
cpu_intr_3_360:
	setx	0x470028, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983d40  ! 4801: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d40, %hpstate
cpu_intr_3_361:
	setx	0x46000b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_362:
	setx	0x45032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_363:
	setx	0x450138, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983a10  ! 4814: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a10, %hpstate
T3_asi_reg_wr_238:
	mov	0x3c3, %r14
	.word 0xf2f38e80  ! 4815: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf62c61ce  ! 4816: STB_I	stb	%r27, [%r17 + 0x01ce]
cpu_intr_3_364:
	setx	0x440122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0f4a1eb  ! 4820: STXA_I	stxa	%r24, [%r18 + 0x01eb] %asi
	.word 0xf0344000  ! 4823: STH_R	sth	%r24, [%r17 + %r0]
cpu_intr_3_365:
	setx	0x44002a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_394:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_394), 16, 16)) -> intp(3, 0, 18)
	.word 0xf425612a  ! 4826: STW_I	stw	%r26, [%r21 + 0x012a]
	.word 0xf8240000  ! 4828: STW_R	stw	%r28, [%r16 + %r0]
cpu_intr_3_366:
	setx	0x460026, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_367:
	setx	0x47012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982a12  ! 4838: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a12, %hpstate
	.word 0xf275a1c8  ! 4840: STX_I	stx	%r25, [%r22 + 0x01c8]
	.word 0xfe258000  ! 4841: STW_R	stw	%r31, [%r22 + %r0]
cpu_intr_3_368:
	setx	0x47011d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_369:
	setx	0x460132, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_239:
	mov	0x3c2, %r14
	.word 0xf2f38e40  ! 4851: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_3_370:
	setx	0x460036, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_395:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_395), 16, 16)) -> intp(3, 0, d)
	.word 0xf22d20d2  ! 4860: STB_I	stb	%r25, [%r20 + 0x00d2]
	.word 0xf2a5e103  ! 4862: STWA_I	stwa	%r25, [%r23 + 0x0103] %asi
cpu_intr_3_371:
	setx	0x46000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xb12dc000  ! 4866: SLL_R	sll 	%r23, %r0, %r24
	.word 0xf2f52140  ! 4868: STXA_I	stxa	%r25, [%r20 + 0x0140] %asi
T3_asi_reg_rd_198:
	mov	0x1f, %r14
	.word 0xfcdb8e60  ! 4869: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_199:
	mov	0x21, %r14
	.word 0xf2db8e60  ! 4871: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xfaadc020  ! 4872: STBA_R	stba	%r29, [%r23 + %r0] 0x01
iob_intr_3_396:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_396), 16, 16)) -> intp(3, 0, 3c)
	.word 0xb33d3001  ! 4874: SRAX_I	srax	%r20, 0x0001, %r25
	.word 0xf0756082  ! 4875: STX_I	stx	%r24, [%r21 + 0x0082]
iob_intr_3_397:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_397), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_rd_200:
	mov	0x19, %r14
	.word 0xfadb84a0  ! 4877: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_3_398:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_398), 16, 16)) -> intp(3, 0, 16)
	.word 0xf4b5a093  ! 4879: STHA_I	stha	%r26, [%r22 + 0x0093] %asi
	.word 0xf8a40020  ! 4880: STWA_R	stwa	%r28, [%r16 + %r0] 0x01
iob_intr_3_399:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_399), 16, 16)) -> intp(3, 0, 29)
	ta	T_CHANGE_TO_TL0
cpu_intr_3_372:
	setx	0x440013, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_400:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_400), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_wr_240:
	mov	0x7, %r14
	.word 0xf0f38e60  ! 4892: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xfe344000  ! 4893: STH_R	sth	%r31, [%r17 + %r0]
T3_asi_reg_rd_201:
	mov	0x1b, %r14
	.word 0xf0db8e40  ! 4897: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf225a13d  ! 4898: STW_I	stw	%r25, [%r22 + 0x013d]
	.word 0xb6040000  ! 4900: ADD_R	add 	%r16, %r0, %r27
	.word 0xfeb4a1b6  ! 4901: STHA_I	stha	%r31, [%r18 + 0x01b6] %asi
iob_intr_3_401:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_401), 16, 16)) -> intp(3, 0, 1d)
	.word 0xfcaca156  ! 4911: STBA_I	stba	%r30, [%r18 + 0x0156] %asi
	.word 0xb6c5c000  ! 4916: ADDCcc_R	addccc 	%r23, %r0, %r27
T3_asi_reg_wr_241:
	mov	0x3c0, %r14
	.word 0xfaf38400  ! 4917: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf075c000  ! 4919: STX_R	stx	%r24, [%r23 + %r0]
	.word 0xf22d6183  ! 4920: STB_I	stb	%r25, [%r21 + 0x0183]
	.word 0xb73c4000  ! 4921: SRA_R	sra 	%r17, %r0, %r27
	.word 0xbf347001  ! 4925: SRLX_I	srlx	%r17, 0x0001, %r31
iob_intr_3_402:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_402), 16, 16)) -> intp(3, 0, 15)
T3_asi_reg_wr_242:
	mov	0x3c7, %r14
	.word 0xfcf38e40  ! 4927: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_403:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_403), 16, 16)) -> intp(3, 0, 1a)
T3_asi_reg_rd_202:
	mov	0x3c3, %r14
	.word 0xfedb8e40  ! 4932: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf4aca199  ! 4933: STBA_I	stba	%r26, [%r18 + 0x0199] %asi
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf8a54020  ! 4935: STWA_R	stwa	%r28, [%r21 + %r0] 0x01
cpu_intr_3_373:
	setx	0x470119, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_203:
	mov	0x28, %r14
	.word 0xf2db8400  ! 4937: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf23421f5  ! 4938: STH_I	sth	%r25, [%r16 + 0x01f5]
	.word 0xf6ac60a4  ! 4940: STBA_I	stba	%r27, [%r17 + 0x00a4] %asi
iob_intr_3_404:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_404), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf4358000  ! 4944: STH_R	sth	%r26, [%r22 + %r0]
	.word 0xf2b44020  ! 4948: STHA_R	stha	%r25, [%r17 + %r0] 0x01
	.word 0xbb641800  ! 4950: MOVcc_R	<illegal instruction>
cpu_intr_3_374:
	setx	0x44023c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_204:
	mov	0x14, %r14
	.word 0xf4db84a0  ! 4955: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T3_asi_reg_rd_205:
	mov	0xf, %r14
	.word 0xf4db8400  ! 4956: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T3_asi_reg_rd_206:
	mov	0x27, %r14
	.word 0xfcdb8e60  ! 4957: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf0aca1c5  ! 4959: STBA_I	stba	%r24, [%r18 + 0x01c5] %asi
	.word 0xf22461a3  ! 4963: STW_I	stw	%r25, [%r17 + 0x01a3]
iob_intr_3_405:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_405), 16, 16)) -> intp(3, 0, c)
	.word 0xfca5e1c1  ! 4969: STWA_I	stwa	%r30, [%r23 + 0x01c1] %asi
iob_intr_3_406:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_406), 16, 16)) -> intp(3, 0, 17)
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_207:
	mov	0x3c4, %r14
	.word 0xf8db8e80  ! 4978: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_3_407:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_407), 16, 16)) -> intp(3, 0, 9)
	.word 0xf4358000  ! 4984: STH_R	sth	%r26, [%r22 + %r0]
cpu_intr_3_375:
	setx	0x450108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a56112  ! 4989: STWA_I	stwa	%r24, [%r21 + 0x0112] %asi
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982cd0  ! 4990: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd0, %hpstate
	.word 0xfcb560ae  ! 4991: STHA_I	stha	%r30, [%r21 + 0x00ae] %asi
	.word 0xf8adc020  ! 4994: STBA_R	stba	%r28, [%r23 + %r0] 0x01
	.word 0xfaa48020  ! 4995: STWA_R	stwa	%r29, [%r18 + %r0] 0x01
	.word 0xf8ad60fe  ! 4996: STBA_I	stba	%r28, [%r21 + 0x00fe] %asi
cpu_intr_3_376:
	setx	0x44032d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_408:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_408), 16, 16)) -> intp(3, 0, 27)
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
	.word 0xf0d4e0cd  ! 1: LDSHA_I	ldsha	[%r19, + 0x00cd] %asi, %r24
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983ac8  ! 2: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ac8, %hpstate
cpu_intr_2_0:
	setx	0x1b003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfed52118  ! 8: LDSHA_I	ldsha	[%r20, + 0x0118] %asi, %r31
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983ec0  ! 9: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec0, %hpstate
iob_intr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_0), 16, 16)) -> intp(2, 0, 38)
cpu_intr_2_1:
	setx	0x1f0330, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_0:
	mov	0x28, %r14
	.word 0xfaf384a0  ! 15: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_1), 16, 16)) -> intp(2, 0, 38)
T2_asi_reg_rd_0:
	mov	0x3c0, %r14
	.word 0xfedb84a0  ! 17: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T2_asi_reg_wr_1:
	mov	0x3c3, %r14
	.word 0xf8f38400  ! 18: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_2), 16, 16)) -> intp(2, 0, c)
	.word 0xfc04a022  ! 22: LDUW_I	lduw	[%r18 + 0x0022], %r30
	.word 0xf68d61b7  ! 24: LDUBA_I	lduba	[%r21, + 0x01b7] %asi, %r27
	.word 0xf6dc21f9  ! 25: LDXA_I	ldxa	[%r16, + 0x01f9] %asi, %r27
T2_asi_reg_wr_2:
	mov	0xc, %r14
	.word 0xf0f38e80  ! 26: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T2_asi_reg_wr_3:
	mov	0x3c4, %r14
	.word 0xf8f38e80  ! 27: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_2_2:
	setx	0x1e0022, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_3), 16, 16)) -> intp(2, 0, 3a)
	ta	T_CHANGE_TO_TL1
iob_intr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_4), 16, 16)) -> intp(2, 0, 27)
cpu_intr_2_3:
	setx	0x1e0326, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_5), 16, 16)) -> intp(2, 0, 3f)
	.word 0xb5354000  ! 44: SRL_R	srl 	%r21, %r0, %r26
	.word 0xf0d42055  ! 47: LDSHA_I	ldsha	[%r16, + 0x0055] %asi, %r24
iob_intr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_6), 16, 16)) -> intp(2, 0, 2b)
	.word 0x8d94a1f2  ! 53: WRPR_PSTATE_I	wrpr	%r18, 0x01f2, %pstate
iob_intr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_7), 16, 16)) -> intp(2, 0, 0)
	.word 0xfe4d0000  ! 58: LDSB_R	ldsb	[%r20 + %r0], %r31
iob_intr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_8), 16, 16)) -> intp(2, 0, 10)
cpu_intr_2_4:
	setx	0x1d0003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4dda00b  ! 66: LDXA_I	ldxa	[%r22, + 0x000b] %asi, %r26
cpu_intr_2_5:
	setx	0x1e0033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe44e184  ! 68: LDSW_I	ldsw	[%r19 + 0x0184], %r31
	.word 0xfa550000  ! 69: LDSH_R	ldsh	[%r20 + %r0], %r29
iob_intr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_9), 16, 16)) -> intp(2, 0, 2a)
T2_asi_reg_rd_1:
	mov	0x25, %r14
	.word 0xf2db8e60  ! 72: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbea48000  ! 74: SUBcc_R	subcc 	%r18, %r0, %r31
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_2:
	mov	0x24, %r14
	.word 0xf8db84a0  ! 80: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xba9c20b5  ! 81: XORcc_I	xorcc 	%r16, 0x00b5, %r29
cpu_intr_2_6:
	setx	0x1f022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28c20ee  ! 84: ANDcc_I	andcc 	%r16, 0x00ee, %r25
	.word 0xf4052131  ! 85: LDUW_I	lduw	[%r20 + 0x0131], %r26
iob_intr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_10), 16, 16)) -> intp(2, 0, 2a)
T2_asi_reg_wr_4:
	mov	0x15, %r14
	.word 0xf2f38400  ! 92: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_11), 16, 16)) -> intp(2, 0, 3b)
	.word 0xfc15e0db  ! 95: LDUH_I	lduh	[%r23 + 0x00db], %r30
iob_intr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_12), 16, 16)) -> intp(2, 0, 20)
	.word 0xf28d206a  ! 98: LDUBA_I	lduba	[%r20, + 0x006a] %asi, %r25
	.word 0xf65d60de  ! 100: LDX_I	ldx	[%r21 + 0x00de], %r27
cpu_intr_2_7:
	setx	0x1c012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2148000  ! 106: OR_R	or 	%r18, %r0, %r25
	.word 0xfccda152  ! 107: LDSBA_I	ldsba	[%r22, + 0x0152] %asi, %r30
cpu_intr_2_8:
	setx	0x1d0031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0c54020  ! 112: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r24
cpu_intr_2_9:
	setx	0x1d0231, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_10:
	setx	0x1e032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8c5219a  ! 115: LDSWA_I	ldswa	[%r20, + 0x019a] %asi, %r28
	.word 0xfecdc020  ! 116: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r31
cpu_intr_2_11:
	setx	0x1e0020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4154000  ! 121: OR_R	or 	%r21, %r0, %r26
iob_intr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_13), 16, 16)) -> intp(2, 0, 0)
cpu_intr_2_12:
	setx	0x1e0120, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_14), 16, 16)) -> intp(2, 0, 15)
	.word 0xbc94e18a  ! 130: ORcc_I	orcc 	%r19, 0x018a, %r30
	.word 0xf05ca084  ! 131: LDX_I	ldx	[%r18 + 0x0084], %r24
T2_asi_reg_wr_5:
	mov	0x6, %r14
	.word 0xf0f384a0  ! 134: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf084a00d  ! 138: LDUWA_I	lduwa	[%r18, + 0x000d] %asi, %r24
	ta	T_CHANGE_TO_TL0
	.word 0xf60ca172  ! 142: LDUB_I	ldub	[%r18 + 0x0172], %r27
	.word 0xf8158000  ! 144: LDUH_R	lduh	[%r22 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe0cc000  ! 148: LDUB_R	ldub	[%r19 + %r0], %r31
	.word 0xbac520ac  ! 149: ADDCcc_I	addccc 	%r20, 0x00ac, %r29
cpu_intr_2_13:
	setx	0x1c0216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_15), 16, 16)) -> intp(2, 0, 13)
	.word 0xf4c4e079  ! 154: LDSWA_I	ldswa	[%r19, + 0x0079] %asi, %r26
	.word 0xf255214f  ! 157: LDSH_I	ldsh	[%r20 + 0x014f], %r25
T2_asi_reg_wr_6:
	mov	0x12, %r14
	.word 0xf4f38e40  ! 158: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982eca  ! 160: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0eca, %hpstate
iob_intr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_16), 16, 16)) -> intp(2, 0, 4)
T2_asi_reg_rd_3:
	mov	0x38, %r14
	.word 0xf8db8e80  ! 163: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf65d20f9  ! 165: LDX_I	ldx	[%r20 + 0x00f9], %r27
iob_intr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_17), 16, 16)) -> intp(2, 0, 30)
	.word 0xfc55e1e6  ! 183: LDSH_I	ldsh	[%r23 + 0x01e6], %r30
cpu_intr_2_14:
	setx	0x1d0201, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_7:
	mov	0x32, %r14
	.word 0xf2f38e80  ! 194: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_18), 16, 16)) -> intp(2, 0, 32)
	.word 0xbb3c3001  ! 197: SRAX_I	srax	%r16, 0x0001, %r29
cpu_intr_2_15:
	setx	0x1d020d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_16:
	setx	0x1e0004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc95e01d  ! 200: LDUHA_I	lduha	[%r23, + 0x001d] %asi, %r30
cpu_intr_2_17:
	setx	0x1f033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc952005  ! 203: LDUHA_I	lduha	[%r20, + 0x0005] %asi, %r30
	.word 0xf215e06d  ! 204: LDUH_I	lduh	[%r23 + 0x006d], %r25
	.word 0xfc45e14a  ! 208: LDSW_I	ldsw	[%r23 + 0x014a], %r30
iob_intr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_19), 16, 16)) -> intp(2, 0, 5)
iob_intr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_20), 16, 16)) -> intp(2, 0, 35)
	ta	T_CHANGE_TO_TL0
cpu_intr_2_18:
	setx	0x1d0239, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_19:
	setx	0x1d011a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_21), 16, 16)) -> intp(2, 0, 31)
iob_intr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_22), 16, 16)) -> intp(2, 0, 3)
	.word 0xf8548000  ! 224: LDSH_R	ldsh	[%r18 + %r0], %r28
	.word 0xb2ad4000  ! 225: ANDNcc_R	andncc 	%r21, %r0, %r25
T2_asi_reg_wr_8:
	mov	0x1a, %r14
	.word 0xfcf38e40  ! 227: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbc340000  ! 230: SUBC_R	orn 	%r16, %r0, %r30
	.word 0xfedd20d7  ! 231: LDXA_I	ldxa	[%r20, + 0x00d7] %asi, %r31
cpu_intr_2_20:
	setx	0x1e012e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_4:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 233: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfccc8020  ! 234: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r30
iob_intr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_23), 16, 16)) -> intp(2, 0, 4)
	.word 0xbc84e168  ! 236: ADDcc_I	addcc 	%r19, 0x0168, %r30
T2_asi_reg_wr_9:
	mov	0x3c0, %r14
	.word 0xf0f38e80  ! 237: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_2_21:
	setx	0x1d020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05c0000  ! 239: LDX_R	ldx	[%r16 + %r0], %r24
iob_intr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_24), 16, 16)) -> intp(2, 0, 30)
iob_intr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_25), 16, 16)) -> intp(2, 0, 4)
	ta	T_CHANGE_NONHPRIV
	.word 0xf2dc61f5  ! 246: LDXA_I	ldxa	[%r17, + 0x01f5] %asi, %r25
	.word 0xf4150000  ! 247: LDUH_R	lduh	[%r20 + %r0], %r26
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xf68ca137  ! 253: LDUBA_I	lduba	[%r18, + 0x0137] %asi, %r27
iob_intr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_26), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_rd_5:
	mov	0x0, %r14
	.word 0xfadb8e60  ! 257: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf8d5a19f  ! 258: LDSHA_I	ldsha	[%r22, + 0x019f] %asi, %r28
	.word 0xfa450000  ! 260: LDSW_R	ldsw	[%r20 + %r0], %r29
cpu_intr_2_22:
	setx	0x1f0123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4460cd  ! 265: LDSW_I	ldsw	[%r17 + 0x00cd], %r30
T2_asi_reg_wr_10:
	mov	0x15, %r14
	.word 0xf2f389e0  ! 266: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf8c40020  ! 269: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r28
	.word 0xf20da156  ! 270: LDUB_I	ldub	[%r22 + 0x0156], %r25
	.word 0xfe8c4020  ! 272: LDUBA_R	lduba	[%r17, %r0] 0x01, %r31
	.word 0xf6cde0eb  ! 274: LDSBA_I	ldsba	[%r23, + 0x00eb] %asi, %r27
T2_asi_reg_rd_6:
	mov	0x3, %r14
	.word 0xf6db8e60  ! 275: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xfa850020  ! 276: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r29
iob_intr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_27), 16, 16)) -> intp(2, 0, 4)
iob_intr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_28), 16, 16)) -> intp(2, 0, 7)
T2_asi_reg_wr_11:
	mov	0x14, %r14
	.word 0xf8f38400  ! 282: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf08c60cc  ! 284: LDUBA_I	lduba	[%r17, + 0x00cc] %asi, %r24
cpu_intr_2_23:
	setx	0x1d0323, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_29), 16, 16)) -> intp(2, 0, c)
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x8198380a  ! 292: WRHPR_HPSTATE_I	wrhpr	%r0, 0x180a, %hpstate
	.word 0xfed5c020  ! 294: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r31
	.word 0xfa8d2119  ! 295: LDUBA_I	lduba	[%r20, + 0x0119] %asi, %r29
	.word 0xfe5c0000  ! 296: LDX_R	ldx	[%r16 + %r0], %r31
	.word 0xf4cde0b8  ! 302: LDSBA_I	ldsba	[%r23, + 0x00b8] %asi, %r26
	.word 0xf80d2024  ! 303: LDUB_I	ldub	[%r20 + 0x0024], %r28
	.word 0xf29461b5  ! 305: LDUHA_I	lduha	[%r17, + 0x01b5] %asi, %r25
T2_asi_reg_wr_12:
	mov	0x13, %r14
	.word 0xf6f38e80  ! 309: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T2_asi_reg_wr_13:
	mov	0xc, %r14
	.word 0xfaf389e0  ! 312: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf88d8020  ! 314: LDUBA_R	lduba	[%r22, %r0] 0x01, %r28
T2_asi_reg_wr_14:
	mov	0x25, %r14
	.word 0xfaf389e0  ! 315: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf2d5e191  ! 316: LDSHA_I	ldsha	[%r23, + 0x0191] %asi, %r25
	ta	T_CHANGE_TO_TL1
	.word 0xf8450000  ! 324: LDSW_R	ldsw	[%r20 + %r0], %r28
	.word 0xf65c20d0  ! 325: LDX_I	ldx	[%r16 + 0x00d0], %r27
iob_intr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_30), 16, 16)) -> intp(2, 0, 1)
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa0d601d  ! 338: LDUB_I	ldub	[%r21 + 0x001d], %r29
	.word 0xf80d21b9  ! 342: LDUB_I	ldub	[%r20 + 0x01b9], %r28
	.word 0xfa4c8000  ! 344: LDSB_R	ldsb	[%r18 + %r0], %r29
iob_intr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_31), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf0042118  ! 346: LDUW_I	lduw	[%r16 + 0x0118], %r24
	.word 0xfc5ca185  ! 349: LDX_I	ldx	[%r18 + 0x0185], %r30
iob_intr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_32), 16, 16)) -> intp(2, 0, 5)
T2_asi_reg_rd_7:
	mov	0x38, %r14
	.word 0xf8db8e40  ! 351: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf68ce10a  ! 353: LDUBA_I	lduba	[%r19, + 0x010a] %asi, %r27
	.word 0xf8850020  ! 360: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r28
	.word 0xfc444000  ! 363: LDSW_R	ldsw	[%r17 + %r0], %r30
	.word 0xfecc4020  ! 366: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r31
	.word 0xf24d8000  ! 368: LDSB_R	ldsb	[%r22 + %r0], %r25
cpu_intr_2_24:
	setx	0x1e013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982fd8  ! 378: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd8, %hpstate
iob_intr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_33), 16, 16)) -> intp(2, 0, 2f)
T2_asi_reg_rd_8:
	mov	0x3c4, %r14
	.word 0xf4db8e80  ! 382: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_34), 16, 16)) -> intp(2, 0, 1c)
	.word 0xb4a420f2  ! 385: SUBcc_I	subcc 	%r16, 0x00f2, %r26
T2_asi_reg_rd_9:
	mov	0x3c0, %r14
	.word 0xfedb8e40  ! 386: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf8cde04b  ! 388: LDSBA_I	ldsba	[%r23, + 0x004b] %asi, %r28
	ta	T_CHANGE_TO_TL0
	.word 0xf24d8000  ! 391: LDSB_R	ldsb	[%r22 + %r0], %r25
	.word 0xb6156117  ! 395: OR_I	or 	%r21, 0x0117, %r27
	.word 0xfe95a08e  ! 399: LDUHA_I	lduha	[%r22, + 0x008e] %asi, %r31
iob_intr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_35), 16, 16)) -> intp(2, 0, 24)
	.word 0xf8850020  ! 403: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r28
	.word 0xfed44020  ! 404: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r31
T2_asi_reg_wr_15:
	mov	0x20, %r14
	.word 0xf6f38e60  ! 407: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T2_asi_reg_rd_10:
	mov	0x23, %r14
	.word 0xf2db89e0  ! 410: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_36), 16, 16)) -> intp(2, 0, 21)
T2_asi_reg_rd_11:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 413: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfe4c0000  ! 414: LDSB_R	ldsb	[%r16 + %r0], %r31
cpu_intr_2_25:
	setx	0x1e031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba440000  ! 417: ADDC_R	addc 	%r16, %r0, %r29
cpu_intr_2_26:
	setx	0x1c0024, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_37), 16, 16)) -> intp(2, 0, 22)
	.word 0xf4cca100  ! 423: LDSBA_I	ldsba	[%r18, + 0x0100] %asi, %r26
cpu_intr_2_27:
	setx	0x1e032a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_28:
	setx	0x1f010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_38), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf615c000  ! 431: LDUH_R	lduh	[%r23 + %r0], %r27
cpu_intr_2_29:
	setx	0x1f012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_12:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 435: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfe94c020  ! 437: LDUHA_R	lduha	[%r19, %r0] 0x01, %r31
	.word 0xb6c4a05c  ! 438: ADDCcc_I	addccc 	%r18, 0x005c, %r27
cpu_intr_2_30:
	setx	0x1c031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4c50020  ! 442: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r26
	.word 0xb03561fe  ! 443: ORN_I	orn 	%r21, 0x01fe, %r24
T2_asi_reg_rd_13:
	mov	0x2, %r14
	.word 0xf2db8e60  ! 444: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_39), 16, 16)) -> intp(2, 0, 2c)
cpu_intr_2_31:
	setx	0x1c0234, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_16:
	mov	0x3c5, %r14
	.word 0xf2f384a0  ! 456: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf245c000  ! 460: LDSW_R	ldsw	[%r23 + %r0], %r25
	.word 0xb5355000  ! 461: SRLX_R	srlx	%r21, %r0, %r26
cpu_intr_2_32:
	setx	0x1e0306, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_33:
	setx	0x1e0218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xa1902002  ! 464: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	ta	T_CHANGE_TO_TL1
iob_intr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_40), 16, 16)) -> intp(2, 0, 27)
T2_asi_reg_wr_17:
	mov	0x3c1, %r14
	.word 0xf8f38400  ! 469: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_2_34:
	setx	0x1f0202, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_14:
	mov	0x2c, %r14
	.word 0xf2db8400  ! 475: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T2_asi_reg_rd_15:
	mov	0x3c8, %r14
	.word 0xf4db84a0  ! 483: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf64520bf  ! 484: LDSW_I	ldsw	[%r20 + 0x00bf], %r27
	ta	T_CHANGE_HPRIV
cpu_intr_2_35:
	setx	0x220328, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_18:
	mov	0x3c6, %r14
	.word 0xf4f384a0  ! 489: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_2_36:
	setx	0x200119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_37:
	setx	0x22003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf004a0bf  ! 494: LDUW_I	lduw	[%r18 + 0x00bf], %r24
	.word 0xf60cc000  ! 499: LDUB_R	ldub	[%r19 + %r0], %r27
	.word 0xb4a54000  ! 501: SUBcc_R	subcc 	%r21, %r0, %r26
cpu_intr_2_38:
	setx	0x210100, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_41), 16, 16)) -> intp(2, 0, e)
T2_asi_reg_rd_16:
	mov	0x30, %r14
	.word 0xfadb8e80  ! 510: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_42), 16, 16)) -> intp(2, 0, 37)
	.word 0xf6d420e9  ! 514: LDSHA_I	ldsha	[%r16, + 0x00e9] %asi, %r27
	.word 0xf05521b1  ! 516: LDSH_I	ldsh	[%r20 + 0x01b1], %r24
	ta	T_CHANGE_HPRIV
iob_intr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_43), 16, 16)) -> intp(2, 0, 18)
	.word 0xfac4e03a  ! 523: LDSWA_I	ldswa	[%r19, + 0x003a] %asi, %r29
cpu_intr_2_39:
	setx	0x20023a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_44), 16, 16)) -> intp(2, 0, 10)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb60dc000  ! 532: AND_R	and 	%r23, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_45), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_40:
	setx	0x210224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8458000  ! 539: LDSW_R	ldsw	[%r22 + %r0], %r28
T2_asi_reg_rd_17:
	mov	0x3c6, %r14
	.word 0xf6db8e60  ! 542: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_2_41:
	setx	0x23002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25d0000  ! 546: LDX_R	ldx	[%r20 + %r0], %r25
	.word 0xf40d8000  ! 549: LDUB_R	ldub	[%r22 + %r0], %r26
iob_intr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_46), 16, 16)) -> intp(2, 0, 13)
	.word 0xf2cd0020  ! 551: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r25
	.word 0xf45d6018  ! 553: LDX_I	ldx	[%r21 + 0x0018], %r26
	.word 0xf0dd2065  ! 554: LDXA_I	ldxa	[%r20, + 0x0065] %asi, %r24
	.word 0xf8958020  ! 557: LDUHA_R	lduha	[%r22, %r0] 0x01, %r28
	.word 0xfecd60e2  ! 558: LDSBA_I	ldsba	[%r21, + 0x00e2] %asi, %r31
T2_asi_reg_rd_18:
	mov	0x0, %r14
	.word 0xf6db8e60  ! 563: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf04cc000  ! 565: LDSB_R	ldsb	[%r19 + %r0], %r24
	.word 0xfa554000  ! 567: LDSH_R	ldsh	[%r21 + %r0], %r29
	.word 0xfa942110  ! 569: LDUHA_I	lduha	[%r16, + 0x0110] %asi, %r29
	.word 0xfc4d8000  ! 571: LDSB_R	ldsb	[%r22 + %r0], %r30
iob_intr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_47), 16, 16)) -> intp(2, 0, 12)
T2_asi_reg_rd_19:
	mov	0x3c4, %r14
	.word 0xfadb8e60  ! 575: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_2_42:
	setx	0x22031d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_20:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 580: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb8444000  ! 583: ADDC_R	addc 	%r17, %r0, %r28
T2_asi_reg_wr_19:
	mov	0x33, %r14
	.word 0xf0f38400  ! 584: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xfa052151  ! 585: LDUW_I	lduw	[%r20 + 0x0151], %r29
T2_asi_reg_wr_20:
	mov	0x17, %r14
	.word 0xf4f38e40  ! 588: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb28ca034  ! 592: ANDcc_I	andcc 	%r18, 0x0034, %r25
	.word 0xb21dc000  ! 594: XOR_R	xor 	%r23, %r0, %r25
cpu_intr_2_43:
	setx	0x200322, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_21:
	mov	0x22, %r14
	.word 0xfadb8e80  ! 598: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T2_asi_reg_wr_21:
	mov	0x4, %r14
	.word 0xfef38400  ! 603: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_48), 16, 16)) -> intp(2, 0, 32)
	.word 0xfe14a10f  ! 608: LDUH_I	lduh	[%r18 + 0x010f], %r31
T2_asi_reg_wr_22:
	mov	0x3c2, %r14
	.word 0xf2f38e80  ! 609: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2448000  ! 613: LDSW_R	ldsw	[%r18 + %r0], %r25
	.word 0xfa8ce0f4  ! 614: LDUBA_I	lduba	[%r19, + 0x00f4] %asi, %r29
	.word 0xf6c42054  ! 617: LDSWA_I	ldswa	[%r16, + 0x0054] %asi, %r27
	.word 0xfc55a198  ! 623: LDSH_I	ldsh	[%r22 + 0x0198], %r30
cpu_intr_2_44:
	setx	0x210012, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_23:
	mov	0x20, %r14
	.word 0xfef38e80  ! 628: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_2_45:
	setx	0x200311, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_46:
	setx	0x230025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe044000  ! 633: LDUW_R	lduw	[%r17 + %r0], %r31
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_24:
	mov	0x22, %r14
	.word 0xfef389e0  ! 638: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xfe4dc000  ! 640: LDSB_R	ldsb	[%r23 + %r0], %r31
	.word 0xfecce1a4  ! 642: LDSBA_I	ldsba	[%r19, + 0x01a4] %asi, %r31
T2_asi_reg_wr_25:
	mov	0x3c3, %r14
	.word 0xfaf38e40  ! 643: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_49), 16, 16)) -> intp(2, 0, 3f)
	.word 0xb844e173  ! 646: ADDC_I	addc 	%r19, 0x0173, %r28
	.word 0xfa5421b7  ! 648: LDSH_I	ldsh	[%r16 + 0x01b7], %r29
cpu_intr_2_47:
	setx	0x20033f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_26:
	mov	0x37, %r14
	.word 0xfaf38400  ! 650: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf4850020  ! 651: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r26
T2_asi_reg_wr_27:
	mov	0x19, %r14
	.word 0xf2f384a0  ! 652: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T2_asi_reg_rd_22:
	mov	0x3c6, %r14
	.word 0xf4db84a0  ! 654: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T2_asi_reg_wr_28:
	mov	0x27, %r14
	.word 0xf0f38400  ! 655: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_50), 16, 16)) -> intp(2, 0, 2e)
	.word 0xb225c000  ! 659: SUB_R	sub 	%r23, %r0, %r25
iob_intr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_51), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_48:
	setx	0x20010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc2da077  ! 662: ANDN_I	andn 	%r22, 0x0077, %r30
T2_asi_reg_rd_23:
	mov	0x3c2, %r14
	.word 0xfadb84a0  ! 664: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xfa458000  ! 667: LDSW_R	ldsw	[%r22 + %r0], %r29
	.word 0xf0154000  ! 670: LDUH_R	lduh	[%r21 + %r0], %r24
	.word 0xb284a176  ! 671: ADDcc_I	addcc 	%r18, 0x0176, %r25
iob_intr_2_52:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_52), 16, 16)) -> intp(2, 0, f)
iob_intr_2_53:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_53), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_49:
	setx	0x230336, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_50:
	setx	0x20033a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_54:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_54), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_51:
	setx	0x220129, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_55:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_55), 16, 16)) -> intp(2, 0, 6)
	.word 0xbb643801  ! 688: MOVcc_I	<illegal instruction>
T2_asi_reg_rd_24:
	mov	0x3c5, %r14
	.word 0xfedb8e80  ! 691: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T2_asi_reg_wr_29:
	mov	0x3c8, %r14
	.word 0xfaf384a0  ! 692: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_2_56:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_56), 16, 16)) -> intp(2, 0, 29)
	.word 0xf8cd2159  ! 695: LDSBA_I	ldsba	[%r20, + 0x0159] %asi, %r28
T2_asi_reg_wr_30:
	mov	0x2c, %r14
	.word 0xf6f38e60  ! 696: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_2_57:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_57), 16, 16)) -> intp(2, 0, 3a)
cpu_intr_2_52:
	setx	0x22003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb33db001  ! 703: SRAX_I	srax	%r22, 0x0001, %r25
	.word 0xf0050000  ! 704: LDUW_R	lduw	[%r20 + %r0], %r24
cpu_intr_2_53:
	setx	0x21031d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_25:
	mov	0x23, %r14
	.word 0xf2db8e80  ! 707: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_2_54:
	setx	0x20030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf68d0020  ! 709: LDUBA_R	lduba	[%r20, %r0] 0x01, %r27
iob_intr_2_58:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_58), 16, 16)) -> intp(2, 0, 2b)
iob_intr_2_59:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_59), 16, 16)) -> intp(2, 0, 9)
	.word 0xfc4d8000  ! 714: LDSB_R	ldsb	[%r22 + %r0], %r30
	.word 0xfed521d0  ! 716: LDSHA_I	ldsha	[%r20, + 0x01d0] %asi, %r31
iob_intr_2_60:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_60), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_55:
	setx	0x220239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf645a10a  ! 722: LDSW_I	ldsw	[%r22 + 0x010a], %r27
T2_asi_reg_wr_31:
	mov	0x6, %r14
	.word 0xf0f389e0  ! 726: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf8050000  ! 729: LDUW_R	lduw	[%r20 + %r0], %r28
iob_intr_2_61:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_61), 16, 16)) -> intp(2, 0, 9)
	.word 0xf80d21b7  ! 733: LDUB_I	ldub	[%r20 + 0x01b7], %r28
iob_intr_2_62:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_62), 16, 16)) -> intp(2, 0, b)
	.word 0xbe8c4000  ! 735: ANDcc_R	andcc 	%r17, %r0, %r31
	.word 0xbabdc000  ! 736: XNORcc_R	xnorcc 	%r23, %r0, %r29
T2_asi_reg_wr_32:
	mov	0x3c0, %r14
	.word 0xf6f38e80  ! 737: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	ta	T_CHANGE_NONHPRIV
iob_intr_2_63:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_63), 16, 16)) -> intp(2, 0, 39)
cpu_intr_2_56:
	setx	0x230132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0c58020  ! 742: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r24
cpu_intr_2_57:
	setx	0x220129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa55a0a9  ! 745: LDSH_I	ldsh	[%r22 + 0x00a9], %r29
	.word 0x8f902002  ! 747: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
iob_intr_2_64:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_64), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf00d60ff  ! 752: LDUB_I	ldub	[%r21 + 0x00ff], %r24
	.word 0xfe440000  ! 758: LDSW_R	ldsw	[%r16 + %r0], %r31
cpu_intr_2_58:
	setx	0x230136, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_33:
	mov	0x31, %r14
	.word 0xf8f38e80  ! 763: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_2_59:
	setx	0x230235, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_34:
	mov	0x3c7, %r14
	.word 0xf8f38e60  ! 766: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf2c4a0ab  ! 767: LDSWA_I	ldswa	[%r18, + 0x00ab] %asi, %r25
cpu_intr_2_60:
	setx	0x230139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc8c609a  ! 771: LDUBA_I	lduba	[%r17, + 0x009a] %asi, %r30
	.word 0xb43d6132  ! 772: XNOR_I	xnor 	%r21, 0x0132, %r26
T2_asi_reg_rd_26:
	mov	0x3c0, %r14
	.word 0xf4db8400  ! 774: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf854c000  ! 776: LDSH_R	ldsh	[%r19 + %r0], %r28
iob_intr_2_65:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_65), 16, 16)) -> intp(2, 0, 37)
	.word 0xf0554000  ! 781: LDSH_R	ldsh	[%r21 + %r0], %r24
cpu_intr_2_61:
	setx	0x230225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65d4000  ! 783: LDX_R	ldx	[%r21 + %r0], %r27
T2_asi_reg_wr_35:
	mov	0x26, %r14
	.word 0xfef38e80  ! 784: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xfa4c4000  ! 786: LDSB_R	ldsb	[%r17 + %r0], %r29
	.word 0xf48c20d1  ! 790: LDUBA_I	lduba	[%r16, + 0x00d1] %asi, %r26
iob_intr_2_66:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_66), 16, 16)) -> intp(2, 0, 39)
cpu_intr_2_62:
	setx	0x210037, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_67:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_67), 16, 16)) -> intp(2, 0, 23)
cpu_intr_2_63:
	setx	0x220304, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_27:
	mov	0x3, %r14
	.word 0xf6db8e40  ! 799: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_wr_36:
	mov	0x3c0, %r14
	.word 0xf0f389e0  ! 800: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xfe044000  ! 802: LDUW_R	lduw	[%r17 + %r0], %r31
	.word 0xfc458000  ! 803: LDSW_R	ldsw	[%r22 + %r0], %r30
	.word 0xb62460f4  ! 804: SUB_I	sub 	%r17, 0x00f4, %r27
	.word 0xf885a16f  ! 805: LDUWA_I	lduwa	[%r22, + 0x016f] %asi, %r28
	.word 0xf804218e  ! 806: LDUW_I	lduw	[%r16 + 0x018e], %r28
cpu_intr_2_64:
	setx	0x23022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_37:
	mov	0x3c0, %r14
	.word 0xfef384a0  ! 808: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xfe4d6192  ! 809: LDSB_I	ldsb	[%r21 + 0x0192], %r31
T2_asi_reg_wr_38:
	mov	0x3c1, %r14
	.word 0xfaf384a0  ! 810: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T2_asi_reg_wr_39:
	mov	0x25, %r14
	.word 0xfcf38e60  ! 812: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_2_65:
	setx	0x22003d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_40:
	mov	0x3c2, %r14
	.word 0xfcf38400  ! 815: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_2_68:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_68), 16, 16)) -> intp(2, 0, 1a)
	.word 0xfcc560d7  ! 822: LDSWA_I	ldswa	[%r21, + 0x00d7] %asi, %r30
T2_asi_reg_wr_41:
	mov	0x24, %r14
	.word 0xf2f389e0  ! 827: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf484c020  ! 828: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r26
T2_asi_reg_wr_42:
	mov	0x12, %r14
	.word 0xf6f38e60  ! 835: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_2_66:
	setx	0x22000e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_69:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_69), 16, 16)) -> intp(2, 0, 13)
cpu_intr_2_67:
	setx	0x200123, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_43:
	mov	0x3c1, %r14
	.word 0xfaf38e80  ! 840: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T2_asi_reg_wr_44:
	mov	0x34, %r14
	.word 0xfaf384a0  ! 843: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	ta	T_CHANGE_TO_TL0
	.word 0xfc0c0000  ! 846: LDUB_R	ldub	[%r16 + %r0], %r30
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_45:
	mov	0x10, %r14
	.word 0xfcf38400  ! 849: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xfacc0020  ! 853: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r29
	.word 0xb035e079  ! 861: SUBC_I	orn 	%r23, 0x0079, %r24
cpu_intr_2_68:
	setx	0x200124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25d4000  ! 863: LDX_R	ldx	[%r21 + %r0], %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf25d4000  ! 866: LDX_R	ldx	[%r21 + %r0], %r25
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982cca  ! 869: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cca, %hpstate
	.word 0xf845a138  ! 870: LDSW_I	ldsw	[%r22 + 0x0138], %r28
	ta	T_CHANGE_TO_TL1
cpu_intr_2_69:
	setx	0x23013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5643801  ! 878: MOVcc_I	<illegal instruction>
cpu_intr_2_70:
	setx	0x210101, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_71:
	setx	0x200127, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf4c50020  ! 883: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r26
cpu_intr_2_72:
	setx	0x20000a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_70:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_70), 16, 16)) -> intp(2, 0, 32)
iob_intr_2_71:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_71), 16, 16)) -> intp(2, 0, f)
	.word 0xfa8c4020  ! 889: LDUBA_R	lduba	[%r17, %r0] 0x01, %r29
	.word 0xf85c4000  ! 891: LDX_R	ldx	[%r17 + %r0], %r28
	.word 0xb7641800  ! 892: MOVcc_R	<illegal instruction>
T2_asi_reg_wr_46:
	mov	0x3c0, %r14
	.word 0xfcf38e60  ! 893: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_2_73:
	setx	0x21033c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_47:
	mov	0xe, %r14
	.word 0xf2f38e40  ! 896: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T2_asi_reg_rd_28:
	mov	0x3c4, %r14
	.word 0xf4db84a0  ! 899: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_2_74:
	setx	0x20032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1348000  ! 903: SRL_R	srl 	%r18, %r0, %r24
	.word 0xf015e11c  ! 904: LDUH_I	lduh	[%r23 + 0x011c], %r24
	ta	T_CHANGE_TO_TL1
	.word 0xf814e199  ! 909: LDUH_I	lduh	[%r19 + 0x0199], %r28
	.word 0xbcbd4000  ! 915: XNORcc_R	xnorcc 	%r21, %r0, %r30
iob_intr_2_72:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_72), 16, 16)) -> intp(2, 0, 11)
T2_asi_reg_wr_48:
	mov	0x21, %r14
	.word 0xf8f38400  ! 920: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xfe8c4020  ! 922: LDUBA_R	lduba	[%r17, %r0] 0x01, %r31
	.word 0xfcd58020  ! 925: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r30
T2_asi_reg_wr_49:
	mov	0x3c7, %r14
	.word 0xfcf38e40  ! 926: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_75:
	setx	0x240102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa054000  ! 930: LDUW_R	lduw	[%r21 + %r0], %r29
iob_intr_2_73:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_73), 16, 16)) -> intp(2, 0, 2)
T2_asi_reg_rd_29:
	mov	0x6, %r14
	.word 0xf2db8e60  ! 936: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_2_76:
	setx	0x270317, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_74:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_74), 16, 16)) -> intp(2, 0, f)
T2_asi_reg_rd_30:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 939: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982e52  ! 941: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e52, %hpstate
	.word 0xfad42178  ! 942: LDSHA_I	ldsha	[%r16, + 0x0178] %asi, %r29
	.word 0xf88d4020  ! 943: LDUBA_R	lduba	[%r21, %r0] 0x01, %r28
iob_intr_2_75:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_75), 16, 16)) -> intp(2, 0, d)
	.word 0xbcb54000  ! 947: ORNcc_R	orncc 	%r21, %r0, %r30
	.word 0xf084200f  ! 948: LDUWA_I	lduwa	[%r16, + 0x000f] %asi, %r24
T2_asi_reg_rd_31:
	mov	0x2b, %r14
	.word 0xf6db8e60  ! 949: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T2_asi_reg_wr_50:
	mov	0x17, %r14
	.word 0xfcf389e0  ! 953: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
	.word 0xfc0c20b9  ! 959: LDUB_I	ldub	[%r16 + 0x00b9], %r30
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982f0a  ! 961: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0a, %hpstate
cpu_intr_2_77:
	setx	0x27012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb52c5000  ! 964: SLLX_R	sllx	%r17, %r0, %r26
iob_intr_2_76:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_76), 16, 16)) -> intp(2, 0, 22)
	.word 0xfad46060  ! 967: LDSHA_I	ldsha	[%r17, + 0x0060] %asi, %r29
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982b58  ! 968: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b58, %hpstate
T2_asi_reg_wr_51:
	mov	0x3c7, %r14
	.word 0xf2f38e40  ! 970: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983c50  ! 971: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c50, %hpstate
	.word 0xf845c000  ! 974: LDSW_R	ldsw	[%r23 + %r0], %r28
T2_asi_reg_wr_52:
	mov	0x3c5, %r14
	.word 0xf8f389e0  ! 976: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb09da034  ! 977: XORcc_I	xorcc 	%r22, 0x0034, %r24
cpu_intr_2_78:
	setx	0x27003c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_77:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_77), 16, 16)) -> intp(2, 0, d)
	.word 0xf8c46192  ! 983: LDSWA_I	ldswa	[%r17, + 0x0192] %asi, %r28
	.word 0xfa058000  ! 984: LDUW_R	lduw	[%r22 + %r0], %r29
iob_intr_2_78:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_78), 16, 16)) -> intp(2, 0, 39)
	.word 0xfe05c000  ! 986: LDUW_R	lduw	[%r23 + %r0], %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xb13c3001  ! 993: SRAX_I	srax	%r16, 0x0001, %r24
iob_intr_2_79:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_79), 16, 16)) -> intp(2, 0, 4)
iob_intr_2_80:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_80), 16, 16)) -> intp(2, 0, 3b)
iob_intr_2_81:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_81), 16, 16)) -> intp(2, 0, 21)
iob_intr_2_82:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_82), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_rd_32:
	mov	0x37, %r14
	.word 0xf8db84a0  ! 1009: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf245e1e2  ! 1012: LDSW_I	ldsw	[%r23 + 0x01e2], %r25
iob_intr_2_83:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_83), 16, 16)) -> intp(2, 0, 2c)
	.word 0xf0cd8020  ! 1017: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r24
	.word 0xbc14218a  ! 1018: OR_I	or 	%r16, 0x018a, %r30
	.word 0xb21560f6  ! 1019: OR_I	or 	%r21, 0x00f6, %r25
	.word 0xfe048000  ! 1020: LDUW_R	lduw	[%r18 + %r0], %r31
iob_intr_2_84:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_84), 16, 16)) -> intp(2, 0, 19)
cpu_intr_2_79:
	setx	0x270123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88de0d8  ! 1027: LDUBA_I	lduba	[%r23, + 0x00d8] %asi, %r28
T2_asi_reg_rd_33:
	mov	0x26, %r14
	.word 0xf4db8400  ! 1028: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf65c4000  ! 1029: LDX_R	ldx	[%r17 + %r0], %r27
cpu_intr_2_80:
	setx	0x260000, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_85:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_85), 16, 16)) -> intp(2, 0, 21)
	.word 0xf444e115  ! 1033: LDSW_I	ldsw	[%r19 + 0x0115], %r26
	.word 0xf6040000  ! 1034: LDUW_R	lduw	[%r16 + %r0], %r27
	.word 0xf8d5a0b2  ! 1035: LDSHA_I	ldsha	[%r22, + 0x00b2] %asi, %r28
cpu_intr_2_81:
	setx	0x27033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb635a0c2  ! 1038: SUBC_I	orn 	%r22, 0x00c2, %r27
	.word 0xf0cca136  ! 1039: LDSBA_I	ldsba	[%r18, + 0x0136] %asi, %r24
	.word 0xf295a182  ! 1044: LDUHA_I	lduha	[%r22, + 0x0182] %asi, %r25
cpu_intr_2_82:
	setx	0x250221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0d20b8  ! 1046: LDUB_I	ldub	[%r20 + 0x00b8], %r31
	.word 0xf8046119  ! 1049: LDUW_I	lduw	[%r17 + 0x0119], %r28
	.word 0xf484a1c1  ! 1053: LDUWA_I	lduwa	[%r18, + 0x01c1] %asi, %r26
	.word 0xb23461d8  ! 1054: ORN_I	orn 	%r17, 0x01d8, %r25
	ta	T_CHANGE_HPRIV
	.word 0xfc544000  ! 1058: LDSH_R	ldsh	[%r17 + %r0], %r30
iob_intr_2_86:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_86), 16, 16)) -> intp(2, 0, 4)
	.word 0xfe55c000  ! 1064: LDSH_R	ldsh	[%r23 + %r0], %r31
iob_intr_2_87:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_87), 16, 16)) -> intp(2, 0, 25)
	.word 0xf4540000  ! 1067: LDSH_R	ldsh	[%r16 + %r0], %r26
	.word 0xfec54020  ! 1068: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r31
T2_asi_reg_wr_53:
	mov	0xe, %r14
	.word 0xf8f389e0  ! 1070: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T2_asi_reg_wr_54:
	mov	0x15, %r14
	.word 0xf6f389e0  ! 1072: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_2_88:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_88), 16, 16)) -> intp(2, 0, 25)
cpu_intr_2_83:
	setx	0x270200, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_89:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_89), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf6958020  ! 1080: LDUHA_R	lduha	[%r22, %r0] 0x01, %r27
T2_asi_reg_wr_55:
	mov	0x3c7, %r14
	.word 0xf6f38e80  ! 1083: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb935f001  ! 1084: SRLX_I	srlx	%r23, 0x0001, %r28
T2_asi_reg_rd_34:
	mov	0x6, %r14
	.word 0xf4db84a0  ! 1087: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf0dde03d  ! 1088: LDXA_I	ldxa	[%r23, + 0x003d] %asi, %r24
T2_asi_reg_wr_56:
	mov	0x8, %r14
	.word 0xf2f38400  ! 1089: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_2_90:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_90), 16, 16)) -> intp(2, 0, 3b)
	.word 0xf2cd4020  ! 1093: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r25
	.word 0xb6058000  ! 1094: ADD_R	add 	%r22, %r0, %r27
cpu_intr_2_84:
	setx	0x25012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf244a1ed  ! 1096: LDSW_I	ldsw	[%r18 + 0x01ed], %r25
	.word 0xfa448000  ! 1100: LDSW_R	ldsw	[%r18 + %r0], %r29
	.word 0xf00da0b0  ! 1102: LDUB_I	ldub	[%r22 + 0x00b0], %r24
T2_asi_reg_rd_35:
	mov	0xb, %r14
	.word 0xf8db8400  ! 1104: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_2_91:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_91), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf8c4c020  ! 1106: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r28
iob_intr_2_92:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_92), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf88460dc  ! 1108: LDUWA_I	lduwa	[%r17, + 0x00dc] %asi, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_57:
	mov	0x4, %r14
	.word 0xf4f38e40  ! 1119: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf8858020  ! 1121: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r28
cpu_intr_2_85:
	setx	0x240037, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_93:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_93), 16, 16)) -> intp(2, 0, 34)
iob_intr_2_94:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_94), 16, 16)) -> intp(2, 0, 9)
	.word 0xf2050000  ! 1131: LDUW_R	lduw	[%r20 + %r0], %r25
T2_asi_reg_wr_58:
	mov	0x29, %r14
	.word 0xfaf389e0  ! 1132: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb01c0000  ! 1133: XOR_R	xor 	%r16, %r0, %r24
	.word 0xb82d0000  ! 1135: ANDN_R	andn 	%r20, %r0, %r28
	.word 0xf6854020  ! 1137: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r27
cpu_intr_2_86:
	setx	0x270131, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_87:
	setx	0x260025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4cc4020  ! 1141: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r26
cpu_intr_2_88:
	setx	0x26020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2cc8020  ! 1144: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r25
T2_asi_reg_rd_36:
	mov	0x3c8, %r14
	.word 0xf0db8e60  ! 1145: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_2_95:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_95), 16, 16)) -> intp(2, 0, 17)
	.word 0xf485a09d  ! 1152: LDUWA_I	lduwa	[%r22, + 0x009d] %asi, %r26
cpu_intr_2_89:
	setx	0x240204, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_90:
	setx	0x25031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0254000  ! 1158: SUB_R	sub 	%r21, %r0, %r24
iob_intr_2_96:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_96), 16, 16)) -> intp(2, 0, 2f)
iob_intr_2_97:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_97), 16, 16)) -> intp(2, 0, 21)
iob_intr_2_98:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_98), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_wr_59:
	mov	0x16, %r14
	.word 0xf8f38e80  ! 1169: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T2_asi_reg_rd_37:
	mov	0x20, %r14
	.word 0xf8db8e40  ! 1172: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb8ac8000  ! 1177: ANDNcc_R	andncc 	%r18, %r0, %r28
T2_asi_reg_wr_60:
	mov	0x24, %r14
	.word 0xfef38e40  ! 1178: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_rd_38:
	mov	0x9, %r14
	.word 0xf8db8e80  ! 1181: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_2_99:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_99), 16, 16)) -> intp(2, 0, 38)
	.word 0xf4850020  ! 1186: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r26
	.word 0xfed4c020  ! 1187: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r31
	.word 0xb8b5a00f  ! 1189: SUBCcc_I	orncc 	%r22, 0x000f, %r28
	.word 0xf85de126  ! 1190: LDX_I	ldx	[%r23 + 0x0126], %r28
iob_intr_2_100:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_100), 16, 16)) -> intp(2, 0, 17)
iob_intr_2_101:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_101), 16, 16)) -> intp(2, 0, 2f)
cpu_intr_2_91:
	setx	0x240133, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_92:
	setx	0x260237, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_93:
	setx	0x250030, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_39:
	mov	0x3c1, %r14
	.word 0xf0db84a0  ! 1201: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf614c000  ! 1203: LDUH_R	lduh	[%r19 + %r0], %r27
	.word 0xb17c6401  ! 1206: MOVR_I	movre	%r17, 0x1, %r24
cpu_intr_2_94:
	setx	0x250332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0dc000  ! 1208: LDUB_R	ldub	[%r23 + %r0], %r31
cpu_intr_2_95:
	setx	0x240324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8de0b7  ! 1212: LDUBA_I	lduba	[%r23, + 0x00b7] %asi, %r29
	.word 0xbb348000  ! 1213: SRL_R	srl 	%r18, %r0, %r29
	.word 0xfc840020  ! 1214: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r30
cpu_intr_2_96:
	setx	0x240124, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_102:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_102), 16, 16)) -> intp(2, 0, 29)
	.word 0xfacc6130  ! 1220: LDSBA_I	ldsba	[%r17, + 0x0130] %asi, %r29
cpu_intr_2_97:
	setx	0x270120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_98:
	setx	0x260105, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_103:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_103), 16, 16)) -> intp(2, 0, 23)
cpu_intr_2_99:
	setx	0x25013e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_104:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_104), 16, 16)) -> intp(2, 0, 27)
cpu_intr_2_100:
	setx	0x240030, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_40:
	mov	0x35, %r14
	.word 0xf4db8e60  ! 1235: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf6dd60c6  ! 1237: LDXA_I	ldxa	[%r21, + 0x00c6] %asi, %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xb695a1b7  ! 1240: ORcc_I	orcc 	%r22, 0x01b7, %r27
iob_intr_2_105:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_105), 16, 16)) -> intp(2, 0, 0)
	.word 0xfcc4e182  ! 1243: LDSWA_I	ldswa	[%r19, + 0x0182] %asi, %r30
	.word 0xfa440000  ! 1248: LDSW_R	ldsw	[%r16 + %r0], %r29
	.word 0xf8048000  ! 1249: LDUW_R	lduw	[%r18 + %r0], %r28
	.word 0xfe84e0ab  ! 1252: LDUWA_I	lduwa	[%r19, + 0x00ab] %asi, %r31
cpu_intr_2_101:
	setx	0x24003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8561ed  ! 1255: LDUWA_I	lduwa	[%r21, + 0x01ed] %asi, %r29
	.word 0xf65c60f5  ! 1262: LDX_I	ldx	[%r17 + 0x00f5], %r27
T2_asi_reg_wr_61:
	mov	0x18, %r14
	.word 0xf0f384a0  ! 1264: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf60c6089  ! 1268: LDUB_I	ldub	[%r17 + 0x0089], %r27
T2_asi_reg_wr_62:
	mov	0x26, %r14
	.word 0xfcf38400  ! 1270: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_2_102:
	setx	0x270005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2cd61ce  ! 1274: LDSBA_I	ldsba	[%r21, + 0x01ce] %asi, %r25
	.word 0xbaace0d7  ! 1275: ANDNcc_I	andncc 	%r19, 0x00d7, %r29
	.word 0xf4040000  ! 1276: LDUW_R	lduw	[%r16 + %r0], %r26
T2_asi_reg_rd_41:
	mov	0x25, %r14
	.word 0xf6db8400  ! 1278: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xfe4d0000  ! 1279: LDSB_R	ldsb	[%r20 + %r0], %r31
	.word 0xb81c8000  ! 1280: XOR_R	xor 	%r18, %r0, %r28
	.word 0xf294614f  ! 1286: LDUHA_I	lduha	[%r17, + 0x014f] %asi, %r25
cpu_intr_2_103:
	setx	0x27032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfecd0020  ! 1289: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r31
	ta	T_CHANGE_HPRIV
	.word 0xf0158000  ! 1292: LDUH_R	lduh	[%r22 + %r0], %r24
iob_intr_2_106:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_106), 16, 16)) -> intp(2, 0, 3)
iob_intr_2_107:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_107), 16, 16)) -> intp(2, 0, 21)
	.word 0xf0148000  ! 1301: LDUH_R	lduh	[%r18 + %r0], %r24
	.word 0xfc5d6115  ! 1307: LDX_I	ldx	[%r21 + 0x0115], %r30
	.word 0xf415e08c  ! 1308: LDUH_I	lduh	[%r23 + 0x008c], %r26
cpu_intr_2_104:
	setx	0x270307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf48de1e9  ! 1310: LDUBA_I	lduba	[%r23, + 0x01e9] %asi, %r26
iob_intr_2_108:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_108), 16, 16)) -> intp(2, 0, 2e)
	.word 0xfa45602c  ! 1314: LDSW_I	ldsw	[%r21 + 0x002c], %r29
T2_asi_reg_rd_42:
	mov	0x2, %r14
	.word 0xf6db8e40  ! 1317: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbc0da08b  ! 1325: AND_I	and 	%r22, 0x008b, %r30
cpu_intr_2_105:
	setx	0x26020b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_43:
	mov	0x3c8, %r14
	.word 0xf4db84a0  ! 1327: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf6458000  ! 1329: LDSW_R	ldsw	[%r22 + %r0], %r27
T2_asi_reg_rd_44:
	mov	0x2, %r14
	.word 0xf0db8e40  ! 1333: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T2_asi_reg_wr_63:
	mov	0xf, %r14
	.word 0xfef38e40  ! 1337: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_2_106:
	setx	0x240126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2dde0ba  ! 1345: LDXA_I	ldxa	[%r23, + 0x00ba] %asi, %r25
iob_intr_2_109:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_109), 16, 16)) -> intp(2, 0, 12)
iob_intr_2_110:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_110), 16, 16)) -> intp(2, 0, 39)
cpu_intr_2_107:
	setx	0x270031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf68c4020  ! 1353: LDUBA_R	lduba	[%r17, %r0] 0x01, %r27
	.word 0xf25ca077  ! 1355: LDX_I	ldx	[%r18 + 0x0077], %r25
	.word 0xf2842028  ! 1358: LDUWA_I	lduwa	[%r16, + 0x0028] %asi, %r25
cpu_intr_2_108:
	setx	0x24022c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_109:
	setx	0x240112, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_64:
	mov	0x0, %r14
	.word 0xfef38e40  ! 1361: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_111:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_111), 16, 16)) -> intp(2, 0, 34)
	.word 0xb33ce001  ! 1364: SRA_I	sra 	%r19, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_45:
	mov	0x38, %r14
	.word 0xfedb8e60  ! 1367: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xfc144000  ! 1368: LDUH_R	lduh	[%r17 + %r0], %r30
T2_asi_reg_wr_65:
	mov	0x3c2, %r14
	.word 0xfef389e0  ! 1370: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_2_110:
	setx	0x27000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xfad40020  ! 1380: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_46:
	mov	0x5, %r14
	.word 0xfedb8400  ! 1383: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_66:
	mov	0x32, %r14
	.word 0xfcf38e80  ! 1386: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_2_111:
	setx	0x26030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba8d4000  ! 1388: ANDcc_R	andcc 	%r21, %r0, %r29
T2_asi_reg_rd_47:
	mov	0x3c8, %r14
	.word 0xf2db8e60  ! 1389: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_2_112:
	setx	0x260135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5d2050  ! 1392: LDX_I	ldx	[%r20 + 0x0050], %r29
	.word 0xbc940000  ! 1393: ORcc_R	orcc 	%r16, %r0, %r30
	.word 0xfe4d2191  ! 1394: LDSB_I	ldsb	[%r20 + 0x0191], %r31
cpu_intr_2_113:
	setx	0x25002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf6c5217b  ! 1400: LDSWA_I	ldswa	[%r20, + 0x017b] %asi, %r27
T2_asi_reg_rd_48:
	mov	0x1c, %r14
	.word 0xf8db8e40  ! 1402: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_112:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_112), 16, 16)) -> intp(2, 0, 2f)
	.word 0xfa8ce111  ! 1408: LDUBA_I	lduba	[%r19, + 0x0111] %asi, %r29
T2_asi_reg_rd_49:
	mov	0x3c2, %r14
	.word 0xf0db89e0  ! 1409: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_2_113:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_113), 16, 16)) -> intp(2, 0, f)
T2_asi_reg_rd_50:
	mov	0x3c6, %r14
	.word 0xf6db8e80  ! 1416: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	ta	T_CHANGE_TO_TL0
	.word 0xfa840020  ! 1423: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r29
cpu_intr_2_114:
	setx	0x28022a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_114:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_114), 16, 16)) -> intp(2, 0, 2)
	.word 0xf015e09f  ! 1432: LDUH_I	lduh	[%r23 + 0x009f], %r24
iob_intr_2_115:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_115), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_rd_51:
	mov	0x3c5, %r14
	.word 0xfcdb8e80  ! 1437: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_2_116:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_116), 16, 16)) -> intp(2, 0, 1e)
cpu_intr_2_115:
	setx	0x2a0320, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_117:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_117), 16, 16)) -> intp(2, 0, c)
	.word 0xf20420a7  ! 1443: LDUW_I	lduw	[%r16 + 0x00a7], %r25
T2_asi_reg_wr_67:
	mov	0x3c0, %r14
	.word 0xfcf38e60  ! 1446: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_116:
	setx	0x2b0011, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xfc8d61b1  ! 1452: LDUBA_I	lduba	[%r21, + 0x01b1] %asi, %r30
	.word 0xb1500000  ! 1454: RDPR_TPC	<illegal instruction>
	.word 0xf88dc020  ! 1455: LDUBA_R	lduba	[%r23, %r0] 0x01, %r28
cpu_intr_2_117:
	setx	0x2b0322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3c3001  ! 1461: SRAX_I	srax	%r16, 0x0001, %r29
cpu_intr_2_118:
	setx	0x28002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf084e037  ! 1465: LDUWA_I	lduwa	[%r19, + 0x0037] %asi, %r24
	.word 0xfcd44020  ! 1466: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r30
T2_asi_reg_rd_52:
	mov	0x3c4, %r14
	.word 0xf8db84a0  ! 1467: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_2_119:
	setx	0x280130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1518000  ! 1470: RDPR_PSTATE	<illegal instruction>
	.word 0xfa548000  ! 1471: LDSH_R	ldsh	[%r18 + %r0], %r29
	.word 0xf0d44020  ! 1472: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r24
	.word 0xfac58020  ! 1474: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r29
	.word 0xfac48020  ! 1475: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r29
iob_intr_2_118:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_118), 16, 16)) -> intp(2, 0, 1b)
T2_asi_reg_rd_53:
	mov	0x28, %r14
	.word 0xfadb8e80  ! 1482: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xfc45c000  ! 1483: LDSW_R	ldsw	[%r23 + %r0], %r30
	.word 0xfc44c000  ! 1484: LDSW_R	ldsw	[%r19 + %r0], %r30
iob_intr_2_119:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_119), 16, 16)) -> intp(2, 0, 17)
cpu_intr_2_120:
	setx	0x2b0115, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf4046001  ! 1489: LDUW_I	lduw	[%r17 + 0x0001], %r26
T2_asi_reg_rd_54:
	mov	0x3c0, %r14
	.word 0xf0db89e0  ! 1493: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbd34b001  ! 1494: SRLX_I	srlx	%r18, 0x0001, %r30
	ta	T_CHANGE_HPRIV
cpu_intr_2_121:
	setx	0x290131, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_2_120:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_120), 16, 16)) -> intp(2, 0, 2b)
iob_intr_2_121:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_121), 16, 16)) -> intp(2, 0, 34)
iob_intr_2_122:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_122), 16, 16)) -> intp(2, 0, 12)
	.word 0xf8d58020  ! 1508: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r28
cpu_intr_2_122:
	setx	0x28002a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_68:
	mov	0x3c7, %r14
	.word 0xfcf384a0  ! 1511: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_2_123:
	setx	0x29013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4a48000  ! 1513: SUBcc_R	subcc 	%r18, %r0, %r26
	.word 0xf68d8020  ! 1515: LDUBA_R	lduba	[%r22, %r0] 0x01, %r27
	.word 0xfe440000  ! 1516: LDSW_R	ldsw	[%r16 + %r0], %r31
cpu_intr_2_124:
	setx	0x2a033e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_69:
	mov	0x1f, %r14
	.word 0xfef38e60  ! 1518: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T2_asi_reg_wr_70:
	mov	0x18, %r14
	.word 0xfef384a0  ! 1526: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T2_asi_reg_rd_55:
	mov	0x2e, %r14
	.word 0xf0db8e40  ! 1527: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfedc203e  ! 1529: LDXA_I	ldxa	[%r16, + 0x003e] %asi, %r31
T2_asi_reg_rd_56:
	mov	0x2b, %r14
	.word 0xf2db84a0  ! 1531: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_2_125:
	setx	0x2b0332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24c6160  ! 1533: LDSB_I	ldsb	[%r17 + 0x0160], %r25
T2_asi_reg_rd_57:
	mov	0x3c6, %r14
	.word 0xf6db8e80  ! 1535: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_2_123:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_123), 16, 16)) -> intp(2, 0, 12)
iob_intr_2_124:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_124), 16, 16)) -> intp(2, 0, 1c)
	.word 0xfc5c4000  ! 1540: LDX_R	ldx	[%r17 + %r0], %r30
T2_asi_reg_wr_71:
	mov	0x3c6, %r14
	.word 0xfef38e40  ! 1543: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_2_126:
	setx	0x28022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc14e01b  ! 1551: LDUH_I	lduh	[%r19 + 0x001b], %r30
T2_asi_reg_rd_58:
	mov	0x11, %r14
	.word 0xf2db89e0  ! 1554: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_2_127:
	setx	0x2a002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4c0000  ! 1557: LDSB_R	ldsb	[%r16 + %r0], %r29
iob_intr_2_125:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_125), 16, 16)) -> intp(2, 0, 1)
	.word 0xfccd4020  ! 1560: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r30
T2_asi_reg_wr_72:
	mov	0x22, %r14
	.word 0xfaf38e60  ! 1562: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_2_128:
	setx	0x29033b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_73:
	mov	0x28, %r14
	.word 0xfcf38e40  ! 1567: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
	.word 0xb52cc000  ! 1574: SLL_R	sll 	%r19, %r0, %r26
iob_intr_2_126:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_126), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf815e05f  ! 1576: LDUH_I	lduh	[%r23 + 0x005f], %r28
iob_intr_2_127:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_127), 16, 16)) -> intp(2, 0, 8)
	.word 0xf0cd0020  ! 1581: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r24
	.word 0xb89ca14c  ! 1584: XORcc_I	xorcc 	%r18, 0x014c, %r28
T2_asi_reg_wr_74:
	mov	0x15, %r14
	.word 0xfcf38400  ! 1589: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T2_asi_reg_wr_75:
	mov	0x8, %r14
	.word 0xfef389e0  ! 1590: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T2_asi_reg_wr_76:
	mov	0x11, %r14
	.word 0xfaf38e60  ! 1591: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbaac0000  ! 1593: ANDNcc_R	andncc 	%r16, %r0, %r29
	.word 0xf404a038  ! 1596: LDUW_I	lduw	[%r18 + 0x0038], %r26
	.word 0xb2bc8000  ! 1597: XNORcc_R	xnorcc 	%r18, %r0, %r25
	.word 0xf6954020  ! 1598: LDUHA_R	lduha	[%r21, %r0] 0x01, %r27
	.word 0xf4056095  ! 1600: LDUW_I	lduw	[%r21 + 0x0095], %r26
cpu_intr_2_129:
	setx	0x280106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe948020  ! 1602: LDUHA_R	lduha	[%r18, %r0] 0x01, %r31
	.word 0xf6c50020  ! 1603: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r27
	.word 0xb835e11a  ! 1604: SUBC_I	orn 	%r23, 0x011a, %r28
	.word 0xb8bc2066  ! 1606: XNORcc_I	xnorcc 	%r16, 0x0066, %r28
iob_intr_2_128:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_128), 16, 16)) -> intp(2, 0, 9)
T2_asi_reg_rd_59:
	mov	0x3c3, %r14
	.word 0xfcdb8e60  ! 1610: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_130:
	setx	0x280034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb615e06a  ! 1618: OR_I	or 	%r23, 0x006a, %r27
iob_intr_2_129:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_129), 16, 16)) -> intp(2, 0, 4)
	ta	T_CHANGE_TO_TL0
	.word 0xfa4d219b  ! 1623: LDSB_I	ldsb	[%r20 + 0x019b], %r29
iob_intr_2_130:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_130), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_wr_77:
	mov	0xf, %r14
	.word 0xf4f38400  ! 1627: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xfc04e125  ! 1630: LDUW_I	lduw	[%r19 + 0x0125], %r30
	ta	T_CHANGE_TO_TL0
cpu_intr_2_131:
	setx	0x28030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982d02  ! 1634: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d02, %hpstate
	.word 0xfa140000  ! 1636: LDUH_R	lduh	[%r16 + %r0], %r29
	.word 0xfedc60cf  ! 1638: LDXA_I	ldxa	[%r17, + 0x00cf] %asi, %r31
T2_asi_reg_wr_78:
	mov	0x29, %r14
	.word 0xfaf38400  ! 1639: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_2_131:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_131), 16, 16)) -> intp(2, 0, 37)
	.word 0xf8158000  ! 1642: LDUH_R	lduh	[%r22 + %r0], %r28
	.word 0xfc0de17a  ! 1645: LDUB_I	ldub	[%r23 + 0x017a], %r30
cpu_intr_2_132:
	setx	0x290329, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_79:
	mov	0x4, %r14
	.word 0xf2f38e40  ! 1647: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_132:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_132), 16, 16)) -> intp(2, 0, 12)
T2_asi_reg_wr_80:
	mov	0x3c7, %r14
	.word 0xf4f38e60  ! 1651: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_2_133:
	setx	0x290318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2958020  ! 1653: LDUHA_R	lduha	[%r22, %r0] 0x01, %r25
	.word 0xb43dc000  ! 1656: XNOR_R	xnor 	%r23, %r0, %r26
	ta	T_CHANGE_TO_TL1
	.word 0xf8c5619d  ! 1660: LDSWA_I	ldswa	[%r21, + 0x019d] %asi, %r28
	.word 0xfc45600f  ! 1662: LDSW_I	ldsw	[%r21 + 0x000f], %r30
	.word 0xfcc5a0de  ! 1665: LDSWA_I	ldswa	[%r22, + 0x00de] %asi, %r30
	.word 0xfa446193  ! 1666: LDSW_I	ldsw	[%r17 + 0x0193], %r29
	.word 0xfc5de123  ! 1667: LDX_I	ldx	[%r23 + 0x0123], %r30
	.word 0xf4dda1c6  ! 1669: LDXA_I	ldxa	[%r22, + 0x01c6] %asi, %r26
iob_intr_2_133:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_133), 16, 16)) -> intp(2, 0, 2d)
T2_asi_reg_rd_60:
	mov	0x3c0, %r14
	.word 0xf2db8e60  ! 1675: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbcb4211c  ! 1676: ORNcc_I	orncc 	%r16, 0x011c, %r30
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_81:
	mov	0xd, %r14
	.word 0xf8f384a0  ! 1678: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf8c50020  ! 1681: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r28
cpu_intr_2_134:
	setx	0x2a012d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_134:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_134), 16, 16)) -> intp(2, 0, 1f)
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982892  ! 1684: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0892, %hpstate
	.word 0xf885e13d  ! 1686: LDUWA_I	lduwa	[%r23, + 0x013d] %asi, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6dd2133  ! 1689: LDXA_I	ldxa	[%r20, + 0x0133] %asi, %r27
cpu_intr_2_135:
	setx	0x2a020e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_136:
	setx	0x2a0127, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_135:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_135), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_rd_61:
	mov	0x21, %r14
	.word 0xfcdb8e80  ! 1697: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_2_137:
	setx	0x280316, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_136:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_136), 16, 16)) -> intp(2, 0, 2e)
iob_intr_2_137:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_137), 16, 16)) -> intp(2, 0, 1d)
iob_intr_2_138:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_138), 16, 16)) -> intp(2, 0, 39)
	.word 0xfc458000  ! 1707: LDSW_R	ldsw	[%r22 + %r0], %r30
cpu_intr_2_138:
	setx	0x2b022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf605215a  ! 1710: LDUW_I	lduw	[%r20 + 0x015a], %r27
iob_intr_2_139:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_139), 16, 16)) -> intp(2, 0, 2b)
iob_intr_2_140:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_140), 16, 16)) -> intp(2, 0, 2a)
cpu_intr_2_139:
	setx	0x2b0038, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_141:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_141), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf45d4000  ! 1718: LDX_R	ldx	[%r21 + %r0], %r26
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_140:
	setx	0x2b0310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc154000  ! 1730: LDUH_R	lduh	[%r21 + %r0], %r30
	.word 0xfe5ce0e4  ! 1734: LDX_I	ldx	[%r19 + 0x00e4], %r31
	.word 0xb49de088  ! 1738: XORcc_I	xorcc 	%r23, 0x0088, %r26
cpu_intr_2_141:
	setx	0x290330, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983850  ! 1740: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1850, %hpstate
cpu_intr_2_142:
	setx	0x2b0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_62:
	mov	0x25, %r14
	.word 0xf6db84a0  ! 1747: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_2_143:
	setx	0x29030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60ce133  ! 1749: LDUB_I	ldub	[%r19 + 0x0133], %r27
	.word 0xbf7c0400  ! 1751: MOVR_R	movre	%r16, %r0, %r31
cpu_intr_2_144:
	setx	0x28030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_82:
	mov	0x30, %r14
	.word 0xfef38e60  ! 1755: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T2_asi_reg_rd_63:
	mov	0x22, %r14
	.word 0xf8db8e80  ! 1756: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xfe95c020  ! 1757: LDUHA_R	lduha	[%r23, %r0] 0x01, %r31
	.word 0xb204204d  ! 1758: ADD_I	add 	%r16, 0x004d, %r25
	.word 0xfac4c020  ! 1760: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r29
iob_intr_2_142:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_142), 16, 16)) -> intp(2, 0, 1e)
iob_intr_2_143:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_143), 16, 16)) -> intp(2, 0, c)
	.word 0xfcd5a0a8  ! 1767: LDSHA_I	ldsha	[%r22, + 0x00a8] %asi, %r30
T2_asi_reg_wr_83:
	mov	0x34, %r14
	.word 0xf2f38400  ! 1768: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xf20c204c  ! 1769: LDUB_I	ldub	[%r16 + 0x004c], %r25
iob_intr_2_144:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_144), 16, 16)) -> intp(2, 0, 19)
	.word 0xfc5d0000  ! 1775: LDX_R	ldx	[%r20 + %r0], %r30
	ta	T_CHANGE_NONHPRIV
iob_intr_2_145:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_145), 16, 16)) -> intp(2, 0, 2)
	.word 0xf6cda022  ! 1781: LDSBA_I	ldsba	[%r22, + 0x0022] %asi, %r27
iob_intr_2_146:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_146), 16, 16)) -> intp(2, 0, 36)
iob_intr_2_147:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_147), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_rd_64:
	mov	0x10, %r14
	.word 0xfcdb8e40  ! 1784: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf444e1fe  ! 1788: LDSW_I	ldsw	[%r19 + 0x01fe], %r26
	.word 0xba3ce0fa  ! 1791: XNOR_I	xnor 	%r19, 0x00fa, %r29
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_65:
	mov	0x20, %r14
	.word 0xf0db89e0  ! 1795: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_2_148:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_148), 16, 16)) -> intp(2, 0, 25)
iob_intr_2_149:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_149), 16, 16)) -> intp(2, 0, 2a)
iob_intr_2_150:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_150), 16, 16)) -> intp(2, 0, 1f)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_66:
	mov	0x3c7, %r14
	.word 0xfedb84a0  ! 1808: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_2_145:
	setx	0x280029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0458000  ! 1813: LDSW_R	ldsw	[%r22 + %r0], %r24
iob_intr_2_151:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_151), 16, 16)) -> intp(2, 0, 33)
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_67:
	mov	0x3c1, %r14
	.word 0xfedb8e40  ! 1821: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T2_asi_reg_rd_68:
	mov	0x3c0, %r14
	.word 0xfcdb8e40  ! 1822: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb044e0c2  ! 1823: ADDC_I	addc 	%r19, 0x00c2, %r24
	.word 0xfe55c000  ! 1824: LDSH_R	ldsh	[%r23 + %r0], %r31
T2_asi_reg_wr_84:
	mov	0x1b, %r14
	.word 0xf4f38e60  ! 1825: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T2_asi_reg_wr_85:
	mov	0x17, %r14
	.word 0xf2f384a0  ! 1826: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T2_asi_reg_wr_86:
	mov	0x4, %r14
	.word 0xf4f384a0  ! 1829: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T2_asi_reg_wr_87:
	mov	0x3c4, %r14
	.word 0xfef38e40  ! 1830: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_152:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_152), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_rd_69:
	mov	0x3, %r14
	.word 0xf0db8e80  ! 1832: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_2_146:
	setx	0x2b030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_147:
	setx	0x29020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0940020  ! 1843: LDUHA_R	lduha	[%r16, %r0] 0x01, %r24
cpu_intr_2_148:
	setx	0x2b0122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfed48020  ! 1849: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r31
T2_asi_reg_wr_88:
	mov	0x2, %r14
	.word 0xfcf38400  ! 1850: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T2_asi_reg_rd_70:
	mov	0x8, %r14
	.word 0xf0db8e80  ! 1851: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xf04421cc  ! 1852: LDSW_I	ldsw	[%r16 + 0x01cc], %r24
cpu_intr_2_149:
	setx	0x2d002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_2_153:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_153), 16, 16)) -> intp(2, 0, 19)
cpu_intr_2_150:
	setx	0x2d032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_151:
	setx	0x2f0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b5206e  ! 1865: ORNcc_I	orncc 	%r20, 0x006e, %r24
	.word 0xf2154000  ! 1866: LDUH_R	lduh	[%r21 + %r0], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_152:
	setx	0x2c0229, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_71:
	mov	0x12, %r14
	.word 0xf0db8e40  ! 1871: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_2_153:
	setx	0x2d030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0058000  ! 1876: LDUW_R	lduw	[%r22 + %r0], %r24
	.word 0xf68cc020  ! 1883: LDUBA_R	lduba	[%r19, %r0] 0x01, %r27
iob_intr_2_154:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_154), 16, 16)) -> intp(2, 0, 12)
T2_asi_reg_wr_89:
	mov	0x29, %r14
	.word 0xfaf38400  ! 1885: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb61de04c  ! 1886: XOR_I	xor 	%r23, 0x004c, %r27
cpu_intr_2_154:
	setx	0x2c0002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba956063  ! 1889: ORcc_I	orcc 	%r21, 0x0063, %r29
T2_asi_reg_wr_90:
	mov	0x2f, %r14
	.word 0xf4f389e0  ! 1890: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_2_155:
	setx	0x2c0201, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xbd510000  ! 1895: RDPR_TICK	<illegal instruction>
iob_intr_2_155:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_155), 16, 16)) -> intp(2, 0, 4)
	.word 0xfc558000  ! 1901: LDSH_R	ldsh	[%r22 + %r0], %r30
iob_intr_2_156:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_156), 16, 16)) -> intp(2, 0, 21)
	.word 0xbc3d8000  ! 1904: XNOR_R	xnor 	%r22, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_72:
	mov	0x3c8, %r14
	.word 0xf0db8e60  ! 1906: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	ta	T_CHANGE_NONHPRIV
	.word 0xb93dd000  ! 1910: SRAX_R	srax	%r23, %r0, %r28
cpu_intr_2_156:
	setx	0x2e013b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_157:
	setx	0x2d0023, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_157:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_157), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_wr_91:
	mov	0x18, %r14
	.word 0xf6f38e40  ! 1919: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf485c020  ! 1921: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r26
T2_asi_reg_rd_73:
	mov	0x22, %r14
	.word 0xf2db8e80  ! 1924: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T2_asi_reg_rd_74:
	mov	0x2d, %r14
	.word 0xf2db8e40  ! 1927: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb83d8000  ! 1929: XNOR_R	xnor 	%r22, %r0, %r28
T2_asi_reg_rd_75:
	mov	0x3c0, %r14
	.word 0xfedb8e60  ! 1930: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T2_asi_reg_wr_92:
	mov	0x2f, %r14
	.word 0xf6f38e40  ! 1931: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_wr_93:
	mov	0x8, %r14
	.word 0xfef38e40  ! 1933: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_158:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_158), 16, 16)) -> intp(2, 0, 10)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf0148000  ! 1941: LDUH_R	lduh	[%r18 + %r0], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2450000  ! 1943: LDSW_R	ldsw	[%r20 + %r0], %r25
iob_intr_2_159:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_159), 16, 16)) -> intp(2, 0, 20)
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_94:
	mov	0x4, %r14
	.word 0xf8f389e0  ! 1948: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xfe0460d3  ! 1950: LDUW_I	lduw	[%r17 + 0x00d3], %r31
iob_intr_2_160:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_160), 16, 16)) -> intp(2, 0, 1c)
	.word 0xfedca173  ! 1956: LDXA_I	ldxa	[%r18, + 0x0173] %asi, %r31
	setx	data_start_4, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982880  ! 1958: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0880, %hpstate
T2_asi_reg_wr_95:
	mov	0x3c5, %r14
	.word 0xf6f38e60  ! 1962: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xfc8dc020  ! 1963: LDUBA_R	lduba	[%r23, %r0] 0x01, %r30
cpu_intr_2_158:
	setx	0x2f023b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_159:
	setx	0x2c0230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3c7001  ! 1973: SRAX_I	srax	%r17, 0x0001, %r31
	.word 0xf645e0d0  ! 1977: LDSW_I	ldsw	[%r23 + 0x00d0], %r27
	.word 0xba2cc000  ! 1978: ANDN_R	andn 	%r19, %r0, %r29
T2_asi_reg_rd_76:
	mov	0x3c3, %r14
	.word 0xf6db8400  ! 1981: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_2_160:
	setx	0x2f0211, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_77:
	mov	0x3, %r14
	.word 0xf4db8e40  ! 1985: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_2_161:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_161), 16, 16)) -> intp(2, 0, 7)
	.word 0xfe4d20ae  ! 1990: LDSB_I	ldsb	[%r20 + 0x00ae], %r31
cpu_intr_2_161:
	setx	0x2e023b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_162:
	setx	0x2f0214, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_163:
	setx	0x2c0338, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_96:
	mov	0x1d, %r14
	.word 0xf8f38e80  ! 1995: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb43d217f  ! 1996: XNOR_I	xnor 	%r20, 0x017f, %r26
	.word 0xf65ca018  ! 1997: LDX_I	ldx	[%r18 + 0x0018], %r27
T2_asi_reg_rd_78:
	mov	0x38, %r14
	.word 0xf6db84a0  ! 2000: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T2_asi_reg_wr_97:
	mov	0x28, %r14
	.word 0xf2f38e40  ! 2002: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfc8c8020  ! 2004: LDUBA_R	lduba	[%r18, %r0] 0x01, %r30
iob_intr_2_162:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_162), 16, 16)) -> intp(2, 0, 27)
	ta	T_CHANGE_TO_TL1
cpu_intr_2_164:
	setx	0x2f001b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_165:
	setx	0x2f0136, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_98:
	mov	0x10, %r14
	.word 0xf2f389e0  ! 2012: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_2_163:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_163), 16, 16)) -> intp(2, 0, 1c)
cpu_intr_2_166:
	setx	0x2c0333, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_164:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_164), 16, 16)) -> intp(2, 0, 31)
	.word 0xf6454000  ! 2019: LDSW_R	ldsw	[%r21 + %r0], %r27
	.word 0xf4448000  ! 2020: LDSW_R	ldsw	[%r18 + %r0], %r26
T2_asi_reg_rd_79:
	mov	0x3c1, %r14
	.word 0xf0db8e60  ! 2022: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbd340000  ! 2024: SRL_R	srl 	%r16, %r0, %r30
T2_asi_reg_rd_80:
	mov	0x3c4, %r14
	.word 0xfedb8e40  ! 2029: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_2_167:
	setx	0x2c0115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf245e0a3  ! 2036: LDSW_I	ldsw	[%r23 + 0x00a3], %r25
T2_asi_reg_rd_81:
	mov	0x9, %r14
	.word 0xfadb8e40  ! 2037: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xba3d4000  ! 2038: XNOR_R	xnor 	%r21, %r0, %r29
T2_asi_reg_rd_82:
	mov	0x18, %r14
	.word 0xf6db8e80  ! 2041: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T2_asi_reg_rd_83:
	mov	0x35, %r14
	.word 0xfadb8e40  ! 2044: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_2_168:
	setx	0x2f013d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_99:
	mov	0x3c5, %r14
	.word 0xfaf38e80  ! 2047: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf2854020  ! 2049: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r25
T2_asi_reg_rd_84:
	mov	0x31, %r14
	.word 0xfadb8e40  ! 2051: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_2_169:
	setx	0x2c0330, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_165:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_165), 16, 16)) -> intp(2, 0, 3b)
	ta	T_CHANGE_HPRIV
	.word 0xfe0d2089  ! 2057: LDUB_I	ldub	[%r20 + 0x0089], %r31
	.word 0xf00ca0c9  ! 2060: LDUB_I	ldub	[%r18 + 0x00c9], %r24
iob_intr_2_166:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_166), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf20520df  ! 2068: LDUW_I	lduw	[%r20 + 0x00df], %r25
T2_asi_reg_wr_100:
	mov	0x1b, %r14
	.word 0xf2f384a0  ! 2069: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T2_asi_reg_wr_101:
	mov	0x4, %r14
	.word 0xf8f389e0  ! 2070: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_2_167:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_167), 16, 16)) -> intp(2, 0, 30)
	.word 0xf60c60a2  ! 2072: LDUB_I	ldub	[%r17 + 0x00a2], %r27
	.word 0xfe45a0dc  ! 2074: LDSW_I	ldsw	[%r22 + 0x00dc], %r31
cpu_intr_2_170:
	setx	0x2c0236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc54c000  ! 2077: LDSH_R	ldsh	[%r19 + %r0], %r30
cpu_intr_2_171:
	setx	0x2f030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_85:
	mov	0x3c3, %r14
	.word 0xf2db89e0  ! 2087: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_2_172:
	setx	0x2e021d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_173:
	setx	0x2e0329, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983cc2  ! 2092: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc2, %hpstate
	.word 0xfe14206b  ! 2098: LDUH_I	lduh	[%r16 + 0x006b], %r31
iob_intr_2_168:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_168), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_wr_102:
	mov	0xe, %r14
	.word 0xf4f38e80  ! 2103: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982ed0  ! 2104: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed0, %hpstate
	.word 0xfa4420aa  ! 2106: LDSW_I	ldsw	[%r16 + 0x00aa], %r29
T2_asi_reg_rd_86:
	mov	0x32, %r14
	.word 0xf4db8e40  ! 2107: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_2_174:
	setx	0x2e003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8195a161  ! 2117: WRPR_TPC_I	wrpr	%r22, 0x0161, %tpc
iob_intr_2_169:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_169), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf6058000  ! 2120: LDUW_R	lduw	[%r22 + %r0], %r27
T2_asi_reg_wr_103:
	mov	0x3c8, %r14
	.word 0xf4f38400  ! 2121: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf094c020  ! 2124: LDUHA_R	lduha	[%r19, %r0] 0x01, %r24
T2_asi_reg_wr_104:
	mov	0x3c2, %r14
	.word 0xf6f38e60  ! 2126: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf05ce162  ! 2130: LDX_I	ldx	[%r19 + 0x0162], %r24
cpu_intr_2_175:
	setx	0x2e031d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_105:
	mov	0x7, %r14
	.word 0xfaf38e40  ! 2137: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_170:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_170), 16, 16)) -> intp(2, 0, 34)
	.word 0xf645c000  ! 2139: LDSW_R	ldsw	[%r23 + %r0], %r27
	.word 0xb69c21b8  ! 2142: XORcc_I	xorcc 	%r16, 0x01b8, %r27
	.word 0xf4d58020  ! 2144: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r26
	.word 0xf6dd6140  ! 2149: LDXA_I	ldxa	[%r21, + 0x0140] %asi, %r27
	.word 0xb62d4000  ! 2152: ANDN_R	andn 	%r21, %r0, %r27
iob_intr_2_171:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_171), 16, 16)) -> intp(2, 0, 2f)
	.word 0xfc5dc000  ! 2154: LDX_R	ldx	[%r23 + %r0], %r30
cpu_intr_2_176:
	setx	0x2c021d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_106:
	mov	0xc, %r14
	.word 0xfaf38e80  ! 2156: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T2_asi_reg_rd_87:
	mov	0x3c5, %r14
	.word 0xfcdb89e0  ! 2161: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_2_172:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_172), 16, 16)) -> intp(2, 0, 8)
	.word 0xfcdd20a0  ! 2164: LDXA_I	ldxa	[%r20, + 0x00a0] %asi, %r30
	.word 0xf8140000  ! 2168: LDUH_R	lduh	[%r16 + %r0], %r28
	.word 0xfcd50020  ! 2169: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r30
	.word 0xf0dde11a  ! 2170: LDXA_I	ldxa	[%r23, + 0x011a] %asi, %r24
T2_asi_reg_wr_107:
	mov	0x3c3, %r14
	.word 0xf4f38e80  ! 2171: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_2_173:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_173), 16, 16)) -> intp(2, 0, 1e)
	.word 0xfe55a1a7  ! 2176: LDSH_I	ldsh	[%r22 + 0x01a7], %r31
	.word 0xb52cd000  ! 2177: SLLX_R	sllx	%r19, %r0, %r26
T2_asi_reg_wr_108:
	mov	0x32, %r14
	.word 0xfcf38e40  ! 2181: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_rd_88:
	mov	0x20, %r14
	.word 0xf0db8400  ! 2182: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xfe0c200f  ! 2183: LDUB_I	ldub	[%r16 + 0x000f], %r31
	ta	T_CHANGE_TO_TL1
cpu_intr_2_177:
	setx	0x2d002e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_178:
	setx	0x2c0318, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_174:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_174), 16, 16)) -> intp(2, 0, 32)
iob_intr_2_175:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_175), 16, 16)) -> intp(2, 0, 1d)
	.word 0xfe45e0f6  ! 2190: LDSW_I	ldsw	[%r23 + 0x00f6], %r31
cpu_intr_2_179:
	setx	0x2f0208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1504000  ! 2195: RDPR_TNPC	<illegal instruction>
	.word 0xfc958020  ! 2196: LDUHA_R	lduha	[%r22, %r0] 0x01, %r30
cpu_intr_2_180:
	setx	0x2e0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xfc4da07c  ! 2205: LDSB_I	ldsb	[%r22 + 0x007c], %r30
T2_asi_reg_wr_109:
	mov	0x1a, %r14
	.word 0xfef38e40  ! 2206: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_rd_89:
	mov	0xa, %r14
	.word 0xfedb8e40  ! 2208: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf24c0000  ! 2211: LDSB_R	ldsb	[%r16 + %r0], %r25
	.word 0xf49420fc  ! 2214: LDUHA_I	lduha	[%r16, + 0x00fc] %asi, %r26
iob_intr_2_176:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_176), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf6858020  ! 2218: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r27
	.word 0xb12c6001  ! 2219: SLL_I	sll 	%r17, 0x0001, %r24
T2_asi_reg_wr_110:
	mov	0x3c8, %r14
	.word 0xfcf389e0  ! 2220: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_2_177:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_177), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_wr_111:
	mov	0x6, %r14
	.word 0xf2f389e0  ! 2224: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xfac4211c  ! 2232: LDSWA_I	ldswa	[%r16, + 0x011c] %asi, %r29
iob_intr_2_178:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_178), 16, 16)) -> intp(2, 0, 1d)
T2_asi_reg_wr_112:
	mov	0x2a, %r14
	.word 0xfaf38e80  ! 2234: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T2_asi_reg_wr_113:
	mov	0x6, %r14
	.word 0xfaf38e40  ! 2238: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf05c61f4  ! 2240: LDX_I	ldx	[%r17 + 0x01f4], %r24
cpu_intr_2_181:
	setx	0x2f0234, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_179:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_179), 16, 16)) -> intp(2, 0, 12)
	.word 0xf44d4000  ! 2245: LDSB_R	ldsb	[%r21 + %r0], %r26
T2_asi_reg_rd_90:
	mov	0x14, %r14
	.word 0xf0db84a0  ! 2246: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	ta	T_CHANGE_NONHPRIV
	.word 0xb41cc000  ! 2249: XOR_R	xor 	%r19, %r0, %r26
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983a4a  ! 2250: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a4a, %hpstate
	.word 0xf45d0000  ! 2253: LDX_R	ldx	[%r20 + %r0], %r26
cpu_intr_2_182:
	setx	0x2f0228, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
iob_intr_2_180:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_180), 16, 16)) -> intp(2, 0, 7)
cpu_intr_2_183:
	setx	0x2e0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb61520c3  ! 2262: OR_I	or 	%r20, 0x00c3, %r27
	.word 0xfacc8020  ! 2263: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r29
iob_intr_2_181:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_181), 16, 16)) -> intp(2, 0, 3a)
iob_intr_2_182:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_182), 16, 16)) -> intp(2, 0, a)
	.word 0xf4dce058  ! 2271: LDXA_I	ldxa	[%r19, + 0x0058] %asi, %r26
iob_intr_2_183:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_183), 16, 16)) -> intp(2, 0, 3d)
	.word 0xfa0d21dd  ! 2274: LDUB_I	ldub	[%r20 + 0x01dd], %r29
T2_asi_reg_rd_91:
	mov	0x28, %r14
	.word 0xf6db8400  ! 2280: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_2_184:
	setx	0x2d0135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc0d8000  ! 2283: LDUB_R	ldub	[%r22 + %r0], %r30
	ta	T_CHANGE_HPRIV
cpu_intr_2_185:
	setx	0x2d0235, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_184:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_184), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_186:
	setx	0x2c020a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_185:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_185), 16, 16)) -> intp(2, 0, 16)
iob_intr_2_186:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_186), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf8c54020  ! 2300: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r28
T2_asi_reg_wr_114:
	mov	0x3c1, %r14
	.word 0xf6f389e0  ! 2301: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf29520a2  ! 2302: LDUHA_I	lduha	[%r20, + 0x00a2] %asi, %r25
	.word 0xf015c000  ! 2305: LDUH_R	lduh	[%r23 + %r0], %r24
cpu_intr_2_187:
	setx	0x31032b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_187:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_187), 16, 16)) -> intp(2, 0, 13)
T2_asi_reg_rd_92:
	mov	0x2e, %r14
	.word 0xfcdb8e40  ! 2308: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb4b420df  ! 2309: SUBCcc_I	orncc 	%r16, 0x00df, %r26
iob_intr_2_188:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_188), 16, 16)) -> intp(2, 0, 39)
cpu_intr_2_188:
	setx	0x310214, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_189:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_189), 16, 16)) -> intp(2, 0, 19)
T2_asi_reg_wr_115:
	mov	0x4, %r14
	.word 0xf0f38400  ! 2314: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T2_asi_reg_wr_116:
	mov	0x3c3, %r14
	.word 0xf6f38e60  ! 2315: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_2_190:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_190), 16, 16)) -> intp(2, 0, 9)
	.word 0xf454c000  ! 2317: LDSH_R	ldsh	[%r19 + %r0], %r26
	.word 0xf004e174  ! 2318: LDUW_I	lduw	[%r19 + 0x0174], %r24
	.word 0xfa0d20cc  ! 2319: LDUB_I	ldub	[%r20 + 0x00cc], %r29
iob_intr_2_191:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_191), 16, 16)) -> intp(2, 0, 9)
T2_asi_reg_wr_117:
	mov	0x1d, %r14
	.word 0xfef384a0  ! 2323: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_192:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_192), 16, 16)) -> intp(2, 0, d)
	.word 0xf8152107  ! 2333: LDUH_I	lduh	[%r20 + 0x0107], %r28
	.word 0xf88c8020  ! 2334: LDUBA_R	lduba	[%r18, %r0] 0x01, %r28
iob_intr_2_193:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_193), 16, 16)) -> intp(2, 0, 14)
	setx	data_start_1, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982f4a  ! 2337: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4a, %hpstate
	.word 0xbf641800  ! 2339: MOVcc_R	<illegal instruction>
iob_intr_2_194:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_194), 16, 16)) -> intp(2, 0, 14)
	.word 0xf2156121  ! 2341: LDUH_I	lduh	[%r21 + 0x0121], %r25
	.word 0xbe454000  ! 2343: ADDC_R	addc 	%r21, %r0, %r31
	.word 0xfc54c000  ! 2345: LDSH_R	ldsh	[%r19 + %r0], %r30
cpu_intr_2_189:
	setx	0x300130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf285e0af  ! 2347: LDUWA_I	lduwa	[%r23, + 0x00af] %asi, %r25
	.word 0xf40d8000  ! 2350: LDUB_R	ldub	[%r22 + %r0], %r26
cpu_intr_2_190:
	setx	0x33012f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_195:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_195), 16, 16)) -> intp(2, 0, 21)
	.word 0xf05c0000  ! 2356: LDX_R	ldx	[%r16 + %r0], %r24
	.word 0xf8cc0020  ! 2361: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r28
iob_intr_2_196:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_196), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf65d4000  ! 2367: LDX_R	ldx	[%r21 + %r0], %r27
iob_intr_2_197:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_197), 16, 16)) -> intp(2, 0, 20)
T2_asi_reg_wr_118:
	mov	0x3c0, %r14
	.word 0xfcf38e80  ! 2370: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_2_198:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_198), 16, 16)) -> intp(2, 0, 9)
T2_asi_reg_wr_119:
	mov	0x3c0, %r14
	.word 0xfcf38e80  ! 2374: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb2b520ac  ! 2376: SUBCcc_I	orncc 	%r20, 0x00ac, %r25
cpu_intr_2_191:
	setx	0x300214, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_120:
	mov	0x27, %r14
	.word 0xf8f38e80  ! 2378: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0x9195a09d  ! 2380: WRPR_PIL_I	wrpr	%r22, 0x009d, %pil
cpu_intr_2_192:
	setx	0x310209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe950020  ! 2383: LDUHA_R	lduha	[%r20, %r0] 0x01, %r31
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_93:
	mov	0x3c7, %r14
	.word 0xf8db89e0  ! 2386: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb4bd8000  ! 2387: XNORcc_R	xnorcc 	%r22, %r0, %r26
	.word 0xf44d60ef  ! 2389: LDSB_I	ldsb	[%r21 + 0x00ef], %r26
T2_asi_reg_wr_121:
	mov	0x8, %r14
	.word 0xf6f38e40  ! 2392: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_rd_94:
	mov	0x3c6, %r14
	.word 0xf0db8e80  ! 2393: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_2_199:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_199), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_rd_95:
	mov	0x13, %r14
	.word 0xf2db8e80  ! 2398: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_2_193:
	setx	0x310034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc95c000  ! 2404: ORcc_R	orcc 	%r23, %r0, %r30
	.word 0xf6cca137  ! 2405: LDSBA_I	ldsba	[%r18, + 0x0137] %asi, %r27
	ta	T_CHANGE_TO_TL0
	.word 0xb3641800  ! 2408: MOVcc_R	<illegal instruction>
	.word 0xba34e02b  ! 2410: SUBC_I	orn 	%r19, 0x002b, %r29
	.word 0xf88c2198  ! 2412: LDUBA_I	lduba	[%r16, + 0x0198] %asi, %r28
	.word 0xfe15e1e4  ! 2414: LDUH_I	lduh	[%r23 + 0x01e4], %r31
	.word 0xf65c0000  ! 2415: LDX_R	ldx	[%r16 + %r0], %r27
iob_intr_2_200:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_200), 16, 16)) -> intp(2, 0, 14)
iob_intr_2_201:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_201), 16, 16)) -> intp(2, 0, 3e)
	.word 0xfa44a05d  ! 2419: LDSW_I	ldsw	[%r18 + 0x005d], %r29
iob_intr_2_202:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_202), 16, 16)) -> intp(2, 0, 1c)
iob_intr_2_203:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_203), 16, 16)) -> intp(2, 0, 0)
	.word 0xf2d58020  ! 2424: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r25
	.word 0xf28c603d  ! 2426: LDUBA_I	lduba	[%r17, + 0x003d] %asi, %r25
	.word 0xb97ce401  ! 2427: MOVR_I	movre	%r19, 0x1, %r28
iob_intr_2_204:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_204), 16, 16)) -> intp(2, 0, 1f)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_122:
	mov	0xf, %r14
	.word 0xf2f38e40  ! 2435: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_205:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_205), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_rd_96:
	mov	0x11, %r14
	.word 0xfcdb8e60  ! 2440: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T2_asi_reg_wr_123:
	mov	0x3c0, %r14
	.word 0xfaf38400  ! 2441: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_2_194:
	setx	0x31031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_206:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_206), 16, 16)) -> intp(2, 0, 38)
	.word 0xf2dd6017  ! 2446: LDXA_I	ldxa	[%r21, + 0x0017] %asi, %r25
	.word 0xf2c5a008  ! 2447: LDSWA_I	ldswa	[%r22, + 0x0008] %asi, %r25
cpu_intr_2_195:
	setx	0x31012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
	.word 0xb08d6107  ! 2457: ANDcc_I	andcc 	%r21, 0x0107, %r24
T2_asi_reg_rd_97:
	mov	0x1d, %r14
	.word 0xfcdb8e80  ! 2458: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf0d5c020  ! 2459: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r24
cpu_intr_2_196:
	setx	0x320219, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_197:
	setx	0x32022c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_98:
	mov	0x2e, %r14
	.word 0xf8db8e80  ! 2464: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T2_asi_reg_wr_124:
	mov	0x36, %r14
	.word 0xf2f38e40  ! 2466: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_2_198:
	setx	0x31001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6458000  ! 2469: LDSW_R	ldsw	[%r22 + %r0], %r27
	.word 0xf615e06b  ! 2472: LDUH_I	lduh	[%r23 + 0x006b], %r27
	.word 0xb4b42135  ! 2473: ORNcc_I	orncc 	%r16, 0x0135, %r26
	.word 0xbc2c4000  ! 2475: ANDN_R	andn 	%r17, %r0, %r30
T2_asi_reg_wr_125:
	mov	0x5, %r14
	.word 0xfaf38e80  ! 2477: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_2_207:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_207), 16, 16)) -> intp(2, 0, 3)
	ta	T_CHANGE_TO_TL0
	.word 0xfe14a0ff  ! 2481: LDUH_I	lduh	[%r18 + 0x00ff], %r31
cpu_intr_2_199:
	setx	0x320333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25ce118  ! 2484: LDX_I	ldx	[%r19 + 0x0118], %r25
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xf2140000  ! 2491: LDUH_R	lduh	[%r16 + %r0], %r25
T2_asi_reg_wr_126:
	mov	0x2b, %r14
	.word 0xfaf38400  ! 2494: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf094e02f  ! 2495: LDUHA_I	lduha	[%r19, + 0x002f] %asi, %r24
	.word 0xf2cc4020  ! 2496: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r25
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_127:
	mov	0x3c2, %r14
	.word 0xfaf38e80  ! 2500: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf2c4e052  ! 2505: LDSWA_I	ldswa	[%r19, + 0x0052] %asi, %r25
cpu_intr_2_200:
	setx	0x30011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbca58000  ! 2507: SUBcc_R	subcc 	%r22, %r0, %r30
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983d98  ! 2509: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d98, %hpstate
	.word 0xfa050000  ! 2511: LDUW_R	lduw	[%r20 + %r0], %r29
T2_asi_reg_rd_99:
	mov	0x13, %r14
	.word 0xfadb8e40  ! 2513: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfa4d8000  ! 2514: LDSB_R	ldsb	[%r22 + %r0], %r29
	.word 0xf2d5c020  ! 2516: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r25
	.word 0xbe8d60eb  ! 2517: ANDcc_I	andcc 	%r21, 0x00eb, %r31
	.word 0xb2356039  ! 2519: SUBC_I	orn 	%r21, 0x0039, %r25
cpu_intr_2_201:
	setx	0x330235, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_202:
	setx	0x310030, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_208:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_208), 16, 16)) -> intp(2, 0, 3b)
iob_intr_2_209:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_209), 16, 16)) -> intp(2, 0, f)
T2_asi_reg_wr_128:
	mov	0x2e, %r14
	.word 0xfaf38400  ! 2529: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf294605d  ! 2530: LDUHA_I	lduha	[%r17, + 0x005d] %asi, %r25
T2_asi_reg_rd_100:
	mov	0x1, %r14
	.word 0xf0db84a0  ! 2532: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_210:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_210), 16, 16)) -> intp(2, 0, 3c)
iob_intr_2_211:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_211), 16, 16)) -> intp(2, 0, 39)
	.word 0xf2954020  ! 2540: LDUHA_R	lduha	[%r21, %r0] 0x01, %r25
T2_asi_reg_rd_101:
	mov	0x18, %r14
	.word 0xf4db8400  ! 2542: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_102:
	mov	0x19, %r14
	.word 0xf4db8e40  ! 2544: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_2_203:
	setx	0x330208, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_212:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_212), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_rd_103:
	mov	0x26, %r14
	.word 0xfadb8e60  ! 2549: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T2_asi_reg_wr_129:
	mov	0x11, %r14
	.word 0xfcf38e80  ! 2552: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_2_204:
	setx	0x320210, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_205:
	setx	0x330211, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_213:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_213), 16, 16)) -> intp(2, 0, 1f)
iob_intr_2_214:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_214), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf654a1e3  ! 2560: LDSH_I	ldsh	[%r18 + 0x01e3], %r27
	.word 0xfc45c000  ! 2562: LDSW_R	ldsw	[%r23 + %r0], %r30
iob_intr_2_215:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_215), 16, 16)) -> intp(2, 0, 24)
	.word 0xfa448000  ! 2565: LDSW_R	ldsw	[%r18 + %r0], %r29
iob_intr_2_216:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_216), 16, 16)) -> intp(2, 0, 1a)
	.word 0xfa8c20b5  ! 2568: LDUBA_I	lduba	[%r16, + 0x00b5] %asi, %r29
	ta	T_CHANGE_HPRIV
iob_intr_2_217:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_217), 16, 16)) -> intp(2, 0, 15)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc0d2085  ! 2579: LDUB_I	ldub	[%r20 + 0x0085], %r30
iob_intr_2_218:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_218), 16, 16)) -> intp(2, 0, 0)
iob_intr_2_219:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_219), 16, 16)) -> intp(2, 0, 20)
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983f12  ! 2588: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f12, %hpstate
T2_asi_reg_rd_104:
	mov	0x3c6, %r14
	.word 0xfcdb84a0  ! 2592: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_2_206:
	setx	0x330318, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_207:
	setx	0x310322, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_130:
	mov	0xd, %r14
	.word 0xf8f38e60  ! 2597: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_2_208:
	setx	0x33023f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_220:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_220), 16, 16)) -> intp(2, 0, 21)
cpu_intr_2_209:
	setx	0x310037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44d4000  ! 2602: LDSB_R	ldsb	[%r21 + %r0], %r26
	.word 0xbec58000  ! 2604: ADDCcc_R	addccc 	%r22, %r0, %r31
T2_asi_reg_rd_105:
	mov	0x0, %r14
	.word 0xf8db8400  ! 2606: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xf0846161  ! 2607: LDUWA_I	lduwa	[%r17, + 0x0161] %asi, %r24
T2_asi_reg_wr_131:
	mov	0x3c7, %r14
	.word 0xf2f38e40  ! 2609: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf4948020  ! 2611: LDUHA_R	lduha	[%r18, %r0] 0x01, %r26
iob_intr_2_221:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_221), 16, 16)) -> intp(2, 0, 11)
	.word 0xfedd6006  ! 2614: LDXA_I	ldxa	[%r21, + 0x0006] %asi, %r31
iob_intr_2_222:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_222), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf8cca047  ! 2617: LDSBA_I	ldsba	[%r18, + 0x0047] %asi, %r28
	.word 0xfacc8020  ! 2618: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r29
	.word 0xfc4dc000  ! 2621: LDSB_R	ldsb	[%r23 + %r0], %r30
iob_intr_2_223:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_223), 16, 16)) -> intp(2, 0, 18)
cpu_intr_2_210:
	setx	0x33003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf84561c4  ! 2630: LDSW_I	ldsw	[%r21 + 0x01c4], %r28
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_132:
	mov	0x31, %r14
	.word 0xf8f38e40  ! 2634: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf80d4000  ! 2636: LDUB_R	ldub	[%r21 + %r0], %r28
	ta	T_CHANGE_HPRIV
	.word 0xf8054000  ! 2643: LDUW_R	lduw	[%r21 + %r0], %r28
iob_intr_2_224:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_224), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_225:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_225), 16, 16)) -> intp(2, 0, 34)
	.word 0xfe0460da  ! 2652: LDUW_I	lduw	[%r17 + 0x00da], %r31
cpu_intr_2_211:
	setx	0x300131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfed5a199  ! 2655: LDSHA_I	ldsha	[%r22, + 0x0199] %asi, %r31
	.word 0xf0c58020  ! 2662: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r24
T2_asi_reg_rd_106:
	mov	0x3c3, %r14
	.word 0xf0db8e40  ! 2667: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb33c3001  ! 2671: SRAX_I	srax	%r16, 0x0001, %r25
T2_asi_reg_wr_133:
	mov	0x36, %r14
	.word 0xf2f38e60  ! 2672: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_2_226:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_226), 16, 16)) -> intp(2, 0, 10)
iob_intr_2_227:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_227), 16, 16)) -> intp(2, 0, 38)
iob_intr_2_228:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_228), 16, 16)) -> intp(2, 0, 14)
T2_asi_reg_wr_134:
	mov	0x29, %r14
	.word 0xf6f38e40  ! 2681: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_2_212:
	setx	0x31010a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_229:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_229), 16, 16)) -> intp(2, 0, 15)
iob_intr_2_230:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_230), 16, 16)) -> intp(2, 0, 37)
	.word 0xb03dc000  ! 2686: XNOR_R	xnor 	%r23, %r0, %r24
iob_intr_2_231:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_231), 16, 16)) -> intp(2, 0, d)
	.word 0xfacd21bf  ! 2690: LDSBA_I	ldsba	[%r20, + 0x01bf] %asi, %r29
cpu_intr_2_213:
	setx	0x300325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb23da1dc  ! 2692: XNOR_I	xnor 	%r22, 0x01dc, %r25
	.word 0xfac52198  ! 2693: LDSWA_I	ldswa	[%r20, + 0x0198] %asi, %r29
iob_intr_2_232:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_232), 16, 16)) -> intp(2, 0, 39)
	.word 0xf44de1a7  ! 2697: LDSB_I	ldsb	[%r23 + 0x01a7], %r26
	.word 0xfe0d0000  ! 2698: LDUB_R	ldub	[%r20 + %r0], %r31
	.word 0xf454e1db  ! 2699: LDSH_I	ldsh	[%r19 + 0x01db], %r26
iob_intr_2_233:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_233), 16, 16)) -> intp(2, 0, 33)
	ta	T_CHANGE_TO_TL0
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983910  ! 2705: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1910, %hpstate
T2_asi_reg_rd_107:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 2707: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_wr_135:
	mov	0x1e, %r14
	.word 0xf4f38e80  ! 2709: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf60c4000  ! 2710: LDUB_R	ldub	[%r17 + %r0], %r27
T2_asi_reg_wr_136:
	mov	0x3c2, %r14
	.word 0xf0f38e80  ! 2712: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T2_asi_reg_rd_108:
	mov	0xd, %r14
	.word 0xf2db8e40  ! 2714: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_2_234:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_234), 16, 16)) -> intp(2, 0, 37)
iob_intr_2_235:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_235), 16, 16)) -> intp(2, 0, 2)
cpu_intr_2_214:
	setx	0x30003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc5d216d  ! 2723: LDX_I	ldx	[%r20 + 0x016d], %r30
T2_asi_reg_rd_109:
	mov	0x6, %r14
	.word 0xf2db8400  ! 2724: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf294a1ce  ! 2725: LDUHA_I	lduha	[%r18, + 0x01ce] %asi, %r25
cpu_intr_2_215:
	setx	0x33021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbac46181  ! 2728: ADDCcc_I	addccc 	%r17, 0x0181, %r29
cpu_intr_2_216:
	setx	0x330125, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_110:
	mov	0x3c1, %r14
	.word 0xf6db84a0  ! 2730: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf49460ae  ! 2733: LDUHA_I	lduha	[%r17, + 0x00ae] %asi, %r26
	.word 0xb83ca07e  ! 2736: XNOR_I	xnor 	%r18, 0x007e, %r28
cpu_intr_2_217:
	setx	0x300313, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_111:
	mov	0x18, %r14
	.word 0xfcdb8e60  ! 2738: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T2_asi_reg_rd_112:
	mov	0x24, %r14
	.word 0xf6db84a0  ! 2739: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T2_asi_reg_wr_137:
	mov	0x3c1, %r14
	.word 0xf8f38400  ! 2740: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbabc60b3  ! 2743: XNORcc_I	xnorcc 	%r17, 0x00b3, %r29
cpu_intr_2_218:
	setx	0x310219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe8d0000  ! 2746: ANDcc_R	andcc 	%r20, %r0, %r31
	.word 0xf25de052  ! 2747: LDX_I	ldx	[%r23 + 0x0052], %r25
	.word 0xf85da150  ! 2748: LDX_I	ldx	[%r22 + 0x0150], %r28
iob_intr_2_236:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_236), 16, 16)) -> intp(2, 0, d)
	.word 0xf8450000  ! 2754: LDSW_R	ldsw	[%r20 + %r0], %r28
cpu_intr_2_219:
	setx	0x310234, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_220:
	setx	0x33002f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_221:
	setx	0x330333, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_113:
	mov	0x3c3, %r14
	.word 0xf4db8400  ! 2764: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_2_222:
	setx	0x33023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe8c4000  ! 2766: ANDcc_R	andcc 	%r17, %r0, %r31
	.word 0xf015a088  ! 2768: LDUH_I	lduh	[%r22 + 0x0088], %r24
cpu_intr_2_223:
	setx	0x370116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_237:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_237), 16, 16)) -> intp(2, 0, 35)
iob_intr_2_238:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_238), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_wr_138:
	mov	0x1e, %r14
	.word 0xf0f389e0  ! 2775: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf2c5c020  ! 2778: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r25
iob_intr_2_239:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_239), 16, 16)) -> intp(2, 0, 3d)
cpu_intr_2_224:
	setx	0x370000, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_139:
	mov	0x16, %r14
	.word 0xf0f389e0  ! 2783: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T2_asi_reg_wr_140:
	mov	0x18, %r14
	.word 0xf8f384a0  ! 2786: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	ta	T_CHANGE_NONHPRIV
	.word 0xf6856054  ! 2789: LDUWA_I	lduwa	[%r21, + 0x0054] %asi, %r27
iob_intr_2_240:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_240), 16, 16)) -> intp(2, 0, 34)
	.word 0xfc4d0000  ! 2795: LDSB_R	ldsb	[%r20 + %r0], %r30
	.word 0xfe8d2155  ! 2796: LDUBA_I	lduba	[%r20, + 0x0155] %asi, %r31
	ta	T_CHANGE_HPRIV
	.word 0xfccd2052  ! 2802: LDSBA_I	ldsba	[%r20, + 0x0052] %asi, %r30
T2_asi_reg_rd_114:
	mov	0x36, %r14
	.word 0xf8db8e40  ! 2804: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_2_225:
	setx	0x37032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcd4a05a  ! 2807: LDSHA_I	ldsha	[%r18, + 0x005a] %asi, %r30
T2_asi_reg_wr_141:
	mov	0x3c7, %r14
	.word 0xf6f38e60  ! 2809: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb4344000  ! 2810: ORN_R	orn 	%r17, %r0, %r26
	.word 0xf0cd4020  ! 2814: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r24
	.word 0xf88da148  ! 2816: LDUBA_I	lduba	[%r22, + 0x0148] %asi, %r28
	.word 0xb8148000  ! 2824: OR_R	or 	%r18, %r0, %r28
	setx	data_start_4, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983e48  ! 2827: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e48, %hpstate
	.word 0xfad48020  ! 2828: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r29
iob_intr_2_241:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_241), 16, 16)) -> intp(2, 0, 2a)
iob_intr_2_242:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_242), 16, 16)) -> intp(2, 0, 26)
cpu_intr_2_226:
	setx	0x340232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf21420bb  ! 2832: LDUH_I	lduh	[%r16 + 0x00bb], %r25
cpu_intr_2_227:
	setx	0x370206, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_142:
	mov	0x27, %r14
	.word 0xfef389e0  ! 2836: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983bc0  ! 2840: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc0, %hpstate
iob_intr_2_243:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_243), 16, 16)) -> intp(2, 0, 1d)
	.word 0xbf342001  ! 2842: SRL_I	srl 	%r16, 0x0001, %r31
T2_asi_reg_rd_115:
	mov	0x3c6, %r14
	.word 0xfcdb89e0  ! 2844: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_2_228:
	setx	0x340224, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_244:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_244), 16, 16)) -> intp(2, 0, 24)
T2_asi_reg_wr_143:
	mov	0x3c5, %r14
	.word 0xf6f38e80  ! 2850: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe148000  ! 2857: LDUH_R	lduh	[%r18 + %r0], %r31
iob_intr_2_245:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_245), 16, 16)) -> intp(2, 0, 3)
T2_asi_reg_wr_144:
	mov	0xe, %r14
	.word 0xf2f38e40  ! 2862: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb8356023  ! 2864: ORN_I	orn 	%r21, 0x0023, %r28
	ta	T_CHANGE_TO_TL0
	.word 0xf0c560fb  ! 2867: LDSWA_I	ldswa	[%r21, + 0x00fb] %asi, %r24
	.word 0xf684a064  ! 2869: LDUWA_I	lduwa	[%r18, + 0x0064] %asi, %r27
	.word 0xfcd42056  ! 2874: LDSHA_I	ldsha	[%r16, + 0x0056] %asi, %r30
	.word 0xf6cd8020  ! 2877: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r27
cpu_intr_2_229:
	setx	0x36011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8d4201c  ! 2883: LDSHA_I	ldsha	[%r16, + 0x001c] %asi, %r28
	.word 0xfa4de1ea  ! 2885: LDSB_I	ldsb	[%r23 + 0x01ea], %r29
T2_asi_reg_wr_145:
	mov	0x2d, %r14
	.word 0xfaf38e40  ! 2886: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_246:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_246), 16, 16)) -> intp(2, 0, 18)
iob_intr_2_247:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_247), 16, 16)) -> intp(2, 0, 6)
	.word 0xbc04a107  ! 2894: ADD_I	add 	%r18, 0x0107, %r30
	.word 0xf00d4000  ! 2898: LDUB_R	ldub	[%r21 + %r0], %r24
T2_asi_reg_wr_146:
	mov	0x3c1, %r14
	.word 0xfcf38e40  ! 2901: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfa0de123  ! 2904: LDUB_I	ldub	[%r23 + 0x0123], %r29
	.word 0xf20c60d3  ! 2905: LDUB_I	ldub	[%r17 + 0x00d3], %r25
T2_asi_reg_rd_116:
	mov	0x19, %r14
	.word 0xf4db8e40  ! 2907: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_2_248:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_248), 16, 16)) -> intp(2, 0, e)
T2_asi_reg_rd_117:
	mov	0x7, %r14
	.word 0xf2db8e60  ! 2910: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb5504000  ! 2912: RDPR_TNPC	<illegal instruction>
	.word 0xf6d5c020  ! 2913: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r27
cpu_intr_2_230:
	setx	0x350127, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_147:
	mov	0x23, %r14
	.word 0xfaf38400  ! 2919: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf0956097  ! 2922: LDUHA_I	lduha	[%r21, + 0x0097] %asi, %r24
T2_asi_reg_wr_148:
	mov	0x2, %r14
	.word 0xf4f38e40  ! 2925: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbe24a0a5  ! 2926: SUB_I	sub 	%r18, 0x00a5, %r31
	.word 0xfacd21ab  ! 2930: LDSBA_I	ldsba	[%r20, + 0x01ab] %asi, %r29
iob_intr_2_249:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_249), 16, 16)) -> intp(2, 0, 1f)
	.word 0xb60cc000  ! 2932: AND_R	and 	%r19, %r0, %r27
T2_asi_reg_wr_149:
	mov	0x2e, %r14
	.word 0xf0f38e60  ! 2933: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb2b5600a  ! 2944: ORNcc_I	orncc 	%r21, 0x000a, %r25
iob_intr_2_250:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_250), 16, 16)) -> intp(2, 0, 3f)
T2_asi_reg_wr_150:
	mov	0x7, %r14
	.word 0xf0f38400  ! 2947: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T2_asi_reg_wr_151:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 2948: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_rd_118:
	mov	0x7, %r14
	.word 0xf4db89e0  ! 2951: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	ta	T_CHANGE_TO_TL0
iob_intr_2_251:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_251), 16, 16)) -> intp(2, 0, 4)
T2_asi_reg_rd_119:
	mov	0x9, %r14
	.word 0xf2db84a0  ! 2954: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T2_asi_reg_rd_120:
	mov	0x36, %r14
	.word 0xf4db8e80  ! 2955: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_2_231:
	setx	0x360132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf844c000  ! 2957: LDSW_R	ldsw	[%r19 + %r0], %r28
	.word 0xfe952043  ! 2958: LDUHA_I	lduha	[%r20, + 0x0043] %asi, %r31
cpu_intr_2_232:
	setx	0x36001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45dc000  ! 2962: LDX_R	ldx	[%r23 + %r0], %r26
iob_intr_2_252:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_252), 16, 16)) -> intp(2, 0, 1)
T2_asi_reg_wr_152:
	mov	0x3c7, %r14
	.word 0xfaf38400  ! 2966: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf045e0fe  ! 2967: LDSW_I	ldsw	[%r23 + 0x00fe], %r24
cpu_intr_2_233:
	setx	0x340309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0956170  ! 2970: LDUHA_I	lduha	[%r21, + 0x0170] %asi, %r24
	.word 0xf0cde03b  ! 2971: LDSBA_I	ldsba	[%r23, + 0x003b] %asi, %r24
	ta	T_CHANGE_TO_TL0
cpu_intr_2_234:
	setx	0x340011, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xbe2d0000  ! 2978: ANDN_R	andn 	%r20, %r0, %r31
	.word 0xfa0da021  ! 2979: LDUB_I	ldub	[%r22 + 0x0021], %r29
	ta	T_CHANGE_TO_TL0
	.word 0xb834c000  ! 2983: SUBC_R	orn 	%r19, %r0, %r28
	.word 0xf84d6075  ! 2984: LDSB_I	ldsb	[%r21 + 0x0075], %r28
	.word 0xbe356104  ! 2985: ORN_I	orn 	%r21, 0x0104, %r31
	.word 0xb60cc000  ! 2986: AND_R	and 	%r19, %r0, %r27
	.word 0xf095c020  ! 2989: LDUHA_R	lduha	[%r23, %r0] 0x01, %r24
	ta	T_CHANGE_TO_TL0
	.word 0xb6340000  ! 2992: ORN_R	orn 	%r16, %r0, %r27
	.word 0xfccc0020  ! 2993: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r30
cpu_intr_2_235:
	setx	0x340118, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_121:
	mov	0x3c7, %r14
	.word 0xf6db8e40  ! 2998: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_2_253:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_253), 16, 16)) -> intp(2, 0, 15)
T2_asi_reg_wr_153:
	mov	0x26, %r14
	.word 0xfcf38400  ! 3002: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_2_254:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_254), 16, 16)) -> intp(2, 0, 21)
T2_asi_reg_rd_122:
	mov	0x16, %r14
	.word 0xf8db84a0  ! 3012: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T2_asi_reg_rd_123:
	mov	0x2b, %r14
	.word 0xfedb89e0  ! 3016: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T2_asi_reg_rd_124:
	mov	0x34, %r14
	.word 0xfedb8e80  ! 3018: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf694c020  ! 3019: LDUHA_R	lduha	[%r19, %r0] 0x01, %r27
cpu_intr_2_236:
	setx	0x37033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaa5a122  ! 3024: SUBcc_I	subcc 	%r22, 0x0122, %r29
	.word 0x8395a014  ! 3025: WRPR_TNPC_I	wrpr	%r22, 0x0014, %tnpc
	.word 0xb1643801  ! 3027: MOVcc_I	<illegal instruction>
iob_intr_2_255:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_255), 16, 16)) -> intp(2, 0, 3b)
	.word 0xf6440000  ! 3030: LDSW_R	ldsw	[%r16 + %r0], %r27
	.word 0xb2354000  ! 3032: SUBC_R	orn 	%r21, %r0, %r25
iob_intr_2_256:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_256), 16, 16)) -> intp(2, 0, 27)
	.word 0xf4cd61f9  ! 3034: LDSBA_I	ldsba	[%r21, + 0x01f9] %asi, %r26
	.word 0xfad5210d  ! 3039: LDSHA_I	ldsha	[%r20, + 0x010d] %asi, %r29
iob_intr_2_257:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_257), 16, 16)) -> intp(2, 0, 31)
cpu_intr_2_237:
	setx	0x370004, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_238:
	setx	0x350123, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0x81942110  ! 3050: WRPR_TPC_I	wrpr	%r16, 0x0110, %tpc
cpu_intr_2_239:
	setx	0x34023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45c8000  ! 3054: LDX_R	ldx	[%r18 + %r0], %r26
iob_intr_2_258:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_258), 16, 16)) -> intp(2, 0, 8)
iob_intr_2_259:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_259), 16, 16)) -> intp(2, 0, a)
cpu_intr_2_240:
	setx	0x350016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc85a08f  ! 3064: ADDcc_I	addcc 	%r22, 0x008f, %r30
cpu_intr_2_241:
	setx	0x37031a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_154:
	mov	0xb, %r14
	.word 0xfef38e40  ! 3069: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_wr_155:
	mov	0x2d, %r14
	.word 0xfcf38e80  ! 3070: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T2_asi_reg_wr_156:
	mov	0x3c6, %r14
	.word 0xf6f389e0  ! 3071: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_2_260:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_260), 16, 16)) -> intp(2, 0, 1e)
	ta	T_CHANGE_TO_TL0
iob_intr_2_261:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_261), 16, 16)) -> intp(2, 0, 19)
cpu_intr_2_242:
	setx	0x340002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_262:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_262), 16, 16)) -> intp(2, 0, 37)
cpu_intr_2_243:
	setx	0x34012c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_157:
	mov	0x3c5, %r14
	.word 0xfaf38e60  ! 3088: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_2_263:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_263), 16, 16)) -> intp(2, 0, 1)
	.word 0xb77c8400  ! 3092: MOVR_R	movre	%r18, %r0, %r27
cpu_intr_2_244:
	setx	0x36010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_125:
	mov	0xd, %r14
	.word 0xf6db8e60  ! 3095: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_2_264:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_264), 16, 16)) -> intp(2, 0, 1f)
iob_intr_2_265:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_265), 16, 16)) -> intp(2, 0, 2d)
T2_asi_reg_rd_126:
	mov	0x21, %r14
	.word 0xf0db8e40  ! 3098: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T2_asi_reg_wr_158:
	mov	0x36, %r14
	.word 0xfef38e40  ! 3099: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_2_245:
	setx	0x340009, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_246:
	setx	0x350201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2954020  ! 3106: LDUHA_R	lduha	[%r21, %r0] 0x01, %r25
	.word 0xfcc5a1c5  ! 3107: LDSWA_I	ldswa	[%r22, + 0x01c5] %asi, %r30
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_159:
	mov	0x19, %r14
	.word 0xf8f38e40  ! 3109: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_266:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_266), 16, 16)) -> intp(2, 0, e)
	.word 0xf68c8020  ! 3111: LDUBA_R	lduba	[%r18, %r0] 0x01, %r27
	.word 0xf4d4617d  ! 3112: LDSHA_I	ldsha	[%r17, + 0x017d] %asi, %r26
T2_asi_reg_wr_160:
	mov	0x3c7, %r14
	.word 0xf2f389e0  ! 3115: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xfc550000  ! 3116: LDSH_R	ldsh	[%r20 + %r0], %r30
	.word 0xf8c5201e  ! 3117: LDSWA_I	ldswa	[%r20, + 0x001e] %asi, %r28
iob_intr_2_267:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_267), 16, 16)) -> intp(2, 0, d)
	.word 0xfc448000  ! 3122: LDSW_R	ldsw	[%r18 + %r0], %r30
T2_asi_reg_rd_127:
	mov	0x3c6, %r14
	.word 0xf6db8e80  ! 3130: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf00d8000  ! 3131: LDUB_R	ldub	[%r22 + %r0], %r24
iob_intr_2_268:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_268), 16, 16)) -> intp(2, 0, 1e)
iob_intr_2_269:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_269), 16, 16)) -> intp(2, 0, 5)
	.word 0xf8c4e123  ! 3143: LDSWA_I	ldswa	[%r19, + 0x0123] %asi, %r28
T2_asi_reg_rd_128:
	mov	0x3c0, %r14
	.word 0xf6db8e60  ! 3145: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_2_270:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_270), 16, 16)) -> intp(2, 0, 1d)
T2_asi_reg_wr_161:
	mov	0xb, %r14
	.word 0xf2f384a0  ! 3148: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_2_271:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_271), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf2c5204f  ! 3154: LDSWA_I	ldswa	[%r20, + 0x004f] %asi, %r25
	.word 0xfcc5e181  ! 3155: LDSWA_I	ldswa	[%r23, + 0x0181] %asi, %r30
	.word 0xf2044000  ! 3160: LDUW_R	lduw	[%r17 + %r0], %r25
T2_asi_reg_wr_162:
	mov	0x1e, %r14
	.word 0xf2f389e0  ! 3161: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf24c212f  ! 3165: LDSB_I	ldsb	[%r16 + 0x012f], %r25
T2_asi_reg_rd_129:
	mov	0x36, %r14
	.word 0xfcdb8e80  ! 3171: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xfa544000  ! 3173: LDSH_R	ldsh	[%r17 + %r0], %r29
	.word 0xfc548000  ! 3176: LDSH_R	ldsh	[%r18 + %r0], %r30
	.word 0xfe15e064  ! 3180: LDUH_I	lduh	[%r23 + 0x0064], %r31
	.word 0xf605c000  ! 3187: LDUW_R	lduw	[%r23 + %r0], %r27
	.word 0xfa8cc020  ! 3188: LDUBA_R	lduba	[%r19, %r0] 0x01, %r29
	.word 0xfacd0020  ! 3189: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r29
T2_asi_reg_rd_130:
	mov	0x3c4, %r14
	.word 0xf6db8400  ! 3198: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf685e14b  ! 3199: LDUWA_I	lduwa	[%r23, + 0x014b] %asi, %r27
	.word 0xba8dc000  ! 3200: ANDcc_R	andcc 	%r23, %r0, %r29
	.word 0xb24520e2  ! 3201: ADDC_I	addc 	%r20, 0x00e2, %r25
	.word 0xf64c210e  ! 3203: LDSB_I	ldsb	[%r16 + 0x010e], %r27
	.word 0xfa558000  ! 3205: LDSH_R	ldsh	[%r22 + %r0], %r29
	.word 0xf0152090  ! 3206: LDUH_I	lduh	[%r20 + 0x0090], %r24
iob_intr_2_272:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_272), 16, 16)) -> intp(2, 0, 2d)
cpu_intr_2_247:
	setx	0x3b013b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_248:
	setx	0x38033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf05d60fd  ! 3216: LDX_I	ldx	[%r21 + 0x00fd], %r24
iob_intr_2_273:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_273), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf6d52065  ! 3222: LDSHA_I	ldsha	[%r20, + 0x0065] %asi, %r27
T2_asi_reg_wr_163:
	mov	0x3c3, %r14
	.word 0xfaf38400  ! 3224: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0x9194e0c6  ! 3225: WRPR_PIL_I	wrpr	%r19, 0x00c6, %pil
	.word 0xfa15a0ce  ! 3226: LDUH_I	lduh	[%r22 + 0x00ce], %r29
	.word 0xf694c020  ! 3227: LDUHA_R	lduha	[%r19, %r0] 0x01, %r27
	.word 0xf2140000  ! 3229: LDUH_R	lduh	[%r16 + %r0], %r25
	.word 0xf6cce0c6  ! 3230: LDSBA_I	ldsba	[%r19, + 0x00c6] %asi, %r27
T2_asi_reg_rd_131:
	mov	0x1c, %r14
	.word 0xfedb89e0  ! 3231: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xfac54020  ! 3232: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r29
T2_asi_reg_wr_164:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 3233: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf2854020  ! 3235: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r25
	.word 0xfcd52054  ! 3236: LDSHA_I	ldsha	[%r20, + 0x0054] %asi, %r30
	.word 0xf20560ce  ! 3237: LDUW_I	lduw	[%r21 + 0x00ce], %r25
T2_asi_reg_rd_132:
	mov	0x13, %r14
	.word 0xfcdb8e40  ! 3239: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf40dc000  ! 3240: LDUB_R	ldub	[%r23 + %r0], %r26
T2_asi_reg_wr_165:
	mov	0x3c8, %r14
	.word 0xf6f384a0  ! 3241: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf2158000  ! 3242: LDUH_R	lduh	[%r22 + %r0], %r25
iob_intr_2_274:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_274), 16, 16)) -> intp(2, 0, 11)
T2_asi_reg_wr_166:
	mov	0xd, %r14
	.word 0xf4f389e0  ! 3247: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_2_275:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_275), 16, 16)) -> intp(2, 0, 30)
	.word 0xfa5c8000  ! 3250: LDX_R	ldx	[%r18 + %r0], %r29
cpu_intr_2_249:
	setx	0x3a0338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4d21d4  ! 3253: LDSB_I	ldsb	[%r20 + 0x01d4], %r29
iob_intr_2_276:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_276), 16, 16)) -> intp(2, 0, 2f)
	.word 0x8d95a1d1  ! 3260: WRPR_PSTATE_I	wrpr	%r22, 0x01d1, %pstate
	.word 0xf0cdc020  ! 3261: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r24
iob_intr_2_277:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_277), 16, 16)) -> intp(2, 0, f)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_133:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 3265: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_2_278:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_278), 16, 16)) -> intp(2, 0, 37)
	.word 0xf8150000  ! 3268: LDUH_R	lduh	[%r20 + %r0], %r28
	.word 0xb4b54000  ! 3275: SUBCcc_R	orncc 	%r21, %r0, %r26
	.word 0xf0052069  ! 3280: LDUW_I	lduw	[%r20 + 0x0069], %r24
	.word 0xfe444000  ! 3281: LDSW_R	ldsw	[%r17 + %r0], %r31
T2_asi_reg_wr_167:
	mov	0x13, %r14
	.word 0xf2f38e60  ! 3282: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf6c5c020  ! 3284: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r27
cpu_intr_2_250:
	setx	0x390323, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_134:
	mov	0x14, %r14
	.word 0xf4db8e80  ! 3290: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_251:
	setx	0x390219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b46173  ! 3299: ORNcc_I	orncc 	%r17, 0x0173, %r24
	.word 0xb0ac0000  ! 3300: ANDNcc_R	andncc 	%r16, %r0, %r24
	.word 0xf00da192  ! 3301: LDUB_I	ldub	[%r22 + 0x0192], %r24
T2_asi_reg_wr_168:
	mov	0x17, %r14
	.word 0xfaf38e40  ! 3303: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_rd_135:
	mov	0x21, %r14
	.word 0xf2db8e80  ! 3307: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_2_252:
	setx	0x3b010d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_169:
	mov	0x1d, %r14
	.word 0xf2f38e60  ! 3309: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_2_253:
	setx	0x3b0132, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf6d4a0bb  ! 3315: LDSHA_I	ldsha	[%r18, + 0x00bb] %asi, %r27
T2_asi_reg_wr_170:
	mov	0x3c8, %r14
	.word 0xf8f38e40  ! 3318: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf405e034  ! 3323: LDUW_I	lduw	[%r23 + 0x0034], %r26
	.word 0xfa4de012  ! 3325: LDSB_I	ldsb	[%r23 + 0x0012], %r29
cpu_intr_2_254:
	setx	0x3b000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64d21b6  ! 3331: LDSB_I	ldsb	[%r20 + 0x01b6], %r27
	.word 0xfc554000  ! 3332: LDSH_R	ldsh	[%r21 + %r0], %r30
T2_asi_reg_wr_171:
	mov	0x28, %r14
	.word 0xfef38400  ! 3334: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbcac4000  ! 3336: ANDNcc_R	andncc 	%r17, %r0, %r30
	.word 0xfa8d8020  ! 3337: LDUBA_R	lduba	[%r22, %r0] 0x01, %r29
	.word 0xf25c8000  ! 3338: LDX_R	ldx	[%r18 + %r0], %r25
	.word 0xfe54a046  ! 3339: LDSH_I	ldsh	[%r18 + 0x0046], %r31
	.word 0xf094e18b  ! 3340: LDUHA_I	lduha	[%r19, + 0x018b] %asi, %r24
iob_intr_2_279:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_279), 16, 16)) -> intp(2, 0, 38)
	.word 0xf815e044  ! 3343: LDUH_I	lduh	[%r23 + 0x0044], %r28
	.word 0xbc2c0000  ! 3346: ANDN_R	andn 	%r16, %r0, %r30
cpu_intr_2_255:
	setx	0x39031f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_256:
	setx	0x3a0318, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_280:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_280), 16, 16)) -> intp(2, 0, 23)
iob_intr_2_281:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_281), 16, 16)) -> intp(2, 0, 37)
	.word 0xb6c5e156  ! 3353: ADDCcc_I	addccc 	%r23, 0x0156, %r27
iob_intr_2_282:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_282), 16, 16)) -> intp(2, 0, 13)
	.word 0xbcb5e0a2  ! 3358: SUBCcc_I	orncc 	%r23, 0x00a2, %r30
	.word 0xfe94c020  ! 3361: LDUHA_R	lduha	[%r19, %r0] 0x01, %r31
	.word 0xf2d4e1c2  ! 3362: LDSHA_I	ldsha	[%r19, + 0x01c2] %asi, %r25
T2_asi_reg_rd_136:
	mov	0x1b, %r14
	.word 0xf2db8400  ! 3363: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf4d48020  ! 3366: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r26
T2_asi_reg_rd_137:
	mov	0x2c, %r14
	.word 0xf8db8400  ! 3368: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xf2d40020  ! 3370: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r25
	.word 0xfc544000  ! 3371: LDSH_R	ldsh	[%r17 + %r0], %r30
	.word 0xf04d610b  ! 3372: LDSB_I	ldsb	[%r21 + 0x010b], %r24
iob_intr_2_283:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_283), 16, 16)) -> intp(2, 0, 1f)
cpu_intr_2_257:
	setx	0x390306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4154000  ! 3380: LDUH_R	lduh	[%r21 + %r0], %r26
T2_asi_reg_rd_138:
	mov	0x28, %r14
	.word 0xfcdb8400  ! 3381: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T2_asi_reg_wr_172:
	mov	0x31, %r14
	.word 0xfaf389e0  ! 3382: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xba0d4000  ! 3383: AND_R	and 	%r21, %r0, %r29
	.word 0xf8948020  ! 3385: LDUHA_R	lduha	[%r18, %r0] 0x01, %r28
	.word 0xf8c421b6  ! 3390: LDSWA_I	ldswa	[%r16, + 0x01b6] %asi, %r28
cpu_intr_2_258:
	setx	0x3a0216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc44e0a0  ! 3395: LDSW_I	ldsw	[%r19 + 0x00a0], %r30
	.word 0xf40dc000  ! 3397: LDUB_R	ldub	[%r23 + %r0], %r26
cpu_intr_2_259:
	setx	0x3a0231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8942110  ! 3399: LDUHA_I	lduha	[%r16, + 0x0110] %asi, %r28
	.word 0xfa15e077  ! 3400: LDUH_I	lduh	[%r23 + 0x0077], %r29
cpu_intr_2_260:
	setx	0x390336, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_284:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_284), 16, 16)) -> intp(2, 0, 4)
	.word 0xf08461e6  ! 3405: LDUWA_I	lduwa	[%r17, + 0x01e6] %asi, %r24
cpu_intr_2_261:
	setx	0x3b0116, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_285:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_285), 16, 16)) -> intp(2, 0, 2)
	.word 0xb13da001  ! 3409: SRA_I	sra 	%r22, 0x0001, %r24
	.word 0xf84c202a  ! 3410: LDSB_I	ldsb	[%r16 + 0x002a], %r28
	.word 0xbe1c4000  ! 3411: XOR_R	xor 	%r17, %r0, %r31
	.word 0xf40ca1b3  ! 3412: LDUB_I	ldub	[%r18 + 0x01b3], %r26
	.word 0xfcdce053  ! 3413: LDXA_I	ldxa	[%r19, + 0x0053] %asi, %r30
	.word 0xb09c4000  ! 3414: XORcc_R	xorcc 	%r17, %r0, %r24
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982b40  ! 3416: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b40, %hpstate
	.word 0xf495c020  ! 3419: LDUHA_R	lduha	[%r23, %r0] 0x01, %r26
T2_asi_reg_rd_139:
	mov	0x27, %r14
	.word 0xfadb8e40  ! 3420: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf40d4000  ! 3421: LDUB_R	ldub	[%r21 + %r0], %r26
cpu_intr_2_262:
	setx	0x3b0009, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_263:
	setx	0x3a0326, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_173:
	mov	0x28, %r14
	.word 0xfef38e40  ! 3427: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_rd_140:
	mov	0x3c1, %r14
	.word 0xf8db89e0  ! 3428: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T2_asi_reg_rd_141:
	mov	0x3c7, %r14
	.word 0xf2db84a0  ! 3430: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf8c5e156  ! 3432: LDSWA_I	ldswa	[%r23, + 0x0156] %asi, %r28
	.word 0xfe0d8000  ! 3439: LDUB_R	ldub	[%r22 + %r0], %r31
	.word 0xbb510000  ! 3441: RDPR_TICK	<illegal instruction>
T2_asi_reg_wr_174:
	mov	0x25, %r14
	.word 0xf6f38e40  ! 3443: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf4440000  ! 3446: LDSW_R	ldsw	[%r16 + %r0], %r26
cpu_intr_2_264:
	setx	0x3a0219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24c0000  ! 3450: LDSB_R	ldsb	[%r16 + %r0], %r25
	.word 0xb4144000  ! 3454: OR_R	or 	%r17, %r0, %r26
T2_asi_reg_rd_142:
	mov	0x2c, %r14
	.word 0xf4db84a0  ! 3456: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf88d21cb  ! 3457: LDUBA_I	lduba	[%r20, + 0x01cb] %asi, %r28
iob_intr_2_286:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_286), 16, 16)) -> intp(2, 0, 1a)
iob_intr_2_287:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_287), 16, 16)) -> intp(2, 0, e)
	.word 0xf814e1e8  ! 3461: LDUH_I	lduh	[%r19 + 0x01e8], %r28
cpu_intr_2_265:
	setx	0x3b021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5ca0f7  ! 3463: LDX_I	ldx	[%r18 + 0x00f7], %r31
	.word 0xfc548000  ! 3467: LDSH_R	ldsh	[%r18 + %r0], %r30
	.word 0xfc8c21aa  ! 3468: LDUBA_I	lduba	[%r16, + 0x01aa] %asi, %r30
	.word 0xf45d8000  ! 3472: LDX_R	ldx	[%r22 + %r0], %r26
cpu_intr_2_266:
	setx	0x390339, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_267:
	setx	0x3a0221, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_268:
	setx	0x3a0122, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_143:
	mov	0x17, %r14
	.word 0xf0db8400  ! 3477: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xfc94a114  ! 3481: LDUHA_I	lduha	[%r18, + 0x0114] %asi, %r30
	.word 0xfc05a102  ! 3487: LDUW_I	lduw	[%r22 + 0x0102], %r30
cpu_intr_2_269:
	setx	0x3a0033, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8156141  ! 3489: LDUH_I	lduh	[%r21 + 0x0141], %r28
iob_intr_2_288:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_288), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_289:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_289), 16, 16)) -> intp(2, 0, 26)
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982f98  ! 3493: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f98, %hpstate
	.word 0xb835c000  ! 3494: ORN_R	orn 	%r23, %r0, %r28
T2_asi_reg_rd_144:
	mov	0x13, %r14
	.word 0xf2db8e40  ! 3495: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf05c61f5  ! 3498: LDX_I	ldx	[%r17 + 0x01f5], %r24
T2_asi_reg_rd_145:
	mov	0x2c, %r14
	.word 0xfcdb89e0  ! 3499: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T2_asi_reg_wr_175:
	mov	0x3c3, %r14
	.word 0xfaf389e0  ! 3500: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983982  ! 3506: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1982, %hpstate
	.word 0xf05c4000  ! 3512: LDX_R	ldx	[%r17 + %r0], %r24
	.word 0xf48460ef  ! 3515: LDUWA_I	lduwa	[%r17, + 0x00ef] %asi, %r26
cpu_intr_2_270:
	setx	0x3b0119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf645e079  ! 3518: LDSW_I	ldsw	[%r23 + 0x0079], %r27
	.word 0xf68da0be  ! 3520: LDUBA_I	lduba	[%r22, + 0x00be] %asi, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_290:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_290), 16, 16)) -> intp(2, 0, 4)
	.word 0xbc25a19d  ! 3529: SUB_I	sub 	%r22, 0x019d, %r30
cpu_intr_2_271:
	setx	0x3b0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe15a17a  ! 3535: LDUH_I	lduh	[%r22 + 0x017a], %r31
iob_intr_2_291:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_291), 16, 16)) -> intp(2, 0, 2e)
iob_intr_2_292:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_292), 16, 16)) -> intp(2, 0, 2d)
	ta	T_CHANGE_NONHPRIV
	.word 0xfa5420dc  ! 3540: LDSH_I	ldsh	[%r16 + 0x00dc], %r29
T2_asi_reg_rd_146:
	mov	0x3c6, %r14
	.word 0xfadb8400  ! 3543: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf44c61b9  ! 3544: LDSB_I	ldsb	[%r17 + 0x01b9], %r26
cpu_intr_2_272:
	setx	0x3b0316, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_147:
	mov	0x3c0, %r14
	.word 0xfedb8400  ! 3546: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf205a0a9  ! 3547: LDUW_I	lduw	[%r22 + 0x00a9], %r25
iob_intr_2_293:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_293), 16, 16)) -> intp(2, 0, 10)
	.word 0xb13ce001  ! 3549: SRA_I	sra 	%r19, 0x0001, %r24
T2_asi_reg_wr_176:
	mov	0x33, %r14
	.word 0xf6f38e40  ! 3551: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf6154000  ! 3552: LDUH_R	lduh	[%r21 + %r0], %r27
T2_asi_reg_wr_177:
	mov	0x3, %r14
	.word 0xf6f38400  ! 3555: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T2_asi_reg_rd_148:
	mov	0xa, %r14
	.word 0xf8db89e0  ! 3557: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T2_asi_reg_wr_178:
	mov	0x1, %r14
	.word 0xfcf38e60  ! 3558: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf6558000  ! 3560: LDSH_R	ldsh	[%r22 + %r0], %r27
cpu_intr_2_273:
	setx	0x3a0233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_274:
	setx	0x390138, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_275:
	setx	0x380011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0856012  ! 3567: LDUWA_I	lduwa	[%r21, + 0x0012] %asi, %r24
cpu_intr_2_276:
	setx	0x3b032b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_179:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 3569: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T2_asi_reg_wr_180:
	mov	0x16, %r14
	.word 0xf8f38e40  ! 3572: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_294:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_294), 16, 16)) -> intp(2, 0, 24)
cpu_intr_2_277:
	setx	0x390209, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf8552041  ! 3577: LDSH_I	ldsh	[%r20 + 0x0041], %r28
cpu_intr_2_278:
	setx	0x3a0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5421af  ! 3586: LDSH_I	ldsh	[%r16 + 0x01af], %r31
	.word 0xf8548000  ! 3588: LDSH_R	ldsh	[%r18 + %r0], %r28
	.word 0xf08521bf  ! 3590: LDUWA_I	lduwa	[%r20, + 0x01bf] %asi, %r24
	.word 0xba2d4000  ! 3597: ANDN_R	andn 	%r21, %r0, %r29
	.word 0xfe5d0000  ! 3598: LDX_R	ldx	[%r20 + %r0], %r31
cpu_intr_2_279:
	setx	0x390231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa45c000  ! 3602: LDSW_R	ldsw	[%r23 + %r0], %r29
	.word 0xf8458000  ! 3605: LDSW_R	ldsw	[%r22 + %r0], %r28
	.word 0xf8c5c020  ! 3609: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r28
iob_intr_2_295:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_295), 16, 16)) -> intp(2, 0, 23)
iob_intr_2_296:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_296), 16, 16)) -> intp(2, 0, 2e)
iob_intr_2_297:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_297), 16, 16)) -> intp(2, 0, 1c)
cpu_intr_2_280:
	setx	0x3a0111, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_281:
	setx	0x3a012f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_298:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_298), 16, 16)) -> intp(2, 0, 2c)
	ta	T_CHANGE_TO_TL0
cpu_intr_2_282:
	setx	0x3a0217, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_181:
	mov	0x12, %r14
	.word 0xf2f389e0  ! 3632: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	ta	T_CHANGE_TO_TL0
	.word 0xbe2cc000  ! 3635: ANDN_R	andn 	%r19, %r0, %r31
	.word 0xf45c20e5  ! 3637: LDX_I	ldx	[%r16 + 0x00e5], %r26
	.word 0xb005a124  ! 3638: ADD_I	add 	%r22, 0x0124, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_299:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_299), 16, 16)) -> intp(2, 0, 3e)
	.word 0xb29d6018  ! 3646: XORcc_I	xorcc 	%r21, 0x0018, %r25
iob_intr_2_300:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_300), 16, 16)) -> intp(2, 0, 12)
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982f80  ! 3649: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f80, %hpstate
cpu_intr_2_283:
	setx	0x390019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb41c61f2  ! 3654: XOR_I	xor 	%r17, 0x01f2, %r26
cpu_intr_2_284:
	setx	0x380109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_301:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_301), 16, 16)) -> intp(2, 0, 15)
	ta	T_CHANGE_TO_TL0
	.word 0xf485a11a  ! 3671: LDUWA_I	lduwa	[%r22, + 0x011a] %asi, %r26
	.word 0xf40cc000  ! 3672: LDUB_R	ldub	[%r19 + %r0], %r26
T2_asi_reg_rd_149:
	mov	0x14, %r14
	.word 0xf8db8400  ! 3675: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_2_285:
	setx	0x3f0033, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_182:
	mov	0x3c7, %r14
	.word 0xfcf384a0  ! 3679: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf0854020  ! 3680: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r24
iob_intr_2_302:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_302), 16, 16)) -> intp(2, 0, 24)
cpu_intr_2_286:
	setx	0x3c0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe842085  ! 3688: LDUWA_I	lduwa	[%r16, + 0x0085] %asi, %r31
cpu_intr_2_287:
	setx	0x3c0317, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_303:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_303), 16, 16)) -> intp(2, 0, 38)
cpu_intr_2_288:
	setx	0x3d0200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe450000  ! 3692: LDSW_R	ldsw	[%r20 + %r0], %r31
iob_intr_2_304:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_304), 16, 16)) -> intp(2, 0, 12)
iob_intr_2_305:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_305), 16, 16)) -> intp(2, 0, 18)
T2_asi_reg_rd_150:
	mov	0x7, %r14
	.word 0xfedb8e40  ! 3696: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_2_306:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_306), 16, 16)) -> intp(2, 0, 35)
	.word 0xfc5dc000  ! 3703: LDX_R	ldx	[%r23 + %r0], %r30
T2_asi_reg_wr_183:
	mov	0x19, %r14
	.word 0xf6f389e0  ! 3704: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_2_307:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_307), 16, 16)) -> intp(2, 0, 31)
	.word 0xb1643801  ! 3709: MOVcc_I	<illegal instruction>
T2_asi_reg_rd_151:
	mov	0x3c2, %r14
	.word 0xf0db8e60  ! 3710: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_2_289:
	setx	0x3f0039, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_308:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_308), 16, 16)) -> intp(2, 0, 2c)
	.word 0xbb643801  ! 3715: MOVcc_I	<illegal instruction>
iob_intr_2_309:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_309), 16, 16)) -> intp(2, 0, 26)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf88c8020  ! 3718: LDUBA_R	lduba	[%r18, %r0] 0x01, %r28
	.word 0xf6d5c020  ! 3719: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r27
	.word 0xf00ce015  ! 3723: LDUB_I	ldub	[%r19 + 0x0015], %r24
iob_intr_2_310:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_310), 16, 16)) -> intp(2, 0, e)
	.word 0xfcc4c020  ! 3729: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r30
	.word 0xf254a1fb  ! 3730: LDSH_I	ldsh	[%r18 + 0x01fb], %r25
	.word 0xb4bda05f  ! 3731: XNORcc_I	xnorcc 	%r22, 0x005f, %r26
iob_intr_2_311:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_311), 16, 16)) -> intp(2, 0, 1)
	.word 0xf04d4000  ! 3737: LDSB_R	ldsb	[%r21 + %r0], %r24
	.word 0xfa152114  ! 3740: LDUH_I	lduh	[%r20 + 0x0114], %r29
iob_intr_2_312:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_312), 16, 16)) -> intp(2, 0, 38)
	.word 0xf28c61e2  ! 3747: LDUBA_I	lduba	[%r17, + 0x01e2] %asi, %r25
	.word 0xfa8c61dc  ! 3752: LDUBA_I	lduba	[%r17, + 0x01dc] %asi, %r29
	.word 0xf0c40020  ! 3753: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r24
iob_intr_2_313:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_313), 16, 16)) -> intp(2, 0, 1b)
T2_asi_reg_rd_152:
	mov	0x2, %r14
	.word 0xf6db8e40  ! 3755: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf4cc602b  ! 3756: LDSBA_I	ldsba	[%r17, + 0x002b] %asi, %r26
	.word 0xf20d20a9  ! 3758: LDUB_I	ldub	[%r20 + 0x00a9], %r25
iob_intr_2_314:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_314), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_wr_184:
	mov	0x20, %r14
	.word 0xf2f38e40  ! 3763: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb4b561e1  ! 3766: ORNcc_I	orncc 	%r21, 0x01e1, %r26
iob_intr_2_315:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_315), 16, 16)) -> intp(2, 0, 23)
cpu_intr_2_290:
	setx	0x3c032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa94e155  ! 3772: LDUHA_I	lduha	[%r19, + 0x0155] %asi, %r29
	.word 0xfe8cc020  ! 3773: LDUBA_R	lduba	[%r19, %r0] 0x01, %r31
cpu_intr_2_291:
	setx	0x3d023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf855a1ed  ! 3777: LDSH_I	ldsh	[%r22 + 0x01ed], %r28
iob_intr_2_316:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_316), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf4dce1ef  ! 3788: LDXA_I	ldxa	[%r19, + 0x01ef] %asi, %r26
	.word 0xfa848020  ! 3789: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r29
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_185:
	mov	0x7, %r14
	.word 0xf6f38e80  ! 3792: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf8040000  ! 3795: LDUW_R	lduw	[%r16 + %r0], %r28
iob_intr_2_317:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_317), 16, 16)) -> intp(2, 0, 11)
	.word 0xb1504000  ! 3797: RDPR_TNPC	<illegal instruction>
iob_intr_2_318:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_318), 16, 16)) -> intp(2, 0, f)
	.word 0xb08ca049  ! 3800: ANDcc_I	andcc 	%r18, 0x0049, %r24
T2_asi_reg_rd_153:
	mov	0x37, %r14
	.word 0xf8db8400  ! 3801: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_2_292:
	setx	0x3e012f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_293:
	setx	0x3e032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4540000  ! 3804: LDSH_R	ldsh	[%r16 + %r0], %r26
iob_intr_2_319:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_319), 16, 16)) -> intp(2, 0, 2a)
T2_asi_reg_rd_154:
	mov	0x3c2, %r14
	.word 0xf4db8e80  ! 3806: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbd50c000  ! 3807: RDPR_TT	<illegal instruction>
	.word 0xf4cc4020  ! 3809: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r26
	.word 0xf6dd20a2  ! 3812: LDXA_I	ldxa	[%r20, + 0x00a2] %asi, %r27
cpu_intr_2_294:
	setx	0x3f001d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_320:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_320), 16, 16)) -> intp(2, 0, b)
	.word 0xfad421a5  ! 3819: LDSHA_I	ldsha	[%r16, + 0x01a5] %asi, %r29
cpu_intr_2_295:
	setx	0x3d010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe050000  ! 3821: LDUW_R	lduw	[%r20 + %r0], %r31
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982918  ! 3822: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0918, %hpstate
	.word 0xf24c6199  ! 3823: LDSB_I	ldsb	[%r17 + 0x0199], %r25
	.word 0xfed58020  ! 3824: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r31
	ta	T_CHANGE_TO_TL0
	.word 0xb0bde070  ! 3828: XNORcc_I	xnorcc 	%r23, 0x0070, %r24
T2_asi_reg_rd_155:
	mov	0x3c0, %r14
	.word 0xf8db84a0  ! 3830: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf6d40020  ! 3831: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r27
T2_asi_reg_wr_186:
	mov	0x26, %r14
	.word 0xfcf389e0  ! 3832: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xfa046149  ! 3833: LDUW_I	lduw	[%r17 + 0x0149], %r29
iob_intr_2_321:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_321), 16, 16)) -> intp(2, 0, 15)
T2_asi_reg_wr_187:
	mov	0x2c, %r14
	.word 0xfaf38400  ! 3837: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf2dde05e  ! 3838: LDXA_I	ldxa	[%r23, + 0x005e] %asi, %r25
T2_asi_reg_wr_188:
	mov	0x5, %r14
	.word 0xf2f38e80  ! 3840: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_2_322:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_322), 16, 16)) -> intp(2, 0, 3a)
iob_intr_2_323:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_323), 16, 16)) -> intp(2, 0, 1a)
	.word 0xfc5561cd  ! 3846: LDSH_I	ldsh	[%r21 + 0x01cd], %r30
	.word 0xb17c4400  ! 3848: MOVR_R	movre	%r17, %r0, %r24
	.word 0xf4dca096  ! 3849: LDXA_I	ldxa	[%r18, + 0x0096] %asi, %r26
	.word 0xf0442136  ! 3850: LDSW_I	ldsw	[%r16 + 0x0136], %r24
	.word 0xf2dc6194  ! 3851: LDXA_I	ldxa	[%r17, + 0x0194] %asi, %r25
	.word 0xf20521de  ! 3852: LDUW_I	lduw	[%r20 + 0x01de], %r25
	.word 0xfe15a107  ! 3853: LDUH_I	lduh	[%r22 + 0x0107], %r31
	.word 0xf2cce03f  ! 3854: LDSBA_I	ldsba	[%r19, + 0x003f] %asi, %r25
T2_asi_reg_rd_156:
	mov	0x3c6, %r14
	.word 0xf4db8e40  ! 3856: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfc4d4000  ! 3858: LDSB_R	ldsb	[%r21 + %r0], %r30
	.word 0xf0550000  ! 3861: LDSH_R	ldsh	[%r20 + %r0], %r24
	.word 0xf4d460e9  ! 3866: LDSHA_I	ldsha	[%r17, + 0x00e9] %asi, %r26
	.word 0xba358000  ! 3867: ORN_R	orn 	%r22, %r0, %r29
cpu_intr_2_296:
	setx	0x3c013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbea4c000  ! 3869: SUBcc_R	subcc 	%r19, %r0, %r31
iob_intr_2_324:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_324), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf895c020  ! 3873: LDUHA_R	lduha	[%r23, %r0] 0x01, %r28
iob_intr_2_325:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_325), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_297:
	setx	0x3c013c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_298:
	setx	0x3e0006, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_189:
	mov	0x12, %r14
	.word 0xf2f38e80  ! 3882: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_2_326:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_326), 16, 16)) -> intp(2, 0, 17)
	.word 0xf6d40020  ! 3884: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xfacde1b9  ! 3890: LDSBA_I	ldsba	[%r23, + 0x01b9] %asi, %r29
	.word 0x8995a084  ! 3891: WRPR_TICK_I	wrpr	%r22, 0x0084, %tick
T2_asi_reg_wr_190:
	mov	0x1e, %r14
	.word 0xfcf384a0  ! 3896: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T2_asi_reg_wr_191:
	mov	0x19, %r14
	.word 0xf4f38e40  ! 3897: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfcd56076  ! 3899: LDSHA_I	ldsha	[%r21, + 0x0076] %asi, %r30
T2_asi_reg_rd_157:
	mov	0x1f, %r14
	.word 0xfcdb8e40  ! 3901: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_2_299:
	setx	0x3c010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0c54020  ! 3903: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r24
T2_asi_reg_rd_158:
	mov	0x3c0, %r14
	.word 0xf2db8e60  ! 3906: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xba440000  ! 3909: ADDC_R	addc 	%r16, %r0, %r29
	.word 0xf2144000  ! 3910: LDUH_R	lduh	[%r17 + %r0], %r25
iob_intr_2_327:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_327), 16, 16)) -> intp(2, 0, 2f)
T2_asi_reg_rd_159:
	mov	0x3c6, %r14
	.word 0xf2db8e40  ! 3912: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_160:
	mov	0x31, %r14
	.word 0xfedb8e80  ! 3914: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_2_328:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_328), 16, 16)) -> intp(2, 0, 23)
	ta	T_CHANGE_TO_TL1
	.word 0xf2c58020  ! 3920: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r25
iob_intr_2_329:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_329), 16, 16)) -> intp(2, 0, 33)
iob_intr_2_330:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_330), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf4846103  ! 3923: LDUWA_I	lduwa	[%r17, + 0x0103] %asi, %r26
T2_asi_reg_wr_192:
	mov	0x3c3, %r14
	.word 0xf8f389e0  ! 3924: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T2_asi_reg_rd_161:
	mov	0x1f, %r14
	.word 0xf4db84a0  ! 3925: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xfa5461ec  ! 3927: LDSH_I	ldsh	[%r17 + 0x01ec], %r29
T2_asi_reg_wr_193:
	mov	0x30, %r14
	.word 0xf4f38e40  ! 3928: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfa5d203d  ! 3931: LDX_I	ldx	[%r20 + 0x003d], %r29
	.word 0xfa456018  ! 3933: LDSW_I	ldsw	[%r21 + 0x0018], %r29
cpu_intr_2_300:
	setx	0x3e0326, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_194:
	mov	0x38, %r14
	.word 0xf8f384a0  ! 3938: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbd2d2001  ! 3940: SLL_I	sll 	%r20, 0x0001, %r30
T2_asi_reg_wr_195:
	mov	0x13, %r14
	.word 0xf2f38e60  ! 3942: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xfacc0020  ! 3951: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r29
T2_asi_reg_wr_196:
	mov	0x3c4, %r14
	.word 0xfcf38e40  ! 3952: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb9643801  ! 3953: MOVcc_I	<illegal instruction>
T2_asi_reg_rd_162:
	mov	0x2f, %r14
	.word 0xf6db8400  ! 3954: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf8cc2124  ! 3956: LDSBA_I	ldsba	[%r16, + 0x0124] %asi, %r28
	.word 0xb6b56130  ! 3957: ORNcc_I	orncc 	%r21, 0x0130, %r27
T2_asi_reg_wr_197:
	mov	0xd, %r14
	.word 0xf2f38e80  ! 3960: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf4952016  ! 3963: LDUHA_I	lduha	[%r20, + 0x0016] %asi, %r26
	.word 0xf684e03e  ! 3966: LDUWA_I	lduwa	[%r19, + 0x003e] %asi, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_331:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_331), 16, 16)) -> intp(2, 0, 11)
	.word 0xf88c8020  ! 3971: LDUBA_R	lduba	[%r18, %r0] 0x01, %r28
	.word 0xbb3d9000  ! 3973: SRAX_R	srax	%r22, %r0, %r29
T2_asi_reg_rd_163:
	mov	0x7, %r14
	.word 0xf4db8e60  ! 3976: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_2_301:
	setx	0x3f032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_302:
	setx	0x3f0030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0c54020  ! 3989: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r24
	.word 0xf65da08a  ! 3990: LDX_I	ldx	[%r22 + 0x008a], %r27
	ta	T_CHANGE_TO_TL0
	.word 0xbe156112  ! 3995: OR_I	or 	%r21, 0x0112, %r31
	.word 0xfc048000  ! 3999: LDUW_R	lduw	[%r18 + %r0], %r30
iob_intr_2_332:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_332), 16, 16)) -> intp(2, 0, 7)
	.word 0xf0dda117  ! 4002: LDXA_I	ldxa	[%r22, + 0x0117] %asi, %r24
T2_asi_reg_wr_198:
	mov	0x30, %r14
	.word 0xfaf38400  ! 4007: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xfa0d0000  ! 4009: LDUB_R	ldub	[%r20 + %r0], %r29
	.word 0xf60de1ee  ! 4011: LDUB_I	ldub	[%r23 + 0x01ee], %r27
	.word 0xf00520da  ! 4012: LDUW_I	lduw	[%r20 + 0x00da], %r24
	.word 0xf64ce07b  ! 4016: LDSB_I	ldsb	[%r19 + 0x007b], %r27
T2_asi_reg_rd_164:
	mov	0x0, %r14
	.word 0xfadb8e40  ! 4017: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_wr_199:
	mov	0x10, %r14
	.word 0xf0f38e40  ! 4018: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_wr_200:
	mov	0x2c, %r14
	.word 0xf0f389e0  ! 4021: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T2_asi_reg_rd_165:
	mov	0x3c2, %r14
	.word 0xfedb89e0  ! 4026: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf84d4000  ! 4027: LDSB_R	ldsb	[%r21 + %r0], %r28
cpu_intr_2_303:
	setx	0x3c0228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc04615b  ! 4033: ADD_I	add 	%r17, 0x015b, %r30
	.word 0xf2040000  ! 4036: LDUW_R	lduw	[%r16 + %r0], %r25
cpu_intr_2_304:
	setx	0x3d0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8d5c020  ! 4041: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r28
	.word 0xfe040000  ! 4046: LDUW_R	lduw	[%r16 + %r0], %r31
cpu_intr_2_305:
	setx	0x3f0135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8c0020  ! 4049: LDUBA_R	lduba	[%r16, %r0] 0x01, %r29
	.word 0xb4b520bb  ! 4050: SUBCcc_I	orncc 	%r20, 0x00bb, %r26
	.word 0xf4c4a12b  ! 4051: LDSWA_I	ldswa	[%r18, + 0x012b] %asi, %r26
T2_asi_reg_wr_201:
	mov	0x37, %r14
	.word 0xfaf38e60  ! 4052: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983d10  ! 4055: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d10, %hpstate
	.word 0xf455e054  ! 4056: LDSH_I	ldsh	[%r23 + 0x0054], %r26
	.word 0xfa14e1c5  ! 4058: LDUH_I	lduh	[%r19 + 0x01c5], %r29
	.word 0xbec4a021  ! 4059: ADDCcc_I	addccc 	%r18, 0x0021, %r31
cpu_intr_2_306:
	setx	0x3f030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8246180  ! 4061: SUB_I	sub 	%r17, 0x0180, %r28
cpu_intr_2_307:
	setx	0x3e0212, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_308:
	setx	0x3d003a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_309:
	setx	0x3e0104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb63d20c8  ! 4069: XNOR_I	xnor 	%r20, 0x00c8, %r27
iob_intr_2_333:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_333), 16, 16)) -> intp(2, 0, 35)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_310:
	setx	0x3e0211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfacd0020  ! 4076: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r29
iob_intr_2_334:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_334), 16, 16)) -> intp(2, 0, 25)
	.word 0xf295e0ac  ! 4078: LDUHA_I	lduha	[%r23, + 0x00ac] %asi, %r25
	.word 0xf64d0000  ! 4080: LDSB_R	ldsb	[%r20 + %r0], %r27
T2_asi_reg_rd_166:
	mov	0x3c1, %r14
	.word 0xfadb8400  ! 4081: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb23c6063  ! 4082: XNOR_I	xnor 	%r17, 0x0063, %r25
	.word 0xfa04e08b  ! 4083: LDUW_I	lduw	[%r19 + 0x008b], %r29
	.word 0xfa5dc000  ! 4084: LDX_R	ldx	[%r23 + %r0], %r29
T2_asi_reg_rd_167:
	mov	0x3c3, %r14
	.word 0xf2db89e0  ! 4085: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xfed4e0db  ! 4087: LDSHA_I	ldsha	[%r19, + 0x00db] %asi, %r31
cpu_intr_2_311:
	setx	0x3e0222, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_168:
	mov	0x1, %r14
	.word 0xf2db8e40  ! 4089: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_2_335:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_335), 16, 16)) -> intp(2, 0, 8)
	.word 0xfc0d608d  ! 4094: LDUB_I	ldub	[%r21 + 0x008d], %r30
cpu_intr_2_312:
	setx	0x3e0107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0dde0b9  ! 4100: LDXA_I	ldxa	[%r23, + 0x00b9] %asi, %r24
	.word 0xbca4c000  ! 4101: SUBcc_R	subcc 	%r19, %r0, %r30
	.word 0x8995a1ca  ! 4103: WRPR_TICK_I	wrpr	%r22, 0x01ca, %tick
cpu_intr_2_313:
	setx	0x3e000e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_169:
	mov	0x29, %r14
	.word 0xf2db84a0  ! 4106: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf8c4e1d3  ! 4107: LDSWA_I	ldswa	[%r19, + 0x01d3] %asi, %r28
	.word 0xf405218d  ! 4109: LDUW_I	lduw	[%r20 + 0x018d], %r26
	.word 0xbc95a077  ! 4112: ORcc_I	orcc 	%r22, 0x0077, %r30
	ta	T_CHANGE_HPRIV
iob_intr_2_336:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_336), 16, 16)) -> intp(2, 0, 27)
	.word 0xf45d8000  ! 4122: LDX_R	ldx	[%r22 + %r0], %r26
cpu_intr_2_314:
	setx	0x41013e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_315:
	setx	0x41022f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_316:
	setx	0x420118, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_337:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_337), 16, 16)) -> intp(2, 0, 2d)
cpu_intr_2_317:
	setx	0x40001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6856149  ! 4136: LDUWA_I	lduwa	[%r21, + 0x0149] %asi, %r27
	.word 0xf4cdc020  ! 4139: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf8d5e0e9  ! 4142: LDSHA_I	ldsha	[%r23, + 0x00e9] %asi, %r28
cpu_intr_2_318:
	setx	0x420237, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
cpu_intr_2_319:
	setx	0x410133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8bca118  ! 4155: XNORcc_I	xnorcc 	%r18, 0x0118, %r28
cpu_intr_2_320:
	setx	0x400009, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_202:
	mov	0x26, %r14
	.word 0xf2f38e80  ! 4160: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbe35c000  ! 4161: SUBC_R	orn 	%r23, %r0, %r31
	.word 0xfe950020  ! 4162: LDUHA_R	lduha	[%r20, %r0] 0x01, %r31
	.word 0xfe84a169  ! 4163: LDUWA_I	lduwa	[%r18, + 0x0169] %asi, %r31
iob_intr_2_338:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_338), 16, 16)) -> intp(2, 0, d)
T2_asi_reg_rd_170:
	mov	0x3c5, %r14
	.word 0xfcdb89e0  ! 4165: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf495c020  ! 4168: LDUHA_R	lduha	[%r23, %r0] 0x01, %r26
T2_asi_reg_wr_203:
	mov	0x28, %r14
	.word 0xf0f389e0  ! 4169: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf40de01c  ! 4170: LDUB_I	ldub	[%r23 + 0x001c], %r26
	.word 0xf094e051  ! 4172: LDUHA_I	lduha	[%r19, + 0x0051] %asi, %r24
cpu_intr_2_321:
	setx	0x420304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_339:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_339), 16, 16)) -> intp(2, 0, 3b)
iob_intr_2_340:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_340), 16, 16)) -> intp(2, 0, 6)
T2_asi_reg_rd_171:
	mov	0x2e, %r14
	.word 0xf2db8400  ! 4180: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_2_341:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_341), 16, 16)) -> intp(2, 0, 15)
	.word 0xb4c4e147  ! 4183: ADDCcc_I	addccc 	%r19, 0x0147, %r26
	ta	T_CHANGE_TO_TL0
	.word 0xfe0ce14c  ! 4191: LDUB_I	ldub	[%r19 + 0x014c], %r31
	ta	T_CHANGE_TO_TL1
	.word 0xf0450000  ! 4193: LDSW_R	ldsw	[%r20 + %r0], %r24
	.word 0xba8cc000  ! 4194: ANDcc_R	andcc 	%r19, %r0, %r29
	.word 0xf45521c2  ! 4196: LDSH_I	ldsh	[%r20 + 0x01c2], %r26
T2_asi_reg_rd_172:
	mov	0x2d, %r14
	.word 0xfadb89e0  ! 4200: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_2_322:
	setx	0x42021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7353001  ! 4205: SRLX_I	srlx	%r20, 0x0001, %r27
T2_asi_reg_wr_204:
	mov	0x27, %r14
	.word 0xfaf38e60  ! 4206: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_2_323:
	setx	0x410014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc04a0d4  ! 4209: ADD_I	add 	%r18, 0x00d4, %r30
iob_intr_2_342:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_342), 16, 16)) -> intp(2, 0, 1)
cpu_intr_2_324:
	setx	0x430026, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_173:
	mov	0x33, %r14
	.word 0xfedb8400  ! 4219: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T2_asi_reg_wr_205:
	mov	0x16, %r14
	.word 0xfcf38e40  ! 4221: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_325:
	setx	0x40002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf00c4000  ! 4224: LDUB_R	ldub	[%r17 + %r0], %r24
	.word 0xbcc5e0e9  ! 4227: ADDCcc_I	addccc 	%r23, 0x00e9, %r30
	.word 0xf654615d  ! 4228: LDSH_I	ldsh	[%r17 + 0x015d], %r27
T2_asi_reg_wr_206:
	mov	0x16, %r14
	.word 0xf8f38e80  ! 4229: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb23d0000  ! 4230: XNOR_R	xnor 	%r20, %r0, %r25
	.word 0xf855e151  ! 4231: LDSH_I	ldsh	[%r23 + 0x0151], %r28
T2_asi_reg_wr_207:
	mov	0x3c2, %r14
	.word 0xf8f38e60  ! 4233: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_2_343:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_343), 16, 16)) -> intp(2, 0, 21)
iob_intr_2_344:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_344), 16, 16)) -> intp(2, 0, 2f)
iob_intr_2_345:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_345), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_rd_174:
	mov	0x3c0, %r14
	.word 0xf0db8e40  ! 4239: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T2_asi_reg_wr_208:
	mov	0x36, %r14
	.word 0xfaf38400  ! 4241: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf054e001  ! 4242: LDSH_I	ldsh	[%r19 + 0x0001], %r24
	.word 0xf88c8020  ! 4243: LDUBA_R	lduba	[%r18, %r0] 0x01, %r28
	.word 0xfc84a0db  ! 4244: LDUWA_I	lduwa	[%r18, + 0x00db] %asi, %r30
	.word 0xfe048000  ! 4246: LDUW_R	lduw	[%r18 + %r0], %r31
cpu_intr_2_326:
	setx	0x400020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb895e077  ! 4252: ORcc_I	orcc 	%r23, 0x0077, %r28
	.word 0xba2c8000  ! 4253: ANDN_R	andn 	%r18, %r0, %r29
	.word 0xb6c4e061  ! 4254: ADDCcc_I	addccc 	%r19, 0x0061, %r27
	.word 0xf28de1bc  ! 4256: LDUBA_I	lduba	[%r23, + 0x01bc] %asi, %r25
T2_asi_reg_rd_175:
	mov	0x6, %r14
	.word 0xfadb8400  ! 4258: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf6154000  ! 4260: LDUH_R	lduh	[%r21 + %r0], %r27
	.word 0xf4040000  ! 4261: LDUW_R	lduw	[%r16 + %r0], %r26
	.word 0xf84da149  ! 4269: LDSB_I	ldsb	[%r22 + 0x0149], %r28
iob_intr_2_346:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_346), 16, 16)) -> intp(2, 0, 3d)
	.word 0xbe148000  ! 4275: OR_R	or 	%r18, %r0, %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xb6346122  ! 4278: ORN_I	orn 	%r17, 0x0122, %r27
T2_asi_reg_rd_176:
	mov	0x2a, %r14
	.word 0xfcdb8e40  ! 4281: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_2_347:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_347), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf4052004  ! 4283: LDUW_I	lduw	[%r20 + 0x0004], %r26
	.word 0xf4050000  ! 4284: LDUW_R	lduw	[%r20 + %r0], %r26
	.word 0xfe4c4000  ! 4286: LDSB_R	ldsb	[%r17 + %r0], %r31
cpu_intr_2_327:
	setx	0x410338, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_177:
	mov	0x3c6, %r14
	.word 0xfcdb8400  ! 4290: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf295c020  ! 4294: LDUHA_R	lduha	[%r23, %r0] 0x01, %r25
	.word 0xf6442127  ! 4295: LDSW_I	ldsw	[%r16 + 0x0127], %r27
T2_asi_reg_wr_209:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 4296: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_2_328:
	setx	0x420017, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_348:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_348), 16, 16)) -> intp(2, 0, 24)
iob_intr_2_349:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_349), 16, 16)) -> intp(2, 0, 39)
cpu_intr_2_329:
	setx	0x43001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2950020  ! 4302: LDUHA_R	lduha	[%r20, %r0] 0x01, %r25
T2_asi_reg_wr_210:
	mov	0x7, %r14
	.word 0xfcf38400  ! 4303: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_2_350:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_350), 16, 16)) -> intp(2, 0, 11)
	.word 0xf08d209d  ! 4309: LDUBA_I	lduba	[%r20, + 0x009d] %asi, %r24
iob_intr_2_351:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_351), 16, 16)) -> intp(2, 0, 2c)
iob_intr_2_352:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_352), 16, 16)) -> intp(2, 0, 13)
T2_asi_reg_wr_211:
	mov	0xa, %r14
	.word 0xfaf38e60  ! 4314: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983b42  ! 4320: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b42, %hpstate
T2_asi_reg_wr_212:
	mov	0x8, %r14
	.word 0xf4f38400  ! 4323: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf2158000  ! 4326: LDUH_R	lduh	[%r22 + %r0], %r25
	.word 0xfe8d60dd  ! 4328: LDUBA_I	lduba	[%r21, + 0x00dd] %asi, %r31
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983bda  ! 4329: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bda, %hpstate
iob_intr_2_353:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_353), 16, 16)) -> intp(2, 0, 1e)
	ta	T_CHANGE_HPRIV
	.word 0xf255c000  ! 4334: LDSH_R	ldsh	[%r23 + %r0], %r25
iob_intr_2_354:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_354), 16, 16)) -> intp(2, 0, 3)
T2_asi_reg_wr_213:
	mov	0x17, %r14
	.word 0xf2f38e40  ! 4336: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbe0c6049  ! 4337: AND_I	and 	%r17, 0x0049, %r31
T2_asi_reg_wr_214:
	mov	0x2b, %r14
	.word 0xfaf38e40  ! 4338: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_355:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_355), 16, 16)) -> intp(2, 0, 1d)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe8ce069  ! 4343: LDUBA_I	lduba	[%r19, + 0x0069] %asi, %r31
	.word 0xb9518000  ! 4344: RDPR_PSTATE	<illegal instruction>
cpu_intr_2_330:
	setx	0x430006, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_331:
	setx	0x410008, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_2_356:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_356), 16, 16)) -> intp(2, 0, 34)
	.word 0xfa4461b1  ! 4358: LDSW_I	ldsw	[%r17 + 0x01b1], %r29
	.word 0x81956097  ! 4361: WRPR_TPC_I	wrpr	%r21, 0x0097, %tpc
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_215:
	mov	0x18, %r14
	.word 0xf0f38e60  ! 4366: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983d88  ! 4367: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d88, %hpstate
cpu_intr_2_332:
	setx	0x420203, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_357:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_357), 16, 16)) -> intp(2, 0, 23)
cpu_intr_2_333:
	setx	0x400007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba344000  ! 4371: SUBC_R	orn 	%r17, %r0, %r29
T2_asi_reg_rd_178:
	mov	0x1d, %r14
	.word 0xfadb8e40  ! 4374: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf2858020  ! 4378: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r25
T2_asi_reg_rd_179:
	mov	0x31, %r14
	.word 0xf6db8e60  ! 4379: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_2_334:
	setx	0x430005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc5d2045  ! 4383: LDX_I	ldx	[%r20 + 0x0045], %r30
	.word 0xf6444000  ! 4385: LDSW_R	ldsw	[%r17 + %r0], %r27
T2_asi_reg_rd_180:
	mov	0x10, %r14
	.word 0xfcdb8e40  ! 4386: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf4044000  ! 4388: LDUW_R	lduw	[%r17 + %r0], %r26
	.word 0xfa4c4000  ! 4390: LDSB_R	ldsb	[%r17 + %r0], %r29
	.word 0xb1643801  ! 4391: MOVcc_I	<illegal instruction>
iob_intr_2_358:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_358), 16, 16)) -> intp(2, 0, 9)
	.word 0x8d94e095  ! 4395: WRPR_PSTATE_I	wrpr	%r19, 0x0095, %pstate
	.word 0xf8d40020  ! 4396: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r28
iob_intr_2_359:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_359), 16, 16)) -> intp(2, 0, d)
	.word 0xf48d20c6  ! 4399: LDUBA_I	lduba	[%r20, + 0x00c6] %asi, %r26
	.word 0xbb349000  ! 4400: SRLX_R	srlx	%r18, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_360:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_360), 16, 16)) -> intp(2, 0, 24)
cpu_intr_2_335:
	setx	0x410300, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_216:
	mov	0x3c1, %r14
	.word 0xf2f38e40  ! 4411: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfe5c0000  ! 4417: LDX_R	ldx	[%r16 + %r0], %r31
	.word 0xbc0d6078  ! 4418: AND_I	and 	%r21, 0x0078, %r30
	.word 0xfc1560ee  ! 4419: LDUH_I	lduh	[%r21 + 0x00ee], %r30
	.word 0xf25ca1a7  ! 4420: LDX_I	ldx	[%r18 + 0x01a7], %r25
T2_asi_reg_wr_217:
	mov	0x7, %r14
	.word 0xf4f38400  ! 4422: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_2_361:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_361), 16, 16)) -> intp(2, 0, 3f)
	.word 0xfccd0020  ! 4426: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r30
	.word 0xb13d1000  ! 4429: SRAX_R	srax	%r20, %r0, %r24
	.word 0xfc8d0020  ! 4432: LDUBA_R	lduba	[%r20, %r0] 0x01, %r30
	.word 0xba44a06f  ! 4433: ADDC_I	addc 	%r18, 0x006f, %r29
	.word 0xb8a56086  ! 4435: SUBcc_I	subcc 	%r21, 0x0086, %r28
	.word 0xfc950020  ! 4437: LDUHA_R	lduha	[%r20, %r0] 0x01, %r30
T2_asi_reg_rd_181:
	mov	0x16, %r14
	.word 0xfcdb8e40  ! 4438: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_182:
	mov	0xe, %r14
	.word 0xf4db8400  ! 4445: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xfe846144  ! 4447: LDUWA_I	lduwa	[%r17, + 0x0144] %asi, %r31
	.word 0xf08d6148  ! 4448: LDUBA_I	lduba	[%r21, + 0x0148] %asi, %r24
	.word 0xf05c217a  ! 4449: LDX_I	ldx	[%r16 + 0x017a], %r24
	.word 0xfed46072  ! 4450: LDSHA_I	ldsha	[%r17, + 0x0072] %asi, %r31
T2_asi_reg_wr_218:
	mov	0x32, %r14
	.word 0xf8f389e0  ! 4451: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
iob_intr_2_362:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_362), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_336:
	setx	0x41011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf48c4020  ! 4456: LDUBA_R	lduba	[%r17, %r0] 0x01, %r26
	.word 0xb7504000  ! 4457: RDPR_TNPC	<illegal instruction>
cpu_intr_2_337:
	setx	0x410013, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfa4dc000  ! 4461: LDSB_R	ldsb	[%r23 + %r0], %r29
cpu_intr_2_338:
	setx	0x400133, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_219:
	mov	0x3c0, %r14
	.word 0xf0f38e40  ! 4464: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_2_339:
	setx	0x43030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88de1f6  ! 4468: LDUBA_I	lduba	[%r23, + 0x01f6] %asi, %r28
iob_intr_2_363:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_363), 16, 16)) -> intp(2, 0, 26)
	.word 0xfa5420c2  ! 4472: LDSH_I	ldsh	[%r16 + 0x00c2], %r29
T2_asi_reg_rd_183:
	mov	0x11, %r14
	.word 0xf2db8e60  ! 4475: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T2_asi_reg_wr_220:
	mov	0x3c6, %r14
	.word 0xf6f38e60  ! 4476: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb08d2040  ! 4480: ANDcc_I	andcc 	%r20, 0x0040, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4452038  ! 4483: LDSW_I	ldsw	[%r20 + 0x0038], %r26
iob_intr_2_364:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_364), 16, 16)) -> intp(2, 0, 14)
cpu_intr_2_340:
	setx	0x43002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xfc952018  ! 4492: LDUHA_I	lduha	[%r20, + 0x0018] %asi, %r30
	ta	T_CHANGE_TO_TL0
	.word 0xf844617b  ! 4497: LDSW_I	ldsw	[%r17 + 0x017b], %r28
	.word 0xbb510000  ! 4498: RDPR_TICK	<illegal instruction>
	.word 0xfcc40020  ! 4499: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r30
iob_intr_2_365:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_365), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_rd_184:
	mov	0x10, %r14
	.word 0xfedb8e40  ! 4505: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf4954020  ! 4508: LDUHA_R	lduha	[%r21, %r0] 0x01, %r26
	.word 0xf48c4020  ! 4509: LDUBA_R	lduba	[%r17, %r0] 0x01, %r26
T2_asi_reg_wr_221:
	mov	0x22, %r14
	.word 0xf2f38e80  ! 4514: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbe050000  ! 4519: ADD_R	add 	%r20, %r0, %r31
	.word 0xf8040000  ! 4520: LDUW_R	lduw	[%r16 + %r0], %r28
iob_intr_2_366:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_366), 16, 16)) -> intp(2, 0, 16)
T2_asi_reg_wr_222:
	mov	0x1, %r14
	.word 0xf8f38400  ! 4531: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb151c000  ! 4532: RDPR_TL	<illegal instruction>
iob_intr_2_367:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_367), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_341:
	setx	0x430219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf69460a3  ! 4539: LDUHA_I	lduha	[%r17, + 0x00a3] %asi, %r27
T2_asi_reg_wr_223:
	mov	0x1a, %r14
	.word 0xf0f38e60  ! 4540: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xf045e14f  ! 4541: LDSW_I	ldsw	[%r23 + 0x014f], %r24
T2_asi_reg_rd_185:
	mov	0x31, %r14
	.word 0xf6db84a0  ! 4544: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T2_asi_reg_wr_224:
	mov	0x3c7, %r14
	.word 0xfef38400  ! 4545: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf8944020  ! 4546: LDUHA_R	lduha	[%r17, %r0] 0x01, %r28
iob_intr_2_368:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_368), 16, 16)) -> intp(2, 0, 14)
cpu_intr_2_342:
	setx	0x400006, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_343:
	setx	0x42000e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_344:
	setx	0x40030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0dc610a  ! 4558: LDXA_I	ldxa	[%r17, + 0x010a] %asi, %r24
T2_asi_reg_wr_225:
	mov	0x2, %r14
	.word 0xf6f389e0  ! 4559: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xfecdc020  ! 4560: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r31
	.word 0xfc8c61ec  ! 4562: LDUBA_I	lduba	[%r17, + 0x01ec] %asi, %r30
	.word 0xfa0cc000  ! 4563: LDUB_R	ldub	[%r19 + %r0], %r29
	.word 0xf28cc020  ! 4564: LDUBA_R	lduba	[%r19, %r0] 0x01, %r25
iob_intr_2_369:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_369), 16, 16)) -> intp(2, 0, 0)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb0bde175  ! 4567: XNORcc_I	xnorcc 	%r23, 0x0175, %r24
T2_asi_reg_wr_226:
	mov	0x3c5, %r14
	.word 0xfcf384a0  ! 4568: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf0844020  ! 4571: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r24
	.word 0xfe5d0000  ! 4572: LDX_R	ldx	[%r20 + %r0], %r31
	.word 0xbe0c8000  ! 4574: AND_R	and 	%r18, %r0, %r31
iob_intr_2_370:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_370), 16, 16)) -> intp(2, 0, 1a)
	.word 0xfccd606e  ! 4576: LDSBA_I	ldsba	[%r21, + 0x006e] %asi, %r30
	.word 0xb8c48000  ! 4577: ADDCcc_R	addccc 	%r18, %r0, %r28
iob_intr_2_371:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_371), 16, 16)) -> intp(2, 0, 2e)
	.word 0xb52c1000  ! 4581: SLLX_R	sllx	%r16, %r0, %r26
	.word 0xbd508000  ! 4582: RDPR_TSTATE	<illegal instruction>
cpu_intr_2_345:
	setx	0x44003f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_227:
	mov	0x9, %r14
	.word 0xfaf38e40  ! 4585: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_346:
	setx	0x450236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc85a0ac  ! 4587: ADDcc_I	addcc 	%r22, 0x00ac, %r30
	.word 0xf6c44020  ! 4590: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r27
T2_asi_reg_rd_186:
	mov	0x8, %r14
	.word 0xf6db8400  ! 4593: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbe35e193  ! 4594: SUBC_I	orn 	%r23, 0x0193, %r31
	.word 0xb09ce044  ! 4596: XORcc_I	xorcc 	%r19, 0x0044, %r24
iob_intr_2_372:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_372), 16, 16)) -> intp(2, 0, 1)
	.word 0xfccd201f  ! 4600: LDSBA_I	ldsba	[%r20, + 0x001f] %asi, %r30
	.word 0xf45d8000  ! 4602: LDX_R	ldx	[%r22 + %r0], %r26
T2_asi_reg_wr_228:
	mov	0x35, %r14
	.word 0xf0f38e60  ! 4603: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xbd504000  ! 4605: RDPR_TNPC	<illegal instruction>
	.word 0xf6550000  ! 4606: LDSH_R	ldsh	[%r20 + %r0], %r27
T2_asi_reg_rd_187:
	mov	0x36, %r14
	.word 0xfadb8e60  ! 4607: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_2_347:
	setx	0x47000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf814c000  ! 4610: LDUH_R	lduh	[%r19 + %r0], %r28
T2_asi_reg_wr_229:
	mov	0x34, %r14
	.word 0xf0f38400  ! 4612: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb8248000  ! 4616: SUB_R	sub 	%r18, %r0, %r28
	.word 0xfa148000  ! 4618: LDUH_R	lduh	[%r18 + %r0], %r29
	ta	T_CHANGE_HPRIV
	.word 0xfe0c0000  ! 4620: LDUB_R	ldub	[%r16 + %r0], %r31
	.word 0xbd3c6001  ! 4622: SRA_I	sra 	%r17, 0x0001, %r30
	.word 0xfe95e118  ! 4625: LDUHA_I	lduha	[%r23, + 0x0118] %asi, %r31
	.word 0xfe440000  ! 4626: LDSW_R	ldsw	[%r16 + %r0], %r31
	.word 0xf2dca13d  ! 4627: LDXA_I	ldxa	[%r18, + 0x013d] %asi, %r25
iob_intr_2_373:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_373), 16, 16)) -> intp(2, 0, 28)
	.word 0xb13c3001  ! 4629: SRAX_I	srax	%r16, 0x0001, %r24
T2_asi_reg_wr_230:
	mov	0x3c8, %r14
	.word 0xf0f38e40  ! 4630: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_rd_188:
	mov	0x17, %r14
	.word 0xf6db8400  ! 4631: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983d5a  ! 4634: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d5a, %hpstate
T2_asi_reg_rd_189:
	mov	0x24, %r14
	.word 0xfedb8e80  ! 4636: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T2_asi_reg_wr_231:
	mov	0x20, %r14
	.word 0xf2f38e40  ! 4637: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf2dce007  ! 4638: LDXA_I	ldxa	[%r19, + 0x0007] %asi, %r25
	.word 0xba14e04e  ! 4639: OR_I	or 	%r19, 0x004e, %r29
	.word 0xf84d202a  ! 4640: LDSB_I	ldsb	[%r20 + 0x002a], %r28
iob_intr_2_374:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_374), 16, 16)) -> intp(2, 0, d)
	.word 0xf65de0cd  ! 4642: LDX_I	ldx	[%r23 + 0x00cd], %r27
	.word 0xfa4c608d  ! 4644: LDSB_I	ldsb	[%r17 + 0x008d], %r29
cpu_intr_2_348:
	setx	0x470233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_349:
	setx	0x45002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_2_375:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_375), 16, 16)) -> intp(2, 0, 24)
cpu_intr_2_350:
	setx	0x440224, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_376:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_376), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_rd_190:
	mov	0x3c0, %r14
	.word 0xf2db8400  ! 4654: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_2_351:
	setx	0x46002e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_352:
	setx	0x44030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf054a145  ! 4658: LDSH_I	ldsh	[%r18 + 0x0145], %r24
	.word 0xbc1da044  ! 4659: XOR_I	xor 	%r22, 0x0044, %r30
iob_intr_2_377:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_377), 16, 16)) -> intp(2, 0, 36)
	.word 0xb13c8000  ! 4662: SRA_R	sra 	%r18, %r0, %r24
iob_intr_2_378:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_378), 16, 16)) -> intp(2, 0, 4)
	.word 0xb5504000  ! 4664: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982948  ! 4667: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0948, %hpstate
cpu_intr_2_353:
	setx	0x440335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0dc000  ! 4669: LDUB_R	ldub	[%r23 + %r0], %r31
T2_asi_reg_rd_191:
	mov	0x7, %r14
	.word 0xf6db8e40  ! 4673: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb8ac8000  ! 4674: ANDNcc_R	andncc 	%r18, %r0, %r28
iob_intr_2_379:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_379), 16, 16)) -> intp(2, 0, 3b)
iob_intr_2_380:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_380), 16, 16)) -> intp(2, 0, 0)
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982f52  ! 4677: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f52, %hpstate
	.word 0xb73df001  ! 4678: SRAX_I	srax	%r23, 0x0001, %r27
	.word 0xf4854020  ! 4679: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r26
T2_asi_reg_wr_232:
	mov	0x25, %r14
	.word 0xfef384a0  ! 4680: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T2_asi_reg_rd_192:
	mov	0x3c7, %r14
	.word 0xf8db84a0  ! 4684: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_2_354:
	setx	0x460111, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982e42  ! 4688: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e42, %hpstate
	.word 0xba3dc000  ! 4693: XNOR_R	xnor 	%r23, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_355:
	setx	0x470021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe954000  ! 4698: ORcc_R	orcc 	%r21, %r0, %r31
	.word 0xf8c42083  ! 4700: LDSWA_I	ldswa	[%r16, + 0x0083] %asi, %r28
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_193:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 4703: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf85d0000  ! 4705: LDX_R	ldx	[%r20 + %r0], %r28
T2_asi_reg_rd_194:
	mov	0x4, %r14
	.word 0xf4db8e40  ! 4706: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_wr_233:
	mov	0x22, %r14
	.word 0xf0f38e40  ! 4707: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	.word 0xf815e025  ! 4712: LDUH_I	lduh	[%r23 + 0x0025], %r28
iob_intr_2_381:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_381), 16, 16)) -> intp(2, 0, 2e)
iob_intr_2_382:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_382), 16, 16)) -> intp(2, 0, 11)
iob_intr_2_383:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_383), 16, 16)) -> intp(2, 0, 24)
	ta	T_CHANGE_NONHPRIV
	.word 0xf485605f  ! 4723: LDUWA_I	lduwa	[%r21, + 0x005f] %asi, %r26
iob_intr_2_384:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_384), 16, 16)) -> intp(2, 0, 3e)
iob_intr_2_385:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_385), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_rd_195:
	mov	0x1f, %r14
	.word 0xfedb8e40  ! 4730: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb6152011  ! 4731: OR_I	or 	%r20, 0x0011, %r27
cpu_intr_2_356:
	setx	0x470119, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_357:
	setx	0x470014, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_386:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_386), 16, 16)) -> intp(2, 0, 36)
T2_asi_reg_wr_234:
	mov	0x26, %r14
	.word 0xf6f389e0  ! 4737: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf4044000  ! 4739: LDUW_R	lduw	[%r17 + %r0], %r26
T2_asi_reg_rd_196:
	mov	0x37, %r14
	.word 0xf2db8e60  ! 4740: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T2_asi_reg_wr_235:
	mov	0x1, %r14
	.word 0xf0f38e40  ! 4741: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf8842165  ! 4745: LDUWA_I	lduwa	[%r16, + 0x0165] %asi, %r28
iob_intr_2_387:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_387), 16, 16)) -> intp(2, 0, 4)
T2_asi_reg_rd_197:
	mov	0x6, %r14
	.word 0xf4db89e0  ! 4747: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_2_388:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_388), 16, 16)) -> intp(2, 0, 34)
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982e42  ! 4753: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e42, %hpstate
iob_intr_2_389:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_389), 16, 16)) -> intp(2, 0, 29)
	.word 0xf6c56178  ! 4759: LDSWA_I	ldswa	[%r21, + 0x0178] %asi, %r27
	.word 0xfc554000  ! 4760: LDSH_R	ldsh	[%r21 + %r0], %r30
	.word 0xbac50000  ! 4761: ADDCcc_R	addccc 	%r20, %r0, %r29
cpu_intr_2_358:
	setx	0x470134, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_390:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_390), 16, 16)) -> intp(2, 0, 2e)
iob_intr_2_391:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_391), 16, 16)) -> intp(2, 0, c)
	.word 0xf055c000  ! 4769: LDSH_R	ldsh	[%r23 + %r0], %r24
iob_intr_2_392:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_392), 16, 16)) -> intp(2, 0, 26)
T2_asi_reg_wr_236:
	mov	0x3c3, %r14
	.word 0xf2f389e0  ! 4771: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xfa4c0000  ! 4772: LDSB_R	ldsb	[%r16 + %r0], %r29
	.word 0xf0958020  ! 4776: LDUHA_R	lduha	[%r22, %r0] 0x01, %r24
	.word 0xbd3dd000  ! 4779: SRAX_R	srax	%r23, %r0, %r30
cpu_intr_2_359:
	setx	0x440007, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_237:
	mov	0x29, %r14
	.word 0xf2f38e80  ! 4789: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf6dca078  ! 4790: LDXA_I	ldxa	[%r18, + 0x0078] %asi, %r27
	.word 0xf415205e  ! 4791: LDUH_I	lduh	[%r20 + 0x005e], %r26
iob_intr_2_393:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_393), 16, 16)) -> intp(2, 0, 15)
	.word 0xfad4a14e  ! 4795: LDSHA_I	ldsha	[%r18, + 0x014e] %asi, %r29
cpu_intr_2_360:
	setx	0x460114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf00460f2  ! 4800: LDUW_I	lduw	[%r17 + 0x00f2], %r24
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983e10  ! 4801: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e10, %hpstate
cpu_intr_2_361:
	setx	0x460134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf644e1d7  ! 4807: LDSW_I	ldsw	[%r19 + 0x01d7], %r27
cpu_intr_2_362:
	setx	0x470317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfed58020  ! 4810: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r31
cpu_intr_2_363:
	setx	0x440339, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983b82  ! 4814: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b82, %hpstate
T2_asi_reg_wr_238:
	mov	0x3c2, %r14
	.word 0xf8f38e80  ! 4815: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_2_364:
	setx	0x470039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6d48020  ! 4819: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r27
	.word 0xf6450000  ! 4821: LDSW_R	ldsw	[%r20 + %r0], %r27
	.word 0xf04d2192  ! 4822: LDSB_I	ldsb	[%r20 + 0x0192], %r24
cpu_intr_2_365:
	setx	0x450013, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_394:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_394), 16, 16)) -> intp(2, 0, 2a)
cpu_intr_2_366:
	setx	0x470309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf205a102  ! 4830: LDUW_I	lduw	[%r22 + 0x0102], %r25
cpu_intr_2_367:
	setx	0x470333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf08c209b  ! 4836: LDUBA_I	lduba	[%r16, + 0x009b] %asi, %r24
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983cd2  ! 4838: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd2, %hpstate
cpu_intr_2_368:
	setx	0x44013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf84ca101  ! 4845: LDSB_I	ldsb	[%r18 + 0x0101], %r28
cpu_intr_2_369:
	setx	0x450210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0444000  ! 4847: LDSW_R	ldsw	[%r17 + %r0], %r24
	.word 0xf60d8000  ! 4850: LDUB_R	ldub	[%r22 + %r0], %r27
T2_asi_reg_wr_239:
	mov	0x3c6, %r14
	.word 0xfaf384a0  ! 4851: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xf845c000  ! 4854: LDSW_R	ldsw	[%r23 + %r0], %r28
cpu_intr_2_370:
	setx	0x450130, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_395:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_395), 16, 16)) -> intp(2, 0, 34)
	.word 0xf6d52074  ! 4858: LDSHA_I	ldsha	[%r20, + 0x0074] %asi, %r27
cpu_intr_2_371:
	setx	0x450102, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xb72d4000  ! 4866: SLL_R	sll 	%r21, %r0, %r27
T2_asi_reg_rd_198:
	mov	0xb, %r14
	.word 0xf0db8400  ! 4869: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_199:
	mov	0x22, %r14
	.word 0xf4db89e0  ! 4871: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_2_396:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_396), 16, 16)) -> intp(2, 0, d)
	.word 0xbb3c3001  ! 4874: SRAX_I	srax	%r16, 0x0001, %r29
iob_intr_2_397:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_397), 16, 16)) -> intp(2, 0, 1d)
T2_asi_reg_rd_200:
	mov	0x3c6, %r14
	.word 0xf0db8e60  ! 4877: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_2_398:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_398), 16, 16)) -> intp(2, 0, 19)
	.word 0xf64c0000  ! 4881: LDSB_R	ldsb	[%r16 + %r0], %r27
	.word 0xfc4c0000  ! 4882: LDSB_R	ldsb	[%r16 + %r0], %r30
iob_intr_2_399:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_399), 16, 16)) -> intp(2, 0, 15)
	ta	T_CHANGE_TO_TL0
cpu_intr_2_372:
	setx	0x440138, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_400:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_400), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf814e0ec  ! 4891: LDUH_I	lduh	[%r19 + 0x00ec], %r28
T2_asi_reg_wr_240:
	mov	0x12, %r14
	.word 0xf0f38e40  ! 4892: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf24d2067  ! 4895: LDSB_I	ldsb	[%r20 + 0x0067], %r25
T2_asi_reg_rd_201:
	mov	0x15, %r14
	.word 0xf6db8e80  ! 4897: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf6c5c020  ! 4899: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r27
	.word 0xb2044000  ! 4900: ADD_R	add 	%r17, %r0, %r25
	.word 0xfa058000  ! 4902: LDUW_R	lduw	[%r22 + %r0], %r29
iob_intr_2_401:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_401), 16, 16)) -> intp(2, 0, 29)
	.word 0xf6944020  ! 4905: LDUHA_R	lduha	[%r17, %r0] 0x01, %r27
	.word 0xf414a188  ! 4909: LDUH_I	lduh	[%r18 + 0x0188], %r26
	.word 0xf604c000  ! 4912: LDUW_R	lduw	[%r19 + %r0], %r27
	.word 0xfc0c2077  ! 4913: LDUB_I	ldub	[%r16 + 0x0077], %r30
	.word 0xf055e0a8  ! 4914: LDSH_I	ldsh	[%r23 + 0x00a8], %r24
	.word 0xbac40000  ! 4916: ADDCcc_R	addccc 	%r16, %r0, %r29
T2_asi_reg_wr_241:
	mov	0x3c3, %r14
	.word 0xf6f38e80  ! 4917: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf4946135  ! 4918: LDUHA_I	lduha	[%r17, + 0x0135] %asi, %r26
	.word 0xb73c8000  ! 4921: SRA_R	sra 	%r18, %r0, %r27
	.word 0xb9343001  ! 4925: SRLX_I	srlx	%r16, 0x0001, %r28
iob_intr_2_402:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_402), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_wr_242:
	mov	0x1f, %r14
	.word 0xf0f38e80  ! 4927: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_2_403:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_403), 16, 16)) -> intp(2, 0, 34)
	.word 0xf8c4a083  ! 4929: LDSWA_I	ldswa	[%r18, + 0x0083] %asi, %r28
T2_asi_reg_rd_202:
	mov	0x2b, %r14
	.word 0xfcdb8e80  ! 4932: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_373:
	setx	0x46001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_203:
	mov	0x3c7, %r14
	.word 0xf0db8e60  ! 4937: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xfc5d2058  ! 4939: LDX_I	ldx	[%r20 + 0x0058], %r30
iob_intr_2_404:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_404), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf40de020  ! 4945: LDUB_I	ldub	[%r23 + 0x0020], %r26
	.word 0xf4044000  ! 4949: LDUW_R	lduw	[%r17 + %r0], %r26
	.word 0xbd641800  ! 4950: MOVcc_R	<illegal instruction>
	.word 0xfc4d0000  ! 4952: LDSB_R	ldsb	[%r20 + %r0], %r30
cpu_intr_2_374:
	setx	0x440002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0da052  ! 4954: LDUB_I	ldub	[%r22 + 0x0052], %r29
T2_asi_reg_rd_204:
	mov	0x33, %r14
	.word 0xfcdb8e40  ! 4955: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_rd_205:
	mov	0x15, %r14
	.word 0xf6db8e40  ! 4956: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_rd_206:
	mov	0x3c5, %r14
	.word 0xf6db8400  ! 4957: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xfa5ca01b  ! 4958: LDX_I	ldx	[%r18 + 0x001b], %r29
	.word 0xf00c2064  ! 4962: LDUB_I	ldub	[%r16 + 0x0064], %r24
iob_intr_2_405:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_405), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf8548000  ! 4968: LDSH_R	ldsh	[%r18 + %r0], %r28
iob_intr_2_406:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_406), 16, 16)) -> intp(2, 0, 9)
	ta	T_CHANGE_HPRIV
	.word 0xf4cd617a  ! 4976: LDSBA_I	ldsba	[%r21, + 0x017a] %asi, %r26
	.word 0xfa0c8000  ! 4977: LDUB_R	ldub	[%r18 + %r0], %r29
T2_asi_reg_rd_207:
	mov	0x1c, %r14
	.word 0xf4db84a0  ! 4978: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf215e139  ! 4979: LDUH_I	lduh	[%r23 + 0x0139], %r25
	.word 0xfc9521db  ! 4981: LDUHA_I	lduha	[%r20, + 0x01db] %asi, %r30
iob_intr_2_407:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_407), 16, 16)) -> intp(2, 0, 19)
cpu_intr_2_375:
	setx	0x45001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf894c020  ! 4988: LDUHA_R	lduha	[%r19, %r0] 0x01, %r28
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983d98  ! 4990: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d98, %hpstate
	.word 0xfc142016  ! 4992: LDUH_I	lduh	[%r16 + 0x0016], %r30
	.word 0xf2546190  ! 4993: LDSH_I	ldsh	[%r17 + 0x0190], %r25
cpu_intr_2_376:
	setx	0x3011b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_408:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_408), 16, 16)) -> intp(2, 0, 2a)
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
cpu_intr_1_0:
	setx	0x1b020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda5c840  ! 5: FADDd	faddd	%f54, %f0, %f30
	.word 0xbba50920  ! 7: FMULs	fmuls	%f20, %f0, %f29
	.word 0xb9a50940  ! 11: FMULd	fmuld	%f20, %f0, %f28
iob_intr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_0), 16, 16)) -> intp(1, 0, 18)
cpu_intr_1_1:
	setx	0x1c0109, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_0:
	mov	0x37, %r14
	.word 0xf8f38400  ! 15: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_1), 16, 16)) -> intp(1, 0, a)
T1_asi_reg_rd_0:
	mov	0x1a, %r14
	.word 0xf2db8400  ! 17: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T1_asi_reg_wr_1:
	mov	0x21, %r14
	.word 0xf6f38e40  ! 18: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_2), 16, 16)) -> intp(1, 0, f)
T1_asi_reg_wr_2:
	mov	0x3c1, %r14
	.word 0xf8f384a0  ! 26: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T1_asi_reg_wr_3:
	mov	0xf, %r14
	.word 0xfef38e80  ! 27: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_1_2:
	setx	0x1d0134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba48820  ! 29: FADDs	fadds	%f18, %f0, %f29
iob_intr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_3), 16, 16)) -> intp(1, 0, 24)
iob_intr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_4), 16, 16)) -> intp(1, 0, 2a)
	.word 0xbba5c9c0  ! 38: FDIVd	fdivd	%f54, %f0, %f60
cpu_intr_1_3:
	setx	0x1c020b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_5), 16, 16)) -> intp(1, 0, 3)
	.word 0xb9350000  ! 44: SRL_R	srl 	%r20, %r0, %r28
	.word 0xbfa80c20  ! 48: FMOVRLZ	dis not found

iob_intr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_6), 16, 16)) -> intp(1, 0, 1d)
	.word 0x8d94e156  ! 53: WRPR_PSTATE_I	wrpr	%r19, 0x0156, %pstate
iob_intr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_7), 16, 16)) -> intp(1, 0, 28)
	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xb1a00560  ! 59: FSQRTq	fsqrt	
iob_intr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_8), 16, 16)) -> intp(1, 0, 1a)
cpu_intr_1_4:
	setx	0x1d0234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c8e0  ! 62: FSUBq	dis not found

	.word 0xbda5c940  ! 63: FMULd	fmuld	%f54, %f0, %f30
cpu_intr_1_5:
	setx	0x1d023b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_9), 16, 16)) -> intp(1, 0, 14)
T1_asi_reg_rd_1:
	mov	0x17, %r14
	.word 0xf6db84a0  ! 72: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb8a50000  ! 74: SUBcc_R	subcc 	%r20, %r0, %r28
	.word 0xb5a589e0  ! 79: FDIVq	dis not found

T1_asi_reg_rd_2:
	mov	0x11, %r14
	.word 0xf6db8e60  ! 80: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbe9c2164  ! 81: XORcc_I	xorcc 	%r16, 0x0164, %r31
cpu_intr_1_6:
	setx	0x1e0327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb08d6140  ! 84: ANDcc_I	andcc 	%r21, 0x0140, %r24
	.word 0xb3a80820  ! 87: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
iob_intr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_10), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb5a509a0  ! 91: FDIVs	fdivs	%f20, %f0, %f26
T1_asi_reg_wr_4:
	mov	0x3c2, %r14
	.word 0xfef38e40  ! 92: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_11), 16, 16)) -> intp(1, 0, 1)
iob_intr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_12), 16, 16)) -> intp(1, 0, 15)
	.word 0xb1aa0820  ! 102: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xbfa40860  ! 104: FADDq	dis not found

cpu_intr_1_7:
	setx	0x1c0211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0158000  ! 106: OR_R	or 	%r22, %r0, %r24
cpu_intr_1_8:
	setx	0x1d012f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_9:
	setx	0x1e0319, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_10:
	setx	0x1e013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda48860  ! 117: FADDq	dis not found

cpu_intr_1_11:
	setx	0x1c0122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda50940  ! 120: FMULd	fmuld	%f20, %f0, %f30
	.word 0xbe148000  ! 121: OR_R	or 	%r18, %r0, %r31
iob_intr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_13), 16, 16)) -> intp(1, 0, 1)
cpu_intr_1_12:
	setx	0x1d021f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_14), 16, 16)) -> intp(1, 0, 2b)
	.word 0xbba449a0  ! 127: FDIVs	fdivs	%f17, %f0, %f29
	.word 0xb1a80820  ! 129: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xbc94e0b1  ! 130: ORcc_I	orcc 	%r19, 0x00b1, %r30
T1_asi_reg_wr_5:
	mov	0x9, %r14
	.word 0xf4f38e80  ! 134: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbba48820  ! 136: FADDs	fadds	%f18, %f0, %f29
	.word 0xbfa00560  ! 137: FSQRTq	fsqrt	
	.word 0xbdab8820  ! 140: FMOVPOS	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbcc4210d  ! 149: ADDCcc_I	addccc 	%r16, 0x010d, %r30
cpu_intr_1_13:
	setx	0x1c011e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_15), 16, 16)) -> intp(1, 0, e)
	.word 0xb5a00540  ! 153: FSQRTd	fsqrt	
	.word 0xbfa448a0  ! 156: FSUBs	fsubs	%f17, %f0, %f31
T1_asi_reg_wr_6:
	mov	0x4, %r14
	.word 0xfcf38e80  ! 158: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_16), 16, 16)) -> intp(1, 0, a)
T1_asi_reg_rd_3:
	mov	0xc, %r14
	.word 0xfcdb8e40  ! 163: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbda588e0  ! 166: FSUBq	dis not found

	.word 0xb3ab0820  ! 169: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb5a40860  ! 170: FADDq	dis not found

	.word 0xbfa40940  ! 171: FMULd	fmuld	%f16, %f0, %f62
iob_intr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_17), 16, 16)) -> intp(1, 0, 1a)
	.word 0xbfa58940  ! 178: FMULd	fmuld	%f22, %f0, %f62
	.word 0xbba00520  ! 179: FSQRTs	fsqrt	
cpu_intr_1_14:
	setx	0x1f0004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda9c820  ! 188: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb9a00040  ! 192: FMOVd	fmovd	%f0, %f28
	.word 0xbba408c0  ! 193: FSUBd	fsubd	%f16, %f0, %f60
T1_asi_reg_wr_7:
	mov	0x3c0, %r14
	.word 0xf2f38e80  ! 194: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_18), 16, 16)) -> intp(1, 0, 8)
	.word 0xbf3db001  ! 197: SRAX_I	srax	%r22, 0x0001, %r31
cpu_intr_1_15:
	setx	0x1e0222, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_16:
	setx	0x1c002a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_17:
	setx	0x1d001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00540  ! 205: FSQRTd	fsqrt	
	.word 0xb1a54840  ! 206: FADDd	faddd	%f52, %f0, %f24
	.word 0xb1a5c9e0  ! 209: FDIVq	dis not found

iob_intr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_19), 16, 16)) -> intp(1, 0, 30)
iob_intr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_20), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_18:
	setx	0x1f0130, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_19:
	setx	0x1c030a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_21), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_22), 16, 16)) -> intp(1, 0, 21)
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xbcad0000  ! 225: ANDNcc_R	andncc 	%r20, %r0, %r30
	.word 0xb5a80820  ! 226: FMOVN	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_8:
	mov	0x1, %r14
	.word 0xf6f38e40  ! 227: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb7a00040  ! 229: FMOVd	fmovd	%f0, %f58
	.word 0xbe348000  ! 230: SUBC_R	orn 	%r18, %r0, %r31
cpu_intr_1_20:
	setx	0x1e0129, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_4:
	mov	0x3c8, %r14
	.word 0xf8db8400  ! 233: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_23), 16, 16)) -> intp(1, 0, 34)
	.word 0xba84216a  ! 236: ADDcc_I	addcc 	%r16, 0x016a, %r29
T1_asi_reg_wr_9:
	mov	0x1e, %r14
	.word 0xf2f384a0  ! 237: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_1_21:
	setx	0x1d012a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_24), 16, 16)) -> intp(1, 0, 24)
iob_intr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_25), 16, 16)) -> intp(1, 0, 28)
	.word 0xb5a9c820  ! 250: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb9a80820  ! 252: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
iob_intr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_26), 16, 16)) -> intp(1, 0, 23)
	.word 0xbba5c960  ! 255: FMULq	dis not found

	.word 0xb1ab0820  ! 256: FMOVGU	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_5:
	mov	0x3c3, %r14
	.word 0xf4db8e40  ! 257: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_1_22:
	setx	0x1c0310, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_10:
	mov	0x26, %r14
	.word 0xf8f38400  ! 266: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T1_asi_reg_rd_6:
	mov	0x3c2, %r14
	.word 0xf4db8e40  ! 275: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb3a94820  ! 278: FMOVCS	fmovs	%fcc1, %f0, %f25
iob_intr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_27), 16, 16)) -> intp(1, 0, a)
iob_intr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_28), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_wr_11:
	mov	0x21, %r14
	.word 0xf8f38400  ! 282: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_1_23:
	setx	0x1f013f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_29), 16, 16)) -> intp(1, 0, 10)
	.word 0xbda80420  ! 289: FMOVRZ	dis not found

	.word 0xb7a58960  ! 291: FMULq	dis not found

	.word 0xb7a81c20  ! 297: FMOVRGEZ	dis not found

	.word 0xbfa00560  ! 304: FSQRTq	fsqrt	
T1_asi_reg_wr_12:
	mov	0x14, %r14
	.word 0xf4f38e40  ! 309: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbba48820  ! 310: FADDs	fadds	%f18, %f0, %f29
T1_asi_reg_wr_13:
	mov	0x3c2, %r14
	.word 0xfcf38e80  ! 312: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	lda	[%r19 + %g0] 0xf0, %f2
T1_asi_reg_wr_14:
	mov	0x26, %r14
	.word 0xfaf384a0  ! 315: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb1ab4820  ! 317: FMOVCC	fmovs	%fcc1, %f0, %f24
	lda	[%r19 + %g0] 0xf0, %f2
iob_intr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_30), 16, 16)) -> intp(1, 0, f)
	.word 0xb3a80420  ! 327: FMOVRZ	dis not found

	.word 0xb5ab4820  ! 328: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb5a508e0  ! 329: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a58840  ! 339: FADDd	faddd	%f22, %f0, %f58
	.word 0xb1a588e0  ! 341: FSUBq	dis not found

iob_intr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_31), 16, 16)) -> intp(1, 0, 25)
iob_intr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_32), 16, 16)) -> intp(1, 0, 4)
T1_asi_reg_rd_7:
	mov	0x3c8, %r14
	.word 0xfadb8e40  ! 351: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb3a80820  ! 352: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xbfa84820  ! 354: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xb7a488a0  ! 362: FSUBs	fsubs	%f18, %f0, %f27
	.word 0xb1a80420  ! 367: FMOVRZ	dis not found

cpu_intr_1_24:
	setx	0x1f0301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00020  ! 372: FMOVs	fmovs	%f0, %f30
	.word 0xbba48840  ! 376: FADDd	faddd	%f18, %f0, %f60
	.word 0xb1a5c860  ! 377: FADDq	dis not found

iob_intr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_33), 16, 16)) -> intp(1, 0, 30)
T1_asi_reg_rd_8:
	mov	0x3c4, %r14
	.word 0xf2db8e60  ! 382: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbdaa0820  ! 383: FMOVA	fmovs	%fcc1, %f0, %f30
iob_intr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_34), 16, 16)) -> intp(1, 0, 26)
	.word 0xb2a5a1d5  ! 385: SUBcc_I	subcc 	%r22, 0x01d5, %r25
T1_asi_reg_rd_9:
	mov	0x3c3, %r14
	.word 0xf4db8e80  ! 386: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb3a00520  ! 394: FSQRTs	fsqrt	
	.word 0xb4152157  ! 395: OR_I	or 	%r20, 0x0157, %r26
	lda	[%r18 + %g0] 0xf0, %f2
	.word 0xbda448c0  ! 400: FSUBd	fsubd	%f48, %f0, %f30
iob_intr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_35), 16, 16)) -> intp(1, 0, 28)
	.word 0xbda509a0  ! 402: FDIVs	fdivs	%f20, %f0, %f30
	.word 0xb9a81c20  ! 405: FMOVRGEZ	dis not found

T1_asi_reg_wr_15:
	mov	0x3c4, %r14
	.word 0xf0f38400  ! 407: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbda40840  ! 409: FADDd	faddd	%f16, %f0, %f30
T1_asi_reg_rd_10:
	mov	0x7, %r14
	.word 0xf8db84a0  ! 410: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbbaa0820  ! 411: FMOVA	fmovs	%fcc1, %f0, %f29
iob_intr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_36), 16, 16)) -> intp(1, 0, 30)
T1_asi_reg_rd_11:
	mov	0x3c8, %r14
	.word 0xf0db89e0  ! 413: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb3a80c20  ! 415: FMOVRLZ	dis not found

cpu_intr_1_25:
	setx	0x1f0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2444000  ! 417: ADDC_R	addc 	%r17, %r0, %r25
cpu_intr_1_26:
	setx	0x1f020e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_37), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb9a50840  ! 420: FADDd	faddd	%f20, %f0, %f28
	.word 0xbfa449e0  ! 421: FDIVq	dis not found

cpu_intr_1_27:
	setx	0x1e0117, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_28:
	setx	0x1d003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a4c9c0  ! 429: FDIVd	fdivd	%f50, %f0, %f28
iob_intr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_38), 16, 16)) -> intp(1, 0, 1b)
cpu_intr_1_29:
	setx	0x1d0206, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_12:
	mov	0x3c6, %r14
	.word 0xf4db84a0  ! 435: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbac42106  ! 438: ADDCcc_I	addccc 	%r16, 0x0106, %r29
cpu_intr_1_30:
	setx	0x1c0028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb035e1c6  ! 443: ORN_I	orn 	%r23, 0x01c6, %r24
T1_asi_reg_rd_13:
	mov	0x2e, %r14
	.word 0xf8db8e60  ! 444: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb9a80420  ! 448: FMOVRZ	dis not found

iob_intr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_39), 16, 16)) -> intp(1, 0, 9)
cpu_intr_1_31:
	setx	0x1d0216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00520  ! 455: FSQRTs	fsqrt	
T1_asi_reg_wr_16:
	mov	0x21, %r14
	.word 0xfaf38e40  ! 456: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb9a84820  ! 459: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xbf35d000  ! 461: SRLX_R	srlx	%r23, %r0, %r31
cpu_intr_1_32:
	setx	0x1f011a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_33:
	setx	0x1e021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xa1902000  ! 464: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xb1a448a0  ! 466: FSUBs	fsubs	%f17, %f0, %f24
iob_intr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_40), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_wr_17:
	mov	0x3c7, %r14
	.word 0xfef384a0  ! 469: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb5a00540  ! 471: FSQRTd	fsqrt	
cpu_intr_1_34:
	setx	0x1e0016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a5c9a0  ! 474: FDIVs	fdivs	%f23, %f0, %f26
T1_asi_reg_rd_14:
	mov	0x5, %r14
	.word 0xf0db8e60  ! 475: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb7a4c8a0  ! 477: FSUBs	fsubs	%f19, %f0, %f27
	.word 0xbda44820  ! 478: FADDs	fadds	%f17, %f0, %f30
	.word 0xbdab8820  ! 480: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb9a00020  ! 482: FMOVs	fmovs	%f0, %f28
T1_asi_reg_rd_15:
	mov	0x33, %r14
	.word 0xfadb84a0  ! 483: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb3a4c840  ! 487: FADDd	faddd	%f50, %f0, %f56
cpu_intr_1_35:
	setx	0x23023a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_18:
	mov	0x22, %r14
	.word 0xfcf38e80  ! 489: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_1_36:
	setx	0x210321, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_37:
	setx	0x200302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00520  ! 493: FSQRTs	fsqrt	
	.word 0xbdabc820  ! 495: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xb1a00520  ! 496: FSQRTs	fsqrt	
	.word 0xb5a58860  ! 500: FADDq	dis not found

	.word 0xbaa50000  ! 501: SUBcc_R	subcc 	%r20, %r0, %r29
cpu_intr_1_38:
	setx	0x21023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfab0820  ! 505: FMOVGU	fmovs	%fcc1, %f0, %f31
iob_intr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_41), 16, 16)) -> intp(1, 0, 22)
	.word 0xb5abc820  ! 509: FMOVVC	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_16:
	mov	0x19, %r14
	.word 0xfedb89e0  ! 510: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_42), 16, 16)) -> intp(1, 0, 20)
	.word 0xb3a88820  ! 515: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xbdaac820  ! 517: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb7a509a0  ! 519: FDIVs	fdivs	%f20, %f0, %f27
	.word 0xbfa00040  ! 520: FMOVd	fmovd	%f0, %f62
iob_intr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_43), 16, 16)) -> intp(1, 0, 13)
cpu_intr_1_39:
	setx	0x230032, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_44), 16, 16)) -> intp(1, 0, 24)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb20dc000  ! 532: AND_R	and 	%r23, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_45), 16, 16)) -> intp(1, 0, 3a)
cpu_intr_1_40:
	setx	0x210236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa98820  ! 541: FMOVNEG	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_17:
	mov	0x1a, %r14
	.word 0xfedb8400  ! 542: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb1aa8820  ! 543: FMOVG	fmovs	%fcc1, %f0, %f24
cpu_intr_1_41:
	setx	0x22033d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_46), 16, 16)) -> intp(1, 0, 25)
	.word 0xb5a54920  ! 552: FMULs	fmuls	%f21, %f0, %f26
	.word 0xb9a408e0  ! 556: FSUBq	dis not found

T1_asi_reg_rd_18:
	mov	0x6, %r14
	.word 0xfadb8e60  ! 563: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb1a94820  ! 566: FMOVCS	fmovs	%fcc1, %f0, %f24
iob_intr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_47), 16, 16)) -> intp(1, 0, 9)
T1_asi_reg_rd_19:
	mov	0x4, %r14
	.word 0xf4db8e60  ! 575: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_1_42:
	setx	0x21033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab8820  ! 577: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb9a80820  ! 578: FMOVN	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_20:
	mov	0x15, %r14
	.word 0xf6db8e40  ! 580: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xba450000  ! 583: ADDC_R	addc 	%r20, %r0, %r29
T1_asi_reg_wr_19:
	mov	0x38, %r14
	.word 0xfaf389e0  ! 584: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb1a40960  ! 587: FMULq	dis not found

T1_asi_reg_wr_20:
	mov	0x11, %r14
	.word 0xfef38400  ! 588: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbfa98820  ! 590: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb88ca005  ! 592: ANDcc_I	andcc 	%r18, 0x0005, %r28
	.word 0xb61c4000  ! 594: XOR_R	xor 	%r17, %r0, %r27
	.word 0xb9a80c20  ! 595: FMOVRLZ	dis not found

cpu_intr_1_43:
	setx	0x210039, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_21:
	mov	0x25, %r14
	.word 0xfedb84a0  ! 598: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbda80820  ! 600: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xb9a00540  ! 601: FSQRTd	fsqrt	
T1_asi_reg_wr_21:
	mov	0x4, %r14
	.word 0xf2f38e40  ! 603: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_48), 16, 16)) -> intp(1, 0, 18)
	.word 0xb3a5c840  ! 607: FADDd	faddd	%f54, %f0, %f56
T1_asi_reg_wr_22:
	mov	0x3c0, %r14
	.word 0xf2f389e0  ! 609: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbaa4820  ! 621: FMOVNE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_44:
	setx	0x210329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba488c0  ! 625: FSUBd	fsubd	%f18, %f0, %f60
	.word 0xb1a00040  ! 627: FMOVd	fmovd	%f0, %f24
T1_asi_reg_wr_23:
	mov	0x37, %r14
	.word 0xf0f38e40  ! 628: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_1_45:
	setx	0x220035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_46:
	setx	0x210115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a5c9a0  ! 632: FDIVs	fdivs	%f23, %f0, %f24
	.word 0xbda81820  ! 635: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb5a00540  ! 637: FSQRTd	fsqrt	
T1_asi_reg_wr_24:
	mov	0x2d, %r14
	.word 0xf2f389e0  ! 638: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbfa98820  ! 639: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb5a80820  ! 641: FMOVN	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_25:
	mov	0x2c, %r14
	.word 0xf6f38e40  ! 643: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_49), 16, 16)) -> intp(1, 0, e)
	.word 0xba456040  ! 646: ADDC_I	addc 	%r21, 0x0040, %r29
	.word 0xb5a5c820  ! 647: FADDs	fadds	%f23, %f0, %f26
cpu_intr_1_47:
	setx	0x210320, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_26:
	mov	0x3c4, %r14
	.word 0xfcf384a0  ! 650: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T1_asi_reg_wr_27:
	mov	0xa, %r14
	.word 0xfcf38e40  ! 652: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T1_asi_reg_rd_22:
	mov	0x27, %r14
	.word 0xf0db8e40  ! 654: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_wr_28:
	mov	0x4, %r14
	.word 0xfef38e40  ! 655: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_50), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb7a9c820  ! 657: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb224c000  ! 659: SUB_R	sub 	%r19, %r0, %r25
iob_intr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_51), 16, 16)) -> intp(1, 0, 1b)
cpu_intr_1_48:
	setx	0x21030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb82c60af  ! 662: ANDN_I	andn 	%r17, 0x00af, %r28
T1_asi_reg_rd_23:
	mov	0x3c8, %r14
	.word 0xfcdb8e40  ! 664: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbba00560  ! 665: FSQRTq	fsqrt	
	.word 0xb9aac820  ! 668: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xbbab0820  ! 669: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb6846163  ! 671: ADDcc_I	addcc 	%r17, 0x0163, %r27
iob_intr_1_52:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_52), 16, 16)) -> intp(1, 0, 33)
iob_intr_1_53:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_53), 16, 16)) -> intp(1, 0, 27)
	.word 0xb5a00520  ! 675: FSQRTs	fsqrt	
cpu_intr_1_49:
	setx	0x23003e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_50:
	setx	0x220238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a81420  ! 678: FMOVRNZ	dis not found

iob_intr_1_54:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_54), 16, 16)) -> intp(1, 0, 23)
	.word 0xb5a00540  ! 681: FSQRTd	fsqrt	
	.word 0xb9a489a0  ! 683: FDIVs	fdivs	%f18, %f0, %f28
cpu_intr_1_51:
	setx	0x23012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa88820  ! 686: FMOVLE	fmovs	%fcc1, %f0, %f31
iob_intr_1_55:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_55), 16, 16)) -> intp(1, 0, 1a)
	.word 0xbb643801  ! 688: MOVcc_I	<illegal instruction>
T1_asi_reg_rd_24:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 691: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_wr_29:
	mov	0x3c1, %r14
	.word 0xfcf38e40  ! 692: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb3a409e0  ! 693: FDIVq	dis not found

iob_intr_1_56:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_56), 16, 16)) -> intp(1, 0, 15)
T1_asi_reg_wr_30:
	mov	0xa, %r14
	.word 0xfcf38e60  ! 696: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb3a80820  ! 698: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
iob_intr_1_57:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_57), 16, 16)) -> intp(1, 0, 2f)
	.word 0xbbaac820  ! 701: FMOVGE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_52:
	setx	0x21013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3d3001  ! 703: SRAX_I	srax	%r20, 0x0001, %r29
cpu_intr_1_53:
	setx	0x22003c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_25:
	mov	0x3c7, %r14
	.word 0xfcdb84a0  ! 707: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_1_54:
	setx	0x23021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_58:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_58), 16, 16)) -> intp(1, 0, e)
iob_intr_1_59:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_59), 16, 16)) -> intp(1, 0, c)
	.word 0xbfa54940  ! 712: FMULd	fmuld	%f52, %f0, %f62
	.word 0xb1a98820  ! 713: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb7a94820  ! 715: FMOVCS	fmovs	%fcc1, %f0, %f27
iob_intr_1_60:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_60), 16, 16)) -> intp(1, 0, e)
cpu_intr_1_55:
	setx	0x23003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80820  ! 725: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_31:
	mov	0x2d, %r14
	.word 0xfaf38e40  ! 726: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_1_61:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_61), 16, 16)) -> intp(1, 0, 4)
iob_intr_1_62:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_62), 16, 16)) -> intp(1, 0, 2)
	.word 0xb88cc000  ! 735: ANDcc_R	andcc 	%r19, %r0, %r28
	.word 0xb6bd4000  ! 736: XNORcc_R	xnorcc 	%r21, %r0, %r27
T1_asi_reg_wr_32:
	mov	0x9, %r14
	.word 0xfef384a0  ! 737: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb5a9c820  ! 738: FMOVVS	fmovs	%fcc1, %f0, %f26
iob_intr_1_63:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_63), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_56:
	setx	0x210308, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_57:
	setx	0x20013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8f902002  ! 747: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xb3a4c9c0  ! 749: FDIVd	fdivd	%f50, %f0, %f56
iob_intr_1_64:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_64), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb1a50820  ! 751: FADDs	fadds	%f20, %f0, %f24
	.word 0xb5ab4820  ! 757: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb1a548a0  ! 760: FSUBs	fsubs	%f21, %f0, %f24
cpu_intr_1_58:
	setx	0x200109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaa0820  ! 762: FMOVA	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_33:
	mov	0x3c8, %r14
	.word 0xf8f38e80  ! 763: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb3ab4820  ! 764: FMOVCC	fmovs	%fcc1, %f0, %f25
cpu_intr_1_59:
	setx	0x210009, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_34:
	mov	0x2, %r14
	.word 0xfef389e0  ! 766: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbfa8c820  ! 768: FMOVL	fmovs	%fcc1, %f0, %f31
cpu_intr_1_60:
	setx	0x210309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb23c2018  ! 772: XNOR_I	xnor 	%r16, 0x0018, %r25
T1_asi_reg_rd_26:
	mov	0x3c0, %r14
	.word 0xf2db8e40  ! 774: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb5a5c8e0  ! 775: FSUBq	dis not found

	.word 0xb3a488c0  ! 777: FSUBd	fsubd	%f18, %f0, %f56
iob_intr_1_65:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_65), 16, 16)) -> intp(1, 0, 29)
cpu_intr_1_61:
	setx	0x20011f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_35:
	mov	0x1e, %r14
	.word 0xf0f389e0  ! 784: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb9a588c0  ! 789: FSUBd	fsubd	%f22, %f0, %f28
iob_intr_1_66:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_66), 16, 16)) -> intp(1, 0, 29)
cpu_intr_1_62:
	setx	0x22002d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_67:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_67), 16, 16)) -> intp(1, 0, 38)
	.word 0xb7a90820  ! 796: FMOVLEU	fmovs	%fcc1, %f0, %f27
cpu_intr_1_63:
	setx	0x230319, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_27:
	mov	0x19, %r14
	.word 0xf0db8400  ! 799: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_wr_36:
	mov	0x32, %r14
	.word 0xfcf38e80  ! 800: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb7a54840  ! 801: FADDd	faddd	%f52, %f0, %f58
	.word 0xbe24a091  ! 804: SUB_I	sub 	%r18, 0x0091, %r31
cpu_intr_1_64:
	setx	0x220015, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_37:
	mov	0x1, %r14
	.word 0xf6f38e80  ! 808: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T1_asi_reg_wr_38:
	mov	0x5, %r14
	.word 0xf2f384a0  ! 810: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T1_asi_reg_wr_39:
	mov	0xd, %r14
	.word 0xfef384a0  ! 812: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_1_65:
	setx	0x20013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r18 + %g0] 0xf0, %f2
T1_asi_reg_wr_40:
	mov	0x3c2, %r14
	.word 0xfaf38400  ! 815: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_1_68:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_68), 16, 16)) -> intp(1, 0, e)
	.word 0xbfa88820  ! 823: FMOVLE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_41:
	mov	0x1b, %r14
	.word 0xfcf38e40  ! 827: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbfab0820  ! 829: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb1a00560  ! 830: FSQRTq	fsqrt	
T1_asi_reg_wr_42:
	mov	0x3c7, %r14
	.word 0xf4f384a0  ! 835: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_1_66:
	setx	0x21011f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_69:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_69), 16, 16)) -> intp(1, 0, 11)
cpu_intr_1_67:
	setx	0x230119, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_43:
	mov	0x2b, %r14
	.word 0xf6f38e60  ! 840: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb3a509a0  ! 841: FDIVs	fdivs	%f20, %f0, %f25
	.word 0xb5a00040  ! 842: FMOVd	fmovd	%f0, %f26
T1_asi_reg_wr_44:
	mov	0x14, %r14
	.word 0xf4f38400  ! 843: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T1_asi_reg_wr_45:
	mov	0x16, %r14
	.word 0xf4f38e60  ! 849: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb1a00540  ! 855: FSQRTd	fsqrt	
	.word 0xbfa5c9c0  ! 856: FDIVd	fdivd	%f54, %f0, %f62
	.word 0xbda44840  ! 858: FADDd	faddd	%f48, %f0, %f30
	.word 0xb63521de  ! 861: SUBC_I	orn 	%r20, 0x01de, %r27
cpu_intr_1_68:
	setx	0x20012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfa00520  ! 868: FSQRTs	fsqrt	
cpu_intr_1_69:
	setx	0x200315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1643801  ! 878: MOVcc_I	<illegal instruction>
cpu_intr_1_70:
	setx	0x210138, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_71:
	setx	0x220035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_72:
	setx	0x220139, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_70:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_70), 16, 16)) -> intp(1, 0, 30)
iob_intr_1_71:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_71), 16, 16)) -> intp(1, 0, 35)
	.word 0xbda40940  ! 890: FMULd	fmuld	%f16, %f0, %f30
	.word 0xb3641800  ! 892: MOVcc_R	<illegal instruction>
T1_asi_reg_wr_46:
	mov	0x3c8, %r14
	.word 0xfef38400  ! 893: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_1_73:
	setx	0x200215, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_47:
	mov	0x3c6, %r14
	.word 0xf8f389e0  ! 896: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb7a88820  ! 897: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb1a408c0  ! 898: FSUBd	fsubd	%f16, %f0, %f24
T1_asi_reg_rd_28:
	mov	0x4, %r14
	.word 0xf6db8400  ! 899: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_1_74:
	setx	0x210315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf358000  ! 903: SRL_R	srl 	%r22, %r0, %r31
	.word 0xbfa00040  ! 905: FMOVd	fmovd	%f0, %f62
	.word 0xb0bdc000  ! 915: XNORcc_R	xnorcc 	%r23, %r0, %r24
	.word 0xbbaa4820  ! 916: FMOVNE	fmovs	%fcc1, %f0, %f29
iob_intr_1_72:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_72), 16, 16)) -> intp(1, 0, 38)
T1_asi_reg_wr_48:
	mov	0x0, %r14
	.word 0xfaf38e40  ! 920: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb5a40940  ! 921: FMULd	fmuld	%f16, %f0, %f26
	.word 0xb7a00040  ! 924: FMOVd	fmovd	%f0, %f58
T1_asi_reg_wr_49:
	mov	0x21, %r14
	.word 0xfaf384a0  ! 926: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_1_75:
	setx	0x27001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r18 + %g0] 0xf0, %f2
iob_intr_1_73:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_73), 16, 16)) -> intp(1, 0, 15)
	.word 0xbfa00040  ! 933: FMOVd	fmovd	%f0, %f62
	.word 0xb5ab8820  ! 935: FMOVPOS	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_29:
	mov	0xf, %r14
	.word 0xf6db8e80  ! 936: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_1_76:
	setx	0x26031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_74:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_74), 16, 16)) -> intp(1, 0, 2b)
T1_asi_reg_rd_30:
	mov	0x33, %r14
	.word 0xf0db89e0  ! 939: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb9a00020  ! 940: FMOVs	fmovs	%f0, %f28
iob_intr_1_75:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_75), 16, 16)) -> intp(1, 0, 13)
	.word 0xb0b40000  ! 947: ORNcc_R	orncc 	%r16, %r0, %r24
T1_asi_reg_rd_31:
	mov	0x2e, %r14
	.word 0xf8db8e40  ! 949: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_wr_50:
	mov	0x1c, %r14
	.word 0xfaf38e80  ! 953: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_77:
	setx	0x240025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72d5000  ! 964: SLLX_R	sllx	%r21, %r0, %r27
iob_intr_1_76:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_76), 16, 16)) -> intp(1, 0, 1a)
	.word 0xbbaa0820  ! 969: FMOVA	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_51:
	mov	0xb, %r14
	.word 0xfaf38e60  ! 970: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb9a448a0  ! 972: FSUBs	fsubs	%f17, %f0, %f28
	.word 0xbfa80c20  ! 973: FMOVRLZ	dis not found

T1_asi_reg_wr_52:
	mov	0x38, %r14
	.word 0xfcf38400  ! 976: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbc9de15a  ! 977: XORcc_I	xorcc 	%r23, 0x015a, %r30
cpu_intr_1_78:
	setx	0x27032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c820  ! 980: FADDs	fadds	%f19, %f0, %f27
iob_intr_1_77:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_77), 16, 16)) -> intp(1, 0, 3f)
iob_intr_1_78:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_78), 16, 16)) -> intp(1, 0, 29)
	.word 0xb3a508a0  ! 987: FSUBs	fsubs	%f20, %f0, %f25
	.word 0xb9a00040  ! 988: FMOVd	fmovd	%f0, %f28
	.word 0xb5a00020  ! 990: FMOVs	fmovs	%f0, %f26
	.word 0xb13cf001  ! 993: SRAX_I	srax	%r19, 0x0001, %r24
	.word 0xb7a548c0  ! 994: FSUBd	fsubd	%f52, %f0, %f58
	.word 0xb3a81820  ! 997: FMOVRGZ	fmovs	%fcc3, %f0, %f25
iob_intr_1_79:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_79), 16, 16)) -> intp(1, 0, 37)
iob_intr_1_80:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_80), 16, 16)) -> intp(1, 0, 36)
iob_intr_1_81:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_81), 16, 16)) -> intp(1, 0, 27)
iob_intr_1_82:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_82), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb5a8c820  ! 1004: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xbba00540  ! 1005: FSQRTd	fsqrt	
	.word 0xb1a00020  ! 1006: FMOVs	fmovs	%f0, %f24
	.word 0xbdabc820  ! 1007: FMOVVC	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_32:
	mov	0x5, %r14
	.word 0xf4db84a0  ! 1009: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb7a80c20  ! 1014: FMOVRLZ	dis not found

iob_intr_1_83:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_83), 16, 16)) -> intp(1, 0, 20)
	.word 0xb3a5c820  ! 1016: FADDs	fadds	%f23, %f0, %f25
	.word 0xb4152051  ! 1018: OR_I	or 	%r20, 0x0051, %r26
	.word 0xbe15e0b0  ! 1019: OR_I	or 	%r23, 0x00b0, %r31
	.word 0xb1aac820  ! 1021: FMOVGE	fmovs	%fcc1, %f0, %f24
iob_intr_1_84:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_84), 16, 16)) -> intp(1, 0, 27)
cpu_intr_1_79:
	setx	0x240026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda588e0  ! 1026: FSUBq	dis not found

T1_asi_reg_rd_33:
	mov	0x3c4, %r14
	.word 0xfedb8e60  ! 1028: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_1_80:
	setx	0x260102, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_85:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_85), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_81:
	setx	0x270104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1ab8820  ! 1037: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xbe3420e2  ! 1038: SUBC_I	orn 	%r16, 0x00e2, %r31
	.word 0xb7a00040  ! 1040: FMOVd	fmovd	%f0, %f58
cpu_intr_1_82:
	setx	0x240023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe35e1b1  ! 1054: ORN_I	orn 	%r23, 0x01b1, %r31
	.word 0xb5a44920  ! 1055: FMULs	fmuls	%f17, %f0, %f26
iob_intr_1_86:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_86), 16, 16)) -> intp(1, 0, 5)
	.word 0xbfa00540  ! 1061: FSQRTd	fsqrt	
iob_intr_1_87:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_87), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_wr_53:
	mov	0x18, %r14
	.word 0xfcf38e40  ! 1070: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T1_asi_reg_wr_54:
	mov	0x0, %r14
	.word 0xf0f38e80  ! 1072: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_1_88:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_88), 16, 16)) -> intp(1, 0, 27)
cpu_intr_1_83:
	setx	0x260229, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_89:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_89), 16, 16)) -> intp(1, 0, 16)
	.word 0xb7a00040  ! 1082: FMOVd	fmovd	%f0, %f58
T1_asi_reg_wr_55:
	mov	0x33, %r14
	.word 0xf0f38e40  ! 1083: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb534f001  ! 1084: SRLX_I	srlx	%r19, 0x0001, %r26
	.word 0xbfa80820  ! 1085: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb7a00040  ! 1086: FMOVd	fmovd	%f0, %f58
T1_asi_reg_rd_34:
	mov	0xd, %r14
	.word 0xfadb8e40  ! 1087: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_wr_56:
	mov	0x8, %r14
	.word 0xfaf38e80  ! 1089: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_1_90:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_90), 16, 16)) -> intp(1, 0, 2e)
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xb804c000  ! 1094: ADD_R	add 	%r19, %r0, %r28
cpu_intr_1_84:
	setx	0x250329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00540  ! 1098: FSQRTd	fsqrt	
	.word 0xb1a88820  ! 1099: FMOVLE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_35:
	mov	0x9, %r14
	.word 0xf4db8e80  ! 1104: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_1_91:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_91), 16, 16)) -> intp(1, 0, 3d)
iob_intr_1_92:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_92), 16, 16)) -> intp(1, 0, 14)
	.word 0xb9a00040  ! 1110: FMOVd	fmovd	%f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda54960  ! 1115: FMULq	dis not found

	.word 0xbfa80820  ! 1117: FMOVN	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_57:
	mov	0x3c3, %r14
	.word 0xf2f389e0  ! 1119: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_1_85:
	setx	0x26010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00020  ! 1123: FMOVs	fmovs	%f0, %f31
	.word 0xb7a81820  ! 1124: FMOVRGZ	fmovs	%fcc3, %f0, %f27
iob_intr_1_93:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_93), 16, 16)) -> intp(1, 0, 34)
	.word 0xb5a4c8e0  ! 1127: FSUBq	dis not found

iob_intr_1_94:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_94), 16, 16)) -> intp(1, 0, 1e)
T1_asi_reg_wr_58:
	mov	0x3c1, %r14
	.word 0xfaf38400  ! 1132: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb21d0000  ! 1133: XOR_R	xor 	%r20, %r0, %r25
	.word 0xb62c8000  ! 1135: ANDN_R	andn 	%r18, %r0, %r27
	.word 0xb9a4c960  ! 1136: FMULq	dis not found

cpu_intr_1_86:
	setx	0x240036, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_87:
	setx	0x270117, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_88:
	setx	0x24001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a8c820  ! 1143: FMOVL	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_36:
	mov	0x37, %r14
	.word 0xf4db8e40  ! 1145: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbba4c8c0  ! 1148: FSUBd	fsubd	%f50, %f0, %f60
iob_intr_1_95:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_95), 16, 16)) -> intp(1, 0, 6)
	.word 0xbba00020  ! 1150: FMOVs	fmovs	%f0, %f29
cpu_intr_1_89:
	setx	0x24020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00520  ! 1154: FSQRTs	fsqrt	
cpu_intr_1_90:
	setx	0x250130, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xb4244000  ! 1158: SUB_R	sub 	%r17, %r0, %r26
iob_intr_1_96:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_96), 16, 16)) -> intp(1, 0, 18)
	.word 0xb5a509e0  ! 1161: FDIVq	dis not found

	.word 0xb3a58960  ! 1163: FMULq	dis not found

iob_intr_1_97:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_97), 16, 16)) -> intp(1, 0, 16)
iob_intr_1_98:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_98), 16, 16)) -> intp(1, 0, 36)
T1_asi_reg_wr_59:
	mov	0x3c1, %r14
	.word 0xfcf38e60  ! 1169: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T1_asi_reg_rd_37:
	mov	0x28, %r14
	.word 0xf0db84a0  ! 1172: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb2acc000  ! 1177: ANDNcc_R	andncc 	%r19, %r0, %r25
T1_asi_reg_wr_60:
	mov	0x18, %r14
	.word 0xfef38400  ! 1178: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbba44940  ! 1179: FMULd	fmuld	%f48, %f0, %f60
T1_asi_reg_rd_38:
	mov	0xb, %r14
	.word 0xfcdb8e40  ! 1181: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb9aac820  ! 1182: FMOVGE	fmovs	%fcc1, %f0, %f28
iob_intr_1_99:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_99), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb5a94820  ! 1188: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb8b4e1ba  ! 1189: SUBCcc_I	orncc 	%r19, 0x01ba, %r28
	.word 0xbfa4c9e0  ! 1192: FDIVq	dis not found

iob_intr_1_100:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_100), 16, 16)) -> intp(1, 0, 3c)
iob_intr_1_101:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_101), 16, 16)) -> intp(1, 0, 25)
cpu_intr_1_91:
	setx	0x27000b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_92:
	setx	0x260328, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_93:
	setx	0x270311, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_39:
	mov	0x3c6, %r14
	.word 0xf2db84a0  ! 1201: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbba5c940  ! 1205: FMULd	fmuld	%f54, %f0, %f60
	.word 0xbb7d2401  ! 1206: MOVR_I	movre	%r20, 0x1, %r29
cpu_intr_1_94:
	setx	0x25020a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_95:
	setx	0x240034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd358000  ! 1213: SRL_R	srl 	%r22, %r0, %r30
cpu_intr_1_96:
	setx	0x240111, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_102:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_102), 16, 16)) -> intp(1, 0, 9)
cpu_intr_1_97:
	setx	0x270028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80820  ! 1225: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
cpu_intr_1_98:
	setx	0x270322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 1228: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
iob_intr_1_103:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_103), 16, 16)) -> intp(1, 0, 1f)
	lda	[%r19 + %g0] 0xf0, %f2
cpu_intr_1_99:
	setx	0x26023e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_104:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_104), 16, 16)) -> intp(1, 0, 2d)
cpu_intr_1_100:
	setx	0x270021, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_40:
	mov	0x2f, %r14
	.word 0xf8db8400  ! 1235: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbda44820  ! 1236: FADDs	fadds	%f17, %f0, %f30
	.word 0xb294a09b  ! 1240: ORcc_I	orcc 	%r18, 0x009b, %r25
iob_intr_1_105:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_105), 16, 16)) -> intp(1, 0, 5)
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xb3a449e0  ! 1246: FDIVq	dis not found

	.word 0xb5ab4820  ! 1250: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb7a80820  ! 1251: FMOVN	fmovs	%fcc1, %f0, %f27
cpu_intr_1_101:
	setx	0x24001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a5c8c0  ! 1257: FSUBd	fsubd	%f54, %f0, %f26
	.word 0xb3a50940  ! 1259: FMULd	fmuld	%f20, %f0, %f56
	.word 0xbda80820  ! 1263: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_61:
	mov	0x3c7, %r14
	.word 0xfef384a0  ! 1264: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb9a54820  ! 1265: FADDs	fadds	%f21, %f0, %f28
T1_asi_reg_wr_62:
	mov	0x18, %r14
	.word 0xf2f38e40  ! 1270: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_1_102:
	setx	0x260338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba98820  ! 1273: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xb2ad21ac  ! 1275: ANDNcc_I	andncc 	%r20, 0x01ac, %r25
T1_asi_reg_rd_41:
	mov	0x3c3, %r14
	.word 0xf2db8e40  ! 1278: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbe1cc000  ! 1280: XOR_R	xor 	%r19, %r0, %r31
	.word 0xb9a50960  ! 1284: FMULq	dis not found

cpu_intr_1_103:
	setx	0x25003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a48840  ! 1290: FADDd	faddd	%f18, %f0, %f24
	.word 0xb5a50940  ! 1293: FMULd	fmuld	%f20, %f0, %f26
iob_intr_1_106:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_106), 16, 16)) -> intp(1, 0, 16)
	.word 0xb5aa0820  ! 1297: FMOVA	fmovs	%fcc1, %f0, %f26
iob_intr_1_107:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_107), 16, 16)) -> intp(1, 0, 15)
	.word 0xbda80420  ! 1303: FMOVRZ	dis not found

	.word 0xb5a00040  ! 1305: FMOVd	fmovd	%f0, %f26
cpu_intr_1_104:
	setx	0x260325, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_108:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_108), 16, 16)) -> intp(1, 0, 15)
	.word 0xb1a489a0  ! 1313: FDIVs	fdivs	%f18, %f0, %f24
T1_asi_reg_rd_42:
	mov	0x15, %r14
	.word 0xfadb84a0  ! 1317: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbda489a0  ! 1319: FDIVs	fdivs	%f18, %f0, %f30
	.word 0xbda84820  ! 1322: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xb7a54840  ! 1323: FADDd	faddd	%f52, %f0, %f58
	.word 0xb80c20a9  ! 1325: AND_I	and 	%r16, 0x00a9, %r28
cpu_intr_1_105:
	setx	0x25030f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_43:
	mov	0x1f, %r14
	.word 0xfedb8e80  ! 1327: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb3a44960  ! 1328: FMULq	dis not found

T1_asi_reg_rd_44:
	mov	0x3c6, %r14
	.word 0xfedb84a0  ! 1333: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	lda	[%r19 + %g0] 0xf0, %f2
T1_asi_reg_wr_63:
	mov	0x11, %r14
	.word 0xfef384a0  ! 1337: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_1_106:
	setx	0x27000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba81420  ! 1343: FMOVRNZ	dis not found

	.word 0xb5ab4820  ! 1344: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xbba448e0  ! 1346: FSUBq	dis not found

iob_intr_1_109:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_109), 16, 16)) -> intp(1, 0, 34)
	.word 0xb3a80c20  ! 1348: FMOVRLZ	dis not found

iob_intr_1_110:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_110), 16, 16)) -> intp(1, 0, 20)
cpu_intr_1_107:
	setx	0x270015, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r19 + %g0] 0xf0, %f2
cpu_intr_1_108:
	setx	0x27013d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_109:
	setx	0x240218, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_64:
	mov	0x3c1, %r14
	.word 0xfaf38400  ! 1361: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_1_111:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_111), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb73ce001  ! 1364: SRA_I	sra 	%r19, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_45:
	mov	0x2, %r14
	.word 0xf0db84a0  ! 1367: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T1_asi_reg_wr_65:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 1370: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbfa54820  ! 1371: FADDs	fadds	%f21, %f0, %f31
cpu_intr_1_110:
	setx	0x250113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00520  ! 1373: FSQRTs	fsqrt	
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xbfa98820  ! 1379: FMOVNEG	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a98820  ! 1382: FMOVNEG	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_46:
	mov	0xf, %r14
	.word 0xf6db8e40  ! 1383: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_66:
	mov	0x1b, %r14
	.word 0xf4f38400  ! 1386: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_1_111:
	setx	0x250238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb48d8000  ! 1388: ANDcc_R	andcc 	%r22, %r0, %r26
T1_asi_reg_rd_47:
	mov	0x1c, %r14
	.word 0xfcdb8400  ! 1389: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_1_112:
	setx	0x24023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc94c000  ! 1393: ORcc_R	orcc 	%r19, %r0, %r30
cpu_intr_1_113:
	setx	0x24012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa8c820  ! 1398: FMOVL	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_48:
	mov	0x6, %r14
	.word 0xfcdb8e60  ! 1402: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_112:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_112), 16, 16)) -> intp(1, 0, 1f)
T1_asi_reg_rd_49:
	mov	0x3c1, %r14
	.word 0xfcdb8e80  ! 1409: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_1_113:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_113), 16, 16)) -> intp(1, 0, 15)
T1_asi_reg_rd_50:
	mov	0x32, %r14
	.word 0xfedb84a0  ! 1416: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb7a80420  ! 1417: FMOVRZ	dis not found

	.word 0xbfa4c940  ! 1420: FMULd	fmuld	%f50, %f0, %f62
cpu_intr_1_114:
	setx	0x2b0214, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_114:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_114), 16, 16)) -> intp(1, 0, 36)
	.word 0xbda50840  ! 1433: FADDd	faddd	%f20, %f0, %f30
iob_intr_1_115:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_115), 16, 16)) -> intp(1, 0, 25)
T1_asi_reg_rd_51:
	mov	0x3c3, %r14
	.word 0xf8db84a0  ! 1437: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_1_116:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_116), 16, 16)) -> intp(1, 0, 25)
cpu_intr_1_115:
	setx	0x2a0302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00560  ! 1440: FSQRTq	fsqrt	
iob_intr_1_117:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_117), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbba81c20  ! 1444: FMOVRGEZ	dis not found

T1_asi_reg_wr_67:
	mov	0x31, %r14
	.word 0xfaf38e80  ! 1446: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_116:
	setx	0x2b0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00560  ! 1451: FSQRTq	fsqrt	
	.word 0xbd500000  ! 1454: RDPR_TPC	<illegal instruction>
	.word 0xb1a80820  ! 1459: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
cpu_intr_1_117:
	setx	0x2a0139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3c7001  ! 1461: SRAX_I	srax	%r17, 0x0001, %r31
	.word 0xb7a80c20  ! 1462: FMOVRLZ	dis not found

cpu_intr_1_118:
	setx	0x2a0121, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_52:
	mov	0x3c3, %r14
	.word 0xf0db8400  ! 1467: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_1_119:
	setx	0x28020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1518000  ! 1470: RDPR_PSTATE	<illegal instruction>
	.word 0xb3a4c8e0  ! 1476: FSUBq	dis not found

iob_intr_1_118:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_118), 16, 16)) -> intp(1, 0, b)
	.word 0xbdaa0820  ! 1479: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb7a4c9e0  ! 1481: FDIVq	dis not found

T1_asi_reg_rd_53:
	mov	0x1b, %r14
	.word 0xfedb8e60  ! 1482: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_1_119:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_119), 16, 16)) -> intp(1, 0, 27)
cpu_intr_1_120:
	setx	0x2a0213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1abc820  ! 1491: FMOVVC	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_54:
	mov	0x3c0, %r14
	.word 0xf4db84a0  ! 1493: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbd35b001  ! 1494: SRLX_I	srlx	%r22, 0x0001, %r30
cpu_intr_1_121:
	setx	0x290026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa58920  ! 1500: FMULs	fmuls	%f22, %f0, %f31
iob_intr_1_120:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_120), 16, 16)) -> intp(1, 0, 26)
iob_intr_1_121:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_121), 16, 16)) -> intp(1, 0, 37)
	.word 0xb7a84820  ! 1503: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb3a54820  ! 1505: FADDs	fadds	%f21, %f0, %f25
	.word 0xb7a81c20  ! 1506: FMOVRGEZ	dis not found

iob_intr_1_122:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_122), 16, 16)) -> intp(1, 0, 34)
	.word 0xbba44940  ! 1509: FMULd	fmuld	%f48, %f0, %f60
cpu_intr_1_122:
	setx	0x280232, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_68:
	mov	0x3c0, %r14
	.word 0xf8f38e80  ! 1511: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_1_123:
	setx	0x29031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2a50000  ! 1513: SUBcc_R	subcc 	%r20, %r0, %r25
cpu_intr_1_124:
	setx	0x2b000d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_69:
	mov	0x27, %r14
	.word 0xf0f38e40  ! 1518: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb3a00520  ! 1520: FSQRTs	fsqrt	
T1_asi_reg_wr_70:
	mov	0x35, %r14
	.word 0xf4f38400  ! 1526: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T1_asi_reg_rd_55:
	mov	0x0, %r14
	.word 0xfadb8e40  ! 1527: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbba88820  ! 1530: FMOVLE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_56:
	mov	0x2, %r14
	.word 0xf0db8e60  ! 1531: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_1_125:
	setx	0x2b0328, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_57:
	mov	0xf, %r14
	.word 0xfcdb8e40  ! 1535: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_123:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_123), 16, 16)) -> intp(1, 0, 11)
iob_intr_1_124:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_124), 16, 16)) -> intp(1, 0, 18)
	.word 0xb9a8c820  ! 1542: FMOVL	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_71:
	mov	0x1, %r14
	.word 0xf4f384a0  ! 1543: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_1_126:
	setx	0x2a0117, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_58:
	mov	0x3c0, %r14
	.word 0xf6db8e60  ! 1554: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_1_127:
	setx	0x2a0123, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_125:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_125), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_wr_72:
	mov	0x3c4, %r14
	.word 0xf6f389e0  ! 1562: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_1_128:
	setx	0x28010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_73:
	mov	0x35, %r14
	.word 0xfef38e40  ! 1567: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb3a48940  ! 1568: FMULd	fmuld	%f18, %f0, %f56
	.word 0xb7a9c820  ! 1570: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb1a549a0  ! 1571: FDIVs	fdivs	%f21, %f0, %f24
	.word 0xbf2dc000  ! 1574: SLL_R	sll 	%r23, %r0, %r31
iob_intr_1_126:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_126), 16, 16)) -> intp(1, 0, 2f)
	.word 0xbbaa0820  ! 1577: FMOVA	fmovs	%fcc1, %f0, %f29
iob_intr_1_127:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_127), 16, 16)) -> intp(1, 0, 1)
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xbc9d2121  ! 1584: XORcc_I	xorcc 	%r20, 0x0121, %r30
T1_asi_reg_wr_74:
	mov	0x3c5, %r14
	.word 0xf6f38e60  ! 1589: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T1_asi_reg_wr_75:
	mov	0x6, %r14
	.word 0xfcf384a0  ! 1590: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T1_asi_reg_wr_76:
	mov	0xf, %r14
	.word 0xfef38e60  ! 1591: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb2ad4000  ! 1593: ANDNcc_R	andncc 	%r21, %r0, %r25
	.word 0xbfa8c820  ! 1594: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xbabc4000  ! 1597: XNORcc_R	xnorcc 	%r17, %r0, %r29
cpu_intr_1_129:
	setx	0x28030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4346026  ! 1604: SUBC_I	orn 	%r17, 0x0026, %r26
	.word 0xbcbca190  ! 1606: XNORcc_I	xnorcc 	%r18, 0x0190, %r30
iob_intr_1_128:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_128), 16, 16)) -> intp(1, 0, 21)
T1_asi_reg_rd_59:
	mov	0xa, %r14
	.word 0xf8db8e40  ! 1610: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbba48860  ! 1612: FADDq	dis not found

	.word 0xb3aa4820  ! 1615: FMOVNE	fmovs	%fcc1, %f0, %f25
cpu_intr_1_130:
	setx	0x28013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb814e15d  ! 1618: OR_I	or 	%r19, 0x015d, %r28
	.word 0xb1a549c0  ! 1619: FDIVd	fdivd	%f52, %f0, %f24
iob_intr_1_129:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_129), 16, 16)) -> intp(1, 0, 16)
iob_intr_1_130:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_130), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_wr_77:
	mov	0x3c2, %r14
	.word 0xf6f384a0  ! 1627: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xbba00540  ! 1629: FSQRTd	fsqrt	
cpu_intr_1_131:
	setx	0x2a000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_78:
	mov	0x3c3, %r14
	.word 0xfef38e40  ! 1639: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_131:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_131), 16, 16)) -> intp(1, 0, 7)
cpu_intr_1_132:
	setx	0x2b010e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_79:
	mov	0x36, %r14
	.word 0xf0f38e40  ! 1647: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_1_132:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_132), 16, 16)) -> intp(1, 0, 37)
T1_asi_reg_wr_80:
	mov	0x15, %r14
	.word 0xf2f389e0  ! 1651: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_1_133:
	setx	0x280203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00540  ! 1654: FSQRTd	fsqrt	
	.word 0xb1a9c820  ! 1655: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb63c8000  ! 1656: XNOR_R	xnor 	%r18, %r0, %r27
iob_intr_1_133:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_133), 16, 16)) -> intp(1, 0, 10)
	.word 0xb1a9c820  ! 1674: FMOVVS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_60:
	mov	0x3c8, %r14
	.word 0xf2db8e80  ! 1675: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb2b5e128  ! 1676: ORNcc_I	orncc 	%r23, 0x0128, %r25
T1_asi_reg_wr_81:
	mov	0x13, %r14
	.word 0xf4f389e0  ! 1678: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_1_134:
	setx	0x29020d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_134:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_134), 16, 16)) -> intp(1, 0, 3c)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_135:
	setx	0x2b0336, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_136:
	setx	0x2b0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a81820  ! 1693: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xb1a88820  ! 1694: FMOVLE	fmovs	%fcc1, %f0, %f24
iob_intr_1_135:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_135), 16, 16)) -> intp(1, 0, 15)
T1_asi_reg_rd_61:
	mov	0x3c6, %r14
	.word 0xf0db8400  ! 1697: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_1_137:
	setx	0x29003b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_136:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_136), 16, 16)) -> intp(1, 0, 34)
iob_intr_1_137:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_137), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb1a94820  ! 1703: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb5a44940  ! 1704: FMULd	fmuld	%f48, %f0, %f26
	.word 0xb1a00560  ! 1705: FSQRTq	fsqrt	
iob_intr_1_138:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_138), 16, 16)) -> intp(1, 0, 18)
	.word 0xbda5c920  ! 1708: FMULs	fmuls	%f23, %f0, %f30
cpu_intr_1_138:
	setx	0x280201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_139:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_139), 16, 16)) -> intp(1, 0, 2a)
iob_intr_1_140:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_140), 16, 16)) -> intp(1, 0, 2c)
cpu_intr_1_139:
	setx	0x280109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_141:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_141), 16, 16)) -> intp(1, 0, 39)
	.word 0xbfab8820  ! 1722: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb1aa0820  ! 1725: FMOVA	fmovs	%fcc1, %f0, %f24
cpu_intr_1_140:
	setx	0x29000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa9c820  ! 1731: FMOVVS	fmovs	%fcc1, %f0, %f31
	lda	[%r21 + %g0] 0xf0, %f2
	.word 0xbdaa0820  ! 1735: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb09ce166  ! 1738: XORcc_I	xorcc 	%r19, 0x0166, %r24
cpu_intr_1_141:
	setx	0x2b032c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_142:
	setx	0x28000f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_62:
	mov	0x13, %r14
	.word 0xf8db84a0  ! 1747: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_1_143:
	setx	0x29000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00040  ! 1750: FMOVd	fmovd	%f0, %f58
	.word 0xbb7cc400  ! 1751: MOVR_R	movre	%r19, %r0, %r29
	.word 0xb9a4c960  ! 1752: FMULq	dis not found

cpu_intr_1_144:
	setx	0x280205, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_82:
	mov	0x1d, %r14
	.word 0xf0f38400  ! 1755: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T1_asi_reg_rd_63:
	mov	0xc, %r14
	.word 0xfedb89e0  ! 1756: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb205a05f  ! 1758: ADD_I	add 	%r22, 0x005f, %r25
iob_intr_1_142:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_142), 16, 16)) -> intp(1, 0, d)
iob_intr_1_143:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_143), 16, 16)) -> intp(1, 0, 37)
	.word 0xb1a58820  ! 1765: FADDs	fadds	%f22, %f0, %f24
	.word 0xbba5c8c0  ! 1766: FSUBd	fsubd	%f54, %f0, %f60
T1_asi_reg_wr_83:
	mov	0x2b, %r14
	.word 0xf4f384a0  ! 1768: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_1_144:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_144), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbda81420  ! 1771: FMOVRNZ	dis not found

iob_intr_1_145:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_145), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_146:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_146), 16, 16)) -> intp(1, 0, 17)
iob_intr_1_147:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_147), 16, 16)) -> intp(1, 0, 1f)
T1_asi_reg_rd_64:
	mov	0x0, %r14
	.word 0xf2db8400  ! 1784: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xbfaa4820  ! 1790: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xbe3ca109  ! 1791: XNOR_I	xnor 	%r18, 0x0109, %r31
T1_asi_reg_rd_65:
	mov	0x1d, %r14
	.word 0xfcdb8e40  ! 1795: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbfa80820  ! 1796: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
iob_intr_1_148:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_148), 16, 16)) -> intp(1, 0, 37)
iob_intr_1_149:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_149), 16, 16)) -> intp(1, 0, 4)
iob_intr_1_150:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_150), 16, 16)) -> intp(1, 0, 1f)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_66:
	mov	0x7, %r14
	.word 0xf4db8e40  ! 1808: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb9a81c20  ! 1810: FMOVRGEZ	dis not found

cpu_intr_1_145:
	setx	0x2a0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a588c0  ! 1814: FSUBd	fsubd	%f22, %f0, %f56
iob_intr_1_151:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_151), 16, 16)) -> intp(1, 0, 31)
T1_asi_reg_rd_67:
	mov	0x24, %r14
	.word 0xf8db8400  ! 1821: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T1_asi_reg_rd_68:
	mov	0x2b, %r14
	.word 0xfcdb8e60  ! 1822: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb044610d  ! 1823: ADDC_I	addc 	%r17, 0x010d, %r24
T1_asi_reg_wr_84:
	mov	0x33, %r14
	.word 0xfaf38e40  ! 1825: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_wr_85:
	mov	0x34, %r14
	.word 0xfef384a0  ! 1826: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T1_asi_reg_wr_86:
	mov	0x2, %r14
	.word 0xf2f38e40  ! 1829: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_wr_87:
	mov	0x28, %r14
	.word 0xfcf38e40  ! 1830: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_152:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_152), 16, 16)) -> intp(1, 0, 0)
T1_asi_reg_rd_69:
	mov	0x6, %r14
	.word 0xf0db89e0  ! 1832: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_1_146:
	setx	0x2b000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a88820  ! 1834: FMOVLE	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a4c8e0  ! 1836: FSUBq	dis not found

cpu_intr_1_147:
	setx	0x28011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfab4820  ! 1839: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb1a94820  ! 1841: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb7a80820  ! 1842: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb9a98820  ! 1844: FMOVNEG	fmovs	%fcc1, %f0, %f28
cpu_intr_1_148:
	setx	0x29023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00540  ! 1848: FSQRTd	fsqrt	
T1_asi_reg_wr_88:
	mov	0x2e, %r14
	.word 0xf8f38e40  ! 1850: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_rd_70:
	mov	0x30, %r14
	.word 0xf8db8400  ! 1851: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_1_149:
	setx	0x2e0321, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_153:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_153), 16, 16)) -> intp(1, 0, 2f)
cpu_intr_1_150:
	setx	0x2e032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_151:
	setx	0x2e022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b4e0d9  ! 1865: ORNcc_I	orncc 	%r19, 0x00d9, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_152:
	setx	0x2f030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_71:
	mov	0x38, %r14
	.word 0xf2db8e80  ! 1871: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_1_153:
	setx	0x2e0009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba50860  ! 1880: FADDq	dis not found

iob_intr_1_154:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_154), 16, 16)) -> intp(1, 0, 3f)
T1_asi_reg_wr_89:
	mov	0x3c6, %r14
	.word 0xfcf38e60  ! 1885: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb61ca035  ! 1886: XOR_I	xor 	%r18, 0x0035, %r27
cpu_intr_1_154:
	setx	0x2e030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4952157  ! 1889: ORcc_I	orcc 	%r20, 0x0157, %r26
T1_asi_reg_wr_90:
	mov	0x25, %r14
	.word 0xf6f389e0  ! 1890: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_1_155:
	setx	0x2c013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd510000  ! 1895: RDPR_TICK	<illegal instruction>
	.word 0xbda54920  ! 1896: FMULs	fmuls	%f21, %f0, %f30
iob_intr_1_155:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_155), 16, 16)) -> intp(1, 0, 3)
iob_intr_1_156:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_156), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb3a40860  ! 1903: FADDq	dis not found

	.word 0xb83c8000  ! 1904: XNOR_R	xnor 	%r18, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_72:
	mov	0x3c7, %r14
	.word 0xf0db8e40  ! 1906: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbb3cd000  ! 1910: SRAX_R	srax	%r19, %r0, %r29
	.word 0xb1a408c0  ! 1912: FSUBd	fsubd	%f16, %f0, %f24
cpu_intr_1_156:
	setx	0x2c0333, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_157:
	setx	0x2d003b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_157:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_157), 16, 16)) -> intp(1, 0, 28)
T1_asi_reg_wr_91:
	mov	0xb, %r14
	.word 0xf2f38e60  ! 1919: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T1_asi_reg_rd_73:
	mov	0x12, %r14
	.word 0xf2db8e60  ! 1924: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb7a00540  ! 1926: FSQRTd	fsqrt	
T1_asi_reg_rd_74:
	mov	0x2b, %r14
	.word 0xf0db8400  ! 1927: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbfab8820  ! 1928: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb83c4000  ! 1929: XNOR_R	xnor 	%r17, %r0, %r28
T1_asi_reg_rd_75:
	mov	0x3c2, %r14
	.word 0xfadb8400  ! 1930: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T1_asi_reg_wr_92:
	mov	0x1d, %r14
	.word 0xf0f38e60  ! 1931: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T1_asi_reg_wr_93:
	mov	0x8, %r14
	.word 0xfef38400  ! 1933: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_1_158:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_158), 16, 16)) -> intp(1, 0, 0)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda80420  ! 1939: FMOVRZ	dis not found

	.word 0xb9a40820  ! 1940: FADDs	fadds	%f16, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_159:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_159), 16, 16)) -> intp(1, 0, 5)
	.word 0xb7a8c820  ! 1946: FMOVL	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_94:
	mov	0x26, %r14
	.word 0xf6f38400  ! 1948: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xb1a81420  ! 1951: FMOVRNZ	dis not found

iob_intr_1_160:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_160), 16, 16)) -> intp(1, 0, 35)
	.word 0xbbaa0820  ! 1955: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb1ab8820  ! 1961: FMOVPOS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_95:
	mov	0x1f, %r14
	.word 0xf8f38400  ! 1962: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_1_158:
	setx	0x2c013a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_159:
	setx	0x2e032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb33c3001  ! 1973: SRAX_I	srax	%r16, 0x0001, %r25
	.word 0xbda00040  ! 1976: FMOVd	fmovd	%f0, %f30
	.word 0xbc2d0000  ! 1978: ANDN_R	andn 	%r20, %r0, %r30
T1_asi_reg_rd_76:
	mov	0x8, %r14
	.word 0xf6db84a0  ! 1981: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_1_160:
	setx	0x2f0320, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_77:
	mov	0x7, %r14
	.word 0xf8db8e40  ! 1985: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_1_161:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_161), 16, 16)) -> intp(1, 0, 32)
	.word 0xb5a80c20  ! 1988: FMOVRLZ	dis not found

cpu_intr_1_161:
	setx	0x2c000a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_162:
	setx	0x2d0119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba80820  ! 1993: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
cpu_intr_1_163:
	setx	0x2f0015, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_96:
	mov	0xd, %r14
	.word 0xf6f38e40  ! 1995: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbe3ce04e  ! 1996: XNOR_I	xnor 	%r19, 0x004e, %r31
T1_asi_reg_rd_78:
	mov	0x3c1, %r14
	.word 0xf4db8e80  ! 2000: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbda409c0  ! 2001: FDIVd	fdivd	%f16, %f0, %f30
T1_asi_reg_wr_97:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 2002: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_162:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_162), 16, 16)) -> intp(1, 0, 11)
cpu_intr_1_164:
	setx	0x2d033b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_165:
	setx	0x2f021a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_98:
	mov	0x3c1, %r14
	.word 0xfef389e0  ! 2012: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbfa54960  ! 2013: FMULq	dis not found

	.word 0xb5ab0820  ! 2014: FMOVGU	fmovs	%fcc1, %f0, %f26
iob_intr_1_163:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_163), 16, 16)) -> intp(1, 0, 15)
cpu_intr_1_166:
	setx	0x2c002d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_164:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_164), 16, 16)) -> intp(1, 0, 2b)
T1_asi_reg_rd_79:
	mov	0x1c, %r14
	.word 0xfadb8e80  ! 2022: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xbd340000  ! 2024: SRL_R	srl 	%r16, %r0, %r30
	.word 0xbfa50840  ! 2026: FADDd	faddd	%f20, %f0, %f62
	.word 0xb7aa8820  ! 2028: FMOVG	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_80:
	mov	0x3c2, %r14
	.word 0xf2db89e0  ! 2029: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb7a4c9e0  ! 2033: FDIVq	dis not found

	.word 0xb5a509e0  ! 2034: FDIVq	dis not found

cpu_intr_1_167:
	setx	0x2f023d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_81:
	mov	0x3c0, %r14
	.word 0xf8db8e80  ! 2037: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xba3c0000  ! 2038: XNOR_R	xnor 	%r16, %r0, %r29
T1_asi_reg_rd_82:
	mov	0x3c2, %r14
	.word 0xfcdb8e80  ! 2041: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb1abc820  ! 2042: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xbba409e0  ! 2043: FDIVq	dis not found

T1_asi_reg_rd_83:
	mov	0x3c0, %r14
	.word 0xf8db8e60  ! 2044: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_1_168:
	setx	0x2f0200, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_99:
	mov	0x2, %r14
	.word 0xf2f38400  ! 2047: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T1_asi_reg_rd_84:
	mov	0x3c8, %r14
	.word 0xf0db8e60  ! 2051: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_1_169:
	setx	0x2c0213, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_165:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_165), 16, 16)) -> intp(1, 0, 16)
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xb7a00020  ! 2063: FMOVs	fmovs	%f0, %f27
iob_intr_1_166:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_166), 16, 16)) -> intp(1, 0, 15)
T1_asi_reg_wr_100:
	mov	0x38, %r14
	.word 0xf2f38e80  ! 2069: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T1_asi_reg_wr_101:
	mov	0x16, %r14
	.word 0xf4f38e80  ! 2070: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_1_167:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_167), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_170:
	setx	0x2c0204, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_171:
	setx	0x2f023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda40920  ! 2080: FMULs	fmuls	%f16, %f0, %f30
	.word 0xb5a84820  ! 2084: FMOVE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_85:
	mov	0x23, %r14
	.word 0xf2db8400  ! 2087: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb7abc820  ! 2088: FMOVVC	fmovs	%fcc1, %f0, %f27
cpu_intr_1_172:
	setx	0x2c013c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_173:
	setx	0x2d001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a88820  ! 2091: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xb9a44860  ! 2096: FADDq	dis not found

	.word 0xb5a00040  ! 2097: FMOVd	fmovd	%f0, %f26
iob_intr_1_168:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_168), 16, 16)) -> intp(1, 0, 2b)
	.word 0xbfa588a0  ! 2101: FSUBs	fsubs	%f22, %f0, %f31
	.word 0xb1a80820  ! 2102: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_102:
	mov	0x3c7, %r14
	.word 0xf6f389e0  ! 2103: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T1_asi_reg_rd_86:
	mov	0x27, %r14
	.word 0xf4db8e40  ! 2107: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbfa58940  ! 2112: FMULd	fmuld	%f22, %f0, %f62
cpu_intr_1_174:
	setx	0x2c0201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a40860  ! 2114: FADDq	dis not found

	.word 0xbfa80820  ! 2116: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0x8195a06e  ! 2117: WRPR_TPC_I	wrpr	%r22, 0x006e, %tpc
	.word 0xbda9c820  ! 2118: FMOVVS	fmovs	%fcc1, %f0, %f30
iob_intr_1_169:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_169), 16, 16)) -> intp(1, 0, 15)
T1_asi_reg_wr_103:
	mov	0x3c7, %r14
	.word 0xfcf38e40  ! 2121: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T1_asi_reg_wr_104:
	mov	0x14, %r14
	.word 0xfcf38e60  ! 2126: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbba5c920  ! 2129: FMULs	fmuls	%f23, %f0, %f29
cpu_intr_1_175:
	setx	0x2c021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba81420  ! 2133: FMOVRNZ	dis not found

	.word 0xb7a00560  ! 2134: FSQRTq	fsqrt	
	.word 0xb9a94820  ! 2136: FMOVCS	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_105:
	mov	0x35, %r14
	.word 0xf8f38400  ! 2137: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_1_170:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_170), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb7aa8820  ! 2141: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb29d2117  ! 2142: XORcc_I	xorcc 	%r20, 0x0117, %r25
	.word 0xb7aa0820  ! 2143: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb7a508a0  ! 2145: FSUBs	fsubs	%f20, %f0, %f27
	.word 0xb82dc000  ! 2152: ANDN_R	andn 	%r23, %r0, %r28
iob_intr_1_171:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_171), 16, 16)) -> intp(1, 0, d)
cpu_intr_1_176:
	setx	0x2e0315, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_106:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 2156: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb5a00020  ! 2158: FMOVs	fmovs	%f0, %f26
T1_asi_reg_rd_87:
	mov	0x10, %r14
	.word 0xf4db8e40  ! 2161: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_1_172:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_172), 16, 16)) -> intp(1, 0, 33)
T1_asi_reg_wr_107:
	mov	0x16, %r14
	.word 0xf2f38e80  ! 2171: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb7a00540  ! 2172: FSQRTd	fsqrt	
iob_intr_1_173:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_173), 16, 16)) -> intp(1, 0, 6)
	.word 0xbba00520  ! 2175: FSQRTs	fsqrt	
	.word 0xb12c1000  ! 2177: SLLX_R	sllx	%r16, %r0, %r24
T1_asi_reg_wr_108:
	mov	0x8, %r14
	.word 0xf6f384a0  ! 2181: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T1_asi_reg_rd_88:
	mov	0x2e, %r14
	.word 0xf0db8e60  ! 2182: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_1_177:
	setx	0x2d0038, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_178:
	setx	0x2f001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfabc820  ! 2187: FMOVVC	fmovs	%fcc1, %f0, %f31
iob_intr_1_174:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_174), 16, 16)) -> intp(1, 0, 36)
iob_intr_1_175:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_175), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_179:
	setx	0x2d0038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a509c0  ! 2194: FDIVd	fdivd	%f20, %f0, %f24
	.word 0xb5504000  ! 2195: RDPR_TNPC	<illegal instruction>
	.word 0xb1a94820  ! 2198: FMOVCS	fmovs	%fcc1, %f0, %f24
cpu_intr_1_180:
	setx	0x2e0238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda50860  ! 2201: FADDq	dis not found

T1_asi_reg_wr_109:
	mov	0x5, %r14
	.word 0xfef38e40  ! 2206: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_rd_89:
	mov	0x3c2, %r14
	.word 0xf8db8e80  ! 2208: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb3a80c20  ! 2210: FMOVRLZ	dis not found

	.word 0xb7a00020  ! 2213: FMOVs	fmovs	%f0, %f27
iob_intr_1_176:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_176), 16, 16)) -> intp(1, 0, 10)
	.word 0xb12c6001  ! 2219: SLL_I	sll 	%r17, 0x0001, %r24
T1_asi_reg_wr_110:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 2220: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbfa448e0  ! 2221: FSUBq	dis not found

	.word 0xb7a58820  ! 2222: FADDs	fadds	%f22, %f0, %f27
iob_intr_1_177:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_177), 16, 16)) -> intp(1, 0, 32)
T1_asi_reg_wr_111:
	mov	0x2c, %r14
	.word 0xf2f389e0  ! 2224: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb5a54940  ! 2225: FMULd	fmuld	%f52, %f0, %f26
	.word 0xbda509c0  ! 2230: FDIVd	fdivd	%f20, %f0, %f30
iob_intr_1_178:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_178), 16, 16)) -> intp(1, 0, 14)
T1_asi_reg_wr_112:
	mov	0x3c6, %r14
	.word 0xf4f38e40  ! 2234: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T1_asi_reg_wr_113:
	mov	0x35, %r14
	.word 0xf0f384a0  ! 2238: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb9a00520  ! 2239: FSQRTs	fsqrt	
cpu_intr_1_181:
	setx	0x2d0001, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_179:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_179), 16, 16)) -> intp(1, 0, 34)
T1_asi_reg_rd_90:
	mov	0x11, %r14
	.word 0xf6db8e40  ! 2246: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbba00560  ! 2248: FSQRTq	fsqrt	
	.word 0xb81cc000  ! 2249: XOR_R	xor 	%r19, %r0, %r28
	.word 0xb9a5c9a0  ! 2254: FDIVs	fdivs	%f23, %f0, %f28
	.word 0xbba409e0  ! 2255: FDIVq	dis not found

cpu_intr_1_182:
	setx	0x2c0306, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_180:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_180), 16, 16)) -> intp(1, 0, e)
cpu_intr_1_183:
	setx	0x2e0017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe1420a1  ! 2262: OR_I	or 	%r16, 0x00a1, %r31
	.word 0xb3a90820  ! 2264: FMOVLEU	fmovs	%fcc1, %f0, %f25
iob_intr_1_181:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_181), 16, 16)) -> intp(1, 0, 28)
iob_intr_1_182:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_182), 16, 16)) -> intp(1, 0, 1a)
iob_intr_1_183:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_183), 16, 16)) -> intp(1, 0, 7)
	.word 0xb1a508c0  ! 2275: FSUBd	fsubd	%f20, %f0, %f24
	.word 0xb5a88820  ! 2276: FMOVLE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_91:
	mov	0x19, %r14
	.word 0xfadb89e0  ! 2280: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_1_184:
	setx	0x2f032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xbfa9c820  ! 2284: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xb3a80420  ! 2288: FMOVRZ	dis not found

	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xb3a80420  ! 2292: FMOVRZ	dis not found

cpu_intr_1_185:
	setx	0x2d0210, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_184:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_184), 16, 16)) -> intp(1, 0, 36)
cpu_intr_1_186:
	setx	0x2e0226, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_185:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_185), 16, 16)) -> intp(1, 0, 22)
iob_intr_1_186:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_186), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_wr_114:
	mov	0x2a, %r14
	.word 0xfcf38e60  ! 2301: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_1_187:
	setx	0x310130, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_187:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_187), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_rd_92:
	mov	0x2d, %r14
	.word 0xfcdb84a0  ! 2308: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbcb4202d  ! 2309: SUBCcc_I	orncc 	%r16, 0x002d, %r30
iob_intr_1_188:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_188), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_188:
	setx	0x30002a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_189:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_189), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_wr_115:
	mov	0x9, %r14
	.word 0xf6f38e80  ! 2314: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T1_asi_reg_wr_116:
	mov	0x3c1, %r14
	.word 0xfef384a0  ! 2315: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_1_190:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_190), 16, 16)) -> intp(1, 0, 3)
iob_intr_1_191:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_191), 16, 16)) -> intp(1, 0, c)
T1_asi_reg_wr_117:
	mov	0x3c1, %r14
	.word 0xf8f38400  ! 2323: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_192:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_192), 16, 16)) -> intp(1, 0, 3a)
	.word 0xbfa4c9e0  ! 2327: FDIVq	dis not found

	.word 0xbba5c9c0  ! 2329: FDIVd	fdivd	%f54, %f0, %f60
	.word 0xb9ab4820  ! 2330: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xbda8c820  ! 2331: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb5a80420  ! 2335: FMOVRZ	dis not found

iob_intr_1_193:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_193), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb9641800  ! 2339: MOVcc_R	<illegal instruction>
iob_intr_1_194:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_194), 16, 16)) -> intp(1, 0, d)
	.word 0xb6448000  ! 2343: ADDC_R	addc 	%r18, %r0, %r27
cpu_intr_1_189:
	setx	0x32023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a90820  ! 2348: FMOVLEU	fmovs	%fcc1, %f0, %f25
cpu_intr_1_190:
	setx	0x303, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_195:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_195), 16, 16)) -> intp(1, 0, e)
	.word 0xb3a58860  ! 2357: FADDq	dis not found

	.word 0xbda88820  ! 2360: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb1a509c0  ! 2362: FDIVd	fdivd	%f20, %f0, %f24
iob_intr_1_196:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_196), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb9a00040  ! 2366: FMOVd	fmovd	%f0, %f28
iob_intr_1_197:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_197), 16, 16)) -> intp(1, 0, 21)
T1_asi_reg_wr_118:
	mov	0x3c5, %r14
	.word 0xfaf384a0  ! 2370: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_1_198:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_198), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_wr_119:
	mov	0x3c3, %r14
	.word 0xf4f38e40  ! 2374: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb7aa0820  ! 2375: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xbcb4a0a5  ! 2376: SUBCcc_I	orncc 	%r18, 0x00a5, %r30
cpu_intr_1_191:
	setx	0x310304, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_120:
	mov	0x35, %r14
	.word 0xf8f38e80  ! 2378: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0x9194a08f  ! 2380: WRPR_PIL_I	wrpr	%r18, 0x008f, %pil
cpu_intr_1_192:
	setx	0x310237, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_93:
	mov	0x3c7, %r14
	.word 0xfcdb8e40  ! 2386: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbcbc0000  ! 2387: XNORcc_R	xnorcc 	%r16, %r0, %r30
T1_asi_reg_wr_121:
	mov	0x13, %r14
	.word 0xf0f38e40  ! 2392: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_rd_94:
	mov	0x3c6, %r14
	.word 0xf6db8e80  ! 2393: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbba00520  ! 2395: FSQRTs	fsqrt	
	.word 0xb5a449c0  ! 2396: FDIVd	fdivd	%f48, %f0, %f26
iob_intr_1_199:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_199), 16, 16)) -> intp(1, 0, 7)
T1_asi_reg_rd_95:
	mov	0x3c6, %r14
	.word 0xf8db8400  ! 2398: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb3a50960  ! 2401: FMULq	dis not found

cpu_intr_1_193:
	setx	0x33003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2944000  ! 2404: ORcc_R	orcc 	%r17, %r0, %r25
	.word 0xb5641800  ! 2408: MOVcc_R	<illegal instruction>
	.word 0xb835e1b6  ! 2410: SUBC_I	orn 	%r23, 0x01b6, %r28
	.word 0xb5a00560  ! 2411: FSQRTq	fsqrt	
iob_intr_1_200:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_200), 16, 16)) -> intp(1, 0, c)
iob_intr_1_201:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_201), 16, 16)) -> intp(1, 0, 2a)
iob_intr_1_202:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_202), 16, 16)) -> intp(1, 0, 1c)
iob_intr_1_203:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_203), 16, 16)) -> intp(1, 0, 6)
	.word 0xb37d6401  ! 2427: MOVR_I	movre	%r21, 0x1, %r25
	.word 0xbda81c20  ! 2428: FMOVRGEZ	dis not found

	.word 0xbdaa4820  ! 2431: FMOVNE	fmovs	%fcc1, %f0, %f30
iob_intr_1_204:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_204), 16, 16)) -> intp(1, 0, b)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_122:
	mov	0x5, %r14
	.word 0xf4f389e0  ! 2435: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_1_205:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_205), 16, 16)) -> intp(1, 0, 3f)
T1_asi_reg_rd_96:
	mov	0xa, %r14
	.word 0xf8db89e0  ! 2440: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T1_asi_reg_wr_123:
	mov	0x3c4, %r14
	.word 0xfef389e0  ! 2441: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_1_194:
	setx	0x330005, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_206:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_206), 16, 16)) -> intp(1, 0, 4)
cpu_intr_1_195:
	setx	0x300107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3aac820  ! 2450: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xbba00560  ! 2453: FSQRTq	fsqrt	
	.word 0xb28ca1b2  ! 2457: ANDcc_I	andcc 	%r18, 0x01b2, %r25
T1_asi_reg_rd_97:
	mov	0x3c0, %r14
	.word 0xf6db8e80  ! 2458: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_1_196:
	setx	0x300011, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_197:
	setx	0x330103, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00520  ! 2462: FSQRTs	fsqrt	
T1_asi_reg_rd_98:
	mov	0x34, %r14
	.word 0xfedb8e80  ! 2464: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T1_asi_reg_wr_124:
	mov	0x1, %r14
	.word 0xfaf384a0  ! 2466: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_1_198:
	setx	0x33010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 2470: FMOVN	fmovs	%fcc1, %f0, %f26
	.word 0xb9aa0820  ! 2471: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xbeb5217d  ! 2473: ORNcc_I	orncc 	%r20, 0x017d, %r31
	.word 0xbba44920  ! 2474: FMULs	fmuls	%f17, %f0, %f29
	.word 0xbe2c8000  ! 2475: ANDN_R	andn 	%r18, %r0, %r31
T1_asi_reg_wr_125:
	mov	0x3c6, %r14
	.word 0xf4f384a0  ! 2477: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_1_207:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_207), 16, 16)) -> intp(1, 0, f)
cpu_intr_1_199:
	setx	0x33033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab0820  ! 2485: FMOVGU	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_126:
	mov	0x3c3, %r14
	.word 0xf0f38400  ! 2494: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbba5c940  ! 2497: FMULd	fmuld	%f54, %f0, %f60
	.word 0xbfaac820  ! 2498: FMOVGE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_127:
	mov	0x3c6, %r14
	.word 0xf8f389e0  ! 2500: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_1_200:
	setx	0x310105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6a58000  ! 2507: SUBcc_R	subcc 	%r22, %r0, %r27
	.word 0xb9a00560  ! 2512: FSQRTq	fsqrt	
T1_asi_reg_rd_99:
	mov	0x2f, %r14
	.word 0xfadb8e60  ! 2513: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb1a90820  ! 2515: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xbc8ca15c  ! 2517: ANDcc_I	andcc 	%r18, 0x015c, %r30
	.word 0xba3561f4  ! 2519: SUBC_I	orn 	%r21, 0x01f4, %r29
cpu_intr_1_201:
	setx	0x30022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaa8820  ! 2522: FMOVG	fmovs	%fcc1, %f0, %f31
cpu_intr_1_202:
	setx	0x320327, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_208:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_208), 16, 16)) -> intp(1, 0, 20)
iob_intr_1_209:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_209), 16, 16)) -> intp(1, 0, 11)
	.word 0xbfa88820  ! 2527: FMOVLE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_128:
	mov	0x3c3, %r14
	.word 0xf6f38e40  ! 2529: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbba00560  ! 2531: FSQRTq	fsqrt	
T1_asi_reg_rd_100:
	mov	0x3c8, %r14
	.word 0xf0db8e60  ! 2532: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a448a0  ! 2537: FSUBs	fsubs	%f17, %f0, %f27
iob_intr_1_210:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_210), 16, 16)) -> intp(1, 0, 3a)
iob_intr_1_211:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_211), 16, 16)) -> intp(1, 0, 9)
T1_asi_reg_rd_101:
	mov	0x7, %r14
	.word 0xf4db89e0  ! 2542: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T1_asi_reg_rd_102:
	mov	0x3c3, %r14
	.word 0xf6db8400  ! 2544: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_1_203:
	setx	0x33012b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_212:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_212), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_rd_103:
	mov	0x3c3, %r14
	.word 0xf8db8e80  ! 2549: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb9a58840  ! 2550: FADDd	faddd	%f22, %f0, %f28
	.word 0xb7a80420  ! 2551: FMOVRZ	dis not found

T1_asi_reg_wr_129:
	mov	0x1d, %r14
	.word 0xfcf384a0  ! 2552: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_1_204:
	setx	0x330017, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_205:
	setx	0x33002d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_213:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_213), 16, 16)) -> intp(1, 0, 6)
iob_intr_1_214:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_214), 16, 16)) -> intp(1, 0, 25)
	.word 0xb1a5c920  ! 2561: FMULs	fmuls	%f23, %f0, %f24
iob_intr_1_215:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_215), 16, 16)) -> intp(1, 0, 26)
	.word 0xb1a88820  ! 2566: FMOVLE	fmovs	%fcc1, %f0, %f24
iob_intr_1_216:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_216), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb5a508a0  ! 2569: FSUBs	fsubs	%f20, %f0, %f26
	.word 0xbda548e0  ! 2570: FSUBq	dis not found

iob_intr_1_217:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_217), 16, 16)) -> intp(1, 0, 28)
	.word 0xbda80820  ! 2575: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xbfa48920  ! 2576: FMULs	fmuls	%f18, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_218:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_218), 16, 16)) -> intp(1, 0, 39)
iob_intr_1_219:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_219), 16, 16)) -> intp(1, 0, 25)
T1_asi_reg_rd_104:
	mov	0x1f, %r14
	.word 0xf6db8400  ! 2592: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_1_206:
	setx	0x32033e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_207:
	setx	0x310205, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r17 + %g0] 0xf0, %f2
T1_asi_reg_wr_130:
	mov	0x3c6, %r14
	.word 0xf8f389e0  ! 2597: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_1_208:
	setx	0x31031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_220:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_220), 16, 16)) -> intp(1, 0, 6)
cpu_intr_1_209:
	setx	0x320138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00560  ! 2603: FSQRTq	fsqrt	
	.word 0xb6c5c000  ! 2604: ADDCcc_R	addccc 	%r23, %r0, %r27
T1_asi_reg_rd_105:
	mov	0x18, %r14
	.word 0xf2db8e40  ! 2606: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_wr_131:
	mov	0x2b, %r14
	.word 0xfaf38e40  ! 2609: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbfa509a0  ! 2610: FDIVs	fdivs	%f20, %f0, %f31
iob_intr_1_221:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_221), 16, 16)) -> intp(1, 0, 0)
iob_intr_1_222:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_222), 16, 16)) -> intp(1, 0, 21)
iob_intr_1_223:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_223), 16, 16)) -> intp(1, 0, 27)
cpu_intr_1_210:
	setx	0x33013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_132:
	mov	0x1, %r14
	.word 0xfaf38e60  ! 2634: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbfa44960  ! 2635: FMULq	dis not found

iob_intr_1_224:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_224), 16, 16)) -> intp(1, 0, 32)
	.word 0xb9a589e0  ! 2647: FDIVq	dis not found

	.word 0xb7a50960  ! 2648: FMULq	dis not found

iob_intr_1_225:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_225), 16, 16)) -> intp(1, 0, 19)
cpu_intr_1_211:
	setx	0x300313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdabc820  ! 2654: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xb3a54940  ! 2663: FMULd	fmuld	%f52, %f0, %f56
T1_asi_reg_rd_106:
	mov	0x28, %r14
	.word 0xf4db8400  ! 2667: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb3a80420  ! 2668: FMOVRZ	dis not found

	.word 0xb93c7001  ! 2671: SRAX_I	srax	%r17, 0x0001, %r28
T1_asi_reg_wr_133:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 2672: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb9a90820  ! 2673: FMOVLEU	fmovs	%fcc1, %f0, %f28
iob_intr_1_226:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_226), 16, 16)) -> intp(1, 0, 34)
iob_intr_1_227:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_227), 16, 16)) -> intp(1, 0, 2f)
iob_intr_1_228:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_228), 16, 16)) -> intp(1, 0, 21)
	.word 0xb1a00560  ! 2677: FSQRTq	fsqrt	
	.word 0xb7a44920  ! 2679: FMULs	fmuls	%f17, %f0, %f27
	.word 0xb9a449c0  ! 2680: FDIVd	fdivd	%f48, %f0, %f28
T1_asi_reg_wr_134:
	mov	0x3c6, %r14
	.word 0xf4f38e60  ! 2681: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_1_212:
	setx	0x32002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7abc820  ! 2683: FMOVVC	fmovs	%fcc1, %f0, %f27
iob_intr_1_229:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_229), 16, 16)) -> intp(1, 0, 27)
iob_intr_1_230:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_230), 16, 16)) -> intp(1, 0, 11)
	.word 0xb03cc000  ! 2686: XNOR_R	xnor 	%r19, %r0, %r24
iob_intr_1_231:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_231), 16, 16)) -> intp(1, 0, 30)
	.word 0xbda58840  ! 2689: FADDd	faddd	%f22, %f0, %f30
cpu_intr_1_213:
	setx	0x330309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb63de1e8  ! 2692: XNOR_I	xnor 	%r23, 0x01e8, %r27
iob_intr_1_232:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_232), 16, 16)) -> intp(1, 0, 25)
iob_intr_1_233:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_233), 16, 16)) -> intp(1, 0, 7)
T1_asi_reg_rd_107:
	mov	0x32, %r14
	.word 0xfcdb8400  ! 2707: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T1_asi_reg_wr_135:
	mov	0x38, %r14
	.word 0xfaf38400  ! 2709: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T1_asi_reg_wr_136:
	mov	0x3c4, %r14
	.word 0xf2f38e60  ! 2712: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb7a00040  ! 2713: FMOVd	fmovd	%f0, %f58
T1_asi_reg_rd_108:
	mov	0x7, %r14
	.word 0xf4db84a0  ! 2714: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_1_234:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_234), 16, 16)) -> intp(1, 0, 26)
iob_intr_1_235:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_235), 16, 16)) -> intp(1, 0, 36)
	.word 0xbda80820  ! 2718: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb5ab4820  ! 2719: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xbfa408e0  ! 2720: FSUBq	dis not found

cpu_intr_1_214:
	setx	0x320328, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_109:
	mov	0x1e, %r14
	.word 0xf8db8400  ! 2724: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb7a80420  ! 2726: FMOVRZ	dis not found

cpu_intr_1_215:
	setx	0x330130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0c4e0f0  ! 2728: ADDCcc_I	addccc 	%r19, 0x00f0, %r24
cpu_intr_1_216:
	setx	0x320308, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_110:
	mov	0x12, %r14
	.word 0xfcdb8400  ! 2730: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbba00560  ! 2732: FSQRTq	fsqrt	
	.word 0xb83c21ad  ! 2736: XNOR_I	xnor 	%r16, 0x01ad, %r28
cpu_intr_1_217:
	setx	0x310310, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_111:
	mov	0x3c4, %r14
	.word 0xf0db8e60  ! 2738: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T1_asi_reg_rd_112:
	mov	0x36, %r14
	.word 0xf8db8e40  ! 2739: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_wr_137:
	mov	0x1, %r14
	.word 0xfcf38e60  ! 2740: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbfa40920  ! 2741: FMULs	fmuls	%f16, %f0, %f31
	.word 0xb4bc2136  ! 2743: XNORcc_I	xnorcc 	%r16, 0x0136, %r26
	.word 0xb1a98820  ! 2744: FMOVNEG	fmovs	%fcc1, %f0, %f24
cpu_intr_1_218:
	setx	0x300133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8c8000  ! 2746: ANDcc_R	andcc 	%r18, %r0, %r30
	.word 0xb9a448c0  ! 2750: FSUBd	fsubd	%f48, %f0, %f28
iob_intr_1_236:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_236), 16, 16)) -> intp(1, 0, 2d)
	.word 0xbda81c20  ! 2752: FMOVRGEZ	dis not found

	.word 0xbda48960  ! 2755: FMULq	dis not found

	.word 0xb9a81820  ! 2757: FMOVRGZ	fmovs	%fcc3, %f0, %f28
cpu_intr_1_219:
	setx	0x31031f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_220:
	setx	0x32021c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_221:
	setx	0x300315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a408e0  ! 2763: FSUBq	dis not found

T1_asi_reg_rd_113:
	mov	0x1c, %r14
	.word 0xfcdb84a0  ! 2764: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_1_222:
	setx	0x330023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba8d0000  ! 2766: ANDcc_R	andcc 	%r20, %r0, %r29
cpu_intr_1_223:
	setx	0x37002f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_237:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_237), 16, 16)) -> intp(1, 0, 11)
iob_intr_1_238:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_238), 16, 16)) -> intp(1, 0, 8)
T1_asi_reg_wr_138:
	mov	0x2, %r14
	.word 0xfcf38e80  ! 2775: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb3ab0820  ! 2776: FMOVGU	fmovs	%fcc1, %f0, %f25
iob_intr_1_239:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_239), 16, 16)) -> intp(1, 0, 27)
cpu_intr_1_224:
	setx	0x350317, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_139:
	mov	0x21, %r14
	.word 0xf2f384a0  ! 2783: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb5a548e0  ! 2785: FSUBq	dis not found

T1_asi_reg_wr_140:
	mov	0x1a, %r14
	.word 0xfcf38e40  ! 2786: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbba00520  ! 2788: FSQRTs	fsqrt	
	.word 0xbba94820  ! 2792: FMOVCS	fmovs	%fcc1, %f0, %f29
iob_intr_1_240:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_240), 16, 16)) -> intp(1, 0, 20)
	.word 0xb7a58960  ! 2801: FMULq	dis not found

T1_asi_reg_rd_114:
	mov	0x25, %r14
	.word 0xf6db84a0  ! 2804: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_1_225:
	setx	0x34021c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_141:
	mov	0x1f, %r14
	.word 0xf8f38400  ! 2809: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb8350000  ! 2810: ORN_R	orn 	%r20, %r0, %r28
	.word 0xb3a50940  ! 2811: FMULd	fmuld	%f20, %f0, %f56
	.word 0xb7a98820  ! 2815: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xbba98820  ! 2817: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xbda48920  ! 2819: FMULs	fmuls	%f18, %f0, %f30
	.word 0xb7ab4820  ! 2821: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb8154000  ! 2824: OR_R	or 	%r21, %r0, %r28
iob_intr_1_241:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_241), 16, 16)) -> intp(1, 0, 20)
iob_intr_1_242:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_242), 16, 16)) -> intp(1, 0, 13)
cpu_intr_1_226:
	setx	0x35030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a98820  ! 2834: FMOVNEG	fmovs	%fcc1, %f0, %f27
cpu_intr_1_227:
	setx	0x340122, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_142:
	mov	0x36, %r14
	.word 0xf8f384a0  ! 2836: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbfaa8820  ! 2838: FMOVG	fmovs	%fcc1, %f0, %f31
iob_intr_1_243:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_243), 16, 16)) -> intp(1, 0, 3c)
	.word 0xbd34e001  ! 2842: SRL_I	srl 	%r19, 0x0001, %r30
T1_asi_reg_rd_115:
	mov	0x3c1, %r14
	.word 0xfadb8e60  ! 2844: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_1_228:
	setx	0x370220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a90820  ! 2847: FMOVLEU	fmovs	%fcc1, %f0, %f25
iob_intr_1_244:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_244), 16, 16)) -> intp(1, 0, 26)
T1_asi_reg_wr_143:
	mov	0x33, %r14
	.word 0xfaf38e80  ! 2850: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb1a54840  ! 2852: FADDd	faddd	%f52, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_245:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_245), 16, 16)) -> intp(1, 0, 3a)
	.word 0xbfa509a0  ! 2860: FDIVs	fdivs	%f20, %f0, %f31
	.word 0xbfa50840  ! 2861: FADDd	faddd	%f20, %f0, %f62
T1_asi_reg_wr_144:
	mov	0x20, %r14
	.word 0xfef38e40  ! 2862: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb634e0cf  ! 2864: ORN_I	orn 	%r19, 0x00cf, %r27
	.word 0xb9a98820  ! 2868: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xb5a589c0  ! 2878: FDIVd	fdivd	%f22, %f0, %f26
	.word 0xb1a449e0  ! 2880: FDIVq	dis not found

cpu_intr_1_229:
	setx	0x360236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaac820  ! 2884: FMOVGE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_145:
	mov	0x19, %r14
	.word 0xfcf38e40  ! 2886: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_246:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_246), 16, 16)) -> intp(1, 0, 31)
	.word 0xb1a98820  ! 2890: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xbba94820  ! 2891: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xbba588c0  ! 2892: FSUBd	fsubd	%f22, %f0, %f60
iob_intr_1_247:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_247), 16, 16)) -> intp(1, 0, c)
	.word 0xb2056117  ! 2894: ADD_I	add 	%r21, 0x0117, %r25
T1_asi_reg_wr_146:
	mov	0x33, %r14
	.word 0xf2f38400  ! 2901: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T1_asi_reg_rd_116:
	mov	0x3c1, %r14
	.word 0xfadb89e0  ! 2907: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_1_248:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_248), 16, 16)) -> intp(1, 0, 4)
T1_asi_reg_rd_117:
	mov	0x3c6, %r14
	.word 0xf4db8e80  ! 2910: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbf504000  ! 2912: RDPR_TNPC	<illegal instruction>
	.word 0xbfa48820  ! 2915: FADDs	fadds	%f18, %f0, %f31
cpu_intr_1_230:
	setx	0x350024, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_147:
	mov	0x2f, %r14
	.word 0xf0f38e60  ! 2919: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T1_asi_reg_wr_148:
	mov	0x26, %r14
	.word 0xf8f38400  ! 2925: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xba25a095  ! 2926: SUB_I	sub 	%r22, 0x0095, %r29
iob_intr_1_249:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_249), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb40dc000  ! 2932: AND_R	and 	%r23, %r0, %r26
T1_asi_reg_wr_149:
	mov	0x3c6, %r14
	.word 0xf0f38400  ! 2933: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb9a40920  ! 2941: FMULs	fmuls	%f16, %f0, %f28
	.word 0xb1a90820  ! 2942: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xbcb4a18d  ! 2944: ORNcc_I	orncc 	%r18, 0x018d, %r30
iob_intr_1_250:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_250), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_wr_150:
	mov	0x20, %r14
	.word 0xf2f384a0  ! 2947: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T1_asi_reg_wr_151:
	mov	0xe, %r14
	.word 0xf6f38e40  ! 2948: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_rd_118:
	mov	0x3c8, %r14
	.word 0xfedb8e60  ! 2951: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_1_251:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_251), 16, 16)) -> intp(1, 0, 3)
T1_asi_reg_rd_119:
	mov	0x36, %r14
	.word 0xfadb8e40  ! 2954: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_rd_120:
	mov	0x3c1, %r14
	.word 0xfadb8e60  ! 2955: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_1_231:
	setx	0x360039, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_232:
	setx	0x350328, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r19 + %g0] 0xf0, %f2
iob_intr_1_252:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_252), 16, 16)) -> intp(1, 0, 25)
T1_asi_reg_wr_152:
	mov	0x1, %r14
	.word 0xf4f38e60  ! 2966: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_1_233:
	setx	0x37000e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_234:
	setx	0x370001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda449c0  ! 2976: FDIVd	fdivd	%f48, %f0, %f30
	.word 0xb42c8000  ! 2978: ANDN_R	andn 	%r18, %r0, %r26
	.word 0xb3a90820  ! 2981: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xba344000  ! 2983: SUBC_R	orn 	%r17, %r0, %r29
	.word 0xb835a09c  ! 2985: ORN_I	orn 	%r22, 0x009c, %r28
	.word 0xbe0cc000  ! 2986: AND_R	and 	%r19, %r0, %r31
	.word 0xb835c000  ! 2992: ORN_R	orn 	%r23, %r0, %r28
	.word 0xb7a4c960  ! 2996: FMULq	dis not found

cpu_intr_1_235:
	setx	0x34001f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_121:
	mov	0x34, %r14
	.word 0xfcdb8e40  ! 2998: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_253:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_253), 16, 16)) -> intp(1, 0, 10)
	.word 0xb5a90820  ! 3001: FMOVLEU	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_153:
	mov	0x1c, %r14
	.word 0xf6f384a0  ! 3002: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb9a81c20  ! 3003: FMOVRGEZ	dis not found

	.word 0xb7a80820  ! 3005: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xbda508e0  ! 3006: FSUBq	dis not found

	.word 0xbba44940  ! 3009: FMULd	fmuld	%f48, %f0, %f60
	.word 0xb1a58820  ! 3010: FADDs	fadds	%f22, %f0, %f24
iob_intr_1_254:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_254), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_rd_122:
	mov	0x3c6, %r14
	.word 0xfedb8e80  ! 3012: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T1_asi_reg_rd_123:
	mov	0x3c4, %r14
	.word 0xf6db89e0  ! 3016: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T1_asi_reg_rd_124:
	mov	0x3c3, %r14
	.word 0xf8db84a0  ! 3018: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbda54860  ! 3020: FADDq	dis not found

cpu_intr_1_236:
	setx	0x370324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaa420f5  ! 3024: SUBcc_I	subcc 	%r16, 0x00f5, %r29
	.word 0x8394604c  ! 3025: WRPR_TNPC_I	wrpr	%r17, 0x004c, %tnpc
	.word 0xb1643801  ! 3027: MOVcc_I	<illegal instruction>
	.word 0xbda90820  ! 3028: FMOVLEU	fmovs	%fcc1, %f0, %f30
iob_intr_1_255:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_255), 16, 16)) -> intp(1, 0, 7)
	.word 0xbc348000  ! 3032: SUBC_R	orn 	%r18, %r0, %r30
iob_intr_1_256:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_256), 16, 16)) -> intp(1, 0, 35)
	.word 0xbda81820  ! 3036: FMOVRGZ	fmovs	%fcc3, %f0, %f30
iob_intr_1_257:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_257), 16, 16)) -> intp(1, 0, 3d)
	.word 0xbdab4820  ! 3041: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xbba00540  ! 3043: FSQRTd	fsqrt	
cpu_intr_1_237:
	setx	0x37023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a408a0  ! 3045: FSUBs	fsubs	%f16, %f0, %f28
cpu_intr_1_238:
	setx	0x340116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x819560f0  ! 3050: WRPR_TPC_I	wrpr	%r21, 0x00f0, %tpc
cpu_intr_1_239:
	setx	0x350007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7ab8820  ! 3053: FMOVPOS	fmovs	%fcc1, %f0, %f27
iob_intr_1_258:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_258), 16, 16)) -> intp(1, 0, 3c)
iob_intr_1_259:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_259), 16, 16)) -> intp(1, 0, 5)
	.word 0xbba80820  ! 3059: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb7a81c20  ! 3060: FMOVRGEZ	dis not found

	.word 0xb3a509a0  ! 3061: FDIVs	fdivs	%f20, %f0, %f25
cpu_intr_1_240:
	setx	0x370021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb885e0fd  ! 3064: ADDcc_I	addcc 	%r23, 0x00fd, %r28
	.word 0xb1a40960  ! 3065: FMULq	dis not found

	.word 0xb5a00540  ! 3066: FSQRTd	fsqrt	
cpu_intr_1_241:
	setx	0x350331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda88820  ! 3068: FMOVLE	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_154:
	mov	0x3c1, %r14
	.word 0xfcf389e0  ! 3069: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T1_asi_reg_wr_155:
	mov	0x23, %r14
	.word 0xf8f389e0  ! 3070: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T1_asi_reg_wr_156:
	mov	0x3c5, %r14
	.word 0xf6f38e40  ! 3071: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_260:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_260), 16, 16)) -> intp(1, 0, 3d)
iob_intr_1_261:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_261), 16, 16)) -> intp(1, 0, 34)
cpu_intr_1_242:
	setx	0x370025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda48840  ! 3077: FADDd	faddd	%f18, %f0, %f30
iob_intr_1_262:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_262), 16, 16)) -> intp(1, 0, e)
	.word 0xb3a40840  ! 3080: FADDd	faddd	%f16, %f0, %f56
cpu_intr_1_243:
	setx	0x34003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80420  ! 3086: FMOVRZ	dis not found

T1_asi_reg_wr_157:
	mov	0x36, %r14
	.word 0xf6f38400  ! 3088: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_1_263:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_263), 16, 16)) -> intp(1, 0, 3)
	.word 0xb17c8400  ! 3092: MOVR_R	movre	%r18, %r0, %r24
cpu_intr_1_244:
	setx	0x34002a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_125:
	mov	0x0, %r14
	.word 0xf4db84a0  ! 3095: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_1_264:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_264), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_265:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_265), 16, 16)) -> intp(1, 0, 28)
T1_asi_reg_rd_126:
	mov	0x3c7, %r14
	.word 0xf4db8e80  ! 3098: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T1_asi_reg_wr_158:
	mov	0x4, %r14
	.word 0xf2f384a0  ! 3099: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_1_245:
	setx	0x350000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_246:
	setx	0x360108, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_159:
	mov	0x13, %r14
	.word 0xf2f38e60  ! 3109: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_1_266:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_266), 16, 16)) -> intp(1, 0, 21)
T1_asi_reg_wr_160:
	mov	0x1e, %r14
	.word 0xfaf389e0  ! 3115: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_1_267:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_267), 16, 16)) -> intp(1, 0, 12)
	.word 0xbfa4c860  ! 3119: FADDq	dis not found

	.word 0xb9a4c8e0  ! 3124: FSUBq	dis not found

	.word 0xb1a81c20  ! 3126: FMOVRGEZ	dis not found

	.word 0xbda00540  ! 3128: FSQRTd	fsqrt	
T1_asi_reg_rd_127:
	mov	0x30, %r14
	.word 0xf8db8400  ! 3130: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_1_268:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_268), 16, 16)) -> intp(1, 0, 5)
	.word 0xb7aa8820  ! 3137: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb5ab0820  ! 3139: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xbfa489e0  ! 3140: FDIVq	dis not found

iob_intr_1_269:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_269), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_rd_128:
	mov	0x3c1, %r14
	.word 0xf8db8400  ! 3145: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_1_270:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_270), 16, 16)) -> intp(1, 0, 33)
T1_asi_reg_wr_161:
	mov	0xa, %r14
	.word 0xfef389e0  ! 3148: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb9a80420  ! 3149: FMOVRZ	dis not found

	.word 0xbda00520  ! 3151: FSQRTs	fsqrt	
iob_intr_1_271:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_271), 16, 16)) -> intp(1, 0, 35)
	.word 0xb7a58840  ! 3157: FADDd	faddd	%f22, %f0, %f58
T1_asi_reg_wr_162:
	mov	0x2d, %r14
	.word 0xf6f38e60  ! 3161: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb3a00540  ! 3162: FSQRTd	fsqrt	
	.word 0xb1a549e0  ! 3163: FDIVq	dis not found

	.word 0xbda40860  ! 3164: FADDq	dis not found

	.word 0xb3a5c920  ! 3168: FMULs	fmuls	%f23, %f0, %f25
	.word 0xb1aa8820  ! 3170: FMOVG	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_129:
	mov	0x3, %r14
	.word 0xfedb89e0  ! 3171: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb5a00040  ! 3172: FMOVd	fmovd	%f0, %f26
	.word 0xbda80820  ! 3174: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xbba408a0  ! 3175: FSUBs	fsubs	%f16, %f0, %f29
	.word 0xb1ab8820  ! 3177: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb9a58920  ! 3184: FMULs	fmuls	%f22, %f0, %f28
	.word 0xbda5c8e0  ! 3186: FSUBq	dis not found

	.word 0xb7a488c0  ! 3193: FSUBd	fsubd	%f18, %f0, %f58
	.word 0xb5a80420  ! 3196: FMOVRZ	dis not found

T1_asi_reg_rd_130:
	mov	0x3c0, %r14
	.word 0xfedb8e40  ! 3198: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xba8c4000  ! 3200: ANDcc_R	andcc 	%r17, %r0, %r29
	.word 0xb64421c2  ! 3201: ADDC_I	addc 	%r16, 0x01c2, %r27
iob_intr_1_272:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_272), 16, 16)) -> intp(1, 0, 7)
cpu_intr_1_247:
	setx	0x3b023d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_248:
	setx	0x390132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aa8820  ! 3211: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xb5a00560  ! 3213: FSQRTq	fsqrt	
	.word 0xb9a44860  ! 3214: FADDq	dis not found

iob_intr_1_273:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_273), 16, 16)) -> intp(1, 0, 8)
	lda	[%r19 + %g0] 0xf0, %f2
T1_asi_reg_wr_163:
	mov	0x21, %r14
	.word 0xf6f38e80  ! 3224: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0x91946175  ! 3225: WRPR_PIL_I	wrpr	%r17, 0x0175, %pil
T1_asi_reg_rd_131:
	mov	0x3c2, %r14
	.word 0xf0db8e80  ! 3231: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T1_asi_reg_wr_164:
	mov	0x25, %r14
	.word 0xfef38e80  ! 3233: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb3a5c9a0  ! 3238: FDIVs	fdivs	%f23, %f0, %f25
T1_asi_reg_rd_132:
	mov	0x1c, %r14
	.word 0xf4db8e80  ! 3239: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T1_asi_reg_wr_165:
	mov	0x37, %r14
	.word 0xf2f389e0  ! 3241: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb5a00040  ! 3243: FMOVd	fmovd	%f0, %f26
iob_intr_1_274:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_274), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_wr_166:
	mov	0x3c5, %r14
	.word 0xf6f38e40  ! 3247: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_275:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_275), 16, 16)) -> intp(1, 0, 11)
	.word 0xbba5c960  ! 3249: FMULq	dis not found

	.word 0xbda00040  ! 3251: FMOVd	fmovd	%f0, %f30
cpu_intr_1_249:
	setx	0x3a0011, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_276:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_276), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbda81820  ! 3259: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0x8d94e164  ! 3260: WRPR_PSTATE_I	wrpr	%r19, 0x0164, %pstate
iob_intr_1_277:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_277), 16, 16)) -> intp(1, 0, 3c)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_133:
	mov	0x31, %r14
	.word 0xf4db8e40  ! 3265: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_1_278:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_278), 16, 16)) -> intp(1, 0, 39)
	.word 0xbfa5c960  ! 3267: FMULq	dis not found

	.word 0xb3a80820  ! 3271: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xbab44000  ! 3275: SUBCcc_R	orncc 	%r17, %r0, %r29
	.word 0xb3a88820  ! 3278: FMOVLE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_167:
	mov	0x16, %r14
	.word 0xfef38e60  ! 3282: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_1_250:
	setx	0x390229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a448c0  ! 3288: FSUBd	fsubd	%f48, %f0, %f28
T1_asi_reg_rd_134:
	mov	0x2e, %r14
	.word 0xfedb8e40  ! 3290: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_251:
	setx	0x3a021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xb7a4c840  ! 3297: FADDd	faddd	%f50, %f0, %f58
	.word 0xbab46102  ! 3299: ORNcc_I	orncc 	%r17, 0x0102, %r29
	.word 0xb8ac0000  ! 3300: ANDNcc_R	andncc 	%r16, %r0, %r28
	.word 0xbbabc820  ! 3302: FMOVVC	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_168:
	mov	0x1a, %r14
	.word 0xfcf38e60  ! 3303: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb5a48940  ! 3305: FMULd	fmuld	%f18, %f0, %f26
T1_asi_reg_rd_135:
	mov	0xd, %r14
	.word 0xfadb8400  ! 3307: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_1_252:
	setx	0x39022c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_169:
	mov	0x3c3, %r14
	.word 0xf6f38e40  ! 3309: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_253:
	setx	0x390333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda409a0  ! 3311: FDIVs	fdivs	%f16, %f0, %f30
	.word 0xbda81820  ! 3314: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb1a408a0  ! 3317: FSUBs	fsubs	%f16, %f0, %f24
T1_asi_reg_wr_170:
	mov	0x35, %r14
	.word 0xf6f38e80  ! 3318: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb7a80c20  ! 3324: FMOVRLZ	dis not found

cpu_intr_1_254:
	setx	0x3a0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a4c920  ! 3328: FMULs	fmuls	%f19, %f0, %f24
T1_asi_reg_wr_171:
	mov	0x1c, %r14
	.word 0xf6f389e0  ! 3334: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb8acc000  ! 3336: ANDNcc_R	andncc 	%r19, %r0, %r28
iob_intr_1_279:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_279), 16, 16)) -> intp(1, 0, 5)
	.word 0xbe2d4000  ! 3346: ANDN_R	andn 	%r21, %r0, %r31
	.word 0xb7a81420  ! 3347: FMOVRNZ	dis not found

	.word 0xb3a4c9c0  ! 3348: FDIVd	fdivd	%f50, %f0, %f56
cpu_intr_1_255:
	setx	0x390301, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_256:
	setx	0x38013e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_280:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_280), 16, 16)) -> intp(1, 0, 2b)
iob_intr_1_281:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_281), 16, 16)) -> intp(1, 0, 13)
	.word 0xb4c5e0be  ! 3353: ADDCcc_I	addccc 	%r23, 0x00be, %r26
	.word 0xbba00540  ! 3356: FSQRTd	fsqrt	
iob_intr_1_282:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_282), 16, 16)) -> intp(1, 0, 32)
	.word 0xb0b46080  ! 3358: SUBCcc_I	orncc 	%r17, 0x0080, %r24
T1_asi_reg_rd_136:
	mov	0x3c0, %r14
	.word 0xf2db89e0  ! 3363: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb1a81420  ! 3364: FMOVRNZ	dis not found

T1_asi_reg_rd_137:
	mov	0x33, %r14
	.word 0xf2db8e80  ! 3368: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_1_283:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_283), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb9a81820  ! 3374: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xbda00540  ! 3375: FSQRTd	fsqrt	
cpu_intr_1_257:
	setx	0x38002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a44960  ! 3379: FMULq	dis not found

T1_asi_reg_rd_138:
	mov	0x3c8, %r14
	.word 0xfcdb8e60  ! 3381: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T1_asi_reg_wr_172:
	mov	0x1d, %r14
	.word 0xf2f38e80  ! 3382: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb00c0000  ! 3383: AND_R	and 	%r16, %r0, %r24
	.word 0xb1a509c0  ! 3384: FDIVd	fdivd	%f20, %f0, %f24
	.word 0xbda48860  ! 3391: FADDq	dis not found

cpu_intr_1_258:
	setx	0x3a0218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a58820  ! 3396: FADDs	fadds	%f22, %f0, %f24
cpu_intr_1_259:
	setx	0x390022, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_260:
	setx	0x3b0323, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_284:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_284), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb5abc820  ! 3404: FMOVVC	fmovs	%fcc1, %f0, %f26
cpu_intr_1_261:
	setx	0x3a0106, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_285:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_285), 16, 16)) -> intp(1, 0, 19)
	.word 0xb53ce001  ! 3409: SRA_I	sra 	%r19, 0x0001, %r26
	.word 0xba1d8000  ! 3411: XOR_R	xor 	%r22, %r0, %r29
	.word 0xb89c8000  ! 3414: XORcc_R	xorcc 	%r18, %r0, %r28
T1_asi_reg_rd_139:
	mov	0x3c4, %r14
	.word 0xf2db8e60  ! 3420: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xb5ab8820  ! 3423: FMOVPOS	fmovs	%fcc1, %f0, %f26
cpu_intr_1_262:
	setx	0x10305, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_263:
	setx	0x38000e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_173:
	mov	0xa, %r14
	.word 0xfaf38e80  ! 3427: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T1_asi_reg_rd_140:
	mov	0x3c1, %r14
	.word 0xf0db8e80  ! 3428: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T1_asi_reg_rd_141:
	mov	0xf, %r14
	.word 0xf4db8e80  ! 3430: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb5a4c820  ! 3433: FADDs	fadds	%f19, %f0, %f26
	.word 0xbda508e0  ! 3434: FSUBq	dis not found

	.word 0xb7a488c0  ! 3438: FSUBd	fsubd	%f18, %f0, %f58
	.word 0xb3a80420  ! 3440: FMOVRZ	dis not found

	.word 0xbb510000  ! 3441: RDPR_TICK	<illegal instruction>
	.word 0xbfa588e0  ! 3442: FSUBq	dis not found

T1_asi_reg_wr_174:
	mov	0x3c3, %r14
	.word 0xf0f38e40  ! 3443: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbfa81c20  ! 3445: FMOVRGEZ	dis not found

	.word 0xbba44920  ! 3447: FMULs	fmuls	%f17, %f0, %f29
cpu_intr_1_264:
	setx	0x3b0139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00520  ! 3451: FSQRTs	fsqrt	
	.word 0xb9a448a0  ! 3452: FSUBs	fsubs	%f17, %f0, %f28
	.word 0xb0144000  ! 3454: OR_R	or 	%r17, %r0, %r24
T1_asi_reg_rd_142:
	mov	0x10, %r14
	.word 0xfedb8400  ! 3456: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_1_286:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_286), 16, 16)) -> intp(1, 0, 2)
iob_intr_1_287:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_287), 16, 16)) -> intp(1, 0, 5)
cpu_intr_1_265:
	setx	0x3a0229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a48940  ! 3471: FMULd	fmuld	%f18, %f0, %f24
cpu_intr_1_266:
	setx	0x3a002b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_267:
	setx	0x39001e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_268:
	setx	0x3a032e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_143:
	mov	0x32, %r14
	.word 0xf8db8e80  ! 3477: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb9abc820  ! 3478: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xbbab4820  ! 3479: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xbfa00540  ! 3483: FSQRTd	fsqrt	
	.word 0xbda84820  ! 3486: FMOVE	fmovs	%fcc1, %f0, %f30
cpu_intr_1_269:
	setx	0x3a001c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_288:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_288), 16, 16)) -> intp(1, 0, a)
iob_intr_1_289:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_289), 16, 16)) -> intp(1, 0, 29)
	.word 0xb0348000  ! 3494: ORN_R	orn 	%r18, %r0, %r24
T1_asi_reg_rd_144:
	mov	0x3c4, %r14
	.word 0xfedb8e60  ! 3495: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T1_asi_reg_rd_145:
	mov	0xa, %r14
	.word 0xf4db89e0  ! 3499: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T1_asi_reg_wr_175:
	mov	0x3c8, %r14
	.word 0xfef38e60  ! 3500: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb3a44860  ! 3504: FADDq	dis not found

	.word 0xb9a00040  ! 3508: FMOVd	fmovd	%f0, %f28
	.word 0xb7abc820  ! 3509: FMOVVC	fmovs	%fcc1, %f0, %f27
cpu_intr_1_270:
	setx	0x380304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a44840  ! 3525: FADDd	faddd	%f48, %f0, %f56
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_290:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_290), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb825a0e0  ! 3529: SUB_I	sub 	%r22, 0x00e0, %r28
cpu_intr_1_271:
	setx	0x3b0104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00560  ! 3531: FSQRTq	fsqrt	
	.word 0xb1aa0820  ! 3533: FMOVA	fmovs	%fcc1, %f0, %f24
iob_intr_1_291:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_291), 16, 16)) -> intp(1, 0, 7)
iob_intr_1_292:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_292), 16, 16)) -> intp(1, 0, 7)
	.word 0xb7a90820  ! 3539: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb9ab4820  ! 3541: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb3a448c0  ! 3542: FSUBd	fsubd	%f48, %f0, %f56
T1_asi_reg_rd_146:
	mov	0x5, %r14
	.word 0xf4db8e40  ! 3543: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_1_272:
	setx	0x3b0031, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_147:
	mov	0x3c2, %r14
	.word 0xfadb89e0  ! 3546: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_1_293:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_293), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb73ce001  ! 3549: SRA_I	sra 	%r19, 0x0001, %r27
T1_asi_reg_wr_176:
	mov	0x19, %r14
	.word 0xf6f389e0  ! 3551: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T1_asi_reg_wr_177:
	mov	0x2d, %r14
	.word 0xf0f38400  ! 3555: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T1_asi_reg_rd_148:
	mov	0x33, %r14
	.word 0xfcdb84a0  ! 3557: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T1_asi_reg_wr_178:
	mov	0x12, %r14
	.word 0xf0f384a0  ! 3558: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_1_273:
	setx	0x3b003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c9e0  ! 3563: FDIVq	dis not found

cpu_intr_1_274:
	setx	0x390100, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_275:
	setx	0x3a0005, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_276:
	setx	0x390101, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_179:
	mov	0x22, %r14
	.word 0xf2f38e40  ! 3569: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb9a549a0  ! 3570: FDIVs	fdivs	%f21, %f0, %f28
T1_asi_reg_wr_180:
	mov	0x3c5, %r14
	.word 0xf0f38e40  ! 3572: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_1_294:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_294), 16, 16)) -> intp(1, 0, 22)
cpu_intr_1_277:
	setx	0x380302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda54920  ! 3575: FMULs	fmuls	%f21, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a00040  ! 3578: FMOVd	fmovd	%f0, %f24
cpu_intr_1_278:
	setx	0x3a0100, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xbda9c820  ! 3585: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xbda00540  ! 3587: FSQRTd	fsqrt	
	.word 0xb1a8c820  ! 3589: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xbdab4820  ! 3591: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb5a509a0  ! 3592: FDIVs	fdivs	%f20, %f0, %f26
	.word 0xb42c4000  ! 3597: ANDN_R	andn 	%r17, %r0, %r26
cpu_intr_1_279:
	setx	0x3a0310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa58820  ! 3603: FADDs	fadds	%f22, %f0, %f31
	.word 0xb1a81c20  ! 3610: FMOVRGEZ	dis not found

	.word 0xb3ab0820  ! 3611: FMOVGU	fmovs	%fcc1, %f0, %f25
iob_intr_1_295:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_295), 16, 16)) -> intp(1, 0, 22)
iob_intr_1_296:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_296), 16, 16)) -> intp(1, 0, 33)
iob_intr_1_297:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_297), 16, 16)) -> intp(1, 0, 31)
cpu_intr_1_280:
	setx	0x3b030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda80820  ! 3619: FMOVN	fmovs	%fcc1, %f0, %f30
cpu_intr_1_281:
	setx	0x3b013a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_298:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_298), 16, 16)) -> intp(1, 0, 12)
	.word 0xb9a81420  ! 3622: FMOVRNZ	dis not found

cpu_intr_1_282:
	setx	0x3a0131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a50860  ! 3629: FADDq	dis not found

	.word 0xb3a5c8e0  ! 3630: FSUBq	dis not found

T1_asi_reg_wr_181:
	mov	0x3c3, %r14
	.word 0xf2f38400  ! 3632: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb02dc000  ! 3635: ANDN_R	andn 	%r23, %r0, %r24
	.word 0xbfa00540  ! 3636: FSQRTd	fsqrt	
	.word 0xb204a123  ! 3638: ADD_I	add 	%r18, 0x0123, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbda81820  ! 3641: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb3a80820  ! 3643: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xbda5c9e0  ! 3644: FDIVq	dis not found

iob_intr_1_299:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_299), 16, 16)) -> intp(1, 0, c)
	.word 0xb29c20ae  ! 3646: XORcc_I	xorcc 	%r16, 0x00ae, %r25
iob_intr_1_300:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_300), 16, 16)) -> intp(1, 0, c)
	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xbfa00520  ! 3652: FSQRTs	fsqrt	
cpu_intr_1_283:
	setx	0x390138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb01de1b1  ! 3654: XOR_I	xor 	%r23, 0x01b1, %r24
	.word 0xb5ab0820  ! 3656: FMOVGU	fmovs	%fcc1, %f0, %f26
cpu_intr_1_284:
	setx	0x3b0104, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_301:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_301), 16, 16)) -> intp(1, 0, 3a)
	.word 0xbfa589a0  ! 3667: FDIVs	fdivs	%f22, %f0, %f31
	.word 0xb3abc820  ! 3673: FMOVVC	fmovs	%fcc1, %f0, %f25
	lda	[%r19 + %g0] 0xf0, %f2
T1_asi_reg_rd_149:
	mov	0xc, %r14
	.word 0xf8db8e40  ! 3675: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_1_285:
	setx	0x3c0117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9ab0820  ! 3678: FMOVGU	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_182:
	mov	0x27, %r14
	.word 0xfcf384a0  ! 3679: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xb1a81820  ! 3685: FMOVRGZ	fmovs	%fcc3, %f0, %f24
iob_intr_1_302:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_302), 16, 16)) -> intp(1, 0, 13)
cpu_intr_1_286:
	setx	0x3e0013, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_287:
	setx	0x3d0128, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_303:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_303), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_288:
	setx	0x3d0334, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_304:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_304), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_305:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_305), 16, 16)) -> intp(1, 0, c)
	.word 0xbda54840  ! 3695: FADDd	faddd	%f52, %f0, %f30
T1_asi_reg_rd_150:
	mov	0x15, %r14
	.word 0xfedb89e0  ! 3696: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb1ab4820  ! 3698: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb9a80c20  ! 3699: FMOVRLZ	dis not found

iob_intr_1_306:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_306), 16, 16)) -> intp(1, 0, 27)
T1_asi_reg_wr_183:
	mov	0x13, %r14
	.word 0xfaf38e60  ! 3704: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb5a588e0  ! 3705: FSUBq	dis not found

iob_intr_1_307:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_307), 16, 16)) -> intp(1, 0, 25)
	.word 0xb9643801  ! 3709: MOVcc_I	<illegal instruction>
T1_asi_reg_rd_151:
	mov	0x37, %r14
	.word 0xf6db84a0  ! 3710: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_1_289:
	setx	0x3d0223, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_308:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_308), 16, 16)) -> intp(1, 0, 15)
	.word 0xb3643801  ! 3715: MOVcc_I	<illegal instruction>
iob_intr_1_309:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_309), 16, 16)) -> intp(1, 0, 35)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbba94820  ! 3724: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xbfa4c960  ! 3726: FMULq	dis not found

iob_intr_1_310:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_310), 16, 16)) -> intp(1, 0, 13)
	.word 0xb4bde0fb  ! 3731: XNORcc_I	xnorcc 	%r23, 0x00fb, %r26
	.word 0xbfa5c8a0  ! 3734: FSUBs	fsubs	%f23, %f0, %f31
iob_intr_1_311:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_311), 16, 16)) -> intp(1, 0, 5)
	.word 0xb3a00560  ! 3738: FSQRTq	fsqrt	
	.word 0xbba80820  ! 3739: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb9ab0820  ! 3741: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xb9a588e0  ! 3744: FSUBq	dis not found

	.word 0xb3a00520  ! 3745: FSQRTs	fsqrt	
iob_intr_1_312:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_312), 16, 16)) -> intp(1, 0, 18)
	.word 0xb7a81820  ! 3748: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xb9abc820  ! 3749: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xb5a50820  ! 3750: FADDs	fadds	%f20, %f0, %f26
iob_intr_1_313:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_313), 16, 16)) -> intp(1, 0, 0)
T1_asi_reg_rd_152:
	mov	0x1e, %r14
	.word 0xf2db89e0  ! 3755: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_1_314:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_314), 16, 16)) -> intp(1, 0, 13)
	.word 0xb3a00520  ! 3762: FSQRTs	fsqrt	
T1_asi_reg_wr_184:
	mov	0x15, %r14
	.word 0xf2f38400  ! 3763: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb7a00040  ! 3764: FMOVd	fmovd	%f0, %f58
	.word 0xb1a9c820  ! 3765: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb8b5e19a  ! 3766: ORNcc_I	orncc 	%r23, 0x019a, %r28
iob_intr_1_315:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_315), 16, 16)) -> intp(1, 0, 25)
cpu_intr_1_290:
	setx	0x3c023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a44820  ! 3771: FADDs	fadds	%f17, %f0, %f25
	.word 0xb1a00540  ! 3775: FSQRTd	fsqrt	
cpu_intr_1_291:
	setx	0x3d0128, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_316:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_316), 16, 16)) -> intp(1, 0, 36)
	.word 0xbfa9c820  ! 3786: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xbda80820  ! 3787: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_185:
	mov	0x1a, %r14
	.word 0xf6f384a0  ! 3792: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_1_317:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_317), 16, 16)) -> intp(1, 0, 7)
	.word 0xb3504000  ! 3797: RDPR_TNPC	<illegal instruction>
iob_intr_1_318:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_318), 16, 16)) -> intp(1, 0, 18)
	.word 0xb88ce0aa  ! 3800: ANDcc_I	andcc 	%r19, 0x00aa, %r28
T1_asi_reg_rd_153:
	mov	0x27, %r14
	.word 0xf8db8e40  ! 3801: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_1_292:
	setx	0x3d0220, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_293:
	setx	0x3d0231, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_319:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_319), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_rd_154:
	mov	0x3c8, %r14
	.word 0xfcdb8e60  ! 3806: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb350c000  ! 3807: RDPR_TT	<illegal instruction>
cpu_intr_1_294:
	setx	0x3c0339, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_320:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_320), 16, 16)) -> intp(1, 0, 37)
	.word 0xbba81820  ! 3816: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb7a88820  ! 3817: FMOVLE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_295:
	setx	0x3c0224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2bd21bd  ! 3828: XNORcc_I	xnorcc 	%r20, 0x01bd, %r25
T1_asi_reg_rd_155:
	mov	0x37, %r14
	.word 0xf6db84a0  ! 3830: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T1_asi_reg_wr_186:
	mov	0x25, %r14
	.word 0xf6f389e0  ! 3832: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_1_321:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_321), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_wr_187:
	mov	0x3c4, %r14
	.word 0xf0f389e0  ! 3837: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xbba81c20  ! 3839: FMOVRGEZ	dis not found

T1_asi_reg_wr_188:
	mov	0x32, %r14
	.word 0xfaf38e80  ! 3840: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_1_322:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_322), 16, 16)) -> intp(1, 0, 25)
iob_intr_1_323:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_323), 16, 16)) -> intp(1, 0, 21)
	.word 0xb5a81c20  ! 3847: FMOVRGEZ	dis not found

	.word 0xbd7c0400  ! 3848: MOVR_R	movre	%r16, %r0, %r30
	.word 0xb3a00520  ! 3855: FSQRTs	fsqrt	
T1_asi_reg_rd_156:
	mov	0x1f, %r14
	.word 0xf4db89e0  ! 3856: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb7aa0820  ! 3860: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb3a4c9a0  ! 3863: FDIVs	fdivs	%f19, %f0, %f25
	.word 0xb1a81c20  ! 3864: FMOVRGEZ	dis not found

	.word 0xb8348000  ! 3867: ORN_R	orn 	%r18, %r0, %r28
cpu_intr_1_296:
	setx	0x3d031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaa44000  ! 3869: SUBcc_R	subcc 	%r17, %r0, %r29
iob_intr_1_324:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_324), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbda00540  ! 3874: FSQRTd	fsqrt	
	.word 0xb1a549e0  ! 3875: FDIVq	dis not found

iob_intr_1_325:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_325), 16, 16)) -> intp(1, 0, 18)
cpu_intr_1_297:
	setx	0x3e0138, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_298:
	setx	0x3c023b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_189:
	mov	0x1a, %r14
	.word 0xf4f38e80  ! 3882: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_1_326:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_326), 16, 16)) -> intp(1, 0, 21)
	.word 0xb1a448e0  ! 3885: FSUBq	dis not found

	.word 0xb7a508e0  ! 3889: FSUBq	dis not found

	.word 0x8995e15f  ! 3891: WRPR_TICK_I	wrpr	%r23, 0x015f, %tick
	.word 0xb7a4c820  ! 3892: FADDs	fadds	%f19, %f0, %f27
	.word 0xbfa40940  ! 3893: FMULd	fmuld	%f16, %f0, %f62
	.word 0xb9a58820  ! 3894: FADDs	fadds	%f22, %f0, %f28
	.word 0xb1a5c840  ! 3895: FADDd	faddd	%f54, %f0, %f24
T1_asi_reg_wr_190:
	mov	0x3c8, %r14
	.word 0xf4f389e0  ! 3896: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T1_asi_reg_wr_191:
	mov	0x18, %r14
	.word 0xfaf38e40  ! 3897: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbba00520  ! 3898: FSQRTs	fsqrt	
T1_asi_reg_rd_157:
	mov	0xd, %r14
	.word 0xfadb8e60  ! 3901: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_1_299:
	setx	0x3c0008, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_158:
	mov	0x1, %r14
	.word 0xf8db84a0  ! 3906: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbc45c000  ! 3909: ADDC_R	addc 	%r23, %r0, %r30
iob_intr_1_327:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_327), 16, 16)) -> intp(1, 0, e)
T1_asi_reg_rd_159:
	mov	0x3c4, %r14
	.word 0xf4db8e80  ! 3912: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T1_asi_reg_rd_160:
	mov	0x3c6, %r14
	.word 0xfcdb8e80  ! 3914: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_1_328:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_328), 16, 16)) -> intp(1, 0, 29)
iob_intr_1_329:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_329), 16, 16)) -> intp(1, 0, 1e)
iob_intr_1_330:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_330), 16, 16)) -> intp(1, 0, 13)
T1_asi_reg_wr_192:
	mov	0x4, %r14
	.word 0xfef38e80  ! 3924: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T1_asi_reg_rd_161:
	mov	0x30, %r14
	.word 0xfedb8e40  ! 3925: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb5a81420  ! 3926: FMOVRNZ	dis not found

T1_asi_reg_wr_193:
	mov	0x13, %r14
	.word 0xf4f389e0  ! 3928: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xbda409c0  ! 3932: FDIVd	fdivd	%f16, %f0, %f30
	.word 0xbba449e0  ! 3934: FDIVq	dis not found

cpu_intr_1_300:
	setx	0x3c0015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a90820  ! 3937: FMOVLEU	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_194:
	mov	0x3c0, %r14
	.word 0xf4f38e60  ! 3938: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb9a81c20  ! 3939: FMOVRGEZ	dis not found

	.word 0xb12ce001  ! 3940: SLL_I	sll 	%r19, 0x0001, %r24
	.word 0xbfa00040  ! 3941: FMOVd	fmovd	%f0, %f62
T1_asi_reg_wr_195:
	mov	0x13, %r14
	.word 0xf0f38e80  ! 3942: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbba588a0  ! 3944: FSUBs	fsubs	%f22, %f0, %f29
	.word 0xb7a58840  ! 3946: FADDd	faddd	%f22, %f0, %f58
	.word 0xb5a44920  ! 3949: FMULs	fmuls	%f17, %f0, %f26
T1_asi_reg_wr_196:
	mov	0x3c3, %r14
	.word 0xfaf384a0  ! 3952: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbf643801  ! 3953: MOVcc_I	<illegal instruction>
T1_asi_reg_rd_162:
	mov	0x3c7, %r14
	.word 0xfcdb8400  ! 3954: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb8b5e02e  ! 3957: ORNcc_I	orncc 	%r23, 0x002e, %r28
T1_asi_reg_wr_197:
	mov	0x21, %r14
	.word 0xf4f38400  ! 3960: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb9aac820  ! 3961: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xbda00520  ! 3962: FSQRTs	fsqrt	
	.word 0xb7a84820  ! 3964: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xbba509e0  ! 3965: FDIVq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	lda	[%r22 + %g0] 0xf0, %f2
iob_intr_1_331:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_331), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb73d1000  ! 3973: SRAX_R	srax	%r20, %r0, %r27
T1_asi_reg_rd_163:
	mov	0x2b, %r14
	.word 0xf6db84a0  ! 3976: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb7aa4820  ! 3977: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb5a81820  ! 3979: FMOVRGZ	fmovs	%fcc3, %f0, %f26
cpu_intr_1_301:
	setx	0x3f010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab8820  ! 3981: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xbba00560  ! 3982: FSQRTq	fsqrt	
	.word 0xbfa80c20  ! 3984: FMOVRLZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_302:
	setx	0x3f030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a98820  ! 3988: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb7aa0820  ! 3994: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb815a132  ! 3995: OR_I	or 	%r22, 0x0132, %r28
	.word 0xbdab4820  ! 3996: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb3a00020  ! 3998: FMOVs	fmovs	%f0, %f25
iob_intr_1_332:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_332), 16, 16)) -> intp(1, 0, 21)
	.word 0xbfa548c0  ! 4004: FSUBd	fsubd	%f52, %f0, %f62
T1_asi_reg_wr_198:
	mov	0x28, %r14
	.word 0xf2f38e80  ! 4007: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbfab4820  ! 4010: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb9a50960  ! 4014: FMULq	dis not found

T1_asi_reg_rd_164:
	mov	0x16, %r14
	.word 0xfcdb8400  ! 4017: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T1_asi_reg_wr_199:
	mov	0x7, %r14
	.word 0xf8f38e80  ! 4018: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb7a00540  ! 4019: FSQRTd	fsqrt	
	.word 0xb3a8c820  ! 4020: FMOVL	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_200:
	mov	0x3c5, %r14
	.word 0xf0f38e40  ! 4021: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb5a4c940  ! 4025: FMULd	fmuld	%f50, %f0, %f26
T1_asi_reg_rd_165:
	mov	0xd, %r14
	.word 0xfedb8400  ! 4026: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_1_303:
	setx	0x3f012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda81820  ! 4029: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb9a80420  ! 4031: FMOVRZ	dis not found

	.word 0xba046037  ! 4033: ADD_I	add 	%r17, 0x0037, %r29
	.word 0xb7a40820  ! 4039: FADDs	fadds	%f16, %f0, %f27
cpu_intr_1_304:
	setx	0x3c0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda98820  ! 4044: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xbfa80820  ! 4047: FMOVN	fmovs	%fcc1, %f0, %f31
cpu_intr_1_305:
	setx	0x3f0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbab4a048  ! 4050: SUBCcc_I	orncc 	%r18, 0x0048, %r29
T1_asi_reg_wr_201:
	mov	0x30, %r14
	.word 0xf4f389e0  ! 4052: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb3a00040  ! 4053: FMOVd	fmovd	%f0, %f56
	.word 0xb4c5217c  ! 4059: ADDCcc_I	addccc 	%r20, 0x017c, %r26
cpu_intr_1_306:
	setx	0x3c0314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb225612f  ! 4061: SUB_I	sub 	%r21, 0x012f, %r25
	.word 0xbda90820  ! 4063: FMOVLEU	fmovs	%fcc1, %f0, %f30
cpu_intr_1_307:
	setx	0x3c011f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_308:
	setx	0x3013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda588e0  ! 4067: FSUBq	dis not found

cpu_intr_1_309:
	setx	0x3f0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb83ce0ea  ! 4069: XNOR_I	xnor 	%r19, 0x00ea, %r28
iob_intr_1_333:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_333), 16, 16)) -> intp(1, 0, 28)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_310:
	setx	0x3e0012, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_334:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_334), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_rd_166:
	mov	0xa, %r14
	.word 0xf0db84a0  ! 4081: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbc3da085  ! 4082: XNOR_I	xnor 	%r22, 0x0085, %r30
T1_asi_reg_rd_167:
	mov	0x3c0, %r14
	.word 0xfcdb8e40  ! 4085: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_1_311:
	setx	0x3e0317, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_168:
	mov	0x7, %r14
	.word 0xf4db8e40  ! 4089: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbba80c20  ! 4090: FMOVRLZ	dis not found

	.word 0xbda588a0  ! 4091: FSUBs	fsubs	%f22, %f0, %f30
iob_intr_1_335:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_335), 16, 16)) -> intp(1, 0, 1b)
cpu_intr_1_312:
	setx	0x3c0311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab0820  ! 4097: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xbca54000  ! 4101: SUBcc_R	subcc 	%r21, %r0, %r30
	.word 0xb1ab0820  ! 4102: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0x899521ba  ! 4103: WRPR_TICK_I	wrpr	%r20, 0x01ba, %tick
cpu_intr_1_313:
	setx	0x3e0316, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_169:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 4106: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb3a508e0  ! 4108: FSUBq	dis not found

	.word 0xb5a8c820  ! 4111: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xb494611b  ! 4112: ORcc_I	orcc 	%r17, 0x011b, %r26
	.word 0xbfabc820  ! 4114: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb5a40840  ! 4115: FADDd	faddd	%f16, %f0, %f26
iob_intr_1_336:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_336), 16, 16)) -> intp(1, 0, 7)
cpu_intr_1_314:
	setx	0x410306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba4c820  ! 4125: FADDs	fadds	%f19, %f0, %f29
cpu_intr_1_315:
	setx	0x420314, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_316:
	setx	0x430335, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_337:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_337), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_317:
	setx	0x40032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfabc820  ! 4135: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xbfa81820  ! 4137: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb5a81820  ! 4138: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb5a80820  ! 4140: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_318:
	setx	0x41001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a90820  ! 4146: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xbfa80820  ! 4147: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xbfa488a0  ! 4149: FSUBs	fsubs	%f18, %f0, %f31
	.word 0xb3a588e0  ! 4150: FSUBq	dis not found

	.word 0xbfa40840  ! 4151: FADDd	faddd	%f16, %f0, %f62
cpu_intr_1_319:
	setx	0x410332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0bd2139  ! 4155: XNORcc_I	xnorcc 	%r20, 0x0139, %r24
cpu_intr_1_320:
	setx	0x430132, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_202:
	mov	0x30, %r14
	.word 0xf8f389e0  ! 4160: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb635c000  ! 4161: SUBC_R	orn 	%r23, %r0, %r27
iob_intr_1_338:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_338), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_rd_170:
	mov	0x3c2, %r14
	.word 0xf4db8e40  ! 4165: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb3a449a0  ! 4166: FDIVs	fdivs	%f17, %f0, %f25
T1_asi_reg_wr_203:
	mov	0x8, %r14
	.word 0xfef38e40  ! 4169: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb1a00040  ! 4171: FMOVd	fmovd	%f0, %f24
cpu_intr_1_321:
	setx	0x40011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a81420  ! 4175: FMOVRNZ	dis not found

iob_intr_1_339:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_339), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_340:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_340), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_rd_171:
	mov	0x10, %r14
	.word 0xfcdb8e60  ! 4180: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_1_341:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_341), 16, 16)) -> intp(1, 0, 1a)
	.word 0xbfa00020  ! 4182: FMOVs	fmovs	%f0, %f31
	.word 0xbac521c9  ! 4183: ADDCcc_I	addccc 	%r20, 0x01c9, %r29
	.word 0xb1a40960  ! 4185: FMULq	dis not found

	.word 0xbfa00520  ! 4186: FSQRTs	fsqrt	
	.word 0xba8c4000  ! 4194: ANDcc_R	andcc 	%r17, %r0, %r29
	.word 0xb9a48960  ! 4197: FMULq	dis not found

	.word 0xb7a84820  ! 4199: FMOVE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_172:
	mov	0x3c3, %r14
	.word 0xf2db84a0  ! 4200: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb5ab8820  ! 4201: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb3a50940  ! 4202: FMULd	fmuld	%f20, %f0, %f56
cpu_intr_1_322:
	setx	0x430028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd353001  ! 4205: SRLX_I	srlx	%r20, 0x0001, %r30
T1_asi_reg_wr_204:
	mov	0x1d, %r14
	.word 0xf8f38e40  ! 4206: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_323:
	setx	0x410105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe046197  ! 4209: ADD_I	add 	%r17, 0x0197, %r31
iob_intr_1_342:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_342), 16, 16)) -> intp(1, 0, 8)
cpu_intr_1_324:
	setx	0x400007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aa0820  ! 4218: FMOVA	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_173:
	mov	0x3c6, %r14
	.word 0xfcdb8e80  ! 4219: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T1_asi_reg_wr_205:
	mov	0x37, %r14
	.word 0xf8f38e60  ! 4221: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb9ab0820  ! 4222: FMOVGU	fmovs	%fcc1, %f0, %f28
cpu_intr_1_325:
	setx	0x400030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbac42117  ! 4227: ADDCcc_I	addccc 	%r16, 0x0117, %r29
T1_asi_reg_wr_206:
	mov	0x28, %r14
	.word 0xfcf38e60  ! 4229: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbc3dc000  ! 4230: XNOR_R	xnor 	%r23, %r0, %r30
	.word 0xbda98820  ! 4232: FMOVNEG	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_207:
	mov	0x3c2, %r14
	.word 0xf4f38400  ! 4233: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_1_343:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_343), 16, 16)) -> intp(1, 0, 3d)
iob_intr_1_344:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_344), 16, 16)) -> intp(1, 0, 15)
iob_intr_1_345:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_345), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_rd_174:
	mov	0x3c7, %r14
	.word 0xfedb8e40  ! 4239: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T1_asi_reg_wr_208:
	mov	0x27, %r14
	.word 0xf6f38e40  ! 4241: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_326:
	setx	0x420203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc9460b9  ! 4252: ORcc_I	orcc 	%r17, 0x00b9, %r30
	.word 0xb82cc000  ! 4253: ANDN_R	andn 	%r19, %r0, %r28
	.word 0xb6c461c6  ! 4254: ADDCcc_I	addccc 	%r17, 0x01c6, %r27
	.word 0xb5a5c8a0  ! 4257: FSUBs	fsubs	%f23, %f0, %f26
T1_asi_reg_rd_175:
	mov	0xc, %r14
	.word 0xf4db8e40  ! 4258: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb9aac820  ! 4266: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xbfa80820  ! 4268: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xbda00540  ! 4270: FSQRTd	fsqrt	
	.word 0xb7a488c0  ! 4271: FSUBd	fsubd	%f18, %f0, %f58
iob_intr_1_346:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_346), 16, 16)) -> intp(1, 0, 24)
	.word 0xb5a98820  ! 4274: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb8140000  ! 4275: OR_R	or 	%r16, %r0, %r28
	.word 0xbdab0820  ! 4277: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb434a0aa  ! 4278: ORN_I	orn 	%r18, 0x00aa, %r26
T1_asi_reg_rd_176:
	mov	0x2a, %r14
	.word 0xf4db84a0  ! 4281: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_1_347:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_347), 16, 16)) -> intp(1, 0, e)
cpu_intr_1_327:
	setx	0x41003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda48820  ! 4289: FADDs	fadds	%f18, %f0, %f30
T1_asi_reg_rd_177:
	mov	0x3c6, %r14
	.word 0xf2db84a0  ! 4290: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbba8c820  ! 4291: FMOVL	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_209:
	mov	0x3c1, %r14
	.word 0xf4f38e80  ! 4296: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_1_328:
	setx	0x40010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aac820  ! 4298: FMOVGE	fmovs	%fcc1, %f0, %f27
iob_intr_1_348:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_348), 16, 16)) -> intp(1, 0, 2d)
iob_intr_1_349:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_349), 16, 16)) -> intp(1, 0, 13)
cpu_intr_1_329:
	setx	0x43030f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_210:
	mov	0x0, %r14
	.word 0xf2f384a0  ! 4303: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_1_350:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_350), 16, 16)) -> intp(1, 0, 33)
	.word 0xb3a44960  ! 4308: FMULq	dis not found

	.word 0xbfabc820  ! 4310: FMOVVC	fmovs	%fcc1, %f0, %f31
iob_intr_1_351:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_351), 16, 16)) -> intp(1, 0, e)
iob_intr_1_352:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_352), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_wr_211:
	mov	0x7, %r14
	.word 0xf4f384a0  ! 4314: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbba44820  ! 4315: FADDs	fadds	%f17, %f0, %f29
	.word 0xb1a40940  ! 4316: FMULd	fmuld	%f16, %f0, %f24
	lda	[%r20 + %g0] 0xf0, %f2
	.word 0xb3a80420  ! 4322: FMOVRZ	dis not found

T1_asi_reg_wr_212:
	mov	0x1b, %r14
	.word 0xfaf389e0  ! 4323: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_1_353:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_353), 16, 16)) -> intp(1, 0, 3f)
iob_intr_1_354:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_354), 16, 16)) -> intp(1, 0, 10)
T1_asi_reg_wr_213:
	mov	0x17, %r14
	.word 0xfaf38e40  ! 4336: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb80ce12c  ! 4337: AND_I	and 	%r19, 0x012c, %r28
T1_asi_reg_wr_214:
	mov	0x2b, %r14
	.word 0xfaf389e0  ! 4338: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbfa48840  ! 4339: FADDd	faddd	%f18, %f0, %f62
iob_intr_1_355:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_355), 16, 16)) -> intp(1, 0, 23)
	.word 0xb3a98820  ! 4341: FMOVNEG	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5518000  ! 4344: RDPR_PSTATE	<illegal instruction>
cpu_intr_1_330:
	setx	0x42002b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_331:
	setx	0x42000e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_356:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_356), 16, 16)) -> intp(1, 0, 3d)
	.word 0xbba00040  ! 4354: FMOVd	fmovd	%f0, %f60
	.word 0xbda00020  ! 4357: FMOVs	fmovs	%f0, %f30
	.word 0xb5ab8820  ! 4360: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0x8195e1b7  ! 4361: WRPR_TPC_I	wrpr	%r23, 0x01b7, %tpc
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a00520  ! 4364: FSQRTs	fsqrt	
	.word 0xbfa00540  ! 4365: FSQRTd	fsqrt	
T1_asi_reg_wr_215:
	mov	0x22, %r14
	.word 0xf6f38e40  ! 4366: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_332:
	setx	0x40013d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_357:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_357), 16, 16)) -> intp(1, 0, 1f)
cpu_intr_1_333:
	setx	0x40023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6350000  ! 4371: SUBC_R	orn 	%r20, %r0, %r27
T1_asi_reg_rd_178:
	mov	0x1c, %r14
	.word 0xfcdb8e40  ! 4374: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb1a81420  ! 4376: FMOVRNZ	dis not found

	.word 0xbdab4820  ! 4377: FMOVCC	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_179:
	mov	0x3c2, %r14
	.word 0xf6db8e40  ! 4379: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_334:
	setx	0x410222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfab0820  ! 4382: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb7aac820  ! 4384: FMOVGE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_180:
	mov	0x34, %r14
	.word 0xfcdb89e0  ! 4386: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbfa5c8e0  ! 4387: FSUBq	dis not found

	.word 0xb1a54940  ! 4389: FMULd	fmuld	%f52, %f0, %f24
	.word 0xbf643801  ! 4391: MOVcc_I	<illegal instruction>
	lda	[%r16 + %g0] 0xf0, %f2
iob_intr_1_358:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_358), 16, 16)) -> intp(1, 0, 20)
	.word 0xb9a4c9a0  ! 4394: FDIVs	fdivs	%f19, %f0, %f28
	.word 0x8d9420fe  ! 4395: WRPR_PSTATE_I	wrpr	%r16, 0x00fe, %pstate
iob_intr_1_359:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_359), 16, 16)) -> intp(1, 0, 25)
	.word 0xbfa00020  ! 4398: FMOVs	fmovs	%f0, %f31
	.word 0xb934d000  ! 4400: SRLX_R	srlx	%r19, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_360:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_360), 16, 16)) -> intp(1, 0, 2)
cpu_intr_1_335:
	setx	0x430229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaa4820  ! 4406: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xb3a00520  ! 4408: FSQRTs	fsqrt	
T1_asi_reg_wr_216:
	mov	0xb, %r14
	.word 0xf6f389e0  ! 4411: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb7aa0820  ! 4413: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xbfab4820  ! 4414: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xbe0de0e3  ! 4418: AND_I	and 	%r23, 0x00e3, %r31
T1_asi_reg_wr_217:
	mov	0xa, %r14
	.word 0xfaf38e40  ! 4422: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_1_361:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_361), 16, 16)) -> intp(1, 0, 6)
	.word 0xb3a588e0  ! 4427: FSUBq	dis not found

	.word 0xbb3c1000  ! 4429: SRAX_R	srax	%r16, %r0, %r29
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xb84461ca  ! 4433: ADDC_I	addc 	%r17, 0x01ca, %r28
	.word 0xb8a46083  ! 4435: SUBcc_I	subcc 	%r17, 0x0083, %r28
T1_asi_reg_rd_181:
	mov	0x27, %r14
	.word 0xfedb84a0  ! 4438: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T1_asi_reg_rd_182:
	mov	0x3c1, %r14
	.word 0xf8db89e0  ! 4445: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T1_asi_reg_wr_218:
	mov	0x24, %r14
	.word 0xfaf38e40  ! 4451: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbba50940  ! 4452: FMULd	fmuld	%f20, %f0, %f60
iob_intr_1_362:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_362), 16, 16)) -> intp(1, 0, 3b)
cpu_intr_1_336:
	setx	0x430120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3504000  ! 4457: RDPR_TNPC	<illegal instruction>
cpu_intr_1_337:
	setx	0x41001b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_338:
	setx	0x400231, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_219:
	mov	0x20, %r14
	.word 0xf8f38e80  ! 4464: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_1_339:
	setx	0x40002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a54820  ! 4466: FADDs	fadds	%f21, %f0, %f27
iob_intr_1_363:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_363), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbfa48840  ! 4471: FADDd	faddd	%f18, %f0, %f62
T1_asi_reg_rd_183:
	mov	0x11, %r14
	.word 0xfadb8e40  ! 4475: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_wr_220:
	mov	0x2f, %r14
	.word 0xf4f38e60  ! 4476: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xbba00560  ! 4477: FSQRTq	fsqrt	
	.word 0xbbab0820  ! 4478: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb28de1cf  ! 4480: ANDcc_I	andcc 	%r23, 0x01cf, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a50940  ! 4484: FMULd	fmuld	%f20, %f0, %f58
iob_intr_1_364:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_364), 16, 16)) -> intp(1, 0, e)
cpu_intr_1_340:
	setx	0x410337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5ab8820  ! 4494: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xbd510000  ! 4498: RDPR_TICK	<illegal instruction>
	.word 0xb1a54860  ! 4500: FADDq	dis not found

iob_intr_1_365:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_365), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb9a00560  ! 4503: FSQRTq	fsqrt	
T1_asi_reg_rd_184:
	mov	0x25, %r14
	.word 0xf2db8e40  ! 4505: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbda488a0  ! 4507: FSUBs	fsubs	%f18, %f0, %f30
T1_asi_reg_wr_221:
	mov	0x3c6, %r14
	.word 0xf0f384a0  ! 4514: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb8058000  ! 4519: ADD_R	add 	%r22, %r0, %r28
	.word 0xbba54940  ! 4521: FMULd	fmuld	%f52, %f0, %f60
iob_intr_1_366:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_366), 16, 16)) -> intp(1, 0, 1a)
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xb5a80420  ! 4527: FMOVRZ	dis not found

	.word 0xb1a408a0  ! 4530: FSUBs	fsubs	%f16, %f0, %f24
T1_asi_reg_wr_222:
	mov	0x1b, %r14
	.word 0xf8f389e0  ! 4531: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb551c000  ! 4532: RDPR_TL	<illegal instruction>
iob_intr_1_367:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_367), 16, 16)) -> intp(1, 0, 30)
	.word 0xb3a509a0  ! 4534: FDIVs	fdivs	%f20, %f0, %f25
cpu_intr_1_341:
	setx	0x420015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a48860  ! 4536: FADDq	dis not found

T1_asi_reg_wr_223:
	mov	0x23, %r14
	.word 0xf2f384a0  ! 4540: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T1_asi_reg_rd_185:
	mov	0x3c3, %r14
	.word 0xf0db8400  ! 4544: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_wr_224:
	mov	0x3c1, %r14
	.word 0xf4f38e60  ! 4545: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_1_368:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_368), 16, 16)) -> intp(1, 0, 0)
cpu_intr_1_342:
	setx	0x42012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_343:
	setx	0x410215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a40820  ! 4552: FADDs	fadds	%f16, %f0, %f25
	.word 0xb9ab4820  ! 4553: FMOVCC	fmovs	%fcc1, %f0, %f28
cpu_intr_1_344:
	setx	0x430003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a84820  ! 4556: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xbfa80820  ! 4557: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_225:
	mov	0x3c7, %r14
	.word 0xf8f38400  ! 4559: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_1_369:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_369), 16, 16)) -> intp(1, 0, 30)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbabc210b  ! 4567: XNORcc_I	xnorcc 	%r16, 0x010b, %r29
T1_asi_reg_wr_226:
	mov	0x3c5, %r14
	.word 0xf8f389e0  ! 4568: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb00c8000  ! 4574: AND_R	and 	%r18, %r0, %r24
iob_intr_1_370:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_370), 16, 16)) -> intp(1, 0, 8)
	.word 0xb4c48000  ! 4577: ADDCcc_R	addccc 	%r18, %r0, %r26
	.word 0xb3a90820  ! 4578: FMOVLEU	fmovs	%fcc1, %f0, %f25
iob_intr_1_371:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_371), 16, 16)) -> intp(1, 0, e)
	.word 0xb92d9000  ! 4581: SLLX_R	sllx	%r22, %r0, %r28
	.word 0xb5508000  ! 4582: RDPR_TSTATE	<illegal instruction>
cpu_intr_1_345:
	setx	0x44021a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_227:
	mov	0x3c2, %r14
	.word 0xfcf38e40  ! 4585: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_1_346:
	setx	0x44001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb684a0fd  ! 4587: ADDcc_I	addcc 	%r18, 0x00fd, %r27
	.word 0xb7a588a0  ! 4588: FSUBs	fsubs	%f22, %f0, %f27
	.word 0xbfa00540  ! 4589: FSQRTd	fsqrt	
	.word 0xb9aa4820  ! 4592: FMOVNE	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_186:
	mov	0x25, %r14
	.word 0xfedb8e80  ! 4593: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb4352005  ! 4594: SUBC_I	orn 	%r20, 0x0005, %r26
	.word 0xbe9d6188  ! 4596: XORcc_I	xorcc 	%r21, 0x0188, %r31
iob_intr_1_372:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_372), 16, 16)) -> intp(1, 0, 18)
	.word 0xbfab0820  ! 4599: FMOVGU	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_228:
	mov	0x14, %r14
	.word 0xf4f384a0  ! 4603: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbb504000  ! 4605: RDPR_TNPC	<illegal instruction>
T1_asi_reg_rd_187:
	mov	0x3c3, %r14
	.word 0xf6db84a0  ! 4607: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_1_347:
	setx	0x44012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa449c0  ! 4609: FDIVd	fdivd	%f48, %f0, %f62
T1_asi_reg_wr_229:
	mov	0x5, %r14
	.word 0xfaf384a0  ! 4612: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb5a00540  ! 4615: FSQRTd	fsqrt	
	.word 0xb4240000  ! 4616: SUB_R	sub 	%r16, %r0, %r26
	.word 0xbf3da001  ! 4622: SRA_I	sra 	%r22, 0x0001, %r31
iob_intr_1_373:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_373), 16, 16)) -> intp(1, 0, 39)
	.word 0xb53d3001  ! 4629: SRAX_I	srax	%r20, 0x0001, %r26
T1_asi_reg_wr_230:
	mov	0x3c0, %r14
	.word 0xf6f38e60  ! 4630: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T1_asi_reg_rd_188:
	mov	0x33, %r14
	.word 0xfadb8400  ! 4631: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T1_asi_reg_rd_189:
	mov	0x38, %r14
	.word 0xf4db8e80  ! 4636: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T1_asi_reg_wr_231:
	mov	0x2b, %r14
	.word 0xf0f389e0  ! 4637: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb614e126  ! 4639: OR_I	or 	%r19, 0x0126, %r27
iob_intr_1_374:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_374), 16, 16)) -> intp(1, 0, 4)
cpu_intr_1_348:
	setx	0x470233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_349:
	setx	0x460311, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_375:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_375), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_350:
	setx	0x46001c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_376:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_376), 16, 16)) -> intp(1, 0, 35)
	.word 0xb1a81820  ! 4653: FMOVRGZ	fmovs	%fcc3, %f0, %f24
T1_asi_reg_rd_190:
	mov	0x4, %r14
	.word 0xf6db8e80  ! 4654: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb1a40840  ! 4655: FADDd	faddd	%f16, %f0, %f24
cpu_intr_1_351:
	setx	0x450234, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_352:
	setx	0x470333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba1d60b7  ! 4659: XOR_I	xor 	%r21, 0x00b7, %r29
iob_intr_1_377:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_377), 16, 16)) -> intp(1, 0, 8)
	.word 0xb93c4000  ! 4662: SRA_R	sra 	%r17, %r0, %r28
iob_intr_1_378:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_378), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb9504000  ! 4664: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_353:
	setx	0x46031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80420  ! 4671: FMOVRZ	dis not found

	.word 0xbda4c9e0  ! 4672: FDIVq	dis not found

T1_asi_reg_rd_191:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 4673: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb6adc000  ! 4674: ANDNcc_R	andncc 	%r23, %r0, %r27
iob_intr_1_379:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_379), 16, 16)) -> intp(1, 0, 33)
iob_intr_1_380:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_380), 16, 16)) -> intp(1, 0, 32)
	.word 0xb13c7001  ! 4678: SRAX_I	srax	%r17, 0x0001, %r24
T1_asi_reg_wr_232:
	mov	0x3c2, %r14
	.word 0xf0f38e80  ! 4680: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb5a50940  ! 4682: FMULd	fmuld	%f20, %f0, %f26
	.word 0xbfaa4820  ! 4683: FMOVNE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_192:
	mov	0x3c4, %r14
	.word 0xf8db8e40  ! 4684: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_1_354:
	setx	0x440001, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a54920  ! 4689: FMULs	fmuls	%f21, %f0, %f27
	.word 0xb9a80820  ! 4690: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xbc3d0000  ! 4693: XNOR_R	xnor 	%r20, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfa98820  ! 4695: FMOVNEG	fmovs	%fcc1, %f0, %f31
cpu_intr_1_355:
	setx	0x440027, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6944000  ! 4698: ORcc_R	orcc 	%r17, %r0, %r27
	.word 0xb3a81420  ! 4699: FMOVRNZ	dis not found

	.word 0xbba00560  ! 4701: FSQRTq	fsqrt	
T1_asi_reg_rd_193:
	mov	0x32, %r14
	.word 0xfcdb8e60  ! 4703: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T1_asi_reg_rd_194:
	mov	0x3c3, %r14
	.word 0xfcdb8e60  ! 4706: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T1_asi_reg_wr_233:
	mov	0x12, %r14
	.word 0xfaf38e60  ! 4707: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbbaa0820  ! 4709: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xbfa48840  ! 4710: FADDd	faddd	%f18, %f0, %f62
iob_intr_1_381:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_381), 16, 16)) -> intp(1, 0, 1a)
iob_intr_1_382:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_382), 16, 16)) -> intp(1, 0, 36)
iob_intr_1_383:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_383), 16, 16)) -> intp(1, 0, 17)
	.word 0xb9a00560  ! 4721: FSQRTq	fsqrt	
iob_intr_1_384:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_384), 16, 16)) -> intp(1, 0, b)
iob_intr_1_385:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_385), 16, 16)) -> intp(1, 0, 10)
	.word 0xb1a58920  ! 4728: FMULs	fmuls	%f22, %f0, %f24
T1_asi_reg_rd_195:
	mov	0x3c8, %r14
	.word 0xf4db8e80  ! 4730: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb81560d8  ! 4731: OR_I	or 	%r21, 0x00d8, %r28
	.word 0xb9a48820  ! 4732: FADDs	fadds	%f18, %f0, %f28
cpu_intr_1_356:
	setx	0x44013a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_357:
	setx	0x460108, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_386:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_386), 16, 16)) -> intp(1, 0, 3)
T1_asi_reg_wr_234:
	mov	0x3c1, %r14
	.word 0xf8f38e80  ! 4737: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T1_asi_reg_rd_196:
	mov	0x12, %r14
	.word 0xf4db8e40  ! 4740: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_wr_235:
	mov	0x3c7, %r14
	.word 0xfcf38e40  ! 4741: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_387:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_387), 16, 16)) -> intp(1, 0, 11)
T1_asi_reg_rd_197:
	mov	0x18, %r14
	.word 0xf8db8e40  ! 4747: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_1_388:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_388), 16, 16)) -> intp(1, 0, 30)
	.word 0xb1a4c8c0  ! 4756: FSUBd	fsubd	%f50, %f0, %f24
iob_intr_1_389:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_389), 16, 16)) -> intp(1, 0, 3a)
	.word 0xbec58000  ! 4761: ADDCcc_R	addccc 	%r22, %r0, %r31
cpu_intr_1_358:
	setx	0x450301, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_390:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_390), 16, 16)) -> intp(1, 0, 39)
iob_intr_1_391:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_391), 16, 16)) -> intp(1, 0, 1e)
iob_intr_1_392:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_392), 16, 16)) -> intp(1, 0, 3a)
T1_asi_reg_wr_236:
	mov	0x3c8, %r14
	.word 0xfef384a0  ! 4771: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xbda44940  ! 4775: FMULd	fmuld	%f48, %f0, %f30
	.word 0xb1aa0820  ! 4777: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb53c5000  ! 4779: SRAX_R	srax	%r17, %r0, %r26
	.word 0xb3abc820  ! 4781: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb9a80820  ! 4782: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xbda58940  ! 4785: FMULd	fmuld	%f22, %f0, %f30
cpu_intr_1_359:
	setx	0x470239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a5c9c0  ! 4787: FDIVd	fdivd	%f54, %f0, %f28
	.word 0xb3a589a0  ! 4788: FDIVs	fdivs	%f22, %f0, %f25
T1_asi_reg_wr_237:
	mov	0x3c5, %r14
	.word 0xf6f38400  ! 4789: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_1_393:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_393), 16, 16)) -> intp(1, 0, 16)
	.word 0xbba5c820  ! 4796: FADDs	fadds	%f23, %f0, %f29
cpu_intr_1_360:
	setx	0x47012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a448c0  ! 4802: FSUBd	fsubd	%f48, %f0, %f56
cpu_intr_1_361:
	setx	0x47011f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_362:
	setx	0x460232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba449a0  ! 4809: FDIVs	fdivs	%f17, %f0, %f29
cpu_intr_1_363:
	setx	0x46030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a408e0  ! 4812: FSUBq	dis not found

	.word 0xbfa54820  ! 4813: FADDs	fadds	%f21, %f0, %f31
T1_asi_reg_wr_238:
	mov	0x3c0, %r14
	.word 0xf4f38e40  ! 4815: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_364:
	setx	0x470227, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_365:
	setx	0x44020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_394:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_394), 16, 16)) -> intp(1, 0, 15)
	.word 0xb1a509a0  ! 4827: FDIVs	fdivs	%f20, %f0, %f24
cpu_intr_1_366:
	setx	0x47022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a94820  ! 4831: FMOVCS	fmovs	%fcc1, %f0, %f28
cpu_intr_1_367:
	setx	0x45010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaac820  ! 4835: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xb5a54940  ! 4837: FMULd	fmuld	%f52, %f0, %f26
	.word 0xb7a40820  ! 4839: FADDs	fadds	%f16, %f0, %f27
cpu_intr_1_368:
	setx	0x470103, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_369:
	setx	0x450128, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_239:
	mov	0x3c8, %r14
	.word 0xf4f38e40  ! 4851: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_370:
	setx	0x470218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00560  ! 4856: FSQRTq	fsqrt	
iob_intr_1_395:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_395), 16, 16)) -> intp(1, 0, 11)
	.word 0xb9a80820  ! 4861: FMOVN	fmovs	%fcc1, %f0, %f28
cpu_intr_1_371:
	setx	0x450201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12cc000  ! 4866: SLL_R	sll 	%r19, %r0, %r24
T1_asi_reg_rd_198:
	mov	0x7, %r14
	.word 0xfadb89e0  ! 4869: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T1_asi_reg_rd_199:
	mov	0x3c3, %r14
	.word 0xfedb8e80  ! 4871: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_1_396:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_396), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb93db001  ! 4874: SRAX_I	srax	%r22, 0x0001, %r28
iob_intr_1_397:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_397), 16, 16)) -> intp(1, 0, 13)
T1_asi_reg_rd_200:
	mov	0x12, %r14
	.word 0xfedb8e80  ! 4877: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_1_398:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_398), 16, 16)) -> intp(1, 0, 34)
iob_intr_1_399:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_399), 16, 16)) -> intp(1, 0, 13)
	.word 0xbba5c860  ! 4885: FADDq	dis not found

cpu_intr_1_372:
	setx	0x450236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_400:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_400), 16, 16)) -> intp(1, 0, 1b)
T1_asi_reg_wr_240:
	mov	0x3c4, %r14
	.word 0xf8f38e80  ! 4892: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T1_asi_reg_rd_201:
	mov	0x38, %r14
	.word 0xf0db8e40  ! 4897: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xba040000  ! 4900: ADD_R	add 	%r16, %r0, %r29
	.word 0xbda5c960  ! 4903: FMULq	dis not found

iob_intr_1_401:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_401), 16, 16)) -> intp(1, 0, 11)
	.word 0xb7a00020  ! 4908: FMOVs	fmovs	%f0, %f27
	.word 0xb2c40000  ! 4916: ADDCcc_R	addccc 	%r16, %r0, %r25
T1_asi_reg_wr_241:
	mov	0x0, %r14
	.word 0xf6f38e40  ! 4917: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbd3c0000  ! 4921: SRA_R	sra 	%r16, %r0, %r30
	.word 0xb7a00520  ! 4922: FSQRTs	fsqrt	
	.word 0xbfa80c20  ! 4923: FMOVRLZ	dis not found

	.word 0xb7a44860  ! 4924: FADDq	dis not found

	.word 0xb5347001  ! 4925: SRLX_I	srlx	%r17, 0x0001, %r26
iob_intr_1_402:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_402), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_wr_242:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 4927: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_403:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_403), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb9a80420  ! 4931: FMOVRZ	dis not found

T1_asi_reg_rd_202:
	mov	0x1b, %r14
	.word 0xf2db8e40  ! 4932: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_373:
	setx	0x47031c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_203:
	mov	0x12, %r14
	.word 0xfadb8e40  ! 4937: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_404:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_404), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb9a80c20  ! 4942: FMOVRLZ	dis not found

	.word 0xbfa00520  ! 4943: FSQRTs	fsqrt	
	.word 0xb1641800  ! 4950: MOVcc_R	<illegal instruction>
cpu_intr_1_374:
	setx	0x44000b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_204:
	mov	0xf, %r14
	.word 0xf4db8e40  ! 4955: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_rd_205:
	mov	0x1e, %r14
	.word 0xfadb8400  ! 4956: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T1_asi_reg_rd_206:
	mov	0x14, %r14
	.word 0xfedb89e0  ! 4957: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_1_405:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_405), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb7a00520  ! 4965: FSQRTs	fsqrt	
	.word 0xb7a80420  ! 4966: FMOVRZ	dis not found

	.word 0xb5a9c820  ! 4967: FMOVVS	fmovs	%fcc1, %f0, %f26
iob_intr_1_406:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_406), 16, 16)) -> intp(1, 0, 3f)
T1_asi_reg_rd_207:
	mov	0xb, %r14
	.word 0xfedb84a0  ! 4978: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbfab8820  ! 4982: FMOVPOS	fmovs	%fcc1, %f0, %f31
iob_intr_1_407:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_407), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbba589a0  ! 4986: FDIVs	fdivs	%f22, %f0, %f29
cpu_intr_1_375:
	setx	0x460114, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_376:
	setx	0x460109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_408:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_408), 16, 16)) -> intp(1, 0, 3a)

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

	.xword	0x8b329c93fb8b63e3
	.xword	0x09758938e46a0066
	.xword	0x920afb247da531dc
	.xword	0xabd25be6808644ab
	.xword	0x6ee8c4819440b5da
	.xword	0x8256bdf4a826e07d
	.xword	0x98d6fa5196b9f8b9
	.xword	0x87fe5f8ce5509512
	.xword	0x03d065f0f429370b
	.xword	0x4c71ac0d74f484ce
	.xword	0xf9840e6e66ad28ea
	.xword	0x50632716478d31f0
	.xword	0x0e4c22dc5d3f5bd2
	.xword	0x52427576a38e5b48
	.xword	0xf2b07b6a1eeb9fa2
	.xword	0x520475df43ef6733
	.xword	0xbb25f4f33018bade
	.xword	0xd614799b447d6a08
	.xword	0xd26bb7d877021be0
	.xword	0xa1b7226d156e1bbf
	.xword	0x968eb700b6c21f59
	.xword	0xcc7dddfbf857cee1
	.xword	0x5cf85fd7b642d68b
	.xword	0x5140e97bbe090173
	.xword	0xb2f1c29c8358c221
	.xword	0x1e8b5370b8536a2a
	.xword	0xfcddae94504f8df8
	.xword	0x79820edd8fed266b
	.xword	0xbb1955f454f2d74c
	.xword	0x1573dee44f87d1e3
	.xword	0x4e06f87349202309
	.xword	0x4f28f21de0914a41
	.xword	0x6f0b43699f020c00
	.xword	0x0fb165a37422ba4f
	.xword	0x15e1bc8814b6565d
	.xword	0x085f052aa178194e
	.xword	0x743ffe5aa326e398
	.xword	0x8b2276f16381826d
	.xword	0x37d2435cb7d06733
	.xword	0x0a4b91ecfbf7d9e1
	.xword	0xc555897e98a17961
	.xword	0xaafb3abedcde0c0d
	.xword	0xbce0603b5b7f3539
	.xword	0x0e9eba87d681610a
	.xword	0xc45f803b61f2a465
	.xword	0xbadcf463d523f75b
	.xword	0xd68f8dfef797c84c
	.xword	0x58d1c3c233a8df30
	.xword	0x5c08ab7c8a1a2c17
	.xword	0xec93f9c90155b73e
	.xword	0xe0cce7e2f79c7b31
	.xword	0xfbff2684e81c130c
	.xword	0x887f0dbe0b7a475e
	.xword	0xaae5d2e4aa2ba716
	.xword	0x9ae2b59fa92697a6
	.xword	0xda4f999e098ab31c
	.xword	0xf951e84f81f769ae
	.xword	0x623466da2294e038
	.xword	0x9f66c0af353af808
	.xword	0xb651eff6317c3c89
	.xword	0xe4c89453cc721975
	.xword	0x8942c9867aa1c733
	.xword	0xc45edb07fe537995
	.xword	0xb20173693d288106
	.xword	0x799fd30db6166d51
	.xword	0x9b68836ceb8e87f4
	.xword	0xbd8c067324107d33
	.xword	0xad0f9acc704de671
	.xword	0x08891476d112d76c
	.xword	0x36b7c20046b31317
	.xword	0xec68e76dbfd76493
	.xword	0xd7b0e7edca7298ca
	.xword	0xdd38995562853f78
	.xword	0x330179cd3fe3e884
	.xword	0x8a8fdb30b76b50f8
	.xword	0xa83972ea0a559872
	.xword	0xda0e7f11a61cbd80
	.xword	0xcc53b3f142ed337b
	.xword	0xf9db6df235cc458d
	.xword	0x322829b690cafd9f
	.xword	0xd3cc3495ae3d5061
	.xword	0xedd1f987739ee30f
	.xword	0x073b082ef3e9abdf
	.xword	0x51d69c6bd0831c9e
	.xword	0x00bd8b8ffd71972e
	.xword	0xf1f6d837f2f90677
	.xword	0x6358e1d2b131ee17
	.xword	0x64737a25fb928f51
	.xword	0x6c7b59d4af5973b1
	.xword	0x021f2fc918ebea36
	.xword	0x9eaaf3a54961ef02
	.xword	0x1bef47cba70e5fd9
	.xword	0xe80de07e7459d353
	.xword	0xacafe1605694420c
	.xword	0xe9049109cccb8991
	.xword	0x29fb6ec1f4b00f08
	.xword	0x7e9321ed7b1d54fa
	.xword	0x27f918c51300e1d6
	.xword	0xe4e7da1a07e8f544
	.xword	0x9184dc85d29c76b7
	.xword	0xfbd2e0770ccbc9c8
	.xword	0x151ce788bce77663
	.xword	0xfdcc9a0072f0d12d
	.xword	0x3ae2df99ab2f6a45
	.xword	0x9f7958374679e6e8
	.xword	0xb8d5b8bb0b37b435
	.xword	0xb51a10b4b8985726
	.xword	0x212459909e077385
	.xword	0x3962131e3b2c5495
	.xword	0x03bcbc3de70ed5e1
	.xword	0xb61071bcb6a6d4f8
	.xword	0x470e42b9c73b1ede
	.xword	0xd5164ecb6b146694
	.xword	0x24e422f96aaa6af0
	.xword	0xa05735d6c9259bd9
	.xword	0x86e0778927316230
	.xword	0x27e90c10164dadad
	.xword	0x7b5e8f1ff02d25ee
	.xword	0x6a54534131203028
	.xword	0xe8a908030ab6dac6
	.xword	0x39acba2c86c75ca9
	.xword	0xa275c2813d05aea7
	.xword	0x32b6bbbc96477919
	.xword	0x3d536ec61ffa1842
	.xword	0xd0cad807dc62e7e7
	.xword	0xb5cd604734f013cb
	.xword	0xe8131adc19b78fba
	.xword	0xef0a6d751ceda265
	.xword	0x417a4ba0a6de7fe8
	.xword	0x01685374a3f1e272
	.xword	0xb78fd2b05447d084
	.xword	0x33d3924d20f4ddcd
	.xword	0xb1867767e5b732f1
	.xword	0xf96d6b8b2628205e
	.xword	0xa3a67298f3866e46
	.xword	0x87b60c68f5bb98f8
	.xword	0xcc4b57743324928e
	.xword	0x25fdccf26c6b034c
	.xword	0x7f6841a0e284d59d
	.xword	0x28bc963dd6f8ca7a
	.xword	0x4fd2464f5f51fc02
	.xword	0x128175fd9a97af1d
	.xword	0xbd9cc836e38d379d
	.xword	0x572405bf11facce9
	.xword	0x009710ceb5868ac1
	.xword	0x855458b6d8257b8e
	.xword	0xfc507009ea641851
	.xword	0x6c59f2b824838fcd
	.xword	0x5f46893abbabc8e5
	.xword	0x98529775516f1ea7
	.xword	0x3b2665730ff3bf6c
	.xword	0x7e0f4e5fb10373af
	.xword	0xedc9a4463062011d
	.xword	0x00d273dc28a2ba26
	.xword	0xb4cb6af1ddbcf9e5
	.xword	0xe64409aaab106828
	.xword	0xaef84de5548f868a
	.xword	0x6e27372f08a3098a
	.xword	0x9e3dc2dff77b5117
	.xword	0xf40b295dfbc7110b
	.xword	0xbc09830eb17f4fb6
	.xword	0x37f0ee64661190c6
	.xword	0x1a0fa2ad4827387b
	.xword	0x627b13a31e7bb0aa
	.xword	0x1662994066cce5e9
	.xword	0x917e0393d4876f03
	.xword	0xc6161b910c7267c9
	.xword	0xfcf1624d67acc0ee
	.xword	0xcfb2d0ed35e5f54b
	.xword	0x790d7568167acdd1
	.xword	0xbbd20b6a6c65b058
	.xword	0x9261bff158d5f69f
	.xword	0x25828aee77ca7464
	.xword	0xe9878761790b4108
	.xword	0xfa690d05f8b16e23
	.xword	0x3e2e12f45979e68b
	.xword	0x5c0a7255e4f59d6b
	.xword	0xd7d6dd27d8ebe9b8
	.xword	0x1721a2a84f3301f3
	.xword	0x906b1cad10eb0642
	.xword	0x30daea269157d408
	.xword	0x5d41e63c657886c4
	.xword	0x3aa323ca01ee9b04
	.xword	0x16c04fb954d1371e
	.xword	0x390a13532cfcb118
	.xword	0x29dee0b5b8d72d08
	.xword	0xb868853bad9ff2b9
	.xword	0xfb3b4dc49b964ce1
	.xword	0x5c945fc9c70606bf
	.xword	0x1e8c3dcf3a732a82
	.xword	0x5438e0450b35432c
	.xword	0xf3b3d91b0ae89d9b
	.xword	0x40bb69aea427aa8e
	.xword	0x908bdf734ba33ec9
	.xword	0xe518075c4173600a
	.xword	0x6044091b17a0e00f
	.xword	0xfdefe2344d9996bf
	.xword	0xd42a23bf52f08c0c
	.xword	0x34988dac5782fe37
	.xword	0x68876b3622fbfb48
	.xword	0xf7145c8a59b3ae4e
	.xword	0x7f6b16cbd614292f
	.xword	0x7ae0d4e5027c4be5
	.xword	0x7d8ef2e694bc80bb
	.xword	0x5b35e55d013777d7
	.xword	0xf6c46baea86eb0e8
	.xword	0xe35b69dde7449ea6
	.xword	0x7b5243c08f00dff7
	.xword	0x36b8f89b8be3395d
	.xword	0x69d5af7a00302670
	.xword	0x4faa3e1b2ee28f45
	.xword	0xdb0fc0305bcb5dc2
	.xword	0x104e1286e528f973
	.xword	0xcb80482a01dac454
	.xword	0x00af822b17afb353
	.xword	0xe49ff0891477464b
	.xword	0x9564eb74df233287
	.xword	0x666969fe8326ca9b
	.xword	0x4e41d8c2d794b885
	.xword	0x382ee8ebda5bc392
	.xword	0xcf8a34977389b136
	.xword	0xb700dedcebc4404b
	.xword	0xc456b3358ac8b9a3
	.xword	0x4029b52b16075ab6
	.xword	0x2e537fd7a337dbdd
	.xword	0xd4b032273b6a8282
	.xword	0xbd24b8be469c8811
	.xword	0x779e8b75d2235cf1
	.xword	0x24ced3dfe3e8a2a5
	.xword	0x30a1c421c6bf8155
	.xword	0x523f5caa226aeb05
	.xword	0x26ea8053a5d296ac
	.xword	0x81b25dc7bacd9c9e
	.xword	0xb1526d0a933e3a02
	.xword	0xf8ecaf5f6f644b8a
	.xword	0x6b619d1d0fa3cdf3
	.xword	0x92e19855f3a870dc
	.xword	0x00b8ae8c13c489aa
	.xword	0x6b5937cc17cbc27c
	.xword	0x31b8b9a21fe0887b
	.xword	0x7848046743ae5463
	.xword	0xd6f0dd23c7a45680
	.xword	0x325261177b608b52
	.xword	0x815c6495be5d2b65
	.xword	0x672e580c7af73ed0
	.xword	0x8a176cf19a717eb0
	.xword	0x19eb9ccc107a51c7
	.xword	0x4cd2c0cbcf08bca2
	.xword	0x9c0176fced2fc4c9
	.xword	0x46821d8d8025a03d
	.xword	0xdfafd2d7bc571354
	.xword	0xc8ef14d03b238c0a
	.xword	0x494cc01e9e7e94e8
	.xword	0xe7639387e675bcc6
	.xword	0x2bb51f6b6dee37a9
	.xword	0x75341db6ccada0a8
	.align 0x2000
	.data
data_start_1:

	.xword	0xf86a843fe552913f
	.xword	0xb3ef000703f7a5b7
	.xword	0x49b907b490a6bf11
	.xword	0x47e44ec4edb95aaa
	.xword	0xa2bbbc4d01667233
	.xword	0x3e67b91bc3ab0274
	.xword	0x2182c460db22d552
	.xword	0x6a5feafd26fcf3a5
	.xword	0x01520fcde1501f1e
	.xword	0x565ad47a2ee7a37a
	.xword	0xe9953a99910912bf
	.xword	0x4c8e38a18663625e
	.xword	0x596858b3d8444348
	.xword	0x21304b0551a28410
	.xword	0x22111dfc6f002386
	.xword	0xd4ce2f3b18625dd0
	.xword	0xd4db943e8cf88e0b
	.xword	0x3e4b1c7547d2e591
	.xword	0x7c14e7af5e4fce2f
	.xword	0xd0e42d1cff6ae083
	.xword	0x7b66d4181abe06c8
	.xword	0x4c0a1dde45947752
	.xword	0x0dcb2ea234e455b9
	.xword	0x059b5c7dfcb3358a
	.xword	0xa8e2cc98acdec6e2
	.xword	0x162176842644d6fd
	.xword	0xe80d6261b79a6686
	.xword	0xf0fac6d7a7900c0b
	.xword	0xc4377b37d39e9531
	.xword	0x88240ef1bd657b02
	.xword	0xee20009df4c4a35d
	.xword	0xf38bd565e2a025e0
	.xword	0x823148e9055df5d7
	.xword	0xb2158c3bc3f7dfd4
	.xword	0x99cc8ee77ac0817e
	.xword	0xf1673496de94a6bb
	.xword	0xb936a54b7cb9fde7
	.xword	0x7fc4269d85a3b753
	.xword	0x767a738369bb841e
	.xword	0xe4784cdc069830d6
	.xword	0x406392ed580ae313
	.xword	0xbbd9ccd931e6bf38
	.xword	0x436fb84217e14441
	.xword	0x13cbd47a86d5edb7
	.xword	0x5308b722a8763288
	.xword	0x70e05cdef88d268a
	.xword	0x0ce6592db4daa7f4
	.xword	0x767bac660cd2755c
	.xword	0xd5883cffc4d01c0f
	.xword	0xaf6bc6baa3328520
	.xword	0x930b81d842b4e720
	.xword	0x9dfb2894450a64f8
	.xword	0x9e225889c4f7d9fd
	.xword	0xdadaa7f294dc62eb
	.xword	0xc369cfba738c6277
	.xword	0x13b827bdae8f7916
	.xword	0x1eeaee250b608814
	.xword	0x511f9df6aa23ab13
	.xword	0xb854f5ab54abfd67
	.xword	0x4d208b1eca07b7b1
	.xword	0x498f9f957c8b20e4
	.xword	0xa22e6ce994c71558
	.xword	0xa619364eb85e1cf9
	.xword	0x50bb017fd19a85d2
	.xword	0x7983642da2bba99a
	.xword	0xa3f35c8dd7ff4d1f
	.xword	0x4e72874d64968b21
	.xword	0x764930617fb05128
	.xword	0xc35c6ae787ce0939
	.xword	0x5a3b38b3596da79f
	.xword	0x4375e4b330076273
	.xword	0xae642af72b21d94c
	.xword	0x893751220429a0d8
	.xword	0x0140f44663effa85
	.xword	0x0f2b709dc7d7955a
	.xword	0x3a24f1a3bf9d58e6
	.xword	0xc9be9c3297b66cde
	.xword	0xc62f4299199fc5ae
	.xword	0xfe957da9ba87186c
	.xword	0x2f6284a8e5ebdf88
	.xword	0xb53ee97c16dc6b44
	.xword	0x8034e0273f6a22de
	.xword	0x93584543bd69d823
	.xword	0xb70e998b4be5eb65
	.xword	0xae29706061dfa2f9
	.xword	0xcc651b1c487f9e47
	.xword	0x6101b3063bfd1528
	.xword	0xab59c1d414231440
	.xword	0xd7a9a90947172ebd
	.xword	0x8746e8b861bc7288
	.xword	0xc2418098e630d2bc
	.xword	0x0b680c4d3b99251a
	.xword	0xc794a435e9da58ee
	.xword	0x8ba87e47c10faa34
	.xword	0x16f66f3a119733c5
	.xword	0x2457186e1528a653
	.xword	0x5d8dd78bf04dd904
	.xword	0xaaa51e0022365b78
	.xword	0xd67c90f1391a606b
	.xword	0xdae7b7b3fc676fcd
	.xword	0x1e996b1e23283bc2
	.xword	0x9de9865280f47fca
	.xword	0x582653821f8a60f0
	.xword	0x249824a71464c07c
	.xword	0xca803aeadd7a15a2
	.xword	0x698b98fb474a16c5
	.xword	0x8a6409bcbcc5d158
	.xword	0xa69617c2299f3f71
	.xword	0x318fd53daa9bd188
	.xword	0x211062bcc3dd130f
	.xword	0x94cd9142ec52d328
	.xword	0x0e8e38f970a3dfb5
	.xword	0x20c02b87f6263742
	.xword	0xec35687415762cfe
	.xword	0xa0f9ced60c13b5a0
	.xword	0x89cd648264ce6be7
	.xword	0x89f3bb201210d850
	.xword	0xc9adc6a1c20390c5
	.xword	0x6beb9988062ce42e
	.xword	0x47d647e038aa79c5
	.xword	0x0bd514ff23aa2947
	.xword	0x424a4e2492c7e7c4
	.xword	0x8b19bf5d54751ed6
	.xword	0xac71add591d11705
	.xword	0x9d45c4482b5086c7
	.xword	0x99ad45d2b14a7a8d
	.xword	0xec52f15a640afcdb
	.xword	0x15b7e929394416f6
	.xword	0x22fb6adbe07d5f41
	.xword	0xecf05beb9b844ff0
	.xword	0xd35ad0cc4a7d4c8f
	.xword	0x092e08f595f6f9fe
	.xword	0x29dc79000427a8c6
	.xword	0xf1e5bfb6708091d7
	.xword	0xe41f50afa943323d
	.xword	0x1d7e5027b97990d8
	.xword	0x0ae9b3535c924164
	.xword	0xa583e754c713c7b1
	.xword	0xe153f8c71c6799a1
	.xword	0x1ab34304a51648d7
	.xword	0xb87cb6121c1f2749
	.xword	0xa2e04374e5a81bef
	.xword	0x66dafbd66b6b5cad
	.xword	0x229b70aaa3f963be
	.xword	0x6637fdeabc3a83e2
	.xword	0xa4e684e317d8c53d
	.xword	0x7b65c77510c6593f
	.xword	0x367bcfcbebbc5f4a
	.xword	0x7a2b05d27e1f2fd7
	.xword	0x8b5dd629b639728b
	.xword	0xaba27c5732bfe4e8
	.xword	0xad7481b97743f0d1
	.xword	0x7ce79a227a3fa2c4
	.xword	0xb468a8b2b4af9925
	.xword	0xdd7dfa710b035b52
	.xword	0x613fbdbd0ad2b03e
	.xword	0x237e1bc05882699b
	.xword	0xf6f97380e7833b82
	.xword	0xd28f3ba460ef07a6
	.xword	0xc7a6e1e0a9d15ef7
	.xword	0x4571ba12092293b0
	.xword	0x932a12ba7c380382
	.xword	0x8aa207c6da97139f
	.xword	0x617aaf232ffd230c
	.xword	0xc22a0d8cb4334860
	.xword	0x39c2068c35315ace
	.xword	0x6c8f73f890edd8f4
	.xword	0xf0395dfab42fb91c
	.xword	0x01438e46b66d5db2
	.xword	0x77902a7739dacfd0
	.xword	0x9a7e88c0c73f76c6
	.xword	0xb148f7a7bee954f9
	.xword	0x9b18a07b5c5f8cb9
	.xword	0xd36eadb53ebbb303
	.xword	0x08a83879532cfad2
	.xword	0xe469e2cb2ef48991
	.xword	0xa76ba06b57d917ac
	.xword	0x0e1b2973d2f0d44f
	.xword	0xffc0521880b65215
	.xword	0xd82c03f02d83321d
	.xword	0xa299cd9616343d2c
	.xword	0xccd8fc519a768b11
	.xword	0xe0f1ffc7df8df03f
	.xword	0xba316da67935054f
	.xword	0x1aab22896266056d
	.xword	0xae990b8aac550b81
	.xword	0x380be95a7c9bad2d
	.xword	0x6f7acc15057283f2
	.xword	0x089d58c16091bb0b
	.xword	0x2353eeea62ab5894
	.xword	0xde631a60ebc70569
	.xword	0xa5b9e9bb3ad7b3d4
	.xword	0xb31f88fff32fe263
	.xword	0x3feb4f6ce92dd39c
	.xword	0x5768fc8e470e4b1b
	.xword	0xc1e2ad37d79d5fd9
	.xword	0x9a9f1e663b01146a
	.xword	0x7ffca47a4f1f93d1
	.xword	0xe767658a67ba03c8
	.xword	0xfdaaba2d05a2c9ac
	.xword	0x466c6e8db691c269
	.xword	0xc97a5a9bc310ec74
	.xword	0x50bbb7611761210a
	.xword	0x399f2cce7b9645be
	.xword	0xc8267d5c6400873a
	.xword	0x9a58f77308f69b82
	.xword	0x01ab6ce52f53f519
	.xword	0xaa1d6260244dc195
	.xword	0xc5c5122887f262d1
	.xword	0x4f65ef6bf8891400
	.xword	0xb359d2d9e7f18f89
	.xword	0x85df7afee6c4bdc8
	.xword	0x2296a831c8704cef
	.xword	0x23a0cb35282eb859
	.xword	0xdefe5b81d80c605a
	.xword	0x4f4e8190c7a9794b
	.xword	0xc59dc2e4b9a6eaac
	.xword	0x09c75bf735f51324
	.xword	0xed02164b194263ab
	.xword	0x50c988883c170a62
	.xword	0x0a87352b86af7c5a
	.xword	0xfb9dabff65f728e0
	.xword	0x9d8a20c3ce4f9483
	.xword	0x9f201bf306948259
	.xword	0xe9a1e34f602ac682
	.xword	0x427dbdfb5df705ff
	.xword	0x3141081c4eba07c4
	.xword	0xfb7e36ce4c74bedd
	.xword	0xec0e2c2ead39fdd7
	.xword	0x033294e5616ea05d
	.xword	0x841337b0acdb772a
	.xword	0x79ced11fcd4729ad
	.xword	0xc46ef2e8dafaab58
	.xword	0x599ce50290fcb868
	.xword	0x7dd962ef8a91f736
	.xword	0xe8956122675ed581
	.xword	0x62ddf130eac6b5c1
	.xword	0x8816b0ae9942a7f5
	.xword	0xe9fab66d0165dfaa
	.xword	0xa317697ceb9c7341
	.xword	0x663b8fb87f77283d
	.xword	0x181ac25dd54affe8
	.xword	0xc7050cfa99b6aa63
	.xword	0x5b9b02f0027c31d4
	.xword	0x8329795611876beb
	.xword	0x3c6782878e16c98c
	.xword	0xb11c839fcb1f90aa
	.xword	0x44c33421d177e841
	.xword	0x4ffb5a563389b131
	.xword	0xdfdc3b8ba18f04c5
	.xword	0x5115efc877463412
	.xword	0x303a00287041dda9
	.xword	0x44530d70b38ee5f3
	.xword	0xca19cd6ddd435787
	.xword	0x8aadf52b8f301337
	.xword	0x824bfc6064c7b3e5
	.align 0x4000
	.data
data_start_2:

	.xword	0x7c98db623c067fd1
	.xword	0xb727528d4856cc6c
	.xword	0x4390e845e54c9b07
	.xword	0x989f3f5060726069
	.xword	0x27b9faab891a88ba
	.xword	0xcbe6e86ca1233bd6
	.xword	0xc7919b6c55c8b13f
	.xword	0x4f1157e790819e59
	.xword	0x1244b389ddb8e5a8
	.xword	0xc9a11fbf557e5ad4
	.xword	0x54462ba63e94b7d7
	.xword	0xa20af7afcbd08470
	.xword	0xdb0fb99c4838942d
	.xword	0x35dd881823282d78
	.xword	0xc050c83f5b016c0f
	.xword	0x06689fc0c07f264f
	.xword	0xaedca655a41def13
	.xword	0xebf9f90aacac275e
	.xword	0x7d48f0e9a2cecbe6
	.xword	0x145ab5c85430705a
	.xword	0x0c2ccd11f46da699
	.xword	0x2dd52b63dab2b477
	.xword	0xca2644d38e243e3e
	.xword	0xa1ff05cf15098773
	.xword	0xa071147502308410
	.xword	0x3e59482e0e0592d4
	.xword	0xc36d9ec8be69f4bd
	.xword	0xee7364dcd4a678c2
	.xword	0x516b6650b5ad63f9
	.xword	0xa75f0ba68b53b4c5
	.xword	0x2058e3688dcefc0b
	.xword	0xf9b5e38a31367b65
	.xword	0x59612c1befe71a63
	.xword	0xdd03b6e65f18adb6
	.xword	0x5a1acd2a02e3b6d7
	.xword	0x28587148f1e0442d
	.xword	0x970527a27c5044c8
	.xword	0x702a2bda1b00d576
	.xword	0x1f9bfa521a23b797
	.xword	0x64b06674f5a421d5
	.xword	0x417dbb2fd7212dbf
	.xword	0xc52fef7ac594c264
	.xword	0x99dcddd308a9774f
	.xword	0xe0452991472a2907
	.xword	0x4698509431abfd4e
	.xword	0xd363477f0cf383f8
	.xword	0x90c995332e216524
	.xword	0x156221644578db3c
	.xword	0x468fa6a3868edb6d
	.xword	0xbc3b0a68324363e5
	.xword	0xa2ef7196147f0c19
	.xword	0x84e44dd336494adf
	.xword	0x1d6ef9b2934974a7
	.xword	0x38e3dc2a38851a88
	.xword	0x97445c6e3b596eaf
	.xword	0x5cf0fcd4ae4b462d
	.xword	0xd6f7e9dc7857bfda
	.xword	0xbeccf2dd572cc16d
	.xword	0xff69503c71f529ae
	.xword	0x3691f1e6a308c450
	.xword	0x66ebcc6c01b3890d
	.xword	0x194f291b9b664f01
	.xword	0x2baa115f734d7aa9
	.xword	0x93017740f530183d
	.xword	0xfd0c8f9251098ec8
	.xword	0x404766d60358796e
	.xword	0x867f75a956149b30
	.xword	0x1552ae1e5e8d0412
	.xword	0x76c462d6137b5576
	.xword	0x960a768628de59f5
	.xword	0xdae7ee8088705834
	.xword	0x1e9bf3b863a068cd
	.xword	0x3699387a5e59c48c
	.xword	0xbc4760d226c5ec92
	.xword	0xd85fe143bf1a6927
	.xword	0x20561fdf832cb09a
	.xword	0x9147cf2ec8f9bf24
	.xword	0xec2c249100547ccc
	.xword	0xb19c52fd39252bc8
	.xword	0x78ee898312d5b076
	.xword	0x4398fa48e877b6da
	.xword	0x5d66e62dc1ac9cc4
	.xword	0xb79bbd1a185e6910
	.xword	0x6cf4c8ddfcf17bd3
	.xword	0xd38e88916418c5dc
	.xword	0xa8a64508b2746b18
	.xword	0xa02e5145cd929847
	.xword	0xafa65f262b6078ec
	.xword	0x6208aa1789e8dffa
	.xword	0x15511738e89428c7
	.xword	0x40f188064a4c2687
	.xword	0x0a9d93ff6dd0db41
	.xword	0x10de708fbc6eb605
	.xword	0x0114ec0720532a0f
	.xword	0x1d6acbf8653e45b2
	.xword	0x5d4968d3408c27bf
	.xword	0xf16261177d5fe0dd
	.xword	0x86b7fa6e95a5d7b8
	.xword	0xa500120fe914a55d
	.xword	0x2531d9d6b0cf9455
	.xword	0xfae3919e8f2a3064
	.xword	0x2e0c60992c7f87e5
	.xword	0x97aeb61f5f89ec80
	.xword	0xead8f5379c4d8dd7
	.xword	0x91d613fac8d3bec2
	.xword	0x57dc77691b0558c8
	.xword	0x5e5b445a8354861c
	.xword	0x87f86e0295351bf8
	.xword	0x2935b72a50a7faf9
	.xword	0x136fc88a91c91a8e
	.xword	0x937f4ee75f3a1199
	.xword	0xc723e86e187d62f6
	.xword	0x07384dcd24bea4fa
	.xword	0x9a9b4c06fcbf00a3
	.xword	0xd93e06a01b3cb076
	.xword	0x71a87ef31231c64b
	.xword	0xa67e2987b242ca3d
	.xword	0x2af00326d89f18e9
	.xword	0x491120e4eed81de5
	.xword	0xed35301098fb10b8
	.xword	0x10d0d36b1d0bead5
	.xword	0x3d717a6646d9ee76
	.xword	0x916f87eed73feb77
	.xword	0x0bb438e23c05d4b8
	.xword	0x40a02e29f0e4ef8f
	.xword	0x914f6fdd31186e07
	.xword	0xf9964dc0ddbe3321
	.xword	0xbf43509e6e377d34
	.xword	0xa4f2b4a252ec72a3
	.xword	0x76f3984e5ba896e7
	.xword	0x43cec4e727408c63
	.xword	0xf3c34cc0f95f0bbd
	.xword	0x84a30e01548b9c82
	.xword	0x5a37969ef742cfc6
	.xword	0xb5dcc057ac22e645
	.xword	0x735696cf5accc2ae
	.xword	0xe1efa08083574e48
	.xword	0x60e97a2e8a91caaf
	.xword	0xd518fe7cd0675502
	.xword	0xb6faabec24a72e0b
	.xword	0xa5496fb4471d9695
	.xword	0xead1322dd661b134
	.xword	0x503cec421e20d777
	.xword	0x42d20a986a0ac2e3
	.xword	0x3e90af5386f6b41a
	.xword	0x06d5d10b6803d9b5
	.xword	0xb0f1188c27cc1bc4
	.xword	0xe227c25d00bfebcc
	.xword	0xa6a5bc8aeea1fdc2
	.xword	0x14ed5f5138fb5916
	.xword	0x8c96f1bbbbea919c
	.xword	0xb97eb8fce882d6a7
	.xword	0x73a32cd91e11ccac
	.xword	0x27f34fd75b3cb02d
	.xword	0xf4da2e5f40d540e0
	.xword	0xef1a9a1c81d3888e
	.xword	0x8363c7db9f71b6b4
	.xword	0x5ef088b26d61f194
	.xword	0x4b02b8d770392636
	.xword	0x029bad526b89256f
	.xword	0x6484d8e457bb29aa
	.xword	0x3cc7ee7e575cec3c
	.xword	0xf308466f9893cc56
	.xword	0xa772f2440fb2b8cc
	.xword	0x68be82f45bf6889a
	.xword	0x6c9786b2158d11dd
	.xword	0xe1726dd10a4b9897
	.xword	0x9a4bf9d2d151f222
	.xword	0x0aaedaf52e3c0c14
	.xword	0xd7e967c5e97214f8
	.xword	0xfb5664d46505aad8
	.xword	0x7673ae1ebda1d120
	.xword	0xdc31ec18ff145f19
	.xword	0x3f488cfb24e37d6e
	.xword	0x1ffedb1dd144474f
	.xword	0x78c5808bf725b2dc
	.xword	0xf651c5f0161a68c4
	.xword	0x51731df5a3c9414a
	.xword	0x1b240b71a94863e8
	.xword	0x3a95636411459ae3
	.xword	0xb0a5fb71b8681225
	.xword	0x088f2785f5cf2c5d
	.xword	0xb652c698ac63aab6
	.xword	0x21bd90916192a4a8
	.xword	0xac8cbbcc92cbdee1
	.xword	0x4e6617515413da5d
	.xword	0xa16f2fb1330b81cd
	.xword	0x33a4876427d54b13
	.xword	0x8e1b086c50a4e8ae
	.xword	0x9e9a86d2f2fbf6de
	.xword	0xa94e76dc62012b0b
	.xword	0x7828d22fe3d6e559
	.xword	0x077933b1433d350a
	.xword	0x10281b254b97830a
	.xword	0x07c0a4505ab0accc
	.xword	0x05216b026d6a5fda
	.xword	0xfd028d1c7bb4aa4a
	.xword	0xc47e874313acad0d
	.xword	0x444e4d17091c6fa6
	.xword	0x33930f76a8d22bb5
	.xword	0x857a9b75dbe96339
	.xword	0x01ebfa991b271b1c
	.xword	0x67444c1c9deff7e7
	.xword	0x43acfa667ba32a94
	.xword	0x1dba9ec15314b89e
	.xword	0x678712805dbcf026
	.xword	0x0c8c21bc7bf509b6
	.xword	0x95543a898d5d8073
	.xword	0xb2749823a9406915
	.xword	0x830455206d2d5457
	.xword	0x255e7edfe00ecb1a
	.xword	0x9d57402deb703c4a
	.xword	0x21c67acf33787976
	.xword	0xceb423ba049a0788
	.xword	0xcc87ba228b1a5a1a
	.xword	0x1d0db7980dbd197c
	.xword	0x18e00b99ff47cd2c
	.xword	0x51e5f2953eb3ff21
	.xword	0xf5b1813f7e07c964
	.xword	0x61b9f490400e0aa9
	.xword	0xe5e71e2e0634514c
	.xword	0xbbb60379742c1536
	.xword	0xad13db685efb9735
	.xword	0xf51e03ba10a53902
	.xword	0xc966ab9dfb5474aa
	.xword	0x5d286d29983d6032
	.xword	0xe263d38068275f21
	.xword	0x81469d7db5894175
	.xword	0x09da3579c3cf2a46
	.xword	0xa275e9e820ac6235
	.xword	0x2e8c71b4ff903d17
	.xword	0x8ec7c7cb8c808a65
	.xword	0x59ecf3ada4a68dcf
	.xword	0xf25500c8c51bff1e
	.xword	0x518c05fcde894e42
	.xword	0x842642b8baeb88ea
	.xword	0x19912c60804e8ee6
	.xword	0xc905b6338f364d0c
	.xword	0x6be84adc9d36d6ed
	.xword	0x090473dca6347c55
	.xword	0x61b7e848f254149e
	.xword	0x01ef923276ae73d5
	.xword	0x0456805bdff0d38d
	.xword	0x6a34dfef6bbc7fef
	.xword	0x61142c49c7b31523
	.xword	0x505dd55d9a1c1f3d
	.xword	0x149b66a0f0a5c25e
	.xword	0x3537b6d7c004b64d
	.xword	0x55269dde3cd861b1
	.xword	0xf2d3a8313fe4c563
	.xword	0xf1b3d25940b3a357
	.xword	0x26e6419c5793e80c
	.xword	0x199f10d61a21e20f
	.xword	0x43b2a96534f974ca
	.xword	0x8db17053f8934ba5
	.xword	0x90dab7ff3c0c2852
	.align 0x8000
	.data
data_start_3:

	.xword	0x38d207cf001edb25
	.xword	0x5e82bf336e771dca
	.xword	0x8daa505f9d7911ed
	.xword	0xa87799bc5423fccd
	.xword	0xe57d2e1608e00841
	.xword	0x59caca44a2eebb6a
	.xword	0x05044a5e19df630a
	.xword	0xcc5b86fcab8e25af
	.xword	0x303a4dae719a87fa
	.xword	0xe31041e6a1c1dcc3
	.xword	0xe8395fd7d6b0e617
	.xword	0x7b1b472098318af3
	.xword	0x52cba7c4ea190af5
	.xword	0xa80a4dce6fc34db4
	.xword	0xb82dfb7728886e07
	.xword	0x62a20cd8fa33b635
	.xword	0x1ae27d8a3d4b1e8a
	.xword	0x54c4f76a088bc59a
	.xword	0x0b18d49500916928
	.xword	0x299cdffc6c098bc2
	.xword	0xd3b64bd70eafdb98
	.xword	0xa4688b1d334212e7
	.xword	0xd6c86ef4ad520910
	.xword	0x5f334a80c27d3112
	.xword	0xc8d5108369a62d6c
	.xword	0x3f8e3b57463eeaaa
	.xword	0xaaa82c303ce36118
	.xword	0x33c2f27193a25f66
	.xword	0x5d339aab38d0fe72
	.xword	0xa172aa71adede372
	.xword	0x3f68197c4c52912b
	.xword	0xdef12b2a7c41d5c1
	.xword	0x64f8f4ad00a9ad99
	.xword	0x95cf8035ca9788c1
	.xword	0xf912ad23be604ecd
	.xword	0x1f20d6a01583156f
	.xword	0xa4ae4fe2e10613d8
	.xword	0xc085aa47f08e6ab1
	.xword	0xf1362b7e9af50fd8
	.xword	0xfcd448ee7bf2fe26
	.xword	0xc240feae7d810ddb
	.xword	0xdd4e11f888bc6032
	.xword	0xf0248b4ccbe86b35
	.xword	0x50877df4864023d1
	.xword	0x24591ca3f29d9da3
	.xword	0x90c7aa3ba48b77f2
	.xword	0x3a5546606dbb82b9
	.xword	0xd6d7b65ff21da773
	.xword	0x1cd7e1849031f2b4
	.xword	0xbb87047e48af91c2
	.xword	0xe1157f631e145623
	.xword	0x6b814cf2b807cea5
	.xword	0x9d42ea960a117c9c
	.xword	0xedcaa9e5e4e6e540
	.xword	0xb90b50468684ca74
	.xword	0xd2ca25bd3e7a9b58
	.xword	0x0e9ed0d0f5e57d45
	.xword	0xfd8f6f907da14425
	.xword	0x2b1f9a68c2a61791
	.xword	0x9fb37f89a20a5cba
	.xword	0x065bc1cdee343e96
	.xword	0xafa225bd0216d2e3
	.xword	0x38fff548f4a42ecf
	.xword	0x7b4cb797a7767de9
	.xword	0x6b3357b6837201b2
	.xword	0xd79ce5a72cd11a51
	.xword	0xcfdc3bd99120b19f
	.xword	0x46679a13ff4564a8
	.xword	0x63f601b4d7c88a32
	.xword	0x987af478e72764ef
	.xword	0x99a652aeea19c71d
	.xword	0x1fb52d1f713d57c1
	.xword	0xb4815ce255494e4f
	.xword	0x41b221f37e0d47e9
	.xword	0x8a05082a405ebe81
	.xword	0x29de432127a643c7
	.xword	0xf1219416009d9268
	.xword	0x9b8918b3c385a941
	.xword	0x9e59ae84d8696747
	.xword	0x80380767ae53a545
	.xword	0x516d59f1e2c0830e
	.xword	0x761357fb7c43db04
	.xword	0x5df530ae3123c4c8
	.xword	0xdfceed699b3fb745
	.xword	0x8f341843f868ee9a
	.xword	0x8689e7ecca140b3d
	.xword	0xa2166fd4bc05a4f3
	.xword	0xe7bf96657db49a33
	.xword	0x5de919daaa2b7070
	.xword	0x249c7751e7570ee3
	.xword	0x5118b1e6e01fe420
	.xword	0xf68860f0d26f4979
	.xword	0xc91dbe0573c94443
	.xword	0x02a71780340cfc23
	.xword	0x30e1cab6bbee6fb3
	.xword	0x4494e9837e371634
	.xword	0x04b4ccc3c5108caa
	.xword	0x0dcd6b33cfdb0be9
	.xword	0x52ca9bd5981aaf41
	.xword	0xd0337dd205ba2692
	.xword	0xeabeda7ae2c8e653
	.xword	0xbc4a245b1571dbe1
	.xword	0x1099be549915902e
	.xword	0xfbda587df384cae1
	.xword	0xb2f5b2ffccb0b3fa
	.xword	0x0373efb18426f59f
	.xword	0xcecc47dee2beedf1
	.xword	0x52fd92ad6ba68512
	.xword	0x6bef8a221633cfc9
	.xword	0xc46f5c3e9bf2df18
	.xword	0xd147a9fbdc05946e
	.xword	0x2a3918e8db103d86
	.xword	0xd1999309fde3e02a
	.xword	0x5f485ea75b7052ca
	.xword	0x305017f1b381a3a5
	.xword	0xb227c04f9cee9cc4
	.xword	0xf44b7d8217af200d
	.xword	0x120e6c7660919941
	.xword	0x338832049315f86a
	.xword	0x85299e3efd093d3b
	.xword	0xde71169fe53db825
	.xword	0x5700ca35813b1037
	.xword	0x231594fb5c5964bd
	.xword	0x63f5e060174b2ced
	.xword	0x80e5d81f2ef14657
	.xword	0xeb97352577c3e674
	.xword	0x86f5ac854fa1e19e
	.xword	0xf7845f591cbd8d92
	.xword	0x9c0cca90f1ff4021
	.xword	0xd23572afd8064b9f
	.xword	0xfcbda0ac80237833
	.xword	0xe4dec0a1b2bd42f3
	.xword	0x42bfa064c0c5c1a9
	.xword	0x24b46dc66ec05b03
	.xword	0x2f509ff8a73300b2
	.xword	0xdfd53a898a28f14a
	.xword	0x5740315495d2a243
	.xword	0x5b58db99a6acb463
	.xword	0xa1cb74a07ea3185a
	.xword	0x2a2ed7b61ed1401c
	.xword	0xc3f8c1a4dca81be5
	.xword	0x8980c1f34398537c
	.xword	0x708a3165d529fa58
	.xword	0xb4cd58f68b5f98fb
	.xword	0xf2d6b495330baf2a
	.xword	0x263cb0fc335d34f9
	.xword	0xd5a767a2d406a24d
	.xword	0x089b64f7a640fd8f
	.xword	0xcb68917d66fd6f70
	.xword	0x6d7589a77974418e
	.xword	0x30619e4e928ebf48
	.xword	0xe93389e8f257f5f6
	.xword	0x855699373d75c739
	.xword	0xcf9121f60a3db048
	.xword	0xfe045b9a3e316b24
	.xword	0x802978aa0431d5f4
	.xword	0x7e702b61d7a97248
	.xword	0x1d4b4f9df95026a3
	.xword	0xfaadc28c7975d520
	.xword	0x8a19113f4b98cc23
	.xword	0xca24bb416182bc9d
	.xword	0xd3b7414382e3638b
	.xword	0x1b92991dcb834b94
	.xword	0x54265d33081fec28
	.xword	0xabf35b9adf05d97b
	.xword	0xb5b7100f8616bbb4
	.xword	0xa5c0d8ad522c00cf
	.xword	0x850426549930cab7
	.xword	0xb9994c7bab4d3655
	.xword	0xc217e7f818e2a507
	.xword	0x0e9cb02e0da393b0
	.xword	0x44a139f4af39fffa
	.xword	0xbf21b148395605ca
	.xword	0x6ee7d9c072453c6a
	.xword	0x67819ef4e17a45ce
	.xword	0xb8cc987efe3f42d6
	.xword	0x5329d1634cc39323
	.xword	0x02ffb8190c8bc4e3
	.xword	0x4260cc3d6dd6f603
	.xword	0x22d02b578839ebf0
	.xword	0xb3574c80427dd71a
	.xword	0x62b8f5252bc4ad9b
	.xword	0x947d57ba1dd889af
	.xword	0x98701b8ae492357d
	.xword	0x7f8a335b6850bdab
	.xword	0xa82441911a78c6d4
	.xword	0xfe02c7bc58796d8c
	.xword	0x1d8f2570727e7edb
	.xword	0x73d8e415db96b399
	.xword	0x7946706c2646fa8a
	.xword	0xcca71e004a01e86e
	.xword	0xd0a7e0d35d40c6f5
	.xword	0x26d886f60d4674ee
	.xword	0x4aaa2db52c4e2736
	.xword	0xe8c6b8d56c76b4bf
	.xword	0xf84fd4340ec8405d
	.xword	0xa96cad813043f91f
	.xword	0xe021e16b9a28055b
	.xword	0x826827df4da45dab
	.xword	0x0d67532a725cf0f3
	.xword	0x9acd64cf6d9f17f7
	.xword	0xf201fcec12e5abb8
	.xword	0x658d0910f95c6c10
	.xword	0xdf3f16ab5289e3c7
	.xword	0x401e7550380b4586
	.xword	0xda3ab2684c1ac4ef
	.xword	0xba189cde0c6106d1
	.xword	0x1b73da08901dde4d
	.xword	0xd5163279c92e5ac7
	.xword	0xeac100bc2fb6fb14
	.xword	0xa0d020a489d67e6d
	.xword	0x9da2f4d3bea0fd19
	.xword	0x29c40c9eeb1e6727
	.xword	0xf325a9065b0312a6
	.xword	0xdc4d313596f26e0f
	.xword	0x6d1c3af2452164a6
	.xword	0xc1b8099c18a5c0b2
	.xword	0xfe123125b21669f1
	.xword	0x3d9d31554226f6c3
	.xword	0x4cf184d7186a5acb
	.xword	0x22deb7fd41b8b01a
	.xword	0x10a97ad945b80468
	.xword	0x4a71e712f98639f1
	.xword	0x6cd65239057f91d6
	.xword	0x9d60b39d02eacb41
	.xword	0x298a7e31fbdba476
	.xword	0xd80be2eb4a1b90aa
	.xword	0x28ea1849b40b7e8a
	.xword	0x8f4f3273782354ff
	.xword	0x218c5b3bf3da5d98
	.xword	0x9ab561165f441b82
	.xword	0xbf8bde1ffb06c69c
	.xword	0x08e21e600c7a9699
	.xword	0xd4b72305d74ed338
	.xword	0x0aea85a465dec935
	.xword	0x779dacf287c7b2d1
	.xword	0x59fdf5273cb45ac3
	.xword	0xdde1c3455cf290c0
	.xword	0x56b3188219d4585e
	.xword	0x5c1410e2e088b07f
	.xword	0xf57c0bc1ed145d6a
	.xword	0x047d84d7bfcbf154
	.xword	0x5d15304f22af9b6f
	.xword	0xeb9b8b852e63a8d6
	.xword	0x4cd30d95a3ee57ae
	.xword	0x4d2b431e16917de5
	.xword	0x77e2493fcbfedecf
	.xword	0x49f316cda2fd30fd
	.xword	0xea7400ddc1ed59be
	.xword	0xe63a624428781387
	.xword	0x8882117b0ce258d2
	.xword	0xbc3adc86a913ac3b
	.xword	0x683925f2f0440fe1
	.xword	0x5f5dccec6dbd800a
	.xword	0xf1ae9295f1a41664
	.xword	0x53aba85837df118a
	.align 0x10000
	.data
data_start_4:

	.xword	0x0f9f30056d59ad3d
	.xword	0x2388fdd77c67a534
	.xword	0x9691358347940bde
	.xword	0x69bedb7a4090e000
	.xword	0x3114b1fe40901256
	.xword	0x24307b941100256e
	.xword	0xcaca3e84f848f6da
	.xword	0x0396508bd0d3cb53
	.xword	0x37ad29873f941514
	.xword	0x8ebeab2e293e5d5c
	.xword	0x66470a6ba24a06d6
	.xword	0xcd7464e48aaae360
	.xword	0xa51fe367ee1c3fb5
	.xword	0x98845ea40aefa8e3
	.xword	0x91278f84f3815e55
	.xword	0x5f84b85745a34299
	.xword	0x2fbf8d151cac7138
	.xword	0x4a81b486ca4dd5f8
	.xword	0x868850836a28758e
	.xword	0x95c950944c29b35a
	.xword	0xa791b0ff7191dc09
	.xword	0xbb18ce27c66b270a
	.xword	0x7d7c9a5ac4b93094
	.xword	0xd3097032812a3a0e
	.xword	0x8f1ca43684dbc252
	.xword	0x5e92ffb436033382
	.xword	0x5235be2541900759
	.xword	0x29a741fb1c108dd5
	.xword	0x89c4ac87198b5651
	.xword	0xae841694211c2441
	.xword	0xc9c2dbdc155d0987
	.xword	0x91202579eefaf9e4
	.xword	0xa687a30efe4b7824
	.xword	0xc029e05d483cfcd5
	.xword	0x447ffcbddebd6a3f
	.xword	0xf0b182ca50f8a274
	.xword	0x79cf63ebd5c386ce
	.xword	0xd1e3ed7f106c9ae8
	.xword	0xc6827fee417814d4
	.xword	0x92b29f92be015988
	.xword	0x6cd34c11116441f9
	.xword	0xa81117fccf7f8fcc
	.xword	0x8c8b3d800ff31cbd
	.xword	0xcbe694d3b88f2cd0
	.xword	0x5c7c6e9c158f4eb9
	.xword	0x464f57070a429ce5
	.xword	0x11e4f6eeeb2e32ab
	.xword	0xea674b98f7a43f9b
	.xword	0x6cf76a557fffdebe
	.xword	0x85475253d9439c9a
	.xword	0xd86cc90ec7bdbdec
	.xword	0x40922b2ed7667f26
	.xword	0x935936f441f44794
	.xword	0xa268559d5477e146
	.xword	0xf5604cae6dda47b6
	.xword	0xa3d6578bccb87c92
	.xword	0x7b5776d2029abcb3
	.xword	0x1c0806857a91926f
	.xword	0xb9222c5d45465442
	.xword	0x18d33f73cc8c1367
	.xword	0x41f3102904811ab5
	.xword	0x160d621f27663146
	.xword	0xb5d31b4f2933a31b
	.xword	0xcf5f03f4facd05e1
	.xword	0xc21f7c494fc2989a
	.xword	0xb369bb1789e9a38d
	.xword	0x2b7331c23b79368b
	.xword	0x954c01f78d79fac1
	.xword	0xbd176c2ad283cd8d
	.xword	0xfc1dd6a2d4b9ac8f
	.xword	0x0a28598299235120
	.xword	0x202f834ac8bbd860
	.xword	0xd572df29d81cd452
	.xword	0x2dde7413fa20eb63
	.xword	0x7d22eb76d3bcf6bd
	.xword	0xb2655838d085d797
	.xword	0x4bb10da1d70e6062
	.xword	0xfe525b4a2e8cb858
	.xword	0x564c5b356ccf4eb5
	.xword	0x45cab09b81de24c6
	.xword	0x820a609f493c4646
	.xword	0xf6e65a291fb843e1
	.xword	0x6ff8aba66333cf9b
	.xword	0xfcde8dc86373a6e7
	.xword	0x265722092779531e
	.xword	0x5fc42abd60dec16e
	.xword	0x395feef13e26f9a9
	.xword	0xe029556d5a4c8fd2
	.xword	0xf566f6e00329def3
	.xword	0x7656edde8c7b5a34
	.xword	0xfa8f12a67db58c61
	.xword	0xa5aaeab0557fc853
	.xword	0x7d949a729d91599c
	.xword	0xfa97ddfc78bc61c0
	.xword	0x5d0b613509fb7d2f
	.xword	0xa2070085234962e5
	.xword	0x899082043a29d3a0
	.xword	0xfedd527cd2c5434f
	.xword	0x8ec800cacb20553c
	.xword	0xe70b6555363e6f15
	.xword	0x5430f5c860bf719d
	.xword	0x9f3d7408327cbd75
	.xword	0xf9b31f61acc5a8a5
	.xword	0x9d05dcada961fe3c
	.xword	0x5f2d4d6b6592cf85
	.xword	0x7b874976995c238c
	.xword	0xd95b7dac7756b2fc
	.xword	0x8f6d303ebf97017b
	.xword	0xd68c0a950c635920
	.xword	0x105cca28743351f8
	.xword	0x2e6fd93bfdcc6b16
	.xword	0xfcb927099a03bbe1
	.xword	0x6a63a0d30815a895
	.xword	0x973dcf6e57e60168
	.xword	0x19d6cac8166217f6
	.xword	0x936b025bca557de6
	.xword	0x6b85d3916f15ae31
	.xword	0xe837a09ed054d2ca
	.xword	0xb8def18359d6f8bc
	.xword	0x66664b650e76a1f0
	.xword	0xf8c6b9ee562c1f71
	.xword	0x3614a0f21c644096
	.xword	0x0e19dc29105eb5f2
	.xword	0xcd34a0a47ca0d6fb
	.xword	0x0268317b2ce5f368
	.xword	0x1cef99ef6f4a8078
	.xword	0x2d562ce71b43fe08
	.xword	0x562b9b083a99a54d
	.xword	0x67b9c8317109a5ba
	.xword	0x3ec685fb22fc4bf7
	.xword	0x963b4fb6070fbeed
	.xword	0xc28ff1ee054e60ec
	.xword	0xd8eafd8a2568a55d
	.xword	0x1f84d2615f5426e2
	.xword	0x54bbc232f7d6e567
	.xword	0x2d85fdcdcf72077d
	.xword	0xe1a68986bc4db04a
	.xword	0xd3c71743af043542
	.xword	0xb2d761eda37527d8
	.xword	0x33ccba86b3d48d34
	.xword	0x7fabf8c0580f8ad8
	.xword	0x6827e2b5fb930c20
	.xword	0x291aff2a5a2efc5d
	.xword	0x68fb3fa187be65a3
	.xword	0xd716af51590d1a73
	.xword	0xc462406894db8415
	.xword	0xddc3069e2d6ef7cf
	.xword	0xa293a9c7bb75efd9
	.xword	0xd9fead6c64b9e284
	.xword	0xf52110f9dd3b9261
	.xword	0x60388a9156263d40
	.xword	0xb851cf95a0bbdede
	.xword	0x5f378f288169891a
	.xword	0x4af1b601ad358efa
	.xword	0xb819720d53a80eff
	.xword	0x950d3a87fd620348
	.xword	0xae8c3f8d42e1644a
	.xword	0x6be87a43f60b5dbe
	.xword	0xca699c977100c1fe
	.xword	0x92280726fd4a6b11
	.xword	0x8ebc1d142028f216
	.xword	0xa2abd1ff441c6940
	.xword	0xac43c11aadb44041
	.xword	0xae5848989a4eabce
	.xword	0xd75b3961f77f0065
	.xword	0xac341d05a6849ede
	.xword	0x7e26784cd9b9142b
	.xword	0x7e9bdfe19aa18daf
	.xword	0x5f28bad144398428
	.xword	0x729d68e329efc003
	.xword	0xe6a858fe33ee1403
	.xword	0x1f88515a41ea92e0
	.xword	0xfedf75c9f9b11d6c
	.xword	0xe150f1406d5aa53b
	.xword	0xb5efac834bdee742
	.xword	0x251f50189e436754
	.xword	0xe9d2174d0d8f6411
	.xword	0x1a1ddcd66c9cb684
	.xword	0x57bb736ab276c62d
	.xword	0x698d88ebfdd99379
	.xword	0xcf45ccfe4ed876c7
	.xword	0x4768726780f3eb48
	.xword	0x4bc5ac12c5e2b727
	.xword	0xa4b539a61343471f
	.xword	0xca3458fcff782a0b
	.xword	0x6312e70645e1d0b1
	.xword	0x7ce0efe8bd79e3e2
	.xword	0xe7fdb23b004a3522
	.xword	0x4b08b7bdd14d72e7
	.xword	0x095a3888b1b908dc
	.xword	0x5ecdc026788e3536
	.xword	0xae456153d035cbca
	.xword	0x3748c5bcf62e2ff7
	.xword	0x3eb4a4bea8eff1a8
	.xword	0x54eec71982417c92
	.xword	0xade2d01872c0a9d9
	.xword	0x95d15c2b765ed03c
	.xword	0x6eff1cf6487dd513
	.xword	0xe6d43cf24cfa5ae9
	.xword	0xcc3c021a989198ed
	.xword	0x1e0574b6bb669866
	.xword	0xdf083ee61392ced7
	.xword	0xcd640e04e32ca352
	.xword	0xf3775cffc144b9d5
	.xword	0x9d7bdc1f436cd9a9
	.xword	0x7383fcc323740099
	.xword	0x44d0fbe6bed9b03a
	.xword	0x76246cf31d011128
	.xword	0xb2f72db32c5cfba9
	.xword	0x8d1ec7cb83b2f2fd
	.xword	0x6591c21a431d718a
	.xword	0x50ab7310cd0d0913
	.xword	0x0d0d49d87ef3568d
	.xword	0x872ddedfa78fb59a
	.xword	0x7effb1377df3f488
	.xword	0xff9c342dde1bdc31
	.xword	0xde3685831a650ec5
	.xword	0xdc848b5402ef5fac
	.xword	0x7023691517285166
	.xword	0x12081ed9de1dc260
	.xword	0xa1b8e4b4e68d4fd9
	.xword	0xac6bda6d915172c5
	.xword	0xb0dfad7132bca23d
	.xword	0xafdc679ece2735ad
	.xword	0x9b9cdd9a4ef6dc95
	.xword	0xfda17129c0b2e1fd
	.xword	0x2a6cf04a684dde44
	.xword	0x9d92006dca4ec0ef
	.xword	0x02ec1508d09ca4f8
	.xword	0xc3c4612bb83e77cf
	.xword	0xa25cb26b3a506fd8
	.xword	0xfacfc28fc895211d
	.xword	0x4c89f0ca3ca68797
	.xword	0x978a7743bbc5ba4c
	.xword	0x709004420d6a6262
	.xword	0x9a555d2b308c6c5f
	.xword	0x4dc8a0dffb959857
	.xword	0x8bb86bbe992a4566
	.xword	0x12f7c17f835f2502
	.xword	0x97223d4d84e62cbc
	.xword	0xcf5bcc2b3ccf07ad
	.xword	0x921f9bd1b2e045c8
	.xword	0xc9d3f000e450ad72
	.xword	0xb3fb5966af3b4b1e
	.xword	0xb2fb5e8252669905
	.xword	0x5e07215dd69eb7bc
	.xword	0x238cacdd81b96373
	.xword	0x3f90ea05e79819c0
	.xword	0xfa397a66226872e5
	.xword	0x9ef6027e9b1f0fed
	.xword	0xf07a7c678779689e
	.xword	0x24be858ca4c7a681
	.xword	0x3b04923a3aa2fb65
	.xword	0xeaf7e2f6706ef36c
	.xword	0x632801554394535d
	.xword	0x4ced8483e09e4ba9
	.align 0x20000
	.data
data_start_5:

	.xword	0xbdb9ad48face9b53
	.xword	0x739ea36ccf8aaa09
	.xword	0xbe90fabe6bfdbf8a
	.xword	0xec7a7adf32806e69
	.xword	0x0c8295b1ec4772a4
	.xword	0xe9b73b931e541ff9
	.xword	0x4989e69ad94239b3
	.xword	0xceda2daa64ed86d4
	.xword	0xfd1d3647dc600cd7
	.xword	0xf122d2e37f9de508
	.xword	0x52c2705fc44c44f6
	.xword	0x1862391191ad0bda
	.xword	0x1d27fa8ee4395bca
	.xword	0x0cc7195d57197fce
	.xword	0x62b0eb8ad13285cc
	.xword	0x204c098d60ed6494
	.xword	0xe92e442df274c116
	.xword	0x1425f6b2439f4656
	.xword	0x5662d10254f10460
	.xword	0xe05fcce5b93786d4
	.xword	0x3ddca10f6c16a0b8
	.xword	0xc70c8b5346e0087f
	.xword	0x3887015b5c103cef
	.xword	0x6b417da0283b5dff
	.xword	0xe524826122ca72d1
	.xword	0x9e72f2c33866f5df
	.xword	0x3497bbd792c74b10
	.xword	0x1d187a5eff4bce7f
	.xword	0xdf1fd8657e6c373d
	.xword	0x316a32f036338943
	.xword	0x92c029da7efefa60
	.xword	0x13b1f4736a959666
	.xword	0x88d795b1f823820f
	.xword	0xb4af85de61de4046
	.xword	0x1fcc1c0a3933f5af
	.xword	0xe12ecab7601662a6
	.xword	0xe0f212f1c8905b70
	.xword	0xaf647d35238de1ab
	.xword	0x6a26a19726d22ab4
	.xword	0xe8da5e6778c0f4bc
	.xword	0x8fe2bbdf1c966a00
	.xword	0x6faf72a5342b2e16
	.xword	0xafcb0fed8fe34e87
	.xword	0xeea4a2356708fb59
	.xword	0x6716b6790316056c
	.xword	0x74ac2d7eff03c8dc
	.xword	0x79912db12c332473
	.xword	0xe6096735a376160f
	.xword	0x506f39ad3c079bd0
	.xword	0x36fe6da56d866fa9
	.xword	0x83a9b37aade1bff4
	.xword	0x3e1240fd7bb60e9e
	.xword	0x7c66ed86cf821197
	.xword	0x51ba20d1824132c4
	.xword	0x65f163222ac5a1a2
	.xword	0x85cba5f2647bf214
	.xword	0xd42c509d9c848a63
	.xword	0xe15ac5989dce44b7
	.xword	0x62a7357abb2e3a88
	.xword	0x7e50d995affd7ed9
	.xword	0x9fcb0d1b8320324c
	.xword	0xdbcd8c92a9781ce2
	.xword	0x527ebf804681f86b
	.xword	0xfe242b98e0dd4bc8
	.xword	0x4d358b566045889b
	.xword	0xdeb2617d8fd60c7b
	.xword	0x939588c90ab25577
	.xword	0x08ef01dfa043192f
	.xword	0x89636733aea59b28
	.xword	0xc87c5b64c0abddce
	.xword	0x9a0772f9535b1214
	.xword	0x24a365978e6a0806
	.xword	0xb4fb4375411c27f6
	.xword	0x2c0be7dab39b67ee
	.xword	0x58a2cf3cba2001e5
	.xword	0xfcd559e610e87d5f
	.xword	0xd953a1068c5204b2
	.xword	0xab29cdb39cfe70f4
	.xword	0xca518407c75da9ad
	.xword	0x1a1aaa54d1f932c5
	.xword	0x5003d0e57c603a8a
	.xword	0x7f1d59a174e66a98
	.xword	0xe140c8c6a41e416e
	.xword	0x91ee3979fec258ab
	.xword	0x925e55ce3bbe0f85
	.xword	0x9a4dcca70c5f2636
	.xword	0xcc9ed416e175fe37
	.xword	0x3a85b20796dfc61a
	.xword	0xaab4682c4458aa0b
	.xword	0x5959feba510c1032
	.xword	0x7ee3f4730462f805
	.xword	0x240f1c0db7378bf9
	.xword	0xc0bbbabc23a380fb
	.xword	0x1e0a1f8ef35d3df1
	.xword	0xbd225ccd2b361dae
	.xword	0xbba02988925fc688
	.xword	0x6aeb5955d9bf32d1
	.xword	0x1910546d30b0f415
	.xword	0xd842e42a0620ae87
	.xword	0xfdf50df4906f45ef
	.xword	0x0add01d967f9a8b5
	.xword	0xe29c084b80d6663f
	.xword	0x394a1c444be8d3ac
	.xword	0xfe5d6b020568e8c2
	.xword	0x6f8f64673b43f9b6
	.xword	0x44370aa7e4f2d2de
	.xword	0x9c54f6f0ee1771a0
	.xword	0x66ca459fc4c91e22
	.xword	0xae06eccccc58adfc
	.xword	0xe01a0cfc4ab3d3ab
	.xword	0x25363b108136493b
	.xword	0x85b5859ba65d87b3
	.xword	0x6213665efe611b94
	.xword	0x52f6178a5ae750bf
	.xword	0xfcebf030c38b6bd5
	.xword	0xe093c9f92014f6b6
	.xword	0xfcf4631f6b6543ba
	.xword	0x2d650d5c1c096b6c
	.xword	0xa3f839e8d4f6ae40
	.xword	0x455fe186a0f21bd9
	.xword	0xd60f1d7d737fd082
	.xword	0x89e7b9eb157630a3
	.xword	0x2bd81401403e0a87
	.xword	0x9e0ae42503cd86b4
	.xword	0x0c630edb08c352c9
	.xword	0x600d0652e893e2ce
	.xword	0x0d033ed99bdd9905
	.xword	0xb676549af8b1f82c
	.xword	0x5d6b2172dcd09f17
	.xword	0xe76e9025478a4580
	.xword	0xca8f784e4f264122
	.xword	0xcbceeb2e6ac16cf4
	.xword	0xf940e51d06ab23ad
	.xword	0xcfab5ea718f04ec6
	.xword	0x613d52d7bf39ce29
	.xword	0x414eb63b0b25bd13
	.xword	0x61416083982f4ff0
	.xword	0xd4d9fe8fa35922aa
	.xword	0xa814c24b9efded13
	.xword	0xea759a73ac24b460
	.xword	0x5f37f0925e85c98f
	.xword	0x36d8bc0beb2f5a72
	.xword	0xb8216eb3e03ab927
	.xword	0x851f160b1c9e7753
	.xword	0x844fc47dbf7b6efa
	.xword	0xb411da1e4ba76d74
	.xword	0xe7c1ca686a7e2cb7
	.xword	0x72044008ca396bea
	.xword	0x4477b359e216104f
	.xword	0xff7419875fe948c4
	.xword	0xc78df643841f07a7
	.xword	0xd133ff9cf6393e82
	.xword	0xa921e60519178fc3
	.xword	0x1d5a08cfcfa538ed
	.xword	0xc66c028f9cf1fe9b
	.xword	0xfafedab9809ec66f
	.xword	0xe43e72e05eb3bef6
	.xword	0xcb901a8382a842d3
	.xword	0x801b49698a334760
	.xword	0xa76d40eb5ed9f5d5
	.xword	0x1eaf872400ac6ec7
	.xword	0x51f184038949d5fa
	.xword	0x17784b92b36c47f6
	.xword	0xe3da50b2f0373818
	.xword	0x301cf1d128ec1116
	.xword	0xc829924294d5efd5
	.xword	0x94d4a9640c202f9e
	.xword	0x8830b7acefb40c90
	.xword	0xd28dfe723a9b913b
	.xword	0x7bb9b2e96196b446
	.xword	0x7aae4c011c13336f
	.xword	0x17edcca1d033d4f7
	.xword	0x65c37fc5160d8f47
	.xword	0x995d00b6746722d5
	.xword	0x1a7d151c1ea6deea
	.xword	0xfee618ab57e94fee
	.xword	0x5700ee0367413dde
	.xword	0x653eca48bbc49b8b
	.xword	0x91a34614435baecb
	.xword	0xd7a92dc034d042da
	.xword	0xa60e15cdb575d635
	.xword	0xb39949f04be2a840
	.xword	0x4400a2d470089f40
	.xword	0x7d3e921143204905
	.xword	0x5219262ac303543e
	.xword	0xa98b075c81adef23
	.xword	0x585cadbb346d9f5a
	.xword	0x984486f0c32af103
	.xword	0x5617e1d061746f87
	.xword	0x63d47b50282f5414
	.xword	0x3eb5d871f27a4ef3
	.xword	0xe0e275417f694ea8
	.xword	0x10ea0e7e689a34be
	.xword	0x397d9de4db2b4df8
	.xword	0xee65d0c19ed26608
	.xword	0xa849d3e29edb36b8
	.xword	0x95ef9b4c96f29361
	.xword	0x23848e1d0d25eccb
	.xword	0x1784b2aef6429157
	.xword	0x869c7e915ded6efe
	.xword	0x33b99d935c0c7f73
	.xword	0x2cb62612d3b47215
	.xword	0x46221249041e0bfe
	.xword	0xa5402706f3f33c1e
	.xword	0x893cf3c0cc27990b
	.xword	0x1108064610e59028
	.xword	0x1e350badebdcdedf
	.xword	0xc1fb65a55b37b328
	.xword	0xe4d7e55f4efe82a4
	.xword	0x0f4b8a596bb5391d
	.xword	0xc8114bf5ef619d8d
	.xword	0x219181136ebc87ab
	.xword	0xb6356fcfc50ffe2b
	.xword	0xf184d507e8dcee56
	.xword	0xf5a6a42b80e44243
	.xword	0x7836553c5c750325
	.xword	0x3b8725ec9a591f6e
	.xword	0x9329c91e2e6d556f
	.xword	0x522cb7df751a81cc
	.xword	0x71df8b293f383a9c
	.xword	0xe116b85eacc28cf6
	.xword	0xf890d80613012503
	.xword	0x0ba15bb166bf48d6
	.xword	0xc28bf906b013bd5e
	.xword	0xe30f44823b41568f
	.xword	0x8e298caded9945d9
	.xword	0x7952adcebb7eed5f
	.xword	0x45f0773e7f8c809e
	.xword	0xbe60d96acd0e3cfd
	.xword	0xd67f6e1992bceeee
	.xword	0x76245c3f30426911
	.xword	0x5e1ea8bf516e9a5e
	.xword	0xeeff1eadf49f2e2b
	.xword	0xa425b0b1339363b1
	.xword	0xd5ad0537cc2e35b4
	.xword	0x854ac3271da30fc3
	.xword	0xb769579d79b80d43
	.xword	0x6613c72854667011
	.xword	0xf1206c7f67c464ff
	.xword	0x379ae419acc1c5a3
	.xword	0x16088a6ae1837f41
	.xword	0xf1217d49b9a66080
	.xword	0x1010f10710c672a8
	.xword	0x14d97ac38afde715
	.xword	0x0f485ddf153c8609
	.xword	0xc1298cb563c822b7
	.xword	0x62e839307909395a
	.xword	0xa8a903e68d72f5dc
	.xword	0xd863d58415e37c0d
	.xword	0xf8ccc1bd682c5096
	.xword	0x5629f3fa0609701f
	.xword	0x5a6efb83c9d229e6
	.xword	0x3dbe535d79f74a08
	.xword	0x250f1aa651149a95
	.xword	0x21a697608409968c
	.xword	0xb471f8b42ed84ebc
	.align 0x40000
	.data
data_start_6:

	.xword	0x5483ad8104bb0ece
	.xword	0x0de5bca3b6a9bbc7
	.xword	0x4f8d7df8780ada86
	.xword	0x41e0171ee2f0ad99
	.xword	0xd61b5834e5a5194f
	.xword	0xa84952b5f6a37ea7
	.xword	0xe4b699cab533722b
	.xword	0x5b3ee766dca69214
	.xword	0xdc3a729d8db8a499
	.xword	0x9fc3b8ed09133baf
	.xword	0x7709ff96d9cf55e0
	.xword	0x2167814fae474344
	.xword	0x2bf17857595cc839
	.xword	0xc920691958b27a9f
	.xword	0x8fc4316c5ad2e3cd
	.xword	0xcdfb63c217a6f994
	.xword	0x961257e3f39a2281
	.xword	0xd54b27a9aef388c1
	.xword	0x6a850dff0592c11c
	.xword	0x4f1f566ba778548d
	.xword	0xe7d1c11705c74c3a
	.xword	0x8fede519d2f30466
	.xword	0xbe3aaf80452d450e
	.xword	0xc4c05fb9dc62b49d
	.xword	0x092b715b0eb45926
	.xword	0x136ffe79dbd64e86
	.xword	0xf12d7e53656ca780
	.xword	0xd9173e0134ffa7e4
	.xword	0x4e14a3d0491daad7
	.xword	0x494ed2098d6738f2
	.xword	0x766f991c695ce653
	.xword	0xbd1a333445f37ddc
	.xword	0x1d657789c2509775
	.xword	0x0b7c88e485fbad3a
	.xword	0x828b81f23549ded0
	.xword	0xcb91c18b00711cdb
	.xword	0x9b7ce1696590a458
	.xword	0xc7a5832e0303c03e
	.xword	0x48a12e2681930d85
	.xword	0xce206ce8f4eb1000
	.xword	0xe9b7ce29ffebfd4f
	.xword	0x6c319ffc42a69694
	.xword	0x47f31b58f4f9ac8f
	.xword	0x2f82f330b3012883
	.xword	0xdd215d1380b51cc3
	.xword	0xc238ad44456e3b89
	.xword	0x318e1c84f2a79902
	.xword	0xb00bcd557e261d4e
	.xword	0x5feff993e0861d67
	.xword	0x835e8908c6ca0ce0
	.xword	0x43689e64b1b5334d
	.xword	0xf2803ec6fb408e78
	.xword	0x03552419f8f6af52
	.xword	0xe8b5c767c4a8b541
	.xword	0x6138860eb7670ddd
	.xword	0xc2eea70821c2f497
	.xword	0x85fa350a782e2da1
	.xword	0x83eafc7455490f15
	.xword	0xc2d399909ffcc6bc
	.xword	0x6b1014401902a98b
	.xword	0xea898abd1328981e
	.xword	0x41f59b1623bcc1e7
	.xword	0x30479130add6d7b0
	.xword	0xac9fdbcc7ac6140b
	.xword	0x83880f80cd6968a8
	.xword	0x7b2ed4b6d1986ae8
	.xword	0xdc8a8734d38e12a6
	.xword	0x5e44a0c2de66c0f7
	.xword	0x735700d553e8f56a
	.xword	0x9d1e4f8293a2a471
	.xword	0x73b19016e0a412d0
	.xword	0xe7d31b79e4fa51ed
	.xword	0x167be1759695639f
	.xword	0x3b5239fdf2b45b68
	.xword	0xa06db43c51634baf
	.xword	0x6fdf677773aae114
	.xword	0xfa5e2f93840ec0ed
	.xword	0xe9ad00a68779ef65
	.xword	0xac96d2134e60294a
	.xword	0x49f05fc7a75e5ac6
	.xword	0x8f685a15de3f9811
	.xword	0x417cbba8f60ad119
	.xword	0xe58d837deb6f9500
	.xword	0x8fc72b674192c762
	.xword	0x7f989f108eeb6f5c
	.xword	0xc60d251f9e4ba014
	.xword	0x45aeec29e3eaf228
	.xword	0x8f1356ad58387626
	.xword	0x203e4890ab467989
	.xword	0x1cc4fe8c9ae38f7e
	.xword	0x0bbfbd84f7caba6d
	.xword	0x2662516d587b3a8d
	.xword	0x04150441fb367dee
	.xword	0xf5aa43ae02e438d8
	.xword	0x398bd7609e4f2c2e
	.xword	0x099d0af9de0731f1
	.xword	0xe06ef5f016c1348e
	.xword	0x8132c3940e466db6
	.xword	0xd2c31c2aa0f91c17
	.xword	0x814ae49d5b95d70a
	.xword	0xc1a76623ca57913d
	.xword	0x47ce1800316e4c45
	.xword	0x1982aed3719c5526
	.xword	0x254b51d01dea1cf8
	.xword	0x09681db1a93d8ef8
	.xword	0x3343f5adbd98900d
	.xword	0x37f5222d062273e8
	.xword	0xac1e940f893fb002
	.xword	0x265f066d3f55f300
	.xword	0x361747c5dc9e4b6b
	.xword	0xbad7e20b906b6bed
	.xword	0x4908a8cb2701212e
	.xword	0x4a45384e12cce530
	.xword	0x6a5678cd8b65ee78
	.xword	0x97cc4d9471c7c66f
	.xword	0xd77c7d9aa70477fc
	.xword	0x656ce32df5ed24a8
	.xword	0xaf5cb130c3eed934
	.xword	0x8f06e1d49e4c9ed8
	.xword	0x8b91aa0f519ddb79
	.xword	0x4730d2d686aee557
	.xword	0xf3c23e5f8d85d06c
	.xword	0x5d07a93e0a677640
	.xword	0x2e261cda2a7d9490
	.xword	0xe1e423c089e59b1c
	.xword	0x18e1ea1cc82f4d26
	.xword	0x42ed2ec73d4834e6
	.xword	0x8be3d37a9a7bc0ca
	.xword	0xad6bad74d914ce93
	.xword	0x9b230cb887d2a6fa
	.xword	0x0872dba944907394
	.xword	0x7d0f938f6718d37a
	.xword	0x0899477e5a5336cd
	.xword	0x935a9754fe0ee14e
	.xword	0xa2eade0f5d161430
	.xword	0x247f1ae56a2fc092
	.xword	0xc9f1fe9982caab00
	.xword	0xc65010f085102286
	.xword	0x95dd8aeede5710e0
	.xword	0x6ef7c3ab75753dde
	.xword	0xe94f3256e6a64dc6
	.xword	0x92c34cc64cbf0616
	.xword	0x35c69cdc426d174f
	.xword	0x705c24b420b00b2a
	.xword	0x10f58b78422425a9
	.xword	0x2742546552ceeeee
	.xword	0x7c25b20a179b1415
	.xword	0x9c9a4a33cff6f91d
	.xword	0x2b9a1bd57e35173f
	.xword	0x17a4fb3ad3b67d24
	.xword	0x67a63ac53b09dba1
	.xword	0x75194c08ff820e2e
	.xword	0x243895d6402bae6a
	.xword	0xccfe8e633778755e
	.xword	0x5946f73f7e1550b8
	.xword	0x50033dea6d60942e
	.xword	0x07d5e1d018561cba
	.xword	0x3d8ad38cb5b1e5a4
	.xword	0xc3d6bdd1c589c58b
	.xword	0x64af3316e726a880
	.xword	0xaa4208af4f0f8d6b
	.xword	0x53fe1995b9bf801a
	.xword	0x804fab6db17ef4b4
	.xword	0x9b525c0ef0ced2ff
	.xword	0x9ba937b27a319933
	.xword	0x04cc7bdd6b5f4e27
	.xword	0x71345ed6efb1328d
	.xword	0xdec69db591a1bfde
	.xword	0x713053812227916a
	.xword	0x9ee6ae4ac2c7134b
	.xword	0xdb12f20e0cd57dae
	.xword	0x33ed03afed07f433
	.xword	0x022c75ecaaf48a1a
	.xword	0xeb28b26d9e768841
	.xword	0x5e50e5d717ed9beb
	.xword	0x60abb287738e4678
	.xword	0xe51966ab71cb2108
	.xword	0xd995c47ee6e4e186
	.xword	0x18faadffa46b76cc
	.xword	0x4b298415f08fd0bf
	.xword	0x63b6369376101926
	.xword	0x4352fbf045577c04
	.xword	0x8eb0c1a6858e6ef6
	.xword	0x2884377594583405
	.xword	0x97529c92e6c7a838
	.xword	0xc028dbcd4482c26d
	.xword	0x4c52f4e8b6c68300
	.xword	0xa1db21dbfeb315c9
	.xword	0x852d08185b528d13
	.xword	0x78efa469e5a0b532
	.xword	0x006bb069d721efdc
	.xword	0xc93b4080e08741a0
	.xword	0xa9c359653c1350ed
	.xword	0x739c2ef5248f9f4f
	.xword	0xfb0acc88f04c1aec
	.xword	0xfe4198c0e27b03dc
	.xword	0xf0ff0bca9b898dd8
	.xword	0x176ad0071b52d890
	.xword	0xf9309ca068d43b10
	.xword	0xfda7c0330702224d
	.xword	0x731f7ba6d5786e92
	.xword	0xf9695f78e2fa8b5e
	.xword	0x5e22e5978dc5b8df
	.xword	0x28d888f3d5a2633a
	.xword	0x49194a45b1e36e43
	.xword	0x9727650e89cce9ec
	.xword	0x3025f2503cfdccc8
	.xword	0xf4b11e6a0df07f9c
	.xword	0x36f798fb766684b0
	.xword	0xf1997470cd6a8176
	.xword	0x0f37cd1b53201e85
	.xword	0x8f8a1984f8c1d4d7
	.xword	0x18dbef2be5079bda
	.xword	0x3a669d26dedb1fe7
	.xword	0xf67c9f689469c273
	.xword	0x938b0cd9df99da09
	.xword	0x86dffcd01ecec23d
	.xword	0x4d68c735cb532517
	.xword	0xfb1a500eb5ce7d5a
	.xword	0xf091f7e8bc0626e3
	.xword	0x9671b98384685abe
	.xword	0xb1806cb889e1ce76
	.xword	0xaa4be1731ad75db6
	.xword	0x9ddbec655ae30669
	.xword	0xcc7d632eebb11bb8
	.xword	0x66b24c3c3f91b576
	.xword	0xdbb72942a7d63ca9
	.xword	0xa30c64288197c880
	.xword	0xa6f98f93e42e94ca
	.xword	0x8d28f7d187e6b6f5
	.xword	0x250f54e464f65332
	.xword	0xede3f1db89591543
	.xword	0x9c0fe99fc10b0a3a
	.xword	0x9658cb65293a498e
	.xword	0xf5a8bc73bc473b35
	.xword	0x7d41bfda27b5c538
	.xword	0xb926a1ea124cfc3d
	.xword	0x911934ea3f08a0cd
	.xword	0x72b09b16f3e1f776
	.xword	0x2756df6f0ffd7f4d
	.xword	0x0257b0c6a26b8c6d
	.xword	0xaecb73f8506316c2
	.xword	0x0fdb750f8ba7724a
	.xword	0x697859bcf49e7165
	.xword	0x05e0d6bcf2fb01c8
	.xword	0x6fdd4a54c2cbf1d8
	.xword	0x97ae70cb026ac215
	.xword	0xebc88dfcd5974e71
	.xword	0xa536624b3c13e1f7
	.xword	0xeb187716b3e112fc
	.xword	0xf27fc00220f0eb40
	.xword	0x3d83a4744c7b3e5f
	.xword	0x5a5a6c67779117a2
	.xword	0x93489dc2796cbf28
	.xword	0xd3c0f153908c051b
	.xword	0x46af65724b7392c2
	.align 0x80000
	.data
data_start_7:

	.xword	0x257046ce879ddcfb
	.xword	0x8671b9e7e5e58767
	.xword	0xfadd88e1b46a1806
	.xword	0x980c0245f9a24217
	.xword	0x2a3ed4c561b1c17d
	.xword	0x3b3a8c9898b440ee
	.xword	0x2bf4ca97d621cf9c
	.xword	0xc97f27d07ccabff4
	.xword	0xe25924d3696d18d5
	.xword	0xd7a5dfdcf90c0cba
	.xword	0xd785121d5c819f65
	.xword	0x2f12e46e0c393a70
	.xword	0xc52bf08ab836efe6
	.xword	0x114714214bbcc886
	.xword	0x57cbd46d9e4555a2
	.xword	0xe21f4d7815782f0c
	.xword	0x199f15757c2896dd
	.xword	0x17e87399f33f3895
	.xword	0x47b345734aded46e
	.xword	0xead0eaf2286c35eb
	.xword	0xf6a744c8854b07b4
	.xword	0x1fd42f1db1f92b21
	.xword	0x3009e32b079d562b
	.xword	0xa7ee68c07277e9ce
	.xword	0xb3f96015d710cf2c
	.xword	0x575ae9e9accc9a8e
	.xword	0xb097d3b92eece89b
	.xword	0x2a47363c96756932
	.xword	0xbfc2745c51d23514
	.xword	0xb4a7d1e8a581e28d
	.xword	0x9f2806c51cf52a7b
	.xword	0x171a647e02f993e6
	.xword	0xa9fb15fb8bbe9a8f
	.xword	0x01f19b8e47e042d4
	.xword	0xf0656be22ddefbcc
	.xword	0x6739ac30fc272192
	.xword	0x76dce8d62629d726
	.xword	0x9018a2f92fd511e5
	.xword	0x9b2fecdae5c9621d
	.xword	0xd4c4a3b42f56092e
	.xword	0xbfda3744b005b925
	.xword	0x22d4cce6a783c958
	.xword	0x20469e43e3fa6396
	.xword	0x27d9d344c13b3568
	.xword	0xa4dc743b30e71a9f
	.xword	0xae1eea20cde02497
	.xword	0x77ed295e624e4cbc
	.xword	0xc162fb2811072e69
	.xword	0xf1a052279ce2052b
	.xword	0xf59b06c9222da569
	.xword	0x2f6e762b09a7a421
	.xword	0xb1115c998c1b7860
	.xword	0xf36e4bf3d1d3fd90
	.xword	0x0d559a0ad79d8fcb
	.xword	0xb5b30e8dc4b03709
	.xword	0x2f1ab771a0bd81c7
	.xword	0x67cdb3e04285423f
	.xword	0xf81726bed871910a
	.xword	0x776f113ad994d993
	.xword	0x62161212b1a0548b
	.xword	0xd5900fbbec24edc8
	.xword	0x24a7933632d9aedf
	.xword	0x5b9c32c684cb26ac
	.xword	0x35c80284c6d8cd3f
	.xword	0x101a7adabbe83d95
	.xword	0xbcfeb46157bad6b6
	.xword	0xc581a301f1011f2e
	.xword	0xcd80beedf359de95
	.xword	0x67818b22b2c73e62
	.xword	0x8ce7b1adc7fe8f77
	.xword	0xa84f63573b2fcd91
	.xword	0xf88bd178633a8bb1
	.xword	0x4aac99b94e193cc9
	.xword	0x9a5a0b45638d46bc
	.xword	0x439bb73ba4994ccc
	.xword	0x2b45bd39df2a0131
	.xword	0xbc3b54384db916eb
	.xword	0x669697340a109284
	.xword	0xeb5e6827e5d28da0
	.xword	0x9bfac11b652fb83f
	.xword	0xa35e9c8eafe71d59
	.xword	0x6e0450a5fff664ae
	.xword	0x8c62c692334888e4
	.xword	0xbfee9208425fbea5
	.xword	0x0acf3fc998376245
	.xword	0x1fa89d89ff6e8711
	.xword	0xc976d1b1b804b5d3
	.xword	0xf748d5a44a36ef47
	.xword	0xb91cd42a4536ba92
	.xword	0x8086b41f20ae6686
	.xword	0x452a17532469c092
	.xword	0x66cb20125e989ef0
	.xword	0xcc873ce8c83eaa39
	.xword	0x7bc67a1816db4aea
	.xword	0x70ede089b3e3f69c
	.xword	0x8182e87422cbd6c1
	.xword	0xeea49204cfb5ee84
	.xword	0x92f647e81fff58ce
	.xword	0xa6ab1dc771dc4437
	.xword	0x4c311f670372dd09
	.xword	0xf17b0e2df430b646
	.xword	0xafc91d1885531580
	.xword	0x3abaddccbf085d70
	.xword	0xdb7d004fef67707f
	.xword	0xa787ff10b3e04685
	.xword	0xca21bad8ed90ed96
	.xword	0x2a24de917e3dc46c
	.xword	0xfdb3b43524af44c8
	.xword	0xe69191519f21c447
	.xword	0x5c57961e40b7fa47
	.xword	0x2b8430a08a1eab12
	.xword	0xbff1e84d5b82fe91
	.xword	0x333c0b0f4fdd86be
	.xword	0x16e885b45cfbeb9a
	.xword	0xbfb5c98fc7d7cbe4
	.xword	0xe02833c4973064d9
	.xword	0x986a231c9e21a204
	.xword	0x88a479171de59219
	.xword	0x443d27617b3df0df
	.xword	0xc2db2f8b94dad3a5
	.xword	0x46ffaaf35be60ee2
	.xword	0x8ca01e5b665b91da
	.xword	0x0238ee6b5d1d57c1
	.xword	0xf2d1eba09e51327d
	.xword	0x996ca3228134e2a4
	.xword	0xa6ec1f1311cffbcd
	.xword	0xdf6595c548c093a4
	.xword	0x100d1e9df633283a
	.xword	0x1f3f3c8ca1597ef3
	.xword	0xa05d6a6230c126e0
	.xword	0xc62d5b8d7178fd5c
	.xword	0x043a5124d38154ff
	.xword	0xdcd2416547e67428
	.xword	0x0fe2c8ede65a6415
	.xword	0xcb3a62f459259502
	.xword	0xf4b3c0c25f482d23
	.xword	0xf086d68742f1354a
	.xword	0xd8da258c844b8b02
	.xword	0x6fd9e823e2b7ae92
	.xword	0x348e755255e7fca2
	.xword	0xc15019f56335759e
	.xword	0xff8181a5409239d0
	.xword	0x404df2c64b65a8bd
	.xword	0x87cf6f75aa352ccb
	.xword	0xeb785da9a445fa9d
	.xword	0xbb368b068ee610df
	.xword	0x1229138161d31997
	.xword	0xf4d231bd7311a45f
	.xword	0x57a018685f391cb0
	.xword	0x190f5fcdd2567897
	.xword	0x88521aefa1d8aebe
	.xword	0xf4a5f8b64c455222
	.xword	0x420ec37a44b72df0
	.xword	0x9a5e5cf00b26adab
	.xword	0x95b9adc3b22cb876
	.xword	0x22f9fe2a72f9dc88
	.xword	0x09d9adee349e053a
	.xword	0xc4e06ebfc588a08f
	.xword	0xa744728a935e23ee
	.xword	0x83125179c6345d19
	.xword	0x8d80ed830f83ead7
	.xword	0xe925906c70e61da7
	.xword	0xa654e1eccac7c951
	.xword	0x23883e8eb7c93ad8
	.xword	0xdc318a195db509a3
	.xword	0xbda9d2f369e0b12f
	.xword	0x972c5e86b4837964
	.xword	0x45dc5facbd125589
	.xword	0x06e4dd3926f530c5
	.xword	0x6220dc15a9e665f0
	.xword	0x7f1ed9d4512d4a86
	.xword	0xac0b6e2e4d096e53
	.xword	0x4f3b8bc26ec09886
	.xword	0x6bb9dbbe6187901a
	.xword	0xdc85661133ef67ad
	.xword	0xb79559436262c171
	.xword	0x9926f4605a027c02
	.xword	0xb6a2708a60d5690f
	.xword	0x91c411015a0a712b
	.xword	0x0622be1adf044d7a
	.xword	0x21198ad5f2b623f3
	.xword	0x107507a4f88fac66
	.xword	0xae0481d98054cd1e
	.xword	0x5f5109c0128d625d
	.xword	0x433fc1fc5077ddf3
	.xword	0x988012d2f0164f90
	.xword	0x96c007e40bb28643
	.xword	0x6020f80c1c881f6a
	.xword	0x62baea01bd6e1efd
	.xword	0x8cd1cf861cff6884
	.xword	0x6a1f3e399661c059
	.xword	0x080c8c73827248e3
	.xword	0xe60d91a88f22d7c8
	.xword	0xfc80ea556079a7d7
	.xword	0x02c0a08643ec0fba
	.xword	0x1c2a0d46f8860f77
	.xword	0x34790e6b3507b197
	.xword	0xe21419e00af0dcec
	.xword	0xd52ca270a2c44b64
	.xword	0x8cff18d9c4167171
	.xword	0x47f251eb42091502
	.xword	0x767b6000e26ccd12
	.xword	0x708c1193da7bd0ca
	.xword	0xe7c4e6c744a3ea93
	.xword	0x4487844b2291c31c
	.xword	0xfbab25199a3be965
	.xword	0xbcb5542ccdefe50d
	.xword	0x4a176ef88e27ef4d
	.xword	0x18c7559e7582a8be
	.xword	0xc648fc8d3e0b8906
	.xword	0xafe2df2fe9e6444a
	.xword	0x42a7d3f74cbfde7e
	.xword	0x64749239a77c7405
	.xword	0xc3c12e043b6cf3a6
	.xword	0x7243fd07e7247ea1
	.xword	0xe6f23399a13ab0da
	.xword	0xb4747af0e791456f
	.xword	0xbfcfe1b696244984
	.xword	0x62cf421d2e8151d3
	.xword	0x4d4c9a9a1fb805cf
	.xword	0xc9dfc2650c0718ab
	.xword	0x1a695d55e07ec686
	.xword	0x0d9c791ad535e17a
	.xword	0x182dc3d21224d959
	.xword	0x5911d49855badae8
	.xword	0x93ce6b6d52f304e3
	.xword	0xc785141ef65c464e
	.xword	0x72eea9cf5f7ee15c
	.xword	0x3a223c7ac5a30576
	.xword	0x817b5cf806bb3e0f
	.xword	0x1a9632e917e69630
	.xword	0x71258aeda545ca1a
	.xword	0x47b2b4354f7b887c
	.xword	0x98f7e48c9863b246
	.xword	0x6de44d5746e405d6
	.xword	0xdf9f819cd2322c3b
	.xword	0x0ad819e74748d56d
	.xword	0x8778073f0e849eb4
	.xword	0x21f24573b46b7f09
	.xword	0x8319a574fde87838
	.xword	0xc84ecfc5077e1eb9
	.xword	0xd8bdbbd51ec198fa
	.xword	0xd5c8dd7b0b3f62b3
	.xword	0xca27cdd9d02aff90
	.xword	0xae8d196f3262b725
	.xword	0xf6ceae7b81a6b5db
	.xword	0x9b6cc1a0b8431710
	.xword	0xfca90f2fd7e1830e
	.xword	0x3ec4d96743ab5027
	.xword	0x1f2425e6fbf065fb
	.xword	0x971662ed56d6b51f
	.xword	0x7db2036b71f8982d
	.xword	0xb8f1f15a0d77b33f
	.xword	0xdbf46422d01c09d5
	.xword	0x85e0f538a06e0e09
	.xword	0xa7dd40c62eb35118



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
